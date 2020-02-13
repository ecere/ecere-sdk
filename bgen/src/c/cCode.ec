#include "debug.eh"

import "genC"

const char * indent;
const char * findin;

void cCode(AST out, CGen g)
{
   indent = g.lib.ecereCOM ? "         " : "      ";
   findin = g.lib.ecereCOM ? "app" : "module";

   cInCodeStart(out, g);
   cInCodeGlobalFunctionPointers(out, g);
   cInCodeVirtualMethods(out, g);
   cInCodeMethodFunctionPointers(out, g);
   cInCodeProperties(out, g);

   cInCodeClassPointers(out, g);
   cInCodeVirtualMethodIDs(out, g);
   cInCodeGlobalFunctions(out, g);

   cInCodeInitStart(out, g);
   cInCodeInitClasses(out, g);
   cInCodeInitFunctions(out, g);
   cInCodeInitEnd(out, g);
   if(g.lib.ecereCOM)
      cInCodeThisModule(out, g);
}

static void cInCodeStart(AST out, CGen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   z.concatx("#include \"", g.lib.bindingName, ".h\"", ln);
   z.concatx(ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInCodeGlobalFunctionPointers(AST out, CGen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   IterNamespace ns { module = g.mod };
   z.concatx("\n// Global Functions Pointers\n", ln);
   while(ns.next())
   {
      GlobalFunction fn; IterFunction func { ns.ns, list = g.options.functionList };
      while((fn = func.next()))
      {
         BFunction f = fn;
         if(!f.skip && !f.isDllExport)
            z.concatx("LIB_EXPORT ", g.sym.globalFunction, " * ", f.foSymbol, ";", ln);
      }
   }
   ns.cleanup();
   z.concatx(ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInCodeVirtualMethods(AST out, CGen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   IterNamespace ns { module = g.mod };
   z.concatx("\n// Virtual Methods\n", ln);
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns, list = g.options.classList };
      while((cl = cla.next(all)))
      {
         if(!cl.templateClass)
         {
            BClass c = cl;
            Method md; IterMethod met { cl };
            bool haveContent = false;
            while((md = met.next(publicOnly)))
            {
               BMethod m = md;
               m.init(md, c);
               z.concatx("LIB_EXPORT ", g_.sym.method, " * ", m.m, ";", ln);
               haveContent = true;
            }
            if(haveContent) z.concatx(ln);
         }
      }
   }
   ns.cleanup();
   z.concatx(ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInCodeMethodFunctionPointers(AST out, CGen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   IterNamespace ns { module = g.mod };
   z.concatx("\n// Methods Function Pointers\n", ln);
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns, list = g.options.classList };
      while((cl = cla.next(all)))
      {
         BClass c = cl;
         if(!cl.templateClass)
         {
            Method md; IterMethod met { cl };
            bool haveContent = false;
            while((md = met.next(publicOnly)))
            {
               // skipping Module::Load and Module::Unload here because we want to use the dllexported methods directly
               if(!g.lib.ecereCOM || !(c.isModule && (!strcmp(md.name, "Load") || !strcmp(md.name, "Unload"))))
               {
                  BMethod m = md;
                  m.init(md, c);
                  if(md.type == normalMethod)
                  {
                     ASTNode node = astFunction(m.s, { type = md.dataType, md = md, cl = cl, m = m, c = c }, { pointer = true }, null);
                     ec2PrintToZedString(z, node, true);
                  }
                  haveContent = true;
               }
            }
            if(haveContent) z.concatx(ln);
         }
      }
   }
   ns.cleanup();
   z.concatx(ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInCodeProperties(AST out, CGen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   IterNamespace ns { module = g.mod };
   z.concatx("\n// Properties\n", ln);
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns, list = g.options.classList };
      while((cl = cla.next(all)))
      {
         BClass c = cl;
         if(!cl.templateClass)
         {
            Property pt; IterProperty prop { cl };
            Property cn; IterConversion conv { cl };
            while((pt = prop.next(publicOnly)))
               out.Add(astProperty(pt, c, _define, false, &c.first, null));
            while((cn = conv.next(publicOnly)))
               out.Add(astProperty(cn, c, _define, false, &c.first, null));
         }
      }
   }
   ns.cleanup();
   z.concatx(ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInCodeClassPointers(AST out, CGen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   IterNamespace ns { module = g.mod };
   z.concatx("\n// Classes\n", ln);
   z.concatx("// bitClass", ln);
   ns.ready();
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns, list = g.options.classList };
      while((cl = cla.next(bitOnly)))
      {
         BClass c = cl;
         if(!c.skip && !cl.templateClass)
         {
            bool skip = c.skipTypeDef/* || c.isUnichar*/ || c.isBool;
            z.concatx(skip ? "// " : "", "LIB_EXPORT ", g_.sym.__class, " * ", c.coSymbol, ";", ln);
         }
      }
   }
   z.concatx("// enumClass", ln);
   ns.ready();
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns, list = g.options.classList };
      while((cl = cla.next(enumOnly)))
      {
         BClass c = cl;
         if(!c.skip && !cl.templateClass)
         {
            bool skip = c.skipTypeDef/* || c.isUnichar*/ || c.isBool;
            z.concatx(skip ? "// " : "", "LIB_EXPORT ", g_.sym.__class, " * ", c.coSymbol, ";", ln);
         }
      }
   }
   z.concatx("// unitClass", ln);
   ns.ready();
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns, list = g.options.classList };
      while((cl = cla.next(unitOnly)))
      {
         BClass c = cl;
         if(!c.skip && !cl.templateClass)
         {
            bool skip = c.skipTypeDef/* || c.isUnichar*/ || c.isBool;
            z.concatx(skip ? "// " : "", "LIB_EXPORT ", g_.sym.__class, " * ", c.coSymbol, ";", ln);
         }
      }
   }
   z.concatx("// systemClass", ln);
   ns.ready();
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns, list = g.options.classList };
      while((cl = cla.next(systemOnly)))
      {
         BClass c = cl;
         if(!c.skip && !cl.templateClass)
         {
            if(!c.isUnInt) // hack?
            {
               bool skip = /*c.skipTypeDef || *//*c.isUnichar || */c.isBool;
               z.concatx(skip ? "// " : "", "LIB_EXPORT ", g_.sym.__class, " * ", c.coSymbol, ";", ln);
            }
         }
      }
   }
   z.concatx("// structClass", ln);
   ns.ready();
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns, list = g.options.classList };
      while((cl = cla.next(structOnly)))
      {
         BClass c = cl;
         if(!c.skip && !cl.templateClass)
         {
            bool skip = c.skipTypeDef || c.isUnichar || c.isBool;
            z.concatx(skip ? "// " : "", "LIB_EXPORT ", g_.sym.__class, " * ", c.coSymbol, ";", ln);
         }
      }
   }
   z.concatx("// noHeadClass", ln);
   ns.ready();
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns, list = g.options.classList };
      while((cl = cla.next(noHeadOnly)))
      {
         BClass c = cl;
         if(!c.skip && !cl.templateClass)
         {
            bool skip = c.skipTypeDef || c.isUnichar || c.isBool;
            z.concatx(skip ? "// " : "", "LIB_EXPORT ", g_.sym.__class, " * ", c.coSymbol, ";", ln);
         }
      }
   }
   z.concatx("// normalClass", ln);
   ns.ready();
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns, list = g.options.classList };
      while((cl = cla.next(normalOnly)))
      {
         BClass c = cl;
         if(!c.skip && !cl.templateClass)
         {
            if(!c.isCharPtr)
            {
               bool skip = c.skipTypeDef || c.isUnichar || c.isBool;
               if(g_.lib.ecere && c.isWindow) skip = true;
               z.concatx(skip ? "// " : "", "LIB_EXPORT ", g_.sym.__class, " * ", c.coSymbol, ";", ln);
            }
         }
      }
   }
   ns.cleanup();
   z.concatx(ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInCodeVirtualMethodIDs(AST out, CGen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   IterNamespace ns { module = g.mod };
   z.concatx("\n// Virtual Method IDs\n", ln);
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns, list = g.options.classList };
      while((cl = cla.next(all)))
      {
         BClass c = cl;
         if(!cl.templateClass)
         {
            Method md; IterMethod met { cl };
            bool haveContent = false;
            while((md = met.next(publicVirtual)))
            {
               BMethod m = md;
               m.init(md, c);
               z.concatx("LIB_EXPORT int ", m.v, ";", ln);
               haveContent = true;
            }
            if(haveContent) z.concatx(ln);
         }
      }
   }
   ns.cleanup();
   z.concatx(ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInCodeGlobalFunctions(AST out, CGen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   IterNamespace ns { module = g.mod };
   z.concatx("\n// Global Functions\n", ln);
   while(ns.next())
   {
      GlobalFunction fn; IterFunction func { ns.ns, list = g.options.functionList };
      while((fn = func.next()))
      {
         BFunction f = fn;
         if(!f.skip && !f.isDllExport)
         {
            ASTNode node = astFunction(f.oname, { type = fn.dataType, fn = fn }, { pointer = true }, null);
            ec2PrintToZedString(z, node, true);
         }
      }
   }
   ns.cleanup();
   z.concatx(ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInCodeInitClasses(AST out, CGen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   IterNamespace ns { module = g.mod };
   while(ns.next())
   {
      Class cl; IterClass cla { ns.ns, list = g.options.classList };
      while((cl = cla.next(all)))
      {
         bool content = false;
         BClass c = cl;
         if(!cl.templateClass && !c.skip &&
               !c.isBool && !c.isByte && !c.isCharPtr && !c.isUnInt) //!c.is_class) // !c.isString?
         {
            IterMethod met { cl };
            z.concatx(indent, c.coSymbol, " = eC_findClass(", findin, ", \"", cl.name, "\");", ln);
            if(met.next(publicOnly))
               content = true;
            else
            {
               IterProperty prop { cl };
               if(prop.next(publicOnly))
                  content = true;
               else
               {
                  IterConversion conv { cl };
                  if(conv.next(publicOnly))
                     content = true;
               }
            }
            if(content)
            {
               z.concatx(indent, "if(", c.coSymbol, ")", ln);
               z.concatx(indent, "{", ln);
            }
         }
         if(content)
         {
            Method md; IterMethod met { cl };
            Property pt; IterProperty prop { cl };
            Property cn; IterConversion conv { cl };
            while((md = met.next(publicOnly)))
            {
               if(brokenMethodsC.Find({ cl.name, md.name }))
                  continue;
               // skipping Module::Load and Module::Unload here because we want to use the dllexported methods directly
               if(!g.lib.ecereCOM || !(c.isModule && (!strcmp(md.name, "Load") || !strcmp(md.name, "Unload"))))
               {
                  BMethod m = md;
                  m.init(md, c);
                  if(!c.first)
                     z.concatx(ln);
                  else
                     c.first = false;
                  z.concatx(indent, "   ", m.m, " = Class_findMethod(", c.coSymbol, ", \"", md.name, "\", ", findin, ");", ln);
                  z.concatx(indent, "   if(", m.m, ")", ln);
                  if(md.type == normalMethod)
                  {
                     z.concatx(indent, "      ", m.s, " = (");
                     {
                        ASTNode node = astFunction(null, { type = md.dataType, md = md, cl = cl }, { pointer = true, anonymous = true }, null);
                        ec2PrintToZedString(z, node, true);
                        z.len -= 2;
                     }
                     z.concatx(")", m.m, "->function;", ln);
                  }
                  else
                     z.concatx(indent, "      ", m.v, " = ", m.m, "->vid;", ln);
               }
            }
            while((cn = conv.next(publicOnly)))
            {
               ASTNode node = astProperty(cn, c, assign, false, &c.first, null);
               ec2PrintToZedString(z, node, true);
            }
            while((pt = prop.next(publicOnly)))
            {
               ASTNode node = astProperty(pt, c, assign, false, &c.first, null);
               ec2PrintToZedString(z, node, true);
            }
            z.concatx(indent, "}", ln);
         }
      }
   }
   ns.cleanup();
   z.concatx(ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInCodeInitFunctions(AST out, CGen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   IterNamespace ns { module = g.mod };
   z.concatx(ln);
   z.concatx("         // Set up all the function pointers, ...", ln);
   while(ns.next())
   {
      GlobalFunction fn; IterFunction func { ns.ns, list = g.options.functionList };
      while((fn = func.next()))
      {
         BFunction f = fn;
         if(!f.skip && !f.isDllExport)
         {
            z.concatx(ln);
            z.concatx(indent, f.foSymbol, " = eC_findFunction(", findin, ", \"", f.fname, "\");", ln);
            z.concatx(indent, "if(", f.foSymbol, ")", ln);
            z.concatx(indent, "   ", f.oname, " = (void *)", f.foSymbol, "->function;", ln);
         }
      }
   }
   ns.cleanup();
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInCodeInitStart(AST out, CGen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   if(g.lib.ecereCOM)
   {
      z.concatx(g_.sym.module, " theEcereModule;", ln);

      z.concatx("LIB_EXPORT ", g.sym.application, " ", g.lib.bindingName,
            "_init(", g_.sym.module, " fromModule, bool loadEcere, bool guiApp, int argc, char * argv[])", ln);
      z.concatx("{", ln);
      z.concatx("#ifdef _DEBUG", ln);
      z.concatx("   printf(\"%s_init\\n\", \"", g.lib.bindingName, "\");", ln);
      z.concatx("#endif", ln, ln);
      z.concatx("   if(!fromModule)", ln);
      z.concatx("   {", ln);
      z.concatx("      fromModule = eC_initApp(guiApp, argc, argv);", ln);
      z.concatx("      if(fromModule) fromModule->_refCount++;", ln);
      z.concatx("   }", ln);
      z.concatx("   __thisModule = fromModule;", ln);
      z.concatx("   if(fromModule)", ln);
      z.concatx("   {", ln);
      z.concatx("      ", g_.sym.module, " app = fromModule;", ln);
      z.concatx("      ", g_.sym.module, " module = Module_load(fromModule, loadEcere ? \"ecere\" : \"ecereCOM\", ", _publicAccess, ");", ln);
      z.concatx("      if(module)", ln);
      z.concatx("      {", ln);
   }
   else
   {
      z.concatx("LIB_EXPORT ", g_.sym.module, " ", g.lib.bindingName, "_init(", g_.sym.module, " fromModule)", ln);
      z.concatx("{", ln);
      if(g.lib.ecere)
         z.concatx("   ", g_.sym.module, " module = fromModule;", ln);
      else
         z.concatx("   ", g_.sym.module, " module = Module_load(fromModule, ", g_.lib.defineName, "_MODULE_NAME, ", _publicAccess, ");", ln);
      z.concatx(ln);
      z.concatx("#ifdef _DEBUG", ln);
      z.concatx("   printf(\"%s_init\\n\", \"", g.lib.bindingName, "\");", ln);
      z.concatx("#endif", ln, ln);
      z.concatx("   if(module)", ln);
      z.concatx("   {", ln);
   }
   z.concatx(indent, "// Set up all the CO(x) *, property, method, ...", ln);
   z.concatx(ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInCodeInitEnd(AST out, CGen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   if(g.lib.ecereCOM)
      z.concatx("      }", ln);
   z.concatx("   }", ln);
   z.concatx("   else", ln);
   if(g.lib.ecereCOM)
      z.concatx("      printf(\"Unable to load eC module: %s\\n\", loadEcere ? \"ecere\" : \"ecereCOM\");", ln);
   else if(g.lib.ecere)
      z.concatx("      printf(\"Unable to load eC module: ecere\\n\");", ln);
   else
      z.concatx("      printf(\"Unable to load eC module: %s\\n\", ", g.lib.defineName, "_MODULE_NAME);", ln);
   if(g.lib.ecereCOM)
      z.concatx("   return fromModule ? IPTR(fromModule, Module)->application : null;", ln);
   else
      z.concatx("   return module;", ln);
   z.concatx("}");
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInCodeThisModule(AST out, CGen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   z.concatx(ln);
   z.concatx(g_.sym.module, " __thisModule;", ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}
