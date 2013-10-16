/********************************************************
   This sample renders the Mandelbulb with a simple
   raytracer. The Mandelbulb is a 3D version of the
   Mandelbrot set according to the formula:

   Z -> Z^8 + C where Z and C are hypercomplex number
   representing spherical coordinates.

   For more information about the Mandelbulb visit:

 http://www.skytopia.com/project/fractal/mandelbulb.html
********************************************************/
import "ecere"

public struct ColorARGBd { double a, r, g, b; };

struct HyperComplex
{
   double a, b, c;
};

define numThreads = 6;
define iters = 5;//10;
define power = 8;
double epsilon = 0.001;

double startOffDistance = 0.01;
double minDistance = 0.1; //angleOffset * 2;
define angleOffset = 0.0001;

// Normals Computing
//define angleOffset = 0.02;
//define safetyFactor = 1.1;//1.6;
//define angleOffset = 1;
//define angleOffset = 0.03;
//define angleOffset = 0.0001;
//double minDistance = angleOffset*2;
//double minDistance = 0.01

Light light
{
   multiplier = 0.75f;
   diffuse = lightSkyBlue;
   specular = blue;
   //orientation = Euler { pitch = 35, yaw = 15 };
   //orientation = Euler { pitch = -55, yaw = -25 };
   //orientation = Euler { Degrees { 0 } };
   //orientation = Euler { pitch = 140, 75 };
   //orientation = Euler { 40, -24 };
   //orientation = Euler { 0,0 };
   orientation = Euler { 15, -24 };
};

Light light2
{
   multiplier = 0.75f;
   diffuse = lightYellow;
   specular = white;
   //orientation = Euler { pitch = 35, yaw = 15 };
   //orientation = Euler { pitch = -55, yaw = -25 };
   //orientation = Euler { Degrees { 0 } };
   orientation = Euler { yaw = 35, pitch = 40 };
   //orientation = Euler { 40, -24 };
   //orientation = Euler { 0,0 };
   //orientation = Euler { 15, 24 };
};

/*Light light3
{
   multiplier = 1;
   ambient = { 0.2, 0.2, 0.2 };
   diffuse = gray;
   specular = white;
   orientation = Euler { yaw = 35, pitch = -40};
};*/


Camera camera
{
   attachedQuaternion,
   position = { 0, 0, -80 };

   //orientation = Euler { -30, 0, 0 },

   //orientation = Euler { 30, 50, 0 },
   //orientation = Euler { 0, 179, 0 },
   fov = 53;
};

class BaseView3D : Window
{
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   borderStyle = sizable;
   clientSize = { 400, 400 };
   text = "Hit Space to start rendering, 'S' to save";

   bool moving, lightMoving;
   Point startPosition;
   Euler startOrientation;

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(!moving && !lightMoving)
      {
         startPosition.x = x;
         startPosition.y = y;
         startOrientation = camera.orientation;
         Capture();
         moving = true;
      }
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(moving)
      {
         ReleaseCapture();
         moving = false;
      }
      return true;
   }
   bool OnRightButtonDown(int x, int y, Modifiers mods)
   {
      if(!moving && !lightMoving)
      {
         startPosition.x = x;
         startPosition.y = y;
         startOrientation = light.orientation;
         Capture();
         lightMoving = true;
      }
      return true;
   }

   bool OnRightButtonUp(int x, int y, Modifiers mods)
   {
      if(lightMoving)
      {
         ReleaseCapture();
         lightMoving = false;
      }
      return true;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      if(moving)
      {
         Euler euler
         {
            startOrientation.yaw   - (x - startPosition.x),
            startOrientation.pitch + (y - startPosition.y),
            startOrientation.roll
         };

         camera.orientation = euler;

         Update(null);
      }
      else if(lightMoving)
      {
         light.orientation = Euler
         {
            startOrientation.yaw   - (x - startPosition.x),
            startOrientation.pitch + (y - startPosition.y),
            startOrientation.roll
         };

         Update(null);
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      switch((SmartKey) key)
      {
         case wheelDown: case minus: camera.position.z *= 1.1111111f; Update(null); break;
         case wheelUp: case plus: camera.position.z *= 0.9f; Update(null); break;
      }
      return true;
   }
}

