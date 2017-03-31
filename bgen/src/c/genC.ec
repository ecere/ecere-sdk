#include <inttypes.h>

import "bgen"

import "cHeader"
import "cCode"

class CGen : Gen
{
   char * cFileName;
   char * cFilePath;
   char * hFileName;
   char * hFilePath;

   BModule bmod { gen = this };

   AST astH;
   AST astC;

   Array<BNamespace> storeNamespaces { };
   Array<BVariant> storeVariants { };
   Array<BDefine> storeDefines { };
   Array<BFunction> storeFunctions { };
   Array<BClass> storeClasses { };
   Array<BMethod> storeMethods { };
   Array<BProperty> storeProperties { };

   Map<NameSpacePtr, BNamespace> allNamespaces { };
   Map<UIntPtr, BVariant> allVariants { };
   Map<DefinedExpressionPtr, BDefine> allDefines { };
   Map<GlobalFunctionPtr, BFunction> allFunctions { };
   Map<ClassPtr, BClass> allClasses { };
   Map<MethodPtr, BMethod> allMethods { };
   Map<PropertyPtr, BProperty> allProperties { };

   Map<UIntPtr, BOutput> mapDefine { };
   Map<UIntPtr, BOutput> mapFunction { };
   Map<UIntPtr, BOutput> mapTypedef { };
   Map<UIntPtr, BOutput> mapClassPointer { };
   Map<UIntPtr, BOutput> mapBitTool { };
   Map<UIntPtr, BOutput> mapEnum { };
   Map<UIntPtr, BOutput> mapStruct { };
   Map<UIntPtr, BOutput> mapMethod { };
   Map<UIntPtr, BOutput> mapProperty { };
   Map<UIntPtr, BOutput> mapConversion { };

   AVLTree<UIntPtr> optionalClasses { };
   void addOptionalClass(BTemplaton t)
   {
      optionalClasses.Add((UIntPtr)t);
   }

   lang = C;

   void process()
   {
      prepareNamespaces();
      processNamespaces();
      bmod.applyDependencies();
      for(n : bmod.orderedNamespaces)
         n.positionOutput(this);
      bmod.sort();
      bmod.moveBackwardsDependencies();
      for(n : bmod.orderedNamespaces)
         n.sort();
   }

   void generate()
   {
      File o;
      o = FileOpen(hFilePath, write);
      if(o)
      {
         cHeader(astH, this);
         astH.print(o, { });
         delete o;
      }
      o = FileOpen(cFilePath, write);
      if(o)
      {
         cCode(astC, this);
         astC.print(o, { });
         delete o;
      }
#ifdef _DEBUG
      {
         char * cFileNameTmp = cFilePath;
         char * hFileNameTmp = hFilePath;
         prepPaths();
         if(FileExists(cFilePath))
            DeleteFile(cFilePath);
         if(FileExists(hFilePath))
            DeleteFile(hFilePath);
         MoveFile(cFileNameTmp, cFilePath);
         MoveFile(hFileNameTmp, hFilePath);
      }
#endif
   }

   bool init()
   {
      bool result = false;
      if(Gen::init() && readyDir())
      {
#ifndef _DEBUG
         prepPaths();
#else
         prepPathsDebug();
#endif

         if(FileExists(cFilePath))
            DeleteFile(cFilePath);
         if(FileExists(hFilePath))
            DeleteFile(hFilePath);

         if(!FileExists(cFilePath) && !FileExists(hFilePath))
         {
            reset();
            resetDeclerationsMaps();

            astC = { };
            astH = { };

            prepareVars();

            //Platform os = __runtimePlatform;
            ec1init(lib.moduleName); // todo, use supplied path here
            mod = bmod.mod = ec1HomeModule;
            result = true;
         }
      }
      return result;
   }

   void printOutputFiles()
   {
      PrintLn(lib.verbose > 1 ? "    " : "", cFileName);
      PrintLn(lib.verbose > 1 ? "    " : "", hFileName);
   }

   void prepPaths()
   {
      char * path = new char[MAX_LOCATION];
      char * name = new char[MAX_LOCATION];
      strcpy(path, dir);
      strcpy(name, lib.bindingName);
      ChangeExtension(name, "c", name);
      PathCatSlash(path, name);
      cFileName = CopyString(name);
      cFilePath = CopyString(path);
      ChangeExtension(name, "h", name);
      ChangeExtension(path, "h", path);
      hFileName = CopyString(name);
      hFilePath = CopyString(path);
      delete path;
   }

#ifdef _DEBUG
   void prepPathsDebug()
   {
      int len;
      char * path = new char[MAX_LOCATION];
      strcpy(path, dir);
      PathCatSlash(path, lib.bindingName);
      ChangeExtension(path, "c", path);
      len = strlen(path);
      strcat(path, ".tmp");
      cFilePath = CopyString(path);
      path[len] = 0;
      ChangeExtension(path, "h", path);
      strcat(path, ".tmp");
      hFilePath = CopyString(path);
      delete path;
   }
#endif

   void reset()
   {
      if(astC) astC.Free();
      delete astC;
      if(astH) astH.Free();
      delete astH;
      ec1terminate();
   }

   ~CGen()
   {
      delete cFileName;
      delete cFilePath;
      delete hFileName;
      delete hFilePath;

      allNamespaces.Free();
      allVariants.Free();
      allDefines.Free();
      allFunctions.Free();
      allClasses.Free();
      allMethods.Free();
      allProperties.Free();
   }

   void prepareVars()
   {
      sourceProcessorVars["LIB_DEF_NAME"] = CopyString(lib.defineName);
      sourceProcessorVars["BINDING_NAME"] = CopyString(lib.bindingName);
   }

   void prepareNamespaces()
   {
      IterNamespace ns { module = mod, processFullName = true };
      BNamespace n = (NameSpacePtr)null;
      while(ns.next())
      {
         DynamicString z { };
         n = (NameSpacePtr)ns.ns;
         z.println("");
         sectionComment_hdr(z, _ns); sectionComment_msg_line(z);         sectionComment_ftr(z); z.println("");;
         sectionComment_hdr(z, _ns); sectionComment_msg(z, ns.fullName); sectionComment_ftr(z); z.println("");;
         sectionComment_hdr(z, _ns); sectionComment_msg_line(z);         sectionComment_ftr(z); z.println("");;
         z.println("");
         n.output.Add(ASTRawString { string = CopyString(z.array) });
         bmod.orderedNamespaces.Add(n);
         delete z;
      }
      ns.cleanup();
   }

   void processNamespaces()
   {
      IterNamespace ns { module = mod, processFullName = true };
      while(ns.next())
      {
         if(!bmod.root_nspace)
         {
            bmod.root_nspace = (NameSpacePtr)ns.ns;
         }
         processDefines(ns);
         if(lib.ecereCOM && ns.ns->parent == null && ns.ns->name == null)
            manualTypes(ns);
         processClasses(ns);
         processOptionalClasses(ns);
         processFunctions(ns);
      }
      processTemplatons();
      ns.cleanup();
   }

   void manualTypes(IterNamespace ns)
   {
      MapNode<const String, const String> node;
      for(node = manualTypeDefs.root.minimum; node; node = node.next)
      {
         char * ident;
         char * spec = (!strcmp(node.value, "Instance")) ? PrintString("C(", node.value, ")") : CopyString(node.value);
         bool noC = false;
         BOutput out { vmanual };
         if(actualTypeNames.Find(node.key))
            noC = true;
         ident = noC ? CopyString(node.key) : PrintString("C(", node.key, ")");
         if(!strcmp(node.value, "Instance"))
         {
            Class clDep = eSystem_FindClass(mod, node.value);
            assert(clDep != null);
         }
         out.output.Add(astDeclInit(node.key, createTypedef, ident, spec, { }, null, null));
         delete ident;
         delete spec;
      }
   }

   void processClasses(IterNamespace ns)
   {
      Class cl; IterClass cla { ns.ns };
      while((cl = cla.next(all)))
      {
         if(!cl.templateClass) // don't generate templated classes just because they are listed
         {
            BClass c = cl;
            BVariant v = c;
            processClass(c, v, c.nspace);
         }
      }
   }

   void processOptionalClasses(IterNamespace ns)
   {
      if(optionalClasses.count)
      {
         AVLTree<UIntPtr> oc { };
         while(optionalClasses.count)
         {
            for(tt : optionalClasses)
            {
               BTemplaton t = (BTemplaton)tt;
               oc.Add((UIntPtr)t);
            }
            optionalClasses.RemoveAll();
            for(tt : oc)
            {
               BTemplaton t = (BTemplaton)tt;
               BVariant v = t;
               BClass c = t.c;
               Class cl = c.cl;
               BNamespace nspace = t.nspace;
               if(!cl.templateClass) check();
               processClass(c, v, nspace);
            }
            oc.RemoveAll();
         }
         delete oc;
      }
   }

