namespace gfx::drivers;

import "instance"

#if defined(__WIN32__)

#undef _WIN32_WINNT
#define _WIN32_WINNT 0x0502
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

//static char szMessage[]= L"Printing ECERE Document...";
static char szMessage[]= "Printing ECERE Document...";

/*
static define RESX = 850;
static define RESY = 1100;
*/

class Win32PrinterDisplay : struct
{
   HPALETTE palette;
   LOGPALETTE * logPalette;
   Point offset;
   int width, height;
   bool completed;

   HDC hdc;
   HRGN rgn;
   RGNDATA * data;

   ~Win32PrinterDisplay()
   {
      //if(memDC) DeleteDC(memDC);
      //if(memBitmap) DeleteObject(memBitmap);
      if(palette) DeleteObject(palette);
      delete logPalette;
   }
};
/*
static byte defaultRGBLookup[32768];
static bool rgbLookupSet = false;
*/
class Win32PrinterSystem : struct
{
   HDC hdc;
   HDC tmpDC, bmpDC;
   int depth;
   int resX, resY;   // Save the display here, support only one display at a time

   ~Win32PrinterSystem()
   {

   }
};

class Win32PrinterSurface : struct
{
   HDC hdc;
   HRGN rgn, clippedRgn;
   COLORREF color, backColor;

   Point offset;
   Box box, unclippedBox;
};

class Win32PrinterBitmap : struct
{
   HBITMAP bmp, mask;
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

static define dpi = 100;
static define inchToMillimeter = 0.039370;
class Win32PrinterDisplayDriver : DisplayDriver
{
   class_property(name) = "Win32Printer";
   class_property(printer) = bool::true;

   bool CreateDisplaySystem(DisplaySystem displaySystem)
   {
      displaySystem.driverData = Win32PrinterSystem { };
      return true; //false;
   }

   void DestroyDisplaySystem(DisplaySystem displaySystem)
   {
      Win32PrinterSystem gdiSystem = displaySystem.driverData;
      DeleteDC(gdiSystem.tmpDC);
      DeleteDC(gdiSystem.bmpDC);
      DeleteDC(gdiSystem.hdc);
      displaySystem.driverData = null;
      delete gdiSystem;
   }

   void DestroyDisplay(Display display)
   {
      Win32PrinterSystem gdiSystem = display.displaySystem.driverData;
      Win32PrinterDisplay gdiDisplay = display.driverData;
      if(gdiDisplay)
      {
     		EndPage(gdiDisplay.hdc);
         Escape(gdiDisplay.hdc, ENDDOC, 0, null, null);
      }

      // ((subclass(DisplayDriver))class(LFBDisplayDriver)).DestroyDisplay(display);
      delete gdiDisplay;
      display.driverData = null;

      if(gdiSystem)
      {
         DeleteDC(gdiSystem.tmpDC);
         DeleteDC(gdiSystem.bmpDC);
         DeleteDC(gdiSystem.hdc);
      }
   }

