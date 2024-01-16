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
   bool bones:1;
};

public class PrimitiveGroupType : uint32
{
public:
   RenderPrimitiveType primitiveType:8;
   bool vertexRange:1, indices32bit:1, sharedIndices:1, hide:1;
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
    bool setupTextures:1;     // NOTE: This is a status flag and should probably be elsewhere...
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
   int baseIndexMesh;   // Offset into Mesh::indices (type.sharedIndices is set)
   int baseIndexBuffer; // Offset into GLEAB (inclusive of Mesh::baseIndex)
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
   int baseIndexMesh;   // Offset into Mesh::indices (type.sharedIndices is set)
   int baseIndexBuffer; // Offset into index buffer (inclusive of Mesh::baseIndex)
   union
   {
      struct { union { uint16 * indices; uint * indices32; }; int nIndices; };
      struct { int first, nVertices; };
   };
   Material material;

// FIXME: An array of PrimitiveSingle is broken with private:
   void * data;
   Vector3Df middle;
   Plane plane;
};

public struct SkinBone
{
   // data:
   String name;
   Matrix invBindMatrix;
   // calculated:
   Matrix bsInvBindMatrix;
   Object object;
   Vector3Df min, max; // Bounding Box

   Transform origTransform;
};

public define MAX_BONES = 10;
public define NO_BONE = 255;

public struct SkinVert
{
   byte bones  [MAX_BONES];
   byte weights[MAX_BONES];
};

public class MeshSkin
{
public:
   Matrix bindShapeMatrix;          // data
   Array<SkinBone> bones { };       // data (count: number of bones)
   Array<SkinVert> skinVerts { };   // data (count: number of mesh vertices - number of duplicate vertices)
   Matrix invShape;                 // calculated
   bool bsIsIdentity;               // calculated

private:
   Vector3Df * vertices, * normals, * tangents;

   ~MeshSkin()
   {
      delete vertices;
      delete normals;
      delete tangents;
   }
};

public union Matrixf
{
   float m[4][4];
   float array[16];

   property Matrix
   {
      set
      {
         int i;
         for(i = 0; i < 16; i++)
            array[i] = (float)value.array[i];
      }
      get
      {
         int i;
         for(i = 0; i < 16; i++)
            value.array[i] = (double)array[i];
      }
   }

   void fromMatrix(Matrix m)
   {
      int i;
      for(i = 0; i < 16; i++)
         array[i] = (float)m.array[i];
   }

   void Identity()
   {
      m[0][0] = 1;   m[0][1] = 0;   m[0][2] = 0;   m[0][3] = 0;
      m[1][0] = 0;   m[1][1] = 1;   m[1][2] = 0;   m[1][3] = 0;
      m[2][0] = 0;   m[2][1] = 0;   m[2][2] = 1;   m[2][3] = 0;
      m[3][0] = 0;   m[3][1] = 0;   m[3][2] = 0;   m[3][3] = 1;
   }
};

static inline void inlineMultMatrix(Vector3Df dest, const Vector3Df source, const Matrixf matrix)
{
   dest.x = (float)(source.x * matrix.m[0][0] + source.y * matrix.m[1][0] + source.z * matrix.m[2][0] + matrix.m[3][0]);
   dest.y = (float)(source.x * matrix.m[0][1] + source.y * matrix.m[1][1] + source.z * matrix.m[2][1] + matrix.m[3][1]);
   dest.z = (float)(source.x * matrix.m[0][2] + source.y * matrix.m[1][2] + source.z * matrix.m[2][2] + matrix.m[3][2]);
}


public struct MeshPart
{
   uint64 id;
   uint start;
   uint count;
};

public struct MeshMorph
{
   Mesh target;
   float weight;
   String name;
   bool updated;
   int firstV, lastV;

   void OnFree()
   {
      delete target; // For now, target is owned here
      delete name;
   }
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
   property MeshSkin skin { get { return skin; } set { skin = value; } };
   property Array<int> dupVerts
   {
      set { dupVerts = value; }
      get { return dupVerts; }
   };
   property Array<MeshMorph> morphs
   {
      set { if(morphs) morphs.Free(), delete morphs; morphs = value; }
      get { return morphs; }
   }
   property Mesh unmorphedMesh
   {
      set { delete unmorphedMesh; unmorphedMesh = value; }
      get { return unmorphedMesh; }
   }
   property PrimitiveSingle * translucentPrimitives { get { return primitives; } };
   property int nTranslucentPrimitives { get { return nPrimitives; } };

   #define GPU_SKIN

   void CombineMorphs(Array<bool> combined)
   {
      Array<MeshMorph> morphs = this.morphs;
      if(morphs && morphs.count)
      {
         int nVertices = this.nVertices;
         int dvCount = dupVerts ? dupVerts.count : 0;
         int nVerticesNoDup = nVertices - dvCount;
         int i;
         int nMorphs = morphs.count, m;
         Vector3Df * unmVertices;
         int combinedIndex = -1;

         if(!unmorphedMesh)
         {
            unmorphedMesh = Copy();

            for(m = 0; m < morphs.count; m++)
            {
               MeshMorph * morph = &morphs[m];
               morph->firstV = -1;
               morph->lastV = -1;
            }
         }

         unmVertices = unmorphedMesh.vertices;

         for(m = 0; m < nMorphs; m++)
         {
            MeshMorph * morph = &morphs[m];
            __attribute__((unused)) const String n = morph->name;
            float w = morph->weight;
            Mesh target = morph->target;
            if(w && target && combined[m])
            {
               int nv = Min(nVerticesNoDup, target.nVertices);
               const Vector3Df * sv = unmVertices;
               const Vector3Df * tv = target.vertices;
               Vector3Df * cv;
               if(combinedIndex == -1)
               {
                  combinedIndex = m;
                  delete morph->name;
                  morph->name = CopyString("[Combined Morph]");
                  morph->weight = 1.0;
                  cv = target.vertices;

                  for(i = 0; i < nv; i++, sv++, tv++, cv++)
                  {
                     float dx = (tv->x - sv->x) * w;
                     float dy = (tv->y - sv->y) * w;
                     float dz = (tv->z - sv->z) * w;

                     cv->x = dx + sv->x,
                     cv->y = dy + sv->y,
                     cv->z = dz + sv->z;
                  }
               }
               else
               {
                  cv = morphs[combinedIndex].target.vertices;
                  for(i = 0; i < nv; i++, sv++, tv++, cv++)
                  {
                     float dx = (tv->x - sv->x) * w;
                     float dy = (tv->y - sv->y) * w;
                     float dz = (tv->z - sv->z) * w;

                     cv->x += dx, cv->y += dy, cv->z += dz;
                  }
                  morph->weight = 0;
                  morph->target = null;
               }
            }
         }
      }
   }

