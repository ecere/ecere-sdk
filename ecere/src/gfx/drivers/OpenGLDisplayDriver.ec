// #define DIAGNOSTICS

namespace gfx::drivers;

#if !defined(_GLES)  // OpenGL ES 1
   #define SHADERS
#endif

#if !defined(__ANDROID__) && !defined(__EMSCRIPTEN__) && !defined(__ODROID__)
#  if defined(SHADERS)
#     include "gl_core_3_3.h"
#  else
#     include "gl_compat_4_4.h"
#  endif
#endif

#if defined(__ANDROID__) || defined(__ODROID__)
import "egl"
#endif

import "glab"
import "immediate"
import "matrixStack"
import "shading"

#define GL_BGRA_EXT  0x80E1

#ifdef SHADERS

#undef glEnableClientState
#undef glDisableClientState
#undef GL_VERTEX_ARRAY
#undef GL_NORMAL_ARRAY
#undef GL_TEXTURE_COORD_ARRAY
#undef GL_COLOR_ARRAY

#define glEnableClientState      glEnableVertexAttribArray
#define glDisableClientState     glDisableVertexAttribArray
#define GL_VERTEX_ARRAY          GLBufferContents::vertex
#define GL_NORMAL_ARRAY          GLBufferContents::normal
#define GL_TEXTURE_COORD_ARRAY   GLBufferContents::texCoord
#define GL_COLOR_ARRAY           GLBufferContents::color

#endif

// We were using PBUFFER for alpha compositing on Linux before, but it does not seem to work, nor be required anymore.
// #define USEPBUFFER
#if defined(__unix__) || defined(__APPLE__)

   #if !defined(__MINGW32__)
      #define GL_GLEXT_PROTOTYPES
   #endif

   #define pointer _pointer


   #if !defined(__ANDROID__) && !defined(__ODROID__) && !defined(__EMSCRIPTEN__)

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
      #define Glyph     X11Glyph
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
      #undef Glyph
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
      //#define WIN32_LEAN_AND_MEAN
      #undef _WIN32_WINNT
      #define _WIN32_WINNT 0x0502
      #define String Sting_
      #include <windows.h>
      #undef String
   #endif

   #if defined(__ANDROID__) || defined(__ODROID__)
      #if defined(__ODROID__) && !defined(_GLES)
         #define _GLES
      #endif

      #define uint _uint
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
      #define Bool      X11Bool

      #include <GLES/gl.h>

      #undef Bool
      #undef Picture
      #undef Window
      #undef Cursor
      #undef Font
      #undef Display
      #undef Time
      #undef KeyCode
      #undef uint
      #undef new
      #undef property
      #undef class

   #elif defined(__EMSCRIPTEN__)
#if !defined(_GLES2)
      #define _GLES2
#endif
      // #define _GLES

      #define property _property
      #define uint _uint

      //#include <GL/gl.h>
      //#include <GLES/gl.h>
      #include <GLES2/gl2.h>

      #include <emscripten/emscripten.h>
      #include <emscripten/html5.h>

      #undef property
      #undef uint

   #else
      #include <GL/gl.h>
   #endif

   #undef pointer

   import "Display"

   #if defined(__unix__) || defined(__APPLE__)

   #if !defined(__ANDROID__) && !defined(__ODROID__) && !defined(__EMSCRIPTEN__)
   import "XInterface"
   #endif

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
   #include "wglDefs.h"

   typedef void (APIENTRY * PFNGLLOCKARRAYSEXTPROC) (GLint first, GLsizei count);
   typedef void (APIENTRY * PFNGLUNLOCKARRAYSEXTPROC) (void);

   static PFNGLLOCKARRAYSEXTPROC glLockArraysEXT = null;
   static PFNGLUNLOCKARRAYSEXTPROC glUnlockArraysEXT = null;

   static PFNWGLCHOOSEPIXELFORMATARBPROC wglChoosePixelFormatARB = null;
   static PFNWGLGETEXTENSIONSSTRINGARBPROC wglGetExtensionsStringARB = null;
   static PFNWGLCREATEPBUFFERARBPROC wglCreatePbufferARB = null;
   static PFNWGLGETPBUFFERDCARBPROC wglGetPbufferDCARB = null;
   static PFNWGLQUERYPBUFFERARBPROC wglQueryPbufferARB = null;
   static PFNWGLDESTROYPBUFFERARBPROC wglDestroyPbufferARB = null;
   static PFNWGLRELEASEPBUFFERDCARBPROC wglReleasePbufferDCARB = null;
   static PFNWGLBINDTEXIMAGEARBPROC wglBindTexImageARB = null;
   static PFNWGLRELEASETEXIMAGEARBPROC wglReleaseTexImageARB = null;
   static PFNWGLSWAPINTERVALEXTPROC wglSwapIntervalEXT = null;
   static PFNWGLCREATECONTEXTATTRIBSARBPROC wglCreateContextAttribsARB = null;

#else

#if !defined(__ANDROID__) && !defined(__APPLE__) && !defined(__ODROID__) && !defined(__EMSCRIPTEN__)
default:
   GLAPI void APIENTRY glLockArraysEXT (GLint first, GLsizei count);
   GLAPI void APIENTRY glUnlockArraysEXT (void);
private:
#endif

#if defined(__ANDROID__) || defined(__ODROID__)
   #define GL_FRAMEBUFFER           GL_FRAMEBUFFER_OES
   #define GL_RENDERBUFFER          GL_RENDERBUFFER_OES
   #define GL_COLOR_ATTACHMENT0     GL_COLOR_ATTACHMENT0_OES
   #define GL_BGRA_EXT           0
#endif

#if defined(__ANDROID__) || defined(__ODROID__) || defined(__EMSCRIPTEN__)

   #define GL_POLYGON_STIPPLE 0xFFFF
   #define GL_LINE_STIPPLE 0xFFFF
   #define GL_LINE 0xFFFF
   #define GL_FILL 0xFFFF
   #define GL_ALL_ATTRIB_BITS 0xFFFF
   #define GL_LIGHT_MODEL_LOCAL_VIEWER 0xFFFF

   #define GL_POLYGON      9
   #define GL_QUADS        7

   //#define GL_QUADS              0
   #define GL_QUAD_STRIP         0
   //#define GL_DOUBLE             0
   //#define GL_UNSIGNED_INT       0
   //#define GL_FILL               0
   //#define GL_LINE               0
   //#define GL_LINE_STIPPLE       0
   #define GL_UNPACK_ROW_LENGTH  0
   #define GL_UNPACK_SKIP_PIXELS 0
   #define GL_UNPACK_SKIP_ROWS   0
   #define GL_RGBA8              0
   #define GL_PACK_ROW_LENGTH    0
   #define GL_PACK_SKIP_ROWS     0
   #define GL_PACK_SKIP_PIXELS   0
