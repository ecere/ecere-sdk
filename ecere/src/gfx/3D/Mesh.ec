namespace gfx3D;

import "Display"

#if !defined(ECERE_NOGL)
import "GLMultiDraw"
#include "gl123es.h"
#endif

#ifdef ETC2_COMPRESS
default extern void etc2Free(void * data);
#endif

public class MeshFeatures
{
public:
   bool vertices:1, normals:1, texCoords1:1, texCoords2:1, doubleNormals:1, doubleVertices:1, colors:1, lightVectors:1, tangents:1, intVertices:1;
   // NOTE: neither of these two are currently kept in Mesh's flags member:
   bool memAllocOnly:1, interleaved:1;
   bool ownMEAB:1;
};

public class PrimitiveGroupType : uint32
{
public:
   RenderPrimitiveType primitiveType:8;
   bool vertexRange:1, indices32bit:1, sharedIndices:1;
};

public enum RenderPrimitiveType : PrimitiveGroupType
{
   dot, // Point,
   lines,
   triangles,
   triStrip,
   triFan,
   quads,
   quadStrip,
   lineStrip

   /* ,
   lineLoop,
   lineStrip,
   polygon
   */
};

public class MaterialFlags
{
public:
    bool doubleSided:1;
    bool translucent:1;
    bool tile:1;
    bool noFog:1;
    bool singleSideLight:1;
    bool separateSpecular:1;
    bool cubeMap:1;
    bool noLighting:1;
    bool partlyTransparent:1;
    bool setupTextures:1;
    bool update:1;
    bool constantColor:1;
};

public class Material : struct
{
public:
   Material prev, next;
   char * name;
   float opacity;
   ColorRGB diffuse;
   ColorRGB ambient;
   ColorRGB specular;
   ColorRGB emissive;
   float power;
   Bitmap baseMap;
   Bitmap bumpMap;
   Bitmap specularMap;
   Bitmap reflectMap;
   CubeMap envMap;
   float reflectivity;
   float refractiveIndex;
   float refractiveIndexContainer;

   MaterialFlags flags;
   float uScale, vScale;
#if !defined(ECERE_NOGL)
   Shader shader;

   #define LAST_MEMBER shader
#else
   #define LAST_MEMBER vScale
#endif

   Material()
   {
      flags.setupTextures = true;
      flags.update = true;
   }

   void Free()
   {
      delete name;
   }

   ~Material()
   {
      // NOTE: OldList::Delete() and FreeMaterial() is also used...
      Free();
   }

   void OnCopy(Material b)
   {
      // NOTE: OnCopy is non-intuitive for class : struct ...
      this = { };
      *this = *b;
      name = CopyString(b.name);
   }

   int OnCompare(Material b)
   {
      return memcmp(&opacity, &b.opacity, (byte *)((&LAST_MEMBER) + 1) - (byte *)&opacity);
   }
};

public class PrimitiveGroup : struct
{
public:
   PrimitiveGroup prev, next;
   PrimitiveGroupType type;
   int baseIndex;
   union
   {
      struct { union { uint16 * indices; uint * indices32; }; int nIndices; };
      struct { int first, nVertices; };
   };
   Material material;

private:
   void * data;
};

/*
public class PrimitiveGroupIndices16 : PrimitiveGroup
{
   property Array<uint16> indices
   {
      set { }
   }
}

public class PrimitiveGroupIndices32 : PrimitiveGroup
{
   property Array<uint> indices
   {
      set { }
   }
}

public class PrimitiveGroupVertexRange : PrimitiveGroup
{
   property int first { set { } }
   property int nVertices { set { } }
}
*/

public struct PrimitiveSingle
{
public:
   PrimitiveGroupType type;
   int baseIndex;
   union
   {
      struct { union { uint16 * indices; uint * indices32; }; int nIndices; };
      struct { int first, nVertices; };
   };
   Material material;

private:
   void * data;
   Vector3Df middle;
   Plane plane;
};

public struct MeshPart
{
   uint64 id;
   uint start;
   uint count;
};

public class Mesh : struct
{
public:
   property Pointf * texCoords { get { return texCoords; } set { texCoords = value; } };
   property int nVertices { get { return nVertices; } set { nVertices = value; } };
   property Vector3Df * vertices { get { return vertices; } set { vertices = value; } };
   property int nIndices { get { return nIndices; } set { nIndices = value; } };
#if !defined(ECERE_NOGL)
   property GLMB meab { get { return meab; } set { meab = value; } };
#endif
   property int baseIndex { get { return baseIndex; } set { baseIndex = value; } };
   property int baseVertex { get { return baseVertex; } set { baseVertex = value; } };
   property uint32 * indices { get { return indices; } set { indices = value; } };
   property Vector3Df * normals { get { return normals; } set { normals = value; } };
   property Vector3Df * tangents { get { return tangents; } set { tangents = value; } };
   property ColorRGBAf * colors { get { return colors; } set { colors = value; } };
   property ColorRGB * lightVectors { get { return lightVectors; } set { lightVectors = value; } };
   property OldList groups { get { value = groups; } };
   property MeshFeatures flags { get { return flags; } set { flags = value; } };

   // For intra-model attribution; in groups order, assuming triangles
   // REVIEW: Should parts be in PrimitiveGroup instead? Picking and 'baseIndex' not currently supported?
   property Array<MeshPart> parts { get { return parts; } set { parts = value; } };