   void processClass(BClass c, BVariant v, BNamespace nspace)
   {
      Class cl = c.cl;
      bool created;
      if(!c.skip)
      {
         Class clDep = null;
         BTemplaton tDep = null;
         nspace.addContent(v);
         if(!c.nativeSpec && !c.skipTypeDef)
         {
            assert(c.clBase != null);
            if(c.clBase.templateClass)
            {
               clDep = c.clBase;
               tDep = bmod.addTemplateType(c.clBase, bmod.root_nspace);
               addOptionalClass(tDep);
            }
            else
            {
               clDep = eSystem_FindClass(mod, c.base);
               assert(clDep != null);
            }
            if(tDep)
               v.processDependency(otypedef, otypedef, tDep);
            else if(clDep && clDep != cl)
               v.processDependency(otypedef, otypedef, clDep);
         }
         aClass(c, v, &created);
      }
   }

   void processTemplatons()
   {
      for(ti : bmod.templatons)
      {
         bool init;
         BTemplaton t = ti;
         if(t.tp)
         {
            BVariant v = t;
            BNamespace n = v.nspace;
            BOutput o = t.outTypedef = bmod.getTypedefOutput((UIntPtr)t, &init); assert(init);
            assert(t.nspace == null);
            n.addContent(v);
            o.output.Add(astDeclInit(t.cname, emptyTypedef, null, null, { t = t }, null, null/*, ast*/));
         }
      }
   }

   void processDefines(IterNamespace ns)
   {
      DefinedExpression df; IterDefine def { ns.ns };
      while((df = def.next()))
      {
         BDefine d = df;
         BVariant v = d;
         BOutput out { vdefine, d = d };
         d.nspace.addContent(v);
         d.out = out;
         if(lib.ecereCOM && d.isNull)
            out.output.Add(astNullDefine());
         else
            out.output.Add(astDefine(df, d));
      }
   }

   void processFunctions(IterNamespace ns)
   {
      GlobalFunction fn; IterFunction func { ns.ns };
      while((fn = func.next()))
      {
         BFunction f = fn;
         if(!f.skip && !f.isDllExport)
         {
            BVariant v = f;
            BOutput out { vfunction, f = f };
            f.nspace.addContent(v);
            f.out = out;
            out.output.Add(astFunction(f.oname, { type = fn.dataType, fn = fn }, { _extern = true, pointer = true }, v));
         }
      }
   }

   Class getClassFromType(Type type, bool reduceUnits)
   {
      Class cl = null;
      const char * name = type._class.string;
      bool ecereCOMForwardDeclare = lib.ecereCOM &&
            (!strcmp(name, "Type") || !strcmp(name, "Instantiation") || !strcmp(name, "ClassDefinition"));
      if(type.kind == classType || type.kind == subClassType)
      {
         if(type._class.registered)
         {
            Class test = eSystem_FindClass(mod, type._class.string);
            if(test != type._class.registered) check();
            cl = type._class.registered;
            if(ecereCOMForwardDeclare) check();
         }
         else
         {
            cl = eSystem_FindClass(app, type._class.string);
            if(cl)
               ; // new
            else if(ecereCOMForwardDeclare)
               ; // ok
            else if(!strcmp(type._class.string, "ffi_cif"))
               ; // ok, how to identify type names from include files? and treat them as native
                // assume native if you can't find a class for it ?
            else if(!strcmp(type._class.string, "ProjectionDefinition"))
               ; // toreport: mantis: bug: compiler bug: ProjectionDefinition is private and yet it is used in the public getCartesian
                 //            the compiler need to warn or throw an error or something
                 //            this fits in the 'accessibility bugs in the compiler'
            else check();
         }
      }
      else check();
      if(reduceUnits && cl)
         cl = reduceUnitClass(cl);
      return cl;
   }

   void aClass(BClass c, BVariant v, bool * created)
   {
      Class cl = c.cl;
      bool init;
      BOutput o = null;
      if(!c.skipTypeDef && cl.type != unionClass) // wth is a union class anyway
      {
         DeclarationInit declStruct = null;
         Class clReduce = getUnitClassReducedToBase(cl);
         if(v.kind == vclass)
         {
            o = c.outTypedef = bmod.getTypedefOutput((UIntPtr)c, &init); assert(init);
            assert(init == true);
            o.kind = vclass, o.c = c, o.type = otypedef;
         }
         else if(v.kind == vtemplaton)
         {
            o = v.t.outTypedef = bmod.getTypedefOutput((UIntPtr)v.t, &init); assert(init);
            assert(init == true);
            o.kind = vtemplaton, o.t = v.t, o.type = otypedef;
         }
         if(!clReduce && cl.type != enumClass)
            o.output.Add(astDeclInit(c.cname, emptyTypedef, null, null, { c = c }, null, null/*, ast*/));
         if(cl.type == bitClass)
         {
            o = c.outBitTool = bmod.getBitToolOutput((UIntPtr)c, &init); assert(init);
            o.kind = vclass, o.c = c, o.type = obittool;
            o.output.Add(astBitTool(cl, c));
         }
         else if(cl.type == enumClass)
         {
            o = c.outTypedef;
            o.output.Add(astEnum(cl, c));
         }
         if(c.declStruct) check();
         if(c.hasPublicMembers)
         {
            SpecClass sc;
            ClassDefList defs;
            char * ident = PrintString(cl.type == normalClass ? "CM" : "C", "(", c.cname, ")");
            if(cl.type == enumClass) check();
            if(cl.type == systemClass) check();
            if(cl.type == unitClass) check();
            o = c.outStruct = bmod.getStructOutput((UIntPtr)c, &init); assert(init);
            o.kind = vclass, o.c = c, o.type = ostruct;
            declStruct = c.declStruct = astDeclInit(c.cname, createStruct, ident, null, { c = c }, null, null);
            o.output.Add(declStruct);

            sc = declStruct && declStruct.specifiers ? (SpecClass)declStruct.specifiers.firstIterator.data : null;
            defs = sc ? sc.definitions : null;
            recurseBaseClassMembers(this, cl, cl, c.isFromCurrentModule, defs, { });
            delete ident;
         }
      }
      else if(!c.skipTypeDef) check();
      if(!cl.templateClass)
      {
         bool skip = /*c.skip || */c.isUnInt || c.isCharPtr || c.isUnichar || c.isBool;
         char * s;
         if(!skip)
         {
            s = PrintString(skip ? "// SKIPPED // " : "", "extern C(Class) * CO(", c.cname, ");");
            o = c.outClassPointer = bmod.getClassPointerOutput((UIntPtr)c, &init); assert(init);
            o.output.Add(ASTRawString { string = s });
         }
      }
      if(!cl.templateClass/* && (!lib.ecereCOM || !c.is_class)*/)
      {
         bool instanceClass = false;
         MethodGenFlag methodFlag = all;
         Method md; IterMethod met { cl };
         Property pt; IterProperty prop { cl };
         Property cn; IterConversion conv { cl };
         BOutput o = null;
         bool haveContent = false;
         Class clDepMethod = eSystem_FindClass(mod, "Method");
         Class clDepProperty = eSystem_FindClass(mod, "Property");
         while((md = met.next(publicOnly)))
         {
            BMethod m = md;
            BVariant v = m;
            assert(m != null);
            o = m.outInHeader = BOutput { vmethod, m = m, omethod };
            o.output.Add(astMethod(this, md, cl, c, methodFlag, instanceClass, &haveContent, v));
            c.outMethods.Add(o);
            c.nspace.addContent(v);
            if(lib.ecereCOM)
               v.processDependency(omethod, otypedef, clDepMethod);
         }
         if(lib.ecereCOM && c.is_class)
         {
            instanceClass = true;
            while((md = met.next(publicOnly)))
            {
               BMethod m = md;
               BVariant v = m;
               o/* = m.outInHeader*/ = BOutput { vmethod, m = m, omethod };
               o.output.Add(astMethod(this, md, cl, c, methodFlag, instanceClass, &haveContent, /*v*/null));
               c.outMethods.Add(o);
               c.nspace.addContent(v);
               v.processDependency(omethod, otypedef, clDepMethod);
            }
         }
         while((cn = conv.next(publicOnly)))
         {
            BProperty p = cn;
            BVariant v = p;
            o = p.outInHeader = BOutput { vproperty, p = p, oconversion };
            o.output.Add(astProperty(cn, c, _import, false, &c.first, &haveContent));
            c.outProperties.Add(o);
            c.nspace.addContent(v);
            if(lib.ecereCOM)
               v.processDependency(oconversion, otypedef, clDepProperty);
         }
         while((pt = prop.next(publicOnly)))
         {
            BProperty p = pt;
            BVariant v = p;
            o = p.outInHeader = BOutput { vproperty, p = p, oproperty };
            o.output.Add(astProperty(pt, c, _import, false, &c.first, &haveContent));
            c.outConversions.Add(o);
            c.nspace.addContent(v);
            processTypeDependency(this, pt.dataType, pt.dataTypeString, oproperty, v);
            if(lib.ecereCOM)
               v.processDependency(oproperty, otypedef, clDepProperty);
         }
      }
   }
}

