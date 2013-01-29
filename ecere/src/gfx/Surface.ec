namespace gfx;

import "Display"

#include <stdarg.h>

public struct ColorKey
{
   ColorAlpha color;
   float percent;
};

public enum GradientDirection { vertical, horizontal };

public void PaletteGradient(ColorAlpha * palette, int numColors, ColorKey * keys, int numKeys, float smoothness)
{
   ColorKey * key = keys, * nextKey = keys;
   int keyNum = 0, nextKeyNum = 0;
   float inc = 1.0f/(numColors-1);
   float percent = 0;
   int start;
   ColorAlpha color;
   int c;

   for(c = start = 0; c<numColors; c++)
   {
      ColorAlpha newColor = 0;

      while(nextKey && percent > nextKey->percent)
      {
         key = nextKey; keyNum = nextKeyNum; 
      
         if(keyNum < numKeys - 1) 
         { 
            nextKey = key + 1;
            nextKeyNum = keyNum + 1; 
         }
         else
            break;
      }

      if(nextKey && nextKey->percent != key->percent)
      {
         float scale = ease((percent - key->percent) / (nextKey->percent - key->percent), 
            smoothness, smoothness);
         int cr = key->color.color.r;
         int cg = key->color.color.g;
         int cb = key->color.color.b;
         int nr = nextKey->color.color.r;
         int ng = nextKey->color.color.g;
         int nb = nextKey->color.color.b;
         int r = (int)(cr + (nr - cr) * scale);
         int g = (int)(cg + (ng - cg) * scale);
         int b = (int)(cb + (nb - cb) * scale);

         r = Max(Min(r, 255),0);
         g = Max(Min(g, 255),0);
         b = Max(Min(b, 255),0);

         newColor = Color { (byte)r, (byte)g, (byte)b };
      }
      else if(key)
         newColor = key ? key->color : 0;

      if(c == 0 || newColor != color)
      {
         if(c != 0)
         {
            int i;
            for(i = start; i<c; i++)
               palette[i] = color;

            start = c;
         }
         color = newColor;
      }
      percent += inc;
   }

   {
      int i;
      for(i = start; i<c; i++)
         palette[i] = color;
   }
}

float ease(float t, float a, float b) 
{
   float k;
   float s = a + b;

   if (s == 0.0f) return t;
   if (s > 1.0f) 
   {
      a /= s;
      b /= s;
   }
   k = 1.0f/(2.0f-a-b);
   if (t < a) return (k/a)*t*t;
   if (t < 1.0f - b) return k*(2.0f * t - a);
   t = 1.0f - t;
   return 1.0f - (k/b)*t*t;
}

public enum AlphaWriteMode
{
   dontWrite,
   write,
   blend
};

public class Surface
{
   public int width, height;

   subclass(DisplayDriver) driver;
   DisplaySystem displaySystem;
   Display display;

   public Point offset;
   public Box box, unclippedBox;

   // States
   Font font;
   ColorAlpha foreground, background;
   bool textOpacity;
   public void * driverData;
   AlphaWriteMode alphaWrite;
   bool blend;
   bool writeColor;
   ColorAlpha blitTint;

   blitTint = white;

   blend = true;
   writeColor = true;
   alphaWrite = blend;

   ~Surface()
   {
      if(driver)
         driver.ReleaseSurface(display, this);
   }

public:
   property AlphaWriteMode alphaWrite
   {
      set { alphaWrite = value; }
      get { return alphaWrite; }
   }
   property bool blend
   {
      set { blend = value; }
      get { return blend; }
   }
   property Bitmap bitmap
   {
      get
      {
         return ((LFBSurface)driverData).bitmap;
      }     
   }

   ColorAlpha GetPixel(int x, int y)
   {
      return driver.GetPixel(display, this, x,y);
   }

   void PutPixel(int x, int y)
   {
      driver.PutPixel(display, this, x,y);
   }

   void DrawLine(int x1, int y1, int x2, int y2)
   {
      driver.DrawLine(display, this, x1,y1,x2,y2);
   }

   void VLine(int y1, int y2, int x)
   {
      driver.DrawLine(display, this, x,y1,x,y2);
   }

   void HLine(int x1, int x2, int y)
   {
      driver.DrawLine(display, this, x1,y,x2,y);
   }

