#ifndef __BGEN_EH_
#define __BGEN_EH_

#ifdef ENABLE_GEN_LOC
#define genloc__ "/*", ___getFixedLengthCodeLocation("see:", __FILE__, __LINE__), "*/"
#else
#define genloc__ ""
#endif

static inline const char * strptrNoNamespace(const char * str)
{
   const char * t, * s = str;
   while((t = strstr(s, "::"))) s = t + 2;
   return s;
}

#endif // __BGEN_EH_
