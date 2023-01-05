#if defined(__WIN32__)
   #define GetObject
   #define MessageBox _MessageBox
   #define Sleep _Sleep
   #define Polygon _Polygon
   #define Size Size_
   #define String String_
   #define Alignment Alignment_

   #define WIN32_LEAN_AND_MEAN
#endif

#if defined(__EMSCRIPTEN__)
   #if !defined(_GLES3)
      #define _GLES3
   #endif
#elif defined(__ANDROID__) // Moving Android to GLES 2
   #if !defined(_GLES2)
      #define _GLES2
   #endif
#elif /*defined(__ANDROID__) || */defined(__ODROID__)
   #ifndef _GLES
      #define _GLES
   #endif
#endif

#if defined(_GLES2) || defined(_GLES3)
#if defined(__ANDROID__) || defined(__EMSCRIPTEN__) || defined(__UWP__)

#if defined(__EMSCRIPTEN__)
#define GL_RGB16 0x8054
#define GL_RGBA16 0x805B
#endif

#if defined(__LUMIN__)
   #include <GLES3/gl32.h>

   #define glMultiDrawElementsIndirect _ptrc_glMultiDrawElementsIndirect
   extern void (* _ptrc_glMultiDrawElementsIndirect)(GLenum, GLenum, const void *, GLsizei, GLsizei);

   #define glMapBuffer _ptrc_glMapBuffer
   extern void * (* _ptrc_glMapBuffer)(GLenum, GLenum);

   #define GL_FILL 0x1B02
   #define GL_LINE 0x1B01

#else

#if defined(__UWP__)
   #define GL_GLEXT_PROTOTYPES
#endif

#if defined(_GLES3)
   //#define GL_GLEXT_PROTOTYPES

   #include <GLES3/gl3.h>
   #include <GLES3/gl32.h>

#if !defined(__UWP__)
   #include <GLES/gl.h>
#endif

#else
   #include <GLES2/gl2.h>
#endif
#endif

#else
   #include <gl_compat_4_4.h>
#endif
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


#if defined(__WIN32__)
   #undef Polygon
   #undef MessageBox
   #undef Sleep
   #undef GetObject
   #undef Size
   #undef String
   #undef Alignment
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

   // Cube Maps
   #define GL_TEXTURE_CUBE_MAP               GL_TEXTURE_CUBE_MAP_OES
   #define GL_TEXTURE_CUBE_MAP_POSITIVE_X    GL_TEXTURE_CUBE_MAP_POSITIVE_X_OES
   #define GL_TEXTURE_CUBE_MAP_NEGATIVE_X    GL_TEXTURE_CUBE_MAP_NEGATIVE_X_OES
   #define GL_TEXTURE_CUBE_MAP_POSITIVE_Y    GL_TEXTURE_CUBE_MAP_POSITIVE_Y_OES
   #define GL_TEXTURE_CUBE_MAP_NEGATIVE_Y    GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_OES
   #define GL_TEXTURE_CUBE_MAP_POSITIVE_Z    GL_TEXTURE_CUBE_MAP_POSITIVE_Z_OES
   #define GL_TEXTURE_CUBE_MAP_NEGATIVE_Z    GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_OES
   #define GL_REFLECTION_MAP                 GL_REFLECTION_MAP_OES
   #define GL_TEXTURE_GEN_MODE               GL_TEXTURE_GEN_MODE_OES
   #define GL_TEXTURE_GEN_STR                GL_TEXTURE_GEN_STR_OES

   #define glTexGeni    glTexGeniOES
   #define glTexGenfv   glTexGenfvOES


   // TOFIX: Grab Screen and BlitDI/StretchDI will have wrong colors
   #undef GL_BGRA_EXT
   #define GL_BGRA_EXT               GL_RGBA
#else
   #define GL_BGRA_EXT               0x80E1
#endif

// TODO: Compatibility without sRGB support
#ifndef GL_SRGB8_ALPHA8
   #define GL_SRGB8_ALPHA8 0x8C43
#endif

