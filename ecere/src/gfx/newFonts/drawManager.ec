import "OpenGLDisplayDriver"

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#if defined(_GLES)
   #define ES1_1
#else
   #define SHADERS
#endif

#if defined(__EMSCRIPTEN__)
   #define ES2
   #include <GLES2/gl2.h>
#endif

#if !defined(__ANDROID__) && !defined(__EMSCRIPTEN__) && !defined(__ODROID__)
#  if defined(SHADERS)
//#     include "gl_core_3_3.h"
#     include "gl_compat_4_4.h"     // FIXME: no glPushAttrib() in core profile
#  else
#     include "gl_compat_4_4.h"
#  endif
#endif

#ifdef SHADERS

#undef glEnableClientState
#undef glDisableClientState
#undef GL_VERTEX_ARRAY
#undef GL_NORMAL_ARRAY
#undef GL_TEXTURE_COORD_ARRAY
#undef GL_COLOR_ARRAY
#undef glVertexPointer
#undef glTexCoordPointer
#undef glColorPointer

#define glEnableClientState      glEnableVertexAttribArray
#define glDisableClientState     glDisableVertexAttribArray
#define GL_VERTEX_ARRAY          GLBufferContents::vertex
#define GL_NORMAL_ARRAY          GLBufferContents::normal
#define GL_TEXTURE_COORD_ARRAY   GLBufferContents::texCoord
#define GL_COLOR_ARRAY           GLBufferContents::color
#define glVertexPointer(n, t, s, p)    glVertexAttribPointer(GLBufferContents::vertex,   n, t, GL_FALSE, s, p)
#define glTexCoordPointer(n, t, s, p)  glVertexAttribPointer(GLBufferContents::texCoord, n, t, GL_FALSE, s, p)
#define glColorPointer(n, t, s, p)     glVertexAttribPointer(GLBufferContents::color,    n, t, GL_FALSE, s, p)

#endif

#if defined(ES1_1) || defined(ES2) || defined(SHADERS)

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
   #undef glLoadMatrixf
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
   #define glLoadMatrixf         glmsLoadMatrixf
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

#include "cc.h"

#define OFFSET(s, m) ((uint)(uintptr) (&((s *) 0)->m))

import "textureManager"


#define DM_ENABLE_IMAGE_ROTATION (1)
#define DM_ENABLE_EXT_COLOR (1)

////

static struct DMDrawVertexFlat
{
  float vertex[2];
  float texcoord0[2];
  uint32 color;
#if DM_ENABLE_EXT_COLOR
  uint32 extcolor;
#endif
} __attribute__((aligned(16)));

static struct DMDrawVertex
{
  short vertex[2];
  short texcoord0[2];
  uint32 color;
#if DM_ENABLE_EXT_COLOR
  uint32 extcolor;
#endif
} __attribute__((aligned(16)));

struct DMDrawBuffer
{
   GLuint vbo;
   int glType;
   int vertexCount;
   int vertexAlloc;
   void *vertexBuffer;
};

class DMProgramFlags : uint { bool valid:1; }

struct DMProgram
{
  GLuint glProgram;
  GLuint vertexShader;
  GLuint fragmentShader;
  GLint matrixloc;
  GLint vertexloc;
  GLint texcoord0loc;
  GLint texcoord1loc;
  GLint colorloc;
#if DM_ENABLE_EXT_COLOR
  GLint extcolorloc;
#endif
  GLint texbaseloc;
  DMProgramFlags flags;
  int64 lastUpdateCount;
};

class DMImageFlags : uint16
{
   bool empty:1;     // Image is empty, do not draw
   bool blending:1;  // Must draw image with blending
}

public struct DMImage
{
private:
   Texture texture;
   DMImageFlags flags;
   short programIndex;
   short srcx, srcy;
   short sizex, sizey;

   // Computed order for sorted rendering, in defineImage()
   uint32 orderMask;

public:
   void clear()
   {
      this = { flags = { empty = true } };
   }

   void defineImage( Texture texture, int offsetx, int offsety, int sizex, int sizey, bool blending, int programIndex, int layerindex )
   {
      int ordx = offsetx >> 6;
      int ordy = offsety >> 6;
      uint32 orderimage = ccMortonNumber32( ordx, ordy ) & ( ( 1 << DM_IMAGE_ORDER_BITS ) - 1 );
      this =
      {
         texture = texture;
         srcx = (short)offsetx;
         srcy = (short)offsety;
         sizex = (short)sizex;
         sizey = (short)sizey;
         programIndex = (short)programIndex;
         flags = { blending = blending };
         orderMask = (orderimage << DM_IMAGE_ORDER_SHIFT) |
                     (( blending == true ) << DM_BLEND_ORDER_SHIFT) |
                     (programIndex << DM_PROGRAM_ORDER_SHIFT) |
                     texture.orderMask |
                     (layerindex << DM_LAYER_ORDER_SHIFT);
      };
   }
};

struct DMImageBuffer
{
  DMImage *image;
  short offsetx;
  short offsety;
  short sizex;
  short sizey;
#if DM_ENABLE_IMAGE_ROTATION
  short angcos;
  short angsin;
#endif
#if DM_ENABLE_EXT_COLOR
  uint32 extcolor;
#endif
  uint32 color;
  uint32 orderindex;
};


////


define DM_IMAGE_ORDER_BITS = 8;
define DM_BLEND_ORDER_BITS = 1;
define DM_PROGRAM_ORDER_BITS = 4;
define DM_TEXTURE_ORDER_BITS = 10;
define DM_LAYER_ORDER_BITS = 4;
define DM_BARRIER_ORDER_BITS = 5;

define DM_IMAGE_ORDER_SHIFT = 0;
define DM_BLEND_ORDER_SHIFT = DM_IMAGE_ORDER_BITS;
define DM_PROGRAM_ORDER_SHIFT = DM_IMAGE_ORDER_BITS+DM_BLEND_ORDER_BITS;
define DM_TEXTURE_ORDER_SHIFT = DM_IMAGE_ORDER_BITS+DM_BLEND_ORDER_BITS+DM_PROGRAM_ORDER_BITS;
define DM_LAYER_ORDER_SHIFT = DM_IMAGE_ORDER_BITS+DM_BLEND_ORDER_BITS+DM_PROGRAM_ORDER_BITS+DM_TEXTURE_ORDER_BITS;
define DM_BARRIER_ORDER_SHIFT = DM_IMAGE_ORDER_BITS+DM_BLEND_ORDER_BITS+DM_PROGRAM_ORDER_BITS+DM_TEXTURE_ORDER_BITS+DM_LAYER_ORDER_BITS;

define DM_LAYER_COUNT = 1<<DM_LAYER_ORDER_BITS;
define DM_PROGRAM_COUNT = 1<<DM_PROGRAM_ORDER_BITS;

define DM_CONTEXT_DRAW_BUFFER_COUNT = 64;
define DM_CONTEXT_DRAW_BUFFER_VERTEX_ALLOC = 1024;


