// We were using PBUFFER for alpha compositing on Linux before, but it does not seem to work, nor be required anymore.
// #define USEPBUFFER

namespace gfx::drivers;

// OpenGL Extensions
#if defined(__unix__) || defined(__APPLE__)

#if !defined(__MINGW32__)
   #define GL_GLEXT_PROTOTYPES
#endif

#define pointer _pointer

#ifdef ECERE_MINIGLX

//#include <GL/miniglx.h>

#else

   #if !defined(__ANDROID__)

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

#endif

#if defined(__APPLE__)
#include <OpenGl/gl.h>
#endif

#if defined(__WIN32__) || defined(__unix__) || defined(__APPLE__)

#if defined(__WIN32__)
   #define WIN32_LEAN_AND_MEAN
   #undef _WIN32_WINNT
   #define _WIN32_WINNT 0x0502
   #define String Sting_
   #include <windows.h>
   #undef String
#endif

#if defined(__ANDROID__)

   #include <GLES/gl.h>
   #include <EGL/egl.h>

#else

   #include <GL/gl.h>
   #include <GL/glext.h>

#endif

#undef pointer

import "Display"

#if defined(__unix__) || defined(__APPLE__)

   #ifndef __ANDROID__
   import "XInterface"
   #endif

#endif

static double nearPlane = 1;

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
   typedef const char * (APIENTRY * PFNWGLGETEXTENSIONSSTRINGARBPROC) (HDC hdc);
   typedef BOOL (APIENTRY * PFNWGLBINDTEXIMAGEARBPROC) (void * hPbuffer, int iBuffer);
   typedef BOOL (APIENTRY * PFNWGLRELEASETEXIMAGEARBPROC) (void * hPbuffer, int iBuffer);

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

   #define glBufferData glBufferDataARB

   #ifdef WGL_WGLEXT_PROTOTYPES
   extern BOOL WINAPI wglSwapIntervalEXT (int);
   extern int WINAPI wglGetSwapIntervalEXT (void);
   #endif /* WGL_WGLEXT_PROTOTYPES */
   typedef BOOL (WINAPI * PFNWGLSWAPINTERVALEXTPROC) (int interval);
   typedef int (WINAPI * PFNWGLGETSWAPINTERVALEXTPROC) (void);

   static PFNWGLSWAPINTERVALEXTPROC wglSwapIntervalEXT = NULL;

#endif

// Our own matrix stack
static Matrix matrixStack[3][32];
static int matrixIndex[3];
static int curStack = 0;

#if defined(_GLES)

   // OpenGL ES Porting Kit
#if defined(__ANDROID__)
   #define glBindFramebuffer        glBindFramebufferOES
   #define glBindRenderbuffer       glBindRenderbufferOES
   #define GL_FRAMEBUFFER           GL_FRAMEBUFFER_OES
   #define GL_RENDERBUFFER          GL_RENDERBUFFER_OES
   #define glFramebufferTexture2D   glFramebufferTexture2DOES
   #define GL_COLOR_ATTACHMENT0     GL_COLOR_ATTACHMENT0_OES
   #define glGenFramebuffers        glGenFramebuffersOES
   #define glGenRenderbuffers       glGenRenderbuffersOES
   #define glDeleteFramebuffers     glDeleteFramebuffersOES
   #define glDeleteRenderbuffers    glDeleteRenderbuffersOES

   #define GL_POLYGON_STIPPLE 0xFFFF
   #define GL_LINE_STIPPLE 0xFFFF
   #define GL_LINE 0xFFFF
   #define GL_FILL 0xFFFF
   #define GL_ALL_ATTRIB_BITS 0xFFFF
   #define GL_LIGHT_MODEL_LOCAL_VIEWER 0xFFFF
   #define GL_INT                                  0x1404
   #define GL_UNSIGNED_INT                         0x1405
   #define GL_DOUBLE                               0x140A
   #define GL_POLYGON      9
   #define GL_QUADS        7
   #define APIENTRY
#endif

   #define glDrawElementsi(type, count, start)  glDrawElements(type, count, GL_UNSIGNED_SHORT, start)

   #define glBufferDatai         glesBufferDatai
   #define glBufferDatad         glesBufferDatad
   #define glVertexPointeri      glesVertexPointeri
   #define glVertexPointerd      glesVertexPointerd

   #define glRecti               glesRecti
   #define glBegin               glesBegin
   #define glTexCoord2i          glesTexCoord2i
   #define glVertex2i            glesVertex2i
   #define glTexCoord2d          glesTexCoord2d
   #define glVertex2d            glesVertex2d
   #define glTexCoord2f          glesTexCoord2f
   #define glVertex2f            glesVertex2f
   #define glEnd                 glesEnd
   #define glColor3f             glesColor3f
   #define glColor4ub            glesColor4ub
   #define glColor4fv            glesColor4fv
   #define glLineStipple         glesLineStipple
   #define glNormal3fv           glesNormal3fv
   #define glTexCoord2fv         glesTexCoord2fv
   #define glColorMaterial       glesColorMaterial

   #define glLoadMatrixd         glesLoadMatrixd
   #define glMultMatrixd         glesMultMatrixd
   #define glFrustum             glesFrustum
   #define glOrtho               glesOrtho
   #define glScaled              glesScaled
   #define glTranslated          glesTranslated
   #define glRotated             glesRotated
   #define glVertex3d            glesVertex3d
   #define glVertex3dv           glesVertex3dv
   #define glVertex3f            glesVertex3f
   #define glVertex3fv           glesVertex3fv
   #define glLightModeli         glesLightModeli

#if defined(__ANDROID__)
   //#define GL_QUADS              0
   #define GL_QUAD_STRIP         0
   //#define GL_DOUBLE             0
   //#define GL_UNSIGNED_INT       0
   //#define GL_FILL               0
   //#define GL_LINE               0
   //#define GL_LINE_STIPPLE       0
   #define GL_BGRA_EXT           0
   #define GL_UNPACK_ROW_LENGTH  0
   #define GL_UNPACK_SKIP_PIXELS 0
   #define GL_UNPACK_SKIP_ROWS   0
   #define GL_RGBA8              0
   #define GL_PACK_ROW_LENGTH    0
   #define GL_PACK_SKIP_ROWS     0
   #define GL_PACK_SKIP_PIXELS   0
#endif

#else

#define glVertexPointerd(nc, s, p, nv)       glVertexPointer(nc, GL_DOUBLE, s, p)
#define glDrawElementsi(type, count, start)  glDrawElements(type, count, GL_UNSIGNED_INT, start)

#endif

