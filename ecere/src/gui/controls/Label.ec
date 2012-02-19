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
         Size size;
         if(window)
         {
            stopwatching(window, text);
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
               text { SetInitSize(initSize); }
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
         stopwatching(window, text);
         delete window;
      }
   }

   ~Label()
   {
      if(window)
      {
         stopwatching(window, text);
         delete window;
      }
   }

   bool OnResizing(int *w, int *h)
   {
      if(!*w || !*h)
      {
         Window labeledWindow = text ? this : window;
         char * string = (labeledWindow && labeledWindow.text) ? labeledWindow.text : " ";

         int width = 0, height = 0;

         display.FontExtent(fontObject, string, strlen(string), &width, &height);
         if(labeledWindow && labeledWindow.text)
            *w = Max(width, *w);
         else
            *w = Max(width, 80);
         *h = Max(height, *h);
      }
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(window && window.visible && window.created)
         window.Activate();
      return isGroupBox;
   }

   void OnRedraw(Surface surface)
   {
      Window labeledWindow = text ? this : window;
      int offset = 0;

      if(isGroupBox)
      {
         surface.Bevel(true,  1,7, clientSize.w - 2, clientSize.h - 8);
         surface.Bevel(false, 0,6, clientSize.w, clientSize.h - 6);
         if(parent.background)
         {
            surface.TextOpacity(true);
            surface.SetBackground(parent.background);
         }
         offset = 8;
      }
      if(labeledWindow)
         labeledWindow.WriteCaption(surface, offset, 0);
   }

   watch(font) { SetInitSize(initSize); };
   watch(text) { SetInitSize(initSize); };

   Window window;
   bool isGroupBox;
}
