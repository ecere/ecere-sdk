namespace com;

import "CustomAVLTree"

public class AVLTree<class AT> : CustomAVLTree<BT = AVLNode<AT>, KT = AT, T = AT, D = AT>
{
   class_fixed

   AT GetData(AVLNode<AT> node)
   {
      return node ? ((class(AT).type == structClass) ? (AT)(((byte *)&(uint64)node.key) + __ENDIAN_PAD(sizeof(void *))) : node.key) : (AT)0;
   }

   bool SetData(AVLNode<AT> node, AT value)
   {
      if(!Find(value))
      {
         Remove(node);
         if(class(AT).type == structClass)
            memcpy((void *)(((byte *)&(uint64)node.key) + __ENDIAN_PAD(sizeof(void *))), (void *)value, class(AT).structSize);
         else
            node.key = value;
         AVLTree::Add((AT)node);
         return true;
      }
      return false;
   }

   AVLNode<AT> Add(AT value)
   {
      bool justAdded = false;
      AVLNode<AT> node = (AVLNode<AT>)GetAtPosition(value, true, &justAdded);
      return justAdded ? node : null;
   }

   void Remove(AVLNode<AT> node)
   {
      CustomAVLTree::Remove(node);
      delete node;
   }

   AVLNode<AT> Find(const AT key)
   {
      AVLNode<AT> root = this.root;
      return root ? root.Find(class(AT), key) : null;
   }

   // *** FIND ALL COMPARES KEY FOR EQUALITY, NOT USING OnCompare ***
   AVLNode<AT> FindAll(const AT key)
   {
      AVLNode<AT> root = this.root;
      return root ? root.FindAll(key) : null;
   }
};