   void SetPalette(Display display, ColorAlpha * palette, bool colorMatch)
   {
      Win32PrinterDisplay gdiDisplay = display.driverData;
      if(display.displaySystem.pixelFormat == pixelFormat8)
      {
         int c;
         ColorAlpha realPalette[256];
         int reserved = (display.flags.fullScreen) ? 1 : 10;
         HDC hdc = gdiDisplay.hdc;
         if(hdc)
         {
            //if(reserved > 1)
            {
               GetSystemPaletteEntries(hdc,0,256,(PALETTEENTRY *)realPalette);
               for(c = 0; c<256; c++)
                  realPalette[c] = RGB(realPalette[c].color.r, realPalette[c].color.g, realPalette[c].color.b);

               // *** Reserved Palette Handling ***
               /*if(!palette)
               {
                  palette = GetDefaultPalette();
                  CopyBytesBy4(realPalette+reserved,palette+reserved,256-2*reserved);
                  if(!rgbLookupSet)
                     for(c = 0; c<32768; c++)
                        defaultRGBLookup[c] = (byte)BestColorMatch(realPalette, 1,255, (Color555)c);
                  rgbLookupSet = true;
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
               */
               {
                  CopyBytesBy4(realPalette+reserved,palette+reserved,256-2*reserved);
                  // ((subclass(DisplayDriver))class(LFBDisplayDriver)).SetPalette(display, realPalette, colorMatch);
               }
            }
            /*else
               ((subclass(DisplayDriver))class(LFBDisplayDriver)).SetPalette(display, palette, colorMatch);*/
            // *********************************

            gdiDisplay.logPalette->palVersion = 0x300;
            gdiDisplay.logPalette->palNumEntries = 256;

            for(c = 0; c < 256; c++)
            {
               gdiDisplay.logPalette->palPalEntry[c].peFlags = PC_NOCOLLAPSE;
               gdiDisplay.logPalette->palPalEntry[c].peRed   = realPalette[c].color.r;
               gdiDisplay.logPalette->palPalEntry[c].peGreen = realPalette[c].color.g;
               gdiDisplay.logPalette->palPalEntry[c].peBlue  = realPalette[c].color.b;
            }

            if(!gdiDisplay.palette)
               gdiDisplay.palette = CreatePalette(gdiDisplay.logPalette);
            else
               SetPaletteEntries(gdiDisplay.palette, 0, 256, gdiDisplay.logPalette->palPalEntry);

            SelectPalette(hdc, gdiDisplay.palette, FALSE);
            RealizePalette(hdc);

            // SetDIBColorTable(gdiDisplay.hdc, 0, 256, (RGBQUAD *)gdiDisplay.bitmap.palette);
         }
      }
   }

   bool CreateDisplay(Display display)
   {
      bool result = false;

      if(display)
      {
         Win32PrinterDisplay gdiDisplay = display.driverData = Win32PrinterDisplay { };
         if((gdiDisplay.logPalette = (LOGPALETTE *)new0 byte[sizeof(LOGPALETTE)+sizeof(PALETTEENTRY)*256]) /*&&
            ((subclass(DisplayDriver))class(LFBDisplayDriver)).CreateDisplay(display)*/)
         {
            result = true;
         }
      }
      return result;
   }

