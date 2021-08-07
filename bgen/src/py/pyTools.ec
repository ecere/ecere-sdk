#include "debug.eh"

import "bgen"

//enum FooAllBits : Foo { allBits = { all = 0xFFFFFFFF } };
//Foo a = all;

enum boolmax { false, true = 0xFFFFFFFF };

class ParamFilter
{
   //bool all:1;
   bool voidOn:1;
   bool ellipsisOn:1;
   bool nativeOn:1;
   bool othersOn:1;
   bool arrayOn:1;
   bool pointerOn:1;
   bool classOn:1;
   bool subclassOn:1;
   bool templateOn:1;
   bool thisClassOn:1;

   voidOn = true;
   /*property bool all
   {
      set
      {
         this = value ? 0xffffffff : 0x0;
      }
   }*/
   boolmax all:32:0;

   bool match(TypeKind kind)
   {
      switch(kind)
      {
         case voidType:       return voidOn;
         case ellipsisType:   return ellipsisOn;
         case charType:
         case shortType:
         case intType:
         case int64Type:
         case longType:
         case floatType:
         case doubleType:
                              return nativeOn;
         case intPtrType:
         case intSizeType:
         case int128Type:
                              return othersOn;
         case arrayType:      return arrayOn;
         case pointerType:    return pointerOn;
         case classType:      return classOn;
         case subClassType:   return subclassOn;
         case templateType:   return templateOn;
         case thisClassType:  return thisClassOn;
         case structType:
         case unionType:
         case functionType:
         case enumType:
         case methodType:
         case vaListType:
         case _BoolType:
         case dummyType:
         /*case typedObjectType:
         case anyObjectType:
         case classPointerType: */
            break;
         default:
            conmsg("check");
      }
      return false;
   }
};

struct IterParam
{
   OldList * ol;
   Type pm;
   //property Type { get { return pm; } }
   void reset() { pm = null; }
   Type next(ParamFilter filter)
   {
      /*for(*/pm = pm ? pm.next : ol->first;
      while(pm && !filter.match(pm.kind))//;
         pm = pm.next;//);
      return pm;
   }
};

char * defaultIterParamPlusGetName(const char * name)
{
   if(name) return CopyString(name);
   return null;
}

