// We were using PBUFFER for alpha compositing on Linux before, but it does not seem to work, nor be required anymore.
// #define USEPBUFFER

namespace gfx::drivers;

// OpenGL Extensions
#if defined(__unix__)

#if !defined(__MINGW32__)
#define GL_GLEXT_PROTOTYPES
#endif

#ifdef ECERE_MINIGLX

//#include <GL/miniglx.h>

#else

#define property _property
#define new _new
#define class _class

#define Window    X11Window
#define Cursor    X11Cursor
#define Font      X11Font
#define Display   X11Display
#define Time      X11Time
#define KeyCode   X11KeyCode
#define Picture   X11Picture
#define uint _uint

#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <GL/glx.h>
#include <X11/extensions/XShm.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <X11/extensions/Xrender.h>
#include <X11/extensions/shape.h>

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

#endif

#endif

#if defined(__APPLE__)
#include <OpenGl/gl.h>
#endif

#if defined(__WIN32__) || defined(__unix__) || defined(__APPLE__)

#if defined(__WIN32__)
#define WIN32_LEAN_AND_MEAN
#define _WIN32_WINNT 0x0500
#include <windows.h>
#endif

#include <GL/gl.h>
#include <GL/glext.h>

import "Display"

#if defined(__unix__)
import "XInterface"
#endif

#define glLoadMatrix glLoadMatrixd
#define glMultMatrix glMultMatrixd
#define glGetMatrix  glGetDoublev
#define glTranslate glTranslated
#define glScale glScaled

/*
#define glVertex3v glVertex3dv
#define glNormal3v glNormal3dv
*/

/*
//#ifdef VERTEX_FORMAT_DOUBLE

#define glLoadMatrix glLoadMatrixd
#define glMultMatrix glMultMatrixd
#define glGetMatrix  glGetDoublev
#define glVertex3v glVertex3dv
#define glNormal3v glNormal3dv
#define glTranslate glTranslated
#define glScale glScaled
//#define GL_VERTEX_FORMAT   GL_DOUBLE

#else

#define glLoadMatrix glLoadMatrixf
#define glMultMatrix glMultMatrixf
#define glGetMatrix  glGetFloatv
#define glVertex3v glVertex3fv
#define glNormal3v glNormal3fv
#define glTranslate glTranslatef
#define glScale glScalef
//#define GL_VERTEX_FORMAT   GL_FLOAT

#endif
*/

#define GL_ARRAY_BUFFER_ARB            0x8892
#define GL_ELEMENT_ARRAY_BUFFER_ARB    0x8893
#define GL_STATIC_DRAW_ARB             0x88E4
#define GL_LIGHT_MODEL_COLOR_CONTROL   0x81F8
#define GL_SEPARATE_SPECULAR_COLOR     0x81FA

#define GL_MULTISAMPLE_ARB             0x809D

#if defined(__WIN32__)

#define WGL_SAMPLE_BUFFERS_ARB              0x2041
#define WGL_SAMPLES_ARB                     0x2042

#define  WGL_WGLEXT_VERSION   1 
#define  WGL_FRONT_COLOR_BUFFER_BIT_ARB   0x00000001 
#define  WGL_BACK_COLOR_BUFFER_BIT_ARB   0x00000002 
#define  WGL_DEPTH_BUFFER_BIT_ARB   0x00000004 
#define  WGL_STENCIL_BUFFER_BIT_ARB   0x00000008 
#define  WGL_NUMBER_PIXEL_FORMATS_ARB   0x2000 
#define  WGL_DRAW_TO_WINDOW_ARB   0x2001 
#define  WGL_DRAW_TO_BITMAP_ARB   0x2002 
#define  WGL_ACCELERATION_ARB   0x2003 
#define  WGL_NEED_PALETTE_ARB   0x2004 
#define  WGL_NEED_SYSTEM_PALETTE_ARB   0x2005 
#define  WGL_SWAP_LAYER_BUFFERS_ARB   0x2006 
#define  WGL_SWAP_METHOD_ARB   0x2007 
#define  WGL_NUMBER_OVERLAYS_ARB   0x2008 
#define  WGL_NUMBER_UNDERLAYS_ARB   0x2009 
#define  WGL_TRANSPARENT_ARB   0x200A 
#define  WGL_TRANSPARENT_RED_VALUE_ARB   0x2037 
#define  WGL_TRANSPARENT_GREEN_VALUE_ARB   0x2038 
#define  WGL_TRANSPARENT_BLUE_VALUE_ARB   0x2039 
#define  WGL_TRANSPARENT_ALPHA_VALUE_ARB   0x203A 
#define  WGL_TRANSPARENT_INDEX_VALUE_ARB   0x203B 
#define  WGL_SHARE_DEPTH_ARB   0x200C 
#define  WGL_SHARE_STENCIL_ARB   0x200D 
#define  WGL_SHARE_ACCUM_ARB   0x200E 
#define  WGL_SUPPORT_GDI_ARB   0x200F 
#define  WGL_SUPPORT_OPENGL_ARB   0x2010 
#define  WGL_DOUBLE_BUFFER_ARB   0x2011 
#define  WGL_STEREO_ARB   0x2012 
#define  WGL_PIXEL_TYPE_ARB   0x2013 
#define  WGL_COLOR_BITS_ARB   0x2014 
#define  WGL_RED_BITS_ARB   0x2015 
#define  WGL_RED_SHIFT_ARB   0x2016 
#define  WGL_GREEN_BITS_ARB   0x2017 
#define  WGL_GREEN_SHIFT_ARB   0x2018 
#define  WGL_BLUE_BITS_ARB   0x2019 
#define  WGL_BLUE_SHIFT_ARB   0x201A 
#define  WGL_ALPHA_BITS_ARB   0x201B 
#define  WGL_ALPHA_SHIFT_ARB   0x201C 
#define  WGL_ACCUM_BITS_ARB   0x201D 
#define  WGL_ACCUM_RED_BITS_ARB   0x201E 
#define  WGL_ACCUM_GREEN_BITS_ARB   0x201F 
#define  WGL_ACCUM_BLUE_BITS_ARB   0x2020 
#define  WGL_ACCUM_ALPHA_BITS_ARB   0x2021 
#define  WGL_DEPTH_BITS_ARB   0x2022 
#define  WGL_STENCIL_BITS_ARB   0x2023 
#define  WGL_AUX_BUFFERS_ARB   0x2024 
#define  WGL_NO_ACCELERATION_ARB   0x2025 
#define  WGL_GENERIC_ACCELERATION_ARB   0x2026 
#define  WGL_FULL_ACCELERATION_ARB   0x2027 
#define  WGL_SWAP_EXCHANGE_ARB   0x2028 
#define  WGL_SWAP_COPY_ARB   0x2029 
#define  WGL_SWAP_UNDEFINED_ARB   0x202A 
#define  WGL_TYPE_RGBA_ARB   0x202B 
#define  WGL_TYPE_COLORINDEX_ARB   0x202C 
#define  ERROR_INVALID_PIXEL_TYPE_ARB   0x2043 
#define  ERROR_INCOMPATIBLE_DEVICE_CONTEXTS_ARB   0x2054 
#define  WGL_DRAW_TO_PBUFFER_ARB   0x202D 
#define  WGL_MAX_PBUFFER_PIXELS_ARB   0x202E 
#define  WGL_MAX_PBUFFER_WIDTH_ARB   0x202F 
#define  WGL_MAX_PBUFFER_HEIGHT_ARB   0x2030 
#define  WGL_PBUFFER_LARGEST_ARB   0x2033 
#define  WGL_PBUFFER_WIDTH_ARB   0x2034 
#define  WGL_PBUFFER_HEIGHT_ARB   0x2035 
#define  WGL_PBUFFER_LOST_ARB   0x2036 
#define  ERROR_INVALID_PIXEL_TYPE_EXT   0x2043 
#define  WGL_NUMBER_PIXEL_FORMATS_EXT   0x2000 
#define  WGL_DRAW_TO_WINDOW_EXT   0x2001 
#define  WGL_DRAW_TO_BITMAP_EXT   0x2002 
#define  WGL_ACCELERATION_EXT   0x2003 
#define  WGL_NEED_PALETTE_EXT   0x2004 
#define  WGL_NEED_SYSTEM_PALETTE_EXT   0x2005 
#define  WGL_SWAP_LAYER_BUFFERS_EXT   0x2006 
#define  WGL_SWAP_METHOD_EXT   0x2007 
#define  WGL_NUMBER_OVERLAYS_EXT   0x2008 
#define  WGL_NUMBER_UNDERLAYS_EXT   0x2009 
#define  WGL_TRANSPARENT_EXT   0x200A 
#define  WGL_TRANSPARENT_VALUE_EXT   0x200B 
#define  WGL_SHARE_DEPTH_EXT   0x200C 
#define  WGL_SHARE_STENCIL_EXT   0x200D 
#define  WGL_SHARE_ACCUM_EXT   0x200E 
#define  WGL_SUPPORT_GDI_EXT   0x200F 
#define  WGL_SUPPORT_OPENGL_EXT   0x2010 
#define  WGL_DOUBLE_BUFFER_EXT   0x2011 
#define  WGL_STEREO_EXT   0x2012 
#define  WGL_PIXEL_TYPE_EXT   0x2013 
#define  WGL_COLOR_BITS_EXT   0x2014 
#define  WGL_RED_BITS_EXT   0x2015 
#define  WGL_RED_SHIFT_EXT   0x2016 
#define  WGL_GREEN_BITS_EXT   0x2017 
#define  WGL_GREEN_SHIFT_EXT   0x2018 
#define  WGL_BLUE_BITS_EXT   0x2019 
#define  WGL_BLUE_SHIFT_EXT   0x201A 
#define  WGL_ALPHA_BITS_EXT   0x201B 
#define  WGL_ALPHA_SHIFT_EXT   0x201C 
#define  WGL_ACCUM_BITS_EXT   0x201D 
#define  WGL_ACCUM_RED_BITS_EXT   0x201E 
#define  WGL_ACCUM_GREEN_BITS_EXT   0x201F 
#define  WGL_ACCUM_BLUE_BITS_EXT   0x2020 
#define  WGL_ACCUM_ALPHA_BITS_EXT   0x2021 
#define  WGL_DEPTH_BITS_EXT   0x2022 
#define  WGL_STENCIL_BITS_EXT   0x2023 
#define  WGL_AUX_BUFFERS_EXT   0x2024 
#define  WGL_NO_ACCELERATION_EXT   0x2025 
#define  WGL_GENERIC_ACCELERATION_EXT   0x2026 
#define  WGL_FULL_ACCELERATION_EXT   0x2027 
#define  WGL_SWAP_EXCHANGE_EXT   0x2028 
#define  WGL_SWAP_COPY_EXT   0x2029 
#define  WGL_SWAP_UNDEFINED_EXT   0x202A 
#define  WGL_TYPE_RGBA_EXT   0x202B 
#define  WGL_TYPE_COLORINDEX_EXT   0x202C 
#define  WGL_DRAW_TO_PBUFFER_EXT   0x202D 
#define  WGL_MAX_PBUFFER_PIXELS_EXT   0x202E 
#define  WGL_MAX_PBUFFER_WIDTH_EXT   0x202F 
#define  WGL_MAX_PBUFFER_HEIGHT_EXT   0x2030 
#define  WGL_OPTIMAL_PBUFFER_WIDTH_EXT   0x2031 
#define  WGL_OPTIMAL_PBUFFER_HEIGHT_EXT   0x2032 
#define  WGL_PBUFFER_LARGEST_EXT   0x2033 
#define  WGL_PBUFFER_WIDTH_EXT   0x2034 
#define  WGL_PBUFFER_HEIGHT_EXT   0x2035 
#define  WGL_DEPTH_FLOAT_EXT   0x2040 
#define  WGL_SAMPLE_BUFFERS_3DFX   0x2060 
#define  WGL_SAMPLES_3DFX   0x2061 
#define  WGL_SAMPLE_BUFFERS_EXT   0x2041 
#define  WGL_SAMPLES_EXT   0x2042 
#define  WGL_GENLOCK_SOURCE_MULTIVIEW_I3D   0x2044 
#define  WGL_GENLOCK_SOURCE_EXTENAL_SYNC_I3D   0x2045 
#define  WGL_GENLOCK_SOURCE_EXTENAL_FIELD_I3D   0x2046 
#define  WGL_GENLOCK_SOURCE_EXTENAL_TTL_I3D   0x2047 
#define  WGL_GENLOCK_SOURCE_DIGITAL_SYNC_I3D   0x2048 
#define  WGL_GENLOCK_SOURCE_DIGITAL_FIELD_I3D   0x2049 
#define  WGL_GENLOCK_SOURCE_EDGE_FALLING_I3D   0x204A 
#define  WGL_GENLOCK_SOURCE_EDGE_RISING_I3D   0x204B 
#define  WGL_GENLOCK_SOURCE_EDGE_BOTH_I3D   0x204C 
#define  WGL_GAMMA_TABLE_SIZE_I3D   0x204E 
#define  WGL_GAMMA_EXCLUDE_DESKTOP_I3D   0x204F 
#define  WGL_DIGITAL_VIDEO_CURSOR_ALPHA_FRAMEBUFFER_I3D   0x2050 
#define  WGL_DIGITAL_VIDEO_CURSOR_ALPHA_VALUE_I3D   0x2051 
#define  WGL_DIGITAL_VIDEO_CURSOR_INCLUDED_I3D   0x2052 
#define  WGL_DIGITAL_VIDEO_GAMMA_CORRECTED_I3D   0x2053 
#define  WGL_ARB_buffer_region   1 
#define  WGL_ARB_extensions_string   1 
#define  WGL_ARB_pixel_format   1 
#define  WGL_ARB_make_current_read   1 
#define  WGL_ARB_pbuffer   1 
#define  WGL_EXT_display_color_table   1 
#define  WGL_EXT_extensions_string   1 
#define  WGL_EXT_make_current_read   1 
#define  WGL_EXT_pbuffer   1 
#define  WGL_EXT_pixel_format   1 
#define  WGL_EXT_swap_control   1 
#define  WGL_WGL_EXT_depth_float   1 
#define  WGL_WGL_3DFX_multisample   1 
#define  WGL_WGL_EXT_multisample   1 
#define  WGL_NV_allocate_memory   1 

