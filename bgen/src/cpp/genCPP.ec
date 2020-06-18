#include "debug.eh"
#include "bgen.eh"
#include "econe.eh"

import "bgen"
import "cppHardcoded"

static AVLTree<consttstr> skipClasses
{ [
   { "eC", "CIString" },                  // Errors with bases String class
   { "eC", "Window" },                    // Dependency on Window
   { "eC", "ClassDesignerBase" },         // Dependency on Window
   { "eC", "DesignerBase" },              // Dependency on Window
   { "EDA", "FieldTypeEx" },              // Derrived from enum; todo
// { "gnosis3", "GraphicalStyleMask" },   // some Constructor issue
// { "gnosis3", "ShapeStyleMask" },       // see GraphicalStyleMask
// { "gnosis3", "GeoSymbolizerMask" },    // see GraphicalStyleMask

   { null, null }
] };

class CPPGen : CGen
{
   char * cppFileName;
   char * cppFilePath;
   char * hppFileName;
   char * hppFilePath;

   MacroModeBits macroModeBits;
   BClass cInstance;
   BClass cclass;

   bool implementations;

   lang = CPlusPlus;
   //macroModeBits.all = expansion;

   cpp_classNameSwaps =
   { [
      // eC
      { "AccessMode", "Access_Mode" },
      // gnosis3
      { "CRS", "CRS_" },
      { null, null }
   ] };

   cpp_methodNameSwaps =
   { [
      { { "Row", "Query" }, "query_" },
      { { "File", "Eof" }, "eof_" },
      { { "Container", "Delete" }, "delete_" },
      { { "BuiltInContainer", "Delete" }, "delete_" },
      { { "BinaryTree", "Delete" }, "delete_" },
      { { "OldList", "Delete" }, "delete_" },
      { { "Object", "Delete" }, "delete_" },
      { { "Extent", "Union" }, "union_" },
      { { "EditBox", "Delete" }, "delete_" },
      { { "EditBox", "Printf" }, "printf_" },
      { { "ArchiveDir", "Delete" }, "delete_" },
      { { "File", "Printf" }, "printf_" },
      { { "DriverRow", "Delete" }, "delete_" },
      { { "IdList", "Delete" }, "delete_" },
      { { "Row", "Delete" }, "delete_" },
      { { "", "Delete" }, "delete_" },
      { { "", "Union" }, "union_" },
      { { "", "Printf" }, "printf_" },
      { { null, null }, null }
   ] };

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
      if(options.expandMacros)
         macroModeBits.all = expansion;
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
      implementations = true;
      processNamespaces();
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
         bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString;
         bool template = hasTemplateClass(c.cl);
         if(/*g_.lib.ecereCOM && */skipClasses.Find({ g_.lib.bindingName, c.cl.name }))
            skip = true;
         if(!skip && !template && c.cl.type == normalClass)
            //processCppClass(this, c);
         {
            BClass cBase = c.cl.base.templateClass ? c.cl.base.templateClass : c.cl.base;
            if(c.isInstance)
            {
               //cInstance = c;
               //cclass = cBase;
               // what is this?
               if(c == cInstance && c.cl == cInstance.cl && cBase == cclass && cBase.cl == cclass.cl)
                  ;
               else
                  ; // PrintLn("dddddd");
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
         if(!implementations)
            processFunctions(n);
      }
      processTemplatons();
      ns.cleanup();
   }

   void processClasses(BNamespace n)
   {
      BClass c; IterClass itc { n.ns, list = options.classList };
      while((c = itc.next(all)))
      {
         bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString;
         bool template = hasTemplateClass(c.cl);
         if(/*g_.lib.ecereCOM && */skipClasses.Find({ g_.lib.bindingName, c.cl.name }))
            skip = true;
         if(c.cl.type == noHeadClass && hasOrBaseHasTemplateAnything(c.cl))
            skip = true;
         // if(!skip && !template && (c.cl.type == normalClass || c.cl.type == noHeadClass || c.cl.type == structClass))
         if(!skip &&
               c.cl.type != systemClass &&
               c.cl.type != unionClass &&
               c.cl.type != enumClass &&  // temporary
               !template)
            processCppClass(this, c);
         // else { typedef C(Modifiers) Modifiers; }
         if(c.cl.type == enumClass && !c.isBool) // temporary
         {
            BClass cBase = c.cl.base;
            if(!(cBase && cBase.isBool))
               processCppClass(this, c);
         } // end of temporary
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
            BOutput out { vfunction, f = f, z = { allocType = heap } };
            Type t = fn.dataType;
            Type p1 = t.params.count == 2 ? t.params.first : null;
            Type p2 = t.params.count == 2 ? t.params.last : null;
            bool typedVarArgs = t.params.count == 2 && p1.kind == classType && p1.classObjectType == typedObject && p2.kind == ellipsisType;
            n.splitContents.Add(v);
            f.out = out;
            if(typedVarArgs)
            {
               out.z.concatx(genloc__, "template <typename ...Ts> inline void ", f.oname, "2(const Ts&... ts)", ln);
               out.z.concatx(genloc__, "{", ln);
               out.z.concatx(genloc__, "   std::apply(", ln);
               out.z.concatx(genloc__, "      [](auto ...args) { ", f.oname, "(args...); },", ln);
               out.z.concatx(genloc__, "      std::tuple_cat(std::make_tuple(classof(ts), vapass(ts))..., std::make_tuple(null))", ln);
               out.z.concatx(genloc__, "   );", ln);
               out.z.concatx(genloc__, "}", ln, ln);
            }
            else
               out.z.concatx("// function: ", f.oname, ln);
         }
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
      // this whole thing isn't even used
      int x = 0;
      int y = 55 / x;
      PrintLn(y);
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
      delete cpp_classNameSwaps;
   }
}

static void generateHPP(CPPGen g, File f)
{
   cppHeaderStart(g, f);
   if(g.lib.ecereCOM)
   {
      cppHardcodedCorePart1(g, f);
      cppUndefProperCaseNameUnitMacros(g, f);
      cppHardcodedCorePart2(g, f);
   }
   else
      cppUndefProperCaseNameUnitMacros(g, f);
   if(g.lib.ecereCOM)
   {
      typedefHackClasses(g, f);
      prototypeHackClasses(g, f);
   }

   // typedefClasses(g, f); // temporary
   prototypeClasses(g, f);

   f.PrintLn(genloc__, "int ", g.lib.bindingName, "_cpp_init(const Module & module);", ln); // todo? back to void returning?

   outputContents(g, f);

   if(g.lib.ecereCOM)
      cppHardcodedNativeTypeTemplates(g, f);

   outputSplitContents(g, f);

   f.PrintLn(ln);

   templateClassThings(g, f);

   cppHeaderEnd(g, f);
}


bool typedefHackClasses(CPPGen g, File f)
{
   bool contents = false;
   for(name : tmpcppececeremesstypedef)
   {
      f.PrintLn(genloc__, "typedef C(", name, ") ", name, ";");
      if(!contents)
         contents = true;
   }
   if(contents)
      f.PrintLn("");
   return contents;
}

bool typedefClasses(CPPGen g, File f)
{
   bool contents = false;
   BClass c; IterAllClass itacl { itn.module = g.mod/*module = g.mod*/ };
   while((c = itacl.next(all)))
   {
      if(c.cl.type == enumClass)
      {
         BClass cBase = c.cl.base;
         bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString ||
            (g.lib.ecereCOM && skipClasses.Find({ g_.lib.bindingName, c.cl.name }))/* temporary: */ || !cBase || !cBase.isBool; // temporary
         if(!skip)
         {
            f.PrintLn(genloc__, "typedef ", "C(", c.name, ") ", c.name, ";");
            if(!contents)
               contents = true;
         }
      }
   }
   if(contents)
      f.PrintLn("");
   return contents;
}

bool prototypeHackClasses(CPPGen g, File f)
{
   bool contents = false;
   for(name : tmpcppececeremessclass)
   {
      f.PrintLn(genloc__, "class ", name, ";");
      if(!contents)
         contents = true;
   }
   if(contents)
      f.PrintLn("");
   return contents;
}

bool prototypeClasses(CPPGen g, File f)
{
   bool contents = false;
   BClass c; IterAllClass itacl { itn.module = g.mod/*module = g.mod*/ };
   while((c = itacl.next(all)))
   {
      bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString;
      bool template = hasTemplateClass(c.cl);
      if(g.lib.ecereCOM && (c.isSurface || /*c.isIOChannel || */c.isWindow || c.isDataBox))
         ; //locprintx("if(g.lib.ecereCOM && (c.isSurface || /*c.isIOChannel || */c.isWindow || c.isDataBox))");
      if(g.lib.ecereCOM && skipClasses.Find({ g_.lib.bindingName, c.cl.name }))
         skip = true;
      if(!skip && !template)
      {
         const char * cn = c.cpp_name;
         switch(c.cl.type)
         {
            case normalClass:
               if(c.cl.templateArgs)
               {
                  f.PrintLn(genloc__, cpptemplateTemplateClassDef, " class ", cpptemplatePrefix, cn, ";");
                  f.PrintLn(genloc__, "typedef ", cpptemplatePrefix, cn, "<uint64> ", cn, ";");
               }
               else
                  f.PrintLn(genloc__, "class ", cn, ";");
               if(!contents) contents = true;
               break;
            case noHeadClass:
               f.PrintLn(genloc__, cpptemplateNoHeadDef, " class ", cpptemplatePrefix, cn, ";");
               f.PrintLn(genloc__, "typedef ", cpptemplatePrefix, cn, "<C(", cn, "), &CO(", cn, ")> ", cn, ";");
               if(!contents) contents = true;
               break;
            case structClass:
               f.PrintLn(genloc__, "struct ", cn, ";");
               if(!contents) contents = true;
               break;
            case unitClass:
            case bitClass:
               f.PrintLn(genloc__, "class ", cn, ";");
               if(!contents) contents = true;
               break;
            case enumClass:
            {
               // BClass cBase = c.cl.base;
               // if(!cBase || !cBase.isBool)
               {
                  // bool with = !cBase.is_enum;
                  const char * typeString = tokenTypeString(c.cl.dataType);
                  //f.PrintLn(genloc__, "enum class ", cn, " : ", c.symbolName, ";");
                  f.PrintLn(genloc__, "enum class ", cn, " : ", typeString/*, "std::underlying_type_t<", c.symbolName, ">"*/, ";");
                  if(!contents) contents = true;
               }
               break;
            }
         }
      }
   }
   if(contents)
      f.PrintLn("");
   return contents;
}

bool cppUndefProperCaseNameUnitMacros(CPPGen g, File f)
{
   bool contents = false;
   BClass c;
   IterAllClass itacl { itn.module = g.mod };
   while((c = itacl.next(all)))
   {
      if(!c.skip && c.cl.type == unitClass)
      {
         Property cn; IterConversion conv { c.cl };
         while((cn = conv.next(publicOnly)))
         {
            BProperty p = cn;
            if(p.cConv && p.cConv.cl.type == unitClass && (p.pt.Get || !p.pt.Set))
            {
               f.PrintLn(genloc__, "#undef ", c.name);
               if(!contents)
                  contents = true;
            }
         }
      }
   }
   if(contents)
      f.PrintLn("");
   return contents;
}

bool templateClassThings(CPPGen g, File f)
{
   bool contents = false;
   BClass c;
   IterAllClass itacl { itn.module = g.mod };
   while((c = itacl.next(all)))
   {
      if(c.cl.type == normalClass && c.cl.templateArgs && !c.cl.templateClass)
      {
         f.PrintLn(genloc__, "template<class TPT> TCPPClass<", cpptemplatePrefix, c.cl.name, "<TPT>> ", cpptemplatePrefix, c.cl.name, "<TPT>::_class;");
         if(!contents)
            contents = true;
      }
   }
   if(contents)
      f.PrintLn("");
   return contents;
}

static void generateCPP(CPPGen g, File f)
{
   Class firstClass = null;
   f.PrintLn(genloc__, "#include \"", g.lib.bindingName, ".hpp\"");

   /*
   f.PrintLn("");
   f.PrintLn("#ifdef _DEBUG");
   f.PrintLn("extern \"C\"");
   f.PrintLn("{");
   f.PrintLn("   int printf(const char *format, ...);");
   f.PrintLn("}");
   f.PrintLn("#endif");
   */

   f.PrintLn("");
   {
      BClass c; IterAllClass itacl { itn.module = g.mod/*module = g.mod*/ };
      while((c = itacl.next(all)))
      {
         bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString;
         bool template = hasTemplateClass(c.cl);
         if(/*g_.lib.ecereCOM && */skipClasses.Find({ g_.lib.bindingName, c.cl.name }))
            skip = true;
         if(!skip && !template && c.cl.type == normalClass && !c.cl.templateArgs)
         {
            firstClass = c.cl;
            f.PrintLn(genloc__, "TCPPClass<", c.cl.name, "> ", c.cl.name, "::_class;");
         }
      }
   }
   f.PrintLn(       "");
   f.PrintLn(genloc__, "int ", g.lib.bindingName /*name*/, "_cpp_init(const Module & module)"); // todo? back to void returning?
   f.PrintLn(genloc__, "{");
   f.PrintLn(genloc__, "   if(!", firstClass.name, "::_class.impl)");
   f.PrintLn(genloc__, "   {");
   f.PrintLn(genloc__, "#ifdef _DEBUG");
   f.PrintLn(genloc__, "      printf(\"%s_cpp_init\\n\", \"", g.lib.bindingName, "\");");
   f.PrintLn(genloc__, "#endif");
   f.PrintLn(       "");
   {
      BClass c; IterAllClass itacl { itn.module = g.mod/*module = g.mod*/ };
      while((c = itacl.next(all)))
      {
         bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString || c.cl.type == systemClass;
         bool template = hasTemplateClass(c.cl);
         if(g.lib.ecereCOM && skipClasses.Find({ g_.lib.bindingName, c.cl.name }))
            skip = true;
         if(!skip && !template && c.cl.type == normalClass)
            //f.PrintLn("      REGISTER_CPP_CLASS(", c.cl.name, ", module);");
            cppToFileMacroRegisterClassCPP(g, f, g.expansionOrUse, 1, c.cl.name, "module", 0);
      }
   }
   f.PrintLn(genloc__, "   }");
   f.PrintLn(genloc__, "   return 0;"); // todo? back to void returning?
   f.PrintLn(genloc__, "}");
   //if(g.lib.ecere) // hardcoded

   if(g.lib.ecereCOM) // hardcoded
   {
      f.PrintLn("");
      f.PrintLn(genloc__, "// Instance methods depending on libecere");
      f.Print(genloc__, "void Instance::class_registration(CPPClass & _class)\n");
      // TONOMACRO
      if(g.options.expandMacros)
      {
         ZString z { allocType = heap };
         cppMacroClassRegistration(g, z, expansion, 2, g.cInstance, g.cclass, g.cInstance, 0);
         f.PrintLn(ln, "{");
         f.Puts(z._string);
         f.PrintLn("}");
         delete z;
      }
      else
         f.PrintLn(genloc__, "{ Instance_class_registration(Instance); }");
      //f.PrintLn("void FontResource::class_registration(CPPClass & _class) { Instance_class_registration(FontResource); }");
   }

   f.PrintLn(ln);

   outputImplementationsContents(g, f);
}

