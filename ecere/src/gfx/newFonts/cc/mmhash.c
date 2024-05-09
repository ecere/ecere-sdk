/* *****************************************************************************
 * Copyright (c) 2009-2023 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

#include "cc.h"
#include "mm.h"
#include "mmatomic.h"
#include "mmhash.h"


////


#include "mmhashinternal.h"


////


#define MM_HASH_DEFAULT_GROW_FACTOR (0.7)
#define MM_HASH_DEFAULT_SHRINK_FACTOR (0.2)


static void mmHashSetBounds( mmHashTable *table )
{
  table->lowcount = 0;
  if( table->hashbits > table->minhashbits )
    table->lowcount = (mmHashIndex)( (double)table->hashsize * table->shrinkfactor );
  table->highcount = (mmHashIndex)( (double)table->hashsize * table->growfactor );
  return;
}


size_t mmHashRequiredSize( size_t entrysize, size_t hashsize, uint32_t pageshift )
{
  mmHashIndex pagecount;
  pagecount = ccPow2Round64( ( ( hashsize + ( ( 1 << pageshift ) - 1 ) ) >> pageshift ) );
  if( !pagecount )
    pagecount = 1;
  return MM_HASH_ALIGN64( MM_HASH_SIZEOF_ALIGN64(mmHashTable) + ( hashsize * entrysize ) ) + ( pagecount * sizeof(mmHashPage) );
}


void mmHashInit( void *hashtable, const mmHashAccess *access, size_t entrysize, size_t hashsize, uint32_t pageshift, uint32_t flags, void *context )
{
  uint32_t hashbits;
  mmHashIndex hashkey, pageindex;
  void *entry;
  mmHashTable *table;
  mmHashPage *page;
  void (*clearentry)( void * context, void *entry ) = access->clearentry;
  void (*clearentries)( void * context, void *entry, unsigned int ) = access->clearentries;

  flags &= ~MM_HASH_FLAGS_HASHSIZE_ISPOW2;

  hashbits = ccLog2Int64( hashsize );
  table = hashtable;
  table->status = MM_HASH_STATUS_NORMAL;
  if( flags & MM_HASH_FLAGS_NO_COUNT )
    table->status = MM_HASH_STATUS_UNKNOWN;
  table->flags = flags;
  table->entrysize = entrysize;
  table->minhashbits = hashbits;
  table->hashbits = hashbits;
  table->hashsize = hashsize;
  table->hashmask = ( (mmHashIndex)1 << table->hashbits ) - 1;
  table->pageshift = pageshift;
  table->pagecount = ccPow2Round64( ( ( table->hashsize + ( ( 1 << pageshift ) - 1 ) ) >> pageshift ) );
  if( !table->pagecount )
    table->pagecount = 1;
  table->pagemask = table->pagecount - 1;
  table->page = MM_HASH_PAGELIST( table );
#ifdef MM_ATOMIC_SUPPORT
 #if MM_HASH_INDEX_64_BITS
  mmAtomicWrite64( &table->entrycount, 0 );
 #else
  mmAtomicWrite32( &table->entrycount, 0 );
 #endif
#else
  mtMutexInit( &table->countmutex );
  table->entrycount = 0;
#endif
  table->context = context;
  table->shrinkfactor = MM_HASH_DEFAULT_SHRINK_FACTOR;
  table->growfactor = MM_HASH_DEFAULT_GROW_FACTOR;
  mmHashSetBounds( table );
  if( ccIsPow2Int64( table->hashsize ) )
    table->flags |= MM_HASH_FLAGS_HASHSIZE_ISPOW2;

  /* Clear the table */
  entry = MM_HASH_ENTRYLIST( table );
  if(clearentries)
     clearentries(table->context, entry, table->hashsize);
  else if(clearentry)
  {
     for( hashkey = 0 ; hashkey < table->hashsize ; hashkey++ )
     {
       clearentry( table->context, entry );
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

  mmHashResetStatistics( hashtable );
#if MM_HASH_DEBUG_STATISTICS
  table->statentrycountmax = 0;
  mmAtomicWriteL( &table->statentrycount, 0 );
#endif

  return;
}


int mmHashGetStatus( void *hashtable, size_t *rethashsize )
{
  mmHashTable *table;
  table = hashtable;
  if( rethashsize )
    *rethashsize = table->hashsize;
  return table->status;
}


void mmHashReset( void *hashtable, const mmHashAccess *access )
{
  int hashkey;
  mmHashTable *table;
  void *entry;
  void (*clearentry)( void * context, void *entry ) = access->clearentry;
  void (*clearentries)( void * context, void *entry, unsigned int ) = access->clearentries;

  /* Clear the table */
  table = hashtable;
  entry = MM_HASH_ENTRYLIST( table );
  if(clearentries)
     clearentries(table->context, entry, table->hashsize);
  else if(clearentry)
  {
     for( hashkey = 0 ; hashkey < table->hashsize ; hashkey++ )
     {
       clearentry( table->context, entry );
       entry = ADDRESS( entry, table->entrysize );
     }
  }
  else
    memset(entry, 0, table->hashsize * table->entrysize);
  return;
}


void mmHashSetResizeCriteria( void *hashtable, float shrinkfactor, float growfactor )
{
  mmHashIndex entrycount;
  mmHashTable *table;
  table = hashtable;
  table->shrinkfactor = fminf( fmaxf( shrinkfactor, 0.0f ), 0.3f );
  table->growfactor = fminf( fmaxf( growfactor, 0.4f ), 0.99f );
  mmHashSetBounds( table );
  entrycount = MM_HASH_ENTRYCOUNT_READ( table );
  if( entrycount >= table->highcount )
    table->status = MM_HASH_STATUS_MUSTGROW;
  else if( entrycount < table->lowcount )
    table->status = MM_HASH_STATUS_MUSTSHRINK;
  else if( table->status != MM_HASH_STATUS_NORMAL )
    table->status = MM_HASH_STATUS_NORMAL;
  return;
}



////////////////////////////////////////////////////////////////////////////////



void *mmHashDirectFindEntry( void *hashtable, const mmHashAccess *access, const void *findentry )
{
  int cmpvalue;
  mmHashIndex hashkey;
  void *entry;
  mmHashTable *table;

  table = hashtable;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, findentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

  /* Search the entry */
  for( ; ; )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( table->context, entry, findentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
      return entry;
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
  }

  return 0;
}


static int mmHashTryFindEntry( mmHashTable *table, const mmHashAccess *access, void *findentry, void **retentry )
{
  mmHashIndex hashkey;
  mmHashIndex pageindex, pagestart, pagefinal;
  int cmpvalue, retvalue;
  void *entry;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, findentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
  if( !( MM_HASH_LOCK_TRY_READ( table, pagestart ) ) )
    return MM_HASH_TRYAGAIN;

  /* Search the entry */
  entry = 0;
  retvalue = MM_HASH_SUCCESS;
  for( ; ; )
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
    cmpvalue = access->entrycmp( table->context, entry, findentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
    {
      retvalue = MM_HASH_FAILURE;
      entry = 0;
      break;
    }
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
      break;
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
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
  mmHashIndex hashkey;
  void *entry;
  mmHashTable *table;

  table = hashtable;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, listentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

  /* Search the entry */
  for( ; ; )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrylist( table->context, opaque, entry, listentry );
    if( cmpvalue == MM_HASH_ENTRYLIST_BREAK )
      break;
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
  }

  return;
}

// REVIEW: Is this still valid?
#define MM_HASH_HASHKEY(table,entry) (((size_t)((char *)entry - (char *)table) - MM_HASH_SIZEOF_ALIGN64(mmHashTable))/(table)->entrysize)

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
     if(access->entryvalid( table->context, entry ))
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
     if(access->entryvalid( table->context, entry ))
        return entry;
     if(!hashkey) break;
  }
  return NULL;
}

