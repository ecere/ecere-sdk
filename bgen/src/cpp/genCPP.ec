#include "debug.eh"
#include "bgen.eh"

import "bgen"
import "cppHardcoded"

AVLTree<consttstr> tmpclincl
{ [
   { "eC", "Surface" },
   { "eC", "IOChannel" },
//   { "eC", "Window" },
//   { "eC", "DataBox" },
   { "eC", "Instance" },
   { "eC", "Module" },
   { "eC", "Application" },
   { "eC", "Container" },
   { "eC", "Array" },
   { "eC", "CustomAVLTree" },
   { "eC", "AVLTree" },
   { "eC", "Map" },
   { "eC", "LinkList" },
   { "eC", "List" },
   { "eC", "SerialBuffer" },
   { "eC", "OldArray" },
   { "eC", "" },
   { null, null }
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
         if(g_.lib.ecereCOM && !tmpclincl.Find({ g_.lib.bindingName, c.name }))
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
         if(g_.lib.ecereCOM && !tmpclincl.Find({ g_.lib.bindingName, c.name }))
            skip = true;
         if(!skip && !c.cl.templateClass)
            processCppClass(this, c);
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
      if(g.lib.ecereCOM && !tmpclincl.Find({ g.lib.bindingName, c.name }))
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
         if(g.lib.ecereCOM && !tmpclincl.Find({ g.lib.bindingName, c.cl.name }))
            skip = true;
         if(!skip && c.cl.type == normalClass && !c.cl.templateClass)
         {
            firstClass = c.cl;
            f.PrintLn("TCPPClass<", c.cl.name, "> ", c.cl.name, "::_class;");
         }
      }
   }
   f.PrintLn("");
   f.PrintLn("void ", g.lib.name, "_cpp_init(Module & module)");
   f.PrintLn("{");
   f.PrintLn("   if(!", firstClass.name, "::_class.impl)");
   f.PrintLn("   {");
   {
      BClass c; IterAllClass itacl { itn.module = g.mod/*module = g.mod*/ };
      while((c = itacl.next(all)))
      {
         bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString || c.cl.type == systemClass;
         if(g.lib.ecereCOM && !tmpclincl.Find({ g.lib.bindingName, c.cl.name }))
            skip = true;
         if(!skip && c.cl.type == normalClass && !c.cl.templateClass)
            f.PrintLn("      REGISTER_CPP_CLASS(", c.cl.name, ", module);");
      }
   }
   f.PrintLn("   }");
   f.PrintLn("}");
   f.PrintLn("");
   //if(g.lib.ecere) // hardcoded

   if(g.lib.ecereCOM) // hardcoded
   {
      f.PrintLn("// Instance methods depending on libecere");
      f.PrintLn("void Instance::class_registration(CPPClass & _class) { /*Instance_class_registration(Instance);*/ }");
      //f.PrintLn("void FontResource::class_registration(CPPClass & _class) { Instance_class_registration(FontResource); }");
   }
}

Map<consttstr, const String> methodParamNameSwap { [
   { { "onCompare", "object" }, "o2" },
   { { "onCopy", "newData" }, "src" },
   { { null, null }, null }
] };

Map<const String, const String> methodTypedObjectThisNameSwap { [
   { "onCopy", "dest" },
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
      BOutput o { vclass, c = c, ds = { } };
      BMethod m; IterMethod itm { c.isInstance ? cBase.cl : c.cl };
      //const char * sn = c.symbolName;
      const char * cn = c.name;
      const char * bn = cBase ? cBase.name : "";
      const char * un = c.upper;
      bool hasBase = cBase && cBase.cl.type != systemClass;
      //bool first;
      //TypeInfo ti;

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
         o.ds.println("");
         while((m = itm.next(publicVirtual)))
         {
            const char * cn = c.name, * bn = cBase.name, * mn = m.mname;
            o.ds.printxln("#define ", cn, "_", mn, "_vTblID", spaces(nameLen, strlen(mn)), " ", bn, "_", mn, "_vTblID");
         }
      }

      if(!(g.lib.ecereCOM && (c.isSurface || /*c.isIOChannel || */c.isWindow || c.isDataBox)))
      {
         if(g.macroBits.registerClassDef == use)
            cppDefineMacroClassRegistration(g, o.ds, 0, c, cBase, 0);
#if 0
         o.ds.printx(ln, "#define ", c.name, "_class_registration(d)");
         while((m = itm.next(publicVirtual)))
         {
            Type param, t = m.md.dataType;
            const char * on = m.name, * mn = m.mname;
            bool byRefTypedThis = false;
            bool noRet = t.returnType.kind == voidType;
            bool destVsSrc = !strcmp(mn, "onCopy") ? true : false;
            const char * first = null;
            const char * nthis = null;
            char * typeString = t.returnType.kind == classType && t.returnType.classObjectType == anyObject ? CopyString(g_.sym.instance) : printType(t.returnType, false, false, false);
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
            o.ds.printx(lc, ln);
            o.ds.printx("   REGISTER_TYPED_METHOD(\"", on, "\", ", mn, ", ", cn, ", d, ");
            if(ctRT == normalClass || ctRT == noHeadClass)
               o.ds.printx(cParamRT.symbolName);
            else
               o.ds.printx(strptrNoNamespace(typeString));
            o.ds.printx(",", lc, ln,
                        "      (");
            //delete typeString;
            if(t.kind == functionType)
            {
               bool comma = false; //const char * comma = "";
               switch(t.classObjectType)
               {
                  case none: break;
                  //case classPointer: conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                  case typedObject:
                  {
                     byRefTypedThis = t.byReference;
                     nthis = iMetThisNameSwap.Index(mn, false) ? iMetThisNameSwap.data : "o";
                     o.ds.printx("Class * _class, C(Instance) ", byRefTypedThis ? "* " : "", nthis);
                     comma = true; //comma = ", ";
                     break;
                  }
                  //case anyObject:    conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                  default:           conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
               }
               argsInfo = { type = m.md.dataType, m = m, md = m.md, cl = c.cl, c = c };
               o.ds.printx((params = cppParams(argsInfo, regMethodParamList, comma, &first)));
               delete params;
#if 0
               if(!(t.params.count == 1 && ((Type)t.params.first).kind == voidType))
               {
                  const char * sep = comma ? ", " : "";
                  for(param = t.params.first; param; param = param.next)
                  {
                     const char * name = iMetParNamSwp.Index({ mn, param.name }, false) ? iMetParNamSwp.data : param.name;
                     //const char * typeString = param.kind == classType && param.classObjectType == anyObject ? g.sym.instance : tokenTypeString(param);
                     char * typeString = param.kind == classType && param.classObjectType == anyObject ? CopyString(g.sym.instance) : printType(param, false, false, false);
                     if(!first) first = name;
                     o.ds.printx(sep, typeString, " ", name);
                     delete typeString;
                     if(!sep[0]) sep = ", ";
                  }
               }
#endif // 0
            }
            else conmsg(t.kind, " is not handled here. todo?");
            o.ds.printx("),", lc, ln,
                        "      ", destVsSrc ? first : nthis, ", ", nthis, byRefTypedThis ? " ? *" : "", byRefTypedThis ? nthis : "", byRefTypedThis ? " : null" : "");
                     // ", ", noRet ? "" : "return ", "fn(*i, *(", cn, " *)INSTANCEL(", first, ", ", first, "->_class)),", lc, ln,
            o.ds.printx(", ", noRet ? "" : "return ", "fn(*i", (args = cppParams(argsInfo, regMethodArgsPassing, false, 0)), "),", lc, ln);
            delete args;
            o.ds.printx("      (");
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
                     o.ds.printx("_class, ", nthis);
                     comma = ", ";
                     break;
                  }
                  //case anyObject:    conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                  case none:
                     break;
                  default:           conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
               }
               if(!(t.params.count == 1 && ((Type)t.params.first).kind == voidType))
                  for(param = t.params.first; param; param = param.next)
                  {
                     MapIterator<consttstr, const String> i { map = methodParamNameSwap };
                     const char * name = i.Index({ mn, param.name }, false) ? i.data : param.name;
                     o.ds.printx(comma, name);
                     if(!comma[0]) comma = ", ";
                  }
            }
            else conmsg(t.kind, " is not handled here. todo?");
            o.ds.printx("), ", noRet ? "" : "1", ");");
            content = true;
         }
         if(content) o.ds.printx(ln);
