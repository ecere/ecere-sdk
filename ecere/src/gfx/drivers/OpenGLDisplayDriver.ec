#if defined(__linux__) && !defined(__ANDROID__) && !defined(__EMSCRIPTEN__) && !defined(__i386__)
asm(".symver log,log@GLIBC_2.2.5");
#endif

#if defined(__WIN32__) || defined(__unix__) || defined(__APPLE__)

#ifdef _DEBUG
#define GLSTATS
#endif

// #define DIAGNOSTICS
#if defined(_DEBUG) && !defined(__ANDROID__) && !defined(__EMSCRIPTEN__) && !defined(__ODROID__) && !defined(__UWP__)
 #define GL_DEBUGGING
#endif

import "Display"

import "glab"
import "immediate"
import "matrixStack"
import "defaultShader"

namespace gfx::drivers;

#include "gl123es.h"

#define GL_CLAMP_TO_EDGE 0x812F

#if defined _GLES1
#define glClampFunction(version) (GL_CLAMP)
#elif defined(_GLES2) || defined(__UWP__)
#define glClampFunction(version) (GL_CLAMP_TO_EDGE)
#else
#define glClampFunction(version) (version >= 2 ? GL_CLAMP_TO_EDGE : GL_CLAMP)
#endif

// **********   GL PLATFORMS INCLUDES   **********
// UNIX
#if defined(__unix__) || defined(__APPLE__) || defined(__UWP__)

   // EGL
   #if defined(__ANDROID__) || defined(__ODROID__) || defined(__UWP__)
      import "egl"

      #if defined(__ANDROID__)
         #include <android/log.h>
         #if defined(__LUMIN__)
            #define printf(...)  ML_LOG(Info, __VA_ARGS__)
         #else
            #include <android/native_activity.h>
            #define printf(...)  ((void)__android_log_print(ANDROID_LOG_VERBOSE, "ecere-app", __VA_ARGS__))
         #endif
      #elif defined(__UWP__)
      #define printf Logf
      #endif

   // Emscripten
   #elif defined(__EMSCRIPTEN__)
      #define property _property
      #define uint _uint

      #include <emscripten/emscripten.h>
      #include <emscripten/html5.h>

      #undef property
      #undef uint

   // GLX
   #elif !defined(__ANDROID__) && !defined(__ODROID__) && !defined(__EMSCRIPTEN__)
      #define pointer _pointer
      #define GL_GLEXT_PROTOTYPES

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
      #undef pointer

      #if !defined(__APPLE__)
      default GLAPI void APIENTRY glLockArraysEXT (GLint first, GLsizei count);
      default GLAPI void APIENTRY glUnlockArraysEXT (void);
      #endif

      import "XInterface"

      // We were using PBUFFER for alpha compositing on Linux before, but it does not seem to work, nor be required anymore.
      // #define USEPBUFFER

   #endif

// Apple
#elif defined(__APPLE__)
   #include <OpenGl/gl.h>

// WGL
#elif defined(__WIN32__) && !defined(__UWP__)
   //#define WIN32_LEAN_AND_MEAN
   #undef _WIN32_WINNT
   #define _WIN32_WINNT 0x0502
   #define String String_
   #define Size Size_
   #include <windows.h>
   #undef Size
   #undef String

   #include "wglDefs.h"
#endif

#if defined(__WIN32__)
#elif !defined(__ANDROID__) && !defined(__APPLE__) && !defined(__ODROID__) && !defined(__EMSCRIPTEN__)
default:
private:
#endif

/*                                                            OpenGL Versions Features Quick Reference

                                 | OpenGL 1.1  | OpenGL 1.5  | GL ES 1.1  |  OpenGL 2  | GL 3 (Compat) | GL 3 (Core) |  GL ES 2    |  WebGL 1   |  GL ES 3   |   WebGL 2
   =======================================================================================================================================================================
   glBegin()                     |      X      |      X      |     -      |     X      |       X       |      -      |      -      |     -      |     -      |     -
   glLoadMatrix()                |      X      |      X      |     -      |     X      |       X       |      -      |      -      |     -      |     -      |     -
   glLineWidth()                 |      X      |      X      |     -      |     X      |       X       |      -      |      -      |     -      |     -      |     -
   glPointSize()                 |      X      |      X      |     -      |     X      |       X       |      -      |      -      |     -      |     -      |     -
   glLineStipple()               |      X      |      X      |     -      |     X      |       X       |      -      |      -      |     -      |     -      |     -
   glPolygonStipple()            |      X      |      X      |     -      |     X      |       X       |      -      |      -      |     -      |     -      |     -
   glColorMaterial()             |      X      |      X      |     -      |     X      |       X       |      -      |      -      |     -      |     -      |     -
   GL_QUADS                      |      X      |      X      |     -      |     X      |       X       |      -      |      -      |     -      |     -      |     -
   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   GL_INT / GL_DOUBLE            |      X      |      X      |     -      |     X      |       X       |      X      |      -      |     -      |     -      |     -
   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   GL_SELECT                     |      X      |      X      |     -      |   (Slow)   |     (Slow)    |    (Slow)   |      -      |     -      |     -      |     -
   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   Non ² Textures                |      -      |      -      |     -      |     X      |       X       |      X      |      -      |     -      |     -      |     -
   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   glVertexPointer()       (PTR) |      X      |      X      |     X      |     X      |       X       |      -      |      -      |     -      |     -      |     -
   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   glVertexPointer()       (VBO) |      -      |      X      |     X      |     X      |       X       |      -      |      -      |     -      |     -      |     -
   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   glBufferData()                |      -      |      X      |     X      |     X      |       X       |      X      |      X      |     X      |     X      |     X
   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   glMapBuffer()                 |      -      |      X      |   OES x    |     X      |       X       |      X      |    OES x    |     -      |    OES x   |     -
   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   glBindFramebuffer()           |      -      |      -      |   OES x    |     -      |       X       |      X      |      X      |     X      |     X      |     X
   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   glVertexAttribPointer() (PTR) |      -      |      -      |     -      |     X      |       X       |      X      |      X      |     -      |     X      |     -
   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   glVertexAttribPointer() (VBO) |      -      |      -      |     -      |     X      |       X       |      X      |      X      |     X      |     X      |     X
   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   GLSL Version                  |      -      |      -      |     -      |    1.10    |     1.30      |    1.30     |     1.00    |    1.00    |    3.00    |    3.00
   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   bool legacy          :1; //   |      X      |      X      |     -      |     X      |       X       |      -      |      -      |     -      |     -      |     -
   bool shaders         :1; //   |      -      |      -      |     -      |     X      |       X       |      X      |      X      |     X      |     X      |     X
   bool nonPow2Textures :1; //   |      -      |      -      |     -      |     X      |       X       |      X      |      -      |     -      |     -      |     -
   bool vertexBuffer    :1; //   |      -      |      X      |     X      |     X      |       X       |      X      |      X      |     X      |     X      |     X
   bool frameBuffer     :1; //   |      -      |      -      |     ~      |     -      |       X       |      X      |      X      |     X      |     X      |     X
// bool mapBuffer       :1; //   |      -      |      X      |     ~      |     X      |       X       |      X      |      ~      |     -      |     ~      |     -
*/

default:
// Capabilities Global set to capabilities of Display being rendered to
GLCapabilities glCaps;
// Requiring Graphics Reload:
bool glCaps_nonPow2Textures, glCaps_vertexBuffer, glCaps_quads, glCaps_intAndDouble, glCaps_legacyFormats, glCaps_compatible, glCaps_vertexPointer;
// Might toggle without Reload:
bool glCaps_core, glCaps_shaders, glCaps_fixedFunction, glCaps_immediate, glCaps_legacy, glCaps_pointSize, glCaps_frameBuffer, glCaps_vao, glCaps_select;
// bool mapBuffer;
private:


// **********   Errors and Debugging   **********
#ifdef _DEBUG
void CheckGLErrors(const String s, int l)
{
   int e, nCount = 0;
   while((e = glGetError()) && nCount++ < 10)
      printf("GL error %d! (%s:%d)\n", e, s, l);
}
#endif

#ifdef GL_DEBUGGING
#ifndef APIENTRY
   #define APIENTRY
#endif
static void APIENTRY openglCallbackFunction(GLenum source,
                                           GLenum type,
                                           GLuint id,
                                           GLenum severity,
                                           GLsizei length,
                                           const GLchar* message,
                                           const void* userParam)
{
   if(severity == GL_DEBUG_SEVERITY_NOTIFICATION)
      return;
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


static GLuint stippleTexture;
static bool stippleEnabled;

public void glsupLineStipple( int i, uint16 j )
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
   GLMatrixMode(GL_TEXTURE);
   GLLoadIdentity();
   //glTranslated(1.0/backAttrib->texW/2.0f, 1.0/backAttrib->texH/2.0f, 0.0f);
   GLScaled(i/16.0, 1, 1.0f);
   GLTranslated(0.5, 0.5, 0);
   GLMatrixMode(MatrixMode::projection);
}

   // Exported to build _GLES version...
   public void glsupLightModeli( unsigned int pname, int param )
   {
#if ENABLE_GL_FFP
      if(pname == GL_LIGHT_MODEL_TWO_SIDE)
         glLightModelf(GL_LIGHT_MODEL_TWO_SIDE, param);
#endif
   }

#ifdef _GLES
   void glFogi( unsigned int pname, int param ) { }
   void glPolygonMode( unsigned int i, unsigned int j ) { }
   void glBlendFuncSeparate(int a, int b, int c, int d)
   {
      glBlendFunc(a, b);
   }

#endif

#if defined(_GLES) || defined(_GLES2)
void glClearDepth( double depth ) { glClearDepthf((float)depth); }
#endif

#if !ENABLE_GL_SELECT

// *** Picking won't be supported for now ***
void glPushName( unsigned int i ) { }
void glLoadName( unsigned int i ) { }
void glPopName() { }

#endif

#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA)
static inline uint getPrimitiveType(RenderPrimitiveType type)
{
   static int primitiveTypes[RenderPrimitiveType] =
   {
      GL_POINTS, GL_LINES, GL_TRIANGLES, GL_TRIANGLE_STRIP, GL_TRIANGLE_FAN,
      GLIMTKMode::quads,
      GLIMTKMode::quadStrip,
      GL_LINE_STRIP
   };
   // NOTE: This will only work for single quads
   return (type == quads && !glCaps_quads) ? GL_TRIANGLE_FAN : primitiveTypes[type];
}

public void GLSetupTexturing(bool enable)
{
#if ENABLE_GL_SHADERS
   if(glCaps_shaders)
      defaultShader.texturing(enable);
#endif

#if ENABLE_GL_FFP
   if(!glCaps_shaders)
      (enable ? glEnable : glDisable)(GL_TEXTURE_2D);
#endif
}

public void GLSetupFog(bool enable)
{
#if ENABLE_GL_SHADERS
   if(glCaps_shaders)
      defaultShader.fog(enable);
#endif

#if ENABLE_GL_FFP
   if(!glCaps_shaders)
      (enable ? glEnable : glDisable)(GL_FOG);
#endif
}

bool lightingEnabled;

public void GLSetupLighting(bool enable)
{
   lightingEnabled = enable;
#if ENABLE_GL_SHADERS
   if(glCaps_shaders)
      defaultShader.lighting(enable);
#endif

#if ENABLE_GL_FFP
   if(!glCaps_shaders)
      (enable ? glEnable : glDisable)(GL_LIGHTING);
#endif
}
#endif

/*static */GLuint lastBlitTex;

Shader activeShader;

static int displayWidth, displayHeight;

static bool useSingleGLContext = false;
class OGLDisplay : struct
{
   GLCapabilities capabilities, originalCapabilities;
   bool compat;
   int version;

   ColorAlpha * flippingBuffer;
   int flipBufH, flipBufW;
   bool depthWrite;
   int x, y;
   uint vao;
   int maxTMU;

#if defined(__WIN32__) && !defined(__UWP__)
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
#elif !defined(__ANDROID__) && !defined(__ODROID__) && !defined(__EMSCRIPTEN__) && !defined(__UWP__)
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
};

class OGLSystem : struct
{
   int maxTextureSize;
   bool loadingFont;
#if defined(__WIN32__) && !defined(__UWP__)
   PIXELFORMATDESCRIPTOR pfd;
   int format;
   HDC hdc;
   HGLRC glrc;
   HWND hwnd;
#elif defined(__EMSCRIPTEN__)
   EMSCRIPTEN_WEBGL_CONTEXT_HANDLE glc;
#elif !defined(__ANDROID__) && !defined(__ODROID__) && !defined(__UWP__)
   XVisualInfo * visualInfo;
   GLXContext glContext;
   GLXDrawable glxDrawable;
#endif
   GLCapabilities capabilities;
   bool compat;
   int version;

   // Buffer Data
   uint16 *shortBDBuffer;
   uint shortBDSize;
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
   GLAB tangents;
   GLAB lightVectors;
   GLAB texCoords;
   GLAB texCoords2;
   GLAB colors;
   bool needAlloc;
   bool interleaved;
};

class OGLIndices : struct
{
   GLEAB buffer;
   uint nIndices;
};

int current;
void * previous;

#if defined(__WIN32__) && !defined(__UWP__)
static HGLRC winCreateContext(HDC hdc, int * contextVersion, bool * isCompatible, bool compatible)
{
   HGLRC result = 0;
   if(wglCreateContextAttribsARB)
   {
      int versions[13][2] =
      {
         { 4, 6 },
         { 4, 5 }, { 4, 4 }, { 4, 3 }, { 4, 2 }, { 4, 1 }, { 4, 0 },
                             { 3, 3 }, { 3, 2 }, { 3, 1 }, { 3, 0 },
                                                 { 2, 1 }, { 2, 0 }
      };

      bool tryingCompat = compatible;
      int v = 0;
      while(!result)
      {
         for(v = 0; !result && v < sizeof(versions) / sizeof(versions[0]); v++)
         {
            int v0 = versions[v][0], v1 = versions[v][1];
            if(!tryingCompat || v0 >= 3)
            {
               bool coreNotion = v0 > 3 || (v0 == 3 && v1 >= 3);
               int attribs[] =
               {
                  WGL_CONTEXT_MAJOR_VERSION_ARB, v0, WGL_CONTEXT_MINOR_VERSION_ARB, v1,
         #ifdef _DEBUG
                  WGL_CONTEXT_FLAGS_ARB, WGL_CONTEXT_DEBUG_BIT_ARB,
         #endif
                  coreNotion ? WGL_CONTEXT_PROFILE_MASK_ARB : 0, coreNotion ? (tryingCompat ? WGL_CONTEXT_COMPATIBILITY_PROFILE_BIT_ARB : WGL_CONTEXT_CORE_PROFILE_BIT_ARB) : 0,
                  0,0
               };
               result = wglCreateContextAttribsARB(hdc, null, attribs);
               if(result)
               {
                  if(contextVersion) *contextVersion = v0;
                  if(isCompatible)   *isCompatible = tryingCompat || !coreNotion;
               }
            }
         }
         if(tryingCompat)
            tryingCompat = false;
         else
            break;
      }
   }
   if(!result)
   {
      if(contextVersion) *contextVersion = 1;
      if(isCompatible)   *isCompatible = true;
      result = wglCreateContext(hdc);
   }
   return result;
}
#endif

