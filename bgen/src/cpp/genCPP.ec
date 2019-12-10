#include "debug.eh"
#include "bgen.eh"

import "bgen"
import "cppHardcoded"

static AVLTree<consttstr> skipClasses
{ [
   { "eC", "CIString" },         // Errors with bases String class
   { "eC", "Window" },           // Dependency on Window
   { "eC", "ClassDesignerBase" },// Dependency on Window
   { "eC", "DesignerBase" }      // Dependency on Window
] };

class CPPGen : CGen
{
   char * cppFileName;
   char * cppFilePath;
   char * hppFileName;
   char * hppFilePath;

   MacroOptBits macroBits;
   BClass cInstance;
   BClass cclass;

   lang = CPlusPlus;
   //macroBits.all = bypass;

   bool init()
   {
      bool result = false;
      if(Gen::init() && readyDir())
      {
         prepPaths(true);

         if(FileExists(cppFilePath))
            DeleteFile(cppFilePath);
         if(FileExists(hppFilePath))
            DeleteFile(hppFilePath);

         if(!FileExists(cppFilePath) && !FileExists(hppFilePath))
         {
            reset();

            if(moduleInit())
               result = true;
         }
      }
      if(options.bypassMacros)
         macroBits.all = bypass;
      return result;
   }

   void process()
   {
      {
         Class cl = eSystem_FindClass(mod, "Instance");
         if(cl == null)
            PrintLn("problem");
         cInstance = cl;
         cclass = cl.base;
      }
      prepareNamespaces(); // just a test now, remove later
      processNamespaces();
      bmod.applyDependencies();
      for(n : bmod.orderedNamespaces)
         n.positionOutput(this);
      bmod.sort();
      bmod.moveBackwardsDependencies();
      for(n : bmod.orderedNamespaces)
         n.sort();
   }

   void prepareNamespaces()
   {
      IterNamespace ns { module = mod, processFullName = true };
      while(ns.next())
      {
         BNamespace n = (NameSpacePtr)ns.ns;
         if(!bmod.root_nspace)
         {
            bmod.root_nspace = (NameSpacePtr)ns.ns;
         }
         prepareClasses(n);
         bmod.orderedNamespaces.Add(n);
      }
      ns.cleanup();
   }

   void prepareClasses(BNamespace n)
   {
      BClass c; IterClass itc { n.ns, list = options.classList };
      while((c = itc.next(all)))
      {
         bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString || c.cl.type == systemClass;
         if(g_.lib.ecereCOM && skipClasses.Find({ g_.lib.bindingName, c.name }))
            skip = true;
         if(!skip && !c.cl.templateClass)
            //processCppClass(this, c);
         {
            BClass cBase = c.cl.base.templateClass ? c.cl.base.templateClass : c.cl.base;
            if(c.isInstance)
            {
               //cInstance = c;
               //cclass = cBase;
               if(c == cInstance && c.cl == cInstance.cl && cBase == cclass && cBase.cl == cclass.cl)
                  ;
               else
                  PrintLn("dddddd");
            }
         }
      }
   }

   void processNamespaces()
   {
      IterNamespace ns { module = mod, processFullName = true };
      while(ns.next())
      {
         BNamespace n = (NameSpacePtr)ns.ns;
         /*if(!bmod.root_nspace)
         {
            bmod.root_nspace = (NameSpacePtr)ns.ns;
         }*/
         //processDefines(n);
         //if(lib.ecereCOM && ns.ns->parent == null && ns.ns->name == null)
         //   manualTypes(n);
         processClasses(n);
         //processOptionalClasses(n);
         //processFunctions(n);
      }
      processTemplatons();
      ns.cleanup();
   }

   void processClasses(BNamespace n)
   {
      BClass c; IterClass itc { n.ns, list = options.classList };
      while((c = itc.next(all)))
      {
         bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString || c.cl.type == systemClass;
         if(g_.lib.ecereCOM && skipClasses.Find({ g_.lib.bindingName, c.name }))
            skip = true;
         if(!skip && !c.cl.templateClass && c.cl.type == normalClass)   // TODO: Only doing normal classes for now... || c.cl.type == noHeadClass
         {

            processCppClass(this, c);
         }
         // else { typedef C(Modifiers) Modifiers; }
      }
   }

   void generate()
   {
      File f;
      f = FileOpen(hppFilePath, write);
      if(f)
      {
         generateHPP(this, f);
         delete f;
      }
      f = FileOpen(cppFilePath, write);
      if(f)
      {
         generateCPP(this, f);
         delete f;
      }
      {
         char * cppFilePathTmp = cppFilePath;
         char * hppFilePathTmp = hppFilePath;
         cppFilePath = null;
         hppFilePath = null;
         prepPaths(false);
         if(FileExists(cppFilePath))
            DeleteFile(cppFilePath);
         if(FileExists(hppFilePath))
            DeleteFile(hppFilePath);
         MoveFile(cppFilePathTmp, cppFilePath);
         MoveFile(hppFilePathTmp, hppFilePath);
         delete cppFilePathTmp;
         delete hppFilePathTmp;
      }
   }

   void printOutputFiles()
   {
      if(!quiet)
      {
         PrintLn(lib.verbose > 1 ? "    " : "", cppFileName);
         PrintLn(lib.verbose > 1 ? "    " : "", hppFileName);
      }
   }

   void prepPaths(bool tmp)
   {
      int len;
      char * name = new char[MAX_LOCATION];
      char * path = new char[MAX_LOCATION];
      strcpy(path, dir);
      len = strlen(path);
      strcpy(name, lib.bindingName);
      ChangeExtension(name, "cpp", name);
      PathCatSlash(path, name);
      if(tmp) strcat(path, ".tmp");
      delete cppFileName; cppFileName = CopyString(name);
      delete cppFilePath; cppFilePath = CopyString(path);
      ChangeExtension(name, "hpp", name);
      path[len] = 0;
      PathCatSlash(path, name);
      if(tmp) strcat(path, ".tmp");
      delete hppFileName; hppFileName = CopyString(name);
      delete hppFilePath; hppFilePath = CopyString(path);
      delete name;
      delete path;
   }

   char * allocMacroSymbolName(const bool noMacro, const MacroType type, const TypeInfo ti, const char * name, const char * name2, int ptr)
   {
      switch(type)
      {
         case C:
            if(noMacro)    return                CopyString(name);
            if((ti.c && ti.c.isBool) ||
                  (ti.c && ti.c.cl.type == normalClass) ||
                  (ti.cl && ti.cl.type == normalClass))
                           return                CopyString(name);
                           return PrintString(       "C(" , name, ")");
         case CM:          return PrintString(       "CM(", name, ")");
         case CO:          return PrintString(       "CO(", name, ")");
         case SUBCLASS:    return PrintString( "subclass(", name, ")");
         case THISCLASS:   return PrintString("thisclass(", name, ptr ? " *" : "", ")");
         case T:           return getTemplateClassSymbol(   name, false);
         case TP:          return PrintString(       "TP(", name, ", ", name2, ")");
         case METHOD:      return PrintString(   "METHOD(", name, ", ", name2, ")");
         case PROPERTY:    return PrintString( "PROPERTY(", name, ", ", name2, ")");
         case FUNCTION:    return PrintString( "FUNCTION(", name, ")");
         case M_VTBLID:    return PrintString( "M_VTBLID(", name, ", ", name2, ")");
      }
      return CopyString(name);
   }

   void reset()
   {
      ec1terminate();
   }

   ~CPPGen()
   {
      delete cppFileName;
      delete hppFileName;
   }
}

static void generateHPP(CPPGen g, File f)
{
   cppHeaderStart(g, f);
   if(g.lib.ecereCOM)
      cppHardcodedCore(g, f);
   if(g.lib.ecereCOM)
      predefineHackClasses(g, f);
   predefineClasses(g, f);

   f.PrintLn("void ", g.lib.bindingName, "_cpp_init(Module & module);");
   f.PrintLn("");

   outputContents(g, f);
   cppHeaderEnd(g, f);
}

void predefineHackClasses(CPPGen g, File f)
{
   f.PrintLn("");
   for(name : tmpcppececeremess)
   {
      f.PrintLn("class ", name, ";");
   }
}

void predefineClasses(CPPGen g, File f)
{
   BClass c; IterAllClass itacl { itn.module = g.mod/*module = g.mod*/ };
   f.PrintLn("");
   while((c = itacl.next(all)))
   {
      bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString || c.cl.type == systemClass;
      if(g.lib.ecereCOM && (c.isSurface || /*c.isIOChannel || */c.isWindow || c.isDataBox))
         ; //locprintx("if(g.lib.ecereCOM && (c.isSurface || /*c.isIOChannel || */c.isWindow || c.isDataBox))");
      if(g.lib.ecereCOM && skipClasses.Find({ g_.lib.bindingName, c.name }))
         skip = true;
      if(!skip && !c.cl.templateClass)
         f.PrintLn("class ", c.name, ";");
   }
   f.PrintLn("");
}

static void generateCPP(CPPGen g, File f)
{
   Class firstClass = null;
   f.PrintLn("#include \"", g.lib.bindingName, ".hpp\"");
   f.PrintLn("");
   {
      BClass c; IterAllClass itacl { itn.module = g.mod/*module = g.mod*/ };
      while((c = itacl.next(all)))
      {
         bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString || c.cl.type == systemClass;
         if(g_.lib.ecereCOM && skipClasses.Find({ g_.lib.bindingName, c.name }))
            skip = true;
         if(!skip && c.cl.type == normalClass && !c.cl.templateClass)
         {
            firstClass = c.cl;
            f.PrintLn("TCPPClass<", c.cl.name, "> ", c.cl.name, "::_class;");
         }
      }
   }
   f.PrintLn("");
   f.PrintLn("void ", g.lib.bindingName /*name*/, "_cpp_init(Module & module)");
   f.PrintLn("{");
   f.PrintLn("   if(!", firstClass.name, "::_class.impl)");
   f.PrintLn("   {");
   {
      BClass c; IterAllClass itacl { itn.module = g.mod/*module = g.mod*/ };
      while((c = itacl.next(all)))
      {
         bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString || c.cl.type == systemClass;
         if(g.lib.ecereCOM && skipClasses.Find({ g_.lib.bindingName, c.name }))
            skip = true;
         if(!skip && c.cl.type == normalClass && !c.cl.templateClass)
            f.PrintLn("      REGISTER_CPP_CLASS(", c.cl.name, ", module);");
      }
   }
   f.PrintLn("   }");
   f.PrintLn("}");
   //if(g.lib.ecere) // hardcoded

   if(g.lib.ecereCOM) // hardcoded
   {
      f.PrintLn("");
      f.PrintLn("// Instance methods depending on libecere");
      f.PrintLn("void Instance::class_registration(CPPClass & _class) { Instance_class_registration(Instance); }");
      //f.PrintLn("void FontResource::class_registration(CPPClass & _class) { Instance_class_registration(FontResource); }");
   }
}

// TODO: Get rid of this non-sense...
Map<consttstr, const String> methodParamNameSwap { [
   //{ { "onCompare", "object" }, "o2" },
  // { { "onCopy", "newData" }, "src" },
   { { "delete", "i" }, "it" },
   { { "releaseSurface", "this" }, null },
   { { "process", "c" }, null },
   { { null, null }, null }
] };

Map<const String, const String> methodTypedObjectThisNameSwap { [
  // { "onCopy", "dest" },
   { null, null }
] };