#endif // 0

         //cppMacroClassVirtualMethods(g, o.ds, def, 0, "
         if(g.macroBits.virtualMethod == use)
            cppDefineMacroClassVirtualMethods(g, o.ds, 0, un, c, cBase, 0);
#if 0
         o.ds.printx(ln, "#define ", un, "_VIRTUAL_METHODS(c) \\", ln);
         first = true;
         while((m = itm.next(publicVirtual)))
         {
            MacroMode mode = macroBits.ds;
            char * params = null;
            char * args = null;
            const char * mn = m.mname, * tn = m.s;
            Type t = m.md.dataType;
            Class clRegRT;
            BClass cParamRT;
            bool hackRT;
            ClassType ctRT = cppGetClassInfoFromType(t.returnType, &clRegRT, &cParamRT, &hackRT);
            bool noRet = t.returnType.kind == voidType;
            TypeInfo argsInfo;
            bool hasArgs = !(t.params.count == 0 || (t.params.count == 1 && ((Type)t.params.first).kind == voidType));
            // VIRTUAL_METHOD(n, c, b, r, p0, ep, p, d)
            // name, class, b (other?), return type, p0?, ep?, p?, d?
            if(!first && mode != bypass)
               o.ds.printx(" \\", ln);
            else
               first = false;
            ti = { type = t.returnType, md = m.md, cl = c.cl, c = c };
            argsInfo = { type = t, m = m, md = m.md, cl = c.cl, c = c };
            {
               bool opt1 = ctRT == normalClass || ctRT == noHeadClass;
               char * s1 = null;
               char * s2 = null;
               char * s3 = null;
               cppMacroVirtualMethod(g, o.ds, mode, 1,
                     mn,
                     "c",
                     cn,
                     (s1 = opt1 ? CopyString(cParamRT.name) : cppTypeName(ti, true)),
                     (s2 = PrintString("c &", hasArgs ? " _ARG" : "")),
                     "",
                     (params = cppParams(argsInfo, _argParamList, false, 0)),
                     (s3 = opt1 ?
                           PrintString(cParamRT.symbolName, " ret", cParamRT.name, " = ", c.isInstance ? "Instance" : "", tn, "(_class.impl, self ? self->impl : (", sn, ")null", (args = cppParams(argsInfo, passing, false, 0)), ");", lc, ln,
                                       "return ", "*(", cParamRT.name, " *)_INSTANCE(ret", cParamRT.name, ", ret", cParamRT.name, "->_class); );") :
                           PrintString(noRet ? "" : "return ", c.isInstance ? "Instance" : "", tn, "(_class.impl, self ? self->impl : (", sn, ")null", (args = cppParams(argsInfo, passing, false, 0)), "));")),
                     0);
               delete s1;
               delete s2;
               delete s3;
            }

#if 0
            o.ds.printx("   VIRTUAL_METHOD(", mn, ", c, ", cn, ", \\", ln);
            if(!strcmp(mn, "onEdit"))
            {
               conmsg("step");
               //ctRT = cppGetClassInfoFromType(t.returnType, &clRegRT, &cParamRT, &hackRT);
            }
            if(ctRT == normalClass || ctRT == noHeadClass)
               o.ds.printx("      ", cParamRT.name);
            else
               o.ds.printx("      ", (s = cppTypeName(ti, true)));
            o.ds.printx(", c &", hasArgs ? " _ARG" : "", ", , ", (params = cppParams(argsInfo, _argParamList, false, 0)), ", \\", ln);
            if(ctRT == normalClass || ctRT == noHeadClass)
            {
               o.ds.printx("      ", cParamRT.symbolName, " ret", cParamRT.name, " = ", c.isInstance ? "Instance" : "", tn, "(_class.impl, self ? self->impl : (", sn, ")null", (args = cppParams(argsInfo, passing, false, 0)), ");", lc, ln,
                           "      ", "return ", "*(", cParamRT.name, " *)_INSTANCE(ret", cParamRT.name, ", ret", cParamRT.name, "->_class); );");
            }
            else
               o.ds.printx("      ", noRet ? "" : "return ", c.isInstance ? "Instance" : "", tn, "(_class.impl, self ? self->impl : (", sn, ")null", (args = cppParams(argsInfo, passing, false, 0)), "));");
                        //"      return ", c.isInstance ? "Instance" : "", tn, "(_class.impl, self ? self->impl : (", sn, ")null", ", &b ? b.impl : (", sn, ")null));");
#endif // 0
#if 0
            if(s[1] == '(' && s[strlen(s) - 1] == ')')
            {
               s[strlen(s) - 1] = '\0';
               if(tmpcppececeremess.Find(s + 2))
               {
                  delete s;
                  s = cppTypeName(ti, true);
               }
            }
#endif // 0
            delete s;
            delete params;
            delete args;
         }
         o.ds.printx(ln);
#endif // 0
      }

      o.ds.printx(ln, genloc__, "class ", cn);
      if(!(g.lib.ecereCOM && (c.isSurface || /*c.isIOChannel || */c.isWindow || c.isDataBox)))
      {
         if(cBase && cBase.cl.type != systemClass)
            o.ds.printx(" : public ", bn);
         o.ds.printx(ln, genloc__, "{", ln, genloc__, "public:", ln);
         if(c.isInstance)
            cppHardcodedInstance(o);
         else if(c.isModule)
            cppHardcodedModule(o);
         else
         {
            Property pt; IterProperty prop { c };
            DataMember dm; IterDataMember dat { c };

            MacroMode mode = use;
            cppMacroConstructClass(g, o.ds, mode, 1, cn, bn, 0);
            if(mode != bypass)
               o.ds.printx(genloc__, " { }", ln);

            o.ds.printx(genloc__, ln, indents(1), un, "_VIRTUAL_METHODS(", c.name, ")", ln);
            //o.ds.printx(ln, genloc__, indents(0));
            //cppMacroClassRegister(g, o.ds, mode, 1, 0);
            //o.ds.printx(" { }", ln);
            /*
            if(mode == bypass)
               o.ds.printx(ln, genloc__, indents(0));
            else o.ds.printx(" ");
            o.ds.printx("{");
            if(mode == bypass)
               o.ds.printx(ln, genloc__, indents(0));
            else o.ds.printx(" ");
            cppMacroClassRegistration(g, o.ds, mode, 1, c, cBase, 0);
            if(mode == bypass)
               o.ds.printx(ln, genloc__, indents(0));
            else o.ds.printx(" ");
            o.ds.printx("}", ln);*/

            // o.ds.printx("   CONSTRUCT(", cn, ", ", bn, ") { }", ln);

            // Class Registration
            o.ds.printx("   REGISTER() { ", /*TODO: Enable registration...*/ /*bn, "_class_registration(", cn, ");", */ " }", ln);

            // Properties
            while((pt = prop.next(publicOnly)))
            {
               // TOCHECK: How should this be handled?
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
                  String tn = cppTypeName(ti, false);
                  ZString sg { allocType = heap };

                  sg.copy("");
                  if(pt.Set)
                     sg.concatx(" set(", tn, ", ", pt.name, ", ", cn, ", ", cn, "_set_", pt.name, "(self->impl, v);)");
                  if(pt.Get)
                     sg.concatx(" get(", tn, ", ", pt.name, ", ", cn, ", return ", cn, "_get_", pt.name, "(self->impl);)");

                  // v.processDependency(this, pt.dataType, pt.dataTypeString, oproperty, v);

                  cppMacroProperty(g, o.ds, use, 1, pt.name, sg._string, null);

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
                  if(eClass_FindProperty(c.cl, dm.name, c.cl.module))
                     continue;    // Skip members which already have properties of the same name...

                  // TOCHECK: How should this be handled?

                  // TODO: Fix types for classes...
                  if(dm.dataType.kind != classType && dm.dataType.kind != templateType && dm.dataType.kind != pointerType)
                  {
                     TypeInfo ti { type = dm.dataType };
                     String tn = cppTypeName(ti, false);
                     ZString sg { allocType = heap };

                     sg.copy("");
                     // TODO: Don't output set if const ?
                     sg.concatx(" set(", tn, ", ", dm.name, ", ", cn, ", ", "IPTR(self->impl, ", cn, ")->", dm.name, " = v;)");
                     sg.concatx(" get(", tn, ", ", dm.name, ", ", cn, ", return self ? IPTR(self->impl, ", cn, ")->", dm.name, " : 0;)");

                     // v.processDependency(this, pt.dataType, pt.dataTypeString, oproperty, v);

                     cppMacroProperty(g, o.ds, use, 1, dm.name, sg._string, null);

                     delete sg;
                     delete tn;
                  }
               }
            }
         }

         o.ds.printx(genloc__, "}");
      }
      o.ds.printx(";", ln);
   }
}
                                // FIXME: What is this 'asis' parameter????