/* Clang complains about undefined behavior?
#define ENABLE_GL_SHADERS  (!defined(_GLES))
#define ENABLE_GL_FFP      (!defined(_GLES2))
#define ENABLE_GL_POINTER  (!defined(__EMSCRIPTEN__))
#define ENABLE_GL_FBO      (!defined(__EMSCRIPTEN__))
#define ENABLE_GL_LEGACY   (!defined(_GLES) && !defined(_GLES2))
#define ENABLE_GL_INTDBL   (!defined(_GLES) && !defined(_GLES2))
#define ENABLE_GL_MAPBUF   (!defined(_GLES) && !defined(_GLES2))
#define ENABLE_GL_SELECT   (!defined(_GLES) && !defined(_GLES2))
#define ENABLE_GL_VAO      (!defined(_GLES) && !defined(_GLES2))
#define ENABLE_GL_COLORMAT (ENABLE_GL_FFP   && !defined(_GLES))
*/

// Compiled In Capabilities
#if defined(__LUMIN__)
   #define ENABLE_GL_LEGACY   0
   #define ENABLE_GL_INTDBL   0
   #define ENABLE_GL_MAPBUF   0     // TODO: Lumin in theory supports full GL so all of these could be 1 (testing required)
   #define ENABLE_GL_SELECT   0
   #define ENABLE_GL_VAO      1
#elif defined(_GLES3)
   #define ENABLE_GL_LEGACY   0
   #define ENABLE_GL_INTDBL   0
   #define ENABLE_GL_MAPBUF   (!defined(__EMSCRIPTEN__))      // WebGL 2 still doesn't support MapBuffer
   #define ENABLE_GL_SELECT   0
   #define ENABLE_GL_VAO      1
#elif !defined(_GLES) && !defined(_GLES2)
   #define ENABLE_GL_LEGACY   1
   #define ENABLE_GL_INTDBL   1
   #define ENABLE_GL_MAPBUF   1
   #define ENABLE_GL_SELECT   1
   #define ENABLE_GL_VAO      1
#else
   #define ENABLE_GL_LEGACY   0
   #define ENABLE_GL_INTDBL   0
   #define ENABLE_GL_MAPBUF   0
   #define ENABLE_GL_SELECT   0
   #define ENABLE_GL_VAO      0
#endif

#if defined(_GLES2) || defined(_GLES3)
   #define ENABLE_GL_FFP      0
#else
   #define ENABLE_GL_FFP      1
#endif

#if defined(_GLES)
   #define ENABLE_GL_SHADERS  0
   #define ENABLE_GL_COLORMAT 0
#else
   #define ENABLE_GL_SHADERS  1
   #define ENABLE_GL_COLORMAT ENABLE_GL_FFP
#endif

#if defined(__EMSCRIPTEN__)
   #define ENABLE_GL_POINTER  0
   #define ENABLE_GL_FBO      0
#else
   #define ENABLE_GL_POINTER  1
   #define ENABLE_GL_FBO      1
#endif