   void ApplyMorphs(bool recomputeNormals)
   {
      Array<MeshMorph> morphs = this.morphs;
      int nVertices = this.nVertices;
      Vector3Df * vertices = this.vertices;
      int dvCount = dupVerts ? dupVerts.count : 0;
      int nVerticesNoDup = nVertices - dvCount;

      if(morphs && !unmorphedMesh)
         unmorphedMesh = Copy();

      if(morphs)
      {
         int m;

         for(m = 0; m < morphs.count; m++)
         {
            MeshMorph * morph = &morphs[m];
            if(morph->firstV == -1 && morph->target)
            {
               Mesh target = morph->target;
               Vector3Df * sv = unmorphedMesh.vertices;
               Vector3Df * tv = target.vertices;
               int i;
               int first = MAXINT;
               int last = -1;
               int tDVCount = target.dupVerts ? target.dupVerts.count : 0;

               for(i = 0; i < target.nVertices - tDVCount; i++, sv++, tv++)
               {
                  float dx = (tv->x - sv->x);
                  float dy = (tv->y - sv->y);
                  float dz = (tv->z - sv->z);

                  if(first == MAXINT)
                  {
                     if(dx || dy || dz)
                        first = i, last = i;
                  }
                  else if(dx || dy || dz)
                     last = i;
               }

               morph->firstV = first;
               morph->lastV = last;
            }
         }
      }
      if(morphs)
      {
         int i;
         int nMorphs = morphs.count, m;
         Vector3Df * unmVertices = unmorphedMesh.vertices;
         // TODO: apply same computed delta approach to tangents; light vectors?
         Vector3Df * unmNormals = unmorphedMesh.normals, * computedUnmorphedNormals = this.computedUnmorphedNormals;
         if(!recomputeNormals)
         {
            bool updated = false;
            for(m = 0; m < nMorphs; m++)
               if(morphs[m].updated && morphs[m].target)
               {
                  updated = true;
                  break;
               }
            if(!updated) return;
         }

         if(recomputeNormals && !computedUnmorphedNormals)
         {
            Vector3Df * origUNMNormals = unmNormals;

            computedUnmorphedNormals = new Vector3Df[unmorphedMesh.nVertices];
            this.computedUnmorphedNormals = computedUnmorphedNormals;
            unmorphedMesh.normals = computedUnmorphedNormals;
            unmorphedMesh.ComputeNormals3(true, true, false);
            unmorphedMesh.normals = origUNMNormals;
         }

         memcpy(vertices, unmVertices, nVerticesNoDup * sizeof(Vector3Df));

         for(m = 0; m < nMorphs; m++)
         {
            MeshMorph * morph = &morphs[m];
            __attribute__((unused)) const String n = morph->name;
            float w = morph->weight;
            Mesh target = morph->target;

            morph->updated = false;
            if(w && target)
            {
               int fv = morph->firstV == -1 ? 0 : morph->firstV;
               int lv = morph->lastV == -1 ? Min(target.nVertices, nVerticesNoDup) : morph->lastV;
               const Vector3Df * sv = unmVertices + fv, * tv = target.vertices + fv;
               Vector3Df * v = vertices + fv;

               for(i = morph->firstV; i <= lv; i++, v++, sv++, tv++)
               {
                  float dx = (tv->x - sv->x) * w;
                  float dy = (tv->y - sv->y) * w;
                  float dz = (tv->z - sv->z) * w;
                  v->x += dx, v->y += dy, v->z += dz;
               }
            }
         }

         if(dupVerts)
         {
            Vector3Df * v = vertices + nVerticesNoDup;
            for(i = 0; i < dvCount; i++, v++)
            {
               int dv = dupVerts[i];
               *v = vertices[dv];
            }
         }

         if(recomputeNormals)
         {
            ComputeNormals3(true, false /*true*/, false);

            // Re-orient original normals based on rotation of computed normals
            for(i = 0; i < nVertices; i++)
            {
               Vector3D axis;
               double len;
               Vector3Df normal1 = computedUnmorphedNormals[i], normal0 = normals[i];

               axis.CrossProduct(
                  { normal0.x, normal0.y, normal0.z },
                  { normal1.x, normal1.y, normal1.z });

               len = axis.length;
               if(len)
               {
                  double dot = normal0.DotProduct(normal1);
                  Degrees angle = atan2(len, dot);
                  Quaternion q;  // q is rotation between computed normals
                  axis.Scale(axis, 1.0 / len);
                  q.RotationAxis(axis, angle);
                  normals[i].MultQuaternion(unmNormals[i], q);
               }
            }
            if(dupVerts)
            {
               Vector3Df * n = normals + nVerticesNoDup;
               for(i = 0; i < dvCount; i++, n++)
               {
                  int dv = dupVerts[i];
                  *n = normals[dv];
               }
            }
            Unlock({ normals = true, vertices = true });
         }
         else
            Unlock({ vertices = true });
      }
   }

   void fixMorphSkin()
   {
      if(skin && skin.skinVerts.count + (dupVerts ? dupVerts.count : 0) == nVertices)
      {
         // Adjust bones position and inverse bind matrix for applied morphs
         SkinBone * skeletonBone = null;
         int i;
         for(i = 0; i < skin.bones.count; i++)
         {
            SkinBone * bone = &skin.bones[i];
            Object obj = bone->object;
            if(obj) // && obj.flags.skeleton)
            {
               skeletonBone = bone;
               break;
            }
         }

         if(skeletonBone)
            fixSkeletonBones(skeletonBone, i);

         flags.bones = false;
      }
   }

   void fixSkeletonBones(SkinBone * bone, int boneIx)
   {
      Object obj = bone->object, c;
      int nVertices = this.nVertices;
      Vector3Df * vertices = this.vertices;
      Vector3Df * unmVertices = unmorphedMesh.vertices;

      if(!bone->origTransform.scaling.x)
         bone->origTransform = obj.transform;

      obj.transform.position = bone->origTransform.position;

      bone->bsInvBindMatrix.Multiply(skin.bindShapeMatrix, bone->invBindMatrix);

      if(vertices)
      {
         float * v = (float *)vertices;
         int j;
         int increment = flags.interleaved ? 8 : 3;
         double tx = 0, ty = 0, tz = 0;
         int count = 0;
         double tw = 0;
         for(j = 0; j < nVertices; j++, v += increment)
         {
            int ix = (j < skin.skinVerts.count) ? j : dupVerts[j - skin.skinVerts.count];
            SkinVert * sv = &skin.skinVerts[ix];
            float w = 0;
            int b;
            for(b = 0; b < MAX_BONES; b++)
            {
               int bone = sv->bones[b];
               if(bone == boneIx)
               {
                  w = sv->weights[b] / 255.0f;
                  break;
               }
               else if(bone == NO_BONE)
                  break;
            }
            if(w)
            {
               float x = v[0], y = v[1], z = v[2];

               if(x.isNan || y.isNan || z.isNan);
               else if(x > 1E20 || x < -1E20 || y > 1E20 || y < -1E20 || z > 1E20 || z < -1E20);
               else
               {
                  Vector3Df m = *(Vector3Df *)v;
                  Vector3Df u = unmVertices[ix];

                  tx += (m.x - u.x) * w;
                  ty += (m.y - u.y) * w;
                  tz += (m.z - u.z) * w;
                  tw += w;
                  count++;
               }
            }
         }

         if(count)
         {
            int k;
            SkinBone * parentBone = null;
            Vector3D position = obj.transform.position;
            Vector3Df p, tp;
            Matrix pm;
            Object po;

            for(k = 0; k < skin.bones.count; k++)
            {
               SkinBone * b = &skin.bones[k];
               if(b->object == bone->object.parent)
               {
                  parentBone = b;
                  break;
               }
            }

            tx /= tw, ty /= tw, tz /= tw;

            bone->bsInvBindMatrix.m[3][0] -= tx;
            bone->bsInvBindMatrix.m[3][1] -= ty;
            bone->bsInvBindMatrix.m[3][2] -= tz;

            po = parentBone->object;
            pm.Identity();
            while(po)
            {
               Vector3D pos = po.transform.position;
               Vector3D oPos { };
               int i;

               for(i = 0; i < skin.bones.count; i++)
               {
                  SkinBone * bone = &skin.bones[i];
                  if(bone->object == po)
                  {
                     oPos = bone->origTransform.position;
                     break;
                  }
               }
               pm.Translate(oPos.x - pos.x, oPos.y - pos.y, oPos.z - pos.z);
               if(po.flags.skeleton)
                  break;
               po = po.parent;
            }

            p = { (float)tx, (float)ty, (float)tz };
            tp.MultMatrix(p, pm);
            position.x += tp.x, position.y += tp.y, position.z += tp.z;
            obj.transform.position = position;
            obj.UpdateTransform();
         }
      }

      for(c = obj.firstChild; c; c = c.next)
      {
         int i;
         SkinBone * bone = null;
         for(i = 0; i < skin.bones.count; i++)
         {
            SkinBone * b = &skin.bones[i];
            if(b->object == c)
            {
               bone = b;
               break;
            }
         }

         if(bone)
            fixSkeletonBones(bone, i);
      }
   }

