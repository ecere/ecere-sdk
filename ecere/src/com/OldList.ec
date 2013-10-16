namespace sys;

import "instance"

public class Item : struct
{
public:
   class_fixed
   Item prev, next;

   void Copy(Item src, int size)
   {
      memcpy((byte *)this + sizeof(class Item), (byte *)src + sizeof(class Item), size - sizeof(Item));
   }
};
public class NamedItem : struct
{
public:
   class_fixed
   NamedItem prev, next;
   char * name;
};
public class OldLink : struct
{
public:
   OldLink prev, next;
   void * data;
   class_fixed

   void Free()
   {
      delete data;
   }
};
public class NamedLink : struct
{
public:
   class_fixed
   NamedLink prev, next;
   char * name;
   void * data;
};

public class NamedLink64 : struct
{
public:
   class_fixed
   NamedLink64 prev, next;
   char * name;
   int64 data;
};

public struct OldList
{
private:

   void Merge(OldList list1, OldList list2, int (*compare)(void *, void *, void *), void * data)
   {
      void * item;

      Clear();
      offset = list1.offset;

      // Add the smallest elements while we have two lists
      while((list1.first && list2.first))
      {
         if(compare(list1.first, list2.first, data) <= 0)
         {
            item = list1.first;
            list1.Remove(item);
         }
         else
         {
            item = list2.first;
            list2.Remove(item);
         }
         Add(item);
      }

      // Add the remaining elements
      while((item = list1.first))
      {
         list1.Remove(item);
         Add(item);
      }
      while((item = list2.first))
      {
         list2.Remove(item);
         Add(item);
      }
   }

public:
   void * first, * last;
   int count;
   uint offset;
   bool circ;

   void Add(void * item)
   {
      if(item)
      {
         Item link = (Item) ((byte *)item + offset);

#ifdef MEMINFO // _DEBUG
         {
            void * i;
            OldLink l;
            for(i = first; i; i = l.next)
            {
               if(item == i)
                  break;
               l = (OldLink)((byte *)i + offset);
               if(i == last) { i = null; break; }
            }
            if(i)
            {
               printf("Adding item already in list\n");
               return;
            }
            if(link.prev || link.next)
               printf("Adding item with non-zero prev/next pointers\n");
         }
#endif

         link.prev = last;
         if(link.prev)
            ((Item) ((byte *)link.prev + offset)).next = item;
         if(!first) first = item;
         last = item;
         link.next = circ ? first : null;
         if(circ)
            ((Item) ((byte *)first + offset)).prev = item;
         count++;
      }
   }

   bool Insert(void * prevItem, void * item)
   {
      if(item && prevItem != item)
      {
         Item prevLink = (Item) ((byte *)prevItem + offset);
         Item link = (Item) ((byte *)item + offset);

#ifdef MEMINFO // _DEBUG
         {
            void * i;
            OldLink l;
            for(i = first; i; i = l.next)
            {
               if(item == i)
                  break;
               l = (OldLink)((byte *)i + offset);
               if(i == last) { i = null; break; }
            }
            if(i)
            {
               printf("Inserting item already in list\n");
               return false;
            }
         }
#endif
         link.prev = prevItem ? prevItem : (circ ? last : null);
         if(prevItem)
         {
            link.next = prevLink.next;
            prevLink.next = item;
         }
         else
         {
            link.next = first;
            first = item;
            if(circ)
            {
                if(link.prev)
                  ((Item)((byte *)link.prev + offset)).next = item;
                else
                   link.next = item;
            }
         }
         if(prevItem == last) last = item;
         if(link.next)
            ((Item)((byte *)link.next + offset)).prev = item;
         count++;
         return true;
      }
      return false;
   }

   void Remove(void * item)
   {
      if(item)
      {
         Item link = (Item) ((byte *)item + offset);

#ifdef MEMINFO // _DEBUG
         {
            void * i;
            OldLink l;
            for(i = first; i; i = l.next)
            {
               if(item == i)
                  break;
               l = (OldLink)((byte *)i + offset);
               if(i == last) { i = null; break; }
            }
            if(!i)
               printf("Removing item not found in list\n");
         }
#endif

         if(link.prev)
            ((Item) ((byte *)link.prev + offset)).next = link.next;
         if(link.next)
            ((Item) ((byte *)link.next + offset)).prev = link.prev;
         if(circ && last == first)
            last = first = null;
         else
         {
            if(last == item) last = link.prev;
            if(first == item) first = link.next;
         }
         link.prev = null;
         link.next = null;
         count--;
      }
   }

   void Delete(void * item)
   {
      if(item)
      {
         Remove(item);
         delete item;
      }
   }

   void Free(void (* freeFn)(void *))
   {
      void * item, * next;

      for(item = first; item; item = next)
      {
         Item link = (Item) ((byte *)item + offset);
         next = link.next;

         if(freeFn)
            freeFn(item);
         delete item;

         // Handle list->circular linked lists
         if(next == first) break;
      }
      first = last = null;
      count = 0;
   }

   void RemoveAll(void (* freeFn)(void *))
   {
      void * item, * next;

      for(item = first; item; item = next)
      {
         Item link = (Item) ((byte *)item + offset);
         next = link.next;

         if(freeFn)
            freeFn(item);

         // Handle list->circular linked lists
         if(next == first) break;
      }
      first = last = null;
      count = 0;
   }

