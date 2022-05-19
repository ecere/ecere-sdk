#define MODULE_NAME  "MyApp"
#define __CONSOLE_APP__ // For properly registering program arguments and setting guiApp for __ecere_COM_Initialize()
#define __LINK_ECERE__ 0

#include "eC.hpp"

// This sample demonstrates an alternative approach to registering MyApp
// with eC's reflective object model, without using the Application class-specific
// REGISTER_APP_CLASS macro, similar to how any other class would be registered.
class MyApp;
extern MyApp app;

class MyApp : public Application
{
public:
   APP_CONSTRUCT(MyApp, Application) { }

   void main()
   {
      printLn("C++: Hello, eC");
      printLn(5, ", ", 4.3, ", ", '2');
   }

   REGISTER()
   {
      REG_Application(MyApp); // Not really essential, since Application has no useful virtual method other than main that does not need this.
      // Additional registration could happen here...

      // Evolving global Application instance into MyApp here
      EVOLVE_APP(MyApp, app);
   }
};

// Assigning a lambda to main() in the constructor does not work with this approach,
// because registration has not yet happened: the MyApp instance must come before
// the REGISTER_CLASS_DEF in this approach.

MyApp app;
REGISTER_CLASS_DEF(MyApp, Application, app); // This is the declaration, definition of MyApp's Class definition object and invokes registration
MAIN_DEFINITION; // This handles initialization and defining the application entry point in a cross-platform manner.