Class reduceUnitClass(Class cl)
{
   Class clReduce = getUnitClassReducedToBase(cl);
   return clReduce ? clReduce : cl;
}

Class getUnitClassReducedToBase(Class cl)
{
   if(!cl.templateClass && cl.type == unitClass && cl.base && cl.base.type == unitClass)
   {
      Class clBase = cl;
      Property cn; IterConversion conv { cl };
      while(clBase.base.type == unitClass)
         clBase = clBase.base;
      while((cn = conv.next(publicOnly)))
      {
         BProperty p = cn;
         if(p.cConv && p.cConv.cl.type == unitClass)
         {
            Class clConvBase = p.cConv.cl;
            while(clConvBase.base.type == unitClass)
               clConvBase = clConvBase.base;
            if(clConvBase == clBase)
               return clBase;
         }
      }
   }
   return null;
}

define _defaultAccess = "AccessMode_defaultAccess";
define _publicAccess = "AccessMode_publicAccess";
define _privateAccess = "AccessMode_privateAccess";
define _staticAccess = "AccessMode_staticAccess";
define _baseSystemAccess = "AccessMode_baseSystemAccess";

define _normalClass = "ClassType_normalClass";
define _structClass = "ClassType_structClass";
define _bitClass = "ClassType_bitClass";
define _unitClass = "ClassType_unitClass";
define _enumClass = "ClassType_enumClass";
define _noHeadClass = "ClassType_noHeadClass";
define _unionClass = "ClassType_unionClass";
define _systemClass = "ClassType_systemClass";

Map<const String, const String> manualTypeDefs { [
   { "constString", "const char *" },
   { "any_object", "const void *" }
] };

Map<String, Array<String>> dependencyDefines { };
AVLTree<String> enumValueNames { }; // through dependencies as well

enum MethodGenFlag { all, vTblID, virtualMethodCaller, virtualMethodImport, nonVirtualMethodImport };
enum EnumGenFlag { normal, prototype };

void cgenPrintVirtualMethodDefs(DynamicString z, BClass c, BMethod m, bool assumeTypedObject, bool forInstance, BVariant vTop)
{
   int charCount = 0;
   uint ap;
   const char * thisClassName = null;
   Class cl = c.cl;
   Method md = m.md;
   char * classTypeName = cl && cl.type != systemClass && !md.dataType.staticMethod ? oldGetClassTypeName(cl.name) : null;
   char * thisTypeName = md.dataType.staticMethod ? null : md.dataType.thisClass ? oldGetClassTypeName(md.dataType.thisClass.string) : null;
   bool prev = true;
   if(md.dataType)
      thisClassName = md.dataType.staticMethod ? null : md.dataType.thisClass ? md.dataType.thisClass.className : cl.name;
   if(forInstance)
   {
      charCount = 23 + strlen(m.s) + 2 + (thisClassName ? 3 : 0) + (assumeTypedObject ? 3 : 0);
      z.printx("#define Instance_", m.mname, "(");
   }
   else
   {
      charCount += 10 + 2 + (c.is_class ? 0 : strlen(c.cname)) + strlen(m.mname);
      prev = thisClassName || assumeTypedObject;
      if(prev)
      {
         charCount += 4;
         if(assumeTypedObject)
            charCount += 6;
      }
      z.printx("#define ", m.s, "(");
   }
   // macro params
      {
         Type param;
         TypeNameList params { };
         {
            Type t = ProcessTypeString(cl.name, false);
            astTypeName((c.is_class/* && !forInstance*/) ? "__c" : "__i", { type = t, md = md, cl = cl }, { notype = true, param = true }, vTop, params);
            FreeType(t);
         }
         if(c.is_class/* && !forInstance*/)
         {
            Type t = ProcessTypeString(cl.name, false);
            astTypeName("__i", { type = t, md = md, cl = cl }, { notype = true, param = true }, vTop, params);
            FreeType(t);
         }
         else if(!forInstance && md && cl && !md.dataType.staticMethod)
         {
            if(md.dataType.thisClass && md.dataType.thisClass.string)
            {
               Type t = ProcessTypeString(md.dataType.thisClass.string, false);
               astTypeName("__t", { type = t, md = md, cl = cl }, { notype = true, param = true }, vTop, params);
               FreeType(t);
            }
         }
         if(!(md.dataType.params.count == 1 && (param = md.dataType.params.first) && !param.name && param.kind == voidType))
         {
            ap = 0;
            for(param = md.dataType.params.first; param; param = param.next)
            {
               char * apname = null;
               if(!param.name) apname = PrintString("ap", ++ap);
               astTypeName(apname ? apname : param.name, { type = param, md = md, cl = cl }, { notype = true, param = true }, vTop, params);
               delete apname;
            }
         }
         ec2PrintToDynamicString(z, params, false);
      }

   z.printx(")");
   {
      z.printx(" \\\n   VMETHOD(");
      if(c.is_class/* && !forInstance*/)
      {
         if(forInstance)
            z.printx("__c, class, ", m.mname, ", __i, ");
         else
            z.printx("__c, class, ", m.mname, ", (C(Instance))null, ");
      }
      else
         z.printx("CO(", c.cname, "), ", c.cname, ", ", m.mname, ", __i, ");
      {
         zTypeName(z, null, { type = md.dataType.returnType, md = md, cl = cl/*, from = ti*/ }, { anonymous = true }, vTop);
      }
      z.printx(", \\\n      ");
      // function call parameters (for casting)
      {
         Type param;
         ARGPrintTypeNameList params { };
         if(/*md && cl && */!md.dataType.staticMethod)
         {
            if(md.dataType.thisClass && md.dataType.thisClass.string)
            {
               Type t = ProcessTypeString(md.dataType.thisClass.string, false);
               zTypeName(z, null, { type = t, md = md, cl = cl }, { anonymous = true, param = true }, vTop);
               if(c.is_class || (md.dataType.params.count && (md.dataType.staticMethod ||
                     !(md.dataType.params.count == 1 && (param = md.dataType.params.first) && !param.name && param.kind == voidType))))
                  z.printx(" _ARG ");
               FreeType(t);

               if(c.is_class/* && !forInstance*/)
                  z.printx("void *");
               if(c.is_class && (md.dataType.params.count && (md.dataType.staticMethod ||
                     !(md.dataType.params.count == 1 && (param = md.dataType.params.first) && !param.name && param.kind == voidType))))
                  z.printx(" _ARG ");
            }
            else
            {
               Type t = ProcessTypeString(cl.name, false);
               astTypeName(null, { type = t, md = md, cl = cl }, { anonymous = true, param = true }, vTop, params);
               FreeType(t);
            }
         }
         if(md.dataType.params.count && (md.dataType.staticMethod ||
            !(md.dataType.params.count == 1 && (param = md.dataType.params.first) && !param.name && param.kind == voidType)))
         {
            ap = 0;
            for(param = md.dataType.params.first; param; param = param.next)
            {
               char * apname = null;
               if(!param.name)
                  apname = PrintString("ap", ++ap);
               astTypeName(apname ? apname : param.name, { type = param, md = md, cl = cl }, { anonymous = true, param = true }, vTop, params);
               delete apname;
            }
         }
         ec2PrintToDynamicString(z, params, false);
      }
      z.printx(", \\\n      ");
      // function call arguments
      {
         Type param;
         ARGPrintTypeNameList params { };
         if(/*md && cl && */!md.dataType.staticMethod)
         {
            if(md.dataType.thisClass && md.dataType.thisClass.string)
            {
               Type t = ProcessTypeString(md.dataType.thisClass.string, false);
               astTypeName(c.is_class ? forInstance ? "(__i) ? (__i)->_class : (__c)" : "__c" : "__t", { type = t, md = md, cl = cl }, { notype = true, param = true }, vTop, params);
               if(c.is_class)
                  astTypeName("__i", { type = t, md = md, cl = cl }, { notype = true, param = true }, vTop, params);
               FreeType(t);
            }
            else
            {
               Type t = ProcessTypeString(cl.name, false);
               astTypeName("__i", { type = t, md = md, cl = cl }, { notype = true, param = true }, vTop, params);
               FreeType(t);
            }
         }
         if(md.dataType.params.count && (md.dataType.staticMethod ||
            !(md.dataType.params.count == 1 && (param = md.dataType.params.first) && !param.name && param.kind == voidType)))
         {
         ap = 0;
         for(param = md.dataType.params.first; param; param = param.next)
         {
            char * apname = null;
            if(!param.name)
               apname = PrintString("ap", ++ap);
            astTypeName(apname ? apname : param.name, { type = param, md = md, cl = cl }, { notype = true, param = true }, vTop, params);
            delete apname;
         }
         }
         ec2PrintToDynamicString(z, params, false);
      }
      z.printx(")");
   }
   z.printxln("");
   delete classTypeName;
   delete thisTypeName;
}

