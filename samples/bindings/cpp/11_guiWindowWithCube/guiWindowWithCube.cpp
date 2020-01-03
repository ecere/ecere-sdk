#define MODULE_NAME  "HelloCube"

#include "ecere.hpp"

// Camera camera = { CameraType_fixed, C(Vector3D) { 0, 0, -300 }/*, C(Euler) { 0, 0, 0 }*/ };

CPPClass nullClass;
Camera nullCamera ( (C(Instance))null, nullClass );
/*
Camera camera
{
   fixed,
   position = Vector3D { 0, 0, -300 },
   orientation = Euler { 0, 0, 0 },
   fov = 53;
};
*/

/*
Light light
{
   diffuse = lightCoral;
   orientation = Euler { pitch = 10, yaw = 30 };
};
*/
C(Light) light { };

class HelloCube : public Window
{
public:
   Camera camera;
   // C(Cube) * cube;
   Cube cube;
   // Object object;
   // C(Light) * light;

   CONSTRUCT(HelloCube, Window)
   {
      // C(Euler) lightEul = { Degrees(30), Degrees(10) };

      caption = $("HelloCube -- Sample App using Ecere Toolkit/C++ Bindings");
      background = DefinedColor_black;
      borderStyle = BorderStyle_sizable;
      size = { 640, 480 };
      hasClose = true;
      hasMaximize = true;
      hasMinimize = true;

      camera.type = CameraType_fixed;
      camera.position = C(Vector3D) { 0, 0, -300 };
      camera.eulerOrientation = C(Euler) { 0, 0, 0 };
      camera.fov = Degrees(53);

      // light = (C(Light)){ };
      // light.diffuse = DefinedColor_lightCoral;
      // light.orientation = { Degrees(30), Degrees(10) };// Euler { pitch = 10, yaw = 30 };
      /*light = newt0(Light, 1);
      {
         ColorRGB diffuse;
         Color_to_ColorRGB(DefinedColor_lightCoral, &diffuse);
         self->light->diffuse = diffuse;
      }*/
      {
         C(Euler) eul = { Degrees(30), Degrees(10) };
         Euler_to_Quaternion(&eul, &light.orientation);
      }

      Color_to_ColorRGB(DefinedColor_lightCoral, &light.diffuse);

      onLoadGraphics = [](Window & window) -> C(bool)
      {
         HelloCube & self = (HelloCube &)window;
         C(Transform) transform;
         DisplaySystem & ds = self.displaySystem;
            // C(Instance) cdsx = self.displaySystemX;
         // DisplaySystem dsx(self.displaySystemX, DisplaySystem::_class);
         // DisplaySystem & ds = dsx;
            // dsx.impl->refCount += 2;
            // printf("%p\n", self.displaySystem.impl);

         printf("1: %p\n", ds.impl);
         printf("2: %p\n", ds.impl->_class);
         printf("3: %s\n", ds.impl->_class->name);

         ds.impl->_refCount++;
            // printf("%p\n", ds._class.impl);
            // printf("%s\n", ds._class.impl->name);

            // printf("cdsx: %p\n", cdsx);
         // printf("dsx.impl: %p\n", dsx.impl);

            // self.cube.create(self.displaySystem);
         self.cube.create(ds);
            // do something for properties?
         Object_get_transform((C(Object)*)self.cube.impl, &transform);
         transform.scaling = (C(Vector3Df)){ 100, 100, 100 };
         // transform.orientation = { 100, 100, 100 };
         {
            C(Quaternion) orientation;
            C(Euler) eul = { Degrees(50), Degrees(30), Degrees(50) };
            Euler_to_Quaternion(&eul, &orientation);
            transform.orientation = orientation;
         }
         Object_set_transform((C(Object)*)self.cube.impl, &transform);
         self.cube.updateTransform();
         return true;
      };

      onResize = [](Window & window, int w, int h)
      {
         HelloCube & self = (HelloCube &)window;
         self.camera.setup(w, h, null);
         self.camera.update();
      };

      onRedraw = [](Window & window, Surface & surface)
      {
         HelloCube & self = (HelloCube &)window;
         Display & d = self.display;
         // Display dx(surface.displayX, Display::_class);
         // Display & d = dx;
         d.impl->_refCount++;
         surface.clear(ClearType_depthBuffer);
         // note: can't do self.diaplay.setLight() or self.display.setCamera()
         d.setLight(0, &light);
         d.setCamera(surface, self.camera);
         printf("\n");
         d.drawObject((Object&)self.cube);
         /*{
            Object & object = (Object&)self.cube;
            C(Object) * o = object.impl;
            C(bool) ret = Display_drawObject(d.impl, o);
            printf("%d\n", ret);
         }*/
         d.setCamera(surface, nullCamera);
      };
   }

   REGISTER()
   {
      Window::class_registration(_class);
      register_onRedraw(_class, [](Window & w, Surface & surface) { surface.writeText/*f*/(100, 100, $("Class Method!!"), 14); });
   }
};

class MyApplication : public GuiApplication
{
public:
   APP_CONSTRUCT(MyApplication, GuiApplication)
   {
      // REGISTER_APP_CLASS(MyApplication, GuiApplication, *this);
      driver = "OpenGL";
   }

   void main()
   {
      HelloCube hello;

      GuiApplication::main();
   }
};

MyApplication app;

REGISTER_CLASS_DEF(MyApplication, GuiApplication, app);

REGISTER_CLASS_DEF(HelloCube, Window, app);

MAIN_DEFINITION;
