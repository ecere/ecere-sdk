/* -----------------------------------------------------------------------------
 * Copyright (c) 2013-2017 Alexis Naveros.
 * Ecere Corporation has unlimited/unrestricted rights.
 * -----------------------------------------------------------------------------
 */
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

typedef unsigned int GLCapabilities;
typedef unsigned int bool;
#include "gl123es.h"

#include "cc.h"
#include "mm.h"

#include "drawmanager.h"

/////


static inline void OpenGLErrorCheck( char *file, int line )
{
#ifdef _DEBUG
  int error;
  error = glGetError();
  if( error != GL_NO_ERROR )
  {
    printf( "ERROR %d at %s:%d\n", error, file, line );
    // exit( 1 );
  }
  return;
#endif
}

#define ERRORCHECK() OpenGLErrorCheck(__FILE__,__LINE__)


////


/* Not using 32767.0 ; overflow when converting to int16_t due to floating point crud causes problems */
#define DM_IMAGE_ROTATION_NORMFACTOR (24576.0)

#define DM_VERTEX_NORMSHIFT (2)
#define DM_VERTEX_NORMFACTOR (4.0f)

#define DM_TEXCOORD_NORMSHIFT (13)
#define DM_TEXCOORD_NORMFACTOR (8192.0)


////


static GLuint dmCreateShader( GLenum type, const char *shadersource, char *optionstring )
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
    printf( "ERROR: Failed to compile shader\n" );
    glGetShaderInfoLog( shader, 8192, &loglength,infolog );
    printf( "ERROR: \n%s\n\n", infolog );
    glDeleteShader( shader );
    return 0;
  }
  return shader;
}


static int dmCreateProgram( dmProgram *program, const char *vertexsource, const char *fragmentsource, char *optionstring )
{
  GLint status;
  GLsizei loglength;
  char infolog[8192];

  program->glprogram = 0;
  program->vertexshader = 0;
  program->fragmentshader = 0;

  program->vertexshader = dmCreateShader( GL_VERTEX_SHADER, vertexsource, optionstring );
  if( !( program->vertexshader ) )
  {
    printf("ERROR: Unable to load vertex shader\n");
    goto error;
  }
  program->fragmentshader = dmCreateShader( GL_FRAGMENT_SHADER, fragmentsource, optionstring );
  if( !( program->fragmentshader ) )
  {
    printf("ERROR: Unable to load fragment shader\n");
    goto error;
  }
  program->glprogram = glCreateProgram();
  if( !( program->glprogram ) )
  {
    printf("ERROR: Unable to create program\n");
    goto error;
  }

  glAttachShader( program->glprogram, program->vertexshader );
  glAttachShader( program->glprogram, program->fragmentshader );

  glBindAttribLocation(program->glprogram, 0, "vertex");
  glBindAttribLocation(program->glprogram, 1, "normal");
  glBindAttribLocation(program->glprogram, 2, "texCoord");
  glBindAttribLocation(program->glprogram, 3, "color");

  glLinkProgram( program->glprogram );
  glGetProgramiv( program->glprogram, GL_LINK_STATUS, &status );
  if( status != GL_TRUE )
  {
    printf( "ERROR, failed to link shader program\n" );
    glGetProgramInfoLog( program->glprogram, 8192, &loglength, infolog );
    printf( "ERROR: \n%s\n\n", infolog );
    goto error;
  }

  // glUseProgram( program->glprogram );

  program->matrixloc = glGetUniformLocation( program->glprogram, "uniMatrix" );
  program->vertexloc = glGetAttribLocation( program->glprogram, "inVertex" );
  program->texcoord0loc = glGetAttribLocation( program->glprogram, "inTexcoord0" );
  program->texcoord1loc = glGetAttribLocation( program->glprogram, "inTexcoord1" );
  program->colorloc = glGetAttribLocation( program->glprogram, "inColor" );
#if DM_ENABLE_EXT_COLOR
  program->extcolorloc = glGetAttribLocation( program->glprogram, "inExtColor" );
#endif
  program->texbaseloc = glGetUniformLocation( program->glprogram, "texBase" );
  program->flags |= DM_PROGRAM_FLAGS_VALID;

  return 1;

  error:
  if( program->fragmentshader )
    glDeleteShader( program->fragmentshader );
  if( program->vertexshader )
    glDeleteShader( program->vertexshader );
  if( program->glprogram )
    glDeleteProgram( program->glprogram );
  return 0;
}


////


const char *dmVertexShaderNormal =
#if defined(__EMSCRIPTEN__) || defined(_GLES2)
   "#version 100\n"
#else
   "#version 110\n"
#endif
#if defined(_GLES2)
   "#define GLSL_FLOAT_PRECISION   1\n"
   "precision highp float;\n"
#else
   "#define GLSL_FLOAT_PRECISION   0\n"
#endif
"uniform mat4 uniMatrix;\n"
"attribute vec2 inVertex;\n"
"attribute vec2 inTexcoord0;\n"
"attribute vec4 inColor;\n"
"varying vec2 varTexcoord0;\n"
"varying vec4 varColor;\n"
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
#if defined(__EMSCRIPTEN__) || defined(_GLES2)
   "#version 100\n"
#else
   "#version 110\n"
#endif
#if defined(_GLES2)
   "#define GLSL_FLOAT_PRECISION   1\n"
   "precision highp float;\n"
#else
   "#define GLSL_FLOAT_PRECISION   0\n"
#endif
"uniform sampler2D texBase;\n"
"varying vec2 varTexcoord0;\n"
"varying vec4 varColor;\n"
//"varying vec4 fragColor;\n"
"void main()\n"
"{\n"
"  gl_FragColor = varColor * texture2D( texBase, varTexcoord0 );\n"
"  return;\n"
"}\n"
;


const char *dmVertexShaderAlpha =
#if defined(__EMSCRIPTEN__) || defined(_GLES2)
   "#version 100\n"
#else
   "#version 110\n"
#endif
#if defined(_GLES2)
   "#define GLSL_FLOAT_PRECISION   1\n"
   "precision highp float;\n"
#else
   "#define GLSL_FLOAT_PRECISION   0\n"
#endif
"uniform mat4 uniMatrix;\n"
"attribute vec2 inVertex;\n"
"attribute vec2 inTexcoord0;\n"
"attribute vec4 inColor;\n"
"varying vec2 varTexcoord0;\n"
"varying vec4 varColor;\n"
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
#if defined(__EMSCRIPTEN__) || defined(_GLES2)
   "#version 100\n"
#else
   "#version 110\n"
#endif
#if defined(_GLES2)
   "#define GLSL_FLOAT_PRECISION   1\n"
   "precision highp float;\n"
#else
   "#define GLSL_FLOAT_PRECISION   0\n"
#endif
"uniform sampler2D texBase;\n"
"varying vec2 varTexcoord0;\n"
"varying vec4 varColor;\n"
//"varying vec4 fragColor;\n"
"void main()\n"
"{\n"
"  gl_FragColor = vec4( varColor.rgb, varColor.a * texture2D( texBase, varTexcoord0 ).r );\n"
"  return;\n"
"}\n"
;


