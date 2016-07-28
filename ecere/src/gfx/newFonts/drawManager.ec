import "OpenGLDisplayDriver"
import "textureManager"

#include "gl123es.h"

namespace gfx;

#define _Noreturn
#include <stdlib.h>
#include <math.h>
#include "cc.h"
#define OFFSET(s, m) ((uint)(uintptr) (&((s *) 0)->m))

// TODO: Indices (2/3 data)
// TODO: glMapBufferRange() with GL_MAP_INVALIDATE_BUFFER_BIT | GL_MAP_FLUSH_EXPLICIT_BIT
// TODO: movnti to write to VBO: _mm_stream_ps(), _mm_stream_si32(), _mm_stream_si64()
// TODO: When the state changes, it should keep filling up a same VBO, then when the VBO is full (or when we are done), perform all the Draw() calls on that same VBO
// TODO: VAO

static struct DMDrawVertex { short vx, vy, tx, ty; };

struct DMDrawBuffer
{
   GLAB vbo;
   int glType;
   int vertexCount;
   int vertexAlloc;
   void *vertexBuffer;
};

class DMImageFlags : uint16
{
   bool empty:1;     // Image is empty, do not draw
   bool blending:1;  // Must draw image with blending
   SwizzleMode swizzle:2;
}

#define DM_BARRIER_ORDER_BITS 5

class DMOrderMask : uint32
{
   int imageOrder:8;
   bool blend:1;
   int texture:10;
   int layer:4;
   int barrier:DM_BARRIER_ORDER_BITS;
};

struct DMImage
{
private:
   Texture texture;
   DMImageFlags flags;
   short programIndex;
   short srcx, srcy;
   short sizex, sizey;

   // Computed order for sorted rendering, in defineImage()
   DMOrderMask orderMask;

public:
   void clear()
   {
      this = { flags = { empty = true } };
   }
};

struct DMImageBuffer
{
   int image;
   short offsetx, offsety;
   short sizex, sizey;
   short angcos, angsin;
   ColorAlpha color;
   uint32 orderIndex;
};

define DRAW_BUFFER_COUNT = 64;  // TOFIX: Can't make static?
define DRAW_BUFFER_VERTEX_ALLOC = 1024;

define DM_LAYER_COUNT = 1<<DM_LAYER_ORDER_BITS;

// Range is from zero to DM_LAYER_COUNT
define DM_LAYER_BOTTOM = 0;
define DM_LAYER_BELOW = 3;
define DM_LAYER_NORMAL = 6;
define DM_LAYER_ABOVE = 9;
define DM_LAYER_TOP = 15;

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

#define DM_VERTEX_NORMFACTOR 4.0f

#define DM_TEXCOORD_NORMFACTOR 8192.0f

// FIXME: Radix sort, not hybrid sort!
static inline int dmSortImagesCmp( DMImageBuffer *draw0, DMImageBuffer *draw1 )
{
   uint32 ix1 = draw1->orderIndex, ix2 = draw0->orderIndex;
   if(ix1 < ix2) return 1;
   if(ix1 == ix2 && draw1->color < draw0->color) return 1;
   return 0;
}

#define HSORT_MAIN dmSortImages
#define HSORT_CMP dmSortImagesCmp
#define HSORT_TYPE DMImageBuffer
#include "cchybridsort.h"
#undef HSORT_MAIN
#undef HSORT_CMP
#undef HSORT_TYPE

// TOFIX: Make this private, have a property
public class DrawManager
{
   bool renderingFlipped;

   int imageCount, imageAlloc;
   DMImage *imageList;
   imageAlloc = 512;
   imageList = new DMImage[imageAlloc];

   void resetImages()
   {
      imageCount = 0;
   }

   void clearImages()
   {
      delete imageList;
      imageCount = 0;
      imageAlloc = 512;
      imageList = new DMImage[imageAlloc];
   }

   int imageBufferCount, imageBufferSize;
   DMImageBuffer *imageBuffers, *imageBuffersTmp;

   // Buffers for drawimages() batching
   DMDrawBuffer drawBuffers[DRAW_BUFFER_COUNT];
   int drawBufferIndex, drawBarrierIndex;
   DMOrderMask orderBarrierMask;

   // Counter to track program uniforms and such
   int64 updateCount;

