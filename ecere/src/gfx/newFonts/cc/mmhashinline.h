/* *****************************************************************************
 * Copyright (c) 2009-2023 Alexis Naveros.
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
#define HASH_HASHSIZE_IS_POW2 (1) // Very optional, hashsize is guaranteed to be a power of two

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
 void clearentry( void *context, void *entry );
 int entryvalid( void *context, void *entry );
 mmHashIndex entrykey( void *context, void *entry );
 int entrycmp( void *context, void *entry, void *entryref );
 int entrylist( void *context, void *opaque, void *entry, void *entryref );

*/


#include "mmhashinternal.h"


////


#ifdef HASH_DECLARE_DIRECTFINDENTRY

void *HASH_DECLARE_DIRECTFINDENTRY( void *hashtable, void *findentry )
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
  hashkey = HASH_ENTRYKEY( table->context, findentry );
#if HASH_HASHSIZE_IS_POW2
  hashkey &= table->hashmask;
#else
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;
#endif

  /* Search the entry */
  for( ; ; )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    cmpvalue = HASH_ENTRYCMP( table->context, entry, findentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      break;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
      return entry;
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
#if HASH_HASHSIZE_IS_POW2
    hashkey = ( hashkey + 1 ) & table->hashmask;
#else
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
#endif
  }

  return 0;
}

#endif


#ifdef HASH_DECLARE_DIRECTLISTENTRY

void HASH_DECLARE_DIRECTLISTENTRY( void *hashtable, void *listentry, void *opaque )
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
  hashkey = HASH_ENTRYKEY( table->context, listentry );
#if HASH_HASHSIZE_IS_POW2
  hashkey &= table->hashmask;
#else
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey = %= table->hashsize;
#endif

  /* Search the entry */
  for( ; ; )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    cmpvalue = HASH_ENTRYLIST( table->context, opaque, entry, listentry );
    if( cmpvalue == MM_HASH_ENTRYLIST_BREAK )
      break;
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
#if HASH_HASHSIZE_IS_POW2
    hashkey = ( hashkey + 1 ) & table->hashmask;
#else
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
#endif
  }

  return;
}

#endif


#ifdef HASH_DECLARE_DIRECTREADENTRY

int HASH_DECLARE_DIRECTREADENTRY( void *hashtable, void *readentry )
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
  hashkey = HASH_ENTRYKEY( table->context, readentry );
#if HASH_HASHSIZE_IS_POW2
  hashkey &= table->hashmask;
#else
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;
#endif

  /* Search the entry */
  for( ; ; )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    cmpvalue = HASH_ENTRYCMP( table->context, entry, readentry );
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
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
#if HASH_HASHSIZE_IS_POW2
    hashkey = ( hashkey + 1 ) & table->hashmask;
#else
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
#endif
  }

  return MM_HASH_FAILURE;
}

#endif


#ifdef HASH_DECLARE_DIRECTCALLENTRY

int HASH_DECLARE_DIRECTCALLENTRY( void *hashtable, void *callentry, void (*callback)( void *opaque, void *entry, int newflag ), void *opaque, int addflag )
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
  hashkey = HASH_ENTRYKEY( table->context, callentry );
#if HASH_HASHSIZE_IS_POW2
  hashkey &= table->hashmask;
#else
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;
#endif

  /* Search the entry */
  for( ; ; )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    cmpvalue = HASH_ENTRYCMP( table->context, entry, callentry );
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
#if HASH_HASHSIZE_IS_POW2
    hashkey = ( hashkey + 1 ) & table->hashmask;
#else
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
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

#if MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->statentrycountmax )
    table->statentrycountmax = statentrycount;
#endif

  return MM_HASH_SUCCESS;
}

#endif


#ifdef HASH_DECLARE_DIRECTREPLACEENTRY

int HASH_DECLARE_DIRECTREPLACEENTRY( void *hashtable, void *replaceentry, int addflag )
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
  hashkey = HASH_ENTRYKEY( table->context, replaceentry );
#if HASH_HASHSIZE_IS_POW2
  hashkey &= table->hashmask;
#else
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;
#endif

  /* Search an available entry */
  for( ; ; )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    cmpvalue = HASH_ENTRYCMP( table->context, entry, replaceentry );
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
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
#if HASH_HASHSIZE_IS_POW2
    hashkey = ( hashkey + 1 ) & table->hashmask;
#else
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
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

#if MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->statentrycountmax )
    table->statentrycountmax = statentrycount;
