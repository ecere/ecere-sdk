#define MODULE_NAME  "HelloForm"

// #define __CONSOLE_APP__

#include "ecere.hpp"

GuiApplication app;

MAIN_DEFINITION;

class HelloForm2 : public Window
{
public:
   Button button;

   CONSTRUCT(HelloForm2, Window)
   {
      caption = $("My Second Ecere/C++ Bindings App");
      borderStyle = sizable;
      clientSize = { 640, 480 };
      hasClose = true;
      hasMaximize = true;
      hasMinimize = true;
      background = formColor;
      font = { "Arial", 30 };

      button.parent = this;
      button.position = { 200, 200 };
      button.caption = $("Yay!!");
      // button.onRedraw = [](Window & foo, Surface s){ };
      button.notifyClicked = [](Window & owner, Button & btn, int x, int y, Modifiers mods)
      {
         double i = 3.14159265;
         char tmp[256];
         constString s = _onGetString(class_double, &i, tmp, null, null);
         PrintLn(class_String, "Hello! -- ", class_String, s, null); // Need to terminate with a null!
         HelloForm2 & self = (HelloForm2 &)owner;
         MessageBox($("C++ Bindings!"), self.button.caption).modal();

         FontResource a("Arial", 20, true);
         FontResource b("Comic Sans MS", 20, true);
         FontResource c("Arial", 20, true);

         bool ab = a.onCompare(class_FontResource, a, b);
         bool ac = a.onCompare(class_FontResource, a, c);
         printf("a compare b = %d\n", ab);
         printf("a compare c = %d\n", ac);

         return true;
      };

      onCreate = [](Window & w)
      {
         MessageBox($("Cool"), $("Creation!")).modal();
         return true;
      };

      //onRedraw(Surface());
      //onCreate();
   }

   /*static void myOnRedraw(Window & w, Surface surface)
   {
      surface.writeTextf(100, 100, $("Testing stuff!"));
      //surface.writeTextf(100, 100, "%d + %d = %d", 2, 3, 2+3);
   };*/

   REGISTER()
   {
      Window::class_registration(_class);
      register_onRedraw(_class, [](Window & w, Surface surface)
      {
         surface.writeTextf(100, 100, $("Class Method!"));
         //surface.writeTextf(100, 100, "%d + %d = %d", 2, 3, 2+3);
      });
   }
};
REGISTER_CLASS_DEF(HelloForm2, Window, app);

class HelloForm3 : public HelloForm2
{
public:
   CONSTRUCT(HelloForm3, HelloForm2)
   {
      background = 0x50B0F0;
      position = { 0, 0 };

      onRedraw = [](Window & w, Surface surface)
      {
         surface.writeTextf(100, 100, $("Instance Method!"));
         //surface.writeTextf(100, 100, "%d + %d = %d", 2, 3, 2+3);
      };
   }
};
REGISTER_CLASS_DEF(HelloForm3, HelloForm2, app);

HelloForm2 hello2;
HelloForm3 hello3;
