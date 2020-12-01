#include "debug.eh"
#include "bgen.eh"
#include "econe.eh"

import "bgen"

import "cHeader"
import "cCode"

#define TYPE_INFO_FROM(x) fn = x.fn, pt = x.pt, md = x.md, dm = x.dm, cl = x.cl, f = x.f, p = x.p, m = x.m, c = x.c

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

AVLTree<consttstr> brokenMethodsC { [
   // AttributeStore::requestAttributes
   //    virtual void requestAttributes(Array<AttributesKey> requests, void (* completedCallback)(void *context, HashMap<int64, Map<int, FieldValue>> multiResults), void* context)
   // generates following code:
   //    // void AttributeStore_requestAttributes(C(AttributeStore) __i, C(Array) requests, void (* completedCallback)(void * context, C(HashMap) multiResults), void * context);
   //    #define AttributeStore_requestAttributes(__i, requests, void (* completedCallback)(context, multiResults), context) \
   //       VMETHOD(CO(AttributeStore), AttributeStore, requestAttributes, __i, void, \
   //          C(AttributeStore) _ARG C(Array) _ARG void (*)(void *, C(HashMap)) _ARG void *, \
   //          __i _ARG requests _ARG void (* completedCallback)(context, multiResults) _ARG context)
   // gives following error:
   //    gnosis3.h:1310:62: error: "(" may not appear in macro parameter list
   // { "AttributeStore", "requestAttributes" },

   // AttributeStore::retrieveMultiValues
   //    HashMap<int64, Map<int, FieldValue>> retrieveMultiValues(Map<Array<int>, Array<int64>> fieldAndFeatureIDs,
   //       bool AttributeStore::getValueMethod(int64 featureID, int fieldID, FieldValue value))
   // generates following code:
   //          METHOD(AttributeStore, retrieveMultiValues) = Class_findMethod(CO(AttributeStore), "retrieveMultiValues", module);
   //          if(METHOD(AttributeStore, retrieveMultiValues))
   //             AttributeStore_retrieveMultiValues = (C(HashMap) (*)(C(AttributeStore), C(Map), C(bool) ()(int64, int, C(FieldValue) *)))METHOD(AttributeStore, retrieveMultiValues)->function;
   // gives following error:
   //    error: type name declared as function returning a function
   // { "AttributeStore", "retrieveMultiValues" },

   // CMSSList::parse
   // same case
   // { "CMSSList", "parse" },


   { null, null }
] };

void runPreprocessor(const String src, const String tmp, Gen g)
{
   String cppCommand = CopyString("gcc");
   String cppOptions = PrintString(" -I ", g.dir);
   DualPipe cppOutput;
   char command[MAX_F_STRING*3];
   snprintf(command, sizeof(command), "%s%s -x c -E \"%s\"", cppCommand, cppOptions ? cppOptions : "", src);
   command[sizeof(command)-1] = 0;
   PrintLn("preprocessing command:");
   PrintLn(command);
   if((cppOutput = DualPipeOpen({ output = true }, command)))
   {
      int exitCode;
      File o;
      TempFile fileInput { };
      for(;!cppOutput.Eof();)
      {
         char junk[4096*16];
         int64 count = cppOutput.Read(junk, 1, 4096*16);
         fileInput.Write(junk, 1, count);
      }
      exitCode = cppOutput.GetExitCode();
      delete cppOutput;
      fileInput.Seek(0, start);
      if(!exitCode)
      {
         if(FileExists(tmp))
            DeleteFile(tmp);
         o = FileOpen(tmp, write);
         if(o)
         {
            sourceFileProcessToFile(o, fileInput, null, g.sourceProcessorVars, false, false);
            delete o;
         }
      }
      else
         PrintLn("error: preprocessing command failed!");
   }
   delete cppCommand;
   delete cppOptions;
}

char * Gen::allocMacroSymbolNameC(const bool noMacro, const MacroType type, const TypeInfo ti, const char * name, const char * name2, int ptr)
{
   switch(type)
   {
      case C:
         if(noMacro)    return                CopyString(name);
                        return PrintString(        "C(", name, ")");
      case CM:          return PrintString(       "CM(", name, ")");
      case CO:          return PrintString(       "CO(", name, ")");
      case SUBCLASS:    return PrintString( "subclass(", name, ")");
      case THISCLASS:   return PrintString("thisclass(", name, ptr ? " *" : "", ")");
      case T:           return ti.c ? cGetTemplatedClassSymbolName(ti.c, ti.c.cTArgs, macro) : getTemplateClassSymbol(name, false);
      case TP:          return PrintString(       "TP(", name, ", ", name2, ")");
      case F:           return PrintString(        "F(", name, ")");
      case METHOD:      return PrintString(   "METHOD(", name, ", ", name2, ")");
      case PROPERTY:    return PrintString( "PROPERTY(", name, ", ", name2, ")");
      case FUNCTION:    return PrintString( "FUNCTION(", name, ")");
      case M_VTBLID:    return PrintString( "M_VTBLID(", name, ", ", name2, ")");
   }
   return CopyString(name);
}

char * Gen::allocMacroSymbolNameExpandedC(const bool noMacro, const MacroType type, const TypeInfo ti, const char * name, const char * name2, int ptr)
{
   switch(type)
   {
      case C:
         if(noMacro)    return                    CopyString(name);
                        return PrintString(         cPrefix, name);
      case CM:          return PrintString("class_members_", name);
      case CO:          return PrintString(        "class_", name);
      case SUBCLASS:    return PrintString(cPrefix, "Class *");
      case THISCLASS:   return PrintString(         cPrefix, name, ptr ? " *" : "");
      case T:           return ti.c ? cGetTemplatedClassSymbolName(ti.c, ti.c.cTArgs, expanded) : getTemplateClassSymbol(name, true);
      case TP:          return PrintString(       "tparam_", name, "_", name2);
      case F:           return PrintString(         cPrefix, name);
      case METHOD:      return PrintString(       "method_", name, "_", name2);
      case PROPERTY:    return PrintString(     "property_", name, "_", name2);
      case FUNCTION:    return PrintString(     "function_", name);
      case M_VTBLID:    return PrintString(                  name, "_", name2, "_vTblID");
   }
   return CopyString(name);
}

class CGen : Gen
{
   char * cFileName;
   char * cFilePath;
   char * hFileName;
   char * hFilePath;
   char * makefileName;
   char * makefilePath;

   AST astH;
   AST astC;

   Array<BNamespace> storeNamespaces { };
   Array<BVariant> storeVariants { };
   Array<BVariant> storeManuals { };
   Array<BDefine> storeDefines { };
   Array<BFunction> storeFunctions { };
   Array<BClass> storeClasses { };
   Array<BMethod> storeMethods { };
   Array<BProperty> storeProperties { };

   HashMap<NameSpacePtr, BNamespace> allNamespaces { };
   HashMap<UIntPtr, BVariant> allVariants { };
   HashMap<UIntPtr, BManual> allManuals { };
   HashMap<DefinedExpressionPtr, BDefine> allDefines { };
   HashMap<GlobalFunctionPtr, BFunction> allFunctions { };
   HashMap<ClassPtr, BClass> allClasses { };
   HashMap<BTemplatonKey, BTemplaton> allTemplatons { };
   HashMap<MethodPtr, BMethod> allMethods { };
   HashMap<PropertyPtr, BProperty> allProperties { };

   HashMap<UIntPtr, BOutput> mapDefine { };
   HashMap<UIntPtr, BOutput> mapFunction { };
   HashMap<UIntPtr, BOutput> mapTypedef { };
   HashMap<UIntPtr, BOutput> mapClassPointer { };
   HashMap<UIntPtr, BOutput> mapBitTool { };
   HashMap<UIntPtr, BOutput> mapEnum { };
   HashMap<UIntPtr, BOutput> mapStruct { };
   HashMap<UIntPtr, BOutput> mapMethod { };
   HashMap<UIntPtr, BOutput> mapProperty { };
   HashMap<UIntPtr, BOutput> mapConversion { };

   AVLTree<UIntPtr> optionalClasses { };
   void addOptionalClass(BTemplaton t)
   {
      optionalClasses.Add((UIntPtr)t);
   }