enum DataValueType { charType, byteType, shortType, uint16Type, intType, uintType, pointerType, floatType, doubleType, int64Type, uint64Type };

#include <float.h>

static bool checkLinearMapping(DataValueType type, void * fn, double * m, double * b)
{
   bool result = false;
   double testValues[5] = { 0, 10, 50, 100, 200 }, results[5];
   int i;

   for(i = 0; i < 5; i++)
   {
      switch(type)
      {
         case doubleType:
         {
            double (* function)(double) = fn;
            results[i] = (double)function((double)testValues[i]);
            break;
         }
         case floatType:
         {
            float (* function)(float) = fn;
            results[i] = (double)function((float)testValues[i]);
            break;
         }
         case charType:
         {
            char (* function)(char) = fn;
            results[i] = (double)function((char)testValues[i]);
            break;
         }
         case byteType:
         {
            byte (* function)(byte) = fn;
            results[i] = (double)function((byte)testValues[i]);
            break;
         }
         case shortType:
         {
            short (* function)(short) = fn;
            results[i] = (double)function((short)testValues[i]);
            break;
         }
         case uint16Type:
         {
            uint16 (* function)(uint16) = fn;
            results[i] = (double)function((uint16)testValues[i]);
            break;
         }
         case intType:
         {
            int (* function)(int) = fn;
            results[i] = (double)function((int)testValues[i]);
            break;
         }
         case uintType:
         {
            uint (* function)(uint) = fn;
            results[i] = (double)function((uint)testValues[i]);
            break;
         }
         case int64Type:
         {
            int64 (* function)(int64) = fn;
            results[i] = (double)function((int64)testValues[i]);
            break;
         }
         case uint64Type:
         {
            uint64 (* function)(uint64) = fn;
            results[i] = (double)function((uint64)testValues[i]);
            break;
         }
      }
   }
   *m = (results[1] - results[0]) / testValues[1];
   *b = results[0];
   result = true;
   for(i = 2; i < 5; i++)
   {
      double value = testValues[i] * *m + *b;
      if(fabs(value - results[i]) > FLT_EPSILON)
      {
         result = false;
         break;
      }
   }
   return result;
}

enum GenPropertyMode { _define, _import, assign };
ASTRawString astProperty(Property pt, BClass c, GenPropertyMode mode, bool conversion, bool * first, bool * haveContent)
{
   Class cl = c.cl;
   if(!cl.templateClass)
   {
      ASTRawString raw { };
      DynamicString z { };
      //BProperty p { };
      BProperty p = pt;
      //p.init(pt, cl, mode);
      assert(pt._class == cl);
      if(!pt.conversion || p.any)
      {
         if(mode == assign)
         {
            if(!*first) z.printxln("");
            else *first = false;
            z.printxln(indent, "   ", p.p, " = Class_findProperty(CO(", p.cc, "), \"", p.pt.name, "\", ", findin, ");");
            if(p.any)      z.printxln(indent, "   if(", p.p, ")");
            if(p.more)     z.printxln(indent, "   {");
            if(pt.Set)     z.printxln(indent, "      ", p.fpnSet, " = (void *)", p.p, "->Set;");
            if(pt.Get)     z.printxln(indent, "      ", p.fpnGet, " = (void *)", p.p, "->Get;");
            if(pt.IsSet)   z.printxln(indent, "      ", p.fpnIst, " = (void *)", p.p, "->IsSet;");
            if(p.more)     z.printxln(indent, "   }");
         }
         else
         {
            bool imp = mode == _import;
            z.printxln(imp ? "extern " : "", "C(Property) * ", p.p, ";");
            if(pt.Set)
            {
               if(pt.conversion && /*cl.type != normalClass && */cl.type != structClass && cl.type != noHeadClass)
                  z.printxln(imp ? "extern " : "", p.cUse.cl.type == unitClass ? p.cUse.spec : p.cUse.symbolName,  " (* ", p.fpnSet, ")(", p.ptTypeUse, p.r, " ", p.paramName, ");");
               else
                  z.printxln(imp ? "extern " : "",   "void (* ", p.fpnSet, ")(", p.cUse.symbolName, p.r, " ", p.otherParamName, ", ", *p.v ? "const " : "", p.t, p.v, " value);");
            }
            if(pt.Get)
            {
               if(*p.v)
                  z.printxln(imp ? "extern " : "",   "void (* ", p.fpnGet, ")(", p.cUse.symbolName, p.r, " ", p.otherParamName, ", ", p.t, p.v, " value);");
               else
                  z.printxln(imp ? "extern " : "", p.t,  " (* ", p.fpnGet, ")(", p.cUse.cl.type == unitClass ? p.cUse.spec : p.cUse.symbolName, p.r, " ", p.otherParamName, ");");
            }

            if(pt.IsSet)
               z.printxln(imp ? "extern " : "",   "bool (* ", p.fpnIst, ")(", p.cUse.symbolName, p.r, " ", p.otherParamName, ");");
            //z.printxln("");
         }
         if(haveContent) *haveContent = true;
      }
      if(mode == _import && c.cl.type == unitClass && p.cConv && p.cConv.cl.type == unitClass)
      {
         DataValueType type = intType;
         // TODO: Improve how all this is typically done...
         if(!strcmp(cl.dataTypeString, "double"))     type = doubleType;
         else if(!strcmp(cl.dataTypeString, "float")) type = floatType;
         else if(!strcmp(cl.dataTypeString, "char")) type = charType;
         else if(!strcmp(cl.dataTypeString, "short")) type = shortType;
         else if(!strcmp(cl.dataTypeString, "int")) type = intType;
         else if(!strcmp(cl.dataTypeString, "int64") || !strcmp(cl.dataTypeString, "long long")) type = int64Type;
         else if(!strcmp(cl.dataTypeString, "byte") || !strcmp(cl.dataTypeString, "unsigned char")) type = byteType;
         else if(!strcmp(cl.dataTypeString, "uint16") || !strcmp(cl.dataTypeString, "unsigned short")) type = uint16Type;
         else if(!strcmp(cl.dataTypeString, "uint") || !strcmp(cl.dataTypeString, "uint32") || !strcmp(cl.dataTypeString, "unsigned int")) type = uintType;
         else if(!strcmp(cl.dataTypeString, "uint64") || !strcmp(cl.dataTypeString, "unsigned long long")) type = uint64Type;

         genPropertyConversion(z, c, p, type, pt.Get);
         genPropertyConversion(z, c, p, type, pt.Set);

         if(!pt.Get && !pt.Set)
         {
            const char * dataType = tokenTypeString(cl.dataType);
            z.printxln("#define ", c.name, "(x)  ((", p.cConvUse.symbolName, ")(x))");
            z.printxln("#define ", p.name, "_in_", c.name, "(x)  ((", dataType, ")(x))");
            if(haveContent) *haveContent = true;
         }
      }
      raw.string = CopyString(z.array);
      delete z;
      return raw;
   }
   return null;
}

void genPropertyConversion(DynamicString z, BClass c, BProperty p, DataValueType type, void * fn)
{
   if(fn)
   {
      double m = 1, b = 0;
      bool forSet = fn == p.pt.Set;
      z.printx("#define ", forSet ? p.cConvUse.name : "", forSet ? "_in_" : "", c.name, "(x)  ");
      if(checkLinearMapping(type, fn, &m, &b))
      {
         const char * castString = forSet ? tokenTypeString(c.cl.dataType) : p.cConvUse.symbolName;
         z.printx("((", castString, ")((x)");
         if(m != 1)
         {
            if(type == doubleType || type == floatType)
               z.printx(" * ", m);
            else if(m > 1 || m == 0)
               z.printx(" * ", (int)(m + 0.5));
            else
               z.printx(" / ", (int)(1.0/m + 0.5));
            if(type == floatType) z.printx("f");
         }
         if(b)
         {
            if(type == doubleType || type == floatType)
               z.printx(" + ", b);
            else
               z.printx(" + ", (int)(b + 0.5));
            if(type == floatType) z.printx("f");
         }
         z.printxln("))");
      }
      else
         z.printxln(forSet ? p.fpnSet : p.fpnGet, "(x)");
   }
}

define cw = 32; //16; //84; // column width
void resetDeclerationsMaps()
{
   typedefs.RemoveAll();
   structs.RemoveAll();
}

Map<String, DeclarationInit> typedefs { };
Map<String, DeclarationInit> structs { };

