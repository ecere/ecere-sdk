#if defined(__EMSCRIPTEN__)
   #if !defined(_GLES2)
      #define _GLES2
   #endif
#elif defined(__ANDROID__) || defined(__ODROID__)
   #ifndef _GLES
      #define _GLES
   #endif
#endif

#if defined(_GLES2)
   #include <GLES2/gl2.h>
#elif defined(_GLES)
/*
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
*/
   #define GL_GLEXT_PROTOTYPES
   #include <GLES/gl.h>
   #include <GLES/glext.h>

/*
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
*/
#else
   #include <gl_compat_4_4.h>
#endif

#ifdef _GLES
   // Frame Buffer Extensions
   #define GL_FRAMEBUFFER           GL_FRAMEBUFFER_OES
   #define GL_RENDERBUFFER          GL_RENDERBUFFER_OES
   #define GL_COLOR_ATTACHMENT0     GL_COLOR_ATTACHMENT0_OES
   #define glBindFramebuffer        glBindFramebufferOES
   #define glBindRenderbuffer       glBindRenderbufferOES
   #define glFramebufferTexture2D   glFramebufferTexture2DOES
   #define glGenFramebuffers        glGenFramebuffersOES
   #define glGenRenderbuffers       glGenRenderbuffersOES
   #define glDeleteFramebuffers     glDeleteFramebuffersOES
   #define glDeleteRenderbuffers    glDeleteRenderbuffersOES
   #define glBlitFramebuffer        glBlitFramebufferOES // (a,b,c,d,,f,g,h,i,j)

   // TOFIX: Grab Screen and BlitDI/StretchDI will have wrong colors
   #undef GL_BGRA_EXT
   #define GL_BGRA_EXT               GL_RGBA
#else
   #define GL_BGRA_EXT               0x80E1
#endif

// Compiled In Capabilities
#define ENABLE_GL_SHADERS  (!defined(_GLES))
#define ENABLE_GL_FFP      (!defined(_GLES2))
#define ENABLE_GL_POINTER  (!defined(__EMSCRIPTEN__))
#define ENABLE_GL_FBO      (!defined(__EMSCRIPTEN__))
#define ENABLE_GL_LEGACY   (!defined(_GLES) && !defined(_GLES2))
#define ENABLE_GL_INTDBL   (!defined(_GLES) && !defined(_GLES2))
#define ENABLE_GL_MAPBUF   (!defined(_GLES) && !defined(_GLES2))
#define ENABLE_GL_SELECT   (!defined(_GLES) && !defined(_GLES2))
#define ENABLE_GL_COLORMAT (ENABLE_GL_FFP   && !defined(_GLES))

#if ENABLE_GL_SHADERS && ENABLE_GL_FFP
   #define GLEnableClientState            (glcaps_shaders ? glEnableVertexAttribArray : glEnableClientState)
   #define GLDisableClientState           (glcaps_shaders ? glDisableVertexAttribArray : glDisableClientState)
   #define VERTICES                       (glcaps_shaders ? GLBufferContents::vertex : GL_VERTEX_ARRAY)
   #define NORMALS                        (glcaps_shaders ? GLBufferContents::normal : GL_NORMAL_ARRAY)
   #define TEXCOORDS                      (glcaps_shaders ? GLBufferContents::texCoord : GL_TEXTURE_COORD_ARRAY)
   #define COLORS                         (glcaps_shaders ? GLBufferContents::color : GL_COLOR_ARRAY)
   #define GLVertexPointer(n, t, s, p)    (glcaps_shaders ? glVertexAttribPointer(GLBufferContents::vertex,   n, t, GL_FALSE, s, p) : glVertexPointer(n, t, s, p))
   #define GLColorPointer(n, t, s, p)     (glcaps_shaders ? glVertexAttribPointer(GLBufferContents::color,    n, t, GL_FALSE, s, p) : glColorPointer(n, t, s, p))
   #define GLTexCoordPointer(n, t, s, p)  (glcaps_shaders ? glVertexAttribPointer(GLBufferContents::texCoord, n, t, GL_FALSE, s, p) : glTexCoordPointer(n, t, s, p))
