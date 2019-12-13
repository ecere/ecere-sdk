#define MODULE_NAME  "HelloForm"
// #define __CONSOLE_APP__

#include "ecere.hpp"

#define USE_MACROS

#if defined(USE_MACROS)

class HelloForm : public Window
{
public:
   Label label;

   CONSTRUCT(HelloForm, Window)
   {
      caption = $("My First Ecere/C++ Bindings App");
      borderStyle = BorderStyle_sizable;
      size = { 380, 190 };
      hasClose = true;

      label.parent = this;
      label.caption = $("Hello, Bindings!!");
      label.position = { 10, 10 };
      label.font = { "Arial", 30 };

      //char tmp[256];
      //String s = Instance_onGetString(0, font, tmp, null, null);
      //PrintLn(class_String, s, null);  // Need to terminate with a null!
   }
};

GuiApplication app;

REGISTER_CLASS_DEF(HelloForm, Window, app);

HelloForm hello;

MAIN_DEFINITION;

#else

class HelloForm : public Window
{
public:
   Label label;

   // expansion of
   // CONSTRUCT(HelloForm, Window)
   HelloForm() : HelloForm((C(Instance))Instance_newEx(_class.impl, false), _class) { } \
   INSTANCE_VIRTUAL_METHODS_PROTO(HelloForm) \
   static TCPPClass<HelloForm> _class; \
   static C(bool) constructor(C(Instance) i, C(bool) alloc) { return (alloc && !_INSTANCE(i, _class.impl)) ? new HelloForm(i, _class) != null : true; } \
   static void destructor(C(Instance) i) { HelloForm * inst = (HelloForm *)_INSTANCE(i, _class.impl); if(_class.destructor) ((void (*)(HelloForm & self))_class.destructor)(*inst); delete inst; } \
   explicit inline HelloForm(C(Instance) _impl, CPPClass & cl = _class) : Window(_impl, cl)
   {
      caption = $("My First Ecere/C++ Bindings App");
      borderStyle = BorderStyle_sizable;
      size = { 380, 190 };
      hasClose = true;

      label.parent = this;
      label.caption = $("Hello, Bindings!!");
      label.position = { 10, 10 };
      label.font = { "Arial", 30 };

// thisfile.cpp:65:18: error: no match for 'operator=' in '((HelloForm*)this)->HelloForm::label.Label::<anonymous>.CommonControl::<anonymous>.Window::font = {"Arial", 30}' (operand types are 'Window::fontProp' and '<brace-enclosed initializer list>')

      //char tmp[256];
      //String s = Instance_onGetString(0, font, tmp, null, null);
      //PrintLn(class_String, s, null);  // Need to terminate with a null!
   }
};

GuiApplication app; // should this be calling eC_init_CALL()?
                    // we're missing the following provided by APP_CONSTRUCT(MyApp, Application) in previous samples
                    // inline MyApp() : MyApp(eC_init_CALL(__LINK_ECERE__)) { }


// expansion of
// REGISTER_CLASS_DEF(HelloForm, Window, app);
// issue here: REGISTER_CLASS_DEF uses _REGISTER_CLASS which makes use of Window::_class.impl->name before Window::_class.setup
//             aka before ecere_cpp_init() is called
TCPPClass<HelloForm> HelloForm::_class(
   (Class *)eC_registerClass(
         ClassType_normalClass,
         "HelloForm", "Window", // issue work around Window::_class.impl->name,
         sizeof(Instance *), 0,
         (C(bool) (*)(void *)) HelloForm::constructor,
         (void(*)(void *)) HelloForm::destructor,
         (app).impl, // issue here app.impl is null, once again, ecere_cpp_init not called before?
         AccessMode_privateAccess, AccessMode_publicAccess)
);

HelloForm hello;

// expansion of
// MAIN_DEFINITION;
extern "C" int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInst, char * cmdLine, int show)
{
#define APP_CONSTRUCT(c, b) \
   inline c() : c(eC_init_CALL(__LINK_ECERE__)) { } \
   _CONSTRUCT(c, b)

   APP_SET_ARGS(app);
   app.main();
   unloadTranslatedStrings(MODULE_NAME);
   return app.exitCode;
}

#endif // defined(USE_MACROS)
