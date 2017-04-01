/* *****************************************************************************
 * Copyright (c) 2007-2015 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/

/*

Input preprocessor symbols

#define HASH_CLEARENTRY SomeFunction
#define HASH_ENTRYVALID SomeFunction
#define HASH_ENTRYKEY SomeFunction
#define HASH_ENTRYCMP SomeFunction
#define HASH_ENTRYLIST SomeFunction
#define HASH_SIZEOFENTRY sizeof(EntrStruct)

#define HASH_DECLARE_DIRECTFINDENTRY MyFunctionFindEntry
#define HASH_DECLARE_DIRECTLISTENTRY MyFunctionListEntry
#define HASH_DECLARE_DIRECTREADENTRY MyFunctionReadEntry
#define HASH_DECLARE_DIRECTCALLENTRY MyFunctionCallEntry
#define HASH_DECLARE_DIRECTREPLACEENTRY MyFunctionReplaceEntry
#define HASH_DECLARE_DIRECTADDENTRY MyFunctionAddEntry
#define HASH_DECLARE_DIRECTADDRETENTRY MyFunctionAddRetEntry
#define HASH_DECLARE_DIRECTREADORADDENTRY MyFunctionReadOrAddEntry
#define HASH_DECLARE_DIRECTDELETEENTRY MyFunctionDeleteEntry

Inlined function prototypes:
 void clearentry( void *entry );
 int entryvalid( void *entry );
 uint32_t entrykey( void *entry );
 int entrycmp( void *entry, void *entryref );
 int entrylist( void *opaque, void *entry, void *entryref );

*/


#include "mmhashinternal.h"


////


#ifdef HASH_DECLARE_DIRECTFINDENTRY

void *HASH_DECLARE_DIRECTFINDENTRY( void *hashtable, void *findentry )
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
  hashkey = HASH_ENTRYKEY( findentry ) & table->hashmask;

  /* Search the entry */
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    cmpvalue = HASH_ENTRYCMP( entry, findentry );
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

#endif


#ifdef HASH_DECLARE_DIRECTLISTENTRY

void HASH_DECLARE_DIRECTLISTENTRY( void *hashtable, void *listentry, void *opaque )
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
  hashkey = HASH_ENTRYKEY( listentry ) & table->hashmask;

  /* Search the entry */
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    cmpvalue = HASH_ENTRYLIST( opaque, entry, listentry );
    if( cmpvalue == MM_HASH_ENTRYLIST_BREAK )
      break;
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  return;
}

#endif


#ifdef HASH_DECLARE_DIRECTREADENTRY

int HASH_DECLARE_DIRECTREADENTRY( void *hashtable, void *readentry )
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
  hashkey = HASH_ENTRYKEY( readentry ) & table->hashmask;

  /* Search the entry */
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    cmpvalue = HASH_ENTRYCMP( entry, readentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
#ifdef HASH_SIZEOFENTRY
      memcpy( readentry, entry, HASH_SIZEOFENTRY );
#else
      memcpy( readentry, entry, table->entrysize );
#endif
      return MM_HASH_SUCCESS;
    }
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  return MM_HASH_FAILURE;
}

#endif


#ifdef HASH_DECLARE_DIRECTCALLENTRY

