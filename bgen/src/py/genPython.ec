import "bgen"
import "pyTools"

// TODO: Prioritize public properties over public members

/*
Map<const String, const String> nameSwapMap { [
   { "del", "delete" },
   { null, null }
] };

const char * pyNameSwap(const char * name)
{
   MapIterator<String, String> i { map = nameSwapMap };
   if(i.Index(name, false))
      return i.data;
   return name;
}
*/

class PythonGen : CGen
{
   char * cffiFileName;
   char * cffiFilePath;
   char * pyFileName;
   char * pyFilePath;
   char * buildFileName;
   char * buildFilePath;
   char * epjFileName;
   char * epjFilePath;

   //bool py;

   bool genEPJ;

   AST astCFFI;

   lang = Python;

   bool init()
   {
      bool result = false;
      if(Gen::init() && readyDir())
      {
         prepPaths(true);

         if(FileExists(pyFileName))
            DeleteFile(pyFileName);
         if(FileExists(cffiFileName))
            DeleteFile(cffiFileName);

         if(!FileExists(pyFileName) && !FileExists(cffiFileName))
         {
            reset();

            astCFFI = { };

            moduleInit();
            result = true;
         }
      }
      return result;
   }

   /*void processForPy()
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
   }*/

   void processNamespaces()
   {
      if(py)
      {
         IterNamespace itn { module = mod, processFullName = true };
         while(itn.next())
         {
            BNamespace n = (NameSpacePtr)itn.ns;
            /*if(!bmod.root_nspace)
            {
               bmod.root_nspace = (NameSpacePtr)itn.ns;
            }*/
            processDefines(n);
            /*if(lib.ecereCOM && itn.ns->parent == null && itn.ns->name == null)
               manualTypes(n);*/
            processClasses(n);
            //processOptionalClasses(n);
            processFunctions(n);
         }
         //processTemplatons();
         itn.cleanup();
      }
      else
         CGen::processNamespaces();
   }

   void processDefines(BNamespace n)
   {
      if(py)
      {
         DefinedExpression df; IterDefine def { n.ns };
         while((df = def.next()))
         {
            Expression exp = ParseExpressionString((char *)df.value);
            if(exp.type == instanceExp)
            {
               BDefine d = df;
               BVariant v = d;
               BOutput out { vdefine, d = d, ds = { } };
               d.nspace.addContent(v);
               d.out = out;

               {
                  Class clDep = eSystem_FindClass(mod, eSystem_FindClass(mod, exp.instance._class.name)); //"FileChange");
                  char * s = null;
                  char * val = getNoNamespaceString(df.value, null, false);
                  ChangeCh(val, '{', '(');
                  ChangeCh(val, '}', ')');
                  while((s = strstr(s ? s : val, "true")))
                     *s = 'T', s += 4;
                  while((s = strstr(s ? s : val, "false")))
                     *s = 'F', s += 5;
                  out.ds.println("");
                  out.ds.printxln(d.name, " = ", val);
                  v.processDependency(oother, otypedef, clDep);
                  delete val;
               }
            }
            FreeExpression(exp);
         }
      }
      else
         CGen::processDefines(n);
   }

   void processFunctions(BNamespace n)
   {
      if(py)
      {
         BFunction f; IterFunction itf { n.ns };
         ParamFilter noElipsis { all = true };
         noElipsis.ellipsisOn = false;
         while((f = itf.next()))
         {
            if(!f.skip && !f.isDllExport)
            {
               BVariant v = f;
               BOutput out { vfunction, f = f, ds = { } };
               f.nspace.addContent(v);
               f.out = out;
               // function
               {
                  bool convertTypedArgs = false;
                  Type t = f.fn.dataType;
                  //Type param;
                  char * name = pyGetNoConflictSymbolName(f.ccfname);
                  t = unwrapPointerType(t, null);
                  //if(!(t.params.count == 1 && (param = t.params.first) && !param.name && param.kind == voidType))
                  if(!paramsIsOnlyVoid(&t.params))
                  {
                     //for(param = t.params.first; param; param = param.next)
                     IterParamPlus itr { &t.params };
                     while(itr.next(noElipsis/*tofix: { all = true, ellipsisOn = false }*/))
                     {
                        SpecialType st = specialType(itr.pm);
                        if(st == typedObject)
                        {
                           convertTypedArgs = true;
                           break;
                        }
                     }
                  }
                  if(convertTypedArgs)
                     out.ds.printxln("def ", name, "(*args): lib.", f.ccfname, "(*convertTypedArgs(args))");
                  else
                  {
                     out.ds.printx("def ", name, "(");
                     if(!paramsIsOnlyVoid(&t.params))
                     {
                        const char * comma = "";
                        IterParamPlus itr { &t.params, anon = true, getName = pyGetNoConflictSymbolName };
                        while(itr.next(noElipsis/*tofix: { all = true, ellipsisOn = false }*/))
                        {
                           out.ds.printx(comma, itr.name);
                           comma = ", ";
                        }
                     }
                     out.ds.printx("): lib.", f.ccfname, "(");
                     if(!paramsIsOnlyVoid(&t.params))
                     {
                        const char * comma = "";
                        IterParamPlus itr { &t.params, anon = true, getName = pyGetNoConflictSymbolName };
                        while(itr.next(noElipsis/*tofix: { all = true, ellipsisOn = false }*/))
                        {
                           bool ptr = itr.isNullable;
                           out.ds.printx(comma, ptr ? "ffi.NULL if " : "", ptr ? itr.name : "", ptr ? " is None else " : "", itr.name, ptr ? ".impl" : "");
                           comma = ", ";
                        }
                     }
                     out.ds.printxln(")");
                  }
                  delete name;
               }
            }
         }
      }
      else
         CGen::processFunctions(n);
   }

   void processClasses(BNamespace n)
   {
      if(py)
      {
         BClass c; IterClass itc { n.ns };
         while((c = itc.next(all)))
         {
            if(!c.cl.templateClass) // don't generate templated classes just because they are listed
               processPyClass(this, c);
         }
      }
      else
         CGen::processClasses(n);
   }

   void generate()
   {
      File out;
      out = FileOpen(cffiFilePath, write);
      if(out)
      {
         cHeader(astCFFI, this);
         astCFFI.print(out, { });
         delete out;
      }
      resetSortingOrder();
      py = true;
      process();
      checkForCircularDependencies(this);
      out = FileOpen(pyFilePath, write);
      if(out)
      {
         if(lib.ecere)
         {
            String path = new char[MAX_LOCATION];
            StripLastDirectory(pyFilePath, path);
            PathCatSlash(path, "pyeC.py");
            generatePY(out, this, path);
            delete path;
         }
         else
            generatePY(out, this, null);
         delete out;
      }
      out = FileOpen(buildFilePath, write);
      if(out)
      {
         generateBUILD(out, this);
         delete out;
      }
      if(genEPJ)
      {
         out = FileOpen(epjFilePath, write);
         if(out)
         {
            generateEPJ(out, this);
            delete out;
         }
      }
      {
         char * cffiFilePathTmp = cffiFilePath;
         char * pyFilePathTmp = pyFilePath;
         char * epjFilePathTmp = epjFilePath;
         char * buildFilePathTmp = buildFilePath;
         cffiFilePath = null;
         pyFilePath = null;
         epjFilePath = null;
         buildFilePath = null;
         prepPaths(false);
         if(FileExists(cffiFilePath))
            DeleteFile(cffiFilePath);
         if(FileExists(pyFilePath))
            DeleteFile(pyFilePath);
         if(FileExists(buildFilePath))
            DeleteFile(buildFilePath);
         if(FileExists(epjFilePath))
            DeleteFile(epjFilePath);
         MoveFile(cffiFilePathTmp, cffiFilePath);
         MoveFile(pyFilePathTmp, pyFilePath);
         MoveFile(buildFilePathTmp, buildFilePath);
         MoveFile(epjFilePathTmp, epjFilePath);
         delete cffiFilePathTmp;
         delete pyFilePathTmp;
         delete epjFilePathTmp;
         delete buildFilePathTmp;
      }
   }

   void resetSortingOrder()
   {
      // tofix: bunch of massive leaks
      for(nn : bmod.orderedNamespaces)
      {
         BNamespace n = nn;
         n.orderedBackwardsOutputs = { };
         n.orderedOutputs = { };
      }
      bmod.orderedNamespaces = { };

      storeNamespaces = { };
      storeVariants = { };
      storeDefines = { };
      storeFunctions = { };
      storeClasses = { };
      storeMethods = { };
      storeProperties = { };

      allNamespaces = { };
      allVariants = { };
      allDefines = { };
      allFunctions = { };
      allClasses = { };
      allMethods = { };
      allProperties = { };

      mapDefine = { };
      mapFunction = { };
      mapTypedef = { };
      mapClassPointer = { };
      mapBitTool = { };
      mapEnum = { };
      mapStruct = { };
      mapMethod = { };
      mapProperty = { };
      mapConversion = { };

      optionalClasses = { };
      // tofix: all massive leaks above
   }

   void printOutputFiles()
   {
      if(!quiet)
      {
         PrintLn(lib.verbose > 1 ? "    " : "", cffiFileName);
         PrintLn(lib.verbose > 1 ? "    " : "", pyFileName);
         //PrintLn(lib.verbose > 1 ? "    " : "", buildFileName);
         //PrintLn(lib.verbose > 1 ? "    " : "", epjFileName);
      }
   }

   void prepPaths(bool tmp)
   {
      int len;
      char * name = new char[MAX_LOCATION];
      char * path = new char[MAX_LOCATION];
      strcpy(path, dir.dir);
      len = strlen(path);
      strcpy(name, "cffi-");
      strcat(name, lib.bindingName);
      ChangeExtension(name, "h", name);
      PathCatSlash(path, name);
      if(tmp) strcat(path, ".tmp");
      delete cffiFileName; cffiFileName = CopyString(name);
      delete cffiFilePath; cffiFilePath = CopyString(path);
      path[len] = 0;
      strcpy(name, "build_");
      strcat(name, lib.bindingName);
      ChangeExtension(name, "py", name);
      PathCatSlash(path, name);
      if(tmp) strcat(path, ".tmp");
      delete buildFileName; buildFileName = CopyString(name);
      delete buildFilePath; buildFilePath = CopyString(path);
      path[len] = 0;
      strcpy(name, "py");
      strcat(name, lib.bindingName);
      ChangeExtension(name, "py", name);
      PathCatSlash(path, name);
      if(tmp) strcat(path, ".tmp");
      delete pyFileName; pyFileName = CopyString(name);
      delete pyFilePath; pyFilePath = CopyString(path);
      path[len] = 0;
      ChangeExtension(name, "epj", name);
      PathCatSlash(path, name);
      if(tmp) strcat(path, ".tmp");
      delete epjFileName; epjFileName = CopyString(name);
      delete epjFilePath; epjFilePath = CopyString(path);
      delete name;
      delete path;
   }

   char * allocMacroSymbolName(bool noMacro, MacroType type, const char * name, const char * name2, int ptr)
   {
      switch(type)
      {
         case C:           return                    CopyString(name);
         case CM:          return PrintString("class_members_", name);
         case CO:          return PrintString(        "class_", name);
         case SUBCLASS:    return PrintString("Class *");
         case THISCLASS:   return PrintString(                  name, ptr ? " *" : "");
         case T:           return getTemplateClassSymbol(       name, true);
         case TP:          return PrintString(       "tparam_", name, "_", name2);
         case METHOD:      return PrintString(       "method_", name, "_", name2);
         case PROPERTY:    return PrintString(     "property_", name, "_", name2);
         case M_VTBLID:    return PrintString(                  name, "_", name2, "_vTblID");

      }
      return CopyString(name);
   }

   void reset()
   {
      ec1terminate();
   }

   ~PythonGen()
   {
      delete cffiFileName;
      delete cffiFilePath;
      delete pyFileName;
      delete pyFilePath;
      delete buildFileName;
      delete buildFilePath;
      delete epjFileName;
      delete epjFilePath;
   }
}

void checkForCircularDependencies(PythonGen g)
{
   /*
   IterNamespace itna { module = g.mod, processFullName = true };
   while(itna.next())
   {
      BNamespace na = (NameSpacePtr)itna.ns;
      BClass ca; IterClass itca { na.ns };
      while((ca = itca.next(all)))
      {
         IterNamespace itnb { module = g.mod, processFullName = true };
         while(itnb.next())
         {
            BNamespace nb = (NameSpacePtr)itnb.ns;
            BClass cb; IterClass itcb { nb.ns };
            while((cb = itcb.next(all)))
            {
               BVariant va = ca.cl;
               BVariant vb = cb.cl;
               //if(ca.outTypedef.dependsOn(cb.outTypedef))
            }
         }
         itnb.cleanup();
      }
   }
   itna.cleanup();
   */
}

bool paramsIsOnlyVoid(OldList * params)
{
   Type pm;
   return params->count == 1 && (pm = params->first) && !pm.name && pm.kind == voidType;
}

bool typeReturnTypeRequiresPyObj(Type type)
{
   return type.kind == functionType && type.returnType.kind == classType && type.returnType._class.registered &&
      (type.returnType._class.registered.type == normalClass || type.returnType._class.registered.type == noHeadClass);
}

bool typeIsNative(Type type)
{
   return type.kind == charType || type.kind == shortType || type.kind == intType || type.kind == int64Type ||
         type.kind == int128Type || type.kind == longType || type.kind == floatType || type.kind == doubleType;
}

