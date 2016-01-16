namespace sys;

import "i18n"
import "System"
import "CalendarControl"

#define ISLEAP(y) (!((y)%4) && (((y) % 100) || (!((y)% 400))))

/*static */Array<const String> enLongDaysNames
{ [
   "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
] };
/*static */Array<const String> enLongMonthsNames
{ [
   "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
] };

/*static */Array<const String> enShortDaysNames
{ [
   "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"
] };
/*static */Array<const String> enShortMonthsNames
{ [
   "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
] };

/*static */Array<const String> longDaysNames
{ [
   $"Sunday", $"Monday", $"Tuesday", $"Wednesday", $"Thursday", $"Friday", $"Saturday"
] };
/*static */Array<const String> longMonthsNames
{ [
   $"January", $"February", $"March", $"April", $"LongMonthNames"."May", $"June", $"July", $"August", $"September", $"October", $"November", $"December"
] };

/*static */Array<const String> shortDaysNames
{ [
   $"Sun", $"Mon", $"Tue", $"Wed", $"Thu", $"Fri", $"Sat"
] };
/*static */Array<const String> shortMonthsNames
{ [
   $"Jan", $"Feb", $"Mar", $"Apr", $"ShortMonthNames"."May", $"Jun", $"Jul", $"Aug", $"Sep", $"Oct", $"Nov", $"Dec"
] };

default:
extern int __ecereVMethodID_class_OnGetString;
public:

public enum Month
{
   january, february, march, april, may, june, july, august, september, october, november, december;

   const char * OnGetString(char * string, void * fieldData, bool * needClass)
   {
      Month m = this;
      if(m >= january && m <= december)
      {
         if(!needClass || !*needClass)
            return longMonthsNames[m];
         else
            return class::OnGetString(string, fieldData, needClass);
      }
      return null;
   }

   bool OnGetDataFromString(const char * string)
   {
      if(string)
      {
         Month m;
         for(m = 0; m<=december; m++)
         {
            if(!strcmpi(shortMonthsNames[m], string)  || !strcmpi(longMonthsNames[m], string) ||
               !strcmpi(enShortMonthsNames[m], string) || !strcmpi(enLongMonthsNames[m], string))
            {
               this = m;
               return true;
            }
         }
      }
      return false;
   }
};

default:
extern int __ecereVMethodID_class_OnGetString;
private:

public struct Date
{
   int year;
   Month month;
   int day;

   int OnCompare(Date b)
   {
      if(year > b.year) return 1;
      if(year < b.year) return -1;
      if(month > b.month) return 1;
      if(month < b.month) return -1;
      if(day > b.day) return 1;
      if(day < b.day) return -1;
      return 0;
   }

   const char * OnGetString(char * stringOutput, void * fieldData, bool * needClass)
   {
      if(stringOutput)
      {
         if(day && year)
            sprintf(stringOutput, "%s, %s %2d, %d",
               longDaysNames[dayOfTheWeek], longMonthsNames[month], day, year);
         else
            stringOutput[0] = 0;
      }
      return stringOutput;
   }

   const char * OnGetStringEn(char * stringOutput, void * fieldData, bool * needClass)
   {
      if(stringOutput)
      {
         if(day && year)
            sprintf(stringOutput, "%s, %s %2d, %d",
               enLongDaysNames[dayOfTheWeek], enLongMonthsNames[month], day, year);
         else
            stringOutput[0] = 0;
      }
      return stringOutput;
   }

