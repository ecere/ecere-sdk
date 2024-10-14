/********************************************************
   The Mandelbulb is a 3D version of the
   Mandelbrot set according to the formula:

   Z -> Z^8 + C where Z and C are hypercomplex number
   representing spherical coordinates.

   For more information about the Mandelbulb visit:

 http://www.skytopia.com/project/fractal/mandelbulb.html
********************************************************/
import "ecere"

import "raytracer"

import "cube"

struct HyperComplex
{
   double a, b, c;
};

static define iters = 5;//10;
static define power = 8;
static double epsilon = 0.001;

static double startOffDistance = 0.01;
static double minDistance = 0.1; //angleOffset * 2;
static define angleOffset = 0.0001;

// Normals Computing
//static define angleOffset = 0.02;
//static define safetyFactor = 1.1;//1.6;
//static define angleOffset = 1;
//static define angleOffset = 0.03;
//static define angleOffset = 0.0001;
//static double minDistance = angleOffset*2;
//static double minDistance = 0.01

struct Mandelbulb
{
   Vector3D size;
   double power;

   bool IsPointInside(const Vector3D p, int iters)
   {
      HyperComplex Z { };
      HyperComplex C { p.x * 4 / size.x, p.y * 4 / size.y, p.z * 4 / size.z};
      int i;
      double zm;

      for(i = 0; i < iters; i++)
      {
         if(i > 0)
         {
            if(0)//power == 8)
            {
               double a;
               double x = Z.a, y = Z.b, z = Z.c;
               double x2 = x*x;
               double x4 = x2*x2;
               double x6 = x4*x2;
               double x8 = x6*x2;

               double y2 = y*y;
               double y4 = y2*y2;
               double y6 = y4*y2;
               double y8 = y6*y2;

               double z2 = z*z;
               double z4 = z2*z2;
               double z6 = z4*z2;
               double z8 = z6*z2;

               double r2xy = x2 + y2;
               double r4xy = r2xy*r2xy;
               double r6xy = r4xy*r2xy;
               double r8xy = r4xy*r4xy;
               a = 1.0 + (z8 - 28*z6*r2xy + 70*z4 * r4xy - 28*z2 * r6xy) / r8xy;
               Z.a = a * (x8 - 28*x6*y2   + 70*x4*y4 - 28*x2*y6 + y8);
               Z.b = 8*a*x*y * (x6 - 7*x4*y2 + 7*x2*y4 - y6);
               Z.c = 8*z*sqrt(r2xy)*(z2 - r2xy)*(z4 - 6*z2*r2xy + r4xy);
            }
            else
            {
               double theta = atan2(sqrt(Z.a*Z.a + Z.b*Z.b), Z.c) * power;
               double phi = atan2(Z.b, Z.a) * power;
               double raised = zm*zm*zm*zm*zm*zm*zm*zm;
               double sinT = sin(theta);

               Z.a = raised * sinT * cos(phi) + C.a;
               Z.b = raised * sinT * sin(phi) + C.b;
               Z.c = raised * cos(theta)      + C.c;
            }
            //Z.a += C.a;
            //Z.b += C.b;
            //Z.c += C.c;
         }
         else
            Z = C;

         zm = sqrt(Z.a * Z.a + Z.b * Z.b + Z.c * Z.c);
         if(zm - epsilon >= 2)
            return false;
      }
      return i == iters;
   }
};

class RTMandelbulb : RTCube
{
   Mandelbulb bulb { };

   void Compute(RTScene scene)
   {
      bulb.size = size;
      bulb.power = power;
      RTCube::Compute(scene);
   }

   bool IsPointInside(const Vector3D p)
   {
      return bulb.IsPointInside(p, iters);
   }