/*
typedef void (APIENTRY * PFNGLACTIVETEXTUREARBPROC) (GLenum target);
typedef void (APIENTRY * PFNGLMULTITEXCOORD2FARBPROC) (GLenum target, GLfloat s, GLfloat t);
typedef void (APIENTRY * PFNGLCLIENTACTIVETEXTUREARBPROC) (GLenum target);
typedef void (APIENTRY * PFNGLLOCKARRAYSEXTPROC) (GLint first, GLsizei count);
typedef void (APIENTRY * PFNGLUNLOCKARRAYSEXTPROC) (void);
*/

/*
typedef int (APIENTRY * PFNGLBINDBUFFERARBPROC) (GLenum target, GLuint buffer);
typedef int (APIENTRY * PFNGLDELETEBUFFERSARBPROC) (GLsizei n, const GLuint *buffers);
typedef int (APIENTRY * PFNGLGENBUFFERSARBPROC) (GLsizei n, GLuint *buffers);
typedef int (APIENTRY * PFNGLBUFFERDATAARBPROC) (GLenum target, int size, const GLvoid *data, GLenum usage);
*/
typedef int (APIENTRY * PFNWGLCHOOSEPIXELFORMATARBPROC) ();
typedef void * (APIENTRY * PFNWGLCREATEPBUFFERARBPROC) (HDC hDC, int iPixelFormat, int iWidth, int iHeight, const int *piAttribList);
typedef HDC (APIENTRY * PFNWGLGETPBUFFERDCARBPROC) (void * hPbuffer);
typedef int (APIENTRY * PFNWGLRELEASEPBUFFERDCARBPROC) (void * hPbuffer, HDC hDC);
typedef BOOL (APIENTRY * PFNWGLDESTROYPBUFFERARBPROC) (void * hPbuffer);
typedef BOOL (APIENTRY * PFNWGLQUERYPBUFFERARBPROC) (void * hPbuffer, int iAttribute, int *piValue);

static PFNGLMAPBUFFERARBPROC glMapBufferARB = null;
static PFNGLUNMAPBUFFERARBPROC glUnmapBufferARB = null;
static PFNGLACTIVETEXTUREARBPROC glActiveTextureARB = null;
static PFNGLMULTITEXCOORD2FARBPROC glMultiTexCoord2fARB = null;
static PFNGLCLIENTACTIVETEXTUREARBPROC glClientActiveTextureARB = null;
static PFNGLLOCKARRAYSEXTPROC glLockArraysEXT = null;
static PFNGLUNLOCKARRAYSEXTPROC glUnlockArraysEXT = null;
static PFNGLBLENDFUNCSEPARATEPROC glBlendFuncSeparate = null;

static PFNGLGENBUFFERSARBPROC glGenBuffersARB = null;
static PFNGLBINDBUFFERARBPROC glBindBufferARB = null;
static PFNGLBUFFERDATAARBPROC glBufferDataARB = null;
static PFNGLDELETEBUFFERSARBPROC glDeleteBuffersARB = null;
static PFNWGLCHOOSEPIXELFORMATARBPROC wglChoosePixelFormatARB = null;
static PFNWGLGETEXTENSIONSSTRINGARBPROC wglGetExtensionsStringARB = null;
static PFNWGLCREATEPBUFFERARBPROC wglCreatePbufferARB = null;
static PFNWGLGETPBUFFERDCARBPROC wglGetPbufferDCARB = null;
static PFNWGLQUERYPBUFFERARBPROC wglQueryPbufferARB = null;
static PFNWGLDESTROYPBUFFERARBPROC wglDestroyPbufferARB = null;
static PFNWGLRELEASEPBUFFERDCARBPROC wglReleasePbufferDCARB = null;
static PFNWGLBINDTEXIMAGEARBPROC wglBindTexImageARB = null;
static PFNWGLRELEASETEXIMAGEARBPROC wglReleaseTexImageARB = null;

#ifdef WGL_WGLEXT_PROTOTYPES
extern BOOL WINAPI wglSwapIntervalEXT (int);
extern int WINAPI wglGetSwapIntervalEXT (void);
#endif /* WGL_WGLEXT_PROTOTYPES */
typedef BOOL (WINAPI * PFNWGLSWAPINTERVALEXTPROC) (int interval);
typedef int (WINAPI * PFNWGLGETSWAPINTERVALEXTPROC) (void);

static PFNWGLSWAPINTERVALEXTPROC wglSwapIntervalEXT = NULL;

#else

void (APIENTRY * glBindBufferARB) (GLenum target, GLuint buffer);
void (APIENTRY * glGenBuffersARB) (GLsizei n, GLuint *buffers);
void (APIENTRY * glDeleteBuffersARB) (GLsizei n, const GLuint *buffers);
void (APIENTRY * glBufferDataARB) (GLenum target, int size, const GLvoid *data, GLenum usage);

#endif

static int displayWidth, displayHeight;

#define GL_CLAMP_TO_EDGE 0x812F

static bool useSingleGLContext = false;
class OGLDisplay : struct
{
#if defined(__WIN32__)
   HDC hdc;
   HGLRC glrc;

   HBITMAP memBitmap;
   HDC memDC;
   byte * picture;
   uint stride;
   void * pBuffer;
   /*
   int imageBuffers[2];
   byte * pboMemory1, * pboMemory2;
   */
#else
   GLXContext glContext;

   Pixmap pixmap;
   XShmSegmentInfo shminfo;
   XImage * image;
   XShmSegmentInfo shminfoShape;
   XImage * shapeImage;
   byte * picture;
   uint stride;
   GLXPbuffer pBuffer;
   X11Picture windowPicture;
   X11Picture pixmapPicture;
   Pixmap shapePixmap;
   X11Picture shapePicture;
#endif

   ColorAlpha * flippingBuffer;
   int flipBufH, flipBufW;
   bool depthWrite;
   int x, y;
};

class OGLSystem : struct
{
#if defined(__WIN32__)
   PIXELFORMATDESCRIPTOR pfd;
   int format;
   HDC hdc;
   HGLRC glrc;
   HWND hwnd;
#else
   XVisualInfo * visualInfo;
   GLXContext glContext;
   Pixmap dummyPixmap;
   GLXPixmap dummyGLXPixmap;
#endif
   bool loadingFont;
};

class OGLSurface : struct
{
   Font font;
   bool opaqueText;
   int xOffset;
   bool writingText;

   float foreground[4], background[4], bitmapMult[4];
} OGLSurface;

class OGLMesh : struct
{
   int vertices;
   int normals;
   int texCoords;
   int texCoords2;
   int colors;
};

class OGLIndices : struct
{
   uint16 * indices;
   int buffer;
   int nIndices;
};

static int primitiveTypes[RenderPrimitiveType] =
{
   GL_POINTS, GL_LINES, GL_TRIANGLES, GL_TRIANGLE_STRIP, GL_TRIANGLE_FAN, GL_QUADS, GL_QUAD_STRIP, GL_LINE_STRIP
};

int current;
void * previous;

class OpenGLDisplayDriver : DisplayDriver
{
   class_property(name) = "OpenGL";

   bool LockSystem(DisplaySystem displaySystem)
   {
      OGLSystem oglSystem = displaySystem.driverData;
      if(useSingleGLContext) return true;
   #if defined(__WIN32__)
      wglMakeCurrent(oglSystem.hdc, oglSystem.glrc);
   #elif defined(__unix__)
      //if(previous) return true;
      // printf("Making SYSTEM current\n");
/*#if defined(__APPLE__)
      //glXMakeCurrent(xGlobalDisplay, displaySystem.window, oglSystem.glContext);
#else*/
      glXMakeCurrent(xGlobalDisplay, oglSystem.dummyGLXPixmap /*displaySystem.window /*DefaultRootWindow(xGlobalDisplay)*/, oglSystem.glContext);
//#endif
      //previous = oglSystem.glContext;
   #endif
      return true;
   }

   void UnlockSystem(DisplaySystem displaySystem)
   {
      if(useSingleGLContext) return;
   #if defined(__WIN32__)
      wglMakeCurrent(null, null);
   #elif defined(__unix__)
      // printf("Making NULL current\n");
      glXMakeCurrent(xGlobalDisplay, None, null);
      // previous = null;
   #endif
   }

   bool Lock(Display display)
   {
      OGLDisplay oglDisplay = display.driverData;
      OGLSystem oglSystem = display.displaySystem.driverData;

      if(useSingleGLContext) return true;
   #if defined(__WIN32__)
      wglMakeCurrent(oglDisplay.hdc, oglDisplay.glrc);
   #elif defined(__unix__)
      // if(previous) glXMakeCurrent(xGlobalDisplay, None, null);
      // printf("   Making DISPLAY current\n");
      glXMakeCurrent(xGlobalDisplay, (int)display.window, oglDisplay.glContext);
   #endif
      return true;
   }

   void Unlock(Display display)
   {
      if(useSingleGLContext) return;
      //printf("   Making NULL current\n");
      //glXMakeCurrent(xGlobalDisplay, None, null);
      // if(previous)
         LockSystem(display.displaySystem);
   }

   void DestroyDisplay(Display display)
   {
      OGLDisplay oglDisplay = display.driverData;

      if(oglDisplay)
      {
   #if defined(__WIN32__)
         wglMakeCurrent( null, null );

         if(oglDisplay.glrc) 
            wglDeleteContext(oglDisplay.glrc);
      
         if(oglDisplay.hdc && oglDisplay.pBuffer)
            wglReleasePbufferDCARB(oglDisplay.pBuffer, oglDisplay.hdc);

         if(oglDisplay.pBuffer)
            wglDestroyPbufferARB(oglDisplay.pBuffer);

         if(oglDisplay.hdc) 
            ReleaseDC(display.window, oglDisplay.hdc);

         if(oglDisplay.memDC) DeleteDC(oglDisplay.memDC);
         if(oglDisplay.memBitmap) DeleteObject(oglDisplay.memBitmap); 

   #elif defined(__unix__)
         if(oglDisplay.shapePixmap)
            XFreePixmap(xGlobalDisplay, oglDisplay.shapePixmap);
         if(oglDisplay.pixmap)
            XFreePixmap(xGlobalDisplay, oglDisplay.pixmap);
         if(oglDisplay.image)
         {
            if(oglDisplay.shminfoShape.shmid != -1)
            {
               XShmDetach(xGlobalDisplay, &oglDisplay.shminfo);
               if(oglDisplay.shminfo.shmaddr != (void *)-1)
                  shmdt(oglDisplay.shminfo.shmaddr);
               shmctl(oglDisplay.shminfo.shmid, IPC_RMID, 0);
            }
         }
         if(oglDisplay.shapeImage)
         {
            if(oglDisplay.shminfoShape.shmid != -1)
            {
               XShmDetach(xGlobalDisplay, &oglDisplay.shminfoShape);
               if(oglDisplay.shminfoShape.shmaddr != (void *)-1)
                  shmdt(oglDisplay.shminfoShape.shmaddr);
               shmctl(oglDisplay.shminfoShape.shmid, IPC_RMID, 0);
            }                  
            XDestroyImage(oglDisplay.shapeImage);
            oglDisplay.shapeImage = None;
         }

         glXMakeCurrent(xGlobalDisplay, None, null);
      
         if(oglDisplay.glContext) 
            glXDestroyContext(xGlobalDisplay, oglDisplay.glContext);
   #endif
         delete oglDisplay.flippingBuffer;
         delete oglDisplay;
         display.driverData = null;
      }
   }

