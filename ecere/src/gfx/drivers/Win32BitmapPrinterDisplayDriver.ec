namespace gfx::drivers;

import "instance"

#if defined(__WIN32__)

#undef _WIN32_WINNT
#define _WIN32_WINNT 0x0500
#define WIN32_LEAN_AND_MEAN
#define UNICODE
#define Method _Method
#define String _String
#define strlen _strlen

#include <windows.h>
#include <winspool.h>

#undef Method
#undef String
#undef strlen

default wchar_t *wcstok(wchar_t *strToken,const wchar_t *strDelimit);

import "Display"

static char szMessage[]= "Printing ECERE Document...";

static define RESX = 850;
static define RESY = 1100;

class Win32BitmapPrinterDisplay : LFBDisplay
{
   HBITMAP memBitmap;
   HDC memDC;
   HPALETTE palette;
   LOGPALETTE * logPalette;
   Point offset;
   int width, height;
   bool completed;

   HDC hdc;
   HRGN rgn;
   RGNDATA * data;

   ~Win32BitmapPrinterDisplay()
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
class Win32BitmapPrinterSystem : LFBSystem
{
   HDC hdc;
   HDC tmpDC;
   int depth;

   ~Win32BitmapPrinterSystem()
   {
      if(hdc)
         ReleaseDC(0, tmpDC);
   }
};

class Win32BitmapPrinterSurface : LFBSurface
{
   HDC hdc;
   HRGN rgn, clippedRgn;
   COLORREF color, backColor;

   Point offset;
   Box box, unclippedBox;
};

class Win32BitmapPrinterBitmap : struct
{
   HBITMAP memBitmap;
   HDC memDC;
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

class Win32BitmapPrinterDisplayDriver : DisplayDriver
{
   class_property(name) = "Win32BitmapPrinter";
   class_property(printer) = bool::true;

   bool CreateDisplaySystem(DisplaySystem displaySystem)
   {
      displaySystem.driverData = Win32BitmapPrinterSystem { };
      return true;
   }

   void DestroyDisplaySystem(DisplaySystem displaySystem)
   {
      Win32BitmapPrinterSystem gdiSystem = displaySystem.driverData;
      DeleteDC(gdiSystem.tmpDC);
      DeleteDC(gdiSystem.hdc);
      delete gdiSystem;
      displaySystem.driverData = null;
   }

   void DestroyDisplay(Display display)
   {
      Win32BitmapPrinterDisplay gdiDisplay = display.driverData;
      Win32BitmapPrinterSystem gdiSystem = display.displaySystem.driverData;
  		EndPage(gdiDisplay.hdc);
      Escape(gdiDisplay.hdc, ENDDOC, 0, null, null);

      ((subclass(DisplayDriver))class(LFBDisplayDriver)).DestroyDisplay(display);
      delete gdiDisplay;
      display.driverData = null;

      DeleteDC(gdiSystem.tmpDC);
      DeleteDC(gdiSystem.hdc);
   }

