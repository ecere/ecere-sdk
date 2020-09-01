import "ecere" // must keep this or compilation outside this file will fail

char * copyNamespaceFullName(NameSpace * ns, Application addModuleName)
{
   char * fullName = null;
   if(ns)
   {
      int mlen, len = 0;
      bool ecereCOM = false;
      const char * moduleName = null;
      Module m = addModuleName ? searchModulesForNamespace(addModuleName, ns, &ecereCOM) : null;
      NameSpace * n;
      for(n = ns; n; n = n->parent)
      {
         if(n->name)
            len += len ? 2 : 0 + strlen(n->name);
      }
      if(addModuleName)
      {
         if(m && m.name) moduleName = m.name;
         else moduleName = "0";
         mlen = strlen(moduleName) + 3;
         len += mlen;
      }
      fullName = new char[len + 128];
      if(addModuleName)
      {
         //sprintf(fullName, "[%s]", moduleName);
         //sprintf(fullName, "%s/", moduleName); // why is this causing a crash in unrelated memory allocation? :S
         sprintf(fullName, "[%s]/", moduleName);
         printNamespaceFullName(fullName + mlen, ns);
      }
      else
      {
         *fullName = 0;
         printNamespaceFullName(fullName, ns);
      }
   }
   else
      fullName = CopyString("(null)");
   return fullName;
}

void printNamespaceFullName(char * output, NameSpace * ns)
{
   if(ns->parent) printNamespaceFullName(output, ns->parent);
   if(ns->name && ns->name[0])
   {
      if(*output) strcat(output, "::");
      strcat(output, ns->name);
   }
}

Module searchModulesForNamespace(Module start, NameSpace * space, bool * markEcereCOM)
{
   Module module = null;
   IterNamespace ns { module = start };
   while(ns.next())
   {
      if(ns.ns == space)
      {
         module = start;
         break;
      }
   }
   ns.cleanup();
   if(!module)
   {
      if(!strcmp(start._class.name, "Application")) // if(start._class == class(Application)) doesn't work :(
      {
         Module m;
         for(m = ((Application)start).allModules.first; !module && m; m = m.next)
            module = searchModulesForNamespace(m, space, markEcereCOM);
      }
      else
      {
         SubModule m;
         for(m = start.modules.first; !module && m; m = m.next)
            module = searchModulesForNamespace(m.module, space, markEcereCOM);
      }
   }
   if(!module && start.name && !strcmp(start.name, "ecere"))
   {
      IterNamespace ns { module = start, ecereCOM = true };
      while(ns.next())
      {
         if(ns.ns == space)
         {
            module = start;
            *markEcereCOM = true;
            break;
         }
      }
      ns.cleanup();
   }
   return module;
}

uint classTypeLen(ClassType ct)
{
   switch(ct)
   {
      case bitClass:    return  8;
      case unitClass:
      case enumClass:   return  9;
      case unionClass:  return 10;
      case normalClass:
      case structClass:
      case noHeadClass:
      case systemClass: return 11;
   }
   return 0;
}

const char * fixedLengthNamesOfClassTypes[9 * 5] = {
      "er",    "nm",       "st",       "bt",    "ut",    "en",    "nh",       "un",    "st",
      "err",   "nor",      "str",      "bit",   "unt",   "enm",   "nhd",      "uni",   "sys",
      "eror",  "norm",     "strc",     "bitc",  "unit",  "enum",  "nohd",     "unio",  "syst",
      "error", "norml",    "struc",    "bitcl", "unitc", "enumc", "nohed",    "union", "systm",
      "error", "normal",   "struct",   "bits",  "unit",  "enum",  "nohead",   "union", "system"
};

