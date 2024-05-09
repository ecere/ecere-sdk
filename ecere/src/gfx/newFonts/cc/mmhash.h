/* *****************************************************************************
 * Copyright (c) 2009-2023 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
#ifndef MMHASH_H
#define MMHASH_H

#define MM_HASH_INDEX_32_BITS    1  // Forcing this for now...

#if !defined(MM_HASH_INDEX_32_BITS) && !defined(MM_HASH_INDEX_64_BITS)
 #if defined(__amd64__) || defined(__amd64) || defined(__x86_64__) || defined(__x86_64) || defined(_M_X64) || defined(_M_AMD64) || defined(__aarch64__)
  #define MM_HASH_INDEX_64_BITS (1)
 #elif defined(i386) || defined(__i386) || defined(__i386__) || defined(__i386) || defined(__IA32__) || defined(_M_IX86) || defined(__X86__) || defined(_X86_) || defined(__arm__) || defined(_ARM) || defined(_M_ARM) || defined(__arm) || defined(__EMSCRIPTEN__)
  #define MM_HASH_INDEX_32_BITS (1)
 #else
  #define MM_HASH_INDEX_64_BITS (1)
 #endif
#endif

#if MM_HASH_INDEX_64_BITS
 typedef uint64_t mmHashIndex;
 typedef int64_t mmHashSignedIndex;
#elif MM_HASH_INDEX_32_BITS
 typedef uint32_t mmHashIndex;
 typedef int32_t mmHashSignedIndex;
#else
 typedef uint64_t mmHashIndex;
 typedef int64_t mmHashSignedIndex;
 #define MM_HASH_INDEX_64_BITS (1)
#endif


/* Enable the collection of statistics for mmHashGetStatistics() */
#define MM_HASH_DEBUG_STATISTICS (0)



enum
{
  MM_HASH_ENTRYCMP_INVALID,
  MM_HASH_ENTRYCMP_FOUND,
  MM_HASH_ENTRYCMP_SKIP
};

enum
{
  MM_HASH_ENTRYLIST_BREAK,
  MM_HASH_ENTRYLIST_CONTINUE
};

typedef struct
{
  /* Clear the entry so that entryvalid() returns zero */
  void (*clearentry)( void *context, void *entry );
  /* Returns non-zero if the entry is valid and existing */
  int (*entryvalid)( void *context, const void *entry );
  /* Return key for an arbitrary set of user-defined data */
  mmHashIndex (*entrykey)( void *context, const void *entry );
  /* Return MM_HASH_ENTRYCMP* to stop or continue the search */
  int (*entrycmp)( void *context, const void *entry, const void *entryref );
  /* Return MM_HASH_ENTRYLIST* to stop or continue the search */
  int (*entrylist)( void *context, void *opaque, const void *entry, const void *entryref );
  /* Clear many entries at once */
  void (*clearentries)( void *context, void *entries, unsigned int count );
} mmHashAccess;


/* Do not keep track of entry count, table will not be able to say when it needs to shrink or grow */
#define MM_HASH_FLAGS_NO_COUNT (0x1)

/* Internal only: table->hashsize is a power of two, table->hashbits and table->hashmask are usable */
#define MM_HASH_FLAGS_HASHSIZE_ISPOW2 (0x2)


size_t mmHashRequiredSize( size_t entrysize, size_t hashsize, uint32_t pageshift );
void mmHashInit( void *hashtable, const mmHashAccess *access, size_t entrysize, size_t hashsize, uint32_t pageshift, uint32_t flags, void *context );

/* Return a MM_HASH_STATUS_* value, advising on a call to mmHashResize() if appropriate */
int mmHashGetStatus( void *hashtable, size_t *rethashsize );

/* Clear/empty the hash table */
void mmHashReset( void *hashtable, const mmHashAccess *access );

/* Hash status will be MM_HASH_STATUS_MUSTGROW if entrycount >= maxcount*grow */
/* Hash status will be MM_HASH_STATUS_MUSTSHRINK if entrycount < maxcount*shrink */
void mmHashSetResizeCriteria( void *hashtable, float shrinkfactor, float growfactor );

enum
{
  MM_HASH_STATUS_MUSTGROW,
  MM_HASH_STATUS_MUSTSHRINK,
  MM_HASH_STATUS_NORMAL,
  MM_HASH_STATUS_UNKNOWN
};


void *mmHashDirectFindEntry( void *hashtable, const mmHashAccess *access, const void *findentry );
void *mmHashLockFindEntry( void *hashtable, const mmHashAccess *access, void *findentry );

void mmHashDirectListEntry( void *hashtable, const mmHashAccess *access, void *listentry, void *opaque );
void mmHashLockListEntry( void *hashtable, const mmHashAccess *access, void *listentry, void *opaque );

int mmHashDirectReadEntry( void *hashtable, const mmHashAccess *access, void *readentry );
int mmHashLockReadEntry( void *hashtable, const mmHashAccess *access, void *readentry );

