namespace sys;

import "System"
import "CalendarControl"

#define ISLEAP(y) (!((y)%4) && (((y) % 100) || (!((y)% 400))))

/*static */const char longDaysNames[7][10] =
{
   "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
};
/*static */const char longMonthsNames[12][10] = 
{
   "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
};
public enum Month { january, february, march, april, may, june, july, august, september, october, november, december };

default:
extern int __ecereVMethodID_class_OnGetString;
private:

public struct Date
{
   int year;
   Month month;
   int day;
   
   char * OnGetString(char * stringOutput, void * fieldData, bool * needClass)
   {
      if(stringOutput)
      {
         static const char days[7][4] =
         {
            "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"
         };
         static const char months[12][4] = 
         {
            "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
         };
         if(day && year)
            sprintf(stringOutput, "%s, %s %2d, %d", 
               longDaysNames[dayOfTheWeek], longMonthsNames[month], day, year);
         else
            stringOutput[0] = 0;
      }
      return stringOutput;
   }

   bool OnGetDataFromString(char * string)
   {
      char value[256];
      bool gotAlphaMonth = false;
      DateTime time;
      int year, day;
      Month month;
      int numerics[3];
      int len[3];
      int count = 0;
      time.GetLocalTime();

      if(!strcmpi(string, "today") || !strcmpi(string, "now") || 
         !strcmpi(string, "tomorrow") || !strcmpi(string, "yesterday"))
      {
         SecSince1970 weWant;
         if(!strcmpi(string, "tomorrow"))
         {
            weWant = (SecSince1970)time + 24 * 60 * 60;
            time = (DateTime)weWant;
         }
         else if(!strcmpi(string, "yesterday"))
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
            bool resolved = false;
            int c;
            bool isAlpha = false;
            for(c = 0; value[c] && !isAlpha; c++)
               if(isalpha(value[c])) isAlpha = true;

            if(isAlpha)
            {            
               Month c;
               for(c = 0; c<Month::enumSize; c++)
                  if(!strnicmp(monthsNames[c], value, 3))
                  {
                     month = c;
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
      char * string = "";
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
         char * result = OnGetString(tempString, null, &needClass);
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
   bool OnKeyDown(Key key, unichar ch)
   {
      if(pullDown && (SmartKey)key == enter)
      {
         NotifyTextEntry(master, this, null, false);
         ((DataBox)master).SetData(&calendar.dateValue, false);
         ((DataBox)master).Refresh();
      }
      return DropBox::OnKeyDown(key, ch);
   }
   CalendarControl calendar
   {
      master = this, autoCreate = false;
      interim = true;

      void NotifyChanged(bool close)
      {
         incref this;
         NotifyTextEntry(master, this, null, false);
         ((DataBox)master).SetData(&calendar.dateValue, false);
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

   bool DataBox::NotifyTextEntry(DateDropBox dropBox, char * string, bool save)
   {
      CalendarControl calendar = (CalendarControl)dropBox.calendar;
      Date date = calendar.dateValue;

      if(save)
      {
         if(date.OnGetDataFromString(string))
         {
            // TESTING THIS COMMENTED OUT HERE:
            /*if(date.year != calendar.dateValue.year ||
               date.month != calendar.dateValue.month ||
               date.day != calendar.dateValue.day)*/
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
         char * string = (char *)type._vTbl[__ecereVMethodID_class_OnGetString](type, &date, tempString, null, &needClass);
         dropBox.contents = string;
      }
      return true;
   }
};

class RepButton : Button
{
   bool pressing;
   isRemote = true;
   
   property Seconds delay { set { timer2.delay = value; } }
   property Seconds delay0 { set { timer.delay = value; } }
   
   bool OnKeyHit(Key key, unichar ch)
   {
      if(key == hotKey)
      {
         NotifyClicked(master, this, 0, 0, key.modifiers);
         return false;
      }
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      if(key == hotKey)
      {
         //NotifyPushed(master, this, 0,0, key.modifiers);
         return true;
      }
      return true;
   }

   bool OnKeyUp(Key key, unichar ch)
   {
      if(key == hotKey)
      {
         //NotifyReleased(master, this, 0,0, key.modifiers);
         return false;
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
      {                                                `
         NotifyClicked(master, this, 0, 0, 0);
         return true;
      }
   };
}