#if defined(__ANDROID__)
   static EGLDisplay eglDisplay;
   static EGLSurface eglSurface;
   static EGLContext eglContext;
   static int eglWidth, eglHeight;

   static bool egl_init_display(ANativeWindow* window)
   {
      const EGLint attribs[] =
      {
         EGL_SURFACE_TYPE, EGL_WINDOW_BIT,
         EGL_BLUE_SIZE, 8,
         EGL_GREEN_SIZE, 8,
         EGL_RED_SIZE, 8,
         EGL_DEPTH_SIZE, 16, //24,
         /*EGL_SAMPLE_BUFFERS, 1,
         EGL_SAMPLES, 0, //2,*/
         EGL_NONE
      };
      EGLint w, h, format;
      EGLint numConfigs;
      EGLConfig config;
      EGLSurface surface;
      EGLContext context;

      EGLDisplay display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
      eglInitialize(display, 0, 0);
      eglChooseConfig(display, attribs, &config, 1, &numConfigs);
      eglGetConfigAttrib(display, config, EGL_NATIVE_VISUAL_ID, &format);

      surface = eglCreateWindowSurface(display, config, window, null);
      context = eglCreateContext(display, config, null, null);

      if(!eglMakeCurrent(display, surface, surface, context))
         return false;

      eglQuerySurface(display, surface, EGL_WIDTH, &w);
      eglQuerySurface(display, surface, EGL_HEIGHT, &h);

      eglDisplay = display;
      eglContext = context;
      eglSurface = surface;
      eglWidth = w;
      eglHeight = h;

      glEnableClientState(GL_VERTEX_ARRAY);
      /*
      // Initialize GL state.
      glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_FASTEST);
      glEnable(GL_CULL_FACE);
      glShadeModel(GL_SMOOTH);
      glDisable(GL_DEPTH_TEST);
      */
      glDisable(GL_CULL_FACE);
      glDisable(GL_DEPTH_TEST);

      glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
      glEnable(GL_BLEND);

      matrixStack[0][0].Identity();
      matrixStack[1][0].Identity();
      matrixStack[2][0].Identity();

      glesMatrixMode(GL_MODELVIEW);
      glScaled(1.0, 1.0, -1.0);
      glesMatrixMode(GL_PROJECTION);
      glShadeModel(GL_FLAT);

      glLightModeli(GL_LIGHT_MODEL_COLOR_CONTROL, GL_SEPARATE_SPECULAR_COLOR);
      glFogi(GL_FOG_MODE, GL_EXP);
      glFogf(GL_FOG_DENSITY, 0);
      glEnable(GL_NORMALIZE);
      glDepthFunc(GL_LESS);
      glClearDepth(1.0);
      glDisable(GL_MULTISAMPLE_ARB);

      glViewport(0,0,w,h);
      glesLoadIdentity();
      glOrtho(0,w,h,0,0.0,1.0);

      currentVertexBuffer = 0;
      return true;
   }

   static void egl_term_display()
   {
      if(stippleTexture)
      {
         glDeleteTextures(1, &stippleTexture);
         stippleTexture = 0;
      }
      if(eglDisplay != EGL_NO_DISPLAY)
      {
         eglMakeCurrent(eglDisplay, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
         if(eglContext != EGL_NO_CONTEXT)
            eglDestroyContext(eglDisplay, eglContext);
         if(eglSurface != EGL_NO_SURFACE)
            eglDestroySurface(eglDisplay, eglSurface);
         eglTerminate(eglDisplay);
      }
      eglDisplay = EGL_NO_DISPLAY;
      eglContext = EGL_NO_CONTEXT;
      eglSurface = EGL_NO_SURFACE;
   }

#endif

// OpenGL Immediate Mode Porting Kit
static int beginCount;
static int vertexCount;
static int normalCount;
static float *vertexPointer;
static float *normalPointer;
static GLenum beginMode;
static unsigned int beginBufferSize, normalBufferSize;
static int numVertexCoords = 2;

public void glesRecti(int a, int b, int c, int d)
{
   glBegin(GL_QUADS);
   glVertex2i(a, b);
   glVertex2i(a, d);
   glVertex2i(c, d);
   glVertex2i(c, b);
   glEnd();
}

public void glesBegin(GLenum mode)
{
   beginMode = mode;
   beginCount = 0;
   vertexCount = 0;
   if(!vertexPointer)
   {
      normalBufferSize = beginBufferSize = 1024;  // default number of vertices
      vertexPointer = new float[beginBufferSize * 5];
      normalPointer = new float[normalBufferSize * 3];
   }
}

public void glesTexCoord2f(float x, float y)
{
   int count = vertexCount;

   if(vertexCount + numVertexCoords > beginBufferSize)
   {
      beginBufferSize = beginBufferSize + beginBufferSize/2;
      vertexPointer = renew vertexPointer float[beginBufferSize * 5];
   }

   vertexPointer[count*(2+numVertexCoords)  ] = x;
   vertexPointer[count*(2+numVertexCoords)+1] = y;
   count++;

   if(beginMode == GL_QUADS && ((beginCount % 4) == 3))
   {
      vertexPointer[count*(2+numVertexCoords)  ] = vertexPointer[(count-4)*(2+numVertexCoords)];
      vertexPointer[count*(2+numVertexCoords)+1] = vertexPointer[(count-4)*(2+numVertexCoords)+1];
      count++;
      vertexPointer[count*(2+numVertexCoords)  ] = vertexPointer[(count-3)*(2+numVertexCoords)];
      vertexPointer[count*(2+numVertexCoords)+1] = vertexPointer[(count-3)*(2+numVertexCoords)+1];
      count++;
   }
}
public void glesTexCoord2i(int x, int y)       { glesTexCoord2f((float)x, (float)y); }
public void glesTexCoord2d(double x, double y) { glesTexCoord2f((float)x, (float)y); }
public void glesTexCoord2fv(float * a)         { glesTexCoord2f(a[0], a[1]); }

public void glesVertex2f(float x, float y)
{
   numVertexCoords = 2;
   if(vertexCount + 4 > beginBufferSize)
   {
      beginBufferSize = beginBufferSize + beginBufferSize/2;
      vertexPointer = renew vertexPointer float[beginBufferSize * 5];
   }

   vertexPointer[vertexCount*4+2] = x;
   vertexPointer[vertexCount*4+3] = y;
   vertexCount++;

   if(beginMode == GL_QUADS && ((beginCount % 4) == 3))
   {
      vertexPointer[vertexCount*4+2] = vertexPointer[(vertexCount-4)*4+2];
      vertexPointer[vertexCount*4+3] = vertexPointer[(vertexCount-4)*4+3];
      vertexCount++;
      vertexPointer[vertexCount*4+2] = vertexPointer[(vertexCount-3)*4+2];
      vertexPointer[vertexCount*4+3] = vertexPointer[(vertexCount-3)*4+3];
      vertexCount++;
   }
   beginCount++;
}
public void glesVertex2i(int x, int y)         { glesVertex2f((float)x, (float)y); }
public void glesVertex2d(double x, double y)   { glesVertex2f((float)x, (float)y); }

public void glesEnd(void)
{
   int mode = beginMode;
   if(mode == GL_QUADS)        mode = GL_TRIANGLES;
   else if(mode == GL_POLYGON) mode = GL_TRIANGLE_FAN;
   GLSelectVBO(0);
   glEnableClientState(GL_TEXTURE_COORD_ARRAY);
   glTexCoordPointer(numVertexCoords, GL_FLOAT, (numVertexCoords+2)*sizeof(float),vertexPointer);
   glVertexPointer  (numVertexCoords, GL_FLOAT, (numVertexCoords+2)*sizeof(float),vertexPointer+2);
   if(normalCount && normalCount == vertexCount)
   {
      glEnableClientState(GL_NORMAL_ARRAY);
      glNormalPointer  (GL_FLOAT, 3*sizeof(float),normalPointer);
   }

   glDrawArrays(mode, 0, vertexCount);
   if(normalCount)
      glDisableClientState(GL_NORMAL_ARRAY);
   glDisableClientState(GL_TEXTURE_COORD_ARRAY);
   normalCount = 0;
}

// Vertex Pointer
static float *floatVPBuffer = null;
static short *shortVPBuffer = null;
static unsigned int shortVPSize = 0, floatVPSize = 0;

// Buffer Data
//static float *floatVPBuffer = null;  // For floats we reuse floatVPBuffer
static unsigned short *shortBDBuffer = null;
static unsigned int shortBDSize = 0/*, floatVPSize = 0*/;

public void glesVertexPointeri(int numCoords, int stride, int *pointer, int numVertices)
{
   if(pointer)
   {
      int i;
      if(numVertices*numCoords > shortVPSize)
      {
         shortVPSize = numVertices*numCoords;
         shortVPBuffer = renew shortVPBuffer short[shortVPSize];
      }
      for(i = 0; i < numVertices*numCoords; i++)
         shortVPBuffer[i] = (short)pointer[i];
      glVertexPointer(numCoords, GL_SHORT, stride, shortVPBuffer);
   }
   else
      glVertexPointer(numCoords, GL_SHORT, stride, 0);
}

public void glesVertexPointerd(int numCoords, int stride, double *pointer, int numVertices)
{
   if(pointer)
   {
      int i;
      if(numVertices*numCoords > floatVPSize)
      {
         floatVPSize = numVertices*numCoords;
         floatVPBuffer = renew floatVPBuffer float[floatVPSize];
      }
      for(i = 0; i < numVertices*numCoords; i++)
         floatVPBuffer[i] = (float)pointer[i];
      glVertexPointer(numCoords, GL_FLOAT, stride, floatVPBuffer);
   }
   else
      glVertexPointer(numCoords, GL_FLOAT, stride, 0);
}

public void glesTexReuseIntVP(int numCoords)
{
   glTexCoordPointer(numCoords, GL_SHORT, 0, floatVPBuffer);
}

public void glesTexReuseDoubleVP(int numCoords)
{
   glTexCoordPointer(numCoords, GL_FLOAT, 0, floatVPBuffer);
}

public void glesColor3f( float r, float g, float b )
{
   glColor4f(r, g, b, 1.0f);
}

public void glesColor4ub(unsigned char r, unsigned char g, unsigned char b, unsigned char a)
{
   glColor4f(r/255.0f, g/255.0f, b/255.0f, a/255.0f);
}

public void glesColor4fv(float * a)
{
   glColor4f(a[0], a[1], a[2], a[3]);
}

public void glesBufferDatad(int target, int size, void * data, int usage)
{
   int numElems = size/sizeof(double);
   double * dblPtr = (double *)data;
   int i;
   if (numElems > floatVPSize)
   {
      floatVPSize = numElems;
      floatVPBuffer = renew floatVPBuffer float[floatVPSize];
   }
   for (i=0; i< numElems; i++)
      floatVPBuffer[i] = (float)dblPtr[i];

   glBufferData(target, numElems*sizeof(float), floatVPBuffer, usage);
}

public void glesBufferDatai(int target, int size, void * data, int usage)
{
   int numElems = size/sizeof(unsigned int);
   unsigned int * pointer = (unsigned int *)data;
   int i;
   if (numElems > shortBDSize)
   {
      shortBDSize = numElems;
      shortBDBuffer = renew shortBDBuffer uint16[shortBDSize];
   }
   for (i=0; i< numElems; i++)
      shortBDBuffer[i] = (unsigned short)pointer[i];

   glBufferData(target, numElems*sizeof(unsigned short), shortBDBuffer, usage);
}

// *** Our Custom Matrix Stack ***

static void LoadCurMatrix()
{
   double * i = matrixStack[curStack][matrixIndex[curStack]].array;
   float m[16] =
   {
      (float)i[0],(float)i[1],(float)i[2],(float)i[3],
      (float)i[4],(float)i[5],(float)i[6],(float)i[7],
      (float)i[8],(float)i[9],(float)i[10],(float)i[11],
      (float)i[12],(float)i[13],(float)i[14],(float)i[15]
   };
   glLoadMatrixf(m);
}

public void glesLoadIdentity()
{
   matrixStack[curStack][matrixIndex[curStack]].Identity();
   LoadCurMatrix();
}

public void glesPushMatrix()
{
   if(matrixIndex[curStack] + 1 < sizeof(matrixStack[0]) / sizeof(Matrix))
   {
      matrixIndex[curStack]++;
      memcpy(matrixStack[curStack][matrixIndex[curStack]].array, matrixStack[curStack][matrixIndex[curStack]-1].array, sizeof(Matrix));
   }
}

public void glesPopMatrix()
{
   if(matrixIndex[curStack] > 0)
   {
      matrixIndex[curStack]--;
      LoadCurMatrix();
   }
}

public void glesLoadMatrixd(double * i)
{
   memcpy(matrixStack[curStack][matrixIndex[curStack]].array, i, sizeof(Matrix));
   LoadCurMatrix();
}

public void glesOrtho( double l, double r, double b, double t, double n, double f )
{
   Matrix m
   { {
      (2 / (r - l)), 0, 0, 0,
      0, (2 / (t - b)), 0, 0,
      0, 0, (-2 / (f - n)), 0,
      (-(r + l) / (r - l)), (-(t + b) / (t - b)), (-(f + n) / (f - n)), 1
   } };
   Matrix res;
   res.Multiply(m, matrixStack[curStack][matrixIndex[curStack]]);
   matrixStack[curStack][matrixIndex[curStack]] = res;
   LoadCurMatrix();
}

public void glesFrustum( double l, double r, double b, double t, double n, double f )
{
   nearPlane = n;
   n = 1;
   l /= nearPlane;
   r /= nearPlane;
   b /= nearPlane;
   t /= nearPlane;
   f /= nearPlane;
   {
      double A = ((r + l) / (r - l));
      double B = ((t + b) / (t - b));
      double C = (-(f + n) / (f - n));
      double D = (-2*f*n/(f-n));
      Matrix m
      { {
         (2.0*n / (r - l)), 0, 0, 0,
         0, (2.0*n / (t - b)), 0, 0,
         A, B,             C,-1,
         0, 0,             D, 0
      } };
      Matrix res;
      res.Multiply(m, matrixStack[curStack][matrixIndex[curStack]]);
      matrixStack[curStack][matrixIndex[curStack]] = res;
      LoadCurMatrix();
   }
}

public void glesRotated( double a, double b, double c, double d )
{
   Quaternion q;
   Matrix m, r;

   q.RotationAxis({(float)b,(float)c,(float)-d}, a );
   m.RotationQuaternion(q);
   r.Multiply(m, matrixStack[curStack][matrixIndex[curStack]]);
   matrixStack[curStack][matrixIndex[curStack]] = r;
   LoadCurMatrix();
}
public void glesScaled( double a, double b, double c )
{
   Matrix m, r;

   m.Identity();
   m.Scale(a,b,c);
   r.Multiply(m, matrixStack[curStack][matrixIndex[curStack]]);
   matrixStack[curStack][matrixIndex[curStack]] = r;
   LoadCurMatrix();
}

public void glesTranslated( double a, double b, double c )
{
   Matrix m, r;

   m.Identity();
   m.Translate(a,b,c);
   r.Multiply(m, matrixStack[curStack][matrixIndex[curStack]]);
   matrixStack[curStack][matrixIndex[curStack]] = r;
   LoadCurMatrix();
}

public void glesMultMatrixd( double * i )
{
   Matrix r;
   r.Multiply((Matrix *)i, matrixStack[curStack][matrixIndex[curStack]]);
   matrixStack[curStack][matrixIndex[curStack]] = r;
   LoadCurMatrix();
}

public void glesMatrixMode(int mode)
{
   curStack = (mode == GL_MODELVIEW) ? 0 : (mode == GL_PROJECTION) ? 1 : 2;
   glMatrixMode(mode);
}

#if defined(_GLES)

#define glPushMatrix          glesPushMatrix
#define glPopMatrix           glesPopMatrix
#define glLoadIdentity        glesLoadIdentity
#define glMatrixMode          glesMatrixMode

#endif

/* Using the built-in matrix stack
void glesLoadMatrixd( double * i )
{
   float m[16] =
   {
      (float)i[0],(float)i[1],(float)i[2],(float)i[3],
      (float)i[4],(float)i[5],(float)i[6],(float)i[7],
      (float)i[8],(float)i[9],(float)i[10],(float)i[11],
      (float)i[12],(float)i[13],(float)i[14],(float)i[15]
   };
   glLoadMatrixf(m);
}

void glesOrtho( double l, double r, double b, double t, double n, double f )
{
   float matrix[4][4] =
   {
      { (float)(2 / (r - l)), 0, 0, 0 },
      { 0, (float)(2 / (t - b)), 0, 0 },
      { 0, 0, (float)(-2 / (f - n)), 0 },
      { (float)(-(r + l) / (r - l)), (float)(-(t + b) / (t - b)), (float)(-(f + n) / (f - n)), 1 }
   };
   glMultMatrixf((float *)matrix);
}

void glesFrustum( double l, double r, double b, double t, double n, double f )
{
   float A = (float)((r + l) / (r - l));
   float B = (float)((t + b) / (t - b));
   float C = (float)(-(f + n) / (f - n));
   float D = (float)(-2*f*n/(f-n));
   float matrix[4][4] =
   {
      { (float)(2*n / (r - l)), 0, 0, 0 },
      { 0, (float)(2*n / (t - b)), 0, 0 },
      { A, B,             C,-1 },
      { 0, 0,             D, 0 }
   };
   glMultMatrixf((float *)matrix);
}

void glesRotated( double a, double b, double c, double d ) { glRotatef((float)a, (float)b, (float)c, (float)d); }
void glesScaled( double a, double b, double c ) { glScalef((float)a, (float)b, (float)c); }
void glesTranslated( double a, double b, double c ) { glTranslatef((float)a, (float)b, (float)c); }

void glesMultMatrixd( double * i )
{
   float m[16] =
   {
      (float)i[0], (float)i[1], (float)i[2], (float)i[3],
      (float)i[4], (float)i[5], (float)i[6], (float)i[7],
      (float)i[8], (float)i[9], (float)i[10], (float)i[11],
      (float)i[12], (float)i[13], (float)i[14], (float)i[15]
   };
   glMultMatrixf(m);
}
*/

// Need to do these...
public void glesVertex3f( float x, float y, float z )
{
   numVertexCoords = 3;
   if(vertexCount + 4 > beginBufferSize)
   {
      beginBufferSize = beginBufferSize + beginBufferSize/2;
      vertexPointer = renew vertexPointer float[beginBufferSize * 5];
   }

   vertexPointer[vertexCount*5+2] = x;
   vertexPointer[vertexCount*5+3] = y;
   vertexPointer[vertexCount*5+4] = z;
   vertexCount++;

   if(beginMode == GL_QUADS && ((beginCount % 4) == 3))
   {
      vertexPointer[vertexCount*5+2] = vertexPointer[(vertexCount-4)*5+2];
      vertexPointer[vertexCount*5+3] = vertexPointer[(vertexCount-4)*5+3];
      vertexPointer[vertexCount*5+4] = vertexPointer[(vertexCount-4)*5+4];
      vertexCount++;
      vertexPointer[vertexCount*5+2] = vertexPointer[(vertexCount-3)*5+2];
      vertexPointer[vertexCount*5+3] = vertexPointer[(vertexCount-3)*5+3];
      vertexPointer[vertexCount*5+4] = vertexPointer[(vertexCount-3)*5+4];
      vertexCount++;
   }
   beginCount++;
}

public void glesVertex3d( double x, double y, double z )  { glesVertex3f((float)x, (float)y, (float)z); }
public void glesVertex3fv( float* coords )                { glesVertex3f(coords[0], coords[1], coords[2]); }
public void glesVertex3dv( double* coords )               { glesVertex3f((float)coords[0], (float)coords[1], (float)coords[2]); }

public void glesNormal3f(float x, float y, float z)
{
   normalCount = vertexCount;
   if(vertexCount + 4 > normalBufferSize)
   {
      normalBufferSize = normalBufferSize + normalBufferSize/2;
      normalPointer = renew normalPointer float[normalBufferSize * 2];
   }

   normalPointer[normalCount*3+0] = x;
   normalPointer[normalCount*3+1] = y;
   normalPointer[normalCount*3+2] = z;
   normalCount++;

   if(beginMode == GL_QUADS && ((beginCount % 4) == 3))
   {
      normalPointer[normalCount*3+0] = normalPointer[(normalCount-4)*3+0];
      normalPointer[normalCount*3+1] = normalPointer[(normalCount-4)*3+1];
      normalPointer[normalCount*3+2] = normalPointer[(normalCount-4)*3+2];
      normalCount++;
      normalPointer[normalCount*3+0] = normalPointer[(normalCount-3)*3+0];
      normalPointer[normalCount*3+1] = normalPointer[(normalCount-3)*3+1];
      normalPointer[normalCount*3+2] = normalPointer[(normalCount-3)*3+2];
      normalCount++;
   }
}
public void glesNormal3fd(double x, double y, double z)         { glesNormal3f((float)x, (float)y, (float)z); }
public void glesNormal3fv(float * coords)                       { glesNormal3f(coords[0], coords[1], coords[2]); }

public void glesColorMaterial(int a, int b)
{
   PrintLn("glColorMaterial stub");
}

public void glesTerminate()
{
   delete vertexPointer;
   delete normalPointer;
   beginBufferSize = 0;

   delete floatVPBuffer;
   shortVPSize = 0;

   delete shortVPBuffer;
   floatVPSize = 0;

   delete shortBDBuffer;
   shortBDSize = 0;
}

static GLuint stippleTexture;
#if defined(_GLES)
static bool stippleEnabled;
#endif

public void glesLineStipple( int i, unsigned short j )
{
   uint texture[1*16];
   int x;
   for(x = 0; x < 16; x++)
   {
      bool v = (j & (1 << x)) != 0;
      texture[x] = v ? 0xFFFFFFFF : 0;
   }
   if(!stippleTexture)
      glGenTextures(1, &stippleTexture);
   glBindTexture(GL_TEXTURE_2D, stippleTexture);
   glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, 16, 1, 0, GL_RGBA, GL_UNSIGNED_BYTE, texture);
   glEnable(GL_TEXTURE_2D);
   glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
   glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
   glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
   glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
   glMatrixMode(GL_TEXTURE);
   glLoadIdentity();
   //glTranslated(1.0/backAttrib->texW/2.0f, 1.0/backAttrib->texH/2.0f, 0.0f);
   glScaled(i/16.0, 1, 1.0f);
   glTranslated(0.5, 0.5, 0);
   glMatrixMode(GL_PROJECTION);
}

