import "ecere" // must keep this or compilation outside this file will fail

import "bgen"

#define storeMapGetInstantiate(BType, ECType, array, _map, init) \
   BType result; \
   MapIterator<ECType, BType> i { map = ((CGen)app.gen)._map }; \
   if(i.Index(value, true)) result = i.data; \
   else i.data = result = BType { }, ((CGen)app.gen).array.Add(result), result.init; \
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

class Gen
{
public:
   Language lang;
   Module mod;
   Library lib { };
   Map<String, String> sourceProcessorVars { };
private:
   char * dir;
   virtual bool init()
   {
      return true;
   }
   virtual void process();
   virtual void generate();
   virtual void printOutputFiles();
   virtual void reset();
   virtual bool readyDir()
   {
      bool ready = false;
      delete dir;
      dir = new char[MAX_LOCATION];
      *dir = 0;
      GetWorkingDir(dir, MAX_LOCATION - 1);
      dir[MAX_LOCATION - 1] = 0;
      MakeSlashPath(dir);
      if(lib.outputDir)
      {
         PathCatSlash(dir, lib.outputDir);
         if(!FileExists(dir))
            MakeDir(dir); // todo: check will this create multiple nested dirs
      }
      ready = FileExists(dir).isDirectory;
      return ready;
   }
   ~Gen()
   {
      reset();
      sourceProcessorVars.Free();
      delete dir;
   }
}

class Library : struct
{
public:
   char * name;
   char * moduleName;
   char * bindingName;
   char * defineName;
   char * outputDir;
   bool ecereCOM;
   bool ecere;
   bool eda;

   uint verbose;
   Map<String, String> funcRename;

   verbose = 1;

