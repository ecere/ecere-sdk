#define USEPBUFFER

namespace gfx::drivers;

#include <OpenGl/gl.h>

import "CocoaInterface.h"

import "Display"
import "Window"

#define glLoadMatrix glLoadMatrixd
#define glMultMatrix glMultMatrixd
#define glGetMatrix  glGetDoublev
#define glTranslate glTranslated
#define glScale glScaled

#define GL_ARRAY_BUFFER_ARB            0x8892
#define GL_ELEMENT_ARRAY_BUFFER_ARB    0x8893
#define GL_STATIC_DRAW_ARB             0x88E4
#define GL_LIGHT_MODEL_COLOR_CONTROL   0x81F8
#define GL_SEPARATE_SPECULAR_COLOR     0x81FA

#define GL_MULTISAMPLE_ARB             0x809D

//static int displayWidth, displayHeight;

#define GL_CLAMP_TO_EDGE 0x812F

class DisplayData : struct
{
   ColorAlpha * flippingBuffer;
   int flipBufH, flipBufW;
   bool depthWrite;
   int x, y;
   uint stride;
   byte * picture;
};

class SystemData : struct
{
   bool loadingFont;
};

class SurfaceData : struct
{
   Font font;
   bool opaqueText;
   int  xOffset;
   bool writingText;

   float foreground[4], background[4], bitmapMult[4];
};

class MeshData : struct
{
   int vertices;
   int normals;
   int texCoords;
   int texCoords2;
   int colors;
};

class IndexData : struct
{
   uint16 *indices;
   int buffer;
   int nIndices;
};

#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA)
static int primitiveTypes[RenderPrimitiveType] =
{
   GL_POINTS, GL_LINES, GL_TRIANGLES, GL_TRIANGLE_STRIP, GL_TRIANGLE_FAN, GL_QUADS, GL_QUAD_STRIP, GL_LINE_STRIP
};
#endif

int current;
void *previous;

void CocoaGlAssert()
{
    GLenum error = glGetError();

    if(error) {
        printf("**** glGetError():%i ****\n", error);
        exit(1);
    }
}

class CocoaOpenGLDisplayDriver : DisplayDriver
{
   class_property(name) = "CocoaOpenGL";

   bool LockSystem(DisplaySystem displaySystem)
   {
      printf("CocoaOpenGLDisplayDriver:LockSystem STUB! %s:%i\n", __FILE__, __LINE__);
      return true;
   }

   void UnlockSystem(DisplaySystem displaySystem)
   {
      printf("CocoaOpenGLDisplayDriver:UnlockSystem STUB! %s:%i\n", __FILE__, __LINE__);
   }

   bool Lock(Display display)
   {
      printf("CocoaOpenGLDisplayDriver:Lock %s:%i\n", __FILE__, __LINE__);
      return CocoaLock(display.window);
   }

   void Unlock(Display display)
   {
      printf("CocoaOpenGLDisplayDriver:Unlock %s:%i\n", __FILE__, __LINE__);
      CocoaUnlock(display.window);
   }

   void DestroyDisplay(Display display)
   {
      printf("CocoaOpenGLDisplayDriver:DestroyDisplay STUB! %s:%i\n", __FILE__, __LINE__);
   }

   bool CreateDisplaySystem(DisplaySystem displaySystem)
   {
      bool result = true;

      SystemData system = SystemData { };
      displaySystem.driverData = system;

      printf("CocoaOpenGLDisplayDriver:CreateDisplaySystem %s:%i\n", __FILE__, __LINE__);
      return result;
   }

   void DestroyDisplaySystem(DisplaySystem displaySystem)
   {
      printf("CocoaOpenGLDisplayDriver:DestroyDisplaySystem STUB! %s:%i\n", __FILE__, __LINE__);
   }

   bool CreateDisplay(Display display)
   {
      bool result = true;

      DisplayData displayData = display.driverData;
      SystemData systemData = display.displaySystem.driverData;

      displayData = display.driverData = DisplayData { };

      CocoaOpenGLMakeCurrentContext(display.window);

      CocoaGlAssert();
      glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
      CocoaGlAssert();
      glEnable(GL_BLEND);
      CocoaGlAssert();

      glMatrixMode(GL_MODELVIEW);
      CocoaGlAssert();
      glScalef(1.0f, 1.0f, -1.0f);
      CocoaGlAssert();
      glMatrixMode(GL_PROJECTION);
      CocoaGlAssert();
      glShadeModel(GL_FLAT);
      CocoaGlAssert();

      glLightModeli(GL_LIGHT_MODEL_COLOR_CONTROL, GL_SEPARATE_SPECULAR_COLOR);
      CocoaGlAssert();
      glFogi(GL_FOG_MODE, GL_EXP);
      CocoaGlAssert();
      glFogf(GL_FOG_DENSITY, 0);
      CocoaGlAssert();
      glEnable(GL_NORMALIZE);
      CocoaGlAssert();
      glDepthFunc(GL_LESS);
      CocoaGlAssert();
      glClearDepth(1.0);
      CocoaGlAssert();
      glDisable(GL_MULTISAMPLE_ARB);
      CocoaGlAssert();

#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA)
      display.ambient = Color { 50,50,50 };
#endif

      printf("CocoaOpenGLDisplayDriver:CreateDisplay %p %s:%i\n", display.window, __FILE__, __LINE__);
      return result;
   }

   bool DisplaySize(Display display, int width, int height)
   {
      bool result = true;

      DisplayData displayData = display.driverData;
      SystemData systemData = display.displaySystem.driverData;

      printf("CocoaOpenGLDisplayDriver:DisplaySize(%i,%i) %s:%i\n", width, height, __FILE__, __LINE__);

      CocoaOpenGLMakeCurrentContext(display.window);

      glViewport(0,0,width,height);
      CocoaGlAssert();
      glLoadIdentity();
      CocoaGlAssert();
      glOrtho(0,width,height,0,0.0,1.0);
      CocoaGlAssert();
      display.width = width;
      display.height = height;

      if(!displayData.flippingBuffer || displayData.flipBufW < width || displayData.flipBufH < height)
      {
         displayData.flipBufW = width;
         displayData.flipBufH = height;
         displayData.flippingBuffer = renew displayData.flippingBuffer ColorAlpha [width * height];
      }
      if(displayData.flippingBuffer)
         result = true;

      return result;
   }

   void DisplayPosition(Display display, int x, int y)
   {
      DisplayData displayData = display.driverData;

      printf("CocoaOpenGLDisplayDriver:DisplayPosition(%i,%i) %s:%i\n", x, y, __FILE__, __LINE__);

      displayData.x = x;
      displayData.y = y;
      printf("glGetError():%i\n", glGetError());
   }

   void SetPalette(Display display, ColorAlpha * palette, bool colorMatch)
   {
      printf("CocoaOpenGLDisplayDriver:SetPalette STUB! %s:%i\n", __FILE__, __LINE__);
   }

   void RestorePalette(Display display)
   {
      printf("CocoaOpenGLDisplayDriver:RestorePalette STUB! %s:%i\n", __FILE__, __LINE__);
   }

   void StartUpdate(Display display)
   {
      printf("CocoaOpenGLDisplayDriver:StartUpdate STUB! %s:%i\n", __FILE__, __LINE__);
   }

   void EndUpdate(Display display)
   {
      printf("CocoaOpenGLDisplayDriver:EndUpdate STUB! %s:%i\n", __FILE__, __LINE__);
   }

   void Scroll(Display display, Box scroll, int x, int y, Extent dirty)
   {
      printf("CocoaOpenGLDisplayDriver:Scroll STUB! %s:%i\n", __FILE__, __LINE__);
   }