   bool DisplaySize(Display display, int width, int height)
   {
      Win32PrinterSystem gdiSystem = display.displaySystem.driverData;
      Win32PrinterDisplay gdiDisplay = display.driverData;
      bool result = false;
      HDC hdc = gdiSystem.hdc;

      if(!width || !height)
         result = true;
      else
      {
         if(!hdc)
         {
         	uint16 szPrinter[160];
         	uint16 *szDevice, *szDriver, *szOutput;

            GetProfileString(L"windows", L"device", L"...", szPrinter, 160);
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
               devMode->dmFields |= DM_ORIENTATION | DM_PAPERSIZE;
               devMode->dmOrientation = (width > height) ? DMORIENT_LANDSCAPE : DMORIENT_PORTRAIT;
               if(height == (int)(8.5*dpi) && width == 11*dpi)
                  devMode->dmPaperSize = DMPAPER_LETTER;
               else if(height == (int)(8.5*dpi) && width == 14*dpi)
                  devMode->dmPaperSize = DMPAPER_LEGAL;
               else if(height == 11*dpi && width == 17*dpi)
                  devMode->dmPaperSize = DMPAPER_11X17;
               else
               {
                  short w = (short)((double)width * 10 / dpi / inchToMillimeter);
                  short h = (short)((double)height * 10 / dpi / inchToMillimeter);
                  devMode->dmPaperSize = DMPAPER_USER;
                  devMode->dmFields |= DM_PAPERWIDTH | DM_PAPERLENGTH;
                  devMode->dmPaperLength = w > h ? w : h;
                  devMode->dmPaperWidth = w < h ? w : h;
               }
               DocumentProperties(null, hPrinter, szDevice, devMode, devMode, DM_IN_BUFFER|DM_OUT_BUFFER);
               gdiSystem.hdc = CreateDC(szDriver, szDevice, szOutput, devMode);
               delete devMode;
               ClosePrinter(hPrinter);
               if(gdiSystem.hdc)
               {
                  gdiSystem.tmpDC = CreateCompatibleDC(gdiSystem.hdc);
                  gdiSystem.bmpDC = CreateCompatibleDC(gdiSystem.hdc);
                  gdiSystem.depth = GetDeviceCaps(gdiSystem.hdc, BITSPIXEL);
                  gdiSystem.depth = 32;
                  display.displaySystem.pixelFormat = GetColorFormat(gdiSystem.depth);

                  /*
                  SetMapMode(gdiSystem.hdc, MM_ANISOTROPIC);
                  SetWindowExtEx(gdiSystem.hdc, RESX, RESY, null);
                  SetViewportExtEx(gdiSystem.hdc, GetDeviceCaps(gdiSystem.hdc, HORZRES), GetDeviceCaps(gdiSystem.hdc, VERTRES), null);
                  */
                  SetMapMode(gdiSystem.hdc, MM_TEXT);

                  {
                     const String docName = printingDocumentName ? printingDocumentName : szMessage;
                     char curDir[MAX_LOCATION];
                     GetWorkingDir(curDir, MAX_LOCATION);

                     if(Escape(gdiSystem.hdc, STARTDOC, strlen(docName), docName, null ) > 0)
                  	{
                  		StartPage(gdiSystem.hdc);
                        result = true;
                     }
                     ChangeWorkingDir(curDir);
                  }
               }
               //displaySystem.flags.memBackBuffer = true;
            }
         }
         hdc = gdiSystem.hdc;
         gdiDisplay.hdc = gdiSystem.hdc;
      	gdiDisplay.width = GetDeviceCaps(hdc, HORZRES);
      	gdiDisplay.height = GetDeviceCaps(hdc, VERTRES);

         gdiSystem.resX = display.width = width;
         gdiSystem.resY = display.height = height;

         SelectObject(gdiDisplay.hdc,GetStockObject(DC_PEN));
         SelectObject(gdiDisplay.hdc,GetStockObject(DC_BRUSH));
         SetBkMode(gdiDisplay.hdc, TRANSPARENT);
         result = true;
      }
      return result;
   }

   void DisplayPosition(Display display, int x, int y)
   {
      Win32PrinterDisplay gdiDisplay = display.driverData;
      gdiDisplay.offset.x = x;
      gdiDisplay.offset.y = y;

   }

   void RestorePalette(Display display)
   {
      Win32PrinterDisplay gdiDisplay = display.driverData;
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
      Win32PrinterDisplay gdiDisplay = display.driverData;
      if(gdiDisplay && !gdiDisplay.completed)
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

   }

   void EndUpdate(Display display)
   {
      Win32PrinterDisplay gdiDisplay = display.driverData;
      if(gdiDisplay && !gdiDisplay.completed)
      {
         DeleteObject(gdiDisplay.rgn);
         delete gdiDisplay.data;
         gdiDisplay.data = null;
         gdiDisplay.completed = true;
      }
   }

   void NextPage(Display display)
   {
      Win32PrinterDisplay gdiDisplay = display.driverData;
      gdiDisplay.completed = false;
      EndPage(gdiDisplay.hdc);
      StartPage(gdiDisplay.hdc);
   }

   void FreeBitmap(DisplaySystem displaySystem, Bitmap bitmap)
   {
      // (((subclass(DisplayDriver))class(LFBDisplayDriver)).FreeBitmap(displaySystem, bitmap);
      Win32PrinterBitmap gdiBitmap = bitmap.driverData;

      if(gdiBitmap.memDC)
         DeleteDC(gdiBitmap.memDC);
      if(gdiBitmap.mask)
         DeleteObject(gdiBitmap.mask);
      if(gdiBitmap.bmp)
         DeleteObject(gdiBitmap.bmp);
      delete (Win32PrinterBitmap)gdiBitmap;
      bitmap.driverData = null;
      bitmap.driver = null;
   }

