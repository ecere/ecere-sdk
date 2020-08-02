#ifndef __DEBUG_EH_
#define __DEBUG_EH_

#include "debug.h"

char * ___getFixedLengthCodeLocation(const char * prefix, const char * file, const int line);

// note: __getloc__ is not thread safe
#define __getloc__ ___getFixedLengthCodeLocation(" !! ", __FILE__, __LINE__)

#define __getflow__ g_ ? g_.lib.name : 0, "|", g_ ? g_.lang : Language::C, " (", g_ ? g_._class.name : "", ") (py:", py, ") -- "
#define __getctxx__ spaces(g_ ? strlen(g_.lib.name) : 0, 0), "|", spaces(g_ ? g_.lang == C ? 1 : 6 : 0, 0), " (", spaces(g_ ? strlen(g_._class.name) : 0, 0), ") (py:", spaces(py ? 4 : 5, 0), ") -- "

#if defined(_DEBUG)
#define dbglocprintx(...)     Print(__getloc__, ##__VA_ARGS__)
#define dbglocprintxln(...) PrintLn(__getloc__, ##__VA_ARGS__)
#else
#define dbglocprintx(...)
#define dbglocprintxln(...)
#endif

#define locprintx(...)     Print(__getloc__, ##__VA_ARGS__)
#define locprintxln(...) PrintLn(__getloc__, ##__VA_ARGS__)

#define locfprintx(f, ...)   __locfprintx__  (__getloc__, f, ##__VA_ARGS__)
#define locfprintxln(f, ...) __locfprintxln__(__getloc__, f, ##__VA_ARGS__)

#define conmsgs(...)  __locfprintxln__(__getloc__, console, ##__VA_ARGS__)
#define conassert(cond, ...) __condlocfprintxln__(cond, __getloc__, console, "assertion failed: (\"", #cond, "\")", ##__VA_ARGS__)
#define logmsgs(...)  __locfprintxln__(__getloc__, dbglog,  ##__VA_ARGS__)

#define conmsg(...)  __locfprintxln__(__getloc__, console, __getctxx__, ##__VA_ARGS__)
#define conassertctx(cond, ...) __condlocfprintxln__(cond, __getloc__, console, __getctxx__, "assertion failed: (\"", #cond, "\")", ##__VA_ARGS__)
#if defined(_DEBUG)
#define logmsg(...)  __locfprintxln__(__getloc__, dbglog,  __getflow__, ##__VA_ARGS__)
#define logmsgc(...) __locfprintxln__(__getloc__, dbglog,  __getctxx__, ##__VA_ARGS__)
#else
#define logmsg(...)  __locfprintxln__(__getloc__, console,  __getflow__, ##__VA_ARGS__)
#define logmsgc(...) __locfprintxln__(__getloc__, console,  __getctxx__, ##__VA_ARGS__)
#endif // defined(_DEBUG)

#endif // __DEBUG_EH_
