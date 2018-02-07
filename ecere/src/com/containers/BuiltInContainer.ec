namespace com;

import "instance"
import "Container"

public class IteratorPointer : struct;

default:
extern int __ecereVMethodID_class_OnCompare;
extern int __ecereVMethodID_class_OnFree;
extern int __ecereVMethodID_class_OnGetString;
private:

public struct BuiltInContainer
{
public:
   void ** _vTbl;
   Class _class;
   int _refCount;
public:
   void * data;
   int count;
   Class type;

   property Container { get { return (void *)this; } }

   virtual IteratorPointer GetFirst() { return data; }
   virtual IteratorPointer GetLast()  { return (IteratorPointer)(data ? ((byte *)data + (count * type.typeSize) - 1) : null); }
   virtual IteratorPointer GetPrev(IteratorPointer pointer)
   {
      return (IteratorPointer)((pointer && (byte *)pointer > (byte *)data) ?
         ((byte *)pointer - type.typeSize) : null);
   }
   virtual IteratorPointer GetNext(IteratorPointer pointer)
   {
      return (IteratorPointer)((pointer && (byte *)pointer < (byte *)data + (count - 1) * type.typeSize) ?
         ((byte *)pointer + type.typeSize) : null);
   }
   virtual uint64 GetData(IteratorPointer pointer)
   {
      uint64 * item = (uint64 *)pointer;
      return ((((type.type == structClass) ? ((uint64)(uintptr)item) :
            ((type.typeSize == 1) ? *((unsigned char *)item) :
               ((type.typeSize == 2) ? *((unsigned short *)item) :
                  ((type.typeSize == 4) ? *((unsigned int *)item) : *((uint64 *)item)))))));
   }
   virtual bool SetData(IteratorPointer pointer, uint64 data)
   {
      return false;
   }
   virtual IteratorPointer GetAtPosition(const uint64 pos, bool create)
   {
      return data ? (IteratorPointer)((byte *)data + pos * type.typeSize) : null;
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
         int result = ((int (*)(void *, void *, void *))(void *)Dclass._vTbl[__ecereVMethodID_class_OnCompare])(Dclass,
            ((Dclass.type == systemClass && !Dclass.byValueSystemClass) || Dclass.type == bitClass || Dclass.type == enumClass || Dclass.type == unitClass) ? &value : (void *)(uintptr)value,
            ((Dclass.type == systemClass && !Dclass.byValueSystemClass) || Dclass.type == bitClass || Dclass.type == enumClass || Dclass.type == unitClass) ? &data : (void *)(uintptr)data);
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
         ((void (*)(void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnFree])(type, (void *)(uintptr)GetData(i));
   }

   virtual void Delete(IteratorPointer it) { }

   const char * OnGetString(char * tempString, void * fieldData, bool * needClass)
   {
      if(this)
      {
         Class Dclass = type;
         char itemString[4096];
         bool first = true;
         byte * data = this.data;
         int i;
         tempString[0] = '\0';
         for(i = 0; i < count; i++)
         {
            const char * result;
            itemString[0] = '\0';
            result = ((const char *(*)(void *, void *, char *, void *, bool *))(void *)Dclass._vTbl[__ecereVMethodID_class_OnGetString])(
               Dclass, (type.type == normalClass || type.type == noHeadClass) ? *(void **)data : data, itemString, null, null);
            if(!first) strcat(tempString, ", ");
            strcat(tempString, result);
            first = false;
            data += Dclass.typeSize;
         }
      }
      else
         tempString[0] = 0;
      return tempString;
   }

   virtual void Sort(bool ascending)
   {

   }
};
