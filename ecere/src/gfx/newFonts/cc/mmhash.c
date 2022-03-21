/* *****************************************************************************
 * Copyright (c) 2007-2015 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

#include "cpuconfig.h"
#include "cc.h"
#include "mm.h"
#include "mmhash.h"


////


#include "mmhashinternal.h"


////



static void mmHashSetBounds( mmHashTable *table )
{
  table->lowcount = 0;
  if( table->hashbits > table->minhashbits )
    table->lowcount = table->hashsize / 5;
  table->highcount = table->hashsize / 2;
  return;
}


size_t mmHashRequiredSize( size_t entrysize, uint32_t hashbits, uint32_t pageshift )
{
  uint32_t entrycount;
  uint32_t pagecount;
  entrycount = 1 << hashbits;
  pagecount = entrycount >> pageshift;
  if( !( pagecount ) )
    pagecount = 1;
  return MM_HASH_ALIGN64( MM_HASH_SIZEOF_ALIGN16(mmHashTable) + ( entrycount * entrysize ) ) + ( pagecount * sizeof(mmHashPage) );
}


void mmHashInit( void *hashtable, const mmHashAccess *access, size_t entrysize, uint32_t hashbits, uint32_t pageshift, uint32_t flags )
{
  uint32_t hashkey, pageindex;
  void *entry;
  mmHashTable *table;
  mmHashPage *page;
  void (*clearentry)( void *entry ) = access->clearentry;
  void (*clearentries)( void *entry, unsigned int ) = access->clearentries;

  table = hashtable;
  table->status = MM_HASH_STATUS_NORMAL;
  if( flags & MM_HASH_FLAGS_NO_COUNT )
    table->status = MM_HASH_STATUS_UNKNOWN;
  table->flags = flags;
  table->entrysize = entrysize;
  table->minhashbits = hashbits;
  table->hashbits = hashbits;
  table->hashsize = 1 << table->hashbits;
  table->hashmask = table->hashsize - 1;
  table->pageshift = pageshift;
  table->pagecount = table->hashsize >> pageshift;
  if( !( table->pagecount ) )
    table->pagecount = 1;
  table->pagemask = table->pagecount - 1;
  table->page = MM_HASH_PAGELIST( table );
#ifdef MM_ATOMIC_SUPPORT
  mmAtomicWrite32( &table->entrycount, 0 );
#else
  mtMutexInit( &table->countmutex );
  table->entrycount = 0;
#endif
  mmHashSetBounds( table );

  /* Clear the table */
  entry = MM_HASH_ENTRYLIST( table );
  if(clearentries)
     clearentries(entry, table->hashsize);
  else if(clearentry)
  {
     for( hashkey = 0 ; hashkey < table->hashsize ; hashkey++ )
     {
       clearentry( entry );
       entry = ADDRESS( entry, entrysize );
     }
  }
  else
    memset(entry, 0, entrysize * table->hashsize);

  /* Clear the lock pages */
  page = table->page;
#ifdef MM_ATOMIC_SUPPORT
  for( pageindex = table->pagecount ; pageindex ; pageindex--, page++ )
  {
    mmAtomicLockInit32( &page->lock );
    mmAtomicWriteP( &page->owner, 0 );
  }
  mmAtomicWrite32( &table->globallock, 0x0 );
#else
  for( pageindex = table->pagecount ; pageindex ; pageindex--, page++ )
  {
    mtMutexInit( &page->mutex );
    page->owner = 0;
  }
  mtMutexInit( &table->globalmutex );
#endif

#ifdef MM_HASH_DEBUG_STATISTICS
  table->entrycountmax = 0;
  mmAtomicWriteL( &table->statentrycount, 0 );
  mmAtomicWriteL( &table->accesscount, 0 );
  mmAtomicWriteL( &table->collisioncount, 0 );
  mmAtomicWriteL( &table->relocationcount, 0 );
#endif

  return;
}


int mmHashGetStatus( void *hashtable, int *rethashbits )
{
  mmHashTable *table;
  table = hashtable;
  if( rethashbits )
    *rethashbits = table->hashbits;
  return table->status;
}


void mmHashReset( void *hashtable, const mmHashAccess *access )
{
  int hashkey;
  mmHashTable *table;
  void *entry;
  void (*clearentry)( void *entry ) = access->clearentry;
  void (*clearentries)( void *entry, unsigned int ) = access->clearentries;

  /* Clear the table */
  table = hashtable;
  entry = MM_HASH_ENTRYLIST( table );
  if(clearentries)
     clearentries(entry, table->hashsize);
  else if(clearentry)
  {
     for( hashkey = 0 ; hashkey < table->hashsize ; hashkey++ )
     {
       clearentry( entry );
       entry = ADDRESS( entry, table->entrysize );
     }
  }
  else
    memset(entry, 0, table->hashsize * table->entrysize);
#ifdef MM_ATOMIC_SUPPORT
  mmAtomicWrite32( &table->entrycount, 0 );
#else
  table->entrycount = 0;
#endif
  return;
}


////



