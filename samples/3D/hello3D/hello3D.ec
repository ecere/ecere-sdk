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
   text = "Hello, 3D";
   background = black;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };

   Cube cube { };

   bool OnLoadGraphics()
   {
      cube.Create(displaySystem);
      cube.transform.scaling = { 100, 100, 100 };
      cube.transform.orientation = Euler { 50, 30, 50 };
      cube.UpdateTransform();
      return true;
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
}

Hello3D hello3D {};