   bool MakeDDBitmap(DisplaySystem displaySystem, Bitmap bitmap, bool mipMaps)
   {
      // return (((subclass(DisplayDriver))class(LFBDisplayDriver)).MakeDDBitmap(displaySystem, bitmap, mipMaps);

      if(bitmap.Convert(null, pixelFormat888, null))
      {
         Win32PrinterSystem gdiSystem = displaySystem.driverData;
         Win32PrinterBitmap gdiBitmap = bitmap.driverData = Win32PrinterBitmap { };
         BITMAPINFO * info = new0 BITMAPINFO[1];
         if(!info) return false;

         info->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
         info->bmiHeader.biPlanes = 1;
         info->bmiHeader.biWidth = bitmap.width;
         info->bmiHeader.biHeight = -bitmap.height;
         info->bmiHeader.biBitCount = 32;
         // If transparent, we need to create a black mask for the little GDI trick
         if(bitmap.transparent)
         {
            Bitmap mask { };
            HGDIOBJ prevDC;//, prevDC2;
            int c;
            mask.Allocate(null, bitmap.width, bitmap.height, 0, pixelFormat888, false);
            for(c = 0; c<bitmap.width * bitmap.height; c++)
               ((Color *)mask.picture)[c] = ((ColorAlpha *)bitmap.picture)[c].a ? 0xFFFFFF : 0;

            gdiBitmap.bmp = CreateDIBitmap(gdiSystem.hdc, (LPBITMAPINFOHEADER)info, CBM_INIT, mask.picture, info, DIB_RGB_COLORS);
            gdiBitmap.mask = CreateBitmap(bitmap.width, bitmap.height, 1, 1, null);
            prevDC = SelectObject(gdiSystem.bmpDC, gdiBitmap.bmp);
            /*prevDC2 = */SelectObject(gdiSystem.tmpDC, gdiBitmap.mask);
            SetBkColor(gdiSystem.bmpDC, 0);
            BitBlt(gdiSystem.tmpDC, 0, 0, bitmap.width, bitmap.height, gdiSystem.bmpDC, 0, 0, SRCCOPY);
            SetBkColor(gdiSystem.bmpDC, 0);
            SetTextColor(gdiSystem.bmpDC, 0xFFFFFF);

            SelectObject(gdiSystem.bmpDC, prevDC);
            DeleteObject(gdiBitmap.bmp);

            gdiBitmap.bmp = CreateDIBitmap(gdiSystem.hdc, (LPBITMAPINFOHEADER)info, CBM_INIT, bitmap.picture, info, DIB_RGB_COLORS);
            prevDC = SelectObject(gdiSystem.bmpDC, gdiBitmap.bmp);

            /*
            SetTextColor(gdiSystem.bmpDC, RGB(255,255,255));
            SetBkColor(gdiSystem.bmpDC, RGB(0,0,0));
            BitBlt(gdiSystem.bmpDC, 0, 0, bitmap.width, bitmap.height, gdiSystem.tmpDC, 0, 0, SRCAND);
            SelectObject(gdiSystem.tmpDC, prevDC2);
            SelectObject(gdiSystem.bmpDC, prevDC);
            SetTextColor(gdiSystem.bmpDC, RGB(0,0,0));
            SetBkColor(gdiSystem.bmpDC, RGB(255,255,255));
            SetBkColor(gdiSystem.tmpDC, RGB(255,255,255));
            */
            delete mask;
         }
         else
         {
            gdiBitmap.bmp = CreateDIBitmap(gdiSystem.hdc, (LPBITMAPINFOHEADER)info, CBM_INIT, bitmap.picture, info, DIB_RGB_COLORS);
         }

         delete bitmap.picture;
         delete info;

         bitmap.driver = ((subclass(DisplayDriver))class(Win32PrinterDisplayDriver));
         return true;
      }
      return false;
   }

   void ReleaseSurface(Display display, Surface surface)
   {
      Win32PrinterSurface gdiSurface = surface.driverData;
      if(gdiSurface)
      {
         if(gdiSurface.rgn)
         {
            SelectClipRgn(gdiSurface.hdc,null);
            DeleteObject(gdiSurface.rgn);
            gdiSurface.rgn = null;
         }
         // ((subclass(DisplayDriver))class(LFBDisplayDriver)).ReleaseSurface(display, surface);
         delete gdiSurface;
         surface.driverData = null;
      }
   }

