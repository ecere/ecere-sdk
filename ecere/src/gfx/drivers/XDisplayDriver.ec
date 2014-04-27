namespace gfx::drivers;

import "instance"

#if (defined(__unix__) || defined(__APPLE__)) && !defined(ECERE_MINIGLX)

default:

#define property _property
#define new _new
#define class _class
#define uint _uint

#define Window    X11Window
#define Cursor    X11Cursor
#define Font      X11Font
#define Display   X11Display
#define Time      X11Time
#define KeyCode   X11KeyCode
#define Picture   X11Picture

#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/extensions/shape.h>
#include <X11/extensions/Xrender.h>
#include <X11/extensions/XShm.h>
#include <sys/ipc.h>
#include <sys/shm.h>

#undef Window
#undef Cursor
#undef Font
#undef Display
#undef Time
#undef KeyCode
#undef Picture

#undef uint
#undef new
#undef property
#undef class

private:

import "Display"
import "XInterface"

/*
static byte defaultRGBLookup[32768];
bool rgbLookupSet = false;
*/
class XDisplay : LFBDisplay //struct
{
   Pixmap pixmap;
   Pixmap shapePixmap;
   GC windowGC, gc;
   Point offset;
   Box updateBox;
   X11Picture picture;
   X11Picture shapePicture;
   XShmSegmentInfo shminfo;
   XImage * image;
   XShmSegmentInfo shminfoShape;
   XImage * shapeImage;
};

class XSurface : struct
{
   Font font;
   bool opaqueText;
   int xOffset;
   bool writingText;

   ColorAlpha foreground, background;
   bool opaque;
   bool clipped;
   Pixmap pixmap;
   X11Picture picture;
   X11Picture colorPicture;
   Pixmap colorPixmap;
};

class XBitmap : struct
{
   Pixmap pixmap;
   Pixmap mask;
   X11Picture picture;
   X11Picture maskPicture;
};

XRenderPictFormat * GetXRenderFormat(PixelFormat pixelFormat, bool alphaBlend)
{
   XRenderPictFormat * format = null;
   switch(pixelFormat)
   {
      case pixelFormatAlpha:
         format = XRenderFindStandardFormat(xGlobalDisplay, PictStandardA8);
         break;
      case pixelFormat888:
         format = XRenderFindStandardFormat(xGlobalDisplay, alphaBlend ? PictStandardARGB32 : PictStandardRGB24);
         // printf("R: %d G: %d B: %d\n", format->direct.red, format->direct.green, format->direct.blue);
         break;
      case pixelFormat555:
      {
         XRenderPictFormat info = { 0 };

         info.depth = 16;
         info.type = PictTypeDirect;
         info.direct.red = 10;
         info.direct.green = 5;
         info.direct.blue = 0;
         info.direct.redMask   = 0x1F;
         info.direct.greenMask = 0x1F;
         info.direct.blueMask  = 0x1F;

         format = XRenderFindFormat(xGlobalDisplay,
            /*PictFormatDepth|*/PictFormatType| PictFormatAlpha|PictFormatRed|PictFormatGreen|PictFormatBlue|
            PictFormatRedMask|PictFormatGreenMask|PictFormatBlueMask|PictFormatAlphaMask, &info, 0);
         break;
      }
      case pixelFormat565:
      {
         XRenderPictFormat info = { 0 };

         info.depth = 16;
         info.type = PictTypeDirect;
         info.direct.alpha = 0;
         info.direct.red = 11;
         info.direct.green = 5;
         info.direct.blue = 0;
         info.direct.redMask   = 0x1F;
         info.direct.greenMask = 0x3F;
         info.direct.blueMask  = 0x1F;
         info.direct.alphaMask = 0;
         info.id = 0xba;

         format = XRenderFindFormat(xGlobalDisplay,
            /*PictFormatDepth|*/PictFormatType|PictFormatAlpha|PictFormatRed|PictFormatGreen|PictFormatBlue|
            PictFormatRedMask|PictFormatGreenMask|PictFormatBlueMask|PictFormatAlphaMask, &info, 0);
         break;
      }
   }
   return format;
}

static bool ClipBlitCoords(Surface surface, Bitmap src, int *dx, int *dy, int *sx, int *sy, int *w, int *h, bool * flip)
{
   *flip = false;

   if(surface.box.right < surface.box.left || surface.box.bottom < surface.box.top) return false;

   if(*w < 0) { *w = -*w; *flip = true; }

   //Clip against the edges of the source
   if(*sx<0)
   {
      *dx+=-*sx;
      *w-=-*sx;
      *sx=0;
   }
   if(*sy<0)
   {
      *dy+=0-*sy;
      *h-=0-*sy;
      *sy=0;
   }
   if(*sx+*w>src.width-1)
      *w-=*sx+*w-(src.width-1)-1;
   if(*sy+*h>src.height-1)
      *h-=*sy+*h-(src.height-1)-1;
   //Clip against the edges of the destination
   if(*dx<surface.box.left)
   {
      if(!*flip) *sx+=surface.box.left-*dx;
      *w-=surface.box.left-*dx;
      *dx=surface.box.left;
   }
   if(*dy<surface.box.top)
   {
      *sy+=surface.box.top-*dy;
      *h-=surface.box.top-*dy;
      *dy=surface.box.top;
   }
   if((*dx+*w)>surface.box.right)
   {
      if(*flip) *sx+=(uint)(*dx+*w)-surface.box.right-1;
      *w-=((uint)(*dx+*w)-surface.box.right-1);
   }
   if((*dy+*h)>surface.box.bottom)
      *h-=((*dy+*h)-surface.box.bottom-1);
   if((*w<=0)||(*h<=0))
      return false;
   return true;
}

static bool ClipStretchCoords(Surface surface, Bitmap src, int *dx, int *dy, int *sx, int *sy, int *w, int *h, int *sw, int *sh, bool * flip)
{
   float s2dw,s2dh,d2sw,d2sh;
   *flip = false;

   if(surface.box.right < surface.box.left || surface.box.bottom < surface.box.top || !src.picture) return false;

   if(Sgn(*w) != Sgn(*sw))
   {
      *w = Abs(*w);
      *sw = Abs(*sw);
      *flip = true;
   }

   s2dw=(float)*w / *sw;
   s2dh=(float)*h / *sh;
   d2sw=(float)*sw / *w;
   d2sh=(float)*sh / *h;

   //Clip against the edges of the source
   if(*sx < 0)
   {
      *dx += (int)((0-*sx) * s2dw);
      *w -= (int)((0-*sx) * s2dw);
      *sw -= 0-*sx;
      *sx=0;
   }
   if(*sy < 0)
   {
      *dy += (int)((0-*sy) * s2dh);
      *h -= (int)((0-*sy) * s2dh);

      *sh -= 0-*sy;
      *sy=0;
   }
   if(*sx+*sw>src.width-1)
   {
      *w-=(int)((*sx+*sw-(src.width-1)-1)*s2dw);
      *sw-=*sx+*sw-(src.width-1)-1;
   }
   if(*sy+*sh>(src.height-1))
   {
      *h-=(int)((*sy+*sh-(src.height-1)-1)*s2dh);
      *sh-=*sy+*sh-(src.height-1)-1;
   }
   //Clip against the edges of the destination
   if(*dx < surface.box.left)
   {
      if(!*flip) *sx += (int)((surface.box.left-*dx)*d2sw);
      *sw-=(int)((surface.box.left-*dx)*d2sw);
      *w-=surface.box.left-*dx;
      *dx=surface.box.left;
   }
   if(*dy < surface.box.top)
   {
      *sy += (int)((surface.box.top-*dy)*d2sh);
      *sh -= (int)((surface.box.top-*dy)*d2sh);
      *h -= surface.box.top-*dy;
      *dy =surface.box.top;
   }
   if((*dx+*w)>surface.box.right)
   {
      if(*flip) *sx+=(int)(((*dx+*w)-surface.box.right-1)*d2sw);
      *sw-=(int)(((*dx + *w)-surface.box.right-1)*d2sw);
      *w-=((*dx+*w)-surface.box.right-1);
   }
   if((*dy+*h)>surface.box.bottom)
   {
      *sh-=(int)(((*dy+*h)-surface.box.bottom-1)*d2sh);
      *h-=((*dy+*h)-surface.box.bottom-1);
   }
   if((*w<=0)||(*h<=0)||(*sw<=0)||(*sh<=0))
      return false;
   return true;
}