char * cppTypeName(TypeInfo ti, bool asis)
{
   char * result;
   DynamicString z { };
   //cppTypeNameCall = true;
   // note: calling zTypeName creates templaton output objects with null ds
   zTypeName(z, null, ti, { anonymous = true, asis = asis }, null);
   //cppTypeNameCall = false;
   {
      ClassType ct = cppGetClassInfoFromType(ti.type, null, null, null);
      if(ct == normalClass) // || ct == noHeadClass)
         z.print(" &");
   }
   result = CopyString(z.array);
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

void cppTypeSpec(DynamicString z, const char * ident, TypeInfo ti, OptBits opt, BVariant vTop)
{
   TypeNameList list { };
   astTypeName(ident, ti, opt, vTop, list);
   ec2PrintToDynamicString(z, list, false);
   list.Free();
   delete list;
}

ClassType cppGetClassInfoFromType(Type type, Class * clRegRet, BClass * cParamRet, bool * hackRet)
{
   bool any;
   bool hack;
   BClass cParam;
   ClassType ct;
   Class clReg = type._class ? type._class.registered : null;
   const char * name = type._class && type._class.string ? strptrNoNamespace(type._class.string) : null;
   //if(type.kind == classType && !strcmp(name, "DataBox"))
   //   conmsg("break");
   if(!clReg && name && g_.lib.ecereCOM && tmpcppececeremess.Find(name))
      clReg = getEcEcereMessBaseClass(name);
   //if(!clReg && type._class && type.kind == classType)
   //   conmsg("no class for ", name, " of ", type.type, " type");
   //Class clReg = type._class ? type._class.registered ? type._class.registered :
   //      eSystem_FindClass(__thisModule, name) : null; // hack: FindClass in __thisModule
   ct = type.kind == classType ? (clReg ? clReg.type : normalClass) : systemClass;
   any = type.kind == classType && type.classObjectType == anyObject;
   hack = g_.lib.ecereCOM && (ct == normalClass || ct == noHeadClass) &&
         tmpcppececeremess.Find(name ? name : strptrNoNamespace(type._class.registered.name));
   /*hack = g_.lib.ecereCOM && (ct == normalClass || ct == noHeadClass) &&
            (!type._class.registered || !strcmp(name, "Window") || !strcmp(name, "IOChannel")) &&
            tmpcppececeremess.Find(name);*/
   cParam = ((ct != systemClass || any) && ct != bitClass) ?
         clReg && !any && !hack ? clReg : eSystem_FindClass(g_.mod, "Instance") : null;
   //BClass cParam = (clReg && (ct != systemClass || any) && ct != bitClass) ? clReg : null;
   //conassertx(clReg != null, "need a class -- ");
   //if(g_.lib.ecereCOM && type.kind == classType && type._class && !strcmp(name, "Alignment")) //DataDisplayFlags
   //   conmsg("break");
   /*
      normalClass,
      structClass,
      bitClass,
      unitClass,
      enumClass,
      noHeadClass,
      unionClass, // Temporary only in firstPass
      systemClass = 1000
   */

   if(clRegRet) *clRegRet = clReg;
   if(cParamRet) *cParamRet = cParam;
   if(hackRet) *hackRet = hack;
   return ct;
}

enum CPPParamsOutputMode { regMethodParamList, regMethodArgsPassing, _argParamList, passing };
char * cppParams(TypeInfo ti, CPPParamsOutputMode mode, bool comma, const char ** first)
{
   char * result;
   DynamicString z { };
   Type t = ti.type;
   if(t.params.count == 1 && ((Type)t.params.first).kind == voidType)
   {
      /*if(mode == _argParamList)
         z.print("void");*/
   }
   else
   {
      Type param;
      const char * sep = "";
      uint ap;

#if 0
      switch(mode)
      {
         case _argParamList:
            for(param = t.params.first; param; param = param.next)
            {
               char * apname = null;
               MapIterator<consttstr, const String> i { map = methodParamNameSwap };
               const char * name = i.Index({ ti.m.mname, param.name }, false) ? i.data : param.name;
               if(!name) apname = PrintString("ap", ++ap), name = apname;
               z.printx(sep);
               cppTypeSpec(z, "ident___", { type = param, cl = ti.cl }, { anonymous = true, asis = true }, ti.cl);
               z.printx(" & ", name);//, " ? ", name);
               //if(!sep[0]) sep = _arg ? " _ARG " : ", ";
               if(!sep[0]) sep = " _ARG ";
               delete apname;
            }
            break;
         case passing:
#endif // 0
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
#if 0
               Class clReg = param._class ? param._class.registered : null;
               //if(param.kind == classType && !strcmp(param._class.string, "DataBox"))
               //   conmsg("break");
               if(!clReg && param._class && g_.lib.ecereCOM && tmpcppececeremess.Find(param._class.string))
                  clReg = getEcEcereMessBaseClass(param._class.string);
               //if(!clReg && param._class && param.kind == classType)
               //   conmsg("no class for ", param._class.string, " of ", param.type, " type");
               //Class clReg = param._class ? param._class.registered ? param._class.registered :
               //      eSystem_FindClass(__thisModule, param._class.string) : null; // hack: FindClass in __thisModule
               {
                  ClassType ct = param.kind == classType ? (clReg ? clReg.type : normalClass) : systemClass;
                  bool any = param.kind == classType && param.classObjectType == anyObject;
                  bool hack = g_.lib.ecereCOM && (ct == normalClass || ct == noHeadClass) &&
                           !param._class.registered && tmpcppececeremess.Find(param._class.string);
                  BClass cParam = ((ct != systemClass || any) && ct != bitClass) ?
                        clReg && !any/* && !hack*/ ? clReg : eSystem_FindClass(g_.mod, "Instance") : null;
                  //BClass cParam = (clReg && (ct != systemClass || any) && ct != bitClass) ? clReg : null;
                  //conassertx(clReg != null, "need a class -- ");
                  //if(g_.lib.ecereCOM && param.kind == classType && param._class && !strcmp(param._class.string, "Alignment")) //DataDisplayFlags
                  //   conmsg("break");
#endif // 0
                  z.printx(sep);

                  switch(mode)
                  {
                     case regMethodParamList:
                     {
                        //const char * name = iMetParNamSwp.Index({ ti.m.mname, param.name }, false) ? iMetParNamSwp.data : param.name;
                        //const char * typeString = param.kind == classType && param.classObjectType == anyObject ? g.sym.instance : tokenTypeString(param);
                        char * typeString = param.kind == classType && param.classObjectType == anyObject ? CopyString(g_.sym.instance) : printType(param, false, false, false);
                        if(first && !*first) *first = name;
                        z.printx(strptrNoNamespace(typeString), " ", name);
                        delete typeString;
                        if(!sep[0]) sep = ", ";
                        break;
                     }
                     case regMethodArgsPassing:
                     {
                        bool useL = param.typedByReference || param.byReference; // TODO: Set to true if by reference?
                        if(ct == normalClass || ct == noHeadClass || (param.kind == classType && param.classObjectType == anyObject))
                           //"*(", cn, " *)INSTANCEL(", first, ", ", first, "->_class)"
                           z.printx("*(", cParam.name, " *)", useL ? "INSTANCEL" : "_INSTANCE", "(", name, ", ", name, "->_class)");
                        else
                           z.printx(name);
                        if(!sep[0]) sep = ", ";
                        break;
                     }
                     case _argParamList:
                     {
                        bool asis = ct == normalClass || ct == noHeadClass;

                        if(hack)
                        {
                           z.printx(cParam.name, " /*");
                           cppTypeSpec(z, "ident___", { type = param, cl = ti.cl }, { anonymous = true, asis = asis }, ti.cl);
                           z.printx("*/");

                           if(ct == normalClass || ct == noHeadClass)
                              z.printx(" &");
                        }
                        else if(param.kind == classType && param.classObjectType == anyObject)
                           z.printx("c &");
                        else
                        {
                           cppTypeSpec(z, "ident___", { type = param, cl = ti.cl }, { anonymous = true, asis = false /*asis*/ }, ti.cl);
                        }

                        //if(!name[0])
                        //   conmsg("noname");
                        z.printx(" ", name);//, " ? ", name);
                        break;
                     }
                     case passing:
                     {
                        /*if(g_.lib.ecereCOM && !strcmp(name, "window"))
                        {
                           conmsg("nohack?");
                           ct = cppGetClassInfoFromType(param, &clReg, &cParam, &hack);
                        }*/
                        if(hack)
                           //z.printx("&", name, " ? ((Instance *)&", name, ")->impl : (", cParam.symbolName, ")null");
                           z.printx(name, ".impl");
                        else if(ct == normalClass || (param.kind == classType && param.classObjectType == anyObject))
                           //z.printx("&", name, " ? ", name, ".impl : (", ti.c.symbolName, ")null");
                           //z.printx("&", name, " ? ", name, ".impl : (", cParam.symbolName, ")null");
                           z.printx(name, ".impl");
                        else
                           z.printx(name);
                        break;
                     }
                  }
#if 0
               }
#endif // 0
               if(!sep[0] && mode == _argParamList) sep = " _ARG ";
               delete apname;
            }
#if 0
            break;
         default:
            break;
      }
#endif // 0
   }
   result = CopyString(z.array);
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
         if(o._class == class(BOutput) && ((BOutput)o).ds)
            out.Puts(((BOutput)o).ds.array);
      }*/