const char * classTypeFixedLengthString(ClassType ct, int len)
{
   if(len >= 2 && len <= 5)
   {
      int n = len - 2;
      switch(ct)
      {
         case normalClass: return fixedLengthNamesOfClassTypes[1 + n * 9];
         case structClass: return fixedLengthNamesOfClassTypes[2 + n * 9];
         case bitClass:    return fixedLengthNamesOfClassTypes[3 + n * 9];
         case unitClass:   return fixedLengthNamesOfClassTypes[4 + n * 9];
         case enumClass:   return fixedLengthNamesOfClassTypes[5 + n * 9];
         case noHeadClass: return fixedLengthNamesOfClassTypes[6 + n * 9];
         case unionClass:  return fixedLengthNamesOfClassTypes[7 + n * 9];
         case systemClass: return fixedLengthNamesOfClassTypes[8 + n * 9];
      }
      return fixedLengthNamesOfClassTypes[0 + n * 9];
   }
   return null;
}

const char * classTypeToSimpleString(ClassType ct)
{
   switch(ct)
   {
      case normalClass: return fixedLengthNamesOfClassTypes[4 * 9 + 1];
      case structClass: return fixedLengthNamesOfClassTypes[4 * 9 + 2];
      case bitClass:    return fixedLengthNamesOfClassTypes[4 * 9 + 3];
      case unitClass:   return fixedLengthNamesOfClassTypes[4 * 9 + 4];
      case enumClass:   return fixedLengthNamesOfClassTypes[4 * 9 + 5];
      case noHeadClass: return fixedLengthNamesOfClassTypes[4 * 9 + 6];
      case unionClass:  return fixedLengthNamesOfClassTypes[4 * 9 + 7];
      case systemClass: return fixedLengthNamesOfClassTypes[4 * 9 + 8];
   }
   return fixedLengthNamesOfClassTypes[4 * 9];
}

bool classIsFromModule(Class c, Module m, Application a)
{
   bool ecereCOM = false;
   Module mod = searchModulesForNamespace(a, c.nameSpace, &ecereCOM);
   return mod == m && !ecereCOM;
}

List<Class> getClassLineage(Class c)
{
   List<Class> lineage { };
   Class cl;
   for(cl = c; cl; cl = cl.base)
   {
      if(cl.templateClass) cl = cl.templateClass;
      lineage.Insert(null, cl);
      if(cl.inheritanceAccess == privateAccess)
         break;
   }
   return lineage;
}

List<Class> getCorrectClassLineage(Class c) // todo: review getClassLineage usage and replace with this implementation
{
   List<Class> lineage { };
   Class cl;
   for(cl = c; cl; cl = cl.templateClass ? cl.templateClass : cl.base)
   {
      lineage.Insert(null, cl);
      if(cl.inheritanceAccess == privateAccess)
         break;
   }
   return lineage;
}

List<Class> getFilteredClassLineage(Class c, ClassFilter filter)
{
   List<Class> lineage { };
   Class cl;
   for(cl = c; cl; cl = cl.templateClass ? cl.templateClass : cl.base)
   {
      if(!filter.match(cl.type))
         break;
      lineage.Insert(null, cl);
      if(cl.inheritanceAccess == privateAccess)
         break;
   }
   return lineage;
}

public struct IterNamespace
{
public:
   property Module module { set { module = value; ecereCOM = module.name && !strcmp(module.name, "ecereCOM"); } }
   bool insideFirst;
   bool siblingsOnly;
   bool processFullName;
   NameSpace * ns;
   //property NameSpace * { get { return ns; } }
   Module itModule;
   char * fullName;
   int depth;
   void ready() { ns = null; cleanup(); }
   NameSpace * next()
   {
      bool push = false;
      if(!ns)
      {
         if(ecereCOM)
         {
            ns = &module.application.systemNameSpace;
            itModule = null;
         }
         else
         {
            ns = &module.publicNameSpace;
            itModule = module;
         }
         if(processFullName)
         {
            if(!fullName) fullName = new char[MAX_LOCATION];
            *fullName = 0;
            if(ns && ns->name) strcpy(fullName, ns->name);
         }
         push = insideFirst && !siblingsOnly;
      }
      else
      {
         if(ns->nameSpaces.first && !siblingsOnly && !insideFirst)
            push = true;
         else
         {
            for(;;)
            {
               if(((BTNode)ns).next)
               {
                  ns = (NameSpace *)((BTNode)ns).next;
                  push = insideFirst && !siblingsOnly;
                  if(processFullName)
                  {
                     fullName[stack.count ? stack.lastIterator.data.cut : 0] = 0;
                     if(*fullName) strcat(fullName, "::");
                     strcat(fullName, ns->name);
                  }
                  break;
               }
               else if(stack && stack.count)
               {
                  INFrame frame = stack.lastIterator.data;
                  ns = (NameSpace *)frame.ns;
                  depth--;
                  stack.lastIterator.Remove();
                  if(processFullName)
                     fullName[frame.cut] = 0;
                  if(insideFirst)
                     break;
               }
               else
               {
                  ns = null;
                  break;
               }
            }
         }
      }
      if(push)
      {
         if(!stack) stack = { };
         while(ns->nameSpaces.first)
         {
            depth++;
            stack.Add({ (uintptr)ns, processFullName ? strlen(fullName) : 0 });
            ns = (NameSpace *)ns->nameSpaces.first;
            if(processFullName)
            {
               if(*fullName) strcat(fullName, "::");
               strcat(fullName, ns->name);
            }
            if(!insideFirst)
               break;
         }
      }
      return ns;
   }

