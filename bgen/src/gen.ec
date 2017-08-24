import "ecere" // must keep this or compilation outside this file will fail

import "bgen"

#define storeMapGetInstantiate(BType, ECType, array, _map, init) \
   BType result = null; \
   if(value) \
   { \
   MapIterator<ECType, BType> i { map = g_._map }; \
   if(i.Index(value, true)) result = i.data; \
   else i.data = result = BType { }, g_.array.Add(result), result.init; \
   } \
   return result;

enum Language
{
   null,
   C = 1025,
   CPlusPlus,
   CSharp,
   Java,
   Python,
   _;

   const char * OnGetString(char * tempString, void * fieldData, bool * needClass)
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
};

Map<String, DeclarationInit> typedefs { }; // todo: maybe move this into class Gen
Map<String, DeclarationInit> structs { }; // same

class Gen
{
public:
   Language lang;
   Module mod;
   //Library lib { };
   Library lib;
   Directory dir;
   SymbolNameCollection sym { };
   Map<String, String> sourceProcessorVars { };
   BModule bmod { gen = (CGen)this };
   List<Library> libDeps { };
   bool quiet;
private:
   //char * dir;
   virtual bool init()
   {
      //PrintLn(lang, ":");
      sym.init(this);

      //resetDeclerationsMaps
      typedefs.RemoveAll();
      structs.RemoveAll();

      // prepareVars
      sourceProcessorVars.RemoveAll();
      sourceProcessorVars["LIB_DEF_NAME"] = CopyString(lib.defineName);
      sourceProcessorVars["BINDING_NAME"] = CopyString(lib.bindingName);
      return true;
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
      if(dir.dir)
      {
         if(!FileExists(dir.dir))
            MakeDir(dir.dir); // todo: check will this create multiple nested dirs
      }
      ready = FileExists(dir.dir).isDirectory;
      return ready;
   }
   virtual void moduleInit()
   {
      //Platform os = __runtimePlatform;
      ec1init(lib.loadModuleName); // todo, use supplied path here
      mod = bmod.mod = ec1HomeModule;
      assert(mod != null);
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
   }

   virtual char * allocMacroSymbolName(bool noMacro, MacroType type, const char * name, const char * name2, int ptr);

   virtual void prepareNamespaces();
   virtual void processNamespaces();
   virtual void processDefines(BNamespace n);
   virtual void processFunctions(BNamespace n);
   virtual void processClasses(BNamespace n);

   ~Gen()
   {
      reset();
      sourceProcessorVars.Free();
      //delete dir;
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

   char * cm_instance;

   void init(Gen g)
   {
      instance        = g.allocMacroSymbolName(false, C, "Instance"       , null, 0);
      module          = g.allocMacroSymbolName(false, C, "Module"         , null, 0);
      application     = g.allocMacroSymbolName(false, C, "Application"    , null, 0);
      __class         = g.allocMacroSymbolName(false, C, "Class"          , null, 0);
      method          = g.allocMacroSymbolName(false, C, "Method"         , null, 0);
      _property       = g.allocMacroSymbolName(false, C, "Property"       , null, 0);
      _define         = g.allocMacroSymbolName(false, C, "Define"         , null, 0);
      globalFunction  = g.allocMacroSymbolName(false, C, "GlobalFunction" , null, 0);

      cm_instance     = g.allocMacroSymbolName(false, CM, "Instance"      , null, 0);
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

      delete cm_instance;
   }
}

enum MacroType { C, CM, CO, T, TP, METHOD, PROPERTY, M_VTBLID, SUBCLASS, THISCLASS };

class Directory : struct
{
   Language lang;
   char * outputDir;
   char * dir;
   lang = C;
   void init()
   {
      delete dir;
      dir = new char[MAX_LOCATION];
      *dir = 0;
      GetWorkingDir(dir, MAX_LOCATION - 1);
      dir[MAX_LOCATION - 1] = 0;
      MakeSlashPath(dir);
      if(outputDir)
         PathCatSlash(dir, outputDir);
   }
   ~Directory()
   {
      delete outputDir;
   }
}

Library createLibrary(const char * name)
{
   Library lib { };
   lib.name = CopyString(name);
   lib.init();
   return lib;
}

class GenOptions : struct
{
   Map<String, String> funcRename;