static void processCppClass(CPPGen g, BClass c)
{
   bool skip = false;
   if(!skip)
   {
      int l, nameLen = 0;
      //bool content = false;
      //const char * lc = " \\";
      BVariant v = c;
      BNamespace n = c.nspace;
      // todo tofix tocheck tmp? skip to template class name for derrivation
      BClass cBase = c.cl.base.templateClass ? c.cl.base.templateClass : c.cl.base;
      BOutput o { vclass, c = c, z = { allocType = heap } };
      BMethod m; IterMethod itm { c.isInstance ? cBase.cl : c.cl };
      //const char * sn = c.symbolName;
      const char * cn = c.name;
      const char * bn = cBase ? cBase.name : "";
      const char * un = c.upper;
      bool hasBase = cBase && cBase.cl.type != systemClass;
      bool ptDmPrinted = false;

      bool isBaseString = false;
      if(!strcmp(cBase.name, "String"))
         isBaseString = true;
      else if(cBase.clBase && !strcmp(cBase.clBase.name, "String"))
         isBaseString = true;

      c.outTypedef = o;
      n.contents.Add(v);
      if(hasBase)
         v.processDependency(otypedef, otypedef, cBase.cl);

      /*switch(c.cl.type)
      {
         case normalClass:  processNormalClass(g, c, v, n, o); break;
         case structClass:
         case bitClass:
         case unitClass:
         case enumClass:
         case noHeadClass:
         case systemClass:
      }*/

      while((m = itm.next(publicVirtual))) { m.init(itm.md, c.isInstance ? cBase : c); if((l = strlen(m.mname)) > nameLen) nameLen = l;}

      if(c.isInstance)
      {
         o.z.concatx(ln);
         while((m = itm.next(publicVirtual)))
         {
            const char * cn = c.name, * bn = cBase.name, * mn = m.mname;
            o.z.concatx("#define ", cn, "_", mn, "_vTblID", spaces(nameLen, strlen(mn)), " ", bn, "_", mn, "_vTblID", ln);
         }
      }

      if(!(g.lib.ecereCOM && (c.isSurface || /*c.isIOChannel || */c.isWindow || c.isDataBox)))
      {
         if(g.macroBits.registerClassDef == use)
            cppDefineMacroClassRegistration(g, o.z, 0, c, cBase, v, 0);

         if(g.macroBits.virtualMethod == use)
            cppMacroClassVirtualMethods(g, o.z, def, 0, un, "c", c, cBase, v, 0);
      }

      o.z.concatx(ln, genloc__, "class ", cn);
      if(!(g.lib.ecereCOM && (c.isSurface || /*c.isIOChannel || */c.isWindow || c.isDataBox)))
      {
         if(cBase && cBase.cl.type != systemClass)
         {
            if(isBaseString)
               o.z.concatx(" : public ", "Instance");
            else
               o.z.concatx(" : public ", bn);

         }
         o.z.concatx(ln, genloc__, "{", ln, genloc__, "public:", ln);
         if(c.isInstance)
            cppHardcodedInstance(o);
         else if(c.isModule)
            cppHardcodedModule(o);
         else
         {
            Property pt; IterProperty prop { c };
            DataMember dm; IterDataMember dat { c };

            MacroMode mode = use;
            if(isBaseString)
               cppMacroConstructClass(g, o.z, mode, 1, cn, "Instance", 0);
            else
               cppMacroConstructClass(g, o.z, mode, 1, cn, bn, 0);
            if(mode != bypass)
            {
               if(!strcmp(cn, "Application"))
               {
                  o.z.concatx(ln, genloc__, indents(1), "{", ln);
                  o.z.concatx(genloc__, indents(2), "eC_cpp_init(*this);", ln);
                  o.z.concatx(genloc__, indents(2), "_INSTANCE(impl, impl->_class) = this;", ln);
                  o.z.concatx(genloc__, indents(2), "vTbl = _class.vTbl;", ln);
                  o.z.concatx(genloc__, indents(2), "__thisModule = impl;", ln);
                  o.z.concatx(genloc__, indents(1), "}", ln);
               }
               else
                  o.z.concatx(genloc__, " { }", ln);
            }

            o.z.concatx(genloc__, ln, indents(1), un, "_VIRTUAL_METHODS(", c.name, ")", ln);
            //o.z.concatx(ln, genloc__, indents(0));
            //cppMacroClassRegister(g, o.z, mode, 1, 0);
            //o.z.concatx(" { }", ln);
            /*
            if(mode == bypass)
               o.z.concatx(ln, genloc__, indents(0));
            else o.z.concatx(" ");
            o.z.concatx("{");
            if(mode == bypass)
               o.z.concatx(ln, genloc__, indents(0));
            else o.z.concatx(" ");
            cppMacroClassRegistration(g, o.z, mode, 1, c, cBase, 0);
            if(mode == bypass)
               o.z.concatx(ln, genloc__, indents(0));
            else o.z.concatx(" ");
            o.z.concatx("}", ln);*/

            // o.z.concatx("   CONSTRUCT(", cn, ", ", bn, ") { }", ln);

            // Class Registration
            o.z.concatx("   REGISTER() { ", cn, "_class_registration(", cn, ");", " }", ln);

            // Properties
            while((pt = prop.next(publicOnly)))
            {
               // TOCHECK: How should this be handled?
               if(!strcmp(pt.name, "borderStyle"))
                  PrintLn("");
               if(!pt.dataType)
               {
                  Context context = SetupTemplatesContext(c); // TOCHECK: Should we do this only once while we process the whole class?
                  pt.dataType = ProcessTypeString(pt.dataTypeString, false);
                  FinishTemplatesContext(context);
               }

               // TODO: Fix types for classes...
               if(pt.dataType.kind != classType && pt.dataType.kind != templateType)
               {
                  TypeInfo ti { type = pt.dataType };
                  ClassType ct = cppGetClassInfoFromType(ti.type, null, null, null);
                  String tn;
                  ZString sg { allocType = heap };

                  if(ct == normalClass)
                  {
                     tn = cppTypeName(ti, true);
                     //v.processDependency(otypedef, otypedef, pt.dataType._class.registered);
                  }
                  else
                     tn = cppTypeName(ti, false);

                  sg.copy("");


                  if(eClass_FindDataMember(c.cl, pt.name, c.cl.module, null, null) || strstr(pt.name, "__ecerePrivateData"))
                  {

                     if(pt.Set)
                        sg.concatx(" setProto(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v);)");
                     else
                        sg.concatx(" setProto(", tn, ", ", pt.name, ", ", cn, ", ", "IPTR(self->impl, ", cn, ")->", pt.name, " = v;)");
                     if(pt.Get)
                     {
                        if(ct == normalClass)
                           sg.concatx(" getProto(", tn, ", ", pt.name, ", ", cn, ", ", tn, " value(", cn, "_get_", pt.name, "(self->impl), ", cn, "::_class); ", "return value;)");
                        else
                           sg.concatx(" getProto(", tn, ", ", pt.name, ", ", cn, ", return ", cn, "_get_", pt.name, "(self->impl);)");
                     }
                     else
                     {
                        if(ct == normalClass)
                           sg.concatx(" getProto(", tn, ", ", pt.name, ", ", cn, ", ", "self ? ", tn, " value(IPTR(self->impl, ", cn, ")->", pt.name, ", ", cn, "::_class); ", "return value; ", " : 0;)");
                        else
                           sg.concatx(" getProto(", tn, ", ", pt.name, ", ", cn, ", return self ? IPTR(self->impl, ", cn, ")->", pt.name, " : 0;)");
                     }

                  }
                  else
                  {
                     if(pt.Set && pt.Get)
                        sg.concatx(" setProto(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v);)");
                     else if(pt.Set && !pt.Get)
                        sg.concatx(" _setProto(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v);)");
                     if(pt.Get)
                     {
                        if(ct == normalClass)
                           sg.concatx(" getProto(", tn, ", ", pt.name, ", ", cn, ", ", tn, " value(", cn, "_get_", pt.name, "(self->impl), ", cn, "::_class); ", "return value;)");
                        else
                           sg.concatx(" getProto(", tn, ", ", pt.name, ", ", cn, ", return ", cn, "_get_", pt.name, "(self->impl);)");
                     }
                  }
                  if(!strcmp(pt.name, "stringValue"))
                     PrintLn("");
                  //cppTypeName(ti, false);
                  cppMacroProperty(g, o.z, use, 1, pt.name, sg._string, null, true);

                  delete tn;
                  delete sg;
               }
               else if(pt.dataType.kind == classType)
               {
                  TypeInfo ti { type = pt.dataType };
                  ClassType ct = cppGetClassInfoFromType(ti.type, null, null, null);
                  String tn;
                  ZString sg { allocType = heap };

                  if(ct == normalClass)
                  {
                     tn = cppTypeName(ti, true);
                     //v.processDependency(otypedef, otypedef, pt.dataType._class.registered);
                  }
                  else
                     tn = cppTypeName(ti, false);
                  sg.copy("");

                  if(eClass_FindDataMember(c.cl, pt.name, c.cl.module, null, null) || strstr(pt.name, "__ecerePrivateData"))
                  {

                     if(pt.Set)
                     {
                        if(ct == structClass)
                           sg.concatx(" setProto(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, &v);)");
                        else if(ct == normalClass && strcmp(tn, "constString") && strcmp(tn, "String"))
                           sg.concatx(" setProto(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v.impl);)");
                        else
                           sg.concatx(" setProto(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v);)");
                     }
                     else
                        sg.concatx(" setProto(", tn, ", ", pt.name, ", ", cn, ", ", "IPTR(self->impl, ", cn, ")->", pt.name, " = v;)");
                     if(pt.Get)
                     {
                        if(ct == structClass)
                           sg.concatx(" getProto(", tn, ", ", pt.name, ", ", cn, ", ", tn, " value; ", cn, "_get_", pt.name, "(self->impl", ", &value","); ","return value; ", ")");
                        else if(ct == normalClass && strcmp(tn, "constString") && strcmp(tn, "String"))
                           sg.concatx(" getProto(", tn, ", ", pt.name, ", ", cn, ", ", tn, " value(", cn, "_get_", pt.name, "(self->impl), ", cn, "::_class); ", "return value;)");
                        else
                           sg.concatx(" getProto(", tn, ", ", pt.name, ", ", cn, ", return ", cn, "_get_", pt.name, "(self->impl);)");
                     }
                     else
                     {
                        if(ct == normalClass && strcmp(tn, "constString") && strcmp(tn, "String"))
                           sg.concatx(" getProto(", tn, ", ", pt.name, ", ", cn, ", ", "self ? ", tn, " value(IPTR(self->impl, ", cn, ")->", pt.name, ", ", cn, "::_class); ", "return value; ", " : 0;)");
                        else
                           sg.concatx(" getProto(", tn, ", ", pt.name, ", ", cn, ", return self ? IPTR(self->impl, ", cn, ")->", pt.name, " : 0;)");
                     }
                  }
                  else
                  {
                     if(pt.Set && pt.Get)
                     {
                        if(ct == structClass)
                           sg.concatx(" setProto(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, &v);)");
                        else if(ct == normalClass && strcmp(tn, "constString") && strcmp(tn, "String"))
                           sg.concatx(" setProto(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v.impl);)");
                        else
                           sg.concatx(" setProto(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v);)");

                     }
                     else if(pt.Set && !pt.Get)
                     {
                        if(ct == structClass)
                           sg.concatx(" _setProto(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, &v);)");
                        else if(ct == normalClass && strcmp(tn, "constString") && strcmp(tn, "String"))
                           sg.concatx(" _setProto(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v.impl);)");
                        else
                           sg.concatx(" _setProto(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v);)");

                     }
                     if(pt.Get)
                     {
                        if(ct == structClass)
                           sg.concatx(" getProto(", tn, ", ", pt.name, ", ", cn, ", ", tn, " value; ", cn, "_get_", pt.name, "(self->impl", ", &value","); ","return value; ", ")");
                        else if(ct == normalClass && strcmp(tn, "constString") && strcmp(tn, "String"))
                           sg.concatx(" getProto(", tn, ", ", pt.name, ", ", cn, ", ", tn, " value(", cn, "_get_", pt.name, "(self->impl), ", cn, "::_class); ", "return value;)");
                        else
                           sg.concatx(" getProto(", tn, ", ", pt.name, ", ", cn, ", return ", cn, "_get_", pt.name, "(self->impl);)");
                     }
                  }
                  if(!strcmp(pt.name, "stringValue"))
                     PrintLn("");
                  //cppTypeName(ti, false);
                  cppMacroProperty(g, o.z, use, 1, pt.name, sg._string, null, true);

                  delete tn;
                  delete sg;
               }
            }

            // TODO: Non-virtual methods
            // TODO: How to handle data members in C++? Define C++ 'properties' (accessors) for them using property() macro as well?
            while((dm = dat.next(all)))
            {
               BitMember bm = (BitMember)dm;
               if(!dm.dataType)
               {
                  Context context = SetupTemplatesContext(c);
                  dm.dataType = ProcessTypeString(dm.dataTypeString, false);
                  FinishTemplatesContext(context);
               }
               if(bm.type == normalMember) // todo, recurse struct/union? members for bitfields inside structs i.e.: PolygonRing
               {
                  if(eClass_FindProperty(c.cl, dm.name, c.cl.module) || strstr(dm.name, "__ecerePrivateData"))
                     continue;    // Skip members which already have properties of the same name...

                  // TOCHECK: How should this be handled?

                  // TODO: Fix types for classes...
                  if(dm.dataType.kind != classType && dm.dataType.kind != templateType && dm.dataType.kind != pointerType)
                  {
                     TypeInfo ti { type = dm.dataType };
                     ClassType ct = cppGetClassInfoFromType(ti.type, null, null, null);
                     String tn;
                     ZString sg { allocType = heap };

                     if(ct == normalClass)
                        tn = cppTypeName(ti, true);
                     else
                        tn = cppTypeName(ti, false);

                     sg.copy("");
                     // TODO: Don't output set if const ?

                     if(dm.dataType.kind == arrayType)
                     {
                        Type t = dm.dataType;
                        char arrayDataType[1024];
                        arrayDataType[0] = 0;
                        while(t.kind == arrayType && t.type) t = t.type;
                        PrintType(t, arrayDataType, true, false);
                        tn = PrintString(arrayDataType, "*");
                        sg.concatx(" getProto(", tn, ", ", dm.name, ", ", cn, ", return self ? ", "(", tn, ")", "IPTR(self->impl, ", cn, ")->", dm.name, " : 0;)");
                     }
                     else
                     {
                        sg.concatx(" setProto(", tn, ", ", dm.name, ", ", cn, ", ", "IPTR(self->impl, ", cn, ")->", dm.name, " = v;)");
                        sg.concatx(" getProto(", tn, ", ", dm.name, ", ", cn, ", return self ? IPTR(self->impl, ", cn, ")->", dm.name, " : 0;)");
                     }
                  if(!strcmp(dm.name, "stringValue"))
                     PrintLn("");
                  //cppTypeName(ti, false);
                     cppMacroProperty(g, o.z, use, 1, dm.name, sg._string, null, true);

                     delete sg;
                     delete tn;
                  }
                  else if(dm.dataType.kind == classType)
                  {
                     TypeInfo ti { type = dm.dataType };
                     ClassType ct = cppGetClassInfoFromType(ti.type, null, null, null);
                     String tn;
                     ZString sg { allocType = heap };

                     if(ct == normalClass)
                     {
                        tn = cppTypeName(ti, true);
                        v.processDependency(otypedef, otypedef, dm.dataType._class.registered);
                     }
                     else
                        tn = cppTypeName(ti, false);
                     sg.copy("");
                     // TODO: Don't output set if const ?

                     if(dm.dataType.kind == arrayType)
                     {
                        Type t = dm.dataType;
                        char arrayDataType[1024];
                        arrayDataType[0] = 0;
                        while(t.kind == arrayType && t.type) t = t.type;
                        PrintType(t, arrayDataType, true, false);
                        tn = PrintString(arrayDataType, "*");
                        sg.concatx(" getProto(", tn, ", ", dm.name, ", ", cn, ", return self ? ", "(", tn, ")", "IPTR(self->impl, ", cn, ")->", dm.name, " : 0;)");
                     }
                     else
                     {
                        if(ct == normalClass && strcmp(tn, "String") && strcmp(tn, "constString"))
                        {
                           sg.concatx(" setProto(", tn, ", ", dm.name, ", ", cn, ", ", "IPTR(self->impl, ", cn, ")->", dm.name, " = v.impl;)");
                           sg.concatx(" getProto(", tn, ", ", dm.name, ", ", cn, ", ", tn, " value(IPTR(self->impl, ", cn, ")->", dm.name, ", ", cn, "::_class); ", "return value; ", ")");
                        }
                        else
                        {
                           sg.concatx(" setProto(", tn, ", ", dm.name, ", ", cn, ", ", "IPTR(self->impl, ", cn, ")->", dm.name, " = v;)");
                           sg.concatx(" getProto(", tn, ", ", dm.name, ", ", cn, ", return IPTR(self->impl, ", cn, ")->", dm.name, ";)");
                        }


                     }
                     if(!strcmp(dm.name, "stringValue"))
                           PrintLn("");
                     //cppTypeName(ti, false);
                     cppMacroProperty(g, o.z, use, 1, dm.name, sg._string, null, true);

                     delete sg;
                     delete tn;
                  }
               }

            }
            ptDmPrinted = true;
         }
         o.z.concatx(genloc__, "}");
      }
      o.z.concatx(";", ln);
      // property implementations
      if(ptDmPrinted)
      {
         Property pt; IterProperty prop { c };
         DataMember dm; IterDataMember dat { c };

         while((pt = prop.next(publicOnly)))
         {
            // TOCHECK: How should this be handled?
            if(!strcmp(pt.name, "borderStyle"))
               PrintLn("");
            if(!pt.dataType)
            {
               Context context = SetupTemplatesContext(c); // TOCHECK: Should we do this only once while we process the whole class?
               pt.dataType = ProcessTypeString(pt.dataTypeString, false);
               FinishTemplatesContext(context);
            }

            // TODO: Fix types for classes...
            if(pt.dataType.kind != classType && pt.dataType.kind != templateType)
            {
               TypeInfo ti { type = pt.dataType };
               ClassType ct = cppGetClassInfoFromType(ti.type, null, null, null);
               String tn;
               ZString sg { allocType = heap };

               if(ct == normalClass)
               {
                  tn = cppTypeName(ti, true);
                  //v.processDependency(otypedef, otypedef, pt.dataType._class.registered);
               }
               else
                  tn = cppTypeName(ti, false);

               sg.copy("");


               if(eClass_FindDataMember(c.cl, pt.name, c.cl.module, null, null) || strstr(pt.name, "__ecerePrivateData"))
               {

                  if(pt.Set)
                     sg.concatx(" setImpl(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v);)");
                  else
                     sg.concatx(" setImpl(", tn, ", ", pt.name, ", ", cn, ", ", "IPTR(self->impl, ", cn, ")->", pt.name, " = v;)");
                  if(pt.Get)
                  {
                     if(ct == normalClass)
                        sg.concatx(" getImpl(", tn, ", ", pt.name, ", ", cn, ", ", tn, " value(", cn, "_get_", pt.name, "(self->impl), ", cn, "::_class); ", "return value;)");
                     else
                        sg.concatx(" getImpl(", tn, ", ", pt.name, ", ", cn, ", return ", cn, "_get_", pt.name, "(self->impl);)");
                  }
                  else
                  {
                     if(ct == normalClass)
                        sg.concatx(" getImpl(", tn, ", ", pt.name, ", ", cn, ", ", "self ? ", tn, " value(IPTR(self->impl, ", cn, ")->", pt.name, ", ", cn, "::_class); ", "return value; ", " : 0;)");
                     else
                        sg.concatx(" getImpl(", tn, ", ", pt.name, ", ", cn, ", return self ? IPTR(self->impl, ", cn, ")->", pt.name, " : 0;)");
                  }

               }
               else
               {
                  if(pt.Set && pt.Get)
                     sg.concatx(" setImpl(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v);)");
                  else if(pt.Set && !pt.Get)
                     sg.concatx(" _setImpl(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v);)");
                  if(pt.Get)
                  {
                     if(ct == normalClass)
                        sg.concatx(" getImpl(", tn, ", ", pt.name, ", ", cn, ", ", tn, " value(", cn, "_get_", pt.name, "(self->impl), ", cn, "::_class); ", "return value;)");
                     else
                        sg.concatx(" getImpl(", tn, ", ", pt.name, ", ", cn, ", return ", cn, "_get_", pt.name, "(self->impl);)");
                  }
               }
               if(!strcmp(pt.name, "stringValue"))
                  PrintLn("");
               //cppTypeName(ti, false);
               cppMacroProperty(g, o.z, use, 1, pt.name, sg._string, null, false);

               delete tn;
               delete sg;
            }
            else if(pt.dataType.kind == classType)
            {
               TypeInfo ti { type = pt.dataType };
               ClassType ct = cppGetClassInfoFromType(ti.type, null, null, null);
               String tn;
               ZString sg { allocType = heap };

               if(ct == normalClass)
               {
                  tn = cppTypeName(ti, true);
                  //v.processDependency(otypedef, otypedef, pt.dataType._class.registered);
               }
               else
                  tn = cppTypeName(ti, false);
               sg.copy("");

               if(eClass_FindDataMember(c.cl, pt.name, c.cl.module, null, null) || strstr(pt.name, "__ecerePrivateData"))
               {

                  if(pt.Set)
                  {
                     if(ct == structClass)
                        sg.concatx(" setImpl(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, &v);)");
                     else if(ct == normalClass && strcmp(tn, "constString") && strcmp(tn, "String"))
                        sg.concatx(" setImpl(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v.impl);)");
                     else
                        sg.concatx(" setImpl(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v);)");
                  }
                  else
                     sg.concatx(" setImpl(", tn, ", ", pt.name, ", ", cn, ", ", "IPTR(self->impl, ", cn, ")->", pt.name, " = v;)");
                  if(pt.Get)
                  {
                     if(ct == structClass)
                        sg.concatx(" getImpl(", tn, ", ", pt.name, ", ", cn, ", ", tn, " value; ", cn, "_get_", pt.name, "(self->impl", ", &value","); ","return value; ", ")");
                     else if(ct == normalClass && strcmp(tn, "constString") && strcmp(tn, "String"))
                        sg.concatx(" getImpl(", tn, ", ", pt.name, ", ", cn, ", ", tn, " value(", cn, "_get_", pt.name, "(self->impl), ", cn, "::_class); ", "return value;)");
                     else
                        sg.concatx(" getImpl(", tn, ", ", pt.name, ", ", cn, ", return ", cn, "_get_", pt.name, "(self->impl);)");
                  }
                  else
                  {
                     if(ct == normalClass && strcmp(tn, "constString") && strcmp(tn, "String"))
                        sg.concatx(" getImpl(", tn, ", ", pt.name, ", ", cn, ", ", "self ? ", tn, " value(IPTR(self->impl, ", cn, ")->", pt.name, ", ", cn, "::_class); ", "return value; ", " : 0;)");
                     else
                        sg.concatx(" getImpl(", tn, ", ", pt.name, ", ", cn, ", return self ? IPTR(self->impl, ", cn, ")->", pt.name, " : 0;)");
                  }
               }
               else
               {
                  if(pt.Set && pt.Get)
                  {
                     if(ct == structClass)
                        sg.concatx(" setImpl(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, &v);)");
                     else if(ct == normalClass && strcmp(tn, "constString") && strcmp(tn, "String"))
                        sg.concatx(" setImpl(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v.impl);)");
                     else
                        sg.concatx(" setImpl(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v);)");

                  }
                  else if(pt.Set && !pt.Get)
                  {
                     if(ct == structClass)
                        sg.concatx(" _setImpl(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, &v);)");
                     else if(ct == normalClass && strcmp(tn, "constString") && strcmp(tn, "String"))
                        sg.concatx(" _setImpl(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v.impl);)");
                     else
                        sg.concatx(" _setImpl(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v);)");

                  }
                  if(pt.Get)
                  {
                     if(ct == structClass)
                        sg.concatx(" getImpl(", tn, ", ", pt.name, ", ", cn, ", ", tn, " value; ", cn, "_get_", pt.name, "(self->impl", ", &value","); ","return value; ", ")");
                     else if(ct == normalClass && strcmp(tn, "constString") && strcmp(tn, "String"))
                        sg.concatx(" getImpl(", tn, ", ", pt.name, ", ", cn, ", ", tn, " value(", cn, "_get_", pt.name, "(self->impl), ", cn, "::_class); ", "return value;)");
                     else
                        sg.concatx(" getImpl(", tn, ", ", pt.name, ", ", cn, ", return ", cn, "_get_", pt.name, "(self->impl);)");
                  }
               }
               if(!strcmp(pt.name, "stringValue"))
                  PrintLn("");
               //cppTypeName(ti, false);
               cppMacroProperty(g, o.z, use, 1, pt.name, sg._string, null, false);

               delete tn;
               delete sg;
            }
         }

         // TODO: Non-virtual methods
         // TODO: How to handle data members in C++? Define C++ 'properties' (accessors) for them using property() macro as well?
         while((dm = dat.next(all)))
         {
            BitMember bm = (BitMember)dm;
            if(!dm.dataType)
            {
               Context context = SetupTemplatesContext(c);
               dm.dataType = ProcessTypeString(dm.dataTypeString, false);
               FinishTemplatesContext(context);
            }
            if(bm.type == normalMember) // todo, recurse struct/union? members for bitfields inside structs i.e.: PolygonRing
            {
               if(eClass_FindProperty(c.cl, dm.name, c.cl.module) || strstr(dm.name, "__ecerePrivateData"))
                  continue;    // Skip members which already have properties of the same name...

               // TOCHECK: How should this be handled?

               // TODO: Fix types for classes...
               if(dm.dataType.kind != classType && dm.dataType.kind != templateType && dm.dataType.kind != pointerType)
               {
                  TypeInfo ti { type = dm.dataType };
                  ClassType ct = cppGetClassInfoFromType(ti.type, null, null, null);
                  String tn;
                  ZString sg { allocType = heap };

                  if(ct == normalClass)
                     tn = cppTypeName(ti, true);
                  else
                     tn = cppTypeName(ti, false);

                  sg.copy("");
                  // TODO: Don't output set if const ?

                  if(dm.dataType.kind == arrayType)
                  {
                     Type t = dm.dataType;
                     char arrayDataType[1024];
                     arrayDataType[0] = 0;
                     while(t.kind == arrayType && t.type) t = t.type;
                     PrintType(t, arrayDataType, true, false);
                     tn = PrintString(arrayDataType, "*");
                     sg.concatx(" getImpl(", tn, ", ", dm.name, ", ", cn, ", return self ? ", "(", tn, ")", "IPTR(self->impl, ", cn, ")->", dm.name, " : 0;)");
                  }
                  else
                  {
                     sg.concatx(" setImpl(", tn, ", ", dm.name, ", ", cn, ", ", "IPTR(self->impl, ", cn, ")->", dm.name, " = v;)");
                     sg.concatx(" getImpl(", tn, ", ", dm.name, ", ", cn, ", return self ? IPTR(self->impl, ", cn, ")->", dm.name, " : 0;)");
                  }
               if(!strcmp(dm.name, "stringValue"))
                  PrintLn("");
               //cppTypeName(ti, false);
                  cppMacroProperty(g, o.z, use, 1, dm.name, sg._string, null, false);

                  delete sg;
                  delete tn;
               }
               else if(dm.dataType.kind == classType)
               {
                  TypeInfo ti { type = dm.dataType };
                  ClassType ct = cppGetClassInfoFromType(ti.type, null, null, null);
                  String tn;
                  ZString sg { allocType = heap };

                  if(ct == normalClass)
                  {
                     tn = cppTypeName(ti, true);
                     v.processDependency(otypedef, otypedef, dm.dataType._class.registered);
                  }
                  else
                     tn = cppTypeName(ti, false);
                  sg.copy("");
                  // TODO: Don't output set if const ?

                  if(dm.dataType.kind == arrayType)
                  {
                     Type t = dm.dataType;
                     char arrayDataType[1024];
                     arrayDataType[0] = 0;
                     while(t.kind == arrayType && t.type) t = t.type;
                     PrintType(t, arrayDataType, true, false);
                     tn = PrintString(arrayDataType, "*");
                     sg.concatx(" getImpl(", tn, ", ", dm.name, ", ", cn, ", return self ? ", "(", tn, ")", "IPTR(self->impl, ", cn, ")->", dm.name, " : 0;)");
                  }
                  else
                  {
                     if(ct == normalClass && strcmp(tn, "String") && strcmp(tn, "constString"))
                     {
                        sg.concatx(" setImpl(", tn, ", ", dm.name, ", ", cn, ", ", "IPTR(self->impl, ", cn, ")->", dm.name, " = v.impl;)");
                        sg.concatx(" getImpl(", tn, ", ", dm.name, ", ", cn, ", ", tn, " value(IPTR(self->impl, ", cn, ")->", dm.name, ", ", cn, "::_class); ", "return value; ", ")");
                     }
                     else
                     {
                        sg.concatx(" setImpl(", tn, ", ", dm.name, ", ", cn, ", ", "IPTR(self->impl, ", cn, ")->", dm.name, " = v;)");
                        sg.concatx(" getImpl(", tn, ", ", dm.name, ", ", cn, ", return IPTR(self->impl, ", cn, ")->", dm.name, ";)");
                     }


                  }
                  if(!strcmp(dm.name, "stringValue"))
                        PrintLn("");
                  //cppTypeName(ti, false);
                  cppMacroProperty(g, o.z, use, 1, dm.name, sg._string, null, false);

                  delete sg;
                  delete tn;
               }
            }

         }

      }
   }
}

