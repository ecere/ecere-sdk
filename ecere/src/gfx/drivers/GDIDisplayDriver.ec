namespace gfx::drivers;

import "instance"

#if defined(__WIN32__)

#define UNICODE

#undef _WIN32_WINNT
#define _WIN32_WINNT 0x0500
#define WIN32_LEAN_AND_MEAN
#define Method _Method
#define String _String

#include <windows.h>

#undef Method
#undef String

import "Display"
import "Win32Interface"

class GDIDisplay : LFBDisplay
{
   HBITMAP memBitmap;
   HDC memDC;
   HPALETTE palette;
   LOGPALETTE * logPalette;
   Point offset;

   HDC hdc;
   HRGN rgn;
   RGNDATA * data;

   ~GDIDisplay()
   {
      if(memDC) DeleteDC(memDC);
      if(memBitmap) DeleteObject(memBitmap);
      if(palette) DeleteObject(palette);
      delete logPalette;
   }
};
/*
static byte defaultRGBLookup[32768];
static bool rgbLookupSet = false;
*/
class GDISystem : LFBSystem
{
   HDC tmpDC;
   int depth;

   ~GDISystem()
   {
      if(tmpDC)
         ReleaseDC(0, tmpDC);
   }
};

class GDISurface : LFBSurface
{
   HDC hdc;
   HRGN rgn, clippedRgn;
   COLORREF color;
};

class GDIBitmap : struct
{
   HBITMAP memBitmap;
   HDC memDC;
};

static class GDIFont
{
   char faceName[512];
   FontFlags flags;
   float size;

   void * gdiFont;
   Font font;
};

static PixelFormat GetColorFormat(int depth)
{
   if(depth == 8)
      return pixelFormat8;
   else if(depth == 16)
      return pixelFormat555;
   else
      return pixelFormat888;
}

// TOFIX: Quick fix for GrabScreen called with a null Display
static DisplaySystem theDisplaySystem;

class GDIDisplayDriver : DisplayDriver
{
   class_property(name) = "GDI";

   bool CreateDisplaySystem(DisplaySystem displaySystem)
   {
      GDISystem gdiSystem = displaySystem.driverData = GDISystem { };
      HDC hdc = GetDC(GetDesktopWindow());
      if(hdc)
      {
         gdiSystem.tmpDC = GetDC(0);
         gdiSystem.depth = GetDeviceCaps(hdc, BITSPIXEL);
         displaySystem.pixelFormat = GetColorFormat(gdiSystem.depth);
         if(displaySystem.pixelFormat == pixelFormat8)
         {
            int reserved = 10;
            int c;
            ColorAlpha realPalette[256];
            gdiSystem.palette = new ColorAlpha[256];
            GetSystemPaletteEntries(hdc,0,256,(PALETTEENTRY *)realPalette);
            for(c = 0; c<256; c++)
               gdiSystem.palette[c] = { 255, RGB(realPalette[c].color.r, realPalette[c].color.g, realPalette[c].color.b) };
            CopyBytesBy4(gdiSystem.palette + reserved, GetDefaultPalette() + reserved, 256 - 2 * reserved);
            /*
            if(!rgbLookupSet)
               for(c = 0; c<32768; c++)
                  defaultRGBLookup[c] = (byte)BestColorMatch(gdiSystem.palette, 0, 255, (Color555)c);
            rgbLookupSet = true;
            */
            CopyBytes(gdiSystem.rgbLookup, defaultRGBLookup, 32768);
         }
         ReleaseDC(GetDesktopWindow(), hdc);
      }
      if(!theDisplaySystem) theDisplaySystem = displaySystem;
      displaySystem.flags.memBackBuffer = true;
      displaySystem.flags.scrolling = true;
      displaySystem.flags.alpha = true;
      return true;
   }

   void DestroyDisplaySystem(DisplaySystem displaySystem)
   {
      GDISystem gdiSystem = displaySystem.driverData;
      delete gdiSystem.palette;
      delete gdiSystem;
      displaySystem.driverData = null;
      if(theDisplaySystem == displaySystem) theDisplaySystem = null;
   }

