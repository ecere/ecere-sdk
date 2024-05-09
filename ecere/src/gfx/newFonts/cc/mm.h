/* *****************************************************************************
 * Copyright (c) 2007-2023 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
/**
 * @file
 *
 * Global memory management header.
 */


#ifndef MM_H
#define MM_H


////


#ifdef __cplusplus
extern "C" {
#endif


#include <stdio.h>

#include "mmcore.h"


/* __FILE__ and __LINE__ are passed as hidden arguments, and propagated down the stack */
/* All malloc/free is buffered, recorded and checked with guard bytes, mmListUses() can list allocations */
#define MM_DEBUG (0)

/* If MM_ALLOC_CHECK is enabled, any failed malloc/realloc will print a message on stderr */
#define MM_ALLOC_CHECK (1)

/* Only if MM_DEBUG_TRACK is enabled, guard bytes per chunk */
#define MM_DEBUG_GUARD_BYTES (32)
/* Only if MM_DEBUG_TRACK is enabled, enable to put each allocation in its own mmap() */
#define MM_DEBUG_MMAP (0)


////


#if defined(__linux__) || defined(__gnu_linux__) || defined(__linux) || defined(__linux)
 #define MM_LINUX (1)
 #define MM_UNIX (1)
#elif defined(__APPLE__)
 #define MM_OSX (1)
 #define MM_UNIX (1)
#elif defined(__unix__) || defined(__unix) || defined(unix)
 #define MM_UNIX (1)
#elif defined(_WIN64) || defined(__WIN64__) || defined(WIN64)
 #define MM_WIN64 (1)
 #define MM_WIN32 (1)
 #define MM_WINDOWS (1)
#elif defined(_WIN32) || defined(__WIN32__) || defined(WIN32)
 #define MM_WIN32 (1)
 #define MM_WINDOWS (1)
#endif

#if defined(__ANDROID__)
 #define MM_ANDROID (1)
#endif

#if __MINGW64__
 #define MM_MINGW32 (1)
 #define MM_MINGW64 (1)
#elif __MINGW32__
 #define MM_MINGW32 (1)
#endif

#if defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__x86_64) || defined(_M_X64) || defined(_M_AMD64)
 #define MM_ARCH_AMD64 (1)
#endif
#if defined(i386) || defined(__i386) || defined(__i386__) || defined(__i386) || defined(__IA32__) || defined(_M_IX86) || defined(__X86__) || defined(_X86_)
 #define MM_ARCH_IA32 (1)
#endif
#if defined(__arm__) || defined(_ARM) || defined(_M_ARM) || defined(__arm)
 #define MM_ARCH_ARM (1)
#endif
#if defined(__aarch64__)
 #define MM_ARCH_ARM64 (1)
#endif

#if defined(__ARM_NEON) || defined(__ARM_NEON__)
 #define MM_CAP_NEON (1)
#endif
#if ( defined(__SSE2__) || defined(_M_X64) || (defined(_M_IX86_FP) && _M_IX86_FP >= 2) )
 #define MM_CAP_SSE2 (1)
#endif
#if ( defined(__SSE__) || defined(_M_X64) || (defined(_M_IX86_FP) && _M_IX86_FP >= 1) )
 #define MM_CAP_SSE (1)
#endif
#if __AVX__
 #define MM_CAP_AVX (1)
#endif
#if __AVX2__
 #define MM_CAP_AVX2 (1)
#endif


////


#if !MM_UNIX
 #undef MM_DEBUG_MMAP
 #define MM_DEBUG_MMAP (0)
#endif


#ifndef CPUCONF_CACHE_LINE_SIZE
 #define CPUCONF_CACHE_LINE_SIZE (64)
#endif


#if defined(__GNUC__) || defined(__INTEL_COMPILER) || defined(__clang__)
 #define MM_CACHE_ALIGN __attribute__((aligned(CPUCONF_CACHE_LINE_SIZE)))
 #define MM_RESTRICT __restrict
 #define MM_NOINLINE __attribute__((noinline))
 #define MM_ALWAYSINLINE __attribute__((always_inline))
 #define MM_ALIGN8 __attribute__((aligned(8)))
 #define MM_ALIGN16 __attribute__((aligned(16)))
 #define MM_ALIGN32 __attribute__((aligned(32)))
 #define MM_ALIGN64 __attribute__((aligned(64)))
 #define MM_ALIGNED8(p) __builtin_assume_aligned(p,8)
 #define MM_ALIGNED16(p) __builtin_assume_aligned(p,16)
 #define MM_ALIGNED32(p) __builtin_assume_aligned(p,32)
 #define MM_ALIGNED64(p) __builtin_assume_aligned(p,64)
 #if MM_ARCH_AMD64 || MM_ARCH_IA32
  #define MM_PACKED_SAFE __attribute__((packed))
 #else
  #define MM_PACKED_SAFE
 #endif
#elif defined(_MSC_VER)
 #define MM_CACHE_ALIGN __declspec(align(64))
 #define MM_RESTRICT __restrict
 #define MM_NOINLINE __declspec(noinline)
 #define MM_ALWAYSINLINE __forceinline
 #define MM_ALIGN8 __declspec(align(8))
 #define MM_ALIGN16 __declspec(align(16))
 #define MM_ALIGN32 __declspec(align(32))
 #define MM_ALIGN64 __declspec(align(64))
 #define MM_ALIGNED8(p) (p)
 #define MM_ALIGNED16(p) (p)
 #define MM_ALIGNED32(p) (p)
 #define MM_ALIGNED64(p) (p)
 #define MM_PACKED_SAFE
 #ifndef inline
  #define inline __inline
 #endif
 #ifndef restrict
  #define restrict __restrict
 #endif
 #ifndef ssize_t
  #if MM_ARCH_AMD64
   #define ssize_t int64_t
  #else
   #define ssize_t int32_t
  #endif
 #endif
#else
 #define MM_CACHE_ALIGN
 #define MM_RESTRICT
 #define MM_NOINLINE
 #define MM_ALWAYSINLINE
 #define MM_ALIGN8
 #define MM_ALIGN16
 #define MM_ALIGN32
 #define MM_ALIGN64
 #define MM_ALIGNED8(p) (p)
 #define MM_ALIGNED16(p) (p)
 #define MM_ALIGNED32(p) (p)
 #define MM_ALIGNED64(p) (p)
 #define MM_PACKED_SAFE
#endif


#define MM_ERROR()  {printf("MM Error at %s:%d\n",file,line);exit(1)}

#ifndef ADDRESS
 #define ADDRESS(p,o) ((void *)(((char *)p)+(o)))
#endif

#ifndef ADDRESSDIFF
 #define ADDRESSDIFF(a,b) (((char *)a)-((char *)b))
#endif


#if MM_UNIX
 #include <sys/time.h>
#elif MM_WINDOWS
 #include <winsock2.h> /* For struct timeval, don't ask me how that makes any sense */
#endif

#ifdef MM_WINDOWS
int mmGetTimeOfDay( struct timeval *tv );
#define gettimeofday(a,b) mmGetTimeOfDay(a)
#endif


#ifdef MM_NUMA
 #if defined(__linux__) || defined(__gnu_linux__) || defined(__linux) || defined(__linux)
  #include <numa.h>
 #endif
#endif


////


void *mmNumaAlignAlloc( int nodeindex, size_t size, intptr_t align );
void mmNumaAlignFree( int nodeindex, void *v, size_t size );



#include "mmthread.h"


#if MM_DEBUG
 #define MM_FUNC(n) mm##n##Debug
 #define MM_PARAMS , char *file, int line
#else
 #define MM_FUNC(n) mm##n
 #define MM_PARAMS
#endif



////



typedef struct
{
  void **prev;
  void *next;
} mmListNode;

typedef struct
{
  void *first;
  void **last;
} mmListDualHead;

typedef struct
{
  void *first;
  void *last;
} mmListLoopHead;


static inline void mmListAdd( void **list, void *item, intptr_t offset )
{
  mmListNode *node, *next;
  node = ADDRESS( item, offset );
  node->prev = list;
  node->next = *list;
  if( *list )
  {
    next = ADDRESS( *list, offset );
    next->prev = &(node->next);
  }
  *list = item;
  return;
}

static inline void mmListRemove( void *item, intptr_t offset )
{
  mmListNode *node, *next;
  node = ADDRESS( item, offset );
  *(node->prev) = (void *)node->next;
  if( node->next )
  {
    next = ADDRESS( node->next, offset );
    next->prev = node->prev;
  }
  return;
}

static inline void mmListMergeList( void **listdst, void **listsrc, intptr_t offset )
{
  void *item;
  mmListNode *node;
  if( !( *listsrc ) )
    return;
  for( item = *listdst ; item ; item = node->next )
  {
    node = ADDRESS( item, offset );
    listdst = &node->next;
  }
  item = *listsrc;
  node = ADDRESS( item, offset );
  node->prev = listdst;
  *listdst = item;
  *listsrc = 0;
  return;
}

static inline void mmListMoveList( void **listdst, void **listsrc, intptr_t offset )
{
  void *item;
  mmListNode *node;
  if( !( *listsrc ) )
  {
    *listdst = 0;
    return;
  }
  item = *listsrc;
  node = ADDRESS( item, offset );
  node->prev = listdst;
  *listdst = item;
  *listsrc = 0;
  return;
}

static inline void mmListDualInit( mmListDualHead *head )
{
  head->first = 0;
  head->last = &head->first;
  return;
}

static inline void mmListDualAddFirst( mmListDualHead *head, void *item, intptr_t offset )
{
  mmListNode *node, *next;
  node = ADDRESS( item, offset );
  node->prev = &head->first;
  node->next = head->first;
  if( node->next )
  {
    next = ADDRESS( node->next, offset );
    next->prev = &(node->next);
  }
  else
    head->last = &(node->next);
  head->first = item;
  return;
}

static inline void mmListDualAddLast( mmListDualHead *head, void *item, intptr_t offset )
{
  mmListNode *node;
  void **prev;
  prev = head->last;
  *prev = item;
  node = ADDRESS( item, offset );
  node->prev = head->last;
  head->last = &(node->next);
  node->next = 0;
  return;
}

static inline void mmListDualInsertAfter( mmListDualHead *head, void **prevnext, void *item, intptr_t offset )
{
  mmListNode *node, *next;
  node = ADDRESS( item, offset );
  node->prev = prevnext;
  node->next = *prevnext;
  if( *prevnext )
  {
    next = ADDRESS( *prevnext, offset );
    next->prev = &(node->next);
  }
  else
    head->last = &(node->next);
  *prevnext = item;
  return;
}

static inline void mmListDualRemove( mmListDualHead *head, void *item, intptr_t offset )
{
  mmListNode *node, *next;
  node = ADDRESS( item, offset );
  *(node->prev) = (void *)node->next;
  if( node->next )
  {
    next = ADDRESS( node->next, offset );
    next->prev = node->prev;
  }
  else
    head->last = node->prev;
  return;
}

static inline void *mmListDualLast( mmListDualHead *head, intptr_t offset )
{
  if( !( head->first ) )
    return 0;
  return ADDRESS( head->last, -( offset + (int)offsetof(mmListNode,next) ) );
}

static inline void *mmListDualPrevious( mmListDualHead *head, void *item, intptr_t offset )
{
  mmListNode *node;
  if( item == head->first )
    return 0;
  node = ADDRESS( item, offset );
  return ADDRESS( node->prev, -( offset + (int)offsetof(mmListNode,next) ) );
}

void mmListLoopInit( mmListLoopHead *head );
void mmListLoopAddFirst( mmListLoopHead *head, void *item, intptr_t offset );
void mmListLoopAddLast( mmListLoopHead *head, void *item, intptr_t offset );
void mmListLoopInsert( mmListLoopHead *head, void *previtem, void *item, intptr_t offset );
void mmListLoopRemove( mmListLoopHead *head, void *item, intptr_t offset );
void *mmListLoopLast( mmListLoopHead *head, intptr_t offset );



////


/* Pack bits in pointer, save 8 bytes! ~ is there a bug somewhere? */
#define MM_BTREE_MERGED_FLAGS (1)

typedef struct
{
  void *child[2];
#if MM_BTREE_MERGED_FLAGS
  uintptr_t parentnflags;
#else
  void *parent;
  int flags;
#endif
} mmBTreeNode;

#define MM_BTREE_FLAGS_LEFT (0)
#define MM_BTREE_FLAGS_RIGHT (1)
#define MM_BTREE_FLAGS_DIR_MASK (1)
#define MM_BTREE_FLAGS_STEP (2)
#define MM_BTREE_FLAGS_MASK (MM_BTREE_FLAGS_DIR_MASK|MM_BTREE_FLAGS_STEP)

#if MM_BTREE_MERGED_FLAGS
 #define MM_BTREE_GET_PARENT(n) (void *)(((n)->parentnflags)&~MM_BTREE_FLAGS_MASK)
 #define MM_BTREE_SET_PARENT(n,p) ((n)->parentnflags=(uintptr_t)(p)|((n)->parentnflags&MM_BTREE_FLAGS_MASK))
 #define MM_BTREE_SET_FLAGS(n,f) ((n)->parentnflags=(((n)->parentnflags)&~MM_BTREE_FLAGS_MASK)|(f))
 #define MM_BTREE_SETOR_FLAGS(n,f) ((n)->parentnflags|=(f))
 #define MM_BTREE_SETAND_FLAGS(n,f) ((n)->parentnflags&=(f))
 #define MM_BTREE_AND_FLAGS(n,f) ((n)->parentnflags&(f))
 #define MM_BTREE_SET_PARENT_AND_FLAGS(n,p,f) ((n)->parentnflags=(uintptr_t)(p)|(f))
 #define MM_BTREE_COPY_PARENT_AND_FLAGS(d,s) ((d)->parentnflags=(s)->parentnflags)
#else
 #define MM_BTREE_GET_PARENT(n) ((n)->parent)
 #define MM_BTREE_SET_PARENT(n,p) ((n)->parent=(p))
 #define MM_BTREE_SET_FLAGS(n,f) ((n)->flags=(f))
 #define MM_BTREE_SETOR_FLAGS(n,f) ((n)->flags|=(f))
 #define MM_BTREE_SETAND_FLAGS(n,f) ((n)->flags&=(f))
 #define MM_BTREE_AND_FLAGS(n,f) ((n)->flags&(f))
 #define MM_BTREE_SET_PARENT_AND_FLAGS(n,p,f) do{(n)->parent=(p);(n)->flags=(f);}while(0)
 #define MM_BTREE_COPY_PARENT_AND_FLAGS(d,s) do{(d)->parent=(s)->parent;(d)->flags=(s)->flags;}while(0)
#endif

void mmBTreeInsert( void *item, void *parent, int itemflag, intptr_t offset, void **root );
void mmBTreeInsertLeft( void *item, void *target, intptr_t offset, void **root );
void mmBTreeInsertRight( void *item, void *target, intptr_t offset, void **root );
void mmBTreeRemove( void *item, intptr_t offset, void **root );

void *mmBtreeMostLeft( void *root, intptr_t offset );
void *mmBtreeMostRight( void *root, intptr_t offset );
void *mmBtreeNeighbourLeft( void *item, intptr_t offset );
void *mmBtreeNeighbourRight( void *item, intptr_t offset );
intptr_t mmBtreeItemCount( void *root, intptr_t offset );
int mmBtreeListOrdered( void *root, intptr_t offset, int (*callback)( void *item, void *v ), void *v );
int mmBtreeListBalanced( void *root, intptr_t offset, int (*callback)( void *item, void *v ), void *v );



////



typedef struct
{
  mmListNode listnode;
  mmBTreeNode node;
  int freecount;
  int blockwidth;
  /* Only used by mmBlockProcessList(), is that even important? */
  int blockindex;
} mmBlock;

typedef struct
{
  void *blocklist;
  void *freelist;
  size_t chunksize;
  int chunkperblock;
  int alignment;
  size_t allocsize;
  int keepfreecount;
  int blockcount;
  int chunkfreecount;
  void *treeroot;
  void *(*relayalloc)( void *head, size_t bytes MM_PARAMS );
  void (*relayfree)( void *head, void *v, size_t bytes MM_PARAMS );
  void *relayvalue;
  mtSpin spinlock;
} mmBlockHead;

void MM_FUNC(BlockInit)( mmBlockHead *head, size_t chunksize, int chunkperblock, int keepfreecount, int alignment MM_PARAMS );
void MM_FUNC(BlockNumaInit)( mmBlockHead *head, int nodeindex, size_t chunksize, int chunkperblock, int keepfreecount, int alignment MM_PARAMS );
void *MM_FUNC(BlockAlloc)( mmBlockHead *head MM_PARAMS );
void *MM_FUNC(BlockLockAlloc)( mmBlockHead *head MM_PARAMS );
void MM_FUNC(BlockRelease)( mmBlockHead *head, void *v MM_PARAMS );
void MM_FUNC(BlockLockRelease)( mmBlockHead *head, void *v MM_PARAMS );
void MM_FUNC(BlockFree)( mmBlockHead *head, void *v MM_PARAMS );
void MM_FUNC(BlockLockFree)( mmBlockHead *head, void *v MM_PARAMS );
void MM_FUNC(BlockFreeAll)( mmBlockHead *head MM_PARAMS );
void MM_FUNC(BlockProcessList)( mmBlockHead *head, void *userpointer, int (*processchunk)( void *chunk, void *userpointer ) MM_PARAMS );
int MM_FUNC(BlockUseCount)( mmBlockHead *head MM_PARAMS );
int MM_FUNC(BlockFreeCount)( mmBlockHead *head MM_PARAMS );

#if MM_DEBUG
 #define mmBlockInit(v,w,x,y,z) MM_FUNC(BlockInit)(v,w,x,y,z,__FILE__,__LINE__)
 #define mmBlockNumaInit(u,v,w,x,y,z) MM_FUNC(BlockNumaInit)(u,v,w,x,y,z,__FILE__,__LINE__)
 #define mmBlockAlloc(x) MM_FUNC(BlockAlloc)(x,__FILE__,__LINE__)
 #define mmBlockLockAlloc(x) MM_FUNC(BlockLockAlloc)(x,__FILE__,__LINE__)
 #define mmBlockRelease(x,y) MM_FUNC(BlockRelease)(x,y,__FILE__,__LINE__)
 #define mmBlockLockRelease(x,y) MM_FUNC(BlockLockRelease)(x,y,__FILE__,__LINE__)
 #define mmBlockFree(x,y) MM_FUNC(BlockFree)(x,y,__FILE__,__LINE__)
 #define mmBlockLockFree(x,y) MM_FUNC(BlockLockFree)(x,y,__FILE__,__LINE__)
 #define mmBlockFreeAll(x) MM_FUNC(BlockFreeAll)(x,__FILE__,__LINE__)
 #define mmBlockProcessList(x,y,z) MM_FUNC(BlockProcessList)(x,y,z,__FILE__,__LINE__)
 #define mmBlockUseCount(x) MM_FUNC(BlockProcessList)(x,__FILE__,__LINE__)
 #define mmBlockFreeCount(x) MM_FUNC(BlockProcessList)(x,__FILE__,__LINE__)
#endif

/*
void mmBlockRelayByVolume( mmBlockHead *head, void *volumehead );
void mmBlockRelayByZone( mmBlockHead *head, void *zonehead );
*/



////



typedef struct
{
  mmBlockHead indexblock;
  void *indextree;
  intptr_t indexlimit;
  mtSpin spinlock;
} mmIndexHead;

void mmIndexInit( mmIndexHead *head, int indexesperblock );
void mmIndexFreeAll( mmIndexHead *head );
void mmIndexAdd( mmIndexHead *head, intptr_t index );
intptr_t mmIndexGet( mmIndexHead *head );
int mmIndexRemove( mmIndexHead *head, intptr_t index );
size_t mmIndexCount( mmIndexHead *head );



////



typedef struct
{
  size_t size;
  size_t used;
  void *next;
} mmGrowNode;

typedef struct
{
  mmGrowNode *first;
  size_t nodesize;
  mtSpin spinlock;
} mmGrow;

int MM_FUNC(GrowInit)( mmGrow *mgrow, size_t nodesize MM_PARAMS );
void MM_FUNC(GrowFreeAll)( mmGrow *mgrow MM_PARAMS );
void *MM_FUNC(GrowAlloc)( mmGrow *mgrow, size_t bytes MM_PARAMS );
void *MM_FUNC(GrowLockAlloc)( mmGrow *mgrow, size_t bytes MM_PARAMS );
void MM_FUNC(GrowRewindLast)( mmGrow *mgrow, size_t rewind MM_PARAMS );

#if MM_DEBUG
 #define mmGrowInit(x,y) MM_FUNC(GrowInit)(x,y,__FILE__,__LINE__)
 #define mmGrowFreeAll(x) MM_FUNC(GrowFreeAll)(x,__FILE__,__LINE__)
 #define mmGrowAlloc(x,y) MM_FUNC(GrowAlloc)(x,y,__FILE__,__LINE__)
 #define mmGrowRewindLast(x) MM_FUNC(GrowRewindLast)(x,__FILE__,__LINE__)
#endif



////



void *MM_FUNC(AlignAlloc)( size_t bytes, intptr_t align MM_PARAMS );
void MM_FUNC(AlignFree)( void *v MM_PARAMS );
void *MM_FUNC(AlignGrow)( void *v, size_t bytes, size_t copybytes, intptr_t align MM_PARAMS );
void *MM_FUNC(AlignRelayAlloc)( void *(*relayalloc)( void *head, size_t bytes MM_PARAMS ), void *relayvalue, size_t bytes, intptr_t align, size_t displacement MM_PARAMS );
void MM_FUNC(AlignRelayFree)( void (*relayfree)( void *head, void *v, size_t bytes MM_PARAMS ), void *relayvalue, void *v, size_t bytes MM_PARAMS );

#if MM_DEBUG
 #define mmAlignAlloc(x,y) MM_FUNC(AlignAlloc)(x,y,__FILE__,__LINE__)
 #define mmAlignFree(x) MM_FUNC(AlignFree)(x,__FILE__,__LINE__)
 #define mmAlignGrow(x) MM_FUNC(AlignGrow)(x,__FILE__,__LINE__)
 #define mmAlignRelayAlloc(v,w,x,y,z) MM_FUNC(AlignRelayAlloc)(v,w,x,y,z,__FILE__,__LINE__)
 #define mmAlignRelayFree(w,x,y,z) MM_FUNC(AlignRelayFree)(w,x,y,z,__FILE__,__LINE__)
#endif



////



typedef struct
{
  size_t volumesize;
  size_t volumeblocksize;
  size_t minchunksize;
  size_t volumechunksize;
  size_t keepfreesize;
  size_t totalfreesize;
  size_t alignment;
  void *freeroot;
  void *volumelist;
  void *(*relayalloc)( void *head, size_t bytes MM_PARAMS );
  void (*relayfree)( void *head, void *v, size_t bytes MM_PARAMS );
  void *relayvalue;
  mtSpin spinlock;
} mmVolumeHead;

void MM_FUNC(VolumeInit)( mmVolumeHead *head, size_t volumesize, size_t minchunksize, size_t keepfreesize, size_t alignment MM_PARAMS );
void MM_FUNC(VolumeNumaInit)( mmVolumeHead *head, int nodeindex, size_t volumesize, size_t minchunksize, size_t keepfreesize, size_t alignment MM_PARAMS );
void *MM_FUNC(VolumeAlloc)( mmVolumeHead *head, size_t bytes MM_PARAMS );
void MM_FUNC(VolumeRelease)( mmVolumeHead *head, void *v MM_PARAMS );
void MM_FUNC(VolumeFree)( mmVolumeHead *head, void *v MM_PARAMS );
void MM_FUNC(VolumeShrink)( mmVolumeHead *head, void *v, size_t bytes MM_PARAMS );
size_t MM_FUNC(VolumeGetAllocSize)( mmVolumeHead *head, void *v MM_PARAMS );
void MM_FUNC(VolumeClean)( mmVolumeHead *head MM_PARAMS );
void MM_FUNC(VolumeFreeAll)( mmVolumeHead *head MM_PARAMS );
void *MM_FUNC(VolumeRealloc)( mmVolumeHead *head, void *v, size_t bytes MM_PARAMS );

#if MM_DEBUG
 #define mmVolumeInit(w,x,y,z,a) MM_FUNC(VolumeInit)(w,x,y,z,a,__FILE__,__LINE__);
 #define mmVolumeNumaInit(v,w,x,y,z,a) MM_FUNC(VolumeNumaInit)(v,w,x,y,z,a,__FILE__,__LINE__);
 #define mmVolumeAlloc(x,y) MM_FUNC(VolumeAlloc)(x,y,__FILE__,__LINE__);
 #define mmVolumeRelease(x,y) MM_FUNC(VolumeRelease)(x,y,__FILE__,__LINE__);
 #define mmVolumeFree(x,y) MM_FUNC(VolumeFree)(x,y,__FILE__,__LINE__);
 #define mmVolumeShrink(x,y,z) MM_FUNC(VolumeShrink)(x,y,z,__FILE__,__LINE__);
 #define mmVolumeGetAllocSize(x,y) MM_FUNC(VolumeGetAllocSize)(x,y,__FILE__,__LINE__);
 #define mmVolumeClean(x) MM_FUNC(VolumeClean)(x,__FILE__,__LINE__);
 #define mmVolumeFreeAll(x) MM_FUNC(VolumeFreeAll)(x,__FILE__,__LINE__);
 #define mmVolumeRealloc(x,y,z) MM_FUNC(VolumeRealloc)(x,y,z,__FILE__,__LINE__);
#endif

void mmVolumeDebugList( mmVolumeHead *volumehead );
int mmVolumeDebugGetTreeDepth( mmVolumeHead *volumehead );



////



typedef struct
{
  void *address;
  size_t pagesize;
  size_t pagealignment;
  size_t zonesize;
  size_t alignment;
  size_t chunkheadersize;
  void *chunklist;
  mtSpin spinlock;
} mmZoneHead;

int MM_FUNC(ZoneInit)( mmZoneHead *head, size_t zonesize, intptr_t alignment MM_PARAMS );
void *MM_FUNC(ZoneAlloc)( mmZoneHead *head, size_t bytes MM_PARAMS );
void MM_FUNC(ZoneFree)( mmZoneHead *head, void *v MM_PARAMS );
void MM_FUNC(ZoneFreeAll)( mmZoneHead *head MM_PARAMS );

#if MM_DEBUG
 #define mmZoneInit(x,y,z) MM_FUNC(ZoneInit)(x,y,z,__FILE__,__LINE__);
 #define mmZoneAlloc(x,y) MM_FUNC(ZoneAlloc)(x,y,__FILE__,__LINE__);
 #define mmZoneFree(x,y) MM_FUNC(ZoneFree)(x,y,__FILE__,__LINE__);
 #define mmZoneFreeAll(x) MM_FUNC(ZoneFreeAll)(x,__FILE__,__LINE__);
#endif



////



void *mmAlloc( void *unused, size_t bytes MM_PARAMS );
void *mmRealloc( void *unused, void *v, size_t bytes MM_PARAMS );
void mmFree( void *unused, void *v, size_t bytes MM_PARAMS );

void *mmDebugAlloc( size_t bytes, char *file, int line );
void *mmDebugRealloc( void *v, size_t bytes, char *file, int line );
void mmDebugFree( void *v, char *file, int line );
#define mmDebugAlloc(x) mmDebugAlloc(x,__FILE__,__LINE__)
#define mmDebugFree(x) mmDebugFree(x,__FILE__,__LINE__)
#define mmDebugRealloc(x,y) mmDebugRealloc(x,y,__FILE__,__LINE__)

void mmAssertMemoryWasAllocated( void *v, char *file, int line );
#define mmAssertMemoryWasAllocated(v) mmAssertMemoryWasAllocated(v,__FILE__,__LINE__);

void mmCheckMemoryGuards( char *file, int line );
#define mmCheckMemoryGuards() mmCheckMemoryGuards(__FILE__,__LINE__);

void mmListUses( char *file, int line );
#define mmListUses() mmListUses(__FILE__,__LINE__);


////


#if MM_DEBUG
 #define malloc(x) mmAlloc(0,(x),__FILE__,__LINE__)
 #define realloc(x,y) mmRealloc(0,(x),(y),__FILE__,__LINE__)
 #define free(x) mmFree(0,(x),0,__FILE__,__LINE__)
#elif MM_ALLOC_CHECK
static inline void *mmAllocCheck( size_t size, char *file, int line )
{
  void *p;
  p = malloc( size );
#if MM_WINDOWS
  if( !( p ) )
    fprintf( stderr, "WARNING : Denied memory allocation ( %ld bytes ) at %s:%d\n", (long)size, file, line );
#else
  if( !( p ) )
    fprintf( stderr, "WARNING : Denied memory allocation ( %lld bytes ) at %s:%d\n", (long long)size, file, line );
#endif
  return p;
}
static inline void *mmReallocCheck( void *p, size_t size, char *file, int line )
{
  p = realloc( p, size );
#if MM_WINDOWS
  if( !( p ) )
    fprintf( stderr, "WARNING : Denied memory allocation ( %ld bytes ) at %s:%d\n", (long)size, file, line );
#else
  if( !( p ) )
    fprintf( stderr, "WARNING : Denied memory allocation ( %lld bytes ) at %s:%d\n", (long long)size, file, line );
#endif
  return p;
}
 #define malloc(x) mmAllocCheck((x),__FILE__,__LINE__)
 #define realloc(x,y) mmReallocCheck((x),(y),__FILE__,__LINE__)
#endif


////


static inline uint64_t mmGetMillisecondsTime()
{
  struct timeval lntime;
  gettimeofday( &lntime, 0 );
  return ( (uint64_t)lntime.tv_sec * 1000 ) + ( (uint64_t)lntime.tv_usec / 1000 );
}


static inline uint64_t mmGetMicrosecondsTime()
{
  struct timeval lntime;
  gettimeofday( &lntime, 0 );
  return ( (uint64_t)lntime.tv_sec * 1000000 ) + (uint64_t)lntime.tv_usec;
}


static inline uint64_t mmGetNanosecondsTime()
{
  struct timeval lntime;
  gettimeofday( &lntime, 0 );
  return ( (uint64_t)lntime.tv_sec * 1000000000 ) + ( (uint64_t)lntime.tv_usec * 1000 );
}


////


void *mmMmapAlloc( size_t memsize, int trymmap, int trymlock, int tryhugepages, size_t *retmmapsize, int *retlockflag );
void mmMmapFree( void *alloc, size_t mmapsize );


////


#ifdef __cplusplus
}
#endif


////


#endif

