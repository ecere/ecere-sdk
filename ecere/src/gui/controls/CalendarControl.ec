namespace gui::controls;

import "Window"

#define ISLEAP(y) (!((y)%4) && (((y) % 100) || (!((y)% 400))))

public class CalendarControl : CommonControl
{
   class_property(icon) = "<:ecere>controls/calendar.png";

public:
   virtual void Window::NotifyChanged(bool close);      
   Date dateValue;
   Month shownMonth;
   int shownYear;

private:
   background = { 195, 217, 255 };
   clientSize = { 168, 198 };
   tabCycle = true;

   bool OnCreate()
   {
      if(!dateValue.year && !dateValue.day && !dateValue.month)
      {
         DateTime now;
         now.GetLocalTime();
         dateValue.day = now.day;
         dateValue.month = now.month;
         shownYear = dateValue.year = now.year;
         shownMonth = dateValue.month;         
      }
      return true;
   }
   
   RepButton leftArrow
   {
      this, 
      position = { 3, 8 };
      size = { 16, 16 };
      bevel = false;
      inactive = true;
      background = background;
      font = { $"Verdana", 8.25f, true };
      foreground = navy;
      offset = false;
      text = "«";
      hotKey = pageUp;
      
      bool NotifyClicked(Button button, int x, int y, ecere::gui::Modifiers mods)
      {
         shownMonth--;
         if(shownMonth < january) { shownMonth = december; shownYear--; yearBox.Refresh(); }
         monthBox.Refresh();         
         Update(null);
         dateBox.Activate();
         return true;
      }
   };
   RepButton rightArrow
   {
      this, 
      anchor = { right = 8, top = 8 };
      size = { 16, 16 };
      bevel = false;
      inactive = true;
      offset = false;
      background = background;
      font = { $"Verdana", 8.25f, true };
      foreground = navy;
      text = "»";
      hotKey = pageDown;

      bool NotifyClicked(Button button, int x, int y, ecere::gui::Modifiers mods)
      {
         shownMonth++;
         if(shownMonth > december) { shownMonth = january; shownYear++; yearBox.Refresh(); }
         monthBox.Refresh();
         Update(null);
         dateBox.Activate();
         return true;
      }
   };   

   DataBox monthBox
   {
      this, type = class(Month), data = &shownMonth, position = { 25, 5 }, size = { 75, 20 };
      background = background;
      foreground = navy;
      font = { $"Verdana", 8.25f, true };

      bool OnPostCreate()
      {
         DataBox::OnPostCreate();
         ((DropBox)editor).showButton = false;
         ((DropBox)editor).alignment = right;
         return true;
      }

      bool NotifyChanged(bool closingDropDown)
      {
         Update(null);
         if(closingDropDown)
            dateBox.Activate();
         return true;
      }
   };
   DataBox yearBox
   {
      this, type = class(int), data = &shownYear, position = { 100, 5 }, size = { 38, 20 };
      font = { $"Verdana", 8.25f, true };
      background = background;
      foreground = navy;

      bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
      {
         if(!active)
         {
            SaveData();
         }
         return true;
      }
      
      bool OnPostCreate()
      {
         DataBox::OnPostCreate();
         ((EditBox)editor).textHorzScroll = false;
         return true;
      }

      bool NotifyChanged(bool closingDropDown)
      {
         if(shownYear < 100)
         {
            DateTime time;
            time.GetLocalTime();
            shownYear += (time.year / 100) * 100;
            if(Abs(shownYear - time.year) >= 50)
               shownYear -= 100;
            yearBox.Refresh();           
         }
         Update(null);
         dateBox.Activate();
         return true;
      }
   };
#define  Height   20
#define  Width    24
   void FindDate(int mx, int my, bool changeMonth, bool close)
   {
      DayOfTheWeek d;
      int x, y;
      int w;
      Date day = { shownYear, shownMonth, 1 };
      d = day.dayOfTheWeek;
      day.day -= 7 + (d % 7);
      if(day.day < 1)
      {
         if(--day.month < january)
         {
            day.month = december;
            day.year--;
         }
         day.day += monthLengths[ISLEAP(day.year)][day.month];
      }

      y = 5 + Height;
      for(w = 0; w<7; w++, y += Height)
      {
         for(x = Width / 2, d = sunday; d <= saturday; d++, x += Width)
         {
            if(mx >= x-10 && my >= y && mx <= x+10 && my <= y+15 && (day.month == shownMonth || changeMonth))
            {
               bool closeCalendar = close && dateValue.day == day.day && dateValue.month == day.month && dateValue.year == day.year;
               dateValue = day;
               shownMonth = day.month;
               shownYear = day.year;
               Update(null);
               monthBox.Refresh();
               yearBox.Refresh();

               NotifyChanged(master, closeCalendar);
               return;
            }
            if(++day.day > monthLengths[ISLEAP(day.year)][day.month])
            {
               day.day = 1;
               if(++day.month > december)
               {
                  day.year++;
                  day.month = january;
               }
            }
         }
      }
   }
   Window dateBox
   {
      this, anchor = { top = 30, left = 0, right = 0, bottom = 0 };

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
         if(mods.left && !mods.isSideEffect)
            ((CalendarControl)master).FindDate(x, y, false, false);
         return true;         
      }
      bool OnLeftButtonDown(int x, int y, Modifiers mods)
      {
         ((CalendarControl)master).FindDate(x, y, false, true);
         return true;
      }
      bool OnLeftButtonUp(int x, int y, Modifiers mods)
      {
         ((CalendarControl)master).FindDate(x, y, true, false);
         return true;
      }