   void DestroyDisplay(Display display)
   {
      GDIDisplay gdiDisplay = display.driverData;
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).DestroyDisplay(display);
      delete gdiDisplay;
      display.driverData = null;
   }

   void SetPalette(Display display, ColorAlpha * palette, bool colorMatch)
   {
      GDIDisplay gdiDisplay = display.driverData;
      if(gdiDisplay.bitmap.pixelFormat == pixelFormat8)
      {
         int c;
         ColorAlpha realPalette[256];
         int reserved = (display.flags.fullScreen) ? 1 : 10;
         HDC hdc = GetDC(display.window);
         if(hdc)
         {
            if(reserved > 1)
            {
               GetSystemPaletteEntries(hdc,0,256,(PALETTEENTRY *)realPalette);
               for(c = 0; c<256; c++)
                  realPalette[c] = RGB(realPalette[c].color.r, realPalette[c].color.g, realPalette[c].color.b);

               // *** Reserved Palette Handling ***
               if(!palette)
               {
                  palette = GetDefaultPalette();
                  CopyBytesBy4(realPalette+reserved,palette+reserved,256-2*reserved);
                  CopyBytes(gdiDisplay.rgbLookup, defaultRGBLookup, 32768);
                  for(c=0; c<256; c++)
                  {
                     int i;
                     for(i=0; i<LIGHTSTEPS; i++)
                     {
                        gdiDisplay.lightTable[c][i] = gdiDisplay.rgbLookup[(uint16)Color555 {
                                (byte)(((uint16)realPalette[c].color.r*i) >> LIGHTSHIFT),
                                (byte)(((uint16)realPalette[c].color.g*i) >> LIGHTSHIFT),
                                (byte)(((uint16)realPalette[c].color.b*i) >> LIGHTSHIFT) }];
                     }
                  }
                  CopyBytesBy4(gdiDisplay.bitmap.palette, realPalette, 256);
               }
               else
               {
                  CopyBytesBy4(realPalette+reserved,palette+reserved,256-2*reserved);
                  ((subclass(DisplayDriver))class(LFBDisplayDriver)).SetPalette(display, realPalette, colorMatch);
               }
            }
            else
               ((subclass(DisplayDriver))class(LFBDisplayDriver)).SetPalette(display, palette, colorMatch);
            // *********************************

            gdiDisplay.logPalette->palVersion = 0x300;
            gdiDisplay.logPalette->palNumEntries = 256;

            for(c = 0; c < 256; c++)
            {
               gdiDisplay.logPalette->palPalEntry[c].peFlags = PC_NOCOLLAPSE;
               gdiDisplay.logPalette->palPalEntry[c].peRed   = gdiDisplay.bitmap.palette[c].color.r;
               gdiDisplay.logPalette->palPalEntry[c].peGreen = gdiDisplay.bitmap.palette[c].color.g;
               gdiDisplay.logPalette->palPalEntry[c].peBlue  = gdiDisplay.bitmap.palette[c].color.b;
            }

            if(!gdiDisplay.palette)
               gdiDisplay.palette = CreatePalette(gdiDisplay.logPalette);
            else
               SetPaletteEntries(gdiDisplay.palette, 0, 256, gdiDisplay.logPalette->palPalEntry);

            SelectPalette(hdc, gdiDisplay.palette, FALSE);
            RealizePalette(hdc);

            SetDIBColorTable(gdiDisplay.memDC, 0, 256, (RGBQUAD *)gdiDisplay.bitmap.palette);

            ReleaseDC(display.window, hdc);
         }
      }/*
      else
         (((subclass(DisplayDriver))class(LFBDisplayDriver)).SetPalette(display, palette, colorMatch);*/
   }

   bool CreateDisplay(Display display)
   {
      bool result = false;

      if(display)
      {
         GDIDisplay gdiDisplay = display.driverData = GDIDisplay { };
         if((gdiDisplay.logPalette = (LOGPALETTE *)new0 byte[sizeof(LOGPALETTE)+sizeof(PALETTEENTRY)*256]) &&
            ((subclass(DisplayDriver))class(LFBDisplayDriver)).CreateDisplay(display))
         {
            gdiDisplay.bitmap.pixelFormat = /*display.alphaBlend ? pixelFormat888 : */display.displaySystem.pixelFormat;
            result = true;
         }
      }
      return result;
   }

   bool DisplaySize(Display display, int width, int height)
   {
      GDISystem gdiSystem = display.displaySystem.driverData;
      GDIDisplay gdiDisplay = display.driverData;
      bool result = false;
      HDC hdc = GetDC(display.window);

      display.width = width;
      display.height = height;

      if(!width || !height)
         result = true;
      else if(hdc)
      {
         BITMAPINFO * info;

         if((info = (BITMAPINFO *)new0 byte[sizeof(BITMAPINFOHEADER)+sizeof(RGBQUAD)*256]))
         {
            HBITMAP newBitmap;
            int c;

            if(gdiDisplay.memDC) DeleteDC(gdiDisplay.memDC);
            gdiDisplay.memDC = CreateCompatibleDC(hdc);
            SetMapMode(gdiDisplay.memDC, MM_TEXT);

            gdiDisplay.bitmap.pixelFormat = /*display.alphaBlend ? pixelFormat888 : */display.displaySystem.pixelFormat;

            switch(GetColorDepthShifts(gdiDisplay.bitmap.pixelFormat))
            {
               case 0: gdiDisplay.bitmap.stride = (width + 3) & 0xFFFFFFFC; break;
               case 1: gdiDisplay.bitmap.stride = (width + 1) & 0xFFFFFFFE; break;
               case 2: gdiDisplay.bitmap.stride = width;                    break;
            }
            info->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
            info->bmiHeader.biPlanes = 1;
            info->bmiHeader.biCompression = BI_RGB;
            info->bmiHeader.biBitCount = (uint16)gdiSystem.depth;
            info->bmiHeader.biWidth = gdiDisplay.bitmap.stride;
            info->bmiHeader.biHeight = -height;

            for(c=0; c<256; c++)
            {
               info->bmiColors[c].rgbReserved = 0;
               info->bmiColors[c].rgbRed = gdiDisplay.bitmap.palette[c].color.r;
               info->bmiColors[c].rgbGreen = gdiDisplay.bitmap.palette[c].color.g;
               info->bmiColors[c].rgbBlue = gdiDisplay.bitmap.palette[c].color.b;
            }

            newBitmap = CreateDIBSection(hdc, info, DIB_RGB_COLORS, &gdiDisplay.bitmap.picture, null, 0);
            if(newBitmap)
            {
               SelectObject(gdiDisplay.memDC, newBitmap);
               if(gdiDisplay.memBitmap) DeleteObject(gdiDisplay.memBitmap);
               gdiDisplay.memBitmap = newBitmap;

               //SelectObject(gdiDisplay.memDC,GetStockObject(DC_PEN));
               //SelectObject(gdiDisplay.memDC,GetStockObject(DC_BRUSH));

               result = ((subclass(DisplayDriver))class(LFBDisplayDriver)).DisplaySize(display, width, height);
            }
            else
               Log("Error creating DIB Section\n");
            delete info;
         }
         ReleaseDC(display.window, hdc);
      }
      return result;
   }

   void DisplayPosition(Display display, int x, int y)
   {
      GDIDisplay gdiDisplay = display.driverData;
      gdiDisplay.offset.x = x;
      gdiDisplay.offset.y = y;

   }

   void RestorePalette(Display display)
   {
      GDIDisplay gdiDisplay = display.driverData;
      HDC hdc = GetDC(display.window);
      if(hdc)
      {
         if(gdiDisplay.palette)
         {
            SelectPalette(hdc, gdiDisplay.palette, FALSE);
            RealizePalette(hdc);
         }
         ReleaseDC(display.window,hdc);
      }
   }

   #define MAX_EXPOSED  50

   void StartUpdate(Display display)
   {
      GDIDisplay gdiDisplay = display.driverData;
      if(!display.alphaBlend || display.pixelFormat != pixelFormat888)
      {
         GdiSetBatchLimit(1000);
         gdiDisplay.hdc = GetDC(display.window);
      }
      gdiDisplay.rgn = CreateRectRgn(0,0,0,0);
      //gdiDisplay.data = (RGNDATA *) new0 byte[(sizeof(RGNDATAHEADER) + sizeof(RECT) * MAX_EXPOSED)];
      if(gdiDisplay.palette)
         SelectPalette(gdiDisplay.hdc, gdiDisplay.palette, FALSE);
   }

   void Scroll(Display display, Box scroll, int x, int y, Extent dirty)
   {
      GDIDisplay gdiDisplay = display.driverData;
      int i;
      uint numBytes;
      Box box = scroll;

      box.right += 1;
      box.bottom += 1;

      if(!display.alphaBlend || display.pixelFormat != pixelFormat888)
      {
         // printf("Box: %d, %d, %d, %d\n", box.left, box.top, box.right, box.bottom);
         ScrollDC(gdiDisplay.hdc, -x, -y, (RECT *)&box, (RECT *)&box, gdiDisplay.rgn, null);
      }
      ScrollDC(gdiDisplay.memDC, -x, -y, (RECT *)&box, (RECT *)&box, null, null);

      numBytes = GetRegionData(gdiDisplay.rgn, 0, null);
      gdiDisplay.data = (RGNDATA *) new0 byte[numBytes];
      GetRegionData(gdiDisplay.rgn, numBytes, gdiDisplay.data);
      /*
      // gdiDisplay.data = (RGNDATA *) new0 byte[(sizeof(RGNDATAHEADER) + sizeof(RECT) * MAX_EXPOSED)];
      printf("Number of bytes needed: %d\n", numBytes);
      gdiDisplay.data = (RGNDATA *) new0 byte[numBytes];
      printf("Data: %X\n", gdiDisplay.data);
      printf("Return Value: %d, Count: %d\n", numBytes, gdiDisplay.data->rdh.nCount);
      if(!numBytes)
      {
         int error = GetLastError();
         printf("GetLastError Returned: %d\n", error);
      }
      */

      for(i = 0; i<gdiDisplay.data->rdh.nCount; i++)
      {
         Extent temp { };
         Box box = ((Box *)gdiDisplay.data->Buffer)[i];
         //box.bottom -= 1;
         //box.right -= 1;
         temp.Clear();
         dirty.UnionBox(box, temp);
         temp.Free(null);
      }
      delete gdiDisplay.data;
   }

   void Update(Display display, Box updateBox)
   {
      GDIDisplay gdiDisplay = display.driverData;
      if(display.alphaBlend && display.pixelFormat == pixelFormat888)
      {
         HDC hdc = GetDC(0);
         POINT point = { gdiDisplay.offset.x, gdiDisplay.offset.y};
         POINT srcPoint = { 0, 0 };
         BLENDFUNCTION blend = { 0 };
         SIZE size;
         size.cx = display.width;
         size.cy = display.height;
         blend.BlendOp = AC_SRC_OVER;
         blend.BlendFlags = 0;
         blend.SourceConstantAlpha = 255;
         blend.AlphaFormat = AC_SRC_ALPHA;
         UpdateLayeredWindow(display.window, hdc, &point, &size, gdiDisplay.memDC, &srcPoint, 0, &blend, ULW_ALPHA);
         ReleaseDC(0, hdc);
      }
      else
      {
         BitBlt(gdiDisplay.hdc,
            updateBox.left,updateBox.top,
            updateBox.right - updateBox.left + 1, updateBox.bottom - updateBox.top + 1,
            gdiDisplay.memDC, updateBox.left, updateBox.top, SRCCOPY);
      }
   }

   void EndUpdate(Display display)
   {
      GDIDisplay gdiDisplay = display.driverData;
      DeleteObject(gdiDisplay.rgn);
      if(!display.alphaBlend || display.pixelFormat != pixelFormat888)
         ReleaseDC(display.window,gdiDisplay.hdc);

      // delete gdiDisplay.data;
   }

   void FreeBitmap(DisplaySystem displaySystem, Bitmap bitmap)
   {
      GDIBitmap gdiBitmap = bitmap.driverData;
      if(gdiBitmap)
      {
         if(gdiBitmap.memDC)
         {
            DeleteDC(gdiBitmap.memDC);
            gdiBitmap.memDC = null;
         }
         if(gdiBitmap.memBitmap)
         {
            DeleteObject(gdiBitmap.memBitmap);
            gdiBitmap.memBitmap = null;
         }
         delete gdiBitmap;
         bitmap.driverData = null;
         bitmap.picture = null;
         if(bitmap.palette && bitmap.allocatePalette)
            delete bitmap.palette;
         else
            bitmap.palette = null;
      }
      else
         ((subclass(DisplayDriver))class(LFBDisplayDriver)).FreeBitmap(displaySystem, bitmap);
   }

   bool MakeDDBitmap(DisplaySystem displaySystem, Bitmap bitmap, bool mipMaps)
   {
      /*if(bitmap.alphaBlend)
         return true;
      else*/
         return ((subclass(DisplayDriver))class(LFBDisplayDriver)).MakeDDBitmap(displaySystem, bitmap, mipMaps);
   }

   void ReleaseSurface(Display display, Surface surface)
   {
      GDISurface gdiSurface = surface.driverData;
      //GDIDisplay gdiDisplay = display ? display.driverData : null;

      if(gdiSurface.rgn)
      {
         SelectClipRgn(gdiSurface.hdc,null);
         DeleteObject(gdiSurface.rgn);
         gdiSurface.rgn = null;
      }
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).ReleaseSurface(display, surface);
      // delete gdiSurface; THIS IS ALREDY DONE IN LFB
      surface.driverData = null;
   }

   bool GetBitmapSurface(DisplaySystem displaySystem, Surface surface, Bitmap bitmap, int x, int y, Box clip)
   {
      bool result = false;
      GDIBitmap gdiBitmap = bitmap.driverData;
      GDISurface gdiSurface;

      if((surface.driverData = gdiSurface = GDISurface { }))
      {
         if(((subclass(DisplayDriver))class(LFBDisplayDriver)).GetBitmapSurface(displaySystem, surface, bitmap, x, y, clip))
         {
            gdiSurface.hdc = gdiBitmap.memDC;
            gdiSurface.rgn = CreateRectRgn(x+clip.left,y+clip.top,x+clip.right+1,y+clip.bottom+1);
            //if(gdiSurface.rgn)
            {
               if(gdiSurface.rgn)
                  SelectClipRgn(gdiSurface.hdc,gdiSurface.rgn);
               surface.offset.x = x;
               surface.offset.y = y;
               surface.unclippedBox = surface.box = clip;

               result = true;
            }
         }
      }
      return result;
   }

   bool GetSurface(Display display, Surface surface, int x,int y, Box clip)
   {
      bool result = false;
      GDIDisplay gdiDisplay = display.driverData;
      GDISurface gdiSurface;
      GDISystem gdiSystem = display.displaySystem.driverData;

      if((surface.driverData = gdiSurface = GDISurface { }))
      {
         if(((subclass(DisplayDriver))class(LFBDisplayDriver)).GetSurface(display, surface, x, y, clip))
         {
            gdiSurface.hdc = gdiDisplay.memDC ? gdiDisplay.memDC : gdiSystem.tmpDC;
            gdiSurface.rgn = CreateRectRgn(x+clip.left,y+clip.top,x+clip.right+1,y+clip.bottom+1);
            //if(gdiSurface.rgn)
            {
               if(gdiSurface.rgn)
                  SelectClipRgn(gdiSurface.hdc,gdiSurface.rgn);
               surface.offset.x = x;
               surface.offset.y = y;
               surface.unclippedBox = surface.box = clip;

               SetDCBrushColor(gdiSurface.hdc, RGB(0,0,0));
               SetDCPenColor(gdiSurface.hdc, RGB(255,255,255));

               result = true;
            }
         }
      }
      return result;
   }

   void Clip(Display display, Surface surface, Box clip)
   {
      GDISurface gdiSurface = surface.driverData;
      HRGN clippedRgn = null;
      if(clip != null)
      {
         Box box = clip;

         box.Clip(surface.unclippedBox);

         surface.box = box;

         if(box.right >= box.left && box.bottom >= box.top)
         {
            box.left += surface.offset.x;
            box.top  += surface.offset.y;
            box.right+= surface.offset.x;
            box.bottom += surface.offset.y;
            clippedRgn = CreateRectRgn(box.left, box.top, box.right+1, box.bottom+1);
         }
         else
            clippedRgn = CreateRectRgn(0, 0, 0, 0);

         if(clippedRgn)
            SelectClipRgn(gdiSurface.hdc,clippedRgn);
      }
      else if(gdiSurface.clippedRgn)
      {
         surface.box = surface.unclippedBox;
         SelectClipRgn(gdiSurface.hdc,gdiSurface.rgn);
      }
      if(gdiSurface.clippedRgn)
         DeleteObject(gdiSurface.clippedRgn);
      gdiSurface.clippedRgn = clippedRgn;
   }

   bool GrabScreen(Display display, Bitmap bitmap, int x, int y, unsigned int w, unsigned int h)
   {
      bool result = false;
      if(display)
      {
         //GDIDisplay gdiDisplay = display.driverData;
         result = ((subclass(DisplayDriver))class(LFBDisplayDriver)).GrabScreen(display, bitmap, x,y, w,h);
      }
      else
      {
         PixelFormat format = theDisplaySystem.pixelFormat;
         if(bitmap.Allocate(null, w, h, 0, format, false))
         {
            BITMAPINFO *info = (BITMAPINFO *)new0 byte[sizeof(BITMAPINFO)+sizeof(RGBQUAD)*256];
            HDC hdc = GetDC(HWND_DESKTOP);
            HDC memDC = CreateCompatibleDC(hdc);
            HBITMAP screenBmp = CreateCompatibleBitmap(hdc, GetSystemMetrics(SM_CXSCREEN), GetSystemMetrics(SM_CYSCREEN));
            HBITMAP back = SelectObject(memDC, screenBmp);
            uint16 depth;

            switch(format)
            {
               case pixelFormat8: depth = 8; break;
               case pixelFormat555: depth = 16; break;
               case pixelFormat888:
               default:
                  depth = 32;
                  format = pixelFormat888;
            }
            BitBlt(memDC, 0,0, w,h, hdc,x,y,SRCCOPY);

            info->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
            info->bmiHeader.biPlanes = 1;
            info->bmiHeader.biCompression = BI_RGB;
            info->bmiHeader.biBitCount = depth;
            info->bmiHeader.biWidth = bitmap.width;
            info->bmiHeader.biHeight = -bitmap.height;
            GetDIBits(memDC, screenBmp, 0, bitmap.height, bitmap.picture, info, DIB_RGB_COLORS);
            // TODO: Proper indexed mode support
            if(format == pixelFormat8)
               bitmap.palette = GetDefaultPalette();
            delete info;

            ReleaseDC(HWND_DESKTOP, hdc);
            SelectObject(memDC, back);
            DeleteObject(screenBmp);
            DeleteDC(memDC);

            result = true;
         }
      }
      return result;
   }

   void SetForeground(Display display, Surface surface, ColorAlpha color)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).SetForeground(display, surface, color);
      if(true) //display.alphaBlend)
      {
         GDISurface gdiSurface = surface.driverData;
         //GDIDisplay gdiDisplay = display ? display.driverData : null;
         COLORREF rgb = RGB(color.color.r, color.color.g, color.color.b);

         SetTextColor(gdiSurface.hdc, rgb);
         gdiSurface.color = rgb;
      }
   }

   void SetBackground(Display display, Surface surface, ColorAlpha color)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).SetBackground(display, surface, color);

      if(display && (!display.alphaBlend || display.pixelFormat != pixelFormat888))
      {
         GDISurface gdiSurface = surface.driverData;
         GDIDisplay gdiDisplay = display ? display.driverData : null;
         COLORREF rgb;

         if(gdiSurface.bitmap.pixelFormat == pixelFormat8 && display)
            color = gdiSurface.bitmap.palette[gdiDisplay.rgbLookup[(uint16)(Color555) color]];
         rgb = RGB(color.color.r, color.color.g, color.color.b);

         SetBkColor(gdiSurface.hdc, rgb);
         SetDCBrushColor(gdiSurface.hdc, rgb);
         SetDCPenColor(gdiSurface.hdc, rgb);
      }
   }

   ColorAlpha GetPixel(Display display, Surface surface, int x, int y)
   {
      return 0;
   }

   void PutPixel(Display display, Surface surface, int x, int y)
   {
      //GDIDisplay gdiDisplay = display ? display.driverData : null;
      //GDISurface gdiSurface = surface.driverData;
      // SetPixel(gdiSurface.hdc, x + surface.offset.x, y + surface.offset.y, gdiSurface.color);
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).PutPixel(display, surface, x,y);
   }

   void DrawLine(Display display, Surface surface, int x1, int y1, int x2, int y2)
   {
      //GDIDisplay gdiDisplay = display ? display.driverData : null;
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).DrawLine(display, surface, x1,y1,x2,y2);
   }

   void Rectangle(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      //GDIDisplay gdiDisplay = display ? display.driverData : null;
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Rectangle(display, surface, x1,y1,x2,y2);
   }

   void Area(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      //GDIDisplay gdiDisplay = display ? display.driverData : null;
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Area(display, surface, x1,y1,x2,y2);

      /*
      GDISurface gdiSurface = surface.driverData;
      x1 += surface.offset.x;
      x2 += surface.offset.x;
      y1 += surface.offset.y;
      y2 += surface.offset.y;
      SetBkMode(gdiSurface.hdc, OPAQUE);
      //SetDCBrushColor(gdiSurface.hdc, BGR(eSystem_GetRandom(0,255), eSystem_GetRandom(0,255), eSystem_GetRandom(0,255)));
      PatBlt(gdiSurface.hdc,x1,y1,x2-x1+1,y2-y1+1,PATCOPY);
      SetBkMode(gdiSurface.hdc, surface.textOpacity ? OPAQUE : TRANSPARENT);
      */
   }

   void Clear(Display display, Surface surface, ClearType type)
   {
      /*if(type != depthBuffer)
         Area(display, surface,surface.box.left,surface.box.top,surface.box.right,surface.box.bottom);*/
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Clear(display, surface, type);
   }

   bool ConvertBitmap(DisplaySystem displaySystem, Bitmap src, PixelFormat format, ColorAlpha * palette)
   {
      if(src.driverData)
         return true;
      else
      {
         return ((subclass(DisplayDriver))class(LFBDisplayDriver)).ConvertBitmap(displaySystem, src, format, palette);
      }
   }

   bool AllocateBitmap(DisplaySystem displaySystem, Bitmap bitmap, int width, int height, int stride, PixelFormat format, bool allocatePalette)
   {
      bool result = false;
      HWND hwnd = displaySystem ? displaySystem.window : GetDesktopWindow();
      HDC hdc = GetDC(hwnd);
      if(hdc)
      {
         GDIBitmap gdiBitmap = bitmap.driverData = GDIBitmap { };
         if(gdiBitmap)
         {
            BITMAPINFO *info = (BITMAPINFO *)new0 byte[sizeof(BITMAPINFOHEADER)+sizeof(RGBQUAD)*256];

            if(info)
            {
               int c;
               uint16 depth;

               switch(format)
               {
                  case pixelFormat8: depth = 8; break;
                  case pixelFormat555: depth = 16; break;
                  case pixelFormat888:
                  default:
                     depth = 32;
                     format = pixelFormat888;
               }

               if(!stride)
               {
                  switch(GetColorDepthShifts(format))
                  {
                     case 0: stride = (width + 3) & 0xFFFFFFFC; break;
                     case 1: stride = (width + 1) & 0xFFFFFFFE; break;
                     case 2: stride = width;                    break;
                  }
               }

               bitmap.stride=stride;
               bitmap.width=width;
               bitmap.height=height;
               bitmap.size=(uint)stride*(uint)height;
               bitmap.sizeBytes = bitmap.size << GetColorDepthShifts(format);
               bitmap.pixelFormat = format;
               bitmap.transparent = false;
               bitmap.allocatePalette = allocatePalette;
               if(allocatePalette)
               {
                  bitmap.palette = new0 ColorAlpha[256];
                  if(bitmap.palette)
                     CopyBytesBy4(bitmap.palette, GetDefaultPalette(), 256);
               }
               else
                  bitmap.palette = GetDefaultPalette();

               gdiBitmap.memDC = CreateCompatibleDC(hdc);

               info->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
               info->bmiHeader.biPlanes = 1;
               info->bmiHeader.biCompression = BI_RGB;
               info->bmiHeader.biBitCount = depth;
               info->bmiHeader.biWidth = bitmap.stride;
               info->bmiHeader.biHeight = -height;

               for(c=0; c<256; c++)
               {
                  info->bmiColors[c].rgbReserved = 0;
                  info->bmiColors[c].rgbRed = bitmap.palette[c].color.r;
                  info->bmiColors[c].rgbGreen = bitmap.palette[c].color.g;
                  info->bmiColors[c].rgbBlue = bitmap.palette[c].color.b;
               }

               gdiBitmap.memBitmap = CreateDIBSection(hdc, info, DIB_RGB_COLORS, &bitmap.picture, null, 0);
               if(gdiBitmap.memBitmap)
               {
                  SelectObject(gdiBitmap.memDC, gdiBitmap.memBitmap);
                  SetBkMode(gdiBitmap.memDC, TRANSPARENT);
                  result = true;
               }
               delete info;
            }
            if(!result)
               FreeBitmap(displaySystem, bitmap);
         }
      }
      ReleaseDC(hwnd, hdc);

      return result;
   }

   void Blit(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h)
   {
      //GDIDisplay gdiDisplay = display ? display.driverData : null;
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Blit(display, surface, src, dx, dy, sx, sy, w, h);
   }

   void Stretch(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      //GDIDisplay gdiDisplay = display ? display.driverData : null;
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Stretch(display, surface, src, dx, dy, sx, sy, w, h, sw, sh);
   }

   void Filter(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      //GDIDisplay gdiDisplay = display ? display.driverData : null;
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Filter(display, surface, src, dx, dy, sx, sy, w, h, sw, sh);
   }

   void BlitDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h)
   {
      Blit(display,surface,src,dx,dy,sx,sy,w,h);
   }

   void StretchDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      Stretch(display, surface, src, dx, dy, sx, sy, w, h, sw, sh);
   }

   void FilterDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      Filter(display, surface, src, dx, dy, sx, sy, w, h, sw, sh);
   }

   Font LoadFont(DisplaySystem displaySystem, char * faceName, float size, FontFlags flags)
   {
      if(false) //display.alphaBlend)
         return ((subclass(DisplayDriver))class(LFBDisplayDriver)).LoadFont(displaySystem, faceName, size, flags);
      else
      {
         GDIFont font { };
         HDC hdc = GetDC(null);
         int pixels = GetDeviceCaps(hdc, LOGPIXELSY);
         strcpy(font.faceName, faceName);
         font.size = size;
         font.flags = flags;
         font.gdiFont = CreateFontA(-(int)((float)size * pixels / 72 + 0.5),
            0,0,0, flags.bold ? FW_BOLD : FW_NORMAL, flags.italic ? TRUE : FALSE,
               flags.underline ? TRUE : FALSE, 0, DEFAULT_CHARSET,
                           OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY,
                           DEFAULT_PITCH|FF_DONTCARE, faceName);

         ReleaseDC(null, hdc);
         return (Font)font;
      }
   }

   void UnloadFont(DisplaySystem displaySystem, Font font)
   {
      GDIFont gdiFont = (GDIFont) font;
      if(false) //display.alphaBlend)
         ((subclass(DisplayDriver))class(LFBDisplayDriver)).UnloadFont(displaySystem, font);
      else if(gdiFont)
      {
         if(gdiFont.gdiFont)
            DeleteObject(gdiFont.gdiFont);
         if(gdiFont.font)
            ((subclass(DisplayDriver))class(LFBDisplayDriver)).UnloadFont(displaySystem, gdiFont.font);
         delete gdiFont;
      }
   }

   void TextFont(Display display, Surface surface, Font font)
   {
      GDIFont gdiFont = (GDIFont) font;
      if(display.alphaBlend && display.pixelFormat == pixelFormat888)
      {
         if(!gdiFont.font)
         {
            gdiFont.font = ((subclass(DisplayDriver))class(LFBDisplayDriver)).LoadFont(display.displaySystem,
               gdiFont.faceName, gdiFont.size, gdiFont.flags);
         }
         ((subclass(DisplayDriver))class(LFBDisplayDriver)).TextFont(display, surface, gdiFont.font);
      }
      else
      {
         GDISurface gdiSurface = surface.driverData;
         SelectObject(gdiSurface.hdc, gdiFont.gdiFont);
      }
   }

   void TextOpacity(Display display, Surface surface, bool opaque)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).TextOpacity(display, surface, opaque);
      if(display && (!display.alphaBlend || display.pixelFormat != pixelFormat888))
      {
         GDISurface gdiSurface = surface.driverData;
         SetBkMode(gdiSurface.hdc, opaque ? OPAQUE : TRANSPARENT);
      }
   }

   void WriteText(Display display, Surface surface, int x, int y, char * text, int len)
   {
      if(display.alphaBlend && display.pixelFormat == pixelFormat888)
      {
         GDIFont gdiFont = (GDIFont)surface.font;
         if(!gdiFont.font)
         {
            gdiFont.font = ((subclass(DisplayDriver))class(LFBDisplayDriver)).LoadFont(display.displaySystem,
               gdiFont.faceName, gdiFont.size, gdiFont.flags);
         }
         if(surface.textOpacity)
         {
            int w, h;
            ((subclass(DisplayDriver))class(LFBDisplayDriver)).FontExtent(display.displaySystem, gdiFont.font, text, len, &w, &h);
            Area(display, surface, x, y, x+w-1, y+h-1);
         }
         ((subclass(DisplayDriver))class(LFBDisplayDriver)).WriteText(display, surface, x, y, text, len);
      }
      else
      {
         GDISurface gdiSurface = surface.driverData;
         int wordCount;
         uint16 * u16text = UTF8toUTF16Len(text, len, &wordCount);

         TextOut(gdiSurface.hdc, x + surface.offset.x, y + surface.offset.y, u16text, wordCount);
         if(display.alphaBlend && display.pixelFormat == pixelFormat888)
         {
            int w, h;
            FontExtent(display.displaySystem, surface.font, text, len, &w, &h);
            surface.writeColor = false;
            SetBackground(display, surface, surface.foreground);
            Area(display, surface,x-2,y-2,x+w+1,y+h+1);
            SetBackground(display, surface, surface.background);
            surface.writeColor = true;
         }
         delete u16text;
      }
   }

   void TextExtent(Display display, Surface surface, char * text, int len, int * width, int * height)
   {
      if(display && display.alphaBlend && display.pixelFormat == pixelFormat888)
         ((subclass(DisplayDriver))class(LFBDisplayDriver)).TextExtent(display, surface, text, len, width, height);
      else
      {
         GDISurface gdiSurface = surface.driverData;
         SIZE space, size;
         uint realLen;
         int wordCount;
         uint16 * u16text = UTF8toUTF16Len(text, len, &wordCount);

         for(realLen = 0; realLen<wordCount && u16text[realLen]; realLen++);
         GetTextExtentPoint32A(gdiSurface.hdc, " ", 1, &space);
         GetTextExtentPoint32(gdiSurface.hdc, u16text, realLen, &size);
         delete u16text;

         // UNICODE FIX: proper space computation
         if(width) *width = size.cx + (wordCount - realLen) * space.cx;
         if(height)
         {
            if(realLen)
               *height = size.cy;
            else
               *height = wordCount ? space.cy : 0;
         }
      }
   }

   void FontExtent(DisplaySystem displaySystem, Font font, char * text, int len, int * width, int * height)
   {
      if(false) //display.alphaBlend)
        ((subclass(DisplayDriver))class(LFBDisplayDriver)).FontExtent(displaySystem, font, text, len, width, height);
      else
      {
         GDISystem gdiSystem = displaySystem.driverData;
         if(gdiSystem.tmpDC)
         {
            Surface surface { };
            GDIFont gdiFont = (GDIFont)font;
            GDISurface gdiSurface { };

            surface.driverData = gdiSurface;
            gdiSurface.hdc = gdiSystem.tmpDC;

            SelectObject(gdiSurface.hdc, gdiFont ? gdiFont.gdiFont : null);
            TextExtent(null, surface, text, len, width, height);

            delete surface;
            delete gdiSurface;
         }
         else
         {
            if(width) *width = 0;
            if(height) *height = 0;
         }
      }
   }

   void DrawingChar(Display display, Surface surface, byte character)
   {

   }

   void LineStipple(Display display, Surface surface, uint stipple)
   {
      //GDIDisplay gdiDisplay = display ? display.driverData : null;
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).LineStipple(display, surface, stipple);
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
