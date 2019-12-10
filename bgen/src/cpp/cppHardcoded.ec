import "genCPP"

void cppHardcodedModule(BOutput o)
{
   o.z.concatx("   // hardcoded content start", ln,
               "   static TCPPClass<Module> _class;", ln,
               "   inline explicit Module(C(Instance) _impl, CPPClass & c = _class) : Instance(_impl, c) { }", ln,
               "   MODULE_VIRTUAL_METHODS(Module)", ln,
               "   REGISTER() { Module_class_registration(Module); }", ln,
               "   // end of hardcoded content", ln);
}

void cppHardcodedInstance(BOutput o)
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
               "", ln,
               "   INSTANCE_VIRTUAL_METHODS(Instance);", ln,
               "", ln);
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

void cppTmpDefineVirtualMethod      (CPPGen g, File f)
{
   ZString z { allocType = heap };
   cppMacroVirtualMethod(g, z, def, 0, "n", "ncpp", "c", "b", "r", "p0", "ep", "p", "d", 0);
   f.Puts(z._string);
   delete z;
}
void cppTmpDefineIntRegisterMethod  (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroIntRegisterMethod  (g, z, 0, 0); f.Puts(z._string); delete z; }
void cppTmpDefineRegisterMethod     (CPPGen g, File f)
{
   ZString z { allocType = heap };
   cppMacroRegisterMethod(g, z, def, 0, "ns", "n", "bc", "c", "r", "p", "ocl", "oi", "code", "ea", "rv", 0);
   f.Puts(z._string);
   delete z;
}
void cppTmpDefineRegisterTypedMethod(CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroRegisterTypedMethod(g, z, 0, 0); f.Puts(z._string); delete z; }
void cppTmpDefineProperty           (CPPGen g, File f, bool protoOrImpl) { ZString z { allocType = heap }; cppDefineMacroProperty           (g, z, 0, 0, protoOrImpl); f.Puts(z._string); delete z; }
void cppTmpDefineIntPropSet         (CPPGen g, File f, bool protoOrImpl) { ZString z { allocType = heap }; cppDefineMacroIntPropSet         (g, z, 0, 0, protoOrImpl); f.Puts(z._string); delete z; }
void cppTmpDefinePropSet            (CPPGen g, File f, bool protoOrImpl) { ZString z { allocType = heap }; cppDefineMacroPropSet            (g, z, 0, 0, protoOrImpl); f.Puts(z._string); delete z; }
void cppTmpDefinePropGet            (CPPGen g, File f, bool protoOrImpl) { ZString z { allocType = heap }; cppDefineMacroPropGet            (g, z, 0, 0, protoOrImpl); f.Puts(z._string); delete z; }
void cppTmpDefineIntRegisterClass   (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroIntRegisterClass   (g, z, 0, 0); f.Puts(z._string); delete z; }
void cppTmpDefineRegisterClassDef   (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroRegisterClassDef   (g, z, 0, 0); f.Puts(z._string); delete z; }
void cppTmpDefineClassDef           (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroClassDef           (g, z, 0, 0); f.Puts(z._string); delete z; }
void cppTmpDefineRegisterClass      (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroRegisterClass      (g, z, 0, 0); f.Puts(z._string); delete z; }
void cppTmpDefineRegisterClassCPP   (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroRegisterClassCPP   (g, z, 0, 0); f.Puts(z._string); delete z; }
void cppTmpDefineIntConstructClass  (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroIntConstructClass  (g, z, 0, 0); f.Puts(z._string); delete z; }
void cppTmpDefineConstructClass     (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroConstructClass     (g, z, 0, 0); f.Puts(z._string); delete z; }
void cppTmpDefineDestructClass      (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroDestructClass      (g, z, 0, 0); f.Puts(z._string); delete z; }
void cppTmpDefineClassRegistration  (CPPGen g, File f) { ZString z { allocType = heap }; cppDefineMacroClassRegister  (g, z, 0, 0); f.Puts(z._string); delete z; }