public void glesLightModeli( unsigned int pname, int param )
{
   if(pname == GL_LIGHT_MODEL_TWO_SIDE)
      glLightModelf(GL_LIGHT_MODEL_TWO_SIDE, param);
}

#ifdef __ANDROID__
void glClearDepth( double depth ) { glClearDepthf((float)depth); }
void glFogi( unsigned int pname, int param ) { }
void glPolygonMode( unsigned int i, unsigned int j ) { }


// *** Picking won't be supported for now ***
void glPushName( unsigned int i ) { }
void glLoadName( unsigned int i ) { }
void glPopName() { }

// Probably replace by regular glBlendFunc ...
void glBlendFuncSeparate(int a, int b, int c, int d)
{
   glBlendFunc(a, b);
}

// For direct pixel blitting...
void glRasterPos2d(double a, double b) { }
void glPixelZoom(float a, float b) { }
void glDrawPixels(int a, int b, int c, int d, void * e) { }

#endif

#if !defined(__APPLE__) && !defined(__WIN32__)
void (APIENTRY * glBindBufferARB) (GLenum target, GLuint buffer);
void (APIENTRY * glGenBuffersARB) (GLsizei n, GLuint *buffers);
void (APIENTRY * glDeleteBuffersARB) (GLsizei n, const GLuint *buffers);
void (APIENTRY * glBufferDataARB) (GLenum target, int size, const GLvoid *data, GLenum usage);
#endif