   void Update(Display display, Box updateBox)
   {
      //CocoaOpenGLUpdate(display.window);
      printf("CocoaOpenGLDisplayDriver:Update %s:%i\n", __FILE__, __LINE__);
   }

   void FreeBitmap(DisplaySystem displaySystem, Bitmap bitmap)
   {
      glDeleteTextures(1, (int *)&bitmap.driverData);
      bitmap.driverData = 0;

      bitmap.driver = class(LFBDisplayDriver);

      printf("CocoaOpenGLDisplayDriver:FreeBitmap %s:%i\n", __FILE__, __LINE__);
   }

   bool AllocateBitmap(DisplaySystem displaySystem, Bitmap bitmap, int width, int height, int stride, PixelFormat format, bool allocatePalette)
   {
      bool result = false;
      Bitmap mipMap { };
      int glBitmap = -1;

      uint w = pow2i(Min(width, 1024)), h = pow2i(Min(height, 1024));

      printf("CocoaOpenGLDisplayDriver:AllocateBitmap %s:%i\n", __FILE__, __LINE__);

      CocoaGlAssert();
      glGenTextures(1, &glBitmap);
      CocoaGlAssert();
      glBindTexture(GL_TEXTURE_2D, glBitmap);

      CocoaGlAssert();
      glPixelStorei(GL_UNPACK_ALIGNMENT, 1);

      CocoaGlAssert();
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
      CocoaGlAssert();
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

      CocoaGlAssert();
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
      CocoaGlAssert();
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

      CocoaGlAssert();
      glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);

      mipMap.Allocate(null, w, h, w, pixelFormatRGBA, false);

