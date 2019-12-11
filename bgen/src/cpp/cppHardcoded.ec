import "genCPP"

void cppHardcodedModule(BOutput o)
{
   o.z.concatx("   // hardcoded content start", ln,
               "   static TCPPClass<Module> _class;", ln,
               "   inline explicit Module(C(Instance) _impl, CPPClass & c = _class) : Instance(_impl, c) { }", ln,
            // "   MODULE_VIRTUAL_METHODS(Module)", ln,
            // "   REGISTER() { Module_class_registration(Module); }", ln,
               "   // end of hardcoded content", ln);
}

void cppHardcodedInstancePart1(BOutput o)
{
   o.z.concatx("   // hardcoded content start", ln,
               "   static TCPPClass<Instance> _class;", ln,
               "   C(Instance) impl;", ln,
               "   void (**vTbl)(void);", ln,
               "", ln,
               "   void * operator new   (uintsize count) { return eC_new(count); }", ln,
               "   void * operator new [](uintsize count) { return eC_new(count); }", ln,
               "   void operator delete   (void * ptr) { eC_delete(ptr); }", ln,
               "   void operator delete [](void * ptr) { eC_delete(ptr); }", ln,
               "", ln);
   o.z.concatx("   static C(bool) constructor(C(Instance) i, C(bool) alloc)", ln,
               "   {", ln,
               "      if(alloc &&!_INSTANCE(i, _class.impl))", ln,
               "         return new Instance(i, _class) != null;", ln,
               "      return true;", ln,
               "   }", ln,
               "   static void destructor(C(Instance) i) { Instance * inst = (Instance *)_INSTANCE(i, _class.impl); delete inst; }", ln,
               "   static void class_registration(CPPClass & _class);", ln,
               "", ln);
}

/*
class Nohead
{
public:
   void * impl;

   // void * operator new   (uintsize count) { return eC_new(count); }
   // void * operator new [](uintsize count) { return eC_new(count); }
   // void operator delete   (void * ptr) { eC_delete(ptr); }
   // void operator delete [](void * ptr) { eC_delete(ptr); }

   inline explicit Nohead(void * _impl)
   {
      impl = _impl;
   }
   inline Nohead()
   {
      impl = null;
   }

};
*/

/*
ecere.h:
typedef struct C(Cube) C(Cube);
extern THIS_LIB_IMPORT C(bool) (* Cube_create)(C(Cube) * __this, C(DisplaySystem) displaySystem);

extern THIS_LIB_IMPORT C(Property) * PROPERTY(Cube, size);
extern THIS_LIB_IMPORT void (* Cube_set_size)(C(Cube) * c, const C(Vector3Df) * value);

ecere.c:
LIB_EXPORT C(bool) (* Cube_create)(C(Cube) * __this, C(DisplaySystem) displaySystem);
LIB_EXPORT C(Property) * PROPERTY(Cube, size);
LIB_EXPORT void (* Cube_set_size)(C(Cube) * c, const C(Vector3Df) * value);
*/

/*
class Cube : Nohead
{
public:
// C(Cube) * impl;

   inline Cube()
   {
      impl = newt(C(Cube), 1);
   }

// Cube_create
// Cube_set_size
};
*/