   lang = C;
   allocMacroSymbolName = allocMacroSymbolNameC;
   //allocMacroSymbolName = allocMacroSymbolNameExpandedC;

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
      if(preprocess && lib.ecereCOM)
      {
         char * name = new char[MAX_LOCATION];
         char * path = new char[MAX_LOCATION];
         char * tmp = new char[MAX_LOCATION];
         strcpy(name, lib.bindingName);
         strcat(name, "-bind");
         ChangeExtension(name, "h", name);
         strcpy(path, dir);
         PathCatSlash(path, name);
         strcat(name, ".tmp");
         strcpy(tmp, dir);
         PathCatSlash(tmp, name);
         if(FileExists(tmp))
            DeleteFile(tmp);
         o = FileOpen(tmp, write);
         if(o)
         {
            ZString z { allocType = heap };
            sourceFileProcessToZedString(z, ":src/c/c_header_ec_macros.src", null, false, false);
            o.Puts(z._string);
            delete z;
            delete o;
         }
         if(FileExists(path))
            DeleteFile(path);
         MoveFile(tmp, path);
         delete name;
         delete path;
         delete tmp;
      }
      o = FileOpen(hFilePath, write);
      if(o)
      {
         cHeader(astH, this);
         astH.print(o, { });
         delete o;
      }
      if(!options.headerOnly)
      {
         o = FileOpen(cFilePath, write);
         if(o)
         {
            cCode(astC, this);
            astC.print(o, { });
            delete o;
         }
         o = FileOpen(makefilePath, write);
         if(o)
         {
            // hardcoded -- todo -- see if we can generate from dependencies :P
            sourceProcessorVars["DEP_FILE_LISTS"] = !lib.ecere ? CopyString("") : CopyString(
               "_DEP_OBJECTS = \\\n"
               "	$(OBJ)eC$(O)\n"
               "\n"
               "_DEP_SOURCES = \\\n"
               "	eC.c\n"
               "\n"
            );
            sourceProcessorVars["DEP_RULES"] = !lib.ecere ? CopyString("") : CopyString(
               "$(OBJ)eC$(O): eC.c\n"
               "	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,$<) -o $(call quote_path,$@)\n"
               "\n"
            );
            // hardcoded -- todo -- this can be generated from dependencies -- do it!
            sourceProcessorVars["DEP_LIBS"] = (lib.ecere || lib.ecereCOM) ? CopyString("") : CopyString(
               "	$(call _L,ecere) \\\n"
            );
            sourceProcessorVars["DEP_INCLUDES"] = CopyString("");
            sourceFileProcessToFile(o, null, ":src/c/c_make.src", sourceProcessorVars, false, false);
            delete o;
         }
      }
      if(preprocess)
      {
         char * cFileNameTmp = cFilePath;
         char * hFileNameTmp = hFilePath;
         char * cFileNamePrepTmp;
         char * hFileNamePrepTmp;
         cFilePath = null;
         hFilePath = null;
         prepPaths(true, "-prep");
         cFileNamePrepTmp = cFilePath;
         hFileNamePrepTmp = hFilePath;
         cFilePath = null;
         hFilePath = null;
         runPreprocessor(hFileNameTmp, hFileNamePrepTmp, this);
         runPreprocessor(cFileNameTmp, cFileNamePrepTmp, this);
         prepPaths(false, "-prep");
         if(FileExists(cFilePath))
            DeleteFile(cFilePath);
         if(FileExists(hFilePath))
            DeleteFile(hFilePath);
         MoveFile(cFileNamePrepTmp, cFilePath);
         MoveFile(hFileNamePrepTmp, hFilePath);
         delete cFileNamePrepTmp;
         delete hFileNamePrepTmp;
         delete cFilePath;
         delete hFilePath;
         cFilePath = cFileNameTmp;
         hFilePath = hFileNameTmp;
      }
      {
         char * cFileNameTmp = cFilePath;
         char * hFileNameTmp = hFilePath;
         char * makefileNameTmp = makefilePath;
         cFilePath = null;
         hFilePath = null;
         makefilePath = null;
         prepPaths(false, null);
         if(FileExists(hFilePath))
            DeleteFile(hFilePath);
         MoveFile(hFileNameTmp, hFilePath);
         if(!options.headerOnly)
         {
            if(FileExists(cFilePath))
               DeleteFile(cFilePath);
            MoveFile(cFileNameTmp, cFilePath);
            if(FileExists(makefilePath))
               DeleteFile(makefilePath);
            MoveFile(makefileNameTmp, makefilePath);
         }
         delete cFileNameTmp;
         delete hFileNameTmp;
         delete makefileNameTmp;
      }
   }

   bool init()
   {
      bool result = false;
      if(Gen::init() && readyDir())
      {
         prepPaths(true, null);

         if(FileExists(cFilePath))
            DeleteFile(cFilePath);
         if(FileExists(hFilePath))
            DeleteFile(hFilePath);
         if(FileExists(makefilePath))
            DeleteFile(makefilePath);

         if(!FileExists(cFilePath) && !FileExists(hFilePath) && !FileExists(makefilePath))
         {
            reset();

            astC = { };
            astH = { };

            if(moduleInit())
               result = true;
         }
      }
      return result;
   }

   void printOutputFiles()
   {
      if(!quiet)
      {
         PrintLn(lib.verbose > 1 ? "    " : "", hFileName);
         if(!options.headerOnly)
         {
            PrintLn(lib.verbose > 1 ? "    " : "", cFileName);
         // PrintLn(lib.verbose > 1 ? "    " : "", makefileName);
         }
      }
   }

   void prepPaths(bool tmp, const char * suffix)
   {
      int len;
      char * name = new char[MAX_LOCATION];
      char * path = new char[MAX_LOCATION];
      strcpy(path, dir);
      len = strlen(path);
      strcpy(name, lib.bindingName);
      if(suffix) strcat(name, suffix);
      ChangeExtension(name, "c", name);
      PathCatSlash(path, name);
      if(tmp) strcat(path, ".tmp");
      delete cFileName; cFileName = CopyString(name);
      delete cFilePath; cFilePath = CopyString(path);
      path[len] = 0;
      ChangeExtension(name, "h", name);
      PathCatSlash(path, name);
      if(tmp) strcat(path, ".tmp");
      delete hFileName; hFileName = CopyString(name);
      delete hFilePath; hFilePath = CopyString(path);
      path[len] = 0;
      name[strlen(lib.bindingName)] = 0;
      strcat(name, "_c");
      ChangeExtension(name, "Makefile", name);
      PathCatSlash(path, name);
      if(tmp) strcat(path, ".tmp");
      delete makefileName; makefileName = CopyString(name);
      delete makefilePath; makefilePath = CopyString(path);
      delete name;
      delete path;
   }

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
      delete makefileName;
      delete makefilePath;

      allNamespaces.Free();
      allVariants.Free();
      allDefines.Free();
      allFunctions.Free();
      allClasses.Free();
      allTemplatons.Free();
      allMethods.Free();
      allProperties.Free();
   }

   void prepareNamespaces()
   {
      IterNamespace ns { module = mod, processFullName = true };
      BNamespace n = (NameSpacePtr)null;
      while(ns.next())
      {
         ZString z { allocType = heap };
         n = (NameSpacePtr)ns.ns;
         if(!python)
         {
            z.concatx(ln);
            sectionComment_hdr(z, _ns); sectionComment_msg_line(z);         sectionComment_ftr(z); z.concatx(ln);;
            sectionComment_hdr(z, _ns); sectionComment_msg(z, ns.fullName); sectionComment_ftr(z); z.concatx(ln);;
            sectionComment_hdr(z, _ns); sectionComment_msg_line(z);         sectionComment_ftr(z); z.concatx(ln);;
            z.concatx(ln);
            n.output.Add(ASTRawString { string = CopyString(z._string) });
         }
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
         BNamespace n = (NameSpacePtr)ns.ns;
         if(!bmod.root_nspace)
         {
            bmod.root_nspace = (NameSpacePtr)ns.ns;
         }
         processDefines(n);
         if(lib.ecereCOM && ns.ns->parent == null && ns.ns->name == null)
            manualTypes(n);
         processClasses(n);
         processOptionalClasses(n);
         processFunctions(n);
      }
      processTemplatons();
      ns.cleanup();
   }

   void manualTypes(BNamespace n)
   {
      MapNode<const String, const String> node;
      for(node = !python ? manualTypedefs.root.minimum : pythonManualTypedefs.root.minimum; node; node = node.next)
      {
         Class clDep = null;
         if(!node.key) continue;
         if(node.value && !strcmp(node.value, "Instance"))
         {
            clDep = eSystem_FindClass(mod, node.value);
            conassertctx(clDep != null, "(bgen?) eSystem_FindClass(mod, \"", node.value, "\") is returning null?");
         }
         if(node.value)
         {
            char * ident;
            char * spec = allocMacroSymbolName(strcmp(node.value, "Instance") != 0, C, { cl = clDep }, node.value, null, 0);
            bool noC = false;
            // missing connection!
            BOutput out { vmanual };
            // example:
            /*
               BOutput out { vdefine, d = d };
               d.nspace.addContent(v);
               d.out = out;
            */
            Class clKey = eSystem_FindClass(mod, node.key);
            if(actualTypeNames.Find(node.key))
               noC = true;
            ident = allocMacroSymbolName(noC, C, { cl = clKey }, node.key, null, 0);
            if(!strcmp(node.value, "Instance"))
            {
               Class clDep = eSystem_FindClass(mod, node.value);
               conassertctx(clDep != null, "(bgen?) eSystem_FindClass(mod, \"", node.value, "\") is returning null?");
            }
            out.output.Add(ASTRawString { string = PrintString("// wth: manualType(", node.key, ", ", node.value, ") not outputed?") });
            out.output.Add(astDeclInit(node.key, createTypedef, ident, spec, { }, null, null));
            delete ident;
            delete spec;
            // n.addContent(v);
         }
#if 0
         else if(!strcmp(node.key, typed_object_class_ptr))
         {
            BManual x = BManual::manual(typed_object_class_ptr);
            BOutput out { vmanual, x = x };
            Class clDep = eSystem_FindClass(mod, "Class");
            BVariant v = x; // BVariant::manual(typed_object_class_ptr);
            /*x.nspace*/n.addContent(v);
            x.out = out;
            out.output.Add(ASTRawString { string = CopyString("#ifdef __cplusplus") });
            out.output.Add(ASTRawString { string = PrintString("typedef void ", typed_object_class_ptr, ";") });
            out.output.Add(ASTRawString { string = CopyString("#else") });
            out.output.Add(ASTRawString { string = PrintString("typedef C(Class) ", typed_object_class_ptr, ";") });
            out.output.Add(ASTRawString { string = CopyString("#endif") });
            if(clDep)
               v.processDependency(this, otypedef, otypedef, clDep);
         }
#endif
      }
   }

   void processClasses(BNamespace n)
   {
      Class cl; IterClass cla { n.ns, list = options.classList };
      while((cl = cla.next(all)))
      {
         // don't generate templated classes just because they are listed
         if(!cl.templateClass)
         {
            BClass c = cl;
            BVariant v = c;
            processClass(c, v, c.nspace);
         }
      }
   }

   void processOptionalClasses(BNamespace n)
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
               // if(!strcmp(t.cname, "T(CMSSList, StylingRuleBlock)")) debugBreakpoint();
               if(!cl.templateClass) conmsg("check");
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
      nspace.addContent(v);
      if(!c.skip)
      {
         Class clDep = null;
         BTemplaton tDep = null;
         // if(!strcmp(c.cl.name, "StylingRuleBlockList")) debugBreakpoint();
         // if(!strcmp(c.cl.name, "CMSSList<StylingRuleBlock>")) debugBreakpoint();
         // if(!strcmp(c.cl.name, "FreeBlockMap")) debugBreakpoint();
         // if(!strcmp(c.cl.name, "Array<ecere::gfx::drivers::BlockEntry>")) debugBreakpoint();
         if(!c.nativeSpec && !c.skipTypeDef)
         {
            conassertctx(c.clBase != null, " for c.name == \"", c.name, "\"?");

            // if(c.cl.templateClass) debugBreakpoint();

            if(c.clBase.templateClass)
            {
               clDep = c.clBase;
               tDep = bmod.addTemplateType(c.clBase, bmod.root_nspace);
               addOptionalClass(tDep);
            }
            else
            {
               clDep = eSystem_FindClass(mod, c.base);
               conassertctx(clDep != null, "(bgen?) eSystem_FindClass(mod, \"", c.base, "\") is returning null?");
            }
            if(tDep)
            {
               v.processDependency(this, otypedef, otypedef, tDep);
               // v.processDependency(this, otypedef, otypedef, clDep);
            }
            else if(clDep && clDep != cl)
               v.processDependency(this, otypedef, otypedef, clDep);
         }
      }
      aClass(c, v, &created);
   }

   void processTemplatons()
   {
      for(ti : allTemplatons)
      {
         bool init;
         BTemplaton t = ti;
         if(t.tp)
         {
            BVariant v = t;
            BNamespace n = v.nspace;
            BOutput o = t.outTypedef = bmod.getTypedefOutput((UIntPtr)t, &init);
            // if(!strcmp(t.cname, "T(CMSSList, StylingRuleBlock)")) debugBreakpoint();
            // conassertctx(init, "(bgen?) getTypedefOutput did not init? -- basicaly not typedef output was found for this templaton so it was created");
            o.kind = vtemplaton, o.t = t, o.type = otypedef;
            n.addContent(v);
            o.output.Add(astDeclInit(t.cname, emptyTypedef, null, null, { t = t }, null, null/*, ast*/));
            // v.processDependency(this, otypedef, otypedef, t.c.cl.templateClass ? t.c.cl.templateClass : t.c.cl.base);
         }
      }
   }

   void processDefines(BNamespace n)
   {
      DefinedExpression df; IterDefine def { n.ns, list = options.functionList };
      while((df = def.next()))
      {
         BDefine d = df;
         BVariant v = d;
         BOutput out { vdefine, d = d };
         d.nspace.addContent(v);
         d.out = out;
         if(lib.ecereCOM && d.isNull)
         {
            if(!python)
               out.output.Add(astNullDefine());
         }
         else
         {
            Expression exp = ParseExpressionString((char *)df.value);
            if(!python || exp.type != instanceExp)
               out.output.Add(astDefine(df, d, exp, v));
            FreeExpression(exp);
         }
      }
   }

   void processFunctions(BNamespace n)
   {
      GlobalFunction fn; IterFunction func { n.ns, list = options.functionList };
      while((fn = func.next()))
      {
         BFunction f = fn;
         if(!f.skip && !f.isDllExport)
         {
            BVariant v = f;
            BOutput out { vfunction, f = f };
            // bool hasTypedObjectParam = astFuncHasTypedObjectParam({ type = fn.dataType, fn = fn });
            f.nspace.addContent(v);
            f.out = out;
#if 0
            if(hasTypedObjectParam)
            {
               out.output.Add(ASTRawString { string = CopyString("#ifdef __cplusplus") });
               out.output.Add(astFunction(f.cSymbol, { type = fn.dataType, fn = fn }, { _extern = true, pointer = true, cpp = true }, v));
               out.output.Add(ASTRawString { string = CopyString("#else") });
            }
#endif
            out.output.Add(astFunction(f.cSymbol, { type = fn.dataType, fn = fn }, { _extern = true, pointer = true }, v));
#if 0
            if(hasTypedObjectParam)
               out.output.Add(ASTRawString { string = CopyString("#endif") });
#endif
#if 0
            if(hasTypedObjectParam)
            {
               // BManual x = BManual::manual(typed_object_class_ptr);
               // BVariant vDep = x;
               // if(vDep)
               //    v.processDependency(this, ofunction, otypedef, vDep);
            }
#endif
         }
      }
   }

   Class getClassFromType(Type type, bool reduceUnits/*, bool swapTemplateClass*/)
   {
      Class cl = null;
      const char * name = type._class.string;
      bool ecereCOMForwardDeclare = lib.ecereCOM &&
            (!strcmp(name, "Type") || !strcmp(name, "Instantiation") || !strcmp(name, "ClassDefinition"));
      if(type.kind == classType || type.kind == subClassType)
      {
         if(type._class.registered)
         {
            cl = /*(!strcmp(type._class.string, "class") && type.classObjectType == typedObject) ? eSystem_FindClass(mod, "Class") : */type._class.registered;
            if(ecereCOMForwardDeclare) conmsg("check");
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
            else if(!strcmp(type._class.string, "rpGraph"))
               ; // where is this one from?
            else
               conmsg("check");
         }
      }
      else conmsg("check");
      if(reduceUnits && cl)
         cl = reduceUnitClass(cl);
      /*
      if(swapTemplateClass && cl.templateClass)
         cl = cl.templateClass;
      */
      return cl;
   }

   void aClass(BClass c, BVariant v, bool * created)
   {
      Class cl = c.cl;
      bool init;
      BOutput o = null;
      if(!c.skip && !c.skipTypeDef && cl.type != unionClass)
      {
         DeclarationInit declStruct = null;
         Class clReduce = getUnitClassReducedToBase(cl);
         if(v.kind == vclass)
         {
            o = c.outTypedef = bmod.getTypedefOutput((UIntPtr)c, &init);
            conassertctx(init, "(bgen?) getTypedefOutput did not init?");
            o.kind = vclass, o.c = c, o.type = otypedef;
         }
         else if(v.kind == vtemplaton)
         {
            // if(!strcmp(v.t.c.cl.name, "CMSSList<StylingRuleBlock>")) debugBreakpoint();
            o = v.t.outTypedef = bmod.getTypedefOutput((UIntPtr)v.t, &init);
            conassertctx(init, "(bgen?) getTypedefOutput did not init? -- templaton: ", v.t.cname);
            o.kind = vtemplaton, o.t = v.t, o.type = otypedef;
         }
         if(!clReduce && cl.type != enumClass)
         {
            if(!python || !pythonSkipHardcodedTypedefs.Find(cl.name))
            {
               o.output.Add(astDeclInit(c.cname, emptyTypedef, null, null, { c = c }, null, null/*, ast*/));
               {
                  ZString z { allocType = heap };
                  ec2PrintToZedString(z, o.output.lastIterator.data, false);
                  delete z;
               }
            }
         }
         if(c.isClass && !python)
         {
            o.output.Add(ASTRawString { string = CopyString("#ifdef __cplusplus") });
            o.output.Add(ASTRawString { string = PrintString("typedef void * ", typed_object_class_ptr, ";") });
            o.output.Add(ASTRawString { string = CopyString("#else") });
            o.output.Add(ASTRawString { string = PrintString("typedef C(Class) * ", typed_object_class_ptr, ";") });
            o.output.Add(ASTRawString { string = CopyString("#endif") });
         }
         if(cl.type == bitClass)
         {
            o = c.outBitTool = bmod.getBitToolOutput((UIntPtr)c, &init);
            conassertctx(init, "(bgen?) getBitToolOutput did not init?");
            o.kind = vclass, o.c = c, o.type = obittool;
            o.output.Add(astBitTool(cl, c));
         }
         else if(cl.type == enumClass)
         {
            o = c.outTypedef;
            o.output.Add(astEnum(cl, c));
         }
         if(c.declStruct) conmsg("check");
         if(c.hasPublicMembers/*hasOrBaseHasPublicMembers*/ ||
               ((cl.type == structClass || cl.type == noHeadClass) && !cl.templateClass))
         {
            SpecClass sc;
            ClassDefList defs;
            char * ident = allocMacroSymbolName(false, cl.type == normalClass ? CM : C, { c = c }, c.cname, null, 0);
            if(cl.type == enumClass) conmsg("check");
            if(cl.type == systemClass) conmsg("check");
            if(cl.type == unitClass) conmsg("check");
            o = c.outStruct = bmod.getStructOutput((UIntPtr)c, &init);
            conassertctx(init, "(bgen?) getStructOutput did not init?");
            o.kind = vclass, o.c = c, o.type = ostruct;
            declStruct = c.declStruct = astDeclInit(c.cname, createStruct, ident, null, { c = c }, null, null);
            o.output.Add(declStruct);

            sc = declStruct && declStruct.specifiers ? (SpecClass)declStruct.specifiers.firstIterator.data : null;
            defs = sc ? sc.definitions : null;
            addMembers(this, cl, cl, null, { }, c.isFromCurrentModule, defs, null);

            delete ident;
         }
      }
#ifdef _DEBUG
      else if(!c.skipTypeDef)
         conmsg("check");
#endif
      if(!cl.templateClass)
      {
         bool skip = /*c.skip || */c.isUnInt || c.isCharPtr || c.isUnichar || c.isBool;
         char * s;
         if(!skip)
         {
            const char * ext = !python ? "extern THIS_LIB_IMPORT " : "extern ";
            if(g_.lib.ecere && c.isWindow) skip = true;
            s = PrintString(skip ? "// " : "", ext, g_.sym.__class, " * ", c.coSymbol, ";");
            o = c.outClassPointer = bmod.getClassPointerOutput((UIntPtr)c, &init);
            conassertctx(init, "(bgen?) getClassPointerOutput did not init?");
            //o.kind = vclassptr; // todo, set proper kind and type
            o.output.Add(ASTRawString { string = s });
         }
      }
      // if(!strcmp(cl.name, "AttributeStore")) debugBreakpoint();
      if(!c.skip && !cl.templateClass/* && (!lib.ecereCOM || !c.is_class)*/)
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
            // if(!strcmp(cl.name, "AttributeStore") && !strcmp(md.name, "getMultiValues")) debugBreakpoint();
            // if(!strcmp(cl.name, "AttributeStore") && !strcmp(md.name, "retrieveMultiValues")) debugBreakpoint();
            if(brokenMethodsC.Find({ cl.name, md.name }))
               continue;
            conassertctx(m != null, "?");
            o = m.outInHeader = BOutput { vmethod, m = m, omethod };
            o.output.Add(astMethod(this, md, cl, c, methodFlag, instanceClass, &haveContent, v));
            c.outMethods.Add(o);
            c.nspace.addContent(v);
            processTypeDependency(this, md.dataType.returnType, omethod, v);
            if(lib.ecereCOM)
               v.processDependency(this, omethod, otypedef, clDepMethod);
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
               v.processDependency(this, omethod, otypedef, clDepMethod);
            }
         }
         while((cn = conv.next(publicOnly)))
         {
            BProperty p = cn;
            BVariant v = p;
            o = p.outInHeader = BOutput { vproperty, p = p, oconversion };
            o.output.Add(astProperty(cn, c, _import, false, &c.first, &haveContent));
            c.outConversions.Add(o);
            c.nspace.addContent(v);
            if(lib.ecereCOM)
               v.processDependency(this, oconversion, otypedef, clDepProperty);
         }
         while((pt = prop.next(publicOnly)))
         {
            BProperty p = pt;
            BVariant v = p;
            o = p.outInHeader = BOutput { vproperty, p = p, oproperty };
            o.output.Add(astProperty(pt, c, _import, false, &c.first, &haveContent));
            c.outProperties.Add(o);
            c.nspace.addContent(v);
            processTypeDependency(this, pt.dataType, oproperty, v);
            if(lib.ecereCOM)
               v.processDependency(this, oproperty, otypedef, clDepProperty);
         }
      }
      // if(c.cl.templateArgs)
      //    processTemplateArgs(this, c);
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