#endif

#endif


#if defined(__ANDROID__) || defined(__ODROID__)
   #define glBindFramebuffer        glBindFramebufferOES
   #define glBindRenderbuffer       glBindRenderbufferOES
   #define glFramebufferTexture2D   glFramebufferTexture2DOES
   #define glGenFramebuffers        glGenFramebuffersOES
   #define glGenRenderbuffers       glGenRenderbuffersOES
   #define glDeleteFramebuffers     glDeleteFramebuffersOES
   #define glDeleteRenderbuffers    glDeleteRenderbuffersOES
#endif

#if defined(__ANDROID__) || defined(__ODROID__) || defined(__EMSCRIPTEN__)
   #define GL_INT                                  0x1404
   #define GL_UNSIGNED_INT                         0x1405
   #define GL_DOUBLE                               0x140A
   #define APIENTRY
#endif

#if defined(_GLES) || defined(_GLES2) || defined(SHADERS)

   #undef glRecti
   #undef glBegin
   #undef glTexCoord2i
   #undef glVertex2i
   #undef glTexCoord2d
   #undef glVertex2d
   #undef glTexCoord2f
   #undef glVertex2f
   #undef glEnd
   #undef glColor3f
   #undef glColor4ub
   #undef glColor4fv
   #undef glNormal3fv
   #undef glNormal3f
   #undef glTexCoord2fv
   #undef glVertex3d
   #undef glVertex3dv
   #undef glVertex3f
   #undef glVertex3fv

   #undef glLoadMatrixd
   #undef glMultMatrixd
   #undef glFrustum
   #undef glOrtho
   #undef glScaled
   #undef glScalef
   #undef glTranslated
   #undef glRotated
   #undef glMatrixMode
   #undef glLoadIdentity
   #undef glPushMatrix
   #undef glPopMatrix

   #undef glLineStipple
   #undef glColorMaterial
   #undef glLightModeli

   #define glRecti               glimtkRecti
   #define glBegin               glimtkBegin
   #define glTexCoord2i          glimtkTexCoord2i
   #define glVertex2i            glimtkVertex2i
   #define glTexCoord2d          glimtkTexCoord2d
   #define glVertex2d            glimtkVertex2d
   #define glTexCoord2f          glimtkTexCoord2f
   #define glVertex2f            glimtkVertex2f
   #define glEnd                 glimtkEnd
   #define glColor3f             glimtkColor3f
   #define glColor4ub            glimtkColor4ub
   #define glColor4fv            glimtkColor4fv
   #define glNormal3fv           glimtkNormal3fv
   #define glNormal3f            glimtkNormal3f
   #define glTexCoord2fv         glimtkTexCoord2fv
   #define glVertex3d            glimtkVertex3d
   #define glVertex3dv           glimtkVertex3dv
   #define glVertex3f            glimtkVertex3f
   #define glVertex3fv           glimtkVertex3fv

   #define glLoadMatrixd         glmsLoadMatrixd
   #define glMultMatrixd         glmsMultMatrixd
   #define glFrustum             glmsFrustum
   #define glOrtho               glmsOrtho
   #define glScaled              glmsScaled
   #define glScalef              glmsScaled
   #define glTranslated          glmsTranslated
   #define glRotated             glmsRotated
   #define glMatrixMode          glmsMatrixMode
   #define glLoadIdentity        glmsLoadIdentity
   #define glPushMatrix          glmsPushMatrix
   #define glPopMatrix           glmsPopMatrix

   #define glLineStipple         glesLineStipple
   #define glColorMaterial       glesColorMaterial
   #define glLightModeli         glesLightModeli

#endif

public void glesColorMaterial(int a, int b)
{
   PrintLn("glColorMaterial stub");
}

static GLuint stippleTexture;
#if defined(_GLES) || defined(_GLES2) || defined(SHADERS)
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

   // TOOD: Special shading code for stippling?
   GLSetupTexturing(true);
   glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
   glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
   glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
   glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
   glMatrixMode(GL_TEXTURE);
   glLoadIdentity();
   //glTranslated(1.0/backAttrib->texW/2.0f, 1.0/backAttrib->texH/2.0f, 0.0f);
   glScaled(i/16.0, 1, 1.0f);
   glTranslated(0.5, 0.5, 0);
   glMatrixMode(MatrixMode::projection);
}

public void glesLightModeli( unsigned int pname, int param )
{
#if !defined(SHADERS)
   if(pname == GL_LIGHT_MODEL_TWO_SIDE)
      glLightModelf(GL_LIGHT_MODEL_TWO_SIDE, param);
#endif
}

#if defined(__ANDROID__) || defined(__ODROID__) || defined(__EMSCRIPTEN__)
void glClearDepth( double depth ) { glClearDepthf((float)depth); }
#endif

#if defined(__ANDROID__) || defined(__ODROID__)
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

#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA)
static int primitiveTypes[RenderPrimitiveType] =
{
   GL_POINTS, GL_LINES, GL_TRIANGLES, GL_TRIANGLE_STRIP, GL_TRIANGLE_FAN,
#if defined(SHADERS) || defined(_GLES) || defined(_GLES2)
   GL_TRIANGLE_FAN,     // NOTE: This will only work for single quads
#else
   GLIMTKMode::quads,
#endif
   GLIMTKMode::quadStrip,
   GL_LINE_STRIP
};
#endif

public void GLSetupTexturing(bool enable)
{
#ifdef SHADERS
   shader_texturing(enable);
#else
   (enable ? glEnable : glDisable)(GL_TEXTURE_2D);
#endif
}

public void GLSetupFog(bool enable)
{
#ifdef SHADERS
   shader_fog(enable);
#else
   (enable ? glEnable : glDisable)(GL_FOG);
#endif
}

