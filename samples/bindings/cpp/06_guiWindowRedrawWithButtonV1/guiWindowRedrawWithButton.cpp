#define MODULE_NAME  "HelloForm"

#include "ecere.hpp"

class HelloForm : public Window
{
public:
   Button button;

   REGISTER()
   {
      REG_Window(HelloForm);
      // lambda alternative to destructor:
      // DESTRUCT(HelloForm) = [](HelloForm & self) { printf("It's the end my friend!\n");/* system("pause");*/ };
   }
   CONSTRUCT(HelloForm, Window)
   {
      caption = $("Sample App using Ecere Toolkit/C++ Bindings");
      borderStyle = BorderStyle::sizable;
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

      // lambda alternative to onRedraw() method:
      // onRedraw = [](Window & w, Surface & surface) { surface.writeTextf(100, 100, "simple"); };
   }

   void onRedraw(Surface & surface)
   {
      surface.writeTextf(100, 100, "simple");
   }

   ~HelloForm()
   {
      printf("It's the end my friend!\n");/* system("pause");*/
   }
};

GuiApplication app;

REGISTER_CLASS_DEF(HelloForm, Window, app);

HelloForm hello;

MAIN_DEFINITION;