define typed_object_class_ptr = "typed_object_class_ptr";

Map<const String, const String> manualTypedefs { [
   { "constString", "const char *" },
   { "any_object", "const void *" },
   { typed_object_class_ptr, null },
   { null, null }
] };

Map<const String, const String> pythonManualTypedefs { [
   { "constString", "const char *" },
   { "any_object", "const void *" },
   /*{ "CommonControl", "Window" },
   { "DataBox", "CommonControl" },
   { "Surface", "Instance" },*/
   { null, null }
] };

AVLTree<const String> pythonSkipHardcodedTypedefs { [
   "Instance",
   "Surface",
   "Window",
   "CommonControl",
   "DataBox",
   "EditBox",
   "Size",
   null
] };

Map<String, Array<String>> dependencyDefines { };
AVLTree<String> enumValueNames { }; // through dependencies as well

enum MethodGenFlag { all, vTblID, virtualMethodCaller, virtualMethodImport, nonVirtualMethodImport };
enum EnumGenFlag { normal, prototype };

void cgenPrintVirtualMethodDefs(ZString z, BClass c, BMethod m, bool assumeTypedObject, bool forInstance, BVariant vTop)
{
   uint ap;
   //const char * thisClassName = null;
   Class cl = c.clAlt ? c.clAlt : c.cl;
   Method md = m.md;
   //char * classTypeName = cl && cl.type != systemClass && !md.dataType.staticMethod ? oldGetClassTypeName(cl.name) : null;
   char * thisTypeName = md.dataType.staticMethod ? null : md.dataType.thisClass ? oldGetClassTypeName(md.dataType.thisClass.string) : null;
   //bool prev = true;
   //if(md.dataType)
   //   thisClassName = md.dataType.staticMethod ? null : md.dataType.thisClass ? md.dataType.thisClass.className : cl.name;
   // todo: make into an inline function if possible and drop the #define method callers
   // usage comment...
   if(!python)
      z.concat("// ");
   zTypeName(z, null, { type = md.dataType.returnType, md = md, cl = cl/*, TYPE_INFO_FROM(ti)*/ }, { anonymous = true }, vTop);
   if(forInstance)
      z.concatx(" Instance_", m.mname, "(");
   else
      z.concatx(" ", m.s, "(");
   {
      Type param;
      TypeNameList params { };
      bool prevParam = false;
      {
         if(md.dataType.thisClass && md.dataType.thisClass.string)
         {
            Type t = ProcessTypeString(md.dataType.thisClass.string, false);
            if(c.is_class)
            {
               if(!md.dataType.staticMethod)
               {
                  // Note: this should really be checking typed_object right here
                  Type tt = ProcessTypeString("Class", false);
                  zTypeName(z, "__c", { type = tt, md = md, cl = cl }, { param = true }, vTop);
                  FreeType(tt);
                  prevParam = true;
               }
               if(prevParam) z.concatx(", ");
               z.concatx(forInstance ? g_.sym.instance : "any_object", " __i");
               prevParam = true;
            }
            else// if(!md.dataType.staticMethod)
            {
               Type t = ProcessTypeString(cl.name, false);
               if(prevParam) z.concatx(", ");
               //astTypeName("__i", { type = t, md = md, cl = cl }, { param = true }, vTop, params);
               zTypeName(z, "__i", { type = t, md = md, cl = cl }, { param = true }, vTop);
               FreeType(t);
               // This 2 different ways to mix stuff up... params & z!!
               //ec2PrintToZedString(z, params, false);
               prevParam = true;
               //params.Free();
            }

            if(!md.dataType.staticMethod && !c.is_class)
            {
               if(prevParam) z.concatx(", ");
               zTypeName(z, "__t", { type = t, md = md, cl = cl }, { param = true }, vTop);
               prevParam = true;
            }

            FreeType(t);
         }
         else if(!md.dataType.staticMethod)
         {
            Type t = ProcessTypeString(cl.name, false);
            //astTypeName("__i", { type = t, md = md, cl = cl }, { param = true }, vTop, params);
            zTypeName(z, "__i", { type = t, md = md, cl = cl }, { param = true }, vTop);
            prevParam = true;
            FreeType(t);
         }
         else
         {
            Type t = ProcessTypeString(cl.name, false);
            if(prevParam) z.concatx(", ");
            //astTypeName("__i", { type = t, md = md, cl = cl }, { param = true }, vTop, params);
            zTypeName(z, "__i", { type = t, md = md, cl = cl }, { param = true }, vTop);
            FreeType(t);
            // This 2 different ways to mix stuff up... params & z!!
            //ec2PrintToZedString(z, params, false);
            prevParam = true;
            //params.Free();
         }
      }
      if(md.dataType.params.count && (md.dataType.staticMethod ||
         !(md.dataType.params.count == 1 && (param = md.dataType.params.first) && !param.name && param.kind == voidType)))
      {
         if(prevParam) z.concatx(", ");
         ap = 0;
         for(param = md.dataType.params.first; param; param = param.next)
         {
            char * apname = null;
            if(!param.name)
               apname = PrintString("ap", ++ap);
            astTypeName(apname ? apname : param.name, { type = param, md = md, cl = cl }, { param = true }, vTop, params);
            delete apname;
         }
      }
      ec2PrintToZedString(z, params, false);
   }
   z.concatx(");", ln);

   if(!python)
   {

   if(forInstance)
      z.concatx(g_.preproLimiter, "#define Instance_", m.mname, "(");
   else
   {
      //prev = thisClassName || assumeTypedObject;
      z.concatx(g_.preproLimiter, "#define ", m.s, "(");
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
               astTypeName(apname ? apname : param.name, { type = param, md = md, cl = cl }, { notype = true, param = true, macroCommas = true }, vTop, params);
               delete apname;
            }
         }
         ec2PrintToZedString(z, params, false);
      }

   z.concatx(")");
   {
      z.concatx(g_.linejoinLimiter, "\n   ", c.cl.type == normalClass ? "" : "S", "VMETHOD(");
      if(c.is_class/* && !forInstance*/)
      {
         if(forInstance)
            z.concatx("__c, class, ", m.mname, ", __i, ");
         else
            z.concatx("__c, class, ", m.mname, ", (", g_.sym.instance, ")null, ");
      }
      else
      {
         if(cl.type == noHeadClass)
            z.concatx(c.coSymbol, ", ", c.cname, ", ", m.mname, ", (", g_.sym.instance, ")null, ");
         else
            z.concatx(c.coSymbol, ", ", c.cname, ", ", m.mname, ", __i, ");
      }
      zTypeName(z, null, { type = md.dataType.returnType, md = md, cl = cl/*, TYPE_INFO_FROM(ti)*/ }, { anonymous = true }, vTop);
      z.concatx(",", g_.linejoinLimiter, "\n      ");
      // function call parameters (for casting)
      {
         Type param;
         ARGPrintTypeNameList params { };
      bool prevParam = false;
      {
         if(md.dataType.thisClass && md.dataType.thisClass.string)
         {
            Type t = ProcessTypeString(md.dataType.thisClass.string, false);
            if(c.is_class)
            {
               if(!md.dataType.staticMethod)
               {
                  Type t = ProcessTypeString("Class", false);
                  // Note: this should really be checking typed_object right here
                  zTypeName(z, "__c", { type = t, md = md, cl = cl }, { anonymous = true, param = true }, vTop);
                  FreeType(t);
                  prevParam = true;
               }
               if(prevParam) z.concatx(" _ARG ");
               z.concatx(forInstance ? g_.sym.instance : "any_object"/*, " __i"*/);
               prevParam = true;
            }

            if(!md.dataType.staticMethod && !c.is_class)
            {
               if(prevParam) z.concatx(" _ARG ");
               zTypeName(z, "__t", { type = t, md = md, cl = cl }, { anonymous = true, param = true }, vTop);
               prevParam = true;
            }

            FreeType(t);
         }
         else if(!md.dataType.staticMethod)
         {
            Type t = ProcessTypeString(cl.name, false);
            astTypeName("__i", { type = t, md = md, cl = cl }, { anonymous = true, param = true }, vTop, params);
            FreeType(t);
         }
      }
      if(!(cl && !md.dataType.staticMethod) && md.dataType.params.count == 0 && md.dataType.staticMethod)
      {
         Type t { kind = voidType };
         astTypeName(null, { type = t }, { }, vTop, params);
         delete t;
      }
      else if(md.dataType.params.count && (md.dataType.staticMethod ||
         !(md.dataType.params.count == 1 && (param = md.dataType.params.first) && !param.name && param.kind == voidType)))
      {
         if(prevParam) z.concatx(" _ARG ");
         ap = 0;
         for(param = md.dataType.params.first; param; param = param.next)
         {
            astTypeName(null, { type = param, md = md, cl = cl }, { anonymous = true, param = true, macroCommas = true  }, vTop, params);
         }
      }
         ec2PrintToZedString(z, params, false);
      }
      z.concatx(",", g_.linejoinLimiter, "\n      ");
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
         ec2PrintToZedString(z, params, false);
      }
      z.concatx(")");
   }
   z.concatx(ln);
   } // !python
   //delete classTypeName;
   delete thisTypeName;
}