#elif ENABLE_GL_SHADERS
   #define GLEnableClientState            glEnableVertexAttribArray
   #define GLDisableClientState           glDisableVertexAttribArray
   #define VERTICES                       GLBufferContents::vertex
   #define NORMALS                        GLBufferContents::normal
   #define TEXCOORDS                      GLBufferContents::texCoord
   #define COLORS                         GLBufferContents::color
   #define GLVertexPointer(n, t, s, p)    glVertexAttribPointer(GLBufferContents::vertex,   n, t, GL_FALSE, s, p)
   #define GLColorPointer(n, t, s, p)     glVertexAttribPointer(GLBufferContents::color,    n, t, GL_FALSE, s, p)
   #define GLTexCoordPointer(n, t, s, p)  glVertexAttribPointer(GLBufferContents::texCoord, n, t, GL_FALSE, s, p)
#else
   #define GLEnableClientState            glEnableClientState
   #define GLDisableClientState           glDisableClientState
   #define VERTICES                       GL_VERTEX_ARRAY
   #define NORMALS                        GL_NORMAL_ARRAY
   #define TEXCOORDS                      GL_TEXTURE_COORD_ARRAY
   #define COLORS                         GL_COLOR_ARRAY
   #define GLVertexPointer                glVertexPointer
   #define GLColorPointer                 glColorPointer
   #define GLTexCoordPointer              glTexCoordPointer
#endif

#if ENABLE_GL_INTDBL && ENABLE_GL_SHADERS
   #define GLLoadMatrixd(m)               (glcaps_fixedFunction ? glLoadMatrixd(m) : glmsLoadMatrixd(m))
   #define GLMultMatrixd(m)               (glcaps_fixedFunction ? glMultMatrixd(m) : glmsMultMatrixd(m))
   #define GLFrustum(a,b,c,d,e,f)         (glcaps_fixedFunction ? glFrustum(a,b,c,d,e,f) : glmsFrustum(a,b,c,d,e,f))
   #define GLOrtho(a,b,c,d,e,f)           (glcaps_fixedFunction ? glOrtho(a,b,c,d,e,f) : glmsOrtho(a,b,c,d,e,f))
   #define GLScaled(x, y, z)              (glcaps_fixedFunction ? glScaled(x, y, z) : glmsScaled(x,y,z))
   #define GLScalef(x, y, z)              (glcaps_fixedFunction ? glScalef(x, y, z) : glmsScaled(x,y,z))
   #define GLTranslated(x, y, z)          (glcaps_fixedFunction ? glTranslated(x,y,z) : glmsTranslated(x,y,z))
   #define GLRotated(a, x, y, z)          (glcaps_fixedFunction ? glRotated(a, x,y,z) : glmsRotated(a,x,y,z))
   #define GLMatrixMode(m)                (glcaps_fixedFunction ? glMatrixMode(m) : glmsMatrixMode(m))
   #define GLLoadIdentity()               (glcaps_fixedFunction ? glLoadIdentity() : glmsLoadIdentity())
   #define GLPushMatrix()                 (glcaps_fixedFunction ? glPushMatrix() : glmsPushMatrix())
   #define GLPopMatrix()                  (glcaps_fixedFunction ? glPopMatrix() : glmsPopMatrix())
   #define GLFlushMatrices()              (glcaps_fixedFunction ? (void)0 : glmsFlushMatrices())
   #define GLLoadMatrix(m)                (glmsLoadMatrix(m), glmsFlushMatrices())
