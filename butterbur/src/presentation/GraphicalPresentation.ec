public import IMPORT_STATIC "ecere"

#include "gl123es.h"

import "DrawingManager"
import "shapesTesselation"
import "GEInternals"

private static inline double signedVolume(Vector3D a, Vector3D b, Vector3D c, Vector3D d)
{
   Vector3D e1 { b.x - a.x, b.y - a.y, b.z - a.z };
   Vector3D e2 { c.x - a.x, c.y - a.y, c.z - a.z };
   Vector3D e3 { d.x - a.x, d.y - a.y, d.z - a.z };
   Vector3D cross;
   cross.CrossProduct(e1, e2);
   return cross.DotProduct(e3) / 6;
}

bool pickPrimitives(Mesh mesh, PrimitiveSingle primitive,
   Line rayLocal, Plane * localPickingPlanes, Vector3D rayDiff, Vector3D rayIntersect, uint64 * id)
{
   PrimitiveGroupType primType = primitive != null ? primitive.type : triangles;
   Plane * planes = localPickingPlanes;
   int c = 0;
   int nIndex = 1, nPoints = 1;
   bool result = false;
   int nVertices = primitive != null ? (primType.vertexRange ? primitive.nVertices : primitive.nIndices) : 0;
   int strip = 1;
   Vector3Df tmp;
   bool i32bit = primitive != null ? primType.indices32bit : true;
   uint32 * indices32 = !i32bit ? null :
      primitive && primitive.indices32 != null ? primitive.indices32 : mesh.indices ?
      mesh.indices + (primitive != null ? primitive.baseIndex : 0) : null;
   uint16 * indices16 = !i32bit && primitive && primitive.indices != null ? primitive.indices : null;
   bool usePickingPlanes = false; // TODO: Review this... was only set to true in 'orbitWithMouse' sample?
   bool intersecting = true;
   Vector3D points[50];
   Vector3D q1 = rayLocal.p0;
   Vector3D q2
   {
      rayLocal.p0.x + rayLocal.delta.x * 100000,
      rayLocal.p0.y + rayLocal.delta.y * 100000,
      rayLocal.p0.z + rayLocal.delta.z * 100000
   };
   Array<MeshPart> parts = mesh.parts;
   int p;

   if(id) *id = 0;

   if(!mesh.vertices) return false; // Need vertices here...

   for(p = 0; p < (parts ? parts.count : 1); p++)
   {
      MeshPart * part = parts ? &parts[p] : null;
      int offset = 0;
      int start = part ? 3*part->start : 0;
      int end = start + (part ? 3*part->count : nVertices);

      switch(primType.primitiveType)
      {
         case triangles: nIndex = 3; nPoints = 3; break;
         case quads: nIndex = 4; nPoints = 4; break;
         case triStrip:
         case triFan:
            nIndex = 1; nPoints = 3;
            offset = 2;
            tmp = primType.vertexRange ? mesh.vertices[primitive.first] : mesh.vertices[(i32bit ? indices32[start + 0] : indices16[start + 0])];
            points[0] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
            tmp = primType.vertexRange ? mesh.vertices[primitive.first+1] : mesh.vertices[(i32bit ? indices32[start + 1] : indices16[start + 1])];
            points[1] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
            break;
      }

      for(c = start + offset; c < end; c += nIndex)
      {
         bool outside = false;

         if(!usePickingPlanes)
         {
            int i, n = nPoints;

            if(primType.vertexRange)
            {
               if(primType.primitiveType == triStrip)
               {
                  tmp = mesh.vertices[primitive.first + (c & 1) ? (c - 1) : (c - 2)];
                  points[0] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
                  tmp = mesh.vertices[primitive.first + (c & 1) ? (c - 2) : (c - 1)];
                  points[1] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
               }
               else if(primType.primitiveType == triFan)
               {
                  tmp = mesh.vertices[primitive.first + 0];
                  points[0] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
                  tmp = mesh.vertices[primitive.first + c - 1];
                  points[1] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
               }
               for(i = 0; i<nIndex; i++)
               {
                  tmp = mesh.vertices[primitive.first + c+i];
                  points[i + offset] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
               }
            }
            else
            {
               if(primType.primitiveType == triStrip)
               {
                  i = (c & 1) ? (c - 1) : (c - 2);
                  tmp = mesh.vertices[(i32bit ? indices32[i] : indices16[i])];
                  points[0] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };

                  i = (c & 1) ? (c - 2) : (c - 1);
                  tmp = mesh.vertices[(i32bit ? indices32[i] : indices16[i])];
                  points[1] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
               }
               else if(primType.primitiveType == triFan)
               {
                  tmp = mesh.vertices[(i32bit ? indices32[start] : indices16[start])];
                  points[0] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
                  tmp = mesh.vertices[(i32bit ? indices32[c-1] : indices16[c-1])];
                  points[1] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
               }
               for(i = 0; i<nIndex; i++)
               {
                  tmp = mesh.vertices[(i32bit ? indices32[c+i] : indices16[c+i])];
                  points[i + offset] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
               }
            }

            if(planes)
            {
               int p;
               Vector3D newPoints[50];
               byte goodPoints[50];
               //#define THRESHOLD           -1
               //#define THRESHOLD           -0.25
               #define THRESHOLD           -0.0025

               for(p = 0; p < 6; p++)
               {
                  Plane * plane = &planes[p];
                  int i;
                  int numGoodPoints = 0;

                  memset(goodPoints, 0, n);
                  for(i = 0; i < n; i++)
                  {
                     double dot = plane->normal.DotProduct(points[i]);
                     double distance = dot + plane->d;
                     if(distance > THRESHOLD)
                     {
                        numGoodPoints++;
                        goodPoints[i] = 1;
                     }
                  }
                  if(!numGoodPoints)
                  {
                     outside = true;
                     break;
                  }
                  if(numGoodPoints < n)
                  {
                     // Clip the polygon
                     int newN = 0;
                     int lastGood = -1;
                     int j;

                     for(j = 0; j<n; )
                     {
                        if(goodPoints[j])
                        {
                           newPoints[newN++] = points[j];
                           lastGood = j++;
                        }
                        else
                        {
                           Line edge;
                           int next;

                           if(lastGood == -1)
                              for(lastGood = n-1; !goodPoints[lastGood]; lastGood--);

                           edge.p0 = points[lastGood];
                           edge.delta.Subtract(points[j], edge.p0);
                           plane->IntersectLine(edge, newPoints[newN++]);

                           for(next = j+1; next != j; next++)
                           {
                              if(next == n) next = 0;
                              if(goodPoints[next])
                              {
                                 int prev = next - 1;
                                 if(prev < 0) prev = n-1;

                                 edge.p0 = points[prev];
                                 edge.delta.Subtract(points[next], edge.p0);
                                 plane->IntersectLine(edge, newPoints[newN++]);
                                 break;
                              }
                           }
                           if(next <= j)
                              break;
                           else
                              j = next;
                        }
                     }
                     // Use the new points
                     memcpy(points, newPoints, newN * sizeof(Vector3D));
                     n = newN;
                  }
               }
            }
            else
            {
               // New method for arbitrary ray based on signed volumes of tetrahedrons formed by
               // triangles points and a very long line
               // TODO: Optimize this
               Vector3D * p1 = &points[0], * p2 = &points[1], * p3 = &points[2];
               int s1 = Sgn(signedVolume(q1, p1, p2, p3));
               int s2 = Sgn(signedVolume(q2, p1, p2, p3));
               int s3 = Sgn(signedVolume(q1, q2, p1, p2));
               int s4 = Sgn(signedVolume(q1, q2, p2, p3));
               int s5 = Sgn(signedVolume(q1, q2, p3, p1));
               if(s1 != s2 && s3 == s4 && s4 == s5);
               else
                  outside = true;
            }
         }

         if(!outside)
         {
            result = true;

            // TODO: Implement intersection with TriStrip, TriFan...
            if(intersecting)
            {
               // Intersect primitives
               Plane plane;
               Vector3D intersect, diff;
               int i0 = c, i1 = c+1, i2 = c+2;

               if(primType == triStrip)
               {
                  i0 = (c & 1) ? (c - 1) : (c - 2);
                  i1 = (c & 1) ? (c - 2) : (c - 1);
                  i2 = c;
               }
               else if(primType == triFan)
               {
                  i0 = start;
                  i1 = c - 1;
                  i2 = c;
               }

               if(primType.vertexRange)
                  plane.FromPointsf(
                     mesh.vertices[primitive.first + i0],
                     mesh.vertices[primitive.first + i1],
                     mesh.vertices[primitive.first + i2]);
               else
                  plane.FromPointsf(
                     mesh.vertices[(i32bit ? indices32[i0] : indices16[i0])],
                     mesh.vertices[(i32bit ? indices32[i1] : indices16[i1])],
                     mesh.vertices[(i32bit ? indices32[i2] : indices16[i2])]);

               plane.IntersectLine(rayLocal, intersect);
               diff.Subtract(intersect, rayLocal.p0);
               diff.x /= rayLocal.delta.x;
               diff.y /= rayLocal.delta.y;
               diff.z /= rayLocal.delta.z;
               if(diff.x < rayDiff.x || diff.y < rayDiff.y || diff.z < rayDiff.z)
               {
                  if(part)
                     *id = part->id;

                  rayDiff = diff;
                  rayIntersect = intersect;
               }
            }
            else
               break;
         }

         switch(primType)
         {
            case triStrip:
               points[strip] = points[2];
               strip ^= 1;
               break;
            case triFan:
               points[1] = points[2];
               break;
         }
      }
   }
   return result;
}

