import "ecere"
#include <GL/gl.h>

#define WINDOW_WIDTH 768
#define WINDOW_HEIGHT 480

#define SCALE ((float)virtualDesktop.clientSize.h / WINDOW_HEIGHT)

//#define FULLSCREEN

class Window3D : struct
{
   Object cube, front, back, side;
   Bitmap bitmap;
   Material frontMaterial { };
   Material sideMaterial { };
   Material backMaterial { };
   int id;
   Degrees position, wantedPosition;
   Euler offset;
};

static char * iconFiles[] =
{
   ":icon1.png",
   ":icon2.png",
   ":icon3.png",
   ":icon4.png",
   ":icon5.png",
   ":icon6.png",
   ":icon7.png",
   ":icon8.png",
   ":icon9.png",
   ":icon10.png",
};

#define NUM_ICONS (sizeof(iconFiles)/sizeof(char *))
// #define DOCK_HEIGHT  500
#define DOCK_HEIGHT  400
#define FULL_SWITCH     ((int)dock.iconBitmaps[0].width)
#define SMALL_SCALE  0.6f
#define SWITCH_SPEED 700
#define DOCK_TIMER   1

#define SLIDING_SPEED      0.5
#define SWITCHING_SPEED    0.5
#define ENTERING_SPEED     0.5

#define ORBIT_SPEED  Degrees { 10 }

#define ORBIT_HEIGHT 1000
// #define ORBIT_HEIGHT 500

#define NUM_WINDOWS  6

typedef struct
{
   Bitmap iconBitmaps[NUM_ICONS];
   int currentIcon;
   float speed, position;
   Timer timer;
   Seconds lastTime;
} Dock;

static Seconds lastTime;

#define THICKNESS 20