   void Free(MeshFeatures what)
   {
      if(this)
      {
         DisplaySystem displaySystem = this.displaySystem;
         PrimitiveGroup group;
         if(!what)
         {
            int c;
            bool ownMEAB = flags.ownMEAB;

            flags = 0;  // Drivers relied on this being set to 0 before freeing
            if(driver)
               driver.FreeMesh(displaySystem, this);
            for(;(group = groups.first);)
               FreePrimitiveGroup(group);

            for(c = 0; c < nPrimitives; c++)
            {
               PrimitiveSingle * prim = &primitives[c];
               if(prim->data)
               {
#if !defined(ECERE_NOGL)
                  if(meab)
                  {
                     int baseIndex = prim->baseIndex;
                     ((OGLIndices)prim->data).buffer.buffer = 0;
                     if(baseIndex != -1)
                     {
                        uint iSize = prim->type.indices32bit ? sizeof(uint) : sizeof(uint16);
                        meab.freeBlock(BlockEntry { baseIndex * iSize, (baseIndex + prim->nIndices) * iSize-1 });
                        prim->baseIndex = -1;
                     }
                  }
#endif
                  driver.FreeIndices(displaySystem, primitives[c]);
               }
               if(!prim->type.vertexRange)
                  delete prim->indices;
            }

            // Free MEAB if it was allocated specifically for this mesh
#if !defined(ECERE_NOGL)
            if(ownMEAB) meab.Free(), delete meab;
#endif
            delete indices;
            delete primitives;
            nPrimitives = 0;
            nVertices = 0;
            this.displaySystem = null;
            driver = null;
         }
         else
         {
            flags &= ~what;
            if(driver)
               driver.FreeMesh(displaySystem, this);
         }
         delete parts;
      }
   }

   bool Allocate(MeshFeatures what, int nVertices, DisplaySystem displaySystem)
   {
      bool result = false;
      if(!this.displaySystem || this.displaySystem == displaySystem)
      {
         driver = displaySystem ? displaySystem.driver : (subclass(DisplayDriver))class(LFBDisplayDriver);
         if(driver.AllocateMesh == DisplayDriver::AllocateMesh) driver = (subclass(DisplayDriver))class(LFBDisplayDriver);
         if(driver.AllocateMesh(displaySystem, this, what, nVertices))
         {
            what.memAllocOnly = false;
            flags |= what;
            this.nVertices = nVertices;
            if(Lock(what))
               result = true;
         }
         if(!result)
            Free(what);
         this.displaySystem = displaySystem;
      }
      return result;
   }

   void Unlock(MeshFeatures flags)
   {
      if(this && driver)
         driver.UnlockMesh(displaySystem, this, flags);
   }

   bool Lock(MeshFeatures flags)
   {
      bool result = false;
      if(this && driver)
      {
         if(driver.LockMesh(displaySystem, this, flags))
            result = true;
         if(!result)
            Unlock(flags);
      }
      return result;
   }

   void FreePrimitiveGroup(PrimitiveGroup group)
   {
      if(this && group)
      {
         if(group.data)
         {
#if !defined(ECERE_NOGL)
            if(meab)
            {
               int baseIndex = group.baseIndex;
               ((OGLIndices)group.data).buffer.buffer = 0;
               if(baseIndex != -1)
               {
                  uint iSize = group.type.indices32bit ? sizeof(uint) : sizeof(uint16);
                  meab.freeBlock(BlockEntry { baseIndex * iSize, (baseIndex + group.nIndices) * iSize-1 });
                  group.baseIndex = -1;
               }
            }
#endif
            driver.FreeIndices(displaySystem, (PrimitiveSingle *)&group.type);
         }
         if(!group.type.vertexRange)
            delete group.indices;
         groups.Delete(group);
      }
   }

   PrimitiveGroup AddPrimitiveGroup(PrimitiveGroupType flags, int nIndices)
   {
      PrimitiveGroup result = null;
      PrimitiveGroup group { };
      if(group)
      {
         groups.Add(group);
         group.type = flags;
         if(!(flags.vertexRange))
         {
            group.nIndices = nIndices;
            if(!flags.sharedIndices && driver)
            {
               group.indices = (void *)(flags.indices32bit ? new uint32[nIndices] : new uint16[nIndices]);
               group.data = driver.AllocateIndices(displaySystem, nIndices, flags.indices32bit);
               if(group.data)
               {
                  if(LockPrimitiveGroup(group))
                     result = group;
               }
            }
            else
               result = group;
         }
         else
            result = group;
         if(!result)
            FreePrimitiveGroup(group);
      }
      return result;
   }

   bool LockPrimitiveGroup(PrimitiveGroup group)
   {
      bool result = false;
      if(this && group)
      {
         if(group.type.vertexRange)
            result = true;
         else if(group.data && driver.LockIndices(displaySystem, (PrimitiveSingle *)&group.type))
            result = true;
      }
      return result;
   }

   void UnlockPrimitiveGroup(PrimitiveGroup group)
   {
      if(this && group)
      {
         bool shareIndicesTweak = false;
         if(group.type.sharedIndices && !group.indices && indices)
         {
            shareIndicesTweak = true;
            group.indices = (uint16 *)((byte *)indices + (group.baseIndex * (group.type.indices32bit ? 4 : 2)));
         }
#if !defined(ECERE_NOGL)
         driver.UnlockIndices(displaySystem, (PrimitiveSingle *)&group.type, group.type.indices32bit, group.nIndices, meab);
#else
         driver.UnlockIndices(displaySystem, (PrimitiveSingle *)&group.type, group.type.indices32bit, group.nIndices, null);
#endif
         if(shareIndicesTweak)
            group.indices = null;
      }
   }