enum GenPropertyMode { _define, _import, assign };
ASTRawString astProperty(Property pt, BClass c, GenPropertyMode mode, bool conversion, bool * first, bool * haveContent)
{
   Class cl = c.cl;
   if(!cl.templateClass)
   {
      ASTRawString raw { };
      ZString z { allocType = heap };
      //BProperty p { };
      BProperty p = pt;
      //p.init(pt, cl, mode);
      conassertctx(pt._class == cl, "?");

      if(!pt.conversion || p.any)
      {
         if(mode == assign)
         {
            if(!*first) z.concatx(ln);
            else *first = false;
            z.concatx(indent, "   ", p.p, " = Class_findProperty(", p.c.coSymbol, ", \"", p.pt.name, "\", ", findin, ");", ln);
            if(p.any)      z.concatx(indent, "   if(", p.p, ")", ln);
            if(p.more)     z.concatx(indent, "   {", ln);
            if(pt.Set)     z.concatx(indent, "      ", p.fpnSet, " = (void *)", p.p, "->Set;", ln);
            if(pt.Get)     z.concatx(indent, "      ", p.fpnGet, " = (void *)", p.p, "->Get;", ln);
            if(pt.IsSet)   z.concatx(indent, "      ", p.fpnIst, " = (void *)", p.p, "->IsSet;", ln);
            if(p.more)     z.concatx(indent, "   }", ln);
         }
         else
         {
            bool imp = mode == _import;
            char * port = PrintString(imp ? "extern " : "", !python ? imp ? "THIS_LIB_IMPORT " : "LIB_EXPORT " : "");
            z.concatx(port, g_.sym._property, " * ", p.p, ";", ln);
            if(pt.Set)
            {
               if(pt.conversion && /*cl.type != normalClass && */cl.type != structClass && cl.type != noHeadClass)
                  z.concatx(port, p.cUse.cl.type == unitClass ? p.cUse.spec : p.cUse.cSymbol,  " (* ", p.fpnSet, ")(const ", p.ptTypeUse, p.v, " ", p.paramName, ");", ln);
               else
                  z.concatx(port, "void (* ", p.fpnSet, ")(const ", p.cUse.cSymbol, p.r, " ", p.otherParamName, ", ", *p.v ? "const " : "", p.t, p.v, " value);", ln);
            }
            if(pt.Get)
            {
               if(*p.v)
                  z.concatx(port, "void (* ", p.fpnGet, ")(const ", p.cUse.cSymbol, p.r, " ", p.otherParamName, ", ", p.t, p.v, " value);", ln);
               else
                  z.concatx(port, p.t,  " (* ", p.fpnGet, ")(const ", p.cUse.cl.type == unitClass ? p.cUse.spec : p.cUse.cSymbol, p.r, " ", p.otherParamName, ");", ln);
            }

            if(pt.IsSet)
               z.concatx(port, python ? "eC_bool" : "C(bool)", " (* ", p.fpnIst, ")(const ", p.cUse.cSymbol, p.r, " ", p.otherParamName, ");", ln);
            delete port;
            //z.concatx(ln);
         }
         if(haveContent) *haveContent = true;
      }
      if(mode == _import && c.cl.type == unitClass && p.cConv && p.cConv.cl.type == unitClass)
      {
         if(!python)
         {
            // TODO: Improve how all this is typically done... see DataValueType char * conversion property
            DataValueType type = cl.dataTypeString;

            genPropertyConversion(z, c, p, type, pt.Get);
            genPropertyConversion(z, c, p, type, pt.Set);

            if(!pt.Get && !pt.Set)
            {
               const char * dataType = tokenTypeString(cl.dataType);
               z.concatx(g_.preproLimiter, "#define ", c.name, "(x) ", c.upper, "(x)", ln);
               z.concatx(g_.preproLimiter, "#define ", c.upper, "(x)  ((", p.cConvUse.cSymbol, ")(x))", ln);
               z.concatx(g_.preproLimiter, "#define ", p.name, "_in_", c.name, "(x)  ((", dataType, ")(x))", ln);
               if(haveContent) *haveContent = true;
            }
         }
      }
      raw.string = CopyString(z._string);
      delete z;
      return raw;
   }
   return null;
}

void genPropertyConversion(ZString z, BClass c, BProperty p, DataValueType type, void * fn)
{
   if(fn)
   {
      double m = 1, b = 0;
      bool forSet = fn == p.pt.Set;
      if(!forSet)
         z.concatx(g_.preproLimiter, "#define ", c.name, "(x) ", c.upper, "(x)", ln);
      z.concatx(g_.preproLimiter, "#define ", forSet ? p.cConvUse.name : "", forSet ? "_in_" : "", forSet ? c.name : c.upper, "(x)  ");
      if(checkLinearMapping(type, fn, &m, &b))
      {
         const char * castString = forSet ? tokenTypeString(c.cl.dataType) : p.cConvUse.cSymbol;
         z.concatx("((", castString, ")((x)");
         if(m != 1)
         {
            if(type == doubleType || type == floatType)
               z.concatx(" * ", m);
            else if(m > 1 || m == 0)
               z.concatx(" * ", (int)(m + 0.5));
            else
               z.concatx(" / ", (int)(1.0/m + 0.5));
            if(type == floatType) z.concatx("f");
         }
         if(b)
         {
            if(type == doubleType || type == floatType)
               z.concatx(" + ", b);
            else
               z.concatx(" + ", (int)(b + 0.5));
            if(type == floatType) z.concatx("f");
         }
         z.concatx("))", ln);
      }
      else
         z.concatx(forSet ? p.fpnSet : p.fpnGet, "(x)", ln);
   }
}