static bool CreateBack(Mesh mesh, int width, int height, int depth, DisplaySystem displaySystem)
{
   bool result = false;

   if(mesh)
   {
      if(mesh.Allocate(MeshFeatures { vertices = true, texCoords1 = true }, 24, displaySystem))
      {
         Vector3Df vertices[24] =
         {
            { -(float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2, (float)height/2, (float)depth/2 },
            { -(float)width/2, (float)height/2, (float)depth/2 },

            { -(float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2, (float)height/2, (float)depth/2 },
            { -(float)width/2, (float)height/2, (float)depth/2 },

            { -(float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2, (float)height/2, (float)depth/2 },
            { -(float)width/2, (float)height/2, (float)depth/2 }
         };
         Pointf texCoords[24] =
         {
            { 0, 0 }, { 1, 0 }, { 1, 1 }, { 0, 1 },
            { 1, 0 }, { 0, 0 }, { 0, 1 }, { 1, 1 },
            { 1, 0 }, { 0, 0 }, { 0, 1 }, { 1, 1 },
            { 0, 0 }, { 1, 0 }, { 1, 1 }, { 0, 1 },
            { 0, 1 }, { 1, 1 }, { 1, 1 }, { 0, 1 },
            { 0, 0 }, { 1, 0 }, { 1, 0 }, { 0, 0 }
         };
         uint16 indices[4] =
         {
            5,6,7,4,
         };

         CopyBytes(mesh.vertices, vertices, sizeof(vertices));
         CopyBytes(((Pointf  *)mesh.texCoords), texCoords, sizeof(texCoords));

         {
            PrimitiveGroup group;
            group = mesh.AddPrimitiveGroup(quads, 4);
            if(group)
            {
               CopyBytes(group.indices, indices, sizeof(indices));
               mesh.UnlockPrimitiveGroup(group);
            }
         }
         mesh.ComputeNormals();
         result = true;
         mesh.Unlock(MeshFeatures{});
      }
   }
   return result;
}

static bool CreateFront(Mesh mesh, int width, int height, int depth, DisplaySystem displaySystem)
{
   bool result = false;
   if(mesh)
   {
      if(mesh.Allocate(MeshFeatures { vertices = true, texCoords1 = true }, 24, displaySystem))
      {
         Vector3Df vertices[24] =
         {
            { -(float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2, (float)height/2, (float)depth/2 },
            { -(float)width/2, (float)height/2, (float)depth/2 },

            { -(float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2, (float)height/2, (float)depth/2 },
            { -(float)width/2, (float)height/2, (float)depth/2 },

            { -(float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2, (float)height/2, (float)depth/2 },
            { -(float)width/2, (float)height/2, (float)depth/2 }
         };
         Pointf texCoords[24] =
         {
            { 0, 0 }, { 1, 0 }, { 1, 1 }, { 0, 1 },
            { 1, 0 }, { 0, 0 }, { 0, 1 }, { 1, 1 },
            { 1, 0 }, { 0, 0 }, { 0, 1 }, { 1, 1 },
            { 0, 0 }, { 1, 0 }, { 1, 1 }, { 0, 1 },
            { 0, 1 }, { 1, 1 }, { 1, 1 }, { 0, 1 },
            { 0, 0 }, { 1, 0 }, { 1, 0 }, { 0, 0 }
         };
         uint16 indices[4] =
         {
            0,3,2,1
         };

         CopyBytes(mesh.vertices, vertices, sizeof(vertices));
         CopyBytes(((Pointf  *)mesh.texCoords), texCoords, sizeof(texCoords));

         {
            PrimitiveGroup group;
            group = mesh.AddPrimitiveGroup(quads, 4);
            if(group)
            {
               CopyBytes(group.indices, indices, sizeof(indices));
               mesh.UnlockPrimitiveGroup(group);
            }
         }
         mesh.ComputeNormals();
         result = true;
         mesh.Unlock(MeshFeatures {});
      }
   }
   return result;
}

static bool CreateSide(Mesh mesh, int width, int height, int depth, DisplaySystem displaySystem)
{
   bool result = false;
   if(mesh)
   {
      if(mesh.Allocate(MeshFeatures { vertices = true, texCoords1 = true }, 24, displaySystem))
      {
         Vector3Df vertices[24] =
         {
            { -(float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2, (float)height/2, (float)depth/2 },
            { -(float)width/2, (float)height/2, (float)depth/2 },

            { -(float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2, (float)height/2, (float)depth/2 },
            { -(float)width/2, (float)height/2, (float)depth/2 },

            { -(float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2, (float)height/2, (float)depth/2 },
            { -(float)width/2, (float)height/2, (float)depth/2 }
         };
         Pointf texCoords[24] =
         {
            { 0, 0 }, { 1, 0 }, { 1, 1 }, { 0, 1 },
            { 1, 0 }, { 0, 0 }, { 0, 1 }, { 1, 1 },
            { 1, 0 }, { 0, 0 }, { 0, 1 }, { 1, 1 },
            { 0, 0 }, { 1, 0 }, { 1, 1 }, { 0, 1 },
            { 0, 1 }, { 1, 1 }, { 1, 1 }, { 0, 1 },
            { 0, 0 }, { 1, 0 }, { 1, 0 }, { 0, 0 }
         };
         uint16 indices[16] =
         {
            // up, down, right, left
            17,21,20,16,
            22,18,19,23,
            9,10,14,13,
            12,15,11,8
         };

         CopyBytes(mesh.vertices, vertices, sizeof(vertices));
         CopyBytes(((Pointf  *)mesh.texCoords), texCoords, sizeof(texCoords));

         {
            PrimitiveGroup group;
            group = mesh.AddPrimitiveGroup(quads, 16);
            if(group)
            {
               CopyBytes(group.indices, indices, sizeof(indices));
               mesh.UnlockPrimitiveGroup(group);
            }
         }
         mesh.ComputeNormals();
         result = true;
         mesh.Unlock(MeshFeatures{});
      }
   }
   return result;
}

class Desktop3D : Window
{
   text = "Orbiting 3D Desktop";
#ifdef FULLSCREEN
   anchor = { 0, 0, 0, 0 };
#else
   size = Size { WINDOW_WIDTH, WINDOW_HEIGHT };
#endif

   Object lookAt {};
   Camera camera
   {
      lookAt, position = {0, ORBIT_HEIGHT, -2000}, target = lookAt, eulerOrientation = Euler { pitch = 15 },
      zMin = 1, zMax = 10000, fovDirection = vertical, fov = 53
   };
   Light light;
   bool moving;
   bool movingCamera;
   Vector3Df lastMouse;
   // Object knot;
   Bitmap puzzle;

   Window clippedWindow;
   Box clipBox;

   Dock dock;
   Degrees globalPosition;
   int numWindows;

   Window poppingWindow;
   float poppingPercent;
   float poppingBiggest;

   // Camera Sliding
   Quaternion fromAngle, toAngle;
   Vector3D fromPosition, toPosition;
   float sliding;    // Camera sliding from the bottom position looking at the orbit to looking at 1 window
   float switching;  // Switching from looking at one application to the next within the orbit
   float entering;
   bool dockHidden;
   bool fullScreen;

   Timer dockTimer
   {
      this, 0;

      bool DelayExpired()
      {
         Seconds time = GetTime();
         Seconds diffTime = time - dock.lastTime;
         dock.lastTime = time;

         dock.position += (float)(dock.speed * diffTime);

         if(dock.position >= FULL_SWITCH)
         {
            dock.position = 0;
            dock.speed = 0;
            dock.currentIcon++;
            if(dock.currentIcon >= NUM_ICONS)
               dock.currentIcon -= NUM_ICONS;
            dockTimer.Stop();
         }
         else if(dock.position <= -FULL_SWITCH)
         {
            dock.position = 0;
            dock.speed = 0;
            dock.currentIcon--;
            if(dock.currentIcon < 0)
               dock.currentIcon += NUM_ICONS;
            dockTimer.Stop();
         }
         return true;
      }
   };

   Timer timer
   {
      this, 0.05;

      bool DelayExpired()
      {
         //int buttons;
         Seconds time = GetTime();
         Seconds diffTime = (time - lastTime);
         Window child;
         Degrees biggest = 0;

         //GetMouseState(&buttons, null, null);

         /*
         eObject_RotateEuler(knot, P3D(diffTime / 10, diffTime / 10, diffTime / 10),
            P3D(0,0,0), P3D(0,0,0));
            */
         Update(null); //Desktop3DSetDesktopDirty();

         /*
         if(buttons & MOUSE_RIGHT)
         {
            eCamera_Move(camera, P3D(0,0,1000 * diffTime));
            window.dirty = true;
         }
         else if(buttons & MOUSE_MIDDLE)
         {
            eCamera_Move(camera, P3D(0,0,-1000 * diffTime));
            window.dirty = true;
         }
         */

         // Orbit Rotation
         if(!fullScreen)
         {
            if(sliding == 1 && switching == 1 && entering == 1)
            {
               globalPosition += (double)diffTime * ORBIT_SPEED;

               for(child = firstChild; child; child = child.next)
               {
                  if(child.display != display)
                  {
                     Window3D window3D = Desktop3DGetWindowHandle(child);

                     if(window3D.position < window3D.wantedPosition - 0.000001)
                     {
                        window3D.wantedPosition += (double)diffTime * ORBIT_SPEED;
                        window3D.position += (double)diffTime * (window3D.wantedPosition - window3D.position);
                        window3D.position = Min(window3D.position, window3D.wantedPosition);
                        biggest = Max(biggest, window3D.wantedPosition - window3D.position);
                     }
                     else if(window3D.position > window3D.wantedPosition + 0.000001)
                     {
                        window3D.wantedPosition += (double)diffTime * ORBIT_SPEED;
                        window3D.position -= (double)diffTime * (window3D.position - window3D.wantedPosition);
                        window3D.position = Max(window3D.position, window3D.wantedPosition);
                        biggest = Max(biggest, window3D.position - window3D.wantedPosition);
                     }
                     else
                     {
                        window3D.wantedPosition += (double)diffTime * ORBIT_SPEED;
                        window3D.position += (double)diffTime * ORBIT_SPEED;
                     }
                  }
               }
            }
         }

      #define FIRST_2WINDOWS_POPUP_SPEED     0.5

         if(numWindows < 3)
         {
            poppingPercent += (float)(diffTime * FIRST_2WINDOWS_POPUP_SPEED);
            if(poppingPercent < 1)
               poppingPercent += (float)((1.0 - poppingPercent) * diffTime * FIRST_2WINDOWS_POPUP_SPEED);
            if(poppingPercent > 0.99999)
            {
               poppingWindow = null;
               poppingPercent = 1.0f;
            }
         }
         else if(biggest < 0.000001)
         {
            poppingPercent = 1;
            poppingWindow = null;
         }
         else
            poppingPercent = (float)(1.0 - (Radians)(biggest / poppingBiggest));
         poppingPercent = Min(poppingPercent, 1.0);

         if(dockHidden && virtualDesktop.activeChild && entering == 1)
         {
            Window window = virtualDesktop.activeChild;
            Window3D window3D = Desktop3DGetWindowHandle(window);

            lookAt.transform.position = window3D.cube.transform.position;
            lookAt.UpdateTransform();
            camera.Update();
            toPosition = camera.cPosition;
            toAngle = camera.cOrientation;
         }

         if(sliding < 1 || switching < 1 || entering < 1)
         {
            Quaternion angle;
            Vector3D position;
            float factor;

            if(sliding < 1)
            {
               sliding += (float)(diffTime * SLIDING_SPEED);
               sliding = Min(sliding, 1.0);
               factor = sliding;
            }
            else if(switching < 1)
            {
               switching += (float)(diffTime * SWITCHING_SPEED);
               switching = Min(switching, 1.0);
               factor = switching;
            }
            else if(entering < 1)
            {
               entering += (float)(diffTime * ENTERING_SPEED);
               entering = Min(entering, 1.0);
               factor = entering;
            }

            angle.Slerp(fromAngle, toAngle, factor);

            position.x = fromPosition.x + factor * (toPosition.x - fromPosition.x);
            position.y = fromPosition.y + factor * (toPosition.y - fromPosition.y);
            position.z = fromPosition.z + factor * (toPosition.z - fromPosition.z);

            camera.AdjustAngle(angle);
            camera.AdjustPosition(position);
         }

         Update(null);

         lastTime = time;

         return true;
      }
   };

   SkyBox sky { size = { 10000, 10000, 10000 }, folder = ":skycube", extension = "jpg" };

   bool OnCreate()
   {
      camera.Update();

      fromPosition = toPosition = camera.cPosition;
      fromAngle = toAngle = camera.cOrientation;

      // Start with dock off
      // sliding = 1;
      switching = 1;
      entering = 1;

      light.diffuse = white;
      light.specular = white;
      light.orientation = Euler {  }; //Quaternion { 1,0,Pi,0 };

      timer.Start();

      return true;
   }

   void OnResize(int width, int height)
   {
      camera.Setup(width, height, null);
   }

   bool OnLoadGraphics()
   {
      int c;

      sky.Create(displaySystem);

      /*
      eObject_Load(&knot, ":eknot.3ds", null, display);
      knot->transform.scaling = P3D(10,10,10);
      knot->transform.position = P3D(0,0, 2000);
      */

      // puzzle = eBitmap_Load(":puzzle.jpg", null, display);

      // dock.background = Bitmap {};
      // dock.background.Load(":background.jpg", null, displaySystem);
      for(c = 0; c<NUM_ICONS; c++)
      {
         dock.iconBitmaps[c] = Bitmap {};
         dock.iconBitmaps[c].Load(iconFiles[c], null, displaySystem);
      }
      lastTime = GetTime();
      return true;
   }

   void OnUnloadGraphics()
   {
      int c;

      //eObject_Free(cube, display);

      for(c = 0; c<NUM_ICONS; c++)
         dock.iconBitmaps[c].Free();
   }

   #define DOCK_SLIDING_DISTANCE    180

   void Dock_OnRedraw(Surface surface)
   {
      int c, icon = dock.currentIcon;
      float x = -120 - dock.position, starty = DOCK_HEIGHT;
      byte alpha = 255;

      if(sliding < 1)
      {
         if(dockHidden)
         {
            starty += sliding * DOCK_SLIDING_DISTANCE;
            alpha = 255 - (byte)(255*sliding);
         }
         else
         {
            starty += DOCK_SLIDING_DISTANCE - (sliding * DOCK_SLIDING_DISTANCE);
            alpha = (byte)(255*sliding);
         }
      }

      if(!dockHidden || sliding < 1)
      {
         icon -= 2;
         if(icon < 0) icon += NUM_ICONS;
      /*
         eSurface_Blit(surface, dock.background, 0,0,0,0,
            dock.background->width, dock.background->height);
      */
         for(c = 0; c<NUM_ICONS; c++)
         {
            Bitmap bitmap;
            int dx, dy, w, h;
            float scaling = SMALL_SCALE;
            float y;

            bitmap = dock.iconBitmaps[icon];

            y = starty;

            if(dock.speed > 0)
            {
               float a = dock.position / FULL_SWITCH;
               if(icon == dock.currentIcon)
               {
                  // The old one
                  scaling = (float)(1 - (1-SMALL_SCALE) * a);
               }
               else if(icon == (dock.currentIcon + 1) % NUM_ICONS)
               {
                  // The upcoming one
                  scaling = (float)(SMALL_SCALE + (1-SMALL_SCALE) * a);
               }
            }
            else if(dock.speed < 0)
            {
               float a = -dock.position / FULL_SWITCH;
               if(icon == dock.currentIcon)
               {
                  // The old one
                  scaling = 1 - (1-SMALL_SCALE) * a;
               }
               else if((icon + 1) % NUM_ICONS == dock.currentIcon)
               {
                  // The upcoming one
                  scaling = SMALL_SCALE + (1-SMALL_SCALE) * a;
               }
            }
            else if(icon == dock.currentIcon)
            {
               scaling = 1;
               if(poppingWindow)
               {
                  float percent = poppingPercent; // * poppingPercent * poppingPercent * poppingPercent;
                  y += (float) sin(percent * 2*Pi*3) * 4 + 0.5f;
               }
            }

            w = (int)(bitmap.width * scaling);
            h = (int)(bitmap.height * scaling);

            dx = (int)(x - w/2);
            dy = (int)(y - h/2);

            surface.SetForeground(ColorAlpha{alpha, white});
            surface.Stretch(bitmap, (int)(dx * SCALE), (int)(dy * SCALE), 0,0, (int)(w * SCALE), (int)(h * SCALE), bitmap.width, bitmap.height);

            x += FULL_SWITCH;

            icon ++;
            if(icon == NUM_ICONS) icon = 0;
         }
      }
   }

   #define ORBIT_RADIUS    800

   void OnRedraw(Surface surface)
   {
      Window child;

      surface.Clear(depthBuffer);

      //PrintLn("position: ", camera.cPosition);
      display.SetLight(0, &light);
      display.SetCamera(surface, camera);

      sky.Render(camera, display);

      for(child = firstChild; child; child = child.next)
      {
         if(child.is3D)
         {
            Window3D window3D = Desktop3DGetWindowHandle(child);
            Mesh mesh = window3D.front.mesh;
            int w, h;

            if(mesh.Lock(MeshFeatures { texCoords1 = true }))
            {
               ((Pointf  *)mesh.texCoords)[3].x = 0;
               ((Pointf  *)mesh.texCoords)[3].y = 0;
               ((Pointf  *)mesh.texCoords)[2].x = (float)child.size.w / window3D.bitmap.width;
               ((Pointf  *)mesh.texCoords)[2].y = 0;
               ((Pointf  *)mesh.texCoords)[1].x = (float)child.size.w / window3D.bitmap.width;
               ((Pointf  *)mesh.texCoords)[1].y = (float)child.size.h / window3D.bitmap.height;
               ((Pointf  *)mesh.texCoords)[0].x = 0;
               ((Pointf  *)mesh.texCoords)[0].y = (float)child.size.h / window3D.bitmap.height;
               mesh.Unlock(MeshFeatures {});
            }

            {
               float alpha = 0.5f;

               if(child == poppingWindow)
                  alpha = 0.5f * poppingPercent * poppingPercent * poppingPercent;
               else if(child == virtualDesktop.activeChild)
               {
                  if(entering < 1)
                  {
                     if(fullScreen)
                        alpha = 0.5f + entering / 2.0f;
                     else
                        alpha = 1.0f - entering / 2.0f;
                  }
                  else if(fullScreen)
                     alpha = 1.0f;
               }

               window3D.frontMaterial.opacity = alpha;
               window3D.sideMaterial.opacity = alpha;
               window3D.backMaterial.opacity = alpha;
            }

            if(numWindows > 6)
            {
               w = (int)(2*Pi*ORBIT_RADIUS / (numWindows+1));
               h = w * WINDOW_HEIGHT / WINDOW_WIDTH;
            }
            else
            {
               w = child.size.w;
               h = child.size.h;
            }

            if(child == poppingWindow)
            {
               Vector3D finalPosition;
               Vector3D startPositionProjected = { (-120 + 284) * SCALE, DOCK_HEIGHT * SCALE, 1.0f };
               Vector3D startPositionView, startPositionWorld;

               camera.Unproject(startPositionProjected, startPositionView);
               camera.Untransform(startPositionView, startPositionWorld);

               finalPosition.x = (float)(cos(window3D.position) * ORBIT_RADIUS);
               finalPosition.y = 0;
               finalPosition.z = (float)(sin(window3D.position) * ORBIT_RADIUS);

               window3D.cube.transform = Transform
               {
                  position =
                  {
                     startPositionWorld.x + (finalPosition.x - startPositionWorld.x) * poppingPercent,
                     startPositionWorld.y + (finalPosition.y - startPositionWorld.y) * poppingPercent,
                     startPositionWorld.z + (finalPosition.z - startPositionWorld.z) * poppingPercent
                  },
                  orientation = Euler { window3D.position - 90 + poppingPercent * 2 * 360, 10, 0 },
                  scaling = { w * poppingPercent, h * poppingPercent, 1 }
               };
            }
            else
            {
               Vector3Df scaling = Vector3Df { 1,1,1 };

               if(poppingWindow)
               {
                  int wb, hb;

                  if(numWindows-1 > 6)
                  {
                     wb = (int)(2*Pi*ORBIT_RADIUS / (numWindows));
                     hb = (int)(wb * WINDOW_HEIGHT / WINDOW_WIDTH);
                  }
                  else
                  {
                     wb = child.size.w;
                     hb = child.size.h;
                  }

                  scaling.x = wb + (w - wb);// * poppingPercent;
                  scaling.y = hb + (h - hb);// * poppingPercent;
               }
               else
               {
                  scaling.x = w;
                  scaling.y = h;
               }
               window3D.cube.transform = Transform
               {
                  position = { (float)(cos(window3D.position) * ORBIT_RADIUS), 0, (float)(sin(window3D.position) * ORBIT_RADIUS) },
                  orientation = Euler { window3D.position - 90 + window3D.offset.yaw, 10 + window3D.offset.pitch, 0 },
                  scaling = { (float)scaling.x, (float)scaling.y, (float)scaling.z };
               };
            }

            window3D.cube.UpdateTransform();

            display.DrawObject(window3D.cube);
         }
      }

      // display.DrawObject(knot);

      display.SetCamera(null, null);

      Dock_OnRedraw(surface);
   }

   Window GetCursorLocation(int x, int y, int * mx, int * my, bool * back)
   {
      Window window = null;
      Window3D window3D;
      Vector3D viewSpace, worldSpace, local;

      display.StartSelection(x, y, 1, 1);
      display.IntersectPolygons();
      display.SetCamera(null, camera);

      if(clippedWindow)
      {
         window = clippedWindow;
         window3D = Desktop3DGetWindowHandle(window);
         display.pickingPlanes = true;
         display.DrawObject(window3D.cube.Find("Front"));
      }
      else
      {
         HitRecord hit;
         OldList list;

         display.CollectHits();
         for(window = virtualDesktop.firstChild; window; window = window.next)
         {
            if(window.is3D)
            {
               window3D = Desktop3DGetWindowHandle(window);
               display.DrawObject(window3D.cube);
            }
         }
         display.GetHits(list);

         hit = list.first;
         if(hit && hit.numTags)
         {
            window = (Window)hit.tags[0];
            window3D = Desktop3DGetWindowHandle(window);
         }

         list.Free(null);
      }

      if(window)
      {
         display.GetIntersect(viewSpace);
         camera.Untransform(viewSpace, worldSpace);
         local.DivideMatrix(worldSpace, window3D.cube.matrix);

         *mx = (int)(local.x * window.size.w + window.size.w/2 + 0.5) + window.absPosition.x;
         *my = (int)(local.y * window.size.h + window.size.h/2 + 0.5) + window.absPosition.y;
         *back = local.z > 0;
      }

      display.SetCamera(null, null);
      display.StopSelection();
      display.pickingPlanes = false;

      /*
      if(clippedWindow)
      {
         int oldx = *mx, oldy = *my;
         oldx = *mx;
         oldy = *my;

         if(*mx < clipBox.left)    *mx = clipBox.left;
         if(*my < clipBox.top)     *my = clipBox.top;
         if(*mx > clipBox.right)   *mx = clipBox.right;
         if(*my > clipBox.bottom)  *my = clipBox.bottom;

         if(oldx != *mx || oldy != *my)
         {
            Vector3Df viewSpace, worldSpace;

            local.x = ((float) *mx - window.absPosition.x - window.size.w/2.0 + 0.5) / (float)window.size.w;
            local.y = ((float) *my - window.absPosition.y - window.size.h/2.0 + 0.5) / (float)window.size.h;
            local.z = -THICKNESS/2;

            worldSpace.MultMatrix(local, matrix);
            camera.TransformPoint(viewSpace, worldSpace);

            camera.Project(viewSpace, point);

            x = point.x + 0.5;
            y = point.y + 0.5;
            SetMousePosition(x, y);
         }
      }
      */
      return window;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      if(moving)
      {
         int dx = (int)(x - lastMouse.x), dy = (int)(lastMouse.y - y);
         if(movingCamera)
         {
            camera.RotateYaw(-dx, 0,0);
            camera.RotatePitch(dy, 0,0);
         }
         else
         {
            Window child = activeChild;
            Window3D window3D = Desktop3DGetWindowHandle(child);
            window3D.offset.yaw += dx;
            window3D.offset.pitch += dy;
         }
         // window.dirty = true;
         Update(null); // ?
         lastMouse.x = x;
         lastMouse.y = y;
      }
      else
      {
         int mx, my;
         bool back;
         Window clickedWindow = GetCursorLocation(x,y, &mx, &my, &back);
         if(clickedWindow)
         {
            if(Desktop3DMouseMessage(clickedWindow, 24, mx, my, &mods, false, true))
            {
            }
         }
      }

      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(!moving)
      {
         int mx, my;
         bool back;
         Window clickedWindow = GetCursorLocation(x,y, &mx, &my, &back);
         if(clickedWindow)
         {
            if(back || Desktop3DTitleBarClicked(clickedWindow, mx, my))
            {
               clickedWindow.Activate();
               movingCamera = false;
               Capture();
               moving = true;
            }
            else if(Desktop3DMouseMessage(clickedWindow, 25, mx, my, &mods, false, true))
            {
            }
         }
         else
         {
            movingCamera = true;
            Capture();
            moving = true;
         }

         lastMouse.x = x;
         lastMouse.y = y;
      }

      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      int mx, my;
      bool back;

      Window clickedWindow = GetCursorLocation(x, y, &mx, &my, &back);
      if(clickedWindow)
      {
         Desktop3DMouseMessage(clickedWindow, 26, mx, my, &mods, false, true);

      }

      if(moving)
      {
         ReleaseCapture();
         moving = false;
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar character)
   {
      static int id = 0;
      static char * shotFileNames[] =
      {
         ":img1.jpg", ":img2.jpg", ":img3.jpg", ":img4.jpg", ":img5.jpg"
      };

      switch(key)
      {
         case left:
            if(dockHidden)
            {
               Window3D window3D;
               Window ac = virtualDesktop.activeChild;

               if(fullScreen || sliding < 1 || switching < 1 || entering < 1) break;

               virtualDesktop.CycleChildren(true, false, false, true);
               if(ac == virtualDesktop.activeChild) break;

               window3D = Desktop3DGetWindowHandle(virtualDesktop.activeChild);

               fromAngle = camera.cOrientation;
               fromPosition = camera.cPosition;

               lookAt.transform.position = window3D.cube.transform.position;
               lookAt.UpdateTransform();
               camera.position = {};
               camera.eulerOrientation = Euler{};

               switching = 0;

               camera.Update();
               toPosition = camera.cPosition;
               toAngle = camera.cOrientation;

               camera.AdjustAngle(fromAngle);
               camera.AdjustPosition(fromPosition);
            }
            else
            {
               if(!dockTimer.started && !poppingWindow)
               {
                  dock.lastTime = GetTime();
                  dockTimer.Start();
                  dock.speed = -SWITCH_SPEED;
               }
            }
            break;
         case right:
            if(dockHidden)
            {
               Window3D window3D;
               Window ac = virtualDesktop.activeChild;

               if(fullScreen || sliding < 1 || switching < 1 || entering < 1) break;

               virtualDesktop.CycleChildren(false, false, false, true);
               if(ac == virtualDesktop.activeChild) break;

               window3D = Desktop3DGetWindowHandle(virtualDesktop.activeChild);

               fromAngle = camera.cOrientation;
               fromPosition = camera.cPosition;

               lookAt.transform.position = window3D.cube.transform.position;
               lookAt.UpdateTransform();

               switching = 0;

               camera.Update();
               toPosition = camera.cPosition;
               toAngle = camera.cOrientation;

               camera.AdjustAngle(fromAngle);
               camera.AdjustPosition(fromPosition);
            }
            else
            {
               if(!dockTimer.started && !poppingWindow)
               {
                  dock.lastTime = GetTime();
                  dockTimer.Start();
                  dock.speed = SWITCH_SPEED;
               }
            }
            break;
         case up:
         {
            if(poppingWindow) break;
            if(sliding == 1.0 && !dockHidden)
            {
               Quaternion fa, ta;
               Vector3D fp, tp;

               Window window = virtualDesktop.activeChild;
               if(window)
               {
                  Window3D window3D = Desktop3DGetWindowHandle(window);

                  camera.Update();
                  fa = fromAngle = camera.cOrientation;
                  fp = fromPosition = camera.cPosition;

                  camera.type = lookAt;
                  camera.position = { 0,0,0 };
                  camera.eulerOrientation = Euler {};
                  lookAt.transform.position = window3D.cube.transform.position;
                  lookAt.transform.orientation = Euler {};
                  lookAt.UpdateTransform();

                  sliding = 0;
                  dockHidden = true;

                  camera.Update();
                  tp = toPosition = camera.cPosition;
                  ta = toAngle = camera.cOrientation;

                  camera.AdjustAngle(fromAngle);
                  camera.AdjustPosition(fromPosition);
               }
            }
            if(!dockHidden) break;  // Follow through to 'full screen' if dock is hiddens
         }
         case enter:
         {
            if(sliding < 1 || switching < 1 || entering < 1) break;
            if(!dockHidden)
            {
               if(!poppingWindow)
               {
                  /*if(dock.currentIcon == 1)
                  {
                     EditBox
                     {
                        this, multiLine = true, is3D = true, borderStyle = Fixed, hasClose = true, text = "Video",
                        size = Size { WINDOW_WIDTH, WINDOW_HEIGHT }, fileName = ":430.flc"
                     }.Create();
                  }
                  else*/
                  {
                     Picture
                     {
                        this, is3D = true, borderStyle = fixed, hasClose = true, text = "3D Window",
                        size = Size { WINDOW_WIDTH, WINDOW_HEIGHT }, image = BitmapResource { fileName = shotFileNames[id] }, opacity = 1, inactive = false
                     }.Create();
                  }
                  id++;
                  id %= sizeof(shotFileNames) / sizeof(char *);
               }
            }
            else if(!fullScreen)
            {
               float distance;
               Window window = virtualDesktop.activeChild;
               Window3D window3D = Desktop3DGetWindowHandle(window);

               fromAngle = camera.cOrientation;
               fromPosition = camera.cPosition;

               distance = window3D.cube.transform.scaling.x * (float)camera.focal.w / virtualDesktop.clientSize.w;
               distance += THICKNESS/2;

               camera.type = attached;
               camera.position = {0,0,-distance};
               camera.eulerOrientation = Euler{};
               lookAt.transform.position = window3D.cube.transform.position;
               lookAt.transform.orientation = window3D.cube.transform.orientation;
               lookAt.UpdateTransform();

               entering = 0;

               camera.Update();
               toPosition = camera.cPosition;
               toAngle = camera.cOrientation;

               camera.AdjustAngle(fromAngle);
               camera.AdjustPosition(fromPosition);

               fullScreen = true;
            }
            break;
         }
         case down:
         case escape:
         case f1:
            if(sliding == 1.0 && dockHidden)
            {
               if(sliding < 1 || switching < 1 || entering < 1) break;

               fromAngle = camera.cOrientation;
               fromPosition = camera.cPosition;

               if(fullScreen)
               {
                  Window window = virtualDesktop.activeChild;
                  Window3D window3D = Desktop3DGetWindowHandle(window);

                  camera.type = lookAt;
                  camera.position = {};
                  camera.eulerOrientation = Euler {};
                  lookAt.transform.position = window3D.cube.transform.position;
                  entering = 0;
               }
               else
               {
                  camera.type = lookAt;
                  camera.position = {0, ORBIT_HEIGHT, -2000};
                  camera.eulerOrientation = Euler { pitch = 15 };
                  lookAt.transform.position = {};
                  sliding = 0;
                  dockHidden = false;
               }
               fullScreen = false;

               lookAt.transform.orientation = Euler {};
               lookAt.UpdateTransform();

               camera.Update();
               toPosition = camera.cPosition;
               toAngle = camera.cOrientation;

               camera.AdjustAngle(fromAngle);
               camera.AdjustPosition(fromPosition);
            }
            else if(key == escape)
               Destroy(0);
            break;
      }
      return true;
   }
}

static Window3D Setup3DWindow(Window window, int w, int h)
{
   Window3D window3D {};
   Window child;

   window3D.bitmap = Bitmap {};
   window3D.bitmap.AllocateDD(virtualDesktop.displaySystem, w, h);
   // window3D.bitmap.AllocateDD(virtualDesktop.displaySystem, TEXTURE_SIZE, TEXTURE_SIZE);

   window3D.cube = Object {};
   window3D.cube.tag = window;

   window3D.frontMaterial.diffuse = white;
   window3D.frontMaterial.opacity = 0.5f;
   window3D.frontMaterial.baseMap = window3D.bitmap;
   window3D.frontMaterial.flags = MaterialFlags { translucent = true, doubleSided = true };

   window3D.backMaterial.diffuse = white;
   window3D.backMaterial.opacity = 0.5f;
   window3D.backMaterial.flags = MaterialFlags { translucent = true, doubleSided = true };

   window3D.sideMaterial.diffuse = white;
   window3D.sideMaterial.opacity = 0.5f;
   window3D.sideMaterial.flags = MaterialFlags { translucent = true, doubleSided = true };

   window3D.cube.AddName((window3D.back = Object {}), "Back");
   window3D.back.InitializeMesh(virtualDesktop.displaySystem);
   CreateBack(window3D.back.mesh, 1, 1, THICKNESS, virtualDesktop.displaySystem);
   window3D.back.mesh.ApplyMaterial(window3D.backMaterial);
   window3D.back.mesh.ApplyTranslucency(window3D.back);

   window3D.cube.AddName((window3D.front = Object {}), "Front");
   window3D.front.InitializeMesh(virtualDesktop.displaySystem);
   CreateFront(window3D.front.mesh, 1, 1, THICKNESS, virtualDesktop.displaySystem);
   window3D.front.mesh.ApplyMaterial(window3D.frontMaterial);
   window3D.front.mesh.ApplyTranslucency(window3D.front);

   window3D.cube.AddName((window3D.side = Object {}), "Side");
   window3D.side.InitializeMesh(virtualDesktop.displaySystem);
   CreateSide(window3D.side.mesh, 1, 1, THICKNESS, virtualDesktop.displaySystem);
   window3D.side.mesh.ApplyMaterial(window3D.sideMaterial);
   window3D.side.mesh.ApplyTranslucency(window3D.side);

   window3D.cube.SetMinMaxRadius(true);

   window3D.id = virtualDesktop.numWindows;
   virtualDesktop.poppingBiggest = 0;
   for(child = virtualDesktop.firstChild; child; child = child.next)
   {
      if(child.is3D) //display != virtualDesktop.display)
      {
         Window3D child3D = Desktop3DGetWindowHandle(child);
         if(child == window)
            child3D = window3D;

         child3D.wantedPosition = virtualDesktop.globalPosition +
            child3D.id * 2*Pi / (virtualDesktop.numWindows+1);
         if(child == window)
            window3D.position = window3D.wantedPosition;
         virtualDesktop.poppingBiggest = Max(virtualDesktop.poppingBiggest,
            child3D.position - child3D.wantedPosition);
      }
   }
   virtualDesktop.numWindows++;
   virtualDesktop.poppingWindow = window;
   virtualDesktop.poppingPercent = 0;

   return window3D;
}

static void Update3DWindow(Window window, Box box)
{
   Window3D window3D = Desktop3DGetWindowHandle(window);
   int w = box.right - box.left + 1;
   int h = box.bottom - box.top + 1;

   glBindTexture(GL_TEXTURE_2D, (int)window3D.bitmap.driverData);
   glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
   glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

   glCopyTexSubImage2D(GL_TEXTURE_2D, 0,
      box.left,
      window.size.h - h - box.top,
      box.left + virtualDesktop.clientStart.x,
      virtualDesktop.size.h - virtualDesktop.clientStart.y - h - box.top, w, h);
}

class Orbit : GuiApplication
{
   driver = "OpenGL";
   bool Init()
   {
#ifdef FULLSCREEN
      fullScreen = true;
#endif
      Desktop3DInitialize(virtualDesktop, Setup3DWindow, Update3DWindow);
      return true;
   }
}

Desktop3D virtualDesktop {};
