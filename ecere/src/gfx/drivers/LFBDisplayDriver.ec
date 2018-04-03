#define _Noreturn

namespace gfx::drivers;

#ifdef __MSC__
#pragma warning(disable:4244)
#pragma warning(disable:4018)
#endif

import "File"
import "Display"

public define LIGHTSHIFT = 5;
public define LIGHTSTEPS = 1<<LIGHTSHIFT;

/*#ifndef ECERE_VANILLA
import "lfbRGBLookup"
static bool rgbLookupSet = true;
#else*/
/*static */byte defaultRGBLookup[32768];
/*static */bool rgbLookupSet = false;
//#endif

#if defined(ECERE_VANILLA)
   #define ECERE_NOTRUETYPE
#endif

#if !defined(ECERE_NOTRUETYPE)
import "fontManagement"
import "fontRendering"
#else
public class Font : struct { }
#endif

import "lfbBlit"
import "lfbConvert"

#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA) && !defined(ECERE_ONEDRIVER) && defined(__WIN32__)
import "OpenGLDisplayDriver"

#if !defined(_GLES) && !defined(ECERE_STATIC)
import "Direct3D8DisplayDriver"
import "Direct3D9DisplayDriver"
#endif

#endif

public class LFBDisplay : struct
{
public:
   Bitmap bitmap { };
   byte rgbLookup[32768];
   byte lightTable[256][LIGHTSTEPS];
   OldList updateBoxes;
   int x,y;
   bool selfManaged;
   void (* displayCallback)(Display display, Box updateBox);
};

public class LFBSystem : struct
{
public:
   int format;
   ColorAlpha * palette;
   byte rgbLookup[32768];

   LFBSystem()
   {
      if(!rgbLookupSet)
      {
         int c, r, g, b;
         ColorAlpha * palette = GetDefaultPalette();
         for(c = 16; c < 232; c++)
         {
            Color555 color = palette[c].color;
            for(r = Max(0, color.r - 2); r <= Min(31, color.r + 4); r++)
               for(g = Max(0, color.g - 2); g <= Min(31, color.g + 4); g++)
                  for(b = Max(0, color.b - 2); b <= Min(31, color.b + 4); b++)
                     defaultRGBLookup[r * 32 * 32 + g * 32 + b] = (byte)c;
         }
         for(c = 232; c < 246; c++)
         {
            Color555 color = palette[c].color;
            defaultRGBLookup[color] = (byte)c;
         }
         /*
         for(c = 246; c < 256; c++)
         {
            Color555 color = palette[c].color;
            defaultRGBLookup[color] = (byte)c;
         }
         for(c = 0; c < 16; c++)
         {
            Color555 color = palette[c].color;
            defaultRGBLookup[color] = (byte)c;
         }*/
         /*
         for(c = 0; c<32768; c++)
         {
            Color color = (Color)(Color555)c;
            defaultRGBLookup[c] = 16 + (color.r * 5 / 255) * 36 + (color.g * 5 / 255) * 6 + (color.b * 5 / 255);
            // defaultRGBLookup[c] = (byte)BestColorMatch(palette, 0, 255, (Color)(Color555)c);
         }
         */
         rgbLookupSet = true;
      }
   }
};

public class LFBSurface : struct
{
public:
   // For compatibility with 3D drivers as well
   Font font;
   bool opaqueText;
   int xOffset;
   bool writingText;
   bool writingOutline;

   Bitmap bitmap;

   // Drawing attributes
   uint foreground, background;
   ColorAlpha foregroundRgb;
   uint16 stipple;
   byte drawingChar;
   byte * paletteShades;
   bool clearing;
};

/*
static int CompareHit(GLHitRecord * recordA, GLHitRecord * recordB, const void * nothing)
{
   if(recordA->zMin > recordB->zMin)
      return  1;
   else if(recordA->zMin < recordB->zMin)
      return -1;
   else if(recordA > recordB)
      return 1;
   else if(recordA < recordB)
      return -1;
   else
      return  0;
}
*/

public class LFBDisplayDriver : DisplayDriver
{
   class_property(name) = "LFB";

   bool CreateDisplaySystem(DisplaySystem displaySystem)
   {
      displaySystem.flags.memBackBuffer = true;
      // displaySystem.pixelFormat = pixelFormat888;
      return true;
   }

   void DestroyDisplaySystem(DisplaySystem displaySystem)
   {
   }

   void FreeBitmap(DisplaySystem displaySystem, Bitmap bitmap)
   {
      delete bitmap.picture;
      if(bitmap.allocatePalette)
         delete bitmap.palette;
   }

   bool AllocateBitmap(DisplaySystem displaySystem, Bitmap bitmap, int width, int height, int stride, PixelFormat format, bool allocatePalette)
   {
      bool result = false;
      if(!stride)
      {
         switch(GetColorDepthShifts(format))
         {
            case 0: stride = (width + 3) & 0xFFFFFFFC; break;
            case 1: stride = (width + 1) & 0xFFFFFFFE; break;
            case 2: stride = width;                    break;
         }
      }
      bitmap.stride = stride;
      bitmap.width = width;
      bitmap.height = height;
      bitmap.size = (uint32) stride * (uint32)height;
      bitmap.sizeBytes = bitmap.size << GetColorDepthShifts(format);
      bitmap.pixelFormat = format;
      bitmap.transparent = false;
   /*
      surface.box.left = surface.box.top = 0;
      surface.box.right = width - 1;
      surface.box.bottom = height - 1;
   */
      bitmap.picture = new0 byte[bitmap.sizeBytes];
      if(bitmap.picture)
      {
         bitmap.allocatePalette = allocatePalette;
         if(allocatePalette)
         {
            bitmap.palette = new ColorAlpha[256];
            if(bitmap.palette)
            {
               CopyBytesBy4(bitmap.palette, GetDefaultPalette(), 256);
               result = true;
            }
         }
         else
         {
            bitmap.palette = GetDefaultPalette();
            result = true;
         }
      }
      if(!result)
         FreeBitmap(displaySystem, bitmap);
      return result;
   }

   bool ConvertBitmap(DisplaySystem displaySystem, Bitmap src, PixelFormat format, ColorAlpha * palette)
   {
      bool result = false;
      LFBSystem lfbSystem = displaySystem ? displaySystem.driverData : null;

      if(src)
      {
         if((src.pixelFormat == format) && (format != pixelFormat8 || !palette))
         {
            if(src.transparent && src.pixelFormat == pixelFormat888)
            {
               /*
               DWORD c;
               DWORD * picture = (DWORD *)src.picture;

               for(c = 0; c<src.size; c++, picture++)
               {
                  if(*picture & 0xFFFFFF)
                     *picture =  *picture | 0xFF000000;
                  else
                     *picture = *picture & 0xFFFFFF;
               }
               */
            }
            result = true;
         }
         else
         {
            Bitmap bitmap { };
            if(bitmap.Allocate(null, src.width, src.height, 0, format, false))
            {
               if(format == pixelFormat8)
               {
                  if(palette)
                     bitmap.palette = palette;
                  else if(lfbSystem && lfbSystem.palette)
                     bitmap.palette = lfbSystem.palette;
                  else
                     bitmap.palette = src.palette;
               }

               if(converters_table[src.pixelFormat][bitmap.pixelFormat])
               {
                  converters_table[src.pixelFormat][bitmap.pixelFormat](lfbSystem, src, bitmap);
                  bitmap.transparent = src.transparent;
                  bitmap.alphaBlend = src.alphaBlend && format != pixelFormat8;
                  delete src.picture;
                  if(src.palette != bitmap.palette)
                  {
                     if(src.allocatePalette)
                        delete src.palette;
                     src.allocatePalette = false;
                  }
                  src.picture = bitmap.picture;
                  src.palette = bitmap.palette;
                  src.stride = bitmap.stride;
                  src.size = bitmap.size;
                  src.sizeBytes = bitmap.sizeBytes;
                  src.pixelFormat = bitmap.pixelFormat;

                  result = true;
               }

               bitmap.palette = null;
               bitmap.picture = null;
            }
            delete bitmap;
         }
      }
      return result;
   }

   void DestroyDisplay(Display display)
   {
      LFBDisplay lfbDisplay = display.driverData;
      delete lfbDisplay.bitmap.palette;
   }

   bool CreateDisplay(Display display)
   {
      bool result = false;
      LFBDisplay lfbDisplay = display.driverData;
      if(!lfbDisplay)
      {
         lfbDisplay = display.driverData = LFBDisplay { };
         lfbDisplay.selfManaged = true;
         lfbDisplay.bitmap.pixelFormat = pixelFormatRGBA;
      }

      if((lfbDisplay.bitmap.palette = new ColorAlpha[256]))
      {
         CopyBytesBy4(lfbDisplay.bitmap.palette, GetDefaultPalette(), 256);
         result = true;
      }
      return result;
   }

   bool DisplaySize(Display display, int width, int height)
   {
      LFBDisplay lfbDisplay = display.driverData;
      //display.width = width;
      //display.height = height;
      lfbDisplay.bitmap.width = width;
      lfbDisplay.bitmap.height = height;
      /*
      lfbDisplay.updateBox.left = display.width;
      lfbDisplay.updateBox.top = display.height;
      lfbDisplay.updateBox.right = 0;
      lfbDisplay.updateBox.bottom = 0;
      */

      if(lfbDisplay.selfManaged)
      {
         lfbDisplay.bitmap.picture = (byte *)renew lfbDisplay.bitmap.picture int[width * height];
         lfbDisplay.bitmap.stride = width;
      }
      lfbDisplay.bitmap.size = lfbDisplay.bitmap.stride * lfbDisplay.bitmap.height;
      return true;
   }

