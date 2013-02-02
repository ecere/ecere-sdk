namespace sys;

import "instance"

#include <stdarg.h>

public enum TreePrintStyle { inOrder, postOrder, preOrder, depthOrder };

// WARNING: This function has no boundary check!
public void strcatf(char * string, char * format, ...)
{
   va_list args;
   va_start(args, format);
   vsprintf(string+strlen(string),format,args);
   va_end(args);
}

public class BTNode : struct
{
   class_fixed
public:
   uintptr key;
   BTNode parent, left, right;
   int depth;

   void OnSerialize(IOChannel channel)
   {
      if(this)
      {
         bool truth = true;
         channel.Serialize(truth);
         channel.Serialize(key);
         channel.Serialize(left);
         channel.Serialize(right);
      }
      else
      {
         uint nothing = 0;
         channel.Serialize(nothing);
      }
   }

   void OnUnserialize(IOChannel channel)
   {
      bool truth;
      channel.Unserialize(truth);
      if(truth)
      {
         // TODO: Fix typed_object issues
         this = eInstance_New(class(BTNode));
         channel.Unserialize(key);
         channel.Unserialize(left);
         if(left) { left.parent = (void *)this; }
         channel.Unserialize(right);
         if(right) { right.parent = (void *)this; }
         depth = ((BTNode)(void *)this).depthProp;
      }
      else
         this = null;
   }

   property BTNode prev
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

   property BTNode next
   {
      get
      {
         BTNode right = this.right;
         if(right)
            return right.minimum;
         while(this)
         {
            BTNode parent = this.parent;
            if(parent && this == parent.left)
               return parent;
            else
               this = parent;
         }
         return null;
      }
   }

   property BTNode minimum
   {
      get { while(left) this = left; return this; }
   }

   property BTNode maximum
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

   void Free(void (*FreeKey)(void * key))
   {  
   	if (left) left.Free(FreeKey);
   	if (right) right.Free(FreeKey);
      if(FreeKey) FreeKey((void *)key);
      delete this;
   }

