#if defined(__ANDROID__) || defined(__ODROID__)

#include <EGL/egl.h>

EGLDisplay eglDisplay;
EGLSurface eglSurface;
EGLContext eglContext;
int eglWidth, eglHeight;

#if defined(__ANDROID__)
static bool egl_init_display(ANativeWindow* window)
#else
static bool egl_init_display(uint window)
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

   glViewport(0,0,w,h);
   glmsLoadIdentity();
   glOrtho(0,w,h,0,0.0,1.0);

   glabCurArrayBuffer = 0;
   glabCurElementBuffer = 0;
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