int HASH_DECLARE_DIRECTCALLENTRY( void *hashtable, void *callentry, void (*callback)( void *opaque, void *entry, int newflag ), void *opaque, int addflag )
{
  int cmpvalue;
  uint32_t hashkey, entrycount;
  void *entry;
  mmHashTable *table;

  table = hashtable;

  /* Hash key of entry */
  hashkey = HASH_ENTRYKEY( callentry ) & table->hashmask;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Search an available entry */
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    cmpvalue = HASH_ENTRYCMP( entry, callentry );
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
#ifdef HASH_SIZEOFENTRY
  memcpy( entry, callentry, HASH_SIZEOFENTRY );
#else
  memcpy( entry, callentry, table->entrysize );
#endif
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

#endif


#ifdef HASH_DECLARE_DIRECTREPLACEENTRY

int HASH_DECLARE_DIRECTREPLACEENTRY( void *hashtable, void *replaceentry, int addflag )
{
  int cmpvalue;
  uint32_t hashkey, entrycount;
  void *entry;
  mmHashTable *table;

  table = hashtable;

  /* Hash key of entry */
  hashkey = HASH_ENTRYKEY( replaceentry ) & table->hashmask;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Search an available entry */
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    cmpvalue = HASH_ENTRYCMP( entry, replaceentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
#ifdef HASH_SIZEOFENTRY
      memcpy( entry, replaceentry, HASH_SIZEOFENTRY );
#else
      memcpy( entry, replaceentry, table->entrysize );
#endif
      return MM_HASH_SUCCESS;
    }
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  if( !( addflag ) )
    return MM_HASH_FAILURE;

  /* Store new entry */
#ifdef HASH_SIZEOFENTRY
  memcpy( entry, replaceentry, HASH_SIZEOFENTRY );
#else
  memcpy( entry, replaceentry, HASH_SIZEOFENTRY );
#endif

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

#endif


#ifdef HASH_DECLARE_DIRECTADDENTRY

int HASH_DECLARE_DIRECTADDENTRY( void *hashtable, void *addentry, int nodupflag )
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
  hashkey = HASH_ENTRYKEY( addentry ) & table->hashmask;

  /* Search an available entry */
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    /* Do we allow duplicate entries? */
    if( nodupflag )
    {
      cmpvalue = HASH_ENTRYCMP( entry, addentry );
      if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
        break;
      else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
        return MM_HASH_FAILURE;
    }
    else
    {
      if( !( HASH_ENTRYVALID( entry ) ) )
        break;
    }
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  /* Store new entry */
#ifdef HASH_SIZEOFENTRY
  memcpy( entry, addentry, HASH_SIZEOFENTRY );
#else
  memcpy( entry, addentry, table->entrysize );
#endif

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

#endif


#ifdef HASH_DECLARE_DIRECTADDRETENTRY

void *HASH_DECLARE_DIRECTADDRETENTRY( void *hashtable, void *addentry, int nodupflag )
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
  hashkey = HASH_ENTRYKEY( addentry ) & table->hashmask;

  /* Search an available entry */
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    /* Do we allow duplicate entries? */
    if( nodupflag )
    {
      cmpvalue = HASH_ENTRYCMP( entry, addentry );
      if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
        break;
      else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
        return 0;
    }
    else
    {
      if( !( HASH_ENTRYVALID( entry ) ) )
        break;
    }
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  /* Store new entry */
#ifdef HASH_SIZEOFENTRY
  memcpy( entry, addentry, HASH_SIZEOFENTRY );
#else
  memcpy( entry, addentry, table->entrysize );
#endif

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

  return entry;
}

#endif


#ifdef HASH_DECLARE_DIRECTREADORADDENTRY

int HASH_DECLARE_DIRECTREADORADDENTRY( void *hashtable, void *readaddentry, int *retreadflag )
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
  hashkey = HASH_ENTRYKEY( readaddentry ) & table->hashmask;

  /* Search an available entry */
  *retreadflag = 0;
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    cmpvalue = HASH_ENTRYCMP( entry, readaddentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
    {
#ifdef HASH_SIZEOFENTRY
      memcpy( readaddentry, entry, HASH_SIZEOFENTRY );
#else
      memcpy( readaddentry, entry, table->entrysize );
#endif
      *retreadflag = 1;
      return MM_HASH_SUCCESS;
    }
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  /* Store new entry */
#ifdef HASH_SIZEOFENTRY
  memcpy( entry, readaddentry, HASH_SIZEOFENTRY );
#else
  memcpy( entry, readaddentry, table->entrysize );
#endif

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

#endif


#ifdef HASH_DECLARE_DIRECTDELETEENTRY

int HASH_DECLARE_DIRECTDELETEENTRY( void *hashtable, void *deleteentry, int readflag )
{
  int cmpvalue;
  uint32_t hashkey, srckey, srcpos, targetpos = 0, targetkey, entrycount;
  uint32_t delbase;
  void *entry, *srcentry, *targetentry;
  mmHashTable *table;

  table = hashtable;

#ifdef MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->accesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = HASH_ENTRYKEY( deleteentry ) & table->hashmask;

  /* Search the entry */
  for( ; ; hashkey = ( hashkey + 1 ) & table->hashmask )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    cmpvalue = HASH_ENTRYCMP( entry, deleteentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      return MM_HASH_FAILURE;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
      break;
#ifdef MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->collisioncount, 1 );
#endif
  }

  if( readflag )
  {
#ifdef HASH_SIZEOFENTRY
    memcpy( deleteentry, entry, HASH_SIZEOFENTRY );
#else
    memcpy( deleteentry, entry, table->entrysize );
#endif
  }

  for( delbase = hashkey ; ; )
  {
    delbase = ( delbase - 1 ) & table->hashmask;
#ifdef HASH_SIZEOFENTRY
    if( !( HASH_ENTRYVALID( MM_HASH_INLINE_ENTRY( table, delbase, HASH_SIZEOFENTRY ) ) ) )
      break;
#else
    if( !( HASH_ENTRYVALID( MM_HASH_ENTRY( table, delbase ) ) ) )
      break;
#endif
  }
  delbase = ( delbase + 1 ) & table->hashmask;

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
#ifdef HASH_SIZEOFENTRY
      srcentry = MM_HASH_INLINE_ENTRY( table, srcpos, HASH_SIZEOFENTRY );
#else
      srcentry = MM_HASH_ENTRY( table, srcpos );
#endif
      if( !( HASH_ENTRYVALID( srcentry ) ) )
        break;
      srckey = HASH_ENTRYKEY( srcentry ) & table->hashmask;

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
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    if( !( targetentry ) )
    {
      HASH_CLEARENTRY( entry );
      break;
    }

    /* Move entry in place and continue the repair process */
#ifdef HASH_SIZEOFENTRY
    memcpy( entry, targetentry, HASH_SIZEOFENTRY );
#else
    memcpy( entry, targetentry, table->entrysize );
#endif

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

#endif


////


