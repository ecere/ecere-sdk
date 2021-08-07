namespace com;

import "BuiltInContainer"

default:

static __attribute__((unused)) void UnusedFunction()
{
   int a = 0;
   a.OnCompare(null);
   a.OnCopy(null);
   a.OnGetString(null, null, null);
   a.OnSerialize(null);
   a.OnUnserialize(null);
}

extern int __ecereVMethodID_class_OnCompare;
extern int __ecereVMethodID_class_OnGetString;
extern int __ecereVMethodID_class_OnSerialize;
extern int __ecereVMethodID_class_OnUnserialize;
private:

// CAUSES PROBLEM WHEN AFTER
public struct Iterator<class T, class IT = int>
{
   Container<T, IT> container;
// private:
   IteratorPointer pointer;

public:
   property T data
   {
      get { return container.GetData(pointer); }
      set { container.SetData(pointer, value); }
   }

   bool Prev()
   {
      if(pointer && container)
         pointer = container.GetPrev(pointer);
      else if(container)
         pointer = container.GetLast();
      return pointer != null;
   }

   bool Next()
   {
      if(pointer && container)
         pointer = container.GetNext(pointer);
      else if(container)
         pointer = container.GetFirst();
      return pointer != null;
   }

   T GetData()
   {
      return container.GetData(pointer);
   }

   bool SetData(T value)
   {
      return container.SetData(pointer, value);
   };

   bool Find(const T value)
   {
      if(container)
      {
         Free();
         pointer = container.Find(value);
      }
      return pointer != null;
   }

   void Remove()
   {
      if(container)
         container.Remove(pointer);
      pointer = null;
   }

   void Free()
   {
      if(container)
         container.FreeIterator(pointer);
   }

   bool Index(const IT index, bool create)
   {
      if(container)
      {
         bool justAdded = false;
         Free();
         pointer = container.GetAtPosition(index, create, &justAdded);
         return !justAdded && pointer != null;
      }
      return false;
   }
};

public class Container<class T, class I = int, class D = T>
{
public:
   class_fixed
   public property Container<T> copySrc { set { if(value) Copy(value); } }
   property Iterator<T> firstIterator { get { value = { (Container<T>)this, pointer = GetFirst() }; } }
   property Iterator<T> lastIterator  { get { value = { (Container<T>)this, pointer = GetLast() }; } }

   virtual IteratorPointer GetFirst() { return null; }
   virtual IteratorPointer GetLast()  { return null; }
   virtual IteratorPointer GetPrev(IteratorPointer pointer) { return null; }
   virtual IteratorPointer GetNext(IteratorPointer pointer) { return null; }
   virtual D GetData(IteratorPointer pointer) { return (D)0; }
   virtual bool SetData(IteratorPointer pointer, D data);
   virtual IteratorPointer GetAtPosition(const I pos, bool create, bool * justAdded) { return null; }

   virtual IteratorPointer Insert(IteratorPointer after, T value);
   virtual IteratorPointer Add(T value);
   virtual void Remove(IteratorPointer it);
   virtual void Move(IteratorPointer it, IteratorPointer after);

   virtual void RemoveAll()
   {
      IteratorPointer i, next;
      for(i = GetFirst(), next = i ? GetNext(i) : null; i; i = next, next = i ? GetNext(i) : null)
         Remove(i);
   }

   virtual void Copy(Container<T> source)
   {
      IteratorPointer i;
      RemoveAll();
      for(i = source.GetFirst(); i; i = source.GetNext(i))
      {
         D data = source.GetData(i);
         // WARNING: This doesn't make a new copy of the elements it adds
         Add(data);
      }
   }

   void OnFree()
   {
      if(this)
      {
         Free();
         delete this;
      }
   }