define cw = 32; //16; //84; // column width

ClassDefDeclaration astClassDefDecl(const char * ident, TypeInfo ti, BVariant vTop)
{
   return ClassDefDeclaration { decl = astDeclInit(null, createField, ident, null, ti, null, vTop/*, null*/) };
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
   if(!mode._get) conmsg("check");
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
   if(mode._get) conmsg("check");
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
            if(s) conmsg("check");
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
               if(t2.params.count == 0)
               {
                  Type voidT { kind = voidType };
                  astTypeName(null, { type = voidT }, { }, vTop, list);
                  delete voidT;
               }
               else
               {
                  for(param = t2.params.first; param; param = param.next)
                     astTypeName(param.name, { type = param }, { param = true }, vTop, list);
               }
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
               char * cSymbol = g_.allocMacroSymbolName(false, C, { c = c }, c.spec, null, 0);
               typedefDI.specifiers = { [
                  SpecBase { specifier = _typedef },
                  SpecClass { type = _struct, id = ASTIdentifier { string = cSymbol } }
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
                  char * cSymbol = g_.allocMacroSymbolName(c.noSpecMacro, C, { c = c }, c.spec, null, 0);
                  typedefDI.specifiers = { [
                     SpecBase { specifier = _typedef },
                     SpecClass { id = ASTIdentifier { string = cSymbol } }
                  ] };
               }
            }

            typedefDI.declarators = { [
               ASTInitDeclarator { declarator = DeclIdentifier {
                     identifier = ASTIdentifier {
                           string = CopyString(c.cSymbol) } } }
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
            else conmsg("check");
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
                  baseName = g_.allocMacroSymbolName(false, T, { cl = t.c.cl.templateClass }, t.c.cl.templateClass.name, null, 0);
               else
               {
                  BClass c = t.c.cl.templateClass;
                  baseName = CopyString(c.cSymbol);
               }
               if(!baseName) conmsg("check");
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

const char * nonTokenUnsignedTypeName(Type from, OptBits opt)
{
   switch(from.kind)
   {
      case charType:    return opt.cpp ? "unsigned char" : "byte";
      case shortType:   return "uint16";
      case int64Type:   return "uint64";
      case int128Type:  return "uint128";
   }
   return null;
}

const char * nonTokenTypeName(Type from)
{
   switch(from.kind)
   {
      case charType:    return from.isSigned ? "char" : "byte";
      case shortType:   return from.isSigned ? "int16" : "uint16";
      case intType:     return from.isSigned ? null : "uint";
      case int64Type:   return from.isSigned ? "int64" : "uint64";
      case int128Type:  return from.isSigned ? "int128" : "uint128";
   }
   return null;
}

TokenType2 tokenType(Type from)
{
   switch(from.kind)
   {
      case voidType:    return _void;
      case charType:    return _char;
      case shortType:   return _short; // from.isSigned ? _short : _int16
      case intType:     return from.isSigned ? _int : _uint;
      case int64Type:   return _int64; // from.isSigned ? _int64 : _uint64
      case longType:    return _long;
      case floatType:   return _float;
      case doubleType:  return _double;
      case int128Type:  return _int128; // from.isSigned ? _int128 : _uint128
   }
   return none;
}

// uint vs uint32 an issue? they are both typedef'ed to uint32_t
const char * tmp32_tokenTypeString(Type from)
{
   const char * str = tokenTypeString(from);
   if(!strcmp(str, "uint"))
      return "uint32";
   return str;
}

const char * tokenTypeString(Type from)
{
   switch(from.kind)
   {
      case voidType:    return "void";
      case charType:    return "char";
      case shortType:   return from.isSigned ? "short" : "uint16";
      case intType:     return from.isSigned ? "int" : "uint";
      case int64Type:   return from.isSigned ? "int64" : "uint64";
      case longType:    return "long";
      case floatType:   return "float";
      case doubleType:  return "double";
      case int128Type:  return "int128"; // from.isSigned ? "int128" : "uint128"
      case classType:   return from._class.string; // uint16, and others?
   }
   return null;
}

static inline bool bareSymbolName(Class cl, OptBits opt)
{
   if(opt.cpp)
   {
      switch(cl.type)
      {
         case bitClass:
         case enumClass:
         case normalClass:
         case noHeadClass:
         case structClass:
         case unitClass:
            return true;
      }
      return false;
   }
   if(python)
      return false;
   return opt.bare;
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

   if(t.kind == subClassType && opt.cpp)
      _class = eSystem_FindClass(g_.mod, "Class");
   else if(t.kind == classType || t.kind == subClassType)
   {
      _class = g_.getClassFromType(t, /*true*/!opt.cpp);
      if(_class)
      {
         BClass c = _class;
         if(opt.cpp && c.cl.templateArgs && !c.isClassTemplatable/*c.completeTemplate*/)
            ; // PrintLn(c.cpp.dataTypeString);
         else if(_class.templateClass)
            _class = _class.templateClass;
      }
   }
   if(_class)
      c = _class;
   isBaseClass = /*!t._class || !t._class.string || */c && c.is_class/*_class && !strcmp(_class.name, "class")*/;

   if(t.kind == classType && _class &&
         ((_class.type == noHeadClass && !opt.cpp) || (_class.type == structClass && opt.param) ||
         (isBaseClass && t.classObjectType != anyObject)))
   {
      if(!ptr) // tocheck
         ptr = 1;
   }

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
         if(_class && opt.cpp)
            name = CopyString(c.cpp.dataTypeString ? c.cpp.dataTypeString : c.cpp.name);
         else
            name = _class ? getClassTypeName(_class) : oldGetClassTypeName(t._class.string);
         if(!strcmp(name, "unichar") || !strcmp(name, "any_object")) // hack
            nativeSpec = true;
         if(!strcmp(name, "class"))
         {
            delete name;
            name = CopyString("any_object");
            nativeSpec = true;
            if(ptr)
               ptr--;
         }
      }
   }
   if(indirection) *indirection = ptr;

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
         quals.Add(SpecName { name = CopyString(!python ? "va_list" : "...") });
         break;
      case voidType: case intType: case longType: case floatType: case doubleType:
      {
         const char * typeName = vTop && t.kind ? nonTokenTypeName(t) : null;
         Class clDep = typeName ? eSystem_FindClass(g_.mod, typeName) : null;
         BOutputType vTopOutputType = clDep ? BOutputType::getFromVariantKind(vTop.kind) : nil;
         quals.Add(SpecBase { specifier = tokenType(t) });
         if(!opt.cpp && vTopOutputType)
            vTop.processDependency(g_, vTopOutputType, otypedef, clDep);
         break;
      }
      case charType: case shortType: case int64Type: case int128Type:
      {
         const char * typeName = nonTokenTypeName(t);
         BOutputType vTopOutputType = vTop ? BOutputType::getFromVariantKind(vTop.kind) : nil;
         Class clDep = vTop ? eSystem_FindClass(g_.mod, typeName) : null;
         if(t.isSigned)
            quals.Add(SpecBase { specifier = tokenType(t) });
         else
         {
            quals.Add(SpecName { name = CopyString(nonTokenUnsignedTypeName(t, opt)) });
         }
         if(!opt.cpp && clDep && vTopOutputType)
            vTop.processDependency(g_, vTopOutputType, otypedef, clDep);
         break;
      }
      case intPtrType:
      case intSizeType:
      {
         const char * typeName = t.kind == intPtrType ? (t.isSigned ? "intptr" : "uintptr") : (t.isSigned ? "intsize" : "uintsize");
         BOutputType vTopOutputType = vTop ? BOutputType::getFromVariantKind(vTop.kind) : nil;
         Class clDep = vTop ? eSystem_FindClass(g_.mod, typeName) : null;
         quals.Add(SpecName { name = CopyString(typeName) });
         if(!opt.cpp && vTopOutputType)
            vTop.processDependency(g_, vTopOutputType, otypedef, clDep);
         break;
      }
      case structType:
         quals.Add(SpecClass { type = _struct, id = ASTIdentifier { string = CopyString(t.enumName) } });
         break;
      case classType:
      {
         BOutputType vTopOutputType = vTop ? BOutputType::getFromVariantKind(vTop.kind) : nil;//vTop.kind;
         if(_class && _class.type == systemClass)
         {
            if(isBaseClass)
            {
               char * cSymbol = bareSymbolName(_class, opt) ? CopyString(name) : g_.allocMacroSymbolName(nativeSpec, C, { cl = _class }, name, null, 0);
               quals.Add(SpecName { name = cSymbol });
               if(!opt.cpp && vTopOutputType)
                  vTop.processDependency(g_, vTopOutputType, otypedef, _class);

            }
            else
            {
               if(t.constant)
                  quals.Add(SpecBase { specifier = _const });
               quals.Add(SpecName { name = CopyString(name) });
            }
         }
         else
         {
            char * cSymbol;
            if((opt.cpp && _class && _class.type == unitClass && !c.isUnichar && bareSymbolName(_class, opt)) ||
                  (!_class && t.kind == classType && t._class && !t._class.registered))
               cSymbol = CopyString(name);
            else
               cSymbol = bareSymbolName(_class, opt) ? CopyString(name) : g_.allocMacroSymbolName(nativeSpec, C, { }, name, null, 0);
            if((ti.type.constant || (ti.type.kind == pointerType && ti.type.type.constant)) && strcmp(cSymbol, "constString"))
               quals.Add(SpecBase { specifier = _const });
            quals.Add(SpecName { name = cSymbol });
            if(!opt.cpp && vTopOutputType && !(vTopOutputType == otypedef && vTop.kind == vclass) && (_class || t._class.registered))
               vTop.processDependency(g_, vTopOutputType, otypedef, _class ? _class : t._class.registered);
         }
         break;
      }
      case thisClassType:
      {
         char * cSymbol = bareSymbolName(_class, opt) ? CopyString(name) :
               g_.allocMacroSymbolName(false, THISCLASS, { cl = ti.cl }, ti.cl ? ti.cl.name : "Instance", null, ti.cl && ti.cl.type == noHeadClass ? 1 : 0);
         quals.Add(SpecName { name = cSymbol });
         break;
      }
      case subClassType:
      {
         char * cSymbol = bareSymbolName(_class, opt) ? CopyString(name) :
               g_.allocMacroSymbolName(false, SUBCLASS, { cl = _class }, name, null, 0);
         quals.Add(SpecName { name = cSymbol });
         break;
      }
      case templateType:
         if(t.templateParameter)
         {
            TemplateParameter tp = t.templateParameter;
            Class cl = null;
            ClassTemplateParameter ctp = findClassTemplateParameter(tp.identifier.string, ti.cl, &cl);
            if(cl && tp.type == type && tp.identifier && tp.identifier.string)
            {
               BTemplaton t = g_.bmod.addTempleton(ctp, cl.templateClass ? cl.templateClass : cl);
               quals.Add(SpecName { name = CopyString(t.cname) });
               if(!opt.cpp && vTop && vTop.kind == vclass)
                  vTop.processDependency(g_, ostruct, otypedef, t);
            }
            else conmsg("check");
         }
         else conmsg("check");
         break;
      case arrayType: case functionType:
         break;
      case pointerType:
      case unionType: case enumType: case methodType: case dummyType:
      case _BoolType:
      default:
         conmsg("check");
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
   ZString z { allocType = heap };
   TypeNameList list { };
   astTypeName(ident, ti, opt, vTop, list);
   ec2PrintToZedString(z, list, false);
   str = CopyString(z._string);
   delete list;
   delete z;
   return str;
}

void zTypeName(ZString z, const char * ident, TypeInfo ti, OptBits opt, BVariant vTop)
{
   TypeNameList list { };
   astTypeName(ident, ti, opt, vTop, list);
   ec2PrintToZedString(z, list, false);
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
         /*
         if(ti.type.constant)
            quals.Add(SpecBase { specifier = _const });
         */
         quals.Add(SpecName { name = PrintString(/*"const ", */python ? "eC_Class *" : typed_object_class_ptr) });
         if(!opt.cpp)
         {
            Class clDep = vTop ? eSystem_FindClass(g_.mod, "Class") : null;
            BOutputType vTopOutputType = clDep ? BOutputType::getFromVariantKind(vTop.kind) : nil;
            if(vTopOutputType)
               vTop.processDependency(g_, vTopOutputType, otypedef, clDep);
         }
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
         quals = astTypeSpec(ti, &ptr, &t, null, { param = opt.param, bare = opt.bare, cpp = opt.cpp }, vTop);
      else
         // trying this instead of //astTypeSpec(ti, &ptr, &t, null, { param = opt.param }, vTop);
         t = unwrapPointerType(ti.type, &ptr);
      if(t.kind == arrayType)
      {
         if(ptr) conmsg("check");
         if(quals) conmsg("check");
         decl = astDeclArray(decl, null, false, &ti.type);
         // FIXME: This is not always true in C++ bindings generation?
         ; // conassertctx(ti.type == t.arrayType, "?");
         quals = astTypeSpec(ti, &ptr, &t, null, { bare = opt.bare, cpp = opt.cpp }, vTop);
      }
      else if(t.kind == functionType)
      {
         Type t2 = null;
         TypeNameList list = opt.macroCommas ? ARGPrintTypeNameList { } : TypeNameList { };
         int ptr2 = 0;
         //if(ptr) conmsg("check");
         if(quals) conmsg("check");
         if(ti.type.kind != pointerType) // a function pointer arg apparently has no ptr wrapping? this is when void method(void This::x(args)); or void method(void x(args)); syntax is used
            ptr = 1;
         ti.type = t.returnType;
         if(!opt.notype)
         {
            quals = astTypeSpec(ti, &ptr2, &t2, null, { bare = opt.bare, cpp = opt.cpp }, vTop);
            if(opt.macroCommas)
               decl = InMacroDeclFunction { declarator = InMacroDeclBrackets { declarator = astDeclPointer(ptr, decl) }, parameters = list };
            else
               decl = DeclFunction { declarator = DeclBrackets { declarator = astDeclPointer(ptr, decl) }, parameters = list };
            ptr = 0;
            if(!t.staticMethod && t.thisClass && t.thisClass.registered)
            {
               Type t2 = ProcessTypeString(t.thisClass.registered, false);
               if(t.thisClass.registered.type == systemClass) conmsg("check");
               astTypeName("__this", { type = t2/*, TYPE_INFO_FROM(ti)*/ }, opt, vTop, list);
               FreeType(t2);
            }
            for(param = t.params.first; param; param = param.next)
               astTypeName(param.name, { type = param }, opt, vTop, list);
         }
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
         {
            char * constant = null;
            char * exp = Expression2String(t.arraySizeExp);
            Expression e = ParseExpressionString(exp);
            SetInBGen(true);
            SetInCompiler(true);
            SetParsingType(true);
            ProcessExpressionType(e);
            //ProcessExpressionInstPass(e);
            if(python)
               ComputeExpression(e);
            SetInCompiler(false);
            SetParsingType(false);
            constant = Expression2String(e);
            SetInBGen(false);
            d.exp = ExpConstant { constant = constant };
            delete exp;
            FreeExpression(e);
         }
      }
      *type = type->arrayType;
      decl = d;
   }
   if(decl != declarator) result = (DeclArray)decl;
   return result;
}

