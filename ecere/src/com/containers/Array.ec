namespace com;

import "instance"
import "Container"

#ifdef _DEBUG
// #define MEMTRACKING
#endif

default:
extern int __ecereVMethodID_class_OnUnserialize;
extern int __ecereVMethodID_class_OnCompare;

// qsort_r/_s wrappers adapted from public domain code by Isaac Turner
#if !defined(ECERE_BOOTSTRAP)
#if (defined __APPLE__ || defined __MACH__ || defined __DARWIN__ || defined __FreeBSD__ || defined __BSD__ || defined __bsdi__ || defined OpenBSD3_1 || defined OpenBSD3_9 || defined __OpenBSD__ || \
     defined __NetBSD__ || defined __DragonFly__ || defined AMIGA)
   #define BSD
   extern void qsort_r(void *base, uintsize nel, uintsize width, void *arg, int (*compare)(void *, const void *, const void *));
#elif defined(__WIN32__)
   extern void qsort_s(void *base, uintsize nel, uintsize width, int (*compare)(void *, const void *, const void *), void * arg);
#elif (defined __GLIBC__ && ((__GLIBC__ > 2) || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 8)))
   #define GLIBC
   extern void qsort_r(void *base, uintsize nel, uintsize width, int(* compare)(const void *, const void *, void *), void *arg);
#endif
#endif
private:

// Quick Sort algorithm adapted from public domain code by Darel Rex Finley
static inline void quickSort(void *base, uintsize nel, uintsize w, char * piv, int (*compare)(void *, const void *, const void *), void *arg)
{
   #define MAX_LEVELS  300
   uintsize beg[MAX_LEVELS], end[MAX_LEVELS];
   int frame = 0;

   beg[0] = 0;
   end[0] = nel;
   while(frame >= 0)
   {
      uintsize L = beg[frame], R = end[frame]-1;
      if(L < R)
      {
         memcpy(piv, (char *)base + L*w, w);
         while(L < R)
         {
            while(compare(arg, (char *)base + (R*w), piv) >= 0 && L < R) R--;
            if(L < R)
            {
               memcpy((char *)base + L*w, (char *)base + R*w, w);
               L++;
            }
            while(compare(arg, (char *)base + (L*w), piv) <= 0 && L < R) L++;
            if(L < R)
            {
               memcpy((char *)base + R*w, (char *)base + L*w, w);
               R--;
            }
         }
         memcpy((char *)base + L*w, piv, w);
         beg[frame+1] = L+1;
         end[frame+1] = end[frame];
         end[frame++] = L;

         // Process smaller partition first
         if(end[frame]-beg[frame] > end[frame-1]-beg[frame-1])
         {
            uintsize swap;
            swap = beg[frame]; beg[frame] = beg[frame-1]; beg[frame-1] = swap;
            swap = end[frame]; end[frame] = end[frame-1]; end[frame-1] = swap;
         }
      }
      else
         frame--;
   }
   #undef MAX_LEVELS
}

static struct SortRData { void *arg; int (*compare)(void *, const void *, const void *); };

static inline int compareDeref            (SortRData cs, const void **a, const void **b)  { return  cs.compare(cs.arg, *a, *b); }
static inline int compareDescDeref        (SortRData cs, const void **a, const void **b)  { return -cs.compare(cs.arg, *a, *b); }
static inline int compareDesc             (SortRData cs, const void * a, const void * b)  { return -cs.compare(cs.arg,  a,  b); }

static inline int compareArgLast          (const void * a, const void * b, SortRData cs)  { return  cs.compare(cs.arg,  a,  b); }
static inline int compareDerefArgLast     (const void **a, const void **b, SortRData cs)  { return  cs.compare(cs.arg, *a, *b); }
static inline int compareDescDerefArgLast (const void **a, const void **b, SortRData cs)  { return -cs.compare(cs.arg, *a, *b); }
static inline int compareDescArgLast      (const void * a, const void * b, SortRData cs)  { return -cs.compare(cs.arg,  a,  b); }

