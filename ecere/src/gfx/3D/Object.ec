namespace gfx3D;

#if defined(__linux__) && !defined(__ANDROID__) && !defined(__EMSCRIPTEN__) && !defined(__i386__)
asm(".symver pow,pow@GLIBC_2.2.5");
#endif

import "Display"

public enum FrustumPlacement { outside, inside, intersecting };

public class ObjectFormat
{
public:  // Lack of public here causes strange errors defining multiple foramts in same file and invoking Load
   class_data const char * extension;
   class_property const char * extension
   {
      set { class_data(extension) = value; }
      get { return class_data(extension); }
   }

   virtual bool ::Load(Object object, const char * fileName, DisplaySystem displaySystem, void * options);
   virtual bool ::Save(Object object, const char * fileName, void * options);
   virtual Array<String> ::listTextures(File f, const char * fileName, void * options);
};

// TODO: Review these:
public class ObjectFlags
{
public:
   bool root:1, viewSpace:1, ownMesh:1, translucent:1, flipWindings:1, keysLoaded:1, transform:1, mesh:1, light:1, camera:1, localMatrixSet:1;
   bool computeLightVectors:1, skinApplied:1, hide:1, skeleton:1, bone:1;
   int hierarchy:16:16;
};

public struct Transform
{
   Vector3D position;
   Quaternion orientation;
   Vector3Df scaling;

   void getMatrix3x4f(float m[12])
   {
      Quaternion q = orientation;
      Vector3Df s = scaling;
      double xx = q.x*q.x, yy = q.y*q.y, zz = q.z*q.z;
      double xy = q.x*q.y, xz = q.x*q.z, yz = q.y*q.z;
      double wx = q.w*q.x, wy = q.w*q.y, wz = q.w*q.z;

      m[ 0] = (float)(s.x * (1 - 2 * ( yy + zz )));
      m[ 1] = (float)(s.x * (    2 * ( xy - wz )));
      m[ 2] = (float)(s.x * (    2 * ( xz + wy )));

      m[ 3] = (float)(s.y * (    2 * ( xy + wz )));
      m[ 4] = (float)(s.y * (1 - 2 * ( xx + zz )));
      m[ 5] = (float)(s.y * (    2 * ( yz - wx )));

      m[ 6] = (float)(s.z * (    2 * ( xz - wy )));
      m[ 7] = (float)(s.z * (    2 * ( yz + wx )));
      m[ 8] = (float)(s.z * (1 - 2 * ( xx + yy )));

      m[ 9] = (float)position.x;
      m[10] = (float)position.y;
      m[11] = (float)position.z;
   }

   property Matrix
   {
      set
      {
         Vector3D s;
         Matrix r;
         // bool flipWindings = Sgn(s.x) * Sgn(s.y) * Sgn(s.z) < 0;
         value.extractScaling(r, s);
         scaling = { (float)s.x, (float)s.y, (float)s.z };
         orientation = r.orientation;
         position = value.translation;
      }
      get
      {
         double * m = value.array;
         Quaternion q = orientation;
         Vector3Df s = scaling;
         double xx = q.x*q.x, yy = q.y*q.y, zz = q.z*q.z;
         double xy = q.x*q.y, xz = q.x*q.z, yz = q.y*q.z;
         double wx = q.w*q.x, wy = q.w*q.y, wz = q.w*q.z;

         m[ 0] = s.x * (1 - 2 * ( yy + zz ));
         m[ 1] = s.x * (    2 * ( xy - wz ));
         m[ 2] = s.x * (    2 * ( xz + wy ));
         m[ 3] = 0;

         m[ 4] = s.y * (    2 * ( xy + wz ));
         m[ 5] = s.y * (1 - 2 * ( xx + zz ));
         m[ 6] = s.y * (    2 * ( yz - wx ));
         m[ 7] = 0;

         m[ 8] = s.z * (    2 * ( xz - wy ));
         m[ 9] = s.z * (    2 * ( yz + wx ));
         m[10] = s.z * (1 - 2 * ( xx + yy ));
         m[11] = 0;

         m[12] = position.x;
         m[13] = position.y;
         m[14] = position.z;
         m[15] = 1;
      }
   }
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

public enum FrameTrackType : uint16 { position = 1, rotation, scaling, fov, roll, colorChange, morph, hotSpot, fallOff, hide, rYaw, rPitch, rRoll };

public class FrameTrackBits : uint32
{
public:
   FrameTrackType type:16;
   bool loop:1;
   EulerRotationOrder rotationOrder:8;
};

public struct FrameKey
{
   uint frame;
   float tension, continuity, bias;
   float easeFrom, easeTo;
   union
   {
      Vector3Df position;        // TOCHECK: Should this be made a Vector3D?
      Quaternion orientation;
      Vector3Df scaling;
      float roll;
      float fov;
      ColorRGB color;
      float hotSpot;
      float fallOff;
      float weight;
      bool hide;
   };
};

enum SplinePart { splinePoint, splineA, splineB };

public class FrameTrack : struct
{
   FrameTrack prev, next;
public:
   FrameTrackBits type;
   uint numKeys;
   FrameKey * keys;
   int morphIndex;

private:
   void Free(void)
   {
      delete keys;
   }

   ~FrameTrack()
   {
      Free();
   }

   // REVIEW: This method does not use the key setting for angles?
   float GetAngle(SplinePart what, unsigned int n)
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
               //value *= 1.0f - kn->tension;
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

               a1 = GetAngle(splineA, 1);
               a1 *= 0.5f;

               value -= a1;
               value *= 1.0f;// - kn->tension;
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
               value *= 1.0f;// - kn->tension;
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
               value *= 1.0f;// - kn->tension;
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
            float /*C, */adjust;
            float part1, part2;

            pn_1 = kn_1->roll;
            pn1 = kn1->roll;

            if(what == splineA)
            {
               //C = kn->continuity;
               adjust = (float)d1;
            }
            else
            {
               //C = -kn->continuity;
               adjust = (float)d2;
            }
            adjust /= d1 + d2;
            adjust = 0.5f /*+ (1.0f - Abs(C))*/*(adjust - 0.5f);

            part1 = pn - pn_1;
            part1 *= (1.0f /*+ kn->bias*/)*(1.0f /*- C*/);

            part2 = pn1 - pn;
            part2 *= (1.0f /*- kn->bias*/)*(1.0f /*+ C*/);

            value = part1 + part2;
            value *= (1.0f/* - kn->tension*/)*adjust;
         }
      }
      return value;
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

   float InterpolateAngle(float prevValue, float nextValue, int prev, int next, float t)
   {
      float value;
      if(!t)
         value = prevValue;
      else
      {
         float p1 = prevValue, p2 = nextValue;

         float r1 = GetAngle(splineB, prev);
         float r2 = GetAngle(splineA, next);


         if(p2 - p1 > 180)
            p2 -= 360;
         else if(p2 - p1 < -180)
            p2 += 360;

         p1 *= 2*t*t*t - 3*t*t + 1;
         p2 *= -2*t*t*t + 3*t*t;

         r1 *= t*t*t - 2*t*t + t;
         r2 *= t*t*t -   t*t;

         value = p1 + r1 + p2 + r2;

         //value = p1 * (1-t) + p2 * (t);
         //value = p1 + (p2-p1) * t;
      }
      return value;
   }

   bool InterpolateBool(bool prevValue, bool nextValue, int prev, int next, float t)
   {
      return t < 1.0 ? prevValue : nextValue;
   }
};

struct MaterialAndType
{
   Material material;
   PrimitiveGroupType type;