// TODO: Get rid of this non-sense...
Map<consttstr, const String> methodParamNameSwap { [
// { { "onCompare", "object" }, "o2" },
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

static AVLTree<consttstr> brokenRegs { [
   { "Window", "NotifyActivate" },
   { "Window", "NotifyDestroyed" },
   { "Window", "NotifySaved" },
   // { "Window", "M" },
   { null, null }
] };

static AVLTree<consttstr> brokenMethods { [
   // error: 'o_' was not declared in this scope
   { "Timer", "DelayExpired" }, // virtual bool any_object::DelayExpired(void);
   /*
// C(bool) Timer_delayExpired(C(Timer) __i, any_object __t);
#define Timer_delayExpired(__i, __t) \
   VMETHOD(CO(Timer), Timer, delayExpired, __i, C(bool), \
      any_object, \
      __t)
   */
   { "FileMonitor", "OnDirNotify" }, // public virtual bool any_object::OnDirNotify(FileChange action, const char * fileName, const char * param);
   { "FileMonitor", "OnFileNotify" },

   // unchecked:
   // { "Instance", "OnEdit" },

   // ecere stuff in eC.hpp
   // error: 'Alignment' has not been declared
   // error: 'DataDisplayFlags' has not been declared
   { "Instance", "OnDisplay" },

   { null, null }
] };

static AVLTree<const String> brokenBitMembersConstructor { [
   "PVFlags",

   null
] };

static AVLTree<const String> brokenOrderedPublicMembersInitializers { [
   // broken members initializing constructors
   // broken zero value for MiddleAnchorValue // todo: fixit
   "Anchor",

   "NameSpace",

   // eda
   "Detail",

   // gis
   "ECCSSEvaluator",
   "Point3DFeature",
   "CompactModelData",
   "CenterLine",
   "GeoFeaturePresentation",
   "GeoView",
   "GraphicalSurface",
   "Line3DFeature",
   "Models3DFeature",
   "PointCloudFeature",
   "TilingScheme",

   null
] };

/*
static AVLTree<const String> brokenOrderedPublicMembersInitializersTypes { [
   // broken members initializing constructors
   // broken zero value for MiddleAnchorValue // todo: fixit
   "OldList",
   null
] };
*/

static AVLTree<consttstr> brokenMembers { [
   // error: ‘Button::symbolProp::operator uint32_t() const’ cannot be overloaded with ‘Button::symbolProp::operator unichar() const’
   /*
                  inline operator unichar () const;
                  inline operator uint32_t () const;
   */
   { "Button", "symbol" },
   // error: cannot convert ‘GlobalSettingsData*’ to ‘class_members_Instance**’ in assignment
   // { "Bitmap", "bitmaps" },
   // { "GlobalSettings", "dataOwner" },
   // { "ToolButton", "menuItemPtr" },
   // from ‘eC_Class*’ to ‘Skin’ -- bad subclass support?
   { "GuiApplication", "currentSkin" },
   //
   { "BTNode", "depth" }, // broken when using macros

   // eda
   { "FieldValue", "type" },

   // gis
   { "CMSSInstantiation", "_class" }, // collides with core cpp bindings class member?

   { "C", "M" },

   { null, null }
] };

struct BitMemberTypeStringZero
{
   BitMember bm;
   const String typeString;
   const String zero;
};

static void processCppClass(CPPGen g, BClass c)
{
   bool skip = false;
   if(!skip)
   {
      bool template = c.cl.templateArgs != null;
      const char * t = template ? "<TPT>" : "";
      int l, maxLen = 0;
      //bool content = false;
      //const char * lc = " \\";
      bool pfx = c.cl.type == normalClass && c.cl.templateArgs;
      char * cn = PrintString(pfx ? cpptemplatePrefix : "", c.cpp_name);
      BVariant v = c;
      BNamespace n = c.nspace;
      BClass cBase = c.cl.base.templateClass ? c.cl.base.templateClass : c.cl.base;
      const char * un = c.upper;
      MacroMode mode = g.expansionOrUse;
      if(!g.implementations)
      {
         BOutput o { vclass, c = c, z = { allocType = heap } };
         // todo tofix tocheck tmp? skip to template class name for derrivation
         BMethod m; IterMethod itm { c.isInstance ? cBase.cl : c.cl };
         //const char * sn = c.symbolName;
         bool baseIs_class = cBase && cBase.is_class;
         bool baseIs_bool = cBase && cBase.isBool;
         const char * nhbase = c.cl.type == noHeadClass && baseIs_class ? "TNHInstance" : null;
         const char * bn = cBase ? cBase.name : "";
         bool hasBase = cBase && cBase.cl.type != systemClass;
         bool isBaseString = c.isBaseString;

         c.outTypedef = o;
         n.contents.Add(v);
         if(hasBase)
            v.processDependency(g, otypedef, otypedef, cBase.cl);

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

         while((m = itm.next(publicVirtual))) { m.init(itm.md, c.isInstance ? cBase : c, g); if((l = strlen(m.mname)) > maxLen) maxLen = l;}

         if(c.isInstance)
         {
            // int maxLen = c.maxVirtualMethodNameLen + 1;
            o.z.concatx(ln);
            while((m = itm.next(publicVirtual)))
            {
               const char * cn = c.name, * bn = cBase.name, * mn = m.mname;
               o.z.concatx(genloc__, "#define ", cn, "_", mn, "_vTblID", spaces(maxLen, strlen(mn)), " ", bn, "_", mn, "_vTblID", ln);
            }
         }

         if(c.cl.type == normalClass && !(g.lib.ecereCOM && (c.isSurface || /*c.isIOChannel || */c.isWindow || c.isDataBox)))
         {
            // todo?: let's move this inside the REGISTER() aka class_registration method of the class being generated
            cppDefineMacroClassRegistration(g, o.z, 0, c, cBase, v, 0);

            o.z.concatx(ln);
            cppMacroRegVirtualMethods(g, o.z, definition, 0, c, cBase, v, 0);
            // if(!g.options.expandMacros)
            {
               cppDefineMacroClassVirtualMethods(g, o.z, true, template, 0, un, c, cBase, v, 0);
               cppDefineMacroClassVirtualMethods(g, o.z, false, template, 0, un, c, cBase, v, 0);
            }
         }

         if(c.isApplication)
         {
            o.z.concatx(ln);
            // o.z.concatx(genloc__, "int eC_cpp_init(const Module & module);", ln); // todo? back to void returning?
            o.z.concatx(genloc__, "int ecere_cpp_init(const Module & module);", ln, ln); // todo? back to void returning?
            // o.z.concatx(genloc__, "extern ", g.sym.module, " theEcereModule;", ln);
         }

         if(c.cl.type == noHeadClass)
            o.z.concatx(ln, genloc__, cpptemplateNoHeadDef);
         else if(c.cl.type == normalClass && c.cl.templateArgs)
         {
            if(c.isContainer)
               o.z.concatx(ln, genloc__, cpptemplateTemplateTypeDef);
            else
               o.z.concatx(ln, genloc__, cpptemplateTemplateClassDef);
         }
         o.z.concatx(ln, genloc__);
         if(c.cl.type == enumClass)
            o.z.concat("enum ");
         if(c.cl.type == structClass)
            o.z.concat("struct ");
         else
            o.z.concat("class ");
         if(c.cl.type == unitClass)
         {
            // difficult logic of weather a macro exists to clash with C++ class name
            // from genC.ec: c.cl.type == unitClass && p.cConv && p.cConv.cl.type == unitClass
            // hardcoded list for now:
            /*
            if(c.cl.type == unitClass && (
               !strcmp(c.name, "Centimeters") ||
               !strcmp(c.name, "Degrees") ||
               !strcmp(c.name, "Radians") ||
               false))
            o.z.concat("C");
            */
         }
         else if(c.cl.type == noHeadClass/* || (c.cl.type == normalClass && c.cl.templateArgs)*/)
            o.z.concat(cpptemplatePrefix);
         o.z.concat(cn);

         if(!(g.lib.ecereCOM && (c.isSurface || /*c.isIOChannel || */c.isWindow || c.isDataBox)))
         {
            const char * baseClass = isBaseString ? "Instance" : nhbase ? nhbase : bn;
            bool pfx = (c.cl.base.type == normalClass && c.cl.base.templateArgs) || (c.cl.type == noHeadClass && !nhbase);
            bool sfx = c.cl.base.type == normalClass && c.cl.base.templateArgs;
            char * baseClassString = PrintString(pfx ? cpptemplatePrefix : "", baseClass, sfx ? "<TPT>" : "");
            if(c.cl.type == enumClass)
            {
               const char * typeString = tokenTypeString(c.cl.dataType);
               o.z.concatx(" : ", typeString);
               // if(c.cl.base && c.cl.base.type != systemClass)
               {
                  // o.z.concatx(" : std::underlying_type_t<", c.symbolName, ">");
                  /*
                  if(cBase.cl.type != systemClass && !cBase.isBool)
                     v.processDependency(g, otypedef, otypedef, cBase.cl);
                  */
               }
            }
            else if((cBase && cBase.cl.type != systemClass && !cBase.isBool) || c.cl.type == noHeadClass)
            {
               o.z.concatx(" : public ", baseClassString);
               if(c.cl.type == noHeadClass)
                  o.z.concatx("<TC, TCO>");
               if(cBase.cl.type != systemClass)
                  v.processDependency(g, otypedef, otypedef, cBase.cl);
            }
            o.z.concatx(ln, genloc__, "{");
            if(c.cl.type != enumClass)
               o.z.concatx(ln, genloc__, "public:", ln);

            if(c.cl.type == noHeadClass)
               // o.z.concatx(c.cl.type == noHeadClass ? cpptemplatePrefix : "", cn, "(TC * _impl) { ", baseClassString, "<TC, TCO>::impl = _impl; }"); // if PRE-CPP11
               o.z.concatx(genloc__, indents(1), "using ", baseClassString, "<TC, TCO>::", baseClassString, ";", ln);
            else if(c.cl.type == bitClass)
            {
               if(!(c.cl.base && c.cl.base.type == bitClass) && !(baseIs_class || baseIs_bool))
                  Print("");
               if(!(c.cl.base && c.cl.base.type == bitClass))
                  o.z.concatx(genloc__, indents(1), c.symbolName, " impl;", ln);
               // todo enum constructor is enum derrives from this class
               {
                  bool contents = false;
                  BClass c2; IterAllClass itacl { itn.module = g.mod };
                  while((c2 = itacl.next(all)))
                  {
                     if(c2.cl.type == enumClass && c2.cl.base == c)
                     {
                        if(!contents)
                           o.z.concatx(ln);
                        if(!(c.cl.base && c.cl.base.type == bitClass))
                           o.z.concatx(genloc__, indents(1), c.cpp_name, "(", c2.cpp_name, " impl) : impl((", c.symbolName, ")impl) { }", ln);
                        else
                           o.z.concatx(genloc__, indents(1), c.name, "(", c2.cpp_name, " impl) : ", cBase.cpp_name, "((", cBase.symbolName, ")impl) { }", ln);
                        o.z.concatx(genloc__, indents(1), c.cpp_name, " & operator =(", c2.cpp_name, " impl) { this->impl = (", c.symbolName, ")impl; return *this; }", ln);
                        if(!contents)
                           contents = true;
                     }
                  }
                  if(contents)
                     o.z.concatx(ln);
                  // return contents;
               }
               if(!(c.cl.base && c.cl.base.type == bitClass))
                  o.z.concatx(genloc__, indents(1), c.cpp_name, "(", c.symbolName, " impl) : impl(impl) { }", ln);
               else
                  o.z.concatx(genloc__, indents(1), c.cpp_name, "(", c.symbolName, " impl) : ", cBase.cpp_name, "((", cBase.symbolName, ")impl) { }", ln);
               genBitMembersConstructor(g, c, v, true, o, null);
               o.z.concatx(genloc__, indents(1), "operator ", c.symbolName, "() { return impl; }", ln);
               o.z.concatx(genloc__, indents(1), c.cpp_name, " & operator =(", c.symbolName, " impl) { impl = impl; return *this; }", ln);
            }
            else if(c.cl.type == structClass)
            {
               // if(!(c.cl.base && c.cl.base.type == bitClass))
               {
                  o.z.concatx(genloc__, indents(1), c.symbolName, " impl;", ln);
                  o.z.concatx(genloc__, indents(1), c.cpp_name, "() { impl = { }; }", ln);
                  o.z.concatx(genloc__, indents(1), c.cpp_name, "(", c.symbolName, " impl) { this->impl = impl; }", ln);
               }
               // else
               {
               }

               // conversions via constructors or operators
               {
                  Property cn; IterConversion conv { c.cl };
                  while((cn = conv.next(publicOnly)))
                  {
                     BProperty p = cn;
                     if(p.cConv && p.cConv.cl && p.cConv.cl != c.cl.base)
                     {
                        if(p.cConv.cl.type == structClass)
                        {
                           o.z.concatx(genloc__, indents(1), "operator ", p.cConv.cpp_name, "() ",
                                 "{ ", p.cConv.cpp_name, " ", p.cConv.simplestIdentName, "; ", c.name, "_to_", p.cConv.name,
                                    "(&impl, &", p.cConv.simplestIdentName, ".impl); return ", p.cConv.simplestIdentName, "; }", ln);
                           v.processDependency(g, otypedef, otypedef, p.cConv);
                        }
                        // todo: p.cConv.cl.type == otherstypes?
                     }
                  }
               }
               {
                  BClass c2; IterAllClass itacl { itn.module = g.mod/*module = g.mod*/ };
                  while((c2 = itacl.next(all)))
                  {
                     if(c2 != c)
                     {
                        Property cn; IterConversion conv { c2.cl };
                        while((cn = conv.next(publicOnly)))
                        {
                           BProperty p = cn;
                           if(p.cConv && p.cConv.cl == c.cl)
                           {
                              if(c2.cl.type == bitClass)
                              {
                                 o.z.concatx(genloc__, indents(1), c.cpp_name, " & operator= (", c2.cpp_name, " value) ",
                                       "{ ", c2.name, "_to_", c.name, "(value.impl, &impl); return *this; }", ln);
                                 o.z.concatx(genloc__, indents(1), c.cpp_name, "(", c2.cpp_name, " value) ",
                                       "{ ", c2.name, "_to_", c.name, "(value.impl, &impl); }", ln);
                                 // C++ doesn't guess conversion chains, so we need explicit conversion from enums who's base class is this c2 bitclass here...
                                 {
                                    BClass c3; IterAllClass itacl { itn.module = g.mod/*module = g.mod*/ };
                                    while((c3 = itacl.next(all)))
                                    {
                                       if(c3.cl.type == enumClass && c3.cl.base == c2.cl)
                                       {
                                          o.z.concatx(genloc__, indents(1), c.cpp_name, " & operator= (", c3.cpp_name, " value) ",
                                                "{ ", c2.name, "_to_", c.name, "((", c2.symbolName, ")value, &impl); return *this; }", ln);
                                          o.z.concatx(genloc__, indents(1), c.cpp_name, "(", c3.cpp_name, " value) ",
                                                "{ ", c2.name, "_to_", c.name, "((", c2.symbolName, ")value, &impl); }", ln);
                                       }
                                    }
                                 }
                              }
                              // todo: c2.cl.type == structClass and others
                           }
                        }
                     }
                  }
               }
            }
            else if(c.cl.type == unitClass)
            {
               if(cBase.is_class)
               {
                  o.z.concatx(genloc__, indents(1), c.symbolName, " impl;", ln);
                  o.z.concatx(genloc__, indents(1), c.cpp_name, "(", c.cl.dataTypeString, " value) { impl = value; }", ln);
                  o.z.concatx(genloc__, indents(1), "operator ", c.cl.dataTypeString, "() { return impl; }", ln);
                  o.z.concatx(genloc__, indents(1), c.cpp_name, " & operator =(", c.cl.dataTypeString, " value) { impl = value; return *this; }", ln);
               }
               else
               {
                  o.z.concatx(genloc__, indents(1), c.cpp_name, "(", cBase.name, " value) : ", cBase.name, "(value) { }", ln);
                  // todo: missing constructors if unit class derrived more than once?
                  o.z.concatx(genloc__, indents(1), c.cpp_name, "(", c.cl.dataTypeString, " value) : ",
                        cBase.name, "(", c.upper, "(value)) { }", ln);
                  o.z.concatx(genloc__, indents(1), "operator ", c.cl.dataTypeString, "() { return ", cBase.name, "_in_", c.name, "(impl); }", ln);
                  o.z.concatx(genloc__, indents(1), c.cpp_name, " & operator =(", c.cl.dataTypeString, " value) { impl = ", c.name, "(value); return *this; }", ln);
               }
            }
            else if(c.cl.type == enumClass)
               cppGenEnumClassValues(g, o, c);

            if(c.isInstance)
            {
               cppHardcodedInstancePart1(o);
               // note: this is a hard coded cppMacroClassVirtualMethods use
               // TONOMACRO
               // o.z.concatx("   INSTANCE_VIRTUAL_METHODS(Instance);", ln, ln);
               cppMacroClassVirtualMethods(g, o.z, configuration, true, template, 1, un, cn, c, cBase, v, 0);
               cppHardcodedInstancePart2(o);
            }
            else if(c.cl.type == normalClass)
            {
               cppMacroConstructClass(g, o.z, mode, template, 1, c.name, isBaseString ? "Instance" : baseClassString, t, 0);
               // if(mode != expansion)
               {
                  if(c.isApplication)
                  {
                     o.z.concatx(ln, genloc__, "   {", ln);
                     o.z.concatx(genloc__, "      eC_cpp_init(*this);", ln);
                     o.z.concatx(genloc__, "#if !defined(ECERECOM_ONLY)", ln);
                     o.z.concatx(genloc__, "      ecere_init(impl);", ln);
                     o.z.concatx(genloc__, "      ecere_cpp_init(*this);", ln);
                     o.z.concatx(genloc__, "#endif", ln);
                     // if(c.isGuiApplication)
                     //   o.z.concatx(genloc__, "      ecere_cpp_init(*this);", ln);
                     o.z.concatx(genloc__, "      INSTANCEL(impl, impl->_class) = this;", ln);
                     o.z.concatx(genloc__, "      mustFree = true;", ln);
                     o.z.concatx(genloc__, "      vTbl = _class.vTbl;", ln);
                     o.z.concatx(genloc__, "      __thisModule = impl;", ln);
                     o.z.concatx(genloc__, "   }", ln);
                     o.z.concatx(genloc__, "   ~Application()", ln);
                     o.z.concatx(genloc__, "   {", ln);
                     o.z.concatx(genloc__, "      Instance_decRef(impl);  // Extra ref count?", ln);
                     o.z.concatx(genloc__, "   }", ln);
                  }
                  else if(c.isGuiApplication)
                  {
                     o.z.concatx(ln, genloc__, indents(1), "{", ln);
                     // o.z.concatx(genloc__, " {  }", ln);
                     o.z.concatx(genloc__, indents(2), "EVOLVE_APP(GuiApplication, *this);", ln);

                     o.z.concatx(genloc__, "#ifdef MODULE_NAME", ln);
                     o.z.concatx(genloc__, indents(2), "loadTranslatedStrings(null, MODULE_NAME);", ln);
                     o.z.concatx(genloc__, "#endif", ln);
                     o.z.concatx(genloc__, indents(1), "}", ln);
                  }
                  else
                     o.z.concatx(" { }", ln);
                  if(c.isContainer)
                  {
                     Class clDep = eSystem_FindClass(g_.mod, "IteratorPointer");
                     o.z.concatx(ln);
                     cppHardcodedContainer(o);
                     v.processDependency(g, otypedef, otypedef, clDep);
                  }
               }
            }

            if(c.cl.type == noHeadClass && !nhbase)
               o.z.concatx(genloc__, indents(1), "inline operator ", bn, "& () const { return *(", bn, " *)this; }", ln);

            if(!c.isInstance && !c.isModule && !hasOrBaseHasTemplateClass(c.cl) && c.cl.type != enumClass)
               genMethodCallers(g, c, v, cn, true, o);

            if(c.cl.type == normalClass && !c.isInstance)
            {
               // tclean remove next 2 lines
               // note: this is a hardcoded cppMacroClassVirtualMethods use
               //o.z.concatx(genloc__, indents(1), un, "_VIRTUAL_METHODS(", c.name, ")", ln);
               o.z.concatx(ln);

               cppMacroClassVirtualMethods(g, o.z, configuration, true, template, 1, un, c.name, c, cBase, v, 0);
            }

            if(c.cl.type == normalClass && !c.isInstance && !c.isModule)
            {
               //o.z.concatx(ln, genloc__, indents(0));
               //cppMacroClassRegister(g, o.z, mode, 1, 0);
               //o.z.concatx(" { }", ln);
               /*
               if(mode == expansion)
                  o.z.concatx(ln, genloc__, indents(0));
               else o.z.concatx(" ");
               o.z.concatx("{");
               if(mode == expansion)
                  o.z.concatx(ln, genloc__, indents(0));
               else o.z.concatx(" ");
               cppMacroClassRegistration(g, o.z, mode, 1, c, cBase, 0);
               if(mode == expansion)
                  o.z.concatx(ln, genloc__, indents(0));
               else o.z.concatx(" ");
               o.z.concatx("}", ln);*/

               // o.z.concatx("   CONSTRUCT(", cn, ", ", bn, ") { }", ln);

               // Class Registration
               // o.z.concatx("   REGISTER() { ", cn, "_class_registration(", cn, ");", " }", ln);
               cppMacroClassRegister(g, o.z, mode, true/*mode == expansion*/,
                     c && c.cl.type == normalClass && c.cl.templateArgs, false, 1, c.name,
                     c.isContainer ? cpptemplateTemplateTypeDef : cpptemplateTemplateClassDef, 0);
               //o.z.concatx("      { ", cn, "_class_registration(", cn, ");", " }", ln);
               /*if(mode == expansion)
                  ; // o.z.concatx(genloc__, indents(1), "{", ln);
               else
                  o.z.concat(" { ");*/
               //if(!g.options.expandMacros)
               //   o.z.concatx(genloc__, indents(3), cn, "_class_registration(", cn, ");", ln);
               //else
                  //cppMacroClassRegistration(g, o.z, expansion);
               /*if(mode != expansion)
                  cppMacroClassRegistration(g, o.z, configuration, 2, c, cBase, c, 0);
               if(mode == expansion)
                  ; // o.z.concatx(genloc__, indents(1), "}", ln);
               else
                  o.z.concatx("; }", ln);*/
            }

            if(c.isArray)
               cppHardcodedArray(o);

            if((c.cl.type == structClass || (c.cl.type == normalClass && !c.isInstance && !c.isModule)) && !hasOrBaseHasTemplateClass(c.cl) &&
               !brokenOrderedPublicMembersInitializers.Find(c.cl.name) &&
               true)
               genOrderedPublicMembersInitializers(g, c, v, cn, o);

            if(c.cl.type == noHeadClass)
            {
               String tn = PrintString(cpptemplatePrefix, cn, "<TC, TCO>");
               processProperties(g, c, c.cpp_name, tn, true, o);
               processDataMembers(g, c, v, c.cpp_name, true, o);
               delete tn;
            }
            else if(!c.isInstance && !c.isModule && c.cl.type != enumClass)
            {
               processProperties(g, c, c.cpp_name, cn, true, o);
               processDataMembers(g, c, v, c.cpp_name, true, o);
            }

            if(c.cl.type == noHeadClass)
            {
               o.z.concatx(genloc__, "   ~", cpptemplatePrefix, cn, "()", ln);
               o.z.concatx(genloc__, "   {", ln);
               o.z.concatx(genloc__, "      this->impl = null; // How to know not to delete?", ln);
               o.z.concatx(genloc__, "   }", ln);
            }

            o.z.concatx(genloc__, "}");
            delete baseClassString;
         }
         o.z.concatx(";");
         o.z.concatx(ln);
      }
      else if(c.cl.type == normalClass || c.cl.type == noHeadClass || c.cl.type == structClass || c.cl.type == bitClass)
      {
         if(!(g.lib.ecereCOM && (c.isSurface || /*c.isIOChannel || */c.isWindow || c.isDataBox)))
         {
            BOutput o { vclass, c = c, z = { allocType = heap } };
            BOutput o2 { vclass, c = c, z = { allocType = heap } };
            c.outSplit = o;
            n.splitContents.Add(v);
            c.outImplementation = o2;
            n.implementationsContents.Add(v);

            if(!c.isInstance) // todo: remove this if, keep the next line
               o.z.concatx(ln);
            if(c.cl.type == normalClass)
               cppMacroClassVirtualMethods(g, o.z, configuration, false, template, 0, un, c.name, c, cBase, v, 0);

            if(c.cl.type == normalClass && !c.isInstance && !c.isModule)
            {
               // if(mode == expansion)
               {
                  cppMacroClassRegister(g, o2.z, mode, false,
                        c && c.cl.type == normalClass && c.cl.templateArgs, false, 0, c.name,
                        c.isContainer ? cpptemplateTemplateTypeDef : cpptemplateTemplateClassDef, 0);
                  o2.z.concatx(genloc__, "{", ln);
                  cppMacroClassRegistration(g, o2.z, configuration, 2, c, cBase, c, 0);
                  o2.z.concatx(genloc__, "}", ln);
               }
            }

            if(!c.isInstance && !c.isModule && !hasOrBaseHasTemplateClass(c.cl) && c.cl.type != enumClass)
               genMethodCallers(g, c, v, cn, false, o);

            if(c.cl.type == bitClass)
               genBitMembersConstructor(g, c, v, false, o, o2);

            // todo?: properties and data member for nohead classes
            if(c.cl.type == noHeadClass)
            {
               String tn = PrintString(cpptemplatePrefix, cn, "<TC, TCO>");
               processProperties(g, c, c.cpp_name, tn, false, o);
               processDataMembers(g, c, v, c.cpp_name, false, o);
               delete tn;
            }
            else if(!c.isInstance && !c.isModule && c.cl.type != enumClass)
            {
               processProperties(g, c, c.cpp_name, cn, false, o);
               processDataMembers(g, c, v, c.cpp_name, false, o);
            }
         }
      }
      delete cn;
   }
}

static bool cppEnumValueNameClash(const char * name)
{
   return
      !strcmp(name, "false") ||
      !strcmp(name, "true") ||
      !strcmp(name, "Pi") ||
      !strcmp(name, "not") ||
      !strcmp(name, "or") ||
      !strcmp(name, "and") ||
      false;
}

static void cppGenEnumClassValues(CPPGen g, BOutput o, BClass c)
{
   int maxLen = 0;
   const char * comma = "";
   NamedLink item;
   EnumClassData enumeration = (EnumClassData)c.cl.data;
   for(item = enumeration.values.first; item; item = item.next)
   {
      bool clash = cppEnumValueNameClash(item.name);
      int len = strlen(item.name) + clash ? 1 : 0;
      if(len > maxLen)
         maxLen = len;
   }
   for(item = enumeration.values.first; item; item = item.next)
   {
      bool clash = cppEnumValueNameClash(item.name);
      int len = strlen(item.name) + clash ? 1 : 0;
      o.z.concatx(comma, ln, genloc__, indents(1), item.name, clash ? "_" : "", spaces(maxLen, len), " = ", c.name, "_", item.name);
      if(comma[0] == '\0')
         comma = ",";
   }
   if(comma[0] == ',')
      o.z.concatx(ln);
}

static void genBitMembersConstructor(CPPGen g, BClass c, BVariant v, bool prototype, BOutput hppOut, BOutput cppOut)
{
   bool doBitMembers = c.cl.members.count <= 4 && !brokenBitMembersConstructor.Find(c.cl.name);
   bool split = false;
   BOutput o;
   Array<BitMemberTypeStringZero> bitMembers = doBitMembers ? { } : null;
   if(bitMembers)
   {
      // bitMember selection
      DataMember dm;
      IterDataMember dat { c.cl };
      while((dm = dat.next(all)))
      {
         BitMember bm = (BitMember)dm;
         if(!dm.dataType)
         {
            Context context = SetupTemplatesContext(c.cl);
            dm.dataType = ProcessTypeString(dm.dataTypeString, false);
            FinishTemplatesContext(context);
         }
         if(bm.type == normalMember) // todo, recurse struct/union? members for bitfields inside structs i.e.: PolygonRing
         {
            switch(dm.dataType.kind)
            {
               case charType:
                  if(!strcmp(dm.dataTypeString, "byte"))
                     bitMembers.Add({ bm, "unsigned char", " = 0" });
                  // else debugBreakpoint();
                  break;
               case classType:
               {
                  ClassType ct = dm.dataType._class && dm.dataType._class.registered ? dm.dataType._class.registered.type : systemClass;
                  if(ct == bitClass/* || ct == enumClass || ct == unitClass*/) // todo: enable these others?
                  {
                     bitMembers.Add({ bm, dm.dataType._class.registered.name/*, " = { }"*/ });
                     split = true;
                  }
                  // else debugBreakpoint();
                  break;
               }
            }
         }
      }
   }
   o = split && !prototype ? cppOut : hppOut;
   if(bitMembers && bitMembers.count > 1 && !(!split && !prototype))
   {
      bool pt = prototype && split;
      int e;
      const char * comma;
      o.z.concatx(genloc__, indents(1), split && !pt ? c.name : "", split && !pt ? "::" : "", c.name, "(");
      comma = "";
      for(e = 0; e < bitMembers.count; e++)
      {
         bool first = comma[0] == '\0';
         bool noZero = split || first;
         BitMemberTypeStringZero item = bitMembers[e];
         ClassType ct = item.bm.dataType.kind == classType ? item.bm.dataType._class.registered.type : systemClass;
         bool ref/*shouldUseRefToPreventCompleteTypeDependency*/ = ct == bitClass || ct == enumClass || ct == structClass || ct == unionClass;
         if(!noZero)
         {
            int f = e;
            while(++f < bitMembers.count)
            {
               if(!bitMembers[f].zero)
               {
                  noZero = true;
                  break;
               }
            }
         }
         o.z.concatx(comma, item.typeString, ref ? " &" : "", " ", item.bm.name, noZero ? "" : item.zero);
         if(comma[0] == '\0')
            comma = ", ";
      }
      o.z.concatx(")", pt ? ";" : "", ln);
      if(!split || !pt)
      {
         o.z.concatx(genloc__, indents(1), "{", ln);
         o.z.concatx(genloc__, indents(2), "impl = ", c.upper, "(");
         comma = "";
         for(e : bitMembers)
         {
            BitMemberTypeStringZero item = e;
            o.z.concatx(comma, item.bm.name);
            if(comma[0] == '\0')
               comma = ", ";
         }
         o.z.concatx(");", ln);
         o.z.concatx(genloc__, indents(1), "}", ln);
      }
   }
   delete bitMembers;
}

static void genMethodCallers(CPPGen g, BClass c, BVariant v, const char * cn, bool prototype, BOutput o)
{
   // LIB_EXPORT void (* Surface_clear)(C(Surface) __this, C(ClearType) type);
   bool noHead = c.cl.type == noHeadClass;
   bool template = c && c.cl && c.cl.type == normalClass && c.cl.templateArgs;
   bool content = false;
   int l, maxLen = 0;
   int ind = prototype ? 1 : 0;
   BMethod m; IterMethod itm { c.cl };
   while((m = itm.next(publicNormal)))
   {
      m.init(itm.md, c, g);
      if((l = strlen(m.mname)) > maxLen) maxLen = l;
   }
   while((m = itm.next(publicNormal)))
   {
      bool hasStructClassParam = false;
      // const char * on = m.name;
      const char * mn = m.mname;
      const char * mncpp = !strcmp(mn, "delete") ? "_delete" : !strcmp(mn, "union") ? "_union" : !strcmp(mn, "printf") ? "_printf" : mn;
      char * dmn = null;
      // Type param;
      Type t = m.md.dataType;
      // bool byRefTypedThis = false;
      bool returnAddress = false;
      bool noRet = t.returnType.kind == voidType;
      // bool destVsSrc = false; //!strcmp(mn, "onCopy") ? true : false;
      const char * first = null;
      // const char * nthis = null;
      Type returnType = t.returnType;
      char * typeString = /*returnType.kind == classType && returnType.classObjectType == anyObject ? CopyString(g_.sym.instance) : */printType(t.returnType, false, false, true);
      Class clRegRT;
      BClass cRT;
      bool hackRT;
      ClassType ctRT = cppGetClassInfoFromType(t.returnType, true, &clRegRT, &cRT, &hackRT, null, null);
      char * params = null;
      char * args = null;
      TypeInfo argsInfo;
      // todo: support preceding arguments?
      Type p1 = t.params.count == 2 ? t.params.first : null;
      Type p2 = t.params.count == 2 ? t.params.last : null;
      bool typedVarArgs = t.params.count == 2 && p1.kind == classType && p1.classObjectType == typedObject && p2.kind == ellipsisType;

      if(brokenMethods.Find({ c.cl.name, m.md.name })) continue;
      if(m.hasTemplateAnything())
         continue;

      if(!strcmp(mn, "delete") || !strcmp(mn, "union") || !strcmp(mn, "printf"))
         mncpp = dmn = PrintString("_", mn);
      else
      {
         // todo: check in base classes as well
         BClass c2 = c;
         while(c2)
         {
            Property pt; IterProperty prop { c2 };
            while((pt = prop.next(publicOnly)))
            {
               const char * pn = pt.name; // member name
               if(!strcmp(pn, mn))
               {
                  mncpp = dmn = PrintString("_", mn);
                  break;
               }
            }
            if(!c2.cl.base) break;
            c2 = c2.cl.base;
            if(c2.isInstance || c2.is_class || c2.is_enum || c2.is_struct) break;
         }
      }

      if(!content)
      {
         o.z.concatx(ln);
         content = true;
      }

      o.z.concatx(genloc__, indents(ind));
      if(!prototype)
         o.z.concatx(noHead ? cpptemplateNoHeadDef : template ? cpptemplateTemplateClassDef : "", (noHead || template) ? " " : "");
      if(typedVarArgs)
         o.z.concatx("template <typename ...Ts> ");
      if(t.staticMethod && prototype)
         o.z.concat("static ");
      o.z.concat("inline ");
      if(returnType.kind == templateType)
         o.z.concatx("TP(", c.name, ", ", returnType.templateParameter.identifier.string, ")");
      else if((ctRT == normalClass || ctRT == noHeadClass))
      {
         if(ctRT == normalClass)
         {
            if(cRT.isInstance)   // Exception
               o.z.concatx(cRT.name, " *");
#ifdef NORMAL_CLASS_RETURN_METHOD_TIH
            else if(!cRT.isString)
               o.z.concatx("TIH<", cRT.cpp_name, ">");
#endif
            else
               o.z.concatx(cRT.cpp_name);
         }
         else if(ctRT == noHeadClass)
            o.z.concatx(cRT.symbolName, " *");
      }
      else
         o.z.concatx(strptrNoNamespace(typeString));
      o.z.concatx(" ");
      if(!prototype)
         o.z.concatx(noHead || template ? cpptemplatePrefix : "", c.cpp_name,
               noHead ? cpptemplateNoHeadParams : template ? cpptemplateTemplateClassParams : "", "::");
      o.z.concatx(mncpp, "(");
      if(t.kind == functionType)
      {
         bool comma = false; //const char * comma = "";
         /*
         switch(t.classObjectType)
         {
            case none:
               if(!strcmp(cn, "Application"))
                  o.z.concatx("C(Instance)");
               else
                  o.z.concatx("C(", cn, ")");
               nthis = "o_";
               o.z.concatx(" ", nthis);
               comma = true;
               break;
            //case classPointer: conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
            case typedObject:
            {
               byRefTypedThis = t.byReference;
               returnAddress = ctRT == normalClass || ctRT == noHeadClass;
               nthis = /-*iMetThisNameSwap.Index(mn, false) ? iMetThisNameSwap.data :*-/ "o_";
               o.z.concatx("XClass * _class, C(Instance) ", byRefTypedThis ? "* " : "", nthis);
               comma = true;
               break;
            }
            //case anyObject:    conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
            default:           conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
         }
         */
         // if(!(t.params.count == 1 && ((Type)t.params.first).kind == voidType))
         // {
         //    bool comma = false;
         if(typedVarArgs)
            o.z.concat("const Ts&... ts");
         else
         {
            argsInfo = { type = t, m = m, md = m.md, cl = c.cl, c = c };
            o.z.concatx((params = cppParams(c, argsInfo, regMethodCppParamList, v, null, false, comma, configuration, &first, null, &hasStructClassParam, null, { })));
            delete params;
         }
         // }
      }
      o.z.concatx(")", prototype ? ";" : "");
      // if(prototype)
      //    o.z.concatx(indents(ind), "// ", cn, "_", mn);
      o.z.concatx(ln);
      if(!prototype)
      {
         bool hasVarArgs = false;
         bool comma = false;
         if(returnAddress)
            Print("");
         o.z.concatx(genloc__, indents(ind), "{", ln);
         if(typedVarArgs)
         {
            // todo: support static method?
            o.z.concatx(genloc__, indents(ind + 1), "std::apply(", ln);
            o.z.concatx(genloc__, indents(ind + 2), "[this](auto ...args) { ", c.name, "_", mn, "(impl, args...); },", ln);
            o.z.concatx(genloc__, indents(ind + 2), "std::tuple_cat(std::make_tuple(classof(ts), vapass(ts))..., std::make_tuple(null))", ln);
            o.z.concatx(genloc__, indents(ind + 1), ");", ln);
         }
         else
         {
            {
               bool comma = false;
               // bool ptrI = !t.thisClass || (t.thisClass.string && !strcmp(t.thisClass.string, "class"));
               char * args = cppParams(c, argsInfo, regMethodArgsPoorObjectPassing2, /*vClass*/null, cn, /*!ptrI*/false, comma, configuration, null, null, null, &hasVarArgs, { });
               int len = strlen(args);
               if(len > 1)
               {
                  if(args[len - 1] == ' ')
                     args[len - 1] = '\0';
                  o.z.concat(indents(ind + 1));
                  o.z.concat(args);
                  o.z.concatx(ln);
               }
               delete args;
            }
            if(hasVarArgs)
            {
               o.z.concatx(genloc__, indents(ind + 1), "va_list args;", ln);
               o.z.concatx(genloc__, indents(ind + 1), "va_start(args, format);", ln);
            }
            o.z.concatx(genloc__, indents(ind + 1),    noRet ? "" : "return ");
#ifdef NORMAL_CLASS_RETURN_METHOD_TIH
            if(ctRT == normalClass && !cRT.isString && !cRT.isInstance)
               o.z.concatx("TIH<", cRT.cpp_name, ">(");
#else
            if(ctRT == normalClass && !cRT.isString && !cRT.isInstance)
               o.z.concatx(cRT.cpp_name, "(");
#endif
            o.z.concatx(c.name, "_", mn, "(");

            switch(t.classObjectType)
            {
               case none:
                  if(!t.staticMethod)
                  {
                     if(c.cl.type == noHeadClass)
                        o.z.concatx("(C(", c.name, ")*)", "this->");
                     else if(c.cl.type == structClass)
                        o.z.concat("&");
                     else if(c.cl.type == normalClass && c.cl.templateArgs)
                        o.z.concat("this->");
                     o.z.concat("impl");
                     comma = true;
                  }
                  break;
               //case classPointer: conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
               /*case typedObject:
               {
                  byRefTypedThis = t.byReference;
                  returnAddress = ctRT == normalClass || ctRT == noHeadClass;
                  nthis = /-*iMetThisNameSwap.Index(mn, false) ? iMetThisNameSwap.data :*-/ "o_";
                  o.z.concatx("XClass * _class, C(Instance) ", byRefTypedThis ? "* " : "", nthis);
                  comma = true;
                  break;
               }*/
               //case anyObject:    conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
               default:           conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
            }

            o.z.concatx((args = cppParams(c, argsInfo, regMethodArgsPassing2, v, null, false, comma, configuration, null, null, null, null, { })));
            o.z.concatx(")");
            if(ctRT == normalClass && !cRT.isString && !cRT.isInstance)
               o.z.concatx(")");
            o.z.concatx(";", ln);
            if(hasVarArgs)
               o.z.concatx(genloc__, indents(ind + 1), "va_end(args);", ln);
            delete args;
         }
         o.z.concatx(genloc__, indents(ind), "}", ln);
      }
      if(hasStructClassParam)
      {
         first = null;
         o.z.concatx(genloc__, indents(ind));
         if(!prototype)
            o.z.concatx(noHead ? cpptemplateNoHeadDef : template ? cpptemplateTemplateClassDef : "", " ");
         o.z.concat("inline ");
         if(returnType.kind == templateType)
            o.z.concatx("TP(", c.name, ", ", returnType.templateParameter.identifier.string, ")");
         else if((ctRT == normalClass || ctRT == noHeadClass))
         {
            if(ctRT == normalClass)
            {
               if(!strcmp(cRT.name, "Instance"))   // Exception
                  o.z.concatx(cRT.name, " *");
               else
                  o.z.concatx(cRT.symbolName);
            }
            else if(ctRT == noHeadClass)
               o.z.concatx(cRT.symbolName, " *");
         }
         else
            o.z.concatx(strptrNoNamespace(typeString));
         o.z.concatx(" ");
         if(!prototype)
            o.z.concatx(noHead || template ? cpptemplatePrefix : "", c.cpp_name,
                  noHead ? cpptemplateNoHeadParams : template ? cpptemplateTemplateClassParams : "", "::");
         o.z.concatx(mncpp, "(");
         if(t.kind == functionType)
         {
            bool comma = false; //const char * comma = "";
            argsInfo = { type = t, m = m, md = m.md, cl = c.cl, c = c };
            o.z.concatx((params = cppParams(c, argsInfo, regMethodCppParamList2, v, null, false, comma, configuration, &first, null, null, null, { })));
         }
         o.z.concatx(")", prototype ? ";" : "");
         // if(prototype)
         //    o.z.concatx(indents(ind), "// ", cn, "_", mn);
         o.z.concatx(ln);
         if(!prototype)
         {
            bool hasVarArgs = false;
            bool comma = false;
            if(returnAddress)
               Print("");
            o.z.concatx(genloc__, indents(ind), "{", ln);
            {
               bool comma = false;
               // bool ptrI = !t.thisClass || (t.thisClass.string && !strcmp(t.thisClass.string, "class"));
               char * args = cppParams(c, argsInfo, regMethodArgsPoorObjectPassing3, /*vClass*/null, cn, /*!ptrI*/false, comma, configuration, null, null, null, &hasVarArgs, { });
               int len = strlen(args);
               if(len > 1)
               {
                  if(args[len - 1] == ' ')
                     args[len - 1] = '\0';
                  o.z.concat(indents(ind + 1));
                  o.z.concat(args);
                  o.z.concatx(ln);
               }
               delete args;
            }
            if(hasVarArgs)
            {
               o.z.concatx(genloc__, indents(ind + 1), "va_list args;", ln);
               o.z.concatx(genloc__, indents(ind + 1), "va_start(args, format);", ln);
            }
            o.z.concatx(genloc__, indents(ind + 1),    noRet ? "" : "return ", c.name, "_", mn, "(");

            switch(t.classObjectType)
            {
               case none:
                  if(!t.staticMethod)
                  {
                     if(c.cl.type == noHeadClass)
                        o.z.concatx("(C(", c.name, ")*)", "this->");
                     else if(c.cl.type == structClass)
                        o.z.concat("&");
                     else if(c.cl.type == normalClass && c.cl.templateArgs)
                        o.z.concat("this->");
                     o.z.concat("impl");
                     comma = true;
                  }
                  break;
               default:           conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
            }

            o.z.concatx((args = cppParams(c, argsInfo, regMethodArgsPassing3, v, null, false, comma, configuration, null, null, null, null, { })));
            if(hasVarArgs)
               o.z.concatx(genloc__, indents(ind + 1), "va_end(args);", ln);
            o.z.concatx(");", ln);
            o.z.concatx(genloc__, indents(ind), "}", ln);
         }
      }
      delete dmn;
   }
}

static void genOrderedPublicMembersInitializers(CPPGen g, BClass c, BVariant v, const char * cn, BOutput o)
{
   bool skip;
   bool normal = c.cl.type == normalClass;
   int count = 0;
   IterMemberOrPropertyPlus itmpp { cl = c.cl };
   AVLTree<const String> memberNames { };
   skip = false;
   while(itmpp.next(publicOnly))
   {
      Type t;
      if(skip || memberNames.Find(itmpp.mp.name) || brokenMembers.Find({ c.cl.name, itmpp.mp.name }))
         continue;
      if((itmpp.pt && (itmpp.pt.conversion || !itmpp.pt.Set)) || (c.cl.type == structClass && !itmpp.dm))
         continue;

      if(itmpp.pt && !itmpp.pt.dataType)
         itmpp.pt.dataType = resolveDataType(c, itmpp.pt.dataTypeString);
      else if(itmpp.dm && !itmpp.dm.dataType)
         itmpp.dm.dataType = resolveDataType(c, itmpp.dm.dataTypeString);

      t = itmpp.pt ? itmpp.pt.dataType : itmpp.dm ? itmpp.dm.dataType : null;

      if(t.kind == pointerType && t.type.kind == classType &&
            t.type._class.registered &&
            (t.type._class.registered.type == normalClass ||
            t.type._class.registered.type == noHeadClass))
         continue;

      if(skipPointerToStructClass) continue;

      memberNames.Add(itmpp.mp.name);

      {
         bool isString = false;
         Class clDataType = null;
         ClassType ct = cppGetClassInfoFromType(t, false, &clDataType, null, null, &isString, null);
         if(clDataType && clDataType.type == structClass) continue;
         // if(brokenOrderedPublicMembersInitializersTypes.Find()) continue;
         if(/*(!first && */((ct == normalClass && !isString) || ct == noHeadClass)/*)*/ ||
               ct == bitClass ||
               (clDataType && hasOrBaseHasTemplateClass(clDataType)) || t.kind == templateType)
            skip = true;
         else if(t.kind != functionType && t.kind != arrayType)
         {
            ClassType ct2 = t.kind == pointerType && t.type.kind == classType ?
                  cppGetClassInfoFromType(t.type, false, null/*&clDataType*/, null/*&cDataType*/, null, &isString, null) : ct;
            bool ptr = t.kind == pointerType && t.type.kind == classType &&
                  ct2 == structClass;
            if((clDataType && (clDataType.type == unitClass || clDataType.type == bitClass))/* ||
               (ptr && t.type._class && t.type._class.registered && t.type._class.registered != c.cl)*/)
               v.processDependency(g, otypedef, otypedef, ptr ? t.type._class.registered : clDataType);
            count++;
         }
      }
   }
   memberNames.Free();
   if(count)
   {
      bool first;
      const String comma = "";
      bool sfx = c.cl.type == normalClass && c.cl.templateArgs;
      o.z.concatx(ln, genloc__, indents(1), "inline ", cn, sfx ? "<TPT>" : "", "(");
      skip = false;
      first = true;
      while(itmpp.next(publicOnly))
      {
         Type t;

         if(skip || memberNames.Find(itmpp.mp.name) || brokenMembers.Find({ c.cl.name, itmpp.mp.name }))
            continue;
         if((itmpp.pt && (itmpp.pt.conversion || !itmpp.pt.Set)) || (c.cl.type == structClass && !itmpp.dm))
            continue;

         t = itmpp.pt ? itmpp.pt.dataType : itmpp.dm ? itmpp.dm.dataType : null;

         if(t.kind == pointerType && t.type.kind == classType &&
               t.type._class.registered &&
               (t.type._class.registered.type == normalClass ||
               t.type._class.registered.type == noHeadClass))
            continue;

         if(skipPointerToStructClass) continue;

         memberNames.Add(itmpp.mp.name);
         {
            bool isString = false;
            const String dataTypeString = itmpp.pt ? itmpp.pt.dataTypeString : itmpp.dm ? itmpp.dm.dataTypeString : null;
            Class clDataType = null;
            ClassType ct = cppGetClassInfoFromType(t, false, &clDataType, null, null, &isString, null);
            if(clDataType && clDataType.type == structClass) continue;
            if(/*(!first && */((ct == normalClass && !isString) || ct == noHeadClass)/*)*/ ||
                  ct == bitClass ||
                  (clDataType && hasOrBaseHasTemplateClass(clDataType)) || t.kind == templateType)
               skip = true;
            else if(t.kind != functionType && t.kind != arrayType) // broken inititializers
            {
               const char * mn = itmpp.mp.name;
               String tz = null;
               TypeInfo ti { type = t, typeString = dataTypeString, cl = c.cl };
               String tnp2 = null;
               String tn = cppTypeName(ti, false/*(*//*ct == normalClass && !isString*//*) || ct == unitClass*/, &tz, &tnp2);
               bool ref = (ct == normalClass && !isString) || ct == noHeadClass;
               // bool u = ct == unitClass;
               o.z.concatx(comma, ref ? "const " : "", tn, ref ? "&" : "", " ", mn, tnp2 ? tnp2 : "");
               if(!first)
                  o.z.concatx(" = ", tz);
               if(first)
               {
                  comma = ", ";
                  first = false;
               }
            }
         }
      }
      memberNames.Free();
      o.z.concat(")");
      if(!(c.cl.type == structClass && true/* todo: allMembersInitializedViaOptionalParamsToThisInitializingConstructor() */))
         o.z.concatx(" : ", cn, sfx ? "<TPT>" : "", "()");
      o.z.concatx(ln);
      o.z.concatx(genloc__, indents(1), "{", ln);
      skip = false;
      // first = true;
      while(itmpp.next(publicOnly))
      {
         Type t;

         if(skip || memberNames.Find(itmpp.mp.name) || brokenMembers.Find({ c.cl.name, itmpp.mp.name }))
            continue;
         if((itmpp.pt && (itmpp.pt.conversion || !itmpp.pt.Set)) || (c.cl.type == structClass && !itmpp.dm))
            continue;

         t = itmpp.pt ? itmpp.pt.dataType : itmpp.dm ? itmpp.dm.dataType : null;

         if(t.kind == pointerType && t.type.kind == classType &&
               t.type._class.registered &&
               (t.type._class.registered.type == normalClass ||
               t.type._class.registered.type == noHeadClass))
            continue;

         if(skipPointerToStructClass) continue;

         memberNames.Add(itmpp.mp.name);
         {
            bool isString = false;
            BClass cDataType = null;
            Class clDataType = null;
            ClassType ct = cppGetClassInfoFromType(t, false, &clDataType, &cDataType, null, &isString, null);
            if(clDataType && clDataType.type == structClass) continue; // broken?
            if(/*(!first && */((ct == normalClass && !isString) || ct == noHeadClass)/*)*/ ||
                  ct == bitClass ||
                  (clDataType && hasOrBaseHasTemplateClass(clDataType)) || t.kind == templateType)
               skip = true;
            else if(t.kind != functionType && t.kind != arrayType)
            {
               const char * mn = itmpp.mp.name;
               bool impl = ct == unitClass;
               bool cast = !normal && ct == enumClass;
               ClassType ct2 = t.kind == pointerType && t.type.kind == classType ?
                     cppGetClassInfoFromType(t.type, false, null/*&clDataType*/, null/*&cDataType*/, null, &isString, null) : ct;
               bool ptr = t.kind == pointerType && t.type.kind == classType &&
                     ct2 == structClass;
               o.z.concatx(genloc__, indents(2), normal ? "this->" : "impl.", mn, " = ",
                     cast ? "(" : "", cast ? cDataType.symbolName : "", cast ? ")" : "", ptr ? "&" : "", mn,
                     ptr ? "->" : "", impl ? "." : "", ptr || impl ? "impl" : "", ";", ln);
            }
            // if(first) first = false;
         }
      }
      memberNames.Free();
      o.z.concatx(genloc__, indents(1), "}", ln);
   }
   delete memberNames;
}

static void processProperties(CPPGen g, BClass c, const char * cn, const char * tcn, bool prototype, BOutput o)
{
   bool content = false;
   Property pt; IterProperty prop { c };
   while((pt = prop.next(publicOnly)))
   {
      const char * mn = pt.name; // member name
      Type t = pt.dataType ? pt.dataType : (pt.dataType = resolveDataType(c, pt.dataTypeString));
      TypeInfo ti { type = t, typeString = pt.dataTypeString, c = c, cl = c.cl, pt = pt };
      if(skipPointerToStructClass) continue;
      if(!content)
      {
         o.z.concatx(ln);
         content = true;
      }
      commonMemberHandling(g, c, prototype, cn, tcn, mn, true, pt.Get != null, pt.Set != null, ti, o);
   }
}

// todo: fix those? broken or unsupported?
define skipPointerToStructClass = t.kind == pointerType && t.type.kind == classType && t.type._class.registered && t.type._class.registered.type == structClass;

static void processDataMembers(CPPGen g, BClass c, BVariant v, const char * cn, bool prototype, BOutput o)
{
   bool content = false;
   DataMember dm; IterDataMember dat { c };
   while((dm = dat.next(all)))
   {
      const char * mn = dm.name; // member name
      Type t = dm.dataType ? dm.dataType : (dm.dataType = resolveDataType(c, dm.dataTypeString));
      TypeInfo ti { type = t, typeString = dm.dataTypeString, cl = c.cl };
      BitMember bm = (BitMember)dm;

      // todo, recurse struct/union? members for bitfields inside structs i.e.: PolygonRing
      if(bm.type != normalMember) continue;
      if(t.kind == arrayType) continue; // todo: fix those? broken or unsupported?
      if(t.kind == pointerType && t.type.kind == functionType) continue; // todo: fix those? broken or unsupported?
      if(t.kind == pointerType && t.type.kind == pointerType && t.type.type.kind == functionType) continue; // todo: fix those? broken or unsupported?
      if(t.kind == subClassType) continue; // todo: fix those? broken
      if(t.kind == classType && !t._class.registered && !strcmp(t._class.string, "Type")) continue; // todo: what with those?
      if(t.kind == classType && !t._class.registered && !strcmp(t._class.string, "Instantiation")) continue; // todo: what with those?
      if(t.kind == classType && !t._class.registered && !strcmp(t._class.string, "ClassDefinition")) continue; // todo: what with those?
      if(t.kind == pointerType && t.type.kind == classType && t.type._class.registered && t.type._class.registered.type == structClass) continue; // todo: fix those? broken or unsupported?

      // Skip members which already have properties of the same name...
      if(eClass_FindProperty(c.cl, mn, c.cl.module) || strstr(mn, "__ecerePrivateData")) continue;

      if(!content)
      {
         o.z.concatx(ln);
         content = true;
      }

      commonMemberHandling(g, c, prototype, cn, cn, mn, false, false, false, ti, o);
   }
}

enum PropComponentType { macroPropGet, macroIntPropSet, macroPropSet };
class PropertyComponent
{
public:
   PropComponentType type;
   const String membername;
   String typename;
   String typenamePart2;
   String returnType;
   Array<String> code;
   bool commented;
   ~PropertyComponent()
   {
      delete typename;
      delete typenamePart2;
      delete returnType;
      if(code) code.Free();
      delete code;
   }
}

//      bool prototype,      // prototype (true) or implementation
//      bool template,       // template (true) version for noheads or normal
enum PropertyMacroType { normal, nohead, template };
class PropertyMacroBits
{
public:
   bool prototype:1;
   PropertyMacroType type:2;
}

static void commonMemberHandling(
      CPPGen g,
      BClass c,
      bool prototype,
      const char * cn,
      const char * tcn,
      const char * mn,
      bool isProp,
      bool hasGet,
      bool hasSet,
      TypeInfo ti,
      BOutput o)
{
   bool singleSet = hasSet && !hasGet;
   bool isString = false;
   bool genGet = false;
   bool genSet = false;
   bool different = false;
   MacroMode mode = g.expansionOrUse;
   const char * lc = mode != expansion ? " \\" : "";    // lc: line continuation
   int ind = mode == expansion ? 1 : 4;
   PropertyMacroBits opts { prototype, (c.cl.type == noHeadClass) ? nohead : (c.cl.type == normalClass && c.cl.templateArgs) ? template : normal };

   int ptrX = 0;
   Class clRegX;
   BClass cX;
   bool hackX;
   bool isStringX;
   bool isConstX;
   Type typeX = unwrapPtrTypeGetClassInfo(ti.type, true, &clRegX, &cX, &ptrX, &hackX, &isStringX, &isConstX);
   ClassType ctX = clRegX ? clRegX.type : systemClass;
   bool castX = (ctX == enumClass || ctX == unitClass || (ctX == bitClass && ptrX));

   BClass cType;
   ClassType ct = cppGetClassInfoFromType(ti.type, true, null, &cType, null, &isString, null);
   String tz = null;
   String tnp2 = null;
   bool bareStyle = (ct == normalClass && !isString) || ct == structClass || ct == unitClass || ct == noHeadClass;
   String tn = cppTypeName(ti, bareStyle, &tz, &tnp2);
   PropertyComponent component;
   Array<PropertyComponent> components { };
   const String implStringThis;
   bool cast = ct == enumClass;
   bool cnst = ct == bitClass; // construct
   if(ptrX && (ctX == normalClass || ctX == noHeadClass))
   {
      delete tn;
      tn = PrintString(cX.symbolName, stars(ptrX, 0));
   }


   if(c.cl.type == structClass)
      implStringThis = "self ? &self->impl : null";
   else
      implStringThis = "self ? self->impl : null";

   /*if(ct == normalClass && !isString)
   {
      String t = PrintString(ti.type.constant ? "const " : "", tn, "&");
      delete tn;
      tn = t;
   }*/

   /*if(!strcmp(mn, "transform"))
      Print("");

   if(c.cl.type == noHeadClass)
   {
      delete tn;
      tn = PrintString(cpptemplatePrefix, c.name);
   }*/

   if(ti.type.kind == templateType) return;

   // todo: remove when done solving all the cases
   if(brokenMembers.Find({ c.cl.name, mn })) return;

   if(ti.type.kind != templateType)      // todo
   // ti.type.kind != arrayType)         // todo (broken stuff that's not generated)
   {
      if(isProp)
      {
         different = (eClass_FindDataMember(c.cl, mn, c.cl.module, null, null) || strstr(mn, "__ecerePrivateData"));
         if(hasGet || different)
            genGet = true;
         genSet = hasSet;
      }
      else
      {
         genGet = true;
         genSet = true;
      }
   }

   /*
   if(ct == normalClass)
      v.processDependency(g, otypedef, otypedef, ti.type._class.registered);
   */

   // note: this was only for data member and we're keeping this but that surely wrong
   /*
   if(!isProp && ti.type.kind == arrayType)
   {
      Type t = ti.type;
      char arrayDataType[1024];
      arrayDataType[0] = 0;
      while(t.kind == arrayType && t.type) t = t.type; // todo: this is buggy, loosing indirection count
      PrintType(t, arrayDataType, true, false);
      delete tn;
      tn = PrintString(arrayDataType, "*");   // see buggy above
   }
   */

   // this note was in dataMember only aka !isProp
   // TODO: Don't output set if const ?

   /*
   if(prototype && g.expansionOrUse == expansion)
      Print("");
   */

   if(isProp && ct == normalClass && !isString)
   {
      if(hasSet && hasGet)
      {
         component = { macroPropSet, mn, PrintString("const ", tn, " &") };
         if(!prototype) component.code =
               { [ PrintString(lc, ln, genloc__, indents(ind), "printf(\"calling ", cn, "_set_", mn, "(", implStringThis, ", v.impl)", "\\n\");"),
                   PrintString(lc, ln, genloc__, indents(ind), cn, "_set_", mn, "(", implStringThis, ", v.impl);") ] };
         components.Add(component);
      }
      if(hasGet)
      {
         component = { macroPropGet, mn, PrintString("TIH<", tn, ">") };
         if(!prototype) component.code =
               { [ PrintString(lc, ln, genloc__, indents(ind), "C(Instance) i = ", cn, "_get_", mn, "(", implStringThis, ");"),
                   PrintString(lc, ln, genloc__, indents(ind), "TIH<", tn, "> cppi(i);"),
                   PrintString(lc, ln, genloc__, indents(ind), "return *cppi;") ] };
         components.Add(component);
      }
      if(hasSet && hasGet)
      {
         component = { macroIntPropSet, mn, PrintString("const ", tn, " *") };
         if(!prototype) component.code =
               { [ PrintString(lc, ln, genloc__, indents(ind), "printf(\"calling ", cn, "_set_", mn, "(", implStringThis, ", v ? v->impl : null)", "\\n\");"),
                   PrintString(lc, ln, genloc__, indents(ind), cn, "_set_", mn, "(", implStringThis, ", v ? v->impl : null);") ] };
         components.Add(component);
      }
      if(hasGet)
      {
         component = { macroPropGet, mn, CopyString("->"), returnType = PrintString("TIH<", tn, ">") };
         if(!prototype) component.code =
               { [ PrintString(lc, ln, genloc__, indents(ind), "C(Instance) i = ", cn, "_get_", mn, "(", implStringThis, ");"),
                   PrintString(lc, ln, genloc__, indents(ind), "TIH<", tn, "> holder(i);"),
                   PrintString(lc, ln, genloc__, indents(ind), "return holder;") ] };
         components.Add(component);

         component = { macroPropGet, mn, CopyString(tn) };
         if(!prototype) component.code =
               { [ PrintString(lc, ln, genloc__, indents(ind), "C(Instance) i = ", cn, "_get_", mn, "(", implStringThis, ");"),
                   PrintString(lc, ln, genloc__, indents(ind), "return ", tn, "(i);") ] };
         components.Add(component);

         component = { macroPropGet, mn, PrintString(tn, "*") };
         if(!prototype) component.code =
               { [ PrintString(lc, ln, genloc__, indents(ind), "C(Instance) i = ", cn, "_get_", mn, "(", implStringThis, ");"),
                   PrintString(lc, ln, genloc__, indents(ind), "return BINDINGS_CLASS(i) ? (", tn, " *)INSTANCEL(i, i->_class) : (", tn, " *)0;") ] };
         components.Add(component);
      }
   }
   else
   {
      bool needAmp = c.cl.type == structClass;
      bool addAmp = ct == structClass;
      bool addImpl = bareStyle; // ct == normalClass && !isString)/* || ct == structClass*/; // && strcmp(tn, "constString")
      bool nc = ct == unitClass || ct == structClass || ct == noHeadClass; // nc: (n)o (c)lass in constructor
      /*
      if(isProp)
      {
      // unmergedPropertyImpl(addAmp, addImpl, hasGet, hasSet, cn, mn, tn, tz, c, ti.type, sd, gd);
         if(hasSet && (different || hasGet))
            sd.concatx(cn, "_set_", mn, "(self->impl, ", addAmp ? "&" : "", "v", addImpl ? ".impl" : "", ");");
         else if(different)
            sd.concatx("IPTR(self->impl, ", cn, ")->", mn, " = v;");
         else if(hasSet && !hasGet)
            sd.concatx(cn, "_set_", mn, "(self->impl, ", addAmp ? "&" : "", "v", addImpl ? ".impl" : "", ");");
         if(hasGet)
         {
            if(addAmp)
               gd.concatx(tn, " value;", cn, "_get_", mn, "(self->impl", ", &value","); ","return value;");
            else if(addImpl)
               gd.concatx(tn, " value(", cn, "_get_", mn, "(self->impl), ", cn, "::_class); ", "return value;");
            else
               gd.concatx("return ", cn, "_get_", mn, "(self->impl);");
         }
         else if(different)
         {
            if(addImpl)
               gd.concatx("self ? ", tn, " value(IPTR(self->impl, ", cn, ")->", mn, ", ", cn, "::_class); ", "return value;", " : ", tz, ";");
            else
               gd.concatx("return self ? IPTR(self->impl, ", cn, ")->", mn, " : ", tz, ";");
         }
      }
      else
      {
      // unmergedDataMemberImpl(addAmp, addImpl, cn, mn, tn, tz, c, ti.type, sd, gd);
         // broken issue with properties of type arrayType missing a set... also, how do we really get/set? is status quo right? use "CM(" tn ")"?
         if(ti.type.kind == arrayType)
            gd.concatx ("return self ? ", "(", tn, ")", "IPTR(self->impl, ", cn, ")->", mn, " : ", tz, ";");
         else
         {
            sd.concatx("IPTR(self->impl, ", cn, ")->", mn, " = v", addImpl ? ".impl" : "", ";");
            if(addImpl)
               gd.concatx(tn, " value(IPTR(self->impl, ", cn, ")->", mn, ", ", cn, "::_class); ", "return value;");
            else
               gd.concatx("return self ? IPTR(self->impl, ", cn, ")->", mn, " : ", tz, ";");
         }
      }
      */
      if(genSet && singleSet)
      {
         component = { macroIntPropSet, mn, CopyString(tn), tnp2 ? CopyString(tnp2) : null };
         if(!prototype)
         {
            if(different)
            {
               if(hasSet)
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), cn, "_set_", mn, "(", implStringThis, ", v);") ] };
               else if(c.cl.type == normalClass)
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), "IPTR(self->impl, ", cn, ")->", mn, " = v;") ] };
               else if(c.cl.type == noHeadClass)
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), "((", c.symbolName, " *)self->impl)->", mn, " = v;") ] };
               else
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), "((", c.symbolName, " *)&self->impl)->", mn, " = v;") ] };
            }
            else
            {
               component.code = { [
                  // PrintString(lc, ln, genloc__, indents(ind), cn, "_set_", mn, "(", implStringThis, ", v);") ] };
                     PrintString(lc, ln, genloc__, indents(ind), cn, "_set_", mn, "(", needAmp ? "&" : "", "self->impl, ", cast ? "(" : "", cast ? cType.symbolName : "", cast ? ")" : "", addAmp ? "&" : "", "v", addImpl ? ".impl" : "", ");") ] };
            }
         }
         components.Add(component);
      }
      else if(genSet)
      {
         component = { macroPropSet, mn, CopyString(tn), tnp2 ? CopyString(tnp2) : null };
         if(!prototype)
         {
            ClassType ct2 = ti.type.kind == pointerType && ti.type.type.kind == classType ?
                  cppGetClassInfoFromType(ti.type.type, false, null/*&clDataType*/, null/*&cDataType*/, null, &isString, null) : ct;
            bool ptr = ti.type.kind == pointerType && ti.type.type.kind == classType && ct2 == structClass;
            if(isProp)
               component.code = { [
                  // PrintString(lc, ln, genloc__, indents(ind), cn, "_set_", mn, "(", implStringThis, ", v);") ] };
                     PrintString(lc, ln, genloc__, indents(ind), cn, "_set_", mn, "(", implStringThis, ", ", cast ? "(" : "", cast ? cType.symbolName : "", cast ? ")" : "", addAmp ? "&" : "", "v", addImpl ? ".impl" : "", ");") ] };
            else if(c.cl.type == normalClass)
            {
               if(ctX == unitClass || ctX == bitClass)
               {
                  const char * castSymbol = ctX == unitClass && cX.cl.base.type == unitClass ? cX.baseSymbolName : cX.symbolName;
               component.code = { [
                     PrintString(lc, ln, genloc__, indents(ind), "IPTR(self->impl, ", cn, ")->", mn, " = ", castX ? "(" : "", castX ? castSymbol : "", castX && ptrX ? stars(ptrX, 0) : "", castX ? ")" : "", "v", addImpl ? ".impl" : "", ";") ] };
               }
               else
               component.code = { [
                     PrintString(lc, ln, genloc__, indents(ind), "IPTR(self->impl, ", cn, ")->", mn, " = ", cast ? "(" : "", cast ? cType.symbolName : "", cast ? ")" : "", "v", addImpl ? ".impl" : "", ";") ] };
            }
            else if(c.cl.type == noHeadClass)
               component.code = { [
                     PrintString(lc, ln, genloc__, indents(ind), "((", c.symbolName, " *)self->impl)->", mn, " = v", addImpl ? ".impl" : "", ";") ] };
            else if(c.cl.type == bitClass)
               component.code = { [
                     PrintString(lc, ln, genloc__, indents(ind), c.upper, "_SET_", mn, "(self->impl, v", addImpl ? ".impl" : "", ");") ] };
            else
            {
               if(ctX == unitClass || ctX == bitClass)
               component.code = { [
                     PrintString(lc, ln, genloc__, indents(ind), "((", c.symbolName, " *)&self->impl)->", mn, " = ", castX ? "(" : "", castX ? ctX == unitClass ? cX.spec : cX.symbolName : "", castX && ptrX ? stars(ptrX, 0) : "", castX ? ")" : "", ptr ? "&" : "", "v", ptr ? "->" : "", addImpl ? "." : "", ptr || addImpl ? "impl" : "", ";") ] };
               else
               component.code = { [
                     PrintString(lc, ln, genloc__, indents(ind), "((", c.symbolName, " *)&self->impl)->", mn, " = ", cast ? "(" : "", cast ? cType.symbolName : "", cast ? ")" : "", ptr ? "&" : "", "v", ptr ? "->" : "", addImpl ? "." : "", ptr || addImpl ? "impl" : "", ";") ] };
            }
         }
         components.Add(component);
      }
      if(genGet)
      {
         String valDecl;
         bool vAmp = ct == structClass;
         if(bareStyle)
            valDecl = PrintString(tn, tnp2 ? tnp2 : "");
         else
            valDecl = PrintString("TIH<", tn, tnp2 ? tnp2 : "", ">"); // ', tnp2 ? tnp2 : ""' is probably an issue
         component = { macroPropGet, mn, CopyString(tn), tnp2 ? CopyString(tnp2) : null };
         if(!prototype)
         {
            // notes for possible get of array type member / property
            //if(ti.type.kind == arrayType)
            //   gd.concatx ("return self ? ", "(", tn, ")", "IPTR(self->impl, ", cn, ")->", mn, " : ", tz, ";");
            if(isProp && !different) // when different == true we access the data member directly instead of using the property?
            {
               if(addAmp)
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), tn, tnp2 ? tnp2 : "", " value;", cn, "_get_", mn, "(", needAmp ? "&" : "", "self->impl", ", ", vAmp ? "&" : "", "value", addImpl ? ".impl" : "", ");"),
                        PrintString(lc, ln, genloc__, indents(ind), "return value;") ] };
               else if(addImpl)
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), tn, tnp2 ? tnp2 : "", " value(", cn, "_get_", mn, "(", c.cl.type == structClass ? "&" : "", "self->impl)", nc ? "" : ", ", nc ? "" : c.cl.type == noHeadClass ? cpptemplatePrefix : "", nc ? "" : cn, nc ? "" : "::_class", ");"),
                        PrintString(lc, ln, genloc__, indents(ind), "return value;") ] };
               else
                  component.code = { [
                     // PrintString(lc, ln, genloc__, indents(ind), "return ", cn, "_get_", mn, "(self->impl);") ] };
                        PrintString(lc, ln, genloc__, indents(ind), "return ", cast ? "(" : "", cast ? tn : "", cast ? ")" : "", cn, "_get_", mn, "(", implStringThis, ");") ] };
            }
            else if(c.cl.type == normalClass)
            {
               if(addImpl)
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), tn, tnp2 ? tnp2 : "", " value(IPTR(self->impl, ", cn, ")->", mn, nc ? "" : ", ", nc ? "" : cn, nc ? "" : "::_class", ");"),
                  // Container value(((C(Iterator))self->impl).container, Iterator::_class); return value;
                  //  TIH<Container> value((C(Iterator))self->impl).container); return value;
                  // component.code = { [
                  //       PrintString("TIH<", tn, tnp2 ? tnp2 : "", "> value(IPTR(self->impl, ", cn, ")->", mn, ", ", cn, "::_class);"),
          //  gd.concatx("self ? ", tn, " value(IPTR(self->impl, ", cn, ")->", mn, ", ", cn, "::_class);", "return value;", " : ", tz, ";");
          // note: this is apparently missing a self check for when different == true ... but that seems broken...  ? : syntax spanning
          //       two lines of code...
                        PrintString(lc, ln, genloc__, indents(ind), "return value;") ] };
               else
               {
                  if(ctX == unitClass || ctX == bitClass)
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), "return self ? ", cnst ? tn : "", (castX || cnst) ? "(" : "", castX ? tn : "", castX ? ")" : "", "IPTR(self->impl, ", cn, ")->", mn, cnst ? ")" : "", " : ", tz, ";") ] };
                  else
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), "return self ? ", cnst ? tn : "", (cast || cnst) ? "(" : "", cast ? tn : "", cast ? ")" : "", "IPTR(self->impl, ", cn, ")->", mn, cnst ? ")" : "", " : ", tz, ";") ] };
               }
            }
            else if(c.cl.type == noHeadClass)
            {
               if(addImpl)
                  // component.code = { [
                  //       PrintString(tn, tnp2 ? tnp2 : "", " value(((", c.symbolName, " *)self->impl)->", mn, ", ", cn, "::_class);"),
                  // Container value(((C(Iterator))self->impl).container, Iterator::_class); return value;
                  //  TIH<Container> value((C(Iterator))self->impl).container); return value;
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), valDecl, " value(((", c.symbolName, " *)self->impl)->", mn, ");"),
                        PrintString(lc, ln, genloc__, indents(ind), "return value;") ] };
               else
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), "return self ? ((", c.symbolName, " *)self->impl)->", mn, " : ", tz, ";") ] };
            }
            else if(c.cl.type == bitClass)
            {
               component.code = { [
                     PrintString(lc, ln, genloc__, indents(ind), "return ", cast ? "(" : "", cast ? tn : "", cast ? ")" : "", c.upper, "_", mn, "(self->impl);") ] };
            }
            else
            {
               if(addImpl)
                  // component.code = { [
                  //       PrintString(tn, tnp2 ? tnp2 : "", " value(((", c.symbolName, ")self->impl).", mn, ", ", cn, "::_class);"),
                  // Container value(((C(Iterator))self->impl).container, Iterator::_class); return value;
                  //  TIH<Container> value((C(Iterator))self->impl).container); return value;
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), valDecl, " value(((", c.symbolName, " *)&self->impl)->", mn, ");"),
                        PrintString(lc, ln, genloc__, indents(ind), "return ", bareStyle ? "" : "*", "value;") ] };
               else
               {
                  if(ctX == unitClass || ctX == bitClass)
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), "return self ? ", cnst ? tn : "", (castX || cnst) ? "(" : "", castX ? tn : "", castX ? ")" : "", "((", c.symbolName, " *)&self->impl)->", mn, cnst ? ")" : "", " : ", ctX == unitClass ? "0" : tz, ";") ] };
                  else
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), "return self ? ", cnst ? tn : "", (cast || cnst) ? "(" : "", cast ? tn : "", cast ? ")" : "", "((", c.symbolName, " *)&self->impl)->", mn, cnst ? ")" : "", " : ", tz, ";") ] };
               }
            }
         }
         delete valDecl;
         components.Add(component);
         if(ct == unitClass)
         {
            component = { macroPropGet, mn, CopyString(cType.spec), null/*, commented = true*/ };
            if(!prototype)
            {
               component.code = { [
                     PrintString(lc, ln, genloc__, indents(ind), "return ", cType.cpp_name, "(self->", mn, ");") ] };
            }
            components.Add(component);
         }
      }
   }

   cppMacroProperty(g, o.z, g.expansionOrUse, opts, ti, prototype ? 1 : 0, components, mn, tn, cn, "sg", 0);

   delete tn;
   components.Free();
   delete components;
}