#if ENABLE_GL_SHADERS && ENABLE_GL_FFP
   #define GLEnableClientState            (glCaps_shaders ? glEnableVertexAttribArray : glEnableClientState)
   #define GLDisableClientState           (glCaps_shaders ? glDisableVertexAttribArray : glDisableClientState)
   #define VERTICES                       (glCaps_shaders ? GLBufferContents::vertex : GL_VERTEX_ARRAY)
   #define NORMALS                        (glCaps_shaders ? GLBufferContents::normal : GL_NORMAL_ARRAY)
   #define TEXCOORDS                      (glCaps_shaders ? GLBufferContents::texCoord : GL_TEXTURE_COORD_ARRAY)
   #define COLORS                         (glCaps_shaders ? GLBufferContents::color : GL_COLOR_ARRAY)
   #define TANGENTS1                      (glCaps_shaders ? GLBufferContents::tangent1 : GL_COLOR_ARRAY)
   #define TANGENTS2                      (glCaps_shaders ? GLBufferContents::tangent2 : GL_COLOR_ARRAY)
   #define LIGHTVECTORS                   GL_COLOR_ARRAY
   #define BONEINDICES1                   (glCaps_shaders ? GLBufferContents::boneIndices1 : 0)
   #define BONEINDICES2                   (glCaps_shaders ? GLBufferContents::boneIndices2 : 0)
   #define BONEINDICES3                   (glCaps_shaders ? GLBufferContents::boneIndices3 : 0)
   #define BONEWEIGHTS1                   (glCaps_shaders ? GLBufferContents::boneWeights1 : 0)
   #define BONEWEIGHTS2                   (glCaps_shaders ? GLBufferContents::boneWeights2 : 0)
   #define BONEWEIGHTS3                   (glCaps_shaders ? GLBufferContents::boneWeights3 : 0)
   #define GLVertexPointer(n, t, s, p)    (glCaps_shaders ? glVertexAttribPointer(GLBufferContents::vertex,   n, t, GL_FALSE, s, p) : glVertexPointer(n, t, s, p))
   #define GLColorPointer(n, t, s, p)     (glCaps_shaders ? glVertexAttribPointer(GLBufferContents::color,    n, t, GL_FALSE, s, p) : glColorPointer(n, t, s, p))
   #define GLTexCoordPointer(n, t, s, p)  (glCaps_shaders ? glVertexAttribPointer(GLBufferContents::texCoord, n, t, GL_FALSE, s, p) : glTexCoordPointer(n, t, s, p))
   #define GLTangent1Pointer(n, t, s, p)  (glCaps_shaders ? glVertexAttribPointer(GLBufferContents::tangent1, n, t, GL_FALSE, s, p) : (void)0)
   #define GLTangent2Pointer(n, t, s, p)  (glCaps_shaders ? glVertexAttribPointer(GLBufferContents::tangent2, n, t, GL_FALSE, s, p) : (void)0)
#elif ENABLE_GL_SHADERS
   #define GLEnableClientState            glEnableVertexAttribArray
   #define GLDisableClientState           glDisableVertexAttribArray
   #define VERTICES                       GLBufferContents::vertex
   #define NORMALS                        GLBufferContents::normal
   #define TEXCOORDS                      GLBufferContents::texCoord
   #define COLORS                         GLBufferContents::color
   #define TANGENTS1                      GLBufferContents::tangent1
   #define TANGENTS2                      GLBufferContents::tangent2
   #define BONEINDICES1                   GLBufferContents::boneIndices1
   #define BONEINDICES2                   GLBufferContents::boneIndices2
   #define BONEINDICES3                   GLBufferContents::boneIndices3
   #define BONEWEIGHTS1                   GLBufferContents::boneWeights1
   #define BONEWEIGHTS2                   GLBufferContents::boneWeights2
   #define BONEWEIGHTS3                   GLBufferContents::boneWeights3
   #define GLVertexPointer(n, t, s, p)    glVertexAttribPointer(GLBufferContents::vertex,   n, t, GL_FALSE, s, p)
   #define GLColorPointer(n, t, s, p)     glVertexAttribPointer(GLBufferContents::color,    n, t, GL_FALSE, s, p)
   #define GLTexCoordPointer(n, t, s, p)  glVertexAttribPointer(GLBufferContents::texCoord, n, t, GL_FALSE, s, p)
   #define GLTangent1Pointer(n, t, s, p)  glVertexAttribPointer(GLBufferContents::tangent1, n, t, GL_FALSE, s, p)
   #define GLTangent2Pointer(n, t, s, p)  glVertexAttribPointer(GLBufferContents::tangent2, n, t, GL_FALSE, s, p)
