namespace gui::controls;

import "Window"

#include <stdarg.h>

define defaultMinInfoWidth = 300;

public class StatusBar : Window
{
   class_property(icon) = "<:ecere>controls/statusBar.png";

   background = formColor;
   nonClient = true;
   inactive = true;
   anchor = Anchor { left = 0, right = 0, bottom = 0 };
   minInfoWidth = defaultMinInfoWidth;

public:
   property int minInfoWidth
   {
      set { minInfoWidth = value; }
      get { return minInfoWidth; }
   }

   void AddField(StatusField field)
   {
      if(this && field)
      {
         field._statusBar = this;
         incref field;
         width += field.width + (guiApp.textMode ? 0 : 6);
         fields.Add(field);
         Update(null);
      }
   }

   void RemoveField(StatusField field)
   {
      if(this && field)
      {
         field._statusBar = null;
         width -= field.width + (guiApp.textMode ? 0 : 6);
         fields.Remove(field);
         delete field;

         Update(null);
      }
   }

   void Clear()
   {
      if(this)
      {
         while(fields.first)
            RemoveField(fields.first);
      }
   }

private:
   StatusBar()
   {
      fields.offset = (uint)(uintptr)&((StatusField)0).prev;
   }

   ~StatusBar()
   {
      Clear();
   }

   FontResource boldFont { font.faceName, font.size, true, window = this };

   bool OnLoadGraphics()
   {
      StatusField field;
      width = 0;
      for(field = fields.first; field; field = field.next)
         width += field.width + (guiApp.textMode ? 0 : 6);
      return true;
   }

   bool OnResizing(int * w, int * h)
   {
      *h = Max(*h, statusBarHeight);
      if(!*w) *w = 80;
      return true;
   }

   void OnRedraw(Surface surface)
   {
      StatusField field;
      int position = Max(clientSize.w, minInfoWidth + width)-1-2;
      Box clip { 2, 2, minInfoWidth, statusBarHeight-1 };
      Window parent = this.parent;

      if(!guiApp.textMode)
         surface.ThinBevel(false, -1,0, clientSize.w+2, clientSize.h+1);

      for(field = fields.first; field; field = field.next)
      {
         int x = position - field.width;

         surface.SetBackground(white);
         if(!guiApp.textMode)
         {
            surface.ThinBevel(true, x - 2, 2, field.width + 4, statusBarHeight-2);
            surface.SetForeground(field.colorSet ? field.color : foreground);
         }
         else
         {
            if(parent.borderStyle == sizable && parent.state == normal)
               surface.SetForeground(field.colorSet ? (field.color == black ? white : field.color) : (foreground == black ? white : foreground));
            else
               surface.SetForeground(field.colorSet ? field.color : foreground);
         }
         if(field.text)
         {
            Box clip { x, 2, x + field.width - 1, statusBarHeight-3 };
            int tw;
            surface.Clip(clip);
            if(field.backColor)
            {
               surface.SetBackground(field.backColor);
               surface.Clear(colorBuffer);
            }
            surface.font = field.bold ? boldFont.font : fontObject;
            surface.TextExtent(field.text, strlen(field.text), &tw, null);
            surface.WriteTextf(x + (field.width - tw) / 2, 2, field.text);
            surface.Clip(null);
         }
         position -= field.width + (guiApp.textMode ? 0 : 6);
      }

      // TESTING THIS HERE!
      clip.right = position;
      surface.Clip(clip);
      if(guiApp.textMode && parent.borderStyle == sizable && parent.state == normal)
         surface.SetForeground(white);
      else
         surface.SetForeground(foreground);

      surface.WriteTextf(2, 2, text);
      surface.Clip(null);
   }

   watch(caption)
   {
      text = property::text;
      Update(null);
   };

   const char * text;
   OldList fields;
   int width;
   int minInfoWidth;
};

public class StatusField
{
public:

   property StatusBar statusBar
   {
      set
      {
         if(this)
         {
            if(_statusBar)
               _statusBar.RemoveField(this);
            if(value)
               value.AddField(this);
            _statusBar = value;
         }
      }
   }
   property Color color
   {
      set
      {
         if(this && (!colorSet || color != value))
         {
            color = value;
            colorSet = true;
            if(_statusBar)
               _statusBar.Update(null);
         }
      }
   }
   property ColorAlpha backColor
   {
      set
      {
         if(this && (!colorSet || backColor != value))
         {
            backColor = value;
            colorSet = true;
            if(_statusBar)
               _statusBar.Update(null);
         }
      }
   }
   property bool bold
   {
      set
      {
         if(this && bold != value)
            bold = value;
      }
   }

   property const char * text
   {
      set
      {
         if(this)
         {
            if(value)
            {
               int len = strlen(value);
               text = renew text char[len + 1];
               CopyBytes(text, value, len + 1);
            }
            else
               delete text;
            if(_statusBar)
               _statusBar.Update(null);
         }
      }
   }

   property int width
   {
      set
      {
         if(this)
         {
            if(_statusBar)
            {
               _statusBar.width += value - width;
               _statusBar.Update(null);
            }
            width = value;
         }
      }
   }

   void SetTextf(const char * format, ...)
   {
      if(this)
      {
         delete text;
         if(format)
         {
            char tempText[MAX_F_STRING];
            va_list args;
            va_start(args, format);
            vsnprintf(tempText, sizeof(tempText), format, args);
            tempText[sizeof(tempText)-1] = 0;
            va_end(args);
            text = CopyString(tempText);
         }
         if(_statusBar)
            _statusBar.Update(null);
      }
   }

private:
   ~StatusField()
   {
      delete text;
   }

   StatusField prev, next;
   char * text;
   int width;
   Color color;
   ColorAlpha backColor;
   StatusBar _statusBar;
   bool colorSet;
   bool bold;
};