   void FreePrimitive(PrimitiveSingle primitive)
   {
      if(this && primitive)
      {
         if(primitive.data)
         {
#if !defined(ECERE_NOGL)
            if(meab)
            {
               int baseIndex = primitive.baseIndex;
               ((OGLIndices)primitive.data).buffer.buffer = 0;
               if(baseIndex != -1)
               {
                  uint iSize = primitive.type.indices32bit ? sizeof(uint) : sizeof(uint16);
                  meab.freeBlock(BlockEntry { baseIndex * iSize, (baseIndex + primitive.nIndices) * iSize-1 });
                  primitive.baseIndex = -1;
               }
            }
#endif
            driver.FreeIndices(displaySystem, primitive);
            primitive.data = null;
         }
         if(!primitive.type.vertexRange)
            delete primitive.indices;
      }
   }

   bool AllocatePrimitive(PrimitiveSingle primitive, PrimitiveGroupType flags, int nIndices)
   {
      bool result = false;
      if(this && primitive)
      {
         primitive.type = flags;
         if(!flags.vertexRange)
            primitive.indices = (void *)(flags.indices32bit ? new uint32[nIndices] : new uint16[nIndices]);
         primitive.data = driver.AllocateIndices(displaySystem, nIndices, flags.indices32bit);
         primitive.nIndices = nIndices;
         if(primitive.data)
         {
            if(LockPrimitive(primitive))
               result = true;
         }
         if(!result)
            FreePrimitive(primitive);
      }
      return result;
   }

   void UnlockPrimitive(PrimitiveSingle primitive)
   {
      if(this && primitive)
      {
#if !defined(ECERE_NOGL)
         driver.UnlockIndices(this.displaySystem, primitive, primitive.type.indices32bit, primitive.nIndices, meab);
#else
         driver.UnlockIndices(this.displaySystem, primitive, primitive.type.indices32bit, primitive.nIndices, null);
#endif
      }
   }

   bool LockPrimitive(PrimitiveSingle primitive)
   {
      bool result = false;
      if(this && primitive)
      {
         if(driver.LockIndices(displaySystem, primitive))
            result = true;
      }
      return result;
   }

   // TODO: Make this a runtime option to force smoothing!
   // #define NORMALS_MERGE_VERTICES

   void ComputeNormals(void)
   {
      ComputeNormals2(true);
   }

