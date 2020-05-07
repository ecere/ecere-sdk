#define MODULE_NAME  "MyApp"
#define __CONSOLE_APP__ // affects MAIN_DECLARATION and eC_init_CALL definition -- anything else?
#define __LINK_ECERE__ 0

#include "eC.hpp"
// #include "ecere.hpp"

// Demonstrates overriding Application class, evolving instance from REGISTER()

#define USE_MACROS

#if defined(USE_MACROS)

class MyApp;
extern MyApp app;

class MyApp : public Application
{
public:
   APP_CONSTRUCT(MyApp, Application) { }

   void main()
   {
      // breakpoint on first line - and when not much else is in main() - with printLn or printLn2 won't work
      // printLn(class_String, "C++: Hello, eC", null); // just this line won't break
      // printLn2("C++: Hello, eC"); // just this line won't break
      // printLn2("C++: Hello, eC", 1); // this will break
      printf("why\n"); // adding this before will allow the breakpoint on printLn or printLn2 to work
      printLn2("C++: Hello, eC");

      // printf("why this is so messed up\n");
      // printf("\n");
      // printLn(class_String, "C++: Hello, eC", null);
      // printLn(class_String, "C++: Hello, eC", null);

      // printLn(class_String, "wth", null);
      // printf("why\n");
      // printLn2("C++: Hello, eC", 5, 4.3, '2');
      // printf("%d\n", 5);
   }

   REGISTER()
   {
      REG_Application(MyApp);
      /*
      Application::class_registration(_class);
      register_main(_class,
         [](Application & app)
         {
            printLn(class_String, "C++: Hello, eC", null);
         }
      );
      */
      EVOLVE_APP(MyApp, app);
   }
};

MyApp app;

REGISTER_CLASS_DEF(MyApp, Application, app);

MAIN_DEFINITION;

#else

class MyApp;
extern MyApp app;

class MyApp : public Application
{
public:
//   APP_CONSTRUCT(MyApp, Application) { }
   inline MyApp() : MyApp(eC_init_CALL(__LINK_ECERE__)) { }

   struct Instance_onCompare_Functor
   {
      int _[0];
      typedef int (* FunctionType)(Instance & _ARG Instance & object);
      inline FunctionType operator= (FunctionType func);
      inline int operator()( Instance & object);
   } onCompare;
   inline void register_onCompare(CPPClass & cl, Instance::Instance_onCompare_Functor::FunctionType func);

   struct Instance_onCopy_Functor
   {
      int _[0];
      typedef void (* FunctionType)(Instance & _ARG Instance & newData);
      inline FunctionType operator= (FunctionType func);
      inline void operator()( Instance & newData);
   } onCopy;
   inline void register_onCopy(CPPClass & cl, Instance::Instance_onCopy_Functor::FunctionType func);

   struct Instance_onDisplay_Functor
   {
      int _[0];
      typedef void (* FunctionType)(Instance & _ARG Instance /*Surface*/ & surface _ARG int x _ARG int y _ARG int width _ARG void * fieldData _ARG C(Alignment) alignment _ARG C(DataDisplayFlags) displayFlags);
      inline FunctionType operator= (FunctionType func);
      inline void operator()( Instance /*Surface*/ & surface _ARG int x _ARG int y _ARG int width _ARG void * fieldData _ARG C(Alignment) alignment _ARG C(DataDisplayFlags) displayFlags);
   } onDisplay;
   inline void register_onDisplay(CPPClass & cl, Instance::Instance_onDisplay_Functor::FunctionType func);

   struct Instance_onEdit_Functor
   {
      int _[0];
      typedef Instance & (* FunctionType)(Instance & _ARG Instance /*DataBox*/ & dataBox _ARG Instance /*DataBox*/ & obsolete _ARG int x _ARG int y _ARG int w _ARG int h _ARG void * userData);
      inline FunctionType operator= (FunctionType func);
      inline Instance & operator()( Instance /*DataBox*/ & dataBox _ARG Instance /*DataBox*/ & obsolete _ARG int x _ARG int y _ARG int w _ARG int h _ARG void * userData);
   } onEdit;
   inline void register_onEdit(CPPClass & cl, Instance::Instance_onEdit_Functor::FunctionType func);

