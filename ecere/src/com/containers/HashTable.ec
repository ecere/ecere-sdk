#undef __BLOCKS__

namespace com;

import "Container"

#include <math.h>
#include <stdlib.h>

#include "cpuconfig.h"
#include "cc.h"
#include "mmhash.h"

static define HASH_PAGE_SHIFT = 7;
/*
static void hashClearEntry(int64 *entry)
{
   *entry = 0;
}
*/
static int hashEntryValid(const int64 *entry)
{
   return *entry != 0;
}

static uint32_t hashEntryKey(const int64 *entry)
{
   uint32 hashkey;
#if CPUCONF_WORD_SIZE == 64
   uint64 *v = (uint64 *)entry;
   hashkey = ccHash32Int64Inline(*v);
#else
   hashkey = ccHash32Data4Inline((void *)entry);
#endif
   return hashkey;
}

static int hashEntryCmp(const int64 *entry, const int64 *entryRef)
{
   if(!*entry) return MM_HASH_ENTRYCMP_INVALID;
   if(*entry == *entryRef) return MM_HASH_ENTRYCMP_FOUND;
   return MM_HASH_ENTRYCMP_SKIP;
}
/*
static int hashEntryList( void *opaque, const int64 *entry, const int64 *entryRef )
{
   return MM_HASH_ENTRYLIST_CONTINUE;
   // return MM_HASH_ENTRYLIST_BREAK;
}
*/
static const mmHashAccess hashAccess =
{
   null, //hashClearEntry,
   hashEntryValid,
   hashEntryKey,
   hashEntryCmp
};

public class HashTable<class KT = int64> : Container<KT, I = KT>
{
   void *tbl;

   HashTable()
   {
      int bits = 8;
      uintsize size = mmHashRequiredSize( sizeof(int64), bits, HASH_PAGE_SHIFT);
      tbl = malloc(size);
      mmHashInit(tbl, &hashAccess, sizeof(int64), bits, HASH_PAGE_SHIFT, 0 /*MM_HASH_FLAGS_NO_COUNT*/);
   }

   IteratorPointer Add(T value)
   {
      int64 * entry;
      bool success = mmHashDirectAddEntry2(tbl, &hashAccess, &value, bool::true, &entry) == MM_HASH_SUCCESS;
      if(success)
         resize();
      return success ? (IteratorPointer)entry : null;
   }

   KT GetData(IteratorPointer pointer)
   {
      return (KT)(pointer ? *(int64*)pointer : 0);
   }

   IteratorPointer Find(D value)
   {
      return mmHashDirectFindEntry(tbl, &hashAccess, &value);
   }

   bool SetData(IteratorPointer pointer, int64 data)
   {

      return false; // Not supported for now...
   }

   void Remove(IteratorPointer it)
   {
      mmHashDirectDeleteEntry2(tbl, &hashAccess, it, 0);
      resize();
   }

   void Delete(IteratorPointer it)
   {
      mmHashDirectDeleteEntry2(tbl, &hashAccess, it, 0);
      resize();
   }

   static void resize()
   {
      int bits, status = mmHashGetStatus(tbl, &bits);
      if(status == MM_HASH_STATUS_MUSTGROW) bits++;
      else if(status == MM_HASH_STATUS_MUSTSHRINK && bits > 12) bits--;
      else return;
      {
         uint pageShift = 4;
         uintsize memSize = mmHashRequiredSize(sizeof(int64), bits, pageShift);
         void *newTbl = malloc(memSize);
         mmHashResize(newTbl, tbl, &hashAccess, bits, pageShift);
         free(tbl);
         tbl = newTbl;
      }
   }

   IteratorPointer GetFirst() { return mmHashGetNext(tbl, null, &hashAccess); }
   IteratorPointer GetLast()  { return mmHashGetPrev(tbl, null, &hashAccess); }
   IteratorPointer GetPrev(IteratorPointer pointer) { return mmHashGetPrev(tbl, pointer, &hashAccess); }
   IteratorPointer GetNext(IteratorPointer pointer) { return mmHashGetNext(tbl, pointer, &hashAccess); }

   IteratorPointer GetAtPosition(int64 pos, bool create, bool * justAdded)
   {
      if(create)
      {
         void * entry = null;
         int r = mmHashDirectAddEntry2(tbl, &hashAccess, &pos, bool::true, &entry);
         if(r != MM_HASH_FOUND)
         {
            resize();
            if(justAdded) *justAdded = true;
         }
         return entry;
      }
      else
         return mmHashDirectFindEntry(tbl, &hashAccess, &pos);
   }

   void Free()
   {
      if(tbl)
         mmHashReset(tbl, &hashAccess);
   }

   void RemoveAll()
   {
      if(tbl)
         mmHashReset(tbl, &hashAccess);
   }

   ~HashTable()
   {
      free(tbl);
      tbl = null;
   }
}
