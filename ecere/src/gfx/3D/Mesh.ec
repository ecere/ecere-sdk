namespace gfx3D;

import "Display"

public class MeshFeatures { public bool vertices:1, normals:1, texCoords1:1, texCoords2:1, doubleNormals:1, doubleVertices:1, colors:1; };
public class PrimitiveGroupType { public: RenderPrimitiveType primitiveType:8; bool vertexRange:1, indices32bit:1; };
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
};
public class MaterialFlags { public bool doubleSided:1, translucent:1, tile:1, noFog:1, singleSideLight:1; };
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
   Bitmap envMap;
   MaterialFlags flags;
   float uScale, vScale;

   void Free()
   {
      delete name;
   }
};

public class PrimitiveGroup : struct
{
public:
   PrimitiveGroup prev, next;
   PrimitiveGroupType type;
   union
   {
      struct { union { uint16 * indices; uint * indices32; }; int nIndices; };
      struct { int first, nVertices; };
   };
   Material material;
private:
   void * data;
};

public struct PrimitiveSingle
{
public:
   PrimitiveGroupType type;
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

public class Mesh : struct
{
public:
   property Pointf * texCoords { get { return texCoords; } set { texCoords = value; } };
   property int nVertices { get { return nVertices; } set { nVertices = value; } };
   property Vector3Df * vertices { get { return vertices; } set { vertices = value; } };
   property Vector3Df * normals { get { return normals; } set { normals = value; } };
   property ColorRGBAf * colors { get { return colors; } set { colors = value; } };
   property OldList groups { get { value = groups; } };
   property MeshFeatures flags { get { return flags; } set { flags = value; } };

