
struct tint
{
public:
   int a;
   int b;
   int OnCompare(tint o)
   {
      if(o.a > a || (o.a == a && o.b > b))
         return 1;
      else if(o.a < a || (o.a == a && o.b < b))
         return -1;
      return 0;
   }
};

struct consttstr
{
public:
   const String a;
   const String b;
   int OnCompare(consttstr o)
   {
      int result;
           if(!a && o.a) result = 1;
      else if(a && !o.a) result = -1;
      else if(!(result = strcmp(a, o.a)))
      {
              if(!b && o.b) result = 1;
         else if(b && !o.b) result = -1;
         else result = strcmp(b, o.b);
      }
      return result;
   }
};

struct tuintptr
{
public:
   uintptr a;
   uintptr b;
   int OnCompare(tuintptr o)
   {
      if(o.a > a || (o.a == a && o.b > b))
         return 1;
      else if(o.a < a || (o.a == a && o.b < b))
         return -1;
      return 0;
   }
};

public class UIntPtr : uintptr // bug / issue: UIntPtr64_OnCompare fails for uintptr
{
   // when UIntPtr64_OnCompare is called comparison never matches, it just keeps adding to the avl tree, never finds
   // found with AVLTree<uintptr> visited { }; switched to AVLTree<UIntPtr> visited { };
   // issue also found with Map<uintptr, String> map { }; but how was it fixed? uintptr seems to still be used? :S
   // perhaps the different type used with the MapIterator is the reason why it worked?
   int OnCompare(UIntPtr o)
   {
      if(o > this)
         return 1;
      else if(o < this)
         return -1;
      return 0;
   }
}

class SortedSetUIntPtr : AVLTree<uintptr> // wish: AVLTree::OnCompare implementation?
{
   // with AVLTree::OnCompare this class and OnCompare implementation would be optional and would serve only as a type name and optimization
   // comparing the keys directly would save the expense of calling T::OnCompare for each node key comparison
   int OnCompare(SortedSetUIntPtr that)
   {
      int result = 0;
      if(this.count < that.count)
         result = 1;
      else if(this.count > that.count)
         result = -1;
      else
      {
         AVLNode<uintptr> a;
         AVLNode<uintptr> b;
         for(a = this.root.minimum, b = that.root.minimum; a && b; a = a.next, b = b.next)
         {
            if(a.key < b.key)
            {
               result = 1;
               break;
            }
            else if(a.key > b.key)
            {
               result = -1;
               break;
            }
         }
      }
      return result;
   }
}
