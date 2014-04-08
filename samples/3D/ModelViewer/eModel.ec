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
            strcpy(fileDialog.filePath, "toyota.3ds");
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
   Camera camera
   {
      attached,
      fov = 53,
      position = { 0, 0,-100 },
      orientation = Euler { 0, 30, 0 },
      zMin = 0.01f;

   };
   Object model {};

   //FPS frameRate;
   bool moving, lightMoving;
   Timer timer
   {
      this, delay = 0.01;

      bool DelayExpired()
      {
         if(model)
         {
            /*
            Object rotor = model.Find("propmain");
            Object rrotor = model.Find("propback");

            if(rotor)
               rotor.transform.angle.RotateY(0.01 * 30);
            if(rrotor)
               rrotor->transform.angle.RotateX(0.01 * 30);
            */
            model.frame++;
            // cameraObject.frame++;
         }

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
      this, visible = false, noCaret = true, multiLine = true, readOnly = true, hasVertScroll = true, hasHorzScroll = true, borderStyle = sizable,
      text = "Help", anchor = Anchor { right = 0, top = 0 }, size = Size { 400, 120 }, background = red, opacity = 0.2f,
      font = { "Courier New", 10 }
   };
   FillModeValue fillMode;
   Object cameraObject;
   SkyBox sky { size = { 10000, 10000, 10000 }, folder = ":skycube", extension = "pcx" };
   char * modelFile;

   background = blue;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   text = "ECERE Model Viewer";
   anchor = Anchor { 0,0,0,0 };

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
      displaySystem.ClearMaterials();
      displaySystem.ClearTextures();
      displaySystem.ClearMeshes();
   }

   void OnDestroy()
   {
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
         case k1: case k2: case k3: case k4:
            if(key == k1)        cameraObject = model.Find("Camera01");
            else if(key == k2)   cameraObject = model.Find("Camera02");
            else if(key == k3)   cameraObject = model.Find("Camera03");
            else if(key == k4)   cameraObject = model.Find("Camera04");

            camera = cameraObject.camera;
            camera.Setup(clientSize.w, clientSize.h, null);
            Update(null);
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
         //case minus: camera.position.z += 10; break;
         //case plus: camera.position.z -= 10; break;
   /*
         case pageDown:
            model.Animate(model.frame + 1);
            break;
         case pageUp:
            model.Animate(model.frame - 1);
            break;
         case home:
            model.Animate(model.startFrame);
            break;
         case end:
            model.Animate(model.endFrame);
            break;
   */
      }
      return true;
   }

   bool OnLoadGraphics()
   {
      if(model.Load(modelFile, null, displaySystem))
      {
         if(model)
         {
            // model.Merge(displaySystem);

            // camera.position.z = - model.radius * 5;

            //cameraObject = model.Find("Camera01");
            //cameraObject = model.Find("Camera03");
            //cameraObject = model.Find("Camera02");
            //cameraObject = model.Find("Camera04");
            //cameraObject = model.Find("FullscreenCam01");
            //cameraObject = model.Find("Full Scre1");
            //cameraObject = model.Find("Full Scree");
            cameraObject = model.Find("Plasma Cam");
            if(cameraObject)
               camera = cameraObject.camera;
            else
               camera.target = model;
         }

         sky.Create(displaySystem);
         return true;
      }
      else
         return false;
   }

   void OnRedraw(Surface surface)
   {
      display.fogColor = blue;
      display.fogDensity = 0.000001f;

      surface.SetBackground(lightBlue);
      surface.Clear(colorAndDepth);

      camera.Update();

      display.SetCamera(surface, camera);

      display.SetLight(0, &light);
      display.ambient = black;
      // display.SetLights(model);

      display.fillMode = fillMode;

      sky.Render(camera, display);
      display.DrawObject(model);
      /*
      display.DrawObject(model);
      display.DrawObject(model);
      display.DrawObject(model);
      display.DrawObject(model);
      */

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
