#include "debug.eh"

import "genC"

void cHeader(AST out, CGen g)
{
   if(!python)
   {
      cInHeaderFileComment(out, g);
      cInHeaderProcessSourceFile(out, g, null, ":src/c/c_header_open.src");
      cInHeaderIncludes(out, g);
      cInHeaderModuleName(out, g);
      if(g.preprocess)
         cInHeaderMacrosInclude(out, g);

      if(g.lib.ecereCOM)
      {
         cInHeaderEcereComRuntimeFunctions(out, g);
         if(!g.preprocess)
            cInHeaderProcessSourceFile(out, g, "binding macros", ":src/c/c_header_ec_macros.src");
      }
      else if(g.lib.ecere)
         cInHeaderEcereRuntimeMacros(out, g);
      else if(g.lib.eda)
         cInHeaderEDARuntimeMacros(out, g);

      if(g.lib.ecereCOM)
         cInHeaderProcessSourceFile(out, g, "HARDCODED", ":src/c/c_header_ec_hardcoded.src");
   }
   else
   {
      if(g.lib.ecereCOM)
         cInHeaderProcessSourceFile(out, g, "HARDCODED", ":src/py/cffi_hardcode_ec_begin.src");
   }

   cInHeaderTypes(out, g);

   cInHeaderDynamicLinkFunctionImports(out, g);
   if(g.lib.ecereCOM)
      cInHeaderThisModule(out, g);
   cInHeaderLibraryInitPrototype(out, g);
   if(!python)
      cInHeaderProcessSourceFile(out, g, null, ":src/c/c_header_close.src");
   else
   {
      if(g.lib.ecereCOM)
         cInHeaderProcessSourceFile(out, g, "HARDCODED", ":src/py/cffi_hardcode_ec_end.src");
   }
}

static void cInHeaderTypes(AST out, CGen g)
{
   AVLTree<UIntPtr> nodes { };
   for(nn : g.bmod.orderedNamespaces)
   {
      BNamespace n = nn;
      for(a : n.output)
         out.Add(a);
      if(n.orderedBackwardsOutputs.count)
      {
         if(!python)
            out.Add(ASTRawString { string = CopyString("// start -- moved backwards outputs") });
         for(optr : n.orderedBackwardsOutputs)
         {
            BOutput o = (BOutput)optr;
            for(node : o.output)
            {
               if(!nodes.Find((UIntPtr)node)) // damn it! why is this needed? :S
               {
                  nodes.Add((UIntPtr)node);
                  out.Add(node);
               }
            }
         }
         if(!python)
            out.Add(ASTRawString { string = CopyString("// end -- moved backwards outputs") });
      }
      for(optr : n.orderedOutputs)
      {
         BOutput o = (BOutput)optr;
         if(o.kind == vmanual || o.kind == vdefine || o.kind == vfunction ||
               o.kind == vclass || o.kind == vtemplaton || o.kind == vmethod || o.kind == vproperty)
         {
            for(node : o.output)
            {
               if(!nodes.Find((UIntPtr)node)) // damn it! why is this needed? :S
               {
                  nodes.Add((UIntPtr)node);
                  out.Add(node);
               }
            }
         }
         else conmsg("check");
      }
   }
   delete nodes;
   for(nn : g.bmod.orderedNamespaces)
   {
      BNamespace n = nn;
      for(vv : n.contents)
      {
         BVariant v = vv;
         if(v.kind == vclass && v.c.outClassPointer)
            out.Add(v.c.outClassPointer.output.firstIterator.data);
      }
   }
}

static void cInHeaderProcessSourceFile(AST out, Gen g, const char * comment, const char * pathToFile)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   if(comment && !python)
      bigCommentSection(z, comment);
   sourceFileProcessToZedString(z, pathToFile, g.sourceProcessorVars, python, false);
   // z.len--;
   if(z._string[z.len-1] == '\n');
      z._string[z.len-1] = 0;
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInHeaderFileComment(AST out, Gen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   if(g.lib.ecereCOM)
      bigCommentLibrary(z, "Core eC Library");
   else
      bigCommentLibrary(z, (s = PrintString(g.lib.moduleName, " Module"))), delete s;
   raw.string = CopyString(z._string); delete z;
   s = g.lib.ecereCOM ? CopyString("//// Core eC Library") : PrintString("//// ", g.lib.moduleName, " Module");
   out.Add(raw);
}