const char *dmVertexShaderAlphaIntensity =
#if defined(__EMSCRIPTEN__) || defined(_GLES2)
   "#version 100\n"
#else
   "#version 110\n"
#endif
#if defined(_GLES2)
   "#define GLSL_FLOAT_PRECISION   1\n"
   "precision highp float;\n"
#else
   "#define GLSL_FLOAT_PRECISION   0\n"
#endif
"uniform mat4 uniMatrix;\n"
"attribute vec2 inVertex;\n"
"attribute vec2 inTexcoord0;\n"
"attribute vec4 inColor;\n"
"varying vec2 varTexcoord0;\n"
"varying vec4 varColor;\n"
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
#if defined(__EMSCRIPTEN__) || defined(_GLES2)
   "#version 100\n"
#else
   "#version 110\n"
#endif
#if defined(_GLES2)
   "#define GLSL_FLOAT_PRECISION   1\n"
   "precision highp float;\n"
#else
   "#define GLSL_FLOAT_PRECISION   0\n"
#endif
"uniform sampler2D texBase;\n"
"varying vec2 varTexcoord0;\n"
"varying vec4 varColor;\n"
//"varying vec4 fragColor;\n"
"void main()\n"
"{\n"
"  vec2 tex;\n"
"  tex = texture2D( texBase, varTexcoord0 ).rg;\n"
"  gl_FragColor = vec4( varColor.rgb * tex.g, varColor.a * tex.r );\n"
"  return;\n"
"}\n"
;


const char *dmVertexShaderAlphaIntensityExtColor =
#if defined(__EMSCRIPTEN__) || defined(_GLES2)
   "#version 100\n"
#else
   "#version 110\n"
#endif
#if defined(_GLES2)
   "#define GLSL_FLOAT_PRECISION   1\n"
   "precision highp float;\n"
#else
   "#define GLSL_FLOAT_PRECISION   0\n"
#endif
"uniform mat4 uniMatrix;\n"
"attribute vec2 inVertex;\n"
"attribute vec2 inTexcoord0;\n"
"attribute vec4 inColor;\n"
"attribute vec4 inExtColor;\n"
"varying vec2 varTexcoord0;\n"
"varying vec4 varColor;\n"
"varying vec4 varExtColor;\n"
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
#if defined(__EMSCRIPTEN__) || defined(_GLES2)
   "#version 100\n"
#else
   "#version 110\n"
#endif
#if defined(_GLES2)
   "#define GLSL_FLOAT_PRECISION   1\n"
   "precision highp float;\n"
#else
   "#define GLSL_FLOAT_PRECISION   0\n"
#endif
"uniform sampler2D texBase;\n"
"varying vec2 varTexcoord0;\n"
"varying vec4 varColor;\n"
"varying vec4 varExtColor;\n"
//"varying vec4 fragColor;\n"
"void main()\n"
"{\n"
"  vec2 tex;\n"
"  tex = texture2D( texBase, varTexcoord0 ).rg;\n"
"  gl_FragColor = vec4( mix( varExtColor.rgb, varColor.rgb, tex.g ), mix( varExtColor.a, varColor.a, tex.g ) * tex.r );\n"
"  return;\n"
"}\n"
;

const char *dmVertexShaderBichrome =
#if defined(__EMSCRIPTEN__) || defined(_GLES2)
   "#version 100\n"
#else
   "#version 110\n"
#endif
#if defined(_GLES2)
   "#define GLSL_FLOAT_PRECISION   1\n"
   "precision highp float;\n"
#else
   "#define GLSL_FLOAT_PRECISION   0\n"
#endif
"uniform mat4 uniMatrix;\n"
"attribute vec2 inVertex;\n"
"attribute vec2 inTexcoord0;\n"
"attribute vec4 inColor;\n"
"attribute vec4 inExtColor;\n"
"varying vec2 varTexcoord0;\n"
"varying vec4 varColor;\n"
"varying vec4 varExtColor;\n"
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


const char *dmFragmentShaderBichrome =
#if defined(__EMSCRIPTEN__) || defined(_GLES2)
   "#version 100\n"
#else
   "#version 110\n"
#endif
#if defined(_GLES2)
   "#define GLSL_FLOAT_PRECISION   1\n"
   "precision highp float;\n"
#else
   "#define GLSL_FLOAT_PRECISION   0\n"
#endif
"uniform sampler2D texBase;\n"
"varying vec2 varTexcoord0;\n"
"varying vec4 varExtColor;\n"
"varying vec4 varColor;\n"
//"varying vec4 fragColor;\n"
"void main()\n"
"{\n"
"  vec4 texel = texture2D( texBase, varTexcoord0 );\n"
"  gl_FragColor = vec4(varColor.rgb * texel.rgb + varExtColor.rgb * (vec3(1.0,1.0,1.0)-texel.rgb), varColor.a * texel.a);\n"
"}\n"
;

////



static void dmMatrixOrtho( float *m, float left, float right, float bottom, float top, float nearval, float farval )
{
  float x, y, z;
  float tx, ty, tz;
  x = 2.0 / ( right - left );
  y = 2.0 / ( top - bottom );
  z = -2.0 / ( farval - nearval );
  tx = -( right + left ) / ( right - left );
  ty = -( top + bottom ) / ( top - bottom );
  tz = -( farval + nearval ) / ( farval - nearval );

#define M(row,col)  m[col*4+row]
  M(0,0) = x;     M(0,1) = 0.0;  M(0,2) = 0.0;  M(0,3) = tx;
  M(1,0) = 0.0;  M(1,1) = y;     M(1,2) = 0.0;  M(1,3) = ty;
  M(2,0) = 0.0;  M(2,1) = 0.0;  M(2,2) = z;     M(2,3) = tz;
  M(3,0) = 0.0;  M(3,1) = 0.0;  M(3,2) = 0.0;  M(3,3) = 1.0;
#undef M

  return;
}

////


void dmClearImage( dmImage *image )
{
  memset( image, 0, sizeof(dmImage) );
  image->flags = DM_IMAGE_FLAGS_EMPTY;
  return;
}

void dmDefineImage( dmImage *image, tmTexture *texture, int offsetx, int offsety, int sizex, int sizey, int blendflag, int programindex, int layerindex )
{
  int ordx, ordy;
  uint32_t orderimage;

  memset( image, 0, sizeof(dmImage) );
  image->flags = 0;
  image->texture = texture;
  image->srcx = offsetx;
  image->srcy = offsety;
  image->sizex = sizex;
  image->sizey = sizey;
  image->programindex = programindex;
  if( blendflag )
    image->flags |= DM_IMAGE_FLAGS_BLENDING;

  ordx = offsetx >> 6;
  ordy = offsety >> 6;
  orderimage = ccMortonNumber32( ordx, ordy ) & ( ( 1 << DM_IMAGE_ORDER_BITS ) - 1 );
  image->ordermask = orderimage << DM_IMAGE_ORDER_SHIFT;
  image->ordermask |= ( blendflag != 0 ) << DM_BLEND_ORDER_SHIFT;
  image->ordermask |= programindex << DM_PROGRAM_ORDER_SHIFT;
  image->ordermask |= texture->ordermask;
  image->ordermask |= layerindex << DM_LAYER_ORDER_SHIFT;

  return;
}


