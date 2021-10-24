namespace gfx3D;

import "Display"

public struct Vector3D
{
   double x, y, z;

   void Add(const Vector3D vector1, const Vector3D vector2)
   {
      x = vector1.x + vector2.x;
      y = vector1.y + vector2.y;
      z = vector1.z + vector2.z;
   }

   void Subtract(const Vector3D vector1, const Vector3D vector2)
   {
      x = vector1.x - vector2.x;
      y = vector1.y - vector2.y;
      z = vector1.z - vector2.z;
   }

   void Scale(const Vector3D vector1, double s)
   {
      x = vector1.x * s;
      y = vector1.y * s;
      z = vector1.z * s;
   }

   double DotProduct(const Vector3D vector2)
   {
      return x * vector2.x + y * vector2.y + z * vector2.z;
   }

   double DotProductf(const Vector3Df vector2)
   {
      return x * vector2.x + y * vector2.y + z * vector2.z;
   }

   void CrossProduct(const Vector3D vector1, const Vector3D vector2)
   {
      x = vector1.y * vector2.z - vector1.z * vector2.y;
      y = vector1.z * vector2.x - vector1.x * vector2.z;
      z = vector1.x * vector2.y - vector1.y * vector2.x;
   }

   void Normalize(const Vector3D source)
   {
      double m = source.length;  // FIXME -- get should be fine with const objects
      if(m)
      {
         x = source.x/m;
         y = source.y/m;
         z = source.z/m;
      }
      else
         x = y = z = 0;
   }

   void MultMatrix(const Vector3D source, const Matrix matrix)
   {
       x = source.x * matrix.m[0][0] + source.y * matrix.m[1][0] + source.z * matrix.m[2][0] + matrix.m[3][0];
       y = source.x * matrix.m[0][1] + source.y * matrix.m[1][1] + source.z * matrix.m[2][1] + matrix.m[3][1];
       z = source.x * matrix.m[0][2] + source.y * matrix.m[1][2] + source.z * matrix.m[2][2] + matrix.m[3][2];
   }

   void MultMatrixf(const Vector3Df source, const Matrix matrix)
   {
       x = source.x * matrix.m[0][0] + source.y * matrix.m[1][0] + source.z * matrix.m[2][0] + matrix.m[3][0];
       y = source.x * matrix.m[0][1] + source.y * matrix.m[1][1] + source.z * matrix.m[2][1] + matrix.m[3][1];
       z = source.x * matrix.m[0][2] + source.y * matrix.m[1][2] + source.z * matrix.m[2][2] + matrix.m[3][2];
   }

   void MultQuaternion(const Vector3D s, const Quaternion quat)
   {
      Vector3D v { quat.x, quat.y, quat.z };
      double w = quat.w, a = w*w - (v.x*v.x+v.y*v.y+v.z*v.z) /*DotProduct(v)*/, dotVS = v.x*s.x+v.y*s.y+v.z*s.z /*v.DotProduct(s)*/;
      Vector3D cross
      {
         s.y * v.z - s.z * v.y,
         s.z * v.x - s.x * v.z,
         s.x * v.y - s.y * v.x
      };
      //cross.CrossProduct(s, v);
      x = (float)(2 * dotVS * v.x + a * s.x + 2 * w * cross.x);
      y = (float)(2 * dotVS * v.y + a * s.y + 2 * w * cross.y);
      z = (float)(2 * dotVS * v.z + a * s.z + 2 * w * cross.z);
   }

   void DivideMatrix(const Vector3D v, const Matrix m)
   {
      /* v be x,y,z; m be { { e,f,g,...}, {h,i,j,...}, {k,l,m,...}, {...} }; this be a,b,c; solve for a,b,c:
         x=a*e+b*h+c*k
         y=a*f+b*i+c*l
         z=a*g+b*j+c*m
      */
      double vx = v.x - m.m[3][0];
      double vy = v.y - m.m[3][1];
      double vz = v.z - m.m[3][2];
      double fm_gl = m.m[0][1] * m.m[2][2] - m.m[0][2] * m.m[2][1];
      double fz_gy = m.m[0][1] * vz        - m.m[0][2] * vy;
      double gi_fj = m.m[0][2] * m.m[1][1] - m.m[0][1] * m.m[1][2];
      double iz_jy = m.m[1][1] * vz        - m.m[1][2] * vy;
      double jl_im = m.m[1][2] * m.m[2][1] - m.m[1][1] * m.m[2][2];
      double my_lz = m.m[2][2] * vy        - m.m[2][1] * vz;
      double invDiv = 1.0 / (m.m[0][0] * jl_im + m.m[1][0] * fm_gl + m.m[2][0] * gi_fj);

      x =  invDiv * (m.m[1][0] * my_lz + m.m[2][0] * iz_jy + vx * jl_im);
      y = -invDiv * (m.m[0][0] * my_lz + m.m[2][0] * fz_gy - vx * fm_gl);
      z =  invDiv * (m.m[0][0] *-iz_jy + m.m[1][0] * fz_gy + vx * gi_fj);
   }