   void cleanup()
   {
      delete fullName;
      delete stack;
   }
private:
   Module module;
   bool ecereCOM;
   List<INFrame> stack;
};
struct INFrame { uintptr ns; uint cut; };

public class BlackWhiteList : AVLTree<const String>
{
public:
   bool black;
   bool match(const String name)
   {
      return !this || black == (Find(name) == null);
   }
};

public struct IterDefine
{
public:
   NameSpace * ns;
   BlackWhiteList list;
   DefinedExpression df;
   property DefinedExpression { get { return df; } }
   void reset() { df = null; _it = null; }
   DefinedExpression next()
   {
      _it = _it ? (BTNamedLink)((BTNode)_it).next : (BTNamedLink)ns->defines.first;
      while(_it && !list.match(((DefinedExpression)_it.data).name))
         _it = (BTNamedLink)((BTNode)_it).next;
      df = _it ? _it.data : null;
      return df;
   }
private:
   BTNamedLink _it;
};

public struct IterFunction
{
public:
   NameSpace * ns;
   BlackWhiteList list;
   GlobalFunction fn;
   property GlobalFunction { get { return fn; } }
   void reset() { fn = null; _it = null; }
   GlobalFunction next()
   {
      _it = _it ? (BTNamedLink)((BTNode)_it).next : (BTNamedLink)ns->functions.first;
      while(_it && !list.match(((GlobalFunction)_it.data).name))
         _it = (BTNamedLink)((BTNode)_it).next;
      fn = _it ? _it.data : null;
      return fn;
   }
private:
   BTNamedLink _it;
};

public enum ClassFilter
{
   all, normalOnly, structOnly, bitOnly, unitOnly, enumOnly, noHeadOnly, systemOnly;
public:
   bool match(ClassType classType)
   {
      switch(this)
      {
         case all:         return true;
         case normalOnly:  return classType == normalClass;
         case structOnly:  return classType == structClass;
         case bitOnly:     return classType == bitClass;
         case unitOnly:    return classType == unitClass;
         case enumOnly:    return classType == enumClass;
         case noHeadOnly:  return classType == noHeadClass;
         case systemOnly:  return classType == systemClass;
      }
      return false;
   }
};

public struct IterClass
{
public:
   NameSpace * ns;
   BlackWhiteList list;
   Class cl;
   property Class { get { return cl; } }
   void reset() { cl = null; _it = null; }
   Class next(ClassFilter filter)
   {
      _it = _it ? (BTNamedLink)((BTNode)_it).next : (BTNamedLink)ns->classes.first;
      while(_it && !(filter.match(((Class)_it.data).type) && list.match(((Class)_it.data).name)))
         _it = (BTNamedLink)((BTNode)_it).next;
      cl = _it ? _it.data : null;
      return cl;
   }
private:
   BTNamedLink _it;
};