   void ComputeNormals2(bool computeTangents)
   {
      int c;
      int * numShared = new0 int[nVertices];
      double * weightSum = new0 double[nVertices];
      PrimitiveGroup group;

      if(Allocate({ normals = true, tangents = texCoords != null && computeTangents }, nVertices, displaySystem))
      {
#ifdef NORMALS_MERGE_VERTICES
         Map<uint, uint> ixMap { };
         Map<SharedVertex, uint> vMap { };
#endif
         Vector3Df * normals = this.normals;
         Vector3Df * tangents = this.tangents;
         Pointf * texCoords = this.texCoords;
         int i;
         Vector3Df * vertices = this.vertices;
         FillBytes(normals, 0, nVertices * sizeof(Vector3Df));
         if(tangents)
            FillBytes(tangents, 0, 2*nVertices * sizeof(Vector3Df));
         for(group = groups.first; group; group = group.next)
         {
            int c;
            int offset = 0;
            int strip = 0;
            int nPoints, nIndex;
            uint16 * indices16 = group.indices;
            uint32 * indices32 = group.indices32;
            bool i32bit = group.type.indices32bit;

            if(group.type.primitiveType == triangles)
               nIndex = nPoints = 3;
            else if(group.type.primitiveType == quads)
               nIndex = nPoints = 4;
            else if(group.type.primitiveType == triFan || group.type.primitiveType == triStrip || group.type.primitiveType == quadStrip)
            {
               offset = 2;
               nIndex = 1;
               nPoints = 3;
            }
            else
               continue;
            /*
            int nIndicesPerPrimitive;
            if(group.type == Triangles)
               nIndicesPerPrimitive = 3;
            else if(group.type == Quads)
               nIndicesPerPrimitive = 4;
            else
               continue;
            */
            for(c = offset; c<group.nIndices; c += nIndex)
            {
               Plane plane;
               Vector3Df planeNormal;

               if(group.type.primitiveType == triFan)
               {
                  uint ix0 = indices16[0];
                  uint ix1 = indices16[c];
                  uint ix2 = indices16[c-1];
                  plane.FromPointsf(vertices[ix0], vertices[ix1], vertices[ix2]);
                  planeNormal = { (float) plane.normal.x, (float) plane.normal.y, (float) plane.normal.z };

                  normals[ix0].Add(normals[ix0], planeNormal); numShared[ix0]++;
                  normals[ix1].Add(normals[ix1], planeNormal); numShared[ix1]++;
                  normals[ix2].Add(normals[ix2], planeNormal); numShared[ix2]++;
                  weightSum[ix0] += 1.0;  // TODO: Review weightSums
                  weightSum[ix1] += 1.0;
                  weightSum[ix2] += 1.0;
               }
               else if(group.type.primitiveType == triStrip || group.type.primitiveType == quadStrip)
               {
                  uint ix0 = indices16[c-1-strip];
                  uint ix1 = indices16[c-2+strip];
                  uint ix2 = indices16[c];
                  plane.FromPointsf(vertices[ix0], vertices[ix1], vertices[ix2]);
                  planeNormal = { (float) plane.normal.x, (float) plane.normal.y, (float) plane.normal.z };

                  normals[ix0].Add(normals[ix0], planeNormal); numShared[ix0]++;
                  normals[ix1].Add(normals[ix1], planeNormal); numShared[ix1]++;
                  normals[ix2].Add(normals[ix2], planeNormal); numShared[ix2]++;
                  weightSum[ix0] += 1.0;  // TODO: Review weightSums
                  weightSum[ix1] += 1.0;
                  weightSum[ix2] += 1.0;

                  strip ^= 1;
               }
               else
               {
                  if(group.type.vertexRange)
                  {
                     plane.FromPointsf(vertices[c+2],
                                       vertices[c+1],
                                       vertices[c]);
                     planeNormal = { (float) plane.normal.x, (float) plane.normal.y, (float) plane.normal.z };

                     for(i = c; i<c+nIndex; i++)
                     {
                        uint ix = i;
                        normals[ix].Add(normals[ix], planeNormal);
                        numShared[ix]++;
                        weightSum[ix] += 1.0;   // TODO: Review weightSums
                        weightSum[ix] += 1.0;
                        weightSum[ix] += 1.0;

                     }
                  }
                  else
                  {
                     Vector3D edges[4], rEdges[4];
                     double weights[4];
                     computeNormalWeights(nIndex, vertices, indices32, i32bit, c, weights, edges, rEdges);

                     plane.FromPointsf(vertices[i32bit ? indices32[c+2] : indices16[c+2]],
                                       vertices[i32bit ? indices32[c+1] : indices16[c+1]],
                                       vertices[i32bit ? indices32[c  ] : indices16[c  ]]);
                     planeNormal = { (float) plane.normal.x, (float) plane.normal.y, (float) plane.normal.z };

                     for(i = c; i<c+nIndex; i++)
                     {
                        int index = i32bit ? indices32[i] : indices16[i];
                        int v = i - c;
                        double w = weights[v];

#ifdef NORMALS_MERGE_VERTICES
                        index = resolveIndex(index, vMap, ixMap, vertices[index], plane);
#endif

                        //normals[index].Add(normals[index], planeNormal);
                        normals[index].x += planeNormal.x * w;
                        normals[index].y += planeNormal.y * w;
                        normals[index].z += planeNormal.z * w;
                        weightSum[index] += w;
                        //numShared[index] ++;

                        if(tangents)
                        {
                           uint ix0 = index;
                           uint prev = v ? i - 1 : c + nIndex-1;
                           uint next = v < nIndex-1 ? i + 1 : c;
                           uint ix1 = i32bit ? indices32[next] : indices16[next];
                           uint ix2 = i32bit ? indices32[prev] : indices16[prev];
                           Vector3Df * p0 = &vertices [ix0], * p1 = &vertices [ix1], * p2 = &vertices[ix2];
                           Pointf    * t0 = &texCoords[ix0], * t1 = &texCoords[ix1], * t2 = &texCoords[ix2];
                           Vector3D v01 { p1->x - p0->x, p1->y - p0->y, p1->z - p0->z };
                           Vector3D v02 { p2->x - p0->x, p2->y - p0->y, p2->z - p0->z };
                           Pointf t01 { t1->x - t0->x, t1->y - t0->y };
                           Pointf t02 { t2->x - t0->x, t2->y - t0->y };
                           //if(Abs(t01.x) > 0.99) t01.x = 0;
                           //if(Abs(t02.x) > 0.99) t02.x = 0;

                           double f = w / (t01.x * t02.y - t02.x * t01.y);
                           Vector3Df * tan1 = &tangents[index*2+0];
                           Vector3Df * tan2 = &tangents[index*2+1];

                           tan1->x += f * (v01.x * t02.y - v02.x * t01.y);
                           tan1->y += f * (v01.y * t02.y - v02.y * t01.y);
                           tan1->z += f * (v01.z * t02.y - v02.z * t01.y);

                           tan2->x += f * (v02.x * t01.x - v01.x * t02.x);
                           tan2->y += f * (v02.y * t01.x - v01.y * t02.x);
                           tan2->z += f * (v02.z * t01.x - v01.z * t02.x);
                        }
                     }
                  }
               }
            }
         }
         // NOTE: Here we're currently making the assumption that the primitives are in indices mode (vertexRange = false)
         for(c = 0; c<nPrimitives; c++)
         {
            int i;
            PrimitiveSingle * primitive = &primitives[c];

            Plane plane;
            Vector3Df planeNormal;
            plane.FromPointsf(vertices[primitive->indices[2]],
                              vertices[primitive->indices[1]],
                              vertices[primitive->indices[0]]);
            planeNormal = { (float) plane.normal.x, (float) plane.normal.y, (float) plane.normal.z };

            if(primitive->material.flags.doubleSided && plane.d < 0)
            {
               planeNormal.x *= -1;
               planeNormal.y *= -1;
               planeNormal.z *= -1;
            }

            for(i = 0; i<primitive->nIndices; i++)
            {
               uint ix = primitive->indices[i];
               normals[ix].Add(normals[ix], planeNormal);
               numShared[ix]++;
            }
         }

         for(c = 0; c<nVertices; c++)
         {
            float s = (float)(1.0 / weightSum[c]); // numShared[c]
            Vector3Df * n = &normals[c];
            n->Scale(n, s), n->Normalize(n);
            if(tangents)
            {
               Vector3Df * t1 = &tangents[2*c], * t2 = &tangents[2*c+1];
               t1->Scale(t1, s), t1->Normalize(t1);
               t2->Scale(t2, s), t2->Normalize(t2);
            }
         }

#ifdef NORMALS_MERGE_VERTICES
         for(i = 0; i < nVertices; i++)
         {
            uint ix = ixMap[i];
            normals[i] = normals[ix];
         }
         delete ixMap;
         delete vMap;
#endif

         delete numShared;
         delete weightSum;
         Unlock({ normals = true, tangents = true });
      }
   }


