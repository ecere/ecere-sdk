namespace com;

import "Container"

#define Tsize ((class(T).type == noHeadClass || class(T).type == normalClass) ? sizeof(void *) : class(T).typeSize)

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
   IteratorPointer GetAtPosition(I pos, bool create)
   {
      if((int)pos > count && create)
      {
         if((int)pos + 1 > minAllocSize)
            array = renew array T[(int)pos + 1];
         count = (int)pos + 1;
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
      memmove(after ? (after + 2) : (array + 1), after ? (after + 1) : array, (count - offset) * Tsize);
      if(after)
         after[1] = value;
      else
         array[0] = value;
      count++;
      return (IteratorPointer)(after ? (after + 1) : array);
*/
      uint tsize = Tsize;
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
      memmove(it, it + 1, (count - (it - array) - 1) * Tsize);
      count--;
      if(count + 1 > minAllocSize)
         array = renew array T[count];
   }

   void Move(IteratorPointer ip, IteratorPointer afterIp)
   {
      T * it = (T *)ip;
      T * after = (T *)afterIp;
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
               memset(array + count, 0, (value - count) * Tsize);
            count = value;
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
      }
   }

   virtual void Copy(Container source)
   {
      count = source.GetCount();
      if(count > minAllocSize)
         array = renew array T[count];

      // TOFIX: Precomp fails on (BuiltInContainer *)
      if((source._class == class(BuiltInContainer) && ((struct BuiltInContainer *)source)->type.type != structClass ) || 
         eClass_IsDerived(source._class, class(Array)))
      {
         memcpy(array, ((Array)source).array, count * Tsize);
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
};
