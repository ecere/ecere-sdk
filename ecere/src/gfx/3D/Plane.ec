namespace gfx3D;

import "Display"

public struct Line
{
   Vector3D p0;
   Vector3D delta;
};

public struct Plane
{
   union
   {
      struct { double a, b, c; };
      Vector3D normal;
   };
   double d;

   void FromPoints(Vector3D v1, Vector3D v2, Vector3D v3)
   {
      Vector3D a, b;

      a.Subtract(v3, v1);
      b.Subtract(v2, v1);
      normal.CrossProduct(a, b);
      normal.Normalize(normal);

      d = -normal.DotProduct(v1);
   }

   void FromPointsf(Vector3Df v1, Vector3Df v2, Vector3Df v3)
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

   void MultMatrix(Plane source, Matrix inverseTranspose)
   {
      a = source.a * inverseTranspose.m[0][0] +
          source.b * inverseTranspose.m[1][0] +
          source.c * inverseTranspose.m[2][0] +
          source.d * inverseTranspose.m[3][0];
      b = source.a * inverseTranspose.m[0][1] +
          source.b * inverseTranspose.m[1][1] +
          source.c * inverseTranspose.m[2][1] +
          source.d * inverseTranspose.m[3][1];
      c = source.a * inverseTranspose.m[0][2] +
          source.b * inverseTranspose.m[1][2] +
          source.c * inverseTranspose.m[2][2] +
          source.d * inverseTranspose.m[3][2];
      d = source.a * inverseTranspose.m[0][3] +
          source.b * inverseTranspose.m[1][3] +
          source.c * inverseTranspose.m[2][3] +
          source.d * inverseTranspose.m[3][3];
   }

   void IntersectLine(Line line, Vector3D result)
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

   void IntersectLinef(Line line, Vector3Df result)
   {
      double divisor = a * line.delta.x + b * line.delta.y + c * line.delta.z;

      result.x = (float)((b * line.delta.y * line.p0.x - b * line.delta.x * line.p0.y +
                  c * line.delta.z * line.p0.x - c * line.delta.x * line.p0.z -
                  d * line.delta.x ) / divisor);

      result.y = (float)((a * line.delta.x * line.p0.y - a * line.delta.y * line.p0.x +
                  c * line.delta.z * line.p0.y - c * line.delta.y * line.p0.z -
                  d * line.delta.y ) / divisor);

      result.z = (float)((a * line.delta.x * line.p0.z - a * line.delta.z * line.p0.x +
                  b * line.delta.y * line.p0.z - b * line.delta.z * line.p0.y -
                  d * line.delta.z ) / divisor);
   }

   void FromPointNormal(Vector3D normal, Vector3D point)
   {
      this.normal = normal;
      d = -(normal.x * point.x + normal.y * point.y + normal.z * point.z);
   }
};
