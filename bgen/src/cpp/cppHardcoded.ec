#include "bgen.eh"

import "genCPP"

define cpptemplatePrefix = "T";
define cpptemplateArgClass = "TC";
define cpptemplateArgClassObject = "TCO";
define cpptemplateCPPClassDef = "template <class TC>";
define cpptemplateNoHeadDef = "template <class TC, C(Class) ** TCO>";
define cpptemplateNoHeadParams = "<TC, TCO>";

void cppHardcodedInstancePart1(BOutput o)
{
   o.z.concatx(genloc__, "   // hardcoded content start", ln,
               genloc__, "   static TCPPClass<Instance> _class;", ln,
               genloc__, "   C(Instance) impl;", ln,
               genloc__, "   void (**vTbl)(void);", ln, ln);

   o.z.concatx(genloc__, "   void * operator new   (uintsize count) { return eC_new(count); }", ln,
               genloc__, "   void * operator new [](uintsize count) { return eC_new(count); }", ln,
               genloc__, "   void operator delete   (void * ptr) { eC_delete(ptr); }", ln,
               genloc__, "   void operator delete [](void * ptr) { eC_delete(ptr); }", ln, ln);

   o.z.concatx(genloc__, "   static C(bool) constructor(C(Instance) i, C(bool) alloc)", ln,
               genloc__, "   {", ln,
               genloc__, "      if(alloc && !INSTANCEL(i, _class.impl))", ln,
               genloc__, "         return new Instance(i, _class) != null;", ln);
   o.z.concatx(genloc__, "      return true;", ln,
               genloc__, "   }", ln,
               genloc__, "   static void destructor(C(Instance) i) { Instance * inst = (Instance *)INSTANCEL(i, _class.impl); delete inst; }", ln,
               genloc__, "   static void class_registration(CPPClass & _class);", ln, ln);
}

void cppHardcodedInstancePart2(BOutput o)
{
   o.z.concatx(genloc__, "   inline explicit Instance(C(Instance) _impl, CPPClass & cl = _class)", ln,
               genloc__, "   {", ln,
               genloc__, "      XClass * c = cl.impl;", ln,
               genloc__, "      impl = _impl;", ln,
               genloc__, "      vTbl = cl.vTbl;", ln);
   o.z.concatx(genloc__, "      if(impl)", ln,
               genloc__, "      {", ln,
               genloc__, "         if(c && !INSTANCEL(impl, c))", ln,
               genloc__, "            INSTANCEL(impl, c) = this;", ln,
               genloc__, "         impl->_refCount++;", ln,
               genloc__, "      }", ln,
               genloc__, "   }", ln);
   o.z.concatx(genloc__, "   inline Instance()", ln,
               genloc__, "   {", ln,
               genloc__, "      impl = null;", ln,
               genloc__, "      vTbl = null;", ln,
               genloc__, "   }", ln);
   o.z.concatx(genloc__, "   inline ~Instance()", ln,
               genloc__, "   {", ln,
               genloc__, "      if(impl && impl->_class)", ln,
               genloc__, "      {", ln);
   o.z.concatx(genloc__, "         if(impl->_class->bindingsClass)", ln,
               genloc__, "         {", ln,
               genloc__, "            Instance ** i = (Instance **)&INSTANCEL(impl, impl->_class);", ln,
               genloc__, "            if(i && *i == this)", ln,
               genloc__, "               *i = null;", ln);
   o.z.concatx(genloc__, "            if(vTbl)", ln,
               genloc__, "            {", ln,
               genloc__, "               CPPClass * cl = (CPPClass *)impl->_class->bindingsClass;", ln,
               genloc__, "               if(cl && vTbl != cl->vTbl)", ln);
   o.z.concatx(genloc__, "                  eC_delete(vTbl);", ln,
               genloc__, "            }", ln,
               genloc__, "         }", ln,
               genloc__, "         Instance_decRef(impl);", ln,
               genloc__, "      }", ln,
               genloc__, "   }", ln);
   o.z.concatx(genloc__, "   Instance(const Instance & i) = delete;", ln,
               genloc__, "   Instance operator= (const Instance & i) = delete;", ln, ln,
               genloc__, "   inline Instance(Instance && i)", ln);
   o.z.concatx(genloc__, "   {", ln,
               genloc__, "      impl = i.impl;", ln,
               genloc__, "      vTbl = i.vTbl;", ln,
               genloc__, "      i.impl = null;", ln,
               genloc__, "      i.vTbl = null;", ln,
               genloc__, "   }", ln, ln);
   o.z.concatx(genloc__, "   inline Instance & operator= (Instance && i)", ln,
               genloc__, "   {", ln,
               genloc__, "      impl = i.impl;", ln,
               genloc__, "      vTbl = i.vTbl;", ln,
               genloc__, "      i.impl = null;", ln,
               genloc__, "      i.vTbl = null;", ln,
               genloc__, "      return *this;", ln,
               genloc__, "   }", ln,
               genloc__, "   // end of hardcoded content", ln);
}