   void Free(MeshFeatures what)
   {
      if(this)
      {
         DisplaySystem displaySystem = this.displaySystem;
         PrimitiveGroup group;
         if(!what)
         {
            int c;

            flags = 0;
            if(driver)
               driver.FreeMesh(displaySystem, this);
            for(;(group = groups.first);)
               FreePrimitiveGroup(group);

            for(c = 0; c<nPrimitives; c++)
            {
               if(primitives[c].data)
                  driver.FreeIndices(displaySystem, primitives[c].data);
            }

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
      }
   }

   bool Allocate(MeshFeatures what, int nVertices, DisplaySystem displaySystem)
   {
      bool result = false;
      if((!nVertices || nVertices == nVertices) && (!this.displaySystem || this.displaySystem == displaySystem))
      {
         flags |= what;
         this.nVertices = nVertices;
         driver = displaySystem ? displaySystem.driver : (subclass(DisplayDriver))class(LFBDisplayDriver);
         if(driver.AllocateMesh == DisplayDriver::AllocateMesh) driver = (subclass(DisplayDriver))class(LFBDisplayDriver);
         if(driver.AllocateMesh(displaySystem, this))
         {
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
            driver.FreeIndices(displaySystem, group.data);
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
            if(driver)
            {
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
         if(group.data)
            group.indices = driver.LockIndices(displaySystem, group.data);
         if(group.indices || group.type.vertexRange)
            result = true;
      }
      return result;
   }

   void UnlockPrimitiveGroup(PrimitiveGroup group)
   {
      if(this && group && group.data)
      {
         driver.UnlockIndices(displaySystem, group.data, group.type.indices32bit, group.nIndices);
         //group.indices = null;
      }
   }

   void FreePrimitive(PrimitiveSingle primitive)
   {
      if(this && primitive)
      {
         if(primitive.data)
            driver.FreeIndices(displaySystem, primitive.data);
         primitive.data = null;
      }
   }

   bool AllocatePrimitive(PrimitiveSingle primitive, PrimitiveGroupType flags, int nIndices)
   {
      bool result = false;
      if(this && primitive)
      {
         primitive.type = flags;
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
         driver.UnlockIndices(this.displaySystem, primitive.data, primitive.type.indices32bit, primitive.nIndices);
         //primitive.indices = null;
      }
   }

   bool LockPrimitive(PrimitiveSingle primitive)
   {
      bool result = false;
      if(this && primitive)
      {
         primitive.indices = driver.LockIndices(displaySystem, primitive.data);
         if(primitive.indices)
            result = true;
      }
      return result;
   }

   void ComputeNormals(void)
   {
      int c;
      int * numShared = new0 int[nVertices];
      PrimitiveGroup group;

      if(Allocate({ normals = true }, nVertices, displaySystem))
      {
         FillBytes(normals, 0, nVertices * sizeof(Vector3Df));
         for(group = groups.first; group; group = group.next)
         {
            int c;
            int offset = 0;
            int strip = 0;
            int nPoints, nIndex;
            uint16 * indices16 = group.indices;
            uint32 * indices32 = group.indices;
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
               int i;
               Plane plane;
               Vector3Df planeNormal;

               if(group.type.primitiveType == triFan)
               {
                  plane.FromPointsf(vertices[group.indices[0]],
                                   vertices[group.indices[c]],
                                   vertices[group.indices[c-1]]);
                  planeNormal = { (float) plane.normal.x, (float) plane.normal.y, (float) plane.normal.z };

                  normals[group.indices[0]].Add(normals[group.indices[0]], planeNormal);
                  numShared[group.indices[0]]++;
                  normals[group.indices[c-1]].Add(normals[group.indices[c-1]], planeNormal);
                  numShared[group.indices[c-1]]++;
                  normals[group.indices[c]].Add(normals[group.indices[c]], planeNormal);
                  numShared[group.indices[c]]++;
               }
               else if(group.type.primitiveType == triStrip || group.type.primitiveType == quadStrip)
               {
                  plane.FromPointsf(vertices[group.indices[c-1-strip]],
                                   vertices[group.indices[c-2+strip]],
                                   vertices[group.indices[c]]);
                  planeNormal = { (float) plane.normal.x, (float) plane.normal.y, (float) plane.normal.z };

                  normals[group.indices[c-1-strip]].Add(normals[group.indices[c-1-strip]], planeNormal);
                  numShared[group.indices[c-1-strip]]++;
                  normals[group.indices[c-2+strip]].Add(normals[group.indices[c-2+strip]], planeNormal);
                  numShared[group.indices[c-2+strip]]++;
                  normals[group.indices[c]].Add(normals[group.indices[c]], planeNormal);
                  numShared[group.indices[c]]++;

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
                        normals[i].Add(normals[i], planeNormal);
                        numShared[i] ++;
                     }
                  }
                  else
                  {
                     plane.FromPointsf(vertices[i32bit ? indices32[c+2] : indices16[c+2]],
                                      vertices[i32bit ? indices32[c+1] : indices16[c+1]],
                                      vertices[i32bit ? indices32[c] : indices16[c]]);
                     planeNormal = { (float) plane.normal.x, (float) plane.normal.y, (float) plane.normal.z };

                     for(i = c; i<c+nIndex; i++)
                     {
                        int index = i32bit ? indices32[i] : indices16[i];
                        normals[index].Add(normals[index], planeNormal);
                        numShared[index] ++;
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
               normals[primitive->indices[i]].Add(normals[primitive->indices[i]], planeNormal);
               numShared[primitive->indices[i]] ++;
            }
         }

         for(c = 0; c<nVertices; c++)
         {
            normals[c].Scale(normals[c], 1.0f / numShared[c]);
            normals[c].Normalize(normals[c]);
         }
         delete numShared;
         Unlock({ normals = true });
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
                  nIndices = 0;
                  group.material = material;
                  for(t = c; t<nPrimitives; t++)
                  {
                     primitive = &primitives[t];
                     if(group.type == primitive->type && group.material == primitive->material)
                     {
                        CopyBytesBy2(group.indices + nIndices,primitive->indices,primitive->nIndices);
                        nIndices +=primitive->nIndices;
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

               for(c = offset; c<groupCount; c+= nIndex)
               {
                  PrimitiveSingle * primitive = &primitives[this.nPrimitives++];

                  if(AllocatePrimitive(primitive, group.type.primitiveType, nPoints))
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
               FreePrimitiveGroup(group);
            }
         }
         result = true;

         if(object)
            object.flags.translucent = nPrimitives ? true : false;
      }
      return result;
   }

private:

   void SetMinMaxRadius(void)
   {
      int c;

      float xRadius, yRadius, zRadius;

      min = { MAXFLOAT, MAXFLOAT, MAXFLOAT };
      max = {-MAXFLOAT,-MAXFLOAT,-MAXFLOAT };

      for(c = 0; c<nVertices; c++)
      {
         float x = vertices[c].x, y = vertices[c].y, z = vertices[c].z;
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
   Pointf * texCoords;
   ColorRGBAf * colors;
   OldList groups;
   int nPrimitives;
   PrimitiveSingle * primitives;
   Vector3Df min, max;
   float radius;

   // Private Data
   DisplaySystem displaySystem;
   subclass(DisplayDriver) driver;
   void * data;
};