int pickMesh(const Boxf region, int maxResults, PickResult * results, Line rayLocal, Plane * localPickingPlanes, Mesh mesh)
{
   int nPicks = 0;
   Vector3D rayDiff { MAXFLOAT, MAXFLOAT, MAXFLOAT };
   Vector3D rayIntersect { MAXFLOAT, MAXFLOAT, MAXFLOAT };
   uint64 resultID = 0;

   // TODO: Support multiple results ?

   if(mesh.indices)
   {
      uint64 id;
      if(pickPrimitives(mesh, null, rayLocal, localPickingPlanes, rayDiff, rayIntersect, &id))
      {
         // TODO: Compare result depth
         resultID = id;
      }
   }
   else if(mesh.groups.first)
   {
      PrimitiveGroup group;

      for(group = mesh.groups.first; group; group = group.next)
      {
         uint64 id;
         if(pickPrimitives(mesh, (PrimitiveSingle *)&group.type, rayLocal, localPickingPlanes, rayDiff, rayIntersect, &id))
         {
            // TODO: Compare result depth
            resultID = id;
         }
      }
   }
   /*else
   {
      int c;
      for(c = 0; c < mesh.nPrimitives; c++)
      {
         uint64 id;
         if(pickPrimitives(mesh, mesh.primitives[c], pickContext, rayDiff, rayIntersect, &id))
         {
            // TODO: Compare result depth
            resultID = id;
         }
      }
   }*/
   if(resultID)
   {
      results[nPicks] = { id = resultID };
      nPicks++;
   }
   return nPicks;
}

