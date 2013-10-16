// CurvyWeb -- By Joey Adams
import "ecere"

class Form1 : Window
{
   text = "Form1 Professional Edition";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 400, 400 };
   anchor = { horz = -19, vert = 44 };

   int webDensity;
   webDensity = 10;

   Slider slider { this, size = { 25, 350 }, position = {375, 25}, direction=vertical, percent=(double)webDensity/200.0;

      bool NotifySlide(Slider slider, double percent)
      {
         webDensity = (int)(percent*200);
         Update(null);
         return true;
      }
   };

   void OnResize(int width, int height)
   {
      slider.position.x = width-25;
      slider.size.h = height-50;
   }

   void OnRedraw(Surface surface)
   {
      int i,w,h,d;
      w = this.clientSize.w-1;
      h = this.clientSize.h-1;
      d = webDensity;
      if (d<=0)
         d = 1;
      for (i=0; i<=d; i++)
         surface.DrawLine(0,i*h/d,i*w/d,h);
   }

   /*void OnRedraw(Surface surface)
   {
      int i,w,h,d;
      w = this.clientSize.w-1;
      h = this.clientSize.h-1;
      d = webDensity;
      if (d<=0)
         d = 1;
      for (i=0; i<=d; i++) {
         surface.DrawLine(i*w/d,0,i*w/d,h);
         surface.DrawLine(0,i*h/d,w,i*h/d);
      }
   }*/
}

//Ar, ye slider be pirated from Acovel Player!

class Gadget : Window
{
   clickThrough = true;
   inactive = true;

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {

      return true;
   }
};

define skinBackground = Color { r = 40, g = 40, b = 40 };
define skinForeground = white;

class Slider : Gadget
{
   ScrollDirection direction;
   opacity = 0;
   bool dragging;
   double percent;
   int offset;

   void OnRedraw(Surface surface)
   {
      if(direction == horizontal)
      {
         int pos = (int)((clientSize.w-7) * percent + 0.5) + 3;
         surface.SetBackground(skinForeground);
         surface.Area(0, clientSize.h / 2 - 3, clientSize.w-1, clientSize.h/2 + 3);
         surface.SetForeground(black);
         surface.Rectangle(1, clientSize.h / 2 - 2, clientSize.w-2, clientSize.h/2 + 2);

         surface.SetBackground(darkGray);
         surface.Area(pos - 3, 0, pos + 3, clientSize.h-1);
         surface.SetForeground(white);
         surface.Rectangle(pos - 3, 0, pos + 3, clientSize.h-1);
         surface.VLine(2, clientSize.h-3, pos);
      }
      else
      {
         int pos = (int)((clientSize.h-7) * (1.0-percent) + 0.5) + 3;
         surface.SetBackground(skinForeground);
         surface.Area(clientSize.w / 2 - 3, 0, clientSize.w/2 + 3, clientSize.h-1);
         surface.SetForeground(black);
         surface.Rectangle(clientSize.w / 2 - 2, 1, clientSize.w/2 + 2, clientSize.h-2);

         surface.SetBackground(darkGray);
         surface.Area(0, pos - 3, clientSize.w-1, pos + 3);
         surface.SetForeground(white);
         surface.Rectangle(0, pos - 3, clientSize.w-1, pos + 3);
         surface.HLine(2, clientSize.w-3, pos);
      }
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      dragging = true;
      Capture();
      OnMouseMove(x, y, mods);
      return true;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      if(dragging)
      {
         if(direction == horizontal)
            percent = ((double)x - offset - 3) / (double)(clientSize.w-7);
         else
            percent = 1.0-((double)y - offset - 3) / (double)(clientSize.h-7);
         // TO FIX: Max(Min didn't work with double
         if(percent < 0) percent = 0;
         else if(percent > 1) percent = 1;
         Update(null);
         NotifySlide(master, this, percent);
      }
      return true;
   }

   void OnMouseCaptureLost()
   {
      OnLeftButtonUp(0,0,0);
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(dragging)
      {
         dragging = false;
         ReleaseCapture();
         NotifySlideUp(master, this, percent);
      }
      return true;
   }

public:
   virtual bool Window::NotifySlide(Slider slider, double percent);
   virtual bool Window::NotifySlideUp(Slider slider, double percent);
   property double percent
   {
      get { return percent; }
      set { if(!dragging) { percent = value; Update(null); } }
   }
   property ScrollDirection direction
   {
      set { direction = value; }
      get { return direction; }
   };
}

Form1 form1 {};
