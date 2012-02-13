namespace gfx::drivers;

import "instance"

#undef __BLOCKS__

#if (defined(__unix__) || defined(__APPLE__)) && !defined(__DOS__)

#define bool CursesBool

#include <curses.h>

#undef bool

import "Display"

static int CC(int color)
{
   int result = 0;
   int foreground = (color & 0x0700) >> 8;
   int background = (color & 0x7000) >> 9;
   int character = color & 0xFF;
   int pair = background|foreground;
   if(pair == 0) result |= A_REVERSE;
   result |= COLOR_PAIR(pair);
   if(character == 127 || character == 132 || character == 133 || character == 136 ||
      character == 141 || character == 142 || character == 143 || character == 155 ||
      character == 156)
      character = 32;
   else if(character < 32) 
   {
      character += 95;
      result |= A_ALTCHARSET;
   }
   if(color == 0x0800)
      result |= A_DIM; 
   else if(color & 0x0800) 
      result |= A_BOLD;
   if(color & 0x8000) 
      result |= A_BLINK;
   result |= character;
   return result;
}

class CursesDisplay : LFBDisplay
{
   Box updateBox;
};

class NCursesDisplayDriver : DisplayDriver
{
   class_property(name) = "NCurses";

   bool CreateDisplaySystem(DisplaySystem displaySystem)
   {
      displaySystem.flags.text = true;
      return true;
   }

   void DestroyDisplaySystem(DisplaySystem displaySystem)
   {

   }