bool typeIsClassNative(Type type)
{
   return type.kind == classType && type._class.registered && (type._class.registered.type == systemClass ||
         type._class.registered.type == enumClass/* || type._class.registered.type == unitClass*/);
}

bool typeIsUnitClass(Type type)
{
   return type.kind == classType && type._class.registered && type._class.registered.type == unitClass;
}

bool typeHasTemplateClass(Type type)
{
   return type.kind == classType && type._class.registered && type._class.registered.templateClass;
}

bool typeIsSomething(Type type)
{
   return type.kind == pointerType || type.kind == templateType || type.kind == arrayType || type.kind == functionType;
}

bool isTypePythonNative(Type type)
{
   switch(type.kind)
   {
      case shortType:
      case intType:
      case int64Type:
      case int128Type:
      case longType:
      case floatType:
      case doubleType:
         return true;
      case classType:
      {
         BClass c = type._class.registered;
         if(c && c.nativeSpec && !c.isCharPtr && !c.isString)
            return true;
      }
   }
   return false;
}

void processPyClass(PythonGen g, BClass c)
{
   bool skip = c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class;
   const char * sk = skip ? "# " : "";
   ParamFilter noElipsis { all = true };
   noElipsis.ellipsisOn = false;
   if(!(c.skip || c.cl.type == systemClass || c.isByte || c.isCharPtr ||
         c.isUnInt || c.isUnichar || c.is_class || c.isInstance ||
         /*c.isString || */c.isBool)) // (skip)
   {
      BVariant v = c;
      BNamespace n = c.nspace;
      BOutput out { vclass, c = c, ds = { } };
      BClass cBase = c.cl.base ? c.cl.base.templateClass ? c.cl.base.templateClass : c.cl.base : null;
      bool hasBase = cBase && cBase.cl.type != systemClass;
      bool hasContent = classHasContent(g, c);
      List<Class> lineage = getClassLineage(c.cl);
      List<Class> classOnly { [ c.cl ] };

      int memberArgCount = 0;
      int memberLen = 0, len;
      bool hasOneToOneBaseConv = false;
      bool elif = false;
      BProperty userDataProp = null;
      bool check1 = false;
      IterMethod itm { c.cl };
      while(itm.next(publicVirtual))
      {
         if(!itm.md.dataType) ProcessMethodType(itm.md);
         if(itm.md.dataType)
         {
            bool thisClass = itm.md.dataType.thisClass && itm.md.dataType.thisClass.string;
            bool anyObject = thisClass && !strcmp(itm.md.dataType.thisClass.string, "class");
            if(anyObject)
            {
               check1 = true;
               break;
            }
         }
      }
      if(check1)
      {
         BProperty p; IterProperty itp { c.cl };
         while((p = itp.next(publicOnly)))
         {
            if(p.pt.dataType.kind == pointerType && p.pt.dataType.type.kind == voidType)
            {
               userDataProp = p;
               break;
            }
         }
      }

      c.outTypedef = out;
      n.contents.Add(v);

      theCallbacks(g, c, out, sk, userDataProp);

      if(c.isModule)
      {
         out.ds.printx("def regclass(c):", ln,
                       "   app.registerClass(c)", ln,
                       "   return c", ln);
      }

      out.ds.println("");
      out.ds.printx(sk, "class ", c.symbolName);

      //if(cBase && cBase.cl.type != bitClass)
      if((c.cl.type == unitClass || c.cl.type == bitClass) && cBase.cl.type == systemClass)
         out.ds.print("(pyBaseClass)");
      else if(hasBase && (!c.nativeSpec || cBase.cl.type == unitClass) && !c.isBool)
      {
         out.ds.printx("(", cBase.symbolName, ")"); // c.baseSymbolName
         v.processDependency(otypedef, otypedef, cBase.cl);
      }

      out.ds.print(":");
      if(!skip && !hasContent)
         out.ds.print("pass");
      if(skip) out.ds.print(" # tofix");
      out.ds.println("");

      if(c.isInstance)
         check(); // pyHardcodeInstance(out.ds);
      else if(c.isArray)
         sourceFileProcessToDynamicString(out.ds, ":src/py/py_hardcode_array.src", null, false);
      else if(c.isApplication)
      {
         sourceFileProcessToDynamicString(out.ds, ":src/py/py_hardcode_application.src", null, false);
         /*{
            IterNamespace itn { module = g.mod, ecereCOM = true };
            while(itn.next())
            {
               BClass c; IterClass itc { itn.ns };
               while((c = itc.next(all)))
               {
                  if(c.cl.type == normalClass && !c.isCharPtr && !c.isInstance &&
                        !c.isModule && !c.isApplication && !c.cl.templateClass)
                     out.ds.printxln("      self.registerClass(", c.name, ", True)");
               }
            }
            itn.cleanup();
         }*/
      }
      else if(c.isGuiApplication)
      {
         sourceFileProcessToDynamicString(out.ds, ":src/py/py_hardcode_guiapplication.src", null, false);
         assert(g.lib.ecere == true);
         // register all normal classes
         /*{
            IterNamespace itn { module = g.mod };
            while(itn.next())
            {
               BClass c; IterClass itc { itn.ns };
               while((c = itc.next(all)))
               {
                  if(c.cl.type == normalClass && !c.isWindow && !c.cl.templateClass)
                     out.ds.printxln("      self.registerClass(", c.name, ", True)");
               }
            }
            itn.cleanup();
         }*/
         {
            // todo: use IterAllClass to spare this double nested loop and iterators
            IterNamespace itn { module = g.mod, ecereCOM = true/*, processFullName = true*/ };
            while(true)
            {
               while(itn.next())
               {
                  BClass c; IterClass itc { itn.ns };
                  while((c = itc.next(all)))
                  {
                     if(c.cl.type == normalClass && !c.isCharPtr && !c.isInstance &&
                           !c.isModule && !c.isApplication && !c.cl.templateClass)
                        out.ds.printxln("      self.registerClass(", c.name, ", True)");
                  }
               }
               itn.cleanup();
               if(itn.ecereCOM)
                  itn.ecereCOM = false;
               else
                  break;
            }
         }
         out.ds.println("");
      }
      else if(c.isContainer)
         sourceFileProcessToDynamicString(out.ds, ":src/py/py_hardcode_container.src", null, false);
      else if(c.isWindow && g.lib.ecereCOM)
         ;
      else if(c.cl.type == structClass || c.cl.type == noHeadClass || c.cl.type == bitClass ||
            c.cl.type == unitClass || c.cl.type == normalClass || c.cl.type == enumClass)
      {
         List<Class> lin = c.cl.type == bitClass ? classOnly : lineage;
         // todo: share the iterator instead of always using a fresh new one
         //  but have to fix infinite loop on 2nd use
         //   itmpp.reset(); // todo tofix fixthis: required to prevent infinite loop
         //IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lin, typing = true };
         ClassHierarchyMemberOrPropertyFilter filter;
         if(c.cl.type == bitClass)
            filter = publicMembers;
         else if(c.cl.type == structClass || c.cl.type == noHeadClass || c.cl.type == bitClass || c.cl.type == normalClass)
            filter = publicMembersAndPropertiesWithSet;
         else
            filter = all;

         if(c.cl.type == unitClass)
         {
            BProperty p; IterConversion itc { c.cl };
            while((p = itc.next(publicOnly)))
            {
               if(!p.pt.Get && !p.pt.Set && !strcmp(p.cConv.symbolName, c.baseSymbolName))
               {
                  hasOneToOneBaseConv = true;
                  break;
               }
            }
         }

         if(hasContent)
         {
            int otherCount = 0;
            int lineEachIndent = 0;
            bool first = false;
            int charCount = 0;
            bool hasUnion = false; // FIX #06 (16.)
            bool hasNew = false; // FIX #06 (12.)
            char * firstInitializerName = null; // FIX #06 (12.)
            BProperty pFromString = null; // FIX #06 (12.)

// ------------------------------------------------------------------------------------------------------------------- //
//      counting                                                                                                       //
// ------------------------------------------------------------------------------------------------------------------- //
            if(c.cl.type != unitClass)
            {
               // counting chars and args for __init__ arguments
               IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lin };
               while(itmpp.next(filter))
               {
                  if(itmpp.dm && itmpp.dm.type == unionMember) hasUnion = true; // FIX #06 (16.)
                  if(itmpp.dm && itmpp.dm.type != normalMember) continue;
                  charCount += strlen(itmpp.name) + 4;
                  if(itmpp.dm)
                     memberArgCount++;
                  if(!firstInitializerName && c.cl.type == normalClass && ((itmpp.dm && itmpp.dm.type == normalMember) || itmpp.pt))
                     firstInitializerName = CopyString(itmpp.name);
               } //itmpp.reset();
               //lineEachIndent = 16; // charCount > 96 ? 16 : 0;
            }
            //else lineEachIndent = 0;
            lineEachIndent = (charCount > 256) ? 16 : 0;
            if(c.cl.type == normalClass && !c.isString) lineEachIndent = 16;
// ------------------------------------------------------------------------------------------------------------------- //
//      definition of __new__ function                                                                                 //
// ------------------------------------------------------------------------------------------------------------------- //
//#if 0
            // FIX #06 (12.)
            if(c.cl.type == normalClass)
            {
               BProperty p; IterConversion itc { c.cl };
               while((p = itc.next(publicOnly)))
               {
                  if(p.pt.Set && p.cConv && p.cConv.isString)
                  {
                     hasNew = true;
                     pFromString = p;
                     break;
                  }
               }
            }

            if(hasNew)
            {
               out.ds.printx(sk, "   def __new__(cls"); //, from_String = None
               initArguments(g, c, v, out, sk, lineage, lin, filter, hasUnion, 15, &memberLen, &otherCount);
               out.ds.printx(sk, "      if isinstance(", firstInitializerName, ", str):", ln,
                             sk, "         impl = lib.", pFromString.fpnSet, "(", firstInitializerName, ".encode('utf8'))", ln,
                             sk, "         if impl == ffi.NULL: return None", ln,
                             sk, "      o = Instance.__new__(cls)", ln,
                             sk, "      if impl is not None: o.impl = impl", ln,
                             sk, "      return o;", ln);
               delete firstInitializerName;
            }
//#endif // 0
// ------------------------------------------------------------------------------------------------------------------- //
//      definition of __init__ function                                                                                //
// ------------------------------------------------------------------------------------------------------------------- //
            if(c.cl.type != enumClass)
               out.ds.printx(sk, "   def __init__(self");
// ------------------------------------------------------------------------------------------------------------------- //
//      arguments for __init__ function                                                                                //
// ------------------------------------------------------------------------------------------------------------------- //
            initArguments(g, c, v, out, sk, lineage, lin, filter, hasUnion, lineEachIndent, &memberLen, &otherCount);
// ------------------------------------------------------------------------------------------------------------------- //
//      content of __init__ function: some initialization of self                                                      //
// ------------------------------------------------------------------------------------------------------------------- //
            if(hasNew)
               out.ds.printx(sk, "      if hasattr(self, 'impl'): return", ln);
            if(c.cl.type == noHeadClass)
            {
               // FIX #05 (8.)
               out.ds.printx(sk, "      if impl is not None:", ln,
                             sk, "         self.impl = impl", ln,
                             sk, "      else:", ln,
                             sk, "         self.impl = ffi.cast(\"", c.name, " *\", lib.Instance_new(lib.class_", c.name, "))", ln);
            }
            else if(c.cl.type == structClass)
            {
               out.ds.printx(sk, "      if impl is not None:", ln,
                             sk, "         self.impl = ffi.new(\"", c.name, " *\", impl)", ln,
                             sk, "      else:", ln);
            }
            else if(c.cl.type == bitClass)
            {
               DataMember dm; IterDataMember itd { c.cl };
               out.ds.printx(sk, "      if impl is not None:", ln,
                             sk, "         self.impl = impl", ln);
               while((dm = itd.next(publicOnly)))
               {
                  char * name = pyGetNoConflictSymbolName(dm.name);
                  out.ds.printx(sk, "      elif isinstance(", name, ", ", c.name, "):", ln,
                                sk, "         self.impl = ", name, ".impl", ln);
                  delete name;
                  break;
               } // itd.reset();
               out.ds.printx(sk, "      else:", ln);
            }
            else if(c.cl.type == unitClass)
            {
               if(c.cl.base.type == systemClass)
               {
                  //out.ds.printxln(sk, "      if impl is not None: self.impl = impl");
                  out.ds.printxln(sk, "      self.impl = impl");
                  //out.ds.printxln(sk, "      else: self.impl = value");
               }
               else if(c.cl.base.type == unitClass)
               {
                  out.ds.printx(sk, "      if impl is not None: self.impl = impl", ln,
                                sk, "      elif isinstance(value, ", c.cl.base.name, "): self.impl = value.impl", ln,
                                sk, "      else: self.", hasOneToOneBaseConv ? "impl" : "value", " = value", ln);
               }
               else check();
            }
            else if(c.cl.type == normalClass)
            {
               if(!(c.isApplication || c.isGuiApplication || c.isContainer || (c.isWindow && g.lib.ecereCOM)))
               {
                  //out.ds.printxln(sk, "");
                  if(!cBase.isCharPtr)
                  {
                     out.ds.printx(sk, "      ", cBase.name, ".__init__(self");
                     if(c.cl.templateParams.count) // todo or base's or base's base's, etc
                        out.ds.print(", templateParams");
                     out.ds.print(", impl = impl");
                     out.ds.println(")");
                  }
                  if(userDataProp)
                     out.ds.printxln(sk, "      if self.impl != ffi.NULL: lib.", userDataProp.fpnSet, "(self.impl, self.impl)");
                  //out.ds.printxln(sk, "");
                  if(c.isString)
                  {
                     out.ds.printx(sk, "      if impl is not None: self.impl = impl", ln,
                                   sk, "      else: self.impl = ffi.NULL", ln,
                                   sk, "   # hardcoded __str__", ln,
                                   sk, "   def __str__(self):", ln,
                                   sk, "      return ffi.string(self.impl).decode('utf8') if self.impl != ffi.NULL else str()", ln);
                  }
                  {
                     IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage };
                     while(itmpp.next(publicOnly))
                     {
                        if((itmpp.dm && itmpp.dm.type == normalMember) || (itmpp.pt && itmpp.pt.Set))
                           out.ds.printxln(sk, "      if ", itmpp.name, " is not ", "None", ": ", spaces(memberLen, strlen(itmpp.name)), "self.", itmpp.name, " = ", itmpp.name);
                     }
                  }
                  for(ccc : lineage)
                  {
                     BClass cc = ccc;
                     if(cc.is_class || cc.isInstance) continue;
                     // setting virtual methods
                     {
                        BMethod m; IterMethod itm { cc.cl };
                        while((m = itm.next(publicVirtual)))
                        {
                           m.init(itm.md, cc);
                           out.ds.printxln("      if ", m.mname, " is not ", "None", ": ", spaces(memberLen, strlen(m.mname)), "self.", m.mname, " = ", m.mname);
                        }
                     }
                  }
               }
            }
// ------------------------------------------------------------------------------------------------------------------- //
//      tuple handling (__init__ continued)                                                                            //
// ------------------------------------------------------------------------------------------------------------------- //
            //if(c.isAnchor || (memberArgCount > 1 && memberArgCount < 6))
            if((c.cl.type == structClass || c.cl.type == bitClass) && ((memberArgCount > 1 && memberArgCount < 6) || c.isAnchor))
            {
               int i = 0;
               bool first = true;
               bool tmpNoSp = c.cl.type == bitClass;
               int tmpLimit = tmpNoSp ? 64 : 4;
               IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage, typing = true, unionFirstsOnly = true };
               while(itmpp.next(publicOnly) && i < tmpLimit)
               {
                  if((itmpp.dm && itmpp.dm.type != normalMember) || (itmpp.pt && !itmpp.pt.Set)) continue;
                  if(first)
                  {
                     DataMember dm = itmpp.dm;
                     const char * zeroVal = getTypeZeroValuePy(g, dm.dataType, v);
                     out.ds.printx(sk, "         if isinstance(", itmpp.name, ", tuple):", ln,
                                   sk, "            __tuple = ", itmpp.name, ln,
                                   sk, "            ", itmpp.name, " = ", zeroVal, ln);
                     first = false;
                     elif = true;
                  }
                  out.ds.printxln(sk, "            if len(__tuple) > ", i, ": ", itmpp.name,
                        tmpNoSp ? "" : spaces(memberLen, strlen(itmpp.name)), " = __tuple[", i, "]"); i++;
               }
            }
// ------------------------------------------------------------------------------------------------------------------- //
//      some conversion stuff? for bitclass only so far (__init__ continued)                                           //
// ------------------------------------------------------------------------------------------------------------------- //
            if(c.cl.type == bitClass)
            {
               //Array<String> bitMembers = null;
               //bool first = false;
               DataMember dm; IterDataMember itd { c.cl };
               while((dm = itd.next(publicOnly)))
               {
                  char * name = pyGetNoConflictSymbolName(dm.name);
                  //const char * typeName = dm.dataType.kind == classType && dm.dataType._class.registered ? dm.dataType._class.registered.name : "FixTypeNameIssue"; //getSimpleDataTypeName(dm.dataType, dm.dataTypeString, 0, false, g.lib.ecereCOM, null);
                  BProperty p; IterConversion itc { c.cl };
                  while((p = itc.next(publicOnly)))
                  {
                     bool dotThis = c.cl.type == bitClass;
                     out.ds.printxln(sk, "         ", elif ? "el" : "", "if isinstance(", name, ", ", p.name, "):");
                     out.ds.printxln(sk, "            self.impl = lib.", p.fpnSet, "(", name, dotThis ? ".impl" : "", ")");
                     out.ds.printxln(sk, "            return");
                     elif = true;
                     /*out.ds.printxln(sk, "            val = lib.", p.fpnSet, "(", name, ")");
                     {
                        DataMember dm; IterDataMember itd { c.cl };
                        while((dm = itd.next(publicOnly)))
                        {
                           char * name = pyGetNoConflictSymbolName(dm.name);
                           if(typeIsNative(dm.dataType) || typeIsClassNative(dm.dataType))
                              out.ds.printxln(sk, "            ", name, " = val.", name);
                           else
                           {
                              const char * typeName = dm.dataType.kind == classType && dm.dataType._class.registered ? dm.dataType._class.registered.name : "FixTypeNameIssue"; //getSimpleDataTypeName(dm.dataType, dm.dataTypeString, 0, false, g.lib.ecereCOM, null);
                              out.ds.printxln(sk, "            ", name, " = ", typeName, "(impl = val.", name, ")");
                           }
                           delete name;
                        }
                     //out.ds.printxln(sk, "            val = lib.", p.fpnSet);
                     //out.ds.printxln(sk, "            val = lib.", p.fpnSet);
                     }*/
                     v.processDependency(otypedef, otypedef, p.cConv.cl);
                  }
   //#if 0
                  {
                     IterAllClass itacl { itn.module = g.mod/*module = g.mod*/ };
                     while(itacl.next(all))
                     {
                        BProperty p; IterConversion itcn { itacl.cl };
                        while((p = itcn.next(publicOnly)))
                        {
                           if(!p.cConv)
                              ;//PrintLn("    ", "what's going on with native type conversion ", itacl.cl.name, " <-> ", p.name);
                           else if(p.cConv.cl == c.cl)
                           {
                              bool dotThis = itacl.cl.type == bitClass;
                              //out.ds.printxln(sk, "         # aconvhere ", c.name, " <-> ", itacl.cl.name);
                              out.ds.printxln(sk, "         ", elif ? "el" : "", "if isinstance(", name, ", ", itacl.cl.name, "):");
                              out.ds.printxln(sk, "            self.impl = lib.", p.fpnGet, "(", name, dotThis ? ".impl" : "", ")");
                              out.ds.printxln(sk, "            return");
                              //v.processDependency(otypedef, otypedef, itacl.cl);
                           }
                        }
                     }
                     itacl.cleanup();
                  }
   //#endif // 0
                  delete name;
                  itd.reset();
                  break;
               }
            }
// ------------------------------------------------------------------------------------------------------------------- //
//      some conversion stuff? for structclass only so far (__init__ continued)                                        //
// ------------------------------------------------------------------------------------------------------------------- //
            //if(c.cl.type != noHeadClass)
            if(c.cl.type == structClass)
            {
               if(c.cl.type != unitClass) // that good?
               // conversions from native types
               {
                  BProperty p; IterConversion itc { c.cl };
                  while((p = itc.next(publicOnly)))
                  {
                     const char * type = !strcmp(p.name, "double") ? "float" : p.name;
                     IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage, typing = true };
                     while(itmpp.next(publicOnly))
                     {
                        if((itmpp.dm && itmpp.dm.type == normalMember) || (itmpp.pt && itmpp.pt.Set))
                        {
                           out.ds.printxln(sk, "         ", elif ? "el" : "", "if isinstance(", itmpp.name, ", ", type, "):");
                           if(c.cl.type == structClass)
                           {
                              bool valDotThis = p.cConv && (p.cConv.cl.type == unitClass || p.cConv.cl.type == structClass);
                              out.ds.printx(sk, "            self.impl = ffi.new(\"", c.name, " *\")", ln,
                                            sk, "            lib.", p.fpnSet, "(self.impl", ", ", itmpp.name, valDotThis ? ".impl" : "", ")", ln,
                                            sk, "            return", ln);
                           }
                           elif = true;
                           break;
                        }
                     }
                     itmpp.reset();
                  }
               }
            }
