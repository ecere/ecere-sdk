namespace gfx3D;

import "Display"

public enum FrustumPlacement { outside, inside, intersecting };

public class ObjectFormat
{
   class_data char * extension;
   class_property char * extension
   {
      set { class_data(extension) = value; }
      get { return class_data(extension); }
   }

   virtual bool ::Load(Object object, char * fileName, DisplaySystem displaySystem);
};

// TODO: Review these:
public class ObjectFlags
{
public:
   bool root:1, viewSpace:1, ownMesh:1, translucent:1, flipWindings:1, keysLoaded:1, transform:1, mesh:1, light:1, camera:1;
   int hierarchy:16:16;
};

public struct Transform
{
   Vector3D position;
   Quaternion orientation;
   Vector3Df scaling;
};

/*static float ease(float t, float a, float b)
{
   float k;
   float s = a + b;

   if (s == 0.0f) return t;
   if (s > 1.0f)
   {
      a /= s;
      b /= s;
   }
   k = 1.0f/(2.0f-a-b);
   if (t < a) return (k/a)*t*t;
   if (t < 1.0f - b) return k*(2.0f * t - a);
   t = 1.0f - t;
   return 1.0f - (k/b)*t*t;
}*/

public enum FrameTrackType : uint16 { position = 1, rotation, scaling, fov, roll, colorChange, morph, hotSpot, fallOff, hide };

public class FrameTrackBits
{
   FrameTrackType type;
   bool loop:1;
};

public struct FrameKey
{
   unsigned int frame;
   float tension, continuity, bias;
   float easeFrom, easeTo;
   union
   {
      Vector3Df position;
      Quaternion orientation;
      Vector3Df scaling;
      float roll;
      float fov;
      ColorRGB color;
      float hotSpot;
      float fallOff;
   };
};

enum SplinePart { splinePoint, splineA, splineB };

public class FrameTrack : struct
{
   FrameTrack prev, next;
   FrameTrackBits type;
   unsigned int numKeys;
   FrameKey * keys;

   void Free(void)
   {
      delete keys;
   }

   ~FrameTrack()
   {
      Free();
   }

   float GetFloat(SplinePart what, unsigned int n)
   {
      float value;
      FrameKey *kn_1, *kn, *kn1;
      float pn_1, pn, pn1;
      int d1, d2;

      kn = &keys[n];
      pn = kn->roll;

      if(what == splinePoint)
         value = pn;
      else
      {
         if(n == 0)
         {
            kn1 = &keys[1];
            pn1 = kn1->roll;

            if(numKeys == 2)
            {
               value = pn1 - pn;
               value *= 1.0f - kn->tension;
               return value;
            }
            if(type.loop)
            {
               kn_1 = &keys[numKeys-2];
               d1 = keys[numKeys-1].frame - kn_1->frame;
               d2 = kn1->frame - kn->frame;
            }
            else
            {
               float a1;
               value = pn1 - pn;
               value *= 1.5f;

               a1 = GetFloat(splineA, 1);
               a1 *= 0.5f;

               value -= a1;
               value *= 1.0f - kn->tension;
               return value;
            }
         }
         else if(n == numKeys-1)
         {
            kn_1 = &keys[n-1];
            pn_1 = kn_1->roll;

            if(numKeys == 2)
            {
               value = pn - pn_1;
               value *= 1.0f - kn->tension;
               return value;
            }
            if(type.loop)
            {
               kn1 = &keys[1];
               d1 = kn->frame - kn_1->frame;
               d2 = kn1->frame - keys[0].frame;
            }
            else
            {
               float bn_1;
               value = pn - pn_1;
               value *= 1.5f;

               bn_1 = GetFloat(splineB, n-1);
               bn_1 *= 0.5f;

               value -= bn_1;
               value *= 1.0f - kn->tension;
               return value;
            }
         }
         else
         {
            kn_1 = &keys[n-1];
            kn1 = &keys[n+1];
            d1 = kn->frame - kn_1->frame;
            d2 = kn1->frame - kn->frame;
         }
         {
            float C, adjust;
            float part1, part2;

            pn_1 = kn_1->roll;
            pn1 = kn1->roll;

            if(what == splineA)
            {
               C = kn->continuity;
               adjust = (float)d1;
            }
            else
            {
               C = -kn->continuity;
               adjust = (float)d2;
            }
            adjust /= d1 + d2;
            adjust = 0.5f + (1.0f - Abs(C))*(adjust - 0.5f);

            part1 = pn - pn_1;
            part1 *= (1.0f + kn->bias)*(1.0f - C);

            part2 = pn1 - pn;
            part2 *= (1.0f - kn->bias)*(1.0f + C);

            value = part1 + part2;
            value *= (1.0f - kn->tension)*adjust;
         }
      }
      return value;
   }