static int currentVertexBuffer;

bool GLSelectVBO(uint vbo)
{
   if(currentVertexBuffer != vbo)
   {
      GLBindBuffer(GL_ARRAY_BUFFER, vbo);
      currentVertexBuffer = vbo;
      return true;
   }
   return false;
}

void GLGenBuffers(int count, uint * buffer)
{
#ifdef __ANDROID__
   glGenBuffers(count, buffer);
#else
#if defined(__WIN32__)
   if(glGenBuffersARB)
#endif
      glGenBuffersARB(count, buffer);
#endif
}

void GLDeleteBuffers(int count, GLuint * buffer)
{
#ifdef __ANDROID__
   glDeleteBuffers(count, buffer);
#else
#if defined(__WIN32__)
   if(glDeleteBuffersARB)
#endif
      glDeleteBuffersARB(count, buffer);
#endif
}

void GLBindBuffer(int target, uint buffer)
{
#ifdef __ANDROID__
   glBindBuffer(target, buffer);
#else
#if defined(__WIN32__)
   if(glBindBufferARB)
#endif
      glBindBufferARB(target, buffer);
#endif
}

public void GLVertexPointer(int numCoords, int glType, int stride, void *ptr, int numVertices)
{
#ifdef _GLES
   if(glType == GL_DOUBLE)
      glesVertexPointerd(numCoords, stride, ptr, numVertices);
   else if(glType == GL_INT)
      glesVertexPointeri(numCoords, stride, ptr, numVertices);
   else
#endif
      glVertexPointer(numCoords, glType, stride, ptr);
}

public void GLBufferData(int type, GLenum target, int size, const GLvoid *data, GLenum usage)
{
#ifdef _GLES
   if(type == GL_DOUBLE)
      glesBufferDatad(target, size, (void *)data, usage);
   else if(type == GL_UNSIGNED_INT)
      glesBufferDatai(target, size, (void *)data, usage);
   else
#endif

#ifdef __ANDROID__
      glBufferData(target, size, data, usage);
#else

#if defined(__WIN32__)
   if(glBufferDataARB)
#endif
      glBufferDataARB(target, size, data, usage);
#endif
}

#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA)
static int primitiveTypes[RenderPrimitiveType] =
{
   GL_POINTS, GL_LINES, GL_TRIANGLES, GL_TRIANGLE_STRIP, GL_TRIANGLE_FAN, GL_QUADS, GL_QUAD_STRIP, GL_LINE_STRIP
};
#endif


// Non OpenGL ES friendly stuff

#if defined(_GLES)

//#undef GL_UNSIGNED_INT
//#undef GL_DOUBLE
#undef GL_INT
//#undef GL_POLYGON
//#undef GL_QUADS
#undef GL_QUAD_STRIP
#undef GL_POLYGON_STIPPLE
#undef GL_LINE_STIPPLE
#undef GL_LINE
#undef GL_FILL
#undef GL_ALL_ATTRIB_BITS
#undef GL_LIGHT_MODEL_LOCAL_VIEWER

#endif

static int displayWidth, displayHeight;

#define GL_CLAMP_TO_EDGE 0x812F

static bool vboAvailable;

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
#elif !defined(__ANDROID__)
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
   int maxTextureSize;
   bool loadingFont;
   bool pow2textures;
#if defined(__WIN32__)
   PIXELFORMATDESCRIPTOR pfd;
   int format;
   HDC hdc;
   HGLRC glrc;
   HWND hwnd;
#elif !defined(__ANDROID__)
   XVisualInfo * visualInfo;
   GLXContext glContext;
   GLXDrawable glxDrawable;
#endif
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
   uint vertices;
   uint normals;
   uint texCoords;
   uint texCoords2;
   uint colors;
};

