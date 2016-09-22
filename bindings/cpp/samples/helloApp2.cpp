#define MODULE_NAME  "MyApp"

#include "eC.hpp"

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