static int mmHashTryListEntry( mmHashTable *table, const mmHashAccess *access, void *listentry, void *opaque )
{
  mmHashIndex hashkey;
  mmHashIndex pageindex, pagestart, pagefinal;
  int cmpvalue, retvalue;
  void *entry;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, listentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
  if( !( MM_HASH_LOCK_TRY_READ( table, pagestart ) ) )
    return MM_HASH_TRYAGAIN;

  /* Search the entry */
  entry = 0;
  retvalue = MM_HASH_SUCCESS;
  for( ; ; )
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
    cmpvalue = access->entrylist( table->context, opaque, entry, listentry );
    if( cmpvalue == MM_HASH_ENTRYLIST_BREAK )
      break;
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
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
  mmHashIndex hashkey;
  void *entry;
  mmHashTable *table;

  table = hashtable;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, readentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

  /* Search the entry */
  for( ; ; )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( table->context, entry, readentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
      memcpy( readentry, entry, table->entrysize );
      return MM_HASH_SUCCESS;
    }
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
  }

  return MM_HASH_FAILURE;
}


static int mmHashTryReadEntry( mmHashTable *table, const mmHashAccess *access, void *readentry )
{
  mmHashIndex hashkey;
  mmHashIndex pageindex, pagestart, pagefinal;
  int cmpvalue, retvalue;
  void *entry;

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, readentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
  if( !( MM_HASH_LOCK_TRY_READ( table, pagestart ) ) )
    return MM_HASH_TRYAGAIN;

  /* Search the entry */
  entry = 0;
  retvalue = MM_HASH_SUCCESS;
  for( ; ; )
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
    cmpvalue = access->entrycmp( table->context, entry, readentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
    {
      retvalue = MM_HASH_FAILURE;
      entry = 0;
      break;
    }
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
      break;
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
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
  mmHashIndex hashkey, entrycount;
  void *entry;
  mmHashTable *table;

  table = hashtable;

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, callentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Search an available entry */
  for( ; ; )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( table->context, entry, callentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
      callback( opaque, entry, 0 );
      return MM_HASH_SUCCESS;
    }
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
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
    else if( table->status != MM_HASH_STATUS_NORMAL )
      table->status = MM_HASH_STATUS_NORMAL;
  }

#if MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->statentrycountmax )
    table->statentrycountmax = statentrycount;
#endif

  return MM_HASH_SUCCESS;
}


static int mmHashTryCallEntry( mmHashTable *table, const mmHashAccess *access, void *callentry, void (*callback)( void *opaque, void *entry, int newflag ), void *opaque, int addflag )
{
  mmHashIndex hashkey, entrycount;
  mmHashIndex pageindex, pagestart, pagefinal;
  int cmpvalue, retvalue;
  void *entry;

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, callentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
  if( !( MM_HASH_LOCK_TRY_WRITE( table, pagestart ) ) )
    return MM_HASH_TRYAGAIN;

  /* Search an available entry */
  retvalue = MM_HASH_SUCCESS;
  for( ; ; )
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
    cmpvalue = access->entrycmp( table->context, entry, callentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
      callback( opaque, entry, 0 );
      retvalue = MM_HASH_SUCCESS;
      goto end;
    }
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
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
    else if( table->status != MM_HASH_STATUS_NORMAL )
      table->status = MM_HASH_STATUS_NORMAL;
  }

#if MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->statentrycountmax )
    table->statentrycountmax = statentrycount;
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
  mmHashIndex hashkey, entrycount;
  void *entry;
  mmHashTable *table;

  table = hashtable;

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, replaceentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Search an available entry */
  for( ; ; )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( table->context, entry, replaceentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
      memcpy( entry, replaceentry, table->entrysize );
      return MM_HASH_SUCCESS;
    }
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
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
    else if( table->status != MM_HASH_STATUS_NORMAL )
      table->status = MM_HASH_STATUS_NORMAL;
  }

#if MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->statentrycountmax )
    table->statentrycountmax = statentrycount;