#if 0
bool astFuncHasTypedObjectParam(TypeInfo ti)
{
   int ptr2 = 0;
   Type t = null;
   SpecsList s = null;
   s = astTypeSpec(ti, &ptr2, &t, null, { }, null);
   if(s); // get rid of warning
   if(t && t.kind == functionType && t.params.count)
   {
      Type param;
      for(param = t.params.first; param; param = param.next)
      {
         SpecialType st = specialType(param);
         if(st == typedObject)
            return true;
      }
   }
   return false;
}
#endif

DeclarationInit astFunction(const char * ident, TypeInfo ti, OptBits opt, BVariant vTop)
{
   Type t = null;
   Type param;
   SpecsList specs { };
   //InitDeclList decls { };
   TypeNameList params = opt.macroCommas ? ARGPrintTypeNameList { } : TypeNameList { };
   DeclFunction declFunction { parameters = params };
   ASTInitDeclarator initDecl { };
   DeclarationInit declInit { specifiers = specs, declarators = { [ initDecl ] } };
   DeclIdentifier declIdent = opt.anonymous ? null : astDeclIdentifier(ident);
   SpecsList s = null;
   int ptr2 = 0;
   if(opt._extern)
      specs.Add(SpecBase { specifier = _extern });
   if(!opt.anonymous && !python)
   {
      if(opt._dllimport)
         specs.Add(SpecName { name = CopyString("LIB_IMPORT") });
      else
         specs.Add(SpecName { name = CopyString(opt._extern ? "THIS_LIB_IMPORT" : "LIB_EXPORT") });
   }

   s = astTypeSpec(ti, &ptr2, &t, null, opt, vTop);
   if(s); // get rid of warning
   if(t)
   {
      Type t3 = null;
      int ptr3 = 0;
      if(t.kind == functionType)
      {
         OptBits opt2 = opt;
         opt2.param = true;
         ti.type = t.returnType;
         astTypeSpec(ti, &ptr3, &t3, specs, opt, vTop);
         initDecl.declarator = ptr3 ? astDeclPointer(ptr3, declFunction) : declFunction;
         if(opt.pointer)
         {
            if(ptr2) conmsg("check");
            ptr2 = 1;
         }
         declFunction.declarator = ptr2 ? DeclBrackets { declarator = astDeclPointer(ptr2, declIdent) } : declIdent;
         if(ti.md && ti.cl && !ti.md.dataType.staticMethod)
         {
            Type t = ProcessTypeString(ti.cl.name, false);
            //Type t = ProcessTypeString(md.dataType.thisClass.string, false);
            if(ti.cl.type == systemClass) conmsg("check");
            astTypeName("__this", { type = t, TYPE_INFO_FROM(ti) }, opt2, vTop, params);
            FreeType(t);
         }
         if(ti.md && !(ti.cl && !ti.md.dataType.staticMethod) && ti.md.dataType.params.count == 0)
         {
            Type voidT { kind = voidType };
            astTypeName(null, { type = voidT }, { }, vTop, params);
            delete voidT;
         }
         else
         {
            if(!(ti.md && ti.cl && !ti.md.dataType.staticMethod) ||
               !(ti.md.dataType.params.count == 1 && (param = ti.md.dataType.params.first) && !param.name && param.kind == voidType))
            for(param = t.params.first; param; param = param.next)
               astTypeName(param.name, { type = param, TYPE_INFO_FROM(ti) }, opt2, vTop, params);
         }
      }
   }
   else conmsg("check");
   return declInit;
}

ASTRawString astNullDefine()
{
   ASTRawString raw { };
   ZString z { allocType = heap };
   z.concatx("#if defined(__cplusplus)", ln);
   z.concatx("#define null 0", ln);
   z.concatx("#else", ln);
   z.concatx("#define null ((void *)0)", ln);
   z.concatx("#endif", ln);
   raw.string = CopyString(z._string);
   delete z;
   return raw;
}

String Expression2String(Expression e)
{
   TempFile f { };
   String v;
   uintsize size;

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
   ZString z { allocType = heap };
   for(s = str; *s; s++)
   {
      if(*s == 'C' && *(s + 1) == '(')
      {
         char * t = s + 2;
         while(*t && *t != ')') t++;
         if(*t == ')')
         {
            *s = *t = 0;
            z.concat(start);
            start = t + 1;
            {
               Class cl = eSystem_FindClass(app.gen.mod, s + 2);
               if(cl)
               {
                  Class clReduced = reduceUnitClass(cl);
                  BClass cReduced = clReduced;
                  z.concat(cReduced.cSymbol);
               }
               else
                  z.concat(s + 2);
            }
            s = t;
         }
      }
   }
   z.concat(start);
   result = CopyString(z._string);
   delete z;
   return result;
}

bool isOkForPyCFFI(TypeKind kind)
{
   //kind == enumType?
   //kind == intPtrType || kind == intSizeType
   return kind == charType || kind == intType || kind == longType/* || kind == int64Type || kind == int128Type*/;
}

ASTRawString astDefine(DefinedExpression df, BDefine d, Expression e, BVariant v)
{
   ASTRawString raw { };
   ZString z { allocType = heap };
   char * s;
   char * val;
   bool simple;

   SetInDocumentor(false);
   SetInBGen(true);
   SetInCompiler(true);
   SetParsingType(true);
   if(python) SetInBGen(false);
   ProcessExpressionType(e);
   ProcessExpressionInstPass(e);
   if(python) SetInBGen(true);
   if(python)
      ComputeExpression(e);
   SetInCompiler(false);
   SetParsingType(false);
   val = Expression2String(e);
   SetInBGen(false);
   SetInDocumentor(true);

   simple = python && e.type == constantExp && isOkForPyCFFI(e.expType.kind);
   for(s = val; *s; s++) if(*s == '\n') *s = ' ';

   if(!python)
      z.concatx(g_.preproLimiter, "#define ", d.name, !strcmp(d.name, "MAXFLOAT") ? "_CLASH" : "", " (", val, ")", ln); // hack / tofix
   else if(simple)
      z.concatx(g_.preproLimiter, "#define ", d.name, " ", simple ? val : "...", ln);
   else
   {
      if(!strcmp(d.name, "fstrcmp")) // hack // tweaked "inBGen" libec will not give proper e.expType
         z.concatx("int ", d.name, "(const char *, const char *);", ln);
      else if(!strcmp(d.name, "strnicmp"))
      {
         z.concatx("int strnicmp(const char *, const char *, uintsize n);", ln);
         {
            Class clDep = eSystem_FindClass(g_.mod, "uintsize");
            conassertctx(clDep != null, "(bgen?) eSystem_FindClass(g_.mod, \"uintsize\") is returning null?");
            if(clDep)
               v.processDependency(g_, oother, otypedef, clDep);
         }
      }
      else if(!strcmp(d.name, "strcmpi"))
         z.concatx("int strcmpi(const char *, const char *);", ln);
      else if(!strcmp(d.name, "strnicmp"))
      {
         z.concatx("int strnicmp(const char *, const char *, uintsize n);", ln);
         {
            Class clDep = eSystem_FindClass(g_.mod, "uintsize");
            conassertctx(clDep != null, "(bgen?) eSystem_FindClass(g_mod, \"uintsize\") is returning null?");
            if(clDep)
               v.processDependency(g_, oother, otypedef, clDep);
         }
      }
      else if(e.expType && (e.type == constantExp || e.type == bracketsExp || e.type == conditionExp ||
            e.type == extensionCompoundExp || e.type == stringExp || e.type == opExp ||
            e.type == instanceExp || e.type == identifierExp || e.type == stringExp))
      {
         bool constant = e.expType.constant;
         char * type;
         Type t = unwrapPointerType(e.expType, null);
         char * depType = printType(t, true, false, true);
         char * depType2 = python && strstr(depType, "eC_") == depType ? depType + 3 : depType;
         Class clDep = eSystem_FindClass(g_.mod, depType2);
         if(e.expType.kind == pointerType)
            e.expType.constant = true;
         type = printType(e.expType, true, false, true);
         /*if(e.expType.kind == functionType)
         {
            char * s, *d;
            for(s = d = &type[0]; *s; s++) if(*s != ':') *d++ = *s;
            if(d != s) *d = 0;
            z.concatx(type, ";", ln);
         }
         else*/
         {
            z.concatx("static ", e.expType.constant ? "" : "const ", type, " ", d.name, ";", ln);
            conassertctx(clDep != null, "(bgen?) eSystem_FindClass(g_.mod, \"", depType2, "\") is returning null?");
            if(clDep)
               v.processDependency(g_, oother, otypedef, clDep);
         }
         if(e.expType.kind == pointerType)
            e.expType.constant = constant;
         delete type;
         delete depType;
      }
   }
   delete val;
   raw.string = CopyString(z._string);
   delete z;
   return raw;
}

