#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

class ModelView : Window
{
   isActiveClient = true;
   background = lightBlue;
   anchor = { left = 0, top = 0, right = 0, bottom = 0 };

   FillModeValue fillMode;
   bool moving, lightMoving;
   char fileName[MAX_LOCATION];
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
   Point startPosition;
   Euler startOrientation;
   Light light
   {
      orientation = Euler { pitch = 50, yaw = 45 };
      diffuse = white, specular = white;
   }; // light.diffuse.r = light.diffuse.g = light.diffuse.b = 1; light.specular.r = light.specular.g = light.specular.b = 1;
   Window help;

   Timer timer
   {
      userData = this, delay = 0.05;
      bool DelayExpired()
      {
         if(model)
            model.frame++; //Animate(model.frame + 1);

         Update(null);
         return true;
      }
   };

   property char * modelFile
   {
      set
      {
         strcpy(fileName, value);
      }
      get { return fileName; }
   }

   void OnUnloadGraphics()
   {
      model.Free(displaySystem);
      delete model;  // At the moment the reload preserving hierarchy position is not working, causing things to be misplaced in some models
      model = { };
   }

   void OnDestroy()
   {
      DisplaySystem displaySystem = parent.displaySystem;
      /*delete model;
      model = { };*/
      if(_class.count == 1 && parent.displaySystem)
      {
         displaySystem.ClearMaterials();
         displaySystem.ClearTextures();
         displaySystem.ClearMeshes();
      }
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
         bool clicked = false;
         OldList list {};

         display.StartSelection(x,y, 0,0);
         display.SetCamera(null, camera);
         display.CollectHits();
         display.DrawObject(model);
         if(display.GetHits(list))
         {
            clicked = true;
            list.Free(null);
         }
         display.SetCamera(null, null);
         display.StopSelection();

         if(clicked)
         {
            startPosition.x = x;
            startPosition.y = y;
            startOrientation = camera.eulerOrientation;
            Capture();
            moving = true;
            return false;
         }
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
         case g:
            fillMode = (fillMode == wireframe) ? solid : wireframe;
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
      if(model.Load(fileName, null, displaySystem))
      {
         float r = model.radius;
         cameraTarget.transform.position =
         {
            (model.max.x + model.min.x) / 2,
            (model.max.y + model.min.y) / 2,
            (model.max.z + model.min.z) / 2
         };

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
         return true;
      }
      return false;
   }

   void OnRedraw(Surface surface)
   {
      //display.fogColor = blue;
      display.fogDensity = 0; //0.000001f;

      surface.Clear(depthBuffer);
      camera.Update();

      display.SetLight(0, light);
      display.SetCamera(surface, camera);

      //display.SetLight(0, light);

      display.fillMode = fillMode;
      display.DrawObject(model);
      display.fillMode = solid;

      display.SetCamera(surface, null);

      surface.SetForeground(black);
   }

   ModelView()
   {
      fillMode = solid;
      light.orientation.Yaw(0);
      // timer.Start();
   }

   void SetFormat(char * format)
   {
      OnLoadGraphics();
   }

}