// ------------------------------------------------------------------------------------------------------------------- //
//      more typing or some sort? (__init__ continued)                                                                 //
// ------------------------------------------------------------------------------------------------------------------- //
            //if(c.cl.type != noHeadClass)
            if(c.cl.type == structClass || c.cl.type == bitClass)
            {
               IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage, typing = true };
               while(itmpp.next(publicOnly))
               {
                  bool retype;
                  const char * typeName = itmpp.type.kind == classType && itmpp.type._class.registered ? itmpp.type._class.registered.name : "FixTypeNameIssue"; //getSimpleDataTypeName(itmpp.type, dm.dataTypeString, 0, false, g.lib.ecereCOM, null);
                  //if(!itmpp.pt && !(typeIsNative(itmpp.type) || typeIsClassNative(itmpp.type) ||
                  //      typeIsSomething(itmpp.type) || typeHasTemplateClass(itmpp.type) || typeIsUnitClass(itmpp.type)))// &&
                  //      //itmpp.type._class.registered && reduceUnitClass(itmpp.type._class.registered) != itmpp.type._class.registered)
                  //      //!c.cl.templateClass)
// FIX #04
                  retype = !itmpp.pt && !(typeIsNative(itmpp.type) || typeIsClassNative(itmpp.type) ||
                        typeIsSomething(itmpp.type) || typeHasTemplateClass(itmpp.type));
                  if(c.cl.type == bitClass)
                     retype = retype && !typeIsUnitClass(itmpp.type);
                  if(retype)
                  {
                     Class clBaseUnit;
                     // FIX #05 (6.)
                     bool more = c.cl.type == structClass;
                     bool inst = itmpp.type.kind == classType && itmpp.type._class.registered && itmpp.type._class.registered.type == normalClass;
                     for(clBaseUnit = itmpp.type._class.registered; clBaseUnit && clBaseUnit.base.type == unitClass; clBaseUnit = clBaseUnit.base);
                     if(c.cl.type == structClass)
                        out.ds.printxln(sk, "         ", "if ", itmpp.name, " is not None:");
                     //if(inst)
                        out.ds.printxln(sk, "         ", more ? "   " : "", "if not isinstance(", itmpp.name, ", ", clBaseUnit.name, "):",
                              " ", itmpp.name, " = ", typeName, "(", itmpp.name, ")");
                     //else
                     //   out.ds.printxln(sk, "         ", "if ", itmpp.name, " is not None and not isinstance(", itmpp.name, ", ", clBaseUnit.name, "):");
                     //out.ds.printxln(sk, "            ", inst ? "   " : "", itmpp.name, " = ", typeName, "(", itmpp.name, ")");
                     if(c.cl.type == structClass)
                     {
                        if(!hasUnion) // FIX #06 (16.)
                           out.ds.printxln(sk, "            ", itmpp.name, " = ", itmpp.name, ".impl"); // FIX #04 (14.)
                        if(inst)
                           out.ds.printx(sk, "         else:", " ", itmpp.name, " = ffi.NULL", ln);
                     }
                  }
               }
            }