// TOCHECK: asis being false indicates to add the C() prefixing macro to refer to the C bindings type
//          Currently, as only normal classes are generated, and not class:struct classes,
//          the class:struct classes should have the C() types
char * cppTypeName(TypeInfo ti, bool asis)
{
   char * result;
   ZString z { allocType = heap };
   //cppTypeNameCall = true;
   // note: calling zTypeName creates templaton output objects with null z
   zTypeName(z, null, ti, { anonymous = true, asis = asis }, null);
   //cppTypeNameCall = false;
   {
      ClassType ct = cppGetClassInfoFromType(ti.type, null, null, null);
      if(ct == normalClass) // || ct == noHeadClass)
      { }   //z.concat(" &");
      PrintLn("");
   }
   result = CopyString(z._string);
   delete z;
   return result;
/*
   char * name = null;

      SpecsList quals = null;

   if(ti && ti.type)
   {
      int ptr = 0;
      Type t = unwrapPointerType(ti.type, &ptr);
      SpecialType st = specialType(t);
      switch(st)
      {
         case normal:

            break;
         case baseClass:
         case typedObject:
         case anyObject:
            shh();
            break;
      }
   }
   return name;
*/
}

void cppTypeSpec(ZString z, const char * ident, TypeInfo ti, OptBits opt, BVariant vTop)
{
   TypeNameList list { };
   astTypeName(ident, ti, opt, vTop, list);
   ec2PrintToZedString(z, list, false);
   list.Free();
   delete list;
}

