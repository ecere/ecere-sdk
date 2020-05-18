/* -----------------------------------------------------------------------------
 *
 * Copyright (c) 2011-2015 Alexis Naveros.
 *
 * This code was written from scratch, but it was inspired by reading fontstash
 * https://github.com/memononen/fontstash/
 * Copyright (c) 2013 Mikko Mononen memon@inside.org
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * -----------------------------------------------------------------------------
 */


#ifndef FONTMANAGER_H
#define FONTMANAGER_H


#define FM_ALIGN_LEFT (0x0)
#define FM_ALIGN_CENTER (0x1)
#define FM_ALIGN_RIGHT (0x2)

#define FM_ALIGN_BASELINE (0x0)
#define FM_ALIGN_TOP (0x4)
#define FM_ALIGN_MIDDLE (0x8)
#define FM_ALIGN_BOTTOM (0x10)


typedef struct fmManager fmManager;

typedef struct fmFont fmFont;


typedef struct
{
  /* Return renderer's handle, always passed to other functions */
  void *(*init)( fmManager *fm, void *rendererdata, int channelcount );
  /* Called when fmDestroyManager() is called */
  void (*destroy)( void *rendererhandle );

  /* Create, resize or update texture data ; rect is [minx,maxx,miny,maxy] */
  int (*createtexture)( void *rendererhandle, int width, int height );
  int (*resizetexture)( void *rendererhandle, int width, int height );
  void (*updatetexture)( void *rendererhandle, int *rect, const unsigned char *data );

  /* If the renderer does any buffering of drawimage(), flush it all right now (texture may change immediately after) */
  void (*flush)( void *rendererhandle );

  /* If the renderer records per-image data, return an imageindex passed to drawimage() */
  int (*registerimage)( void *rendererhandle, int offsetx, int offsety, int width, int height );
  /* Draw an image, imageindex passed as the value previously returned by registerimage() */
  void (*drawimage)( void *rendererhandle, int targetx, int targety, int imageindex );
  /* Draw an image, called instead of drawimage() for text cursors, can point to exactly the same function */
  void (*drawimagecursor)( void *rendererhandle, int targetx, int targety, int imageindex );
  /* If drawimage is zero, then this alternate function is called, passing everything required to render the glyph */
  void (*drawimagealt)( void *rendererhandle, unsigned char *texdata, int targetx, int targety, int offsetx, int offsety, int width, int height );
  /* Draw a non-aligned image, imageindex passed as the value previously returned by registerimage() */
  void (*drawimagefloat)( void *rendererhandle, float targetx, float targety, float angsin, float angcos, int imageindex );
  /* If drawimagefloat is zero, then this alternate function is called, passing everything required to render the glyph */
  void (*drawimagefloatalt)( void *rendererhandle, unsigned char *texdata, float targetx, float targety, float angsin, float angcos, int offsetx, int offsety, int width, int height );

  /* The renderer must flush all recorded images, registerimage() will be called for new images */
  void (*resetimages)( void *rendererhandle );

  /* Escape codepoint encountered (<8), callback to process the escape, must return count of extra bytes to be skipped */
  int (*escapeprocess)( void *rendererhandle, const char *string );
  /* Escape codepoint encountered (<8), callback to skip the escape, must return count of extra bytes to be skipped */
  int (*escapeskip)( void *rendererhandle, const char *string );
} fmRenderer;


/* Any codepoint under 8 is passed to escapecallback() for special handling */
#define FM_CODEPOINT_ESCAPE_RANGE (8)


////


/* Create and destroy font manager */
fmManager *fmCreateManager( int width, int height, int channelcount, int channelindex, const fmRenderer *renderer, void *rendererdata );
void fmDestroyManager( fmManager *fm );

/* When notified of a full atlas, you should call fmExpandAtlas() or fmResetAtlas() within the callback */
void fmSetAtlasFullCallback( fmManager *fm, void (*callback)( fmManager *fm, void *userpointer ), void *userpointer );


/* Returns current atlas size */
void fmGetAtlasSize( fmManager *fm, int *retwidth, int *retheight );
/* Expands the atlas size */
int fmExpandAtlas( fmManager *fm, int width, int height );
/* Reset the whole fm */
int fmResetAtlas( fmManager *fm, int width, int height );