/* Range is from zero to DM_LAYER_COUNT */
enum DMLayer
{
  DM_LAYER_0_BOTTOM,
  DM_LAYER_1_BOTTOM,
  DM_LAYER_2_BELOW,
  DM_LAYER_3_BELOW,
  DM_LAYER_4_BELOW,
  DM_LAYER_5_NORMAL,
  DM_LAYER_6_NORMAL,
  DM_LAYER_7_NORMAL,
  DM_LAYER_8_ABOVE,
  DM_LAYER_9_ABOVE,
  DM_LAYER_10_ABOVE,
  DM_LAYER_11_OVERLAY,
  DM_LAYER_12_OVERLAY,
  DM_LAYER_13_OVERLAY,
  DM_LAYER_14_TOP,
  DM_LAYER_15_TOP,
};

define DM_LAYER_BOTTOM = DMLayer::DM_LAYER_0_BOTTOM;
define DM_LAYER_BELOW = DMLayer::DM_LAYER_3_BELOW;
define DM_LAYER_NORMAL = DMLayer::DM_LAYER_6_NORMAL;
define DM_LAYER_ABOVE = DMLayer::DM_LAYER_9_ABOVE;
define DM_LAYER_TOP = DMLayer::DM_LAYER_15_TOP;

define DM_PROGRAM_NORMAL = 0;
define DM_PROGRAM_ALPHABLEND = 1;
define DM_PROGRAM_ALPHABLEND_INTENSITY = 2;
define DM_PROGRAM_ALPHABLEND_INTENSITY_EXTCOLOR = 3;

#ifdef _DEBUG
static inline void OpenGLErrorCheck( const char *file, int line )
{
   int error = glGetError();
   if( error != GL_NO_ERROR )
      printf( "ERROR %d at %s:%d\n", error, file, line );
}

#define ERRORCHECK() OpenGLErrorCheck(__FILE__,__LINE__)
#else
#define ERRORCHECK()
#endif

// Not using 32767.0 ; overflow when converting to int16 due to floating point crud causes problems
#define DM_IMAGE_ROTATION_NORMFACTOR (24576.0f)

#define DM_VERTEX_NORMSHIFT (2)
#define DM_VERTEX_NORMFACTOR (4.0f)

#define DM_TEXCOORD_NORMSHIFT (13)
#define DM_TEXCOORD_NORMFACTOR (8192.0f)

static GLuint dmCreateShader( GLenum type, const char *shadersource, const char *optionstring )
{
  GLuint shader;
  GLint status;
  GLsizei loglength;
  char infolog[8192];
  const GLchar *sourcearray[2];

  shader = glCreateShader( type );
  if( !( shader ) )
    return 0;

  if( !( optionstring ) )
    optionstring = "";
  sourcearray[0] = optionstring;
  sourcearray[1] = shadersource;
  glShaderSource( shader, 2, sourcearray, NULL );
  glCompileShader( shader );
  glGetShaderiv( shader, GL_COMPILE_STATUS, &status );
  if( status != GL_TRUE )
  {
    fprintf( stderr, "ERROR: Failed to compile shader\n" );
    glGetShaderInfoLog( shader, 8192, &loglength,infolog );
    fprintf( stderr, "ERROR: \n%s\n\n", infolog );
    glDeleteShader( shader );
    return 0;
  }
  return shader;
}


static bool dmCreateProgram( DMProgram program, const char *vertexsource, const char *fragmentsource, char *optionstring )
{
  GLint status;
  GLsizei loglength;
  char infolog[8192];

  program.glProgram = 0;
  program.vertexShader = 0;
  program.fragmentShader = 0;

  program.vertexShader = dmCreateShader( GL_VERTEX_SHADER, vertexsource, optionstring );
  if( !( program.vertexShader ) )
  {
    fprintf(stderr, "ERROR: Unable to load vertex shader\n");
    goto error;
  }
  program.fragmentShader = dmCreateShader( GL_FRAGMENT_SHADER, fragmentsource, optionstring );
  if( !( program.fragmentShader ) )
  {
    fprintf(stderr, "ERROR: Unable to load fragment shader\n");
    goto error;
  }
  program.glProgram = glCreateProgram();
  if( !( program.glProgram ) )
  {
    fprintf(stderr, "ERROR: Unable to create program\n");
    goto error;
  }

  glAttachShader( program.glProgram, program.vertexShader );
  glAttachShader( program.glProgram, program.fragmentShader );

   glBindAttribLocation(program.glProgram, GLBufferContents::vertex, "vertex");
   glBindAttribLocation(program.glProgram, GLBufferContents::texCoord, "texCoord");
   glBindAttribLocation(program.glProgram, GLBufferContents::color, "color");
   glBindAttribLocation(program.glProgram, GLBufferContents::normal, "normal");

  glLinkProgram( program.glProgram );
  glGetProgramiv( program.glProgram, GL_LINK_STATUS, &status );
  if( status != GL_TRUE )
  {
    fprintf( stderr, "ERROR, failed to link shader program\n" );
    glGetProgramInfoLog( program.glProgram, 8192, &loglength, infolog );
    fprintf( stderr, "ERROR: \n%s\n\n", infolog );
    goto error;
  }

  // glUseProgram( program.glProgram );

  program.matrixloc = glGetUniformLocation( program.glProgram, "uniMatrix" );
  program.vertexloc = glGetAttribLocation( program.glProgram, "inVertex" );
  program.texcoord0loc = glGetAttribLocation( program.glProgram, "inTexcoord0" );
  program.texcoord1loc = glGetAttribLocation( program.glProgram, "inTexcoord1" );
  program.colorloc = glGetAttribLocation( program.glProgram, "inColor" );
#if DM_ENABLE_EXT_COLOR
  program.extcolorloc = glGetAttribLocation( program.glProgram, "inExtColor" );
#endif
  program.texbaseloc = glGetUniformLocation( program.glProgram, "texBase" );
  program.flags.valid = true;

  return true;

  error:
  if( program.fragmentShader )
    glDeleteShader( program.fragmentShader );
  if( program.vertexShader )
    glDeleteShader( program.vertexShader );
  if( program.glProgram )
    glDeleteProgram( program.glProgram );
  return false;
}


////


const char *dmVertexShaderNormal =
"#version 130\n"
"uniform mat4 uniMatrix;\n"
"in vec2 inVertex;\n"
"in vec2 inTexcoord0;\n"
"in vec4 inColor;\n"
"out vec2 varTexcoord0;\n"
"out vec4 varColor;\n"
"void main()\n"
"{\n"
" \n"
"  varTexcoord0 = inTexcoord0 * (1.0/" CC_STRINGIFY(DM_TEXCOORD_NORMFACTOR) ");\n"
"  varColor = inColor;\n"
"  gl_Position = uniMatrix * vec4( inVertex, 0.0, 1.0 );\n"
"  return;\n"
"}\n"
;


const char *dmFragmentShaderNormal =
"#version 130\n"
"uniform sampler2D texBase;\n"
"in vec2 varTexcoord0;\n"
"in vec4 varColor;\n"
"void main()\n"
"{\n"
"  gl_FragColor = varColor * texture2D( texBase, varTexcoord0 );\n"
"  return;\n"
"}\n"
;