class RenderThread : Thread
{
   int start, end;
   bool done;
   unsigned int Main()
   {
      Bitmap bitmap = view3D.bitmap;
      ColorAlpha * picture = (ColorAlpha *)bitmap.picture;
      uint stride = bitmap.stride;
      int y, x;
      Line ray;
      ray.p0 = camera.cPosition;

      for(y = start; y <= end && !view3D.abort; y++)
      {
         Box box { 0, y, bitmap.width, y };

         for(x = 0; x < bitmap.width && !view3D.abort; x++)
         {
            Vector3D v, end;
            double a = 0, r = 0, g = 0, b = 0;
            double xx, yy;
            int xi, yi;
            ColorARGBd color;
            int count = 3;

            for(xi = 0, xx = x - 0.5; xi < count; xi++, xx += 0.5)
            {
               for(yi = 0, yy = y - 0.5; yi < count; yi++, yy += 0.5)
               {
                  camera.Unproject({ xx, yy, camera.zMin }, v);
                  camera.Untransform(v, end);
                  ray.delta.Subtract(end, ray.p0);

                  if(scene.Trace(ray, color))
                  {
                     a += color.a;
                     r += color.r;
                     g += color.g;
                     b += color.b;
                  }
               }
            }
            a /= count*count;
            r /= count*count;
            g /= count*count;
            b /= count*count;

            picture[y * stride + x] =
            {
               (byte)Min(255, Max(0, a*255)),
               { (byte)Min(255, Max(0, r*255)), (byte)Min(255, Max(0, g*255)), (byte)Min(255, Max(0, b*255)) }
            };
         }
      }
      done = true;

      return 0;
   }
}

class RTView : BaseView3D
{
   bool processing;
   bool abort;
   Bitmap bitmap { };

   void OnResize(int width, int height)
   {
      BaseView3D::OnResize(width, height);
   }

   void OnRedraw(Surface surface)
   {
      if(bitmap.width == clientSize.w && bitmap.height && clientSize.h)
         surface.Blit(bitmap, 0,0, 0, 0, bitmap.width, bitmap.height);
      else
         surface.Filter(bitmap, 0,0, 0, 0, clientSize.w, clientSize.h, bitmap.width, bitmap.height);
   }

   bool OnClose(bool parentClosing)
   {
      abort = true;
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      if(key == s)
      {
         if(bitmap.Save("output.png", null, null))
            ShellOpen("output.png");
      }
      if(key == space)
      {
         if(!processing)
         {
            int t;
            RenderThread threads[numThreads];
            processing = true;
            abort = false;

            if(bitmap.width != clientSize.w || bitmap.height != clientSize.h)
               bitmap.Allocate(null, clientSize.w, clientSize.h, 0, pixelFormat888, false);

            memset(bitmap.picture, 0xFF, bitmap.sizeBytes);

            Update(null);
            UpdateDisplay();

            camera.Setup(bitmap.width, bitmap.height, null);
            camera.Update();

            for(lt : scene.lights)
            {
               Light * light = lt;
               Matrix mat;
               Vector3D vector { 0,0,1 };
               mat.RotationQuaternion(light->orientation);
               light->direction.MultMatrix(vector, mat);
               light->direction.Normalize(light->direction);
               vector = light->direction;
               mat.RotationQuaternion(camera.cOrientation);
               light->direction.MultMatrix(vector, mat);
            }
            scene.Compute();

            for(t = 0; t < numThreads; t++)
            {
               threads[t] = RenderThread { start = t * (bitmap.height / numThreads), end = Min(bitmap.height-1, (t+1) * (bitmap.height / numThreads) -1) };
               if(t == numThreads-1) threads[t].end = bitmap.height-1;
               incref threads[t];
               threads[t].Create();
            }
            while(true)
            {
               for(t = 0; t < numThreads; t++)
               {
                  if(!threads[t].done) break;
               }
               if(t == numThreads)
                  break;
               if(app.ProcessInput(true))
                  app.Wait();
               Update(null);
               UpdateDisplay();
            }

            for(t = 0; t < numThreads; t++)
               delete threads[t];

            processing = false;
         }
         else
            abort = true;
      }
      return true;
   }
}