   property double length { get { return (double)sqrt(x * x + y * y + z * z); } };
   property double lengthApprox
   {
      get
      {
         double ix = Abs(x), iy = Abs(y), iz = Abs(z);
         double tmp;
         if(ix < iy) { tmp = ix; ix = iy; iy = tmp; }
         if(ix < iz) { tmp = ix; ix = iz; iz = tmp; }
         if(iz > iy) { iz = iy; }
         return ix + (iz/2);
      }
   }
};

public /*inline */float FastInvSqrt(float x)
{
  union { float f; uint u; } i;
  float halfX = x / 2;
  i.f = x;
  i.u = 0x5f375a86 - (i.u >> 1);
  x = i.f;
  return x * (1.5f - (halfX * x * x));
}

public /*inline */double FastInvSqrtDouble(double x)
{
   union { double d; uint64 u; } i;
   double halfX = x / 2;
   i.d = x;
   i.u = 0x5fe6eb50c7b537a9LL - (i.u >> 1);
   x = i.d;
   return x * (1.5 - (halfX * x * x));
}

public struct Vector3Df
{
   float x, y, z;

   void Add(const Vector3Df vector1, const Vector3Df vector2)
   {
      x = vector1.x + vector2.x;
      y = vector1.y + vector2.y;
      z = vector1.z + vector2.z;
   }

   void Subtract(const Vector3Df vector1, const Vector3Df vector2)
   {
      x = vector1.x - vector2.x;
      y = vector1.y - vector2.y;
      z = vector1.z - vector2.z;
   }

   void Scale(const Vector3Df vector1, float s)
   {
      x = vector1.x * s;
      y = vector1.y * s;
      z = vector1.z * s;
   }

   double DotProduct(const Vector3Df vector2)
   {
      return (double)x * (double)vector2.x + (double)y * (double)vector2.y + (double)z * (double)vector2.z;
   }

   void CrossProduct(const Vector3Df vector1, const Vector3Df vector2)
   {
      x = vector1.y * vector2.z - vector1.z * vector2.y;
      y = vector1.z * vector2.x - vector1.x * vector2.z;
      z = vector1.x * vector2.y - vector1.y * vector2.x;
   }

   void Normalize(const Vector3Df source)
   {
      /*
      float m = source.length;
      if(m)
      {
         x = source.x/m;
         y = source.y/m;
         z = source.z/m;
      }
      else
         x = y = z = 0;
      */
      float i = FastInvSqrt(source.x * source.x + source.y * source.y + source.z * source.z);
      x = source.x * i;
      y = source.y * i;
      z = source.z * i;
   }

   void MultMatrix(const Vector3Df source, const Matrix matrix)
   {
       x = (float)(source.x * matrix.m[0][0] + source.y * matrix.m[1][0] + source.z * matrix.m[2][0] + matrix.m[3][0]);
       y = (float)(source.x * matrix.m[0][1] + source.y * matrix.m[1][1] + source.z * matrix.m[2][1] + matrix.m[3][1]);
       z = (float)(source.x * matrix.m[0][2] + source.y * matrix.m[1][2] + source.z * matrix.m[2][2] + matrix.m[3][2]);
   }

   void MultQuaternion(const Vector3Df source, const Quaternion quat)
   {
      Vector3D s { source.x, source.y, source.z };
      Vector3D v { quat.x, quat.y, quat.z };
      double w = quat.w, a = w*w - (v.x*v.x+v.y*v.y+v.z*v.z) /*DotProduct(v)*/, dotVS = v.x*s.x+v.y*s.y+v.z*s.z /*v.DotProduct(s)*/;
      Vector3D cross
      {
         s.y * v.z - s.z * v.y,
         s.z * v.x - s.x * v.z,
         s.x * v.y - s.y * v.x
      };
      //cross.CrossProduct(s, v);
      x = (float)(2 * dotVS * v.x + a * s.x + 2 * w * cross.x);
      y = (float)(2 * dotVS * v.y + a * s.y + 2 * w * cross.y);
      z = (float)(2 * dotVS * v.z + a * s.z + 2 * w * cross.z);
   }