   void ApplyMaterial(Material material)
   {
      if(this)
      {
         int c;
         PrimitiveGroup group;
         for(group = groups.first; group; group = group.next)
            group.material = material;
         for(c = 0; c<nPrimitives; c++)
            primitives[c].material = material;
      }
   }

   bool UnapplyTranslucency(Object object)
   {
      bool result = false;
      if(this)
      {
         int c;

         // Merge non translucent primitives into groups
         for(c = 0; c<nPrimitives; )
         {
            PrimitiveSingle * primitive = &primitives[c];
            Material material = (primitive->material || !object) ? primitive->material : object.material;
            if(true) //!material || !(material.flags.translucent))
            {
               int t;
               PrimitiveGroup group;
               int nIndices = primitive->nIndices;
               for(t = c+1; t<nPrimitives; t++)
               {
                  PrimitiveSingle * prim = &primitives[t];
                  if(prim->type == primitive->type && prim->material == primitive->material)
                     nIndices += prim->nIndices;
               }
               group = AddPrimitiveGroup(primitive->type, nIndices);
               if(group)
               {
                  bool use32 = group.type.indices32bit;
                  nIndices = 0;
                  group.material = material;
                  for(t = c; t<nPrimitives; t++)
                  {
                     primitive = &primitives[t];
                     if(group.type == primitive->type && group.material == primitive->material)
                     {
                        if(group.type.sharedIndices)
                           CopyBytesBy4(indices + group.baseIndex + nIndices, primitive->indices32, primitive->nIndices);
                        else if(use32)
                           CopyBytesBy4(group.indices32 + nIndices, primitive->indices32, primitive->nIndices);
                        else
                           CopyBytesBy2(group.indices + nIndices, primitive->indices, primitive->nIndices);
                        nIndices += primitive->nIndices;
                        CopyBytes(primitives + t, primitives + t + 1, (nPrimitives - t - 1) * sizeof(PrimitiveSingle));
                        nPrimitives--;
                        t--;
                     }
                  }
                  UnlockPrimitiveGroup(group);
               }
            }
            else
               c++;
         }
         primitives = renew primitives PrimitiveSingle[this.nPrimitives];
         result = true;
         if(object)
            object.flags.translucent = nPrimitives ? true : false;
      }
      return result;
   }