   bool OnGetDataFromString(const char * string)
   {
      char value[256];
      bool gotAlphaMonth = false;
      DateTime time;
      int year, day;
      Month month = 0;
      int numerics[3];
      int len[3];
      int count = 0;
      time.GetLocalTime();

      if(!strcmpi(string, "today") || !strcmpi(string, $"today") ||
         !strcmpi(string, "now") || !strcmpi(string, $"now") ||
         !strcmpi(string, "tomorrow") || !strcmpi(string, $"tomorrow") ||
         !strcmpi(string, "yesterday") || !strcmpi(string, $"yesterday"))
      {
         SecSince1970 weWant;
         if(!strcmpi(string, "tomorrow") || !strcmpi(string, $"tomorrow"))
         {
            weWant = (SecSince1970)time + 24 * 60 * 60;
            time = (DateTime)weWant;
         }
         else if(!strcmpi(string, "yesterday") || !strcmpi(string, $"yesterday"))
         {
            weWant = (SecSince1970)time - 24 * 60 * 60;
            time = (DateTime)weWant;
         }
         this.year = time.year;
         this.month = time.month;
         this.day = time.day;
         return true;
      }

      if(string)
      {
         if(!string[0])
         {
            this.year = 0;
            this.month = 0;
            this.day = 0;
            return true;
         }
         while(GetAlNum(&string, value, sizeof(value)))
         {
            int numeric = atoi(value);
            int c;
            bool isAlpha = false;
            unichar ch;
            int nb;
            for(c = 0; (ch = UTF8GetChar(value + c, &nb)) && !isAlpha; c += nb)
            {
               // if(isalpha(value[c])) isAlpha = true;
               if(CharMatchCategories(ch, letters)) isAlpha = true;
            }

            if(isAlpha)
            {
               Month m;
               for(m = 0; m<Month::enumSize; m++)
                  if(!strcmpi(shortMonthsNames[m], value)  || !strcmpi(longMonthsNames[m], value) ||
                     !strcmpi(enShortMonthsNames[m], value) || !strcmpi(enLongMonthsNames[m], value))
                  {
                     month = m;
                     gotAlphaMonth = true;
                     break;
                  }
            }
            else if(count < 3)
            {
               len[count] = strlen(value);
               numerics[count++] = numeric;
            }
         }
      }
      if(count + gotAlphaMonth >= 3)
      {
         int yearLen;
         if(!gotAlphaMonth)
         {
            if(numerics[1] >= 1 && numerics[1] <= 12 &&
               numerics[2] >= 1 && numerics[2] <= 31)
            {
               year = numerics[0]; yearLen = len[0];
               month = (Month)(numerics[1] - 1);
               day = numerics[2];
            }
            else if(numerics[1] >= 1 && numerics[1] <= 31 &&
                    numerics[2] >= 1 && numerics[2] <= 12)
            {
               year = numerics[0]; yearLen = len[0];
               day = numerics[1];
               month = (Month)(numerics[2] - 1);
            }
            /*
            else if(numerics[0] >= 1 && numerics[0] <= 31 &&
                    numerics[1] >= 1 && numerics[1] <= 12)
            {
               day = numerics[0];
               month = (Month)(numerics[1] - 1);
               year = numerics[2]; yearLen = len[2];
            }
            else if(numerics[0] >= 1 && numerics[0] <= 12 &&
                    numerics[1] >= 1 && numerics[1] <= 31)
            {
               month = (Month)(numerics[0] - 1);
               day = numerics[1];
               year = numerics[2]; yearLen = len[2];
            }*/
            // FLIPPED THESE
            else if(numerics[0] >= 1 && numerics[0] <= 12 &&
                    numerics[1] >= 1 && numerics[1] <= 31)
            {
               month = (Month)(numerics[0] - 1);
               day = numerics[1];
               year = numerics[2]; yearLen = len[2];
            }
            else if(numerics[0] >= 1 && numerics[0] <= 31 &&
                    numerics[1] >= 1 && numerics[1] <= 12)
            {
               day = numerics[0];
               month = (Month)(numerics[1] - 1);
               year = numerics[2]; yearLen = len[2];
            }
            else
               return false;
         }
         else
         {
            if(numerics[0] < 1 || numerics[0] > 31 || (len[0] == 2 && numerics[0] < 10))
            {
               year = numerics[0]; yearLen = len[0];
               day = numerics[1];
            }
            else if(numerics[0] >= 1 && numerics[0] <= 31)
            {
               day = numerics[0];
               year = numerics[1]; yearLen = len[1];
            }
            else if(numerics[1] >= 1 && numerics[1] <= 31)
            {
               year = numerics[0]; yearLen = len[0];
               day = numerics[1];
            }
            else
               return false;
         }

         if(year < 100 && yearLen == 2)
         {
            year += (time.year / 100) * 100;
            if(Abs(year - time.year) >= 50)
               year -= 100;
         }
      }
      else if(count >= 2 && !gotAlphaMonth)
      {
         // No Year Specified
         year = time.year;
         if(numerics[0] >= 1 && numerics[0] <= 12 &&
            numerics[1] >= 1 && numerics[1] <= 31)
         {
            month = (Month)(numerics[0] - 1);
            day = numerics[1];
         }
         else if(numerics[0] >= 1 && numerics[0] <= 31 &&
                 numerics[1] >= 1 && numerics[1] <= 12)
         {
            day = numerics[0];
            month = (Month)(numerics[1] - 1);
         }
         else
            return false;
      }
      else if(count >= 1 && gotAlphaMonth)
      {
         year = time.year;
         day = numerics[0];
      }
      else
         return false;

      if(day > monthLengths[ISLEAP(year)][month])
         return false;

      this.year = year;
      this.month = month;
      this.day = day;

      return true;
   }