// ------------------------------------------------------------------------------------------------------------------- //
//      more initialization of self (__init__ continued)                                                               //
// ------------------------------------------------------------------------------------------------------------------- //
            if(c.cl.type == bitClass)
            {
               DataMember dm; IterDataMember itd { c.cl };
               out.ds.printxln(sk, "         self.impl = ("); // self.value
               first = true;
               while((dm = itd.next(publicOnly)))
               {
                  const char * zeroVal = getTypeZeroValuePy(g, dm.dataType, v);
                  int lenx = strlen(c.name);
                  if(!(strlen(zeroVal) == lenx + 2 && !strncmp(zeroVal, c.name, lenx)))
                  {
                     char * name = pyGetNoConflictSymbolName(dm.name);
                     if(!first) out.ds.println(" |");
                     if(dm.dataType.kind == classType && dm.dataType._class && dm.dataType._class.registered && dm.dataType._class.registered.type == bitClass)
                        out.ds.printx(sk, "            (", name, ".impl", spaces(memberLen, strlen(name) + 5),
                              " << lib.", c.upper, "_", name, "_SHIFT)", spaces(memberLen, strlen(name)));
                     else
                        out.ds.printx(sk, "            (", name, spaces(memberLen, strlen(name)),
                              " << lib.", c.upper, "_", name, "_SHIFT)", spaces(memberLen, strlen(name)));
                     if(first) first = false;
                     delete name;
                  }
               }
               out.ds.println(" )");
            }
            else if(c.cl.type == structClass) // c.cl.type != noHeadClass
            {
               if(hasUnion) // FIX #06 (16.)
               {
                  out.ds.printx(sk, "         __members = { }", ln);
                  {
                     IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage, typing = true };
                     while(itmpp.next(publicOnly))
                     {
                        if(itmpp.dm && itmpp.dm.type == normalMember)
                        {
                           const char * name = itmpp.mp.name;
                           BClass cType = itmpp.type.kind == classType ? itmpp.type._class.registered : null;
                           bool dotThis = !(typeIsNative(itmpp.type) || typeIsClassNative(itmpp.type) ||
                                 (cType && cType.isString) || (itmpp.type.kind == pointerType &&
                                 (typeIsNative(itmpp.type.type) || itmpp.type.type.kind == voidType)));
                           out.ds.printx(sk, "         if ", name, " is not None:", spaces(memberLen, strlen(name)),
                                 " __members['", name, "']", spaces(memberLen, strlen(name)), " = ", name,
                                 dotThis ? ".impl[0]" : "", ln);
                        }
                     }
                  }
               }
               out.ds.printx(sk, "         self.impl = ffi.new(\"", c.name, " *\"");
               if(hasUnion) // FIX #06 (16.)
                  out.ds.printx(", __members");
               else
               //if(!c.isAnchor)
               {
                  out.ds.printx(", { ");
                  {
                     const char * comma = "";
                     IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage, typing = true, unionFirstsOnly = true };
                     while(itmpp.next(publicOnly))
                     {
                        //if(!itmpp.mp.isProperty/* || pt.Set*/)
                        if(itmpp.dm && itmpp.dm.type == normalMember)
                        {
                           bool dotThis = false;
                           //if(!strcmp(c.name, "Size") && !strcmp(itmpp.name, "w"))
                           /*if(!(typeIsNative(itmpp.type) || typeIsClassNative(itmpp.type) ||
                              typeIsSomething(itmpp.type) || typeIsUnitClass(itmpp.type))) // FIX #04
                              dotThis = true;*/
                           out.ds.printx(comma, "'", itmpp.mp.name, "' : ", itmpp.name, dotThis ? ".impl" : "");
                           comma = ", ";
                        }
                     }
                  }
                  out.ds.printx(" }");
               }
               out.ds.printxln(")");
               //if(c.cl.type == structClass)
               {
                  IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage };
                  while(itmpp.next(publicOnly))
                  {
                     if(itmpp.pt && itmpp.pt.Set)
                        //out.ds.printxln(sk, "         if not isinstance(", name, ", ", clBaseUnit.name, "): ", name, " = ", typeName, "(", name, ")");
                        out.ds.printxln(sk, "         if ", itmpp.name, " is not None: ", spaces(memberLen, strlen(itmpp.name)), "self."/*, itmpp.mp.isProperty ? "" : "impl."*/, itmpp.name, spaces(memberLen, strlen(itmpp.name)), itmpp.mp.isProperty ? "     " : "", " = ", itmpp.name/*, dotThis ? ".impl" : ""*/);
                  }
               }
               // FIX #04
               //if(c.cl.type != structClass)
               {
                  IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage };
                  while(itmpp.next(publicOnly))
                  {
                     // FIX #04
                     //if((itmpp.dm && itmpp.dm.type == normalMember) || (itmpp.pt && itmpp.pt.Set))
                     if((itmpp.dm && itmpp.dm.type == normalMember && c.cl.type != structClass) || (itmpp.pt && itmpp.pt.Set))
                        //out.ds.printxln(sk, "         if not isinstance(", name, ", ", clBaseUnit.name, "): ", name, " = ", typeName, "(", name, ")");
                        out.ds.printxln(sk, "         if ", itmpp.name, " is not None: ", spaces(memberLen, strlen(itmpp.name)), "self."/*, itmpp.mp.isProperty ? "" : "impl."*/, itmpp.name, spaces(memberLen, strlen(itmpp.name)), itmpp.mp.isProperty ? "     " : "", " = ", itmpp.name/*, dotThis ? ".impl" : ""*/);
                  }
               }
            }
// ------------------------------------------------------------------------------------------------------------------- //
//      retyping of arguments? (__init__ continued)                                                                    //
// ------------------------------------------------------------------------------------------------------------------- //
            if(c.cl.type == structClass || c.cl.type == noHeadClass)
            {
               // FIX #05 (8.)
               const char * indent = c.cl.type == structClass ? "      " : "         ";
               IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage, typing = true };
               while(itmpp.next(publicOnly))
               {
                  if(itmpp.pt && itmpp.pt.Set)
                  {
                     bool dotThis = false;
                     BClass cType = itmpp.type.kind == classType ? itmpp.type._class.registered : null;
                     // FIX #05 (11.)
                     if(c.cl.type == structClass && !(typeIsNative(itmpp.type) ||
                           typeIsClassNative(itmpp.type) || typeIsSomething(itmpp.type)))
                        dotThis = true;
                     //out.ds.printx(comma, "'", itmpp.name, "' : ", itmpp.name, dotThis ? ".impl" : "");
                     //if(c.cl.type == structClass)
                     {
                        // FIX #05 (11.)
                        if(c.cl.type == structClass && !(typeIsNative(itmpp.type) ||
                                 typeIsClassNative(itmpp.type) || typeIsSomething(itmpp.type) ||
                                 typeHasTemplateClass(itmpp.type)) && itmpp.type.kind == classType &&
                                 itmpp.type._class.registered && !cType.isString && !cType.isBool)
                        {
                           Class clBaseUnit;
                           const char * typeName = itmpp.type.kind == classType && itmpp.type._class.registered ? itmpp.type._class.registered.name : "FixTypeNameIssue"; //getSimpleDataTypeName(itmpp.type, itmpp.pt.dataTypeString, 0, false, g.lib.ecereCOM, null);
                           for(clBaseUnit = itmpp.type._class.registered; clBaseUnit && clBaseUnit.base.type == unitClass; clBaseUnit = clBaseUnit.base);
                           out.ds.printxln(sk, indent, "if not isinstance(", itmpp.name, ", ", clBaseUnit.name, "): ", itmpp.name, " = ", typeName, "(", itmpp.name, ")");
                        }
                     }
                     out.ds.printxln(sk, indent, "if ", itmpp.name, " is not ", "None", ": ", spaces(memberLen, strlen(itmpp.name)), "self.", itmpp.mp.isProperty ? "" : "impl.", itmpp.name, spaces(memberLen, strlen(itmpp.name)), itmpp.mp.isProperty ? "     " : "", " = ", itmpp.name, dotThis ? ".impl" : "");
                  }
               }
            }
            if(c.cl.type == noHeadClass)
            {
               IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage, typing = true };
               while(itmpp.next(publicOnly))
               {
                  if((itmpp.dm && itmpp.dm.type == normalMember) || (itmpp.pt && itmpp.pt.Set))
                  {
                     // FIX #03 && #05 (8.)
                     out.ds.printxln(sk, "         if ", itmpp.name, " is not ", "None", ": ", spaces(memberLen, strlen(itmpp.name)), "self.", itmpp.name, spaces(memberLen, strlen(itmpp.name)), " = ", itmpp.name);
                  }
               }
            }
//                                                                                      end of __init__                //
// ------------------------------------------------------------------------------------------------------------------- //
//      enumeration values                                                                                             //
// ------------------------------------------------------------------------------------------------------------------- //
            if(c.cl.type == enumClass)
            {
               NamedLink val;
               EnumClassData enumeration = (EnumClassData)c.cl.data;
               for(val = enumeration.values.first; val; val = val.next)
               {
                  char * name = pyGetNoConflictSymbolName(val.name);
                  if((len = strlen(name)) > memberLen) memberLen = len;
                  delete name;
               }
               for(val = enumeration.values.first; val; val = val.next)
               {
                  bool conflict = false;
                  char * name = pyGetNoConflictSymbolName(val.name);
                  out.ds.printx(sk, "   ");
                  out.ds.printx(name, spaces(memberLen, strlen(name) + (conflict ? 1 : 0)));
                  if(hasBase)
                  {
                     if(cBase.cl.type == enumClass)
                        out.ds.printxln(" = ", cBase.name, "(lib.", c.name, "_", val.name, ")");
                     else
                        out.ds.printxln(" = ", cBase.name, "(impl = lib.", c.name, "_", val.name, ")");
                  }
                  else
                  {
                     if(c.isBool)
                        out.ds.printxln(" = lib.", val.name);
                     else
                        out.ds.printxln(" = lib.", c.name, "_", val.name);
                  }
                  delete name;
               }
            }
// ------------------------------------------------------------------------------------------------------------------- //
//      python properties                                                                                              //
// ------------------------------------------------------------------------------------------------------------------- //
            if(c.cl.type == bitClass)
            {
               DataMember dm; IterDataMember itd { c.cl };
               while((dm = itd.next(publicOnly)))
               {
                  char * name = pyGetNoConflictSymbolName(dm.name);
                  // (self.value)
                  out.ds.printx(
                        sk, "", ln,
                        sk, "   @property", ln,
                        sk, "   def ", name, "(self): return ((((self.impl)) & lib.", c.upper, "_", name, "_MASK) >> lib.", c.upper, "_", name, "_SHIFT)", ln,
                        sk, "   @", name, ".setter", ln,
                        sk, "   def ", name, "(self, value): self.value = ((self.impl) & ~(lib.", c.upper, "_", name, "_MASK)) | (((value)) << lib.", c.upper, "_", name, "_SHIFT)", ln);
                  delete name;
               }
            }
            else if(c.cl.type == unitClass)
            {
               BProperty p; IterConversion itc { c.cl };
               if(hasOneToOneBaseConv) // if conversion property to base without get / set
               {
                  out.ds.printx(
                        sk, "   @property", ln,
                        sk, "   def value(self): return self.impl", ln,
                        sk, "   @value.setter", ln,
                        sk, "   def value(self, value): self.impl = value", ln);
               }
               while((p = itc.next(publicOnly)))
               {
                  if(p.pt.Get && p.pt.Set)
                  {
                     double m = 1, b = 0;
                     DataValueType type = c.cl.dataTypeString;
                     bool lS = checkLinearMapping(type, p.pt.Set, &m, &b);
                     char * mS = PrintString(m);
                     bool lG = checkLinearMapping(type, p.pt.Get, &m, &b);
                     char * mG = PrintString(m);
                     out.ds.printx("", ln,
                           sk, "   # conv ", c.baseSymbolName, " <-> ", p.cConv.symbolName, ln,
                           sk, "   @property", ln,
                           sk, "   def value(self): return ", lS ? "self.impl * " : "lib.", lS ? mS : p.fpnSet, lS ? "" : "(self.impl)", ln,
                           sk, "   @value.setter", ln,
                           sk, "   def value(self, value): self.impl = ", lG ? "value * " : "lib.", lG ? mG : p.fpnGet, lG ? "" : "(value)", ln);
                     delete mS;
                     delete mG;
                     break;
                  }
               }
            }