int pickObject(const Boxf region, int maxResults, PickResult * results, Line rayLocal, Plane * localPickingPlanes, Object model)
{
   Object c;
   int nPicks = 0;

   if(model.mesh)
   {
      nPicks += pickMesh(region, maxResults, results, rayLocal, localPickingPlanes, model.mesh);
   }

   for(c = model.firstChild; c; c = c.next)
   {
      nPicks += pickObject(region, maxResults - nPicks, results + nPicks, rayLocal, localPickingPlanes, c);
   }
   return nPicks;
}

public class GraphicalPresentation : Presentation
{
   GraphicalElement ge;
   GEType geType;
   // float cTransform[3]; // The total transform applied to a leaf graphical element.  Calculated from local transform of all containing elements
   Transform transform; // The transform applied at this specific level of the hierarchy
   transform.scaling = { 1, 1, 1 };

   Map<Color, Array<uint64>> modelColorMap;
   bool updateModelColorMap;
   bool freeModel;

   // REVIEW: Should we allocate separate side data for specific implementations?
  // union  // REVIEW: image is non-null with the union?
  // {
      // For Shape
      struct
      {
         uint commandsCount; //Number of draw commands this takes to draw
         uint vertexBase, fillBase, lineBase;
         TesselatedShape tShape;
      };

      // For Text

      // For Image
      void * image;
      int imgW, imgH;

      // For Path3D
      uint vCount;

      // For Multi

      // For Model
      Object model;
//   };

   vertexBase = -1, fillBase = -1, lineBase = -1;

public:

   ~GraphicalPresentation()
   {
      // TODO: Free buffers and stuff from MD
      freeGE(ge);
      delete ge;
   }

   property Object modelObject
   {
      set { model = value; freeModel = false; geType = model; }
      get { return model; }
   }

   property Map<Color, Array<uint64>> modelColorMap
   {
      set
      {
         // if(value != modelColorMap)
         {
            modelColorMap = value;
            updateModelColorMap = true;
         }
      }
   }

