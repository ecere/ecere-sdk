public import "ecere"

import "e3d"

GLMultiDraw modelsMD;

class ModelViewer : Window
{
   caption = $"Ecere Model Viewer";
   background = blue;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   anchor = { left = 0, top = 0, right = 0, bottom = 0 };
   state = maximized;
   glCapabilities.samples = ms16;

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
   Quaternion startLight;
   Light light
   {
      diffuse = white;
      specular = white;
      orientation = Euler { pitch = 50, yaw = 45 };
      // orientation = { 0.907, 0.295, 0.286, 0.093 };
   };
   EditBox help
   {
      this, caption = $"Help", background = red, 0.2f, borderStyle = sizable, font = { "Courier New", 10 }, size = { 420, 130 }, anchor = { top = 0, right = 0 }, visible = false, hasHorzScroll = true, true, readOnly = true, true, noCaret = true
   };

   FillModeValue fillMode;
   SkyBox sky { size = { 10000, 10000, 10000 }, folder = "../ModelViewer/skycube", extension = "jpg" };

   const char * modelFile;

   property const String modelFile
   {
      set { modelFile = value; OnUnloadGraphics(); OnLoadGraphics(); }
   }

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
         //startOrientation = light.orientation;
         startLight = light.orientation;
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
            startOrientation.yaw   - (x - startPosition.x), // / 1380.0,
            startOrientation.pitch + (y - startPosition.y), // / 380.0,
            0
         };

         camera.eulerOrientation = euler;

         Update(null);
      }
      else if(lightMoving)
      {
         Quaternion q;
         q.RotationYawPitchRoll({ y - startPosition.y, x - startPosition.x, 0 });
         light.orientation.Multiply(q, startLight);
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
                        // FIXME: eC bug simple struct confusion without the brackets
         case pageDown: { model.Animate(Min(model.endFrame, model.frame + 1)); displaySystem.Lock(); model.ApplySkins(); displaySystem.Unlock(); Update(null); } break;
         case pageUp: { model.Animate(Max(model.startFrame, model.frame - 1)); displaySystem.Lock(); model.ApplySkins(); displaySystem.Unlock(); Update(null); } break;
         case home: model.Animate(model.startFrame); displaySystem.Lock(); model.ApplySkins(); displaySystem.Unlock(); Update(null); break;
         case end: model.Animate(model.endFrame); displaySystem.Lock(); model.ApplySkins(); displaySystem.Unlock(); Update(null); break;
      }
      return true;
   }

   bool OnLoadGraphics()
   {                                                           // 3DS Loader currently needs DisplaySystem to load materials
      char ext[MAX_EXTENSION];
      const String convertTo = "glb"; //"e3d";
      // bool is3DS = modelFile && !strcmpi(GetExtension(modelFile, ext), "3ds");
      bool isE3D = !strcmpi(ext, convertTo);
      char outName[MAX_FILENAME];
      DisplaySystem loadDS = 0;//!isE3D ? displaySystem : null;
      Map<uint, Bitmap> texturesByID { };
      E3DOptions options
      {
         shareIndices = true;
         compressedTextures = true;
         texturesByID = texturesByID;
         // resolution = 2048;
      };

      sprintf(outName, "out.%s", convertTo);

      sky.size = { camera.zMax, camera.zMax, camera.zMax };
      sky.Create(displaySystem);

      // TODO: Make this an option to save out.e3d ?
      if(0 && modelFile && !isE3D && /*!FileExists(outName) && */model.LoadEx(modelFile, null, loadDS, options))
      // if(model.LoadEx(modelFile, null, loadDS, options))
      {
         //E3DOptions options { };

         //model.Merge(null);

         // TODO: Make this runtime option, iterating through?
         //model.mesh.ComputeNormals();

         model.SaveEx(outName, convertTo, options);
         model.Free(loadDS);
         model.flags = 0;  // TOCHECK: Not clearing flags causes bad node transforms reloading 3DS model second time
      }

      if(/*isE3D && */modelFile && model.LoadEx(modelFile, null, null  /*displaySystem /*null*/, options))
      {
         float r;

         GLMultiDraw * md = &modelsMD;
         //GLMultiDraw * md = new0 GLMultiDraw[1];

         if(!md->indexGLMB)
         {
            md->indexGLMB = { keepSameBufferID = false };
            md->vertexGLMB = { keepSameBufferID = false };
         }

         model.Upload(displaySystem, md->vertexGLMB, md->indexGLMB, 0, null);
         // model.Upload(displaySystem, null, null, 0, null);

         /*model.Merge(displaySystem);
         model.UpdateTransform();
         model.SetMinMaxRadius(true);*/

         // TODO: Make this runtime option?
         //model.mesh.ComputeNormals();

         PrintLn(model.transform.position.x, ", ", model.transform.position.y, ", ", model.transform.position.z);
         PrintLn(model.transform.orientation.x, ", ", model.transform.orientation.y, ", ", model.transform.orientation.z, ", ", model.transform.orientation.w);

         model.SetMinMaxRadius(true);

         // model.transform = { { }, Euler { }, { 0.01, 0.01, 0.01 } };

         // model.Load("/ecere-sdk/ecere/src/gfx/3D/models/e3dView/specs/cube3.e3d", null, displaySystem);

         model.UpdateTransform();

         model.frame = model.startFrame;
         model.ApplySkins();

         r = (float)model.wradius;
         cameraTarget.transform.position =
         {
            (model.wmax.x + model.wmin.x) / 2,
            (model.wmax.y + model.wmin.y) / 2,
            (model.wmax.z + model.wmin.z) / 2
         };
         //model.Merge(displaySystem);

         camera.zMin = 1;
         camera.zMax = 10000;

         camera.position = { 0, 0, -r * 2 };
         camera.eulerOrientation = Euler { -183, 49, 0 };

          camera.position = { 0, 0, -r * 2 * 0.70 };
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
      return modelFile ? false : true;
   }

   void OnRedraw(Surface surface)
   {
      //display.fogColor = blue;
      display.fogDensity = 0; //0.000001f;
      display.antiAlias = true;

      surface.SetBackground(lightBlue);
      surface.Clear(colorAndDepth);

      camera.Update();

      // Set Light before setting the camera will set the light in view space
      //display.SetLight(0, &light);

      display.SetCamera(surface, camera);

      // Set Light after setting the camera will set the light in world space
      display.SetLight(0, &light);

      display.ambient = { 30, 30, 30 }; //black;
      // display.SetLights(model);

      display.fillMode = fillMode;

      sky.Render(camera, display);
      display.DrawObject(model);

      display.fillMode = solid;

      display.maxFullSort = 6000;
      display.fullProjCheck = 0;
      //display.maxFullSort = 0;

      display.SetCamera(surface, null);
   }
}
