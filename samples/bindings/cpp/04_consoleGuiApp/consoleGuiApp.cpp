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
      REG_GuiApplication(MyApp);
      /*cycle = +[](GuiApplication & app, bool idle)
      {
         eC_printLn(class_String, "   Cycling!", null);
         return true;
      };*/
   }

   REGISTER()
   {
      GuiApplication::class_registration(_cpp_class);
      /*
      register_cycle(_class, [](GuiApplication & app, bool idle) -> C(bool)
      {
         eC_printLn(class_String, "   Cycling!", null);
         return true;
      });
      */
   }

   void main()
   {
      eC_printLn(class_String, "C++: Hello, eC", null);
      GuiApplication::main();
   }

   bool init()
   {
      printLn("MyApp::init()");
      return true;
   }

   bool cycle(bool idle)
   {
      printLn("MyApp::cycle()");
      return true;
   }
};

MyApp app;
// Window w;
CLASS_DEF(MyApp);
MAIN_DEFINITION






