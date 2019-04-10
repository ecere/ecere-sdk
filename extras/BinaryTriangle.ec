public import IMPORT_STATIC "ecere"

public struct BinaryTriangle
{
   BinaryTriangle * left, * right, * bottom;
   BinaryTriangle * leftChild, * rightChild;
   Point v0,va,v1,vc;
   uint tv0,tva,tv1,tvc;
   int index;

   public void clear()
   {
      leftChild = null;
      rightChild = null;
      left = null;
      right = null;
      bottom = null;
   }

   private void createChildTriangles(BinaryTriangle * stack, int * stackIndex)
   {
      BinaryTriangle * leftChild, * rightChild;
      BinaryTriangle * right, * left;

      leftChild =  this.leftChild =  stack + (*stackIndex)++;
      rightChild = this.rightChild = stack + (*stackIndex)++;

      leftChild->left = rightChild;
      rightChild->right = leftChild;

      leftChild->bottom = this.left;
      rightChild->bottom = this.right;

      left = this.left;
      if(left)
      {
         if(left->bottom == this)
            left->bottom = leftChild;
         else
         {
            if(left->left == this)
               left->left = leftChild;
            else
               left->right = leftChild;
         }
      }

      right = this.right;
      if(right)
      {
         if(right->bottom == this)
            right->bottom = rightChild;
         else
         {
            if(right->right == this)
               right->right = rightChild;
            else
               right->left = rightChild;
         }
      }

      leftChild->index = index<<1;
      rightChild->index = leftChild->index+1;
      leftChild->leftChild = null;
      rightChild->leftChild = null;
      leftChild->rightChild = null;
      rightChild->rightChild = null;

      leftChild->tv0 = tva;
      rightChild->tv1 = tva;
      leftChild->tva = tvc;
      rightChild->tva = tvc;
      leftChild->tv1 = tv0;
      rightChild->tv0 = tv1;

      leftChild->tvc = (tva + tv0) >> 1;
      rightChild->tvc = (tv1 + tva) >> 1;

      leftChild->v0 = va;
      rightChild->v1 = va;
      leftChild->va = vc;
      rightChild->va = vc;
      leftChild->v1 = v0;
      rightChild->v0 = v1;

      leftChild->vc.x = (va.x + v0.x) >> 1;
      leftChild->vc.y = (va.y + v0.y) >> 1;
      rightChild->vc.x = (v1.x + va.x) >> 1;
      rightChild->vc.y = (v1.y + va.y) >> 1;
   }

   public bool split(BinaryTriangle * stack, int * stackIndex)
   {
      if(bottom)
      {
         if(bottom->bottom == this || bottom->split(stack, stackIndex))
         {
            createChildTriangles(stack, stackIndex);
            bottom->createChildTriangles(stack, stackIndex);
            leftChild->right = bottom->rightChild;
            rightChild->left = bottom->leftChild;
            bottom->leftChild->right = rightChild;
            bottom->rightChild->left = leftChild;
            return true;
         }
      }
      else
      {
         createChildTriangles(stack, stackIndex);
         leftChild->right = null;
         rightChild->left = null;
         return true;
      }
      return false;
   }
};