ClassType cppGetClassInfoFromType(Type type, Class * clRegRet, BClass * cParamRet, bool * hackRet)
{
   // TODO: Review all this...
   ClassType ct = systemClass;
   Class clReg = null;
   BClass cParam = null;
   bool hack = false;
   if(type.kind == classType && type._class)
   {
      Symbol _class = type._class;
      Class clReg = type._class.registered;
      bool any = type.classObjectType == anyObject;
      const char * name = _class.string ? strptrNoNamespace(_class.string) : null;

      if(!clReg && name && g_.lib.ecereCOM && tmpcppececeremess.Find(name))
         clReg = getEcEcereMessBaseClass(name);

      if(clReg && clReg.templateClass)
         clReg = clReg.templateClass;  // Resolve to non-parameterized template class for now...

      if(clReg) ct = clReg.type;

      hack = g_.lib.ecereCOM && (ct == normalClass || ct == noHeadClass) &&
            tmpcppececeremess.Find(name ? name : strptrNoNamespace(type._class.registered.name));
      cParam = ((ct != systemClass || any) && ct != bitClass) ?
            clReg && !any && !hack ? clReg : eSystem_FindClass(g_.mod, "Instance") : null;
   }
   if(clRegRet) *clRegRet = clReg;
   if(cParamRet) *cParamRet = cParam;
   if(hackRet) *hackRet = hack;
   return ct;
}

enum CPPParamsOutputMode { regMethodParamList, regMethodArgsPassing, _argParamList, passing };
char * cppParams(BClass c, TypeInfo ti, CPPParamsOutputMode mode, BVariant vClass, bool comma, const char ** first)
{
   char * result;
   ZString z { allocType = heap };
   Type t = ti.type;
   if(t.params.count == 1 && ((Type)t.params.first).kind == voidType)
   {
      /*if(mode == _argParamList)
         z.concat("void");*/
   }
   else
   {
      Type param;
      const char * sep = "";
      uint ap;

            if((mode == regMethodParamList && comma == true) || mode == passing || mode == regMethodArgsPassing) sep = ", ";
            ap = 0;
            for(param = t.params.first; param; param = param.next)
            {
               char * apname = null;
               MapIterator<consttstr, const String> i { map = methodParamNameSwap };
               const char * name = i.Index({ ti.m.mname, param.name }, false) ? i.data : param.name;
               Class clReg;
               BClass cParam;
               bool hack;
               ClassType ct = cppGetClassInfoFromType(param, &clReg, &cParam, &hack);
               if(!name) apname = PrintString("ap", ++ap), name = apname;
               if(!strcmp(name, "obsolete"))
                  ; //conmsg("step");
                  z.concatx(sep);

                  switch(mode)
                  {
                     case regMethodParamList:
                     {
                        //const char * name = iMetParNamSwp.Index({ ti.m.mname, param.name }, false) ? iMetParNamSwp.data : param.name;
                        //const char * typeString = param.kind == classType && param.classObjectType == anyObject ? g.sym.instance : tokenTypeString(param);
                        char * typeString = null;
                        if(param.kind == templateType)
                           typeString = PrintString("TP(", c.name, ", ", param.templateParameter.identifier.string, ")");
                        else if(param.kind == classType && param.classObjectType == anyObject)
                           typeString = CopyString(g_.sym.instance);
                        else if(param.kind == classType && param._class && param._class.registered && param._class.registered.templateClass)
                           typeString = PrintString("C(", c.name, ")");
                        else if(cParam && param.kind == classType && cParam.isString)
                        {
                           bool asis = ct == normalClass;
                           cppTypeSpec(z, "ident___", { type = param, cl = ti.cl }, { anonymous = true, asis = asis }, ti.cl);
                        }
                        else
                           typeString = printType(param, false, false, true);

                        if(first && !*first) *first = name;
                        if(typeString)
                           z.concatx(strptrNoNamespace(typeString));
                        if(param.kind == classType && ( ct == noHeadClass || ct == structClass))
                           z.concatx(" *");
                        else if(param.kind == classType && ct == normalClass && cParam && cParam.isString)
                           z.concatx(" &");
                        z.concatx(" ", name);
                        delete typeString;
                        if(!sep[0]) sep = ", ";
                        break;
                     }
                     case regMethodArgsPassing:
                     {
                        bool useL = param.typedByReference || param.byReference; // TODO: Set to true if by reference?

                        if((ct == normalClass && !cParam.isString) || (param.kind == classType && param.classObjectType == anyObject))
                        {
                           //"*(", cn, " *)INSTANCEL(", first, ", ", first, "->_class)"
                           if(param.classObjectType == anyObject)
                              z.concatx("*(", c.name, " *)", useL ? "INSTANCEL" : "_INSTANCE", "(", name, ", ", name, "->_class)");
                           else
                              z.concatx("*(", cParam.name, " *)", useL ? "INSTANCEL" : "_INSTANCE", "(", name, ", ", name, "->_class)");
                        }
                        else
                           z.concatx(name);
                        if(!sep[0]) sep = ", ";
                        break;
                     }
                     case _argParamList:
                     {
                        bool asis = ct == normalClass;// || ct == noHeadClass;

                        if(hack)
                        {
                           z.concatx(cParam.name, " /*");
                           cppTypeSpec(z, "ident___", { type = param, cl = ti.cl }, { anonymous = true, asis = asis }, ti.cl);
                           z.concatx("*/");

                           if(ct == normalClass || ct == noHeadClass)
                              z.concatx(" &");
                        }
                        else if(param.kind == classType && param.classObjectType == anyObject)
                           z.concatx("c &");
                        else
                        {
                           cppTypeSpec(z, "ident___", { type = param, cl = ti.cl }, { anonymous = true, asis = asis }, ti.cl);
                           if(param.kind == classType)
                           {
                              if(ct == normalClass)
                                 z.concatx(" &");
                              else if(ct  == structClass)
                                 z.concatx(" *");
                           }
                        }

                        //if(!name[0])
                        //   conmsg("noname");
                        z.concatx(" ", name);//, " ? ", name);
                        break;
                     }
                     case passing:
                     {
                        /*if(g_.lib.ecereCOM && !strcmp(name, "window"))
                        {
                           conmsg("nohack?");
                           ct = cppGetClassInfoFromType(param, &clReg, &cParam, &hack);
                        }*/
                        if(cParam)
                           vClass.processDependency(otypedef, otypedef, cParam.cl);
                        if(hack)
                           //z.concatx("&", name, " ? ((Instance *)&", name, ")->impl : (", cParam.symbolName, ")null");
                           z.concatx(name, ".impl");
                        else if((ct == normalClass && !cParam.isString) || (param.kind == classType && param.classObjectType == anyObject))
                           //z.concatx("&", name, " ? ", name, ".impl : (", ti.c.symbolName, ")null");
                           //z.concatx("&", name, " ? ", name, ".impl : (", cParam.symbolName, ")null");
                           z.concatx(name, ".impl");
                        else
                           z.concatx(name);
                        break;
                     }
                  }
               if(!sep[0] && mode == _argParamList) sep = " _ARG ";
               delete apname;
            }
   }
   result = CopyString(z._string);
   delete z;
   return result;
}

