default:
extern char *tzname[2];
extern long timezone;
extern int daylight;

private:
namespace sys;

#define _Noreturn

#define set _set
#define Date _Date
#define uint _uint
#define Method _Method
#define FileName _FileName
#define Instance _Instance
#define Size _Size
#define File _File
#define byte _byte
#define int64 _int64
#define uint64 _uint64
#define Alignment _Alignment

#undef __BLOCKS__

#if defined(__WIN32__)
#define WIN32_LEAN_AND_MEAN
#define String String_
#include <windows.h>

#include <synchapi.h>

#undef String
#include <mmsystem.h>
#elif defined(__unix__) || defined(__APPLE__)
#include <sys/time.h>
#include <sched.h>
#include <unistd.h>
#endif
#include <time.h>
#include <stdlib.h>

#undef set
#undef uint
#undef int64
#undef uint64
#undef byte
#undef Method
#undef Alignment
#undef FileName
#undef Instance
#undef File
#undef Size
#undef Date

import "instance"

define EPOCH_YEAR      = 1970;
define EPOCH_WEEKDAY   = thursday;
static define SECS_PER_HOUR   = 60 * 60;
static define SECS_PER_DAY    = SECS_PER_HOUR * 24;

#define DIV(a, b) ((a) / (b) - ((a) % (b) < 0))
#define LEAPS_THRU_END_OF(y) (DIV (y, 4) - DIV (y, 100) + DIV (y, 400))
#define ISLEAP(y) (!((y)%4) && (((y) % 100) || (!((y)% 400))))

const int daysInAYearBeforeMonth[2][13] =
{
   // Normal years.
   { 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365 },
   // Leap years.
   { 0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366 }
};

int monthLengths[2][12] =
{
	{ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 },
	{ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }
};

#if defined(__WIN32__)

#define LL2FILETIME( ll, pft )   (pft)->dwLowDateTime = (UINT)(ll); (pft)->dwHighDateTime = (UINT)((ll) >> 32);
#define FILETIME2LL( pft, ll)    ll = (((LONGLONG)((pft)->dwHighDateTime))<<32) + (pft)-> dwLowDateTime ;

static int TIME_DayLightCompareDate(const SYSTEMTIME *date, const SYSTEMTIME *compareDate)
{
   int limit_day, dayinsecs;

   if(date->wMonth < compareDate->wMonth) return -1;
   if(date->wMonth > compareDate->wMonth) return 1;

   if(compareDate->wDayOfWeek <= 6)
   {
      WORD First;
      int weekofmonth = compareDate->wDay;
      First = (WORD)(( 6 + compareDate->wDayOfWeek - date->wDayOfWeek + date->wDay ) % 7 + 1);
      limit_day = First + 7 * (weekofmonth - 1);
      if(limit_day > monthLengths[date->wMonth==2 && ISLEAP(date->wYear)][date->wMonth - 1])
         limit_day -= 7;
   }
   else
   {
      limit_day = compareDate->wDay;
   }

   limit_day = ((limit_day * 24  + compareDate->wHour) * 60 + compareDate->wMinute ) * 60;
   dayinsecs = ((date->wDay * 24  + date->wHour) * 60 + date->wMinute ) * 60 + date->wSecond;
   return dayinsecs < limit_day ? -1 : dayinsecs > limit_day ? 1 : 0;
}