ClassDefDeclaration astClassDefDecl(const char * ident, TypeInfo ti)
{
   return ClassDefDeclaration { decl = astDeclInit(null, createField, ident, null, ti, null, null/*, null*/) };
}

enum CreateDeclInitMode
{
   getTypedef, getStruct, emptyTypedef, createTypedef, createStruct, createField;

   property bool _get { get { return this == getStruct || this == getTypedef; } }
   property bool create { get { return this == emptyTypedef || this == createStruct || this == createTypedef; } }
   property bool _typedef { get { return this == emptyTypedef || this == createTypedef; } }
   property bool _struct { get { return this == createStruct || this == getStruct; } }
};

DeclarationInit astDeclInitGet(const char * name, CreateDeclInitMode mode)
{
   MapIterator<String, DeclarationInit> i { map = mode._struct ? structs : typedefs };
   if(!mode._get) check();
   if(i.Index(name, false))
      return i.data;
   return null;
}

DeclarationInit astDeclInit(const char * name, CreateDeclInitMode mode,
      const char * ident, const char * sspec, TypeInfo ti, DeclarationInit declInit, BVariant vTop/*, AST ast*/)
{
   bool build = mode == createField || declInit != null;
   DeclarationInit di = declInit;
   Class cl = ti.cl ? ti.cl : ti.c ? ti.c.cl : null;
   if(mode._get) check();
   if(!di && (mode._typedef || mode._struct))
   {
      MapIterator<String, ASTNode> i { map = mode._struct ? structs : typedefs };
      if(i.Index(cl ? cl.name : name, mode.create))
         di = (DeclarationInit)i.data;
      else if(mode.create)
      {
         i.data = di = { };
         if(mode != emptyTypedef)
            build = true;
      }
   }
   if(build)
   {
      int ptr2 = 0;
      ASTDeclarator decl = null;
      SpecsList s = null;
      InitDeclList d = null;
      DeclIdentifier declIdent = null;
      Type t2 = null;
      if(!di)
         di = { };
      if(mode == createField || mode == createTypedef)
      {
         d = { };
         declIdent = astDeclIdentifier(ident);
      }
      if(mode == createField)
      {
         s = astTypeSpec(ti, &ptr2, &t2, null, { }, vTop);
         if(t2 && (t2.kind == functionType || t2.kind == arrayType))
         {
            Type t3 = null;
            int ptr3 = 0;
            if(s) check();
            if(t2.kind == arrayType)
            {
               decl = astDeclArray(declIdent, di, true, &ti.type);
               s = astTypeSpec(ti, &ptr3, &t3, null, { }, vTop);
               decl = astDeclPointer(ptr3, decl);
            }
            else if(t2.kind == functionType)
            {
               Type param;
               TypeNameList list { };
               ti.type = t2.returnType;
               s = astTypeSpec(ti, &ptr3, &t3, null, { }, vTop);
               decl = DeclFunction { declarator = DeclBrackets { declarator = astDeclPointer(ptr2, declIdent) }, parameters = list };
               for(param = t2.params.first; param; param = param.next)
                  astTypeName(param.name, { type = param }, { }, vTop, list);
            }
         }
         else if(ti.dm.dataType.bitFieldCount)
            decl = DeclBitField { size = ExpConstant { constant = PrintString(ti.dm.dataType.bitFieldCount) }, declarator = declIdent };
         else if(ptr2)
            decl = astDeclPointer(ptr2, declIdent);
         else
            decl = declIdent;
      }
      else
         s = { };
      if(mode == createTypedef)
      {
         s.Add(SpecBase { specifier = _typedef });
         s.Add(SpecClass { id = ASTIdentifier { string = CopyString(sspec) } });
      }
      else if(mode == createStruct)
         s.Add(SpecClass { type = _struct, id = ASTIdentifier { string = CopyString(ident) }, definitions = { } });
      di.specifiers = s;
      if(d)
      {
         if(declIdent && !decl)
            decl = declIdent;
         d.Add(ASTInitDeclarator { declarator = decl });
         di.declarators = d;
      }
   }
   else if(mode == emptyTypedef)
   {
      if(ti.c)
      {
         BClass c = ti.c;
         Class cl = c.cl;
         ASTNode classDef = di;
         if(classDef)
         {
            char * baseName = null;
            TokenType2 typedefType = identifier;
            DeclarationInit specDI, typedefDI;

            typedefDI = (DeclarationInit)classDef;
            if(!cl.templateClass && (cl.type == noHeadClass || cl.type == structClass))
               typedefType = _struct;
            specDI = astDeclInitGet(c.spec, getTypedef); // careful

            if(typedefType == _struct)
            {
               typedefDI.specifiers = { [
                  SpecBase { specifier = _typedef },
                  SpecClass { type = _struct, id = ASTIdentifier { string = PrintString("C(", c.spec, ")") } }
               ] };
            }
            else if(typedefType == identifier)
            {
               if(cl.type == enumClass || (c.clBase && c.clBase.templateClass))
               {
                  typedefDI.specifiers = { [
                     SpecBase { specifier = _typedef },
                     SpecClass { id = ASTIdentifier { string = CopyString(c.baseSymbolName) } }
                  ] };
               }
               else
               {
                  typedefDI.specifiers = { [
                     SpecBase { specifier = _typedef },
                     SpecClass { id = ASTIdentifier { string = c.noSpecMacro ? CopyString(c.spec) : PrintString("C(", c.spec, ")") } }
                  ] };
               }
            }

            typedefDI.declarators = { [
               ASTInitDeclarator { declarator = DeclIdentifier {
                     identifier = ASTIdentifier {
                           string = CopyString(c.symbolName) } } }
            ] };
            if(typedefDI)
               ;
            else if(typedefDI && !specDI && (!strcmp(c.spec, "double") ||
                  !strcmp(c.spec, "char *") ||
                  !strcmp(c.spec, "uint8_t") ||
                  !strcmp(c.spec, "int64_t") ||
                  !strcmp(c.spec, "intptr_t") ||
                  !strcmp(c.spec, "ssize_t") ||
                  !strcmp(c.spec, "uint32_t") ||
                  !strcmp(c.spec, "uint16_t") ||
                  !strcmp(c.spec, "uint64_t") ||
                  !strcmp(c.spec, "uintptr_t") ||
                  !strcmp(c.spec, "size_t") ||
                  !strcmp(c.spec, "struct class_members_Instance *") ||
                  !strcmp(c.spec, "struct __ecereNameSpace__ecere__com__Instance")))
               ;
            else check();
            delete baseName;
         }
      }
      else if(ti.t)
      {
         BTemplaton t = ti.t;
         ASTNode classDef = t.cname ? astDeclInitGet(t.cname, getTypedef) : null;
         if(classDef)
         {
            DeclarationInit typedefDI = (DeclarationInit)classDef;
            char * baseName = null;
            if(!t.tp)
            {
               if(t.c.cl.templateClass.templateClass)
                  baseName = getTemplateClassSymbol(t.c.cl.templateClass.name);
               else
               {
                  BClass c = t.c.cl.templateClass;
                  baseName = CopyString(c.symbolName);
               }
               if(!baseName) check();
            }
            typedefDI.specifiers = { [
               SpecBase { specifier = _typedef },
               SpecClass { id = ASTIdentifier { string = CopyString(t.tp ? "uint64_t" : baseName) } }
            ] };
            delete baseName;

            typedefDI.declarators = { [
               ASTInitDeclarator { declarator = DeclIdentifier {
                     identifier = ASTIdentifier {
                           string = CopyString(t.cname) } } }
            ] };
         }
      }
   }
   return di;
}

TokenType2 tokenType(Type from)
{
   switch(from.kind)
   {
      case voidType:    return _void;
      case charType:    return _char;
      case shortType:   return _short;
      case intType:     return from.isSigned ? _int : _uint;
      case int64Type:   return /*from.isSigned ? */_int64/* : _uint64*/;
      case longType:    return _long;
      case floatType:   return _float;
      case doubleType:  return _double;
      case int128Type:  return /*from.isSigned ? */_int128/* : _uint128*/;
   }
   return none;
}

const char * tokenTypeString(Type from)
{
   switch(from.kind)
   {
      case voidType:    return "void";
      case charType:    return "char";
      case shortType:   return "short";
      case intType:     return from.isSigned ? "int" : "uint";
      case int64Type:   return /*from.isSigned ? */"int64"/* : "uint64"*/;
      case longType:    return "long";
      case floatType:   return "float";
      case doubleType:  return "double";
      case int128Type:  return /*from.isSigned ? */"int128"/* : "uint128"*/;
      case classType:   return from._class.string; // uint16, and others?
   }
   return null;
}

