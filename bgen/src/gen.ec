#include "debug.eh"
#include "bgen.eh"
#include "econe.eh"

import "ecere" // must keep this or compilation outside this file will fail

import "bgen"

const char * indents(int count)
{
   return spaces(count * g_.options.indentSize, 0);
}

#define storeMapGetInstantiate(BType, ECType, array, _map, init) \
   BType result = null; \
   if(value) \
   { \
      HashMapIterator<ECType, BType> i { map = g_._map }; \
      if(i.Index(value, true)) \
         result = i.data; \
      else \
         i.data = result = BType { }, g_.array.Add(result), result.init; \
   } \
   return result;

public enum Language
{
   null,
   C = 1025,
   CPlusPlus,
   CSharp,
   Java,
   Python,
   _;

   const char * OnGetString(char * buffer, void * fieldData, ObjectNotationType * onType)
   {
      if(onType && (*onType == econ || *onType == json))
      {
         switch(this)
         {
            case null:        strcpy(buffer, "<null>");     break;
            case C:           strcpy(buffer, "c");          break;
            case CPlusPlus:   strcpy(buffer, "cpp");        break;
            case CSharp:      strcpy(buffer, "cs");         break;
            case Java:        strcpy(buffer, "java");       break;
            case Python:      strcpy(buffer, "py");         break;
            case _:           strcpy(buffer, "<_>");        break;
            default:          strcpy(buffer, "<invalid>");  break;
         }
         return buffer;
      }
      else
      {
         switch(this)
         {
            case null:        return "<null>";
            case C:           return "C";
            case CPlusPlus:   return "C++";
            case CSharp:      return "C#";
            case Java:        return "Java";
            case Python:      return "Python";
            case _:           return "<_>";
         }
         return "<invalid>";
      }
   }

   bool OnGetDataFromString(const char * string)
   {
      if(!strcmpi(string, "c"))
         this = C;
      else if(!strcmpi(string, "cpp") || !strcmpi(string, "cplusplus") || !strcmpi(string, "c++"))
         this = CPlusPlus;
      else if(!strcmpi(string, "cs") || !strcmpi(string, "csharp"))
         this = CSharp;
      else if(!strcmpi(string, "java"))
         this = Java;
      else if(!strcmpi(string, "py") || !strcmpi(string, "python"))
         this = Python;
      else
         this = _;
      return true;
   }
};

Map<String, DeclarationInit> typedefs { }; // todo: maybe move this into class Gen
Map<String, DeclarationInit> structs { }; // same

class Gen
{
public:
   Language lang;
   Module mod;
   Library lib;
   String dir;
   GenOptions options;
   SymbolNameCollection sym { };
   Map<String, String> sourceProcessorVars { };
   BModule bmod { gen = (CGen)this };
   List<Library> libDeps { };
   String cPrefix;
   bool quiet;
   bool preprocess;
   const String preproLimiter;
   const String linejoinLimiter;
   Map<const String, const String> cpp_classNameSwaps;
   Map<consttstr, const String> cpp_methodNameSwaps;
private:
   MacroMode expansionOrUse;
   //preprocess = true;
   cPrefix = CopyString("");
   virtual bool init()
   {
      genloc__on = options.genLocs;
      expansionOrUse = options.expandMacros ? expansion : use;
      //PrintLn(lang, ":");
      sym.init(this);
      preproLimiter = preprocess ? "##" : "" ;
      linejoinLimiter = preprocess ? " \\" : " \\" ;

      //resetDeclerationsMaps
      typedefs.RemoveAll();
      structs.RemoveAll();

      // prepareVars
      sourceProcessorVars.Free();
      sourceProcessorVars["MODULE_LOCATION"] = CopyString(lib.loadModuleLocation);
      sourceProcessorVars["BINDING_MODULE"] = CopyString(lib.moduleName);
      sourceProcessorVars["LIB_DEF_NAME"] = CopyString(lib.defineName);
      sourceProcessorVars["BINDING_NAME"] = CopyString(lib.bindingName);
      sourceProcessorVars["C_PREPRO_LIMITTER"] = CopyString(preprocess ? "//##" : "");

      return true;
   }
   void outLists(GenOptions options)
   {
      String path = PrintString(/*"out/", */lib.moduleName, ".bgen.econ");
      if(options.blackList == yes && FileExists(path))
         PrintLn("warning: ", path, " file already present, aborting black list output. use force-list to override.");
      else if(options.blackList)
      {
         GenOptions lists { defineList = { black = true }, functionList = { black = true }, classList = { black = true } };
         IterNamespace itn { module = mod, processFullName = true };
         while(itn.next())
         {
            BNamespace n = (NameSpacePtr)itn.ns;
            {
               IterDefine itd { n.ns };
               while(itd.next())
                  lists.defineList.Add(CopyString(itd.df.name));
            }
            {
               IterFunction itf { n.ns, list = options.functionList };
               while(itf.next())
                  lists.functionList.Add(CopyString(itf.fn.name));
            }
            {
               IterClass itc { n.ns };
               while(itc.next(all))
                  lists.classList.Add(CopyString(itc.cl.name));
            }
         }
         lists.writeToFile(path);
         delete lists;
      }
      delete path;
   }
   virtual void process();
   virtual void generate();
   virtual void printOutputFiles();
   virtual void reset();
   virtual bool readyDir()
   {
      bool ready = false;
      //delete dir;
      //dir = new char[MAX_LOCATION];
      //*dir = 0;
      //GetWorkingDir(dir, MAX_LOCATION - 1);
      //dir[MAX_LOCATION - 1] = 0;
      //MakeSlashPath(dir);
      if(dir)
      {
         if(!FileExists(dir))
            MakeDir(dir); // todo: check will this create multiple nested dirs
      }
      ready = FileExists(dir).isDirectory;
      return ready;
   }
   bool moduleInit()
   {
      //Platform os = __runtimePlatform;
      if(ec1init(lib.loadModulePath ? lib.loadModulePath : lib.loadModuleName))
      {
         mod = bmod.mod = ec1HomeModule;
         conassertctx(mod != null, "?");
         {
            //ec1HomeModule
            //Module module = null;
            SubModule subModule;
            /*for(module = ec1ComponentsApp.allModules.first; module; module = module.next)
            {
               PrintLn("                ", "module.name: ", module.name);
               for(subModule = mod.modules.first; subModule; subModule = subModule.next)
               {
                  PrintLn("                ", "    subModule: ", subModule.importMode, " ", subModule.module.name);
               }
            }*/

            for(subModule = mod.modules.first; subModule; subModule = subModule.next)
            {
               if(subModule.importMode == publicAccess)
                  libDeps.Insert(null, createLibrary(subModule.module.name));
            }
            if(!lib.ecereCOM && libDeps.count == 0)
               libDeps.Insert(null, createLibrary("ecereCOM"));
         }
         return true;
      }
      return false;
   }

   virtual char * allocMacroSymbolName(const bool noMacro, const MacroType type, const TypeInfo ti, const char * name, const char * name2, int ptr);

   virtual void prepareNamespaces();
   virtual void processNamespaces();
   virtual void processDefines(BNamespace n);
   virtual void processFunctions(BNamespace n);
   virtual void processClasses(BNamespace n);

   ~Gen()
   {
      reset();
      sourceProcessorVars.Free();
      delete lib;
      delete dir;
      delete options;
      delete cPrefix;
   }
}

class SymbolNameCollection
{
   char * instance;
   char * module;
   char * application;
   char * __class;
   char * method;
   char * _property;
   char * _define;
   char * globalFunction;
   char * alignment;
   char * dataDisplayFlags;

   char * cm_instance;

   void init(Gen g)
   {
      instance         = g.allocMacroSymbolName(false, C, { }, "Instance"         , null, 0);
      module           = g.allocMacroSymbolName(false, C, { }, "Module"           , null, 0);
      application      = g.allocMacroSymbolName(false, C, { }, "Application"      , null, 0);
      __class          = g.allocMacroSymbolName(false, C, { }, "Class"            , null, 0);
      method           = g.allocMacroSymbolName(false, C, { }, "Method"           , null, 0);
      _property        = g.allocMacroSymbolName(false, C, { }, "Property"         , null, 0);
      _define          = g.allocMacroSymbolName(false, C, { }, "Define"           , null, 0);
      globalFunction   = g.allocMacroSymbolName(false, C, { }, "GlobalFunction"   , null, 0);

      alignment        = g.allocMacroSymbolName(false, C, { }, "Alignment"        , null, 0);
      dataDisplayFlags = g.allocMacroSymbolName(false, C, { }, "DataDisplayFlags" , null, 0);

      cm_instance      = g.allocMacroSymbolName(false, CM, { }, "Instance"        , null, 0);
   }

   ~SymbolNameCollection()
   {
      delete instance;
      delete module;
      delete application;
      delete __class;
      delete method;
      delete _property;
      delete _define;
      delete globalFunction;
      delete alignment;
      delete dataDisplayFlags;

      delete cm_instance;
   }
}

enum MacroType { C, CM, CO, T, TP, F, METHOD, PROPERTY, FUNCTION, M_VTBLID, SUBCLASS, THISCLASS };

Library createLibrary(const char * name)
{
   Library lib { };
   lib.name = CopyString(name);
   lib.init();
   return lib;
}

enum ActionFlag { no, yes, force };
class ListsBlackBits
{
   bool defines:1;
   bool functions:1;
   bool classes:1;
};
#define fixBlack(v, b) if(v.black) b = v.black; else if(b) v.black = b
class GenOptions : struct
{
public:
   bool quiet;
   ActionFlag blackList;
   bool genLocs;
   bool expandMacros;
   bool headerOnly;
   property const String dir
   {
      get { return dir; }
      set { delete dir; dir = CopyString(value ? value : ""); }
      isset { return dir && *dir; }
   };
   property const String cpath
   {
      get { return cpath; }
      set { delete cpath; cpath = CopyString(value ? value : ""); }
      isset { return cpath && *cpath; }
   };
   property bool defineListBlack { get { return black.defines; } set { black.defines = value; if(defineList) defineList.black = value; } isset { return defineList && black.defines; } }
   property BlackWhiteList defineList { get { return defineList; } set { fixBlack(value, black.defines); defineList = value; } isset { return defineList && defineList.count; } }
   property bool functionListBlack { get { return black.functions; } set { black.functions = value; if(functionList) functionList.black = value; } isset { return defineList && black.functions; } }
   property BlackWhiteList functionList { get { return functionList; } set { fixBlack(value, black.functions); functionList = value; } isset { return functionList && functionList.count; } }
   property bool classListBlack { get { return black.classes; } set { black.classes = value; if(classList) classList.black = value; } isset { return defineList && black.classes; } }
   property BlackWhiteList classList { get { return classList; } set { fixBlack(value, black.classes); classList = value; } isset { return classList && classList.count; } }
   Map<String, String> funcRename;

private:
   String copyDirPath()
   {
      String path = new char[MAX_LOCATION];
      *path = 0;
      GetWorkingDir(path, MAX_LOCATION - 1);
      path[MAX_LOCATION - 1] = 0;
      MakeSlashPath(path);
      if(dir)
         PathCatSlash(path, dir);
      return path;
   }

private:
   String dir;
   String cpath;
   BlackWhiteList defineList;
   BlackWhiteList functionList;
   BlackWhiteList classList;
   ListsBlackBits black;
   uint indentSize; // todo: add command line switch
   indentSize = 3; // temp

   property bool isEmpty
   {
      get
      {
         return (!dir || !dir[0]) && (!defineList || !defineList.count) && (!functionList || !functionList.count) &&
               (!classList || !classList.count) && (!funcRename || !funcRename.count);
      }
   }