   void GetVector(Vector3Df vector, SplinePart what, unsigned int n)
   {
      FrameKey *kn_1, *kn, *kn1;
      Vector3Df *pn_1, *pn, *pn1;
      int d1, d2;

      kn = &keys[n];
      pn = &kn->position;

      if(what == splinePoint)
         vector = *pn;
      else
      {
         if(n == 0)
         {
            kn1 = &keys[1];
            pn1 = &kn1->position;

            if(numKeys == 2)
            {
               vector.Subtract(pn1, pn);
               vector.Scale(vector, 1.0f - kn->tension);
               return;
            }
            if(type.loop)
            {
               kn_1 = &keys[numKeys-2];
               d1 = keys[numKeys-1].frame - kn_1->frame;
               d2 = kn1->frame - kn->frame;
            }
            else
            {
               Vector3Df a1;
               vector.Subtract(pn1, pn);
               vector.Scale(vector, 1.5f);

               GetVector(a1, splineA, 1);
               a1.Scale(a1, 0.5f);

               vector.Subtract(vector, a1);
               vector.Scale(vector, 1.0f - kn->tension);
               return;
            }
         }
         else if(n == numKeys-1)
         {
            kn_1 = &keys[n-1];
            pn_1 = &kn_1->position;

            if(numKeys == 2)
            {
               vector.Subtract(pn, pn_1);
               vector.Scale(vector, 1.0f - kn->tension);
               return;
            }
            if(type.loop)
            {
               kn1 = &keys[1];
               d1 = kn->frame - kn_1->frame;
               d2 = kn1->frame - keys[0].frame;
            }
            else
            {
               Vector3Df bn_1;
               vector.Subtract(pn, pn_1);
               vector.Scale(vector, 1.5f);

               GetVector(&bn_1, splineB, n-1);
               bn_1.Scale(bn_1, 0.5f);

               vector.Subtract(vector, bn_1);
               vector.Scale(vector, 1.0f - kn->tension);
               return;
            }
         }
         else
         {
            kn_1 = &keys[n-1];
            kn1 = &keys[n+1];
            d1 = kn->frame - kn_1->frame;
            d2 = kn1->frame - kn->frame;
         }
         {
            float C, adjust;
            Vector3Df part1, part2;

            pn_1 = &kn_1->position;
            pn1 = &kn1->position;

            if(what == splineA)
            {
               C = kn->continuity;
               adjust = (float)d1;
            }
            else
            {
               C = -kn->continuity;
               adjust = (float)d2;
            }
            adjust /= d1 + d2;
            adjust = 0.5f + (1.0f - Abs(C))*(adjust - 0.5f);

            part1.Subtract(pn, pn_1);
            part1.Scale(part1, (1.0f + kn->bias)*(1.0f - C));

            part2.Subtract(pn1, pn);
            part2.Scale(part2, (1.0f - kn->bias)*(1.0f + C));

            vector.Add(part1, part2);
            vector.Scale(vector, (1.0f - kn->tension)*adjust);
         }
      }
   }

   void GetQuaternion(Quaternion quat, SplinePart what, unsigned int n)
   {
      FrameKey *kn_1, *kn, *kn1;
      Quaternion *qn_1, *qn, *qn1;
      int d1, d2;

      kn = &keys[n];
      qn = &kn->orientation;

      if (what == splinePoint)
         quat = *qn;
      else
      {
         if(n == 0)
         {
            kn1 = &keys[1];

            if (!(type.loop) || numKeys <= 2)
            {
               qn1 = &kn1->orientation;
               quat.Slerp(qn, qn1, (1.0f - kn->tension)*(1.0f + kn->continuity*kn->bias)/3.0f);
               return;
            }
            else
            {
               kn_1= &keys[numKeys-2];
               d1 = keys[numKeys-1].frame - kn_1->frame;
               d2 = kn1->frame - kn->frame;
            }
         }
         else if (n == numKeys-1)
         {
            kn_1 = &keys[n-1];

            if (!(type.loop) || numKeys <= 2)
            {
               qn_1 = &kn_1->orientation;
               quat.Slerp(qn, qn_1, (1.0f - kn->tension)*(1.0f - kn->continuity*kn->bias)/3.0f);
               return;
            }
            else
            {
               kn1 = &keys[1];
               d1 = kn->frame - kn_1->frame;
               d2 = kn1->frame - keys[0].frame;
            }
         }
         else
         {
            kn_1 = &keys[n-1];
            kn1 = &keys[n+1];
            d1 = kn->frame - kn_1->frame;
            d2 = kn1->frame - kn->frame;
         }
         {
            float f, adjust;
            Quaternion g1, g2, tmp;

            qn_1 = &kn_1->orientation;
            qn1 = &kn1->orientation;

            if (what == splineA)
            {
               f = 1.0f;
               adjust = (float)d1;
            }
            else
            {
               f = -1.0f;
               adjust = (float)d2;
            }
            adjust /= d1 + d2;
            adjust = 0.5f + (1.0f - Abs(kn->continuity))*(adjust - 0.5f);

            g1.Slerp(qn, qn_1,-(1.0f + kn->bias)/3.0f);
            g2.Slerp(qn, qn1 , (1.0f - kn->bias)/3.0f);
            tmp.Slerp(g1, g2, 0.5f + f*0.5f*kn->continuity);
            quat.Slerp(qn, &tmp, f*(kn->tension - 1.0f)*adjust*2.0f);
         }
      }
   }