void *mmHashDirectFindEntry( void *hashtable, const mmHashAccess *access, const void *findentry )
{
  int cmpvalue;
  uint32_t hashkey;
  void *entry;
  mmHashTable *table;

  table = hashtable;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( findentry ) & table->hashmask;

  /* Search the entry */
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( entry, findentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
      return entry;
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  return 0;
}


static int mmHashTryFindEntry( mmHashTable *table, const mmHashAccess *access, void *findentry, void **retentry )
{
  uint32_t hashkey;
  uint32_t pageindex, pagestart, pagefinal;
  int cmpvalue, retvalue;
  void *entry;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( findentry ) & table->hashmask;

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
  if( !( MM_HASH_LOCK_TRY_READ( table, pagestart ) ) )
    return MM_HASH_TRYAGAIN;

  /* Search the entry */
  entry = 0;
  retvalue = MM_HASH_SUCCESS;
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    /* Lock new pages */
    pageindex = hashkey >> table->pageshift;
    if( pageindex != pagefinal )
    {
      if( !( MM_HASH_LOCK_TRY_READ( table, pageindex ) ) )
      {
        retvalue = MM_HASH_TRYAGAIN;
        break;
      }
      pagefinal = pageindex;
    }

    /* Check for entry match */
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( entry, findentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
    {
      retvalue = MM_HASH_FAILURE;
      entry = 0;
      break;
    }
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
      break;
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  /* Unlock all pages */
  for( pageindex = pagestart ; ; pageindex = ( pageindex + 1 ) & table->pagemask )
  {
    MM_HASH_LOCK_DONE_READ( table, pageindex );
    if( pageindex == pagefinal )
      break;
  }

  *retentry = entry;
  return retvalue;
}


void *mmHashLockFindEntry( void *hashtable, const mmHashAccess *access, void *findentry )
{
  int retvalue;
  void *entry;
  mmHashTable *table;

  table = hashtable;
  retvalue = mmHashTryFindEntry( table, access, findentry, &entry );
  if( retvalue == MM_HASH_TRYAGAIN )
  {
    MM_HASH_GLOBAL_LOCK( table );
    do
    {
      retvalue = mmHashTryFindEntry( table, access, findentry, &entry );
    } while( retvalue == MM_HASH_TRYAGAIN );
    MM_HASH_GLOBAL_UNLOCK( table );
  }

  return entry;
}



////



void mmHashDirectListEntry( void *hashtable, const mmHashAccess *access, void *listentry, void *opaque )
{
  int cmpvalue;
  uint32_t hashkey;
  void *entry;
  mmHashTable *table;

  table = hashtable;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( listentry ) & table->hashmask;

  /* Search the entry */
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrylist( opaque, entry, listentry );
    if( cmpvalue == MM_HASH_ENTRYLIST_BREAK )
      break;
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  return;
}

// WARNING: This is ordered by hash, not key values...
void * mmHashGetNext( void *hashtable, void * entry, const mmHashAccess *access)
{
  mmHashTable * table = hashtable;
  uint32_t hashkey = entry ? MM_HASH_HASHKEY(table, entry) : 0;
  if(hashkey == table->hashmask) return NULL;
  if(entry) hashkey++;
  for( ; ; hashkey = ( hashkey + 1 ))
  {
     entry = MM_HASH_ENTRY( table, hashkey );
     if(access->entryvalid( entry ))
        return entry;
     if(hashkey == table->hashmask) break;
  }
  return NULL;
}

void * mmHashGetPrev( void *hashtable, void * entry, const mmHashAccess *access)
{
  mmHashTable * table = hashtable;
  uint32_t hashkey = entry ? MM_HASH_HASHKEY(table, entry) : table->hashmask;
  if(!hashkey) return NULL;
  if(entry) hashkey--;
  for( ; ; hashkey = ( hashkey - 1 ))
  {
     entry = MM_HASH_ENTRY( table, hashkey );
     if(access->entryvalid( entry ))
        return entry;
     if(!hashkey) break;
  }
  return NULL;
}

static int mmHashTryListEntry( mmHashTable *table, const mmHashAccess *access, void *listentry, void *opaque )
{
  uint32_t hashkey;
  uint32_t pageindex, pagestart, pagefinal;
  int cmpvalue, retvalue;
  void *entry;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( listentry ) & table->hashmask;

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
  if( !( MM_HASH_LOCK_TRY_READ( table, pagestart ) ) )
    return MM_HASH_TRYAGAIN;

  /* Search the entry */
  entry = 0;
  retvalue = MM_HASH_SUCCESS;
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    /* Lock new pages */
    pageindex = hashkey >> table->pageshift;
    if( pageindex != pagefinal )
    {
      if( !( MM_HASH_LOCK_TRY_READ( table, pageindex ) ) )
      {
        retvalue = MM_HASH_TRYAGAIN;
        break;
      }
      pagefinal = pageindex;
    }

    /* Check for entry match */
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrylist( opaque, entry, listentry );
    if( cmpvalue == MM_HASH_ENTRYLIST_BREAK )
      break;
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  /* Unlock all pages */
  for( pageindex = pagestart ; ; pageindex = ( pageindex + 1 ) & table->pagemask )
  {
    MM_HASH_LOCK_DONE_READ( table, pageindex );
    if( pageindex == pagefinal )
      break;
  }

  return retvalue;
}


void mmHashLockListEntry( void *hashtable, const mmHashAccess *access, void *listentry, void *opaque )
{
  int retvalue;
  mmHashTable *table;

  table = hashtable;
  retvalue = mmHashTryListEntry( table, access, listentry, opaque );
  if( retvalue == MM_HASH_TRYAGAIN )
  {
    MM_HASH_GLOBAL_LOCK( table );
    do
    {
      retvalue = mmHashTryListEntry( table, access, listentry, opaque );
    } while( retvalue == MM_HASH_TRYAGAIN );
    MM_HASH_GLOBAL_UNLOCK( table );
  }

  return;
}



////



int mmHashDirectReadEntry( void *hashtable, const mmHashAccess *access, void *readentry )
{
  int cmpvalue;
  uint32_t hashkey;
  void *entry;
  mmHashTable *table;

  table = hashtable;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( readentry ) & table->hashmask;

  /* Search the entry */
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( entry, readentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
      memcpy( readentry, entry, table->entrysize );
      return MM_HASH_SUCCESS;
    }
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  return MM_HASH_FAILURE;
}


static int mmHashTryReadEntry( mmHashTable *table, const mmHashAccess *access, void *readentry )
{
  uint32_t hashkey;
  uint32_t pageindex, pagestart, pagefinal;
  int cmpvalue, retvalue;
  void *entry;

  /* Hash key of entry */
  hashkey = access->entrykey( readentry ) & table->hashmask;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
  if( !( MM_HASH_LOCK_TRY_READ( table, pagestart ) ) )
    return MM_HASH_TRYAGAIN;

  /* Search the entry */
  entry = 0;
  retvalue = MM_HASH_SUCCESS;
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    /* Lock new pages */
    pageindex = hashkey >> table->pageshift;
    if( pageindex != pagefinal )
    {
      if( !( MM_HASH_LOCK_TRY_READ( table, pageindex ) ) )
      {
        retvalue = MM_HASH_TRYAGAIN;
        break;
      }
      pagefinal = pageindex;
    }

    /* Check for entry match */
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( entry, readentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
    {
      retvalue = MM_HASH_FAILURE;
      entry = 0;
      break;
    }
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
      break;
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  if( entry )
    memcpy( readentry, entry, table->entrysize );

  /* Unlock all pages */
  for( pageindex = pagestart ; ; pageindex = ( pageindex + 1 ) & table->pagemask )
  {
    MM_HASH_LOCK_DONE_READ( table, pageindex );
    if( pageindex == pagefinal )
      break;
  }

  return retvalue;
}


int mmHashLockReadEntry( void *hashtable, const mmHashAccess *access, void *readentry )
{
  int retvalue;
  mmHashTable *table;

  table = hashtable;
  retvalue = mmHashTryReadEntry( table, access, readentry );
  if( retvalue == MM_HASH_TRYAGAIN )
  {
    MM_HASH_GLOBAL_LOCK( table );
    do
    {
      retvalue = mmHashTryReadEntry( table, access, readentry );
    } while( retvalue == MM_HASH_TRYAGAIN );
    MM_HASH_GLOBAL_UNLOCK( table );
  }

  return retvalue;
}



////



int mmHashDirectCallEntry( void *hashtable, const mmHashAccess *access, void *callentry, void (*callback)( void *opaque, void *entry, int newflag ), void *opaque, int addflag )
{
  int cmpvalue;
  uint32_t hashkey, entrycount;
  void *entry;
  mmHashTable *table;

  table = hashtable;

  /* Hash key of entry */
  hashkey = access->entrykey( callentry ) & table->hashmask;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Search an available entry */
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( entry, callentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
      callback( opaque, entry, 0 );
      return MM_HASH_SUCCESS;
    }
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  if( !( addflag ) )
    return MM_HASH_FAILURE;

  /* Store new entry */
  memcpy( entry, callentry, table->entrysize );
  callback( opaque, entry, 1 );

  /* Increment count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, 1 );
    if( entrycount >= table->highcount )
      table->status = MM_HASH_STATUS_MUSTGROW;
  }

#ifdef MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->entrycountmax )
    table->entrycountmax = statentrycount;
#endif

  return MM_HASH_SUCCESS;
}


static int mmHashTryCallEntry( mmHashTable *table, const mmHashAccess *access, void *callentry, void (*callback)( void *opaque, void *entry, int newflag ), void *opaque, int addflag )
{
  uint32_t hashkey, entrycount;
  uint32_t pageindex, pagestart, pagefinal;
  int cmpvalue, retvalue;
  void *entry;

  /* Hash key of entry */
  hashkey = access->entrykey( callentry ) & table->hashmask;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
  if( !( MM_HASH_LOCK_TRY_WRITE( table, pagestart ) ) )
    return MM_HASH_TRYAGAIN;

  /* Search an available entry */
  retvalue = MM_HASH_SUCCESS;
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    /* Lock new pages */
    pageindex = hashkey >> table->pageshift;
    if( pageindex != pagefinal )
    {
      if( !( MM_HASH_LOCK_TRY_WRITE( table, pageindex ) ) )
      {
        retvalue = MM_HASH_TRYAGAIN;
        goto end;
      }
      pagefinal = pageindex;
    }

    /* Check for entry available */
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( entry, callentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
      callback( opaque, entry, 0 );
      retvalue = MM_HASH_SUCCESS;
      goto end;
    }
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  if( !( addflag ) )
  {
    retvalue = MM_HASH_FAILURE;
    goto end;
  }

  /* Store new entry */
  memcpy( entry, callentry, table->entrysize );
  callback( opaque, entry, 1 );

  /* Increment count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, 1 );
    if( entrycount >= table->highcount )
      table->status = MM_HASH_STATUS_MUSTGROW;
  }

#ifdef MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->entrycountmax )
    table->entrycountmax = statentrycount;
#endif

  end:

  /* Unlock all pages */
  for( pageindex = pagestart ; ; pageindex = ( pageindex + 1 ) & table->pagemask )
  {
    MM_HASH_LOCK_DONE_WRITE( table, pageindex );
    if( pageindex == pagefinal )
      break;
  }

  return retvalue;
}


int mmHashLockCallEntry( void *hashtable, const mmHashAccess *access, void *callentry, void (*callback)( void *opaque, void *entry, int newflag ), void *opaque, int addflag )
{
  int retvalue;
  mmHashTable *table;

  table = hashtable;
  retvalue = mmHashTryCallEntry( table, access, callentry, callback, opaque, addflag );
  if( retvalue == MM_HASH_TRYAGAIN )
  {
    MM_HASH_GLOBAL_LOCK( table );
    do
    {
      retvalue = mmHashTryCallEntry( table, access, callentry, callback, opaque, addflag );
    } while( retvalue == MM_HASH_TRYAGAIN );
    MM_HASH_GLOBAL_UNLOCK( table );
  }

  return retvalue;
}



////



int mmHashDirectReplaceEntry( void *hashtable, const mmHashAccess *access, void *replaceentry, int addflag )
{
  int cmpvalue;
  uint32_t hashkey, entrycount;
  void *entry;
  mmHashTable *table;

  table = hashtable;

  /* Hash key of entry */
  hashkey = access->entrykey( replaceentry ) & table->hashmask;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Search an available entry */
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( entry, replaceentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
      memcpy( entry, replaceentry, table->entrysize );
      return MM_HASH_SUCCESS;
    }
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  if( !( addflag ) )
    return MM_HASH_FAILURE;

  /* Store new entry */
  memcpy( entry, replaceentry, table->entrysize );

  /* Increment count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, 1 );
    if( entrycount >= table->highcount )
      table->status = MM_HASH_STATUS_MUSTGROW;
  }

#ifdef MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->entrycountmax )
    table->entrycountmax = statentrycount;
#endif

  return MM_HASH_SUCCESS;
}


static int mmHashTryReplaceEntry( mmHashTable *table, const mmHashAccess *access, void *replaceentry, int addflag )
{
  uint32_t hashkey, entrycount;
  uint32_t pageindex, pagestart, pagefinal;
  int cmpvalue, retvalue;
  void *entry;

  /* Hash key of entry */
  hashkey = access->entrykey( replaceentry ) & table->hashmask;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
  if( !( MM_HASH_LOCK_TRY_WRITE( table, pagestart ) ) )
    return MM_HASH_TRYAGAIN;

  /* Search an available entry */
  retvalue = MM_HASH_SUCCESS;
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    /* Lock new pages */
    pageindex = hashkey >> table->pageshift;
    if( pageindex != pagefinal )
    {
      if( !( MM_HASH_LOCK_TRY_WRITE( table, pageindex ) ) )
      {
        retvalue = MM_HASH_TRYAGAIN;
        goto end;
      }
      pagefinal = pageindex;
    }

    /* Check for entry available */
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( entry, replaceentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
      memcpy( entry, replaceentry, table->entrysize );
      retvalue = MM_HASH_SUCCESS;
      goto end;
    }
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  if( !( addflag ) )
  {
    retvalue = MM_HASH_FAILURE;
    goto end;
  }

  /* Store new entry */
  memcpy( entry, replaceentry, table->entrysize );

  /* Increment count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, 1 );
    if( entrycount >= table->highcount )
      table->status = MM_HASH_STATUS_MUSTGROW;
  }

#ifdef MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->entrycountmax )
    table->entrycountmax = statentrycount;
#endif

  end:

  /* Unlock all pages */
  for( pageindex = pagestart ; ; pageindex = ( pageindex + 1 ) & table->pagemask )
  {
    MM_HASH_LOCK_DONE_WRITE( table, pageindex );
    if( pageindex == pagefinal )
      break;
  }

  return retvalue;
}


int mmHashLockReplaceEntry( void *hashtable, const mmHashAccess *access, void *replaceentry, int addflag )
{
  int retvalue;
  mmHashTable *table;

  table = hashtable;
  retvalue = mmHashTryReplaceEntry( table, access, replaceentry, addflag );
  if( retvalue == MM_HASH_TRYAGAIN )
  {
    MM_HASH_GLOBAL_LOCK( table );
    do
    {
      retvalue = mmHashTryReplaceEntry( table, access, replaceentry, addflag );
    } while( retvalue == MM_HASH_TRYAGAIN );
    MM_HASH_GLOBAL_UNLOCK( table );
  }

  return retvalue;
}



////



int mmHashDirectAddEntry( void *hashtable, const mmHashAccess *access, void *addentry, int nodupflag )
{
  int cmpvalue;
  uint32_t hashkey, entrycount;
  void *entry;
  mmHashTable *table;

  table = hashtable;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( addentry ) & table->hashmask;

  /* Search an available entry */
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    /* Do we allow duplicate entries? */
    if( nodupflag )
    {
      cmpvalue = access->entrycmp( entry, addentry );
      if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
        break;
      else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
        return MM_HASH_FAILURE;
    }
    else
    {
      if( !( access->entryvalid( entry ) ) )
        break;
    }
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  /* Store new entry */
  memcpy( entry, addentry, table->entrysize );

  /* Increment count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, 1 );
    if( entrycount >= table->highcount )
      table->status = MM_HASH_STATUS_MUSTGROW;
  }

#ifdef MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->entrycountmax )
    table->entrycountmax = statentrycount;
#endif

  return MM_HASH_SUCCESS;
}

int mmHashDirectAddEntry2( void *hashtable, const mmHashAccess *access, void *addentry, int nodupflag, void ** retEntry)
{
  int cmpvalue;
  uint32_t hashkey, entrycount;
  void *entry;
  mmHashTable *table;

  table = hashtable;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( addentry ) & table->hashmask;

  /* Search an available entry */
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    /* Do we allow duplicate entries? */
    if( nodupflag )
    {
      cmpvalue = access->entrycmp( entry, addentry );
      if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
        break;
      else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
      {
        if(retEntry) *retEntry = entry;
        return MM_HASH_FOUND;
      }
    }
    else
    {
      if( !( access->entryvalid( entry ) ) )
        break;
    }
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  /* Store new entry */
  memcpy( entry, addentry, table->entrysize );

  /* Increment count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, 1 );
    if( entrycount >= table->highcount )
      table->status = MM_HASH_STATUS_MUSTGROW;
  }

#ifdef MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->entrycountmax )
    table->entrycountmax = statentrycount;
#endif

  if(retEntry) *retEntry = entry;
  return MM_HASH_SUCCESS;
}

static int mmHashTryAddEntry( mmHashTable *table, const mmHashAccess *access, void *addentry, int nodupflag )
{
  uint32_t hashkey, entrycount;
  uint32_t pageindex, pagestart, pagefinal;
  int cmpvalue, retvalue;
  void *entry;

  /* Hash key of entry */
  hashkey = access->entrykey( addentry ) & table->hashmask;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
  if( !( MM_HASH_LOCK_TRY_WRITE( table, pagestart ) ) )
    return MM_HASH_TRYAGAIN;

  /* Search an available entry */
  retvalue = MM_HASH_SUCCESS;
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    /* Lock new pages */
    pageindex = hashkey >> table->pageshift;
    if( pageindex != pagefinal )
    {
      if( !( MM_HASH_LOCK_TRY_WRITE( table, pageindex ) ) )
      {
        retvalue = MM_HASH_TRYAGAIN;
        goto end;
      }
      pagefinal = pageindex;
    }

    /* Check for entry available */
    entry = MM_HASH_ENTRY( table, hashkey );
    /* Do we allow duplicate entries? */
    if( nodupflag )
    {
      cmpvalue = access->entrycmp( entry, addentry );
      if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
        break;
      else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
      {
        retvalue = MM_HASH_FAILURE;
        goto end;
      }
    }
    else
    {
      if( !( access->entryvalid( entry ) ) )
        break;
    }
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  /* Store new entry */
  memcpy( entry, addentry, table->entrysize );

  /* Increment count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, 1 );
    if( entrycount >= table->highcount )
      table->status = MM_HASH_STATUS_MUSTGROW;
  }

#ifdef MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->entrycountmax )
    table->entrycountmax = statentrycount;
#endif

  end:

  /* Unlock all pages */
  for( pageindex = pagestart ; ; pageindex = ( pageindex + 1 ) & table->pagemask )
  {
    MM_HASH_LOCK_DONE_WRITE( table, pageindex );
    if( pageindex == pagefinal )
      break;
  }

  return retvalue;
}



int mmHashLockAddEntry( void *hashtable, const mmHashAccess *access, void *addentry, int nodupflag )
{
  int retvalue;
  mmHashTable *table;

  table = hashtable;
  retvalue = mmHashTryAddEntry( table, access, addentry, nodupflag );
  if( retvalue == MM_HASH_TRYAGAIN )
  {
    MM_HASH_GLOBAL_LOCK( table );
    do
    {
      retvalue = mmHashTryAddEntry( table, access, addentry, nodupflag );
    } while( retvalue == MM_HASH_TRYAGAIN );
    MM_HASH_GLOBAL_UNLOCK( table );
  }

  return retvalue;
}



////



int mmHashDirectReadOrAddEntry( void *hashtable, const mmHashAccess *access, void *readaddentry, int *retreadflag )
{
  int cmpvalue;
  uint32_t hashkey, entrycount;
  void *entry;
  mmHashTable *table;

  table = hashtable;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( readaddentry ) & table->hashmask;

  /* Search an available entry */
  *retreadflag = 0;
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( entry, readaddentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
      memcpy( readaddentry, entry, table->entrysize );
      *retreadflag = 1;
      return MM_HASH_SUCCESS;
    }
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  /* Store new entry */
  memcpy( entry, readaddentry, table->entrysize );

  /* Increment count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, 1 );
    if( entrycount >= table->highcount )
      table->status = MM_HASH_STATUS_MUSTGROW;
  }

#ifdef MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->entrycountmax )
    table->entrycountmax = statentrycount;
#endif

  return MM_HASH_SUCCESS;
}


static int mmHashTryReadOrAddEntry( mmHashTable *table, const mmHashAccess *access, void *readaddentry, int *retreadflag )
{
  uint32_t hashkey, entrycount;
  uint32_t pageindex, pagestart, pagefinal;
  int cmpvalue, retvalue;
  void *entry;

  /* Hash key of entry */
  hashkey = access->entrykey( readaddentry ) & table->hashmask;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
  if( !( MM_HASH_LOCK_TRY_WRITE( table, pagestart ) ) )
    return MM_HASH_TRYAGAIN;

  /* Search an available entry */
  retvalue = MM_HASH_SUCCESS;
  *retreadflag = 0;
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    /* Lock new pages */
    pageindex = hashkey >> table->pageshift;
    if( pageindex != pagefinal )
    {
      if( !( MM_HASH_LOCK_TRY_WRITE( table, pageindex ) ) )
      {
        retvalue = MM_HASH_TRYAGAIN;
        goto end;
      }
      pagefinal = pageindex;
    }

    /* Check for entry available */
    entry = MM_HASH_ENTRY( table, hashkey );

    cmpvalue = access->entrycmp( entry, readaddentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
      memcpy( readaddentry, entry, table->entrysize );
      *retreadflag = 1;
      goto end;
    }


#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  /* Store new entry */
  memcpy( entry, readaddentry, table->entrysize );

  /* Increment count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, 1 );
    if( entrycount >= table->highcount )
      table->status = MM_HASH_STATUS_MUSTGROW;
  }

#ifdef MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->entrycountmax )
    table->entrycountmax = statentrycount;
#endif

  end:

  /* Unlock all pages */
  for( pageindex = pagestart ; ; pageindex = ( pageindex + 1 ) & table->pagemask )
  {
    MM_HASH_LOCK_DONE_WRITE( table, pageindex );
    if( pageindex == pagefinal )
      break;
  }

  return retvalue;
}



int mmHashLockReadOrAddEntry( void *hashtable, const mmHashAccess *access, void *readaddentry, int *retreadflag )
{
  int retvalue;
  mmHashTable *table;

  table = hashtable;
  retvalue = mmHashTryReadOrAddEntry( table, access, readaddentry, retreadflag );
  if( retvalue == MM_HASH_TRYAGAIN )
  {
    MM_HASH_GLOBAL_LOCK( table );
    do
    {
      retvalue = mmHashTryReadOrAddEntry( table, access, readaddentry, retreadflag );
    } while( retvalue == MM_HASH_TRYAGAIN );
    MM_HASH_GLOBAL_UNLOCK( table );
  }

  return retvalue;
}



////



#define MM_ROBUST_DELETION


int mmHashDirectDeleteEntry( void *hashtable, const mmHashAccess *access, void *deleteentry, int readflag )
{
  int cmpvalue;
  uint32_t hashkey, srckey, srcpos, targetpos, targetkey, entrycount;
#ifdef MM_ROBUST_DELETION
  uint32_t delbase;
#else
  int32_t halftablesize, distance;
#endif
  void *entry, *srcentry, *targetentry;
  mmHashTable *table = hashtable;
  size_t entrysize = table->entrysize;
  void (*clearentry)( void *entry ) = access->clearentry;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( deleteentry ) & table->hashmask;

  /* Search the entry */
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( entry, deleteentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      return MM_HASH_FAILURE;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
      break;
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  if( readflag )
    memcpy( deleteentry, entry, table->entrysize );

#ifdef MM_ROBUST_DELETION
  for( delbase = hashkey ; ; )
  {
    delbase = ( delbase - 1 ) & table->hashmask;
    if( !( access->entryvalid( MM_HASH_ENTRY( table, delbase ) ) ) )
      break;
  }
  delbase = ( delbase + 1 ) & table->hashmask;
#else
  halftablesize = table->hashsize >> 1;
#endif

  /* Entry found, delete it */
  for( ; ; )
  {
    /* Find replacement target */
    targetkey = hashkey;
    targetentry = 0;
    for( srcpos = hashkey ; ; )
    {
      srcpos = ( srcpos + 1 ) & table->hashmask;

      /* Try next entry */
      srcentry = MM_HASH_ENTRY( table, srcpos );
      if( !( access->entryvalid( srcentry ) ) )
        break;
      srckey = access->entrykey( srcentry ) & table->hashmask;

#ifdef MM_ROBUST_DELETION
      if( targetkey >= delbase )
      {
        if( ( srckey < delbase ) || ( srckey > targetkey ) )
          continue;
      }
      else if( ( srckey > targetkey ) && ( srckey < delbase ) )
        continue;
      targetentry = srcentry;
      targetkey = srckey;
      targetpos = srcpos;
#else
      /* Check if moving the entry backwards is allowed without breaking chain */
      distance = (int32_t)targetkey - (int32_t)srckey;
      if( distance > halftablesize )
        distance -= table->hashsize;
      else if( distance < -halftablesize )
        distance += table->hashsize;
      if( distance >= 0 )
      {
        targetentry = srcentry;
        targetkey = srckey;
        targetpos = srcpos;
      }
#endif
    }

    /* No replacement found, just clear it */
    entry = MM_HASH_ENTRY( table, hashkey );
    if( !( targetentry ) )
    {
      if(clearentry)
         clearentry( entry );
      else
         memset(entry, 0, entrysize);
      break;
    }

    /* Move entry in place and continue the repair process */
    memcpy( entry, targetentry, table->entrysize );

#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->relocationcount, 1 );
#endif

    hashkey = targetpos;
  }

  /* Decrement count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, -1 );
    if( entrycount < table->lowcount )
      table->status = MM_HASH_STATUS_MUSTSHRINK;
  }

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->statentrycount, -1 );
#endif

  return MM_HASH_SUCCESS;
}

// WARNING: hen setting dontMoveStuff, a resize must be done after to re-pack!
int mmHashDirectDeleteEntry2( void *hashtable, const mmHashAccess *access, void *entry, int dontMoveStuff)
{
  uint32_t hashkey, srckey, srcpos, targetpos, targetkey, entrycount;
#ifdef MM_ROBUST_DELETION
  uint32_t delbase;
#else
  int32_t halftablesize, distance;
#endif
  void *srcentry, *targetentry;
  mmHashTable *table = hashtable;
  size_t entrysize = table->entrysize;
  void (*clearentry)( void *entry ) = access->clearentry;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = MM_HASH_HASHKEY(table, entry);

#ifdef MM_ROBUST_DELETION
  for( delbase = hashkey ; ; )
  {
    delbase = ( delbase - 1 ) & table->hashmask;
    if( !( access->entryvalid( MM_HASH_ENTRY( table, delbase ) ) ) )
      break;
  }
  delbase = ( delbase + 1 ) & table->hashmask;
#else
  halftablesize = table->hashsize >> 1;
#endif

  /* Entry found, delete it */
  for( ; ; )
  {
    targetentry = 0;
    if(dontMoveStuff)
       targetpos = hashkey;
    else
    {
       /* Find replacement target */
       targetkey = hashkey;
       for( srcpos = hashkey ; ; )
       {
         srcpos = ( srcpos + 1 ) & table->hashmask;

         /* Try next entry */
         srcentry = MM_HASH_ENTRY( table, srcpos );
         if( !( access->entryvalid( srcentry ) ) )
           break;
         srckey = access->entrykey( srcentry ) & table->hashmask;

   #ifdef MM_ROBUST_DELETION
         if( targetkey >= delbase )
         {
           if( ( srckey < delbase ) || ( srckey > targetkey ) )
             continue;
         }
         else if( ( srckey > targetkey ) && ( srckey < delbase ) )
           continue;
         targetentry = srcentry;
         targetkey = srckey;
         targetpos = srcpos;
   #else
         /* Check if moving the entry backwards is allowed without breaking chain */
         distance = (int32_t)targetkey - (int32_t)srckey;
         if( distance > halftablesize )
           distance -= table->hashsize;
         else if( distance < -halftablesize )
           distance += table->hashsize;
         if( distance >= 0 )
         {
           targetentry = srcentry;
           targetkey = srckey;
           targetpos = srcpos;
         }
   #endif
       }
    }

    /* No replacement found, just clear it */
    entry = MM_HASH_ENTRY( table, hashkey );
    if( !( targetentry ) )
    {
       if(clearentry)
          clearentry( entry );
       else
          memset(entry, 0, entrysize);
      break;
    }

    /* Move entry in place and continue the repair process */
    memcpy( entry, targetentry, entrysize );

#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->relocationcount, 1 );
#endif

    hashkey = targetpos;
  }

  /* Decrement count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, -1 );
    if( entrycount < table->lowcount )
      table->status = MM_HASH_STATUS_MUSTSHRINK;
  }

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->statentrycount, -1 );
#endif

  return MM_HASH_SUCCESS;
}

static int mmHashTryDeleteEntry( mmHashTable *table, const mmHashAccess *access, void *deleteentry, int readflag )
{
  uint32_t hashkey, srckey, srcpos, srcend, targetpos, targetkey, entrycount;
  uint32_t pageindex, pagestart, pagefinal;
#ifdef MM_ROBUST_DELETION
  uint32_t delbase;
#else
  int32_t halftablesize, distance;
#endif
  int cmpvalue, retvalue;
  void *entry, *srcentry, *targetentry;
  size_t entrysize = table->entrysize;
  void (*clearentry)( void *entry ) = access->clearentry;

  /* Hash key of entry */
  hashkey = access->entrykey( deleteentry ) & table->hashmask;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
  if( !( MM_HASH_LOCK_TRY_WRITE( table, pagestart ) ) )
    return MM_HASH_TRYAGAIN;

  /* Search the entry */
  retvalue = MM_HASH_SUCCESS;
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
    /* Lock new pages */
    pageindex = hashkey >> table->pageshift;
    if( pageindex != pagefinal )
    {
      if( !( MM_HASH_LOCK_TRY_WRITE( table, pageindex ) ) )
      {
        retvalue = MM_HASH_TRYAGAIN;
        goto end;
      }
      pagefinal = pageindex;
    }

    /* Check for entry match */
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( entry, deleteentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
    {
      retvalue = MM_HASH_FAILURE;
      goto end;
    }
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
      break;
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  if( readflag )
    memcpy( deleteentry, entry, table->entrysize );

#ifdef MM_ROBUST_DELETION
  for( delbase = hashkey ; ; )
  {
    delbase = ( delbase - 1 ) & table->hashmask;
    if( !( access->entryvalid( MM_HASH_ENTRY( table, delbase ) ) ) )
      break;
  }
  delbase = ( delbase + 1 ) & table->hashmask;
#else
  halftablesize = table->hashsize >> 1;
#endif

  /* Preemtively lock all pages in the stream before starting the operation */
  for( srcend = hashkey ; ; )
  {
    srcend = ( srcend + 1 ) & table->hashmask;

    /* Lock new pages */
    pageindex = srcend >> table->pageshift;
    if( pageindex != pagefinal )
    {
      if( !( MM_HASH_LOCK_TRY_WRITE( table, pageindex ) ) )
      {
        retvalue = MM_HASH_TRYAGAIN;
        goto end;
      }
      pagefinal = pageindex;
    }

    /* Check for valid entry */
    srcentry = MM_HASH_ENTRY( table, srcend );
    if( !( access->entryvalid( srcentry ) ) )
      break;
  }

  /* Entry found, delete it and reorder the hash stream of entries */
  for( ; ; )
  {
    /* Find replacement target */
    targetkey = hashkey;
    targetentry = 0;
    for( srcpos = hashkey ; ; )
    {
      srcpos = ( srcpos + 1 ) & table->hashmask;
      srcentry = MM_HASH_ENTRY( table, srcpos );

      /* Don't loop beyond the end of hash stream */
      if( srcpos == srcend )
        break;

      /* Try next entry */
      srckey = access->entrykey( srcentry ) & table->hashmask;

#ifdef MM_ROBUST_DELETION
      if( targetkey >= delbase )
      {
        if( ( srckey < delbase ) || ( srckey > targetkey ) )
          continue;
      }
      else if( ( srckey > targetkey ) && ( srckey < delbase ) )
        continue;
      targetentry = srcentry;
      targetkey = srckey;
      targetpos = srcpos;
#else
      /* Check if moving the entry backwards is allowed without breaking chain */
      distance = (int32_t)targetkey - (int32_t)srckey;
      if( distance > halftablesize )
        distance -= table->hashsize;
      else if( distance < -halftablesize )
        distance += table->hashsize;
      if( distance >= 0 )
      {
        targetentry = srcentry;
        targetkey = srckey;
        targetpos = srcpos;
      }
#endif
    }

    /* No replacement found, just clear it */
    entry = MM_HASH_ENTRY( table, hashkey );
    if( !( targetentry ) )
    {
      if(clearentry)
        clearentry( entry );
      else
        memset(entry, 0, entrysize);
      break;
    }

    /* Move entry in place and continue the repair process */
    memcpy( entry, targetentry, entrysize );

#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->relocationcount, 1 );
#endif

    hashkey = targetpos;
  }

  /* Decrement count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, -1 );
    if( entrycount < table->lowcount )
      table->status = MM_HASH_STATUS_MUSTSHRINK;
  }

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->statentrycount, -1 );
#endif

  end:

  /* Unlock all pages */
  for( pageindex = pagestart ; ; pageindex = ( pageindex + 1 ) & table->pagemask )
  {
    MM_HASH_LOCK_DONE_WRITE( table, pageindex );
    if( pageindex == pagefinal )
      break;
  }

  return retvalue;
}


int mmHashLockDeleteEntry( void *hashtable, const mmHashAccess *access, void *deleteentry, int readflag )
{
  int retvalue;
  mmHashTable *table;

  table = hashtable;
  retvalue = mmHashTryDeleteEntry( table, access, deleteentry, readflag );
  if( retvalue == MM_HASH_TRYAGAIN )
  {
    MM_HASH_GLOBAL_LOCK( table );
    do
    {
      retvalue = mmHashTryDeleteEntry( table, access, deleteentry, readflag );
    } while( retvalue == MM_HASH_TRYAGAIN );
    MM_HASH_GLOBAL_UNLOCK( table );
  }

  return retvalue;
}



////



/* Must be called while NO other thread will ever access the table for writing */
void mmHashResize( void *newtable, void *oldtable, const mmHashAccess *access, uint32_t hashbits, uint32_t pageshift )
{
  uint32_t hashkey, hashpos, dstkey, dstpos, pageindex;
  void *srcentry, *dstentry;
  mmHashTable *dst, *src;
  mmHashPage *page;
  void (*clearentry)( void *entry ) = access->clearentry;

  dst = newtable;
  src = oldtable;
  dst->status = MM_HASH_STATUS_NORMAL;
  dst->flags = src->flags;
  dst->entrysize = src->entrysize;
  dst->minhashbits = src->minhashbits;
  dst->hashbits = hashbits;
  dst->hashsize = 1 << dst->hashbits;
  dst->hashmask = dst->hashsize - 1;
  dst->pageshift = pageshift;
  dst->pagecount = dst->hashsize >> pageshift;
  dst->pagemask = dst->pagecount - 1;
  dst->page = MM_HASH_PAGELIST( dst );
#ifdef MM_ATOMIC_SUPPORT
  mmAtomicWrite32( &dst->entrycount, mmAtomicRead32( &src->entrycount ) );
#else
  dst->entrycount = src->entrycount;
#endif
  mmHashSetBounds( dst );

  /* Clear the whole destination table */
  dstentry = MM_HASH_ENTRYLIST( dst );
  if(clearentry)
  {
     for( hashpos = 0 ; hashpos < dst->hashsize ; hashpos++ )
     {
       clearentry( dstentry );
       dstentry = ADDRESS( dstentry, dst->entrysize );
     }
  }
  else
     memset(dstentry, 0, dst->hashsize * dst->entrysize);

  /* Clear the lock pages */
#ifdef MM_ATOMIC_SUPPORT
  page = dst->page;
  for( pageindex = 0 ; pageindex < dst->pagecount ; pageindex++, page++ )
  {
    mmAtomicLockInit32( &page->lock );
    mmAtomicWriteP( &page->owner, (void *)0 );
  }
  mmAtomicWrite32( &dst->globallock, 0x0 );
#else
  page = src->page;
  for( pageindex = src->pagecount ; pageindex ; pageindex--, page++ )
    mtMutexDestroy( &page->mutex );
  mtMutexDestroy( &src->globalmutex );
  mtMutexDestroy( &src->countmutex );

  page = dst->page;
  for( pageindex = dst->pagecount ; pageindex ; pageindex--, page++ )
  {
    mtMutexInit( &page->mutex );
    page->owner = 0;
  }
  mtMutexInit( &dst->globalmutex );
  mtMutexInit( &dst->countmutex );
#endif

  /* Move all entries from the src table to the dst table */
  srcentry = MM_HASH_ENTRYLIST( src );

  for( hashpos = 0 ; hashpos < src->hashsize ; hashpos++ )
  {
    {
       hashkey = access->entryvalid( srcentry ) ? access->entrykey( srcentry ) : 0;
       dstkey = hashkey & dst->hashmask;

       /* Search an empty spot in the destination table */
       for( dstpos = dstkey ; ; dstpos = ( dstpos + 1 ) & dst->hashmask )
       {
         dstentry = MM_HASH_ENTRY( dst, dstpos );
         if( !( access->entryvalid( dstentry ) ) )
           break;
       }

       /* Copy entry from src table to dst table */
       memcpy( dstentry, srcentry, src->entrysize );
       srcentry = ADDRESS( srcentry, src->entrysize );
    }
  }
  return;
}


void mmHashResize2( void *newtable, void *oldtable, const mmHashAccess *access, uint32_t hashbits, uint32_t pageshift, void ** movedEntryPtr)
{
  uint32_t hashkey, hashpos, dstkey, dstpos, pageindex;
  void *srcentry, *dstentry;
  void *movedentry = movedEntryPtr ? *movedEntryPtr : NULL;
  mmHashTable *dst, *src;
  mmHashPage *page;
  void (*clearentry)( void *entry ) = access->clearentry;

  dst = newtable;
  src = oldtable;
  dst->status = MM_HASH_STATUS_NORMAL;
  dst->flags = src->flags;
  dst->entrysize = src->entrysize;
  dst->minhashbits = src->minhashbits;
  dst->hashbits = hashbits;
  dst->hashsize = 1 << dst->hashbits;
  dst->hashmask = dst->hashsize - 1;
  dst->pageshift = pageshift;
  dst->pagecount = dst->hashsize >> pageshift;
  dst->pagemask = dst->pagecount - 1;
  dst->page = MM_HASH_PAGELIST( dst );
#ifdef MM_ATOMIC_SUPPORT
  mmAtomicWrite32( &dst->entrycount, mmAtomicRead32( &src->entrycount ) );
#else
  dst->entrycount = src->entrycount;
#endif
  mmHashSetBounds( dst );

  /* Clear the whole destination table */
  dstentry = MM_HASH_ENTRYLIST( dst );
  if(clearentry)
  {
     for( hashpos = 0 ; hashpos < dst->hashsize ; hashpos++ )
     {
       clearentry( dstentry );
       dstentry = ADDRESS( dstentry, dst->entrysize );
     }
  }
  else
     memset(dstentry, 0, dst->hashsize * dst->entrysize);

  /* Clear the lock pages */
#ifdef MM_ATOMIC_SUPPORT
  page = dst->page;
  for( pageindex = 0 ; pageindex < dst->pagecount ; pageindex++, page++ )
  {
    mmAtomicLockInit32( &page->lock );
    mmAtomicWriteP( &page->owner, (void *)0 );
  }
  mmAtomicWrite32( &dst->globallock, 0x0 );
#else
  page = src->page;
  for( pageindex = src->pagecount ; pageindex ; pageindex--, page++ )
    mtMutexDestroy( &page->mutex );
  mtMutexDestroy( &src->globalmutex );
  mtMutexDestroy( &src->countmutex );

  page = dst->page;
  for( pageindex = dst->pagecount ; pageindex ; pageindex--, page++ )
  {
    mtMutexInit( &page->mutex );
    page->owner = 0;
  }
  mtMutexInit( &dst->globalmutex );
  mtMutexInit( &dst->countmutex );
#endif

  /* Move all entries from the src table to the dst table */
  srcentry = MM_HASH_ENTRYLIST( src );
  for( hashpos = 0 ; hashpos < src->hashsize ; hashpos++ )
  {
    {
      hashkey = access->entryvalid( srcentry ) ? access->entrykey( srcentry ) : 0;
      dstkey = hashkey & dst->hashmask;

      /* Search an empty spot in the destination table */
      for( dstpos = dstkey ; ; dstpos = ( dstpos + 1 ) & dst->hashmask )
      {
        dstentry = MM_HASH_ENTRY( dst, dstpos );
        if( !( access->entryvalid( dstentry ) ) )
          break;
      }

      if(srcentry == movedentry)
        *movedEntryPtr = dstentry;

      /* Copy entry from src table to dst table */
      memcpy( dstentry, srcentry, src->entrysize );
      srcentry = ADDRESS( srcentry, src->entrysize );
    }
  }

  return;
}



/* Must be called while NO other thread will ever access the table for writing */
void mmHashListAll( void *hashtable, int (*list)( void *opaque, void *entry ), void *opaque )
{
  uint32_t hashkey;
  size_t entrysize;
  void *entry;
  mmHashTable *table;
  table = hashtable;
  entrysize = table->entrysize;
  entry = MM_HASH_ENTRYLIST( table );
  for( hashkey = 0 ; hashkey < table->hashsize ; hashkey++ )
  {
    if( !list( opaque, entry ) )
      break;
    entry = ADDRESS( entry, entrysize );
  }
  return;
}


////


static int mmHashLockRangeTry( mmHashTable *table, const mmHashAccess *access, mmHashLock *hashlock, mmHashLockRange *lockrange, uint32_t hashkey )
{
  int newcount;
  uint32_t srckey;
  uint32_t pageindex, pagestart, pagefinal;
  void *srcentry;

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
#ifdef MM_ATOMIC_SUPPORT
  if( mmAtomicReadP( &table->page[pagestart].owner ) != (void *)hashlock )
  {
    if( !( MM_HASH_LOCK_TRY_WRITE( table, pagestart ) ) )
      return MM_HASH_TRYAGAIN;
  }
  mmAtomicWriteP( &table->page[pagestart].owner, (void *)hashlock );
#else
  if( table->page[pagestart].owner != (void *)hashlock )
  {
    if( !( MM_HASH_LOCK_TRY_WRITE( table, pagestart ) ) )
      return MM_HASH_TRYAGAIN;
  }
  table->page[pagestart].owner = hashlock;
#endif

  /* Lock all pages in stream */
  newcount = hashlock->newcount;
  for( srckey = hashkey ; ; )
  {
    srckey = ( srckey + 1 ) & table->hashmask;

    /* Lock new pages */
    pageindex = srckey >> table->pageshift;
    if( pageindex != pagefinal )
    {
#ifdef MM_ATOMIC_SUPPORT
      if( mmAtomicReadP( &table->page[pageindex].owner ) != (void *)hashlock )
      {
        if( MM_HASH_LOCK_TRY_WRITE( table, pageindex ) )
        {
          mmAtomicWriteP( &table->page[pageindex].owner, (void *)hashlock );
          continue;
        }
        /* Failed, unlock all pages */
        for( pageindex = pagestart ; ; pageindex = ( pageindex + 1 ) & table->pagemask )
        {
          mmAtomicWriteP( &table->page[pageindex].owner, (void *)0 );
          MM_HASH_LOCK_DONE_WRITE( table, pageindex );
          if( pageindex == pagefinal )
            break;
        }
        return MM_HASH_TRYAGAIN;
      }
#else
      if( table->page[pageindex].owner != (void *)hashlock )
      {
        if( MM_HASH_LOCK_TRY_WRITE( table, pageindex ) )
        {
          table->page[pageindex].owner = (void *)hashlock;
          continue;
        }
        /* Failed, unlock all pages */
        for( pageindex = pagestart ; ; pageindex = ( pageindex + 1 ) & table->pagemask )
        {
          table->page[pageindex].owner = 0;
          MM_HASH_LOCK_DONE_WRITE( table, pageindex );
          if( pageindex == pagefinal )
            break;
        }
        return MM_HASH_TRYAGAIN;
      }
#endif
      pagefinal = pageindex;
    }

    /* Check for valid entry */
    srcentry = MM_HASH_ENTRY( table, srckey );
    if( !( access->entryvalid( srcentry ) ) )
    {
      if( --newcount <= 0 )
        break;
    }
  }

  /* Store lock pagestart and pagefinal */
  lockrange->pagestart = pagestart;
  lockrange->pagefinal = pagefinal;

  return MM_HASH_SUCCESS;
}


static void mmHashLockReleaseAll( mmHashTable *table, mmHashLock *hashlock )
{
  uint32_t pageindex, pagestart, pagefinal;
  mmHashLockRange *lockrange;

  for( lockrange = hashlock->rangelist ; lockrange ; lockrange = lockrange->next )
  {
    if( lockrange->pagestart == ~(uint32_t)0x0 )
      continue;
    pagestart = lockrange->pagestart;
    pagefinal = lockrange->pagefinal;
    for( pageindex = pagestart ; ; pageindex = ( pageindex + 1 ) & table->pagemask )
    {
#ifdef MM_ATOMIC_SUPPORT
      if( mmAtomicReadP( &table->page[pageindex].owner ) == (void *)hashlock )
      {
        mmAtomicWriteP( &table->page[pageindex].owner, (void *)0 );
        mmAtomicLockDoneWrite32( &table->page[pageindex].lock );
      }
#else
      if( table->page[pageindex].owner == (void *)hashlock )
      {
        table->page[pageindex].owner = (void *)0;
        MM_HASH_LOCK_DONE_WRITE( table, pageindex );
      }
#endif
      if( pageindex == pagefinal )
        break;
    }
  }

  for( lockrange = hashlock->rangelist ; lockrange ; lockrange = lockrange->next )
  {
    lockrange->pagestart = ~0x0;
    lockrange->pagefinal = ~0x0;
  }

  return;
}


static int mmHashLockApplyAll( mmHashTable *table, const mmHashAccess *access, mmHashLock *hashlock )
{
  mmHashLockRange *lockrange, *lockrangenext;

  for( lockrange = hashlock->rangelist ; lockrange ; lockrange = lockrangenext )
  {
    lockrangenext = lockrange->next;
    if( mmHashLockRangeTry( table, access, hashlock, lockrange, lockrange->hashkey ) == MM_HASH_TRYAGAIN )
    {
      /* Failure, release all locks */
      mmHashLockReleaseAll( table, hashlock );
      return MM_HASH_TRYAGAIN;
    }
  }

  return MM_HASH_SUCCESS;
}



////



void mmHashLockInit( mmHashLock *hashlock, int newcount )
{
  memset( hashlock, 0, sizeof(mmHashLock) );
  hashlock->newcount = newcount;
  return;
}

void mmHashLockAdd( void *hashtable, const mmHashAccess *access, void *entry, mmHashLock *hashlock, mmHashLockRange *lockrange )
{
  uint32_t hashkey;
  mmHashTable *table;

  /* Hash key of entry */
  table = hashtable;
  hashkey = access->entrykey( entry ) & table->hashmask;

  lockrange->hashkey = hashkey;
  lockrange->pagestart = ~0x0;
  lockrange->pagefinal = ~0x0;
  lockrange->next = hashlock->rangelist;
  hashlock->rangelist = lockrange;

  return;
}

void mmHashLockAcquire( void *hashtable, const mmHashAccess *access, mmHashLock *hashlock )
{
  int status;
  mmHashTable *table;

  table = hashtable;
  status = mmHashLockApplyAll( table, access, hashlock );
  if( status == MM_HASH_TRYAGAIN )
  {
    MM_HASH_GLOBAL_LOCK( table );
    do
    {
      status = mmHashLockApplyAll( table, access, hashlock );
    } while( status == MM_HASH_TRYAGAIN );
    MM_HASH_GLOBAL_UNLOCK( table );
  }

  return;
}

void mmHashLockRelease( void *hashtable, mmHashLock *hashlock )
{
  mmHashTable *table;

  table = hashtable;
  mmHashLockReleaseAll( table, hashlock );

  return;
}


////


void mmHashGlobalLockEnable( void *hashtable )
{
  uint32_t pageindex;
  mmHashTable *table;

  table = hashtable;
  MM_HASH_GLOBAL_LOCK( table );
  for( pageindex = 0 ; pageindex < table->pagecount ; pageindex++ )
    MM_HASH_LOCK_TRY_WRITE( table, pageindex );

  return;
}


void mmHashGlobalLockDisable( void *hashtable )
{
  uint32_t pageindex;
  mmHashTable *table;

  table = hashtable;
  for( pageindex = 0 ; pageindex < table->pagecount ; pageindex++ )
    MM_HASH_LOCK_DONE_WRITE( table, pageindex );
  MM_HASH_GLOBAL_UNLOCK( table );

  return;
}


////



void mmHashDirectDebugDuplicate( void *hashtable, const mmHashAccess *access, void (*callback)( void *opaque, void *entry0, void *entry1 ), void *opaque )
{
  uint32_t hashbase, hashkey;
  void *baseentry, *entry;
  mmHashTable *table;

  table = hashtable;

  for( hashbase = 0 ; hashbase < table->hashsize ; hashbase++ )
  {
    baseentry = MM_HASH_ENTRY( table, hashbase );
    for( hashkey = hashbase ; ; )
    {
      hashkey = ( hashkey + 1 ) & table->hashmask;
      entry = MM_HASH_ENTRY( table, hashkey );
      if( !( access->entryvalid( entry ) ) )
        break;
      if( access->entrycmp( entry, baseentry ) )
        callback( opaque, entry, baseentry );
    }
  }

  return;
}


void mmHashDirectDebugPages( void *hashtable )
{
#ifdef MM_ATOMIC_SUPPORT
  mmHashTable *table = hashtable;
  uint32_t pageindex;
  mmHashPage *page = table->page;
  for( pageindex = 0 ; pageindex < table->pagecount ; pageindex++, page++ )
  {
    if( ( page->lock.v.value ) || mmAtomicReadP( &page->owner ) )
      printf( "Page[%d] = 0x%x ; %p\n", pageindex, page->lock.v.value, mmAtomicReadP( &page->owner ) );
  }
  fflush( stdout );
#endif
}


void mmHashDirectDebugContent( void *hashtable, void (*callback)( uint32_t hashkey, void *entry ) )
{
  uint32_t hashkey;
  size_t entrysize;
  void *entry;
  mmHashTable *table;
  table = hashtable;
  entrysize = table->entrysize;
  entry = MM_HASH_ENTRYLIST( table );
  for( hashkey = 0 ; hashkey < table->hashsize ; hashkey++ )
  {
    callback( hashkey, entry );
    entry = ADDRESS( entry, entrysize );
  }
  return;
}



void mmHashStatistics( void *hashtable, long *accesscount, long *collisioncount, long *relocationcount, long *entrycount, long *entrycountmax, long *hashsizemax )
{
  mmHashTable *table;

  table = hashtable;
#ifdef MM_HASH_DEBUG_STATISTICS
  *accesscount = mmAtomicReadL( &table->accesscount );
  *collisioncount = mmAtomicReadL( &table->collisioncount );
  *relocationcount = mmAtomicReadL( &table->relocationcount );
  *entrycount = mmAtomicReadL( &table->statentrycount );
  *entrycountmax = table->entrycountmax;
  *hashsizemax = 1 << table->hashbits;
#else
  *accesscount = 0;
  *collisioncount = 0;
  *relocationcount = 0;
  *entrycount = 0;
  *entrycountmax = 0;
  *hashsizemax = 1 << table->hashbits;
#endif

  return;
}

unsigned int mmHashGetCount( void *hashtable)
{
   mmHashTable *table = hashtable;
   unsigned int count = 0;
   if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
   {
#ifdef MM_ATOMIC_SUPPORT
      count = mmAtomicRead32(&table->entrycount);
#else
      count = table->entrycount;
#endif
   }
   return count;
}