   void merge(GenOptions opt)
   {
      if(opt.quiet) quiet = true;
      if(opt.blackList) blackList = opt.blackList;
      if(opt.genLocs) genLocs = true;
      if(opt.expandMacros) expandMacros = true;
      if(opt.dir && *opt.dir) dir = CopyString(opt.dir);
      if(opt.cpath && *opt.cpath) cpath = CopyString(opt.cpath);
      if(opt.headerOnly) headerOnly = true;
      if(opt.defineList && opt.defineList.count)
      {
         delete defineList;
         defineList = { }; //defineList.copySrc = opt.defineList;
         for(d : opt.defineList)
            defineList.Add(d);
         defineList.black = opt.defineList.black;
      }
      if(opt.functionList && opt.functionList.count)
      {
         delete functionList;
         functionList = { }; //functionList.copySrc = opt.functionList;
         for(d : opt.functionList)
            functionList.Add(d);
         functionList.black = opt.functionList.black;
      }
      if(opt.classList && opt.classList.count)
      {
         delete classList;
         classList = { }; //classList.copySrc = opt.classList;
         for(d : opt.classList)
            classList.Add(d);
         classList.black = opt.classList.black;
      }
      if(opt.funcRename && opt.funcRename.count)
      {
         if(funcRename) funcRename.Free();
         delete funcRename;
         funcRename = { }; // buggy copySrc? -- funcRename.copySrc = opt.funcRename;
         for(r : opt.funcRename)
         {
            funcRename[(char *)(uintptr)&r] = CopyString(r);
         }
      }
   }

   ~GenOptions()
   {
      delete dir;
      if(defineList) defineList.Free();
      delete defineList;
      if(functionList) functionList.Free();
      delete functionList;
      if(classList) classList.Free();
      delete classList;
      if(funcRename) funcRename.Free();
      delete funcRename;
   }

   GenOptions ::loadFromFile(const String path)
   {
      GenOptions o = null;
      if(!loadFromFileECON(path, class(GenOptions), &o))
         PrintLn("Error: GenOptions file ", path, " failed to load!");
      return o;
   }

   void writeToFile(const String path) { writeToFileECON(path, class(GenOptions), this); }
}

class Library : struct
{
public:
   char * name;
   char * moduleName;
   char * bindingName;
   char * packageName;
   char * defineName;
   char * loadModuleName;
   char * loadModulePath;
   char * loadModuleLocation;
   bool ecereCOM;
   bool ecere;
   bool eda;

   uint verbose;

   verbose = 1;

   void init()
   {
      if(name && !moduleName)
      {
         char str[MAX_LOCATION] = "";
         char loc[MAX_LOCATION] = "";
         GetLastDirectory(name, str);
         StripLastDirectory(name, loc);
         StripExtension(str);
         if(strstr(str, "lib") == str)
            loadModuleName = CopyString(str + 3);
         else
            loadModuleName = CopyString(str);
         loadModulePath = loc[0] ? CopyString(name) : null;
         loadModuleLocation = CopyString(loc[0] ? loc : "obj");
         if(strstr(loadModuleName, "gnosis2-") == loadModuleName)
            moduleName = CopyString("gnosis2");
         else
            moduleName = CopyString(loadModuleName);
      }
      ecereCOM = !strcmp(moduleName, "ecereCOM");
      ecere = !strcmp(moduleName, "ecere");
      eda = !strcmp(moduleName, "EDA");
      if(!bindingName)
         bindingName = ecereCOM ? CopyString("eC") : CopyString(moduleName);
      if(!defineName)
         defineName = CopyAllCapsString(bindingName);
   }

   GenOptions loadOptionsFile()
   {
      GenOptions options = null;
      String s;
      s = PrintString(moduleName, ".bgen.econ");
      if(FileExists(s).isFile)
      {
         options = GenOptions::loadFromFile(s);
         if(options)
            PrintLn("loaded options file ", s, " for module ", loadModulePath ? loadModulePath : loadModuleName);
      }
      delete s;
      return options;
   }

   ~Library()
   {
      delete name;
      delete moduleName;
      delete bindingName;
      delete defineName;
      delete loadModuleName;
      delete loadModulePath;
      delete loadModuleLocation;
   }
}

class NameSpacePtr : UIntPtr;
class DefinedExpressionPtr : UIntPtr;
class GlobalFunctionPtr : UIntPtr;
class ClassPtr : UIntPtr;
class MethodPtr : UIntPtr;
class PropertyPtr : UIntPtr;

class BNamespacePtr : UIntPtr;
class BDefinePtr : UIntPtr;
class BFunctionPtr : UIntPtr;
class BClassPtr : UIntPtr;
class BMethodPtr : UIntPtr;
class BPropertyPtr : UIntPtr;

class BVariantPtr : UIntPtr;
class BOutputPtr : UIntPtr;

#define mapGetCreateVariant(_kind, _ptr) \
   BVariant v; \
   HashMapIterator<UIntPtr, BVariant> i { map = g_.allVariants }; \
   if(i.Index((UIntPtr)value, true)) v = i.data; \
   else i.data = v = BVariant { }, g_.storeVariants.Add(v), v.kind = _kind, _ptr = value; \
   return v;

enum BVariantKind
{
   nil, vmanual, vdefine, vfunction, vclass, vtemplaton, vmethod, vproperty, deprecate_genbit, eoe;

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      switch(this)
      {
         case nil:               return "<nil>";
         case vmanual:           return "manual";
         case vdefine:           return "define";
         case vfunction:         return "function";
         case vclass:            return "class";
         case vtemplaton:        return "templaton";
         case vmethod:           return "method";
         case vproperty:         return "property";
         case deprecate_genbit:  return "<genbit> deprecated!!";
         case eoe:               return "<eoe>";
      }
      return "<invalid>";
   }
};

class BVariant //: struct
{
public:
   BVariantKind kind;
   AVLTree<BDependency> dependencies { };
   property BDefine
   {
      set { mapGetCreateVariant(vdefine, v.d); }
      get { if(kind == vdefine) return d;
         conassertctx(0, "?");
         return null; }
   }
   property BFunction
   {
      set { mapGetCreateVariant(vfunction, v.f); }
      get { if(kind == vfunction) return f; conassertctx(0, "?"); return null; }
   }
   property BClass
   {
      set { mapGetCreateVariant(vclass, v.c); }
      get { if(kind == vclass) return c; conassertctx(0, "?"); return null; }
   }
   property BTemplaton
   {
      set { mapGetCreateVariant(vtemplaton, v.t); }
      get { if(kind == vtemplaton) return t; conassertctx(0, "?"); return null; }
   }
   property BMethod
   {
      set { mapGetCreateVariant(vmethod, v.m); }
      get { if(kind == vmethod) return m; conassertctx(0, "?"); return null; }
   }
   property BProperty
   {
      set { mapGetCreateVariant(vproperty, v.p); }
      get { if(kind == vproperty) return p; conassertctx(0, "?"); return null; }
   }
#if 0
   // removing all of this in favor of using BManual class
   // this won't work as a string will convert to a Class and that will trigger the BClass conversion property instead
   property String
   {
      set { mapGetCreateVariant(vmanual, v.x); }
      get { if(kind == vmanual) return x; conassertctx(0, "?"); return null; }
   }
   BVariant ::manual(const String value) { mapGetCreateVariant(vmanual, v.x); }
   const String getManual() { if(kind == vmanual) return x; conassertctx(0, "?"); return null; }
#endif
   property BManual
   {
      set { mapGetCreateVariant(vmanual, v.x); }
      get { if(kind == vmanual) return x; conassertctx(0, "?"); return null; }
   }

   property BNamespace nspace
   {
      get
      {
         switch(kind)
         {
            case vclass:      return c.nspace;
            case vfunction:   return f.nspace;
            case vdefine:     return d.nspace;
            case vmethod:     return m.c.nspace;
            case vproperty:   return p.c.nspace;
            case vtemplaton:  return t.nspace ? t.nspace : t.c.nspace;
         }
         return null;
      }
   }
   property const char * name
   {
      get
      {
         switch(kind)
         {
            case vmanual:     return x.name;
            case vclass:      return c.cl.name;
            case vfunction:   return f.name;
            case vdefine:     return d.name;
            case vmethod:     return m.m;
            case vproperty:   return p.name;
            // this should be just t.c.name but see "name should keep template stuff" note
            // tocheck: how does this name property impact declaration ordering via dependencies
            case vtemplaton:  return t.c.cl.name;
         }
         return "<<<<unknown>>>>";
      }
   }
private:
   union
   {
      BDefine d;
      BFunction f;
      BClass c;
      BTemplaton t;
      BMethod m;
      BProperty p;
      BManual x;
   };
   void noinit() { }

   int OnCompare(BVariant that)
   {
      if(this.kind < that.kind)
         return 1;
      else if(this.kind > that.kind)
         return -1;
      return strcmp(this.name, that.name);
   }

   void processDependency(Gen g, BOutputType from, BOutputType to, BVariant vDep)
   {
      BNamespace nDep = vDep.nspace;
      BNamespace n = nspace;
      // if(this.kind == vclass && !strcmp(this.c.cl.name, "StylingRuleBlockList")) debugBreakpoint();
      if(from == nil) conmsg("check");
      if(from == ostruct && to == ostruct && kind == vclass && c.cl.type == normalClass && vDep.kind == vclass && vDep.c.cl.type == normalClass)
         return;
      if(nDep == n || (vDep.kind == vclass && (vDep.c.isFromCurrentModule || vDep.c.cl.templateClass)) ||
         (vDep.kind == vtemplaton && (vDep.t.c.isFromCurrentModule || vDep.t.c.cl.templateClass)))
      {
         BDependency d { from, to, this, vDep };
         if(!to) conmsg("check");
         if(dependencies.Find(d))
            delete d;
         else
         {
#ifdef _DEBUG
            if(g.lang == CPlusPlus)
            {
               if(!strcmp(g.lib.name, "ecere"))
               {
                  // PrintLn("adding ", vDep.kind, ":", vDep.name, " dependency to ", kind, ":", name);
                  Print("");
               }
               if(!strcmp(vDep.name, "bool"))
                  Print("");
               if(!strcmp(vDep.name, "Window") && !strcmp(name, "Instance"))
                  Print("");
               if(!strcmp(vDep.name, name))
                  Print("");
               if(!(from == otypedef && to == otypedef))
                  Print("");
            }
#endif // _DEBUG
            dependencies.Add(d);
         }
      }
   }
}

enum BOutputType
{
   nil, ocomment, ocode, odefine, otypedef, obittool, oenum, ostruct, ofunction, omethod, oproperty, oconversion,
   oclasspointer, oother, eoe;

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      switch(this)
      {
         case nil:            return "<nil>";
         case ocomment:       return "comment";
         case ocode:          return "code";
         case odefine:        return "define";
         case otypedef:       return "typedef";
         case obittool:       return "bittool";
         case oenum:          return "enum";
         case ostruct:        return "struct";
         case ofunction:      return "function";
         case omethod:        return "method";
         case oproperty:      return "property";
         case oconversion:    return "conversion";
         case oclasspointer:  return "classpointer";
         case eoe:            return "<eoe>";
      }
      return "<invalid>";
   }

   BOutputType ::getFromVariantKind(BVariantKind kind)
   {
              if(kind == vmethod)   return omethod;
         else if(kind == vfunction) return ofunction;
         else if(kind == vproperty) return oproperty;
         else if(kind == vclass)    return ostruct;
         // else if(kind == vtemplaton)return otypedef;
         return nil;
   }

   property BVariantKind
   {
      set
      {
         switch(value)
         {
            case vmethod: return omethod;
            case vproperty: return oproperty;
         }
         return nil;
      }
      get
      {
         return nil;
      }
   }
};

