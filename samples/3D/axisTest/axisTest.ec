import "ecere"

// X is right, Y is down, Z is forward
// It is a Right Handed Coordinate System
// A rotation around an axis is counter-clockwise when looking in the positive direction of the axis

class MyApp : GuiApplication
{
   driver = "OpenGL";
};

Camera camera
{
   fixed,
   position = Vector3D { 30, 30, -200 },
   orientation = Euler { 0, 0, 0 },
   fov = 53;
};

Light light
{
   diffuse = white;
   orientation = Euler { pitch = 10, yaw = 30 };
};

class Hello3D : Window
{
   caption = "Ecere 3D Coordinate System";
   background = black;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };

   Cube cube { };
   Cube xAxis { };
   Cube yAxis { };
   Cube zAxis { };
   Material xMaterial { diffuse = red; ambient = white; opacity = 1.0; flags.translucent = true; };
   Material yMaterial { diffuse = green; ambient = white; opacity = 1.0; flags.translucent = true; };
   Material zMaterial { diffuse = blue; ambient = white; opacity = 1.0; flags.translucent = true; };

   Euler orientation, rotation;

   Timer timer
   {
      this, 0.01, false;
      bool DelayExpired()
      {
         static Time lastTime = 0;
         Time time = GetTime(), diffTime = lastTime ? time - lastTime : 0;
         lastTime = time;

         orientation.yaw   += 1000 * diffTime * rotation.yaw;
         orientation.pitch += 1000 * diffTime * rotation.pitch;
         orientation.roll  += 1000 * diffTime * rotation.roll;
         Update(null);
         return true;
      }
   };

   bool OnLoadGraphics()
   {
      xAxis.size = { 100, 1, 1 };
      xAxis.Create(displaySystem);
      xAxis.transform.position = { 40, 0, 0 };
      xAxis.UpdateTransform();
      xAxis.mesh.ApplyMaterial(xMaterial);

      yAxis.size = { 1, 100, 1 };
      yAxis.Create(displaySystem);
      yAxis.transform.position = { 0, 40, 0 };
      yAxis.UpdateTransform();
      yAxis.mesh.ApplyMaterial(yMaterial);

      zAxis.size = { 1, 1, 100 };
      zAxis.Create(displaySystem);
      zAxis.transform.position = { 0, 0, 40 };
      zAxis.UpdateTransform();
      zAxis.mesh.ApplyMaterial(zMaterial);

      cube.Create(displaySystem);
      cube.transform.scaling = { 20, 20, 20 };
      cube.transform.position = { 15, 15, 15 };
      cube.UpdateTransform();
      return true;
   }

   void OnUnloadGraphics()
   {
      xAxis.Free(displaySystem);
      yAxis.Free(displaySystem);
      zAxis.Free(displaySystem);
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

      cube.transform.orientation = orientation;
      cube.UpdateTransform();

      display.DrawObject(cube);

      display.DrawObject(xAxis);
      display.DrawObject(yAxis);
      display.DrawObject(zAxis);

      display.SetCamera(surface, null);
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      switch(key)
      {
         case x: orientation = Euler { }; rotation = { 0, 1, 0 }; timer.Start(); break;
         case y: orientation = Euler { }; rotation = { 1, 0, 0 }; timer.Start(); break;
         case z: orientation = Euler { }; rotation = { 0, 0, 1 }; timer.Start(); break;
      }
      return true;
   }
}

Hello3D hello3D {};