#else
   #define GLEnableClientState            glEnableClientState
   #define GLDisableClientState           glDisableClientState
   #define VERTICES                       GL_VERTEX_ARRAY
   #define NORMALS                        GL_NORMAL_ARRAY
   #define TEXCOORDS                      GL_TEXTURE_COORD_ARRAY
   #define COLORS                         GL_COLOR_ARRAY
   #define LIGHTVECTORS                   GL_COLOR_ARRAY
   #define BONEINDICES1                   -1
   #define BONEINDICES2                   -1
   #define BONEINDICES3                   -1
   #define BONEWEIGHTS1                   -1
   #define BONEWEIGHTS2                   -1
   #define BONEWEIGHTS3                   -1
   #define GLVertexPointer                glVertexPointer
   #define GLColorPointer                 glColorPointer
   #define GLTexCoordPointer              glTexCoordPointer
   #define GLTangent1Pointer
   #define GLTangent2Pointer
#endif

#if ENABLE_GL_INTDBL && ENABLE_GL_SHADERS
   #define GLLoadMatrixd(m)               (glCaps_fixedFunction ? glLoadMatrixd(m) : glmsLoadMatrixd(m))
   #define GLMultMatrixd(m)               (glCaps_fixedFunction ? glMultMatrixd(m) : glmsMultMatrixd(m))
   #define GLFrustum(a,b,c,d,e,f)         (glCaps_fixedFunction ? glFrustum(a,b,c,d,e,f) : glmsFrustum(a,b,c,d,e,f))
   #define GLOrtho(a,b,c,d,e,f)           (glCaps_fixedFunction ? glOrtho(a,b,c,d,e,f) : glmsOrtho(a,b,c,d,e,f))
   #define GLScaled(x, y, z)              (glCaps_fixedFunction ? glScaled(x, y, z) : glmsScaled(x,y,z))
   #define GLScalef(x, y, z)              (glCaps_fixedFunction ? glScalef(x, y, z) : glmsScaled(x,y,z))
   #define GLTranslated(x, y, z)          (glCaps_fixedFunction ? glTranslated(x,y,z) : glmsTranslated(x,y,z))
   #define GLRotated(a, x, y, z)          (glCaps_fixedFunction ? glRotated(a, x,y,z) : glmsRotated(a,x,y,z))
   #define GLMatrixMode(m)                (glCaps_fixedFunction ? glMatrixMode(m) : glmsMatrixMode(m))
   #define GLLoadIdentity()               (glCaps_fixedFunction ? glLoadIdentity() : glmsLoadIdentity())
   #define GLPushMatrix()                 (glCaps_fixedFunction ? glPushMatrix() : glmsPushMatrix())
   #define GLPopMatrix()                  (glCaps_fixedFunction ? glPopMatrix() : glmsPopMatrix())
   #define GLFlushMatrices()              (glCaps_fixedFunction ? (void)0 : glmsFlushMatrices())
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
   #define GLRecti(x1, y1, x2, y2)           (glCaps_immediate ? glRecti(x1, y1, x2, y2) : glimtkRecti(x1, y1, x2, y2))
   #define GLBegin(m)                        (glCaps_immediate ? glBegin(m) : glimtkBegin(m))
   #define GLEnd()                           (glCaps_immediate ? glEnd() : glimtkEnd())
   #define GLVertex2i(x,y)                   (glCaps_immediate ? glVertex2i(x,y) : glimtkVertex2i(x,y))
   #define GLVertex2f(x,y)                   (glCaps_immediate ? glVertex2f(x,y) : glimtkVertex2f(x,y))
   #define GLVertex2d(x,y)                   (glCaps_immediate ? glVertex2d(x,y) : glimtkVertex2d(x,y))
   #define GLVertex3f(x,y,z)                 (glCaps_immediate ? glVertex3f(x,y,z) : glimtkVertex3f(x,y,z))
   #define GLVertex3d(x,y,z)                 (glCaps_immediate ? glVertex3d(x,y,z) : glimtkVertex3d(x,y,z))
   #define GLVertex3fv(v)                    (glCaps_immediate ? glVertex3fv(v) : glimtkVertex3fv(v))
   #define GLVertex3dv(v)                    (glCaps_immediate ? glVertex3dv(v) : glimtkVertex3dv(v))
   #define GLTexCoord2i(x,y)                 (glCaps_immediate ? glTexCoord2i(x,y) : glimtkTexCoord2i(x,y))
   #define GLTexCoord2f(x,y)                 (glCaps_immediate ? glTexCoord2f(x,y) : glimtkTexCoord2f(x,y))
   #define GLTexCoord2d(x,y)                 (glCaps_immediate ? glTexCoord2d(x,y) : glimtkTexCoord2d(x,y))
   #define GLTexCoord2fv(v)                  (glCaps_immediate ? glTexCoord2fv(v) : glimtkTexCoord2fv(v))
   #define GLNormal3f(x,y,z)                 (glCaps_immediate ? glNormal3f : glimtkNormal3f)
   #define GLNormal3d(x,y,z)                 (glCaps_immediate ? glNormal3d : glimtkNormal3d)
   #define GLNormal3fv(v)                    (glCaps_immediate ? glNormal3fv(v) : glimtkNormal3fv(v))
   #define GLNormal3dv(v)                    (glCaps_immediate ? glNormal3dv(v) : glimtkNormal3dv(v))
   #define GLColor3f(a,b,c)                  (glCaps_immediate ? glColor3f(a,b,c) : glimtkColor3f(a,b,c))
   #define GLColor4ub(a,b,c,d)               (glCaps_immediate ? glColor4ub(a,b,c,d) : glimtkColor4ub(a,b,c,d))
   #define GLColor4f(a,b,c,d)                (glCaps_immediate ? glColor4f(a,b,c,d) : glimtkColor4f(a,b,c,d))
   #define GLColor4fv(v)                     (glCaps_immediate ? glColor4fv(v) : glimtkColor4fv(v))
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