   void init()
   {
      if(name && !moduleName)
      {
         char str[MAX_LOCATION] = "";
         GetLastDirectory(name, str);
         StripExtension(str);
         moduleName = CopyString(str);
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
      delete outputDir;
      if(funcRename)
      {
         funcRename.Free();
         delete funcRename;
      }
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
   MapIterator<UIntPtr, BVariant> i { map = ((CGen)app.gen).allVariants }; \
   if(i.Index((UIntPtr)value, true)) v = i.data; \
   else i.data = v = BVariant { }, ((CGen)app.gen).storeVariants.Add(v), v.kind = _kind, _ptr = value; \
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
   nil, ocomment, ocode, otypedef, obittool, oenum, ostruct, omethod, oproperty, oconversion, eoe;

   const char * OnGetString(char * tempString, void * fieldData, bool * needClass)
   {
      switch(this)
      {
         case nil:         return "<nil>";
         case ocomment:    return "comment";
         case ocode:       return "code";
         case otypedef:    return "typedef";
         case obittool:    return "bittool";
         case oenum:       return "enum";
         case ostruct:     return "struct";
         case omethod:     return "method";
         case oproperty:   return "property";
         case oconversion: return "conversion";
         case eoe:         return "<eoe>";
      }
      return "<invalid>";
   }

   BOutputType ::getFromVariantKind(BVariantKind kind)
   {
              if(kind == vmethod)   return omethod;
         else if(kind == vproperty) return oproperty;
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
private:
   Array<ASTNode> output { };
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

   void processOutputDependency(BOutput to)
   {
      BNamespace a = nspace;
      BNamespace b = to.nspace;
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
         cname = PrintString("TP(", c.name, ", ", tp.name, ")");
      else
         cname = getTemplateClassSymbol(c.cl.name);
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

#define mapGetCreateOutput(_map, _kind) \
   BOutput o; \
   MapIterator<UIntPtr, BOutput> i { map = ((CGen)app.gen)._map }; \
   if((*init = !i.Index(object, true))) i.data = o = BOutput { _kind }; \
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
   BOutput getDefineOutput       (UIntPtr object, bool *init) { mapGetCreateOutput(mapDefine,         vdefine    ); }
   BOutput getFunctionOutput     (UIntPtr object, bool *init) { mapGetCreateOutput(mapFunction,       vfunction  ); }
   BOutput getTypedefOutput      (UIntPtr object, bool *init) { mapGetCreateOutput(mapTypedef,        vmanual/*vtypedef*/     ); }
   BOutput getClassPointerOutput (UIntPtr object, bool *init) { mapGetCreateOutput(mapClassPointer,   vmanual/*classpointer*/ ); }
   BOutput getBitToolOutput      (UIntPtr object, bool *init) { mapGetCreateOutput(mapBitTool,        vmanual/*vbittool*/     ); }
   BOutput getEnumOutput         (UIntPtr object, bool *init) { mapGetCreateOutput(mapEnum,           vmanual/*venum*/        ); }
   BOutput getStructOutput       (UIntPtr object, bool *init) { mapGetCreateOutput(mapStruct,         vmanual/*vstruct*/      ); }
   BOutput getMethodOutput       (UIntPtr object, bool *init) { mapGetCreateOutput(mapMethod,         vmethod    ); }
   BOutput getPropertyOutput     (UIntPtr object, bool *init) { mapGetCreateOutput(mapProperty,       vproperty  ); }
   BOutput getConversionOutput   (UIntPtr object, bool *init) { mapGetCreateOutput(mapConversion,     vmanual/*vconversion*/  ); }

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
               init((NameSpace *)value, ((CGen)app.gen).allNamespaces.count));
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
                  BOutput swap = (BOutput)orderedBackwardsOutputs[d];
                  orderedBackwardsOutputs.Remove(orderedBackwardsOutputs.GetAtPosition(d, false, null));
                  orderedBackwardsOutputs.Insert(x ? orderedBackwardsOutputs.GetAtPosition(x - 1, false, null) : null, (BOutputPtr)swap);
                  sorted = true;
                  break;
               }
            }
            if(sorted) break;
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
      name = shortName(df.name);
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
      set { storeMapGetInstantiate(BFunction, GlobalFunction, storeFunctions, allFunctions, init(value, ((CGen)app.gen).lib.funcRename)); }
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
      name = shortName(fn.name);
      isDllExport = strstr(fn.dataTypeString, "dllexport") == fn.dataTypeString;
      fname = getNoNamespaceString(fn.name, null, false);
      skip = skipFunctionTree.Find(fname) ? true : false;
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
   //"cclass" or "class"?,
   ""
] };

class BClass : struct
{
   Class cl;
   BNamespace nspace;
   Class clBase;
   DeclarationInit declStruct;

   BOutput outTypedef;
   BOutput outClassPointer;
   BOutput outBitTool;
   BOutput outEnum;
   BOutput outStruct;
   Array<BOutput> outMethods { };
   Array<BOutput> outProperties { };
   Array<BOutput> outConversions { };

   property Class
   {
      set { storeMapGetInstantiate(BClass, Class, storeClasses, allClasses, init(value, app.gen, null)); }
      get { return cl; }
   }