bool lightingEnabled;

public void GLSetupLighting(bool enable)
{
   lightingEnabled = enable;
#if defined(SHADERS)
   shader_lighting(enable);
#else
   (enable ? glEnable : glDisable)(GL_LIGHTING);
#endif
}

// Non OpenGL ES friendly stuff

#if defined(_GLES) || defined(_GLES2)

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

/*static */bool vboAvailable;

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
#elif !defined(__ANDROID__) && !defined(__ODROID__) && !defined(__EMSCRIPTEN__)
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

#if defined(_DEBUG) && !defined(__ANDROID__) && !defined(__EMSCRIPTEN__) && !defined(__ODROID__)
//#define GL_DEBUGGING
#endif

#ifdef GL_DEBUGGING
static void APIENTRY openglCallbackFunction(GLenum source,
                                           GLenum type,
                                           GLuint id,
                                           GLenum severity,
                                           GLsizei length,
                                           const GLchar* message,
                                           const void* userParam)
{
   PrintLn("---------------------opengl-callback-start------------");
   PrintLn("message: ", message);
   PrintLn("type: ");
   switch (type)
   {
      case GL_DEBUG_TYPE_ERROR: PrintLn("ERROR"); break;
      case GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR: PrintLn("DEPRECATED_BEHAVIOR"); break;
      case GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR: PrintLn("UNDEFINED_BEHAVIOR"); break;
      case GL_DEBUG_TYPE_PORTABILITY: PrintLn("PORTABILITY"); break;
      case GL_DEBUG_TYPE_PERFORMANCE: PrintLn("PERFORMANCE"); break;
      case GL_DEBUG_TYPE_OTHER: PrintLn("OTHER"); break;
   }

   PrintLn("id: ", id);
   Print("severity: ");
   switch (severity)
   {
      case GL_DEBUG_SEVERITY_LOW: PrintLn("LOW"); break;
      case GL_DEBUG_SEVERITY_MEDIUM: PrintLn("MEDIUM"); break;
      case GL_DEBUG_SEVERITY_HIGH: PrintLn("HIGH"); break;
      default: PrintLn("(other)");
   }
   PrintLn("---------------------opengl-callback-end--------------");
}
#endif

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
#elif defined(__EMSCRIPTEN__)
   EMSCRIPTEN_WEBGL_CONTEXT_HANDLE glc;
#elif !defined(__ANDROID__) && !defined(__ODROID__)
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
   bool writingOutline;

   float foreground[4], background[4], bitmapMult[4];
} OGLSurface;

class OGLMesh : struct
{
   GLAB vertices;
   GLAB normals;
   GLAB texCoords;
   GLAB texCoords2;
   GLAB colors;
};

class OGLIndices : struct
{
   uint16 * indices;
   GLEAB buffer;
   uint nIndices;
};

int current;
void * previous;

#ifdef GL_DEBUGGING
static void setupDebugging()
{
   if(glDebugMessageCallback)
   {
      GLuint unusedIds = 0;

      glEnable(GL_DEBUG_OUTPUT_SYNCHRONOUS);

      glDebugMessageCallback(openglCallbackFunction, null);
      glDebugMessageControl(GL_DONT_CARE,
          GL_DONT_CARE,
          GL_DONT_CARE,
          0,
          &unusedIds,
          GL_TRUE);
   }
}
#endif

#if defined(__WIN32__)
static HGLRC winCreateContext(HDC hdc)
{
   HGLRC result = 0;
#ifdef SHADERS
   if(wglCreateContextAttribsARB)
   {
      int attribs[] =
      {
         WGL_CONTEXT_MAJOR_VERSION_ARB, 4,
         WGL_CONTEXT_MINOR_VERSION_ARB, 4,
         WGL_CONTEXT_FLAGS_ARB, /*WGL_CONTEXT_FORWARD_COMPATIBLE_BIT_ARB | */WGL_CONTEXT_DEBUG_BIT_ARB,
         WGL_CONTEXT_PROFILE_MASK_ARB, WGL_CONTEXT_COMPATIBILITY_PROFILE_BIT_ARB /*WGL_CONTEXT_CORE_PROFILE_BIT_ARB*/,
         0,0
      };
      result = wglCreateContextAttribsARB(hdc, null, attribs);
      if(!result)
      {
         attribs[1] = 2;
         attribs[3] = 0;
         attribs[7] = 0;
         result = wglCreateContextAttribsARB(hdc, null, attribs);
      }
   }
#endif
   if(!result)
      result = wglCreateContext(hdc);
   return result;
}
#endif

class OpenGLDisplayDriver : DisplayDriver
{
   class_property(name) = "OpenGL";

   bool LockSystem(DisplaySystem displaySystem)
   {
#if defined(__EMSCRIPTEN__)
      OGLSystem oglSystem = displaySystem.driverData;
      emscripten_webgl_make_context_current(oglSystem.glc);
#elif !defined(__ANDROID__) && !defined(__ODROID__)
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
      GLABBindBuffer(GL_ARRAY_BUFFER, 0);
      GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
      return true;
   }

   void UnlockSystem(DisplaySystem displaySystem)
   {
      if(useSingleGLContext) return;
   #if defined(__WIN32__)
      wglMakeCurrent(null, null);
   #elif defined(__unix__) || defined(__APPLE__)
      // printf("Making NULL current\n");
      #if defined(__ANDROID__) || defined(__ODROID__) || defined(__EMSCRIPTEN__)
      #else
      glXMakeCurrent(xGlobalDisplay, None, null);
      #endif
      // previous = null;
   #endif
   }

   bool Lock(Display display)
   {
#if !defined(__ANDROID__) && !defined(__ODROID__) && !defined(__EMSCRIPTEN__)
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
      GLABBindBuffer(GL_ARRAY_BUFFER, 0);
      GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
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
      #if defined(__ANDROID__) || defined(__ODROID__) || defined(__EMSCRIPTEN__)
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
#ifdef DIAGNOSTICS
      printf("extensions: %s\n", extensions);
#endif

      oglSystem.pow2textures = (extensions && strstr(extensions, "GL_ARB_texture_non_power_of_two")) ? false : true;
      glGetIntegerv(GL_MAX_TEXTURE_SIZE, &oglSystem.maxTextureSize);
#ifdef DIAGNOSTICS
      PrintLn("max texture size: ", oglSystem.maxTextureSize);
#endif
   }