   int defineImage( Texture texture, int offsetx, int offsety, int sizex, int sizey, bool blending, int layer )
   {
      int ordx = offsetx >> 6;
      int ordy = offsety >> 6;
      int imageIndex = imageCount++;
      if( imageCount > imageAlloc )
      {
         imageAlloc <<= 1;
         imageList = renew imageList DMImage[imageAlloc];
      }
      imageList[ imageIndex ] =
      {
         texture = texture;
         srcx = (short)offsetx;
         srcy = (short)offsety;
         sizex = (short)sizex;
         sizey = (short)sizey;
         flags = { blending = blending, swizzle = texture.swizzle };
         orderMask =
         {
            imageOrder = ccMortonNumber32( ordx, ordy ) & 0xFF,
            blend = blending, texture = texture.orderMask, layer = layer
         };
      };
      return imageIndex;
   }

   static void flushRenderDrawBuffer( DMDrawBuffer drawBuffer,  int vertexCount )
   {
      glBindBuffer( GL_ARRAY_BUFFER, drawBuffer.vbo.buffer );

      GLVertexPointer  (2, GL_SHORT, sizeof(DMDrawVertex), (void *)OFFSET(DMDrawVertex, vx) );
      GLTexCoordPointer(2, GL_SHORT, sizeof(DMDrawVertex), (void *)OFFSET(DMDrawVertex, tx) );

      GLFlushMatrices();
      glDrawArrays( GL_TRIANGLES, 0, vertexCount );
   }