   bool ApplyTranslucency(Object object)
   {
      bool result = false;
      if(this)
      {
         PrimitiveGroup group, nextGroup;
         int c;

         // Merge non translucent primitives into groups
         for(c = 0; c<nPrimitives; )
         {
            PrimitiveSingle * primitive = &primitives[c];
            Material material = (primitive->material || !object) ? primitive->material : object.material;
            if(!material || !(material.flags.translucent))
            {
               int t;
               PrimitiveGroup group;
               int nIndices = primitive->nIndices;
               for(t = c+1; t<nPrimitives; t++)
               {
                  PrimitiveSingle * prim = &primitives[t];
                  if(prim->type == primitive->type && prim->material == primitive->material)
                     nIndices += prim->nIndices;
               }
               group = AddPrimitiveGroup(primitive->type, nIndices);
               if(group)
               {
                  bool use32 = primitive->type.indices32bit;
                  nIndices = 0;
                  group.material = material;
                  for(t = c; t<nPrimitives; t++)
                  {
                     primitive = &primitives[t];
                     if(group.type == primitive->type && group.material == primitive->material)
                     {
                        if(use32)
                           CopyBytesBy4(group.indices32 + nIndices, primitive->indices32, primitive->nIndices);
                        else
                           CopyBytesBy2(group.indices + nIndices, primitive->indices, primitive->nIndices);
                        nIndices += primitive->nIndices;
                        CopyBytes(primitives + t, primitives + t + 1, (nPrimitives - t - 1) * sizeof(PrimitiveSingle));
                        nPrimitives--;
                        t--;
                     }
                  }
                  UnlockPrimitiveGroup(group);
               }
            }
            else
               c++;
         }
         primitives = renew primitives PrimitiveSingle[this.nPrimitives];

         // Split translucent groups into primitives
         for(group = groups.first; group; group = nextGroup)
         {
            Material material = (group.material || !object) ? group.material : object.material;

            nextGroup = group.next;

            if(material && material.flags.translucent)
            {
               int nPrimitives = 0, c;
               int offset = 0;
               int strip = 0;
               int nPoints, nIndex;
               int groupCount = group.type.vertexRange ? group.nVertices : group.nIndices;
               if(!groupCount) continue;

               if(group.type.primitiveType == triangles)
                  nIndex = nPoints = 3;
               else if(group.type.primitiveType == quads)
                  nIndex = nPoints = 4;
               else if(group.type.primitiveType == triFan || group.type.primitiveType == triStrip)
               {
                  offset = 2;
                  nIndex = 1;
                  nPoints = 3;
               }
               else
                  continue;

               nPrimitives += (groupCount - offset) / nIndex;

               primitives = renew primitives PrimitiveSingle[this.nPrimitives + nPrimitives];

               if(group.type.indices32bit)
               {
                  for(c = offset; c<groupCount; c+= nIndex)
                  {
                     PrimitiveSingle * primitive = &primitives[this.nPrimitives++];

                     if(AllocatePrimitive(primitive, group.type & ~PrimitiveGroupType { vertexRange = true }, nPoints))
                     {
                        if(group.type.vertexRange)
                        {
                           if(group.type.primitiveType == triangles || group.type.primitiveType == quads)
                           {
                              primitive->indices32[0] = (uint32)(group.first + c);
                              primitive->indices32[1] = (uint32)(group.first + c+1);
                              primitive->indices32[2] = (uint32)(group.first + c+2);
                           }
                           if(group.type.primitiveType == quads)
                              primitive->indices32[3] = (uint32)(group.first + c+3);

                           if(group.type.primitiveType == triFan)
                           {
                              primitive->indices32[0] = (uint32)group.first;
                              primitive->indices32[1] = (uint32)(group.first + c-1);
                              primitive->indices32[2] = (uint32)(group.first + c);
                           }
                           else if(group.type.primitiveType == triStrip)
                           {
                              primitive->indices32[0] = (uint32)(group.first + c-1-strip);
                              primitive->indices32[1] = (uint32)(group.first + c-2+strip);
                              primitive->indices32[2] = (uint32)(group.first + c);
                              strip ^= 1;
                           }
                        }
                        else
                        {
                           uint32 * indices32 = group.type.sharedIndices ? indices + group.baseIndex : group.indices32;
                           if(group.type.primitiveType == triangles || group.type.primitiveType == quads)
                              CopyBytesBy4(primitive->indices32, indices32 + c, nIndex);

                           if(group.type.primitiveType == triFan)
                           {
                              primitive->indices32[0] = indices32[0];
                              primitive->indices32[1] = indices32[c-1];
                              primitive->indices32[2] = indices32[c];
                           }
                           else if(group.type.primitiveType == triStrip)
                           {
                              primitive->indices32[0] = indices32[c-1-strip];
                              primitive->indices32[1] = indices32[c-2+strip];
                              primitive->indices32[2] = indices32[c];
                              strip ^= 1;
                           }
                        }
                        primitive->material = group.material;

                        primitive->plane.FromPointsf(
                           vertices[primitive->indices32[2]],
                           vertices[primitive->indices32[1]],
                           vertices[primitive->indices32[0]]);

                        primitive->middle.Add(vertices[primitive->indices32[0]], vertices[primitive->indices32[1]]);
                        primitive->middle.Add(primitive->middle, vertices[primitive->indices32[2]]);
                        if(group.type == quads)
                           primitive->middle.Add(primitive->middle, vertices[primitive->indices32[3]]);
                        primitive->middle.x /= nPoints;
                        primitive->middle.y /= nPoints;
                        primitive->middle.z /= nPoints;

                        UnlockPrimitive(primitive);
                     }
                  }
               }
               else
               {
                  for(c = offset; c<groupCount; c+= nIndex)
                  {
                     PrimitiveSingle * primitive = &primitives[this.nPrimitives++];

                     if(AllocatePrimitive(primitive, group.type & ~ PrimitiveGroupType { vertexRange = true }, nPoints))
                     {
                        if(group.type.vertexRange)
                        {
                           if(group.type.primitiveType == triangles || group.type.primitiveType == quads)
                           {
                              primitive->indices[0] = (uint16)(group.first + c);
                              primitive->indices[1] = (uint16)(group.first + c+1);
                              primitive->indices[2] = (uint16)(group.first + c+2);
                           }
                           if(group.type.primitiveType == quads)
                              primitive->indices[3] = (uint16)(group.first + c+3);

                           if(group.type.primitiveType == triFan)
                           {
                              primitive->indices[0] = (uint16)group.first;
                              primitive->indices[1] = (uint16)(group.first + c-1);
                              primitive->indices[2] = (uint16)(group.first + c);
                           }
                           else if(group.type.primitiveType == triStrip)
                           {
                              primitive->indices[0] = (uint16)(group.first + c-1-strip);
                              primitive->indices[1] = (uint16)(group.first + c-2+strip);
                              primitive->indices[2] = (uint16)(group.first + c);
                              strip ^= 1;
                           }
                        }
                        else
                        {
                           if(group.type.primitiveType == triangles || group.type.primitiveType == quads)
                              CopyBytesBy2(primitive->indices, group.indices + c, nIndex);

                           if(group.type.primitiveType == triFan)
                           {
                              primitive->indices[0] = group.indices[0];
                              primitive->indices[1] = group.indices[c-1];
                              primitive->indices[2] = group.indices[c];
                           }
                           else if(group.type.primitiveType == triStrip)
                           {
                              primitive->indices[0] = group.indices[c-1-strip];
                              primitive->indices[1] = group.indices[c-2+strip];
                              primitive->indices[2] = group.indices[c];
                              strip ^= 1;
                           }
                        }
                        primitive->material = group.material;

                        primitive->plane.FromPointsf(
                           vertices[primitive->indices[2]],
                           vertices[primitive->indices[1]],
                           vertices[primitive->indices[0]]);

                        primitive->middle.Add(vertices[primitive->indices[0]], vertices[primitive->indices[1]]);
                        primitive->middle.Add(primitive->middle, vertices[primitive->indices[2]]);
                        if(group.type == quads)
                           primitive->middle.Add(primitive->middle, vertices[primitive->indices[3]]);
                        primitive->middle.x /= nPoints;
                        primitive->middle.y /= nPoints;
                        primitive->middle.z /= nPoints;

                        UnlockPrimitive(primitive);
                     }
                  }
               }
               FreePrimitiveGroup(group);
            }
         }
         result = true;

         if(object)
            object.flags.translucent = nPrimitives ? true : false;
      }
      return result;
   }

