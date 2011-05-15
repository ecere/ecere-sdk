namespace com;

import "instance"
import "Container"

public class IteratorPointer : struct;

default:
extern int __ecereVMethodID_class_OnCompare;
extern int __ecereVMethodID_class_OnFree;
private:

public struct BuiltInContainer
{
public:
   void * _vTbl;
   Class _class;
   int _refCount;
public:
   void * data;
   int count;
   Class type;

   property Container { get { return this; } }

   virtual IteratorPointer GetFirst() { return data; }
   virtual IteratorPointer GetLast()  { return (IteratorPointer)(data ? ((byte *)data + (count * type.typeSize) - 1) : null); }
   virtual IteratorPointer GetPrev(IteratorPointer pointer)
   {
      return (IteratorPointer)((pointer && (byte *)pointer > (byte *)data) ? 
         ((byte *)pointer - ((type.type == noHeadClass || type.type == normalClass) ? sizeof(void *) : type.typeSize)) : null);
   }
   virtual IteratorPointer GetNext(IteratorPointer pointer)
   {
      return (IteratorPointer)((pointer && (byte *)pointer < (byte *)data + (count - 1) * 
         ((type.type == noHeadClass || type.type == normalClass) ? sizeof(void *) : type.typeSize) ? 
         ((byte *)pointer + ((type.type == noHeadClass || type.type == normalClass) ? sizeof(void *) : type.typeSize)) : null);
   }
   virtual uint64 GetData(IteratorPointer pointer)
   {
      uint64 * item = (uint64 *)pointer;
      return ((((type.type == structClass) ? ((uint64)item) : 
         (type.type == normalClass || type.type == noHeadClass) ? (uint64)*((void **)item) : 
            ((type.typeSize == 1) ? *((unsigned char *)item) : 
               ((type.typeSize == 2) ? *((unsigned short *)item) : 
                  ((type.typeSize == 4) ? *((unsigned int *)item) : *((uint64 *)item)))))));
   }
   virtual bool SetData(IteratorPointer pointer, uint64 data)
   {
      return false;
   }
   virtual IteratorPointer GetAtPosition(uint64 pos, bool create)
   {
      return data ? (IteratorPointer)((byte *)data + 
         ((type.type == noHeadClass || type.type == normalClass) ? sizeof(void *) : type.typeSize)) : null;
   }
   virtual IteratorPointer Insert(IteratorPointer after, uint64 value)
   {
      return null;
   }
   virtual IteratorPointer Add(uint64 value)
   {
      return null;
   }
   virtual void Remove(IteratorPointer it)
   {
   }
   virtual void Move(IteratorPointer it, IteratorPointer after)
   {
   }
   virtual void RemoveAll()
   {
      IteratorPointer i;
      for(i = GetFirst(); i; i = GetNext(i))
         Remove(i);
   }

   virtual void Copy(Container source)
   {
   }

   virtual IteratorPointer Find(uint64 value)
   {
      IteratorPointer i;
      for(i = GetFirst(); i; i = GetNext(i))
      {
         uint64 data = GetData(i);
         Class Dclass = type;
         int result = Dclass._vTbl[__ecereVMethodID_class_OnCompare](Dclass, 
            (Dclass.type == systemClass || Dclass.type == bitClass || Dclass.type == enumClass || Dclass.type == unitClass) ? &value : (void *)value,
            (Dclass.type == systemClass || Dclass.type == bitClass || Dclass.type == enumClass || Dclass.type == unitClass) ? &data : (void *)data);
         if(!result)
            return i;
      }
      return null;
   }
   
   virtual void FreeIterator(IteratorPointer it);
   virtual int GetCount() { return count; }

   virtual void Free()
   {
      IteratorPointer i;
      for(i = GetFirst(); i; i = GetNext(i))
         type._vTbl[__ecereVMethodID_class_OnFree](type, GetData(i));
   }

   virtual void Delete(IteratorPointer it) { }
};