   void DisplayPosition(Display display, int x, int y)
   {
      LFBDisplay lfbDisplay = display.driverData;
      lfbDisplay.x = x;
      lfbDisplay.y = y;
   }

   void SetPalette(Display display, ColorAlpha * palette, bool colorMatch)
   {
      LFBDisplay lfbDisplay = display.driverData;
      if(colorMatch)
      {
         int c;

         if(!palette)
         {
            LFBSystem lfbSystem = display.displaySystem ? display.displaySystem.driverData : null;
            palette = lfbSystem ? lfbSystem.palette : GetDefaultPalette();
            CopyBytes(lfbDisplay.rgbLookup, defaultRGBLookup, 32768);
         }
         else
            for(c = 0; c<32768; c++)
               lfbDisplay.rgbLookup[c] = (byte)BestColorMatch(palette, 1, 255, (Color)(Color555)c);

         for(c=0; c<256; c++)
         {
            int i;
            for(i=0; i<LIGHTSTEPS; i++)
            {
               lfbDisplay.lightTable[c][i] = lfbDisplay.rgbLookup[(uint16)(Color555) Color {
                          (byte)(((uint16)palette[c].color.r * i) >> LIGHTSHIFT),
                          (byte)(((uint16)palette[c].color.g * i) >> LIGHTSHIFT),
                          (byte)(((uint16)palette[c].color.b * i) >> LIGHTSHIFT) }];
            }
         }
      }
      if(lfbDisplay.bitmap.palette)
         CopyBytesBy4(lfbDisplay.bitmap.palette, palette ? palette : GetDefaultPalette(), 256);
   }

   void Update(Display display, Box updateBox)
   {
      LFBDisplay lfbDisplay = display.driverData;
      if(lfbDisplay.displayCallback)
      {
         if(updateBox == null)
         {
            Box box { 0,0, display.width,display.height };
            lfbDisplay.displayCallback(display, box);
         }
         else
            lfbDisplay.displayCallback(display, updateBox);
      }
   }

   bool MakeDDBitmap(DisplaySystem displaySystem, Bitmap bitmap, bool mipMaps, int cubeMapFace)
   {
      if(bitmap.pixelFormat != pixelFormatAlpha)
      {
         if(!ConvertBitmap(displaySystem, bitmap, /*bitmap.alphaBlend ? pixelFormat888 : */displaySystem.pixelFormat, null))
         {
            FreeBitmap(displaySystem, bitmap);
            return false;
         }
      }
      return true;
   }

   void ReleaseSurface(Display display, Surface surface)
   {
      LFBSurface lfbSurface = surface.driverData;
      delete lfbSurface;
      surface.driverData = null;
   }

   bool GetSurface(Display display, Surface surface, int x, int y, Box clip)
   {
      LFBDisplay lfbDisplay = display.driverData;
      LFBSurface lfbSurface = surface.driverData;
      if(!lfbSurface)
      {
         lfbSurface = surface.driverData = LFBSurface { };
      }

      lfbSurface.bitmap = lfbDisplay.bitmap;

      surface.offset.x = x;
      surface.offset.y = y;
      surface.box = clip;
      if(lfbDisplay.bitmap.pixelFormat == pixelFormatText)
      {
         surface.offset.x /= textCellW;
         surface.offset.y /= textCellH;
         surface.box.left /= textCellW;
         surface.box.top /= textCellH;
         surface.box.right /= textCellW;
         surface.box.bottom /= textCellH;
      }

      /*
      lfbDisplay.updateBox.left = Min(x + clip.left, lfbDisplay.updateBox.left);
      lfbDisplay.updateBox.top = Min(y + clip.top, lfbDisplay.updateBox.top);
      lfbDisplay.updateBox.right = Max(x + clip.right, lfbDisplay.updateBox.right);
      lfbDisplay.updateBox.bottom = Max(y + clip.bottom, lfbDisplay.updateBox.bottom);
      */

      surface.unclippedBox = surface.box;
      lfbSurface.drawingChar = 219;
      return true;
   }

   bool GetBitmapSurface(DisplaySystem displaySystem, Surface surface, Bitmap bitmap, int x,int y, Box clip)
   {
      bool result = false;
      LFBSurface lfbSurface = surface.driverData;
      if(lfbSurface || (surface.driverData = lfbSurface = LFBSurface { }))
      {
         lfbSurface.bitmap = bitmap;

         surface.offset.x = x;
         surface.offset.y = y;
         surface.box = clip;
         if(bitmap.pixelFormat == pixelFormatText)
         {
            surface.offset.x /= textCellW;
            surface.offset.y /= textCellH;
            surface.box.left /= textCellW;
            surface.box.top /= textCellH;
            surface.box.right /= textCellW;
            surface.box.bottom /= textCellH;
         }

         surface.unclippedBox = *&surface.box;
         lfbSurface.drawingChar = 219;

         result = true;
      }
      return result;
   }

   void Clip(Display display, Surface surface, Box clip)
   {
      LFBSurface lfbSurface = surface.driverData;
      if(clip != null)
      {
         Box box = clip;

         if(lfbSurface.bitmap.pixelFormat == pixelFormatText)
         {
            box.left /= textCellW;
            box.top /= textCellH;
            box.right /= textCellW;
            box.bottom /= textCellH;
         }
         box.Clip(surface.unclippedBox);
         surface.box = box;
      }
      else
         surface.box = surface.unclippedBox;
   }

   void SetForeground(Display display, Surface surface, ColorAlpha color)
   {
      LFBDisplay lfbDisplay = display ? display.driverData : null;
      LFBSurface lfbSurface = surface.driverData;
      uint index;
      //if(display) color = color & 0xFFFFFF;
      lfbSurface.foregroundRgb = color;

      if(lfbSurface.font && lfbDisplay)
      {
         index = lfbDisplay.rgbLookup[(uint16)(Color555)lfbSurface.foregroundRgb];
         lfbSurface.paletteShades = lfbDisplay.lightTable[index];
      }

      switch(lfbSurface.bitmap.pixelFormat)
      {
         case pixelFormat8:
            if(display)
               lfbSurface.foreground = lfbDisplay.rgbLookup[(uint16)(Color555)color];
            else
               lfbSurface.foreground = BestColorMatch(lfbSurface.bitmap.palette,0,255,color);
            break;
         case pixelFormat444:  lfbSurface.foreground = (Color444)color; break;
         case pixelFormat555:  lfbSurface.foreground = (Color555)color; break;
         case pixelFormat565:  lfbSurface.foreground = (Color565)color; break;
         case pixelFormat888:  lfbSurface.foreground = color; break;
         case pixelFormatRGBA: lfbSurface.foreground = (ColorRGBA)color; break;
         case pixelFormatText:
            if(display)
               lfbSurface.foreground = BestColorMatch(lfbDisplay.bitmap.palette,0,15,color) << 8;
            else
               lfbSurface.foreground = BestColorMatch(lfbSurface.bitmap.palette,0,15,color) << 8;
            break;
      }
   }

   void SetBackground(Display display, Surface surface, ColorAlpha color)
   {
      LFBDisplay lfbDisplay = display ? display.driverData : null;
      LFBSurface lfbSurface = surface.driverData;
      //color = color & 0xFFFFFF;
      switch(lfbSurface.bitmap.pixelFormat)
      {
         case pixelFormat8:
            if(display)
               lfbSurface.background = lfbDisplay.rgbLookup[(uint16)(Color555)color];
            else
               lfbSurface.background = BestColorMatch(lfbSurface.bitmap.palette,0,255,color);
            break;
         case pixelFormat444:  lfbSurface.background = (Color444)color; break;
         case pixelFormat555:  lfbSurface.background = (Color555)color; break;
         case pixelFormat565:  lfbSurface.background = (Color565)color; break;
         case pixelFormat888:  lfbSurface.background = color; break;
         case pixelFormatRGBA: lfbSurface.background = (ColorRGBA)color; break;
         case pixelFormatText:
            if(display)
               lfbSurface.background = BestColorMatch(lfbDisplay.bitmap.palette,0,15,color) << 12;
            else
               lfbSurface.background = BestColorMatch(lfbSurface.bitmap.palette,0,15,color) << 12;
            break;
      }
   }

   ColorAlpha GetPixel(Display display, Surface surface, int x, int y)
   {
      LFBSurface lfbSurface = surface.driverData;
      if(lfbSurface.bitmap.pixelFormat == pixelFormatText)
      {
         x /= textCellW;
         y /= textCellH;
      }
      if((x <= surface.box.right) && (y <= surface.box.bottom) && (x >= surface.box.left) && (y >= surface.box.top))
      {
         x += surface.offset.x;
         y += surface.offset.y;
         if(lfbSurface.bitmap.picture)
         {
            switch(lfbSurface.bitmap.pixelFormat)
            {
               case pixelFormatText:
               case pixelFormat8:
                  if(!lfbSurface.bitmap.palette) return 0;
                  return lfbSurface.bitmap.palette[((byte *)lfbSurface.bitmap.picture)[(uint) y * lfbSurface.bitmap.stride + x]];
               case pixelFormat444:  return ((Color444 *)lfbSurface.bitmap.picture)[(uint) y * lfbSurface.bitmap.stride + x];
               case pixelFormat555:  return ((Color555 *)lfbSurface.bitmap.picture)[(uint) y * lfbSurface.bitmap.stride + x];
               case pixelFormat565:  return ((Color565 *)lfbSurface.bitmap.picture)[(uint) y * lfbSurface.bitmap.stride + x];
               case pixelFormat888:  return ((ColorAlpha *)lfbSurface.bitmap.picture)[(uint) y * lfbSurface.bitmap.stride+x];
            }
         }
      }
      return 0;
   }