// ------------------------------------------------------------------------------------------------------------------- //
//      next                                                                                                           //
// ------------------------------------------------------------------------------------------------------------------- //
         }
      }

      if(c.cl.type == normalClass)
      {
         if(c.isModule)
            sourceFileProcessToDynamicString(out.ds, ":src/py/py_hardcode_module.src", null, false);
      }

      // members and properties
      {
         IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage, typing = true };
         while(itmpp.next(publicOnly))
         {
            // members
            if(itmpp.dm && itmpp.dm.type == normalMember &&
                  (c.cl.type == noHeadClass || c.cl.type == normalClass || c.cl.type == structClass))
            {
               bool oneliner = true;
               BClass cType = itmpp.type.kind == classType ? g.getClassFromType(itmpp.type, true) : null;
               //BClass cType = p.pt.dataType.kind == classType ? p.pt.dataType._class.registered : null;
               char * typeName = getSimpleDataTypeName(itmpp.type, itmpp.dm.dataTypeString, 0, false, g.lib.ecereCOM, null);
               bool wrap = cType && !cType.isBool && cType.cl.type != systemClass;
               out.ds.printxln(sk, "");
               out.ds.printxln(sk, "   @property");
               out.ds.printx(sk, "   def ", itmpp.name, "(self):");
               if(c.cl.type == structClass || c.cl.type == noHeadClass) // FIX #05 (7.)
               {
               /*if(cType && !cType.isBool && cType.cl.type != systemClass)
               {
                  out.ds.printx("value = ", typeName, "(); ");
                  //v.processDependency(otypedef, otypedef, cType.cl);
               }
               out.ds.printxln("lib.", "_get_", itmpp.name, "(self.impl, value.impl)");*/
                  if(itmpp.type.kind == classType && itmpp.type._class.registered &&
                        (itmpp.type._class.registered.type == unitClass ||
                        itmpp.type._class.registered.type == bitClass || // FIX #06 (11. unclear part about properties)
                        itmpp.type._class.registered.type == structClass))
                     out.ds.printxln(" return ", typeName, "(impl = self.impl.", itmpp.name, ")");
                  // FIX #05 (10.)
                  else if(itmpp.type.kind == classType && itmpp.type._class.registered &&
                        itmpp.type._class.registered.type == normalClass)
                  {
                     if(cType.isString)
                        out.ds.printxln(" return String(self.impl.", itmpp.name, ")");
                     else
                        out.ds.printxln(" return pyOrNewObject(", typeName, ", self.impl.", itmpp.name, ")");
                  }
                  else
                     out.ds.printxln(" return self.impl.", itmpp.name);
               }
               else
                  out.ds.printxln(" return ", wrap ? typeName : "", wrap ? "(impl = " : "", "IPTR(lib, ffi, self, ", c.name, ").", itmpp.name, wrap ? ")" : "");

               out.ds.printxln(sk, "   @", itmpp.name, ".setter");
               out.ds.printx(sk, "   def ", itmpp.name, "(self, value):");
               //if(itmpp.type.kind == classType && itmpp.type._class.registered && itmpp.type._class.registered.type == unitClass)
               if(/*c.cl.type == structClass && */!(typeIsNative(itmpp.type) || typeIsClassNative(itmpp.type) ||
                     typeIsSomething(itmpp.type) || typeHasTemplateClass(itmpp.type)) &&
                     itmpp.type.kind == classType && itmpp.type._class.registered)// &&
                     //itmpp.type._class.registered && reduceUnitClass(itmpp.type._class.registered) != itmpp.type._class.registered)
                     //!c.cl.templateClass)
               {
                  Class clBaseUnit;
                  for(clBaseUnit = itmpp.type._class.registered; clBaseUnit && clBaseUnit.base.type == unitClass; clBaseUnit = clBaseUnit.base);
                  out.ds.println("");
                  out.ds.printxln(sk, "      if not isinstance(value, ", clBaseUnit.name, "): value = ", typeName, "(value)");
                  //out.ds.printxln(sk, "      self.impl.", itmpp.name, " = value");
                  oneliner = false;
               }
               /*if(!isTypePythonNative(itmpp.type) && itmpp.type.kind == classType && !cType.isBool && !cType.isString)
               {
                  if(oneliner) out.ds.printxln("");
                  out.ds.printxln("      if not isinstance(value, ", typeName, "): value = ", typeName, "(value)");
                  oneliner = false;
               }*/
               if(c.cl.type == structClass || c.cl.type == noHeadClass) // FIX #05 (7.)
               {
                  if(cType && (/*cType.cl.type == unitClass || */cType.cl.type == structClass))
                     out.ds.printxln(oneliner ? " " : "      ", "self.impl.", itmpp.name, " = value.impl[0]");
                  else if(cType && (cType.isString || cType.cl.type == unitClass || cType.cl.type == bitClass))
                     out.ds.printxln(oneliner ? " " : "      ", "self.impl.", itmpp.name, " = value.impl");
                  else
                     out.ds.printxln(oneliner ? " " : "      ", "self.impl.", itmpp.name, " = value");
               }
               else
                  out.ds.printxln(oneliner ? " " : "      ", "IPTR(lib, ffi, self, ", c.name, ").", itmpp.name, " = value", wrap ? ".impl" : ""); // value.value
            }
            // properties
            else if(itmpp.pt && itmpp.c == c && !c.isContainer) // FIX #02 // else if(itmpp.pt && !c.isContainer)
            {
               BProperty p = itmpp.pt;
               // property
               {
                  //BClass cType = p.pt.dataType.kind == classType ? g.getClassFromType(p.pt.dataType, true) : null;
                  char * typeName = getSimpleDataTypeName(p.pt.dataType, p.pt.dataTypeString, 0, false, g.lib.ecereCOM, null);
                  const char * sk = (skip || p.pt.dataType.kind == thisClassType) ? "# " : "";
                  out.ds.println("");
                  if(userDataProp && !strcmp(p.fpnGet, userDataProp.fpnGet))
                     out.ds.printxln(sk, "   ", userDataProp.name, " = None");
                  else
                  {
                     out.ds.printxln(sk, "   @property");
                     out.ds.printx(sk, "   def ", itmpp.name, "(self): ");
                     if(!p.pt.Get)
                        out.ds.printxln(sk, "return None");
                     else
                     {
                        switch(p.pt.dataType.kind)
                        {
                           case intType:
                           case int64Type:
                           case floatType:
                           case doubleType:
                              //out.ds.printx("value");
                              out.ds.printx("return lib.", p.fpnGet, "(self.impl)");
                              break;
                           case pointerType:
                              if(p.pt.dataType.type.kind == charType)
                              {
                                 out.ds.printx("value = lib.", p.fpnGet, "(self.impl); ");
                                 out.ds.printx("return None if value == ffi.NULL else ffi.string(value).decode('utf8')");
                              }
                              //else if(p_pt_dataType_type_kind_isPythonNative)
                              /*else if(isTypePythonNative(p.pt.dataType.type) || p.pt.dataType.type.kind == voidType)
                                 out.ds.printx("lib.", p.fpnGet, "(self); ");*/
                              else
                                 out.ds.printx("return lib.", p.fpnGet, "(self.impl)");
                              break;
                           case classType:
                           {
                              BClass cType = p.pt.dataType._class.registered;
                              if(cType.isBool)
                                 out.ds.printx("return lib.", p.fpnGet, "(self.impl)");
                              else if(cType.isString || cType.isCharPtr)
                              {
                                 out.ds.printx("value = lib.", p.fpnGet, "(self.impl) if self is not None and self.impl != ffi.NULL else ffi.NULL; ");
                                 out.ds.printx("return None if value == ffi.NULL else ffi.string(value).decode('utf8')");
                              }
                              else if(cType.cl.type == unitClass)
                              {
                                 out.ds.printx("return ", typeName, "(lib.", p.fpnGet, "(self.impl))");
                              }
                              else if(cType.nativeSpec)
                                 out.ds.printx("return lib.", p.fpnGet, "(self.impl)");
                              else if(cType.cl.type == normalClass)
                              {
                                 /*out.ds.println("");
                                 out.ds.printxln(sk, "      value = lib.", p.fpnGet, "(self.impl)");
                                 out.ds.printxln(sk, "      if value != ffi.NULL: return ", typeName, "(impl = value)");
                                 out.ds.printx(sk, "      else: return None");*/
                                 out.ds.printx("return pyOrNewObject(", typeName, ", lib.", p.fpnGet, "(self.impl))");
                              }
                              else if(cType.cl.type == structClass/* || cType.cl.type == noHeadClass*/)
                              {
                                 out.ds.printx("value = ", typeName, "();");
                                 out.ds.printx(" lib.", p.fpnGet, "(self.impl, ffi.cast(\"", typeName, " *\", value.impl));");
                                 out.ds.print(" return value");
                              }
                              // FIX #05 (15.)
                              else if(cType.cl.type == bitClass)
                                 out.ds.printx("return ", typeName, "(impl = lib.", p.fpnGet, "(self.impl))");
                              else if(cType.cl.type == enumClass)
                              {
                                 bool impl = cType.cl.base.type != systemClass;
                                 out.ds.printx("return lib.", p.fpnGet, "(self.impl, value", impl ? ".impl" : "", ")");
                              }
                              else
                              //{
                              //   out.ds.printx("value = ", typeName, "(); ");
                                 out.ds.printx("return lib.", p.fpnGet, "(self.impl, value.impl)");
                              //}
                              break;
                           }
                           case templateType:
                              out.ds.printx("value = lib.", p.fpnGet, "(self.impl);");
                              out.ds.printx(" return pyOrNewObject(Instance, lib.oTAInstance(value))");
                              break;
                           case subClassType:
                              out.ds.printx("value = Class(); ");
                              out.ds.printx("return lib.", p.fpnGet, "(self.impl, value.impl)");
                              break;
                           case thisClassType:
                              // todo tofix
                              break;
                           default:
                              check();
                        }
                        out.ds.println("");
                     }

                     if(p.pt.Set)
                     {
                        BClass cType = itmpp.type.kind == classType ? itmpp.type._class.registered : null;
                        //List<Class> lineage = cType ? getClassLineage(cType.cl) : null;
                        out.ds.printxln(sk, "   @", itmpp.name, ".setter");
                        out.ds.printxln(sk, "   def ", itmpp.name, "(self, value):");
#if 0
                        if(/*c.cl.type == structClass && */!(typeIsNative(itmpp.type) || typeIsClassNative(itmpp.type) ||
                              typeIsSomething(itmpp.type) || typeHasTemplateClass(itmpp.type)) &&
                              itmpp.type.kind == classType && itmpp.type._class.registered &&
                              /*(itmpp.type._class.registered.type == bitClass || itmpp.type._class.registered.type == unitClass ||
                              itmpp.type._class.registered.type == structClass)*/
                              !cType.isString && !cType.isBool)// &&
                              //itmpp.type._class.registered && reduceUnitClass(itmpp.type._class.registered) != itmpp.type._class.registered)
                              //!c.cl.templateClass)
                           ;
#endif // 0
                        if(/*c.cl.type == structClass && */!(typeIsNative(itmpp.type) || typeIsClassNative(itmpp.type) ||
                              typeIsSomething(itmpp.type) || typeHasTemplateClass(itmpp.type)) &&
                              itmpp.type.kind == classType && itmpp.type._class.registered)// &&
                              //itmpp.type._class.registered && reduceUnitClass(itmpp.type._class.registered) != itmpp.type._class.registered)
                              //!c.cl.templateClass)
                        {
                           Class clBaseUnit;
                           for(clBaseUnit = itmpp.type._class.registered; clBaseUnit && clBaseUnit.base.type == unitClass; clBaseUnit = clBaseUnit.base);
                           //out.ds.println("");
                           out.ds.printxln(sk, "      if not isinstance(value, ", clBaseUnit.name, "): value = ", typeName, "(value)");
                           //out.ds.printxln(sk, "      self.impl.", itmpp.name, " = value");
                           //oneliner = false;
                        }
                        /*if((!mp.isProperty || pt.Set) && !(typeIsNative(itmpp.type) || typeIsClassNative(itmpp.type) ||
                              typeIsSomething(itmpp.type) || typeHasTemplateClass(itmpp.type)) &&
                              reduceUnitClass(cType.cl) != cType.cl)// &&
                              //!c.cl.templateClass)
                        {
                           //const char * typeName = dm.dataType.kind == classType && dm.dataType._class.registered ? dm.dataType._class.registered.itmpp.name : "FixTypeNameIssue"; //getSimpleDataTypeName(dm.dataType, dm.dataTypeString, 0, false, g.lib.ecereCOM, null);
                           Class clBaseUnit;
                           for(clBaseUnit = itmpp.type._class.registered; clBaseUnit && clBaseUnit.base.type == unitClass; clBaseUnit = clBaseUnit.base);
                           out.ds.println("");
                           out.ds.printxln(sk, "         if not isinstance(", itmpp.name, ", ", clBaseUnit.itmpp.name, "): ", itmpp.name, " = ", typeName, "(", itmpp.name, ")");
                           out.ds.print("        ");
                        }*/
                        if((itmpp.type.kind == classType && itmpp.type._class.registered &&
                              itmpp.type._class.registered.type == unitClass) ||
                              (!isTypePythonNative(itmpp.type) && itmpp.type.kind == classType && !cType.isBool && !cType.isString))
                           ; //out.ds.println("");
                        else
                           out.ds.printx("      lib.", p.fpnSet, "(self.impl, ");
                        /*if(isTypePythonNative(itmpp.type) || (itmpp.type.kind == pointerType &&
                              (isTypePythonNative(itmpp.type.type) || itmpp.type.type.kind == voidType)))
                           out.ds.printx("self, ");
                        else
                           out.ds.printx("self.impl, ");*/
                        //if(!strcmp(c.itmpp.name, "Window") && !strcmp(p.itmpp.name, "hasMaximize"))
                        //if(isTypePythonNative(itmpp.type)) // tofix right now (since units aren't derived from int / double / float)
                        //   out.ds.printx("value");         // it would be wrong to say that a unitclass is native and .impl is reqired
                        if(!(itmpp.type.kind == classType && itmpp.type._class.registered &&
                              itmpp.type._class.registered.type == unitClass) && isTypePythonNative(itmpp.type))
                           out.ds.printx("value");
                        else
                        {
                           switch(itmpp.type.kind)
                           {
                              case pointerType:
                                 if(itmpp.type.type.kind == charType)
                                    out.ds.printx("value.encode('utf8')");
                                 else if(isTypePythonNative(itmpp.type.type) || itmpp.type.type.kind == voidType)
                                    out.ds.printx("value");
                                 else
                                    out.ds.printx("value.impl");
                                 break;
                              case classType:
                              {
                                 if(cType.isBool)
                                    out.ds.printx("value");
                                 else if(cType.isString)
                                    out.ds.printx("value.impl.encode('utf8')");
                                 else if(cType.cl.type == structClass/* || cType.cl.type == noHeadClass*/)
                                    out.ds.printx("      lib.", p.fpnSet, "(self.impl, ffi.cast(\"", typeName, " *\", value.impl)");
                                 else if(cType.cl.type == enumClass)
                                 {
                                    bool impl = cType.cl.base.type != systemClass;
                                    out.ds.printx("      lib.", p.fpnSet, "(self.impl, value", impl ? ".impl" : "", "");
                                 }
                                 else
                                 {
                                    //int i = 0;
                                    //const char * comma = "";
                                    //DataMember dm; IterDataMember itd { cType.cl };
                                    //DataMember dm; IterClassHierarchyMemberOrProperty itmp { lineage = lineage };
                                    //out.ds.printxln("      if not isinstance(value, ", typeName, "): value = ", typeName, "(value)");
                                    //out.ds.printx("      if isinstance(value, tuple): value = ", typeName, "(");
                                    //while((dm = itd.next(publicOnly)))
                                    /*while((dm = (DataMember)itmp.next(publicOnly)))
                                    {
                                       if(!dm.isProperty)
                                       {
                                          typeDataMember(dm, itmp.cl);
                                          assert(dm.type == normalMember && dm.itmpp.name);
                                          out.ds.printx(comma, dm.itmpp.name, "=value[", i++, "] if len(value) >= ", i, " else 0");
                                          comma = ", ";
                                       }
                                    }
                                    out.ds.printxln(")");*/
                                    //out.ds.printxln("      else: value = ", typeName, "()");
                                    out.ds.printx("      lib.", p.fpnSet, "(self.impl, value.impl");
                                 }
                                 /*else
                                    out.ds.printx("value.impl");*/
                                 break;
                              }
                              case templateType:
                                 out.ds.printx("TA(value)");
                                 break;
                              default:
                                 check();
                           }
                        }
                        out.ds.println(")"); // value.value
                     }
                     if(p.pt.IsSet)
                     {
                        out.ds.printxln(sk, "   # @", itmpp.name, ".isset # tofix: how do we get isset?");
                        out.ds.printxln(sk, "   # def ", itmpp.name, "(self): lib.", p.fpnIst, "(self.impl)");
                     }
                  }
               }
            }
         }
      }

      if(c.cl.type != unitClass)
      // conversions?
      {
         BProperty p; IterConversion itc { c.cl };
         while((p = itc.next(publicOnly)))
         {
            // conversion
            if(!strcmp(p.name, "int") || !strcmp(p.name, "double") || !strcmp(p.name, "float"))
            {
               const char * type = !strcmp(p.name, "double") ? "float" : p.name;
               out.ds.println("");
               out.ds.printxln(sk, "   def __", type, "__(self): return lib.", p.fpnGet, "(self.impl)");
            }
            else
            {
               out.ds.println("");
               out.ds.printxln(sk, "   # here is a conversion");
               //out.ds.printxln(sk, "   @property");
               out.ds.printxln(sk, "   # ", p.fpnGet);
               out.ds.printxln(sk, "   # ", p.fpnSet);
            }
         }
      }

      // methods
      {
         BMethod m; IterMethod itm { c.cl };
         while((m = itm.next(publicOnly))) //publicVirtual
         {
            m.init(itm.md, c);
            // method
            {
               bool thisClass = m.md.dataType.thisClass && m.md.dataType.thisClass.string;
               const char * classString = thisClass ? !strcmp(m.md.dataType.thisClass.string, "class") ?
                     "Instance" : m.md.dataType.thisClass.string : c.cl.name;
               Type thisType = ProcessTypeString(classString, false);
               char * typeName = printType(thisType, false, false);
               char * name = CopyAllNonCapsString(typeName);
               char * t = new char[2];
               t[0] = (char)tolower(typeName[0]);
               t[1] = 0;
               if(m.md.type == virtualMethod)
               {
                  /*int ap = 0;
                  Type param;
                  out.ds.printx(sk, "   def ", m.mname, "(self");
                  IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
                  while(itr.next(noElipsis/-*tofix: { all = true, ellipsisOn = false }*-/))
                     out.ds.printx(", ", itr.name);
                  out.ds.println("):");
                  out.ds.printx(sk, "      lib.", m.s, "(self.impl");
                  IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
                  while(itr.next(noElipsis/-*tofix: { all = true, ellipsisOn = false }*-/))
                  {
                     if(param.templateParameter)
                        out.ds.printx(", TA(", itr.name, ")");
                     else
                        out.ds.printx(", ", itr.name);
                  }
                  out.ds.println(")");*/
//#if 0 // temporary
                  out.ds.println("");
                  out.ds.printx(sk, "   def fn_unset_", m.s, "(self"); // , m, b, x, y, mods
                     //out.ds.printx(", __", t);
                  if(!m.md.dataType.staticMethod && thisClass)
                     out.ds.printx(", _", name);
                  if(!paramsIsOnlyVoid(&m.md.dataType.params))
                  {
                     IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
                     while(itr.next(noElipsis/*tofix: { all = true, ellipsisOn = false }*/))
                        out.ds.printx(", ", itr.name);
                  }
                  out.ds.println("):");
                  {
                     IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
                     while(itr.next(noElipsis/*tofix: { all = true, ellipsisOn = false }*/))
                     {
                        if(itr.isReturnValue)
                           out.ds.printxln("      if ", itr.name, " is None: ", itr.name, " = ffi.NULL");
                     }
                  }
                  out.ds.printx(sk, "      return lib.", m.s, "(self.impl"); // m.impl, b.impl, x, y, mods
                     //out.ds.printx(", __", t);
                  if(!m.md.dataType.staticMethod && thisClass)
                     out.ds.printx(", _", name, c && c.cl.type == normalClass ? ".impl" : "");
                  if(!paramsIsOnlyVoid(&m.md.dataType.params))
                  {
                     IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
                     while(itr.next(noElipsis/*tofix: { all = true, ellipsisOn = false }*/))
                     {
                        bool ptr = itr.isNullable;
                        //BClass c = itr.pm.kind == classType ? g.getClassFromType(itr.pm, true) : null;
                        out.ds.printx(", ", ptr ? "ffi.NULL if " : "", ptr ? itr.name : "", ptr ? " is None else " : "", itr.name, ptr ? ".impl" : ""/*, c && c.cl.type == normalClass ? ".impl" : ""*/);
                     }
                  }
                  out.ds.printxln(")");
                  out.ds.println("");
                  out.ds.printx(sk, "   @property", ln,
                                sk, "   def ", m.mname, "(self):", ln,
                                sk, "      if hasattr(self, 'fn_", m.s, "'): return self.fn_", m.s, ln,
                                sk, "      else: return self.fn_unset_", m.s, ln,
                                sk, "   @", m.mname, ".setter", ln,
                                sk, "   def ", m.mname, "(self, value):", ln,
                                sk, "      self.fn_", m.s, " = value", ln,
                                sk, "      lib.Instance_setMethod(self.impl, \"", m.name, "\".encode('utf8'), cb_", m.s, ")", ln);
                  delete t;
                  delete name;
                  delete typeName;
//#endif 0 // temporary
               }
               else if(m.md.type == normalMethod)
               {
                  int multireturn = 0;
                  out.ds.println("");
                  out.ds.printx(sk, "   def ", m.mname, "(self");
                  if(!paramsIsOnlyVoid(&m.md.dataType.params))
                  {
                     IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
                     while(itr.next(noElipsis/*tofix { all = true, ellipsisOn = false }*/))
                     {
                        if(itr.isReturnValue)
                           multireturn++;
                     }
                  }
                  if(!paramsIsOnlyVoid(&m.md.dataType.params))
                  {
                     IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
                     // TODO: Iterate with prev() and keep a flag that = None can be added rather than checking .last
                     while(itr.next(noElipsis/*tofix: { all = true, ellipsisOn = false }*/))
                     {
                        if(itr.isReturnValue) continue;
                        // FIX #05
                        //out.ds.printx(", ", itr.name, itr.last && itr.isNullable ? " = None" : "");
                        {
                           bool defNone = itr.last && itr.isNullable && itr.pm.constant;
                           out.ds.printx(", ", itr.name, defNone ? " = None" : "");
                        }
                     }
                  }
                  out.ds.printxln("):");
                  /*if(!paramsIsOnlyVoid(&m.md.dataType.params))
                  {
                     IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
                     while(itr.next(noElipsis/-*tofix: { all = true, ellipsisOn = false }*-/))
                     {
                        if(itr.isReturnValue || !(itr.last && itr.isNullable)) continue;
                        out.ds.printxln("      if ", itr.name, " is None: ", itr.name, " = ffi.NULL");
                     }
                  }*/
                  //if region is None: region = ffi.NULL
                  //if(multireturn)
                  if(!paramsIsOnlyVoid(&m.md.dataType.params))
                  {
                     IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
                     while(itr.next(noElipsis/*tofix: { all = true, ellipsisOn = false }*/))
                     {
                        if(itr.isReturnValue)
                        {
                           char * _type = printType(itr.pm, false, false);
                           char * type = getNoNamespaceString(_type, null, false);
                           if(itr.isNoHead)
                              out.ds.printxln("      ", itr.name, " = ffi.cast(\"", type, " *\", lib.Instance_new(lib.class_", type, "))"); //int *
                           else
                              out.ds.printxln("      ", itr.name, " = ffi.new(\"", type, itr.isStruct ? " *" : "", "\")"); //int *
                           delete _type;
                           delete type;
                        }
                        else if(!(typeIsNative(itr.pm) || typeIsClassNative(itr.pm) ||
                              typeIsSomething(itr.pm) || typeHasTemplateClass(itr.pm) || itr.pm.kind == intPtrType))// &&
                              //itr.pm._class.registered && reduceUnitClass(itr.pm._class.registered) != itr.pm._class.registered)
                        {
                           char * name = pyGetNoConflictSymbolName(itr.pm.name);
                           const char * typeName = itr.pm.kind == classType && itr.pm._class.registered ? itr.pm._class.registered.name : "FixTypeNameIssue"; //getSimpleDataTypeName(itr.pm, itr.pm.dataTypeString, 0, false, g.lib.ecereCOM, null);
                           Class clBaseUnit;
                           for(clBaseUnit = itr.pm._class.registered; clBaseUnit && clBaseUnit.base.type == unitClass; clBaseUnit = clBaseUnit.base);
                           out.ds.printxln(sk, "      if ", name, " is not None and not isinstance(", name, ", ", clBaseUnit.name, "): ", name, " = ", typeName, "(", name, ")");
                           if(itr.pm.kind == classType && itr.pm._class.registered && itr.pm._class.registered.type == structClass)
                              //out.ds.printxln(sk, "      ", name, " = ffi.NULL if ", name, " is None else ffi.cast(\"", typeName, " *\", ", name, ".impl)");
                              out.ds.printxln(sk, "      ", name, " = ffi.NULL if ", name, " is None else ", name, ".impl");
                           else
                              out.ds.printxln(sk, "      if ", name, " is None: ", name, " = ", "ffi.NULL");
                           //out.ds.printxln(sk, "      if ", name, " is None: ", name, " = ", "ffi.NULL");
                           //out.ds.printx(sk, "      elif not isinstance(", name, ", ", clBaseUnit.name, "): ", name, " = ", typeName, "(", name, ")");
                           //if(itr.pm.kind == classType && itr.pm._class.registered && itr.pm._class.registered.type == structClass)
                           //   out.ds.printxln("; ", name, " = ffi.cast(\"", typeName, " *\", ", name, ".impl)");
                           //else
                           //   out.ds.println("");
                           delete name;
                        }
                     }
                  }
                  if(typeReturnTypeRequiresPyObj(m.md.dataType))
                  {
                     // FIX #04
                     Class clRT = m.md.dataType.returnType._class.registered;
                     if(clRT.templateClass) clRT = clRT.templateClass;
                     out.ds.printx(sk, "      return pyOrNewObject(", clRT.name, ", lib.", m.s, "(self.impl");
                  }
                  else if(c.cl.type == structClass)
                     out.ds.printx(sk, "      lib.", m.s, "(ffi.cast(\"", c.name, c.cl.type == structClass ? " *" : "", "\", self.impl)");
                  else
                  {
                     // FIX #05
                     bool ret = !multireturn && m.md.dataType.returnType.kind != voidType;
                     out.ds.printx(sk, "      ", ret ? "return " : "", "lib.", m.s, "(self.impl");
                  }
                  if(!paramsIsOnlyVoid(&m.md.dataType.params))
                  {
                     IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
                     while(itr.next(noElipsis/*tofix: { all = true, ellipsisOn = false }*/))
                     {
                        char * _type = printType(itr.pm, false, false);
                        char * type = getNoNamespaceString(_type, null, false);
                        bool cast = itr.pm.kind == classType && itr.pm._class.registered && itr.pm._class.registered.type == structClass;
                        printArgPassing(out, itr.name, type, itr.pm, false, false, cast);
                        delete type;
                        delete _type;
                        /*BClass c = itr.pm.kind == classType ? g.getClassFromType(itr.pm, true) : null;
                        out.ds.printx(", ", apname ? apname : name, c && c.cl.type == normalClass ? ".impl" : "");*/
                     }
                  }
                  if(typeReturnTypeRequiresPyObj(m.md.dataType))
                     out.ds.print(")");
                  out.ds.println(")");
                  if(multireturn > 0)
                  {
                     const char * comma = "";
                     IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
                     out.ds.print("      return ");
                     while(itr.next(noElipsis/*tofix: { all = true, ellipsisOn = false }*/))
                     {
                        if(itr.isReturnValue)
                        {
                           if(multireturn > 1)
                           {
                              out.ds.printx(comma, itr.name, "[0]");
                              if(!*comma) comma = ", ";
                           }
                           else
                           {
                              const char * typeName = itr.pm.type.kind == classType && itr.pm.type._class.registered ? itr.pm.type._class.registered.name : "FixTypeNameIssue"; //getSimpleDataTypeName(itr.pm, dm.dataTypeString, 0, false, g.lib.ecereCOM, null);
                              out.ds.printxln(typeName, "(impl = ", itr.name, ")");
                              break;
                           }
                        }
                     }
                     out.ds.println("");
                  }
               }
            }
         }
      }
      if(c.cl.type == unitClass)
      {
         out.ds.printxln("");
         out.ds.printxln(sk, c.symbolName, ".buc = ", cBase.cl.type == unitClass ? cBase.symbolName : c.symbolName);
      }
      // end of class
   }
}