static void PutBitmapMask(Pixmap mask, Bitmap bitmap) {
   XImage image = {0};
   GC maskGC = XCreateGC(xGlobalDisplay, mask, 0, null);
   uint wordWidth = (bitmap.width+31) >> 5;

   uint x,y;
   uint32 *b = new0 uint32[wordWidth * bitmap.height];
   uint32 f = 1;

   XSetGraphicsExposures(xGlobalDisplay, maskGC, False);

   image.width = bitmap.width;
   image.height = bitmap.height;

   image.format = XYBitmap;
   #ifdef __BIG_ENDIAN__
   image.byte_order = MSBFirst;
   #else
   image.byte_order = LSBFirst;
   #endif
   image.bitmap_unit = 32;
   image.bitmap_bit_order = LSBFirst;
   image.bitmap_pad = 32;
   image.depth = 1;
   image.bytes_per_line = wordWidth << 2;

   image.data = (char*)b;

   XInitImage(&image);

   switch(bitmap.pixelFormat) {
      case pixelFormat4: {

      } break;
      case pixelFormat8: {
         byte *p = (byte*)bitmap.picture;

         for(y = 0; y<bitmap.height; y++, p+=bitmap.stride) {
            for(x = 0; x<bitmap.width; x++) {
               if(p[x])
                  *b |= f; //XPutPixel(&image, x,y, 1);
               if (!(f<<=1))
                  b++, f=1;
            }
            if (f != 1)
               b++, f=1;
         }
      } break;
      case pixelFormat444:
      case pixelFormat555:
      case pixelFormat565: {
         uint16 *p = (uint16*)bitmap.picture;
#ifdef _DEBUG
         PrintLn(bitmap.pixelFormat);
#endif
         for(y = 0; y<bitmap.height; y++, p+=bitmap.stride) {
            for(x = 0; x<bitmap.width; x++) {
               if(p[x])
                  *b |= f; //XPutPixel(&image, x,y, 1);
               if (!(f<<=1))
                  b++, f=1;
            }
            if (f != 1)
               b++, f=1;
         }
      } break;
      case pixelFormat888: {
         ColorAlpha *p = (ColorAlpha*)bitmap.picture;
         for(y = 0; y<bitmap.height; y++, p+=bitmap.stride) {
            for(x = 0; x<bitmap.width; x++) {
               if(p[x].a)
                  *b |= f; //XPutPixel(&image, x,y, 1);
               if (!(f<<=1))
                  b++, f=1;
            }
            if (f != 1)
               b++, f=1;
         }
      } break;
      case pixelFormatAlpha: {

      } break;
      case pixelFormatText: {

      } break;
      case pixelFormatRGBA: {

      } break;
   }

   XSetForeground(xGlobalDisplay, maskGC, 1);
   XSetBackground(xGlobalDisplay, maskGC, 0);

   XPutImage(xGlobalDisplay, mask, maskGC, &image,
      0, 0, 0, 0, //coordinates
      bitmap.width, bitmap.height);

   XFreeGC(xGlobalDisplay, maskGC);
   delete image.data;
}

class XDisplayDriver : DisplayDriver
{
   class_property(name) = "X";

   bool CreateDisplaySystem(DisplaySystem displaySystem)
   {
      //displaySystem.driverData = calloc(1, sizeof(LFBSystem));
      displaySystem.flags.memBackBuffer = true;
      displaySystem.pixelFormat = xSystemPixelFormat;
      return true;
   }

   void DestroyDisplaySystem(DisplaySystem displaySystem)
   {
      // delete displaySystem.driverData;
   }

   void DestroyDisplay(Display display)
   {
      XDisplay xDisplay = display.driverData;

      // Free Shared Memory Pixmap
      if(xDisplay.shapePixmap)
         XFreePixmap(xGlobalDisplay, xDisplay.shapePixmap);
      if(xDisplay.pixmap)
         XFreePixmap(xGlobalDisplay, xDisplay.pixmap);
      if(xDisplay.image)
      {
         if(xDisplay.shminfoShape.shmid != -1)
         {
            XShmDetach(xGlobalDisplay, &xDisplay.shminfo);
            if(xDisplay.shminfo.shmaddr != (void *)-1)
               shmdt(xDisplay.shminfo.shmaddr);
            shmctl(xDisplay.shminfo.shmid, IPC_RMID, 0);
         }
      }
      if(xDisplay.shapeImage)
      {
         if(xDisplay.shminfoShape.shmid != -1)
         {
            XShmDetach(xGlobalDisplay, &xDisplay.shminfoShape);
            if(xDisplay.shminfoShape.shmaddr != (void *)-1)
               shmdt(xDisplay.shminfoShape.shmaddr);
            shmctl(xDisplay.shminfoShape.shmid, IPC_RMID, 0);
         }
         XDestroyImage(xDisplay.shapeImage);
         xDisplay.shapeImage = None;
      }
      if(xDisplay.picture)
         XRenderFreePicture(xGlobalDisplay, xDisplay.picture);
      if(xDisplay.shapePicture)
         XRenderFreePicture(xGlobalDisplay, xDisplay.picture);
      if(xDisplay.windowGC)
         XFreeGC(xGlobalDisplay, xDisplay.windowGC);
      if(xDisplay.gc)
         XFreeGC(xGlobalDisplay, xDisplay.gc);
      delete xDisplay;
      display.driverData = null;
   }

   void SetPalette(Display display, ColorAlpha * palette, bool colorMatch)
   {


   }

   bool CreateDisplay(Display display)
   {
      bool result = false;
      XDisplay xDisplay = display.driverData = XDisplay { };

      if(display)
      {
         xDisplay.windowGC = XCreateGC(xGlobalDisplay, (X11Window)display.window, 0, null);
         XSetGraphicsExposures(xGlobalDisplay, xDisplay.windowGC, False);
         result = true;
      }
      return result;
   }

   bool DisplaySize(Display display, int width, int height)
   {
      XDisplay xDisplay = display.driverData;
      bool result = false;

      if(width > display.width || height > display.height)
      {
         display.width = width;
         display.height = height;

         if(xDisplay.picture)
            XRenderFreePicture(xGlobalDisplay, xDisplay.picture);

         {
            XRenderPictureAttributes attributes = { 0 };
            XRenderPictFormat * format = GetXRenderFormat(xSystemPixelFormat, display.alphaBlend);
            attributes.component_alpha = 1;
            attributes.poly_mode = PolyModeImprecise;
            attributes.poly_edge = PolyEdgeSmooth;

            if(xDisplay.pixmap)
            {
               XFreePixmap(xGlobalDisplay, xDisplay.pixmap);
               xDisplay.pixmap = None;
            }
            if(xDisplay.shapePixmap)
            {
               XFreePixmap(xGlobalDisplay, xDisplay.shapePixmap);
               xDisplay.shapePixmap = None;
            }

            // Free Shared Memory Pixmap
            if(xDisplay.image)
            {
               if(xDisplay.shminfoShape.shmid != -1)
               {
                  XShmDetach(xGlobalDisplay, &xDisplay.shminfo);
                  if(xDisplay.shminfo.shmaddr != (void *)-1)
                     shmdt(xDisplay.shminfo.shmaddr);
                  shmctl(xDisplay.shminfo.shmid, IPC_RMID, 0);
               }
               XDestroyImage(xDisplay.image);
               xDisplay.image = None;
            }
            if(xDisplay.shapeImage)
            {
               if(xDisplay.shminfoShape.shmid != -1)
               {
                  XShmDetach(xGlobalDisplay, &xDisplay.shminfoShape);
                  if(xDisplay.shminfoShape.shmaddr != (void *)-1)
                     shmdt(xDisplay.shminfoShape.shmaddr);
                  shmctl(xDisplay.shminfoShape.shmid, IPC_RMID, 0);
               }
               XDestroyImage(xDisplay.shapeImage);
               xDisplay.shapeImage = None;
            }

            // Initialize Shared Memory Pixmap
#ifdef __linux__
            if(xSharedMemory && display.useSharedMemory && format)
            {
#ifdef _DEBUG
               printf("Using shared memory!\n");
#endif
               xDisplay.image = XShmCreateImage(xGlobalDisplay, xSystemVisual /*DefaultVisual(xGlobalDisplay, DefaultScreen(xGlobalDisplay))*/,
                  format->depth, ZPixmap, null, &xDisplay.shminfo, width, height);
            }
#endif
            if(xDisplay.image)
            {
               memset(&xDisplay.shminfo, 0, sizeof(XShmSegmentInfo));
               // printf("shmget: %d\n", xDisplay.image->bytes_per_line * xDisplay.image->height);
               xDisplay.shminfo.shmid = shmget(IPC_PRIVATE, xDisplay.image->bytes_per_line * xDisplay.image->height, IPC_CREAT|0777);
               if(xDisplay.shminfo.shmid != -1)
               {
                  xDisplay.shminfo.shmaddr = shmat(xDisplay.shminfo.shmid, 0, 0);
                  if(xDisplay.shminfo.shmaddr != (void *)-1)
                  {
                     // printf("%d,  %d\n", xDisplay.shminfo.shmid, xDisplay.shminfo.shmaddr);
                     xDisplay.shminfo.readOnly = False;
                     if(XShmAttach(xGlobalDisplay, &xDisplay.shminfo))
                     {
                        xDisplay.pixmap = XShmCreatePixmap(xGlobalDisplay, (X11Window)display.window, xDisplay.shminfo.shmaddr, &xDisplay.shminfo, width, height, format->depth);

                        xDisplay.bitmap.width = width;
                        xDisplay.bitmap.height = height;
                        xDisplay.bitmap.stride = xDisplay.image->bytes_per_line >> GetColorDepthShifts(display.pixelFormat);
                        xDisplay.bitmap.pixelFormat = display.pixelFormat;
                        xDisplay.bitmap.picture = xDisplay.shminfo.shmaddr;
                        xDisplay.bitmap.size = width * height;
                        xDisplay.bitmap.sizeBytes = (uint)xDisplay.bitmap.size << GetColorDepthShifts(display.pixelFormat);
                     }
                  }
               }
               if(!xDisplay.pixmap)
               {
                  if(xDisplay.shminfo.shmid != -1)
                  {
                     XShmDetach(xGlobalDisplay, &xDisplay.shminfo);
                     if(xDisplay.shminfo.shmaddr != (void *)-1)
                        shmdt(xDisplay.shminfo.shmaddr);
                     shmctl(xDisplay.shminfo.shmid, IPC_RMID, 0);
                  }
                  XDestroyImage(xDisplay.image);
                  xDisplay.image = None;
               }
            }

#ifdef __linux__
            // Initialize Shared Memory Shape Pixmap
            if(xSharedMemory && display.useSharedMemory && display.alphaBlend)
               xDisplay.shapeImage = XShmCreateImage(xGlobalDisplay, xSystemVisual /*DefaultVisual(xGlobalDisplay, DefaultScreen(xGlobalDisplay))*/,
                  1, ZPixmap, null, &xDisplay.shminfoShape, width, height);
#endif
            if(xDisplay.shapeImage)
            {
               xDisplay.shminfoShape.shmid = shmget(IPC_PRIVATE, xDisplay.shapeImage->bytes_per_line * xDisplay.shapeImage->height, IPC_CREAT|0777);
               if(xDisplay.shminfoShape.shmid != -1)
               {
                  xDisplay.shminfoShape.shmaddr = shmat(xDisplay.shminfoShape.shmid, 0, 0);
                  if(xDisplay.shminfoShape.shmaddr != (void *)-1)
                  {
                     xDisplay.shminfoShape.readOnly = False;
                     if(XShmAttach(xGlobalDisplay, &xDisplay.shminfoShape))
                     {
                        xDisplay.shapePixmap = XShmCreatePixmap(xGlobalDisplay, (X11Window)display.window, xDisplay.shminfoShape.shmaddr, &xDisplay.shminfoShape, width, height, 1);
                     }
                  }
               }
               if(!xDisplay.shapePixmap)
               {
                  if(xDisplay.shminfoShape.shmid != -1)
                  {
                     XShmDetach(xGlobalDisplay, &xDisplay.shminfoShape);
                     if(xDisplay.shminfoShape.shmaddr != (void *)-1)
                        shmdt(xDisplay.shminfoShape.shmaddr);
                     shmctl(xDisplay.shminfoShape.shmid, IPC_RMID, 0);
                  }
                  XDestroyImage(xDisplay.shapeImage);
                  xDisplay.shapeImage = None;
               }
            }

            if(!xDisplay.pixmap && format)
               xDisplay.pixmap = XCreatePixmap(xGlobalDisplay, (X11Window)display.window, width, height, format->depth);
            if(display.alphaBlend && !xDisplay.shapePixmap)
               xDisplay.shapePixmap = XCreatePixmap(xGlobalDisplay, (X11Window)display.window, width, height, 1);
            if(!xDisplay.gc)
            {
               xDisplay.gc = XCreateGC(xGlobalDisplay, (Pixmap)xDisplay.pixmap, 0, null);
               XSetGraphicsExposures(xGlobalDisplay, xDisplay.gc, False);
            }

            if(format)
               xDisplay.picture = XRenderCreatePicture(xGlobalDisplay, xDisplay.pixmap, format, CPComponentAlpha, &attributes);

            if(display.alphaBlend)
               xDisplay.shapePicture = XRenderCreatePicture(xGlobalDisplay, xDisplay.shapePixmap, XRenderFindStandardFormat(xGlobalDisplay, PictStandardA1), 0, &attributes);
         }
      }
      xDisplay.updateBox.left = display.width;
      xDisplay.updateBox.top = display.height;
      xDisplay.updateBox.right = 0;
      xDisplay.updateBox.bottom = 0;

      result = true;
      return result;
   }

