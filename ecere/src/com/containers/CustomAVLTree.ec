namespace com;

import "Container"

default:

extern int __ecereVMethodID_class_OnCompare;
extern int __ecereVMethodID_class_OnCopy;
extern int __ecereVMethodID_class_OnFree;
private:

enum AddSide : int { compare = 0, left = -1, right = 1};

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

   bool Add(Class Tclass, thisclass node, AddSide addSide)
   {
      ClassType t;
      int (* onCompare)(void *, void *, void *);
      uint offset = 0;
      bool reference = false;
      byte * a;

      if(!Tclass)
         Tclass = class(uint64);
      t = Tclass.type;
      onCompare = (void *)Tclass._vTbl[__ecereVMethodID_class_OnCompare];
      if((t == systemClass && !Tclass.byValueSystemClass) || t == bitClass || t == enumClass || t == unitClass || t == structClass)
      {
         reference = true;
         offset = __ENDIAN_PAD((t == structClass) ? sizeof(void *) : Tclass.typeSize);
      }
      a = reference ? ((byte *)&node.key + offset) : ((byte *)(uintptr)node.key);

      while(true)
      {
         int result;
         if(addSide)
            result = addSide;
         else
         {
            byte * b = reference ? ((byte *)&key + offset) : (byte *)(uintptr)key;
            result = onCompare(Tclass, a, b);
         }
         if(!result)
            return false;
         else if(result > 0)
         {
            if(right)
               this = right;
            else
            {
      			right = node;
               break;
      		}
      	}
         else
         {
            if(left)
               this = left;
            else
            {
               left = node;
               break;
            }
      	}
      }
      node.parent = this;
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

   public thisclass Find(Class Tclass, const T key)
   {
      byte * a;
      bool reference = false;
      uint offset = 0;
      ClassType t = Tclass.type;
      int (* onCompare)(void *, void *, void *) = (void *)Tclass._vTbl[__ecereVMethodID_class_OnCompare];

      reference = (t == systemClass && !Tclass.byValueSystemClass) || t == bitClass || t == enumClass || t == unitClass;
      offset = __ENDIAN_PAD(Tclass.typeSize);
      a = reference ? ((byte *)&(uint64)key) + offset : (byte *)(uintptr)key;
      if(t == structClass)
      {
         reference = true;
         offset = __ENDIAN_PAD(sizeof(void *));
      }

      while(this)
      {
         // *** NEED COMPARISON OPERATOR SUPPORT HERE INVOKING OnCompare, AS WELL AS TYPE INFORMATION PASSED ***
         byte * b = reference ? ((byte *)&this.key) + offset : (byte *)(uintptr)this.key;
         int result = onCompare(Tclass, a, b);
         if(result < 0)
            this = left;
         else if(result > 0)
            this = right;
         else
            break;
      }
      return this;
   }

   thisclass FindEx(Class Tclass, const T key, AVLNode */*thisclass **/ addTo, AddSide * addSide)
   {
      byte * a;
      bool reference = false;
      uint offset = 0;
      ClassType t = Tclass.type;
      int (* onCompare)(void *, void *, void *) = (void *)Tclass._vTbl[__ecereVMethodID_class_OnCompare];
      bool isInt64 = false, isDouble = false;
      AVLNode to = null;
      AddSide side = 0;

      // NOTE: Currently using int64 for uint64 may result in wrong order...
      if(onCompare == (void *)class(int64).OnCompare ||
         (Tclass.type == unitClass && Tclass.typeSize == sizeof(int64) && !strcmp(Tclass.name, "Id")) ||
         (Tclass.type == bitClass && Tclass.typeSize == sizeof(int64))) isInt64 = true;
      else if(onCompare == (void *)class(double).OnCompare) isDouble = true;

      reference = (t == systemClass && !Tclass.byValueSystemClass) || t == bitClass || t == enumClass || t == unitClass;
      offset = __ENDIAN_PAD(Tclass.typeSize);
      a = reference ? ((byte *)&(uint64)key) + offset : (byte *)(uintptr)key;
      if(t == structClass)
      {
         reference = true;
         offset = __ENDIAN_PAD(sizeof(void *));
      }

      if(Tclass == class(int))
      {
         int ia = *(int *)a;
         if(reference)
         {
            while(this)
            {
               byte * b = (((byte *)&this.key) + __ENDIAN_PAD(sizeof(int)));
               int ib = *(int *)b;
               int result = ia > ib ? 1 : ia < ib ? -1 : 0;
               if(result)
               {
                  thisclass node = result < 0 ? left : right;
                  if(!node)
                     to = this, side = (AddSide)result;
                  this = node;
               }
               else
                  break;
            }
         }
         else
         {
            while(this)
            {
               int ib = *(int *)((byte *)(uintptr)this.key);
               int result = ia > ib ? 1 : ia < ib ? -1 : 0;
               if(result)
               {
                  thisclass node = result < 0 ? left : right;
                  if(!node)
                     to = this, side = (AddSide)result;
                  this = node;
               }
               else
                  break;
            }
         }
      }
      else if(Tclass == class(uint))
      {
         uint ia = *(uint *)a;
         if(reference)
         {
            while(this)
            {
               byte * b = (((byte *)&this.key) + __ENDIAN_PAD(sizeof(uint)));
               uint ib = *(uint *)b;
               int result = ia > ib ? 1 : ia < ib ? -1 : 0;
               if(result)
               {
                  thisclass node = result < 0 ? left : right;
                  if(!node)
                     to = this, side = (AddSide)result;
                  this = node;
               }
               else
                  break;
            }
         }
         else
         {
            while(this)
            {
               uint ib = *(uint *)((byte *)(uintptr)this.key);
               int result = ia > ib ? 1 : ia < ib ? -1 : 0;
               if(result)
               {
                  thisclass node = result < 0 ? left : right;
                  if(!node)
                     to = this, side = (AddSide)result;
                  this = node;
               }
               else
                  break;
            }
         }
      }
      else
      {
         int result;
         int64 a64;
         double aDouble;
         if(isInt64)
            a64 = *(int64 *)a;
         else if(isDouble)
            aDouble = *(double *)a;
         /*
         while(this)
         {
            byte * b = reference ? ((byte *)&this.key) + offset : (byte *)(uintptr)this.key;
            int result;
            if(isInt64)
            {
               int64 b64 = *(int64 *)b;
                    if(a64 > b64) result = 1;
               else if(a64 < b64) result = -1;
               else result = 0;
            }
            else if(isDouble)
            {
               double bDouble = *(double *)b;
                    if(aDouble > bDouble) result = 1;
               else if(aDouble < bDouble) result = -1;
               else result = 0;
            }
            else
               result = onCompare(Tclass, a, b);
            if(result)
            {
               thisclass node = result < 0 ? left : right;
               if(!node)
               {
                  if(addTo) *addTo = this;
                  if(addSide) *addSide = (AddSide)result;
               }
               this = node;
            }
            else
               break;
         }
         */
         if(reference)
         {
            if(isInt64)
            {
               while(this)
               {
                  int64 b64 = *(int64 *)&this.key;
                       if(a64 > b64) result = 1;
                  else if(a64 < b64) result = -1;
                  else result = 0;
                  if(result)
                  {
                     thisclass node = result < 0 ? left : right;
                     if(!node)
                        to = this, side = (AddSide)result;
                     this = node;
                  }
                  else
                     break;
               }
            }
            else if(isDouble)
            {
               while(this)
               {
                  const byte * b = (byte *)&this.key;
                  double bDouble = *(double *)(byte *)b;
                       if(aDouble > bDouble) result = 1;
                  else if(aDouble < bDouble) result = -1;
                  else result = 0;
                  if(result)
                  {
                     thisclass node = result < 0 ? left : right;
                     if(!node)
                        to = this, side = (AddSide)result;
                     this = node;
                  }
                  else
                     break;
               }
            }
            else
            {
               while(this)
               {
                  const byte * b = ((byte *)&this.key) + offset;
                  result = onCompare(Tclass, a, (byte *)b);
                  if(result)
                  {
                     thisclass node = result < 0 ? left : right;
                     if(!node)
                        to = this, side = (AddSide)result;
                     this = node;
                  }
                  else
                     break;
               }
            }
         }
         else
         {
            if(isInt64)
            {
               while(this)
               {
                  int64 b64 = *(int64 *)(uintptr)this.key;
                       if(a64 > b64) result = 1;
                  else if(a64 < b64) result = -1;
                  else result = 0;
                  if(result)
                  {
                     thisclass node = result < 0 ? left : right;
                     if(!node)
                        to = this, side = (AddSide)result;
                     this = node;
                  }
                  else
                     break;
               }
            }
            else if(isDouble)
            {
               while(this)
               {
                  double bDouble = *(double *)(uintptr)this.key;
                       if(aDouble > bDouble) result = 1;
                  else if(aDouble < bDouble) result = -1;
                  else result = 0;
                  if(result)
                  {
                     thisclass node = result < 0 ? left : right;
                     if(!node)
                        to = this, side = (AddSide)result;
                     this = node;
                  }
                  else
                     break;
               }
            }
            else
            {
               while(this)
               {
                  const byte * b = (byte *)(uintptr)this.key;
                  result = onCompare(Tclass, a, (byte *)b);
                  if(result)
                  {
                     thisclass node = result < 0 ? left : right;
                     if(!node)
                        to = this, side = (AddSide)result;
                     this = node;
                  }
                  else
                     break;
               }
            }
         }
      }
      if(addTo) *addTo = to;
      if(addSide) *addSide = side;
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

   bool Check(Class Tclass)
   {
      bool valid = true;
      uint offset = 0;
      bool reference = false;
      byte * b;
      int (* onCompare)(void *, void *, void *);
      ClassType t;
      int leftHeight  = left  ? left.depthProp+1  : 0;
      int rightHeight = right ? right.depthProp+1 : 0;

      // Now get the height of each subtree

      // Verify that AVL tree property is satisfied
      int diffHeight = rightHeight - leftHeight;

      if(!Tclass)
         Tclass = class(uint64);
      t = Tclass.type;
      onCompare = (void *)Tclass._vTbl[__ecereVMethodID_class_OnCompare];
      if((t == systemClass && !Tclass.byValueSystemClass) || t == bitClass || t == enumClass || t == unitClass || t == structClass)
      {
         reference = true;
         offset = __ENDIAN_PAD((t == structClass) ? sizeof(void *) : Tclass.typeSize);
      }

      if(left)
      {
         if(left.parent != this)
         {
            printf("Parent not set properly at node %d\n", (int)left.key);
            valid = false;
         }
         valid *= left.Check(Tclass);
      }
      if(right)
      {
         if(right.parent != this)
         {
            printf("Parent not set properly at node %d\n", (int)right.key);
            valid = false;
         }
         valid *= right.Check(Tclass);
      }

      if(depth != depthProp)
      {
         printf("Depth value at node %d (%d) doesn't match depth property (%d)\n", (int)key, depth, depthProp);
         valid = false;
      }

      if (diffHeight < -1 || diffHeight > 1)
      {
         valid = false;
         printf("Height difference is %d at node %d\n", diffHeight, (int)key);
      }

      // Verify that balance-factor is correct
      if (diffHeight != balanceFactor)
      {
         valid = false;
         printf("Height difference %d doesn't match balance-factor of %d at node %d\n", diffHeight, balanceFactor, (int)key);
      }

      // Verify that search-tree property is satisfied
      b = reference ? ((byte *)&this.key + offset) : ((byte *)(uintptr)this.key);
      if(left)
      {
         byte * a = reference ? ((byte *)&left.key + offset) : ((byte *)(uintptr)left.key);
         if(onCompare(Tclass, a, b) > 0)
         {
            valid = false;
            printf("Node %d is *smaller* than left subtree %d\n", (int)key, (int)left.key);
         }
      }
      if (right)
      {
         byte * a = reference ? ((byte *)&right.key + offset) : ((byte *)(uintptr)right.key);
         if(onCompare(Tclass, a, b) < 0)
         {
            valid = false;
            printf("Node %d is *greater* than right subtree %d\n", (int)key, (int)right.key);
         }
      }
      return valid;
   }
}

public class CustomAVLTree<class BT:AVLNode<KT>, class KT = uint64> : Container<BT, I = KT>
{
   class_fixed

public:
   BT root;
   int count;

   IteratorPointer GetFirst() { return (IteratorPointer) (root ? root.minimum : null); }
   IteratorPointer GetLast()  { return (IteratorPointer) (root ? root.maximum : null); }
   IteratorPointer GetPrev(IteratorPointer node) { return ((BT)node).prev; }
   IteratorPointer GetNext(IteratorPointer node) { return ((BT)node).next; }
   T GetData(IteratorPointer node) { return (T)(BT)node; }
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
         Class btClass = class(BT);
         Class Tclass = btClass.templateArgs[0].dataTypeClass;
         if(!Tclass)
         {
            Tclass = btClass.templateArgs[0].dataTypeClass =
               eSystem_FindClass(__thisModule.application, btClass.templateArgs[0].dataTypeString);
         }
         if(root.Add(Tclass, node, 0))
            root = node.Rebalance();
         else
            return null;
      }
      count++;
      return (IteratorPointer)node;
   }

   private IteratorPointer AddEx(BT node, BT addNode, AddSide addSide)
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
         if(addNode.Add(Tclass, node, addSide))
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
      FreeKey(item);
      delete item;
   }

   void FreeKey(AVLNode<KT> item)
   {
      if(class(BT).type == structClass)
      {
         // TODO: Make this easier...
         Class Tclass = class(BT);
         ((void (*)(void *, void *))(void *)Tclass._vTbl[__ecereVMethodID_class_OnFree])(Tclass, (((byte *)&item.key) + __ENDIAN_PAD(sizeof(void *))));
      }
      else
         delete item.key;
   }

   void Free()
   {
      BT item;
      item = root;
      while(item)
      {
         if(item.left)
         {
            BT left = item.left;
            item.left = null;
            item = left;
         }
         else if(item.right)
         {
            BT right = item.right;
            item.right = null;
            item = right;
         }
         else
         {
            BT parent = item.parent;
            FreeKey(item);
            delete item;
            item = parent;
         }
      }
      root = null;
      count = 0;
   }

   IteratorPointer Find(BT value)
   {
      return (IteratorPointer)value;
   }

   BT GetAtPosition(const KT pos, bool create, bool * justAdded)
   {
      AVLNode addNode = null;
      AddSide addSide = compare;
      AVLNode<KT> node = root ? root.FindEx(class(KT), pos, &addNode, &addSide) : null;
      if(!node && create)
      {
         Class Tclass = class(KT);
         void (* onCopy)(void *, void *, void *) = Tclass._vTbl[__ecereVMethodID_class_OnCopy];
         if(class(KT).type == structClass)
         {
            uint size = sizeof(class AVLNode<KT>);
            if(class(KT).type == structClass) size += class(KT).typeSize - sizeof(node./*AVLNode::*/key);
            node = (AVLNode<KT>)new0 byte[size];
         }
         else
         {
            node = AVLNode<KT> { key = pos };
         }
         if((Tclass.type == systemClass && !Tclass.byValueSystemClass) || Tclass.type == bitClass || Tclass.type == enumClass || Tclass.type == unitClass)
            // onCopy(Tclass, (byte *)&node.key + __ENDIAN_PAD(Tclass.typeSize), (byte *)&pos + __ENDIAN_PAD(Tclass.typeSize));
            memcpy((byte *)&node.key + __ENDIAN_PAD(Tclass.typeSize), (byte *)&pos + __ENDIAN_PAD(Tclass.typeSize), Tclass.typeSize);
         else
            onCopy(Tclass, (byte *)&node.key + __ENDIAN_PAD(sizeof(void *)), (void *)pos);
         AddEx((T)(uintptr)node, (T)(uintptr)addNode, addSide);
         if(justAdded) *justAdded = true;
      }
      return node;
   }

   bool Check()
   {
      return root ? root.Check(class(KT)) : true;
   }
}