////


/* FIXME: Radix sort, not hybrid sort! */
/*
static inline int dmSortImagesCmp( dmImageBuffer *draw0, dmImageBuffer *draw1 )
{
  return ( ( draw0->orderindex < draw1->orderindex ) ? 0 : 1 );
}

#define HSORT_MAIN dmSortImages
#define HSORT_CMP dmSortImagesCmp
#define HSORT_TYPE dmImageBuffer
#include "cchybridsort.h"
#undef HSORT_MAIN
#undef HSORT_CMP
#undef HSORT_TYPE
*/

////


static dmProgram *dmFlushUseProgram( dmContext *dm, int programindex )
{
  dmProgram *program;

  program = &dm->shaderprograms[ programindex ];
  if( !( program->flags & DM_PROGRAM_FLAGS_VALID ) )
  {
    glUseProgram( 0 );
    return 0;
  }

  glUseProgram( program->glprogram );
  if( program->lastupdatecount != dm->updatecount )
  {
    glUniformMatrix4fv( program->matrixloc, 1, GL_FALSE, dm->matrix );
    glUniform1i( program->texbaseloc, 0 );
    program->lastupdatecount = dm->updatecount;
  }

  return program;
}

#if 0
static void dmFlushRenderDrawBufferArchaic( dmContext *dm, dmDrawBuffer *drawbuffer, dmProgram *program, int vertexcount )
{
  glEnable( GL_TEXTURE_2D );
  glBindBuffer( GL_ARRAY_BUFFER, drawbuffer->vbo );
  glColor3f( 1.0, 1.0, 1.0 );

  glEnableClientState( GL_VERTEX_ARRAY );
  glEnableClientState( GL_TEXTURE_COORD_ARRAY );
  glEnableClientState( GL_COLOR_ARRAY );

  glVertexPointer( 2, GL_FLOAT, sizeof(dmDrawVertexFlat), (void *)offsetof(dmDrawVertexFlat,vertex) );
  glTexCoordPointer( 2, GL_FLOAT, sizeof(dmDrawVertexFlat), (void *)offsetof(dmDrawVertexFlat,texcoord0) );
  glColorPointer( 4, GL_UNSIGNED_BYTE, sizeof(dmDrawVertexFlat), (void *)offsetof(dmDrawVertexFlat,color) );

  glDrawArrays( GL_TRIANGLES, 0, vertexcount );

  glDisableClientState( GL_VERTEX_ARRAY );
  glDisableClientState( GL_TEXTURE_COORD_ARRAY );
  glDisableClientState( GL_COLOR_ARRAY );
  glDisable( GL_TEXTURE_2D );

#if DM_FLUSH_EACH_RENDER_DRAW_BUFFER
  glFlush();
#endif

  return;
}

static void dmFlushDrawImagesArchaic( dmContext *dm )
{
  int index, stateblend, vertexcount, flushflag, programindex;
  float vx0, vx1, vx2, vx3, vy0, vy1, vy2, vy3;
#if DM_ENABLE_IMAGE_ROTATION
  float angsin, angcos, sizex, sizey;
#endif
  float tx0, tx1, ty0, ty1;
  dmImageBuffer *imagebuffer;
  dmImage *image, *bindimage;
  tmTexture *texture, *bindtexture;
  dmDrawBuffer *drawbuffer;
  dmDrawVertexFlat *vbovertex;
  dmProgram *program;
#if !ENABLE_GL_MAPBUF
  dmDrawVertex *vboStorage = NULL;
#endif

  ERRORCHECK();

  dm->drawbarrierindex = 0;
  dm->orderbarriermask = dm->drawbarrierindex << DM_BARRIER_ORDER_SHIFT;
  if( !( dm->imagebuffercount ) )
    return;

  /* Sort by image type and texture, minimize state changes */
  // dmSortImages( dm->imagebuffer, dm->imagebuffertmp, dm->imagebuffercount, (uint32_t)( (intptr_t)dm->imagebuffer >> 4 ) );

  /* Fill a drawbuffer, write vertex and texcoords */
  drawbuffer = &dm->drawbuffer[dm->drawbufferindex];
  dm->drawbufferindex = ( dm->drawbufferindex + 1 ) % DM_CONTEXT_DRAW_BUFFER_COUNT;
  glBindBuffer( GL_ARRAY_BUFFER, drawbuffer->vbo );
#if ENABLE_GL_MAPBUF
  vboVertex = glMapBuffer( GL_ARRAY_BUFFER, GL_WRITE_ONLY );
#else
  vboVertex = vboStorage = malloc(sizeof(dmDrawVertex)* drawbuffer->vertexAlloc);
#endif
  vertexcount = 0;

  glActiveTexture( GL_TEXTURE0 );
  glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA );
  glDisable( GL_BLEND );

