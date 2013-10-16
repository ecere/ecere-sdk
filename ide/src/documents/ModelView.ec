#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

class ModelView : Window
{
   isActiveClient = true;
   background = blue;
   anchor = Anchor { left = 0.1, right = 0.1, top = 0.1, bottom = 0.1 };

   FillModeValue fillMode;
   bool moving, lightMoving;
   char fileName[MAX_LOCATION];
   Camera camera { type = attached, zMax = 10000, position = Vector3D { 0, 0, -1000 } };
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
            model.Animate(model.frame + 1);

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
   }

   bool OnLoadGraphics(void)
   {
      /*
      model.InitializeMesh(display);
      model.mesh.CreateCylinder(50, 100, 50, display);
      model.SetMinMaxRadius();
      */
      if(model.Load(fileName, null, displaySystem))
      {
         if(model)
            camera.position.z = - model.radius * 1.5f;

         camera.target = model;

         display.fogColor = blue;
         display.fogDensity = 0.000001f;

         return true;
      }
      else
         return false;
      return true;
   }

   void OnUnloadGraphics(void)
   {
      //displaySystem.ClearMaterials();
      //displaySystem.ClearTextures());
      //displaySystem.ClearMeshes();
   }

   void OnResize(int width, int height)
   {
      camera.Setup(width, height, null);
   }

   void OnDestroy(void)
   {
      //eObject_Free(model, null);
   }

   void OnRedraw(Surface surface)
   {
      surface.SetBackground(lightBlue);
      surface.Clear(colorAndDepth);

      camera.Update();

      display.SetCamera(surface, camera);

      display.SetLight(0, light);

      display.fillMode = fillMode;
      display.DrawObject(model);
      display.fillMode = solid;

      display.SetCamera(surface, null);

      surface.SetForeground(black);
   }

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
            0
         };
         //if(euler.pitch > 90) euler.pitch = 90;
         //if(euler.pitch < 1) euler.pitch = 1;

         camera.orientation = euler;

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

   bool OnKeyHit(Key key, unichar ch)
   {
      switch((SmartKey) key)
      {
         case wheelDown: case minus: camera.position.z *= 1.1111111f; break;
         case wheelUp: case equal: camera.position.z *= 0.9f; break;

         /*
            case minus: camera.position.z += 10; break;
            case equal: camera.position.z -= 10; break;

            case pageDown: model.Animate(model.frame + 1); break;
            case pageUp: model.Animate(model.frame - 1); break;
            case home: model.Animate(model.startFrame); break;
            case end: model.Animate(model.endFrame); break;
         */
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

   ModelView()
   {
      fillMode = solid;
      light.orientation.Yaw(0);
      timer.Start();
   }

   void SetFormat(char * format)
   {
      OnLoadGraphics();
   }

}