class RTObject
{
   Material material { diffuse = { 40/255.0f, 200/255.0f, 1.0f } };
   Quaternion orientation { 1, 0, 0, 0 };
   Vector3D localLightDirection[2];
   Vector3D localCameraDirection;

   virtual void Compute();
   virtual bool Render(Line ray, ColorARGBd * color, Vector3D intersect, Vector3D vIntersect)
   {
      return false;
   }
}

class RTScene
{
   List<RTObject> objects { };
   List<Light *> lights { };
   void Compute()
   {
      for(o : objects)
         o.Compute();
   }
   bool Trace(Line ray, ColorARGBd color)
   {
      Vector3D vIntersect;
      double z = MAXDOUBLE;
      bool result = false;
      color = { };

      for(o : objects)
      {
         ColorARGBd newColor;

         // TOFIX: &ray here has different behavior?
         if(o.Render(ray, newColor, null, vIntersect) && vIntersect.z < z)
         {
            z = vIntersect.z;
            // TODO: Add blending support here
            color = newColor;
            result = true;
         }
      }
      return result;
   }
}

class RTCube : RTObject
{
   Vector3D size;
   Vector3D center;
   Plane planes[6];
   Vector3D normals[6];
   Matrix mat { };
   Matrix inverse { };

   void Compute()
   {
      int c;
      Vector3D vertices[24] =
      {
         { -size.x/2,-size.y/2,-size.z/2 },
         {  size.x/2,-size.y/2,-size.z/2 },
         {  size.x/2, size.y/2,-size.z/2 },
         { -size.x/2, size.y/2,-size.z/2 },
         { -size.x/2,-size.y/2, size.z/2 },
         {  size.x/2,-size.y/2, size.z/2 },
         {  size.x/2, size.y/2, size.z/2 },
         { -size.x/2, size.y/2, size.z/2 },

         { -size.x/2,-size.y/2,-size.z/2 },
         {  size.x/2,-size.y/2,-size.z/2 },
         {  size.x/2, size.y/2,-size.z/2 },
         { -size.x/2, size.y/2,-size.z/2 },
         { -size.x/2,-size.y/2, size.z/2 },
         {  size.x/2,-size.y/2, size.z/2 },
         {  size.x/2, size.y/2, size.z/2 },
         { -size.x/2, size.y/2, size.z/2 },

         { -size.x/2,-size.y/2,-size.z/2 },
         {  size.x/2,-size.y/2,-size.z/2 },
         {  size.x/2, size.y/2,-size.z/2 },
         { -size.x/2, size.y/2,-size.z/2 },
         { -size.x/2,-size.y/2, size.z/2 },
         {  size.x/2,-size.y/2, size.z/2 },
         {  size.x/2, size.y/2, size.z/2 },
         { -size.x/2, size.y/2, size.z/2 }
      };

      uint16 indices[6][4] =
      {
         // up, front, down, back, right, left
         { 17,21,20,16 },
         { 0,3,2,1 },
         { 22,18,19,23 },
         { 5,6,7,4 },
         { 9,10,14,13 },
         { 12,15,11,8 }
         //{ 8,11,15,12 }
      };
      Matrix m2;
      Vector3D vector { 0, 0, 1 };
      mat.RotationQuaternion(orientation);
      m2.RotationQuaternion(orientation);
      inverse.Transpose(m2);
      c = 0;
      for(lt : scene.lights)
      {
         Light * light = lt;
         localLightDirection[c].MultMatrix(light->direction, inverse);
         localLightDirection[c].Normalize(localLightDirection[c]);
         c++;
      }
      localCameraDirection.MultMatrix(vector, inverse);
      localCameraDirection.Normalize(localCameraDirection);

      for(c = 0; c < 24; c++)
      {
         Vector3D v;
         v.MultMatrix(vertices[c], mat);
         vertices[c].Add(v, center);
      }

      for(c = 0; c < 6; c++)
         planes[c].FromPoints(vertices[indices[c][0]], vertices[indices[c][1]], vertices[indices[c][2]]);
   }