   property DayOfTheWeek dayOfTheWeek
   {
      get
      {
         DayOfTheWeek dayOfTheWeek;
         int a4 = (year       / 4) - !(year       & 3);
         int b4 = (EPOCH_YEAR / 4) - !(EPOCH_YEAR & 3);
         int a100 = a4 / 25 - (a4 % 25 < 0);
         int b100 = b4 / 25 - (b4 % 25 < 0);
         int a400 = a100 / 4;
         int b400 = b100 / 4;
         int leapDays = (a4 - b4) - (a100 - b100) + (a400 - b400);
         int days = 365 * (year - EPOCH_YEAR) + leapDays;
         days += daysInAYearBeforeMonth[ISLEAP(year)][month] + day - 1;
         dayOfTheWeek = (EPOCH_WEEKDAY + days) % 7;
         if(dayOfTheWeek < 0)
            dayOfTheWeek += 7;
         return dayOfTheWeek;
      }
   }

   bool OnSaveEdit(DropBox dropBox, void * object)
   {
      return dropBox.Save();
   }

   Window OnEdit(DataBox dataBox, Window obsolete, int x, int y, int w, int h, void * fieldData)
   {
      const char * string = "";
      DateDropBox comboBox
      {
         dataBox,
         editText = true;
         anchor = { 0, 0, 0, 0 };
         borderStyle = 0;
         hotKey = f2;
      };

      if(day || year || month)
      {
         char tempString[MAX_F_STRING] = "";
         bool needClass = false;
         const char * result = OnGetString(tempString, null, &needClass);
         if(result) string = result;

         comboBox.calendar.dateValue = this;
         comboBox.calendar.shownMonth = month;
         comboBox.calendar.shownYear = year;
      }
      else
      {
         DateTime now;
         now.GetLocalTime();
         comboBox.calendar.dateValue.year = now.year;
         comboBox.calendar.dateValue.month = (Month)now.month;
         comboBox.calendar.dateValue.day = now.day;
         comboBox.calendar.shownMonth = (Month)now.month;
         comboBox.calendar.shownYear = now.year;
      }

      comboBox.contents = string;
      comboBox.Create();
      if(!dataBox.active)
         comboBox.contents = string;
      return comboBox;
   }
};

class DateDropBox : DropBox
{
   bool dateModified;
   void EditNotifyUpdate(EditBox editBox)
   {
      if(pullDown)
         dateModified = true;
   }

   bool OnPostCreate()
   {
      editBox.NotifyUpdate = EditNotifyUpdate;
      return true;
   }
   bool OnKeyDown(Key key, unichar ch)
   {
      SmartKey sKey = (SmartKey)key;
      if(pullDown && sKey == enter)
      {
         // Because we can still edit the date text while the calendar is dropped, enter on the date box should validate it
         NotifyTextEntry(master, this, contents, true);
         ((DataBox)master).SetData(&calendar.dateValue, false);
         ((DataBox)master).Refresh();
         return false;
      }
      return DropBox::OnKeyDown(key, ch);
   }
   CalendarControl calendar
   {
      master = this, autoCreate = false;
      interim = true;

      bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
      {
         if(!active)
         {
            DateDropBox dropBox = (DateDropBox)master;
            Destroy(0);
            ((DataBox)dropBox.master).Refresh();
            *goOnWithActivation = false;
         }
         return true;
      }

      void NotifyChanged(CalendarControl calendarControl, bool close)
      {
         incref this;
         if(dateModified)
         {
            Date date = calendar.dateValue;
            dateModified = false;
            if(date.OnGetDataFromString(contents))
            {
               if(date.year || date.month || date.day)
               {
                  calendar.dateValue = date;
                  calendar.shownMonth = date.month;
                  calendar.shownYear = date.year;
                  dateModified = true;
               }
            }
         }
         if(!dateModified)
            NotifyTextEntry(master, this, null, false);
         dateModified = false;
         //((DataBox)master).SetData(&calendar.dateValue, false);
         if(close)
         {
            OnKeyDown(enter, 0);
            // TESTING THIS HERE:
            ((DataBox)master).Refresh();
         }
         delete this;
      }
   };

