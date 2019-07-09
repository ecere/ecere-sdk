/* *****************************************************************************
 * Copyright (c) 2007-2015 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/

#ifndef MMHASHINTERNAL_H
#define MMHASHINTERNAL_H


////

#if !defined(MM_ATOMIC_SUPPORT) && !defined(__EMSCRIPTEN__) && !defined(__ANDROID__)
 #warning WARNING: Compiling mmhash without atomic support
#endif


typedef struct
{
#ifdef MM_ATOMIC_SUPPORT
  /* Powerful atomic read/write lock */
  mmAtomicLock32 lock;
  mmAtomicP owner;
#else
  /* Mutex, or how to ruin performance */
  mtMutex mutex;
  void *owner;
#endif
} mmHashPage MM_CACHE_ALIGN;

typedef struct
{
  uint32_t status;
  uint32_t flags;
  size_t entrysize;

  /* Page locks */
  uint32_t pageshift;
  uint32_t pagecount;
  uint32_t pagemask;
  mmHashPage *page;

  /* Hash size */
  uint32_t minhashbits;
  uint32_t hashbits;
  uint32_t hashsize;
  uint32_t hashmask;

  /* Entry count tracking if hash table is dynamic */
#ifdef MM_ATOMIC_SUPPORT
  mmAtomic32 entrycount;
#else
  mtMutex countmutex;
  uint32_t entrycount;
#endif
  uint32_t lowcount;
  uint32_t highcount;

  /* Global lock as the final word to resolve fighting between threads trying to access the same entry */
  char paddingA[64];
#ifdef MM_ATOMIC_SUPPORT
  mmAtomic32 globallock;
#else
  mtMutex globalmutex;
#endif
  char paddingB[64];

#ifdef MM_HASH_DEBUG_STATISTICS
  long entrycountmax;
  mmAtomicL statentrycount;
  mmAtomicL accesscount;
  mmAtomicL collisioncount;
  mmAtomicL relocationcount;
#endif

} mmHashTable;


#define MM_HASH_ATOMIC_TRYCOUNT (16)

#define MM_HASH_SIZEOF_ALIGN16(x) ((sizeof(x)+0xF)&~0xF)
#define MM_HASH_SIZEOF_ALIGN64(x) ((sizeof(x)+0x3F)&~0x3F)
#define MM_HASH_ALIGN64(x) ((x+0x3F)&~0x3F)
#define MM_HASH_ENTRYLIST(table) (void *)ADDRESS(table,MM_HASH_SIZEOF_ALIGN64(mmHashTable))
#define MM_HASH_ENTRY(table,index) (void *)ADDRESS(table,MM_HASH_SIZEOF_ALIGN64(mmHashTable)+((index)*(table)->entrysize))
#define MM_HASH_HASHKEY(table,entry) (((size_t)((char *)entry - (char *)table) - MM_HASH_SIZEOF_ALIGN64(mmHashTable))/(table)->entrysize)
#define MM_HASH_PAGELIST(table) (void *)ADDRESS(table,MM_HASH_ALIGN64(MM_HASH_SIZEOF_ALIGN64(mmHashTable)+((table)->hashsize*(table)->entrysize)))

#define MM_HASH_INLINE_ENTRY(table,index,size) (void *)ADDRESS(table,MM_HASH_SIZEOF_ALIGN64(mmHashTable)+((index)*(size)))


////


#ifdef MM_ATOMIC_SUPPORT

 #define MM_HASH_LOCK_TRY_READ(t,p) (mmAtomicLockTryRead32(&t->page[p].lock,MM_HASH_ATOMIC_TRYCOUNT))
 #define MM_HASH_LOCK_TRY_WRITE(t,p) (mmAtomicLockTryWrite32(&t->page[p].lock,MM_HASH_ATOMIC_TRYCOUNT))
 #define MM_HASH_LOCK_DONE_READ(t,p) (mmAtomicLockDoneRead32(&t->page[p].lock))
 #define MM_HASH_LOCK_DONE_WRITE(t,p) (mmAtomicLockDoneWrite32(&t->page[p].lock))
 #define MM_HASH_GLOBAL_LOCK(t) (mmAtomicSpin32(&t->globallock,0x0,0x1))
 #define MM_HASH_GLOBAL_UNLOCK(t) (mmAtomicWrite32(&t->globallock,0x0))
 #define MM_HASH_ENTRYCOUNT_ADD_READ(t,c) (mmAtomicAddRead32(&table->entrycount,c))

#else

 #define MM_HASH_LOCK_TRY_READ(t,p) (mtMutexTryLock(&t->page[p].mutex))
 #define MM_HASH_LOCK_TRY_WRITE(t,p) (mtMutexTryLock(&t->page[p].mutex))
 #define MM_HASH_LOCK_DONE_READ(t,p) mtMutexUnlock(&t->page[p].mutex)
 #define MM_HASH_LOCK_DONE_WRITE(t,p) mtMutexUnlock(&t->page[p].mutex)
 #define MM_HASH_GLOBAL_LOCK(t) mtMutexLock(&t->globalmutex)
 #define MM_HASH_GLOBAL_UNLOCK(t) mtMutexUnlock(&t->globalmutex)

static inline uint32_t MM_HASH_ENTRYCOUNT_ADD_READ( mmHashTable *t, int32_t c )
{
  uint32_t entrycount;
  mtMutexLock( &t->countmutex );
  t->entrycount += c;
  entrycount = t->entrycount;
  mtMutexUnlock( &t->countmutex );
  return entrycount;
}

#endif


////


#endif

