#define MODULE_NAME  "HelloForm"

#include "ecere.hpp"

class HelloForm : public Window
{
public:
   Button button;

   CONSTRUCT(HelloForm, Window)
   {
      caption = $("Sample App using Ecere Toolkit/C++ Bindings");
      borderStyle = BorderStyle::sizable;
      displayDriver = "OpenGL";
      clientSize = { 640, 480 };
      hasClose = true;
      hasMaximize = true;
      hasMinimize = true;
      background = SystemColor::formColor;
      font = { "Arial", 30 };

      button.parent = this;
      button.position = { 200, 200 };
      button.caption = $("Yay!!");
      button.notifyClicked = [](Window & owner, Button & btn, int x, int y, Modifiers mods) -> bool
      {
         HelloForm & self = (HelloForm &)owner;
         MessageBox msgBox;
         msgBox.caption = self.button.caption;
         msgBox.contents = $("C++ Bindings!");
         msgBox.modal();
         return true;
      };

      onRedraw = [](Window & w, Surface & surface) { surface.writeText/*f*/(100, 100, $("Instance Method!"), 16); };
   }
};
GuiApplication app;

REGISTER_CLASS_DEF(HelloForm, Window, app);

HelloForm hello;

MAIN_DEFINITION;