   bool CreateDisplaySystem(DisplaySystem displaySystem)
   {
      bool result = false;
      OGLSystem oglSystem = displaySystem.driverData = OGLSystem { };

   #ifdef __WIN32__
      oglSystem.hwnd = CreateWindow("static", null, 0,0,0,0,0,null,null,null,null);

      oglSystem.hdc = GetDC(oglSystem.hwnd);
      if(oglSystem.hdc)
      {
   	   
         oglSystem.pfd.nSize = (short)sizeof(oglSystem.pfd);
         oglSystem.pfd.nVersion = 1;
         oglSystem.pfd.dwFlags = PFD_DRAW_TO_WINDOW /*PFD_DRAW_TO_BITMAP*/ | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER;
         oglSystem.pfd.iPixelType = PFD_TYPE_RGBA;
         oglSystem.pfd.cColorBits = 24;
         oglSystem.pfd.cAlphaBits = 8;
         oglSystem.pfd.cDepthBits = 24;
         oglSystem.pfd.iLayerType = PFD_MAIN_PLANE;

         oglSystem.format = ChoosePixelFormat(oglSystem.hdc, &oglSystem.pfd);
         DescribePixelFormat(oglSystem.hdc, oglSystem.format, sizeof(oglSystem.pfd), &oglSystem.pfd);

         if(oglSystem.pfd.cColorBits > 8)
         {
            SetPixelFormat(oglSystem.hdc, oglSystem.format, &oglSystem.pfd);
            oglSystem.glrc = wglCreateContext(oglSystem.hdc);
            if(oglSystem.glrc)
            {
               wglMakeCurrent(oglSystem.hdc, oglSystem.glrc);

   	         // Get Pointers To The GL Functions
               glActiveTextureARB = (void *) wglGetProcAddress("glActiveTextureARB");
               glMultiTexCoord2fARB = (void *) wglGetProcAddress("glMultiTexCoord2fARB");
               glClientActiveTextureARB = (void *) wglGetProcAddress("glClientActiveTextureARB");
               glLockArraysEXT = (void *) wglGetProcAddress("glLockArraysEXT" );
               glUnlockArraysEXT = (void *) wglGetProcAddress("glUnlockArraysEXT");
     	         glGenBuffersARB = (void *) wglGetProcAddress("glGenBuffersARB");
   	         glBindBufferARB = (void *) wglGetProcAddress("glBindBufferARB");
   	         glBufferDataARB = (void *) wglGetProcAddress("glBufferDataARB");
               glMapBufferARB  = (void *) wglGetProcAddress("glMapBufferARB");
               glUnmapBufferARB  = (void *) wglGetProcAddress("glUnmapBufferARB");
   	         glDeleteBuffersARB = (void *) wglGetProcAddress("glDeleteBuffersARB");
               glBlendFuncSeparate = (void *) wglGetProcAddress("glBlendFuncSeparate");

               wglChoosePixelFormatARB = (void *) wglGetProcAddress("wglChoosePixelFormatARB");
               wglGetExtensionsStringARB = (void *)wglGetProcAddress("wglGetExtensionsStringARB");
               wglCreatePbufferARB = (void *)wglGetProcAddress("wglCreatePbufferARB");
               wglGetPbufferDCARB = (void *)wglGetProcAddress("wglGetPbufferDCARB");
               wglQueryPbufferARB = (void *)wglGetProcAddress("wglQueryPbufferARB");
               wglDestroyPbufferARB = (void *)wglGetProcAddress("wglDestroyPbufferARB");
               wglReleasePbufferDCARB = (void *)wglGetProcAddress("wglReleasePbufferDCARB");
               wglBindTexImageARB = (void *)wglGetProcAddress("wglBindTexImageARB");
               wglReleaseTexImageARB = (void *)wglGetProcAddress("wglReleaseTexImageARB");

               wglSwapIntervalEXT = (void *)wglGetProcAddress("wglSwapIntervalEXT");

               // eSystem_LoggingMode(LOG_MSGBOX, null);

               if(wglChoosePixelFormatARB)
               {
   	            int pixelFormat;
   	            int valid;
   	            int numFormats;
   	            float fAttributes[] = {0,0};
   	            int iAttributes[] =
                  { 
                     WGL_DRAW_TO_WINDOW_ARB,GL_TRUE,
   		            WGL_SUPPORT_OPENGL_ARB,GL_TRUE,
   		            WGL_ACCELERATION_ARB,WGL_FULL_ACCELERATION_ARB,
   		            WGL_COLOR_BITS_ARB,24,
   		            WGL_ALPHA_BITS_ARB,8,
   		            WGL_DEPTH_BITS_ARB,16,
   		            WGL_STENCIL_BITS_ARB,0,
   		            WGL_DOUBLE_BUFFER_ARB,GL_TRUE,
   		            WGL_SAMPLE_BUFFERS_ARB,GL_TRUE,
   		            WGL_SAMPLES_ARB, 4,						// Check For 4x Multisampling
   		            0,0
                  };

                  //Log("Found wglChoosePixelFormatARB\n");

   	            valid = wglChoosePixelFormatARB(oglSystem.hdc,iAttributes,fAttributes,1,&pixelFormat,&numFormats);
   	            if(!valid || !numFormats)
   	            {
                     //Log("Can't find 4x multi sampling\n");
   	               iAttributes[19] = 2;
   	               valid = wglChoosePixelFormatARB(oglSystem.hdc,iAttributes,fAttributes,1,&pixelFormat,&numFormats);
                     if(!valid || !numFormats)
                     {
                        // Log("Can't find 2x multi sampling\n");
                        iAttributes[16] = 0;
                        iAttributes[17] = 0;
                        valid = wglChoosePixelFormatARB(oglSystem.hdc,iAttributes,fAttributes,1,&pixelFormat,&numFormats);
                     }
   	            }
                  if(valid && numFormats)
                  {
                     oglSystem.format = pixelFormat;
                     wglMakeCurrent(null, null);
                     wglDeleteContext(oglSystem.glrc);

                     // *** DescribePixelFormat does not support WGL pixel formats! ***
                     //DescribePixelFormat(oglSystem.hdc, oglSystem.format, sizeof(oglSystem.pfd), &oglSystem.pfd);
                     SetPixelFormat(oglSystem.hdc, oglSystem.format, &oglSystem.pfd);
                     //Log("Successfully set pixel format\n");

                     oglSystem.glrc = wglCreateContext(oglSystem.hdc);
                     wglMakeCurrent(oglSystem.hdc, oglSystem.glrc);
                  }
               }
               /*else
                  eSystem_Logf("Can't find wglChoosePixelFormatARB\n");*/

               result = true;

               wglMakeCurrent(null, null);

               //eSystem_DumpErrors(true);
            }
         }
      }
   #elif defined(__unix__)
      int attrList[] = 
      {
   #ifndef ECERE_MINIGLX
         GLX_USE_GL, GLX_DEPTH_SIZE, 1,
   #endif
         GLX_RGBA, 
         GLX_RED_SIZE, 1, GLX_GREEN_SIZE, 1, GLX_BLUE_SIZE, 1,
         GLX_DOUBLEBUFFER, 
         None
      };
      oglSystem.visualInfo = glXChooseVisual(xGlobalDisplay, DefaultScreen(xGlobalDisplay), attrList);
      if(oglSystem.visualInfo)
      {
         //printf("glXChooseVisual returnded a visual info\n");
         oglSystem.dummyPixmap = XCreatePixmap(xGlobalDisplay, (uint)displaySystem.window, 1, 1, oglSystem.visualInfo->depth);
         oglSystem.dummyGLXPixmap = glXCreateGLXPixmap(xGlobalDisplay, oglSystem.visualInfo, oglSystem.dummyPixmap);
         
         oglSystem.glContext = glXCreateContext(xGlobalDisplay, oglSystem.visualInfo, null, True);
         // printf("Creating system Context (%x)!\n", oglSystem.glContext);
         if(oglSystem.glContext)
         {
            //printf("Got a Context\n");
            glXMakeCurrent(xGlobalDisplay, oglSystem.dummyGLXPixmap /*displaySystem.window /*DefaultRootWindow(xGlobalDisplay)*/, oglSystem.glContext);

            // Setup Extensions

            glXMakeCurrent(xGlobalDisplay, None, null);

            result = true;
         }
      }
   #endif

      displaySystem.flags.alpha = true;
      displaySystem.flags.flipping = true;
      displaySystem.pixelFormat = pixelFormat888;
      return result;
   }

   void DestroyDisplaySystem(DisplaySystem displaySystem)
   {
      OGLSystem oglSystem = displaySystem.driverData;

   #if defined(__WIN32__)
      wglMakeCurrent( null, null );

      if(oglSystem.glrc) 
         wglDeleteContext(oglSystem.glrc);
      
      if(oglSystem.hdc) 
         ReleaseDC(oglSystem.hwnd, oglSystem.hdc);
      DestroyWindow(oglSystem.hwnd);

   #elif defined(__unix__)

      if(oglSystem.visualInfo)
      {
   #ifdef   ECERE_MINIGLX
         __miniglx_XFree(oglSystem.visualInfo);
   #else
         XFree(oglSystem.visualInfo);
   #endif
      }

      if(oglSystem.dummyGLXPixmap)
         glXDestroyGLXPixmap(xGlobalDisplay, oglSystem.dummyGLXPixmap);
      if(oglSystem.dummyPixmap);
         XFreePixmap(xGlobalDisplay, oglSystem.dummyPixmap);
   #endif
      delete oglSystem;
   }