const char *dmVertexShaderAlpha =
"#version 130\n"
"uniform mat4 uniMatrix;\n"
"in vec2 inVertex;\n"
"in vec2 inTexcoord0;\n"
"in vec4 inColor;\n"
"out vec2 varTexcoord0;\n"
"out vec4 varColor;\n"
"void main()\n"
"{\n"
" \n"
"  varTexcoord0 = inTexcoord0 * (1.0/" CC_STRINGIFY(DM_TEXCOORD_NORMFACTOR) ");\n"
"  varColor = inColor;\n"
"  gl_Position = uniMatrix * vec4( inVertex, 0.0, 1.0 );\n"
"  return;\n"
"}\n"
;


const char *dmFragmentShaderAlpha =
"#version 130\n"
"uniform sampler2D texBase;\n"
"in vec2 varTexcoord0;\n"
"in vec4 varColor;\n"
"void main()\n"
"{\n"
"  gl_FragColor = vec4( varColor.rgb, varColor.a * texture2D( texBase, varTexcoord0 ).r );\n"
"  return;\n"
"}\n"
;

const char *dmVertexShaderAlphaIntensity =
"#version 130\n"
"uniform mat4 uniMatrix;\n"
"in vec2 inVertex;\n"
"in vec2 inTexcoord0;\n"
"in vec4 inColor;\n"
"out vec2 varTexcoord0;\n"
"out vec4 varColor;\n"
"void main()\n"
"{\n"
" \n"
"  varTexcoord0 = inTexcoord0 * (1.0/" CC_STRINGIFY(DM_TEXCOORD_NORMFACTOR) ");\n"
"  varColor = inColor;\n"
"  gl_Position = uniMatrix * vec4( inVertex, 0.0, 1.0 );\n"
"  return;\n"
"}\n"
;


const char *dmFragmentShaderAlphaIntensity =
"#version 130\n"
"uniform sampler2D texBase;\n"
"in vec2 varTexcoord0;\n"
"in vec4 varColor;\n"
"void main()\n"
"{\n"
"  vec2 tex;\n"
"  tex = texture2D( texBase, varTexcoord0 ).rg;\n"
"  gl_FragColor = vec4( varColor.rgb * tex.g, varColor.a * tex.r );\n"
"  return;\n"
"}\n"
;

const char *dmVertexShaderAlphaIntensityExtColor =
"#version 130\n"
"uniform mat4 uniMatrix;\n"
"in vec2 inVertex;\n"
"in vec2 inTexcoord0;\n"
"in vec4 inColor;\n"
"in vec4 inExtColor;\n"
"out vec2 varTexcoord0;\n"
"out vec4 varColor;\n"
"out vec4 varExtColor;\n"
"void main()\n"
"{\n"
" \n"
"  varTexcoord0 = inTexcoord0 * (1.0/" CC_STRINGIFY(DM_TEXCOORD_NORMFACTOR) ");\n"
"  varColor = inColor;\n"
"  varExtColor = inExtColor;\n"
"  gl_Position = uniMatrix * vec4( inVertex, 0.0, 1.0 );\n"
"  return;\n"
"}\n"
;


const char *dmFragmentShaderAlphaIntensityExtColor =
"#version 130\n"
"uniform sampler2D texBase;\n"
"in vec2 varTexcoord0;\n"
"in vec4 varColor;\n"
"in vec4 varExtColor;\n"
"void main()\n"
"{\n"
"  vec2 tex;\n"
"  tex = texture2D( texBase, varTexcoord0 ).rg;\n"
"  gl_FragColor = vec4( mix( varExtColor.rgb, varColor.rgb, tex.g ), mix( varExtColor.a, varColor.a, tex.g ) * tex.r );\n"
"  return;\n"
"}\n"
;

////


static void matrixOrtho( float *m, float left, float right, float bottom, float top, float nearval, float farval )
{
  float x = 2.0f / ( right - left );
  float y = 2.0f / ( top - bottom );
  float z = -2.0f / ( farval - nearval );
  float tx = -( right + left ) / ( right - left );
  float ty = -( top + bottom ) / ( top - bottom );
  float tz = -( farval + nearval ) / ( farval - nearval );

#define M(row,col)  m[col*4+row]
  M(0,0) = x;    M(0,1) = 0.0;  M(0,2) = 0.0;  M(0,3) = tx;
  M(1,0) = 0.0;  M(1,1) = y;     M(1,2) = 0.0;  M(1,3) = ty;
  M(2,0) = 0.0;  M(2,1) = 0.0;  M(2,2) = z;     M(2,3) = tz;
  M(3,0) = 0.0;  M(3,1) = 0.0;  M(3,2) = 0.0;  M(3,3) = 1.0;
#undef M
}

////


/* FIXME: Radix sort, not hybrid sort! */

static inline int dmSortImagesCmp( DMImageBuffer *draw0, DMImageBuffer *draw1 )
{
  return ( ( draw0->orderindex < draw1->orderindex ) ? 0 : 1 );
}

#define HSORT_MAIN dmSortImages
#define HSORT_CMP dmSortImagesCmp
#define HSORT_TYPE DMImageBuffer
#include "cchybridsort.h"
#undef HSORT_MAIN
#undef HSORT_CMP
#undef HSORT_TYPE


////

// TOFIX: Make this private, have a property
public class DrawManagerFlags : uint32 { public: bool prehistoricOpenGL:1; }

public class DrawManager
{
   DrawManagerFlags flags;
   DMProgram shaderPrograms[DM_PROGRAM_COUNT];

   // Matrix
   float matrix[16];

   int imageBufferCount;
   int imageBufferSize;
   DMImageBuffer *imageBuffer;
   DMImageBuffer *imageBufferTmp;

   // Buffers for drawimages() batching
   DMDrawBuffer drawBuffer[DM_CONTEXT_DRAW_BUFFER_COUNT];
   int drawBufferIndex;
   int drawBarrierIndex;
   uint32 orderBarrierMask;

   // Counter to track program uniforms and such
   int64 updateCount;

   GLuint prevProgram;