class BOutput : BVariant
{
public:
   BOutputType type;
   BOutputType type2; // todo: use only type but make sure no side effects
private:
   Array<ASTNode> output { };
   ZString z;
   AVLTree<BOutputPtr> outputDependencies { };

   ~BOutput()
   {
      outputDependencies.Free();
   }

   int OnCompare(BOutput that)
   {
      if(this.kind < that.kind)
         return 1;
      else if(this.kind > that.kind)
         return -1;
      if(this.type < that.type)
         return 1;
      else if(this.type > that.type)
         return -1;
      if(this.type2 < that.type2)
         return 1;
      else if(this.type2 > that.type2)
         return -1;
      return strcmp(this.name, that.name);
   }

   bool dependsOn(BOutput x)
   {
      BOutputPtr z = (BOutputPtr)x;
      for(e : outputDependencies; e == z)
         return true;
      return false;
   }

   bool indirectlyDependsOn(BOutputPtr b)
   {
      /*BOutputPtr z = (BOutputPtr)x;

      AVLTree<BVariantPtr> visited { };
      List<BVariantPtr> stack { };
      //if(checkForDependency(a, n, indirectOnly, visited, stack, circularDeps));
      delete visited;
      delete stack;

      for(e : outputDependencies)
      {
      }
      return false;*/

      bool result = false;
      List<BVariantPtr> stack { };
      AVLTree<BVariantPtr> visited { };
      stack.Add((BVariantPtr)this);
      while(stack.count)
      {
         BOutput a = (BOutput)stack.firstIterator.data;
         for(x : a.outputDependencies)
         {
            if(x == b)
            {
               result = true;
               stack.RemoveAll();
               break;
            }
            if(visited.Add((BVariantPtr)a))
               stack.Add((BVariantPtr)a);
         }
         if(stack.count)
            stack.Remove(stack.firstIterator.pointer);
      }
      delete visited;
      delete stack;
      return result;
   }

/*
bool checkForDependency(BOutput a, BOutputPtr b, AVLTree<BVariantPtr> visited, List<BVariantPtr> stack)
{
   //Container<BOutputPtr> dependencies
//    { };
//   Array<BVariantPtr> stack { };
//   if(checkForCircularOutputDependencies(a, n, indirectOnly, visited, stack, circularDeps))
   stack.Add((BVariantPtr)a);
   while(stack.count)
   {
      BOutput a = stack.firstIterator.data;
      for(x : a.dependencies)
      {
         if(x == b)
            return true;
         if(visited.Add((BVariantPtr)a))
            stack.Add((BVariantPtr)a);
      }
      stack.Remove(stack.firstIterator);
   }
   return false;
}
*/

   void processOutputDependency(BOutput to)
   {
      BNamespace a = nspace;
      BNamespace b = to.nspace;
      if(python && py)
      {
         /*if(kind == vclass && to.kind == vclass)
         {
            //PrintLn(c.name, " depends on ", to.c.name);
         }
         //else if(kind == vdefine && to.kind == vclass);
         else conmsg("check");*/
      }
      // if(!strcmp(name, "CMSSList<StylingRuleBlock>")) debugBreakpoint();
      // if(!strcmp(to.name, "CMSSList<StylingRuleBlock>")) debugBreakpoint();
      outputDependencies.Add((BVariantPtr)to);
      // dependencies outside current module already filtered out by BClass::processDependency()
      if(b != a)
         a.addOutputDependency(b, to);
   }
}

class BManual : struct
{
   const String manual;
   // BNamespace nspace;
   BOutput out;
   char * name;
   ~BManual() { delete name; }

   BVariant ::manual(const String value) { storeMapGetInstantiate(BManual, String, storeManuals, allManuals, init(value/*, app.gen*/)); }
   const String getManual() { return manual; }


   void init(const String str/*, Gen gen*/)
   {
      manual = str;
      name = CopyString(str);
   }
}

class BTemplatonKey : tuintptr;

class BTemplaton : struct
{
public:
   ClassTemplateParameter tp;
   BClass c;
   BNamespace nspace;
   BOutput outTypedef;
   char * cname;
   ~BTemplaton() { delete cname; }
   void init()
   {
      if(tp)
         cname = g_.allocMacroSymbolName(false, TP, { }, c.name, tp.name, 0);
      else
         cname = g_.allocMacroSymbolName(false, T, { }, c.cl.name, null, 0);
   }
}

class BDependency : struct
{
public:
   BOutputType from;
   BOutputType to;
   BVariant v;
   BVariant vDep;
   property BOutput fromOutput
   {
      get
      {
         switch(from)
         {
            case otypedef:    return v.kind == vtemplaton ? v.t.outTypedef : v.kind == vclass ? v.c.outTypedef : null;
            case ostruct:     return v.c.outStruct;
            case omethod:     return v.m.outInHeader;
            case ofunction:   return v.f.out;
            case oconversion:
            case oproperty:
                              return v.p.outInHeader;
            case oother:
               switch(v.kind)
               {
                  case vdefine: return v.d.out;
               }
         }
         conmsg("check");
         return null;
      }
   }
   property BOutput toOutput
   {
      get
      {
         if(vDep.kind == vclass)
         {
            /*switch(to)
            {
               case otypedef: if(!vDep.c.outTypedef) conmsg("check"); break;
               case oenum:    if(!vDep.c.outEnum) conmsg("check"); break;
               case ostruct:  if(!vDep.c.outStruct) conmsg("check"); break;
            }*/
            switch(to)
            {
               case otypedef: return vDep.c.outTypedef;
               case oenum:    return vDep.c.outEnum;
               case ostruct:  return vDep.c.outStruct;
            }
         }
         else if(vDep.kind == vtemplaton)
         {
            if(to == otypedef)
            {
               // if(vDep.kind == vtemplaton && !strcmp(vDep.t.cname, "T(CMSSList, StylingRuleBlock)")) debugBreakpoint();
               if(!vDep.t.outTypedef)
               {
                  BVariant vD = vDep.t.c.cl.templateClass ? vDep.t.c.cl.templateClass : vDep.t.c.cl;
                  if(vD.kind == vclass)
                     return vD.c.outTypedef;
                  else conmsg("check");
               }
               else
                  return vDep.t.outTypedef;
            }
         }
         conmsg("check");
         return null;
      }
   }

   int OnCompare(BDependency b)
   {
       if(b.from > from) return 1; else if(b.from < from) return -1;
      else if(b.to > to) return 1;     else if(b.to < to) return -1;
            else if((uintptr)b.v > (uintptr)v) return 1;       else if((uintptr)b.v < (uintptr)v) return -1;
      else if((uintptr)b.vDep > (uintptr)vDep) return 1; else if((uintptr)b.vDep < (uintptr)vDep) return -1;
      return 0;
   }
};

//class OptBits
struct OptBits
{
   bool _extern;//:1;
   bool _dllimport;//:1;
   bool pointer;//:1;
   bool anonymous;//:1;
   bool notype;//:1;
   bool param;//:1;
   bool bare;//:1;       // use bare symbol names. i.e.: Window instead of C(Window)
   bool cpp;//:1;
   bool macroCommas;//:1;
};

struct TypeInfo
{
                  Type type;
                  const String typeString;
                  DataMember dm;
   BFunction f;   GlobalFunction fn;
   BProperty p;   Property pt;
   BMethod m;     Method md;
   BClass c;      Class cl;
   BTemplaton t;

   BProperty userDataProp;
};

struct NamespaceDependencyInfo
{
   int weight;
   bool aDependsOnB;
};

//class Namespaces : List<BNamespace>;

#define mapGetCreateOutput(_map, _kind, _type) \
   BOutput o; \
   HashMapIterator<UIntPtr, BOutput> i { map = g_._map }; \
   if((*init = !i.Index(object, true))) i.data = o = BOutput { _kind, type2 = _type }; \
   else o = i.data; \
   return o;

class BModule : struct
{
   Module mod;
   CGen gen;   // consider the whole BModule thing should be used by all the generators -- Gen vs CGen vs CPPGen
               // some stuff will surely move around -- functions that are here may need to go to specific generators instead
   BNamespace root_nspace;
   List<BNamespace> orderedNamespaces { };

   BTemplaton addTempleton(ClassTemplateParameter tp, Class cl)
   {
      BTemplaton t;
      BTemplatonKey key { (uintptr)tp, (uintptr)cl };
      HashMapIterator<BTemplatonKey, BTemplaton> i { map = g_.allTemplatons };
      if(i.Index(key, true)) t = i.data;
      else i.data = t = BTemplaton { tp, cl }, t.init();
      return t;
   }
   BTemplaton addTemplateType(Class cl, BNamespace nspace)
   {
      BTemplaton t;
      BTemplatonKey key { (uintptr)0, (uintptr)cl };
      HashMapIterator<BTemplatonKey, BTemplaton> i { map = g_.allTemplatons };
      if(i.Index(key, true)) t = i.data;
      else i.data = t = BTemplaton { null, cl, nspace }, t.init();
      return t;
   }
   // vmanual, vdefine, vfunction, vclass, vtemplaton, vmethod, vproperty
   // type -> nil, ocomment, ocode, odefine, otypedef, obittool, oenum, ostruct, ofunction, omethod, oproperty, oconversion, oother, eoe;
   BOutput getDefineOutput       (UIntPtr object, bool *init) { mapGetCreateOutput(mapDefine,         vdefine,                   odefine        ); }
   BOutput getFunctionOutput     (UIntPtr object, bool *init) { mapGetCreateOutput(mapFunction,       vfunction,                 ofunction      ); }
   BOutput getTypedefOutput      (UIntPtr object, bool *init) { mapGetCreateOutput(mapTypedef,        vmanual/*vtypedef*/,       otypedef       ); }
   BOutput getClassPointerOutput (UIntPtr object, bool *init) { mapGetCreateOutput(mapClassPointer,   vmanual/*classpointer*/,   oclasspointer  ); }
   BOutput getBitToolOutput      (UIntPtr object, bool *init) { mapGetCreateOutput(mapBitTool,        vmanual/*vbittool*/,       obittool       ); }
   BOutput getEnumOutput         (UIntPtr object, bool *init) { mapGetCreateOutput(mapEnum,           vmanual/*venum*/,          oenum          ); }
   BOutput getStructOutput       (UIntPtr object, bool *init) { mapGetCreateOutput(mapStruct,         vmanual/*vstruct*/,        ostruct        ); }
   BOutput getMethodOutput       (UIntPtr object, bool *init) { mapGetCreateOutput(mapMethod,         vmethod,                   omethod        ); }
   BOutput getPropertyOutput     (UIntPtr object, bool *init) { mapGetCreateOutput(mapProperty,       vproperty,                 oproperty      ); }
   BOutput getConversionOutput   (UIntPtr object, bool *init) { mapGetCreateOutput(mapConversion,     vmanual/*vconversion*/,    oconversion    ); }

   ~BModule()
   {
      //orderedNamespaces.Free();
   }