#if (defined(__unix__) || defined(__APPLE__)) && !defined(__ANDROID__) && !defined(__ODROID__) && !defined(__EMSCRIPTEN__)
#define GLX_CONTEXT_MAJOR_VERSION_ARB       0x2091
#define GLX_CONTEXT_MINOR_VERSION_ARB       0x2092
typedef GLXContext (*glXCreateContextAttribsARBProc)(void *, GLXFBConfig, GLXContext, Bool, const int*);

static bool ctxErrorOccurred = false;
static int ctxErrorHandler( void *dpy, XErrorEvent *ev )
{
    ctxErrorOccurred = true;
    return 0;
}

GLXContext GLX_CreateContext(OGLSystem oglSystem, void * display, GLXFBConfig config, XVisualInfo * visualInfo)
{
   GLXContext ctx = 0;
   const String glxExts = glXQueryExtensionsString( display, DefaultScreen( display ) );
   int (*oldHandler)(void*, XErrorEvent*) = (void *)XSetErrorHandler((void *)&ctxErrorHandler);
   glXCreateContextAttribsARBProc glXCreateContextAttribsARB =
      (void *)glXGetProcAddressARB( (const GLubyte *) "glXCreateContextAttribsARB" );

   ctxErrorOccurred = false;
   if (!config || !glXCreateContextAttribsARB || !strstr(glxExts, "GLX_ARB_create_context" ))
   {
      if(config)
         ctx = glXCreateNewContext( display, config, GLX_RGBA_TYPE, oglSystem ? oglSystem.glContext : 0, True );
      else
         ctx = glXCreateContext(display, visualInfo, oglSystem ? oglSystem.glContext : 0, True);
   }
   else
   {
      int versions[13][2] =
      {
         { 4, 6 },
         { 4, 5 }, { 4, 4 }, { 4, 3 }, { 4, 2 }, { 4, 1 }, { 4, 0 },
                             { 3, 3 }, { 3, 2 }, { 3, 1 }, { 3, 0 },
                                                 { 2, 1 }, { 2, 0 }
      };
#if 0
      int context_attribs[] =
      {
         GLX_CONTEXT_MAJOR_VERSION_ARB, 4,
         GLX_CONTEXT_MINOR_VERSION_ARB, 5,
         GLX_CONTEXT_FLAGS_ARB        , GLX_CONTEXT_FORWARD_COMPATIBLE_BIT_ARB,
         None
      };

      ctx = glXCreateContextAttribsARB( display, config, oglSystem ? oglSystem.glContext : 0, True, context_attribs );

      XSync( display, False );
      if(ctxErrorOccurred || !ctx)
      {
         // TODO: Use a loop like in winCreateContext() to try different versions...
         context_attribs[1] = 1;
         context_attribs[3] = 0;
         ctxErrorOccurred = false;
         ctx = glXCreateContextAttribsARB( display, config, 0, True, context_attribs );
      }
#endif // 0
      bool tryingCompat = false;// compatible;
      int v = 0;
      while(!ctx)
      {
         for(v = 0; !ctx && v < sizeof(versions) / sizeof(versions[0]); v++)
         {
            int v0 = versions[v][0], v1 = versions[v][1];
            if(!tryingCompat || v0 >= 3)
            {
               //bool coreNotion = v0 > 3 || (v0 == 3 && v1 >= 3);
               /*int attribs[] =
               {
                  WGL_CONTEXT_MAJOR_VERSION_ARB, v0, WGL_CONTEXT_MINOR_VERSION_ARB, v1,
         #ifdef _DEBUG
                  WGL_CONTEXT_FLAGS_ARB, WGL_CONTEXT_DEBUG_BIT_ARB,
         #endif
                  coreNotion ? WGL_CONTEXT_PROFILE_MASK_ARB : 0, coreNotion ? (tryingCompat ? WGL_CONTEXT_COMPATIBILITY_PROFILE_BIT_ARB : WGL_CONTEXT_CORE_PROFILE_BIT_ARB) : 0,
                  0,0
               };*/
               int context_attribs[] =
               {
                  GLX_CONTEXT_MAJOR_VERSION_ARB, v0,
                  GLX_CONTEXT_MINOR_VERSION_ARB, v1,
                  GLX_CONTEXT_FLAGS_ARB        , GLX_CONTEXT_FORWARD_COMPATIBLE_BIT_ARB,
                  None
               };
               ctx = glXCreateContextAttribsARB( display, config, oglSystem ? oglSystem.glContext : 0, True, context_attribs );
               if(ctx)
               {
                  //if(contextVersion) *contextVersion = v0;
                  //if(isCompatible)   *isCompatible = tryingCompat || !coreNotion;
#ifdef _DEBUG
                  PrintLn("got context for ", v0, ".", v1);
#endif
               }
            }
         }
         if(tryingCompat)
            tryingCompat = false;
         else
            break;
      }

   }
#ifdef _DEBUG
   if(!ctx)
      PrintLn("no context!");
#endif
   XSync( display, False );
   XSetErrorHandler( (void *)oldHandler );
   return ctx;
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
#elif !defined(__ANDROID__) && !defined(__ODROID__) && !defined(__UWP__)
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
   #if defined(__WIN32__) && !defined(__UWP__)
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
   #if defined(__WIN32__) && !defined(__UWP__)
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
   #if defined(__WIN32__) && !defined(__UWP__)
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

#if !defined(__EMSCRIPTEN__)
   void ::CheckCapabilities(OGLSystem oglSystem, OGLDisplay oglDisplay, bool canCheckExtensions)
   {
      GLCapabilities capabilities;
#if !defined(_GLES2)
      const char * extensions = (canCheckExtensions && (!oglDisplay || oglDisplay.compat)) ? (const char *)glGetString(GL_EXTENSIONS) : null;
#endif
#ifdef DIAGNOSTICS
      printf("extensions: %s\n", extensions);
#endif

      glGetIntegerv(GL_MAX_TEXTURE_SIZE, &oglSystem.maxTextureSize);

#if defined(__LUMIN__)
      capabilities = { shaders = true, vertexBuffer = true, pointSize = true, frameBuffer = true, legacyFormats = true, vao = true };
#elif defined(_GLES3)
      capabilities = { shaders = true, vertexBuffer = true, pointSize = true, frameBuffer = true, legacyFormats = true, intAndDouble = true };
#elif defined(_GLES)
      capabilities = { fixedFunction = true, vertexPointer = true, vertexBuffer = true, pointSize = true, legacyFormats = true, frameBuffer = extensions && strstr(extensions, "GL_OES_framebuffer_object") };
#elif defined(_GLES2)
      capabilities = { shaders = true, vertexBuffer = true, pointSize = true, frameBuffer = true, legacyFormats = true };
#else
      capabilities =
      {
         nonPow2Textures = glGetStringi || (extensions && (strstr(extensions, "GL_ARB_texture_non_power_of_two")));
         intAndDouble = true;
#ifdef GL_DEBUGGING
         debug = true;
#endif
         compatible = oglDisplay.compat;
         pointSize = oglDisplay.compat;
#if ENABLE_GL_LEGACY
         legacy         = glBegin != null && oglDisplay.compat;
         legacyFormats  = glBegin != null && oglDisplay.compat;
         immediate      = glBegin != null && oglDisplay.compat;
         fixedFunction  = glBegin != null && oglDisplay.compat;
         quads          = glBegin != null && oglDisplay.compat;
         select         = glSelectBuffer != null && oglDisplay.compat;
#endif
#if ENABLE_GL_SHADERS
         shaders = glCreateProgram != null;
#endif
#if ENABLE_GL_POINTER
         vertexPointer = oglDisplay.compat;
#endif
#if ENABLE_GL_VAO
         vao = glBindVertexArray != null && !oglDisplay.compat;   // NOTE: Compat must be turned off to use VAOs!
#endif
#if ENABLE_GL_FBO
         frameBuffer = glBindFramebuffer != null;
#endif
         vertexBuffer = glBindBuffer != null;
         // mapBuffer = glMapBuffer != null;
      };
#endif

#ifdef DIAGNOSTICS
      PrintLn("max texture size: ", oglSystem.maxTextureSize);
#endif
      if(oglDisplay) oglDisplay.capabilities = capabilities;
      if(oglSystem)  oglSystem.capabilities = capabilities;
   }
#endif

   bool CreateDisplaySystem(DisplaySystem displaySystem)
   {
      bool result = false;
      OGLSystem oglSystem = displaySystem.driverData = OGLSystem { };

#if defined(__LUMIN__)
      oglSystem.capabilities = { shaders = true, vertexBuffer = true, frameBuffer = true, pointSize = true, vao = true };
#elif defined(_GLES3)
      oglSystem.capabilities = { shaders = true, vertexBuffer = true, frameBuffer = true, pointSize = true, intAndDouble = true };
#elif defined(_GLES)
      oglSystem.capabilities = { fixedFunction = true, vertexBuffer = true, frameBuffer = true, pointSize = true };
#elif defined(_GLES2)
      oglSystem.capabilities = { shaders = true, vertexBuffer = true, frameBuffer = true, pointSize = true };
#else
      oglSystem.capabilities = { compatible = glCaps_compatible, shaders = true, fixedFunction = true, immediate = true, legacy = true, pointSize = true, quads = true, intAndDouble = true, vertexBuffer = true, frameBuffer = true, vao = true, nonPow2Textures = true };
#endif

#ifdef DIAGNOSTICS
      PrintLn("OpenGL driver's CreateDisplaySystem()");
#endif

   #if defined(__WIN32__) && !defined(__UWP__)
      oglSystem.hwnd = CreateWindow("static", null, 0,0,0,0,0,null,null,null,null);

      oglSystem.hdc = GetDC(oglSystem.hwnd);
      if(oglSystem.hdc)
      {
         GLSamplesCount sc = displaySystem.glCapabilities.samples;
         int samplesCount = sc == ms16 ? 16 : sc == ms8 ? 8 : sc == ms4 ? 4 : sc == ms2 ? 2 : 0;

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
                     WGL_DEPTH_BITS_ARB, 24,
                     WGL_STENCIL_BITS_ARB,0,
                     WGL_DOUBLE_BUFFER_ARB,GL_TRUE,
                     //WGL_DEPTH_FLOAT_EXT,GL_TRUE,
                     WGL_SAMPLE_BUFFERS_ARB,GL_TRUE,
                     samplesCount > 1 ? WGL_SAMPLES_ARB : 0,
                     samplesCount > 1 ? samplesCount : 0,                  // Check For Multisampling Support
                     0,0
                  };

                  #define MS_ATTRIB_IX 19 //21

                  //Log("Found wglChoosePixelFormatARB\n");

                  valid = wglChoosePixelFormatARB(oglSystem.hdc,iAttributes,fAttributes,1,&pixelFormat,&numFormats);
                  if(!valid || !numFormats)
                  {
                     //Log("Can't find 16x multi sampling\n");
                     iAttributes[MS_ATTRIB_IX] = 8;
                     valid = samplesCount >= 8 && wglChoosePixelFormatARB(oglSystem.hdc,iAttributes,fAttributes,1,&pixelFormat,&numFormats);
                     if(!valid || !numFormats)
                     {
                        //Log("Can't find 8x multi sampling\n");
                        iAttributes[MS_ATTRIB_IX] = 4;
                        valid = samplesCount >= 4 && wglChoosePixelFormatARB(oglSystem.hdc,iAttributes,fAttributes,1,&pixelFormat,&numFormats);
                        if(!valid || !numFormats)
                        {
                           //Log("Can't find 4x multi sampling\n");
                           iAttributes[MS_ATTRIB_IX] = 2;
                           valid = samplesCount >= 2 && wglChoosePixelFormatARB(oglSystem.hdc,iAttributes,fAttributes,1,&pixelFormat,&numFormats);
                           if(!valid || !numFormats)
                           {
                              // Log("Can't find 2x multi sampling\n");
                              iAttributes[MS_ATTRIB_IX-3] = 0;
                              iAttributes[MS_ATTRIB_IX-2] = 0;
                              valid = wglChoosePixelFormatARB(oglSystem.hdc,iAttributes,fAttributes,1,&pixelFormat,&numFormats);
                           }
                        }
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
                     oglSystem.glrc = winCreateContext(oglSystem.hdc, &oglSystem.version, &oglSystem.compat, displaySystem.glCapabilities.compatible);
#ifdef DIAGNOSTICS
                     PrintLn("wglMakeCurrent()");
#endif
                     if(oglSystem.glrc)
                     {
                        wglMakeCurrent(oglSystem.hdc, oglSystem.glrc);

                        ogl_LoadFunctions();
                        oglSystem.version = ogl_GetMajorVersion();

#ifdef _DEBUG
                        PrintLn("We've got OpenGL Version: ", (char*)glGetString(GL_VERSION), "\n");
#endif
                     }
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
      #if defined(__ANDROID__) || defined(__ODROID__)
         #if defined(__ANDROID__)
         egl_init_display(guiApp.desktop.windowHandle);
         #elif defined(__ODROID__)
         egl_init_display((uint)displaySystem.window);
         #endif
         CheckCapabilities(oglSystem, null, true);

         // TODO: Clean this up? Needed here?
         GLEnableClientState(VERTICES);
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

         GLMatrixMode(MatrixMode::modelView);
         GLScaled(1.0, 1.0, -1.0);
         GLMatrixMode(MatrixMode::projection);
#if ENABLE_GL_FFP
         glShadeModel(GL_FLAT);
#endif

#if !defined(_GLES)
         if(!glCaps_shaders)
            ;//GLLightModeli(GL_LIGHT_MODEL_COLOR_CONTROL, GL_SEPARATE_SPECULAR_COLOR);
#endif

#if ENABLE_GL_FFP
         glFogi(GL_FOG_MODE, GL_EXP);
         glFogf(GL_FOG_DENSITY, 0);
         glEnable(GL_NORMALIZE);
#endif
         glDepthFunc(GL_LESS);
         glClearDepth(1.0);
#if !defined(_GLES) && !defined(_GLES2)
         glDisable(GL_MULTISAMPLE);
#endif

         glViewport(0,0,eglWidth,eglHeight);
         GLLoadIdentity();
         GLOrtho(0,eglWidth,eglHeight,0,0.0,1.0);

         glabCurArrayBuffer = 0;
         glabCurElementBuffer = 0;


         PrintLn("We've got OpenGL Version: ", (char*)glGetString(GL_VERSION), "\n");
         PrintLn("We've got OpenGL Renderer: ", (char*)glGetString(GL_RENDERER), "\n");

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
#ifdef DIAGNOSTICS
      PrintLn("glXChooseVisual()");
#endif
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
#ifdef DIAGNOSTICS
         PrintLn("got visual info!");
         PrintLn("GLX_CreateContext()");
#endif
         oglSystem.glContext = GLX_CreateContext(null, xGlobalDisplay, null, oglSystem.visualInfo);
         oglSystem.compat = false; // TODO: Have GLX_CreateContext set that up
         if(oglSystem.glContext)
         {
#ifdef DIAGNOSTICS
            PrintLn("got context!");
#endif
            glXMakeCurrent(xGlobalDisplay, oglSystem.glxDrawable, oglSystem.glContext);
            glXMakeCurrent(xGlobalDisplay, None, null);
#if 0
            // oglSystem.version = ogl_GetMajorVersion();
#ifdef _DEBUG
            PrintLn("We've got OpenGL Version", (char*)glGetString(GL_VERSION), "\n");
#endif
#endif // 0
            result = true;
         }
      }
      #endif
   #endif

   #if defined(__UWP__)
      result = true;
      oglSystem.maxTextureSize = 16384;
      oglSystem.compat = false;
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

#if ENABLE_GL_SHADERS
      defaultShader.free();
      activeShader = null;
#endif

      delete oglSystem.shortBDBuffer;
      glimtkTerminate();

   #if defined(__WIN32__) && !defined(__UWP__)
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
      if(oglSystem.glContext)
        glXDestroyContext(xGlobalDisplay, oglSystem.glContext);

      if(oglSystem.glxDrawable)
      {
         XDestroyWindow(xGlobalDisplay, oglSystem.glxDrawable);
         oglSystem.glxDrawable = 0;
      }
      #endif
   #endif
      delete oglSystem;
   }

   /*static */bool ::initialDisplaySetup(Display display, bool canCheckExtensions, bool loadExtensions)
   {
      OGLDisplay oglDisplay = display.driverData;
      OGLSystem oglSystem = display.displaySystem.driverData;
      bool result = true;

#if !defined(__ANDROID__) && !defined(__EMSCRIPTEN__) && !defined(__ODROID__) && !defined(__UWP__)
      if(loadExtensions && ogl_LoadFunctions() == ogl_LOAD_FAILED)
         PrintLn("ogl_LoadFunctions() failed!");
      CheckCapabilities(oglSystem, oglDisplay, canCheckExtensions);
#endif

      {
         GLCapabilities capabilities = *&display.glCapabilities;
         // PrintLn("Available OpenGL Capabilities: ", oglDisplay.capabilities);
         // PrintLn("Desired OpenGL Capabilities: ", capabilities);

         oglDisplay.originalCapabilities = oglDisplay.capabilities;

         // Re-enable glCaps_shaders if no fixed function support
         if(!oglDisplay.capabilities.fixedFunction)
            capabilities.shaders = true;
         // Re-enable fixed function if no glCaps_shaders support
         if(!oglDisplay.capabilities.shaders)
         {
            capabilities.fixedFunction = true;
            capabilities.shaders = false;
         }

         if(!capabilities.shaders && !capabilities.fixedFunction)
         {
            capabilities.fixedFunction = oglDisplay.capabilities.fixedFunction;
            capabilities.shaders = oglDisplay.capabilities.shaders;
         }

         // Disable things that don't work with glCaps_shaders
         if(capabilities.shaders)
         {
            capabilities.fixedFunction = false;
            capabilities.legacy = false;
            capabilities.immediate = false;
         }

         #if !ENABLE_GL_POINTER
         // Re-enable vertex buffer if no pointer support
         capabilities.vertexBuffer = true;
         #endif

         oglDisplay.capabilities &= capabilities;

         // PrintLn("Selected OpenGL Capabilities: ", oglDisplay.capabilities);
         oglSystem.capabilities = oglDisplay.capabilities;
      }

   #ifdef GL_DEBUGGING
      if(oglDisplay.capabilities.debug)
         setupDebugging();
   #else
      oglDisplay.capabilities.debug = false;
   #endif

#if ENABLE_GL_VAO
      if(oglDisplay.capabilities.vao)
      {
         glGenVertexArrays(1, &oglDisplay.vao);
         glBindVertexArray(oglDisplay.vao);
      }
#endif

      oglSystem.capabilities = oglDisplay.capabilities;
      SETCAPS(oglDisplay.capabilities);

#if ENABLE_GL_SHADERS
      if(glCaps_shaders)
      {
#if ENABLE_GL_LEGACY
         if(oglDisplay.compat)
         {
            glDisableClientState(GL_VERTEX_ARRAY);
            glDisableClientState(GL_NORMAL_ARRAY);
            glDisableClientState(GL_TEXTURE_COORD_ARRAY);
            glDisableClientState(GL_COLOR_ARRAY);
         }
#endif
         defaultShader.select();
      }
#if ENABLE_GL_LEGACY
      else
      {
         if(glDisableVertexAttribArray)
         {
            glDisableVertexAttribArray(GLBufferContents::color);
            glDisableVertexAttribArray(GLBufferContents::normal);
            glDisableVertexAttribArray(GLBufferContents::texCoord);
            glDisableVertexAttribArray(GLBufferContents::vertex);
            glDisableVertexAttribArray(GLBufferContents::tangent1);
            glDisableVertexAttribArray(GLBufferContents::tangent2);
         }
         GLDisableClientState(COLORS);
         GLDisableClientState(NORMALS);
         GLDisableClientState(TEXCOORDS);
         GLDisableClientState(TANGENTS1);
         GLDisableClientState(TANGENTS2);
#if ENABLE_GL_VAO
         if(glBindVertexArray)
            glBindVertexArray(0);
#endif
         if(glUseProgram)
            glUseProgram(0);
      }
#endif

#endif

#if ENABLE_GL_VAO
      if(glCaps_vao)
         glBindVertexArray(oglDisplay.vao);
#endif

      GLEnableClientState(VERTICES);

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

      GLMatrixMode(MatrixMode::texture);
      GLLoadIdentity();

      GLMatrixMode(MatrixMode::modelView);
      GLLoadIdentity(); // For setting up GLES stack
      GLScaled(1.0, 1.0, -1.0);
      // glTranslatef(0.375f, 0.375f, 0.0f);
      // glTranslatef(-0.625f, -0.625f, 0.0f);
      GLMatrixMode(MatrixMode::projection);
      GLLoadIdentity();
      if(display.width && display.height)
         GLOrtho(0,display.width,display.height,0,0.0,1.0);

#if ENABLE_GL_FFP
      if(!glCaps_shaders)
      {
         glShadeModel(GL_FLAT);

         #define GL_LIGHT_MODEL_LOCAL_VIEWER 0x0B51
         GLLightModeli(GL_LIGHT_MODEL_LOCAL_VIEWER, GL_TRUE);

#if !defined(_GLES)
         ;//GLLightModeli(GL_LIGHT_MODEL_COLOR_CONTROL, GL_SEPARATE_SPECULAR_COLOR);
#endif
         glFogi(GL_FOG_MODE, GL_EXP);
         glFogf(GL_FOG_DENSITY, 0);
         glEnable(GL_NORMALIZE);
      }
#endif
      glDepthFunc(GL_LESS);
#if !defined(__UWP__)
      glClearDepth(1.0);
#endif

#if !defined(_GLES) && !defined(_GLES2) && !defined(__UWP__)
      glDisable(GL_MULTISAMPLE);
#endif

#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA)
      display.ambient = Color { 50,50,50 };
#endif
      return result;
   }

   bool CreateDisplay(Display display)
   {
      bool result = false;
      OGLDisplay oglDisplay = display.driverData;
      OGLSystem oglSystem = display.displaySystem.driverData;

      if(!oglDisplay)
         oglDisplay = display.driverData = OGLDisplay { };
      oglDisplay.capabilities = oglSystem.capabilities;

#if (defined(__WIN32__) && !defined(__UWP__)) || defined(USEPBUFFER)
      if(!display.alphaBlend)
#endif
      {
#if defined(__WIN32__) && !defined(__UWP__)
         oglDisplay.hdc = GetDC(display.window);
         SetPixelFormat(oglDisplay.hdc, oglSystem.format, &oglSystem.pfd);
         if((oglDisplay.glrc = winCreateContext(oglDisplay.hdc, &oglDisplay.version, &oglDisplay.compat, (*&display.glCapabilities).compatible)))
         {
            wglShareLists(oglSystem.glrc, oglDisplay.glrc);
            wglMakeCurrent(oglDisplay.hdc, oglDisplay.glrc);

            ogl_LoadFunctions();
            oglDisplay.version = ogl_GetMajorVersion();

            result = true;
         }
         else
            ReleaseDC(display.window, oglDisplay.hdc);
#elif defined(__UWP__)
         oglDisplay.version = 3;
         result = true;
#elif defined(__unix__) || defined(__APPLE__)
#  if defined(__ANDROID__) || defined(__EMSCRIPTEN__) || defined(__ODROID__)
         #if defined(__LUMIN__)
         oglDisplay.version = 4;
         #elif defined(__ODROID__)
         oglDisplay.version = 1;
         #else
         oglDisplay.version = 2;
         #endif
         result = true;
#  else
         XVisualInfo * visualInfo = ((XWindowData)display.windowDriverData).visual;
         GLXFBConfig fbConfig = ((XWindowData)display.windowDriverData).config;
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
#if !defined(__APPLE__)
         oglDisplay.compat = true;
         oglDisplay.version = 4;
#endif

         if(visualInfo)
         {
            //printf("visualInfo is not null\n");
            // printf("Creating Display Context, sharing with %x!\n", oglSystem.glContext);
            oglDisplay.glContext = GLX_CreateContext(oglSystem, xGlobalDisplay, fbConfig, visualInfo);
            oglDisplay.compat = false; // TODO: Have GLX_CreateContext set that up
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
#if (defined(__WIN32__) && !defined(__UWP__))|| defined(USEPBUFFER)
      else
      {
         oglDisplay.compat = (*&display.glCapabilities).compatible;
         result = true;
         wglMakeCurrent(oglSystem.hdc, oglSystem.glrc);
      }
#endif
      if(result)
      {
#if defined(__EMSCRIPTEN__)
         emscripten_webgl_make_context_current(oglSystem.glc);
#endif

#if (defined(__WIN32__) && !defined(__UWP__)) || defined(USEPBUFFER)
         initialDisplaySetup(display, !display.alphaBlend, true);
#else
         initialDisplaySetup(display, true, true);
#endif
      }

      if(!useSingleGLContext)
      {
   #if defined(__WIN32__) && !defined(__UWP__)
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

#if (defined(__WIN32__) && !defined(__UWP__)) || defined(USEPBUFFER)
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
            GLSamplesCount sc = display.glCapabilities.samples;
            int samplesCount = sc == ms16 ? 16 : sc == ms8 ? 8 : sc == ms4 ? 4 : sc == ms2 ? 2 : 0;
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
               samplesCount > 1 ? WGL_SAMPLES_ARB : 0,
               samplesCount > 1 ? samplesCount : 0,                  // Check For Multisampling Support
               0,0
            };

            //Log("Found wglChoosePixelFormatARB\n");

            valid = wglChoosePixelFormatARB(oglSystem.hdc,iAttributes,fAttributes,1,&pixelFormat,&numFormats);
            if(!valid || !numFormats)
            {
               //Log("Can't find 16x multi sampling\n");
               iAttributes[19] = 8;
               valid = samplesCount >= 8 && wglChoosePixelFormatARB(oglSystem.hdc,iAttributes,fAttributes,1,&pixelFormat,&numFormats);
               if(!valid || !numFormats)
               {
                  //Log("Can't find 8x multi sampling\n");
                  iAttributes[19] = 4;
                  valid = samplesCount >= 4 && wglChoosePixelFormatARB(oglSystem.hdc,iAttributes,fAttributes,1,&pixelFormat,&numFormats);
                  if(!valid || !numFormats)
                  {
                     //Log("Can't find 4x multi sampling\n");
                     iAttributes[19] = 2;
                     valid = samplesCount >= 2 && wglChoosePixelFormatARB(oglSystem.hdc,iAttributes,fAttributes,1,&pixelFormat,&numFormats);
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
         if((oglDisplay.glrc = winCreateContext(oglDisplay.hdc, null, null, oglDisplay.capabilities.compatible)))
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
               oglDisplay.glContext = GLX_CreateContext(oglSystem, xGlobalDisplay, config[0], visualInfo);
               oglDisplay.compat = false; // TODO: Have GLX_CreateContext set that up
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

      SETCAPS(oglDisplay.capabilities);

      if(display.alphaBlend && result)
         initialDisplaySetup(display, true, false);

      if(!result && display.alphaBlend)
      {
         printf("Alpha blending windows not supported on this display\n");
      }
      if(!result)
         return false;

      result = false;

      glViewport(0,0,width,height);
      GLMatrixMode(MatrixMode::projection);
      GLLoadIdentity();
      GLOrtho(0,width,height,0,0.0,1.0);
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
#if ENABLE_GL_VAO
      if(glCaps_vao)
      {
         OGLDisplay oglDisplay = display.driverData;
         glBindVertexArray(oglDisplay.vao);
      }
#endif
      GLABBindBuffer(GL_ARRAY_BUFFER, 0);
      GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
#if ENABLE_GL_SHADERS
      activeProgram = 0;
#endif
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

#if !defined(__ANDROID__)
      /*glFlush();
      glFinish();*/
#endif

#if (defined(__WIN32__) && !defined(__UWP__)) || defined(USEPBUFFER)
      if(display.alphaBlend)
      {
         glPixelStorei(GL_PACK_ALIGNMENT, 4);
         glPixelStorei(GL_PACK_ROW_LENGTH, oglDisplay.stride);
         glPixelStorei(GL_PACK_SKIP_ROWS, 0);
         glPixelStorei(GL_PACK_SKIP_PIXELS, 0);
         glReadPixels(0,0,display.width,display.height,GL_BGRA_EXT,GL_UNSIGNED_BYTE, oglDisplay.picture);

         {
#if defined(__WIN32__) && !defined(__UWP__)
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
#if defined(__WIN32__) && !defined(__UWP__)
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
#ifdef _DEBUG
      CheckGLErrors(__FILE__, __LINE__);
#endif
      // PrintLn("End of frame.");
   }

   void FreeBitmap(DisplaySystem displaySystem, Bitmap bitmap)
   {
      if(bitmap.driverData)
      {
         GLuint tex = (GLuint)(uintptr)bitmap.driverData;
#ifdef _DEBUG
         GLStats::freeTextures(1, &tex);
#endif
         glDeleteTextures(1, &tex);
         bitmap.driverData = 0;
      }
      bitmap.driver = ((subclass(DisplayDriver))class(LFBDisplayDriver));
   }

   bool AllocateBitmap(DisplaySystem displaySystem, Bitmap bitmap, int width, int height, int stride, PixelFormat format, bool allocatePalette)
   {
      OGLSystem oglSystem = displaySystem.driverData;
      GLCapabilities capabilities = oglSystem.capabilities;
      bool result = false;
      Bitmap mipMap { };
      GLuint glBitmap = 0;

      uint w = width, h = height;
      if(!capabilities.nonPow2Textures)
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

#if ENABLE_GL_FFP
      if(!capabilities.shaders)
         glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
#endif

      mipMap.Allocate(null, w, h, w, pixelFormatRGBA, false);

      // glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, mipMap.picture);
      glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, mipMap.picture);

#ifdef GLSTATS
      GLStats::allocTexture(glBitmap, w, h, false);
#endif

      delete mipMap;

      bitmap.driverData = (void *)(uintptr)glBitmap;
      bitmap.driver = displaySystem.driver;
      bitmap.width = w;
      bitmap.height = h;

      result = true;
      return result;
   }

   bool MakeDDBitmap(DisplaySystem displaySystem, Bitmap bitmap, bool mipMaps, uint cubeMapFace)
   {
      bool result = false;
      OGLSystem oglSystem = displaySystem.driverData;
      GLCapabilities capabilities = oglSystem.capabilities;
      Bitmap convBitmap = bitmap;

      if(convBitmap.pixelFormat != pixelFormatRGBAGL && convBitmap.pixelFormat != pixelFormatETC2RGBA8)
         convBitmap = bitmap.ProcessDD(mipMaps, cubeMapFace, false, oglSystem.maxTextureSize, !capabilities.nonPow2Textures);
      if(convBitmap)
      {
         // TODO: Proper _GLES3 setup...
#if !defined(__EMSCRIPTEN__) && ((!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3))
         bool sRGB2Linear = bitmap.sRGB2Linear;
         int internalFormat = convBitmap.pixelFormat == pixelFormatETC2RGBA8 ?
            (sRGB2Linear ? GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC : GL_COMPRESSED_RGBA8_ETC2_EAC) :
            (sRGB2Linear ? GL_SRGB8_ALPHA8 : GL_RGBA8);
#else
         int internalFormat = convBitmap.pixelFormat == pixelFormatETC2RGBA8 ? 0 : GL_RGBA;
#endif
         int minFilter = oglSystem.loadingFont ? GL_NEAREST : mipMaps ? GL_LINEAR_MIPMAP_LINEAR : GL_LINEAR;
         int maxFilter = oglSystem.loadingFont ? GL_NEAREST : GL_LINEAR;
         int face = (cubeMapFace & 7) - 1;
         int target = cubeMapFace ? GL_TEXTURE_CUBE_MAP : GL_TEXTURE_2D;
         GLuint glBitmap = cubeMapFace && face > 0 ? (GLuint)(uintptr)bitmap.driverData : 0;
         int level;

         glGetError();
         if(!glBitmap)
            glGenTextures(1, &glBitmap);
         if(glBitmap == 0)
         {
            //int error = glGetError();
            if(convBitmap != bitmap)
               delete convBitmap;
            return false;
         }

         glBindTexture(target, glBitmap);
         glPixelStorei( GL_UNPACK_ALIGNMENT, 1 );

         glTexParameteri(target, GL_TEXTURE_MIN_FILTER, minFilter);
         glTexParameteri(target, GL_TEXTURE_MAG_FILTER, maxFilter);

         glTexParameteri(target, GL_TEXTURE_WRAP_S, glClampFunction(oglSystem.version));
         glTexParameteri(target, GL_TEXTURE_WRAP_T, glClampFunction(oglSystem.version));

#ifndef GL_TEXTURE_WRAP_R
   #define GL_TEXTURE_WRAP_R 0x8072
#endif

#if !defined(__EMSCRIPTEN__)
         if(cubeMapFace)
            glTexParameteri(target, GL_TEXTURE_WRAP_R, glClampFunction(oglSystem.version));
#endif

#ifdef GL_TEXTURE_MAX_ANISOTROPY_EXT
         glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAX_ANISOTROPY_EXT, 16.0 );
#endif

#if ENABLE_GL_FFP
         if(!capabilities.shaders)
            glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
#endif

         result = true;

#ifdef GLSTATS
         GLStats::allocTexture(glBitmap, convBitmap.width, convBitmap.height, mipMaps);
#endif
         for(level = 0; level < (convBitmap.mipMaps ? convBitmap.numMipMaps : 1); level++)
         {
            Bitmap mipMap = convBitmap.mipMaps ? convBitmap.bitmaps[level] : convBitmap;
            if(mipMap)
            {
               int target = cubeMapFace ? GL_TEXTURE_CUBE_MAP_POSITIVE_X + face : GL_TEXTURE_2D;
               uint width = mipMap.width, height = mipMap.height;
               int format = GL_RGBA;
               int type = GL_UNSIGNED_BYTE;
               int error;

               if(convBitmap.pixelFormat == pixelFormatETC2RGBA8)
                  glCompressedTexImage2D(target, level, internalFormat, width, height, 0, mipMap.sizeBytes, mipMap.picture);
               else
                  glTexImage2D(target, level, internalFormat, width, height, 0, format, type, mipMap.picture);

               //int width = 0;
               glGetError();
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
         }

         if(convBitmap != bitmap)
            delete convBitmap;
         else if(!bitmap.keepData)
            bitmap.Free();
         if(result)
         {
            bitmap.driverData = (void *)(uintptr)glBitmap;
            bitmap.driver = displaySystem.driver;
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
      OGLDisplay oglDisplay = display.driverData;
      OGLSurface oglSurface = surface.driverData = OGLSurface { };
      if(oglSurface)
      {
         SETCAPS(oglDisplay.capabilities);
         if(displayWidth != display.width || displayHeight != display.height)
         {
            displayWidth = display.width;
            displayHeight = display.height;

            glViewport(0,0,display.width,display.height);
            GLLoadIdentity();
            GLOrtho(0,display.width,display.height,0,0.0,1.0);
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
#if ENABLE_GL_LEGACY
            glPixelStorei(GL_PACK_ROW_LENGTH, bitmap.stride);
            glPixelStorei(GL_PACK_SKIP_ROWS, 0);
            glPixelStorei(GL_PACK_SKIP_PIXELS, 0);
#endif
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
      GLColor4fv(oglSurface.foreground);
      GLBegin(GL_POINTS);
      // glVertex2i(x+surface.offset.x, y+surface.offset.y);
      GLVertex2f(x+surface.offset.x + 0.5f, y+surface.offset.y + 0.5f);
      GLEnd();
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

      GLColor4fv(oglSurface.foreground);
      GLBegin(GL_LINES);
      if(stippleEnabled)
      {
         GLTexCoord2f(0.5f, 0);
         GLVertex2f(x1 + 0.5f, y1 + 0.5f);
         GLTexCoord2f(Max(x2-x1, y2-y1) + 0.5f, 0);
         GLVertex2f(x2 + 0.5f, y2 + 0.5f);
      }
      else
      {
         /*
         GLVertex2i(x1, y1);
         GLVertex2i(x2, y2);
         */
         GLVertex2f(x1 + 0.5f, y1 + 0.5f);
         GLVertex2f(x2 + 0.5f, y2 + 0.5f);
      }

      GLEnd();
   }

   void Rectangle(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      OGLSurface oglSurface = surface.driverData;
      x1 += surface.offset.x;
      y1 += surface.offset.y;
      x2 += surface.offset.x;
      y2 += surface.offset.y;

      GLColor4fv(oglSurface.foreground);
      if(stippleEnabled)
      {
         GLBegin(GL_LINES);

         GLTexCoord2f(0.5f, 0);
         GLVertex2f(x1 + 0.5f, y1 + 0.5f);
         GLTexCoord2f(y2-y1 + 0.5f, 0);
         GLVertex2f(x1 + 0.5f, y2 + 0.5f);

         GLTexCoord2f(0.5f, 0);
         GLVertex2f(x1 + 0.5f, y2 + 0.5f);
         GLTexCoord2f(x2 - x1 + 0.5f, 0);
         GLVertex2f(x2 + 0.5f, y2 + 0.5f);

         GLTexCoord2f(0.5f, 0);
         GLVertex2f(x2 + 0.5f, y2 + 0.5f);
         GLTexCoord2f(y1 - y2 + 0.5f, 0);
         GLVertex2f(x2 + 0.5f, y1 + 0.5f);

         GLTexCoord2f(0.5f, 0);
         GLVertex2f(x2 + 0.5f, y1 + 0.5f);
         GLTexCoord2f(x1 - x2 + 0.5f, 0);
         GLVertex2f(x1 + 0.5f, y1 + 0.5f);
      }
      else
      {
         GLBegin(GL_LINE_LOOP);
         /*
         glVertex2i(x1, y1);
         glVertex2i(x1, y2);
         glVertex2i(x2, y2);
         glVertex2i(x2, y1);
         */
         GLVertex2f(x1 + 0.5f, y1 + 0.5f);
         GLVertex2f(x1 + 0.5f, y2 + 0.5f);
         GLVertex2f(x2 + 0.5f, y2 + 0.5f);
         GLVertex2f(x2 + 0.5f, y1 + 0.5f);
      }
      GLEnd();
   }

   void Area(Display display, Surface surface,int x1,int y1,int x2,int y2)
   {
      OGLSurface oglSurface = surface.driverData;

      GLColor4fv(oglSurface.background);

      GLRecti(x1+surface.offset.x, y1+surface.offset.y,
              x2+surface.offset.x + 1, y2+surface.offset.y + 1);
      /*
      GLRectf(x1+surface.offset.x, y1+surface.offset.y,
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
      GLuint tex = (GLuint)(uintptr)bitmap.driverData;
      if(!tex) return;

      if(!oglSurface.writingText)
      {
         // glTranslatef(-0.375f, -0.375f, 0.0f);
         GLSetupTexturing(true);
         GLColor4fv(oglSurface.bitmapMult);
         if(glCaps_shaders && surface.blackTint)
            defaultShader.blackTint = *&surface.blackTint;
         glBindTexture(GL_TEXTURE_2D, tex);
         GLBegin(GLIMTKMode::quads);
      }
      else if(lastBlitTex != tex)
      {
         if(lastBlitTex)
            GLEnd();
         glBindTexture(GL_TEXTURE_2D, tex);
         GLBegin(GLIMTKMode::quads);
         lastBlitTex = tex;
      }

      if(h < 0)
      {
         GLTexCoord2f((float)sx/ bitmap.width, (float)(sy-h)/ bitmap.height);
         GLVertex2i(dx+surface.offset.x, dy+surface.offset.y);
         GLTexCoord2f((float)(sx+w) / bitmap.width, (float)(sy-h)/ bitmap.height);
         GLVertex2i(dx+w+surface.offset.x, dy+surface.offset.y);
         GLTexCoord2f((float)(sx+w)/ bitmap.width, (float)sy/ bitmap.height);
         GLVertex2i(dx+w+surface.offset.x, dy-h+surface.offset.y);
         GLTexCoord2f((float)sx / bitmap.width, (float)sy/ bitmap.height);
         GLVertex2i(dx+surface.offset.x, dy-h+surface.offset.y);
      }
      else
      {
         /*
         GLTexCoord2f((float)sx / bitmap.width, (float)sy/ bitmap.height);
         GLVertex2i(dx+surface.offset.x, dy+surface.offset.y);
         GLTexCoord2f((float)(sx+w)/ bitmap.width, (float)sy/ bitmap.height);
         GLVertex2i(dx+w+surface.offset.x, dy+surface.offset.y);
         GLTexCoord2f((float)(sx+w) / bitmap.width, (float)(sy+h)/ bitmap.height);
         GLVertex2i(dx+w+surface.offset.x, dy+h+surface.offset.y);
         GLTexCoord2f((float)sx/ bitmap.width, (float)(sy+h)/ bitmap.height);
         GLVertex2i(dx+surface.offset.x, dy+h+surface.offset.y);
         */

         GLTexCoord2f((float)sx / bitmap.width, (float)sy/ bitmap.height);
         GLVertex2f((float)dx+surface.offset.x, (float)dy+surface.offset.y);
         GLTexCoord2f((float)(sx+w)/ bitmap.width, (float)sy/ bitmap.height);
         GLVertex2f((float)dx+w+surface.offset.x, (float)dy+surface.offset.y);
         GLTexCoord2f((float)(sx+w) / bitmap.width, (float)(sy+h)/ bitmap.height);
         GLVertex2f((float)dx+w+surface.offset.x, (float)dy+h+surface.offset.y);
         GLTexCoord2f((float)sx/ bitmap.width, (float)(sy+h)/ bitmap.height);
         GLVertex2f((float)dx+surface.offset.x, (float)dy+h+surface.offset.y);
      }
      if(!oglSurface.writingText)
      {
         GLEnd();
         GLSetupTexturing(false);
         //glTranslate(0.375, 0.375, 0.0);
      }
   }

   void Stretch(Display display, Surface surface, Bitmap bitmap, int dx, int dy, int sx, int sy, int w, int h, int sw, int sh)
   {
      OGLSurface oglSurface = surface.driverData;
      bool flipX = w < 0, flipY = h < 0;
      float invW = 1.0f / bitmap.width, invH = 1.0f / bitmap.height;
      float sx0 = (sx + (flipX ? sw :  0)) * invW;
      float sx1 = (sx + (flipX ?  0 : sw)) * invW;
      float sy0 = (sy + (flipY ? sh :  0)) * invH;
      float sy1 = (sy + (flipY ?  0 : sh)) * invH;

      if(flipX) w = -w;
      if(flipY) h = -h;
      dx += surface.offset.x;
      dy += surface.offset.y;

      //glTranslate(-0.375, -0.375, 0.0);

      GLSetupTexturing(true);
      glBindTexture(GL_TEXTURE_2D, (GLuint)(uintptr)bitmap.driverData);

      GLColor4fv(oglSurface.bitmapMult);
      if(glCaps_shaders)
         defaultShader.blackTint = *&surface.blackTint;

      GLBegin(GLIMTKMode::quads);

      GLTexCoord2f(sx0, sy0);
      GLVertex2i(dx, dy);

      GLTexCoord2f(sx1, sy0);
      GLVertex2i(dx + w, dy);

      GLTexCoord2f(sx1, sy1);
      GLVertex2i(dx + w, dy + h);

      GLTexCoord2f(sx0, sy1);
      GLVertex2i(dx, dy + h);

      GLEnd();

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
#if ENABLE_GL_LEGACY
         if(glCaps_legacy)
         {
            glPixelStorei(GL_UNPACK_ROW_LENGTH, bitmap.stride);
            glPixelStorei(GL_UNPACK_SKIP_PIXELS, sx);
            glPixelStorei(GL_UNPACK_SKIP_ROWS, sy);
            glRasterPos2d(dx,dy);
            //glPixelZoom(flipX ? -s2dw : s2dw, flipY ? s2dh : -s2dh);
            glPixelZoom(s2dw, -s2dh);
            glDrawPixels(sw,sh,GL_BGRA_EXT,GL_UNSIGNED_BYTE, bitmap.picture);
            glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
            glPixelStorei(GL_UNPACK_SKIP_PIXELS, 0);
            glPixelStorei(GL_UNPACK_SKIP_ROWS, 0);
         }
#endif
         glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
      }
   }

   void BlitDI(Display display, Surface surface, Bitmap bitmap, int dx, int dy, int sx, int sy, int w, int h)
   {
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
#if ENABLE_GL_LEGACY
         if(glCaps_legacy)
         {
            glPixelStorei(GL_UNPACK_ROW_LENGTH, bitmap.stride);
            glPixelStorei(GL_UNPACK_SKIP_PIXELS, sx);
            glPixelStorei(GL_UNPACK_SKIP_ROWS, sy);
            glRasterPos2d(dx,dy);
            glPixelZoom(1,-1);
            glDrawPixels(w,h,GL_BGRA_EXT,GL_UNSIGNED_BYTE, bitmap.picture);
            glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
            glPixelStorei(GL_UNPACK_SKIP_PIXELS, 0);
            glPixelStorei(GL_UNPACK_SKIP_ROWS, 0);
         }
#endif
         glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
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
      if(len && text[0] && surface.font)
      {
         OGLSurface oglSurface = surface.driverData;
         OGLSystem oglSystem = display.displaySystem.driverData;
         oglSystem.loadingFont = true;

         //glTranslated(-0.375, -0.375, 0.0);

         if(surface.textOpacity)
         {
            int w = 0, h, adv = 0;
            FontExtent(display.displaySystem, surface.font, text, len, &w, &h, 0, null, &adv);
            w += adv;
            display.displaySystem.driver.Area(display, surface,x,y,x+w-1,y+h-1);
         }

         oglSurface.writingText = true;

         GLSetupTexturing(true);

         x <<= 6;
         if(surface.font.outlineSize)
         {
            ColorAlpha outlineColor = surface.outlineColor;
            int fx = x;

            GLColor4ub(outlineColor.color.r, outlineColor.color.g, outlineColor.color.b, outlineColor.a);
            oglSurface.writingOutline = true;
            lastBlitTex = 0;
            oglSurface.font.ProcessString(surface.displaySystem, (const byte *)text, len, true, surface, display, &fx, y, prevGlyph, rPrevGlyph, null);
            if(lastBlitTex) GLEnd();
            oglSurface.writingOutline = false;
         }
         GLColor4fv(oglSurface.foreground);

         lastBlitTex = 0;
         oglSurface.font.ProcessString(surface.displaySystem, (const byte *)text, len, true, surface, display, &x, y, prevGlyph, rPrevGlyph, null);

         if(lastBlitTex) GLEnd();
         lastBlitTex = 0;

         oglSurface.writingText = false;
         oglSystem.loadingFont = false;

         GLSetupTexturing(false);

         //glTranslated(0.375, 0.375, 0.0);
      }
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
      if(stipple)
      {
#if ENABLE_GL_LEGACY
         if(glCaps_legacy)
         {
            glLineStipple(1, (uint16)stipple);
            glEnable(GL_LINE_STIPPLE);
         }
         else
#endif
         {
            stippleEnabled = true;
            glsupLineStipple(1, (uint16)stipple);
         }
      }
      else
      {
#if ENABLE_GL_LEGACY
         if(glCaps_legacy)
            glDisable(GL_LINE_STIPPLE);
         else
#endif
         {
            stippleEnabled = false;
            GLMatrixMode(GL_TEXTURE);
            GLLoadIdentity();
            GLMatrixMode(MatrixMode::projection);
            GLSetupTexturing(false);   // TODO: Special shading code for stipple?
         }
      }
   }
#if ENABLE_GL_FFP
   void ::disableRemainingTMUs(Display display, int lastTMU)
   {
      OGLDisplay oglDisplay = display.driverData;
      int t;
      for(t = lastTMU; t < oglDisplay.maxTMU; t++)
      {
         if(glActiveTexture) glActiveTexture(GL_TEXTURE0 + t);
         if(glClientActiveTexture) glClientActiveTexture(GL_TEXTURE0 + t);
         glDisable(GL_TEXTURE_2D);
         glDisable(GL_TEXTURE_CUBE_MAP);
         GLDisableClientState(TEXCOORDS);
      }
      if(glActiveTexture) glActiveTexture(GL_TEXTURE0);
      if(glClientActiveTexture) glClientActiveTexture(GL_TEXTURE0);
      oglDisplay.maxTMU = lastTMU;
   }
#endif

#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA)
   void SetRenderState(Display display, RenderState state, uint value)
   {
      OGLDisplay oglDisplay = display.driverData;
      switch(state)
      {
         case antiAlias:
#if !defined(_GLES) && !defined(_GLES2) && !defined(__UWP__)
            if(value)
               glEnable(GL_MULTISAMPLE);
            else
               glDisable(GL_MULTISAMPLE);
#endif
            break;
         case fillMode:
#if ENABLE_GL_LEGACY
            if(glCaps_legacy)
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
#if ENABLE_GL_SHADERS
            if(glCaps_shaders)
               defaultShader.setFogColor(color[0], color[1], color[2]);
#endif

#if ENABLE_GL_FFP
            if(!glCaps_shaders)
               glFogfv(GL_FOG_COLOR, (float *)&color);
#endif
            break;
         }
         case fogDensity:
#if ENABLE_GL_SHADERS
            if(glCaps_shaders)
               defaultShader.setFogDensity((float)(RenderStateFloat { ui = value }.f * nearPlane));
#endif

#if ENABLE_GL_FFP
            if(!glCaps_shaders)
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
#if ENABLE_GL_SHADERS
            if(glCaps_shaders)
               defaultShader.setGlobalAmbient(((Color)value).r / 255.0f, ((Color)value).g / 255.0f, ((Color)value).b / 255.0f, 1.0f);
#endif

#if ENABLE_GL_FFP
            if(!glCaps_shaders)
            {
               float ambient[4] = { ((Color)value).r/255.0f, ((Color)value).g/255.0f, ((Color)value).b/255.0f, 1.0f };
               glLightModelfv(GL_LIGHT_MODEL_AMBIENT, ambient);
            }
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
#if defined(__WIN32__) && !defined(__UWP__)
            if(wglSwapIntervalEXT)
               wglSwapIntervalEXT(value ? 1 : 0);
#endif
            break;
         }
      }
   }

   void SetLight(Display display, int id, Light light)
   {
#if ENABLE_GL_SHADERS
      if(glCaps_shaders)
         defaultShader.setLight(display, id, light);
#endif

#if ENABLE_GL_FFP
      if(!glCaps_shaders)
      {
         if(light != null && !light.flags.off)
         {
            Object lightObject = light.lightObject;
            float position[4] = { 0, 0, 0, 0 };
            float color[4] = { 0, 0, 0, 1 };
            Vector3D l;

            glEnable(GL_LIGHT0 + id);

            if(!light.multiplier) light.multiplier = 1.0f;

            GLFlushMatrices();

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
               // Positional Lights, including Spot Lights (and omni light with flags.spot not set)
               Matrix * mat = &lightObject.matrix;
               l = { mat->m[3][0], mat->m[3][1], mat->m[3][2] };
               if(display.display3D && display.display3D.camera)
                  l.Subtract(l, display.display3D.camera.cPosition);

               position[0] = (float)l.x, position[1] = (float)l.y, position[2] = (float)l.z, position[3] = 1;

               if(light.flags.attenuation)
               {
                  glLightf(GL_LIGHT0 + id, GL_CONSTANT_ATTENUATION, light.Kc);
                  glLightf(GL_LIGHT0 + id, GL_LINEAR_ATTENUATION, light.Kl);
                  glLightf(GL_LIGHT0 + id, GL_QUADRATIC_ATTENUATION, light.Kq);
               }
               else
               {
                  glLightf(GL_LIGHT0 + id, GL_CONSTANT_ATTENUATION, 1);
                  glLightf(GL_LIGHT0 + id, GL_LINEAR_ATTENUATION, 0);
                  glLightf(GL_LIGHT0 + id, GL_QUADRATIC_ATTENUATION, 0);
               }

               if((light.flags.spot && light.fallOff < 360) || (lightObject && (light.direction.x || light.direction.y || light.direction.z)))
               {
                  // Figure out exponent out of the hot spot
                  #define MAXLIGHT  0.9
                  float exponent = light.flags.spot ? (float)(log(MAXLIGHT) / log(cos(light.hotSpot / 2))) : 1;
                  Degrees cutOff = light.flags.spot ? light.fallOff/2 : 90;
                  float direction[4] = { (float)light.direction.x, (float)light.direction.y, (float)light.direction.z, 1 };

                  glLightfv(GL_LIGHT0 + id, GL_SPOT_DIRECTION, direction);
                  glLightf(GL_LIGHT0 + id, GL_SPOT_CUTOFF, (float)cutOff);
                  glLightf(GL_LIGHT0 + id, GL_SPOT_EXPONENT, exponent);
               }
               else
               {
                  float d[4] = { 0, 0, 1, 0 };
                  glLightfv(GL_LIGHT0 + id, GL_SPOT_DIRECTION, d);
                  glLightf(GL_LIGHT0 + id, GL_SPOT_CUTOFF, 180);
                  glLightf(GL_LIGHT0 + id, GL_SPOT_EXPONENT, 1);
               }

               /*
               if(lightObject)
               {
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
               }
               */
            }
            else
            {
               // Directional Light
               Vector3D vector { 0,0,-1 };
               Vector3D direction;
               Matrix mat;
               mat.RotationQuaternion(light.orientation);
               direction.MultMatrix(vector, mat);
               l.Normalize(direction);
               position[0] = (float)l.x, position[1] = (float)l.y, position[2] = (float)l.z, position[3] = 0;
            }
            glLightfv(GL_LIGHT0 + id, GL_POSITION, position);
            if(display.display3D)
            {
               Matrix m;
               Vector3Df v { position[0], position[1], position[2] };
               Vector3Df l;
               float * lp = display.display3D.light0Pos;
               if(display.display3D.camera)
                  m = display.display3D.camera.viewMatrix;
               else
                  m.Identity();
               l.MultMatrix(v, m);
               lp[0] = l.x;
               lp[1] =-l.y;
               lp[2] =-l.z;
               lp[3] = position[3];
            }
         }
         else
            glDisable(GL_LIGHT0 + id);
      }
#endif
   }

   void SetCamera(Display display, Surface surface, Camera camera)
   {
      OGLDisplay oglDisplay = display.driverData;

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

         GLMatrixMode(MatrixMode::texture);
         if(!display.display3D.camera)
            GLPushMatrix();
         GLLoadIdentity();

         // *** Projection Matrix ***
         GLMatrixMode(MatrixMode::projection);
         if(!display.display3D.camera)
            GLPushMatrix();

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
            GLLoadMatrixd(pickMatrix.array);
         }
         else
            GLLoadIdentity();

#if !defined(__UWP__)
         GLFrustum(
            (left   - origX) * camera.zMin / camera.focalX,
            (right  - origX) * camera.zMin / camera.focalX,
            (bottom - origY) * camera.zMin / camera.focalY,
            (top    - origY) * camera.zMin / camera.focalY,
            camera.zMin, camera.zMax);
#endif

         glDisable(GL_BLEND);

         // *** Z Inverted Identity Matrix ***
         GLMatrixMode(MatrixMode::modelView);
         if(!display.display3D.camera)
            GLPushMatrix();

         GLLoadIdentity();

#if defined(__UWP__)
         glmsScaled(1, -1, 1);
#endif

         GLScaled(1.0/nearPlane, 1.0/nearPlane, -1.0/nearPlane);

         // *** View Matrix ***
         GLMultMatrixd(camera.viewMatrix.array);

#if ENABLE_GL_SHADERS
         if(glCaps_shaders)
         {
            defaultShader.select();
            defaultShader.setCamera(camera);
         }
#endif

         // *** Lights ***
         // ...

         glEnable(GL_DEPTH_TEST);

         GLSetupLighting(true);
#if ENABLE_GL_FFP
         if(!glCaps_shaders)
            glShadeModel(GL_SMOOTH);
#endif
         glDepthMask((byte)bool::true);
         oglDisplay.depthWrite = true;

#if !defined(_GLES) && !defined(_GLES2) && !defined(__UWP__)
         if(oglDisplay.version >= 2)
            glEnable(GL_MULTISAMPLE);
#endif
      }
      else if(surface && display.display3D.camera)
      {
         nearPlane = 1;
         oglDisplay.depthWrite = false;
         glViewport(0,0,display.width,display.height);

         glDisable(GL_CULL_FACE);
         glDisable(GL_DEPTH_TEST);

         GLDisableClientState(COLORS);
#if ENABLE_GL_SHADERS
         if(glCaps_shaders)
         {
            GLDisableClientState(TANGENTS1);
            GLDisableClientState(TANGENTS2);
         }
#endif
         GLDisableClientState(NORMALS);
#if ENABLE_GL_FFP
         if(!glCaps_shaders)
            GLDisableClientState(LIGHTVECTORS);
#endif

         // *** Restore 2D MODELVIEW Matrix ***
         GLMatrixMode(MatrixMode::modelView);
         GLPopMatrix();

         // *** Restore 2D TEXTURE Matrix ***
         GLMatrixMode(MatrixMode::texture);
         GLPopMatrix();

         // *** Restore 2D PROJECTION Matrix ***
         GLMatrixMode(MatrixMode::projection);
         GLPopMatrix();

         // NOTE: We expect the 2D projection matrix to be the active one for GetSurface to call glOrtho()

#if ENABLE_GL_SHADERS
         if(glCaps_shaders)
            defaultShader.select();
#endif

#if ENABLE_GL_FFP
         if(!glCaps_shaders)
         {
            disableRemainingTMUs(display, 0);
            glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

            if(oglDisplay.version >= 2)
            {
               glDisable(GL_TEXTURE_CUBE_MAP);
            #if _GLES
               glDisable(GL_TEXTURE_GEN_STR);
            #else
               glDisable(GL_TEXTURE_GEN_R);
               glDisable(GL_TEXTURE_GEN_S);
               glDisable(GL_TEXTURE_GEN_T);
            #endif
            }
         }
#endif

         GLSetupTexturing(false);
         GLSetupLighting(false);
         GLSetupFog(false);

#if ENABLE_GL_SHADERS
         if(glCaps_shaders)
         {
            defaultShader.setPerVertexColor(false);
            defaultShader.setMaterial(null, 0);
         }
#endif
#if ENABLE_GL_FFP
         if(!glCaps_shaders)
            glShadeModel(GL_FLAT);
#endif
         glEnable(GL_BLEND);
#if !defined(_GLES) && !defined(_GLES2) && !defined(__UWP__)
         if(oglDisplay.version >= 2)
            glDisable(GL_MULTISAMPLE);
#endif
      }
   }

   void ApplyMaterial(Display display, Material material, Mesh mesh)
   {
#if ENABLE_GL_FFP
      OGLDisplay oglDisplay = display.driverData;
#endif
      Shader shader = material.shader ? material.shader : defaultShader;
      MaterialFlags flags = material.flags;
      Bitmap baseMap = material.baseMap;
      bool cubeMap = flags.cubeMap;
#if ENABLE_GL_FFP
      static int lastSeparate = 0;
      int tmu = 0;
      bool normalMapped = false;
      OGLMesh oglMesh = mesh ? mesh.data : null;
#endif

#if ENABLE_GL_SHADERS
      if(glCaps_shaders && shader)
         shader.select();
#endif

      // Basic Properties
      if(flags.doubleSided)
      {
#if ENABLE_GL_FFP
         if(!glCaps_shaders)
            GLLightModeli(GL_LIGHT_MODEL_TWO_SIDE, !flags.singleSideLight);
#endif
         glDisable(GL_CULL_FACE);
      }
      else
      {
#if ENABLE_GL_FFP
         if(!glCaps_shaders)
            GLLightModeli(GL_LIGHT_MODEL_TWO_SIDE, bool::false);
#endif
         if(!mesh.mab) // TODO: State check
            glEnable(GL_CULL_FACE);
      }

      // Fog
      GLSetupFog(!flags.noFog);

#if ENABLE_GL_SHADERS
      if(glCaps_shaders)
         shader.setMaterial(material, *&mesh.flags);
#endif

#if ENABLE_GL_FFP
      if(!glCaps_shaders)
      {
         if(material.bumpMap && mesh.lightVectors)
         {
            float color[4] = { 1,1,1,1 };
            if(glActiveTexture) glActiveTexture(GL_TEXTURE0 + tmu);
            if(glClientActiveTexture) glClientActiveTexture(GL_TEXTURE0 + tmu++);
            glBindTexture(GL_TEXTURE_2D, (GLuint)(uintptr)material.bumpMap.driverData);
            glDisable(GL_TEXTURE_CUBE_MAP);
            glEnable(GL_TEXTURE_2D);

            glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_COMBINE);
            glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_RGB, GL_DOT3_RGB);
            glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_ALPHA, GL_REPLACE);
            glTexEnvi(GL_TEXTURE_ENV, GL_SRC0_RGB, GL_PRIMARY_COLOR);
            glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND0_RGB, GL_SRC_COLOR);
            glTexEnvi(GL_TEXTURE_ENV, GL_SRC1_RGB, GL_TEXTURE);
            glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND1_RGB, GL_SRC_COLOR);

            if(0) //((DefaultShaderBits)defaultShader.state).debugging)
            {
               glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_RGB, GL_INTERPOLATE);
               glTexEnvi(GL_TEXTURE_ENV, GL_SRC0_RGB, GL_PRIMARY_COLOR);
               glTexEnvi(GL_TEXTURE_ENV, GL_SRC2_RGB, GL_CONSTANT);
               glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND2_RGB, GL_SRC_COLOR);
               glTexEnvfv(GL_TEXTURE_ENV, GL_TEXTURE_ENV_COLOR, color );
            }

         #if _GLES
            glDisable(GL_TEXTURE_GEN_STR);
         #else
            glDisable(GL_TEXTURE_GEN_R);
            glDisable(GL_TEXTURE_GEN_S);
            glDisable(GL_TEXTURE_GEN_T);
         #endif
            glDisable(GL_LIGHTING);
            lightingEnabled = false;

            GLMatrixMode(GL_TEXTURE);
            GLLoadIdentity();
            if(material.uScale && material.vScale)
               GLScalef(material.uScale, material.vScale, 1);
            GLMatrixMode(MatrixMode::modelView);

            if(flags.setupTextures)
            {
               if(flags.tile)
               {
                  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
                  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
               }
               else
               {
                  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, glClampFunction(oglDisplay.version));
                  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, glClampFunction(oglDisplay.version));
               }
            }

            if(glActiveTexture) glActiveTexture(GL_TEXTURE0 + tmu);
            if(glClientActiveTexture) glClientActiveTexture(GL_TEXTURE0 + tmu);

            normalMapped = true;

            // Modulate base color
            if(material.diffuse.r < 1 || material.diffuse.g < 1 || material.diffuse.b < 1)
            {
               tmu++;
               glDisable(GL_TEXTURE_CUBE_MAP);
               glEnable(GL_TEXTURE_2D);
               glBindTexture(GL_TEXTURE_2D, (GLuint)(uintptr)material.bumpMap.driverData);
               glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_COMBINE);
               glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_RGB, GL_MODULATE);
               glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_ALPHA, GL_MODULATE);

               glTexEnvi(GL_TEXTURE_ENV, GL_SRC0_RGB, GL_PREVIOUS);
               glTexEnvi(GL_TEXTURE_ENV, GL_SRC1_RGB, GL_CONSTANT);
               glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND0_RGB, GL_SRC_COLOR);
               glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND1_RGB, GL_SRC_COLOR);

               glTexEnvi(GL_TEXTURE_ENV, GL_SRC0_ALPHA, GL_PREVIOUS);
               glTexEnvi(GL_TEXTURE_ENV, GL_SRC1_ALPHA, GL_CONSTANT);
               glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND0_ALPHA, GL_SRC_ALPHA);
               glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND1_ALPHA, GL_SRC_ALPHA);

               color[0] = material.diffuse.r, color[1] = material.diffuse.g, color[2] = material.diffuse.b, color[3] = 1.0;
               glTexEnvfv(GL_TEXTURE_ENV, GL_TEXTURE_ENV_COLOR, color );
               if(glActiveTexture) glActiveTexture(GL_TEXTURE0 + tmu);
               if(glClientActiveTexture) glClientActiveTexture(GL_TEXTURE0 + tmu);
            }

            // Add ambient light
            {
               ColorRGB ambient { material.ambient.r * 0.2f, material.ambient.g * 0.2f, material.ambient.g * 0.2f };
               if(ambient.r > 0 || ambient.g > 0 || ambient.b > 0)
               {
                  tmu++;
                  glDisable(GL_TEXTURE_CUBE_MAP);
                  glEnable(GL_TEXTURE_2D);
                  glBindTexture(GL_TEXTURE_2D, (GLuint)(uintptr)material.bumpMap.driverData);
                  glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_COMBINE);
                  glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_RGB, GL_ADD);
                  glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_ALPHA, GL_MODULATE);

                  glTexEnvi(GL_TEXTURE_ENV, GL_SRC0_RGB, GL_PREVIOUS);
                  glTexEnvi(GL_TEXTURE_ENV, GL_SRC1_RGB, GL_CONSTANT);
                  glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND0_RGB, GL_SRC_COLOR);
                  glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND1_RGB, GL_SRC_COLOR);

                  glTexEnvi(GL_TEXTURE_ENV, GL_SRC0_ALPHA, GL_PREVIOUS);
                  glTexEnvi(GL_TEXTURE_ENV, GL_SRC1_ALPHA, GL_CONSTANT);
                  glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND0_ALPHA, GL_SRC_ALPHA);
                  glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND1_ALPHA, GL_SRC_ALPHA);

                  color[0] = ambient.r, color[1] = ambient.g, color[2] = ambient.b, color[3] = 1.0;
                  glTexEnvfv(GL_TEXTURE_ENV, GL_TEXTURE_ENV_COLOR, color );
                  if(glActiveTexture) glActiveTexture(GL_TEXTURE0 + tmu);
                  if(glClientActiveTexture) glClientActiveTexture(GL_TEXTURE0 + tmu);
               }
            }
         }
         else
         {
            GLDisableClientState(LIGHTVECTORS);
            if(!lightingEnabled)
            {
               glEnable(GL_LIGHTING);
               lightingEnabled = true;
            }
         }
      }
