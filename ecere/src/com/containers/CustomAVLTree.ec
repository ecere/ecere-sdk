namespace com;

import "Container"

default:

extern int __ecereVMethodID_class_OnCompare;
extern int __ecereVMethodID_class_OnCopy;
private:

public class AVLNode<class T> : IteratorPointer
{
   class_fixed

   thisclass parent, left, right;
   int depth;
public:
   T key;

   property thisclass prev
   {
      get
      {
         if(left)
            return left.maximum;
         while(this)
         {
            if(parent && this == parent.right)
               return parent;
            else
               this = parent;
         }
         return this;
      }
   }

   property thisclass next
   {
      get
      {
         thisclass right = this.right;
         if(right)
            return right.minimum;
         while(this)
         {
            thisclass parent = this.parent;
            if(parent && this == parent.left)
               return parent;
            else
               this = parent;
         }
         return null;
      }
   }

   property thisclass minimum
   {
      get { while(left) this = left; return this; }
   }

   property thisclass maximum
   {
      get { while(right) this = right; return this; }
   }

   property int count
   {
      get { return 1 + (left ? left.count : 0) + (right ? right.count : 0); }
   }
   property int depthProp
   {
      get
      {
         int leftDepth = left ? (left.depthProp+1) : 0;
         int rightDepth = right ? (right.depthProp+1) : 0;
         return Max(leftDepth, rightDepth);
      }
   }
private:

   void Free()
   {
   	if (left) left.Free();
   	if (right) right.Free();
      delete this;
   }

   bool Add(Class Tclass, thisclass node)
   {
      if(!Tclass)
         Tclass = class(uint64);
      while(true)
      {
         // *** NEED COMPARISON OPERATOR SUPPORT HERE INVOKING OnCompare, AS WELL AS TYPE INFORMATION PASSED ***
         int result;
         byte * a, * b;
         if((Tclass.type == systemClass && !Tclass.byValueSystemClass) || Tclass.type == bitClass || Tclass.type == enumClass || Tclass.type == unitClass || Tclass.type == structClass)
         {
            a = (byte *)&node.key;
            b = (byte *)&key;
            a += __ENDIAN_PAD((Tclass.type == structClass) ? sizeof(void *) : Tclass.typeSize);
            b += __ENDIAN_PAD((Tclass.type == structClass) ? sizeof(void *) : Tclass.typeSize);
         }
         else
         {
            a = (byte *)node.key;
            b = (byte *)key;
         }

         result = ((int (*)(void *, void *, void *))(void *)Tclass._vTbl[__ecereVMethodID_class_OnCompare])(Tclass, a, b);
         if(!result)
         {
            return false;
         }
         else if(result > 0)
         {
            if(right)
               this = right;
            else
            {
               node.parent = this;
      			right = node;
               node.depth = 0;
               {
                  AVLNode<T> n;
                  for(n = this; n; n = n.parent)
                  {
                     int newDepth = Max(n.left ? (n.left.depth+1) : 0, n.right ? (n.right.depth+1) : 0);
                     if(newDepth == n.depth)
                        break;
                     n.depth = newDepth;
                  }
               }
               return true;
      		}
      	}
         else
         {
            if(left)
               this = left;
            else
            {
               node.parent = this;
               left = node;
               node.depth = 0;
               {
                  AVLNode<T> n;
                  for(n = this; n; n = n.parent)
                  {
                     int newDepth = Max(n.left ? (n.left.depth+1) : 0, n.right ? (n.right.depth+1) : 0);
                     if(newDepth == n.depth)
                        break;
                     n.depth = newDepth;
                  }
               }
               return true;
            }
      	}
      }
   }

   public thisclass Find(Class Tclass, const T key)
   {
      while(this)
      {
         // *** NEED COMPARISON OPERATOR SUPPORT HERE INVOKING OnCompare, AS WELL AS TYPE INFORMATION PASSED ***
         int result;
         byte * a, * b;
         if((Tclass.type == systemClass && !Tclass.byValueSystemClass) || Tclass.type == bitClass || Tclass.type == enumClass || Tclass.type == unitClass)
         {
            a = (byte *)&(uint64)key;
            a += __ENDIAN_PAD(Tclass.typeSize);
         }
         else
            a = (byte *)key;

         if((Tclass.type == systemClass && !Tclass.byValueSystemClass) || Tclass.type == bitClass || Tclass.type == enumClass || Tclass.type == unitClass || Tclass.type == structClass)
         {
            b = (byte *)&this.key;
            b += __ENDIAN_PAD((Tclass.type == structClass) ? sizeof(void *) : Tclass.typeSize);
         }
         else
            b = (byte *)this.key;

         result = ((int (*)(void *, void *, void *))(void *)Tclass._vTbl[__ecereVMethodID_class_OnCompare])(Tclass, a, b);

         if(result < 0)
            this = left;
         else if(result > 0)
            this = right;
         else
            break;
      }
      return this;
   }