#endif

  return MM_HASH_SUCCESS;
}


static int mmHashTryReplaceEntry( mmHashTable *table, const mmHashAccess *access, void *replaceentry, int addflag )
{
  mmHashIndex hashkey, entrycount;
  mmHashIndex pageindex, pagestart, pagefinal;
  int cmpvalue, retvalue;
  void *entry;

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, replaceentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
  if( !( MM_HASH_LOCK_TRY_WRITE( table, pagestart ) ) )
    return MM_HASH_TRYAGAIN;

  /* Search an available entry */
  retvalue = MM_HASH_SUCCESS;
  for( ; ; )
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
    cmpvalue = access->entrycmp( table->context, entry, replaceentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
      memcpy( entry, replaceentry, table->entrysize );
      retvalue = MM_HASH_SUCCESS;
      goto end;
    }
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
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
    else if( table->status != MM_HASH_STATUS_NORMAL )
      table->status = MM_HASH_STATUS_NORMAL;
  }

#if MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->statentrycountmax )
    table->statentrycountmax = statentrycount;
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
  mmHashIndex hashkey, entrycount;
  void *entry;
  mmHashTable *table;

  table = hashtable;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, addentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

  /* Search an available entry */
  for( ; ; )      // FIXME: This should check for wrap-around and return failure when there's no room, or otherwise quit early by checking count?
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    /* Do we allow duplicate entries? */
    if( nodupflag )
    {
      cmpvalue = access->entrycmp( table->context, entry, addentry );
      if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
        break;
      else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
        return MM_HASH_FAILURE;
    }
    else
    {
      if( !( access->entryvalid( table->context, entry ) ) )
        break;
    }
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
  }

  /* Store new entry */
  memcpy( entry, addentry, table->entrysize );

  /* Increment count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, 1 );
    if( entrycount >= table->highcount )
      table->status = MM_HASH_STATUS_MUSTGROW;
    else if( table->status != MM_HASH_STATUS_NORMAL )
      table->status = MM_HASH_STATUS_NORMAL;
  }

#if MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->statentrycountmax )
    table->statentrycountmax = statentrycount;
#endif

  return MM_HASH_SUCCESS;
}

int mmHashDirectAddEntry2( void *hashtable, const mmHashAccess *access, void *addentry, int nodupflag, void ** retEntry)
{
  int cmpvalue;
  mmHashIndex hashkey, entrycount;
  void *entry;
  mmHashTable *table;

  table = hashtable;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, addentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

  /* Search an available entry */
  for( ; ; )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    /* Do we allow duplicate entries? */
    if( nodupflag )
    {
      cmpvalue = access->entrycmp( table->context, entry, addentry );
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
      if( !( access->entryvalid( table->context, entry ) ) )
        break;
    }
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
  }

  /* Store new entry */
  memcpy( entry, addentry, table->entrysize );

  /* Increment count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, 1 );
    if( entrycount >= table->highcount )
      table->status = MM_HASH_STATUS_MUSTGROW;
    else if( table->status != MM_HASH_STATUS_NORMAL )
      table->status = MM_HASH_STATUS_NORMAL;
  }

#if MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->statentrycountmax )
    table->statentrycountmax = statentrycount;
#endif

  if(retEntry) *retEntry = entry;
  return MM_HASH_SUCCESS;
}

static int mmHashTryAddEntry( mmHashTable *table, const mmHashAccess *access, void *addentry, int nodupflag )
{
  mmHashIndex hashkey, entrycount;
  mmHashIndex pageindex, pagestart, pagefinal;
  int cmpvalue, retvalue;
  void *entry;

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, addentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
  if( !( MM_HASH_LOCK_TRY_WRITE( table, pagestart ) ) )
    return MM_HASH_TRYAGAIN;

  /* Search an available entry */
  retvalue = MM_HASH_SUCCESS;
  for( ; ; )
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
      cmpvalue = access->entrycmp( table->context, entry, addentry );
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
      if( !( access->entryvalid( table->context, entry ) ) )
        break;
    }
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
  }

  /* Store new entry */
  memcpy( entry, addentry, table->entrysize );

  /* Increment count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, 1 );
    if( entrycount >= table->highcount )
      table->status = MM_HASH_STATUS_MUSTGROW;
    else if( table->status != MM_HASH_STATUS_NORMAL )
      table->status = MM_HASH_STATUS_NORMAL;
  }

#if MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->statentrycountmax )
    table->statentrycountmax = statentrycount;
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
  mmHashIndex hashkey, entrycount;
  void *entry;
  mmHashTable *table;

  table = hashtable;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, readaddentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

  /* Search an available entry */
  *retreadflag = 0;
  for( ; ; )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( table->context, entry, readaddentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
      memcpy( readaddentry, entry, table->entrysize );
      *retreadflag = 1;
      return MM_HASH_SUCCESS;
    }
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
  }

  /* Store new entry */
  memcpy( entry, readaddentry, table->entrysize );

  /* Increment count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, 1 );
    if( entrycount >= table->highcount )
      table->status = MM_HASH_STATUS_MUSTGROW;
    else if( table->status != MM_HASH_STATUS_NORMAL )
      table->status = MM_HASH_STATUS_NORMAL;
  }

#if MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->statentrycountmax )
    table->statentrycountmax = statentrycount;
#endif

  return MM_HASH_SUCCESS;
}


static int mmHashTryReadOrAddEntry( mmHashTable *table, const mmHashAccess *access, void *readaddentry, int *retreadflag )
{
  mmHashIndex hashkey, entrycount;
  mmHashIndex pageindex, pagestart, pagefinal;
  int cmpvalue, retvalue;
  void *entry;

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, readaddentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
  if( !( MM_HASH_LOCK_TRY_WRITE( table, pagestart ) ) )
    return MM_HASH_TRYAGAIN;

  /* Search an available entry */
  retvalue = MM_HASH_SUCCESS;
  *retreadflag = 0;
  for( ; ; )
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

    cmpvalue = access->entrycmp( table->context, entry, readaddentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
      memcpy( readaddentry, entry, table->entrysize );
      *retreadflag = 1;
      goto end;
    }