#if DM_RENDER_IMAGE_DEBUG
printf( " Flush %d images\n", (int)dm->imagebuffercount );
#endif

  bindimage = 0;
  bindtexture = 0;
  stateblend = 0;
  programindex = -1;
  program = 0;
  imagebuffer = dm->imagebuffer;
  for( index = 0 ; index < dm->imagebuffercount ; index++, imagebuffer++ )
  {
    image = imagebuffer->image;
    texture = image->texture;

    flushflag = 0;
    if( image != bindimage )
    {
      if( stateblend != ( image->flags & DM_IMAGE_FLAGS_BLENDING ) )
        flushflag = 1;
      if( texture != bindtexture )
        flushflag = 1;
    }
    if( vertexcount >= ( drawbuffer->vertexalloc - 6 ) )
      flushflag = 1;

    if( flushflag )
    {
      if( vertexcount )
      {
#if ENABLE_GL_MAPBUF
        glUnmapBuffer( GL_ARRAY_BUFFER );
#else
        glBufferSubData( GL_ARRAY_BUFFER, 0, vertexcount * sizeof(dmDrawVertex), vboStorage );
#endif
        /* Flush font manager texture updates */
        if( dm->flushcallback )
          dm->flushcallback( dm->flushcallbackcontext );
        /* Render buffered images */
        dmFlushRenderDrawBufferArchaic( dm, drawbuffer, program, vertexcount );
        drawbuffer = &dm->drawbuffer[dm->drawbufferindex];
        dm->drawbufferindex = ( dm->drawbufferindex + 1 ) % DM_CONTEXT_DRAW_BUFFER_COUNT;
        glBindBuffer( GL_ARRAY_BUFFER, drawbuffer->vbo );
#if ENABLE_GL_MAPBUF
        vboVertex = glMapBuffer( GL_ARRAY_BUFFER, GL_WRITE_ONLY );
#else
        vboVertex = vboStorage;
#endif
        vertexcount = 0;
      }

      if( stateblend != ( image->flags & DM_IMAGE_FLAGS_BLENDING ) )
      {
        stateblend = image->flags & DM_IMAGE_FLAGS_BLENDING;
        ( stateblend ? glEnable : glDisable )( GL_BLEND );
#if DM_RENDER_IMAGE_DEBUG
printf( "  Switch blending %d\n", ( stateblend != 0 ) );
#endif
      }
      if( programindex != image->programindex )
      {
        programindex = image->programindex;
        program = dmFlushUseProgram( dm, programindex );
      }
      if( texture != bindtexture )
      {
        bindtexture = texture;
        glBindTexture( GL_TEXTURE_2D, bindtexture->gltex );
#if DM_RENDER_IMAGE_DEBUG
printf( "  Switch to texture 0x%x\n", (int)texture->ordermask );
#endif
      }
      bindimage = image;
    }

#if DM_RENDER_IMAGE_DEBUG
printf( "   Render image at %d %d, order 0x%x, texture %p\n", (int)imagebuffer->offsetx, (int)imagebuffer->offsety, (int)imagebuffer->orderindex, texture );
#endif

#if DM_ENABLE_IMAGE_ROTATION
    angsin = (float)imagebuffer->angsin * (1.0f/DM_IMAGE_ROTATION_NORMFACTOR);
    angcos = (float)imagebuffer->angcos * (1.0f/DM_IMAGE_ROTATION_NORMFACTOR);
    sizex = (float)imagebuffer->sizex;
    sizey = (float)imagebuffer->sizey;
    vx0 = (float)imagebuffer->offsetx * (1.0f/DM_VERTEX_NORMFACTOR);
    vy0 = (float)imagebuffer->offsety * (1.0f/DM_VERTEX_NORMFACTOR);
    vx1 = vx0 + ( angcos * sizex );
    vy1 = vy0 + ( angsin * sizex );
    vx2 = vx0 - ( angsin * sizey );
    vy2 = vy0 + ( angcos * sizey );
    vx3 = vx0 + ( angcos * sizex ) - ( angsin * sizey );
    vy3 = vy0 + ( angsin * sizex ) + ( angcos * sizey );
#else
    vx0 = (float)imagebuffer->offsetx * (1.0f/DM_VERTEX_NORMFACTOR);
    vy0 = (float)imagebuffer->offsety * (1.0f/DM_VERTEX_NORMFACTOR);
    vx3 = vx0 + (float)( imagebuffer->sizex );
    vy3 = vy0 + (float)( imagebuffer->sizey );
    vx1 = vx3;
    vy1 = vy0;
    vx2 = vx0;
    vy2 = vy3;
#endif

    tx0 = (float)( image->srcx ) * texture->widthinv;
    ty0 = (float)( image->srcy ) * texture->heightinv;
    tx1 = (float)( image->srcx + image->sizex ) * texture->widthinv;
    ty1 = (float)( image->srcy + image->sizey ) * texture->heightinv;

    /* Write data to VBO */
    vbovertex[0].vertex[0] = vx3;
    vbovertex[0].vertex[1] = vy3;
    vbovertex[0].texcoord0[0] = tx1;
    vbovertex[0].texcoord0[1] = ty1;
    vbovertex[0].color = imagebuffer->color;
#if DM_ENABLE_EXT_COLOR
    vbovertex[0].extcolor = imagebuffer->extcolor;
#endif
    vbovertex[1].vertex[0] = vx1;
    vbovertex[1].vertex[1] = vy1;
    vbovertex[1].texcoord0[0] = tx1;
    vbovertex[1].texcoord0[1] = ty0;
    vbovertex[1].color = imagebuffer->color;
#if DM_ENABLE_EXT_COLOR
    vbovertex[1].extcolor = imagebuffer->extcolor;
#endif
    vbovertex[2].vertex[0] = vx2;
    vbovertex[2].vertex[1] = vy2;
    vbovertex[2].texcoord0[0] = tx0;
    vbovertex[2].texcoord0[1] = ty1;
    vbovertex[2].color = imagebuffer->color;
#if DM_ENABLE_EXT_COLOR
    vbovertex[2].extcolor = imagebuffer->extcolor;
#endif
    vbovertex[3].vertex[0] = vx0;
    vbovertex[3].vertex[1] = vy0;
    vbovertex[3].texcoord0[0] = tx0;
    vbovertex[3].texcoord0[1] = ty0;
    vbovertex[3].color = imagebuffer->color;
#if DM_ENABLE_EXT_COLOR
    vbovertex[3].extcolor = imagebuffer->extcolor;
#endif
    vbovertex[4].vertex[0] = vx2;
    vbovertex[4].vertex[1] = vy2;
    vbovertex[4].texcoord0[0] = tx0;
    vbovertex[4].texcoord0[1] = ty1;
    vbovertex[4].color = imagebuffer->color;
#if DM_ENABLE_EXT_COLOR
    vbovertex[4].extcolor = imagebuffer->extcolor;
#endif
    vbovertex[5].vertex[0] = vx1;
    vbovertex[5].vertex[1] = vy1;
    vbovertex[5].texcoord0[0] = tx1;
    vbovertex[5].texcoord0[1] = ty0;
    vbovertex[5].color = imagebuffer->color;
#if DM_ENABLE_EXT_COLOR
    vbovertex[5].extcolor = imagebuffer->extcolor;
#endif

    vbovertex += 6;
    vertexcount += 6;
  }
#if ENABLE_GL_MAPBUF
   glUnmapBuffer( GL_ARRAY_BUFFER );
#else
   glBufferSubData( GL_ARRAY_BUFFER, 0, vertexcount * sizeof(dmDrawVertex), vboStorage );
   free(vboStorage);
#endif
  /* Flush font manager texture updates */
  if( dm->flushcallback )
    dm->flushcallback( dm->flushcallbackcontext );
  /* Render buffered images */
  dmFlushRenderDrawBufferArchaic( dm, drawbuffer, program, vertexcount );
  dm->imagebuffercount = 0;

  ERRORCHECK();

  return;
}
#endif

