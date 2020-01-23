#ifndef __BGEN_EH_
#define __BGEN_EH_

#define ENABLE_GEN_LOC
#ifdef ENABLE_GEN_LOC
#define genloc__ genloc__on ? "/*" : "", genloc__on ? ___getFixedLengthCodeLocation(" :", __FILE__, __LINE__) : "", genloc__on ? "*/ " : ""
#define genspc__ genloc__on ? "  "                  "                            ""  "                                       "   " : ""
#else
#define genloc__ ""
#define genspc__ ""
#endif

static inline const char * strptrNoNamespace(const char * str)
{
   const char * t, * s = str;
   while((t = strstr(s, "::"))) s = t + 2;
   return s;
}

#endif // __BGEN_EH_
