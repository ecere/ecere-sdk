#ifndef __ECONE_EH_
#define __ECONE_EH_

import "ec"

static inline Type unwrapPtrType(Type type, int * ptr)
{
   Type t = type;
   while(t.kind == pointerType && ++(*ptr) < 32)
      t = t.type;
   return t;
}

static inline bool typeIsBool(Type type)
{
   return type.kind == classType && type._class && type._class.registered && !strcmp(type._class.registered.name, "bool");
}

static inline bool typeIsBoolOrPtrTo(Type type, int * ptr)
{
   Type t = unwrapPtrType(type, ptr);
   return typeIsBool(t);
}

#endif // __ECONE_EH_
