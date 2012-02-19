namespace gui::controls;

import "Window"

public class ProgressBar : CommonControl
{
   class_property(icon) = "<:ecere>controls/progressBar.png";

   background = activeBorder;
   borderStyle = deep;
 
public:
   property uint progress { property_category $"Data" set { position = value; Update(null); } get { return position; } };
   property uint range { property_category $"Data" set { range = value; Update(null); } get { return range; } };

private:
   uint position, range;

   bool OnResizing(int * w, int * h)
   {
      if(!*w) *w = 80;
      if(!*h) *h = 20;
      return true;
   }

   void OnRedraw(Surface surface)
   {
      if(range)
      {
         int pos = (int)((float)clientSize.w * position / range);
         int w, h;
         char text[10];

         surface.SetBackground(Color { 0, 0, 170 });
         surface.Area(0,0, pos, clientSize.h - 1);
         surface.SetForeground(white);
         sprintf(text, "%d%%", (int)(position * 100.0f / range));
         surface.TextExtent(text, strlen(text), &w, &h);
         surface.WriteText(Max(pos - w, 0), (clientSize.h - h) / 2, text, strlen(text));
      }
   }
}