      CocoaGlAssert();
      glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, mipMap.picture);
      delete mipMap;

      bitmap.driverData = (void *)glBitmap;
      bitmap.driver = displaySystem.driver;
      bitmap.width = w;
      bitmap.height = h;

      result = true;

      return result;
   }

   bool MakeDDBitmap(DisplaySystem displaySystem, Bitmap bitmap, bool mipMaps)
   {
      bool result = false;
      SystemData systemData = displaySystem.driverData;

      // Pre process the bitmap... First make it 32 bit
      if(bitmap.Convert(null, pixelFormat888, null))
      {
         int c, level;
         uint w = pow2i(Min(bitmap.width, 1024)), h = pow2i(Min(bitmap.height, 1024));
         int glBitmap = -1;

         // Switch ARGB to RGBA
         //if(bitmap.format != pixelFormatRGBA)
         {
            for(c=0; c<bitmap.size; c++)
            {
               // TODO:
               ColorAlpha color = ((ColorAlpha *)bitmap.picture)[c];
               ((ColorRGBA *)bitmap.picture)[c] = ColorRGBA { color.color.r, color.color.g, color.color.b, color.a };
            }
         }
         bitmap.pixelFormat = pixelFormat888;

      CocoaGlAssert();
         glGenTextures(1, &glBitmap);
      CocoaGlAssert();
         if(glBitmap == -1)
         {
            int error = glGetError();
            return false;
            //Print("");
         }

      CocoaGlAssert();
         glBindTexture(GL_TEXTURE_2D, glBitmap);
      CocoaGlAssert();
         glPixelStorei( GL_UNPACK_ALIGNMENT, 1 );
      CocoaGlAssert();

         glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
      CocoaGlAssert();
         glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, mipMaps ? GL_LINEAR_MIPMAP_LINEAR : GL_LINEAR);
      CocoaGlAssert();

         glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
      CocoaGlAssert();
         glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
      CocoaGlAssert();

         glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
      CocoaGlAssert();

         result = true;

         for(level = 0; result && (w > 1 || h > 1); level++, w >>= 1, h >>= 1)
         {
            Bitmap mipMap;
            if(bitmap.width != w || bitmap.height != h)
            {
               mipMap = Bitmap { };
               if(mipMap.Allocate(null, w, h, w, bitmap.pixelFormat, false))
               {
                  Surface mipSurface = mipMap.GetSurface(0,0,null);
                  mipSurface.Filter(bitmap, 0,0,0,0, w, h, bitmap.width, bitmap.height);
                  delete mipSurface;
               }
               else
               {
                  result = false;
                  delete mipMap;
               }
            }
            else
               mipMap = bitmap;

            if(result)
            {
               int error;
               glTexImage2D(GL_TEXTURE_2D, level, GL_RGBA8, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, mipMap.picture);
      CocoaGlAssert();
               if((error = glGetError()))
               {
                  result = false;
               }
            }
            if(mipMap != bitmap)
               delete mipMap;
            if(!mipMaps) break;
         }

         if(!bitmap.keepData)
            bitmap.driver.FreeBitmap(bitmap.displaySystem, bitmap);
         bitmap.driverData = (void *)glBitmap;
         bitmap.driver = displaySystem.driver;

         if(!result)
            FreeBitmap(displaySystem, bitmap);
         else if(systemData.loadingFont)
         {
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
      CocoaGlAssert();
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
      CocoaGlAssert();
            systemData.loadingFont = false;
         }
      }

      printf("CocoaOpenGLDisplayDriver:MakeDDBitmap %i %s:%i\n", result, __FILE__, __LINE__);
      return result;
   }

   void ReleaseSurface(Display display, Surface surface)
   {
      printf("CocoaOpenGLDisplayDriver:ReleaseSurface %s:%i\n", __FILE__, __LINE__);

      glDisable(GL_SCISSOR_TEST);
      CocoaGlAssert();
      delete surface.driverData;
      surface.driverData = null;
   }

   bool GetBitmapSurface(DisplaySystem displaySystem, Surface surface, Bitmap bitmap, int x, int y, Box clip)
   {
      printf("CocoaOpenGLDisplayDriver:GetBitmapSurface STUB! %s:%i\n", __FILE__, __LINE__);
      return false;
   }

   bool GetSurface(Display display, Surface surface, int x,int y, Box clip)
   {
      bool result = true;

      SurfaceData surfaceData = SurfaceData { };
      surface.driverData = surfaceData;

      printf("CocoaOpenGLDisplayDriver:GetSurface %p %s:%i\n", surfaceData, __FILE__, __LINE__);

      if(surfaceData)
      {
      CocoaGlAssert();
            glViewport(0,0,display.width,display.height);
      CocoaGlAssert();
            glLoadIdentity();
      CocoaGlAssert();
            printf("display:%i, %i\n", display.width, display.height);
            glOrtho(0, display.width, display.height, 0, 0.0f, 1.0f);
      CocoaGlAssert();

         surface.offset.x = x;
         surface.offset.y = y;
         surface.unclippedBox = surface.box = clip;
         surfaceData.bitmapMult[0] = 1;
         surfaceData.bitmapMult[1] = 1;
         surfaceData.bitmapMult[2] = 1;
         surfaceData.bitmapMult[3] = 1;

         glEnable(GL_SCISSOR_TEST);
      CocoaGlAssert();
         glScissor(
            x+clip.left,
            (display.height) -(y+clip.bottom)-1,
            clip.right-clip.left+1,
            clip.bottom-clip.top+1);
      CocoaGlAssert();
         result = true;
      }

      return result;
   }

   void Clip(Display display, Surface surface, Box clip)
   {
      Box box;

      printf("CocoaOpenGLDisplayDriver:Clip STUB! %s:%i\n", __FILE__, __LINE__);

      if(clip != null)
      {
         box = clip;
         box.Clip(surface.unclippedBox);
         surface.box = box;
      }
      else
      {
         box = surface.box = surface.unclippedBox;
      }

      box.left += surface.offset.x;
      box.top  += surface.offset.y;
      box.right+= surface.offset.x;
      box.bottom += surface.offset.y;

      glScissor(
         box.left,display.height - box.bottom - 1,
         box.right-box.left+1, box.bottom-box.top+1);
   }

   bool GrabScreen(Display display, Bitmap bitmap, int x, int y, unsigned int w, unsigned int h)
   {
      bool result = false;
      printf("CocoaOpenGLDisplayDriver:GrabScreen STUB! %s:%i\n", __FILE__, __LINE__);
      return result;
   }

   void SetForeground(Display display, Surface surface, ColorAlpha color)
   {
      SurfaceData surfaceData = surface.driverData;

      printf("CocoaOpenGLDisplayDriver:SetForeground(%i,%i,%i,%i) %s:%i\n", color.color.r, color.color.g, color.color.b, color.a, __FILE__, __LINE__);

      surfaceData.foreground[0] = color.color.r/255.0f;
      surfaceData.foreground[1] = color.color.g/255.0f;
      surfaceData.foreground[2] = color.color.b/255.0f;
      surfaceData.foreground[3] = color.a/255.0f;
   }

   void SetBackground(Display display, Surface surface, ColorAlpha color)
   {
      SurfaceData surfaceData = surface.driverData;

      printf("CocoaOpenGLDisplayDriver:SetBackground(%i,%i,%i,%i) %s:%i\n", color.color.r, color.color.g, color.color.b, color.a, __FILE__, __LINE__);

      surfaceData.background[0] = color.color.r/255.0f;
      surfaceData.background[1] = color.color.g/255.0f;
      surfaceData.background[2] = color.color.b/255.0f;
      surfaceData.background[3] = color.a/255.0f;
   }

   void SetBlitTint(Display display, Surface surface, ColorAlpha color)
   {
      SurfaceData surfaceData = surface.driverData;

      printf("CocoaOpenGLDisplayDriver:SetBlitTint(%i,%i,%i,%i) %s:%i\n", color.color.r, color.color.g, color.color.b, color.a, __FILE__, __LINE__);

      surfaceData.bitmapMult[0] = color.color.r/255.0f;
      surfaceData.bitmapMult[1] = color.color.g/255.0f;
      surfaceData.bitmapMult[2] = color.color.b/255.0f;
      surfaceData.bitmapMult[3] = color.a/255.0f;
   }


   ColorAlpha GetPixel(Display display, Surface surface,int x,int y)
   {
      printf("CocoaOpenGLDisplayDriver:GetPixel STUB! %s:%i\n", __FILE__, __LINE__);
      return 0;
   }

   void PutPixel(Display display, Surface surface,int x,int y)
   {
      printf("CocoaOpenGLDisplayDriver:PutPixel %s:%i\n", __FILE__, __LINE__);

      glBegin(GL_POINTS);
      CocoaGlAssert();
      glVertex2f(x+surface.offset.x + 0.5f, y+surface.offset.y + 0.5f);
      glEnd();
      CocoaGlAssert();
   }

   void DrawLine(Display display, Surface surface, int x1, int y1, int x2, int y2)
   {
      SurfaceData surfaceData = surface.driverData;

      printf("CocoaOpenGLDisplayDriver:DrawLine %s:%i\n", __FILE__, __LINE__);
      printf("--DrawLine(x1:%i, y1:%i, x2:%i, y2:%i)\n", x1, y1, x2, y2);

      glColor4fv(surfaceData.foreground);
      glBegin(GL_LINES);

      glVertex2f(x1+surface.offset.x + 0.5f, y1+surface.offset.y + 0.5f);
      glVertex2f(x2+surface.offset.x + 0.5f, y2+surface.offset.y + 0.5f);

      glEnd();
      CocoaGlAssert();
   }

   void Rectangle(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      printf("CocoaOpenGLDisplayDriver:Rectangle %s:%i\n", __FILE__, __LINE__);
      printf("--Rectangle(x1:%i, y1:%i, x2:%i, y2:%i)\n", x1, y1, x2, y2);
      glBegin(GL_LINE_LOOP);

      glVertex2f(x1+surface.offset.x + 0.5f, y1+surface.offset.y + 0.5f);
      glVertex2f(x1+surface.offset.x + 0.5f, y2+surface.offset.y + 0.5f);
      glVertex2f(x2+surface.offset.x + 0.5f, y2+surface.offset.y + 0.5f);
      glVertex2f(x2+surface.offset.x + 0.5f, y1+surface.offset.y + 0.5f);

      glEnd();
      CocoaGlAssert();
   }

   void Area(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      SurfaceData surfaceData = surface.driverData;

      printf("CocoaOpenGLDisplayDriver:Area %s:%i\n", __FILE__, __LINE__);

      CocoaGlAssert();
      glColor4fv(surfaceData.background);

      glRecti(x1+surface.offset.x, y1+surface.offset.y,
              x2+surface.offset.x + 1, y2+surface.offset.y + 1);
      CocoaGlAssert();
   }

   void Clear(Display display, Surface surface, ClearType type)
   {
      DisplayData displayData = display.driverData;
      SurfaceData surfaceData = surface.driverData;

      if(type != depthBuffer)
      {
         glClearColor(surfaceData.background[0], surfaceData.background[1], surfaceData.background[2], surfaceData.background[3]);
      CocoaGlAssert();
      }
      if(type != colorBuffer && !displayData.depthWrite)
      {
         glDepthMask((byte)bool::true);
      CocoaGlAssert();
      }
      glClear(((type != depthBuffer) ? GL_COLOR_BUFFER_BIT : 0) |
              ((type != colorBuffer) ? GL_DEPTH_BUFFER_BIT : 0));
      CocoaGlAssert();

      if(type != colorBuffer && !displayData.depthWrite)
      {
         glDepthMask((byte)bool::false);
      CocoaGlAssert();
      }
      if(type != depthBuffer)
      {
         glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
      CocoaGlAssert();
      }
      if(type != colorBuffer)
      {
         glDepthMask((byte)bool::true);
      CocoaGlAssert();
      }

      glClear(((type != depthBuffer) ? GL_COLOR_BUFFER_BIT : 0) |
              ((type != colorBuffer) ? GL_DEPTH_BUFFER_BIT : 0));
      CocoaGlAssert();

      if(type != colorBuffer)
      {
         glDepthMask((byte)bool::false);
      CocoaGlAssert();
      }
      printf("CocoaOpenGLDisplayDriver:Clear %s:%i\n", __FILE__, __LINE__);
   }

   bool ConvertBitmap(DisplaySystem displaySystem, Bitmap bitmap, PixelFormat format, ColorAlpha * palette)
   {
      bool result = false;

      printf("CocoaOpenGLDisplayDriver:ConvertBitmap %s:%i\n", __FILE__, __LINE__);

      return result;
   }

   void Blit(Display display, Surface surface, Bitmap bitmap, int dx, int dy, int sx, int sy, int w, int h)
   {
      printf("CocoaOpenGLDisplayDriver:Blit %s:%i\n", __FILE__, __LINE__);
      printf("--BLIT(dx:%i, dy:%i, sx:%i, sy:%i, w:%i, h:%i)\n", dx, dy, sx, sy, w, h);

      glEnable(GL_TEXTURE_2D);
      glBindTexture(GL_TEXTURE_2D, (uint)bitmap.driverData);
      glBegin(GL_QUADS);

      if(h < 0)
      {
         glTexCoord2f((float)sx/ bitmap.width, (float)(sy-h)/ bitmap.height);
         glVertex2i(dx+surface.offset.x, dy+surface.offset.y);
         glTexCoord2f((float)(sx+w) / bitmap.width, (float)(sy-h)/ bitmap.height);
         glVertex2i(dx+w+surface.offset.x, dy+surface.offset.y);
         glTexCoord2f((float)(sx+w)/ bitmap.width, (float)sy/ bitmap.height);
         glVertex2i(dx+w+surface.offset.x, dy-h+surface.offset.y);
         glTexCoord2f((float)sx / bitmap.width, (float)sy/ bitmap.height);
         glVertex2i(dx+surface.offset.x, dy-h+surface.offset.y);
      }
      else
      {
         glTexCoord2f((float)sx / bitmap.width, (float)sy/ bitmap.height);
         glVertex2f((float)dx+surface.offset.x, (float)dy+surface.offset.y);
         glTexCoord2f((float)(sx+w)/ bitmap.width, (float)sy/ bitmap.height);
         glVertex2f((float)dx+w+surface.offset.x, (float)dy+surface.offset.y);
         glTexCoord2f((float)(sx+w) / bitmap.width, (float)(sy+h)/ bitmap.height);
         glVertex2f((float)dx+w+surface.offset.x, (float)dy+h+surface.offset.y);
         glTexCoord2f((float)sx/ bitmap.width, (float)(sy+h)/ bitmap.height);
         glVertex2f((float)dx+surface.offset.x, (float)dy+h+surface.offset.y);
      }
      glEnd();
      CocoaGlAssert();
   }

   void Stretch(Display display, Surface surface, Bitmap bitmap, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);
      glEnable(GL_TEXTURE_2D);
      CocoaGlAssert();
      glBindTexture(GL_TEXTURE_2D, (uint)bitmap.driverData);
      CocoaGlAssert();

      glBegin(GL_QUADS);
      CocoaGlAssert();

      if(h < 0)
      {
         glTexCoord2f((float)(sx)/ bitmap.width, (float)(sy+sh)/ bitmap.height);
      CocoaGlAssert();
         glVertex2i(dx+surface.offset.x, dy+surface.offset.y);
      CocoaGlAssert();

         glTexCoord2f((float)(sx+sw) / bitmap.width, (float)(sy+sh)/ bitmap.height);
      CocoaGlAssert();
         glVertex2i(dx+w+surface.offset.x, dy+surface.offset.y);
      CocoaGlAssert();

         glTexCoord2f((float)(sx+sw)/ bitmap.width, (float)(sy)/ bitmap.height);
      CocoaGlAssert();
         glVertex2i(dx+w+surface.offset.x, dy-h+surface.offset.y);
      CocoaGlAssert();

         glTexCoord2f((float)(sx) / bitmap.width, (float)(sy)/ bitmap.height);
      CocoaGlAssert();
         glVertex2i(dx+surface.offset.x, dy-h+surface.offset.y);
      CocoaGlAssert();
      }
      else
      {
         glTexCoord2f((float)(sx) / bitmap.width, (float)(sy)/ bitmap.height);
      CocoaGlAssert();
         glVertex2i(dx+surface.offset.x, dy+surface.offset.y);
      CocoaGlAssert();

         glTexCoord2f((float)(sx+sw)/ bitmap.width, (float)(sy)/ bitmap.height);
      CocoaGlAssert();
         glVertex2i(dx+w+surface.offset.x, dy+surface.offset.y);
      CocoaGlAssert();

         glTexCoord2f((float)(sx+sw) / bitmap.width, (float)(sy+sh)/ bitmap.height);
      CocoaGlAssert();
         glVertex2i(dx+w+surface.offset.x, dy+h+surface.offset.y);
      CocoaGlAssert();

         glTexCoord2f((float)(sx)/ bitmap.width, (float)(sy+sh)/ bitmap.height);
      CocoaGlAssert();
         glVertex2i(dx+surface.offset.x, dy+h+surface.offset.y);
      CocoaGlAssert();
      }

      glEnd();
      CocoaGlAssert();

      glDisable(GL_TEXTURE_2D);
      CocoaGlAssert();
   }

   void Filter(Display display, Surface surface, Bitmap bitmap, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);
      Stretch(display, surface, bitmap, dx, dy, sx, sy, w, h, sw, sh);
   }

   void StretchDI(Display display, Surface surface, Bitmap bitmap, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      float s2dw,s2dh,d2sw,d2sh;
      bool flipX = false, flipY = false;

      printf("CocoaOpenGLDisplayDriver: %s:%i\n", __FILE__, __LINE__);
      if(Sgn(w) != Sgn(sw))
      {
         w = Abs(w);
         sw = Abs(sw);
         flipX = true;
      }
      if(Sgn(h) != Sgn(sh))
      {
         h = Abs(h);
         sh = Abs(sh);
         flipY = true;
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
      if(sx+sw>bitmap.width-1)
      {
         w-=(int)((sx+sw-(bitmap.width-1)-1)*s2dw);
         sw-=sx+sw-(bitmap.width-1)-1;
      }
      if(sy+sh>(bitmap.height-1))
      {
         h-=(int)((sy+sh-(bitmap.height-1)-1)*s2dh);
         sh-=sy+sh-(bitmap.height-1)-1;
      }
      //Clip against the edges of the surfaceination
      if(dx<surface.box.left)
      {
         //if(!flip)
         sx+=(int)((surface.box.left-dx)*d2sw);
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
      if(dx+w>surface.box.right)
      {
         //if(flip) sx+=(int)((dx+w-surface.box.right-1)*d2sw);
         sw-=(int)((dx+w-surface.box.right-1)*d2sw);
         w-=dx+w-surface.box.right-1;
      }
      if(dy+h>surface.box.bottom)
      {
         sh-=(int)((dy+h-surface.box.bottom-1)*d2sh);
         h-=dy+h-surface.box.bottom-1;
      }
      if((w<=0)||(h<=0)||(sw<=0)||(sh<=0)) return;

      dx += surface.offset.x;
      dy += surface.offset.y;

      if(bitmap.pixelFormat == pixelFormat888 && !bitmap.paletteShades)
      {
         glPixelStorei(GL_UNPACK_ALIGNMENT, 4);
      CocoaGlAssert();
         glPixelStorei(GL_UNPACK_ROW_LENGTH, bitmap.stride);
      CocoaGlAssert();
         glPixelStorei(GL_UNPACK_SKIP_PIXELS, sx);
      CocoaGlAssert();
         glPixelStorei(GL_UNPACK_SKIP_ROWS, sy);
      CocoaGlAssert();
         glRasterPos2d(dx,dy);
      CocoaGlAssert();
         //glPixelZoom(flipX ? -s2dw : s2dw, flipY ? s2dh : -s2dh);
      CocoaGlAssert();
         glPixelZoom(s2dw, -s2dh);
      CocoaGlAssert();
         glDrawPixels(sw,sh,GL_BGRA_EXT,GL_UNSIGNED_BYTE, bitmap.picture);
      CocoaGlAssert();
         glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
      CocoaGlAssert();
         glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
      CocoaGlAssert();
      }
   }

   void BlitDI(Display display, Surface surface, Bitmap bitmap, int dx, int dy, int sx, int sy, int w, int h)
   {
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);
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
      if(sx+w>bitmap.width-1)
         w-=sx+w-(bitmap.width-1)-1;
      if(sy+h>bitmap.height-1)
         h-=sy+h-(bitmap.height-1)-1;
      //Clip against the edges of the surfaceination
      if(dx<surface.box.left)
      {
         //if(!flip)
         sx+=surface.box.left-dx;
         w-=surface.box.left-dx;
         dx=surface.box.left;
      }
      if(dy<surface.box.top)
      {
         sy+=surface.box.top-dy;
         h-=surface.box.top-dy;
         dy=surface.box.top;
      }
      if(dx+w>surface.box.right)
      {
         //if(flip) sx+=dx+w-surface.box.right-1;
         w-=dx+w-surface.box.right-1;
      }
      if(dy+h>surface.box.bottom)
         h-=dy+h-surface.box.bottom-1;
      if((w<=0)||(h<=0))
         return;

      dx += surface.offset.x;
      dy += surface.offset.y;

      if(bitmap.pixelFormat == pixelFormat888 && !bitmap.paletteShades)
      {
         glPixelStorei(GL_UNPACK_ALIGNMENT, 4);
      CocoaGlAssert();
         glPixelStorei(GL_UNPACK_ROW_LENGTH, bitmap.stride);
      CocoaGlAssert();
         glPixelStorei(GL_UNPACK_SKIP_PIXELS, sx);
      CocoaGlAssert();
         glPixelStorei(GL_UNPACK_SKIP_ROWS, sy);
      CocoaGlAssert();
         glRasterPos2d(dx,dy);
      CocoaGlAssert();
         glPixelZoom(1,-1);
      CocoaGlAssert();
         glDrawPixels(w,h,GL_BGRA_EXT,GL_UNSIGNED_BYTE, bitmap.picture);
      CocoaGlAssert();
         glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
      CocoaGlAssert();
         glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
      CocoaGlAssert();
      }
   }

   void FilterDI(Display display, Surface surface, Bitmap bitmap, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);
      StretchDI(display, surface, bitmap, dx, dy, sx, sy, w, h, sw, sh);
   }

   void UnloadFont(DisplaySystem displaySystem, Font font)
   {
      printf("CocoaOpenGLDisplayDriver:UnloadFont %s:%i\n", __FILE__, __LINE__);
      LFBDisplayDriver::UnloadFont(displaySystem, font);
   }

   Font LoadFont(DisplaySystem displaySystem, char * faceName, float size, FontFlags flags)
   {
      Font font = LFBDisplayDriver::LoadFont(displaySystem, faceName, size, flags);

      printf("CocoaOpenGLDisplayDriver:LoadFont(%s):%p %s:%i\n", faceName, font, __FILE__, __LINE__);

      return font;
   }

   void FontExtent(DisplaySystem displaySystem, Font font, char * text, int len, int * width, int * height)
   {
      printf("CocoaOpenGLDisplayDriver:FontExtent() %s:%i\n", __FILE__, __LINE__);
      LFBDisplayDriver::FontExtent(displaySystem, font, text, len, width, height);
   }

   void WriteText(Display display, Surface surface, int x, int y, char * text, int len)
   {
      SurfaceData surfaceData = surface.driverData;
      SystemData systemData = display.displaySystem.driverData;

      printf("CocoaOpenGLDisplayDriver:WriteText %s:%i\n", __FILE__, __LINE__);

      systemData.loadingFont = true;

      if(surface.textOpacity)
      {
         int w, h;
         FontExtent(display.displaySystem, surface.font, text, len, &w, &h);
         Area(display, surface,x,y,x+w-1,y+h-1);
      }

      surfaceData.writingText = true;

      glEnable(GL_TEXTURE_2D);
      CocoaGlAssert();
      glColor4fv(surfaceData.foreground);
      CocoaGlAssert();

      LFBDisplayDriver::WriteText(display, surface, x, y, text, len);
      surfaceData.writingText = false;
      systemData.loadingFont = false;

      glDisable(GL_TEXTURE_2D);
      CocoaGlAssert();
   }

   void TextFont(Display display, Surface surface, Font font)
   {
      LFBDisplayDriver::TextFont(display, surface, font);
      printf("CocoaOpenGLDisplayDriver:TextFont %s:%i\n", __FILE__, __LINE__);
   }

   void TextOpacity(Display display, Surface surface, bool opaque)
   {
      SurfaceData surfaceData = surface.driverData;
      surfaceData.opaqueText = opaque;
      printf("CocoaOpenGLDisplayDriver:TextOpacity(%i) %s:%i\n", opaque, __FILE__, __LINE__);
   }

   void TextExtent(Display display, Surface surface, char * text, int len, int * width, int * height)
   {
      SurfaceData surfaceData = surface.driverData;
      SystemData systemData = display.displaySystem.driverData;
      systemData.loadingFont = true;
      FontExtent(display.displaySystem, surfaceData.font, text, len, width, height);
      systemData.loadingFont = false;

      printf("CocoaOpenGLDisplayDriver:TextExtent STUB! %s:%i\n", __FILE__, __LINE__);
   }

   void DrawingChar(Display display, Surface surface, char character)
   {
      printf("CocoaOpenGLDisplayDriver:DrawingChar STUB! %s:%i\n", __FILE__, __LINE__);

   }

   void LineStipple(Display display, Surface surface, uint32 stipple)
   {
      printf("CocoaOpenGLDisplayDriver:LineStipple %s:%i\n", __FILE__, __LINE__);
      if(stipple)
      {
         glLineStipple(1, (uint16)stipple);
      CocoaGlAssert();
         glEnable(GL_LINE_STIPPLE);
      CocoaGlAssert();
      }
      else
      {
         glDisable(GL_LINE_STIPPLE);
      CocoaGlAssert();
      }
      printf("glGetError():%i\n", glGetError());
   }

