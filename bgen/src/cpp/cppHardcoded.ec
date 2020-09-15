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
               genloc__, "   static TCPPClass<Instance> _cpp_class;", ln,
               genloc__, "   C(Instance) impl;", ln,
               genloc__, "   void (**vTbl)(void);", ln,
               genloc__, "   bool mustFree = 0;", ln, ln);

   o.z.concatx(genloc__, "   void * operator new   (uintsize count) { return eC_new(count); }", ln,
               genloc__, "   void * operator new [](uintsize count) { return eC_new(count); }", ln,
               genloc__, "   void operator delete   (void * ptr) { eC_delete(ptr); }", ln,
               genloc__, "   void operator delete [](void * ptr) { eC_delete(ptr); }", ln, ln);

   o.z.concatx(genloc__, "   static C(bool) constructor(C(Instance) i, C(bool) alloc)", ln,
               genloc__, "   {", ln,
               genloc__, "      if(alloc && !INSTANCEL(i, i->_class))", ln,
               genloc__, "      {", ln);
   o.z.concatx(genloc__, "         Instance * inst = new Instance(i, _cpp_class);", ln,
               genloc__, "         if(inst)", ln,
               genloc__, "            inst->mustFree = true;", ln,
               genloc__, "         return inst != null;", ln);
   o.z.concatx(genloc__, "      }", ln,
               genloc__, "      return true;", ln,
               genloc__, "   }", ln);
   o.z.concatx(genloc__, "   static void destructor(C(Instance) i)", ln,
               genloc__, "   {", ln,
               genloc__, "      Instance * inst = (Instance *)INSTANCEL(i, _cpp_class.impl);", ln);
   o.z.concatx(genloc__, "      if(inst->mustFree)", ln,
               genloc__, "         delete inst;", ln,
               genloc__, "   }", ln);
   o.z.concatx(genloc__, "   static void class_registration(CPPClass & _class);", ln, ln);
}

void cppHardcodedInstancePart2(BOutput o)
{
   o.z.concatx(genloc__, "   explicit inline Instance(C(Instance) _impl, CPPClass & cl = _cpp_class)", ln,
               genloc__, "   {", ln,
               genloc__, "      XClass * c = cl.impl;", ln,
               genloc__, "      impl = _impl;", ln,
               genloc__, "      vTbl = cl.vTbl;", ln);
   o.z.concatx(genloc__, "      if(impl)", ln,
               genloc__, "      {", ln,
               genloc__, "         if(c && BINDINGS_CLASS(impl) && !INSTANCEL(impl, c))", ln,
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
               genloc__, "   {", ln);
   o.z.concatx(genloc__, "#ifdef _DEBUG", ln,
               genloc__, "      bool isApp = false;", ln,
               genloc__, "#endif", ln);
   o.z.concatx(genloc__, "      if(impl && impl->_class)", ln,
               genloc__, "      {", ln);
   o.z.concatx(genloc__, "#ifdef _DEBUG", ln,
               genloc__, "         isApp = Class_isDerived(impl->_class, eC_findClass(__thisModule, \"Application\"));", ln,
               genloc__, "#endif", ln);
// o.z.concatx(genloc__, "         // C(Instance) impl = this->impl;", ln,
//             genloc__, "         // this->impl = null;", ln);
   o.z.concatx(genloc__, "         int refCount = impl->_refCount;", ln,
               genloc__, "         if(impl->_class->bindingsClass)", ln,
               genloc__, "         {", ln,
               genloc__, "            Instance ** i = (Instance **)&INSTANCEL(impl, impl->_class);", ln);
   o.z.concatx(genloc__, "            if(i && *i == this && vTbl)", ln,
               genloc__, "            {", ln,
               genloc__, "               CPPClass * cl = (CPPClass *)impl->_class->bindingsClass;", ln);
   o.z.concatx(genloc__, "               if(cl && vTbl != cl->vTbl)", ln,
               genloc__, "                  eC_delete(vTbl);", ln,
               genloc__, "            }", ln);
   o.z.concatx(genloc__, "         }", ln,
               genloc__, "         Instance_decRef(impl);", ln);
   o.z.concatx(genloc__, "         if(refCount > 1)", ln,
               genloc__, "         {", ln,
               genloc__, "            Instance ** i = (Instance **)&INSTANCEL(impl, impl->_class);", ln,
               genloc__, "            if(i && *i == this)", ln,
               genloc__, "               *i = null;", ln,
               genloc__, "         }", ln);
   o.z.concatx(genloc__, "#ifdef _DEBUG", ln,
               genloc__, "         if(isApp)", ln,
               genloc__, "         {", ln,
               genloc__, "            // printf(\"Is app\\n\");", ln,
               genloc__, "            // F(checkMemory)();", ln,
               genloc__, "         }", ln,
               genloc__, "#endif", ln);
   o.z.concatx(genloc__, "      }", ln,
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
               genloc__, "   }", ln);
#if 0
   o.z.concatx(genloc__, "   inline void moveAssignHandleRefCount()", ln,
               genloc__, "   {", ln,
               genloc__, "      if(self->impl)", ln,
               genloc__, "      {", ln,
               genloc__, "         C(Instance) impl = self->impl;", ln,
               genloc__, "         int refCount = impl->_refCount;", ln,
               genloc__, "         Instance_decRef(impl);", ln);
   o.z.concatx(genloc__, "         if(refCount > 1)", ln,
               genloc__, "         {", ln,
               genloc__, "            Instance ** inst = (Instance **)&INSTANCEL(impl, impl->_class);", ln,
               genloc__, "            if(inst && *inst == self)", ln,
               genloc__, "               *inst = null;", ln,
               genloc__, "         }", ln,
               genloc__, "      }", ln,
               genloc__, "   }", ln);
#endif // 0
   o.z.concatx(genloc__, "   // end of hardcoded content", ln);
}