static uint TIME_CompTimeZoneID(const TIME_ZONE_INFORMATION *pTZinfo, FILETIME *lpFileTime, bool islocal)
{
   int ret;
   bool beforeStandardDate, afterDaylightDate;
   DWORD retval = TIME_ZONE_ID_INVALID;
   LONGLONG llTime = 0;
   SYSTEMTIME SysTime;
   FILETIME ftTemp;

   if (pTZinfo->DaylightDate.wMonth != 0)
   {
      if (pTZinfo->StandardDate.wMonth == 0 ||
         pTZinfo->StandardDate.wDay<1 ||
         pTZinfo->StandardDate.wDay>5 ||
         pTZinfo->DaylightDate.wDay<1 ||
         pTZinfo->DaylightDate.wDay>5)
      {
         SetLastError(ERROR_INVALID_PARAMETER);
         return TIME_ZONE_ID_INVALID;
      }

      if (!islocal)
      {
         FILETIME2LL( lpFileTime, llTime );
         llTime -= ( pTZinfo->Bias + pTZinfo->DaylightBias ) * (LONGLONG)600000000;
         LL2FILETIME( llTime, &ftTemp)
         lpFileTime = &ftTemp;
      }

      FileTimeToSystemTime(lpFileTime, &SysTime);

      ret = TIME_DayLightCompareDate( &SysTime, &pTZinfo->StandardDate);
      if (ret == -2)
         return TIME_ZONE_ID_INVALID;

      beforeStandardDate = ret < 0;

      if (!islocal)
      {
         llTime -= ( pTZinfo->StandardBias - pTZinfo->DaylightBias ) * (LONGLONG)600000000;
         LL2FILETIME( llTime, &ftTemp)
         FileTimeToSystemTime(lpFileTime, &SysTime);
      }

      ret = TIME_DayLightCompareDate( &SysTime, &pTZinfo->DaylightDate);
      if (ret == -2)
       return TIME_ZONE_ID_INVALID;

      afterDaylightDate = ret >= 0;

      retval = TIME_ZONE_ID_STANDARD;
      if( pTZinfo->DaylightDate.wMonth <  pTZinfo->StandardDate.wMonth )
      {
         if( beforeStandardDate && afterDaylightDate )
             retval = TIME_ZONE_ID_DAYLIGHT;
      }
      else if( beforeStandardDate || afterDaylightDate )
         retval = TIME_ZONE_ID_DAYLIGHT;
   }
   else
      retval = TIME_ZONE_ID_UNKNOWN;
   return retval;
}

static bool TIME_GetTimezoneBias(const TIME_ZONE_INFORMATION *pTZinfo, FILETIME *lpFileTime, bool islocal, LONG *pBias)
{
   LONG bias = pTZinfo->Bias;
   DWORD tzid = TIME_CompTimeZoneID( pTZinfo, lpFileTime, islocal);

   if( tzid == TIME_ZONE_ID_INVALID)
      return false;
   if (tzid == TIME_ZONE_ID_DAYLIGHT)
      bias += pTZinfo->DaylightBias;
   else if (tzid == TIME_ZONE_ID_STANDARD)
      bias += pTZinfo->StandardBias;
   *pBias = bias;
   return true;
}

static bool _TzSpecificLocalTimeToSystemTime(LPTIME_ZONE_INFORMATION lpTimeZoneInformation, LPSYSTEMTIME lpLocalTime, LPSYSTEMTIME lpUniversalTime)
{
   FILETIME ft;
   LONG lBias;
   LONGLONG t;
   TIME_ZONE_INFORMATION tzinfo;

   if(lpTimeZoneInformation)
   {
      memcpy(&tzinfo, lpTimeZoneInformation, sizeof(TIME_ZONE_INFORMATION));
   }
   else
   {
      if (GetTimeZoneInformation(&tzinfo) == TIME_ZONE_ID_INVALID)
         return false;
   }

   if (!SystemTimeToFileTime(lpLocalTime, &ft))
      return false;
   FILETIME2LL( &ft, t)
   if (!TIME_GetTimezoneBias(&tzinfo, &ft, true, &lBias))
      return false;

   t += (LONGLONG)lBias * 600000000;
   LL2FILETIME( t, &ft)
   return (bool)FileTimeToSystemTime(&ft, lpUniversalTime);
}
#endif

import "System"

public class Time : double
{
   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      Time time = this;
      int value;
      char temp[256];
      tempString[0] = 0;
      value = (int)(time / (60 * 60 * 24));
      if(value)
      {

         sprintf(temp, "%d:", value);
         strcat(tempString, temp);
         time -= value * 60 * 60 * 24;
      }
      value = (int)(time / (60 * 60));
      if(value)
      {
         sprintf(temp, "%d:", value);
         strcat(tempString, temp);
         time -= value * 60 * 60;
      }

      value = (int)(time / 60);
      sprintf(temp, "%02d:", value);
      strcat(tempString, temp);
      time -= value * 60;

      value = (int)(time);
      sprintf(temp, "%02d", value);
      strcat(tempString, temp);
      time -= value;

