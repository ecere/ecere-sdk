#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

/*
static ColorKey defaultKeys[] =
{ 
   { navy, 0.0f },
   { green, 0.1f },
   { yellow, 0.2f },
   { orange, 0.3f },
   { red, 0.4f },
   { purple, 0.5f },
   { ivory, 0.6f },
   { tomato, 0.7f },
   { white, 0.8f },
   { powderBlue, 0.9f },
   { black, 1 }
};
*/
/*
static ColorKey defaultKeys[] =
{ 
   { navy, 0.0f },
   { Color { 146, 237, 237 }, 0.2f },
   { white, 0.3f },
   { lightYellow, 0.5f },
   { Color { 255, 100, 0 }, 0.8f },
   { navy, 0.99f },
   { black, 1 }
};
*/
static ColorKey defaultKeys[] =
{
   { navy, 0.0f },
   { Color { 146, 213, 237 }, 0.198606268f },
   { white, 0.3f },
   { Color { 255, 255, 124 }, 0.444250882f },
   { Color { 255, 100, 0 }, 0.634146333f },
   { navy, 1 }
};

class ArrayColorKeys : OldArray
{
   type = class(ColorKey);
   ColorKey * _;
};

class ColorGradient
{
   ArrayColorKeys keys { };
   float smoothness;
   smoothness = 1;

   ColorGradient()
   {
      keys.size = sizeof(defaultKeys) / sizeof(ColorKey);
      memcpy(keys._, defaultKeys, sizeof(ColorKey) * keys.size);
   }
}

define handleWidth = 15;

static uint CompareKeys(ColorKey a, ColorKey b)
{
   if(a.percent > b.percent) return 1;
   else if(a.percent < b.percent) return -1;
   else return 0;
}

class KeyHandle : Window
{
   size = { handleWidth, 20 };
   borderStyle = deep;

   bool sliding;
   float percent;
   int startPos, startX;

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      GradientDesigner designer = (GradientDesigner)master;
      sliding = true;
      startPos = position.x;
      startX = x;

      Capture();
      
      return true;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      if(sliding)
      {
         GradientDesigner designer = (GradientDesigner)master;
         int c;
         ColorKey * key;

         for(c = 0; c < designer.gradient.keys.size; c++)
         {
            key = &designer.gradient.keys._[c];
            if(key->percent == percent && key->color == background)
               break;
         }

         x -= startX;
         x += startPos;
         x -= designer.preview.position.x;
         x += handleWidth / 2;
         key->percent = (float) x / (float) designer.preview.size.w;

         x = Max(x, 0);
         x = Min(x, designer.preview.size.w);
         percent = (float) x / (float) designer.preview.size.w;

         position.x = (percent * designer.preview.size.w) + designer.preview.position.x - handleWidth/2;
         startPos = position.x;

         qsort(designer.gradient.keys._, designer.gradient.keys.size, sizeof(ColorKey), CompareKeys);

         for(c = 0; c < designer.gradient.keys.size; c++)
         {
            key = &designer.gradient.keys._[c];
            if(key->percent < 0) key->percent = 0;
            else if(key->percent > 1) key->percent = 1;
         }
         
         designer.Update(null);
         designer.NotifyUpdate(designer.master);
      }
      return true;
   }

   bool OnLeftDoubleClick(int x, int y, Modifiers mods)
   {
      ColorPicker colorPicker { master = this };
      colorPicker.color = background;
      incref colorPicker;
      if(colorPicker.Modal() == ok)
      {
         GradientDesigner designer = (GradientDesigner)master;
         int c;
         ColorKey * key;

         for(c = 0; c < designer.gradient.keys.size; c++)
         {
            key = &designer.gradient.keys._[c];
            if(key->percent == percent && key->color == background)
               break;
         }
         background = colorPicker.color;
         key->color = background;
         designer.Update(null);
         designer.NotifyUpdate(designer.master);
      }
      delete colorPicker;
      return false;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      if(key == del)
      {
         GradientDesigner designer = (GradientDesigner)master;
         ColorKey * key;
         int c;

         for(c = 0; c < designer.gradient.keys.size; c++)
         {
            key = &designer.gradient.keys._[c];
            if(key->percent == percent && key->color == background)
               break;
         }
         *key = designer.gradient.keys._[designer.gradient.keys.size-1];
         designer.gradient.keys.size--;
         qsort(designer.gradient.keys._, designer.gradient.keys.size, sizeof(ColorKey), CompareKeys);
         Destroy(0);                  

         designer.Update(null);
         designer.NotifyUpdate(designer.master);
         return false;
      }
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(sliding)
      {
         ReleaseCapture();
         sliding = false;
      }
      return true;
   }

   void OnRedraw(Surface surface)
   {
      if(active)
      {
         if(background.r > 128 || background.g > 128)
            surface.SetForeground(darkGray);
         else
            surface.SetForeground(white);

         surface.Rectangle(0,0,clientSize.w-1, clientSize.h-1);
         surface.Rectangle(1,1,clientSize.w-2, clientSize.h-2);
      }
   }

   bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
   {
      Update(null);
      return true;
   }
}

