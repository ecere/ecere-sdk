#include "debug.eh"
#include "bgen.eh"
#include "econe.eh"

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

   MacroModeBits macroModeBits;
   BClass cInstance;
   BClass cclass;

   bool implementations;

   lang = CPlusPlus;
   //macroModeBits.all = expansion;

   cpp_classNameSwaps =
   { [
      { "AccessMode", "Access_Mode" },
      { null, null }
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
         if(g_.lib.ecereCOM && skipClasses.Find({ g_.lib.bindingName, c.name }))
            skip = true;
         if(!skip && !template && c.cl.type == normalClass)
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
         bool skip = c.isBool || c.isByte || c.isCharPtr || c.isUnInt || c.isUnichar || c.is_class || c.isString;
         bool template = hasTemplateClass(c.cl);
         if(g_.lib.ecereCOM && skipClasses.Find({ g_.lib.bindingName, c.name }))
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

   f.PrintLn(genloc__, "void ", g.lib.bindingName, "_cpp_init(Module & module);", ln);

   outputContents(g, f);

   outputSplitContents(g, f);

   f.PrintLn(ln);

   templateClassThings(g, f);

   if(g.lib.ecereCOM)
   {
      cppHardcodedNativeTypeTemplates(g, f);

      // todo:
      f.PrintLn(genloc__, "// template <typename ...Ts> inline void printLn2(const Ts&... ts)");
      f.PrintLn(genloc__, "// {");
      f.PrintLn(genloc__, "//    std::apply(");
      f.PrintLn(genloc__, "//       [](auto ...args) { printLn(args...); },");
      f.PrintLn(genloc__, "//       std::tuple_cat(std::make_tuple(classof(ts), vapass(ts))..., std::make_tuple(null))");
      f.PrintLn(genloc__, "//    );");
      f.PrintLn(genloc__, "// }", ln);
   }

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
            (g.lib.ecereCOM && skipClasses.Find({ g_.lib.bindingName, c.name }))/* temporary: */ || !cBase || !cBase.isBool; // temporary
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
      if(g.lib.ecereCOM && skipClasses.Find({ g_.lib.bindingName, c.name }))
         skip = true;
      if(!skip && !template)
      {
         const char * cn = c.name;
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
                  //f.PrintLn(genloc__, "enum class ", cn, " : ", c.symbolName, ";");
                  f.PrintLn(genloc__, "enum class ", cn/*, " : std::underlying_type_t<", c.symbolName, ">"*/, ";");
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
         if(g_.lib.ecereCOM && skipClasses.Find({ g_.lib.bindingName, c.name }))
            skip = true;
         if(!skip && !template && c.cl.type == normalClass && !c.cl.templateArgs)
         {
            firstClass = c.cl;
            f.PrintLn(genloc__, "TCPPClass<", c.cl.name, "> ", c.cl.name, "::_class;");
         }
      }
   }
   f.PrintLn(       "");
   f.PrintLn(genloc__, "void ", g.lib.bindingName /*name*/, "_cpp_init(Module & module)");
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
         if(g.lib.ecereCOM && skipClasses.Find({ g_.lib.bindingName, c.name }))
            skip = true;
         if(!skip && !template && c.cl.type == normalClass)
            //f.PrintLn("      REGISTER_CPP_CLASS(", c.cl.name, ", module);");
            cppToFileMacroRegisterClassCPP(g, f, g.expansionOrUse, 1, c.cl.name, "module", 0);
      }
   }
   f.PrintLn(genloc__, "   }");
   f.PrintLn(genloc__, "}");
   //if(g.lib.ecere) // hardcoded

   if(g.lib.ecereCOM) // hardcoded
   {
      f.PrintLn("");
      f.PrintLn(genloc__, "// Instance methods depending on libecere");
      f.Print(genloc__, "void Instance::class_registration(CPPClass & _class)");
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

   // outputImplementationsContents(g, f);
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

AVLTree<const String> tryMethodsClass { [
// "Surface",
// "Window",
   null
] };

AVLTree<consttstr> tryMethods { [
// { "Surface", "clear" },
// { "Window", "modal" },
/*
   { "FountResource", "faceName" },
   { "FountResource", "size" },
   { "FountResource", "bold" },
   { "FountResource", "italic" },
   { "FountResource", "underline" },
   { "Window", "borderStyle" },
   { "Window", "caption" },
   { "Window", "hasClose" },
   { "Window", "font" },
   { "Window", "parent" },
   { "Window", "position" },
   { "Window", "size" },
*/
   { null, null }
] };

AVLTree<consttstr> tryMembers { [
/*
   { "Application", "exitCode" },
   { "FountResource", "faceName" },
   { "FountResource", "size" },
   { "FountResource", "bold" },
   { "FountResource", "italic" },
   { "FountResource", "underline" },
   { "Window", "borderStyle" },
   { "Window", "caption" },
   { "Window", "hasClose" },
   { "Window", "font" },
   { "Window", "parent" },
   { "Window", "position" },
   { "Window", "size" },
*/
   { null, null }
] };

static AVLTree<const String> brokenMethodsClass { [
   null
] };

static AVLTree<consttstr> brokenRegs { [
   { "Window", "IsMouseResizing" },
   { "Window", "NotifyActivate" },
   { "Window", "NotifyDestroyed" },
   { "Window", "NotifySaved" },
   { "Window", "PreShowDecorations" },
   { "Window", "ShowDecorations" },
   { "Window", "OnActivate" },
   { "Window", "OnActivateClient" },
   { "Window", "OnChildAddedOrRemoved" },
   { "Window", "OnChildResized" },
   { "Window", "OnChildVisibilityToggled" },
   { "Window", "OnClose" },
   { "Window", "OnDrawOverChildren" },
   { "Window", "OnMultiTouch" },
   // { "Window", "M" },
   { null, null }
] };

static AVLTree<consttstr> brokenMethods { [
   { "Timer", "DelayExpired" },
   { "FileMonitor", "OnDirNotify" },
   { "FileMonitor", "OnFileNotify" },
   { "IOChannel", "Get" },
   { "IOChannel", "Put" },
   { "IOChannel", "Serialize" },
   { "IOChannel", "Unserialize" },
   { "ZString", "concat" },
   { "ZString", "concatn" },
   { "ZString", "concatf" },
   { "ZString", "concatx" },
   { "ZString", "copy" },
   { "Surface", "CenterTextf" },
   { "Surface", "WriteTextDotsf" },
   { "Surface", "WriteTextf" },
   { "Surface", "Blit" },
   { "Surface", "Filter" },
   { "Surface", "FilterHTile" },
   { "Surface", "FilterVTile" },
   { "Surface", "HTile" },
   { "Surface", "Stretch" },
   { "Surface", "Tile" },
   { "Surface", "VTile" },
   { "CubeMap", "Load" },
   { "DrawList", "Render" },
   { "FontManager", "setFontImageProcessing" },
   { "FontManager", "create" },
   { "FontManager", "getFont" },
   { "DefaultShader", "SetCamera" },
   { "DefaultShader", "SetLight" },
   { "DefaultShader", "shader" },
   { "GLStats", "allocBuffer" },
   { "GLStats", "allocTexture" },
   { "GLStats", "freeBuffers" },
   { "GLStats", "freeTextures" },
   { "GLStats", "print" },
   { "GLStats", "printBuf" },
   { "Window", "SetCaption" },
   { "Window", "SetText" },
   { "Window", "AddResource" },
   { "Window", "ButtonCloseDialog" },
   { "Window", "FreeMouseRange" },
   { "Window", "Grab" },
   { "Window", "MenuFileClose" },
   { "Window", "MenuFileExit" },
   { "Window", "MenuFileSave" },
   { "Window", "MenuFileSaveAll" },
   { "Window", "MenuFileSaveAs" },
   { "Window", "MenuWindowArrangeIcons" },
   { "Window", "MenuWindowCascade" },
   { "Window", "MenuWindowClose" },
   { "Window", "MenuWindowCloseAll" },
   { "Window", "MenuWindowMaximize" },
   { "Window", "MenuWindowMinimize" },
   { "Window", "MenuWindowMove" },
   { "Window", "MenuWindowNext" },
   { "Window", "MenuWindowPrevious" },
   { "Window", "MenuWindowRestore" },
   { "Window", "MenuWindowSelectWindow" },
   { "Window", "MenuWindowSize" },
   { "Window", "MenuWindowStayOnTop" },
   { "Window", "MenuWindowTileHorz" },
   { "Window", "MenuWindowTileVert" },
   { "Window", "MenuWindowWindows" },
   { "Window", "MultiTouchMessage" },
   { "Window", "RemoveResource" },
   { "Window", "RestoreCaret" },
   { "Window", "Update" },
   { "Window", "WriteCaption" },
   { "Cursor", "Load" },
   { "Interface", "GetExtendedKey" },
   { "Interface", "TranslateKey" },
   { "Interface", "WriteKeyedText" },
   { "Interface", "WriteKeyedTextDisabled" },
   { "DataField", "Move" },
   { "DataRow", "AddRowAfter" },
   { "DataRow", "GetData" },
   { "DataRow", "Move" },
   { "DataRow", "SetData" },
   { "DataRow", "UnsetData" },
   { "DataRow", "AddStringf" },
   { "DataRow", "Edit" },
   { "DropBox", "AddField" },
   { "DropBox", "AddRowAfter" },
   { "DropBox", "DeleteRow" },
   { "DropBox", "GetData" },
   { "DropBox", "SelectRow" },
   { "DropBox", "SetData" },
   { "DropBox", "Sort" },
   { "EditBox", "Delete" },
   { "EditBox", "Printf" },
   { "EditBox", "SetContents" },
   { "EditBox", "Load" },
   { "EditBox", "Save" },
   { "File", "Print" },
   { "File", "PrintLn" },
   { "File", "Printf" },
   { "ListBox", "AddStringf" },
   { "ListBox", "DeleteRow" },
   { "ListBox", "FindSubStringAfter" },
   { "ListBox", "GetData" },
   { "ListBox", "MultiSort" },
   { "ListBox", "RemoveField" },
   { "ListBox", "SelectRow" },
   { "ListBox", "SetData" },
   { "ListBox", "Sort" },
   { "ListBox", "SortAlsoBy" },
   { "ListBox", "AddField" },
   { "ListBox", "AddRowAfter" },
   { "Stacker", "GetNextStackedItem" },
   { "Stacker", "MakeControlVisible" },
   { "Menu", "FindItem" },
   { "Menu", "AddDynamic" },
   { "Menu", "AddItem" },
   { "Menu", "AddSubMenu" },
   { "Menu", "Clean" },
   { "Menu", "Merge" },
   { "Menu", "RemoveItem" },
   { "SelectorBar", "AddButton" },
   { "SelectorBar", "RemoveButton" },
   { "SelectorBar", "Select" },
   { "StatusBar", "AddField" },
   { "StatusBar", "RemoveField" },
   { "StatusField", "SetTextf" },
   { "TabControl", "AddTab" },
   { "TabControl", "RemoveTab" },
   { "DropBox", "AddStringf" },
   { "Socket", "SendString" },
   { "Socket", "Sendf" },
   // property vs lowercase method clash
   { "Surface", "LineStipple" },
   { "Surface", "TextOpacity" },
   { "Surface", "DrawingChar" },
   { "Window", "Scroll" },
   // bool * issue to be fixed
   /*
   { "Interface", "EnsureFullScreen" },
   { "Interface", "GetCurrentMode" },
   { "Interface", "ScreenMode" },
   { "Skin", "IsMouseResizing" },
   { "Window", "IsMouseResizing" },
   { "Window", "OnActivate" },
   { "Archive", "FileOpenCompressed" },
   { "Grouping", "Advance" },
   { "Report", "Advance" },
   { "MapSource", "bufferTile" },
   */

   // struct methods using function pointer parameters
   { "OldList", "Copy" },
   { "OldList", "Free" },
   { "OldList", "Remove" },
   { "OldList", "RemoveAll" },
   { "OldList", "Compare" },
   { "OldList", "Sort" },

   // struct methods with name issue
   // { "Extent", "Union" },

   // container returns nohead
   { "Container", "GetFirst" },
   { "Container", "GetLast" },
   { "Container", "GetNext" },
   { "Container", "GetPrev" },

   // cpp <-> c conversions
   { "Window", "GetDecorationsSize" },
   { "Window", "SetWindowArea" },
   { "Window", "SetWindowMinimum" },
   { "DisplayDriver", "LoadFont" },
   { "Shader", "registerShader" },
   { "Skin", "GetDecorationsSize" },
   { "Skin", "SetWindowArea" },
   { "Skin", "SetWindowMinimum" },

   // something INSTANCEL
   { "Archive", "OpenDirectory" },
   { "ArchiveDir", "OpenDirectory" },

   { "ArchiveDir", "AddFromFile" },
   { "ArchiveDir", "AddFromFileAtPosition" },

   { "Window", "SetBox" },
   { "DisplayDriver", "Clip" },
   { "DisplayDriver", "DrawPrimitives" },
   { "DisplayDriver", "FreeIndices" },
   { "DisplayDriver", "GetBitmapSurface" },
   { "DisplayDriver", "GetSurface" },
   { "DisplayDriver", "LockIndices" },
   { "DisplayDriver", "Scroll" },
   { "DisplayDriver", "SetLight" },
   { "DisplayDriver", "SetTransform" },
   { "DisplayDriver", "UnlockIndices" },
   { "DisplayDriver", "Update" },
   { "DisplayDriver", "GetJoystickState" },
   { "DisplayDriver", "GetScreenArea" },
   { "DisplayDriver", "SetMouseRange" },
   { "EditBox", "NotifyCharsAdded" },
   { "EditBox", "NotifyCharsDeleted" },
   { "Interface", "GetJoystickState" },
   { "Interface", "GetScreenArea" },
   { "Interface", "SetMouseRange" },
   { "Shader", "getDefinitions" },
   { "Skin", "CaptionFont" },
   { "Skin", "GetBitmap" },
   { "Skin", "SystemFont" },
   { "DropBox", "OnDropDown" },

   { "Instance", "OnDisplay" },
   { "Instance", "OnGetString" },

   { "Window", "OnHScroll" },
   { "Window", "OnVScroll" },
   { "Window", "NotifyDestroyed" },
   // { "Window", "OnFileModified" },

   { "File", "Lock" },
   { "File", "Seek" },

   { "DisplayDriver", "ConvertBitmap" },
   { "DisplayDriver", "SetPalette" },
   { "Interface", "GetCurrentMode" },
   { "Interface", "GetMouseState" },

   { null, null }
] };

static AVLTree<const String> brokenOrderedPublicMembersInitializers { [
   // broken members initializing constructors
   // broken zero value for MiddleAnchorValue // todo: fixit
   "Anchor",

   "NameSpace",
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
   { "File", "eof" },
   { "WindowController", "windowVTbl" },
   { "DefaultShader", "modelView" },
   { "DefaultShader", "projection" },
   { "DefaultShader", "matTexture" },
   { "DefaultShader", "cubemap_matrix" },
   { "DefaultShader", "globalAmbient" },
   { "DefaultShader", "lDiffuse" },
   { "DefaultShader", "lAmbient" },
   { "DefaultShader", "lSpecular" },
   { "DefaultShader", "lPosition" },
   { "DefaultShader", "lAtt" },
   { "DefaultShader", "lCutOffCos" },
   { "DefaultShader", "lSpotDir" },
   { "DefaultShader", "lSpotExp" },
   { "DefaultShader", "diffuse" },
   { "DefaultShader", "ambient" },
   { "DefaultShader", "specular" },
   { "DefaultShader", "emissive" },
   { "DefaultShader", "fogColor" },
   { "DefaultShader", "color" },
   // some [] issue
   // error: pasting "char" and "[" does not give a valid preprocessing token
   { "StaticString", "string" },
   // function pointer members
   { "BinaryTree", "CompareKey" },
   { "BinaryTree", "FreeKey" },
   // bad impl:
   { "BuiltInContainer", "_vTbl" },
   // error: use of deleted function
   { "Iterator", "container" },
   { "DrawSlot", "baseMap" },
   // error: no match for 'operator=' in ...
   { "NameSpace", "nameSpaces" },
   { "NameSpace", "classes" },
   { "NameSpace", "defines" },
   { "NameSpace", "functions" },
   // { "Light", "ambient" },
   // { "Light", "diffuse" },
   // { "Light", "specular" },
   // { "Light", "direction" },
   // something re C++ vs C type
   { "BuiltInContainer", "_class" },
   { "BuiltInContainer", "type" },
   { "Iterator", "pointer" },
   { "BinaryTree", "root" },

   // string does not name a type
   { "DataBox", "stringValue" },
   { "PathBox", "slashPath" },

   // x
   { "NameSpace", "btParent" },
   { "NameSpace", "left" },
   { "NameSpace", "right" },
   { "NameSpace", "parent" },

   // const issue
   { "GlobalSettings", "driver" },

   { "Bitmap", "driver" },
   { "Bitmap", "bitmaps" },
/*
   // x
   { "DisplayDriver", "driver" },
// { "DrawManager", "object" },
   { "DrawSlot", "object" },
   { "Light", "lightObject" },
   { "Light", "target" },
   { "Object", "material" },
   { "Object", "mesh" },
   { "Object", "cameraTarget" },
   { "PrimitiveSingle", "material" },
   { "BufferLocation", "line" },

   { "ZString", "allocType" },

   { "BTNode", "prev" },
   { "BTNode", "next" },
   { "BTNode", "minimum" },
   { "BTNode", "maximum" },
   { "BTNode", "count" },
   { "BTNode", "depthProp" },

   { "Mutex", "lockCount" },
   { "Mutex", "owningThread" },

   { "HashMap", "count" },

   { "Container", "firstIterator" },
   { "Container", "lastIterator" },

   { "Array", "size" },
   { "Array", "minAllocSize" },

   { "Font", "ascent" },
   { "Font", "descent" },

   { "Mesh", "nVertices" },
   { "Mesh", "groups" },
   { "Mesh", "flags" },
   { "Mesh", "parts" },

   { "Object", "transform" },
   { "Object", "max" },
   { "Object", "min" },
   { "Object", "center" },
   { "Object", "radius" },
   { "Object", "wmax" },
   { "Object", "wmin" },
   { "Object", "wcenter" },
   { "Object", "wradius" },
   { "Object", "tag" },
   { "Object", "frame" },
   { "Object", "startFrame" },
   { "Object", "endFrame" },
   { "Object", "camera" },
   { "Object", "firstChild" },
   { "Object", "next" },
   { "Object", "name" },
   { "Object", "matrix" },
   { "Object", "tracks" },
   { "Object", "flags" },
   { "Object", "parent" },
   { "Object", "numChildren" },
   { "Object", "localMatrixPtr" },
   { "Object", "matrixPtr" },
   { "Object", "light" },
   { "Object", "displaySystem" },
*/
   { "Bitmap", "palette" },

   // how to construct a nohead and the need to pass a class?
// : src\cpp\genCPP.ec: 2209: */             BTNode value(BinaryTree_get_first(&self->impl), BinaryTree::_class);  \
// : src\cpp\genCPP.ec: 2210: */             return value;));
   { "BinaryTree", "first" },
   { "BinaryTree", "last" },

   { "FontResource", "font" },
   { "FontResource", "fmFont" },
   { "Surface", "font" },
   { "Shader", "activeCompiledShader" },
   { "GlobalSettings", "dataOwner" },
   { "GlobalSettings", "dataClass" },
   { "Camera", "target" },
   { "Mesh", "texCoords" },
   { "Mesh", "vertices" },
   { "Mesh", "normals" },
   { "Mesh", "tangents" },
   { "Mesh", "colors" },
   { "Mesh", "lightVectors" },
   { "GuiApplication", "semaphore" },
   { "GuiApplication", "currentSkin" },
   { "Window", "fontObject" },
   { "Button", "symbol" },
   { "DataBox", "type" },
   { "EditBox", "firstLine" },
   { "EditBox", "lastLine" },
   { "EditBox", "line" },
   { "OldArray", "type" },
   { "ToolButton", "menuItemPtr" },
   { "FileDialog", "filters" },
   { "DCOMServerObject", "mutex" },
   { "DataField", "dataType" },

   // constString to char * conversion
   { "CommonControl", "toolTip" },
   { "PathBox", "path" },
   { "ToolTip", "tip" },
   { "FileDialog", "types" },

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
      char * cn = PrintString(pfx ? cpptemplatePrefix : "", c.name);
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
         const char * nhbase = c.cl.type == noHeadClass && baseIs_class ? "TNHInstance" : null;
         const char * bn = cBase ? cBase.name : "";
         bool hasBase = cBase && cBase.cl.type != systemClass;
         bool isBaseString = false;
         if(!strcmp(cBase.name, "String"))
            isBaseString = true;
         else if(cBase.clBase && !strcmp(cBase.clBase.name, "String"))
            isBaseString = true;

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

         while((m = itm.next(publicVirtual))) { m.init(itm.md, c.isInstance ? cBase : c); if((l = strlen(m.mname)) > maxLen) maxLen = l;}

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
            o.z.concatx(genloc__, "void eC_cpp_init(Module & module);", ln);
            o.z.concatx(genloc__, "void ecere_cpp_init(Module & module);", ln, ln);
            o.z.concatx(genloc__, "extern ", g.sym.module, " theEcereModule;", ln);
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
               Array<BitMemberTypeStringZero> bitMembers = c.cl.members.count <= 4 ? { } : null;
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
                        o.z.concatx(genloc__, indents(1), c.name, "(", c2.name, " impl) : impl((", c.symbolName, ")impl) { }", ln);
                        o.z.concatx(genloc__, indents(1), c.name, " & operator =(", c2.name, " impl) { this->impl = (", c.symbolName, ")impl; return *this; }", ln);
                        if(!contents)
                           contents = true;
                     }
                  }
                  if(contents)
                     o.z.concatx(ln);
                  // return contents;
               }
               o.z.concatx(genloc__, indents(1), c.name, "(", c.symbolName, " impl) : impl(impl) { }", ln);
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
                              else
                                 Print("");
                              break;
                           case classType:
                              if(dm.dataType._class && dm.dataType._class.registered && dm.dataType._class.registered.type == bitClass)
                                 bitMembers.Add({ bm, dm.dataType._class.registered.name, " = { }" });
                              else if(dm.dataType._class && dm.dataType._class.registered && dm.dataType._class.registered.type == enumClass)
                                 Print(""); // todo
                              else
                                 Print("");
                              break;
                        }
                     }
                  }
               }
               if(bitMembers && bitMembers.count > 1)
               {
                  const char * comma;
                  o.z.concatx(genloc__, indents(1), c.name, "(");
                  comma = "";
                  for(e : bitMembers)
                  {
                     BitMemberTypeStringZero item = e;
                     o.z.concatx(comma, item.typeString, " ", item.bm.name, item.zero);
                     if(comma[0] == '\0')
                        comma = ", ";
                  }
                  o.z.concatx(")", ln);
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
               o.z.concatx(genloc__, indents(1), "operator ", c.symbolName, "() { return impl; }", ln);
               o.z.concatx(genloc__, indents(1), c.name, " & operator =(", c.symbolName, " impl) { impl = impl; return *this; }", ln);
               delete bitMembers;
            }
            else if(c.cl.type == structClass)
            {
               o.z.concatx(genloc__, indents(1), c.symbolName, " impl;", ln);
               o.z.concatx(genloc__, indents(1), c.name, "() { impl = { }; }", ln);
               o.z.concatx(genloc__, indents(1), c.name, "(", c.symbolName, " impl) { this->impl = impl; }", ln);
            }
            else if(c.cl.type == unitClass)
            {
               if(cBase.is_class)
               {
                  o.z.concatx(genloc__, indents(1), c.symbolName, " impl;", ln);
                  o.z.concatx(genloc__, indents(1), c.name, "(", c.cl.dataTypeString, " value) { impl = value; }", ln);
               }
               else
               {
                  o.z.concatx(genloc__, indents(1), c.name, "(", cBase.name, " value) : ", cBase.name, "(value) { }", ln);
                  // todo: missing constructors if unit class derrived more than once?
                  o.z.concatx(genloc__, indents(1), c.name, "(", c.cl.dataTypeString, " value) : ",
                        cBase.name, "(", c.name, "(value)) { }", ln);
                  o.z.concatx(genloc__, indents(1), "operator ", c.cl.dataTypeString, "() { return ", cBase.name, "_in_", c.name, "(impl); }", ln);
                  o.z.concatx(genloc__, indents(1), c.name, " & operator =(", c.cl.dataTypeString, " value) { impl = ", c.name, "(value); return *this; }", ln);
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
                     // o.z.concatx(genloc__, indents(2), "// TODO: Omit this if we're linking against eC rt only", ln);
                     // o.z.concatx(genloc__, indents(2), "ecere_init(impl);", ln);
                     // o.z.concatx(genloc__, indents(2), "ecere_cpp_init(*this);", ln);

                     o.z.concatx("#ifdef MODULE_NAME", ln);
                     o.z.concatx(genloc__, indents(2), "loadTranslatedStrings(null, MODULE_NAME);", ln);
                     o.z.concatx("#endif", ln);
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
               cppMacroClassRegister(g, o.z, mode, mode == expansion, 1, c, 0);
               //o.z.concatx("      { ", cn, "_class_registration(", cn, ");", " }", ln);
               if(mode == expansion)
                  ; // o.z.concatx(genloc__, indents(1), "{", ln);
               else
                  o.z.concat(" { ");
               //if(!g.options.expandMacros)
               //   o.z.concatx(genloc__, indents(3), cn, "_class_registration(", cn, ");", ln);
               //else
                  //cppMacroClassRegistration(g, o.z, expansion);
               if(mode != expansion)
                  cppMacroClassRegistration(g, o.z, configuration, 2, c, cBase, c, 0);
               if(mode == expansion)
                  ; // o.z.concatx(genloc__, indents(1), "}", ln);
               else
                  o.z.concatx("; }", ln);
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
               processProperties(g, c, c.name, tn, true, o);
               delete tn;
            }
            else if(!c.isInstance && !c.isModule && c.cl.type != enumClass)
            {
               processProperties(g, c, c.name, cn, true, o);
               processDataMembers(g, c, v, c.name, true, o);
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
            // BOutput o { vclass, c = c, z = { allocType = heap } };
            // c.outImplementation = o;
            // n.implementationsContents.Add(v);
            BOutput o { vclass, c = c, z = { allocType = heap } };
            c.outSplit = o;
            n.splitContents.Add(v);

            if(!c.isInstance) // todo: remove this if, keep the next line
               o.z.concatx(ln);
            if(c.cl.type == normalClass)
               cppMacroClassVirtualMethods(g, o.z, configuration, false, template, 0, un, c.name, c, cBase, v, 0);

            if(c.cl.type == normalClass && !c.isInstance && !c.isModule)
            {
               if(mode == expansion)
               {
                  cppMacroClassRegister(g, o.z, mode, false, 0, c, 0);
                  o.z.concatx(genloc__, "{", ln);
                  cppMacroClassRegistration(g, o.z, configuration, 2, c, cBase, c, 0);
                  o.z.concatx(genloc__, "}", ln);
               }
            }

            if(!c.isInstance && !c.isModule && !hasOrBaseHasTemplateClass(c.cl) && c.cl.type != enumClass)
               genMethodCallers(g, c, v, cn, false, o);

            // todo?: properties and data member for nohead classes
            if(c.cl.type == noHeadClass)
            {
               String tn = PrintString(cpptemplatePrefix, cn, "<TC, TCO>");
               processProperties(g, c, c.name, tn, false, o);
               delete tn;
            }
            else if(!c.isInstance && !c.isModule && c.cl.type != enumClass)
            {
               processProperties(g, c, c.name, cn, false, o);
               processDataMembers(g, c, v, c.name, false, o);
            }
         }
      }
      delete cn;
   }
}