#elif ENABLE_GL_INTDBL
   #define GLLoadMatrixd                  glLoadMatrixd
   #define GLMultMatrixd                  glMultMatrixd
   #define GLFrustum                      glFrustum
   #define GLOrtho                        glOrtho
   #define GLScaled                       glScaled
   #define GLScalef                       glScalef
   #define GLTranslated                   glTranslated
   #define GLRotated                      glRotated
   #define GLMatrixMode                   glMatrixMode
   #define GLLoadIdentity                 glLoadIdentity
   #define GLPushMatrix                   glPushMatrix
   #define GLPopMatrix                    glPopMatrix
   #define GLFlushMatrices()              ((void)0)
   #define GLLoadMatrix(m)                (glmsLoadMatrix(m), glmsFlushMatrices())
#else
   #define GLLoadMatrixd                  glmsLoadMatrixd
   #define GLMultMatrixd                  glmsMultMatrixd
   #define GLFrustum                      glmsFrustum
   #define GLOrtho                        glmsOrtho
   #define GLScaled                       glmsScaled
   #define GLScalef                       glmsScaled
   #define GLTranslated                   glmsTranslated
   #define GLRotated                      glmsRotated
   #define GLMatrixMode                   glmsMatrixMode
   #define GLLoadIdentity                 glmsLoadIdentity
   #define GLPushMatrix                   glmsPushMatrix
   #define GLPopMatrix                    glmsPopMatrix
   #define GLFlushMatrices()              glmsFlushMatrices()
   #define GLLoadMatrix(m)                (glmsLoadMatrix(m), glmsFlushMatrices())
#endif

#if ENABLE_GL_LEGACY
   #define GLRecti(x1, y1, x2, y2)           (glcaps_immediate ? glRecti(x1, y1, x2, y2) : glimtkRecti(x1, y1, x2, y2))
   #define GLBegin(m)                        (glcaps_immediate ? glBegin(m) : glimtkBegin(m))
   #define GLEnd()                           (glcaps_immediate ? glEnd() : glimtkEnd())
   #define GLVertex2i(x,y)                   (glcaps_immediate ? glVertex2i(x,y) : glimtkVertex2i(x,y))
   #define GLVertex2f(x,y)                   (glcaps_immediate ? glVertex2f(x,y) : glimtkVertex2f(x,y))
   #define GLVertex2d(x,y)                   (glcaps_immediate ? glVertex2d(x,y) : glimtkVertex2d(x,y))
   #define GLVertex3f(x,y,z)                 (glcaps_immediate ? glVertex3f(x,y,z) : glimtkVertex3f(x,y,z))
   #define GLVertex3d(x,y,z)                 (glcaps_immediate ? glVertex3d(x,y,z) : glimtkVertex3d(x,y,z))
   #define GLVertex3fv(v)                    (glcaps_immediate ? glVertex3fv(v) : glimtkVertex3fv(v))
   #define GLVertex3dv(v)                    (glcaps_immediate ? glVertex3dv(v) : glimtkVertex3dv(v))
   #define GLTexCoord2i(x,y)                 (glcaps_immediate ? glTexCoord2i(x,y) : glimtkTexCoord2i(x,y))
   #define GLTexCoord2f(x,y)                 (glcaps_immediate ? glTexCoord2f(x,y) : glimtkTexCoord2f(x,y))
   #define GLTexCoord2d(x,y)                 (glcaps_immediate ? glTexCoord2d(x,y) : glimtkTexCoord2d(x,y))
   #define GLTexCoord2fv(v)                  (glcaps_immediate ? glTexCoord2fv(v) : glimtkTexCoord2fv(v))
   #define GLNormal3f(x,y,z)                 (glcaps_immediate ? glNormal3f : glimtkNormal3f)
   #define GLNormal3d(x,y,z)                 (glcaps_immediate ? glNormal3d : glimtkNormal3d)
   #define GLNormal3fv(v)                    (glcaps_immediate ? glNormal3fv(v) : glimtkNormal3fv(v))
   #define GLNormal3dv(v)                    (glcaps_immediate ? glNormal3dv(v) : glimtkNormal3dv(v))
   #define GLColor3f(a,b,c)                  (glcaps_immediate ? glColor3f(a,b,c) : glimtkColor3f(a,b,c))
   #define GLColor4ub(a,b,c,d)               (glcaps_immediate ? glColor4ub(a,b,c,d) : glimtkColor4ub(a,b,c,d))
   #define GLColor4f(a,b,c,d)                (glcaps_immediate ? glColor4f(a,b,c,d) : glimtkColor4f(a,b,c,d))
   #define GLColor4fv(v)                     (glcaps_immediate ? glColor4fv(v) : glimtkColor4fv(v))
