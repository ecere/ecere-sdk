#define MODULE_NAME  "MyApp"

#include "ecere.hpp"

// Demonstrates overriding GuiApplication class, evolving instance from constructor
// Simpler alternative override of cycle() at instance level commented out
// Still using C++ style override of main() (Could also override just like cycle() in constructor)

class MyApp : public GuiApplication
{
public:
   APP_CONSTRUCT(MyApp, GuiApplication)
   {
      REGISTER_APP_CLASS(MyApp, GuiApplication, *this);
      /*cycle = +[](GuiApplication & app, bool idle)
      {
         printLn("   Cycling!");
         return true;
      };*/
   }

   REGISTER() { REG_GuiApplication(MyApp); }

   void main()
   {
      printLn("C++: Hello, eC");
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
// Window w;   // Uncomment to see cycle() being called infinitely
CLASS_DEF(MyApp);
MAIN_DEFINITION
