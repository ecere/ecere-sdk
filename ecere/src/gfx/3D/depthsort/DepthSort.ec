// Implementation of the Painter's Algorithm for sorting translucent triangles and quads
// Inspired by Christopher Lampton's Flights of Fantasy Hidden Surface Removal chapter
// (see also Newell's algorithm -- https://en.wikipedia.org/wiki/Newell%27s_algorithm )

import "TopoSort"
import "Tetrahedron"

// The XY Overlap test is handled by a Min-Max Tree
// Compiled Templated MinMaxTree for SortPrimitive with header file
#define MINMAX_MIN_OFFSET ((uint)(uintptr)&((SortPrimitive *)0)->min.x)
#define MINMAX_MAX_OFFSET ((uint)(uintptr)&((SortPrimitive *)0)->max.x)
#define MINMAX_STRIDE     sizeof(SortPrimitive)

#include "MinMaxTree.eh"
/////////

#define EPSILON 0.00001f

struct SortPrimitive
{
   PrimitiveSingle * triangle;
   Object object;
   union
   {
      Vector3Df middle;
      Vector3Df p[5];
   };
   Vector3Df min, max;
   Plane plane;
   int n;

   // For toposort
   TopoNode node;

   void depend(SortPrimitive b, InstancePool<TopoNode> nodesPool, InstancePool<TopoEdge> edgesPool)
   {
      if(!node) { node = nodesPool ? (TopoNode)nodesPool.allocate() : { }; node.data = this; };
      if(!b.node) { b.node = nodesPool ? (TopoNode)nodesPool.allocate() : { }; b.node.data = b; };
      node.createEdge(b.node, false, edgesPool);
   }

   /*
   private static inline bool xyOverlaps(SortPrimitive poly2)
   {
      // Min and Max y here must be projected coordinates when using perspective
      if(min.x > poly2.max.x - EPSILON || poly2.min.x > max.x - EPSILON) return false;
      if(min.y > poly2.max.y - EPSILON || poly2.min.y > max.y - EPSILON) return false;
      return true;
   }
   */

   private static inline bool couldObscure(SortPrimitive poly2)
   {
      return poly2.min.z < max.z - EPSILON;
   }

   void planeSideCheck(SortPrimitive poly2, bool * bNearSideA, bool * bFarSideA)
   {
      double a = plane.a, b = plane.b, c = plane.c, d = plane.d;
      int v;

      *bNearSideA = true, *bFarSideA = true;
      if(d > 0)
      {
         a *= -1, b *= -1, c *= -1;
         d = -(a * middle.x + b * middle.y + c * middle.z);
      }
      for(v = 0; v < n; v++)
      {
         Vector3Df * p = &poly2.p[v+1];
         double s = a * p->x + b * p->y + c * p->z + d;
              if(s >  EPSILON) { *bNearSideA = false; if(!*bFarSideA) break; }
         else if(s < -EPSILON) { *bFarSideA = false;  if(!*bNearSideA) break; }
      }
   }

   bool obscures(SortPrimitive primitive2)
   {
      Vector3Df * p2 = primitive2.p;
      Tetrahedron th;

      th.points[0] = { }, th.points[1] = p2[1], th.points[2] = p2[2], th.points[3] = p2[3];


      if(th.triOrQuadInside(n, p + 1))
         return true;
      if(primitive2.n == 4)
      {
         th.points[1] = p2[1], th.points[2] = p2[3], th.points[3] = p2[4];
         if(th.triOrQuadInside(n, p + 1))
            return true;
      }
      return false;
   }

   int compareMid(SortPrimitive primitive2)
   {
      double d = middle.z - primitive2.middle.z;
      if(fabs(d) < 0.0001)
      {
         if(Sgn(plane.d) == -1 && Sgn(primitive2.plane.d) == 1)
            return 1;
         else if(Sgn(plane.d) == 1 && Sgn(primitive2.plane.d) == -1)
            return -1;
      }
      return Sgn(d);
   }
};

