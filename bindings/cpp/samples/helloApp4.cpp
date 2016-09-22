#define MODULE_NAME  "MyApp"

#include "eC.hpp"

class MyApp : public Application
{
public:
   APP_CONSTRUCT(MyApp, Application)
   {
      REGISTER_APP_CLASS(MyApp, Application, *this);

      main = [](Application & app)
      {
         PrintLn(class_String, "C++: Hello, eC", null);
      };
   }
};

MyApp app;
CLASS_DEF(MyApp);
MAIN_DEFINITION;
