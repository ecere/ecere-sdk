import "ecere"

class WalkAroundApp : GuiApplication
{
   driver = "OpenGL";
   // driver = "Direct3D";
   timerResolution = 60;
   appName = "3D Walkaround Sample";
   Time lastTime;
   bool wasProcessingMoves;

   bool Cycle(bool idle)
   {
      bool processMoves = form && form.acquiredInput;
      if(processMoves)
      {
         Time time = GetTime(), diffTime;
         int xd = 0, yd = 0;
         MouseButtons buttons;
         if(wasProcessingMoves != processMoves)
         {
            lastTime = time;
            GetMouseState(&buttons, &xd, &yd);
         }
         diffTime = time - lastTime;
         lastTime = time;
         GetMouseState(&buttons, &xd, &yd);
         if(form && form.active)
         {
            bool updateCamera = false;
            float speed = 50;
            float cameraSpeed = 0.5;
            Vector3D movement { };
            Euler orientation = camera.orientation;
            Euler euler = orientation;
            euler.roll = 0;
            orientation.roll = 0;

            euler.yaw -= xd * cameraSpeed;
            euler.pitch -= yd * cameraSpeed;
            if(GetKeyState(right)) euler.yaw   -= diffTime * cameraSpeed;
            if(GetKeyState(left))  euler.yaw   += diffTime * cameraSpeed;
            if(GetKeyState(up))    euler.pitch -= diffTime * cameraSpeed;
            if(GetKeyState(down))  euler.pitch += diffTime * cameraSpeed;
            euler.pitch = Min(Max(euler.pitch, Degrees { -89.9 }), Degrees { 89.9 });
            if(orientation.yaw != euler.yaw || orientation.pitch != euler.pitch || orientation.roll != euler.roll)
            {
               camera.orientation = euler;
               updateCamera = true;
            }

            if(GetKeyState(e))                  movement.y -= diffTime * speed;
            if(GetKeyState(c))                  movement.y += diffTime * speed;
            if(GetKeyState(s) || buttons.right) movement.z -= diffTime * speed;
            if(GetKeyState(w) || buttons.left)  movement.z += diffTime * speed;
            if(GetKeyState(a))                  movement.x -= diffTime * speed;
            if(GetKeyState(d))                  movement.x += diffTime * speed;
            if(movement.x || movement.y || movement.z)
            {
               camera.Move(movement);
               updateCamera = true;
            }

            if(updateCamera)
            {
               camera.Update();
               form.Update(null);
            }
         }
      }
      wasProcessingMoves = processMoves;
      return true;
   }
};

define app = (WalkAroundApp)__thisModule.application;

Camera camera
{
   fixed,
   position = Vector3D { 0, -100, -200 },
   orientation = Euler { 0, 0, 0 },
   fov = 70;
};

Light light
{
   diffuse = white;
   specular = white;
   orientation = Euler { 0, 70 };
};

define width = 10;
define height = 10;
define tileSize = 30;
define gap = 5;

class WalkAroundForm : Window
{
   caption = "3D Walkaround Sample";
   background = black;

   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { 632, 438 };

   Array<Material> materials { };
   Array<int> map { size = width * height };
   Array<int> elv { size = width * height };
   Array<Cube> cubes { };

   BitmapResource spotTex { ":spot_tex.png", window = this };
   Material sideMat { opacity = 0.5f, diffuse = teal, ambient = teal, flags = { doubleSided = true, translucent = true, update = true } };
   Material cow1Mat { opacity = 1.0f, diffuse = white, ambient = white };
   Material cow2Mat { opacity = 1.0f, power = 20, diffuse = goldenrod, ambient = goldenrod, specular = goldenrod };
   Material cow3Mat { opacity = 1.0f, power = 20, diffuse = goldenrod, ambient = goldenrod, specular = goldenrod };
   Object cowModel { };
   Object cow1 { };
   Object cow2 { };
   Object cow3 { };
   Cube cube { };
   Array<Bitmap> textures { };
   bool acquiredInput;

   WalkAroundForm()
   {
      RandomSeed(1234);
      GenerateMap();
   }

   void GenerateMap()
   {
      int i;
      for(i = 0; i < map.count; i++)
      {
         map[i] = GetRandom(0, 7);
         elv[i] = GetRandom(1, 100);
      }
   }

