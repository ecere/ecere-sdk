#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

define numSpheres = 4;
define spacing = 0.75f;

class ColorSpheresApp : GuiApplication
{
   driver = "OpenGL";
   timerResolution = 60;

   bool Cycle(bool idle)
   {
      test3D.UpdateCube();
      return true;
   }
};

Camera camera
{
   fixed,
   position = { 0, 0, -405 - 200/((numSpheres-1) * (1+spacing)) },
   orientation = Euler { 0, 0, 0 },
   fov = 53;
};

Light diffuseLight
{
   multiplier = 0.5f;
   diffuse = white;
   orientation = Euler { 0,0 }
};

Object specularLight
{
   transform = { scaling = { 1, 1, 1 } };
   flags = { light = true };
   light =
   {
      multiplier = 1;
      diffuse = white;
      specular = white;
      lightObject = specularLight;
   };
};

class ColorSpheres : Object
{
   Sphere sphere { numLat = (int)(50 * 2 / (numSpheres-1)), numLon = (int)(50 * 2 / (numSpheres-1)) };
   transform.scaling = { 100, 100, 100 };

   void Create(DisplaySystem displaySystem)
   {
      float x, y, z;
      sphere.Create(displaySystem);

      for(x = -1; x <= 1; x += 2.0f / (numSpheres-1))
         for(y = -1; y <= 1; y += 2.0f / (numSpheres-1))
            for(z = -1; z <= 1; z += 2.0f / (numSpheres-1))
            {
               Object object { };
               float scaling = 1.0f / ((numSpheres-1) * (1+spacing));
               object.Duplicate(sphere);
               object.transform.position = { x, y, z };
               object.transform.scaling = { scaling, scaling, scaling };
               object.material = Material
               {
                  opacity = 1,
                  diffuse = ColorRGB { (x + 1) / 2.0f, (y + 1) / 2.0f, (z + 1) / 2.0f };
                  ambient = ColorRGB { (x + 1) / 2.0f, (y + 1) / 2.0f, (z + 1) / 2.0f };
                  specular = white;
                  power = 32.0f;
               };
               displaySystem.AddMaterial(object.material);
               object.mesh.ApplyTranslucency(object);
               AddName(object, null);
            }
      UpdateTransform();
   }
}

class Test3D : Window
{
   text = "Cube";
   borderStyle = none;
   moveable = true;
   stayOnTop = true;
   clientSize = { 400, 400 };
   background = 0;
   opacity = 0;
   alphaBlend = true;

   ColorSpheres cube { };
   Euler spin { };

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
         yaw   -= (double)diffTime / 3 * yaw;
         pitch -= (double)diffTime / 3 * pitch;
         if(yaw < 0.0001) yaw = 0;
         if(pitch < 0.0001) pitch = 0;

         spin.yaw = yaw * signYaw;
         spin.pitch = pitch * signPitch;

         temp.Multiply(orientation, thisSpin);
         orientation.Normalize(temp);

         cube.transform.orientation = orientation;
         cube.UpdateTransform();
      }
      Update(null);
      lastTime = time;
      return true;
   }

   bool OnLoadGraphics()
   {
      cube.Create(displaySystem);
      return true;
   }

   void OnResize(int w, int h)
   {
      camera.Setup(w, h, null);
   }

   void OnRedraw(Surface surface)
   {
      int x, y;

      surface.Clear(colorAndDepth);
      camera.Update();

      GetMousePosition(&x, &y);

      specularLight.transform.position =
      {
         (x - clientSize.w / 2) * 400 / clientSize.w,
         (y - clientSize.h / 2) * 400 / clientSize.h,
         - 2 * cube.transform.scaling.z * (1 + 1.0f / ((numSpheres - 1) * (1+spacing)))
      };
      specularLight.UpdateTransform();

      display.SetCamera(surface, camera);

      display.SetLight(0, diffuseLight);
      display.SetLight(1, specularLight.light);

      display.fogDensity = 0;
      display.DrawObject(cube);
      display.SetCamera(surface, null);
   }

   Point startClick;
   bool moving;
   Time clickTime;

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      clickTime = GetTime();
      Capture();
      startClick = { x, y };
      moving = true;
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

   bool OnKeyHit(Key key, unichar ch)
   {
      if(key == wheelDown || key == wheelUp)
      {
         int w = size.w;
         if(key == wheelDown)
            w /= 1.1;
         else if(key == wheelUp)
            w *= 1.1;
         Move(position.x + size.w / 2 - w / 2, position.y + size.h / 2 - w / 2, w, w);
      }
      Update(null);
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      if(key == escape) Destroy(0);
      return true;
   }
}

Test3D test3D {};
