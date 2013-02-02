namespace sys;

//#undef _DEBUG

import "BTNode"

// TODO: FIX THIS
static BinaryTree dummy;

public struct BinaryTree
{
   BTNode root;
   int count;

   void OnSerialize(IOChannel channel)
   {
      channel.Serialize(root);
   }

   void OnUnserialize(IOChannel channel)
   {
      channel.Unserialize(root);
      count = root ? root.count : 0;
   }

   int CompareInt(uintptr a, uintptr b)
   {
      return (a > b) ? 1 : ((a < b) ? - 1 : 0);
   }

   int CompareString(char * a, char * b)
   {
      return (a && b) ? strcmp(a, b) : -1;
   }

   void ::FreeString(char * string)
   {
      delete string;
   }

   int (*CompareKey)(BinaryTree tree, uintptr a, uintptr b);
   void (*FreeKey)(void * key);
   
   void Free()
   {
      if(root)
   	  root.Free(FreeKey);
      root = null;
      count = 0;
   }
   
   bool Add(BTNode node)
   {
      if(!CompareKey) CompareKey = CompareInt;
   	if(!root)
   		root = node;
   	else if(root.Add(this, node))
         root = node.Rebalance();
      else
   		return false;
   	count++;
      // Check();
   	return true;
   }

   BTNode Find(uintptr key)
   {
      if(!CompareKey) CompareKey = CompareInt;
      // Check();
      return root ? root.Find(this, key) : null;
   }

   BTNode FindString(char * key)
   {
      return root ? root.FindString(key) : null;
   }

   BTNode FindPrefix(char * key)
   {
      return root ? root.FindPrefix(key) : null;
   }

   BTNode FindAll(uintptr key)
   {
      return root ? root.FindAll(key) : null;
   }

   void Remove(BTNode node)
   {
      BTNode parent = node.parent;

#ifdef _DEBUG
      if(!root || !root.FindNode(node))
      {
         printf("Removing node not in binary tree\n");
      }
#endif
      /*BTNode swap = node.RemoveSwapRight();
      if(node == root)
	      root = swap;
         */
      if(parent || root == node)
      {
         root = node.RemoveSwapRight();
         count--;
         /*
         if(swap)
            root = swap.Rebalance();
         else if(parent)
            root = parent.Rebalance();
         else
            root = root.Rebalance();
         */
         // Check();
         node.parent = null;
      }
   }

   void Delete(BTNode node)
   {
      void * voidNode = node;
      Remove(node);
      delete voidNode;
   }

   char * Print(char * output, TreePrintStyle tps) 
   {
      output[0] = 0;
      if(root) root.Print(output, tps);
      return output;
   }

   bool Check()
   {
      return root ? root.Check(this) : true;
   }

   property BTNode first { get { return root ? root.minimum : null; } }
   property BTNode last { get { return root ? root.maximum : null; } }
};

public struct StringBinaryTree : BinaryTree
{
   void OnSerialize(IOChannel channel)
   {
      channel.Serialize((StringBTNode)root);
   }

   void OnUnserialize(IOChannel channel)
   {
      StringBTNode root = null;
      channel.Unserialize(root);
      this.root = (BTNode)root;
      count = root ? this.root.count : 0;
   }
};