Class getEcEcereMessBaseClass(const char * name)
{
   Class cl = eSystem_FindClass(__thisModule, name);
   if(cl.type != normalClass && cl.type != noHeadClass)
      return cl;
   while(cl.base)
   {
      const char * name = cl.base.name;
      Class clAlt = !(!strcmp(name, "Window") || !strcmp(name, "IOChannel")) ? eSystem_FindClass(g_.mod, name) : null;
      if(clAlt)
         return clAlt;
      cl = cl.base;
   }
   return cl;
}

/*static void processNormalClass(CPPGen g, BClass c, BVariant v, BNamespace n, BOutput o)
{
}*/

static void outputContents(CPPGen g, File out)
{
   for(nn : g.bmod.orderedNamespaces)
   {
      BNamespace n = nn;
      /*
      for(vv : n.contents)
      {
         BVariant o = vv;
         if(o._class == class(BOutput) && ((BOutput)o).z)
            out.Puts(((BOutput)o).z._string);
      }*/

//      /*
      if(n.orderedBackwardsOutputs.count)
      {
         //g.astAdd(ASTRawString { string = CopyString("// start -- moved backwards outputs") }, true);
         for(optr : n.orderedBackwardsOutputs)
         {
            BOutput o = (BOutput)optr;
            out.Puts(o.z._string);
         }
         //g.astAdd(ASTRawString { string = CopyString("// end -- moved backwards outputs") }, true);
      }
      for(optr : n.orderedOutputs)
      {
         BOutput o = (BOutput)optr;
         if(o.kind == vmanual || o.kind == vdefine || o.kind == vfunction ||
               o.kind == vclass || o.kind == vtemplaton || o.kind == vmethod || o.kind == vproperty)
         {
            if(o.z)
               out.Puts(o.z._string);
         }
         else conmsg("check");
      }
//      */
   }
}

static void cppHeaderStart(CPPGen g, File f)
{
   //cInHeaderFileComment(g);
   //cInHeaderProcessSourceFile(g, null, ":src/C/c_header_open.src"); //cInHeaderPreprocessorOpen(g);
   //cInHeaderIncludes(g);

   f.PrintLn("// Preprocessor directives can be added at the beginning (Can't store them in AST)");
   f.PrintLn("");
   f.PrintLn("/****************************************************************************");
   f.PrintLn("===========================================================================");
   if(g.lib.ecereCOM)
      f.PrintLn("   Core eC Library");
   else
     f.PrintLn("   ", g.lib.moduleName, " Module");
   f.PrintLn("===========================================================================");
   f.PrintLn("****************************************************************************/");
   f.PrintLn("#if !defined(__", g.lib.defineName, "_HPP__)");
   f.PrintLn("#define __", g.lib.defineName, "_HPP__");
   f.PrintLn("");
   if(g.lib.ecereCOM)
   {
      f.PrintLn("#define ECPRFX eC_");
      f.PrintLn("");
   }
   else
   {
      // hack
      // todo, dependency iterating?
      f.PrintLn("#include \"eC.hpp\"");
      if(!strcmp(g.lib.moduleName, "gnosis2")) // hack, todo
      {
         f.PrintLn("#include \"ecere.hpp\"");
         f.PrintLn("#include \"EDA.hpp\"");
      }
      /*else
         f.PrintLn("#include \"ecere.hpp\"");*/
   }
   f.PrintLn("#include \"", g.lib.bindingName, ".h\"");
   f.PrintLn("");
}

static void cppHeaderEnd(CPPGen g, File f)
{
   f.PrintLn("");
   f.PrintLn("#endif // !defined(__", g.lib.defineName, "_HPP__)");
}

// NOTE: 'bypass' is a mode for bgen to itself expand the macros
enum MacroMode { use, bypass, def };
enum MacroOptAll { use, bypass = 0xFFFFFFFF };
class MacroOptBits
{
   // warning: these can only store use or bypass
   MacroMode intRegisterClass:1;
   MacroMode registerClassDef:1;
   MacroMode classDef:1;
   MacroMode registerClass:1;
   MacroMode registerClassCPP:1;
   MacroMode intConstructClass:1;
   MacroMode constructClass:1;
   MacroMode destructClass:1;
   MacroMode classRegistration:1;
   MacroMode virtualMethod:1;
   MacroMode intRegisterMethod:1;
   MacroMode registerMethod:1;
   MacroMode registerTypedMethod:1;
   MacroMode propety:1;
   MacroMode intPropSet:1;
   MacroMode propSet:1;
   MacroMode propGet:1;

   MacroOptAll all:32:0;
   //property MacroMode all { set { this = value ? 0xFFFFFFFF : 0x0;  } };
};

/*static */void cppDefineMacroIntRegisterClass(
      CPPGen g,            // generator
      ZString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroIntRegisterClass(g, o, def, ind,
         "n",
         "ns",
         "bs",
         "a",
         0); }

static void cppMacroIntRegisterClass(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * n,      // n?
      const char * ns,     // ns?
      const char * bs,     // bs?
      const char * a,      // a?
      void * unused)
{
   const char * lc = mode == def ? " \\" : "";     // line continuation
   switch(mode)
   {
      case def:
         o.concatx(genloc__, indents(ind), "#define _REGISTER_CLASS(n, ns, bs, a)", lc, ln);
      case bypass:
         o.concatx(genloc__, indents(ind + 1), "(Class *)eC_registerClass(ClassType_normalClass, ", ns, ", ", bs, ", sizeof(Instance *), 0,", lc, ln);
            o.concatx(genloc__, indents(ind + 2), "(C(bool) (*)(void *)) ", n, "::constructor, (void(*)(void *)) ",
                  n, "::destructor, (", a, ").impl, AccessMode_privateAccess, AccessMode_publicAccess)", ln);
         break;
      case use:
         o.concatx(genloc__, indents(ind), "_REGISTER_CLASS(",
               n,    ", ",
               ns,   ", ",
               bs,   ", ",
               a,    ")");
         break;
   }
}

/*static */void cppDefineMacroRegisterClassDef(
      CPPGen g,            // generator
      ZString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroRegisterClassDef(g, o, def, ind,
         "n",
         "b",
         "a",
         0); }

static void cppMacroRegisterClassDef(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * n,      // n?
      const char * b,      // b?
      const char * a,      // a?
      void * unused)
{
   switch(mode)
   {
      case def:
         o.concatx(genloc__, indents(ind), "// For defining _class and registereing together (single translation unit)", ln);
         o.concatx(genloc__, indents(ind), "#define REGISTER_CLASS_DEF(n, b, a) ");
      case bypass:
            o.concatx(genloc__, indents(ind + 1), "TCPPClass<", n, "> ", n, "::_class(_REGISTER_CLASS(", n, ",     #n, ", b, "::_class.impl->name, ", a, "));", ln);
         break;
      case use:
         o.concatx(genloc__, indents(ind), "REGISTER_CLASS_DEF(",
               n,    ", ",
               b,    ", ",
               a,    ")");
         break;
   }
}

/*static */void cppDefineMacroClassDef(
      CPPGen g,            // generator
      ZString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroClassDef(g, o, def, ind,
         "n",
         0); }

static void cppMacroClassDef(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * n,      // n?
      void * unused)
{
   switch(mode)
   {
      case def:
         o.concatx(genloc__, indents(ind), "// For defining _class and registering separately (multiple translation units)", ln);
         o.concatx(genloc__, indents(ind), "#define CLASS_DEF(n)                ");
      case bypass:
            o.concatx(genloc__, indents(ind + 1), "TCPPClass<", n, "> ", n, "::_class;", ln);
         break;
      case use:
         o.concatx(genloc__, indents(ind), "CLASS_DEF(",
               n,    ")");
         break;
   }
}

/*static */void cppDefineMacroRegisterClass(
      CPPGen g,            // generator
      ZString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroRegisterClass(g, o, def, ind,
         "n",
         "b",
         "a",
         0); }

static void cppMacroRegisterClass(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * n,      // n?
      const char * b,      // b?
      const char * a,      // a?
      void * unused)
{
   switch(mode)
   {
      case def:
         o.concatx(genloc__, indents(ind), "#define REGISTER_CLASS(n, b, a)     ");
      case bypass:
            o.concatx(genloc__, indents(ind + 1), n, "::_class.setup(_REGISTER_CLASS(", n, ",       #n, ", b, "::_class.impl->name, ", a, "));", ln);
         break;
      case use:
         o.concatx(genloc__, indents(ind), "REGISTER_CLASS(",
               n,    ", ",
               b,    ", ",
               a,    ")");
         break;
   }
}

/*static */void cppDefineMacroRegisterClassCPP(
      CPPGen g,            // generator
      ZString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroRegisterClassCPP(g, o, def, ind,
         "n",
         "a",
         0); }

static void cppMacroRegisterClassCPP(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * n,      // n?
      const char * a,      // a?
      void * unused)
{
   switch(mode)
   {
      case def:
         o.concatx(genloc__, indents(ind), "// For C++ classes proxying eC classes:", ln);
         o.concatx(genloc__, indents(ind), "#define REGISTER_CPP_CLASS(n, a)    ");
      case bypass:
            o.concatx(genloc__, indents(ind + 1), n, "::_class.setup(_REGISTER_CLASS(", n, ", \"CPP\" #n, #n, ", a, "));", ln);
         break;
      case use:
         o.concatx(genloc__, indents(ind), "REGISTER_CPP_CLASS(",
               n,    ", ",
               a,    ")");
         break;
   }
}

/*static */void cppDefineMacroIntConstructClass(
      CPPGen g,            // generator
      ZString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroIntConstructClass(g, o, def, ind,
         "c",
         "b",
         0); }

static void cppMacroIntConstructClass(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * c,      // c?
      const char * b,      // b?
      void * unused)
{
   const char * lc = mode == def ? " \\" : "";     // line continuation
   switch(mode)
   {
      case def:
         o.concatx(genloc__, indents(ind), "#define _CONSTRUCT(c, b)", lc, ln);
      case bypass:
            o.concatx(genloc__, indents(ind + 1), "INSTANCE_VIRTUAL_METHODS(", c, ")", lc, ln);
            //cppMacroClassVirtualMethods(g, o, use /*bypass*/, ind + 1, "INSTANCE", c, g.cInstance, g.cclass, 0);
            o.concatx(genloc__, indents(ind + 1), "static TCPPClass<", c, "> _class;", lc, ln);
            o.concatx(genloc__, indents(ind + 1), "static C(bool) constructor(", g_.sym.instance, " i, C(bool) alloc) { return (alloc && !_INSTANCE(i, _class.impl)) ? new ", c, "(i, _class) != null : true; }", lc, ln);
            o.concatx(genloc__, indents(ind + 1), "static void destructor(", g_.sym.instance, " i) { ", c, " * inst = (", c, " *)_INSTANCE(i, _class.impl); if(_class.destructor) ((void (*)(", c, " & self))_class.destructor)(*inst); delete inst; }", lc, ln);
            o.concatx(genloc__, indents(ind + 1), "explicit inline ", c, "(", g_.sym.instance, " _impl, CPPClass & cl = _class) : ", b, "(_impl, cl)", ln);
         break;
      case use:
         o.concatx(genloc__, indents(ind), "_CONSTRUCT(",
               c,    ", ",
               b,    ")");
         break;
   }
}

