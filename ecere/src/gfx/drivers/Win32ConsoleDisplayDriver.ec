namespace gfx::drivers;

import "instance"

#if defined(__WIN32__)

#define WIN32_LEAN_AND_MEAN
#define Method _Method
#define String _String
#include <windows.h>
#undef String
#undef Method

import "Display"

class CONDisplay : LFBDisplay
{
   CHAR_INFO * charInfo;
};

class Win32ConsoleDisplayDriver : DisplayDriver
{
   class_property(name) = "Win32Console";

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
      CONDisplay conDisplay = display.driverData;

      ((subclass(DisplayDriver))class(LFBDisplayDriver)).DestroyDisplay(display);
      delete conDisplay.charInfo;
      delete conDisplay;
      display.driverData = null;
   }

   void SetPalette(Display display, ColorAlpha * palette, bool colorMatch)
   {

   }

   bool CreateDisplay(Display display)
   {
      bool result = false;
      CONDisplay conDisplay = display.driverData = CONDisplay { };

      if(display)
      {
         if(((subclass(DisplayDriver))class(LFBDisplayDriver)).CreateDisplay(display))
         {

            conDisplay.bitmap.pixelFormat = pixelFormatText;
            result = true;
         }
      }
      return result;
   }

   bool DisplaySize(Display display, int width, int height)
   {
      CONDisplay conDisplay = display.driverData;
      bool result = false;

      delete conDisplay.charInfo;

      if((conDisplay.charInfo = new CHAR_INFO[width/textCellW * height/textCellH]))
      {
         display.width = width;
         display.height = height;

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

   void StartUpdate(Display display)
   {
   }

   void EndUpdate(Display display)
   {
   }

   void Scroll(Display display, Box scroll, int x, int y, Extent dirty)
   {
   }

   void Update(Display display, Box updateBox)
   {
      CONDisplay conDisplay = display.driverData;

      Box * box = updateBox;// ? updateBox : &conDisplay.updateBox;
      COORD size, coord;
      SMALL_RECT rect;

      size.X = (short)(display.width / textCellW);
      size.Y = (short)(display.height / textCellH);
      coord.X = (short)(box->left / textCellW);
      coord.Y = (short)(box->top / textCellH);
      rect.Left = (short)(box->left / textCellW);
      rect.Top = (short)(box->top / textCellH);
      rect.Right = (short)(box->right / textCellW);
      rect.Bottom = (short)(box->bottom / textCellH);

      WriteConsoleOutput(display.window, conDisplay.charInfo,size,coord,&rect);

      //((subclass(DisplayDriver))class(LFBDisplayDriver)).DisplayScreen(display, updateBox);
   }

   void FreeBitmap(DisplaySystem displaySystem, Bitmap bitmap)
   {

   }

   bool MakeDDBitmap(DisplaySystem displaySystem, Bitmap bitmap, bool mipMaps, int cubeMapFace)
   {
      return true;
   }

   bool GetSurface(Display display, Surface surface, int x,int y, Box clip)
   {
      if((surface.driverData = LFBSurface { }))
         return ((subclass(DisplayDriver))class(LFBDisplayDriver)).GetSurface(display, surface, x, y, clip);
      return false;
   }

   bool GetBitmapSurface(DisplaySystem displaySystem, Surface surface, Bitmap bitmap, int x,int y,Box clip)
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

   bool GrabScreen(Display display, Bitmap bitmap, int x, int y, unsigned int w, unsigned int h)
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

   ColorAlpha GetPixel(Display display, Surface surface, int x,int y)
   {
      return 0;
   }

   void PutPixel(Display display, Surface surface, int x,int y)
   {
      CONDisplay conDisplay = display.driverData;
      LFBSurface conSurface = surface.driverData;

      x /= textCellW;
      y /= textCellH;
      if((x<=surface.box.right)&&(y<=surface.box.bottom)&&(x>=surface.box.left)&&(y>=surface.box.top))
      {
         ((uint*)conDisplay.charInfo)[(y+surface.offset.y)*display.width / textCellW+x+surface.offset.x] =
            ((conSurface.background|conSurface.foreground)<<8) | conSurface.drawingChar;
      }
   }

   void DrawLine(Display display, Surface surface, int x1, int y1, int x2, int y2)
   {
      CONDisplay conDisplay = display.driverData;
      LFBSurface conSurface = surface.driverData;

      x1 /= textCellW;
      x2 /= textCellW;
      y1 /= textCellH;
      y2 /= textCellH;
      if(x1 == x2)
      {
         int y;
         CHAR_INFO * lfbPtr;

         if(y1>y2) { int tmp = y2; y2 = y1; y1 = tmp; }

         if((x1>surface.box.right)||(x1<surface.box.left))return;
         if((y1>surface.box.bottom)||(y2<surface.box.top))return;
         if(y1<surface.box.top)y1=surface.box.top;
         if(y2>surface.box.bottom)y2=surface.box.bottom;
         if(y2 < y1) return;

         lfbPtr = conDisplay.charInfo +
            (y1+surface.offset.y)*display.width / textCellW+x1+surface.offset.x;
         for(y = y1; y <= y2; y++)
         {
            if(conSurface.opaqueText)
               lfbPtr->Attributes = (uint16)((conSurface.background | conSurface.foreground) >> 8);
            else
               lfbPtr->Attributes = (uint16)((conSurface.foreground >> 8) | (lfbPtr->Attributes & 0xF0));
            lfbPtr->Char.AsciiChar = conSurface.drawingChar;
            lfbPtr += display.width / textCellW;
         }
      }
      else if(y1 == y2)
      {
         CHAR_INFO * lfbPtr;

         if(x1>x2) { int tmp = x2; x2 = x1; x1 = tmp; }

         if((y1>surface.box.bottom)||(y1<surface.box.top))return;
         if((x1>surface.box.right)||(x2<surface.box.left))return;
         if(x1<surface.box.left)x1=surface.box.left;
         if(x2>surface.box.right)x2=surface.box.right;
         if(x2 < x1) return;

         lfbPtr = conDisplay.charInfo +
            (y1+surface.offset.y)*display.width / textCellW+x1+surface.offset.x;

         if(conSurface.opaqueText)
            FillBytesBy4((DWORD*) lfbPtr,
               ((conSurface.background | conSurface.foreground) << 8) | conSurface.drawingChar,
               x2-x1+1);
         else
         {
            int x;
            for(x=x1;x<=x2; x++, lfbPtr++)
            {
               lfbPtr->Attributes = (uint16)((conSurface.foreground >> 8) | (lfbPtr->Attributes & 0xF0));
               lfbPtr->Char.AsciiChar = conSurface.drawingChar;
            }
         }
      }
   }

   void Rectangle(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {

   }

   void Area(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      CONDisplay conDisplay = display.driverData;
      LFBSurface conSurface = surface.driverData;

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
         CHAR_INFO *lfbPtr = conDisplay.charInfo +
            (y1+surface.offset.y)*display.width / textCellW+x1+surface.offset.x;
         int y;
         for(y=y1;y<=y2; y++)
         {
            FillBytesBy4((DWORD *)lfbPtr,((conSurface.background | conSurface.foreground)<<8)|conSurface.drawingChar,x2-x1+1);
            lfbPtr+=display.width / textCellW;
         }
      }
   }

   void Clear(Display display, Surface surface, ClearType flags)
   {
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

   Font LoadFont(DisplaySystem displaySystem, const char * string, float size, FontFlags flags, float outlineSize, float outlineFade)
   {
      return (void *) bool::true;
   }

   void UnloadFont(DisplaySystem displaySystem, Font font)
   {

   }

   void TextFont(Display display, Surface surface, void * font)
   {
   }

   void TextOpacity(Display display, Surface surface, bool opaque)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).TextOpacity(display, surface, opaque);
   }

   void WriteText(Display display, Surface surface, int x, int y, const char * text, int len, int prevGlyph, int * rPrevGlyph)
   {
      CONDisplay conDisplay = display.driverData;
      LFBSurface conSurface = surface.driverData;
      CHAR_INFO * lfbPtr = conDisplay.charInfo;
      int c;

      x /= textCellW;
      y /= textCellH;

      if(y > surface.box.bottom || y < surface.box.top)
         return;
      lfbPtr += (y+surface.offset.y) * display.width / textCellW + x + surface.offset.x;
      for(c=0; (c<len && x < surface.box.left); c++, x++,lfbPtr++);
      for(; (c<len && x <= surface.box.right); c++, x++,lfbPtr++)
      {
         if(!conSurface.opaqueText)
         {
            lfbPtr->Attributes = (uint16)((conSurface.foreground >> 8) | (lfbPtr->Attributes & 0xF0));
            lfbPtr->Char.AsciiChar = text[c];
         }
         else
         {
            lfbPtr->Attributes = (uint16)((conSurface.background|conSurface.foreground) >> 8);
            lfbPtr->Char.AsciiChar = text[c];
         }
      }
   }

   void FontExtent(DisplaySystem displaySystem, void * font, const char * text, int len, int * width, int * height, int prevGlyph, int * rPrevGlyph, int * adv)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).FontExtent(displaySystem, font, text, len, width, height, prevGlyph, rPrevGlyph, adv);
   }

   void TextExtent(Display display, Surface surface, const char * text, int len, int * width, int * height, int prevGlyph, int * rPrevGlyph, int * adv)
   {
      FontExtent(display.displaySystem, null, text, len, width, height, prevGlyph, rPrevGlyph, adv);
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
}

#endif