static void cppGenEnumClassValues(CPPGen g, BOutput o, BClass c)
{
   int maxLen = 0;
   const char * comma = "";
   NamedLink item;
   EnumClassData enumeration = (EnumClassData)c.cl.data;
   for(item = enumeration.values.first; item; item = item.next)
   {
      bool clash = !strcmp(item.name, "false") || !strcmp(item.name, "true") || !strcmp(item.name, "Pi");
      int len = strlen(item.name) + clash ? 1 : 0;
      if(len > maxLen)
         maxLen = len;
   }
   for(item = enumeration.values.first; item; item = item.next)
   {
      bool clash = !strcmp(item.name, "false") || !strcmp(item.name, "true") || !strcmp(item.name, "Pi");
      int len = strlen(item.name) + clash ? 1 : 0;
      o.z.concatx(comma, ln, genloc__, indents(1), item.name, clash ? "_" : "", spaces(maxLen, len), " = ", c.name, "_", item.name);
      if(comma[0] == '\0')
         comma = ",";
   }
   if(comma[0] == ',')
      o.z.concatx(ln);
}

static void genMethodCallers(CPPGen g, BClass c, BVariant v, const char * cn, bool prototype, BOutput o)
{
   // LIB_EXPORT void (* Surface_clear)(C(Surface) __this, C(ClearType) type);
   bool noHead = c.cl.type == noHeadClass;
   bool content = false;
   int l, maxLen = 0;
   int ind = prototype ? 1 : 0;
   BMethod m; IterMethod itm { c.cl };
   while((m = itm.next(publicNormal)))
   {
      m.init(itm.md, c);
      if((l = strlen(m.mname)) > maxLen) maxLen = l;
   }
   while((m = itm.next(publicNormal)))
   {
      // const char * on = m.name;
      const char * mn = m.mname;
      const char * mncpp = strcmp(mn, "delete") ? strcmp(mn, "union") ? mn : "_union" : "_delete";
      // Type param;
      Type t = m.md.dataType;
      // bool byRefTypedThis = false;
      bool returnAddress = false;
      bool noRet = t.returnType.kind == voidType;
      // bool destVsSrc = false; //!strcmp(mn, "onCopy") ? true : false;
      const char * first = null;
      // const char * nthis = null;
      Type returnType = t.returnType;
      char * typeString = returnType.kind == classType && returnType.classObjectType == anyObject ? CopyString(g_.sym.instance) : printType(t.returnType, false, false, true);
      Class clRegRT;
      BClass cParamRT;
      bool hackRT;
      ClassType ctRT = cppGetClassInfoFromType(m.md.dataType.returnType, true, &clRegRT, &cParamRT, &hackRT, null);
      char * params = null;
      char * args = null;
      TypeInfo argsInfo;

      if(brokenMethodsClass.Find(cn)) continue;
      if(brokenMethods.Find({ cn, m.md.name })) continue;
      if(tryMethodsClass.count > 1 && !tryMethodsClass.Find(cn)) continue;
      if(tryMethods.count > 1 && !tryMethods.Find({ cn, mn })) continue;
      if(m.hasTemplateAnything())
         continue;

      if(!content)
      {
         o.z.concatx(ln);
         content = true;
      }
      o.z.concatx(genloc__, indents(ind));
      if(!prototype && noHead)
         o.z.concatx(cpptemplateNoHeadDef, " ");
      o.z.concat("inline ");
      if(returnType.kind == templateType)
         o.z.concatx("TP(", c.name, ", ", returnType.templateParameter.identifier.string, ")");
      else if((ctRT == normalClass || ctRT == noHeadClass))
      {
         if(ctRT == normalClass)
         {
            if(!strcmp(cParamRT.name, "Instance"))   // Exception
               o.z.concatx(cParamRT.name, " *");
            else
               o.z.concatx(cParamRT.symbolName);
         }
         else if(ctRT == noHeadClass)
            o.z.concatx(cParamRT.symbolName, " *");
      }
      else
         o.z.concatx(strptrNoNamespace(typeString));
      o.z.concatx(" ");
      if(!prototype)
         o.z.concatx(noHead ? cpptemplatePrefix : "", cn, noHead ? cpptemplateNoHeadParams : "", "::");
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
               nthis = "o";
               o.z.concatx(" ", nthis);
               comma = true;
               break;
            //case classPointer: conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
            case typedObject:
            {
               byRefTypedThis = t.byReference;
               returnAddress = ctRT == normalClass || ctRT == noHeadClass;
               nthis = /-*iMetThisNameSwap.Index(mn, false) ? iMetThisNameSwap.data :*-/ "o";
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
            argsInfo = { type = m.md.dataType, m = m, md = m.md, cl = c.cl, c = c };
            o.z.concatx((params = cppParams(c, argsInfo, regMethodCppParamList, v, null, false, comma, &first, null, { })));
         // }
      }
      o.z.concatx(")", prototype ? ";" : "");
      // if(prototype)
      //    o.z.concatx(indents(ind), "// ", cn, "_", mn);
      o.z.concatx(ln);
      if(!prototype)
      {
         bool comma = false;
         if(returnAddress)
            Print("");
         o.z.concatx(genloc__, indents(ind), "{", ln);
         {
            bool comma = false;
            // bool ptrI = !t.thisClass || (t.thisClass.string && !strcmp(t.thisClass.string, "class"));
            char * args = cppParams(c, argsInfo, regMethodArgsPoorObjectPassing2, /*vClass*/null, cn, /*!ptrI*/false, comma, null, null, { });
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
         o.z.concatx(genloc__, indents(ind + 1),    noRet ? "" : "return ", cn, "_", mn, "(");

         switch(t.classObjectType)
         {
            case none:
               if(!m.md.dataType.staticMethod)
               {
                  if(c.cl.type == noHeadClass)
                     o.z.concatx("(C(", c.name, ")*)", "this->");
                  else if(c.cl.type == structClass)
                     o.z.concat("&");
                  o.z.concat("impl");
                  comma = true;
               }
               break;
            //case classPointer: conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
            /*case typedObject:
            {
               byRefTypedThis = t.byReference;
               returnAddress = ctRT == normalClass || ctRT == noHeadClass;
               nthis = /-*iMetThisNameSwap.Index(mn, false) ? iMetThisNameSwap.data :*-/ "o";
               o.z.concatx("XClass * _class, C(Instance) ", byRefTypedThis ? "* " : "", nthis);
               comma = true;
               break;
            }*/
            //case anyObject:    conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
            default:           conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
         }

         o.z.concatx((args = cppParams(c, argsInfo, regMethodArgsPassing2, v, null, false, comma, null, null, { })));
         o.z.concatx(");", ln);
         o.z.concatx(genloc__, indents(ind), "}", ln);
      }
      delete params;
      delete args;
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
      if(skip || memberNames.Find(itmpp.mp.name) || brokenMembers.Find({ cn, itmpp.mp.name }))
         continue;
      if((itmpp.pt && (itmpp.pt.conversion || !itmpp.pt.Set)) || (c.cl.type == structClass && !itmpp.dm))
         continue;
      memberNames.Add(itmpp.mp.name);
      if(itmpp.pt && !itmpp.pt.dataType)
         itmpp.pt.dataType = resolveDataType(c, itmpp.pt.dataTypeString);
      else if(itmpp.dm && !itmpp.dm.dataType)
         itmpp.dm.dataType = resolveDataType(c, itmpp.dm.dataTypeString);
      {
         bool isString = false;
         Type dataType = itmpp.pt ? itmpp.pt.dataType : itmpp.dm ? itmpp.dm.dataType : null;
         Class clDataType = null;
         ClassType ct = cppGetClassInfoFromType(dataType, false, &clDataType, null, null, &isString);
         if(clDataType && clDataType.type == structClass) continue;
         // if(brokenOrderedPublicMembersInitializersTypes.Find()) continue;
         if(/*(!first && */((ct == normalClass && !isString) || ct == noHeadClass)/*)*/ ||
               ct == bitClass ||
               (clDataType && hasOrBaseHasTemplateClass(clDataType)) || dataType.kind == templateType)
            skip = true;
         else if(dataType.kind != functionType && dataType.kind != arrayType)
         {
            if(clDataType && (clDataType.type == unitClass || clDataType.type == bitClass))
               v.processDependency(g, otypedef, otypedef, clDataType);
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
         if(skip || memberNames.Find(itmpp.mp.name) || brokenMembers.Find({ cn, itmpp.mp.name }))
            continue;
         if((itmpp.pt && (itmpp.pt.conversion || !itmpp.pt.Set)) || (c.cl.type == structClass && !itmpp.dm))
            continue;
         memberNames.Add(itmpp.mp.name);
         {
            bool isString = false;
            Type dataType = itmpp.pt ? itmpp.pt.dataType : itmpp.dm ? itmpp.dm.dataType : null;
            const String dataTypeString = itmpp.pt ? itmpp.pt.dataTypeString : itmpp.dm ? itmpp.dm.dataTypeString : null;
            Class clDataType = null;
            ClassType ct = cppGetClassInfoFromType(dataType, false, &clDataType, null, null, &isString);
            if(clDataType && clDataType.type == structClass) continue;
            if(/*(!first && */((ct == normalClass && !isString) || ct == noHeadClass)/*)*/ ||
                  ct == bitClass ||
                  (clDataType && hasOrBaseHasTemplateClass(clDataType)) || dataType.kind == templateType)
               skip = true;
            else if(dataType.kind != functionType && dataType.kind != arrayType) // broken inititializers
            {
               const char * mn = itmpp.mp.name;
               String tz = null;
               TypeInfo ti { type = dataType, typeString = dataTypeString, cl = c.cl };
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
         if(skip || memberNames.Find(itmpp.mp.name) || brokenMembers.Find({ cn, itmpp.mp.name }))
            continue;
         if((itmpp.pt && (itmpp.pt.conversion || !itmpp.pt.Set)) || (c.cl.type == structClass && !itmpp.dm))
            continue;
         memberNames.Add(itmpp.mp.name);
         {
            bool isString = false;
            Type dataType = itmpp.pt ? itmpp.pt.dataType : itmpp.dm ? itmpp.dm.dataType : null;
            BClass cDataType = null;
            Class clDataType = null;
            ClassType ct = cppGetClassInfoFromType(dataType, false, &clDataType, &cDataType, null, &isString);
            if(clDataType && clDataType.type == structClass) continue;
            if(/*(!first && */((ct == normalClass && !isString) || ct == noHeadClass)/*)*/ ||
                  ct == bitClass ||
                  (clDataType && hasOrBaseHasTemplateClass(clDataType)) || dataType.kind == templateType)
               skip = true;
            else if(dataType.kind != functionType && dataType.kind != arrayType)
            {
               const char * mn = itmpp.mp.name;
               bool impl = ct == unitClass;
               bool cast = !normal && ct == enumClass;
               o.z.concatx(genloc__, indents(2), normal ? "this->" : "impl.", mn, " = ",
                     cast ? "(" : "", cast ? cDataType.symbolName : "", cast ? ")" : "", mn,
                     impl ? ".impl" : "", ";", ln);
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
      Type dataType = pt.dataType ? pt.dataType : (pt.dataType = resolveDataType(c, pt.dataTypeString));
      TypeInfo ti { type = dataType, typeString = pt.dataTypeString, c = c, cl = c.cl };
      if(!content)
      {
         o.z.concatx(ln);
         content = true;
      }
      commonMemberHandling(g, c, prototype, cn, tcn, mn, true, pt.Get != null, pt.Set != null, ti, o);
   }
}

static void processDataMembers(CPPGen g, BClass c, BVariant v, const char * cn, bool prototype, BOutput o)
{
   bool content = false;
   DataMember dm; IterDataMember dat { c };
   while((dm = dat.next(all)))
   {
      const char * mn = dm.name; // member name
      Type dataType = dm.dataType ? dm.dataType : (dm.dataType = resolveDataType(c, dm.dataTypeString));
      TypeInfo ti { type = dataType, typeString = dm.dataTypeString, cl = c.cl };
      BitMember bm = (BitMember)dm;

      // todo, recurse struct/union? members for bitfields inside structs i.e.: PolygonRing
      if(bm.type != normalMember) continue;

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
   BClass cType;
   ClassType ct = cppGetClassInfoFromType(ti.type, true, null, &cType, null, &isString);
   String tz = null;
   String tnp2 = null;
   bool bareStyle = (ct == normalClass && !isString) || ct == structClass || ct == unitClass || ct == noHeadClass;
   String tn = cppTypeName(ti, bareStyle, &tz, &tnp2);
   PropertyComponent component;
   Array<PropertyComponent> components { };
   const String implStringThis;
   bool cast = ct == enumClass;
   bool cnst = ct == bitClass; // construct

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
   if(brokenMembers.Find({ cn, mn })) return;
   if(tryMembers.count > 1 && !tryMembers.Find({ cn, mn })) return;

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
      bool addAmp = ct == structClass;
      bool addImpl = bareStyle; // ct == normalClass && !isString)/* || ct == structClass*/; // && strcmp(tn, "constString")
      bool nc = ct == unitClass || ct == structClass; // nc: (n)o (c)lass in constructor
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
                     PrintString(lc, ln, genloc__, indents(ind), cn, "_set_", mn, "(self->impl, ", cast ? "(" : "", cast ? cType.symbolName : "", cast ? ")" : "", addAmp ? "&" : "", "v", addImpl ? ".impl" : "", ");") ] };
            }
         }
         components.Add(component);
      }
      else if(genSet)
      {
         component = { macroPropSet, mn, CopyString(tn), tnp2 ? CopyString(tnp2) : null };
         if(!prototype)
         {
            if(isProp)
               component.code = { [
                  // PrintString(lc, ln, genloc__, indents(ind), cn, "_set_", mn, "(", implStringThis, ", v);") ] };
                     PrintString(lc, ln, genloc__, indents(ind), cn, "_set_", mn, "(", implStringThis, ", ", cast ? "(" : "", cast ? cType.symbolName : "", cast ? ")" : "", addAmp ? "&" : "", "v", addImpl ? ".impl" : "", ");") ] };
            else if(c.cl.type == normalClass)
               component.code = { [
                     PrintString(lc, ln, genloc__, indents(ind), "IPTR(self->impl, ", cn, ")->", mn, " = ", cast ? "(" : "", cast ? cType.symbolName : "", cast ? ")" : "", "v", addImpl ? ".impl" : "", ";") ] };
            else if(c.cl.type == noHeadClass)
               component.code = { [
                     PrintString(lc, ln, genloc__, indents(ind), "((", c.symbolName, " *)self->impl)->", mn, " = v", addImpl ? ".impl" : "", ";") ] };
            else if(c.cl.type == bitClass)
               component.code = { [
                     PrintString(lc, ln, genloc__, indents(ind), c.upper, "_SET_", mn, "(self->impl, v", addImpl ? ".impl" : "", ");") ] };
            else
               component.code = { [
                     PrintString(lc, ln, genloc__, indents(ind), "((", c.symbolName, " *)&self->impl)->", mn, " = ", cast ? "(" : "", cast ? cType.symbolName : "", cast ? ")" : "", "v", addImpl ? ".impl" : "", ";") ] };
         }
         components.Add(component);
      }
      if(genGet)
      {
         String valDecl;
         bool vAmp = ct == structClass;
         bool tAmp = c.cl.type == structClass;
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
                        PrintString(lc, ln, genloc__, indents(ind), tn, tnp2 ? tnp2 : "", " value;", cn, "_get_", mn, "(", tAmp ? "&" : "", "self->impl", ", ", vAmp ? "&" : "", "value", addImpl ? ".impl" : "", "); "),
                        PrintString(lc, ln, genloc__, indents(ind), "return value;") ] };
               else if(addImpl)
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), tn, tnp2 ? tnp2 : "", " value(", cn, "_get_", mn, "(", c.cl.type == structClass ? "&" : "", "self->impl)", nc ? "" : ", ", nc ? "" : c.cl.type == noHeadClass ? cpptemplatePrefix : "", nc ? "" : cn, nc ? "" : "::_class", "); "),
                        PrintString(lc, ln, genloc__, indents(ind), "return value;") ] };
               else
                  component.code = { [
                     // PrintString(lc, ln, genloc__, indents(ind), "return ", cn, "_get_", mn, "(self->impl);") ] };
                        PrintString(lc, ln, genloc__, indents(ind), "return ", cast ? "(" : "", cast ? cType.name : "", cast ? ")" : "", cn, "_get_", mn, "(", implStringThis, ");") ] };
            }
            else if(c.cl.type == normalClass)
            {
               if(addImpl)
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), tn, tnp2 ? tnp2 : "", " value(IPTR(self->impl, ", cn, ")->", mn, nc ? "" : ", ", nc ? "" : cn, nc ? "" : "::_class", ");"),
                  // Container value(((C(Iterator))self->impl).container, Iterator::_class); return value;
                  //  TIH<Container> value((C(Iterator))self->impl).container); return value;
                  // component.code = { [
                  //       PrintString("TIH<", tn, tnp2 ? tnp2 : "", "> value(IPTR(self->impl, ", cn, ")->", mn, ", ", cn, "::_class); "),
          //  gd.concatx("self ? ", tn, " value(IPTR(self->impl, ", cn, ")->", mn, ", ", cn, "::_class); ", "return value;", " : ", tz, ";");
          // note: this is apparently missing a self check for when different == true ... but that seems broken...  ? : syntax spanning
          //       two lines of code...
                        PrintString(lc, ln, genloc__, indents(ind), "return value;") ] };
               else
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), "return self ? ", cnst ? cType.name : "", (cast || cnst) ? "(" : "", cast ? cType.name : "", cast ? ")" : "", "IPTR(self->impl, ", cn, ")->", mn, cnst ? ")" : "", " : ", tz, ";") ] };
            }
            else if(c.cl.type == noHeadClass)
            {
               if(addImpl)
                  // component.code = { [
                  //       PrintString(tn, tnp2 ? tnp2 : "", " value(((", c.symbolName, " *)self->impl)->", mn, ", ", cn, "::_class); "),
                  // Container value(((C(Iterator))self->impl).container, Iterator::_class); return value;
                  //  TIH<Container> value((C(Iterator))self->impl).container); return value;
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), valDecl, " value(((", c.symbolName, " *)self->impl)->", mn, "); "),
                        PrintString(lc, ln, genloc__, indents(ind), "return value;") ] };
               else
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), "return self ? ((", c.symbolName, " *)self->impl)->", mn, " : ", tz, ";") ] };
            }
            else if(c.cl.type == bitClass)
            {
               component.code = { [
                     PrintString(lc, ln, genloc__, indents(ind), "return ", cast ? "(" : "", cast ? cType.name : "", cast ? ")" : "", c.upper, "_", mn, "(self->impl);") ] };
            }
            else
            {
               if(addImpl)
                  // component.code = { [
                  //       PrintString(tn, tnp2 ? tnp2 : "", " value(((", c.symbolName, ")self->impl).", mn, ", ", cn, "::_class); "),
                  // Container value(((C(Iterator))self->impl).container, Iterator::_class); return value;
                  //  TIH<Container> value((C(Iterator))self->impl).container); return value;
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), valDecl, " value(((", c.symbolName, " *)&self->impl)->", mn, ");"),
                        PrintString(lc, ln, genloc__, indents(ind), "return ", bareStyle ? "" : "*", "value;") ] };
               else
                  component.code = { [
                        PrintString(lc, ln, genloc__, indents(ind), "return self ? ", cnst ? cType.name : "", (cast || cnst) ? "(" : "", cast ? cType.name : "", cast ? ")" : "", "((", c.symbolName, " *)&self->impl)->", mn, cnst ? ")" : "", " : ", tz, ";") ] };
            }
         }
         delete valDecl;
         components.Add(component);
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
   bool isString = false;
   // Class clRegRet;
   ClassType ct = cppGetClassInfoFromType(ti.type, true, null/*&clRegRet*/, null, null, &isString);
   ZString z { allocType = heap };
   // BClass cRegRet = clRegRet;
   //cppTypeNameCall = true;
   // note: calling zTypeName creates templaton output objects with null z
   if(isString)
      z.concat("char *");
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
      if(ct == normalClass || ct == noHeadClass) // ?
         *typeZero = CopyString("0"/*"null"*/); // is 'null' desireable?
      else if(ct == structClass)
         *typeZero = PrintString("(const ", z._string, "){ 0 }");
      else if(ct == systemClass)
         *typeZero = CopyString("0");
      else if(ct == enumClass)
         *typeZero = PrintString("(", z._string, ")0"); // todo: false / true
      else if(ct == bitClass)
         *typeZero = PrintString(z._string, "((C(", z._string, "))0)");
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