   void Clear(void)
   {
      // Should this be done in Clear??
      offset = 0;
      circ = false;

      count = 0;
      first = last = null;
   }

   void Move(void * item, void * prevItem)
   {
      if(item)
      {
         Item link = (Item) ((byte *)item + offset);
         Item prevLink = (Item) ((byte *)prevItem + offset);

         if(prevItem != item && (first != item || prevItem))
         {
            if(link.prev)
               ((Item)((byte *)link.prev + offset)).next = link.next;
            if(link.next)
               ((Item)((byte *)link.next + offset)).prev = link.prev;
            if(item == first) first = link.next;
            if(item == last)  last = link.prev;

            if(prevItem == last)
               last = item;

            link.prev = prevItem ? prevItem : (circ ? last : null);
            if(prevItem)
            {
               link.next = prevLink.next;
               prevLink.next = item;
            }
            else
            {
               link.next = first;
               first = item;
               if(circ)
               {
                   if(link.prev)
                     ((Item)((byte *)link.prev + offset)).next = item;
                   else
                      link.next = item;
               }
            }
            if(link.next)
               ((Item) ((byte *)link.next + offset)).prev = item;
         }
      }
   }

   void Swap(void * item1, void * item2)
   {
      Item link1 = (Item) ((byte *)item1 + offset);
      Item link2 = (Item) ((byte *)item2 + offset);
      Item prev1 = link1.prev, next1 = link1.next;
      void * tmp1 = item1, * tmp2 = item2;

      link1.prev = link2.prev;
      link1.next = link2.next;
      link2.prev = prev1;
      link2.next = next1;

      if(first == tmp1)      first = item2;
      else if(first == tmp2) first = item1;

      if(last == tmp1)       last = item1;
      else if(last == tmp2)  last = item2;

      if(link1.next) ((Item) ((byte *)link1.next + offset)).prev = item2;
      if(link1.prev) ((Item) ((byte *)link1.prev + offset)).next = item2;
      if(link2.next) ((Item) ((byte *)link2.next + offset)).prev = item1;
      if(link2.prev) ((Item) ((byte *)link2.prev + offset)).next = item1;
   }

   void Sort(int (*compare)(void *, void *, void *), void * data)
   {
      if(first && ((Item) ((byte *)first + offset)).next)
      {
         OldList list1, list2;
         void * middle, * end;

         // Find a middle point
         for(middle = first, list1.count = 0, list2.count = 0,
             end = ((Item) ((byte *)first + offset)).next;
             middle && end;
             middle = ((Item)((byte *)middle + offset)).next, list1.count++,
             end    = ((Item)((byte *)end    + offset)).next, list2.count++)
         {
            end = ((Item)((byte *)end + offset)).next;
            if(!end) break;
         }

         // Split into two lists
         list1.offset = offset;
         list2.offset = offset;
         list1.circ = circ;
         list2.circ = circ;

         list1.first = first;
         list1.last = middle;
         list2.first = ((Item)((byte *)middle + offset)).next;
         list2.last = last;

         ((Item)((byte *)list1.last  + offset)).next = null;
         ((Item)((byte *)list2.first + offset)).prev = null;

         // Recurse with those two lists
         list1.Sort(compare, data);
         list2.Sort(compare, data);

         // Merge the two lists together
         Merge(list1, list2, compare, data);
      }
   }

   void * FindName(char * name, bool warn)
   {
      void * result = null;
      if(name)
      {
         void * item;
         NamedItem link;

         int compare = 1;
         for(item = first; item; item = link.next)
         {
            link = (NamedItem)(((byte *)item) + offset);
            if(link.name && (compare = strcmp(link.name, name)) >= 0)
               break;
         }
         if(!compare)
            result = item;
         else if(warn)
            ; //LogErrorCode(ERR_NAME_INEXISTANT, name);
      }
      return result;
   }

   bool PlaceName(char * name, void ** place)
   {
      bool result = true;
      void * item;
      NamedItem link;
      int compare = 1;

      for(item = first; item; item = link.next)
      {
         link = (NamedItem)((byte *)item + offset);
         if(link.name && (compare = strcmp(link.name, name)) >= 0)
            break;
      }

      if(!item)
         *place = last;
      else
         *place = link.prev;

      if(compare)
         result = true;
      else
         ; //LogErrorCode(ERR_NAME_EXISTS, name);
      return result;
   }

   bool AddName(void * item)
   {
      bool result = false;
      void * place;
      NamedItem link = ((NamedItem)((byte *)item + offset));

      if(PlaceName(link.name, &place))
      {
         Insert(place, item);
         result = true;
      }
      return result;
   }

   OldLink FindLink(void * data)
   {
      void * item;
      OldLink link;
      for(item = first; item; item = link.next)
      {
         link = (OldLink)((byte *)item + offset);
         if(link.data == data)
            break;
      }
      return item;
   }

   void * FindNamedLink(char * name, bool warn)
   {
      if(name)
      {
         void * item = FindName(name, warn);
         return item ? ((NamedLink)((byte *)item + offset)).data : null;
      }
      return null;
   }

   void Copy(OldList src, int size, void (* copy)(void * dest, void * src))
   {
      Item item;
      Clear();
      for(item = src.first; item; item = item.next)
      {
         Item newItem = (Item) new0 byte[size];
         Add(newItem);
         newItem.Copy(item, size);
         if(copy) copy(newItem, item);
      }
   }
};
