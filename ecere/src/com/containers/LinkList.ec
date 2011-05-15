namespace com;

import "Container"

public struct LinkElement<class T:void *>
{
   T prev, next;
};

public class ListItem : IteratorPointer
{
   class_fixed
public:
   union
   {
      LinkElement<thisclass> link;
      struct { thisclass prev, next; };
   };
}

public class LinkList<class LT:void * = ListItem, bool circ = false, link = LT::link> : Container<LT>
{
   class_fixed
public:
   LT first, last;
   int count;

   // Generic iterator support
   LT GetFirst() { return first; }
   LT GetLast() { return last; }
   LT GetPrev(IteratorPointer item) { return ((LT)item).link.prev; }
   LT GetNext(IteratorPointer item) { return ((LT)item).link.next; }
   LT GetData(IteratorPointer pointer) { return (LT)pointer; }

   IteratorPointer GetAtPosition(I pos, bool create)
   {
      int c;
      LT item;
      for(c = 0, item = first; c < (int)pos && item; c++, item = item.link.next);
      return (IteratorPointer)item;
   }
   bool SetData(IteratorPointer pointer, LT data)
   {
      // Not supported for LinkList
      return false;
   }

   IteratorPointer Add(LT item)
   {
      if(item)
      {
         item.link.prev = last;
         if(item.link.prev) 
            item.link.prev.link.next = item;
         if(!first) first = item;
         last = item;
         item.link.next = circ ? first : null;
         if(circ)
            first.link.prev = item;
         count++;
      }
      return (IteratorPointer)item;
   }

   IteratorPointer Insert(IteratorPointer _prevItem, T item)
   {
      LT prevItem = (LT)_prevItem;
      if(item && prevItem != item)
      {
         item.link.prev = prevItem ? prevItem : (circ ? last : null);
         if(prevItem)
         {
            item.link.next = prevItem.link.next;
            prevItem.link.next = item;
         }
         else
         {
            item.link.next = first;
            first = item;
            if(circ)
            {
               if(item.link.prev)
                  item.link.prev.link.next = item;
               else
                  item.link.next = item;
            }                 
         }
         if(prevItem == last) last = item;
         if(item.link.next)
            item.link.next.link.prev = item;
         count++;
         return (IteratorPointer)item;
      }
      return null;
   }

   void Remove(IteratorPointer _item)
   {
      LT item = (LT)_item;
      if(item)
      {
         if(item.link.prev)
            item.link.prev.link.next = item.link.next;
         if(item.link.next) 
            item.link.next.link.prev = item.link.prev;
         if(circ && last == first)
            last = first = null;
         else
         {
            if(last == item) last = item.link.prev;
            if(first == item) first = item.link.next;
         }
         item.link.prev = null;
         item.link.next = null;
         count--;
      }
   }

   void Move(IteratorPointer _item, IteratorPointer _prevItem)
   {
      LT item = (LT)_item;
      LT prevItem = (LT)_prevItem;
      if(item)
      {
         if(prevItem != item && (first != item || prevItem)) 
         {
            if(item.link.prev) 
               item.link.prev.link.next = item.link.next;
            if(item.link.next) 
               item.link.next.link.prev = item.link.prev;
            if(item == first) first = item.link.next;
            if(item == last)  last = item.link.prev;
      
            if(prevItem == last) 
               last = item;
         
            if(prevItem)
            {
               item.link.next = prevItem.link.next;
               prevItem.link.next = item;
            }
            else
            {
               item.link.next = first;
               first = item;
            }
            item.link.prev = prevItem;
            if(item.link.next) 
               item.link.next.link.prev = item;
         }
      }
   }

   IteratorPointer Find(LT value)
   {
      return (IteratorPointer)value;
   }

   void Free()
   {
      LT item;
      while(item = first)
      {
         Remove(item);
         delete item;
      }
   }

   void Delete(LT item)
   {
      Remove(item);
      delete item;
   }
}