   void PutPixel(Display display, Surface surface,int x,int y)
   {
      LFBSurface lfbSurface = surface.driverData;
      if(lfbSurface.bitmap.pixelFormat == pixelFormatText)
      {
         x /= textCellW;
         y /= textCellH;
      }
      if((x <= surface.box.right) && (y <= surface.box.bottom) && (x >= surface.box.left) && (y >= surface.box.top))
      {
         x += surface.offset.x;
         y += surface.offset.y;
         if(lfbSurface.bitmap.picture)
         {
            switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
            {
               case 0:
                  ((byte *)lfbSurface.bitmap.picture)[(uint) y * lfbSurface.bitmap.stride + x] = (byte)lfbSurface.foreground;
                  break;
               case 1:
                  ((uint16 *)lfbSurface.bitmap.picture)[(uint)y * lfbSurface.bitmap.stride + x] = (uint16)lfbSurface.foreground;
                  break;
               case 2:
                  if(((uint32 *)lfbSurface.bitmap.picture)[(uint32) y * lfbSurface.bitmap.stride + x] != (uint32)lfbSurface.foreground)
                     ((uint32 *)lfbSurface.bitmap.picture)[(uint32) y * lfbSurface.bitmap.stride + x] = (uint32)lfbSurface.foreground;
                  break;
            }
         }
      }
   }

   void DrawLine(Display display, Surface surface, int x1, int y1, int x2, int y2)
   {
      LFBSurface lfbSurface = surface.driverData;

      int xd, yd;
      int xu,yu;
      int errorterm;
      uint offset;
      uint color = lfbSurface.foreground;
      uint16 stipple = lfbSurface.stipple ? lfbSurface.stipple : 0xFFFF;
      bool invert = false;
      if(!lfbSurface.bitmap.picture) return;
      if(lfbSurface.bitmap.pixelFormat == pixelFormatText)
      {
         x1 /= textCellW;
         x2 /= textCellW;
         y1 /= textCellH;
         y2 /= textCellH;
         if(surface.textOpacity)
            color |= lfbSurface.background;
         color |= lfbSurface.drawingChar;
      }
      if(y1 == y2)
      {
         if(x1>x2) { int tmp = x2; x2 = x1; x1 = tmp; invert = true; }

         if((y1>surface.box.bottom)||(y1<surface.box.top))return;
         if((x1>surface.box.right)||(x2<surface.box.left))return;
         if(x1<surface.box.left)x1=surface.box.left;
         if(x2>surface.box.right)x2=surface.box.right;

         if(x2 < x1) return;

         offset=(y1+surface.offset.y)*lfbSurface.bitmap.stride+x1+surface.offset.x;
         if(stipple != 0xFFFF)
         {
            int x;
            switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
            {
               case 0:
                  for(x=x1; x<=x2; x++, offset++)
                  {
                     if(stipple & 0x8000)
                        ((byte *)lfbSurface.bitmap.picture)[offset]=(byte)color;
                     if(invert)
                        stipple = ((stipple & 0x7FFF)<<1) | ((stipple & 0x8000)>>15);
                     else
                        stipple = ((stipple & 0xFFFE)>>1) | ((stipple & 0x0001)<<15);
                  }
                  break;
               case 1:
                  for(x=x1; x<=x2; x++, offset++)
                  {
                     if(stipple & 0x8000)
                        ((uint16 *)lfbSurface.bitmap.picture)[offset] = (uint16)color;
                     if(invert)
                        stipple = ((stipple & 0x7FFF)<<1) | ((stipple & 0x8000)>>15);
                     else
                        stipple = ((stipple & 0xFFFE)>>1) | ((stipple & 0x0001)<<15);
                  }
                  break;
               case 2:
                  for(x=x1; x<=x2; x++, offset++)
                  {
                     if(stipple & 0x8000)
                        ((uint32 *)lfbSurface.bitmap.picture)[offset] = color;
                     if(invert)
                        stipple = ((stipple & 0x7FFF)<<1) | ((stipple & 0x8000)>>15);
                     else
                        stipple = ((stipple & 0xFFFE)>>1) | ((stipple & 0x0001)<<15);
                  }
                  break;
            }
         }
         else
         {
            if(lfbSurface.bitmap.pixelFormat != pixelFormatText || surface.textOpacity)
            {
               switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
               {
                  case 0: FillBytes(((byte *)lfbSurface.bitmap.picture)+offset,(byte)color,x2-x1+1); break;
                  case 1: FillBytesBy2(((uint16 *)lfbSurface.bitmap.picture)+offset,(uint16)color,x2-x1+1); break;
                  case 2: FillBytesBy4(((uint32 *)lfbSurface.bitmap.picture)+offset,color,x2-x1+1); break;
               }
            }
            else
            {
               int x;
               for(x = x1; x <= x2; x++, offset++)
               {
                  ((uint16 *)lfbSurface.bitmap.picture)[offset] =
                     (((uint16 *)lfbSurface.bitmap.picture)[offset] & 0xF000) | (uint16)color;
               }
            }
         }
      }
      else if(x1 == x2)
      {
         int y;

         if(y1>y2) { int tmp = y2; y2 = y1; y1 = tmp; invert = true; }

         if((x1>surface.box.right)||(x1<surface.box.left))return;
         if((y1>surface.box.bottom)||(y2<surface.box.top))return;
         if(y1<surface.box.top)y1=surface.box.top;
         if(y2>surface.box.bottom)y2=surface.box.bottom;

         offset=(y1+surface.offset.y)*lfbSurface.bitmap.stride+x1+surface.offset.x;
         switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
         {
            case 0:
               for(y=y1; y<=y2; y++, offset+=lfbSurface.bitmap.stride)
               {
                  if(stipple & 0x8000)
                     ((byte *)lfbSurface.bitmap.picture)[offset]=(byte)color;
                  if(invert)
                     stipple = ((stipple & 0x7FFF)<<1) | ((stipple & 0x8000)>>15);
                  else
                     stipple = ((stipple & 0xFFFE)>>1) | ((stipple & 0x0001)<<15);
               }
               break;
            case 1:
               for(y=y1; y<=y2; y++, offset+=lfbSurface.bitmap.stride)
               {
                  if(stipple & 0x8000)
                  {
                     if(lfbSurface.bitmap.pixelFormat != pixelFormatText || surface.textOpacity)
                        ((uint16 *)lfbSurface.bitmap.picture)[offset]=(uint16)color;
                     else
                     {
                        ((uint16 *)lfbSurface.bitmap.picture)[offset] =
                           (((uint16 *)lfbSurface.bitmap.picture)[offset] & 0xF000) | (uint16)color;
                     }
                  }
                  if(invert)
                     stipple = ((stipple & 0x7FFF)<<1) | ((stipple & 0x8000)>>15);
                  else
                     stipple = ((stipple & 0xFFFE)>>1) | ((stipple & 0x0001)<<15);
               }
               break;
            case 2:
               if(stipple != 0xFFFF)
               {
                  for(y=y1; y<=y2; y++, offset+=lfbSurface.bitmap.stride)
                  {
                     if(stipple & 0x8000)
                        ((uint32*)lfbSurface.bitmap.picture)[offset]=color;
                     if(invert)
                        stipple = ((stipple & 0x7FFF)<<1) | ((stipple & 0x8000)>>15);
                     else
                        stipple = ((stipple & 0xFFFE)>>1) | ((stipple & 0x0001)<<15);
                  }
               }
               else
               {
                  for(y=y1; y<=y2; y++, offset+=lfbSurface.bitmap.stride)
                     ((uint32*)lfbSurface.bitmap.picture)[offset]=color;
               }
               break;
         }
      }
      else
      {
         if(x2 >= x1)
         {
            if(x1 < surface.box.left)
            {
               if(x2 < surface.box.left)
                  return;
               y1 += (y2 - y1) * (surface.box.left - x1) / (x2 - x1);
               x1 = surface.box.left;
            }
            if(x2 > surface.box.right)
            {
               if(x1 > surface.box.right)
                  return;
               y2 -= (y2 - y1) * (x2 - surface.box.right) / (x2 - x1);
               x2 = surface.box.right;
            }
            if(y2 >= y1)
            {
               if(y1 < surface.box.top)
               {
                  if(y2 < surface.box.top)
                     return;
                  x1 += (x2 - x1) * (surface.box.top - y1) / (y2 - y1);
                  y1 = surface.box.top;
               }
               if(y2 > surface.box.bottom)
               {
                  if(y1 > surface.box.bottom)
                     return;
                  x2 -= (x2 - x1) * (y2 - surface.box.bottom) / (y2 - y1);
                  y2 = surface.box.bottom;
               }
            }
            else
            {
               if(y1 > surface.box.bottom)
               {
                  if(y2 > surface.box.bottom)
                     return;
                  x1 -= (x1 - x2) * (y1 - surface.box.bottom) / (y1 - y2);
                  y1 = surface.box.bottom;
               }
               if(y2 < surface.box.top)
               {
                  if(y1 < surface.box.top)
                     return;
                  x2 += (x1 - x2) * (surface.box.top - y2) / (y1 - y2);
                  y2 = surface.box.top;
               }
            }
         }
         else
         {
            if(x1 > surface.box.right)
            {
               if(x2 > surface.box.right)
                  return;
               y1 -= (y1 - y2) * (x1 - surface.box.right) / (x1 - x2);
               x1 = surface.box.right;
            }
            if(x2 < surface.box.left)
            {
               if(x1 < surface.box.left)
                  return;
               y2 += (y1 - y2) * (surface.box.left - x2) / (x1 - x2);
               x2 = surface.box.left;
            }
            if(y2 >= y1)
            {
               if(y1 < surface.box.top)
               {
                  if(y2 < surface.box.top)
                     return;
                  x1 += (x2 - x1) * (surface.box.top - y1) / (y2 - y1);
                  y1 = surface.box.top;
               }
               if(y2 > surface.box.bottom)
               {
                  if(y1 > surface.box.bottom)
                     return;
                  x2 -= (x2 - x1) * (y2 - surface.box.bottom) / (y2 - y1);
                  y2 = surface.box.bottom;
               }
            }
            else
            {
               if(y1 > surface.box.bottom)
               {
                  if(y2 > surface.box.bottom)
                     return;
                  x1 -= (x1 - x2) * (y1 - surface.box.bottom) / (y1 - y2);
                  y1 = surface.box.bottom;
               }
               if(y2 < surface.box.top)
               {
                  if(y1 < surface.box.top)
                     return;
                  x2 += (x1 - x2) * (surface.box.top - y2) / (y1 - y2);
                  y2 = surface.box.top;
               }
            }
         }

         xd=x2-x1;
         yd=y2-y1;

         if(xd<0)
         {
            xd=-xd;
            xu=-1;
         }
         else
            xu=1;
         if(yd<0)
         {
            yd=-yd;
            yu=-(int)lfbSurface.bitmap.stride;
         }
         else
            yu=lfbSurface.bitmap.stride;

         offset=(y1+surface.offset.y)*lfbSurface.bitmap.stride+x1+surface.offset.x;
         errorterm=0;

         if(xd>yd)
         {
            int i, length=xd;
            for(i=0; i<=length; i++)
            {
               if(stipple & 0x8000)
                  switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
                  {
                     case 0: ((byte *)lfbSurface.bitmap.picture)[offset]=(byte)color; break;
                     case 1: ((uint16 *)lfbSurface.bitmap.picture)[offset]=(uint16)color; break;
                     case 2: ((uint32*)lfbSurface.bitmap.picture)[offset]=(uint32)color; break;
                  }
               offset+=xu;
               errorterm+=yd;
               if(errorterm>=xd)
               {
                  errorterm-=xd;
                  offset+=yu;
               }
               stipple = ((stipple & 0x7FFF)<<1) | ((stipple & 0x8000)>>15);
            }
         }
         else
         {
            int i, length=yd;
            for(i=0; i<=length; i++)
            {
               if(stipple & 0x8000)
                  switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
                  {
                     case 0: ((byte *)lfbSurface.bitmap.picture)[offset]=(byte)color; break;
                     case 1: ((uint16 *)lfbSurface.bitmap.picture)[offset]=(uint16)color; break;
                     case 2: ((uint32*)lfbSurface.bitmap.picture)[offset]=(uint32)color; break;
                  }
               offset+=yu;
               errorterm+=xd;
               if(errorterm>=yd)
               {
                  errorterm-=yd;
                  offset+=xu;
               }
            }
         }
      }
   }

