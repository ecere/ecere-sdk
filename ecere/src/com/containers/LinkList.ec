namespace com;

import "Container"
import "List"  // Ugly dependency for List optimization in Sort()

default:
extern int __ecereVMethodID_class_OnCompare;
private:

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

   IteratorPointer GetAtPosition(const I pos, bool create, bool * justAdded)
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
      while((item = first))
      {
         Remove(item);
         delete item;
      }
   }

   // TOFIX: This compiles without error but produces bad code, since the virtual method prototype is an IteratorPointer which should be a pointer, not a uint64
   //void Delete(LT item)
   void Delete(void * item)
   {
      Remove(item);
      delete item;
   }

   // Optimized Merge Sort Reusing List Nodes
   static void _Sort(bool ascending, LinkList * lists)
   {
      // Only sort containers with more than 1 items and which are integer indexable
      if(count >= 2)
      {
         LT a, b, mid;
         Class Dclass = class(D);
         bool byRef = (Dclass.type == systemClass && !Dclass.byValueSystemClass) || Dclass.type == bitClass || Dclass.type == enumClass || Dclass.type == unitClass;
         bool isList = GetData == List::GetData;
         bool isLinkList = GetData == LinkList::GetData;
         bool isStruct = Dclass.type == structClass;
         int (* onCompare)(void *, const void *, const void *) = (void *)Dclass._vTbl[__ecereVMethodID_class_OnCompare];
         LinkList listA = lists[0];
         LinkList listB = lists[1];

         // Find midpoint
         mid = GetAtPosition(count / 2-1, false, null);

         // Split into 2 lists
         a = first;
         b = mid.link.next;

         while(a)
         {
            LT i = a;
            bool done = (a == mid);
            a = a.link.next;
            listA.LinkList::Add((void *)(uintptr)i);
            if(done) break;
         }

         while(b)
         {
            LT i = b;
            b = b.link.next;
            listB.LinkList::Add((void *)(uintptr)i);
         }

         first = null, last = null, count = 0;

         // Sort each of the 2 lists
         listA._Sort(ascending, lists+2);
         listB._Sort(ascending, lists+2);

         // Merge
         a = listA.first;
         b = listB.first;

         while(a || b)
         {
            int r;
            if(a && b)
            {
               if(isLinkList)
                  r = onCompare(Dclass, a, b);
               else if(isList)
               {
                  if(isStruct || byRef)
                     r = onCompare(Dclass, &((Link)a).data, &((Link)b).data);
                  else
                     r = onCompare(Dclass, (const void *)(uintptr)((Link)a).data, (const void *)(uintptr)((Link)b).data);
               }
               else
               {
                  D dataA = GetData(a), dataB = GetData(b);
                  r = onCompare(Dclass, byRef ? &dataA : (const void *)(uintptr)dataA, byRef ? &dataB : (const void *)(uintptr)dataB);
               }
            }
            else if(a)
               r = -1;
            else
               r = 1;
            if(!ascending) r *= -1;

            if(r < 0)
            {
               LT i = a;
               a = a.link.next;
               LinkList::Add((void *)(uintptr)i);
            }
            else
            {
               LT i = b;
               b = b.link.next;
               LinkList::Add((void *)(uintptr)i);
            }
         }
         listA.first = null, listA.last = null, listA.count = 0;
         listB.first = null, listB.last = null, listB.count = 0;
      }
   }

   void Sort(bool ascending)
   {
      // Pre-allocate 2 log2(n) lists
      int i, numLists = log2i(count) * 2;
      LinkList * lists = new LinkList[numLists];
      for(i = 0; i < numLists; i++)
         lists[i] = eInstance_New(_class);
      _Sort(ascending, lists);
      for(i = 0; i < numLists; i++)
         delete lists[i];
      delete lists;
   }
}
