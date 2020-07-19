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
      caption = $("HelloCube -- Sample App using Ecere Toolkit/C++ Bindings");
      size = { 640, 480 };
      background = DefinedColor::black;
#if 1
      borderStyle = BorderStyle::sizable;
      hasClose = true;
      hasMaximize = true;
      hasMinimize = true;
#else
      moveable = true;
      borderStyle = BorderStyle::none;
      opacity = 0;
      alphaBlend = true;
      stayOnTop = true;
#endif
      displayDriver = "OpenGL";

      TArray<double> b { 5.0, 3.2, 1.5 };
      TList<double> a;
      b = { 5.0, 3.2, 1.5 };

      // todo:
      // TList<const char *> c { "bgen: ", "Hello", "C++" };
      // printLn(c);

      a.add(3.0);
      a.add(4.2);
      a.add(9.5);
      // todo:
      printLn(a);
      // t_args_x<printLn>(a);
      {
         ZString z;
         ZString s = "#";
         // broken: z.concat("#");
         z.concat(s);
         // z.concatx(9);
         // z.concatx("works");
         printLn(z.string);
      }
      {
         ConsoleFile con;
         con.printLn("#works");
         con.print(1, ":1, ", 2, ":2, ", 3, ":3, ", 'x', ":x, ", 4.3, "\n");
      }

      camera.position = { 0, 0, -300 };
      camera.fov = 53;

      light.orientation = Euler(30, 10);
      light.diffuse = DefinedColor::lightCoral;

      if(sizeof(Point) == sizeof(C(Point)))
         eC_printLn(CO(String), "sizeof(Point) == sizeof(C(Point))", null);
      else
         eC_printLn(CO(String), "no", null);

   }

   bool onLoadGraphics()
   {
      cube.create(displaySystem);

      Transform transform;
      transform.scaling = { 100, 100, 100 };
      transform.orientation = Euler(50, 30, 50);
      cube.transform = transform;
      eC_printLn(CO(Transform), &transform, null);
      cube.updateTransform();
      return true;
   }

   void onUnloadGraphics()
   {
      cube.free(displaySystem);
   }

   void onResize(int w, int h)
   {
      // eC_printLn(CO(String), "onResize", null);
      camera.setup(w, h, null);
      camera.update();
   }

   void onRedraw(Surface & surface)
   {
      // eC_printLn(CO(String), "onRedraw", null);
      surface.clear(ClearType::depthBuffer);
      display->setLight(0, light);
      display->setCamera(surface, camera);
      display->drawObject(cube);
      display->setCamera(surface, Camera(null));
   }

   bool onKeyDown(Key key, unichar ch)
   {
      // todo?: key == KeyCode::escape
      if(key.code == KeyCode::escape)
         destroy(0);
      return true;
   }
};

GuiApplication app;

REGISTER_CLASS_DEF(HelloCube, Window, app);

HelloCube cube;

MAIN_DEFINITION;