void cppHardcodedContainer(BOutput o, BClass c)
{
   o.z.concatx(genloc__, "   TContainer(std::initializer_list<TP_D> list) : TContainer()", ln);
   o.z.concatx(genloc__, "   {", ln);
   o.z.concatx(genloc__, "      typename std::initializer_list<TP_D>::iterator it;", ln);
   o.z.concatx(genloc__, "      for(it = list.begin(); it != list.end(); ++it)", ln);
   o.z.concatx(genloc__, "         add(*it);", ln);
   o.z.concatx(genloc__, "   }", ln, ln);

   o.z.concatx(genloc__, "   TContainer & operator =(std::initializer_list<TP_D> list)", ln);
   o.z.concatx(genloc__, "   {", ln);
   o.z.concatx(genloc__, "      typename std::initializer_list<TP_D>::iterator it;", ln);
   o.z.concatx(genloc__, "      for(it = list.begin(); it != list.end(); ++it)", ln);
   o.z.concatx(genloc__, "         add(*it);", ln);
   o.z.concatx(genloc__, "      return *this;", ln);
   o.z.concatx(genloc__, "   }", ln, ln);

   o.z.concatx(genloc__, "   inline TP_D operator [](TP_I index)", ln);
   o.z.concatx(genloc__, "   {", ln);
   o.z.concatx(genloc__, "      IteratorPointer ptr = getAtPosition(index, false, null);", ln);
   o.z.concatx(genloc__, "      return getData(ptr);", ln);
   o.z.concatx(genloc__, "   }", ln, ln);

   o.z.concatx(genloc__, "   inline C(bool) takeOut(TP_D d);", ln, ln);
}

void cppHardcodedArray(BOutput o, BClass c)
{
   o.z.concatx(ln); // TP_D is not available here
   o.z.concatx(genloc__, "   TArray", c.cpp.targsb, " (std::initializer_list<TP_T> list) : TArray", c.cpp.targsb, " ()", ln);
   o.z.concatx(genloc__, "   {", ln);
   o.z.concatx(genloc__, "      typename std::initializer_list<TP_T>::iterator it;", ln);
   o.z.concatx(genloc__, "      for(it = list.begin(); it != list.end(); ++it)", ln);
   o.z.concatx(genloc__, "         this->add(*it);", ln);
   o.z.concatx(genloc__, "   }", ln, ln);

   o.z.concatx(genloc__, "   TArray", c.cpp.targsb, " & operator =(std::initializer_list<TP_T> list)", ln);
   o.z.concatx(genloc__, "   {", ln);
   o.z.concatx(genloc__, "      typename std::initializer_list<TP_T>::iterator it;", ln);
   o.z.concatx(genloc__, "      for(it = list.begin(); it != list.end(); ++it)", ln);
   o.z.concatx(genloc__, "         this->add(*it);", ln);
   o.z.concatx(genloc__, "      return *this;", ln);
   o.z.concatx(genloc__, "   }", ln);
}