   void Interpolate(Vector3Df vector, Vector3Df prevVector, Vector3Df nextVector, int prev, int next, float t)
   {
      if(!t)
         vector = prevVector;
      else
      {
         Vector3Df p1 = prevVector, p2 = nextVector;
         Vector3Df r1, r2;

         GetVector(r1, splineB, prev);
         GetVector(r2, splineA, next);

         p1.Scale(p1, 2*t*t*t - 3*t*t + 1);
         p2.Scale(p2,-2*t*t*t + 3*t*t);

         r1.Scale(r1, t*t*t - 2*t*t + t);
         r2.Scale(r2, t*t*t -   t*t);

         vector = p1;
         vector.Add(vector, r1);
         vector.Add(vector, p2);
         vector.Add(vector, r2);
      }
   }

   void InterpolateQuat(Quaternion quat, Quaternion prevQuat, Quaternion nextQuat, int prev, int next, float t)
   {
      if(!t)
         quat = prevQuat;
      else
      {
         Quaternion a, b;
         Quaternion q0, q1, q2;

         GetQuaternion(b, splineB, prev);
         GetQuaternion(a, splineA, next);

         q0.Slerp(prevQuat, b, t);
         q1.Slerp(b, a, t);
         q2.Slerp(a, nextQuat, t);

         q0.Slerp(q0, q1, t);
         q1.Slerp(q1, q2, t);

         quat.Slerp(q0, q1, t);
      }
   }

   float InterpolateFloat(float prevValue, float nextValue, int prev, int next, float t)
   {
      float value;
      if(!t)
         value = prevValue;
      else
      {
         float p1 = prevValue, p2 = nextValue;

         float r1 = GetFloat(splineB, prev);
         float r2 = GetFloat(splineA, next);

         p1 *= 2*t*t*t - 3*t*t + 1;
         p2 *= -2*t*t*t + 3*t*t;

         r1 *= t*t*t - 2*t*t + t;
         r2 *= t*t*t -   t*t;

         value = p1 + r1 + p2 + r2;
      }
      return value;
   }
};

static bool FindMaterialAndType(Mesh mesh, Material material, PrimitiveGroupType type)
{
   PrimitiveGroup group;
   for(group = mesh.groups.first; group; group = group.next)
      if(group.material == material && group.type == type)
         return true;
   return false;
}

public class Object
{
public:
   void SetMinMaxRadius(bool processMesh)
   {
      Object child;

      if(flags.mesh && mesh)
      {
         if(processMesh)
            mesh.SetMinMaxRadius();
         min = mesh.min;
         max = mesh.max;
         volume = (max.x >= min.x && max.y >= min.y && max.z >= min.z);
      }
      else
      {
         min = { MAXFLOAT, MAXFLOAT, MAXFLOAT };
         max = { -MAXFLOAT, -MAXFLOAT, -MAXFLOAT };
         volume = false;
      }
      for(child = children.first; child; child = child.next)
      {
         child.SetMinMaxRadius(processMesh);

         if(child.volume)
         {
            // Child Local + Child Object Transform
            Vector3Df points[8] =
            {
               { child.min.x, child.min.y, child.min.z },
               { child.min.x, child.min.y, child.max.z },
               { child.min.x, child.max.y, child.min.z },
               { child.min.x, child.max.y, child.max.z },
               { child.max.x, child.min.y, child.min.z },
               { child.max.x, child.min.y, child.max.z },
               { child.max.x, child.max.y, child.min.z },
               { child.max.x, child.max.y, child.max.z }
            };
            int c;
            for(c = 0; c<8; c++)
            {
               Vector3Df point;
               point.MultMatrix(points[c], child.localMatrix);

               if(point.x < min.x) min.x = point.x;
               if(point.y < min.y) min.y = point.y;
               if(point.z < min.z) min.z = point.z;

               if(point.x > max.x) max.x = point.x;
               if(point.y > max.y) max.y = point.y;
               if(point.z > max.z) max.z = point.z;
            }
            volume = true;
         }
      }

      if(volume)
      {
         Vector3Df points[8] =
         {
            { min.x, min.y, min.z },
            { min.x, min.y, max.z },
            { min.x, max.y, min.z },
            { min.x, max.y, max.z },
            { max.x, min.y, min.z },
            { max.x, min.y, max.z },
            { max.x, max.y, min.z },
            { max.x, max.y, max.z }
         };
         Vector3Df halfExtent;
         Vector3D halfExtentd;

         // Local
         center.Add(min, max);
         center.Scale(center, 0.5f);
         halfExtent.Subtract(max, min);
         halfExtent.Scale(halfExtent, 0.5f);
         radius = halfExtent.length;

         // World
         {
            Vector3D min { MAXFLOAT, MAXFLOAT, MAXFLOAT };
            Vector3D max { -MAXFLOAT, -MAXFLOAT, -MAXFLOAT };
            int c;
            for(c = 0; c<8; c++)
            {
               Vector3D point;
               point.MultMatrixf(points[c], matrix);

               if(point.x < min.x) min.x = point.x;
               if(point.y < min.y) min.y = point.y;
               if(point.z < min.z) min.z = point.z;

               if(point.x > max.x) max.x = point.x;
               if(point.y > max.y) max.y = point.y;
               if(point.z > max.z) max.z = point.z;
            }
            wmin = min;
            wmax = max;
         }
         wcenter.Add(wmin, wmax);
         wcenter.Scale(wcenter, 0.5f);

         halfExtentd.Subtract(wmax, wmin);
         halfExtentd.Scale(halfExtentd, 0.5);
         wradius = halfExtentd.length;
      }
   }