#endif

  return MM_HASH_SUCCESS;
}

#endif


#ifdef HASH_DECLARE_DIRECTADDENTRY

int HASH_DECLARE_DIRECTADDENTRY( void *hashtable, void *addentry, int nodupflag )
{
  int cmpvalue;
  mmHashIndex hashkey, entrycount;
  void *entry;
  mmHashTable *table;

  table = hashtable;

  // int hs = table->hashsize;
  // printf("Hash Size: %d\n", hs);

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = HASH_ENTRYKEY( table->context, addentry );
#if HASH_HASHSIZE_IS_POW2
  hashkey &= table->hashmask;
#else
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;
#endif

  /* Search an available entry */
  for( ; ; )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    /* Do we allow duplicate entries? */
    if( nodupflag )
    {
      cmpvalue = HASH_ENTRYCMP( table->context, entry, addentry );
      if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
        break;
      else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
        return MM_HASH_FAILURE;
    }
    else
    {
      if( !( HASH_ENTRYVALID( table->context, entry ) ) )
        break;
    }
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
#if HASH_HASHSIZE_IS_POW2
    hashkey = ( hashkey + 1 ) & table->hashmask;
#else
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
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

#if MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->statentrycountmax )
    table->statentrycountmax = statentrycount;
#endif

   //if(table->hashsize != hs)
      //printf("BIG BUG!\n");

  return MM_HASH_SUCCESS;
}

#endif


#ifdef HASH_DECLARE_DIRECTADDRETENTRY

void *HASH_DECLARE_DIRECTADDRETENTRY( void *hashtable, void *addentry, int nodupflag )
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
  hashkey = HASH_ENTRYKEY( table->context, addentry );
#if HASH_HASHSIZE_IS_POW2
  hashkey &= table->hashmask;
#else
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;
#endif

  /* Search an available entry */
  for( ; ; )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    /* Do we allow duplicate entries? */
    if( nodupflag )
    {
      cmpvalue = HASH_ENTRYCMP( table->context, entry, addentry );
      if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
        break;
      else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
        return 0;
    }
    else
    {
      if( !( HASH_ENTRYVALID( table->context, entry ) ) )
        break;
    }
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
#if HASH_HASHSIZE_IS_POW2
    hashkey = ( hashkey + 1 ) & table->hashmask;
#else
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
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

#if MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->statentrycountmax )
    table->statentrycountmax = statentrycount;
#endif

  return entry;
}

#endif


#ifdef HASH_DECLARE_DIRECTREADORADDENTRY

int HASH_DECLARE_DIRECTREADORADDENTRY( void *hashtable, void *readaddentry, int *retreadflag )
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
  hashkey = HASH_ENTRYKEY( table->context, readaddentry );
#if HASH_HASHSIZE_IS_POW2
  hashkey &= table->hashmask;
#else
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;
#endif

  /* Search an available entry */
  *retreadflag = 0;
  for( ; ; )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    cmpvalue = HASH_ENTRYCMP( table->context, entry, readaddentry );
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
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
#if HASH_HASHSIZE_IS_POW2
    hashkey = ( hashkey + 1 ) & table->hashmask;
#else
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
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

#if MM_HASH_DEBUG_STATISTICS
  int statentrycount = mmAtomicAddReadL( &table->statentrycount, 1 );
  if( statentrycount > table->statentrycountmax )
    table->statentrycountmax = statentrycount;
#endif

  return MM_HASH_SUCCESS;
}

#endif


#ifdef HASH_DECLARE_DIRECTDELETEENTRY

int HASH_DECLARE_DIRECTDELETEENTRY( void *hashtable, void *deleteentry, int readflag )
{
  int cmpvalue;
  mmHashIndex hashkey, srckey, srcpos, targetpos, targetkey, entrycount;
  mmHashIndex delbase;
  void *entry, *srcentry, *targetentry;
  mmHashTable *table;

  table = hashtable;

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->stataccesscount, 1 );
#endif

  /* Hash key of entry */
  hashkey = HASH_ENTRYKEY( table->context, deleteentry );
#if HASH_HASHSIZE_IS_POW2
  hashkey &= table->hashmask;
#else
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
    hashkey &= table->hashmask;
  else
    hashkey %= table->hashsize;