int mmHashDirectCallEntry( void *hashtable, const mmHashAccess *access, void *callentry, void (*callback)( void *opaque, void *entry, int newflag ), void *opaque, int addflag );
int mmHashLockCallEntry( void *hashtable, const mmHashAccess *access, void *callentry, void (*callback)( void *opaque, void *entry, int newflag ), void *opaque, int addflag );

/* The hash key for replaced entries must remain the same! */
int mmHashDirectReplaceEntry( void *hashtable, const mmHashAccess *access, void *replaceentry, int addflag );
int mmHashLockReplaceEntry( void *hashtable, const mmHashAccess *access, void *replaceentry, int addflag );

int mmHashDirectAddEntry( void *hashtable, const mmHashAccess *access, void *addentry, int nodupflag );
int mmHashLockAddEntry( void *hashtable, const mmHashAccess *access, void *addentry, int nodupflag );

int mmHashDirectAddEntry2( void *hashtable, const mmHashAccess *access, void *addentry, int nodupflag, void ** retEntry);

int mmHashDirectReadOrAddEntry( void *hashtable, const mmHashAccess *access, void *readaddentry, int *readflag );
int mmHashLockReadOrAddEntry( void *hashtable, const mmHashAccess *access, void *readaddentry, int *readflag );

int mmHashDirectDeleteEntry( void *hashtable, const mmHashAccess *access, void *deleteentry, int readflag );
int mmHashLockDeleteEntry( void *hashtable, const mmHashAccess *access, void *deleteentry, int readflag );
// NOTE: When setting dontmovestuff to 1, a resize must be done to repack!
int mmHashDirectDeleteEntry2( void *hashtable, const mmHashAccess *access, void *entry, int dontmovestuff);

void mmHashResize( void *newtable, void *oldtable, const mmHashAccess *access, size_t hashsize, uint32_t pageshift );
void mmHashResize2( void *newtable, void *oldtable, const mmHashAccess *access, size_t hashsize, uint32_t pageshift, void ** movedEntryPtr);

void mmHashListAll( void *hashtable, int (*list)( void *opaque, void *entry ), void *opaque );

void * mmHashGetNext( void *hashtable, void * entry, const mmHashAccess *access);
void * mmHashGetPrev( void *hashtable, void * entry, const mmHashAccess *access);

mmHashIndex mmHashGetEntryCount( void *hashtable );

size_t mmHashGetMemoryUsage( void *hashtable );


enum
{
  MM_HASH_FAILURE,
  MM_HASH_SUCCESS,
  MM_HASH_FOUND,
  MM_HASH_TRYAGAIN /* Internal, can not be returned by any public call */
};


////


typedef struct
{
  mmHashIndex hashkey;
  mmHashIndex pagestart;
  mmHashIndex pagefinal;
  void *next;
} mmHashLockRange;

typedef struct
{
  void *hashtable;
  void *rangelist;
  int newcount;
} mmHashLock;


void mmHashLockInit( mmHashLock *hashlock, int newcount );
void mmHashLockAdd( void *hashtable, const mmHashAccess *access, void *entry, mmHashLock *hashlock, mmHashLockRange *lockrange );
void mmHashLockAcquire( void *hashtable, const mmHashAccess *access, mmHashLock *hashlock );
void mmHashLockRelease( void *hashtable, mmHashLock *hashlock );

void mmHashGlobalLockEnable( void *hashtable );
void mmHashGlobalLockDisable( void *hashtable );


////


void mmHashDirectDebugDuplicate( void *hashtable, const mmHashAccess *access, void (*callback)( void *opaque, void *entry0, void *entry1 ), void *opaque );

void mmHashDirectDebugPages( void *hashtable );

void mmHashDirectDebugContent( void *hashtable, void (*callback)( mmHashIndex hashkey, void *entry ) );

void mmHashGetStatistics( void *hashtable, long *accesscount, long *findskipcount, long *deletecount, long *delrewindcount, long *relocationcount, long *entrycount, long *entrycountmax, size_t *hashsize );

void mmHashResetStatistics( void *hashtable );

void mmHashPrintStatistics( void *hashtable );

double mmHashGetHealthScore( void *hashtable, const mmHashAccess *access );

void mmHashPrintHealth( void *hashtable, const mmHashAccess *access );


////


/* Get a suggested hash size given a count of entry, multiplied by factor, rounded to next power of two if under thresholdnonpow2 */
static inline size_t mmGetSuggestedHashSize( size_t entrycount, double factor, size_t thresholdroundpow2 )
{
  size_t hashsize;
  hashsize = (size_t)( (double)entrycount * factor );
  if( hashsize < entrycount )
    hashsize = entrycount;
  /* Round to next power of two if hashsize is under thresholdroundpow2 */
  if( hashsize < thresholdroundpow2 )
    hashsize = ccPow2Round64( hashsize );
  if( hashsize < 256 )
    hashsize = 256;
  return hashsize;
}

/* Get a suggested new hashsize given a current hashsize, when the hash table needs to grow */
static inline size_t mmGetGrowHashSize( size_t hashsize )
{
  if( hashsize < 64*1048576 )
  {
    hashsize <<= 1;
    if( hashsize < 256 )
      hashsize = 256;
  }
  else
    hashsize += ( hashsize >> 1 );
  return hashsize;
}


////


#endif
