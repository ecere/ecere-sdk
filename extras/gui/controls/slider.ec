public import IMPORT_STATIC "ecere"

class Slider : Window
{
   ScrollDirection direction;
   opacity = 0;
   bool dragging;
   double percent;
   int offset;

   void OnRedraw(Surface surface)
   {
      bool disabled = !isEnabled;
      surface.SetBackground(disabled ? darkGray : foreground);
      surface.SetForeground(disabled ? darkGray : foreground);
      if(direction == horizontal)
      {
         int pos = (int)((clientSize.w-7) * percent + 0.5) + 3;
         surface.Area(0, clientSize.h / 2 - 3, clientSize.w-1, clientSize.h/2 + 3);
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
         surface.Area(clientSize.w / 2 - 3, 0, clientSize.w/2 + 3, clientSize.h-1);
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