#endif
      // Maps
      if(cubeMap || (baseMap && (mesh.texCoords || mesh.flags.texCoords1)))
      {
         int diffuseTarget = cubeMap ? GL_TEXTURE_CUBE_MAP : GL_TEXTURE_2D;

#if ENABLE_GL_FFP
         if(!glCaps_shaders)
         {
            if(glActiveTexture) glActiveTexture(GL_TEXTURE0 + tmu);
            if(glClientActiveTexture) glClientActiveTexture(GL_TEXTURE0 + tmu++);
            glEnable(diffuseTarget);
            if(oglDisplay.version >= 2)
               glDisable(flags.cubeMap ? GL_TEXTURE_2D : GL_TEXTURE_CUBE_MAP);
         }
#endif

#if ENABLE_GL_SHADERS
         if(glCaps_shaders && !flags.cubeMap)
            GLSetupTexturing(true);
#endif

         glBindTexture(diffuseTarget, (GLuint)(uintptr)baseMap.driverData);

#if ENABLE_GL_FFP
         if(!glCaps_shaders)
         {
            glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
            /* // This did not have the desired effect with a GL_ALPHA texture
            glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_COMBINE);
            glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_RGB, GL_MODULATE);
            glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_ALPHA, GL_MODULATE);
            glTexEnvi(GL_TEXTURE_ENV, GL_SRC0_RGB, GL_PREVIOUS);
            glTexEnvi(GL_TEXTURE_ENV, GL_SRC1_RGB, GL_TEXTURE);
            glTexEnvi(GL_TEXTURE_ENV, GL_SRC0_ALPHA, GL_PREVIOUS);
            glTexEnvi(GL_TEXTURE_ENV, GL_SRC1_ALPHA, GL_TEXTURE);
            glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND0_RGB, GL_SRC_COLOR);
            glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND1_RGB, GL_SRC_COLOR);
            glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND0_ALPHA, GL_SRC_ALPHA);
            glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND1_ALPHA, GL_SRC_ALPHA);
            */

            if(cubeMap)
            {
            #if _GLES
               glEnable(GL_TEXTURE_GEN_STR);
               // GL_OBJECT_LINEAR: No extension support?
               // glTexGeni(GL_TEXTURE_GEN_STR_OES, GL_TEXTURE_GEN_MODE, GL_OBJECT_LINEAR);
            #else
               GLfloat xPlane[] = { 1.0f, 0.0f, 0.0f, 0 };
               GLfloat yPlane[] = { 0.0f,-1.0f, 0.0f, 0 };
               GLfloat zPlane[] = { 0.0f, 0.0f,-1.0f, 0 };
               glTexGeni(GL_R, GL_TEXTURE_GEN_MODE, GL_OBJECT_LINEAR);
               glTexGeni(GL_S, GL_TEXTURE_GEN_MODE, GL_OBJECT_LINEAR);
               glTexGeni(GL_T, GL_TEXTURE_GEN_MODE, GL_OBJECT_LINEAR);
               glTexGenfv(GL_R, GL_OBJECT_PLANE, zPlane);
               glTexGenfv(GL_S, GL_OBJECT_PLANE, xPlane);
               glTexGenfv(GL_T, GL_OBJECT_PLANE, yPlane);

               glEnable(GL_TEXTURE_GEN_R);
               glEnable(GL_TEXTURE_GEN_S);
               glEnable(GL_TEXTURE_GEN_T);
            #endif

               GLDisableClientState(TEXCOORDS);
            }
            else
            {
            #if _GLES
               glDisable(GL_TEXTURE_GEN_STR);
            #else
               glDisable(GL_TEXTURE_GEN_R);
               glDisable(GL_TEXTURE_GEN_S);
               glDisable(GL_TEXTURE_GEN_T);
            #endif

               if(tmu > 1)
                  oglMesh.texCoords.use(texCoord, 2, GL_FLOAT, 0, oglMesh.texCoords.buffer ? null : mesh.texCoords);
               GLEnableClientState(TEXCOORDS);
            }
            if(glClientActiveTexture) glClientActiveTexture(GL_TEXTURE0);
         }
#endif
         if(flags.setupTextures)
         {
            glTexParameteri(diffuseTarget, GL_TEXTURE_WRAP_S, flags.tile ? GL_REPEAT : glClampFunction(oglDisplay.version));
            glTexParameteri(diffuseTarget, GL_TEXTURE_WRAP_T, flags.tile ? GL_REPEAT : glClampFunction(oglDisplay.version));
         }
      }
      else
      {
         GLSetupTexturing(false);
      }

