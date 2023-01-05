import "ecere"

#define _GLES3
#include "gl123es.h"

ModelWindow modelWindow;

class ModelWindow : Window
{
   displayDriver = "OpenGL";
   caption = $"Ecere Model Viewer";
   opacity = 0;
   drawBehind = false;

   anchor = { left = 0, top = 0, right = 0, bottom = 0 };

   Camera camera
   {
      fixedQuaternion,
      fovDirection = vertical,
      fov = 53,
      eulerOrientation = Euler { 0, 0, 0 },
      zMin = 1;
      zMax = 10000;
   };
   Object model {};

   Light light
   {
      diffuse = white;
      specular = white;
      orientation = Euler { pitch = 50, yaw = 45 };
   };

   const char * modelFile;

   void OnUnloadGraphics()
   {
      model.Free(displaySystem);
      displaySystem.ClearMaterials();
      displaySystem.ClearTextures();
      displaySystem.ClearMeshes();
   }

   void OnDestroy()
   {
      delete model;
      model = { };
   }

   void OnResize(int w, int h)
   {
      camera.Setup(w, h, null);
      Update(null);
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      switch(key)
      {
         case escape: Destroy(0); return false;
      }
      return true;
   }

   bool OnLoadGraphics()
   {
      if(model.Load(modelFile, null, displaySystem))
      {
         float r = model.radius;
         //float s = 0.08 / r;  // Avocado
         float s = 20.0f / r;   // Sponza / Buildings

         model.transform.scaling = { s, s, s };
         model.UpdateTransform();

         Log("OnLoadGraphics(): Successfully loaded 3D model!\n");

         camera.zMin = 0.01; //1;
         camera.zMax = 100;

         // Sponza
         camera.position = { 0, -1.6, 0 },

         // Buildings
         //camera.position = { 0, -0.3, 0 },

         // Avocado
         //camera.position = { 0, 0, -0.25 }; //r * 2 };
         // camera.eulerOrientation = Euler { 30, 0, 0 };

         light.orientation = Euler { pitch = 50, yaw = 45 };

         return true;
      }
      return false;
   }

   void OnRedraw(Surface surface)
   {
      Vector3D p, o;

      display.fogDensity = 0;

      surface.SetBackground(0);
      surface.Clear(colorAndDepth);

      app.updateCamera();

      p = camera.position;
      o.Add(p, hmdPosition);
      camera.orientation = hmdOrientation;
      camera.position = o;

      camera.Update();

      display.SetLight(0, &light);

      display.SetCamera(surface, camera);

      display.ambient = { 30, 30, 30 }; //black;

      display.DrawObject(model);
      display.SetCamera(surface, null);

      camera.position = p;

      renderedSinceLastCycle = true;
   }
}

static bool renderedSinceLastCycle = true;

class HoloLensApp : GuiApplication
{
   driver = "OpenGL";

   bool Init()
   {
      static char modelPath[MAX_LOCATION];
      UseSingleGLContext(true);
      modelWindow = { };
      incref modelWindow;

      strcpy(modelPath, installedPath);
      //PathCat(modelPath, "Avocado.e3d");  //Assets/E3D/Avocado.e3d");
      PathCat(modelPath, "sponza.e3d");
      //PathCat(modelPath, "buildings-tateyo.e3d");

      modelWindow.modelFile = modelPath;

      return modelWindow.Create();
   }

   void updateCamera()
   {
      static bool firstTime = true;
      if(!firstTime)
      {
         Matrix matrix, inverse;
         Euler hmdEuler;
#if defined(__UWP__)
         float mat[16];
         int i;

         glGetFloatv(GLEXT_HOLOGRAPHIC_MONO_VIEW_MATRIX_ANGLE, mat);
         for(i = 0; i < 16; i++)
            matrix.array[i] = mat[i];
#else
         matrix.Identity();
#endif
         inverse.Inverse(matrix);

         inverse.Scale(1,1,-1);

         hmdEuler.FromMatrix(inverse, yxz);
         hmdEuler.yaw *= -1;
         hmdEuler.roll *= -1;
         hmdEuler.yaw += 180;

         hmdOrientation = hmdEuler;

         hmdPosition = { -inverse.array[12], -inverse.array[13], inverse.array[14] };
      }
      firstTime = false;
   }

   bool Cycle(bool idle)
   {
      if(!modelWindow || modelWindow.destroyed || !renderedSinceLastCycle)
         return true;

      modelWindow.Update(null);
      return true;
   }

   void Terminate()
   {
      delete modelWindow;
   }
}

Euler hmdOrientation;
Vector3D hmdPosition;

HoloLensApp app;
char installedPath[MAX_LOCATION];

default:

dllexport bool __stdcall __ecereDll_Load(Module module);
dllexport bool __stdcall __ecereDll_Unload(Module module);

dllexport int E3DViewer_Init(int argc, const char ** argv, const uint16 * widePath)
{
   int result = 0;

   app = (HoloLensApp)__ecere_COM_Initialize(true, argc, (char **)argv);
   if(app)
   {
      Module module = eModule_LoadStatic(app, "modelViewer", publicAccess, __ecereDll_Load, __ecereDll_Unload);
      if(module)
      {
         eInstance_Evolve(&app, class(HoloLensApp));

         SetLoggingMode(debug, null);
         Log("Successfully loaded modelViewer module!\n");

         LocateModule(null, installedPath);
         StripLastDirectory(installedPath, installedPath);

         UTF16toUTF8Buffer(widePath, (char *)installedPath, sizeof(installedPath));

         Logf("Installed path: %s\n", installedPath);

         result = app.Init();
         if(result)
         {
            app.desktop.opacity = 0;
            app.desktop.drawBehind = false;

            Log("HoloLensApp initialization successful!\n");
         }
      }
   }
   return result;
}

static int desktopW, desktopH;

dllexport void E3DViewer_Cycle(int w, int h)
{
   if(w == -1 && h == -1) w = 2048, h = 1080;
   if(desktopW != w || desktopH != h)
   {
      app.SetDesktopPosition(0, 0, w, h, true);
      desktopW = w;
      desktopH = h;
   }
   app.Cycle(false);
   app.ProcessInput(true);
}

dllexport void E3DViewer_Render()
{
   app.UpdateDisplay();
}

dllexport void E3DViewer_Terminate()
{
   delete app;
}
