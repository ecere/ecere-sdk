#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

class CubeApp : GuiApplication
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
   position = { 0, 0, -200 }, 
   orientation = Euler { 0, 0, 0 },
   fov = 53;
};

Light light
{
   specular = white;
   orientation = Euler { pitch = 10, yaw = 30 };
};

Light light2
{
   diffuse = white;
   orientation = Euler { pitch = 20, yaw = -30 };
};


class Test3D : Window
{
   text = "Cube";
   moveable = true;
   stayOnTop = true;
   clientSize = { 400, 400 };
   background = 0;
   opacity = 0;
   alphaBlend = true;

   Bitmap textures[6];
   Cube cube { };
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
         Update(null);
      }
      lastTime = time;
      return true;
   }

   void OnUnloadGraphics()
   {
      int c;
      PrimitiveGroup group;
      for(group = cube.mesh.groups.first, c = 0; c<6; c++, group = group.next)
      {
         delete textures[c];
         delete group.material;
      }
      
   }
   bool OnLoadGraphics()
   {
      char * hiragana[6] = { "あ", "い", "う", "え", "お", "ん" };
      int c;
      
      PrimitiveGroup group;
      Font font;
      DisplaySystem lfbSystem { };

      cube.Create(displaySystem);
      lfbSystem.Create("LFB", null, false);
      //font = lfbSystem.LoadFont("Arial Unicode MS", 180, 0);
      //font = lfbSystem.LoadFont("MingLiu", 150, 0);
      font = lfbSystem.LoadFont("FreeSans.ttf", 175, 0);
      
      for(group = cube.mesh.groups.first, c = 0; c<6; c++, group = group.next)
      {
         Surface surface;
         int tw, th;
         textures[c] = Bitmap { };
         textures[c].Allocate(null, 256, 256, 0, pixelFormat888, false);
         
         surface = textures[c].GetSurface(0,0, null);
         surface.TextFont(font);
         surface.SetBackground(ColorAlpha { 255/*64*/, beige });
         surface.Clear(colorBuffer);
         surface.SetForeground(ColorAlpha { 255/*128*/, ColorHSV { 60 * c, 100, 50 }}); 
         surface.TextExtent(hiragana[c], strlen(hiragana[c]), &tw, &th);
         //surface.WriteText((256 - tw) / 2, (256 - th) / 2 /*+ 20*/, hiragana[c], strlen(hiragana[c]));
         surface.WriteText(12,-45, hiragana[c], strlen(hiragana[c]));
         surface.SetBackground({ 255 /*64*/, ColorHSV { (90 + 60 * c) % 360, 75, 50 }} );
         surface.Area(5,5, 250,20);
         surface.Area(5,5, 20,250);
         surface.Area(235,5, 250,250);
         surface.Area(5, 235, 250,250);

         textures[c].MakeDD(displaySystem);

         group.material = { opacity = 1, diffuse = white, ambient = white, flags = { doubleSided = true, translucent = true }, baseMap = textures[c] };
         delete surface;
      }
      lfbSystem.UnloadFont(font);
      delete lfbSystem;

      cube.transform.scaling = { 100, 100, 100 };
      cube.transform.position = { 0, 0, 0 };
      cube.transform.orientation = Euler { 50, 50 };
      cube.UpdateTransform();
      return true;
   }
 
   void OnResize(int w, int h)
   {
      camera.Setup(w, h, null);
   }
 
   void OnRedraw(Surface surface)
   {
      surface.Clear(colorAndDepth);
      camera.Update();
      display.SetLight(0, light);
      display.SetLight(1, light2);
      display.SetCamera(surface, camera);
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