SpecsList astTypeSpec(TypeInfo ti, int * indirection, Type * resume, SpecsList to, OptBits opt, BVariant vTop)
{
   int ptr = 0;
   char * name = null;
   Type t = unwrapPointerType(ti.type, &ptr);
   SpecsList quals = to ? to : { };
   Class _class = null;
   bool isBaseClass = false;
   bool nativeSpec = false;
   BClass c = null;

   if(t.kind == classType || t.kind == subClassType)
   {
      _class = ((CGen)app.gen).getClassFromType(t, true);
      if(_class)
         c = _class;
      isBaseClass = /*!t._class || !t._class.string || */c && c.is_class/*_class && !strcmp(_class.name, "class")*/;
   }

   if(t.kind == classType && _class &&
         (_class.type == noHeadClass || (_class.type == structClass && opt.param) ||
         (isBaseClass && t.classObjectType != anyObject)))
   {
      if(!ptr) // tocheck
         ptr = 1;
   }

   if(indirection) *indirection = ptr;
   if(resume) *resume = t;

   if(t.kind == arrayType || t.kind == functionType)
      delete quals;

   if(t.kind == classType || t.kind == subClassType)
   {
      if(_class && t.constant && !strcmp(t._class.string, "String")) // hack
      {
         name = CopyString("constString");                           // hack
         nativeSpec = true;
      }
      else if(t.classObjectType == anyObject && isBaseClass)
      {
         name = CopyString("any_object");                            // hack
         nativeSpec = true;
      }

      if(!name)
      {
         name = _class ? getClassTypeName(_class) : oldGetClassTypeName(t._class.string);
         if(!strcmp(name, "unichar") || !strcmp(name, "any_object")) // hack
            nativeSpec = true;
         if(!strcmp(name, "class"))
         {
            delete name;
            name = CopyString("Class");
         }
      }
   }

   switch(t.kind)
   {
      case voidType: case charType: case shortType: case intType:
      case int64Type: case int128Type: case longType: case floatType:
      case doubleType: case intPtrType:
         if(t.constant)
            quals.Add(SpecBase { specifier = _const });
         break;
   }
   switch(t.kind)
   {
      case ellipsisType:
         quals.Add(SpecName { name = CopyString("...") });
         break;
      case vaListType:
         quals.Add(SpecName { name = CopyString("__builtin_va_list") });
         break;
      case voidType: case charType: case shortType: case intType:
      case int64Type: case int128Type: case longType: case floatType:
      case doubleType:
         quals.Add(SpecBase { specifier = tokenType(t) });
         break;
      case intPtrType:
         quals.Add(SpecName { name = CopyString(t.isSigned ? "intptr" : "uintptr") });
         break;
      case intSizeType:
         quals.Add(SpecName { name = CopyString(t.isSigned ? "intzie" : "uintsize") });
         break;
      case structType:
         quals.Add(SpecClass { type = _struct, id = ASTIdentifier { string = CopyString(t.enumName) } });
         break;
      case classType:
      {
         if(_class && _class.type == systemClass)
         {
            if(isBaseClass)
               quals.Add(SpecName { name = nativeSpec ? CopyString(name) : PrintString("C(", name, ")") });
            else
            {
               if(t.constant)
                  quals.Add(SpecBase { specifier = _const });
               quals.Add(SpecName { name = CopyString(name) });
            }
         }
         else
         {
            quals.Add(SpecName { name = nativeSpec ? CopyString(name) : PrintString("C(", name, ")") });
            if(vTop && t._class.registered)
            {
               BOutputType value = BOutputType::getFromVariantKind(vTop.kind);//vTop.kind;
               if(value)
                  vTop.processDependency(value, otypedef, t._class.registered);
            }
         }
         break;
      }
      case thisClassType:
         quals.Add(SpecName { name = PrintString("thisclass(", ti.cl.name, ti.cl.type == noHeadClass ? " *" : "", ")") });
         break;
      case subClassType:
         quals.Add(SpecName { name = PrintString("subclass(", name, ")") });
         break;
      case templateType:
         if(t.templateParameter)
         {
            TemplateParameter tp = t.templateParameter;
            Class cl = null;
            ClassTemplateParameter ctp = findClassTemplateParameter(tp.identifier.string, ti.cl, &cl);
            if(tp.type == type && tp.identifier && tp.identifier.string)
            {
               BTemplaton t = ((CGen)app.gen).bmod.addTempleton(ctp, cl);
               quals.Add(SpecName { name = CopyString(t.cname) });
               if(vTop && vTop.kind == vclass)
                  vTop.processDependency(ostruct, otypedef, t);
            }
            else check();
         }
         else check();
         break;
      case arrayType: case functionType:
         break;
      case pointerType:
      case unionType: case enumType: case methodType: case dummyType:
      case _BoolType:
      default:
         check();
         delete quals;
   }
   delete name;
   return quals;
}

DeclIdentifier astDeclIdentifier(const char * ident)
{
   return ident ? { identifier = ASTIdentifier { string = CopyString(ident) } } : null;
}

char * strTypeName(const char * ident, TypeInfo ti, OptBits opt, BVariant vTop)
{
   char * str;
   DynamicString z { };
   TypeNameList list { };
   astTypeName(ident, ti, opt, vTop, list);
   ec2PrintToDynamicString(z, list, false);
   str = CopyString(z.array);
   delete list;
   delete z;
   return str;
}

void zTypeName(DynamicString z, const char * ident, TypeInfo ti, OptBits opt, BVariant vTop)
{
   TypeNameList list { };
   astTypeName(ident, ti, opt, vTop, list);
   ec2PrintToDynamicString(z, list, false);
   delete list;
}

void astTypeName(const char * ident, TypeInfo ti, OptBits opt, BVariant vTop, TypeNameList list)
{
   ASTTypeName tn;
   SpecsList quals = null;
   SpecialType st = ti.type ? specialType(ti.type) : { };
   Type param;

   if(st == typedObject)
   {
      if(!opt.notype)
      {
         quals = { };
         if(ti.type.constant)
            quals.Add(SpecBase { specifier = _const });
         quals.Add(SpecName { name = CopyString("C(Class) *") }); // hack
      }
      tn =  ASTTypeName
            {
               qualifiers = quals,
               declarator = opt.anonymous ? null : DeclIdentifier { identifier = ASTIdentifier { string = PrintString("class_", ident) } }
            };
      list.Add(tn);
      if(!opt.notype)
      {
         quals = { };
         if(ti.type.constant)
            quals.Add(SpecBase { specifier = _const });
         quals.Add(SpecBase { specifier = _void });
         tn =  ASTTypeName
               {
                  qualifiers = quals,
                  declarator = DeclPointer { pointer = ASTPointer { },
                        declarator = opt.anonymous ? null : DeclIdentifier { identifier = ASTIdentifier { string = CopyString(ident) } } }
               };
      }
      else
      {
      tn =  ASTTypeName
            {
               qualifiers = quals,
               declarator = opt.anonymous ? null : DeclIdentifier { identifier = ASTIdentifier { string = CopyString(ident) } }
            };
      }
      list.Add(tn);
   }
   else
   {
      int ptr = 0;
      Type t = null;
      char * safeIdent = opt.param && cppKeywords.Find(ident) ? PrintString("_", ident) : CopyString(ident);
      ASTDeclarator decl = opt.anonymous ? null : astDeclIdentifier(safeIdent);
      delete safeIdent;
      if(!opt.notype)
         quals = astTypeSpec(ti, &ptr, &t, null, { param = opt.param }, vTop);
      else
         // trying this instead of //astTypeSpec(ti, &ptr, &t, null, { param = opt.param }, vTop);
         t = unwrapPointerType(ti.type, &ptr);
      if(t.kind == arrayType)
      {
         if(ptr) check();
         if(quals) check();
         decl = astDeclArray(decl, null, false, &ti.type);
         assert(ti.type == t.arrayType);
         quals = astTypeSpec(ti, &ptr, &t, null, { }, vTop);
      }
      else if(t.kind == functionType)
      {
         Type t2 = null;
         TypeNameList list { };
         int ptr2 = 0;
         //if(ptr) check();
         if(quals) check();
         ti.type = t.returnType;
         quals = astTypeSpec(ti, &ptr2, &t2, null, { }, vTop);
         decl = DeclFunction { declarator = DeclBrackets { declarator = astDeclPointer(ptr, decl) }, parameters = list };
         ptr = 0;
         for(param = t.params.first; param; param = param.next)
            astTypeName(param.name, { type = param }, opt, vTop, list);
      }
      tn = { qualifiers = quals, declarator = (ptr && !opt.notype) ? astDeclPointer(ptr, decl) : decl };
      list.Add(tn);
   }
}

DeclPointer astDeclPointer(int ptrCount, ASTDeclarator decl)
{
   int n;
   ASTPointer pointer = null;
   for(n = 0; n < ptrCount; n++)
   {
      pointer = ASTPointer { pointer = pointer };
   }
   return DeclPointer { pointer = pointer, declarator = decl };
}