//      /*
      if(n.orderedBackwardsOutputs.count)
      {
         //g.astAdd(ASTRawString { string = CopyString("// start -- moved backwards outputs") }, true);
         for(optr : n.orderedBackwardsOutputs)
         {
            BOutput o = (BOutput)optr;
            out.Puts(o.ds.array);
         }
         //g.astAdd(ASTRawString { string = CopyString("// end -- moved backwards outputs") }, true);
      }
      for(optr : n.orderedOutputs)
      {
         BOutput o = (BOutput)optr;
         if(o.kind == vmanual || o.kind == vdefine || o.kind == vfunction ||
               o.kind == vclass || o.kind == vtemplaton || o.kind == vmethod || o.kind == vproperty)
         {
            if(o.ds)
               out.Puts(o.ds.array);
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
      DynamicString o,     // output
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
      DynamicString o,     // output
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
         o.printx(genloc__, indents(ind), "#define _REGISTER_CLASS(n, ns, bs, a)", lc, ln);
      case bypass:
         o.printx(genloc__, indents(ind + 1), "(Class *)eC_registerClass(ClassType_normalClass, ", ns, ", ", bs, ", sizeof(Instance *), 0,", lc, ln);
            o.printx(genloc__, indents(ind + 2), "(C(bool) (*)(void *)) ", n, "::constructor, (void(*)(void *)) ",
                  n, "::destructor, (", a, ").impl, AccessMode_privateAccess, AccessMode_publicAccess)", ln);
         break;
      case use:
         o.printx(genloc__, indents(ind), "_REGISTER_CLASS(",
               n,    ", ",
               ns,   ", ",
               bs,   ", ",
               a,    ")");
         break;
   }
}

/*static */void cppDefineMacroRegisterClassDef(
      CPPGen g,            // generator
      DynamicString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroRegisterClassDef(g, o, def, ind,
         "n",
         "b",
         "a",
         0); }

static void cppMacroRegisterClassDef(
      CPPGen g,            // generator
      DynamicString o,     // output
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
         o.printx(genloc__, indents(ind), "// For defining _class and registereing together (single translation unit)", ln);
         o.printx(genloc__, indents(ind), "#define REGISTER_CLASS_DEF(n, b, a) ");
      case bypass:
            o.printx(genloc__, indents(ind + 1), "TCPPClass<", n, "> ", n, "::_class(_REGISTER_CLASS(", n, ",     #n, ", b, "::_class.impl->name, ", a, "));", ln);
         break;
      case use:
         o.printx(genloc__, indents(ind), "REGISTER_CLASS_DEF(",
               n,    ", ",
               b,    ", ",
               a,    ")");
         break;
   }
}

/*static */void cppDefineMacroClassDef(
      CPPGen g,            // generator
      DynamicString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroClassDef(g, o, def, ind,
         "n",
         0); }

static void cppMacroClassDef(
      CPPGen g,            // generator
      DynamicString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * n,      // n?
      void * unused)
{
   switch(mode)
   {
      case def:
         o.printx(genloc__, indents(ind), "// For defining _class and registering separately (multiple translation units)", ln);
         o.printx(genloc__, indents(ind), "#define CLASS_DEF(n)                ");
      case bypass:
            o.printx(genloc__, indents(ind + 1), "TCPPClass<", n, "> ", n, "::_class;", ln);
         break;
      case use:
         o.printx(genloc__, indents(ind), "CLASS_DEF(",
               n,    ")");
         break;
   }
}

/*static */void cppDefineMacroRegisterClass(
      CPPGen g,            // generator
      DynamicString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroRegisterClass(g, o, def, ind,
         "n",
         "b",
         "a",
         0); }

static void cppMacroRegisterClass(
      CPPGen g,            // generator
      DynamicString o,     // output
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
         o.printx(genloc__, indents(ind), "#define REGISTER_CLASS(n, b, a)     ");
      case bypass:
            o.printx(genloc__, indents(ind + 1), n, "::_class.setup(_REGISTER_CLASS(", n, ",       #n, ", b, "::_class.impl->name, ", a, "));", ln);
         break;
      case use:
         o.printx(genloc__, indents(ind), "REGISTER_CLASS(",
               n,    ", ",
               b,    ", ",
               a,    ")");
         break;
   }
}

/*static */void cppDefineMacroRegisterClassCPP(
      CPPGen g,            // generator
      DynamicString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroRegisterClassCPP(g, o, def, ind,
         "n",
         "a",
         0); }

static void cppMacroRegisterClassCPP(
      CPPGen g,            // generator
      DynamicString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * n,      // n?
      const char * a,      // a?
      void * unused)
{
   switch(mode)
   {
      case def:
         o.printx(genloc__, indents(ind), "// For C++ classes proxying eC classes:", ln);
         o.printx(genloc__, indents(ind), "#define REGISTER_CPP_CLASS(n, a)    ");
      case bypass:
            o.printx(genloc__, indents(ind + 1), n, "::_class.setup(_REGISTER_CLASS(", n, ", \"CPP\" #n, #n, ", a, "));", ln);
         break;
      case use:
         o.printx(genloc__, indents(ind), "REGISTER_CPP_CLASS(",
               n,    ", ",
               a,    ")");
         break;
   }
}