      /*if(time > 0.00001)
      {
         sprintf(temp, "%f" time);
         strcat(tempString, temp+1);
      }*/
      return tempString;
   }

   bool OnGetDataFromString(const char * string)
   {
      bool result = false;
      char s[100], * tokens[20];
      int count, i, multiplier = 1;
      Time t = 0;

      strncpy(s, string ? string : "", sizeof(s));
      s[99] = 0;
      count = TokenizeWith(s, 20, tokens, ":", false);

      // handles d:h:m:s, h:m:s, m:s, or s
      for(i = count-1; i >= 0; i--)
      {
         result = true;
         t += multiplier * strtol(tokens[i], null, 10);
         if(multiplier == 60 * 60 * 24) break;
         multiplier *= (multiplier == 60 * 60) ? 24 : 60;
      }
      this = t;
      return result;
   }
}

public class Seconds : Time { public property Time {} };

#if !defined(__WIN32__)

static time_t MakeTimeTfromLocal(SecSince1970 t, int isDST)
{
   // mktime() takes time expressed in *local* time
   struct tm tm = { 0 };
   time_t result;
   DateTime dt = t;
   tm.tm_year = dt.year - 1900;
   tm.tm_mon = dt.month;
   tm.tm_mday = dt.day;
   tm.tm_hour = dt.hour;
   tm.tm_min = dt.minute;
   tm.tm_sec = dt.second;
   tm.tm_yday = dt.dayInTheYear;
   tm.tm_wday = dt.dayOfTheWeek;
   tm.tm_isdst = isDST;
   result = mktime(&tm);
   return result;
}

static time_t MakeTimeTfromLocalDT(DateTime dt, int isDST)
{
   // mktime() takes time expressed in *local* time
   struct tm tm = { 0 };
   time_t result;
   tm.tm_year = dt.year - 1900;
   tm.tm_mon = dt.month;
   tm.tm_mday = dt.day;
   tm.tm_hour = dt.hour;
   tm.tm_min = dt.minute;
   tm.tm_sec = dt.second;
   tm.tm_yday = dt.dayInTheYear;
   tm.tm_wday = dt.dayOfTheWeek;
   tm.tm_isdst = isDST;
   result = mktime(&tm);
   return result;
}

static time_t MakeTimeTfromGlobal(SecSince1970 t, bool isDST)
{
   return (time_t)(t - isDST * 3600);
}

static time_t MakeTimeTfromGlobalDT(DateTime dt, bool isDST)
{
   return (time_t)((SecSince1970)dt - isDST * 3600);
}

#endif

public class SecSince1970 : int64
{
   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      return ((DateTime)this).OnGetString(tempString, fieldData, onType);
   }

   bool OnGetDataFromString(const char * string)
   {
      DateTime dt { };
      if(dt.OnGetDataFromString(string))
      {
         this = dt;
         return true;
      }
      return false;
   }

   // Is this required?
   int OnCompare(SecSince1970 data2)
   {
      int result = 0;
      if(this && data2)
      {
         if(this > data2)
            result = 1;
         else if(this < data2)
            result = -1;
      }
      return result;
   }