void initArguments(PythonGen g, BClass c, BVariant v, BOutput out, const char * sk, List<Class> lineage, List<Class> lin,
      ClassHierarchyMemberOrPropertyFilter filter, bool hasUnion, int lineEachIndent, int * _memberLen, int * _otherCount)
{
   int len;
   int memberLen = *_memberLen;
   int otherCount = *_otherCount;
   if(c.cl.type == normalClass && c.cl.templateParams.count) // todo? or base's or base's base's, etc?
      out.ds.print(", templateParams = None");
   if(c.cl.type == unitClass)
   {
      if(c.cl.base.type == systemClass)
         out.ds.print(", impl = 0");
      else if(c.cl.base.type == unitClass)
         out.ds.print(", value = 0, impl = None");
      else check();
   }
   else if(c.cl.type != enumClass)
   {
      int lenx = strlen(c.name);
      IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lin, typing = true };
      while(itmpp.next(filter))
      {
         if(itmpp.dm && itmpp.dm.type != normalMember) continue;
         if(c.cl.type == bitClass)
         {
            const char * zeroVal = getTypeZeroValuePy(g, itmpp.type, v);
            if(!(strlen(zeroVal) == lenx + 2 && !strncmp(zeroVal, c.name, lenx)))
            {
               out.ds.printx(", ", itmpp.name, " = ", zeroVal);
               if((len = strlen(itmpp.name)) > memberLen) memberLen = len;
               if(itmpp.type.kind == classType && itmpp.type._class &&
                     itmpp.type._class.registered && itmpp.type._class.registered.type == bitClass)
               {
                  if((len = strlen(itmpp.name) + 5) > memberLen) memberLen = len;
               }
            }
         }
         else if(c.cl.type == normalClass)
         {
            printClassInitArgument(out, g, itmpp.name, null, lineEachIndent, &memberLen, v);
            otherCount++;
         }
         else
         {
            bool useNone = c.cl.type == noHeadClass || itmpp.pt || !isTypePythonNative(itmpp.dm.dataType) || hasUnion;
            printClassInitArgument(out, g, itmpp.name, useNone ? null : itmpp.dm.dataType, lineEachIndent, &memberLen, v);
         }
      } //itmpp.reset();
   }
   if(c.cl.type == normalClass)
   {
      for(ccc : lineage)
      {
         BClass cc = ccc;
         if(cc.is_class || cc.isInstance) continue;
         // virtual method __init__ parameters
         {
            BMethod m; IterMethod itm { cc.cl };
            while((m = itm.next(publicVirtual)))
            {
               m.init(itm.md, cc);
               printClassInitArgument(out, g, m.mname, null, lineEachIndent, &memberLen, v);
            }
         }
      }
   }
   if(otherCount && c.cl.type == normalClass)
   {
      //out.ds.println(",");
      //out.ds.print("                impl = None");

      out.ds.print(",");
      if(lineEachIndent) out.ds.printx(ln, spaces(lineEachIndent, 0));
      out.ds.printx(lineEachIndent ? "" : " ", "impl = None");

      //out.ds.printx(",", " ", "impl = None");
   }
   // FIX #05 (8.)
   else if(c.cl.type == structClass || c.cl.type == bitClass || c.cl.type == noHeadClass || c.cl.type == normalClass)
   {
      out.ds.print(",");
      if(lineEachIndent) out.ds.printx(ln, spaces(lineEachIndent, 0));
      out.ds.printx(lineEachIndent ? "" : " ", "impl = None");
   }
   if(c.cl.type != enumClass)
      out.ds.println("):");
   *_memberLen = memberLen;
   *_otherCount = otherCount;
}

