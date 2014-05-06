import "ecere"
import "timeAddendum"

class ReminderWindow : Window
{
   text = "Reminder";
   background = activeBorder;
   borderStyle = sizable;
   hasMinimize = true;
   hasClose = true;
   stayOnTop = true;
   size = { 480, 200 };
   minClientSize = { 360, 100 };

   Time lastTime;
   Seconds delay;
   property Seconds delay
   {
      set
      {
         char s[MAX_F_STRING];
         char msg[MAX_F_STRING];
         Minutes minutes = value;
         minutes.ToString(s, class(Seconds));
         sprintf(msg, "Remind Me Delay: %s", s);
         note.text = msg;
         delay = value;
      }
   }

   bool OnPostCreate()
   {
      char unescaped[16384];
      if(app.argc > 1)
      {
         struscpy(unescaped, app.argv[1]);
         message.contents = unescaped;
      }

      if(app.argc > 2)
         property::delay = atoi(app.argv[2]);
      else
         property::delay = 3;

      if(app.argc > 3)
         text = app.argv[3];

      return true;
   }

   Label note { this, text = "Note", position = { 16, 160 }, anchor = { left = 10, bottom = 10 } };
   Button remindMe
   {
      this, caption = "Remind Me", escape, anchor = { right = 54, bottom = 10 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         char s[MAX_F_STRING];
         char msg[MAX_F_STRING];
         Minutes minutes = delay;
         minutes.ToString(s, class(Seconds));
         sprintf(msg, "You will be reminded in %s", s);
         if(MessageBox { parent = this, master = this, type = okCancel, text = "Remind Me", contents = msg }.Modal() == ok)
         {
            lastTime = GetTime();
            timer.Start();
            state = minimized;
         }
         return true;
      }
   };
   Button done
   {
      this, text = "Done", anchor = { right = 10, bottom = 10 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(MessageBox { parent = this, master = this, type = yesNo, text = "Done", contents = "Are you sure that you're done with this reminder?" }.Modal() == yes)
         {
            Destroy(0); //ButtonCloseDialog(button, x, y, mods);
         }
         return true;
      }
   };
   EditBox message { this, text = "Message", anchor = { left = 8, top = 8, right = 8, bottom = 40 }, readOnly = true, multiLine = true, noCaret = true, borderStyle = none };
   Timer timer
   {
      delay = 5;

      bool DelayExpired()
      {
         Time now = GetTime();
         if(now - reminderWindow.lastTime > reminderWindow.delay)
         {
            reminderWindow.state = normal;
            reminderWindow.Activate();
            reminderWindow.timer.Stop();
         }
         return true;
      }
   };
}

ReminderWindow reminderWindow { };

class ReminderApp : GuiApplication
{
   //skin = "Acovel";
}

define app = ((ReminderApp)__thisModule);

static void struscpy(char * d, char * s)
{
   int j, k;
   j = k = 0;
   while(s[j])
   {
      switch(s[j])
      {
         case '\\':
            switch(s[++j])
            {
               case 'n':
                  d[k] = '\n';
                  break;
               case 't':
                  d[k] = '\t';
                  break;
               case 'a':
                  d[k] = '\a';
                  break;
               case 'b':
                  d[k] = '\b';
                  break;
               case 'f':
                  d[k] = '\f';
                  break;
               case 'r':
                  d[k] = '\r';
                  break;
               case 'v':
                  d[k] = '\v';
                  break;
               case '\\':
                  d[k] = '\\';
                  break;
               case '\"':
                  d[k] = '\"';
                  break;
               default:
                  d[k] = '\\';
                  d[++k] = s[j];
            }
            break;
         default:
            d[k] = s[j];
      }
      ++j;
      ++k;
   }
   d[k] = s[j];
}

