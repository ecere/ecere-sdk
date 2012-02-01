namespace com;

import "instance" // TOFIX: This is required to build Debug on Ubuntu 10.04, GCC 4.4.3
import "LinkList"

public class Link : ListItem
{
   class_fixed
public:
   uint64 data;
}

public class List<class LLT> : LinkList<Link, T = LLT, D = LLT>
{
   class_fixed
   // Generic iterator support
   LLT GetData(Link link)
   {
      return link ? ((class(LLT) && class(LLT).type == structClass) ? (LLT)&link.data : (LLT)link.data) : (LLT)0;
   }

   bool SetData(Link link, LLT value)
   {
      if(class(LLT).type == structClass)
         memcpy((void *)&link.data, (void *)value, class(LLT).structSize);
      else
         link.data = (uint64)value;
      return true;
   }

   Link Insert(Link after, LLT value)
   {
      Link link;
      if(class(LLT) && class(LLT).type == structClass)
      {
         link = (Link)new0 byte[sizeof(class ListItem) + class(LLT).structSize];
         memcpy((void *)&link.data, (void *)value, class(LLT).structSize);
      }
      else
         link = Link { data = (uint64)value };
      LinkList::Insert(after, (LT)link);
      return link;
   }

   Link Add(LLT value)
   {
      return (Link)Insert(last, value);
   }

   void Remove(Link link)
   {
      LinkList::Remove(link);
      delete link;
   }

   void Delete(Link link)
   {
      D data = GetData(link);
      delete data;      
      Remove(link);
   }

   void Free()
   {
      LT item;
      while(item = first)
      {
         D data = GetData(item);
         delete data;      
         Remove(item);
      }
   }

   Link Find(LLT value)
   {
      return (Link)Container::Find(value);
   }
}