   void ApplySkin()
   {
      MeshSkin skin = this.skin;
      if(skin && skin.skinVerts.count + (dupVerts ? dupVerts.count : 0) == nVertices)
      {
         Array<Matrixf> matBones { size = skin.bones.count };
         bool bsIdentity = skin.bsIsIdentity;
         int i;

         for(i = 0; i < skin.bones.count; i++)
         {
            SkinBone * bone = &skin.bones[i];
            Matrix m;

            if(bone->object)
               m.Multiply(bone->bsInvBindMatrix, bone->object.matrixPtr);
            else
               m = bone->bsInvBindMatrix;

            if(bsIdentity)
               matBones[i] = m;
            else
            {
               Matrix tmp;
               tmp.Multiply(m, skin.invShape);
               matBones[i] = tmp;
            }

#ifdef GPU_SKIN
            // Calculate bones BBOXes
            if(vertices && !flags.bones)
            {
               float * v = (float *)vertices;
               int j;
               int increment = flags.interleaved ? 8 : 3;
               Vector3Df min, max;

               min = { MAXFLOAT, MAXFLOAT, MAXFLOAT };
               max = {-MAXFLOAT,-MAXFLOAT,-MAXFLOAT };
               for(j = 0; j < nVertices; j++, v += increment)
               {
                  int ix = (j < skin.skinVerts.count) ? j : dupVerts[j - skin.skinVerts.count];
                  SkinVert * sv = &skin.skinVerts[ix];
                  int b;
                  for(b = 0; b < MAX_BONES; b++)
                  {
                     int bone = sv->bones[b];
                     if(bone == i)
                     {
                        if(sv->weights[b])
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
                        break;
                     }
                     else if(bone == NO_BONE)
                        break;
                  }
               }
               skin.bones[i].min = min;
               skin.bones[i].max = max;
            }
#endif
         }

#ifdef GPU_SKIN
         delete this.matBones;
         this.matBones = matBones;

         // TODO: Handle skin change
         if(!flags.bones)
         {
            Allocate({ bones = true }, this.nVertices, displaySystem);
            Lock({ bones = true });

            if(dupVerts && dupVerts.count)
            {
               int * dv = dupVerts.array - skin.skinVerts.count;
               boneData = new SkinVert[this.nVertices];
               memcpy(boneData, skin.skinVerts.array, sizeof(SkinVert) * skin.skinVerts.count);
               for(i = skin.skinVerts.count; i < this.nVertices; i++)
               {
                  int ix = dv[i];
                  boneData[i] = boneData[ix];
               }
            }
            else
               boneData = skin.skinVerts.array;

            Unlock({ bones = true });

            if(displaySystem)
            {
               if(dupVerts && dupVerts.count)
                  delete boneData;
               else
                  boneData = null;
            }
         }
#else
         {
            Array<Matrixf> nmatBones { size = skin.bones.count };
            Vector3Df * oVertices = this.vertices, * vertices;
            Vector3Df * oNormals = this.normals, * normals;
            Vector3Df * oTangents = this.tangents, * tangents = null;
            int nVertices = skin.skinVerts.count;
            if(!oNormals) return;

            if(!skin.vertices) skin.vertices = new Vector3Df[this.nVertices];
            if(!skin.normals)  skin.normals = new Vector3Df[this.nVertices];
            if(oTangents && !skin.tangents) skin.tangents = new Vector3Df[2*this.nVertices];
            this.vertices = vertices = skin.vertices;
            this.normals  = normals  = skin.normals;
            this.tangents = tangents = skin.tangents;
            Lock({ vertices = true, normals = true, tangents = (oTangents != null) });

            for(i = 0; i < skin.bones.count; i++)
            {
               nmatBones[i] = matBones[i];
               nmatBones[i].m[3][0] = 0;
               nmatBones[i].m[3][1] = 0;
               nmatBones[i].m[3][2] = 0;
            }

            for(i = 0; i < nVertices; i++)
            {
               Vector3Df * vert = &vertices[i];
               Vector3Df * nor = &normals[i];
               Vector3Df * tan1 = &tangents[2*i+0];
               Vector3Df * tan2 = &tangents[2*i+1];
               SkinVert * sv = &skin.skinVerts[i];
               int j;
               float tw = 0;
               Vector3Df vt { };
               Vector3Df nt { };
               Vector3Df t1t { };
               Vector3Df t2t { };
               for(j = 0; j < MAX_BONES; j++)
               {
                  int b = sv->bones[j];
                  if(b != NO_BONE)
                  {
                     float w = sv->weights[j] / 255.0f;
                     Vector3Df v, n, t1, t2;
                     inlineMultMatrix(v, oVertices[i], matBones[b]);
                     tw += w;
                     vt.x += w * v.x;
                     vt.y += w * v.y;
                     vt.z += w * v.z;

                     inlineMultMatrix(n, oNormals[i], nmatBones[b]);
                     nt.x += w * n.x;
                     nt.y += w * n.y;
                     nt.z += w * n.z;

                     if(oTangents)
                     {
                        inlineMultMatrix(t1, oTangents[2*i+0], nmatBones[b]);
                        t1t.x += w * t1.x;
                        t1t.y += w * t1.y;
                        t1t.z += w * t1.z;

                        inlineMultMatrix(t2, oTangents[2*i+1], nmatBones[b]);
                        t2t.x += w * t2.x;
                        t2t.y += w * t2.y;
                        t2t.z += w * t2.z;
                     }
                  }
                  else
                     break;
               }

               if(tw)
               {
                  tw = 1.0f / tw;
                  vert->x = vt.x * tw;
                  vert->y = vt.y * tw;
                  vert->z = vt.z * tw;

                  nor->x = nt.x * tw;
                  nor->y = nt.y * tw;
                  nor->z = nt.z * tw;

                  if(oTangents)
                  {
                     tan1->x = t1t.x * tw;
                     tan1->y = t1t.y * tw;
                     tan1->z = t1t.z * tw;

                     tan2->x = t2t.x * tw;
                     tan2->y = t2t.y * tw;
                     tan2->z = t2t.z * tw;
                  }
               }
               else
               {
                  *vert = oVertices[i];
                  *nor = oNormals[i];
                  if(oTangents)
                  {
                     *tan1 = oTangents[2*i+0];
                     *tan2 = oTangents[2*i+1];
                  }
               }
               /*vert->x *= 0.01;
               vert->y *= 0.01;
               vert->z *= 0.01;*/
            }

            if(dupVerts)
            {
               int * dv = dupVerts.array - nVertices;
               int count = nVertices + dupVerts.count;
               for(i = nVertices; i < count; i++)
               {
                  int ix = dv[i];
                  vertices[i] = vertices[ix];
                  // Assuming smooth normals for now...
                  normals[i]  = normals[ix];
                  if(oTangents)
                  {
                     tangents[2*i+0] = tangents[2*ix+0];
                     tangents[2*i+1] = tangents[2*ix+1];
                  }
               }
            }

            Unlock({ vertices = true, normals = true, tangents = (oTangents != null) });

            this.vertices = oVertices;
            this.normals = oNormals;
            if(oTangents) this.tangents = oTangents;
            delete matBones;
            delete nmatBones;
         }
#endif

         SetMinMaxRadius();

      }
   }