static bool hasTemplateClass(Class cl)
{
   if(cl.templateClass)
      return true;
   return false;
}

static bool hasOrBaseHasTemplateClass(Class cl)
{
   for(; cl; cl = cl.base)
      if(cl.templateClass)
         return true;
   return false;
}

static bool hasOrBaseHasTemplateAnything(Class cl)
{
   for(; cl; cl = cl.base)
      if(cl.templateClass || cl.templateArgs || cl.templateParams.first/* || cl.templatized*/)
         return true;
   return false;
}

static Type resolveDataType(Class cl, const char * dataTypeString)
{
   Type type;
   Context context = SetupTemplatesContext(cl); // TOCHECK: Should we do this only once while we process the whole class?
   type = ProcessTypeString(dataTypeString, false);
   FinishTemplatesContext(context);
   return type;
}

// TOCHECK: bare being false indicates to add the C() prefixing macro to refer to the C bindings type
//          Currently, as only normal classes are generated, and not class:struct classes,
//          the class:struct classes should have the C() types
char * cppTypeName(TypeInfo ti, bool bare, char ** typeZero, char ** typeNameSecondPart)
{
   char * result = null;
   char * secondPart;
   bool isString;
   bool isConst;
   // Class clRegRet;
   ClassType ct = cppGetClassInfoFromType(ti.type, true, null/*&clRegRet*/, null, null, &isString, &isConst);
   ZString z { allocType = heap };
   // BClass cRegRet = clRegRet;
   //cppTypeNameCall = true;
   // note: calling zTypeName creates templaton output objects with null z
   if(isString)
   {
      if(isConst)
         z.concatx("/*CT-D*/constString");
      else
         z.concat("char *");
   }
   else
      zTypeName(z, null, ti, { anonymous = true, bare = /*cRegRet && cRegRet.isBool ? true : */bare/**/, cpp = true/**/ }, null);
   //cppTypeNameCall = false;
   {
      //if(ct == normalClass) // || ct == noHeadClass)
      //   z.concat(" &");
   }
   if(typeNameSecondPart) *typeNameSecondPart = null;
   secondPart = strchr(z._string, '[');
   if(secondPart)
   {
      int len = secondPart - z._string;
      if(ti.typeString)
      {
         char * secondPart = strchr(ti.typeString, '[');
         if(secondPart)
         {
            int len = secondPart - (char*)ti.typeString; // weird: warning: incompatible expression secondPart - ti.typeString (char *); expected int
            if(typeNameSecondPart)
               *typeNameSecondPart = CopyString(secondPart);
            while(isspace(ti.typeString[len - 1]))
               len--;
            result = new char[len + 1];
            strncpy(result, ti.typeString, len);
            result[len] = '\0';
         }
      }
      if(typeNameSecondPart && *typeNameSecondPart == null)
         *typeNameSecondPart = CopyString(secondPart);
      if(!result)
      {
         while(isspace(z._string[len - 1]))
            len--;
         result = new char[len + 1];
         strncpy(result, z._string, len);
         result[len] = '\0';
      }
      if(!typeNameSecondPart)
         PrintLn("warning: cppTypeName called without typeNameSecondPart when needed.");
   }
   else
      result = CopyString(z._string);
   if(typeZero)
   {
      if(ti.type.kind == pointerType)
         *typeZero = CopyString("null");
      else if(ct == normalClass || ct == noHeadClass) // ?
         *typeZero = CopyString("0"/*"null"*/); // is 'null' desireable?
      else if(ct == structClass)
         *typeZero = PrintString("(const ", z._string, "){ 0 }");
      else if(ct == systemClass)
         *typeZero = CopyString("0");
      else if(ct == enumClass)
         *typeZero = PrintString("(", z._string, ")0"); // todo: false / true
      else if(ct == bitClass)
      {
         ZString z2 { allocType = heap };
         zTypeName(z2, null, ti, { anonymous = true, bare = bare }, null);
         *typeZero = PrintString(z._string, "((", z2._string, ")0)");
         delete z2;
      }
      else
         *typeZero = CopyString("0");
   }
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

char * cppTypeSpecToString(const char * ident, TypeInfo ti, OptBits opt, BVariant vTop)
{
   char * result;
   TypeNameList list { };
   astTypeName(ident, ti, opt, vTop, list);
   result = ec2PrintToString(list, false);
   list.Free();
   delete list;
   return result;
}

void cppTypeSpec(ZString z, const char * ident, TypeInfo ti, OptBits opt, BVariant vTop)
{
   TypeNameList list { };
   astTypeName(ident, ti, opt, vTop, list);
   ec2PrintToZedString(z, list, false);
   list.Free();
   delete list;
}

// todo: remove all use of cppGetClassInfoFromType, remove this function in favor of unwrapPtrTypeGetClassInfo
ClassType cppGetClassInfoFromType(Type type, bool hackTemplates, Class * clRegRet, BClass * cParamRet, bool * hackRet, bool * isString, bool * isConst)
{
   // TODO: Review all this...
   ClassType ct = systemClass;
   Class clReg = null;
   BClass cParam = null;
   bool hack = false;
   if(type.kind == classType && type._class)
   {
      Symbol _class = type._class;
      bool any = type.classObjectType == anyObject;
      const char * name = _class.string ? strptrNoNamespace(_class.string) : null;

      clReg = type._class.registered;

      if(!clReg && name && g_.lib.ecereCOM && tmpcppececeremessclass.Find(name))
         clReg = getEcEcereMessBaseClass(name);

      if(hackTemplates)
      {
         if(clReg && clReg.templateClass)
            clReg = clReg.templateClass; // Resolve to non-parameterized template class for now...
      }

      if(clReg) ct = clReg.type;

      hack = g_.lib.ecereCOM && (ct == normalClass || ct == noHeadClass) &&
            tmpcppececeremessclass.Find(name ? name : strptrNoNamespace(type._class.registered.name));
      cParam = (ct != systemClass || any) ?
            clReg && !any && !hack ? clReg : eSystem_FindClass(g_.mod, "Instance") : null;
      if(!cParam && ct == bitClass)
         Print("");
   }
   if(clRegRet) *clRegRet = clReg;
   if(cParamRet) *cParamRet = cParam;
   if(hackRet) *hackRet = hack;
   if(isString) *isString = cParam ? cParam.isString : false;
   if(isConst) *isConst = /*isString && *isString && */type.specConst/* ? true : false*/;
   return ct;
}

Type unwrapPtrTypeGetClassInfo(Type type, bool hackTemplates, Class * clRegRet, BClass * cParamRet, int * ptr, bool * hackRet, bool * isString, bool * isConst)
{
   // todo: assert(*ptr == 0);
   // TODO: Review all this...
   Type t = unwrapPtrType(type, ptr);
   ClassType ct = systemClass;
   Class clReg = null;
   BClass cParam = null;
   bool hack = false;
   if(t.kind == classType && t._class)
   {
      Symbol _class = t._class;
      bool any = t.classObjectType == anyObject;
      const char * name = _class.string ? strptrNoNamespace(_class.string) : null;

      clReg = t._class.registered;

      if(!clReg && name && g_.lib.ecereCOM && tmpcppececeremessclass.Find(name))
         clReg = getEcEcereMessBaseClass(name);

      if(hackTemplates)
      {
         if(clReg && clReg.templateClass)
            clReg = clReg.templateClass; // Resolve to non-parameterized template class for now...
      }

      if(clReg) ct = clReg.type;

      hack = g_.lib.ecereCOM && (ct == normalClass || ct == noHeadClass) &&
            tmpcppececeremessclass.Find(name ? name : strptrNoNamespace(t._class.registered.name));
      cParam = (ct != systemClass || any) ?
            clReg && !any && !hack ? clReg : eSystem_FindClass(g_.mod, "Instance") : null;
      if(!cParam && ct == bitClass)
         Print("");
   }
   if(clRegRet) *clRegRet = clReg;
   if(cParamRet) *cParamRet = cParam;
   if(hackRet) *hackRet = hack;
   if(isString) *isString = cParam ? cParam.isString : false;
   if(isConst) *isConst = /*isString && *isString && */t.specConst/* ? true : false*/;
   return t;
}

enum CPPParamsOutputMode
{
   regMethodParamList,
   regMethodCppParamList,
   regMethodCppParamList2,
   regMethodArgsPassingEcToCpp,
   regMethodArgsPassingCppToEc,
   regMethodArgsPassing2,
   regMethodArgsPassing3,
   regMethodLocalConvEcToCppVarsForArgsPassing,
   regMethodArgsPoorObjectPassing2,
   regMethodArgsPoorObjectPassing3,
   _argParamList,
   _argSpecialThisParamList,
   passing;

   property char
   {
      get
      {
         switch(this)
         {
            case regMethodParamList:                           return 'a';
            case regMethodCppParamList:                        return 'b';
            case regMethodCppParamList2:                       return 'c';
            case regMethodArgsPassingEcToCpp:                  return 'd';
            case regMethodArgsPassingCppToEc:                  return 'm';
            case regMethodArgsPassing2:                        return 'e';
            case regMethodArgsPassing3:                        return 'f';
            case regMethodLocalConvEcToCppVarsForArgsPassing:  return 'g';
            case regMethodArgsPoorObjectPassing2:              return 'h';
            case regMethodArgsPoorObjectPassing3:              return 'i';
            case _argParamList:                                return 'j';
            case _argSpecialThisParamList:                     return 'k';
            case passing:                                      return 'l';
         }
         return '0';
      }
   }
};

struct ParamsOptions
{
   bool forMethodCallers; // todo
   bool cppDirectObjects;
   const String utilStr1;
};

char * cppParams(BClass c, TypeInfo ti, CPPParamsOutputMode mode, BVariant vClass, const char * cn,
      bool addthisarg, bool comma, MacroMode macro, const char ** first, const char ** nameParamOfClassType, bool * hasStructClassParam, bool * hasVarArgs, ParamsOptions opts)
{
   char x = mode;
   // char m = macro;
   char * result;
   ZString z { allocType = heap };
   Type t = ti.type;
   bool noParams = t.params.count == 0 || (t.params.count == 1 && ((Type)t.params.first).kind == voidType);
   if(x); // get rid of warning
   if(noParams && !addthisarg)
   {
      /*if(mode == _argParamList)
         z.concat("void");*/
   }
   else
   {
      Type param;
      Type firstParam = null;
      Type nextParam = null;
      const char * sep = "";
      uint ap;

      if(addthisarg)
      {
         // if(mode == regMethodParamList)
         {
            if(t.classObjectType == typedObject && (mode == regMethodParamList || mode == regMethodCppParamList))
            {
               z.concatx("XClass * _class");
               if(!sep[0]) sep = ", ";
            }
            if(!t.staticMethod)
            {
               if(t.thisClass && t.thisClass.string)
               {
                  if(!strcmp(t.thisClass.string, "class"))
                     firstParam = ProcessTypeString("any_object", false);
                  else
                     firstParam = ProcessTypeString(t.thisClass.string, false);
               }
               else
               {
                  // if(c.isApplication)
                  //    firstParam = ProcessTypeString("Instance", false);
                  // else
                     firstParam = ProcessTypeString(cn, false);
               }
            }
         }
      }

            // todo: handle typed object
            if(((mode == regMethodParamList || mode == regMethodCppParamList || mode == regMethodArgsPassingEcToCpp || mode == regMethodArgsPassingCppToEc ||
                  mode == regMethodArgsPassing2 || mode == regMethodArgsPassing3 || mode == regMethodLocalConvEcToCppVarsForArgsPassing ||
                  mode == regMethodArgsPoorObjectPassing2 || mode == regMethodArgsPoorObjectPassing3) &&
                  comma == true) || mode == passing) sep = ", ";
            ap = 0;
            for(param = firstParam ? firstParam : t.params.first; param; param = nextParam)
            {
               if(param.kind != voidType)
               {
                  char * apname = null;
                  MapIterator<consttstr, const String> i { map = methodParamNameSwap };
                  const char * name = i.Index({ ti.m.mname, param.name }, false) ? i.data : param.name;
                  Class clReg = null;
                  BClass cParam = null;
                  bool hack;
                  // bool notSelf = !firstParam || param != firstParam;
                  bool isString;
                  bool isConst;
                  bool prmIsFn = param.kind == functionType || (param.kind == pointerType && param.type.kind == functionType);
                  int ptr = 0;
                  Type type = unwrapPtrTypeGetClassInfo(param, true, &clReg, &cParam, &ptr, &hack, &isString, &isConst);
                  bool boolPtr = ptr && cParam && cParam.isBool;
                  ClassType ct = clReg ? clReg.type : systemClass;
                  // ClassType ct = cppGetClassInfoFromType(param, true, &clReg, &cParam, &hack, &isString, &isConst);
                  char * typeString = null;
                  char * paramString = null;
                  if(hasVarArgs && param.kind == ellipsisType)
                     *hasVarArgs = true;
                  if(!name) apname = firstParam ? CopyString(opts.utilStr1 ? opts.utilStr1 : "o_") : PrintString("ap", ++ap), name = apname;
                  z.concatx(sep);
                  if(hasStructClassParam && param != firstParam && param.kind == classType && ct == structClass)
                     *hasStructClassParam = true;

                  switch(mode)
                  {
                     case regMethodParamList:
                     case regMethodCppParamList:
                     case regMethodCppParamList2:
                     case regMethodArgsPassingEcToCpp:
                     case regMethodArgsPassingCppToEc:
                     case regMethodArgsPassing2: // tocheck: is this also same and rename?
                     case regMethodArgsPassing3:
                     case _argParamList:
                     // case _argSpecialThisParamList:
                     {
                        //const char * typeString = param.kind == classType && param.classObjectType == anyObject ? g.sym.instance : tokenTypeString(param);
                        bool passing = mode == regMethodArgsPassingEcToCpp || mode == regMethodArgsPassingCppToEc ||
                              mode == regMethodArgsPassing2 || mode == regMethodArgsPassing3;
                        bool cpp = mode == regMethodCppParamList || mode == regMethodCppParamList2 ||
                              mode == regMethodArgsPassing2 || mode == regMethodArgsPassing3;
                        // bool v2 = mode == regMethodCppParamList2 || mode == regMethodArgsPassing3;
                        if(type.kind == templateType)
                           typeString = PrintString("TP(", c.name, ", ", type.templateParameter.identifier.string, ")");
                        else if(type.kind == classType && type.classObjectType == anyObject)
                        {
                           if(c.isInstance)
                              typeString = CopyString(g_.sym.instance);
                           else
                              typeString = printType(type, false, false, true);
                        }
                        else if(type.kind == classType && type._class && type._class.registered && type._class.registered.templateClass)
                        {
                           if(cpp && (ct == bitClass || ct == noHeadClass || (ct == normalClass && !isString) || ct == structClass || ct == unitClass))
                              typeString = CopyString(cParam.cpp_name);
                           else
                              typeString = CopyString(cParam.symbolName);
                        }
                        else if(prmIsFn)
                           paramString = cppTypeSpecToString(param.name, { type = param }, { param = true/* todo: set macroCommas when used in virtual method macro? */ }, null);
                        else if(cParam && type.kind == classType && cParam.isString)
                        {
                           if(!passing && mode != _argParamList)
                           {
                              bool bare = (ct == bitClass || ct == enumClass || (ct == normalClass && !isString));
                              cppTypeSpec(z, "ident___", { type = param, cl = ti.cl }, { anonymous = true, bare = bare, cpp = true }, ti.cl);
                           }
                        }
                        else if(type.kind == subClassType)
                           typeString = PrintString(g_.sym.__class, " *");
                        else if(!cParam && type.kind == classType && type.classObjectType == typedObject)
                           ;
                        else if(ptr && cParam && cParam.isBool)
                           typeString = PrintString(cParam.symbolName/*, " ", stars(ptr, 0)*/);
                        else
                        {
                           // tocheck: unitClass is missing here compared to the dependency thing next
                           bool override = cpp &&
                                 ((ct == bitClass && !passing) || (ct == enumClass && !passing) || ct == noHeadClass ||
                                 (ct == normalClass && !isString) || (ct == structClass && !passing) || (ct == unitClass && !passing)); // (!v2 || passing)
                           if(override) normalClassMacroOverride = true;
                           typeString = printType(type, false, false, true);
                           if(override) normalClassMacroOverride = false;
                        }
                        break;
                     }
                  }

                  switch(mode)
                  {
                     case regMethodParamList:
                     case regMethodCppParamList:
                     case regMethodCppParamList2:
                     {
                        //const char * name = iMetParNamSwp.Index({ ti.m.mname, param.name }, false) ? iMetParNamSwp.data : param.name;
                        bool cpp = mode == regMethodCppParamList || mode == regMethodCppParamList2;
                        bool v2 = mode == regMethodCppParamList2;

                        // if(notSelf && param.kind == classType && !(cParam && cParam.isString) &&
                        //       (ct == normalClass || (cpp && ct == noHeadClass)) && cpp)
                        //    z.concatx("const ");

                        // ct == structClass param doesn't require a dependency here since it's always a reference
                        // if(cpp && !ptr && ((ct == normalClass && !isString)/* || ct == noHeadClass || ct == bitClass || ct == enumClass || ct == unitClass*/) &&
                        //       !cParam.isBool && !(vClass.kind == vclass && cParam == vClass.c))
                        //    vClass.processDependency(g_, otypedef, otypedef, cParam.cl);

                        if(first && !firstParam && !*first) *first = name;
                        if(nameParamOfClassType && !firstParam && !*nameParamOfClassType &&
                              clReg && !strcmp(clReg.name, ti.cl.name))
                           *nameParamOfClassType = name;
                        if(param.kind == vaListType) debugBreakpoint();
                        if(typeString)
                           z.concatx(genidx(1A, x), strptrNoNamespace(typeString), !ptr ? "" : " ", !ptr ? "" : stars(ptr, 0));
                        else if(param.kind == classType && param.classObjectType == typedObject)
                           z.concatx(genidx(1B, x), "typed_object_class_ptr class_", name, ", void * ", name);
                        if((param.kind == classType && ((ct == noHeadClass && !cpp) || (ct == structClass && (!cpp || v2)))) ||
                           (firstParam && t.classObjectType == typedObject && t.byReference))
                           z.concatx(" *");
                        else if(param.kind == classType &&
                              ((ct == normalClass && !isString)/* || (cpp && ct == noHeadClass)*/ || (cpp && !v2 && ct == structClass)) && (cpp || (cParam && cParam.isString)))
                           z.concatx(" &");
                        if(prmIsFn)
                           z.concatx(paramString);
                        else if(param.kind == ellipsisType || (param.kind == classType && param.classObjectType == typedObject))
                           ;
                        else
                           z.concatx(" ", name);
                        delete typeString;
                        if(!sep[0]) sep = ", ";
                        break;
                     }
                     case regMethodLocalConvEcToCppVarsForArgsPassing:
                     case regMethodArgsPoorObjectPassing2: // tocheck: is this also same and rename?
                     case regMethodArgsPoorObjectPassing3:
                     {
                        bool forMethodCallers = mode == regMethodArgsPoorObjectPassing2 || mode == regMethodArgsPoorObjectPassing3;
                        if(c.isInstance && param.kind == classType && param.classObjectType == anyObject)
                           z.concatx(genidx(2A, x), "TIH<", c.name, "> ", name, "_l(", name, "); ");
                        else if((ct == normalClass && !isString) && !forMethodCallers)
                           z.concatx(genidx(2B, x), "TIH<", cParam.name, "> ", name, "_l(", name, "); ");
                        else if(mode == regMethodLocalConvEcToCppVarsForArgsPassing && ct == noHeadClass && !ptr)
                        {
                           // if(clReg && mode == regMethodLocalConvEcToCppVarsForArgsPassing)
                           //    vClass.processDependency(g_, otypedef, otypedef, clReg);
                           z.concatx(genidx(2C, x), cParam.name, " ", name, "_l(", name, "); ");
                        }
                        break;
                     }
                     case regMethodArgsPassingEcToCpp:
                     {
                        bool inReg = opts.cppDirectObjects;
                        if(c.isInstance && type.kind == classType && type.classObjectType == anyObject)
                           z.concatx(genidx(3A, x), "*", name, "_l");
                        else if(!inReg && ct == normalClass && !isString)
                           z.concatx(genidx(3B, x), "*", name, "_l");
                        else if(!inReg && ct == noHeadClass)
                           z.concatx(genidx(3C, x), name, "_l");
                        else if(!inReg && boolPtr)
                           z.concatx(genidx(3F, x), name);
                        // else if(ct == enumClass)
                        //    z.concatx("(", cParam.name, ")", name);
                        else if(ct == bitClass || ct == enumClass || (ct == structClass && ptr) || (ct == unitClass && !cParam.isUnichar))
                           z.concatx(genidx(3H, x), "(", cParam.name, ptr ? " " : "", ptr ? stars(ptr, 0): "", ")", name);
                        else if(ct == structClass)
                           z.concatx(genidx(3I, x), "*(", cParam.cpp_name, " *)", name);
                        else if(param.kind == classType && param.classObjectType == typedObject)
                           z.concatx(genidx(3J, x), "class_", name, ", ", name);
                        else
                           z.concatx(genidx(3K, x), name);
                        if(!sep[0]) sep = ", ";
                        break;
                     }
                     case regMethodArgsPassingCppToEc:
                     {
                        bool inReg = opts.cppDirectObjects;
                        if(c.isInstance && type.kind == classType && type.classObjectType == anyObject)
                           z.concatx(genidx(4A, x), "*", name, "_l");
                        else if(!inReg && ct == normalClass && !isString)
                           z.concatx(genidx(4B, x), "*", name, "_l");
                        else if(!inReg && ct == noHeadClass)
                           z.concatx(genidx(4C, x), name, "_l");
                        else if(!inReg && boolPtr)
                           z.concatx(genidx(4F, x), name);
                        // else if(ct == enumClass)
                        //    z.concatx("(", cParam.name, ")", name);
                        else if(ct == bitClass || ct == enumClass || (ct == structClass && ptr) || (ct == unitClass && !cParam.isUnichar))
                           z.concatx(genidx(4H, x), "(", ptr && cParam.isBool ? cParam.symbolName : cParam.name, ptr ? " " : "", ptr ? stars(ptr, 0): "", ")", name);
                        else
                           z.concatx(genidx(4I, x), name);
                        if(!sep[0]) sep = ", ";
                        break;
                     }
                     case regMethodArgsPassing2: // tocheck: is this also same and rename?
                     case regMethodArgsPassing3:
                     {
                        // int ptr2 = 0;
                        bool v2 = mode == regMethodArgsPassing3;
                        if(param.kind == ellipsisType)
                           z.concatx(genidx(5A, x), "args");
                        else if(c.isInstance && type.kind == classType && type.classObjectType == anyObject)
                           z.concatx(genidx(5B, x), "*", name, "_l");
                        else if(!opts.cppDirectObjects && ((ct == normalClass && !isString) || ct == noHeadClass || (ct == structClass && !ptr)))
                        {
                           if((v2 && ct == structClass) || (ptr && ct == noHeadClass))
                              z.concatx(genidx(5C, x), "(", cParam.symbolName, " *)", name);
                           else
                              z.concatx(genidx(5D, x), ct == structClass ? "&" : "", name, ".impl");
                        }
                        // else if(ct == enumClass)
                        //    z.concatx("(", cParam.symbolName, ")", name);
                        else if(ct == bitClass || ct == enumClass || (ct == structClass && ptr) || (ct == unitClass && !cParam.isUnichar))
                        {
                           bool impl = !ptr && ct != enumClass;
                           z.concatx(genidx(5E, x), "(", strptrNoNamespace(typeString), ptr ? " " : "", ptr ? stars(ptr, 0): "", ")", name, impl ? ".impl" : "");
                        }
                        else if(param.kind == classType && param.classObjectType == typedObject)
                           z.concatx(genidx(5F, x), "class_", name, ", ", name);
                        else
                           z.concatx(genidx(5G, x), name);
                        if(!sep[0]) sep = ", ";
                        break;
                     }
                     case _argParamList:
                     case _argSpecialThisParamList:
                     {
                        bool bare = (ct == bitClass || ct == enumClass || (ct == normalClass && !isString)/* || ct == noHeadClass*/);
                        // bool bare = (ct == bitClass || ct == enumClass/* || ct == normalClass*/);
                        if(prmIsFn)
                           ;
                        else if(hack)
                        {
                           z.concatx(genidx(6A, x), cParam.name, " /*");
                           cppTypeSpec(z, "ident___", { type = param, cl = ti.cl }, { anonymous = true, bare = bare, cpp = true }, ti.cl);
                           z.concatx("*/");

                           if((ct == normalClass && !isString) || ct == noHeadClass)
                              z.concatx(" &");
                        }
                        else if(c.isInstance && param.kind == classType && param.classObjectType == anyObject)
                           z.concatx(genidx(6B, x), cn, " &");
                        else if(ptr && cParam && cParam.isBool)
                        {
                           z.concatx(genidx(6C, x), cParam.symbolName);
                           // cppTypeSpec(z, "ident___", { type = param, cl = ti.cl }, { anonymous = true }, ti.cl);
                           z.concatx(" ", stars(ptr, 0));
                        }
                        else if(param.kind == classType && param.classObjectType == typedObject)
                           z.concatx(genidx(6D, x), "typed_object_class_ptr class_", name, !macro ? " ," : " _ARG", " void * ");
                        else
                        {
                           z.concatx(genidx(6E, x));
                           cppTypeSpec(z, "ident___", { type = param, cl = ti.cl }, { anonymous = true, bare = bare, cpp = true }, ti.cl);
                           if(param.kind == classType)
                           {
                              if((ct == normalClass && !isString)/* || ct == noHeadClass*/ || ct == structClass)
                                 z.concat(" &");
                              else if(ct == structClass && mode != _argParamList)
                                 z.concat(" *");
                           }
                        }

                        //if(!name[0])
                        //   conmsg("noname");
                        if(prmIsFn)
                           z.concatx(paramString);
                        else
                           z.concatx(" ", name);
                        if(mode == _argSpecialThisParamList && !noParams)
                           z.concatx(!macro ? " ," : " _ARG");
                        break;
                     }
                     case passing:
                     {
                        int ptr2 = ptr ? ptr : ct == structClass ? 1 : 0;
                        bool cast = ct == bitClass || (ct == enumClass && !boolPtr) || (ct == structClass && ptr)/* || (ct == unitClass && ptr)*/;
                        bool addr = (ct == structClass && !ptr) || (ct == unitClass && ptr);
                        bool impl = hack || (c.isInstance && param.kind == classType && param.classObjectType == anyObject) ||
                              ct == noHeadClass || (ct == normalClass && !isString) || (ct == structClass && !ptr) || (ct == unitClass/* && !ptr*/ && !cParam.isUnichar);
                        z.concatx(genidx(7A, x));
                        // if(boolPtr) // see above: issue: bool-trouble
                        //    z.concatx("(C(bool)", ptr ? " " : "", stars(ptr, 0), ")");
                        if(param.kind == classType && param.classObjectType == typedObject)
                           z.concatx("class_", name, ", ");
                        else
                        {
                           if(addr)
                              z.concatx("&");
                           if(cast)
                              z.concatx(ct == unitClass ? "/*CTUC-x*/" : "", "(", cParam.symbolName, ptr2 ? " " : "", ptr2 ? stars(ptr2, 0) : "", ")");
                        }
                        z.concatx(name);
                        if(impl)
                           z.concatx(ptr ? "->" : ".", "impl");
                        break;
                     }
                  }
                  if(!sep[0] && mode == _argParamList) sep = !macro ? ", " : " _ARG ";
                  delete apname;
                  delete typeString;
                  delete paramString;
               }
               if(firstParam)
               {
                  FreeType(firstParam);
                  firstParam = null;
                  nextParam = t.params.first;
                  if(mode == _argSpecialThisParamList)
                     break;
               }
               else
                  nextParam = param.next;
            }
   }
   result = CopyString(z._string ? z._string : "");
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
            // if(o.kind != vfunction)
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

static void outputSplitContents(CPPGen g, File f)
{
   ZString z { allocType = heap };
   bigCommentLibrary(z, "split implementations");
   f.Puts(z._string);
   delete z;

   for(nn : g.bmod.orderedNamespaces)
   {
      BNamespace n = nn;

      ZString z { allocType = heap };
      bigCommentSection(z, n.name && n.name[0] ? n.name : "no namespace name?");
      f.Puts(z._string);
      delete z;

      for(vv : n.splitContents)
      {
         BVariant v = vv;
         if(v.kind == vclass)
         {
            BClass c = v;
            f.Puts(c.outSplit.z._string);
         }
         else if(v.kind == vfunction)
            ;
         else
            locprintxln("error: unexpected kind (", v.kind, ") of splitContents");
      }
   }

   for(nn : g.bmod.orderedNamespaces)
   {
      BNamespace n = nn;

      for(vv : n.splitContents)
      {
         BVariant v = vv;
         if(v.kind == vfunction)
         {
            BFunction x = v;
            f.Puts(x.out.z._string);
         }
      }
   }
}

static void outputImplementationsContents(CPPGen g, File f)
{
   ZString z { allocType = heap };
   bigCommentLibrary(z, "moved to cpp implementations");
   f.Puts(z._string);
   delete z;

   for(nn : g.bmod.orderedNamespaces)
   {
      BNamespace n = nn;

      ZString z { allocType = heap };
      bigCommentSection(z, n.name && n.name[0] ? n.name : "no namespace name?");
      f.Puts(z._string);
      delete z;

      for(vv : n.implementationsContents)
      {
         BVariant v = vv;
         if(v.kind == vclass)
         {
            BClass c = v;
            if(c.outImplementation.z._string)
               f.Puts(c.outImplementation.z._string);
            // else
            //    locprintxln("why is this c.outImplementation.z._string null for this v(", v.kind, ":", v.name, ")");
         }
         else
            locprintxln("error: unexpected kind (", v.kind, ") of implementationsContents");
      }
   }
}

static void cppHeaderStart(CPPGen g, File f)
{
   //cInHeaderFileComment(g);
   //cInHeaderProcessSourceFile(g, null, ":src/C/c_header_open.src"); //cInHeaderPreprocessorOpen(g);
   //cInHeaderIncludes(g);

   f.PrintLn(genspc__, "// Preprocessor directives can be added at the beginning (Can't store them in AST)", ln);

   f.PrintLn(genspc__, "/****************************************************************************");
   f.PrintLn(genspc__, "===========================================================================");
   if(g.lib.ecereCOM)
      f.PrintLn(genspc__, "   Core eC Library");
   else
     f.PrintLn(genspc__, "   ", g.lib.moduleName, " Module");
   f.PrintLn(genspc__, "===========================================================================");
   f.PrintLn(genspc__, "****************************************************************************/");
   f.PrintLn(genloc__, "#if !defined(__", g.lib.defineName, "_HPP__)");
   f.PrintLn(genloc__, "#define __", g.lib.defineName, "_HPP__", ln);

   if(g.lib.ecereCOM)
      f.PrintLn(genloc__, "#define ECPRFX eC_", ln);
   else
   {
      // f.PrintLn(genloc__, "#include \"eC.hpp\"");
      for(libDep : g.libDeps)
         f.PrintLn(genloc__, "#include \"", libDep.bindingName, ".hpp\"");
      /*if(!strcmp(g.lib.moduleName, "gnosis2")) // hack, todo
      {
         f.PrintLn(genloc__, "#include \"ecere.hpp\"");
         f.PrintLn(genloc__, "#include \"EDA.hpp\"");
      }*/
      /*else
         f.PrintLn("#include \"ecere.hpp\"");*/
   }
   f.PrintLn(genloc__, "#include \"", g.lib.bindingName, ".h\"", ln);
}

static void cppHeaderEnd(CPPGen g, File f)
{
   f.PrintLn(genloc__, "#endif // !defined(__", g.lib.defineName, "_HPP__)");
}

// a table of macros
//
// hardcoded macros:
//
// INSTANCEL
// INSTANCE
// newi
// EVOLVE_APP
// REGISTER_APP_CLASS
// APP_CONSTRUCT
// MAIN_DEFINITION
// SELF
// APP_SET_ARGS

// _REGISTER_CLASS            intRegisterClass     cppMacroIntRegisterClass
// REGISTER_CLASS_DEF         registerClassDef     cppMacroRegisterClassDef
// CLASS_DEF                  classDef             cppMacroClassDef
// REGISTER_CLASS             registerClass        cppMacroRegisterClass
// REGISTER_CPP_CLASS         registerClassCPP     cppMacroRegisterClassCPP
// _CONSTRUCT                 intConstructClass    cppMacroIntConstructClass
// CONSTRUCT                  constructClass       cppMacroConstructClass
// DESTRUCT                   destructClass        cppMacroDestructClass
// REGISTER                   classRegistration    cppMacroClassRegister
// VIRTUAL_METHOD             virtualMethod        cppMacroVirtualMethod
// _REGISTER_METHOD           intRegisterMethod    cppMacroIntRegisterMethod
// REGISTER_METHOD            registerMethod       cppMacroRegisterMethod
// REGISTER_TYPED_METHOD      registerTypedMethod  cppMacroRegisterTypedMethod
// propertyProto              propety              cppMacroProperty
// propertyImpl               "                    "
// _setProto                  intPropSet           cppMacroIntPropSet
// setProto                   propSet              cppMacroPropSet
// setImpl                    "                    "
// getProto                   propGet              cppMacroPropGet
// getImpl                    "                    "
// *_class_registration       classRegistration    cppMacroClassRegistration
// *_VIRTUAL_METHODS          classVirtualMethods  cppMacroClassVirtualMethods



// NOTE: 'expansion' is a mode for bgen to itself expansion the macros
enum MacroMode
{
   configuration,
   expansion,
   use,
   encapsulation,
   definition;

   property char
   {
      get
      {
         switch(this)
         {
            case configuration:  return 'c';
            case expansion:      return 'x';
            case use:            return 'u';
            case encapsulation:  return 'e';
            case definition:     return 'd';
         }
         return '_';
      }
   }
};

enum MacroModeAll { use, expansion = 0xFFFFFFFF };
/*
class MacroModeBits
{
   // warning: these can only store use or expansion
   MacroMode intRegisterClass:1;
   MacroMode registerClassDef:1;
   MacroMode classDef:1;
   MacroMode registerClass:1;
   MacroMode registerClassCPP:1;
   MacroMode intConstructClass:1;
   MacroMode constructClass:1;
   MacroMode destructClass:1;
   MacroMode classRegistration:1;
   MacroMode classVirtualMethods:1;
   MacroMode virtualMethod:1;
   MacroMode intRegisterMethod:1;
   MacroMode registerMethod:1;
   MacroMode registerTypedMethod:1;
   MacroMode propety:1;
   MacroMode intPropSet:1;
   MacroMode propSet:1;
   MacroMode propGet:1;

   MacroModeAll all:32:0;
}
*/
class MacroModeBits
{
   bool intRegisterClass:1;
   bool registerClassDef:1;
   bool classDef:1;
   bool registerClass:1;
   bool registerClassCPP:1;
   bool intConstructClass:1;
   bool constructClass:1;
   bool destructClass:1;
   bool classRegistration:1;
   bool classVirtualMethods:1;
   bool virtualMethod:1;
   bool intRegisterMethod:1;
   bool registerMethod:1;
   bool registerTypedMethod:1;
   bool propety:1;
   bool intPropSet:1;
   bool propSet:1;
   bool propGet:1;

   MacroModeAll all:32:0;
   //property MacroMode all { set { this = value ? 0xFFFFFFFF : 0x0;  } };
   //property bool { set { all = value ? expansion : use; } };
};

/*static */void cppDefineMacroIntRegisterClass(
      CPPGen g,            // generator
      ZString o,           // output
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroIntRegisterClass(g, o, definition, ind,
         "n",
         "ns",
         "bs",
         "a",
         0); }

static void cppMacroIntRegisterClass(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      uint ind,            // indentation
      const char * n,      // n? class name
      const char * ns,     // ns? class name string
      const char * bs,     // bs? base class name string
      const char * module, // a? module arg
      void * unused)
{
   MacroMode smod = /*mode == configuration ? g.macroModeBits.propSet ? expansion : use : */mode; // selected mode
   const char * lc = smod == definition ? " \\" : "";    // lc: line continuation
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define _REGISTER_CLASS(", n, ", ", ns, ", ", bs, ", ", module, ")", lc, ln);
         ind++;
      case expansion:
/*
public dllexport Class eSystem_RegisterClass(ClassType type, const char * name, const char * baseName, int size, int sizeClass,
                             bool (* Constructor)(void *), void (* Destructor)(void *),
                             Module module, AccessMode declMode, AccessMode inheritanceAccess)
*/
         o.concatx(genloc__, indents(ind), "(XClass *)eC_registerClass(", lc, ln,
               genloc__, indents(ind + 2), "ClassType_normalClass,", lc, ln,
               genloc__, indents(ind + 2), ns, ", ", bs, ",", lc, ln,
               genloc__, indents(ind + 2), "sizeof(Instance *), 0,", lc, ln);
         o.concatx(
               genloc__, indents(ind + 2), "(C(bool) (*)(void *)) ", n, "::constructor,", lc, ln,
               genloc__, indents(ind + 2), "(void(*)(void *)) ", n, "::destructor,", lc, ln,
               genloc__, indents(ind + 2), "(", module, ").impl,", lc, ln,
               genloc__, indents(ind + 2), "AccessMode_privateAccess, AccessMode_publicAccess)");
         break;
      case use:
      case encapsulation:
         o.concatx(genloc__, indents(ind), "_REGISTER_CLASS(",
               n,       ", ",
               ns,      ", ",
               bs,      ", ",
               module,  ")");
         break;
   }
}

/*static */void cppDefineMacroRegisterClassDef(
      CPPGen g,            // generator
      ZString o,           // output
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroRegisterClassDef(g, o, definition, ind,
         "n",
         "b",
         "a",
         0); }

static void cppMacroRegisterClassDef(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      uint ind,            // indentation
      const char * n,      // n?
      const char * b,      // b?
      const char * a,      // a?
      void * unused)
{
   MacroMode smod = /*mode == configuration ? g.macroModeBits.propSet ? expansion : use : */mode; // selected mode
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "// For defining _class and registereing together (single translation unit)", ln);
         o.concatx(genloc__, indents(ind), "#define REGISTER_CLASS_DEF(", n, ", ", b, ", ", a, ") ");
         ind++;
      case expansion:
            o.concatx(indents(ind), "TCPPClass<", n, "> ", n, "::_class(_REGISTER_CLASS(", n, ",     #n, ", b, "::_class.impl->name, ", a, "));", ln);
         break;
      case use:
      case encapsulation:
         o.concatx(genloc__, indents(ind), "REGISTER_CLASS_DEF(",
               n,    ", ",
               b,    ", ",
               a,    ")");
         break;
   }
}