#define A_OBSCURES_B (fullProjCheck ? a->obscures(b) : true)
#define B_OBSCURES_A (fullProjCheck ? b->obscures(a) : true)

static void topoSortPrimitives(InstancePool<TopoNode> nodesPool, InstancePool<TopoEdge> edgesPool, SortPrimitive * triangles, uint nTriangles)
{
   if(nTriangles)
   {
      OldList input { };
      int i;

      for(i = 0; i < nTriangles; i++)
      {
         SortPrimitive * tri = &triangles[i];
         if(tri->node)
            input.Add(tri->node);
      }

      topoSort(input, edgesPool);

      {
         // Insert triangles both with and without dependency edges ordered by middle.z
         SortPrimitive * output = new SortPrimitive[nTriangles];
         int i, j = 0;
         TopoNode n = input.first;
         for(i = 0; i <= nTriangles; i++)
         {
            SortPrimitive * tri = i < nTriangles ? &triangles[i] : null;
            if(!tri || tri->node)
            {
               SortPrimitive * nextLoose = null;
               float nextMidZ;
               int k;

               for(k = i; k < nTriangles; k++)
               {
                  SortPrimitive * lTri = &triangles[k];
                  if(!lTri->node)
                  {
                     nextLoose = lTri;
                     nextMidZ = nextLoose->middle.z;
                     break;
                  }
               }
               while(n)
               {
                  SortPrimitive * nTri = n.data;

                  if(nextLoose && nextMidZ <= nTri->middle.z)
                     break;
                  else
                  {
                     TopoNode next = n.next;
                     output[j++] = *nTri;
                     n.free(edgesPool);
                     if(nodesPool)
                        nodesPool.free(n);
                     else
                        delete n;
                     n = next;
                  }
               }
               if(!nextLoose)
                  break;
            }
            else
               output[j++] = *tri;
         }
         /*
         if(j < nTriangles)
            memset(output + j, 0, (nTriangles - j) * sizeof(SortPrimitive));
         */
         memcpy(triangles, output, nTriangles * sizeof(SortPrimitive));
         delete output;
      }
   }
}

struct SortDataPtr
{
   void * data[3];

   void free()
   {
      MinMaxTree triBuckets = this != null ? data[0] : null;
      InstancePool<TopoEdge> edgesPool = this != null ? data[1] : null;
      InstancePool<TopoNode> nodesPool = this != null ? data[2] : null;

      delete edgesPool;
      delete nodesPool;
      delete triBuckets;
   }
};