struct IterParamPlus
{
   OldList * ol;
   bool anon;
   bool maxlen;
   bool initPrevParam;
   char * (*getName)(const char * name);
   Type pm;
   char * name;
   int ap;
   int len;
   bool prevParam;
   bool last;
   //property Type { get { return pm; } }
   void reset() { pm = null; delete name; ap = 0, len = 0; prevParam = initPrevParam; }
   //getName = CopyString;
   //getName = defaultIterParamPlusGetName;
   Type next(ParamFilter filter)
   {
      pm = pm ? pm.next : ol->first;
      while(pm && !filter.match(pm.kind))
          pm = pm.next;
      _set();
      return pm;
   }
   Type prev(ParamFilter filter)
   {
      pm = pm ? pm.prev : ol->last;
      while(pm && !filter.match(pm.kind))
          pm = pm.prev;
      _set();
      return pm;
   }
   private void _set()
   {
      delete name;
      last = pm && !pm.next;
      if(pm)
      {
         int l;
         if(getName) name = (anon && !pm.name) ? PrintString("ap", ++ap) : getName(pm.name);
         if(maxlen && (l = strlen(name)) > len) len = l;
      }
      if(!pm)
      {
         maxlen = false;
         ap = 0;
      }
   }
   property bool isStruct { get {
         return pm.kind == classType && pm._class.registered && pm._class.registered.type == structClass; } }
   property bool isNoHead { get {
         return pm.kind == classType && pm._class.registered && pm._class.registered.type == noHeadClass; } }
   property bool isTypedObject { get {
         return pm.kind == classType && !strcmp(pm._class.registered.name, "class") && pm.classObjectType == typedObject && !pm.byReference; } }
   property bool isReturnTypedObject { get {
         return pm.kind == classType && !strcmp(pm._class.registered.name, "class") && pm.classObjectType == typedObject && pm.byReference; } }
   property bool isReturnValue { get {
         // return (pm.kind == pointerType && typeIsNative) || isStruct;
         return (pm.kind == pointerType && typeIsReturnable && !pm.type.constant) || isVoidPtrReturn; } }
   property bool isVoidPtrReturn { get {
         return pm.kind == pointerType && pm.type.kind == pointerType && pm.type.type.kind == voidType; } }
   property bool typeIsReturnable { get {
         return pm.type.kind == shortType || pm.type.kind == intType || pm.type.kind == int64Type ||
         pm.type.kind == int128Type || pm.type.kind == longType || pm.type.kind == floatType || pm.type.kind == doubleType ||
         (pm.type.kind == classType && pm.type._class.registered &&
            ( pm.type._class.registered.type == bitClass ||
             (pm.type._class.registered.type == enumClass && !strcmp(pm.type._class.registered.name, "bool")) ||
             (pm.type._class.registered.type == unitClass && strcmp(pm.type._class.registered.name, "unichar")))); } }
   property bool typeIsNative { get {
         return pm.type.kind == shortType || pm.type.kind == intType || pm.type.kind == int64Type ||
         pm.type.kind == int128Type || pm.type.kind == longType || pm.type.kind == floatType || pm.type.kind == doubleType ||
         (pm.type.kind == classType && pm.type._class.registered && pm.type._class.registered.type == enumClass &&
         !strcmp(pm.type._class.registered.name, "bool")); } }
   property bool isNullable { get {
         return pm.kind == classType && pm._class.registered && ((pm._class.registered.type == noHeadClass &&
         strcmp(pm._class.registered, "IteratorPointer")) ||
         pm._class.registered.type == normalClass || pm._class.registered.type == structClass); } }
   property bool isTypeStr { get {
         return (pm.kind == pointerType && ((pm.type.kind == charType && pm.type.isSigned) ||
         (pm.type.kind == pointerType && pm.type.type.kind == charType && pm.type.type.isSigned))) ||
         (pm.kind == classType && pm._class.registered && !strcmp(pm._class.registered.name, "String")); } }
};

AVLTree<const char *> pySymbolNameConflicts { [
   "and",
   "del",
   "from",
   "global",
   "not",
   "or",
   "pass",
   "print",
//   "type", // FIX #01
   null
] };

char * pyGetNoConflictSymbolName(const char * name)
{
   if(!name) return null;
   if(pySymbolNameConflicts.Find(name)) return PrintString("_", name);
   return CopyString(name);
}

