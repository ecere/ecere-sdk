import "ecere"

class MyApp : GuiApplication
{
   driver = "OpenGL";
};

Camera camera
{
   fixed,
   position = Vector3D { 0, 0, -300 },
   orientation = Euler { 0, 0, 0 },
   fov = 53;
};

Light light
{
   diffuse = lightCoral;
   orientation = Euler { pitch = 10, yaw = 30 };
};


class Hello3D : Window
{
   caption = "Hello, 3D";
   background = black;
#if 0
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
#else
   moveable = true;
   borderStyle = none;
   opacity = 0;
   alphaBlend = true;
   stayOnTop = true;
#endif
   size = { 640, 480 };

   Cube cube { };
   Material material { diffuse = white/*, ambient = blue*//*, specular = red, power = 8*/, opacity = 0.5f/*, flags = { translucent = true, doubleSided = true }*/ };

   bool OnLoadGraphics()
   {
      cube.Create(displaySystem);
      cube.mesh.ApplyMaterial(material);
      cube.transform.scaling = { 100, 100, 100 };
      cube.transform.orientation = Euler { 50, 30, 50 };
      cube.UpdateTransform();
      return true;
   }

   void OnUnloadGraphics()
   {
      cube.Free(displaySystem);
   }

   void OnResize(int w, int h)
   {
      camera.Setup(w, h, null);
      camera.Update();
   }

   void OnRedraw(Surface surface)
   {
      surface.Clear(depthBuffer);
      display.SetLight(0, light);
      display.SetCamera(surface, camera);
      display.DrawObject(cube);
      display.SetCamera(surface, null);
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      if(key == escape) Destroy(0);
      return true;
   }
}

Hello3D hello3D {};