   bool Render(Line ray, ColorARGBd * color, Vector3D i, Vector3D vi)
   {
      int plane;
      Vector3D intersect, lastIntersect;
      bool gotIntersect = false;
      Color colors[6] =
      {
         yellow, blue, red, green, orange, purple
      };

      for(plane = 0; plane < 6; plane++)
      {
         double divisor = planes[plane].a * ray.delta.x + planes[plane].b * ray.delta.y + planes[plane].c * ray.delta.z;
         if(divisor)
         {
            int c;
            bool visible = true;
            int sign = 0;
            planes[plane].IntersectLine(ray, intersect);
            for(c = 0; c < 6; c++)
            {
               if(c != plane)
               {
                  double result = planes[c].a * intersect.x + planes[c].b * intersect.y + planes[c].c * intersect.z + planes[c].d;
                  if(result)
                  {
                     if(result < 0)
                     {
                        visible = false;
                        break;
                     }
                  }
               }
            }

            if(visible && gotIntersect)
            {
               Vector3D v;
               camera.TransformPoint(v, intersect);

               if(v.z > lastIntersect.z)
                  visible = false;
            }
            if(visible)
            {
               if(i != null) i = intersect;

               {
                  double l = planes[plane].normal.DotProduct(localLightDirection[0]);
                  ColorRGB c = colors[plane];
                  if(l < 0) l = 0;
                  l += 0.1;
                  if(l > 1) l = 1;

                  //if(color) *color = { 255, (byte)(c.r * l), (byte)(c.g * l), (byte)(c.b * l) };

                  c.r = Min(1,Max(0, c.r));
                  c.g = Min(1,Max(0, c.g));
                  c.b = Min(1,Max(0, c.b));

                  //*color = { 255, (byte)Min(255, Max(0, r*255)), (byte)Min(255, Max(0, g*255)), (byte)Min(255, Max(0, b*255)) };
                  if(color)  *color = { 1.0, c.r, c.g, c.b };
               }

               gotIntersect = true;
               camera.TransformPoint(lastIntersect, intersect);
               if(vi != null) vi = lastIntersect;
            }
         }
      }
      return gotIntersect;
   }
}

struct Mandelbulb
{
   Vector3D size;
   double power;

   bool IsPointInside(Vector3D p, int iters)
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

   void Compute()
   {
      Quaternion q;
      bulb.size = size;
      bulb.power = power;
      RTCube::Compute();
   }

   bool WalkTowards(Line l, Vector3D is, double dt, int refineCount, bool backwards)
   {
      double t = 0;
      int refine = 0;
      double refineDT = dt;
      double stopT = MAXDOUBLE;
      bool firstPointInside = false;
      if(backwards && bulb.IsPointInside(l.p0, iters))
      {
         firstPointInside = true;
         l.delta.Scale(l.delta, -1);
      }

      while(true)
      {
         Vector3D p
         {
            l.p0.x - l.delta.x * t,
            l.p0.y - l.delta.y * t,
            l.p0.z - l.delta.z * t
         };
         if(p.x + refineDT*10 < -size.x / 2 || p.x - refineDT*10 > size.x / 2 ||
            p.y + refineDT*10 < -size.y / 2 || p.y - refineDT*10 > size.y / 2 ||
            p.z + refineDT*10 < -size.z / 2 || p.z - refineDT*10 > size.z / 2)
         {
            Print("");
            break;
         }

         if(bulb.IsPointInside(p, iters) != firstPointInside)
         {
            refine++;
            stopT = t;
            t -= refineDT;
            refineDT /= 2;
         }
         if(t > stopT)
         {
            Vector3D p
            {
               l.p0.x - l.delta.x * stopT,
               l.p0.y - l.delta.y * stopT,
               l.p0.z - l.delta.z * stopT
            };
            is = p;
            return true;
         }
         if(refine == refineCount)
         {
            if(is != null) is = p;
            return true;
         }
         t += refineDT;
      }
      return false;
   }

