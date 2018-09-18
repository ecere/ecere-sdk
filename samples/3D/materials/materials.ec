#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

class MyApp : GuiApplication
{
   driver = "OpenGL";
   // driver = "Direct3D";
   timerResolution = 60;

   bool Cycle(bool idle)
   {
      materialsTest.updateModel();
      return true;
   }
};

Camera camera
{
   attached,
   position = Vector3D { 0, 0, -300 },
   orientation = Euler { }; //30, 30, 0 },
   fovDirection = vertical,
   fov = 53;
};

Object cameraTarget { };

Object posLight
{
   transform = { position = { 0, 0, -10 }, scaling = { 1, 1, 1 } };
   light =
   {
      multiplier = 1.0f;
      diffuse = white;
      Kc = 1.0;
      //Kc = 0.8;
      Kl = 0.00002;
      Kq = 0.000002;
      specular = white; //blue;
      //flags = { attenuation = true };
      lightObject = posLight;
   };
};

Light light
{
   specular = white;
   multiplier = 1.0f;
   diffuse = white;
   orientation = Euler { pitch = 40, yaw = 50 };
};


define rGlass = 1.52;
define rWater = 1.33;
define rIce = 1.309;
define rDiamond = 2.42;

class MaterialsTest : Window
{
   caption = "Materials Test";
   background = black;
#if defined(__EMSCRIPTEN__)
   anchor = { 0, 0, 0, 0 };
#else
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };
   state = maximized;
