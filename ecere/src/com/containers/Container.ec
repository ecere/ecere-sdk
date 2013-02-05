namespace com;

import "BuiltInContainer"

default:

static void UnusedFunction()
{
   int a;
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

   bool Find(T value)
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

   bool Index(IT index, bool create)
   {
      if(container)
      {
         Free();
         pointer = container.GetAtPosition(index, create);
         return pointer != null;
      }
      return false;
   }
};

public class Container<class T, class I = int, class D = T>
{
public:
   class_fixed
   public property Container<T> copySrc { set { Copy(value); } }
   property Iterator<T> firstIterator { get { value = { (Container<T>)this, pointer = GetFirst() }; } }
   property Iterator<T> lastIterator  { get { value = { (Container<T>)this, pointer = GetLast() }; } }

   virtual IteratorPointer GetFirst() { return null; }
   virtual IteratorPointer GetLast()  { return null; }
   virtual IteratorPointer GetPrev(IteratorPointer pointer) { return null; }
   virtual IteratorPointer GetNext(IteratorPointer pointer) { return null; }
   virtual D GetData(IteratorPointer pointer) { return (D)0; }
   virtual bool SetData(IteratorPointer pointer, D data);
   virtual IteratorPointer GetAtPosition(I pos, bool create) { return null; }

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
   
   void OnCopy(Container<T> source)
   {
      if(source)
      {
         // BUG IN this = SYNTAX
         Container<T> container = eInstance_New(source._class);
         // See WARNING in Copy()
         container.Copy(source);
         *(void **)this = container;
      }
      else
      {
         *(void **)this = null;
      }
   }

   virtual IteratorPointer Find(D value)
   {
      IteratorPointer i;
      Class Dclass = class(D);
      if((Dclass.type == systemClass || Dclass.type == bitClass || Dclass.type == enumClass || Dclass.type == unitClass))
      {
         for(i = GetFirst(); i; i = GetNext(i))
         {
            D data = GetData(i);
            int result = Dclass._vTbl[__ecereVMethodID_class_OnCompare](Dclass, &value,&data);
            if(!result)
               return i;
         }
      }
      else
      {
         for(i = GetFirst(); i; i = GetNext(i))
         {
            D data = GetData(i);
            int result = Dclass._vTbl[__ecereVMethodID_class_OnCompare](Dclass, (void *)value, (void *)data);
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
      while(i = GetFirst())
         Delete(i);
   }

   virtual void Delete(IteratorPointer i)
   {
      D data = GetData(i);
      delete data;
      Remove(i);
   }

   char * OnGetString(char * tempString, void * fieldData, bool * needClass)
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
            char * result;

            itemString[0] = '\0';
            
            result = ((char *(*)(void *, void *, char *, void *, bool *))(void *)Dclass._vTbl[__ecereVMethodID_class_OnGetString])(Dclass,
               (Dclass.type == systemClass || Dclass.type == bitClass || Dclass.type == enumClass || Dclass.type == unitClass) ? &data : (void *)data, itemString, null, null);
            if(!first) strcat(tempString, ", ");

            strcat(tempString, result);         
            first = false;
         }
      }
      else
         tempString[0] = 0;
      return tempString;
   }

   void TakeOut(D d)
   {
      IteratorPointer i = Find(d);
      if(i) Remove(i);
   }

   ~Container()
   {
      RemoveAll();
   }

   void OnSerialize(IOChannel channel)
   {
      uint count = GetCount();
      IteratorPointer i;
      Class Dclass = class(D);

      channel.Put(count);
      for(i = GetFirst(); i; i = GetNext(i))
      {
         D data = GetData(i);
         Dclass._vTbl[__ecereVMethodID_class_OnSerialize](Dclass, 
            (Dclass.type == systemClass || Dclass.type == bitClass || Dclass.type == enumClass || Dclass.type == unitClass) ? &data : (void *)data, channel);
      }
   }

   void OnUnserialize(IOChannel channel)
   {
      Container container = eInstance_New(_class.fullName);
      uint count, c;
      Class Dclass = class(D);

      channel.Get(count);
      for(c = 0; c < count; c++)
      {
         D data;
         Dclass._vTbl[__ecereVMethodID_class_OnUnserialize](Dclass, &data, channel);
         container.Add(data);
      }
      this = container;
   }
}
