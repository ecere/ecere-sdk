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

class HelloCube : public Window
{
public:
   // Cube cube;

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
         // cube.create(self.displaySystem);
         // self.cube.transform.scaling = { 100, 100, 100 };
         // self.cube.transform.orientation = Euler { 50, 30, 50 };
         // self.cube.updateTransform();
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
         // HelloCube & self = (HelloCube &)window;
         // Display & display = self.display;
         surface.clear(ClearType_depthBuffer);
         // self.display.setLight(0, light);
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
