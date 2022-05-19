#define MODULE_NAME  "MyApp"
#define __CONSOLE_APP__ // For properly registering program arguments and setting guiApp for __ecere_COM_Initialize()
#define __LINK_ECERE__ 0

#include "eC.hpp"

// This simpler sample does not bother registering the MyApp class with eC's reflective object model
class MyApp : public Application
{
public:
   void main()
   {
      printLn("C++: Hello, eC");
   }
};

MyApp app;

MAIN_DEFINITION // This handles initialization and defining the application entry point in a cross-platform manner.