class OGLIndices : struct
{
   uint16 * indices;
   uint buffer;
   uint nIndices;
};

int current;
void * previous;

class OpenGLDisplayDriver : DisplayDriver
{
   class_property(name) = "OpenGL";

   bool LockSystem(DisplaySystem displaySystem)
   {
#if !defined(__ANDROID__)
      OGLSystem oglSystem = displaySystem.driverData;
      if(useSingleGLContext) return true;
   #if defined(__WIN32__)
      wglMakeCurrent(oglSystem.hdc, oglSystem.glrc);
   #elif defined(__unix__) || defined(__APPLE__)
      //if(previous) return true;
      // printf("Making SYSTEM current\n");
      glXMakeCurrent(xGlobalDisplay, (GLXDrawable)oglSystem.glxDrawable, oglSystem.glContext);
      //previous = oglSystem.glContext;
   #endif
#endif
      return true;
   }

   void UnlockSystem(DisplaySystem displaySystem)
   {
      if(useSingleGLContext) return;
   #if defined(__WIN32__)
      wglMakeCurrent(null, null);
   #elif defined(__unix__) || defined(__APPLE__)
      // printf("Making NULL current\n");
      #if defined(__ANDROID__)
      #else
      glXMakeCurrent(xGlobalDisplay, None, null);
      #endif
      // previous = null;
   #endif
   }