/*static */void cppDefineMacroClassDef(
      CPPGen g,            // generator
      ZString o,           // output
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroClassDef(g, o, definition, ind,
         "n",
         0); }

static void cppMacroClassDef(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      uint ind,            // indentation
      const char * n,      // n?
      void * unused)
{
   MacroMode smod = /*mode == configuration ? g.macroModeBits.propSet ? expansion : use : */mode; // selected mode
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "// For defining _class and registering separately (multiple translation units)", ln);
         o.concatx(genloc__, indents(ind), "#define CLASS_DEF(", n, ")                ");
         ind++;
      case expansion:
            o.concatx(indents(ind), "TCPPClass<", n, "> ", n, "::_class;", ln);
         break;
      case use:
      case encapsulation:
         o.concatx(genloc__, indents(ind), "CLASS_DEF(",
               n,    ")");
         break;
   }
}

/*static */void cppDefineMacroRegisterClass(
      CPPGen g,            // generator
      ZString o,           // output
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroRegisterClass(g, o, definition, ind,
         "n",
         "b",
         "a",
         0); }

static void cppMacroRegisterClass(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      uint ind,            // indentation
      const char * n,      // n?
      const char * b,      // b?
      const char * a,      // a?
      void * unused)
{
   MacroMode smod = /*mode == configuration ? g.macroModeBits.propSet ? expansion : use : */mode; // selected mode
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define REGISTER_CLASS(", n, ", ", b, ", ", a, ")     ");
         ind++;
      case expansion:
            o.concatx(indents(ind), n, "::_class.setup(_REGISTER_CLASS(", n, ",       #n, ", b, "::_class.impl->name, ", a, "));", ln);
         break;
      case use:
      case encapsulation:
         o.concatx(genloc__, indents(ind), "REGISTER_CLASS(",
               n,    ", ",
               b,    ", ",
               a,    ")");
         break;
   }
}