   bool GetBitmapSurface(DisplaySystem displaySystem, Surface surface, Bitmap bitmap, int x, int y, Box clip)
   {
      return false;
   }

   bool GetSurface(Display display, Surface surface, int x,int y, Box clip)
   {
      bool result = false;
      Win32PrinterDisplay gdiDisplay = display.driverData;
      if(gdiDisplay && !gdiDisplay.completed)
      {
         Win32PrinterSurface gdiSurface;
         Win32PrinterSystem gdiSystem = display.displaySystem.driverData;

         if((surface.driverData = gdiSurface = Win32PrinterSurface { }))
         {
            // if(((subclass(DisplayDriver))class(LFBDisplayDriver)).GetSurface(display, surface, x, y, clip))
            {
               gdiSurface.hdc = gdiDisplay.hdc ? gdiDisplay.hdc : gdiSystem.tmpDC;

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

               SetBkColor(gdiSystem.hdc, RGB(0,0,0));

               result = true;
            }
         }
      }
      return result;
   }

   void Clip(Display display, Surface surface, Box clip)
   {
      Win32PrinterDisplay gdiDisplay = display.driverData;
      Win32PrinterSurface gdiSurface = surface.driverData;
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
      bool result = false;
      // result = ((subclass(DisplayDriver))class(LFBDisplayDriver)).GrabScreen(display, bitmap, x,y, w,h);
      return result;
   }

   void SetForeground(Display display, Surface surface, ColorAlpha color)
   {
      Win32PrinterSurface gdiSurface = surface.driverData;
      COLORREF rgb = RGB(color.color.r, color.color.g, color.color.b);
      // ((subclass(DisplayDriver))class(LFBDisplayDriver)).SetForeground(display, surface, color);
      SetTextColor(gdiSurface.hdc, rgb);
      gdiSurface.color = rgb;
      SetDCPenColor(gdiSurface.hdc, rgb);
   }

   void SetBackground(Display display, Surface surface, ColorAlpha color)
   {
      Win32PrinterSurface gdiSurface = surface.driverData;
      COLORREF rgb;
      /*
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).SetBackground(display, surface, color);
      if(gdiSurface.bitmap.pixelFormat == pixelFormat8 && display)
         color = gdiSurface.bitmap.palette[gdiDisplay.rgbLookup[(uint16)(Color555) color]];
      */
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
      Win32PrinterDisplay gdiDisplay = display ? display.driverData : null;
      Win32PrinterSurface gdiSurface = surface.driverData;

      SetBkMode(gdiSurface.hdc, OPAQUE);
      SetBkColor(gdiSurface.hdc, gdiSurface.color);
      PatBlt(gdiSurface.hdc,
         (int)((float)x * gdiDisplay.width / display.width) + surface.offset.x,
         (int)((float)y * gdiDisplay.height / display.height) + surface.offset.y,
         (int)((float)(x+1) * gdiDisplay.width / display.width)-1 + surface.offset.x+1,
         (int)((float)(y+1) * gdiDisplay.height / display.height)-1 + surface.offset.y+1,
         PATCOPY);
      SetBkColor(gdiSurface.hdc, gdiSurface.backColor);
      SetBkMode(gdiSurface.hdc, surface.textOpacity ? OPAQUE : TRANSPARENT);
   }