public:
   property SecSince1970 global
   {
      get
      {
      #if defined(__WIN32__)
         SYSTEMTIME localTime, systemTime;
         //FILETIME fileTime, localFileTime;
         DateTime input, global;

         input = this;

         localTime.wYear = (short)input.year;
         localTime.wMonth = (short)(input.month + 1);
         localTime.wDay = (short)input.day;
         localTime.wHour = (short)input.hour;
         localTime.wMinute = (short)input.minute;
         localTime.wSecond = (short)input.second;
         localTime.wMilliseconds = 0;

         /*
         SystemTimeToFileTime(&localTime, &fileTime);
         LocalFileTimeToFileTime(&fileTime, &localFileTime);
         FileTimeToSystemTime(&localFileTime, &systemTime);
         */

         _TzSpecificLocalTimeToSystemTime(null, &localTime, &systemTime);

         global.year = systemTime.wYear;
         global.month = (Month)(systemTime.wMonth - 1);
         global.day = systemTime.wDay;
         global.hour = systemTime.wHour;
         global.minute = systemTime.wMinute;
         global.second = systemTime.wSecond;

         return global;
      #else
         struct tm tm = { 0 };
         DateTime global;
         time_t t = MakeTimeTfromLocal(this, -1);
         gmtime_r(&t, &tm);
         global.year = tm.tm_year + 1900;
         global.month = (Month)tm.tm_mon;
         global.day = tm.tm_mday;
         global.hour = tm.tm_hour;
         global.minute = tm.tm_min;
         global.second = tm.tm_sec;
         global.dayInTheYear = tm.tm_yday;
         global.dayOfTheWeek = (DayOfTheWeek)tm.tm_wday;
         return global;
      #endif
      }
   };
   property SecSince1970 local
   {
      get
      {
#if defined(__WIN32__)
         SYSTEMTIME systemTime, localTime;
         DateTime utc, local;

         utc = this;

         systemTime.wYear = (short)utc.year;
         systemTime.wMonth = (short)(utc.month + 1);
         systemTime.wDay = (short)utc.day;
         systemTime.wHour = (short)utc.hour;
         systemTime.wMinute = (short)utc.minute;
         systemTime.wSecond = (short)utc.second;
         systemTime.wMilliseconds = 0;

         SystemTimeToTzSpecificLocalTime(null, &systemTime, &localTime);

         local.year = localTime.wYear;
         local.month = (Month)(localTime.wMonth - 1);
         local.day = localTime.wDay;
         local.hour = localTime.wHour;
         local.minute = localTime.wMinute;
         local.second = localTime.wSecond;
         local.dayOfTheWeek = (DayOfTheWeek)localTime.wDayOfWeek;

         local.FixDayOfYear();
         return local;
#else
         DateTime local;
         struct tm tm = { 0 };
         time_t t = MakeTimeTfromGlobal(this, false);
         //localtime_r((time_t *)&this, &tm);
         localtime_r(&t, &tm);
         local.year = tm.tm_year + 1900;
         local.month = (Month)tm.tm_mon;
         local.day = tm.tm_mday;
         local.hour = tm.tm_hour;
         local.minute = tm.tm_min;
         local.second = tm.tm_sec;
         local.dayInTheYear = tm.tm_yday;
         local.dayOfTheWeek = (DayOfTheWeek)tm.tm_wday;
         return local;
#endif
      }
   };
};

public class TimeStamp32 : uint32
{
public:
   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      return ((DateTime)(TimeStamp)this).OnGetString(tempString, fieldData, onType);
   }

   // Is this required?
   int OnCompare(TimeStamp32 data2)
   {
      int result = 0;
      if(this && data2)
      {
         if(this > data2)
            result = 1;
         else if(this < data2)
            result = -1;
      }
      return result;
   }
};

public class TimeStamp : SecSince1970
{
   public property SecSince1970 {};
};
public enum DayOfTheWeek { sunday, monday, tuesday, wednesday, thursday, friday, saturday };
public struct DateTime
{
   int year;
   Month month;
   int day, hour, minute, second;
   DayOfTheWeek dayOfTheWeek;
   int dayInTheYear;

   bool GetLocalTime()
   {
   #if defined(__WIN32__)
      SYSTEMTIME systemTime;
      ::GetLocalTime(&systemTime);

      year = systemTime.wYear;
      month = (Month)(systemTime.wMonth - 1);
      day = systemTime.wDay;
      hour = systemTime.wHour;
      minute = systemTime.wMinute;
      second = systemTime.wSecond;

      FixDayOfYear();
      {
         Date date { year, month, day };
         dayOfTheWeek = date.dayOfTheWeek;
      }
   #else
      struct tm tm = { 0 };
      time_t currentTime = time(null);
      localtime_r(&currentTime, &tm);

      year = tm.tm_year + 1900;
      month = (Month)tm.tm_mon;
      day = tm.tm_mday;
      hour = tm.tm_hour;
      minute = tm.tm_min;
      second = tm.tm_sec;
      dayInTheYear = tm.tm_yday;
      dayOfTheWeek = (DayOfTheWeek)tm.tm_wday;
   #endif

      return true;
   }

   bool FixDayOfYear()
   {
      dayInTheYear = daysInAYearBeforeMonth[ISLEAP(year)][month] + day - 1;
      return true;
   }