#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA)
   void SetRenderState(Display display, RenderState state, uint value)
   {
      printf("CocoaOpenGLDisplayDriver:SetRenderState STUB! %s:%i\n", __FILE__, __LINE__);
      switch(state)
      {
         case antiAlias:
            if(value)
               glEnable(GL_MULTISAMPLE_ARB);
            else
               glDisable(GL_MULTISAMPLE_ARB);
      CocoaGlAssert();
            break;
         case fillMode:
            glPolygonMode(GL_FRONT_AND_BACK, ((FillModeValue)value == solid) ? GL_FILL : GL_LINE);
      CocoaGlAssert();
            break;
         case depthTest:
            if(value) glEnable(GL_DEPTH_TEST); else glDisable(GL_DEPTH_TEST);
      CocoaGlAssert();
            break;
         case depthWrite:
            if(value) glDepthMask((byte)bool::true); else glDepthMask((byte)bool::false);
      CocoaGlAssert();
            break;
         case fogColor:
         {
            float color[4] = { ((Color)value).r/255.0f, ((Color)value).g/255.0f, ((Color)value).b/255.0f, 1.0f };
            glFogfv(GL_FOG_COLOR, (float *)&color);
      CocoaGlAssert();
            break;
         }
         case fogDensity:
            glFogf(GL_FOG_DENSITY, *(float *)(void *)&value);
      CocoaGlAssert();
            break;
         case blend:
            if(value) glEnable(GL_BLEND); else glDisable(GL_BLEND);
      CocoaGlAssert();
            break;
         case ambient:
         {
            float ambient[4] = { ((Color)value).r/255.0f, ((Color)value).g/255.0f, ((Color)value).b/255.0f, 1.0f };
            glLightModelfv(GL_LIGHT_MODEL_AMBIENT, ambient);
      CocoaGlAssert();
            break;
         }
         case alphaWrite:
         {
            if(value) glColorMask(1,1,1,1); else glColorMask(1,1,1,0);
      CocoaGlAssert();
            break;
         }
         case vSync:
         {
            break;
         }
      }
   }

   void SetLight(Display display, int id, Light light)
   {
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);
      if(light != null)
      {
         Object lightObject = light.lightObject;
         float position[4] = { 0, 0, 0, 0 };
         float color[4] = { 0, 0, 0, 1 };

         glEnable(GL_LIGHT0 + id);
      CocoaGlAssert();

         if(!light.multiplier) light.multiplier = 1.0f;

         color[0] = light.diffuse.r * light.multiplier;
         color[1] = light.diffuse.g * light.multiplier;
         color[2] = light.diffuse.b * light.multiplier;
         glLightfv(GL_LIGHT0 + id, GL_DIFFUSE, color);

         color[0] = light.ambient.r * light.multiplier;
         color[1] = light.ambient.g * light.multiplier;
         color[2] = light.ambient.b * light.multiplier;
         glLightfv(GL_LIGHT0 + id, GL_AMBIENT, color);
         color[0] = light.specular.r * light.multiplier;
         color[1] = light.specular.g * light.multiplier;
         color[2] = light.specular.b * light.multiplier;
         glLightfv(GL_LIGHT0 + id, GL_SPECULAR,color);

         if(lightObject)
         {
            Vector3D positionVector;
            if(light.flags.spot)
            {
               if(lightObject.flags.root || !lightObject.parent)
               {
                  positionVector = lightObject.transform.position;
                  positionVector.Subtract(positionVector, display.display3D.camera.cPosition);
               }
               else
               {
                  positionVector.MultMatrix(lightObject.transform.position, lightObject.parent.matrix);
                  if(display.display3D.camera)
                     positionVector.Subtract(positionVector, display.display3D.camera.cPosition);
               }
               position[3] = 1;
            }
            else
            {
               if(!light.direction.x && !light.direction.y && !light.direction.z)
               {
                  Vector3Df vector { 0,0,-1 };
                  Matrix mat;
                  mat.RotationQuaternion(light.orientation);
                  positionVector.MultMatrixf(vector, mat);
               }
               else
               {
                  positionVector = light.direction;
                  position[3] = 1;
               }
            }

            position[0] = (float)positionVector.x;
            position[1] = (float)positionVector.y;
            position[2] = (float)positionVector.z;

            glLightfv(GL_LIGHT0 + id, GL_POSITION, position);
      CocoaGlAssert();

            if(light.flags.attenuation)
            {
               glLightf(GL_LIGHT0 + id, GL_CONSTANT_ATTENUATION, light.Kc);
      CocoaGlAssert();
               glLightf(GL_LIGHT0 + id, GL_LINEAR_ATTENUATION, light.Kl);
      CocoaGlAssert();
               glLightf(GL_LIGHT0 + id, GL_QUADRATIC_ATTENUATION, light.Kq);
      CocoaGlAssert();
            }

            if(light.flags.spot)
            {
               float exponent = 0;
               #define MAXLIGHT  0.9
               float direction[4] = { (float)light.direction.x, (float)light.direction.y, (float)light.direction.z, 1 };
               // Figure out exponent out of the hot spot
               exponent = (float)(log(MAXLIGHT) / log(cos((light.hotSpot / 2))));

               glLightfv(GL_LIGHT0 + id, GL_SPOT_DIRECTION, direction);
      CocoaGlAssert();
               glLightf(GL_LIGHT0 + id, GL_SPOT_CUTOFF, (float)(light.fallOff / 2));
      CocoaGlAssert();
               glLightf(GL_LIGHT0 + id, GL_SPOT_EXPONENT, exponent);
      CocoaGlAssert();
            }
         }
         else
         {
            Vector3Df vector { 0,0,-1 };
            Vector3Df direction;
            Matrix mat;

            mat.RotationQuaternion(light.orientation);
            direction.MultMatrix(vector, mat);

            position[0] = direction.x;
            position[1] = direction.y;
            position[2] = direction.z;

            glLightfv(GL_LIGHT0 + id, GL_POSITION, position);
      CocoaGlAssert();
         }
      }
      else
         glDisable(GL_LIGHT0 + id);
      CocoaGlAssert();
   }

   void SetCamera(Display display, Surface surface, Camera camera)
   {
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);
      if(camera)
      {
         int left = surface.box.left + surface.offset.x;
         int top = surface.box.top  + surface.offset.y;
         int right = surface.box.right + surface.offset.x;
         int bottom = surface.box.bottom + surface.offset.y;
         float origX = surface.offset.x + camera.origin.x;
         float origY = surface.offset.y + camera.origin.y;
         int x = left;
         int y = display.height - bottom - 1;
         int w = right - left + 1;
         int h = bottom - top + 1;

         // *** ViewPort ***
         glViewport(x, y, w, h);

         // *** Projection Matrix ***
         if(!display.display3D.camera)
            glPushMatrix();
         else
            glMatrixMode(GL_PROJECTION);
         if(display.display3D.collectingHits)
         {
            float pickX = display.display3D.pickX + surface.offset.x;
            float pickY = display.height - (display.display3D.pickY + surface.offset.y) - 1;
            Matrix pickMatrix =
            {
               {
                  w / display.display3D.pickWidth, 0, 0, 0,
                  0, h / display.display3D.pickHeight, 0, 0,
                  0, 0, 1, 0,
                  (w + 2.0f * (x - pickX)) / display.display3D.pickWidth,
                  (h + 2.0f * (y - pickY)) / display.display3D.pickHeight, 0, 1
               }
            };
            glLoadMatrixd(pickMatrix.array);
         }
         else
            glLoadIdentity();
         glFrustum(
            (left   - origX) * camera.zMin / camera.focalX,
            (right  - origX) * camera.zMin / camera.focalX,
            (bottom - origY) * camera.zMin / camera.focalY,
            (top    - origY) * camera.zMin / camera.focalY,
            camera.zMin, camera.zMax);

         glDisable(GL_BLEND);

         // *** Z Inverted Identity Matrix ***
         glMatrixMode(GL_MODELVIEW);
         if(!display.display3D.camera)
            glPushMatrix();

         glLoadIdentity();
         glScalef(1.0f, 1.0f, -1.0f);

         // *** View Matrix ***
         glMultMatrixd(camera.viewMatrix.array);

         // *** Lights ***
         // ...

         glEnable(GL_DEPTH_TEST);
         glEnable(GL_LIGHTING);
         glShadeModel(GL_SMOOTH);
         glDepthMask((byte)bool::true);

         glEnable(GL_MULTISAMPLE_ARB);
      }
      else if(display.display3D.camera)
      {
         glViewport(0,0,display.width,display.height);

         glDisable(GL_CULL_FACE);
         glDisable(GL_DEPTH_TEST);
         glDisable(GL_LIGHTING);
         glDisable(GL_FOG);
         glDisable(GL_TEXTURE_2D);
         glShadeModel(GL_FLAT);
         glEnable(GL_BLEND);
         glDisable(GL_MULTISAMPLE_ARB);

         // *** Restore 2D MODELVIEW Matrix ***
         glPopMatrix();

         // *** Restore 2D PROJECTION Matrix ***
         glMatrixMode(GL_PROJECTION);
         glPopMatrix();
      }

      if(glBindBufferARB)
         glBindBufferARB(GL_ARRAY_BUFFER_ARB, 0);
      printf("glGetError():%i\n", glGetError());
   }

   void ApplyMaterial(Display display, Material material, Mesh mesh)
   {
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);
      // Basic Properties
      if(material.flags.doubleSided)
      {
         glLightModeli(GL_LIGHT_MODEL_TWO_SIDE, !material.flags.singleSideLight);
         glDisable(GL_CULL_FACE);
      }
      else
      {
         glLightModeli(GL_LIGHT_MODEL_TWO_SIDE, bool::false);
         glEnable(GL_CULL_FACE);
      }

      // Fog
      if(material.flags.noFog)
         glDisable(GL_FOG);
      else
         glEnable(GL_FOG);

      // Maps
      if(material.baseMap && mesh.texCoords)
      {
         Bitmap map = material.baseMap;
         glEnable(GL_TEXTURE_2D);
         glBindTexture(GL_TEXTURE_2D, (uint)map.driverData);

         if(material.flags.tile)
         {
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
         }
         else
         {
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
         }
      }
      else
         glDisable(GL_TEXTURE_2D);

      if(mesh.flags.colors)
      {
         glColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE);
         glEnable(GL_COLOR_MATERIAL);
      }
      else
      {
         glDisable(GL_COLOR_MATERIAL);
         {
            float color[4] = { material.diffuse.r, material.diffuse.g, material.diffuse.b, material.opacity };
            glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, color);
         }
         {
            float color[4] = { material.ambient.r, material.ambient.g, material.ambient.b, 0 };
            glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT, color);
         }
      }
      {
         float color[4] = { material.specular.r, material.specular.g, material.specular.b, 0 };
         glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, color);
      }
      {
         float color[4] = { material.emissive.r, material.emissive.g, material.emissive.b, 0 };
         glMaterialfv(GL_FRONT_AND_BACK, GL_EMISSION, color);
      }

      glMaterialfv(GL_FRONT_AND_BACK, GL_SHININESS, &material.power);
   }

   void FreeMesh(DisplaySystem displaySystem, Mesh mesh)
   {
      MeshData meshData = mesh.data;
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);
      if(meshData)
      {
         if(!mesh.flags.vertices)
         {
            if(meshData.vertices)
            {
               glDeleteBuffersARB(1, &meshData.vertices);
               meshData.vertices = 0;
            }
            delete mesh.vertices;
         }
         if(!mesh.flags.normals)
         {
            if(meshData.normals)
            {
               glDeleteBuffersARB(1, &meshData.normals);
               meshData.normals = 0;
            }
            delete mesh.normals;
         }
         if(!mesh.flags.texCoords1)
         {
            if(meshData.texCoords)
            {
               glDeleteBuffersARB(1, &meshData.texCoords);
               meshData.texCoords = 0;
            }
            delete mesh.texCoords;
         }
         if(!mesh.flags.texCoords2)
         {
            if(meshData.texCoords2)
            {
               glDeleteBuffersARB(1, &meshData.texCoords2);
               meshData.texCoords2 = 0;
            }
         }
         if(!mesh.flags.colors)
         {
            if(meshData.colors)
            {
               glDeleteBuffersARB(1, &meshData.colors);
               meshData.colors = 0;
            }
         }
         if(!mesh.flags)
         {
            delete meshData;
            mesh.data = null;
         }
      }
   }

   bool AllocateMesh(DisplaySystem displaySystem, Mesh mesh)
   {
      bool result = false;
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);

      if(!mesh.data)
         mesh.data = MeshData { };

      if(mesh.data)
      {
         MeshData meshData = mesh.data;

         if(mesh.flags.vertices && !meshData.vertices && !mesh.vertices)
         {
            mesh.vertices = mesh.flags.doubleVertices ? (Vector3Df *)new Vector3D[mesh.nVertices] : new Vector3Df[mesh.nVertices];
            if(glGenBuffersARB)
               glGenBuffersARB(1, &meshData.vertices);
         }
         if(mesh.flags.normals && !meshData.normals && !mesh.normals)
         {
            if(glGenBuffersARB)
               glGenBuffersARB( 1, &meshData.normals);
            mesh.normals = mesh.flags.doubleNormals ? (Vector3Df *)new Vector3D[mesh.nVertices] : new Vector3Df[mesh.nVertices];
         }
         if(mesh.flags.texCoords1 && !meshData.texCoords && !mesh.texCoords)
         {
            if(glGenBuffersARB)
               glGenBuffersARB( 1, &meshData.texCoords);
            mesh.texCoords = new Pointf[mesh.nVertices];
         }
         if(mesh.flags.colors && !meshData.colors && !mesh.colors)
         {
            if(glGenBuffersARB)
               glGenBuffersARB( 1, &meshData.colors);
            mesh.colors = new ColorRGBAf[mesh.nVertices];
         }
         result = true;
      }
      return result;
   }

   void UnlockMesh(DisplaySystem displaySystem, Mesh mesh, MeshFeatures flags)
   {
      MeshData meshData = mesh.data;
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);

      if(!flags) flags = mesh.flags;

      if(glGenBuffersARB)
      {
         if(!(flags.vertices) || meshData.vertices)
         {
            glBindBufferARB( GL_ARRAY_BUFFER_ARB, meshData.vertices);
            glBufferDataARB( GL_ARRAY_BUFFER_ARB, mesh.nVertices * (mesh.flags.doubleVertices ? sizeof(Vector3D) : sizeof(Vector3Df)), mesh.vertices, GL_STATIC_DRAW_ARB );
         }

         if(!(flags.normals) || meshData.normals)
         {
            glBindBufferARB( GL_ARRAY_BUFFER_ARB, meshData.normals);
            glBufferDataARB( GL_ARRAY_BUFFER_ARB, mesh.nVertices * (mesh.flags.doubleNormals ? sizeof(Vector3D) : sizeof(Vector3Df)), mesh.normals, GL_STATIC_DRAW_ARB );
         }

         if(!(flags.texCoords1) || meshData.texCoords)
         {
            glBindBufferARB( GL_ARRAY_BUFFER_ARB, meshData.texCoords);
            glBufferDataARB( GL_ARRAY_BUFFER_ARB, mesh.nVertices * sizeof(Pointf), mesh.texCoords, GL_STATIC_DRAW_ARB );
         }

         if(!(flags.colors) || meshData.colors)
         {
            glBindBufferARB( GL_ARRAY_BUFFER_ARB, meshData.colors);
            glBufferDataARB( GL_ARRAY_BUFFER_ARB, mesh.nVertices * sizeof(ColorRGBAf), mesh.colors, GL_STATIC_DRAW_ARB );
         }

         glBindBufferARB( GL_ARRAY_BUFFER_ARB, 0);
      }
   }

   bool LockMesh(DisplaySystem displaySystem, Mesh mesh, MeshFeatures flags)
   {
      bool result = true;
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);
      return result;
   }

   void FreeIndices(DisplaySystem displaySystem, IndexData indexData)
   {
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);

      if(indexData)
      {
         if(indexData.buffer)
            glDeleteBuffersARB(1, &indexData.buffer);
         delete indexData.indices;
         delete indexData;
      }
   }

   void * AllocateIndices(DisplaySystem displaySystem, int nIndices, bool indices32bit)
   {
      IndexData indexData = IndexData { };
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);
      if(indexData)
      {
         indexData.indices = (void *)(indices32bit ? new uint32[nIndices] : new uint16[nIndices]);
         if(glGenBuffersARB)
            glGenBuffersARB( 1, &indexData.buffer);
         indexData.nIndices = nIndices;
      }
      return indexData;
   }

   void UnlockIndices(DisplaySystem displaySystem, IndexData indexData, bool indices32bit, int nIndices)
   {
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);
      if(glGenBuffersARB)
      {
         glBindBufferARB( GL_ELEMENT_ARRAY_BUFFER_ARB, indexData.buffer);
         glBufferDataARB( GL_ELEMENT_ARRAY_BUFFER_ARB, nIndices * (indices32bit ? sizeof(uint32) : sizeof(uint16)),
            indexData.indices, GL_STATIC_DRAW_ARB);
         glBindBufferARB( GL_ELEMENT_ARRAY_BUFFER_ARB, 0);
      }
   }

   uint16 * LockIndices(DisplaySystem displaySystem, IndexData indexData)
   {
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);

      return indexData.indices;
   }

   void SelectMesh(Display display, Mesh mesh)
   {
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);

      /*if(display.display3D.mesh && glUnlockArraysEXT)
         glUnlockArraysEXT();*/

      if(mesh)
      {
         DisplayData displayData = display.driverData;
         Mesh meshData = mesh.data;

         // *** Vertex Stream ***
         glEnableClientState(GL_VERTEX_ARRAY);
         if(!display.display3D.collectingHits && meshData)
         {
            if(glBindBufferARB)
               glBindBufferARB(GL_ARRAY_BUFFER_ARB, (long)meshData.vertices);
            glVertexPointer(3, mesh.flags.doubleVertices ? GL_DOUBLE : GL_FLOAT, 0, glBindBufferARB ? null : mesh.vertices);

            // *** Normals Stream ***
            if(mesh.normals)
            {
               glEnableClientState(GL_NORMAL_ARRAY);
               if(glBindBufferARB)
                  glBindBufferARB(GL_ARRAY_BUFFER_ARB, (long)meshData.normals);
               glNormalPointer(mesh.flags.doubleNormals ? GL_DOUBLE : GL_FLOAT, 0, glBindBufferARB ? null : mesh.normals);
            }
            else
            {
               glDisableClientState(GL_NORMAL_ARRAY);
            }

            // *** Texture Coordinates Stream ***
            if(mesh.texCoords)
            {
               glEnableClientState(GL_TEXTURE_COORD_ARRAY);
               if(glBindBufferARB)
                  glBindBufferARB( GL_ARRAY_BUFFER_ARB, (long)meshData.texCoords);
               glTexCoordPointer(2, GL_FLOAT, 0, glBindBufferARB ? null : mesh.texCoords);
            }
            else
            {
               glDisableClientState(GL_TEXTURE_COORD_ARRAY);
            }

            // *** Color Stream ***
            if(mesh.colors)
            {
               glEnableClientState(GL_COLOR_ARRAY);
               if(glBindBufferARB)
                  glBindBufferARB( GL_ARRAY_BUFFER_ARB, (long)meshData.colors);
               glColorPointer(4, GL_FLOAT, 0, glBindBufferARB ? null : mesh.colors);
            }
            else
            {
               glDisableClientState(GL_COLOR_ARRAY);
            }
         }
         else
         {
            if(glBindBufferARB)
               glBindBufferARB( GL_ARRAY_BUFFER_ARB, 0);
            glVertexPointer(3,mesh.flags.doubleVertices ? GL_DOUBLE : GL_FLOAT,0,mesh.vertices);
            if(mesh.normals && !display.display3D.collectingHits)
            {
               glEnableClientState(GL_NORMAL_ARRAY);
               glNormalPointer(mesh.flags.doubleNormals ? GL_DOUBLE : GL_FLOAT, 0, mesh.normals);
            }
            else
               glDisableClientState(GL_NORMAL_ARRAY);
            if(mesh.texCoords && !display.display3D.collectingHits)
            {
               glEnableClientState(GL_TEXTURE_COORD_ARRAY);
               glTexCoordPointer(2, GL_FLOAT, 0, mesh.texCoords);
            }
            else
               glDisableClientState(GL_TEXTURE_COORD_ARRAY);
            if(mesh.colors && !display.display3D.collectingHits)
            {
               glEnableClientState(GL_COLOR_ARRAY);
               glColorPointer(4, GL_FLOAT, 0, mesh.colors);
            }
            else
               glDisableClientState(GL_COLOR_ARRAY);
         }

         //if(glLockArraysEXT) glLockArraysEXT(0, mesh.nVertices);
      }
      else if(glBindBufferARB)
         glBindBufferARB(GL_ARRAY_BUFFER_ARB, 0);
   }

   void DrawPrimitives(Display display, PrimitiveSingle * primitive, Mesh mesh)
   {
      DisplayData displayData = display.driverData;
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);

      if(primitive->type.vertexRange)
         glDrawArrays(primitiveTypes[primitive->type.primitiveType], primitive->first, primitive->nVertices);
      else
      {
         //    *** Hoping the data won't be uploaded at all (Won't really work if another group of the mesh is using the mesh ) ***
         // HACK TO SPEED THINGS UP...
         if(primitive->nIndices < (mesh.nVertices >> 2) && !primitive->type.indices32bit)
         {
            int c;
            glBegin(primitiveTypes[primitive->type.primitiveType]);
            if(primitive->data)
            {
               IndexData indexData = primitive->data;
               MeshFeatures flags = mesh.flags;
               for(c = 0; c < primitive->nIndices; c++)
               {
                  short index = ((short *) indexData.indices)[c];
                  if(flags.normals) glNormal3fv((float *)&mesh.normals[index]);
                  if(flags.texCoords1) glTexCoord2fv((float *)&mesh.texCoords[index]);
                  if(flags.colors) glColor4fv((float *)&mesh.colors[index]);
                  glVertex3fv((float *)&mesh.vertices[index]);
               }
            }
            glEnd();
         }
         else
         {
            IndexData indexData = primitive->data;

            if(!display.display3D.collectingHits && glBindBufferARB && indexData)
            {
               glBindBufferARB(GL_ELEMENT_ARRAY_BUFFER_ARB, indexData.buffer);
               glDrawElements(primitiveTypes[primitive->type.primitiveType], primitive->nIndices,
                  primitive->type.indices32bit ? GL_UNSIGNED_INT : GL_UNSIGNED_SHORT, 0);
               glBindBufferARB(GL_ELEMENT_ARRAY_BUFFER_ARB, 0);
            }
            else if(indexData)
               glDrawElements(primitiveTypes[primitive->type.primitiveType], primitive->nIndices,
                  primitive->type.indices32bit ? GL_UNSIGNED_INT : GL_UNSIGNED_SHORT, indexData.indices);
            else
               glDrawElements(primitiveTypes[primitive->type.primitiveType], primitive->nIndices,
                  primitive->type.indices32bit ? GL_UNSIGNED_INT : GL_UNSIGNED_SHORT, primitive->indices);
         }
      }
   }

   void PushMatrix(Display display)
   {
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);
      glPushMatrix();
   }

   void PopMatrix(Display display, bool setMatrix)
   {
      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);
      glPopMatrix();
   }

   void SetTransform(Display display, Matrix transMatrix, bool viewSpace, bool useCamera)
   {
      Matrix matrix = transMatrix;
      Camera camera = useCamera ? display.display3D.camera : null;

      printf("CocoaOpenGLDisplayDriver: STUB! %s:%i\n", __FILE__, __LINE__);
      if(viewSpace)
      {
         glLoadIdentity();
         glScalef(1.0f, 1.0f, -1.0f);
      }
      else if(camera)
      {
         glTranslated(
            matrix.m[3][0] - camera.cPosition.x,
            matrix.m[3][1] - camera.cPosition.y,
            matrix.m[3][2] - camera.cPosition.z);
      }
      else
         glTranslated(
            matrix.m[3][0],
            matrix.m[3][1],
            matrix.m[3][2]);

      matrix.m[3][0] = 0;
      matrix.m[3][1] = 0;
      matrix.m[3][2] = 0;

      glMultMatrixd(matrix.array);
   }
#endif
}