ASTRawString astEnum(Class cl, BClass c)
{
   ASTRawString raw { };
   ZString z { allocType = heap };
   EnumClassData enumeration = (EnumClassData)cl.data;
   bool noValues = enumeration.values.count == 0;
   NamedLink item;
   if(c.isBool)
   {
      ASTNode node = astDeclInit(c.cname, emptyTypedef, null, null, { c = c }, null, null/*, ast*/);
      ec2PrintToZedString(z, node, true);
      if(!python)
      {
         z.concatx(g_.preproLimiter, "#if !defined(__bool_true_false_are_defined) && !defined(__cplusplus)", ln);
         z.concat("enum boolean {");
      }
   }
   else
   {
      bool enumMacroWay = false;//true; // todo add option to program args
      if(enumMacroWay)
         z.concatx("ENUM(", cl.name, ", uint32)", " {"); // todo, get the type right
      else
      {
         const char * dataType = tokenTypeString(cl.dataType);
         if(!python)
         {
            z.concatx(g_.preproLimiter, "#if CPP11", ln);
            z.concatx("enum C(", cl.name, ") : ", dataType, noValues ? ";" : "", ln);
            z.concatx(g_.preproLimiter, "#else", ln);
         }
         {
            ASTNode node = astDeclInit(c.cname, emptyTypedef, null, null, { c = c }, null, null/*, ast*/);
            ec2PrintToZedString(z, node, true);
         }
         if(!python)
            z.concatx("enum C(", cl.name, ")", noValues ? ";" : "", ln);
         else if(!noValues)
            z.concatx("enum", ln);
         if(!python)
            z.concatx(g_.preproLimiter, "#endif", ln);
         if(!noValues)
            z.concat("{");
      }
   }
   if(!python || !c.isBool)
   {
      for(item = enumeration.values.first; item; item = item.next)
      {
         char b[1024];
         b[0] = 0;
         if((int64)(intptr)item.data >= 0)
            PrintBuf(b, sizeof(b) - 1, item.data);
         else
            PrintBuf(b, sizeof(b) - 1, (int64)(intptr)item.data);
         if(!b[0])
            strcpy(b, "0x0");
         if(c.isBool)
            z.concatx(item == enumeration.values.first ? "\n" : ",\n", "   ", item.name, " = ", b);
         else
            z.concatx(item == enumeration.values.first ? "\n" : ",\n", "   ", cl.name, "_", item.name, " = ", b);
      }
      if(!noValues)
         z.concatx(ln, "};", ln);
      else if(!python)
         z.concatx(ln, ln);
   }
   if(c.isBool)
   {
      if(!python)
      {
         z.concatx(g_.preproLimiter, "#endif", ln);
         z.concatx(g_.preproLimiter, "#define eC_true   ((C(bool))1)", ln);
         z.concatx(g_.preproLimiter, "#define eC_false  ((C(bool))0)", ln);
      }
      else
      {
         z.concatx(g_.preproLimiter, "#define false 0", ln);
         z.concatx(g_.preproLimiter, "#define true 1", ln);
      }
   }
   raw.string = CopyString(z._string);
   delete z;
   return raw;
}

ASTRawString astBitTool(Class cl, BClass c)
{
   ASTRawString raw { };
   ZString z { allocType = heap };
   Array<const String> bitMembers = null;
   bool haveContent = false;
   DataMember dm; IterDataMember dat { cl };
   if(!python && cl.members.count <= 5) bitMembers = { };
   while((dm = dat.next(all)))
   {
      BitMember bm = (BitMember)dm;
      if(!dm.dataType)
         dm.dataType = resolveDataTypeStringInTemplatesContext(cl, dm.dataTypeString, false);
      if(bm.type == normalMember)
      {
         String n_ = PrintString(c.upper, "_", bm.name, "_");
         String n = CopyString(n_);
         String s = PrintString(c.upper, "_SET_", bm.name);
         String x;
         if(bitMembers) bitMembers.Add(bm.name);
         n[strlen(n)-1] = 0;
         x = PrintHexUInt64(bm.mask);
         if(!(x && x[0])) conmsg("check");
         z.concatx(g_.preproLimiter, "#define ", n_, "SHIFT", spaces(48, strlen(n_) + 5), " ",
               dm.dataType.bitFieldCount ? dm.dataType.offset : bm.pos, ln);
         z.concatx(g_.preproLimiter, "#define ", n_, "MASK", spaces(48, strlen(n_) + 4), " ", x, ln);
         if(!python)
         {
            z.concatx(g_.preproLimiter, "#define ", n, "(x)", spaces(48, strlen(n) + 3),
                  " ((((", c.cSymbol, ")(x)) & ", n_, "MASK) >> ", n_, "SHIFT)", ln);
            z.concatx(g_.preproLimiter, "#define ", s, "(x, ", bm.name, ")", spaces(48, strlen(s) + 6),
                  " (x) = ((", c.cSymbol, ")(x) & ~((", c.cSymbol, ")", n_,
                  "MASK)) | (((", c.cSymbol, ")(", bm.name, ")) << ", n_, "SHIFT)", ln);
         }
         haveContent = true;
         delete x;
         delete n_;
         delete n;
         delete s;
      }
   }
   if(bitMembers)
   {
      int i, charCount = strlen(c.upper) + 2;
      z.concatx(g_.preproLimiter, "#define ", c.upper, "(");
      for(i = 0; i < bitMembers.count; i++)
      {
         const char * name = bitMembers[i];
         charCount += strlen(name) + i ? 2 : 0;
         if(i) z.concatx(", ");
         z.concatx(name);
      }
      z.concatx(")", spaces(48, charCount));
      for(i = 0; i < bitMembers.count; i++)
         z.concatx("(");
      for(i = 0; i < bitMembers.count; i++)
      {
         const char * name = bitMembers[i];
         if(i) z.concatx(" | ");
         z.concatx("((", c.cSymbol, ")(", name, ")) << ", c.upper, "_", name, "_SHIFT)");
      }
      z.concatx(ln);
      delete bitMembers;
   }
   if(haveContent) z.concatx(ln);
   raw.string = CopyString(z._string);
   delete z;
   return raw;
}

ASTRawString astMethod(CGen g, Method md, Class cl, BClass c, MethodGenFlag methodFlag,
      bool instanceClass, bool * haveContent, BVariant vTop)
{
   ASTRawString raw { };
   ZString z { allocType = heap };
   BMethod m = md;
   m.init(md, c, g);
   if(md.type == virtualMethod)
   {
      *haveContent = true;
      if(!methodFlag || methodFlag == vTblID)
         z.concatx("extern ", !python ? "THIS_LIB_IMPORT " : "", "int ", m.v, ";", ln);
      if(!methodFlag || methodFlag == virtualMethodCaller)
         cgenPrintVirtualMethodDefs(z, c, m, c.is_class/*assumeTypedObject*/, instanceClass, vTop);
      if(!methodFlag || methodFlag == virtualMethodImport)
      {
         if(!c.is_class || !instanceClass)
            z.concatx("extern ", !python ? "THIS_LIB_IMPORT " : "", g_.sym.method, " * ", m.m, ";", ln);
      }
   }
   else if(md.type == normalMethod)
   {
      if(!methodFlag || methodFlag == nonVirtualMethodImport)
      {
         // skipping Module::Load and Module::Unload here because we want to use the dllexported methods directly
         if(!g.lib.ecereCOM || !(c.isModule && (!strcmp(md.name, "Load") || !strcmp(md.name, "Unload"))))
         {
            if(md.dataType.kind != functionType)
               PrintLn(m.n, " ", md.dataType.kind, " ", md.dataTypeString);
            {
            ASTNode node = astFunction(m.n, { type = md.dataType, md = md, cl = cl }, { _extern = true, pointer = true }, vTop);
            ec2PrintToZedString(z, node, true);
            *haveContent = true;
            }
         }
      }
   }
   else conmsg("check");
   raw.string = CopyString(z._string);
   delete z;
   return raw;
}

static void addMembers(CGen g, Class cl, Class topClass, DataMember topMember, OptBits opt, bool local, ClassDefList defs, uint * retSize)
{
   // see AddMembers in pass15.ec which is commented in need of a major review when implementing private members etc
   uint totalSize = 0;
   uint maxSize = 0;
   int alignment;
   uint size;
   DataMember dm;
   Context context = topMember ? null : SetupTemplatesContext(cl);

   if(!topMember && cl.base)
   {
      maxSize = cl.structSize;
      if(cl.type == structClass || cl.type == noHeadClass)
         addMembers(g, cl.base, topClass, null, opt, local, defs, &totalSize);
      else
      {
         uint baseSize = cl.base.templateClass ? cl.base.templateClass.structSize : cl.base.structSize;
         if(maxSize > baseSize)
            maxSize -= baseSize;
         else
            maxSize = 0;
      }
   }

   for(dm = topMember ? topMember.members.first : cl.membersAndProperties.first; dm; dm = dm.next)
   {
      if(!dm.isProperty)
      {
         switch(dm.type)
         {
            case normalMember:
            {
               if(cl.type == bitClass || topClass.type == bitClass)
                  conmsg("check");
               if(!(dm.memberAccess == publicAccess || dm.memberAccess == privateAccess))
                  conmsg("check");
               if(dm.dataTypeString)
               {
                  ASTClassDef def = null;
                  if(!dm.dataType)
                     dm.dataType = ProcessTypeString(dm.dataTypeString, false);
                  if(local)
                     processTypeDependency(g, dm.dataType, ostruct, topClass);

                  def = astClassDefDecl(dm.name, { type = dm.dataType, dm = dm, cl = cl }, topClass);
                  if(!def) conmsg("check");
                  if(def)
                     defs.Add(def);

                  ComputeTypeSize(dm.dataType);
                  size = dm.dataType.size;
                  alignment = dm.dataType.alignment;

                  if(alignment)
                  {
                     if(totalSize % alignment)
                        totalSize += alignment - (totalSize % alignment);
                  }
                  totalSize += size;
               }
               break;
            }
            case unionMember:
            case structMember:
            {
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

               size = 0;
               addMembers(g, cl, topClass, dm, opt, local, memberDefs, &size);
               defs.Add(declMember);
               alignment = dm.structAlignment;

               if(alignment)
               {
                  if(totalSize % alignment)
                     totalSize += alignment - (totalSize % alignment);
               }
               totalSize += size;
               break;
            }
         }
      }
   }
   if(retSize)
   {
      if(topMember && topMember.type == unionMember)
         *retSize = Max(*retSize, totalSize);
      else
         *retSize += totalSize;
   }
   else if(totalSize < maxSize && cl.type != systemClass)
   {
      int autoPadding = 0;
      if(!topMember && cl.structAlignment && totalSize % cl.structAlignment)
         autoPadding = cl.structAlignment - (totalSize % cl.structAlignment);
      if(totalSize + autoPadding < maxSize)
      {
         uint size = maxSize - totalSize;
         SpecsList specs { };
         InitDeclList decls { };
         ClassDefDeclaration def { decl = DeclarationInit { specifiers = specs, declarators = decls }; };
         ASTInitDeclarator decl { declarator = DeclPointer { declarator = DeclArray { declarator = DeclIdentifier {  identifier = ASTIdentifier { string = CopyString("__ecere_padding") } }, exp = ExpConstant { constant = PrintString(size) } } } };
         specs.Add(SpecName { name = CopyString("byte") });
         decls.Add(decl);
         defs.Add(def);
      }
   }
   if(context)
      FinishTemplatesContext(context);
}

