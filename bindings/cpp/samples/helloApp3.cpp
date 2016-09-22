#define MODULE_NAME  "MyApp"

#include "ecere.hpp"

class MyApp : public GuiApplication
{
public:
   APP_CONSTRUCT(MyApp, GuiApplication)
   {
      cycle = +[](GuiApplication & app)
      {
         PrintLn(class_String, "   Cycling!", null);
         return true;
      };
   }

   void main()
   {
      PrintLn(class_String, "C++: Hello, eC", null);
      GuiApplication::main();
   }
};

MyApp app;
Window w;

REGISTER_CLASS_DEF(MyApp, GuiApplication, app);

MAIN_DEFINITION