void cppTypeSpec(ZString z, const char * ident, TypeInfo ti, OptBits opt, BVariant vTop)
{
   TypeNameList list { };
   astTypeName(ident, ti, opt, vTop, list);
   ec2PrintToZedString(z, list, false);
   list.Free();
   delete list;
}

ClassType cppGetClassInfoFromType(Type type, bool hackTemplates, Class * clRegRet, BClass * cParamRet, bool * hackRet, bool * isString)
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
   return ct;
}

enum CPPParamsOutputMode
{
   regMethodParamList,
   regMethodCppParamList,
   regMethodArgsPassingCppFromEc,
   regMethodArgsPassing2,
   regMethodLocalConvEcToCppVarsForArgsPassing,
   regMethodArgsPoorObjectPassing2,
   _argParamList,
   _argSpecialThisParamList,
   passing
};

struct ParamsOptions
{
   bool forMethodCallers; // todo
   bool cppDirectObjects;
   const String utilStr1;
};

char * cppParams(BClass c, TypeInfo ti, CPPParamsOutputMode mode, BVariant vClass, const char * cn,
      bool addthisarg, bool comma, const char ** first, const char ** nameParamOfClassType, ParamsOptions opts)
{
   char * result;
   ZString z { allocType = heap };
   Type t = ti.type;
   bool noParams = t.params.count == 0 || (t.params.count == 1 && ((Type)t.params.first).kind == voidType);
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
                     firstParam = ProcessTypeString("Instance", false);
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
            if(((mode == regMethodParamList || mode == regMethodCppParamList || mode == regMethodArgsPassingCppFromEc ||
                  mode == regMethodArgsPassing2 || mode == regMethodLocalConvEcToCppVarsForArgsPassing || mode == regMethodArgsPoorObjectPassing2) &&
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
                  ClassType ct = cppGetClassInfoFromType(param, true, &clReg, &cParam, &hack, null); // todo: get the isString?
                  if(!name) apname = firstParam ? CopyString(opts.utilStr1 ? opts.utilStr1 : "o") : PrintString("ap", ++ap), name = apname;
                  if(!strcmp(name, "obsolete"))
                     ; //conmsg("step");
                  z.concatx(sep);

                  switch(mode)
                  {
                     case regMethodParamList:
                     case regMethodCppParamList:
                     {
                        //const char * name = iMetParNamSwp.Index({ ti.m.mname, param.name }, false) ? iMetParNamSwp.data : param.name;
                        //const char * typeString = param.kind == classType && param.classObjectType == anyObject ? g.sym.instance : tokenTypeString(param);
                        bool cpp = mode == regMethodCppParamList;
                        char * typeString = null;

                        // if(notSelf && param.kind == classType && !(cParam && cParam.isString) &&
                        //       (ct == normalClass || (cpp && ct == noHeadClass)) && cpp)
                        //    z.concatx("const ");

                        if(param.kind == templateType)
                           typeString = PrintString("TP(", c.name, ", ", param.templateParameter.identifier.string, ")");
                        else if(param.kind == classType && param.classObjectType == anyObject)
                           typeString = CopyString(g_.sym.instance);
                        else if(param.kind == classType && param._class && param._class.registered && param._class.registered.templateClass)
                        {
                           // todo -- c.name is wrong, tofix
                           if(cpp && (ct == normalClass || ct == noHeadClass))
                              typeString = CopyString(c.name);
                           else
                              typeString = PrintString("C(", c.name, ")");
                        }
                        else if(cParam && param.kind == classType && cParam.isString)
                        {
                           bool bare = (ct == bitClass || ct == enumClass || ct == normalClass);
                           cppTypeSpec(z, "ident___", { type = param, cl = ti.cl }, { anonymous = true, bare = bare, cpp = true }, ti.cl);
                        }
                        else
                        {
                           if(cpp && (ct == normalClass || ct == noHeadClass || ct == enumClass || ct == bitClass)) normalClassMacroOverride = true;
                           typeString = printType(param, false, false, true);
                           if(cpp && (ct == normalClass || ct == noHeadClass || ct == enumClass || ct == bitClass)) normalClassMacroOverride = false;
                        }
                        if(cpp && (ct == normalClass || ct == noHeadClass || ct == bitClass || ct == enumClass || ct == unitClass) &&
                              !cParam.isBool && !(vClass.kind == vclass && cParam == vClass.c))
                           vClass.processDependency(g_, otypedef, otypedef, cParam.cl);

                        if(first && !firstParam && !*first) *first = name;
                        if(nameParamOfClassType && !firstParam && !*nameParamOfClassType &&
                              clReg && !strcmp(clReg.name, ti.cl.name))
                           *nameParamOfClassType = name;
                        if(typeString)
                           z.concatx(strptrNoNamespace(typeString));
                        if((param.kind == classType && ((ct == noHeadClass && !cpp) || ct == structClass)) ||
                           (firstParam && t.classObjectType == typedObject && t.byReference))
                           z.concatx(" *");
                        else if(param.kind == classType &&
                              (ct == normalClass || (cpp && ct == noHeadClass)) && (cpp || (cParam && cParam.isString)))
                           z.concatx(" &");
                        z.concatx(" ", name);
                        delete typeString;
                        if(!sep[0]) sep = ", ";
                        break;
                     }
                     case regMethodLocalConvEcToCppVarsForArgsPassing:
                     case regMethodArgsPoorObjectPassing2: // tocheck: is this also same and rename?
                     {
                        bool forMethodCallers = mode == regMethodArgsPoorObjectPassing2;
                        if(param.kind == classType && param.classObjectType == anyObject)
                           z.concatx("TIH<", c.name, "> ", name, "_l(", name, "); ");
                        else if(ct == normalClass && !forMethodCallers && !cParam.isString)
                           z.concatx("TIH<", cParam.name, "> ", name, "_l(", name, "); ");
                        else if(ct == noHeadClass && !forMethodCallers)
                        {
                           if(clReg && mode == regMethodLocalConvEcToCppVarsForArgsPassing)
                              vClass.processDependency(g_, otypedef, otypedef, clReg);
                           z.concatx(cParam.name, " ", name, "_l(", name, "); ");
                        }
                        break;
                     }
                     case regMethodArgsPassingCppFromEc:
                     case regMethodArgsPassing2: // tocheck: is this also same and rename?
                     {
                        int ptr = 0;
                        bool forMethodCallers = mode == regMethodArgsPassing2;
                        bool inReg = opts.cppDirectObjects;
                        if(param.kind == classType && param.classObjectType == anyObject)
                           z.concatx("*", name, "_l");
                        else if(!forMethodCallers && !inReg && ct == normalClass && !cParam.isString)
                           z.concatx("*", name, "_l");
                        else if(!forMethodCallers && !inReg && ct == noHeadClass)
                           z.concatx(name, "_l");
                        else if(forMethodCallers && !opts.cppDirectObjects && ((ct == normalClass && !cParam.isString) || ct == noHeadClass))
                           z.concatx(name, ".impl");
                        else if(!forMethodCallers && !inReg && typeIsBoolOrPtrTo(param, &ptr) && ptr)
                        {
                           z.concatx("(bool", ptr ? " " : "", stars(ptr, 0), ")", name);
/*
issue: bool-trouble
sizeof(bool) is 1, sizeof(C(bool)) is 4
so those are very incompatible pointers

for the bool, the proper fix is to declare a local bool etc.
   bool cppIsCompressed = isCompressed ? *isCompressed : false;
and after the call
even for bool vs C(bool) ?
and
     isCompressed ? &cppIsCompressed : null
and after
 if(isCompressed) *isCompressed = cppIsCompressed;
bool vs. C(bool) should not be an issue...
*/
                        }
                        else if(ct == enumClass)
                           z.concatx("(", forMethodCallers ? cParam.symbolName : cParam.name, ")", name);
                        else
                           z.concat(name);
                        if(!sep[0]) sep = ", ";
                        break;
                     }
                     case _argParamList:
                     case _argSpecialThisParamList:
                     {
                        bool bare = (ct == bitClass || ct == enumClass || ct == normalClass/* || ct == noHeadClass*/);
                        // bool bare = (ct == bitClass || ct == enumClass/* || ct == normalClass*/);

                        if(hack)
                        {
                           z.concatx(cParam.name, " /*");
                           cppTypeSpec(z, "ident___", { type = param, cl = ti.cl }, { anonymous = true, bare = bare, cpp = true }, ti.cl);
                           z.concatx("*/");

                           if(ct == normalClass || ct == noHeadClass)
                              z.concatx(" &");
                        }
                        else if(param.kind == classType && param.classObjectType == anyObject)
                           z.concatx(cn, " &");
                        else
                        {
                           cppTypeSpec(z, "ident___", { type = param, cl = ti.cl }, { anonymous = true, bare = bare, cpp = true }, ti.cl);
                           if(param.kind == classType)
                           {
                              if(ct == normalClass/* || ct == noHeadClass*/)
                                 z.concat(" &");
                              else if(ct  == structClass)
                                 z.concat(" *");
                           }
                        }

                        //if(!name[0])
                        //   conmsg("noname");
                        z.concatx(" ", name);//, " ? ", name);
                        if(mode == _argSpecialThisParamList && !noParams)
                           z.concat(" _ARG");
                        break;
                     }
                     case passing:
                     {
                        int ptr = 0;
                        bool cast = ct == enumClass;
                        if(typeIsBoolOrPtrTo(param, &ptr) && ptr) // see above: issue: bool-trouble
                           z.concatx("(C(bool)", ptr ? " " : "", stars(ptr, 0), ")");
                        z.concatx(cast ? "(" : "", cast ? cParam.symbolName : "", cast ? ")" : "", name);
                        if(hack || ct == bitClass || ct == noHeadClass || (ct == normalClass && !cParam.isString) ||
                              (param.kind == classType && param.classObjectType == anyObject))
                           z.concat(".impl");
                        break;
                     }
                  }
                  if(!sep[0] && mode == _argParamList) sep = " _ARG ";
                  delete apname;
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
         else
            PrintLn("error: unexpected kind (", v.kind, ") of splitContents");
      }
   }
}

