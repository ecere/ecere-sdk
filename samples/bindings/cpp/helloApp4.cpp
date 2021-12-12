#define MODULE_NAME  "MyApp"

#include "eC.hpp"

// Demonstrates overriding Application class, evolving instance from constructor

class MyApp : public Application
{
public:
   APP_CONSTRUCT(MyApp, Application)
   {
      REGISTER_APP_CLASS(MyApp, Application, *this);

      main = [](Application & app)
      {
         eC_printLn(class_String, "C++: Hello, eC", null);
      };
   }
};

MyApp app;
CLASS_DEF(MyApp);
MAIN_DEFINITION;