void cppTmpDefineVirtualMethod      (CPPGen g, File f, bool prototype, bool template)
{
   ZString z { allocType = heap };
   cppMacroVirtualMethod(g, z, definition, prototype, template, 0, "n", "ncpp", "c", "t", "t2", "b", "r", "p0", "ep", "p", "d", 0);
   f.Puts(z._string);
   delete z;
   f.Print(ln);
}
void cppTmpDefineIntRegisterMethod  (CPPGen g, File f, bool template)
{
   ZString z { allocType = heap };
   cppDefineMacroIntRegisterMethod(g, z, template, 0, 0);
   f.Puts(z._string); delete z;
}
void cppTmpDefineRegisterMethod     (CPPGen g, File f, bool template)
{
   ZString z { allocType = heap };
   cppMacroRegisterMethod(g, z, definition, template, 0, "ns", "n", "bc", "c", "t", "r", "p", "ocl", "oi", "code", "ea", "rv", 0);
   f.Puts(z._string);
   delete z;
   f.Print(ln);
}
void cppTmpDefineRegisterTypedMethod   (CPPGen g, File f, bool template) { ZString z { allocType = heap }; cppDefineMacroRegisterTypedMethod(g, z, template, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineIntRegisterClass      (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroIntRegisterClass   (g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineRegisterClassDef      (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroRegisterClassDef   (g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineClassDef              (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroClassDef           (g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineRegisterClass         (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroRegisterClass      (g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineRegisterClassCPP      (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroRegisterClassCPP   (g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineIntConstructClass     (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroIntConstructClass  (g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineMacroMoveConstructors (CPPGen g, File f, bool template) { ZString z { allocType = heap }; cppDefineMacroMoveConstructors   (g, z, template, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineConstructClass        (CPPGen g, File f, bool template) { ZString z { allocType = heap }; cppDefineMacroConstructClass     (g, z, template, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineDestructClass         (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroDestructClass      (g, z, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineClassRegistration     (CPPGen g, File f, bool prototype, bool template, bool original) { ZString z { allocType = heap }; cppDefineMacroClassRegister      (g, z, prototype, template, original, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineProperty              (CPPGen g, File f, PropertyMacroBits opts) { ZString z { allocType = heap }; cppDefineMacroProperty   (g, z, opts, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefineIntPropSet            (CPPGen g, File f, PropertyMacroBits opts) { ZString z { allocType = heap }; cppDefineMacroIntPropSet (g, z, opts, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefinePropSet               (CPPGen g, File f, PropertyMacroBits opts) { ZString z { allocType = heap }; cppDefineMacroPropSet    (g, z, opts, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefinePropGet               (CPPGen g, File f, PropertyMacroBits opts) { ZString z { allocType = heap }; cppDefineMacroPropGet    (g, z, opts, 0, 0); f.Puts(z._string); delete z; f.Print(ln); }

void printZedStringToFile(File f, ZString z)
{
   f.Puts(z._string);
   z.copy("");
}

void cppHardcodedCorePart1(CPPGen g, File f)
{
   f.PrintLn(genloc__, "#include <initializer_list>");
   f.PrintLn(genloc__, "#include <tuple>");
   f.PrintLn(genloc__, "#include <array>");
   f.PrintLn(genloc__, "#include <string_view>");
   f.PrintLn(genloc__, "#include <type_traits>");
   f.PrintLn(genloc__, "#include <cstdio>", ln);

   f.PrintLn(genloc__, "// Syntactic Sugar (NOT GENERATED)", ln);

   f.PrintLn(genloc__, "#define UNPACK(...) __VA_ARGS__", ln);

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
   f.PrintLn(genloc__, "   Instance_evolve(&(a).impl, ac::_cpp_class.impl); \\");
   f.PrintLn(genloc__, "   INSTANCEL((a).impl, (a).impl->_class) = &(a); \\");
   f.PrintLn(genloc__, "   __thisModule = (a).impl; \\");
   f.PrintLn(genloc__, "   (a).vTbl = _cpp_class.vTbl;", ln);

   f.PrintLn(genloc__, "#define REGISTER_APP_CLASS(ac, b, a) \\");
   f.PrintLn(genloc__, "   REGISTER_CLASS(ac, b, a); \\");
   f.PrintLn(genloc__, "   EVOLVE_APP(ac, a)", ln);

   cppTmpDefineIntConstructClass(g, f);
   cppTmpDefineMacroMoveConstructors(g, f, false);
   cppTmpDefineMacroMoveConstructors(g, f, true);
   cppTmpDefineConstructClass(g, f, false);
   cppTmpDefineConstructClass(g, f, true);
   cppTmpDefineDestructClass(g, f);
   cppTmpDefineClassRegistration(g, f, false, false, true);
   cppTmpDefineClassRegistration(g, f, true, false, false);
   cppTmpDefineClassRegistration(g, f, false, false, false);
   cppTmpDefineClassRegistration(g, f, true, true, false);
   cppTmpDefineClassRegistration(g, f, false, true, false);

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
   f.PrintLn(genloc__, "#define TCONTAINER_OF(ptr, type, t, member) ((T ## type UNPACK t *)(((char *)ptr) + 0x10 - (char *)&((T ## type UNPACK t *)0x10)->member))");
   f.PrintLn(genloc__, "#define SELF(c, member)  __attribute__((unused)) c * self = CONTAINER_OF(this, c, member);");
   f.PrintLn(genloc__, "#define TSELF(c, t, member)  __attribute__((unused)) T ## c UNPACK t * self = TCONTAINER_OF(this, c, (UNPACK t), member);");

   f.PrintLn(genloc__, "#define getimpli(i)  ((Instance)i).impl", ln);

   cppTmpDefineVirtualMethod(g, f, true, false);
   cppTmpDefineVirtualMethod(g, f, false, false);

   cppTmpDefineVirtualMethod(g, f, true, true);
   cppTmpDefineVirtualMethod(g, f, false, true);

   cppTmpDefineIntRegisterMethod(g, f, false);
   cppTmpDefineRegisterMethod(g, f, false);
   cppTmpDefineRegisterTypedMethod(g, f, false);

   cppTmpDefineIntRegisterMethod(g, f, true);
   cppTmpDefineRegisterMethod(g, f, true);
   cppTmpDefineRegisterTypedMethod(g, f, true);

   f.PrintLn(genloc__, "template<typename T, typename U> struct is_same       { static const bool value = false; };");
   f.PrintLn(genloc__, "template<typename T>             struct is_same<T, T> { static const bool value = true; };");
   f.PrintLn(genloc__, "template<typename T, typename U> bool eqTypes()       { return is_same<T, U>::value; }", ln);

#if 0
   f.PrintLn(genloc__, "template<typename TTT> inline uint64 toTA(TTT x) { C(DataValue) p = { }; p.p = (void *)x; return p.ui64; }");
   f.PrintLn(genloc__, "template<> inline uint64 toTA(double x) { C(DataValue) p = { }; p.d = x; return p.ui64; }");
   f.PrintLn(genloc__, "template<> inline uint64 toTA(float x)  { C(DataValue) p = { }; p.f = x; return p.ui64; }");
   f.PrintLn(genloc__, "template<> inline uint64 toTA(int x)    { C(DataValue) p = { }; p.i = x; return p.ui64; }", ln);

   f.PrintLn(genloc__, "template<typename TTT> inline TTT fromTA(uint64 x) { C(DataValue) p = { }; p.ui64 = x; return (TTT)p.p; }");
   f.PrintLn(genloc__, "template<> inline double fromTA(uint64 x) { C(DataValue) p = { }; p.ui64 = x; return p.d; }");
   f.PrintLn(genloc__, "template<> inline float  fromTA(uint64 x) { C(DataValue) p = { }; p.ui64 = x; return p.f; }");
   f.PrintLn(genloc__, "template<> inline int    fromTA(uint64 x) { C(DataValue) p = { }; p.ui64 = x; return p.i; }", ln);
#endif // 0

   f.PrintLn(genloc__, "template <std::string_view const&... Strs>");
   f.PrintLn(genloc__, "struct join");
   f.PrintLn(genloc__, "{");
   f.PrintLn(genloc__, "    // Helper to get a string literal from a std::array");
   f.PrintLn(genloc__, "    template <std::size_t N, std::array<char, N> const& S, typename>");
   f.PrintLn(genloc__, "    struct to_char_array;");
   f.PrintLn(genloc__, "    template <std::size_t N, std::array<char, N> const& S, std::size_t... I>");
   f.PrintLn(genloc__, "    struct to_char_array<N, S, std::index_sequence<I...>>");
   f.PrintLn(genloc__, "    {");
   f.PrintLn(genloc__, "        static constexpr const char value[]{S[I]..., 0};");
   f.PrintLn(genloc__, "    };");
   f.PrintLn(genloc__, "    // Join all strings into a single std::array of chars");
   f.PrintLn(genloc__, "    static constexpr auto impl() noexcept");
   f.PrintLn(genloc__, "    {");
   f.PrintLn(genloc__, "        constexpr std::size_t len = (Strs.size() + ... + ((sizeof...(Strs) - 1) * 2));");
   f.PrintLn(genloc__, "        std::array<char, len + 1> arr{};");
   f.PrintLn(genloc__, "        auto append = [i = 0, first = true, &arr](auto const& s) mutable {");
   f.PrintLn(genloc__, "            if (!first) {");
   f.PrintLn(genloc__, "                arr[i++] = ',';");
   f.PrintLn(genloc__, "                arr[i++] = ' ';");
   f.PrintLn(genloc__, "            }");
   f.PrintLn(genloc__, "            first = false;");
   f.PrintLn(genloc__, "            for (auto c : s) arr[i++] = c;");
   f.PrintLn(genloc__, "        };");
   f.PrintLn(genloc__, "        (append(Strs), ...);");
   f.PrintLn(genloc__, "        arr[len] = 0;");
   f.PrintLn(genloc__, "        return arr;");
   f.PrintLn(genloc__, "    }");
   f.PrintLn(genloc__, "    // Give the joined string static storage");
   f.PrintLn(genloc__, "    static constexpr auto arr = impl();");
   f.PrintLn(genloc__, "    // Convert to a string literal, then view as a std::string_view");
   f.PrintLn(genloc__, "    static constexpr std::string_view value =");
   f.PrintLn(genloc__, "        to_char_array<arr.size(), arr, std::make_index_sequence<arr.size()>>::value;");
   f.PrintLn(genloc__, "};", ln);

   f.PrintLn(genloc__, "template <std::string_view const&... Strs>");
   f.PrintLn(genloc__, "struct join_nocomma");
   f.PrintLn(genloc__, "{");
   f.PrintLn(genloc__, "    // Helper to get a string literal from a std::array");
   f.PrintLn(genloc__, "    template <std::size_t N, std::array<char, N> const& S, typename>");
   f.PrintLn(genloc__, "    struct to_char_array;");
   f.PrintLn(genloc__, "    template <std::size_t N, std::array<char, N> const& S, std::size_t... I>");
   f.PrintLn(genloc__, "    struct to_char_array<N, S, std::index_sequence<I...>>");
   f.PrintLn(genloc__, "    {");
   f.PrintLn(genloc__, "        static constexpr const char value[]{S[I]..., 0};");
   f.PrintLn(genloc__, "    };");
   f.PrintLn(genloc__, "    // Join all strings into a single std::array of chars");
   f.PrintLn(genloc__, "    static constexpr auto impl() noexcept");
   f.PrintLn(genloc__, "    {");
   f.PrintLn(genloc__, "        constexpr std::size_t len = (Strs.size() + ...);");
   f.PrintLn(genloc__, "        std::array<char, len + 1> arr{};");
   f.PrintLn(genloc__, "        auto append = [i = 0, &arr](auto const& s) mutable {");
   f.PrintLn(genloc__, "            for (auto c : s) arr[i++] = c;");
   f.PrintLn(genloc__, "        };");
   f.PrintLn(genloc__, "        (append(Strs), ...);");
   f.PrintLn(genloc__, "        arr[len] = 0;");
   f.PrintLn(genloc__, "        return arr;");
   f.PrintLn(genloc__, "    }");
   f.PrintLn(genloc__, "    // Give the joined string static storage");
   f.PrintLn(genloc__, "    static constexpr auto arr = impl();");
   f.PrintLn(genloc__, "    // Convert to a string literal, then view as a std::string_view");
   f.PrintLn(genloc__, "    static constexpr std::string_view value =");
   f.PrintLn(genloc__, "        to_char_array<arr.size(), arr, std::make_index_sequence<arr.size()>>::value;");
   f.PrintLn(genloc__, "};", ln);

   f.PrintLn(genloc__, "template<typename T> struct is_const            { static const bool value = false; };");
   f.PrintLn(genloc__, "template<typename T> struct is_const<const T>   { static const bool value = true; };");
   f.PrintLn(genloc__, "template<typename T> constexpr std::string_view isConst()   { return is_const<T>::value ? \"const \" : \"\"; }", ln);

   f.PrintLn(genloc__, "template <typename T> struct TypeName  { static constexpr const char* get() { return \"int\";    } };");
   f.PrintLn(genloc__, "template <> struct TypeName<int>       { static constexpr const char* get() { return \"int\";    } };");
   f.PrintLn(genloc__, "template <> struct TypeName<double>    { static constexpr const char* get() { return \"double\"; } };", ln);

   f.PrintLn(genloc__, "template <typename T> static constexpr std::string_view stringifyConst = isConst<T>();");
   f.PrintLn(genloc__, "template <typename T> static constexpr std::string_view stringifyTypeName = TypeName<T>::get();");
   f.PrintLn(genloc__, "template <typename T> static constexpr std::string_view stringifyType = join_nocomma<stringifyConst<T>, stringifyTypeName<T>>::value;");
   f.PrintLn(genloc__, "template <typename... T> static constexpr const char * getTemplateArgsString = join<stringifyType<T>...>::value.data();", ln);

   f.PrintLn(genloc__, "#define REGVMETHOD(b, n, m, p, t, a) \\");
   f.PrintLn(genloc__, "    if(!eqTypes<decltype(&m), decltype(&b::n)>()) \\");
   f.PrintLn(genloc__, "       ((b::b ## _ ## n ## _Functor::FunctionType *)_cpp_class.vTbl)[M_VTBLID(b, n)] = +[]p { return ((t &)self).m a; };", ln);

   f.PrintLn(genloc__, "#define TREGVMETHOD(tl, b, n, m, p, t, a) \\");
   f.PrintLn(genloc__, "    if(!eqTypes<decltype(&m), decltype(&tl::n)>()) \\");
   f.PrintLn(genloc__, "       ((tl::b ## _ ## n ## _Functor::FunctionType *)_cpp_class.vTbl)[M_VTBLID(b, n)] = +[]p { return ((t &)self).m a; };", ln);
   // bring back BIND_* and / or register_* ?
   // f.PrintLn("#define SETVMETHOD(n, m, p, t, a) \\");
   // f.PrintLn("    if(!eqTypes<typeof(&m), typeof(&n)>()) \\");
   // f.PrintLn("       n = +[]p { return ((t &)self).m a; }");

   cppTmpDefineProperty(g, f, { true });
   cppTmpDefineIntPropSet(g, f, { true });
   cppTmpDefinePropSet(g, f, { true });
   cppTmpDefinePropGet(g, f, { true });

   cppTmpDefineProperty(g, f, { false });

   cppTmpDefineIntPropSet(g, f, { false });
   cppTmpDefinePropSet(g, f, { false });
   cppTmpDefinePropGet(g, f, { false });

   f.PrintLn(genloc__, "#define TCTCO  <TC, TCO>", ln);
   cppTmpDefineIntPropSet(g, f, { false, nohead });
   cppTmpDefinePropSet(g, f, { false, nohead });
   cppTmpDefinePropGet(g, f, { false, nohead });

   cppTmpDefineIntPropSet(g, f, { true, template });
   cppTmpDefinePropSet(g, f, { true, template });
   cppTmpDefinePropGet(g, f, { true, template });

   cppTmpDefineIntPropSet(g, f, { false, template });
   cppTmpDefinePropSet(g, f, { false, template });
   cppTmpDefinePropGet(g, f, { false, template });
}

void cppHardcodedCorePart2(CPPGen g, File f)
{
   f.PrintLn(genloc__, "extern \"C\" ", g_.sym.module, " ecere_init(", g_.sym.module, " fromModule);", ln);

   f.PrintLn(genloc__, "class XClass : public ", g_.sym.__class, " { };", ln);
   f.PrintLn(genloc__, "static int cppClassCount;", ln);

   f.PrintLn(genloc__, "class CPPClass");
   f.PrintLn(genloc__, "{");
   f.PrintLn(genloc__, "public:");
   f.PrintLn(genloc__, "   void * operator new   (uintsize count) { return eC_new(count); }");
   f.PrintLn(genloc__, "   void * operator new [](uintsize count) { return eC_new(count); }");
   f.PrintLn(genloc__, "   void operator delete   (void * ptr) { eC_delete(ptr); }");
   f.PrintLn(genloc__, "   void operator delete [](void * ptr) { eC_delete(ptr); }", ln);

   f.PrintLn(genloc__, "   typedef void (* Function)(void);");
   f.PrintLn(genloc__, "   XClass * impl;");
   f.PrintLn(genloc__, "   Function * vTbl;");
   f.PrintLn(genloc__, "   char * name;");
   f.PrintLn(genloc__, "   inline CPPClass() { cppClassCount++; };");
   f.PrintLn(genloc__, "   inline CPPClass(const CPPClass & c) = delete;");
   f.PrintLn(genloc__, "   inline CPPClass(CPPClass && c)");
   f.PrintLn(genloc__, "   {");
   f.PrintLn(genloc__, "      name = c.name;");
   f.PrintLn(genloc__, "      impl = c.impl;");
   f.PrintLn(genloc__, "      vTbl = c.vTbl;");
   f.PrintLn(genloc__, "      c.name = null;");
   f.PrintLn(genloc__, "      c.impl = null;");
   f.PrintLn(genloc__, "      c.vTbl = null;");
   f.PrintLn(genloc__, "   }");
   f.PrintLn(genloc__, "   ~CPPClass()");
   f.PrintLn(genloc__, "   {");
   f.PrintLn(genloc__, "      if(!--cppClassCount)");
   f.PrintLn(genloc__, "      {");
   f.PrintLn(genloc__, "         //printf(\"No more classes\\n\");");
   f.PrintLn(genloc__, "         F(checkMemory)();");
   f.PrintLn(genloc__, "      }");
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
   f.PrintLn(genloc__, "      eC_delete(name);");
   f.PrintLn(genloc__, "      impl = _impl;");
   f.PrintLn(genloc__, "      if(impl)");
   f.PrintLn(genloc__, "      {");
   f.PrintLn(genloc__, "         name = F(copyString)(impl->name);");
   f.PrintLn(genloc__, "         _impl->bindingsClass = this;");
   f.PrintLn(genloc__, "         if(vTbl)");
   f.PrintLn(genloc__, "            eC_delete(vTbl);");
   f.PrintLn(genloc__, "         vTbl = newt(Function, impl->vTblSize);");
   f.PrintLn(genloc__, "         memset(vTbl, 0, sizeof(Function) * impl->vTblSize);");
// f.PrintLn(genloc__, "         printf(\"setting up %s\\n\", impl->name);"); // todo: remove debug printing?
   f.PrintLn(genloc__, "         TC::class_registration(*this);");
   f.PrintLn(genloc__, "      }");
   f.PrintLn(genloc__, "   }");
   f.PrintLn(genloc__, "   ~TCPPClass()");
   f.PrintLn(genloc__, "   {");
   f.PrintLn(genloc__, "      if(impl)");
   f.PrintLn(genloc__, "         eC_delete(vTbl);");
   f.PrintLn(genloc__, "      eC_delete(name);");
   f.PrintLn(genloc__, "   }");
   f.PrintLn(genloc__, "};", ln);

   f.PrintLn(genloc__, "template<typename ... TPs> inline CPPClass & ensureTemplatized(CPPClass & _class, const char * name)");
   f.PrintLn(genloc__, "{");
   f.PrintLn(genloc__, "   if(!_class.impl || !_class.impl->templateClass)");
   f.PrintLn(genloc__, "   {");
   f.PrintLn(genloc__, "      char type[1024];");
   f.PrintLn(genloc__, "      strcpy(type, \"CPP\");");
   f.PrintLn(genloc__, "      strcat(type, name);");
   f.PrintLn(genloc__, "      strcat(type, \"<\");");
   f.PrintLn(genloc__, "      strcat(type, getTemplateArgsString<TPs...>);");
   f.PrintLn(genloc__, "      strcat(type, \">\");");
// f.PrintLn(genloc__, "      printf(\"Instantiating %s\\n\", type);");
   f.PrintLn(genloc__, "      _class.impl = (XClass *)eC_findClass(__thisModule, type);");
   f.PrintLn(genloc__, "      if(_class.impl) _class.impl->bindingsClass = &_class;");
   f.PrintLn(genloc__, "   }");
   f.PrintLn(genloc__, "   return _class;");
   f.PrintLn(genloc__, "}", ln);

   f.PrintLn(genloc__, cpptemplateNoHeadDef);
   f.PrintLn(genloc__, "class TNHInstance");
   f.PrintLn(genloc__, "{");
   f.PrintLn(genloc__, "public:");
   f.PrintLn(genloc__, "   void * operator new   (uintsize count) { return eC_new(count); }");
   f.PrintLn(genloc__, "   void * operator new [](uintsize count) { return eC_new(count); }");
   f.PrintLn(genloc__, "   void operator delete   (void * ptr) { eC_delete(ptr); }");
   f.PrintLn(genloc__, "   void operator delete [](void * ptr) { eC_delete(ptr); }");
   f.PrintLn(genloc__, "   TC * impl;");
   f.PrintLn(genloc__, "   TNHInstance() { impl = (TC*)Instance_new(*TCO); }");
   f.PrintLn(genloc__, "   TNHInstance(TC * _impl) { impl = _impl; }");
   f.PrintLn(genloc__, "   ~TNHInstance()");
   f.PrintLn(genloc__, "   {");
   f.PrintLn(genloc__, "      eC_delete(impl);");
   f.PrintLn(genloc__, "   }");
   f.PrintLn(genloc__, "};", ln);

   // TIH: Template Instance Holder
   f.PrintLn(genloc__, cpptemplateCPPClassDef);
   f.PrintLn(genloc__, "class TIH");
   f.PrintLn(genloc__, "{");
   f.PrintLn(genloc__, "public:");
   f.PrintLn(genloc__, "   void * operator new   (uintsize count) { return eC_new(count); }");
   f.PrintLn(genloc__, "   void * operator new [](uintsize count) { return eC_new(count); }");
   f.PrintLn(genloc__, "   void operator delete   (void * ptr) { eC_delete(ptr); }");
   f.PrintLn(genloc__, "   void operator delete [](void * ptr) { eC_delete(ptr); }");
#ifdef NORMAL_CLASS_RETURN_METHOD_TIH
   f.PrintLn(genloc__, "   operator TC() const { return *object; }"); // error: use of deleted function ‘GeoData::GeoData(const GeoData&)
#endif
   f.PrintLn(genloc__, "   TC * object;", ln);

   f.PrintLn(genloc__, "   TIH(C(Instance) eo) : TIH(*(BINDINGS_CLASS(eo) ? (TC *)INSTANCE(eo, eo->_class) : new TC(eo)))");
   f.PrintLn(genloc__, "   {");
   f.PrintLn(genloc__, "      if(!BINDINGS_CLASS(eo) || !INSTANCE(eo, eo->_class))");
   f.PrintLn(genloc__, "      {");
   f.PrintLn(genloc__, "         object->mustFree = true;");
   f.PrintLn(genloc__, "      }");
   f.PrintLn(genloc__, "      else");
   f.PrintLn(genloc__, "      {");
   f.PrintLn(genloc__, "         INSTANCEL(eo, eo->_class) = object;");
   f.PrintLn(genloc__, "      }");
   f.PrintLn(genloc__, "   }");
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
   f.PrintLn(genloc__, "      if(object)");
   f.PrintLn(genloc__, "      {");
   f.PrintLn(genloc__, "         if(object->impl)");
   f.PrintLn(genloc__, "            object->impl->_refCount--;");
   f.PrintLn(genloc__, "         if(object->mustFree)");
   f.PrintLn(genloc__, "            delete object;");
   f.PrintLn(genloc__, "      }");
   f.PrintLn(genloc__, "   }", ln);

   f.PrintLn(genloc__, "   TC& operator*() const { return *object; }");
   f.PrintLn(genloc__, "   TC* operator->() const { return object; }");
   f.PrintLn(genloc__, "};", ln);
}

void cppHardcodedCoreAfterInstancePart(BOutput o)
{
   o.z.concatx(genloc__, "struct Struct", ln);
   o.z.concatx(genloc__, "{", ln);
   o.z.concatx(genloc__, "   [[no_unique_address]] int _[0];", ln);
   o.z.concatx(genloc__, "};", ln, ln);

   o.z.concatx(genloc__, "template<typename TTT> inline typename std::enable_if<std::is_base_of<Instance, TTT>::value, uint64>::type", ln);
   o.z.concatx(genloc__, "  toTA(TTT & x) { C(DataValue) p = { }; p.p = x.impl; return p.ui64; }", ln, ln);

   o.z.concatx(genloc__, "template<typename TTT> inline typename std::enable_if<std::is_base_of<Instance, TTT>::value, uint64>::type", ln);
   o.z.concatx(genloc__, "  toTA(TTT * x) { C(DataValue) p = { }; p.p = x ? x->impl : null; return p.ui64; }", ln, ln);

   o.z.concatx(genloc__, "template<typename TTT> inline typename std::enable_if<std::is_base_of<Struct, TTT>::value, uint64>::type", ln);
   o.z.concatx(genloc__, "  toTA(TTT x) { C(DataValue) p = { }; p.p = (void *)&x; return p.ui64; }", ln, ln);

   o.z.concatx(genloc__, "template<typename TTT> inline typename std::enable_if<!std::is_base_of<Instance, TTT>::value && !std::is_base_of<Struct, TTT>::value, uint64>::type", ln);
   o.z.concatx(genloc__, "  toTA(TTT x) { C(DataValue) p = { }; p.p = (void *)x; return p.ui64; }", ln, ln);

   o.z.concatx(genloc__, "template<> inline uint64 toTA(double x) { C(DataValue) p = { }; p.d = x; return p.ui64; }", ln);
   o.z.concatx(genloc__, "template<> inline uint64 toTA(float x)  { C(DataValue) p = { }; p.f = x; return p.ui64; }", ln);
   o.z.concatx(genloc__, "template<> inline uint64 toTA(int x)    { C(DataValue) p = { }; p.i = x; return p.ui64; }", ln, ln);

   o.z.concatx(genloc__, "template<typename TTT> inline typename", ln);
   o.z.concatx(genloc__, "   std::enable_if<std::is_pointer<TTT>::value &&", ln);
   o.z.concatx(genloc__, "      std::is_base_of<Instance, typename std::remove_pointer<TTT>::type>::value, TTT>::type", ln);
   o.z.concatx(genloc__, "   fromTA(uint64 x)", ln);
   o.z.concatx(genloc__, "   {", ln);
   o.z.concatx(genloc__, "      C(DataValue) p = { };", ln);
   o.z.concatx(genloc__, "      p.ui64 = x;", ln);
   o.z.concatx(genloc__, "      C(Instance) i = (C(Instance))p.p;", ln);
   o.z.concatx(genloc__, "      return BINDINGS_CLASS(i) ? (TTT)INSTANCEL(i, i->_class) : (TTT)0;", ln);
   o.z.concatx(genloc__, "   }", ln, ln);

   o.z.concatx(genloc__, "template<typename TTT> inline typename std::enable_if<!std::is_pointer<TTT>::value &&", ln);
   o.z.concatx(genloc__, "      std::is_base_of<Instance, TTT>::value, TTT>::type", ln);
   o.z.concatx(genloc__, "   fromTA(uint64 x)", ln);
   o.z.concatx(genloc__, "   {", ln);
   o.z.concatx(genloc__, "      C(DataValue) p = { };", ln);
   o.z.concatx(genloc__, "      p.ui64 = x;", ln);
   o.z.concatx(genloc__, "      return TTT((C(Instance))p.p);", ln);
   o.z.concatx(genloc__, "   }", ln, ln);

   o.z.concatx(genloc__, "template<typename TTT> inline typename std::enable_if<!std::is_pointer<TTT>::value &&", ln);
   o.z.concatx(genloc__, "      std::is_base_of<Struct, TTT>::value, TTT>::type", ln);
   o.z.concatx(genloc__, "   fromTA(uint64 x)", ln);
   o.z.concatx(genloc__, "   {", ln);
   o.z.concatx(genloc__, "      C(DataValue) p = { };", ln);
   o.z.concatx(genloc__, "      p.ui64 = x;", ln);
   o.z.concatx(genloc__, "      return *(TTT *)p.p;", ln);
   o.z.concatx(genloc__, "   }", ln, ln);

   o.z.concatx(genloc__, "template<typename TTT> inline typename std::enable_if<std::is_pointer<TTT>::value &&", ln);
   o.z.concatx(genloc__, "      std::is_base_of<Struct, typename std::remove_pointer<TTT>::type>::value, TTT>::type", ln);
   o.z.concatx(genloc__, "   fromTA(uint64 x)", ln);
   o.z.concatx(genloc__, "   {", ln);
   o.z.concatx(genloc__, "      C(DataValue) p = { };", ln);
   o.z.concatx(genloc__, "      p.ui64 = x;", ln);
   o.z.concatx(genloc__, "      return (TTT *)p.p;", ln);
   o.z.concatx(genloc__, "   }", ln, ln);

   o.z.concatx(genloc__, "template<typename TTT> inline", ln);
   o.z.concatx(genloc__, "   typename std::enable_if<", ln);
// o.z.concatx(genloc__, "      // std::is_pointer<TTT>::value &&", ln);
   o.z.concatx(genloc__, "      !std::is_base_of<Instance, typename std::remove_pointer<TTT>::type>::value &&", ln);
   o.z.concatx(genloc__, "      !std::is_base_of<Struct,   typename std::remove_pointer<TTT>::type>::value,", ln);
   o.z.concatx(genloc__, "      TTT>::type", ln);
   o.z.concatx(genloc__, "   fromTA(uint64 x) { C(DataValue) p = { }; p.ui64 = x; return (TTT)p.p; }", ln, ln);

   o.z.concatx(genloc__, "template<> inline double fromTA<double>(uint64 x) { C(DataValue) p = { }; p.ui64 = x; return p.d; }", ln);
   o.z.concatx(genloc__, "template<> inline float  fromTA<float>(uint64 x) { C(DataValue) p = { }; p.ui64 = x; return p.f; }", ln);
   o.z.concatx(genloc__, "template<> inline int    fromTA<int>(uint64 x) { C(DataValue) p = { }; p.ui64 = x; return p.i; }", ln, ln);
}

void cppHardcodedNativeTypeTemplates(CPPGen g, File f)
{
   Array<const char *> natives { [ "char", "short", "int", "int64", "uint", "uint64", "float", "double" ] };
   for(type : natives)
      f.PrintLn(genloc__, "template<typename TTT> C(Class) * class_of(", type, " v) { return CO(", type, "); };");
   f.PrintLn(genloc__, "template<typename TTT> C(Class) * class_of(const char * v) { return CO(String); };");
   f.PrintLn(genloc__, "template<typename TTT> C(Class) * class_of(char * v) { return CO(String); };");
   f.PrintLn(genloc__, "template<typename TTT> C(Class) * class_of(const Instance & v) { return v.impl ? v.impl->_class : v._cpp_class.impl; };", ln);

   f.PrintLn(genloc__, "#define classof(x) class_of<decltype(x)>((x))", ln);

   f.PrintLn(genloc__, "template <typename TTT, C(Class) ** TCO> inline const void * vapass(TNHInstance<TTT, TCO> & f) { return f.impl; }");
   {
      char ch = '*';
      for(type : natives)
      {
         f.PrintLn(genloc__, "inline const void * vapass(const ", type, " ", ch, " f) { return ", ch == '*' ? "" : "&", "f; }");
         if(ch == '*')
            ch = '&';
      }
   }

   f.PrintLn(genloc__, "inline const void * vapass(const Instance & f) { return f.impl; }", ln);
   delete natives;
}

#if 0
void cppSomethingTemplateOrNohead(CPPGen g, File f)
{
   f.PrintLn(genloc__, "// Can also specialize if needed for very different behavior... Unlikely needed for bindings?", ln);
   f.PrintLn(genloc__, "template<> inline IteratorPointer Container<double>::add(double value)", ln);
   f.PrintLn(genloc__, "{", ln);
   f.PrintLn(genloc__, "   return Container_add(impl, TAd(value));", ln);
   f.PrintLn(genloc__, "}", ln, ln);

   f.PrintLn(genloc__, "template<> inline IteratorPointer Container<float>::add(float value)", ln);
   f.PrintLn(genloc__, "{", ln);
   f.PrintLn(genloc__, "   return Container_add(impl, TAf(value));", ln);
   f.PrintLn(genloc__, "}", ln);
}
#endif // 0