   void Duplicate(Object model)
   {
      if(model)
      {
         Object modelChild;

         name = model.name;
         flags = model.flags;
         flags.ownMesh = false;
         mesh = model.mesh;
         /*
         min = model.min;
         max = model.max;
         radius = model.radius;
         */
         transform = model.transform;

         for(modelChild = model.children.first; modelChild; modelChild = modelChild.next)
         {
            Object child { parent = this };
            child.Duplicate(modelChild);
            children.AddName(child);
         }
      }
   }

   void Free(DisplaySystem displaySystem)
   {
      if(this)
      {
         Object child;

         while((child = children.first))
         {
            children.Remove(child);
            child.Free(displaySystem);

            // We did not do this before so as to keep transform on reloading for new DisplaySystem
            // However since children are removed, it seems that purpose has been gone, we'd need
            // a new mechanism to handle lost resources reloading...
            delete child;
         }
         if(flags.ownMesh && mesh)
         {
            DisplaySystem meshDisplaySystem = mesh.displaySystem;
            mesh.Free(0);
            if(meshDisplaySystem)
               meshDisplaySystem.RemoveMesh(mesh);
            delete mesh;
         }

         tracks.Free(FrameTrack::Free);

         delete name;
      }
   }

   bool Load(char * fileName, char * type, DisplaySystem displaySystem)
   {
      char ext[MAX_EXTENSION];
      subclass(ObjectFormat) format;
      OldLink link;
      bool result = false;

      if(!type && fileName)
      {
         type = GetExtension(fileName, ext);
         strlwr(type);
      }

      for(link = class(ObjectFormat).derivatives.first; link; link = link.next)
      {
         format = link.data;
         if(format.extension && !strcmp(format.extension, type))
            break;
      }
      if(!link) format = null;

      if(format)
      {
         if((format.Load(this, fileName, displaySystem)))
            result = true;
      }
      /*if(!result)
          ErrorLogCode(GERR_LOAD_OBJECT_FAILED, fileName);*/
      return result;
   }

   void FreeMesh(DisplaySystem displaySystem)
   {
      if(this)
      {
         Object child;
         mesh.Free(0);
         for(child = children.first; child; child = child.next)
            child.FreeMesh(displaySystem);
      }
   }

   Object Find(char * name)
   {
      if(this && name)
      {
         Object child;

         if(this.name && !strcmp(this.name, name))
            return this;
         else
         {
            for(child = children.first; child; child = child.next)
            {
               Object result = child.Find(name);
               if(result)
                  return result;
            }
         }
      }
      return null;
   }

   void Initialize(void)
   {
      if(this)
      {
         transform.scaling = { 1, 1, 1 };
         transform.orientation = { 1,0,0,0 };
         flags.root = true;
         flags.transform = true;
         matrix.Identity();
      }
   }

   Mesh InitializeMesh(DisplaySystem displaySystem)
   {
      if(this)
      {
         flags.mesh = true;
         if(!mesh)
         {
            mesh = Mesh { };
            flags.ownMesh = true;
         }
         if(mesh)
         {
            FillBytes(mesh, 0, sizeof(class Mesh));
            displaySystem.AddMesh(mesh);
         }
         matrix.Identity();
         return mesh;
      }
      return null;
   }

   bool AddName(Object object, char * name)
   {
      bool result;
      if(this)
      {
         char * newName = CopyString(name);
         object.name = newName;
         result = children.AddName(object);
         if(result)
            object.parent = this;
         object.flags.transform = true;
      }
      return result;
   }