   static DMProgram *flushUseProgram( int programIndex )
   {
      DMProgram *program = &shaderPrograms[ programIndex ];
      if( !program->flags.valid)
      {
         glUseProgram( 0 );
         return 0;
      }

      glUseProgram( program->glProgram );
      if( program->lastUpdateCount != this.updateCount )
      {
         glUniformMatrix4fv( program->matrixloc, 1, GL_FALSE, this.matrix );
         glUniform1i( program->texbaseloc, 0 );
         program->lastUpdateCount = this.updateCount;
      }

      return program;
   }

#if !defined(__EMSCRIPTEN__)
   static void flushRenderDrawBufferArchaic( DMDrawBuffer drawBuffer, DMProgram program, int vertexCount )
   {
      glEnable( GL_TEXTURE_2D );
      glBindBuffer( GL_ARRAY_BUFFER, drawBuffer.vbo );
      glColor3f( 1.0, 1.0, 1.0 );

      glEnableClientState( GL_VERTEX_ARRAY );
      glEnableClientState( GL_TEXTURE_COORD_ARRAY );
      glEnableClientState( GL_COLOR_ARRAY );

      glVertexPointer( 2, GL_FLOAT, sizeof(DMDrawVertexFlat), (void *)OFFSET(DMDrawVertexFlat,vertex) );
      glTexCoordPointer( 2, GL_FLOAT, sizeof(DMDrawVertexFlat), (void *)OFFSET(DMDrawVertexFlat,texcoord0) );
      glColorPointer( 4, GL_UNSIGNED_BYTE, sizeof(DMDrawVertexFlat), (void *)OFFSET(DMDrawVertexFlat,color) );

      glDrawArrays( GL_TRIANGLES, 0, vertexCount );

      glDisableClientState( GL_VERTEX_ARRAY );
      glDisableClientState( GL_TEXTURE_COORD_ARRAY );
      glDisableClientState( GL_COLOR_ARRAY );
      glDisable( GL_TEXTURE_2D );

   #if DM_FLUSH_EACH_RENDER_DRAW_BUFFER
      glFlush();
   #endif
   }

   void flushDrawImagesArchaic( )
   {
     bool flushflag, stateBlend;
     int index, vertexCount, programIndex;
     float vx0, vx1, vx2, vx3, vy0, vy1, vy2, vy3;
   #if DM_ENABLE_IMAGE_ROTATION
     float angsin, angcos, sizex, sizey;
   #endif
     float tx0, tx1, ty0, ty1;
     DMImageBuffer *imageBuffer;
     DMImage *image, *bindimage;
     Texture texture, bindTexture;
     DMDrawBuffer *drawBuffer;
     DMDrawVertexFlat *vboVertex;
     DMProgram *program;

     ERRORCHECK();

     drawBarrierIndex = 0;
     orderBarrierMask = drawBarrierIndex << DM_BARRIER_ORDER_SHIFT;
     if(imageBufferCount)
     {
        // Sort by image type and texture, minimize state changes
        dmSortImages( this.imageBuffer, imageBufferTmp, imageBufferCount, (uint32)( (intptr_t)this.imageBuffer >> 4 ) );

        // Fill a drawBuffer, write vertex and texcoords
        drawBuffer = &this.drawBuffer[drawBufferIndex];
        drawBufferIndex = ( drawBufferIndex + 1 ) % DM_CONTEXT_DRAW_BUFFER_COUNT;
        glBindBuffer( GL_ARRAY_BUFFER, drawBuffer->vbo );
        vboVertex = glMapBuffer( GL_ARRAY_BUFFER, GL_WRITE_ONLY );
        vertexCount = 0;

        glActiveTexture( GL_TEXTURE0 );
        glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA );
        glDisable( GL_BLEND );

      #if DM_RENDER_IMAGE_DEBUG
      printf( " Flush %d images\n", (int)imageBufferCount );
      #endif

        bindimage = 0;
        bindTexture = 0;
        stateBlend = 0;
        programIndex = -1;
        program = 0;
        imageBuffer = this.imageBuffer;
        for( index = 0 ; index < imageBufferCount ; index++, imageBuffer++ )
        {
          image = imageBuffer->image;
          texture = image->texture;

          flushflag = 0;
          if( image != bindimage )
          {
            if( stateBlend != image->flags.blending )
              flushflag = 1;
            if( texture != bindTexture )
              flushflag = 1;
          }
          if( vertexCount >= ( drawBuffer->vertexAlloc - 6 ) )
            flushflag = 1;

          if( flushflag )
          {
            if( vertexCount )
            {
              glUnmapBuffer( GL_ARRAY_BUFFER );
              // Flush font manager texture updates
              flush( );
              // Render buffered images
              flushRenderDrawBufferArchaic( drawBuffer, program, vertexCount );
              drawBuffer = &this.drawBuffer[drawBufferIndex];
              drawBufferIndex = ( drawBufferIndex + 1 ) % DM_CONTEXT_DRAW_BUFFER_COUNT;
              glBindBuffer( GL_ARRAY_BUFFER, drawBuffer->vbo );
              vboVertex = glMapBuffer( GL_ARRAY_BUFFER, GL_WRITE_ONLY );
              vertexCount = 0;
            }

            if( stateBlend != ( image->flags.blending ) )
            {
              stateBlend = image->flags.blending;
              ( stateBlend ? glEnable : glDisable )( GL_BLEND );
      #if DM_RENDER_IMAGE_DEBUG
      printf( "  Switch blending %d\n", stateBlend != false );
      #endif
            }
            if( programIndex != image->programIndex )
            {
              programIndex = image->programIndex;
              program = flushUseProgram( programIndex );
            }
            if( texture != bindTexture )
            {
              bindTexture = texture;
              glBindTexture( GL_TEXTURE_2D, bindTexture.glTex );
      #if DM_RENDER_IMAGE_DEBUG
      printf( "  Switch to texture 0x%x\n", (int)texture.orderMask );
      #endif
            }
            bindimage = image;
          }

      #if DM_RENDER_IMAGE_DEBUG
      printf( "   Render image at %d %d, order 0x%x, texture %p\n", (int)imageBuffer->offsetx, (int)imageBuffer->offsety, (int)imageBuffer->orderindex, texture );
      #endif

      #if DM_ENABLE_IMAGE_ROTATION
          angsin = (float)imageBuffer->angsin * (1.0f/DM_IMAGE_ROTATION_NORMFACTOR);
          angcos = (float)imageBuffer->angcos * (1.0f/DM_IMAGE_ROTATION_NORMFACTOR);
          sizex = (float)imageBuffer->sizex;
          sizey = (float)imageBuffer->sizey;
          vx0 = (float)imageBuffer->offsetx * (1.0f/DM_VERTEX_NORMFACTOR);
          vy0 = (float)imageBuffer->offsety * (1.0f/DM_VERTEX_NORMFACTOR);
          vx1 = vx0 + ( angcos * sizex );
          vy1 = vy0 + ( angsin * sizex );
          vx2 = vx0 - ( angsin * sizey );
          vy2 = vy0 + ( angcos * sizey );
          vx3 = vx0 + ( angcos * sizex ) - ( angsin * sizey );
          vy3 = vy0 + ( angsin * sizex ) + ( angcos * sizey );
      #else
          vx0 = (float)imageBuffer->offsetx * (1.0f/DM_VERTEX_NORMFACTOR);
          vy0 = (float)imageBuffer->offsety * (1.0f/DM_VERTEX_NORMFACTOR);
          vx3 = vx0 + (float)( imageBuffer->sizex );
          vy3 = vy0 + (float)( imageBuffer->sizey );
          vx1 = vx3;
          vy1 = vy0;
          vx2 = vx0;
          vy2 = vy3;
      #endif

          tx0 = (float)( image->srcx ) * texture.widthinv;
          ty0 = (float)( image->srcy ) * texture.heightinv;
          tx1 = (float)( image->srcx + image->sizex ) * texture.widthinv;
          ty1 = (float)( image->srcy + image->sizey ) * texture.heightinv;

          // Write data to VBO
          vboVertex[0].vertex[0] = vx3;
          vboVertex[0].vertex[1] = vy3;
          vboVertex[0].texcoord0[0] = tx1;
          vboVertex[0].texcoord0[1] = ty1;
          vboVertex[0].color = imageBuffer->color;
      #if DM_ENABLE_EXT_COLOR
          vboVertex[0].extcolor = imageBuffer->extcolor;
      #endif
          vboVertex[1].vertex[0] = vx1;
          vboVertex[1].vertex[1] = vy1;
          vboVertex[1].texcoord0[0] = tx1;
          vboVertex[1].texcoord0[1] = ty0;
          vboVertex[1].color = imageBuffer->color;
      #if DM_ENABLE_EXT_COLOR
          vboVertex[1].extcolor = imageBuffer->extcolor;
      #endif
          vboVertex[2].vertex[0] = vx2;
          vboVertex[2].vertex[1] = vy2;
          vboVertex[2].texcoord0[0] = tx0;
          vboVertex[2].texcoord0[1] = ty1;
          vboVertex[2].color = imageBuffer->color;
      #if DM_ENABLE_EXT_COLOR
          vboVertex[2].extcolor = imageBuffer->extcolor;
      #endif
          vboVertex[3].vertex[0] = vx0;
          vboVertex[3].vertex[1] = vy0;
          vboVertex[3].texcoord0[0] = tx0;
          vboVertex[3].texcoord0[1] = ty0;
          vboVertex[3].color = imageBuffer->color;
      #if DM_ENABLE_EXT_COLOR
          vboVertex[3].extcolor = imageBuffer->extcolor;
      #endif
          vboVertex[4].vertex[0] = vx2;
          vboVertex[4].vertex[1] = vy2;
          vboVertex[4].texcoord0[0] = tx0;
          vboVertex[4].texcoord0[1] = ty1;
          vboVertex[4].color = imageBuffer->color;
      #if DM_ENABLE_EXT_COLOR
          vboVertex[4].extcolor = imageBuffer->extcolor;
      #endif
          vboVertex[5].vertex[0] = vx1;
          vboVertex[5].vertex[1] = vy1;
          vboVertex[5].texcoord0[0] = tx1;
          vboVertex[5].texcoord0[1] = ty0;
          vboVertex[5].color = imageBuffer->color;
      #if DM_ENABLE_EXT_COLOR
          vboVertex[5].extcolor = imageBuffer->extcolor;
      #endif

          vboVertex += 6;
          vertexCount += 6;
        }

        glUnmapBuffer( GL_ARRAY_BUFFER );

        // Flush font manager texture updates
        flush();

        // Render buffered images
        flushRenderDrawBufferArchaic( drawBuffer, program, vertexCount );
        imageBufferCount = 0;

        ERRORCHECK();

     }
   }
