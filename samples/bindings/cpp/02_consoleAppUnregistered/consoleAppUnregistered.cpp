#define MODULE_NAME  "MyApp"
#define __LINK_ECERE__ 0

#include "eC.hpp"

// Demonstrates 'main()' C++ style override (MyApp is not registered with eC COM)

class MyApp : public Application
{
public:
   void main()
   {
      printLn(class_String, "C++: Hello, eC", null);
   }
};

MyApp app;

MAIN_DEFINITION