/*static */void cppDefineMacroIntConstructClass(
      CPPGen g,            // generator
      DynamicString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroIntConstructClass(g, o, def, ind,
         "c",
         "b",
         0); }

static void cppMacroIntConstructClass(
      CPPGen g,            // generator
      DynamicString o,     // output
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
         o.printx(genloc__, indents(ind), "#define _CONSTRUCT(c, b)", lc, ln);
      case bypass:
            o.printx(genloc__, indents(ind + 1), "INSTANCE_VIRTUAL_METHODS(", c, ")", lc, ln);
            //cppMacroClassVirtualMethods(g, o, use /*bypass*/, ind + 1, "INSTANCE", c, g.cInstance, g.cclass, 0);
            o.printx(genloc__, indents(ind + 1), "static TCPPClass<", c, "> _class;", lc, ln);
            o.printx(genloc__, indents(ind + 1), "static C(bool) constructor(", g_.sym.instance, " i, C(bool) alloc) { return (alloc && !_INSTANCE(i, _class.impl)) ? new ", c, "(i, _class) != null : true; }", lc, ln);
            o.printx(genloc__, indents(ind + 1), "static void destructor(", g_.sym.instance, " i) { ", c, " * inst = (", c, " *)_INSTANCE(i, _class.impl); if(_class.destructor) ((void (*)(", c, " & self))_class.destructor)(*inst); delete inst; }", lc, ln);
            o.printx(genloc__, indents(ind + 1), "explicit inline ", c, "(", g_.sym.instance, " _impl, CPPClass & cl = _class) : ", b, "(_impl, cl)", ln);
         break;
      case use:
         o.printx(genloc__, indents(ind), "_CONSTRUCT(",
               c,    ", ",
               b,    ")");
         break;
   }
}

/*static */void cppDefineMacroConstructClass(
      CPPGen g,            // generator
      DynamicString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroConstructClass(g, o, def, ind,
         "c",
         "b",
         0); }

static void cppMacroConstructClass(
      CPPGen g,            // generator
      DynamicString o,     // output
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
         o.printx(genloc__, indents(ind), "#define CONSTRUCT(c, b)", lc, ln);
      case bypass:
            o.printx(genloc__, indents(ind + 1), c, "() : ", c, "((", g_.sym.instance, ")Instance_newEx(_class.impl, false), _class) { }", lc, ln);
            //o.printx(genloc__, indents(ind + 1), "_CONSTRUCT(", c, ", ", b, ")", ln);
            cppMacroIntConstructClass(g, o, use /*mode*/, ind + 1, c, b, 0);
         break;
      case use:
         o.printx(genloc__, indents(ind), "CONSTRUCT(",
               c,    ", ",
               b,    ")");
         break;
   }
}

/*static */void cppDefineMacroDestructClass(
      CPPGen g,            // generator
      DynamicString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroDestructClass(g, o, def, ind,
         "c",
         0); }

static void cppMacroDestructClass(
      CPPGen g,            // generator
      DynamicString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * c,      // c?
      void * unused)
{
   const char * lc = mode == def ? " \\" : "";     // line continuation
   switch(mode)
   {
      case def:
         o.printx(genloc__, indents(ind), "#define DESTRUCT(c)", lc, ln);
      case bypass:
         o.printx(genloc__, indents(ind + 1), "((TCPPClass<", c, "> &)_class).destructor", ln);
         break;
      case use:
         o.printx(genloc__, indents(ind), "DESTRUCT(",
               c,    ")");
         break;
   }
}

/*static */void cppDefineMacroClassRegister(
      CPPGen g,            // generator
      DynamicString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroClassRegister(g, o, def, ind,
         0); }

static void cppMacroClassRegister(
      CPPGen g,            // generator
      DynamicString o,     // output
      MacroMode mode,
      uint ind,            // indents
      void * unused)
{
   const char * lc = mode == def ? " \\" : "";     // line continuation
   switch(mode)
   {
      case def:
         o.printx(genloc__, indents(ind), "#define REGISTER()", lc, ln);
      case bypass:
            o.printx(genloc__, indents(ind + 1), "static void class_registration(CPPClass & _class)", ln);
         break;
      case use:
         o.printx(genloc__, indents(ind), "REGISTER(",
                     ")");
         break;
   }
}

/*static */void cppDefineMacroClassRegistration(
      CPPGen g,            // generator
      DynamicString o,     // output
      uint ind,            // indents
      BClass c,
      BClass cBase,
      void * unused) {     // unused
   cppMacroClassRegistration(g, o, def, ind,
         c,
         cBase,
         0); }

static void cppMacroClassRegistration(
      CPPGen g,            // generator
      DynamicString o,     // output
      MacroMode mode,
      uint ind,            // indents
      BClass c,
      BClass cBase,
      void * unused)
{
   const char * lc = mode == def ? " \\" : "";     // line continuation
   switch(mode)
   {
      case def:
         o.printx(ln, genloc__, indents(ind), "#define ", c.name, "_class_registration(d)");
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
            bool destVsSrc = !strcmp(mn, "onCopy") ? true : false;
            const char * first = null;
            const char * nthis = null;
            char * typeString = t.returnType.kind == classType && t.returnType.classObjectType == anyObject ? CopyString(g_.sym.instance) : printType(t.returnType, false, false, false);
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

            o.printx(lc, ln);

            o.printx("   REGISTER_TYPED_METHOD(\"", on, "\", ", mn, ", ", cn, ", d, ");
            if(ctRT == normalClass || ctRT == noHeadClass)
               o.printx(cParamRT.symbolName);
            else
               o.printx(strptrNoNamespace(typeString));
            o.printx(",", lc, ln,
                        "      (");
            //delete typeString;
            if(t.kind == functionType)
            {
               bool comma = false; //const char * comma = "";
               switch(t.classObjectType)
               {
                  case none: break;
                  //case classPointer: conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                  case typedObject:
                  {
                     byRefTypedThis = t.byReference;
                     returnAddress = ctRT == normalClass || ctRT == noHeadClass;
                     nthis = iMetThisNameSwap.Index(mn, false) ? iMetThisNameSwap.data : "o";
                     o.printx("Class * _class, C(Instance) ", byRefTypedThis ? "* " : "", nthis);
                     comma = true; //comma = ", ";
                     break;
                  }
                  //case anyObject:    conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                  default:           conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
               }
               argsInfo = { type = m.md.dataType, m = m, md = m.md, cl = c.cl, c = c };
               o.printx((params = cppParams(argsInfo, regMethodParamList, comma, &first)));
               delete params;
            }
            else conmsg(t.kind, " is not handled here. todo?");
            o.printx("),", lc, ln,
                        "      ", destVsSrc ? first : nthis, ", ", nthis, byRefTypedThis ? " ? *" : "", byRefTypedThis ? nthis : "", byRefTypedThis ? " : null" : "");
                     // ", ", noRet ? "" : "return ", "fn(*i, *(", cn, " *)INSTANCEL(", first, ", ", first, "->_class)),", lc, ln,
            o.printx(", ");

            if(!noRet)
            {
               if(ctRT == normalClass || ctRT == noHeadClass)
                  o.printx(cParamRT.name, " *");
               else
                  o.printx(strptrNoNamespace(typeString));

                o.printx(" ret = ");

                if(returnAddress) o.printx(" &");
            }

            o.printx("fn(*i");
            o.printx((args = cppParams(argsInfo, regMethodArgsPassing, false, 0)));
            o.printx(")");

            if(!noRet)
            {
               o.printx("; return ");
               if(returnAddress)
                  o.printx("ret ? ret->impl : null;");
               else
                  o.printx("ret");
            }
            o.printx(",", lc, ln);

            delete args;
            o.printx("      (");
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
                     o.printx("_class, ", nthis);
                     comma = ", ";
                     break;
                  }
                  //case anyObject:    conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                  case none:
                     break;
                  default:           conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
               }
               if(!(t.params.count == 1 && ((Type)t.params.first).kind == voidType))
                  for(param = t.params.first; param; param = param.next)
                  {
                     MapIterator<consttstr, const String> i { map = methodParamNameSwap };
                     const char * name = i.Index({ mn, param.name }, false) ? i.data : param.name;
                     o.printx(comma, name);
                     if(!comma[0]) comma = ", ";
                  }
            }
            else conmsg(t.kind, " is not handled here. todo?");
            o.printx("), ");
            if(!noRet)
            {
               if(ctRT == normalClass || ctRT == noHeadClass)
                  o.printx("(", cParamRT.symbolName, ")null");
               else
                  o.printx("1");
            }
            o.printx(");");
            content = true;
         }
         if(content) o.printx(ln);
         break;
      }
      case use:
         o.printx(genloc__, indents(ind), cBase.upper, "_class_registration(", c.name, ")");
         break;
   }
}