   // TODO: Add support to Merge Vertex Colors mesh feature
   bool Merge(DisplaySystem displaySystem)
   {
      bool result = false;

      if(!children.first)
         result = true;
      else
      {
         Object child, nextChild;
         int nVertices = 0;
         MeshFeatures flags = 0;
         Mesh objectMesh = mesh;
         bool freeMesh = this.flags.ownMesh;

         mesh = Mesh { };
         this.flags.ownMesh = true;
         this.flags.mesh = true;
         displaySystem.AddMesh(mesh);

         // Count total number of vertices
         if(objectMesh)
         {
            flags |= objectMesh.flags;
            nVertices += objectMesh.nVertices;
         }

         for(child = children.first; child; child = child.next)
         {
            child.Merge(displaySystem);
            if(child.mesh)
            {
               nVertices += child.mesh.nVertices;
               flags |= child.mesh.flags;
            }
         }

         if(mesh.Allocate(flags, nVertices, displaySystem))
         {
            int c;
            int nTriangles = 0;
            int vertexOffset = 0;
            PrimitiveGroup group = null;

            // Merge vertices

            nVertices = 0;
            if(objectMesh)
            {
               for(c = 0; c<objectMesh.nVertices; c++)
               {
                  mesh.vertices[nVertices] = objectMesh.vertices[c];

                  if(objectMesh.normals)
                     mesh.normals[nVertices] = objectMesh.normals[c];
                  if(objectMesh.texCoords)
                     mesh.texCoords[nVertices] = objectMesh.texCoords[c];

                  nVertices++;
               }
            }

            for(child = children.first; child; child = child.next)
            {
               Matrix matrix, normalMatrix;

               matrix.Identity();
               matrix.Scale(child.transform.scaling.x, child.transform.scaling.y, child.transform.scaling.z);

               matrix.Rotate(child.transform.orientation);

               normalMatrix = matrix;

               matrix.Translate(child.transform.position.x, child.transform.position.y, child.transform.position.z);
               if(child.mesh)
               {
                  for(c = 0; c<child.mesh.nVertices; c++)
                  {
                     mesh.vertices[nVertices].MultMatrix(child.mesh.vertices[c], matrix);
                     if(child.mesh.normals)
                        mesh.normals[nVertices].MultMatrix(child.mesh.normals[c], normalMatrix);
                     if(child.mesh.texCoords)
                        mesh.texCoords[nVertices] = child.mesh.texCoords[c];
                     nVertices++;
                  }
               }
            }

            // Merge Indexed Primitive Groups
            while(true)
            {
               int nIndices = 0;
               PrimitiveGroupType type;
               Material material = null;
               bool foundGroup = false;

               // Find first group type/material to process and determine how many indices are required
               if(objectMesh)
               {
                  for(group = objectMesh.groups.first; group; group = group.next)
                  {
                     if(!foundGroup && !(group.type.vertexRange))
                     {
                        if(!FindMaterialAndType(mesh, group.material, group.type))
                        {
                           material = group.material;
                           type = group.type;
                           nIndices += group.nIndices;
                           foundGroup = true;
                        }
                     }
                     else if(material == group.material && type == group.type)
                        nIndices += group.nIndices;
                  }
               }

               for(child = children.first; child; child = child.next)
               {
                  if(child.mesh)
                  {
                     for(group = child.mesh.groups.first; group; group = group.next)
                     {
                        if(!foundGroup && !(group.type.vertexRange))
                        {
                           if(!FindMaterialAndType(mesh, group.material ? group.material : child.material, group.type))
                           {
                              material = group.material ? group.material : child.material;
                              type = group.type;
                              nIndices += group.nIndices;
                              foundGroup = true;
                           }
                        }
                        else if(material == (group.material ? group.material : child.material) && type == group.type)
                           nIndices += group.nIndices;
                     }
                  }
               }

               // Merge with all similar groups
               if(foundGroup)
               {
                  PrimitiveGroup newGroup = mesh.AddPrimitiveGroup(type, nIndices);
                  if(newGroup)
                  {
                     newGroup.material = material;
                     nIndices = 0;

                     vertexOffset = 0;

                     if(objectMesh)
                     {
                        for(group = objectMesh.groups.first; group; group = group.next)
                        {
                           if(newGroup.material == group.material && newGroup.type == group.type)
                           {
                              int c;
                              for(c = 0; c<group.nIndices; c++)
                                 newGroup.indices[nIndices++] = group.indices[c] + (uint16)vertexOffset;
                           }
                        }
                        vertexOffset += objectMesh.nVertices;
                     }

                     for(child = children.first; child; child = child.next)
                     {
                        if(child.mesh)
                        {
                           for(group = child.mesh.groups.first; group; group = group.next)
                           {
                              if(newGroup.material == (group.material ? group.material : child.material) &&
                                 newGroup.type == group.type)
                              {
                                 int c;
                                 for(c = 0; c<group.nIndices; c++)
                                    newGroup.indices[nIndices++] = group.indices[c] + (uint16)vertexOffset;
                              }
                           }
                           vertexOffset += child.mesh.nVertices;
                        }
                     }
                     mesh.UnlockPrimitiveGroup(newGroup);
                  }
               }
               else
                  break;
            }

            // Merge Non-Indexed Primitive Groups
            vertexOffset = 0;

            if(objectMesh)
            {
               for(group = objectMesh.groups.first; group; group = group.next)
               {
                  if(group.type.vertexRange)
                  {
                     PrimitiveGroup newGroup = mesh.AddPrimitiveGroup(group.type, 0);
                     if(newGroup)
                     {
                        newGroup.material = group.material;
                        newGroup.nVertices = group.nVertices;
                        newGroup.first = group.first + vertexOffset;
                     }
                  }
               }
               vertexOffset += objectMesh.nVertices;
            }

            for(child = children.first; child; child = child.next)
            {
               if(child.mesh)
               {
                  for(group = child.mesh.groups.first; group; group = group.next)
                  {
                     if(group.type.vertexRange)
                     {
                        PrimitiveGroup newGroup = mesh.AddPrimitiveGroup(group.type, 0);
                        if(newGroup)
                        {
                           newGroup.material = group.material ? group.material : child.material;
                           newGroup.nVertices = group.nVertices;
                           newGroup.first = group.first + vertexOffset;
                        }
                     }
                  }
                  vertexOffset += child.mesh.nVertices;
               }
            }

            // Merge Triangles
            if(objectMesh)
               nTriangles = objectMesh.nPrimitives;

            for(child = children.first; child; child = child.next)
            {
               if(child.mesh)
                  nTriangles += child.mesh.nPrimitives;
            }
            mesh.primitives = new PrimitiveSingle[nTriangles];
            mesh.nPrimitives = 0;
            vertexOffset = 0;
            if(objectMesh)
            {
               for(c = 0; c<objectMesh.nPrimitives; c++)
               {
                  int i;
                  PrimitiveSingle * triangle = &mesh.primitives[mesh.nPrimitives++];

                  mesh.AllocatePrimitive(triangle, objectMesh.primitives[c].type, objectMesh.primitives[c].nIndices);
                  triangle->material = objectMesh.primitives[c].material;
                  triangle->middle = objectMesh.primitives[c].middle;
                  triangle->plane = objectMesh.primitives[c].plane;

                  memcpy(triangle->indices, objectMesh.primitives[c].indices, objectMesh.primitives[c].nIndices * sizeof(uint16));

                  /*
                  *triangle = objectMesh.primitives[c];
                  objectMesh.primitives[c].indices = null;
                  objectMesh.primitives[c].data = null;
                  */

                  for(i = 0; i<triangle->nIndices; i++)
                     triangle->indices[i] += (uint16)vertexOffset;
                  mesh.UnlockPrimitive(triangle);
               }
               vertexOffset += objectMesh.nVertices;
            }
            for(child = children.first; child; child = child.next)
            {
               if(child.mesh)
               {
                  for(c = 0; c<child.mesh.nPrimitives; c++)
                  {
                     int i;
                     PrimitiveSingle * triangle = &mesh.primitives[mesh.nPrimitives++];

                     mesh.AllocatePrimitive(triangle, child.mesh.primitives[c].type, child.mesh.primitives[c].nIndices);
                     triangle->material = child.mesh.primitives[c].material ? child.mesh.primitives[c].material : child.material;
                     triangle->middle = child.mesh.primitives[c].middle;
                     triangle->plane = child.mesh.primitives[c].plane;
                     memcpy(triangle->indices, child.mesh.primitives[c].indices, child.mesh.primitives[c].nIndices * sizeof(uint16));

                     /*
                     *triangle = child.mesh.primitives[c];
                     child.mesh.primitives[c].indices = null;
                     child.mesh.primitives[c].data = null;
                     */

                     for(i = 0; i<triangle->nIndices; i++)
                        triangle->indices[i] += (uint16)vertexOffset;
                     mesh.UnlockPrimitive(triangle);
                  }
                  vertexOffset += child.mesh.nVertices;
               }
            }

            // Free children
            for(child = children.first; child; child = nextChild)
            {
               nextChild = child.next;
               children.Remove(child);
               child.Free(displaySystem);
            }

            mesh.ApplyTranslucency(this);
            // this.flags.translucent = true;

            result = true;

            mesh.Unlock(flags);
         }
         if(freeMesh && objectMesh)
         {
            if(objectMesh.displaySystem)
               objectMesh.displaySystem.RemoveMesh(objectMesh);
            delete objectMesh;
         }
         SetMinMaxRadius(true);
      }
      return result;
   }

