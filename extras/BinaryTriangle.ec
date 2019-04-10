import IMPORT_STATIC "ecere"

define MAXTRIS = 9265536;

class Elevation : int;

class BinTri : struct
{
   BinTri left, right, bottom;
   BinTri leftChild, rightChild;
   Point v0,va,v1,vc;
   uint tv0,tva,tv1,tvc;
   int index;

   void Clear()
   {
      leftChild = null;
      rightChild = null;
      left = null;
      right = null;
      bottom = null;
   }

   void SplitBinTri2(struct BinTri * stack, int * stackIndex)
   {
      BinTri leftChild, rightChild;
      BinTri right, left;

      leftChild =  this.leftChild =  (BinTri) (stack + ((*stackIndex)++));
      rightChild = this.rightChild = (BinTri) (stack + ((*stackIndex)++));

      leftChild.left = rightChild;
      rightChild.right = leftChild;

      leftChild.bottom = this.left;
      rightChild.bottom = this.right;

      left = this.left;
      if(left)
      {
         if(left.bottom == this)
            left.bottom = leftChild;
         else
         {
            if(left.left == this)
               left.left = leftChild;
            else
               left.right = leftChild;
         }
      }

      right = this.right;
      if(right)
      {
         if(right.bottom == this)
            right.bottom = rightChild;
         else
         {
            if(right.right == this)
               right.right = rightChild;
            else
               right.left = rightChild;
         }
      }

      leftChild.index = index<<1;
      rightChild.index = leftChild.index+1;
      leftChild.leftChild = null;
      rightChild.leftChild = null;
      leftChild.rightChild = null;
      rightChild.rightChild = null;

      leftChild.tv0 = tva;
      rightChild.tv1 = tva;
      leftChild.tva = tvc;
      rightChild.tva = tvc;
      leftChild.tv1 = tv0;
      rightChild.tv0 = tv1;

      leftChild.tvc = (tva + tv0) >> 1;
      rightChild.tvc = (tv1 + tva) >> 1;

      leftChild.v0 = va;
      rightChild.v1 = va;
      leftChild.va = vc;
      rightChild.va = vc;
      leftChild.v1 = v0;
      rightChild.v0 = v1;

      leftChild.vc.x = (va.x + v0.x) >> 1;
      leftChild.vc.y = (va.y + v0.y) >> 1;
      rightChild.vc.x = (v1.x + va.x) >> 1;
      rightChild.vc.y = (v1.y + va.y) >> 1;
   }

   bool SplitBinTri(struct BinTri * stack, int * stackIndex)
   {
      if(bottom)
      {
         if((bottom.bottom == this || bottom.SplitBinTri(stack, stackIndex)) && *stackIndex < MAXTRIS - 4)
         {
            SplitBinTri2(stack, stackIndex);
            bottom.SplitBinTri2(stack, stackIndex);
            leftChild.right = bottom.rightChild;
            rightChild.left = bottom.leftChild;
            bottom.leftChild.right = rightChild;
            bottom.rightChild.left = leftChild;
            return true;
         }
      }
      else if(*stackIndex < MAXTRIS - 2)
      {
         SplitBinTri2(stack, stackIndex);
         leftChild.right = null;
         rightChild.left = null;
         return true;
      }
      return false;
   }

   void Split(struct BinTri * stack, int * triIndex,
              byte level, float resolutionX, float resolutionY, int positionX, int positionY, int positionZ,
              Elevation * heightMap, byte maxVarLevel, int detailBias, Elevation * variance, byte maxLevel)
   {
      int distance;
      int varIndex;
      int ix, iy, iz, tmp;
      int x1,y1,x2,y2,x3,y3;

      // *** Compute Distance between this Triangle and the Viewer ***
      x1 = (int)(v0.x * resolutionX) - positionX;
      y1 = (int)(v0.y * resolutionY) - positionZ;
      x2 = (int)(va.x * resolutionX) - positionX;
      y2 = (int)(va.y * resolutionY) - positionZ;
      x3 = (int)(v1.x * resolutionX) - positionX;
      y3 = (int)(v1.y * resolutionY) - positionZ;
      if((x1 <= 0) && (x2 <= 0) && (x3 <= 0))
      {
         x1 = -x1;
         x2 = -x2;
         x3 = -x3;
         ix = Min(x1,x2);
         if(x3 < ix) ix = x3;
      }
      else if((x1 >= 0) && (x2 >= 0) && (x3 >= 0))
      {
         ix = Min(x1,x2);
         if(x3 < ix) ix = x3;
      }
      else ix=0;

      if((y1 <= 0) && (y2 <= 0) && (y3 <= 0))
      {
         y1 = -y1;
         y2 = -y2;
         y3 = -y3;
         iz = Min(y1,y2);
         if(y3 < iz) iz = y3;
      }
      else if((y1 >= 0) && (y2 >= 0) && (y3 >= 0))
      {
         iz = Min(y1,y2);
         if(y3 < iz) iz = y3;
      }
      else iz=0;

      iy = -heightMap[tv0];
      tmp = -heightMap[tva];
      if(tmp < iy) iy = tmp;
      tmp = -heightMap[tv1];
      if(tmp < iy) iy = tmp;
      iy -= positionY;
      if(iy < 0) iy = -iy;

      if(ix < iy) { tmp = ix; ix = iy; iy = tmp; }
      if(ix < iz) { tmp = ix; ix = iz; iz = tmp; }
      if(iz > iy) { iz = iy; }
      distance = ix + (iz>>1);

      // *** Find the variance table index ***
      varIndex = index;
      if(level > maxVarLevel)
         varIndex >>= (level - maxVarLevel);
      varIndex--;

      if(distance < detailBias * variance[varIndex])
      {
         // *** Split Further ***
         if(!leftChild)
            SplitBinTri(stack, triIndex);
         level++;
         if(leftChild && rightChild && level < maxLevel)
         {
            leftChild.Split(stack, triIndex, level, resolutionX, resolutionY, positionX, positionY, positionZ, heightMap, maxVarLevel, detailBias, variance, maxLevel);
            rightChild.Split(stack, triIndex, level, resolutionX, resolutionY, positionX, positionY, positionZ, heightMap, maxVarLevel, detailBias, variance, maxLevel);
         }
      }
   }
};