void sortPrimitives(SortPrimitive * triangles, int nTriangles, Camera camera, SortDataPtr sortData,
   int maxFullSort, bool fullProjCheck)
{
   qsort((void*) triangles, nTriangles, sizeof(SortPrimitive), SortPrimitive::compareMid);

   if(maxFullSort)
   {
      int startSort = Max(0, nTriangles - maxFullSort);
      int nEdges = 0;
      MinMaxTree triBuckets = sortData != null ? sortData.data[0] : null;
      InstancePool<TopoEdge> edgesPool = sortData != null ? sortData.data[1] : null;
      InstancePool<TopoNode> nodesPool = sortData != null ? sortData.data[2] : null;
      SortPrimitive * sortTris = triangles + startSort;
      int sortCount = nTriangles - startSort;
      Mesh lastMesh = null;
      Matrix mat;
      float cMinZ = camera.zMin;
      int i;
      MinMaxIterator it { greaterOnly = true };

      if(!triBuckets) triBuckets = { };
      if(!edgesPool)  edgesPool = { };
      if(!nodesPool)  nodesPool = { };

      triBuckets.offset = (uintptr)sortTris;
      it.container = triBuckets;

      for(i = 0; i < sortCount; i++)
      {
         SortPrimitive * sort = &sortTris[i];
#if 0 //def _DEBUG
         // Debugging aid to identify a primitive on the display
         if(0 && i == 6)
         {
            SortPrimitive * t = &triangles[i];
            static int flicker;
            if(((flicker++ / 20)) & 1)
            {
               t->object = null;
               continue;
            }
         }
#endif
         PrimitiveSingle * triangle = sort->triangle;
         Object object = sort->object;
         ObjectFlags flags = *&object.flags;
         Mesh mesh = *&object.mesh;

         if(mesh != lastMesh)
         {
            if(flags.viewSpace)
               mat = object.matrix;
            else
            {
               Matrix temp = object.matrix;
               temp.m[3][0] -= camera.cPosition.x;
               temp.m[3][1] -= camera.cPosition.y;
               temp.m[3][2] -= camera.cPosition.z;
               mat.Multiply(temp, camera.viewMatrix);
            }
            mat.Scale(1,1,-1);   // With the new comparison the scale is actually unnecessary...
         }

         if(mesh.vertices)
         {
            Vector3Df * vertices = mesh.vertices;
            bool ix32 = triangle ? triangle->type.indices32bit : false;
            uint32 * indices32 = ix32 ? triangle->indices32 : null;
            uint16 * indices16 = ix32 ? null : triangle->indices;
            uint ix[4];
            int n = 0;

            if(ix32)
            {
               ix[0] = indices32[0];
               ix[1] = indices32[1];
               ix[2] = indices32[2];
            }
            else
            {
               ix[0] = indices16[0];
               ix[1] = indices16[1];
               ix[2] = indices16[2];
            }
            n += 3;

            sort->p[1].MultMatrix(vertices[ix[0]], mat);
            sort->p[2].MultMatrix(vertices[ix[1]], mat);
            sort->p[3].MultMatrix(vertices[ix[2]], mat);
            if(triangle->type == quads)
            {
               ix[3] = ix32 ? indices32[3] : indices16[3];
               n++;
               sort->p[4].MultMatrix(vertices[ix[3]], mat);
            }

            { // Note, this probably needs to be improved for non-centered view (e.g. VR)
               float z1 = sort->p[1].z, z2 = sort->p[2].z, z3 = sort->p[3].z, zi1 = 1.0f / z1, zi2 = 1.0f / z2, zi3 = 1.0f / z3;
               float x1 = sort->p[1].x * zi1, x2 = sort->p[2].x * zi2, x3 = sort->p[3].x * zi3;
               float y1 = sort->p[1].y * zi1, y2 = sort->p[2].y * zi2, y3 = sort->p[3].y * zi3;
               sort->min.x = Min(Min(x1, x2), x3);
               sort->max.x = Max(Max(x1, x2), x3);
               sort->min.y = Min(Min(y1, y2), y3);
               sort->max.y = Max(Max(y1, y2), y3);
               sort->min.z = Min(Min(z1, z2), z3);
               sort->max.z = Max(Max(z1, z2), z3);

               if(triangle->type == quads)
               {
                  float z4 = sort->p[4].z, zi4 = 1.0f / z4;
                  float x4 = sort->p[4].x * zi4;
                  float y4 = sort->p[4].y * zi4;
                  if(x4 < sort->min.x) sort->min.x = x4;
                  if(x4 > sort->max.x) sort->max.x = x4;
                  if(y4 < sort->min.y) sort->min.y = y4;
                  if(y4 > sort->max.y) sort->max.y = y4;
                  if(z4 < sort->min.z) sort->min.z = z4;
                  if(z4 > sort->max.z) sort->max.z = z4;
               }
            }

            // TODO: Compute bbox around tri fan and strips (must be co-planar)
            sort->n = n;
         }
         if(-sort->max.z >= cMinZ)   // Don't include triangles clipped by near plane as the obscurity tests cannot properly handle the non-clipped coordinates
            triBuckets.add(i);
         else
         {
            // Stop sorting here if we encounter a clipped polygon
            sortCount = i;
            break;
         }
      }

      // AVLTree<uint> test { };
      for(i = 0; i < sortCount - 1; i++)
      {
         SortPrimitive * a = &sortTris[i];
         /*
         int j;

         for(j = i + 1; j < nTriangles; j++)
         {
            SortPrimitive * b = &triangles[j];
            if(a->xyOverlaps(b))
               test.Add(j);
         }
         */

         it.ref = i;
         while(it.Next())
         {
            int j = it.data;
            SortPrimitive * b = &sortTris[j];
            bool aob = false, boa = false;
            // bNearSideA: B points are entirely on the near side of A's plane
            // aFarSideB:  A points are entirely on the far side of B's plane

            // aNearSideB: A points are entirely on the near side of B's plane
            // bFarSideA:  B points are entirely on the far side of A's plane
            bool aFarSideB = false, aNearSideB = false, bFarSideA = false, bNearSideA = false;
            /*
            if(!a->xyOverlaps(b))
               Print("bug");
            */
             //test.TakeOut(j);

            a->planeSideCheck(b, &bNearSideA, &bFarSideA);
            b->planeSideCheck(a, &aNearSideB, &aFarSideB);

#if 0 //def _DEBUG
            if(A_OBSCURES_B && (bNearSideA || aFarSideB || !a->couldObscure(b)))
            {
               a->couldObscure(b);
               a->planeSideCheck(b, &bNearSideA, &bFarSideA);
               b->planeSideCheck(a, &aNearSideB, &aFarSideB);
            }
            if(B_OBSCURES_A && (aNearSideB || bFarSideA || !b->couldObscure(a)))
            {
               a->planeSideCheck(b, &bNearSideA, &bFarSideA);
               b->planeSideCheck(a, &aNearSideB, &aFarSideB);
            }
#endif

            if(!bNearSideA && !aFarSideB && a->couldObscure(b))
            {
                aob = A_OBSCURES_B;
#if 0 //def _DEBUG
                if(!aob && i == 8 && j == 9)
                   a->obscures(b);
#endif
            }

            if(!aNearSideB && !bFarSideA && b->couldObscure(a))
            {
                boa = B_OBSCURES_A;
#if 0 //def _DEBUG
                if(!boa)
                {
                   if(i == 11 && j == 9)
                      b->obscures(a);
                }
#endif
            }

            /*if(aob && boa)
            {
               aob = a->obscures(b);
               boa = b->obscures(a);
            }*/

            if(aob && !boa)
               a->depend(b, nodesPool, edgesPool), nEdges++;
            if(boa && !aob)
               b->depend(a, nodesPool, edgesPool), nEdges++;
         }
         /*
         if(test.count)
         {
            PrintLn("For ", i, " min = ", a->min, ", max = ", a->max);
            for(t : test)
            {
               uint e = t;
               SortPrimitive * b = &triangles[e];
               PrintLn("Missed ", e, " min = ", b->min, ", max = ", b->max);
            }
            uint * matches = null;
            uint nMatches = 0, alloced = 0;
            triBuckets.root.gatherMatches(&matches, &alloced, &nMatches, i,
               triBuckets.offset, // triBuckets.stride, triBuckets.minOffset, triBuckets.maxOffset,
               true);
            PrintLn("Missed a spot!");
         }
         test.Free();
         */
      }

#if 0 //def _DEBUG
      for(i = 0; i < sortCount; i++)
      {
         SortPrimitive * a = &sortTris[i];
         if(a->node && a->node.incoming.count)
         {
            TopoEdge e;

            Print(i, " obscures ");
            for(e = a->node.incoming.first; e; e = e.in.next)
               Print(((SortPrimitive *)e.from.data) - sortTris, e.in.next ? (e.in.next.in.next ? ", " : " and ") : "\n");
         }
      }
#endif

      it.OnFree();
      triBuckets.clear();
       //delete test;

      // PrintLn("TopoSorting ", sortCount, " triangles with ", nEdges, " edges.");
      topoSortPrimitives(nodesPool, edgesPool, sortTris, sortCount);

      if(sortData != null)
      {
         sortData.data[0] = triBuckets;
         sortData.data[1] = edgesPool;
         sortData.data[2] = nodesPool;
      }
      else
      {
         delete triBuckets;
         delete edgesPool;
         delete nodesPool;
      }
   }
}