/*
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
            f.Puts(c.outImplementation.z._string);
         }
         else
            PrintLn("error: unexpected kind (", v.kind, ") of implementationsContents");
      }
   }
}
*/

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
      // hack
      // todo, dependency iterating?
      f.PrintLn(genloc__, "#include \"eC.hpp\"");
      if(!strcmp(g.lib.moduleName, "gnosis2")) // hack, todo
      {
         f.PrintLn(genloc__, "#include \"ecere.hpp\"");
         f.PrintLn(genloc__, "#include \"EDA.hpp\"");
      }
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
enum MacroMode { configuration, expansion, use, encapsulation, definition };
enum MacroModeAll { use, expansion = 0xFFFFFFFF };
/*
#if 0
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
#endif // 0
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
   const char * lc = mode == definition ? " \\" : "";    // lc: line continuation
   switch(mode)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define _REGISTER_CLASS(", n, ", ", ns, ", ", bs, ", ", module, ")", lc, ln);
         ind++;
      case expansion:
#if 0
public dllexport Class eSystem_RegisterClass(ClassType type, const char * name, const char * baseName, int size, int sizeClass,
                             bool (* Constructor)(void *), void (* Destructor)(void *),
                             Module module, AccessMode declMode, AccessMode inheritanceAccess)
#endif // 0
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
   switch(mode)
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
   switch(mode)
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
   switch(mode)
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
      const char * a,      // a? we use the module parameter of *_cpp_init(Module & module)
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
      const char * a,      // a? we use the module parameter of *_cpp_init(Module & module)
      void * unused)
{
   switch(mode)
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
            cppMacroIntRegisterClass(g, o, mode, ind + 2, n, ns, bs, a, 0);
            delete ns;
#if 0
   (Class *)eC_registerClass(ClassType_normalClass, ns, bs, sizeof(Instance *), 0, \
      (C(bool) (*)(void *)) n::constructor, (void(*)(void *)) n::destructor, (a).impl, AccessMode_privateAccess, AccessMode_publicAccess)
#endif // 0
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
   const char * lc = mode == definition ? " \\" : "";    // lc: line continuation
   // const char * lt = mode == definition ? "" : " { }";   // lt: line termination
   if(mode == configuration)
      mode = g.macroModeBits.intConstructClass ? expansion : use;
   switch(mode)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define _CONSTRUCT(", c, ", ", b, ")", lc, ln);
         ind++;
      case expansion:
            // if(mode != definition) o.concatx(ln);
            cppMacroClassVirtualMethods(g, o, mode == definition ? encapsulation : configuration, true, template, ind, "INSTANCE", c, g.cInstance, g.cclass, g.cInstance, 0);
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
            if(mode != expansion) o.concatx(ln);
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
   const char * lc = mode == definition ? " \\" : "";    // lc: line continuation
   // const char * lt = mode == definition ? "" : " { }";   // lt: line termination
   if(mode == configuration)
      mode = g.macroModeBits.intConstructClass ? expansion : use; // todo: switch to own instead of intConstructClass
   switch(mode)
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
            if(mode != expansion) o.concatx(ln);
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
   bool te = template;
   const char * lc = mode == definition ? " \\" : "";    // lc: line continuation
   const char * sc = mode == expansion ? "" : " ## ";    // sc: symbol concatenation
   char * cx = te ? PrintString("T", sc, c, " ", t) : CopyString(c);
   const char * sso = mode == expansion ? "\"" : "#";    // sso: symbol stringification open
   const char * ssc = mode == expansion ? "\"" : "";     // ssc: symbol stringification close
   if(mode == configuration)
      mode = g.macroModeBits.constructClass ? expansion : use; // todo?: own bit for template vs normal
   switch(mode)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define ", te ? cpptemplatePrefix : "", "CONSTRUCT(", c, ", ", b, te ? ", " : "", te ? t : "", ")", lc, ln);
         ind++;
      case expansion:
         if(template)
         {
            // todo: expansion
            cppMacroMoveConstructors(g, o, mode == definition ? encapsulation : configuration, ind, /*c*/cx, 0);
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
            cppMacroMoveConstructors(g, o, mode == definition ? encapsulation : configuration, ind, c, 0);
            o.concatx(lc, ln);
            o.concatx(genloc__, indents(ind), c, "() : ", c, "((", g_.sym.instance, ")Instance_newEx(_class.impl, false), _class) { }", lc, ln);
            //o.concatx(genloc__, indents(ind + 1), "_CONSTRUCT(", c, ", ", b, ")", ln);
            cppMacroIntConstructClass(g, o, mode == definition ? encapsulation : configuration, template, ind, c, b, 0);
            if(mode != expansion) o.concatx(ln);
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
   const char * lc = mode == definition ? " \\" : "";    // lc: line continuation
   switch(mode)
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
      uint ind,            // indentation
      void * unused) {     // unused
   cppMacroClassRegister(g, o, definition, true, ind, null,
         0); }