   bool CreateDisplaySystem(DisplaySystem displaySystem)
   {
      bool result = false;
      OGLSystem oglSystem = displaySystem.driverData = OGLSystem { };

#ifdef DIAGNOSTICS
      PrintLn("OpenGL driver's CreateDisplaySystem()");
#endif

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
               wglCreateContextAttribsARB = (void *)wglGetProcAddress("wglCreateContextAttribsARB");

               glLockArraysEXT = (void *) wglGetProcAddress("glLockArraysEXT" );
               glUnlockArraysEXT = (void *) wglGetProcAddress("glUnlockArraysEXT");

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
                     WGL_SAMPLES_ARB, 4,                  // Check For 4x Multisampling
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

#ifdef DIAGNOSTICS
                     PrintLn("winCreateContext()");
#endif
                     oglSystem.glrc = winCreateContext(oglSystem.hdc);
#ifdef DIAGNOSTICS
                     PrintLn("wglMakeCurrent()");
#endif
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
   #elif defined(__unix__) || defined(__APPLE__)
      vboAvailable = true;
      #if defined(__ANDROID__) || defined(__ODROID__)
         #if defined(__ANDROID__)
         egl_init_display(guiApp.desktop.windowHandle);
         #elif defined(__ODROID__)
         egl_init_display((uint)displaySystem.window);
         CheckExtensions(oglSystem);
         #endif

         // TODO: Clean this up? Needed here?
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

         glmsMatrixMode(GL_MODELVIEW);
         glScaled(1.0, 1.0, -1.0);
         glmsMatrixMode(GL_PROJECTION);
         glShadeModel(GL_FLAT);

         glLightModeli(GL_LIGHT_MODEL_COLOR_CONTROL, GL_SEPARATE_SPECULAR_COLOR);
         glFogi(GL_FOG_MODE, GL_EXP);
         glFogf(GL_FOG_DENSITY, 0);
         glEnable(GL_NORMALIZE);
         glDepthFunc(GL_LESS);
         glClearDepth(1.0);
         glDisable(GL_MULTISAMPLE_ARB);

         glViewport(0,0,eglWidth,eglHeight);
         glmsLoadIdentity();
         glOrtho(0,eglWidth,eglHeight,0,0.0,1.0);

         glabCurArrayBuffer = 0;
         glabCurElementBuffer = 0;

         result = true;
      #elif defined(__EMSCRIPTEN__)
         {
            EmscriptenWebGLContextAttributes attribs = { 0 };
            attribs.depth = 1;
            attribs.antialias = 1;

            /*
              EM_BOOL alpha;
              EM_BOOL depth;
              EM_BOOL stencil;
              EM_BOOL antialias;
              EM_BOOL premultipliedAlpha;
              EM_BOOL preserveDrawingBuffer;
              EM_BOOL preferLowPowerToHighPerformance;
              EM_BOOL failIfMajorPerformanceCaveat;
              int majorVersion;
              int minorVersion;
              EM_BOOL enableExtensionsByDefault;
              */

            emscripten_webgl_init_context_attributes(&attribs);
            oglSystem.pow2textures = true;
            oglSystem.maxTextureSize = 16384;
            oglSystem.glc = emscripten_webgl_create_context("canvas", &attribs);
            if(emscripten_webgl_make_context_current(oglSystem.glc) == EMSCRIPTEN_RESULT_SUCCESS)
               result = true;

            /*glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
            glEnable(GL_BLEND);*/
         }
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
            // CheckExtensions(oglSystem);
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
      if(stippleTexture)
      {
         glDeleteTextures(1, &stippleTexture);
         stippleTexture = 0;
      }

      glimtkTerminate();

   #if defined(__WIN32__)
      wglMakeCurrent( null, null );

      if(oglSystem.glrc)
         wglDeleteContext(oglSystem.glrc);

      if(oglSystem.hdc)
         ReleaseDC(oglSystem.hwnd, oglSystem.hdc);
      DestroyWindow(oglSystem.hwnd);

   #elif defined(__unix__) || defined(__APPLE__)
      #if defined(__ANDROID__) || defined(__ODROID__)
         egl_term_display();
      #elif defined(__EMSCRIPTEN__)
         emscripten_webgl_destroy_context(oglSystem.glc);
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

   static bool ::initialDisplaySetup(Display display)
   {
      bool result = true;
      #ifdef SHADERS
      loadShaders("<:ecere>shaders/fixed.vertex", "<:ecere>shaders/fixed.frag");
      #endif
      glEnableClientState(GL_VERTEX_ARRAY);

      GLABBindBuffer(GL_ARRAY_BUFFER, 0);
      GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);

#if defined(__WIN32__)
      if(glBlendFuncSeparate)
         glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
      else
         glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
#else
      glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
#endif
      glEnable(GL_BLEND);

      glMatrixMode(MatrixMode::modelView);
      glLoadIdentity(); // For setting up GLES stack
      glScaled(1.0, 1.0, -1.0);
      // glTranslatef(0.375f, 0.375f, 0.0f);
      // glTranslatef(-0.625f, -0.625f, 0.0f);
      glMatrixMode(MatrixMode::projection);
#if !defined(EM_MODE) && !defined(SHADERS)
      glShadeModel(GL_FLAT);

      // #define GL_LIGHT_MODEL_LOCAL_VIEWER 0x0B51

      // glLightModeli(GL_LIGHT_MODEL_LOCAL_VIEWER, GL_TRUE);

      glLightModeli(GL_LIGHT_MODEL_COLOR_CONTROL, GL_SEPARATE_SPECULAR_COLOR);
      glFogi(GL_FOG_MODE, GL_EXP);
      glFogf(GL_FOG_DENSITY, 0);
      glEnable(GL_NORMALIZE);
#endif
      glDepthFunc(GL_LESS);
      glClearDepth(1.0);
      glDisable(GL_MULTISAMPLE_ARB);
#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA)
      display.ambient = Color { 50,50,50 };
#endif
      return result;
   }