void cppHardcodedInstancePart2(BOutput o)
{
   o.z.concatx("   inline explicit Instance(C(Instance) _impl, CPPClass & cl = _class)", ln,
               "   {", ln,
               "      Class * c = cl.impl;", ln,
               "      impl = _impl;", ln,
               "      vTbl = cl.vTbl;", ln,
               "      if(impl)", ln,
               "      {", ln,
               "         if(c && !_INSTANCE(impl, c))", ln,
               "            _INSTANCE(impl, c) = this;", ln,
               "         impl->_refCount++;", ln,
               "      }", ln,
               "   }", ln,
               "   inline Instance()", ln,
               "   {", ln,
               "      impl = null;", ln,
               "      vTbl = null;", ln,
               "   }", ln);
   o.z.concatx("   inline ~Instance()", ln,
               "   {", ln,
               "      if(impl && impl->_class)", ln,
               "      {", ln,
               "         if(impl->_class->bindingsClass)", ln,
               "         {", ln,
               "            Instance ** i = (Instance **)&INSTANCEL(impl, impl->_class);", ln,
               "            if(i && *i == this)", ln,
               "               *i = null;", ln,
               "            if(vTbl)", ln,
               "            {", ln,
               "               CPPClass * cl = (CPPClass *)impl->_class->bindingsClass;", ln,
               "               if(cl && vTbl != cl->vTbl)", ln,
               "               eC_delete(vTbl);", ln,
               "            }", ln,
               "         }", ln,
               "         Instance_decRef(impl);", ln,
               "      }", ln,
               "   }", ln);
   o.z.concatx("   inline Instance(const Instance & i) = delete;", ln,
               "   inline Instance(const Instance && i)", ln,
               "   {", ln,
               "      impl = i.impl;", ln,
               "      vTbl = i.vTbl;", ln,
               "   }", ln,
               "   // end of hardcoded content", ln);
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
void cppTmpDefineIntPropSet         (CPPGen g, File f, bool protoOrImpl) { ZString z { allocType = heap }; cppDefineMacroIntPropSet (g, z, 0, protoOrImpl, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefinePropSet            (CPPGen g, File f, bool protoOrImpl) { ZString z { allocType = heap }; cppDefineMacroPropSet    (g, z, 0, protoOrImpl, 0); f.Puts(z._string); delete z; f.Print(ln); }
void cppTmpDefinePropGet            (CPPGen g, File f, bool protoOrImpl) { ZString z { allocType = heap }; cppDefineMacroPropGet    (g, z, 0, protoOrImpl, 0); f.Puts(z._string); delete z; f.Print(ln); }

void printZedStringToFile(File f, ZString z)
{
   f.Puts(z._string);
   z.copy("");
}

void cppHardcodedCore(CPPGen g, File f)
{
   ZString z { allocType = heap };

   f.PrintLn("// Syntactic Sugar (NOT GENERATED)");
   f.PrintLn("// INSTANCEL: what?");
   f.PrintLn("//            x: pointer to eC instance");
   f.PrintLn("//            c: eC 'Class' object representing the C++ class");
   f.PrintLn("#define INSTANCEL(x, c) (*(void **)((char *)(x) + (c)->offset))");
   f.PrintLn("#define _INSTANCE(x, c) INSTANCEL((x) ? (x) : 0, c)", ln);

   f.PrintLn("// INSTANCE: returns a C++ instance out for supplied eC instance");
   f.PrintLn("//           x: pointer to eC instance");
   f.PrintLn("//           c: what is c");
   f.PrintLn("#define INSTANCE(x, c) ({c * _i = (c *)_INSTANCE(x, x->_class); _i ? *_i : c(x); })", ln);

   f.PrintLn("#define POBJ(c, o, eo) c eo ## to(eo); c & o = eo && eo->_class && eo->_class->bindingsClass ? *(c *)INSTANCEL(eo, eo->_class) : eo ## to", ln);

   f.PrintLn("#undef   newi");
   f.PrintLn("#define  newi(c) Instance_newEx(c, true)", ln);

   cppTmpDefineIntRegisterClass(g, f);
   cppTmpDefineRegisterClassDef(g, f);
   cppTmpDefineClassDef(g, f);
   cppTmpDefineRegisterClass(g, f);
   cppTmpDefineRegisterClassCPP(g, f);

   f.PrintLn("#define EVOLVE_APP(ac, a) \\");
   f.PrintLn("   Instance_evolve(&(a).impl, ac::_class.impl); \\");
   f.PrintLn("   _INSTANCE((a).impl, (a).impl->_class) = &(a); \\");
   f.PrintLn("   __thisModule = (a).impl; \\");
   f.PrintLn("   (a).vTbl = _class.vTbl;", ln);

   f.PrintLn("#define REGISTER_APP_CLASS(ac, b, a) \\");
   f.PrintLn("   REGISTER_CLASS(ac, b, a); \\");
   f.PrintLn("   EVOLVE_APP(ac, a)", ln);

   cppTmpDefineIntConstructClass(g, f);
   cppTmpDefineConstructClass(g, f);
   cppTmpDefineDestructClass(g, f);
   cppTmpDefineClassRegistration(g, f);

   f.PrintLn("#if !defined(__LINK_ECERE__)");
   f.PrintLn("#define __LINK_ECERE__ 1");
   f.PrintLn("#endif", ln);

   f.PrintLn("#define APP_CONSTRUCT(c, b) \\");
   f.PrintLn("   inline c() : c(eC_init_CALL(__LINK_ECERE__)) { } \\");
   f.PrintLn("   _CONSTRUCT(c, b)", ln);

   f.PrintLn("#if !defined(__WIN32__) || defined(__CONSOLE_APP__)");
   f.PrintLn("   #define APP_SET_ARGS(a) eC_setArgs(a.impl, argc, argv);");
   f.PrintLn("#else");
   f.PrintLn("   #define APP_SET_ARGS(a)");
   f.PrintLn("#endif", ln);

   f.PrintLn("#define MAIN_DEFINITION \\");
   f.PrintLn("   extern \"C\" MAIN_DECLARATION \\");
   f.PrintLn("   { \\");
   f.PrintLn("      APP_SET_ARGS(app); \\");
   f.PrintLn("      app.main(); \\");
   f.PrintLn("      unloadTranslatedStrings(MODULE_NAME); \\");
   f.PrintLn("      return app.exitCode; \\");
   f.PrintLn("   }", ln);

   f.PrintLn("#define SELF(c, n)  __attribute__((unused)) c * self = ((c *)(((char *)this) + 0x10 - (char *)&((c *)0x10)->n))", ln);

   cppTmpDefineVirtualMethod(g, f, true);
   cppTmpDefineVirtualMethod(g, f, false);
   cppTmpDefineIntRegisterMethod(g, f);
   cppTmpDefineRegisterMethod(g, f);
   cppTmpDefineRegisterTypedMethod(g, f);
   cppTmpDefineProperty(g, f, true);
   cppTmpDefineIntPropSet(g, f, true);
   cppTmpDefinePropSet(g, f, true);
   cppTmpDefinePropGet(g, f, true);
   cppTmpDefineProperty(g, f, false);
   cppTmpDefineIntPropSet(g, f, false);
   cppTmpDefinePropSet(g, f, false);
   cppTmpDefinePropGet(g, f, false);

   f.PrintLn("extern \"C\" ", g_.sym.module, " ecere_init(", g_.sym.module, " fromModule);");
   f.PrintLn("");
   f.PrintLn("class Class : public ", g_.sym.__class, " { };");
   f.PrintLn("");
   f.PrintLn("class CPPClass");
   f.PrintLn("{");
   f.PrintLn("public:");
   f.PrintLn("   typedef void (* Function)(void);");
   f.PrintLn("   Class * impl;");
   f.PrintLn("   Function * vTbl;");
   f.PrintLn("   inline CPPClass() { };");
   f.PrintLn("   inline CPPClass(const CPPClass & c) = delete;");
   f.PrintLn("   inline CPPClass(const CPPClass && c)");
   f.PrintLn("   {");
   f.PrintLn("      impl = c.impl;");
   f.PrintLn("      vTbl = c.vTbl;");
   f.PrintLn("   }");
   f.PrintLn("};");
   f.PrintLn("");
   f.PrintLn("template <class T>");
   f.PrintLn("class TCPPClass : public CPPClass");
   f.PrintLn("{");
   f.PrintLn("public:");
   f.PrintLn("   TCPPClass() { }");
   f.PrintLn("   TCPPClass(Class * _impl)");
   f.PrintLn("   {");
   f.PrintLn("      setup(_impl);");
   f.PrintLn("   }");
   f.PrintLn("   void (*destructor)(T &);");
   f.PrintLn("   void setup(Class * _impl)");
   f.PrintLn("   {");
   f.PrintLn("      impl = _impl;");
   f.PrintLn("      if(impl)");
   f.PrintLn("      {");
   f.PrintLn("         _impl->bindingsClass = this;");
   f.PrintLn("         if(vTbl) eC_delete(vTbl);");
   f.PrintLn("         vTbl = newt(Function, impl->vTblSize);");
   f.PrintLn("         memset(vTbl, 0, sizeof(Function) * impl->vTblSize);");
   f.PrintLn("         T::class_registration(*this);");
   f.PrintLn("      }");
   f.PrintLn("   }");
   f.PrintLn("   ~TCPPClass()");
   f.PrintLn("   {");
   f.PrintLn("      if(impl)");
   f.PrintLn("         eC_delete(vTbl);");
   f.PrintLn("   }");
   f.PrintLn("};");

   delete z;
}