   bool OnLoadGraphics()
   {
      Bitmap textureFile { };
      int i, x, y;

      cowModel.Load(":cow.3DS", null, displaySystem);
      cowModel.Merge(displaySystem);
      cowModel.mesh.ApplyMaterial(null);

      cow1.Duplicate(cowModel);
      cow1.transform.position = { -20, -50, 10 };
      cow1.transform.scaling = { 20, 20, 20 };
      cow1.transform.orientation = Euler { yaw = 135 };
      cow1.UpdateTransform();
      cow1.material = cow1Mat;
      cow1Mat.baseMap = spotTex.bitmap;

      cow2.Duplicate(cowModel);
      cow2.transform.position = { 60, -42, -5 };
      cow2.transform.scaling = { 20, 20, 20 };
      cow2.transform.orientation = Euler { yaw = 225 };
      cow2.UpdateTransform();
      cow2.material = cow2Mat;

      cow3.Duplicate(cowModel);
      cow3.transform.position = { 120, -89, 13 };
      cow3.transform.scaling = { 20, 20, 20 };
      cow3.transform.orientation = Euler { yaw = 185 };
      cow3.UpdateTransform();
      cow3.material = cow3Mat;
      cow3Mat.baseMap = spotTex.bitmap;

      materials.size = 8;
      if(textureFile.Load(":texture1.pcx", null, null))
      {
         int count = 8;
         int height = textureFile.height / count;
         for(i = 0; i < count; i++)
         {
            Bitmap tex { };
            tex.Allocate(null, textureFile.width, height, 0, pixelFormat888, false);
            tex.Grab(textureFile, 0, i * height);
            tex.MakeMipMaps(displaySystem);
            textures.Add(tex);

            materials[i] =
            {
               ambient = white;
               diffuse = white;
               baseMap = tex;
               opacity = 1.0f;
            };
         }
      }
      delete textureFile;

      for(y = 0; y < height; y++)
      {
         for(x = 0; x < width; x++)
         {
            int ix = y * width + x;
            int num = map[ix];
            float h = elv[ix];
            Cube cube { };

            PrimitiveGroup face;
            cubes.Add(cube);
            cube.Create(displaySystem);
            cube.flags.translucent = true;

            for(face = cube.mesh.groups.first; face; face = face.next)
               face.material = face.prev ? sideMat : materials[num];
            cube.mesh.ApplyTranslucency(cube);
            cube.transform.position = { x * (tileSize + gap), -h/2, y * (tileSize + gap) };
            cube.transform.scaling = { tileSize, h, tileSize };
            cube.transform.orientation = Euler { 0, 0, 0 };
            cube.UpdateTransform();
         }
      }
      return true;
   }

   void OnUnloadGraphics()
   {
      materials.Free();
      textures.Free();

      for(c : cubes)
         c.Free(displaySystem);
      cowModel.Free(displaySystem);
      cow1.Free(displaySystem);
      cow2.Free(displaySystem);
      cow3.Free(displaySystem);
      cubes.Free();
   }

   void OnResize(int w, int h)
   {
      camera.Setup(w, h, null);
      camera.Update();
   }

   void OnRedraw(Surface surface)
   {
      surface.Clear(depthBuffer);
      display.SetCamera(surface, camera);
      display.SetLight(0, light);
      display.ambient = Color { 100, 100, 100 };

      for(c : cubes)
         display.DrawObject(c);

      display.DrawObject(cow1);
      display.DrawObject(cow2);
      display.DrawObject(cow3);

      display.SetCamera(surface, null);

      if(!acquiredInput)
      {
         surface.foreground = white;
         surface.WriteTextf(50, 50, "Press I to acquire mouse Input, F for Full screen.");
      }
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      switch(key)
      {
         case escape: Destroy(0); break;
         case wheelDown:
            camera.Move({ 0, -4, 0 });
            camera.Update();
            Update(null);
            break;
         case wheelUp:
            camera.Move({ 0, 4, 0 });
            camera.Update();
            Update(null);
            break;
         case i:
         {
            acquiredInput ^= true;
            AcquireInput(acquiredInput);
            Update(null);
            break;
         }
         case f:
         {
            bool fullScreen = !app.fullScreen;
            AcquireInput(false);
            if(fullScreen)
            {
               anchor = { 0, 0, 0, 0 };
               borderStyle = none;
            }
            else
            {
               borderStyle = sizable;
               nativeDecorations = true;
               hasMaximize = true;
               hasMinimize = true;
               hasClose = true;
               state = normal;
               anchor = { };
               clientSize = { 632, 438 };
            }
            app.fullScreen = fullScreen;
            if(fullScreen)
               ; // app.resolution = res640x480;
            else
               position = position;

            AcquireInput(acquiredInput);
            break;
         }
      }
      return true;
   }
}

WalkAroundForm form {};