   thisclass FindAll(const T key)
   {
      AVLNode<T> result = null;
      // *** FIND ALL COMPARES KEY FOR EQUALITY, NOT USING OnCompare ***
      if(this.key == key) result = this;
      if(!result && left) result = left.FindAll(key);
      if(!result && right) result = right.FindAll(key);
      return result;
   }

   void RemoveSwap(thisclass swap)
   {
      if(swap.left)
      {
         swap.left.parent = swap.parent;
         if(swap == swap.parent.left)
            swap.parent.left = swap.left;
         else if(swap == swap.parent.right)
            swap.parent.right = swap.left;
         swap.left = null;
      }
      if(swap.right)
      {
         swap.right.parent = swap.parent;
         if(swap == swap.parent.left)
            swap.parent.left = swap.right;
         else if(swap == swap.parent.right)
            swap.parent.right = swap.right;
         swap.right = null;
      }

      if(swap == swap.parent.left) swap.parent.left = null;
      else if(swap == swap.parent.right) swap.parent.right = null;

      {
         AVLNode<T> n;
         for(n = swap.parent; n; n = n.parent)
         {
            int newDepth = Max(n.left ? (n.left.depth+1) : 0, n.right ? (n.right.depth+1) : 0);
            if(newDepth == n.depth)
               break;
            n.depth = newDepth;
            if(n == this) break;
         }
      }

      swap.left = left;
      if(left)
         left.parent = swap;

       swap.right = right;
       if (right)
            right.parent = swap;

      swap.parent = parent;
      left = null;
      right = null;
      if(parent)
      {
         if(this == parent.left) parent.left = swap;
         else if(this == parent.right) parent.right = swap;
      }
   }

   thisclass RemoveSwapLeft()
   {
      thisclass swap = left ? left.maximum : right;
      thisclass swapParent = null;
      if(swap) { swapParent = swap.parent; RemoveSwap(swap); }
      if(parent)
      {
         if(this == parent.left) parent.left = null;
         else if(this == parent.right) parent.right = null;
      }
      {
         AVLNode<T> n;
         for(n = swap ? swap : parent; n; n = n.parent)
         {
            int newDepth = Max(n.left ? (n.left.depth+1) : 0, n.right ? (n.right.depth+1) : 0);
            if(newDepth == n.depth && n != swap)
               break;
            n.depth = newDepth;
         }
      }
      if(swapParent && swapParent != this)
         return swapParent.Rebalance();
      else if(swap)
         return swap.Rebalance();
      else if(parent)
         return parent.Rebalance();
      else
         return null;
   }

   thisclass RemoveSwapRight()
   {
      thisclass result;
      thisclass swap = right ? right.minimum : left;
      thisclass swapParent = null;
      if(swap) { swapParent = swap.parent; RemoveSwap(swap); }
      if(parent)
      {
         if(this == parent.left) parent.left = null;
         else if(this == parent.right) parent.right = null;
      }
      {
         AVLNode<T> n;
         for(n = swap ? swap : parent; n; n = n.parent)
         {
            int newDepth = Max(n.left ? (n.left.depth+1) : 0, n.right ? (n.right.depth+1) : 0);

            if(newDepth == n.depth && n != swap)
               break;
            n.depth = newDepth;
         }
      }
      if(swapParent && swapParent != this)
         result = swapParent.Rebalance();
      else if(swap)
         result = swap.Rebalance();
      else if(parent)
         result = parent.Rebalance();
      else
         result = null;
      return result;
   }

   property int balanceFactor
   {
      get
      {
         int leftDepth = left ? (left.depth+1) : 0;
         int rightDepth = right ? (right.depth+1) : 0;
         return rightDepth - leftDepth;
      }
   }