   property GraphicalElement graphic
   {
      set
      {
         unloadGraphicsGE(false, ge, displaySystem);
         ge = value;
         geType = ge ? ge.type : none;

         needUpdate = true;
         if(ge) incref ge;
      }
      get { return ge; }
   }

   property Transform transform3D
   {
      set { transform = value; }
      get { value = transform; }
   };
   property Pointf position2D
   {
      set { transform.position = { value.x, value.y, 0 }; }
      get { value = { (float)transform.position.x, (float)transform.position.y }; }
   };
   property Vector3D position3D
   {
      set { transform.position = value; }
      get { value = transform.position; }
   };
   property Degrees orientation2D
   {
      // FIXME: This Quaternion storage is quite inefficient for 2D...
      set { transform.orientation.Yaw(value); }
      get { Euler euler; euler.FromQuaternion(transform.orientation, yxz); return euler.yaw; }
   };
   property Quaternion orientation3D
   {
      set { transform.orientation = value; }
      get { value = transform.orientation; }
   };
   property float scaling
   {
      set { transform.scaling = { value, value, value }; }
      get { return transform.scaling.x; }
   }
   property Pointf scaling2D
   {
      set { transform.scaling = { value.x, value.y, 1 }; }
      get { value = { transform.scaling.x, transform.scaling.y }; }
   };
   property Vector3Df scaling3D
   {
      set { transform.scaling = value; }
      get { value = transform.scaling; }
   };

   void unloadGraphics(bool shutDown)
   {
      unloadGraphicsGE(shutDown, ge, displaySystem);
   }

   void calculate(Presentation topPres, PresentationManager mgr)
   {
      if(needUpdate)
      {
         MultiPresentation p = parent;

         rdrFlags = calculateGE(ge, mgr, p.anchored);
         needUpdate = false;
      }
   }

   void prepareDraw(RenderPassFlags renderFlags, MDManager dm, const float * transform)
   {
      if(rdrFlags & renderFlags)
      {
         GraphicalElement ge = this.ge;
         float cTransform[12];

         if(renderFlags.perspective)
         {
            // Full blown 3D transform
            Transform * t = &this.transform;
            Quaternion * o = &t->orientation;
            Transform lt
            {
               { t->position.x, -t->position.y, t->position.z },
               // In 3D, yaw must be negated to be positive counter-clockwise top-down (map style)
               { o->w, o->x, -o->y, -o->z },
               t->scaling
            };
            Transform * gt = ge ? &ge.transform : null;
            Quaternion * go = gt ? &gt->orientation : null;
            Transform glt
            {
               gt ? { gt->position.x, -gt->position.y, gt->position.z } : { },
               // In 3D, yaw must be negated to be positive counter-clockwise top-down (map style)
               go ? { go->w, go->x, -go->y, -go->z } : { },
               gt ? gt->scaling : { 1,1,1 }
            };
            Matrix gTransform = glt;
            Matrix lTransform = lt;
            Matrix parent
            { {
               transform[ 0], transform[ 1], transform[ 2], 0,
               transform[ 3], transform[ 4], transform[ 5], 0,
               transform[ 6], transform[ 7], transform[ 8], 0,
               transform[ 9], transform[10], transform[11], 1
            } };
            Matrix combined;
            // TODO: Could we reduce the number of matrix multiplications?
            combined.Multiply3x4(lTransform, gTransform);
            lTransform = combined;
            combined.Multiply3x4(lTransform, parent);

            cTransform[0] = (float)combined.m[0][0], cTransform[ 1] = (float)combined.m[0][1], cTransform[ 2] = (float)combined.m[0][2];
            cTransform[3] = (float)combined.m[1][0], cTransform[ 4] = (float)combined.m[1][1], cTransform[ 5] = (float)combined.m[1][2];
            cTransform[6] = (float)combined.m[2][0], cTransform[ 7] = (float)combined.m[2][1], cTransform[ 8] = (float)combined.m[2][2];
            cTransform[9] = (float)combined.m[3][0], cTransform[10] = (float)combined.m[3][1], cTransform[11] = (float)combined.m[3][2];
         }
         else
         {
            // TODO: 2D Rotation and scaling support...
            cTransform[0] = (float)((transform ? transform[0] : 0) + this.transform.position.x + ge.transform.position.x);
            cTransform[1] = (float)((transform ? transform[1] : 0) + this.transform.position.y + ge.transform.position.y);
            cTransform[2] = 0;
         }

         prepareDrawGE(renderFlags, dm, ge, cTransform);
      }
   }