   void Rectangle(int x1, int y1, int x2, int y2)
   {
      driver.Rectangle(display, this, x1,y1,x2,y2);
   }

   void Area(int x1, int y1, int x2, int y2)
   {
      driver.Area(display, this, x1,y1,x2,y2);
   }

   void Clear(ClearType type)
   {
      driver.Clear(display, this, type);
   }

   void Blit(Bitmap src, int dx, int dy, int sx, int sy, int w, int h)
   {
      if(src.driver == driver)
         driver.Blit(display, this, src, dx,dy, sx, sy,w,h);
      else if(!src.driver || src.driver == class(LFBDisplayDriver))
         driver.BlitDI(display, this, src, dx,dy, sx, sy,w,h);
   }

   void Stretch(Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      if(src.driver == driver)
         driver.Stretch(display, this, src, dx,dy, sx,sy, w,h, sw, sh);
      else if(!src.driver || src.driver == class(LFBDisplayDriver))
         driver.StretchDI(display, this, src, dx,dy, sx,sy, w,h, sw, sh);
   }

   void Filter(Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      if(src.driver == driver)
         driver.Filter(display, this, src, dx,dy, sx,sy, w,h, sw, sh);
      else if(!src.driver || src.driver == class(LFBDisplayDriver))
         driver.FilterDI(display, this, src, dx,dy, sx,sy, w,h, sw, sh);
   }

   void Tile(Bitmap src, int dx, int dy, int w, int h)
   {
      if(src && src.width && src.height)
      {
         int x,y,sx,sy;
         for(x = 0,sx = dx; x < w; x += src.width, sx += src.width)
            for(y = 0, sy = dy; y < h; y += src.height,sy += src.height)
               Blit(src, sx, sy, 0,0, Min(src.width, w - x), Min(src.height, h - y));
      }
   }

   void HTile(Bitmap src, int dx, int dy, int w, int h)
   {
      if(src && src.width && src.height)
      {
         int x,sx;
         for(x = 0, sx = dx; x < w; x += src.width, sx += src.width)
            Stretch(src, sx, dy, 0, 0, Min(src.width, w - x), h, Min(src.width, w - x), src.height);
      }
   }

   void VTile(Bitmap src, int dx, int dy, int w, int h)
   {
      if(src && src.width && src.height)
      {
         int y,sy;
         for(y = 0, sy = dy; y < h; y += src.height, sy += src.height)
            Stretch(src, dx, sy, 0,0, w, Min(src.height, h - y), src.width, Min(src.height, h - y));
      }
   }

   void FilterHTile(Bitmap src, int dx, int dy, int w, int h)
   {
      if(src && src.width && src.height)
      {
         int x,sx;
         for(x = 0, sx = dx; x < w; x += src.width, sx += src.width)
            Filter(src, sx, dy, 0, 0, Min(src.width, w - x), h, Min(src.width, w - x), src.height);
      }
   }

   void FilterVTile(Bitmap src, int dx, int dy, int w, int h)
   {
      if(src && src.width && src.height)
      {
         int y,sy;
         for(y = 0, sy = dy; y < h; y += src.height, sy += src.height)
            Filter(src, dx, sy, 0,0, w, Min(src.height, h - y), src.width, Min(src.height, h - y));
      }
   }

   void WriteText(int x, int y, char * text, int len)
   {
      if(text)
         driver.WriteText(display, this, x,y, text, len);
   }

   void TextExtent(char * text, int len, int * width, int * height)
   {
      driver.TextExtent(display, this, text, len, width, height);
   }

   void WriteTextf(int x, int y, char * format, ...)
   {
      if(format)
      {
         char text[MAX_F_STRING];
         va_list args;
         va_start(args, format);
         vsprintf(text, format, args);
         driver.WriteText(display, this, x,y, text, strlen(text));
         va_end(args);
      }
   }

   void CenterTextf(int x, int y, char * format, ...)
   {
      if(format)
      {
         char text[MAX_F_STRING];
         va_list args;
         int len;
         int w, h;

         va_start(args, format);
         vsprintf(text, format, args);
         len = strlen(text);

         driver.TextExtent(display, this, text, len, &w, &h);
         driver.WriteText(display, this, x - w/2, y, text, len);
         va_end(args);
      }
   }

