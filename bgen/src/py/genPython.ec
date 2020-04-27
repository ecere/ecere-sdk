#include "debug.eh"

import "bgen"
import "pyTools"

char * Gen::allocMacroSymbolNamePy(const bool noMacro, const MacroType type, const TypeInfo ti, const char * name, const char * name2, int ptr)
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
      case FUNCTION:    return PrintString(     "function_", name);
      case M_VTBLID:    return PrintString(                  name, "_", name2, "_vTblID");
      default:
         conmsg("error: unsupported symbol name type (", type, ") in cffi python.");
   }
   return CopyString(name);
}

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
   allocMacroSymbolName = allocMacroSymbolNamePy;

   bool init()
   {
      bool result = false;
      if(Gen::init() && readyDir())
      {
         prepPaths(true);

         if(FileExists(pyFilePath))
            DeleteFile(pyFilePath);
         if(FileExists(cffiFilePath))
            DeleteFile(cffiFilePath);

         if(!FileExists(pyFilePath) && !FileExists(cffiFilePath))
         {
            reset();

            astCFFI = { };

            if(moduleInit())
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
         DefinedExpression df; IterDefine def { n.ns, list = options.defineList };
         while((df = def.next()))
         {
            Expression exp = ParseExpressionString((char *)df.value);
            if(exp.type == instanceExp)
            {
               BDefine d = df;
               BVariant v = d;
               BOutput out { vdefine, d = d, z = { allocType = heap } };
               d.nspace.addContent(v);
               d.out = out;

               {
                  Class clDep = eSystem_FindClass(mod, exp.instance._class.name);
                  AVLTree<UIntPtr> visited { };
                  Array<Class> batch { };
                  Array<Class> additions { };
                  Array<Class> swap;
                  char * s = null;
                  char * val = getNoNamespaceString(df.value, null, false);
                  batch.Add(clDep);
                  visited.Add((UIntPtr)clDep);
                  while(batch.count)
                  {
                     for(e : batch)
                     {
                        Class cl = e;
                        BProperty p; IterConversion itc { cl };
                        while((p = itc.next(publicOnly)))
                        {
                           if(p.cConv && visited.Add((UIntPtr)p.cConv.cl))
                              additions.Add(p.cConv.cl);
                        }

                        {
                           IterAllClass itacl { itn.module = g_.mod, list = g_.options.classList };
                           while(itacl.next(all))
                           {
                              BProperty p; IterConversion itcn { itacl.cl };
                              while((p = itcn.next(publicOnly)))
                              {
                                 if(p.cConv && visited.Add((UIntPtr)p.cConv.cl))
                                 {
                                    additions.Add(p.cConv.cl);
                                    additions.Add(itacl.cl);
                                    visited.Add((UIntPtr)itacl.cl);
                                 }
                              }
                           }
                           itacl.cleanup();
                        }
                     }
                     batch.RemoveAll();
                     swap = additions;
                     additions = batch;
                     batch = swap;
                  }
                  ChangeCh(val, '{', '(');
                  ChangeCh(val, '}', ')');
                  while((s = strstr(s ? s : val, "true")))
                     *s = 'T', s += 4;
                  while((s = strstr(s ? s : val, "false")))
                     *s = 'F', s += 5;
                  out.z.concatx(ln);
                  out.z.concatx(d.name, " = ", val, ln);
                  for(e : visited)
                  {
                     Class cl = (Class)e;
                     v.processDependency(this, oother, otypedef, cl);
                  }
                  delete val;
                  delete batch;
                  delete additions;
                  delete visited;
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
         BFunction f; IterFunction itf { n.ns, list = options.functionList };
         ParamFilter paramFilter { all = true };
         while((f = itf.next()))
         {
            if(!f.skip && !f.isDllExport)
            {
               BVariant v = f;
               BOutput out { vfunction, f = f, z = { allocType = heap } };
               char * name = pyGetNoConflictSymbolName(f.oname);
               f.nspace.addContent(v);
               f.out = out;
               // function
               tmp_merge_FuncMethOutput(out, f, null, null, paramFilter, null, name, f.oname, "", false, null);
               delete name;
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
         BClass c; IterClass itc { n.ns, list = options.classList };
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
            generatePY(out, this);
         else
            generatePY(out, this);
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

      allNamespaces.Free(); //allNamespaces = { };
      allVariants.Free(); //allVariants = { };
      allDefines.Free(); //allDefines = { };
      allFunctions.Free(); //allFunctions = { };
      allClasses.Free(); //allClasses = { };
      allTemplatons.Free(); //allTemplatons = { };
      allMethods.Free(); //allMethods = { };
      allProperties.Free(); //allProperties = { };

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
      strcpy(path, dir);
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
      //strcpy(name, "py"); strcat
      strcpy(name, lib.bindingName);
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
      BClass ca; IterClass itca { na.ns, list = g.options.classList };
      while((ca = itca.next(all)))
      {
         IterNamespace itnb { module = g.mod, processFullName = true };
         while(itnb.next())
         {
            BNamespace nb = (NameSpacePtr)itnb.ns;
            BClass cb; IterClass itcb { nb.ns, list = g.options.classList };
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
      (type.returnType._class.registered.type == normalClass/* || type.returnType._class.registered.type == noHeadClass*/);
}

bool typeRequiresImpl(Type t)
{
   if(t.kind == pointerType || typeIsNative(t) || typeIsStringClass(t) ||
         (t.kind == classType && t._class.registered && classRequiresImpl(t._class.registered)))
      return false;
   return true;
}

bool classRequiresImpl(Class c)
{
   switch(c.type)
   {
      case systemClass:
      case enumClass:
      // case unitClass:
         return false;
   }
   return true;
}

bool typeIsNative(Type t)
{
   switch(t.kind)
   {
      case charType:
      case shortType:
      case intType:
      case int64Type:
      case int128Type:
      case intSizeType:
      case longType:
      case floatType:
      case doubleType:
         return true;
   }
   return false;
}

bool typeIsClassNative(Type t)
{
   return t.kind == classType && t._class.registered && (t._class.registered.type == systemClass ||
         t._class.registered.type == enumClass/* || type._class.registered.type == unitClass*/);
}

bool typeIsStr(Type t)
{
   return (t.kind == pointerType && ((t.type.kind == charType && t.type.isSigned) ||
         (t.type.kind == pointerType && t.type.type.kind == charType && t.type.type.isSigned))) ||
         (t.kind == classType && t._class.registered && !strcmp(t._class.registered.name, "String"));
}

bool typeIsStringClass(Type t)
{
   if(t.kind == classType && t._class.registered)
   {
      BClass c = t._class.registered;
      return c.isString;
   }
   return false;
}

bool typeIsUnitClass(Type type)
{
   return type.kind == classType && type._class.registered && type._class.registered.type == unitClass;
}

bool typeIsClassType(Type type, ClassType cltype)
{
   return type.kind == classType && type._class.registered && type._class.registered.type == cltype;
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
      case charType:
      case shortType:
      case intType:
      case int64Type:
      case int128Type:
      case intSizeType:
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
   ParamFilter paramFilter { all = true };
   if(!(c.skip || c.cl.type == systemClass || c.isByte || c.isCharPtr ||
         c.isUnInt || c.isUnichar || c.is_class || c.isInstance ||
         /*c.isString || */c.isBool)) // (skip)
   {
      BVariant v = c;
      BNamespace n = c.nspace;
      BOutput out { vclass, c = c, z = { allocType = heap } };
      BClass cBase = c.cl.base ? c.cl.base.templateClass ? c.cl.base.templateClass : c.cl.base : null;
      bool hasBase = cBase && cBase.cl.type != systemClass;
      bool hasContent = classHasContent(g, c);
      List<Class> lineage = getClassLineage(c.cl);
      List<Class> classOnly { [ c.cl ] };

      char * selfimpl = c.cl.type == noHeadClass ?
            PrintString("ffi.cast(\"struct ", c.symbolName, " *\", self.impl)") :
            CopyString("self.impl");
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
         out.z.concatx("def regclass(c):", ln,
                       "   app.registerClass(c)", ln,
                       "   return c", ln);
      }

      out.z.concatx(ln);
      out.z.concatx(sk, "class ", c.symbolName);

      //if(cBase && cBase.cl.type != bitClass)
      if((c.cl.type == unitClass || c.cl.type == bitClass) && cBase.cl.type == systemClass)
         out.z.concat("(pyBaseClass)");
      else if(hasBase && (!c.nativeSpec || cBase.cl.type == unitClass) && !c.isBool)
      {
         out.z.concatx("(", cBase.symbolName, ")"); // c.baseSymbolName
         v.processDependency(g, otypedef, otypedef, cBase.cl);
      }
      else if(c.cl.type == structClass && cBase && cBase.is_struct)
         out.z.concatx("(Struct)"); // ("(", g.lib.bindingName, "_struct)")

      out.z.concat(":");
      if(!skip && !hasContent)
         out.z.concat("pass");
      if(skip) out.z.concat(" # tofix");
      out.z.concatx(ln);

      if(c.isInstance)
         conmsg("check"); // pyHardcodeInstance(out.z);
      else if(c.isArray)
         sourceFileProcessToZedString(out.z, ":src/py/py_hardcode_array.src", null, false, false);
      else if(c.isApplication)
      {
         Map<String, String> sourceProcessorVars { };
         ZString z { allocType = heap };
         genRegisterClassCalls(z, g, filterClassEcereComExlusions, "      ", "self");
         sourceProcessorVars["REGISTER_CLASS"] = z._string;
         sourceFileProcessToZedString(out.z, ":src/py/py_hardcode_application.src", sourceProcessorVars, false, false);
         delete sourceProcessorVars;
         delete z;
      }
      else if(c.isGuiApplication)
      {
         sourceFileProcessToZedString(out.z, ":src/py/py_hardcode_guiapplication.src", null, false, false);
         conassert(g.lib.ecere == true, "?");
         genRegisterClassCalls(out.z, g, filterClassAll, "      ", "self");
         out.z.concatx(ln);
         out.z.concatx("      lib.Instance_evolve(rApp, GuiApplication.pyClass_GuiApplication)", ln);
         out.z.concatx("      self.impl = rApp[0]", ln);
         out.z.concatx("      ffi.cast(\"void **\", ffi.cast(\"char *\", self.impl) + self.impl._class.offset)[0] = self.handle", ln);
      }
      else if(c.isContainer)
         sourceFileProcessToZedString(out.z, ":src/py/py_hardcode_container.src", null, false, false);
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
            char * firstArg = null;
            char * firstInitializerName = null; // FIX #06 (12.)
            BProperty pFromString = null; // FIX #06 (12.)
            bool tmpClassTriesNewInitArgs = false;

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
                  //if(itmpp.dm && itmpp.dm.type != normalMember) continue;
                  if((itmpp.dm && itmpp.dm.type != normalMember) || (itmpp.pt && !itmpp.pt.Set)) continue;
                  charCount += strlen(itmpp.name) + 4;
                  if(itmpp.dm || itmpp.pt)
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

            if(c.cl.type == normalClass && !c.isString)
               tmpClassTriesNewInitArgs = true;

            if(hasNew)
            {
               out.z.concatx(sk, "   def __new__(cls"); //, from_String = None
               initArguments(g, c, v, out, sk, lineage, lin, filter, hasUnion, 15, &memberLen, &otherCount);
               out.z.concatx(sk, "      if isinstance(", firstInitializerName, ", str):", ln,
                             sk, "         impl = lib.", pFromString.fpnSet, "(", firstInitializerName, ".encode('u8'))", ln,
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
            {
               if(tmpClassTriesNewInitArgs)
               {
                  char * name;
                  bool added = false;
                  if(c.cl.inheritanceAccess == privateAccess)
                     out.z.concatx(sk, "   private_inheritance = 1", ln);
                  out.z.concatx(sk, "   class_members = [");
                  // 'array', 'conut', 'minAllocSize', 'size'
                  {
                     IterMemberOrPropertyPriority itmpp { cl = c.cl };
                     while(itmpp.next(publicOnly))
                     {
                        if(itmpp.dm && itmpp.dm.type != normalMember) continue;
                        name = pyGetNoConflictSymbolName(itmpp.mp.name);
                        out.z.concatx(added ? "" : sln, sk, "                      '", name, "',", ln);
                        delete name;
                        added = true;
                     }
                     itmpp.reset();
                  }
                  {
                     BMethod m; IterMethod itm { c.cl };
                     while((m = itm.next(publicVirtual)))
                     {
                        char * mname;
                        m.init(itm.md, c, g);
                        mname = pyGetNoConflictSymbolName(m.mname);
                        out.z.concatx(added ? "" : sln, sk, "                      '", mname, "',", ln);
                        delete mname;
                        added = true;
                     }
                  }
                  /*{
                     IterMemberOrPropertyPlus itmpp { cl = c.cl };
                     while(itmpp.next(publicOnly))
                     {
                        if(!((itmpp.dm && itmpp.dm.type == normalMember) || (itmpp.pt && itmpp.pt.Set))) continue;
                        name = pyGetNoConflictSymbolName(itmpp.mp.name);
                        out.z.concatx(added ? "" : sln, sk, "                      '", name, "',", ln);
                        delete name;
                        added = true;
                     }
                  }*/
                  out.z.concatx(sk, added ? "                   " : "", "]", ln);
                  out.z.concatx(ln);
                  out.z.concatx(sk, "   def init_args(self, args, kwArgs): init_args(", c.name, ", self, args, kwArgs)", ln);
                  out.z.concatx(sk, "   def __init__(self, *args, **kwArgs):", ln);
                  if(hasNew)
                     out.z.concatx(sk, "      if hasattr(self, 'impl'): return", ln);
                  if(c.cl.base.templateClass)
                  {
                     const char * tp = strchr(c.cl.base.name, '<');
                     char * tp2 = getNoNamespaceString(tp, null, false);
                     out.z.concatx(sk, "      kwArgs['templateParams'] = \"", tp2, "\"", ln);
                     delete tp2;
                  }
                  out.z.concatx(sk, "      self.init_args(list(args), kwArgs)", ln);
               }
               else
                  out.z.concatx(sk, "   def __init__(self");
            }
// ------------------------------------------------------------------------------------------------------------------- //
//      arguments for __init__ function                                                                                //
// ------------------------------------------------------------------------------------------------------------------- //
            if(!tmpClassTriesNewInitArgs)
               firstArg = initArguments(g, c, v, out, sk, lineage, lin, filter, hasUnion, lineEachIndent, &memberLen, &otherCount);
// ------------------------------------------------------------------------------------------------------------------- //
//      content of __init__ function: some initialization of self                                                      //
// ------------------------------------------------------------------------------------------------------------------- //
            if(hasNew && !tmpClassTriesNewInitArgs)
               out.z.concatx(sk, "      if hasattr(self, 'impl'): return", ln);
            if(c.cl.type == noHeadClass)
            {
               // FIX #05 (8.)
               out.z.concatx(sk, "      if impl is not None:", ln,
                             sk, "         self.impl = impl", ln);
               if(c.isClass)
               out.z.concatx(sk, "      elif isinstance(", "prev", ", pyType):", ln,
                             sk, "         self.impl = getattr(app.lib, 'class_' + ", "prev", ".__name__)", ln);
               out.z.concatx(sk, "      else:", ln,
                             sk, "         self.impl = ffi.cast(\"", c.name, " *\", lib.Instance_new(lib.class_", c.name, "))", ln);
            }
            else if(c.cl.type == structClass)
            {
               out.z.concatx(sk, "      if impl is not None:", ln,
                             sk, "         self.impl = ffi.new(\"", c.name, " *\", impl)", ln,
                             sk, "      else:", ln);
            }
            else if(c.cl.type == bitClass)
            {
               DataMember dm; IterDataMember itd { c.cl };
               out.z.concatx(sk, "      if impl is not None:", ln,
                             sk, "         self.impl = impl", ln);
               while((dm = itd.next(publicOnly)))
               {
                  char * name = pyGetNoConflictSymbolName(dm.name);
                  out.z.concatx(sk, "      elif isinstance(", name, ", ", c.name, "):", ln,
                                sk, "         self.impl = ", name, ".impl", ln);
                  delete name;
                  break;
               } // itd.reset();
               out.z.concatx(sk, "      else:", ln);
            }
            else if(c.cl.type == unitClass)
            {
               if(c.cl.base.type == systemClass)
               {
                  //out.z.concatx(sk, "      if impl is not None: self.impl = impl", ln);
                  out.z.concatx(sk, "      self.impl = impl", ln);
                  //out.z.concatx(sk, "      else: self.impl = value", ln);
               }
               else if(c.cl.base.type == unitClass)
               {
                  out.z.concatx(sk, "      if impl is not None: self.impl = impl", ln,
                                sk, "      elif isinstance(value, ", c.cl.base.name, "): self.impl = value.impl", ln,
                                sk, "      else: self.", hasOneToOneBaseConv ? "impl" : "value", " = value", ln);
               }
               else conmsg("check");
            }
            else if(c.cl.type == normalClass)
            {
               if(!(c.isApplication || c.isGuiApplication || c.isContainer || (c.isWindow && g.lib.ecereCOM)))
               {
                  //out.z.concatx(sk, "", ln);
                  if(!cBase.isCharPtr)
                  {
                     if(!tmpClassTriesNewInitArgs)
                     {
                        out.z.concatx(sk, "      ", cBase.name, ".__init__(self");
                        if(c.cl.templateParams.count) // todo or base's or base's base's, etc
                           out.z.concat(", templateParams");
                        out.z.concat(", impl = impl");
                        out.z.concatx(")", ln);
                     }
                  }
                  if(userDataProp)
                     out.z.concatx(sk, "      if self.impl != ffi.NULL: lib.", userDataProp.fpnSet, "(self.impl, self.impl)", ln);
                  //out.z.concatx(sk, "", ln);
                  if(c.isString)
                  {
                     out.z.concatx(sk, "      if impl is not None: self.impl = impl", ln,
                                   sk, "      else: self.impl = ffi.NULL", ln);/*,
                                   sk, "   # hardcoded __str__", ln,
                                   sk, "   def __str__(self):", ln,
                                   sk, "      return ffi.string(self.impl).decode('u8') if self.impl != ffi.NULL else str()", ln);*/
                  }
                  if(!tmpClassTriesNewInitArgs)
                  {
                     IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage };
                     while(itmpp.next(publicOnly))
                     {
                        if((itmpp.dm && itmpp.dm.type == normalMember) || (itmpp.pt && itmpp.pt.Set))
                           out.z.concatx(sk, "      if ", itmpp.name, " is not ", "None", ": ", spaces(memberLen, strlen(itmpp.name)), "self.", itmpp.name, " = ", itmpp.name, ln);
                     }
                  }
                  if(!tmpClassTriesNewInitArgs)
                  for(ccc : lineage)
                  {
                     BClass cc = ccc;
                     if(cc.is_class || cc.isInstance) continue;
                     // setting virtual methods
                     {
                        BMethod m; IterMethod itm { cc.cl };
                        while((m = itm.next(publicVirtual)))
                        {
                           char * mname;
                           m.init(itm.md, cc, g);
                           mname = pyGetNoConflictSymbolName(m.mname);
                           out.z.concatx("      if ", mname, " is not ", "None", ": ", spaces(memberLen, strlen(mname)), "self.", mname, " = ", mname, ln);
                           delete mname;
                        }
                     }
                  }
               }
            }
// ------------------------------------------------------------------------------------------------------------------- //
//      tuple handling (__init__ continued)                                                                            //
// ------------------------------------------------------------------------------------------------------------------- //
            //if(c.isAnchor || (memberArgCount > 1 && memberArgCount < 6))
            if((c.cl.type == structClass || c.cl.type == bitClass || c.cl.type == noHeadClass) &&
                  ((memberArgCount > 1 && memberArgCount < 7) || c.isAnchor))
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
                     const char * zeroVal = getTypeZeroValuePy(g, itmpp.type, v);
                     out.z.concatx(sk, "         if isinstance(", itmpp.name, ", tuple):", ln,
                                   sk, "            __tuple = ", itmpp.name, ln,
                                   sk, "            ", itmpp.name, " = ", zeroVal, ln);
                     first = false;
                     elif = true;
                  }
                  out.z.concatx(sk, "            if len(__tuple) > ", i, ": ", itmpp.name,
                        tmpNoSp ? "" : spaces(memberLen, strlen(itmpp.name)), " = __tuple[", i, "]", ln); i++;
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
                     ClassType ct = p.cConv ? p.cConv.cl.type : systemClass;
                     bool impl = p.cConv && (ct == bitClass || ct == unitClass || ct == structClass);
                     bool zero = false;
                     out.z.concatx(sk, "         ", elif ? "el" : "", "if isinstance(", name, ", ", p.name, "):", ln);
                     out.z.concatx(sk, "            self.impl = lib.", p.fpnSet, "(", name, impl ? ".impl" : "", zero ? "[0]" : "", ")", ln);
                     out.z.concatx(sk, "            return", ln);
                     elif = true;
                     /*out.z.concatx(sk, "            val = lib.", p.fpnSet, "(", name, ")", ln);
                     {
                        DataMember dm; IterDataMember itd { c.cl };
                        while((dm = itd.next(publicOnly)))
                        {
                           char * name = pyGetNoConflictSymbolName(dm.name);
                           if(typeIsNative(dm.dataType) || typeIsClassNative(dm.dataType))
                              out.z.concatx(sk, "            ", name, " = val.", name, ln);
                           else
                           {
                              const char * typeName = dm.dataType.kind == classType && dm.dataType._class.registered ? dm.dataType._class.registered.name : "FixTypeNameIssue"; //getSimpleDataTypeName(dm.dataType, dm.dataTypeString, 0, false, g.lib.ecereCOM, null);
                              out.z.concatx(sk, "            ", name, " = ", typeName, "(impl = val.", name, ")", ln);
                           }
                           delete name;
                        }
                     //out.z.concatx(sk, "            val = lib.", p.fpnSet, ln);
                     //out.z.concatx(sk, "            val = lib.", p.fpnSet, ln);
                     }*/
                     v.processDependency(g, otypedef, otypedef, p.cConv.cl);
                  }
   //#if 0
                  {
                     IterAllClass itacl { itn.module = g.mod, list = g.options.classList };
                     while(itacl.next(all))
                     {
                        BProperty p; IterConversion itcn { itacl.cl };
                        while((p = itcn.next(publicOnly)))
                        {
                           if(!p.cConv)
                              ;//PrintLn("    ", "what's going on with native type conversion ", itacl.cl.name, " <-> ", p.name);
                           else if(p.cConv.cl == c.cl)
                           {
                              bool impl = classRequiresImpl(itacl.cl);
                              bool zero = false;
                              //out.z.concatx(sk, "         # aconvhere ", c.name, " <-> ", itacl.cl.name, ln);
                              out.z.concatx(sk, "         ", elif ? "el" : "", "if isinstance(", name, ", ", itacl.cl.name, "):", ln);
                              out.z.concatx(sk, "            self.impl = lib.", p.fpnGet, "(", name, impl ? ".impl" : "", zero ? "[0]" : "", ")", ln);
                              out.z.concatx(sk, "            return", ln);
                              //v.processDependency(g, otypedef, otypedef, itacl.cl);
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
                        if(((itmpp.dm && itmpp.dm.type == normalMember) || (itmpp.pt && itmpp.pt.Set)) &&
                              !(p.cConv && p.cConv.cl.templateClass))
                        {
                           out.z.concatx(sk, "         ", elif ? "el" : "", "if isinstance(", itmpp.name, ", ", type, "):", ln);
                           if(c.cl.type == structClass)
                           {
                              bool impl = p.cConv && (p.cConv.cl.type == unitClass || p.cConv.cl.type == structClass); // nownow
                              out.z.concatx(sk, "            self.impl = ffi.new(\"", c.name, " *\")", ln,
                                            sk, "            lib.", p.fpnSet, "(self.impl", ", ", itmpp.name, impl ? ".impl" : "", ")", ln,
                                            sk, "            return", ln);
                           }
                           elif = true;
                           break;
                        }
                     }
                     itmpp.reset();
                  }
                  {
                     char * name = null;
                     IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage, typing = true, unionFirstsOnly = true };
                     while(itmpp.next(publicOnly))
                     {
                        if((itmpp.dm && itmpp.dm.type != normalMember) || (itmpp.pt && !itmpp.pt.Set)) continue;
                        name = itmpp.name;
                        break;
                     }
                     if(name)
                     {
                        IterAllClass itacl { itn.module = g.mod, list = g.options.classList };
                        while(itacl.next(all))
                        {
                           BProperty p; IterConversion itcn { itacl.cl };
                           bool forStruct = itacl.cl.type == structClass;
                           while((p = itcn.next(publicOnly)))
                           {
                              if(!p.cConv)
                                 ;//PrintLn("    ", "what's going on with native type conversion ", itacl.cl.name, " <-> ", p.name);
                              else if(p.cConv.cl == c.cl)
                              {
                                 //out.z.concatx(sk, "         # aconvhere ", c.name, " <-> ", itacl.cl.name, ln);
                                 out.z.concatx(sk, "         ", elif ? "el" : "", "if isinstance(", name, ", ", itacl.cl.name, "):", ln);
                                 out.z.concatx(sk, "            self.impl = ffi.new(\"", c.name, " *\")", ln);
                                 out.z.concatx(sk, "            lib.", p.fpnGet, "(", name, forStruct ? ".impl" : "", ", self.impl)", ln);
                                 out.z.concatx(sk, "            return", ln); // todo: do away with this return and others too maybe by adding an else at the end
                                 //v.processDependency(g, otypedef, otypedef, itacl.cl);
                              }
                           }
                        }
                        itacl.cleanup();
                     }
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
                  const char * typeName = itmpp.type && itmpp.type.kind == classType && itmpp.type._class.registered ? itmpp.type._class.registered.name : "FixTypeNameIssue"; //getSimpleDataTypeName(itmpp.type, dm.dataTypeString, 0, false, g.lib.ecereCOM, null);
                  if(itmpp.dm && itmpp.dm.type != normalMember) continue;
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
                     //bool inst = itmpp.type.kind == classType && itmpp.type._class.registered &&
                     //      (itmpp.type._class.registered.type == normalClass || itmpp.type._class.registered.type == noHeadClass);
                     for(clBaseUnit = itmpp.type._class.registered; clBaseUnit && clBaseUnit.base.type == unitClass; clBaseUnit = clBaseUnit.base);
                     if(c.cl.type == structClass)
                        out.z.concatx(sk, "         ", "if ", itmpp.name, " is not None:", ln);
                     //if(inst)
                        out.z.concatx(sk, "         ", more ? "   " : "", "if not isinstance(", itmpp.name, ", ", clBaseUnit.name, "):",
                              " ", itmpp.name, " = ", typeName, "(", itmpp.name, ")", ln);
                     //else
                     //   out.z.concatx(sk, "         ", "if ", itmpp.name, " is not None and not isinstance(", itmpp.name, ", ", clBaseUnit.name, "):", ln);
                     //out.z.concatx(sk, "            ", inst ? "   " : "", itmpp.name, " = ", typeName, "(", itmpp.name, ")", ln);
                     if(c.cl.type == structClass && !hasUnion)
                     {
                        bool forStruct = itmpp.type.kind == classType && itmpp.type._class.registered && itmpp.type._class.registered.type == structClass;
                        if(!hasUnion) // FIX #06 (16.)
                           out.z.concatx(sk, "            ", itmpp.name, " = ", itmpp.name, ".impl", forStruct ? "[0]" : "", ln); // FIX #04 (14.)
                        //if(inst)
                        //   out.z.concatx(sk, "         else:", ln, sk, "               ", itmpp.name, " = ffi.NULL", ln);
                        if(itmpp.type.kind == classType)
                        {
                           if(itmpp.type._class.registered)
                           {
                              const char * name = itmpp.type._class.registered.name;
                              switch(itmpp.type._class.registered.type)
                              {
                                 case normalClass:
                                 case noHeadClass:
                                    out.z.concatx(sk, "         else:", ln, sk, "            ", itmpp.name, " = ffi.NULL", ln);
                                    break;
                                 //case structClass:
                                    //out.z.concatx("# ", "         else:", ln, sk, "            ", itmpp.name,
                                    //      " = ffi.new(\"", itmpp.type._class.registered.name, " *\")",
                                    //      " # init struct class struct member", ln);
                                 //   break;
                                 case structClass:
                                 case bitClass:
                                 case unitClass:
                                    //out.z.concatx(sk, "         else:", ln, sk, "            ", itmpp.name, " = 0", ln);
                                    out.z.concatx(sk, "         else:", ln, sk, "            ", itmpp.name, " = ", name, "()", ln);
                                    if(!hasUnion && forStruct)
                                       out.z.concatx(sk, "            ", itmpp.name, " = ", itmpp.name, ".impl", forStruct ? "[0]" : "", ln);
                                    break;
                                 //case :
                                 default:
                                    locprintxln("------- ", itmpp.name, " ", itmpp.type.kind, " -- ", itmpp.type._class.registered.name, " ", itmpp.type._class.registered.type);
                              }
                           }
                           else
                              locprintxln("------- ", itmpp.name, " ", itmpp.type.kind, " -- class not registered!");
                        }
                        else
                           locprintxln("------- ", itmpp.name, " ", itmpp.type.kind);
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
               out.z.concatx(sk, "         self.impl = (", ln); // self.value
               first = true;
               while((dm = itd.next(publicOnly)))
               {
                  const char * zeroVal = getTypeZeroValuePy(g, dm.dataType, v);
                  int lenx = strlen(c.name);
                  if(!(strlen(zeroVal) == lenx + 2 && !strncmp(zeroVal, c.name, lenx)))
                  {
                     char * name = pyGetNoConflictSymbolName(dm.name);
                     if(!first) out.z.concatx(" |", ln);
                     if(dm.dataType.kind == classType && dm.dataType._class && dm.dataType._class.registered && dm.dataType._class.registered.type == bitClass)
                        out.z.concatx(sk, "            (", name, ".impl", spaces(memberLen, strlen(name) + 5),
                              " << lib.", c.upper, "_", name, "_SHIFT)", spaces(memberLen, strlen(name)));
                     else
                        out.z.concatx(sk, "            (", name, spaces(memberLen, strlen(name)),
                              " << lib.", c.upper, "_", name, "_SHIFT)", spaces(memberLen, strlen(name)));
                     if(first) first = false;
                     delete name;
                  }
               }
               out.z.concatx(" )", ln);
            }
            else if(c.cl.type == structClass) // c.cl.type != noHeadClass
            {
               if(hasUnion) // FIX #06 (16.)
               {
                  out.z.concatx(sk, "         __members = { }", ln);
                  {
                     IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage, typing = true };
                     while(itmpp.next(publicOnly))
                     {
                        if(itmpp.dm && itmpp.dm.type == normalMember)
                        {
                           const char * name = itmpp.mp.name;
                           BClass cType = itmpp.type.kind == classType ? itmpp.type._class.registered : null;
                           bool impl = !(typeIsNative(itmpp.type) || typeIsClassNative(itmpp.type) ||
                                 (cType && cType.isString) || (itmpp.type.kind == pointerType &&
                                 (typeIsNative(itmpp.type.type) || itmpp.type.type.kind == voidType)));
                           bool zero = cType && cType.cl.type == structClass;
                           out.z.concatx(sk, "         if ", name, " is not None:", spaces(memberLen, strlen(name)),
                                 " __members['", name, "']", spaces(memberLen, strlen(name)), " = ", name,
                                 impl ? ".impl" : "", zero ? "[0]" : "", ln);
                        }
                     }
                  }
               }
               out.z.concatx(sk, "         self.impl = ffi.new(\"", c.name, " *\"");
               if(hasUnion) // FIX #06 (16.)
                  out.z.concatx(", __members");
               else
               //if(!c.isAnchor)
               {
                  int count = 0;
                  const int limit = 4;
                  const char * xln, * comma = "";
                  const char * xsk, * xsp;
                  IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage, typing = true, unionFirstsOnly = true };
                  out.z.concatx(", {");
                  while(itmpp.next(publicOnly))
                     if(itmpp.dm && itmpp.dm.type == normalMember)
                        count++;// += itmpp.name ? strlen(itmpp.name) : 0;
                  xln = count > limit ? "\n" : "";
                  xsk = count > limit ? sk : "";
                  xsp = count > limit ? "                             " : " ";
                  while(itmpp.next(publicOnly))
                  {
                     //if(!itmpp.mp.isProperty/* || pt.Set*/)
                     if(itmpp.dm && itmpp.dm.type == normalMember)
                     {
                        //if(!strcmp(c.name, "Size") && !strcmp(itmpp.name, "w"))
                        /*if(!(typeIsNative(itmpp.type) || typeIsClassNative(itmpp.type) ||
                           typeIsSomething(itmpp.type) || typeIsUnitClass(itmpp.type))) // FIX #04
                           impl = true;*/
                        //out.z.concatx(comma, "'", itmpp.mp.name, "' : ", itmpp.name);
                        out.z.concatx(comma, xln, xsk, xsp, count > limit ? "   " : "", "'", itmpp.mp.name, "' : ", itmpp.name);
                        xln = count > limit ? "\n" : "";
                        comma = ",";
                     }
                  }
                  out.z.concatx(xln, xsk, xsp, "}");
               }
               out.z.concatx(")", ln);
               //if(c.cl.type == structClass)
               /*{
                  IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage };
                  while(itmpp.next(publicOnly))
                  {
                     if(itmpp.pt && itmpp.pt.Set)
                        //out.z.concatx(sk, "         if not isinstance(", name, ", ", clBaseUnit.name, "): ", name, " = ", typeName, "(", name, ")", ln);
                        out.z.concatx(sk, "         if ", itmpp.name, " is not None: ", spaces(memberLen, strlen(itmpp.name)), "self."/-*, itmpp.mp.isProperty ? "" : "impl."*-/, itmpp.name, spaces(memberLen, strlen(itmpp.name)), itmpp.mp.isProperty ? "     " : "", " = ", itmpp.name/-*, impl ? ".impl" : ""*-/, ln);
                  }
               }*/
               // FIX #04
               //if(c.cl.type != structClass)
               {
                  IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage };
                  while(itmpp.next(publicOnly))
                  {
                     // FIX #04
                     //if((itmpp.dm && itmpp.dm.type == normalMember) || (itmpp.pt && itmpp.pt.Set))
                     if((itmpp.dm && itmpp.dm.type == normalMember && c.cl.type != structClass) || (itmpp.pt && itmpp.pt.Set))
                        //out.z.concatx(sk, "         if not isinstance(", name, ", ", clBaseUnit.name, "): ", name, " = ", typeName, "(", name, ")", ln);
                        out.z.concatx(sk, "         if ", itmpp.name, " is not None: ", spaces(memberLen, strlen(itmpp.name)), "self."/*, itmpp.mp.isProperty ? "" : "impl."*/, itmpp.name, spaces(memberLen, strlen(itmpp.name)), itmpp.mp.isProperty ? "     " : "", " = ", itmpp.name/*, impl ? ".impl" : ""*/, ln);
                  }
               }
            }
// ------------------------------------------------------------------------------------------------------------------- //
//      retyping of arguments? (__init__ continued)                                                                    //
// ------------------------------------------------------------------------------------------------------------------- //
            if(/*c.cl.type == structClass || */c.cl.type == noHeadClass)
            {
               // FIX #05 (8.)
               const char * indent = c.cl.type == structClass ? "      " : "         ";
               IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage, typing = true };
               while(itmpp.next(publicOnly))
               {
                  if(itmpp.pt && itmpp.pt.Set)
                  {
                     bool impl = false;
                     BClass cType = itmpp.type.kind == classType ? itmpp.type._class.registered : null;
                     // FIX #05 (11.)
                     if(c.cl.type == structClass && !(typeIsNative(itmpp.type) ||
                           typeIsClassNative(itmpp.type) || typeIsSomething(itmpp.type)))
                        impl = true;
                     //out.z.concatx(comma, "'", itmpp.name, "' : ", itmpp.name, impl ? ".impl" : "");
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
                           out.z.concatx(sk, indent, "if not isinstance(", itmpp.name, ", ", clBaseUnit.name, "): ", itmpp.name, " = ", typeName, "(", itmpp.name, ")", ln);
                        }
                     }
                     out.z.concatx(sk, indent, "if ", itmpp.name, " is not ", "None", ": ", spaces(memberLen, strlen(itmpp.name)), "self.", itmpp.mp.isProperty ? "" : "impl.", itmpp.name, spaces(memberLen, strlen(itmpp.name)), itmpp.mp.isProperty ? "     " : "", " = ", itmpp.name, impl ? ".impl" : "", ln);
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
                     out.z.concatx(sk, "         if ", itmpp.name, " is not ", "None", ": ", spaces(memberLen, strlen(itmpp.name)), "self.", itmpp.name, spaces(memberLen, strlen(itmpp.name)), " = ", itmpp.name, ln);
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
                  out.z.concatx(sk, "   ");
                  out.z.concatx(name, spaces(memberLen, strlen(name) + (conflict ? 1 : 0)));
                  if(hasBase)
                  {
                     if(cBase.cl.type == enumClass)
                        out.z.concatx(" = ", cBase.name, "(lib.", c.name, "_", val.name, ")", ln);
                     else
                        out.z.concatx(" = ", cBase.name, "(impl = lib.", c.name, "_", val.name, ")", ln);
                  }
                  else
                  {
                     if(c.isBool)
                        out.z.concatx(" = lib.", val.name, ln);
                     else
                        out.z.concatx(" = lib.", c.name, "_", val.name, ln);
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
                  out.z.concatx(
                        sk, "", ln,
                        sk, "   @property", ln,
                        sk, "   def ", name, "(self): return ((((self.impl)) & lib.", c.upper, "_", name, "_MASK) >> lib.", c.upper, "_", name, "_SHIFT)", ln,
                        sk, "   @", name, ".setter", ln,
                        sk, "   def ", name, "(self, value): self.impl = ((self.impl) & ~(lib.", c.upper, "_", name, "_MASK)) | (((value)) << lib.", c.upper, "_", name, "_SHIFT)", ln);
                  delete name;
               }
            }
            else if(c.cl.type == unitClass)
            {
               BProperty p; IterConversion itc { c.cl };
               if(hasOneToOneBaseConv) // if conversion property to base without get / set
               {
                  out.z.concatx(
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
                     out.z.concatx("", ln,
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
            delete firstArg;
// ------------------------------------------------------------------------------------------------------------------- //
//      next                                                                                                           //
// ------------------------------------------------------------------------------------------------------------------- //
         }
      }

      if(c.cl.type == normalClass)
      {
         if(c.isModule)
            sourceFileProcessToZedString(out.z, ":src/py/py_hardcode_module.src", null, false, false);
      }

      // members and properties
      {
         //IterClassHierarchyMemberOrPropertyPlus itmpp { lineage = lineage, typing = true };
         AVLTree<const String> propNames { };
         IterMemberOrPropertyPlus itmpp { cl = c.cl };
         while(itmpp.next(publicOnly))
         {
            if(itmpp.pt && !itmpp.pt.conversion)
            {
               char * itmppname = pyGetNoConflictSymbolName(itmpp.mp.name);
               propNames.Add(itmppname);
               delete itmppname;
            }
         }
         while(itmpp.next(publicOnly))
         {
            char * itmppname = pyGetNoConflictSymbolName(itmpp.mp.name);
            Type itmpptype = itmpp.pt ? itmpp.pt.dataType : itmpp.dm ? itmpp.dm.dataType : null;
            //if(itmpp.c != c) continue;
            // members

            if(itmpp.dm && !propNames.Find(itmppname) && itmpp.dm.type == normalMember &&
                  (c.cl.type == noHeadClass || c.cl.type == normalClass || c.cl.type == structClass))
            {
               bool oneliner = true;
               BClass cType = itmpptype.kind == classType ? g.getClassFromType(itmpptype, true) : null;
               //BClass cType = p.pt.dataType.kind == classType ? p.pt.dataType._class.registered : null;
               char * typeName = getSimpleDataTypeName(itmpptype, itmpp.dm.dataTypeString, 0, false, g.lib.ecereCOM, null);
               bool wrap = cType && !cType.isBool && cType.cl.type != systemClass;
               bool retyped = false; // aka no impl, no wrap, use of wrap to be reviewed
               out.z.concatx(sk, "", ln);
               out.z.concatx(sk, "   @property", ln);
               out.z.concatx(sk, "   def ", itmppname, "(self):");
               if(c.cl.type == structClass || c.cl.type == noHeadClass) // FIX #05 (7.)
               {
               /*if(cType && !cType.isBool && cType.cl.type != systemClass)
               {
                  out.z.concatx("value = ", typeName, "(); ");
                  //v.processDependency(g, otypedef, otypedef, cType.cl);
               }
               out.z.concatx("lib.", "_get_", itmpp.name, "(", selfimpl, ", value.impl)", ln);*/
                  if(itmpptype.kind == classType && itmpptype._class.registered &&
                        (itmpptype._class.registered.type == unitClass ||
                        itmpptype._class.registered.type == bitClass || // FIX #06 (11. unclear part about properties)
                        itmpptype._class.registered.type == structClass))
                     out.z.concatx(" return ", typeName, "(impl = self.impl.", itmppname, ")", ln);
                  // FIX #05 (10.)
                  else if(itmpptype.kind == classType && itmpptype._class.registered &&
                        itmpptype._class.registered.type == normalClass)
                  {
                     if(cType.isString)
                        out.z.concatx(" return String(self.impl.", itmppname, ")", ln);
                     else
                        out.z.concatx(" return pyOrNewObject(", typeName, ", self.impl.", itmppname, ")", ln);
                  }
                  else
                     out.z.concatx(" return self.impl.", itmppname, ln);
               }
               else if(cType && cType.cl.type == normalClass && c.cl.type == normalClass)
                  out.z.concatx(" return pyOrNewObject(", typeName, ", IPTR(lib, ffi, self, ", c.name, ").", itmppname, ")", ln);
               else
                  out.z.concatx(" return ", wrap ? typeName : "", wrap ? "(impl = " : "", "IPTR(lib, ffi, self, ", c.name, ").", itmppname, wrap ? ")" : "", ln);

               out.z.concatx(sk, "   @", itmppname, ".setter", ln);
               out.z.concatx(sk, "   def ", itmppname, "(self, value):");

               if(typeIsStr(itmpptype))
               {
                  retyped = true;
                  out.z.concatx(ln);
                  out.z.concatx(sk, "      if isinstance(value, str): value = ffi.new(\"char[]\", value.encode('u8'))", ln);
                  out.z.concatx(sk, "      elif value is None: value = ffi.NULL", ln);
                  oneliner = false;
               }
               //else if(itmpptype.kind == classType && itmpptype._class.registered && itmpptype._class.registered.type == unitClass)
               else if(/*c.cl.type == structClass && */!(typeIsNative(itmpptype) || typeIsClassNative(itmpptype) ||
                     typeIsSomething(itmpptype) || typeHasTemplateClass(itmpptype)) &&
                     itmpptype.kind == classType && itmpptype._class.registered)// &&
                     //itmpptype._class.registered && reduceUnitClass(itmpptype._class.registered) != itmpptype._class.registered)
                     //!c.cl.templateClass)
               {
                  Class clBaseUnit;
                  for(clBaseUnit = itmpptype._class.registered; clBaseUnit && clBaseUnit.base.type == unitClass; clBaseUnit = clBaseUnit.base);
                  out.z.concatx(ln);
                  out.z.concatx(sk, "      if not isinstance(value, ", clBaseUnit.name, "): value = ", typeName, "(value)", ln);
                  //out.z.concatx(sk, "      self.impl.", itmppname, " = value", ln);
                  oneliner = false;
               }
               /*if(!isTypePythonNative(itmpptype) && itmpptype.kind == classType && !cType.isBool && !cType.isString)
               {
                  if(oneliner) out.z.concatx(ln);
                  out.z.concatx("      if not isinstance(value, ", typeName, "): value = ", typeName, "(value)", ln);
                  oneliner = false;
               }*/
               if(c.cl.type == structClass || c.cl.type == noHeadClass) // FIX #05 (7.)
               {
                  bool impl = cType && classRequiresImpl(cType.cl) && !typeIsStr(itmpptype);
                  bool zero = impl && cType.cl.type == structClass;
                  out.z.concatx(oneliner ? " " : "      ", "self.impl.", itmppname, " = value", impl ? ".impl" : "", zero ? "[0]" : "", ln);
               }
               else
                  out.z.concatx(oneliner ? " " : "      ", "IPTR(lib, ffi, self, ", c.name, ").", itmppname, " = value", wrap && !retyped ? ".impl" : "", ln); // value.value
            }
            // properties
            else if(itmpp.pt/* && itmpp.c == c */&& !c.isContainer) // FIX #02 // else if(itmpp.pt && !c.isContainer)
            {
               BProperty p = itmpp.pt;
               // property
               {
                  //BClass cType = p.pt.dataType.kind == classType ? g.getClassFromType(p.pt.dataType, true) : null;
                  char * typeName = getSimpleDataTypeName(p.pt.dataType, p.pt.dataTypeString, 0, false, g.lib.ecereCOM, null);
                  const char * sk = (skip || p.pt.dataType.kind == thisClassType) ? "# " : "";
                  out.z.concatx(ln);
                  if(userDataProp && !strcmp(p.fpnGet, userDataProp.fpnGet))
                     out.z.concatx(sk, "   ", userDataProp.name, " = None", ln);
                  else
                  {
                     out.z.concatx(sk, "   @property", ln);
                     out.z.concatx(sk, "   def ", itmppname, "(self): ");
                     if(!p.pt.Get)
                        out.z.concatx(sk, "return None", ln);
                     else
                     {
                        switch(p.pt.dataType.kind)
                        {
                           case charType:
                           case shortType:
                           case intType:
                           case int64Type:
                           case intSizeType:
                           case floatType:
                           case doubleType:
                              //out.z.concatx("value");
                              out.z.concatx("return lib.", p.fpnGet, "(", selfimpl, ")");
                              break;
                           case pointerType:
                              if(p.pt.dataType.type.kind == charType && p.pt.dataType.type.isSigned)
                              {
                                 out.z.concatx("value = lib.", p.fpnGet, "(", selfimpl, "); ");
                                 out.z.concatx("return None if value == ffi.NULL else ffi.string(value).decode('u8')");
                              }
                              //else if(p_pt_dataType_type_kind_isPythonNative)
                              /*else if(isTypePythonNative(p.pt.dataType.type) || p.pt.dataType.type.kind == voidType)
                                 out.z.concatx("lib.", p.fpnGet, "(self); ");*/
                              else
                                 out.z.concatx("return lib.", p.fpnGet, "(", selfimpl, ")");
                              break;
                           case classType:
                           {
                              BClass cType = p.pt.dataType._class.registered;
                              if(cType.isBool)
                                 out.z.concatx("return lib.", p.fpnGet, "(", selfimpl, ")");
                              else if(cType.isString || cType.isCharPtr)
                              {
                                 out.z.concatx("value = lib.", p.fpnGet, "(", selfimpl, ") if self is not None and self.impl != ffi.NULL else ffi.NULL; ");
                                 out.z.concatx("return None if value == ffi.NULL else ffi.string(value).decode('u8')");
                              }
                              else if(cType.cl.type == unitClass)
                              {
                                 out.z.concatx("return ", typeName, "(impl = lib.", p.fpnGet, "(", selfimpl, "))");
                              }
                              else if(cType.nativeSpec)
                                 out.z.concatx("return lib.", p.fpnGet, "(", selfimpl, ")");
                              else if(cType.cl.type == normalClass)
                              { // here todo handle Container<GeoPoint> for PolygonContour::points and others
                                 /*out.z.concatx(ln);
                                 out.z.concatx(sk, "      value = lib.", p.fpnGet, "(", selfimpl, ")", ln);
                                 out.z.concatx(sk, "      if value != ffi.NULL: return ", typeName, "(impl = value)", ln);
                                 out.z.concatx(sk, "      else: return None");*/
                                 out.z.concatx("return pyOrNewObject(", typeName, ", lib.", p.fpnGet, "(", selfimpl, "))");
                              }
                              else if(cType.cl.type == structClass)
                              {
                                 out.z.concatx("value = ", typeName, "();");
                                 out.z.concatx(" lib.", p.fpnGet, "(", selfimpl, ", ffi.cast(\"", typeName, " *\", value.impl));");
                                 out.z.concat(" return value");
                              }
                              // FIX #05 (15.)
                              else if(cType.cl.type == bitClass || cType.cl.type == noHeadClass)
                                 out.z.concatx("return ", typeName, "(impl = lib.", p.fpnGet, "(", selfimpl, "))");
                              else if(cType.cl.type == enumClass)
                              {
                                 //bool impl = cType.cl.base.type != systemClass;
                                 //out.z.concatx("return lib.", p.fpnGet, "(", selfimpl, ", value", impl ? ".impl" : "", ")");
                                 out.z.concatx("return lib.", p.fpnGet, "(", selfimpl, ")");
                              }
                              else
                              //{
                              //   out.z.concatx("value = ", typeName, "(); ");
                                 out.z.concatx("return lib.", p.fpnGet, "(", selfimpl, ", value.impl)");
                              //}
                              break;
                           }
                           case templateType:
                              out.z.concatx("value = lib.", p.fpnGet, "(", selfimpl, ");");
                              out.z.concatx(" return pyOrNewObject(Instance, lib.oTAInstance(value))");
                              break;
                           case subClassType:
                              out.z.concatx("value = Class(); ");
                              out.z.concatx("return lib.", p.fpnGet, "(", selfimpl, ", value.impl)");
                              break;
                           case thisClassType:
                              // todo tofix
                              break;
                           default:
                              conmsg("check");
                        }
                        out.z.concatx(ln);
                     }

                     if(p.pt.Set)
                     {
                        BClass cType = itmpptype.kind == classType ? itmpptype._class.registered : null;
                        //List<Class> lineage = cType ? getClassLineage(cType.cl) : null;
                        out.z.concatx(sk, "   @", itmppname, ".setter", ln);
                        out.z.concatx(sk, "   def ", itmppname, "(self, value):", ln);
#if 0
                        if(/*c.cl.type == structClass && */!(typeIsNative(itmpptype) || typeIsClassNative(itmpptype) ||
                              typeIsSomething(itmpptype) || typeHasTemplateClass(itmpptype)) &&
                              itmpptype.kind == classType && itmpptype._class.registered &&
                              /*(itmpptype._class.registered.type == bitClass || itmpptype._class.registered.type == unitClass ||
                              itmpptype._class.registered.type == structClass)*/
                              !cType.isString && !cType.isBool)// &&
                              //itmpptype._class.registered && reduceUnitClass(itmpptype._class.registered) != itmpptype._class.registered)
                              //!c.cl.templateClass)
                           ;
#endif // 0
                        if(/*c.cl.type == structClass && */!(typeIsNative(itmpptype) || typeIsClassNative(itmpptype) ||
                              typeIsSomething(itmpptype) || typeHasTemplateClass(itmpptype)) &&
                              itmpptype.kind == classType && itmpptype._class.registered)// &&
                              //itmpptype._class.registered && reduceUnitClass(itmpptype._class.registered) != itmpptype._class.registered)
                              //!c.cl.templateClass)
                        {
                           Class clBaseUnit;
                           for(clBaseUnit = itmpptype._class.registered; clBaseUnit && clBaseUnit.base.type == unitClass; clBaseUnit = clBaseUnit.base);
                           //out.z.concatx(ln);
                           out.z.concatx(sk, "      if not isinstance(value, ", clBaseUnit.name, "): value = ", typeName, "(value)", ln);
                           //out.z.concatx(sk, "      self.impl.", itmppname, " = value", ln);
                           //oneliner = false;
                        }
                        /*if((!mp.isProperty || pt.Set) && !(typeIsNative(itmpptype) || typeIsClassNative(itmpptype) ||
                              typeIsSomething(itmpptype) || typeHasTemplateClass(itmpptype)) &&
                              reduceUnitClass(cType.cl) != cType.cl)// &&
                              //!c.cl.templateClass)
                        {
                           //const char * typeName = dm.dataType.kind == classType && dm.dataType._class.registered ? dm.dataType._class.registered.itmppname : "FixTypeNameIssue"; //getSimpleDataTypeName(dm.dataType, dm.dataTypeString, 0, false, g.lib.ecereCOM, null);
                           Class clBaseUnit;
                           for(clBaseUnit = itmpptype._class.registered; clBaseUnit && clBaseUnit.base.type == unitClass; clBaseUnit = clBaseUnit.base);
                           out.z.concatx(ln);
                           out.z.concatx(sk, "         if not isinstance(", itmppname, ", ", clBaseUnit.itmppname, "): ", itmppname, " = ", typeName, "(", itmppname, ")", ln);
                           out.z.concat("        ");
                        }*/
                        if((itmpptype.kind == classType && itmpptype._class.registered &&
                              itmpptype._class.registered.type == unitClass) ||
                              (!isTypePythonNative(itmpptype) && itmpptype.kind == classType && !cType.isBool && !cType.isString))
                           ; //out.z.concatx(ln);
                        else
                           out.z.concatx("      lib.", p.fpnSet, "(", selfimpl, ", ");
                        /*if(isTypePythonNative(itmpptype) || (itmpptype.kind == pointerType &&
                              (isTypePythonNative(itmpptype.type) || itmpptype.type.kind == voidType)))
                           out.z.concatx("self, ");
                        else
                           out.z.concatx("self.impl, ");*/
                        //if(!strcmp(c.itmppname, "Window") && !strcmp(p.itmppname, "hasMaximize"))
                        //if(isTypePythonNative(itmpptype)) // tofix right now (since units aren't derived from int / double / float)
                        //   out.z.concatx("value");         // it would be wrong to say that a unitclass is native and .impl is reqired
                        if(!(itmpptype.kind == classType && itmpptype._class.registered &&
                              itmpptype._class.registered.type == unitClass) && isTypePythonNative(itmpptype))
                           out.z.concatx("value");
                        else
                        {
                           switch(itmpptype.kind)
                           {
                              case charType:
                                 break;
                              case pointerType:
                                 if(itmpptype.type.kind == charType && itmpptype.type.isSigned)
                                    out.z.concatx("value.encode('u8')");
                                 else if(isTypePythonNative(itmpptype.type) || itmpptype.type.kind == voidType)
                                    out.z.concatx("value");
                                 else
                                    out.z.concatx("value.impl");
                                 break;
                              case classType:
                              {
                                 if(cType.isBool)
                                    out.z.concatx("value");
                                 else if(cType.isString)
                                    out.z.concatx("value.impl.encode('u8')");
                                 else if(cType.cl.type == structClass/* || cType.cl.type == noHeadClass*/)
                                    out.z.concatx("      lib.", p.fpnSet, "(", selfimpl, ", ffi.cast(\"", typeName, " *\", value.impl)");
                                 else if(cType.cl.type == enumClass)
                                 {
                                    bool impl = cType.cl.base.type != systemClass;
                                    out.z.concatx("      lib.", p.fpnSet, "(", selfimpl, ", value", impl ? ".impl" : "", "");
                                 }
                                 else
                                 {
                                    Class clType = itmpptype._class.registered;
                                    //int i = 0;
                                    //const char * comma = "";
                                    //DataMember dm; IterDataMember itd { cType.cl };
                                    //DataMember dm; IterClassHierarchyMemberOrProperty itmp { lineage = lineage };
                                    //out.z.concatx("      if not isinstance(value, ", typeName, "): value = ", typeName, "(value)", ln);
                                    //out.z.concatx("      if isinstance(value, tuple): value = ", typeName, "(");
                                    //while((dm = itd.next(publicOnly)))
                                    /*while((dm = (DataMember)itmp.next(publicOnly)))
                                    {
                                       if(!dm.isProperty)
                                       {
                                          typeDataMember(dm, itmp.cl);
                                          conassert(dm.type == normalMember && dm.itmppname, "?");
                                          out.z.concatx(comma, dm.itmppname, "=value[", i++, "] if len(value) >= ", i, " else 0");
                                          comma = ", ";
                                       }
                                    }
                                    out.z.concatx(")", ln);*/
                                    //out.z.concatx("      else: value = ", typeName, "()", ln);
                                    if(clType.templateClass && !strcmp(clType.templateClass.name, "Container"))
                                    {
                                       const char * tp = strchr(clType.name, '<');
                                       char * tp2 = getNoNamespaceString(tp, null, false);
                                       out.z.concatx("      if not isinstance(value, Container):", ln);
                                       out.z.concatx("         value = Array(\"", tp2, "\", value)", ln); //<GeoPoint>
                                       delete tp2;
                                    }
                                    out.z.concatx("      lib.", p.fpnSet, "(", selfimpl, ", value.impl");
                                 }
                                 /*else
                                    out.z.concatx("value.impl");*/
                                 break;
                              }
                              case templateType:
                                 out.z.concatx("TA(value)");
                                 break;
                              default:
                                 conmsg("check");
                           }
                        }
                        out.z.concatx(")", ln); // value.value
                     }
                     if(p.pt.IsSet)
                     {
                        out.z.concatx(sk, "   # @", itmppname, ".isset # tofix: how do we get isset?", ln);
                        out.z.concatx(sk, "   # def ", itmppname, "(self): lib.", p.fpnIst, "(", selfimpl, ")", ln);
                     }
                  }
               }
            }
            delete itmppname;
         }
         delete propNames;
      }

      if(c.cl.type != unitClass)
      // conversions?
      {
         BProperty p; IterConversion itc { c.cl };
         while((p = itc.next(publicOnly)))
         {
            // conversion
            //bool df = !p.convNative;
            if(p.convNative)
            {
               if(!strcmp(p.name, "int") || !strcmp(p.name, "double") || !strcmp(p.name, "float"))
               {
                  const char * type = !strcmp(p.name, "double") ? "float" : p.name;
                  out.z.concatx(ln, sk, "   def __", type, "__(self): return lib.", p.fpnGet, "(self.impl)", ln);
               }
               else if(!strcmp(p.name, "char"))
                  ; // todo: implement
               else if(!strcmp(p.name, "char_ptr"))
               {
                  if(!strcmp(c.name, "String"))
                     out.z.concatx(ln, sk, "   def __str__(self): return ffi.string(self.impl).decode('u8') if self.impl != ffi.NULL else str()", ln);
                  else
                     out.z.concatx(ln, sk, "   def __str__(self): return ffi.string(lib.", p.fpnGet, "(self.impl)).decode('u8') if self.impl != ffi.NULL else str()", ln);
               }
               else
                  conmsg("check");
            }
            else if(p.cConv)
            {
               //bool impl = p.cConv.cl.type == unitClass || p.cConv.cl.type == structClass;
               switch(p.cConv.cl.type)
               {
                  case normalClass:
                     out.z.concatx(ln, sk, "   # def ", p.fpnGet, "(self): return pyOrNewObject(", p.cConv.cl.name, ", lib.", p.fpnGet, "(self.impl))", ln);
                     break;
                  case noHeadClass:
                     out.z.concatx(ln, sk, "   # def ", p.fpnGet, "(self): return ", p.cConv.cl.name, "(impl = lib.", p.fpnGet, "(self.impl))", ln);
                     break;
                  case structClass:
                     out.z.concatx(ln, sk, "   # def ", p.fpnGet, "(self): value = ", p.cConv.cl.name, "(); lib.", p.fpnGet, "(self.impl, ffi.cast(\"", p.cConv.cl.name, " *\", value.impl)); return", ln);
                     break;
                  case bitClass:
                     out.z.concatx(ln, sk, "   # def ", p.fpnGet, "(self): return ", p.cConv.cl.name, "(impl = lib.", p.fpnGet, "(self.impl))", ln);
                     break;
                  case unitClass:
                     out.z.concatx(ln, sk, "   # def ", p.fpnGet, "(self): return ", p.cConv.cl.name, "(lib.", p.fpnGet, "(self.impl))", ln);
                     break;
                  default: conmsg("check");
               }
               out.z.concatx(ln,
                             sk, "   # here is an unhandled conversion: ",
                                   c.name, "::", p.name, " (", c.cl.type, " 2 ", p.cConv.cl.type, ")", ln,
                             //sk, "   @property", ln,
                             sk, "   # ", p.fpnGet, ln,
                             sk, "   # ", p.fpnSet, ln);
            }
            else conmsg("check");
         }
      }

      // methods
      {
         BMethod m; IterMethod itm { c.cl };
         while((m = itm.next(publicOnly))) //publicVirtual
         {
            bool isStatic = m.md.dataType.staticMethod;
            const char * comma = isStatic ? "" : ", ";
            m.init(itm.md, c, g);

            // method
            {
               bool thisClass = m.md.dataType.thisClass && m.md.dataType.thisClass.string;
               const char * classString = thisClass ? !strcmp(m.md.dataType.thisClass.string, "class") ?
                     "Instance" : m.md.dataType.thisClass.string : c.cl.name;
               Type thisType = ProcessTypeString(classString, false);
               char * typeName = printType(thisType, false, false, true);
               char * name = CopyAllNonCapsString(typeName);
               char * mname = pyGetNoConflictSymbolName(m.mname);
               char * t = new char[2];
               t[0] = (char)tolower(typeName[0]);
               t[1] = 0;
               if(m.md.type == virtualMethod)
               {
                  /*int ap = 0;
                  Type param;
                  out.z.concatx(sk, "   def ", mname, "(self");
                  IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
                  while(itr.next(paramFilter/-*tofix: { all = true, ellipsisOn = false }*-/))
                     out.z.concatx(", ", itr.name);
                  out.z.concatx("):", ln);
                  out.z.concatx(sk, "      lib.", m.s, "(self.impl");
                  IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
                  while(itr.next(paramFilter/-*tofix: { all = true, ellipsisOn = false }*-/))
                  {
                     if(param.templateParameter)
                        out.z.concatx(", TA(", itr.name, ")");
                     else
                        out.z.concatx(", ", itr.name);
                  }
                  out.z.concatx(")", ln);*/
//#if 0 // temporary
                  out.z.concatx(ln);
                  out.z.concatx(sk, "   def fn_unset_", m.s, "(self"); // , m, b, x, y, mods
                     //out.z.concatx(", __", t);
                  comma = ", ";
                  if(!m.md.dataType.staticMethod && thisClass)
                     out.z.concatx(comma, "_", name);
                  if(!paramsIsOnlyVoid(&m.md.dataType.params))
                  {
                     IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
                     while(itr.next(paramFilter/*tofix: { all = true, ellipsisOn = false }*/))
                     {
                        if(itr.pm.kind == ellipsisType)
                           out.z.concatx(comma, "*args");
                        else
                           out.z.concatx(comma, itr.name);
                        if(!comma[0]) comma = ", ";
                     }
                  }
                  out.z.concatx("):", ln);
                  {
                     IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
                     while(itr.next(paramFilter/*tofix: { all = true, ellipsisOn = false }*/))
                     {
                        if(itr.isReturnValue)
                           out.z.concatx("      if ", itr.name, " is None: ", itr.name, " = ffi.NULL", ln);
                     }
                  }
                  out.z.concatx(sk, "      return ");
                  if(typeReturnTypeRequiresPyObj(m.md.dataType))
                  {
                     Type rt = m.md.dataType.returnType;
                     Class clRT = rt.kind == classType ? rt._class.registered : null;
                     Class cl = clRT.templateClass ? clRT.templateClass : clRT;
                     out.z.concatx("pyOrNewObject(", cl.name, ", ");
                  }
                  out.z.concatx("lib.", m.s, "(self.impl"); // m.impl, b.impl, x, y, mods
                     //out.z.concatx(", __", t);
                  if(!m.md.dataType.staticMethod && thisClass)
                     out.z.concatx(", _", name, c && c.cl.type == normalClass ? ".impl" : "");
                  if(!paramsIsOnlyVoid(&m.md.dataType.params))
                  {
                     IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
                     while(itr.next(paramFilter/*tofix: { all = true, ellipsisOn = false }*/))
                     {
                        bool ptr = itr.isNullable;
                        //BClass c = itr.pm.kind == classType ? g.getClassFromType(itr.pm, true) : null;
                        if(itr.pm.kind == ellipsisType)
                           out.z.concatx(", *ellipsisArgs(args)");
                        else
                           out.z.concatx(", ", ptr ? "ffi.NULL if " : "", ptr ? itr.name : "", ptr ? " is None else " : "", itr.name, ptr ? ".impl" : ""/*, c && c.cl.type == normalClass ? ".impl" : ""*/);
                     }
                  }
                  if(typeReturnTypeRequiresPyObj(m.md.dataType))
                     out.z.concat(")");
                  out.z.concatx(")", ln);
                  out.z.concatx(ln);
                  out.z.concatx(sk, "   @property", ln,
                                sk, "   def ", mname, "(self):", ln,
                                sk, "      if hasattr(self, 'fn_", m.s, "'): return self.fn_", m.s, ln,
                                sk, "      else: return self.fn_unset_", m.s, ln,
                                sk, "   @", mname, ".setter", ln,
                                sk, "   def ", mname, "(self, value):", ln,
                                sk, "      self.fn_", m.s, " = value", ln,
                                sk, "      lib.Instance_setMethod(self.impl, \"", m.name, "\".encode('u8'), cb_", m.s, ")", ln);
                  delete t;
                  delete name;
                  delete typeName;
//#endif 0 // temporary
               }
               else if(m.md.type == normalMethod)
               {
                  // method
                  tmp_merge_FuncMethOutput(out, null, m, c, paramFilter, sk, mname, m.s, comma, !isStatic, selfimpl);
               }
               delete mname;
            }
         }
      }
      if(c.cl.type == unitClass)
      {
         out.z.concatx(ln);
         out.z.concatx(sk, c.symbolName, ".buc = ", cBase.cl.type == unitClass ? cBase.symbolName : c.symbolName, ln);
      }
      // end of class
      delete selfimpl;
   }
}

char * initArguments(PythonGen g, BClass c, BVariant v, BOutput out, const char * sk, List<Class> lineage, List<Class> lin,
      ClassHierarchyMemberOrPropertyFilter filter, bool hasUnion, int lineEachIndent, int * _memberLen, int * _otherCount)
{
   int len;
   int memberLen = *_memberLen;
   int otherCount = *_otherCount;
   char * firstArg = null;
   if(c.cl.type == normalClass && c.cl.templateParams.count) // todo? or base's or base's base's, etc?
      out.z.concat(", templateParams = None");
   if(c.cl.type == unitClass)
   {
      if(c.cl.base.type == systemClass)
         out.z.concat(", impl = 0");
      else if(c.cl.base.type == unitClass)
         out.z.concat(", value = 0, impl = None");
      else conmsg("check");
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
               out.z.concatx(", ", itmpp.name, " = ", zeroVal);
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
            bool useNone = c.cl.type == noHeadClass || itmpp.pt || hasUnion ||
                  (!typeIsClassType(itmpp.dm.dataType, enumClass) && !isTypePythonNative(itmpp.dm.dataType));
            printClassInitArgument(out, g, itmpp.name, useNone ? null : itmpp.dm.dataType, lineEachIndent, &memberLen, v);
            firstArg = CopyString(itmpp.name);

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
               char * mname;
               m.init(itm.md, cc, g);
               mname = pyGetNoConflictSymbolName(m.mname);
               printClassInitArgument(out, g, mname, null, lineEachIndent, &memberLen, v);
               delete mname;
            }
         }
      }
   }
   if(otherCount && c.cl.type == normalClass)
   {
      //out.z.concatx(",", ln);
      //out.z.concat("                impl = None");

      out.z.concat(",");
      if(lineEachIndent) out.z.concatx(ln, spaces(lineEachIndent, 0));
      out.z.concatx(lineEachIndent ? "" : " ", "impl = None");

      //out.z.concatx(",", " ", "impl = None");
   }
   // FIX #05 (8.)
   else if(c.cl.type == structClass || c.cl.type == bitClass || c.cl.type == noHeadClass || c.cl.type == normalClass)
   {
      out.z.concat(",");
      if(lineEachIndent) out.z.concatx(ln, spaces(lineEachIndent, 0));
      out.z.concatx(lineEachIndent ? "" : " ", "impl = None");
   }
   if(c.cl.type != enumClass)
      out.z.concatx("):", ln);
   *_memberLen = memberLen;
   *_otherCount = otherCount;
   return firstArg;
}

void theCallbacks(PythonGen g, BClass c, BOutput out, const char * sk, BProperty userDataProp)
{
   ParamFilter paramFilter { all = true };
   // methods
   {
      BMethod m; IterMethod itm { c.cl };
      while((m = itm.next(publicOnly))) //publicVirtual
      {
         m.init(itm.md, c, g);
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
            char * typeName = printType(thisType, false, false, true);
            char * iname = null;// = CopyAllNonCapsString(c.cl.name);
            char * t = PrintString("__", "x"); //new char[2];
            // todo: uint64_t vs tparam_Container_D (given "D") etc...
            char * returnType = m.md.dataType.returnType.kind == templateType ? CopyString("uint64_t") :
               cPrintType(m.md.dataType.returnType, false, false, true, true); // todo: add a * in some cases?
            const char * ret = m.md.dataType.returnType.kind == voidType ? "" : "return ";
            const char * comma = ", ";
            out.z.concatx(ln, sk, "@ffi.callback(\"", returnType, "(");
            delete returnType;
            t[2] = (char)tolower(typeName[0]);
            //t[1] = 0;
            //if(!m.md.dataType.staticMethod && thisClass)
               out.z.concatx(typeName), prevParam = true;
            if(!thisClass || !strcmp(c.cl.name, m.md.dataType.thisClass.string))
               iname = CopyAllNonCapsString(c.cl.name);
            if(!paramsIsOnlyVoid(&m.md.dataType.params))
            {
               IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
               while(itr.next(paramFilter/*tofix: { all = true, ellipsisOn = false }*/))
               {
                  bool isStruct = itr.isStruct;
                  char * modern = strTypeName("", { type = itr.pm, cl = c.cl }, { anonymous = true }, null);
                  if(!iname && !strcmp(c.cl.name, modern))
                     iname = CopyString(itr.name);
                  if(itr.pm.kind == templateType)
                  {
                     TemplateParameter tp = itr.pm.templateParameter;
                     Class cl = null;
                     ClassTemplateParameter ctp = findClassTemplateParameter(tp.identifier.string, c.cl, &cl);
                     if(tp.type == type && tp.identifier && tp.identifier.string)
                     {
                        char * type = g.allocMacroSymbolName(false, TP, { c = c }, c.name, ctp.name, 0);
                        out.z.concatx(prevParam ? ", " : "", type);
                        prevParam = true;
                        delete type;
                     }
                     else conmsg("check");
                  }
                  else if(itr.pm.kind == ellipsisType)
                     out.z.concatx(", *args");
                  else
                  {
                     char * type = printType(itr.pm, false, false, true);
                     //if(strcmp(type, modern)) conmsg("check");
                     out.z.concatx(prevParam ? ", " : "", modern, isStruct ? " *" : "");
                     prevParam = true;
                     delete type;
                  }
                  delete modern;
               }
               /*IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
               while(itr.next(paramFilter/-*tofix: { all = true, ellipsisOn = false }*-/))
               {
                  bool isStruct = param_isStruct;
                  char * modern = strTypeName("", { type = itr.pm, cl = c.cl }, { anonymous = true }, null);
                  if(!iname && !strcmp(c.cl.name, modern))
                     iname = CopyString(itr.name);
                  if(itr.pm.kind == templateType)
                  {
                     TemplateParameter tp = itr.pm.templateParameter;
                     Class cl = null;
                     ClassTemplateParameter ctp = findClassTemplateParameter(tp.identifier.string, c.cl, &cl);
                     if(tp.type == type && tp.identifier && tp.identifier.string)
                     {
                        char * type = g.allocMacroSymbolName(false, TP, { c = c }, c.name, ctp.name, 0);
                        out.z.concatx(prevParam ? ", " : "", type);
                        prevParam = true;
                        delete type;
                     }
                     else conmsg("check");
                  }
                  else
                  {
                     //int p;
                     //int ptr = 0;
                     char * type = printType(itr.pm, false, false);
                     // todo tofix -- getSimpleDataTypeName is no longer used anywher... astTypeSpec would be where the newer code is
                     //Type tx = unwrapPointerType(itr.pm, &ptr);
                     //char * simple = getSimpleDataTypeName(tx, type, ptr, true, false, null);
                     //char * modern = strTypeName("", { type = itr.pm, cl = c.cl }, { anonymous = true }, null);
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
                     //   conmsg("check");
                     //if(!strcmp(modern, "bool"))
                     //   delete modern, modern = CopyString("uint32_t");
                     if(strcmp(type, modern))
                        conmsg("check");
                     out.z.concatx(prevParam ? ", " : "", modern, isStruct ? " *" : "");
                     prevParam = true;
                     delete type;
                     //delete simple;
                  }
                  delete modern;
               }*/
            }
            out.z.concatx(")\")", ln);
            out.z.concatx(sk, "def cb_", m.s, "(");
            prevParam = false;
            //if(!m.md.dataType.staticMethod && thisClass)
               out.z.concat(t), prevParam = true;
            if(!paramsIsOnlyVoid(&m.md.dataType.params))
            {
               IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
               while(itr.next(paramFilter/*tofix: { all = true, ellipsisOn = false }*/))
               {
                  if(itr.pm.kind == ellipsisType)
                     out.z.concatx(prevParam ? ", " : "", "*args");
                  else
                     out.z.concatx(prevParam ? ", " : "", itr.name);
                  prevParam = true;
               }
            }
            out.z.concatx("):", ln);
            if(!iname)
               iname = CopyAllNonCapsString(c.cl.name);
            if(thisClass)
            {
               char * userDataName = userDataProp ? PrintString(".", userDataProp.name) : CopyString("");
               out.z.concatx("   ", iname, " = pyOrNewObject(", c.cl.name, ", ", anyObject ? t : iname, ")", ln);
               out.z.concatx("   ", ret, iname, ".fn_", m.s, "(",
                     anyObject ? "" : "pyOrNewObject(", anyObject ? "" : c.cl.name, anyObject ? "" : ", ", anyObject ? iname : t,
                     anyObject ? userDataName : "", anyObject ? "" : ")");
               delete userDataName;
            }
            else if(thisTemplate)
            {
               Type param = m.md.dataType.params.first;
               out.z.concatx("   ", iname, " = pyOrNewObject(", c.cl.name, ", ", param.name, ")", ln);
               out.z.concatx("   ", ret, iname, ".fn_", m.s, "(pyObject(lib.oTAInstance(", t, "))");
            }
            else
            {
               out.z.concatx("   ", iname, " = pyOrNewObject(", c.cl.name, ", ", t, ")", ln);
               out.z.concatx("   ", ret, iname, ".fn_", m.s, "(", iname);
            }
            if(!paramsIsOnlyVoid(&m.md.dataType.params))
            {
               IterParamPlus itr { &m.md.dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
               while(itr.next(paramFilter/*tofix: { all = true, ellipsisOn = false }*/))
               {
                  bool first = thisClass && itr.pm == m.md.dataType.params.first;
                  char * _type = printType(itr.pm, false, false, false);
                  char * type = getNoNamespaceString(_type, null, false);
                  if(thisTemplate && itr.pm == m.md.dataType.params.first)
                     out.z.concatx(", ", iname);
                  else if(itr.pm.kind == ellipsisType)
                     out.z.concatx(comma, "*ellipsisArgs(args)");
                  else
                     printArgPassing(out, comma, itr.name, type, itr.pm, true, first, false, true);
                  delete type;
                  delete _type;
               }
            }
            out.z.concatx(")", ln);
            //out.z.concatx(ln);
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

static void tmp_merge_FuncMethOutput(BOutput out, BFunction f, BMethod m, BClass c, ParamFilter paramFilter,
      const char * sk, const char * name, const char * libname, const char * comma, bool self, const char * selfimpl)
{
   int ind = f ? 0 : 3;
   int multireturn = 0;
   bool convertTypedArgs = false;
   bool returnTypedObject = false;
   Type dataType = f ? f.fn.dataType : m.md.dataType;
   Type t = unwrapPointerType(dataType, null);
   if(!paramsIsOnlyVoid(&t.params))
   {
      bool prevIsTypedObject = false;
      IterParamPlus itr { &t.params/*, anon = true, getName = pyGetNoConflictSymbolName*/ };
      while(itr.next(paramFilter/*tofix: { all = true, ellipsisOn = false }*/))
      {
         if(prevIsTypedObject && itr.pm.kind == ellipsisType)
            convertTypedArgs = true;
         else if(itr.isReturnValue)
            multireturn++;
         else if(itr.isReturnTypedObject)
            returnTypedObject = true;
         prevIsTypedObject = itr.isTypedObject;
      }
   }
   if(convertTypedArgs)
      out.z.concatx(sln, sk, spaces(ind, 0), "def ", name,
            "(", self ? "self, " : "", "*args): lib.", libname,
            "(", self ? "self.impl, " : "", "*convertTypedArgs(args))", ln);
#if 0
   else if(f)
   {
      out.z.concatx(sk, "def ", name, "(");
      if(!paramsIsOnlyVoid(&t.params))
      {
         const char * comma = "";
         IterParamPlus itr { &t.params, anon = true, getName = pyGetNoConflictSymbolName };
         while(itr.next(paramFilter/*tofix: { all = true, ellipsisOn = false }*/))
         {
            if(itr.pm.kind == ellipsisType)
               out.z.concatx(comma, "*args");
            else
               out.z.concatx(comma, itr.name);
            comma = ", ";
         }
      }
      out.z.concatx("): ");
      if(dataType.returnType.kind != voidType) // todo, type conversion to py
         out.z.concatx("return ");
      out.z.concatx("lib.", libname, "(");
      if(!paramsIsOnlyVoid(&t.params))
      {
         const char * comma = "";
         IterParamPlus itr { &t.params, anon = true, getName = pyGetNoConflictSymbolName };
         while(itr.next(paramFilter/*tofix: { all = true, ellipsisOn = false }*/))
         {
            if(itr.pm.kind != ellipsisType)
            {
               bool ptr = itr.isNullable;
               out.z.concatx(comma, ptr ? "ffi.NULL if " : "", ptr ? itr.name : "", ptr ? " is None else " : "", itr.name, ptr ? ".impl" : "");
               comma = ", ";
            }
         }
      }
      out.z.concatx(")", ln);
   }
#endif // 0
   else
   {
      bool ret = /*!multireturn && */dataType.returnType.kind != voidType;
      Type rt = dataType.returnType;
      Class clRT = rt.kind == classType ? rt._class.registered : null;
      BClass cRT = clRT;

      out.z.concatx(sln, sk, spaces(ind, 0), "def ", name, "(", self ? "self" : "");
      if(!paramsIsOnlyVoid(&dataType.params))
      {
         bool defNone = true;
         Type pm = null;
         IterParamPlus itr { &dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
         while(itr.prev(paramFilter/*tofix: { all = true, ellipsisOn = false }*/))
         {
            if(itr.isReturnValue) continue;
            if(itr.isNullable/* && itr.pm.constant*/) // todo -- test this... see diffs...
            {
               if(defNone)
                  pm = itr.pm;
            }
            else
               defNone = false;
         }
         defNone = false;
         while(itr.next(paramFilter/*tofix: { all = true, ellipsisOn = false }*/))
         {
            if(itr.isReturnValue) continue;
            // FIX #05
            //out.z.concatx(", ", itr.name, itr.last && itr.isNullable ? " = None" : "");
            if(itr.pm == pm)
               defNone = true;
            if(itr.pm.kind == ellipsisType)
               out.z.concatx(comma, "*args");
            else
               out.z.concatx(comma, itr.name, defNone ? " = None" : "");
            if(!comma[0]) comma = ", ";
         }
         comma = self ? ", " : "";
      }
      out.z.concatx("):", ln);
      ind += 3;
      /*if(!paramsIsOnlyVoid(&dataType.params))
      {
         IterParamPlus itr { &dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
         while(itr.next(paramFilter/-*tofix: { all = true, ellipsisOn = false }*-/))
         {
            if(itr.isReturnValue || !(itr.last && itr.isNullable)) continue;
            out.z.concatx(sk, spaces(ind, 0), "if ", itr.name, " is None: ", itr.name, " = ffi.NULL", ln);
         }
      }*/
      //if region is None: region = ffi.NULL
      //if(multireturn)
      if(!paramsIsOnlyVoid(&dataType.params))
      {
         IterParamPlus itr { &dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
         while(itr.next(paramFilter/*tofix: { all = true, ellipsisOn = false }*/))
         {
            const char * pn = itr.name;
            if(itr.pm.kind == ellipsisType) continue;
            //if(itr.pm.kind == classType && itr.pm._class.registered && !strcmp(itr.pm._class.registered.name, "class"))
            if(itr.isReturnTypedObject)
               out.z.concatx(sk, spaces(ind, 0), "_", pn, " = pyAddrTypedObject(", pn, ")", ln);
            else if(itr.isReturnValue)
            {
               char * _type = printType(itr.pm, false, false, true);
               char * type = getNoNamespaceString(_type, null, false);
               if(itr.isNoHead)
                  out.z.concatx(sk, spaces(ind, 0), pn, " = ffi.cast(\"", type, " *\", lib.Instance_new(lib.class_", type, "))", ln); //int *
               else
                  out.z.concatx(sk, spaces(ind, 0), pn, " = ffi.new(\"", type, itr.isStruct ? " *" : "", "\")", ln); //int *
               delete _type;
               delete type;
            }
            else if(itr.pm.kind == pointerType && itr.pm.type.kind == voidType)
            {
               out.z.concatx(sk, spaces(ind, 0), "if hasattr(", pn, ", 'impl'): ", pn, " = ", pn, ".impl", ln);
               out.z.concatx(sk, spaces(ind, 0), "if ", pn, " is None: ", pn, " = ffi.NULL", ln);
            }
            else if(itr.isTypeStr)
            {
               out.z.concatx(sk, spaces(ind, 0), "if isinstance(", pn, ", str): ", pn, " = ffi.new(\"char[]\", ", pn, ".encode('u8'))", ln);
               out.z.concatx(sk, spaces(ind, 0), "elif ", pn, " is None: ", pn, " = ffi.NULL", ln);
            }
            else if(!(typeIsNative(itr.pm) || typeIsClassNative(itr.pm) ||
                  typeIsSomething(itr.pm) || typeHasTemplateClass(itr.pm) || itr.pm.kind == intPtrType))// &&
                  //itr.pm._class.registered && reduceUnitClass(itr.pm._class.registered) != itr.pm._class.registered)
            {
               const char * typeName = itr.pm.kind == classType && itr.pm._class.registered ? itr.pm._class.registered.name : "FixTypeNameIssue"; //getSimpleDataTypeName(itr.pm, itr.pm.dataTypeString, 0, false, g.lib.ecereCOM, null);
               Class clBaseUnit;
               for(clBaseUnit = itr.pm._class.registered; clBaseUnit && clBaseUnit.base.type == unitClass; clBaseUnit = clBaseUnit.base);
               out.z.concatx(sk, spaces(ind, 0), "if ", pn, " is not None and not isinstance(", pn, ", ", clBaseUnit.name, "): ", pn, " = ", typeName, "(", pn, ")", ln);
               if(itr.pm.kind == classType && itr.pm._class.registered && itr.pm._class.registered.type == structClass)
                  //out.z.concatx(sk, spaces(ind, 0), pn, " = ffi.NULL if ", pn, " is None else ffi.cast(\"", typeName, " *\", ", pn, ".impl)", ln);
                  out.z.concatx(sk, spaces(ind, 0), pn, " = ffi.NULL if ", pn, " is None else ", pn, ".impl", ln);
               else if(itr.pm.kind == classType && itr.pm._class.registered &&
                        (itr.pm._class.registered.type == normalClass || itr.pm._class.registered.type == noHeadClass))
               {
                  out.z.concatx(sk, spaces(ind, 0), pn, " = ffi.NULL if ", pn, " is None else ", pn, ".impl", ln);
               }
               else
               {
                  out.z.concatx(sk, spaces(ind, 0), "if ", pn, " is None: ", pn, " = ", "ffi.NULL", ln);
                  /*if(itr.pm.kind == classType && itr.pm._class.registered &&
                        (itr.pm._class.registered.type == normalClass || itr.pm._class.registered.type == noHeadClass))
                     out.z.concatx(sk, spaces(ind, 0), "else:", ln, sk, spaces(ind+3, 0), pn, " = ", pn, ".impl", ln);*/
               }
               //out.z.concatx(sk, spaces(ind, 0), "if ", pn, " is None: ", pn, " = ", "ffi.NULL", ln);
               //out.z.concatx(sk, spaces(ind, 0), "elif not isinstance(", pn, ", ", clBaseUnit.name, "): ", pn, " = ", typeName, "(", pn, ")");
               //if(itr.pm.kind == classType && itr.pm._class.registered && itr.pm._class.registered.type == structClass)
               //   out.z.concatx("; ", pn, " = ffi.cast(\"", typeName, " *\", ", pn, ".impl)", ln);
               //else
               //   out.z.concatx(ln);
            }
         }
      }

      out.z.concatx(sk, spaces(ind, 0));
      if(ret)
      {
         if(multireturn > 0)
            out.z.concatx("r = ");
         else
            out.z.concatx("return ");
      }
      if(typeReturnTypeRequiresPyObj(dataType))
      {
         // FIX #04
         Class cl = clRT.templateClass ? clRT.templateClass : clRT;
         out.z.concatx("pyOrNewObject(", cl.name, ", lib.", libname, "(", self ? selfimpl : "");
         // todo or use pyornewobject
         //out.z.concatx(sk, spaces(ind, 0), "impl = lib.", libname, "(", self ? selfimpl : "");
      }
      /*else if(c && c.cl.type == structClass)
      {
         out.z.concatx(sk, spaces(ind, 0), "lib.", libname, "(");
         if(self)
            out.z.concatx("ffi.cast(\"", c.name, c.cl.type == structClass ? " *" : "", "\", self.impl)");
      }*/
      else
      {
         // FIX #05
         if(clRT && ((clRT.type == unitClass && !cRT.isUnichar) || clRT.type == bitClass || clRT.type == structClass))
            out.z.concatx(cRT.name, "(impl = ");
         else if(clRT && clRT.type == normalClass)
         {
            if(cRT.isString)
               out.z.concatx("String(");
            else
               out.z.concatx("pyOrNewObject(", cRT.name, ", ");
         }
         //out.z.concatx(sk, spaces(ind, 0), ret ? "return " : "", "lib.", libname, "(", self ? "self.impl" : "");
         out.z.concatx("lib.", libname, "(");
         if(self && c && c.cl.type == structClass)
            out.z.concatx("ffi.cast(\"", c.name, " *", "\", self.impl)"); // todo: move this case (structClass) to selfimpl initialization
         else if(self)
            out.z.concatx(selfimpl);
      }
      if(!paramsIsOnlyVoid(&dataType.params))
      {
         IterParamPlus itr { &dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
         while(itr.next(paramFilter/*tofix: { all = true, ellipsisOn = false }*/))
         {
            char * _type = printType(itr.pm, false, false, true);
            char * type = getNoNamespaceString(_type, null, false);
            if(itr.pm.kind == ellipsisType)
               out.z.concatx(comma, "*ellipsisArgs(args)");
            else
               printArgPassing(out, comma, itr.name, type, itr.pm, false, false, true, false);
            if(!comma[0]) comma = ", ";
            delete type;
            delete _type;
            /*BClass c = itr.pm.kind == classType ? g.getClassFromType(itr.pm, true) : null;
            out.z.concatx(", ", itr.name, c && c.cl.type == normalClass ? ".impl" : "");*/
         }
      }
      out.z.concat(")");
      if(typeReturnTypeRequiresPyObj(dataType))
      {
         if(clRT.templateClass)
         {
            const char * tp = strchr(clRT.name, '<');
            char * tp2 = getNoNamespaceString(tp, null, false);
            out.z.concatx(", \"", tp2, "\")");
            delete tp2;
         }
         else
            out.z.concat(")");
      }
      else if((clRT &&
            ((clRT.type == unitClass && !cRT.isUnichar) || clRT.type == bitClass || clRT.type == structClass || clRT.type == normalClass)))
         out.z.concat(")");
      out.z.concatx(ln);
      if(multireturn > 0)
      {
         Type tPrev { };
         BClass cPrev = null;
         IterParamPlus itr { &dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
         while(itr.next(paramFilter/*tofix: { all = true, ellipsisOn = false }*/))
         {
            // shaky non-hack -- this might be too general to be acceptable? should be a hardcoded hack instead?
            //      non-hack / detection: void ** parameter preceded by a Class parameter
            if(itr.isVoidPtrReturn)
            {
               out.z.concatx(sk, spaces(ind, 0), "if ", itr.name, "[0] == ffi.NULL: _", itr.name, " = None", ln);
               if(cPrev && cPrev.isClass)
               {
                  // todo: support more class types?
                  out.z.concatx(sk, spaces(ind  , 0), "else:", ln);
                  ind += 3;
                  out.z.concatx(sk, spaces(ind  , 0), "if ", tPrev.name, ".type == ClassType.normalClass:", ln);
                  out.z.concatx(sk, spaces(ind+3, 0), "i = ffi.cast(\"Instance\", ", itr.name, "[0])", ln);
                  out.z.concatx(sk, spaces(ind+3, 0), "n = ffi.string(i._class.name).decode('u8')", ln);
                  out.z.concatx(sk, spaces(ind  , 0), "else:", ln);
                  out.z.concatx(sk, spaces(ind+3, 0), "n = ffi.string(", tPrev.name, ".name).decode('u8')", ln);
                  out.z.concatx(sk, spaces(ind  , 0), "t = pyTypeByName(n)", ln);
                  out.z.concatx(sk, spaces(ind  , 0), "ct = n + \" * \" if ", tPrev.name, ".type == ClassType.noHeadClass else n", ln);
                  out.z.concatx(sk, spaces(ind  , 0), "_", itr.name, " = t(impl = pyFFI().cast(ct, ", itr.name, "[0]))", ln);
                  ind -= 3;
               }
               else
                  out.z.concatx(sk, spaces(ind  , 0), "else: _", itr.name, " = ", itr.name, "[0]", ln);
            }
            cPrev = itr.pm.kind == classType ? itr.pm._class.registered : null;
            tPrev = itr.pm;
         }
      }
      if(multireturn > 0)
      {
         const char * comma = "";
         IterParamPlus itr { &dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
         out.z.concatx(sk, spaces(ind, 0), "return ", ret ? "r, " : "");
         while(itr.next(paramFilter/*tofix: { all = true, ellipsisOn = false }*/))
         {
            if(itr.isReturnValue)
            {
               if(itr.isVoidPtrReturn)
                  out.z.concatx(comma, "_", itr.name);
               else if(itr.pm.kind == pointerType && itr.typeIsReturnable && itr.typeIsNative)
                  out.z.concatx(comma, itr.name, "[0]");
               else
               {
                  const char * typeName = itr.pm.type.kind == classType && itr.pm.type._class.registered ? itr.pm.type._class.registered.name : "FixTypeNameIssue"; //getSimpleDataTypeName(itr.pm, dm.dataTypeString, 0, false, g.lib.ecereCOM, null);
                  out.z.concatx(comma, typeName, "(impl = ", itr.name, "[0]", ")");
               }
               if(!*comma) comma = ", ";
            }
         }
         out.z.concatx(ln);
      }
      else if(returnTypedObject)
      {
         IterParamPlus itr { &dataType.params, anon = true, getName = pyGetNoConflictSymbolName };
         out.z.concatx(sk, spaces(ind, 0), "return pyRetAddrTypedObject(");
         while(itr.next(paramFilter/*tofix: { all = true, ellipsisOn = false }*/))
         {
            if(itr.isReturnTypedObject)
            {
               out.z.concatx(itr.name, ", _", itr.name, "[1]");
               break;
            }
         }
         out.z.concatx(")", ln);
      }
   }
}

static void printArgPassing(BOutput out, const char * comma, const char * name, const char * type, Type param,
      bool callback, bool plain, bool cast, bool encode)
{
   switch(param.kind)
   {
      case voidType:
         break;
      case charType: case shortType: case intType:
      case int64Type: case int128Type: case longType: case floatType:
      case doubleType: case intPtrType:
         out.z.concatx(comma, name);
         break;
      case pointerType:
      {
         switch(param.type.kind)
         {
            case charType:
               if(param.type.isSigned)
                  out.z.concatx(comma, name, encode ? ".encode('u8')" : "");
               else
                  out.z.concatx(comma, name);
               break;
            case voidType: case shortType: case intType:
            case int64Type: case int128Type: case longType: case floatType:
            case doubleType: case intPtrType:
            case classType:
            case pointerType:
            case structType:
               out.z.concatx(comma, name);
               break;
            case functionType:
               break;
            default:
               conmsg("check");
         }
         break;
      }
      case classType:
      {
         BClass c = param._class.registered;
         if(c && c.is_class && param.classObjectType == typedObject && param.byReference)
            out.z.concatx(comma, "*_", name);
         else if(c && c.is_class && param.classObjectType == typedObject && !param.byReference)
            out.z.concatx(comma, "*pyTypedObject(", name, ")");
         else if(c && c.cl.type == unitClass && !c.isUnichar)
            out.z.concatx(comma, name, ".impl");
         else if(c && (c.nativeSpec || c.isBool))
            out.z.concatx(comma, name);
         else if(c && c.cl.templateClass)
         {
            char * str = strchr(type, '<');
            if(callback)
               out.z.concatx(comma, c.cl.templateClass.name, "(\"", str, "\", impl = ", name, ")");
            else // todo tofix likely not right // only 3 instances of this :P
               out.z.concatx(comma, c.cl.templateClass.name, c && c.cl.type == normalClass ? ".impl" : "");
         }
         else
         {
            if(plain)
               out.z.concatx(comma, name);
            else if(callback)
            {
               if(!c)
                  c = eSystem_FindClass(__thisModule.application, param._class.string);   // Cheat for ec module depending on ecere module
               if(c.cl.type == normalClass)
                  out.z.concatx(comma, "pyOrNewObject(", type, ", ", name, ")");
               else
                  out.z.concatx(comma, type, "(impl = ", name, ")");
            }
            else if(cast && param.kind == classType && param._class.registered &&
                  (param._class.registered.type == noHeadClass || param._class.registered.type == structClass))
            {
               if(param._class.registered.type == noHeadClass)
                  out.z.concatx(comma, "ffi.cast(\"struct ", c.name, " *\", ", name/*, c && c.cl.type == normalClass ? ".impl" : ""*/, ")");
               else
                  out.z.concatx(comma, "ffi.cast(\"", c.name, " *\", ", name/*, c && c.cl.type == normalClass ? ".impl" : ""*/, ")");
            }
            else
            {
               //bool ptr = true;
               //if(c.cl.type == structClass)
               //   out.z.concatx(comma, "ffi.cast(\"", c.name, " *", "\", ", name, ".impl)");
               //else
               //   out.z.concatx(comma, ptr ? "ffi.NULL if " : "", ptr ? name : "", ptr ? " is None else " : "", name, ptr ? ".impl" : ""/*, c && c.cl.type == normalClass ? ".impl" : ""*/);
               //out.z.concatx(comma, prefix ? "__i_" : "", name/*, c && c.cl.type == normalClass ? ".impl" : ""*/);
               out.z.concatx(comma, name/*, c && c.cl.type == normalClass ? ".impl" : ""*/);
            }
         }
         break;
      }
      case templateType:
         out.z.concatx(comma, "TA(", name, ")");
         break;
      default:
         if(!strcmp(type, "const String") || !strcmp(type, "String") || !strcmp(type, "const char *") || !strcmp(type, "char *"))
            out.z.concatx(comma, name, ".encode('u8')");
         else if(param.kind == classType && param._class && param._class.registered/* && param._class.registered.type == normalClass*/)
            out.z.concatx(comma, type, "(impl = ", name, ")");
         else
            out.z.concatx(comma, name);
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
   out.z.concat(",");
   if(lineEachIndent) out.z.concatx(ln, spaces(lineEachIndent, 0));
   out.z.concatx(lineEachIndent ? "" : " ", name, " = ", zeroVal);
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
               //v.processDependency(g, otypedef, otypedef, cl);
               return "0"; // return c.py_initializer;
            }
            else if(cl.type == unitClass)
            {
               //v.processDependency(g, otypedef, otypedef, cl);
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

static void generatePY(File out, PythonGen g)
{
   for(libDep : g.libDeps)
      out.PrintLn("from ", libDep.bindingName, " import *");
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
      sourceFileProcessToFile(out, null, ":src/py/py_functions_ec_begin.src", null, false, false);

   //pyNamespaces(out, g);
   //pySortedNamespaces(out, g);

   genPyOutputNodes(out, g);
   genPyOutputModuleSetupFunc(out, g);

   if(g.lib.ecereCOM)
      sourceFileProcessToFile(out, null, ":src/py/py_functions_ec_end.src", null, false, false);
}

static void genPyOutputNodes(File out, PythonGen g)
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
            out.Puts(o.z._string);
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
            out.Puts(o.z._string);
         }
         else conmsg("check");
      }
   }
   delete nodes;
}

static void genPyOutputModuleSetupFunc(File out, PythonGen g)
{
   const String moduleName = g.lib.moduleName;
   if(!g.lib.ecere && !g.lib.ecereCOM)
   {
      out.PrintLn("");
      out.PrintLn("def py", moduleName, "_setup(app):");
      out.PrintLn("   app.appGlobals.append(globals())");
      out.PrintLn("   if lib.", moduleName, "_init(app.impl) == ffi.NULL: raise Exception(\"Failed to load library\")");
      {
         ZString z { allocType = heap };
         genRegisterClassCalls(z, g, filterClassAll, "   ", "app");
         out.Puts(z._string);
         delete z;
      }
   }
}

bool filterClassAll(BClass c) { return true; }
bool filterClassEcereComExlusions(BClass c) { return !c.isCharPtr && !c.isWindow; }
void genRegisterClassCalls(ZString z, PythonGen g, bool(*filterClass)(BClass c), const String indent, const String symbol)
{
   BClass c; IterAllClass itacl { itn.module = g.mod, list = g.options.classList };
   while((c = itacl.next(all)))
   {
      if(c.cl.type == normalClass && !c.cl.templateClass && filterClass(c))
         z.concatx(indent, symbol, ".registerClass(", c.name, ", True)", ln);
   }
   itacl.cleanup();
}

static void generateBUILD(File out, PythonGen g)
{
   bool hasEC = false;
   const String moduleName = !strcmp(g.lib.moduleName, "ecereCOM") ? "ecere" : g.lib.moduleName;
   char cpath[MAX_FILENAME] = "";
   Library libDep = null;
   if(g.options.cpath)
   {
      const String dir = g.options.dir ? g.options.dir : "";
      strcpy(cpath, dir);
      PathCatSlash(cpath, g.options.cpath);
      MakeSlashPath(cpath);
   }
   if(!cpath[0]) strcpy(cpath, ".");

   for(libDep : g.libDeps)
   {
      if(libDep.ecereCOM)
      {
         hasEC = true;
         break;
      }
   }

   out.PrintLn("import sys");
   out.PrintLn("import os");
   out.PrintLn("import platform");
   out.PrintLn("from distutils.util import get_platform;");
   //out.PrintLn("import posixpath");
   out.PrintLn("from os import path");

   out.PrintLn("print(' -- before ", g.lib.bindingName, " extension build -- ')");
   out.PrintLn("pver = platform.python_version()");
   out.PrintLn("print('arg zero: ', sys.argv[0])");
   out.PrintLn("print('count: ', len(sys.argv))");
   out.PrintLn("print('args: ', str(sys.argv))");
   //out.PrintLn("sv = v[0:v.rfind('.')]");
   //out.PrintLn("p = get_platform()");
   //out.PrintLn("fp = p + '-' + sv");
   //ddd 'build\\lib.' + fp
   out.PrintLn("if sys.argv[0] == 'setup.py':");
   out.PrintLn("   blddir = 'build/lib.%s-%s' % (get_platform(), pver[0:pver.rfind('.')])");
   out.PrintLn("else:");
   out.PrintLn("   blddir = ''");
   if(g.libDeps.count == 0)
      out.PrintLn("from cffi import FFI");
   else
   {
      libDep = g.libDeps.lastIterator.data;
      for(ld : g.libDeps)
      {
         if(!ld.ecereCOM && !ld.ecere && !ld.eda)
         {
            libDep = ld;
            break;
         }
      }
   }
   out.PrintLn("");
   out.PrintLn("dnf = path.dirname(__file__)");
   out.PrintLn("dir = path.abspath(path.dirname(__file__))");
   out.PrintLn("owd = os.getcwd()");


#if 0
   out.PrintLn("rel2 = '' if os.path.isfile(os.path.join(owd, 'build_", g.lib.bindingName, ".py')) == True else 'bindings/py'");
   //out.PrintLn("rel = '' if dir == owd else 'bindings/py'");
   out.PrintLn("rel = ''");
   out.PrintLn("if os.name == 'nt':");
   //out.PrintLn("   libdir = '../../obj/win32/bin'");
   out.PrintLn("   libdir = '..\\\\..\\\\obj\\\\win32\\\\bin'");
   out.PrintLn("else:");
   out.PrintLn("   libdir = '../../obj/linux/lib'");
#endif // 0

   out.PrintLn("rel = '' if os.path.isfile(os.path.join(owd, 'build_", g.lib.bindingName, ".py')) == True else path.join('bindings', 'py')");
   out.PrintLn("sysdir = 'win32' if sys.platform == 'win32' else 'linux'");
   out.PrintLn("syslibdir = 'bin' if sys.platform == 'win32' else 'lib'");
   out.PrintLn("if rel == '':");
   out.PrintLn("   libdir = path.join('..', '..', 'obj', sysdir, syslibdir)");
   out.PrintLn("else:");
   out.PrintLn("   libdir = path.join('obj', sysdir, syslibdir)");
   //out.PrintLn("print('info -- owd:', owd, ' rel:', rel, ' libdir:', libdir)");

   out.PrintLn("if os.path.isfile(path.join(rel, 'cffi-", g.lib.bindingName, ".h')) != True:");
   out.PrintLn("   print('problem! -- owd:', owd, ' rel:', rel)");


   out.PrintLn("");
   out.PrintLn("if dnf != '':");
   //out.PrintLn("   sys.path.insert(0, dir)");
   out.PrintLn("   os.chdir(dir)");
   //out.PrintLn("   ");
   out.PrintLn("");
#if 0
   out.PrintLn("print('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^')");
   out.PrintLn("print('__file__:', __file__)");
   out.PrintLn("print('dnf:', dnf)");
   out.PrintLn("print('dir:', dir)");
   out.PrintLn("print('owd:', owd)");
   out.PrintLn("print('rel:', rel)");
   out.PrintLn("");
#endif // 0

   if(g.libDeps.count != 0)
   {
      out.PrintLn("sys.path.append(dir)");
      out.Print("from build_", libDep.bindingName, " import FFI");
      if(!hasEC)
         out.Print(", ffi_eC");
      for(libDep : g.libDeps)
         out.Print(", ffi_", libDep.bindingName);
      out.PrintLn("");
      out.PrintLn("from distutils.sysconfig import get_config_var");
      out.PrintLn("");
      out.PrintLn("ext = '.so' if get_config_var('EXT_SUFFIX') is None else get_config_var('EXT_SUFFIX')");
      out.PrintLn("");
   }
   /*if(g.libDeps.count == 0)
   {
      out.PrintLn("dnf = path.dirname(__file__)");
      out.PrintLn("dir = path.abspath(path.dirname(__file__))");
      out.PrintLn("owd = os.getcwd()");
      out.PrintLn("rel = '' if dir == owd else 'bindings'");
      out.PrintLn("");
   }*/
   out.PrintLn("ffi_", g.lib.bindingName, " = FFI()");

#if 0
   out.PrintLn("sys.stdout.write('rel:')");
   out.PrintLn("sys.stdout.write(rel)");
   out.PrintLn("sys.stdout.write(' -- ')");
   out.PrintLn("sys.stdout.write('__file__:')");
   out.PrintLn("sys.stdout.write(__file__)");
   out.PrintLn("sys.stdout.write(' -- ')");
   out.PrintLn("sys.stdout.write('path.dirname(__file__):')");
   out.PrintLn("sys.stdout.write(dnf)");
   out.PrintLn("sys.stdout.write(' -- ')");
   out.PrintLn("sys.stdout.write('path.abspath(path.dirname(__file__)):')");
   out.PrintLn("sys.stdout.write(dir)");
   out.PrintLn("sys.stdout.write(' -- ')");
   out.PrintLn("sys.stdout.write('os.getcwd():')");
   out.PrintLn("sys.stdout.write(owd)");
   out.PrintLn("print()");
   //out.PrintLn("t1 = path.join(rel, '../c', 'eC.c')");
   //out.PrintLn("print(\"path.join(rel, '../c', 'eC.c') is \", t1)");
#endif // 0
   for(libDep : g.libDeps)
      out.PrintLn("ffi_", g.lib.bindingName, ".include(ffi_", libDep.bindingName, ")");
   out.PrintLn("ffi_", g.lib.bindingName, ".cdef(open(path.join(owd, rel, 'cffi-", g.lib.bindingName, ".h')).read())");
   //out.PrintLn("print('os.getcwd(): ', os.getcwd())");
   out.PrintLn("ffi_", g.lib.bindingName, ".set_source('_py", g.lib.bindingName, "',"); // Ecere
   out.PrintLn("               '#include \"", g.lib.bindingName, ".h\"',");
   //out.PrintLn("               sources=['../c/", g.lib.bindingName, ".c', '../c/ecere.c'],"); // todo
   /*if(g.lib.ecere)
      out.PrintLn("               sources=['../c/eC.c', '../c/", g.lib.bindingName, ".c'],"); // todo
   else*/
      //out.PrintLn("               sources=[path.join(owd, rel, '", cpath, "', '", g.lib.bindingName, ".c')],"); // todo
      //out.PrintLn("               sources=[path.join(owd, rel, '", g.lib.bindingName, ".c')],"); // todo
   out.PrintLn("               define_macros=[('BINDINGS_SHARED', None), ('", g.lib.defineName, "_EXPORT', None)],");
   out.PrintLn("               extra_compile_args=['-DMS_WIN64', '-Wl,--export-dynamic', '-O2'],");
   //out.PrintLn("               include_dirs=[path.join(owd, rel, '", cpath, "')],"); // todo
   //out.PrintLn("               include_dirs=[path.join(owd, rel), path.join(owd, 'bindings/py')],"); // todo
   out.PrintLn("               include_dirs=[path.join(owd, rel)],"); // todo
   /*out.Print("                 libraries=['", g.lib.moduleName, "'", "'", g.lib.moduleName, "_c'");
   for(libDep : g.libDeps)
      out.Print(", '_py", libDep.bindingName, "' + ext");
   //out.PrintLn("],");*/
   out.PrintLn("               libraries=['", moduleName, "', '", moduleName, "_c'],");
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
         out.Print(!first ? ", " : "", "path.join(owd, blddir, '_py", libDep.bindingName, "' + ext)");
         first = false;
      }
      if(ecere && !ecereCOM)
         out.Print(!first ? ", " : "", "path.join(owd, blddir, '_pyeC' + ext)");
      out.PrintLn(", '-DMS_WIN64', '-O2'],");
   }

   //out.PrintLn("               library_dirs=[path.join(owd, rel, '../../obj/win32/bin'),'C:/Program Files/Ecere SDK/bin'"/*, g.libDeps.count ? ", '.'" : ""*/, "])"); // todo
   //out.PrintLn("               library_dirs=[path.join(owd, rel, '../../obj/win32/bin')"/*, g.libDeps.count ? ", '.'" : ""*/, "])"); // todo
   out.PrintLn("               library_dirs=[path.join(owd, libdir)"/*, g.libDeps.count ? ", '.'" : ""*/, "])"); // todo
   out.PrintLn("");
   out.PrintLn("if __name__ == '__main__':");
   out.PrintLn("   V = os.getenv('V')");
   out.PrintLn("   v = True if V == '1' or V == 'y' else False");
   //out.PrintLn("   owd = os.getcwd()");
   //out.PrintLn("   os.chdir(dir)");
   out.PrintLn("   ffi_", g.lib.bindingName, ".compile(verbose=v)");
   //out.PrintLn("   os.chdir(owd)");

   out.PrintLn("");
   out.PrintLn("if dnf != '':");
   //out.PrintLn("   sys.path.insert(0, dir)");
   out.PrintLn("   os.chdir(owd)");
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
   out.PrintLn("               \"$(call cp,obj/debug.$(PLATFORM)$(COMPILER_SUFFIX)/_py", g.lib.bindingName, ".dll,_py", g.lib.bindingName, "$(PYSO))\"");
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
   out.PrintLn("      \"", g.lib.bindingName, ".py\",");
   out.PrintLn("   ]");
   out.PrintLn("}");
}
