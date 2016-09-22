#define MODULE_NAME  "MyApp"

#include "ecere.hpp"

class MyApp : public GuiApplication
{
public:
   APP_CONSTRUCT(MyApp, GuiApplication)
   {
      REGISTER_APP_CLASS(MyApp, GuiApplication, *this);
      /*
      cycle = +[](GuiApplication & app, bool idle)
      {
         PrintLn(class_String, "   Cycling!", null);
         return true;
      };
      */
   }

   REGISTER()
   {
      GuiApplication_class_registration(GuiApplication);
      register_cycle(_class, [](GuiApplication & app, bool idle)
      {
         PrintLn(class_String, "   Cycling!", null);
         return true;
      });
   }

   void main()
   {
      PrintLn(class_String, "C++: Hello, eC", null);
      GuiApplication::main();
   }
};

MyApp app;
Window w;
CLASS_DEF(MyApp);
MAIN_DEFINITION