   void sort()
   {
      bool sorted = true;
      Map<consttstr, NamespaceDependencyInfo> deps { };
      for(e : orderedNamespaces)
      {
         BNamespace n = (BNamespace)e;
         n.addDirectUsersDependencies();
      }
      for(e : orderedNamespaces)
      {
         BNamespace n = (BNamespace)e;
         const String a = n.name;
         for(dependency : n.dependencies)
         {
            BNamespace d = (BNamespace)&dependency;
            const String b = d.name;
            consttstr t { strcmp(a, b) < 0 ? a : b, strcmp(a, b) > 0 ? a : b };
            bool update = false;
            MapIterator<consttstr, NamespaceDependencyInfo> i { map = deps };
            //PrintLn(dependency.count);
            conassertctx(a != b && strcmp(a, b) != 0, "?");
            if(i.Index(t, true))
            {
               NamespaceDependencyInfo info = i.data;
               if(dependency.count > info.weight)
                  update = true;
            }
            else
               update = true;
            if(update)
               i.data = NamespaceDependencyInfo { dependency.count, a < b ? true : false };
         }
      }
      while(sorted)
      {
         int x; // x
         int d; // dependency
         int count = orderedNamespaces.count;
         sorted = false;
         for(d = 0; d < count; d++)
         {
            for(x = 0; x < d; x++)
            {
               const String a = orderedNamespaces[x].name;
               const String b = orderedNamespaces[d].name;
               consttstr t { strcmp(a, b) < 0 ? a : b, strcmp(a, b) > 0 ? a : b };
               MapIterator<consttstr, NamespaceDependencyInfo> i { map = deps };
               conassertctx(a != b && strcmp(a, b) != 0, "?");
               if(i.Index(t, false))
               {
                  NamespaceDependencyInfo info = i.data;
                  if(info.aDependsOnB && strcmp(a, b) < 0)
                  {
                     BNamespacePtr swap = (BNamespacePtr)orderedNamespaces[d];
                     orderedNamespaces.Remove(orderedNamespaces.GetAtPosition(d, false, null));
                     orderedNamespaces.Insert(x ? orderedNamespaces.GetAtPosition(x - 1, false, null) : null, (BNamespace)swap);
                     sorted = true;
                     break;
                  }
               }
            }
            if(sorted) break;
         }
      }
      delete deps;
   }

   void resetDependencies()
   {
/*
         class BModule : struct
            List<BNamespace> orderedNamespaces { };
            Map<BTemplatonKey, BTemplaton> allTemplatons { };

         class BNamespace : struct
            Array<ASTNode> output { };
            List<BOutputPtr> orderedBackwardsOutputs { };
            List<BOutputPtr> orderedOutputs { }; //List<BClass> orderedOutputs { };
            List<BVariant> contents { };
            Map<BNamespacePtr, AVLTree<BOutputPtr>> dependencies { }; // namespace dependencies with user ouput count
*/
   }

   void applyDependencies()
   {
      for(ni : orderedNamespaces)
      {
         BNamespace n = ni;
         for(vptr : n.contents)
         {
            BVariant v = vptr;
            for(di : v.dependencies)
            {
               BDependency d = di;
               BOutput from = d.fromOutput;
               BOutput to = d.toOutput;
               // if(from && from.kind == vtemplaton) debugBreakpoint();
               // if(to && to.kind == vtemplaton) debugBreakpoint();
               // if(d.v.kind == vtemplaton && !strcmp(d.v.t.c.cl.name, "CMSSList<StylingRuleBlock>")) debugBreakpoint();
               // if(d.vDep.kind == vtemplaton && !strcmp(d.vDep.t.c.cl.name, "CMSSList<StylingRuleBlock>")) debugBreakpoint();

               // if(d.v.kind == vtemplaton && !strcmp(d.v.t.cname, "T(CMSSList, StylingRuleBlock)")) debugBreakpoint();
               // if(d.vDep.kind == vtemplaton && !strcmp(d.vDep.t.cname, "T(CMSSList, StylingRuleBlock)")) debugBreakpoint();

               // if(!from || from.kind == vclass || from.kind == vtemplaton)
               // if((from && from.kind == vclass && strstr(from.c.cl.name, "CMSS")) || (to && to.kind == vclass && strstr(to.c.cl.name, "CMSS")) ||
               //       (from && from.kind == vtemplaton && strstr(from.t.c.cl.name, "CMSS")) || (to && to.kind == vtemplaton && strstr(to.t.c.cl.name, "CMSS")))
               //    PrintLn("BModule::applyDependencies() -- from depends on to -- ", from ? from.name : "null", " depends on ", to ? to.name : "null");
               if(from && to)
                  from.processOutputDependency(to);
            }
         }
      }
   }

   void moveBackwardsDependencies()
   {
      AVLTree<BNamespacePtr> selfOrAboveNamespace { };
      for(nn : orderedNamespaces)
      {
         BNamespace n = nn;
         AVLTree<BOutput> deps { };
         for(optr : n.orderedOutputs)
         {
            BOutput o = (BOutput)optr;
            collectBackwardsDependencies(o.outputDependencies, selfOrAboveNamespace, deps);
         }
         selfOrAboveNamespace.Add((BNamespacePtr)n);
         for(d : deps)
         {
            BOutputPtr dependency = (BOutputPtr)d;
            BNamespace dn = d.nspace;
            // if((d.kind == vclass && strstr(d.c.cl.name, "CMSS")) || (d.kind == vtemplaton && strstr(d.t.c.cl.name, "CMSS")))
            // ?{
            //    PrintLn("BModule::moveBackwardsDependencies() -- moving -- ", d.name, " from ns:", dn.name, " to ns:", n.name);
            //    // if(!strcmp(d.name, "CMSSList<StylingRuleBlock>")) debugBreakpoint();
            // }
            if(dn.orderedOutputs.Find(dependency))
            {
               dn.orderedOutputs.Remove(dn.orderedOutputs.Find(dependency));
               if(!n.orderedBackwardsOutputs.Find(dependency))
                  n.orderedBackwardsOutputs.Add(dependency);
               else conmsg("check");
            }
         }
         delete deps;
      }
      delete selfOrAboveNamespace;
   }
}

#define addThatThing(_thing) orderedOutputs.Add(_thing), conassertctx(!outs.Find(_thing), "?"), outs.Add(_thing)

class BNamespace : struct
{
   NameSpace * ns;
   int pos;
   char * name;
   char * info;
   Array<ASTNode> output { };

   List<BOutputPtr> orderedBackwardsOutputs { };
   List<BOutputPtr> orderedOutputs { }; //List<BClass> orderedOutputs { };
   List<BVariant> contents { };
   Map<BNamespacePtr, AVLTree<BOutputPtr>> dependencies { }; // namespace dependencies with user ouput count

   List<BVariant> splitContents { }; // for cpp
   List<BVariant> implementationsContents { }; // for cpp

   property NameSpacePtr
   {
      set
      {
         storeMapGetInstantiate(BNamespace, UIntPtr, storeNamespaces, allNamespaces,
               init((NameSpace *)value, g_.allNamespaces.count));
      }
      get { return (NameSpacePtr)ns; }
   }

   void init(NameSpace * ns, int pos)
   {
      this.ns = ns;
      conassertctx(!this.pos, "?");
      this.pos = pos;
      name = copyNamespaceFullName(ns, ec1ComponentsApp);
      info = PrintString("// namespace ", (s = copyNamespaceFullName(ns, ec1ComponentsApp))); delete s;
   }
   ~BNamespace()
   {
      delete name;
      delete info;
      //output.Free();
      orderedOutputs.RemoveAll();
      for(e : dependencies)
         e.RemoveAll();
      dependencies.RemoveAll();
   }

   void addContent(BVariant v)
   {
      if(v.kind == vclass)
         conassertctx(v.c.isFromCurrentModule == true || v.c.nspace != this, "?");
      contents.Add(v);
   }

   void positionOutput(CGen g)
   {
      AVLTree<BOutputPtr> outs { };
      for(v : contents; v.kind == vdefine)
         addThatThing((BOutputPtr)v.d.out), conassertctx(v.d.out != null, "?");
      for(vv : contents/*; (vv.kind == vclass && vv.c.outTypedef) || (vv.kind == vtemplaton && vv.t.outTypedef)*/)
      {
         BVariant v = vv;
         // if(v.kind == vtemplaton && !strcmp(v.t.cname, "T(CMSSList, StylingRuleBlock)")) debugBreakpoint();
         if(/*(v.kind == vmanual && v.x.out) || */(v.kind == vclass && v.c.outTypedef) || (v.kind == vtemplaton && v.t.outTypedef))
         {
            BOutput o = /*v.kind == vmanual ? v.x.out : */v.kind == vclass ? v.c.outTypedef : v.t.outTypedef;
            addThatThing((BOutputPtr)o);
            /*
            orderedOutputs.Add((BOutputPtr)o);
            conassertctx(!outs.Find((BOutputPtr)o), "?");
            outs.Add((BOutputPtr)o);
            */
         }
         /*else if(v.kind == vmanual || v.kind == vclass) // tocheck: those have null output?
            ;
         else if(v.kind == vdefine || v.kind == vproperty || v.kind == vmethod || v.kind == vfunction)
            ; // PrintLn(v.name); // tocheck: these are outputed somewhere else
         else
            PrintLn(v.name);*/
      }
      for(vv : contents; vv.kind == vmanual)
      {
         BVariant v = vv;
         BManual x = v.x;
         if(x.out)
            addThatThing((BOutputPtr)x.out);
      }
      for(v : contents; v.kind == vclass)
      {
         BClass c = v.c;
         if(c.outBitTool)     addThatThing((BOutputPtr)c.outBitTool);
         if(c.outEnum)        addThatThing((BOutputPtr)c.outEnum);
         if(c.outStruct)      addThatThing((BOutputPtr)c.outStruct);
         if(c.outMethods.count)
         {
            for(o : c.outMethods)
               addThatThing((BOutputPtr)o);
         }
         if(c.outProperties.count)
         {
            for(o : c.outProperties)
               addThatThing((BOutputPtr)o);
         }
         if(c.outConversions.count)
         {
            for(o : c.outConversions)
               addThatThing((BOutputPtr)o);
         }
      }
      for(v : contents; v.kind == vfunction)
         addThatThing((BOutputPtr)v.f.out), conassertctx(v.f.out != null, "?");
      delete outs;
   }