   bool Render(Line ray, ColorARGBd * color, Vector3D i, Vector3D vi)
   {
      Vector3D intersect;
      if(RTCube::Render(ray, null, intersect, vi))
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
                     if(WalkTowards(toBulb2, pp, (r + startOffDistance - r) / 2.0, 30, true))
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
                     if(d1 < minDistance || d1 < d2 && d1 < d3 && d1 < d4)
                     {
                        normalPlane.FromPoints(points[1], p, points[0]);
                        normal.Add(normal, normalPlane.normal);
                        count++;
                     }
                     if(d2 < minDistance || d2 < d1 && d2 < d3 && d2 < d4)
                     {
                        normalPlane.FromPoints(points[2], p, points[1]);
                        normal.Add(normal, normalPlane.normal);
                        count++;
                     }
                     if(d1 < minDistance || d3 < d1 && d3 < d2 && d3 < d4)
                     {
                        normalPlane.FromPoints(points[3], p, points[2]);
                        normal.Add(normal, normalPlane.normal);
                        count++;
                     }
                     if(d4 < minDistance || d4 < d1 && d4 < d2 && d4 < d2)
                     {
                        normalPlane.FromPoints(points[0], p, points[3]);
                        normal.Add(normal, normalPlane.normal);
                        count++;
                     }
                  }
               }
               normal.Scale(normal, 1.0/count);
               normal.Normalize(normal);

               {
                  double r = 0, g = 0, b = 0;
                  int lid = 0;

                  for(lt : scene.lights)
                  {
                     Light * light = lt;
                     double l = normal.DotProduct(localLightDirection[lid]);
                     double sl = l;
                     bool shadowed = false;
                     Line toLight { p };

                     toLight.delta = localLightDirection[lid];
                     //toLight.p0.Add(toLight.p0, toLight.delta);
                     toLight.p0.Subtract(toLight.p0, toLight.delta);

                     if(l > 0)
                     {
                        if(WalkTowards(toLight, null, 0.5, 30, false))
                           shadowed = true;
                     }

                     if(l < 0) l = 0;
                     if(shadowed) l /= 3;

                     r += light->multiplier * light->ambient.r * material.ambient.r + l * material.diffuse.r * light->multiplier * light->diffuse.r;
                     g += light->multiplier * light->ambient.g * material.ambient.g + l * material.diffuse.g * light->multiplier * light->diffuse.g;
                     b += light->multiplier * light->ambient.b * material.ambient.b + l * material.diffuse.b * light->multiplier * light->diffuse.b;

                     if(!shadowed)
                     {
                        double n2 = normal.DotProduct(normal);
                        Vector3D R = normal;
                        R.Scale(R, 2*sl/n2);
                        R.Subtract(R, localLightDirection[lid]);
                        R.Normalize(R);
                        l = R.DotProduct(localCameraDirection);
                        if(l < 0) l = 0;

                        r += pow(l, material.power) * light->multiplier * light->specular.r * material.specular.r;
                        g += pow(l, material.power) * light->multiplier * light->specular.g * material.specular.g;
                        b += pow(l, material.power) * light->multiplier * light->specular.b * material.specular.b;
                     }
                     lid++;
                  }
                  if(r < 0) r = 0; if(r > 1) r = 1;
                  if(g < 0) g = 0; if(g > 1) g = 1;
                  if(b < 0) b = 0; if(b > 1) b = 1;
                  *color = { 1.0, r, g, b };
                  //*color = { 255, (byte)Min(255, Max(0, r*255)), (byte)Min(255, Max(0, g*255)), (byte)Min(255, Max(0, b*255)) };
               }
               // *color = red;
            }
            return true;
         }
      }
      return false;
   }
}
RTScene scene { };
RTView view3D { };

class MandelbulbApp : GuiApplication
{
   bool Init()
   {
      scene.lights.Add(&light);
      scene.lights.Add(&light2);
      //scene.lights.Add(&light3);
      //scene.objects.Add(RTCube { center = { }, size = { 100, 100, 100 } });
      scene.objects.Add(RTMandelbulb {
         material.power = 16;
         material.ambient = blanchedAlmond;
         material.specular = blanchedAlmond;
         material.diffuse = blanchedAlmond,
         center = { }, orientation = Euler { yaw = 0, pitch = 220 /*-140*/ }, size = { 100, 100, 100 } });
      //scene.objects.Add(RTCube { center = { -40, 0, 0 }, orientation = Euler { 143, -138, 0 }, size = { 50, 50, 50 } });
      //scene.objects.Add(RTCube { center = {  40, 0, 0}, orientation = Euler { -145, -22, 0 }, size = { 30, 30, 30 } });
      return true;
   }
}

define app = (MandelbulbApp)__thisModule;