DeclArray astDeclArray(ASTDeclarator declarator, DeclarationInit di, bool setExp, Type * type)
{
   DeclArray result = null;
   ASTDeclarator decl = declarator;
   while(type->kind == arrayType)
   {
      DeclArray d { declarator = decl };
      if(setExp)
      {
         Type t = *type;
         if(t.arraySizeExp && t.arraySizeExp.type == constantExp && t.arraySizeExp.constant)
            d.exp = ExpConstant { constant = CopyString(t.arraySizeExp.constant) };
         else
            d.exp = ExpConstant { constant = Expression2String(t.arraySizeExp) };
      }
      *type = type->arrayType;
      decl = d;
   }
   if(decl != declarator) result = (DeclArray)decl;
   return result;
}

DeclarationInit astFunction(const char * ident, TypeInfo ti, OptBits opt, BVariant vTop)
{
   Type t = null;
   Type param;
   SpecsList specs { };
   //InitDeclList decls { };
   TypeNameList params { };
   DeclFunction declFunction { parameters = params };
   ASTInitDeclarator initDecl { };
   DeclarationInit declInit { specifiers = specs, declarators = { [ initDecl ] } };
   DeclIdentifier declIdent = opt.anonymous ? null : astDeclIdentifier(ident);
   SpecsList s = null;
   int ptr2 = 0;
   if(opt._extern)
      specs.Add(SpecBase { specifier = _extern });
   if(opt._dllimport)
      specs.Add(SpecName { name = CopyString("__attribute__((dllimport))") });

   s = astTypeSpec(ti, &ptr2, &t, null, opt, vTop);
   if(t)
   {
      Type t3 = null;
      int ptr3 = 0;
      if(s) check();
      if(t.kind == functionType)
      {
         OptBits opt2 = opt;
         opt2.param = true;
         ti.type = t.returnType;
         astTypeSpec(ti, &ptr3, &t3, specs, opt, vTop);
         initDecl.declarator = ptr3 ? astDeclPointer(ptr3, declFunction) : declFunction;
         if(opt.pointer)
         {
            if(ptr2) check();
            ptr2 = 1;
         }
         declFunction.declarator = ptr2 ? DeclBrackets { declarator = astDeclPointer(ptr2, declIdent) } : declIdent;
         if(ti.md && ti.cl && !ti.md.dataType.staticMethod)
         {
            Type t = ProcessTypeString(ti.cl.name, false);
            //Type t = ProcessTypeString(md.dataType.thisClass.string, false);
            if(ti.cl.type == systemClass) check();
            astTypeName("__this", { type = t, from = ti }, opt2, vTop, params);
            FreeType(t);
         }
         if(!(ti.md && ti.cl && !ti.md.dataType.staticMethod) ||
            !(ti.md.dataType.params.count == 1 && (param = ti.md.dataType.params.first) && !param.name && param.kind == voidType))
         for(param = t.params.first; param; param = param.next)
            astTypeName(param.name, { type = param, from = ti }, opt2, vTop, params);
      }
      else check();
   }
   else check();
   return declInit;
}

ASTRawString astNullDefine()
{
   ASTRawString raw { };
   DynamicString z { };
   z.printxln("#if defined(__cplusplus)");
   z.printxln("#define null 0");
   z.printxln("#else");
   z.printxln("#define null ((void *)0)");
   z.printxln("#endif");
   raw.string = CopyString(z.array);
   delete z;
   return raw;
}

String Expression2String(Expression e)
{
   TempFile f { };
   String v;
   int size;

   OutputExpression(e, f);

   f.Seek(0, start);
   size = f.GetSize();
   v = new char[size + 1];
   f.Read(v, 1, size);
   v[size] = 0;
   delete f;
   return v;
}

char * getReducedTypesExpressionString(char * str)
{
   char * result;
   char * s;
   char * start = str;
   DynamicString z { };
   for(s = str; *s; s++)
   {
      if(*s == 'C' && *(s + 1) == '(')
      {
         char * t = s + 2;
         while(*t && *t != ')') t++;
         if(*t == ')')
         {
            *s = *t = 0;
            z.print(start);
            start = t + 1;
            {
               Class cl = eSystem_FindClass(app.gen.mod, s + 2);
               if(cl)
               {
                  Class clReduced = reduceUnitClass(cl);
                  BClass cReduced = clReduced;
                  z.print(cReduced.symbolName);
               }
               else
                  z.print(s + 2);
            }
            s = t;
         }
      }
   }
   z.print(start);
   result = CopyString(z.array);
   delete z;
   return result;
}

ASTRawString astDefine(DefinedExpression df, BDefine d)
{
   ASTRawString raw { };
   DynamicString z { };
   // hardcoded hack -- todo toposort / namespace order / nice usable bindings
   //if(g.lib.ecere && strcmp(d.name, "LIGHTSHIFT") && strcmp(d.name, "LIGHTSTEPS")) // hack (moved defines)
   char buf[4096];
   char * val;
   Expression e = ParseExpressionString((char *)df.value);
   String v;
   SetInCompiler(true);
   SetParsingType(true);
   ProcessExpressionType(e);
   ProcessExpressionInstPass(e);
   SetInCompiler(false);
   SetParsingType(false);
   v = Expression2String(e);
   val = getNoNamespaceString(v, buf, false);
   delete v;
   {
      int i;
      char ch;
      for(i = 0; (ch = val[i]); i++)
         if(ch == '\n')
            val[i] = ' ';
   }
   v = CopyString(val);
   val = getReducedTypesExpressionString(v);
   delete v;
   z.printxln("#define ", d.name, " (", val, ")");
   delete val;
   FreeExpression(e);
   raw.string = CopyString(z.array);
   delete z;
   return raw;
}

ASTRawString astEnum(Class cl, BClass c)
{
   ASTRawString raw { };
   DynamicString z { };
   EnumClassData enumeration = (EnumClassData)cl.data;
   bool noValues = enumeration.values.count == 0;
   NamedLink item;
   if(c.isBool)
   {
      ASTNode node = astDeclInit(c.cname, emptyTypedef, null, null, { c = c }, null, null/*, ast*/);
      ec2PrintToDynamicString(z, node, true);
      z.println("#if !defined(__bool_true_false_are_defined) && !defined(__cplusplus)");
      z.print("enum boolean {");
   }
   else
   {
      bool enumMacroWay = false;//true; // todo add option to program args
      if(enumMacroWay)
         z.printx("ENUM(", cl.name, ", uint32)", " {"); // todo, get the type right
      else
      {
         const char * dataType = tokenTypeString(cl.dataType);
         z.println("#if CPP11");
         z.printxln("enum C(", cl.name, ") : ", dataType, noValues ? ";" : "");
         z.println("#else");
         {
            ASTNode node = astDeclInit(c.cname, emptyTypedef, null, null, { c = c }, null, null/*, ast*/);
            ec2PrintToDynamicString(z, node, true);
         }
         z.printxln("enum C(", cl.name, ")", noValues ? ";" : "");
         z.println("#endif");
         if(!noValues)
            z.print("{");
      }
   }
   for(item = enumeration.values.first; item; item = item.next)
   {
      char b[1024];
      b[0] = 0;
      if((int64)item.data >= 0)
         PrintBuf(b, sizeof(b) - 1, item.data);
      else
         PrintBuf(b, sizeof(b) - 1, (int64)item.data);
      if(!b[0])
         strcpy(b, "0x0");
      if(c.isBool)
         z.printx(item == enumeration.values.first ? "\n" : ",\n", "   ", item.name, " = ", b);
      else
         z.printx(item == enumeration.values.first ? "\n" : ",\n", "   ", cl.name, "_", item.name, " = ", b);
   }
   if(!noValues)
      z.println("\n};");
   else
      z.println("\n");
   if(c.isBool)
   {
      z.println("#endif");
      z.println("#define eC_true   ((C(bool))1)");
      z.println("#define eC_false  ((C(bool))0)");
   }
   raw.string = CopyString(z.array);
   delete z;
   return raw;
}