/*static */void cppDefineMacroRegisterClassCPP(
      CPPGen g,            // generator
      ZString o,           // output
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroRegisterClassCPP(g, o, definition, ind,
         "n",
         "a",
         0); }

static void cppToFileMacroRegisterClassCPP(
      CPPGen g,            // generator
      File f,              // output
      MacroMode mode,
      uint ind,            // indentation
      const char * n,      // class name
      const char * a,      // a? we use the module parameter of *_cpp_init(const Module & module)
      void * unused)
{
   ZString z { allocType = heap };
   cppMacroRegisterClassCPP(g, z, mode, ind, n, a, 0);
   f.Puts(z._string);
   delete z;
}

static void cppMacroRegisterClassCPP(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      uint ind,            // indentation
      const char * n,      // class name
      const char * a,      // a? we use the module parameter of *_cpp_init(const Module & module)
      void * unused)
{
   MacroMode smod = /*mode == configuration ? g.macroModeBits.propSet ? expansion : use : */mode; // selected mode
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "// For C++ classes proxying eC classes:", ln);
         o.concatx(genloc__, indents(ind), "#define REGISTER_CPP_CLASS(", n, ", ", a, ")    ");
         ind++;
            o.concatx(indents(ind), n, "::_class.setup(_REGISTER_CLASS(", n, ", \"CPP\" #n, #n, ", a, "));", ln);
         break;
      case expansion:
         {
            String bs = PrintString("\"", n, "\"");
            String ns = PrintString("\"CPP\" ", bs);
            o.concatx(genloc__, indents(ind), n, "::_class.setup(", ln);
            // "_REGISTER_CLASS(", n, ", \"CPP\" #n, #n, ", a, ")"
            cppMacroIntRegisterClass(g, o, smod, ind + 2, n, ns, bs, a, 0);
            delete ns;
/*
   (Class *)eC_registerClass(ClassType_normalClass, ns, bs, sizeof(Instance *), 0, \
      (C(bool) (*)(void *)) n::constructor, (void(*)(void *)) n::destructor, (a).impl, AccessMode_privateAccess, AccessMode_publicAccess)
*/
            o.concatx(");", ln);
            break;
         }
      case use:
      case encapsulation:
         o.concatx(genloc__, indents(ind + 1), "REGISTER_CPP_CLASS(",
               n,    ", ",
               a,    ")", ln);
         break;
   }
}

/*static */void cppDefineMacroIntConstructClass(
      CPPGen g,            // generator
      ZString o,           // output
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroIntConstructClass(g, o, definition, false, ind,
         "c",
         "b",
         0); }

