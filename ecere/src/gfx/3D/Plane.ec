namespace gfx3D;

import "Display"

public struct Line
{
   Vector3D p0;
   Vector3D delta;

   bool IntersectSphere(double radius, double * t)
   {
      double a = delta.DotProduct(delta);
      double b = 2 * delta.DotProduct(p0);
      double c = p0.DotProduct(p0) - radius * radius;
      double disc = b * b - 4 * a * c;
      if(disc >= 0)
      {
         double distSqrt = sqrt(disc);
         double q = ((b < 0) ? (-b - distSqrt) : (-b + distSqrt)) /2;
         double t0 = q / a, t1 = c / q;
         if (t0 > t1)
         {
            double temp = t0;
            t0 = t1;
            t1 = temp;
         }
         if (t1 >= 0)
         {
            if(t)
              *t = (t0 >= 0) ? t0 : t1;
            return true;
         }
      }
      return false;
   }
};

public struct Plane
{
   union
   {
      struct { double a, b, c; };
      Vector3D normal;
   };
   double d;

   void FromPoints(const Vector3D v1, const Vector3D v2, const Vector3D v3)
   {
      Vector3D a, b;

      a.Subtract(v3, v1);
      b.Subtract(v2, v1);
      normal.CrossProduct(a, b);
      normal.Normalize(normal);

      d = -normal.DotProduct(v1);
   }

   void FromPointsf(const Vector3Df v1, const Vector3Df v2, const Vector3Df v3)
   {
      Vector3D v1d { (double)v1.x, (double)v1.y, (double)v1.z };
      Vector3D v2d { (double)v2.x, (double)v2.y, (double)v2.z };
      Vector3D v3d { (double)v3.x, (double)v3.y, (double)v3.z };
      Vector3D a, b;

      a.Subtract(v3d, v1d);
      b.Subtract(v2d, v1d);
      normal.CrossProduct(a, b);
      normal.Normalize(normal);

      d = -normal.DotProduct(v1d);
   }

   void MultMatrix(const Plane source, const Matrix inverseTranspose)
   {
      a = source.a * inverseTranspose.m[0][0] +
          source.b * inverseTranspose.m[1][0] +
          source.c * inverseTranspose.m[2][0];
      b = source.a * inverseTranspose.m[0][1] +
          source.b * inverseTranspose.m[1][1] +
          source.c * inverseTranspose.m[2][1];
      c = source.a * inverseTranspose.m[0][2] +
          source.b * inverseTranspose.m[1][2] +
          source.c * inverseTranspose.m[2][2];
      d = source.a * inverseTranspose.m[0][3] +
          source.b * inverseTranspose.m[1][3] +
          source.c * inverseTranspose.m[2][3] +
          source.d;
   }

   void IntersectLine(const Line line, Vector3D result)
   {
      double divisor = a * line.delta.x + b * line.delta.y + c * line.delta.z;

      result.x = (b * line.delta.y * line.p0.x - b * line.delta.x * line.p0.y +
                  c * line.delta.z * line.p0.x - c * line.delta.x * line.p0.z -
                  d * line.delta.x ) / divisor;

      result.y = (a * line.delta.x * line.p0.y - a * line.delta.y * line.p0.x +
                  c * line.delta.z * line.p0.y - c * line.delta.y * line.p0.z -
                  d * line.delta.y ) / divisor;

      result.z = (a * line.delta.x * line.p0.z - a * line.delta.z * line.p0.x +
                  b * line.delta.y * line.p0.z - b * line.delta.z * line.p0.y -
                  d * line.delta.z ) / divisor;
   }

   void IntersectLinef(const Line line, Vector3Df result)
   {
      // 1.0 / Dot product of plane normal and line
      double divisor = 1.0 / (a * line.delta.x + b * line.delta.y + c * line.delta.z);

      result.x = (float)((b * line.delta.y * line.p0.x - b * line.delta.x * line.p0.y +
                  c * line.delta.z * line.p0.x - c * line.delta.x * line.p0.z -
                  d * line.delta.x ) * divisor);

      result.y = (float)((a * line.delta.x * line.p0.y - a * line.delta.y * line.p0.x +
                  c * line.delta.z * line.p0.y - c * line.delta.y * line.p0.z -
                  d * line.delta.y ) * divisor);

      result.z = (float)((a * line.delta.x * line.p0.z - a * line.delta.z * line.p0.x +
                  b * line.delta.y * line.p0.z - b * line.delta.z * line.p0.y -
                  d * line.delta.z ) * divisor);
   }