   void sort()
   {
      bool sorted = true;
      int fix = 0;
      if((python && py) || g_.lang == CPlusPlus)
         printCircularOutputDependencies(orderedOutputs, false);
      while(sorted)
      {
         int x; // x
         int d; // dependency
         int count = orderedOutputs.count;
         sorted = false;
         for(d = 0; d < count; d++)
         {
            for(x = 0; x < d; x++)
            {
               BOutput a = (BOutput)orderedOutputs[x];
               BOutput b = (BOutput)orderedOutputs[d];
               conassertctx(d > x, "?");
               if((a.nspace == b.nspace || (b.kind == vclass && b.c.cl.templateClass)) && a.dependsOn(b))
               {
                  BOutput swap = (BOutput)orderedOutputs[d];
                  if(b.indirectlyDependsOn((BOutputPtr)a)) conmsg("check");
                  orderedOutputs.Remove(orderedOutputs.GetAtPosition(d, false, null));
                  orderedOutputs.Insert(x ? orderedOutputs.GetAtPosition(x - 1, false, null) : null, (BOutputPtr)swap);
                  sorted = true;
                  break;
               }
            }
            if(sorted) break;
         }
      }

      sorted = true;
      while(sorted)
      {
         int x; // x
         int d; // dependency
         int count = orderedBackwardsOutputs.count;
         sorted = false;
         for(d = 0; d < count; d++)
         {
            for(x = 0; x < d; x++)
            {
               BOutput a = (BOutput)orderedBackwardsOutputs[x];
               BOutput b = (BOutput)orderedBackwardsOutputs[d];
               conassertctx(d > x, "?");
               // if(!strcmp(a.name, "CMSSList<StylingRuleBlock>"))
               //    PrintLn("checking dependsOn of ", a.name);
               // if(!strcmp(b.name, "CMSSList<StylingRuleBlock>"))
               //    PrintLn("checking is dependency of ", b.name);

               if(/*a.nspace == b.nspace && */a.dependsOn(b))
               {
                  // if((a.kind == vclass && strstr(a.c.cl.name, "CMSS")) || (b.kind == vclass && strstr(b.c.cl.name, "CMSS")) ||
                  //       (a.kind == vtemplaton && strstr(a.t.c.cl.name, "CMSS")) || (b.kind == vtemplaton && strstr(b.t.c.cl.name, "CMSS")))
                  //    PrintLn("BNamespace::sort() -- ", "a depends on b -- ", a.name, " depends on ", b.name);
                  if(b.indirectlyDependsOn((BOutputPtr)a))
                  {
                     //PrintLn("a: ", a.kind, " ", a.c.name, "  ", "b: ", b.kind, " ", b.c.name);
                     // conmsg("check");
                  // if((a.kind == vclass && strstr(a.c.cl.name, "CMSS")) || (b.kind == vclass && strstr(b.c.cl.name, "CMSS")) ||
                  //       (a.kind == vtemplaton && strstr(a.t.c.cl.name, "CMSS")) || (b.kind == vtemplaton && strstr(b.t.c.cl.name, "CMSS")))
                  //    PrintLn("BNamespace::sort() -- ", "b indirectly depends on a -- ", b.name, " indirectly depends on ", a.name);
                  }
                  //else
                  {
                  BOutput swap = (BOutput)orderedBackwardsOutputs[d];
                  orderedBackwardsOutputs.Remove(orderedBackwardsOutputs.GetAtPosition(d, false, null));
                  orderedBackwardsOutputs.Insert(x ? orderedBackwardsOutputs.GetAtPosition(x - 1, false, null) : null, (BOutputPtr)swap);
                  sorted = true;
                  fix++;
                  break;
                  }
               }
            }
            if(sorted) break;
         }
         if(fix > 128)
         {
#ifdef _DEBUG
            PrintLn("we were trying to sort ", name, " for ", g_.lang);
#endif
            break;
         }
      }
   }

   void addOutputDependency(BNamespace n, BOutput user)
   {
      MapIterator<BNamespacePtr, AVLTree<BOutputPtr>> i { map = dependencies };
      AVLTree<BOutputPtr> users;
      if(i.Index((BNamespacePtr)n, true)) users = i.data;
      else i.data = users = { };
      users.Add((BOutputPtr)user);
   }

   void addDirectUsersDependencies()
   {
      AVLTree<BOutputPtr> users { };
      AVLTree<BOutputPtr> visited { };
      for(e : dependencies)
      {
         for(user : e)
            users.Add(user);
      }
      for(e : users)
      {
         addIndirectDependencies((BOutput)e, visited);
         visited.RemoveAll();
      }
      delete users;
      delete visited;
   }

   void addIndirectDependencies(BOutput o, AVLTree<BOutputPtr> visited)
   {
      if(o.kind != vclass) return;
      if(!visited.Add((BOutputPtr)o)) return;
      if(o.c.nspace != this) // if(o.c.cl.nameSpace != ns)
         addOutputDependency(o.c.nspace, o);
      for(dep : o.outputDependencies)
         addIndirectDependencies((BOutput)dep, visited);
   }
}

class BDefine : struct
{
   DefinedExpression df;
   BNamespace nspace;
   BOutput out;
   bool isNull;
   const char * name;
   property DefinedExpression
   {
      set { storeMapGetInstantiate(BDefine, DefinedExpression, storeDefines, allDefines, init(value)); }
      get { return df; }
   }
   void init(DefinedExpression df)
   {
      this.df = df;
      nspace = (NameSpacePtr)df.nameSpace;
      name = strptrNoNamespace(df.name);
      isNull = !strcmp(name, "null"); // hack?
   }
   //void free() { }
}

class BFunction : struct
{
   GlobalFunction fn;
   BNamespace nspace;
   BOutput out;
   property GlobalFunction
   {
      set { storeMapGetInstantiate(BFunction, GlobalFunction, storeFunctions, allFunctions, init(value, g_.options.funcRename)); }
      get { return fn; }
   }
   bool skip;
   bool isDllExport;
   bool cleanDataType;
   const char * name;
   char * fname; char * ccfname; char * gname; const char * easy; const char * mapName; const char * oname;
   char * cSymbol;
   char * foSymbol;
   void init(GlobalFunction fn/*, Module m*/, Map<String, String> funcRename)
   {
      this.fn = fn;
      nspace = (NameSpacePtr)fn.nameSpace;
      name = strptrNoNamespace(fn.name);
      isDllExport = strstr(fn.dataTypeString, "dllexport") == fn.dataTypeString;
      fname = getNoNamespaceString(fn.name, null, false, false);
      skip = (skipFunctionTree.Find(fname) || (python && skipPyFunctionTree.Find(fname))) ? true : false;
      ccfname = getNoNamespaceString(fn.name, null, true, false);
      gname = getMangledFunctionName(fn.name);
      easy = easyFuncNames[gname];
      mapName = null;
      if(funcRename)
      {
         mapName = funcRename[fn.name];
         if(!mapName)
            mapName = funcRename[fname];
      }
      oname = mapName ? mapName : ccfname;
      cSymbol = g_.allocMacroSymbolName(false, F, { }, oname, null, 0);
      foSymbol = g_.allocMacroSymbolName(false, FUNCTION, { }, oname, null, 0);
      if(!fn.dataType)
      {
         fn.dataType = ProcessTypeString(fn.dataTypeString, false);
         cleanDataType = true;
      }
      //if(!(m && fn.module && fn.module != ec1HomeModule/* && !(ecereCOM && !fn.module)*/))
      //if(!/*((!m || !m.name) && */skipFunctionTree.Find(fname)/*)*/)
      //   return true;
      //return false;
   }
   void free()
   {
      if(cleanDataType)
      {
         //FreeType(fn.dataType);
         //fn.dataType = null;
      }
      delete fname;
      delete ccfname;
      delete gname;
      delete cSymbol;
      delete foSymbol;
   }
   void OnFree() { free(); };
};

AVLTree<const String> skipClassTypeDef { [
   "char",
   "char *",
   "double",
   "float",
   "int",
   "short",
   "unsigned int",
   "enum",
   "struct",
   "class",
   ""
] };

class BClass : struct
{
   Class cl;
   BNamespace nspace;
   Class clBase;
   Class clAlt;
   DeclarationInit declStruct;

   BOutput outTypedef;
   BOutput outClassPointer;
   BOutput outBitTool;
   BOutput outEnum;
   BOutput outStruct;
   Array<BOutput> outMethods { };
   Array<BOutput> outProperties { };
   Array<BOutput> outConversions { };
   BOutput pyout;

   BOutput outImplementation; // for cpp
   BOutput outSplit; // for cpp

   property Class
   {
      set { storeMapGetInstantiate(BClass, Class, storeClasses, allClasses, init(value, app.gen, null)); }
      get { return cl; }
   }

   property bool hasOrBaseHasPublicMembers
   {
      get
      {
         BClass base = this;
         if(base.isString) return false;
         while(base)
         {
            if(base.hasPublicMembers) return true;
            base = base.cl.base && base.cl.base.type == systemClass ? null : base.cl.base;
            if(base && (base.isString || base.isInstance || base.cl.templateClass))
               break;
            if(base)
               Print("");
         }
         return false;
      }
   }

   bool first; bool skip; bool skipTypeDef;
   bool isFromCurrentModule;
   bool is_class;// bool is_Class;
   bool is_struct;
   bool is_enum;
   bool isBool; bool isByte; bool isUnichar; bool isUnInt; bool isCharPtr; bool isString;
   bool isBaseString;
   bool isInstance, isClass, isModule, isApplication, isGuiApplication, isContainer, isArray, isList, isAnchor;
   bool isSurface, isIOChannel, isWindow, isDataBox, isDataDisplayFlags;