   void DivideMatrix(const Vector3Df source, const Matrix matrix)
   {
      /*
      solve(
      {
         vectorX=sourceX*m00+sourceY*m10+sourceZ*m20+m30,
         vectorY=sourceZ*m01+sourceY*m11+sourceZ*m21+m31,
         vectorZ=sourceX*m02+sourceY*m12+sourceZ*m22+m32
      }, { sourceX, sourceY, sourceZ });
      */

      float var1 = (float)(
         matrix.m[2][0] * matrix.m[0][2] * matrix.m[1][1]
       - matrix.m[0][2] * matrix.m[2][1] * matrix.m[1][0]
       - matrix.m[2][2] * matrix.m[0][0] * matrix.m[1][1]
       - matrix.m[0][2] * matrix.m[0][1] * matrix.m[1][0]
       + matrix.m[2][1] * matrix.m[0][0] * matrix.m[1][2]
       + matrix.m[0][1] * matrix.m[0][0] * matrix.m[1][2]);

      x = (float)(
         - matrix.m[2][2] * source.x * matrix.m[1][1]
         + matrix.m[2][2] * matrix.m[1][0] * source.y
         - matrix.m[2][2] * matrix.m[1][0] * matrix.m[3][1]
         + matrix.m[2][2] * matrix.m[3][0] * matrix.m[1][1]
         - matrix.m[2][0] * matrix.m[3][2] * matrix.m[1][1]
         + source.x * matrix.m[2][1] * matrix.m[1][2]
         + source.x * matrix.m[0][1] * matrix.m[1][2]
         - matrix.m[1][0] * matrix.m[0][1] * source.z
         + matrix.m[1][0] * matrix.m[2][1] * matrix.m[3][2]
         + matrix.m[1][0] * matrix.m[0][1] * matrix.m[3][2]
         - matrix.m[1][0] * matrix.m[2][1] * source.z
         - matrix.m[3][0] * matrix.m[2][1] * matrix.m[1][2]
         - matrix.m[2][0] * matrix.m[1][2] * source.y
         + matrix.m[2][0] * matrix.m[1][2] * matrix.m[3][1]
         + matrix.m[2][0] * source.z * matrix.m[1][1]
         - matrix.m[3][0] * matrix.m[0][1] * matrix.m[1][2]
         ) / var1;

      y = - (float)(
         - matrix.m[2][0] * matrix.m[0][2] * source.y
         + matrix.m[2][1] * matrix.m[0][0] * matrix.m[3][2]
         + matrix.m[2][0] * matrix.m[0][2] * matrix.m[3][1]
         + matrix.m[0][1] * matrix.m[0][0] * matrix.m[3][2]
         - matrix.m[2][1] * matrix.m[0][0] * source.z
         - matrix.m[0][2] * matrix.m[2][1] * matrix.m[3][0]
         + matrix.m[0][2] * matrix.m[0][1] * source.x
         - matrix.m[0][2] * matrix.m[0][1] * matrix.m[3][0]
         + matrix.m[0][2] * matrix.m[2][1] * source.x
         + matrix.m[2][2] * matrix.m[0][0] * source.y
         - matrix.m[0][1] * matrix.m[0][0] * source.z
         - matrix.m[2][2] * matrix.m[0][0] * matrix.m[3][1]
         ) / var1;

      z = (float)(
         source.x * matrix.m[0][2] * matrix.m[1][1]
         + matrix.m[0][0] * matrix.m[3][2] * matrix.m[1][1]
         + matrix.m[0][0] * matrix.m[1][2] * source.y
         - matrix.m[0][0] * matrix.m[1][2] * matrix.m[3][1]
         - matrix.m[0][0] * source.z * matrix.m[1][1]
         - matrix.m[1][0] * matrix.m[0][2] * source.y
         + matrix.m[1][0] * matrix.m[0][2] * matrix.m[3][1]
         - matrix.m[3][0] * matrix.m[0][2] * matrix.m[1][1]
         ) / var1;
   }

   property float length { get { return (float)sqrt(x * x + y * y + z * z); } };
   property float lengthApprox
   {
      get
      {
         float ix = Abs(x), iy = Abs(y), iz = Abs(z);
         float tmp;
         if(ix < iy) { tmp = ix; ix = iy; iy = tmp; }
         if(ix < iz) { tmp = ix; ix = iz; iz = tmp; }
         if(iz > iy) { iz = iy; }
         return ix + (iz/2);
      }
   }
   /*
   property Vector3D
   {
      get
      {
         value.x = (double) x;
         value.y = (double) y;
         value.z = (double) z;
      }
      set
      {
         x = (float) value.x;
         y = (float) value.y;
         z = (float) value.z;
      }
   }
   */
};
