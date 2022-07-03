import "ecere"

class Min3D : Window
{
   caption = "Hello, 3D";
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { 640, 480 };
   displayDriver = "OpenGL";
   background = black;

   Cube cube { };
   Camera camera { position = { 0, 0, -4 }, zMin = 0.1, fov = 53 };

   bool OnLoadGraphics()
   {
      cube.Create(displaySystem);
      cube.transform.orientation = Euler { 30, 40 };
      cube.UpdateTransform();
      return true;
   }

   void OnUnloadGraphics()
   {
      cube.Free(displaySystem);  // TODO: Avoid crashes without this?
   }

   void OnResize(int w, int h)
   {
      camera.Setup(w, h, null);
      camera.Update();
   }

   void OnRedraw(Surface surface)
   {
      surface.Clear(depthBuffer);
      display.SetLight(0, { diffuse = white, specular = white, orientation = Euler { 50, 30 } });
      display.SetCamera(surface, camera);
      display.DrawObject(cube);
   }
}

Min3D min3D {};