static void cppMacroIntConstructClass(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      bool template,
      uint ind,            // indentation
      const char * c,      // c?
      const char * b,      // b?
      void * unused)
{
   MacroMode smod = mode == configuration ? g.macroModeBits.intConstructClass ? expansion : use : mode; // selected mode
   const char * lc = smod == definition ? " \\" : "";    // lc: line continuation
   // const char * lt = smod == definition ? "" : " { }";   // lt: line termination
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define _CONSTRUCT(", c, ", ", b, ")", lc, ln);
         ind++;
      case expansion:
            // if(smod != definition) o.concatx(ln);
            cppMacroClassVirtualMethods(g, o, smod == definition ? encapsulation : configuration, true, template, ind, "INSTANCE", c, g.cInstance, g.cclass, g.cInstance, 0);
            // todo: spread the lines here
            o.concatx(genloc__, indents(ind), "static TCPPClass<", c, "> _class;", lc, ln);
            o.concatx(genloc__, indents(ind), "static C(bool) constructor(C(Instance) i, C(bool) alloc)", lc, ln);
            o.concatx(genloc__, indents(ind), "{", lc, ln);
            o.concatx(genloc__, indents(ind), "   if(alloc && !INSTANCEL(i, _class.impl))", lc, ln);
            o.concatx(genloc__, indents(ind), "   {", lc, ln);
            o.concatx(genloc__, indents(ind), "      ", c, " * inst = new ", c, "(i, _class);", lc, ln);
            o.concatx(genloc__, indents(ind), "      if(inst)", lc, ln);
            o.concatx(genloc__, indents(ind), "      {", lc, ln);
            o.concatx(genloc__, indents(ind), "         /* printf(\"Must free!\\n\");*/", lc, ln);
            o.concatx(genloc__, indents(ind), "         inst->mustFree = true;", lc, ln);
            o.concatx(genloc__, indents(ind), "      }", lc, ln);
            o.concatx(genloc__, indents(ind), "      return inst != null;", lc, ln);
            o.concatx(genloc__, indents(ind), "   }", lc, ln);
            o.concatx(genloc__, indents(ind), "   return true;", lc, ln);
            o.concatx(genloc__, indents(ind), "}", lc, ln);
            o.concatx(genloc__, indents(ind), "static void destructor(C(Instance) i)", lc, ln);
            o.concatx(genloc__, indents(ind), "{", lc, ln);
            o.concatx(genloc__, indents(ind), "   ", c, " * inst = (", c, " *)INSTANCEL(i, _class.impl);", lc, ln);
            o.concatx(genloc__, indents(ind), "   if(inst)", lc, ln);
            o.concatx(genloc__, indents(ind), "   {", lc, ln);
            o.concatx(genloc__, indents(ind), "      if(_class.destructor) ((void (*)(", c, " & self))_class.destructor)(*inst);", lc, ln);
            o.concatx(genloc__, indents(ind), "      if(inst->mustFree) delete inst;", lc, ln);
            o.concatx(genloc__, indents(ind), "   }", lc, ln);
            o.concatx(genloc__, indents(ind), "}", lc, ln);
            o.concatx(genloc__, indents(ind), "explicit inline ", c, "(", g_.sym.instance, " _impl, CPPClass & cl = _class) : ", b, "(_impl, cl)"/*, lt*/);
            if(smod != expansion) o.concatx(ln);
         break;
      case use:
      case encapsulation:
         o.concatx(genloc__, indents(ind), "_CONSTRUCT(",
               c,    ", ",
               b,    ")");
         break;
   }
}

/*static */void cppDefineMacroMoveConstructors(
      CPPGen g,            // generator
      ZString o,           // output
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroMoveConstructors(g, o, definition, ind,
         "c",
         0); }

static void cppMacroMoveConstructors(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      uint ind,            // indentation
      const char * c,      // c?
      void * unused)
{
   // todo: switch to own instead of intConstructClass
   MacroMode smod = mode == configuration ? g.macroModeBits.intConstructClass ? expansion : use : mode; // selected mode
   const char * lc = smod == definition ? " \\" : "";    // lc: line continuation
   // const char * lt = smod == definition ? "" : " { }";   // lt: line termination
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "// NOTE: For some reason not having the move constructors and assignment operator repeated in derived classes causes strange errors", ln);
         o.concatx(genloc__, indents(ind), "//       e.g. with DisplaySystem::pixelFormat and DisplaySystem::flags properties", ln);
         o.concatx(genloc__, indents(ind), "#define MOVE_CONSTRUCTORS(", c, ")", lc, ln);
         ind++;
      case expansion:
            o.concatx(genloc__, indents(ind), "inline ", c, "(", c, " && i)", lc, ln);
            o.concatx(genloc__, indents(ind), "{", lc, ln);
            o.concatx(genloc__, indents(ind), "   Instance * self = (Instance *)this;", lc, ln);
            o.concatx(genloc__, indents(ind), "   self->impl = i.impl;", lc, ln);
            o.concatx(genloc__, indents(ind), "   self->vTbl = i.vTbl;", lc, ln);
            o.concatx(genloc__, indents(ind), "   i.impl = null;", lc, ln);
            o.concatx(genloc__, indents(ind), "   i.vTbl = null;", lc, ln);
            o.concatx(genloc__, indents(ind), "}", lc, ln/*, lc, ln*/);
            o.concatx(genloc__, indents(ind), "inline ", c, " & operator= (", c, " && i)", lc, ln);
            o.concatx(genloc__, indents(ind), "{", lc, ln);
            o.concatx(genloc__, indents(ind), "   Instance * self = (Instance *)this;", lc, ln);
            o.concatx(genloc__, indents(ind), "   self->impl = i.impl;", lc, ln);
            o.concatx(genloc__, indents(ind), "   self->vTbl = i.vTbl;", lc, ln);
            o.concatx(genloc__, indents(ind), "   i.impl = null;", lc, ln);
            o.concatx(genloc__, indents(ind), "   i.vTbl = null;", lc, ln);
            o.concatx(genloc__, indents(ind), "   return *this;", lc, ln);
            o.concatx(genloc__, indents(ind), "}");
            if(smod != expansion) o.concatx(ln);
         break;
      case use:
      case encapsulation:
         o.concatx(genloc__, indents(ind), "MOVE_CONSTRUCTORS(",
               c,    ")");
         break;
   }
}

/*static */void cppDefineMacroConstructClass(
      CPPGen g,            // generator
      ZString o,           // output
      bool template,
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroConstructClass(g, o, definition, template, ind,
         "c",
         "b",
         "t",
         0); }

static void cppMacroConstructClass(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      bool template,
      uint ind,            // indentation
      const char * c,      // c?
      const char * b,      // b?
      const char * t,      // t?
      void * unused)
{
   // todo?: own bit for template vs normal
   MacroMode smod = mode == configuration ? g.macroModeBits.constructClass ? expansion : use : mode; // selected mode
   bool te = template;
   const char * lc = smod == definition ? " \\" : "";    // lc: line continuation
   const char * sc = smod == expansion ? "" : " ## ";    // sc: symbol concatenation
   char * cx = te ? PrintString("T", sc, c, " ", t) : CopyString(c);
   const char * sso = smod == expansion ? "\"" : "#";    // sso: symbol stringification open
   const char * ssc = smod == expansion ? "\"" : "";     // ssc: symbol stringification close
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define ", te ? cpptemplatePrefix : "", "CONSTRUCT(", c, ", ", b, te ? ", " : "", te ? t : "", ")", lc, ln);
         ind++;
      case expansion:
         if(template)
         {
            // todo: expansion
            cppMacroMoveConstructors(g, o, smod == definition ? encapsulation : configuration, ind, /*c*/cx, 0);
            o.concatx(lc, ln);
            o.concatx(genloc__, indents(ind), cx, "() : T", sc, c, "((C(Instance))Instance_newEx(ensureTemplatized ", t, "(_class, ", sso, c, ssc, ").impl, false), ensureTemplatized ", t, "(_class, ", sso, c, ssc, ")) { }", lc, ln);
            o.concatx(genloc__, indents(ind), "INSTANCE_VIRTUAL_METHODS_PROTO(T", sc, c, ")", lc, ln);
            o.concatx(genloc__, indents(ind), "static TCPPClass<T", sc, c, "> _class;", lc, ln);
            o.concatx(genloc__, indents(ind), "static C(bool) constructor(C(Instance) i, C(bool) alloc)", lc, ln);
            o.concatx(genloc__, indents(ind), "{", lc, ln);
            o.concatx(genloc__, indents(ind), "   if(alloc && !INSTANCEL(i, _class.impl))", lc, ln);
            o.concatx(genloc__, indents(ind), "   {", lc, ln);
            o.concatx(genloc__, indents(ind), "      ", cx, " * inst = new ", cx, "(i, _class);", lc, ln);
            o.concatx(genloc__, indents(ind), "      if(inst)", lc, ln);
            o.concatx(genloc__, indents(ind), "      {", lc, ln);
            o.concatx(genloc__, indents(ind), "         /*printf(\"Must free!\\n\");*/", lc, ln);
            o.concatx(genloc__, indents(ind), "         inst->mustFree = true;", lc, ln);
            o.concatx(genloc__, indents(ind), "      }", lc, ln);
            o.concatx(genloc__, indents(ind), "      return inst != null;", lc, ln);
            o.concatx(genloc__, indents(ind), "   }", lc, ln);
            o.concatx(genloc__, indents(ind), "   return true;", lc, ln);
            o.concatx(genloc__, indents(ind), "}", lc, ln);
            o.concatx(genloc__, indents(ind), "static void destructor(C(Instance) i)", lc, ln);
            o.concatx(genloc__, indents(ind), "{", lc, ln);
            o.concatx(genloc__, indents(ind), "   ", cx, "* inst = (", cx, "*)INSTANCEL(i, _class.impl);", lc, ln);
            o.concatx(genloc__, indents(ind), "   if(inst)", lc, ln);
            o.concatx(genloc__, indents(ind), "   {", lc, ln);
            o.concatx(genloc__, indents(ind), "      if(_class.destructor) ((void (*)(", cx, " & self))_class.destructor)(*inst);", lc, ln);
            o.concatx(genloc__, indents(ind), "      if(inst->mustFree) delete inst;", lc, ln);
            o.concatx(genloc__, indents(ind), "   }", lc, ln);
            o.concatx(genloc__, indents(ind), "}", lc, ln);
            o.concatx(genloc__, indents(ind), "explicit inline ", cx, "(C(Instance) _impl, CPPClass & cl = _class) : ", b, "(_impl, cl)", ln);
         }
         else
         {
            cppMacroMoveConstructors(g, o, smod == definition ? encapsulation : configuration, ind, c, 0);
            o.concatx(lc, ln);
            if(!strcmp(c, "Application") || !strcmp(c, "GuiApplication"))
               o.concatx(genloc__, indents(ind), "inline ", c, "() : ", c, "(eC_init_CALL(__LINK_ECERE__)) { }", ln);
            else
               o.concatx(genloc__, indents(ind), c, "() : ", c, "((", g_.sym.instance, ")Instance_newEx(_class.impl, false), _class) { }", lc, ln);
            //o.concatx(genloc__, indents(ind + 1), "_CONSTRUCT(", c, ", ", b, ")", ln);
            cppMacroIntConstructClass(g, o, smod == definition ? encapsulation : configuration, template, ind, c, b, 0);
            if(smod != expansion) o.concatx(ln);
         }
         break;
      case use:
      case encapsulation:
         if(!strcmp(c, "Application") || !strcmp(c, "GuiApplication"))
            o.concatx(genloc__, indents(ind), "APP_CONSTRUCT(",
                  c,    ", ",
                  b,    ")");
         else
            o.concatx(genloc__, indents(ind), te ? "T" : "", "CONSTRUCT(",
                  c,    ", ",
                  b,
                  te ? ", " : "", te ? t : "",
                        ")");
         break;
   }
   delete cx;
}

/*static */void cppDefineMacroDestructClass(
      CPPGen g,            // generator
      ZString o,           // output
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroDestructClass(g, o, definition, ind,
         "c",
         0); }

static void cppMacroDestructClass(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      uint ind,            // indentation
      const char * c,      // c?
      void * unused)
{
   MacroMode smod = /*mode == configuration ? g.macroModeBits.propSet ? expansion : use : */mode; // selected mode
   const char * lc = smod == definition ? " \\" : "";    // lc: line continuation
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define DESTRUCT(", c, ")", lc, ln);
         ind++;
      case expansion:
         o.concatx(genloc__, indents(ind), "((TCPPClass<", c, "> &)_class).destructor", ln);
         break;
      case use:
      case encapsulation:
         o.concatx(genloc__, indents(ind), "DESTRUCT(",
               c,    ")");
         break;
   }
}

/*static */void cppDefineMacroClassRegister(
      CPPGen g,            // generator
      ZString o,           // output
      bool prototype,
      bool template,
      bool original,
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroClassRegister(g, o, definition, prototype, template, original, ind,
         "c",
         "t",
         0); }

static void cppMacroClassRegister(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      bool prototype,
      bool template,
      bool original,
      uint ind,            // indentation
      const char * c,      // class name
      const char * t,      // template def
      void * unused)
{
   MacroMode smod = /*mode == configuration ? g.macroModeBits.propSet ? expansion : use : */mode; // selected mode
   bool pe = prototype;
   bool te = template;
   bool ol = original;
   const char * lc = smod == definition ? " \\" : "";       // lc: line continuation
   const char * lt = pe ? ";" : "";                         // lt: line termination
   const char * pt = smod == expansion ? "\n" : "";   // pt: prototype termination
   const char * sc = smod == expansion ? "" : " ## ";    // sc: symbol concatenation
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, indents(ind),
               "#define ", te ? "T" : "", "REGISTER", ol ? "" : "_", pe ? "PROTO" : ol ? "" : "IMPL", "(", !pe && !ol ? c : "", !pe && te ? ", " : "", te ? t : "", ")", lc, ln);
         ind++;
      case expansion:
      {
         o.concatx(genloc__, indents(ind));
         if(pe || ol)
            o.concat("static ");
         else if(te)
            o.concatx(t, " ");
         o.concatx("void ");
         if(!pe && !ol)
            o.concatx(te ? cpptemplatePrefix : "", te ? sc : "", c, te ? "<TPT>" : "", "::");
         o.concatx("class_registration(CPPClass & _class)", lt, pt);
         break;
      }
      case encapsulation:
         Print("");
         break;
      case use:
      {
         // if(smod == expansion)
         //    o.concatx(genloc__, indents(ind));
         o.concatx(genloc__, indents(ind), te ? "T" : "", "REGISTER_", pe ? "PROTO" : "IMPL", "(",
               !pe ? c : "", !pe && te ? ", " : "",
               te ? t : "",
                     ")", lt, ln);
         break;
      }
   }
}

/*static */void cppDefineMacroClassRegistration(
      CPPGen g,            // generator
      ZString o,           // output
      uint ind,            // indentation
      BClass c,
      BClass cBase,
      BVariant vClass,
      void * unused) {     // unused
   cppMacroClassRegistration(g, o, definition, ind,
         c,
         cBase,
         vClass,
         0); }

static void cppMacroClassRegistration(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      uint ind,            // indentation
      BClass c,
      BClass cBase,
      BVariant vClass,
      void * unused)
{
   MacroMode smod = mode == configuration ? g.macroModeBits.classRegistration ? expansion : use : mode; // selected mode
   const char * lc = smod == definition ? " \\" : "";    // lc: line continuation
   switch(smod)
   {
      case definition:
         if(g.macroModeBits.classRegistration)
            break;
         o.concatx(ln, genloc__, indents(ind), "#define ", c.name, "_class_registration(d)");
         ind++;
      case expansion:
      {
         bool content = false;
         bool template = c.cl.type == normalClass && c.cl.templateArgs != null;
         BMethod m; IterMethod itm { c.isInstance ? cBase.cl : c.cl };
         while((m = itm.next(publicVirtual)))
         {
            m.init(itm.md, c.isInstance ? cBase : c, g);
            if(brokenMethods.Find({ c.name, itm.md.name }))
               continue;
            if(m.hasTemplateAnything())
               continue;

            {
               Type param;
               Type t = m.md.dataType;
               const char * on = m.name, * mn = m.mname;
               bool byRefTypedThis = false;
               bool returnAddress = false;
               bool noRet = t.returnType.kind == voidType;
               bool destVsSrc = false; //!strcmp(mn, "onCopy") ? true : false;
               const char * first = null;
               const char * nthis = null;
               const char * oname = null;
               const char * nameParamOfClassType = null;
               Type returnType = t.returnType;
               char * typeString = returnType.kind == classType && returnType.classObjectType == anyObject ? CopyString(g_.sym.instance) : printType(t.returnType, false, false, true);
               // char * typeString = returnType.kind == classType && returnType.classObjectType == anyObject ? /*Copy*/PrintString(g_.sym.instance, "eeee") : printType(t.returnType, false, false, true);
               Class clRegRT;
               BClass cRT;
               bool hackRT;
               bool isString;
               bool isConst;
               int ptrRTGood = 0;
               Class clRegRTGood;
               BClass cRTGood;
               bool hackRTGood;
               bool isStringRTGood;
               bool isConstRTGood;
               Type typeRTGood = unwrapPtrTypeGetClassInfo(m.md.dataType.returnType, true, &clRegRTGood, &cRTGood, &ptrRTGood, &hackRTGood, &isStringRTGood, &isConstRTGood);
               ClassType ctRT = cppGetClassInfoFromType(m.md.dataType.returnType, true, &clRegRT, &cRT, &hackRT, &isString, &isConst);
               ClassType ctRTGood = clRegRTGood ? clRegRTGood.type : systemClass;
               char * args = null;
               char * params = null;
               TypeInfo argsInfo;
               // MapIterator<consttstr, const String> iMetParNamSwp { map = methodParamNameSwap };
               // MapIterator<const String, const String> iMetThisNameSwap { map = methodTypedObjectThisNameSwap };
               //int ptr = 0; Type t = unwrapPointerType(ti.type, &ptr);
               // _REGISTER_METHOD(cp1, cp2, ns, n, bc, c, r, p, ocl, oi, code, ea, rv)
               //            REGISTER_METHOD(ns, n, bc, c, r, p, ocl, oi, code, ea, rv)
               //      REGISTER_TYPED_METHOD(ns, n, bc, c, r, p, ocl, oi, code, ea, rv)
               // name string, name, base class, class, return (type), parameters, object class?, object instance?, code?, e? arguments?, return value
               // bool pfx = c.cl.type == normalClass && c.cl.templateArgs;
               const String cn = c.name; // PrintString(pfx ? cpptemplatePrefix : "", c.name);
               const String d = smod == definition ? "d" : cn;

               ZString r { allocType = heap };
               ZString p { allocType = heap };
               ZString ocl { allocType = heap };
               ZString oi { allocType = heap };
               ZString code { allocType = heap };
               ZString ea { allocType = heap };
               ZString rv { allocType = heap };

               o.concatx(lc, ln);

               // o.concatx("   ", t.classObjectType == typedObject ? "REGISTER_TYPED_METHOD" : "REGISTER_METHOD",
               //    "(\"", on, "\", ", mn, ", ", cn, ", ", d, ", ");

               // TODO: Redo this whole type system mess and use Type system directly!!!

               // r
               r.copy("");
               if(returnType.kind == templateType)
                  r.concatx("TP(", c.name, ", ", returnType.templateParameter.identifier.string, ")");
               else if(ctRT == normalClass || ctRT == noHeadClass)
               {
         /*       r.concatx(cRT.symbolName);
                  if(ctRT == noHeadClass)
                     r.concatx(" *");   */
                  if(ctRT == normalClass)
                  {
                     /*if(!strcmp(cRT.name, "Instance"))
                        r.concatx(cRT.symbolName);
                     else*/
                     if(isConst && isString)
                        r.concatx("/*CT-A*/constString");
                     else
                        r.concatx(cRT.symbolName);
                  }
                  else if(ctRT == noHeadClass)
                     r.concatx(cRT.symbolName, " *");
               }
               else
                  r.concatx(strptrNoNamespace(typeString));
               // delete typeString;

               // p
               p.copy("");
               if(t.kind == functionType)
               {
                  bool comma = false; //const char * comma = "";
                  switch(t.classObjectType)
                  {
                     case none:
                        /*if(t.thisClass && t.thisClass.registered)
                        {
                           Class clReg = t.thisClass.registered;
                           BClass cReg = clReg;
                           p.concatx("C(", cReg.is_class ? "Instance" : clReg.name, ")");
                        }
                        else if(!strcmp(cn, "Application"))
                           p.concatx("C(Instance)");
                        else
                           p.concatx("C(", cn, ")");
                        */
                        nthis = "o_";
                        // p.concatx(" ", nthis);
                        // comma = true;
                        break;
                     //case classPointer: conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                     case typedObject:
                     {
                        byRefTypedThis = t.byReference;
                        returnAddress = ctRT == normalClass || ctRT == noHeadClass;
                        nthis = /*iMetThisNameSwap.Index(mn, false) ? iMetThisNameSwap.data :*/ "o_";
                        // p.concatx("XClass * _class, C(Instance) ", byRefTypedThis ? "* " : "", nthis);
                        // comma = true;
                        break;
                     }
                     //case anyObject:    conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                     default:           conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                  }
                  argsInfo = { type = m.md.dataType, m = m, md = m.md, cl = c.cl, c = c };
                  // if(!strcmp(cn, "Skin") && !strcmp(on, "CaptionFont"))
                  //    PrintLn(p);
                  // normalClassMacroOverride = true;
                  params = cppParams(c, argsInfo, regMethodParamList, vClass, cn, true, comma, mode, &first, &nameParamOfClassType, null, null, { });
                  // normalClassMacroOverride = false;
                  if(nameParamOfClassType && t.classObjectType == none && t.thisClass && t.thisClass.registered)
                     oname = nameParamOfClassType;
                  p.concatx(params);
                  // PrintLn(p);
                  // if(p._string && !strcmp(p._string, ", ")) p._string[0] = '\0'; // todo: fix this
                  delete params;
               }
               else conmsg(t.kind, " is not handled here. todo?");

               // ocl
               ocl.copy("");
               if(t.staticMethod)
                  ocl.concatx("(C(Instance))null");
               else
               {
                  ocl.concatx(destVsSrc ? first : oname ? oname : nthis);
                  if(byRefTypedThis)
                     ocl.concatx(" ? *", destVsSrc ? first : oname ? oname : nthis, " : null");
               }

               // oi
               oi.copy("");
               if(t.staticMethod)
                  oi.concatx("(C(Instance))null");
               else
               {
                  oi.concatx(oname ? oname : nthis);
                  if(byRefTypedThis)
                     oi.concatx(" ? *", nthis, " : null");
               }

               // code
               code.copy("");
               {
                  bool comma = false;
                  bool ptrI = !t.thisClass || (t.thisClass.string && !strcmp(t.thisClass.string, "class"));
                  char * args = cppParams(c, argsInfo, regMethodLocalConvEcToCppVarsForArgsPassing, vClass, cn, !ptrI, comma, mode, null, null, null, null, { });
                  code.concatx(genspc__, args);
                  delete args;
               }
               if(!noRet)
               {
                  bool cast = ctRT == enumClass || (ctRTGood == structClass && ptrRTGood);
                  if(returnType.kind == templateType)
                     code.concatx("TP(", c.name, ", ", returnType.templateParameter.identifier.string, ")");
                  else if((ctRT == normalClass || ctRT == noHeadClass))
                  {
               /*    if(ctRT == normalClass)
                        code.concatx(cRT.name, " *");
                     else if(ctRT == noHeadClass)
                        code.concatx(cRT.symbolName, " *");   */

                     if(ctRT == normalClass)
                     {
                        if(cRT.isString)
                        {
                           if(isConst)
                              code.concatx("/*CT-B*/constString");
                           else
                              code.concat(cRT.symbolName);
                        }
                        else
                        {
                        // if(cRT.isInstance)   // Exception
                           code.concat(cRT.name/*, " *"*/);
                           // if(returnAddress)
                              code.concat(" *");
                        // else
                        //    code.concatx(cRT.symbolName);
                        }
                     }
                     else if(ctRT == noHeadClass)
                        code.concatx(cRT.symbolName, " *");
                  }
                  else
                     code.concatx(strptrNoNamespace(typeString));

                  code.concatx(" ret = ", cast ? "(" : "", cast ? cRTGood.symbolName : "", cast && ptrRTGood ? stars(ptrRTGood, 0) : "", cast ? ")" : "");

                  if(returnAddress) code.concatx(" &");
               }
               {
                  bool comma = false;
                  bool ptrI = !t.thisClass || (t.thisClass.string && !strcmp(t.thisClass.string, "class"));
                  bool scptr = ctRTGood == structClass && !ptrRTGood;
                  bool impl = ctRTGood == noHeadClass && !ptrRTGood;
                  code.concatx(scptr ? "&" : "", "fn(");
                  if(ptrI)
                  {
                     code.concat("*i");
                     comma = true;
                  }
                  code.concat((args = cppParams(c, argsInfo, regMethodArgsPassingEcToCpp, vClass, cn, !ptrI, comma, mode, null, null, null, null, { })));
                  code.concatx(")", scptr ? "->impl" : impl ? ".impl" : "");
               }
               if(!noRet)
               {
                  code.concat("; return ");
                  if(returnAddress)
                     code.concat("ret ? ret->impl : null;");
                  else
                  {
                     code.concat("ret");
                     if(ctRT == normalClass && !cRT.isString)
                        code.concat("->impl");
                  }
               }
               delete args;

               // ea
               ea.copy("");
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
                        ea.concatx("_class, ", nthis);
                        comma = ", ";
                        break;
                     }
                     //case anyObject:    conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                     case none:
                        if(!t.staticMethod)
                        {
                           ea.concatx(nthis);
                           comma = ", ";
                        }
                        break;
                     default:           conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                  }
                  if(!(t.params.count == 1 && ((Type)t.params.first).kind == voidType))
                  {
                     char * apname = null;
                     uint ap = 0;
                     MapIterator<consttstr, const String> i { map = methodParamNameSwap };
                     // why isn't this in cppParams or whatnot?
                     for(param = t.params.first; param; param = param.next)
                     {
                        const char * name = i.Index({ mn, param.name }, false) ? i.data : param.name;
                        if(!name)
                           apname = PrintString("ap", ++ap);
                        if(param.kind == classType && param.classObjectType == typedObject)
                           ea.concatx(", class_", name ? name : apname);
                        ea.concatx(comma, name ? name : apname);
                        if(!name) delete apname;
                        if(!comma[0]) comma = ", ";
                     }
                  }

               }
               else conmsg(t.kind, " is not handled here. todo?");

               // rv
               rv.copy("");
               if(!noRet)
               {
                  rv.concat("(");
                  if(returnType.kind == templateType)
                     rv.concatx("TP(", c.name, ", ", returnType.templateParameter.identifier.string, ")");
                  else if(ctRT == noHeadClass || ctRT == normalClass)
                  {
                     if(ctRT == normalClass && isString && isConst)
                        rv.concatx("/*CT-C*/constString");
                     else
                        rv.concat(cRT.symbolName);
                  }
                  else
                     rv.concatx(strptrNoNamespace(typeString));
                  if(ctRT == noHeadClass)
                     rv.concat(" *");
                  rv.concat(")");
                  if(ctRT == normalClass || ctRT == noHeadClass || (ctRT == systemClass && typeString && strstr(typeString, "char *")))
                     rv.concat("null");
                  else
                     rv.concat("1");
               }

               if(t.classObjectType == typedObject)
                  cppMacroRegisterTypedMethod(g, o, smod == definition ? encapsulation : /*configuration*/smod, template, ind,
                        on,   // ns
                        mn,   // n
                        cn,   // bc
                        d,    // c
                        template ? "<TPT>" : "",
                        r,
                        p,
                        ocl,
                        oi,
                        code,
                        ea,
                        rv,
                        0);
               else
                  cppMacroRegisterMethod(g, o, smod == definition ? encapsulation : /*configuration*/smod, template, ind,
                        on,   // ns
                        mn,   // n
                        cn,   // bc
                        d,    // c
                        template ? "<TPT>" : "",
                        r,
                        p,
                        ocl,
                        oi,
                        code,
                        ea,
                        rv,
                        0);

               delete r;
               delete p;
               delete ocl;
               delete oi;
               delete code;
               delete ea;
               delete rv;

               content = true;
            }
         }
         if(content) o.concatx(ln);
         break;
      }
      case use:
      case encapsulation:
         if(smod == expansion)
            o.concatx(genloc__, indents(ind));
         o.concatx(c.name, "_class_registration(", c.name, ")", ln);
         break;
   }
}