/*static */void cppDefineMacroConstructClass(
      CPPGen g,            // generator
      ZString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroConstructClass(g, o, def, ind,
         "c",
         "b",
         0); }

static void cppMacroConstructClass(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * c,      // c?
      const char * b,      // b?
      void * unused)
{
   const char * lc = mode == def ? " \\" : "";     // line continuation
   switch(mode)
   {
      case def:
         o.concatx(genloc__, indents(ind), "#define CONSTRUCT(c, b)", lc, ln);
      case bypass:
            o.concatx(genloc__, indents(ind + 1), c, "() : ", c, "((", g_.sym.instance, ")Instance_newEx(_class.impl, false), _class) { }", lc, ln);
            //o.concatx(genloc__, indents(ind + 1), "_CONSTRUCT(", c, ", ", b, ")", ln);
            cppMacroIntConstructClass(g, o, use /*mode*/, ind + 1, c, b, 0);
         break;
      case use:
         o.concatx(genloc__, indents(ind), !strcmp(c, "Application") ? "APP_CONSTRUCT(" : "CONSTRUCT(",
               c,    ", ",
               b,    ")");
         break;
   }
}

/*static */void cppDefineMacroDestructClass(
      CPPGen g,            // generator
      ZString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroDestructClass(g, o, def, ind,
         "c",
         0); }

static void cppMacroDestructClass(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * c,      // c?
      void * unused)
{
   const char * lc = mode == def ? " \\" : "";     // line continuation
   switch(mode)
   {
      case def:
         o.concatx(genloc__, indents(ind), "#define DESTRUCT(c)", lc, ln);
      case bypass:
         o.concatx(genloc__, indents(ind + 1), "((TCPPClass<", c, "> &)_class).destructor", ln);
         break;
      case use:
         o.concatx(genloc__, indents(ind), "DESTRUCT(",
               c,    ")");
         break;
   }
}

/*static */void cppDefineMacroClassRegister(
      CPPGen g,            // generator
      ZString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroClassRegister(g, o, def, ind,
         0); }

static void cppMacroClassRegister(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      void * unused)
{
   const char * lc = mode == def ? " \\" : "";     // line continuation
   switch(mode)
   {
      case def:
         o.concatx(genloc__, indents(ind), "#define REGISTER()", lc, ln);
      case bypass:
            o.concatx(genloc__, indents(ind + 1), "static void class_registration(CPPClass & _class)", ln);
         break;
      case use:
         o.concatx(genloc__, indents(ind), "REGISTER(",
                     ")");
         break;
   }
}

/*static */void cppDefineMacroClassRegistration(
      CPPGen g,            // generator
      ZString o,     // output
      uint ind,            // indents
      BClass c,
      BClass cBase,
      BVariant vClass,
      void * unused) {     // unused
   cppMacroClassRegistration(g, o, def, ind,
         c,
         cBase,
         vClass,
         0); }

static void cppMacroClassRegistration(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      BClass c,
      BClass cBase,
      BVariant vClass,
      void * unused)
{
   const char * lc = mode == def ? " \\" : "";     // line continuation
   switch(mode)
   {
      case def:
         o.concatx(ln, genloc__, indents(ind), "#define ", c.name, "_class_registration(d)");
      case bypass:
      {
         bool content = false;
         BMethod m; IterMethod itm { c.isInstance ? cBase.cl : c.cl };
         while((m = itm.next(publicVirtual)))
         {
            Type param, t = m.md.dataType;
            const char * on = m.name, * mn = m.mname;
            bool byRefTypedThis = false;
            bool returnAddress = false;
            bool noRet = t.returnType.kind == voidType;
            bool destVsSrc = false; //!strcmp(mn, "onCopy") ? true : false;
            const char * first = null;
            const char * nthis = null;
            Type returnType = t.returnType;
            char * typeString = returnType.kind == classType && returnType.classObjectType == anyObject ? CopyString(g_.sym.instance) : printType(t.returnType, false, false, true);
            Class clRegRT;
            BClass cParamRT;
            bool hackRT;
            ClassType ctRT = cppGetClassInfoFromType(m.md.dataType.returnType, &clRegRT, &cParamRT, &hackRT);
            char * args = null;
            char * params = null;
            TypeInfo argsInfo;
            MapIterator<consttstr, const String> iMetParNamSwp { map = methodParamNameSwap };
            MapIterator<const String, const String> iMetThisNameSwap { map = methodTypedObjectThisNameSwap };
            //int ptr = 0; Type t = unwrapPointerType(ti.type, &ptr);
            // _REGISTER_METHOD(cp1, cp2, ns, n, bc, c, r, p, ocl, oi, code, ea, rv)
            //            REGISTER_METHOD(ns, n, bc, c, r, p, ocl, oi, code, ea, rv)
            //      REGISTER_TYPED_METHOD(ns, n, bc, c, r, p, ocl, oi, code, ea, rv)
            // name string, name, base class, class, return (type), parameters, object class?, object instance?, code?, e? arguments?, return value
            const String cn = c.name;

            if(!strcmpi(cn, "Window"))
               ;//cn = "Instance"; // Hack for using ecere classes in base ecereCOM stuff.... TODO: Unify/Streamline/Simplify these hacks

            o.concatx(lc, ln);

            o.concatx("   ", t.classObjectType == typedObject ? "REGISTER_TYPED_METHOD" : "REGISTER_METHOD",
               "(\"", on, "\", ", mn, ", ", cn, ", d, ");

            // TODO: Redo this whole type system mess and use Type system directly!!!
            if(returnType.kind == templateType)
               o.concatx("TP(", c.name, ", ", returnType.templateParameter.identifier.string, ")");
            else if(ctRT == normalClass || ctRT == noHeadClass)
            {
      /*       o.concatx(cParamRT.symbolName);
               if(ctRT == noHeadClass)
                  o.concatx(" *");   */
               if(ctRT == normalClass)
               {
                  if(!strcmp(cParamRT.name, "Instance"))
                     o.concatx(cParamRT.symbolName);
                  else
                     o.concatx(cParamRT.symbolName);
               }
               else if(ctRT == noHeadClass)
                  o.concatx(cParamRT.symbolName, " *");
            }
            else
               o.concatx(strptrNoNamespace(typeString));
            o.concatx(",", lc, ln,
                        "      (");
            //delete typeString;
            if(t.kind == functionType)
            {
               bool comma = false; //const char * comma = "";
               switch(t.classObjectType)
               {
                  case none:
                     if(!strcmp(cn, "Application"))
                        o.concatx("C(Instance)");
                     else
                        o.concatx("C(", cn, ")");
                     nthis = "o";
                     o.concatx(" ", nthis);
                     comma = true;
                     break;
                  //case classPointer: conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                  case typedObject:
                  {
                     byRefTypedThis = t.byReference;
                     returnAddress = ctRT == normalClass || ctRT == noHeadClass;
                     nthis = /*iMetThisNameSwap.Index(mn, false) ? iMetThisNameSwap.data :*/ "o";
                     o.concatx("Class * _class, C(Instance) ", byRefTypedThis ? "* " : "", nthis);
                     comma = true;
                     break;
                  }
                  //case anyObject:    conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                  default:           conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
               }
               argsInfo = { type = m.md.dataType, m = m, md = m.md, cl = c.cl, c = c };
               o.concatx((params = cppParams(c, argsInfo, regMethodParamList, vClass, comma, &first)));
               delete params;
            }
            else conmsg(t.kind, " is not handled here. todo?");
            o.concatx("),", lc, ln);
            o.concatx("      ");
            o.concatx(destVsSrc ? first : nthis);
            if(byRefTypedThis)
               o.concatx(" ? *", destVsSrc ? first : nthis, " : null");
            o.concatx(", ", nthis);
            if(byRefTypedThis)
               o.concatx(" ? *", nthis, " : null");
            o.concatx(", ");

            if(!noRet)
            {
               if(returnType.kind == templateType)
                  o.concatx("TP(", c.name, ", ", returnType.templateParameter.identifier.string, ")");
               else if((ctRT == normalClass || ctRT == noHeadClass))
               {
            /*    if(ctRT == normalClass)
                     o.concatx(cParamRT.name, " *");
                  else if(ctRT == noHeadClass)
                     o.concatx(cParamRT.symbolName, " *");   */

                  if(ctRT == normalClass)
                  {
                     if(!strcmp(cParamRT.name, "Instance"))   // Exception
                        o.concatx(cParamRT.name, " *");
                     else
                        o.concatx(cParamRT.symbolName);
                  }
                  else if(ctRT == noHeadClass)
                     o.concatx(cParamRT.symbolName, " *");
               }
               else
                  o.concatx(strptrNoNamespace(typeString));



                o.concatx(" ret = ");

                if(returnAddress) o.concatx(" &");
            }

            o.concatx("fn(*i");
            o.concatx((args = cppParams(c, argsInfo, regMethodArgsPassing, vClass, false, 0)));
            o.concatx(")");

            if(!noRet)
            {
               o.concatx("; return ");
               if(returnAddress)
                  o.concatx("ret ? ret->impl : null;");
               else
                  o.concatx("ret");
            }
            o.concatx(",", lc, ln);

            delete args;
            o.concatx("      (");
            if(t.kind == functionType)
            {
               const char * comma = "";
               switch(t.classObjectType)
               {
                  //case none:         conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                  //case classPointer: conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                  case typedObject:
                  {
                     //if(!strcmp(name, "dest"))
                     //   conmsg("breakpoint");
                     o.concatx("_class, ", nthis);
                     comma = ", ";
                     break;
                  }
                  //case anyObject:    conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                  case none:
                     o.concatx(nthis);
                     comma = ", ";
                     break;
                  default:           conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
               }
               if(!(t.params.count == 1 && ((Type)t.params.first).kind == voidType))
               {
                  char * apname = null;
                  uint ap = 0;
                  for(param = t.params.first; param; param = param.next)
                  {
                     MapIterator<consttstr, const String> i { map = methodParamNameSwap };
                     const char * name = i.Index({ mn, param.name }, false) ? i.data : param.name;
                     if(!name)
                        apname = PrintString("ap", ++ap);
                     o.concatx(comma, name ? name : apname);
                     if(!name) delete apname;
                     if(!comma[0]) comma = ", ";
                  }
               }

            }
            else conmsg(t.kind, " is not handled here. todo?");
            o.concatx("), ");
            if(!noRet)
            {
               o.concatx("(");
               if(returnType.kind == templateType)
                  o.concatx("TP(", c.name, ", ", returnType.templateParameter.identifier.string, ")");
               else if(ctRT == noHeadClass || ctRT == normalClass)
                  o.concatx(cParamRT.symbolName);
               else
                  o.concatx(strptrNoNamespace(typeString));
               if(ctRT == noHeadClass)
                  o.concatx(" *");
               o.concatx(")");
               if(ctRT == normalClass || ctRT == noHeadClass || (ctRT == systemClass && typeString && strstr(typeString, "char *")))
                  o.concatx("null");
               else
                  o.concatx("1");
            }
            o.concatx(");");
            content = true;
         }
         if(content) o.concatx(ln);
         break;
      }
      case use:
         o.concatx(genloc__, indents(ind), cBase.upper, "_class_registration(", c.name, ")");
         break;
   }
}