   bool hasPublicMembers;
   bool noMacro, noSpecMacro, nativeSpec;
   bool cleanDataType;
   // input names:
   char * name; char * base;
   // generated names:
   char * upper; char * spec;
   char * cname;
   char * coSymbol;
   char * cSymbol;
   char * bareSymbol;
   char * baseSymbolName;
   char * py_initializer;
   char * simplestIdentName;
   bool isClassTemplatable;
   bool completeTemplate;
   int numTemplateArgsInName;
   Array<BClass> cTArgs { };
   List<Class> cumulationLineage;
   AVLTree<const String> memberNames;
   BClass cUse;
   struct
   {
      char * name;
      char * tname;
      int templParamsCount; // the C++ template parameters count
      char * template;
      char * templatem;
      char * tprototype;
      char * targs;
      char * targsm;
      char * targsb; // w/ <>
      char * targsbm; // w/ <>
      bool isTemplate;
      bool setTemplateComplete;
      bool templateComplete;
      int typedTArgsCount;
      char * dataTypeString;
      bool classTypeIsTemplatable;
      Array<String> templateParamNames;
   } cpp;
   void init(Class cl, Gen gen, AVLTree<String> allSpecs)
   {
      bool ecere = gen.lib.ecere;
      // char * namex;
      this.cl = cl;
      nspace = (NameSpacePtr)cl.nameSpace;
      first = true;
      // name = strptrNoNamespace(cl.name);
      numTemplateArgsInName = getTemplateArgsCount(cl.name);
      // todo: name should keep template stuff (eg <int, String>)but everywhere else it's needed without template stuff should be fixed
      //       related: see "this should be just t.c.name"
      name = getNoNamespaceString(cl.name, null, false, true);
      if(numTemplateArgsInName)
         ; // see below where bareSymbol is also set
      else
         bareSymbol = CopyString(name);
      // if(strchr(name, '>')) debugBreakpoint(); // todo this should be fixed
      if(strchr(name, ':')) debugBreakpoint(); // todo this should be fixed
      // if(strchr(namex, ':')) debugBreakpoint(); // todo this should be fixed
      simplestIdentName = new char[2];
      simplestIdentName[0] = (char)tolower(name[0]);
      simplestIdentName[1] = '\0';
      // skipping these classes here as they are internal native types or base class/struct
      skipTypeDef = skipClassTypeDef.Find(cl.name) != 0;
      // skipping these classes here since they are hardcoded
      if(ecere && ((!py && cl.type == structClass && !strcmp(cl.name, "Size")) ||
            (!py && cl.type == unitClass && !strcmp(cl.name, "MinMaxValue")) ||
            (!py && cl.type == enumClass && !strcmp(cl.name, "Alignment"))))
         skip = true;
      cname = getClassTypeName(cl);
      coSymbol = g_.allocMacroSymbolName(false, CO, { }, cname, null, 0);
      upper = CopyAllCapsString(name/*cl.type == bitClass ? name : ""*/);

      isFromCurrentModule = classIsFromModule(cl, gen.mod, ec1ComponentsApp);

      is_class             = cl.type == systemClass   && !strcmp(name, "class");
      is_struct            = cl.type == systemClass   && !strcmp(name, "struct");
      is_enum              = cl.type == systemClass   && !strcmp(name, "enum");
      isBool               = cl.type == enumClass     && !strcmp(name, "bool");
      isString             = cl.type == normalClass   && !strcmp(name, "String");
      isUnichar            = cl.type == unitClass     && !strcmp(name, "unichar");
      isUnInt              = cl.type == systemClass   && !strcmp(name, "unsigned int");
      isByte               = cl.type == systemClass   && !strcmp(name, "byte");
      isCharPtr            = cl.type == normalClass   && !strcmp(name, "char *");
      isInstance           = cl.type == normalClass   && !strcmp(name, "Instance");
      isClass              = cl.type == noHeadClass   && !strcmp(name, "Class");
      isModule             = cl.type == normalClass   && !strcmp(name, "Module");
      isApplication        = cl.type == normalClass   && !strcmp(name, "Application");
      isGuiApplication     = cl.type == normalClass   && !strcmp(name, "GuiApplication");
      isContainer          = cl.type == normalClass   && !strcmp(name, "Container");
      isArray              = cl.type == normalClass   && !strcmp(name, "Array");
      isList               = cl.type == normalClass   && !strcmp(name, "List");
      isAnchor             = cl.type == structClass   && !strcmp(name, "Anchor");
      isSurface            = cl.type == normalClass   && !strcmp(name, "Surface");
      isIOChannel          = cl.type == normalClass   && !strcmp(name, "IOChannel");
      isWindow             = cl.type == normalClass   && !strcmp(name, "Window");
      isDataBox            = cl.type == normalClass   && !strcmp(name, "DataBox");
      isDataDisplayFlags   = cl.type == bitClass      && !strcmp(name, "DataDisplayFlags"); // in support of hack

      if(cl.type == normalClass)
      {
         Class base = cl;
         while((base = base.base && base.base.templateClass ? base.base.templateClass : base.base))
         {
            if(!strcmp(base.name, "String"))
            {
               isBaseString = true;
               // tocheck: is setting isString all good?
               isString = true;
               break;
            }
         }
      }
      else if(cl.type == unitClass)
         cUse = reduceUnitClass(cl);

      if(is_class)
         clAlt = eSystem_FindClass(g_.mod, "Class");

      noMacro = cl.type == systemClass || isUnichar;
      noSpecMacro = noMacro || cl.type == enumClass || isString;

      // if(!strcmp(cl.name, "HashMap<int64, ecere::com::Map<int, eda::FieldValue> >")) debugBreakpoint();
      isClassTemplatable = classIsTemplatable(cl);
      if(numTemplateArgsInName && !isClassTemplatable)
         completeTemplate = checkCompleteSpecifiedTemplateArgs(cl, cTArgs);
      // if(!strcmp(cl.name, "MapNode<String, ecere::gfx::FontInfo, T = String>")) debugBreakpoint();
      if(cl.templateClass)
      {
         if(completeTemplate)
         {
            bareSymbol = cGetTemplatedClassSymbolName(this, cTArgs, bare);
            cSymbol = cGetTemplatedClassSymbolName(this, cTArgs, (noMacro || python) ? expanded : macro); // g_.allocMacroSymbolName(noMacro/*false*/, T, { }, cl.name, null, 0);
            if(!cSymbol)
            {
               debugBreakpoint();
               cSymbol = cGetTemplatedClassSymbolName(this, cTArgs, noMacro ? expanded : macro); // debug recall
            }
         }
         else
            cSymbol = g_.allocMacroSymbolName(noMacro/*false*/, T, { }, cl.name, null, 0);
      }
      else
         cSymbol = g_.allocMacroSymbolName(noMacro, C, { }, name, null, 0);
      // if(!strcmp(cSymbol, "T(MapNode, String, FontInfo, T = String)")) debugBreakpoint();

      if(gen.lang == CPlusPlus)
         cppGenClassDetails(this, cl, gen);


      clBase = getClassBaseAndProcessTemplateDataType(cl, &cleanDataType);

      if(clBase)
      {
         if(clBase.templateClass)
            baseSymbolName = g_.allocMacroSymbolName(false, T, { }, clBase.name, null, 0);
         else
         {
            bool enumDataType = cl.type == enumClass && clBase.type == systemClass;
            bool noMacro = cl.type == systemClass || isUnichar || enumDataType;
            const char * name = enumDataType ? tokenTypeString(cl.dataType) : strptrNoNamespace(clBase.name);
            baseSymbolName = g_.allocMacroSymbolName(noMacro, C, { }, name, null, 0);
            if(cl.type == enumClass)
               base = CopyString(name);
         }
      }

      if(cl.type == structClass && !cl.templateArgs)
         cumulationLineage = getFilteredClassLineage(cl, structOnly);
      else
      {
         cumulationLineage = { };
         cumulationLineage.Add(cl);
      }

      memberNames = { };
      {
         List<Class> lineage = getFilteredClassLineage(cl, all);
         for(e : lineage)
         {
            Class cl = e;
            DataMember dm; IterDataMember dat { cl };
            while((dm = dat.next(publicOnly)))
            {
               if(dm.name)
                  memberNames.Add(dm.name);
            }
         }
         for(e : lineage)
         {
            Class cl = e;
            Property pt; IterProperty prop { cl };
            while((pt = prop.next(publicOnly)))
            {
               if(pt.conversion)
                  continue;
               if(pt.name)
                  memberNames.Add(pt.name);
            }
         }
      }

      if(cl.type != bitClass && !cl.templateClass)
      {
         DataMember dm; IterDataMember dat { cl };
         while((dm = dat.next(privateAndPublic)))
         {
            hasPublicMembers = true;
            break;
         }
      }
      if(cl.type == enumClass && isBool)
         spec = CopyString(tmp32_tokenTypeString(cl.dataType));
      else if(cl.type == bitClass)
         spec = CopyString(tmp32_tokenTypeString(cl.dataType));
      else if(cl.type == systemClass || cl.type == unitClass || isString)
      {
         bool useBase = false; // = cl.type == unitClass && cl.base.name && strcmp(cl.base.name, "class");
         //if(useBase) conmsg("check");
         spec = CopyString(systemTypeSubst(cname, useBase ? cl.base.name : cl.dataTypeString));
         /*if(!strcmp(spec, "char *") || !strcmp(spec, "uint32_t"))
            noSpecC = true;*/
      }
      else if(cl.type == normalClass && cl.base && !strcmp(cl.base.name, "class"))
      {
         spec = PrintString("struct ", g_.sym.cm_instance, " *");
         base = CopyString("Instance");
         noSpecMacro = true;
      }
      else if(cl.type == normalClass && cl.base && strcmp(cl.base.name, "class") && !isString)
         spec = oldGetClassTypeName(clBase.name);
      else if(cl.type == enumClass || cl.type == noHeadClass || cl.type == structClass || cl.type == normalClass)
      {
         /*if((cl.type == noHeadClass || cl.type == structClass) && !hasPublicMembers)
         {
            Class cc = null;
            for(cc = cl.base; cc && !spec; cc = cc.base)
            {
               if(cc.type != bitClass && !cc.templateClass)
               {
                  DataMember dm; IterDataMember dat { cc };
                  while((dm = dat.next(privateAndPublic)))
                  {
                     spec = CopyString(getClassTypeName(cc));
                     break;
                  }
               }
            }
         }*/
         if(!spec)
            spec = CopyString(cname);
      }

      if(!base) base = CopyString(spec);

      if(allSpecs && !allSpecs.Find(spec)) allSpecs.Add(CopyString(spec));

      nativeSpec = checkNativeSpec(spec);
      if(nativeSpec || actualTypeNames.Find(spec)) noSpecMacro = true;
      if(cl.type == unitClass)
         //py_initializer = CopyString("0");
         py_initializer = PrintString(cSymbol, "(0)");
      else
         py_initializer = PrintString(cSymbol, "()");
   }
   void free()
   {
      delete name;
      delete base; delete upper; delete spec; delete cname; delete cSymbol; delete baseSymbolName;
      delete coSymbol;
      delete py_initializer;
      delete cpp.name;
      delete cpp.tname;
      delete cpp.template;
      delete cpp.templatem;
      delete cpp.tprototype;
      delete cpp.targs;
      delete cpp.targsm;
      delete cpp.targsb;
      delete cpp.targsbm;
      delete cpp.dataTypeString;
      if(cpp.templateParamNames)
         cpp.templateParamNames.Free();
      delete cpp.templateParamNames;
      delete cTArgs;
      delete cumulationLineage;
      delete memberNames;
      if(cleanDataType)
      {
         FreeType(cl.dataType);
         cl.dataType = null;
      }
   }
   void OnFree() { free(); };
};

bool checkCorrectLineageHasFullySpecifiedTemplateArgs(List<Class> lineage, Class templateClass)
{
   bool complete = true;
   int i = 0;
   // Class templateClass = lineage.lastIterator.data;
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
                  if(!ctp.defaultArg.dataTypeString)
                  {
                     if(a->dataTypeClass == null || a->dataTypeString == null)
                        complete = false;
                  }
                  break;
               }
               case expression: break; // expressions are ignored here
               case identifier: break; // identifiers are ignored here
               default: debugBreakpoint(); break;
            }
            i++;
         }
         if(!complete)
            break;
      }
   }
   return complete;
}