public struct IterAllClass
{
public:
   // issue with doing:
   // IterAllClass itacl { module = g.mod };
   // have to do this instead:
   // IterAllClass itacl { itn.module = g.mod };
   // it's not using the property as first thing to initialize it goes directly to the first member aka itn
   property Module module { get { return itn.module; } set { itn.module = value; }  }
   property bool ecereCOM { get { return itn.ecereCOM; } set { itn.ecereCOM = value; }  }
   IterNamespace itn { };
   BlackWhiteList list;
   Class cl;
   property Class { get { return cl; } }
   void reset() { cl = null; _it = null; }
   Class next(ClassFilter filter)
   {
      while(_next() && !filter.match(((Class)_it.data).type) && list.match(((Class)_it.data).name));
      cl = _it ? _it.data : null;
      return cl;
   }
   void cleanup()
   {
      itn.cleanup();
   }
private:
   bool _next()
   {
      if(!itn.ns) itn.next();
      while(itn.ns && !(_it = _it ? (BTNamedLink)((BTNode)_it).next : (BTNamedLink)itn.ns->classes.first))
      {
         itn.next();
         _it = null;
      }
      return itn.ns != null;
   }
   BTNamedLink _it;
};

public enum MethodFilter
{
   all, publicOnly, privateOnly, privateAndPublic, publicNormal, publicVirtual;
public:
   bool match(AccessMode accessMode, MethodType methodType)
   {
      switch(this)
      {
         case all:               return true;
         case publicOnly:        return accessMode == publicAccess;
         case privateOnly:       return accessMode == privateAccess;
         case privateAndPublic:  return accessMode == privateAccess || accessMode == publicAccess;
         case publicNormal:      return accessMode == publicAccess && methodType == normalMethod;
         case publicVirtual:     return accessMode == publicAccess && methodType == virtualMethod;
      }
      return false;
   }
};

public struct IterMethod
{
public:
   Class cl;
   Method md;
   property Method { get { return md; } }
   void reset() { md = null; }
   Method next(MethodFilter filter)
   {
      md = md ? (Method)((BTNode)md).next : (Method)cl.methods.first;
      while(md && !filter.match(md.memberAccess, md.type))
         md = (Method)((BTNode)md).next;
      return md;
   }
};

public enum AccessModeFilter
{
   all, publicOnly, privateOnly, privateAndPublic;
public:
   bool match(AccessMode accessMode)
   {
      switch(this)
      {
         case all:               return true;
         case publicOnly:        return accessMode == publicAccess;
         case privateOnly:       return accessMode == privateAccess;
         case privateAndPublic:  return accessMode == privateAccess || accessMode == publicAccess;
         // defaultAccess, staticAccess, baseSystemAccess
      }
      return false;
   }
};

public class MemberOrProperty : struct
{
public:
   class_fixed
   class_no_expansion
   MemberOrProperty prev, next;
   const char * name;
   bool isProperty;
   AccessMode memberAccess;
   int id;
   Class _class;
   const char * dataTypeString;
   Class dataTypeClass;
   //Type dataType;
}

public struct IterMemberOrProperty
{
public:
   Class cl;
   MemberOrProperty or;
   property MemberOrProperty { get { return or; } }
   void reset() { or = null; }
   MemberOrProperty next(AccessModeFilter filter)
   {
      or = or ? or.next : (MemberOrProperty)cl.membersAndProperties.first;
      while(or && !filter.match(or.memberAccess))
         or = or.next;
      return or;
   }
};

public struct IterProperty
{
public:
   Class cl;
   Property pt;
   property Property { get { return pt; } }
   void reset() { pt = null; }
   Property next(AccessModeFilter filter)
   {
      MemberOrProperty it = (MemberOrProperty)pt;
      it = it ? it.next : (MemberOrProperty)cl.membersAndProperties.first;
      while(it && (!it.isProperty || !filter.match(it.memberAccess)))
         it = it.next;
      pt = it ? (Property)it : null;
      return pt;
   }
};