static void dmFlushRenderDrawBuffer( dmContext *dm, dmDrawBuffer *drawbuffer, dmProgram *program, int vertexcount )
{
  glBindBuffer( GL_ARRAY_BUFFER, drawbuffer->vbo );
  if( program->vertexloc != -1 )
  {
    glEnableVertexAttribArray( program->vertexloc );
    glVertexAttribPointer( program->vertexloc, 2, GL_SHORT, GL_FALSE, sizeof(dmDrawVertex), (void *)offsetof(dmDrawVertex,vertex) );
  }
  if( program->texcoord0loc != -1 )
  {
    glEnableVertexAttribArray( program->texcoord0loc );
    glVertexAttribPointer( program->texcoord0loc, 2, GL_SHORT, GL_FALSE, sizeof(dmDrawVertex), (void *)offsetof(dmDrawVertex,texcoord0) );
  }
  if( program->colorloc != -1 )
  {
    glEnableVertexAttribArray( program->colorloc );
    glVertexAttribPointer( program->colorloc, 4, GL_UNSIGNED_BYTE, GL_TRUE, sizeof(dmDrawVertex), (void *)offsetof(dmDrawVertex,color) );
  }
#if DM_ENABLE_EXT_COLOR
  if( program->extcolorloc != -1 )
  {
    glEnableVertexAttribArray( program->extcolorloc );
    glVertexAttribPointer( program->extcolorloc, 4, GL_UNSIGNED_BYTE, GL_TRUE, sizeof(dmDrawVertex), (void *)offsetof(dmDrawVertex,extcolor) );
  }
#endif

  glDrawArrays( GL_TRIANGLES, 0, vertexcount );

  if( program->vertexloc != -1 )
    glDisableVertexAttribArray( program->vertexloc );
  if( program->texcoord0loc != -1 )
    glDisableVertexAttribArray( program->texcoord0loc );
  if( program->colorloc != -1 )
    glDisableVertexAttribArray( program->colorloc );
#if DM_ENABLE_EXT_COLOR
  if( program->extcolorloc != -1 )
    glDisableVertexAttribArray( program->extcolorloc );
#endif

#if DM_FLUSH_EACH_RENDER_DRAW_BUFFER
  glFlush();
#endif

  return;
}


static void dmFlushDrawImages( dmContext *dm )
{
  int index, stateblend, vertexcount, flushflag, programindex;
  float vx0, vx1, vx2, vx3, vy0, vy1, vy2, vy3;
#if DM_ENABLE_IMAGE_ROTATION
  float angsin, angcos, sizex, sizey;
#endif
  float tx0, tx1, ty0, ty1;
  dmImageBuffer *imagebuffer;
  dmImage *image, *bindimage;
  tmTexture *texture, *bindtexture;
  dmDrawBuffer *drawbuffer;
  dmDrawVertex *vbovertex;
  dmProgram *program;
#if !ENABLE_GL_MAPBUF
  dmDrawVertex *vboStorage = NULL;
#endif

  ERRORCHECK();

  dm->drawbarrierindex = 0;
  dm->orderbarriermask = dm->drawbarrierindex << DM_BARRIER_ORDER_SHIFT;
  if( !( dm->imagebuffercount ) )
    return;

  /* Sort by image type and texture, minimize state changes */
  // dmSortImages( dm->imagebuffer, dm->imagebuffertmp, dm->imagebuffercount, (uint32_t)( (intptr_t)dm->imagebuffer >> 4 ) );

  /* Fill a drawbuffer, write vertex and texcoords */
  drawbuffer = &dm->drawbuffer[dm->drawbufferindex];
  dm->drawbufferindex = ( dm->drawbufferindex + 1 ) % DM_CONTEXT_DRAW_BUFFER_COUNT;
  glBindBuffer( GL_ARRAY_BUFFER, drawbuffer->vbo );
#if ENABLE_GL_MAPBUF
   #ifdef _GLES3
  vbovertex = glMapBufferRange( GL_ARRAY_BUFFER, 0, sizeof(dmDrawVertex)* drawbuffer->vertexalloc, GL_MAP_WRITE_BIT);
   #else
  vbovertex = glMapBuffer( GL_ARRAY_BUFFER, GL_WRITE_ONLY );
   #endif
#else
  vbovertex = vboStorage = malloc(sizeof(dmDrawVertex)* drawbuffer->vertexalloc);
#endif
  vertexcount = 0;

  glActiveTexture( GL_TEXTURE0 );
  glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA );
  glDisable( GL_BLEND );