void cppHardcodedCore(CPPGen g, File f)
{
   f.PrintLn("// Syntactic Sugar (NOT GENERATED)");
   f.PrintLn("#define INSTANCEL(x, c) (*(void **)((char *)(x) + (c)->offset))");
   f.PrintLn("#define _INSTANCE(x, c) INSTANCEL((x) ? (x) : 0, c)");
   f.PrintLn("");

   f.PrintLn("#define INSTANCE(x, c) ({c * _i = (c *)_INSTANCE(x, x->_class); _i ? *_i : c(x); })");
   f.PrintLn("");

   f.PrintLn("#undef   newi");
   f.PrintLn("#define  newi(c) Instance_newEx(c, true)");
   f.PrintLn("");

   // f.PrintLn("#define _REGISTER_CLASS(n, ns, bs, a) \\");
   // f.PrintLn("   (Class *)eC_registerClass(ClassType_normalClass, ns, bs, sizeof(Instance *), 0, \\");
   // f.PrintLn("      (C(bool) (*)(void *)) n::constructor, (void(*)(void *)) n::destructor, (a).impl, AccessMode_privateAccess, AccessMode_publicAccess)");
   cppTmpDefineIntRegisterClass(g, f);
   f.PrintLn("");

   // f.PrintLn("// For defining _class and registereing together (single translation unit)");
   // f.PrintLn("#define REGISTER_CLASS_DEF(n, b, a)    TCPPClass<n> n::_class(_REGISTER_CLASS(n,     #n, b::_class.impl->name, a));");
   cppTmpDefineRegisterClassDef(g, f);
   f.PrintLn("");

   // f.PrintLn("// For defining _class and registering separately (multiple translation units)");
   // f.PrintLn("#define CLASS_DEF(n)                   TCPPClass<n> n::_class;");
   cppTmpDefineClassDef(g, f);
   f.PrintLn("");

   // f.PrintLn("#define REGISTER_CLASS(n, b, a)        n::_class.setup(_REGISTER_CLASS(n,       #n, b::_class.impl->name, a));");
   cppTmpDefineRegisterClass(g, f);
   f.PrintLn("");

   // f.PrintLn("// For C++ classes proxying eC classes:");
   // f.PrintLn("#define REGISTER_CPP_CLASS(n, a)       n::_class.setup(_REGISTER_CLASS(n, \"CPP\" #n, #n, a));");
   cppTmpDefineRegisterClassCPP(g, f);
   f.PrintLn("");

   f.PrintLn("#define EVOLVE_APP(ac, a) \\");
   f.PrintLn("   Instance_evolve(&(a).impl, ac::_class.impl); \\");
   f.PrintLn("   _INSTANCE((a).impl, (a).impl->_class) = &(a); \\");
   f.PrintLn("   __thisModule = (a).impl; \\");
   f.PrintLn("   (a).vTbl = _class.vTbl;");
   f.PrintLn("");

   f.PrintLn("#define REGISTER_APP_CLASS(ac, b, a) \\");
   f.PrintLn("   REGISTER_CLASS(ac, b, a); \\");
   f.PrintLn("   EVOLVE_APP(ac, a)");
   f.PrintLn("");

   // f.PrintLn("#define _CONSTRUCT(c, b) \\");
   // f.PrintLn("   INSTANCE_VIRTUAL_METHODS(c) \\");
   // f.PrintLn("   static TCPPClass<c> _class; \\");
   // f.PrintLn("   static C(bool) constructor(", g_.sym.instance, " i, C(bool) alloc) { return (alloc && !_INSTANCE(i, _class.impl)) ? new c(i, _class) != null : true; } \\");
   // f.PrintLn("   static void destructor(", g_.sym.instance, " i) { c * inst = (c *)_INSTANCE(i, _class.impl); if(_class.destructor) ((void (*)(c & self))_class.destructor)(*inst); delete inst; } \\");
   // f.PrintLn("   explicit inline c(", g_.sym.instance, " _impl, CPPClass & cl = _class) : b(_impl, cl)");
   cppTmpDefineIntConstructClass(g, f);
   f.PrintLn("");

   // f.PrintLn("#define CONSTRUCT(c, b) \\");
   // f.PrintLn("   c() : c((", g_.sym.instance, ")Instance_newEx(_class.impl, false), _class) { } \\");
   // f.PrintLn("   _CONSTRUCT(c, b)");
   cppTmpDefineConstructClass(g, f);
   f.PrintLn("");

   // f.PrintLn("#define DESTRUCT(c) \\");
   // f.PrintLn("   ((TCPPClass<c> &)_class).destructor");
   cppTmpDefineDestructClass(g, f);
   f.PrintLn("");

   // f.PrintLn("#define REGISTER() \\");
   // f.PrintLn("   static void class_registration(CPPClass & _class)");
   cppTmpDefineClassRegistration(g, f);
   f.PrintLn("");

   f.PrintLn("#define APP_CONSTRUCT(c, b) \\");
   f.PrintLn("   inline c() : c(eC_init_CALL(1)) { } \\");
   f.PrintLn("   _CONSTRUCT(c, b)");
   f.PrintLn("");

   f.PrintLn("#if !defined(__WIN32__) || defined(__CONSOLE_APP__)");
   f.PrintLn("   #define APP_SET_ARGS(a) eC_setArgs(a.impl, argc, argv);");
   f.PrintLn("#else");
   f.PrintLn("   #define APP_SET_ARGS(a)");
   f.PrintLn("#endif");
   f.PrintLn("");

   f.PrintLn("#define MAIN_DEFINITION \\");
   f.PrintLn("   extern \"C\" MAIN_DECLARATION \\");
   f.PrintLn("   { \\");
   f.PrintLn("      APP_SET_ARGS(app); \\");
   f.PrintLn("      app.main(); \\");
   f.PrintLn("      unloadTranslatedStrings(MODULE_NAME); \\");
   f.PrintLn("      return app.exitCode; \\");
   f.PrintLn("   }");
   f.PrintLn("");

   f.PrintLn("#define SELF(c, n)  __attribute__((unused)) c * self = ((c *)(((char *)this) + 0x10 - (char *)&((c *)0x10)->n))");
   f.PrintLn("");

   // f.PrintLn("#define _ARG ,");
   // f.PrintLn("");

   //f.PrintLn("// (n)ame, (c)class, (b)ase, (r)eturn, (p0)?, (ep)?, (p)?, (d)?");
   // f.PrintLn("#define VIRTUAL_METHOD(n, c, b, r, p0, ep, p, d) \\");
   // f.PrintLn("   struct c ## _ ## n ## _Functor \\");
   // f.PrintLn("   { \\");
   // f.PrintLn("      int _[0]; \\");
   // f.PrintLn("      typedef r (* FunctionType)(p0 p); \\");
   // f.PrintLn("      inline FunctionType operator= (FunctionType func) \\");
   // f.PrintLn("      { \\");
   // f.PrintLn("         SELF(c, n); \\");
   // f.PrintLn("         if(self->vTbl == c::_class.vTbl) \\");
   // f.PrintLn("         { \\");
   // f.PrintLn("            uint size = c :: _class.impl->vTblSize; \\");
   // f.PrintLn("            self->vTbl = (void (**)())newt(FunctionType, size); \\");
   // f.PrintLn("            memcpy(self->vTbl, c::_class.vTbl, sizeof(FunctionType) * size); \\");
   // f.PrintLn("         } \\");
   // f.PrintLn("         ((FunctionType *)self->vTbl)[M_VTBLID(b, n)] = func; \\");
   // f.PrintLn("         return func; \\");
   // f.PrintLn("      } \\");
   // f.PrintLn("      inline r operator()(ep p) \\");
   // f.PrintLn("      { \\");
   // f.PrintLn("         SELF(c, n); \\");
   // f.PrintLn("         d; \\");
   // f.PrintLn("      } \\");
   // f.PrintLn("   } n; \\");
   // f.PrintLn("   inline static void register_ ## n(CPPClass & cl, c ## _ ## n ## _Functor::FunctionType func) \\");
   // f.PrintLn("   { \\");
   // f.PrintLn("      ((c ## _ ## n ## _Functor::FunctionType *)cl.vTbl)[M_VTBLID(b, n)] = func; \\");
   // f.PrintLn("   }");
   cppTmpDefineVirtualMethod(g, f);
   f.PrintLn("");

   // f.PrintLn("#define _REGISTER_METHOD(cp1, cp2, ns, n, bc, c, r, p, ocl, oi, code, ea, rv) \\");
   // f.PrintLn("   addMethod(_class.impl, ns, (void *) +[]p \\");
   // f.PrintLn("   { \\");
   // f.PrintLn("      Class * cl = (ocl) ? (Class *)(ocl)->_class : null; \\");
   // f.PrintLn("      cp1 \\");
   // f.PrintLn("      c * i = (oi) ? (c *)_INSTANCE(oi, cl) : null; \\");
   // f.PrintLn("      int vid = M_VTBLID(bc, n); \\");
   // f.PrintLn("      bc ## _ ## n ## _Functor::FunctionType fn; \\");
   // f.PrintLn("      if(i && i->vTbl && i->vTbl[vid]) \\");
   // f.PrintLn("      { \\");
   // f.PrintLn("         fn = (bc ## _ ## n ## _Functor::FunctionType) i->vTbl[vid]; \\");
   // f.PrintLn("         code; \\");
   // f.PrintLn("      } \\");
   // f.PrintLn("      cp2 \\");
   // f.PrintLn("      else \\");
   // f.PrintLn("      { \\");
   // f.PrintLn("         auto method = ((r (*) p)(class_ ## c->_vTbl)[M_VTBLID(bc, n)]); \\");
   // f.PrintLn("         if(method) return method ea; \\");
   // f.PrintLn("         return rv; \\");
   // f.PrintLn("      } \\");
   // f.PrintLn("   })");
   cppTmpDefineIntRegisterMethod(g, f);
   f.PrintLn("");

   // f.PrintLn("#define REGISTER_METHOD(ns, n, bc, c, r, p, ocl, oi, code, ea, rv) \\");
   // f.PrintLn("   _REGISTER_METHOD(,, ns, n, bc, c, r, p, ocl, oi, code, ea, rv)");
   cppTmpDefineRegisterMethod(g, f);
   f.PrintLn("");

   // f.PrintLn("#define REGISTER_TYPED_METHOD(ns, n, bc, c, r, p, ocl, oi, code, ea, rv) \\");
   // f.PrintLn("   _REGISTER_METHOD(\\");
   // f.PrintLn("      CPPClass * cppcl = _class ? (CPPClass *)_class->bindingsClass : null;, \\");
   // f.PrintLn("      else if(cppcl && cppcl->vTbl && cppcl->vTbl[vid]) \\");
   // f.PrintLn("      { \\");
   // f.PrintLn("         fn = (bc ## _ ## n ## _Functor::FunctionType) cppcl->vTbl[vid]; \\");
   // f.PrintLn("         code; \\");
   // f.PrintLn("      }, \\");
   // f.PrintLn("      ns, n, bc, c, r, p, ocl, oi, code, ea, rv)");
   cppTmpDefineRegisterTypedMethod(g, f);
   f.PrintLn("");

   // f.PrintLn("#define property(n, sg) struct n ## Prop { n ## Prop() { }; int _[0]; sg } n;");
   cppTmpDefineProperty(g, f, true);
   f.PrintLn("");
   cppTmpDefineProperty(g, f, false);
   f.PrintLn("");

   // f.PrintLn("#define _set(t, n, c, d) \\");
   // f.PrintLn("   inline t operator= (t v) \\");
   // f.PrintLn("   { \\");
   // f.PrintLn("      SELF(c, n); \\");
   // f.PrintLn("      d; \\");
   // f.PrintLn("      return v; \\");
   // f.PrintLn("   } \\");
   cppTmpDefineIntPropSet(g, f, true);
   f.PrintLn("");
   cppTmpDefineIntPropSet(g, f, false);
   f.PrintLn("");

   // f.PrintLn("#define set(t, n, c, d) \\");
   // f.PrintLn("   _set(t, n, c, d) \\");
   // f.PrintLn("   inline n ## Prop & operator= (n ## Prop & prop) \\");
   // f.PrintLn("   { \\");
   // f.PrintLn("      SELF(c, n); \\");
   // f.PrintLn("      t v = prop; \\");
   // f.PrintLn("      d; \\");
   // f.PrintLn("      return prop; \\");
   // f.PrintLn("   }");
   cppTmpDefinePropSet(g, f, true);
   f.PrintLn("");
   cppTmpDefinePropSet(g, f, false);
   f.PrintLn("");


   // f.PrintLn("#define get(t, n, c, d) inline operator t () const { SELF(c, n); d; }");
   cppTmpDefinePropGet(g, f, true);
   f.PrintLn("");
   cppTmpDefinePropGet(g, f, false);
   f.PrintLn("");


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
}