   int IntersectLinefT(const Line line, Vector3Df result, double * rt)
   {
      int r = 0;
      double t;
      double dot = normal.x * line.delta.x + normal.y * line.delta.y + normal.z * line.delta.z; // normal.DotProduct(line.delta);
      double adot = fabs(dot);
      if(adot > 1E-11)
      {
         if(adot < 0.001)
         {
            double divisor = 1.0 / dot;
            result.x = (float)((b * line.delta.y * line.p0.x - b * line.delta.x * line.p0.y +
                                c * line.delta.z * line.p0.x - c * line.delta.x * line.p0.z -
                                d * line.delta.x ) * divisor);
            result.y = (float)((a * line.delta.x * line.p0.y - a * line.delta.y * line.p0.x +
                                c * line.delta.z * line.p0.y - c * line.delta.y * line.p0.z -
                                d * line.delta.y ) * divisor);
            result.z = (float)((a * line.delta.x * line.p0.z - a * line.delta.z * line.p0.x +
                                b * line.delta.y * line.p0.z - b * line.delta.z * line.p0.y -
                                d * line.delta.z ) * divisor);
            if(fabs(line.delta.x) > fabs(line.delta.y) && fabs(line.delta.x) > fabs(line.delta.z))
               t = (result.x - line.p0.x) / line.delta.x;
            else if(fabs(line.delta.y) > fabs(line.delta.z))
               t = (result.y - line.p0.y) / line.delta.y;
            else
               t = (result.z - line.p0.z) / line.delta.z;
         }
         else
         {
            double distance = d + line.p0.x * normal.x + line.p0.y * normal.y + line.p0.z * normal.z; // line.p0.DotProduct(normal);

            t = -distance / dot;
            result = { (float)(line.p0.x + line.delta.x * t), (float)(line.p0.y + line.delta.y * t), (float)(line.p0.z + line.delta.z * t) };
            r = 1;
         }
      }
      else
      {
         double distance = d + line.p0.x * normal.x + line.p0.y * normal.y + line.p0.z * normal.z; // line.p0.DotProduct(normal);

         // Line is parallel to the plane
         t = 0;
         result = { (float)line.p0.x, (float)line.p0.y, (float)line.p0.z };
         r = (distance == 0 ? 2 : 0); // The whole line intersects with the plane if p0 is at 0 distance
      }

      if(rt) *rt = t;
      return r;
   }

   void FromPointNormal(const Vector3D normal, const Vector3D point)
   {
      this.normal = normal;
      d = -(normal.x * point.x + normal.y * point.y + normal.z * point.z);
   }

   #define EPSILON 0.00001f

   private uint IntersectSegment(const Vector3Df a, const Vector3Df b, Vector3Df i)
   {
      Line line { { a.x, a.y, a.z }, { (double)b.x - (double)a.x, (double)b.y - (double)a.y, (double)b.z - (double)a.z } };
      double t;
      Vector3Df v;
      int r = IntersectLinefT(line, v, &t);
      i = v;
      return (r == 1 && t > EPSILON && t < 1 - EPSILON) | ((r && fabs(t) < EPSILON) << 1) | ((r && fabs(t - 1) < EPSILON) << 2);
   }

   // Returns the number of intersections
   // NOTE: Currently this does not consider triangles co-planar with the plane
   private int IntersectTriangle(const Vector3Df a, const Vector3Df b, const Vector3Df c, Vector3Df * i)
   {
      int n = 0;
      Vector3Df v;
      uint r = IntersectSegment(a, b, v);
      if(r)
      {
         if(r == 1) i[n++] = v;
         if(r & 2) i[n++] = a;
         if(r & 4) i[n++] = b;
      }

      r = IntersectSegment(b, c, v);
      if(r)
      {
         if(r == 1) i[n++] = v;
         if(r & 4) i[n++] = b;
      }

      r = IntersectSegment(c, a, v);
      if(r)
      {
         if(r == 1) i[n++] = v;
         if(r & 2) i[n++] = c;
      }
      return n;
   }
};