static inline void _qsortrx(void *base, uintsize nel, uintsize width,
   int (*compare)(void *arg, const void *a, const void *b),
   int (*optCompareArgLast)(const void *a, const void *b, void *arg),
   void *arg,
   bool deref, bool ascending)
{
#if defined(GLIBC) && !defined(ECERE_BOOTSTRAP)
   if(!deref && ascending && optCompareArgLast)
      qsort_r(base, nel, width, optCompareArgLast, arg);
   else
   {
      SortRData s { arg, compare };
      #define compare_fn !deref && ascending ? compareArgLast : !deref ? compareDescArgLast : ascending ? compareDerefArgLast : compareDescDerefArgLast
      qsort_r(base, nel, width, compare_fn, s);
      #undef compare_fn
   }
#else
   if(!deref && ascending)
   {
   #if defined(BSD) && !defined(ECERE_BOOTSTRAP)
      qsort_r(base, nel, width, arg, compare);
   #elif defined(__WIN32__) && !defined(ECERE_BOOTSTRAP)
      qsort_s(base, nel, width, compare, arg);
   #else
      {
         char * buf = new char[width];
         quickSort(base, nel, width, buf, compare, arg);
         delete buf;
      }
   #endif
   }
   else
   {
      SortRData s { arg, compare };
      #define compare_fn   !deref ? compareDesc : ascending ? compareDeref : compareDescDeref
   #if defined(BSD) && !defined(ECERE_BOOTSTRAP)
      qsort_r(base, nel, width, s, compare_fn);
   #elif defined(__WIN32__) && !defined(ECERE_BOOTSTRAP)
      qsort_s(base, nel, width, compare_fn, s);
   #else
      {
         char * buf = new char[width];
         quickSort(base, nel, width, buf, compare_fn, s);
         delete buf;
      }
   #endif
      #undef compare_fn
   }
#endif
}

public void qsortrx(void *base, uintsize nel, uintsize width,
   int (*compare)(void *arg, const void *a, const void *b),
   int (*optCompareArgLast)(const void *a, const void *b, void *arg),
   void *arg,
   bool deref, bool ascending)
{
   _qsortrx(base, nel, width, compare, optCompareArgLast, arg, deref, ascending);
}

public void qsortr(void *base, uintsize nel, uintsize width, int (*compare)(void *arg, const void *a, const void *b), void *arg)
{
   _qsortrx(base, nel, width, compare, null, arg, false, true);
}

public class Array : Container
{
   class_fixed

public:
   T * array;
   uint count;
   uint minAllocSize;

   ~Array()
   {
      delete array;
   }

   void OnUnserialize(IOChannel channel)
   {
      Array array = eInstance_New(_class); //.fullName);
      uint count, c;
      Class Dclass = class(D);
      incref array;
      channel.Get(count);
#ifdef _DEBUG
      //printf("%d %ss\n", count, Dclass.name);
      if(count > 10000)
         printf("Bug");
#endif
      array.size = count;
      for(c = 0; c < count; c++)
         ((void (*)(void *, void *, void *))(void *)Dclass._vTbl[__ecereVMethodID_class_OnUnserialize])
            (Dclass, ((byte *)array.array) + Dclass.typeSize * c, channel);
      this = array;
   }

   // Generic iterator support
   IteratorPointer GetFirst() { return (IteratorPointer)array; }
   IteratorPointer GetLast() { return (IteratorPointer)(array ? (array + (count - 1)) : null); }
   IteratorPointer GetPrev(IteratorPointer ip)
   {
      T * item = (T *)ip;
      return (IteratorPointer)((item && item > array) ? (item - 1) : null);
   }
   IteratorPointer GetNext(IteratorPointer ip)
   {
      T * item = (T *)ip;
      return (IteratorPointer)((item && item < array + count - 1) ? (item + 1) : null);
   }
   T GetData(IteratorPointer ip)
   {
      T * item = (T *)ip;
      return *item;
   }
   bool SetData(IteratorPointer ip, T value)
   {
      T * item = (T *)ip;
      *item = value;
      return true;
   }
   IteratorPointer GetAtPosition(const I pos, bool create, bool * justAdded)
   {
      if((int)pos > count && create)
      {
         if((int)pos + 1 > minAllocSize)
            array = renew array T[(int)pos + 1];
         count = (int)pos + 1;
         if(justAdded) *justAdded = true;
#if !defined(MEMINFO) && defined(MEMTRACKING)
         if(array)
         {
            MemBlock block = (MemBlock)((byte *)array - sizeof(class MemBlock));
            block._class = class(T);
         }
#endif
      }
      return ((int)pos < count && array) ? (IteratorPointer)(array + (int)pos) : null;
   }
   IteratorPointer Insert(IteratorPointer ip, T value)
   {
/*
      T * after = (T *)ip;
      int offset = after ? (after - array) : 0;
      if(count + 1 > minAllocSize)
      {
         array = renew array T[count + 1];
         if(after) after = array + offset;
      }
      memmove(after ? (after + 2) : (array + 1), after ? (after + 1) : array, (count - offset) * class(T).typeSize);
      if(after)
         after[1] = value;
      else
         array[0] = value;
      count++;
      return (IteratorPointer)(after ? (after + 1) : array);
*/
      uint tsize = class(T).typeSize;
      byte * pos = ip ? ((byte *)ip + tsize) : (byte *)array;
      if(count+1 > minAllocSize)
      {
         int offset = pos - (byte *)array;
         array = renew array T[count + 1];
         pos = (byte *)array+offset;
      }
      memmove(pos + tsize, pos, (byte *)array+(count++) * tsize - pos);
      *(T*)pos = value;
      return (IteratorPointer)pos;
   }