static void cppMacroRegVirtualMethods(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      uint ind,            // indentation
      BClass c,
      BClass cBase,
      BVariant vClass,
      void * unused)
{
   MacroMode smod = mode == configuration ? g.macroModeBits.classRegistration ? expansion : use : mode; // selected mode
   const char * lc = smod == definition ? " \\" : "";    // lc: line continuation
   switch(smod)
   {
      case definition:
      case expansion:
      {
         int len, maxNameLen = 0, maxDefLen = 0;
         // int maxLen = c.maxVirtualMethodNameLen + 1;
         const char * cn = c.name;
         List<Class> stack { };
         List<String> paramsDefs { };
         BMethod m; IterMethod itm { c.isInstance ? cBase.cl : c.cl };
         while((m = itm.next(publicVirtual)))
         {
            m.init(itm.md, c, g);
            if(brokenMethods.Find({ c.name, itm.md.name }))
               continue;
            if(m.hasTemplateAnything())
               continue;
            if((len = strlen(m.mname)) > maxNameLen)
               maxNameLen = len;
            {
               Type t = m.md.dataType;
               TypeInfo argsInfo { type = t, m = m, md = m.md, cl = c.cl, c = c };
               char * paramsDef = cppParams(c, argsInfo, regMethodCppParamList, vClass, cn, true, false, mode, null, null, null, null, { utilStr1 = "self" });
               paramsDefs.Add(paramsDef);
               if((len = strlen(paramsDef)) > maxDefLen)
                  maxDefLen = len;
            }
         }
         while((m = itm.next(publicVirtual)))
         {
            m.init(itm.md, c.isInstance ? cBase : c, g);
            if(brokenMethods.Find({ c.name, itm.md.name }))
               continue;
            if(m.hasTemplateAnything())
               continue;
            {
               const char * mn = m.mname;
               char * paramsDef = paramsDefs.firstIterator.data;
               Type t = m.md.dataType;
               TypeInfo argsInfo { type = t, m = m, md = m.md, cl = c.cl, c = c };
               char * paramsPassing = cppParams(c, argsInfo, regMethodArgsPassingCppToEc, vClass, null, false, false, mode, null, null, null, null, { cppDirectObjects = true });
               int lenName = strlen(mn);
               int lenDef = strlen(paramsDef);
               // #define REG_$(classname)_$(methodname)(m,c)
               //       REGVMETHOD($(classname), $(methodname), c::m,
               //       (Window & self),                    c, ())
               o.concatx(genloc__, "#define REG_", cn, "_", mn, "(m, c)", spaces(maxNameLen, lenName),
                     "REGVMETHOD(", cn, ", ", mn, ", ", spaces(maxNameLen, lenName), "c::m, ",
                     "(", paramsDef, "), ", spaces(maxDefLen, lenDef), "c, ",
                     "(", paramsPassing, "))", ln);
               paramsDefs.firstIterator.Remove();
               delete paramsDef;
               delete paramsPassing;
            }
         }
         delete paramsDefs;

         o.concatx(ln);
         o.concatx(genloc__, "#define REG_", cn, "(c)", lc, ln,
                     genloc__, indents(2), cn, "::class_registration(_class);");

         {
            Class cl = c.cl;
            BClass c = cl;
            if(c.isInstance)
               Print("");
            while(cl)
            {
               if(!cl.templateClass)
                  stack.Insert(0, cl);
               cl = cl.base.type == normalClass ? cl.base : null;
               c = cl ? cl : null;
               if(c && c.isInstance)
                  break;
            }
         }

         for(e : stack)
         {
            Class cl = e;
            BClass c = cl;
            BMethod m; IterMethod itm { c.cl };
            if(c.isInstance)
               Print("");
            if(c.isInstance)
               c = c.cl.base;
            while((m = itm.next(publicVirtual)))
            {
               m.init(itm.md, c, g);
               {
                  const char * mn = m.mname;
                  if(brokenMethods.Find({ c.name, itm.md.name }) || brokenRegs.Find({ c.name, itm.md.name })) continue;
                  if(m.hasTemplateAnything()) continue;
                  if(mn)
                     o.concatx(lc, ln, genloc__, indents(2), "REG_", c.name, "_", mn, "(", mn, ", c);");
               }
            }
         }
         o.concatx(ln);

         delete stack;
         break;
      }
   }
}

/*static */void cppDefineMacroClassVirtualMethods(
      CPPGen g,            // generator
      ZString o,           // output
      bool prototype,
      bool template,
      uint ind,            // indentation
      const char * un,     // uppercase name // TODOGDFOJDFGOIJDFG
      BClass c,
      BClass cBase,
      BVariant vClass,
      void * unused) {     // unused
   cppMacroClassVirtualMethods(g, o, definition, prototype, template, ind,
         un,
         "c",
         c,
         cBase,
         vClass,
         0); }

// _VIRTUAL_METHODS
static void cppMacroClassVirtualMethods(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      bool prototype,
      bool template,
      uint ind,            // indentation
      const char * un,     // uppercase name // TODOGDFOJDFGOIJDFG
      const char * c_,     // class
      BClass c,
      BClass cBase,
      BVariant vClass,
      void * unused)
{
   MacroMode smod = mode == configuration ? g.macroModeBits.virtualMethod ? expansion : use : mode; // selected mode
   const char * lc = smod == definition || smod == encapsulation ? " \\" : "";   // lc: line continuation
   //const char * sc = smod == expansion ? "" : " ## ";                            // sc: symbol concatenation
   switch(smod)
   {
      case definition:
         //if(g.macroModeBits.classVirtualMethods)
         //   break;
         o.concatx(ln, genloc__, indents(ind), "#define ", un, "_VIRTUAL_METHODS");
         if(prototype)
            o.concat("_PROTO");
         o.concatx("(c)", lc, ln);
      case expansion:
      {
         bool first = true;
         bool content = false;
         bool pfx = c.cl.type == normalClass && c.cl.templateArgs && prototype;
         char * cname = PrintString(pfx ? cpptemplatePrefix : "", c.name);
         const char * cn = smod == definition ? "c" : /*c.name*/cname;
         const char * bn = cname; // /*smod == definition ? "b" : *//*c.isInstance ? */c.name/* : cBase.name*/; // tocheck: what's up here? isn't b for base class name?
         const char * sn = c.symbolName;
         MacroMode submode = smod == definition ? use : smod;
         //MacroMode submode = smod == definition ? true ? expansion : use : smod;
         const char * lc = submode == expansion ? "" : " \\";     // lc: line continuation
         BMethod m; IterMethod itm { c.isInstance ? cBase.cl : c.cl };
         while((m = itm.next(publicVirtual)))
         {
            m.init(itm.md, c.isInstance ? cBase : c, g);
            if(brokenMethods.Find({ c.name, itm.md.name })) continue;
            if(m.hasTemplateAnything()) continue;
            // if(!itm.md.dataType.thisClass.type && itm.md.dataType.thisClass && itm.md.dataType.thisClass.string)
            //    itm.md.dataType.thisClass.type = ProcessTypeString(itm.md.dataType.thisClass.string, false);
            {
               char * params = null;
               char * args = null;
               const char * mn = m.mname, * tn = m.s;
               Type t = m.md.dataType;
               Class clRegRT;
               BClass cRT;
               bool hackRT;
               // ctRT is return type's class type
               ClassType ctRT = cppGetClassInfoFromType(t.returnType, true, &clRegRT, &cRT, &hackRT, null, null);

               int ptrRTGood = 0;
               Class clRegRTGood;
               BClass cRTGood;
               bool hackRTGood;
               bool isStringRTGood;
               bool isConstRTGood;
               Type typeRTGood = unwrapPtrTypeGetClassInfo(t.returnType, true, &clRegRTGood, &cRTGood, &ptrRTGood, &hackRTGood, &isStringRTGood, &isConstRTGood);
               ClassType ctRTGood = clRegRTGood ? clRegRTGood.type : systemClass;

               bool noRet = t.returnType.kind == voidType;
               TypeInfo ti;
               TypeInfo argsInfo;
               bool hasArgs = !(t.params.count == 0 || (t.params.count == 1 && ((Type)t.params.first).kind == voidType));
               if(!first/* && submode != expansion*/)
                  o.concatx(lc, ln);
               else
                  first = false;
               ti = { type = t.returnType, md = m.md, cl = c.cl, c = c };
               argsInfo = { type = t, m = m, md = m.md, cl = c.cl, c = c };
               {
                  bool opt1 = ctRT == normalClass || ctRT == noHeadClass;
                  bool ptrI = !t.thisClass/* || (t.thisClass.string && !strcmp(t.thisClass.string, "class"))*/;
                  BClass cThis = t.thisClass && t.thisClass.registered ? t.thisClass.registered : null;
                  char * s1 = null;
                  char * s2 = null;
                  char * s3 = null;
                  const char * s4;
                  ZString s3z { allocType = heap };
                  const char * mncpp = m.cpp_name;
                  bool anyObject = cThis && cThis.is_class;
                  if(anyObject)
                     cThis = null;
                  // if(cRT && !strcmp(cRT.name, "IteratorPointer"))
                  //    ; //PrintLn("");

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
                     s3z.concatx((args = cppParams(c, argsInfo, passing, vClass, null, false, false, mode, null, null, null, null, { })));
                     s3z.concatx(");");
                  }
                  else if((ctRT == normalClass && !cRT.isString) || ctRT == noHeadClass)
                  {
                     s3z.concatx(cRT.symbolName);
                     if(ctRT == noHeadClass)
                        s3z.concatx(" *");
                     s3z.concatx(" ret", cRT.name, " = ");
                     if(c.isInstance) s3z.concatx("Instance"); // Instance_* prefix for base instance methods
                     s3z.concatx(tn, "(");
                     if(c.isInstance || c.cl.type != normalClass)
                         s3z.concatx("_class.impl, ");
                     s3z.concatx("self ? self->impl : (", sn, ")null");
                     s3z.concatx((args = cppParams(c, argsInfo, passing, vClass, null, false, false, mode, null, null, null, null, { })));
                     s3z.concatx(");", lc, ln);

                     s3z.concatx(genloc__, indents(ind + 2), "return ");
                     if(ctRT == noHeadClass)
                        s3z.concatx("ret", cRT.name, ";");
                     else if(!strcmp(cRT.name, "Instance"))
                        s3z.concatx("*(", cRT.name, " *)INSTANCEL(ret", cRT.name, ", ret", cRT.name, "->_class);");
                     else if(ctRT == normalClass && !cRT.isString)
                        s3z.concatx("BINDINGS_CLASS(ret", cRT.name, ") ? (", cRT.name, " *)INSTANCEL(ret", cRT.name, ", ret", cRT.name, "->_class) : (", cRT.name, " *)0;");
                     else
                        s3z.concatx("*(", cRT.symbolName, " *)INSTANCEL(ret", cRT.name, ", ret", cRT.name, "->_class);");
                  }
                  else
                  {
                     bool cast = ctRT == enumClass || (ctRTGood == structClass && ptrRTGood);
                     bool cnst = ctRT == normalClass && !cRT.isString;
                     s3z.concatx("return ", cnst ? cRTGood.cpp_name : "", (cast || cnst) ? "(" : "", cast ? cRTGood.cpp_name : "", cast && ptrRTGood ? stars(ptrRTGood, 0) : "", cast ? ")" : "");
                     if(c.isInstance) s3z.concatx("Instance"); // Instance_* prefix for base instance methods
                     s3z.concatx(tn, "(");
                     if(c.isInstance || c.cl.type != normalClass)
                        s3z.concatx("_class.impl, ");
                     s3z.concatx("self ? self->impl : (", sn, ")null");
                     if(!(c.isInstance || c.cl.type != normalClass) && !itm.md.dataType.staticMethod && !c.is_class && itm.md.dataType.thisClass && itm.md.dataType.thisClass.string)
                     {
                        s3z.concatx(", ");
                        s3z.concatx("o_", anyObject ? "" : ".impl"/*" : (", cThis ? cThis.name : sn, ")null"*/);
                     }
                     s3z.concatx((args = cppParams(c, argsInfo, passing, vClass, null, false, false, mode, null, null, null, null, { })));
                     s3z.concatx(")", cnst ? ")" : "", ";");
                  }
                  s4 = s3z._string;

                  // c is owning class
                  if(c.cl.type == normalClass && !c.isInstance)
                  {
                     if(ctRT == normalClass && !cRT.isString)
                     {
                        char * t;
                        s1 = PrintString((t = cppTypeName(ti, false /*true*/, null, null)), " *"); // todo tnp2
                        delete t;
                     }
                     else
                        s1 = /*opt1 ? PrintString("C(", cRT.name, ")") : */cppTypeName(ti, false /*true*/, null, null); // todo tnp2
                  }
                  else
                     s1 = opt1 ? CopyString("Instance &" /*cRT.name*/) : cppTypeName(ti, true, null, null); // todo tnp2

                  /*if(t.thisClass && t.thisClass.registered)
                  {
                     Class clReg = t.thisClass.registered;
                     BClass cReg = clReg;
                     // o.concatx("C(", clReg.name, ")");
                     s2 = PrintString(cReg.is_class ? "Instance" : clReg.name, " & o_", hasArgs ? " _ARG" : "");
                  }
                  else*/
                  if(hasArgs)
                  {
                     // char x = mode;
                     s2 = PrintString(cThis ? cThis.name : cn, " &"/*, " o_"*/, !mode ? " ," : " _ARG");
                  }
                  else
                     s2 = PrintString(cThis ? cThis.name : cn, " &"/*, " o_"*/);

                  if(ptrI)
                     s3 = CopyString("");
                  else
                     s3 = cppParams(c, argsInfo, _argSpecialThisParamList, vClass, cn, true, false, mode, null, null, null, null, { });

                  if(cRT && !cRT.isBool && !ptrRTGood && !(vClass.kind == vclass && cRT == vClass.c))
                     vClass.processDependency(g, otypedef, otypedef, cRT.cl);

                  cppMacroVirtualMethod(g, o, submode, prototype, template, ind + g.options.expandMacros && !prototype ? 0 : 1,
                        mn, mncpp, template ? c.name : cn, template ? "<TPT>" : "", bn, s1, s2, s3,
                        (params = cppParams(c, argsInfo, _argParamList, vClass, cn, false, false, mode, null, null, null, null, { })), s4, 0);
                  content = true;
                  delete s1;
                  delete s2;
                  delete s3;
                  delete s3z;
               }
            }
         }
         if(content) o.concatx(ln);
         delete cname;
         break;
      }
      case use:
      case encapsulation:
         o.concatx(genloc__, indents(ind), un, "_VIRTUAL_METHODS");
         if(prototype)
            o.concat("_PROTO");
         o.concatx("(", c_, ")", lc, ln);
         break;
   }
}

// bindoc: VIRTUAL_METHOD* macros use C++ parameters. aka C++ bindings style parameters

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
      ZString o,           // output
      MacroMode mode,
      bool prototype,
      bool template,
      uint ind,            // indentation
      const char * n,      // name (method)
      const char * ncpp,   // name (method)
      const char * c,      // class
      const char * t,      // template?
      const char * b,      // base class
      const char * r,      // return type
      const char * p0,     // p0?
      const char * ep,     // ep?
      const char * p,      // parameters?
      const char * d,      // dispatch?
      void * unused)
{
   MacroMode smod = /*mode == configuration ? g.macroModeBits.propSet ? expansion : use : */mode; // selected mode
   bool te = template;
   const char * lc = smod == expansion ? "" : " \\";     // lc: line continuation
   const char * sc = smod == expansion ? "" : " ## ";    // sc: symbol concatenation
   const char * pt = prototype ? ";" : "";               // pt: prototype termination
   char * cx = template ? PrintString("T", sc, c, " ", t) : CopyString(c);
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define ", te ? "T" : "", "VIRTUAL_METHOD");
         if(prototype)
            o.concat("_PROTO");
         o.concatx("(n, ncpp, c", (te && !prototype) ? ", t" : "", ", b, r, p0, ep, p", prototype ? "" : ", d", ")", lc, ln);
         ind++;
      case expansion:
         if(prototype)
         {
            o.concatx(genloc__, indents(ind), "struct ", c, sc, "_", sc, n, sc, "_Functor", lc, ln);
            o.concatx(genloc__, indents(ind), "{", lc, ln);
            ind++;
               o.concatx(genloc__, indents(ind), "int _[0];", lc, ln);
               o.concatx(genloc__, indents(ind), "typedef ", r, " (* FunctionType)(", p0, " ", p, ")", pt, lc, ln);
         }
         if(!prototype && template)
            o.concatx(genloc__, indents(ind), "template<class TPT> /* TODO: another arg for the class form */", lc, ln);
         o.concatx(genloc__, indents(ind), "inline ");
         if(!prototype)
         {
            if(te)
               o.concat("typename ");
            o.concatx(cx, "::", c, sc, "_", sc, n, sc, "_Functor::");
         }
               o.concatx("FunctionType ");
         if(!prototype)
            o.concatx(cx, "::", c, sc, "_", sc, n, sc, "_Functor::");

               o.concatx("operator= (FunctionType func)", pt, lc, ln);
         if(!prototype)
         {
               o.concatx(genloc__, indents(ind), "{", lc, ln);
               ind++;
                  o.concatx(genloc__, indents(ind), "SELF(", c, ", ", ncpp, ");", lc, ln);
                  o.concatx(genloc__, indents(ind), "if(self->vTbl == ", cx, "::_class.vTbl)", lc, ln);
                  o.concatx(genloc__, indents(ind), "{", lc, ln);
                  ind++;
                     o.concatx(genloc__, indents(ind), "uint size = ", cx, "::_class.impl->vTblSize;", lc, ln);
                     o.concatx(genloc__, indents(ind), "self->vTbl = (void (**)())newt(", cx, "::", c, sc, "_", sc, n, sc, "_Functor::FunctionType", ", size);", lc, ln);
                     o.concatx(genloc__, indents(ind), "memcpy(self->vTbl, ", c, "::_class.vTbl, sizeof(", cx, "::", c, sc, "_", sc, n, sc, "_Functor::FunctionType", ") * size);", lc, ln);
                  ind--;
                  o.concatx(genloc__, indents(ind), "}", lc, ln);
                  o.concatx(genloc__, indents(ind), "((", cx, "::", c, sc, "_", sc, n, sc, "_Functor::FunctionType", " *)self->vTbl)[M_VTBLID(", b, ", ", n, ")] = func;", lc, ln);
                  o.concatx(genloc__, indents(ind), "return func;", lc, ln);
               ind--;
               o.concatx(genloc__, indents(ind), "}", lc, ln);
         }
         if(!prototype && template)
            o.concatx(genloc__, indents(ind), "template<class TPT>", lc, ln);
               o.concatx(genloc__, indents(ind), "inline ", r, " ");
         if(!prototype)
            o.concatx(cx, "::", c, sc, "_", sc, n, sc, "_Functor::");
               o.concatx("operator()(", ep, " ", p, ")", pt, lc, ln);
         if(!prototype)
         {
               o.concatx(genloc__, indents(ind), "{", lc, ln);
               ind++;
                  o.concatx(genloc__, indents(ind), "SELF(", c, ", ", ncpp, ");", lc, ln);
                  o.concatx(genloc__, indents(ind), "", d, lc, ln);
               ind--;
               o.concatx(genloc__, indents(ind), "}"/*, lc*/, ln);
         }
         if(prototype)
         {
            ind--;
            o.concatx(genloc__, indents(ind), "} ", ncpp, ";"/*, lc*/, ln);
         }
         if(g.options.expandMacros) // temp: this is removed now replace by new REG_* macros and C++ crazy template stuff
         { // todo: remove this whole block -- temp: just want to see in nomac
            o.concatx(genloc__, indents(ind), "// ", "inline ", prototype ? "static " : "", "void ");
            if(!prototype)
               o.concatx(c, "::");
            o.concatx("register_", sc, n, "(CPPClass & cl, ", c, "::", c, sc, "_", sc, n, sc,
                  "_Functor::FunctionType", " func)"/*, prototype ? pt : lc*/, ln);
            if(!prototype)
            {
               o.concatx(genloc__, indents(ind), "// ", "{"/*, lc*/, ln);
                  o.concatx(genloc__, indents(ind), "// ", indents(1), "((", c, "::", c, sc, "_", sc, n, sc,
                        "_Functor::FunctionType", " *)cl.vTbl)[M_VTBLID(", b, ", ", n, ")] = func;"/*, lc*/, ln);
               o.concatx(genloc__, indents(ind), "// ", "}", ln);
            }
         }
         break;
      case use:
      case encapsulation:
         o.concatx(genloc__, indents(ind), te ? "T" : "", "VIRTUAL_METHOD");
         if(prototype)
            o.concat("_PROTO");
         o.concatx("(", n, ", ", ncpp, ", ", c, (te && !prototype) ? ", " : "", (te && !prototype) ? t : "", ", ", b, ",", lc, ln);
         ind++;
         o.concatx(genloc__, indents(ind), r, ", ", p0, ", ", ep, ", ", p);
         if(prototype)
            o.concat(");");
         else
         {
            o.concatx(",", lc, ln);
            o.concatx(genloc__, indents(ind), d, ");");
         }
         break;
   }
   delete cx;
}

/*static */void cppDefineMacroIntRegisterMethod(
      CPPGen g,            // generator
      ZString o,           // output
      bool template,       // for template
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroIntRegisterMethod(g, o, definition, template, ind,
         "cp1",
         "cp2",
         "ns",
         "n",
         "bc",
         "c",
         "t",
         "r",
         "p",
         "ocl",
         "oi",
         "code",
         "ea",
         "rv",
         0); }

// bindoc: _REGISTER_METHOD and related macros use eC style parameters. aka C bindings style parameters

static void cppMacroIntRegisterMethod(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      bool template,       // for template
      uint ind,            // indentation
      const char * cp1,    // cp1?
      const char * cp2,    // cp2?
      const char * ns,     // ns?
      const char * n,      // n?
      const char * bc,     // bc?
      const char * c,      // c?
      const char * t,      // t?
      const char * r,      // r?
      const char * p,      // p?
      const char * ocl,    // ocl?
      const char * oi,     // oi?
      const char * code,   // code?
      const char * ea,     // ea?
      const char * rv,     // return value
      void * unused)
{
   MacroMode smod = /*mode == configuration ? g.macroModeBits.propSet ? expansion : use : */mode; // selected mode
   bool te = template;
   const char * lc = smod == definition ? " \\" : "";    // lc: line continuation
   const char * sc = smod == expansion ? "" : " ## ";    // sc: symbol concatenation
   const char * pt = smod == expansion ? ";" : "";       // pt: prototype termination
   const char * edq = smod == expansion ? "\"" : ""; // edq: expansion double quotes
   const char * eop = smod == expansion ? "(" : "";  // eop: expansion open parenthesis
   const char * ecp = smod == expansion ? ")" : "";  // eop: expansion close parenthesis
   char * cx = te ? PrintString("T", sc, c, " ", t) : CopyString(c);
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define _", te ? "T" : "", "REGISTER_METHOD(", cp1, ", ", cp2, ", ", ns, ", ",
               n, ", ", bc, ", ", c, ", ", te ? t : "", te ? ", " : "", r, ", ", p, ", ", ocl, ", ", oi, ", ", code, ", ", ea, ", ", rv, ")", lc, ln);
         ind++;
      case expansion:
            o.concatx(genloc__, indents(ind), "addMethod(_class.impl, ", edq, ns, edq, ", (void *) +[]", eop, p, ecp, lc, ln);
            o.concatx(genloc__, indents(ind), "{", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "XClass * cl = (", ocl, ") ? (XClass *)(", ocl, ")->_class : null;", lc, ln);
               if(smod != definition)
                  o.concatx(genloc__, indents(ind + 1), "", "// 'cp1' is ", cp1[0] ? "present" : "empty", lc, ln);
               if(cp1[0])
                  o.concatx(genloc__, indents(ind + 1), "", cp1, lc, ln);
               o.concatx(genloc__, indents(ind + 1), cx, " * i = (", oi, ") ? (", cx, " *)INSTANCEL(", oi, ", cl) : null;", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "int vid = M_VTBLID(", bc, ", ", n, ");", lc, ln);
               o.concatx(genloc__, indents(ind + 1), te ? "typename " : "", bc, sc, "_", sc, n, sc, "_Functor::FunctionType fn;", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "if(i && i->vTbl && i->vTbl[vid])", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "{", lc, ln);
                  o.concatx(genloc__, indents(ind + 2), "fn = (", te ? "typename " : "", bc, sc, "_", sc, n, sc, "_Functor::FunctionType) i->vTbl[vid];", lc, ln);
                  o.concatx(genloc__, indents(ind + 2), "", code, ";", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "}", lc, ln);
               if(smod != definition)
                  o.concatx(genloc__, indents(ind + 1), "", "// 'cp2' is ", cp2[0] ? "present" : "empty", lc, ln);
               if(cp2[0])
                  o.concatx(genloc__, indents(ind + 1), "", cp2, lc, ln);
               o.concatx(genloc__, indents(ind + 1), "else", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "{", lc, ln);
                  o.concatx(genloc__, indents(ind + 2), "auto method = ((", r, " (*) ", eop, p, ecp, ")(class_", sc, c, "->_vTbl)[M_VTBLID(", bc, ", ", n, ")]);", lc, ln);
                  o.concatx(genloc__, indents(ind + 2), "if(method) return method ", eop, ea, ecp, ";", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "}", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "return ", rv, ";", lc, ln);
            o.concatx(genloc__, indents(ind), "})", pt, ln);
         break;
      case use:
      case encapsulation:
         o.concatx(genloc__, indents(ind), "_", te ? "T" : "", "REGISTER_METHOD(",
               cp1,  ", ",
               cp2,  ", ",
               ns,   ", ",
               n,    ", ",
               bc,   ", ",
               c,    ", ",
               te ? t : "", te ? ", " : "",
               r,    ", ",
               p,    ", ",
               ocl,  ", ",
               oi,   ", ",
               code, ", ",
               ea,   ", ",
               rv,   ")");
         break;
   }
   if(smod == definition)
      o.concatx(ln);
   delete cx;
}

