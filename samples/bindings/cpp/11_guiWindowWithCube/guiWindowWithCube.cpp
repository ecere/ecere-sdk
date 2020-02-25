#define MODULE_NAME  "HelloCube"

#include "ecere.hpp"

CPPClass nullClass;
Camera nullCamera ( (C(Instance))null, nullClass );
class HelloCube : public Window
{
public:
   Cube cube;
   C(Light) light { }; // todo: Light light;
   Camera camera;

   REGISTER() { REG_Window(HelloCube); }
   CONSTRUCT(HelloCube, Window)
   {
      caption = $("HelloCube -- Sample App using Ecere Toolkit/C++ Bindings");
      background = DefinedColor::black;
      borderStyle = BorderStyle::sizable;
      size = { 640, 480 };
      hasClose = true;
      hasMaximize = true;
      hasMinimize = true;
      displayDriver = "OpenGL";

      camera.position = { 0, 0, -300 };
      camera.fov = 53;

      //C(Euler) eul = { Degrees(30), Degrees(10) };
      Euler eul = { 30, 10 };
      Euler_to_Quaternion(&eul.impl, &light.orientation);
      Color_to_ColorRGB(DefinedColor_lightCoral, &light.diffuse);
      // todo: light.orientation = Euler(30, 10);
      // todo: light.diffuse = DefinedColor_lightCoral;
   }

   bool onLoadGraphics()
   {
      printLn(CO(String), "onLoadGraphics", null);
      DisplaySystem ds = displaySystem;
      cube.create(ds); // todo: cube.create(displaySystem);
      C(Transform) transform;
      //Transform transform;
      transform.scaling = { 100, 100, 100 };
      //C(Euler) euler { Degrees(50), Degrees(30), Degrees(50) };
      //Euler euler = { Degrees(50), Degrees(30), Degrees(50) };
      Euler euler = { 50, 30, 50 };
      //Euler_to_Quaternion(&euler, &transform.orientation);
      //Euler_to_Quaternion(&euler.impl, &transform.orientation);
      Euler_to_Quaternion(&euler.impl, &transform.orientation);
      // Object_set_transform((C(Object)*)cube.impl, &transform);
      cube.transform = transform;
      printLn(CO(Transform), &transform, null);
      {
         // C(Transform) * t1 = cube.transform;
         // printLn(CO(Transform), &t1, null);
      }
      /* todo:
      {
         Transform transform;
         transform.scaling = { 100, 100, 100 };
         transform.orientation = Euler(50, 30, 50); // conversion, todo
         cube.transform = transform;
      }
      */
      cube.updateTransform();
      return true;
   }

   void onResize(int w, int h)
   {
      printLn(CO(String), "onResize", null);
      camera.setup(w, h, null);
      camera.update();
   }

   void onRedraw(Surface & surface)
   {
      printLn(CO(String), "onRedraw", null);
      surface.clear(ClearType::depthBuffer);
      display->setLight(0, &light); // todo: display->setLight(0, light);
      display->setCamera(surface, camera);
      display->drawObject(cube);
      display->setCamera(surface, nullCamera); // todo: display->setCamera(surface, Camera(null));
   }
};

GuiApplication app;

REGISTER_CLASS_DEF(HelloCube, Window, app);

HelloCube cube;

MAIN_DEFINITION;