/*static */void cppDefineMacroClassVirtualMethods(
      CPPGen g,            // generator
      DynamicString o,     // output
      uint ind,            // indents
      const char * un,     // uppercase class name
      BClass c,
      BClass cBase,
      void * unused) {     // unused
   cppMacroClassVirtualMethods(g, o, def, ind,
         un,
         "c",
         c,
         cBase,
         0); }

// _VIRTUAL_METHODS
static void cppMacroClassVirtualMethods(
      CPPGen g,            // generator
      DynamicString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * un,     // uppercase name // TODOGDFOJDFGOIJDFG
      const char * c_,      // class
      BClass c,
      BClass cBase,
      void * unused)
{
   const char * lc = mode == def ? " \\" : "";     // line continuation
   //const char * sc = mode == bypass ? "" : " ## "; // symbol concatenation
   switch(mode)
   {
      case def:
         o.printx(ln, genloc__, indents(ind), "#define ", un, "_VIRTUAL_METHODS(c)", lc, ln);
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
               // VIRTUAL_METHOD(n, c, b, r, p0, ep, p, d)
               // name, class, b (other?), return type, p0?, ep?, p?, d?
               if(!first/* && submode != bypass*/)
                  o.printx(lc, ln);
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
                  if(!strcmp(mn, "onEdit"))
                     ; //conmsg("step");
                  if(cParamRT && !strcmp(cParamRT.name, "IteratorPointer"))
                     ; //PrintLn("");

                  s3z.copy("");
                  if(noRet);
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
                     s3z.concatx((args = cppParams(argsInfo, passing, false, 0)));
                     s3z.concatx(");", lc, ln);

                     s3z.concatx(genloc__, indents(ind + 4), "return ");
                     if(ctRT == noHeadClass)
                        s3z.concatx("ret", cParamRT.name, ";");
                     else
                        s3z.concatx("*(", cParamRT.name, " *)_INSTANCE(ret", cParamRT.name, ", ret", cParamRT.name, "->_class);");
                  }
                  else
                  {
                     s3z.concatx("return ");
                     if(c.isInstance) s3z.concatx("Instance"); // Instance_* prefix for base instance methods
                     s3z.concatx(tn, "(");
                     if(c.isInstance || c.cl.type != normalClass)
                        s3z.concatx("_class.impl, ");
                     s3z.concatx("self ? self->impl : (", sn, ")null");
                     s3z.concatx((args = cppParams(argsInfo, passing, false, 0)));
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
                           (params = cppParams(argsInfo, _argParamList, false, 0)),
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
                           (params = cppParams(argsInfo, _argParamList, false, 0)),
                           s3,
                           0);
                  }
                  o.printx(";");
                  content = true;
                  delete s1;
                  delete s2;
                  //delete s3;
                  delete s3z;
               }
            }
         }
         if(content) o.printx(ln);
         break;
      }
#if 0
            o.ds.printx("   VIRTUAL_METHOD(", mn, ", c, ", cn, ", \\", ln);
            if(!strcmp(mn, "onEdit"))
            {
               conmsg("step");
               //ctRT = cppGetClassInfoFromType(t.returnType, &clRegRT, &cParamRT, &hackRT);
            }
            if(ctRT == normalClass || ctRT == noHeadClass)
               o.ds.printx("      ", cParamRT.name);
            else
               o.ds.printx("      ", (s = cppTypeName(ti, true)));
            o.ds.printx(", c &", hasArgs ? " _ARG" : "", ", , ", (params = cppParams(argsInfo, _argParamList, false, 0)), ", \\", ln);
            if(ctRT == normalClass || ctRT == noHeadClass)
            {
               o.ds.printx("      ", cParamRT.symbolName, " ret", cParamRT.name, " = ", c.isInstance ? "Instance" : "", tn, "(_class.impl, self ? self->impl : (", sn, ")null", (args = cppParams(argsInfo, passing, false, 0)), ");", lc, ln,
                           "      ", "return ", "*(", cParamRT.name, " *)_INSTANCE(ret", cParamRT.name, ", ret", cParamRT.name, "->_class); );");
            }
            else
               o.ds.printx("      ", noRet ? "" : "return ", c.isInstance ? "Instance" : "", tn, "(_class.impl, self ? self->impl : (", sn, ")null", (args = cppParams(argsInfo, passing, false, 0)), "));");
                        //"      return ", c.isInstance ? "Instance" : "", tn, "(_class.impl, self ? self->impl : (", sn, ")null", ", &b ? b.impl : (", sn, ")null));");
#endif // 0
#if 0
            if(s[1] == '(' && s[strlen(s) - 1] == ')')
            {
               s[strlen(s) - 1] = '\0';
               if(tmpcppececeremess.Find(s + 2))
               {
                  delete s;
                  s = cppTypeName(ti, true);
               }
            }
#endif // 0
// DELETE THIS?
      // o.printx("   struct ", c, sc, "_", sc, n, sc, "_Functor", lc, ln);
      // o.printx("   {", lc, ln);
      // o.printx("      int _[0];", lc, ln);
      // o.printx("      typedef r (* FunctionType)(", p0, " ", p, ");", lc, ln);
      // o.printx("      inline FunctionType operator= (FunctionType func)", lc, ln);
      // o.printx("      {", lc, ln);
      // o.printx("         SELF(", c, ", ", n, ");", lc, ln);
      // o.printx("         if(self->vTbl == c::_class.vTbl)", lc, ln);
      // o.printx("         {", lc, ln);
      // o.printx("            uint size = ", c, " :: _class.impl->vTblSize;", lc, ln);
      // o.printx("            self->vTbl = (void (**)())newt(FunctionType, size);", lc, ln);
      // o.printx("            memcpy(self->vTbl, ", c, "::_class.vTbl, sizeof(FunctionType) * size);", lc, ln);
      // o.printx("         }", lc, ln);
      // o.printx("         ((FunctionType *)self->vTbl)[M_VTBLID(", b, ", ", n, ")] = func;", lc, ln);
      // o.printx("         return func;", lc, ln);
      // o.printx("      }", lc, ln);
      // o.printx("      inline r operator()(", ep, " ", p, ")", lc, ln);
      // o.printx("      {", lc, ln);
      // o.printx("         SELF(", c, ", ", n, ");", lc, ln);
      // o.printx("         ", d, ";", lc, ln);
      // o.printx("      }", lc, ln);
      // o.printx("   } ", n, ";", lc, ln);
      // o.printx("   inline static void register_", sc, n, "(CPPClass & cl, ", c, sc, "_", sc, n, sc, "_Functor::FunctionType func)", lc, ln);
      // o.printx("   {", lc, ln);
      // o.printx("      ((", c, sc, "_", sc, n, sc, "_Functor::FunctionType *)cl.vTbl)[M_VTBLID(", b, ", ", n, ")] = func;", lc, ln);
      // o.printx("   }", ln);
      case use:
      // o.printx(genloc__, indents(ind), "VIRTUAL_METHOD(", n, ", ", c, ", ", b, ",", lc, ln,
      // o.printx(genloc__, indents(ind + 1), r, ", ", p0, ", ", ep, ", ", p, ",", lc, ln,
      // o.printx(genloc__, indents(ind + 1), d, ")");
         break;
   }
}