   ~GenOptions()
   {
      if(funcRename)
      {
         funcRename.Free();
         delete funcRename;
      }
   }
}

class Library : struct
{
public:
   char * name;
   char * moduleName;
   char * bindingName;
   char * defineName;
   char * loadModuleName;
   bool ecereCOM;
   bool ecere;
   bool eda;
   GenOptions options;

   uint verbose;

   verbose = 1;

   void init()
   {
      if(name && !moduleName)
      {
         char str[MAX_LOCATION] = "";
         GetLastDirectory(name, str);
         StripExtension(str);
         loadModuleName = CopyString(str);
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

   ~Library()
   {
      delete name;
      delete moduleName;
      delete bindingName;
      delete defineName;
      delete loadModuleName;
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
   MapIterator<UIntPtr, BVariant> i { map = g_.allVariants }; \
   if(i.Index((UIntPtr)value, true)) v = i.data; \
   else i.data = v = BVariant { }, g_.storeVariants.Add(v), v.kind = _kind, _ptr = value; \
   return v;

enum BVariantKind
{
   nil, vmanual, vdefine, vfunction, vclass, vtemplaton, vmethod, vproperty, deprecate_genbit, eoe;

   const char * OnGetString(char * tempString, void * fieldData, bool * needClass)
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

class BVariant : struct
{
public:
   BVariantKind kind;
   AVLTree<BDependency> dependencies { };
   property BDefine
   {
      set { mapGetCreateVariant(vdefine, v.d); }
      get { if(kind == vdefine) return d; assert(false); return null; }
   }
   property BFunction
   {
      set { mapGetCreateVariant(vfunction, v.f); }
      get { if(kind == vfunction) return f; assert(false); return null; }
   }
   property BClass
   {
      set { mapGetCreateVariant(vclass, v.c); }
      get { if(kind == vclass) return c; assert(false); return null; }
   }
   property BTemplaton
   {
      set { mapGetCreateVariant(vtemplaton, v.t); }
      get { if(kind == vtemplaton) return t; assert(false); return null; }
   }
   property BMethod
   {
      set { mapGetCreateVariant(vmethod, v.m); }
      get { if(kind == vmethod) return m; assert(false); return null; }
   }
   property BProperty
   {
      set { mapGetCreateVariant(vproperty, v.p); }
      get { if(kind == vproperty) return p; assert(false); return null; }
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
            case vclass:      return c.cl.name;
            case vfunction:   return f.name;
            case vdefine:     return d.name;
            case vmethod:     return m.m;
            case vproperty:   return p.name;
            case vtemplaton:  return t.c.name;
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
   };
   void noinit() { }

   void processDependency(BOutputType from, BOutputType to, BVariant vDep)
   {
      BNamespace nDep = vDep.nspace;
      BNamespace n = nspace;
      if(from == nil) check();
      if(nDep == n || (vDep.kind == vclass && (vDep.c.isFromCurrentModule || vDep.c.cl.templateClass)))
      {
         BDependency d { from, to, this, vDep };
         if(!to) check();
         if(dependencies.Find(d))
            delete d;
         else
            dependencies.Add(d);
      }
   }
}

enum BOutputType
{
   nil, ocomment, ocode, odefine, otypedef, obittool, oenum, ostruct, ofunction, omethod, oproperty, oconversion,
   oclasspointer, oother, eoe;

   const char * OnGetString(char * tempString, void * fieldData, bool * needClass)
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
         else if(kind == vproperty) return oproperty;
         else if(kind == vclass)    return otypedef;
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
   DynamicString ds;
   AVLTree<BOutputPtr> outputDependencies { };

   ~BOutput()
   {
      outputDependencies.Free();
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
         else check();*/
      }
      outputDependencies.Add((BVariantPtr)to);
      // dependencies outside current module already filtered out by BClass::processDependency()
      if(b != a)
         a.addOutputDependency(b, to);
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
         cname = g_.allocMacroSymbolName(false, TP, c.name, tp.name, 0);
      else
         cname = g_.allocMacroSymbolName(false, T, c.cl.name, null, 0);
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
            case otypedef:    return v.c.outTypedef;
            case ostruct:     return v.c.outStruct;
            case omethod:     return v.m.outInHeader;
            case oconversion:
            case oproperty:
                              return v.p.outInHeader;
            case oother:
               switch(v.kind)
               {
                  case vdefine: return v.d.out;
               }
         }
         check();
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
               case otypedef: if(!vDep.c.outTypedef) check(); break;
               case oenum:    if(!vDep.c.outEnum) check(); break;
               case ostruct:  if(!vDep.c.outStruct) check(); break;
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
               return vDep.t.outTypedef;
         }
         check();
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

class OptBits
{
   bool _extern:1;
   bool _dllimport:1;
   bool pointer:1;
   bool anonymous:1;
   bool notype:1;
   bool param:1;
};

class TypeInfo : struct
{
   Type type;
   GlobalFunction fn;
   Property pt;
   Method md;
   DataMember dm;
   Class cl;

   BFunction f;
   BProperty p;
   BMethod m;
   BClass c;
   BTemplaton t;

   property TypeInfo from
   {
      set
      {
         fn = value.fn;
         pt = value.pt;
         md = value.md;
         dm = value.dm;
         cl = value.cl;

         f = value.f;
         p = value.p;
         m = value.m;
         c = value.c;
      }
   }
}

struct NamespaceDependencyInfo
{
   int weight;
   bool aDependsOnB;
};

//class Namespaces : List<BNamespace>;

#define mapGetCreateOutput(_map, _kind, _type) \
   BOutput o; \
   MapIterator<UIntPtr, BOutput> i { map = g_._map }; \
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
   Map<BTemplatonKey, BTemplaton> templatons { };

   BTemplaton addTempleton(ClassTemplateParameter tp, Class cl)
   {
      BTemplaton t;
      BTemplatonKey key { (uintptr)tp, (uintptr)cl };
      MapIterator<BTemplatonKey, BTemplaton> i { map = templatons };
      if(i.Index(key, true)) t = i.data;
      else i.data = t = BTemplaton { tp, cl }, t.init();
      return t;
   }
   BTemplaton addTemplateType(Class cl, BNamespace nspace)
   {
      BTemplaton t;
      BTemplatonKey key { (uintptr)0, (uintptr)cl };
      MapIterator<BTemplatonKey, BTemplaton> i { map = templatons };
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
      Map<tuintptr, NamespaceDependencyInfo> deps { };
      for(e : orderedNamespaces)
      {
         BNamespace n = (BNamespace)e;
         n.addDirectUsersDependencies();
      }
      for(e : orderedNamespaces)
      {
         BNamespace n = (BNamespace)e;
         BNamespacePtr a = (BNamespacePtr)e;
         for(dependency : n.dependencies)
         {
            BNamespacePtr b = &dependency;
            tuintptr t { (uintptr)(a < b ? a : b), (uintptr)(a > b ? a : b) };
            bool update = false;
            MapIterator<tuintptr, NamespaceDependencyInfo> i { map = deps };
            //PrintLn(dependency.count);
            assert(a != b);
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
               BNamespacePtr a = (BNamespacePtr)orderedNamespaces[x];
               BNamespacePtr b = (BNamespacePtr)orderedNamespaces[d];
               tuintptr t { (uintptr)(a < b ? a : b), (uintptr)(a > b ? a : b) };
               MapIterator<tuintptr, NamespaceDependencyInfo> i { map = deps };
               assert(a != b);
               if(i.Index(t, false))
               {
                  NamespaceDependencyInfo info = i.data;
                  if(info.aDependsOnB && a < b)
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
            Map<BTemplatonKey, BTemplaton> templatons { };

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
         AVLTree<BOutputPtr> deps { };
         for(optr : n.orderedOutputs)
         {
            BOutput o = (BOutput)optr;
            collectBackwardsDependencies(o.outputDependencies, selfOrAboveNamespace, deps);
         }
         selfOrAboveNamespace.Add((BNamespacePtr)n);
         for(dependency : deps)
         {
            BOutput d = (BOutput)dependency;
            BNamespace dn = d.nspace;
            if(dn.orderedOutputs.Find(dependency))
            {
               dn.orderedOutputs.Remove(dn.orderedOutputs.Find(dependency));
               if(!n.orderedBackwardsOutputs.Find(dependency))
                  n.orderedBackwardsOutputs.Add(dependency);
               else check();
            }
         }
         delete deps;
      }
      delete selfOrAboveNamespace;
   }
}

#define addThatThing(_thing) orderedOutputs.Add(_thing), assert(!outs.Find(_thing)), outs.Add(_thing)

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
      assert(!this.pos);
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
         assert(v.c.isFromCurrentModule == true || v.c.nspace != this);
      contents.Add(v);
   }

   void positionOutput(CGen g)
   {
      AVLTree<BOutputPtr> outs { };
      for(v : contents; v.kind == vdefine)
         addThatThing((BOutputPtr)v.d.out), assert(v.d.out != null);
      for(vv : contents; (vv.kind == vclass && vv.c.outTypedef) || (vv.kind == vtemplaton && vv.t.outTypedef))
      {
         BVariant v = vv;
         BOutput o = v.kind == vclass ? v.c.outTypedef : v.t.outTypedef;
         orderedOutputs.Add((BOutputPtr)o);
         assert(!outs.Find((BOutputPtr)o));
         outs.Add((BOutputPtr)o);
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
         addThatThing((BOutputPtr)v.f.out), assert(v.f.out != null);
      delete outs;
   }

   void sort()
   {
      bool sorted = true;
      int fix = 0;
      if(python && py)
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
               assert(d > x);
               if((a.nspace == b.nspace || (b.kind == vclass && b.c.cl.templateClass)) && a.dependsOn(b))
               {
                  BOutput swap = (BOutput)orderedOutputs[d];
                  if(b.indirectlyDependsOn((BOutputPtr)a))
                     shh();
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
               assert(d > x);
               if(/*a.nspace == b.nspace && */a.dependsOn(b))
               {
                  if(b.indirectlyDependsOn((BOutputPtr)a))
                  {
                     //PrintLn("a: ", a.kind, " ", a.c.name, "  ", "b: ", b.kind, " ", b.c.name);
                     shh();
                  }
                  else
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
            PrintLn("we were trying to sort ", name, " for ", g_.lang);
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
      set { storeMapGetInstantiate(BFunction, GlobalFunction, storeFunctions, allFunctions, init(value, g_.lib.options.funcRename)); }
      get { return fn; }
   }
   bool skip;
   bool isDllExport;
   const char * name;
   char * fname; char * ccfname; char * gname; const char * easy; const char * mapName; const char * oname;
   void init(GlobalFunction fn/*, Module m*/, Map<String, String> funcRename)
   {
      this.fn = fn;
      nspace = (NameSpacePtr)fn.nameSpace;
      name = strptrNoNamespace(fn.name);
      isDllExport = strstr(fn.dataTypeString, "dllexport") == fn.dataTypeString;
      fname = getNoNamespaceString(fn.name, null, false);
      skip = (skipFunctionTree.Find(fname) || (python && skipPyFunctionTree.Find(fname))) ? true : false;
      ccfname = getNoNamespaceString(fn.name, null, true);
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
      if(!fn.dataType) fn.dataType = ProcessTypeString(fn.dataTypeString, false);
      //if(!(m && fn.module && fn.module != ec1HomeModule/* && !(ecereCOM && !fn.module)*/))
      //if(!/*((!m || !m.name) && */skipFunctionTree.Find(fname)/*)*/)
      //   return true;
      //return false;
   }
   void free() { delete fname; delete ccfname; delete gname; }
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

   property Class
   {
      set { storeMapGetInstantiate(BClass, Class, storeClasses, allClasses, init(value, app.gen, null)); }
      get { return cl; }
   }

   bool first; bool skip; bool skipTypeDef;
   bool isFromCurrentModule;
   bool is_class;// bool is_Class;
   bool isBool; bool isByte; bool isUnichar; bool isUnInt; bool isCharPtr; bool isString;
   bool isInstance, isClass, isModule, isApplication, isGuiApplication, isContainer, isArray, isAnchor, isWindow;
   bool hasPublicMembers;
   bool noMacro, noSpecMacro, nativeSpec;
   // input names:
   const char * name; char * base;
   // generated names:
   char * upper; char * spec;
   char * cname;
   char * coSymbol;
   char * symbolName;
   char * baseSymbolName;
   char * py_initializer;
   void init(Class cl, Gen gen, AVLTree<String> allSpecs)
   {
      bool ecere = gen.lib.ecere;
      this.cl = cl;
      nspace = (NameSpacePtr)cl.nameSpace;
      first = true;
      name = strptrNoNamespace(cl.name);
      // skipping these classes here as they are internal native types or base class/struct
      skipTypeDef = skipClassTypeDef.Find(cl.name) != 0;
      // skipping these classes here since they are hardcoded
      if(ecere && ((!py && cl.type == structClass && !strcmp(cl.name, "Size")) ||
            (!py && cl.type == unitClass && !strcmp(cl.name, "MinMaxValue")) ||
            (!py && cl.type == enumClass && !strcmp(cl.name, "Alignment"))))
         skip = true;
      cname = getClassTypeName(cl);
      coSymbol = g_.allocMacroSymbolName(false, CO, cname, null, 0);
      upper = CopyAllCapsString(cl.type == bitClass ? name : "");

      isFromCurrentModule = classIsFromModule(cl, gen.mod, ec1ComponentsApp);

      is_class          = cl.type == systemClass   && !strcmp(name, "class");
      isBool            = cl.type == enumClass     && !strcmp(name, "bool");
      isString          = cl.type == normalClass   && !strcmp(name, "String");
      isUnichar         = cl.type == unitClass     && !strcmp(name, "unichar");
      isUnInt           = cl.type == systemClass   && !strcmp(name, "unsigned int");
      isByte            = cl.type == systemClass   && !strcmp(name, "byte");
      isCharPtr         = cl.type == normalClass   && !strcmp(name, "char *");
      isInstance        = cl.type == normalClass   && !strcmp(name, "Instance");
      isClass           = cl.type == noHeadClass   && !strcmp(name, "Class");
      isModule          = cl.type == normalClass   && !strcmp(name, "Module");
      isApplication     = cl.type == normalClass   && !strcmp(name, "Application");
      isGuiApplication  = cl.type == normalClass   && !strcmp(name, "GuiApplication");
      isContainer       = cl.type == normalClass   && !strcmp(name, "Container");
      isArray           = cl.type == normalClass   && !strcmp(name, "Array");
      isAnchor          = cl.type == structClass   && !strcmp(name, "Anchor");
      isWindow          = cl.type == normalClass   && !strcmp(name, "Window");

      if(is_class)
         clAlt = eSystem_FindClass(g_.mod, "Class");

      noMacro = cl.type == systemClass || isUnichar;
      noSpecMacro = noMacro || cl.type == enumClass || isString;

      if(cl.templateClass)
         symbolName = g_.allocMacroSymbolName(false, T, cl.name, null, 0);
      else
         symbolName = g_.allocMacroSymbolName(noMacro, C, name, null, 0);

      if(python && py && isBool)
         symbolName[0] = (char)toupper(symbolName[0]); // Bool

      clBase = getClassBaseAndProcessTemplateDataType(cl);

      if(clBase)
      {
         if(clBase.templateClass)
            baseSymbolName = g_.allocMacroSymbolName(false, T, clBase.name, null, 0);
         else
         {
            bool enumDataType = cl.type == enumClass && clBase.type == systemClass;
            bool noMacro = cl.type == systemClass || isUnichar || enumDataType;
            const char * name = enumDataType ? tokenTypeString(cl.dataType) : strptrNoNamespace(clBase.name);
            baseSymbolName = g_.allocMacroSymbolName(noMacro, C, name, null, 0);
            if(cl.type == enumClass)
               base = CopyString(name);
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
         spec = CopyString("uint32"); // hack
      else if(cl.type == bitClass) // todo?: support multiple size?
         spec = CopyString("uint32"); // hack
      else if(cl.type == systemClass || cl.type == unitClass || isString)
      {
         bool useBase = false; // = cl.type == unitClass && cl.base.name && strcmp(cl.base.name, "class");
         //if(useBase) check();
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
         if((cl.type == noHeadClass || cl.type == structClass) && !hasPublicMembers)
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
         }
         if(!spec)
            spec = CopyString(cname);
      }

      if(!base) base = CopyString(spec);

      if(allSpecs && !allSpecs.Find(spec)) allSpecs.Add(CopyString(spec));

      nativeSpec = checkNativeSpec(spec);
      if(nativeSpec || actualTypeNames.Find(spec)) noSpecMacro = true;
      if(cl.type == unitClass)
         //py_initializer = CopyString("0");
         py_initializer = PrintString(symbolName, "(0)");
      else
         py_initializer = PrintString(symbolName, "()");
   }
   void free()
   {
      delete base; delete upper; delete spec; delete cname; delete symbolName; delete baseSymbolName;
      delete coSymbol;
      delete py_initializer;
   }
   void OnFree() { free(); };
};

static inline const char * strptrNoNamespace(const char * str)
{
   const char * t, * s = str;
   while((t = strstr(s, "::"))) s = t + 2;
   //const char * s = (s = RSearchString(str, "::", strlen(str), false, false), s ? s + 2 : str);
   return s;
}

const char * bgenSymbolSwap(const char * symbol, bool reduce, bool macro)
{
   Class cl = eSystem_FindClass(g_.mod, strptrNoNamespace(symbol));
   if(cl)
   {
      Class cl2 = reduce ? reduceUnitClass(cl) : cl;
      BClass c = cl2;
      return macro ? c.symbolName : c.name;
   }
   return symbol;
}

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
      return c.symbolName;
   }
   return spec;
}

char * printType(Type t, bool printName, bool fullName)
{
   char type[8192];
   type[0] = 0;
   SetInBGen(true);
   PrintType(t, type, printName, fullName);
   SetInBGen(false);
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

Class getClassBaseAndProcessTemplateDataType(Class cl)
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
      cl.dataType = ProcessTypeString(cl.dataTypeString, false);
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
   void noinit() { }
   void init(Method md, BClass c)
   {
      assert(md._class == c.cl);
      if(this.md && this.c) return;
      this.md = md;
      this.c = c;
      name = strptrNoNamespace(md.name);
      mname = copyCamelCaseString(md.name);
      //name = PrintString(c.cname, "_", mname);
      n = PrintString(c.cname, "_", mname); // n = PrintString("MN(", c.cname, ", ", mname, ")");
      m = g_.allocMacroSymbolName(false, METHOD, c.cname, mname, 0);
      v = g_.allocMacroSymbolName(false, M_VTBLID, c.cname, mname, 0);
      s = PrintString(c.is_class ? "" : c.cname, "_", mname);
      if(!md.dataType)
         ProcessMethodType(md);
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
   bool convPointer;
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
   void init(Property pt, BClass c, Gen gen)
   {
      this.pt = pt;
      this.c = c;
      name = getSymbolNameStringFromTypeString(pt.name, null);
      if(pt.conversion)
      {
         Type convType = ProcessTypeString(pt.name, false);
         Type t = unwrapType(convType, &convNative, &convPointer);
         if(!convNative)
         {
            cConv = ((CGen)gen).getClassFromType(t, false);
            cConvUse = reduceUnitClass(cConv.cl);
         }
         FreeType(convType);
         paramName = copyCamelCaseString(name);
      }
      cUse = reduceUnitClass(c.cl);
      any = pt.Set || pt.Get || pt.IsSet;
      more = any ? (pt.Set && (pt.Get || pt.IsSet)) || (pt.Get && pt.IsSet) : false;
      otherParamName = copyCamelCaseString(c.cl.name);
      if((!pt.conversion || c.cl.type == noHeadClass || c.cl.type == structClass || c.cl.type == normalClass) && *otherParamName)
         otherParamName[1] = 0; // temporary
      p = gen.allocMacroSymbolName(false, PROPERTY, c.cname, name, 0);
      if(!pt.dataType)
      {
         Context context = SetupTemplatesContext(c.cl);
         pt.dataType = ProcessTypeString(pt.dataTypeString, false);
         FinishTemplatesContext(context);
      }
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
               ptType = CopyString(cConv.symbolName);
               ptTypeUse = CopyString(cConvUse.symbolName);
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

void collectBackwardsDependencies(AVLTree<BOutputPtr> in, AVLTree<BNamespacePtr> selfOrAboveNamespace, AVLTree<BOutputPtr> deps)
{
   for(e : in)
   {
      BOutput d = (BOutput)e;
      if(!deps.Find(e))
      {
         BNamespace n = d.nspace;
         assert(n != null);
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
               deps.Add(e);
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
         assert(!outs.Find(optr));
         outs.Add(optr);
      }
      for(optr : n.orderedOutputs)
      {
         assert(!outs.Find(optr));
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