#if DM_RENDER_IMAGE_DEBUG
printf( " Flush %d images\n", (int)dm->imagebuffercount );
#endif

  bindimage = 0;
  bindtexture = 0;
  stateblend = 0;
  programindex = -1;
  program = 0;
  imagebuffer = dm->imagebuffer;
  for( index = 0 ; index < dm->imagebuffercount ; index++, imagebuffer++ )
  {
    image = imagebuffer->image;
    texture = image->texture;

    flushflag = 0;
    if( image != bindimage )
    {
      if( stateblend != ( image->flags & DM_IMAGE_FLAGS_BLENDING ) )
        flushflag = 1;
      if( texture != bindtexture )
        flushflag = 1;
    }
    if( vertexcount >= ( drawbuffer->vertexalloc - 6 ) )
      flushflag = 1;

    if( flushflag )
    {
      if( vertexcount )
      {
#if ENABLE_GL_MAPBUF
        glUnmapBuffer( GL_ARRAY_BUFFER );
#else
        glBufferSubData( GL_ARRAY_BUFFER, 0, vertexcount * sizeof(dmDrawVertex), vboStorage );
#endif
        /* Flush font manager texture updates */
        if( dm->flushcallback )
        {
          dm->flushcallback( dm->flushcallbackcontext );

          // FIXME: The font manager might mess up our texture with atlas updates
          if(bindtexture)
            glBindTexture( GL_TEXTURE_2D, bindtexture->gltex );
          else
            printf("drawmanager: null texture!\n");
        }

        /* Render buffered images */
        dmFlushRenderDrawBuffer( dm, drawbuffer, program, vertexcount );
        drawbuffer = &dm->drawbuffer[dm->drawbufferindex];
        dm->drawbufferindex = ( dm->drawbufferindex + 1 ) % DM_CONTEXT_DRAW_BUFFER_COUNT;
        glBindBuffer( GL_ARRAY_BUFFER, drawbuffer->vbo );
#if ENABLE_GL_MAPBUF
   #if _GLES3
        vbovertex = glMapBufferRange( GL_ARRAY_BUFFER, 0, sizeof(dmDrawVertex)* drawbuffer->vertexalloc, GL_MAP_WRITE_BIT);
   #else
        vbovertex = glMapBuffer( GL_ARRAY_BUFFER, GL_WRITE_ONLY );
   #endif
#else
        vbovertex = vboStorage;
#endif
        vertexcount = 0;
      }

      if( stateblend != ( image->flags & DM_IMAGE_FLAGS_BLENDING ) )
      {
        stateblend = image->flags & DM_IMAGE_FLAGS_BLENDING;
        ( stateblend ? glEnable : glDisable )( GL_BLEND );
#if DM_RENDER_IMAGE_DEBUG
printf( "  Switch blending %d\n", ( stateblend != 0 ) );
#endif
      }
      if( programindex != image->programindex )
      {
        programindex = image->programindex;
        program = dmFlushUseProgram( dm, programindex );
        if(!program)
        {
         printf("drawmanager: null program!\n");
         return;
        }
      }
      if( texture != bindtexture )
      {
        bindtexture = texture;
        if(!bindtexture)
           printf("drawmanager: null texture!\n");
        else
        {
           glBindTexture( GL_TEXTURE_2D, bindtexture->gltex );
#if DM_RENDER_IMAGE_DEBUG
printf( "  Switch to texture 0x%x\n", (int)texture->ordermask );
#endif
        }
      }
      bindimage = image;
    }

#if DM_RENDER_IMAGE_DEBUG
printf( "   Render image at %d %d, order 0x%x, texture %p\n", (int)imagebuffer->offsetx, (int)imagebuffer->offsety, (int)imagebuffer->orderindex, texture );
#endif

#if DM_ENABLE_IMAGE_ROTATION
    /* FIXME TODO: Don't go through float, compute texcoord integers directly */
    angsin = (float)imagebuffer->angsin * (1.0/DM_IMAGE_ROTATION_NORMFACTOR);
    angcos = (float)imagebuffer->angcos * (1.0/DM_IMAGE_ROTATION_NORMFACTOR);
    sizex = (float)imagebuffer->sizex;
    sizey = (float)imagebuffer->sizey;
    vx0 = (float)imagebuffer->offsetx * (1.0f/DM_VERTEX_NORMFACTOR);
    vy0 = (float)imagebuffer->offsety * (1.0f/DM_VERTEX_NORMFACTOR);
    vx1 = vx0 + ( angcos * sizex );
    vy1 = vy0 + ( angsin * sizex );
    vx2 = vx0 - ( angsin * sizey );
    vy2 = vy0 + ( angcos * sizey );
    vx3 = vx0 + ( angcos * sizex ) - ( angsin * sizey );
    vy3 = vy0 + ( angsin * sizex ) + ( angcos * sizey );
#else
    /* FIXME TODO: Don't go through float, compute texcoord integers directly */
    vx0 = (float)imagebuffer->offsetx * (1.0f/DM_VERTEX_NORMFACTOR);
    vy0 = (float)imagebuffer->offsety * (1.0f/DM_VERTEX_NORMFACTOR);
    vx3 = vx0 + (float)( imagebuffer->sizex );
    vy3 = vy0 + (float)( imagebuffer->sizey );
    vx1 = vx3;
    vy1 = vy0;
    vx2 = vx0;
    vy2 = vy3;
#endif

    /* FIXME TODO: Don't go through float, compute texcoord integers directly */
    tx0 = (float)( image->srcx ) * texture->widthinv;
    ty0 = (float)( image->srcy ) * texture->heightinv;
    tx1 = (float)( image->srcx + image->sizex ) * texture->widthinv;
    ty1 = (float)( image->srcy + image->sizey ) * texture->heightinv;

    /* Write data to VBO */
    /* TODO: write vertex/texcoord all at once with SSE */
    vbovertex[0].vertex[0] = (int16_t)( vx3 * DM_VERTEX_NORMFACTOR );
    vbovertex[0].vertex[1] = (int16_t)( vy3 * DM_VERTEX_NORMFACTOR );
    vbovertex[0].texcoord0[0] = (int16_t)( tx1 * DM_TEXCOORD_NORMFACTOR );
    vbovertex[0].texcoord0[1] = (int16_t)( ty1 * DM_TEXCOORD_NORMFACTOR );
    vbovertex[0].color = imagebuffer->color;
#if DM_ENABLE_EXT_COLOR
    vbovertex[0].extcolor = imagebuffer->extcolor;
#endif
    vbovertex[1].vertex[0] = (int16_t)( vx1 * DM_VERTEX_NORMFACTOR );
    vbovertex[1].vertex[1] = (int16_t)( vy1 * DM_VERTEX_NORMFACTOR );
    vbovertex[1].texcoord0[0] = (int16_t)( tx1 * DM_TEXCOORD_NORMFACTOR );
    vbovertex[1].texcoord0[1] = (int16_t)( ty0 * DM_TEXCOORD_NORMFACTOR );
    vbovertex[1].color = imagebuffer->color;
#if DM_ENABLE_EXT_COLOR
    vbovertex[1].extcolor = imagebuffer->extcolor;
#endif
    vbovertex[2].vertex[0] = (int16_t)( vx2 * DM_VERTEX_NORMFACTOR );
    vbovertex[2].vertex[1] = (int16_t)( vy2 * DM_VERTEX_NORMFACTOR );
    vbovertex[2].texcoord0[0] = (int16_t)( tx0 * DM_TEXCOORD_NORMFACTOR );
    vbovertex[2].texcoord0[1] = (int16_t)( ty1 * DM_TEXCOORD_NORMFACTOR );
    vbovertex[2].color = imagebuffer->color;
#if DM_ENABLE_EXT_COLOR
    vbovertex[2].extcolor = imagebuffer->extcolor;
#endif
    vbovertex[3].vertex[0] = (int16_t)( vx0 * DM_VERTEX_NORMFACTOR );
    vbovertex[3].vertex[1] = (int16_t)( vy0 * DM_VERTEX_NORMFACTOR );
    vbovertex[3].texcoord0[0] = (int16_t)( tx0 * DM_TEXCOORD_NORMFACTOR );
    vbovertex[3].texcoord0[1] = (int16_t)( ty0 * DM_TEXCOORD_NORMFACTOR );
    vbovertex[3].color = imagebuffer->color;
#if DM_ENABLE_EXT_COLOR
    vbovertex[3].extcolor = imagebuffer->extcolor;
#endif
    vbovertex[4].vertex[0] = (int16_t)( vx2 * DM_VERTEX_NORMFACTOR );
    vbovertex[4].vertex[1] = (int16_t)( vy2 * DM_VERTEX_NORMFACTOR );
    vbovertex[4].texcoord0[0] = (int16_t)( tx0 * DM_TEXCOORD_NORMFACTOR );
    vbovertex[4].texcoord0[1] = (int16_t)( ty1 * DM_TEXCOORD_NORMFACTOR );
    vbovertex[4].color = imagebuffer->color;
#if DM_ENABLE_EXT_COLOR
    vbovertex[4].extcolor = imagebuffer->extcolor;
#endif
    vbovertex[5].vertex[0] = (int16_t)( vx1 * DM_VERTEX_NORMFACTOR );
    vbovertex[5].vertex[1] = (int16_t)( vy1 * DM_VERTEX_NORMFACTOR );
    vbovertex[5].texcoord0[0] = (int16_t)( tx1 * DM_TEXCOORD_NORMFACTOR );
    vbovertex[5].texcoord0[1] = (int16_t)( ty0 * DM_TEXCOORD_NORMFACTOR );
    vbovertex[5].color = imagebuffer->color;
#if DM_ENABLE_EXT_COLOR
    vbovertex[5].extcolor = imagebuffer->extcolor;
#endif

    vbovertex += 6;
    vertexcount += 6;
  }
#if ENABLE_GL_MAPBUF
   glUnmapBuffer( GL_ARRAY_BUFFER );
#else
   glBufferSubData( GL_ARRAY_BUFFER, 0, vertexcount * sizeof(dmDrawVertex), vboStorage );
   free(vboStorage);
#endif
  /* Flush font manager texture updates */
  if( dm->flushcallback )
    dm->flushcallback( dm->flushcallbackcontext );
  /* Render buffered images */
  dmFlushRenderDrawBuffer( dm, drawbuffer, program, vertexcount );
  dm->imagebuffercount = 0;

  if(!stateblend)
     glEnable(GL_BLEND);

  ERRORCHECK();
}