#endif
   // glCapabilities.shaders = true;

   Cube cube { };
   Sphere sphere { };
   Sphere roundedCylinder { flattenedBody = 0.3f };
   Object teapot { };

   Object model;

   Euler spin { };

   SkyBox waterBox
   {
      size = { 10000, 10000, 10000 },
      folder = ":watersky", extension = "jpg",
      cubeMap = waterCubeMap
   };

   /*
   SkyBox forestBox
   {
      size = { 10000, 10000, 10000 },
      folder = ":forest", extension = "jpg", newStyle = true,
      cubeMap = forestCubeMap
   };
   */
   SkyBox sky;
   font = { "Tahoma", 12, true, outlineSize = 3.0, outlineFade = 0.2 };

   bool updateModel()
   {
      static Time lastTime = 0;
      Time time = GetTime(), diffTime = lastTime ? (time - lastTime) : 0;
      Transform transform = model.transform;
      if(spin.yaw || spin.pitch)
      {
         int signYaw = 1, signPitch = 1;
         Radians yaw = spin.yaw, pitch = spin.pitch;
         Quaternion orientation = transform.orientation;
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

         model.transform.orientation = orientation;
         //transform.orientation = orientation;
         //model.transform = transform;
         model.UpdateTransform();
         Update(null);
      }
      lastTime = time;
      return true;
   }

   /*
   BitmapResource bumpMap { "bumpmap.png", window = this };
   BitmapResource baseMap { "basetex.bmp", window = this };
   */
   BitmapResource bumpMap { ":normal.jpg", mipMaps = true, window = this };
   // BitmapResource bumpMap { ":normal.png", mipMaps = true, window = this };
   //BitmapResource baseMap { "diffuse.png", mipMaps = true, window = this };
   // BitmapResource specularMap { "specular.jpg", mipMaps = true, window = this };
   CubeMap waterCubeMap { };
   //CubeMap forestCubeMap { };

   Material material
   {
      ambient = blue; //white;
      diffuse = blue; //white;
      //specular = { 3.0, 3.0, 3.0 };
      specular = { 1.0, 1.0, 3.0 };
      power = 60.0;
      flags =
      {
         doubleSided = true;
         tile = true;
         separateSpecular = true;
         setupTextures = true;
         update = true;
      };
      uScale = 4, vScale = 4;
      reflectivity = 0.3;
      refractiveIndex = rGlass;
      opacity = 0.3;
   };

   void prepareModel(Object model, float s)
   {
      model.transform.scaling = { s, s, s };
      model.transform.position = { 0, 0, 0 };
      model.UpdateTransform();
      model.SetMinMaxRadius(false);
      model.mesh.ApplyMaterial(material);
   }

   void viewModel(Object model, double distance, float uvScale)
   {
      double r = model.radius * model.transform.scaling.z; //wradius;
      material.uScale = uvScale;
      material.vScale = uvScale;
      material.flags |= { update = true, setupTextures = true };
      camera.position = { 0, 0, -r * distance };
      cameraTarget.transform.position =
      {
         (model.max.x + model.min.x) / 2,
         (model.max.y + model.min.y) / 2,
         (model.max.z + model.min.z) / 2
      };
      this.model = model;
      Update(null);
   }

   void selectEnv(SkyBox sky, CubeMap cubeMap)
   {
      material.envMap = cubeMap;
      material.flags |= { update = true, setupTextures = true };
      this.sky = sky;
      Update(null);
   }

   void OnUnloadGraphics()
   {
      teapot.Free(displaySystem);
      sphere.Free(displaySystem);
      roundedCylinder.Free(displaySystem);
      cube.Free(displaySystem);
      waterBox.Free(displaySystem);
   }

   bool OnLoadGraphics()
   {
      const String faceNames1[] = { ":watersky/rt", ":watersky/lf",  ":watersky/up", ":watersky/dn", ":watersky/bk", ":watersky/fr" };
      //const String faceNames2[] = { ":forest/rt", ":forest/lf",  ":forest/up", ":forest/dn", ":forest/bk", ":forest/fr" };

      //material.bumpMap = bumpMap.bitmap;
      //material.baseMap = baseMap.bitmap;
      //material.specularMap = specularMap.bitmap;
      //material.reflectMap = specularMap.bitmap;

      // Water & Sky
      if(!waterCubeMap.Load(displaySystem, faceNames1, "jpg", true)) waterBox.cubeMap = null;
      // Forest Cube
      //if(!forestCubeMap.Load(displaySystem, faceNames2, "jpg", false)) forestBox.cubeMap = null;

      teapot.Load(":teapot.3DS", null, displaySystem);
      teapot.Merge(displaySystem);
      teapot.mesh.ApplyMaterial(material);
      prepareModel(teapot, 1);

      roundedCylinder.Create(displaySystem);
      prepareModel(roundedCylinder, 50);

      sphere.Create(displaySystem);
      prepareModel(sphere, 50);

      cube.Create(displaySystem);
      prepareModel(cube, 50);

      camera.target = cameraTarget;
      camera.zMin = 1;
      camera.zMax = 10000;

      waterBox.size = { camera.zMax, camera.zMax, camera.zMax };
      //forestBox.size = { camera.zMax, camera.zMax, camera.zMax };
      waterBox.Create(displaySystem);
      //forestBox.Create(displaySystem);

      viewModel(sphere, 1.5 * sqrt(2), 4.0);
      //viewModel(cube, 1.5 * 2, 2);
      //viewModel(teapot, 1.5 * 2, 2);
      selectEnv(waterBox, waterCubeMap);
      // selectEnv(forestBox, forestCubeMap);
      return true;
   }

   void OnResize(int w, int h)
   {
      camera.Setup(w, h, null);
      camera.Update();
   }

   void OnRedraw(Surface surface)
   {
      int x, y;

      camera.Update();
      GetMousePosition(&x, &y);

      posLight.transform.position =
      {
         (x - clientSize.w / 2) * 400 / clientSize.w,
         (y - clientSize.h / 2) * 400 / clientSize.h,
         - 2 * model.wradius
      };
      posLight.UpdateTransform();

      surface.Clear(depthBuffer);

      // Setting the light before the camera means the light is in view space
      //display.SetLight(0, posLight.light);
      display.SetLight(0, light);
      // display.ambient = { };

      //display.ambient = { 255, 0, 0 };
      display.SetCamera(surface, camera);

      // Setting the light before the camera means the light is in world space
      //display.SetLight(0, light);

      sky.Render(camera, display);

      display.DrawObject(model);
      display.SetCamera(surface, null);

      surface.outlineColor = black;
      surface.foreground = white;

      surface.WriteTextf(10, 10,  "('R' to toggle')   Reflection:     %s,   Refraction: %s",
         material.reflectivity ? "ON" : "OFF",
         material.refractiveIndex ? "ON" : "OFF");
      surface.WriteTextf(10, 40,  "('C' to toggle')   Shape:            %s ",
         model == cube ? "Cube" : model == sphere ? "Sphere" : model == roundedCylinder ? "Rounded Cylinder" : "Teapot");
      /*surface.WriteTextf(10, 70,  "('E' to toggle')   Environment:  %s",
         material.envMap == waterCubeMap ? "Water & Sky" : "Forest");*/
      surface.WriteTextf(10, 100, "('B' to toggle')   Normal Map:   %s",
         material.bumpMap ? "ON" : "OFF");
      surface.WriteTextf(10, 130, "Left-Button Drag: Rotate Camera;   Middle-Button Drag: Spin Model;   Right-Button Drag: Rotate Light");
      surface.WriteTextf(10, 160, "Scroll Wheel: Move camera closer / further");
#ifndef __EMSCRIPTEN__
      surface.WriteTextf(10, 200, "Shaders:     %s", glCapabilities.shaders ? "ON" : "OFF");
#endif
   }

   Point startClick;
   bool moving, movingCamera, movingLight;
   Time clickTime;
   Point startPosition;
   Euler startOrientation;

   bool OnMiddleButtonDown(int x, int y, Modifiers mods)
   {
      clickTime = GetTime();
      Capture();
      startClick = { x, y };
      moving = true;
      return true;
   }

   bool OnMiddleButtonUp(int x, int y, Modifiers mods)
   {
      if(moving)
      {
         ReleaseCapture();
         moving = false;
      }
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(!movingCamera && !moving && !movingLight)
      {
         startPosition.x = x;
         startPosition.y = y;
         startOrientation = camera.eulerOrientation;
         Capture();
         movingCamera = true;
      }
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(movingCamera)
      {
         ReleaseCapture();
         movingCamera = false;
      }
      return true;
   }

   bool OnRightButtonDown(int x, int y, Modifiers mods)
   {
      if(!moving && !movingLight)
      {
         startPosition.x = x;
         startPosition.y = y;
         startOrientation = light.orientation;
         Capture();
         movingLight = true;
      }
      return true;
   }

   bool OnRightButtonUp(int x, int y, Modifiers mods)
   {
      if(movingLight)
      {
         ReleaseCapture();
         movingLight = false;
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
      else if(movingCamera)
      {
         Euler euler
         {
            startOrientation.yaw   - (x - startPosition.x),
            startOrientation.pitch + (y - startPosition.y),
            0
         };

         camera.eulerOrientation = euler;

         Update(null);
      }
      else if(movingLight)
      {
         light.orientation = Euler
         {
            startOrientation.yaw   - (x - startPosition.x),
            startOrientation.pitch + (y - startPosition.y),
            0
         };

         Update(null);
      }
      Update(null);
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      switch(key)
      {
         case wheelDown: case minus: camera.position.z *= 1.1111111f; Update(null); break;
         case wheelUp: case plus: camera.position.z *= 0.9f; Update(null); break;
         case f3:
            glCapabilities.shaders ^= true;
            Update(null);
            break;
         case c:
            if(model == cube)
               viewModel(sphere, 1.5 * sqrt(2), 4);
            else if(model == sphere)
               viewModel(roundedCylinder, 1.5 * sqrt(2), 4);
            else if(model == roundedCylinder)
               viewModel(teapot, 1.5 * sqrt(2), 1.5);
            else if(model == teapot)
               viewModel(cube, 1.5 * 2, 2);
            Update(null);
            break;
         /*case e:
            if(sky == waterBox)
               selectEnv(forestBox, forestCubeMap);
            else
               selectEnv(waterBox, waterCubeMap);
            break;*/
         case d:
         {
            static bool debugging = false;
            debugging ^= true;
            DefaultShader::shader().debugging(debugging);
            Update(null);
            break;
         }
         case b:
            material.bumpMap = material.bumpMap ? null : bumpMap.bitmap;
            material.flags |= { update = true, setupTextures = true };
            Update(null);
            break;
         case r:
            if(material.reflectivity && material.refractiveIndex)
            {
               material.refractiveIndex = 0;
               material.opacity = 1.0;
               material.reflectivity = 0.8;
            }
            else if(material.reflectivity)
            {
               material.reflectivity = 0;
               material.refractiveIndex = rGlass;
               material.opacity = 0.3;
            }
            else if(material.refractiveIndex)
            {
               material.refractiveIndex = 0.0;
               material.opacity = 1.0;
            }
            else
            {
               material.reflectivity = 0.3;
               material.refractiveIndex = rGlass;
               material.opacity = 0.3;
            }
            material.flags |= { update = true, setupTextures = true };
            Update(null);
            break;
      }
      return true;
   }
}

MaterialsTest materialsTest {};