   void UnapplySkin()
   {
      MeshSkin skin = this.skin;
      if(skin)
      {
#ifdef GPU_SKIN
         delete this.matBones;
#else
         delete skin.vertices;
         delete skin.normals;
         delete skin.tangents;
         Lock({ vertices = true, normals = true, tangents = (tangents != null) });
         Unlock({ vertices = true, normals = true, tangents = (tangents != null) });
#endif
         SetMinMaxRadius();
      }
   }

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
#if !defined(ECERE_NOGL)   // TODO: Add meab parameter to FreeIndices() to move this to OGL driver?
                  if(meab)
                  {
                     int baseIndex = prim->baseIndexBuffer;
                     ((OGLIndices)prim->data).buffer.buffer = 0;
                     if(baseIndex != -1)
                     {
                        uint iSize = prim->type.indices32bit ? sizeof(uint) : sizeof(uint16);
                        meab.freeBlock(BlockEntry { baseIndex * iSize, (baseIndex + prim->nIndices) * iSize-1 });
                        prim->baseIndexBuffer = -1;
                     }
                  }
#endif
                  driver.FreeIndices(displaySystem, prim);
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

         delete unmorphedMesh;
         delete computedUnmorphedNormals;
         if(morphs) morphs.Free(), delete morphs;
      }
   }

   void FreeCPUVertexAttributes(MeshFeatures what)
   {
      if(what.vertices && !nPrimitives && !skin)
         delete vertices;
      if(what.texCoords1 && (!skin || !mab))
         delete texCoords;
      if(what.normals && !skin)
         delete normals;
      if(what.tangents)
         delete tangents;
      if(what.lightVectors)
         delete lightVectors;
      if(what.colors)
         delete colors;
   }

   int FindClosestVertex(const Vector3D local, Vector3Df actual)
   {
      double distance2 = MAXDOUBLE;
      int result = -1;
      MeshSkin skin = this.skin;
      Vector3Df * oVertices = vertices;
      int nVertices = skin ? skin.skinVerts.count : this.nVertices;
      Array<Matrixf> matBones = this.matBones;
      int i;

      for(i = 0; i < nVertices; i++)
      {
         Vector3Df vert;
         double dx, dy, dz, d2;
         if(skin)
         {
            SkinVert * sv = &skin.skinVerts[i];
            int j;
            float tw = 0;
            Vector3Df vt { };

            for(j = 0; j < MAX_BONES; j++)
            {
               int b = sv->bones[j];
               if(b != NO_BONE)
               {
                  float w = sv->weights[j] / 255.0f;
                  Vector3Df v;
                  inlineMultMatrix(v, oVertices[i], matBones[b]);
                  tw += w;
                  vt.x += w * v.x;
                  vt.y += w * v.y;
                  vt.z += w * v.z;
               }
               else
                  break;
            }

            if(tw)
            {
               tw = 1.0f / tw;
               vert = { vt.x * tw, vt.y * tw, vt.z * tw };
            }
            else
               vert = oVertices[i];
         }
         else
            vert = oVertices[i];

         dx = local.x - vert.x;
         dy = local.y - vert.y;
         dz = local.z - vert.z;
         d2 = dx * dx + dy * dy + dz * dz;
         if(d2 < distance2)
         {
            result = i;
            distance2 = d2;
            if(actual != null)
               actual = vert;
         }
      }
      return result;
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
               int baseIndex = group.baseIndexBuffer;
               ((OGLIndices)group.data).buffer.buffer = 0;
               if(baseIndex != -1)
               {
                  uint iSize = group.type.indices32bit ? sizeof(uint) : sizeof(uint16);
                  meab.freeBlock(BlockEntry { baseIndex * iSize, (baseIndex + group.nIndices) * iSize-1 });
                  group.baseIndexBuffer = -1;
               }
            }