   void RotateEuler(Euler rotation, Euler min, Euler max)
   {
      // WARNING: 'eulerOrientation' is only updated by this function
      Euler euler = eulerOrientation;//transform.orientation;
      euler.Add(euler, rotation);

      if(min && max)
      {
         if(min.pitch && max.pitch)
            euler.pitch = Min(Max(euler.pitch, min.pitch), max.pitch);
         if(min.yaw && max.yaw)
            euler.yaw = Min(Max(euler.yaw, min.yaw), max.yaw);
         if(min.roll && max.roll)
            euler.roll = Min(Max(euler.roll, min.roll), max.roll);
      }

      eulerOrientation = euler;
      transform.orientation = euler;
      UpdateTransform();
   }

   void Move(Vector3D direction)
   {
      Matrix matrix;
      Vector3D offset;

      matrix.RotationQuaternion(transform.orientation);
      offset.MultMatrix(direction, matrix);
      transform.position.Add(transform.position, offset);
      UpdateTransform();
   }

   void UpdateTransform(void)
   {
      SetTransformDirty();
      _UpdateTransform();
      SetMinMaxRadius(false);
   }

   void Animate(unsigned int frame)
   {
      if(this && startFrame != endFrame)
      {
         while(frame < startFrame) frame += (endFrame - startFrame + 1);
         while(frame > endFrame)   frame -= (endFrame - startFrame + 1);

         this.frame = frame;
         _Animate(frame);
         _UpdateTransform();
         SetMinMaxRadius(false);
      }
   }

   void DoubleSided(bool flag)
   {
      if(this)
      {
         Object child;
         mesh.DoubleSided(flag);
         for(child = children.first; child; child = child.next)
            child.DoubleSided(flag);
      }
   }