      void OnRedraw(Surface surface)
      {
         CalendarControl dateEditor = (CalendarControl)master;
         DayOfTheWeek d;
         int x, y;
         int w;
         Date day = { dateEditor.shownYear, dateEditor.shownMonth, 1 };
         d = day.dayOfTheWeek;
         day.day -= 7 + (d % 7);
         if(day.day < 1)
         {
            if(--day.month < january)
            {
               day.month = december;
               day.year--;
            }
            day.day += monthLengths[ISLEAP(day.year)][day.month];
         }

         surface.SetBackground(dateEditor.background);
         surface.Area(0, 0, clientSize.w, Height-1);

         surface.SetForeground(black);
         for(d = sunday; d <= saturday; d++)
         {
            String s = shortDaysNames[d];
            surface.CenterTextf(Width / 2 + d * Width, 0, "%c", toupper(s[0]));
         }

         surface.SetBackground(Color { 238, 238, 238 } /*whiteSmoke*/);
         surface.Area(0, Height, Width, clientSize.h);
         surface.Area(6 * Width, Height, 7*Width, clientSize.h);
         
         surface.SetForeground(lightGray);
         surface.DrawLine(0, Height, clientSize.w, Height);
         surface.DrawLine(0, Height, 0, clientSize.h);
         surface.SetForeground(dateEditor.background);
         surface.DrawLine(clientSize.w-1, Height, clientSize.w-1, clientSize.h);
         surface.DrawLine(0, clientSize.h-1, clientSize.w, clientSize.h-1);

         y = 5 + Height;
         for(w = 0; w<7; w++, y += Height)
         {
            for(x = Width / 2, d = sunday; d <= saturday; d++, x += Width)
            {
               if(day.year == dateEditor.dateValue.year && day.month == dateEditor.dateValue.month && day.day == dateEditor.dateValue.day)
               {
                  surface.SetBackground(navy);
                  surface.Area(x - 10, y, x + 10, y + 15);
                  if(day.month == dateEditor.shownMonth)
                     surface.SetForeground(white);
                  else
                     surface.SetForeground(gray);
               }
               else if(day.month == dateEditor.shownMonth)
                  surface.SetForeground(black);
               else
                  surface.SetForeground(gray);

               surface.CenterTextf(x, y, "%d", day.day);
               if(++day.day > monthLengths[ISLEAP(day.year)][day.month])
               {
                  day.day = 1;
                  if(++day.month > december)
                  {
                     day.year++;
                     day.month = january;
                  }
               }
            }
         }      
      }
   };

   bool OnKeyHit(Key key, unichar ch)
   {
      switch((Key)(SmartKey) key)         // Because it's inside ecere.dll and no property interpretation yet
      {
         case left:
         case up:
         case right:
         case down:
            if(dateBox.active)
            {
               if(shownMonth != dateValue.month || shownYear != dateValue.year)
               {
                  dateValue.month = shownMonth;
                  dateValue.year = shownYear;
                  dateValue.day = 1;
               }
               else if(key == left) dateValue.day--;
               else if(key == right) dateValue.day++;
               else if(key == up) dateValue.day-=7;
               else if(key == down) dateValue.day+=7;
               if(dateValue.day < 1)
               {
                  if(--dateValue.month < january)
                  {
                     dateValue.month = december;
                     dateValue.year--;
                  }
                  dateValue.day += monthLengths[ISLEAP(dateValue.year)][dateValue.month];
               }
               else if(dateValue.day > monthLengths[ISLEAP(dateValue.year)][dateValue.month])
               {
                  dateValue.day -= monthLengths[ISLEAP(dateValue.year)][dateValue.month];
                  if(++dateValue.month > december)
                  {
                     dateValue.year++;
                     dateValue.month = january;
                  }
               }
               shownMonth = dateValue.month;
               shownYear = dateValue.year;
               NotifyChanged(master, false);

               monthBox.Refresh();
               yearBox.Refresh();
               Update(null);
            }
            return false;
      }
      return true;
   }

   bool OnPostCreate()
   {
      if(active)
         dateBox.Activate();
      return true;
   }
}
