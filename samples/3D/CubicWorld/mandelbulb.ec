import "ecere"

double epsilon = 0.001;

struct HyperComplex
{
   double a, b, c;
};

struct Mandelbulb
{
   Vector3D size;
   double power;

   int isPointInside(Vector3Df p, int iters)
   {
      HyperComplex Z { };
      HyperComplex C { p.x * 4 / size.x, p.y * 4 / size.y, p.z * 4 / size.z};
      int i;
      double zm;

      for(i = 0; i < iters; i++)
      {
         if(i > 0)
         {
            double theta = atan2(sqrt(Z.a*Z.a + Z.b*Z.b), Z.c) * power;
            double phi = atan2(Z.b, Z.a) * power;
            double raised = zm*zm*zm*zm*zm*zm*zm*zm;
            double sinT = sin(theta);

            Z.a = raised * sinT * cos(phi) + C.a;
            Z.b = raised * sinT * sin(phi) + C.b;
            Z.c = raised * cos(theta)      + C.c;
         }
         else
            Z = C;

         zm = 1.0 / FastInvSqrtDouble(Z.a * Z.a + Z.b * Z.b + Z.c * Z.c);

         if(zm - epsilon >= 2)
            return 0;
      }
      return (int)(zm * 5);
   }
};
