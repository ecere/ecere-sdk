/* -----------------------------------------------------------------------------
 * Copyright (c) 2013-2017 Alexis Naveros.
 * Ecere Corporation has unlimited/unrestricted rights.
 * -----------------------------------------------------------------------------
 */
#include "texturemanager.h"

#define DM_ENABLE_IMAGE_ROTATION (1)
#define DM_ENABLE_EXT_COLOR (1)


////


typedef struct
{
  float vertex[2];
  float texcoord0[2];
  uint32_t color;
#if DM_ENABLE_EXT_COLOR
  uint32_t extcolor;
#endif
} dmDrawVertexFlat __attribute__((aligned(16))) /*MM_ALIGN16*/;

typedef struct
{
  int16_t vertex[2];
  int16_t texcoord0[2];
  uint32_t color;
#if DM_ENABLE_EXT_COLOR
  uint32_t extcolor;
#endif
} dmDrawVertex __attribute__((aligned(16))) /*MM_ALIGN16*/;

typedef struct
{
  GLuint vbo;
  int gltype;
  int vertexcount;
  int vertexalloc;
  void *vertexbuffer;
} dmDrawBuffer;

typedef struct
{
  GLuint glprogram;
  GLuint vertexshader;
  GLuint fragmentshader;
  GLint matrixloc;
  GLint vertexloc;
  GLint texcoord0loc;
  GLint texcoord1loc;
  GLint colorloc;
  GLint extcolorloc;
  GLint texbaseloc;
  int flags;
  int64_t lastupdatecount;
} dmProgram;

#define DM_PROGRAM_FLAGS_VALID (0x1)


typedef struct
{
  tmTexture *texture;
  int16_t flags;
  int16_t programindex;
  int16_t srcx, srcy;
  int16_t sizex, sizey;
  /* Computed order for sorted rendering, in dmDefineImage() */
  uint32_t ordermask;
} dmImage;

/* Image is empty, do not draw */
#define DM_IMAGE_FLAGS_EMPTY (0x1)
/* Must draw image with blending */
#define DM_IMAGE_FLAGS_BLENDING (0x2)


typedef struct
{
  dmImage *image;
  int16_t offsetx;
  int16_t offsety;
  int16_t sizex;
  int16_t sizey;
#if DM_ENABLE_IMAGE_ROTATION
  int16_t angcos;
  int16_t angsin;
#endif
  uint32_t color;
#if DM_ENABLE_EXT_COLOR
  uint32_t extcolor;
#endif
  uint32_t orderindex;
} dmImageBuffer;


////


#define DM_IMAGE_ORDER_BITS (8)
#define DM_BLEND_ORDER_BITS (1)
#define DM_PROGRAM_ORDER_BITS (4)
#define DM_TEXTURE_ORDER_BITS (10)
#define DM_LAYER_ORDER_BITS (4)
#define DM_BARRIER_ORDER_BITS (5)

#define DM_IMAGE_ORDER_SHIFT (0)
#define DM_BLEND_ORDER_SHIFT (DM_IMAGE_ORDER_BITS)
#define DM_PROGRAM_ORDER_SHIFT (DM_IMAGE_ORDER_BITS+DM_BLEND_ORDER_BITS)
#define DM_TEXTURE_ORDER_SHIFT (DM_IMAGE_ORDER_BITS+DM_BLEND_ORDER_BITS+DM_PROGRAM_ORDER_BITS)
#define DM_LAYER_ORDER_SHIFT (DM_IMAGE_ORDER_BITS+DM_BLEND_ORDER_BITS+DM_PROGRAM_ORDER_BITS+DM_TEXTURE_ORDER_BITS)
#define DM_BARRIER_ORDER_SHIFT (DM_IMAGE_ORDER_BITS+DM_BLEND_ORDER_BITS+DM_PROGRAM_ORDER_BITS+DM_TEXTURE_ORDER_BITS+DM_LAYER_ORDER_BITS)

#define DM_LAYER_COUNT (1<<DM_LAYER_ORDER_BITS)
#define DM_PROGRAM_COUNT (1<<DM_PROGRAM_ORDER_BITS)

#define DM_CONTEXT_DRAW_BUFFER_COUNT (64)
#define DM_CONTEXT_DRAW_BUFFER_VERTEX_ALLOC (1024)


/* Range is from zero to DM_LAYER_COUNT */
enum
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

#define DM_LAYER_BOTTOM (DM_LAYER_0_BOTTOM)
#define DM_LAYER_BELOW (DM_LAYER_3_BELOW)
#define DM_LAYER_NORMAL (DM_LAYER_6_NORMAL)
#define DM_LAYER_ABOVE (DM_LAYER_9_ABOVE)
#define DM_LAYER_TOP (DM_LAYER_15_TOP)


#define DM_PROGRAM_NORMAL (0)
#define DM_PROGRAM_ALPHABLEND (1)
#define DM_PROGRAM_ALPHABLEND_INTENSITY (2)
#define DM_PROGRAM_ALPHABLEND_INTENSITY_EXTCOLOR (3)
#define DM_PROGRAM_BICHROME (4)


typedef struct
{
  int flags;
  dmProgram shaderprograms[DM_PROGRAM_COUNT];

  /* Matrix */
  float matrix[16];

  int imagebuffercount;
  int imagebuffersize;
  dmImageBuffer *imagebuffer;
  dmImageBuffer *imagebuffertmp;

  /* Buffers for drawimages() batching */
  dmDrawBuffer drawbuffer[DM_CONTEXT_DRAW_BUFFER_COUNT];
  int drawbufferindex;
  int drawbarrierindex;
  uint32_t orderbarriermask;

  /* Font manager */
  void (*flushcallback)( void *flushcontext );
  void *flushcallbackcontext;

  /* Counter to track program uniforms and such */
  int64_t updatecount;

  GLuint prevProgram;
} dmContext;


////


int dmInit( dmContext *dm, int flags );
void dmSetFlushCallback( dmContext *dm, void (*flush)( void *flushcontext ), void *flushcontext );
void dmEnd( dmContext *dm );

void dmReady( dmContext *dm, int viewportwidth, int viewportheight, int verticalFlip );

void dmClearImage( dmImage *image );
void dmDefineImage( dmImage *image, tmTexture *texture, int offsetx, int offsety, int sizex, int sizey, int blendflag, int programindex, int layerindex );

void dmDrawImage( dmContext *dm, dmImage *image, int offsetx, int offsety, int sizex, int sizey, uint32_t color );
void dmDrawImageExtColor( dmContext *dm, dmImage *image, int offsetx, int offsety, int sizex, int sizey, uint32_t color, uint32_t extcolor );
void dmDrawImageFloat( dmContext *dm, dmImage *image, float offsetx, float offsety, float sizex, float sizey, float angsin, float angcos, uint32_t color );
void dmDrawImageFloatExtColor( dmContext *dm, dmImage *image, float offsetx, float offsety, float sizex, float sizey, float angsin, float angcos, uint32_t color, uint32_t extcolor );

void dmFlushImages( dmContext *dm );


#define DM_FLAGS_PREHISTORIC_OPENGL (0x1)

