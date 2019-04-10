/*
   Binary triangle trees, partly inspired by tutorial and guidance
   from Seumas McNally of Longbow Digital Arts:

      https://www.longbowgames.com/seumas/progbintri.html

   and "ROAMing Terrain: Real-time Optimally Adapting Meshes" white paper by Mark Duchaineau et al.
   from Los Alamos National Laboratory & Lawrence Livermore National Laboratory, proceedings from VIS '97:

      http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.22.1811&rep=rep1&type=pdf
      https://dl.acm.org/citation.cfm?id=266989.267028
*/
public import IMPORT_STATIC "ecere"

public struct BinaryTriangle
{
   BinaryTriangle * left, * right, * bottom;
   BinaryTriangle * leftTriangle, * rightTriangle;
   uint tv0, tva, tv1, tvc;
   int index;

   private void createChildTriangles(BinaryTriangle * stack, int * stackIndex)
   {
      BinaryTriangle * r = right, * l = left;
      BinaryTriangle * lt = stack + (*stackIndex)++;
      BinaryTriangle * rt = stack + (*stackIndex)++;

      leftTriangle = lt;
      rightTriangle = rt;

      if(l)
      {
         if(l->bottom == this)
            l->bottom = lt;
         else if(l->left == this)
            l->left = lt;
         else
            l->right = lt;
      }

      if(r)
      {
         if(r->bottom == this)
            r->bottom = rt;
         else if(r->right == this)
            r->right = rt;
         else
            r->left = rt;
      }

      *lt =
      {
         index = index << 1,
         left = rt, bottom = l,
         tv0 = tva, tva = tvc, tv1 = tv0,
         tvc = (tv0 + tva) >> 1
      };

      *rt =
      {
         index = (index << 1) + 1,
         right = lt, bottom = r,
         tv0 = tv1, tva = tvc, tv1 = tva,
         tvc = (tv1 + tva) >> 1
      };
   }

   public void clear()
   {
      leftTriangle = null;
      rightTriangle = null;
      left = null;
      right = null;
      bottom = null;
   }

   public bool split(BinaryTriangle * stack, int * stackIndex)
   {
      bool result = false;

      if(bottom)
      {
         // Opposite triangle needs to be split first to avoid T-junction
         if(bottom->bottom == this || bottom->split(stack, stackIndex))
         {
            BinaryTriangle * b, * blt, * brt;

            createChildTriangles(stack, stackIndex);
            bottom->createChildTriangles(stack, stackIndex);
            b = bottom;
            blt = b->leftTriangle;
            brt = b->rightTriangle;
            leftTriangle->right = brt;
            rightTriangle->left = blt;
            blt->right = rightTriangle;
            brt->left = leftTriangle;
            result = true;
         }
      }
      else
      {
         createChildTriangles(stack, stackIndex);
         leftTriangle->right = null;
         rightTriangle->left = null;
         result = true;
      }
      return result;
   }
};