   bool IntersectsGroundPolygon(int count, Pointf * pointfs)
   {
      bool result = false;

      Pointf * p1;
      Pointf * p2;
      double minX = wmin.x, maxX = wmax.x;
      double minY = wmin.z, maxY = wmax.z;
      double delta = (maxX - minX)/2;
      double x = (maxX + minX)/2, y = (maxY + minY)/2;
      int c;
      for(c = 0; c<count; c++)
      {
         double d;
         p1 = &pointfs[c];
         p2 = &pointfs[(c == count-1) ? 0 : (c+1)];

         if( (p1->x < minX) &&  (p2->x < minX) )
         {
            if((p1->y <= y) && (p2->y >  y) )
               result ^= true;
            else if( (p1->y >  y) && (p2->y <= y) )
               result ^= true;
         }
         else if(!((p1->x > maxX && p2->x > maxX) || (p1->y < minY && p2->y < minY) || (p1->y > maxY && p2->y > maxY)))
         {
            if(p1->y == p2->y)
            {
               d = y - p1->y;
               if (d < 0) d = -d;
               if (d < delta) return true;
            }
            else if(p1->x == p2->x)
            {
               d = x - p1->x;
               if(d < 0) d = -d;
               if(d < delta) return true;
               else if(p1->x > x) ;
               else if( (p1->y <= y) && (p2->y >  y) )
                  result ^= true;
               else if( (p1->y >  y) && (p2->y <= y) )
                  result ^= true;
            }
            else
            {
               float a, b, dy, dx;

               a = p2->y - p1->y;
               b = p1->x - p2->x;
               dy =  a;
               dx = -b;
               d = a * x + b * y + (p2->x * p1->y) - (p2->y * p1->x);
               if (a < 0) a = -a;
               if (b < 0) b = -b;
               if (d < 0) d = -d;

               if(d < a * delta)
                  return true;
               else if (d < b * delta)
                  return true;
               else if( ( (p1->y <= y) && (p2->y >  y) ) || ( (p1->y >  y) && (p2->y <= y) ) )
               {
                  double xdy;

                  xdy = (dx * (y - p1->y)) + (dy * p1->x);
                  if(dy < 0)
                  {
                     if(xdy > x * dy)
                        result ^= true;
                  }
                  else if(xdy < x * dy)
                     result ^= true;
               }
            }
         }
      }
      return result;
   }

   property Transform transform { set { transform = value; eulerOrientation = transform.orientation; } get { value = transform; } };
   property Material material { set { material = value; } get { return material; } };
   property Vector3Df max { get { value = max; } };
   property Vector3Df min { get { value = min; } };
   property Vector3Df center { get { value = center; } };
   property float radius { get { return radius; } };

   property Vector3D wmax { get { value = wmax; } };
   property Vector3D wmin { get { value = wmin; } };
   property Vector3D wcenter { get { value = wcenter; } };
   property double wradius { get { return wradius; } };

   property void * tag { set { tag = value; } get { return tag; } };
   property int frame { set { Animate(value); } get { return frame; } };
   property int startFrame { set { startFrame = value; } get { return startFrame; } };
   property int endFrame { set { endFrame = value; } get { return endFrame; } };

   property Mesh mesh { set { mesh = value; } get { return mesh; } };
   property Camera camera { get { return camera; } }; // Fix this with inheritance? camera inherit from Object?
   property Object firstChild { get { return children.first; } };
   property Object next { get { return next; } };
   property char * name { get { return name; } };
   property Matrix matrix { get { value = matrix; } };
   property Object cameraTarget { set { cameraTarget = value; } get { return cameraTarget; } };
   property OldList * tracks { /* set { tracks = value; } */ get { return &tracks; } };
   property ObjectFlags flags { set { flags = value; } get { return flags; } };

private:
   Object()
   {
      children.offset = (uint)&((Object)0).prev;
      transform.scaling = { 1, 1, 1 };
      transform.orientation = { 1,0,0,0 };
      flags.transform = true;
   }

   ~Object()
   {
      Free(null);
   }

   void SetTransformDirty()
   {
      Object child;
      flags.transform = true;
      for(child = children.first; child; child = child.next)
         child.SetTransformDirty();
   }

   void _UpdateTransform()
   {
      if(flags.transform)
      {
         Object child;
         Matrix matrix;

         // Cameras / Spot Lights must update their target first
         if(flags.camera && cameraTarget && cameraTarget.flags.transform)
            cameraTarget.UpdateTransform();
         else if(flags.light && light.flags.spot && light.target.flags.transform)
            light.target._UpdateTransform();

         if(flags.camera && cameraTarget)
         {
            // DeterMine angle to look at target
            Vector3D position, direction;
            if(flags.root || !parent)
               position = transform.position;
            else
               position.MultMatrix(transform.position, parent.matrix);

            direction.Subtract((Vector3D *)cameraTarget.matrix.m[3], position);
            transform.orientation.RotationDirection(direction);

            // Add the roll
            transform.orientation.RotateRoll(roll);
         }

         if(flags.light && light.flags.spot)
         {
            // DeterMine angle to look at target
            Vector3D position;
            if(flags.root || !parent)
               position = transform.position;
            else
               position.MultMatrix(transform.position, parent.matrix);

            light.direction.Subtract((Vector3D *) light.target.matrix.m[3], position);
            light.direction.Normalize(light.direction);
            transform.orientation.RotationDirection(light.direction);
         }

         matrix.Identity();
         matrix.Scale(transform.scaling.x, transform.scaling.y, transform.scaling.z);
         matrix.Rotate(transform.orientation);
         matrix.Translate(transform.position.x, transform.position.y, transform.position.z);

         localMatrix = matrix;

         // Compute transform (with ancestors)
         if(flags.root || !parent)
            this.matrix = matrix;
         else
            this.matrix.Multiply(matrix, parent.matrix);

         flags.transform = false;

         for(child = children.first; child; child = child.next)
         {
            if(child.flags.transform)
               child._UpdateTransform();
         }
      }
   }

