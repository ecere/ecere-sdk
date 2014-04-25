import "ecere"
import "engineSettings"

static FileFilter fileFilters[] =
{
   {
      "3D Studio Model Files (*.3ds)",
      "3ds"
   },
   { "All files", null }
};

FileDialog fileDialog
{
   filters = fileFilters, sizeFilters = sizeof(fileFilters);
   text = "Select a 3DS model to display..."
};

ModelViewer modelViewer { };

class eModelApp : GuiApplication
{
   // driver = "OpenGL";

   void Main()
   {
      if(EngineSettings { }.Modal())
      {
         bool selected = false;
         if(argc > 1)
         {
            selected = true;
            strcpy(fileDialog.filePath, argv[1]);
         }
         else
         {
            strcpy(fileDialog.filePath, "models/cow/cow.3DS");
            //selected = true;
         }
         while(selected || fileDialog.Modal() == ok)
         {
            modelViewer.modelFile = fileDialog.filePath;
            modelViewer.Modal();
            selected = false;
         }
      }
   }
}

class ModelViewer : Window
{
   caption = $"Ecere Model Viewer";
   background = blue;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   anchor = { left = 0, top = 0, right = 0, bottom = 0 };

   Camera camera
   {
      attached,
      fovDirection = vertical,
      fov = 53,
      position = { 0, 0, -10 },
      eulerOrientation = Euler { 30, 0, 0 },
      zMin = 1;
      zMax = 10000;
   };
   Object cameraTarget { };
   Object model {};

   //FPS frameRate;

   bool moving, lightMoving;
   Timer timer
   {
      this, delay = 0.01;

      bool DelayExpired()
      {
         if(model)
            model.frame++;

         Update(null);
         return true;
      }
   };

   Point startPosition;
   Euler startOrientation;
   Light light
   {
      diffuse = white;
      specular = white;
      orientation = Euler { pitch = 50, yaw = 45 };
   };
   EditBox help
   {
      this, caption = $"Help", background = red, 0.2f, borderStyle = sizable, font = { "Courier New", 10 }, size = { 420, 130 }, anchor = { top = 0, right = 0 }, visible = false, hasHorzScroll = true, true, readOnly = true, true, noCaret = true
   };

   FillModeValue fillMode;
   SkyBox sky { size = { 10000, 10000, 10000 }, folder = ":skycube", extension = "jpg" };

   char * modelFile;

   ModelViewer()
   {
      File f = FileOpen(":help.txt", read);
      if(f)
      {
         help.Load(f);
         delete f;
      }
   }

   bool OnCreate()
   {
      fillMode = solid;
      timer.userData = this;
      // timer.Start();
      return true;
   }

   void OnUnloadGraphics()
   {
      sky.Free(displaySystem);
      model.Free(displaySystem);
      displaySystem.ClearMaterials();
      displaySystem.ClearTextures();
      displaySystem.ClearMeshes();
   }

   void OnDestroy()
   {
      delete model;
      model = { };
      //sky.Free(null);
      //model.Free(null);
   }

   void OnResize(int w, int h)
   {
      camera.Setup(w, h, null);
      Update(null);
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(!moving && !lightMoving)
      {
         startPosition.x = x;
         startPosition.y = y;
         startOrientation = camera.eulerOrientation;
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
            0
         };

         camera.eulerOrientation = euler;

         Update(null);
      }
      else if(lightMoving)
      {
         light.orientation = Euler
         {
            startOrientation.yaw   - (x - startPosition.x),
            startOrientation.pitch + (y - startPosition.y),
            0
         };

         Update(null);
      }
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      switch(key)
      {
         case escape: Destroy(0); return false;
         case g:
            fillMode = (fillMode == wireframe) ? solid : wireframe;
            break;
         case h:
            help.visible ^= true;
            break;
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      switch((SmartKey) key)
      {
         case wheelDown: case minus: camera.position.z *= 1.1111111f; Update(null); break;
         case wheelUp: case plus: camera.position.z *= 0.9f; Update(null); break;
         case up:    camera.position.y += camera.position.z / 20; Update(null); break;
         case down:  camera.position.y -= camera.position.z / 20; Update(null); break;
         case left:    camera.position.x += camera.position.z / 20; Update(null); break;
         case right:  camera.position.x -= camera.position.z / 20; Update(null); break;
         /*
            case pageDown: model.Animate(model.frame + 1); break;
            case pageUp: model.Animate(model.frame - 1); break;
            case home: model.Animate(model.startFrame); break;
            case end: model.Animate(model.endFrame); break;
         */
      }
      return true;
   }

   bool OnLoadGraphics()
   {
      if(model.Load(modelFile, null, displaySystem))
      {
         float r = model.radius;
         cameraTarget.transform.position =
         {
            (model.max.x + model.min.x) / 2,
            (model.max.y + model.min.y) / 2,
            (model.max.z + model.min.z) / 2
         };
         // model.Merge(displaySystem);
         camera.zMin = 1;
         camera.zMax = 10000;
         camera.position = { 0, 0, -r * 2 };
         camera.eulerOrientation = Euler { 30, 0, 0 };

         light.orientation = Euler { pitch = 50, yaw = 45 };

         if(r * 2 < camera.zMax / 10)
         {
            while(r * 2 < camera.zMax / 100)
            {
               camera.zMax /= 10;
               camera.zMin /= 10;
            }
         }
         else
            while(r * 2 > camera.zMax / 10)
            {
               camera.zMax *= 10;
               camera.zMin *= 10;
            }

         camera.target = cameraTarget;

         sky.size = { camera.zMax, camera.zMax, camera.zMax };
         sky.Create(displaySystem);
         return true;
      }
      return false;
   }

   void OnRedraw(Surface surface)
   {
      //display.fogColor = blue;
      display.fogDensity = 0; //0.000001f;

      surface.SetBackground(lightBlue);
      surface.Clear(colorAndDepth);

      camera.Update();

      // Set Light before setting the camera will set the light in view space
      display.SetLight(0, &light);

      display.SetCamera(surface, camera);

      // Set Light after setting the camera will set the light in world space
      //display.SetLight(0, &light);

      display.ambient = { 30, 30, 30 }; //black;
      // display.SetLights(model);

      display.fillMode = fillMode;

      sky.Render(camera, display);
      display.DrawObject(model);

      display.fillMode = solid;

      display.SetCamera(surface, null);

      /*
      frameRate.Step();
      surface.SetForeground(Black);
      if(model)
         surface.WriteTextf(0,0, "%.2f, Frame: %d",  frameRate.fps, model.frame++);
      */
      surface.WriteTextf(0,20, "Press H to toggle help screen");
   }
}
