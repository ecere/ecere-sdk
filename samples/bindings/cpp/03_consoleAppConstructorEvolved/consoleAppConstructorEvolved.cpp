#define MODULE_NAME  "MyApp"
#define __LINK_ECERE__ 0

#include "eC.hpp"

// Demonstrates overriding Application class, evolving instance from constructor

#define USE_MACROS

#if defined(USE_MACROS)

class MyApp : public Application
{
public:

#if 1 // both work
   void main()
   {
      printLn(class_String, "C++: Hello, eC", null);
   }
#endif

   APP_CONSTRUCT(MyApp, Application)
   {
      REGISTER_APP_CLASS(MyApp, Application, *this);

#if 0 // both work
      main = [](Application & app)
      {
         printLn(class_String, "C++: Hello, eC", null);
      };
#endif
   }
};

#else

class MyApp : public Application
{
public:
   // expansion of
   // APP_CONSTRUCT(MyApp, Application)
   inline MyApp() : MyApp(eC_init_CALL(__LINK_ECERE__)) { }
   INSTANCE_VIRTUAL_METHODS_PROTO(MyApp)
   static TCPPClass<MyApp> _class;
   static C(bool) constructor(C(Instance) i, C(bool) alloc) { return (alloc && !_INSTANCE(i, _class.impl)) ? new MyApp(i, _class) != null : true; }
   static void destructor(C(Instance) i) { MyApp * inst = (MyApp *)_INSTANCE(i, _class.impl); if(_class.destructor) ((void (*)(MyApp & self))_class.destructor)(*inst); delete inst; }
   explicit inline MyApp(C(Instance) _impl, CPPClass & cl = _class) : Application(_impl, cl)
   {
      REGISTER_APP_CLASS(MyApp, Application, *this);

      main = [](Application & app)
      {
         printLn(class_String, "C++: Hello, eC", null);
      };
   }
};

#endif // defined(USE_MACROS)

MyApp app;
CLASS_DEF(MyApp);
MAIN_DEFINITION;