void dmSetFlushCallback( dmContext *dm, void (*flush)( void *flushcontext ), void *flushcontext )
{
  dm->flushcallback = flush;
  dm->flushcallbackcontext = flushcontext;
}

int dmInit( dmContext *dm, int flags )
{
  int drawbufferindex, programindex, vertexsize;
  dmProgram *program;
  dmDrawBuffer *drawbuffer;

  memset( dm, 0, sizeof(dmContext) );

  dm->imagebuffercount = 0;
  dm->imagebuffersize = 4096;
  dm->imagebuffer = malloc( dm->imagebuffersize * sizeof(dmImageBuffer) );
  dm->imagebuffertmp = malloc( dm->imagebuffersize * sizeof(dmImageBuffer) );

  dm->flushcallback = 0;
  dm->flushcallbackcontext = 0;
  dm->flags = flags;

  if( dm->flags & DM_FLAGS_PREHISTORIC_OPENGL )
    vertexsize = sizeof(dmDrawVertexFlat);
  else
  {
    for( programindex = 0 ; programindex < DM_PROGRAM_COUNT ; programindex++ )
    {
      program = &dm->shaderprograms[ programindex ];
      program->flags = 0;
      program->lastupdatecount = -1;
    }
    program = &dm->shaderprograms[ DM_PROGRAM_NORMAL ];
    if( !( dmCreateProgram( program, dmVertexShaderNormal, dmFragmentShaderNormal, 0 ) ) )
      return 0;
    program = &dm->shaderprograms[ DM_PROGRAM_ALPHABLEND ];
    if( !( dmCreateProgram( program, dmVertexShaderAlpha, dmFragmentShaderAlpha, 0 ) ) )
      return 0;
    program = &dm->shaderprograms[ DM_PROGRAM_ALPHABLEND_INTENSITY ];
    if( !( dmCreateProgram( program, dmVertexShaderAlphaIntensity, dmFragmentShaderAlphaIntensity, 0 ) ) )
      return 0;
    program = &dm->shaderprograms[ DM_PROGRAM_ALPHABLEND_INTENSITY_EXTCOLOR ];
    if( !( dmCreateProgram( program, dmVertexShaderAlphaIntensityExtColor, dmFragmentShaderAlphaIntensityExtColor, 0 ) ) )
      return 0;
    program = &dm->shaderprograms[ DM_PROGRAM_BICHROME ];
    if( !( dmCreateProgram( program, dmVertexShaderBichrome, dmFragmentShaderBichrome, 0 ) ) )
      return 0;
    //glUseProgram( 0 );
    vertexsize = sizeof(dmDrawVertex);
  }

  for( drawbufferindex = 0 ; drawbufferindex < DM_CONTEXT_DRAW_BUFFER_COUNT ; drawbufferindex++ )
  {
    drawbuffer = &dm->drawbuffer[drawbufferindex];
    drawbuffer->gltype = GL_FLOAT;
    drawbuffer->vertexcount = 0;
    drawbuffer->vertexalloc = DM_CONTEXT_DRAW_BUFFER_VERTEX_ALLOC;
    glGenBuffers( 1, &drawbuffer->vbo );
    glBindBuffer( GL_ARRAY_BUFFER, drawbuffer->vbo );
    glBufferData( GL_ARRAY_BUFFER, drawbuffer->vertexalloc * vertexsize, 0, GL_DYNAMIC_DRAW );
    drawbuffer->vertexbuffer = malloc( drawbuffer->vertexalloc * vertexsize );
  }

  dm->updatecount = 0;

  return 1;
}

void dmEnd( dmContext *dm )
{
  int drawbufferindex;
  dmDrawBuffer *drawbuffer;

  for( drawbufferindex = 0 ; drawbufferindex < DM_CONTEXT_DRAW_BUFFER_COUNT ; drawbufferindex++ )
  {
    drawbuffer = &dm->drawbuffer[drawbufferindex];
    if(drawbuffer->vbo)
      glDeleteBuffers( 1, &drawbuffer->vbo );
  }

  /* TODO: Destroy the shaders! */
}

void dmReady( dmContext *dm, int viewportwidth, int viewportheight )
{
  int mindex;
  float norminv;
  glGetIntegerv(GL_CURRENT_PROGRAM, (GLint *)&dm->prevProgram);
  // while(glGetError());

  /* Save OpenGL state */
#if 0
  if( dm->flags & DM_FLAGS_PREHISTORIC_OPENGL )
  {
   glPushClientAttrib( GL_CLIENT_ALL_ATTRIB_BITS );
   glPushAttrib( GL_ALL_ATTRIB_BITS );
  }
#endif // 0

  // Prepare rendering pass
  dmMatrixOrtho( dm->matrix, 0.0, (float)viewportwidth, (float)viewportheight, 0.0, -1.0, 1.0 );
  norminv = 1.0f / DM_VERTEX_NORMFACTOR;
  for( mindex = 0 ; mindex < 12 ; mindex += 4 )
  {
    dm->matrix[mindex+0] *= norminv;
    dm->matrix[mindex+1] *= norminv;
    dm->matrix[mindex+2] *= norminv;
  }

  dm->drawbarrierindex = 0;
  dm->orderbarriermask = dm->drawbarrierindex << DM_BARRIER_ORDER_SHIFT;
  dm->orderbarriermask = 0;

    dmProgram * program;
    int programindex;
    for( programindex = 0 ; programindex < DM_PROGRAM_COUNT ; programindex++ )
    {
      program = &dm->shaderprograms[ programindex ];
      program->lastupdatecount = -1;
    }

  dm->updatecount++;
}


////

static void resizeImageBuffer(dmContext *dm)
{
  dm->imagebuffersize <<= 1;
  dm->imagebuffer = realloc( dm->imagebuffer, dm->imagebuffersize * sizeof(dmImageBuffer) );
  dm->imagebuffertmp = realloc( dm->imagebuffertmp, dm->imagebuffersize * sizeof(dmImageBuffer) );
  // FIXME: Something is using this uninitialized memory...
  memset((char *)dm->imagebuffer + dm->imagebuffercount * sizeof(dmImageBuffer), 0,
    (dm->imagebuffersize - dm->imagebuffercount) * sizeof(dmImageBuffer));
}

void dmDrawImage( dmContext *dm, dmImage *image, int offsetx, int offsety, int sizex, int sizey, uint32_t color )
{
  dmImageBuffer *imagebuffer;

  if( ( image->flags & DM_IMAGE_FLAGS_EMPTY ) || ( sizex <= 0 ) || ( sizey <= 0 ) )
    return;

  if( dm->imagebuffercount >= dm->imagebuffersize )
     resizeImageBuffer(dm);

  imagebuffer = &dm->imagebuffer[ dm->imagebuffercount ];
  imagebuffer->image = image;
  imagebuffer->offsetx = offsetx << DM_VERTEX_NORMSHIFT;
  imagebuffer->offsety = offsety << DM_VERTEX_NORMSHIFT;
  imagebuffer->sizex = sizex;
  imagebuffer->sizey = sizey;
#if DM_ENABLE_IMAGE_ROTATION
  imagebuffer->angsin = 0;
  imagebuffer->angcos = (int16_t)DM_IMAGE_ROTATION_NORMFACTOR;
#endif
  imagebuffer->color = color;
  imagebuffer->orderindex = image->ordermask | dm->orderbarriermask;

#if DM_RENDER_IMAGE_DEBUG
printf( "  Queue image at %d %d, order 0x%x\n", (int)imagebuffer->offsetx, (int)imagebuffer->offsety, (int)imagebuffer->orderindex );
#endif

  dm->imagebuffercount++;
}