   bool Add(BinaryTree tree, BTNode node)
   {
      uintptr newKey = node.key;
      while(true)
      {
         //int result = (newKey > key) ? 1 : ((newKey < key) ? - 1 : 0);
         int result = tree.CompareKey(tree, newKey, key);
         if(!result)
         {
#ifdef _DEBUG
            // sprintf("Adding item already in binary tree\n");
#endif
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
                  BTNode n;
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
                  BTNode n;
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

   bool FindNode(BTNode node)
   {
      if(this == node)
         return true;
      else if(left && left.FindNode(node))
         return true;
      else if(right && right.FindNode(node))
         return true;
      return false;
   }

   BTNode Find(BinaryTree tree, uintptr key)
   {
      while(this)
      {
         // int result = (key > this.key) ? 1 : ((key < this.key) ? - 1 : 0);
         int result = tree.CompareKey(tree, key, this.key);
         if(result < 0)
            this = left;
         else if(result > 0)
            this = right;
         else
            break;
      }
      return this;
   }

   public BTNode FindString(char * key)
   {
      while(this)
      {
         int result;
         if(key && this.key)
            result = strcmp(key, (char *)this.key);
         else if(key && !this.key)
            result = 1;
         else if(!key && this.key)
            result = -1;
         else
            result = 0;

         if(result < 0)
            this = left;
         else if(result > 0)
            this = right;
         else
            break;
      }
      return this;
   }

   public BTNode FindPrefix(char * key)
   {
      BTNode subString = null;
      int len = key ? strlen(key) : 0;
      while(this)
      {
         int result;
         if(key && this.key)
            result = strcmp(key, (char *)this.key);
         else if(key && !this.key)
            result = 1;
         else if(!key && this.key)
            result = -1;
         else
            result = 0;

         if(result < 0)
         {
            if(!strncmp(key, (char *)this.key, len))
               subString = this;
            this = left;
         }
         else if(result > 0)
            this = right;
         else
         {
            subString = this;
            break;
         }
      }
      return subString;
   }

   BTNode FindAll(uintptr key)
   {
      BTNode result = null;
      if(this.key == key) result = this;
      if(!result && left) result = left.FindAll(key);
      if(!result && right) result = right.FindAll(key);
      return result;
   }

   void RemoveSwap(BTNode swap)
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
         BTNode n;
         for(n = swap.parent; n; n = n.parent)
         {
            int newDepth = Max(n.left ? (n.left.depth+1) : 0, n.right ? (n.right.depth+1) : 0);
            if(newDepth == n.depth)
               break;
            n.depth = newDepth;
            if(n == this) break;
         }
      }

      //if(!swap.left) 
      {
         swap.left = left;
         if(left)
            left.parent = swap;
      }
      //if(!swap.right) 
      {
          swap.right = right;
          if (right)
               right.parent = swap;
      }
      swap.parent = parent;
      left = null;
      right = null;
      if(parent)
      {
         if(this == parent.left) parent.left = swap;
         else if(this == parent.right) parent.right = swap;
      }
   }

   BTNode RemoveSwapLeft()
   {
      BTNode swap = left ? left.maximum : right;
      BTNode swapParent = null;
      if(swap) { swapParent = swap.parent; RemoveSwap(swap); }
      if(parent)
      {
         if(this == parent.left) parent.left = null;
         else if(this == parent.right) parent.right = null;
      }
      {
         BTNode n;
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

   BTNode RemoveSwapRight()
   {
      BTNode result;
      BTNode swap = right ? right.minimum : left;
      BTNode swapParent = null;
      if(swap) { swapParent = swap.parent; RemoveSwap(swap); }
      if(parent)
      {
         if(this == parent.left) parent.left = null;
         else if(this == parent.right) parent.right = null;
      }
      {
         BTNode n;
         for(n = swap ? swap : parent; n; n = n.parent)
         {
            int newDepth = Max(n.left ? (n.left.depth+1) : 0, n.right ? (n.right.depth+1) : 0);
            /*
            if(newDepth != n.depthProp)
               printf("bug");
            */
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

   BTNode Rebalance()
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
         BTNode n;
         for(n = parent.parent; n; n = n.parent)
         {
            int newDepth = Max(n.left ? (n.left.depth+1) : 0, n.right ? (n.right.depth+1) : 0);
            /*
            if(newDepth != n.depthProp)
               printf("bug");
            */
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
         BTNode n;
         for(n = parent.parent; n; n = n.parent)
         {
            int newDepth = Max(n.left ? (n.left.depth+1) : 0, n.right ? (n.right.depth+1) : 0);
            /*
            if(newDepth != n.depthProp)
               printf("bug");
            */
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

   #define NUMSIZE   4

   char * Print(char * output, TreePrintStyle tps) 
   {
      switch(tps)
      {
         case inOrder:
         case preOrder:
         case postOrder:
         {
            if(tps == preOrder) strcatf(output, "%d ", key);

      		if (left) left.Print(output, tps);

            if(tps == inOrder) strcatf(output, "%d ", key);

      		if (right) right.Print(output, tps);

            if(tps == postOrder) strcatf(output, "%d ", key);

      		return output;		
         }
         case depthOrder:
         {
            int maxDepth = depth;
            int curDepth;

            for(curDepth = 0; curDepth <= maxDepth; curDepth++)
            {
               int c;
               for(c = 0; c<((1<<(maxDepth - curDepth))-1) * NUMSIZE / 2; c++)
                  strcat(output, " ");
               PrintDepth(output, curDepth, 0, maxDepth, true);
               strcat(output, "\n");
            }
            return output;
         }
      }
      return null;
   }

   void PrintDepth(char * output, int wantedDepth, int curDepth, int maxDepth, bool last) 
   {
      int c;
      if(wantedDepth == curDepth)
      {
         char nodeString[10] = "";
         int len;

         if(this)
            sprintf(nodeString, "%d", key);

         len = strlen(nodeString);
         for(c = 0; c<(NUMSIZE - len)/2; c++)
            strcat(output, " ");
         len += c;
         strcat(output, nodeString);
         for(c = len; c<NUMSIZE; c++)
            strcat(output, " ");

         if(curDepth && !last)
         {
            for(c = 0; c<((1<<(maxDepth-curDepth)) - 1) * NUMSIZE; c++)
               strcat(output, " ");
         }
      }
      else if(curDepth <= maxDepth)
      {
         (this ? left : (BTNode)null).PrintDepth(output, wantedDepth, curDepth+1, maxDepth, last && this && !right);
         (this ? right : (BTNode)null).PrintDepth(output, wantedDepth, curDepth+1, maxDepth, last);
      }
   }

   bool Check(BinaryTree tree)
   {
      bool valid = true;
      // Now get the height of each subtree
      int leftHeight  = left  ? left.depthProp+1  : 0;
      int rightHeight = right ? right.depthProp+1 : 0;

      // Verify that AVL tree property is satisfied
      int diffHeight = rightHeight - leftHeight;

      if(left)
      {
         if(left.parent != this)
         {
            printf("Parent not set properly at node %d\n", left.key);
            valid = false;
         }
         valid *= left.Check(tree);
      }
      if(right)
      {
         if(right.parent != this)
         {
            printf("Parent not set properly at node %d\n", right.key);
            valid = false;
         }
         valid *= right.Check(tree);
      }

      if(depth != depthProp)
      {
         printf("Depth value at node %d (%d) doesn't match depth property (%d)\n", key, depth, depthProp);
         valid = 0;
      }

      if (diffHeight < -1 || diffHeight > 1)
      {
         valid = 0;
         printf("Height difference is %d at node %d\n", diffHeight, key);
      }

      // Verify that balance-factor is correct
      if (diffHeight != balanceFactor)
      {
         valid = 0;
         printf("Height difference %d doesnt match balance-factor of %d at node \n", diffHeight, balanceFactor, key);
      }

      // Verify that search-tree property is satisfied
      if (left && tree.CompareKey(tree, left.key, key) > 0)
      {
         valid = false;
         printf("Node %d is *smaller* than left subtree %d\n", key, left.key);
      }
      if (right && tree.CompareKey(tree, right.key, key) < 0)
      {
         valid = false;
         printf("Node %d is *greater* than right subtree %d\n", key, right.key);
      }
      return valid;
   }
};

// TODO: WHY CAN'T WE HAVE THIS ABOVE?

public class StringBTNode : struct // BTNode
{
   class_fixed
public:
   String key;
   StringBTNode parent, left, right;
   int depth;

   void OnSerialize(IOChannel channel)
   {
      if(this)
      {
         bool truth = true;
         channel.Serialize(truth);
         channel.Serialize(key);
         channel.Serialize(left);
         channel.Serialize(right);
      }
      else
      {
         uint nothing = 0;
         channel.Serialize(nothing);
      }
   }

   void OnUnserialize(IOChannel channel)
   {
      bool truth;
      channel.Unserialize(truth);
      if(truth)
      {
         // TODO: Fix typed_object issues
         this = eInstance_New(class(StringBTNode));
         channel.Unserialize(key);
         channel.Unserialize(left);
         if(left) { left.parent = (void *)this; }
         channel.Unserialize(right);
         if(right) { right.parent = (void *)this; }

         // TODO: Precomp errors without extra brackets
         depth = ((BTNode)((void *)this)).depthProp;
      }
      else
         this = null;
   }
}