   void _Animate(unsigned int frame)
   {
      Object child;
      FrameTrack track;

      for(track = tracks.first; track; track = track.next)
      {
         unsigned int c;

         if(track.numKeys)
         {
            unsigned int prev = 0, next = track.numKeys - 1;
            FrameKey * prevKey = &track.keys[prev], * nextKey = &track.keys[next];
            float t = 0;

            for(c = 0; c<track.numKeys; c++)
            {
               FrameKey * key = track.keys + c;
               if(key->frame <= frame) { prevKey = key; prev = c; }
               if(key->frame >= frame) { nextKey = key; next = c; break; }
            }

            if(nextKey->frame != prevKey->frame)
               t = ease((float) (frame - prevKey->frame) / (nextKey->frame - prevKey->frame), prevKey->easeFrom, nextKey->easeTo);

            switch(track.type.type)
            {
               case position:
               {
                  Vector3Df position;
                  track.Interpolate(position, prevKey->position, nextKey->position, prev, next, t);
                  transform.position = { (double)position.x, (double)position.y, (double)position.z };
                  break;
               }
               case scaling:
                  track.Interpolate(transform.scaling, prevKey->scaling, &nextKey->scaling, prev, next, t);
                  break;
               case rotation:
                  track.InterpolateQuat(transform.orientation, prevKey->orientation, nextKey->orientation, prev, next, t);
                  break;
               // Cameras
               case roll:
                  roll = track.InterpolateFloat(prevKey->roll, nextKey->roll, prev, next, t);
                  break;
               case fov:
               {
                  camera.fov = track.InterpolateFloat(prevKey->fov, nextKey->fov, prev, next, t);
                  /*
                  double mm = (camera.fov - 5.05659508373109) / 1.13613250717301;
                  camera.fov = 1248.58921609766 * pow(mm, -0.895625414990581);
                  */
                  //camera.Setup(camera.width, camera.height, camera.origin);
                  break;
               }
               // Lights
               case colorChange:
               {
                  track.Interpolate((Vector3Df *)&light.diffuse,
                     (Vector3Df *)&prevKey->color, (Vector3Df *)&nextKey->color, prev, next, t);
                  light.specular = light.diffuse;
                  break;
               }
               case fallOff:
               {
                  light.fallOff = track.InterpolateFloat(prevKey->fallOff, nextKey->fallOff, prev, next, t);
                  break;
               }
               case hotSpot:
               {
                  light.hotSpot = track.InterpolateFloat(prevKey->hotSpot, nextKey->hotSpot, prev, next, t);
                  break;
               }
            }
         }
      }

      for(child = children.first; child; child = child.next)
         child._Animate(frame);

      flags.transform = true;
   }

   // Private for now
   FrustumPlacement InsideFrustum(Plane * planes)
   {
      FrustumPlacement result = inside;

      int p;
      // First test: Sphere
      for(p = 0; p<6; p++)
      {
         Plane * plane = &planes[p];
         double dot = plane->normal.DotProduct(wcenter);
         double distance = dot + plane->d;
         if(distance < -wradius)
         {
            result = outside;
            break;
         }
         if(Abs(distance) < wradius)
            result = intersecting;
      }

      if(result == intersecting)
      {
         // Second test: Bounding Box
         Vector3D box[8] =
         {
            { wmin.x, wmin.y, wmin.z },
            { wmin.x, wmin.y, wmax.z },
            { wmin.x, wmax.y, wmin.z },
            { wmin.x, wmax.y, wmax.z },
            { wmax.x, wmin.y, wmin.z },
            { wmax.x, wmin.y, wmax.z },
            { wmax.x, wmax.y, wmin.z },
            { wmax.x, wmax.y, wmax.z }
         };
   	   int numPlanesAllIn = 0;
         for(p = 0; p < 6; p++)
         {
            Plane * plane = &planes[p];
            int i;
            int numGoodPoints = 0;
            for(i = 0; i < 8; ++i)
            {
               double dot = plane->normal.DotProduct(box[i]);
               double distance = dot + plane->d;
   			   if(distance > -1)
                  numGoodPoints++;
   		   }
   		   if(!numGoodPoints)
            {
               result = outside;
               break;
            }
            if(numGoodPoints == 8)
               numPlanesAllIn++;
   	   }
   	   if(numPlanesAllIn == 6)
   		   result = inside;
      }
      return result;
   }

   Object prev, next;
   char * name;
   Object parent;
   OldList children;

   ObjectFlags flags;

   OldList tracks;
   unsigned startFrame, endFrame;
   int frame;
   Vector3Df pivot;
   Transform transform;
   Matrix matrix;
   Matrix localMatrix;
   void * tag;
   Vector3Df min, max, center;
   Vector3D wmin, wmax, wcenter;

   bool volume;
   float radius;
   double wradius;
   ColorRGB ambient;

   /*public */union
   {
      // Mesh
      struct
      {
         Mesh mesh;
         Material material;
      };

      // Light
      Light light;

      // Camera
      struct
      {
         Camera camera;
         Object cameraTarget;
         double roll;
      };
   };

   public property Light light
   {
      set
      {
         light = value;
      }
      get
      {
         value = light;
      }
   }

   Euler eulerOrientation;
};