void dmDrawImageExtColor( dmContext *dm, dmImage *image, int offsetx, int offsety, int sizex, int sizey, uint32_t color, uint32_t extcolor )
{
  dmImageBuffer *imagebuffer;

  if( ( image->flags & DM_IMAGE_FLAGS_EMPTY ) || ( sizex <= 0 ) || ( sizey <= 0 ) )
    return;

  if( dm->imagebuffercount >= dm->imagebuffersize )
    resizeImageBuffer(dm);

  imagebuffer = &dm->imagebuffer[ dm->imagebuffercount ];
  imagebuffer->image = image;
  imagebuffer->offsetx = offsetx << DM_VERTEX_NORMSHIFT;
  imagebuffer->offsety = offsety << DM_VERTEX_NORMSHIFT;
  imagebuffer->sizex = sizex;
  imagebuffer->sizey = sizey;
#if DM_ENABLE_IMAGE_ROTATION
  imagebuffer->angsin = 0;
  imagebuffer->angcos = (int16_t)DM_IMAGE_ROTATION_NORMFACTOR;
#endif
  imagebuffer->color = color;
#if DM_ENABLE_EXT_COLOR
  imagebuffer->extcolor = extcolor;
#endif
  imagebuffer->orderindex = image->ordermask | dm->orderbarriermask;

#if DM_RENDER_IMAGE_DEBUG
printf( "  Queue image at %d %d, order 0x%x\n", (int)imagebuffer->offsetx, (int)imagebuffer->offsety, (int)imagebuffer->orderindex );
#endif

  dm->imagebuffercount++;
}


void dmDrawImageFloat( dmContext *dm, dmImage *image, float offsetx, float offsety, float sizex, float sizey, float angsin, float angcos, uint32_t color )
{
  float x, y;

  if( ( image->flags & DM_IMAGE_FLAGS_EMPTY ) || ( sizex <= 0 ) || ( sizey <= 0 ) )
    return;

  x = roundf( offsetx * DM_VERTEX_NORMFACTOR );
  y = roundf( offsety * DM_VERTEX_NORMFACTOR );
  if(x > -30000 && y > -30000 && x < 30000 && y < 30000)
  {
     dmImageBuffer *imagebuffer;
     if( dm->imagebuffercount >= dm->imagebuffersize )
       resizeImageBuffer(dm);

     imagebuffer = &dm->imagebuffer[ dm->imagebuffercount ];
     imagebuffer->image = image;
     imagebuffer->offsetx = (int16_t)roundf( offsetx * DM_VERTEX_NORMFACTOR );
     imagebuffer->offsety = (int16_t)roundf( offsety * DM_VERTEX_NORMFACTOR );
     imagebuffer->sizex = sizex;
     imagebuffer->sizey = sizey;
   #if DM_ENABLE_IMAGE_ROTATION
     imagebuffer->angsin = (int16_t)roundf( angsin * DM_IMAGE_ROTATION_NORMFACTOR );
     imagebuffer->angcos = (int16_t)roundf( angcos * DM_IMAGE_ROTATION_NORMFACTOR );
   #endif
     imagebuffer->color = color;
     imagebuffer->orderindex = image->ordermask | dm->orderbarriermask;

   #if DM_RENDER_IMAGE_DEBUG
   printf( "  Queue image at %d %d, order 0x%x\n", (int)imagebuffer->offsetx, (int)imagebuffer->offsety, (int)imagebuffer->orderindex );
   #endif

     dm->imagebuffercount++;
  }
}


void dmDrawImageFloatExtColor( dmContext *dm, dmImage *image, float offsetx, float offsety, float sizex, float sizey, float angsin, float angcos, uint32_t color, uint32_t extcolor )
{
  float x, y;

  if( ( image->flags & DM_IMAGE_FLAGS_EMPTY ) || ( sizex <= 0 ) || ( sizey <= 0 ) )
    return;

  x = roundf( offsetx * DM_VERTEX_NORMFACTOR );
  y = roundf( offsety * DM_VERTEX_NORMFACTOR );
  if(x > -30000 && y > -30000 && x < 30000 && y < 30000)
  {
     dmImageBuffer *imagebuffer;
     if( dm->imagebuffercount >= dm->imagebuffersize )
       resizeImageBuffer(dm);

     imagebuffer = &dm->imagebuffer[ dm->imagebuffercount ];
     imagebuffer->image = image;
     imagebuffer->offsetx = (int16_t)x;
     imagebuffer->offsety = (int16_t)y;
     imagebuffer->sizex = sizex;
     imagebuffer->sizey = sizey;
   #if DM_ENABLE_IMAGE_ROTATION
     imagebuffer->angsin = (int16_t)roundf( angsin * DM_IMAGE_ROTATION_NORMFACTOR );
     imagebuffer->angcos = (int16_t)roundf( angcos * DM_IMAGE_ROTATION_NORMFACTOR );
   #endif
     imagebuffer->color = color;
   #if DM_ENABLE_EXT_COLOR
     imagebuffer->extcolor = extcolor;
   #endif
     imagebuffer->orderindex = image->ordermask | dm->orderbarriermask;

   #if DM_RENDER_IMAGE_DEBUG
   printf( "  Queue image at %d %d, order 0x%x\n", (int)imagebuffer->offsetx, (int)imagebuffer->offsety, (int)imagebuffer->orderindex );
   #endif

     dm->imagebuffercount++;
  }
}


////




void dmFlushImages( dmContext *dm )
{
#if 0
  if( dm->flags & DM_FLAGS_PREHISTORIC_OPENGL )
    dmFlushDrawImagesArchaic( dm );
  else
#endif
    dmFlushDrawImages( dm );
#if 1
   // TODO: Add check for VBO available
  glBindBuffer( GL_ARRAY_BUFFER, 0 );
  if( !(dm->flags & DM_FLAGS_PREHISTORIC_OPENGL) )
     glUseProgram( dm->prevProgram );
#endif
  if( dm->flags & DM_FLAGS_PREHISTORIC_OPENGL )
  {
#if 0
   glPopAttrib();
   glPopClientAttrib();
#endif
  }


  return;
}


void dmDrawBarrier( dmContext *dm )
{
  dm->drawbarrierindex++;
  if( dm->drawbarrierindex >= ( 1 << DM_BARRIER_ORDER_BITS ) )
    dmFlushImages( dm );
  dm->orderbarriermask = dm->drawbarrierindex << DM_BARRIER_ORDER_SHIFT;
}