   struct Instance_onFree_Functor
   {
      int _[0];
      typedef void (* FunctionType)(Instance & );
      inline FunctionType operator= (FunctionType func);
      inline void operator()( );
   } onFree;
   inline void register_onFree(CPPClass & cl, Instance::Instance_onFree_Functor::FunctionType func);

   struct Instance_onGetDataFromString_Functor
   {
      int _[0];
      typedef bool (* FunctionType)(Instance & _ARG const char * string);
      inline FunctionType operator= (FunctionType func);
      inline bool operator()( const char * string);
   } onGetDataFromString;
   inline void register_onGetDataFromString(CPPClass & cl, Instance::Instance_onGetDataFromString_Functor::FunctionType func);

   struct Instance_onGetString_Functor
   {
      int _[0];
      typedef const char * (* FunctionType)(Instance & _ARG char * tempString _ARG void * reserved _ARG C(ObjectNotationType) * onType);
      inline FunctionType operator= (FunctionType func);
      inline const char * operator()( char * tempString _ARG void * reserved _ARG C(ObjectNotationType) * onType);
   } onGetString;
   inline void register_onGetString(CPPClass & cl, Instance::Instance_onGetString_Functor::FunctionType func);

   struct Instance_onSaveEdit_Functor
   {
      int _[0];
      typedef bool (* FunctionType)(Instance & _ARG Instance /*Window*/ & window _ARG void * object);
      inline FunctionType operator= (FunctionType func);
      inline bool operator()( Instance /*Window*/ & window _ARG void * object);
   } onSaveEdit;
   inline void register_onSaveEdit(CPPClass & cl, Instance::Instance_onSaveEdit_Functor::FunctionType func);

   struct Instance_onSerialize_Functor
   {
      int _[0];
      typedef void (* FunctionType)(Instance & _ARG Instance /*IOChannel*/ & channel);
      inline FunctionType operator= (FunctionType func);
      inline void operator()( Instance /*IOChannel*/ & channel);
   } onSerialize;
   inline void register_onSerialize(CPPClass & cl, Instance::Instance_onSerialize_Functor::FunctionType func);

   struct Instance_onUnserialize_Functor
   {
      int _[0];
      typedef void (* FunctionType)(Instance & _ARG Instance /*IOChannel*/ & channel);
      inline FunctionType operator= (FunctionType func);
      inline void operator()( Instance /*IOChannel*/ & channel);
   } onUnserialize;
   inline void register_onUnserialize(CPPClass & cl, Instance::Instance_onUnserialize_Functor::FunctionType func);

   static TCPPClass<MyApp> _class;
   static C(bool) constructor(C(Instance) i, C(bool) alloc) { return (alloc && !_INSTANCE(i, _class.impl)) ? new MyApp(i, _class) != null : true; } \
   static void destructor(C(Instance) i) { MyApp * inst = (MyApp *)_INSTANCE(i, _class.impl); if(_class.destructor) ((void (*)(MyApp & self))_class.destructor)(*inst); delete inst; } \
   explicit inline MyApp(C(Instance) _impl, CPPClass & cl = _class) : Application(_impl, cl)
   {
   }

   static void class_registration(CPPClass & _class)
   {
      Application::class_registration(_class);
      register_main(_class,
         [](Application & app)
         {
            printLn(class_String, "C++: Hello, eC", null);
         }
      );
      Instance_evolve(&(app).impl, MyApp::_class.impl);
      _INSTANCE((app).impl, (app).impl->_class) = &(app);
      __thisModule = (app).impl;
      (app).vTbl = _class.vTbl;
   }
};

MyApp app;

TCPPClass<MyApp> MyApp::_class(
   (Class *)eC_registerClass(ClassType_normalClass, "MyApp", Application::_class.impl->name, sizeof(Instance *), 0,
         (C(bool) (*)(void *)) MyApp::constructor, (void(*)(void *)) MyApp::destructor, (app).impl,
         AccessMode_privateAccess, AccessMode_publicAccess)
);

#if defined(__WIN32__) && !defined(__CONSOLE_APP__)
#else
extern "C" int main(int argc, char * argv[])
{
   APP_SET_ARGS(app);
   app.main();
   unloadTranslatedStrings(MODULE_NAME);
   return app.exitCode;
}
#endif

#endif // defined(USE_MACROS)
