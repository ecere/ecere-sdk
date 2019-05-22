namespace com;

import "Container"

#include <math.h>
#include <stdlib.h>

#include "cpuconfig.h"
#include "cc.h"
#include "mmhash.h"

static define HASH_PAGE_SHIFT = 7;

// TODO: Make this generic -- require context for callbacks?
struct HashMapEntry
{
   int64 key;
   uintptr value;
};

#define NULL_KEY  ((int64)0xFFFFFFFFFFFFFFFFLL)

static void hashClearEntry(HashMapEntry entry)
{
   entry.key = NULL_KEY;
   entry.value = 0;
}

static int hashEntryValid(const HashMapEntry entry)
{
   return entry.key != NULL_KEY;
}

static uint32_t hashEntryKey(const HashMapEntry entry)
{
   uint32 hashkey;
#if CPUCONF_WORD_SIZE == 64
   uint64 *v = (uint64 *)&entry.key;
   hashkey = ccHash32Int64Inline(*v);
#else
   hashkey = ccHash32Data4Inline((void *)&entry.key);
#endif
   return hashkey;
}

static int hashEntryCmp(const HashMapEntry entry, const HashMapEntry entryRef)
{
   if(entry.key == NULL_KEY) return MM_HASH_ENTRYCMP_INVALID;
   if(entry.key == entryRef.key) return MM_HASH_ENTRYCMP_FOUND;
   return MM_HASH_ENTRYCMP_SKIP;
}

static const mmHashAccess hashAccess =
{
   hashClearEntry,
   hashEntryValid,
   hashEntryKey,
   hashEntryCmp
};

public struct HashMapIterator<class KT, class VT> : Iterator<VT, IT = KT>
{
   property HashMap map
   {
      set { container = (Container<VT, IT>)value; }
      get { return (HashMap<KT, VT>)container; }
   }
   property const KT key
   {
      get { return ((HashMap<KT, VT>)container).GetKey(pointer); }
   }
   property VT value
   {
      get { return container.GetData(pointer); }
      set { container.SetData(pointer, value); }
   }
};

public class HashMap<class KT = int64, class VT = uintptr> : Container<VT, I = KT>
{
   void *tbl;
   public bool noRemResize; //noRemResize = 1;

   HashMap()
   {
      int bits = 8;
      uintsize size = mmHashRequiredSize(sizeof(HashMapEntry), bits, HASH_PAGE_SHIFT);
      tbl = malloc(size);
      mmHashInit(tbl, &hashAccess, sizeof(HashMapEntry), bits, HASH_PAGE_SHIFT, 0);
   }

   KT GetKey(IteratorPointer pointer)
   {
      return (KT)(pointer ? ((HashMapEntry*)pointer)->key : 0);
   }

   VT GetData(IteratorPointer pointer)
   {
      return (VT)(pointer ? ((HashMapEntry*)pointer)->value : 0);
   }

   bool SetData(IteratorPointer pointer, VT data)
   {
      if(pointer)
      {
         ((HashMapEntry *)pointer)->value = (uintptr)data;
         return true;
      }
      return false;
   }

   void Remove(IteratorPointer it)
   {
      mmHashDirectDeleteEntry2(tbl, &hashAccess, it, noRemResize);
      if(!noRemResize)
         resize(null);
   }

   void Delete(IteratorPointer it)
   {
      VT d = GetData(it);
      delete d;
      mmHashDirectDeleteEntry2(tbl, &hashAccess, it, noRemResize);
      if(!noRemResize)
         resize(null);
   }

   public void removeIterating(IteratorPointer * it)
   {
      HashMapEntry * entry;
      mmHashDirectDeleteEntry2(tbl, &hashAccess, *it, noRemResize);
      if(!noRemResize)
         resize(it);

      entry = (HashMapEntry *)*it;
      if(entry->key == NULL_KEY)
         *it = GetNext(*it);
   }

   public void resize(IteratorPointer * movedEntry)
   {
      int bits, status = mmHashGetStatus(tbl, &bits);
      if(status == MM_HASH_STATUS_MUSTGROW) bits++;
      else if(status == MM_HASH_STATUS_MUSTSHRINK && bits > 12) bits--;
      else if(!noRemResize) return; // Must re-pack if we were not doing mem resize
      {
         uint pageShift = 4;
         uintsize memSize = mmHashRequiredSize(sizeof(HashMapEntry), bits, pageShift);
         void *newTbl = malloc(memSize);
         mmHashResize2(newTbl, tbl, &hashAccess, bits, pageShift, movedEntry);
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
         HashMapEntry * entry = null;
         HashMapEntry newEntry { pos, 0 };
         int r = mmHashDirectAddEntry2(tbl, &hashAccess, &newEntry, bool::true, &entry);
         if(r != MM_HASH_FOUND)
         {
            resize((IteratorPointer *)&entry);
            if(justAdded) *justAdded = true;
         }
         return (IteratorPointer)entry;
      }
      return mmHashDirectFindEntry(tbl, &hashAccess, &pos);
   }

   void Free()
   {
      IteratorPointer it = GetFirst();
      while(it)
      {
         VT d = GetData(it);
         delete d;
         it = GetNext(it);
      }
      if(tbl)
         mmHashReset(tbl, &hashAccess);
   }

   void RemoveAll()
   {
      if(tbl)
         mmHashReset(tbl, &hashAccess);
   }

   ~HashMap()
   {
      free(tbl);
      tbl = null;
   }

   public property int count
   {
      get { return tbl ? mmHashGetCount(tbl) : 0; }
   }
}