// _VIRTUAL_METHODS
static void cppMacroClassVirtualMethods(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * un,     // uppercase name // TODOGDFOJDFGOIJDFG
      const char * c_,      // class
      BClass c,
      BClass cBase,
      BVariant vClass,
      void * unused)
{
   const char * lc = mode == def ? " \\" : "";     // line continuation
   //const char * sc = mode == bypass ? "" : " ## "; // symbol concatenation
   switch(mode)
   {
      case def:
         o.concatx(ln, genloc__, indents(ind), "#define ", un, "_VIRTUAL_METHODS(c)", lc, ln);
      case bypass:
      {
         bool first = true;
         bool content = false;
         const char * cn = c.name;
         const char * sn = c.symbolName;
         MacroMode submode = mode == def ? use : g.macroBits.virtualMethod;
         const char * lc = submode == bypass ? "" : " \\";  // line continuation
         BMethod m; IterMethod itm { c.isInstance ? cBase.cl : c.cl };
         while((m = itm.next(publicVirtual)))
         {
            m.init(itm.md, c.isInstance ? cBase : c);
            {
               char * params = null;
               char * args = null;
               const char * mn = m.mname, * tn = m.s;
               Type t = m.md.dataType;
               Class clRegRT;
               BClass cParamRT;
               bool hackRT;
               // ctRT is return type's class type
               ClassType ctRT = cppGetClassInfoFromType(t.returnType, &clRegRT, &cParamRT, &hackRT);
               bool noRet = t.returnType.kind == voidType;
               TypeInfo ti;
               TypeInfo argsInfo;
               bool hasArgs = !(t.params.count == 0 || (t.params.count == 1 && ((Type)t.params.first).kind == voidType));
               if(!first/* && submode != bypass*/)
                  o.concatx(lc, ln);
               else
                  first = false;
               ti = { type = t.returnType, md = m.md, cl = c.cl, c = c };
               argsInfo = { type = t, m = m, md = m.md, cl = c.cl, c = c };
               {
                  bool opt1 = ctRT == normalClass || ctRT == noHeadClass;
                  char * s1 = null;
                  char * s2 = null;
                  const char * s3;
                  ZString s3z { allocType = heap };
                  const char * mncpp = strcmp(mn, "delete") ? mn : "_delete";
                  if(cParamRT && !strcmp(cParamRT.name, "IteratorPointer"))
                     ; //PrintLn("");

                  s3z.copy("");
                  if(noRet)
                  {
                     if(c.isInstance) s3z.concatx("Instance"); // Instance_* prefix for base instance methods
                     s3z.concatx(tn, "(");
                     if(c.isInstance || c.cl.type != normalClass)
                         s3z.concatx("_class.impl, ");
                     s3z.concatx("self ? self->impl : (", sn, ")null");
                     if(!(c.isInstance || c.cl.type != normalClass) && !itm.md.dataType.staticMethod && !c.is_class && itm.md.dataType.thisClass && itm.md.dataType.thisClass.string)
                     {
                        s3z.concatx(", ");
                        s3z.concatx("self ? self->impl : (", sn, ")null");
                     }
                     s3z.concatx((args = cppParams(c, argsInfo, passing, vClass, false, 0)));
                     s3z.concatx(");");
                  }
                  else if(ctRT == normalClass || ctRT == noHeadClass)
                  {
                     s3z.concatx(cParamRT.symbolName);
                     if(ctRT == noHeadClass)
                        s3z.concatx(" *");
                     s3z.concatx(" ret", cParamRT.name, " = ");
                     if(c.isInstance) s3z.concatx("Instance"); // Instance_* prefix for base instance methods
                     s3z.concatx(tn, "(");
                     if(c.isInstance || c.cl.type != normalClass)
                         s3z.concatx("_class.impl, ");
                     s3z.concatx("self ? self->impl : (", sn, ")null");
                     s3z.concatx((args = cppParams(c, argsInfo, passing, vClass, false, 0)));
                     s3z.concatx(");", lc, ln);

                     s3z.concatx(genloc__, indents(ind + 4), "return ");
                     if(ctRT == noHeadClass)
                        s3z.concatx("ret", cParamRT.name, ";");
                     else if(!strcmp(cParamRT.name, "Instance"))
                        s3z.concatx("*(", cParamRT.name, " *)_INSTANCE(ret", cParamRT.name, ", ret", cParamRT.name, "->_class);");
                     else
                        s3z.concatx("*(", cParamRT.symbolName, " *)_INSTANCE(ret", cParamRT.name, ", ret", cParamRT.name, "->_class);");
                  }
                  else
                  {
                     s3z.concatx("return ");
                     if(c.isInstance) s3z.concatx("Instance"); // Instance_* prefix for base instance methods
                     s3z.concatx(tn, "(");
                     if(c.isInstance || c.cl.type != normalClass)
                        s3z.concatx("_class.impl, ");
                     s3z.concatx("self ? self->impl : (", sn, ")null");
                     if(!(c.isInstance || c.cl.type != normalClass) && !itm.md.dataType.staticMethod && !c.is_class && itm.md.dataType.thisClass && itm.md.dataType.thisClass.string)
                     {
                        s3z.concatx(", ");
                        s3z.concatx("self ? self->impl : (", sn, ")null");
                     }
                     s3z.concatx((args = cppParams(c, argsInfo, passing, vClass, false, 0)));
                     s3z.concatx(")");
                  }
                  s3 = s3z._string;

                  // c is owning class
                  if(c.cl.type == normalClass && !c.isInstance)
                  {
                     cppMacroVirtualMethod(g, o, submode, 1,
                           mn,
                           mncpp,
                           "c",
                           cn,
                           (s1 = /*opt1 ? PrintString("C(", cParamRT.name, ")") : */cppTypeName(ti, false /*true*/)),
                           (s2 = PrintString("c &", hasArgs ? " _ARG" : "")),
                           "",
                           (params = cppParams(c, argsInfo, _argParamList, vClass, false, 0)),
                           s3,
                           0);
                  }
                  else
                  {
                     cppMacroVirtualMethod(g, o, submode, 1,
                           mn,
                           mncpp,
                           "c",
                           cn,
                           (s1 = opt1 ? CopyString("Instance &" /*cParamRT.name*/) : cppTypeName(ti, true)),
                           (s2 = PrintString("c &", hasArgs ? " _ARG" : "")),
                           "",
                           (params = cppParams(c, argsInfo, _argParamList, vClass, false, 0)),
                           s3,
                           0);
                  }
                  content = true;
                  delete s1;
                  delete s2;
                  //delete s3;
                  delete s3z;
               }
            }
         }
         if(content) o.concatx(ln);
         break;
      }
   }
}

// VIRTUAL_METHOD(
//    n: method name,
//    c: class name,
//    b: base? class name,
//    r: return type,
//    p0: ?,
//    ep: ?,
//    p: parameters (list of spec and ident pairs seperated by _ARG),
//    d: ?
// )
// c: class object, mc: method class, m: method name, i: instance object, r: return type, p: parameters, a: arguments)

/*static */ void cppMacroVirtualMethod(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * n,      // name (method)
      const char * ncpp,      // name (method)
      const char * c,      // class
      const char * b,      // base class
      const char * r,      // return type
      const char * p0,     // p0?
      const char * ep,     // ep?
      const char * p,      // parameters?
      const char * d,      // dispatch?
      void * unused)
{
   const char * lc = mode == bypass ? "" : " \\";     // line continuation
   const char * sc = mode == bypass ? "" : " ## "; // symbol concatenation
   switch(mode)
   {
      case def:
         o.concatx(genloc__, indents(ind), "#define VIRTUAL_METHOD(n, ncpp, c, b, r, p0, ep, p, d)", lc, ln);
      case bypass:
            o.concatx(genloc__, indents(ind + 1), "struct ", c, sc, "_", sc, n, sc, "_Functor", lc, ln);
            o.concatx(genloc__, indents(ind + 1), "{", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "int _[0];", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "typedef r (* FunctionType)(", p0, " ", p, ");", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "inline FunctionType operator= (FunctionType func)", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "{", lc, ln);
                  o.concatx(genloc__, indents(ind + 3), "SELF(", c, ", ", ncpp, ");", lc, ln);
                  o.concatx(genloc__, indents(ind + 3), "if(self->vTbl == c::_class.vTbl)", lc, ln);
                  o.concatx(genloc__, indents(ind + 3), "{", lc, ln);
                     o.concatx(genloc__, indents(ind + 4), "uint size = ", c, " :: _class.impl->vTblSize;", lc, ln);
                     o.concatx(genloc__, indents(ind + 4), "self->vTbl = (void (**)())newt(FunctionType, size);", lc, ln);
                     o.concatx(genloc__, indents(ind + 4), "memcpy(self->vTbl, ", c, "::_class.vTbl, sizeof(FunctionType) * size);", lc, ln);
                  o.concatx(genloc__, indents(ind + 3), "}", lc, ln);
                  o.concatx(genloc__, indents(ind + 3), "((FunctionType *)self->vTbl)[M_VTBLID(", b, ", ", n, ")] = func;", lc, ln);
                  o.concatx(genloc__, indents(ind + 3), "return func;", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "}", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "inline r operator()(", ep, " ", p, ")", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "{", lc, ln);
                  o.concatx(genloc__, indents(ind + 3), "SELF(", c, ", ", ncpp, ");", lc, ln);
                  o.concatx(genloc__, indents(ind + 3), "", d, ";", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "}", lc, ln);
            o.concatx(genloc__, indents(ind + 1), "} ", ncpp, ";", lc, ln);
            o.concatx(genloc__, indents(ind + 1), "inline static void register_", sc, n, "(CPPClass & cl, ", c, sc, "_", sc, n, sc, "_Functor::FunctionType func)", lc, ln);
            o.concatx(genloc__, indents(ind + 1), "{", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "((", c, sc, "_", sc, n, sc, "_Functor::FunctionType *)cl.vTbl)[M_VTBLID(", b, ", ", n, ")] = func;", lc, ln);
            o.concatx(genloc__, indents(ind + 1), "}", ln);
         break;
      case use:
         o.concatx(genloc__, indents(ind), "VIRTUAL_METHOD(", n, ", ", ncpp, ", ", c, ", ", b, ",", lc, ln);
            o.concatx(genloc__, indents(ind + 1), r, ", ", p0, ", ", ep, ", ", p, ",", lc, ln);
            o.concatx(genloc__, indents(ind + 1), d, ");");
         break;
   }
}

/*static */void cppDefineMacroIntRegisterMethod(
      CPPGen g,            // generator
      ZString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroIntRegisterMethod(g, o, def, ind,
         "cp1",
         "cp2",
         "ns",
         "n",
         "bc",
         "c",
         "r",
         "p",
         "ocl",
         "oi",
         "code",
         "ea",
         "rv",
         0); }

static void cppMacroIntRegisterMethod(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * cp1,    // cp1?
      const char * cp2,    // cp2?
      const char * ns,     // ns?
      const char * n,      // n?
      const char * bc,     // bc?
      const char * c,      // c?
      const char * r,      // r?
      const char * p,      // p?
      const char * ocl,    // ocl?
      const char * oi,     // oi?
      const char * code,   // code?
      const char * ea,     // ea?
      const char * rv,     // return value
      void * unused)
{
   const char * lc = mode == def ? " \\" : "";     // line continuation
   const char * sc = mode == bypass ? "" : " ## "; // symbol concatenation
   switch(mode)
   {
      case def:
         o.concatx(genloc__, indents(ind), "#define _REGISTER_METHOD(cp1, cp2, ns, n, bc, c, r, p, ocl, oi, code, ea, rv)", lc, ln);
      case bypass:
            o.concatx(genloc__, indents(ind + 1), "addMethod(_class.impl, ", ns, ", (void *) +[]", p, "", lc, ln);
            o.concatx(genloc__, indents(ind + 1), "{", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "Class * cl = (", ocl, ") ? (Class *)(", ocl, ")->_class : null;", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "", cp1[0] ? cp1 : "// 'cp1' is empty", lc, ln);
               o.concatx(genloc__, indents(ind + 2), c, " * i = (", oi, ") ? (", c, " *)_INSTANCE(", oi, ", cl) : null;", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "int vid = M_VTBLID(", bc, ", ", n, ");", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "", bc, sc, "_", sc, n, sc, "_Functor::FunctionType fn;", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "if(i && i->vTbl && i->vTbl[vid])", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "{", lc, ln);
                  o.concatx(genloc__, indents(ind + 3), "fn = (", bc, sc, "_", sc, n, sc, "_Functor::FunctionType) i->vTbl[vid];", lc, ln);
                  o.concatx(genloc__, indents(ind + 3), "", code, ";", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "}", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "", cp2[0] ? cp2 : "// 'cp2' is empty", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "else", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "{", lc, ln);
                  o.concatx(genloc__, indents(ind + 3), "auto method = ((", r, " (*) ", p, ")(class_", sc, c, "->_vTbl)[M_VTBLID(", bc, ", ", n, ")]);", lc, ln);
                  o.concatx(genloc__, indents(ind + 3), "if(method) return method ", ea, ";", lc, ln);
                  o.concatx(genloc__, indents(ind + 3), "return ", rv, ";", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "}", lc, ln);
            o.concatx(genloc__, indents(ind + 1), "})", ln);
         break;
      case use:
         o.concatx(genloc__, indents(ind), "_REGISTER_METHOD(",
               cp1,  ", ",
               cp2,  ", ",
               ns,   ", ",
               n,    ", ",
               bc,   ", ",
               c,    ", ",
               r,    ", ",
               p,    ", ",
               ocl,  ", ",
               oi,   ", ",
               code, ", ",
               ea,   ", ",
               rv,   ")");
         break;
   }
}