/*static */void cppMacroRegisterMethod(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      bool template,       // for template
      uint ind,            // indentation
      const char * ns,     // ns?
      const char * n,      // n?
      const char * bc,     // bc?
      const char * c,      // c?
      const char * t,      // t?
      const char * r,      // r?
      const char * p,      // p?
      const char * ocl,    // ocl?
      const char * oi,     // oi?
      const char * code,   // code?
      const char * ea,     // ea?
      const char * rv,     // return value
      void * unused)
{
   MacroMode smod = /*mode == configuration ? g.macroModeBits.propSet ? expansion : use : */mode; // selected mode
   bool te = template;
   MacroMode submode = smod == definition ? use : smod;
   //MacroMode /*submode = smod == expansion ? expansion : use; */submode = smod == definition ? g.expansionOrUse : g.macroModeBits.intRegisterMethod;
   const char * lc = (smod == definition || smod == encapsulation) ? " \\" : "";    // lc: line continuation
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define ", te ? "T" : "", "REGISTER_METHOD(ns, n, bc, c", te ? ", t" : "", ", r, p, ocl, oi, code, ea, rv)", lc, ln);
         ind++;
      case expansion:
         cppMacroIntRegisterMethod(g, o, submode, template, ind,
               "",
               "",
               ns,
               n,
               bc,
               c,
               t,
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
      case encapsulation:
         o.concatx(genloc__, indents(ind), te ? "T" : "", "REGISTER_METHOD(",
               "\"", ns,   "\", ",
               n,    ", ",
               bc,   ", ",
               c,    ", ",
               te ? t : "",    te ? ", " : "",
               r,    ",", lc, ln,
               genloc__, indents(ind + 1), "(", p,    "),", lc, ln,
               genloc__, indents(ind + 1), ocl,  ", ",
               oi,   ", ",
               code, ",", lc, ln,
               genloc__, indents(ind + 1), "(", ea,   "), ",
               rv,   ");");
         break;
   }
}

/*static */void cppDefineMacroRegisterTypedMethod(
      CPPGen g,            // generator
      ZString o,           // output
      bool template,       // for template
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroRegisterTypedMethod(g, o, definition, template, ind,
         "ns",
         "n",
         "bc",
         "c",
         "t",
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
      ZString o,           // output
      MacroMode mode,
      bool template,       // for template
      uint ind,            // indentation
      const char * ns,     // ns?
      const char * n,      // n?
      const char * bc,     // bc?
      const char * c,      // c?
      const char * t,      // t?
      const char * r,      // r?
      const char * p,      // p?
      const char * ocl,    // ocl?
      const char * oi,     // oi?
      const char * code,   // code?
      const char * ea,     // ea?
      const char * rv,     // return value
      void * unused)
{
   MacroMode smod = /*mode == configuration ? g.macroModeBits.propSet ? expansion : use : */mode; // selected mode
   bool te = template;
   char * s1;
   char * s2;
   const char * lc = (smod == definition || smod == encapsulation) ? " \\" : "";    // lc: line continuation
   MacroMode submode = smod == definition ? use : smod;
   //MacroMode /*submode = smod == expansion ? expansion : use;*/submode = smod == definition ? g.expansionOrUse : g.macroModeBits.intRegisterMethod;
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define ", te ? "T" : "", "REGISTER_TYPED_METHOD(ns, n, bc, c", te ? ", t" : "", ", r, p, ocl, oi, code, ea, rv)", lc, ln);
         ind++;
      case expansion:
      {
         const char * lc = submode == expansion ? "" : " \\";  // lc: line continuation
         const char * sc = submode == expansion ? "" : " ## "; // sc: symbol concatenation
         cppMacroIntRegisterMethod(g, o, submode, template, ind,
               (s1 = PrintString(lc, ln, genloc__, indents(ind + 1),
                     "CPPClass * cppcl = _class ? (CPPClass *)_class->bindingsClass : null;", lc, ln,
                     genloc__, indents(ind + 1))),
               (s2 = PrintString("else if(cppcl && cppcl->vTbl && cppcl->vTbl[vid])", lc, ln,
                     genloc__, indents(ind + 1), "{", lc, ln,
                        genloc__, indents(ind + 2), "fn = (", bc, sc, "_", sc, n, sc, "_Functor::FunctionType) cppcl->vTbl[vid];", lc, ln,
                        genloc__, indents(ind + 2), code, ";", lc, ln,
                     genloc__, indents(ind + 1), "}", lc, ln, genloc__, indents(ind + 1))),
               ns,
               n,
               bc,
               c,
               t,
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
      case encapsulation:
         o.concatx(genloc__, indents(ind), te ? "T" : "", "REGISTER_TYPED_METHOD(",
               "\"", ns,   "\", ",
               n,    ", ",
               bc,   ", ",
               c,    ", ",
               te ? t : "", te ? ", " : "",
               r,    ",", lc, ln,
               genloc__, indents(ind + 1), "(", p,    "),", lc, ln,
               genloc__, indents(ind + 1), ocl,  ", ",
               oi,   ", ",
               code, ",", lc, ln,
               genloc__, indents(ind + 1), "(", ea,   "), ",
               rv,   ");");
         break;
   }
}

/*static */void cppDefineMacroProperty(
      CPPGen g,            // generator
      ZString o,           // output
      PropertyMacroBits opts,
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroProperty(g, o, definition, opts, { }, ind, null,
         "n",
         "t",
         "c",
         "sg",
         0); }

static void cppMacroProperty(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      PropertyMacroBits opts,
      TypeInfo ti,
      uint ind,            // indentation
      Array<PropertyComponent> components,
   // bool singleSet,      // note: attention! 'get' for a set/get property specifically refers to that property
                           //       but it is not required for that other direction so it's missing
                           //       so when singleSet use cppMacroIntPropSet (aka _setProto/_setImpl) instead of
                           //       cppMacroPropSet (aka  setProto/setImpl)...
                           //       note that the set* use the _set* internally thus defining both operator overloadings for set
      const char * n,      // name of property or member
      const char * t,      // t?
      const char * c,      // c?
      const char * sg,     // set/get(/isset)
      void * unused)
{
   MacroMode smod = /*mode == configuration ? g.macroModeBits.prop ? expansion : use : */mode; // selected mode
   bool te = opts.type == template;
   const char * lc = smod == definition ? " \\" : "";    // lc: line continuation
   const char * sc = smod == expansion ? "" : " ## ";    // sc: symbol concatenation
   const char * ps = opts.prototype ? "Proto" : "Impl";       // ps: prototype string
   const char * tp = te ? "<TPT>" : "";
   const char * tp2 = te ? "<class TPT>" : "";
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define property", ps, "(", n, ", ", sg, ")", lc, ln);
         ind++;
      case expansion:
         if(opts.prototype)
            o.concatx(genloc__);
         if(smod == expansion)
            o.concat(indents(ind));
         if(opts.prototype)
         {
            o.concatx("struct ", n, sc, "Prop", lc, ln);
            o.concatx(genloc__, indents(ind), "{", lc, ln);
            ind++;
            o.concatx(genloc__, indents(ind), n, sc, "Prop() { };", lc, ln);
            o.concatx(genloc__, indents(ind), "int _[0];", lc, ln);
         }
         if(smod == definition)
         {
            if(opts.prototype)
               o.concatx(genloc__);
            o.concatx(indents(ind), sg, lc, ln);
         }
         else
         {
            for(comp : components)
            {
               PropertyComponent component = comp;
               switch(component.type)
               {
                  case macroIntPropSet:
                     cppMacroIntPropSet(g, o, smod, opts, component.code, component.commented, ind, component.typename, component.typenamePart2, n, c, tp, tp2, "", 0);
                     break;
                  case macroPropSet:
                     cppMacroPropSet(g, o, smod, opts, component.code, component.commented, ind, component.typename, component.typenamePart2, n, c, tp, tp2, "", 0);
                     break;
                  case macroPropGet:
                     cppMacroPropGet(g, o, smod, opts, component.code, component.commented, ind, component.returnType, component.typename, component.typenamePart2, n, c, tp, tp2, "", 0);
                     break;
               }
            }
         }
         if(opts.prototype)
         {
            ind--;
            o.concatx(genloc__, indents(ind), "} ", n, ";"/*, lc*/, ln);
         }
         break;
      case use:
      case encapsulation:
         o.concatx(genloc__, indents(ind));
         /*if(!opts.prototype && ti.c && ti.cl && ti.cl.type == normalClass && ti.cl.templateArgs && components.count)
         {
            if(ti.c.isContainer)
               o.concatx(cpptemplateTemplateTypeDef, " ");
            else
               o.concatx(cpptemplateTemplateClassDef, " ");
         }
         */
         o.concatx("property", ps, "(",
            n,    ",");
         for(comp : components)
         {
            PropertyComponent component = comp;
            switch(component.type)
            {
               case macroIntPropSet:
                  cppMacroIntPropSet(g, o, use, opts, component.code, component.commented, ind + 1, component.typename, component.typenamePart2, n, c, tp, tp2, "", 0);
                  break;
               case macroPropSet:
                  cppMacroPropSet(g, o, use, opts, component.code, component.commented, ind + 1, component.typename, component.typenamePart2, n, c, tp, tp2, "", 0);
                  break;
               case macroPropGet:
                  cppMacroPropGet(g, o, use, opts, component.code, component.commented, ind + 1, component.returnType, component.typename, component.typenamePart2, n, c, tp, tp2, "", 0);
                  break;
            }
            // todo: handle printing whitespace (ln or space) between components
            // if(genSet && genGet)
            //    o.concatx(" ");
         }
         o.concatx(");", ln);
         break;
   }
}

/*static */void cppDefineMacroIntPropSet(
      CPPGen g,            // generator
      ZString o,           // output
      PropertyMacroBits opts,
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroIntPropSet(g, o, definition, opts, null, false, ind,
         "t",
         "t2",
         "n",
         "c",
         "tp",
         "tp2",
         "d",
         0); }

static void cppMacroIntPropSet(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      PropertyMacroBits opts,
      Array<String> code,  // multiline replacement for d
      bool commented,
      uint ind,            // indentation
      const char * t,      // t?
      const char * t2,     // n2?
      const char * n,      // n?
      const char * c,      // c?
      const char * tp,     // tp?
      const char * tp2,    // tp2?
      const char * d,      // d? (code)
      void * unused)
{
   MacroMode smod = mode == configuration ? g.macroModeBits.intPropSet ? expansion : use : mode; // selected mode
   bool pe = opts.prototype;
   bool nh = opts.type == nohead;
   bool te = opts.type == template;
   bool pp = !pe && te;
   const char * lc = smod == definition ? " \\" : "";    // lc: line continuation
   const char * sc = smod == expansion ? "" : " ## ";    // sc: symbol concatenation
   const char * ps = opts.prototype ? "Proto" : "Impl";  // ps: prototype string
// const char * sso = smod == expansion ? "" : "\"#";    // sso: symbol stringification open
// const char * ssc = smod == expansion ? "" : "\"";     // ssc: symbol stringification close
// if(g.macroModeBits.intPropSet && smod != expansion)
//    Print("");
   /*
   if(!strcmp(c, "BinaryTree") && !strcmp(t, "int"))
   {
      PrintLn(smod);
      PrintLn(smod == expansion);
      PrintLn(sc);
      Print("");
   }
   */
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, commented ? "// " : "", indents(ind), "#define _", nh ? "nh" : te ? "t" : "", "set", ps, "(", t, ", ", t2, ", ", n, ", ", c, te ? ", " : "", te ? tp : "", pp ? ", " : "", pp ? tp2 : "", opts.prototype ? "" : ", ", opts.prototype ? "" : d, ")", lc, ln);
         ind++;
      case expansion:
      {
         char * cx = te ? PrintString(cpptemplatePrefix, sc, c, " ", tp) : CopyString(c);
         if(opts.prototype)
            o.concatx(genloc__, commented ? "// " : "", indents(ind), "inline ", t, sc, t2 ? t2 : "", " operator= (", t, " v", t2 ? t2 : "", ");", ln);
         else
         {
            o.concatx(genloc__, commented ? "// " : "", indents(ind));
            if(opts.type == nohead)
               o.concatx(cpptemplateNoHeadDef, " ");
            else if(opts.type == template)
               o.concatx("template ", tp2, " ");
            o.concatx("inline ", t, sc, t2 ? t2 : "", " ", nh ? cpptemplatePrefix : "", nh ? sc : "", cx, nh ? "<TC, TCO>" : "", "::", n, sc, "Prop::", "operator= (", t, " v", sc, t2 ? t2 : "", ")", lc, ln);
            o.concatx(genloc__, commented ? "// " : "", indents(ind), "{", lc, ln);
            ind++;
               o.concatx(genloc__, commented ? "// " : "", indents(ind), "SELF(", cx, ", ", n, ");"/*, lc, ln*/);
               // o.concatx(genloc__, indents(ind), "printf(\"inside (property _set) ", sso, c, ssc, "::", sso, n, ssc, "Prop::", "operator= (", sso, t, ssc, " v", t2 ? sso : "", t2 ? t2 : "", t2 ? ssc : "", ")", "\\n\");", lc, ln);
               if(code)
               {
                  for(c : code)
                     o.concatx(/*genloc__, indents(ind), */c/*, lc, ln*/);
                  o.concatx(lc, ln);
               }
               else
                  o.concatx(lc, ln, genloc__, commented ? "// " : "", indents(ind), d, lc, ln);
               o.concatx(genloc__, commented ? "// " : "", indents(ind), "return v;", lc, ln);
            ind--;
            o.concatx(genloc__, commented ? "// " : "", indents(ind), "}", ln);
         }
         delete cx;
         break;
      }
      case use:
         o.concatx(ln);
      case encapsulation:
         o.concatx(genloc__, commented ? "// " : "");
         if(smod == use)
            o.concat(indents(ind + 2));
         o.concat(indents(ind + (smod == use ? 2 : 0)));

   /*
   if(!strcmp(mn, "transform"))
      Print("");

   if(c.cl.type == noHeadClass)
   {
      delete tn;
      tn = PrintString(cpptemplatePrefix, c.name);
   }
   String ncn = c.cl.type == noHeadClass ? PrintString(cpptemplatePrefix, cn) : CopyString(cn);
   */

         if(opts.prototype)
            o.concatx("_", te ? "t" : "", "set", ps, "(",
               t,              ", ",
               t2 ? t2 : "",   ", ",
               n,              ", ",
               nh ? cpptemplatePrefix : "",
               c,
            // pp ? ", " : "", pp ? "tp" : "", pp ? ", " : "", pp ? "tp2" : "",
               te ? ", " : "", te ? tp : "",
                               ")");
         else
         {
            o.concatx("_", nh ? "nh" : te ? "t" : "", "set", ps, "(",
               t,              ", ",
               t2 ? t2 : "",   ", ",
               n,              ", ",
               c,
            // pp ? ", " : "", pp ? "tp" : "", pp ? ", " : "", pp ? "tp2" : "",
               te ? ", " : "", te ? tp : "",
               te ? ", " : "", te ? tp2 : "",
                               ", ");

            if(code)
            {
               for(line : code)
                  o.concatx(line);
            }
            else
               o.concatx(d);
            o.concatx(")");
         }
         break;
   }
}

/*static */void cppDefineMacroPropSet(
      CPPGen g,            // generator
      ZString o,           // output
      PropertyMacroBits opts,
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroPropSet(g, o, definition, opts, null, false, ind,
         "t",
         "t2",
         "n",
         "c",
         "tp",
         "tp2",
         "d",
         0); }

static void cppMacroPropSet(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      PropertyMacroBits opts,
      Array<String> code,  // multiline replacement for d
      bool commented,
      uint ind,            // indentation
      const char * t,      // t?
      const char * t2,     // t2?
      const char * n,      // n?
      const char * c,      // c?
      const char * tp,     // tp?
      const char * tp2,    // tp2?
      const char * d,      // d? (code)
      void * unused)
{
   MacroMode smod = mode == configuration ? g.macroModeBits.propSet ? expansion : use : mode; // selected mode
   bool pe = opts.prototype;
   bool nh = opts.type == nohead;
   bool te = opts.type == template;
   bool pp = !pe && te;
   const char * lc = smod == definition ? " \\" : "";    // lc: line continuation
   const char * pt = opts.prototype ? ";" : "";               // pt: prototype termination
   const char * ps = opts.prototype ? "Proto" : "Impl";       // ps: prototype string
// const char * sso = smod == expansion ? "" : "\"#";    // sso: symbol stringification open
// const char * ssc = smod == expansion ? "" : "\"";     // ssc: symbol stringification close
   MacroMode submode = smod == definition ? encapsulation : smod;
                    // smod == definition ? encapsulation : configuration
   //MacroMode /*submode = smod == expansion ? expansion : use;*/submode = smod == definition ? g.expansionOrUse : g.macroModeBits.intPropSet;
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, commented ? "// " : "", indents(ind), "#define ", nh ? "nh" : te ? "t" : "", "set", ps, "(", t, ", ", t2, ", ", n, ", ", c, te ? ", " : "", te ? tp : "", pp ? ", " : "", pp ? tp2 : "", pe ? "" : ", ", pe ? "" : d, ")", lc, ln);
         ind++;
      case expansion:
      {
         const char * lc = submode == expansion ? "" : " \\";  // lc: line continuation
         const char * sc = submode == expansion ? "" : " ## "; // sc: symbol concatenation
         char * cx = te ? PrintString(cpptemplatePrefix, sc, c, " ", tp/*, pp ? tp2 : tp*/) : CopyString(c);
         // if(smod == definition)
         //    o.concat(indents(ind));
         cppMacroIntPropSet(g, o, smod == definition ? encapsulation : configuration, pe ? { opts.prototype, opts.type == template ? normal : opts.type } : opts, code, commented, ind,
            t,
            t2,
            n,
            c,
            tp,
            tp2,
            d,
            0);
         o.concatx(lc, ln);
         o.concatx(genloc__, commented ? "// " : "", indents(ind));
         if(!opts.prototype && opts.type == nohead)
            o.concatx(cpptemplateNoHeadDef, " ");
         else if(!opts.prototype && opts.type == template)
            o.concatx("template ", tp2, " ");
         o.concatx("inline ", nh ? "typename " : "", nh ? cpptemplatePrefix : "", nh ? sc : "", pp ? "typename " : "", cx, nh ? "<TC, TCO>" : "", "::", n, sc, "Prop & ");
         if(!opts.prototype)
            o.concatx(nh ? cpptemplatePrefix : "", nh ? sc : "", cx, nh ? "<TC, TCO>" : "", "::", n, sc, "Prop::");
         o.concatx("operator= (", nh ? "typename " : "", nh ? cpptemplatePrefix : "", nh ? sc : "", cx, nh ? "<TC, TCO>" : "", "::", n, sc, "Prop & prop)", pt);
         if(!opts.prototype)
         {
            o.concatx(lc, ln);
            o.concatx(genloc__, commented ? "// " : "", indents(ind), "{", lc, ln);
            ind++;
               o.concatx(genloc__, commented ? "// " : "", indents(ind), "SELF(", cx, ", ", n, ");", lc, ln);
               // o.concatx(genloc__, indents(ind), "printf(\"inside (property set) ", sso, c, ssc, "::", sso, n, ssc, "Prop::", "operator= (", sso, c, ssc, "::", sso, n, ssc, "Prop & prop)", "\\n\");", lc, ln);
               o.concatx(genloc__, commented ? "// " : "", indents(ind), t, sc, t2 ? t2 : "", " v = prop;"/*, lc, ln*/);
               if(code)
               {
                  for(c : code)
                     o.concatx(/*genloc__, indents(ind), */c/*, lc, ln*/);
                  o.concatx(lc, ln);
               }
               else
                  o.concatx(lc, ln, genloc__, commented ? "// " : "", indents(ind), d, lc, ln);
               o.concatx(genloc__, commented ? "// " : "", indents(ind), "return prop;", lc, ln);
            ind--;
            o.concatx(genloc__, commented ? "// " : "", indents(ind), "}");
         }
         o.concatx(ln);
         delete cx;
         break;
      }
      case use:
      case encapsulation:
         if(opts.prototype)
            o.concatx(ln, genloc__, commented ? "// " : "", indents(ind + 2), te ? "t" : "", "set", ps, "(",
               t,              ", ",
               t2 ? t2 : "",   ", ",
               n,              ", ",
               // (/*nh || */te) ? cpptemplatePrefix : "",
               nh ? cpptemplatePrefix : "",
               c,
               te ? ", " : "", te ? tp : "",
                               ")");
         else
         {
            o.concatx(ln, genloc__, commented ? "// " : "", indents(ind + 2), nh ? "nh" : te ? "t" : "", "set", ps, "(",
               t,              ", ",
               t2 ? t2 : "",   ", ",
               n,              ", ",
               // (/*nh || */te) ? cpptemplatePrefix : "",
               c,
               te ? ", " : "", te ? tp : "",
               te ? ", " : "", te ? tp2 : "",
                               ", ");
            if(code)
            {
               for(line : code)
                  o.concatx(line);
            }
            else
               o.concatx(d);
            o.concatx(")");
         }
         break;
   }
}

/*static */void cppDefineMacroPropGet(
      CPPGen g,            // generator
      ZString o,           // output
      PropertyMacroBits opts,
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroPropGet(g, o, definition, opts, null, false, ind,
         "r",
         "t",
         "t2",
         "n",
         "c",
         "tp",
         "tp2",
         "d",
         0); }


static void cppMacroPropGet(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      PropertyMacroBits opts,
      Array<String> code,  // multiline replacement for d
      bool commented,
      uint ind,            // indentation
      const char * r,      // r: return type
      const char * t,      // t?
      const char * t2,     // t2?
      const char * n,      // n?
      const char * c,      // c?
      const char * tp,     // tp?
      const char * tp2,    // tp2?
      const char * d,      // d? (code)
      void * unused)
{
   MacroMode smod = /*mode == configuration ? g.macroModeBits.propSet ? expansion : use : */mode; // selected mode
   bool pe = opts.prototype;
   bool nh = opts.type == nohead;
   bool te = opts.type == template;
   bool pp = !pe && te;
   const char * lc = smod == definition ? " \\" : "";    // lc: line continuation
   const char * sc = smod == expansion ? "" : " ## ";    // sc: symbol concatenation
   const char * pt = opts.prototype ? ";" : "";               // pt: prototype termination
   const char * ps = opts.prototype ? "Proto" : "Impl";       // ps: prototype string
// const char * sso = smod == expansion ? "" : "\"#";    // sso: symbol stringification open
// const char * ssc = smod == expansion ? "" : "\"";     // ssc: symbol stringification close
   switch(smod)
   {
      case definition:
         o.concatx(genloc__, commented ? "// " : "", indents(ind), "#define ", nh ? "nh" : te ? "t" : "", "get", ps, "(", r, ", ", t, ", ", t2, ", ", n, ", ", c, te ? ", " : "", te ? tp : "", pp ? ", " : "", pp ? tp2 : "", pe ? "" : ", ", pe ? "" : d, ")", lc, ln);
         ind++;
      case expansion:
      {
         char * cx = te ? PrintString(cpptemplatePrefix, sc, c, " ", te ? tp : ""/*pp ? tp2 : tp*/) : CopyString(c);
         o.concatx(genloc__, commented ? "// " : "", indents(ind));
         if(!opts.prototype && opts.type == nohead)
            o.concatx(cpptemplateNoHeadDef, " ");
         else if(!opts.prototype && opts.type == template)
            o.concatx("template ", tp2, " ");
         o.concatx("inline ", r ? r : "", r && *r ? " " : "");
         if(!opts.prototype)
            o.concatx(nh ? cpptemplatePrefix : "", nh ? sc : "", cx, nh ? "<TC, TCO>" : "", "::", n, sc, "Prop::");
         o.concatx("operator ", t, " () const", pt);
         if(!opts.prototype)
         {
            o.concatx(lc, ln);
            o.concatx(genloc__, commented ? "// " : "", indents(ind), "{", lc, ln);
            ind++;
            if(opts.type == normal || opts.type == template)
               o.concatx(genloc__, commented ? "// " : "", indents(ind), "SELF(", cx, ", ", n, ");"/*, lc, ln*/);
            else if(opts.type == nohead)
               o.concatx(genloc__, commented ? "// " : "", indents(ind), "__attribute__((unused)) T", sc, c, " TCTCO * self = CONTAINER_OF(this, T", sc, c, " TCTCO, ", n, ");"/*, lc, ln*/);
               // o.concatx(genloc__, indents(ind), "printf(\"inside (property get) ", sso, c, ssc, "::", sso, n, ssc, "Prop::", "operator ", sso, t, ssc, sso, t2, ssc, " () const", "\\n\");", lc, ln);
               if(code)
               {
                  for(c : code)
                     o.concatx(/*genloc__, indents(ind), */c/*, lc, ln*/);
                  o.concatx(lc, ln);
               }
               else
               {
                  if((opts.type == normal || opts.type == template) || (opts.type == nohead))
                     o.concatx(lc, ln);
                  o.concatx(genloc__, commented ? "// " : "", indents(ind), d, lc, ln);
               }
            ind--;
            o.concatx(genloc__, commented ? "// " : "", indents(ind), "}");
         }
         o.concatx(ln);
         delete cx;
         break;
      }
      case use:
      case encapsulation:
         if(opts.prototype)
            // use of pp instead of te, pp will never be true here
            o.concatx(ln, genloc__, commented ? "// " : "", indents(ind + 2), pp ? "t" : "", "get", ps, "(",
               r ? r : "", r && *r ? " " : "",  ", ",
               t,                               ", ",
               t2 ? t2 : "",                    ", ",
               n,                               ", ",
               // (/*nh || */te) ? cpptemplatePrefix : "",
               c,
               pp ? ", " : "", pp ? tp : "",
                                                ")");
         else
         {
            o.concatx(ln, genloc__, commented ? "// " : "", indents(ind + 2), nh ? "nh" : te ? "t" : "", "get", ps, "(",
               r ? r : "", r && *r ? " " : "",  ", ",
               t,                               ", ",
               t2 ? t2 : "",                    ", ",
               n,                               ", ",
               // (/*nh || */te) ? cpptemplatePrefix : "",
               c,
               te ? ", " : "", te ? tp : "",
               te ? ", " : "", te ? tp2 : "",
                                                ", ");
            if(code)
            {
               for(line : code)
                  o.concatx(line);
            }
            else
               o.concatx(d);
            o.concatx(")");
         }
         break;
   }
}