#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
  }

  /* Store new entry */
  memcpy( entry, readaddentry, table->entrysize );

  /* Increment count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, 1 );
    if( entrycount >= table->highcount )
      table->status = MM_HASH_STATUS_MUSTGROW;
    else if( table->status != MM_HASH_STATUS_NORMAL )
      table->status = MM_HASH_STATUS_NORMAL;
  }

#if MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->statentrycountmax )
    table->statentrycountmax = statentrycount;
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
  mmHashIndex hashkey, srckey, srcpos, targetpos, targetkey, entrycount;
  mmHashIndex delbase;
  void *entry, *srcentry, *targetentry;
  mmHashTable *table = hashtable;
  size_t entrysize = table->entrysize;
  void (*clearentry)( void * context, void *entry ) = access->clearentry;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, deleteentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

  /* Search the entry */
  for( ; ; )
  {
    entry = MM_HASH_ENTRY( table, hashkey );
    cmpvalue = access->entrycmp( table->context, entry, deleteentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      return MM_HASH_FAILURE;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
      break;
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
  }

  if( readflag )
    memcpy( deleteentry, entry, table->entrysize );

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->statdeletecount, 1 );
#endif

  for( delbase = hashkey ; ; )
  {
    if( delbase == 0 )
      delbase = table->hashsize;
    delbase--;
    if( !( access->entryvalid( table->context, MM_HASH_ENTRY( table, delbase ) ) ) )
      break;
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statdelrewindcount, 1 );
#endif
  }
  delbase++;
  if( delbase == table->hashsize )
    delbase = 0;

  /* Entry found, delete it */
  for( ; ; )
  {
    /* Find replacement target */
    targetkey = hashkey;
    targetentry = 0;
    for( srcpos = hashkey ; ; )
    {
      srcpos++;
      if( srcpos == table->hashsize )
        srcpos = 0;

      /* Try next entry */
      srcentry = MM_HASH_ENTRY( table, srcpos );
      if( !( access->entryvalid( table->context, srcentry ) ) )
        break;
      srckey = access->entrykey( table->context, srcentry );
      if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
        srckey &= table->hashmask;
      else
        srckey %= table->hashsize;

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
    }

    /* No replacement found, just clear it */
    entry = MM_HASH_ENTRY( table, hashkey );
    if( !targetentry )
    {
      if(clearentry)
         clearentry( table->context, entry );
      else
         memset(entry, 0, entrysize);
      break;
    }

    /* Move entry in place and continue the repair process */
    memcpy( entry, targetentry, table->entrysize );

#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statrelocationcount, 1 );
#endif

    hashkey = targetpos;
  }

  /* Decrement count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, -1 );
    if( entrycount < table->lowcount )
      table->status = MM_HASH_STATUS_MUSTSHRINK;
    else if( table->status != MM_HASH_STATUS_NORMAL )
      table->status = MM_HASH_STATUS_NORMAL;
  }

#if MM_HASH_DEBUG_STATISTICS
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
  void (*clearentry)( void * context, void *entry ) = access->clearentry;

#if /*def*/ MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = MM_HASH_HASHKEY(table, entry);

#ifdef MM_ROBUST_DELETION
  for( delbase = hashkey ; ; )
  {
    delbase = ( delbase - 1 ) & table->hashmask;
    if( !( access->entryvalid( table->context, MM_HASH_ENTRY( table, delbase ) ) ) )
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
         if( !( access->entryvalid( table->context, srcentry ) ) )
           break;
         srckey = access->entrykey( table->context, srcentry ) & table->hashmask;

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
          clearentry( table->context, entry );
       else
          memset(entry, 0, entrysize);
      break;
    }

    /* Move entry in place and continue the repair process */
    memcpy( entry, targetentry, entrysize );

#if /*def*/ MM_HASH_DEBUG_STATISTICS
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
  mmHashIndex hashkey, srckey, srcpos, srcend, targetpos, targetkey, entrycount;
  mmHashIndex pageindex, pagestart, pagefinal;
  mmHashIndex delbase;
  int cmpvalue, retvalue;
  void *entry, *srcentry, *targetentry;
  size_t entrysize = table->entrysize;
  void (*clearentry)( void * context, void *entry ) = access->clearentry;

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, deleteentry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Lock first page */
  pagestart = hashkey >> table->pageshift;
  pagefinal = pagestart;
  if( !( MM_HASH_LOCK_TRY_WRITE( table, pagestart ) ) )
    return MM_HASH_TRYAGAIN;

  /* Search the entry */
  retvalue = MM_HASH_SUCCESS;
  for( ; ; )
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
    cmpvalue = access->entrycmp( table->context, entry, deleteentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
    {
      retvalue = MM_HASH_FAILURE;
      goto end;
    }
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
      break;
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
  }

  if( readflag )
    memcpy( deleteentry, entry, table->entrysize );

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->statdeletecount, 1 );
#endif

  for( delbase = hashkey ; ; )
  {
    if( delbase == 0 )
      delbase = table->hashsize;
    delbase--;
    if( !( access->entryvalid( table->context, MM_HASH_ENTRY( table, delbase ) ) ) )
      break;
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statdelrewindcount, 1 );
#endif
  }
  delbase++;
  if( delbase == table->hashsize )
    delbase = 0;

  /* Preemtively lock all pages in the stream before starting the operation */
  for( srcend = hashkey ; ; )
  {
    srcend++;
    if( srcend == table->hashsize )
      srcend = 0;

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
    if( !( access->entryvalid( table->context, srcentry ) ) )
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
      srcpos++;
      if( srcpos == table->hashsize )
        srcpos = 0;

      /* Try next entry */
      srcentry = MM_HASH_ENTRY( table, srcpos );
      /* Don't loop beyond the end of hash stream */
      if( srcpos == srcend )
        break;
      srckey = access->entrykey( table->context, srcentry );
      if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
        srckey &= table->hashmask;
      else
        srckey %= table->hashsize;

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
    }

    /* No replacement found, just clear it */
    entry = MM_HASH_ENTRY( table, hashkey );
    if( !targetentry )
    {
      if(clearentry)
         clearentry( table->context, entry );
      else
         memset(entry, 0, entrysize);
      break;
    }

    /* Move entry in place and continue the repair process */
    memcpy( entry, targetentry, table->entrysize );

