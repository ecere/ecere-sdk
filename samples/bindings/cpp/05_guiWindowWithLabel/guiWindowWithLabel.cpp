#define MODULE_NAME  "HelloForm"

#include "ecere.hpp"

class HelloForm : public Window
{
public:
   Label label;

   REGISTER() { REG_Window(HelloForm); }
   CONSTRUCT(HelloForm, Window)
   {
      caption = $("My First Ecere/C++ Bindings App");
      borderStyle = BorderStyle::sizable;
      size = { 380, 190 };
      hasClose = true;

      label.parent = this;
      label.caption = $("Hello, Bindings!!");
      label.position = { 10, 10 };
      label.font = { "Arial", 30 };

      /* // FIXME: (missing FontResource::Instance_onGetString_Functor::operator() definition)
      FontResource f = font;
      char tmp[256];
      const char * s = f.onGetString(f, tmp, (void *)null, (ObjectNotationType *)null);
      printLn(s); */
   }
};

GuiApplication app;

REGISTER_CLASS_DEF(HelloForm, Window, app);

HelloForm hello;

MAIN_DEFINITION;