class GradientDesigner : Window
{
   text = "Gradient Designer";
   borderStyle = fixed;
   size = { 600, 300 };
   tabCycle = true;

   ColorGradient gradient { };
   Window preview
   {
      this, anchor = { left = 10, right = 10, top = 75, bottom = 75 };
      borderStyle = deep;

      void OnRedraw(Surface surface)
      {
         ColorGradient gradient = ((GradientDesigner)master).gradient;
         surface.Gradient(gradient.keys._, gradient.keys.size, gradient.smoothness, horizontal, 0,0, clientSize.w-1, clientSize.h-1);
      }
   };

   void OnRedraw(Surface surface)
   {
      int c;
      
      for(c = 0; c < gradient.keys.size; c++)
      {
         ColorKey * key = gradient.keys._ + c;
         int x = key->percent * preview.size.w + preview.position.x;
         surface.SetForeground(black);
         surface.DrawLine(x - 6, preview.position.y - 10, x, preview.position.y);
         surface.DrawLine(x + 6, preview.position.y - 10, x, preview.position.y);
         surface.SetForeground(gray);
         surface.DrawLine(x - 5, preview.position.y - 10, x, preview.position.y - 1);
         surface.DrawLine(x + 5, preview.position.y - 10, x, preview.position.y - 1);
      }
   }
   ScrollBar smoothness
   {
      this, borderStyle = deep, clientSize = { 124, 18 }, position = { 16, 240 }, range = 100;
      text = "Smoothness"; 

      void NotifyScrolling(ScrollBar scrollBar, ScrollBarAction action, int position, Key key)
      {
         gradient.smoothness = position / 100.0f;
         Update(null);
         NotifyUpdate(master);
      }
   };
   Label lblSmoothness { this, labeledWindow = smoothness, position = { 16, 220 } };

   void UpdateHandles()
   {
      Window window, next;
      int c;

      smoothness.thumbPosition = (int)gradient.smoothness * 100;
      for(window = firstChild; window; window = next)
      {
         next = window.next;
         if(window._class == class(KeyHandle))
         {
            window.Destroy(0);
         }
      }
      for(c = 0; c < gradient.keys.size; c++)
      {
         ColorKey * key = gradient.keys._ + c;
         KeyHandle handle { this, percent = key->percent, position = { key->percent * preview.size.w + preview.position.x - handleWidth/2, preview.position.y - 30 }, background = key->color };
         handle.Create();
      }
   }

   bool OnCreate()
   {
      UpdateHandles();
      return true;
   }
   ColorPicker picker { master = this, autoCreate = false, color = white };

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(x >= preview.position.x && x < preview.position.x + preview.size.w && y < preview.position.y && y > preview.position.y - 30)
      {
         if(picker.Modal() == ok)
         {
            ColorKey * key;
            int c;
            KeyHandle handle;
            
            gradient.keys.size++;
            key = gradient.keys._ + gradient.keys.size - 1;
            x -= preview.position.x;
            x = Max(Min(x, preview.size.w), 0);
            key->percent = (float) x / (float) preview.size.w;
            key->color = picker.color;

            handle = KeyHandle { this, percent = key->percent, position = { key->percent * preview.size.w + preview.position.x - handleWidth/2, preview.position.y - 30 }, background = key->color };
            handle.Create();
            
            qsort(gradient.keys._, gradient.keys.size, sizeof(ColorKey), CompareKeys);

            for(c = 0; c < gradient.keys.size; c++)
            {
               key = &gradient.keys._[c];
               if(key->percent == handle.percent && key->color == handle.background)
                  break;
            }
            key->color = picker.color;
            handle.background = picker.color;
            Update(null);
            NotifyUpdate(master);
         }
      }
      return true;
   }

   virtual void Window::NotifyUpdate();
}