   void * GetData()
   {
      return data;
   }

   void SetData(void * value)
   {
      data = value;
   }

#if !defined(ECERE_NOGL)
   bool Upload(DisplaySystem displaySystem, bool uploadTextures, GLMB mab, GLMB meab, int nAT, GLArrayTexture * mAT)
   {
      bool result = false;
      PrimitiveGroup g;
      bool clearData = false;

      if(!this.displaySystem)
      {
         driver = displaySystem.driver;
         this.displaySystem = displaySystem;
         clearData = true;
      }
      this.mab = mab;
      this.meab = meab;

      Unlock(0);

      delete vertices;
      delete texCoords;
      delete normals;
      delete colors;
      delete lightVectors;

      for(g = groups.first; g; g = g.next)
      {
         Material mat = g.material;
         if(!g.type.vertexRange)
         {
            if(clearData)
               g.data = null;
            UnlockPrimitiveGroup(g);
         }
         if(mat && uploadTextures)
         {
            if(nAT && mAT != null)
            {
               int i;
               for(i = 0; i < Min(1, nAT); i++)
               {
                  Bitmap bitmap = i == 0 ? mat.baseMap : null;
                  if(bitmap && bitmap.displaySystem != displaySystem)
                  {
                     Bitmap convBitmap = bitmap;
                     GLArrayTexture * at = &mAT[i];
                     if(convBitmap.pixelFormat != pixelFormatRGBAGL && convBitmap.pixelFormat != pixelFormatETC2RGBA8)
                        convBitmap = bitmap.ProcessDD((bool)2, 0, false, 16384, false); //oglSystem.maxTextureSize, !capabilities.nonPow2Textures);
                     if(convBitmap)
                     {
                        if(!at->texture)
                        {
#if !defined(__EMSCRIPTEN__) && ((!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3))
                           bool sRGB2Linear = bitmap.sRGB2Linear;
                           int internalFormat = convBitmap.pixelFormat == pixelFormatETC2RGBA8 ?
                              (sRGB2Linear ? GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC : GL_COMPRESSED_RGBA8_ETC2_EAC) :
                              (sRGB2Linear ? GL_SRGB8_ALPHA8 : GL_RGBA8);
                  #else
                           int internalFormat = convBitmap.pixelFormat == pixelFormatETC2RGBA8 ? 0 : GL_RGBA;
#endif

                           // TOCHECK: Shouldn't the overall bitmap width be set?
                           // Bitmap bmp = convBitmap.bitmaps && convBitmap.numMipMaps ? convBitmap.bitmaps[0] : convBitmap;
                           at->_init(convBitmap.numMipMaps ? convBitmap.numMipMaps : 1,
                              at->width  ? at->width  : MODELS_TEXTUREARRAY_SIZE,
                              at->height ? at->height : MODELS_TEXTUREARRAY_SIZE,
                              at->numLayers ? at->numLayers : 64,
                              internalFormat,
                              false);
                        }

                        if(convBitmap.bitmaps)
                        {
                           int layer = at->allocateLayer(0);
                           int j;
                           int numLevels = at->numLevels;
                           int skipLevel = Max(0, convBitmap.numMipMaps - numLevels);
                           if(layer != -1)
                           {
                              for(j = 0; j < convBitmap.numMipMaps; j++)
                              {
                                 Bitmap bmp = convBitmap.bitmaps[j];
                                 if(bmp)
                                 {
                                    int level = j - skipLevel;
                                    if(level >= 0)
                                    {
                                       if(convBitmap /*bmp*/.pixelFormat == pixelFormatETC2RGBA8)
                                          at->setLayerCompressed(level, 0, 0, layer, bmp.picture, bmp.sizeBytes, 0);
                                       else
                                          at->setLayer(level, 0, 0, layer, bmp.picture, 0);
                                    }
#ifdef ETC2_COMPRESS
                                    if(convBitmap.pixelFormat == pixelFormatETC2RGBA8)
                                    {
                                       etc2Free(bmp.picture);
                                       bmp.picture = null;
                                    }
                                    else
#endif
                                       delete bmp.picture;
                                    delete bmp;
                                    convBitmap.bitmaps[j] = null; // TOCHECK: ?
                                 }
                              }
                              delete convBitmap.bitmaps;

                              bitmap.displaySystem = displaySystem;
                              bitmap.driver = displaySystem.driver;
                              bitmap.driverData = (void *)(intptr)layer;   // TOFIX: *not* a texture in this case! Don't free as one.
                           }
                        }
                     }

                     if(convBitmap != bitmap)
                        delete convBitmap;
                  }
               }
            }
            else if(mat.baseMap && mat.baseMap.displaySystem != displaySystem)
               mat.baseMap.MakeMipMaps(displaySystem);
         }
         delete g.indices;
      }
      result = true;
      return result;
   }
#endif

private:

