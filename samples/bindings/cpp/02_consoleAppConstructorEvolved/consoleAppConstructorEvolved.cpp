#define MODULE_NAME  "MyApp"
#define __CONSOLE_APP__ // For properly registering program arguments and setting guiApp for __ecere_COM_Initialize()
#define __LINK_ECERE__ 0

#include "eC.hpp"

// This sample demonstrates registering MyApp with eC's reflective object model,
// allowing to load C++ modules and instantiate C++ objects from an eC module.
class MyApp : public Application
{
public:
   APP_CONSTRUCT(MyApp, Application)
   {
      REGISTER_APP_CLASS(MyApp, Application, *this); // This handles registration and Application --> MyApp evolution

      // main can be defined with a lambda here since registration is complete with this approach (but not in sample 3 alternative)
      main = [](Application & app)
      {
         printLn("C++: Hello, eC");
      };
   }

   /*
   REGISTER()
   {
      // NOTE: REGISTER_APP_CLASS already took care of REG_Application()
      // Additional members could be registered here...
   }
   */
};

MyApp app;
CLASS_DEF(MyApp); // This is a definition only of MyApp's Class definition object (REGISTER_APP_CLASS handles its initialization)
MAIN_DEFINITION;  // This handles initialization and defining the application entry point in a cross-platform manner.
