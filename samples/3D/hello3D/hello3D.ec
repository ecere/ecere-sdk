import "ecere"

class MyApp : GuiApplication
{
   driver = "OpenGL";
   timerResolution = 60;

   bool Cycle(bool idle)
   {
      hello3D.UpdateCube();
      return true;
   }
};

Camera camera
{
   fixed,
   position = Vector3D { 0, 0, -220 },
   orientation = Euler { 0, 0, 0 },
   fov = 53;
};

Light light
{
   //diffuse = white;
   specular = white;
   orientation = Euler { pitch = 10, yaw = 30 };
};

Light light2
{
   diffuse = white;
   //specular = white;
   orientation = Euler { pitch = 20, yaw = -30 };
};
/*
Light light
{
   diffuse = lightCoral;
   orientation = Euler { pitch = 10, yaw = 30 };
};
*/
class Hello3D : Window
{
   caption = "Hello, 3D";
   background = black;
   //borderStyle = sizable;
   //hasMaximize = true;
   //hasMinimize = true;
   //hasClose = true;
   //size = { 640, 480 };
   anchor = { 0,0,0,0 };

   font = { "Tahoma", 20, true, outlineSize = 4, outlineFade = 0.2 };

   BitmapResource texture { ":knot.png", window = this };
   Material material { diffuse = white, ambient = blue, /*specular = red, */power = 8, opacity = 1.0f, flags = { translucent = true, doubleSided = true } };

   Cube cube { };
   Euler spin { 3,3,2.5 };

   bool UpdateCube()
   {
      static Time lastTime = 0;
      Time time = GetTime(), diffTime = lastTime ? (time - lastTime) : 0;
      if(spin.yaw || spin.pitch)
      {
         int signYaw = 1, signPitch = 1;
         Radians yaw = spin.yaw, pitch = spin.pitch;
         Quaternion orientation = cube.transform.orientation;
         Euler tSpin { yaw * (double)diffTime, pitch * (double)diffTime, 0 };
         Quaternion thisSpin = tSpin, temp;

         if(yaw < 0) { yaw = -yaw; signYaw = -1; }
         if(pitch < 0) { pitch = -pitch; signPitch = -1; }
         /*
         yaw   -= (double)diffTime / 3 * yaw;
         pitch -= (double)diffTime / 3 * pitch;
         */
         if(yaw < 0.0001) yaw = 0;
         if(pitch < 0.0001) pitch = 0;

         spin.yaw = yaw * signYaw;
         spin.pitch = pitch * signPitch;

         temp.Multiply(orientation, thisSpin);
         orientation.Normalize(temp);

         cube.transform.orientation = orientation;
         cube.UpdateTransform();
         Update(null);
      }
      lastTime = time;
      return true;
   }

   Point startClick;
   bool moving;
   Time clickTime;

   bool OnKeyHit(Key key, unichar ch)
   {
      if(key == wheelDown || key == wheelUp)
      {
         double z = camera.position.z;
         if(key == wheelDown)
            z *= 1.1;
         else
            z /= 1.1;
         camera.position.z = z;
         camera.Update();
      }
      Update(null);
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      clickTime = GetTime();
      //Capture();
      startClick = { x, y };
      //moving = true;
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

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      if(moving)
      {
         Time time = GetTime(), diffTime = Max(time - clickTime, 0.01);
         spin.yaw   += Degrees { (x - startClick.x) / (25.0 * (double)diffTime) };
         spin.pitch += Degrees { (startClick.y - y) / (25.0 * (double)diffTime) };
         startClick = { x, y };
         clickTime = time;
      }
      return true;
   }

   bool OnLoadGraphics()
   {
      display.ambient = ColorRGB { 0.3f, 0.3f, 0.3f };
      material.baseMap = texture.bitmap;
      cube.Create(displaySystem);
      cube.mesh.ApplyMaterial(material);
      cube.mesh.ApplyTranslucency(cube);
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
      char tmp[1024];
      const char * s;
      DateTime t;
      t.GetLocalTime();
      s = t.OnGetString(tmp, null, null);

      surface.Clear(depthBuffer);
      display.SetLight(0, light);
      display.SetLight(1, light2);
      display.SetCamera(surface, camera);
      //display.fogDensity = 0;
      display.DrawObject(cube);
      display.SetCamera(surface, null);

      surface.foreground = white;
      surface.WriteText(10,150, s, strlen(s));
   }
}

Hello3D hello3D {};