   property DateTime global
   {
      set { this = value.local; }
      get
      {
      #if defined(__WIN32__)
         SYSTEMTIME localTime, systemTime;
         FILETIME fileTime, localFileTime;

         localTime.wYear = (short)year;
         localTime.wMonth = (short)(month + 1);
         localTime.wDay = (short)day;
         localTime.wHour = (short)hour;
         localTime.wMinute = (short)minute;
         localTime.wSecond = (short)second;
         localTime.wMilliseconds = 0;

         SystemTimeToFileTime(&localTime, &fileTime);
         LocalFileTimeToFileTime(&fileTime, &localFileTime);
         FileTimeToSystemTime(&localFileTime, &systemTime);

         value.year = systemTime.wYear;
         value.month = (Month)(systemTime.wMonth - 1);
         value.day = systemTime.wDay;
         value.hour = systemTime.wHour;
         value.minute = systemTime.wMinute;
         value.second = systemTime.wSecond;
      #else
         struct tm tm = { 0 };
         //time_t t = (time_t)(SecSince1970)this;
         time_t t = MakeTimeTfromLocalDT(this, -1);
         gmtime_r(&t, &tm);
         value.year = tm.tm_year + 1900;
         value.month = (Month)tm.tm_mon;
         value.day = tm.tm_mday;
         value.hour = tm.tm_hour;
         value.minute = tm.tm_min;
         value.second = tm.tm_sec;
         value.dayInTheYear = tm.tm_yday;
         value.dayOfTheWeek = (DayOfTheWeek)tm.tm_wday;
      #endif
      }
   };
   property DateTime local
   {
      set { this = value.global; }
      get
      {
      #if defined(__WIN32__)
         SYSTEMTIME systemTime, localTime;

         systemTime.wYear = (short)year;
         systemTime.wMonth = (short)(month + 1);
         systemTime.wDay = (short)day;
         systemTime.wHour = (short)hour;
         systemTime.wMinute = (short)minute;
         systemTime.wSecond = (short)second;
         systemTime.wMilliseconds = 0;

         SystemTimeToTzSpecificLocalTime(null, &systemTime, &localTime);

         value.year = localTime.wYear;
         value.month = (Month)(localTime.wMonth - 1);
         value.day = localTime.wDay;
         value.hour = localTime.wHour;
         value.minute = localTime.wMinute;
         value.second = localTime.wSecond;
         value.dayOfTheWeek = (DayOfTheWeek)localTime.wDayOfWeek;

         value.FixDayOfYear();
      #else
         struct tm tm = { 0 };
         // time_t t = (time_t)(SecSince1970)this;
         time_t t = MakeTimeTfromGlobalDT(this, false);
         localtime_r(&t, &tm);
         value.year = tm.tm_year + 1900;
         value.month = (Month)tm.tm_mon;
         value.day = tm.tm_mday;
         value.hour = tm.tm_hour;
         value.minute = tm.tm_min;
         value.second = tm.tm_sec;
         value.dayInTheYear = tm.tm_yday;
         value.dayOfTheWeek = (DayOfTheWeek)tm.tm_wday;
      #endif
      }
   };

   property int64 daysSince1970
   {
      get
      {
         int month = this.month;
         int monthRemainder = month % 12;
         bool negativeMonthRemainder = monthRemainder < 0;
         int monthYears = month / 12 - negativeMonthRemainder;
         int year = this.year + monthYears;
         int a4 = (year       / 4) - !(year       & 3);
         int b4 = (EPOCH_YEAR / 4) - !(EPOCH_YEAR & 3);
         int a100 = a4 / 25 - (a4 % 25 < 0);
         int b100 = b4 / 25 - (b4 % 25 < 0);
         int a400 = a100 / 4;
         int b400 = b100 / 4;
         int leapDays = (a4 - b4) - (a100 - b100) + (a400 - b400);
         int64 days = 365 * (year - EPOCH_YEAR) + leapDays;
         month = monthRemainder + 12 * negativeMonthRemainder;
         days += daysInAYearBeforeMonth[ISLEAP(year)][month] + day - 1;
         return days;
      }
   }