#if ENABLE_GL_FFP && !defined(_GLES)
      if(!glCaps_shaders)
      {
         int separate = material.flags.separateSpecular ? GL_SEPARATE_SPECULAR_COLOR : GL_SINGLE_COLOR;
         if(separate != lastSeparate)
         {
            if(oglDisplay.version >= 2)
               GLLightModeli(GL_LIGHT_MODEL_COLOR_CONTROL, separate);
            lastSeparate = separate;
         }
      }
#endif

      if((flags.cubeMap && material.baseMap) ||
         (mesh.texCoords && (material.baseMap || material.bumpMap || material.specularMap || material.reflectMap)))
      {
#if ENABLE_GL_FFP
         if(!glCaps_shaders)
         {
            if(glActiveTexture) glActiveTexture(GL_TEXTURE0 + tmu - 1);
            if(glClientActiveTexture) glClientActiveTexture(GL_TEXTURE0 + tmu - 1);
         }
#endif
         GLMatrixMode(MatrixMode::texture);
         GLLoadIdentity();
         if(material.uScale && material.vScale)
            GLScalef(material.uScale, material.vScale, 1);
         GLMatrixMode(MatrixMode::modelView);
#if ENABLE_GL_FFP
         if(!glCaps_shaders)
         {
            if(glActiveTexture) glActiveTexture(GL_TEXTURE0);
            if(glClientActiveTexture) glClientActiveTexture(GL_TEXTURE0);
         }
#endif
      }