   IteratorPointer Add(T value)
   {
      if(count + 1 > minAllocSize)
         array = renew array T[count + 1];
      array[count] = value;
      return (IteratorPointer)(array + (count++));
   }

   void Remove(IteratorPointer ip)
   {
      T * it = (T *)ip;
      memmove(it, it + 1, (count - (it - array) - 1) * class(T).typeSize);
      count--;
      if(count + 1 > minAllocSize)
         array = renew array T[count];
   }

   void Move(IteratorPointer ip, IteratorPointer afterIp)
   {
      /*
      T * it = (T *)ip;
      T * after = (T *)afterIp;
      */
   }

   virtual void RemoveAll()
   {
      if(minAllocSize && array)
         array = renew0 array T[minAllocSize];
      else
         delete array;
      count = 0;
   }

   virtual int GetCount() { return count; }

   property uint size
   {
      get { return count; }
      set
      {
         if(count != value)
         {
            if(value > minAllocSize)
               array = renew0 array T[value];
            else if(value > count)
               memset((byte *)array + count * class(T).typeSize, 0, (value - count) * class(T).typeSize);
            count = value;
#if !defined(MEMINFO) && defined(MEMTRACKING)
            if(array)
            {
               MemBlock block = (MemBlock)((byte *)array - sizeof(class MemBlock));
               block._class = class(T);
            }
#endif
         }
      }
   }

   property uint minAllocSize
   {
      get { return minAllocSize; }
      set
      {
         if(minAllocSize != value)
         {
            if(value > count)
               array = renew array T[value];
            minAllocSize = value;
         }
#if !defined(MEMINFO) && defined(MEMTRACKING)
         if(array)
         {
            MemBlock block = (MemBlock)((byte *)array - sizeof(class MemBlock));
            block._class = class(T);
         }
#endif
      }
   }

   virtual void Copy(Container source)
   {
      count = source.GetCount();
      if(count > minAllocSize)
         array = renew array T[count];

#if !defined(MEMINFO) && defined(MEMTRACKING)
         if(array)
         {
            MemBlock block = (MemBlock)((byte *)array - sizeof(class MemBlock));
            block._class = class(T);
         }
#endif

      // TOFIX: Precomp fails on (BuiltInContainer *)
      if((source._class == class(BuiltInContainer) && ((struct BuiltInContainer *)source)->type.type != structClass ) ||
         eClass_IsDerived(source._class, class(Array)))
      {
         memcpy(array, ((Array)source).array, count * class(T).typeSize);
      }
      else
      {
         IteratorPointer i;
         int c;
         for(c = 0, i = source.GetFirst(); i; i = source.GetNext(i), c++)
         {
            D data = source.GetData(i);
            array[c] = data;
         }
      }
   }

   void Free()
   {
      int c;
      for(c = 0; c<count; c++)
      {
         T data = array[c];
         delete data;
      }
      delete array;
      count = 0;
      minAllocSize = 0;
   }

   void Delete(IteratorPointer item)
   {
      T data = *(T*)item;
      delete data;
      Remove(item);
   }

   void Sort(bool ascending)
   {
      Class Dclass = class(D);
      bool byRef = (Dclass.type == systemClass && !Dclass.byValueSystemClass) || Dclass.type == bitClass || Dclass.type == enumClass || Dclass.type == unitClass;
      _qsortrx(array, count, Dclass.typeSize, (void *)Dclass._vTbl[__ecereVMethodID_class_OnCompare], null, Dclass, !byRef, ascending);
   }
};