   void DrawLine(Display display, Surface surface, int x1, int y1, int x2, int y2)
   {
      Win32PrinterSurface gdiSurface = surface.driverData;
      Win32PrinterDisplay gdiDisplay = display ? display.driverData : null;
      int c = 0;

      x1 = (int)((float)x1 * gdiDisplay.width / display.width) + surface.offset.x;
      y1 = (int)((float)y1 * gdiDisplay.height / display.height) + surface.offset.y;
      x2 = (int)((float)x2 * gdiDisplay.width / display.width) + surface.offset.x;
      y2 = (int)((float)y2 * gdiDisplay.height / display.height) + surface.offset.y;
      for(c = 0; c <= (float)gdiDisplay.width / display.width; c++)
      {
         if(x1 == x2)
         {
            MoveToEx(gdiSurface.hdc, x1, y1, null);
            LineTo(gdiSurface.hdc, x2, y2 + (int)((float)gdiDisplay.width / display.width + 0.5)+1);
            x1++;
            x2++;
         }
         else if(y1 == y2)
         {
            MoveToEx(gdiSurface.hdc, x1, y1, null);
            LineTo(gdiSurface.hdc, x2 + (int)((float)gdiDisplay.width / display.width + 0.5)+1, y2);
            y1++;
            y2++;
         }
         else
         {
            MoveToEx(gdiSurface.hdc, x1, y1, null);
            LineTo(gdiSurface.hdc, x2 + (int)((float)gdiDisplay.width / display.width + 0.5)+1, y2 + (int)((float)gdiDisplay.width / display.width + 0.5)+1);
            x1++;
            x2++;
         }
      }
   }

   void Rectangle(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      Win32PrinterSurface gdiSurface = surface.driverData;
      Win32PrinterDisplay gdiDisplay = display ? display.driverData : null;

      int c;

      SelectObject(gdiSurface.hdc,GetStockObject(NULL_BRUSH));
      x1 = (int)((float)x1 * gdiDisplay.width / display.width) + surface.offset.x;
      y1 = (int)((float)y1 * gdiDisplay.height / display.height) + surface.offset.y;
      x2 = (int)((float)(x2) * gdiDisplay.width / display.width) + surface.offset.x;
      y2 = (int)((float)(y2) * gdiDisplay.height / display.height) + surface.offset.y;
      for(c = 0; c <= (float)gdiDisplay.width / display.width + 1.5; c++)
      {
         ::Rectangle(gdiSurface.hdc, x1, y1, x2, y2);
         y1++; y2++;
         x1++; x2++;
      }
      SelectObject(gdiSurface.hdc,GetStockObject(DC_BRUSH));
   }

   void Area(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      Win32PrinterDisplay gdiDisplay = display ? display.driverData : null;
      Win32PrinterSurface gdiSurface = surface.driverData;

      x1 = (int)((float)x1 * gdiDisplay.width / display.width) + surface.offset.x;
      y1 = (int)((float)y1 * gdiDisplay.height / display.height) + surface.offset.y;
      x2 = (int)(((float)(x2+1) * gdiDisplay.width / display.width) + 0.5) + surface.offset.x;
      y2 = (int)(((float)(y2+1) * gdiDisplay.height / display.height) + 0.5) + surface.offset.y;

      SetBkMode(gdiSurface.hdc, OPAQUE);
      SetBkColor(gdiSurface.hdc, gdiSurface.backColor);
      SetDCBrushColor(gdiSurface.hdc, gdiSurface.backColor);
      PatBlt(gdiSurface.hdc,x1,y1,x2-x1+1,y2-y1+1,PATCOPY);
      SetBkMode(gdiSurface.hdc, surface.textOpacity ? OPAQUE : TRANSPARENT);
   }