   bool first; bool skip; bool skipTypeDef;
   bool isFromCurrentModule;
   bool is_class; bool isBool; bool isByte; bool isUnichar; bool isUnInt; bool isCharPtr; bool isString;
   bool isModule;
   bool hasPublicMembers;
   bool noMacro, noSpecMacro, nativeSpec;
   // input names:
   const char * name; char * base;
   // generated names:
   char * upper; char * spec;/* char * */
   char * cname;
   char * symbolName;
   char * baseSymbolName;
   void init(Class cl, Gen gen, AVLTree<String> allSpecs)
   {
      bool ecere = gen.lib.ecere;
      this.cl = cl;
      nspace = (NameSpacePtr)cl.nameSpace;
      first = true;
      name = shortName(cl.name);
      skipTypeDef = skipClassTypeDef.Find(cl.name) != 0; // hardcoded hack
      if(/*(ecereCOM || */ecere/*)*/ && cl.type == enumClass && !strcmp(cl.name, "Alignment")) // hardcoded hack
         skip = true;
      cname = getClassTypeName(cl);
      upper = CopyAllCapsString(cl.type == bitClass ? name : "");

      isFromCurrentModule = classIsFromModule(cl, gen.mod, ec1ComponentsApp);

      is_class =  cl.type == systemClass &&   !strcmp(name, "class");
      isBool =    cl.type == enumClass &&     !strcmp(name, "bool");
      isString =  cl.type == normalClass &&   !strcmp(name, "String");
      isUnichar = cl.type == unitClass &&     !strcmp(name, "unichar");
      isUnInt =   cl.type == systemClass &&   !strcmp(name, "unsigned int");
      isByte =    cl.type == systemClass &&   !strcmp(name, "byte");
      isCharPtr = cl.type == normalClass &&   !strcmp(name, "char *");
      isModule =  cl.type == normalClass &&   !strcmp(name, "Module");

      noMacro = cl.type == systemClass || isUnichar;
      noSpecMacro = noMacro || cl.type == enumClass || isString;

      if(cl.templateClass)
         symbolName = getTemplateClassSymbol(cl.name);
      else
         symbolName = noMacro ? CopyString(name) : PrintString("C(", name, ")");

      clBase = getClassBaseAndProcessTemplateDataType(cl);

      if(clBase)
      {
         if(clBase.templateClass)
            baseSymbolName = getTemplateClassSymbol(clBase.name);//getClassTypeName(clBase);
         else
         {
            bool enumDataType = cl.type == enumClass && clBase.type == systemClass;
            bool noMacro = cl.type == systemClass || isUnichar || enumDataType;
            const char * name = enumDataType ? tokenTypeString(cl.dataType) : shortName(clBase.name);
            baseSymbolName = noMacro ? CopyString(name) : PrintString("C(", name, ")");
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
         spec = CopyString("struct CM(Instance) *");
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
   }
   void free() { delete base; delete upper; delete spec; delete cname; delete symbolName; delete baseSymbolName; }
   void OnFree() { free(); };
};

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
      name = shortName(md.name);
      mname = copyCamelCaseString(md.name);
      //name = PrintString(c.cname, "_", mname);
      n = PrintString(c.cname, "_", mname); // n = PrintString("MN(", c.cname, ", ", mname, ")");
      m = PrintString("METHOD(", c.cname, ", ", mname, ")");
      v = PrintString("M_VTBLID(", c.cname, ", ", mname, ")");
      s = PrintString(c.is_class ? "" : c.cname, "_", mname);
      if(!md.dataType)
      {
         Context context = SetupTemplatesContext(md._class);
         ProcessMethodType(md);
         FinishTemplatesContext(context);
      }
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
   char * cc; char * p; char * t; const char * r; const char * v;
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
      cc = oldGetClassTypeName(c.cl.name);
      otherParamName = copyCamelCaseString(c.cl.name);
      if((!pt.conversion || c.cl.type == noHeadClass || c.cl.type == structClass || c.cl.type == normalClass) && *otherParamName)
         otherParamName[1] = 0; // temporary
      p = PrintString("PROPERTY(", cc, ", ", name, ")");
      if(!pt.dataType)
      {
         Context context = SetupTemplatesContext(c.cl);
         pt.dataType = ProcessTypeString(pt.dataTypeString, false);
         FinishTemplatesContext(context);
      }
      t = strTypeName("", { type = pt.dataType, pt = pt, cl = c.cl }, { anonymous = true }, null);
      //else t = null;
      r = (c.cl.type == noHeadClass) ? " *" : "";
      if(pt.dataType.kind == classType && pt.dataType._class.registered &&
            (pt.dataType._class.registered.type == structClass/* || pt.dataType._class.registered.type == noHeadClass*/))
         v = " *";
      else v = "";
      /// new cleaner stuff here:
      {
         bool conv = pt.conversion;
         const char * className = cc;
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
      delete cc; delete p; delete t;
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