/*static */void cppDefineMacroVirtualMethod(
      CPPGen g,            // generator
      DynamicString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroVirtualMethod(g, o, def, ind,
         "n",
         "ncpp",
         "c",
         "b",
         "r",
         "p0",
         "ep",
         "p",
         "d",
         0); }

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

static void cppMacroVirtualMethod(
      CPPGen g,            // generator
      DynamicString o,     // output
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
         o.printx(genloc__, indents(ind), "#define VIRTUAL_METHOD(n, ncpp, c, b, r, p0, ep, p, d)", lc, ln);
      case bypass:
            o.printx(genloc__, indents(ind + 1), "struct ", c, sc, "_", sc, n, sc, "_Functor", lc, ln);
            o.printx(genloc__, indents(ind + 1), "{", lc, ln);
               o.printx(genloc__, indents(ind + 2), "int _[0];", lc, ln);
               o.printx(genloc__, indents(ind + 2), "typedef r (* FunctionType)(", p0, " ", p, ");", lc, ln);
               o.printx(genloc__, indents(ind + 2), "inline FunctionType operator= (FunctionType func)", lc, ln);
               o.printx(genloc__, indents(ind + 2), "{", lc, ln);
                  o.printx(genloc__, indents(ind + 3), "SELF(", c, ", ", ncpp, ");", lc, ln);
                  o.printx(genloc__, indents(ind + 3), "if(self->vTbl == c::_class.vTbl)", lc, ln);
                  o.printx(genloc__, indents(ind + 3), "{", lc, ln);
                     o.printx(genloc__, indents(ind + 4), "uint size = ", c, " :: _class.impl->vTblSize;", lc, ln);
                     o.printx(genloc__, indents(ind + 4), "self->vTbl = (void (**)())newt(FunctionType, size);", lc, ln);
                     o.printx(genloc__, indents(ind + 4), "memcpy(self->vTbl, ", c, "::_class.vTbl, sizeof(FunctionType) * size);", lc, ln);
                  o.printx(genloc__, indents(ind + 3), "}", lc, ln);
                  o.printx(genloc__, indents(ind + 3), "((FunctionType *)self->vTbl)[M_VTBLID(", b, ", ", n, ")] = func;", lc, ln);
                  o.printx(genloc__, indents(ind + 3), "return func;", lc, ln);
               o.printx(genloc__, indents(ind + 2), "}", lc, ln);
               o.printx(genloc__, indents(ind + 2), "inline r operator()(", ep, " ", p, ")", lc, ln);
               o.printx(genloc__, indents(ind + 2), "{", lc, ln);
                  o.printx(genloc__, indents(ind + 3), "SELF(", c, ", ", ncpp, ");", lc, ln);
                  o.printx(genloc__, indents(ind + 3), "", d, ";", lc, ln);
               o.printx(genloc__, indents(ind + 2), "}", lc, ln);
            o.printx(genloc__, indents(ind + 1), "} ", ncpp, ";", lc, ln);
            o.printx(genloc__, indents(ind + 1), "inline static void register_", sc, n, "(CPPClass & cl, ", c, sc, "_", sc, n, sc, "_Functor::FunctionType func)", lc, ln);
            o.printx(genloc__, indents(ind + 1), "{", lc, ln);
               o.printx(genloc__, indents(ind + 2), "((", c, sc, "_", sc, n, sc, "_Functor::FunctionType *)cl.vTbl)[M_VTBLID(", b, ", ", n, ")] = func;", lc, ln);
            o.printx(genloc__, indents(ind + 1), "}", ln);
         break;
      case use:
         o.printx(genloc__, indents(ind), "VIRTUAL_METHOD(", n, ", ", ncpp, ",", c, ", ", b, ",", lc, ln);
            o.printx(genloc__, indents(ind + 1), r, ", ", p0, ", ", ep, ", ", p, ",", lc, ln);
            o.printx(genloc__, indents(ind + 1), d, ")");
         break;
   }
}