static bool checkCompleteSpecifiedTemplateArgs(Class templateClass, Array<BClass> cTArgs)
{
   bool complete = true;
   int i = 0;
   Class templateClassBase = null;
   // List<Class> correctLineage = getCorrectLineage(templateClass);
   // List<Class> lineage = getTemplateLineage(templateClass, &complete);
   // List<Class> lineage = getCorrectLineage(templateClass, null);
   List<Class> lineage = getCorrectLineage(templateClass, &templateClassBase);
   // bool correctComplete = checkCorrectLineageHasFullySpecifiedTemplateArgs(correctLineage);
   // if(!strcmp(templateClass.name, "LinkElement<ecere::gfx::FMFont>")) debugBreakpoint();
   // if(!strcmp(templateClass.name, "MapNode<int, eda::FieldValue, T = int>")) debugBreakpoint();
   // if(!strcmp(templateClass.name, "Array<ecere::gfx::drivers::BlockEntry>")) debugBreakpoint();
   // if(!strcmp(templateClass.name, "HashMap<int64, ecere::com::Map<int, eda::FieldValue> >")) debugBreakpoint();
   complete = checkCorrectLineageHasFullySpecifiedTemplateArgs(lineage, templateClass);
   // if(!strcmp(templateClass.name, "Map<String, ecere::gfx::FontInfo>")) debugBreakpoint();
   // if(correctComplete)
   //    ;
   if(complete)
   {
      // Class templateClassBase = null;
      // Class templateClassBase = templateClass.base.templateClass ? templateClass.base.templateClass : null;
      // Class templateClassBase = templateClass.templateClass ? templateClass.templateClass : null;
      // List<Class> baseLineage = getClassLineage(lineage.firstIterator.data.base); // getCorrectClassLineage
      // Class startBaseClass = getTemplateStartBaseClass(templateClass.templateParams.count == 0 ? templateClass : templateClass.base);
      // Class clStart = startBaseClass;
      // startBaseClass = getTemplateStartBaseClass(templateClass.templateParams.count == 0 ? templateClass : templateClass.base);
      // if(clStart)
      //    ;
      /*
      for(_class : baseLineage)
      {
         Class cl = _class;
         i += cl.templateParams.count;
      }
      */

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
         // if(startBaseClass && /*(*/startBaseClass == cl/* || startBaseClass.templateClass == cl)*/)
         //    startBaseClass = null;
         if(i >= templateClass.numParams)
         {
            if(i > templateClass.numParams) debugBreakpoint();
            if(cl != templateClass && cl != templateClass.templateClass && cl != templateClass.templateClass.base) debugBreakpoint();
            break;
         }
         // if(!strcmp(cl.name, "HashMap") && !strcmp(templateClass.name, "HashMap<int64, ecere::com::Map<int, eda::FieldValue> >")) debugBreakpoint();
         // if(/*!strcmp(cl.name, "HashMap") && */!strcmp(templateClass.name, "Container<KT, I = KT>")) debugBreakpoint();
         if(cl.templateParams.count)
         {
            // if(!startBaseClass)
            // {
               ClassTemplateParameter ctp;
               for(ctp = cl.templateParams.first; ctp && complete; ctp = ctp.next)
               {
                  switch(ctp.type)
                  {
                     case type:
                     {
                        ClassTemplateArgument * a = &templateClass.templateArgs[i];
                        // if(!strcmp(templateClass.name, "Array<ecere::gfx::drivers::BlockEntry>")) debugBreakpoint();
                        /*
                        if(!ctp.defaultArg.dataTypeString)
                        {
                           // ClassTemplateArgument * a = &templateClass.templateArgs[i];
                           // if(!a->dataTypeClass && !a->dataTypeString) debugBreakpoint();
                           if(a->dataTypeClass)
                           {
                              BClass dtc = a->dataTypeClass;
                              if(a->dataTypeClass.templateClass || a->dataTypeClass.templateParams.count)
                              {
                                 if(!checkCompleteSpecifiedTemplateArgs(a->dataTypeClass, null))
                                 {
                                    if(!strcmp(templateClass.name, "HashMap<int64, ecere::com::Map<int, eda::FieldValue> >")) debugBreakpoint();
                                    complete = false;
                                    break;
                                 }
                              }
                              else if(dtc.numTemplateArgsInName) debugBreakpoint();
                              // if(!strcmp(templateClass.name, "List<ecere::net::CallAck>")) debugBreakpoint();
                              if(!strcmp(templateClass.name, "HashMap<int64, ecere::com::Map<int, eda::FieldValue> >")) debugBreakpoint();
                           }
                           else if(a->dataTypeString)
                           {
                              Class dtscl = eSystem_FindClass(templateClass.module, a->dataTypeString);
                              if(!dtscl)
                                 complete = false;
                           }
                           else
                              complete = false;
                        }
                        */
                        Class clType = null;
                        // if(!ctp.defaultArg.dataTypeString || (a->dataTypeString && strcmp(ctp.defaultArg.dataTypeString, a->dataTypeString)))
                        // todo: call itself :P
                        {
                           if(!(a->dataTypeString && (clType = eSystem_FindClass(templateClass.module, a->dataTypeString))))
                           {
                              if(!(ctp.defaultArg.dataTypeString && (clType = eSystem_FindClass(templateClass.module, ctp.defaultArg.dataTypeString))))
                              // if(!(ctp.defaultArg.dataTypeString && eSystem_FindClass(templateClass.module, ctp.defaultArg.dataTypeString)))
                                 complete = false;
                           }
                           if(clType && !templateClassBase)
                           {
                              BClass cType = clType;
                              // if(!strcmp(templateClass.name, "Map<String, ecere::gfx::FontInfo>")) debugBreakpoint();
                              cTArgs.Add(cType);
                           }
                        }
                        break;
                     }
                     case expression: break; // expressions are ignored here
                     case identifier: break; // identifiers are ignored here
                     default: debugBreakpoint(); break;
                  }
                  i++;
               }
            //}
            // else
            //    i += cl.templateParams.count;
         }
         // if(startBaseClass && startBaseClass.templateClass == cl)
         //    startBaseClass = null;
         if(templateClassBase && templateClassBase == cl)
            templateClassBase = null;
      }
      // delete baseLineage;
   }
   delete lineage;
   // if(!strcmp(templateClass.name, "HashMap<int64, ecere::com::Map<int, eda::FieldValue> >")) debugBreakpoint();
   if(complete && cTArgs.count == 0)
      complete = false;
   return complete;
}

bool normalClassMacroOverride;
const char * bgenSymbolSwap(const char * symbol, bool reduce, bool macro)
{
   const char * result = symbol;
   Class cl = eSystem_FindClass(g_.mod, strptrNoNamespace(symbol));
   if(!cl && g_.lib.ecereCOM && g_.lang == CPlusPlus)
   {
      if(!strcmp(symbol, "Surface") || !strcmp(symbol, "DataBox"))
         result = (!normalClassMacroOverride) ? g_.sym.instance : "Instance";
      else if(!strcmp(symbol, "Alignment"))
         result = g_.sym.alignment;
      else if(!strcmp(symbol, "DataDisplayFlags"))
         result = g_.sym.dataDisplayFlags;
      if(result != symbol && !result) debugBreakpoint();
   }
   if(cl && result == symbol)
   {
      Class cl2 = reduce ? reduceUnitClass(cl) : cl;
      BClass c = cl2;
      result = macro && !normalClassMacroOverride ? c.cSymbol : c.name;
      if(!result) debugBreakpoint();

   }
   return result;
}

#if 0
const char * swapInstanceSpecifier(const char * spec/*, bool * isUnitClass*/)
{
   Class cl = eSystem_FindClass(g_.mod, strptrNoNamespace(spec));
   if(cl)
   {
      Class clReduced = reduceUnitClass(cl);
      /*if(cl.type == unitClass && isUnitClass)
         *isUnitClass = true;*/
      if(clReduced != cl)
      {
         BClass cReduced = clReduced;
         return cReduced.name;
      }
   }
   return spec;
}

const char * getSpecifierSymbolName(const char * spec)
{
   Class cl = eSystem_FindClass(g_.mod, strptrNoNamespace(spec));
   if(cl)
   {
      BClass c = cl;
      return c.cSymbol;
   }
   return spec;
}
#endif // 0

char * printType(Type t, bool printName, bool fullName, bool printConst)
{
   char type[8192];
   type[0] = 0;
   SetInBGen(true);
   if(printConst)
      PrintType(t, type, printName, fullName);
   else
      PrintTypeNoConst(t, type, printName, fullName);
   SetInBGen(false);
   return CopyString(type);
}

char * cPrintType(Type t, bool printName, bool fullName, bool noTemplateArgs, bool additionalPointer)
{
   char * d;
   char type[8192];
   BClass c = t.kind == classType && t._class.registered ? t._class.registered : null;
   type[0] = 0;
   //SetInBGen(true);
   if(c)
      strcpy(type, c.cSymbol);
   else
      PrintType(t, type, printName, fullName);
   //SetInBGen(false);
   if(noTemplateArgs && (d = strchr(type, '<')))
   {
      char * t, * s = d + 1;
      //*s = 0;
      while((t = strchr(s, '>')))
         s = t + 1;
      do { *d = *s; } while(*s);
   }
   if(additionalPointer && t.kind == classType && t._class.registered &&
         (t._class.registered.type == structClass || t._class.registered.type == noHeadClass))
      strcat(type, " *");
   return CopyString(type);
}

Class findClass(const char * name)
{
   Class cl = eSystem_FindClass(g_.mod, name);
   if(cl) readyClass(cl);
   return cl;
}

void readyClass(Class cl)
{
   Context context = SetupTemplatesContext(cl);
   if(!cl.dataType)
      cl.dataType = ProcessTypeString(cl.dataTypeString, false);
   FinishTemplatesContext(context);
}

Class getClassBaseAndProcessTemplateDataType(Class cl, bool * cleanDataType)
{
   Class clBase = null;
   Context context = SetupTemplatesContext(cl);
   if(cl.templateClass)
      clBase = cl.templateClass;
   else
   {
      Class c;
      bool skip = false;
      for(c = cl.base; c; c = c.base)
      {
         int id = 0;
         Class p;
         ClassTemplateParameter param;

         for(p = c.base; p; p = p.base)
            id += p.templateParams.count;
         for(param = c.templateParams.first; param; param = param.next, id++)
         {
            if(param.type == type)
            {
               ClassTemplateArgument * arg = &cl.base.templateArgs[id];
               Type type = ProcessTypeString(arg->dataTypeString, false);
               if(type.kind == templateType)
               {
                  ClassTemplateParameter cp;
                  for(cp = cl.templateParams.first; cp; cp = cp.next)
                     if(!strcmp(cp.name, type.templateParameter.identifier.string))
                     {
                        skip = true;
                        break;
                     }
                  if(skip) break;
               }
               FreeType(type);
            }
            if(skip) break;
         }
         if(skip) break;
      }
      clBase = skip ? cl.base.templateClass : cl.base;
   }
   if(!cl.dataType)
   {
      cl.dataType = ProcessTypeString(cl.dataTypeString, false);
      *cleanDataType = true;
   }
   FinishTemplatesContext(context);
   return clBase;
}

bool skipInternalParametersTemplateClassAndProcessTemplateDataType(Class cl)
{
   Context context = SetupTemplatesContext(cl);
   Class c;
   bool skip = false;
   for(c = cl; c; c = c.base)
   {
      int id = 0;
      Class p;
      ClassTemplateParameter param;

      for(p = c.base; p; p = p.base)
         id += p.templateParams.count;
      for(param = c.templateParams.first; param; param = param.next, id++)
      {
         if(param.type == type)
         {
            ClassTemplateArgument * arg = &cl.templateArgs[id];
            Type type = ProcessTypeString(arg->dataTypeString, false);
            if(type.kind == templateType)
            {
               ClassTemplateParameter cp;
               for(cp = cl.templateParams.first; cp; cp = cp.next)
                  if(!strcmp(cp.name, type.templateParameter.identifier.string))
                  {
                     skip = true;
                     break;
                  }
               if(skip) break;
            }
            FreeType(type);
         }
         if(skip) break;
      }
      if(skip) break;
   }
   if(!cl.dataType)
      cl.dataType = ProcessTypeString(cl.dataTypeString, false);
   FinishTemplatesContext(context);
   return skip;
}

class BMethod : struct
{
   Method md;
   BClass c;
   BOutput outInHeader;
   property Method
   {
      set { storeMapGetInstantiate(BMethod, Method, storeMethods, allMethods, noinit()/*init(value, value._class)*/); }
      get { return md; }
   }
   const char * name;
   char * mname;/* char * name;*/ char * m; char * v; char * s; char * n;
   const char * cpp_name;
   void noinit() { }
   void init(Method md, BClass c, Gen gen)
   {
      if(!(c.isInstance && md._class == c.cl.base))
         conassertctx(md._class == c.cl, "md._class.name != c.cl.name: ", md._class.name, " != ", c.cl.name);
      if(this.md && this.c) return;
      this.md = md;
      this.c = c;
      name = strptrNoNamespace(md.name);
      mname = copyCamelCaseString(md.name);
      if(gen.lang == CPlusPlus)
      {
         MapIterator<consttstr, const String> iNameSwaps { map = gen.cpp_methodNameSwaps };
         if(gen.cpp_methodNameSwaps && iNameSwaps.Index({ c.cl.name, name }, false))
            cpp_name = iNameSwaps.data;
         else if(gen.cpp_methodNameSwaps && iNameSwaps.Index({ "", name }, false))
         {
            cpp_name = iNameSwaps.data;
            debugBreakpoint();
         }
         else
            cpp_name = mname;
      }
      //name = PrintString(c.cname, "_", mname);
      n = PrintString(c.cname, "_", mname); // n = PrintString("MN(", c.cname, ", ", mname, ")");
      m = g_.allocMacroSymbolName(false, METHOD, { }, c.cname, mname, 0);
      v = g_.allocMacroSymbolName(false, M_VTBLID, { }, c.cname, mname, 0);
      s = PrintString(c.is_class ? "" : c.cname, "_", mname);
      if(!md.dataType)
         ProcessMethodType(md);
   }
   bool hasTemplateAnything()
   {
      return impossibledebug_bmethod_hasTemplateAnything(this);
   }
   void free() { delete mname;/* delete name;*/ delete m; delete v; delete s; delete n; }
   void OnFree() { free(); };
};