   void Rectangle(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      DrawLine(display, surface,x1,y1,x2,y1);
      DrawLine(display, surface,x2,y1,x2,y2);
      DrawLine(display, surface,x2,y2,x1,y2);
      DrawLine(display, surface,x1,y2,x1,y1);
   }

   #if !defined(__GNUC__)
   /*
   void memset_32_aligned(void *buf, int val, int dwords)
   {
            // Qword align
            if ((int)(buf) & 4)
            {
                    *((uint32 *)(buf)) = val;
                    buf = ((uint32 *)(buf))+1;
                    dwords--;
            }

            if (dwords > 1)
            {
                    __asm {
                            cld
                            mov   edi,  buf
                            mov   ecx,  dwords
                            shr       ecx,  1
                            mov   eax,  val
                            movd  mm0,  eax
                            movd  mm1,  eax
                            psllq mm1,  32
                            por   mm0,  mm1
                            align 16
            repeat:
                            movq [edi], mm0
                            add   edi,  8
                            loop  repeat
                            emms
                    };
            }

            // Final dword
            if (dwords & 1) *((int*)(buf)) = val;
   }*/

   //#define USE_SSE

/*
   void memset_32_aligned(uint32 *buf, uint32 val, uint32 dwords)
   {
      dwords <<= 2;
   #ifdef USE_SSE
      if(((uint32)buf) & 0x7F)
      {
         for( ; ((uint32)buf) & 0x7F && dwords; buf++)
         {
            *buf = val;
            dwords--;
         }
      }
      if(dwords)
   #endif
      __asm
      {
         mov edi, buf
         mov eax, val
         mov ecx, dwords

         mov edx,ecx
   #ifdef USE_SSE
         shr ecx,7
   #else
         shr ecx,6
   #endif
         mov ebx,ecx
   #ifdef USE_SSE
         shl ebx,7
   #else
         shl ebx,6
   #endif
         sub edx,ebx				; edx holds # of overflow bytes

   #ifdef USE_SSE
   	   mov [edi],eax
   	   mov [edi+4],eax
         mov [edi+8],eax
         mov [edi+12],eax
         movdqa xmm0, [edi]
   #else
         mov [edi],eax
   	   mov [edi+4],eax
         movq mm0, [edi]
   #endif
   	   cmp ecx,0
   	   je doneloop
   setloop:

   #ifdef USE_SSE
         movdqa [edi],xmm0
         movdqa [edi+16],xmm0
         movdqa [edi+32],xmm0
         movdqa [edi+48],xmm0
         movdqa [edi+64],xmm0
         movdqa [edi+80],xmm0
         movdqa [edi+96],xmm0
         movdqa [edi+112],xmm0
         add edi,8*16
   #else
         movq [edi],mm0
         movq [edi+8],mm0
         movq [edi+16],mm0
         movq [edi+24],mm0
         movq [edi+32],mm0
         movq [edi+40],mm0
         movq [edi+48],mm0
         movq [edi+56],mm0
         add edi,8*8
   #endif
         dec ecx
   	   jnz setloop

   doneloop:
   	   mov ecx,edx
   	   shr ecx,2
   	   rep stosd

   	   emms
      };
   }
   void memset_32(void *buf, uint32 val, uint32 dwords)
   {
      int align = 0;
      if ((uint32)(buf) & 3)
      {
         align = 4;
         dwords--;

         if (((uint32)(buf) & 1))
         {
            *(byte *)(buf) = (byte)(val&0xFF);
            buf = ((byte *)(buf))+1;
            val = ((val& 0xFF) << 24) || ((val& 0xFFFFFF00) >> 8);
            align --;
         }
         if (((uint32)(buf) & 2))
         {
            *(uint16 *)(buf) = (uint16)(val&0xFFFF);
            buf = ((uint16 *)(buf))+1;
            val = ((val& 0xFFFF) << 16) || ((val& 0xFFFF0000) >> 16);
            align-=2;
         }
      }
      memset_32_aligned(buf,val,dwords);
      if (align)
      {
         if (align == 1)
         {
            *(byte *)(buf) = (byte)(val&0xFF);
         }
         else
         {
            *(uint16 *)(buf) = (uint16)(val&0xFFFF);
            if (align & 1) *((byte *)(buf)+2) = (byte)((val>>16)&0xFF);
         }
      }
   }
   */
   #endif