/*static */void cppDefineMacroIntRegisterMethod(
      CPPGen g,            // generator
      DynamicString o,     // output
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
      DynamicString o,     // output
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
         o.printx(genloc__, indents(ind), "#define _REGISTER_METHOD(cp1, cp2, ns, n, bc, c, r, p, ocl, oi, code, ea, rv)", lc, ln);
      case bypass:
            o.printx(genloc__, indents(ind + 1), "addMethod(_class.impl, ", ns, ", (void *) +[]", p, "", lc, ln);
            o.printx(genloc__, indents(ind + 1), "{", lc, ln);
               o.printx(genloc__, indents(ind + 2), "Class * cl = (", ocl, ") ? (Class *)(", ocl, ")->_class : null;", lc, ln);
               o.printx(genloc__, indents(ind + 2), "", cp1[0] ? cp1 : "// 'cp1' is empty", lc, ln);
               o.printx(genloc__, indents(ind + 2), c, " * i = (", oi, ") ? (", c, " *)_INSTANCE(", oi, ", cl) : null;", lc, ln);
               o.printx(genloc__, indents(ind + 2), "int vid = M_VTBLID(", bc, ", ", n, ");", lc, ln);
               o.printx(genloc__, indents(ind + 2), "", bc, sc, "_", sc, n, sc, "_Functor::FunctionType fn;", lc, ln);
               o.printx(genloc__, indents(ind + 2), "if(i && i->vTbl && i->vTbl[vid])", lc, ln);
               o.printx(genloc__, indents(ind + 2), "{", lc, ln);
                  o.printx(genloc__, indents(ind + 3), "fn = (", bc, sc, "_", sc, n, sc, "_Functor::FunctionType) i->vTbl[vid];", lc, ln);
                  o.printx(genloc__, indents(ind + 3), "", code, ";", lc, ln);
               o.printx(genloc__, indents(ind + 2), "}", lc, ln);
               o.printx(genloc__, indents(ind + 2), "", cp2[0] ? cp2 : "// 'cp2' is empty", lc, ln);
               o.printx(genloc__, indents(ind + 2), "else", lc, ln);
               o.printx(genloc__, indents(ind + 2), "{", lc, ln);
                  o.printx(genloc__, indents(ind + 3), "auto method = ((", r, " (*) ", p, ")(class_", sc, c, "->_vTbl)[M_VTBLID(", bc, ", ", n, ")]);", lc, ln);
                  o.printx(genloc__, indents(ind + 3), "if(method) return method ", ea, ";", lc, ln);
                  o.printx(genloc__, indents(ind + 3), "return ", rv, ";", lc, ln);
               o.printx(genloc__, indents(ind + 2), "}", lc, ln);
            o.printx(genloc__, indents(ind + 1), "})", ln);
         break;
      case use:
         o.printx(genloc__, indents(ind), "_REGISTER_METHOD(",
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

/*static */void cppDefineMacroRegisterMethod(
      CPPGen g,            // generator
      DynamicString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroRegisterMethod(g, o, def, ind,
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

static void cppMacroRegisterMethod(
      CPPGen g,            // generator
      DynamicString o,     // output
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
         o.printx(genloc__, indents(ind), "#define REGISTER_METHOD(ns, n, bc, c, r, p, ocl, oi, code, ea, rv)", lc, ln);
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
         o.printx(ln);
         break;
      case use:
         o.printx(genloc__, indents(ind), "REGISTER_METHOD(",
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
      DynamicString o,     // output
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
      DynamicString o,     // output
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
         o.printx(genloc__, indents(ind), "#define REGISTER_TYPED_METHOD(ns, n, bc, c, r, p, ocl, oi, code, ea, rv)", lc, ln);
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
         o.printx(ln);
         break;
      }
      case use:
         o.printx(genloc__, indents(ind), "REGISTER_TYPED_METHOD(",
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
      DynamicString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroProperty(g, o, def, ind,
         "n",
         "sg",
         0); }

static void cppMacroProperty(
      CPPGen g,            // generator
      DynamicString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * n,      // name of property
      const char * sg,     // set/get(/isset)
      void * unused)
{
   const char * sc = mode == bypass ? "" : " ## "; // symbol concatenation
   switch(mode)
   {
      case def:
         o.printx(genloc__, indents(ind), "#define property(n, sg) ");
      case bypass:
         o.printx("struct ", n, sc, "Prop { ", n, sc, "Prop() { }; int _[0]; ", sg, " } ", n, ";", ln);
         break;
      case use:
         o.printx(genloc__, indents(ind), "property(",
               n,    ", ",
               sg,   ");", ln);
         break;
   }
}

/*static */void cppDefineMacroIntPropSet(
      CPPGen g,            // generator
      DynamicString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroIntPropSet(g, o, def, ind,
         "t",
         "n",
         "c",
         "d",
         0); }

static void cppMacroIntPropSet(
      CPPGen g,            // generator
      DynamicString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * t,      // t?
      const char * n,      // n?
      const char * c,      // c?
      const char * d,      // d?
      void * unused)
{
   const char * lc = mode == def ? " \\" : "";     // line continuation
   switch(mode)
   {
      case def:
         o.printx(genloc__, indents(ind), "#define _set(t, n, c, d)", lc, ln);
      case bypass:
            o.printx(genloc__, indents(ind + 1), "inline ", t, " operator= (", t, " v)", lc, ln);
            o.printx(genloc__, indents(ind + 1), "{", lc, ln);
               o.printx(genloc__, indents(ind + 2), "SELF(", c, ", ", n, ");", lc, ln);
               o.printx(genloc__, indents(ind + 2), d, ";", lc, ln);
               o.printx(genloc__, indents(ind + 2), "return v;", lc, ln);
            o.printx(genloc__, indents(ind + 1), "}", lc, ln);
         break;
      case use:
         o.printx(genloc__, indents(ind), "_set(",
               t,    ", ",
               n,    ", ",
               c,    ", ",
               d,    ")");
         break;
   }
}

/*static */void cppDefineMacroPropSet(
      CPPGen g,            // generator
      DynamicString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroPropSet(g, o, def, ind,
         "t",
         "n",
         "c",
         "d",
         0); }

static void cppMacroPropSet(
      CPPGen g,            // generator
      DynamicString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * t,      // t?
      const char * n,      // n?
      const char * c,      // c?
      const char * d,      // d?
      void * unused)
{
   const char * lc = mode == def ? " \\" : "";     // line continuation
   MacroMode /*submode = mode == bypass ? bypass : use;*/submode = mode == def ? use : g.macroBits.intPropSet;
   switch(mode)
   {
      case def:
         o.printx(genloc__, indents(ind), "#define set(t, n, c, d)", lc, ln);
      case bypass:
      {
         const char * lc = submode == bypass ? "" : " \\";  // line continuation
         const char * sc = submode == bypass ? "" : " ## "; // symbol concatenation
         cppMacroIntPropSet(g, o, submode, ind + 1,
               t,
               n,
               c,
               d,
               0);
         o.printx(lc, ln);
            o.printx(genloc__, indents(ind + 1), "inline ", n, sc, "Prop & operator= (", n, sc, "Prop & prop)", lc, ln);
            o.printx(genloc__, indents(ind + 1), "{", lc, ln);
               o.printx(genloc__, indents(ind + 2), "SELF(", c, ", ", n, ");", lc, ln);
               o.printx(genloc__, indents(ind + 2), t, " v = prop;", lc, ln);
               o.printx(genloc__, indents(ind + 2), d, ";", lc, ln);
               o.printx(genloc__, indents(ind + 2), "return prop;", lc, ln);
            o.printx(genloc__, indents(ind + 1), "}", ln);
         break;
      }
      case use:
         o.printx(genloc__, indents(ind), "set(",
               t,    ", ",
               n,    ", ",
               c,    ", ",
               d,    ")");
         break;
   }
}

/*static */void cppDefineMacroPropGet(
      CPPGen g,            // generator
      DynamicString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroPropGet(g, o, def, ind,
         "t",
         "n",
         "c",
         "d",
         0); }

static void cppMacroPropGet(
      CPPGen g,            // generator
      DynamicString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * t,      // t?
      const char * n,      // n?
      const char * c,      // c?
      const char * d,      // d?
      void * unused)
{
   switch(mode)
   {
      case def:
         o.printx(genloc__, indents(ind), "#define get(t, n, c, d) ");
      case bypass:
         o.printx("inline operator ", t, " () const { SELF(", c, ", ", n, "); ", d, "; }", ln);
         break;
      case use:
         o.printx(genloc__, indents(ind), "get(",
               t,    ", ",
               n,    ", ",
               c,    ", ",
               d,    ")");
         break;
   }
}

#if 0
/*static */void cppDefineMacroX(
      CPPGen g,            // generator
      DynamicString o,     // output
      uint ind,            // indents
      void * unused) {     // unused
   cppMacroX(g, o, def, ind,
         "x",
         0); }

static void cppMacroX(
      CPPGen g,            // generator
      DynamicString o,     // output
      MacroMode mode,
      uint ind,            // indents
      const char * x,      // x?
      void * unused)
{
   char * s1;
   char * s2;
   MacroMode /*submode = mode == bypass ? bypass : use;*/submode = g.macroBits.x;
   const char * lc = mode == def ? " \\" : "";     // line continuation
   const char * sc = mode == bypass ? "" : " ## "; // symbol concatenation
   switch(mode)
   {
      case def:
         o.printx(genloc__, indents(ind), "#define X(x)", lc, ln);
      case bypass:
         o.printx(genloc__, indents(ind + 1), "inline ", t, " operator= (", t, " v)", lc, ln);
         break;
      case use:
         o.printx(genloc__, indents(ind), "X(",
               x,    ", ",
               x,    ")");
         break;
   }
}

static void cppMacroX(
      CPPGen g,            // generator
      DynamicString o,     // output
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
   MacroMode /*submode = mode == bypass ? bypass : use;*/submode = g.macroBits.x;
   const char * lc = mode == def ? " \\" : "";     // line continuation
   const char * sc = mode == bypass ? "" : " ## "; // symbol concatenation
   switch(mode)
   {
      case def:
         o.printx(genloc__, indents(ind), "#define X(ns, n, bc, c, r, p, ocl, oi, code, ea, rv)", lc, ln);
      case bypass:
         cppMacroIntRegisterMethod(g, o, submode, ind + 1,
               (s1 = PrintString(lc, ln, genloc__, indents(ind + 2),
                     "CPPClass * cppcl = _class ? (CPPClass *)_class->bindingsClass : null;", lc, ln,
            o.printx(genloc__, indents(ind + 2))),
               (s2 = PrintString("else if(cppcl && cppcl->vTbl && cppcl->vTbl[vid])", lc, ln,
            o.printx(genloc__, indents(ind + 2), "{", lc, ln,
               o.printx(genloc__, indents(ind + 3), "fn = (", bc, sc, "_", sc, n, sc, "_Functor::FunctionType) cppcl->vTbl[vid];", lc, ln,
               o.printx(genloc__, indents(ind + 3), "code;", lc, ln,
            o.printx(genloc__, indents(ind + 2), "}", lc, ln, genloc__, indents(ind + 2))),
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
         o.printx(ln);
         break;
      case use:
         o.printx(genloc__, indents(ind), "X(",
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
#endif // 0
