public import "ecere"

import "raytracer"

static define maxThreads = 32; //6;

public class BaseView3D : Window
{
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   borderStyle = sizable;
   clientSize = { 600, 600 };
   text = "Hit Space to start rendering, 'S' to save";

   bool moving, lightMoving;
   Point startPosition;
   Euler startOrientation;

   public Camera camera;
   public RTScene scene;

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
      if(!moving && !lightMoving && scene.lights.count)
      {
         Light * light = scene.lights[0];
         startPosition.x = x;
         startPosition.y = y;
         startOrientation = light->orientation;
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
            startOrientation.yaw   - (x - startPosition.x) * 0.1,
            startOrientation.pitch + (y - startPosition.y) * 0.1,
            startOrientation.roll
         };

         camera.orientation = euler;

         Update(null);
      }
      else if(lightMoving && scene.lights.count)
      {
         Light * light = scene.lights[0];
         light->orientation = Euler
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
   RTView view3D;

   unsigned int Main()
   {
      Bitmap bitmap = view3D.bitmap;
      ColorAlpha * picture = (ColorAlpha *)bitmap.picture;
      uint stride = bitmap.stride;
      int y, x;
      Line ray;
      Camera camera = view3D.camera;
      RTScene scene = view3D.scene;

      ray.p0 = camera.cPosition;

      for(y = start; y <= end && !view3D.abort; y++)
      {
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
                  camera.Untransform(v, end);   // REVIEW: Why is end behind camera?
                  // ray.delta.Subtract(end, ray.p0);
                  ray.delta.Subtract(ray.p0, end);

                  if(scene.Trace(camera, ray, color))   // The ray is in world space
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

public class RTView : BaseView3D
{
   bool processing;
   bool abort;
   Bitmap bitmap { };
   int numThreads; numThreads = maxThreads;

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
            RenderThread threads[maxThreads];
            GuiApplication thisApp = (GuiApplication)__thisModule.application;

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
               /*
               vector = light->direction;
               // Don't move lights with camera...
               mat.RotationQuaternion(camera.cOrientation);
               light->direction.MultMatrix(vector, mat);
               */
            }
            scene.Compute();

            if(numThreads > maxThreads) numThreads = maxThreads;

            for(t = 0; t < numThreads; t++)
            {
               threads[t] = RenderThread { view3D = this, start = t * (bitmap.height / numThreads), end = Min(bitmap.height-1, (t+1) * (bitmap.height / numThreads) -1) };
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
               if(thisApp.ProcessInput(true))
                  thisApp.Wait();
               Update(null);
               UpdateDisplay();
            }
            Update(null);
            UpdateDisplay();

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
