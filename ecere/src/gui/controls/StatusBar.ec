namespace gui::controls;

import "Window"

#include <stdarg.h>

#define MIN_INFO_WIDTH  300

public class StatusBar : Window
{
   class_property(icon) = "<:ecere>controls/statusBar.png";

   background = formColor;
   nonClient = true;
   inactive = true;
   anchor = Anchor { left = 0, right = 0, bottom = 0 };

public:
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
      fields.offset = (uint)&((StatusField)0).prev;
   }

   ~StatusBar()
   {
      Clear();
   }

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
      *h = Max(*h, 18);
      if(!*w) *w = 80;
      return true;
   }

   void OnRedraw(Surface surface)
   {
      StatusField field;
      int position = Max(clientSize.w, MIN_INFO_WIDTH + width)-1-2;
      Box clip { 2, 2, MIN_INFO_WIDTH, 17 };
      Window parent = this.parent;

      if(!guiApp.textMode)
         surface.ThinBevel(false, -1,0, clientSize.w+2, clientSize.h+1);
      
      for(field = fields.first; field; field = field.next)
      {
         int x = position - field.width;

         surface.SetBackground(white);
         if(!guiApp.textMode)
         {
            surface.ThinBevel(true, x - 2, 2, field.width + 4, 16);
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
            Box clip { x, 2, x + field.width - 1, 17 };
            int tw;
            surface.Clip(clip);
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

   char * text;
   OldList fields;
   int width;
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
         if(this)
         {
            color = value;
            colorSet = true;
            if(_statusBar)
               _statusBar.Update(null);
         }
      }
   }

   property char * text
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

   void SetTextf(char * format, ...)
   {
      if(this)
      {
         delete text;
         if(format)
         {
            char tempText[MAX_F_STRING];
            va_list args;
            tempText[sizeof(tempText)-1] = 0;
            va_start(args, format);
            vsnprintf(tempText, sizeof(tempText), format, args);
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
   StatusBar _statusBar;
   bool colorSet;
};