#if ENABLE_GL_FFP
      if(!glCaps_shaders)
      {
         if(material.envMap && material.refractiveIndex)
         {
            float color[4] = { material.opacity, material.opacity, material.opacity, 1.0 };
            if(glActiveTexture) glActiveTexture(GL_TEXTURE0 + tmu);
            if(glClientActiveTexture) glClientActiveTexture(GL_TEXTURE0 + tmu++);
            glBindTexture(GL_TEXTURE_CUBE_MAP, (GLuint)(uintptr)material.envMap.driverData);
            glEnable(GL_TEXTURE_CUBE_MAP);
         #if _GLES
            glEnable(GL_TEXTURE_GEN_STR);
            glTexGeni(GL_TEXTURE_GEN_STR_OES, GL_TEXTURE_GEN_MODE, GL_REFLECTION_MAP);
         #else
            glTexGeni(GL_R, GL_TEXTURE_GEN_MODE, GL_REFLECTION_MAP);
            glTexGeni(GL_S, GL_TEXTURE_GEN_MODE, GL_REFLECTION_MAP);
            glTexGeni(GL_T, GL_TEXTURE_GEN_MODE, GL_REFLECTION_MAP);
            glEnable(GL_TEXTURE_GEN_R);
            glEnable(GL_TEXTURE_GEN_S);
            glEnable(GL_TEXTURE_GEN_T);
         #endif

            glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_COMBINE);

            if(normalMapped)
               glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_RGB, GL_MODULATE);
            else
               glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_RGB, GL_INTERPOLATE);
            glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_ALPHA, GL_MODULATE);

            glTexEnvi(GL_TEXTURE_ENV, GL_SRC0_RGB, GL_PREVIOUS);
            glTexEnvi(GL_TEXTURE_ENV, GL_SRC0_ALPHA, GL_PREVIOUS);

            glTexEnvi(GL_TEXTURE_ENV, GL_SRC1_RGB, GL_TEXTURE);
            glTexEnvi(GL_TEXTURE_ENV, GL_SRC1_ALPHA, GL_TEXTURE);

            glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND0_RGB, GL_SRC_COLOR);
            glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND1_RGB, GL_SRC_COLOR);

            glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND0_ALPHA, GL_SRC_ALPHA);
            glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND1_ALPHA, GL_SRC_ALPHA);

            if(!normalMapped)
            {
               glTexEnvi(GL_TEXTURE_ENV, GL_SRC2_RGB, GL_CONSTANT);
               glTexEnvi(GL_TEXTURE_ENV, GL_SRC2_ALPHA, GL_CONSTANT);
               glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND2_RGB, GL_SRC_COLOR);
               glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND2_ALPHA, GL_SRC_ALPHA);
            }

            glTexEnvfv(GL_TEXTURE_ENV, GL_TEXTURE_ENV_COLOR, color );

            GLMatrixMode(MatrixMode::texture);
            {
               double * s = display.display3D.camera.viewMatrix.array;
               double k = 2.0;
               Matrix m
               { {
                  k*s[0],-k*s[4],-k*s[8], 0,
                  k*s[1],-k*s[5],-k*s[9], 0,
                  k*s[2],-k*s[6],-k*s[10],0,
                  0,0,0,1
               } };
               GLLoadMatrixd(m.array);
            }
            GLMatrixMode(MatrixMode::modelView);
         }

         if(material.envMap && material.reflectivity)
         {
            float color[4] = { 1.0f - material.reflectivity, 1.0f - material.reflectivity, 1.0f - material.reflectivity, 1.0 };
            if(glActiveTexture) glActiveTexture(GL_TEXTURE0 + tmu);
            if(glClientActiveTexture) glClientActiveTexture(GL_TEXTURE0 + tmu++);
            glBindTexture(GL_TEXTURE_CUBE_MAP, (GLuint)(uintptr)material.envMap.driverData);
            glEnable(GL_TEXTURE_CUBE_MAP);
         #if _GLES
            glEnable(GL_TEXTURE_GEN_STR);
            glTexGeni(GL_TEXTURE_GEN_STR_OES, GL_TEXTURE_GEN_MODE, GL_REFLECTION_MAP);
         #else
            glTexGeni(GL_R, GL_TEXTURE_GEN_MODE, GL_REFLECTION_MAP);
            glTexGeni(GL_S, GL_TEXTURE_GEN_MODE, GL_REFLECTION_MAP);
            glTexGeni(GL_T, GL_TEXTURE_GEN_MODE, GL_REFLECTION_MAP);
            glEnable(GL_TEXTURE_GEN_R);
            glEnable(GL_TEXTURE_GEN_S);
            glEnable(GL_TEXTURE_GEN_T);
         #endif

            glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_COMBINE);

            if(normalMapped)
               glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_RGB, GL_MODULATE);
            else
               glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_RGB, GL_INTERPOLATE);
            glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_ALPHA, GL_MODULATE);

            glTexEnvi(GL_TEXTURE_ENV, GL_SRC0_RGB, GL_PREVIOUS);
            glTexEnvi(GL_TEXTURE_ENV, GL_SRC0_ALPHA, GL_PREVIOUS);

            glTexEnvi(GL_TEXTURE_ENV, GL_SRC1_RGB, GL_TEXTURE);
            glTexEnvi(GL_TEXTURE_ENV, GL_SRC1_ALPHA, GL_TEXTURE);
            glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND0_RGB, GL_SRC_COLOR);
            glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND1_RGB, GL_SRC_COLOR);
            glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND0_ALPHA, GL_SRC_ALPHA);
            glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND1_ALPHA, GL_SRC_ALPHA);

            if(!normalMapped)
            {
               glTexEnvi(GL_TEXTURE_ENV, GL_SRC2_RGB, GL_CONSTANT);
               glTexEnvi(GL_TEXTURE_ENV, GL_SRC2_ALPHA, GL_CONSTANT);
               glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND2_RGB, GL_SRC_COLOR);
               glTexEnvi(GL_TEXTURE_ENV, GL_OPERAND2_ALPHA, GL_SRC_ALPHA);
            }

            glTexEnvfv(GL_TEXTURE_ENV, GL_TEXTURE_ENV_COLOR, color );

            GLMatrixMode(MatrixMode::texture);
            {
               double * s = display.display3D.camera.inverseTranspose.array;
               Matrix m
               { {
                  s[0],s[1],-s[2],0,
                  s[4],-s[5],-s[6],0,
                  -s[8],s[9],s[10],0,
                  0,0,0,1
               } };
               GLLoadMatrixd(m.array);
            }
            GLMatrixMode(MatrixMode::modelView);
         }
      }