   void Area(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      LFBSurface lfbSurface = surface.driverData;
      uint32 color = lfbSurface.background;

      if(lfbSurface.bitmap.pixelFormat == pixelFormatText)
      {
         color |= lfbSurface.foreground | lfbSurface.drawingChar;
         x1 /= textCellW;
         x2 /= textCellW;
         y1 /= textCellH;
         y2 /= textCellH;
      }
      if(x1>x2) { int tmp = x2; x2 = x1; x1 = tmp; }

      if(x1<surface.box.left)  x1=surface.box.left;
      if(x2>surface.box.right) x2=surface.box.right;
      if(y1<surface.box.top)   y1=surface.box.top;
      if(y2>surface.box.bottom)  y2=surface.box.bottom;

      if(x2>=x1 && y2>=y1)
      {
         int w,y;
         byte * theOffset;

         w = x2-x1+1;
         if(w<1) return;

         x1 += surface.offset.x;
         x2 += surface.offset.x;
         y1 += surface.offset.y;
         y2 += surface.offset.y;
         if(lfbSurface.bitmap.picture)
         {
            if(!surface.writeColor)
            {
               ColorAlpha * picture = (((ColorAlpha *)lfbSurface.bitmap.picture) + y1 * lfbSurface.bitmap.stride + x1);
               for(y = y1; y<= y2; y++)
               {
                  int c;
                  for(c = 0; c < w; c++, picture++)
                     if(!picture->a)
                        picture->a = (byte)((color & 0xFF000000) >> 24);
                  picture += lfbSurface.bitmap.stride - w;
               }
            }
            else
            {
               if(!surface.blend || surface.background.a == 255 || lfbSurface.clearing)
               {
                  switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
                  {
                     case 0:
                        theOffset = ((byte *)lfbSurface.bitmap.picture) + y1 * lfbSurface.bitmap.stride + x1;
                        for(y = y1; y<= y2; y++)
                        {
                           FillBytes(theOffset,(byte)color,w);
                           theOffset += lfbSurface.bitmap.stride;
                        }
                        break;
                     case 1:
                        theOffset = (byte *) (((uint16 *)lfbSurface.bitmap.picture) + y1 * lfbSurface.bitmap.stride + x1);
                        for(y = y1; y<= y2; y++)
                        {
                           FillBytesBy2((uint16 *) theOffset,(uint16)color,w);
                           theOffset += lfbSurface.bitmap.stride * sizeof(uint16);
                        }
                        break;
                     case 2:
                        theOffset = (byte *) (((uint32 *)lfbSurface.bitmap.picture) + y1 * lfbSurface.bitmap.stride + x1);
                        for(y = y1; y<= y2; y++)
                        {
         #if defined(__GNUC__)
                           FillBytesBy4((uint32 *) theOffset,color,w);
         #else
                           memset_32((uint32 *) theOffset,color,w);
         #endif
                           theOffset += lfbSurface.bitmap.stride * sizeof(uint32);

                        }
                        /*
                        y = y2-y1+1;
                        {
                           int bla = (lfbSurface.bitmap.stride - w) * sizeof(uint32);
                           //memset_32((uint32 *) theOffset,color,w);
                           /-*_asm
                           {
                              push edi
                              push ecx
                              push eax
                              push ebx
                              push edx

                              mov ebx,bla

                              mov edi,theOffset
                              mov eax,color
                              mov edx,y
                              mov ecx,w

                              start:
                                 push ecx

                                 rep stosd
                                 add edi,ebx
                                 pop ecx
                                 dec edx
                                 jnz start
                              pop edx
                              pop ebx
                              pop eax
                              pop ecx
                              pop edi
                           };
                        break;
                        }*/
                  }
               }
               else
               {
                  switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
                  {
                     case 0:
                        theOffset = ((byte *)lfbSurface.bitmap.picture) + y1 * lfbSurface.bitmap.stride + x1;
                        for(y = y1; y<= y2; y++)
                        {
                           // TODO: IMPLEMENT THIS
                           FillBytes(theOffset,(byte)color,w);
                           theOffset += lfbSurface.bitmap.stride;
                        }
                        break;
                     case 1:
                     {
                        uint16 * dest = (((uint16 *)lfbSurface.bitmap.picture) + y1 * lfbSurface.bitmap.stride + x1);
                        ColorAlpha c = surface.background;
                        int a = c.a;
                        int cr = c.color.r;
                        int cg = c.color.g;
                        int cb = c.color.b;
                        PixelFormat pixelFormat = lfbSurface.bitmap.pixelFormat;

                        for(y = y1; y <= y2; y++)
                        {
                           int c;
                           for(c = 0; c < w; c++, dest++)
                           {
                              Color destColor = 0;
                              if(pixelFormat == pixelFormat565)      { destColor = (Color)*(Color565 *)dest; }
                              else if(pixelFormat == pixelFormat555) { destColor = (Color)*(Color555 *)dest; }
                              else if(pixelFormat == pixelFormat444) { destColor = (Color)*(Color444 *)dest; }
                              {
                                 int r = a * cr / 255 + ((255 - a) * destColor.r / 255);
                                 int g = a * cg / 255 + ((255 - a) * destColor.g / 255);
                                 int b = a * cb / 255 + ((255 - a) * destColor.b / 255);

                                 if(r > 255) r = 255;
                                 if(g > 255) g = 255;
                                 if(b > 255) b = 255;

                                 destColor = { (byte)r, (byte)g, (byte)b };

                                 if(pixelFormat == pixelFormat565)      { *dest = (Color565)destColor; }
                                 else if(pixelFormat == pixelFormat555) { *dest = (Color555)destColor; }
                                 else if(pixelFormat == pixelFormat444) { *dest = (Color444)destColor; }
                              }
                           }
                           dest += (lfbSurface.bitmap.stride - w);
                        }
                        break;
                     }
                     case 2:
                     {
                        ColorAlpha * dest = (ColorAlpha *)(((uint32 *)lfbSurface.bitmap.picture) + y1 * lfbSurface.bitmap.stride + x1);
                        AlphaWriteMode alphaWrite = surface.alphaWrite;
                        ColorAlpha c = surface.background;
                        int a = c.a;
                        int cr = c.color.r;
                        int cg = c.color.g;
                        int cb = c.color.b;
                        for(y = y1; y <= y2; y++)
                        {
                           int c;
                           for(c = 0; c < w; c++, dest++)
                           {
                              int dr = dest->color.r;
                              int dg = dest->color.g;
                              int db = dest->color.b;
                              int r = a * cr / 255 + ((255 - a) * dr / 255);
                              int g = a * cg / 255 + ((255 - a) * dg / 255);
                              int b = a * cb / 255 + ((255 - a) * db / 255);

                              if(r > 255) r = 255;
                              if(g > 255) g = 255;
                              if(b > 255) b = 255;
                              dest->color = { (byte)r, (byte)g, (byte)b };

                              if(alphaWrite == blend)
                              {
                                 int ca = (int)(a + ((255 - a) * dest->a / 255));
                                 if(ca > 255) ca = 255;
                                 dest->a = (byte)ca;
                              }
                              else if(alphaWrite)
                                 dest->a = (byte)a;
                           }
                           dest += (lfbSurface.bitmap.stride - w);
                        }
                     }
                  }
               }
            }
         }
      }
   }
   void Clear(Display display, Surface surface, ClearType type)
   {
      LFBSurface lfbSurface = surface.driverData;

      lfbSurface.clearing = true;
      if(surface.offset.x == 0 && surface.offset.y == 0 &&
         surface.box.left == 0 && surface.box.top  == 0 &&
         surface.box.right == surface.width-1 &&
         surface.box.bottom  == surface.height-1)
      {
         uint32 color = /*0xFF000000 | */lfbSurface.background;
         if(type != depthBuffer)
         {
            if(lfbSurface.bitmap.stride != surface.width)
               Area(display, surface,surface.box.left,surface.box.top,surface.box.right,surface.box.bottom);
            else
            {
               switch(GetColorDepthShifts(lfbSurface.bitmap.pixelFormat))
               {
                  case 0:
                     FillBytes(lfbSurface.bitmap.picture, (byte)color, lfbSurface.bitmap.size);
                     break;
                  case 1: FillBytesBy2((uint16 *)lfbSurface.bitmap.picture, (uint16)color, lfbSurface.bitmap.size); break;
                  case 2: FillBytesBy4((uint32 *)lfbSurface.bitmap.picture, color, lfbSurface.bitmap.size); break;
               }
            }
         }
   /*
         if((flags & CLEAR_Z) && zbuffer)
            FillBytesBy4((DWORD *)zbuffer,0,(sizeof(float)*(DWORD)display.width * display.Height)>>2);
   */
      }
      else
      {
         if(type != depthBuffer)
            Area(display, surface,surface.box.left,surface.box.top,surface.box.right,surface.box.bottom);
   /*
         if((flags & CLEAR_Z))
         {
            int y;
            uint32 w = surface.box.right-surface.box.left+1;
            float * offset = zbuffer + ((surface.box.top +surface.offset.y) * (DWORD)DISPLAY.Width)
                             +   surface.box.left+surface.offset.x;
            for(y = surface.box.top; y<= surface.box.bottom; y++)
            {
               FillBytesBy4((uint32 *) offset,0,(sizeof(float)>>2)*w);
               offset += DISPLAY.Width;
            }
         }
   */
      }
      lfbSurface.clearing = false;
   }