   bool CreateDisplay(Display display)
   {
      bool result = false;
      OGLDisplay oglDisplay = display.driverData;
      OGLSystem oglSystem = display.displaySystem.driverData;
      if(!oglDisplay)
         oglDisplay = display.driverData = OGLDisplay { };
      //printf("Inside CreateDisplay\n");

#if defined(__WIN32__) || defined(USEPBUFFER)
      if(!display.alphaBlend)
#endif
      {
   #if defined(__WIN32__)
         oglDisplay.hdc = GetDC(display.window);
         SetPixelFormat(oglDisplay.hdc, oglSystem.format, &oglSystem.pfd);
         if((oglDisplay.glrc = wglCreateContext(oglDisplay.hdc)))
         {
            wglShareLists(oglSystem.glrc, oglDisplay.glrc);
            wglMakeCurrent(oglDisplay.hdc, oglDisplay.glrc);
            result = true;
         }
         else
            ReleaseDC(display.window, oglDisplay.hdc);
   #elif defined(__unix__)
         XVisualInfo * visualInfo = null;
         /*
         int attrib[] =
         {
            GLX_RENDER_TYPE, GLX_RGBA_BIT,
            GLX_DRAWABLE_TYPE, GLX_WINDOW_BIT,
            GLX_RED_SIZE, 1,
            GLX_GREEN_SIZE, 1,
            GLX_BLUE_SIZE, 1,
            GLX_DOUBLEBUFFER, True,
            GLX_DEPTH_SIZE, 24,
            None
         };
         */
         //visualInfo = glXChooseVisual(xGlobalDisplay, DefaultScreen(xGlobalDisplay), attrib);
         visualInfo = ((XWindowData)display.windowDriverData).visual;

         /*
         GLXFBConfig *fbconfigs, fbconfig;
         int numfbconfigs;
         fbconfigs = glXChooseFBConfig(xGlobalDisplay, DefaultScreen(xGlobalDisplay), attrib, &numfbconfigs);
         if(fbconfigs)
         {
            int i;
            for (i = 0; i < numfbconfigs; i++)
            {
               XRenderPictFormat * format;
               visualInfo = glXGetVisualFromFBConfig(xGlobalDisplay, fbconfigs[i]);
               if (!visualInfo) continue;
               format = XRenderFindVisualFormat(xGlobalDisplay, visualInfo->visual);
               if (!format) continue;

               if(format->direct.alphaMask > 0)
               {
                  fbconfig = fbconfigs[i];
                  break;
               }
               //XFree(visualInfo);
            }

            if (i == numfbconfigs)
            {
               fbconfig = fbconfigs[0];
               visualInfo = glXGetVisualFromFBConfig(xGlobalDisplay, fbconfig);
            }
            XFree(fbconfigs);
         }
         */
         if(visualInfo)
         {
            //printf("visualInfo is not null\n");
            // printf("Creating Display Context, sharing with %x!\n", oglSystem.glContext);
            oglDisplay.glContext = glXCreateContext(xGlobalDisplay, visualInfo, oglSystem.glContext, True);
            //XFree(visualInfo);
         }

         // oglDisplay.glContext = glXCreateContext(xGlobalDisplay, oglSystem.visualInfo, oglSystem.glContext, True);
         if(oglDisplay.glContext)
         {
            //printf("CreateDisplay Got a Context\n");
            glXMakeCurrent(xGlobalDisplay, (int)display.window, oglDisplay.glContext);
            result = true;
         }
   #endif
      }
#if defined(__WIN32__) || defined(USEPBUFFER)
      else
         result = true;
#endif
      if(result)
      {
#if !defined(__OLDX__)
         if(glBlendFuncSeparate)
            glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
         else
#endif
            glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
         glEnable(GL_BLEND);

         glMatrixMode(GL_MODELVIEW);
         glScalef(1.0f, 1.0f, -1.0f);
         // glTranslatef(0.375f, 0.375f, 0.0f);
         // glTranslatef(-0.625f, -0.625f, 0.0f);
         glMatrixMode(GL_PROJECTION);
         glShadeModel(GL_FLAT);

         // glLightModeli(GL_LIGHT_MODEL_LOCAL_VIEWER, true);
         glLightModeli(GL_LIGHT_MODEL_COLOR_CONTROL, GL_SEPARATE_SPECULAR_COLOR);
         glFogi(GL_FOG_MODE, GL_EXP);
         glFogf(GL_FOG_DENSITY, 0);
         glEnable(GL_NORMALIZE);
         glDepthFunc(GL_LESS);
         glClearDepth(1.0);
         glDisable(GL_MULTISAMPLE_ARB);
      }
      display.ambient = Color { 50,50,50 };

   if(!useSingleGLContext)
   #if defined(__WIN32__)
      wglMakeCurrent(null, null);
   #elif defined(__unix__)
      glXMakeCurrent(xGlobalDisplay, None, null);
   #endif

      return result;
   }