   void Clear(Display display, Surface surface, ClearType type)
   {
      Win32PrinterSurface gdiSurface = surface.driverData;
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
      Win32PrinterDisplay gdiDisplay = display ? display.driverData : null;
      Win32PrinterSystem gdiSystem = display.displaySystem.driverData;
      Win32PrinterBitmap gdiBitmap = src.driverData;
      Win32PrinterSurface gdiSurface = surface.driverData;

      if(src.transparent)
      {
         SelectObject(gdiSystem.bmpDC, gdiBitmap.bmp);
         SelectObject(gdiSystem.tmpDC, gdiBitmap.mask);

         SetStretchBltMode(gdiSurface.hdc, HALFTONE); //COLORONCOLOR);

         SetBkColor(gdiSurface.hdc, 0xFFFFFF);
         SetTextColor(gdiSurface.hdc, 0);
         StretchBlt(gdiSurface.hdc,
            dx * gdiDisplay.width / display.width + surface.offset.x,
            dy * gdiDisplay.height / display.height + surface.offset.y,
            (w) * gdiDisplay.width / display.width,
            (h) * gdiDisplay.height / display.height,
            gdiSystem.tmpDC, sx, sy,sw,sh, SRCAND);
         StretchBlt(gdiSurface.hdc,
            dx * gdiDisplay.width / display.width + surface.offset.x,
            dy * gdiDisplay.height / display.height + surface.offset.y,
            (w) * gdiDisplay.width / display.width,
            (h) * gdiDisplay.height / display.height,
            gdiSystem.bmpDC, sx, sy,sw,sh, SRCPAINT);
         /*
         StretchBlt(gdiSurface.hdc,
            dx * gdiDisplay.width / display.width + surface.offset.x,
            dy * gdiDisplay.height / display.height + surface.offset.y,
            (w+1) * gdiDisplay.width / display.width-1,
            (h+1) * gdiDisplay.height / display.height-1,
            gdiSystem.tmpDC, sx, sy,sw,sh, SRCAND);
         StretchBlt(gdiSurface.hdc,
            dx * gdiDisplay.width / display.width + surface.offset.x,
            dy * gdiDisplay.height / display.height + surface.offset.y,
            (w+1) * gdiDisplay.width / display.width-1,
            (h+1) * gdiDisplay.height / display.height-1,
            gdiSystem.bmpDC, sx, sy,sw,sh, SRCPAINT);
         */
         SetBkColor(gdiSurface.hdc, gdiSurface.backColor);
      }
      else
      {
         SetStretchBltMode(gdiSurface.hdc, HALFTONE); //COLORONCOLOR);
         SelectObject(gdiSystem.bmpDC, gdiBitmap.bmp);
         StretchBlt(gdiSurface.hdc,
            dx * gdiDisplay.width / display.width + surface.offset.x,
            dy * gdiDisplay.height / display.height + surface.offset.y,
            (w+1) * gdiDisplay.width / display.width-1,
            (h+1) * gdiDisplay.height / display.height-1,
            gdiSystem.bmpDC, sx, sy,sw,sh, SRCCOPY);
      }
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

   Font LoadFont(DisplaySystem displaySystem, const char * faceName, float size, FontFlags flags)
   {
      Win32PrinterSystem gdiSystem = displaySystem.driverData;
      HDC hdc = gdiSystem.hdc;
      int /*pixels, */res;
      void * font;
      /*
      SetMapMode(gdiSystem.hdc, MM_ANISOTROPIC);
      SetWindowExtEx(gdiSystem.hdc, RESX, RESY, null);
      SetViewportExtEx(gdiSystem.hdc, GetDeviceCaps(gdiSystem.hdc, HORZRES), GetDeviceCaps(gdiSystem.hdc, VERTRES), null);
      */

      //pixels = GetDeviceCaps(hdc, VERTRES);
      res = GetDeviceCaps(hdc, LOGPIXELSY);
      {
         int s;
         s = -(int)(((float)size * res / 78) + 0.5);

         // font = CreateFont(-(int)(((float)size * 96 / 72) + 0.5),
         font = CreateFontA(s,
         // font = CreateFont(-(int)(((float)size * pixels * RESY / res / 72) + 0.5),
            0,0,0, flags.bold ? FW_BOLD : FW_NORMAL, flags.italic ? TRUE : FALSE,
               flags.underline ? TRUE : FALSE, 0, DEFAULT_CHARSET,
                           OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY,
                           DEFAULT_PITCH|FF_DONTCARE, faceName);
      }
      // SetMapMode(gdiSystem.hdc, MM_TEXT);
      return font;
   }

   void UnloadFont(DisplaySystem displaySystem, Font font)
   {
      if(font)
         DeleteObject(font);
   }

   void TextFont(Display display, Surface surface, Font font)
   {
      Win32PrinterSurface gdiSurface = surface.driverData;
      SelectObject(gdiSurface.hdc, font);
   }

   void TextOpacity(Display display, Surface surface, bool opaque)
   {
      Win32PrinterSurface gdiSurface = surface.driverData;
      SetBkMode(gdiSurface.hdc, opaque ? OPAQUE : TRANSPARENT);
   }

   void WriteText(Display display, Surface surface, int x, int y, const char * text, int len, int prevGlyph, int * rPrevGlyph)
   {
      Win32PrinterSurface gdiSurface = surface.driverData;
      Win32PrinterDisplay gdiDisplay = display ? display.driverData : null;
      int wordCount;
      uint16 * u16text = UTF8toUTF16Len(text, len, &wordCount);

      /*
      SetMapMode(gdiSurface.hdc, MM_ANISOTROPIC);
      SetWindowExtEx(gdiSurface.hdc, RESX, RESY, null);
      SetViewportExtEx(gdiSurface.hdc, GetDeviceCaps(gdiSurface.hdc, HORZRES), GetDeviceCaps(gdiSurface.hdc, VERTRES), null);
      */
      TextOut(gdiSurface.hdc, x * gdiDisplay.width / display.width + surface.offset.x, y * gdiDisplay.height / display.height + surface.offset.y, u16text, wordCount);
      /*
      TextOut(gdiSurface.hdc, x + gdiSurface.offset.x, y + gdiSurface.offset.y, text,len);
      SetMapMode(gdiSurface.hdc, MM_TEXT);
      */
      delete u16text;
   }

   void ::_TextExtent(HDC hdc, int resX, int resY, const char * text, int len, int * width, int * height, int prevGlyph, int * rPrevGlyph, int * adv)
   {
      SIZE space, size;
      uint realLen;
      int wordCount;
      uint16 * u16text = UTF8toUTF16Len(text, len, &wordCount);

      for(realLen = 0; realLen<wordCount && u16text[realLen]; realLen++);
      GetTextExtentPoint32(hdc, L" ", 1, &space);
      GetTextExtentPoint32(hdc, u16text, realLen, &size);
      delete u16text;

      if(adv) *adv = 0;
      if(width)
      {
          // UNICODE FIX: proper space computation
          *width = size.cx + (wordCount - realLen) * space.cx;
          *width = *width * resX / GetDeviceCaps(hdc, HORZRES);
      }
      if(height)
      {
         if(realLen)
            *height = size.cy;
         else
            *height = len ? space.cy : 0;
         *height = *height * resY / GetDeviceCaps(hdc, VERTRES);
      }
   }

   void TextExtent(Display display, Surface surface, const char * text, int len, int * width, int * height, int prevGlyph, int * rPrevGlyph, int * adv)
   {
      Win32PrinterSystem gdiSystem = (display && display.displaySystem) ? display.displaySystem.driverData : null;
      Win32PrinterSurface gdiSurface = surface.driverData;

      _TextExtent(gdiSurface.hdc, gdiSystem.resX, gdiSystem.resY, text, len, width, height, prevGlyph, rPrevGlyph, adv);
   }

   void FontExtent(DisplaySystem displaySystem, void * font, const char * text, int len, int * width, int * height, int prevGlyph, int * rPrevGlyph, int * adv)
   {
      Win32PrinterSystem gdiSystem = displaySystem.driverData;
      if(gdiSystem.hdc)
      {
         SelectObject(gdiSystem.hdc, font);
         _TextExtent(gdiSystem.hdc, gdiSystem.resX, gdiSystem.resY, text, len, width, height, prevGlyph, rPrevGlyph, adv);
      }
      else
      {
         if(width) *width = 0;
         if(adv) *adv = 0;
         if(height) *height = 0;
      }
   }

   void DrawingChar(Display display, Surface surface, byte character)
   {

   }

   void LineStipple(Display display, Surface surface, uint stipple)
   {
      //Win32PrinterDisplay gdiDisplay = display ? display.driverData : null;
      // ((subclass(DisplayDriver))class(LFBDisplayDriver)).LineStipple(display, surface, stipple);
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