   void WriteTextDots(Alignment alignment, int x, int y, int width, char * text, int len)
   {
      int w, h;

      TextExtent(text, len, &w, &h);
      if(w < width)
      {
         if(alignment == right)
            x += width - w - 1;
         else if(alignment == center)
            x += (width - w) / 2;
         WriteText(x, y, text, len);
      }
      else
      {
         int c;
         int dw, dh;
         int current;
         int totalW = 0;
         int nb;
         char ch;

         TextExtent(".", 1, &dw, &dh);
         current = 3 * dw;
         #define UTF8_NUM_BYTES(x)  (__extension__({ byte b = x; (b & 0x80 && b & 0x40) ? ((b & 0x20) ? ((b & 0x10) ? 4 : 3) : 2) : 1; }))
         for(c = 0; (ch = text[c]); c += nb)
         {
            nb = UTF8_NUM_BYTES(ch);
            TextExtent(text+c, nb, &w, &h);
            current += w;
            if(current > width)
               break;
            totalW += w;
         }
         WriteText(x, y, text, c);
         //TextExtent(text, c, &totalW, &h);
         x += totalW;
         WriteText(x, y, "...", 3);
      }
   }

   void WriteTextDotsf(Alignment alignment, int x, int y, int width, char * format, ...)
   {
      if(format)
      {
         char text[MAX_F_STRING];
         va_list args;
         va_start(args, format);
         vsprintf(text, format, args);
         WriteTextDots(alignment, x,y, width, text, strlen(text));
         va_end(args);
      }
   }
   
   void Bevel(bool inner, int x, int y, int w, int h)
   {
      ColorAlpha foreground = this.foreground;

      SetForeground(inner ? Color { 128,128,128 } : formColor);
      HLine(x,   x+w - 2, y);
      VLine(y+1, y+h - 2, x);

      SetForeground(inner ? Color { 64,64,64 } : white);
      HLine(x+1, x+w-3, y+1);
      VLine(y+2, y+h-3, x+1);

      SetForeground(inner ? formColor : Color { 128,128,128 } );
      HLine(x+1, x+w-2, y + h -2);
      VLine(y+1, y+h-3, x + w - 2);

      SetForeground(inner ? white : Color { 64,64,64 });
      HLine(x, x+w-1, y + h - 1);
      VLine(y, y+h-2, x + w - 1);

      SetForeground(foreground);
   }

   void ThinBevel(bool inner, int x, int y, int w, int h)
   {
      SetForeground(inner ? Color { 128,128,128 } : white);
      HLine(x,   x+w - 2, y);
      VLine(y+1, y+h - 2, x);
      SetForeground(inner ? white : Color { 128,128,128 });
      HLine(x, x+w-1, y + h - 1);
      VLine(y, y+h-2, x + w - 1);
   }

   void Gradient(ColorKey * keys, int numKeys, float smoothness, GradientDirection direction, int x1, int y1, int x2, int y2)
   {
      if(x2 >= box.left && x1 <= box.right && y2 >= box.top && y1 <= box.bottom)
      {
         ColorKey * key = keys, * nextKey = keys;
         int keyNum = 0, nextKeyNum = 0;
         int height = (direction == horizontal) ? ((x2 - x1) + 1) : ((y2 - y1) + 1);
         float inc = 1.0f/(height-1);
         float percent = 0;
         int start;
         ColorAlpha color = 0;
         int firstPixel = (direction == horizontal) ? x1 : y1;
         int lastPixel = (direction == horizontal) ? x2 : y2;
         int boxLeft = (direction == horizontal) ? box.left : box.top;
         int boxRight = (direction == horizontal) ? box.right : box.bottom;
         int c;

         // Clip it
         if(boxLeft > firstPixel)
         {
            percent = (boxLeft - firstPixel) * inc;
            firstPixel = boxLeft;            
         }
         if(boxRight < lastPixel)
            lastPixel = boxRight;

         for(c = start = firstPixel; c<=lastPixel; c++)
         {
            ColorAlpha newColor;

            while(nextKey && percent > nextKey->percent)
            {
               key = nextKey; keyNum = nextKeyNum; 
            
               if(keyNum < numKeys - 1) 
               { 
                  nextKey = key + 1;
                  nextKeyNum = keyNum + 1; 
               }
               else
                  break;
            }

            if(nextKey && nextKey->percent != key->percent)
            {
               float scale = ease((percent - key->percent) / (nextKey->percent - key->percent), 
                  smoothness, smoothness);
               int cr = key->color.color.r;
               int cg = key->color.color.g;
               int cb = key->color.color.b;
               int nr = nextKey->color.color.r;
               int ng = nextKey->color.color.g;
               int nb = nextKey->color.color.b;
               int r = (int)(cr + (nr - cr) * scale);
               int g = (int)(cg + (ng - cg) * scale);
               int b = (int)(cb + (nb - cb) * scale);

               r = Max(Min(r, 255),0);
               g = Max(Min(g, 255),0);
               b = Max(Min(b, 255),0);

               newColor = Color { (byte)r, (byte)g, (byte)b };
            }
            else
               newColor = key ? key->color : 0;

            if(c == firstPixel || newColor != color)
            {
               if(c != firstPixel)
               {
                  SetBackground(color);

                  if(direction == horizontal)
                     Area(start,y1,c-1,y2);
                  else
                     Area(x1, start,x2, c-1);
                  start = c;
               }
               color = newColor;
            }
            percent += inc;
         }

         SetBackground(color);
         if(direction == horizontal)
            Area(start,y1,c-1,y2);
         else
            Area(x1, start,x2, c-1);
      }
   }