class BProperty : struct
{
   Property pt;
   BClass c;
   BClass cUse;
   bool convNative;
   int convPointer;
   BClass cConv;
   BClass cConvUse;
   BOutput outInHeader;
   property Property
   {
      set { storeMapGetInstantiate(BProperty, Property, storeProperties, allProperties, init(value, value._class, app.gen)); }
      get { return pt; }
   }
   bool any;
   bool more;
   char * name;
   char * paramName;
   char * otherParamName;
   char * p; char * t; const char * r; const char * v;
   // pt: property
   char * ptType;
   char * ptTypeUse;
   // fpn: function pointer name
   char * fpnSet;
   char * fpnGet;
   char * fpnIst; // IsSet
   Type typeConv;
   void init(Property pt, BClass c, Gen gen)
   {
      this.pt = pt;
      this.c = c;
      name = getSymbolNameStringFromTypeString(pt.name, null);
      if(pt.conversion)
      {
         Type convType = ProcessTypeString(pt.name, false);
         Type t = unwrapPointerTypeNative(convType, &convPointer, &convNative);
         if(convNative)
            typeConv = convType;
         else
         {
            cConv = ((CGen)gen).getClassFromType(t, false);
            cConvUse = reduceUnitClass(cConv.cl);
            FreeType(convType);
         }
         paramName = copyCamelCaseString(name);
      }
      cUse = reduceUnitClass(c.cl);
      any = pt.Set || pt.Get || pt.IsSet;
      more = any ? (pt.Set && (pt.Get || pt.IsSet)) || (pt.Get && pt.IsSet) : false;
      otherParamName = copyCamelCaseString(c.cl.name);
      if((!pt.conversion || c.cl.type == noHeadClass || c.cl.type == structClass || c.cl.type == normalClass) && *otherParamName)
         otherParamName[1] = 0; // temporary
      p = gen.allocMacroSymbolName(false, PROPERTY, { }, c.cname, name, 0);
      if(!pt.dataType)
         pt.dataType = resolveDataTypeStringInTemplatesContext(c.cl, pt.dataTypeString, gen.lang == CPlusPlus);

      t = strTypeName("", { type = pt.dataType, pt = pt, cl = c.cl }, { anonymous = true }, null);
      //else t = null;
      r = (c.cl.type == structClass || c.cl.type == noHeadClass) ? " *" : "";
      if(pt.dataType.kind == classType && pt.dataType._class.registered &&
            (pt.dataType._class.registered.type == structClass/* || pt.dataType._class.registered.type == noHeadClass*/))
         v = " *";
      else v = "";
      /// new cleaner stuff here:
      {
         bool conv = pt.conversion;
         const char * className = c.cname;
         fpnSet = PrintString(className, conv ? "_from_"  : "_set_", name);
         fpnGet = PrintString(className, conv ? "_to_"    : "_get_", name);
         fpnIst = PrintString(className,        "_isSet_"          , name);
      }
      {
         Class cl = c.cl;
         BClass c = cl;
         if(pt.conversion)
         {
            if(convNative)
            {
               ptType = CopyString(pt.name);
               ptTypeUse = CopyString(ptType);
               if(paramName && *paramName)
                  paramName[1] = 0;
            }
            else if(cConv)
            {
               ptType = CopyString(cConv.cSymbol);
               ptTypeUse = CopyString(cConvUse.cSymbol);
            }
         }
         else
         {
            ptType = strTypeName("", { type = pt.dataType, pt = pt, cl = c.cl }, { anonymous = true }, null);
            ptTypeUse = CopyString(ptType);
         }
      }
   }
   void free()
   {
      FreeType(typeConv);
      delete p; delete t;
      delete ptType;
      delete ptTypeUse;
      delete fpnSet;
      delete fpnGet;
      delete fpnIst;
   }
};

bool checkForCircularNamespaceDependenciesB(BNamespacePtr a, BNamespace n, bool indirectOnly,
      AVLTree<BNamespacePtr> visited, Array<BNamespacePtr> stack, Map<SortedSetUIntPtr, Array<BNamespacePtr>> circularDeps)
{
   bool result = false;
   if(!visited.Add((BNamespacePtr)n))
      return result;
   stack.Add((BNamespacePtr)n);
   for(d : n.dependencies)
   {
      BNamespacePtr b = &d;
      BNamespace n2 = (BNamespace)b;
      if(b == a && (!indirectOnly || stack.count > 2))
      {
         SortedSetUIntPtr t { };
         MapIterator<SortedSetUIntPtr, Array<BNamespacePtr>> i { map = circularDeps };
         for(x : stack)
            t.Add((uintptr)x);
         if(!i.Index(t, true)) // is t copied or now owned by the AVLTree? see //else below for delete t;
         {
            Array<BNamespacePtr> s { };
            s.Copy((Container<T>)stack);
            s.Add(b);
            i.data = s;
         }
         else
            delete t;
         result = true;
      }
      if(checkForCircularNamespaceDependenciesB(a, n2, indirectOnly, visited, stack, circularDeps))
         result = true;
   }
   stack.lastIterator.Remove();
   return result;
}

void printCircularOutputDependencies(Container<BOutputPtr> orderedOutputs, bool indirectOnly)
{
   Map<SortedSetUIntPtr, Array<BVariantPtr>> circularDeps { };
   for(e : orderedOutputs)
   {
      BOutput n = (BOutput)e;
      BVariantPtr a = (BVariantPtr)e;
      AVLTree<BVariantPtr> visited { };
      Array<BVariantPtr> stack { };
      if(checkForCircularOutputDependencies(a, n, indirectOnly, visited, stack, circularDeps))
         ;//PrintLn("namespace ", n.name, " is involved in a circular namespace dependency");
      delete visited;
      delete stack;
   }
   if(circularDeps.count)
   {
      PrintLn("--------------- we have ", circularDeps.count, indirectOnly ? " indirect" : "", " circular dependencies");
      for(c : circularDeps)
      {
         Array<BVariantPtr> s = c;
         for(x : s)
         {
            //BOutput n = (BOutput)x;
            //Print(" < -- ", n.info);
         }
         PrintLn("");
         delete s;
      }
   }
   delete circularDeps;
}

bool checkForCircularOutputDependencies(BVariantPtr a, BOutput n, bool indirectOnly,
      AVLTree<BVariantPtr> visited, Array<BVariantPtr> stack, Map<SortedSetUIntPtr, Array<BVariantPtr>> circularDeps)
{
   bool result = false;
   if(!visited.Add((BVariantPtr)n))
      return result;
   stack.Add((BVariantPtr)n);
   for(d : n.outputDependencies)
   {
      BVariantPtr b = d;
      BOutput n2 = (BOutput)b;
      if(b == a && (!indirectOnly || stack.count > 2))
      {
         SortedSetUIntPtr t { };
         MapIterator<SortedSetUIntPtr, Array<BVariantPtr>> i { map = circularDeps };
         for(x : stack)
            t.Add((uintptr)x);
         if(!i.Index(t, true)) // is t copied or now owned by the AVLTree? see //else below for delete t;
         {
            Array<BVariantPtr> s { };
            s.Copy((Container<T>)stack);
            s.Add(b);
            i.data = s;
         }
         else
            delete t;
         result = true;
      }
      if(checkForCircularOutputDependencies(a, n2, indirectOnly, visited, stack, circularDeps))
         result = true;
   }
   stack.lastIterator.Remove();
   return result;
}

bool checkForCircularClassDependencies(BClassPtr a, BClass n, bool indirectOnly,
      AVLTree<BClassPtr> visited, Array<BClassPtr> stack, Map<SortedSetUIntPtr, Array<BClassPtr>> circularDeps)
{
   bool result = false;
   if(!visited.Add((BClassPtr)n))
      return result;
   stack.Add((BClassPtr)n);
   /*for(d : n.dependencies)
   {
      BClassPtr b = d;
      BClass n2 = (BClass)b;
      if(b == a && (!indirectOnly || stack.count > 2))
      {
         SortedSetUIntPtr t { };
         MapIterator<SortedSetUIntPtr, Array<BClassPtr>> i { map = circularDeps };
         for(x : stack)
            t.Add((uintptr)x);
         if(!i.Index(t, true)) // is t copied or now owned by the AVLTree? see //else below for delete t;
         {
            Array<BClassPtr> s { };
            s.Copy((Container<T>)stack);
            s.Add(b);
            i.data = s;
         }
         else
            delete t;
         result = true;
      }
      if(checkForCircularClassDependencies(a, n2, indirectOnly, visited, stack, circularDeps))
         result = true;
   }*/
   stack.lastIterator.Remove();
   return result;
}

void collectBackwardsDependencies(AVLTree<BOutputPtr> in, AVLTree<BNamespacePtr> selfOrAboveNamespace, AVLTree<BOutput> deps)
{
   for(e : in)
   {
      BOutput d = (BOutput)e;
      // if(d.kind == vtemplaton && !strcmp(d.t.c.cl.name, "CMSSList<StylingRuleBlock>")) debugBreakpoint();
      if(!deps.Find(d))
      {
         BNamespace n = d.nspace;
         conassertctx(n != null, "?");
         if(!selfOrAboveNamespace.Find((BNamespacePtr)n))
         {
            bool alreadyMoved = false;
            for(nn : selfOrAboveNamespace)
            {
               BNamespace n = (BNamespace)nn;
               if(n.orderedBackwardsOutputs.Find(e))
               {
                  alreadyMoved = true;
                  break;
               }
            }
            if(!alreadyMoved)
            {
               deps.Add(d);
               collectBackwardsDependencies(d.outputDependencies, selfOrAboveNamespace, deps);
            }
         }
      }
   }
}

void checkNoDoubleOutputEntry(CGen g)
{
   AVLTree<BOutputPtr> outs { };
   for(n : g.bmod.orderedNamespaces)
   {
      for(optr : n.orderedBackwardsOutputs)
      {
         conassertctx(!outs.Find(optr), "?");
         outs.Add(optr);
      }
      for(optr : n.orderedOutputs)
      {
         conassertctx(!outs.Find(optr), "?");
         outs.Add(optr);
      }
   }
   delete outs;
}

#include <float.h>

enum DataValueType
{
   charType, byteType, shortType, uint16Type, intType, uintType, pointerType, floatType, doubleType, int64Type, uint64Type;

   property const char *
   {
      get { return null; }
      set
      {
         if(!strcmp(value, "double"))                    return doubleType;
         else if(!strcmp(value, "float"))                return floatType;
         else if(!strcmp(value, "char"))                 return charType;
         else if(!strcmp(value, "short"))                return shortType;
         else if(!strcmp(value, "int"))                  return intType;
         else if(!strcmp(value, "int64") ||
                 !strcmp(value, "long long"))            return int64Type;
         else if(!strcmp(value, "byte") ||
                 !strcmp(value, "unsigned char"))        return byteType;
         else if(!strcmp(value, "uint16") ||
                 !strcmp(value, "unsigned short"))       return uint16Type;
         else if(!strcmp(value, "uint") ||
                 !strcmp(value, "uint32") ||
                 !strcmp(value, "unsigned int"))         return uintType;
         else if(!strcmp(value, "uint64") ||
                 !strcmp(value, "unsigned long long"))   return uint64Type;
                                                         return intType;
      }
   }
};

bool checkLinearMapping(DataValueType type, void * fn, double * m, double * b)
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

const char * bclassToSimpleClassTypeString(BClass c)
{
   if(c.isString)
      return "string";
   return classTypeToSimpleString(c.cl.type);
}