#endif

  /* Search the entry */
  for( ; ; )
  {
#ifdef HASH_SIZEOFENTRY
    entry = MM_HASH_INLINE_ENTRY( table, hashkey, HASH_SIZEOFENTRY );
#else
    entry = MM_HASH_ENTRY( table, hashkey );
#endif
    cmpvalue = HASH_ENTRYCMP( table->context, entry, deleteentry );
    if( cmpvalue == MM_HASH_ENTRYCMP_INVALID )
      return MM_HASH_FAILURE;
    else if( cmpvalue == MM_HASH_ENTRYCMP_FOUND )
      break;
#if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statfindskipcount, 1 );
#endif
#if HASH_HASHSIZE_IS_POW2
    hashkey = ( hashkey + 1 ) & table->hashmask;
#else
    hashkey++;
    if( hashkey == table->hashsize )
      hashkey = 0;
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

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->statdeletecount, 1 );
#endif

#if HASH_HASHSIZE_IS_POW2
  for( delbase = hashkey ; ; )
  {
    delbase = ( delbase - 1 ) & table->hashmask;
 #ifdef HASH_SIZEOFENTRY
    if( !( HASH_ENTRYVALID( table->context, MM_HASH_INLINE_ENTRY( table, delbase, HASH_SIZEOFENTRY ) ) ) )
      break;
 #else
    if( !( HASH_ENTRYVALID( table->context, MM_HASH_ENTRY( table, delbase ) ) ) )
      break;
 #endif
 #if MM_HASH_DEBUG_STATISTICS
    mmAtomicAddL( &table->statdelrewindcount, 1 );
 #endif
  }
  delbase = ( delbase + 1 ) & table->hashmask;
#else
  if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
  {
    for( delbase = hashkey ; ; )
    {
      delbase = ( delbase - 1 ) & table->hashmask;
 #ifdef HASH_SIZEOFENTRY
      if( !( HASH_ENTRYVALID( table->context, MM_HASH_INLINE_ENTRY( table, delbase, HASH_SIZEOFENTRY ) ) ) )
        break;
 #else
      if( !( HASH_ENTRYVALID( table->context, MM_HASH_ENTRY( table, delbase ) ) ) )
        break;
 #endif
 #if MM_HASH_DEBUG_STATISTICS
      mmAtomicAddL( &table->statdelrewindcount, 1 );
 #endif
    }
    delbase = ( delbase + 1 ) & table->hashmask;
  }
  else
  {
    for( delbase = hashkey ; ; )
    {
      if( delbase == 0 )
        delbase = table->hashsize;
      delbase--;
 #ifdef HASH_SIZEOFENTRY
      if( !( HASH_ENTRYVALID( table->context, MM_HASH_INLINE_ENTRY( table, delbase, HASH_SIZEOFENTRY ) ) ) )
        break;
 #else
      if( !( HASH_ENTRYVALID( table->context, MM_HASH_ENTRY( table, delbase ) ) ) )
        break;
 #endif
 #if MM_HASH_DEBUG_STATISTICS
      mmAtomicAddL( &table->statdelrewindcount, 1 );
 #endif
    }
    delbase++;
    if( delbase == table->hashsize )
      delbase = 0;
  }
#endif

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
#ifdef HASH_SIZEOFENTRY
      srcentry = MM_HASH_INLINE_ENTRY( table, srcpos, HASH_SIZEOFENTRY );
#else
      srcentry = MM_HASH_ENTRY( table, srcpos );
#endif
      if( !( HASH_ENTRYVALID( table->context, srcentry ) ) )
        break;
#if HASH_HASHSIZE_IS_POW2
      srckey = HASH_ENTRYKEY( table->context, srcentry ) & table->hashmask;
#else
      if( table->flags & MM_HASH_FLAGS_HASHSIZE_ISPOW2 )
        srckey = HASH_ENTRYKEY( table->context, srcentry ) & table->hashmask;
      else
        srckey = HASH_ENTRYKEY( table->context, srcentry ) % table->hashsize;
#endif

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
    if( !targetentry )
    {
      HASH_CLEARENTRY( table->context, entry );
      break;
    }

    /* Move entry in place and continue the repair process */
#ifdef HASH_SIZEOFENTRY
    memcpy( entry, targetentry, HASH_SIZEOFENTRY );
#else
    memcpy( entry, targetentry, table->entrysize );
#endif

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
  }

#if MM_HASH_DEBUG_STATISTICS
  mmAtomicAddL( &table->statentrycount, -1 );
#endif

  return MM_HASH_SUCCESS;
}

#endif


////