   int OnCompare(Container<T> b)
   {
      IteratorPointer ia, ib;
      Class Dclass = class(D);
      bool byRef = (Dclass.type == systemClass && !Dclass.byValueSystemClass) || Dclass.type == bitClass || Dclass.type == enumClass || Dclass.type == unitClass;
      int (* onCompare)(void *, const void *, const void *) = (void *)Dclass._vTbl[__ecereVMethodID_class_OnCompare];

      if(this && !b) return 1;
      if(b && !this) return -1;
      if(!b && !this) return 0;
      if(GetCount() > b.GetCount()) return 1;
      if(GetCount() < b.GetCount()) return -1;

      ia = GetFirst();
      ib = b.GetFirst();
      while(ia && ib)
      {
         D dataA = GetData(ia);
         D dataB = b.GetData(ib);
         int r = onCompare(Dclass, byRef ? &dataA : (const void *)(uintptr)dataA, byRef ? &dataB : (const void *)(uintptr)dataB);
         if(r) return r;
         ia = GetNext(ia);
         ib = b.GetNext(ib);
      }
      if(ia) return 1;
      if(ib) return -1;
      return 0;
   }

   void OnCopy(Container<T> source)
   {
      if(source)
      {
         // BUG IN this = SYNTAX
         Container<T> container = eInstance_New(source._class);
         // See WARNING in Copy()
         container.Copy(source);
         //*(void **)this = container;
         this = container;
      }
      else
      {
         this = null;
      }
   }

   virtual IteratorPointer Find(const D value)
   {
      IteratorPointer i;
      Class Dclass = class(D);
      bool byRef = (Dclass.type == systemClass && !Dclass.byValueSystemClass) || Dclass.type == bitClass || Dclass.type == enumClass || Dclass.type == unitClass;
      int (* onCompare)(void *, const void *, const void *) = (void *)Dclass._vTbl[__ecereVMethodID_class_OnCompare];
      bool isInt64 = false;
      if(onCompare == (void *)class(int64).OnCompare ||
         (Dclass.type == unitClass && Dclass.typeSize == sizeof(int64) && !strcmp(Dclass.name, "Id")))
      {
         onCompare = (void *)uint64::OnCompare;
         isInt64 = true;
      }

      if(isInt64)
      {
         for(i = GetFirst(); i; i = GetNext(i))
         {
            D data = GetData(i);
            if((uint64)value == (uint64)data) return i;
         }
      }
      else if(byRef)
      {
         for(i = GetFirst(); i; i = GetNext(i))
         {
            D data = GetData(i);
            int result = onCompare(Dclass, &value, &data);
            if(!result)
               return i;
         }
      }
      else
      {
         for(i = GetFirst(); i; i = GetNext(i))
         {
            D data = GetData(i);
            int result = onCompare(Dclass, (const void *)(uintptr) value, (const void *)(uintptr) data);
            if(!result)
               return i;
         }
      }
      return null;
   }

   virtual void FreeIterator(IteratorPointer it);

   virtual int GetCount()
   {
      int count = 0;
      IteratorPointer i;
      for(i = GetFirst(); i; i = GetNext(i)) count++;
      return count;
   }

   virtual void Free()
   {
      IteratorPointer i;
      while((i = GetFirst()))
         Delete(i);
   }

