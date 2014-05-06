import "ecere"

define app = ((GuiApplication)__thisModule);

struct WindowAsteroid {
   Window win;
   int dx, dy;

   property int x {
      get { return win.position.x; }
      set { win.position.x = value; }
   }
   property int y {
      get { return win.position.y; }
      set { win.position.y = value; }
   }
   property int w {
      get { return win.size.w; }
      set { win.size.w = value; }
   }
   property int h {
      get { return win.size.h; }
      set { win.size.h = value; }
   }
};

class WindowAsteroidField : struct {
public:
   Window holder;
   uint count;
   WindowAsteroid *item;

   void Initialize(uint wcount, Window win[]) {
      uint i;
      count = wcount;
      delete item;
      item = new WindowAsteroid[wcount];
      for (i=0; i<wcount; i++) {
         item[i].win = win[i];
         do {
            item[i].dx = GetRandom(-3,3);
            item[i].dy = GetRandom(-3,3);
         } while (!item[i].dx && !item[i].dy);
      }
   }

   void Advance(void) {
      WindowAsteroid *i = item;
      uint d = count;
      for (;d--;i++) {
         i->x += i->dx;
         i->y += i->dy;
         if (i->x<0 && i->dx<0 || (i->x+i->w >= holder.clientSize.w && i->dx>0))
            i->dx = -i->dx;
         if (i->y<0 && i->dy<0 || (i->y+i->h >= holder.clientSize.h && i->dy>0))
            i->dy = -i->dy;
      }
   }

   ~WindowAsteroidField() {
      delete item;
   }
};

class Form2 : Window
{
   text = "Enabled/Disabled";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   tabCycle = true;
   size = { 560, 184 };
   anchor = { horz = -11, vert = -126 };

   WindowAsteroidField astfield {this};
   Timer asteroidTimer {
      this, 0.03, false;
      bool DelayExpired()
      {
         astfield.Advance();
         return true;
      }
   };
   int waste_direction;
   waste_direction = -3;
   Timer wasteCPUTimer {
      this, 0.01, false;
      bool DelayExpired()
      {
         Button button = button5;
         button.position.x += waste_direction;
         if (button.position.x < 0) {
            button.position.x = 0;
            if (waste_direction<0)
               waste_direction = -waste_direction;
         } else if (button.position.x > size.w-button.size.w) {
            button.position.x = size.w-button.size.w;
            if (waste_direction>0)
               waste_direction = -waste_direction;
         }
         return true;
      }
   };

   uint counter0, counter1;
   Button button5
   {
      this, text = "Waste CPU cycles", size = { 135, 21 }, position = { 120, 120 }, isCheckbox = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         wasteCPUTimer.started = button.checked;
         return true;
      }
   };
   Button button6
   {
      this, text = "Asteroid Field", size = { 103, 21 }, position = { 416, 48 }, isCheckbox = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         asteroidTimer.started = button.checked;
         return true;
      }
   };
   Button button4
   {
      this, text = "Enabled", position = { 288, 88 }, isCheckbox = true, checked = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         button2.disabled = !button.checked;
         return true;
      }
   };
   EditBox editBox1 { this, text = "editBox1", contents = "0", position = { 96, 56 }, readOnly = true };
   EditBox editBox2 { this, text = "editBox2", contents = "0", position = { 296, 56 }, readOnly = true };
   Button button3
   {
      this, text = "Enabled", position = { 88, 88 }, isCheckbox = true, checked = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         button1.disabled = !button.checked;
         return true;
      }
   };
   Button button2
   {
      this, text = "Up Me", size = { 119, 21 }, position = { 280, 24 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         counter1++;
         editBox2.SetContents("%u\n", counter1);
         return true;
      }
   };
   Button button1
   {
      this, text = "Up Me", size = { 95, 21 }, position = { 88, 24 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         counter0++;
         editBox1.SetContents("%u\n", counter0);
         return true;
      }
   };

   bool OnCreate(void)
   {
      Window windows[] = {button5, button6, button4, editBox1, editBox2, button3, button2, button1};
      astfield.Initialize(sizeof(windows)/sizeof(*windows), windows);
      app.timerResolution = 100;
      return true;
   }
}

Form2 form2 {};