   int OnCompare(MaterialAndType b)
   {
      if((uintptr)material < (uintptr)b.material) return -1;
      if((uintptr)material > (uintptr)b.material) return  1;
      if(type < b.type) return -1;
      if(type > b.type) return  1;
      return 0;
   }
};

static int compareGroupMaterial(PrimitiveGroup a, PrimitiveGroup b, void * data)
{
   uintptr ma = (uintptr)a.material, mb = (uintptr)b.material;
   if(ma < mb) return -1;
   if(ma > mb) return  1;
   return 0;
}

static bool FindMaterialAndType(Map<MaterialAndType, PrimitiveGroup> map, Mesh mesh, Material material, PrimitiveGroupType type)
{
   if(map.GetAtPosition({ material, type }, false, null))
   {
      return true;
   }
   /*
   PrimitiveGroup group;
   for(group = mesh.groups.first; group; group = group.next)
      if(group.material == material && group.type == type)
         return true;
   */
   return false;
}

public class Object : struct
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
      Duplicate2(model, false);
   }

   void Duplicate2(Object model, bool takeOwnership)
   {
      if(model)
      {
         Object modelChild;
         FrameTrack t;

         startFrame = model.startFrame;
         endFrame = model.endFrame;
         for(t = model.tracks->first; t; t = t.next)
         {
            FrameTrack track { type = t.type, numKeys = t.numKeys };
            track.keys = new FrameKey[t.numKeys];
            memcpy(track.keys, t.keys, sizeof(FrameKey) * t.numKeys);
            AddFrameTrack(track);
         }

         name = CopyString(model.name);
         flags = model.flags;
         if(flags.ownMesh)
         {
            if(takeOwnership)
               model.flags.ownMesh = false;
            else
               flags.ownMesh = false;
         }
         flags.transform = false;
         mesh = model.mesh;
         /*
         min = model.min;
         max = model.max;
         radius = model.radius;
         */
         if(parent && !flags.root)
            matrix.Multiply(localMatrix, parent.matrix);
         else
            matrix = localMatrix;

         for(modelChild = model.children.first; modelChild; modelChild = modelChild.next)
         {
            Object child { parent = this };
            child.localMatrix = modelChild.localMatrix;
            child.transform = modelChild.transform;
            child.Duplicate2(modelChild, takeOwnership);
            children.AddName(child);
         }
      }
   }

   void Free(const DisplaySystem displaySystem)
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
            //DisplaySystem meshDisplaySystem = mesh.displaySystem;
            mesh.Free(0);
            /*
            if(meshDisplaySystem)
               meshDisplaySystem.RemoveMesh(mesh);
            */
            delete mesh;
         }

         tracks.Free(FrameTrack::Free);

         delete name;
      }
   }

   Array<String> ::listTextures(File file, const char * fileName, const char * type, void * options)
   {
      char ext[MAX_EXTENSION];
      subclass(ObjectFormat) format;
      OldLink link;
      Array<String> textures = null;

      if(!type && fileName)
         type = strlwr(GetExtension(fileName, ext));

      for(link = class(ObjectFormat).derivatives.first; link; link = link.next)
      {
         format = link.data;
         if(format.extension && !strcmp(format.extension, type))
            break;
      }
      if(!link) format = null;

      if(format)
         textures = format.listTextures(file, fileName, options);
      return textures;
   }

   bool Load(const char * fileName, const char * type, DisplaySystem displaySystem)
   {
       return LoadEx(fileName, type, displaySystem, null);
   }

   bool LoadEx(const char * fileName, const char * type, DisplaySystem displaySystem, void * options)
   {
      char ext[MAX_EXTENSION];
      subclass(ObjectFormat) format;
      OldLink link;
      bool result = false;

      if(!type && fileName)
         type = strlwr(GetExtension(fileName, ext));

      for(link = class(ObjectFormat).derivatives.first; link; link = link.next)
      {
         format = link.data;
         if(format.extension && type && !strcmp(format.extension, type))
            break;
      }
      if(!link) format = null;

      if(format)
      {
         if((format.Load(this, fileName, displaySystem, options)))
            result = true;
      }
      /*if(!result)
          ErrorLogCode(GERR_LOAD_OBJECT_FAILED, fileName);*/
      return result;
   }

   bool Save(const char * fileName, const char * type)
   {
      return SaveEx(fileName, type, null);
   }

   bool SaveEx(const char * fileName, const char * type, void * options)
   {
      char ext[MAX_EXTENSION];
      subclass(ObjectFormat) format;
      OldLink link;
      bool result = false;

      if(!type && fileName)
         type = strlwr(GetExtension(fileName, ext));

      for(link = class(ObjectFormat).derivatives.first; link; link = link.next)
      {
         format = link.data;
         if(format.extension && !strcmp(format.extension, type))
            break;
      }
      if(!link) format = null;

      if(format)
      {
         if((format.Save(this, fileName, options)))
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

   Object Find(const char * name)
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
               if(result) return result;
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
            //displaySystem.AddMesh(mesh);
         }
         matrix.Identity();
         return mesh;
      }
      return null;
   }

   bool AddName(Object object, const char * name)
   {
      bool result = false;
      if(this)
      {
         char * newName = CopyString(name);
#ifdef _DEBUG
         if(object.name)
            PrintLn("WARNING: Adding object with name.");
#endif
         *&object.name = newName;
         result = children.AddName(object);
         if(result)
            object.parent = this;
         object.flags.transform = true;
         object.flags.root = false;
      }
      return result;
   }

   void Add(Object object)
   {
      if(this)
      {
#ifdef _DEBUG
         if(object.name)
            PrintLn("WARNING: Adding object with name.");
#endif
         children.Add(object);
         object.parent = this;
         object.flags.transform = true;
         object.flags.root = false;
      }
   }

   void AddFrameTrack(FrameTrack track)
   {
      tracks.Add(track);
   }

   void Remove(Object child)
   {
      if(this && child && child.parent == this)
      {
         children.Remove(child);
         child.parent = null;
      }
   }

   void Delete(Object child, DisplaySystem displaySystem)
   {
      if(this)
      {
         children.Remove(child);
         child.Free(displaySystem);
         delete child;
      }
   }

   bool Merge(DisplaySystem displaySystem)
   {
      return _Merge(displaySystem,
         { vertices = true, texCoords1 = true, normals = true,
           tangents = true, colors = true, lightVectors = true },
         true);
   }

   bool MergeEx(DisplaySystem displaySystem, MeshFeatures deleteCPUAttrOptions)
   {
      return _Merge(displaySystem, deleteCPUAttrOptions, true);
   }

   // TODO: Add support to Merge Vertex Colors mesh feature
   private bool _Merge(DisplaySystem displaySystem, MeshFeatures deleteCPUAttrOptions, bool lastLevel)
   {
      bool result = false;

      if(!children.first && (!this.flags.mesh || this.flags.ownMesh))
         result = true;
      else
      {
         Object child, nextChild;
         int nVertices = 0;
         MeshFeatures flags = 0;
         Mesh objectMesh = this.flags.mesh ? mesh : null;
         bool freeMesh = this.flags.ownMesh;
         Map<MaterialAndType, PrimitiveGroup> map { };
         bool canMerge = true;

         // Count total number of vertices
         if(objectMesh)
         {
            flags |= objectMesh.flags;
            nVertices += objectMesh.nVertices;
         }

         for(child = children.first; child; child = child.next)
         {
            child._Merge(displaySystem, deleteCPUAttrOptions, false);
            if(child.flags.mesh && child.mesh)
            {
               nVertices += child.mesh.nVertices;
               flags |= child.mesh.flags;
               this.flags.computeLightVectors |= child.flags.computeLightVectors;

               if(nVertices > 65535 ||
                  fabs(child.localMatrix.m[3][0]) > 400 ||
                  fabs(child.localMatrix.m[3][1]) > 400 ||
                  fabs(child.localMatrix.m[3][2]) > 400)
                  canMerge = false;
            }
            else if(child.children.count)
               canMerge = false;
         }
         if(!canMerge)
         {
            Object next;
#ifdef _DEBUG
            printf("WARNING: More than 64k vertices or translation > 400 -- not merging\n");
#endif
            for(child = children.first; child; child = next)
            {
               next = child.next;
               if(child.flags.mesh && child.mesh)
               {
                  PrimitiveGroup group;
                  Mesh mesh = child.mesh;
                  int i;
                  if(!mesh.displaySystem && displaySystem)
                  {
                     mesh.driver = displaySystem.driver;
                     mesh.displaySystem = displaySystem;
                     for(i = 0; i < mesh.nPrimitives; i++)
                        mesh.UnlockPrimitive(mesh.primitives[i]);
                     for(group = mesh.groups.first; group; group = group.next)
                     {
                        if(!(group.type.vertexRange))
                        {
                           // FIXME: GL driver specifics -- Should no longer need this; Should be able to merge now with baseVertex
#if !defined(ECERE_NOGL)
                           OGLIndices oglIndices { nIndices = group.nIndices };
                           group.data = oglIndices;
#endif
                        }
                        mesh.UnlockPrimitiveGroup(group);
                     }
                     mesh.Unlock(0);

                     mesh.FreeCPUVertexAttributes(deleteCPUAttrOptions & ~MeshFeatures { normals = this.flags.computeLightVectors });
                  }
               }
               if(child.children.count)
               {
                  Object c, n;
                  for(c = child.children.first; c; c = n)
                  {
                     n = c.next;
                     if(child.transform.position.x == 0 &&
                        child.transform.position.y == 0 &&
                        child.transform.position.z == 0 &&
                        c.transform.position.x == 0 &&
                        c.transform.position.y == 0 &&
                        c.transform.position.z == 0) /* &&
                        c.transform.orientation.x == 0 &&
                        c.transform.orientation.y == 0 &&
                        c.transform.orientation.z == 0 &&
                        c.transform.scaling.x == 1 &&
                        c.transform.scaling.y == 1 &&
                        c.transform.scaling.z == 1)*/
                     {
                        Quaternion angle;
                        Matrix m;
                        m.Multiply(c.localMatrix, child.localMatrix);
                        angle.Multiply(c.transform.orientation, child.transform.orientation);

                        child.children.Remove(c);
                        Add(c);
                        c.localMatrix = m;
                        c.flags.localMatrixSet = true;
                        c.UpdateTransform();
                     }
                  }
                  if(!child.children.count && !child.flags.mesh)
                  {
                     children.Remove(child);
                     delete child;
                  }
               }
            }
            delete map;
            return false;
         }

         if(!nVertices)
         {
            delete map;
            return true;
         }

         if(this.flags.camera)
            delete camera;

         mesh = Mesh { };
         this.flags.ownMesh = true;
         this.flags.mesh = true;
         //displaySystem.AddMesh(mesh);

         if(mesh.Allocate(flags, nVertices, lastLevel ? displaySystem : null))
         {
            int c;
            int nTriangles = 0;
            int vertexOffset = 0;
            PrimitiveGroup group = null;

            nVertices = 0;

            // Merge vertices
            if(objectMesh)
            {
               int mnVertices = objectMesh.nVertices;
               if(flags.interleaved)
                  memcpy(mesh.vertices, objectMesh.vertices, mnVertices * 8 * sizeof(float));
               else
               {
                  memcpy(mesh.vertices, objectMesh.vertices, mnVertices * sizeof(Vector3Df));
                  if(objectMesh.normals)
                     memcpy(mesh.normals, objectMesh.normals, mnVertices * sizeof(Vector3Df));
                  if(objectMesh.tangents)
                     memcpy(mesh.tangents, objectMesh.tangents, 2* mnVertices * sizeof(Vector3Df));
                  if(objectMesh.texCoords)
                     memcpy(mesh.texCoords, objectMesh.texCoords, mnVertices * sizeof(Pointf));
               }

               nVertices += mnVertices;
            }

            for(child = children.first; child; child = child.next)
            {
               Matrix matrix, normalMatrix;

               matrix = child.localMatrix;
               /*
               matrix.Identity();
               matrix.Scale(child.transform.scaling.x, child.transform.scaling.y, child.transform.scaling.z);
               matrix.Rotate(child.transform.orientation);
               */

               normalMatrix = matrix;

               normalMatrix.m[3][0] = 0;
               normalMatrix.m[3][1] = 0;
               normalMatrix.m[3][2] = 0;

               // matrix.Translate(child.transform.position.x, child.transform.position.y, child.transform.position.z);

               if(child.flags.mesh && child.mesh)
               {
                  Vector3Df * mVertices = mesh.vertices;
                  Vector3Df * cVertices = child.mesh.vertices;
                  Vector3Df * mTangents = mesh.tangents;
                  Vector3Df * cTangents = child.mesh.tangents;
                  int cCount = child.mesh.nVertices;

                  if(flags.interleaved)
                  {
                     for(c = 0; c < cCount; c++)
                     {
                        float * mv = ((float *)mVertices) + nVertices * 8;
                        float * cv = ((float *)cVertices) + c * 8;

                        memcpy(mv + 6, cv + 6, sizeof(Pointf));
                        ((Vector3Df *)mv)->MultMatrix((Vector3Df *)cv, matrix);
                        ((Vector3Df *)(mv + 3))->MultMatrix((Vector3Df *)(cv + 3), matrix);
                        if(cTangents)
                        {
                           mTangents[2*nVertices+0].MultMatrix(cTangents[2*c+0], normalMatrix);
                           mTangents[2*nVertices+1].MultMatrix(cTangents[2*c+1], normalMatrix);
                        }
                        nVertices++;
                     }
                  }
                  else
                  {
                     Vector3Df * mNormals = mesh.normals;
                     Pointf * mTexCoords = mesh.texCoords;
                     Vector3Df * cNormals = child.mesh.normals;
                     Pointf * cTexCoords = child.mesh.texCoords;

                     if(cTexCoords)
                        memcpy(mTexCoords + nVertices, cTexCoords, sizeof(Pointf) * cCount);
                     for(c = 0; c < cCount; c++)
                     {
                        mVertices[nVertices].MultMatrix(cVertices[c], matrix);
                        if(cNormals)
                           mNormals[nVertices].MultMatrix(cNormals[c], normalMatrix);
                        if(cTangents)
                        {
                           mTangents[2*nVertices+0].MultMatrix(cTangents[2*c+0], normalMatrix);
                           mTangents[2*nVertices+1].MultMatrix(cTangents[2*c+1], normalMatrix);
                        }
                        nVertices++;
                     }
                  }
               }
            }

            // Merge Indexed Primitive Groups
            while(true)
            {
               int nIndices = 0;
               PrimitiveGroupType type = (PrimitiveGroupType)-1;
               Material material = null;
               bool foundGroup = false;

               // Find first group type/material to process and determine how many indices are required
               if(objectMesh)
               {
                  for(group = objectMesh.groups.first; group; group = group.next)
                  {
                     if(!foundGroup && !(group.type.vertexRange))
                     {
                        // TOCHECK: There might be a much more efficent way to do this?
                        if(!FindMaterialAndType(map, mesh, group.material, group.type))
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
                  if(child.flags.mesh && child.mesh)
                  {
                     for(group = child.mesh.groups.first; group; group = group.next)
                     {
                        if(!foundGroup && !(group.type.vertexRange))
                        {
                           if(!FindMaterialAndType(map, mesh, group.material ? group.material : child.material, group.type))
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
                  // FIXME: This doesn't work with sharedIndices
                  PrimitiveGroup newGroup = mesh.AddPrimitiveGroup(type, nIndices);
                  MapIterator<MaterialAndType, PrimitiveGroup> it { map = map };
                  if(newGroup)
                  {
                     if(!it.Index({ material, type }, true))
                        it.data = newGroup;

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
                              if(group.type.indices32bit)
                              {
                                 uint32 * indices32 = group.indices32 ? group.indices32 : mesh.indices + group.baseIndexMesh;
                                 for(c = 0; c<group.nIndices; c++)
                                    newGroup.indices32[nIndices++] = indices32[c] + vertexOffset;
                              }
                              else
                              {
                                 uint16 * indices = group.indices;
                                 for(c = 0; c<group.nIndices; c++)
                                    newGroup.indices[nIndices++] = (uint16)(indices[c] + vertexOffset);
                              }
                           }
                        }
                        vertexOffset += objectMesh.nVertices;
                     }

                     for(child = children.first; child; child = child.next)
                     {
                        if(child.flags.mesh && child.mesh)
                        {
                           for(group = child.mesh.groups.first; group; group = group.next)
                           {
                              if(newGroup.material == (group.material ? group.material : child.material) &&
                                 newGroup.type == group.type)
                              {
                                 int c;
                                 if(group.type.indices32bit)
                                 {
                                    uint32 * indices32 = group.indices32 ? group.indices32 : mesh.indices + group.baseIndexMesh;
                                    for(c = 0; c<group.nIndices; c++)
                                       newGroup.indices32[nIndices++] = indices32[c] + vertexOffset;
                                 }
                                 else
                                 {
                                    uint16 * indices = group.indices;
                                    for(c = 0; c<group.nIndices; c++)
                                       newGroup.indices[nIndices++] = (uint16)(indices[c] + vertexOffset);
                                 }
                              }
                           }
                           vertexOffset += child.mesh.nVertices;
                        }
                     }
                     if(lastLevel)
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
               if(child.flags.mesh && child.mesh)
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
               if(child.flags.mesh && child.mesh)
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
                  PrimitiveSingle * src = &objectMesh.primitives[c];

                  mesh.AllocatePrimitive(triangle, src->type, src->nIndices);
                  triangle->material = src->material;
                  triangle->middle = src->middle;
                  triangle->plane = src->plane;

                  //*triangle = *src;
                  //src->indices = null;
                  //src->data = null;

                  if(triangle->type.indices32bit)
                  {
                     uint32 * indices32 = src->indices32 ? src->indices32 : mesh.indices + src->baseIndexMesh;
                     for(i = 0; i<triangle->nIndices; i++)
                        triangle->indices32[i] = indices32[i] + vertexOffset;
                  }
                  else
                  {
                     uint16 * indices = src->indices;
                     for(i = 0; i<triangle->nIndices; i++)
                        triangle->indices[i] = (uint16)(indices[i] + vertexOffset);
                  }
                  if(lastLevel)
                     mesh.UnlockPrimitive(triangle);
               }
               vertexOffset += objectMesh.nVertices;
            }

            for(child = children.first; child; child = child.next)
            {
               if(child.flags.mesh && child.mesh)
               {
                  for(c = 0; c<child.mesh.nPrimitives; c++)
                  {
                     int i;
                     PrimitiveSingle * triangle = &mesh.primitives[mesh.nPrimitives++];
                     PrimitiveSingle * src = &child.mesh.primitives[c];

                     mesh.AllocatePrimitive(triangle, src->type, src->nIndices);
                     triangle->material = src->material ? src->material : child.material;
                     triangle->middle = src->middle;
                     triangle->plane = src->plane;

                     //*triangle = *src;
                     //src->indices = null;
                     //src->data = null;

                     if(triangle->type.indices32bit)
                     {
                        uint32 * indices32 = src->indices32 ? src->indices32 : mesh.indices + src->baseIndexMesh;
                        for(i = 0; i<triangle->nIndices; i++)
                           triangle->indices32[i] = indices32[i] + vertexOffset;
                     }
                     else
                     {
                        uint16 * indices = src->indices;
                        for(i = 0; i<triangle->nIndices; i++)
                           triangle->indices[i] = (uint16)(indices[i] + vertexOffset);
                     }
                     if(lastLevel)
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
               delete child;
            }

            mesh.ApplyTranslucency(this);
            // this.flags.translucent = true;

            // NOTE: This was problematic here as groups is OldList!!!
            //mesh.groups.Sort(compareGroupMaterial, null);
            (&mesh.groups)->Sort(compareGroupMaterial, null);

            result = true;

            SetMinMaxRadius(true);

            if(lastLevel)
               mesh.Unlock(flags);
         }

         delete map;

         if(freeMesh && objectMesh)
         {
            /*
            if(objectMesh.displaySystem)
               objectMesh.displaySystem.RemoveMesh(objectMesh);
            */
            delete objectMesh;
         }

         if(lastLevel && displaySystem && mesh && !mesh.nPrimitives)
            mesh.FreeCPUVertexAttributes(deleteCPUAttrOptions & ~MeshFeatures { normals = this.flags.computeLightVectors });
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

   private bool _ApplySkins()
   {
      bool result = false;
      Object o;
      if(flags.mesh && mesh && mesh.skin)
      {
         mesh.ApplySkin();
         flags.skinApplied = true;
         result = true;
      }
      for(o = children.first; o; o = o.next)
         result |= o._ApplySkins();
      return result;
   }

   public void ApplySkins()
   {
      _ApplySkins();
      SetMinMaxRadius(false);
   }

   private bool _ApplyMorphs(bool recomputeNormals)
   {
      bool result = false;
      Object o;
      if(flags.mesh && mesh && mesh.morphs)
      {
         mesh.ApplyMorphs(recomputeNormals);
         result = true;
      }
      for(o = children.first; o; o = o.next)
         result |= o._ApplyMorphs(recomputeNormals);
      return result;
   }

   public void ApplyMorphs(bool recomputeNormals)
   {
      _ApplyMorphs(recomputeNormals);
      SetMinMaxRadius(false);
   }

   public void CombineMorphs()
   {
      Object o;
      if(flags.mesh && mesh && mesh.morphs)
      {
         Array<bool> combined { size = mesh.morphs.count };
         FrameTrack track;
         int i;
         for(i = 0; i < combined.count; i++)
            combined[i] = true;
         for(track = tracks.first; track; track = track.next)
         {
            if(track.type.type == morph)
               combined[track.morphIndex] = false;
         }
         mesh.CombineMorphs(combined);
         delete combined;
      }
      for(o = children.first; o; o = o.next)
         o.CombineMorphs();
   }

   private static inline void ::inlineMultMatrix(Vector3Df dest, const Vector3Df source, const Matrixf matrix)
   {
      dest.x = (float)(source.x * matrix.m[0][0] + source.y * matrix.m[1][0] + source.z * matrix.m[2][0] + matrix.m[3][0]);
      dest.y = (float)(source.x * matrix.m[0][1] + source.y * matrix.m[1][1] + source.z * matrix.m[2][1] + matrix.m[3][1]);
      dest.z = (float)(source.x * matrix.m[0][2] + source.y * matrix.m[1][2] + source.z * matrix.m[2][2] + matrix.m[3][2]);
   }

   private static void inline transformVertex(int i, MeshSkin skin, Array<Matrixf> matBones, Vector3Df vert)
   {
      SkinVert * sv = &skin.skinVerts[i];
      int j;
      float tw = 0;
      Vector3Df vt { };
      Vector3Df * oVertices = mesh.vertices;

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

   private static double testVertex(Array<Matrixf> matBones, bool bsIdentity, MeshSkin skin, SkinVert * sv, const Vector3D target)
   {
      int i;
      Vector3Df vert;
      double dx, dy, dz;

      for(i = 0; i < MAX_BONES; i++)
      {
         int b = sv->bones[i];
         if(b != NO_BONE)
         {
            Matrix m;
            SkinBone * bone = &skin.bones[b];
            if(bone->object)
            {
               m.Multiply3x4(bone->bsInvBindMatrix, bone->object.matrixPtr);

               if(bsIdentity)
                  matBones[b].fromMatrix(m);
               else
               {
                  Matrix tmp;
                  tmp.Multiply3x4(m, skin.invShape);
                  matBones[b].fromMatrix(tmp);
               }
            }
         }
      }
      transformVertex(sv - mesh.skin.skinVerts.array, skin, matBones, vert);
      dx = vert.x - target.x;
      dy = vert.y - target.y;
      dz = vert.z - target.z;
      return dx * dx + dy * dy + dz * dz;
   }

   private static void setBoneAngle(Object boneObj, Euler a)
   {
      Quaternion q;
      q.RotationEuler(a, boneObj.rotationOrder);
      boneObj.eulerOrientation = a;
      boneObj.transform.orientation = q;
      boneObj.UpdateTransform();
   }

   void InverseKinematics(int boneIX, Array<Euler> limits, int vertex, const Vector3D target, int maxDepth)
   {
      MeshSkin skin = mesh.skin;
      Degrees maxDelta[] = { 5, 10, 30, 45, 90, 180, 360 };
      double depthDistance[] = { 0.01, 0.1, 0.3, 0.5, 0.6, 0.8, 1 };
      int pass;

      for(pass = 0; pass < 7; pass++)
      {
         double d2 = MAXDOUBLE;
         int j;
         int md = maxDepth; //pass > 1 ? Min(maxDepth, 2) : maxDepth;
         for(j = 0; j < md; j++)
         {
            bool fromCurrent = true; //j > 0;
            SkinBone * sBone = &skin.bones[boneIX];
            int bix = boneIX;
            Object boneObj = sBone->object;
            int k;

            for(k = 0; k < j; k++)
            {
               boneObj = boneObj.parent;
               if(!boneObj || !boneObj.parent || boneObj.parent.flags.skeleton)
                  break;
            }

            if(k == j)
            {
               int ii;

               if(k)
               {
                  bix = -1;
                  for(ii = 0; ii < skin.bones.count; ii++)
                     if(skin.bones[ii].object == boneObj)
                     {
                        bix = ii;
                        break;
                     }
               }
               if(bix != -1)
               {
                  // Complementary bones (e.g., separate bones for twisting and bending)
                  int bix2 = -1;
                  Euler boneLimitsMin = limits[2*bix+0], boneLimitsMax = limits[2*bix+1];
                  uint boneAxes = 0;

                  if((Radians)boneLimitsMax.yaw   - (Radians)boneLimitsMin.yaw   > 1E-11) boneAxes |= 1;
                  if((Radians)boneLimitsMax.pitch - (Radians)boneLimitsMin.pitch > 1E-11) boneAxes |= 2;
                  if((Radians)boneLimitsMax.roll  - (Radians)boneLimitsMin.roll  > 1E-11) boneAxes |= 4;

                  for(bone2 : [ boneObj.parent, boneObj.firstChild ]; bone2)
                  {
                     int b2 = -1;

                     for(ii = 0; ii < skin.bones.count; ii++)
                        if(skin.bones[ii].object == bone2)
                        {
                           b2 = ii;
                           break;
                        }

                     if(b2 != -1)
                     {
                        uint b2Axes = 0;
                        boneLimitsMin = limits[2*b2+0];
                        boneLimitsMax = limits[2*b2+1];
                        if((Radians)boneLimitsMax.yaw   - (Radians)boneLimitsMin.yaw   > 1E-11) b2Axes |= 1;
                        if((Radians)boneLimitsMax.pitch - (Radians)boneLimitsMin.pitch > 1E-11) b2Axes |= 2;
                        if((Radians)boneLimitsMax.roll  - (Radians)boneLimitsMin.roll  > 1E-11) b2Axes |= 4;

                        if(!(boneAxes & b2Axes))
                        {
                           bix2 = b2;
                           break;
                        }
                     }
                  }

                  d2 = InverseKinematicsBone(bix, bix2, limits, vertex, target, fromCurrent, maxDelta[pass]);
               }
            }

            if(d2 < depthDistance[Min(j, sizeof(depthDistance)/sizeof(depthDistance[0])-1)]) break;
         }
      }
   }

   private static double InverseKinematicsBone(int boneIX1, int boneIX2,
      Array<Euler> limits, int vertex, const Vector3D target, bool fromCurrent, Degrees maxDelta)
   {
      MeshSkin skin = mesh.skin;
      Array<Matrixf> matBones { size = skin.bones.count };
      bool bsIdentity = skin.bsIsIdentity;
      SkinBone * bone1 = &skin.bones[boneIX1];
      SkinBone * bone2 = boneIX2 == -1 ? null : &skin.bones[boneIX2];
      Object boneObj1 = bone1->object, boneObj2 = bone2 ? bone2->object : null;
      Euler minAngle1 = limits[boneIX1 * 2 + 0], maxAngle1 = limits[boneIX1 * 2 + 1];
      Euler minAngle2 = boneIX2 == -1 ? { } : limits[boneIX2 * 2 + 0], maxAngle2 = boneIX2 == -1 ? { } : limits[boneIX2 * 2 + 1];
      double distance2;
      SkinVert * sv = &skin.skinVerts[vertex];

      // angle.FromQuaternion(boneObj.transform.orientation, boneObj.rotationOrder);
      // angle = { (minAngle.yaw + maxAngle.yaw)/2, (minAngle.pitch + maxAngle.pitch)/2, (minAngle.roll + maxAngle.roll)/2 };
      Euler angle1 = fromCurrent ? boneObj1.eulerOrientation : { };
      Euler angle2 = boneObj2 && fromCurrent ? boneObj2.eulerOrientation : { };

      if(angle1.yaw < minAngle1.yaw) angle1.yaw = minAngle1.yaw;
      if(angle1.yaw > maxAngle1.yaw) angle1.yaw = maxAngle1.yaw;
      if(angle1.pitch < minAngle1.pitch) angle1.pitch = minAngle1.pitch;
      if(angle1.pitch > maxAngle1.pitch) angle1.pitch = maxAngle1.pitch;
      if(angle1.roll < minAngle1.roll) angle1.roll = minAngle1.roll;
      if(angle1.roll > maxAngle1.roll) angle1.roll = maxAngle1.roll;

      if(boneObj2)
      {
         if(angle2.yaw < minAngle2.yaw) angle2.yaw = minAngle2.yaw;
         if(angle2.yaw > maxAngle2.yaw) angle2.yaw = maxAngle2.yaw;
         if(angle2.pitch < minAngle2.pitch) angle2.pitch = minAngle2.pitch;
         if(angle2.pitch > maxAngle2.pitch) angle2.pitch = maxAngle2.pitch;
         if(angle2.roll < minAngle2.roll) angle2.roll = minAngle2.roll;
         if(angle2.roll > maxAngle2.roll) angle2.roll = maxAngle2.roll;
      }

      /*if(fromCurrent) // Make maxDelta percentage instead?
      {
         if(minAngle.yaw < angle.yaw) minAngle.yaw = angle.yaw + (minAngle.yaw - angle.yaw) * 0.1;
         if(maxAngle.yaw > angle.yaw) maxAngle.yaw = angle.yaw + (maxAngle.yaw - angle.yaw) * 0.1;
         if(minAngle.pitch < angle.pitch) minAngle.pitch = angle.pitch + (minAngle.pitch - angle.pitch) * 0.1;
         if(maxAngle.pitch > angle.pitch) maxAngle.pitch = angle.pitch + (maxAngle.pitch - angle.pitch) * 0.1;
         if(minAngle.roll < angle.roll) minAngle.roll = angle.roll + (minAngle.roll - angle.roll) * 0.1;
         if(maxAngle.roll > angle.roll) maxAngle.roll = angle.roll + (maxAngle.roll - angle.roll) * 0.1;
      }
      */

      if(minAngle1.yaw < angle1.yaw - maxDelta) minAngle1.yaw = angle1.yaw - maxDelta;
      if(minAngle1.pitch < angle1.pitch - maxDelta) minAngle1.pitch = angle1.pitch - maxDelta;
      if(minAngle1.roll < angle1.roll - maxDelta) minAngle1.roll = angle1.roll - maxDelta;
      if(maxAngle1.yaw > angle1.yaw + maxDelta) maxAngle1.yaw = angle1.yaw + maxDelta;
      if(maxAngle1.pitch > angle1.pitch + maxDelta) maxAngle1.pitch = angle1.pitch + maxDelta;
      if(maxAngle1.roll > angle1.roll + maxDelta) maxAngle1.roll = angle1.roll + maxDelta;

      if(boneObj2)
      {
         if(minAngle2.yaw < angle2.yaw - maxDelta) minAngle2.yaw = angle2.yaw - maxDelta;
         if(minAngle2.pitch < angle2.pitch - maxDelta) minAngle2.pitch = angle2.pitch - maxDelta;
         if(minAngle2.roll < angle2.roll - maxDelta) minAngle2.roll = angle2.roll - maxDelta;
         if(maxAngle2.yaw > angle2.yaw + maxDelta) maxAngle2.yaw = angle2.yaw + maxDelta;
         if(maxAngle2.pitch > angle2.pitch + maxDelta) maxAngle2.pitch = angle2.pitch + maxDelta;
         if(maxAngle2.roll > angle2.roll + maxDelta) maxAngle2.roll = angle2.roll + maxDelta;
      }

      setBoneAngle(boneObj1, angle1);
      if(boneObj2)
         setBoneAngle(boneObj2, angle2);

      distance2 = testVertex(matBones, bsIdentity, skin, sv, target);

      memcpy(matBones.array, mesh.matBones.array, matBones.count * sizeof(Matrixf));
      if(boneObj1)
      {
         double best = distance2;
         while(true)
         {
            Degrees dYaw1   = maxAngle1.yaw   - minAngle1.yaw;
            Degrees dPitch1 = maxAngle1.pitch - minAngle1.pitch;
            Degrees dRoll1  = maxAngle1.roll  - minAngle1.roll;
            Degrees dYaw2   = boneObj2 ? maxAngle2.yaw   - minAngle2.yaw : 0;
            Degrees dPitch2 = boneObj2 ? maxAngle2.pitch - minAngle2.pitch : 0;
            Degrees dRoll2  = boneObj2 ? maxAngle2.roll  - minAngle2.roll : 0;
            float t = 0.4;
            int i = 0;
            Euler angles[12];
            bool used[12] = { false };

            #define MIN_DEG   0.2 //05

            if(dYaw1 < Degrees { MIN_DEG } && dPitch1 < Degrees { MIN_DEG } && dRoll1 < Degrees { MIN_DEG } &&
               dYaw2 < Degrees { MIN_DEG } && dPitch2 < Degrees { MIN_DEG } && dRoll2 < Degrees { MIN_DEG })
               break;
            {
               int winner = -1;
               if(dYaw1)
               {
                  Euler a1 = angle1, a2 = angle1;
                  a1.yaw = angle1.yaw + (minAngle1.yaw - angle1.yaw) * t;
                  a2.yaw = angle1.yaw + (maxAngle1.yaw - angle1.yaw) * t;
                  angles[0] = a1, angles[1] = a2;
                  used[0] = true, used[1] = true;
               }
               if(dPitch1)
               {
                  Euler a1 = angle1, a2 = angle1;
                  a1.pitch = angle1.pitch + (minAngle1.pitch - angle1.pitch) * t;
                  a2.pitch = angle1.pitch + (maxAngle1.pitch - angle1.pitch) * t;
                  angles[2] = a1, angles[3] = a2;
                  used[2] = true, used[3] = true;
               }
               if(dRoll1)
               {
                  Euler a1 = angle1, a2 = angle1;
                  a1.roll = angle1.roll + (minAngle1.roll - angle1.roll) * t;
                  a2.roll = angle1.roll + (maxAngle1.roll - angle1.roll) * t;
                  angles[4] = a1, angles[5] = a2;
                  used[4] = true, used[5] = true;
               }
               if(dYaw2)
               {
                  Euler a1 = angle2, a2 = angle2;
                  a1.yaw = angle2.yaw + (minAngle2.yaw - angle2.yaw) * t;
                  a2.yaw = angle2.yaw + (maxAngle2.yaw - angle2.yaw) * t;
                  angles[6] = a1, angles[7] = a2;
                  used[6] = true, used[7] = true;
               }
               if(dPitch2)
               {
                  Euler a1 = angle2, a2 = angle2;
                  a1.pitch = angle2.pitch + (minAngle2.pitch - angle2.pitch) * t;
                  a2.pitch = angle2.pitch + (maxAngle2.pitch - angle2.pitch) * t;
                  angles[8] = a1, angles[9] = a2;
                  used[8] = true, used[9] = true;
               }
               if(dRoll2)
               {
                  Euler a1 = angle2, a2 = angle2;
                  a1.roll = angle2.roll + (minAngle2.roll - angle2.roll) * t;
                  a2.roll = angle2.roll + (maxAngle2.roll - angle2.roll) * t;
                  angles[10] = a1, angles[11] = a2;
                  used[10] = true, used[11] = true;
               }

               for(i = 0; i < 12; i++)
               {
                  if(used[i])
                  {
                     double d2, improvement;
                     setBoneAngle(i < 6 ? boneObj1 : boneObj2, angles[i]);
                     d2 = testVertex(matBones, bsIdentity, skin, sv, target);
                     improvement = best - d2;
                     // if(sqrt(improvement) / sqrt(d2) > 0.05) //02)
                     if(improvement / d2 > 0.1)
                     {
                        best = d2;
                        winner = i;
                     }
                  }
               }
               if(winner != -1)
               {
                  switch(winner)
                  {
                     case 0: maxAngle1.yaw = angle1.yaw; break;
                     case 1: minAngle1.yaw = angle1.yaw; break;
                     case 2: maxAngle1.pitch = angle1.pitch; break;
                     case 3: minAngle1.pitch = angle1.pitch; break;
                     case 4: maxAngle1.roll = angle1.roll; break;
                     case 5: minAngle1.roll = angle1.roll; break;
                     case 6: maxAngle2.yaw = angle2.yaw; break;
                     case 7: minAngle2.yaw = angle2.yaw; break;
                     case 8: maxAngle2.pitch = angle2.pitch; break;
                     case 9: minAngle2.pitch = angle2.pitch; break;
                     case 10: maxAngle2.roll = angle2.roll; break;
                     case 11: minAngle2.roll = angle2.roll; break;
                  }
                  if(winner < 6)
                     angle1 = angles[winner];
                  else
                     angle2 = angles[winner];

                  if((winner == 0 || winner == 1) && dYaw1 < MIN_DEG)
                     break;
                  else if((winner == 2 || winner == 3) && dPitch1 < MIN_DEG)
                     break;
                  else if((winner == 4 || winner == 5) && dRoll1 < MIN_DEG)
                     break;
                  else if((winner == 6 || winner == 7) && dYaw2 < MIN_DEG)
                     break;
                  else if((winner == 8 || winner == 9) && dPitch2 < MIN_DEG)
                     break;
                  else if((winner == 10 || winner == 11) && dRoll2 < MIN_DEG)
                     break;
               }
               else
                  break;
            }
         }
         distance2 = best;
      }

      setBoneAngle(boneObj1, angle1);
      if(boneObj2)
         setBoneAngle(boneObj2, angle2);

      delete matBones;
      return distance2;
   }

   void ResetPose()
   {
      Object o;
      if(flags.mesh && mesh && mesh.skin)
      {
         mesh.UnapplySkin();
         flags.skinApplied = false;
      }
      for(o = children.first; o; o = o.next)
         o.ResetPose();
      SetMinMaxRadius(false);
   }

   void Animate(int frame)
   {
      if(this && this.frame != frame && startFrame != endFrame)
      {
         if(frame < (int)startFrame)
            frame = Max((int)startFrame, (int)endFrame - ((int)startFrame - frame - 1));
         if(frame > (int)endFrame)
            frame = Min((int)endFrame, (int)startFrame + (frame - (int)endFrame - 1));

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

   property Transform transform { set { transform = value; if(rotationOrder == yxz) eulerOrientation = transform.orientation; } get { value = transform; } };
   property Euler eulerOrientation { set { eulerOrientation = value; } get { value = eulerOrientation; } }
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
   property const char * name
   {
      get { return name; }
      set { if(!parent) { delete name; name = CopyString(value); } else PrintLn("ERROR: Setting name on object with parent;"); }
   };
   property Matrix matrix { get { value = matrix; } };
   property Object cameraTarget { set { cameraTarget = value; } get { return cameraTarget; } };
   property OldList * tracks { /* set { tracks = value; } */ get { return &tracks; } };
   property ObjectFlags flags { set { flags = value; } get { return flags; } };

   // TOFIX: 32-bit compiling with 64-bit SDK cannot access public members properly
   property Object parent          { get { return parent; } }
   property uint numChildren { get { return children.count; } }

   property Matrix * localMatrixPtr   { get { return &localMatrix; } }
   property Matrix * matrixPtr        { get { return &matrix; } }

private:
   Object()
   {
      children.offset = (uint)(uintptr)&((Object)0).prev;
      transform.scaling = { 1, 1, 1 };
      transform.orientation = { 1,0,0,0 };
      flags.transform = true;
      localMatrix.Identity();
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

         // Cameras / Spot Lights must update their target first
         if(flags.camera && cameraTarget && cameraTarget.flags.transform)
            cameraTarget.UpdateTransform();
         else if(flags.light && light.flags.spot && light.target && light.target.flags.transform)
            light.target._UpdateTransform();

         if(flags.camera && cameraTarget)
         {
            // Determine angle to look at target
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
            // Determine angle to look at target
            Vector3D position;
            if(flags.root || !parent)
               position = transform.position;
            else
               position.MultMatrix(transform.position, parent.matrix);

            if(light.target)
            {
               light.direction.Subtract((Vector3D *) light.target.matrix.m[3], position);
               light.direction.Normalize(light.direction);
            }
         }

         if(!flags.localMatrixSet)
         {
            localMatrix.Identity();
            localMatrix.Scale(transform.scaling.x, transform.scaling.y, transform.scaling.z);
            localMatrix.Rotate(transform.orientation);
            localMatrix.Translate(transform.position.x, transform.position.y, transform.position.z);
         }

         // Compute transform (with ancestors)
         if(flags.root || !parent || flags.skeleton)
            matrix = localMatrix;
         else
            // matrix.Multiply(localMatrix, parent.matrix);
            matrix.Multiply3x4(localMatrix, parent.matrix);

         flags.transform = false;

         for(child = children.first; child; child = child.next)
         {
            if(child.flags.transform)
               child._UpdateTransform();
         }
      }
   }

   void _Animate(/*unsigned */int frame)
   {
      Object child;
      FrameTrack track;
      Euler euler { };
      bool eulerRotation = false;
      bool hasPitch = false, hasRoll = false, hasYaw = false;

      if(!flags.ownMesh && mesh && mesh.skin && mesh.skin.bones.count)
      {
         Object o = mesh.skin.bones[0].object;
         if(o)
         {
            while(o.parent) o = o.parent;
            if(o.frame != frame)
               o._Animate(frame);
         }
      }

      for(track = tracks.first; track; track = track.next)
      {
         if(track.numKeys)
         {
            /*unsigned */int prev = 0, next = track.numKeys - 1, mid = (prev + next) >> 1;
            FrameKey * keys = track.keys, * prevKey = keys + prev, * nextKey = keys + next, * midKey = keys + mid;
            float t = 0;

            while(true)
            {
               int f = midKey->frame;
               if(f < frame)
               {
                  prevKey = midKey;
                  prev = mid;
                  mid = (prev + next)>>1;
                  if(mid == prev) mid = next;
                  midKey = keys + mid;
               }
               else if(f > frame)
               {
                  nextKey = midKey;
                  next = mid;
                  mid = (prev + next)>>1;
                  midKey = keys + mid;
               }
               else
               {
                  prevKey = midKey;
                  nextKey = midKey;
                  prev = mid;
                  next = mid;
                  break;
               }
               if(mid == prev)
                  break;
            }
#if 0

            int prev2 = 0, next2 = track.numKeys - 1;
            for(c = 0; c<track.numKeys; c++)
            {
               FrameKey * key = track.keys + c;
               if(key->frame <= frame) { prev2 = c; }
               if(key->frame >= frame) { next2 = c; break; }
            }
            if(prev2 != prev || next2 != next)
               printf("bug");

#endif

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
               case rYaw:   eulerRotation = true; hasYaw = true; euler.yaw = track.InterpolateAngle(prevKey->roll, nextKey->roll, prev, next, t); break;
               case rPitch: eulerRotation = true; hasPitch = true; euler.pitch = track.InterpolateAngle(prevKey->roll, nextKey->roll, prev, next, t); break;
               case rRoll:  eulerRotation = true; hasRoll = true; euler.roll = track.InterpolateAngle(prevKey->roll, nextKey->roll, prev, next, t); break;
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
               case hide:
               {
                  flags.hide = track.InterpolateBool(prevKey->hide, nextKey->hide, prev, next, t);
                  break;
               }
               case morph:
               {
                  float weight = track.InterpolateFloat(prevKey->weight, nextKey->weight, prev, next, t);
                  if(mesh && mesh.morphs && track.morphIndex < mesh.morphs.count)
                  {
                     MeshMorph * morph = &mesh.morphs[track.morphIndex];
                     if(morph->weight != weight)
                     {
                        morph->weight = weight;
                        morph->updated = true;
                     }
                  }
                  break;
               }
            }
         }
      }
      if(eulerRotation)
      {
         Matrix a, b;
         Matrix rYaw, rPitch, rRoll;
         Quaternion q;

         if(!hasYaw)
            euler.yaw = eulerOrientation.yaw;
         else
            eulerOrientation.yaw = euler.yaw;
         if(!hasPitch)
            euler.pitch = eulerOrientation.pitch;
         else
            eulerOrientation.pitch = euler.pitch;
         if(!hasRoll)
            euler.roll = eulerOrientation.roll;
         else
            eulerOrientation.roll = euler.roll;

         rYaw.RotationQuaternion(Euler { yaw = euler.yaw });
         rPitch.RotationQuaternion(Euler { pitch = euler.pitch });
         rRoll.RotationQuaternion(Euler { roll = euler.roll });

         switch(rotationOrder)
         {
            case xyz:
               a.Multiply(rYaw, rPitch);
               b.Multiply(rRoll, a);
               break;
            case xzy:
               a.Multiply(rRoll, rPitch);
               b.Multiply(rYaw, a);
               break;
            case yxz:
               a.Multiply(rPitch, rYaw);
               b.Multiply(rRoll, a);
               break;
            case yzx:
               a.Multiply(rRoll, rYaw);
               b.Multiply(rPitch, a);
               break;
            case zyx:
               a.Multiply(rYaw, rRoll);
               b.Multiply(rPitch, a);
               break;
            case zxy:
            default:
               a.Multiply(rPitch, rRoll);
               b.Multiply(rYaw, a);
               break;
         }

         q.RotationMatrix(b);
         transform.orientation = q;
      }
      flags.localMatrixSet = false;
      flags.transform = true;
      UpdateTransform();

      for(child = children.first; child; child = child.next)
         child._Animate(frame);

      flags.localMatrixSet = false;
      flags.transform = true;
   }

   // Private for now
   public FrustumPlacement InsideFrustum(Plane * planes)
   {
      FrustumPlacement result = inside;
      // FIXME: SetCameraVR() does not currently set up planes properly
      // return result;

      int p;
      // First test: Sphere
      for(p = 0; p<6; p++)
      {
         Plane * plane = &planes[p];
         //double dot = plane->normal.DotProduct(wcenter);
         double dot = plane->normal.x * wcenter.x + plane->normal.y * wcenter.y + plane->normal.z * wcenter.z;
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
               // double dot = plane->normal.DotProduct(box[i]);
               double dot = plane->normal.x * box[i].x + plane->normal.y * box[i].y + plane->normal.z * box[i].z;
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

   OldList/*<FrameTrack>*/ tracks;
   unsigned startFrame, endFrame;
   int frame;
   Vector3Df pivot;  // Only used by 3DS driver

   public Transform transform;
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
      set { light = value; }
      get { value = light; }
   }

   Euler eulerOrientation;
   EulerRotationOrder rotationOrder; rotationOrder = zxy;

   public property EulerRotationOrder rotationOrder
   {
      set { rotationOrder = value; }
      get { return rotationOrder; }
   }

   DisplaySystem displaySystem;
   float mvMatrix[16]; // Model-view matrix

   public property DisplaySystem displaySystem
   {
#if !defined(ECERE_NOGL)
      set { Upload(value, null, null, 0, null); }
#endif
      get { return displaySystem; }
   }

#if !defined(ECERE_NOGL)
   void countTextures(int nAT, AVLTree<uintptr> * bitmaps, int * w, int * h, int * internalFormats)
   {
      Object o;

      if(flags.mesh && mesh && flags.ownMesh)
         mesh.countTextures(nAT, bitmaps, w, h, internalFormats);
      for(o = firstChild; o; o = o.next)
         o.countTextures(nAT, bitmaps, w, h, internalFormats);
   }

   public void Upload(DisplaySystem displaySystem, GLMB mab, GLMB meab, int nAT, GLArrayTexture * mAT)
   {
      Object o;

      if(nAT && mAT && !mAT[0].texture && !mAT[0].numLayers)
      {
         // Automatically initialize array textures with this object's requirements by default
         AVLTree<uintptr> bitmaps[5];
         int internalFormats[5] = { 0 };
         int w[5] = { 0 }, h[5] = { 0 };
         int i;

         for(i = 0; i < Min(nAT, 5); i++)
            bitmaps[i] = { };

         countTextures(nAT, bitmaps, w, h, internalFormats);

         for(i = 0; i < Min(nAT, 5); i++)
         {
            int numLayers = bitmaps[i].count;
            int numMipMaps = log2i(Max(w[i], h[i])) + 1;

            if(numLayers)
               mAT[i]._init(numMipMaps, w[i], h[i], numLayers, internalFormats[i], false);

            delete bitmaps[i];
         }
      }

      this.displaySystem = displaySystem;
      if(flags.mesh && mesh && flags.ownMesh)
         mesh.Upload(displaySystem, true, mab, meab, nAT, mAT);
      for(o = children.first; o; o = o.next)
         o.Upload(displaySystem, mab, meab, nAT, mAT);
   }
#endif

   void setTransform(Matrix sm, Matrix svm, Vector3D cp) // Start-up matrix, Start-up X View Matrix, Camera Position
   {
      float * mv = mvMatrix;
      double * wm = matrix.array, * m;
      float tx = 0, ty = 0, tz = 0;
      if(flags.viewSpace)
         m = sm.array;
      else
      {
         double x = wm[12] - cp.x, y = wm[13] - cp.y, z = wm[14] - cp.z;
         m = svm.array;
         tx = (float)(x * m[0] + y * m[4] + z * m[ 8] + m[12]);
         ty = (float)(x * m[1] + y * m[5] + z * m[ 9] + m[13]);
         tz = (float)(x * m[2] + y * m[6] + z * m[10] + m[14]);
      }
      mv[ 0]=(float)(wm[0]*m[0] + wm[1]*m[4] + wm[2]*m[ 8]);
      mv[ 1]=(float)(wm[0]*m[1] + wm[1]*m[5] + wm[2]*m[ 9]);
      mv[ 2]=(float)(wm[0]*m[2] + wm[1]*m[6] + wm[2]*m[10]);
      mv[ 3]=0;
      mv[ 4]=(float)(wm[4]*m[0] + wm[4]*m[4] + wm[6]*m[ 8]);
      mv[ 5]=(float)(wm[4]*m[1] + wm[4]*m[5] + wm[6]*m[ 9]);
      mv[ 6]=(float)(wm[4]*m[2] + wm[4]*m[6] + wm[6]*m[10]);
      mv[ 7]=0;
      mv[ 8]=(float)(wm[8]*m[0] + wm[9]*m[4] + wm[10]*m[ 8]);
      mv[ 9]=(float)(wm[8]*m[1] + wm[9]*m[5] + wm[10]*m[ 9]);
      mv[10]=(float)(wm[8]*m[2] + wm[9]*m[6] + wm[10]*m[10]);
      mv[11]=0;
      mv[12]=tx;
      mv[13]=ty;
      mv[14]=tz;
      mv[15]=1;
   }
};