public struct IterMemberOrPropertyPriority
{
   Class cl;
   Property pt;
   DataMember dm;
   MemberOrProperty mp;
   bool unionFirstsFirstAndFollowingsLast;
   property MemberOrProperty { get { return mp; } }
   void reset() { mp = null; cleanup(); }
   MemberOrProperty next(MemberOrPropertyFilter filter)
   {
      if(!str)
      {
         while(true)
         {
            while(_next() && !filter.match(mp.memberAccess, mp.isProperty ? normalMember : ((DataMember)mp).type));
            if(!mp) break;
            pt = mp.isProperty ? (Property)mp : null;
            if(pt && pt.Set)
               str.Add(mp.name);
         }
      }
      while(_next() && (!filter.match(mp.memberAccess, mp.isProperty ? normalMember : ((DataMember)mp).type) ||
            (!mp.isProperty && str.Find(mp.name))));
      pt = mp && mp.isProperty ? (Property)mp : null;
      dm = mp && !mp.isProperty ? (DataMember)mp : null;
      if(dm && (dm.type == unionMember || dm.type == structMember))
         stack.Add(dm.members.first);
      return mp;
   }
   void cleanup()
   {
      delete str;
      delete stack;
   }
private:
   AVLTree<const String> str;
   List<MemberOrProperty> stack;
   bool _next()
   {
      if(!str) str = { };
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

struct IterClassHierarchyMemberOrProperty
{
   List<Class> lineage;
   Iterator<Class> it;
   IteratorPointer p;
   Class cl;
   BClass c;
   MemberOrProperty mp;
   AVLTree<const String> str;
   char * name;
   bool first;
   property MemberOrProperty { get { return mp; } }
   void reset() { mp = null; }
   MemberOrProperty next(AccessModeFilter filter)
   {
      if(first && p) first = false;
      delete name;
      while(_next())
      {
         if(filter.match(mp.memberAccess))
         {
            name = pyGetNoConflictSymbolName(mp.name);
            if(name && str.Add(name))
               break;
            else
               delete name;
         }
      }
      if(!mp) str.RemoveAll();
      return mp;
   }
private:
   bool _next()
   {
      if(!str) str = { };
      if(!p) p = lineage.firstIterator.pointer, first = true;
      while(p)
      {
         if(!cl) cl = (Class)lineage.GetData(p), c = cl;
         if(!(c.is_class || c.isInstance)) // class filter here
         {
            mp = mp ? mp.next : (MemberOrProperty)cl.membersAndProperties.first;
            if(mp) break;
         }
         p = lineage.GetNext(p);
         cl = null;
      }
      return p != null;
   }
};

public enum ClassHierarchyMemberOrPropertyFilter
{
   all, publicOnly, privateOnly, privateAndPublic, publicMembers, publicMembersAndPropertiesWithSet;
public:
   bool match(AccessMode accessMode, MemberOrProperty mp, Property pt, DataMember dm)
   {
      switch(this)
      {
         case all:                                       return true;
         case publicOnly:                                return accessMode == publicAccess;
         case privateOnly:                               return accessMode == privateAccess;
         case privateAndPublic:                          return accessMode == privateAccess || accessMode == publicAccess;
         // defaultAccess, staticAccess, baseSystemAccess
         case publicMembers:                             return accessMode == publicAccess && !mp.isProperty;
         case publicMembersAndPropertiesWithSet:         return accessMode == publicAccess && (!mp.isProperty || ((Property)mp).Set);
      }
      return false;
   }
};

struct IterClassHierarchyMemberOrPropertyPlus
{
   List<Class> lineage;
   Iterator<Class> it;
   IteratorPointer p;
   int lp;
   //IteratorPointer lp;
   Class cl;
   BClass c;
   Type type;
   Property pt;
   DataMember dm;
   MemberOrProperty mp;
   //bool unionFirstsFirstAndFollowingsLast; always on for now
   bool typing;
   bool unionFirstsOnly;
   AVLTree<const String> str;
   char * name;
   bool first;
   property MemberOrProperty { get { return mp; } }
   void reset() { pt = null; dm = null; mp = null; type = null; entering = false; p = null; lp = 0; str.RemoveAll(); lasts.RemoveAll(); }
   MemberOrProperty next(ClassHierarchyMemberOrPropertyFilter filter)
   {
      if(first && p) first = false;
      delete name;
      while(_next())
      {
         Property pt = mp && mp.isProperty ? (Property)mp : null;
         DataMember dm = mp && !mp.isProperty ? (DataMember)mp : null;
         if(filter.match(mp.memberAccess, mp, pt, dm))
         {
            bool add;
            name = pyGetNoConflictSymbolName(mp.name);
            if((add = (!name || str.Add(name) != null)))
            {
               if(!add)
                  PrintLn("                                ", "same name ", c.name, "::", mp.name);
               break;
            }
            else
               delete name;
         }
      }
      if(!mp) str.RemoveAll();
      pt = mp && mp.isProperty ? (Property)mp : null;
      dm = mp && !mp.isProperty ? (DataMember)mp : null;
      if(dm && (dm.type == unionMember || dm.type == structMember) && dm.members.first)
         stack.Add(dm.members.first), entering = true;
      if(typing)
      {
         if(dm && dm.type == normalMember)
         {
            if(!dm.dataType)
               dm.dataType = resolveDataTypeStringInTemplatesContext(cl, dm.dataTypeString, false); // typeDataMember(dm, cl);
         }
         else if(pt)
         {
            if(!pt.dataType)
               pt.dataType = resolveDataTypeStringInTemplatesContext(cl, pt.dataTypeString, false); // typeDataMember((DataMember)pt, cl);
         }
         type = pt ? pt.dataType : dm ? dm.dataType : null;
      }
      return mp;
   }
   void cleanup()
   {
      delete str;
      delete stack;
   }
private:
   bool entering;
   List<MemberOrProperty> stack;
   List<DataMember> lasts;
   bool _next()
   {
      if(lp)
      {
         bool atEnd;
         MemberOrProperty t = dm && (dm.type == unionMember || dm.type == structMember) && dm.members.first ?
               (MemberOrProperty)dm.members.first : null;
         entering = dm && (dm.type == unionMember || dm.type == structMember) && dm.members.first;
         if(entering)
            lasts.Insert(lasts.GetAtPosition(lp - 1, false, null), dm.members.first);

         lp++;
         mp = lp > lasts.count ? null : (MemberOrProperty)lasts[lp - 1];
         if(entering)
         {
            conassert(t == mp, "?");
            atEnd = dm.type == unionMember && mp.next;
         }
         if(!unionFirstsOnly && entering && mp.next)
         {
            DataMember dm;
            IteratorPointer p = lasts.GetAtPosition(lp - 1, false, null);
            for(dm = (DataMember)mp.next; dm; dm = dm.next)
            {
               if(atEnd)
                  lasts.Add(dm);
               else
                  p = lasts.Insert(p, dm);
            }
         }
         if(!mp)
            delete lasts;
      }
      else
      {
         if(!p) p = lineage.firstIterator.pointer, first = true;
         while(p)
         {
            if(!cl) cl = (Class)lineage.GetData(p), c = cl;
            if(!(c.is_class || c.isInstance)) // class filter here
            {
               if(!mp)
               {
                  if(!stack) stack = { };
                  if(!str) str = { };
                  mp = (MemberOrProperty)cl.membersAndProperties.first;
                  if(mp) stack.Add(mp);
               }
               else
               {
                  while(stack.count)
                  {
                     if(entering)
                     {
                        DataMember dm = (DataMember)(uint32)stack.last.prev.data;
                        mp = stack.lastIterator.data;
                        if(!unionFirstsOnly && dm.type == unionMember && mp.next)
                        {
                           if(!lasts) lasts = { };
                           for(dm = (DataMember)mp.next; dm; dm = dm.next)
                              lasts.Add(dm);
                           stack.lastIterator.data = (MemberOrProperty)lasts.lastIterator.data;
                        }
                        else if(unionFirstsOnly)
                        {
                           for(dm = (DataMember)mp.next; dm; dm = dm.next)
                              stack.lastIterator.data = (MemberOrProperty)dm;
                        }
                        entering = false;
                     }
                     else
                     {
                        // compile issue with:
                        // mp = stack.lastIterator.data = stack.lastIterator.data.next;
                        // error: incompatible types when initializing type 'void *' using type 'struct __ecereNameSpace__ecere__com__Iterator'
                        mp = stack.lastIterator.data.next;
                        if(mp) stack.lastIterator.data = mp;
                        //if(mp) stack[stack.count-1] = mp;
                        /*if(mp)
                        {
                           stack.lastIterator.Remove();
                           stack.Add(mp);
                        }*/
                     }
                     if(mp) break;
                     else if(stack.count)
                        stack.lastIterator.Remove();
                  }
               }
               if(mp) break;
            }
            p = lineage.GetNext(p);
            cl = null;
         }
      }
      if(!p && lasts && !lp)
      {
         if(lasts.count)
         {
            lp = 1;
            mp = (MemberOrProperty)lasts[lp - 1];
         }
         else
            delete lasts;
      }
      if(!p && lp && !mp) lp = 0;
      return p != null || lp != 0;
   }
};