   void flushImages()
   {
      drawBarrierIndex = 0;
      orderBarrierMask = 0;

      if(imageBufferCount)
      {
         bool stateBlend = true;
#if ENABLE_GL_SHADERS
         SwizzleMode swizzleMode = off;
#endif
         int vertexCount = 0;
         int index;
         DMImageBuffer *imageBuffer = imageBuffers;
         DMImage *bindImage = null;
         Texture bindTexture = null;
         DMDrawBuffer *drawBuffer;
         DMDrawVertex *vboVertex = null;
         ColorAlpha color = 0;
   #if !ENABLE_GL_MAPBUF
         DMDrawVertex *vboStorage = null;
   #endif

         ERRORCHECK();

         glabCurArrayBuffer = 0;

         glDisable(GL_DEPTH_TEST);
         glDisable(GL_CULL_FACE);
         GLSetupFog(false);
         GLSetupTexturing(true);
         GLSetupLighting(false);

         GLEnableClientState(VERTICES);
         GLEnableClientState(TEXCOORDS);
         glEnable(GL_BLEND);

         // Sort by image type and texture, minimize state changes
         dmSortImages( imageBuffers, imageBuffersTmp, imageBufferCount, (uint32)( (uintptr)imageBuffers >> 4 ) );

         // Fill a drawBuffer, write vertex and texcoords
         drawBuffer = &drawBuffers[drawBufferIndex++];
         drawBufferIndex %= DRAW_BUFFER_COUNT;
         glBindBuffer( GL_ARRAY_BUFFER, drawBuffer->vbo.buffer );
         glBindBuffer( GL_ELEMENT_ARRAY_BUFFER, 0 );

#if ENABLE_GL_MAPBUF
         vboVertex = glMapBuffer( GL_ARRAY_BUFFER, GL_WRITE_ONLY );
#else
         vboVertex = vboStorage = new DMDrawVertex[drawBuffer->vertexAlloc];
#endif

         for(index = 0; index < imageBufferCount; index++, imageBuffer++)
         {
            DMImage * image = &imageList[imageBuffer->image];
            Texture texture = image->texture;
            short tx0 = (short)( (int)image->srcx * texture.widthinv  * DM_TEXCOORD_NORMFACTOR);
            short ty0 = (short)( (int)image->srcy * texture.heightinv * DM_TEXCOORD_NORMFACTOR);
            short tx1 = (short)(( (int)image->srcx + image->sizex ) * texture.widthinv  * DM_TEXCOORD_NORMFACTOR);
            short ty1 = (short)(( (int)image->srcy + image->sizey ) * texture.heightinv * DM_TEXCOORD_NORMFACTOR);
            short angsin = imageBuffer->angsin, angcos = imageBuffer->angcos;
            short sizex = imageBuffer->sizex, sizey = imageBuffer->sizey;
            short vx0 = imageBuffer->offsetx;
            short vy0 = imageBuffer->offsety;
            short vx1 = (short)(vx0 + ((int)angcos * sizex * DM_VERTEX_NORMFACTOR / DM_IMAGE_ROTATION_NORMFACTOR));
            short vy1 = (short)(vy0 + ((int)angsin * sizex * DM_VERTEX_NORMFACTOR / DM_IMAGE_ROTATION_NORMFACTOR));
            short vx2 = (short)(vx0 - ((int)angsin * sizey * DM_VERTEX_NORMFACTOR / DM_IMAGE_ROTATION_NORMFACTOR));
            short vy2 = (short)(vy0 + ((int)angcos * sizey * DM_VERTEX_NORMFACTOR / DM_IMAGE_ROTATION_NORMFACTOR));
            short vx3 = (short)(vx0 + (((int)angcos * sizex - (int)angsin * sizey) * DM_VERTEX_NORMFACTOR / DM_IMAGE_ROTATION_NORMFACTOR));
            short vy3 = (short)(vy0 + (((int)angsin * sizex + (int)angcos * sizey) * DM_VERTEX_NORMFACTOR / DM_IMAGE_ROTATION_NORMFACTOR));
            bool flushFlag =
               (imageBuffer->color != color) ||
               (image != bindImage && (stateBlend != image->flags.blending || texture != bindTexture
#if ENABLE_GL_SHADERS
               || (glCaps_shaders && swizzleMode != image->flags.swizzle)
#endif
               )) ||
               (vertexCount >= drawBuffer->vertexAlloc - 6);

            if(flushFlag)
            {
               if(vertexCount)
               {
#if ENABLE_GL_MAPBUF
                  glUnmapBuffer( GL_ARRAY_BUFFER );
#else
                  glBufferSubData( GL_ARRAY_BUFFER, 0, vertexCount * sizeof(DMDrawVertex), vboStorage );
#endif
                  // Flush font manager texture updates
                  flush();

                  // Render buffered images
                  if(color)
                     flushRenderDrawBuffer( drawBuffer, vertexCount );
                  drawBuffer = &drawBuffers[drawBufferIndex++];
                  drawBufferIndex %= DRAW_BUFFER_COUNT;
                  glBindBuffer( GL_ARRAY_BUFFER, drawBuffer->vbo.buffer );
#if ENABLE_GL_MAPBUF
                  vboVertex = glMapBuffer( GL_ARRAY_BUFFER, GL_WRITE_ONLY );
#else
                  vboVertex = vboStorage;
#endif
                  vertexCount = 0;
               }

               if(color != imageBuffer->color)
               {
                  color = imageBuffer->color;
                  GLColor4ub(color.color.r, color.color.g, color.color.b, color.a);
               }
               if( stateBlend != image->flags.blending)
               {
                  stateBlend = image->flags.blending;
                  ( stateBlend ? glEnable : glDisable )( GL_BLEND );
               }
#if ENABLE_GL_SHADERS
               if( swizzleMode != image->flags.swizzle)
               {
                  swizzleMode = image->flags.swizzle;
                  if(glCaps_shaders)
                     defaultShader.swizzle( swizzleMode );
               }
#endif
               if( texture != bindTexture )
               {
                  bindTexture = texture;
                  glBindTexture( GL_TEXTURE_2D, bindTexture.glTex );
               }
               bindImage = image;
            }

            // Write data to VBO
            // TODO: write vertex/texcoord all at once with SSE
            vboVertex[0] = { vx3, vy3, tx1, ty1 };
            vboVertex[1] = { vx1, vy1, tx1, ty0 };
            vboVertex[2] = { vx2, vy2, tx0, ty1 };
            vboVertex[3] = { vx0, vy0, tx0, ty0 };
            vboVertex[4] = { vx2, vy2, tx0, ty1 };
            vboVertex[5] = { vx1, vy1, tx1, ty0 };
            vboVertex += 6;
            vertexCount += 6;

            glBindBuffer( GL_ARRAY_BUFFER, drawBuffer->vbo.buffer );
         }

#if ENABLE_GL_MAPBUF
         glUnmapBuffer( GL_ARRAY_BUFFER );
#else
         glBufferSubData( GL_ARRAY_BUFFER, 0, vertexCount * sizeof(DMDrawVertex), vboStorage );
         delete vboStorage;
#endif

         // Flush font manager texture updates
         flush();

         // Render buffered images
         if(color)
            flushRenderDrawBuffer( drawBuffer, vertexCount );
         imageBufferCount = 0;

         ERRORCHECK();

         GLDisableClientState(TEXCOORDS);
         GLSetupTexturing(false);
#if ENABLE_GL_SHADERS
         if(glCaps_shaders)
            defaultShader.swizzle(off);
#endif

         if(glCaps_vertexBuffer)
         {
            glBindBuffer( GL_ARRAY_BUFFER, 0 );
            glabCurArrayBuffer = 0;
         }
      }
   }

public:

   property bool renderingFlipped { set { renderingFlipped = value; } }

   virtual void flush();