public struct IterDataMember
{
public:
   Class cl;
   DataMember dm;
   property DataMember { get { return dm; } }
   void reset() { dm = null; }
   DataMember next(AccessModeFilter filter)
   {
      MemberOrProperty it = (MemberOrProperty)dm;
      it = it ? it.next : (MemberOrProperty)cl.membersAndProperties.first;
      while(it && (it.isProperty || !filter.match(it.memberAccess)))
         it = it.next;
      dm = it ? (DataMember)it : null;
      return dm;
   }
};

public enum MemberOrPropertyFilter
{
   all, privateOnly, publicOnly, privateAndPublic, normalOnly, unionOnly, structOnly, publicNormal, privateNormal;
public:
   bool match(AccessMode accessMode, DataMemberType type)
   {
      switch(this)
      {
         case all:               return true;
         case publicOnly:        return accessMode == publicAccess;
         case privateOnly:       return accessMode == privateAccess;
         case privateAndPublic:  return accessMode == privateAccess || accessMode == publicAccess;
         // defaultAccess, staticAccess, baseSystemAccess
         case normalOnly:        return type == normalMember;
         case unionOnly:         return type == unionMember;
         case structOnly:        return type == structMember;
         case publicNormal:      return accessMode == publicAccess && type == structMember;
         case privateNormal:     return accessMode == privateAccess && type == structMember;
      }
      return false;
   }
};

public struct IterMemberOrPropertyPlus
{
   Class cl;
   Property pt;
   DataMember dm;
   MemberOrProperty mp;
   bool unionFirstsFirstAndFollowingsLast;
   property MemberOrProperty { get { return mp; } }
   void reset() { mp = null; }
   MemberOrProperty next(MemberOrPropertyFilter filter)
   {
      while(_next() && !filter.match(mp.memberAccess, mp.isProperty ? normalMember : ((DataMember)mp).type));
      pt = mp && mp.isProperty ? (Property)mp : null;
      dm = mp && !mp.isProperty ? (DataMember)mp : null;
      if(dm && (dm.type == unionMember || dm.type == structMember))
         stack.Add(dm.members.first);
      return mp;
   }
   void cleanup()
   {
      delete stack;
   }
private:
   List<MemberOrProperty> stack;
   bool _next()
   {
      if(!stack) stack = { };
      if(!mp)
      {
         mp = (MemberOrProperty)cl.membersAndProperties.first;
         if(mp) stack.Add(mp);
      }
      else
      {
         bool first = dm && (dm.type == unionMember || dm.type == structMember) && dm.members.first;
         while(stack.count)
         {
            mp = first ? stack.lastIterator.data : stack.lastIterator.data.next;
            if(!first && mp) stack.lastIterator.data = mp;
            if(mp) break;
            else if(stack.count)
               stack.lastIterator.Remove();
         }
      }
      return mp != null;
   }
};

public struct IterConversion
{
public:
   Class cl;
   Property cn;
   property Property { get { return cn; } }
   void reset() { cn = null; }
   Property next(AccessModeFilter filter)
   {
      cn = cn ? cn.next : (Property)cl.conversions.first;
      while(cn && !filter.match(cn.memberAccess))
         cn = cn.next;
      return cn;
   }
};

bool getClassIsTemplate(Class cl)
{
   Class c;
   for(c = cl; c; c = c.base)
   {
      if(classTypeIsTemplatable(c.type))
      {
         if(c.templateParams.count)
            return true;
         if(c.base && c.base.templateClass)
            break;
      }
      else
         break;
   }
   return false;
}

bool classTypeIsTemplatable(ClassType ct)
{
   return ct == normalClass || ct == noHeadClass || ct == structClass;
}

bool classTypeHasNativeSubType(ClassType ct)
{
   switch(ct)
   {
      case normalClass: return false;
      case structClass: return false;
      case bitClass:    return true;
      case unitClass:   return true;
      case enumClass:   return true;
      case noHeadClass: return false;
      case unionClass:  return false;
      case systemClass: return false;
   }
   return false; // error
}

bool classIsTemplatable(Class cl)
{
   Class c;
   for(c = cl; c; c = c.base)
      if(c.templateParams.count)
         return c.templateClass ? false : true;
      else if(c.templateClass)
         return false;
   return false;
}