   thisclass Rebalance()
   {
      while(true)
      {
         int factor = balanceFactor;
         if (factor < -1)
         {
            if(left.balanceFactor == 1)
               DoubleRotateRight();
            else
               SingleRotateRight();
         }
         else if (factor > 1)
         {
            if(right.balanceFactor == -1)
               DoubleRotateLeft();
            else
               SingleRotateLeft();
         }
         if(parent)
            this = parent;
         else
            return this;
      }
   }

   void SingleRotateRight()
   {
      if(parent)
      {
         if(this == parent.left)
            parent.left = left;
         else if(this == parent.right)
            parent.right = left;
      }
      left.parent = parent;
      parent = left;
      left = parent.right;
      if(left) left.parent = this;
      parent.right = this;

      depth = Max(left ? (left.depth+1) : 0, right ? (right.depth+1) : 0);
      parent.depth = Max(parent.left ? (parent.left.depth+1) : 0, parent.right ? (parent.right.depth+1) : 0);
      {
         AVLNode<T> n;
         for(n = parent.parent; n; n = n.parent)
         {
            int newDepth = Max(n.left ? (n.left.depth+1) : 0, n.right ? (n.right.depth+1) : 0);
            if(newDepth == n.depth)
               break;
            n.depth = newDepth;
         }
      }
   }

   void SingleRotateLeft()
   {
      if(parent)
      {
         if(this == parent.right)
            parent.right = right;
         else if(this == parent.left)
            parent.left = right;
      }
      right.parent = parent;
      parent = right;
      right = parent.left;
      if(right) right.parent = this;
      parent.left = this;

      depth = Max(left ? (left.depth+1) : 0, right ? (right.depth+1) : 0);
      parent.depth = Max(parent.left ? (parent.left.depth+1) : 0, parent.right ? (parent.right.depth+1) : 0);
      {
         AVLNode<T> n;
         for(n = parent.parent; n; n = n.parent)
         {
            int newDepth = Max(n.left ? (n.left.depth+1) : 0, n.right ? (n.right.depth+1) : 0);
            if(newDepth == n.depth)
               break;
            n.depth = newDepth;
         }
      }
   }

   void DoubleRotateRight()
   {
      left.SingleRotateLeft();
      SingleRotateRight();
   }

   void DoubleRotateLeft()
   {
      right.SingleRotateRight();
      SingleRotateLeft();
   }
};

public class CustomAVLTree<class BT:AVLNode, class KT = uint64> : Container<BT>
{
   class_fixed

public:
   BT root;
   int count;

   IteratorPointer GetFirst() { return (IteratorPointer) (root ? root.minimum : null); }
   IteratorPointer GetLast()  { return (IteratorPointer) (root ? root.maximum : null); }
   IteratorPointer GetPrev(IteratorPointer node) { return ((BT)node).prev; }
   IteratorPointer GetNext(IteratorPointer node) { return ((BT)node).next; }
   BT GetData(IteratorPointer node) { return (BT)node; }
   bool SetData(IteratorPointer node, BT data)
   {
      // Not supported for CustomAVLTree
      return false;
   }

   IteratorPointer Add(BT node)
   {
      if(!root)
         root = node;
      else
      {
         Class Tclass = class(BT).templateArgs[0].dataTypeClass;
         if(!Tclass)
         {
            Tclass = class(BT).templateArgs[0].dataTypeClass =
               eSystem_FindClass(__thisModule.application, class(BT).templateArgs[0].dataTypeString);
         }
         if(root.Add(Tclass /*class(BT).templateArgs[0].dataTypeClass*/, node))
            root = node.Rebalance();
         else
            return null;
      }
      count++;
      return (IteratorPointer)node;
   }

   void Remove(IteratorPointer node)
   {
      BT parent = ((BT)node).parent;

      if(parent || root == (BT)node)
      {
         root = ((BT)node).RemoveSwapRight();
         count--;
         ((BT)node).parent = null;
      }
   }

   void Delete(IteratorPointer _item)
   {
      BT item = (BT)_item;
      // THIS SHOULDN'T BE CALLING THE VIRTUAL FUNCTION
      CustomAVLTree::Remove(_item);
      delete item;
   }

   void Free()
   {
      BT item;
      while((item = root))
      {
         // THIS SHOULDN'T BE CALLING THE VIRTUAL FUNCTION
         CustomAVLTree::Remove(item);
         delete item;
      }
   }

   IteratorPointer Find(BT value)
   {
      return (IteratorPointer)value;
   }
}