void cppTmpDefineVirtualMethod      (CPPGen g, File f, bool prototype)
{
   ZString z { allocType = heap };
   cppMacroVirtualMethod(g, z, definition, prototype, 0, "n", "ncpp", "c", "b", "r", "p0", "ep", "p", "d", 0);
   f.Puts(z._string);
   delete z;
   f.Print(ln);
}
void cppTmpDefineIntRegisterMethod  (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroIntRegisterMethod  (g, z, 0, 0); f.Puts(z._string); delete z; }
void cppTmpDefineRegisterMethod     (CPPGen g, File f)
{
   ZString z { allocType = heap };
   cppMacroRegisterMethod(g, z, definition, 0, "ns", "n", "bc", "c", "r", "p", "ocl", "oi", "code", "ea", "rv", 0);
   f.Puts(z._string);
   delete z;
   f.Print(ln);
}
void cppTmpDefineRegisterTypedMethod(CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroRegisterTypedMethod(g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineIntRegisterClass   (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroIntRegisterClass   (g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineRegisterClassDef   (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroRegisterClassDef   (g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineClassDef           (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroClassDef           (g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineRegisterClass      (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroRegisterClass      (g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineRegisterClassCPP   (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroRegisterClassCPP   (g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineIntConstructClass  (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroIntConstructClass  (g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineConstructClass     (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroConstructClass     (g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineDestructClass      (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroDestructClass      (g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineClassRegistration  (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroClassRegister      (g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineProperty           (CPPGen g, File f, bool protoOrImpl) { ZString z { allocType = heap }; cppDefineMacroProperty   (g, z, 0, protoOrImpl, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineIntPropSet         (CPPGen g, File f, bool protoOrImpl, bool template) { ZString z { allocType = heap }; cppDefineMacroIntPropSet (g, z, 0, protoOrImpl, template, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefinePropSet            (CPPGen g, File f, bool protoOrImpl, bool template) { ZString z { allocType = heap }; cppDefineMacroPropSet    (g, z, 0, protoOrImpl, template, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefinePropGet            (CPPGen g, File f, bool protoOrImpl, bool template) { ZString z { allocType = heap }; cppDefineMacroPropGet    (g, z, 0, protoOrImpl, template, 0); f.Puts(z._string); delete z; f.Print(ln); }

void printZedStringToFile(File f, ZString z)
{
   f.Puts(z._string);
   z.copy("");
}

void cppHardcodedCore(CPPGen g, File f)
{
   ZString z { allocType = heap };

   f.PrintLn(genloc__, "// Syntactic Sugar (NOT GENERATED)", ln);
   f.PrintLn(genloc__, "// INSTANCEL, INSTANCE: get the C++ instance out of supplied eC instance");
   f.PrintLn(genloc__, "//            x: pointer to eC instance");
   f.PrintLn(genloc__, "//            c: eC 'Class' object representing the C++ class");
   f.PrintLn(genloc__, "#define INSTANCEL(x, c) (*(void **)((char *)(x) + (c)->offset))   // For when an l-value is needed");
   f.PrintLn(genloc__, "#define INSTANCE(x, c)  ((x) ? INSTANCEL(x, c) : 0)               // Regular one that can return null", ln);

   f.PrintLn(genloc__, "#define BINDINGS_CLASS(eo) (eo && eo->_class && eo->_class->bindingsClass)", ln);

   f.PrintLn(genloc__, "#undef   newi");
   f.PrintLn(genloc__, "#define  newi(c) Instance_newEx(c, true)", ln);

   cppTmpDefineIntRegisterClass(g, f);
   cppTmpDefineRegisterClassDef(g, f);
   cppTmpDefineClassDef(g, f);
   cppTmpDefineRegisterClass(g, f);
   cppTmpDefineRegisterClassCPP(g, f);

   f.PrintLn(genloc__, "#define EVOLVE_APP(ac, a) \\");
   f.PrintLn(genloc__, "   Instance_evolve(&(a).impl, ac::_class.impl); \\");
   f.PrintLn(genloc__, "   INSTANCEL((a).impl, (a).impl->_class) = &(a); \\");
   f.PrintLn(genloc__, "   __thisModule = (a).impl; \\");
   f.PrintLn(genloc__, "   (a).vTbl = _class.vTbl;", ln);

   f.PrintLn(genloc__, "#define REGISTER_APP_CLASS(ac, b, a) \\");
   f.PrintLn(genloc__, "   REGISTER_CLASS(ac, b, a); \\");
   f.PrintLn(genloc__, "   EVOLVE_APP(ac, a)", ln);

   cppTmpDefineIntConstructClass(g, f);
   cppTmpDefineConstructClass(g, f);
   cppTmpDefineDestructClass(g, f);
   cppTmpDefineClassRegistration(g, f);

   f.PrintLn(genloc__, "#if !defined(__LINK_ECERE__)");
   f.PrintLn(genloc__, "#define __LINK_ECERE__ 1");
   f.PrintLn(genloc__, "#endif", ln);

   f.PrintLn(genloc__, "#define APP_CONSTRUCT(c, b) \\");
   f.PrintLn(genloc__, "   inline c() : c(eC_init_CALL(__LINK_ECERE__)) { } \\");
   f.PrintLn(genloc__, "   _CONSTRUCT(c, b)", ln);

   f.PrintLn(genloc__, "#if !defined(__WIN32__) || defined(__CONSOLE_APP__)");
   f.PrintLn(genloc__, "   #define APP_SET_ARGS(a) eC_setArgs(a.impl, argc, argv);");
   f.PrintLn(genloc__, "#else");
   f.PrintLn(genloc__, "   #define APP_SET_ARGS(a)");
   f.PrintLn(genloc__, "#endif", ln);

   f.PrintLn(genloc__, "#define MAIN_DEFINITION \\");
   f.PrintLn(genloc__, "   extern \"C\" MAIN_DECLARATION \\");
   f.PrintLn(genloc__, "   { \\");
   f.PrintLn(genloc__, "      APP_SET_ARGS(app); \\");
   f.PrintLn(genloc__, "      app.main(); \\");
   f.PrintLn(genloc__, "      unloadTranslatedStrings(MODULE_NAME); \\");
   f.PrintLn(genloc__, "      return app.exitCode; \\");
   f.PrintLn(genloc__, "   }", ln);

   f.PrintLn(genloc__, "// SELF: get C++ class instance pointer from within hackish member of the class");
   f.PrintLn(genloc__, "#define CONTAINER_OF(ptr, type, member) ((type *)(((char *)ptr) + 0x10 - (char *)&((type *)0x10)->member))");
   f.PrintLn(genloc__, "#define SELF(c, member)  __attribute__((unused)) c * self = CONTAINER_OF(this, c, member);");

   f.PrintLn(genloc__, "#define getimpli(i)  ((Instance)i).impl", ln);

   cppTmpDefineVirtualMethod(g, f, true);
   cppTmpDefineVirtualMethod(g, f, false);
   cppTmpDefineIntRegisterMethod(g, f);
   cppTmpDefineRegisterMethod(g, f);
   cppTmpDefineRegisterTypedMethod(g, f);

   f.PrintLn(genloc__, "template<typename T, typename U> struct is_same       { static const bool value = false; };");
   f.PrintLn(genloc__, "template<typename T>             struct is_same<T, T> { static const bool value = true; };");
   f.PrintLn(genloc__, "template<typename T, typename U> bool eqTypes()       { return is_same<T, U>::value; }", ln);

   f.PrintLn(genloc__, "#define REGVMETHOD(b, n, m, p, t, a) \\");
   f.PrintLn(genloc__, "    if(!eqTypes<decltype(&m), decltype(&b::n)>()) \\");
   f.PrintLn(genloc__, "       ((b::b ## _ ## n ## _Functor::FunctionType *)_class.vTbl)[M_VTBLID(b, n)] = +[]p { return ((t &)self).m a; };", ln);

   cppTmpDefineProperty(g, f, true);
   cppTmpDefineIntPropSet(g, f, true, false);
   cppTmpDefinePropSet(g, f, true, false);
   cppTmpDefinePropGet(g, f, true, false);
   cppTmpDefineProperty(g, f, false);
   cppTmpDefineIntPropSet(g, f, false, false);
   cppTmpDefineIntPropSet(g, f, false, true);
   cppTmpDefinePropSet(g, f, false, false);
   cppTmpDefinePropSet(g, f, false, true);
   cppTmpDefinePropGet(g, f, false, false);
   cppTmpDefinePropGet(g, f, false, true);

   f.PrintLn(genloc__, "extern \"C\" ", g_.sym.module, " ecere_init(", g_.sym.module, " fromModule);", ln);

   f.PrintLn(genloc__, "class XClass : public ", g_.sym.__class, " { };", ln);

   f.PrintLn(genloc__, "class CPPClass");
   f.PrintLn(genloc__, "{");
   f.PrintLn(genloc__, "public:");
   f.PrintLn(genloc__, "   typedef void (* Function)(void);");
   f.PrintLn(genloc__, "   XClass * impl;");
   f.PrintLn(genloc__, "   Function * vTbl;");
   f.PrintLn(genloc__, "   inline CPPClass() { };");
   f.PrintLn(genloc__, "   inline CPPClass(const CPPClass & c) = delete;");
   f.PrintLn(genloc__, "   inline CPPClass(const CPPClass && c)");
   f.PrintLn(genloc__, "   {");
   f.PrintLn(genloc__, "      impl = c.impl;");
   f.PrintLn(genloc__, "      vTbl = c.vTbl;");
   f.PrintLn(genloc__, "   }");
   f.PrintLn(genloc__, "};", ln);

   f.PrintLn(genloc__, cpptemplateCPPClassDef);
   f.PrintLn(genloc__, "class TCPPClass : public CPPClass");
   f.PrintLn(genloc__, "{");
   f.PrintLn(genloc__, "public:");
   f.PrintLn(genloc__, "   TCPPClass() { }");
   f.PrintLn(genloc__, "   TCPPClass(XClass * _impl)");
   f.PrintLn(genloc__, "   {");
   f.PrintLn(genloc__, "      setup(_impl);");
   f.PrintLn(genloc__, "   }");
   f.PrintLn(genloc__, "   void (*destructor)(TC &);");
   f.PrintLn(genloc__, "   void setup(XClass * _impl)");
   f.PrintLn(genloc__, "   {");
   f.PrintLn(genloc__, "      impl = _impl;");
   f.PrintLn(genloc__, "      if(impl)");
   f.PrintLn(genloc__, "      {");
   f.PrintLn(genloc__, "         _impl->bindingsClass = this;");
   f.PrintLn(genloc__, "         if(vTbl)");
   f.PrintLn(genloc__, "            eC_delete(vTbl);");
   f.PrintLn(genloc__, "         vTbl = newt(Function, impl->vTblSize);");
   f.PrintLn(genloc__, "         memset(vTbl, 0, sizeof(Function) * impl->vTblSize);");
   f.PrintLn(genloc__, "         printf(\"setting up %s\\n\", impl->name);"); // todo: remove debug printing?
   f.PrintLn(genloc__, "         TC::class_registration(*this);");
   f.PrintLn(genloc__, "      }");
   f.PrintLn(genloc__, "   }");
   f.PrintLn(genloc__, "   ~TCPPClass()");
   f.PrintLn(genloc__, "   {");
   f.PrintLn(genloc__, "      if(impl)");
   f.PrintLn(genloc__, "         eC_delete(vTbl);");
   f.PrintLn(genloc__, "   }");
   f.PrintLn(genloc__, "};", ln);

   f.PrintLn(genloc__, cpptemplateNoHeadDef);
   f.PrintLn(genloc__, "class TNHInstance");
   f.PrintLn(genloc__, "{");
   f.PrintLn(genloc__, "public:");
   f.PrintLn(genloc__, "   TC * impl;");
   f.PrintLn(genloc__, "   TNHInstance() { impl = (TC*)Instance_new(*TCO); }");
   f.PrintLn(genloc__, "   TNHInstance(TC * _impl) { impl = _impl; }");
   f.PrintLn(genloc__, "};", ln);

   // TIH: Template Instance Holder
   f.PrintLn(genloc__, cpptemplateCPPClassDef);
   f.PrintLn(genloc__, "class TIH");
   f.PrintLn(genloc__, "{");
   f.PrintLn(genloc__, "public:");
   f.PrintLn(genloc__, "   TC * object;", ln);

   f.PrintLn(genloc__, "   TIH(C(Instance) eo) : TIH(*(BINDINGS_CLASS(eo) ? (TC *)INSTANCE(eo, eo->_class) : new TC(eo))) { }");
   f.PrintLn(genloc__, "   TIH(TC & o) : object(&o)");
   f.PrintLn(genloc__, "   {");
   f.PrintLn(genloc__, "      if(o.impl)");
   f.PrintLn(genloc__, "         o.impl->_refCount++;");
   f.PrintLn(genloc__, "   }", ln);

   f.PrintLn(genloc__, "   TIH(const TIH & h) : object(h.object)");
   f.PrintLn(genloc__, "   {");
   f.PrintLn(genloc__, "      if(object && object->impl)");
   f.PrintLn(genloc__, "         object->impl->_refCount++;");
   f.PrintLn(genloc__, "   }", ln);

   f.PrintLn(genloc__, "   TIH & operator= (const TIH & h)");
   f.PrintLn(genloc__, "   {");
   f.PrintLn(genloc__, "      if(object && object->impl)");
   f.PrintLn(genloc__, "         deletei(object->impl);", ln);

   f.PrintLn(genloc__, "      object = h.object;");
   f.PrintLn(genloc__, "      if(object && object->impl)");
   f.PrintLn(genloc__, "         object->impl->_refCount++;");
   f.PrintLn(genloc__, "      return *this;");
   f.PrintLn(genloc__, "   }", ln);

   f.PrintLn(genloc__, "   ~TIH()");
   f.PrintLn(genloc__, "   {");
   f.PrintLn(genloc__, "      if(object && object->impl)");
   f.PrintLn(genloc__, "         deletei(object->impl);");
   f.PrintLn(genloc__, "   }", ln);

   f.PrintLn(genloc__, "   TC& operator*() const { return *object; }");
   f.PrintLn(genloc__, "   TC* operator->() const { return object; }");
   f.PrintLn(genloc__, "};", ln);

   delete z;
}