void processTypeDependency(CGen g, Type _type, BOutputType from, BVariant vTop)
{
   bool native;
   int pointer = 0;
   const char * n = null;
   Type t = unwrapPointerTypeNative(_type, &pointer, &native);
   if(!native || (!t.isSigned && (n = nonTokenUnsignedTypeName(t, { }))))
   {
      Class clDep = null;
      switch(t.kind)
      {
         case functionType:
         {
            Type param;
            for(param = t.params.first; param; param = param.next)
               processTypeDependency(g, param, from, vTop);
            break;
         }
         case templateType:
         {
            Class _class = vTop.kind == vclass ? vTop.c.cl : vTop.kind == vproperty ? vTop.p.c.cl : null;
            if(_class && t.templateParameter)
            {
               TemplateParameter tp = t.templateParameter;
               Class cl = null;
               ClassTemplateParameter ctp = findClassTemplateParameter(tp.identifier.string, _class, &cl);
               if(tp.type == type && tp.identifier && tp.identifier.string && cl)
               {
                  BTemplaton t = g.bmod.addTempleton(ctp, cl.templateClass ? cl.templateClass : cl);
                  if(vTop && vTop.kind == vclass)
                     vTop.processDependency(g_, ostruct, otypedef, t);
               }
            }
            break;
         }
         case classType:
         {
            clDep = g.getClassFromType(t, true);
            if(clDep)
            {
               BClass cDep = clDep;
               recurseAddTemplatedClasses(g, cDep);
               // if(!strcmp(cDep.cl.name, "Map<int, FieldValue>")) debugBreakpoint();
            }
            break;
         }
         // tocheck: todo: are there more missing dependencies?
         case structType:
         case subClassType:
         case thisClassType:
            break;
         default:
            if(!t.isSigned && n)
               clDep = eSystem_FindClass(g.mod, n);
            // else missing dependency?
            break;
      }

      if(clDep && classIsFromModule(clDep, g.mod, ec1ComponentsApp))
         _processTypeDependency(g, from, vTop, pointer != 0, clDep);
   }
   if(_type.bitMemberSize) conmsg("check");
}

static void recurseAddTemplatedClasses(CGen g, BClass c)
{
   // if(c && !strcmp(c.cl.name, "HashMap<int64, ecere::com::Map<int, eda::FieldValue> >")) debugBreakpoint();
   // if(c && !strcmp(c.cl.name, "Map<int, FieldValue>")) debugBreakpoint();
   // if(c && !strcmp(c.cl.name, "Map<int, eda::FieldValue>")) debugBreakpoint();
   if(c && c.numTemplateArgsInName && !c.isClassTemplatable && c.completeTemplate)
   {
      BTemplaton tDep = g.bmod.addTemplateType(c, g.bmod.root_nspace);
      g.addOptionalClass(tDep);
      if(c.cTArgs)
      {
         for(cArg : c.cTArgs)
            recurseAddTemplatedClasses(g, cArg);
      }
   }
}

void _processTypeDependency(CGen g, BOutputType from, BVariant vTop, bool pointer, Class clDep)
{
   if(vTop.kind == vclass && clDep == vTop.c.cl && from == otypedef) clDep = null;
   if(vTop.kind == vproperty && clDep == vTop.p.c.cl) clDep = null;
   if(clDep)
   {
      BOutputType to = nil;
      if(clDep.templateClass)
      {
         BTemplaton tDep = g.bmod.addTemplateType(clDep, g.bmod.root_nspace);
         vTop.processDependency(g_, from, otypedef, tDep);
         clDep = clDep.templateClass;
      }
      else
         vTop.processDependency(g_, from, otypedef, clDep);
      if(!pointer && clDep.type != systemClass && clDep.type != unitClass && clDep.type != bitClass)
      {
         if(clDep.type == enumClass) to = oenum;
         else if(clDep.type == structClass || clDep.type == noHeadClass ||
               clDep.type == normalClass) to = ostruct;
         else conmsg("check");
         if(!clDep.templateClass)
            vTop.processDependency(g_, from, to, clDep);
      }
   }
}

void processTemplateArgs(CGen g, BClass c)
{
   Context context = SetupTemplatesContext(c.cl); // TOCHECK: Should we do this only once while we process the whole class?
   // Class startClass = getTemplateStartBaseClass(cl);
   // c.cpp.templParamsCount = getClassTemplateParamsStringsCPP(cl, &c.cpp.tprototype, &c.cpp.template, &c.cpp.targs, &c.cpp.targsb, &c.cpp.templatem, &c.cpp.targsm, &c.cpp.targsbm);
   Array<Class> cTArgs { };
   if(!c.isClassTemplatable && c.numTemplateArgsInName) // tocheck: hackish
   {
      bool complete = getSpecifiedTemplateArgs(c.cl, cTArgs);
      if(cTArgs.count && complete)
      {
         // todo: the thing -- c.cpp.dataTypeString = cppGetTemplateDataTypeString(cl, cSymbolTArgs);
         for(_class : cTArgs)
         {
            BClass cType = _class;
            if(_class != c.cl && cType.numTemplateArgsInName && !c.isClassTemplatable)
            {
               // processTemplateArgs(g, cType);
               // this is one that we need to add
               // PrintLn("deep class: ", _class.name);
            }
         }
      }
   }
   delete cTArgs;
   FinishTemplatesContext(context);
}

static bool getSpecifiedTemplateArgs(Class templateClass, Array<Class> cTArgs)
{
   bool complete = true;
   int i = 0;
   Class templateClassBase = null;
   List<Class> lineage = getCorrectLineage(templateClass, &templateClassBase);
   complete = checkCorrectLineageHasFullySpecifiedTemplateArgs(lineage, templateClass);
   if(complete)
   {
      if(templateClass.templateClass)
      {
         ClassTemplateParameter ctp1;
         ClassTemplateParameter ctp2;
         if(templateClass.templateParams.count != templateClass.templateClass.templateParams.count) debugBreakpoint();
         for(ctp1 = templateClass.templateParams.first, ctp2 = templateClass.templateClass.templateParams.first; ctp1 && ctp2; ctp1 = ctp1.next, ctp2 = ctp2.next)
            if(ctp1 != ctp2) debugBreakpoint();
         if(!(ctp1 == null && ctp2 == null)) debugBreakpoint();
      }

      for(_class : lineage)
      {
         Class cl = _class;
         if(i >= templateClass.numParams)
         {
            if(i > templateClass.numParams) debugBreakpoint();
            if(cl != templateClass && cl != templateClass.templateClass && cl != templateClass.templateClass.base) debugBreakpoint();
            break;
         }
         if(cl.templateParams.count)
         {
            ClassTemplateParameter ctp;
            for(ctp = cl.templateParams.first; ctp && complete; ctp = ctp.next)
            {
               switch(ctp.type)
               {
                  case type:
                  {
                     ClassTemplateArgument * a = &templateClass.templateArgs[i];
                     Class clType = null;
                     // if(!ctp.defaultArg.dataTypeString || (a->dataTypeString && strcmp(ctp.defaultArg.dataTypeString, a->dataTypeString)))
                     {
                        if(!(a->dataTypeString && (clType = eSystem_FindClass(templateClass.module, a->dataTypeString))))
                        {
                           if(!(ctp.defaultArg.dataTypeString && (clType = eSystem_FindClass(templateClass.module, ctp.defaultArg.dataTypeString))))
                           // if(!(ctp.defaultArg.dataTypeString && eSystem_FindClass(templateClass.module, ctp.defaultArg.dataTypeString)))
                              complete = false;
                        }
                        if(cTArgs && clType && !templateClassBase)
                           cTArgs.Add(clType);
                     }
                     break;
                  }
                  case expression: break; // expressions are ignored here
                  case identifier: break; // identifiers are ignored here
                  default: debugBreakpoint(); break;
               }
               i++;
            }
         }
         if(templateClassBase && templateClassBase == cl)
            templateClassBase = null;
      }
   }
   delete lineage;
   return complete;
}

enum TemplatedClassSymbolNameMode { bare, expanded, macro };
char * cGetTemplatedClassSymbolName(BClass c, Array<BClass> cTArgs, TemplatedClassSymbolNameMode mode)
{
   char * symbol = null;
   char * d;
   const char * templateClassName = c.cl.templateClass.name;
   // const char * prefix = mode == bare ? "" : mode == expanded ? "template" : "T(";
   const char * prefix = mode == macro ? "T(" : /*mode == bare ? */"template_"/* : "template"*/;
   const char * sep = mode == macro ? ", " : "_";
   int sepLen = strlen(sep);
   int len = 0;
   int hackLimit; // todo: find better way
   // if(!strcmp(c.cl.name, "Array<BlockEntry>")) debugBreakpoint();
   // if(!strcmp(c.cl.name, "Array<ecere::gfx::drivers::BlockEntry>")) debugBreakpoint();
   // if(mode != bare)
      // len += strlen(mode == expanded ? "template" : "T()");
      // len += strlen(mode == macro ? "T()" : "template");
   len += strlen(prefix);
   len += strlen(templateClassName);
   if(mode == macro)
      len += 1;
   hackLimit = c.numTemplateArgsInName;
   for(e : cTArgs)
   {
      BClass c = (Class)e;
      len += strlen(c.bareSymbol) + sepLen;
      if(--hackLimit == 0) break;
   }
   symbol = new char[len + 1];
   d = symbol;
   strcpy(d, prefix);
   d += strlen(prefix);
   strcpy(d, templateClassName);
   d += strlen(templateClassName);
   hackLimit = c.numTemplateArgsInName;
   for(e : cTArgs)
   {
      BClass c = (Class)e;
      strcpy(d, sep);
      d += sepLen;
      strcpy(d, c.bareSymbol);
      d += strlen(c.bareSymbol);
      if(--hackLimit == 0) break;
   }
   if(mode == macro)
      strcpy(d++, ")");
   if(len != d - symbol) debugBreakpoint();
   return symbol;
}