   bool CreateDisplay(Display display)
   {
      bool result = false;
      OGLDisplay oglDisplay = display.driverData;
#if !defined(__ANDROID__) && !defined(__ODROID__)
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
         if((oglDisplay.glrc = winCreateContext(oglDisplay.hdc)))
         {
            wglShareLists(oglSystem.glrc, oglDisplay.glrc);
            wglMakeCurrent(oglDisplay.hdc, oglDisplay.glrc);
            result = true;
         }
         else
            ReleaseDC(display.window, oglDisplay.hdc);
#elif defined(__unix__) || defined(__APPLE__)
#  if defined(__ANDROID__) || defined(__EMSCRIPTEN__) || defined(__ODROID__)
         result = true;
#  else
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
#  endif
#endif
      }
#if defined(__WIN32__) || defined(USEPBUFFER)
      else
      {
         result = true;
         wglMakeCurrent(oglSystem.hdc, oglSystem.glrc);
      }
#endif
      if(result)
      {
#if !defined(__ANDROID__) && !defined(__EMSCRIPTEN__) && !defined(__ODROID__)

#ifdef DIAGNOSTICS
         PrintLn("Calling ogl_LoadFunctions() in CreateDisplay()");
#endif
         if(ogl_LoadFunctions() == ogl_LOAD_FAILED)
            PrintLn("ogl_LoadFunctions() failed!");

#ifdef DIAGNOSTICS
         PrintLn("CheckExtensions()");
#endif
         CheckExtensions(oglSystem);
         vboAvailable = glBindBuffer != null;

#ifdef DIAGNOSTICS
         PrintLn("vboAvailable is: ", vboAvailable);
#endif

#  ifdef GL_DEBUGGING
         setupDebugging();
#  endif

#endif

#if defined(__EMSCRIPTEN__)
         emscripten_webgl_make_context_current(oglSystem.glc);
#endif

         initialDisplaySetup(display);
      }

      if(!useSingleGLContext)
      {
   #if defined(__WIN32__)
         wglMakeCurrent(null, null);
   #elif defined(__unix__) || defined(__APPLE__)
      #if defined(__ANDROID__) || defined(__ODROID__) || defined(__EMSCRIPTEN__)
         result = true;
      #else
         glXMakeCurrent(xGlobalDisplay, None, null);
      #endif
   #endif
      }
      else
      {
      #if defined(__ANDROID__) || defined(__EMSCRIPTEN__) || defined(__ODROID__)
         result = true;
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
               WGL_SAMPLES_ARB, 4,                  // Check For 4x Multisampling
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
         if((oglDisplay.glrc = winCreateContext(oglDisplay.hdc)))
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
      #if defined(__ANDROID__) || defined(__ODROID__) || defined(__EMSCRIPTEN__)
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
                                             #if !defined(__APPLE__)
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
      #if defined(__ANDROID__) || defined(__ODROID__)
         width = eglWidth;
         height = eglHeight;
      #elif defined(__EMSCRIPTEN__)
         emscripten_webgl_make_context_current(oglSystem.glc);
      #else
         glXMakeCurrent(xGlobalDisplay, (GLXDrawable)display.window, oglDisplay.glContext);
      #endif
#endif
      }
      else
#endif
         result = true;

      if(display.alphaBlend && result)
         initialDisplaySetup(display);

      if(!result && display.alphaBlend)
      {
         printf("Alpha blending windows not supported on this display\n");
      }
      if(!result)
         return false;

      result = false;

      glViewport(0,0,width,height);
      glMatrixMode(MatrixMode::projection);
      glLoadIdentity();
      glOrtho(0,width,height,0,0.0,1.0);
      displayWidth = display.width = width;
      displayHeight = display.height = height;

      if(!oglDisplay.flippingBuffer || oglDisplay.flipBufW < width || oglDisplay.flipBufH < height)
      {
         oglDisplay.flipBufW = width;
         oglDisplay.flipBufH = height;
#if defined(_GLES) || defined(_GLES2)
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

#if !defined(__ANDROID__)
      /*glFlush();
      glFinish();*/
#endif

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
      #if defined(__ANDROID__) || defined(__ODROID__) || defined(__EMSCRIPTEN__)
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
            #if !defined(__APPLE__)
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
         //ecere::sys::Sleep(0.1);
#elif defined(__unix__) || defined(__APPLE__)
      #if defined(__ANDROID__) || defined(__ODROID__)
         egl_swap_buffers();
      #elif defined(__EMSCRIPTEN__)
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

#if !defined(SHADERS)
      glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
#endif

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
      Bitmap convBitmap = bitmap;
      if(bitmap.keepData)
      {
         convBitmap = { };
         convBitmap.Copy(bitmap);
      }

      // Pre process the bitmap... First make it 32 bit
      if(/*bitmap.pixelFormat == pixelFormatRGBA || */convBitmap.Convert(null, pixelFormat888, null))
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
               ColorAlpha color = ((ColorAlpha *)convBitmap.picture)[c];
               ((ColorRGBA *)convBitmap.picture)[c] = ColorRGBA { color.color.r, color.color.g, color.color.b, color.a };
            }
         }
         // convBitmap.pixelFormat = pixelFormat888;

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
#ifdef GL_TEXTURE_MAX_ANISOTROPY_EXT
         glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAX_ANISOTROPY_EXT, 16.0 );
#endif

#if !defined(SHADERS)
         glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