   bool Lock(Display display)
   {
#if !defined(__ANDROID__)
      OGLDisplay oglDisplay = display.driverData;
      if(useSingleGLContext) return true;
   #if defined(__WIN32__)
      wglMakeCurrent(oglDisplay.hdc, oglDisplay.glrc);
   #elif defined(__unix__) || defined(__APPLE__)
      // if(previous) glXMakeCurrent(xGlobalDisplay, None, null);
      // printf("   Making DISPLAY current\n");
      glXMakeCurrent(xGlobalDisplay, (GLXDrawable)display.window, oglDisplay.glContext);
   #endif
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

   #elif defined(__unix__) || defined(__APPLE__)
      #if defined(__ANDROID__)
      #else
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
   #endif
         delete oglDisplay.flippingBuffer;
         delete oglDisplay;
         display.driverData = null;
      }
   }

   void ::CheckExtensions(OGLSystem oglSystem)
   {
      const char * extensions = (const char *)glGetString(GL_EXTENSIONS);
      if(extensions)
         oglSystem.pow2textures = strstr(extensions, "GL_ARB_texture_non_power_of_two") ? false : true;
      glGetIntegerv(GL_MAX_TEXTURE_SIZE, &oglSystem.maxTextureSize);
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

               vboAvailable = glBindBufferARB != null;

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

               CheckExtensions(oglSystem);

               wglMakeCurrent(null, null);

               //eSystem_DumpErrors(true);
            }
         }
      }
   #elif defined(__unix__) || defined(__APPLE__)
      vboAvailable = true;
      #if defined(__ANDROID__)
         egl_init_display(guiApp.desktop.windowHandle);
         CheckExtensions(oglSystem);
         result = true;
      #else
      {
         X11Window root = RootWindow( xGlobalDisplay, DefaultScreen( xGlobalDisplay ) );
         XSetWindowAttributes attr;
         unsigned long mask;

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
         oglSystem.visualInfo = glXChooseVisual( xGlobalDisplay,  DefaultScreen( xGlobalDisplay ), attrList );
         attr.background_pixel = 0;
         attr.border_pixel = 0;
         attr.colormap = XCreateColormap( xGlobalDisplay, root, oglSystem.visualInfo->visual, AllocNone);
         attr.event_mask = StructureNotifyMask | ExposureMask | KeyPressMask;
         mask = CWBackPixel | CWBorderPixel | CWColormap | CWEventMask;

         oglSystem.glxDrawable = XCreateWindow( xGlobalDisplay, root, 0, 0, 1, 1, 0, oglSystem.visualInfo->depth, InputOutput,
            oglSystem.visualInfo->visual, mask, &attr );
      }
      if(oglSystem.visualInfo)
      {
         oglSystem.glContext = glXCreateContext(xGlobalDisplay, oglSystem.visualInfo, null, True);
         if(oglSystem.glContext)
         {
            glXMakeCurrent(xGlobalDisplay, oglSystem.glxDrawable, oglSystem.glContext);
            // Setup Extensions
            CheckExtensions(oglSystem);
            glXMakeCurrent(xGlobalDisplay, None, null);
            result = true;
         }
      }
      #endif
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

   #elif defined(__unix__) || defined(__APPLE__)
      #if defined(__ANDROID__)
         egl_term_display();
      #else
      if(oglSystem.visualInfo)
      {
   #ifdef   ECERE_MINIGLX
         __miniglx_XFree(oglSystem.visualInfo);
   #else
         XFree(oglSystem.visualInfo);
   #endif
      }

      if(oglSystem.glxDrawable)
      {
         XDestroyWindow(xGlobalDisplay, oglSystem.glxDrawable);
         oglSystem.glxDrawable = 0;
      }
      #endif
   #endif
      delete oglSystem;
   }

   bool CreateDisplay(Display display)
   {
      bool result = false;
      OGLDisplay oglDisplay = display.driverData;
#if !defined(__ANDROID__)
      OGLSystem oglSystem = display.displaySystem.driverData;
#endif
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
   #elif defined(__unix__) || defined(__APPLE__)
      #if defined(__ANDROID__)
      #else
         XVisualInfo * visualInfo = ((XWindowData)display.windowDriverData).visual;
         /*
#if defined(__APPLE__)
         XVisualInfo template = { 0 };
         XWindowAttributes winAttr;
         int n;
         XGetWindowAttributes(xGlobalDisplay, (X11Window)display.window, &winAttr);
         template.visualid = XVisualIDFromVisual(winAttr.visual);
         visualInfo = XGetVisualInfo(xGlobalDisplay, VisualIDMask, &template, &n);
#ifdef _DEBUG
         printf("XGetVisualInfo visual ID = %d\n", template.visualid);
         printf("visualInfo visual ID = %d\n", visualInfo->visualid);
         printf("oglSystem.visualInfo visual ID = %d\n", oglSystem.visualInfo->visualid);
         printf("((XWindowData)display.windowDriverData).visual visual ID = %d\n", ((XWindowData)display.windowDriverData).visual->visualid);
#endif
         // visualInfo = oglSystem.visualInfo;
//#endif
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
            glXMakeCurrent(xGlobalDisplay, (GLXDrawable)display.window, oglDisplay.glContext);
            result = true;
         }
      #endif
   #endif
      }
#if defined(__WIN32__) || defined(USEPBUFFER)
      else
         result = true;
#endif
      if(result)
      {
#if defined(__WIN32__)
         if(glBlendFuncSeparate)
            glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
         else
            glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
#else
#if !defined(__OLDX__)
          glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
#else
         glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
#endif
#endif
         glEnable(GL_BLEND);

         glMatrixMode(GL_MODELVIEW);
         glScaled(1.0, 1.0, -1.0);
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
#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA)
      display.ambient = Color { 50,50,50 };
#endif

      if(!useSingleGLContext)
      {
   #if defined(__WIN32__)
         wglMakeCurrent(null, null);
   #elif defined(__unix__) || defined(__APPLE__)
      #if defined(__ANDROID__)
         result = true;
      #else
         glXMakeCurrent(xGlobalDisplay, None, null);
      #endif
   #endif
      }

      return result;
   }

   bool DisplaySize(Display display, int width, int height)
   {
      OGLDisplay oglDisplay = display.driverData;

      bool result = false;

      //printf("Inside DisplaySize\n");
#if defined(__WIN32__) || defined(USEPBUFFER)
      OGLSystem oglSystem = display.displaySystem.driverData;
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
#elif defined(__unix__) || defined(__APPLE__)
      #if defined(__ANDROID__)
         result = true;
      #else
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
                  glXMakeCurrent(xGlobalDisplay, (GLXDrawable)display.window, oglDisplay.glContext);

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
#endif
         CreateDisplay(display);
#if defined(__WIN32__)
         wglMakeCurrent(oglDisplay.hdc, oglDisplay.glrc);
#elif defined(__unix__) || defined(__APPLE__)
      #if defined(__ANDROID__)
         width = eglWidth;
         height = eglHeight;
      #else
         glXMakeCurrent(xGlobalDisplay, (GLXDrawable)display.window, oglDisplay.glContext);
      #endif
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
#ifdef _GLES
         result = true;
#else
         oglDisplay.flippingBuffer = renew oglDisplay.flippingBuffer ColorAlpha [width * height];
#endif
      }
      if(oglDisplay.flippingBuffer || !width || !height)
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
#if defined(__WIN32__) || defined(USEPBUFFER)
      OGLDisplay oglDisplay = display.driverData;
#endif
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
#elif defined(__unix__) || defined(__APPLE__)
      #if defined(__ANDROID__)
      #else
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
            XShapeCombineMask(xGlobalDisplay, (X11Window)display.window, ShapeInput, 0, 0, oglDisplay.shapePixmap, ShapeSet);
            #else
            XShapeCombineMask(xGlobalDisplay, display.window, 2, 0, 0, oglDisplay.shapePixmap, ShapeSet);
            #endif
            XFlush(xGlobalDisplay);
     #endif
#endif
         }
      }
      else
#endif
      {
#if defined(__WIN32__)
         //wglSwapLayerBuffers(oglDisplay.hdc,WGL_SWAP_MAIN_PLANE);
         SwapBuffers(oglDisplay.hdc);
#elif defined(__unix__) || defined(__APPLE__)
      #if defined(__ANDROID__)
         eglSwapBuffers(eglDisplay, eglSurface);
      #else
         glXSwapBuffers(xGlobalDisplay, (GLXDrawable)display.window);
      #endif
#endif
      }
      //Logf("Out of DisplayScreen\n");
   }

   void FreeBitmap(DisplaySystem displaySystem, Bitmap bitmap)
   {
      if(bitmap.driverData)
      {
         GLuint tex = (GLuint)(uintptr)bitmap.driverData;
         glDeleteTextures(1, &tex);
         bitmap.driverData = 0;
      }
      bitmap.driver = ((subclass(DisplayDriver))class(LFBDisplayDriver));
   }

   bool AllocateBitmap(DisplaySystem displaySystem, Bitmap bitmap, int width, int height, int stride, PixelFormat format, bool allocatePalette)
   {
      OGLSystem oglSystem = displaySystem.driverData;
      bool result = false;
      Bitmap mipMap { };
      GLuint glBitmap = 0;

      uint w = width, h = height;
      if(oglSystem.pow2textures)
      {
         w = pow2i(w);
         h = pow2i(h);
      }
      w = Min(w, oglSystem.maxTextureSize);
      h = Min(h, oglSystem.maxTextureSize);

      glGenTextures(1, &glBitmap);
      glBindTexture(GL_TEXTURE_2D, glBitmap);

      glPixelStorei( GL_UNPACK_ALIGNMENT, 1 );

      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
      glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

      glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);

      mipMap.Allocate(null, w, h, w, pixelFormatRGBA, false);

      // glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, mipMap.picture);
      glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, mipMap.picture);

      delete mipMap;

      bitmap.driverData = (void *)(uintptr)glBitmap;
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
         uint w = bitmap.width, h = bitmap.height;
         GLuint glBitmap = 0;
         if(oglSystem.pow2textures)
         {
            w = pow2i(w);
            h = pow2i(h);
         }
         w = Min(w, oglSystem.maxTextureSize);
         h = Min(h, oglSystem.maxTextureSize);

         if(mipMaps)
         {
            while(w * 2 < h) w *= 2;
            while(h * 2 < w) h *= 2;
         }

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
         if(glBitmap == 0)
         {
            //int error = glGetError();
            return false;
         }

         glBindTexture(GL_TEXTURE_2D, glBitmap);
         glPixelStorei( GL_UNPACK_ALIGNMENT, 1 );

         glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, mipMaps ? GL_LINEAR_MIPMAP_LINEAR : GL_LINEAR);
         glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

         //glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

         //glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
         //glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);

         glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
         glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

         glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);

         result = true;

         for(level = 0; result && (w >= 1 || h >= 1); level++, w >>= 1, h >>= 1)
         {
            Bitmap mipMap;
            if(!w) w = 1;
            if(!h) h = 1;
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
               // glTexImage2D(GL_TEXTURE_2D, level, GL_RGBA8, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, mipMap.picture);
               glTexImage2D(GL_TEXTURE_2D, level, GL_RGBA, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, mipMap.picture);
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
         bitmap.driverData = (void *)(uintptr)glBitmap;
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

   void DrawLine(Display display, Surface surface, int _x1, int _y1, int _x2, int _y2)
   {
      OGLSurface oglSurface = surface.driverData;
      float x1 = _x1, x2 = _x2, y1 = _y1, y2 = _y2;
      if(_x1 == _x2)
      {
         if(_y2 >= _y1)
            y2 += 1;
         else
            y1 += 1;
      }
      else if(_y1 == _y2)
      {
         if(_x2 >= _x1)
            x2 += 1;
         else
            x1 += 1;
      }
      x1 += surface.offset.x;
      y1 += surface.offset.y;
      x2 += surface.offset.x;
      y2 += surface.offset.y;

      //Logf("Line\n");

      glColor4fv(oglSurface.foreground);
      glBegin(GL_LINES);
#ifdef _GLES
      if(stippleEnabled)
      {
         glTexCoord2f(0.5f, 0);
         glVertex2f(x1 + 0.5f, y1 + 0.5f);
         glTexCoord2f(Max(x2-x1, y2-y1) + 0.5f, 0);
         glVertex2f(x2 + 0.5f, y2 + 0.5f);
      }
      else
#endif
      {
         /*
         glVertex2i(x1, y1);
         glVertex2i(x2, y2);
         */
         glVertex2f(x1 + 0.5f, y1 + 0.5f);
         glVertex2f(x2 + 0.5f, y2 + 0.5f);
      }

      glEnd();
   }

   void Rectangle(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      OGLSurface oglSurface = surface.driverData;
      x1 += surface.offset.x;
      y1 += surface.offset.y;
      x2 += surface.offset.x;
      y2 += surface.offset.y;

      //Logf("Rectangle\n");

      glColor4fv(oglSurface.foreground);
#ifdef _GLES
      if(stippleEnabled)
      {
         glBegin(GL_LINES);

         glTexCoord2f(0.5f, 0);
         glVertex2f(x1 + 0.5f, y1 + 0.5f);
         glTexCoord2f(y2-y1 + 0.5f, 0);
         glVertex2f(x1 + 0.5f, y2 + 0.5f);

         glTexCoord2f(0.5f, 0);
         glVertex2f(x1 + 0.5f, y2 + 0.5f);
         glTexCoord2f(x2 - x1 + 0.5f, 0);
         glVertex2f(x2 + 0.5f, y2 + 0.5f);

         glTexCoord2f(0.5f, 0);
         glVertex2f(x2 + 0.5f, y2 + 0.5f);
         glTexCoord2f(y1 - y2 + 0.5f, 0);
         glVertex2f(x2 + 0.5f, y1 + 0.5f);

         glTexCoord2f(0.5f, 0);
         glVertex2f(x2 + 0.5f, y1 + 0.5f);
         glTexCoord2f(x1 - x2 + 0.5f, 0);
         glVertex2f(x1 + 0.5f, y1 + 0.5f);
      }
      else
#endif
      {
         glBegin(GL_LINE_LOOP);
         /*
         glVertex2i(x1, y1);
         glVertex2i(x1, y2);
         glVertex2i(x2, y2);
         glVertex2i(x2, y1);
         */
         glVertex2f(x1 + 0.5f, y1 + 0.5f);
         glVertex2f(x1 + 0.5f, y2 + 0.5f);
         glVertex2f(x2 + 0.5f, y2 + 0.5f);
         glVertex2f(x2 + 0.5f, y1 + 0.5f);
      }
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
         glTranslated(oglSurface.xOffset / 64.0/*-0.375*/, 0.0, 0.0);

      glBindTexture(GL_TEXTURE_2D, (GLuint)(uintptr)bitmap.driverData);
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

         //glTranslate(0.375, 0.375, 0.0);
      }
      else if(oglSurface.xOffset)
         glTranslated(-oglSurface.xOffset / 64.0/*+0.375*/, 0.0, 0.0);

#if !defined(__OLDX__)
         /*if(glBlendFuncSeparate && !oglSurface.writingText)
            glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);*/