#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statrelocationcount, 1 );
#endif

    hashkey = targetpos;
  }

  /* Decrement count of entries in table */
  if( !( table->flags & MM_HASH_FLAGS_NO_COUNT ) )
  {
    entrycount = MM_HASH_ENTRYCOUNT_ADD_READ( table, -1 );
    if( entrycount < table->lowcount )
      table->status = MM_HASH_STATUS_MUSTSHRINK;
    else if( table->status != MM_HASH_STATUS_NORMAL )
      table->status = MM_HASH_STATUS_NORMAL;
  }

#if MM_HASH_DEBUG_STATISTICS
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
void mmHashResize( void *newtable, void *oldtable, const mmHashAccess *access, size_t hashsize, uint32_t pageshift )
{
  uint32_t hashbits;
  mmHashIndex hashkey, hashpos, dstkey, dstpos, pageindex;
  void *srcentry, *dstentry;
  mmHashTable *dst, *src;
  mmHashPage *page;
  void (*clearentry)( void * context, void *entry ) = access->clearentry;

  hashbits = ccLog2Int64( hashsize );
  dst = newtable;
  src = oldtable;
  dst->status = MM_HASH_STATUS_NORMAL;
  dst->flags = src->flags;
  dst->entrysize = src->entrysize;
  dst->minhashbits = src->minhashbits;
  dst->hashbits = hashbits;
  //if(hashsize == 8)
   //printf("oh\n");
  dst->hashsize = hashsize;
  dst->hashmask = ( (mmHashIndex)1 << dst->hashbits ) - 1;
  dst->pageshift = pageshift;
  dst->pagecount = ccPow2Round64( ( ( dst->hashsize + ( ( 1 << pageshift ) - 1 ) ) >> pageshift ) );
  dst->pagemask = dst->pagecount - 1;
  dst->shrinkfactor = src->shrinkfactor;
  dst->growfactor = src->growfactor;
  dst->page = MM_HASH_PAGELIST( dst );
#ifdef MM_ATOMIC_SUPPORT
 #if MM_HASH_INDEX_64_BITS
  mmAtomicWrite64( &dst->entrycount, mmAtomicRead64( &src->entrycount ) );
 #else
  mmAtomicWrite32( &dst->entrycount, mmAtomicRead32( &src->entrycount ) );
 #endif
#else
  dst->entrycount = src->entrycount;
#endif
  mmHashSetBounds( dst );
  if( ccIsPow2Int64( dst->hashsize ) )
    dst->flags |= MM_HASH_FLAGS_HASHSIZE_ISPOW2;

  /* Clear the whole destination table */
  dstentry = MM_HASH_ENTRYLIST( dst );
  if(clearentry)
  {
     for( hashpos = 0 ; hashpos < dst->hashsize ; hashpos++ )
     {
       clearentry( dst->context, dstentry );
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
  page = dst->page;
  for( pageindex = dst->pagecount ; pageindex ; pageindex--, page++ )
  {
    mtMutexInit( &page->mutex );
    page->owner = 0;
  }
  mtMutexInit( &dst->globalmutex );
#endif

  /* Move all entries from the src table to the dst table */
  srcentry = MM_HASH_ENTRYLIST( src );

  if( dst->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
  {
    for( hashpos = 0 ; hashpos < src->hashsize ; hashpos++ )
    {
      if( access->entryvalid( src->context, srcentry ) )
      {
        hashkey = access->entrykey( src->context, srcentry );
        dstkey = hashkey & dst->hashmask;
        /* Search an empty spot in the destination table */
        for( dstpos = dstkey ; ; dstpos = ( dstpos + 1 ) & dst->hashmask )
        {
          dstentry = MM_HASH_ENTRY( dst, dstpos );
          if( !( access->entryvalid( dst->context, dstentry ) ) )
            break;
        }
        /* Copy entry from src table to dst table */
        memcpy( dstentry, srcentry, src->entrysize );
      }
      srcentry = ADDRESS( srcentry, src->entrysize );
    }
  }
  else
  {
    for( hashpos = 0 ; hashpos < src->hashsize ; hashpos++ )
    {
      if( access->entryvalid( src->context, srcentry ) )
      {
        hashkey = access->entrykey( src->context, srcentry );
        dstkey = hashkey % dst->hashsize;
        /* Search an empty spot in the destination table */
        for( dstpos = dstkey ; ; )
        {
          dstentry = MM_HASH_ENTRY( dst, dstpos );
          if( !( access->entryvalid( dst->context, dstentry ) ) )
            break;
          dstpos++;
          if( dstpos == dst->hashsize )
            dstpos = 0;
        }
        /* Copy entry from src table to dst table */
        memcpy( dstentry, srcentry, src->entrysize );
      }
      srcentry = ADDRESS( srcentry, src->entrysize );
    }
  }

#ifdef MM_HASH_DEBUG_STATISTICS
  dst->statentrycountmax = src->statentrycountmax;
  dst->statentrycount = src->statentrycount;
  dst->stataccesscount = src->stataccesscount;
  dst->statfindskipcount = src->statfindskipcount;
  dst->statdeletecount = src->statdeletecount;
  dst->statdelrewindcount = src->statdelrewindcount;
  dst->statrelocationcount = src->statrelocationcount;
#endif

  return;
}

void mmHashResize2( void *newtable, void *oldtable, const mmHashAccess *access, size_t hashsize, uint32_t pageshift, void ** movedEntryPtr)
{
  uint32_t hashbits;
  mmHashIndex hashkey, hashpos, dstkey, dstpos, pageindex;
  void *srcentry, *dstentry;
  void *movedentry = movedEntryPtr ? *movedEntryPtr : NULL;
  mmHashTable *dst, *src;
  mmHashPage *page;
  void (*clearentry)( void * context, void *entry ) = access->clearentry;

  hashbits = ccLog2Int64( hashsize );
  dst = newtable;
  src = oldtable;
  dst->status = MM_HASH_STATUS_NORMAL;
  dst->flags = src->flags;
  dst->entrysize = src->entrysize;
  dst->minhashbits = src->minhashbits;
  dst->hashbits = hashbits;
  dst->hashsize = hashsize;
  dst->hashmask = ( (mmHashIndex)1 << dst->hashbits ) - 1;
  dst->pageshift = pageshift;
  dst->pagecount = ccPow2Round64( ( ( dst->hashsize + ( ( 1 << pageshift ) - 1 ) ) >> pageshift ) );
  dst->pagemask = dst->pagecount - 1;
  dst->shrinkfactor = src->shrinkfactor;
  dst->growfactor = src->growfactor;
  dst->page = MM_HASH_PAGELIST( dst );
#ifdef MM_ATOMIC_SUPPORT
 #if MM_HASH_INDEX_64_BITS
  mmAtomicWrite64( &dst->entrycount, mmAtomicRead64( &src->entrycount ) );
 #else
  mmAtomicWrite32( &dst->entrycount, mmAtomicRead32( &src->entrycount ) );
 #endif
#else
  dst->entrycount = src->entrycount;
#endif
  mmHashSetBounds( dst );
  if( ccIsPow2Int64( dst->hashsize ) )
    dst->flags |= MM_HASH_FLAGS_HASHSIZE_ISPOW2;

  /* Clear the whole destination table */
  dstentry = MM_HASH_ENTRYLIST( dst );
  if(clearentry)
  {
     for( hashpos = 0 ; hashpos < dst->hashsize ; hashpos++ )
     {
       clearentry( dst->context, dstentry );
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
  // mtMutexDestroy( &src->countmutex );

  page = dst->page;
  for( pageindex = dst->pagecount ; pageindex ; pageindex--, page++ )
  {
    mtMutexInit( &page->mutex );
    page->owner = 0;
  }
  mtMutexInit( &dst->globalmutex );
  // mtMutexInit( &dst->countmutex );
#endif

  /* Move all entries from the src table to the dst table */
  srcentry = MM_HASH_ENTRYLIST( src );

  if( dst->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
  {
  for( hashpos = 0 ; hashpos < src->hashsize ; hashpos++ )
  {
    if( access->entryvalid( src->context, srcentry ) ) // REVIEW:
    {
      // hashkey = access->entryvalid( src->context, srcentry ) ? access->entrykey( src->context, srcentry ) : 0;
      hashkey = access->entrykey( src->context, srcentry );
      dstkey = hashkey & dst->hashmask;
      /* Search an empty spot in the destination table */
      for( dstpos = dstkey ; ; dstpos = ( dstpos + 1 ) & dst->hashmask )
      {
        dstentry = MM_HASH_ENTRY( dst, dstpos );
        if( !( access->entryvalid( dst->context, dstentry ) ) )
          break;
      }

      if(srcentry == movedentry)
        *movedEntryPtr = dstentry;

      /* Copy entry from src table to dst table */
      memcpy( dstentry, srcentry, src->entrysize );
      } // REVIEW:
      srcentry = ADDRESS( srcentry, src->entrysize );
    }
  }
  else
  {
    for( hashpos = 0 ; hashpos < src->hashsize ; hashpos++ )
    {
      if( access->entryvalid( src->context, srcentry ) )
      {
        hashkey = access->entrykey( src->context, srcentry );
        dstkey = hashkey % dst->hashsize;
        /* Search an empty spot in the destination table */
        for( dstpos = dstkey ; ; )
        {
          dstentry = MM_HASH_ENTRY( dst, dstpos );
          if( !( access->entryvalid( dst->context, dstentry ) ) )
            break;
          dstpos++;
          if( dstpos == dst->hashsize )
            dstpos = 0;
        }

        if(srcentry == movedentry)
          *movedEntryPtr = dstentry;

        /* Copy entry from src table to dst table */
        memcpy( dstentry, srcentry, src->entrysize );
      }
      srcentry = ADDRESS( srcentry, src->entrysize );
    }
  }

#ifdef MM_HASH_DEBUG_STATISTICS
  dst->statentrycountmax = src->statentrycountmax;
  dst->statentrycount = src->statentrycount;
  dst->stataccesscount = src->stataccesscount;
  dst->statfindskipcount = src->statfindskipcount;
  dst->statdeletecount = src->statdeletecount;
  dst->statdelrewindcount = src->statdelrewindcount;
  dst->statrelocationcount = src->statrelocationcount;
#endif

  return;
}

/* Must be called while NO other thread will ever access the table for writing */
void mmHashListAll( void *hashtable, int (*list)( void *opaque, void *entry ), void *opaque )
{
  mmHashIndex hashkey;
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

mmHashIndex mmHashGetEntryCount( void *hashtable )
{
  mmHashIndex entrycount;
  mmHashTable *table;
  table = hashtable;
  entrycount = MM_HASH_ENTRYCOUNT_READ( table );
  return entrycount;
}

size_t mmHashGetMemoryUsage( void *hashtable )
{
  size_t tablesize, entrysize;
  mmHashTable *table;
  table = hashtable;
  tablesize = table->hashsize;
  entrysize = table->entrysize;
  return tablesize * entrysize;
}



////////////////////////////////////////////////////////////////////////////////



static int mmHashLockRangeTry( mmHashTable *table, const mmHashAccess *access, mmHashLock *hashlock, mmHashLockRange *lockrange, mmHashIndex hashkey )
{
  int newcount;
  mmHashIndex srckey;
  mmHashIndex pageindex, pagestart, pagefinal;
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
    srckey++;
    if( srckey == table->hashsize )
      srckey = 0;

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
    if( !( access->entryvalid( table->context, srcentry ) ) )
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
  mmHashIndex pageindex, pagestart, pagefinal;
  mmHashLockRange *lockrange;

  for( lockrange = hashlock->rangelist ; lockrange ; lockrange = lockrange->next )
  {
    if( lockrange->pagestart == ~(mmHashIndex)0x0 )
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
  mmHashIndex hashkey;
  mmHashTable *table;

  table = hashtable;

  /* Hash key of entry */
  hashkey = access->entrykey( table->context, entry );
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;

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



////////////////////////////////////////////////////////////////////////////////



void mmHashGlobalLockEnable( void *hashtable )
{
  mmHashIndex pageindex;
  mmHashTable *table;

  table = hashtable;
  MM_HASH_GLOBAL_LOCK( table );
  for( pageindex = 0 ; pageindex < table->pagecount ; pageindex++ )
    MM_HASH_LOCK_TRY_WRITE( table, pageindex );

  return;
}


void mmHashGlobalLockDisable( void *hashtable )
{
  mmHashIndex pageindex;
  mmHashTable *table;

  table = hashtable;
  for( pageindex = 0 ; pageindex < table->pagecount ; pageindex++ )
    MM_HASH_LOCK_DONE_WRITE( table, pageindex );
  MM_HASH_GLOBAL_UNLOCK( table );

  return;
}



////////////////////////////////////////////////////////////////////////////////



void mmHashDirectDebugDuplicate( void *hashtable, const mmHashAccess *access, void (*callback)( void *opaque, void *entry0, void *entry1 ), void *opaque )
{
  mmHashIndex hashbase, hashkey;
  void *baseentry, *entry;
  mmHashTable *table;

  table = hashtable;

  for( hashbase = 0 ; hashbase < table->hashsize ; hashbase++ )
  {
    baseentry = MM_HASH_ENTRY( table, hashbase );
    for( hashkey = hashbase ; ; )
    {
      hashkey++;
      if( hashkey == table->hashsize )
        hashkey = 0;
      entry = MM_HASH_ENTRY( table, hashkey );
      if( !( access->entryvalid( table->context, entry ) ) )
        break;
      if( access->entrycmp( table->context, entry, baseentry ) )
        callback( opaque, entry, baseentry );
    }
  }

  return;
}


void mmHashDirectDebugPages( void *hashtable )
{
  mmHashIndex pageindex;
  mmHashTable *table;
  mmHashPage *page;

  table = hashtable;

#ifdef MM_ATOMIC_SUPPORT
  page = table->page;
  for( pageindex = 0 ; pageindex < table->pagecount ; pageindex++, page++ )
  {
    if( ( page->lock.v.value ) || mmAtomicReadP( &page->owner ) )
      printf( "Page[%lld] = 0x%x ; %p\n", (long long)pageindex, page->lock.v.value, mmAtomicReadP( &page->owner ) );
  }
  fflush( stdout );
#endif

  return;
}


void mmHashDirectDebugContent( void *hashtable, void (*callback)( mmHashIndex hashkey, void *entry ) )
{
  mmHashIndex hashkey;
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



void mmHashGetStatistics( void *hashtable, long *accesscount, long *findskipcount, long *deletecount, long *delrewindcount, long *relocationcount, long *entrycount, long *entrycountmax, size_t *hashsize )
{
  mmHashTable *table;
  table = hashtable;
#if MM_HASH_DEBUG_STATISTICS
  if( accesscount )
    *accesscount = mmAtomicReadL( &table->stataccesscount );
  if( findskipcount )
    *findskipcount = mmAtomicReadL( &table->statfindskipcount );
  if( deletecount )
    *deletecount = mmAtomicReadL( &table->statdeletecount );
  if( delrewindcount )
    *delrewindcount = mmAtomicReadL( &table->statdelrewindcount );
  if( relocationcount )
    *relocationcount = mmAtomicReadL( &table->statrelocationcount );
  if( entrycount )
    *entrycount = mmAtomicReadL( &table->statentrycount );
  if( entrycountmax )
    *entrycountmax = table->statentrycountmax;
#else
  if( accesscount )
    *accesscount = 0;
  if( findskipcount )
    *findskipcount = 0;
  if( deletecount )
    *deletecount = 0;
  if( delrewindcount )
    *delrewindcount = 0;
  if( relocationcount )
    *relocationcount = 0;
  if( entrycount )
    *entrycount = MM_HASH_ENTRYCOUNT_READ( table );
  if( entrycountmax )
    *entrycountmax = 0;
#endif
  if( hashsize )
    *hashsize = table->hashsize;
  return;
}

void mmHashResetStatistics( void *hashtable )
{
#if MM_HASH_DEBUG_STATISTICS
  mmHashTable *table;
  table = hashtable;
  mmAtomicWriteL( &table->stataccesscount, 0 );
  mmAtomicWriteL( &table->statfindskipcount, 0 );
  mmAtomicWriteL( &table->statdeletecount, 0 );
  mmAtomicWriteL( &table->statrelocationcount, 0 );
  mmAtomicWriteL( &table->statdelrewindcount, 0 );
#endif
  return;
}

void mmHashPrintStatistics( void *hashtable )
{
  long statentrycount, stataccesscount, statfindskipcount, statdeletecount, statdelrewindcount, statrelocationcount;
  size_t stathashsize;
  printf( "-= Hash table statistics =-\n" );
  mmHashGetStatistics( hashtable, &stataccesscount, &statfindskipcount, &statdeletecount, &statdelrewindcount, &statrelocationcount, &statentrycount, 0, &stathashsize );
  printf( "  Hash size  : % 12ld\n", (long)stathashsize );
  printf( "  Entry count: % 12ld\n", statentrycount );
#if MM_HASH_DEBUG_STATISTICS
  printf( "  Access count    : % 12ld\n", stataccesscount );
  printf( "  Find skip count : % 12ld\n", statfindskipcount );
  printf( "  Delete count    : % 12ld\n", statdeletecount );
  printf( "  Del Rewind count: % 12ld\n", statdelrewindcount );
  printf( "  Relocation count: % 12ld\n", statrelocationcount );
#endif
  fflush( stdout );
  return;
}

double mmHashGetHealthScore( void *hashtable, const mmHashAccess *access )
{
  int startseqflag;
  mmHashIndex hashkey; //, entryhashkey;
  uint64_t totalentrycount, busysequence, startbusyseq;
  double healthscore, accumscore = 0, seqscore;
  size_t entrysize;
  void *entry;
  mmHashTable *table;

  totalentrycount = 0;
  busysequence = 0;
  startbusyseq = 0;
  startseqflag = 1;

  table = hashtable;
  entrysize = table->entrysize;
  entry = MM_HASH_ENTRYLIST( table );
  for( hashkey = 0 ; hashkey < table->hashsize ; hashkey++ )
  {
    if( access->entryvalid( table->context, entry ) )
    {
      totalentrycount++;
      busysequence++;
    }
    else
    {
      if( startseqflag )
      {
        startbusyseq = busysequence;
        startseqflag = 0;
      }
      else if( busysequence )
      {
        seqscore = 1.0 / (double)busysequence;
        accumscore += busysequence * sqrt( seqscore );
      }
      busysequence = 0;
    }
    entry = ADDRESS( entry, entrysize );
  }
  busysequence += startbusyseq;
  if( busysequence )
  {
    seqscore = 1.0 / (double)busysequence;
    accumscore += busysequence * sqrt( seqscore );
  }

  if( !totalentrycount )
    return 1.0;
  healthscore = sqrt( accumscore / (double)totalentrycount );
  return healthscore;
}

void mmHashPrintHealth( void *hashtable, const mmHashAccess *access )
{
  int startfreeseqflag, startbusyseqflag;
  mmHashIndex hashkey, entryhashkey, hashdistance;
  uint64_t totalentrycount, totaldistance, totalhashidealplace, worstdistance, maxfreesequence, maxbusysequence;
  uint64_t freesequence, busysequence, startfreeseq, startbusyseq;
  double healthscore, accumscore = 0, seqscore;
  size_t entrysize;
  void *entry;
  mmHashTable *table;

  totalentrycount = 0;
  totaldistance = 0;
  totalhashidealplace = 0;
  worstdistance = 0;
  maxfreesequence = 0;
  maxbusysequence = 0;
  accumscore = 0.0;

  freesequence = 0;
  busysequence = 0;
  startfreeseq = 0;
  startbusyseq = 0;
  startfreeseqflag = 1;
  startbusyseqflag = 1;

  table = hashtable;
  entrysize = table->entrysize;
  entry = MM_HASH_ENTRYLIST( table );
  for( hashkey = 0 ; hashkey < table->hashsize ; hashkey++ )
  {
    if( access->entryvalid( table->context, entry ) )
    {
      totalentrycount++;
      entryhashkey = access->entrykey( table->context, entry ) % table->hashsize;
      if( entryhashkey <= hashkey )
        hashdistance = hashkey - entryhashkey;
      else
        hashdistance = table->hashsize - ( entryhashkey - hashkey );
      totaldistance += hashdistance;
      if( hashdistance == 0 )
        totalhashidealplace++;
      if( hashdistance > worstdistance )
        worstdistance = hashdistance;
      if( startfreeseqflag )
      {
        startfreeseq = freesequence;
        startfreeseqflag = 0;
      }
      if( freesequence > maxfreesequence )
        maxfreesequence = freesequence;
      freesequence = 0;
      busysequence++;
    }
    else
    {
      if( startbusyseqflag )
      {
        startbusyseq = busysequence;
        startbusyseqflag = 0;
      }
      else if( busysequence )
      {
        seqscore = 1.0 / (double)busysequence;
        accumscore += busysequence * sqrt( seqscore );
      }
      if( busysequence > maxbusysequence )
        maxbusysequence = busysequence;
      busysequence = 0;
      freesequence++;
    }
    entry = ADDRESS( entry, entrysize );
  }
  busysequence += startbusyseq;
  freesequence += startfreeseq;
  if( busysequence )
  {
    seqscore = 1.0 / (double)busysequence;
    accumscore += busysequence * sqrt( seqscore );
  }
  if( busysequence > maxbusysequence )
    maxbusysequence = busysequence;
  if( freesequence > maxfreesequence )
    maxfreesequence = freesequence;

  if( !totalentrycount )
    return;

  healthscore = sqrt( accumscore / (double)totalentrycount );

  printf( "-* Hash table health report *-\n" );
  printf( "  Hash size  : % 12ld\n", (long)table->hashsize );
  printf( "  Entry count: %lld (%lld ~ %lld)\n", (long long)totalentrycount, (long long)MM_HASH_ENTRYCOUNT_READ( table ), (long long)mmAtomicReadL( &table->statentrycount ) );
  printf( "  Occupancy: %.2f %%\n", 100.0 * (double)totalentrycount / (double)table->hashsize );
  printf( "  Hash ideal placement: %.2f %%\n", 100.0 * (double)totalhashidealplace / (double)totalentrycount );
  printf( "  Placement average distance: %.2f\n", (double)totaldistance / (double)totalentrycount );
  printf( "  Worst hash distance: %ld entries away\n", (long)worstdistance );
  printf( "  Max busy sequence: %ld entries\n", (long)maxbusysequence );
  printf( "  Max free sequence: %ld entries\n", (long)maxfreesequence );
  printf( "  Health score: %.4f\n", healthscore );
  fflush( stdout );

  return;
}