   void Blit(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h)
   {
      LFBSurface lfbSurface = surface.driverData;
      bool flip = false;

      if(surface.box.right < surface.box.left || surface.box.bottom < surface.box.top || !src.picture) return;

      if(w < 0) { w = -w; flip = true; }

      //Clip against the edges of the source
      if(sx<0)
      {
         dx+=-sx;
         w-=-sx;
         sx=0;
      }
      if(sy<0)
      {
         dy+=0-sy;
         h-=0-sy;
         sy=0;
      }
      if(sx+w>src.width-1)
         w-=sx+w-(src.width-1)-1;
      if(sy+h>src.height-1)
         h-=sy+h-(src.height-1)-1;
      //Clip against the edges of the destination
      if(dx<surface.box.left)
      {
         if(!flip) sx+=surface.box.left-dx;
         w-=surface.box.left-dx;
         dx=surface.box.left;
      }
      if(dy<surface.box.top)
      {
         sy+=surface.box.top-dy;
         h-=surface.box.top-dy;
         dy=surface.box.top;
      }
      if((dx+w)>surface.box.right)
      {
         if(flip) sx+=(uint32)(dx+w)-surface.box.right-1;
         w-=((uint32)(dx+w)-surface.box.right-1);
      }
      if((dy+h)>surface.box.bottom)
         h-=((dy+h)-surface.box.bottom-1);
      if((w<=0)||(h<=0))
         return;

      dx += surface.offset.x;
      dy += surface.offset.y;

      if(lfbSurface.bitmap.picture)
      {
         AlphaWriteMode alphaWrite = surface.alphaWrite;
         if(src.alphaBlend && surface.blend)
         {
            int x, y;
            if(src.pixelFormat == pixelFormatAlpha)
            {
               if(lfbSurface.bitmap.pixelFormat == pixelFormat888)
               {
                  ColorAlpha * picture = ((ColorAlpha *)lfbSurface.bitmap.picture) + (lfbSurface.bitmap.stride * dy) + dx;
                  byte * source = ((byte *)src.picture) + (src.stride * sy) + sx;
                  ColorAlpha color = lfbSurface.writingText ? surface.foreground : surface.blitTint;
                  for(y = 0; y < h; y++)
                  {
                     for(x = 0; x < w; x++, picture++, source++)
                     {
                        int a = *source * color.a;
                        ColorAlpha dest = *picture;
                        int r = (a * color.color.r + ((255 * 255 - a) * dest.color.r)) / (255 * 255);
                        int g = (a * color.color.g + ((255 * 255 - a) * dest.color.g)) / (255 * 255);
                        int b = (a * color.color.b + ((255 * 255 - a) * dest.color.b)) / (255 * 255);
                        if(r > 255) r = 255;
                        if(g > 255) g = 255;
                        if(b > 255) b = 255;
                        picture->color = { (byte)r, (byte)g, (byte)b };
                        if(alphaWrite == blend)
                        {
                           int ca = (a * 255 + (255 * 255 - a) * dest.a) / (255 * 255);
                           if(ca > 255) ca = 255;
                           picture->a = (byte)ca;
                        }
                        else if(alphaWrite)
                           picture->a = (byte)(a / 255);
                     }
                     picture += lfbSurface.bitmap.stride - w;
                     source += src.stride - w;
                  }
               }
               else if(lfbSurface.bitmap.pixelFormat == pixelFormat555)
               {
                  Color555 * picture = ((Color555 *)lfbSurface.bitmap.picture) + (lfbSurface.bitmap.stride * dy) + dx;
                  byte * source = ((byte *)src.picture) + (src.stride * sy) + sx;
                  ColorAlpha color = lfbSurface.writingText ? surface.foreground : surface.blitTint;
                  for(y = 0; y < h; y++)
                  {
                     for(x = 0; x < w; x++, picture++, source++)
                     {
                        int a = *source * color.a;
                        Color dest = *picture;
                        int r = (a * color.color.r + ((255 * 255 - a) * dest.r)) / (255 * 255);
                        int g = (a * color.color.g + ((255 * 255 - a) * dest.g)) / (255 * 255);
                        int b = (a * color.color.b + ((255 * 255 - a) * dest.b)) / (255 * 255);
                        if(r > 255) r = 255;
                        if(g > 255) g = 255;
                        if(b > 255) b = 255;
                        *picture = Color { (byte)r, (byte)g, (byte)b };
                     }
                     picture += lfbSurface.bitmap.stride - w;
                     source += src.stride - w;
                  }
               }
               else if(lfbSurface.bitmap.pixelFormat == pixelFormat565)
               {
                  Color565 * picture = ((Color565 *)lfbSurface.bitmap.picture) + (lfbSurface.bitmap.stride * dy) + dx;
                  byte * source = ((byte *)src.picture) + (src.stride * sy) + sx;
                  ColorAlpha color = lfbSurface.writingText ? surface.foreground : surface.blitTint;
                  for(y = 0; y < h; y++)
                  {
                     for(x = 0; x < w; x++, picture++, source++)
                     {
                        int a = *source * color.a;
                        Color dest = *picture;
                        int r = (a * color.color.r + ((255 * 255 - a) * dest.r)) / (255 * 255);
                        int g = (a * color.color.g + ((255 * 255 - a) * dest.g)) / (255 * 255);
                        int b = (a * color.color.b + ((255 * 255 - a) * dest.b)) / (255 * 255);
                        if(r > 255) r = 255;
                        if(g > 255) g = 255;
                        if(b > 255) b = 255;
                        *picture = Color { (byte)r, (byte)g, (byte)b };
                     }
                     picture += lfbSurface.bitmap.stride - w;
                     source += src.stride - w;
                  }
               }
            }
            else
            {
               ColorAlpha * source = ((ColorAlpha *)src.picture) + (src.stride * sy) + sx;
               if(lfbSurface.bitmap.pixelFormat == pixelFormat888)
               {
                  ColorAlpha * picture = ((ColorAlpha *)lfbSurface.bitmap.picture) + (lfbSurface.bitmap.stride * dy) + dx;
                  for(y = 0; y < h; y++)
                  {
                     for(x = 0; x < w; x++, picture++, source++)
                     {
                        ColorAlpha src = *source;
                        ColorAlpha dest = *picture;
                        int r = src.a * src.color.r / 255 + ((255 - src.a) * dest.color.r / 255);
                        int g = src.a * src.color.g / 255 + ((255 - src.a) * dest.color.g / 255);
                        int b = src.a * src.color.b / 255 + ((255 - src.a) * dest.color.b / 255);
                        if(r > 255) r = 255;
                        if(g > 255) g = 255;
                        if(b > 255) b = 255;
                        picture->color = { (byte)r, (byte)g, (byte)b };
                        if(alphaWrite == blend)
                        {
                           int a = src.a + ((255 - src.a) * dest.a / 255);
                           if(a > 255) a = 255;
                           picture->a = (byte)a;
                        }
                        else if(alphaWrite)
                           picture->a = src.a;
                     }
                     picture += lfbSurface.bitmap.stride - w;
                     source += src.stride - w;
                  }
               }
               else if(lfbSurface.bitmap.pixelFormat == pixelFormat565)
               {
                  Color565 * picture = ((Color565 *)lfbSurface.bitmap.picture) + (lfbSurface.bitmap.stride * dy) + dx;
                  for(y = 0; y < h; y++)
                  {
                     for(x = 0; x < w; x++, picture++, source++)
                     {
                        ColorAlpha src = *source;
                        Color565 dest = *picture;
                        int r = src.a * src.color.r * 31 / 255 + ((255 - src.a) * dest.r);
                        int g = src.a * src.color.g * 63 / 255 + ((255 - src.a) * dest.g);
                        int b = src.a * src.color.b * 31 / 255 + ((255 - src.a) * dest.b);
                        if(r > 255 * 31) r = 255 * 31;
                        if(g > 255 * 63) g = 255 * 63;
                        if(b > 255 * 31) b = 255 * 31;
                        *picture = { (byte)(r / 255), (byte)(g / 255), (byte)(b / 255) };
                     }
                     picture += lfbSurface.bitmap.stride - w;
                     source += src.stride - w;
                  }
               }
               else if(lfbSurface.bitmap.pixelFormat == pixelFormat555)
               {
                  Color555 * picture = ((Color555 *)lfbSurface.bitmap.picture) + (lfbSurface.bitmap.stride * dy) + dx;
                  for(y = 0; y < h; y++)
                  {
                     for(x = 0; x < w; x++, picture++, source++)
                     {
                        ColorAlpha psrc = *source;
                        Color555 dest = *picture;
                        int r = psrc.a * psrc.color.r * 31 / 255 + ((255 - psrc.a) * dest.r);
                        int g = psrc.a * psrc.color.g * 31 / 255 + ((255 - psrc.a) * dest.g);
                        int b = psrc.a * psrc.color.b * 31 / 255 + ((255 - psrc.a) * dest.b);
                        if(r > 255 * 31) r = 255 * 31;
                        if(g > 255 * 31) g = 255 * 31;
                        if(b > 255 * 31) b = 255 * 31;
                        *picture = { (byte)(r / 255), (byte)(g / 255), (byte)(b / 255) };
                     }
                     picture += lfbSurface.bitmap.stride - w;
                     source += src.stride - w;
                  }
               }
            }
         }
         else if(src.paletteShades)
            shades_blit_table[lfbSurface.bitmap.pixelFormat][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h);
         else if(src.pixelFormat == lfbSurface.bitmap.pixelFormat)
            blits_table[lfbSurface.bitmap.pixelFormat][src.transparent][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h);
         else if(src.pixelFormat == pixelFormat8)
            blits_8bit_table[lfbSurface.bitmap.pixelFormat][src.transparent][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h);
      }
   }

   bool GrabScreen(Display display, Bitmap bitmap, int x, int y, unsigned int w, unsigned int h)
   {
      bool result = false;
      LFBDisplay lfbDisplay = display.driverData;

      if(bitmap.pixelFormat != lfbDisplay.bitmap.pixelFormat || bitmap.width < w || bitmap.height < h)
      {
         bitmap.Free();
         bitmap.Allocate(null, w,h,w, lfbDisplay.bitmap.pixelFormat,
            (lfbDisplay.bitmap.pixelFormat == pixelFormat8)?true:false);
      }
      if(bitmap)
      {
         Surface surface = bitmap.GetSurface(0,0,null);
         if(surface)
         {
            Blit(display, surface, lfbDisplay.bitmap, 0,0,x,y,w,h);
            if(bitmap.palette && lfbDisplay.bitmap.pixelFormat == pixelFormat8 && lfbDisplay.bitmap.palette)
               CopyBytesBy4(bitmap.palette, lfbDisplay.bitmap.palette, 256);
            delete surface;
         }
         result = true;
      }
      return result;
   }

