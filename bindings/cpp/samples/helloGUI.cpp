#define MODULE_NAME  "HelloForm"
// #define __CONSOLE_APP__

#include "ecere.hpp"

class HelloForm : public Window
{
public:
   Label label;

   CONSTRUCT(HelloForm, Window)
   {
      caption = $("My First Ecere/C++ Bindings App");
      borderStyle = sizable;
      size = { 380, 190 };
      hasClose = true;

      label.parent = this;
      label.caption = $("Hello, Bindings!!");
      label.position = { 10, 10 };
      label.font = { "Arial", 30 };

      //char tmp[256];
      //String s = Instance_onGetString(0, font, tmp, null, null);
      //PrintLn(class_String, s, null);  // Need to terminate with a null!
   }
};

GuiApplication app;

REGISTER_CLASS_DEF(HelloForm, Window, app);

HelloForm hello;

MAIN_DEFINITION;