   Window OnDropDown()
   {
      editBox.Activate();
      if(contents[0])
         NotifyTextEntry(master, this, contents, true);
      calendar.Create();
      return calendar;
   }

   void OnCloseDropDown(Window dateEditor)
   {
      master.Update(null);
      calendar.Destroy(0);
   }

   bool DataBox::NotifyTextEntry(DateDropBox dropBox, const char * string, bool save)
   {
      CalendarControl calendar = (CalendarControl)dropBox.calendar;
      Date date = calendar.dateValue;
      Date * dataBoxDate = (Date *)data;

      if(save)
      {
         if(date.OnGetDataFromString(string))
         {
            // TESTING THIS COMMENTED OUT HERE: (Not good -- was modifying on drop down!)
            // With it not commented out, a current date in a SavingDataBox always shows blank
            if(date.year != calendar.dateValue.year || date.year != dataBoxDate->year ||
               date.month != calendar.dateValue.month || date.month != dataBoxDate->month ||
               date.day != calendar.dateValue.day || date.day != dataBoxDate->day)
               SetData(&date, false);
            if(date.year || date.month || date.day)
            {
               calendar.dateValue = date;
               calendar.shownMonth = date.month;
               calendar.shownYear = date.year;
            }
            if(calendar.created)
            {
               calendar.Destroy(0);
               calendar.Create();
            }
         }
      }
      {
         char tempString[1024] = "";
         bool needClass = false;
         // char * string = date.OnGetString(tempString, null, &needClass);
         const char * string = ((const char *(*)(void *, void *, char *, void *, bool *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, &date, tempString, null, &needClass);
         dropBox.contents = string;
      }
      return true;
   }
};

public class RepButton : Button
{
public:
   bool pressing;
   isRemote = true;
   inactive = true;

   property Seconds delay { set { timer2.delay = value; } }
   property Seconds delay0 { set { timer.delay = value; } }

   bool OnKeyHit(Key key, unichar ch)
   {
      if(key == hotKey)
      {
         return NotifyClicked(master, this, 0, 0, key.modifiers);
         // return false;
      }
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      if(key == hotKey)
      {
         /*return */NotifyPushed(master, this, 0,0, key.modifiers);
         return false; //true;
      }
      return true;
   }

   bool OnKeyUp(Key key, unichar ch)
   {
      if(key == hotKey)
      {
         return NotifyReleased(master, this, 0,0, key.modifiers);
         // return false;
      }
      return true;
   }

   bool NotifyPushed(RepButton button, int x, int y, Modifiers mods)
   {
      button.pressing = true;
      button.NotifyClicked(this, button, x, y, mods);
      button.timer.Start();
      return true;
   }

   bool NotifyMouseLeave(RepButton button, Modifiers mods)
   {
      button.timer.Stop();
      button.timer2.Stop();
      return true;
   }

   bool NotifyReleased(RepButton button, int x, int y, Modifiers mods)
   {
      button.pressing = false;
      button.NotifyMouseLeave(this, button, mods);
      return false;
   }

   bool NotifyMouseOver(RepButton button, int x, int y, Modifiers mods)
   {
      if(button.pressing)
         button.timer2.Start();
      return true;
   }

   Timer timer
   {
      this, delay = 0.5;

      bool DelayExpired()
      {
         timer.Stop();
         timer2.Start();
         timer2.DelayExpired(this);
         return true;
      }
   };
   Timer timer2
   {
      this, delay = 0.1;
      bool DelayExpired()
      {
         NotifyClicked(master, this, 0, 0, 0);
         return true;
      }
   };
}