static void cInHeaderIncludes(AST out, Gen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   bigCommentSection(z, "includes");
   if(g.lib.ecereCOM)
   {
      z.concatx(g.preproLimiter, "#include <stdio.h>", ln);
      z.concatx(g.preproLimiter, "#include <stdint.h>", ln);
      z.concatx(g.preproLimiter, "#include <stdarg.h>", ln);
      z.concatx(g.preproLimiter, "#include <string.h>", ln);
   }
   else
   {
      for(libDep : g.libDeps)
         z.concatx(g.preproLimiter, "#include \"", libDep.bindingName, ".h\"", ln);
      if(!strcmp(g.lib.moduleName, "gnosis3")) // hack, todo
      {
         z.concatx(g.preproLimiter, "#include \"roadpath.h\"", ln);
         z.concatx(g.preproLimiter, "#include \"fontmanager.h\"", ln);
      }
   }
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInHeaderModuleName(AST out, CGen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   z.concatx(ln);
   if(!g.lib.ecere && !g.lib.ecereCOM)
   {
      z.concatx(g.preproLimiter, "#if !defined(", g.lib.defineName, "_MODULE_NAME)", ln);
      z.concatx(g.preproLimiter, "#define ", g.lib.defineName, "_MODULE_NAME \"", g.lib.ecereCOM ? "ecere" : g.lib.loadModuleName, "\"", ln);
      z.concatx(g.preproLimiter, "#endif", ln);
   }
   if(g.lib.ecereCOM)
   {
      z.concatx(ln);
      z.concatx(g.preproLimiter, "#if !defined(BINDINGS_SHARED)", ln);
      z.concatx(g.preproLimiter, "#define LIB_EXPORT", ln);
      z.concatx(g.preproLimiter, "#define LIB_IMPORT", ln);
      z.concatx(g.preproLimiter, "#elif defined(__WIN32__)", ln);
      z.concatx(g.preproLimiter, "#define LIB_EXPORT __attribute__((dllexport)) __attribute__ ((visibility(\"default\")))", ln);
      z.concatx(g.preproLimiter, "#define LIB_IMPORT __attribute__((dllimport))", ln);
      z.concatx(g.preproLimiter, "#else", ln);
      z.concatx(g.preproLimiter, "#define LIB_EXPORT __attribute__ ((visibility(\"default\")))", ln);
      z.concatx(g.preproLimiter, "#define LIB_IMPORT", ln);
      z.concatx(g.preproLimiter, "#endif", ln);
   }
   z.concatx(ln);
   z.concatx(g.preproLimiter, "#undef THIS_LIB_IMPORT", ln);
   z.concatx(g.preproLimiter, "#ifdef ", g.lib.defineName, "_EXPORT", ln);
   z.concatx(g.preproLimiter, "#define THIS_LIB_IMPORT LIB_EXPORT", ln);
   z.concatx(g.preproLimiter, "#elif defined(BINDINGS_SHARED)", ln);
   z.concatx(g.preproLimiter, "#define THIS_LIB_IMPORT LIB_IMPORT", ln);
   z.concatx(g.preproLimiter, "#else", ln);
   z.concatx(g.preproLimiter, "#define THIS_LIB_IMPORT", ln);
   z.concatx(g.preproLimiter, "#endif", ln);

   z.concatx(ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInHeaderMacrosInclude(AST out, Gen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   z.concatx("#include \"eC-bind.h\"", ln);
   z.concatx(ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInHeaderEcereComRuntimeFunctions(AST out, Gen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   IterNamespace ns { module = g.mod };
   bigCommentSection(z, "functions");
   while(ns.next())
   {
      GlobalFunction fn; IterFunction func { ns.ns, list = g.options.functionList };
      while((fn = func.next()))
      {
         BFunction f = fn;
         if(f.isDllExport/* && !skipFunctionTree.Find(fname)*/)
         {
            if(f.easy)
               z.concatx("#define ", f.easy, spaces(cw, strlen(f.easy)), " ", f.gname, ln);
            else
            {
               char * s = getFunctionNameThing(f);
               z.concatx("#define ", s, spaces(cw, strlen(s)), " ", f.gname, ln);
            }
         }
      }
   }
   ns.cleanup();
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

char * getFunctionNameThing(BFunction f)
{
   char * s = null;
   strcpySubstring(f.fname, "eSystem", "eC");
   {
      //if(module is ecere/ecereCOM)
      s = strstr(f.fname, "_");
      if(s && *(++s))
         *s = (char)tolower(*s);
      //endif
      s = f.fname;
      if(*f.fname == 'e'/* && module is ecere/ecereCOM*/)
      {
         if(
               strstr(f.fname, "eInstance_") == f.fname ||
               strstr(f.fname, "eClass_") == f.fname ||
               strstr(f.fname, "eModule_") == f.fname ||
               strstr(f.fname, "eEnum_") == f.fname ||
               strstr(f.fname, "eMember_") == f.fname ||
               strstr(f.fname, "eProperty_") == f.fname
         )
            s++;
         else if(strstr(f.fname, "eC_") == f.fname)
            ;
         else conmsg("check");
      }
      else/* if(module is ecere/ecereCOM)*/
         *s = (char)tolower(*s);
   }
   return s;
}

static void cInHeaderEcereRuntimeMacros(AST out, Gen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   z.concatx(g.preproLimiter, "#define ", g.lib.defineName, "_APP_INTRO(c)", g.linejoinLimiter, ln);
   z.concatx("      APP_INTRO(true)", g.linejoinLimiter, ln);
   z.concatx("      ", g.lib.moduleName, "_init(app);", g.linejoinLimiter, ln);
   z.concatx("      loadTranslatedStrings(null, MODULE_NAME);", g.linejoinLimiter, ln);
   z.concatx("      Instance_evolve(&app, class_ ## c);", ln);
   z.concatx(ln);
   z.concatx(g.preproLimiter, "#define ", g.lib.defineName, "_APP_OUTRO", g.linejoinLimiter, ln);
   z.concatx("      unloadTranslatedStrings(MODULE_NAME);", g.linejoinLimiter, ln);
   z.concatx("      APP_OUTRO", ln);
   z.concatx(ln);
   z.concatx(g.preproLimiter, "#define GUIAPP_INTRO ", g.lib.defineName, "_APP_INTRO(GuiApplication)", ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInHeaderEDARuntimeMacros(AST out, Gen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   z.concatx(g.preproLimiter, "#define EDA_APP_INTRO(c)", g.linejoinLimiter, ln);
   z.concatx("      APP_INTRO(true)", g.linejoinLimiter, ln);
   z.concatx("      ecere_init(app);", g.linejoinLimiter, ln);
   z.concatx("      EDA_init(app);", g.linejoinLimiter, ln);
   z.concatx("      loadTranslatedStrings(null, MODULE_NAME);", g.linejoinLimiter, ln);
   z.concatx("      Instance_evolve(&app, class_ ## c);", ln);
   z.concatx(ln);
   z.concatx(g.preproLimiter, "#define EDA_GUIAPP_INTRO EDA_APP_INTRO(GuiApplication)", ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInHeaderLibraryInitPrototype(AST out, Gen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   if(g.lib.ecereCOM)
      z.concatx("extern ", !python ? "THIS_LIB_IMPORT " : "", g_.sym.application, " ", g.lib.bindingName, "_init(", g_.sym.module, " fromModule, bool loadEcere, bool guiApp, int argc, char * argv[]);", ln);
   else
      z.concatx("extern ", !python ? "THIS_LIB_IMPORT " : "", g_.sym.module, " ", g.lib.bindingName, "_init(", g_.sym.module, " fromModule);", ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInHeaderDynamicLinkFunctionImports(AST out, Gen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   bool prefixed = false;
   IterNamespace ns { module = g.mod };
   while(ns.next())
   {
      GlobalFunction fn; IterFunction func { ns.ns, list = g.options.functionList };
      while((fn = func.next()))
      {
         BFunction f = fn;
         if(!prefixed && f.isDllExport)
         {
            z.concatx(ln);
            bigCommentSection(z, "dll function imports");
            z.concatx(ln);
            prefixed = true;
         }
         if(f.isDllExport)
         {
            const char * fname = !python ? f.gname : f.easy ? f.easy : getFunctionNameThing(f);
            ASTNode node = astFunction(fname, { type = fn.dataType, fn = fn }, { _extern = true, _dllimport = true }, null);
            ec2PrintToZedString(z, node, true);
         }
      }
   }
   ns.cleanup();
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}

static void cInHeaderThisModule(AST out, Gen g)
{
   ASTRawString raw { }; ZString z { allocType = heap };
   z.concatx("extern ", g_.sym.module, " __thisModule;", ln);
   raw.string = CopyString(z._string); delete z;
   out.Add(raw);
}
