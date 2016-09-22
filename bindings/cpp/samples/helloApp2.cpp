#define MODULE_NAME  "MyApp"

#include "eC.hpp"

// Demonstrates 'main()' C++ style override (MyApp is not registered with eC COM)

class MyApp : public Application
{
public:
   void main()
   {
      PrintLn(class_String, "C++: Hello, eC", null);
   }
};

MyApp app;

MAIN_DEFINITION
