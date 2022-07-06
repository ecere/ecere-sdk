#ifndef IMPORT_STATIC
#ifdef ECERE_STATIC
#define IMPORT_STATIC static
#else
#define IMPORT_STATIC
#endif
#endif
public import IMPORT_STATIC "ecere"

public class TemporalOptions : uint
{
public:
   bool year:1, month:1, day:1, week:1, hour:1, minute:1, second:1, millisecond:1;
   TemporalOptions date:3:0;
   bool temporalOutside:1:8;
};

String printTime(TemporalOptions options, DateTime time)
{
   char string[1024];
   return CopyString(printTimeBuf(string, sizeof(string), options, time, 0));
}

String printTimeBuf(char * string, int maxSize, TemporalOptions options, DateTime time, int millisecond)
{
   string[0] = 0;
   if(time.year)
   {
      strcatf(string, "%04d", time.year);
      if(options.month || options.week)
      {
         strcatf(string, "-%02d", time.month + 1);
         if(time.day)
            strcatf(string, "-%02d", time.day);
      }
   }
   if(options.hour || options.minute || options.second)
   {
      strcat(string, "T");
      if(options.hour)
         strcatf(string, "%02d:", time.hour);
      if(options.hour || options.minute)
         strcatf(string, "%02d:", time.minute);
      strcatf(string, "%02d", time.second);
      if(options.millisecond)
         strcatf(string, ".%03d", millisecond);
      strcatf(string, "Z");
   }
   return string;
}
