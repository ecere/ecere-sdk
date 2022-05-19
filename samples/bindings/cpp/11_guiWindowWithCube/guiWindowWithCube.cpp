#define MODULE_NAME  "HelloCube"

#include "ecere.hpp"

class HelloCube : public Window
{
public:
   Cube cube;
   Light light;
   Camera camera;

   REGISTER() { REG_Window(HelloCube); }
   CONSTRUCT(HelloCube, Window)
   {
      caption = $("HelloCube -- Sample 3D App using Ecere Toolkit/C++ Bindings");
      background = DefinedColor::black;
      size = { 640, 480 };
      borderStyle = BorderStyle::sizable;
      hasClose = true;
      hasMaximize = true;
      hasMinimize = true;
      displayDriver = "OpenGL";

      camera.position = { 0, 0, -300 };
      camera.fov = 53;

      light.orientation = Euler(30, 10);
      light.diffuse = DefinedColor::lightCoral;
   }

   bool onLoadGraphics()
   {
      cube.create(displaySystem);

      Transform transform;
      transform.scaling = { 100, 100, 100 };
      transform.orientation = Euler(50, 30, 50);
      cube.transform = transform;
      cube.updateTransform();
      return true;
   }

   void onUnloadGraphics()
   {
      cube.free(displaySystem);
   }

   void onResize(int w, int h)
   {
      camera.setup(w, h, null);
      camera.update();
   }

   void onRedraw(Surface & surface)
   {
      surface.clear(ClearType::depthBuffer);
      display->setLight(0, light);
      display->setCamera(surface, camera);
      display->drawObject(cube);
      display->setCamera(surface, Camera(null));
   }

   bool onKeyDown(Key key, unichar ch)
   {
      if(key == KeyCode::escape)
         destroy(0);
      return true;
   }
};

GuiApplication app;

REGISTER_CLASS_DEF(HelloCube, Window, app);

HelloCube cube;

MAIN_DEFINITION;