/* Add font from file */
fmFont *fmAddFont( fmManager *fm, const char *path, int glyphpaddingwidth );
/* Add font from data ; do not free( data ), the font manager will do that when removing the font */
fmFont *fmAddFontData( fmManager *fm, unsigned char *data, int datasize, int glyphpaddingwidth );
/* Free font */
void fmRemoveFont( fmManager *fm, fmFont *font );

/* Set optional glyph image processing callback */
void fmSetFontImageProcessing( fmManager *fm, fmFont *font, void (*processimage)( unsigned char *image, int width, int height, int bytesperpixel, int bytesperline, int extrapadding, int processindex, void *opaquecontext ), void *opaquecontext );


/* State setting */
void fmSetState( fmManager *fm, fmFont *font, int size, int align, int processindex, int paddingwidth );
void fmSetFont( fmManager *fm, fmFont *font );
void fmSetSize( fmManager *fm, int size );
void fmSetAlign( fmManager *fm, int align );
void fmSetProcessing( fmManager *fm, int processindex, int paddingwidth );
void fmClearState( fmManager *fm );


/* Draw text */
int fmDrawText( fmManager *fm, int x, int y, const char *string, int stringlength );
int fmDrawTextFloat( fmManager *fm, float fx, float y, const char *string, int stringlength );
int fmDrawTextWithCursor( fmManager *fm, int x, int y, const char *string, int stringlength, int cursoroffset );
int fmDrawTextTruncate( fmManager *fm, int x, int y, int truncatewidth, const char *string, int stringlength, char *extstring, int extwidth );


/* Flush buffered texture updates, renderer->updatetexture() */
void fmFlushUpdate( void *fm );

/* Flush buffered texture updates, draw rendered glyphs */
void fmFlushDraw( void *fm );


/* Measure text */
int fmGetTextWidth( fmManager *fm, const char *string, int stringlength );
int fmGetTextBounds( fmManager *fm, int x, int y, const char *string, int startoffset, int stringlength, int *bounds );


/* Return width of text, but does not cause a renderer flush() if the atlas is full and must be resized/cleared */
int fmGetTextWidthNoFlush( fmManager *fm, const char *string, int stringlength );


/* Find text offset up to truncatewidth */
int fmGetTextTruncateOffset( fmManager *fm, int truncatewidth, const char *string, int stringlength, int extwidth, int *retextflag, int *retfullwidth );


/* Find text offset nearest to the given width */
int fmGetTextNearestOffset( fmManager *fm, int targetwidth, const char *string, int stringlength );


/* Text metrics */
void fmGetFontExtent( fmManager *fm, int *retascent, int *retdescent );
float fmGetFontVerticalOffset( fmManager *fm );
void fmGetFontLimits( fmManager *fm, int *retlimitminy, int *retlimitmaxy );
int fmGetFontLineHeight( fmManager *fm );

void fmFont_getMetrics(fmFont * font, float * ascender, float * descender, float * middleAlign,
   float * lineHeight, float * minY, float * maxY);


/* Pull texture changes */
const unsigned char *fmGetTextureData( fmManager *fm, int *width, int *height );


/* Retrieve the dirty rectangle, telling fontmanager you will manually perform the update, returns 0 if no part of the texture requires an update */
int fmValidateTexture( fmManager *fm, int *retdirtyrect );


/* Get renderer's handle */
void *fmGetRendererHandle( fmManager *fm );


////


typedef struct
{
  int prevcodepoint;
  float middlealign;
} fmPathDraw;

/* Draw text on vector path, low-level interface */
int fmInitPathDraw( fmManager *fm, fmPathDraw *pathdraw );
float fmPathDrawCharacter( fmManager *fm, fmPathDraw *pathdraw, float x, float y, float vectorx, float vectory, int unicode );
float fmPathDrawPredictAdvance( fmManager *fm, fmPathDraw *pathdraw, int unicode );

/* Draw text on vector path, high-level interface */
int fmPathDrawText( fmManager *fontmanager, float *vertexlist, int vertexcount, char *text );


////


static inline uint32_t fmGetColor( uint32_t r, uint32_t g, uint32_t b, uint32_t a )
{
  return ( r ) | ( g << 8 ) | ( b << 16 ) | ( a << 24 );
}


#endif