   int pick(const Boxf region, int maxResults, PickResult * results, const float * transform,
      const Matrix * vm, const Pointd * projParams)
   {
      if(rdrFlags.perspective)
      {
         if(model)
         {
            //float cTransform[12];
            // Full blown 3D transform
            Transform * t = &this.transform;
            Quaternion * o = &t->orientation;
            Transform lt
            {
               { t->position.x, -t->position.y, t->position.z },
               // In 3D, yaw must be negated to be positive counter-clockwise top-down (map style)
               { o->w, o->x, -o->y, -o->z },
               t->scaling
            };
            Transform * gt = ge ? &ge.transform : null;
            Quaternion * go = gt ? &gt->orientation : null;
            Transform glt
            {
               gt ? { gt->position.x, -gt->position.y, gt->position.z } : { },
               // In 3D, yaw must be negated to be positive counter-clockwise top-down (map style)
               go ? { go->w, go->x, -go->y, -go->z } : { },
               gt ? gt->scaling : { 1,1,1 }
            };
            Matrix gTransform = glt;
            Matrix lTransform = lt;
            Matrix parent
            { {
               transform[ 0], transform[ 1], transform[ 2], 0,
               transform[ 3], transform[ 4], transform[ 5], 0,
               transform[ 6], transform[ 7], transform[ 8], 0,
               transform[ 9], transform[10], transform[11], 1
            } };
            Matrix combined;
            int nPicks;
            Line rayView, rayWorld, rayLocal;

            // TODO: Could we reduce the number of matrix multiplications?
            combined.Multiply3x4(lTransform, gTransform);
            lTransform = combined;
            combined.Multiply3x4(lTransform, parent);
            /*
            cTransform[0] = (float)combined.m[0][0], cTransform[ 1] = (float)combined.m[0][1], cTransform[ 2] = (float)combined.m[0][2];
            cTransform[3] = (float)combined.m[1][0], cTransform[ 4] = (float)combined.m[1][1], cTransform[ 5] = (float)combined.m[1][2];
            cTransform[6] = (float)combined.m[2][0], cTransform[ 7] = (float)combined.m[2][1], cTransform[ 8] = (float)combined.m[2][2];
            cTransform[9] = (float)combined.m[3][0], cTransform[10] = (float)combined.m[3][1], cTransform[11] = (float)combined.m[3][2];
            */
            // Compute picking ray
            {
               Vector3D p;
               Matrix ivm;

               ivm.Transpose(vm);

               rayView.p0 = { 0, 0, 0 };
               p.x = (region.left + region.right) / 2;
               p.y = (region.top + region.bottom) / 2;
               p.z = 0.0f;

               rayView.delta.z = projParams[1].y / (p.z + projParams[1].x);
               rayView.delta.y = ((p.y - projParams[0].y) * rayView.delta.z / projParams[2].y);
               rayView.delta.x = ((p.x - projParams[0].x) * rayView.delta.z / projParams[2].x);

               // Convert ray to world space
               rayWorld.p0.MultMatrix(rayView.p0, ivm);
               p.MultMatrix(rayView.delta, ivm);

               rayWorld.delta.Subtract(p, rayWorld.p0);
            }

            // Transform ray
            {
               Vector3D p2, tp2;

               p2.Add(rayWorld.p0, rayWorld.delta);
               rayLocal.p0.DivideMatrix(rayWorld.p0, combined);
               tp2.DivideMatrix(p2, combined);
               rayLocal.delta.Subtract(tp2, rayLocal.p0);
            }

            nPicks = pickObject(region, maxResults, results, rayLocal, null, model);
            if(nPicks)
            {
               results[0].presentation = this;
            }
            return nPicks;
         }
      }
      else
      {
         Boxf tRegion
         {
            region.left - (transform ? transform[0] : 0) - (float)this.transform.position.x, region.top - (transform ? transform[1] : 0) - (float)this.transform.position.x,
            region.right - (transform ? transform[0] : 0) - (float)this.transform.position.y, region.bottom - (transform ? transform[1] : 0) - (float)this.transform.position.x
         };

         GraphicalElement grf = pickGE((tRegion.left + tRegion.right)/2, (tRegion.top + tRegion.bottom)/2, rdrFlags, ge, null);

         if(grf)
         {
            results[0] = { this, element = grf }; // graphic
            return 1;
         }
      }
      return 0;
   }
}