   property SecSince1970
   {
      set
      {
         int64 days, y;
         int rem;

         days = value / SECS_PER_DAY;
         rem = (int)(value % SECS_PER_DAY);

         while(rem < 0)             { rem += SECS_PER_DAY; days--; }
         while(rem >= SECS_PER_DAY) { rem -= SECS_PER_DAY; days++; }

         hour = rem / SECS_PER_HOUR;

         rem %= SECS_PER_HOUR;
         minute = rem / 60;
         second = rem % 60;

         dayOfTheWeek = (EPOCH_WEEKDAY + days) % 7;
         if(dayOfTheWeek < 0)
            dayOfTheWeek += 7;

         y = EPOCH_YEAR;
         while(days < 0 || days >= daysInAYearBeforeMonth[ISLEAP(y)][12])
         {
            int64 yg = y + days / 365 - (days % 365 < 0);
            days -= ((yg - y) * 365 + LEAPS_THRU_END_OF(yg - 1) - LEAPS_THRU_END_OF(y - 1));
            y = yg;
         }
         year = (int)y;
         {
            const int * daysBeforeMonth = daysInAYearBeforeMonth[ISLEAP(y)];
            dayInTheYear = (int)days;
            for(y = 11; days < daysBeforeMonth[y]; y--);
            days -= daysBeforeMonth[y];
            month = (Month)y;
            day = (int)(days + 1);
         }
      }

      get { return 60 * (60 * (24 * daysSince1970 + hour) + minute) + second; }
   };
   property Date
   {
      set
      {
         year = value.year;
         month = value.month;
         day = value.day;
         hour = 0;
         minute = 0;
         second = 0;
      }
      get { value = Date { year, month, day }; }
   }

   const char * OnGetString(char * stringOutput, void * fieldData, ObjectNotationType * onType)
   {
      static const char ampm[2][3] = { "AM", "PM" };
      int hour = this.hour;
      bool pm = false;
      if(hour > 12) { hour -= 12; pm = true; }
      else if(hour == 12) pm = true;
      if(!hour) hour = 12;

      if(!year && !day && !month && !this.hour && !minute && !second)
      {
         if(onType && (*onType == json || *onType == econ))
            strcpy(stringOutput, "null");
         else
            stringOutput[0] = 0;
      }
      else
      {
         const String quotes = (onType && (*onType == json || *onType == econ)) ? "\"" : "";
         sprintf(stringOutput, "%s%s %s %2d %2d:%02d:%02d %s %04d%s",
            quotes, shortDaysNames[dayOfTheWeek], shortMonthsNames[month], day, hour, minute, second, ampm[pm], year, quotes);
      }

      return stringOutput;
   }

