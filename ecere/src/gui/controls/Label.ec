namespace gui::controls;

import "Window"

public class Label : CommonControl
{
   class_property(icon) = "<:ecere>controls/label.png";

   inactive = true;
   clickThrough = true;
   opacity = 0;
   drawBehind = true;

public:
   property Window labeledWindow
   {
      property_category $"Behavior"
      set
      {
         if(window)
         {
            stopwatching(window, caption);
            stopwatching(window, disabled);
            delete window;
         }
         window = value;
         if(value)
            incref value;

         SetInitSize(initSize);
         if(value)
         {
            watch(value)
            {
               caption { SetInitSize(initSize); }
               disabled { Update(null); }
            };
         }
      }

      get { return window; }
   };

   property bool isGroupBox
   {
      property_category $"Appearance"
      set
      {
         isGroupBox = value;
         inactive = !value;
      }
      get { return isGroupBox; }
   };

private:

   void OnDestroy()
   {
      if(window && (window == master || window == parent))
      {
         stopwatching(window, caption);
         stopwatching(window, disabled);
         delete window;
      }
      CommonControl::OnDestroy();
   }

   ~Label()
   {
      if(window)
      {
         stopwatching(window, caption);
         stopwatching(window, disabled);
         delete window;
      }
   }

   bool OnResizing(int *w, int *h)
   {
      if(!*w || !*h)
      {
         Window labeledWindow = text ? this : window;
         const char * string = (labeledWindow && labeledWindow.text) ? labeledWindow.text : " ";

         int width = 0, height = 0;

         display.FontExtent(fontObject, string, strlen(string), &width, &height);
         if(!*w)
         {
            if(labeledWindow && labeledWindow.text)
               *w = Max(width, *w);
            else
               *w = Max(width, 80);
         }
         if(!*h)
            *h = Max(height, *h);
      }
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(window && window.visible && window.created && !window.disabled)
         window.Activate();
      return clickThrough ? Window::OnLeftButtonDown(x, y, mods) : isGroupBox;
   }

   static void Surface::GroupBevel(bool inner, int x, int y, int w, int h, int tw)
   {
      ColorAlpha foreground = this.foreground;

      SetForeground(inner ? Color { 128,128,128 } : formColor);

      HLine(x,   x+8 - 2, y);       // Top
      HLine(x+8+tw,   x+w - 2, y);    // Top part 2

      VLine(y+1, y+h - 2, x);

      SetForeground(inner ? Color { 64,64,64 } : white);

      HLine(x+1, x+8-3, y+1);       // Top
      HLine(x+8+tw+1, x+w-3, y+1);    // Top part 2
      VLine(y+2, y+h-3, x+1);

      SetForeground(inner ? formColor : Color { 128,128,128 } );
      HLine(x+1, x+w-2, y + h -2);
      VLine(y+1, y+h-3, x + w - 2);

      SetForeground(inner ? white : Color { 64,64,64 });
      HLine(x, x+w-1, y + h - 1);
      VLine(y, y+h-2, x + w - 1);

      SetForeground(foreground);
   }

   void OnRedraw(Surface surface)
   {
      Window labeledWindow = text ? this : window;
      int offset = 0;

      if(isGroupBox)
      {
         if(labeledWindow)
         {
            int tw = 0;
            const char * caption = labeledWindow.caption;
            if(caption)
               surface.TextExtent(caption, strlen(caption), &tw, null);
            GroupBevel(surface, true,  1,7, clientSize.w - 2, clientSize.h - 8, tw);
            GroupBevel(surface, false, 0,6, clientSize.w, clientSize.h - 6, tw);
         }
         else
         {
            surface.Bevel(true,  1,7, clientSize.w - 2, clientSize.h - 8);
            surface.Bevel(false, 0,6, clientSize.w, clientSize.h - 6);
         }
         /*if(parent.background)
         {
            surface.TextOpacity(true);
            surface.SetBackground(parent.background);
         }*/
         offset = 8;
      }
      if(labeledWindow)
         labeledWindow.WriteCaption(surface, offset, 0);
   }

   watch(font) { SetInitSize(initSize); };
   watch(caption) { SetInitSize(initSize); };

   Window window;
   bool isGroupBox;
}