   void DisplayPosition(Display display, int x, int y)
   {
      XDisplay xDisplay = display.driverData;
      xDisplay.offset.x = x;
      xDisplay.offset.y = y;
   }

   void RestorePalette(Display display)
   {
      XDisplay xDisplay = display.driverData;
   }

   void FreeBitmap(DisplaySystem displaySystem, Bitmap bitmap)
   {
      XBitmap xBitmap = bitmap.driverData;
      if(xBitmap)
      {
         if(xBitmap.pixmap)
            XFreePixmap(xGlobalDisplay, xBitmap.pixmap);
         if(xBitmap.mask)
            XFreePixmap(xGlobalDisplay, xBitmap.mask);
         if(xBitmap.picture)
            XRenderFreePicture(xGlobalDisplay, xBitmap.picture);
         if(xBitmap.maskPicture)
            XRenderFreePicture(xGlobalDisplay, xBitmap.maskPicture);
         delete xBitmap;
         bitmap.driverData = null;
      }
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).FreeBitmap(displaySystem, bitmap);
   }

   bool MakeDDBitmap(DisplaySystem displaySystem, Bitmap bitmap, bool mipMaps)
   {
      //XDisplay xDisplay = display.driverData;
      XBitmap xBitmap { };
      XImage image = { 0 };
      GC gc = 0;

      if(bitmap.pixelFormat != pixelFormatAlpha)
         bitmap.Convert(null, bitmap.alphaBlend ? pixelFormat888 : xSystemPixelFormat, null);

      //bitmap.Convert(null, pixelFormatRGBA, null);
      //bitmap.Convert(null, pixelFormat888, null);
      xBitmap.pixmap =
         XCreatePixmap(xGlobalDisplay, confineWindow /*(X11Window)display.window*/, bitmap.width, bitmap.height,
            (bitmap.pixelFormat == pixelFormatAlpha) ? 8 : (bitmap.alphaBlend ? 32 : ((bitmap.pixelFormat == pixelFormat888) ? 24 : xSystemDepth)));
      if(bitmap.transparent)
         xBitmap.mask =
            XCreatePixmap(xGlobalDisplay, confineWindow /*(X11Window)display.window*/, bitmap.width, bitmap.height, 1);

      {
         XRenderPictureAttributes attributes = { 0 };
         XRenderPictFormat * format = GetXRenderFormat(bitmap.pixelFormat, bitmap.alphaBlend);
         attributes.component_alpha = 1;

         if(format)
            xBitmap.picture = XRenderCreatePicture(xGlobalDisplay, xBitmap.pixmap, format, CPComponentAlpha, &attributes);
         if(bitmap.transparent && bitmap.pixelFormat != pixelFormatAlpha)
            xBitmap.maskPicture = XRenderCreatePicture(xGlobalDisplay, xBitmap.mask, XRenderFindStandardFormat(xGlobalDisplay, PictStandardA1), CPComponentAlpha, &attributes);
      }

      gc = XCreateGC(xGlobalDisplay, (Pixmap)xBitmap.pixmap, 0, null);

      XSetGraphicsExposures(xGlobalDisplay, gc, False);

      image.width = bitmap.width;
      image.height = bitmap.height;

      if(bitmap.pixelFormat == pixelFormatAlpha)
      {
         image.depth = 8;
         image.bitmap_pad = 8;
         image.bytes_per_line = bitmap.stride;
         image.bits_per_pixel = 8;
      }
      else
      {
         image.depth = bitmap.alphaBlend ? 32 : ((bitmap.pixelFormat == pixelFormat888) ? 24 : xSystemDepth);
         image.bitmap_pad = (bitmap.pixelFormat == pixelFormat888) ? 32 : 16;
         image.bytes_per_line = ((bitmap.pixelFormat == pixelFormat888) ? 4 : 2) * bitmap.stride;
         image.bits_per_pixel = (bitmap.pixelFormat == pixelFormat888) ? 32 : 16;
      }

      image.format = ZPixmap;
      //image.bitmap_bit_order = MSBFirst;
      #ifdef __BIG_ENDIAN__
      image.byte_order = MSBFirst;
      #endif
      image.bitmap_unit = 8;
      /*
      image.red_mask   = 0xF800;
      image.green_mask = 0x7E0;
      image.blue_mask  = 0x1F;
      */

      /*
      image.red_mask   = 0x0000FF;
      image.green_mask = 0x00FF00;
      image.blue_mask  = 0xFF0000;
      */
      // image.red_mask  = 0xFFFF0000;

      image.data = bitmap.picture;
      XInitImage(&image);

      if(bitmap.pixelFormat != pixelFormatAlpha && bitmap.alphaBlend)
      {
         int x,y;
         for(y = 0; y<bitmap.height; y++)
         {
            for(x = 0; x<bitmap.width; x++)
            {
               ColorAlpha * p = ((ColorAlpha *)bitmap.picture) + y * bitmap.stride + x;
               int alpha = p->a;
               p->color.r = (byte)(p->color.r * alpha / 255);
               p->color.g = (byte)(p->color.g * alpha / 255);
               p->color.b = (byte)(p->color.b * alpha / 255);
            }
         }
      }

      XPutImage(xGlobalDisplay, (Pixmap)xBitmap.pixmap, gc, &image,
         0, 0, 0, 0, bitmap.width,bitmap.height);

      if(bitmap.transparent && !bitmap.alphaBlend && bitmap.pixelFormat != pixelFormatAlpha)
         PutBitmapMask(xBitmap.mask, bitmap);

      XFreeGC(xGlobalDisplay, gc);

      if(!bitmap.keepData)
         delete bitmap.picture;

      bitmap.driverData = xBitmap;
      bitmap.driver = displaySystem.driver;
      return true;
   }

   void ReleaseSurface(Display display, Surface surface)
   {
      XSurface xSurface = surface.driverData;
      XDisplay xDisplay = display ? display.driverData : null;
      XRectangle rectangle;

      if(xSurface.colorPicture)
         XRenderFreePicture(xGlobalDisplay, xSurface.colorPicture);

      rectangle.x = 0;
      rectangle.y = 0;
      if(display)
      {
         rectangle.width = (uint16)display.width;
         rectangle.height = (uint16)display.height;
         XRenderSetPictureClipRectangles(xGlobalDisplay, xDisplay.picture, 0, 0, &rectangle, 1);
      }

      if(xSurface.colorPixmap)
         XFreePixmap(xGlobalDisplay, xSurface.colorPixmap);

      delete xSurface;
   }

   bool GetBitmapSurface(DisplaySystem displaySystem, Surface surface, Bitmap bitmap, int x, int y, Box clip)
   {
      bool result = false;
      XBitmap xBitmap = bitmap.driverData;
      XSurface xSurface;

      if((surface.driverData = xSurface = XSurface { }))
      {
         surface.offset.x = x;
         surface.offset.y = y;
         surface.unclippedBox = surface.box = clip;

         xSurface.pixmap = xBitmap.pixmap;

         result = true;
      }
      return result;
   }

   bool GetSurface(Display display, Surface surface, int x,int y, Box clip)
   {
      bool result = false;
      XDisplay xDisplay = display.driverData;
      XSurface xSurface;
      if((surface.driverData = xSurface = XSurface { }))
      {
         XRectangle rectangle;

         surface.offset.x = x;
         surface.offset.y = y;
         surface.unclippedBox = surface.box = clip;
         xSurface.pixmap = xDisplay.pixmap;
         xSurface.picture = xDisplay.picture;

         xSurface.colorPixmap = XCreatePixmap(xGlobalDisplay, (X11Window)confineWindow /*display.window*/, 1, 1, /*(xSystemDepth == 16) ? 16 : */32);

         rectangle.x = (short)(clip.left + x);
         rectangle.y = (short)(clip.top + y);
         rectangle.width = (short)(clip.right - clip.left + 1);
         rectangle.height = (short)(clip.bottom - clip.top + 1);

         XSetClipRectangles(xGlobalDisplay, xDisplay.gc, 0,0, &rectangle, 1, YXBanded);
         XRenderSetPictureClipRectangles(xGlobalDisplay, xDisplay.picture, 0, 0, &rectangle, 1);

         xDisplay.updateBox.left  = Min(x + clip.left,  xDisplay.updateBox.left);
         xDisplay.updateBox.top   = Min(y + clip.top,   xDisplay.updateBox.top);
         xDisplay.updateBox.right = Max(x + clip.right, xDisplay.updateBox.right);
         xDisplay.updateBox.bottom  = Max(y + clip.bottom,  xDisplay.updateBox.bottom);

         result = true;
      }
      return result;
   }

   void Clip(Display display, Surface surface, Box clip)
   {
      XSurface xSurface = surface.driverData;
      XDisplay xDisplay = display.driverData;
      bool changed = false;
      XRectangle rectangle;
      if(clip != null)
      {
         Box box = clip;

         box.Clip(surface.unclippedBox);

         surface.box = box;

         xSurface.clipped = true;
         changed = true;
      }
      else if(xSurface.clipped)
      {
         surface.box = surface.unclippedBox;
         xSurface.clipped = false;
         changed = true;
      }
      if(changed)
      {
         XRectangle rectangle =
         {
            (short)(surface.box.left + surface.offset.x),
            (short)(surface.box.top + surface.offset.y),
            (short)(surface.box.right - surface.box.left + 1),
            (short)(surface.box.bottom - surface.box.top + 1)
         };
         XSetClipRectangles(xGlobalDisplay, xDisplay.gc,
            0,0, &rectangle, 1, YXBanded);
      }
   }

   bool GrabScreen(Display display, Bitmap bitmap, int x, int y, unsigned int w, unsigned int h)
   {
      bool result = false;
      XDisplay xDisplay = display ? display.driverData : null;
      XImage * xImage;
      PixelFormat format = pixelFormat888;
      Bitmap source { };
      int sx = x, sy = y;
      int dx = 0, dy = 0;
      int sw = w, sh = h;

      if(sx<0)
      {
         dx+=-sx;
         sw-=-sx;
         sx=0;
      }
      if(sy<0)
      {
         dy+=0-sy;
         sh-=0-sy;
         sy=0;
      }
      if(display)
      {
         if(sx+sw>display.width-1)
            sw-=sx+sw-(display.width-1)-1;
         if(sy+sh>display.height-1)
            sh-=sy+sh-(display.height-1)-1;
      }

      if(display)
         xImage = XGetImage(xGlobalDisplay, xDisplay.pixmap, sx, sy, sw, sh, MAXDWORD, ZPixmap);
      else
         xImage = XGetImage(xGlobalDisplay, DefaultRootWindow(xGlobalDisplay), sx, sy, sw, sh, MAXDWORD, ZPixmap);

      source.pixelFormat = format;
      source.picture = xImage->data;
      source.width = sw;
      source.height = sh;
      source.stride = xImage->bytes_per_line / 4;

      if(!bitmap || bitmap.pixelFormat != format || bitmap.width < w || bitmap.height < h)
      {
         bitmap.Free();
         bitmap.Allocate(null, w,h,w, format, (format == pixelFormat8)?true:false);
      }
      if(bitmap)
      {
         Surface surface = bitmap.GetSurface(0, 0, null);
         surface.Blit(source, dx,dy,0,0,sw,sh);
         delete surface;
         result = true;
      }
      source.picture = null;
      delete source;

      XDestroyImage(xImage);
      return result;
   }

   void SetForeground(Display display, Surface surface, ColorAlpha color)
   {
      XSurface xSurface = surface.driverData;
      XDisplay xDisplay = display ? display.driverData : null;
      XRenderColor renderColor = { color.color.r * color.a, color.color.g * color.a, color.color.b * color.a, color.a * 255};
      X11Picture colorPicture;

      if(xSurface.colorPicture)
         XRenderFreePicture(xGlobalDisplay, xSurface.colorPicture);
      // xSurface.colorPicture = XRenderCreateSolidFill(xGlobalDisplay, &renderColor);

      {
         XRenderPictureAttributes attributes = { 0 };
         // XRenderPictFormat * format = myXRenderFindStandardFormat(xGlobalDisplay, PictStandardARGB32  /*PictStandardRGB24 /*PictStandardARGB32*/, 1);
         XRenderPictFormat * format = /*(xSystemPixelFormat != pixelFormat888) ? GetXRenderFormat(xSystemPixelFormat, false) : */XRenderFindStandardFormat(xGlobalDisplay, PictStandardARGB32);
         #if !defined(__APPLE__) && !defined(__OLDX__)
         attributes.repeat = RepeatNormal;
         #else
         attributes.repeat = 1;
         #endif
         ///attributes.component_alpha = 0;
         if(format)
            xSurface.colorPicture = XRenderCreatePicture(xGlobalDisplay, xSurface.colorPixmap, format, /*CPComponentAlpha | */CPRepeat, &attributes);
         XRenderFillRectangle(xGlobalDisplay, PictOpSrc, xSurface.colorPicture, &renderColor, 0, 0, 1, 1);
      }

      // xSurface.foreground = ARGB(A(color),B(color),G(color),R(color));
      xSurface.foreground = color;

      if(xDisplay)
         XSetForeground(xGlobalDisplay, xDisplay.gc, (xSystemPixelFormat == pixelFormat888) ? xSurface.foreground :
            ((xSystemPixelFormat == pixelFormat565) ? ((Color565)xSurface.foreground) : ((Color555)xSurface.foreground)));
   }

   void SetBackground(Display display, Surface surface, ColorAlpha color)
   {
      XSurface xSurface = surface.driverData;
      XDisplay xDisplay = display ? display.driverData : null;
      // xSurface.background = ARGB(A(color),B(color),G(color),R(color));
      xSurface.background = color;

      if(xDisplay)
         XSetBackground(xGlobalDisplay, xDisplay.gc, (xSystemPixelFormat == pixelFormat888) ? xSurface.background :
            ((xSystemPixelFormat == pixelFormat565) ? ((Color565)xSurface.background) : ((Color555)xSurface.background)));
   }

   ColorAlpha GetPixel(Display display, Surface surface, int x, int y)
   {
      return 0;
   }

   void PutPixel(Display display, Surface surface,int x,int y)
   {
      XSurface xSurface = surface.driverData;
      XDisplay xDisplay = display.driverData;

      if(xSurface.foreground.a < 255)
         DrawLine(display, surface, x,y,x,y);
      else
         XDrawPoint(xGlobalDisplay, (Pixmap)xDisplay.pixmap, xDisplay.gc,
            x + surface.offset.x,
            y + surface.offset.y);
   }

   void DrawLine(Display display, Surface surface, int x1, int y1, int x2, int y2)
   {
      XDisplay xDisplay = display ? display.driverData : null;
      XSurface xSurface = surface.driverData;
      if(!xDisplay || xSurface.foreground.a < 255)
      {
         XTrapezoid traps[3];
         int nTraps = 0;
         double offset = 0.5;
         double width = 0.5;

         x1 += surface.offset.x;
         y1 += surface.offset.y;
         x2 += surface.offset.x;
         y2 += surface.offset.y;

         if(y1 == y2)
         {
            x2++;
            x1--;
            {
               XTrapezoid trap1 =
               {
                  XDoubleToFixed(y1 - width + offset), XDoubleToFixed(y1 + width + offset),
                  { { XDoubleToFixed(Min(x1, x2) - 0 + offset), XDoubleToFixed(y1 - width + offset) }, { XDoubleToFixed(Min(x1, x2) + 0.0 + offset), XDoubleToFixed(y1 + width+ offset) } },
                  { { XDoubleToFixed(Max(x1, x2) - 0 + offset), XDoubleToFixed(y1 - width + offset) }, { XDoubleToFixed(Max(x1, x2) + 0.0 + offset), XDoubleToFixed(y1 + width+ offset) } },
               };
               traps[0] = trap1;
               nTraps = 1;
            }
         }
         else if(x1 == x2)
         {
            y2++;
            y1--;
            {
               XTrapezoid trap1 =
               {
                  XDoubleToFixed(Min(y1, y2) - 0.0 + offset), XDoubleToFixed(Max(y1, y2) + 0.0 + offset),
                  { { XDoubleToFixed(x1 - width + offset), XDoubleToFixed(Min(y1, y2) - 0.0 + offset) }, { XDoubleToFixed(x1 - width + offset), XDoubleToFixed(Max(y1, y2) + 0.0 + offset) } },
                  { { XDoubleToFixed(x1 + width + offset), XDoubleToFixed(Min(y1, y2) - 0.0 + offset) }, { XDoubleToFixed(x1 + width + offset), XDoubleToFixed(Max(y1, y2) + 0.0 + offset) } },
               };
               traps[0] = trap1;
               nTraps = 1;
            }
         }
         else
         {
            double dx, dy, l;
            Pointf A, B, C, D, E, F;
            if(y1 > y2)
            {
               int tmp = y2;
               y2 = y1;
               y1 = tmp;
               tmp = x2;
               x2 = x1;
               x1 = tmp;
            }

            dx = x2 - x1;
            dy = y2 - y1;
            l = sqrt(dx * dx + dy * dy);
            dx /= l;
            dy /= l;

            if(x2 > x1)
            {
               A = { (float)(x1 + dy * width), (float)(y1 - dx * width) };
               B = { (float)(x1 - dy * width), (float)(y1 + dx * width) };
               C = { (float)(A.x + ((B.y - A.y) * dx / dy)), B.y };
               E = { (float)(x2 + dy * width), (float)(y2 - dx * width) };
               F = { (float)(x2 - dy * width), (float)(y2 + dx * width) };
               D = { (float)(F.x + ((E.y - F.y) * dx / dy)), E.y };

               {
                  XTrapezoid trap1 =
                  {
                     XDoubleToFixed(A.y + offset), XDoubleToFixed(B.y + offset),
                     { { XDoubleToFixed(A.x + offset), XDoubleToFixed(A.y + offset) }, { XDoubleToFixed(B.x + offset), XDoubleToFixed(B.y + offset) } },
                     { { XDoubleToFixed(A.x + offset), XDoubleToFixed(A.y + offset) }, { XDoubleToFixed(C.x + offset), XDoubleToFixed(C.y + offset) } }
                  };
                  XTrapezoid trap2 =
                  {
                     XDoubleToFixed(B.y + offset), XDoubleToFixed(D.y + offset),
                     { { XDoubleToFixed(B.x + offset), XDoubleToFixed(B.y + offset) }, { XDoubleToFixed(D.x + offset), XDoubleToFixed(D.y + offset) } },
                     { { XDoubleToFixed(C.x + offset), XDoubleToFixed(C.y + offset) }, { XDoubleToFixed(E.x + offset), XDoubleToFixed(E.y + offset) } }
                  };
                  XTrapezoid trap3 =
                  {
                     XDoubleToFixed(D.y + offset), XDoubleToFixed(F.y + offset),
                     { { XDoubleToFixed(D.x + offset), XDoubleToFixed(D.y + offset) }, { XDoubleToFixed(F.x + offset), XDoubleToFixed(F.y + offset) } },
                     { { XDoubleToFixed(E.x + offset), XDoubleToFixed(E.y + offset) }, { XDoubleToFixed(F.x + offset), XDoubleToFixed(F.y + offset) } },
                  };
                  traps[0] = trap1;
                  traps[1] = trap2;
                  traps[2] = trap3;
                  nTraps = 3;
               }
            }
            else
            {
               A = { (float)(x1 - dy * width), (float)(y1 + dx * width) };
               B = { (float)(x1 + dy * width), (float)(y1 - dx * width) };
               C = { (float)(A.x + ((B.y - A.y) * dx / dy)), B.y };
               E = { (float)(x2 - dy * width), (float)(y2 + dx * width) };
               F = { (float)(x2 + dy * width), (float)(y2 - dx * width) };
               D = { (float)(F.x + ((E.y - F.y) * dx / dy)), E.y };

               {
                  XTrapezoid trap1 =
                  {
                     XDoubleToFixed(A.y + offset), XDoubleToFixed(B.y + offset),
                     { { XDoubleToFixed(A.x + offset), XDoubleToFixed(A.y + offset) }, { XDoubleToFixed(C.x + offset), XDoubleToFixed(C.y + offset) } },
                     { { XDoubleToFixed(A.x + offset), XDoubleToFixed(A.y + offset) }, { XDoubleToFixed(B.x + offset), XDoubleToFixed(B.y + offset) } }
                  };
                  XTrapezoid trap2 =
                  {
                     XDoubleToFixed(B.y + offset), XDoubleToFixed(D.y + offset),
                     { { XDoubleToFixed(C.x + offset), XDoubleToFixed(C.y + offset) }, { XDoubleToFixed(E.x + offset), XDoubleToFixed(E.y + offset) } },
                     { { XDoubleToFixed(B.x + offset), XDoubleToFixed(B.y + offset) }, { XDoubleToFixed(D.x + offset), XDoubleToFixed(D.y + offset) } }
                  };
                  XTrapezoid trap3 =
                  {
                     XDoubleToFixed(D.y + offset), XDoubleToFixed(F.y + offset),
                     { { XDoubleToFixed(E.x + offset), XDoubleToFixed(E.y + offset) }, { XDoubleToFixed(F.x + offset), XDoubleToFixed(F.y + offset) } },
                     { { XDoubleToFixed(D.x + offset), XDoubleToFixed(D.y + offset) }, { XDoubleToFixed(F.x + offset), XDoubleToFixed(F.y + offset) } }
                  };
                  traps[0] = trap1;
                  traps[1] = trap2;
                  traps[2] = trap3;
                  nTraps = 3;
               }
            }
            /*
            printf("Line: (%d, %d)-(%d, %d)\n", x1,y1, x2,y2);
            printf("Line: A = (%.2f, %.2f), B = (%.2f, %.2f), C = (%.2f, %.2f)\n", A.x,A.y, B.x,B.y, C.x,C.y);
            printf("Line: D = (%.2f, %.2f), E = (%.2f, %.2f), F = (%.2f, %.2f)\n", D.x,D.y, E.x,E.y, F.x,F.y);
            printf("Trap1: top = %.2f, bottom = %.2f, left = (%.2f, %.2f)-(%.2f, %.2f), right = (%.2f, %.2f)-(%.2f, %.2f)\n",
               traps[0].top / 65536.0, traps[0].bottom / 65536.0,
               traps[0].left.p1.x / 65536.0, traps[0].left.p1.y / 65536.0, traps[0].left.p2.x / 65536.0, traps[0].left.p2.y / 65536.0,
               traps[0].right.p1.x / 65536.0, traps[0].right.p1.y / 65536.0, traps[0].right.p2.x / 65536.0, traps[0].right.p2.y / 65536.0);
            printf("Trap2: top = %.2f, bottom = %.2f, left = (%.2f, %.2f)-(%.2f, %.2f), right = (%.2f, %.2f)-(%.2f, %.2f)\n",
               traps[1].top / 65536.0, traps[1].bottom / 65536.0,
               traps[1].left.p1.x / 65536.0,  traps[1].left.p1.y / 65536.0,  traps[1].left.p2.x / 65536.0,  traps[1].left.p2.y / 65536.0,
               traps[1].right.p1.x / 65536.0, traps[1].right.p1.y / 65536.0, traps[1].right.p2.x / 65536.0, traps[1].right.p2.y / 65536.0);
            printf("Trap3: top = %.2f, bottom = %.2f, left = (%.2f, %.2f)-(%.2f, %.2f), right = (%.2f, %.2f)-(%.2f, %.2f)\n",
               traps[2].top / 65536.0, traps[2].bottom / 65536.0,
               traps[2].left.p1.x / 65536.0,  traps[2].left.p1.y / 65536.0,  traps[2].left.p2.x / 65536.0,  traps[2].left.p2.y / 65536.0,
               traps[2].right.p1.x / 65536.0, traps[2].right.p1.y / 65536.0, traps[2].right.p2.x / 65536.0, traps[2].right.p2.y / 65536.0);
            printf("\n");
            */
         }
         XRenderCompositeTrapezoids(xGlobalDisplay, PictOpOver, xSurface.colorPicture, xSurface.picture, None, 0, 0, traps, nTraps);
      }
      else
         XDrawLine(xGlobalDisplay, (Pixmap)xDisplay.pixmap, xDisplay.gc,
            x1 + surface.offset.x,
            y1 + surface.offset.y,
            x2 + surface.offset.x,
            y2 + surface.offset.y);
   }

   void Rectangle(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      XDisplay xDisplay = display ? display.driverData : null;
      XSurface xSurface = surface.driverData;

      if(!xDisplay || xSurface.foreground.a < 255)
      {
         DrawLine(display, surface,x1,y1,x2-1,y1);
         DrawLine(display, surface,x2,y1,x2,y2-1);
         DrawLine(display, surface,x1,y2,x2-1,y2);
         DrawLine(display, surface,x1,y1+1,x1,y2-1);
      }
      else
         XDrawRectangle(xGlobalDisplay, (Pixmap)xDisplay.pixmap, xDisplay.gc,
            x1 + surface.offset.x,
            y1 + surface.offset.y,
            x2 - x1, y2 - y1);
   }

   void Area(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      XDisplay xDisplay = display ? display.driverData : null;
      XSurface xSurface = surface.driverData;
      if(!xDisplay || xSurface.background.a < 255)
      {
         XRenderColor renderColor =
         {
            (uint16)(xSurface.background.color.r * xSurface.background.a),
            (uint16)(xSurface.background.color.g * xSurface.background.a),
            (uint16)(xSurface.background.color.b * xSurface.background.a),
            (uint16)xSurface.background.a * 255
         };
         x1 += surface.offset.x;
         y1 += surface.offset.y;
         x2 += surface.offset.x;
         y2 += surface.offset.y;
         XRenderFillRectangle(xGlobalDisplay, PictOpOver, xSurface.picture, &renderColor, x1, y1, (x2 - x1) + 1, (y2 - y1) + 1);
      }
      else
      {
         XSetForeground(xGlobalDisplay, xDisplay.gc, (xSystemPixelFormat == pixelFormat888) ? xSurface.background :
            ((xSystemPixelFormat == pixelFormat565) ? ((Color565)xSurface.background) : ((Color555)xSurface.background)));
         XFillRectangle(xGlobalDisplay, (Pixmap) xDisplay.pixmap, xDisplay.gc,
            x1 + surface.offset.x,
            y1 + surface.offset.y,
            x2 - x1 + 1, y2 - y1 + 1);
         XSetForeground(xGlobalDisplay, xDisplay.gc, (xSystemPixelFormat == pixelFormat888) ? xSurface.foreground :
            ((xSystemPixelFormat == pixelFormat565) ? ((Color565)xSurface.foreground) : ((Color555)xSurface.foreground)));
      }
   }

   void Clear(Display display, Surface surface, ClearType flags)
   {
      if(flags != depthBuffer)
      {
         // XDisplay xDisplay = display.driverData;
         XSurface xSurface = surface.driverData;
         if(xSurface.background.a < 255)
         {
            int x1 = surface.box.left;
            int y1 = surface.box.top;
            int x2 = surface.box.right;
            int y2 = surface.box.bottom;
            XRenderColor renderColor =
            {
               (uint16)(xSurface.background.color.r * xSurface.background.a),
               (uint16)(xSurface.background.color.g * xSurface.background.a),
               (uint16)(xSurface.background.color.b * xSurface.background.a),
               (uint16)xSurface.background.a * 255
            };
            x1 += surface.offset.x;
            y1 += surface.offset.y;
            x2 += surface.offset.x;
            y2 += surface.offset.y;
            XRenderFillRectangle(xGlobalDisplay, PictOpSrc, xSurface.picture, &renderColor, x1, y1, (x2 - x1) + 1, (y2 - y1) + 1);
         }
         else
            Area(display, surface,surface.box.left,surface.box.top,surface.box.right,surface.box.bottom);
      }
   }

   bool ConvertBitmap(DisplaySystem displaySystem, Bitmap src, PixelFormat format, ColorAlpha * palette)
   {
      return true;
   }

   bool AllocateBitmap(DisplaySystem displaySystem, Bitmap bitmap, int width, int height, int stride, PixelFormat format, bool allocatePalette)
   {
      bool result = false;
      XBitmap xBitmap = bitmap.driverData = XBitmap { };
      if(xBitmap)
      {
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
         bitmap.size = (uint)stride * (uint)height;
         bitmap.sizeBytes = bitmap.size << GetColorDepthShifts(format);
         bitmap.pixelFormat = format;
         bitmap.transparent = false;
         bitmap.allocatePalette = allocatePalette;
         if(allocatePalette)
         {
            bitmap.palette = new ColorAlpha[256];
            if(bitmap.palette)
               CopyBytesBy4(bitmap.palette, GetDefaultPalette(), 256);
         }
         else
            bitmap.palette = GetDefaultPalette();

         result = true;

         if(!result)
            FreeBitmap(displaySystem, bitmap);
      }

      return result;
   }

   void Blit(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h)
   {
      XDisplay xDisplay = display.driverData;
      XSurface xSurface = surface.driverData;
      XBitmap xBitmap = src.driverData;
      if(xBitmap)
      {
         bool flip;
         if(!ClipBlitCoords(surface, src, &dx, &dy, &sx, &sy, &w, &h, &flip))
            return;

         dx += surface.offset.x;
         dy += surface.offset.y;

         if(src.transparent && !src.alphaBlend && !display.alphaBlend)
         {
            XSetClipMask(xGlobalDisplay, xDisplay.gc, xBitmap.mask);
            XSetClipOrigin(xGlobalDisplay, xDisplay.gc, dx - sx, dy - sy);
         }
         if(xSurface.xOffset)
         {
            XTransform transform =
            {
               {
                  { (int)(1.0f * (1<<16)), (int)(0.0f * (1<<16)), -(xSurface.xOffset << 10) },
                  { (int)(0.0f), (int)(-1.0f * (1<<16)), (int)(0.0f * (1<<16)) },
                  { (int)(0.0f * (1<<16)), (int)(0.0f * (1<<16)), (int)(1.0f * (1<<16)) }
               }
            };
            // printf("XOffset: %d\n", xSurface.xOffset);
            XRenderSetPictureTransform(xGlobalDisplay, xBitmap.picture, &transform);
         }

         if(src.alphaBlend || display.alphaBlend)
         {
            if(src.pixelFormat == pixelFormatAlpha)
            {
               XRenderComposite(xGlobalDisplay, PictOpOver, xSurface.colorPicture, xBitmap.picture, xSurface.picture, 0, 0, sx, sy, dx, dy, w + (xSurface.xOffset ? 1 : 1), h);
            }
            else if(src.alphaBlend)
               XRenderComposite(xGlobalDisplay, PictOpOver, xBitmap.picture, None, xSurface.picture, sx, sy, sx, sy, dx, dy, w, h);
            else
               XRenderComposite(xGlobalDisplay, PictOpOver, xBitmap.picture, xBitmap.maskPicture, xSurface.picture, sx, sy, sx, sy, dx, dy, w, h);
         }
         else
            XCopyArea(xGlobalDisplay, (Pixmap)xBitmap.pixmap, (Pixmap)xSurface.pixmap, xDisplay.gc,
               sx, sy, w, h, dx, dy);

         if(xSurface.xOffset)
         {
            XTransform identity =
            {
               {
                  { (int)(1.0f * (1<<16)), (int)(0.0f * (1<<16)), (int)(0.0f * (1<<16)) },
                  { (int)(0.0f * (1<<16)), (int)(1.0f * (1<<16)), (int)(0.0f * (1<<16)) },
                  { (int)(0.0f * (1<<16)), (int)(0.0f * (1<<16)), (int)(1.0f * (1<<16)) }
               }
            };
            XRenderSetPictureTransform(xGlobalDisplay, xBitmap.picture, &identity);
         }
         if(src.transparent && !src.alphaBlend && !display.alphaBlend)
         {
            XSetClipOrigin(xGlobalDisplay, xDisplay.gc, 0, 0);
            {
               XRectangle rectangle;

               rectangle.x = (short)(surface.unclippedBox.left + surface.offset.x);
               rectangle.y = (short)(surface.unclippedBox.top + surface.offset.y);
               rectangle.width = (short)(surface.unclippedBox.right - surface.unclippedBox.left + 1);
               rectangle.height = (short)(surface.unclippedBox.bottom - surface.unclippedBox.top + 1);

               XSetClipRectangles(xGlobalDisplay, xDisplay.gc, 0,0, &rectangle, 1, YXBanded);
            }
         }
      }
   }

   void Stretch(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      XDisplay xDisplay = display.driverData;
      XSurface xSurface = surface.driverData;
      XBitmap xBitmap = src.driverData;
      if(xBitmap)
      {
         XTransform transform =
         {
            {
               { (int)((float)sw / w * (1<<16)), (int)(0.0f * (1<<16)), (int)(0.0f * (1<<16)) },
               { (int)(0.0f * (1<<16)), (int)((float)sh / h * (1<<16)), (int)(0.0f * (1<<16)) },
               { (int)(0.0f * (1<<16)), (int)(0.0f * (1<<16)), (int)(1.0f * (1<<16)) }
            }
         };
         XTransform identity =
         {
            {
               { (int)(1.0f * (1<<16)), (int)(0.0f * (1<<16)), (int)(0.0f * (1<<16)) },
               { (int)(0.0f * (1<<16)), (int)(1.0f * (1<<16)), (int)(0.0f * (1<<16)) },
               { (int)(0.0f * (1<<16)), (int)(0.0f * (1<<16)), (int)(1.0f * (1<<16)) }
            }
         };
         dx += surface.offset.x;
         dy += surface.offset.y;

         XRenderSetPictureTransform(xGlobalDisplay, xBitmap.picture, &transform);

         if(src.pixelFormat == pixelFormatAlpha)
            XRenderComposite(xGlobalDisplay, PictOpOver, xSurface.colorPicture, xBitmap.picture, xSurface.picture, 0, 0, sx, sy, dx, dy, w, h);
         else if(src.alphaBlend)
            XRenderComposite(xGlobalDisplay, PictOpOver, xBitmap.picture, None, xSurface.picture, sx, sy, sx, sy, dx, dy, w, h);
         else
         {
            XRenderSetPictureTransform(xGlobalDisplay, xBitmap.maskPicture, &transform);
            XRenderComposite(xGlobalDisplay, PictOpOver, xBitmap.picture, xBitmap.maskPicture, xSurface.picture, sx, sy, sx, sy, dx, dy, w, h);
            XRenderSetPictureTransform(xGlobalDisplay, xBitmap.maskPicture, &identity);
         }
         XRenderSetPictureTransform(xGlobalDisplay, xBitmap.picture, &identity);
      }
   }

   void Filter(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      XBitmap xBitmap = src.driverData;
      if(xBitmap)
      {
         XRenderSetPictureFilter(xGlobalDisplay, xBitmap.picture, "bilinear", null, 0);
         Stretch(display, surface, src, dx, dy, sx, sy, w, h, sw, sh);
         XRenderSetPictureFilter(xGlobalDisplay, xBitmap.picture, "nearest", null, 0);
      }
   }

   void BlitDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h)
   {
      XImage image = { 0 };
      XDisplay xDisplay = display ? display.driverData : null;
      XSurface xSurface = surface.driverData;
      bool flip;

      if(!xDisplay || !src.picture || !ClipBlitCoords(surface, src, &dx, &dy, &sx, &sy, &w, &h, &flip))
         return;

      if(src.pixelFormat == display.pixelFormat)
      {
         image.width = src.width;
         image.height = src.height;
         image.depth = (src.pixelFormat == pixelFormat888) ? 24 : xSystemDepth;
         image.bitmap_pad = (src.pixelFormat == pixelFormat888) ? 32 : 16;
         image.format = ZPixmap;
         image.bitmap_unit = 8;
         image.bytes_per_line = ((src.pixelFormat == pixelFormat888) ? 4 : 2) * src.stride;
         image.bits_per_pixel = (src.pixelFormat == pixelFormat888) ? 32 : 16;

         image.data = src.picture;
         XInitImage(&image);

         XPutImage(xGlobalDisplay, (Pixmap)xSurface.pixmap, xDisplay.gc, &image,
            sx, sy, dx + surface.offset.x, dy + surface.offset.y, w,h);
      }
      else
      {
         Bitmap temp { };
         Surface s;
         temp.Allocate(null, w, h, 0, xSystemPixelFormat, false);
         s = temp.GetSurface(0,0,null);
         s.Blit(src, 0,0, sx,sy, flip ? -w : w, h);

         image.width = w;
         image.height = h;
         image.depth = (temp.pixelFormat == pixelFormat888) ? 24 : xSystemDepth;
         image.bitmap_pad = (temp.pixelFormat == pixelFormat888) ? 32 : 16;
         image.format = ZPixmap;
         image.bitmap_unit = 8;
         image.bytes_per_line = ((temp.pixelFormat == pixelFormat888) ? 4 : 2) * temp.stride;
         image.bits_per_pixel = (temp.pixelFormat == pixelFormat888) ? 32 : 16;

         image.data = temp.picture;

         XInitImage(&image);
         if(!src.transparent)
         {
            // printf("Stride: %d, dx: %d, dy: %d, w: %d, h: %d, %d\n", temp.stride, dx + surface.offset.x, dy + surface.offset.y, w,h, xSystemDepth);
            XPutImage(xGlobalDisplay, (Pixmap)xSurface.pixmap, xDisplay.gc, &image,
               0, 0, dx + surface.offset.x, dy + surface.offset.y, w,h);
         }
         else
         {
         #if 0
            GC maskGC = 0, gc = 0;
            Pixmap pixmap, mask;

            pixmap = XCreatePixmap(xGlobalDisplay, (X11Window)confineWindow /*display.window*/, w, h, xSystemDepth /*24*/);
            mask = XCreatePixmap(xGlobalDisplay, (X11Window)confineWindow /*display.window*/, w, h, 1);

            gc = XCreateGC(xGlobalDisplay, pixmap, 0, null);
            maskGC = XCreateGC(xGlobalDisplay, mask, 0, null);
            XSetGraphicsExposures(xGlobalDisplay, gc, False);
            XSetGraphicsExposures(xGlobalDisplay, maskGC, False);

            XPutImage(xGlobalDisplay, pixmap, gc, &image, 0, 0, 0, 0, w,h);
            XSetForeground(xGlobalDisplay, maskGC, 0);
            XFillRectangle(xGlobalDisplay, mask, maskGC, 0, 0, w, h);
            XSetForeground(xGlobalDisplay, maskGC, 1);
            if(temp.pixelFormat == pixelFormat888)
            {
               int x,y;
               for(y = 0; y<h; y++)
               {
                  for(x = 0; x<w; x++)
                  {
                     if(((ColorAlpha *)temp.picture)[y * temp.stride + x].a)
                        XDrawPoint(xGlobalDisplay, mask, maskGC, x, y);
                  }
               }
            }
            else if(src.pixelFormat == pixelFormat8)
            {
               int x,y;
               for(y = 0; y<h; y++)
               {
                  for(x = 0; x<w; x++)
                  {
                     if(src.picture[(y + sy) * src.stride + (flip ? (w-1-(sx + x)) : (sx + x)])
                        XDrawPoint(xGlobalDisplay, mask, maskGC, x, y);
                  }
               }
            }
            else
            {
               int x,y;
               for(y = 0; y<h; y++)
               {
                  for(x = 0; x<w; x++)
                  {
                     if(((uint16 *)temp.picture)[y * temp.stride + x])
                        XDrawPoint(xGlobalDisplay, mask, maskGC, x, y);
                  }
               }
            }

            XFreeGC(xGlobalDisplay, maskGC);
         #else
         GC gc = 0;
            Pixmap pixmap, mask;

            pixmap = XCreatePixmap(xGlobalDisplay, (X11Window)confineWindow /*display.window*/, w, h, xSystemDepth /*24*/);
            mask = XCreatePixmap(xGlobalDisplay, (X11Window)confineWindow /*display.window*/, w, h, 1);

            gc = XCreateGC(xGlobalDisplay, pixmap, 0, null);
            XSetGraphicsExposures(xGlobalDisplay, gc, False);

            XPutImage(xGlobalDisplay, pixmap, gc, &image, 0, 0, 0, 0, w,h);

         PutBitmapMask(mask, temp);
         #endif

            XSetClipMask(xGlobalDisplay, xDisplay.gc, mask);
            XSetClipOrigin(xGlobalDisplay, xDisplay.gc, dx + surface.offset.x, dy + surface.offset.y);
            XCopyArea(xGlobalDisplay, pixmap, (Pixmap)xSurface.pixmap, xDisplay.gc, 0, 0, w, h, dx + surface.offset.x, dy + surface.offset.y);
            XSetClipOrigin(xGlobalDisplay, xDisplay.gc, 0, 0);
            {
               XRectangle rectangle;

               rectangle.x = (short)(surface.unclippedBox.left + surface.offset.x);
               rectangle.y = (short)(surface.unclippedBox.top + surface.offset.y);
               rectangle.width = (short)(surface.unclippedBox.right - surface.unclippedBox.left + 1);
               rectangle.height = (short)(surface.unclippedBox.bottom - surface.unclippedBox.top + 1);

               XSetClipRectangles(xGlobalDisplay, xDisplay.gc, 0,0, &rectangle, 1, YXBanded);
            }

            XFreeGC(xGlobalDisplay, gc);
            XFreePixmap(xGlobalDisplay, pixmap);
            XFreePixmap(xGlobalDisplay, mask);
         }
         delete s;
         delete temp;
      }
   }

   void StretchDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      bool flip;
      if(ClipStretchCoords(surface, src, &dx, &dy, &sx, &sy, &w, &h, &sw, &sh, &flip))
      {
         XImage image = { 0 };
         XDisplay xDisplay = display.driverData;
         XSurface xSurface = surface.driverData;
         Bitmap temp { };
         Surface s;
         temp.Allocate(null, w, h, 0, xSystemPixelFormat, false);
         s = temp.GetSurface(0,0,null);
         s.Stretch(src, 0,0, sx,sy, w, h, sw, sh);

         image.width = w;
         image.height = h;
         image.depth = (temp.pixelFormat == pixelFormat888) ? 24 : xSystemDepth;
         image.bitmap_pad = (temp.pixelFormat == pixelFormat888) ? 32 : 16;
         image.format = ZPixmap;
         image.bitmap_unit = 8;
         image.bytes_per_line = ((temp.pixelFormat == pixelFormat888) ? 4 : 2) * temp.stride;
         image.bits_per_pixel = (temp.pixelFormat == pixelFormat888) ? 32 : 16;

         image.data = temp.picture;
         XInitImage(&image);

         // printf("Blitting DI\n");
         XPutImage(xGlobalDisplay, (Pixmap)xSurface.pixmap, xDisplay.gc, &image,
            0, 0, dx + surface.offset.x, dy + surface.offset.y, w,h);

         delete s;
         delete temp;
      }
   }

   void FilterDI(Display display, Surface surface, Bitmap src, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      bool flip;
      if(ClipStretchCoords(surface, src, &dx, &dy, &sx, &sy, &w, &h, &sw, &sh, &flip))
      {
         XImage image = { 0 };
         XDisplay xDisplay = display.driverData;
         XSurface xSurface = surface.driverData;
         Bitmap temp { };
         Surface s;
         temp.Allocate(null, w, h, 0, xSystemPixelFormat, false);
         s = temp.GetSurface(0,0,null);
         s.Filter(src, 0,0, sx,sy, w, h, sw, sh);

         image.width = w;
         image.height = h;
         image.depth = (temp.pixelFormat == pixelFormat888) ? 24 : xSystemDepth;
         image.bitmap_pad = (temp.pixelFormat == pixelFormat888) ? 32 : 16;
         image.format = ZPixmap;
         image.bitmap_unit = 8;
         image.bytes_per_line = ((temp.pixelFormat == pixelFormat888) ? 4 : 2) * temp.stride;
         image.bits_per_pixel = (temp.pixelFormat == pixelFormat888) ? 32 : 16;;

         image.data = temp.picture;
         XInitImage(&image);

         // printf("Blitting DI\n");
         XPutImage(xGlobalDisplay, (Pixmap)xSurface.pixmap, xDisplay.gc, &image,
            0, 0, dx + surface.offset.x, dy + surface.offset.y, w,h);

         delete s;
         delete temp;
      }
   }

   Font LoadFont(DisplaySystem displaySystem, char * faceName, float size, FontFlags flags)
   {
      Font font;
      font = ((subclass(DisplayDriver))class(LFBDisplayDriver)).LoadFont(displaySystem, faceName, size, flags);
      return font;
   }

   void UnloadFont(DisplaySystem displaySystem, Font font)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).UnloadFont(displaySystem, font);
   }

   void TextFont(Display display, Surface surface, Font font)
   {
      // XSurface xSurface = surface.driverData;
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).TextFont(display, surface, font);
   }

   void TextOpacity(Display display, Surface surface, bool opaque)
   {
      XSurface xSurface = surface.driverData;
      xSurface.opaque = opaque;
   }

   #define CHAR_WIDTH   6
   #define CHAR_HEIGHT  14

   void WriteText(Display display, Surface surface, int x, int y, char * text, int len)
   {
      XSurface xSurface = surface.driverData;
      XDisplay xDisplay = display.driverData;
      int tw, th;

      ((subclass(DisplayDriver))class(LFBDisplayDriver)).TextExtent(display, surface, text, len, &tw, &th);
      if(xSurface.opaque)
      {
#if 0
         XSetForeground(xGlobalDisplay, xDisplay.gc, xSurface.background);

         XFillRectangle(xGlobalDisplay, (Pixmap)xDisplay.pixmap, xDisplay.gc,
            x + surface.offset.x, y + surface.offset.y,
            tw /*len * CHAR_WIDTH*/, th /*CHAR_HEIGHT*/);

         XSetForeground(xGlobalDisplay, xDisplay.gc, xSurface.foreground);
#endif

         XRenderColor renderColor =
         {
            (uint16)(xSurface.background.color.r * xSurface.background.a),
            (uint16)(xSurface.background.color.g * xSurface.background.a),
            (uint16)(xSurface.background.color.b * xSurface.background.a),
            (uint16)xSurface.background.a
         };
         //printf("Filling rectangle\n");
         XRenderFillRectangle(xGlobalDisplay, PictOpSrc /*PictOpOver*/, xSurface.picture, &renderColor,
            x + surface.offset.x, y + surface.offset.y, tw, th);
      }
      /*
      XDrawString(xGlobalDisplay, (Pixmap)xDisplay.pixmap, xDisplay.gc,
         x + surface.offset.x, y + surface.offset.y + 12, text, len);
      */

      ((subclass(DisplayDriver))class(LFBDisplayDriver)).WriteText(display, surface, x, y, text, len);
   }

   void TextExtent(Display display, Surface surface, char * text, int len, int * width, int * height)
   {
      XSurface xSurface = surface.driverData;
      /*
      uint realLen;
      for(realLen = 0; realLen<len && text[realLen]; realLen++);
      if(width) *width = len * CHAR_WIDTH;
      if(height) *height = CHAR_HEIGHT;
      */

      FontExtent(display.displaySystem, xSurface.font, text, len, width, height);
   }

   void FontExtent(DisplaySystem displaySystem, Font font, char * text, int len, int * width, int * height)
   {
      /*
      if(width) *width = len * CHAR_WIDTH;
      if(height) *height = CHAR_HEIGHT;
      */
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).FontExtent(displaySystem, font, text, len, width, height);
   }

   void DrawingChar(Display display, Surface surface, byte character)
   {

   }

   void LineStipple(Display display, Surface surface, uint stipple)
   {
      XSurface xSurface = surface.driverData;
      XDisplay xDisplay = display.driverData;
      char list[32] = { 0 };
      int count = 0;

      if(stipple)
      {
         int c;
         int offset = 0;
         uint16 on = 0x8000;

         for(c = 0; c<32; c++)
         {
            if((stipple & 0x8000) == on)
               list[count]++;
            else
            {
               if(!list[count])
                  offset = 1;
               else
               {
                  count++;
                  list[count]++;
                  on ^= 0x8000;
               }
            }
            stipple <<= 1;
         }
         XSetLineAttributes(xGlobalDisplay, xDisplay.gc, 0, LineOnOffDash, CapButt, JoinMiter);
         XSetDashes(xGlobalDisplay, xDisplay.gc, offset, list, count);
      }
      else
      {
         list[0] = 4;
         count = 1;
         XSetLineAttributes(xGlobalDisplay, xDisplay.gc, 0, LineSolid, CapButt, JoinMiter);
         XSetDashes(xGlobalDisplay, xDisplay.gc, 0, list, count);
      }
   }

   bool Lock(Display display)
   {
      //XLockDisplay(xGlobalDisplay);
      return true;
   }

   void Unlock(Display display)
   {
      //XUnlockDisplay(xGlobalDisplay);
   }

   void StartUpdate(Display display)
   {

   }

   void Scroll(Display display, Box scroll, int x, int y, Extent dirty)
   {

   }

   void Update(Display display, Box updateBox)
   {
      XDisplay xDisplay = display.driverData;
      Box * box = (updateBox != null) ? updateBox : &xDisplay.updateBox;

      {
         XRectangle rectangle;
         rectangle.x = 0;
         rectangle.y = 0;
         rectangle.width = (uint16)display.width;
         rectangle.height = (uint16)display.height;
         XSetClipRectangles(xGlobalDisplay, xDisplay.gc, 0,0, &rectangle, 1, YXBanded);
      }
      /*if(display.alphaBlend)
         XRenderComposite(xGlobalDisplay, PictOpSrc, xDisplay.picture, None, xDisplay.windowPicture, box->left, box->top, 0, 0, box->left, box->top,
            box->right - box->left + 1, box->bottom - box->top + 1);
      else*/
         XCopyArea(xGlobalDisplay, (Pixmap)xDisplay.pixmap, (X11Window)display.window, xDisplay.gc /*windowGC*/,
            box->left, box->top,
            box->right - box->left + 1,
            box->bottom - box->top + 1,
            box->left, box->top);

      if(display.alphaBlend)
      {
         Box * box = &xDisplay.updateBox;
         XRenderComposite(xGlobalDisplay, PictOpSrc, xDisplay.picture, None, xDisplay.shapePicture, box->left, box->top, 0, 0, box->left, box->top,
            box->right - box->left + 1, box->bottom - box->top + 1);
         #if !defined(__APPLE__) && !defined(__OLDX__)
         XShapeCombineMask(xGlobalDisplay, (X11Window)display.window, ShapeInput, 0, 0, xDisplay.shapePixmap, ShapeSet);
         #else
         XShapeCombineMask(xGlobalDisplay, (X11Window)display.window, 2, 0, 0, xDisplay.shapePixmap, ShapeSet);
         #endif
      }

      XFlush(xGlobalDisplay);
      if(updateBox == null)
      {
         xDisplay.updateBox.left = display.width;
         xDisplay.updateBox.top = display.height;
         xDisplay.updateBox.right = 0;
         xDisplay.updateBox.bottom = 0;
      }
   }

   void EndUpdate(Display display)
   {

   }
}

default dllexport int __attribute__((stdcall)) IS_XGetPixmap(Bitmap bitmap)
{
   XBitmap xBitmap = bitmap.driverData;
   return xBitmap.pixmap;
}

default dllexport void __attribute__((stdcall)) IS_XGetSurfaceInfo(Surface surface, Pixmap * pixmap, GC * gc, int *x, int * y)
{
   Display display = surface.display;
   XDisplay xDisplay = display.driverData;

   *pixmap = xDisplay.pixmap;
   *gc = xDisplay.gc;
   *x = surface.offset.x;
   *y = surface.offset.y;
}

#endif