   // Properties
   property ColorAlpha foreground
   {
      set
      {
         foreground = value;
         driver.SetForeground(display, this, value);
      }
      get { return foreground; }
   }

   property ColorAlpha background
   {
      set
      {
         background = value;
         driver.SetBackground(display, this, value);
      }
      get { return background; }
   }

   property ColorAlpha blitTint
   {
      set
      {
         blitTint = value;
         driver.SetBlitTint(display, this, value);
      }
      get { return blitTint; }
   }

   property uint lineStipple
   {
      set
      {
         driver.LineStipple(display, this, value);
      }
   }

   property Size size
   {
      get { value = { width, height }; }
   }

   /*property Box box
   {
      get
      {
         value = box;
         if(display && display.flags.text)
         {
            value.left *= textCellW;
            value.top *= textCellH;
            value.right *= textCellW;
            value.bottom *= textCellH;
         }
      }
   }*/

   property Display display
   {
      get { return display; }
   }

   property Font font
   {
      set
      {
         if(value && font != value)
         {
            driver.TextFont(display, this, value);
            font = value;
         }
      }

      get { return font; }
   }

   property bool textOpacity
   {
      set
      {
         textOpacity = value;
         driver.TextOpacity(display, this, value);
      }

      get { return textOpacity; }
   }

   property byte drawingChar
   {
      set { driver.DrawingChar(display, this, value); }
   }

   property Box clipping
   {
      set { driver.Clip(display, this, value); }
   }

   // TODO: Make these functions obsolete
   void SetForeground(ColorAlpha value)
   {
      foreground = value;
      driver.SetForeground(display, this, value);
   }

   void SetBackground(ColorAlpha value)
   {
      background = value;
      driver.SetBackground(display, this, value);
   }

   Color GetForeground(void)
   {
      return foreground;
   }

   Color GetBackground(void)
   {
      return background;
   }

   void LineStipple(uint value)
   {
      driver.LineStipple(display, this, value);
   }

   void GetSize(int * w, int * h)
   {
      if(w) *w = width;
      if(h) *h = height;
   }

   void GetBox(Box value)
   {
      value = box;
      if(display.flags.text)
      {
         box.left *= textCellW;
         box.top *= textCellH;
         box.right *= textCellW;
         box.bottom *= textCellH;
      }
   }

   Display GetDisplay(void)
   {
      return display;
   }

   void TextFont(Font value)
   {
      if(value && font != value)
      {
         driver.TextFont(display, this, value);
         font = value;
      }
   }

   Font GetFont(void)
   {
      return font;
   }

   bool GetTextOpacity(void)
   {
      return textOpacity;
   }

   void TextOpacity(bool value)
   {
      textOpacity = value;
      driver.TextOpacity(display, this, value);
   }

   void DrawingChar(unsigned char value)
   {
      driver.DrawingChar(display, this, value);
   }

   void Clip(Box box)
   {
      driver.Clip(display, this, box);
   }
};