   void DestroyDisplay(Display display)
   {
      CursesDisplay cursesDisplay = display.driverData;
      delete cursesDisplay.bitmap.picture;
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).DestroyDisplay(display);
      delete cursesDisplay;
      display.driverData = null;
   }

   void SetPalette(Display display, ColorAlpha * palette, bool colorMatch)
   {

   }

   bool CreateDisplay(Display display)
   {
      bool result = false;
      CursesDisplay cursesDisplay = display.driverData = CursesDisplay { };

      if(cursesDisplay)
      {
         if(((subclass(DisplayDriver))class(LFBDisplayDriver)).CreateDisplay(display))
         {
            cursesDisplay.bitmap.pixelFormat = pixelFormatText;
            result = true;
         }
      }
      return result;
   }

   bool DisplaySize(Display display, int width, int height)
   {
      bool result = false;
      CursesDisplay cursesDisplay = display.driverData;

      delete cursesDisplay.bitmap.picture;

      cursesDisplay.bitmap.picture = new0 byte[2 * width / textCellW * height / textCellW];
      if(cursesDisplay.bitmap.picture)
      {  
         cursesDisplay.bitmap.stride = width / textCellW;
         cursesDisplay.bitmap.pixelFormat = pixelFormatText;
         cursesDisplay.bitmap.size = width / textCellW * height / textCellH;
         display.width = width;
         display.height = height;

         ((subclass(DisplayDriver))class(LFBDisplayDriver)).DisplaySize(display, width, height);
         result = true;
      }
      return result;
   }

   void DisplayPosition(Display display, int x, int y)
   {

   }

   void RestorePalette(Display display)
   {

   }

   void FreeBitmap(DisplaySystem displaySystem, Bitmap bitmap)
   {

   }

   bool MakeDDBitmap(DisplaySystem displaySystem, Bitmap bitmap, bool mipMaps)
   {
      return true;
   }

   bool GetSurface(Display display, Surface surface, int x, int y, Box clip)
   {
      if((surface.driverData = LFBSurface { }))
         return ((subclass(DisplayDriver))class(LFBDisplayDriver)).GetSurface(display, surface, x, y, clip);
      return false;
   }

   bool GetBitmapSurface(DisplaySystem displaySystem, Surface surface, Bitmap bitmap, int x, int y, Box clip)
   {
      return false;
   }

   void ReleaseSurface(Display display, Surface surface)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).ReleaseSurface(display, surface);
   }

   void Clip(Display display, Surface surface, Box clip)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Clip(display, surface, clip);
   }

   bool GrabScreen(Display display, Bitmap bitmapAddress, int x, int y, unsigned int w, unsigned int h)
   {

      return false;
   }

   void SetForeground(Display display, Surface surface, ColorAlpha color)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).SetForeground(display, surface, color);
   }

   void SetBackground(Display display, Surface surface, ColorAlpha color)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).SetBackground(display, surface, color);
   }

   ColorAlpha GetPixel(Display display, Surface surface,int x,int y)
   {
      return 0;
   }

   void PutPixel(Display display, Surface surface,int x,int y)
   {
      LFBSurface lfbSurface = surface.driverData;
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).PutPixel(display, surface, x, y);
      x /= textCellW;
      y /= textCellH;
      if((x<=surface.box.right)&&(y<=surface.box.bottom)&&(x>=surface.box.left)&&(y>=surface.box.top))
      {

         if(lfbSurface.opaqueText)
         {
            mvaddch((y+surface.offset.y),x+surface.offset.x, 
               CC(lfbSurface.background|lfbSurface.foreground|lfbSurface.drawingChar));
         }
         else
         {
            mvaddch((y+surface.offset.y),x+surface.offset.x, 
              CC(lfbSurface.background|lfbSurface.foreground|lfbSurface.drawingChar));
         }
      }
   }

   void DrawLine(Display display, Surface surface, int x1, int y1, int x2, int y2)
   {
      LFBSurface lfbSurface = surface.driverData;
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).DrawLine(display, surface, x1, y1, x2, y2);
      x1 /= textCellW;
      x2 /= textCellW;
      y1 /= textCellH;
      y2 /= textCellH;
      if(x1 == x2)
      {
         if(y1>y2) { int tmp = y2; y2 = y1; y1 = tmp; }

         if((x1>surface.box.right)||(x1<surface.box.left))return;
         if((y1>surface.box.bottom)||(y2<surface.box.top))return;
         if(y1<surface.box.top)y1=surface.box.top;
         if(y2>surface.box.bottom)y2=surface.box.bottom;
         if(y2 < y1) return;

         if(lfbSurface.opaqueText)
         {
            mvvline(y1+surface.offset.y,x1+surface.offset.x,
               CC(lfbSurface.background | lfbSurface.foreground | lfbSurface.drawingChar),y2-y1+1);
         }
         else
         {
            uint16 * lfbPtr = ((uint16 *)lfbSurface.bitmap.picture) + 
               (y1+surface.offset.y)*lfbSurface.bitmap.stride+x1+surface.offset.x;
            int y;
            for(y=y1;y<=y2; y++, lfbPtr += lfbSurface.bitmap.stride)
            {
               mvaddch(y+surface.offset.y,x1+surface.offset.x,
                  CC((*lfbPtr & 0xF000) | lfbSurface.foreground | lfbSurface.drawingChar));
            }
         }

      }
      else if(y1 == y2)
      {
         if(x1>x2) { int tmp = x2; x2 = x1; x1 = tmp; }

         if((y1>surface.box.bottom)||(y1<surface.box.top)) return;
         if((x1>surface.box.right)||(x2<surface.box.left)) return;
         if(x1<surface.box.left)x1=surface.box.left;
         if(x2>surface.box.right)x2=surface.box.right;
         if(x2 < x1) return;

         if(lfbSurface.opaqueText)
         {
            mvhline(y1+surface.offset.y,x1+surface.offset.x,
               CC(lfbSurface.background | lfbSurface.foreground | lfbSurface.drawingChar),x2-x1+1);
         }
         else
         {
            uint16 * lfbPtr = ((uint16 *)lfbSurface.bitmap.picture) + 
               (y1+surface.offset.y)*display.width / textCellW+x1+surface.offset.x;
            int x;
            for(x=x1;x<=x2; x++, lfbPtr++)
            {
               mvaddch(y1+surface.offset.y,x+surface.offset.x,
                  CC((*lfbPtr & 0xF000) | lfbSurface.foreground | lfbSurface.drawingChar));
            }
         }
      }
   }

   void Rectangle(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {

   }

   void Area(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      LFBSurface lfbSurface = surface.driverData;
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Area(display, surface, x1, y1, x2, y2);

      x1 /= textCellW;
      x2 /= textCellW;
      y1 /= textCellH;
      y2 /= textCellH;

      if(x1>x2) { int tmp = x2; x2 = x1; x1 = tmp; }

      if(x1<surface.box.left)  x1=surface.box.left;
      if(x2>surface.box.right) x2=surface.box.right;
      if(y1<surface.box.top)   y1=surface.box.top;
      if(y2>surface.box.bottom)  y2=surface.box.bottom;

      if(x2>=x1 && y2>=y1)
      {
         int y;
         for(y=y1;y<=y2; y++)
         {
            mvhline(y+surface.offset.y,x1+surface.offset.x,
               CC(lfbSurface.background | lfbSurface.foreground | lfbSurface.drawingChar),x2-x1+1); 
         }
      }
   }

   void Clear(Display display, Surface surface, ClearType flags)
   {
      if(flags != depthBuffer)
         Area(display, surface, 0, 0, surface.width - 1, surface.height - 1);
   }

   bool ConvertBitmap(DisplaySystem displaySystem, Bitmap src, PixelFormat format, ColorAlpha * palette)
   {
      return true;
   }

   bool AllocateBitmap(DisplaySystem displaySystem, Bitmap bitmap, int width, int height, int stride, PixelFormat format, bool allocatePalette)
   {
      return false;
   }

   void Blit(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h)
   {

   }

   void Stretch(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {

   }

   void Filter(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {

   }

   void BlitDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h)
   {

   }

   void StretchDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {

   }

   void FilterDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {

   }

   Font LoadFont(DisplaySystem displaySystem, char * faceName, float size, FontFlags flags)
   {
      return (void *) true;
   }

   void UnloadFont(DisplaySystem displaySystem, Font font)
   {

   }

   void TextFont(Display display, Surface surface, Font font)
   {
   }

   void TextOpacity(Display display, Surface surface, bool opaque)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).TextOpacity(display, surface, opaque);
   }

   void WriteText(Display display, Surface surface, int x, int y, char * text, int len)
   {
      LFBSurface lfbSurface = surface.driverData;
      int c;
      uint16 * lfbPtr;

      ((subclass(DisplayDriver))class(LFBDisplayDriver)).WriteText(display, surface, x, y, text, len);

      x /= textCellW;
      y /= textCellH;

      if(y > surface.box.bottom || y < surface.box.top) 
         return;
      y += surface.offset.y;
      lfbPtr = ((uint16 *)lfbSurface.bitmap.picture) + y * lfbSurface.bitmap.stride + x + surface.offset.x;
      for(c=0; (c<len && x < surface.box.left); c++, x++, lfbPtr++);
      for(; (c<len && x <= surface.box.right); c++, x++, lfbPtr++)
      {
         if(lfbSurface.opaqueText)
            mvaddch(y,x+surface.offset.x,CC(lfbSurface.background|lfbSurface.foreground|text[c]));
         else
            mvaddch(y,x+surface.offset.x,CC( (*lfbPtr & 0xF000)|lfbSurface.foreground|text[c] ));
      }
   }

   void FontExtent(DisplaySystem displaySystem, Font font, char * text, int len, int * width, int * height)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).FontExtent(displaySystem, font, text, len, width, height);
   }

   void TextExtent(Display display, Surface surface, char * text, int len, int * width, int * height)
   {
      FontExtent(display.displaySystem, null, text, len, width, height);
   }

   void DrawingChar(Display display, Surface surface, char character)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).DrawingChar(display, surface, character);
   }


   void LineStipple(Display display, Surface surface, uint stipple)
   {

   }

   bool Lock(Display display)
   {
      return true;
   }

   void Unlock(Display display)
   {
   }

   void StartUpdate(Display display)
   {

   }

   void Scroll(Display display, Box scroll, int x, int y, Extent dirty)
   {

   }

   void Update(Display display, Box updateBox)
   {
      CursesDisplay cursesDisplay = display.driverData;
      curs_set(false);
      leaveok(stdscr, (_Bool)true);
      refresh();
      if(updateBox == null)
      {
         cursesDisplay.updateBox.left = display.width;
         cursesDisplay.updateBox.top = display.height;
         cursesDisplay.updateBox.right = 0;
         cursesDisplay.updateBox.bottom = 0;
      }
      // Log("Here in displayscreen\n");
   }

   void EndUpdate(Display display)
   {

   }
}

#endif
