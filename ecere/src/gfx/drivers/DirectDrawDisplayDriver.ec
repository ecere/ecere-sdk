namespace gfx::drivers;

import "instance"

#if defined(__WIN32__)

#define Method _Method
#define uint _uint
#define byte _byte
#define int64 _int64
#define String _String
#define Mutex _Mutex
#define Size _Size
#define Platform _Platform

#if defined(__MINGW32__) && !defined(_W64)
#undef DECLARE_INTERFACE
#define DECLARE_INTERFACE(i) \
   interface i { CONST_VTABLE struct i##Vtbl *lpVtbl; }; \
   typedef CONST_VTABLE struct i##Vtbl i##Vtbl; \
   CONST_VTABLE struct i##Vtbl
#endif

#define UNICODE

#include <ddraw.h>

#undef Method
#undef uint
#undef byte
#undef int64
#undef String
#undef Mutex
#undef Size
#undef Platform

import "Display"

class DDrawDisplay : LFBDisplay
{
   IDirectDrawSurface * front;
   IDirectDrawSurface * back;
   IDirectDrawPalette * palette;
   DDSURFACEDESC frontDesc, backDesc;
   IDirectDraw * directDraw;
   HDC hdc;

   void Unlock()
   {
      if(backDesc.lpSurface && bitmap.picture)
      {
         IDirectDrawSurface_Unlock(back, backDesc.lpSurface);
         bitmap.picture = null;
      }
   }

   bool Lock()
   {
      bool result = false;
      if(!back || bitmap.picture)
         result = true;
      else
      {
         uint ddrawResult = IDirectDrawSurface_Lock(back, null, &backDesc, DDLOCK_WAIT | DDLOCK_SURFACEMEMORYPTR, null);
         if(ddrawResult == DDERR_SURFACELOST) // !display.full_screen
         {

            IDirectDrawSurface_Restore(back);
            ddrawResult = IDirectDrawSurface_Lock(back, null, &backDesc, DDLOCK_WAIT | DDLOCK_SURFACEMEMORYPTR, null);
         }
         if(!ddrawResult)
         {
            bool validFormat = true;
            switch(backDesc.ddpfPixelFormat.dwRGBBitCount)
            {
               case 8: bitmap.pixelFormat = pixelFormat8; break;
               case 15: bitmap.pixelFormat = pixelFormat555; break;
               case 16:
                  if(backDesc.ddpfPixelFormat.dwGBitMask == 0x3E0)
                     bitmap.pixelFormat = pixelFormat555;
                  else
                     bitmap.pixelFormat = pixelFormat565;
                  break;
               case 32:
                  bitmap.pixelFormat = pixelFormat888; break;
               default:
                  validFormat = false;
                  break;
            }

            if(validFormat)
            {
               bitmap.picture = (byte *)backDesc.lpSurface;
               bitmap.stride = backDesc.lPitch;
               bitmap.stride >>= GetColorDepthShifts(bitmap.pixelFormat);
               bitmap.size = bitmap.stride * bitmap.height;
               result = true;
            }
            else
               Unlock();
         }
      }
      return result;
   }
};

static HDC tmpDC;
/*
static byte defaultRGBLookup[32768];
static bool rgbLookupSet = false;
*/
// #define USE_GDI_FONT

static bool CALLBACK DeviceCallBack(GUID FAR * guid, char * description, char * driverName, IDirectDraw ** directDraw)
{
   if(!DirectDrawCreate( guid, directDraw, null ))
      return false;
   return true;
}

class DirectDrawDisplayDriver : DisplayDriver
{
   class_property(name) = "DirectDraw";

   void ReleaseSurface(Display display, Surface surface)
   {
      DDrawDisplay ddrawDisplay = display.driverData;
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).ReleaseSurface(display, surface);
      ddrawDisplay.Unlock();
      IDirectDrawSurface_ReleaseDC(ddrawDisplay.back, ddrawDisplay.hdc);
      ddrawDisplay.hdc = null;
   }

   bool GetSurface(Display display, Surface surface, int x,int y, Box clip)
   {
      DDrawDisplay ddrawDisplay = display.driverData;
      LFBSurface lfbSurface;
      bool result = false;
      {
         if((surface.driverData = lfbSurface = LFBSurface { }))
         {
            surface.offset.x = x;
            surface.offset.y = y;
            //surface.unclippedBox = surface.box = clip;

            ddrawDisplay.Lock();
            IDirectDrawSurface_GetDC(ddrawDisplay.back, &ddrawDisplay.hdc);
            result = ((subclass(DisplayDriver))class(LFBDisplayDriver)).GetSurface(display, surface, x, y, clip);
         }
      }
      return result;
   }

   bool GetBitmapSurface(DisplaySystem displaySystem, Surface surface, Bitmap bitmap, int x, int y, Box clip)
   {
      return ((subclass(DisplayDriver))class(LFBDisplayDriver)).GetBitmapSurface(displaySystem, surface, bitmap, x, y, clip);
   }

   void Clip(Display display, Surface surface, Box clip)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Clip(display, surface, clip);
   }

   void DestroyDisplay(Display display)
   {
      DDrawDisplay ddrawDisplay = display.driverData;
      IDirectDraw * directDraw = ddrawDisplay.directDraw;

      if(ddrawDisplay.back)
         IDirectDrawSurface_Release(ddrawDisplay.back);
      if(ddrawDisplay.front)
         IDirectDrawSurface_Release(ddrawDisplay.front);
      if(ddrawDisplay.palette)
         IDirectDrawPalette_Release(ddrawDisplay.palette);

      if(directDraw)
      {
         IDirectDraw_SetCooperativeLevel(directDraw, display.window, DDSCL_NORMAL );
      }

      if(display)
         ((subclass(DisplayDriver))class(LFBDisplayDriver)).DestroyDisplay(display);

      if(directDraw)
      {
         if(display.displaySystem.flags.fullScreen)
            IDirectDraw_RestoreDisplayMode(directDraw);
         IDirectDraw_Release(directDraw);
      }

      delete ddrawDisplay;
      display.driverData = null;
   }

   void SetPalette(Display display, ColorAlpha * palette, bool colorMatch)
   {
      DDrawDisplay ddrawDisplay = display.driverData;
      IDirectDraw * directDraw = ddrawDisplay.directDraw;
      if(ddrawDisplay.bitmap.pixelFormat == pixelFormat8)
      {
         int c;
         ColorAlpha realPalette[256];
         PALETTEENTRY ddPalette[256];
         int reserved = (display.displaySystem.flags.fullScreen) ? 0 : 10;

         if(reserved)
         {
            HDC hdc = GetDC(display.window);
            GetSystemPaletteEntries(hdc,0,256,(PALETTEENTRY *)realPalette);
            for(c=0; c<256; c++)
               realPalette[c] = ColorAlpha { 255, { realPalette[c].color.b, realPalette[c].color.g, realPalette[c].color.r } };
            ReleaseDC(display.window,hdc);

            // *** Reserved Palette Handling ***
            if(!palette)
            {
               palette = GetDefaultPalette();
               CopyBytesBy4(realPalette+reserved,palette+reserved,256-2*reserved);
               /*
               if(!rgbLookupSet)
                  for(c = 0; c<32768; c++)
                     defaultRGBLookup[c] = (byte)BestColorMatch(realPalette, 0, 255, (Color555)c);
               rgbLookupSet = true;
               */
               CopyBytes(ddrawDisplay.rgbLookup, defaultRGBLookup, 32768);
               for(c=0; c<256; c++)
               {
                  int i;
                  for(i=0; i<LIGHTSTEPS; i++)
                  {
                     ddrawDisplay.lightTable[c][i]=ddrawDisplay.rgbLookup[
                        (uint16)(Color555)
                           Color {
                                (byte)(((uint16)realPalette[c].color.r*i) >>LIGHTSHIFT),
                                (byte)(((uint16)realPalette[c].color.g*i) >>LIGHTSHIFT),
                                (byte)(((uint16)realPalette[c].color.b*i) >>LIGHTSHIFT) }];
                  }
               }
               CopyBytesBy4(ddrawDisplay.bitmap.palette, realPalette, 256);
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

         for (c = 0; c<reserved; c++)
         {
            ddPalette[c].peFlags = PC_EXPLICIT;
            ddPalette[c].peRed = (byte)c;
            ddPalette[c].peGreen = 0;
            ddPalette[c].peBlue = 0;

            ddPalette[c+256-reserved].peFlags = PC_EXPLICIT;
            ddPalette[c+256-reserved].peRed = (byte)(c+256-reserved);
            ddPalette[c+256-reserved].peGreen = 0;
            ddPalette[c+256-reserved].peBlue = 0;
         }
         for(c = reserved; c < 256 - reserved; c++)
         {
            ddPalette[c].peFlags = PC_NOCOLLAPSE;
            ddPalette[c].peRed = ddrawDisplay.bitmap.palette[c].color.r;
            ddPalette[c].peGreen = ddrawDisplay.bitmap.palette[c].color.g;
            ddPalette[c].peBlue = ddrawDisplay.bitmap.palette[c].color.b;
         }

         if(!ddrawDisplay.palette)
         {
            IDirectDraw_CreatePalette(directDraw, DDPCAPS_8BIT, ddPalette, &ddrawDisplay.palette, null);
            IDirectDrawSurface_SetPalette(ddrawDisplay.front, ddrawDisplay.palette);
         }
         else
            IDirectDrawPalette_SetEntries(ddrawDisplay.palette,0,0,256,ddPalette);
      }
      else
         ((subclass(DisplayDriver))class(LFBDisplayDriver)).SetPalette(display, palette, colorMatch);
   }

   bool CreateDisplaySystem(DisplaySystem displaySystem)
   {
      bool result = false;
      displaySystem.flags.memBackBuffer = true;
      tmpDC = GetDC(0);
      result = true;
      return result;
   }

   void DestroyDisplaySystem(DisplaySystem displaySystem)
   {
      ReleaseDC(0, tmpDC);
   }

   bool DisplaySize(Display display, int width, int height)
   {
      DDrawDisplay ddrawDisplay = display.driverData;
      bool result = false;
      IDirectDraw * directDraw = ddrawDisplay.directDraw;

      if(ddrawDisplay.back)
         IDirectDrawSurface_Release(ddrawDisplay.back);

      ddrawDisplay.backDesc.dwFlags        = DDSD_WIDTH | DDSD_HEIGHT | DDSD_CAPS;
      ddrawDisplay.backDesc.dwWidth        = width;
      ddrawDisplay.backDesc.dwHeight       = height;
      ddrawDisplay.backDesc.ddsCaps.dwCaps = DDSCAPS_SYSTEMMEMORY; // = DDSCAPS_OFFSCREENPLAIN;
      //ddrawDisplay.backDesc.ddsCaps.dwCaps = DDSCAPS_OFFSCREENPLAIN;

      if(!IDirectDraw_CreateSurface(directDraw, &ddrawDisplay.backDesc, &ddrawDisplay.back, null))
      {
         IDirectDrawClipper * clipper;
         if(!IDirectDraw_CreateClipper(directDraw, 0, &clipper, null))
         {
            IDirectDrawClipper_SetHWnd(clipper, 0, display.window);
            IDirectDrawSurface_SetClipper(ddrawDisplay.front, clipper);
            IDirectDrawClipper_Release(clipper);

            // Set up format by locking / unlocking
            if(ddrawDisplay.Lock())
            {
               display.displaySystem.pixelFormat = ddrawDisplay.bitmap.pixelFormat;
               ddrawDisplay.Unlock();
               result = true;
            }
         }
      }

      ((subclass(DisplayDriver))class(LFBDisplayDriver)).DisplaySize(display, width, height);

      display.width = width;
      display.height = height;

      return result;
   }

   bool CreateDisplay(Display display)
   {
      bool result = false;
      DDrawDisplay ddrawDisplay = display.driverData = DDrawDisplay { };
      if(ddrawDisplay)
      {
         IDirectDraw * directDraw = null;
         DirectDrawEnumerateA(DeviceCallBack, &directDraw);
         if(directDraw)
         {
            DirectDrawCreate(null, &directDraw, null);
            ddrawDisplay.directDraw = directDraw;
            if(((subclass(DisplayDriver))class(LFBDisplayDriver)).CreateDisplay(display))
            {
               ddrawDisplay.frontDesc.dwSize = ddrawDisplay.backDesc.dwSize = sizeof(DDSURFACEDESC);

               if(!IDirectDraw_SetCooperativeLevel( directDraw, display.window,
                  (display.displaySystem.flags.fullScreen) ? (DDSCL_EXCLUSIVE | DDSCL_FULLSCREEN) : DDSCL_NORMAL))
               {
                  ddrawDisplay.frontDesc.dwFlags = DDSD_CAPS;
                  ddrawDisplay.frontDesc.ddsCaps.dwCaps = DDSCAPS_PRIMARYSURFACE;
                  if(!IDirectDraw_CreateSurface( directDraw, &ddrawDisplay.frontDesc, &ddrawDisplay.front, null ))
                  {
                     // To find out the format...
                     DisplaySize(display, 1, 1);
                     result = true;
                  }
               }
            }
         }
      }
      return result;
   }

   void DisplayPosition(Display display, int x, int y)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).DisplayPosition(display, x, y);
   }

   void RestorePalette(Display display)
   {
      DDrawDisplay ddrawDisplay = display.driverData;
      IDirectDrawSurface_SetPalette(ddrawDisplay.front, ddrawDisplay.palette);
   }

   void StartUpdate(Display display)
   {
      DDrawDisplay ddrawDisplay = display.driverData;
      ddrawDisplay.Unlock();
   }

   void EndUpdate(Display display)
   {
      DDrawDisplay ddrawDisplay = display.driverData;
      ddrawDisplay.Lock();
   }

   void Scroll(Display display, Box scroll, int x, int y, Extent dirty)
   {
   }

   void Update(Display display, Box updateBox)
   {
      DDrawDisplay ddrawDisplay = display.driverData;

      // TODO: (Compiler) Shouldn't &updateBox be the same as updateBox in this assignment?
      Box * box = updateBox; // ? updateBox : &ddrawDisplay.updateBox;
      RECT r, br;

      r.left  = ddrawDisplay.x + box->left;
      r.top   = ddrawDisplay.y + box->top;
      r.right = ddrawDisplay.x + box->right+1;
      r.bottom= ddrawDisplay.y + box->bottom+1;

      br.left  = box->left;
      br.top   = box->top;
      br.right = box->right+1;
      br.bottom= box->bottom+1;

      if(r.right > r.left && r.bottom > r.top)
      {
         if(IDirectDrawSurface_Blt(ddrawDisplay.front, &r, ddrawDisplay.back, &br, DDBLT_WAIT,null) == DDERR_SURFACELOST)
         {
            IDirectDrawSurface_Restore(ddrawDisplay.front);
            IDirectDrawSurface_Blt(ddrawDisplay.front, &r, ddrawDisplay.back, &br, DDBLT_WAIT,null);
         }
      }
      // ((subclass(DisplayDriver))class(LFBDisplayDriver)).DisplayScreen(display, updateBox);
   }

   bool GrabScreen(Display display, Bitmap bitmap, int x, int y, unsigned int w, unsigned int h)
   {
      bool result = false;
      DDrawDisplay ddrawDisplay = display.driverData;
      if(ddrawDisplay.Lock())
      {
         display.displaySystem.pixelFormat = ddrawDisplay.bitmap.pixelFormat;
         result = ((subclass(DisplayDriver))class(LFBDisplayDriver)).GrabScreen(display, bitmap, x,y, w,h);
         ddrawDisplay.Unlock();
      }
      return result;
   }

   bool MakeDDBitmap(DisplaySystem displaySystem, Bitmap bitmap, bool mipMaps, int cubeMapFace)
   {
      return ((subclass(DisplayDriver))class(LFBDisplayDriver)).MakeDDBitmap(displaySystem, bitmap, mipMaps, cubeMapFace);
   }

   void FreeBitmap(DisplaySystem displaySystem, Bitmap bitmap)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).FreeBitmap(displaySystem, bitmap);
   }

   void SetForeground(Display display, Surface surface, ColorAlpha color)
   {
   #ifdef USE_GDI_FONT
      DDrawDisplay ddrawDisplay = display.driverData;
      SetTextColor(ddrawDisplay.hdc, RGB(color.color.r, color.color.g, color.color.b));
   #endif
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).SetForeground(display, surface, color);
   }

   void SetBackground(Display display, Surface surface, ColorAlpha color)
   {
   #ifdef USE_GDI_FONT
      DDrawDisplay ddrawDisplay = display.driverData;
      COLORREF rgb;

      if(ddrawDisplay.bitmap.pixelFormat == pixelFormat8)
         color = ddrawDisplay.bitmap.palette[ddrawDisplay.rgbLookup[(uint16)(Color555) color]];
      rgb = RGB(color.color.r, color.color.g, color.color.b);
      SetBkColor(ddrawDisplay.hdc, rgb);
   #endif
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).SetBackground(display, surface, color);
   }

   ColorAlpha GetPixel(Display display, Surface surface,int x,int y)
   {
      return 0;
   }

   void PutPixel(Display display, Surface surface, int x, int y)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).PutPixel(display, surface, x,y);
   }

   void DrawLine(Display display, Surface surface, int x1, int y1, int x2, int y2)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).DrawLine(display, surface, x1,y1,x2,y2);
   }

   void Rectangle(Display display, Surface surface, int x1, int y1, int x2, int y2)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Rectangle(display, surface, x1,y1,x2,y2);
   }

   void Area(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Area(display, surface, x1,y1,x2,y2);
   }

   void Clear(Display display, Surface surface, ClearType flags)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Clear(display, surface, flags);
   }

   bool ConvertBitmap(DisplaySystem displaySystem, Bitmap src, PixelFormat format, ColorAlpha * palette)
   {
      return ((subclass(DisplayDriver))class(LFBDisplayDriver)).ConvertBitmap(displaySystem, src, format, palette);
   }

   bool AllocateBitmap(DisplaySystem displaySystem, Bitmap bitmap, int width, int height, int stride, PixelFormat format, bool allocatePalette)
   {
      return ((subclass(DisplayDriver))class(LFBDisplayDriver)).AllocateBitmap(displaySystem, bitmap, width, height, stride, format, allocatePalette);
   }

   void Blit(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Blit(display, surface, src, dx, dy, sx, sy, w, h);
   }

   void Stretch(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Stretch(display, surface, src, dx, dy, sx, sy, w, h, sw, sh);
   }

   void Filter(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Filter(display, surface, src, dx, dy, sx, sy, w, h, sw, sh);
   }

   void BlitDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Blit(display, surface, src, dx, dy, sx, sy, w, h);
   }

   void StretchDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).Stretch(display, surface, src, dx, dy, sx, sy, w, h, sw, sh);
   }

   void FilterDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      Filter(display, surface, src, dx, dy, sx, sy, w, h, sw, sh);
   }

   void TextFont(Display display, Surface surface, Font font)
   {
   #ifdef USE_GDI_FONT
      DDrawDisplay ddrawDisplay = display.driverData;
      /*if(display.alphaBlend)
      {
         if(!gdiFont.font)
         {
            gdiFont.font = ((subclass(DisplayDriver))class(LFBDisplayDriver)).LoadFont(display.displaySystem,
               gdiFont.faceName, gdiFont.size, gdiFont.flags);
         }
         ((subclass(DisplayDriver))class(LFBDisplayDriver)).TextFont(display, surface, gdiFont.font);
      }
      else */
         SelectObject(ddrawDisplay.hdc, font);
   #else
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).TextFont(display, surface, font);
      SetForeground(display, surface, surface.foreground);
   #endif
   }

   void TextOpacity(Display display, Surface surface, bool opaque)
   {
   #ifdef USE_GDI_FONT
      DDrawDisplay ddrawDisplay = display.driverData;
      SetBkMode(ddrawDisplay.hdc, surface.textOpacity ? OPAQUE : TRANSPARENT);
   #else
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).TextOpacity(display, surface, opaque);
   #endif
   }

   Font LoadFont(DisplaySystem displaySystem, const char * faceName, float size, FontFlags flags, float outlineSize, float outlineFade)
   {
   #ifdef USE_GDI_FONT
      void * font;
      HDC hdc = GetDC(null);
      font = CreateFont(-(int)((float)size * GetDeviceCaps(hdc, LOGPIXELSY) / 72 + 0.5),
         0,0,0, (flags.bold) ? FW_BOLD : FW_NORMAL, flags.italic,
            flags.underline,0,DEFAULT_CHARSET,
                        OUT_DEFAULT_PRECIS,CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY,
                        DEFAULT_PITCH|FF_DONTCARE,faceName);
      ReleaseDC(null, hdc);
      return font;
   #else
      Font font = ((subclass(DisplayDriver))class(LFBDisplayDriver)).LoadFont(displaySystem, faceName, size, flags, outlineSize, outlineFade);
      /*if(font)
      {
         font.bitmap.pixelFormat = C8;
         font.bitmap.transparent = true;
         font.bitmap.allocatePalette = false;
         delete font.bitmap.palette;
         font.bitmap.shadeShift = 8-LIGHTSHIFT;

         // Tune the bitmap a bit until we decide to do alpha blending...
         {
            Bitmap bitmap = font.bitmap;
            int x,y;
            for(y = 0; y<bitmap.height; y++)
            {
               byte * picture = bitmap.picture + bitmap.stride * y;
               for(x = 0; x<bitmap.width; x++, picture++)
               {
                  if(*picture > 100)
                     *picture = Max(*picture, 150);
                  else
                     *picture = 0;
               }
            }
         }
         {
            LFBDisplay lfbDisplay = display.driverData;
            if(lfbDisplay)
               font.bitmap.palette = lfbDisplay.bitmap.palette;
            else
               font.bitmap.palette = GetDefaultPalette();
         }
      }*/
      return font;
   #endif
   }

   void UnloadFont(DisplaySystem displaySystem, Font font)
   {
   #ifdef USE_GDI_FONT
      if(font)
         DeleteObject(font);
   #else
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).UnloadFont(displaySystem, font);
   #endif
   }

   void WriteText(Display display, Surface surface, int x, int y, const char * text, int len, int prevGlyph, int * rPrevGlyph)
   {
   #ifdef USE_GDI_FONT
      DDrawDisplay ddrawDisplay = display.driverData;

      /*if(display.alphaBlend)
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
      else*/
      {
         int wordCount;
         uint16 * u16text = UTF8toUTF16Len(text, len, &wordCount);

         TextOut(ddrawDisplay.hdc, x + surface.offset.x, y + surface.offset.y, u16text, wordCount);
         if(display.alphaBlend)
         {
            int w, h, oh;
            FontExtent(display.displaySystem, surface.font, text, len, &w, &h, prevGlyph, rPrevGlyph, &oh);
            w += oh;
            surface.writeColor = false;
            SetBackground(display, surface, surface.foreground);
            Area(display, surface,x-2,y-2,x+w+1,y+h+1);
            SetBackground(display, surface, surface.background);
            surface.writeColor = true;
         }
         delete u16text;
      }
      /*
      TextOut(ddrawDisplay.hdc, x+surface.offset.x,y+surface.offset.y, text,len);
      */
   #else
      if(surface.textOpacity)
      {
         int w, h, adv;
         ((subclass(DisplayDriver))class(LFBDisplayDriver)).FontExtent(display.displaySystem, surface.font, text, len, &w, &h, prevGlyph, rPrevGlyph, &adv);
         w += adv;
         Area(display, surface, x, y, x+w-1, y+h-1);
      }
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).WriteText(display, surface, x,y, text, len, prevGlyph, rPrevGlyph);
   #endif
   }

   void FontExtent(DisplaySystem displaySystem, Font font, const char * text, int len, int * width, int * height, int prevGlyph, int * rPrevGlyph, int * adv)
   {
   #ifdef USE_GDI_FONT
      if(false) //display.alphaBlend)
        ((subclass(DisplayDriver))class(LFBDisplayDriver)).FontExtent(displaySystem, font, text, len, width, height, prevGlyph, rPrevGlyph, adv);
      else
      {
         if(tmpDC)
         {
            SelectObject(tmpDC, font);
            TextExtent(null, null, text, len, width, height);
         }
         else
         {
            if(width) *width = 0;
            if(height) *height = 0;
            if(adv) *adv = 0;
         }
      }
      /*
      HDC hdc = tmpDC;
      SIZE space, size;
      uint realLen;

      SelectObject(hdc, font);
      for(realLen = 0; realLen<len && text[realLen]; realLen++);
      GetTextExtentPoint32(hdc," ",1,&space);
      GetTextExtentPoint32(hdc,text,realLen,&size);

      if(width) *width = size.cx + (len - realLen) * space.cx;
      if(height)
      {
         if(realLen)
            *height = size.cy;
         else
            *height = len ? space.cy : 0;
      }
      */
   #else
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).FontExtent(displaySystem, font, text, len, width, height, prevGlyph, rPrevGlyph, adv);
   #endif
   }

   void TextExtent(Display display, Surface surface, const char * text, int len, int * width, int * height, int prevGlyph, int * rPrevGlyph, int * adv)
   {
   #ifdef USE_GDI_FONT
      /*if(display && display.alphaBlend)
         ((subclass(DisplayDriver))class(LFBDisplayDriver)).TextExtent(display, surface, text, len, prevGlyph, rPrevGlyph, width, height, adv);
      else*/

      {
         DDrawDisplay ddrawDisplay = display ? display.driverData : null;
         HDC hdc = ddrawDisplay ? ddrawDisplay.hdc : tmpDC;
         SIZE space, size;
         uint realLen;
         int wordCount;
         uint16 * u16text = UTF8toUTF16Len(text, len, &wordCount);

         for(realLen = 0; realLen<wordCount && u16text[realLen]; realLen++);
         GetTextExtentPoint32A(hdc, " ", 1, &space);
         GetTextExtentPoint32(hdc, u16text, realLen, &size);
         delete u16text;

         // UNICODE FIX: proper space computation
         if(width) *width = size.cx + (wordCount - realLen) * space.cx;
         if(adv) *adv = 0;
         if(height)
         {
            if(realLen)
               *height = size.cy;
            else
               *height = wordCount ? space.cy : 0;
         }
      }
   /*
      HDC hdc = ddrawDisplay.hdc;
      SIZE space, size;
      uint realLen;

      for(realLen = 0; realLen<len && text[realLen]; realLen++);
      GetTextExtentPoint32(hdc," ",1,&space);
      GetTextExtentPoint32(hdc,text,realLen,&size);

      if(width) *width = size.cx + (len - realLen) * space.cx;
      if(height)
      {
         if(realLen)
            *height = size.cy;
         else
            *height = len ? space.cy : 0;
      }
      */
   #else
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).TextExtent(display, surface, text, len, width, height, prevGlyph, rPrevGlyph, adv);
   #endif
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
      /*DDrawDisplay ddrawDisplay = display.driverData;
      if(ddrawDisplay.Lock())
      {
         display.displaySystem.pixelFormat = ddrawDisplay.bitmap.pixelFormat;
         IDirectDrawSurface_GetDC(ddrawDisplay.back, &ddrawDisplay.hdc);
      }*/
      return true;
   }

   void Unlock(Display display)
   {
      /*DDrawDisplay ddrawDisplay = display.driverData;
      IDirectDrawSurface_ReleaseDC(ddrawDisplay.back, ddrawDisplay.hdc);
      ddrawDisplay.Unlock();   */
   }
}

#endif
