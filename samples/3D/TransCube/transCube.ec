import "ecere"

ModelViewer modelViewer { };

class eModelApp : GuiApplication
{
   driver = "OpenGL";
   //driver = "Direct3D8";
   //driver = "Direct3D";
}

class ModelViewer : Window
{
   text = "Transparent Cube Demo";
   background = black;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   anchor = { left = 0, top = 0, right = 0, bottom = 0 };

   Camera camera
   {
      attachedQuaternion,
      position = Vector3D { 0, 0, -250 },
      orientation = Euler { 120, 30, 0 },
      zMin = 0.01f;
      fov = 53;
   };
   Cube model { size = { 100, 100, 100 } };

   bool moving, lightMoving;

   Point startPosition;

   Euler startOrientation;
   Light light
   {
      diffuse = white;
      specular = white;
      // orientation = Euler { pitch = 50, yaw = 45 };
      orientation = Euler { pitch = 10, yaw = 30 };
   };

   void OnUnloadGraphics()
   {
      displaySystem.ClearMaterials();
      displaySystem.ClearTextures();
      displaySystem.ClearMeshes();
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

   bool OnKeyDown(Key key, unichar ch)
   {
      switch(key)
      {
         case escape: Destroy(0); return false;
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

   bool OnLoadGraphics()
   {
      if(model.Create(displaySystem))
      {
         if(model)
         {
            int c;
            for(c = 0; c<6; c++)
            {
               PrimitiveGroup group;
               Material material;
               char name[20];

               sprintf(name, "Cube Face %d", c+1);
               material = displaySystem.GetMaterial(name);
               if(material)
               {
                  material.flags = { noFog = true, doubleSided = true, translucent = true };
                  material.opacity = 0.5f;
                  material.diffuse.r = material.diffuse.g = material.diffuse.b = 1;
                  material.ambient = material.diffuse;
                  material.baseMap = displaySystem.GetTexture(name);
                  if(!material.baseMap)
                  {
                     material.baseMap = Bitmap { };

                     sprintf(name, "tex%d.bmp", c+1);
                     if(c == 3) strcpy(name, "glass.bmp");

                     material.baseMap.LoadMipMaps(name, null, displaySystem);
                     displaySystem.AddTexture(name, material.baseMap);
                  }
               }
            }
            model.mesh.ApplyTranslucency(model);
            camera.target = model;
         }
         return true;
      }
      else
         return false;
   }

   void OnRedraw(Surface surface)
   {
      display.fogColor = blue;
      display.fogDensity = 0.000001f;

      surface.Clear(depthBuffer);

      camera.Update();

      display.antiAlias = true;
      display.SetLight(0, light);

      display.SetCamera(surface, camera);

      display.ambient = ColorRGB { 0.2f, 0.2f, 0.2f };

      display.DrawObject(model);

      display.SetCamera(surface, null);
   }
}