#endif
   }

   void Stretch(Display display, Surface surface, Bitmap bitmap, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      OGLSurface oglSurface = surface.driverData;

      //glTranslate(-0.375, -0.375, 0.0);

      //Logf("Stretch\n");

#if !defined(__OLDX__)
      /*if(glBlendFuncSeparate)
         glBlendFuncSeparate(GL_ONE, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);*/
#endif

      glEnable(GL_TEXTURE_2D);
      glBindTexture(GL_TEXTURE_2D, (GLuint)(uintptr)bitmap.driverData);

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

      //glTranslate(0.375, 0.375, 0.0);
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
      //bool flipX = false, flipY = false;

      //Logf("StretchDI\n");

      if(Sgn(w) != Sgn(sw))
      {
         w = Abs(w);
         sw = Abs(sw);
         //flipX = true;
      }
      if(Sgn(h) != Sgn(sh))
      {
         h = Abs(h);
         sh = Abs(sh);
         //flipY = true;
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
         glPixelStorei(GL_UNPACK_SKIP_PIXELS, 0);
         glPixelStorei(GL_UNPACK_SKIP_ROWS, 0);
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
         glPixelStorei(GL_UNPACK_SKIP_PIXELS, 0);
         glPixelStorei(GL_UNPACK_SKIP_ROWS, 0);
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

   Font LoadFont(DisplaySystem displaySystem, const char * faceName, float size, FontFlags flags)
   {
      Font font;
      OGLSystem oglSystem = displaySystem.driverData;
      oglSystem.loadingFont = true;
      font = ((subclass(DisplayDriver))class(LFBDisplayDriver)).LoadFont(displaySystem, faceName, size, flags);
      return font;
   }

   void FontExtent(DisplaySystem displaySystem, Font font, const char * text, int len, int * width, int * height)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).FontExtent(displaySystem, font, text, len, width, height);
   }

   void WriteText(Display display, Surface surface, int x, int y, const char * text, int len)
   {
      OGLSurface oglSurface = surface.driverData;
      OGLSystem oglSystem = display.displaySystem.driverData;
      oglSystem.loadingFont = true;

      //glTranslated(-0.375, -0.375, 0.0);

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

      //glTranslated(0.375, 0.375, 0.0);
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

   void TextExtent(Display display, Surface surface, const char * text, int len, int * width, int * height)
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
#if defined(_GLES)
         stippleEnabled = true;
         glesLineStipple(1, (uint16)stipple);
#else
         glLineStipple(1, (uint16)stipple);
         glEnable(GL_LINE_STIPPLE);
#endif
      }
      else
      {
#if defined(_GLES)
         stippleEnabled = false;
         glMatrixMode(GL_TEXTURE);
         glLoadIdentity();
         glMatrixMode(GL_PROJECTION);
         glDisable(GL_TEXTURE_2D);
#else
         glDisable(GL_LINE_STIPPLE);
#endif
      }
   }
#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA)
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
#if !defined(_GLES)
            glPolygonMode(GL_FRONT_AND_BACK, ((FillModeValue)value == solid) ? GL_FILL : GL_LINE);
