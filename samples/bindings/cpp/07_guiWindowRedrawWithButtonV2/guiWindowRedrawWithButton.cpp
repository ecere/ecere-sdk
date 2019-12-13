#define MODULE_NAME  "HelloForm"

#include "ecere.hpp"

class HelloForm : public Window
{
public:
   Button button;

   CONSTRUCT(HelloForm, Window)
   {
      caption = $("Sample App using Ecere Toolkit/C++ Bindings");
      borderStyle = BorderStyle_sizable;
      clientSize = { 640, 480 };
      hasClose = true;
      hasMaximize = true;
      hasMinimize = true;
      background = SystemColor_formColor;
      font = { "Arial", 30 };

      button.parent = this;
      button.position = { 200, 200 };
      button.caption = $("Yay!!");
      button.notifyClicked = [](Window & owner, Button & btn, int x, int y, Modifiers mods) -> C(bool)
      {
         HelloForm & self = (HelloForm &)owner;
         MessageBox msgBox;
         msgBox.caption = self.button.caption;
         msgBox.contents = $("C++ Bindings!");
         msgBox.modal();
         return true;
      };
   }

   REGISTER()
   {
      register_onRedraw(_class, [](Window & w, Surface & surface) { surface.writeText/*f*/(100, 100, $("Class Method!!"), 14); });
   }
};

GuiApplication app;

CLASS_DEF(HelloForm);

MAIN_DECLARATION
{
   REGISTER_CLASS(HelloForm, Window, app);
   APP_SET_ARGS(app);
   HelloForm hello;
   app.main();
   unloadTranslatedStrings(MODULE_NAME);
   return app.exitCode;
}