#endif

#if ENABLE_GL_FFP
      if(!glCaps_shaders)
      {
         disableRemainingTMUs(display, tmu);

         if(mesh.flags.colors)
         {
            GLColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE);
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
         if(material.power > 0.1)
         {
            float color[4] = { material.specular.r, material.specular.g, material.specular.b, 0 };
            glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, color);
         }
         else
         {
            float color[4] = { 0,0,0,0 };
            glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, color);
         }
         {
            float color[4] = { material.emissive.r, material.emissive.g, material.emissive.b, 0 };
            glMaterialfv(GL_FRONT_AND_BACK, GL_EMISSION, color);
         }
         glMaterialfv(GL_FRONT_AND_BACK, GL_SHININESS, &material.power);
      }
#endif
      material.flags.setupTextures = false;

#ifdef _DEBUG
      CheckGLErrors(__FILE__, __LINE__);
#endif
   }

   void FreeMesh(DisplaySystem displaySystem, Mesh mesh)
   {
      OGLMesh oglMesh = mesh.data;
      OGLSystem oglSystem = displaySystem.driverData;
      GLCapabilities caps = glCaps;
      if(oglSystem) SETCAPS(oglSystem.capabilities);

      if(mesh.mab && oglMesh)
      {
         int baseVertex = mesh.baseVertex;
         oglMesh.vertices.buffer = 0;
         if(baseVertex != -1)
         {
            uint vSize = 8 * sizeof(float);
            mesh.mab.freeBlock(BlockEntry { baseVertex * vSize, (baseVertex + mesh.nVertices) * vSize-1 });
            mesh.baseVertex = -1;
         }
      }

      if(!mesh.flags.vertices)
      {
         if(oglMesh) oglMesh.vertices.free();
         delete mesh.vertices;
      }
      if(!mesh.flags.normals)
      {
         if(oglMesh) oglMesh.normals.free();
         delete mesh.normals;
      }
      if(!mesh.flags.tangents)
      {
         if(oglMesh) oglMesh.tangents.free();
         delete mesh.tangents;
      }
      if(!mesh.flags.lightVectors)
      {
         if(oglMesh) oglMesh.lightVectors.free();
         delete mesh.lightVectors;
      }
      if(!mesh.flags.texCoords1)
      {
         if(oglMesh) oglMesh.texCoords.free();
         delete mesh.texCoords;
      }
      if(!mesh.flags.texCoords2)
      {
         if(oglMesh) oglMesh.texCoords2.free();
         // delete mesh.texCoords2;
      }
      if(!mesh.flags.colors)
      {
         if(oglMesh) oglMesh.colors.free();
         delete mesh.colors;
      }
      if(!mesh.flags)
      {
         delete oglMesh;
         mesh.data = null;
      }
      if(oglSystem) SETCAPS(caps);
   }

   bool AllocateMesh(DisplaySystem displaySystem, Mesh mesh, MeshFeatures flags, int nVertices)
   {
      bool result = false;
      OGLMesh oglMesh = mesh.data;
      bool memAllocOnly = flags.memAllocOnly;
      bool interleaved = flags.interleaved;
      flags &= ~{ memAllocOnly = true, interleaved = true };

      if(!oglMesh)
         mesh.data = oglMesh = OGLMesh { };
      if(mesh.data)
      {
         if(mesh.nVertices == nVertices)
         {
            // Same number of vertices, adding features (Leaves the other features pointers alone)
            if(mesh.flags != flags)
            {
               if(interleaved && !flags.doubleVertices && flags.vertices && flags.normals && flags.texCoords1)
               {
                  //if(!mesh.vertices)
                  {
                     mesh.vertices = (Vector3Df *)renew mesh.vertices float[8*nVertices];
                     if(!memAllocOnly)
                        oglMesh.vertices.allocate(nVertices * 8*sizeof(float), null, staticDraw);
                  }
               }
               else
               {
                  if(!mesh.flags.vertices && flags.vertices)
                  {
                     if(flags.doubleVertices)
                     {
                        mesh.vertices = (Vector3Df *)new Vector3D[nVertices];
                     }
                     else
                        mesh.vertices = new Vector3Df[nVertices];
                     if(!memAllocOnly)
                        oglMesh.vertices.allocate(nVertices * (mesh.flags.doubleVertices ? sizeof(Vector3D) : sizeof(Vector3Df)), null, staticDraw);
                  }
                  if(!mesh.flags.normals && flags.normals)
                  {
                     if(flags.doubleNormals)
                     {
                        mesh.normals = (Vector3Df *)new Vector3D[nVertices];
                     }
                     else
                        mesh.normals = new Vector3Df[nVertices];
                     if(!memAllocOnly)
                        oglMesh.normals.allocate(nVertices * (mesh.flags.doubleNormals ? sizeof(Vector3D) : sizeof(Vector3Df)), null, staticDraw);
                  }
                  if(!mesh.flags.tangents && flags.tangents)
                  {
                     mesh.tangents = new Vector3Df[2*nVertices];
                     if(!memAllocOnly)
                        oglMesh.tangents.allocate(nVertices * 2*sizeof(Vector3Df), null, staticDraw);
                  }
                  if(!mesh.flags.lightVectors && flags.lightVectors)
                  {
                     mesh.lightVectors = new ColorRGB[nVertices];
                     if(!memAllocOnly)
                        oglMesh.lightVectors.allocate(nVertices * sizeof(ColorRGB), null, staticDraw);
                  }
                  if(!mesh.flags.texCoords1 && flags.texCoords1)
                  {
                     mesh.texCoords = new Pointf[nVertices];
                     if(!memAllocOnly)
                        oglMesh.texCoords.allocate(nVertices * sizeof(Pointf), null, staticDraw);
                  }
                  if(!mesh.flags.colors && flags.colors)
                  {
                     mesh.colors = new ColorRGBAf[nVertices];
                     if(!memAllocOnly)
                        oglMesh.colors.allocate(nVertices * sizeof(ColorRGBAf), null, staticDraw);
                  }
               }
            }
         }
         else
         {
            // New number of vertices, reallocate all current and new features
            flags |= mesh.flags;
            if(interleaved && !flags.doubleVertices && flags.vertices && flags.normals && flags.texCoords1)
            {
               mesh.vertices = (Vector3Df *)renew mesh.vertices float[8*nVertices];
               if(!memAllocOnly)
                  oglMesh.vertices.allocate(nVertices * 8*sizeof(float), null, staticDraw);
            }
            else
            {
               if(flags.vertices)
               {
                  if(flags.doubleVertices)
                  {
                     mesh.vertices = (Vector3Df *)renew mesh.vertices Vector3D[nVertices];
                  }
                  else
                     mesh.vertices = renew mesh.vertices Vector3Df[nVertices];
                  if(!memAllocOnly)
                     oglMesh.vertices.allocate(nVertices * (mesh.flags.doubleVertices ? sizeof(Vector3D) : sizeof(Vector3Df)), null, staticDraw);
               }
               if(flags.normals)
               {
                  if(flags.doubleNormals)
                  {
                     mesh.normals = (Vector3Df *)renew mesh.normals Vector3D[nVertices];
                  }
                  else
                     mesh.normals = renew mesh.normals Vector3Df[nVertices];
                  if(!memAllocOnly)
                     oglMesh.normals.allocate(nVertices * (mesh.flags.doubleNormals ? sizeof(Vector3D) : sizeof(Vector3Df)), null, staticDraw);
               }
               if(flags.texCoords1)
               {
                  mesh.texCoords = renew mesh.texCoords Pointf[nVertices];
                  if(!memAllocOnly)
                     oglMesh.texCoords.allocate(nVertices * sizeof(Pointf), null, staticDraw);
               }
               if(flags.colors)
               {
                  mesh.colors = renew mesh.colors ColorRGBAf[nVertices];
                  if(!memAllocOnly)
                     oglMesh.colors.allocate(nVertices * sizeof(ColorRGBAf), null, staticDraw);
               }
               if(flags.tangents)
               {
                  mesh.tangents = renew mesh.tangents Vector3Df[2 * nVertices];
                  if(!memAllocOnly)
                     oglMesh.tangents.allocate(nVertices * 2*sizeof(Vector3Df), null, staticDraw);
               }
               if(flags.lightVectors)
               {
                  mesh.lightVectors = renew mesh.lightVectors ColorRGB[nVertices];
                  if(!memAllocOnly)
                     oglMesh.lightVectors.allocate(nVertices * sizeof(ColorRGB), null, staticDraw);
               }
            }
         }
         oglMesh.needAlloc = memAllocOnly;
         oglMesh.interleaved = interleaved;
         result = true;
      }
      return result;
   }

   void UnlockMesh(DisplaySystem displaySystem, Mesh mesh, MeshFeatures flags)
   {
      OGLSystem oglSystem = displaySystem.driverData;
      GLCapabilities caps = glCaps;
      SETCAPS(oglSystem.capabilities);
      // TODO: Not yet handling single allocation of all (shared) mesh indices when uploading separately
      if(glCaps_vertexBuffer)
      {
         GLMB mab = mesh.mab;
         OGLMesh oglMesh = mesh.data;
         if(!oglMesh)
            oglMesh = mesh.data = OGLMesh { needAlloc = true };

         if(!flags) flags = mesh.flags;

         if(mab)
         {
            int nVertices = mesh.nVertices;
            uint vSize = 8 * sizeof(float);
            if(oglMesh.needAlloc)
            {
               BlockEntry block = mab.allocate(attributes, nVertices * vSize);
               oglMesh.interleaved = true;
               mesh.baseVertex = block ? block.start / vSize : -1;
               oglMesh.vertices.buffer = mab.ab.buffer;
               oglMesh.needAlloc = false;
            }
            if(flags.interleaved)
               oglMesh.vertices.upload(vSize * mesh.baseVertex, nVertices * vSize, mesh.vertices);
            else
            {
               // Interleave here for MAB if the data isn't already interleaved..
               float * buf = new float[nVertices * 8];
               int i;
               Vector3Df * vertices = mesh.vertices;
               Vector3Df * normals = mesh.normals;
               Pointf * texCoords = mesh.texCoords;
               for(i = 0; i < nVertices; i++)
               {
                  float * v = buf + (i << 3);
                  if(vertices)
                     memcpy(v, vertices + i, 3 * sizeof(float));
                  if(normals)
                     memcpy(v + 3, normals + i, 3 * sizeof(float));
                  else
                     memset(v + 3, 0, 3 * sizeof(float));
                  if(texCoords)
                     memcpy(v + 6, texCoords + i, 2 * sizeof(float));
                  else
                     memset(v + 6, 0, 2 * sizeof(float));
               }
               oglMesh.vertices.upload(vSize * mesh.baseVertex, nVertices * vSize, buf);
               delete buf;
            }
         }
         else if(oglMesh.interleaved && !flags.doubleVertices && flags.vertices && flags.normals && flags.texCoords1)
         {
            // temporary solution for interleaved attributes
            if(oglMesh.needAlloc)
            {
               oglMesh.vertices.allocate(mesh.nVertices * 8 * sizeof(float), mesh.vertices, staticDraw);
               oglMesh.needAlloc = false;
            }
            else
               oglMesh.vertices.upload(0, mesh.nVertices * 8 * sizeof(float), mesh.vertices);
         }
         else if(!mab && oglMesh.needAlloc)
         {
            if(flags.vertices)
               oglMesh.vertices.allocate(mesh.nVertices * (mesh.flags.doubleVertices ? sizeof(Vector3D) : sizeof(Vector3Df)), mesh.vertices, staticDraw);
            if(flags.normals)
               oglMesh.normals.allocate(mesh.nVertices * (mesh.flags.doubleNormals ? sizeof(Vector3D) : sizeof(Vector3Df)), mesh.normals, staticDraw);
            if(flags.texCoords1)
               oglMesh.texCoords.allocate(mesh.nVertices * sizeof(Pointf), mesh.texCoords, staticDraw);
            if(flags.colors)
               oglMesh.colors.allocate(mesh.nVertices * sizeof(ColorRGBAf), mesh.colors, staticDraw);
            if(flags.tangents)
               oglMesh.tangents.allocate(mesh.nVertices * 2*sizeof(Vector3Df), mesh.tangents, staticDraw);
            if(flags.lightVectors)
               oglMesh.lightVectors.allocate(mesh.nVertices * sizeof(ColorRGB), mesh.lightVectors, staticDraw);
            oglMesh.needAlloc = false;
         }
         else
         {
            if(flags.vertices)
               oglMesh.vertices.upload(0, mesh.nVertices * (mesh.flags.doubleVertices ? sizeof(Vector3D) : sizeof(Vector3Df)), mesh.vertices);
            if(flags.normals)
               oglMesh.normals.upload(0, mesh.nVertices * (mesh.flags.doubleNormals ? sizeof(Vector3D) : sizeof(Vector3Df)), mesh.normals);
            if(flags.texCoords1)
               oglMesh.texCoords.upload(0, mesh.nVertices * sizeof(Pointf), mesh.texCoords);

            if(flags.colors)
               oglMesh.colors.upload(0, mesh.nVertices * sizeof(ColorRGBAf), mesh.colors);

            if(flags.tangents)
               oglMesh.tangents.upload(0, mesh.nVertices * 2*sizeof(Vector3Df), mesh.tangents);

            if(flags.lightVectors)
               oglMesh.lightVectors.upload(0, mesh.nVertices * sizeof(ColorRGB), mesh.lightVectors);
         }
      }
      SETCAPS(caps);
   }

   bool LockMesh(DisplaySystem displaySystem, Mesh mesh, MeshFeatures flags)
   {
      bool result = true;

      return result;
   }

   void FreeIndices(DisplaySystem displaySystem, PrimitiveSingle group)
   {
      OGLIndices oglIndices = group.data;
      OGLSystem oglSystem = displaySystem.driverData;
      GLCapabilities caps = glCaps;
      SETCAPS(oglSystem.capabilities);

      if(oglIndices)
      {
         oglIndices.buffer.free();
         delete oglIndices;
      }
      SETCAPS(caps);
   }

   void * AllocateIndices(DisplaySystem displaySystem, int nIndices, bool indices32bit)
   {
      return OGLIndices { nIndices = nIndices };
   }

   void UnlockIndices(DisplaySystem displaySystem, PrimitiveSingle group, bool indices32bit, int nIndices, GLMB mb)
   {
      OGLSystem oglSystem = displaySystem.driverData;
      GLCapabilities caps = glCaps;
      OGLIndices oglIndices = group.data;
      SETCAPS(oglSystem.capabilities);

      // TODO: Not yet handling single allocation of all (shared) mesh indices when uploading separately
      if(glCaps_vertexBuffer)
      {
         uint16 * b = group.indices;
         uint ixSize = indices32bit ? sizeof(uint32) : sizeof(uint16);
         uint size = nIndices * ixSize;
         if(!glCaps_intAndDouble && indices32bit)
         {
            uint * pointer = (uint *)b;
            int i;
            if(nIndices > oglSystem.shortBDSize)
            {
               oglSystem.shortBDSize = nIndices;
               oglSystem.shortBDBuffer = renew oglSystem.shortBDBuffer uint16[oglSystem.shortBDSize];
            }
            b = oglSystem.shortBDBuffer;
            for(i = 0; i < nIndices; i++)
               b[i] = (uint16)pointer[i];
            size = nIndices * sizeof(uint16);
         }
         if(!oglIndices) { group.data = oglIndices = OGLIndices { nIndices = 0 }; };
         if(mb == null && (!oglIndices.buffer.buffer || oglIndices.nIndices == nIndices))
            oglIndices.buffer.allocate(size, b, staticDraw);
         else
         {
            if(mb != null)
            {
               BlockEntry block = mb.allocate(elements, size);
               group.baseIndex = block ? block.start / ixSize : -1;
               oglIndices.buffer.buffer = mb.ab.buffer;
            }
            oglIndices.buffer.upload(group.baseIndex * ixSize, size, b);
         }
      }
      SETCAPS(caps);
   }

   void * LockIndices(DisplaySystem displaySystem, PrimitiveSingle group)
   {
      return (void *)1;
   }

   void SelectMesh(Display display, Mesh mesh)
   {
#if !defined(_GLES) && !defined(_GLES2) && !defined(__APPLE__) && !defined(__UWP__)
#if defined(__WIN32__)
      if(glUnlockArraysEXT)
#endif
         if(!glCaps_vertexBuffer && display.display3D && display.display3D.mesh)
            glUnlockArraysEXT();
#endif
      if(mesh)
      {
         OGLMesh oglMesh = mesh.data;
         bool collectingHits = display.display3D && display.display3D.collectingHits;
         int baseVertexOffset = 0;

#if defined(_GLES) || defined(_GLES2)
         baseVertexOffset = mesh.baseVertex;
#endif

         // *** Vertex Stream ***
         GLEnableClientState(VERTICES);
         if(!collectingHits && oglMesh)
         {
            bool interleaved = oglMesh.interleaved;
            if(mesh.mab && !mesh.mab.keepSameBufferID)
            {
               uint buffer = mesh.mab.ab.buffer;
               oglMesh.vertices.buffer = buffer;
            }
            oglMesh.vertices.use(vertex, 3, (mesh.flags.intVertices ? GL_INT : mesh.flags.doubleVertices ? GL_DOUBLE : GL_FLOAT),
               interleaved ? 8*sizeof(float) : 0,
               oglMesh.vertices.buffer ? (void *)((baseVertexOffset*8)*sizeof(float)) : (void *)mesh.vertices);

            // *** Normals Stream ***
            if(mesh.normals || mesh.flags.normals)
            {
               GLEnableClientState(NORMALS);
               if(interleaved)
                  oglMesh.vertices.use(normal, 3, GL_FLOAT, 8*sizeof(float), (void *)((baseVertexOffset*8+3)*sizeof(float)));
               else
                  oglMesh.normals.use(normal, 3, GL_FLOAT, 0, oglMesh.normals.buffer ? (void *)((baseVertexOffset*3)*sizeof(float)) : mesh.normals);
            }
            else
               GLDisableClientState(NORMALS);

#if ENABLE_GL_SHADERS
            if(glCaps_shaders && !oglMesh.interleaved)    // Currently not working for interleave...
            {
               // *** Tangents Stream ***
               if(mesh.tangents || mesh.flags.tangents)
               {
                  GLEnableClientState(TANGENTS1);
                  GLEnableClientState(TANGENTS2);
                  oglMesh.tangents.use(tangent1, 3, GL_FLOAT, sizeof(Vector3Df)*2, oglMesh.tangents.buffer ? (void *)(baseVertexOffset * 6 * sizeof(float)) : mesh.tangents);
                  oglMesh.tangents.use(tangent2, 3, GL_FLOAT, sizeof(Vector3Df)*2, oglMesh.tangents.buffer ? (void *)((baseVertexOffset*6 + 3) * sizeof(float)) : mesh.tangents+1);
               }
               else
               {
                  GLDisableClientState(TANGENTS1);
                  GLDisableClientState(TANGENTS2);
               }
            }
#endif

            // *** Texture Coordinates Stream ***
            if(mesh.texCoords || mesh.flags.texCoords1)
            {
               GLEnableClientState(TEXCOORDS);
               if(interleaved)
                  oglMesh.vertices.use(texCoord, 2, GL_FLOAT, 8*sizeof(float), (void *)((baseVertexOffset*8 + 6)*sizeof(float)));
               else
                  oglMesh.texCoords.use(texCoord, 2, GL_FLOAT, 0, oglMesh.texCoords.buffer ? (void *)(baseVertexOffset*2 *sizeof(float)) : mesh.texCoords);
            }
            else
               GLDisableClientState(TEXCOORDS);

#if ENABLE_GL_FFP
            if(!glCaps_shaders)
            {
               // *** Normal Map Aligned Light Vector ***
               if(mesh.lightVectors || mesh.flags.lightVectors)
               {
                  GLEnableClientState(LIGHTVECTORS);
                  oglMesh.lightVectors.use(lightVector, 3, GL_FLOAT, 0, oglMesh.lightVectors.buffer ? null : mesh.lightVectors);
               }
               else
                  GLDisableClientState(LIGHTVECTORS);
            }
            else
#endif
            // *** Color Stream ***
            if(mesh.colors || mesh.flags.colors)
            {
               GLEnableClientState(COLORS);
               oglMesh.colors.use(color, 4, GL_FLOAT, 0, oglMesh.colors.buffer ? (void *)(baseVertexOffset * 4 * sizeof(float)) : mesh.colors);
            }
            else
               GLDisableClientState(COLORS);
         }
         else
         {
            noAB.use(vertex, 3, (mesh.flags.intVertices ? GL_INT : mesh.flags.doubleVertices ? GL_DOUBLE : GL_FLOAT), 0, (double *)mesh.vertices);
            if((mesh.normals || mesh.flags.normals) && !collectingHits)
            {
               GLEnableClientState(NORMALS);
               noAB.use(normal, 3, GL_FLOAT, 0, mesh.normals);
            }
            else
               GLDisableClientState(NORMALS);
#if ENABLE_GL_SHADERS
            if(glCaps_shaders)
            {
               if((mesh.tangents || mesh.flags.tangents) && !collectingHits)
               {
                  GLEnableClientState(TANGENTS1);
                  GLEnableClientState(TANGENTS2);
                  noAB.use(tangent1, 3, GL_FLOAT, sizeof(Vector3Df)*2, mesh.tangents);
                  noAB.use(tangent2, 3, GL_FLOAT, sizeof(Vector3Df)*2, mesh.tangents+1);
               }
               else
               {
                  GLDisableClientState(TANGENTS1);
                  GLDisableClientState(TANGENTS2);
               }
            }
#endif

            if((mesh.texCoords || mesh.flags.texCoords1) && !collectingHits)
            {
               GLEnableClientState(TEXCOORDS);
               noAB.use(texCoord, 2, GL_FLOAT, 0, mesh.texCoords);
            }
            else
               GLDisableClientState(TEXCOORDS);

#if ENABLE_GL_FFP
            if(!glCaps_shaders)
            {
               if((mesh.lightVectors || mesh.flags.lightVectors) && !collectingHits)
               {
                  GLEnableClientState(LIGHTVECTORS);
                  noAB.use(lightVector, 3, GL_FLOAT, sizeof(ColorRGB), mesh.lightVectors);
               }
               else
                  GLDisableClientState(LIGHTVECTORS);
            }
            else
#endif
            if((mesh.colors || mesh.flags.colors) && !collectingHits)
            {
               GLEnableClientState(COLORS);
               noAB.use(color, 4, GL_FLOAT, 0, mesh.colors);
            }
            else
               GLDisableClientState(COLORS);
         }

#if !defined(__ANDROID__) && !defined(__APPLE__) && !defined(__ODROID__) && !defined(__EMSCRIPTEN__) && !defined(__UWP__)

#if defined(__WIN32__)
         if(glLockArraysEXT)
#endif
            if(!glCaps_vertexBuffer)
               glLockArraysEXT(0, mesh.nVertices);
#endif
      }
#ifdef _DEBUG
      CheckGLErrors(__FILE__, __LINE__);
#endif
   }

   void DrawPrimitives(Display display, PrimitiveSingle primitive, Mesh mesh)
   {
      PrimitiveGroupType type = primitive.type;
      if(type.vertexRange)
      {
         GLFlushMatrices();
         glDrawArrays(getPrimitiveType(type.primitiveType), primitive.first, primitive.nVertices);
      }
      else
      {
         Display3D display3D = display.display3D;
         uint primType = getPrimitiveType(type.primitiveType);
         bool indices32Bit = type.indices32bit;
         OGLIndices oglIndices = mesh.displaySystem ? primitive.data : null;
         bool collectingHits = display3D && display3D.collectingHits;
         GLEAB eab = ((!collectingHits && oglIndices && glCaps_vertexBuffer) ? oglIndices.buffer : noEAB);
         uint nIndices = primitive.nIndices;
         if(mesh.meab && (!oglIndices || !mesh.meab.keepSameBufferID))
            eab.buffer = mesh.meab.ab.buffer;

         if(!glCaps_intAndDouble && !glCaps_vertexBuffer && indices32Bit)
         {
            uint16 * temp = new uint16[nIndices];
            uint32 * src = (uint32 *)(oglIndices ? primitive.indices : primitive.indices);
            int i;
            for(i = 0; i < primitive.nIndices; i++)
               temp[i] = (uint16)src[i];
            eab.draw(primType, nIndices, GL_UNSIGNED_SHORT, temp);
            delete temp;
         }
         else
            eab.draw2(getPrimitiveType(type.primitiveType), nIndices,
               indices32Bit ? GL_UNSIGNED_INT : GL_UNSIGNED_SHORT,
               eab.buffer ? (void *)(uintptr)(primitive.baseIndex * (indices32Bit ? 4 : 2)) : primitive.indices, mesh.baseVertex);
         // TODO: Do this somewhere else... GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
      }
#ifdef _DEBUG
      CheckGLErrors(__FILE__, __LINE__);
#endif
   }

   void PushMatrix(Display display)
   {
      GLPushMatrix();
   }

   void PopMatrix(Display display, bool setMatrix)
   {
      GLPopMatrix();
   }

   void SetTransform(Display display, Matrix transMatrix, bool viewSpace, bool useCamera)
   {
      Matrix matrix = transMatrix;
      Camera camera = useCamera && display.display3D ? display.display3D.camera : null;

      if(viewSpace)
      {
         GLLoadIdentity();
         GLScaled(1.0/nearPlane, 1.0/nearPlane, -1.0/nearPlane);
      }
      else if(camera)
      {
         Vector3D *cPosition = &camera.cPosition;
         GLTranslated(
            matrix.m[3][0] - cPosition->x,
            matrix.m[3][1] - cPosition->y,
            matrix.m[3][2] - cPosition->z);
      }
      else
         GLTranslated(
            matrix.m[3][0],
            matrix.m[3][1],
            matrix.m[3][2]);

      matrix.m[3][0] = 0;
      matrix.m[3][1] = 0;
      matrix.m[3][2] = 0;

      GLMultMatrixd(matrix.array);
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
#if defined(__WIN32__) && !defined(__UWP__)
      OGLSystem system = displaySystem.driverData;
      return system.glrc;
#elif defined(__ANDROID__) || defined(__ODROID__) || defined(__UWP__)
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