#endif

         result = true;

         for(level = 0; result && (w >= 1 || h >= 1); level++, w >>= 1, h >>= 1)
         {
            Bitmap mipMap;
            if(!w) w = 1;
            if(!h) h = 1;
            if(bitmap.width != w || bitmap.height != h)
            {
               mipMap = Bitmap { };
               if(mipMap.Allocate(null, w, h, w, convBitmap.pixelFormat, false))
               {
                  Surface mipSurface = mipMap.GetSurface(0,0,null);
                  mipSurface.Filter(convBitmap, 0,0,0,0, w, h, convBitmap.width, convBitmap.height);
                  delete mipSurface;
               }
               else
               {
                  result = false;
                  delete mipMap;
               }
            }
            else
               mipMap = convBitmap;

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
            if(mipMap != convBitmap)
               delete mipMap;
            if(!mipMaps) break;
         }

         convBitmap.driver.FreeBitmap(convBitmap.displaySystem, convBitmap);
         bitmap.driverData = (void *)(uintptr)glBitmap;
         bitmap.driver = displaySystem.driver;
         if(bitmap.keepData)
            delete convBitmap;

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
#if defined(_GLES) || defined(_GLES2) || defined(SHADERS)
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
#if defined(_GLES) || defined(_GLES2) || defined(SHADERS)
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

      if(!oglSurface.writingText)
      {
         // glTranslatef(-0.375f, -0.375f, 0.0f);
         GLSetupTexturing(true);
         glColor4fv(oglSurface.bitmapMult);
      }
      else if(oglSurface.xOffset)
         glTranslated(oglSurface.xOffset / 64.0/*-0.375*/, 0.0, 0.0);

      glBindTexture(GL_TEXTURE_2D, (GLuint)(uintptr)bitmap.driverData);
      glBegin(GLIMTKMode::quads);

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
         GLSetupTexturing(false);

         //glTranslate(0.375, 0.375, 0.0);
      }
      else if(oglSurface.xOffset)
         glTranslated(-oglSurface.xOffset / 64.0/*+0.375*/, 0.0, 0.0);
   }

   void Stretch(Display display, Surface surface, Bitmap bitmap, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      OGLSurface oglSurface = surface.driverData;

      //glTranslate(-0.375, -0.375, 0.0);

      GLSetupTexturing(true);
      glBindTexture(GL_TEXTURE_2D, (GLuint)(uintptr)bitmap.driverData);

      glColor4fv(oglSurface.bitmapMult);

      glBegin(GLIMTKMode::quads);

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

      GLSetupTexturing(false);

      //glTranslate(0.375, 0.375, 0.0);
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
#if !defined(SHADERS)
         glRasterPos2d(dx,dy);
         //glPixelZoom(flipX ? -s2dw : s2dw, flipY ? s2dh : -s2dh);
         glPixelZoom(s2dw, -s2dh);
         glDrawPixels(sw,sh,GL_BGRA_EXT,GL_UNSIGNED_BYTE, bitmap.picture);
#endif
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
#if !defined(SHADERS)
         glRasterPos2d(dx,dy);
         glPixelZoom(1,-1);
         glDrawPixels(w,h,GL_BGRA_EXT,GL_UNSIGNED_BYTE, bitmap.picture);
#endif
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

   Font LoadFont(DisplaySystem displaySystem, const char * faceName, float size, FontFlags flags, float outlineSize, float outlineFade)
   {
      Font font;
      OGLSystem oglSystem = displaySystem.driverData;
      oglSystem.loadingFont = true;
      font = ((subclass(DisplayDriver))class(LFBDisplayDriver)).LoadFont(displaySystem, faceName, size, flags, outlineSize, outlineFade);
      return font;
   }

   void FontExtent(DisplaySystem displaySystem, Font font, const char * text, int len, int * width, int * height, int prevGlyph, int * rPrevGlyph, int * adv)
   {
      ((subclass(DisplayDriver))class(LFBDisplayDriver)).FontExtent(displaySystem, font, text, len, width, height, prevGlyph, rPrevGlyph, adv);
   }

   void WriteText(Display display, Surface surface, int x, int y, const char * text, int len, int prevGlyph, int * rPrevGlyph)
   {
      OGLSurface oglSurface = surface.driverData;
      OGLSystem oglSystem = display.displaySystem.driverData;
      oglSystem.loadingFont = true;

      //glTranslated(-0.375, -0.375, 0.0);

      //Logf("Blit\n");

      if(surface.textOpacity)
      {
         int w, h, adv;
         FontExtent(display.displaySystem, surface.font, text, len, &w, &h, 0, null, &adv);
         w += adv;
         display.displaySystem.driver.Area(display, surface,x,y,x+w-1,y+h-1);
      }

      oglSurface.writingText = true;

      GLSetupTexturing(true);

      if(surface.font.outlineSize)
      {
         ColorAlpha outlineColor = surface.outlineColor;
         glColor4ub(outlineColor.color.r, outlineColor.color.g, outlineColor.color.b, outlineColor.a);
         oglSurface.writingOutline = true;
         ((subclass(DisplayDriver))class(LFBDisplayDriver)).WriteText(display, surface, x, y, text, len, prevGlyph, rPrevGlyph);
         oglSurface.writingOutline = false;
      }
      glColor4fv(oglSurface.foreground);

      ((subclass(DisplayDriver))class(LFBDisplayDriver)).WriteText(display, surface, x, y, text, len, prevGlyph, rPrevGlyph);
      oglSurface.writingText = false;
      oglSystem.loadingFont = false;

      GLSetupTexturing(false);

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

   void TextExtent(Display display, Surface surface, const char * text, int len, int * width, int * height, int prevGlyph, int * rPrevGlyph, int * adv)
   {
      OGLSurface oglSurface = surface.driverData;
      OGLSystem oglSystem = display.displaySystem.driverData;
      oglSystem.loadingFont = true;
      FontExtent(display.displaySystem, oglSurface.font, text, len, width, height, prevGlyph, rPrevGlyph, adv);
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
#if defined(_GLES) || defined(_GLES2) || defined(SHADERS)
         stippleEnabled = true;
         glesLineStipple(1, (uint16)stipple);
#else
         glLineStipple(1, (uint16)stipple);
         glEnable(GL_LINE_STIPPLE);
#endif
      }
      else
      {
#if defined(_GLES) || defined(_GLES2) || defined(SHADERS)
         stippleEnabled = false;
         glMatrixMode(GL_TEXTURE);
         glLoadIdentity();
         glMatrixMode(MatrixMode::projection);
         GLSetupTexturing(false);   // TODO: Special shading code for stipple?
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
#ifndef __EMSCRIPTEN__
            if(value)
               glEnable(GL_MULTISAMPLE_ARB);
            else
               glDisable(GL_MULTISAMPLE_ARB);
#endif
            break;
         case fillMode:
#if !defined(_GLES) && !defined(_GLES2)
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
#if defined(SHADERS)
            shader_fogColor(color[0], color[1], color[2]);
#else
            glFogfv(GL_FOG_COLOR, (float *)&color);
#endif
            break;
         }
         case fogDensity:
#if defined(SHADERS)
            shader_fogDensity((float)(RenderStateFloat { ui = value }.f * nearPlane));
#else
            glFogf(GL_FOG_DENSITY, (float)(RenderStateFloat { ui = value }.f * nearPlane));
#endif
            break;
         case blend:
//#if !defined(__EMSCRIPTEN__)
            if(value) glEnable(GL_BLEND); else glDisable(GL_BLEND);
//#endif
            break;
         case ambient:
         {
#if defined(SHADERS)
            shader_setGlobalAmbient(((Color)value).r / 255.0f, ((Color)value).g / 255.0f, ((Color)value).b / 255.0f, 1.0f);
#else
            float ambient[4] = { ((Color)value).r/255.0f, ((Color)value).g/255.0f, ((Color)value).b/255.0f, 1.0f };
            glLightModelfv(GL_LIGHT_MODEL_AMBIENT, ambient);
#endif
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
            if(wglSwapIntervalEXT)
               wglSwapIntervalEXT(value ? 1 : 0);
#endif
            break;
         }
      }
   }

   void SetLight(Display display, int id, Light light)
   {
#if defined(SHADERS)
      shader_setLight(display, id, light);
#else
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
#endif
   }

   void SetCamera(Display display, Surface surface, Camera camera)
   {
      OGLDisplay oglDisplay = display.driverData;
      //Logf("SetCamera\n");

      if(surface && camera)
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
         glMatrixMode(MatrixMode::projection);
         if(!display.display3D.camera)
            glPushMatrix();

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
         glMatrixMode(MatrixMode::modelView);
         if(!display.display3D.camera)
            glPushMatrix();

         glLoadIdentity();

         glScaled(1.0/nearPlane, 1.0/nearPlane, -1.0/nearPlane);

         // *** View Matrix ***
         glMultMatrixd(camera.viewMatrix.array);

         // *** Lights ***
         // ...

         glEnable(GL_DEPTH_TEST);

         GLSetupLighting(true);
#if !defined(SHADERS)
         glShadeModel(GL_SMOOTH);
#endif
         glDepthMask((byte)bool::true);
         oglDisplay.depthWrite = true;

#ifndef __EMSCRIPTEN__
         glEnable(GL_MULTISAMPLE_ARB);
#endif
      }
      else if(surface && display.display3D.camera)
      {
         nearPlane = 1;
         oglDisplay.depthWrite = false;
         glViewport(0,0,display.width,display.height);

         glDisable(GL_CULL_FACE);
         glDisable(GL_DEPTH_TEST);


         GLSetupTexturing(false);
         GLSetupLighting(false);
         GLSetupFog(false);

         glDisableClientState(GL_COLOR_ARRAY);

#if defined(SHADERS)
         shader_setPerVertexColor(false);
#else
         glShadeModel(GL_FLAT);
#endif
         glEnable(GL_BLEND);
#if !defined(__EMSCRIPTEN__)
         glDisable(GL_MULTISAMPLE_ARB);
#endif

         // *** Restore 2D MODELVIEW Matrix ***
         glPopMatrix();

         // *** Restore 2D PROJECTION Matrix ***
         glMatrixMode(MatrixMode::projection);
         glPopMatrix();
      }

   }

   void ApplyMaterial(Display display, Material material, Mesh mesh)
   {
      //Logf("ApplyMaterial\n");

      // Basic Properties
      if(material.flags.doubleSided)
      {
#if !defined(SHADERS)
         glLightModeli(GL_LIGHT_MODEL_TWO_SIDE, !material.flags.singleSideLight);
#endif
         glDisable(GL_CULL_FACE);
      }
      else
      {
#if !defined(SHADERS)
         glLightModeli(GL_LIGHT_MODEL_TWO_SIDE, bool::false);
#endif
         glEnable(GL_CULL_FACE);
      }

      // Fog
      GLSetupFog(!material.flags.noFog);

      // Maps
      if(material.baseMap && (mesh.texCoords || mesh.flags.texCoords1))
      {
         Bitmap map = material.baseMap;
         GLSetupTexturing(true);
         glBindTexture(GL_TEXTURE_2D, (GLuint)(uintptr)map.driverData);

         glMatrixMode(GL_TEXTURE);
         glLoadIdentity();
         if(material.uScale && material.vScale)
            glScalef(material.uScale, material.vScale, 1);
         glMatrixMode(MatrixMode::modelView);

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
         GLSetupTexturing(false);

#if defined(SHADERS)
      shader_setMaterial(material, mesh.flags.colors);
#else
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
#endif
   }

   void FreeMesh(DisplaySystem displaySystem, Mesh mesh)
   {
      OGLMesh oglMesh = mesh.data;
      if(oglMesh)
      {
         if(!mesh.flags.vertices)
         {
            oglMesh.vertices.free();
            delete mesh.vertices;
         }
         if(!mesh.flags.normals)
         {
            oglMesh.normals.free();
            delete mesh.normals;
         }
         if(!mesh.flags.texCoords1)
         {
            oglMesh.texCoords.free();
            delete mesh.texCoords;
         }
         if(!mesh.flags.texCoords2)
         {
            oglMesh.texCoords2.free();
            // delete mesh.texCoords2;
         }
         if(!mesh.flags.colors)
         {
            oglMesh.colors.free();
            delete mesh.colors;
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
               {
                  mesh.texCoords = new Pointf[nVertices];
               }
               if(!mesh.flags.colors && flags.colors)
               {
                  mesh.colors = new ColorRGBAf[nVertices];
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
            {
               mesh.texCoords = renew mesh.texCoords Pointf[nVertices];
            }
            if(flags.colors)
            {
               mesh.colors = renew mesh.colors ColorRGBAf[nVertices];
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
         if(flags.vertices)
            oglMesh.vertices.upload(
               mesh.nVertices * (mesh.flags.doubleVertices ? sizeof(Vector3D) : sizeof(Vector3Df)), mesh.vertices); //, GL_STATIC_DRAW_ARB );

         if(flags.normals)
            oglMesh.normals.upload(
               mesh.nVertices * (mesh.flags.doubleNormals ? sizeof(Vector3D) : sizeof(Vector3Df)), mesh.normals); //, GL_STATIC_DRAW_ARB );

         if(flags.texCoords1)
            oglMesh.texCoords.upload(
               mesh.nVertices * sizeof(Pointf), mesh.texCoords); //, GL_STATIC_DRAW_ARB );

         if(flags.colors)
            oglMesh.colors.upload(
               mesh.nVertices * sizeof(ColorRGBAf), mesh.colors); //, GL_STATIC_DRAW_ARB );
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
         oglIndices.buffer.free();
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
         oglIndices.nIndices = nIndices;
      }
      return oglIndices;
   }

   void UnlockIndices(DisplaySystem displaySystem, OGLIndices oglIndices, bool indices32bit, int nIndices)
   {
      if(vboAvailable)
      {
#if defined(_GLES) || defined(_GLES2)
         if(indices32bit)
         {
            if(!oglIndices.buffer.buffer)
               glGenBuffers(1, &oglIndices.buffer.buffer);
            if(glabCurElementBuffer != oglIndices.buffer.buffer)
               GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, oglIndices.buffer.buffer);
            glimtkBufferDatai(GL_ELEMENT_ARRAY_BUFFER, sizeof(uint32) * nIndices, oglIndices.indices, GL_STATIC_DRAW_ARB);
         }
         else
#endif
         oglIndices.buffer.upload(
            nIndices * (indices32bit ? sizeof(uint32) : sizeof(uint16)),
            oglIndices.indices); //GL_STATIC_DRAW_ARB);
      }
   }

   uint16 * LockIndices(DisplaySystem displaySystem, OGLIndices oglIndices)
   {

      return oglIndices.indices;
   }

   void SelectMesh(Display display, Mesh mesh)
   {
      //Logf("SelectMesh\n");

#if !defined( __ANDROID__) && !defined(__APPLE__) && !defined(__ODROID__) && !defined(__EMSCRIPTEN__)

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
            oglMesh.vertices.use(vertex, 3, (mesh.flags.doubleVertices ? GL_DOUBLE : GL_FLOAT), 0, oglMesh.vertices.buffer ? null : (double *)mesh.vertices);

            // *** Normals Stream ***
            if(mesh.normals || mesh.flags.normals)
            {
               glEnableClientState(GL_NORMAL_ARRAY);
               oglMesh.normals.use(normal, 3, GL_FLOAT, 0, oglMesh.normals.buffer ? null : mesh.normals);
            }
            else
               glDisableClientState(GL_NORMAL_ARRAY);

            // *** Texture Coordinates Stream ***
            if(mesh.texCoords || mesh.flags.texCoords1)
            {
               glEnableClientState(GL_TEXTURE_COORD_ARRAY);
               oglMesh.texCoords.use(texCoord, 2, GL_FLOAT, 0, oglMesh.texCoords.buffer ? null : mesh.texCoords);
            }
            else
               glDisableClientState(GL_TEXTURE_COORD_ARRAY);

            // *** Color Stream ***
            if(mesh.colors || mesh.flags.colors)
            {
               glEnableClientState(GL_COLOR_ARRAY);
               oglMesh.colors.use(color, 4, GL_FLOAT, 0, oglMesh.colors.buffer ? null : mesh.colors);
            }
            else
               glDisableClientState(GL_COLOR_ARRAY);
         }
         else
         {
            noAB.use(vertex, 3, (mesh.flags.doubleVertices ? GL_DOUBLE : GL_FLOAT), 0, (double *)mesh.vertices);
            if((mesh.normals || mesh.flags.normals) && !display.display3D.collectingHits)
            {
               glEnableClientState(GL_NORMAL_ARRAY);
               noAB.use(normal, 3, GL_FLOAT, 0, mesh.normals);
            }
            else
               glDisableClientState(GL_NORMAL_ARRAY);
            if((mesh.texCoords || mesh.flags.texCoords1) && !display.display3D.collectingHits)
            {
               glEnableClientState(GL_TEXTURE_COORD_ARRAY);
               noAB.use(texCoord, 2, GL_FLOAT, 0, mesh.texCoords);
            }
            else
               glDisableClientState(GL_TEXTURE_COORD_ARRAY);
            if((mesh.colors || mesh.flags.colors) && !display.display3D.collectingHits)
            {
               glEnableClientState(GL_COLOR_ARRAY);
               noAB.use(color, 4, GL_FLOAT, 0, mesh.colors);
            }
            else
               glDisableClientState(GL_COLOR_ARRAY);
         }

#if !defined(__ANDROID__) && !defined(__APPLE__) && !defined(__ODROID__) && !defined(__EMSCRIPTEN__)

#if defined(__WIN32__)
         if(glLockArraysEXT)
#endif
            if(!vboAvailable)
               glLockArraysEXT(0, mesh.nVertices);

#endif
      }
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
         /*GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER_ARB, 0);
         if(primitive->nIndices < (mesh.nVertices >> 2) && !primitive->type.indices32bit)
         {
            int c;
            glBegin((GLIMTKMode)primitiveTypes[primitive->type.primitiveType]);
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
            GLEAB eab = ((!display.display3D.collectingHits && oglIndices && vboAvailable) ? oglIndices.buffer : noEAB);
#if defined(_GLES) || defined(_GLES2)
            if(!vboAvailable && primitive->type.indices32bit)
            {
               uint16 * temp = new uint16[primitive->nIndices];
               uint32 * src = (uint32 *)(oglIndices ? oglIndices.indices : primitive->indices);
               int i;
               for(i = 0; i < primitive->nIndices; i++)
                  temp[i] = (uint16)src[i];
               eab.draw(primitiveTypes[primitive->type.primitiveType], primitive->nIndices, GL_UNSIGNED_SHORT, temp);
               delete temp;
            }
            else
#endif
            eab.draw(primitiveTypes[primitive->type.primitiveType], primitive->nIndices,
               primitive->type.indices32bit ? GL_UNSIGNED_INT : GL_UNSIGNED_SHORT,
               eab.buffer ? 0 : (oglIndices ? oglIndices.indices : primitive->indices));
            GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
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
#elif defined(__ANDROID__) || defined(__ODROID__)
      return eglContext;
#elif defined(__EMSCRIPTEN__)
      OGLSystem system = displaySystem.driverData;
      return (void *)system.glc;
#else
      OGLSystem system = displaySystem.driverData;
      return system.glContext;
#endif
   }
   return null;
}

#endif
