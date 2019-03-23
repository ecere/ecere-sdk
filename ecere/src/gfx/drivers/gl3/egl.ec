#if defined(__ANDROID__) || defined(__ODROID__)

import "instance"

#include <EGL/egl.h>
#if defined(__LUMIN__)
#define get _get
#define set _set
#include <GLES3/gl32.h>
#include <EGL/eglext.h>
#undef get
#undef set

#define bool _bool
#define false _false
#define true _true
#include <ml_api.h>
#undef bool
#undef false
#undef true

#endif

EGLDisplay eglDisplay;
EGLSurface eglSurface;
EGLContext eglContext;
int eglWidth, eglHeight;

#if defined(__LUMIN__)
default void (* _ptrc_glMultiDrawElementsIndirect)(int, GLenum, const void *, GLsizei, GLsizei);
default void (* _ptrc_glMapBuffer)(int, GLenum, const void *, GLsizei, GLsizei);
MLHandle graphics_client = ML_INVALID_HANDLE;
#endif

#if defined(__ANDROID__)
bool egl_init_display(struct ANativeWindow * window)
#else
bool egl_init_display(uint window)
#endif
{
   EGLint attribs[] =
   {
#if defined(__LUMIN__)
      EGL_RED_SIZE, 5,
      EGL_GREEN_SIZE, 6,
      EGL_BLUE_SIZE, 5,
      EGL_ALPHA_SIZE, 0,
      EGL_DEPTH_SIZE, 24,
      EGL_STENCIL_SIZE, 8,
#else
      EGL_SURFACE_TYPE, EGL_WINDOW_BIT,
      EGL_BLUE_SIZE, 8,
      EGL_GREEN_SIZE, 8,
      EGL_RED_SIZE, 8,
      EGL_DEPTH_SIZE, 32,
      /*EGL_SAMPLE_BUFFERS, 1,
      EGL_SAMPLES, 0, //2,*/
#endif
      EGL_NONE
   };
   EGLint w, h, format;
   EGLint numConfigs;
   EGLConfig config;
   EGLSurface surface = EGL_NO_SURFACE;
   EGLContext context;
   EGLint ctxattr[] =
   {
#if defined(__LUMIN__)
      EGL_CONTEXT_MAJOR_VERSION_KHR, 4,
      EGL_CONTEXT_MINOR_VERSION_KHR, 5,
#elif defined(_GLES3)
      EGL_CONTEXT_CLIENT_VERSION, 3,
#elif defined(_GLES2)
      EGL_CONTEXT_CLIENT_VERSION, 2,
#elif defined(_GLES)
      EGL_CONTEXT_CLIENT_VERSION, 1,
#endif
      EGL_NONE
   };

   EGLDisplay display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
#if defined(__LUMIN__)
   EGLint major = 4;
   EGLint minor = 0;
#else
   EGLint major = 0;
   EGLint minor = 0;
#endif
   eglInitialize(display, &major, &minor);
#if defined(__LUMIN__)
   eglBindAPI(EGL_OPENGL_API);
#endif
   eglChooseConfig(display, attribs, &config, 1, &numConfigs);
   if(numConfigs == 0)
   {
#ifdef _DEBUG
      PrintLn("EGL: No 32 bit depth buffer support");
#endif
      attribs[9] = 16;
      eglChooseConfig(display, attribs, &config, 1, &numConfigs);
   }
#if defined(__LUMIN__)
   eglGetConfigAttrib(display, config, EGL_TRUE, &format);
#else
   eglGetConfigAttrib(display, config, EGL_NATIVE_VISUAL_ID, &format);
#endif

#if !defined(__LUMIN__)
   surface = eglCreateWindowSurface(display, config, window, null);
#endif
   context = eglCreateContext(display, config, EGL_NO_CONTEXT, ctxattr);

   if(!eglMakeCurrent(display, surface, surface, context))
      return false;

#if defined(__LUMIN__)
   _ptrc_glMultiDrawElementsIndirect = (void*)eglGetProcAddress("glMultiDrawElementsIndirect");
   _ptrc_glMapBuffer = (void*)eglGetProcAddress("glMapBuffer");
#endif
   eglQuerySurface(display, surface, EGL_WIDTH, &w);
   eglQuerySurface(display, surface, EGL_HEIGHT, &h);

   eglDisplay = display;
   eglContext = context;
   eglSurface = surface;
   eglWidth = w;
   eglHeight = h;

   return true;
}

void egl_term_display()
{
   if(eglDisplay != EGL_NO_DISPLAY)
   {
      eglMakeCurrent(eglDisplay, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
      if(eglContext != EGL_NO_CONTEXT)
         eglDestroyContext(eglDisplay, eglContext);
#if !defined(__LUMIN__)
      if(eglSurface != EGL_NO_SURFACE)
         eglDestroySurface(eglDisplay, eglSurface);
#endif
      eglTerminate(eglDisplay);
   }
   eglDisplay = EGL_NO_DISPLAY;
   eglContext = EGL_NO_CONTEXT;
   eglSurface = EGL_NO_SURFACE;
}

void egl_swap_buffers()
{
   eglSwapBuffers(eglDisplay, eglSurface);
}

#endif