void theCallbacks(PythonGen g, BClass c, BOutput out, const char * sk, BProperty userDataProp)
{
   ParamFilter noElipsis { all = true };
   // methods
   {
      BMethod m; IterMethod itm { c.cl };
      while((m = itm.next(publicOnly))) //publicVirtual
      {
         m.init(itm.md, c);
         // method
         if(m.md.type == virtualMethod)
         {
            //int ap = 0;
            bool prevParam = false;
            bool thisClass = m.md.dataType.thisClass && m.md.dataType.thisClass.string;
            bool thisTemplate = m.md.dataType.thisClassTemplate != null;
            bool anyObject = thisClass && !strcmp(m.md.dataType.thisClass.string, "class");
            const char * classString = thisTemplate ? "uint64" : (!thisClass || anyObject) ?
                  c.cl.name : m.md.dataType.thisClass.string;
            Type thisType = ProcessTypeString(classString, false);
            //Type type = ProcessTypeString(c.cl.name, false);
            char * typeName = printType(thisType, false, false);
            char * iname = null;// = CopyAllNonCapsString(c.cl.name);
            char * t = PrintString("__", "x"); //new char[2];
            TypeInfo qti;
            out.ds.println("");
            out.ds.printx(sk, "@ffi.callback(\"void(");
            t[2] = (char)tolower(typeName[0]);
            //t[1] = 0;
            //if(!m.md.dataType.staticMethod && thisClass)
               out.ds.printx(typeName), prevParam = true;
            if(!thisClass || !strcmp(c.cl.name, m.md.dataType.thisClass.string))
               iname = CopyAllNonCapsString(c.cl.name);
            if(!paramsIsOnlyVoid(&m.md.dataType.params))
            {
               IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
               while(itr.next(noElipsis/*tofix: { all = true, ellipsisOn = false }*/))
               {
                  bool isStruct = itr.isStruct;
                  char * modern = strTypeName("", (qti = { type = itr.pm, cl = c.cl }), { anonymous = true }, null); delete qti;
                  if(!iname && !strcmp(c.cl.name, modern))
                     iname = CopyString(itr.name);
                  if(itr.pm.kind == templateType)
                  {
                     TemplateParameter tp = itr.pm.templateParameter;
                     Class cl = null;
                     ClassTemplateParameter ctp = findClassTemplateParameter(tp.identifier.string, c.cl, &cl);
                     if(tp.type == type && tp.identifier && tp.identifier.string)
                     {
                        char * type = g.allocMacroSymbolName(false, TP, c.name, ctp.name, 0);
                        out.ds.printx(prevParam ? ", " : "", type);
                        prevParam = true;
                        delete type;
                     }
                     else check();
                  }
                  else
                  {
                     char * type = printType(itr.pm, false, false);
                     //if(strcmp(type, modern)) check();
                     out.ds.printx(prevParam ? ", " : "", modern, isStruct ? " *" : "");
                     prevParam = true;
                     delete type;
                  }
                  delete modern;
               }
               /*IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
               while(itr.next(noElipsis/-*tofix: { all = true, ellipsisOn = false }*-/))
               {
                  bool isStruct = param_isStruct;
                  char * modern = strTypeName("", (qti = { type = itr.pm, cl = c.cl }), { anonymous = true }, null); delete qti;
                  if(!iname && !strcmp(c.cl.name, modern))
                     iname = CopyString(itr.name);
                  if(itr.pm.kind == templateType)
                  {
                     TemplateParameter tp = itr.pm.templateParameter;
                     Class cl = null;
                     ClassTemplateParameter ctp = findClassTemplateParameter(tp.identifier.string, c.cl, &cl);
                     if(tp.type == type && tp.identifier && tp.identifier.string)
                     {
                        char * type = g.allocMacroSymbolName(false, TP, c.name, ctp.name, 0);
                        out.ds.printx(prevParam ? ", " : "", type);
                        prevParam = true;
                        delete type;
                     }
                     else check();
                  }
                  else
                  {
                     //int p;
                     //int ptr = 0;
                     char * type = printType(itr.pm, false, false);
                     // todo tofix -- getSimpleDataTypeName is no longer used anywher... astTypeSpec would be where the newer code is
                     //Type tx = unwrapPointerType(itr.pm, &ptr);
                     //char * simple = getSimpleDataTypeName(tx, type, ptr, true, false, null);
                     //char * modern = strTypeName("", (qti = { type = itr.pm, cl = c.cl }), { anonymous = true }, null); delete qti;
                     //if(!strcmp(simple, "class") && !strcmp(type, "any_object"))
                     //   delete simple, simple = CopyString(type);
                     //bool a = strstr(type, "const ") == type;
                     //bool b = !strcmp(type, type + 6);
                     //char * t = type + 6;
                     //while(simple[(p = strlen(simple) - 1)] == ' ')
                     //   simple[p] = 0;
                     //if(!strcmp(simple, "bool"))
                     //   simple[0] = 'B';
                     //if(strstr(type, "const ") == type && !strcmp(type + 6, simple))
                     //   ;
                     //else if(strcmp(type, simple))
                     //   check();
                     //if(!strcmp(modern, "bool"))
                     //   delete modern, modern = CopyString("uint32_t");
                     if(strcmp(type, modern))
                        check();
                     out.ds.printx(prevParam ? ", " : "", modern, isStruct ? " *" : "");
                     prevParam = true;
                     delete type;
                     //delete simple;
                  }
                  delete modern;
               }*/
            }
            out.ds.println(")\")");
            out.ds.printx(sk, "def cb_", m.s, "(");
            prevParam = false;
            //if(!m.md.dataType.staticMethod && thisClass)
               out.ds.print(t), prevParam = true;
            if(!paramsIsOnlyVoid(&m.md.dataType.params))
            {
               IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
               while(itr.next(noElipsis/*tofix: { all = true, ellipsisOn = false }*/))
               {
                  out.ds.printx(prevParam ? ", " : "", itr.name);
                  prevParam = true;
               }
            }
            out.ds.println("):");
            if(!iname)
               iname = CopyAllNonCapsString(c.cl.name);
            if(thisClass)
            {
               char * userDataName = userDataProp ? PrintString(".", userDataProp.name) : CopyString("");
               out.ds.printxln("   ", iname, " = pyOrNewObject(", c.cl.name, ", ", anyObject ? t : iname, ")");
               out.ds.printx("   ", iname, ".fn_", m.s, "(",
                     anyObject ? "" : "pyOrNewObject(", anyObject ? "" : c.cl.name, anyObject ? "" : ", ", anyObject ? iname : t,
                     anyObject ? userDataName : "", anyObject ? "" : ")");
               delete userDataName;
            }
            else if(thisTemplate)
            {
               Type param = m.md.dataType.params.first;
               out.ds.printxln("   ", iname, " = pyOrNewObject(", c.cl.name, ", ", param.name, ")");
               out.ds.printx("   ", iname, ".fn_", m.s, "(pyObject(lib.oTAInstance(", t, "))");
            }
            else
            {
               out.ds.printxln("   ", iname, " = pyOrNewObject(", c.cl.name, ", ", t, ")");
               out.ds.printx("   ", iname, ".fn_", m.s, "(", iname);
            }
            if(!paramsIsOnlyVoid(&m.md.dataType.params))
            {
               IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
               while(itr.next(noElipsis/*tofix: { all = true, ellipsisOn = false }*/))
               {
                  bool first = thisClass && itr.pm == m.md.dataType.params.first;
                  char * _type = printType(itr.pm, false, false);
                  char * type = getNoNamespaceString(_type, null, false);
                  if(thisTemplate && itr.pm == m.md.dataType.params.first)
                     out.ds.printx(", ", iname);
                  else
                     printArgPassing(out, itr.name, type, itr.pm, true, first, false);
                  delete type;
                  delete _type;
               }
            }
            out.ds.println(")");
            //out.ds.println("");
            FreeType(thisType);
            //FreeType(type);
            delete t;
            delete typeName;
            delete iname;
         }
         //else if(m.md.type == normalMethod) { }
      }
   }
}

static void printArgPassing(BOutput out, const char * name, const char * type, Type param, bool callback, bool plain, bool cast)
{
   switch(param.kind)
   {
      case voidType:
         break;
      case charType: case shortType: case intType:
      case int64Type: case int128Type: case longType: case floatType:
      case doubleType: case intPtrType:
         out.ds.printx(", ", name);
         break;
      case pointerType:
      {
         switch(param.type.kind)
         {
            case charType:
               out.ds.printx(", ", name, ".encode('utf8')");
               break;
            case voidType: case shortType: case intType:
            case int64Type: case int128Type: case longType: case floatType:
            case doubleType: case intPtrType:
            case classType:
            case pointerType:
               out.ds.printx(", ", name);
               break;
            case functionType:
               break;
            default:
               check();
         }
         break;
      }
      case classType:
      {
         BClass c = param._class.registered;
         if(c && (c.nativeSpec || c.isBool || (c.is_class && !strcmp(type, "typed_object &"))))
            out.ds.printx(", ", name);
         else if(c && c.cl.templateClass)
         {
            char * str = strchr(type, '<');
            if(callback)
               out.ds.printx(", ", c.cl.templateClass.name, "(\"", str, "\", impl = ", name, ")");
            else // todo tofix likely not right // only 3 instances of this :P
               out.ds.printx(", ", c.cl.templateClass.name, c && c.cl.type == normalClass ? ".impl" : "");
         }
         else
         {
            if(plain)
               out.ds.printx(", ", name);
            else if(callback)
            {
               if(!c)
                  c = eSystem_FindClass(__thisModule.application, param._class.string);   // Cheat for ec module depending on ecere module
               if(c.cl.type == normalClass)
                  out.ds.printx(", pyOrNewObject(", type, ", ", name, ")");
               else
                  out.ds.printx(", ", type, "(impl = ", name, ")");
            }
            else if(cast)
               out.ds.printx(", ", "ffi.cast(\"", c.name, " *\", ", name/*, c && c.cl.type == normalClass ? ".impl" : ""*/, ")");
            else
            {
               //bool ptr = true;
               //if(c.cl.type == structClass)
               //   out.ds.printx(", ", "ffi.cast(\"", c.name, " *", "\", ", name, ".impl)");
               //else
               //   out.ds.printx(", ", ptr ? "ffi.NULL if " : "", ptr ? name : "", ptr ? " is None else " : "", name, ptr ? ".impl" : ""/*, c && c.cl.type == normalClass ? ".impl" : ""*/);
               //out.ds.printx(", ", prefix ? "__i_" : "", name/*, c && c.cl.type == normalClass ? ".impl" : ""*/);
               out.ds.printx(", ", name/*, c && c.cl.type == normalClass ? ".impl" : ""*/);
            }
         }
         break;
      }
      case templateType:
         out.ds.printx(", ", "TA(", name, ")");
         break;
      default:
         if(!strcmp(type, "const String") || !strcmp(type, "String") || !strcmp(type, "const char *") || !strcmp(type, "char *"))
            out.ds.printx(", ", name, ".encode('utf8')");
         else if(param.kind == classType && param._class && param._class.registered/* && param._class.registered.type == normalClass*/)
            out.ds.printx(", ", type, "(impl = ", name, ")");
         else
            out.ds.printx(", ", name);
   }
}

