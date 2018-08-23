#if defined(__ANDROID__) || defined(__ODROID__)

import "instance"

#include <EGL/egl.h>

EGLDisplay eglDisplay;
EGLSurface eglSurface;
EGLContext eglContext;
int eglWidth, eglHeight;

#if defined(__ANDROID__)
bool egl_init_display(struct ANativeWindow * window)
#else
bool egl_init_display(uint window)
#endif
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

   return true;
}

void egl_term_display()
{
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

void egl_swap_buffers()
{
   eglSwapBuffers(eglDisplay, eglSurface);
}

#endif