   bool Render(Camera camera, RTScene scene, const Line ray, ColorARGBd * color, Vector3D i, Vector3D vi)
   {
      Vector3D intersect;
      if(RTCube::Render(camera, scene, ray, null, intersect, vi))
      {
         Vector3D rayDirection;
         Vector3D localIntersect;
         Vector3D p;
         Line toBulb;

         rayDirection.MultMatrix(ray.delta, inverse);
         localIntersect.MultMatrix(intersect, inverse);

         rayDirection.Normalize(rayDirection);
         toBulb.p0 = localIntersect;
         toBulb.delta = rayDirection;

         toBulb.delta.x *= -1;
         toBulb.delta.y *= -1;
         toBulb.delta.z *= -1;

         if(WalkTowards(toBulb, p, 0.5, 30, false))
         {
            if(color)
            {
               Angle offset;
               double r = p.length;
               Angle theta = acos(p.z / r);
               Angle phi = atan2(p.y, p.x);
               Vector3D normal { };
               int count = 0;
               //Angle
               offset = 2 * asin(angleOffset / (2*r));


               /*{
                  Vector3D w, v;
                  double focal = camera.focal.w;
                  w.MultMatrix(p, mat);

                  camera.TransformPoint(v, w);
                  v.x = v.y = angleOffset;
                  offset = v.x * v.z / focal;
//                  offset = v.x*focal/v.z;
                  minDistance = offset * 2;
               }*/
               //offset = startOffset;

               //for(offset = startOffset - offset/2.0; offset < startOffset + offset/2.0; offset += startOffset/10.0)
               {
                  Vector3D points[4];
                  bool found[4] = { 0 };
                  int c;
                  int numFound = 0;
                  double distances[4];

                  if(i != null) i = p;
                  if(vi != null)
                  {
                     Vector3D wp;
                     wp.MultMatrix(p, mat);
                     camera.TransformPoint(vi, wp);
                  }

                  for(c = 0; c < 4; c++)
                  {
                     Line toBulb2;
                     Vector3D pp;
                     Angle otheta = theta, ophi = phi;
                     double sinT;
                     switch(c)
                     {
                        case 0: otheta += offset; break;
                        case 1: ophi += offset;   break;
                        case 2: otheta -= offset; break;
                        case 3: ophi -= offset;   break;
                     }
                     sinT = sin(otheta);
                     toBulb2.p0.x = (r + startOffDistance) /** safetyFactor*/ * sinT * cos(ophi);
                     toBulb2.p0.y = (r + startOffDistance) /** safetyFactor*/ * sinT * sin(ophi);
                     toBulb2.p0.z = (r + startOffDistance) /** safetyFactor*/ * cos(otheta);

                     toBulb2.delta = toBulb2.p0;
                     toBulb2.delta.Normalize(toBulb2.delta);

                     //if(WalkTowards(toBulb2, pp, ((r * safetyFactor) - r) / 2.0, 30))
                     if(WalkTowards(toBulb2, pp, startOffDistance / 2.0, 30, true))
                     {
                        Vector3D dif { pp.x - p.x, pp.y - p.y, pp.z - p.z };
                        double d = dif.x*dif.x+dif.y*dif.y+dif.z*dif.z;
                        distances[c] = d;
                        found[c] = true;
                        numFound++;
                        points[c] = pp;
                     }
                  }

                  if(numFound >= 2)
                  {
                     Plane normalPlane { };

                     double d1 = (found[0] && found[2]) ? (distances[0] * distances[1]) : MAXDOUBLE;
                     double d2 = (found[1] && found[2]) ? (distances[1] * distances[2]) : MAXDOUBLE;
                     double d3 = (found[2] && found[3]) ? (distances[2] * distances[3]) : MAXDOUBLE;
                     double d4 = (found[3] && found[0]) ? (distances[3] * distances[0]) : MAXDOUBLE;
                     if(d1 < minDistance || (d1 < d2 && d1 < d3 && d1 < d4))
                     {
                        normalPlane.FromPoints(points[0], p, points[1]);
                        normal.Add(normal, normalPlane.normal);
                        count++;
                     }
                     if(d2 < minDistance || (d2 < d1 && d2 < d3 && d2 < d4))
                     {
                        normalPlane.FromPoints(points[1], p, points[2]);
                        normal.Add(normal, normalPlane.normal);
                        count++;
                     }
                     if(d1 < minDistance || (d3 < d1 && d3 < d2 && d3 < d4))
                     {
                        normalPlane.FromPoints(points[2], p, points[3]);
                        normal.Add(normal, normalPlane.normal);
                        count++;
                     }
                     if(d4 < minDistance || (d4 < d1 && d4 < d2 && d4 < d2))
                     {
                        normalPlane.FromPoints(points[3], p, points[0]);
                        normal.Add(normal, normalPlane.normal);
                        count++;
                     }
                  }
               }
               normal.Scale(normal, 1.0/count);
               normal.Normalize(normal);

               applyColor(scene, normal, p, null, color);
            }
            return true;
         }
      }
      return false;
   }
}