bool classHasContent(PythonGen g, BClass c)
{
   if(c.isInstance || c.isArray)
      return true;
   if(c.cl.type == structClass || c.cl.type == noHeadClass)
      return true;
   else if(c.cl.type == bitClass)
   {
      DataMember dm; IterDataMember itd { c.cl };
      while((dm = itd.next(publicOnly)))
         return true;
   }
   else if(c.cl.type == unitClass/* && c.cl.base.type == unitClass*/)
      return true;
   else if(c.cl.type == enumClass)
   {
      NamedLink val;
      EnumClassData enumeration = (EnumClassData)c.cl.data;
      for(val = enumeration.values.first; val; val = val.next)
         return true;
   }
   else if(c.cl.type == normalClass)
   {
      if(/*c.isString || (*/c.isWindow && g.lib.ecereCOM)//))
         return false;
      return true;
   }
   else if(c.cl.type == noHeadClass);
   /*else if(c.cl.type == enumClass)
   {
      EnumClassData enumeration = (EnumClassData)c.cl.data;
      if(enumeration.values.count)
         return true;
   }*/
   //
   {
      BProperty p; IterProperty itp { c.cl };
      while((p = itp.next(publicOnly)))
         return true;
   }

   // methods
   {
      BMethod m; IterMethod itm { c.cl };
      while((m = itm.next(publicOnly))) //publicVirtual
         return true;
   }

   return false;
}

static void printClassInitArgument(BOutput out, PythonGen g, const char * name, Type type, int lineEachIndent, int * len, BVariant v)
{
   int l;
   const char * zeroVal = type ? getTypeZeroValuePy(g, type, v) : "None";
   out.ds.print(",");
   if(lineEachIndent) out.ds.printx(ln, spaces(lineEachIndent, 0));
   out.ds.printx(lineEachIndent ? "" : " ", name, " = ", zeroVal);
   if((l = strlen(name)/* + strlen(zeroVal)*/) > *len) *len = l;
}

static const char * getTypeZeroValuePy(PythonGen g, Type t, BVariant v)
{
   TokenType2 typeToken = tokenType(t);
   const char * typeString = typeToken == none ? tokenTypeString(t) : null;
   Class cl = typeString ? eSystem_FindClass(g.mod, typeString) : null;
   //if(cl) cl = reduceUnitClass(cl);
   if(t.kind == pointerType)
      return "None";
   switch(typeToken)
   {
      case _void:
      case _char:
      case _short:
      case _int:
      case _uint:
      case _int64:
      //case _uint64:
      case _long:
      case _int128:
      //case _uint128:
         return "0";
      case _float:
      case _double:
         return "0.0";
      case none:
      default:
         if(cl)
         {
            BClass c = cl;
            if(c.isBool)
               return "False";
            if(cl.type == bitClass)
            {
               //v.processDependency(otypedef, otypedef, cl);
               return "0"; // return c.py_initializer;
            }
            else if(cl.type == unitClass)
            {
               //v.processDependency(otypedef, otypedef, cl);
               return "0"; // return c.py_initializer;
            }
            else if(cl.type == enumClass)
               return "0";
            else if(cl.type == systemClass)
               return "0";
            else
               return "None";
         }
         else if(typeString)
            return "False"; // wrong, fix it
   }
   return "None"; //return "Error";
}

static void generatePY(File out, PythonGen g, String path)
{
   for(libDep : g.libDeps)
      out.PrintLn("from py", libDep.bindingName, " import *");
   out.PrintLn("from _py", g.lib.bindingName, " import *");
   if(g.lib.ecereCOM)
   {
      out.PrintLn("import sys");
      out.PrintLn("import inspect");
      out.PrintLn("import os");
      out.PrintLn("");
      out.PrintLn("app = None");
   }
   if(g.lib.ecereCOM)
      sourceFileProcessToFile(out, ":src/py/py_functions_ec_begin.src", null, false);

   //pyNamespaces(out, g);
   //pySortedNamespaces(out, g);

   thatThing(out, g);

   if(g.lib.ecereCOM)
      sourceFileProcessToFile(out, ":src/py/py_functions_ec_end.src", null, false);
}

static void thatThing(File out, PythonGen g)
{
   AVLTree<UIntPtr> nodes { };
   for(nn : g.bmod.orderedNamespaces)
   {
      BNamespace n = nn;
      /*for(a : n.output)
         g.astAdd(a, false);*/
      if(n.orderedBackwardsOutputs.count)
      {
         /*if(!python)
            g.astAdd(ASTRawString { string = CopyString("// start -- moved backwards outputs") }, true);*/
         for(optr : n.orderedBackwardsOutputs)
         {
            BOutput o = (BOutput)optr;
            out.Puts(o.ds.array);
         }
         /*if(!python)
            g.astAdd(ASTRawString { string = CopyString("// end -- moved backwards outputs") }, true);*/
      }
      for(optr : n.orderedOutputs)
      {
         BOutput o = (BOutput)optr;
         //o.print();
         if(o.kind == vmanual || o.kind == vdefine || o.kind == vfunction ||
               o.kind == vclass || o.kind == vtemplaton || o.kind == vmethod || o.kind == vproperty)
         {
            out.Puts(o.ds.array);
         }
         else check();
      }
   }
   delete nodes;
   {
      const String moduleName = g.lib.name;
      if(!g.lib.ecere && !g.lib.ecereCOM)
      {
         out.PrintLn("");
         out.PrintLn("def py", moduleName, "_setup(app):");
         out.PrintLn("   app.appGlobals.append(globals())");
         out.PrintLn("   if lib.", moduleName, "_init(app.impl) == ffi.NULL: raise Exception(\"Failed to load library\")");
         // register all normal classes
         {
            IterNamespace itn { module = g.mod };
            while(itn.next())
            {
               BClass c; IterClass itc { itn.ns };
               while((c = itc.next(all)))
               {
                  if(c.cl.type == normalClass && !c.cl.templateClass)
                     out.PrintLn("   app.registerClass(", c.name, ", True)");
               }
            }
            itn.cleanup();
         }
      }
   }
}

static void generateBUILD(File out, PythonGen g)
{
   bool hasEC = false;
   for(libDep : g.libDeps)
   {
      if(libDep.ecereCOM)
      {
         hasEC = true;
         break;
      }
   }

   if(g.libDeps.count == 0)
      out.PrintLn("from cffi import FFI");
   else
   {
      Library libDep = g.libDeps.lastIterator.data;
      for(ld : g.libDeps)
      {
         if(!ld.ecereCOM && !ld.ecere && !ld.eda)
         {
            libDep = ld;
            break;
         }
      }
      out.Print("from build_", libDep.bindingName, " import FFI");
      if(!hasEC)
         out.Print(", ffi_eC");
      for(libDep : g.libDeps)
         out.Print(", ffi_", libDep.bindingName);
      out.PrintLn("");
   }
   out.PrintLn("");
   out.PrintLn("ffi_", g.lib.bindingName, " = FFI()");
   for(libDep : g.libDeps)
      out.PrintLn("ffi_", g.lib.bindingName, ".include(ffi_", libDep.bindingName, ")");
   out.PrintLn("ffi_", g.lib.bindingName, ".cdef(open('cffi-", g.lib.bindingName, ".h').read())");
   out.PrintLn("ffi_", g.lib.bindingName, ".set_source(\"_py", g.lib.bindingName, "\","); // Ecere
   out.PrintLn("               '#include \"", g.lib.bindingName, ".h\"',");
   //out.PrintLn("               sources=[\"../c/", g.lib.bindingName, ".c\", \"../c/ecere.c\"],"); // todo
   /*if(g.lib.ecere)
      out.PrintLn("               sources=[\"../c/eC.c\", \"../c/", g.lib.bindingName, ".c\"],"); // todo
   else*/
      out.PrintLn("               sources=[\"../c/", g.lib.bindingName, ".c\"],"); // todo
   out.PrintLn("               define_macros=[('BINDINGS_SHARED', None), ('", g.lib.defineName, "_EXPORT', None)],");
   out.PrintLn("               extra_compile_args=[\"-O2\"],");
   out.PrintLn("               include_dirs=[\"../c\"],"); // todo
   /*out.Print("                 libraries=[\"", g.lib.moduleName, "\"");
   for(libDep : g.libDeps)
      out.Print(", \"_py", libDep.bindingName, ".pyd\"");
   //out.PrintLn("],");*/
   out.PrintLn("               libraries=[\"ecere\"],");
   if(g.libDeps.count)
   {
      bool first = true;
      bool ecere = false;
      bool ecereCOM = false;
      out.Print("               extra_link_args=[");
      for(libDep : g.libDeps/*; !libDep.ecereCOM*/)
      {
         if(libDep.ecereCOM) ecereCOM = true;
         if(libDep.ecere) ecere = true;
         out.Print(!first ? ", " : "", "\"_py", libDep.bindingName, ".pyd\"");
         first = false;
      }
      if(ecere && !ecereCOM)
         out.Print(!first ? ", " : "", "\"_pyeC.pyd\"");
      out.PrintLn(", \"-O2\"],");
   }

   out.PrintLn("               library_dirs=[\"C:/Program Files/Ecere SDK/bin\""/*, g.libDeps.count ? ", \".\"" : ""*/, "])"); // todo
   out.PrintLn("");
   out.PrintLn("if __name__ == \"__main__\":");
   out.PrintLn("    ffi_", g.lib.bindingName, ".compile(verbose=True)");
}

static void generateEPJ(File out, PythonGen g)
{
   out.PrintLn("{");
   out.PrintLn("   \"Version\" : 0.2,");
   out.PrintLn("   \"ModuleName\" : \"cffi", g.lib.bindingName, "\",");
   out.PrintLn("   \"Options\" : {");
   out.PrintLn("      \"Warnings\" : \"All\",");
   out.PrintLn("      \"IncludeDirs\" : [");
   out.PrintLn("         \"../c\"");
   out.PrintLn("      ],");
   out.PrintLn("      \"TargetType\" : \"SharedLibrary\",");
   out.PrintLn("      \"TargetFileName\" : \"_py", g.lib.bindingName, "\",");
   out.PrintLn("      \"Libraries\" : [");
   out.PrintLn("         \"", g.lib.moduleName, "\",");
   out.PrintLn("         \"python34\"");
   out.PrintLn("      ]");
   out.PrintLn("   },");
   out.PrintLn("   \"Configurations\" : [");
   out.PrintLn("      {");
   out.PrintLn("         \"Name\" : \"Debug\",");
   out.PrintLn("         \"Options\" : {");
   out.PrintLn("            \"Debug\" : true,");
   out.PrintLn("            \"Optimization\" : \"None\",");
   out.PrintLn("            \"PreprocessorDefinitions\" : [");
   out.PrintLn("               \"_DEBUG\"");
   out.PrintLn("            ],");
   out.PrintLn("            \"FastMath\" : false,");
   out.PrintLn("            \"PostbuildCommands\" : [");
   out.PrintLn("               \"$(call cp,obj/debug.$(PLATFORM)$(COMPILER_SUFFIX)/_py", g.lib.bindingName, ".dll,_py", g.lib.bindingName, ".pyd)\"");
   out.PrintLn("            ]");
   out.PrintLn("         }");
   out.PrintLn("      },");
   out.PrintLn("      {");
   out.PrintLn("         \"Name\" : \"Release\",");
   out.PrintLn("         \"Options\" : {");
   out.PrintLn("            \"Debug\" : false,");
   out.PrintLn("            \"Optimization\" : \"Speed\",");
   out.PrintLn("            \"FastMath\" : true");
   out.PrintLn("         }");
   out.PrintLn("      }");
   out.PrintLn("   ],");
   out.PrintLn("   \"Files\" : [");
   out.PrintLn("      {");
   out.PrintLn("         \"Folder\" : \"c\",");
   out.PrintLn("         \"Files\" : [");
   out.PrintLn("            \"../c/", g.lib.bindingName, ".c\",");
   out.PrintLn("            \"../c/", g.lib.bindingName, ".h\"");
   out.PrintLn("         ]");
   out.PrintLn("      },");
   out.PrintLn("      {");
   out.PrintLn("         \"Folder\" : \"generated\",");
   out.PrintLn("         \"Files\" : [");
   out.PrintLn("            \"./_py", g.lib.bindingName, ".c\"");
   out.PrintLn("         ]");
   out.PrintLn("      },");
   out.PrintLn("      \"build_", g.lib.bindingName, ".py\",");
   out.PrintLn("      \"cffi-", g.lib.bindingName, ".h\",");
   out.PrintLn("      \"py", g.lib.bindingName, ".py\",");
   out.PrintLn("   ]");
   out.PrintLn("}");
}