   void SetPalette(Display display, ColorAlpha * palette, bool colorMatch)
   {
      Win32BitmapPrinterDisplay gdiDisplay = display.driverData;
      if(gdiDisplay.bitmap.pixelFormat == pixelFormat8)
      {
         int c;
         ColorAlpha realPalette[256];
         int reserved = (display.flags.fullScreen) ? 1 : 10;
         HDC hdc = gdiDisplay.hdc;
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
                  /*
                  if(!rgbLookupSet)
                     for(c = 0; c<32768; c++)
                        defaultRGBLookup[c] = (byte)BestColorMatch(realPalette, 1,255, (Color555)c);
                  rgbLookupSet = true;
                  */
                  CopyBytes(gdiDisplay.rgbLookup, defaultRGBLookup, 32768);
                  for(c=0; c<256; c++)
                  {
                     int i;
                     for(i=0; i<LIGHTSTEPS; i++)
                     {
                        gdiDisplay.lightTable[c][i]=gdiDisplay.rgbLookup[(uint16)Color555 {
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
         Win32BitmapPrinterDisplay gdiDisplay = display.driverData = Win32BitmapPrinterDisplay { };
         if((gdiDisplay.logPalette = (LOGPALETTE *)new0 byte[sizeof(LOGPALETTE)+sizeof(PALETTEENTRY)*256]) &&
            ((subclass(DisplayDriver))class(LFBDisplayDriver)).CreateDisplay(display))
         {
            result = true;
         }
      }
      return result;
   }

   bool DisplaySize(Display display, int width, int height)
   {
      Win32BitmapPrinterSystem gdiSystem = display.displaySystem.driverData;
      Win32BitmapPrinterDisplay gdiDisplay = display.driverData;
      bool result = false;
      HDC hdc = gdiSystem.hdc;

      display.width = width;
      display.height = height;

      if(!width || !height)
         result = true;
      else
      {
         BITMAPINFO * info;
         if(!hdc)
         {
         	uint16 szPrinter[160];
         	uint16 *szDevice, *szDriver, *szOutput;

            GetProfileString(L"windows", L"device", L"...", (LPWSTR)szPrinter, 160);
         	szDevice = wcstok(szPrinter, L",");
         	szDriver = wcstok(null,      L",");
         	szOutput = wcstok(null,      L",");
            if(szDevice && szDriver && szOutput)
            {
               DEVMODE * devMode = null;
               HANDLE hPrinter = null;
               uint size;
               OpenPrinter(szPrinter, &hPrinter, null);
               size = DocumentProperties(null, hPrinter, szDevice, null, null, 0);
               devMode = (DEVMODE *)new0 byte[size];
               DocumentProperties(null, hPrinter, szDevice, devMode, null, DM_OUT_BUFFER);
               devMode->dmOrientation = (width > height) ? DMORIENT_LANDSCAPE : DMORIENT_PORTRAIT;
               DocumentProperties(null, hPrinter, szDevice, devMode, devMode, DM_IN_BUFFER|DM_OUT_BUFFER);

               gdiSystem.hdc = CreateDC(szDriver, szDevice, szOutput, devMode);
               delete devMode;
               ClosePrinter(hPrinter);
               if(gdiSystem.hdc)
               {
                  char curDir[MAX_LOCATION];
                  String docName = printingDocumentName ? printingDocumentName : szMessage;

                  gdiSystem.tmpDC = CreateCompatibleDC(gdiSystem.hdc);
                  gdiSystem.depth = GetDeviceCaps(gdiSystem.hdc, BITSPIXEL);
                  gdiSystem.depth = 32;
                  display.displaySystem.pixelFormat = GetColorFormat(gdiSystem.depth);

               	SetMapMode(gdiSystem.tmpDC, MM_ANISOTROPIC);
                  SetWindowExtEx(gdiSystem.tmpDC, RESX, RESY, null);
                  SetViewportExtEx(gdiSystem.tmpDC, GetDeviceCaps(gdiSystem.hdc, HORZRES), GetDeviceCaps(gdiSystem.hdc, VERTRES), null);

                  gdiDisplay.hdc = gdiSystem.hdc;
                  gdiDisplay.bitmap.pixelFormat = display.displaySystem.pixelFormat;
                  GetWorkingDir(curDir, MAX_LOCATION);
                  if(Escape(gdiDisplay.hdc, STARTDOC, strlen(docName), docName, null ) > 0)
               	{
               		StartPage(gdiSystem.hdc);
                  }
                  ChangeWorkingDir(curDir);
               }
               // display.displaySystem.flags.memBackBuffer = true;
            }
            hdc = gdiSystem.hdc;
         }
      	gdiDisplay.width = GetDeviceCaps(hdc, HORZRES);
      	gdiDisplay.height = GetDeviceCaps(hdc, VERTRES);

         if((info = (BITMAPINFO *)new0 byte[sizeof(BITMAPINFOHEADER)+sizeof(RGBQUAD)*256]))
         {
            HBITMAP newBitmap;
            int c;

            if(gdiDisplay.memDC) DeleteDC(gdiDisplay.memDC);
            gdiDisplay.memDC = CreateCompatibleDC(hdc);

            gdiDisplay.bitmap.pixelFormat = display.displaySystem.pixelFormat;

            switch(GetColorDepthShifts(gdiDisplay.bitmap.pixelFormat))
            {
               case 0: gdiDisplay.bitmap.stride = (gdiDisplay.width + 3) & 0xFFFFFFFC; break;
               case 1: gdiDisplay.bitmap.stride = (gdiDisplay.width + 1) & 0xFFFFFFFE; break;
               case 2: gdiDisplay.bitmap.stride = gdiDisplay.width;                    break;
            }
            info->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
            info->bmiHeader.biPlanes = 1;
            info->bmiHeader.biCompression = BI_RGB;
            info->bmiHeader.biBitCount = (uint16)gdiSystem.depth;
            info->bmiHeader.biWidth = gdiDisplay.bitmap.stride;
            info->bmiHeader.biHeight = -gdiDisplay.height;

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

               SelectObject(gdiDisplay.memDC,GetStockObject(DC_PEN));
               SelectObject(gdiDisplay.memDC,GetStockObject(DC_BRUSH));

               // SetMapMode(gdiDisplay.memDC, MM_TEXT);

            	SetMapMode(gdiDisplay.memDC, MM_ANISOTROPIC);
               SetWindowExtEx(gdiDisplay.memDC, width, height, null);
               SetViewportExtEx(gdiDisplay.memDC, gdiDisplay.width, gdiDisplay.height, null);

            	SetBkMode(gdiDisplay.memDC, OPAQUE);
            	SelectObject(gdiDisplay.memDC, GetStockObject(WHITE_BRUSH));
            	PatBlt(gdiDisplay.memDC,0,0,gdiDisplay.width,gdiDisplay.height,PATCOPY);
               SetBkMode(gdiDisplay.memDC, TRANSPARENT);

               result = ((subclass(DisplayDriver))class(LFBDisplayDriver)).DisplaySize(display, gdiDisplay.width, gdiDisplay.height);
            }
            else
               Log("Error creating DIB Section\n");
            delete info;
         }
      }
      return result;
   }

   void DisplayPosition(Display display, int x, int y)
   {
      Win32BitmapPrinterDisplay gdiDisplay = display.driverData;
      gdiDisplay.offset.x = x;
      gdiDisplay.offset.y = y;

   }

   void RestorePalette(Display display)
   {
      Win32BitmapPrinterDisplay gdiDisplay = display.driverData;
      HDC hdc = gdiDisplay.hdc;
      if(hdc)
      {
         if(gdiDisplay.palette)
         {
            SelectPalette(hdc, gdiDisplay.palette, FALSE);
            RealizePalette(hdc);
         }
      }
   }

   #define MAX_EXPOSED  50

   void StartUpdate(Display display)
   {
      Win32BitmapPrinterDisplay gdiDisplay = display.driverData;
      if(!gdiDisplay.completed)
      {
         GdiSetBatchLimit(1000);

         gdiDisplay.rgn = CreateRectRgn(0,0,0,0);
         gdiDisplay.data = (RGNDATA *) new0 byte[sizeof(RGNDATAHEADER) + sizeof(RECT) * MAX_EXPOSED];
         if(gdiDisplay.palette)
            SelectPalette(gdiDisplay.hdc, gdiDisplay.palette, FALSE);
      }
   }

   void Scroll(Display display, Box scroll, int x, int y, Extent dirty)
   {

   }

   void Update(Display display, Box updateBox)
   {
      Win32BitmapPrinterDisplay gdiDisplay = display.driverData;
      /*
      BitBlt(gdiDisplay.hdc,
         updateBox.left,updateBox.top,
         updateBox.right - updateBox.left + 1, updateBox.bottom - updateBox.top + 1,
         gdiDisplay.memDC, updateBox.left, updateBox.top, SRCCOPY);
      */

      SetMapMode(gdiDisplay.memDC, MM_TEXT);

      BitBlt(gdiDisplay.hdc, 0,0, gdiDisplay.width, gdiDisplay.height, gdiDisplay.memDC, 0, 0, SRCCOPY);

   	SetMapMode(gdiDisplay.memDC, MM_ANISOTROPIC);
      SetWindowExtEx(gdiDisplay.memDC, display.width, display.height, null);
      SetViewportExtEx(gdiDisplay.memDC, gdiDisplay.width, gdiDisplay.height, null);
   }

   void EndUpdate(Display display)
   {
      Win32BitmapPrinterDisplay gdiDisplay = display.driverData;
      if(!gdiDisplay.completed)
      {
         DeleteObject(gdiDisplay.rgn);
         delete gdiDisplay.data;
         gdiDisplay.data = null;
         gdiDisplay.completed = true;
      }
   }

   void NextPage(Display display)
   {
      Win32BitmapPrinterDisplay gdiDisplay = display.driverData;
      gdiDisplay.completed = false;
      EndPage(gdiDisplay.hdc);
      StartPage(gdiDisplay.hdc);
   }

   void FreeBitmap(DisplaySystem displaySystem, Bitmap bitmap)
   {
      // (((subclass(DisplayDriver))class(LFBDisplayDriver)).FreeBitmap(displaySystem, bitmap);
      Win32BitmapPrinterBitmap gdiBitmap = bitmap.driverData;

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
   }

   bool MakeDDBitmap(DisplaySystem displaySystem, Bitmap bitmap, bool mipMaps)
   {
      return ((subclass(DisplayDriver))class(LFBDisplayDriver)).MakeDDBitmap(displaySystem, bitmap, mipMaps);
   }

   void ReleaseSurface(Display display, Surface surface)
   {
      Win32BitmapPrinterSurface gdiSurface = surface.driverData;
      if(gdiSurface)
      {
         if(gdiSurface.rgn)
         {
            SelectClipRgn(gdiSurface.hdc,null);
            DeleteObject(gdiSurface.rgn);
            gdiSurface.rgn = null;
         }
         ((subclass(DisplayDriver))class(LFBDisplayDriver)).ReleaseSurface(display, surface);
         surface.driverData = null;
         delete gdiSurface;
      }
   }

   bool GetBitmapSurface(DisplaySystem displaySystem, Surface surface, Bitmap bitmap, int x, int y, Box clip)
   {
      return false;
   }

   bool GetSurface(Display display, Surface surface, int x,int y, Box clip)
   {
      bool result = false;
      Win32BitmapPrinterDisplay gdiDisplay = display.driverData;
      if(!gdiDisplay.completed)
      {
         Win32BitmapPrinterSurface gdiSurface;
         Win32BitmapPrinterSystem gdiSystem = display.displaySystem.driverData;

         if((surface.driverData = gdiSurface = Win32BitmapPrinterSurface { }))
         {
            if(((subclass(DisplayDriver))class(LFBDisplayDriver)).GetSurface(display, surface, x, y, clip))
            {
               gdiSurface.hdc = gdiDisplay.memDC ? gdiDisplay.memDC : gdiSystem.tmpDC;

               gdiSurface.offset.x = x;
               gdiSurface.offset.y = y;
               gdiSurface.unclippedBox = gdiSurface.box = clip;

               surface.width = gdiDisplay.width - x + 1;
               surface.height = gdiDisplay.height - y + 1;
               surface.offset.x = x * gdiDisplay.width / display.width;
               surface.offset.y = y * gdiDisplay.height / display.height;
               surface.unclippedBox = surface.box =
               {
                  left = clip.left * gdiDisplay.width / display.width,
                  top = clip.top * gdiDisplay.height / display.height,
                  right = (clip.right+1) * gdiDisplay.width / display.width-1,
                  bottom = (clip.bottom+1) * gdiDisplay.height / display.height-1
               };

               gdiSurface.rgn = CreateRectRgn(
                  surface.offset.x + surface.box.left,
                  surface.offset.y + surface.box.top,
                  surface.offset.x + surface.box.right + 1,
                  surface.offset.y + surface.box.bottom + 1);

               // x + clip.left, y+clip.top,x+clip.right+1,y+clip.bottom+1);

               if(gdiSurface.rgn)
                  SelectClipRgn(gdiSurface.hdc,gdiSurface.rgn);

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
      Win32BitmapPrinterDisplay gdiDisplay = display.driverData;
      Win32BitmapPrinterSurface gdiSurface = surface.driverData;
      HRGN clippedRgn = null;
      if(clip != null)
      {
         Box box = clip;

         box.Clip(gdiSurface.unclippedBox);

         gdiSurface.box = box;
         surface.box =
         {
            left = box.left * gdiDisplay.width / display.width,
            top = box.top * gdiDisplay.height / display.height,
            right = (box.right+1) * gdiDisplay.width / display.width-1,
            bottom = (box.bottom+1) * gdiDisplay.height / display.height-1
         };

         if(box.right > box.left && box.bottom > box.top)
         {
            box.left += gdiSurface.offset.x;
            box.top  += gdiSurface.offset.y;
            box.right+= gdiSurface.offset.x;
            box.bottom += gdiSurface.offset.y;

            gdiSurface.rgn = CreateRectRgn(
               surface.offset.x + surface.box.left,
               surface.offset.y + surface.box.top,
               surface.offset.x + surface.box.right + 1,
               surface.offset.y + surface.box.bottom + 1);

            // clippedRgn = CreateRectRgn(box.left, box.top, box.right+1, box.bottom+1);
         }
         else
            clippedRgn = CreateRectRgn(0, 0, 0, 0);

         if(clippedRgn)
            SelectClipRgn(gdiSurface.hdc, clippedRgn);
      }
      else if(gdiSurface.clippedRgn)
      {
         surface.box = surface.unclippedBox;
         gdiSurface.box = gdiSurface.unclippedBox;
         SelectClipRgn(gdiSurface.hdc,gdiSurface.rgn);
      }
      if(gdiSurface.clippedRgn)
         DeleteObject(gdiSurface.clippedRgn);
      gdiSurface.clippedRgn = clippedRgn;
   }

   bool GrabScreen(Display display, Bitmap bitmap, int x, int y, unsigned int w, unsigned int h)
   {
      bool result;
      result = ((subclass(DisplayDriver))class(LFBDisplayDriver)).GrabScreen(display, bitmap, x,y, w,h);
      return result;
   }

   void SetForeground(Display display, Surface surface, ColorAlpha color)
   {
      Win32BitmapPrinterSurface gdiSurface = surface.driverData;
      COLORREF rgb = RGB(color.color.r, color.color.g, color.color.b);
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).SetForeground(display, surface, color);
      SetTextColor(gdiSurface.hdc, rgb);
      gdiSurface.color = rgb;
      SetDCPenColor(gdiSurface.hdc, rgb);
   }

   void SetBackground(Display display, Surface surface, ColorAlpha color)
   {
      Win32BitmapPrinterSurface gdiSurface = surface.driverData;
      Win32BitmapPrinterDisplay gdiDisplay = display ? display.driverData : null;
      COLORREF rgb;
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).SetBackground(display, surface, color);
      if(gdiSurface.bitmap.pixelFormat == pixelFormat8 && display)
         color = gdiSurface.bitmap.palette[gdiDisplay.rgbLookup[(uint16)(Color555) color]];
      rgb = RGB(color.color.r, color.color.g, color.color.b);
      gdiSurface.backColor = rgb;
      SetBkColor(gdiSurface.hdc, rgb);
      SetDCBrushColor(gdiSurface.hdc, rgb);
   }

   ColorAlpha GetPixel(Display display, Surface surface, int x, int y)
   {
      return 0;
   }

   void PutPixel(Display display, Surface surface, int x, int y)
   {
      Win32BitmapPrinterDisplay gdiDisplay = display ? display.driverData : null;
      //Win32BitmapPrinterSurface gdiSurface = surface.driverData;
      Color back = surface.background;
      surface.background = surface.foreground;
      //SetPixel(gdiSurface.hdc, x + gdiSurface.offset.x, y + gdiSurface.offset.y, gdiSurface.color);

      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Area(display, surface,
         (int)((float)x * gdiDisplay.width / display.width),
         (int)((float)y * gdiDisplay.height / display.height),
         (int)((float)(x+1) * gdiDisplay.width / display.width)-1,
         (int)((float)(y+1) * gdiDisplay.height / display.height)-1
         );
      surface.background = back;
   }

   void DrawLine(Display display, Surface surface, int x1, int y1, int x2, int y2)
   {
      //Win32BitmapPrinterSurface gdiSurface = surface.driverData;
      Win32BitmapPrinterDisplay gdiDisplay = display ? display.driverData : null;
      int c = 0;

   /*
      x1 += gdiSurface.offset.x;
      x2 += gdiSurface.offset.x;
      y1 += gdiSurface.offset.y;
      y2 += gdiSurface.offset.y;
*/

      x1 = (int)((float)x1 * gdiDisplay.width / display.width);
      y1 = (int)((float)y1 * gdiDisplay.height / display.height);
      x2 = (int)((float)x2 * gdiDisplay.width / display.width);
      y2 = (int)((float)y2 * gdiDisplay.height / display.height);
      for(c = 0; c <= (float)gdiDisplay.width / display.width; c++)
      {
         /*
         MoveToEx(gdiSurface.hdc, x1, y1, null);
         LineTo(gdiSurface.hdc, x2, y2);
         */

         if(x1 == x2)
         {
            ((subclass(DisplayDriver))class(LFBDisplayDriver)).DrawLine(display, surface, x1,y1,x2,y2+(int)((float)gdiDisplay.width / display.width + 0.5));
            x1++;
            x2++;
         }
         else if(y1 == y2)
         {
            ((subclass(DisplayDriver))class(LFBDisplayDriver)).DrawLine(display, surface, x1,y1,x2+(int)((float)gdiDisplay.width / display.width + 0.5),y2);
            y1++;
            y2++;
         }
         else
         {
            ((subclass(DisplayDriver))class(LFBDisplayDriver)).DrawLine(display, surface, x1,y1,x2+(int)((float)gdiDisplay.width / display.width + 0.5),y2+(int)((float)gdiDisplay.width / display.width + 0.5));
            x1++;
            x2++;
         }
      }
   }

   void Rectangle(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      //Win32BitmapPrinterSurface gdiSurface = surface.driverData;
      Win32BitmapPrinterDisplay gdiDisplay = display ? display.driverData : null;
      /*
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Rectangle(display, surface,
         ((float)x1 * gdiDisplay.width / display.width) + 0.5,
         ((float)y1 * gdiDisplay.height / display.height) + 0.5,
         ((float)x2 * gdiDisplay.width / display.width) + 0.5,
         ((float)y2 * gdiDisplay.height / display.height) + 0.5);
      */
      int c;
      x1 = (int)((float)x1 * gdiDisplay.width / display.width);
      y1 = (int)((float)y1 * gdiDisplay.height / display.height);
      x2 = (int)((float)(x2) * gdiDisplay.width / display.width);
      y2 = (int)((float)(y2) * gdiDisplay.height / display.height);
      for(c = 0; c <= (float)gdiDisplay.width / display.width + 1.5; c++)
      {
         /*
         MoveToEx(gdiSurface.hdc, x1, y1, null);
         LineTo(gdiSurface.hdc, x2, y2);
         */
         ((subclass(DisplayDriver))class(LFBDisplayDriver)).Rectangle(display, surface, x1,y1,x2,y2);
         y1++; y2++;
         x1++; x2++;
      }
      /*
      x1 += gdiSurface.offset.x;
      x2 += gdiSurface.offset.x;
      y1 += gdiSurface.offset.y;
      y2 += gdiSurface.offset.y;
      ::Rectangle(gdiSurface.hdc, x1, y1, x2, y2);
      */
   }

   void Area(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      Win32BitmapPrinterDisplay gdiDisplay = display ? display.driverData : null;
      //Win32BitmapPrinterSurface gdiSurface = surface.driverData;

      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Area(display, surface,
         (int)((float)x1 * gdiDisplay.width / display.width),
         (int)((float)y1 * gdiDisplay.height / display.height),
         (int)(((float)(x2+1) * gdiDisplay.width / display.width) + 0.5),
         (int)(((float)(y2+1) * gdiDisplay.height / display.height) + 0.5));

      /*
      x1 += gdiSurface.offset.x;
      x2 += gdiSurface.offset.x;
      y1 += gdiSurface.offset.y;
      y2 += gdiSurface.offset.y;
      SetBkMode(gdiSurface.hdc, OPAQUE);
      //SetDCBrushColor(gdiSurface.hdc, BGR(eSystem_GetRandom(0,255), eSystem_GetRandom(0,255), eSystem_GetRandom(0,255)));
      PatBlt(gdiSurface.hdc,x1,y1,x2-x1+1,y2-y1+1,PATCOPY);
      SetBkMode(gdiSurface.hdc, surface.textOpacity ? OPAQUE : TRANSPARENT);
      */
   }

   void Clear(Display display, Surface surface, ClearType type)
   {
      Win32BitmapPrinterSurface gdiSurface = surface.driverData;
      if(type != depthBuffer)
         Area(display, surface, gdiSurface.box.left, gdiSurface.box.top, gdiSurface.box.right, gdiSurface.box.bottom);
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
      Filter(display, surface, src, dx, dy, sx, sy, w, h, w, h);
   }

   void Stretch(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      Filter(display, surface, src, dx, dy, sx, sy, w, h, sw, sh);
   }

   void Filter(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      Win32BitmapPrinterDisplay gdiDisplay = display ? display.driverData : null;
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Filter(display, surface, src,
         dx * gdiDisplay.width / display.width,
         dy * gdiDisplay.height / display.height,
         sx, sy,
         (w+1) * gdiDisplay.width / display.width-1,
         (h+1) * gdiDisplay.height / display.height-1,
         sw, sh);
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
      Win32BitmapPrinterSystem gdiSystem = displaySystem.driverData;
      HDC hdc = gdiSystem.hdc;
      int pixels = GetDeviceCaps(hdc, LOGPIXELSY);
      int res = GetDeviceCaps(hdc, VERTRES);
      void * font = CreateFontA(-(int)(((float)size * pixels * RESY / res / 72) + 0.5),
         0,0,0, flags.bold ? FW_BOLD : FW_NORMAL, flags.italic ? TRUE : FALSE,
            flags.underline ? TRUE : FALSE, 0, DEFAULT_CHARSET,
                        OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY,
                        DEFAULT_PITCH|FF_DONTCARE, faceName);
      return font;
   }

   void UnloadFont(DisplaySystem displaySystem, Font font)
   {
      if(font)
         DeleteObject(font);
   }

   void TextFont(Display display, Surface surface, Font font)
   {
      Win32BitmapPrinterSurface gdiSurface = surface.driverData;
      SelectObject(gdiSurface.hdc, font);
   }

   void TextOpacity(Display display, Surface surface, bool opaque)
   {
      Win32BitmapPrinterSurface gdiSurface = surface.driverData;
      SetBkMode(gdiSurface.hdc, opaque ? OPAQUE : TRANSPARENT);
   }

   void WriteText(Display display, Surface surface, int x, int y, char * text, int len)
   {
      Win32BitmapPrinterSurface gdiSurface = surface.driverData;
      int wordCount;
      uint16 * u16text = UTF8toUTF16Len(text, len, &wordCount);
      TextOut(gdiSurface.hdc, x + gdiSurface.offset.x, y + gdiSurface.offset.y, u16text, wordCount);
      delete u16text;
   }

   void TextExtent(Display display, Surface surface, char * text, int len, int * width, int * height)
   {
      Win32BitmapPrinterSurface gdiSurface = surface.driverData;
      SIZE space, size;
      uint realLen;
      int wordCount;
      uint16 * u16text = UTF8toUTF16Len(text, len, &wordCount);

      for(realLen = 0; realLen<wordCount && u16text[realLen]; realLen++);
      GetTextExtentPoint32(gdiSurface.hdc, L" ", 1, &space);
      GetTextExtentPoint32(gdiSurface.hdc, u16text, realLen, &size);
      delete u16text;

      // UNICODE FIX: proper space computation
      if(width) *width = size.cx + (wordCount - realLen) * space.cx;
      if(height)
      {
         if(realLen)
            *height = size.cy;
         else
            *height = len ? space.cy : 0;
      }
   }

   void FontExtent(DisplaySystem displaySystem, void * font, char * text, int len, int * width, int * height)
   {
      Win32BitmapPrinterSystem gdiSystem = displaySystem.driverData;
      if(gdiSystem.tmpDC)
      {
         Surface surface { };
         Win32BitmapPrinterSurface gdiSurface { };

         surface.driverData = gdiSurface;
         gdiSurface.hdc = gdiSystem.tmpDC;

         SelectObject(gdiSurface.hdc, font);
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

   void DrawingChar(Display display, Surface surface, byte character)
   {

   }

   void LineStipple(Display display, Surface surface, uint stipple)
   {
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