static void cppMacroClassRegister(
      CPPGen g,            // generator
      ZString o,           // output
      MacroMode mode,
      bool prototype,
      uint ind,            // indentation
      BClass c,
      void * unused)
{
   bool pe = prototype;
   const char * lc = mode == definition ? " \\" : "";       // lc: line continuation
   const char * pt = pe && mode == expansion ? ";" : "";   // pt: prototype termination
   switch(mode)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define REGISTER()", lc, ln);
         ind++;
      case expansion:
      {
         bool te = c && c.cl.type == normalClass && c.cl.templateArgs;
         o.concatx(genloc__, indents(ind));
         if(pe)
            o.concat("static ");
         else if(te)
         {
            if(c.isContainer)
               o.concatx(cpptemplateTemplateTypeDef, " ");
            else
               o.concatx(cpptemplateTemplateClassDef, " ");
         }
         o.concatx("void ");
         if(!pe)
            o.concatx(te ? cpptemplatePrefix : "", c.name, te ? "<TPT>" : "", "::");
         o.concatx("class_registration(CPPClass & _class)", pt, ln);
         break;
      }
      case use:
      case encapsulation:
         o.concatx(genloc__, indents(ind), "REGISTER(",
                     ")");
         break;
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
   const char * lc = mode == definition ? " \\" : "";    // lc: line continuation
   if(mode == configuration)
      mode = g.macroModeBits.classRegistration ? expansion : use;
   switch(mode)
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
            m.init(itm.md, c.isInstance ? cBase : c);
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
               BClass cParamRT;
               bool hackRT;
               ClassType ctRT = cppGetClassInfoFromType(m.md.dataType.returnType, true, &clRegRT, &cParamRT, &hackRT, null);
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
               const String d = mode == definition ? "d" : cn;

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
         /*       r.concatx(cParamRT.symbolName);
                  if(ctRT == noHeadClass)
                     r.concatx(" *");   */
                  if(ctRT == normalClass)
                  {
                     if(!strcmp(cParamRT.name, "Instance"))
                        r.concatx(cParamRT.symbolName);
                     else
                        r.concatx(cParamRT.symbolName);
                  }
                  else if(ctRT == noHeadClass)
                     r.concatx(cParamRT.symbolName, " *");
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
                        nthis = "o";
                        // p.concatx(" ", nthis);
                        // comma = true;
                        break;
                     //case classPointer: conmsg("ClassObjectType::", t.classObjectType, " is not handled here. todo?"); break;
                     case typedObject:
                     {
                        byRefTypedThis = t.byReference;
                        returnAddress = ctRT == normalClass || ctRT == noHeadClass;
                        nthis = /*iMetThisNameSwap.Index(mn, false) ? iMetThisNameSwap.data :*/ "o";
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
                  params = cppParams(c, argsInfo, regMethodParamList, vClass, cn, true, comma, &first, &nameParamOfClassType, { });
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
                  char * args = cppParams(c, argsInfo, regMethodLocalConvEcToCppVarsForArgsPassing, vClass, cn, !ptrI, comma, null, null, { });
                  code.concat(args);
                  delete args;
               }
               if(!noRet)
               {
                  bool cast = ctRT == enumClass;
                  if(returnType.kind == templateType)
                     code.concatx("TP(", c.name, ", ", returnType.templateParameter.identifier.string, ")");
                  else if((ctRT == normalClass || ctRT == noHeadClass))
                  {
               /*    if(ctRT == normalClass)
                        code.concatx(cParamRT.name, " *");
                     else if(ctRT == noHeadClass)
                        code.concatx(cParamRT.symbolName, " *");   */

                     if(ctRT == normalClass)
                     {
                        // if(cParamRT.isInstance)   // Exception
                           code.concat(cParamRT.name/*, " *"*/);
                           if(returnAddress)
                              code.concat(" *");
                        // else
                        //    code.concatx(cParamRT.symbolName);
                     }
                     else if(ctRT == noHeadClass)
                        code.concatx(cParamRT.symbolName, " *");
                  }
                  else
                     code.concatx(strptrNoNamespace(typeString));

                  code.concatx(" ret = ", cast ? "(" : "", cast ? cParamRT.symbolName : "", cast ? ")" : "");

                  if(returnAddress) code.concatx(" &");
               }
               {
                  bool comma = false;
                  bool ptrI = !t.thisClass || (t.thisClass.string && !strcmp(t.thisClass.string, "class"));
                  code.concatx("fn(");
                  if(ptrI)
                  {
                     code.concatx("*i");
                     comma = true;
                  }
                  code.concatx((args = cppParams(c, argsInfo, regMethodArgsPassingCppFromEc, vClass, cn, !ptrI, comma, null, null, { })));
                  code.concatx(")");
               }
               if(!noRet)
               {
                  code.concatx("; return ");
                  if(returnAddress)
                     code.concat("ret ? ret->impl : null;");
                  else
                  {
                     code.concat("ret");
                     if(ctRT == normalClass)
                        code.concat(".impl");
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
                     for(param = t.params.first; param; param = param.next)
                     {
                        const char * name = i.Index({ mn, param.name }, false) ? i.data : param.name;
                        if(!name)
                           apname = PrintString("ap", ++ap);
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
                  rv.concatx("(");
                  if(returnType.kind == templateType)
                     rv.concatx("TP(", c.name, ", ", returnType.templateParameter.identifier.string, ")");
                  else if(ctRT == noHeadClass || ctRT == normalClass)
                     rv.concatx(cParamRT.symbolName);
                  else
                     rv.concatx(strptrNoNamespace(typeString));
                  if(ctRT == noHeadClass)
                     rv.concatx(" *");
                  rv.concatx(")");
                  if(ctRT == normalClass || ctRT == noHeadClass || (ctRT == systemClass && typeString && strstr(typeString, "char *")))
                     rv.concatx("null");
                  else
                     rv.concatx("1");
               }

               if(t.classObjectType == typedObject)
                  cppMacroRegisterTypedMethod(g, o, mode == definition ? encapsulation : /*configuration*/mode, template, ind,
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
                  cppMacroRegisterMethod(g, o, mode == definition ? encapsulation : /*configuration*/mode, template, ind,
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
         if(mode == expansion)
            o.concatx(genloc__, indents(ind));
         o.concatx(c.name, "_class_registration(", c.name, ")");
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
   const char * lc = mode == definition ? " \\" : "";    // lc: line continuation
   if(mode == configuration)
      mode = g.macroModeBits.classRegistration ? expansion : use;
   switch(mode)
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
            m.init(itm.md, c);
            if(brokenMethods.Find({ c.name, itm.md.name }))
               continue;
            if(m.hasTemplateAnything())
               continue;
            if((len = strlen(m.mname)) > maxNameLen)
               maxNameLen = len;
            {
               Type t = m.md.dataType;
               TypeInfo argsInfo { type = t, m = m, md = m.md, cl = c.cl, c = c };
               char * paramsDef = cppParams(c, argsInfo, regMethodCppParamList, vClass, cn, true, false, null, null, { utilStr1 = "self" });
               paramsDefs.Add(paramsDef);
               if((len = strlen(paramsDef)) > maxDefLen)
                  maxDefLen = len;
            }
         }
         while((m = itm.next(publicVirtual)))
         {
            m.init(itm.md, c.isInstance ? cBase : c);
            if(brokenMethods.Find({ c.name, itm.md.name }))
               continue;
            if(m.hasTemplateAnything())
               continue;
            {
               const char * mn = m.mname;
               char * paramsDef = paramsDefs.firstIterator.data;
               Type t = m.md.dataType;
               TypeInfo argsInfo { type = t, m = m, md = m.md, cl = c.cl, c = c };
               char * paramsPassing = cppParams(c, argsInfo, regMethodArgsPassingCppFromEc, vClass, null, false, false, null, null, { cppDirectObjects = true });
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
            if(c.isInstance)
               Print("");
            if(c.isInstance)
               c = c.cl.base;
            BMethod m; IterMethod itm { c.cl };
            while((m = itm.next(publicVirtual)))
            {
               m.init(itm.md, c);
               {
                  const char * mn = m.mname;
                  if(brokenMethods.Find({ c.name, itm.md.name }) || brokenRegs.Find({ c.name, itm.md.name }))
                     continue;
                  if(m.hasTemplateAnything())
                     continue;
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
   const char * lc = mode == definition || mode == encapsulation ? " \\" : "";   // lc: line continuation
   //const char * sc = mode == expansion ? "" : " ## ";                            // sc: symbol concatenation
   if(mode == configuration)
      mode = g.macroModeBits.virtualMethod ? expansion : use;
   switch(mode)
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
         const char * cn = mode == definition ? "c" : /*c.name*/cname;
         const char * bn = cname; // /*mode == definition ? "b" : *//*c.isInstance ? */c.name/* : cBase.name*/; // tocheck: what's up here? isn't b for base class name?
         const char * sn = c.symbolName;
         MacroMode submode = mode == definition ? use : mode;
         //MacroMode submode = mode == definition ? true ? expansion : use : mode;
         const char * lc = submode == expansion ? "" : " \\";     // lc: line continuation
         BMethod m; IterMethod itm { c.isInstance ? cBase.cl : c.cl };
         while((m = itm.next(publicVirtual)))
         {
            m.init(itm.md, c.isInstance ? cBase : c);
            if(brokenMethods.Find({ c.name, itm.md.name }))
               continue;
            if(m.hasTemplateAnything())
               continue;
            // if(!itm.md.dataType.thisClass.type && itm.md.dataType.thisClass && itm.md.dataType.thisClass.string)
            //    itm.md.dataType.thisClass.type = ProcessTypeString(itm.md.dataType.thisClass.string, false);
            {
               char * params = null;
               char * args = null;
               const char * mn = m.mname, * tn = m.s;
               Type t = m.md.dataType;
               Class clRegRT;
               BClass cParamRT;
               bool hackRT;
               // ctRT is return type's class type
               ClassType ctRT = cppGetClassInfoFromType(t.returnType, true, &clRegRT, &cParamRT, &hackRT, null);
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
                  bool ptrI = !t.thisClass || (t.thisClass.string && !strcmp(t.thisClass.string, "class"));
                  BClass cThis = t.thisClass && strcmp(t.thisClass.string, "class") ? t.thisClass.registered : null;
                  char * s1 = null;
                  char * s2 = null;
                  char * s3 = null;
                  const char * s4;
                  ZString s3z { allocType = heap };
                  const char * mncpp = strcmp(mn, "delete") ? strcmp(mn, "union") ? mn : "_union" : "_delete";
                  // if(cParamRT && !strcmp(cParamRT.name, "IteratorPointer"))
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
                     s3z.concatx((args = cppParams(c, argsInfo, passing, vClass, null, false, false, null, null, { })));
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
                     s3z.concatx((args = cppParams(c, argsInfo, passing, vClass, null, false, false, null, null, { })));
                     s3z.concatx(");", lc, ln);

                     s3z.concatx(genloc__, indents(ind + 2), "return ");
                     if(ctRT == noHeadClass)
                        s3z.concatx("ret", cParamRT.name, ";");
                     else if(!strcmp(cParamRT.name, "Instance"))
                        s3z.concatx("*(", cParamRT.name, " *)INSTANCEL(ret", cParamRT.name, ", ret", cParamRT.name, "->_class);");
                     else
                        s3z.concatx("*(", cParamRT.symbolName, " *)INSTANCEL(ret", cParamRT.name, ", ret", cParamRT.name, "->_class);");
                  }
                  else
                  {
                     bool cast = ctRT == enumClass;
                     s3z.concatx("return ", cast ? "(" : "", cast ? cParamRT.name : "", cast ? ")" : "");
                     if(c.isInstance) s3z.concatx("Instance"); // Instance_* prefix for base instance methods
                     s3z.concatx(tn, "(");
                     if(c.isInstance || c.cl.type != normalClass)
                        s3z.concatx("_class.impl, ");
                     s3z.concatx("self ? self->impl : (", sn, ")null");
                     if(!(c.isInstance || c.cl.type != normalClass) && !itm.md.dataType.staticMethod && !c.is_class && itm.md.dataType.thisClass && itm.md.dataType.thisClass.string)
                     {
                        s3z.concatx(", ");
                        s3z.concatx("o.impl"/*" : (", cThis ? cThis.name : sn, ")null"*/);
                     }
                     s3z.concatx((args = cppParams(c, argsInfo, passing, vClass, null, false, false, null, null, { })));
                     s3z.concatx(");");
                  }
                  s4 = s3z._string;

                  // c is owning class
                  if(c.cl.type == normalClass && !c.isInstance)
                     s1 = /*opt1 ? PrintString("C(", cParamRT.name, ")") : */cppTypeName(ti, false /*true*/, null, null); // todo tnp2
                  else
                     s1 = opt1 ? CopyString("Instance &" /*cParamRT.name*/) : cppTypeName(ti, true, null, null); // todo tnp2

                  /*if(t.thisClass && t.thisClass.registered)
                  {
                     Class clReg = t.thisClass.registered;
                     BClass cReg = clReg;
                     // o.concatx("C(", clReg.name, ")");
                     s2 = PrintString(cReg.is_class ? "Instance" : clReg.name, " & o", hasArgs ? " _ARG" : "");
                  }
                  else*/
                     s2 = PrintString(cThis ? cThis.name : cn, " &"/*, " o"*/, hasArgs ? " _ARG" : "");

                  if(ptrI)
                     s3 = CopyString("");
                  else
                     s3 = cppParams(c, argsInfo, _argSpecialThisParamList, vClass, cn, true, false, null, null, { });

                  if(cParamRT && !cParamRT.isBool && !(vClass.kind == vclass && cParamRT == vClass.c))
                     vClass.processDependency(g, otypedef, otypedef, cParamRT.cl);

                  cppMacroVirtualMethod(g, o, submode, prototype, template, ind + g.options.expandMacros && !prototype ? 0 : 1,
                        mn, mncpp, template ? c.name : cn, template ? "<TPT>" : "", bn, s1, s2, s3,
                        (params = cppParams(c, argsInfo, _argParamList, vClass, cn, false, false, null, null, { })), s4, 0);
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
   bool te = template;
   const char * lc = mode == expansion ? "" : " \\";     // lc: line continuation
   const char * sc = mode == expansion ? "" : " ## ";    // sc: symbol concatenation
   const char * pt = prototype ? ";" : "";               // pt: prototype termination
   char * cx = template ? PrintString("T", sc, c, " ", t) : CopyString(c);
   switch(mode)
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
   bool te = template;
   const char * lc = mode == definition ? " \\" : "";    // lc: line continuation
   const char * sc = mode == expansion ? "" : " ## ";    // sc: symbol concatenation
   const char * pt = mode == expansion ? ";" : "";       // pt: prototype termination
   const char * edq = mode == expansion ? "\"" : ""; // edq: expansion double quotes
   const char * eop = mode == expansion ? "(" : "";  // eop: expansion open parenthesis
   const char * ecp = mode == expansion ? ")" : "";  // eop: expansion close parenthesis
   char * cx = te ? PrintString("T", sc, c, " ", t) : CopyString(c);
   switch(mode)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define _", te ? "T" : "", "REGISTER_METHOD(", cp1, ", ", cp2, ", ", ns, ", ",
               n, ", ", bc, ", ", c, ", ", te ? t : "", te ? ", " : "", r, ", ", p, ", ", ocl, ", ", oi, ", ", code, ", ", ea, ", ", rv, ")", lc, ln);
         ind++;
      case expansion:
            o.concatx(genloc__, indents(ind), "addMethod(_class.impl, ", edq, ns, edq, ", (void *) +[]", eop, p, ecp, lc, ln);
            o.concatx(genloc__, indents(ind), "{", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "XClass * cl = (", ocl, ") ? (XClass *)(", ocl, ")->_class : null;", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "", cp1[0] ? cp1 : "// 'cp1' is empty", lc, ln);
               o.concatx(genloc__, indents(ind + 1), cx, " * i = (", oi, ") ? (", cx, " *)INSTANCEL(", oi, ", cl) : null;", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "int vid = M_VTBLID(", bc, ", ", n, ");", lc, ln);
               o.concatx(genloc__, indents(ind + 1), te ? "typename " : "", bc, sc, "_", sc, n, sc, "_Functor::FunctionType fn;", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "if(i && i->vTbl && i->vTbl[vid])", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "{", lc, ln);
                  o.concatx(genloc__, indents(ind + 2), "fn = (", te ? "typename " : "", bc, sc, "_", sc, n, sc, "_Functor::FunctionType) i->vTbl[vid];", lc, ln);
                  o.concatx(genloc__, indents(ind + 2), "", code, ";", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "}", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "", cp2[0] ? cp2 : "// 'cp2' is empty", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "else", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "{", lc, ln);
                  o.concatx(genloc__, indents(ind + 2), "auto method = ((", r, " (*) ", eop, p, ecp, ")(class_", sc, c, "->_vTbl)[M_VTBLID(", bc, ", ", n, ")]);", lc, ln);
                  o.concatx(genloc__, indents(ind + 2), "if(method) return method ", eop, ea, ecp, ";", lc, ln);
                  o.concatx(genloc__, indents(ind + 2), "return ", rv, ";", lc, ln);
               o.concatx(genloc__, indents(ind + 1), "}", lc, ln);
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
   if(mode == definition)
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
   bool te = template;
   MacroMode submode = mode == definition ? use : mode;
   //MacroMode /*submode = mode == expansion ? expansion : use; */submode = mode == definition ? g.expansionOrUse : g.macroModeBits.intRegisterMethod;
   const char * lc = (mode == definition || mode == encapsulation) ? " \\" : "";    // lc: line continuation
   switch(mode)
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
   bool te = template;
   char * s1;
   char * s2;
   const char * lc = (mode == definition || mode == encapsulation) ? " \\" : "";    // lc: line continuation
   MacroMode submode = mode == definition ? use : mode;
   //MacroMode /*submode = mode == expansion ? expansion : use;*/submode = mode == definition ? g.expansionOrUse : g.macroModeBits.intRegisterMethod;
   switch(mode)
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
   bool te = opts.type == template;
   const char * lc = mode == definition ? " \\" : "";    // lc: line continuation
   const char * sc = mode == expansion ? "" : " ## ";    // sc: symbol concatenation
   const char * ps = opts.prototype ? "Proto" : "Impl";       // ps: prototype string
   const char * tp = te ? "<TPT>" : "";
   const char * tp2 = te ? "<class TPT>" : "";
   //if(mode == configuration)
   //   mode = g.macroModeBits.prop ? expansion : use;
   switch(mode)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define property", ps, "(", n, ", ", sg, ") ");
         ind++;
      case expansion:
         if(opts.prototype)
            o.concatx(genloc__);
         if(mode == expansion)
            o.concat(indents(ind));
         if(opts.prototype)
         {
            o.concatx("struct ", n, sc, "Prop", lc, ln);
            o.concatx(genloc__, indents(ind), "{", lc, ln);
            ind++;
            o.concatx(genloc__, indents(ind), n, sc, "Prop() { };", lc, ln);
            o.concatx(genloc__, indents(ind), "int _[0];", lc, ln);
         }
         if(mode == definition)
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
                     cppMacroIntPropSet(g, o, mode, opts, component.code, ind, component.typename, component.typenamePart2, n, c, tp, tp2, "", 0);
                     break;
                  case macroPropSet:
                     cppMacroPropSet(g, o, mode, opts, component.code, ind, component.typename, component.typenamePart2, n, c, tp, tp2, "", 0);
                     break;
                  case macroPropGet:
                     cppMacroPropGet(g, o, mode, opts, component.code, ind, component.returnType, component.typename, component.typenamePart2, n, c, tp, tp2, "", 0);
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
                  cppMacroIntPropSet(g, o, use, opts, component.code, ind + 1, component.typename, component.typenamePart2, n, c, tp, tp2, "", 0);
                  break;
               case macroPropSet:
                  cppMacroPropSet(g, o, use, opts, component.code, ind + 1, component.typename, component.typenamePart2, n, c, tp, tp2, "", 0);
                  break;
               case macroPropGet:
                  cppMacroPropGet(g, o, use, opts, component.code, ind + 1, component.returnType, component.typename, component.typenamePart2, n, c, tp, tp2, "", 0);
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
   cppMacroIntPropSet(g, o, definition, opts, null, ind,
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
   bool pe = opts.prototype;
   bool nh = opts.type == nohead;
   bool te = opts.type == template;
   bool pp = !pe && te;
   const char * lc = mode == definition ? " \\" : "";    // lc: line continuation
   const char * sc = mode == expansion ? "" : " ## ";    // sc: symbol concatenation
   const char * ps = opts.prototype ? "Proto" : "Impl";  // ps: prototype string
// const char * sso = mode == expansion ? "" : "\"#";    // sso: symbol stringification open
// const char * ssc = mode == expansion ? "" : "\"";     // ssc: symbol stringification close
   if(mode == configuration)
      mode = g.macroModeBits.intPropSet ? expansion : use;
   switch(mode)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define _", nh ? "nh" : te ? "t" : "", "set", ps, "(", t, ", ", t2, ", ", n, ", ", c, te ? ", " : "", te ? tp : "", pp ? ", " : "", pp ? tp2 : "", opts.prototype ? "" : ", ", opts.prototype ? "" : d, ")", lc, ln);
         ind++;
      case expansion:
      {
         char * cx = te ? PrintString(cpptemplatePrefix, sc, c, " ", tp) : CopyString(c);
         if(opts.prototype)
            o.concatx(genloc__, indents(ind), "inline ", t, sc, t2 ? t2 : "", " operator= (", t, " v", t2 ? t2 : "", ");", ln);
         else
         {
            o.concatx(genloc__, indents(ind));
            if(opts.type == nohead)
               o.concatx(cpptemplateNoHeadDef, " ");
            else if(opts.type == template)
               o.concatx("template ", tp2, " ");
            o.concatx("inline ", t, sc, t2 ? t2 : "", " ", nh ? cpptemplatePrefix : "", nh ? sc : "", cx, nh ? "<TC, TCO>" : "", "::", n, sc, "Prop::", "operator= (", t, " v", sc, t2 ? t2 : "", ")", lc, ln);
            o.concatx(genloc__, indents(ind), "{", lc, ln);
            ind++;
               o.concatx(genloc__, indents(ind), "SELF(", cx, ", ", n, ");"/*, lc, ln*/);
               // o.concatx(genloc__, indents(ind), "printf(\"inside (property _set) ", sso, c, ssc, "::", sso, n, ssc, "Prop::", "operator= (", sso, t, ssc, " v", t2 ? sso : "", t2 ? t2 : "", t2 ? ssc : "", ")", "\\n\");", lc, ln);
               if(code)
               {
                  for(c : code)
                     o.concatx(/*genloc__, indents(ind), */c/*, lc, ln*/);
                  o.concatx(lc, ln);
               }
               else
                  o.concatx(lc, ln, genloc__, indents(ind), d, lc, ln);
               o.concatx(genloc__, indents(ind), "return v;", lc, ln);
            ind--;
            o.concatx(genloc__, indents(ind), "}", ln);
         }
         delete cx;
         break;
      }
      case use:
         o.concatx(ln);
      case encapsulation:
         o.concatx(genloc__);
         if(mode == use)
            o.concat(indents(ind + 2));

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
   cppMacroPropSet(g, o, definition, opts, null, ind,
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
   bool pe = opts.prototype;
   bool nh = opts.type == nohead;
   bool te = opts.type == template;
   bool pp = !pe && te;
   const char * lc = mode == definition ? " \\" : "";    // lc: line continuation
   const char * pt = opts.prototype ? ";" : "";               // pt: prototype termination
   const char * ps = opts.prototype ? "Proto" : "Impl";       // ps: prototype string
// const char * sso = mode == expansion ? "" : "\"#";    // sso: symbol stringification open
// const char * ssc = mode == expansion ? "" : "\"";     // ssc: symbol stringification close
   MacroMode submode = mode == definition ? encapsulation : mode;
   //MacroMode /*submode = mode == expansion ? expansion : use;*/submode = mode == definition ? g.expansionOrUse : g.macroModeBits.intPropSet;
   if(mode == configuration)
      mode = g.macroModeBits.propSet ? expansion : use;
   switch(mode)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define ", nh ? "nh" : te ? "t" : "", "set", ps, "(", t, ", ", t2, ", ", n, ", ", c, te ? ", " : "", te ? tp : "", pp ? ", " : "", pp ? tp2 : "", pe ? "" : ", ", pe ? "" : d, ")", lc, ln);
         ind++;
      case expansion:
      {
         const char * lc = submode == expansion ? "" : " \\";  // lc: line continuation
         const char * sc = submode == expansion ? "" : " ## "; // sc: symbol concatenation
         char * cx = te ? PrintString(cpptemplatePrefix, sc, c, " ", tp/*, pp ? tp2 : tp*/) : CopyString(c);
         if(mode == definition)
            o.concat(indents(ind));
         cppMacroIntPropSet(g, o, submode, pe ? { opts.prototype, opts.type == template ? normal : opts.type } : opts, code, ind,
            t,
            t2,
            n,
            c,
            tp,
            tp2,
            d,
            0);
         o.concatx(lc, ln);
         o.concatx(genloc__, indents(ind));
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
            o.concatx(genloc__, indents(ind), "{", lc, ln);
            ind++;
               o.concatx(genloc__, indents(ind), "SELF(", cx, ", ", n, ");", lc, ln);
               // o.concatx(genloc__, indents(ind), "printf(\"inside (property set) ", sso, c, ssc, "::", sso, n, ssc, "Prop::", "operator= (", sso, c, ssc, "::", sso, n, ssc, "Prop & prop)", "\\n\");", lc, ln);
               o.concatx(genloc__, indents(ind), t, sc, t2 ? t2 : "", " v = prop;"/*, lc, ln*/);
               if(code)
               {
                  for(c : code)
                     o.concatx(/*genloc__, indents(ind), */c/*, lc, ln*/);
                  o.concatx(lc, ln);
               }
               else
                  o.concatx(lc, ln, genloc__, indents(ind), d, lc, ln);
               o.concatx(genloc__, indents(ind), "return prop;", lc, ln);
            ind--;
            o.concatx(genloc__, indents(ind), "}");
         }
         o.concatx(ln);
         delete cx;
         break;
      }
      case use:
      case encapsulation:
         if(opts.prototype)
            o.concatx(ln, genloc__, indents(ind + 2), te ? "t" : "", "set", ps, "(",
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
            o.concatx(ln, genloc__, indents(ind + 2), nh ? "nh" : te ? "t" : "", "set", ps, "(",
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
   cppMacroPropGet(g, o, definition, opts, null, ind,
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
   bool pe = opts.prototype;
   bool nh = opts.type == nohead;
   bool te = opts.type == template;
   bool pp = !pe && te;
   const char * lc = mode == definition ? " \\" : "";    // lc: line continuation
   const char * sc = mode == expansion ? "" : " ## ";    // sc: symbol concatenation
   const char * pt = opts.prototype ? ";" : "";               // pt: prototype termination
   const char * ps = opts.prototype ? "Proto" : "Impl";       // ps: prototype string
// const char * sso = mode == expansion ? "" : "\"#";    // sso: symbol stringification open
// const char * ssc = mode == expansion ? "" : "\"";     // ssc: symbol stringification close
   switch(mode)
   {
      case definition:
         o.concatx(genloc__, indents(ind), "#define ", nh ? "nh" : te ? "t" : "", "get", ps, "(", r, ", ", t, ", ", t2, ", ", n, ", ", c, te ? ", " : "", te ? tp : "", pp ? ", " : "", pp ? tp2 : "", pe ? "" : ", ", pe ? "" : d, ")", lc, ln);
         ind++;
      case expansion:
      {
         char * cx = te ? PrintString(cpptemplatePrefix, sc, c, " ", te ? tp : ""/*pp ? tp2 : tp*/) : CopyString(c);
         o.concatx(genloc__, indents(ind));
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
            o.concatx(genloc__, indents(ind), "{", lc, ln);
            ind++;
            if(opts.type == normal || opts.type == template)
               o.concatx(genloc__, indents(ind), "SELF(", cx, ", ", n, ");"/*, lc, ln*/);
            else if(opts.type == nohead)
               o.concatx(genloc__, indents(ind), "__attribute__((unused)) T", sc, c, " TCTCO * self = CONTAINER_OF(this, T", sc, c, " TCTCO, ", n, ");"/*, lc, ln*/);
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
                  o.concatx(genloc__, indents(ind), d, lc, ln);
               }
            ind--;
            o.concatx(genloc__, indents(ind), "}");
         }
         o.concatx(ln);
         delete cx;
         break;
      }
      case use:
      case encapsulation:
         if(opts.prototype)
            // use of pp instead of te, pp will never be true here
            o.concatx(ln, genloc__, indents(ind + 2), pp ? "t" : "", "get", ps, "(",
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
            o.concatx(ln, genloc__, indents(ind + 2), nh ? "nh" : te ? "t" : "", "get", ps, "(",
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