ASTRawString astBitTool(Class cl, BClass c)
{
   ASTRawString raw { };
   DynamicString z { };
   Array<String> bitMembers = null;
   bool haveContent = false;
   DataMember dm; IterDataMember dat { cl };
   if(cl.members.count <= 4) bitMembers = { };
   while((dm = dat.next(all)))
   {
      BitMember bm = (BitMember)dm;
      if(!dm.dataType)
      {
         Context context = SetupTemplatesContext(cl);
         dm.dataType = ProcessTypeString(dm.dataTypeString, false);
         FinishTemplatesContext(context);
      }
      if(bm.type == normalMember) // todo, recurse struct/union? members for bitfields inside structs i.e.: PolygonRing
      {
         char x[1024];
         String n_ = PrintString(c.upper, "_", bm.name, "_");
         String n = CopyString(n_);
         String s = PrintString(c.upper, "_SET_", bm.name);
         if(bitMembers) bitMembers.Add(CopyString(bm.name));
         n[strlen(n)-1] = 0;
         x[0] = 0;
         PrintBuf(x, sizeof(x) - 1, (void*)bm.mask); //sprintf(x, "0x%"PRIX64, bm.mask);
         if(!x[0]) strcpy(x, "0x0");                     // todo, bitfield, get shift and mask
         z.printxln("#define ", n_, "SHIFT", spaces(48, strlen(n_) + 5), " ",
               dm.dataType.bitFieldCount ? dm.dataType.offset : bm.pos);
         z.printxln("#define ", n_, "MASK", spaces(48, strlen(n_) + 4), " ", x);
         z.printxln("#define ", n, "(x)", spaces(48, strlen(n) + 3),
               " ((((", cl.name, ")(x)) & ", n_, "MASK) >> ", n_, "SHIFT)");
         z.printxln("#define ", s, "(x, ", bm.name, ")", spaces(48, strlen(s) + 6),
               " (x) = ((", cl.name, ")(x) & ~((", cl.name, ")", n_,
               "MASK)) | (((", cl.name, ")(", bm.name, ")) << ", n_, "SHIFT)");
         haveContent = true;
         delete n_;
         delete n;
         delete s;
      }
   }
   if(bitMembers)
   {
      int i, charCount = strlen(c.upper) + 2;
      z.printx("#define ", c.upper, "(");
      for(i = 0; i < bitMembers.count; i++)
      {
         char * name = bitMembers[i];
         charCount += strlen(name) + i ? 2 : 0;
         if(i) z.printx(", ");
         z.printx(name);
      }
      z.printx(")", spaces(48, charCount));
      for(i = 0; i < bitMembers.count; i++)
         z.printx("(");
      for(i = 0; i < bitMembers.count; i++)
      {
         char * name = bitMembers[i];
         if(i) z.printx(" | ");
         z.printx("((", cl.name, ")(", name, ")) << ", c.upper, "_", name, "_SHIFT)");
      }
      z.printxln("");
      bitMembers.Free();
      delete bitMembers;
   }
   if(haveContent) z.printxln("");
   raw.string = CopyString(z.array);
   delete z;
   return raw;
}

ASTRawString astMethod(CGen g, Method md, Class cl, BClass c, MethodGenFlag methodFlag,
      bool instanceClass, bool * haveContent, BVariant vTop)
{
   ASTRawString raw { };
   DynamicString z { };
   BMethod m = md;
   m.init(md, c);
   if(md.type == virtualMethod)
   {
      *haveContent = true;
      if(!methodFlag || methodFlag == vTblID)
         z.printxln("extern int ", m.v, ";");
      if(!methodFlag || methodFlag == virtualMethodCaller)
         cgenPrintVirtualMethodDefs(z, c, m, c.is_class/*assumeTypedObject*/, instanceClass, vTop);
      if(!methodFlag || methodFlag == virtualMethodImport)
         z.printx("extern C(Method) * ", m.m, ";");
   }
   else if(md.type == normalMethod)
   {
      if(!methodFlag || methodFlag == nonVirtualMethodImport)
      {
         if(!g.lib.ecereCOM || !(c.isModule && (!strcmp(md.name, "Load") || !strcmp(md.name, "Unload")))) // hack
         {
            ASTNode node = astFunction(m.n, { type = md.dataType, md = md, cl = cl }, { _extern = true, pointer = true }, vTop);
            ec2PrintToDynamicString(z, node, true);
            *haveContent = true;
         }
      }
   }
   else check();
   raw.string = CopyString(z.array);
   delete z;
   return raw;
}

void recurseBaseClassMembers(CGen g, BClass c, BClass cTop, bool local, ClassDefList defs, OptBits opt)
{
   Class cl = c.cl;
   MemberOrProperty mb;
   if((cl.type == structClass || cl.type == noHeadClass) && cl.base && !cl.base.templateClass &&
         strcmp(cl.base.name, "IteratorPointer") &&   // hack
         strcmp(cl.base.name, "Module") &&            // hack
         strcmp(cl.base.name, "Container") &&         // hack
         strcmp(cl.base.name, "Window") &&            // hack
         strcmp(cl.base.name, "ListItem") &&          // hack
         strcmp(cl.base.name, "IOChannel") &&         // hack
         strcmp(cl.base.name, "Instance") &&          // hack
         strcmp(cl.base.name, "struct") &&            // hack
         strcmp(cl.base.name, "class"))               // hack
   {
      BClass cBase = cl.base;
      recurseBaseClassMembers(g, cBase, cTop, cBase.isFromCurrentModule, defs, opt);
   }
   if(cl.membersAndProperties.first)
   {
      for(mb = (MemberOrProperty)cl.membersAndProperties.first; mb; mb = mb.next)
      {
         if(!mb.isProperty)
         {
            DataMember dm = (DataMember)mb;
            if(dm && !dm.dataType)
            {
               Context context = SetupTemplatesContext(cl);
               dm.dataType = ProcessTypeString(dm.dataTypeString, false);
               FinishTemplatesContext(context);
            }
            if(dm && cl.type != bitClass &&
                  //dm.name && dm.dataTypeString &&
                  (dm.memberAccess == privateAccess || dm.memberAccess == publicAccess))
            {
               if(defs)
               {
                  if(cl.templateClass) check();
                  addDataMemberToDeclInit(g, dm, defs, c, cTop, local, opt);
               }
               else check();
            }
            else if(cl.type != bitClass && dm && dm.name && !dm.dataType.bitFieldCount) check();
         }
      }
   }
}

void addDataMemberToDeclInit(CGen g, DataMember dm, ClassDefList defs, BClass c, BClass cTop, bool local, OptBits opt)
{
   Class cl = c.cl;
   if(!dm.name && (dm.type == unionMember || dm.type == structMember))
   {
      DataMember mdm;
      ClassDefList memberDefs { };
      ClassDefDeclaration declMember
      {
         decl = DeclarationInit
         {
            specifiers = SpecsList { [
               SpecClass {
                  type = dm.type == structMember ? _struct : _union,
                  definitions = memberDefs
               }
            ] }
         }
      };
      for(mdm = dm.members.first; mdm; mdm = mdm.next)
      {
         if(mdm.isProperty) check();
         if(!mdm.dataType)
         {
            Context context = SetupTemplatesContext(cl);
            mdm.dataType = ProcessTypeString(mdm.dataTypeString, false);
            FinishTemplatesContext(context);
         }
         if(mdm.dataType.bitFieldCount)
            ;// todo, bitfield, add space and also add setters and getters, etc
         else
            addDataMemberToDeclInit(g, mdm, memberDefs, c, cTop, local, opt);
      }
      defs.Add(declMember);
   }
   else
   {
      if(!dm.dataType)
      {
         Context context = SetupTemplatesContext(cl);
         dm.dataType = ProcessTypeString(dm.dataTypeString, false);
         FinishTemplatesContext(context);
      }
      {
         ASTClassDef def = null;
         if(local)
            processTypeDependency(g, dm.dataType, dm.dataTypeString, ostruct, cTop);

         def = astClassDefDecl(dm.name, { type = dm.dataType, dm = dm, cl = cl });
         if(!def) check();
         if(def)
            defs.Add(def);
      }
   }
}

void processTypeDependency(CGen g, Type type, const char * dataTypeString, BOutputType from, BVariant vTop)
{
   bool native;
   bool pointer;
   Type t = unwrapType(type, &native, &pointer);
   if(!native)
   {
      Class clDep = null;
      if(t.kind == functionType)
         Print(""); // todo;
      else if(t.kind == structType)
         Print("");
      else if(t.kind == classType)
         clDep = g.getClassFromType(t, true);
      else if(t.kind == subClassType)
         Print("");
      else if(t.kind == thisClassType)
         Print("");
      else if(t.kind == templateType)
         Print("");
      else
         Print("");

      if(vTop.kind == vclass && clDep == vTop.c.cl && from == otypedef) clDep = null;
      if(vTop.kind == vproperty && clDep == vTop.p.c.cl) clDep = null;
      if(clDep)
      {
         BOutputType to = nil;
         if(clDep.templateClass)
         {
            BTemplaton tDep = g.bmod.addTemplateType(clDep, g.bmod.root_nspace);
            vTop.processDependency(from, otypedef, tDep);
         }
         else
            vTop.processDependency(from, otypedef, clDep);
         if(!pointer && clDep.type != systemClass && clDep.type != unitClass && clDep.type != bitClass)
         {
            if(clDep.type == enumClass) to = oenum;
            else if(clDep.type == structClass || clDep.type == noHeadClass ||
                  clDep.type == normalClass) to = ostruct;
            else check();
            if(!clDep.templateClass)
               vTop.processDependency(from, to, clDep);
         }
      }
   }
   if(type.bitMemberSize) check();
}