/*static */void cppMacroRegisterMethod(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * ns,     // ns?
      const char * n,      // n?
      const char * bc,     // bc?
      const char * c,      // c?
      const char * r,      // r?
      const char * p,      // p?
      const char * ocl,    // ocl?
      const char * oi,     // oi?
      const char * code,   // code?
      const char * ea,     // ea?
      const char * rv,     // return value
      void * unused)
{
   MacroMode /*submode = mode == bypass ? bypass : use; */submode = mode == def ? use : g.macroBits.intRegisterMethod;
   const char * lc = mode == def ? " \\" : "";     // line continuation
   switch(mode)
   {
      case def:
         o.concatx(genloc__, indents(ind), "#define REGISTER_METHOD(ns, n, bc, c, r, p, ocl, oi, code, ea, rv)", lc, ln);
      case bypass:
         cppMacroIntRegisterMethod(g, o, submode, ind + 1,
               "",
               "",
               ns,
               n,
               bc,
               c,
               r,
               p,
               ocl,
               oi,
               code,
               ea,
               rv,
               0);
         o.concatx(ln);
         break;
      case use:
         o.concatx(genloc__, indents(ind), "REGISTER_METHOD(",
               ns,   ", ",
               n,    ", ",
               bc,   ", ",
               c,    ", ",
               r,    ", ",
               p,    ", ",
               ocl,  ", ",
               oi,   ", ",
               code, ", ",
               ea,   ", ",
               rv,   ")");
         break;
   }
}

/*static */void cppDefineMacroRegisterTypedMethod(
      CPPGen g,            // generator
      ZString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroRegisterTypedMethod(g, o, def, ind,
         "ns",
         "n",
         "bc",
         "c",
         "r",
         "p",
         "ocl",
         "oi",
         "code",
         "ea",
         "rv",
         0); }

static void cppMacroRegisterTypedMethod(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * ns,     // ns?
      const char * n,      // n?
      const char * bc,     // bc?
      const char * c,      // c?
      const char * r,      // r?
      const char * p,      // p?
      const char * ocl,    // ocl?
      const char * oi,     // oi?
      const char * code,   // code?
      const char * ea,     // ea?
      const char * rv,     // return value
      void * unused)
{
   char * s1;
   char * s2;
   const char * lc = mode == def ? " \\" : "";     // line continuation
   MacroMode /*submode = mode == bypass ? bypass : use;*/submode = mode == def ? use : g.macroBits.intRegisterMethod;
   switch(mode)
   {
      case def:
         o.concatx(genloc__, indents(ind), "#define REGISTER_TYPED_METHOD(ns, n, bc, c, r, p, ocl, oi, code, ea, rv)", lc, ln);
      case bypass:
      {
         const char * lc = submode == bypass ? "" : " \\";  // line continuation
         const char * sc = submode == bypass ? "" : " ## "; // symbol concatenation
         cppMacroIntRegisterMethod(g, o, submode, ind + 1,
               (s1 = PrintString(lc, ln, genloc__, indents(ind + 2),
                     "CPPClass * cppcl = _class ? (CPPClass *)_class->bindingsClass : null;", lc, ln,
                     genloc__, indents(ind + 2))),
               (s2 = PrintString("else if(cppcl && cppcl->vTbl && cppcl->vTbl[vid])", lc, ln,
                     genloc__, indents(ind + 2), "{", lc, ln,
                        genloc__, indents(ind + 3), "fn = (", bc, sc, "_", sc, n, sc, "_Functor::FunctionType) cppcl->vTbl[vid];", lc, ln,
                        genloc__, indents(ind + 3), code, ";", lc, ln,
                     genloc__, indents(ind + 2), "}", lc, ln, genloc__, indents(ind + 2))),
               ns,
               n,
               bc,
               c,
               r,
               p,
               ocl,
               oi,
               code,
               ea,
               rv,
               0);
         delete s1;
         delete s2;
         o.concatx(ln);
         break;
      }
      case use:
         o.concatx(genloc__, indents(ind), "REGISTER_TYPED_METHOD(",
               ns,   ", ",
               n,    ", ",
               bc,   ", ",
               c,    ", ",
               r,    ", ",
               p,    ", ",
               ocl,  ", ",
               oi,   ", ",
               code, ", ",
               ea,   ", ",
               rv,   ")");
         break;
   }
}

/*static */void cppDefineMacroProperty(
      CPPGen g,            // generator
      ZString o,     // output
      uint ind,            // indents
      void * unused,
      bool protoOrImpl) {     // unused  // true for Prototype, false for implementation
   cppMacroProperty(g, o, def, ind,
         "n",
         "sg",
         0,
         protoOrImpl); }

static void cppMacroProperty(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * n,      // name of property
      const char * sg,     // set/get(/isset)
      void * unused,
      bool protoOrImpl)
{
   const char * sc = mode == bypass ? "" : " ## "; // symbol concatenation
   switch(mode)
   {
      case def:
         if(protoOrImpl == true)
            o.concatx(genloc__, indents(ind), "#define propertyProto(n, sg) ");
         else
            o.concatx(genloc__, indents(ind), "#define propertyImpl(sg) ");
      case bypass:
         if(protoOrImpl == true)
            o.concatx("struct ", n, sc, "Prop { ", n, sc, "Prop() { }; int _[0]; ", sg, " } ", n, ";", ln);
         else
            o.concatx(sg, ln);
         break;
      case use:
         if(protoOrImpl == true)
            o.concatx(genloc__, indents(ind), "propertyProto(",
               n,    ", ",
               sg,   ");", ln);
         else
            o.concatx(genloc__, indents(ind), "propertyImpl(",
               sg,   ");", ln);
         break;
   }
}

/*static */void cppDefineMacroIntPropSet(
      CPPGen g,            // generator
      ZString o,     // output
      uint ind,            // indents
      void * unused,
      bool protoOrImpl) {     // unused
   cppMacroIntPropSet(g, o, def, ind,
         "t",
         "n",
         "c",
         "d",
         0,
         protoOrImpl); }

static void cppMacroIntPropSet(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * t,      // t?
      const char * n,      // n?
      const char * c,      // c?
      const char * d,      // d?
      void * unused,
      bool protoOrImpl)
{
   const char * lc = mode == def ? " \\" : "";     // line continuation
   switch(mode)
   {
      case def:
         if(protoOrImpl == true)
            o.concatx(genloc__, indents(ind), "#define _setProto(t, n, c, d)", lc, ln);
         else
            o.concatx(genloc__, indents(ind), "#define _setImpl(t, n, c, d)", lc, ln);
      case bypass:
         if(protoOrImpl == true)
            o.concatx(genloc__, indents(ind + 1), t, " operator= (", t, " v);", lc, ln);
         else
         {
            o.concatx(genloc__, indents(ind + 1), t, " ", c, "::", n, " ## ", "Prop::", "operator= (", t, " v)", lc, ln);
            o.concatx(genloc__, indents(ind + 1), "{", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "SELF(", c, ", ", n, ");", lc, ln);
               o.concatx(genloc__, indents(ind + 2), d, ";", lc, ln);
               o.concatx(genloc__, indents(ind + 2), "return v;", lc, ln);
            o.concatx(genloc__, indents(ind + 1), "}", lc, ln);
         }
         break;
      case use:
         if(protoOrImpl == true)
            o.concatx(genloc__, indents(ind), "_setProto(",
                  t,    ", ",
                  n,    ", ",
                  c,    ", ",
                  d,    ")");
         else
            o.concatx(genloc__, indents(ind), "_setImpl(",
                  t,    ", ",
                  n,    ", ",
                  c,    ", ",
                  d,    ")");
         break;
   }
}

/*static */void cppDefineMacroPropSet(
      CPPGen g,            // generator
      ZString o,     // output
      uint ind,            // indents
      void * unused,
      bool protoOrImpl) {     // unused
   cppMacroPropSet(g, o, def, ind,
         "t",
         "n",
         "c",
         "d",
         0,
         protoOrImpl); }

static void cppMacroPropSet(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * t,      // t?
      const char * n,      // n?
      const char * c,      // c?
      const char * d,      // d?
      void * unused,
      bool protoOrImpl)
{
   const char * lc = mode == def ? " \\" : "";     // line continuation
   MacroMode /*submode = mode == bypass ? bypass : use;*/submode = mode == def ? use : g.macroBits.intPropSet;
   switch(mode)
   {
      case def:
         if(protoOrImpl == true)
            o.concatx(genloc__, indents(ind), "#define setProto(t, n, c, d)", lc, ln);
         else
            o.concatx(genloc__, indents(ind), "#define setImpl(t, n, c, d)", lc, ln);
      case bypass:
      {
         const char * lc = submode == bypass ? "" : " \\";  // line continuation
         const char * sc = submode == bypass ? "" : " ## "; // symbol concatenation
         cppMacroIntPropSet(g, o, submode, ind + 1,
            t,
            n,
            c,
            d,
            0,
            protoOrImpl);
         if(protoOrImpl == true)
         {
            o.concatx(lc, ln);
            o.concatx(genloc__, indents(ind + 1), n, sc, "Prop & operator= (", n, sc, "Prop & prop);", ln);
         }
         else
         {
            o.concatx(lc, ln);
               o.concatx(genloc__, indents(ind + 1), c, "::", n, sc, "Prop & ", c, "::", n, sc, "Prop::operator= (", c, "::", n, sc, "Prop & prop)", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "{", lc, ln);
                  o.concatx(genloc__, indents(ind + 2), "SELF(", c, ", ", n, ");", lc, ln);
                  o.concatx(genloc__, indents(ind + 2), t, " v = prop;", lc, ln);
                  o.concatx(genloc__, indents(ind + 2), d, ";", lc, ln);
                  o.concatx(genloc__, indents(ind + 2), "return prop;", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "}", ln);
         }
         break;
      }
      case use:
         if(protoOrImpl == true)
            o.concatx(genloc__, indents(ind), "setProto(",
                  t,    ", ",
                  n,    ", ",
                  c,    ", ",
                  d,    ")");
         else
            o.concatx(genloc__, indents(ind), "setImpl(",
                  t,    ", ",
                  n,    ", ",
                  c,    ", ",
                  d,    ")");
         break;
   }
}

/*static */void cppDefineMacroPropGet(
      CPPGen g,            // generator
      ZString o,     // output
      uint ind,            // indents
      void * unused,
      bool protoOrImpl) {     // unused
   cppMacroPropGet(g, o, def, ind,
         "t",
         "n",
         "c",
         "d",
         0,
         protoOrImpl); }


static void cppMacroPropGet(
      CPPGen g,            // generator
      ZString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * t,      // t?
      const char * n,      // n?
      const char * c,      // c?
      const char * d,      // d?
      void * unused,
      bool protoOrImpl)
{
   switch(mode)
   {
      case def:
         if(protoOrImpl == true)
            o.concatx(genloc__, indents(ind), "#define getProto(t, n, c, d) ");
         else
            o.concatx(genloc__, indents(ind), "#define getImpl(t, n, c, d) ");
      case bypass:
         if(protoOrImpl)
            o.concatx("operator ", t, " () const;", ln);
         else
            o.concatx(c, "::", n, " ## ", "Prop::operator ", t, " () const { SELF(", c, ", ", n, "); ", d, "; }", ln);
         break;
      case use:
         if(protoOrImpl)
            o.concatx(genloc__, indents(ind), "getProto(",
               t,    ", ",
               n,    ", ",
               c,    ", ",
               d,    ")");
         else
            o.concatx(genloc__, indents(ind), "getImpl(",
               t,    ", ",
               n,    ", ",
               c,    ", ",
               d,    ")");
         break;
   }
}
