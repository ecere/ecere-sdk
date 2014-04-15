// dpl.c
// Functions:
//    _dplf  - Debug Print Line Format
//    _dpclf - Debug Print Channel Line Format
// Usage:
//    #define _DPL_ON
//    #include <dpl.c>
//    _dplf(int indent, const char * format, ...);
//    _dpclf(const char ** channelNames, int channel, int indent, const char * format, ...);

#include <stdarg.h>
#include <stdio.h>
#include <stdbool.h>

#define MAX_F_STRING 1025

// Debug Print Line Format (_dplf)
#ifdef _DPL_ON
#define _dplf(...) __dplf(__FILE__, __LINE__, ##__VA_ARGS__)
#else
#define _dplf(...)
#endif
void __dplf(const char * file, int line, int indent, const char * format, ...)
{
   int c;
   char string[MAX_F_STRING];
   va_list args;
   va_start(args, format);
   vsnprintf(string, sizeof(string), format, args);
   string[sizeof(string)-1] = '\0';
   printf("%s:% 5d: ", file, line);
   for(c = 0; c<indent; c++)
      printf(" ");
   printf("%s\n", string);
   va_end(args);
}

// Debug Print Channel Line Format (_dpclf)
#ifdef _DPL_ON
#define _dpclf(...) __dpclf(__FILE__, __LINE__, ##__VA_ARGS__)
#else
#define _dpclf(...)
#endif
void __dpclf(const char * file, int line, const char ** channels, int channel, int indent, const char * format, ...)
{
   bool chan = channel && channels && channels[channel];
   if(chan || !channels)
   {
      int c;
      char string[MAX_F_STRING];
      va_list args;
      va_start(args, format);
      vsnprintf(string, sizeof(string), format, args);
      string[sizeof(string)-1] = '\0';
      printf("%s:% 5d: %s%s", file, line, chan ? channels[channel] : "", chan && channels[channel][0] ? ": " : "");
      for(c = 0; c<indent; c++)
         printf(" ");
      printf("%s\n", string);
      va_end(args);
   }
}
