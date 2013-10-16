import "ecere"

class Test3DSApp : GuiApplication
{
   driver = "OpenGL";
   timerResolution = 60;
}

class Test3DS : Window
{
   background = black, borderStyle = sizable, hasMaximize = true, hasMinimize = true, hasClose = true;
   text = "ECERE Model Viewer";
   anchor = Anchor { 0,0,0,0 };

   Object model {};
   Object cameraObject;
   Camera camera;

   Timer timer
   {
      this, delay = 0.01;

      bool DelayExpired()
      {
         model.frame ++;
         //model.frame += 4;
         Update(null);
         return true;
      }
   };

   bool OnCreate()
   {
      timer.Start();
      return true;
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
         case k0: case k1: case k2: case k3: case k4:
            if(key == k0)        cameraObject = model.Find("Full Scre1");
            else if(key == k1)   cameraObject = model.Find("Camera01");
            else if(key == k2)   cameraObject = model.Find("Camera02");
            else if(key == k3)   cameraObject = model.Find("Camera03");
            else if(key == k4)   cameraObject = model.Find("Full Scree");

            camera = cameraObject.camera;
            camera.Setup(clientSize.w, clientSize.h, null);
            Update(null);
            break;
      }
      return true;
   }

   bool OnLoadGraphics()
   {
      if(model.Load(":desktop.3ds", null, displaySystem))
      //if(model.Load("E:\\Others\\Dreamix\\Dreamix 3D Desktop\\3ds\\room.3ds", null, displaySystem))
      {
         if(model)
         {
            cameraObject = model.Find("Full Scre1");
            //cameraObject = model.Find("Plasma Cam");
            if(cameraObject)
               camera = cameraObject.camera;
            else
            {
               camera = Camera { target = model };
            }
         }
         return true;
      }
      else
         return false;
   }

   void OnRedraw(Surface surface)
   {
      surface.Clear(depthBuffer);
      camera.Update();
      display.SetCamera(surface, camera);
      display.SetLights(model);
      display.DrawObject(model);
      display.SetCamera(surface, null);
   }
}

Test3DS test3DS {};

