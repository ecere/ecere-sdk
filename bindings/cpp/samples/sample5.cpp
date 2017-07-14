#define MODULE_NAME  "HelloForm"

#include "ecere.hpp"

class HelloForm : public Window
{
public:
   Button button;

   HelloForm()
   {
      caption = $("Sample App using Ecere Toolkit/C++ Bindings");
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
      button.notifyClicked = [](Window & owner, Button & btn, int x, int y, Modifiers mods)
      {
         HelloForm & self = (HelloForm &)owner;
         MessageBox msgBox;
         msgBox.caption = self.button.caption;
         msgBox.contents = $("C++ Bindings!");
         msgBox.modal();
         return true;
      };

      onRedraw = [](Window & w, Surface & surface) { surface.writeTextf(100, 100, $("Instance Method!")); };
   }
};

extern "C" int
#if defined(__WIN32__) && !defined(__CONSOLE_APP__)
   __stdcall WinMain(void * hInstance, void * hPrevInst, char * cmdLine, int show)
#else
   main(int argc, char * argv[])
#endif
{
   GuiApplication app;
   HelloForm hello;

#if !defined(__WIN32__) || defined(__CONSOLE_APP__)
   eC_setArgs(app.impl, argc, argv);
#endif
   app.main();
   unloadTranslatedStrings(MODULE_NAME);
   return app.exitCode;
}
