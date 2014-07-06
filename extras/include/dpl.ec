// dpl.ec
// Functions:
//    _dpl   - Debug Print Line
//    _dplf  - Debug Print Line Format
//    _dpcl  - Debug Print Channel Line
//    _dpclf - Debug Print Channel Line Format
// Usage:
//    #define _DPL_ON
//    #include <dpl.eh>
//    import "dpl.ec"
//    _dpl(int indent, ...);
//    _dplf(int indent, const char * format, ...);
//    _dpcl(const char ** channelNames, int channel, int indent, ...);
//    _dpclf(const char ** channelNames, int channel, int indent, const char * format, ...);
// Example Usage:
//    const char * dpln[] = { null, "MISC", null };
//    enum dplc { none, misc=1 }; // use =0 to disable printing of specific channels
//    _dpcl(dpln, dplc::misc, 0, "example: ", number, point, etc);

import "ecere"

#include <stdarg.h>

char * _printNow()
{
   int c;
   char * s[6];
   char * time;
   DateTime now;
   now.GetLocalTime();
   for(c=0; c<6; c++)
      s[c] = new char[8];
   sprintf(s[0], "%04d", now.year);
   sprintf(s[1], "%02d", now.month+1);
   sprintf(s[2], "%02d", now.day);
   sprintf(s[3], "%02d", now.hour);
   sprintf(s[4], "%02d", now.minute);
   sprintf(s[5], "%02d", now.second);
   time = PrintString("*", s[0], s[1], s[2], "-", s[3], s[4], s[5], "*");
   for(c=0; c<6; c++)
      delete s[c];
   return time;
}

// Debug Print Line (_dpl)
#ifdef _DPL_ON
#define _dpl(...) __dpl(__FILE__, __LINE__, ##__VA_ARGS__)
#else
#define _dpl(...)
#endif
void __dpl(const char * file, int line, int indent, typed_object object, ...)
{
   int c;
   char * time = _printNow();
   char string[MAX_F_STRING];
   va_list args;
   printf("%s %s:% 5d: ", time, file, line);
   for(c = 0; c<indent; c++)
      printf(" ");
   va_start(args, object);
   PrintStdArgsToBuffer(string, sizeof(string), object, args);
   printf("%s", string);
   va_end(args);
   printf("\n");
   delete time;
}

// Debug Print Line Format (_dplf)
void __dplf(const char * file, int line, int indent, const char * format, ...)
{
   int c;
   char * time = _printNow();
   char string[MAX_F_STRING];
   va_list args;
   va_start(args, format);
   vsnprintf(string, sizeof(string), format, args);
   string[sizeof(string)-1] = '\0';
   printf("%s %s:% 5d: ", time, file, line);
   for(c = 0; c<indent; c++)
      printf(" ");
   printf("%s\n", string);
   va_end(args);
   delete time;
}

// Debug Print Channel Line (_dpcl)
void __dpcl(const char * file, int line, const char ** channels, int channel, int indent, typed_object object, ...)
{
   bool chan = channel && channels && channels[channel];
   if(chan || !channels)
   {
      int c;
      char * time = _printNow();
      char string[MAX_F_STRING];
      va_list args;
      printf("%s %s:% 5d: %s%s", time, file, line, chan ? channels[channel] : "", chan && channels[channel][0] ? ": " : "");
      for(c = 0; c<indent; c++)
         printf(" ");
      va_start(args, object);
      PrintStdArgsToBuffer(string, sizeof(string), object, args);
      printf("%s", string);
      va_end(args);
      printf("\n");
      delete time;
   }
}

// Debug Print Channel Line Format (_dpclf)
void __dpclf(const char * file, int line, const char ** channels, int channel, int indent, const char * format, ...)
{
   bool chan = channel && channels && channels[channel];
   if(chan || !channels)
   {
      int c;
      char * time = _printNow();
      char string[MAX_F_STRING];
      va_list args;
      va_start(args, format);
      vsnprintf(string, sizeof(string), format, args);
      string[sizeof(string)-1] = '\0';
      printf("%s %s:% 5d: %s%s", time, file, line, chan ? channels[channel] : "", chan && channels[channel][0] ? ": " : "");
      for(c = 0; c<indent; c++)
         printf(" ");
      printf("%s\n", string);
      va_end(args);
      delete time;
   }
}
