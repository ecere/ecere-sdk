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

bool classIsFromModule(Class c, Module m, Application a)
{
   bool ecereCOM = false;
   Module mod = searchModulesForNamespace(a, c.nameSpace, &ecereCOM);
   return mod == m && !ecereCOM;
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
                  stack.Remove(stack.lastIterator.pointer);
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

public struct IterDefine
{
public:
   NameSpace * ns;
   DefinedExpression df;
   property DefinedExpression { get { return df; } }
   void reset() { df = null; _it = null; }
   DefinedExpression next()
   {
      if(!_it)
         _it = (BTNamedLink)ns->defines.first;
      else
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
   GlobalFunction fn;
   property GlobalFunction { get { return fn; } }
   void reset() { fn = null; _it = null; }
   GlobalFunction next()
   {
      if(!_it)
         _it = (BTNamedLink)ns->functions.first;
      else
         _it = (BTNamedLink)((BTNode)_it).next;
      fn = _it ? _it.data : null;
      return fn;
   }
private:
   BTNamedLink _it;
};

public enum ClassTypeFilter
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
   Class cl;
   property Class { get { return cl; } }
   void reset() { cl = null; _it = null; }
   Class next(ClassTypeFilter filter)
   {
      for(_it = _it ? (BTNamedLink)((BTNode)_it).next : (BTNamedLink)ns->classes.first;
          _it && !filter.match(((Class)_it.data).type);
          _it = (BTNamedLink)((BTNode)_it).next);
      cl = _it ? _it.data : null;
      return cl;
   }
private:
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
         case privateOnly:       return accessMode == privateAccess;
         case publicOnly:        return accessMode == publicAccess;
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
      for(md = md ? (Method)((BTNode)md).next : (Method)cl.methods.first;
          md && !filter.match(md.memberAccess, md.type);
          md = (Method)((BTNode)md).next);
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
         case privateOnly:       return accessMode == privateAccess;
         case publicOnly:        return accessMode == publicAccess;
         case privateAndPublic:  return accessMode == privateAccess || accessMode == publicAccess;
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
      for(or = or ? or.next : (MemberOrProperty)cl.membersAndProperties.first;
          or && !filter.match(or.memberAccess);
          or = or.next);
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
      for(it = it ? it.next : (MemberOrProperty)cl.membersAndProperties.first;
          it && (!it.isProperty || !filter.match(it.memberAccess));
          it = it.next);
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
      for(it = it ? it.next : (MemberOrProperty)cl.membersAndProperties.first;
          it && (it.isProperty || !filter.match(it.memberAccess));
          it = it.next);
      dm = it ? (DataMember)it : null;
      return dm;
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
      for(cn = cn ? cn.next : (Property)cl.conversions.first;
          cn && !filter.match(cn.memberAccess);
          cn = cn.next);
      return cn;
   }
};
