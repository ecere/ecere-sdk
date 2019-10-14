#include <stdarg.h>

import "ecere"

ConsoleFile console { };

#if defined(_DEBUG)
File dbglog;
void dbglog_open(bool useConsole)
{
   char * fileName = useConsole ? null : getTimeString("dbg-", ".log");
   dbglog = useConsole ? console : FileOpen(fileName, write);
   delete fileName;
}
void dbglog_close()
{
   if(dbglog != console)
      delete dbglog;
}

static char * getTimeString(const char * prefix, const char * suffix)
{
   char * time;
   DateTime now;
   now.GetLocalTime();
   time = new char[strlen(prefix) + 15 + strlen(suffix) + 1];
   sprintf(time, "%s%04d%02d%02d-%02d%02d%02d%s", prefix, now.year, now.month+1, now.day, now.hour, now.minute, now.second, suffix);
   return time;
}
#endif // defined(_DEBUG)

void __locfprintx__(const char * loc, File f, typed_object object, ...)
{
   va_list args;
   char buffer[4096];
   va_start(args, object);
   PrintStdArgsToBuffer(buffer, sizeof(buffer), object, args);
   va_end(args);
   console.Puts(loc);
   console.Puts(buffer);
   console.Flush();
}

void __locfprintxln__(const char * loc, File f, typed_object object, ...)
{
   va_list args;
   char buffer[4096];
   va_start(args, object);
   PrintStdArgsToBuffer(buffer, sizeof(buffer), object, args);
   va_end(args);
   console.Puts(loc);
   console.Puts(buffer);
   console.Putc('\n');
   console.Flush();
}

void __condlocfprintxln__(bool cond, const char * loc, File f, typed_object object, ...)
{
//#define DEBUG_ASSERT_MESSAGE_TEST
#if !defined(DEBUG_ASSERT_MESSAGE_TEST)
   if(cond)
      ;
   else
#endif
   {
      va_list args;
      char buffer[4096];
      va_start(args, object);
      PrintStdArgsToBuffer(buffer, sizeof(buffer), object, args);
      va_end(args);
      console.Puts(loc);
      console.Puts(buffer);
      console.Putc('\n');
      console.Flush();
   }
}