#endif

   void flushRenderDrawBuffer( DMDrawBuffer drawBuffer, DMProgram program, int vertexCount )
   {
      glBindBuffer( GL_ARRAY_BUFFER, drawBuffer.vbo );
      if( program.vertexloc != -1 )
      {
         glEnableVertexAttribArray( program.vertexloc );
         glVertexAttribPointer( program.vertexloc, 2, GL_SHORT, GL_FALSE, sizeof(DMDrawVertex), (void *)OFFSET(DMDrawVertex,vertex) );
      }
      if( program.texcoord0loc != -1 )
      {
         glEnableVertexAttribArray( program.texcoord0loc );
         glVertexAttribPointer( program.texcoord0loc, 2, GL_SHORT, GL_FALSE, sizeof(DMDrawVertex), (void *)OFFSET(DMDrawVertex,texcoord0) );
      }
      if( program.colorloc != -1 )
      {
         glEnableVertexAttribArray( program.colorloc );
         glVertexAttribPointer( program.colorloc, 4, GL_UNSIGNED_BYTE, GL_TRUE, sizeof(DMDrawVertex), (void *)OFFSET(DMDrawVertex,color) );
      }

   #if DM_ENABLE_EXT_COLOR
      if( program.extcolorloc != -1 )
      {
         glEnableVertexAttribArray( program.extcolorloc );
         glVertexAttribPointer( program.extcolorloc, 4, GL_UNSIGNED_BYTE, GL_TRUE, sizeof(DMDrawVertex), (void *)OFFSET(DMDrawVertex,extcolor) );
      }
   #endif

      glDrawArrays( GL_TRIANGLES, 0, vertexCount );

      if( program.vertexloc != -1 )
         glDisableVertexAttribArray( program.vertexloc );
      if( program.texcoord0loc != -1 )
         glDisableVertexAttribArray( program.texcoord0loc );
      if( program.colorloc != -1 )
         glDisableVertexAttribArray( program.colorloc );

   #if DM_FLUSH_EACH_RENDER_DRAW_BUFFER
      glFlush();
   #endif
   }

   void flushDrawImages( )
   {
      int index, stateblend, vertexcount, flushflag, programIndex;
      float vx0, vx1, vx2, vx3, vy0, vy1, vy2, vy3;
      #if DM_ENABLE_IMAGE_ROTATION
      float angsin, angcos, sizex, sizey;
      #endif
      float tx0, tx1, ty0, ty1;
      DMImageBuffer *imageBuffer;
      DMImage *image, *bindimage;
      Texture texture, bindtexture;
      DMDrawBuffer *drawBuffer;
      DMDrawVertex *vboVertex;
      DMProgram *program;

      ERRORCHECK();

      this.drawBarrierIndex = 0;
      orderBarrierMask = drawBarrierIndex << DM_BARRIER_ORDER_SHIFT;
      if( imageBufferCount )
      {
         /* Sort by image type and texture, minimize state changes */
         dmSortImages( this.imageBuffer, this.imageBufferTmp, imageBufferCount, (uint32)( (uintptr)this.imageBuffer >> 4 ) );

         /* Fill a drawBuffer, write vertex and texcoords */
         drawBuffer = &this.drawBuffer[this.drawBufferIndex];
         this.drawBufferIndex = ( this.drawBufferIndex + 1 ) % DM_CONTEXT_DRAW_BUFFER_COUNT;
         glBindBuffer( GL_ARRAY_BUFFER, drawBuffer->vbo );

#if !defined(__EMSCRIPTEN__)
         vboVertex = glMapBuffer( GL_ARRAY_BUFFER, GL_WRITE_ONLY );
#endif
         vertexcount = 0;

         glActiveTexture( GL_TEXTURE0 );
         glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA );
         glDisable( GL_BLEND );

         #if DM_RENDER_IMAGE_DEBUG
         printf( " Flush %d images\n", (int)imageBufferCount );
         #endif

         bindimage = 0;
         bindtexture = 0;
         stateblend = 0;
         programIndex = -1;
         program = 0;
         imageBuffer = this.imageBuffer;
         for( index = 0 ; index < imageBufferCount ; index++, imageBuffer++ )
         {
          image = imageBuffer->image;
          texture = image->texture;

          flushflag = 0;
          if( image != bindimage )
          {
            if( stateblend != ( image->flags.blending ) )
              flushflag = 1;
            if( texture != bindtexture )
              flushflag = 1;
          }
          if( vertexcount >= ( drawBuffer->vertexAlloc - 6 ) )
            flushflag = 1;

          if( flushflag )
          {
            if( vertexcount )
            {
#if !defined(__EMSCRIPTEN__)
              glUnmapBuffer( GL_ARRAY_BUFFER );
#endif
              // Flush font manager texture updates
              flush();

              // Render buffered images
              flushRenderDrawBuffer( drawBuffer, program, vertexcount );
              drawBuffer = &this.drawBuffer[this.drawBufferIndex];
              this.drawBufferIndex = ( this.drawBufferIndex + 1 ) % DM_CONTEXT_DRAW_BUFFER_COUNT;
              glBindBuffer( GL_ARRAY_BUFFER, drawBuffer->vbo );
#if !defined(__EMSCRIPTEN__)
              vboVertex = glMapBuffer( GL_ARRAY_BUFFER, GL_WRITE_ONLY );
#endif
              vertexcount = 0;
            }

            if( stateblend != ( image->flags.blending ) )
            {
              stateblend = image->flags.blending;
              ( stateblend ? glEnable : glDisable )( GL_BLEND );
            #if DM_RENDER_IMAGE_DEBUG
               printf( "  Switch blending %d\n", ( stateblend != 0 ) );
            #endif
            }
            if( programIndex != image->programIndex )
            {
              programIndex = image->programIndex;
              program = flushUseProgram( programIndex );
            }
            if( texture != bindtexture )
            {
              bindtexture = texture;
              glBindTexture( GL_TEXTURE_2D, bindtexture.glTex );
      #if DM_RENDER_IMAGE_DEBUG
              printf( "  Switch to texture 0x%x\n", (int)texture.orderMask );
      #endif
            }
            bindimage = image;
          }

         #if DM_RENDER_IMAGE_DEBUG
         printf( "   Render image at %d %d, order 0x%x, texture %p\n", (int)imageBuffer->offsetx, (int)imageBuffer->offsety, (int)imageBuffer->orderindex, texture );
         #endif

      #if DM_ENABLE_IMAGE_ROTATION
          /* FIXME TODO: Don't go through float, compute texcoord integers directly */
          angsin = (float)imageBuffer->angsin * (1.0f/DM_IMAGE_ROTATION_NORMFACTOR);
          angcos = (float)imageBuffer->angcos * (1.0f/DM_IMAGE_ROTATION_NORMFACTOR);
          sizex = (float)imageBuffer->sizex;
          sizey = (float)imageBuffer->sizey;
          vx0 = (float)imageBuffer->offsetx * (1.0f/DM_VERTEX_NORMFACTOR);
          vy0 = (float)imageBuffer->offsety * (1.0f/DM_VERTEX_NORMFACTOR);
          vx1 = vx0 + ( angcos * sizex );
          vy1 = vy0 + ( angsin * sizex );
          vx2 = vx0 - ( angsin * sizey );
          vy2 = vy0 + ( angcos * sizey );
          vx3 = vx0 + ( angcos * sizex ) - ( angsin * sizey );
          vy3 = vy0 + ( angsin * sizex ) + ( angcos * sizey );
      #else
          /* FIXME TODO: Don't go through float, compute texcoord integers directly */
          vx0 = (float)imageBuffer->offsetx * (1.0f/DM_VERTEX_NORMFACTOR);
          vy0 = (float)imageBuffer->offsety * (1.0f/DM_VERTEX_NORMFACTOR);
          vx3 = vx0 + (float)( imageBuffer->sizex );
          vy3 = vy0 + (float)( imageBuffer->sizey );
          vx1 = vx3;
          vy1 = vy0;
          vx2 = vx0;
          vy2 = vy3;
      #endif

          /* FIXME TODO: Don't go through float, compute texcoord integers directly */
          tx0 = (float)( image->srcx ) * texture.widthinv;
          ty0 = (float)( image->srcy ) * texture.heightinv;
          tx1 = (float)( image->srcx + image->sizex ) * texture.widthinv;
          ty1 = (float)( image->srcy + image->sizey ) * texture.heightinv;

          /* Write data to VBO */
          /* TODO: write vertex/texcoord all at once with SSE */
          vboVertex[0].vertex[0] = (short)( vx3 * DM_VERTEX_NORMFACTOR );
          vboVertex[0].vertex[1] = (short)( vy3 * DM_VERTEX_NORMFACTOR );
          vboVertex[0].texcoord0[0] = (short)( tx1 * DM_TEXCOORD_NORMFACTOR );
          vboVertex[0].texcoord0[1] = (short)( ty1 * DM_TEXCOORD_NORMFACTOR );
          vboVertex[0].color = imageBuffer->color;
          vboVertex[0].extcolor = imageBuffer->extcolor;
          vboVertex[1].vertex[0] = (short)( vx1 * DM_VERTEX_NORMFACTOR );
          vboVertex[1].vertex[1] = (short)( vy1 * DM_VERTEX_NORMFACTOR );
          vboVertex[1].texcoord0[0] = (short)( tx1 * DM_TEXCOORD_NORMFACTOR );
          vboVertex[1].texcoord0[1] = (short)( ty0 * DM_TEXCOORD_NORMFACTOR );
          vboVertex[1].color = imageBuffer->color;
          vboVertex[1].extcolor = imageBuffer->extcolor;
          vboVertex[2].vertex[0] = (short)( vx2 * DM_VERTEX_NORMFACTOR );
          vboVertex[2].vertex[1] = (short)( vy2 * DM_VERTEX_NORMFACTOR );
          vboVertex[2].texcoord0[0] = (short)( tx0 * DM_TEXCOORD_NORMFACTOR );
          vboVertex[2].texcoord0[1] = (short)( ty1 * DM_TEXCOORD_NORMFACTOR );
          vboVertex[2].color = imageBuffer->color;
          vboVertex[2].extcolor = imageBuffer->extcolor;
          vboVertex[3].vertex[0] = (short)( vx0 * DM_VERTEX_NORMFACTOR );
          vboVertex[3].vertex[1] = (short)( vy0 * DM_VERTEX_NORMFACTOR );
          vboVertex[3].texcoord0[0] = (short)( tx0 * DM_TEXCOORD_NORMFACTOR );
          vboVertex[3].texcoord0[1] = (short)( ty0 * DM_TEXCOORD_NORMFACTOR );
          vboVertex[3].color = imageBuffer->color;
          vboVertex[3].extcolor = imageBuffer->extcolor;
          vboVertex[4].vertex[0] = (short)( vx2 * DM_VERTEX_NORMFACTOR );
          vboVertex[4].vertex[1] = (short)( vy2 * DM_VERTEX_NORMFACTOR );
          vboVertex[4].texcoord0[0] = (short)( tx0 * DM_TEXCOORD_NORMFACTOR );
          vboVertex[4].texcoord0[1] = (short)( ty1 * DM_TEXCOORD_NORMFACTOR );
          vboVertex[4].color = imageBuffer->color;
          vboVertex[4].extcolor = imageBuffer->extcolor;
          vboVertex[5].vertex[0] = (short)( vx1 * DM_VERTEX_NORMFACTOR );
          vboVertex[5].vertex[1] = (short)( vy1 * DM_VERTEX_NORMFACTOR );
          vboVertex[5].texcoord0[0] = (short)( tx1 * DM_TEXCOORD_NORMFACTOR );
          vboVertex[5].texcoord0[1] = (short)( ty0 * DM_TEXCOORD_NORMFACTOR );
          vboVertex[5].color = imageBuffer->color;
          vboVertex[5].extcolor = imageBuffer->extcolor;

          vboVertex += 6;
          vertexcount += 6;
        }

#if !defined(__EMSCRIPTEN__)
        glUnmapBuffer( GL_ARRAY_BUFFER );
#endif
        // Flush font manager texture updates
        flush();
        // Render buffered images
        flushRenderDrawBuffer( drawBuffer, program, vertexcount );
        imageBufferCount = 0;

        ERRORCHECK();
      }
   }

