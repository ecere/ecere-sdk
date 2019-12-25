#define MODULE_NAME  "HelloCube"

#include "ecere.hpp"

Camera camera = { CameraType_fixed, C(Vector3D) { 0, 0, -300 }/*, C(Euler) { 0, 0, 0 }*/ };

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
   // C(Cube) * cube;
   Cube cube;
   // Object object;

   CONSTRUCT(HelloCube, Window)
   {
      caption = $("HelloCube -- Sample App using Ecere Toolkit/C++ Bindings");
      background = DefinedColor_black;
      borderStyle = BorderStyle_sizable;
      size = { 640, 480 };
      hasClose = true;
      hasMaximize = true;
      hasMinimize = true;

      // camera.orientation = /*C(Euler) { 0, 0, 0 }*/;
      camera.fov = 53;

      onLoadGraphics = [](Window & window) -> C(bool)
      {
         HelloCube & self = (HelloCube &)window;
         C(Transform) transform;
         // DisplaySystem & ds = self.displaySystem;
         // self.cube.create(ds);
         self.cube.create(self.displaySystem);
         Object_get_transform((C(Object)*)self.cube.impl, &transform);
         transform.scaling = (C(Vector3Df)){ 100, 100, 100 };
         // transform.orientation = { 100, 100, 100 };
         {
            C(Quaternion) orientation;
            C(Euler) eul = { Degrees(50), Degrees(30), Degrees(50) };
            Euler_to_Quaternion(&eul, &orientation);
            transform.orientation = orientation;
         }
         // self.cube.transform.scaling = { 100, 100, 100 };
         // self.cube.transform.orientation = Euler { 50, 30, 50 };
         // self.object.updateTransform();
         self.cube.updateTransform();
         return true;
      };

      onResize = [](Window & window, int w, int h)
      {
         // HelloCube & self = (HelloCube &)window;
         camera.setup(w, h, null);
         camera.update();
      };

      onRedraw = [](Window & window, Surface & surface)
      {
         HelloCube & self = (HelloCube &)window;
         Display & display = self.display;
         surface.clear(ClearType_depthBuffer);
         // display.setLight(0, light);
         // self.display.setCamera(surface, camera);
         // self.display.drawObject(self.cube);
         // display.setCamera(surface, null);
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