   void Stretch(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      LFBSurface lfbSurface = surface.driverData;
      bool flip = false;

      float s2dw,s2dh,d2sw,d2sh;

      if(surface.box.right < surface.box.left || surface.box.bottom < surface.box.top || !src.picture) return;

      if(Sgn(w) != Sgn(sw))
      {
         w = Abs(w);
         sw = Abs(sw);
         flip = true;
      }

      s2dw=(float)w / sw;
      s2dh=(float)h / sh;
      d2sw=(float)sw / w;
      d2sh=(float)sh / h;

      //Clip against the edges of the source
      if(sx<0)
      {
         dx+=(int)((0-sx) * s2dw);
         w-=(int)((0-sx) * s2dw);
         sw-=0-sx;
         sx=0;
      }
      if(sy<0)
      {
         dy+=(int)((0-sy) * s2dh);
         h-=(int)((0-sy) * s2dh);

         sh-=0-sy;
         sy=0;
      }
      if(sx+sw>src.width-1)
      {
         w-=(int)((sx+sw-(src.width-1)-1)*s2dw);
         sw-=sx+sw-(src.width-1)-1;
      }
      if(sy+sh>(src.height-1))
      {
         h-=(int)((sy+sh-(src.height-1)-1)*s2dh);
         sh-=sy+sh-(src.height-1)-1;
      }
      //Clip against the edges of the destination
      if(dx<surface.box.left)
      {
         if(!flip) sx+=(int)((surface.box.left-dx)*d2sw);
         sw-=(int)((surface.box.left-dx)*d2sw);
         w-=surface.box.left-dx;
         dx=surface.box.left;
      }
      if(dy<surface.box.top)
      {
         sy+=(int)((surface.box.top-dy)*d2sh);
         sh-=(int)((surface.box.top-dy)*d2sh);
         h-=surface.box.top-dy;
         dy=surface.box.top;
      }
      if((dx+w)>surface.box.right)
      {
         if(flip) sx+=(int)(((dx+w)-surface.box.right-1)*d2sw);
         sw-=(int)(((dx+w)-surface.box.right-1)*d2sw);
         w-=((dx+w)-surface.box.right-1);
      }
      if((dy+h)>surface.box.bottom)
      {
         sh-=(int)(((dy+h)-surface.box.bottom-1)*d2sh);
         h-=((dy+h)-surface.box.bottom-1);
      }
      if((w<=0)||(h<=0)||(sw<=0)||(sh<=0)) return;

      dx+=surface.offset.x;
      dy+=surface.offset.y;

      if(lfbSurface.bitmap.picture)
      {
         AlphaWriteMode alphaWrite = surface.alphaWrite;
         if(src.alphaBlend && surface.blend)
         {
            int x, y;
            uint xerr,yerr;
            uint adddest = lfbSurface.bitmap.stride, addsource = src.stride;
            ColorAlpha * backsrc;
            ColorAlpha * source = ((ColorAlpha *) src.picture) + sy * addsource + sx;
            ColorAlpha * dest = ((ColorAlpha *) lfbSurface.bitmap.picture) + dy * adddest   + dx;
            if(flip) source += sw-1;
            adddest -= w;
            yerr = 0;
            for(y=0; y<sh; y++)
            {
               yerr+=h;
               backsrc = source;
               while(yerr >= sh)
               {
                  yerr-=sh;
                  xerr = 0;
                  for(x=0; x<sw; x++)
                  {
                     xerr+=w;
                     while(xerr>=sw)
                     {
                        xerr-=sw;
                        {
                           ColorAlpha src = *source;
                           ColorAlpha dst = *dest;
                           int r = src.a * src.color.r / 255 + ((255 - src.a) * dst.color.r / 255);
                           int g = src.a * src.color.g / 255 + ((255 - src.a) * dst.color.g / 255);
                           int b = src.a * src.color.b / 255 + ((255 - src.a) * dst.color.b / 255);
                           if(r > 255) r = 255;
                           if(g > 255) g = 255;
                           if(b > 255) b = 255;
                           dest->color = { (byte)r, (byte)g, (byte)b };
                           if(alphaWrite == blend)
                           {
                              int a = src.a + ((255 - src.a) * dst.a / 255);
                              if(a > 255) a = 255;
                              dest->a = (byte)a;
                           }
                           else if(alphaWrite)
                              dest->a = src.a;
                        }
                        dest++;
                     }
                     source ++;
                  }
                  dest+=adddest;
                  source = backsrc;
               }
               source += addsource;
            }
         }
         else if(src.paletteShades)
            shades_stretch_table[lfbSurface.bitmap.pixelFormat][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h,sw,sh);
         else if(src.pixelFormat == lfbSurface.bitmap.pixelFormat)
            stretches_table[lfbSurface.bitmap.pixelFormat][src.transparent][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h,sw,sh);
         else if(src.pixelFormat == pixelFormat8 && lfbSurface.bitmap.pixelFormat != pixelFormatText)
            stretches_8bit_table[lfbSurface.bitmap.pixelFormat][src.transparent][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h,sw,sh);
      }
   }

   void Filter(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      LFBSurface lfbSurface = surface.driverData;
      bool flip = false;

      float s2dw,s2dh,d2sw,d2sh;

      if(surface.box.right < surface.box.left || surface.box.bottom < surface.box.top || !src.picture) return;

      if(Sgn(w) != Sgn(sw))
      {
         w = Abs(w);
         sw = Abs(sw);
         flip = true;
      }

      s2dw=(float)w / sw;
      s2dh=(float)h / sh;
      d2sw=(float)sw / w;
      d2sh=(float)sh / h;

      //Clip against the edges of the source
      if(sx<0)
      {
         dx+=(int)((0-sx) * s2dw);
         w-=(int)((0-sx) * s2dw);
         sw-=0-sx;
         sx=0;
      }
      if(sy<0)
      {
         dy+=(int)((0-sy) * s2dh);
         h-=(int)((0-sy) * s2dh);

         sh-=0-sy;
         sy=0;
      }
      if(sx+sw>src.width-1)
      {
         w-=(int)((sx+sw-(src.width-1)-1)*s2dw);
         sw-=sx+sw-(src.width-1)-1;
      }
      if(sy+sh>(src.height-1))
      {
         h-=(int)((sy+sh-(src.height-1)-1)*s2dh);
         sh-=sy+sh-(src.height-1)-1;
      }
      //Clip against the edges of the destination
      if(dx<surface.box.left)
      {
         if(!flip) sx+=(int)((surface.box.left-dx)*d2sw);
         sw-=(int)((surface.box.left-dx)*d2sw);
         w-=surface.box.left-dx;
         dx=surface.box.left;
      }
      if(dy<surface.box.top)
      {
         sy+=(int)((surface.box.top-dy)*d2sh);
         sh-=(int)((surface.box.top-dy)*d2sh);
         h-=surface.box.top-dy;
         dy=surface.box.top;
      }
      if((dx+w)>surface.box.right)
      {
         if(flip) sx+=(int)(((dx+w)-surface.box.right-1)*d2sw);
         sw-=(int)(((dx+w)-surface.box.right-1)*d2sw);
         w-=((dx+w)-surface.box.right-1);
      }
      if((dy+h)>surface.box.bottom)
      {
         sh-=(int)(((dy+h)-surface.box.bottom-1)*d2sh);
         h-=((dy+h)-surface.box.bottom-1);
      }
      if((w<=0)||(h<=0)||(sw<=0)||(sh<=0)) return;

      dx+=surface.offset.x;
      dy+=surface.offset.y;

      if(lfbSurface.bitmap.picture)
      {
         AlphaWriteMode alphaWrite = surface.alphaWrite;
         if(src.alphaBlend && surface.blend)
         {
            uint adddest = lfbSurface.bitmap.stride, addsource = src.stride;
            ColorAlpha * source = ((ColorAlpha *) src.picture) + sy * addsource + sx;
            ColorAlpha * dest = ((ColorAlpha *) lfbSurface.bitmap.picture) + dy * adddest   + dx;
            float scaleX = (float)sw / w;
            float scaleY = (float)sh / h;
            /*if(flip < 0)
            {
               dest += w-1;
               adddest += w;
            }
            else*/
               adddest -= w;
            if (w > sw && h > sh)
            {
               int y;
               for (y = 0; y < h; y++)
               {
                  int y0 = y * sh / h;
                  int y1 = Min(y0 + 1, sh - 1);
                  float alpha = y * scaleY - y0;
                  int x;
                  for(x = 0; x < w; x++, dest += 1)
                  {
                     int x0 = x * sw / w;
                     int x1 = Min(x0 + 1, sw - 1);
                     float beta = x * scaleX - x0;
                     ColorAlpha src00, src01, src10, src11;
                     float a1,r1,g1,b1,a2,r2,g2,b2;
                     float a,r,g,b;
                     src00 = source[y0 * src.stride + x0];
                     src01 = source[y0 * src.stride + x1];
                     src10 = source[y1 * src.stride + x0];
                     src11 = source[y1 * src.stride + x1];
                     a1 = (src00.a) * (1.0f - beta) + (src01.a) * beta;
                     r1 = (src00.color.r) * (1.0f - beta) + (src01.color.r) * beta;
                     g1 = (src00.color.g) * (1.0f - beta) + (src01.color.g) * beta;
                     b1 = (src00.color.b) * (1.0f - beta) + (src01.color.b) * beta;
                     a2 = (src10.a) * (1.0f - beta) + (src11.a) * beta;
                     r2 = (src10.color.r) * (1.0f - beta) + (src11.color.r) * beta;
                     g2 = (src10.color.g) * (1.0f - beta) + (src11.color.g) * beta;
                     b2 = (src10.color.b) * (1.0f - beta) + (src11.color.b) * beta;
                     a = a1 * (1.0f - alpha) + a2 * alpha;
                     r = r1 * (1.0f - alpha) + r2 * alpha;
                     g = g1 * (1.0f - alpha) + g2 * alpha;
                     b = b1 * (1.0f - alpha) + b2 * alpha;
                     {
                        ColorAlpha dst = *dest;
                        int cr = (int)(a * r / 255 + ((255 - a) * dst.color.r / 255));
                        int cg = (int)(a * g / 255 + ((255 - a) * dst.color.g / 255));
                        int cb = (int)(a * b / 255 + ((255 - a) * dst.color.b / 255));
                        if(cr > 255) cr = 255;
                        if(cg > 255) cg = 255;
                        if(cb > 255) cb = 255;
                        dest->color = { (byte)cr, (byte)cg, (byte)cb };

                        if(alphaWrite == blend)
                        {
                           int ca = (int)(a + ((255 - a) * dst.a / 255));
                           if(ca > 255) ca = 255;
                           dest->a = (byte)ca;
                        }
                        else if(alphaWrite)
                           dest->a = (byte)a;
                     }
                  }
                  dest += adddest;
               }
            }
            else
            {
               int y;
               for (y = 0; y < h; y++)
               {
                  int y0 = Min((int)((y + 1) * scaleY), sh - 1);
                  int y1 = Min(y0 + 1, sh - 1);
                  int x;
                  for (x = 0; x < w; x++, dest += 1)
                  {
                     int x0 = Min((int)((x + 1) * scaleX), sw - 1);
                     int x1 = Min(x0 + 1, sw - 1);
                     float a = 0, r = 0, g = 0, b = 0;
                     int numPixels = 0;
                     int i, j;
                     for (i = y0; i <= y1; i++)
                        for (j = x0; j <= x1; j++)
                        {
                           ColorAlpha pixel = source[i * src.stride + j];
                           a += pixel.a;
                           r += pixel.color.r;
                           g += pixel.color.g;
                           b += pixel.color.b;
                           numPixels++;
                        }
                     a /= numPixels;
                     r /= numPixels;
                     g /= numPixels;
                     b /= numPixels;
                     {
                        ColorAlpha dst = *dest;
                        int cr = (int)(a * r / 255 + ((255 - a) * dst.color.r / 255));
                        int cg = (int)(a * g / 255 + ((255 - a) * dst.color.g / 255));
                        int cb = (int)(a * b / 255 + ((255 - a) * dst.color.b / 255));
                        if(cr > 255) cr = 255;
                        if(cg > 255) cg = 255;
                        if(cb > 255) cb = 255;
                        dest->color = { (byte)cr, (byte)cg, (byte)cb };
                        if(alphaWrite == blend)
                        {
                           int ca = (int)(a + ((255 - a) * dst.a / 255));
                           if(ca > 255) ca = 255;
                           dest->a = (byte)ca;
                        }
                        else if(alphaWrite)
                           dest->a = (byte)a;
                     }
                  }
                  dest += adddest;
               }
            }
         }
         else if(!src.paletteShades && src.pixelFormat == lfbSurface.bitmap.pixelFormat)
            filters_table[lfbSurface.bitmap.pixelFormat][src.transparent][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h,sw,sh);
         // Fail back on Stretch
         else if(src.paletteShades)
            shades_stretch_table[lfbSurface.bitmap.pixelFormat][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h,sw,sh);
         else if(src.pixelFormat == lfbSurface.bitmap.pixelFormat)
            stretches_table[lfbSurface.bitmap.pixelFormat][src.transparent][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h,sw,sh);
         else if(src.pixelFormat == pixelFormat8 && lfbSurface.bitmap.pixelFormat != pixelFormatText)
            stretches_8bit_table[lfbSurface.bitmap.pixelFormat][src.transparent][flip](src,lfbSurface.bitmap,dx,dy,sx,sy,w,h,sw,sh);
      }
   }

