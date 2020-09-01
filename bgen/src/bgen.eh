#ifndef __BGEN_EH_
#define __BGEN_EH_

#define ENABLE_GEN_LOC
#ifdef ENABLE_GEN_LOC
#if 1
#define genfn(fn) "/*", #fn, "*/"
#else
#define genfn(fn) ""
#endif
#if 0
#define genidx(id, x) "/*", #id, x, "*/"
#else
#define genidx(id, x) ""
#endif
#define genloc__ genloc__on ? "/*" : "", genloc__on ? ___getFixedLengthCodeLocation(" :", __FILE__, __LINE__) : "", genloc__on ? "*/ " : ""
#define genspc__ genloc__on ? "  " : "", genloc__on ? spaces(CODE_LOC_FIXED_LEN + 2, 0)                       : "", genloc__on ? "   " : ""
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