   bool DisplaySize(Display display, int width, int height)
   {
      OGLDisplay oglDisplay = display.driverData;
      OGLSystem oglSystem = display.displaySystem.driverData;

      bool result = false;

      //printf("Inside DisplaySize\n");
#if defined(__WIN32__) || defined(USEPBUFFER)
      if(display.alphaBlend)
      {
#if defined(__WIN32__)
         const int attributes[]=
         {
            /*WGL_TEXTURE_FORMAT_ARB, WGL_TEXTURE_RGBA_ARB,
            WGL_TEXTURE_TARGET_ARB, WGL_TEXTURE_2D_ARB, */0
         }; 
         int pixelFormat = 0;
         if(wglChoosePixelFormatARB)
         {
            int valid;
            int numFormats;
            float fAttributes[] = {0,0};
            int iAttributes[] =
            { 
               //WGL_DRAW_TO_BITMAP_ARB, GL_TRUE,
               WGL_DRAW_TO_PBUFFER_ARB,GL_TRUE,
	            WGL_SUPPORT_OPENGL_ARB,GL_TRUE,
	            WGL_ACCELERATION_ARB,WGL_FULL_ACCELERATION_ARB,
	            WGL_COLOR_BITS_ARB,24,
	            WGL_ALPHA_BITS_ARB,8,
	            WGL_DEPTH_BITS_ARB,16,
	            WGL_STENCIL_BITS_ARB,0,
	            WGL_DOUBLE_BUFFER_ARB,GL_FALSE,
	            WGL_SAMPLE_BUFFERS_ARB,GL_TRUE,
	            WGL_SAMPLES_ARB, 4,						// Check For 4x Multisampling
	            0,0
            };
            
            //Log("Found wglChoosePixelFormatARB\n");

            valid = wglChoosePixelFormatARB(oglSystem.hdc,iAttributes,fAttributes,1,&pixelFormat,&numFormats);
            if(!valid || !numFormats)
            {
               //Log("Can't find 4x multi sampling\n");
               iAttributes[19] = 2;
               valid = wglChoosePixelFormatARB(oglSystem.hdc,iAttributes,fAttributes,1,&pixelFormat,&numFormats);
               if(!valid || !numFormats)
               {
                  // Log("Can't find 2x multi sampling\n");
                  iAttributes[16] = 0;
                  iAttributes[17] = 0;
                  valid = wglChoosePixelFormatARB(oglSystem.hdc,iAttributes,fAttributes,1,&pixelFormat,&numFormats);
                  if(!valid || !numFormats)
                  {
                     int iAttributes[] =
                     {
                        WGL_DRAW_TO_PBUFFER_ARB,GL_TRUE,
                        //WGL_DRAW_TO_BITMAP_ARB,GL_TRUE,
                        WGL_SUPPORT_OPENGL_ARB,GL_TRUE,
                        WGL_COLOR_BITS_ARB,24,
                        WGL_ALPHA_BITS_ARB,8,
                        WGL_DEPTH_BITS_ARB,16,
                        0,0
                     };
                     valid = wglChoosePixelFormatARB(oglSystem.hdc,iAttributes,fAttributes,1,&pixelFormat,&numFormats);
                  }
               }
            }
            if(valid && numFormats)
            {
               wglMakeCurrent(null, null);
            }
         }  

         wglMakeCurrent( null, null );
         wglMakeCurrent( oglDisplay.hdc, oglDisplay.glrc );
         if(oglDisplay.hdc && oglDisplay.pBuffer)
            wglReleasePbufferDCARB(oglDisplay.pBuffer, oglDisplay.hdc);

         wglDestroyPbufferARB(oglDisplay.pBuffer);

         if(!useSingleGLContext)
            wglMakeCurrent( null, null );
           
         if(oglDisplay.glrc) 
            wglDeleteContext(oglDisplay.glrc);

         oglDisplay.pBuffer = wglCreatePbufferARB(oglSystem.hdc, pixelFormat, width, height, attributes);
         oglDisplay.hdc = wglGetPbufferDCARB(oglDisplay.pBuffer);
         if((oglDisplay.glrc = wglCreateContext(oglDisplay.hdc)))
         {
            BITMAPINFO * info;
            HDC hdc = GetDC(display.window);

            wglShareLists(oglSystem.glrc, oglDisplay.glrc);
            wglMakeCurrent(oglDisplay.hdc, oglDisplay.glrc);

            //wglQueryPbufferARB(pBuffer, WGL_PBUFFER_WIDTH_ARB, &width);
            //wglQueryPbufferARB(pBuffer, WGL_PBUFFER_HEIGHT_ARB, &height); 
            
            // glDeleteBuffersARB(2, oglDisplay.imageBuffers);

            if((info = (BITMAPINFO *)new0 byte[sizeof(BITMAPINFOHEADER)+sizeof(RGBQUAD)*256]))
            {
               HBITMAP newBitmap;

               if(oglDisplay.memDC) DeleteDC(oglDisplay.memDC);
               oglDisplay.memDC = CreateCompatibleDC(hdc);
               SetMapMode(oglDisplay.memDC, MM_TEXT);
               info->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
               info->bmiHeader.biPlanes = 1;
               info->bmiHeader.biCompression = BI_RGB;
               info->bmiHeader.biBitCount = 32; //(uint16)GetDeviceCaps(hdc, BITSPIXEL);
               info->bmiHeader.biWidth = width;
               info->bmiHeader.biHeight = height;
               newBitmap = CreateDIBSection(hdc, info, DIB_RGB_COLORS, &oglDisplay.picture, null, 0);
               if(newBitmap)
               {
                  SelectObject(oglDisplay.memDC, newBitmap);
                  if(oglDisplay.memBitmap) DeleteObject(oglDisplay.memBitmap);
                  /*
                  {
                     PIXELFORMATDESCRIPTOR pfd = { 0 };
                     pfd.nSize = (short)sizeof(pfd);
                     pfd.nVersion = 1;
                     pfd.dwFlags = PFD_DRAW_TO_BITMAP | PFD_SUPPORT_OPENGL;
                     pfd.iPixelType = PFD_TYPE_RGBA;
                     pfd.cColorBits = 32;
                     //pfd.cAlphaBits = 8;
                     pfd.cDepthBits = 24;
                     pfd.iLayerType = PFD_MAIN_PLANE;

                     oglDisplay.hdc = oglDisplay.memDC;

                     pixelFormat = ChoosePixelFormat(oglSystem.hdc, &pfd);
                     DescribePixelFormat(oglDisplay.hdc, pixelFormat, sizeof(pfd), &pfd);
                     SetPixelFormat(oglDisplay.hdc, pixelFormat, &pfd);

                     oglDisplay.glrc = wglCreateContext(oglDisplay.hdc);
                     wglShareLists(oglSystem.glrc, oglDisplay.glrc);
                     wglMakeCurrent(oglDisplay.hdc, oglDisplay.glrc);
                  }
                  */
                  /*
                  {
                     const int imageSize = width * height * 4;

                     glGenBuffersARB(2, oglDisplay.imageBuffers);

                     glBindBufferARB(GL_PIXEL_PACK_BUFFER_ARB, oglDisplay.imageBuffers[0]);
                     glBufferDataARB(GL_PIXEL_PACK_BUFFER_ARB, imageSize, null, GL_STREAM_READ);
                     // glBindBufferARB(GL_PIXEL_PACK_BUFFER_ARB, oglDisplay.imageBuffers[1]);
                     // glBufferDataARB(GL_PIXEL_PACK_BUFFER_ARB, imageSize / 2, null, GL_STREAM_READ);
                  }
                  */
                  oglDisplay.memBitmap = newBitmap;
                  oglDisplay.stride = width;

                  result = true;
               }
               delete info;
            }
            ReleaseDC(display.window, hdc);
         }
#elif defined(__unix__)
      	int attrib[] =
      	{
      		GLX_DOUBLEBUFFER,  True,
            GLX_DEPTH_SIZE,    1,
      		GLX_RED_SIZE,      8,
      		GLX_GREEN_SIZE,    8,
      		GLX_BLUE_SIZE,     8,
      		GLX_ALPHA_SIZE,    8,
      		GLX_STENCIL_SIZE,  1,
      		//GLX_DEPTH_SIZE,    24,
      		GLX_RENDER_TYPE,   GLX_RGBA_BIT,
      		GLX_DRAWABLE_TYPE, GLX_PBUFFER_BIT | GLX_WINDOW_BIT,
      		None
      	};

      	int PBattrib[] =
      	{
      		GLX_PBUFFER_WIDTH,   width,
      		GLX_PBUFFER_HEIGHT,  height,
      		GLX_LARGEST_PBUFFER, False,
            None
      	};

      	// choose a pixel format that meets our minimum requirements
      	int count = 0;

      	GLXFBConfig *config = glXChooseFBConfig(xGlobalDisplay, DefaultScreen(xGlobalDisplay), attrib, &count);
         if(config)
         {
            if(oglDisplay.pixmap)
            {
               XFreePixmap(xGlobalDisplay, oglDisplay.pixmap);
               oglDisplay.pixmap = None;
            }
            if(oglDisplay.shapePixmap)
            {
               XFreePixmap(xGlobalDisplay, oglDisplay.shapePixmap);
               oglDisplay.shapePixmap = None;
            }

            // Free Shared Memory Pixmap
            if(oglDisplay.image)
            {
               if(oglDisplay.shminfoShape.shmid != -1)
               {
                  XShmDetach(xGlobalDisplay, &oglDisplay.shminfo);
                  if(oglDisplay.shminfo.shmaddr != (void *)-1)
                     shmdt(oglDisplay.shminfo.shmaddr);
                  shmctl(oglDisplay.shminfo.shmid, IPC_RMID, 0);
               }
               XDestroyImage(oglDisplay.image);
               oglDisplay.image = None;
            }
            if(oglDisplay.shapeImage)
            {
               if(oglDisplay.shminfoShape.shmid != -1)
               {
                  XShmDetach(xGlobalDisplay, &oglDisplay.shminfoShape);
                  if(oglDisplay.shminfoShape.shmaddr != (void *)-1)
                     shmdt(oglDisplay.shminfoShape.shmaddr);
                  shmctl(oglDisplay.shminfoShape.shmid, IPC_RMID, 0);
               }                  
               XDestroyImage(oglDisplay.shapeImage);
               oglDisplay.shapeImage = None;
            }

            if(oglDisplay.windowPicture)
               XRenderFreePicture(xGlobalDisplay, oglDisplay.windowPicture);
            if(oglDisplay.pixmapPicture)
               XRenderFreePicture(xGlobalDisplay, oglDisplay.pixmapPicture);

            if(oglDisplay.pixmap)
               XFreePixmap(xGlobalDisplay, oglDisplay.pixmap);

            if(oglDisplay.glContext)
         	  glXDestroyContext(xGlobalDisplay, oglDisplay.glContext);
            if(oglDisplay.pBuffer)
               glXDestroyPbuffer(xGlobalDisplay, oglDisplay.pBuffer);

         	oglDisplay.pBuffer = glXCreatePbuffer(xGlobalDisplay, config[0], PBattrib);
            if(oglDisplay.pBuffer)
            {
         	   oglDisplay.glContext = glXCreateNewContext(xGlobalDisplay, config[0], GLX_RGBA_TYPE, oglSystem.glContext, True);
               if(oglDisplay.glContext)
               {
                  glXMakeCurrent(xGlobalDisplay, None, null);
                  glXMakeCurrent(xGlobalDisplay, (int)display.window, oglDisplay.glContext);

                  // Initialize Shared Memory Pixmap
                  oglDisplay.image = XShmCreateImage(xGlobalDisplay, DefaultVisual(xGlobalDisplay, DefaultScreen(xGlobalDisplay)), 32, 
                     ZPixmap, null, &oglDisplay.shminfo, width, height);
                  if(oglDisplay.image)
                  {
                     oglDisplay.shminfo.shmid = shmget(IPC_PRIVATE, 
                        oglDisplay.image->bytes_per_line * oglDisplay.image->height, IPC_CREAT|0777);
                     if(oglDisplay.shminfo.shmid != -1)
                     {
                        oglDisplay.shminfo.shmaddr = shmat(oglDisplay.shminfo.shmid, 0, 0);
                        if(oglDisplay.shminfo.shmaddr != (void *)-1)
                        {
                           oglDisplay.shminfo.readOnly = False;
                           if(XShmAttach(xGlobalDisplay, &oglDisplay.shminfo))
                           {
                              oglDisplay.pixmap = XShmCreatePixmap(xGlobalDisplay, (X11Window)display.window, oglDisplay.shminfo.shmaddr, 
                                 &oglDisplay.shminfo, width, height, 32);

                              // Initialize Shared Memory Shape Pixmap
                              oglDisplay.shapeImage = XShmCreateImage(xGlobalDisplay, DefaultVisual(xGlobalDisplay, DefaultScreen(xGlobalDisplay)), 1, 
                                 ZPixmap, null, &oglDisplay.shminfoShape, width, height);
                              if(oglDisplay.shapeImage)
                              {
                                 oglDisplay.shminfoShape.shmid = shmget(IPC_PRIVATE, 
                                    oglDisplay.shapeImage->bytes_per_line * oglDisplay.shapeImage->height, IPC_CREAT|0777);
                                 if(oglDisplay.shminfoShape.shmid != -1)
                                 {
                                    oglDisplay.shminfoShape.shmaddr = shmat(oglDisplay.shminfoShape.shmid, 0, 0);
                                    if(oglDisplay.shminfoShape.shmaddr != (void *)-1)
                                    {
                                       oglDisplay.shminfoShape.readOnly = False;
                                       if(XShmAttach(xGlobalDisplay, &oglDisplay.shminfoShape))
                                       {
                                          oglDisplay.shapePixmap = XShmCreatePixmap(xGlobalDisplay, (X11Window)display.window, oglDisplay.shminfoShape.shmaddr, 
                                             &oglDisplay.shminfoShape, width, height, 1);
                                          //oglDisplay.shapePixmap = XCreatePixmap(xGlobalDisplay, (X11Window)display.window, width, height, 1);

                                          {
                                             XRenderPictureAttributes attributes = { 0 };
                                             XRenderPictFormat * format = XRenderFindStandardFormat(xGlobalDisplay, /*PictStandardRGB24*/ PictStandardARGB32);
                                             #if !defined(__APPLE__) && !defined(__OLDX__)
                                             attributes.repeat = RepeatNormal;
                                             #else
                                             attributes.repeat = 1;
                                             #endif
                                             oglDisplay.pixmapPicture = XRenderCreatePicture(xGlobalDisplay, oglDisplay.pixmap, format, CPRepeat, &attributes);
                                             oglDisplay.windowPicture = XRenderCreatePicture(xGlobalDisplay, (X11Window)display.window, format, 0, &attributes);
                                             oglDisplay.shapePicture = XRenderCreatePicture(xGlobalDisplay, oglDisplay.shapePixmap, 
                                                XRenderFindStandardFormat(xGlobalDisplay, PictStandardA1), 0, &attributes);
                                          }  

                                          oglDisplay.picture = oglDisplay.shminfo.shmaddr;
                                          oglDisplay.stride = oglDisplay.image->bytes_per_line / 4;

                                          result = true;
                                       }
                                    }
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
            XFree(config);
         }
#endif
         CreateDisplay(display);
#if defined(__WIN32__)
         wglMakeCurrent(oglDisplay.hdc, oglDisplay.glrc);
#elif defined(__unix__)
         glXMakeCurrent(xGlobalDisplay, (int)display.window, oglDisplay.glContext);
#endif
      }
      else
#endif
         result = true;
      if(!result && display.alphaBlend)
      {
         printf("Alpha blending windows not supported on this display\n");
      }
      if(!result)
         return false;
         
      result = false;           

      glViewport(0,0,width,height);
      glLoadIdentity();
      glOrtho(0,width,height,0,0.0,1.0);
      displayWidth = display.width = width;
      displayHeight = display.height = height;

      if(!oglDisplay.flippingBuffer || oglDisplay.flipBufW < width || oglDisplay.flipBufH < height)
      {
         oglDisplay.flipBufW = width;
         oglDisplay.flipBufH = height;
         oglDisplay.flippingBuffer = renew oglDisplay.flippingBuffer ColorAlpha [width * height];
      }
      if(oglDisplay.flippingBuffer)
         result = true;
         
      return result;
   }

   void DisplayPosition(Display display, int x, int y)
   {
      OGLDisplay oglDisplay = display.driverData;

      oglDisplay.x = x;
      oglDisplay.y = y;
   }

   void SetPalette(Display display, ColorAlpha * palette, bool colorMatch)
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
      OGLDisplay oglDisplay = display.driverData;
      //Logf("DisplayScreen\n");

      glFlush();
      glFinish();
#if defined(__WIN32__) || defined(USEPBUFFER)
      if(display.alphaBlend)
      {
         glPixelStorei(GL_PACK_ALIGNMENT, 4);
         glPixelStorei(GL_PACK_ROW_LENGTH, oglDisplay.stride);
         glPixelStorei(GL_PACK_SKIP_ROWS, 0);
         glPixelStorei(GL_PACK_SKIP_PIXELS, 0);
         glReadPixels(0,0,display.width,display.height,GL_BGRA_EXT,GL_UNSIGNED_BYTE, oglDisplay.picture);

         {
#if defined(__WIN32__)
            HDC hdc = GetDC(0);
            POINT point = { oglDisplay.x, oglDisplay.y};
            POINT srcPoint = { 0, 0 };
            BLENDFUNCTION blend = { 0 };
            SIZE size;
            size.cx = display.width;
            size.cy = display.height;
            blend.BlendOp = AC_SRC_OVER;
            blend.BlendFlags = 0;
            blend.SourceConstantAlpha = 255;
            blend.AlphaFormat = AC_SRC_ALPHA;

            /*
            // Process partial images.  Mapping the buffer waits for
            // outstanding DMA transfers into the buffer to finish.
            glBindBufferARB(GL_PIXEL_PACK_BUFFER_ARB, oglDisplay.imageBuffers[0]);
            oglDisplay.pboMemory1 = (byte *)glMapBufferARB(GL_PIXEL_PACK_BUFFER_ARB, GL_READ_ONLY);
           
            // glBindBufferARB(GL_PIXEL_PACK_BUFFER_ARB, oglDisplay.imageBuffers[1]);
            // oglDisplay.pboMemory2 = (byte *)glMapBufferARB(GL_PIXEL_PACK_BUFFER_ARB,GL_READ_ONLY);

           
            memcpy(oglDisplay.picture, oglDisplay.pboMemory1, display.width * display.height * 4);
            //memcpy(oglDisplay.picture + display.width * display.height * 4 / 2, oglDisplay.pboMemory2, display.width * display.height * 4/ 2);
            */
            
            UpdateLayeredWindow(display.window, hdc, &point, &size, oglDisplay.memDC, &srcPoint, 0, &blend, ULW_ALPHA);
            /*

            // Unmap the image buffers
            glBindBufferARB(GL_PIXEL_PACK_BUFFER_ARB, oglDisplay.imageBuffers[0]);
            glUnmapBufferARB(GL_PIXEL_PACK_BUFFER_ARB);

            // glBindBufferARB(GL_PIXEL_PACK_BUFFER_ARB, oglDisplay.imageBuffers[1]);
            // glUnmapBufferARB(GL_PIXEL_PACK_BUFFER_ARB);
           
            // Bind two different buffer objects and start the glReadPixels
            // asynchronously. Each call will return directly after
            // starting the DMA transfer.
            glBindBufferARB(GL_PIXEL_PACK_BUFFER_ARB, oglDisplay.imageBuffers[0]);
            glReadPixels(0, 0, display.width, display.height, GL_BGRA, GL_UNSIGNED_BYTE, 0);

            // glBindBufferARB(GL_PIXEL_PACK_BUFFER_ARB, oglDisplay.imageBuffers[1]);
            // glReadPixels(0, display.height/2, display.width, display.height/2, GL_BGRA, GL_UNSIGNED_BYTE, 0);
            */

            ReleaseDC(0, hdc);
#elif defined(__unix__)
            XTransform transform = 
            {
               {
                  { (int)(1.0f * (1<<16)), (int)(0.0f * (1<<16)),  (int)(0 * (1 << 16)) },
                  { (int)(0.0f),           (int)(-1.0f * (1<<16)), (int)(0 * (1<<16)) },
                  { (int)(0.0f * (1<<16)), (int)(0.0f * (1<<16)),  (int)(1.0f * (1<<16)) }
               }
            };
            XRenderSetPictureTransform(xGlobalDisplay, oglDisplay.pixmapPicture, &transform);
            XRenderComposite(xGlobalDisplay, PictOpSrc, oglDisplay.pixmapPicture, None, oglDisplay.shapePicture, 0, 0, 0, 0, 0, 0, display.width, display.height);
            XRenderComposite(xGlobalDisplay, PictOpSrc, oglDisplay.pixmapPicture, None, oglDisplay.windowPicture, 0, 0, 0, 0, 0, 0, display.width, display.height);
            #if !defined(__APPLE__) && !defined(__OLDX__)
            XShapeCombineMask(xGlobalDisplay, (uint)display.window, ShapeInput, 0, 0, oglDisplay.shapePixmap, ShapeSet);
            #else
            XShapeCombineMask(xGlobalDisplay, display.window, 2, 0, 0, oglDisplay.shapePixmap, ShapeSet);
            #endif
            XFlush(xGlobalDisplay);
#endif
         }
      } 
      else
#endif
      {
#if defined(__WIN32__)
         //wglSwapLayerBuffers(oglDisplay.hdc,WGL_SWAP_MAIN_PLANE); 
         SwapBuffers(oglDisplay.hdc);
#elif defined(__unix__)
         glXSwapBuffers(xGlobalDisplay, (int)display.window);
#endif
      }
      //Logf("Out of DisplayScreen\n");
   }

   void FreeBitmap(DisplaySystem displaySystem, Bitmap bitmap)
   {
      glDeleteTextures(1, (int *)&bitmap.driverData);
      bitmap.driverData = 0;

      bitmap.driver = ((subclass(DisplayDriver))class(LFBDisplayDriver));
   }

   bool AllocateBitmap(DisplaySystem displaySystem, Bitmap bitmap, int width, int height, int stride, PixelFormat format, bool allocatePalette)
   {
      bool result = false;
      Bitmap mipMap { };
      int glBitmap = -1;
      
      uint w = pow2i(Min(width, 1024)), h = pow2i(Min(height, 1024));
      //uint w = pow2i(Min(width, 2048)), h = pow2i(Min(height, 2048));
      //uint w = pow2i(Min(width, 512)), h = pow2i(Min(height, 512));

      glGenTextures(1, &glBitmap);
      glBindTexture(GL_TEXTURE_2D, glBitmap);

      glPixelStorei( GL_UNPACK_ALIGNMENT, 1 );

      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

      glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);

      mipMap.Allocate(null, w, h, w, pixelFormatRGBA, false);

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
      OGLSystem oglSystem = displaySystem.driverData;

      // Pre process the bitmap... First make it 32 bit
      if(/*bitmap.pixelFormat == pixelFormatRGBA || */bitmap.Convert(null, pixelFormat888, null))
      {
         int c, level;
         uint w = pow2i(Min(bitmap.width, 1024)), h = pow2i(Min(bitmap.height, 1024));
         //uint w = pow2i(Min(bitmap.width, 512)), h = pow2i(Min(bitmap.height, 512));
         int glBitmap = -1;

         // Switch ARGB to RGBA
         //if(bitmap.format != pixelFormatRGBA)
         {
            for(c=0; c<bitmap.size; c++)
            {
               // ((ColorRGBA *)bitmap.picture)[c] = ((ColorAlpha *)bitmap.picture)[c];
               // TODO: 
               ColorAlpha color = ((ColorAlpha *)bitmap.picture)[c];
               ((ColorRGBA *)bitmap.picture)[c] = ColorRGBA { color.color.r, color.color.g, color.color.b, color.a };
            }
         }
         bitmap.pixelFormat = pixelFormat888;

         glGetError();
         glGenTextures(1, &glBitmap);
         if(glBitmap == -1)
         {
            int error = glGetError();
            return false;
            //Print("");
         }

         glBindTexture(GL_TEXTURE_2D, glBitmap);
         glPixelStorei( GL_UNPACK_ALIGNMENT, 1 );

         glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
         glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, mipMaps ? GL_LINEAR_MIPMAP_LINEAR : GL_LINEAR);
         //glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

         //glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
         //glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);

         glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
         glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

         glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);

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
               //int width = 0;
               glGetError();
               glTexImage2D(GL_TEXTURE_2D, level, GL_RGBA8, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, mipMap.picture);
               //printf("Calling glTexImage2D\n");
               //glGetTexLevelParameteriv(GL_TEXTURE_2D, level, GL_TEXTURE_WIDTH, &width);
               //printf("width = %d (Should be %d, %d)\n", width, w, h);
               if((error = glGetError()))
               {
                  //Logf("OpenGL Bitmap MakeDD error: %d...\n", error);
                  //printf("OpenGL Bitmap MakeDD error: %d...\n", error);
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
         else if(oglSystem.loadingFont)
         {
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
            oglSystem.loadingFont = false;
         }
      }
      return result;
   }

   void ReleaseSurface(Display display, Surface surface)
   {
      glDisable(GL_SCISSOR_TEST);
      delete surface.driverData;
      surface.driverData = null;
   }

   bool GetBitmapSurface(DisplaySystem displaySystem, Surface surface, Bitmap bitmap, int x, int y, Box clip)
   {
      return false;
   }

   bool GetSurface(Display display, Surface surface, int x,int y, Box clip)
   {
      bool result = false;
      OGLSurface oglSurface = surface.driverData = OGLSurface { };

      //Logf("GetSurface\n");

      if(oglSurface)
      {
         if(displayWidth != display.width || displayHeight != display.height)
         {
            displayWidth = display.width;
            displayHeight = display.height;

            glViewport(0,0,display.width,display.height);
            glLoadIdentity();
            glOrtho(0,display.width,display.height,0,0.0,1.0);
         }

         surface.offset.x = x;
         surface.offset.y = y;
         surface.unclippedBox = surface.box = clip;
         oglSurface.bitmapMult[0] = 1;
         oglSurface.bitmapMult[1] = 1;
         oglSurface.bitmapMult[2] = 1;
         oglSurface.bitmapMult[3] = 1;

         glEnable(GL_SCISSOR_TEST);
         glScissor(
            x+clip.left,
            (display.height) -(y+clip.bottom)-1,
            clip.right-clip.left+1,
            clip.bottom-clip.top+1);
         result = true;
      }
      return result;
   }

   void Clip(Display display, Surface surface, Box clip)
   {
      Box box;

      //Logf("Clip\n");

      if(clip != null)
      {
         box = clip;
         box.Clip(surface.unclippedBox);
         surface.box = box;
      }
      else
         box = surface.box = surface.unclippedBox;
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
      OGLDisplay oglDisplay = display.driverData;
      ColorAlpha * flippingBuffer = oglDisplay.flippingBuffer;
      
      if(oglDisplay.flippingBuffer)
      {
         if(bitmap.pixelFormat != pixelFormat888 || bitmap.width < w || bitmap.height < h)
         {
            bitmap.Free();
            bitmap.Allocate(null, w,h,w, pixelFormat888, false);
         }
         if(bitmap)
         {
            uint row;

            glPixelStorei(GL_PACK_ALIGNMENT, 4);
            glPixelStorei(GL_PACK_ROW_LENGTH, bitmap.stride);
            glPixelStorei(GL_PACK_SKIP_ROWS, 0);
            glPixelStorei(GL_PACK_SKIP_PIXELS, 0);
            glReadPixels(x,display.height-h-y,w,h,GL_BGRA_EXT,GL_UNSIGNED_BYTE, flippingBuffer);

            // Need a flip...
            for(row = 0; row<h; row++)
               CopyBytesBy4(((ColorAlpha *)bitmap.picture) + row * w, ((ColorAlpha *)flippingBuffer) + (h-row-1) * w, w);
            result = true;
         }
      }
      return result;
   }

   void SetForeground(Display display, Surface surface, ColorAlpha color)
   {
      OGLSurface oglSurface = surface.driverData;

      //Logf("SetForeground\n");

      oglSurface.foreground[0] = color.color.r/255.0f;
      oglSurface.foreground[1] = color.color.g/255.0f;
      oglSurface.foreground[2] = color.color.b/255.0f;
      //oglSurface.foreground[3] = 1.0f;
      oglSurface.foreground[3] = color.a/255.0f;

      //if(!oglSurface.foreground[3])printf("bug");
   }

   void SetBackground(Display display, Surface surface, ColorAlpha color)
   {
      OGLSurface oglSurface = surface.driverData;

      //Logf("SetBackground\n");

      oglSurface.background[0] = color.color.r/255.0f;
      oglSurface.background[1] = color.color.g/255.0f;
      oglSurface.background[2] = color.color.b/255.0f;
      //oglSurface.background[3] = 1.0;
      oglSurface.background[3] = color.a/255.0f;
   }

   void SetBlitTint(Display display, Surface surface, ColorAlpha color)
   {
      OGLSurface oglSurface = surface.driverData;

      oglSurface.bitmapMult[0] = color.color.r/255.0f;
      oglSurface.bitmapMult[1] = color.color.g/255.0f;
      oglSurface.bitmapMult[2] = color.color.b/255.0f;
      oglSurface.bitmapMult[3] = color.a/255.0f;
   }

   ColorAlpha GetPixel(Display display, Surface surface,int x,int y)
   {
      return 0;
   }

   void PutPixel(Display display, Surface surface,int x,int y)
   {
      OGLSurface oglSurface = surface.driverData;

      //Logf("PutPixel\n");

      glColor4fv(oglSurface.foreground);
      glBegin(GL_POINTS);
      // glVertex2i(x+surface.offset.x, y+surface.offset.y);
      glVertex2f(x+surface.offset.x + 0.5f, y+surface.offset.y + 0.5f);
       
      glEnd();
   }

   void DrawLine(Display display, Surface surface, int x1, int y1, int x2, int y2)
   {
      OGLSurface oglSurface = surface.driverData;
      if(x1 == x2) { y2++; y1--; }
      else if(y1 == y2) { x2++; x1--; }

      //Logf("Line\n");

      glColor4fv(oglSurface.foreground);
      glBegin(GL_LINES);
      /*
      glVertex2i(x1+surface.offset.x, y1+surface.offset.y);
      glVertex2i(x2+surface.offset.x, y2+surface.offset.y);
      */
      glVertex2f(x1+surface.offset.x + 0.5f, y1+surface.offset.y + 0.5f);
      glVertex2f(x2+surface.offset.x + 0.5f, y2+surface.offset.y + 0.5f);
      
      glEnd();
   }

   void Rectangle(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      OGLSurface oglSurface = surface.driverData;

      //Logf("Rectangle\n");

      glColor4fv(oglSurface.foreground);
      glBegin(GL_LINE_LOOP);
      /*
      glVertex2i(x1+surface.offset.x, y1+surface.offset.y);
      glVertex2i(x1+surface.offset.x, y2+surface.offset.y);
      glVertex2i(x2+surface.offset.x, y2+surface.offset.y);
      glVertex2i(x2+surface.offset.x, y1+surface.offset.y);
      */
      glVertex2f(x1+surface.offset.x + 0.5f, y1+surface.offset.y + 0.5f);
      glVertex2f(x1+surface.offset.x + 0.5f, y2+surface.offset.y + 0.5f);
      glVertex2f(x2+surface.offset.x + 0.5f, y2+surface.offset.y + 0.5f);
      glVertex2f(x2+surface.offset.x + 0.5f, y1+surface.offset.y + 0.5f);
      
      glEnd();
   }

   void Area(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      OGLSurface oglSurface = surface.driverData;
      //Logf("Area\n");

      glColor4fv(oglSurface.background);
      glRecti(x1+surface.offset.x, y1+surface.offset.y,
              x2+surface.offset.x + 1, y2+surface.offset.y + 1);
              
      /*
      glRectf(x1+surface.offset.x, y1+surface.offset.y,
              x2+surface.offset.x + 1, y2+surface.offset.y + 1);
      */
   }

   void Clear(Display display, Surface surface, ClearType type)
   {
      OGLDisplay oglDisplay = display.driverData;
      OGLSurface oglSurface = surface.driverData;

      //Logf("Clear\n");
      if(type != depthBuffer)
         glClearColor(oglSurface.background[0], oglSurface.background[1], oglSurface.background[2], oglSurface.background[3]);
      if(type != colorBuffer && !oglDisplay.depthWrite)
      {
         glDepthMask((byte)bool::true);
      }
      glClear(((type != depthBuffer) ? GL_COLOR_BUFFER_BIT : 0) |
              ((type != colorBuffer) ? GL_DEPTH_BUFFER_BIT : 0));
      if(type != colorBuffer && !oglDisplay.depthWrite)
      {
         glDepthMask((byte)bool::false);
      }
   }

   bool ConvertBitmap(DisplaySystem displaySystem, Bitmap bitmap, PixelFormat format, ColorAlpha * palette)
   {
      return true;
   }

   void Blit(Display display, Surface surface, Bitmap bitmap, int dx, int dy, int sx, int sy, int w, int h)
   {
      OGLSurface oglSurface = surface.driverData;

#if !defined(__OLDX__)
         // WHY DO WE HAVE GL_ONE HERE ?
         /*if(glBlendFuncSeparate && !oglSurface.writingText)
            glBlendFuncSeparate(GL_ONE, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);*/
#endif

      if(!oglSurface.writingText)
      {
         // glTranslatef(-0.375f, -0.375f, 0.0f);
         glEnable(GL_TEXTURE_2D);
         glColor4fv(oglSurface.bitmapMult);
      }
      else if(oglSurface.xOffset)
         glTranslatef(oglSurface.xOffset / 64.0f/*-0.375f*/, 0.0f, 0.0f);
         
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
         /*
         glTexCoord2f((float)sx / bitmap.width, (float)sy/ bitmap.height);
         glVertex2i(dx+surface.offset.x, dy+surface.offset.y);
         glTexCoord2f((float)(sx+w)/ bitmap.width, (float)sy/ bitmap.height);
         glVertex2i(dx+w+surface.offset.x, dy+surface.offset.y);
         glTexCoord2f((float)(sx+w) / bitmap.width, (float)(sy+h)/ bitmap.height);
         glVertex2i(dx+w+surface.offset.x, dy+h+surface.offset.y);
         glTexCoord2f((float)sx/ bitmap.width, (float)(sy+h)/ bitmap.height);
         glVertex2i(dx+surface.offset.x, dy+h+surface.offset.y);
         */

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

      if(!oglSurface.writingText)
      {
         glDisable(GL_TEXTURE_2D);

         //glTranslatef(0.375f, 0.375f, 0.0f);
      }
      else if(oglSurface.xOffset)
         glTranslatef(-oglSurface.xOffset / 64.0f/*+0.375f*/, 0.0f, 0.0f);

#if !defined(__OLDX__)
         /*if(glBlendFuncSeparate && !oglSurface.writingText)
            glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);*/
#endif
   }

   void Stretch(Display display, Surface surface, Bitmap bitmap, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      OGLSurface oglSurface = surface.driverData;

      //glTranslatef(-0.375f, -0.375f, 0.0f);

      //Logf("Stretch\n");

#if !defined(__OLDX__)
      /*if(glBlendFuncSeparate)
         glBlendFuncSeparate(GL_ONE, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);*/
#endif

      glEnable(GL_TEXTURE_2D);
      glBindTexture(GL_TEXTURE_2D, (uint)bitmap.driverData);

      glColor4fv(oglSurface.bitmapMult);

      glBegin(GL_QUADS);

      if(h < 0)
      {
         glTexCoord2f((float)(sx)/ bitmap.width, (float)(sy+sh)/ bitmap.height);
         glVertex2i(dx+surface.offset.x, dy+surface.offset.y);
      
         glTexCoord2f((float)(sx+sw) / bitmap.width, (float)(sy+sh)/ bitmap.height);
         glVertex2i(dx+w+surface.offset.x, dy+surface.offset.y);
      
         glTexCoord2f((float)(sx+sw)/ bitmap.width, (float)(sy)/ bitmap.height);
         glVertex2i(dx+w+surface.offset.x, dy-h+surface.offset.y);
      
         glTexCoord2f((float)(sx) / bitmap.width, (float)(sy)/ bitmap.height);
         glVertex2i(dx+surface.offset.x, dy-h+surface.offset.y);
      }
      else
      {
         glTexCoord2f((float)(sx) / bitmap.width, (float)(sy)/ bitmap.height);
         glVertex2i(dx+surface.offset.x, dy+surface.offset.y);
      
         glTexCoord2f((float)(sx+sw)/ bitmap.width, (float)(sy)/ bitmap.height);
         glVertex2i(dx+w+surface.offset.x, dy+surface.offset.y);
      
         glTexCoord2f((float)(sx+sw) / bitmap.width, (float)(sy+sh)/ bitmap.height);
         glVertex2i(dx+w+surface.offset.x, dy+h+surface.offset.y);
      
         glTexCoord2f((float)(sx)/ bitmap.width, (float)(sy+sh)/ bitmap.height);
         glVertex2i(dx+surface.offset.x, dy+h+surface.offset.y);
      }

      glEnd();

      glDisable(GL_TEXTURE_2D);

      //glTranslatef(0.375f, 0.375f, 0.0f);
#if !defined(__OLDX__)
      /*if(glBlendFuncSeparate)
         glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);*/
#endif

   }

   void Filter(Display display, Surface surface, Bitmap bitmap, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      Stretch(display, surface, bitmap, dx, dy, sx, sy, w, h, sw, sh);
   }

   void StretchDI(Display display, Surface surface, Bitmap bitmap, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      float s2dw,s2dh,d2sw,d2sh;
      bool flipX = false, flipY = false;

      //Logf("StretchDI\n");

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
         glPixelStorei(GL_UNPACK_ROW_LENGTH, bitmap.stride);
         glPixelStorei(GL_UNPACK_SKIP_PIXELS, sx);
         glPixelStorei(GL_UNPACK_SKIP_ROWS, sy);
         glRasterPos2d(dx,dy);
         //glPixelZoom(flipX ? -s2dw : s2dw, flipY ? s2dh : -s2dh);
         glPixelZoom(s2dw, -s2dh);
         glDrawPixels(sw,sh,GL_BGRA_EXT,GL_UNSIGNED_BYTE, bitmap.picture);
         glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
         glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
      }
   }

   void BlitDI(Display display, Surface surface, Bitmap bitmap, int dx, int dy, int sx, int sy, int w, int h)
   {
      //Logf("BlitDI\n");

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
         glPixelStorei(GL_UNPACK_ROW_LENGTH, bitmap.stride);
         glPixelStorei(GL_UNPACK_SKIP_PIXELS, sx);
         glPixelStorei(GL_UNPACK_SKIP_ROWS, sy);
         glRasterPos2d(dx,dy);
         glPixelZoom(1,-1);
         glDrawPixels(w,h,GL_BGRA_EXT,GL_UNSIGNED_BYTE, bitmap.picture);
         glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
         glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
      }
   }

   void FilterDI(Display display, Surface surface, Bitmap bitmap, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      StretchDI(display, surface, bitmap, dx, dy, sx, sy, w, h, sw, sh);
   }

   void UnloadFont(DisplaySystem displaySystem, Font font)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).UnloadFont(displaySystem, font);
   }

   Font LoadFont(DisplaySystem displaySystem, char * faceName, float size, FontFlags flags)
   {
      Font font;
      OGLSystem oglSystem = displaySystem.driverData;
      oglSystem.loadingFont = true;
      font = ((subclass(DisplayDriver))class(LFBDisplayDriver)).LoadFont(displaySystem, faceName, size, flags);
      return font;
   }

   void FontExtent(DisplaySystem displaySystem, Font font, char * text, int len, int * width, int * height)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).FontExtent(displaySystem, font, text, len, width, height);
   }

   void WriteText(Display display, Surface surface, int x, int y, char * text, int len)
   {
      OGLSurface oglSurface = surface.driverData;
      OGLSystem oglSystem = display.displaySystem.driverData;
      oglSystem.loadingFont = true;

      //glTranslatef(-0.375f, -0.375f, 0.0f);

      //Logf("Blit\n");

      if(surface.textOpacity)
      {
         int w, h;
         FontExtent(display.displaySystem, surface.font, text, len, &w, &h);
         display.displaySystem.driver.Area(display, surface,x,y,x+w-1,y+h-1);
      }

      oglSurface.writingText = true;

      glEnable(GL_TEXTURE_2D);
      glColor4fv(oglSurface.foreground);

      ((subclass(DisplayDriver))class(LFBDisplayDriver)).WriteText(display, surface, x, y, text, len);
      oglSurface.writingText = false;
      oglSystem.loadingFont = false;

      glDisable(GL_TEXTURE_2D);

      //glTranslatef(0.375f, 0.375f, 0.0f);
   }

   void TextFont(Display display, Surface surface, Font font)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).TextFont(display, surface, font);
   }

   void TextOpacity(Display display, Surface surface, bool opaque)
   {
      OGLSurface oglSurface = surface.driverData;
      oglSurface.opaqueText = opaque;
   }

   void TextExtent(Display display, Surface surface, char * text, int len, int * width, int * height)
   {
      OGLSurface oglSurface = surface.driverData;
      OGLSystem oglSystem = display.displaySystem.driverData;
      oglSystem.loadingFont = true;
      FontExtent(display.displaySystem, oglSurface.font, text, len, width, height);
      oglSystem.loadingFont = false;
   }

   void DrawingChar(Display display, Surface surface, char character)
   {

   }

   void LineStipple(Display display, Surface surface, uint32 stipple)
   {
      //Logf("Stipple\n");

      if(stipple)
      {
         glLineStipple(1, (uint16)stipple);
         glEnable(GL_LINE_STIPPLE);
      }
      else
         glDisable(GL_LINE_STIPPLE);
   }

   void SetRenderState(Display display, RenderState state, uint value)
   {
      OGLDisplay oglDisplay = display.driverData;
      //Logf("RenderState\n");

      switch(state)
      {
         case antiAlias:
            if(value)
               glEnable(GL_MULTISAMPLE_ARB);
            else
               glDisable(GL_MULTISAMPLE_ARB);
            break;
         case fillMode:
            glPolygonMode(GL_FRONT_AND_BACK, ((FillModeValue)value == solid) ? GL_FILL : GL_LINE);
            break;
         case depthTest:
            if(value) glEnable(GL_DEPTH_TEST); else glDisable(GL_DEPTH_TEST);
            break;
         case depthWrite:
            if(value) glDepthMask((byte)bool::true); else glDepthMask((byte)bool::false);
            oglDisplay.depthWrite = value;
            break;
         case fogColor:
         {
            float color[4] = { ((Color)value).r/255.0f, ((Color)value).g/255.0f, ((Color)value).b/255.0f, 1.0f };
            glFogfv(GL_FOG_COLOR, (float *)&color);
            break;
         }
         case fogDensity:
            glFogf(GL_FOG_DENSITY, *(float *)(void *)&value);
            break;
         case blend:
            if(value) glEnable(GL_BLEND); else glDisable(GL_BLEND);
            break;
         case ambient:
         {
            float ambient[4] = { ((Color)value).r/255.0f, ((Color)value).g/255.0f, ((Color)value).b/255.0f, 1.0f };
            glLightModelfv(GL_LIGHT_MODEL_AMBIENT, ambient);
            break;
         }
         case alphaWrite:
         {
            if(value) glColorMask(1,1,1,1); else glColorMask(1,1,1,0);
            break;
         }
         case vSync:
         {
#if defined(__WIN32__)
            wglSwapIntervalEXT(value ? 1 : 0);
#endif
            break;
         }
      }
   }

   void SetLight(Display display, int id, Light light)
   {
      //Logf("SetLight\n");

      if(light != null)
      {
         Object lightObject = light.lightObject;
         float position[4] = { 0, 0, 0, 0 };
         float color[4] = { 0, 0, 0, 1 };

         glEnable(GL_LIGHT0 + id);
         /*
         glLightfv(GL_LIGHT0 + id, GL_DIFFUSE, (float *)&light.diffuse);
         glLightfv(GL_LIGHT0 + id, GL_AMBIENT, (float *)&light.ambient);
         glLightfv(GL_LIGHT0 + id, GL_SPECULAR,(float *)&light.specular);
         */

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

            /*
            // Display Light Position
            glDisable(GL_LIGHTING);
            glDisable(GL_DEPTH_TEST);
            glColor3f(1,1,1);
            glPointSize(10);
            glBegin(GL_POINTS);
            glVertex3fv(position);
            glEnd();
            glEnable(GL_DEPTH_TEST);
            glEnable(GL_LIGHTING);
                     

            // Display Target
            if(lightObject.flags.root || !lightObject.parent)
            {
               positionVector = light.target.transform.position;
               positionVector.Subtract(positionVector, display.camera.cPosition);
            }
            else
            {
               positionVector.MultMatrix(light.target.transform.position, 
                  lightObject.light.target.parent.matrix);
               positionVector.Subtract(positionVector, display.camera.cPosition);
            }

            position[0] = positionVector.x;
            position[1] = positionVector.y;
            position[2] = positionVector.z;

            glDisable(GL_LIGHTING);
            glDisable(GL_DEPTH_TEST);
            glColor3f(1,1,0);
            glPointSize(10);
            glBegin(GL_POINTS);
            glVertex3fv(position);
            glEnd();
            glEnable(GL_DEPTH_TEST);
            glEnable(GL_LIGHTING);
            */

            if(light.flags.attenuation)
            {
               glLightf(GL_LIGHT0 + id, GL_CONSTANT_ATTENUATION, light.Kc);
               glLightf(GL_LIGHT0 + id, GL_LINEAR_ATTENUATION, light.Kl);
               glLightf(GL_LIGHT0 + id, GL_QUADRATIC_ATTENUATION, light.Kq);
            }

            if(light.flags.spot)
            {
               float exponent = 0;
               #define MAXLIGHT  0.9
               float direction[4] = { (float)light.direction.x, (float)light.direction.y, (float)light.direction.z, 1 };
               // Figure out exponent out of the hot spot
               exponent = (float)(log(MAXLIGHT) / log(cos((light.hotSpot / 2))));

               glLightfv(GL_LIGHT0 + id, GL_SPOT_DIRECTION, direction);
               glLightf(GL_LIGHT0 + id, GL_SPOT_CUTOFF, (float)(light.fallOff / 2));
               glLightf(GL_LIGHT0 + id, GL_SPOT_EXPONENT, exponent);
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
         }
      }
      else
         glDisable(GL_LIGHT0 + id);
   }

   void SetCamera(Display display, Surface surface, Camera camera)
   {
      OGLDisplay oglDisplay = display.driverData;
      //Logf("SetCamera\n");

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
         oglDisplay.depthWrite = true;

         glEnable(GL_MULTISAMPLE_ARB);
      }
      else if(display.display3D.camera)
      {
         oglDisplay.depthWrite = false;
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
   }

   void ApplyMaterial(Display display, Material material, Mesh mesh)
   {
      //Logf("ApplyMaterial\n");

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
      OGLMesh oglMesh = mesh.data;
      if(oglMesh)
      {
         if(!mesh.flags.vertices)
         {
            if(oglMesh.vertices)
            {
               glDeleteBuffersARB(1, &oglMesh.vertices);
               oglMesh.vertices = 0;
            }
            delete mesh.vertices;
         }
         if(!mesh.flags.normals)
         {
            if(oglMesh.normals)
            {
               glDeleteBuffersARB(1, &oglMesh.normals);
               oglMesh.normals = 0;
            }
            delete mesh.normals;
         }
         if(!mesh.flags.texCoords1)
         {
            if(oglMesh.texCoords)
            {
               glDeleteBuffersARB(1, &oglMesh.texCoords);
               oglMesh.texCoords = 0;
            }
            delete mesh.texCoords;
         }
         if(!mesh.flags.texCoords2)
         {
            if(oglMesh.texCoords2)
            {
               glDeleteBuffersARB(1, &oglMesh.texCoords2);
               oglMesh.texCoords2 = 0;
            }
            /*
            delete mesh.texCoords2;
            */
         }
         if(!mesh.flags.colors)
         {
            if(oglMesh.colors)
            {
               glDeleteBuffersARB(1, &oglMesh.colors);
               oglMesh.colors = 0;
            }
         }
         if(!mesh.flags)
         {
            delete oglMesh;
            mesh.data = null;
         }
      }
   }

   bool AllocateMesh(DisplaySystem displaySystem, Mesh mesh)
   {
      bool result = false;

      if(!mesh.data)
         mesh.data = OGLMesh { };
      if(mesh.data)
      {
         OGLMesh oglMesh = mesh.data;

         if(mesh.flags.vertices && !oglMesh.vertices && !mesh.vertices)
         {
            mesh.vertices = mesh.flags.doubleVertices ? (Vector3Df *)new Vector3D[mesh.nVertices] : new Vector3Df[mesh.nVertices];
            if(glGenBuffersARB)
               glGenBuffersARB(1, &oglMesh.vertices);
         }
         if(mesh.flags.normals && !oglMesh.normals && !mesh.normals)
         {
            if(glGenBuffersARB)
               glGenBuffersARB( 1, &oglMesh.normals);
            mesh.normals = mesh.flags.doubleNormals ? (Vector3Df *)new Vector3D[mesh.nVertices] : new Vector3Df[mesh.nVertices];
         }
         if(mesh.flags.texCoords1 && !oglMesh.texCoords && !mesh.texCoords)
         {
            if(glGenBuffersARB)
               glGenBuffersARB( 1, &oglMesh.texCoords);
            mesh.texCoords = new Pointf[mesh.nVertices];
         }
         if(mesh.flags.colors && !oglMesh.colors && !mesh.colors)
         {
            if(glGenBuffersARB)
               glGenBuffersARB( 1, &oglMesh.colors);
            mesh.colors = new ColorRGBAf[mesh.nVertices];
         }
         result = true;
      }
      return result;
   }

   void UnlockMesh(DisplaySystem displaySystem, Mesh mesh, MeshFeatures flags)
   {
      OGLMesh oglMesh = mesh.data;
      if(!flags) flags = mesh.flags;
      
      if(glGenBuffersARB)
      {
         if(!(flags.vertices) || oglMesh.vertices)
         {
            glBindBufferARB( GL_ARRAY_BUFFER_ARB, oglMesh.vertices);
            glBufferDataARB( GL_ARRAY_BUFFER_ARB, mesh.nVertices * (mesh.flags.doubleVertices ? sizeof(Vector3D) : sizeof(Vector3Df)), mesh.vertices, GL_STATIC_DRAW_ARB );
         }

         if(!(flags.normals) || oglMesh.normals)
         {
            glBindBufferARB( GL_ARRAY_BUFFER_ARB, oglMesh.normals);
            glBufferDataARB( GL_ARRAY_BUFFER_ARB, mesh.nVertices * (mesh.flags.doubleNormals ? sizeof(Vector3D) : sizeof(Vector3Df)), mesh.normals, GL_STATIC_DRAW_ARB );
         }

         if(!(flags.texCoords1) || oglMesh.texCoords)
         {
            glBindBufferARB( GL_ARRAY_BUFFER_ARB, oglMesh.texCoords);
            glBufferDataARB( GL_ARRAY_BUFFER_ARB, mesh.nVertices * sizeof(Pointf), mesh.texCoords, GL_STATIC_DRAW_ARB );
         }

         if(!(flags.colors) || oglMesh.colors)
         {
            glBindBufferARB( GL_ARRAY_BUFFER_ARB, oglMesh.colors);
            glBufferDataARB( GL_ARRAY_BUFFER_ARB, mesh.nVertices * sizeof(ColorRGBAf), mesh.colors, GL_STATIC_DRAW_ARB );
         }

         glBindBufferARB( GL_ARRAY_BUFFER_ARB, 0);
      }
   }

   bool LockMesh(DisplaySystem displaySystem, Mesh mesh, MeshFeatures flags)
   {
      bool result = true;

   	return result;
   }

   void FreeIndices(DisplaySystem displaySystem, OGLIndices oglIndices)
   {
      if(oglIndices)
      {
         if(oglIndices.buffer) 
            glDeleteBuffersARB(1, &oglIndices.buffer);
         delete oglIndices.indices;
         delete oglIndices;
      }
   }

   void * AllocateIndices(DisplaySystem displaySystem, int nIndices, bool indices32bit)
   {
      OGLIndices oglIndices = OGLIndices { };
      if(oglIndices)
      {
         oglIndices.indices = (void *)(indices32bit ? new uint32[nIndices] : new uint16[nIndices]);
         if(glGenBuffersARB)
            glGenBuffersARB( 1, &oglIndices.buffer);
         oglIndices.nIndices = nIndices;
      }
      return oglIndices;
   }

   void UnlockIndices(DisplaySystem displaySystem, OGLIndices oglIndices, bool indices32bit, int nIndices)
   {
      if(glGenBuffersARB)
      {
         glBindBufferARB( GL_ELEMENT_ARRAY_BUFFER_ARB, oglIndices.buffer);
         glBufferDataARB( GL_ELEMENT_ARRAY_BUFFER_ARB, nIndices * (indices32bit ? sizeof(uint32) : sizeof(uint16)), 
            oglIndices.indices, GL_STATIC_DRAW_ARB);
         glBindBufferARB( GL_ELEMENT_ARRAY_BUFFER_ARB, 0);
      }
   }

   uint16 * LockIndices(DisplaySystem displaySystem, OGLIndices oglIndices)
   {
      
      return oglIndices.indices;
   }

   void SelectMesh(Display display, Mesh mesh)
   {
      //Logf("SelectMesh\n");

      if(display.display3D.mesh && glUnlockArraysEXT)   
         glUnlockArraysEXT();
      
      if(mesh)
      {
         OGLDisplay oglDisplay = display.driverData;
         OGLMesh oglMesh = mesh.data;

         // *** Vertex Stream ***
         glEnableClientState(GL_VERTEX_ARRAY);
         if(!display.display3D.collectingHits && oglMesh)
         {
            if(glBindBufferARB)
               glBindBufferARB(GL_ARRAY_BUFFER_ARB, oglMesh.vertices );
            glVertexPointer(3, mesh.flags.doubleVertices ? GL_DOUBLE : GL_FLOAT, 0, glBindBufferARB ? null : mesh.vertices);

            // *** Normals Stream ***
            if(mesh.normals)
            {
               glEnableClientState(GL_NORMAL_ARRAY);
               if(glBindBufferARB)
                  glBindBufferARB(GL_ARRAY_BUFFER_ARB, oglMesh.normals);
               glNormalPointer(mesh.flags.doubleNormals ? GL_DOUBLE : GL_FLOAT, 0, glBindBufferARB ? null : mesh.normals);
            }
            else
               glDisableClientState(GL_NORMAL_ARRAY);

            // *** Texture Coordinates Stream ***
            if(mesh.texCoords)
            {
               glEnableClientState(GL_TEXTURE_COORD_ARRAY);
               if(glBindBufferARB)
                  glBindBufferARB( GL_ARRAY_BUFFER_ARB, oglMesh.texCoords);
               glTexCoordPointer(2, GL_FLOAT, 0, glBindBufferARB ? null : mesh.texCoords);
            }
            else
               glDisableClientState(GL_TEXTURE_COORD_ARRAY);

            // *** Color Stream ***
            if(mesh.colors)
            {
               glEnableClientState(GL_COLOR_ARRAY);
               if(glBindBufferARB)
                  glBindBufferARB( GL_ARRAY_BUFFER_ARB, oglMesh.colors);
               glColorPointer(4, GL_FLOAT, 0, glBindBufferARB ? null : mesh.colors);
            }
            else
               glDisableClientState(GL_COLOR_ARRAY);

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

         if(glLockArraysEXT) glLockArraysEXT(0, mesh.nVertices);
      }
      else if(glBindBufferARB)
         glBindBufferARB(GL_ARRAY_BUFFER_ARB, 0);
   }

   void DrawPrimitives(Display display, PrimitiveSingle * primitive, Mesh mesh)
   {
      OGLDisplay oglDisplay = display.driverData;
      //Logf("DrawPrimitives\n");

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
               OGLIndices oglIndices = primitive->data;
               MeshFeatures flags = mesh.flags;
               for(c = 0; c<primitive->nIndices; c++)
               {
                  short index = ((short *) oglIndices.indices)[c];
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
            OGLIndices oglIndices = primitive->data;

            if(!display.display3D.collectingHits && glBindBufferARB && oglIndices)
            {
               glBindBufferARB(GL_ELEMENT_ARRAY_BUFFER_ARB, oglIndices.buffer);
               glDrawElements(primitiveTypes[primitive->type.primitiveType], primitive->nIndices, 
                  primitive->type.indices32bit ? GL_UNSIGNED_INT : GL_UNSIGNED_SHORT, 0);
               glBindBufferARB(GL_ELEMENT_ARRAY_BUFFER_ARB, 0);
            }
            else if(oglIndices)
               glDrawElements(primitiveTypes[primitive->type.primitiveType], primitive->nIndices, 
                  primitive->type.indices32bit ? GL_UNSIGNED_INT : GL_UNSIGNED_SHORT, oglIndices.indices);
            else
               glDrawElements(primitiveTypes[primitive->type.primitiveType], primitive->nIndices, 
                  primitive->type.indices32bit ? GL_UNSIGNED_INT : GL_UNSIGNED_SHORT, primitive->indices);
         }
      }
   }

   void PushMatrix(Display display)
   {
      glPushMatrix();
   }

   void PopMatrix(Display display, bool setMatrix)
   {
      glPopMatrix();
   }

   void SetTransform(Display display, Matrix transMatrix, bool viewSpace, bool useCamera)
   {
      Matrix matrix = transMatrix;
      Camera camera = useCamera ? display.display3D.camera : null;

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
}

public void UseSingleGLContext(bool useSingle)
{
   useSingleGLContext = useSingle;
}

#endif