   void BlitDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h)
   {
      Blit(display, surface, src, dx, dy, sx, sy, w, h);
   }

   void StretchDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      Stretch(display, surface, src, dx, dy, sx, sy, w, h, sw, sh);
   }

   void FilterDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      Filter(display, surface, src, dx, dy, sx, sy, w, h, sw, sh);
   }

   void UnloadFont(DisplaySystem displaySystem, Font font)
   {
      delete font;
   }

   Font LoadFont(DisplaySystem displaySystem, const char * faceName, float size, FontFlags flags, float outlineSize, float outlineFade)
   {
#ifndef ECERE_NOTRUETYPE
      return Font::Load(displaySystem, faceName, size, flags, outlineSize, outlineFade);
#else
      return { };
#endif
   }

   void FontExtent(DisplaySystem displaySystem, Font font, const char * text, int len, int * width, int * height, int prevGlyph, int * rPrevGlyph, int * adv)
   {
      if(displaySystem && displaySystem.flags.text && len)
      {
         if(width)
         {
            int num = len;
            *width = num * textCellW;
         }
         if(height) *height = textCellH;
      }
#if !defined(ECERE_NOTRUETYPE)
      else if(font && len)
      {
         if(width)
         {
            int w = 0, advance = 0;
            font.ProcessString(displaySystem, (const byte *)text, len, false, null, null, &w, 0, prevGlyph, rPrevGlyph, &advance);
            if(adv) *adv = advance >> 6;
            //*width = (w + 64 - w % 64) >> 6;
            *width = w >> 6;
         }
         if(height)
            *height = font.height;
      }
#endif
      else
      {
         if(width) *width = 0;
         if(height) *height = 0;
      }
   }

   void WriteText(Display display, Surface surface, int x, int y, const char * text, int len, int prevGlyph, int * rPrevGlyph)
   {
      LFBSurface lfbSurface = surface.driverData;
      if(display && display.displaySystem.flags.text)
      {
         LFBDisplay lfbDisplay = display.driverData;
         uint16 * coffset = (uint16 *)lfbDisplay.bitmap.picture;
         int c;

         x /= textCellW;
         y /= textCellH;

         if(y > surface.box.bottom || y < surface.box.top)
            return;
         coffset += (y+surface.offset.y) * lfbSurface.bitmap.stride + x + surface.offset.x;
         for(c=0; (c<len && x < surface.box.left); c++, x++,coffset++);
         for(; (c<len && x <= surface.box.right); c++, x++,coffset++)
         {
            if(surface.textOpacity)
               *coffset = (uint16) (lfbSurface.background|lfbSurface.foreground|text[c]);
            else
               *coffset = (uint16) (((*coffset)&0xF000)|lfbSurface.foreground|text[c]);
         }
      }
      else
      {
         lfbSurface.writingText = true;
#if !defined(ECERE_NOTRUETYPE)
         x <<= 6;

         if(surface.font.outlineSize)
         {
            ColorAlpha backForeground = surface.foreground;
            int fx = x;
            lfbSurface.writingOutline = true;
            surface.foreground = surface.outlineColor;
            lfbSurface.font.ProcessString(surface.displaySystem, (const byte *)text, len, true, surface, display, &fx, y, prevGlyph, rPrevGlyph, null);
            lfbSurface.writingOutline = false;
            surface.foreground = backForeground;
         }

         lfbSurface.font.ProcessString(surface.displaySystem, (const byte *)text, len, true, surface, display, &x, y, prevGlyph, rPrevGlyph, null);
#endif
         lfbSurface.writingText = false;
      }
   }

   void TextFont(Display display, Surface surface, Font font)
   {
      LFBSurface lfbSurface = surface.driverData;
      lfbSurface.font = font;
   }

   void TextOpacity(Display display, Surface surface, bool opaque)
   {

   }

   void TextExtent(Display display, Surface surface, const char * text, int len, int * width, int * height, int prevGlyph, int * rPrevGlyph, int * advance)
   {
      LFBSurface lfbSurface = surface.driverData;
      FontExtent(surface.displaySystem, lfbSurface.font, text, len, width, height, prevGlyph, rPrevGlyph, advance);
   }

   void DrawingChar(Display display, Surface surface, byte character)
   {
      LFBSurface lfbSurface = surface.driverData;
      lfbSurface.drawingChar = character;
   }

   void LineStipple(Display display, Surface surface, uint32 stipple)
   {
      LFBSurface lfbSurface = surface.driverData;
      lfbSurface.stipple = (uint16)stipple;
   }

#if !defined(ECERE_VANILLA) && !defined(ECERE_NO3D)
   void FreeMesh(DisplaySystem displaySystem, Mesh mesh)
   {
      if(mesh.vertices && !mesh.flags.vertices)
         delete mesh.vertices;
      if(mesh.normals && !mesh.flags.normals)
         delete mesh.normals;
      if(mesh.texCoords && !mesh.flags.texCoords1)
         delete mesh.texCoords;
      if(mesh.tangents && !mesh.flags.tangents)
         delete mesh.tangents;
      if(mesh.colors && !mesh.flags.colors)
         delete mesh.colors;
      if(mesh.lightVectors && !mesh.flags.lightVectors)
         delete mesh.lightVectors;
   }

   bool AllocateMesh(DisplaySystem displaySystem, Mesh mesh, MeshFeatures flags, int nVertices)
   {
      bool result = false;
      //bool memAllocOnly = flags.memAllocOnly;
      flags.memAllocOnly = false;

      if(mesh.nVertices == nVertices)
      {
         result = true;
         // Same number of vertices, adding features (Leaves the other features pointers alone)
         if(mesh.flags != flags)
         {
            if(!mesh.flags.vertices && flags.vertices)
            {
               if(flags.doubleVertices)
               {
                  mesh.vertices = (Vector3Df *)new Vector3D[nVertices];
               }
               else
                  mesh.vertices = new Vector3Df[nVertices];
            }
            if(!mesh.flags.normals && flags.normals)
            {
               if(flags.doubleNormals)
               {
                  mesh.normals = (Vector3Df *)new Vector3D[nVertices];
               }
               else
                  mesh.normals = new Vector3Df[nVertices];
            }
            if(!mesh.flags.texCoords1 && flags.texCoords1)
               mesh.texCoords = new Pointf[nVertices];
            if(!mesh.flags.colors && flags.colors)
               mesh.colors = new ColorRGBAf[nVertices];
         }
      }
      else
      {
         result = true;
         // New number of vertices, reallocate all current and new features
         flags |= mesh.flags;
         if(flags.vertices)
         {
            if(flags.doubleVertices)
            {
               mesh.vertices = (Vector3Df *)renew mesh.vertices Vector3D[nVertices];
            }
            else
               mesh.vertices = renew mesh.vertices Vector3Df[nVertices];
         }
         if(flags.normals)
         {
            if(flags.doubleNormals)
            {
               mesh.normals = (Vector3Df *)renew mesh.normals Vector3D[nVertices];
            }
            else
               mesh.normals = renew mesh.normals Vector3Df[nVertices];
         }
         if(flags.texCoords1)
            mesh.texCoords = renew mesh.texCoords Pointf[nVertices];
         if(flags.colors)
            mesh.colors = renew mesh.colors ColorRGBAf[nVertices];
      }
      return result;
   }

   bool LockMesh(DisplaySystem displaySystem, Mesh mesh, MeshFeatures features)
   {
      return true;
   }

   void FreeIndices(DisplaySystem displaySystem, uint16 * indices)
   {
      delete indices;
   }

   uint16 * AllocateIndices(DisplaySystem displaySystem, int nIndices, bool indices32bit)
   {
      return (void *)(indices32bit ? new uint32[nIndices] : new uint16[nIndices]);
   }
   uint16 * LockIndices(DisplaySystem displaySystem, void * indices)
   {
      return indices;
   }
#endif
}
