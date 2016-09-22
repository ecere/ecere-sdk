#define MODULE_NAME  "MyApp"

#include "eC.hpp"

class MyApp : public Application
{
public:
   APP_CONSTRUCT(MyApp, Application) { }
   static void class_registration(CPPClass & _class);
};

MyApp app;

void MyApp::class_registration(CPPClass & _class)
{
   register_main(_class, [](Application & app)
   {
      PrintLn(class_String, "C++: Hello, eC", null);
   });
   Instance_evolve(&app.impl, MyApp::_class.impl);
   _INSTANCE(app.impl, app.impl->_class) = &app;
   __thisModule = app.impl;
   app.vTbl = _class.vTbl;
}

REGISTER_CLASS_DEF(MyApp, Application, app);

MAIN_DEFINITION;