#if defined(_GLES2)
   #define GLClearDepth(a)                   glClearDepthf(a)
   #define GLDepthRange(a,b)                 glDepthRangef(a,b)
#else
   #define GLClearDepth(a)                   if(glClearDepth) glClearDepth(a)
   #define GLDepthRange(a,b)                 glDepthRange(a,b)
#endif

#ifdef _GLES
   #define GLLightModeli                     glsupLightModeli
#else
   #define GLLightModeli                     glLightModeli
#endif

#define SETCAPS(caps) \
   glCaps                     = caps; \
   glCaps_shaders             = glCaps.shaders; \
   glCaps_fixedFunction       = glCaps.fixedFunction; \
   glCaps_nonPow2Textures     = glCaps.nonPow2Textures; \
   glCaps_vertexBuffer        = glCaps.vertexBuffer; \
   glCaps_quads               = glCaps.quads; \
   glCaps_intAndDouble        = glCaps.intAndDouble; \
   glCaps_immediate           = glCaps.immediate; \
   glCaps_legacy              = glCaps.legacy; \
   glCaps_legacyFormats       = glCaps.legacyFormats; \
   glCaps_pointSize           = glCaps.pointSize; \
   glCaps_frameBuffer         = glCaps.frameBuffer; \
   glCaps_vao                 = glCaps.vao; \
   glCaps_compatible          = glCaps.compatible; \
   glCaps_select              = glCaps.select; \
   glCaps_vertexPointer       = glCaps.vertexPointer; \
   glCaps_gpuCommands         = glCaps.gpuCommands; \
   glCaps_mdei                = glCaps.mdei

extern int glVersion;
extern GLCapabilities glCaps;
extern bool glCaps_nonPow2Textures, glCaps_vertexBuffer, glCaps_quads, glCaps_intAndDouble, glCaps_legacyFormats, glCaps_compatible, glCaps_vertexPointer;
extern bool glCaps_shaders, glCaps_fixedFunction, glCaps_immediate, glCaps_legacy, glCaps_pointSize, glCaps_frameBuffer, glCaps_vao, glCaps_select;
extern bool glCaps_gpuCommands;
extern bool glCaps_mdei;

#if ENABLE_GL_INTDBL
   #define GL_INDEX_INT GL_UNSIGNED_INT
#else
   #define GL_INDEX_INT GL_UNSIGNED_SHORT
#endif

#if defined(__LUMIN__)
#define bool _bool
#define false _false
#define true _true

#include <ml_logging.h>

#undef bool
#undef false
#undef true
#endif