   virtual void Delete(IteratorPointer i)
   {
      D data = GetData(i);
      delete data;
      Remove(i);
   }

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      if(this)
      {
         char itemString[4096];//1024];
         bool first = true;
         IteratorPointer i;
         tempString[0] = '\0';
         for(i = GetFirst(); i; i = GetNext(i))
         {
            Class Dclass = class(D);
            D data = GetData(i);
            const char * result;

            itemString[0] = '\0';

            result = ((const char *(*)(void *, void *, char *, void *, bool *))(void *)Dclass._vTbl[__ecereVMethodID_class_OnGetString])(Dclass,
               ((Dclass.type == systemClass && !Dclass.byValueSystemClass) || Dclass.type == bitClass || Dclass.type == enumClass || Dclass.type == unitClass) ? &data : (void *)data, itemString, null, null);
            if(!first) strcat(tempString, ", ");

            strcat(tempString, result);
            first = false;
         }
      }
      else
         tempString[0] = 0;
      return tempString;
   }

   // TODO: Warn against the danger of using TakeOut with 'normal' classes, as they will be considered equivalent if onCompare says so
   bool TakeOut(const D d)
   {
      IteratorPointer i = Find(d);
      if(i)
      {
         Remove(i);
         return true;
      }
      return false;
   }

   ~Container()
   {
      RemoveAll();
   }

   void OnSerialize(IOChannel channel)
   {
      // NOTE: Null containers currently get serialized as empty
      uint count = this ? GetCount() : 0;
      IteratorPointer i;
      Class Dclass = class(D);
      bool isNormalClass = (Dclass.type == normalClass) && Dclass.structSize;

      channel.Put(count);
      if(this)
         for(i = GetFirst(); i; i = GetNext(i))
         {
            D data = GetData(i);
            Class Eclass = isNormalClass ? ((Instance)data)._class : Dclass;
            ((void (*)(void *, void *, void *))(void *)Eclass._vTbl[__ecereVMethodID_class_OnSerialize])(Eclass,
               ((Dclass.type == systemClass && !Dclass.byValueSystemClass) || Dclass.type == bitClass || Dclass.type == enumClass || Dclass.type == unitClass) ? &data : (void *)data, channel);
         }
   }

   void OnUnserialize(IOChannel channel)
   {
      Container container = eInstance_New(_class.fullName);
      uint count, c;
      Class Dclass = class(D);
      D data;
      bool isStruct = Dclass.type == structClass;
      incref container;

      channel.Get(count);
      if(isStruct)
         data = (D)(new byte[Dclass.structSize]);
      for(c = 0; c < count; c++)
      {
         if(isStruct)
            memset((char *)data, 0, Dclass.structSize);
         else
            data = (D)0;
         ((void (*)(void *, void *, void *))(void *)Dclass._vTbl[__ecereVMethodID_class_OnUnserialize])
            (Dclass, isStruct ? (void *)data : &data, channel);
         container.Add(data);
      }
      if(isStruct)
         delete (void *)data;
      this = container;
   }
private:
   // FIXME: Static is not overriding private
   static void _Sort(bool ascending, Container * lists)
   {
      // Only sort containers with more than 1 items and which are integer indexable
      int count = GetCount();
      if(count >= 2 && class(I) == class(int))
      {
         Iterator a { this };
         Iterator b { this };
         Iterator mid { this };

         Class Dclass = class(D);
         bool byRef = (Dclass.type == systemClass && !Dclass.byValueSystemClass) || Dclass.type == bitClass || Dclass.type == enumClass || Dclass.type == unitClass;
         int (* onCompare)(void *, const void *, const void *) = (void *)Dclass._vTbl[__ecereVMethodID_class_OnCompare];

         Container listA = lists[0];
         Container listB = lists[1];

         // Find midpoint
         mid.Index(count / 2-1, false);

         // Split into 2 lists
         while(a.Next())
         {
            listA.Add(a.data);
            if(a.pointer == mid.pointer)
               break;
         }

         b.pointer = mid.pointer;
         while(b.Next())
            listB.Add(b.data);

         RemoveAll();

         // Sort each of the 2 lists
         listA._Sort(ascending, lists + 2);
         listB._Sort(ascending, lists + 2);

         // Merge
         a = { listA };
         b = { listB };
         a.Next();
         b.Next();

         while(a.pointer || b.pointer)
         {
            int r;
            if(a.pointer && b.pointer)
            {
               D dataA = a.data, dataB = b.data;
               r = onCompare(Dclass, byRef ? &dataA : (const void *)(uintptr)dataA, byRef ? &dataB : (const void *)(uintptr)dataB);
            }
            else if(a.pointer)
               r = -1;
            else
               r = 1;
            if(!ascending) r *= -1;

            if(r < 0)
            {
               Add(a.data);
               a.Next();
            }
            else
            {
               Add(b.data);
               b.Next();
            }
         }

         listA.RemoveAll();
         listB.RemoveAll();
      }
   }

public:
   virtual void Sort(bool ascending)
   {
      // Pre-allocate 2 log2(n) containers
      int i, numLists = log2i(GetCount()) * 2;
      Container * lists = new Container[numLists];
      for(i = 0; i < numLists; i++)
         lists[i] = eInstance_New(_class);
      _Sort(ascending, lists);
      for(i = 0; i < numLists; i++)
         delete lists[i];
      delete lists;
   }
}