#endif
            break;
         case depthTest:
            if(value) glEnable(GL_DEPTH_TEST); else glDisable(GL_DEPTH_TEST);
            break;
         case depthWrite:
            if(value) glDepthMask((byte)bool::true); else glDepthMask((byte)bool::false);
            oglDisplay.depthWrite = (bool)value;
            break;
         case fogColor:
         {
            float color[4] = { ((Color)value).r/255.0f, ((Color)value).g/255.0f, ((Color)value).b/255.0f, 1.0f };
            glFogfv(GL_FOG_COLOR, (float *)&color);
            break;
         }
         case fogDensity:
            glFogf(GL_FOG_DENSITY, (float)(RenderStateFloat { ui = value }.f * nearPlane));
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
            Matrix pickMatrix
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

         glScaled(1.0/nearPlane, 1.0/nearPlane, -1.0/nearPlane);

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

      GLBindBuffer(GL_ARRAY_BUFFER_ARB, 0);
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
      if(material.baseMap && (mesh.texCoords || mesh.flags.texCoords1))
      {
         Bitmap map = material.baseMap;
         glEnable(GL_TEXTURE_2D);
         glBindTexture(GL_TEXTURE_2D, (GLuint)(uintptr)map.driverData);

         glMatrixMode(GL_TEXTURE);
         glLoadIdentity();
         if(material.uScale && material.vScale)
            glScalef(material.uScale, material.vScale, 1);
         glMatrixMode(GL_MODELVIEW);

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
               GLDeleteBuffers(1, &oglMesh.vertices);
               oglMesh.vertices = 0;
            }
            delete mesh.vertices;
         }
         if(!mesh.flags.normals)
         {
            if(oglMesh.normals)
            {
               GLDeleteBuffers(1, &oglMesh.normals);
               oglMesh.normals = 0;
            }
            delete mesh.normals;
         }
         if(!mesh.flags.texCoords1)
         {
            if(oglMesh.texCoords)
            {
               GLDeleteBuffers(1, &oglMesh.texCoords);
               oglMesh.texCoords = 0;
            }
            delete mesh.texCoords;
         }
         if(!mesh.flags.texCoords2)
         {
            if(oglMesh.texCoords2)
            {
               GLDeleteBuffers(1, &oglMesh.texCoords2);
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
               GLDeleteBuffers(1, &oglMesh.colors);
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

   bool AllocateMesh(DisplaySystem displaySystem, Mesh mesh, MeshFeatures flags, int nVertices)
   {
      bool result = false;

      if(!mesh.data)
         mesh.data = OGLMesh { };
      if(mesh.data)
      {
         OGLMesh oglMesh = mesh.data;
         if(mesh.nVertices == nVertices)
         {
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
                  if(!oglMesh.vertices)
                     GLGenBuffers(1, &oglMesh.vertices);
               }
               if(!mesh.flags.normals && flags.normals)
               {
                  if(flags.doubleNormals)
                  {
                     mesh.normals = (Vector3Df *)new Vector3D[nVertices];
                  }
                  else
                     mesh.normals = new Vector3Df[nVertices];
                  if(!oglMesh.normals)
                     GLGenBuffers( 1, &oglMesh.normals);
               }
               if(!mesh.flags.texCoords1 && flags.texCoords1)
               {
                  mesh.texCoords = new Pointf[nVertices];
                  if(!oglMesh.texCoords)
                     GLGenBuffers( 1, &oglMesh.texCoords);
               }
               if(!mesh.flags.colors && flags.colors)
               {
                  mesh.colors = new ColorRGBAf[nVertices];
                  if(!oglMesh.colors)
                     GLGenBuffers( 1, &oglMesh.colors);
               }
            }
         }
         else
         {
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
               if(!oglMesh.vertices)
                  GLGenBuffers(1, &oglMesh.vertices);
            }
            if(flags.normals)
            {
               if(flags.doubleNormals)
               {
                  mesh.normals = (Vector3Df *)renew mesh.normals Vector3D[nVertices];
               }
               else
                  mesh.normals = renew mesh.normals Vector3Df[nVertices];
               if(!oglMesh.normals)
                  GLGenBuffers( 1, &oglMesh.normals);
            }
            if(flags.texCoords1)
            {
               mesh.texCoords = renew mesh.texCoords Pointf[nVertices];
               if(!oglMesh.texCoords)
                  GLGenBuffers( 1, &oglMesh.texCoords);
            }
            if(flags.colors)
            {
               mesh.colors = renew mesh.colors ColorRGBAf[nVertices];
               if(!oglMesh.colors)
                  GLGenBuffers( 1, &oglMesh.colors);
            }
         }
         result = true;
      }
      return result;
   }

   void UnlockMesh(DisplaySystem displaySystem, Mesh mesh, MeshFeatures flags)
   {
      OGLMesh oglMesh = mesh.data;
      if(!flags) flags = mesh.flags;

      if(vboAvailable)
      {
         if(flags.vertices && oglMesh.vertices)
         {
            GLBindBuffer(GL_ARRAY_BUFFER_ARB, oglMesh.vertices);
            GLBufferData( mesh.flags.doubleVertices ? GL_DOUBLE : GL_FLOAT, GL_ARRAY_BUFFER_ARB, mesh.nVertices * (mesh.flags.doubleVertices ? sizeof(Vector3D) : sizeof(Vector3Df)), mesh.vertices, GL_STATIC_DRAW_ARB );
         }

         if(flags.normals && oglMesh.normals)
         {
            GLBindBuffer(GL_ARRAY_BUFFER_ARB, oglMesh.normals);
            GLBufferData( mesh.flags.doubleNormals ? GL_DOUBLE : GL_FLOAT, GL_ARRAY_BUFFER_ARB, mesh.nVertices * (mesh.flags.doubleNormals ? sizeof(Vector3D) : sizeof(Vector3Df)), mesh.normals, GL_STATIC_DRAW_ARB );
         }

         if(flags.texCoords1 && oglMesh.texCoords)
         {
            GLBindBuffer(GL_ARRAY_BUFFER_ARB, oglMesh.texCoords);
            GLBufferData( GL_FLOAT, GL_ARRAY_BUFFER_ARB, mesh.nVertices * sizeof(Pointf), mesh.texCoords, GL_STATIC_DRAW_ARB );
         }

         if(flags.colors && oglMesh.colors)
         {
            GLBindBuffer( GL_ARRAY_BUFFER_ARB, oglMesh.colors);
            GLBufferData( GL_FLOAT, GL_ARRAY_BUFFER_ARB, mesh.nVertices * sizeof(ColorRGBAf), mesh.colors, GL_STATIC_DRAW_ARB );
         }

         GLBindBuffer( GL_ARRAY_BUFFER_ARB, 0);
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
            GLDeleteBuffers(1, &oglIndices.buffer);
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
         GLGenBuffers( 1, &oglIndices.buffer);
         oglIndices.nIndices = nIndices;
      }
      return oglIndices;
   }

   void UnlockIndices(DisplaySystem displaySystem, OGLIndices oglIndices, bool indices32bit, int nIndices)
   {
      if(vboAvailable)
      {
         GLBindBuffer( GL_ELEMENT_ARRAY_BUFFER_ARB, oglIndices.buffer);
         GLBufferData( indices32bit ? GL_UNSIGNED_INT : GL_UNSIGNED_SHORT, GL_ELEMENT_ARRAY_BUFFER_ARB, nIndices * (indices32bit ? sizeof(uint32) : sizeof(uint16)),
            oglIndices.indices, GL_STATIC_DRAW_ARB);
         GLBindBuffer( GL_ELEMENT_ARRAY_BUFFER_ARB, 0);
      }
   }

   uint16 * LockIndices(DisplaySystem displaySystem, OGLIndices oglIndices)
   {

      return oglIndices.indices;
   }

   void SelectMesh(Display display, Mesh mesh)
   {
      //Logf("SelectMesh\n");

#if !defined( __ANDROID__) && !defined(__APPLE__)

#if defined(__WIN32__)
      if(glUnlockArraysEXT)
#endif
         if(!vboAvailable && display.display3D.mesh)
            glUnlockArraysEXT();

#endif
      if(mesh)
      {
         OGLMesh oglMesh = mesh.data;

         // *** Vertex Stream ***
         glEnableClientState(GL_VERTEX_ARRAY);
         if(!display.display3D.collectingHits && oglMesh)
         {
            GLBindBuffer(GL_ARRAY_BUFFER_ARB, oglMesh.vertices );
            if(mesh.flags.doubleVertices)
               glVertexPointerd(3, 0, (double *)(vboAvailable ? null : mesh.vertices), mesh.nVertices);
            else
               glVertexPointer(3, GL_FLOAT, 0, vboAvailable ? null : mesh.vertices);

            // *** Normals Stream ***
            if(mesh.normals || mesh.flags.normals)
            {
               glEnableClientState(GL_NORMAL_ARRAY);
               GLBindBuffer(GL_ARRAY_BUFFER_ARB, oglMesh.normals);
               glNormalPointer(/*mesh.flags.doubleNormals ? GL_DOUBLE : */GL_FLOAT, 0, vboAvailable ? null : mesh.normals);
            }
            else
               glDisableClientState(GL_NORMAL_ARRAY);

            // *** Texture Coordinates Stream ***
            if(mesh.texCoords || mesh.flags.texCoords1)
            {
               glEnableClientState(GL_TEXTURE_COORD_ARRAY);
               GLBindBuffer( GL_ARRAY_BUFFER_ARB, oglMesh.texCoords);
               glTexCoordPointer(2, GL_FLOAT, 0, vboAvailable ? null : mesh.texCoords);
            }
            else
               glDisableClientState(GL_TEXTURE_COORD_ARRAY);

            // *** Color Stream ***
            if(mesh.colors || mesh.flags.colors)
            {
               glEnableClientState(GL_COLOR_ARRAY);
               GLBindBuffer( GL_ARRAY_BUFFER_ARB, oglMesh.colors);
               glColorPointer(4, GL_FLOAT, 0, vboAvailable ? null : mesh.colors);
            }
            else
               glDisableClientState(GL_COLOR_ARRAY);

         }
         else
         {
            GLBindBuffer( GL_ARRAY_BUFFER_ARB, 0);
            if(mesh.flags.doubleVertices)
               glVertexPointerd(3, 0, (double *)mesh.vertices, mesh.nVertices);
            else
               glVertexPointer(3, GL_FLOAT, 0, mesh.vertices);
            if((mesh.normals || mesh.flags.normals) && !display.display3D.collectingHits)
            {
               glEnableClientState(GL_NORMAL_ARRAY);
               glNormalPointer(/*mesh.flags.doubleNormals ? GL_DOUBLE : */GL_FLOAT, 0, mesh.normals);
            }
            else
               glDisableClientState(GL_NORMAL_ARRAY);
            if((mesh.texCoords || mesh.flags.texCoords1) && !display.display3D.collectingHits)
            {
               glEnableClientState(GL_TEXTURE_COORD_ARRAY);
               glTexCoordPointer(2, GL_FLOAT, 0, mesh.texCoords);
            }
            else
               glDisableClientState(GL_TEXTURE_COORD_ARRAY);
            if((mesh.colors || mesh.flags.colors) && !display.display3D.collectingHits)
            {
               glEnableClientState(GL_COLOR_ARRAY);
               glColorPointer(4, GL_FLOAT, 0, mesh.colors);
            }
            else
               glDisableClientState(GL_COLOR_ARRAY);
         }

#if !defined(__ANDROID__) && !defined(__APPLE__)

#if defined(__WIN32__)
         if(glLockArraysEXT)
#endif
            if(!vboAvailable)
               glLockArraysEXT(0, mesh.nVertices);

#endif
      }
      else
         GLBindBuffer(GL_ARRAY_BUFFER_ARB, 0);
   }

   void DrawPrimitives(Display display, PrimitiveSingle * primitive, Mesh mesh)
   {
      //Logf("DrawPrimitives\n");

      if(primitive->type.vertexRange)
         glDrawArrays(primitiveTypes[primitive->type.primitiveType], primitive->first, primitive->nVertices);
      else
      {
         //    *** Hoping the data won't be uploaded at all (Won't really work if another group of the mesh is using the mesh ) ***
         // HACK TO SPEED THINGS UP...
#ifndef __ANDROID__
         /*GLBindBuffer(GL_ELEMENT_ARRAY_BUFFER_ARB, 0);
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
                  uint16 index = ((uint16 *) oglIndices.indices)[c];
                  if(flags.normals) glNormal3fv((float *)&mesh.normals[index]);
                  if(flags.texCoords1) glTexCoord2fv((float *)&mesh.texCoords[index]);
                  if(flags.colors) glColor4fv((float *)&mesh.colors[index]);
                  glVertex3fv((float *)&mesh.vertices[index]);
               }
            }
            glEnd();
         }
         else*/
#endif
         {
            OGLIndices oglIndices = primitive->data;

            if(!display.display3D.collectingHits && vboAvailable && oglIndices)
            {
               GLBindBuffer(GL_ELEMENT_ARRAY_BUFFER_ARB, oglIndices.buffer);
               if(primitive->type.indices32bit)
                  glDrawElementsi(primitiveTypes[primitive->type.primitiveType], primitive->nIndices, 0);
               else
                  glDrawElements(primitiveTypes[primitive->type.primitiveType], primitive->nIndices, GL_UNSIGNED_SHORT, 0);
               GLBindBuffer(GL_ELEMENT_ARRAY_BUFFER_ARB, 0);
            }
            else
            {
               if(primitive->type.indices32bit)
                  glDrawElementsi(primitiveTypes[primitive->type.primitiveType], primitive->nIndices,
                     oglIndices ? oglIndices.indices : primitive->indices);
               else
                  glDrawElements(primitiveTypes[primitive->type.primitiveType], primitive->nIndices,
                     GL_UNSIGNED_SHORT, oglIndices ? oglIndices.indices : primitive->indices);
            }
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
         glScaled(1.0/nearPlane, 1.0/nearPlane, -1.0/nearPlane);
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

public void UseSingleGLContext(bool useSingle)
{
   useSingleGLContext = useSingle;
}

default dllexport void *
#if defined(__WIN32__)
__attribute__((stdcall))
#endif
IS_GLGetContext(DisplaySystem displaySystem)
{
   if(displaySystem)
   {
#if defined(__WIN32__)
      OGLSystem system = displaySystem.driverData;
      return system.glrc;
#elif !defined(__ANDROID__)
      OGLSystem system = displaySystem.driverData;
      return system.glContext;
#else
      return eglContext;
#endif
   }
   return null;
}

#endif