public:

   virtual void flush();

   bool init( DrawManagerFlags flags )
   {
      int drawBufferIndex, programIndex;
      DMDrawBuffer *drawBuffer;
      uint vertexSize;

      imageBufferCount = 0;
      imageBufferSize = 4096;
      imageBuffer = new DMImageBuffer[imageBufferSize];
      imageBufferTmp = new DMImageBuffer[imageBufferSize];

      this.flags = flags;

      if( flags.prehistoricOpenGL )
         vertexSize = sizeof(DMDrawVertexFlat);
      else
      {
         DMProgram *program;
         for( programIndex = 0 ; programIndex < DM_PROGRAM_COUNT ; programIndex++ )
         {
            program = &shaderPrograms[ programIndex ];
            program->flags = 0;
            program->lastUpdateCount = -1;
         }
         program = &shaderPrograms[ DM_PROGRAM_NORMAL ];
         if( !( dmCreateProgram( program, dmVertexShaderNormal, dmFragmentShaderNormal, 0 ) ) )
            return false;
         program = &shaderPrograms[ DM_PROGRAM_ALPHABLEND ];
         if( !( dmCreateProgram( program, dmVertexShaderAlpha, dmFragmentShaderAlpha, 0 ) ) )
            return false;
         program = &shaderPrograms[ DM_PROGRAM_ALPHABLEND_INTENSITY ];
         if( !( dmCreateProgram( program, dmVertexShaderAlphaIntensity, dmFragmentShaderAlphaIntensity, 0 ) ) )
            return false;
        program = &shaderPrograms[ DM_PROGRAM_ALPHABLEND_INTENSITY_EXTCOLOR ];
        if( !( dmCreateProgram( program, dmVertexShaderAlphaIntensityExtColor, dmFragmentShaderAlphaIntensityExtColor, 0 ) ) )
            return false;
         // glUseProgram( 0 );
         vertexSize = sizeof(DMDrawVertex);
      }

      for( drawBufferIndex = 0 ; drawBufferIndex < DM_CONTEXT_DRAW_BUFFER_COUNT ; drawBufferIndex++ )
      {
         drawBuffer = &this.drawBuffer[drawBufferIndex];
         drawBuffer->glType = GL_FLOAT;
         drawBuffer->vertexCount = 0;
         drawBuffer->vertexAlloc = DM_CONTEXT_DRAW_BUFFER_VERTEX_ALLOC;
         if(vboAvailable)
         {
            glGenBuffers( 1, &drawBuffer->vbo );
            glBindBuffer( GL_ARRAY_BUFFER, drawBuffer->vbo );
            glBufferData( GL_ARRAY_BUFFER, drawBuffer->vertexAlloc * vertexSize, 0, GL_DYNAMIC_DRAW );
         }
         drawBuffer->vertexBuffer = new byte[drawBuffer->vertexAlloc * vertexSize];
      }

      updateCount = 0;

      return true;
   }


   void end( )
   {
      int i;

      for( i = 0 ; i < DM_CONTEXT_DRAW_BUFFER_COUNT ; i++ )
      {
         DMDrawBuffer *db = &drawBuffer[i];
         if(db->vbo)
            glDeleteBuffers( 1, &db->vbo );
         delete db->vertexBuffer;
      }

      // TODO: Destroy the shaders!
      delete imageBuffer;
      delete imageBufferTmp;
   }

   void ready( int viewportwidth, int viewportheight )
   {
      int mindex;
      float norminv;
      if(!flags.prehistoricOpenGL && !prevProgram)
         glGetIntegerv(GL_CURRENT_PROGRAM, (GLint *)&prevProgram);
      // while(glGetError());

      // ERRORCHECK();

      // Save OpenGL state
      // FIXME: no glPushAttrib() in core profile
#if !defined(__EMSCRIPTEN__)
      glPushClientAttrib( GL_CLIENT_ALL_ATTRIB_BITS );
      glPushAttrib( GL_ALL_ATTRIB_BITS );
#endif

      // Prepare rendering pass
      matrixOrtho( matrix, 0.0, (float)viewportwidth, (float)viewportheight, 0.0, -1.0f, 1.0 );
      norminv = 1.0f / DM_VERTEX_NORMFACTOR;
      for( mindex = 0 ; mindex < 12 ; mindex += 4 )
      {
        matrix[mindex+0] *= norminv;
        matrix[mindex+1] *= norminv;
        matrix[mindex+2] *= norminv;
      }
      drawBarrierIndex = 0;
      orderBarrierMask = drawBarrierIndex << DM_BARRIER_ORDER_SHIFT;
      orderBarrierMask = 0;

      updateCount++;

      if(flags.prehistoricOpenGL)
      {
         glMatrixMode(MatrixMode::projection);
         glLoadMatrixf(matrix);

         glMatrixMode(MatrixMode::modelView);
         glLoadIdentity();
         glScalef(4,4,4);
      }
   }

   void drawImage( DMImage image, int offsetx, int offsety, int sizex, int sizey, uint32 color )
   {
     DMImageBuffer *imageBuffer;

     if( image.flags.empty || ( sizex <= 0 ) || ( sizey <= 0 ) )
       return;

     if( imageBufferCount >= imageBufferSize )
     {
       imageBufferSize <<= 1;
       this.imageBuffer = renew this.imageBuffer DMImageBuffer[imageBufferSize];
       imageBufferTmp = renew imageBufferTmp DMImageBuffer[imageBufferSize];
     }

     imageBuffer = &this.imageBuffer[ imageBufferCount ];
     imageBuffer->image = image;
     imageBuffer->offsetx = (short)(offsetx << DM_VERTEX_NORMSHIFT);
     imageBuffer->offsety = (short)(offsety << DM_VERTEX_NORMSHIFT);
     imageBuffer->sizex = (short)sizex;
     imageBuffer->sizey = (short)sizey;
   #if DM_ENABLE_IMAGE_ROTATION
     imageBuffer->angsin = 0;
     imageBuffer->angcos = (short)DM_IMAGE_ROTATION_NORMFACTOR;
   #endif
     imageBuffer->color = color;
     imageBuffer->orderindex = image.orderMask | orderBarrierMask;

   #if DM_RENDER_IMAGE_DEBUG
   printf( "  Queue image at %d %d, order 0x%x\n", (int)imageBuffer->offsetx, (int)imageBuffer->offsety, (int)imageBuffer->orderindex );
   #endif

     imageBufferCount++;
   }

   void drawImageExtColor( DMImage image, int offsetx, int offsety, int sizex, int sizey, uint32 color, uint32 extcolor )
   {
     DMImageBuffer *imageBuffer;

     if( ( image.flags.empty ) || ( sizex <= 0 ) || ( sizey <= 0 ) )
       return;

     if( imageBufferCount >= imageBufferSize )
     {
       imageBufferSize <<= 1;
       this.imageBuffer = renew this.imageBuffer DMImageBuffer[imageBufferSize];
       imageBufferTmp = renew imageBufferTmp DMImageBuffer[imageBufferSize];
     }

     imageBuffer = &this.imageBuffer[ imageBufferCount ];
     imageBuffer->image = image;
     imageBuffer->offsetx = (short)(offsetx << DM_VERTEX_NORMSHIFT);
     imageBuffer->offsety = (short)(offsety << DM_VERTEX_NORMSHIFT);
     imageBuffer->sizex = (short)sizex;
     imageBuffer->sizey = (short)sizey;
   #if DM_ENABLE_IMAGE_ROTATION
     imageBuffer->angsin = 0;
     imageBuffer->angcos = (short)DM_IMAGE_ROTATION_NORMFACTOR;
   #endif
     imageBuffer->color = color;
   #if DM_ENABLE_EXT_COLOR
     imageBuffer->extcolor = extcolor;
   #endif
     imageBuffer->orderindex = image.orderMask | orderBarrierMask;

   #if DM_RENDER_IMAGE_DEBUG
   printf( "  Queue image at %d %d, order 0x%x\n", (int)imageBuffer->offsetx, (int)imageBuffer->offsety, (int)imageBuffer->orderindex );
   #endif

     this.imageBufferCount++;
   }

   void drawImageFloat( DMImage image, float offsetx, float offsety, float sizex, float sizey, float angsin, float angcos, uint32 color )
   {
     DMImageBuffer *imageBuffer;

     if( image.flags.empty || sizex <= 0 || sizey <= 0 )
       return;

     if( imageBufferCount >= imageBufferSize )
     {
       imageBufferSize <<= 1;
       this.imageBuffer = renew this.imageBuffer DMImageBuffer[imageBufferSize];
       imageBufferTmp = renew imageBufferTmp DMImageBuffer[imageBufferSize];
     }

     imageBuffer = &this.imageBuffer[ imageBufferCount ];
     imageBuffer->image = image;
     imageBuffer->offsetx = (short)roundf(offsetx * DM_VERTEX_NORMFACTOR);
     imageBuffer->offsety = (short)roundf(offsety * DM_VERTEX_NORMFACTOR);
     imageBuffer->sizex = (short)sizex;
     imageBuffer->sizey = (short)sizey;
   #if DM_ENABLE_IMAGE_ROTATION
     imageBuffer->angsin = (short)roundf( angsin * DM_IMAGE_ROTATION_NORMFACTOR );
     imageBuffer->angcos = (short)roundf( angcos * DM_IMAGE_ROTATION_NORMFACTOR );
   #endif
     imageBuffer->color = color;
     imageBuffer->orderindex = image.orderMask | orderBarrierMask;

   #if DM_RENDER_IMAGE_DEBUG
   printf( "  Queue image at %d %d, order 0x%x\n", (int)imageBuffer->offsetx, (int)imageBuffer->offsety, (int)imageBuffer->orderindex );
   #endif

     imageBufferCount++;
   }

   void drawImageFloatExtColor( DMImage image, float offsetx, float offsety, float sizex, float sizey, float angsin, float angcos, uint32 color, uint32 extcolor )
   {
     DMImageBuffer *imageBuffer;

     if( ( image.flags.empty ) || ( sizex <= 0 ) || ( sizey <= 0 ) )
       return;

     if( this.imageBufferCount >= this.imageBufferSize )
     {
       imageBufferSize <<= 1;
       this.imageBuffer = renew this.imageBuffer DMImageBuffer[imageBufferSize];
       imageBufferTmp = renew imageBufferTmp DMImageBuffer[imageBufferSize];
     }

     imageBuffer = &this.imageBuffer[ imageBufferCount ];
     imageBuffer->image = image;
     imageBuffer->offsetx = (short)roundf( offsetx * DM_VERTEX_NORMFACTOR );
     imageBuffer->offsety = (short)roundf( offsety * DM_VERTEX_NORMFACTOR );
     imageBuffer->sizex = (short)sizex;
     imageBuffer->sizey = (short)sizey;
   #if DM_ENABLE_IMAGE_ROTATION
     imageBuffer->angsin = (short)roundf( angsin * DM_IMAGE_ROTATION_NORMFACTOR );
     imageBuffer->angcos = (short)roundf( angcos * DM_IMAGE_ROTATION_NORMFACTOR );
   #endif
     imageBuffer->color = color;
   #if DM_ENABLE_EXT_COLOR
     imageBuffer->extcolor = extcolor;
   #endif
     imageBuffer->orderindex = image.orderMask | orderBarrierMask;

   #if DM_RENDER_IMAGE_DEBUG
   printf( "  Queue image at %d %d, order 0x%x\n", (int)imageBuffer->offsetx, (int)imageBuffer->offsety, (int)imageBuffer->orderindex );
   #endif

     this.imageBufferCount++;
   }

   void flushImages( )
   {
#if !defined(__EMSCRIPTEN__)
     if( flags.prehistoricOpenGL )
       flushDrawImagesArchaic( );
     else
#endif
       flushDrawImages( );

     if(vboAvailable)
        glBindBuffer( GL_ARRAY_BUFFER, 0 );
     glabCurArrayBuffer = 0;
     if( !flags.prehistoricOpenGL )
         glUseProgram( prevProgram );
      // Restore OpenGL state
      // FIXME: no glPushAttrib() in core profile
#if !defined(__EMSCRIPTEN__)
      glPopAttrib();
      glPopClientAttrib();
#endif
   }

   void drawBarrier( )
   {
      drawBarrierIndex++;
      if( drawBarrierIndex >= ( 1 << DM_BARRIER_ORDER_BITS ) )
         flushImages( );
      orderBarrierMask = drawBarrierIndex << DM_BARRIER_ORDER_SHIFT;
   }
}
