#define MODULE_NAME  "MyApp"

#include "eC.hpp"

class MyApp;
extern MyApp app;

class MyApp : public Application
{
public:
   APP_CONSTRUCT(MyApp, Application) { }
   REGISTER()
   {
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