   bool OnGetDataFromString(const char * string)
   {
      char * s = CopyString(string);
      char * tokens[20];
      int count = TokenizeWith(s, 20, tokens, " ", false);
      int c;
      bool foundDayOfTheWeek = false;
      bool foundDate = false;
      DayOfTheWeek dayOfTheWeek = 0;
      int day = 0;
      int minute = 0;
      int second = 0;
      int hour = 0;
      int year = 0;

      for(c = 0; c < count; c++)
      {
         int i;
         for(i = 0; i<7; i++)
            if(!strcmpi(tokens[c], shortDaysNames[i]) || !strcmpi(tokens[c], longDaysNames[i]) ||
               !strcmpi(tokens[c], enShortDaysNames[i]) || !strcmpi(tokens[c], enLongDaysNames[i]))
               break;
         if(i < 7) { dayOfTheWeek = (DayOfTheWeek)i; foundDayOfTheWeek = true; continue; }

         for(i = 0; i<12; i++)
            if(!strcmpi(tokens[c], shortMonthsNames[i]) || !strcmpi(tokens[c], longMonthsNames[i]) ||
               !strcmpi(tokens[c], enShortMonthsNames[i]) || !strcmpi(tokens[c], enLongMonthsNames[i]))
               break;
         if(i < 12) { month = (Month)i; continue; }

         if(strchr(tokens[c], ':'))
         {
            int t;
            bool pm = false, am = false;
            char * subTokens[20];
            char * timeAfterDate =  strchr(tokens[c], 'T');
            // If there is a 'T' the time string starts after its position
            int sCount = TokenizeWith( (timeAfterDate)?timeAfterDate+1:tokens[c], 20, subTokens, " :", false);
            for(t = 0; t<sCount; t++)
            {
               if(!strcmpi(subTokens[t], "am")) am = true;
               else if(!strcmpi(subTokens[t], "pm")) pm = true;
               else if(t-am-pm == 0) hour = atoi(subTokens[t]);
               else if(t-am-pm == 1) minute = atoi(subTokens[t]);
               else if(t-am-pm == 2) second = atoi(subTokens[t]);
            }

            if(c < count - 1)
            {
               if(!strcmpi(tokens[c+1], "am")) am = true;
               else if(!strcmpi(tokens[c+1], "pm")) pm = true;
            }

            if(am && hour == 12) hour = 0;
            else if(pm && hour < 12) hour += 12;

            if(timeAfterDate)
               // If there was a 'T' the charactes before it contain the date:
               // do not interrupt the iteration now so that the followong if
               // clause will pick it up.
               timeAfterDate[0] = '\0';
            else
               continue;
         }

         if(!foundDate)
         {
            if(strchr(tokens[c], '/') || strchr(tokens[c], '-'))
            {
               Date date;
               if(date.OnGetDataFromString(tokens[c]))
               {
                  day = date.day;
                  year = date.year;
                  month = date.month;
               }
               foundDate = true;
            }
            else
            {
               i = atoi(tokens[c]);
               if(i > 31)
               {
                  year = i;
                  continue;
               }
               else if(i)
                  day = i;
            }
         }
      }
      if(day)
      {
         Date date { year, month, day };
         this.dayOfTheWeek = date.dayOfTheWeek;
         this.day = day;
         this.minute = minute;
         this.second = second;
         this.hour = hour;
         this.year = year;
      }
      else if(foundDayOfTheWeek)
      {
         SecSince1970 weWant;
         GetLocalTime();
         if(dayOfTheWeek <= this.dayOfTheWeek) dayOfTheWeek += 7;
         weWant = (SecSince1970)this + (int)(dayOfTheWeek - this.dayOfTheWeek) * 24 * 60 * 60;
         this = (DateTime)weWant;
      }
      else if(!strcmpi(s, "today") || !strcmpi(s, $"today") ||
              !strcmpi(s, "now") || !strcmpi(s, $"now"))
         GetLocalTime();
      else if(!strcmpi(s, "tomorrow") || !strcmpi(s, $"tomorrow"))
      {
         SecSince1970 weWant;
         GetLocalTime();
         weWant = (SecSince1970)this + 24 * 60 * 60;
         this = (DateTime)weWant;
      }
      else if(!strcmpi(s, "yesterday") || !strcmpi(s, $"yesterday"))
      {
         SecSince1970 weWant;
         GetLocalTime();
         weWant = (SecSince1970)this - 24 * 60 * 60;
         this = (DateTime)weWant;
      }
      else if(!s[0])
      {
         this = { };
         delete s;
         return true;
      }
      else
         this.year = year;
      delete s;
      return this.day != 0;
   }
};

public Time GetTime(void)
{
#if defined(__WIN32__)
   return timeGetTime() / 1000.0;
#elif defined(__unix__) || defined(__APPLE__)
   struct timeval tp;
   struct timezone tzp;
   static int secbase = 0;

   gettimeofday(&tp, &tzp);

   if(!secbase)
   {
      secbase = (int)tp.tv_sec;
      return tp.tv_usec / 1000000.0;
   }
   return (tp.tv_sec - secbase) + tp.tv_usec / 1000000.0;
#endif
}

public void Sleep(Seconds seconds)
{
#if defined(__WIN32__)
   ::Sleep((uint)(seconds * 1000));
#else
   if(!seconds)
      sched_yield();
   else
   {
      // usleep((uint)(seconds * 1000000));
      struct timeval tv = { (int)seconds, (int)((seconds - (int)seconds) * 1000000) };
      select(0,null,null,null, &tv);
   }
#endif
}

public void RandomSeed(uint seed)
{
#if defined(__linux__) || defined(__DJGPP__)
   srandom(seed);
#else
   srand(seed);
#endif
}

public int GetRandom(int lo, int hi)
{
   if(hi >= lo)
   {
#if defined(__linux__) || defined(__DJGPP__)
   #define rand_fn random
#else
   #define rand_fn rand
#endif
      if(hi - lo > RAND_MAX)
         return (int)(lo + ((uint)(hi - lo) + 1.0) * (rand_fn() * ((double)RAND_MAX + 1.0) + rand_fn()) / (RAND_MAX * (RAND_MAX + 1.0) + RAND_MAX + 1.0));
      else
         return (int)(lo + ((uint)(hi - lo) + 1.0) * rand_fn() / (RAND_MAX + 1.0));
   }
   else
      return lo;
}