   void SetMinMaxRadius(void)
   {
      int c;

      float xRadius, yRadius, zRadius;
      float * v = (float *)vertices;
      int increment = flags.interleaved ? 8 : 3;

      if(!v) return;

      min = { MAXFLOAT, MAXFLOAT, MAXFLOAT };
      max = {-MAXFLOAT,-MAXFLOAT,-MAXFLOAT };

      for(c = 0; c<nVertices; c++, v += increment)
      {
         float x = v[0], y = v[1], z = v[2];
         if(x.isNan || y.isNan || z.isNan);
         else if(x > 1E20 || x < -1E20 || y > 1E20 || y < -1E20 || z > 1E20 || z < -1E20);
         else
         {
            min.x = Min(min.x, x);
            min.y = Min(min.y, y);
            min.z = Min(min.z, z);
            max.x = Max(max.x, x);
            max.y = Max(max.y, y);
            max.z = Max(max.z, z);
         }
      }
      xRadius = Max(max.x, -min.x);
      yRadius = Max(max.y, -min.y);
      zRadius = Max(max.z, -min.z);

      radius = Max(xRadius, yRadius);
      radius = Max(radius, zRadius);
   }

   void DoubleSided(bool flag)
   {
      if(this)
      {
         PrimitiveGroup group;
         int c;
         for(group = groups.first; group; group = group.next)
         {
            if(group.material)
            {
               group.material.flags.doubleSided = flag;
            }
         }
         for(c = 0; c<nPrimitives; c++)
         {
            PrimitiveSingle * primitive = &primitives[c];
            if(primitive->material)
            {
               primitive->material.flags.doubleSided = flag;
            }
         }
      }
   }

   MeshFeatures flags;
   int nVertices;
   Vector3Df * vertices;
   Vector3Df * normals;
   Vector3Df * tangents;
   Pointf * texCoords;
   ColorRGBAf * colors;
   ColorRGB * lightVectors;
   public OldList groups;  // To be accessible faster...
   int nPrimitives;
   PrimitiveSingle * primitives;
   Vector3Df min, max;
   float radius;
   CubeMap normMap;

   // Private Data
   DisplaySystem displaySystem;
   subclass(DisplayDriver) driver;
   void * data;
#if !defined(ECERE_NOGL)
   GLMB mab, meab;
#endif
   uint baseVertex;
   Array<MeshPart> parts;

   // Mesh-wide indices
   uint * indices;
   int baseIndex, nIndices;
};

void computeNormalWeights(int n, Vector3Df * vertices, uint * indices, bool ix32Bit, int base, double * weights, Vector3D * edges, Vector3D * rEdges)
{
   int i;
   for(i = 0; i < n; i++)
   {
      uint ix0 = i, ix1 = (i + 1) % n;
      Vector3Df * p0, *p1;
      if(indices)
      {
         if(ix32Bit)
            ix0 = indices[base+ix0], ix1 = indices[base+ix1];
         else
            ix0 = ((uint16*)indices)[base+ix0], ix1 = ((uint16*)indices)[base+ix1];
      }
      p0 = &vertices[ix0], p1 = &vertices[ix1];
      edges[i] = { p1->x - p0->x, p1->y - p0->y, p1->z - p0->z };
      edges[i].Normalize(edges[i]);
      rEdges[i].Scale(edges[i], -1);
   }
   for(i = 0; i < n; i++)
      weights[i] = acos(Min(1.0, Max(-1.0, edges[i].DotProduct(rEdges[i ? i-1 : n-1])))) / ((n-2) * Pi);
}

#ifdef NORMALS_MERGE_VERTICES
struct SharedVertex
{
   Vector3Df v, n;
   int count;

   int OnCompare(SharedVertex b)
   {
      float dx = v.x - b.v.x;
      float dy = v.y - b.v.y;
      float dz = v.z - b.v.z;
      double dot;

      if(dx > 0.00001) return 1;
      if(dx <-0.00001) return -1;
      if(dy > 0.00001) return 1;
      if(dy <-0.00001) return -1;
      if(dz > 0.00001) return 1;
      if(dz <-0.00001) return -1;

      dot = n.DotProduct(b.n);

      if(dot > 0.40)
         return 0;
      if(n.x > b.n.x) return  1;
      if(n.x < b.n.x) return -1;
      if(n.y > b.n.y) return  1;
      if(n.y < b.n.y) return -1;
      if(n.z > b.n.z) return  1;
      if(n.z < b.n.z) return -1;

      return 0;
   }
};

static uint resolveIndex(uint index, Map<SharedVertex, uint> vMap, Map<uint, uint> ixMap, Vector3Df vertex, Plane plane)
{
   uint result;
   //return index;
   SharedVertex v { vertex, { (float)plane.normal.x, (float)plane.normal.y, (float)plane.normal.z }, 1 };
   MapIterator<SharedVertex, uint> it { map = vMap };
   if(it.Index(v, true))
   {
      SharedVertex k = it.key;
      result = it.data;
      // Update to the average...
      it.Remove();
      k.n.Normalize(
      {
         (k.n.x * k.count + v.n.x)/(k.count+1),
         (k.n.y * k.count + v.n.y)/(k.count+1),
         (k.n.z * k.count + v.n.z)/(k.count+1)
      });
      k.count++;
      vMap[k] = result;
   }
   else
      it.data = result = index;
   ixMap[index] = result;
   return result;
}
#endif
