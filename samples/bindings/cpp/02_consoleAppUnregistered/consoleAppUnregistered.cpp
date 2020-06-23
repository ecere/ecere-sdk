#define MODULE_NAME  "MyApp"
#define __LINK_ECERE__ 0

#include "eC.hpp"

// Demonstrates 'main()' C++ style override (MyApp is not registered with eC COM)

class MyApp : public Application
{
public:
   void main()
   {
      // eC_printLn(class_String, "C++: Hello, eC", null);
      printLn("C++: Hello, eC");
   }
};

MyApp app;

MAIN_DEFINITION