#endif
            driver.FreeIndices(displaySystem, (PrimitiveSingle *)&group.type);
         }
         if(!group.type.vertexRange && (!group.type.sharedIndices /*|| !meab*/))
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
       // FIXME: Define PrimitiveGroup aggregating PrimitiveSingle
      return LockPrimitive((PrimitiveSingle *)&group.type);
   }

   void UnlockPrimitiveGroup(PrimitiveGroup group)
   {
      // FIXME: Define PrimitiveGroup aggregating PrimitiveSingle
      UnlockPrimitive((PrimitiveSingle *)&group.type);
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
               int baseIndex = primitive.baseIndexBuffer;
               ((OGLIndices)primitive.data).buffer.buffer = 0;
               if(baseIndex != -1)
               {
                  uint iSize = primitive.type.indices32bit ? sizeof(uint) : sizeof(uint16);
                  meab.freeBlock(BlockEntry { baseIndex * iSize, (baseIndex + primitive.nIndices) * iSize-1 });
                  primitive.baseIndexBuffer = -1;
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
         bool shareIndicesTweak = false;
         if(primitive.type.sharedIndices && !primitive.indices && indices)
         {
            shareIndicesTweak = true;
            primitive.indices = (uint16 *)((byte *)indices + (primitive.baseIndexMesh * (primitive.type.indices32bit ? 4 : 2)));
         }
#if !defined(ECERE_NOGL)
         driver.UnlockIndices(displaySystem, primitive, primitive.type.indices32bit, primitive.nIndices, meab);
#else
         driver.UnlockIndices(displaySystem, primitive, primitive.type.indices32bit, primitive.nIndices, null);
#endif
         if(shareIndicesTweak)
            ; // Dont do this for picking? primitive.indices = null;
      }
   }

   bool LockPrimitive(PrimitiveSingle primitive)
   {
      bool result = false;
      if(this && primitive)
      {
         if(primitive.type.vertexRange)
            result = true;
         else if(primitive.data && driver.LockIndices(displaySystem, primitive))
            result = true;
      }
      return result;
   }

   // TODO: Make this a runtime option to force smoothing!
   // #define NORMALS_MERGE_VERTICES

   void ComputeNormals(void)
   {
      ComputeNormals3(true, true, true);
   }

   void ComputeNormals2(bool computeNormals, bool computeTangents)
   {
      ComputeNormals3(computeNormals, computeTangents, true);
   }

   void ComputeNormals3(bool computeNormals, bool computeTangents, bool unlock)
   {
      int c;
      //int * numShared = new0 int[nVertices];
      double * weightSum = new0 double[nVertices];
      PrimitiveGroup group;

      if(!unlock || Allocate({ interleaved = flags.interleaved,
         normals = true, tangents = (texCoords != null || (flags.texCoords1 && flags.interleaved)) && computeTangents },
         nVertices, displaySystem))
      {
#ifdef NORMALS_MERGE_VERTICES
         Map<uint, uint> ixMap { };
         Map<SharedVertex, uint> vMap { };
#endif
         float * vertices = (float *)this.vertices;
         float * normals = flags.interleaved ? vertices + 3 : (float *)this.normals;
         float * texCoords = flags.interleaved ? vertices + 5 : (float *)this.texCoords;
         uint vStride = flags.interleaved ? 8 : 3, tStride = flags.interleaved ? 8 : 2;
         Vector3Df * tangents = this.tangents;
         int i;
         int nVertices = this.nVertices - (dupVerts ? dupVerts.count : 0);

         if(computeNormals)
         {
            if(vStride == 3)
               FillBytes(normals, 0, nVertices * sizeof(Vector3Df));
            else
               for(i = 0; i < nVertices; i++)
                  memset(&normals[i * vStride], 0, sizeof(Vector3Df));
         }
         if(tangents)
            FillBytes(tangents, 0, 2*nVertices * sizeof(Vector3Df));
         for(group = groups.first; group; group = group.next)
         {
            int c;
            int offset = 0;
            int strip = 0;
            int nPoints, nIndex;
            bool i32Bit = group.type.indices32bit;
            uint32 * indices32 = i32Bit ?
               (group.type.sharedIndices && this.indices ? this.indices + group.baseIndexMesh : group.indices32) : null;
            uint16 * indices16 = i32Bit ? null : group.indices;

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
            for(c = offset; c < group.nIndices; c += nIndex)
            {
               Plane plane;
               Vector3Df planeNormal;

               if(group.type.primitiveType == triFan)
               {
                  uint ix0 = (i32Bit ? indices32[0] : indices16[0]);
                  uint ix1 = (i32Bit ? indices32[c] : indices16[c]);
                  uint ix2 = (i32Bit ? indices32[c-1] : indices16[c-1]);
                  Vector3D edges[4], rEdges[4];
                  double weights[4];
                  computeNormalWeights(nIndex, vertices, vStride, indices32, i32Bit, c, weights, edges, rEdges);

                  plane.FromPointsf(
                     (Vector3Df *)&vertices[ix0 * vStride],
                     (Vector3Df *)&vertices[ix1 * vStride],
                     (Vector3Df *)&vertices[ix2 * vStride]);
                  planeNormal = { (float) plane.normal.x, (float) plane.normal.y, (float) plane.normal.z };

                  /*if(computeNormals)
                  {
                     ((Vector3Df *)&normals[ix0 * vStride])->Add((Vector3Df *)&normals[ix0 * vStride], planeNormal); //numShared[ix0]++;
                     ((Vector3Df *)&normals[ix1 * vStride])->Add((Vector3Df *)&normals[ix1 * vStride], planeNormal); //numShared[ix1]++;
                     ((Vector3Df *)&normals[ix2 * vStride])->Add((Vector3Df *)&normals[ix2 * vStride], planeNormal); //numShared[ix2]++;
                  }
                  weightSum[ix0] += 1.0;  // TODO: Review weightSums
                  weightSum[ix1] += 1.0;
                  weightSum[ix2] += 1.0;
                  */

                  for(i = c; i < c + nIndex; i++)
                  {
                     uint index = i32Bit ? indices32[i] : indices16[i];
                     int v = i - c;
                     double w = weights[v];

#ifdef NORMALS_MERGE_VERTICES
                     index = resolveIndex(index, vMap, ixMap, (Vector3Df *)&vertices[vStride * index], plane);
#endif

                     if(computeNormals)
                     {
                        normals[index * vStride + 0] += planeNormal.x * w;
                        normals[index * vStride + 1] += planeNormal.y * w;
                        normals[index * vStride + 2] += planeNormal.z * w;
                     }
                     weightSum[index] += w;

                     if(tangents)
                     {
                        uint ix0 = i32Bit ? indices32[0] : indices16[0];
                        uint prev = i-1;
                        uint next = i;
                        uint ix1 = i32Bit ? indices32[next] : indices16[next];
                        uint ix2 = i32Bit ? indices32[prev] : indices16[prev];

                        Vector3Df * p0 = (Vector3Df *)&vertices[vStride * ix0];
                        Vector3Df * p1 = (Vector3Df *)&vertices[vStride * ix1];
                        Vector3Df * p2 = (Vector3Df *)&vertices[vStride * ix2];
                        Pointf    * t0 = (void *)&texCoords[tStride * ix0];   // FIXME: (Pointf *) causes bad .sym
                        Pointf    * t1 = (void *)&texCoords[tStride * ix1];
                        Pointf    * t2 = (void *)&texCoords[tStride * ix2];
                        Vector3D v01 { p1->x - p0->x, p1->y - p0->y, p1->z - p0->z };
                        Vector3D v02 { p2->x - p0->x, p2->y - p0->y, p2->z - p0->z };
                        Pointf t01 { t1->x - t0->x, t1->y - t0->y };
                        Pointf t02 { t2->x - t0->x, t2->y - t0->y };

                        float ff = (t01.x * t02.y - t02.x * t01.y);
                        if(ff)
                        {
                           float f = (float)(w / ff);
                           Vector3Df * tan1 = &tangents[index*2+0];
                           Vector3Df * tan2 = &tangents[index*2+1];
                           tan1->x += f * (v01.x * t02.y - v02.x * t01.y);
                           tan1->y += f * (v01.y * t02.y - v02.y * t01.y);
                           tan1->z += f * (v01.z * t02.y - v02.z * t01.y);
                           tan2->x += f * (v01.x * t02.y - v02.x * t01.y);
                           tan2->y += f * (v01.y * t02.y - v02.y * t01.y);
                           tan2->z += f * (v01.z * t02.y - v02.z * t01.y);
                        }
                     }
                  }
               }
               else if(group.type.primitiveType == triStrip || group.type.primitiveType == quadStrip)
               {
                  // TODO: Tangents not handled here, compute weights not done here
                  uint ix0 = (i32Bit ? indices32[c-1-strip] : indices16[c-1-strip]);
                  uint ix1 = (i32Bit ? indices32[c-2+strip] : indices16[c-2+strip]);
                  uint ix2 = (i32Bit ? indices32[c]         : indices16[c]);
                  plane.FromPointsf(
                     (Vector3Df *)&vertices[ix0 * vStride],
                     (Vector3Df *)&vertices[ix1 * vStride],
                     (Vector3Df *)&vertices[ix2 * vStride]);
                  planeNormal = { (float) plane.normal.x, (float) plane.normal.y, (float) plane.normal.z };

                  if(computeNormals)
                  {
                     ((Vector3Df *)&normals[ix0 * vStride])->Add((Vector3Df *)&normals[ix0 * vStride], planeNormal); //numShared[ix0]++;
                     ((Vector3Df *)&normals[ix1 * vStride])->Add((Vector3Df *)&normals[ix1 * vStride], planeNormal); //numShared[ix1]++;
                     ((Vector3Df *)&normals[ix2 * vStride])->Add((Vector3Df *)&normals[ix2 * vStride], planeNormal); //numShared[ix2]++;
                  }
                  weightSum[ix0] += 1.0;  // TODO: Review weightSums
                  weightSum[ix1] += 1.0;
                  weightSum[ix2] += 1.0;

                  strip ^= 1;
               }
               else
               {
                  if(group.type.vertexRange)
                  {
                     // TODO: Tangents not handled here, compute weights not done here
                     plane.FromPointsf((Vector3Df *)&vertices[(c+2) * vStride],
                                       (Vector3Df *)&vertices[(c+1) * vStride],
                                       (Vector3Df *)&vertices[ c    * vStride]);
                     planeNormal = { (float) plane.normal.x, (float) plane.normal.y, (float) plane.normal.z };

                     for(i = c; i < c+nIndex; i++)
                     {
                        uint ix = i;
                        ((Vector3Df *)&normals[ix * vStride])->Add((Vector3Df *)&normals[ix * vStride], planeNormal);
                        //numShared[ix]++;
                        weightSum[ix] += 1.0;   // TODO: Review weightSums
                        weightSum[ix] += 1.0;
                        weightSum[ix] += 1.0;

                     }
                  }
                  else
                  {
                     Vector3D edges[4], rEdges[4];
                     double weights[4];
                     computeNormalWeights(nIndex, vertices, vStride, indices32, i32Bit, c, weights, edges, rEdges);

                     plane.FromPointsf((Vector3Df *)&vertices[vStride * (i32Bit ? indices32[c+2] : indices16[c+2])],
                                       (Vector3Df *)&vertices[vStride * (i32Bit ? indices32[c+1] : indices16[c+1])],
                                       (Vector3Df *)&vertices[vStride * (i32Bit ? indices32[c  ] : indices16[c  ])]);
                     planeNormal = { (float) plane.normal.x, (float) plane.normal.y, (float) plane.normal.z };

                     /*
                     if(group.material.flags.doubleSided && plane.d < 0)
                     {
                        planeNormal.x *= -1;
                        planeNormal.y *= -1;
                        planeNormal.z *= -1;
                     }
                     */

                     for(i = c; i < c + nIndex; i++)
                     {
                        uint index = i32Bit ? indices32[i] : indices16[i];
                        int v = i - c;
                        double w = weights[v];

#ifdef NORMALS_MERGE_VERTICES
                        index = resolveIndex(index, vMap, ixMap, (Vector3Df *)&vertices[vStride * index], plane);
#endif

                        if(computeNormals)
                        {
                           //normals[index].Add(normals[index], planeNormal);
                           normals[index * vStride + 0] += planeNormal.x * w;
                           normals[index * vStride + 1] += planeNormal.y * w;
                           normals[index * vStride + 2] += planeNormal.z * w;
                        }
                        weightSum[index] += w;
                        //numShared[index] ++;

                        if(tangents)
                        {
                           uint ix0 = i32Bit ? indices32[i] : indices16[i]; //index;
                           uint prev = v ? i - 1 : c + nIndex-1;
                           uint next = v < nIndex-1 ? i + 1 : c;
                           uint ix1 = i32Bit ? indices32[next] : indices16[next];
                           uint ix2 = i32Bit ? indices32[prev] : indices16[prev];

                           Vector3Df * p0 = (Vector3Df *)&vertices[vStride * ix0];
                           Vector3Df * p1 = (Vector3Df *)&vertices[vStride * ix1];
                           Vector3Df * p2 = (Vector3Df *)&vertices[vStride * ix2];
                           Pointf    * t0 = (void *)&texCoords[tStride * ix0];   // FIXME: (Pointf *) causes bad .sym
                           Pointf    * t1 = (void *)&texCoords[tStride * ix1];
                           Pointf    * t2 = (void *)&texCoords[tStride * ix2];
                           Vector3D v01 { p1->x - p0->x, p1->y - p0->y, p1->z - p0->z };
                           Vector3D v02 { p2->x - p0->x, p2->y - p0->y, p2->z - p0->z };
                           Pointf t01 { t1->x - t0->x, t1->y - t0->y };
                           Pointf t02 { t2->x - t0->x, t2->y - t0->y };

                           float ff = (t01.x * t02.y - t02.x * t01.y);
                           if(ff)
                           {
                              float f = (float)(w / ff);
                              Vector3Df * tan1 = &tangents[index*2+0];
                              Vector3Df * tan2 = &tangents[index*2+1];
                              tan1->x += f * (v01.x * t02.y - v02.x * t01.y);
                              tan1->y += f * (v01.y * t02.y - v02.y * t01.y);
                              tan1->z += f * (v01.z * t02.y - v02.z * t01.y);
                              tan2->x += f * (v01.x * t02.y - v02.x * t01.y);
                              tan2->y += f * (v01.y * t02.y - v02.y * t01.y);
                              tan2->z += f * (v01.z * t02.y - v02.z * t01.y);
                           }
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
            bool i32Bit = primitive->type.indices32bit;
            double weights[4];
            Vector3D edges[4], rEdges[4];
            uint32 * indices32 = i32Bit ?                                 // baseIndex set but not used for Singles?
               (primitive->type.sharedIndices && this.indices ? this.indices /*+ primitive->baseIndex*/ : primitive->indices32) :
               null;
            uint16 * indices16 = i32Bit ? null : primitive->indices;

            plane.FromPointsf((Vector3Df *)&vertices[vStride * (i32Bit ? indices32[2] : indices16[2])],
                              (Vector3Df *)&vertices[vStride * (i32Bit ? indices32[1] : indices16[1])],
                              (Vector3Df *)&vertices[vStride * (i32Bit ? indices32[0] : indices16[0])]);
            planeNormal = { (float) plane.normal.x, (float) plane.normal.y, (float) plane.normal.z };

            /*
            if(primitive->material.flags.doubleSided && plane.d < 0)
            {
               planeNormal.x *= -1;
               planeNormal.y *= -1;
               planeNormal.z *= -1;
            }
            */
                         // baseIndex set but not used for Singles?
            computeNormalWeights(primitive->nIndices, vertices, vStride, indices32,
               i32Bit, 0 /*primitive->baseIndex*/, weights, edges, rEdges);

            for(i = 0; i<primitive->nIndices; i++)
            {
               uint ix = primitive->indices[i];
               double w = weights[i];
               uint index = i32Bit ? indices32[i] : indices16[i];

#ifdef NORMALS_MERGE_VERTICES
               index = resolveIndex(index, vMap, ixMap, (Vector3Df *)&vertices[vStride * index], plane);
#endif

               weightSum[ix] += w;  // TODO: Review weightSums

               if(computeNormals)
               {
                  ((Vector3Df *)&normals[vStride * ix])->Add((Vector3Df *)&normals[vStride * ix], planeNormal);
               }

               if(tangents)
               {
                  uint ix0 = i;
                  uint prev = i ? i - 1 : primitive->nIndices-1;
                  uint next = i < primitive->nIndices-1 ? i + 1 : 0;
                  uint ix1 = i32Bit ? indices32[next] : indices16[next];
                  uint ix2 = i32Bit ? indices32[prev] : indices16[prev];
                  Vector3Df * p0 = (Vector3Df *)&vertices[vStride * ix0];
                  Vector3Df * p1 = (Vector3Df *)&vertices[vStride * ix1];
                  Vector3Df * p2 = (Vector3Df *)&vertices[vStride * ix2];
                  Pointf    * t0 = (void *)&texCoords[tStride * ix0];   // FIXME: (Pointf *) causes bad .sym
                  Pointf    * t1 = (void *)&texCoords[tStride * ix1];
                  Pointf    * t2 = (void *)&texCoords[tStride * ix2];
                  Vector3D v01 { p1->x - p0->x, p1->y - p0->y, p1->z - p0->z };
                  Vector3D v02 { p2->x - p0->x, p2->y - p0->y, p2->z - p0->z };
                  Pointf t01 { t1->x - t0->x, t1->y - t0->y };
                  Pointf t02 { t2->x - t0->x, t2->y - t0->y };
                  float ff = t01.x * t02.y - t02.x * t01.y;
                  if(ff)
                  {
                     float f = (float)(w / ff);
                     Vector3Df * tan1 = &tangents[index*2+0];
                     Vector3Df * tan2 = &tangents[index*2+1];

                     tan1->x += f * (v01.x * t02.y - v02.x * t01.y);
                     tan1->y += f * (v01.y * t02.y - v02.y * t01.y);
                     tan1->z += f * (v01.z * t02.y - v02.z * t01.y);

                     tan2->x += f * (v02.x * t01.x - v01.x * t02.x);
                     tan2->x += f * (v02.y * t01.x - v01.y * t02.x);
                     tan2->x += f * (v02.z * t01.x - v01.z * t02.x);
                  }
               }
               //numShared[ix]++;
            }
         }

         for(c = 0; c<nVertices; c++)
         {
            float s = (float)(1.0 / weightSum[c]); // numShared[c]
            if(!weightSum[c])
               s = 1.0; // Unused vertices following merging?
            if(computeNormals)
            {
               Vector3Df * n = (Vector3Df *)&normals[vStride * c];
               n->Scale(n, s), n->Normalize(n);
            }
            if(computeTangents && tangents)
            {
               Vector3Df * t1 = &tangents[2*c], * t2 = &tangents[2*c+1];
               t1->Scale(t1, s), t1->Normalize(t1);
               t2->Scale(t2, s), t2->Normalize(t2);
            }
         }

#ifdef NORMALS_MERGE_VERTICES
         if(computeNormals)
            for(i = 0; i < nVertices; i++)
            {
               uint ix = ixMap[i];
               *(Vector3Df *)&normals[i * vStride] = *(Vector3Df *)&normals[ix * vStride];
            }

         if(computeTangents && tangents)
         {
            for(i = 0; i < nVertices; i++)
            {
               uint ix = ixMap[i];
               tangents[2*i] = tangents[2*ix];
               tangents[2*i+1] = tangents[2*ix+1];
            }
         }
         delete ixMap;
         delete vMap;
#endif

         if(dupVerts)
         {
            int dvCount = dupVerts.count, startDup = this.nVertices - dvCount;
            int * dv = dupVerts.array;
            int i;

            for(i = 0; i < dvCount; i++)
            {
               int di = startDup + i;
               int ix = dv[i];
               if(computeNormals)
               {
                  normals[3*di+0] = normals[3*ix+0];
                  normals[3*di+1] = normals[3*ix+1];
                  normals[3*di+2] = normals[3*ix+2];
               }
               if(computeTangents && tangents)
               {
                  tangents[2*di+0] = tangents[2*ix+0];
                  tangents[2*di+1] = tangents[2*ix+1];
               }
            }
         }

         //delete numShared;
         delete weightSum;
         if(unlock)
            Unlock({ interleaved = flags.interleaved, normals = computeNormals, tangents = computeTangents });
      }
   }

   Mesh Copy()
   {
      Mesh mesh = null;
      if(this)
      {
         mesh = { };
         if(mesh.Allocate(flags, nVertices, displaySystem))
         {
            PrimitiveGroup g;
            if(flags.vertices)
               memcpy(mesh.vertices, vertices, nVertices * (flags.doubleVertices ? sizeof(Vector3D) : sizeof(Vector3Df)));
            if(flags.normals)
               memcpy(mesh.normals, normals, nVertices * (flags.doubleNormals ? sizeof(Vector3D) : sizeof(Vector3Df)));
            if(flags.texCoords1)
               memcpy(mesh.texCoords, texCoords, nVertices * sizeof(Pointf));
            if(flags.colors)
               memcpy(mesh.colors, colors, nVertices * sizeof(ColorRGBAf));
            if(flags.tangents)
               memcpy(mesh.tangents, tangents, nVertices * sizeof(Vector3Df));
            if(flags.lightVectors)
               memcpy(mesh.lightVectors, lightVectors, nVertices * sizeof(Vector3Df));
            if(dupVerts)
               mesh.dupVerts = { dupVerts };

            mesh.baseIndex = baseIndex;
            mesh.baseVertex = baseVertex;
            mesh.nIndices = nIndices;
            if(parts)
               mesh.parts = { parts };
            if(nIndices)
            {
               mesh.indices = nIndices ? new uint[nIndices] : null;
               memcpy(mesh.indices, indices, nIndices * sizeof(uint));
            }
            mesh.mab = mab;   // REVIEW
            mesh.meab = meab;

            for(g = groups.first; g; g = g.next)
            {
               PrimitiveGroup group = mesh.AddPrimitiveGroup(g.type, g.nIndices);
               if(group)
               {
                  group.baseIndexBuffer = g.baseIndexBuffer;
                  group.baseIndexMesh = g.baseIndexMesh;
                  if(group.type.vertexRange)
                  {
                     group.first = g.first;
                     group.nVertices = g.nVertices;
                  }
                  else if(group.indices || group.indices32)
                  {
                     if(group.type.indices32bit)
                        memcpy(group.indices32, g.indices32, sizeof(uint32) * group.nIndices);
                     else
                        memcpy(group.indices, g.indices, sizeof(uint16) * group.nIndices);
                  }
                  group.material = g.material;
                  mesh.UnlockPrimitiveGroup(group);
               }
            }
            mesh.Unlock(0);
         }

         mesh.skin = skin;
         mesh.radius = radius;
         mesh.min = min;
         mesh.max = max;
      }
      return mesh;
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
                           CopyBytesBy4(indices + group.baseIndexMesh + nIndices, primitive->indices32, primitive->nIndices);
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
         primitives = renew0 primitives PrimitiveSingle[this.nPrimitives];
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
         primitives = renew0 primitives PrimitiveSingle[this.nPrimitives];

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

               primitives = renew0 primitives PrimitiveSingle[this.nPrimitives + nPrimitives];

               if(group.type.indices32bit)
               {
                  for(c = offset; c<groupCount; c+= nIndex)
                  {
                     PrimitiveSingle * primitive = &primitives[this.nPrimitives++];

                     if(AllocatePrimitive(primitive, group.type & ~PrimitiveGroupType { vertexRange = true, sharedIndices = true }, nPoints))
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
                           uint32 * indices32 = group.type.sharedIndices ? indices + group.baseIndexMesh : group.indices32;
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

                     if(AllocatePrimitive(primitive, group.type & ~ PrimitiveGroupType { vertexRange = true, sharedIndices = true }, nPoints))
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

   private void countTexture(Bitmap bitmap, AVLTree<uintptr> bitmaps, int * w, int * h, int * internalFormat)
   {
      if(bitmaps.Add((uintptr)bitmap))
      {
         Bitmap b = bitmap.numMipMaps && bitmap.bitmaps && bitmap.bitmaps[0] ? bitmap.bitmaps[0] : bitmap;
         *w = Max(*w, b.width);
         *h = Max(*h, b.height);
         if(!*internalFormat)
         {
   #if !defined(__EMSCRIPTEN__) && ((!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3))
            bool sRGB2Linear = bitmap.sRGB2Linear;
            *internalFormat = bitmap.pixelFormat == pixelFormatETC2RGBA8 ?
            (sRGB2Linear ? GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC : GL_COMPRESSED_RGBA8_ETC2_EAC) :
            (sRGB2Linear ? GL_SRGB8_ALPHA8 : GL_RGBA8);
   #else
            *internalFormat = bitmap.pixelFormat == pixelFormatETC2RGBA8 ? 0 : GL_RGBA;
   #endif

#if !defined(_GLES3)
            if(*internalFormat == GL_COMPRESSED_RGBA8_ETC2_EAC)
               *internalFormat = GL_COMPRESSED_RGBA_S3TC_DXT5_EXT;
#endif
         }
      }
   }

   private void countMatTextures(Material mat, int nAT, AVLTree<uintptr> * bitmaps, int * w, int * h, int * internalFormats)
   {
      if(nAT > 0 && mat.baseMap)      countTexture(mat.baseMap,     bitmaps[0], w + 0, h + 0, internalFormats + 0);
      if(nAT > 1 && mat.bumpMap)      countTexture(mat.bumpMap,     bitmaps[1], w + 1, h + 1, internalFormats + 1);
      if(nAT > 2 && mat.specularMap)  countTexture(mat.specularMap, bitmaps[2], w + 2, h + 2, internalFormats + 2);
      if(nAT > 3 && mat.envMap)       countTexture(mat.envMap,      bitmaps[3], w + 3, h + 3, internalFormats + 3);
      if(nAT > 4 && mat.reflectMap)   countTexture(mat.reflectMap,  bitmaps[4], w + 4, h + 4, internalFormats + 4);
   }

   private void countTextures(int nAT, AVLTree<uintptr> * bitmaps, int * w, int * h, int * internalFormats)
   {
      PrimitiveGroup g;

      for(g = groups.first; g; g = g.next)
         if(g.material)
            countMatTextures(g.material, nAT, bitmaps, w, h, internalFormats);
      if(primitives)
      {
         int p;
         for(p = 0; p < nPrimitives; p++)
         {
            PrimitiveSingle prim = primitives[p];
            if(prim.material) countMatTextures(prim.material, nAT, bitmaps, w, h, internalFormats);
         }
      }
   }

   void UploadTexture(Bitmap bitmap, DisplaySystem displaySystem, GLArrayTexture at)
   {
      if(bitmap.displaySystem != displaySystem)
      {
         if(!at)
            bitmap.MakeMipMaps(displaySystem);
         else
         {
            Bitmap convBitmap = bitmap;
            if(convBitmap.pixelFormat != pixelFormatRGBAGL && convBitmap.pixelFormat != pixelFormatETC2RGBA8)
               convBitmap = bitmap.ProcessDD((bool)2, 0, false, 16384, false, at.width, at.height); //oglSystem.maxTextureSize, !capabilities.nonPow2Textures);
            if(convBitmap)
            {
               if(!at.texture)
               {
#if !defined(__EMSCRIPTEN__) && ((!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3))
                  bool sRGB2Linear = bitmap.sRGB2Linear;
                  int internalFormat = convBitmap.pixelFormat == pixelFormatETC2RGBA8 ?
                     (sRGB2Linear ? GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC : GL_COMPRESSED_RGBA8_ETC2_EAC) :
                     (sRGB2Linear ? GL_SRGB8_ALPHA8 : GL_RGBA8);
         #else
                  int internalFormat = convBitmap.pixelFormat == pixelFormatETC2RGBA8 ? 0 : GL_RGBA;
#endif

#if !defined(_GLES3)
                  if(internalFormat == GL_COMPRESSED_RGBA8_ETC2_EAC)
                     internalFormat = GL_COMPRESSED_RGBA_S3TC_DXT5_EXT;
#endif


                  // TOCHECK: Shouldn't the overall bitmap width be set?
                  // Bitmap bmp = convBitmap.bitmaps && convBitmap.numMipMaps ? convBitmap.bitmaps[0] : convBitmap;
                  at._init(convBitmap.numMipMaps ? convBitmap.numMipMaps : 1,
                     at.width  ? at.width  : MODELS_TEXTUREARRAY_SIZE,
                     at.height ? at.height : MODELS_TEXTUREARRAY_SIZE,
                     at.numLayers ? at.numLayers : 64,
                     internalFormat,
                     false);
               }

               if(convBitmap.bitmaps)
               {
                  int layer = at.allocateLayer(0);
                  int j;
                  int numLevels = at.numLevels;
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
                                 at.setLayerCompressed(level, 0, 0, layer, bmp.picture, bmp.sizeBytes, 0);
                              else
                                 at.setLayer(level, 0, 0, layer, bmp.picture, 0);
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

   void UploadPrimitive(PrimitiveSingle g, DisplaySystem displaySystem, bool uploadTextures, int nAT, GLArrayTexture * mAT, bool clearData, bool unlockAndDelete)
   {
      Material mat = g.material;
      if(!g.type.vertexRange)
      {
         if(clearData)
            g.data = null;
         if(unlockAndDelete)
            UnlockPrimitive(g);
      }
      if(mat && uploadTextures)
      {
         if(mat.baseMap)     UploadTexture(mat.baseMap,     displaySystem, mAT && nAT > 0 ? mAT[0] : null);
         if(mat.bumpMap)     UploadTexture(mat.bumpMap,     displaySystem, mAT && nAT > 1 ? mAT[1] : null);
         if(mat.specularMap) UploadTexture(mat.specularMap, displaySystem, mAT && nAT > 2 ? mAT[2] : null);
         if(mat.envMap)      UploadTexture(mat.envMap,      displaySystem, mAT && nAT > 3 ? mAT[3] : null);
         if(mat.reflectMap)  UploadTexture(mat.reflectMap,  displaySystem, mAT && nAT > 4 ? mAT[4] : null);
      }
      if(unlockAndDelete && (!g.type.sharedIndices && !meab && !skin))
         delete g.indices;
   }

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

      if(flags.interleaved)
         delete vertices;

      if(!skin || !mab)
         delete texCoords;
      if(!skin)
         delete normals;

      if(dupVerts && dupVerts.count)
         delete boneData;
      else
         boneData = null;

      delete colors;
      delete lightVectors;

      for(g = groups.first; g; g = g.next)
         UploadPrimitive((PrimitiveSingle *)&g.type, displaySystem, uploadTextures, nAT, mAT, clearData, true);

      if(primitives)
      {
         int p;
         for(p = 0; p < nPrimitives; p++)
         {
            PrimitiveSingle * g = &primitives[p];
            UploadPrimitive(g, displaySystem, uploadTextures, nAT, mAT, clearData, false);
         }
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

#ifdef GPU_SKIN
      if(!skin)
#endif
      if(!v) return;

      min = { MAXFLOAT, MAXFLOAT, MAXFLOAT };
      max = {-MAXFLOAT,-MAXFLOAT,-MAXFLOAT };

#ifdef GPU_SKIN
      if(skin && matBones)
      {
         int i;
         for(i = 0; i < skin.bones.count; i++)
         {
            SkinBone * bone = &skin.bones[i];
            Matrixf * mat = &matBones[i];
            Vector3Df sPoints[8] =
            {
               bone->min,
               { bone->min.x, bone->min.y, bone->max.z },
               { bone->min.x, bone->max.y, bone->min.z },
               { bone->min.x, bone->max.y, bone->max.z },
               { bone->max.x, bone->min.y, bone->min.z },
               { bone->max.x, bone->min.y, bone->max.z },
               { bone->max.x, bone->max.y, bone->min.z },
               bone->max
            };
            int j;
            for(j = 0; j < 8; j++)
            {
               const Vector3Df * s = &sPoints[j];
               float x = s->x * mat->m[0][0] + s->y * mat->m[1][0] + s->z * mat->m[2][0] + mat->m[3][0];
               float y = s->x * mat->m[0][1] + s->y * mat->m[1][1] + s->z * mat->m[2][1] + mat->m[3][1];
               float z = s->x * mat->m[0][2] + s->y * mat->m[1][2] + s->z * mat->m[2][2] + mat->m[3][2];
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
         }
      }
      else
#endif
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
   MeshSkin skin;
   Array<int> dupVerts;

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

#if 1 //def GPU_SKIN
   Array<Matrixf> matBones;
   SkinVert * boneData; // For uploading to GPU
#endif

   Array<MeshMorph> morphs;
   Mesh unmorphedMesh;
   Vector3Df * computedUnmorphedNormals;  // Normals as computed by ComputeNormals2() for unmorphed mesh
};

void computeNormalWeights(int n, float * vertices, uint vStride, uint * indices, bool ix32Bit, int base, double * weights, Vector3D * edges, Vector3D * rEdges)
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
      p0 = (Vector3Df *)&vertices[ix0 * vStride], p1 = (Vector3Df *)&vertices[ix1 * vStride];
      edges[i] = { p1->x - p0->x, p1->y - p0->y, p1->z - p0->z };
      edges[i].Normalize(edges[i]);
      rEdges[i].Scale(edges[i], -1);
   }
   for(i = 0; i < n; i++)
      weights[i] = acos(Min(1.0, Max(-1.0, edges[i].DotProduct(rEdges[i ? i-1 : n-1])))) / ((n-2) * Pi);
}

#ifdef NORMALS_MERGE_VERTICES

#define SHARED_VERTEX_DELTA   0.00001
#define SHARED_VERTEX_MAX_DOT 0.40

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

      if(dx > SHARED_VERTEX_DELTA) return 1;
      if(dx <-SHARED_VERTEX_DELTA) return -1;
      if(dy > SHARED_VERTEX_DELTA) return 1;
      if(dy <-SHARED_VERTEX_DELTA) return -1;
      if(dz > SHARED_VERTEX_DELTA) return 1;
      if(dz <-SHARED_VERTEX_DELTA) return -1;

      dot = n.DotProduct(b.n);

      if(dot > SHARED_VERTEX_MAX_DOT)
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