   bool init()
   {
      int drawBufferIndex;
      uint vertexSize = sizeof(DMDrawVertex);

      imageBufferCount = 0;
      imageBufferSize = 4096;
      imageBuffers = new DMImageBuffer[imageBufferSize];
      imageBuffersTmp = new DMImageBuffer[imageBufferSize];

      for( drawBufferIndex = 0 ; drawBufferIndex < DRAW_BUFFER_COUNT ; drawBufferIndex++ )
      {
         DMDrawBuffer *drawBuffer = &drawBuffers[drawBufferIndex];
         drawBuffer->glType = GL_FLOAT;
         drawBuffer->vertexCount = 0;
         drawBuffer->vertexAlloc = DRAW_BUFFER_VERTEX_ALLOC;
         if(glCaps_vertexBuffer)
         {
            glGenBuffers( 1, &drawBuffer->vbo.buffer );
            glBindBuffer( GL_ARRAY_BUFFER, drawBuffer->vbo.buffer );
            glBufferData( GL_ARRAY_BUFFER, drawBuffer->vertexAlloc * vertexSize, 0, GL_DYNAMIC_DRAW );
         }
         drawBuffer->vertexBuffer = new byte[drawBuffer->vertexAlloc * vertexSize];
      }

      updateCount = 0;

      if(glCaps_vertexBuffer)
      {
         glBindBuffer( GL_ARRAY_BUFFER, 0 );
         glabCurArrayBuffer = 0;
      }
      return true;
   }

   ~DrawManager()
   {
      end();
   }

   void end()
   {
      int i;

      for( i = 0 ; i < DRAW_BUFFER_COUNT ; i++ )
      {
         DMDrawBuffer *db = &drawBuffers[i];
         if(db->vbo.buffer)
            glDeleteBuffers( 1, &db->vbo.buffer );
         delete db->vertexBuffer;
      }
      delete imageBuffers;
      delete imageBuffersTmp;
      delete imageList;
   }

   void ready( int viewportWidth, int viewportHeight )
   {
      float norminv = 1.0f / DM_VERTEX_NORMFACTOR;
      float texinv = 1.0f / DM_TEXCOORD_NORMFACTOR;

      GLMatrixMode(MatrixMode::texture);
      GLScalef(texinv,texinv,1);

      GLMatrixMode(MatrixMode::projection);
      GLLoadIdentity();
      if(renderingFlipped)
         GLOrtho( 0.0, (float)viewportWidth, 0.0, (float)viewportHeight, -1.0f, 1.0 );
      else
         GLOrtho( 0.0, (float)viewportWidth, (float)viewportHeight, 0.0, -1.0f, 1.0 );
      GLScalef(norminv, norminv, norminv);

      GLMatrixMode(MatrixMode::modelView);
      GLLoadIdentity();
      GLScalef(1,1,1);

      drawBarrierIndex = 0;
      orderBarrierMask = 0;

      updateCount++;
   }

   void drawImage( int index, float offsetx, float offsety, float angsin, float angcos, ColorAlpha color )
   {
      DMImage * image = &imageList[index];
      float sizex = image->sizex, sizey = image->sizey;
      if(!image->flags.empty && sizex > 0 && sizey > 0)
      {
         if( imageBufferCount >= imageBufferSize )
         {
            imageBufferSize <<= 1;
            imageBuffers = renew imageBuffers DMImageBuffer[imageBufferSize];
            imageBuffersTmp = renew imageBuffersTmp DMImageBuffer[imageBufferSize];
         }
         imageBuffers[ imageBufferCount++ ] =
         {
            image = index;
            offsetx = (short)roundf( offsetx * DM_VERTEX_NORMFACTOR );
            offsety = (short)roundf( offsety * DM_VERTEX_NORMFACTOR );
            sizex = (short)sizex;
            sizey = (short)sizey;
            angsin = (short)roundf( angsin * DM_IMAGE_ROTATION_NORMFACTOR );
            angcos = (short)roundf( angcos * DM_IMAGE_ROTATION_NORMFACTOR );
            color = color;
            orderIndex = image->orderMask | orderBarrierMask;
         };
      }
   }

   void finish()
   {
      flushImages();
   }

   void drawBarrier( )
   {
      drawBarrierIndex++;
      if(drawBarrierIndex >= ( 1 << DM_BARRIER_ORDER_BITS ))
         flushImages( );
      orderBarrierMask = { barrier = (1 << DM_BARRIER_ORDER_BITS)-1 };
   }

   void clear()
   {
      imageBufferCount = 0;
   }
}