#else
   #define GLRecti                           glimtkRecti
   #define GLBegin                           glimtkBegin
   #define GLTexCoord2i                      glimtkTexCoord2i
   #define GLVertex2i                        glimtkVertex2i
   #define GLTexCoord2d                      glimtkTexCoord2d
   #define GLVertex2d                        glimtkVertex2d
   #define GLTexCoord2f                      glimtkTexCoord2f
   #define GLVertex2f                        glimtkVertex2f
   #define GLEnd                             glimtkEnd
   #define GLColor3f                         glimtkColor3f
   #define GLColor4ub                        glimtkColor4ub
   #define GLColor4f                         glimtkColor4f
   #define GLColor4fv                        glimtkColor4fv
   #define GLNormal3f                        glimtkNormal3f
   #define GLNormal3d                        glimtkNormal3d
   #define GLNormal3fv                       glimtkNormal3fv
   #define GLNormal3dv                       glimtkNormal3dv
   #define GLTexCoord2fv                     glimtkTexCoord2fv
   #define GLVertex3d                        glimtkVertex3d
   #define GLVertex3dv                       glimtkVertex3dv
   #define GLVertex3f                        glimtkVertex3f
   #define GLVertex3fv                       glimtkVertex3fv
#endif

#define GLMultMatrix GLMultMatrixd
#define GLGetMatrix  GLGetDoublev
#define GLTranslate  GLTranslated
#define GLScale      GLScaled

#if !ENABLE_GL_INTDBL
   #define GL_INT                                  0x1404
   #define GL_UNSIGNED_INT                         0x1405
   #define GL_DOUBLE                               0x140A
#endif

#if ENABLE_GL_STIPPLES
   #define GLLineStipple                     (stipples ? glLineStipple : glsupLineStipple)
#else
   #define GLLineStipple                     glsupLineStipple
#endif

#if ENABLE_GL_COLORMAT
   #define GLColorMaterial(a,b)              glColorMaterial(a,b)
#else
   #define GLColorMaterial(a,b)
#endif

#ifdef _GLES
   #define GLLightModeli                     glsupLightModeli
#else
   #define GLLightModeli                     glLightModeli
#endif

#define SETCAPS(caps) \
   glcaps                     = caps; \
   glcaps_shaders             = glcaps.shaders; \
   glcaps_fixedFunction       = glcaps.fixedFunction; \
   glcaps_nonPow2Textures     = glcaps.nonPow2Textures; \
   glcaps_vertexBuffer        = glcaps.vertexBuffer; \
   glcaps_quads               = glcaps.quads; \
   glcaps_intAndDouble        = glcaps.intAndDouble; \
   glcaps_immediate           = glcaps.immediate; \
   glcaps_legacy              = glcaps.legacy; \
   glcaps_pointSize           = glcaps.pointSize; \
   glcaps_frameBuffer         = glcaps.frameBuffer;

extern GLCapabilities glcaps;
extern bool glcaps_nonPow2Textures, glcaps_vertexBuffer, glcaps_quads, glcaps_intAndDouble;
extern bool glcaps_shaders, glcaps_fixedFunction, glcaps_immediate, glcaps_legacy, glcaps_pointSize, glcaps_frameBuffer;

#if ENABLE_GL_INTDBL
   #define GL_INDEX_INT GL_UNSIGNED_INT
#else
   #define GL_INDEX_INT GL_UNSIGNED_SHORT
#endif
