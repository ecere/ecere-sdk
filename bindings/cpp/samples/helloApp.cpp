#define MODULE_NAME  "MyApp"

#include "eC.hpp"

// Demonstrates overriding Application class, evolving instance from REGISTER()

class MyApp;
extern MyApp app;

class MyApp : public Application
{
public:
   APP_CONSTRUCT(MyApp, Application) { }
   REGISTER()
   {
      Application::class_registration(_class);
      register_main(_class, [](Application & app)
      {
         PrintLn(class_String, "C++: Hello, eC", null);
      });
      EVOLVE_APP(MyApp, app);
   }
};

MyApp app;

REGISTER_CLASS_DEF(MyApp, Application, app);

MAIN_DEFINITION;
