#define MODULE_NAME  "MyApp"

#include "ecere.hpp"

// Demonstrates overriding GuiApplication class, evolving instance from constructor
// Simpler alternative override of cycle() at instance level commented out
// Still using C++ style override of main() (Could also override just like cycle() in constructor or REGISTER())

class MyApp : public GuiApplication
{
public:
   APP_CONSTRUCT(MyApp, GuiApplication)
   {
      REGISTER_APP_CLASS(MyApp, GuiApplication, *this);
      /*cycle = +[](GuiApplication & app, bool idle)
      {
         PrintLn(class_String, "   Cycling!", null);
         return true;
      };*/
   }

   REGISTER()
   {
      GuiApplication::class_registration(_class);
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
