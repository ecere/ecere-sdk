/* -----------------------------------------------------------------------------
 *
 * Copyright (c) 2011-2015 Alexis Naveros.
 *
 * This code was written from scratch, but it was inspired by reading fontstash
 * https://github.com/memononen/fontstash/
 * Copyright (c) 2013 Mikko Mononen memon@inside.org
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 *
 * -----------------------------------------------------------------------------
 */

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

#include "cpuconfig.h"
#include "cc.h"
#include "ccstr.h"
#include "mm.h"
#include "mmhash.h"

#include "fontmanager.h"

#include "atlasbuilder.h"


////


#include <ft2build.h>

#include FT_FREETYPE_H
#include FT_ADVANCES_H


////


#define FM_ENABLE_HINTING (1)

#define FM_SUBPIXEL_ROUNDING_RANGE (16)

#define FM_INIT_ATLAS_NODES (512)

#define FM_GLYPH_HASH_BITS (10)

#define FM_KERNCACHE_HASH_BITS (12)
#define FM_KERNCACHE_HASH_BITS_MAX (16)


////


#define FM_DEF_CODEPOINT_BITS (24)
#define FM_DEF_SUBPIXEL_BITS (6)
#define FM_DEF_SIZE_BITS (12)
#define FM_DEF_PROCESSINDEX_BITS (12)
#define FM_DEF_EXTRAPADDING_BITS (10)

#define FM_DEF_CODEPOINT_SHIFT (0)
#define FM_DEF_SUBPIXEL_SHIFT (FM_DEF_CODEPOINT_BITS)
#define FM_DEF_SIZE_SHIFT (FM_DEF_SIZE_BITS|FM_DEF_CODEPOINT_BITS)
#define FM_DEF_PROCESSINDEX_SHIFT (FM_DEF_CODEPOINT_BITS+FM_DEF_SIZE_BITS+FM_DEF_SUBPIXEL_BITS)
#define FM_DEF_EXTRAPADDING_SHIFT (FM_DEF_CODEPOINT_BITS+FM_DEF_SIZE_BITS+FM_DEF_SUBPIXEL_BITS+FM_DEF_PROCESSINDEX_BITS)

#define FM_GLYPH_COMPUTE_KEY(codepoint,subpixel,size,processindex,extrapadding) ( (((uint64_t)(codepoint))<<FM_DEF_CODEPOINT_SHIFT) | (((uint64_t)(subpixel))<<FM_DEF_SUBPIXEL_SHIFT) | (((uint64_t)(size))<<FM_DEF_SIZE_SHIFT) | (((uint64_t)(processindex))<<FM_DEF_PROCESSINDEX_SHIFT) | (((uint64_t)(extrapadding))<<FM_DEF_EXTRAPADDING_SHIFT) )

#define FM_GET_DEF_CODEPOINT(x) (((x)>>FM_DEF_CODEPOINT_SHIFT)&(((uint64_t)1<<FM_DEF_CODEPOINT_BITS)-1))

#define FM_SIZE_MAX ((1<<FM_DEF_SIZE_BITS)-1)
#define FM_PROCESSINDEX_MAX ((1<<FM_DEF_PROCESSINDEX_BITS)-1)
#define FM_EXTRAPADDING_MAX ((1<<FM_DEF_EXTRAPADDING_BITS)-1)

#define FM_GLYPH_CODEPOINT_CURSOR (0x1)
#define FM_GLYPH_CODEPOINT_REPLACEMENT (0xfffd)

#define FM_MIN(x,y) ((x)>(y)?(y):(x))
#define FM_MAX(x,y) ((x)<(y)?(y):(x))


////


typedef struct
{
  uint64_t glyphkey;
  int16_t x0, y0, x1, y1;
  int16_t advance, offsetx, offsety;
  int imageindex;
} fmGlyph;

struct fmFont
{
  FT_Face ftface;
  float units_per_EM;
  /* units_per_EM / 65536.0f */
  float normalized_units_per_EM;
  /* Does the font have kerning information? */
  int kerningflag;
  /* Kerning hash table */
  void *kernhashtable;

  /* Font metrics */
  void *fontdata;
  float ascender;
  float descender;
  float middlealign;
  float lineheight;
  float limitminy, limitmaxy;

  /* Glyph hash table */
  void *glyphhashtable;

  /* Thickness of padding all around glyphs */
  int glyphpaddingwidth;
  /* Custom callback for image post-processing */
  void (*processimage)( unsigned char *image, int width, int height, int bytesperpixel, int bytesperline, int extrapadding, int processindex, void *opaquecontext );
  void *processimagecontext;

  /* Node for manager's linked list of fonts */
  mmListNode list;
};

void fmFont_getMetrics(fmFont * font, float * ascender, float * descender, float * middleAlign,
   float * lineHeight, float * minY, float * maxY)
{
   if(font)
   {
      if(ascender) *ascender = font->ascender;
      if(descender) *descender = font->descender;
      if(middleAlign) *middleAlign = font->middlealign;
      if(lineHeight) *lineHeight = font->lineheight;
      if(minY) *minY = font->limitminy;
      if(maxY) *maxY = font->limitmaxy;
   }
}


typedef struct
{
  fmFont *font;
  uint16_t size;
  uint16_t align;
  uint16_t processindex;
  uint16_t extrapadding;
  float kerningfactor;
} fmState;

struct fmManager
{
  FT_Library ft;
  fmRenderer renderer;
  int width, height;
  int bytesperpixel;
  int bytesperline;
  int channelindex;
  float widthinv, heightinv;

  abAtlas *atlas;
  unsigned char *texdata;
  int dirtyrect[4];

  fmState state;
  void (*atlasfullcallback)( fmManager *fm, void *userpointer );
  void *atlasfulluserpointer;
  void (*copyglyphbitmap)( unsigned char *dst, unsigned char *src, int glyphwidth, int glyphheight, int dststride );
  void *fontlist;

  void *rendererhandle;
};


////


static inline CC_ALWAYSINLINE void fmGlyphHashClearEntry( void *entry )
{
  ((fmGlyph *)entry)->glyphkey = 0;
  return;
}

static inline CC_ALWAYSINLINE int fmGlyphHashEntryValid( const void *entry )
{
  return ( ((fmGlyph *)entry)->glyphkey != 0 );
}

static inline CC_ALWAYSINLINE uint32_t fmGlyphHashEntryKey( const void *entry )
{
  return ccHash32Int64Inline( ((fmGlyph *)entry)->glyphkey );
}

static inline CC_ALWAYSINLINE int fmGlyphHashEntryCmp( const void *entry, const void *entryref )
{
  uint64_t glyphkey;
  glyphkey = ((fmGlyph *)entry)->glyphkey;
  if( glyphkey == 0 )
    return MM_HASH_ENTRYCMP_INVALID;
  if( glyphkey == ((fmGlyph *)entryref)->glyphkey )
    return MM_HASH_ENTRYCMP_FOUND;
  return MM_HASH_ENTRYCMP_SKIP;
}

static const mmHashAccess fmGlyphHashAccess =
{
  .clearentry = fmGlyphHashClearEntry,
  .entryvalid = fmGlyphHashEntryValid,
  .entrykey = fmGlyphHashEntryKey,
  .entrycmp = fmGlyphHashEntryCmp
};

#define HASH_CLEARENTRY fmGlyphHashClearEntry
#define HASH_ENTRYVALID fmGlyphHashEntryValid
#define HASH_ENTRYKEY fmGlyphHashEntryKey
#define HASH_ENTRYCMP fmGlyphHashEntryCmp
#define HASH_SIZEOFENTRY sizeof(fmGlyph)

#define HASH_DECLARE_DIRECTFINDENTRY fmGlyphHashFind
#define HASH_DECLARE_DIRECTADDRETENTRY fmGlyphHashAdd

#include "mmhashinline.h"

#undef HASH_CLEARENTRY
#undef HASH_ENTRYVALID
#undef HASH_ENTRYKEY
#undef HASH_ENTRYCMP
#undef HASH_SIZEOFENTRY

#undef HASH_DECLARE_DIRECTFINDENTRY
#undef HASH_DECLARE_DIRECTADDRETENTRY


////


typedef struct
{
  int64_t value;
} fmKernCacheEntry;

#define FM_KERNCACHE_PREVCODE_BITS (21)
#define FM_KERNCACHE_NEXTCODE_BITS (21)
#define FM_KERNCACHE_OFFSET (22)

#define FM_KERNCACHE_PREVCODE_SHIFT (0)
#define FM_KERNCACHE_NEXTCODE_SHIFT (FM_KERNCACHE_PREVCODE_BITS)
#define FM_KERNCACHE_OFFSET_SHIFT (FM_KERNCACHE_PREVCODE_BITS+FM_KERNCACHE_NEXTCODE_BITS)

#define FM_KERNCACHE_CODE_MASK (((int64_t)1<<(FM_KERNCACHE_PREVCODE_BITS+FM_KERNCACHE_NEXTCODE_BITS))-1)

static inline CC_ALWAYSINLINE void fmKernCacheClearEntry( void *entry )
{
  ((fmKernCacheEntry *)entry)->value = 0;
  return;
}

static inline CC_ALWAYSINLINE int fmKernCacheEntryValid( const void *entry )
{
  return ( ((fmKernCacheEntry *)entry)->value != 0 );
}

static inline CC_ALWAYSINLINE uint32_t fmKernCacheEntryKey( const void *entry )
{
  int64_t value;
  value = ((fmKernCacheEntry *)entry)->value & FM_KERNCACHE_CODE_MASK;
  return ccHash32Int64Inline( value );
}

static inline CC_ALWAYSINLINE int fmKernCacheEntryCmp( const void *entry, const void *entryref )
{
  int64_t value;
  value = ((fmKernCacheEntry *)entry)->value & FM_KERNCACHE_CODE_MASK;
  if( value == 0 )
    return MM_HASH_ENTRYCMP_INVALID;
  if( value == ((fmKernCacheEntry *)entryref)->value )
    return MM_HASH_ENTRYCMP_FOUND;
  return MM_HASH_ENTRYCMP_SKIP;
}

static const mmHashAccess fmKernCacheHashAccess =
{
  .clearentry = fmKernCacheClearEntry,
  .entryvalid = fmKernCacheEntryValid,
  .entrykey = fmKernCacheEntryKey,
  .entrycmp = fmKernCacheEntryCmp
};

#define HASH_CLEARENTRY fmKernCacheClearEntry
#define HASH_ENTRYVALID fmKernCacheEntryValid
#define HASH_ENTRYKEY fmKernCacheEntryKey
#define HASH_ENTRYCMP fmKernCacheEntryCmp
#define HASH_SIZEOFENTRY sizeof(fmKernCacheEntry)

#define HASH_DECLARE_DIRECTREADENTRY fmKernCacheRead
#define HASH_DECLARE_DIRECTADDENTRY fmKernCacheAdd

#include "mmhashinline.h"

#undef HASH_CLEARENTRY
#undef HASH_ENTRYVALID
#undef HASH_ENTRYKEY
#undef HASH_ENTRYCMP
#undef HASH_SIZEOFENTRY

#undef HASH_DECLARE_DIRECTREADENTRY
#undef HASH_DECLARE_DIRECTADDENTRY


////


static int fmtt_buildGlyphBitmap( fmFont *font, int glyph, int size, int subpixel, int *advance, int *x0, int *y0, int *x1, int *y1 )
{
  FT_Error ftError;
  FT_GlyphSlot glyphslot;
  FT_Vector subvector;

  ftError = FT_Set_Pixel_Sizes( font->ftface, 0, (FT_UInt)size );
  if( ftError )
    return 0;

  subvector.x = subpixel;
  subvector.y = 0;
  FT_Set_Transform( font->ftface, 0, &subvector );

#if FM_ENABLE_HINTING
  ftError = FT_Load_Glyph( font->ftface, glyph, FT_LOAD_RENDER );
#else
  ftError = FT_Load_Glyph( font->ftface, glyph, FT_LOAD_RENDER | FT_LOAD_NO_HINTING );
#endif
  if( ftError )
    return 0;

  glyphslot = (font->ftface)->glyph;
  *advance = glyphslot->metrics.horiAdvance;
  *x0 = glyphslot->bitmap_left;
  *x1 = glyphslot->bitmap_left + glyphslot->bitmap.width;
  *y0 = -glyphslot->bitmap_top;
  *y1 = -glyphslot->bitmap_top + glyphslot->bitmap.rows;

  return 1;
}

static inline unsigned char *fmtt_getGlyphBitmap( fmFont *font, int glyphindex )
{
  FT_GlyphSlot glyphslot;
  glyphslot = (font->ftface)->glyph;
  return glyphslot->bitmap.buffer;
}

static int fmtt_getGlyphKernAdvance( fmFont *font, uint32_t prevglyph, uint32_t nextglyph, int size, float kerningfactor )
{
  int kerning, hashbits;
  size_t hashsize;
  void *newhashtable;
  FT_Vector kerningvector;
  fmKernCacheEntry kerncache;

  kerncache.value = ( (uint64_t)prevglyph << FM_KERNCACHE_PREVCODE_SHIFT ) | ( (uint64_t)nextglyph << FM_KERNCACHE_NEXTCODE_SHIFT );
  if( fmKernCacheRead( font->kernhashtable, &kerncache ) )
    kerning = kerncache.value >> FM_KERNCACHE_OFFSET_SHIFT;
  else
  {
    FT_Get_Kerning( font->ftface, prevglyph, nextglyph, FT_KERNING_UNSCALED, &kerningvector );
    kerning = kerningvector.x;
    kerncache.value |= ( (int64_t)kerning << FM_KERNCACHE_OFFSET_SHIFT );
#if 0
    printf( "Kerning between '%c' and '%c' ; %lld ; Raw %d ; Store %d\n", prevglyph, nextglyph, (long long)kerncache.value, (int)kerningvector.x, kerncache.value >> FM_KERNCACHE_OFFSET_SHIFT );
    FT_Set_Pixel_Sizes( font->ftface, 0, (FT_UInt)size );
    FT_Get_Kerning( font->ftface, prevglyph, nextglyph, FT_KERNING_DEFAULT, &kerningvector );
    printf( "  KERNING CHECK ; Real %d ; Check %d\n", (int)kerningvector.x, ( (int)( (float)kerning * kerningfactor ) + 32 ) >> 6 );
#endif
    fmKernCacheAdd( font->kernhashtable, &kerncache, 0 );
    if( mmHashGetStatus( font->kernhashtable, &hashbits ) == MM_HASH_STATUS_MUSTGROW )
    {
      if( hashbits >= FM_KERNCACHE_HASH_BITS_MAX )
        mmHashReset( font->kernhashtable, &fmKernCacheHashAccess );
      else
      {
        hashbits++;
        hashsize = mmHashRequiredSize( sizeof(fmKernCacheEntry), hashbits, 8 );
        newhashtable = malloc( hashsize );
        mmHashResize( newhashtable, font->kernhashtable, &fmKernCacheHashAccess, hashbits, 8 );
        free( font->kernhashtable );
        font->kernhashtable = newhashtable;
      }
    }
  }
  kerning = ( (int)( (float)kerning * kerningfactor ) + 32 ) >> 6;
  return kerning;
}


////


static void fmCopyGlyphBitmap1( unsigned char *dst, unsigned char *src, int glyphwidth, int glyphheight, int dststride )
{
  int x, y;
  unsigned char *dstrow;
  for( y = 0 ; y < glyphheight ; y++ )
  {
    dstrow = &dst[ y * dststride ];
    for( x = 0 ; x < glyphwidth ; x++ )
      dstrow[ x ] = src[ x ];
    src += glyphwidth;
  }
  return;
}

static void fmCopyGlyphBitmap2( unsigned char *dst, unsigned char *src, int glyphwidth, int glyphheight, int dststride )
{
  int x, y;
  unsigned char *dstrow;
  for( y = 0 ; y < glyphheight ; y++ )
  {
    dstrow = &dst[ y * dststride ];
    for( x = 0 ; x < glyphwidth ; x++ )
      dstrow[ x << 1 ] = src[ x ];
    src += glyphwidth;
  }
  return;
}

static void fmCopyGlyphBitmap3( unsigned char *dst, unsigned char *src, int glyphwidth, int glyphheight, int dststride )
{
  int x, y;
  unsigned char *dstrow;
  for( y = 0 ; y < glyphheight ; y++ )
  {
    dstrow = &dst[ y * dststride ];
    for( x = 0 ; x < glyphwidth ; x++ )
      dstrow[ ( x << 1 ) + x ] = src[ x ];
    src += glyphwidth;
  }
  return;
}

static void fmCopyGlyphBitmap4( unsigned char *dst, unsigned char *src, int glyphwidth, int glyphheight, int dststride )
{
  int x, y;
  unsigned char *dstrow;
  for( y = 0 ; y < glyphheight ; y++ )
  {
    dstrow = &dst[ y * dststride ];
    for( x = 0 ; x < glyphwidth ; x++ )
      dstrow[ x << 2 ] = src[ x ];
    src += glyphwidth;
  }
  return;
}


////


fmManager *fmCreateManager( int width, int height, int channelcount, int channelindex, const fmRenderer *renderer, void *rendererdata )
{
  fmManager *fm;

  if( ( channelcount != 1 ) && ( channelcount != 2 ) && ( channelcount != 4 ) )
    return 0;
  if( ( width <= 0 ) || ( height <= 0 ) )
    return 0;

  /* Allocate memory for the font fm */
  fm = (fmManager*)malloc( sizeof(fmManager) );
  if( !( fm ) )
    goto error;
  memset( fm, 0, sizeof(fmManager) );
  fm->fontlist = 0;

  fm->renderer = *renderer;
  fm->rendererhandle = fm->renderer.init( fm, rendererdata, channelcount );

  /* Initialize implementation library */
  if( FT_Init_FreeType( &fm->ft ) )
    goto error;

  fm->width = width;
  fm->height = height;
  fm->bytesperpixel = channelcount;
  fm->bytesperline = fm->width * fm->bytesperpixel;
  fm->channelindex = channelindex;
  if( fm->renderer.createtexture )
  {
    if( fm->renderer.createtexture( fm->rendererhandle, fm->width, fm->height ) == 0 )
      goto error;
  }

  fm->atlas = abCreateAtlas( fm->width, fm->height, FM_INIT_ATLAS_NODES );
  if( !( fm->atlas ) )
    goto error;

  /* Create texture for the cache */
  fm->widthinv = 1.0f / fm->width;
  fm->heightinv = 1.0f / fm->height;
  fm->texdata = (unsigned char *)malloc( fm->height * fm->bytesperline );
  if( !( fm->texdata ) )
    goto error;
  memset( fm->texdata, 0, fm->height * fm->bytesperline );

  fm->dirtyrect[0] = fm->width;
  fm->dirtyrect[1] = fm->height;
  fm->dirtyrect[2] = 0;
  fm->dirtyrect[3] = 0;

  if( fm->bytesperpixel == 1 )
    fm->copyglyphbitmap = fmCopyGlyphBitmap1;
  else if( fm->bytesperpixel == 2 )
    fm->copyglyphbitmap = fmCopyGlyphBitmap2;
  else if( fm->bytesperpixel == 3 )
    fm->copyglyphbitmap = fmCopyGlyphBitmap3;
  else
    fm->copyglyphbitmap = fmCopyGlyphBitmap4;

  fmClearState( fm );
  return fm;

  error:
  fmDestroyManager( fm );
  return 0;
}

static void fmFreeFont( fmFont *font );

void fmDestroyManager( fmManager *fm )
{
  fmFont *font;

  if( !( fm ) )
    return;
  if( fm->renderer.destroy )
    fm->renderer.destroy( fm->rendererhandle );
  for( font = fm->fontlist ; font ; font = fm->fontlist )
    fmFreeFont( font );
  if( fm->atlas )
    abDestroyAtlas( fm->atlas );
  if( fm->texdata )
    free( fm->texdata );
  FT_Done_FreeType( fm->ft );
  free( fm );
  return;
}


////


static void fmUpdateState( fmState *state )
{
  float kerningfactor;
  fmFont *font;
  font = state->font;
  if( font )
  {
    /* This factor reflects the computed one made by FreeType for FT_Get_Kerning() with FT_KERNING_DEFAULT (ftobjs.c) */
    /*
       units_per_EM = typically 2048
       x_scale = units_per_EM * FontPixelSize
       x_ppem = FontPixelSize
       See FT_Get_Kerning in ftobjs.c for kerning conversion
    */
    kerningfactor = (float)state->size * font->normalized_units_per_EM;
    if( state->size < 25 )
      kerningfactor *= state->size * (float)(1.0f/25.0f);
    state->kerningfactor = kerningfactor;
  }
  return;
}


void fmSetState( fmManager *fm, fmFont *font, int size, int align, int extrapadding, int processindex )
{
  fmState *state;
  if( size >= FM_SIZE_MAX )
    size = FM_SIZE_MAX;
  if( processindex >= FM_PROCESSINDEX_MAX )
    processindex = FM_PROCESSINDEX_MAX;
  else if( processindex < 0 )
    processindex = 0;
  if( extrapadding >= FM_EXTRAPADDING_MAX )
    extrapadding = FM_EXTRAPADDING_MAX;
  else if( extrapadding < 0 )
    extrapadding = 0;
  state = &fm->state;
  state->font = font;
  state->size = size;
  state->align = align;
  state->processindex = processindex;
  state->extrapadding = extrapadding;
  fmUpdateState( state );
  return;
}

void fmSetFont( fmManager *fm, fmFont *font )
{
  fm->state.font = font;
  fmUpdateState( &fm->state );
  return;
}

void fmSetSize( fmManager *fm, int size )
{
  if( size >= FM_SIZE_MAX )
    size = FM_SIZE_MAX;
  fm->state.size = size;
  fmUpdateState( &fm->state );
  return;
}

void fmSetAlign( fmManager *fm, int align )
{
  fm->state.align = align;
  return;
}

void fmSetProcessing( fmManager *fm, int extrapadding, int processindex )
{
  if( processindex >= FM_PROCESSINDEX_MAX )
    processindex = FM_PROCESSINDEX_MAX;
  else if( processindex < 0 )
    processindex = 0;
  if( extrapadding >= FM_EXTRAPADDING_MAX )
    extrapadding = FM_EXTRAPADDING_MAX;
  else if( extrapadding < 0 )
    extrapadding = 0;
  fm->state.processindex = processindex;
  fm->state.extrapadding = extrapadding;
  return;
}


void fmClearState( fmManager *fm )
{
  fmState *state;
  state = &fm->state;
  state->size = 12;
  state->font = 0;
  state->processindex = 0;
  state->extrapadding = 0;
  state->align = FM_ALIGN_LEFT | FM_ALIGN_BASELINE;
  return;
}


////


static void fmFreeFont( fmFont *font )
{
  if( !( font ) )
    return;
  mmListRemove( font, offsetof(fmFont,list) );
  FT_Done_Face( font->ftface );
  if( font->fontdata )
    free( font->fontdata );
  if( font->glyphhashtable )
    free( font->glyphhashtable );
  if( font->kernhashtable )
    free( font->kernhashtable );
  free( font );
  return;
}

fmFont *fmAddFont( fmManager *fm, const char *path, int glyphpaddingwidth );

fmFont *fmAddFontData( fmManager *fm, unsigned char *data, int datasize, int glyphpaddingwidth )
{
  size_t hashsize;
  float ascent, descent, fontheight;
  void *hashtable;
  fmFont *font;

  font = (fmFont*)malloc( sizeof(fmFont) );
  if( !( font ) )
    return 0;
  memset( font, 0, sizeof(fmFont) );

  /* Init font */
  if( FT_New_Memory_Face( fm->ft, (const FT_Byte*)data, datasize, 0, &font->ftface ) )
  {
    fmFreeFont( font );
    return 0;
  }

  /* Prepare glyph hash table */
  hashsize = mmHashRequiredSize( sizeof(fmGlyph), FM_GLYPH_HASH_BITS, 8 );
  hashtable = malloc( hashsize );
  mmHashInit( hashtable, &fmGlyphHashAccess, sizeof(fmGlyph), FM_GLYPH_HASH_BITS, 8, 0x0 );
  font->glyphhashtable = hashtable;

  /* Store face metrics */
  font->units_per_EM = (float)(font->ftface)->units_per_EM;
  font->normalized_units_per_EM = font->units_per_EM * (1.0f/65536.0f);
  font->kerningflag = ( (font->ftface)->face_flags & FT_FACE_FLAG_KERNING ? 1 : 0 );
  font->kernhashtable = 0;

  /* Store normalized line height, we get the real line height multiplying by font size */
  font->lineheight = (float)(font->ftface)->height / (float)(font->ftface)->units_per_EM;
  font->limitminy = (float)(font->ftface)->bbox.yMin / (float)(font->ftface)->units_per_EM;
  font->limitmaxy = (float)(font->ftface)->bbox.yMax / (float)(font->ftface)->units_per_EM;
  ascent = (float)(font->ftface)->ascender;
  descent = (float)(font->ftface)->descender;
  fontheight = ascent - descent;
  font->ascender = ascent / fontheight;
  font->descender = descent / fontheight;
  font->middlealign = 0.5f * ( font->ascender + font->descender );
  font->fontdata = data;
  font->glyphpaddingwidth = glyphpaddingwidth;
  font->processimage = 0;
  font->processimagecontext = 0;

  /* Prepare kerning cache */
  if( font->kerningflag )
  {
    hashsize = mmHashRequiredSize( sizeof(fmKernCacheEntry), FM_KERNCACHE_HASH_BITS, 8 );
    hashtable = malloc( hashsize );
    mmHashInit( hashtable, &fmKernCacheHashAccess, sizeof(fmKernCacheEntry), FM_KERNCACHE_HASH_BITS, 8, 0x0 );
    font->kernhashtable = hashtable;
  }

  mmListAdd( &fm->fontlist, font, offsetof(fmFont,list) );
  return font;
}

void fmRemoveFont( fmManager *fm, fmFont *font )
{
  fmFreeFont( font );
  return;
}

void fmSetFontImageProcessing( fmManager *fm, fmFont *font, void (*processimage)( unsigned char *image, int width, int height, int bytesperpixel, int bytesperline, int extrapadding, int processindex, void *opaquecontext ), void *opaquecontext )
{
  font->processimage = processimage;
  font->processimagecontext = opaquecontext;
  return;
}


////


static void fmBuildCursorGlyph( unsigned char *dst, int glyphwidth, int glyphheight, int dststride )
{
  int x, y, hbarheight, hgap, hline, vline;
  unsigned char *dstrow;

  if( glyphwidth >= 3 )
  {
    hbarheight = 1 + ( glyphheight >> 6 );
    hgap = ( glyphwidth - ( 1 + ( glyphheight >> 6 ) ) ) >> 1;
    hline = hgap + glyphwidth - ( hgap << 1 );
    vline = glyphheight - ( hbarheight << 1 );
    for( y = 0 ; y < hbarheight ; y++ )
    {
      dstrow = dst;
      for( x = 0 ; x < glyphwidth ; x++ )
        dstrow[x] = 255;
      dst += dststride;
    }
    for( y = 0 ; y < vline ; y++ )
    {
      dstrow = dst;
      for( x = 0 ; x < hgap ; x++ )
        dstrow[x] = 0;
      for( ; x < hline ; x++ )
        dstrow[x] = 255;
      for( ; x < glyphwidth ; x++ )
        dstrow[x] = 0;
      dst += dststride;
    }
    for( y = 0 ; y < hbarheight ; y++ )
    {
      dstrow = dst;
      for( x = 0 ; x < glyphwidth ; x++ )
        dstrow[x] = 255;
      dst += dststride;
    }
  }
  else
  {
    for( y = 0 ; y < glyphheight ; y++ )
    {
      dstrow = dst;
      for( x = 0 ; x < glyphwidth ; x++ )
        dstrow[x] = 255;
      dst += dststride;
    }
  }

  return;
}


static fmGlyph *fmGetGlyph( fmManager *fm, fmFont *font, uint32_t codepoint, int size, int subpixel, int processindex, int extrapadding, int *noflushadvance )
{
  int i, glyphindex, advance, x0, y0, x1, y1, gx, gy;
  int glyphwidth, glyphheight, glyphareawidth, glyphareaheight, hashbits;
  size_t hashsize;
  uint64_t glyphkey;
  fmGlyph *glyph;
  void *newhashtable;
  int totalpadding, added;
  unsigned char *dst, *src;
  fmGlyph glyphref;

  glyph = 0;
  if( size < 0.2 )
    return 0;
  totalpadding = font->glyphpaddingwidth + extrapadding;

  /* Find code point and size */
  glyphkey = FM_GLYPH_COMPUTE_KEY( codepoint, subpixel, size, processindex, extrapadding );

  glyphref.glyphkey = glyphkey;
  glyph = fmGlyphHashFind( font->glyphhashtable, &glyphref );

  if( glyph )
    return glyph;

  /* Could not find glyph, create it */
  if( codepoint == FM_GLYPH_CODEPOINT_CURSOR )
  {
    glyphindex = -1;
    advance = 0;
#if 0
    x0 = 0;
    x1 = 1;
#else
    x0 = -2;
    x1 = 3;
#endif
    y0 = -(int)ceilf( font->limitmaxy * (float)size );
    y1 = -(int)floorf( font->limitminy * (float)size );
    i = ( ( y1 - y0 ) - size ) / 3;
    y0 += i;
    y1 -= i;
  }
  else
  {
    glyphindex = FT_Get_Char_Index( font->ftface, codepoint );
    if( !( fmtt_buildGlyphBitmap( font, glyphindex, size, subpixel, &advance, &x0, &y0, &x1, &y1 ) ) )
    {
      if( codepoint != FM_GLYPH_CODEPOINT_REPLACEMENT )
        return fmGetGlyph( fm, font, FM_GLYPH_CODEPOINT_REPLACEMENT, size, subpixel, processindex, extrapadding, 0 );
      return 0;
    }
  }
  glyphwidth = x1 - x0;
  glyphheight = y1 - y0;
  glyphareawidth = glyphwidth + ( totalpadding << 1 );
  glyphareaheight = glyphheight + ( totalpadding << 1 );

  /* Find free spot for the rect in the atlas */
  added = abAtlasAddRect( fm->atlas, glyphareawidth, glyphareaheight, &gx, &gy );
  if( !added )
  {
    if( noflushadvance )
    {
      *noflushadvance = advance;
      return 0;
    }
    if( fm->atlasfullcallback )
    {
      /* Atlas is full, let the user to resize the atlas (or not), and try again */
      fm->atlasfullcallback( fm, fm->atlasfulluserpointer );
      added = abAtlasAddRect( fm->atlas, glyphareawidth, glyphareaheight, &gx, &gy );
      if( added )
        return 0;
    }
  }

  glyphref.glyphkey = glyphkey;
  glyphref.x0 = (int16_t)gx;
  glyphref.y0 = (int16_t)gy;
  glyphref.x1 = (int16_t)( glyphref.x0 + glyphareawidth );
  glyphref.y1 = (int16_t)( glyphref.y0 + glyphareaheight );
  glyphref.advance = advance;
  glyphref.offsetx = (int16_t)( x0 - totalpadding );
  glyphref.offsety = (int16_t)( y0 - totalpadding );
  glyphref.imageindex = -1;
  if( fm->renderer.registerimage )
    glyphref.imageindex = fm->renderer.registerimage( fm->rendererhandle, gx, gy, glyphareawidth, glyphareaheight );

  glyph = fmGlyphHashAdd( font->glyphhashtable, &glyphref, 0 );
  if( mmHashGetStatus( font->glyphhashtable, &hashbits ) == MM_HASH_STATUS_MUSTGROW )
  {
    hashbits++;
    hashsize = mmHashRequiredSize( sizeof(fmGlyph), hashbits, 8 );
    newhashtable = malloc( hashsize );
    mmHashResize( newhashtable, font->glyphhashtable, &fmGlyphHashAccess, hashbits, 8 );
    free( font->glyphhashtable );
    font->glyphhashtable = newhashtable;
  }

  /* Clear glyph image area (TODO: wasteful when single channel without prepare callback?) */
  dst = &fm->texdata[ ( glyph->x0 * fm->bytesperpixel ) + ( glyph->y0 * fm->bytesperline ) ];
  for( i = 0 ; i < glyphareaheight ; i++, dst += fm->bytesperline )
    memset( dst, 0, glyphareawidth * fm->bytesperpixel );

  /* Rasterize */
  dst = &fm->texdata[ ( ( glyph->x0 + totalpadding ) * fm->bytesperpixel ) + ( ( glyph->y0 + totalpadding ) * fm->bytesperline ) + fm->channelindex ];
  if( codepoint == FM_GLYPH_CODEPOINT_CURSOR )
  {
    src = malloc( glyphwidth * glyphheight );
    fmBuildCursorGlyph( src, glyphwidth, glyphheight, glyphwidth );
    fm->copyglyphbitmap( dst, src, glyphwidth, glyphheight, fm->bytesperline );
    free( src );
  }
  else
  {
    src = fmtt_getGlyphBitmap( font, glyphindex );
    fm->copyglyphbitmap( dst, src, glyphwidth, glyphheight, fm->bytesperline );
  }

  /* User custom font image processing */
  if( font->processimage )
  {
    dst = &fm->texdata[ ( glyph->x0 * fm->bytesperpixel ) + ( glyph->y0 * fm->bytesperline ) ];
    font->processimage( dst, glyphareawidth, glyphareaheight, fm->bytesperpixel, fm->bytesperline, extrapadding, processindex, font->processimagecontext );
  }

  fm->dirtyrect[0] = FM_MIN( fm->dirtyrect[0], glyph->x0 );
  fm->dirtyrect[1] = FM_MIN( fm->dirtyrect[1], glyph->y0 );
  fm->dirtyrect[2] = FM_MAX( fm->dirtyrect[2], glyph->x1 );
  fm->dirtyrect[3] = FM_MAX( fm->dirtyrect[3], glyph->y1 );

  return glyph;
}


static void fmGetGlyphQuad( fmManager *fm, fmFont *font, fmGlyph *glyph, float x, float y, int *bounds )
{
  int rx, ry;
  rx = x + glyph->offsetx;
  ry = y + glyph->offsety;
  bounds[0] = rx;
  bounds[2] = ry;
  bounds[1] = rx + glyph->x1 - glyph->x0;
  bounds[3] = ry + glyph->y1 - glyph->y0;
  return;
}


////


/* Only get glyph width, buffer if possible but do not cause a forced state flush */
static int fmGetGlyphAdvance( fmManager *fm, fmFont *font, uint32_t codepoint, int size, int subpixel, int processindex, int extrapadding )
{
  int glyphadvance;
  fmGlyph *glyph;
  glyph = fmGetGlyph( fm, font, codepoint, size, subpixel, processindex, extrapadding, &glyphadvance );
  return ( glyph ? glyph->advance : glyphadvance );
}


////


static float fmGetVerticalAlign( fmManager *fm, fmFont *font, int align, int size )
{
  float sizef;
  sizef = (float)size;
  if( align & FM_ALIGN_TOP )
    return font->ascender * sizef;
  else if( align & FM_ALIGN_MIDDLE )
    return font->middlealign * sizef;
  else if( align & FM_ALIGN_BOTTOM )
    return font->descender * sizef;
  return 0.0f;
}

static inline void fmAddKerning( fmManager *fm, fmFont *font, int prevcodepoint, int nextcodepoint, int size, float kerningfactor, int *x, int *subpixel )
{
  if( ( font->kerningflag ) && ( prevcodepoint != -1 ) )
  {
    *subpixel += fmtt_getGlyphKernAdvance( font, prevcodepoint, nextcodepoint, size, kerningfactor );
#if FM_SUBPIXEL_ROUNDING_RANGE
    *subpixel = ( *subpixel + (FM_SUBPIXEL_ROUNDING_RANGE>>1) ) & ~(FM_SUBPIXEL_ROUNDING_RANGE-1);
#endif
    *x += *subpixel >> 6;
    *subpixel &= 0x3f;
  }
  return;
}

static inline void fmAddGlyphAdvance( int *x, int *subpixel, int advance )
{
  *subpixel += advance;
#if FM_SUBPIXEL_ROUNDING_RANGE
  *subpixel = ( *subpixel + (FM_SUBPIXEL_ROUNDING_RANGE>>1) ) & ~(FM_SUBPIXEL_ROUNDING_RANGE-1);
#endif
  *x += *subpixel >> 6;
  *subpixel &= 0x3f;
  return;
}

static inline void fmDrawTextGlyph( fmManager *fm, fmFont *font, fmGlyph *glyph, int x, int y )
{
  int ptx, pty;
  ptx = x + glyph->offsetx;
  pty = y + glyph->offsety;
  if( fm->renderer.drawimage )
    fm->renderer.drawimage( fm->rendererhandle, ptx, pty, glyph->imageindex );
  else if( fm->renderer.drawimagealt )
    fm->renderer.drawimagealt( fm->rendererhandle, fm->texdata, ptx, pty, glyph->x0, glyph->y0, glyph->x1 - glyph->x0, glyph->y1 - glyph->y0 );
  return;
}

static inline void fmDrawTextCursorGlyph( fmManager *fm, fmFont *font, fmGlyph *glyph, int x, int y )
{
  int ptx, pty;
  ptx = x + glyph->offsetx;
  pty = y + glyph->offsety;
  if( fm->renderer.drawimagecursor )
    fm->renderer.drawimagecursor( fm->rendererhandle, ptx, pty, glyph->imageindex );
  else if( fm->renderer.drawimagealt )
    fm->renderer.drawimagealt( fm->rendererhandle, fm->texdata, ptx, pty, glyph->x0, glyph->y0, glyph->x1 - glyph->x0, glyph->y1 - glyph->y0 );
  return;
}

static inline void fmDrawTextGlyphFloat( fmManager *fm, fmFont *font, fmGlyph *glyph, float x, float y, float vectorx, float vectory, float offsetx, float offsety )
{
  float vectx, vecty, ptx, pty;
  vectx = (float)glyph->offsetx + offsetx;
  vecty = (float)glyph->offsety + offsety;
  ptx = x + ( vectorx * vectx ) - ( vectory * vecty );
  pty = y + ( vectorx * vecty ) + ( vectory * vectx );
  if( fm->renderer.drawimagefloat )
    fm->renderer.drawimagefloat( fm->rendererhandle, ptx, pty, vectory, vectorx, glyph->imageindex );
  else if( fm->renderer.drawimagefloatalt )
    fm->renderer.drawimagefloatalt( fm->rendererhandle, fm->texdata, ptx, pty, vectory, vectorx, glyph->x0, glyph->y0, glyph->x1 - glyph->x0, glyph->y1 - glyph->y0 );
  return;
}

int fmDrawText( fmManager *fm, int x, int y, const char *string, int stringlength )
{
  int subpixel, index;
  fmState *state;
  uint32_t codepoint;
  uint32_t utf8state;
  fmGlyph *glyph;
  int prevcodepoint;
  int processindex, extrapadding;
  fmFont *font;

  state = &fm->state;
  glyph = 0;
  processindex = state->processindex;
  extrapadding = state->extrapadding;
  if( !( state->font ) )
    return x;
  font = state->font;
  if( !( stringlength ) )
    stringlength = string ? strlen( string ) : 0;

  /* Align horizontally */
  if( state->align & FM_ALIGN_RIGHT )
    x -= fmGetTextWidth( fm, string, stringlength );
  else if( state->align & FM_ALIGN_CENTER )
    x -= fmGetTextWidth( fm, string, stringlength ) >> 1;

  /* Align vertically */
  y += (int)roundf( fmGetVerticalAlign( fm, font, state->align, state->size ) );

  subpixel = 0;
  utf8state = 0;
  prevcodepoint = -1;
  for( index = 0 ; index < stringlength ; index++ )
  {
    if( ccUtf8ToUnicode( (unsigned char)string[index], &utf8state, &codepoint ) )
      continue;
    if( ( codepoint < FM_CODEPOINT_ESCAPE_RANGE ) && ( fm->renderer.escapeprocess ) )
    {
      index += fm->renderer.escapeprocess( fm->rendererhandle, &string[index] );
      continue;
    }
    glyph = fmGetGlyph( fm, font, codepoint, state->size, subpixel, processindex, extrapadding, 0 );
    if( glyph )
    {
      fmAddKerning( fm, font, prevcodepoint, codepoint, state->size, state->kerningfactor, &x, &subpixel );
      fmDrawTextGlyph( fm, font, glyph, x, y );
      fmAddGlyphAdvance( &x, &subpixel, glyph->advance );
    }
    prevcodepoint = codepoint;
  }

  return x + ( subpixel >= 32 );
}

int fmDrawTextFloat( fmManager *fm, float fx, float y, const char *string, int stringlength )
{
  int subpixel, index;
  fmState *state;
  uint32_t codepoint;
  uint32_t utf8state;
  fmGlyph *glyph;
  int prevcodepoint;
  int processindex, extrapadding;
  fmFont *font;
  int x = (int)(fx + 0.5f);
  float dx = fx - x;

  state = &fm->state;
  glyph = 0;
  processindex = state->processindex;
  extrapadding = state->extrapadding;
  if( !( state->font ) )
    return x;
  font = state->font;
  if( !( stringlength ) )
    stringlength = strlen( string );

  /* Align horizontally */
  if( state->align & FM_ALIGN_RIGHT )
    x -= fmGetTextWidth( fm, string, stringlength );
  else if( state->align & FM_ALIGN_CENTER )
    x -= fmGetTextWidth( fm, string, stringlength ) >> 1;

  /* Align vertically */
  y += fmGetVerticalAlign( fm, font, state->align, state->size );

  subpixel = 0;
  utf8state = 0;
  prevcodepoint = -1;
  for( index = 0 ; index < stringlength ; index++ )
  {
    if( ccUtf8ToUnicode( (unsigned char)string[index], &utf8state, &codepoint ) )
      continue;
    if( ( codepoint < FM_CODEPOINT_ESCAPE_RANGE ) && ( fm->renderer.escapeprocess ) )
    {
      index += fm->renderer.escapeprocess( fm->rendererhandle, &string[index] );
      continue;
    }
    glyph = fmGetGlyph( fm, font, codepoint, state->size, subpixel, processindex, extrapadding, 0 );
    if( glyph )
    {
      fmAddKerning( fm, font, prevcodepoint, codepoint, state->size, state->kerningfactor, &x, &subpixel );
      fmDrawTextGlyphFloat( fm, font, glyph, x + dx, y, 1, 0, 0, 0 );
      fmAddGlyphAdvance( &x, &subpixel, glyph->advance );
    }
    prevcodepoint = codepoint;
  }

  return x + ( subpixel >= 32 );
}

int fmDrawTextWithCursor( fmManager *fm, int x, int y, const char *string, int stringlength, int cursoroffset )
{
  int subpixel, index;
  fmState *state;
  uint32_t codepoint;
  uint32_t utf8state;
  fmGlyph *glyph;
  int prevcodepoint;
  int processindex, extrapadding;
  fmFont *font;

  state = &fm->state;
  glyph = 0;
  processindex = state->processindex;
  extrapadding = state->extrapadding;
  if( !( state->font ) )
    return x;
  font = state->font;
  if( !( stringlength ) )
    stringlength = strlen( string );

  /* Align horizontally */
  if( state->align & FM_ALIGN_RIGHT )
    x -= fmGetTextWidth( fm, string, stringlength );
  else if( state->align & FM_ALIGN_CENTER )
    x -= fmGetTextWidth( fm, string, stringlength ) >> 1;

  /* Align vertically */
  y += (int)roundf( fmGetVerticalAlign( fm, font, state->align, state->size ) );

  subpixel = 0;
  utf8state = 0;
  prevcodepoint = -1;
  for( index = 0 ; ; index++ )
  {
    if( index == cursoroffset )
    {
      glyph = fmGetGlyph( fm, font, FM_GLYPH_CODEPOINT_CURSOR, state->size, subpixel, processindex, extrapadding, 0 );
      if( glyph )
        fmDrawTextCursorGlyph( fm, font, glyph, x, y );
    }
    if( index >= stringlength )
      break;
    if( ccUtf8ToUnicode( (unsigned char)string[index], &utf8state, &codepoint ) )
      continue;
    if( ( codepoint < FM_CODEPOINT_ESCAPE_RANGE ) && ( fm->renderer.escapeprocess ) )
    {
      index += fm->renderer.escapeprocess( fm->rendererhandle, &string[index] );
      continue;
    }
    glyph = fmGetGlyph( fm, font, codepoint, state->size, subpixel, processindex, extrapadding, 0 );
    if( glyph )
    {
      fmAddKerning( fm, font, prevcodepoint, codepoint, state->size, state->kerningfactor, &x, &subpixel );
      fmDrawTextGlyph( fm, font, glyph, x, y );
      fmAddGlyphAdvance( &x, &subpixel, glyph->advance );
    }
    prevcodepoint = codepoint;
  }

  return x + ( subpixel >= 32 );
}

int fmDrawTextTruncate( fmManager *fm, int x, int y, int truncatewidth, const char *string, int stringlength, char *extstring, int extwidth )
{
  int subpixel, index, fullwidth, extflag;
  fmState *state;
  uint32_t codepoint;
  uint32_t utf8state;
  fmGlyph *glyph;
  int prevcodepoint;
  int processindex, extrapadding;
  fmFont *font;

  state = &fm->state;
  glyph = 0;
  processindex = state->processindex;
  extrapadding = state->extrapadding;
  if( !( state->font ) )
    return x;
  font = state->font;
  if( !( stringlength ) )
    stringlength = strlen( string );
  if( !( extwidth ) )
    extwidth = ( extstring ? fmGetTextWidth( fm, extstring, strlen( extstring ) ) : 0 );
  if( truncatewidth < extwidth )
    return 0;

  stringlength = fmGetTextTruncateOffset( fm, truncatewidth, string, stringlength, extwidth, &extflag, &fullwidth );

  /* Align horizontally */
  if( state->align & FM_ALIGN_RIGHT )
    x -= fullwidth;
  else if( state->align & FM_ALIGN_CENTER )
    x -= fullwidth >> 1;

  /* Align vertically */
  y += (int)roundf( fmGetVerticalAlign( fm, font, state->align, state->size ) );

  subpixel = 0;
  utf8state = 0;
  prevcodepoint = -1;
  for( index = 0 ; index < stringlength ; index++ )
  {
    if( ccUtf8ToUnicode( (unsigned char)string[index], &utf8state, &codepoint ) )
      continue;
    if( ( codepoint < FM_CODEPOINT_ESCAPE_RANGE ) && ( fm->renderer.escapeprocess ) )
    {
      index += fm->renderer.escapeprocess( fm->rendererhandle, &string[index] );
      continue;
    }
    glyph = fmGetGlyph( fm, font, codepoint, state->size, subpixel, processindex, extrapadding, 0 );
    if( glyph )
    {
      fmAddKerning( fm, font, prevcodepoint, codepoint, state->size, state->kerningfactor, &x, &subpixel );
      fmDrawTextGlyph( fm, font, glyph, x, y );
      fmAddGlyphAdvance( &x, &subpixel, glyph->advance );
    }
    prevcodepoint = codepoint;
  }

  if( ( extflag ) && ( extstring ) )
  {
    utf8state = 0;
    for( index = 0 ; extstring[index] ; index++ )
    {
      if( ccUtf8ToUnicode( (unsigned char)extstring[index], &utf8state, &codepoint ) )
        continue;
      if( ( codepoint < FM_CODEPOINT_ESCAPE_RANGE ) && ( fm->renderer.escapeprocess ) )
      {
        index += fm->renderer.escapeprocess( fm->rendererhandle, &string[index] );
        continue;
      }
      glyph = fmGetGlyph( fm, font, codepoint, state->size, subpixel, processindex, extrapadding, 0 );
      if( glyph )
      {
        fmAddKerning( fm, font, prevcodepoint, codepoint, state->size, state->kerningfactor, &x, &subpixel );
        fmDrawTextGlyph( fm, font, glyph, x, y );
        fmAddGlyphAdvance( &x, &subpixel, glyph->advance );
      }
      prevcodepoint = codepoint;
    }
  }

  return x;
}


////


/* WWW */
int fmGetTextWidthNoFlush( fmManager *fm, const char *string, int stringlength )
{
  int subpixel, index, advance, glyphadvance;
  fmState *state;
  uint32_t codepoint;
  uint32_t utf8state;
  int prevcodepoint;
  int processindex, extrapadding;
  fmFont *font;

  state = &fm->state;
  processindex = state->processindex;
  extrapadding = state->extrapadding;
  if( !( state->font ) )
    return 0;
  font = state->font;
  if( !( stringlength ) )
    stringlength = strlen( string );

  advance = 0;
  subpixel = 0;
  utf8state = 0;
  prevcodepoint = -1;
  for( index = 0 ; index < stringlength ; index++ )
  {
    if( ccUtf8ToUnicode( (unsigned char)string[index], &utf8state, &codepoint ) )
      continue;
    if( ( codepoint < FM_CODEPOINT_ESCAPE_RANGE ) && ( fm->renderer.escapeskip ) )
    {
      index += fm->renderer.escapeskip( fm->rendererhandle, &string[index] );
      continue;
    }
    glyphadvance = fmGetGlyphAdvance( fm, font, codepoint, state->size, subpixel, processindex, extrapadding );
    if( glyphadvance )
    {
      fmAddKerning( fm, font, prevcodepoint, codepoint, state->size, state->kerningfactor, &advance, &subpixel );
      fmAddGlyphAdvance( &advance, &subpixel, glyphadvance );
    }
    prevcodepoint = codepoint;
  }

  return advance + ( subpixel >= 32 );
}


////


int fmGetTextWidth( fmManager *fm, const char *string, int stringlength )
{
  int subpixel, index, advance;
  fmState *state;
  uint32_t codepoint;
  uint32_t utf8state;
  fmGlyph *glyph;
  int prevcodepoint;
  int processindex, extrapadding;
  fmFont *font;

  state = &fm->state;
  glyph = 0;
  processindex = state->processindex;
  extrapadding = state->extrapadding;
  if( !( state->font ) )
    return 0;
  font = state->font;
  if( !( stringlength ) )
    stringlength = strlen( string );

  advance = 0;
  subpixel = 0;
  utf8state = 0;
  prevcodepoint = -1;
  for( index = 0 ; index < stringlength ; index++ )
  {
    if( ccUtf8ToUnicode( (unsigned char)string[index], &utf8state, &codepoint ) )
      continue;
    if( ( codepoint < FM_CODEPOINT_ESCAPE_RANGE ) && ( fm->renderer.escapeskip ) )
    {
      index += fm->renderer.escapeskip( fm->rendererhandle, &string[index] );
      continue;
    }
    glyph = fmGetGlyph( fm, font, codepoint, state->size, subpixel, processindex, extrapadding, 0 );
    if( glyph )
    {
      fmAddKerning( fm, font, prevcodepoint, codepoint, state->size, state->kerningfactor, &advance, &subpixel );
      fmAddGlyphAdvance( &advance, &subpixel, glyph->advance );
    }
    prevcodepoint = codepoint;
  }

  return advance + ( subpixel >= 32 );
}


int fmGetTextBounds( fmManager *fm, int x, int y, const char *string, int startoffset, int stringlength, int *bounds )
{
  int subpixel, index;
  fmState *state;
  uint32_t codepoint;
  uint32_t utf8state;
  fmGlyph *glyph;
  int prevcodepoint;
  int processindex, extrapadding;
  fmFont *font;
  int startx, advance;
  int glyphbounds[4];
  int minx, miny, maxx, maxy;

  state = &fm->state;
  glyph = 0;
  processindex = state->processindex;
  extrapadding = state->extrapadding;
  if( !( state->font ) )
    return x;
  font = state->font;
  if( !( stringlength ) )
    stringlength = strlen( string );

  /* Align vertically */
  y += (int)roundf( fmGetVerticalAlign( fm, font, state->align, state->size ) );

  minx = 32767;
  maxx = -32767;
  miny = 32767;
  maxy = -32767;
  startx = x;

  subpixel = 0;
  utf8state = 0;
  prevcodepoint = -1;
  for( index = 0 ; index < stringlength ; index++ )
  {
    if( ccUtf8ToUnicode( (unsigned char)string[index], &utf8state, &codepoint ) )
      continue;
    if( ( codepoint < FM_CODEPOINT_ESCAPE_RANGE ) && ( fm->renderer.escapeskip ) )
    {
      index += fm->renderer.escapeskip( fm->rendererhandle, &string[index] );
      continue;
    }
    glyph = fmGetGlyph( fm, font, codepoint, state->size, subpixel, processindex, extrapadding, 0 );
    if( glyph )
    {
      fmAddKerning( fm, font, prevcodepoint, codepoint, state->size, state->kerningfactor, &x, &subpixel );
      if( index >= startoffset )
      {
        fmGetGlyphQuad( fm, font, glyph, x, y, glyphbounds );
        if( glyphbounds[0] < minx )
          minx = glyphbounds[0];
        if( glyphbounds[1] > maxx )
          maxx = glyphbounds[1];
        if( glyphbounds[2] < miny )
          miny = glyphbounds[2];
        if( glyphbounds[3] > maxy )
          maxy = glyphbounds[3];
      }
      fmAddGlyphAdvance( &x, &subpixel, glyph->advance );
    }
    prevcodepoint = codepoint;
  }

  if( x > maxx )
    maxx = x;
  advance = x - startx;

  /* Align horizontally */
  if( state->align & FM_ALIGN_RIGHT )
  {
    minx -= advance;
    maxx -= advance;
  }
  else if( state->align & FM_ALIGN_CENTER )
  {
    minx -= advance * 0.5f;
    maxx -= advance * 0.5f;
  }

  if( bounds )
  {
    bounds[0] = minx;
    bounds[1] = maxx;
    bounds[2] = miny;
    bounds[3] = maxy;
  }

  return advance + ( subpixel >= 32 );
}


int fmGetTextTruncateOffset( fmManager *fm, int truncatewidth, const char *string, int stringlength, int extwidth, int *retextflag, int *retfullwidth )
{
  int subpixel, index, advance, truncatewidthext, truncateindex, extflag, fullwidth;
  fmState *state;
  uint32_t codepoint;
  uint32_t utf8state;
  fmGlyph *glyph;
  int prevcodepoint;
  int processindex, extrapadding;
  fmFont *font;

  state = &fm->state;
  if( retextflag )
    *retextflag = 0;
  if( retfullwidth )
    *retfullwidth = 0;
  if( extwidth > truncatewidth )
    return 0;
  glyph = 0;
  processindex = state->processindex;
  extrapadding = state->extrapadding;
  if( !( state->font ) )
    return 0;
  font = state->font;
  if( stringlength <= 0 )
    stringlength = strlen( string );

  truncatewidthext = truncatewidth - extwidth;

  fullwidth = 0;
  advance = 0;
  subpixel = 0;
  truncateindex = 0;
  extflag = 0;
  utf8state = 0;
  prevcodepoint = -1;
  for( index = 0 ; ; index++ )
  {
    if( index >= stringlength )
    {
      truncateindex = index;
      fullwidth = advance + ( subpixel >= 32 );
      break;
    }
    if( ccUtf8ToUnicode( (unsigned char)string[index], &utf8state, &codepoint ) )
      continue;
    if( ( codepoint < FM_CODEPOINT_ESCAPE_RANGE ) && ( fm->renderer.escapeskip ) )
    {
      index += fm->renderer.escapeskip( fm->rendererhandle, &string[index] );
      continue;
    }
    glyph = fmGetGlyph( fm, font, codepoint, state->size, subpixel, processindex, extrapadding, 0 );
    if( glyph )
    {
      fmAddKerning( fm, font, prevcodepoint, codepoint, state->size, state->kerningfactor, &advance, &subpixel );
      fmAddGlyphAdvance( &advance, &subpixel, glyph->advance );
      if( advance > truncatewidth )
      {
        extflag = 1;
        break;
      }
      if( advance <= truncatewidthext )
      {
        truncateindex = index + 1;
        fullwidth = advance + ( subpixel >= 32 );
      }
    }
    prevcodepoint = codepoint;
  }

  if( retfullwidth )
    *retfullwidth = fullwidth + ( extflag ? extwidth : 0 );
  if( retextflag )
    *retextflag = extflag;

  return truncateindex;
}


int fmGetTextNearestOffset( fmManager *fm, int targetwidth, const char *string, int stringlength )
{
  int subpixel, index, advance, truncateindex, distance, bestdistance;
  fmState *state;
  uint32_t codepoint;
  uint32_t utf8state;
  fmGlyph *glyph;
  int prevcodepoint;
  int processindex, extrapadding;
  fmFont *font;

  state = &fm->state;
  glyph = 0;
  processindex = state->processindex;
  extrapadding = state->extrapadding;
  if( !( state->font ) )
    return 0;
  font = state->font;
  if( stringlength <= 0 )
    stringlength = strlen( string );

  advance = 0;
  subpixel = 0;
  truncateindex = 0;
  bestdistance = abs( targetwidth );
  utf8state = 0;
  prevcodepoint = -1;
  for( index = 0 ; index < stringlength ; index++ )
  {
    if( ccUtf8ToUnicode( (unsigned char)string[index], &utf8state, &codepoint ) )
      continue;
    if( ( codepoint < FM_CODEPOINT_ESCAPE_RANGE ) && ( fm->renderer.escapeskip ) )
    {
      index += fm->renderer.escapeskip( fm->rendererhandle, &string[index] );
      continue;
    }
    glyph = fmGetGlyph( fm, font, codepoint, state->size, subpixel, processindex, extrapadding, 0 );
    if( glyph )
    {
      fmAddKerning( fm, font, prevcodepoint, codepoint, state->size, state->kerningfactor, &advance, &subpixel );
      fmAddGlyphAdvance( &advance, &subpixel, glyph->advance );
      distance = abs( targetwidth - ( advance + ( subpixel >= 32 ) ) );
      if( distance > bestdistance )
        break;
      bestdistance = distance;
      truncateindex = index + 1;
    }
    prevcodepoint = codepoint;
  }

  return truncateindex;
}




////


static void fmFlush( fmManager *fm, int rendererflushflag )
{
  /* Flush texture updates */
  if( ( fm->dirtyrect[0] < fm->dirtyrect[2] ) && ( fm->dirtyrect[1] < fm->dirtyrect[3] ) )
  {
    if( fm->renderer.updatetexture )
      fm->renderer.updatetexture( fm->rendererhandle, fm->dirtyrect, fm->texdata );
    /* Reset dirty rect */
    fm->dirtyrect[0] = fm->width;
    fm->dirtyrect[1] = fm->height;
    fm->dirtyrect[2] = 0;
    fm->dirtyrect[3] = 0;
  }
  /* Flush buffered glyphs */
  if( ( rendererflushflag ) && ( fm->renderer.flush ) )
    fm->renderer.flush( fm->rendererhandle );
  return;
}

void fmFlushUpdate( void *fm )
{
  fmFlush( (fmManager *)fm, 0 );
  return;
}

void fmFlushDraw( void *fm )
{
  fmFlush( (fmManager *)fm, 1 );
  return;
}


////


void fmGetFontExtent( fmManager *fm, int *retascent, int *retdescent )
{
  fmFont *font;
  fmState *state;

  state = &fm->state;
  if( !( state->font ) )
    return;
  font = state->font;

  if( retascent )
    *retascent = -(int)ceilf( font->ascender * (float)state->size );
  if( retdescent )
    *retdescent = -(int)floorf( font->descender * (float)state->size );

  return;
}

float fmGetFontVerticalOffset( fmManager *fm )
{
  fmFont *font;
  fmState *state;

  state = &fm->state;
  if( !( state->font ) )
    return 0;
  font = state->font;
  return fmGetVerticalAlign( fm, font, state->align, state->size );
}

void fmGetFontLimits( fmManager *fm, int *retlimitminy, int *retlimitmaxy )
{
  fmFont *font;
  fmState *state;

  state = &fm->state;
  if( !( state->font ) )
    return;
  font = state->font;

  if( retlimitminy )
    *retlimitminy = -(int)ceilf( font->limitmaxy * state->size );
  if( retlimitmaxy )
    *retlimitmaxy = -(int)floorf( font->limitminy * state->size );

  return;
}

int fmGetFontLineHeight( fmManager *fm )
{
  fmFont *font;
  fmState *state;

  state = &fm->state;
  if( !( state->font ) )
    return 0 ;
  font = state->font;
  return (int)ceilf( font->lineheight * state->size );
}


////


const unsigned char *fmGetTextureData( fmManager *fm, int *width, int *height )
{
  if( width )
    *width = fm->width;
  if( height )
    *height = fm->height;
  return fm->texdata;
}

int fmValidateTexture( fmManager *fm, int *retdirtyrect )
{
  if( ( fm->dirtyrect[0] < fm->dirtyrect[2] ) && ( fm->dirtyrect[1] < fm->dirtyrect[3] ) )
  {
    retdirtyrect[0] = fm->dirtyrect[0];
    retdirtyrect[1] = fm->dirtyrect[1];
    retdirtyrect[2] = fm->dirtyrect[2];
    retdirtyrect[3] = fm->dirtyrect[3];
    /* Reset dirty rect */
    fm->dirtyrect[0] = fm->width;
    fm->dirtyrect[1] = fm->height;
    fm->dirtyrect[2] = 0;
    fm->dirtyrect[3] = 0;
    return 1;
  }
  return 0;
}

void fmSetAtlasFullCallback( fmManager *fm, void (*callback)( fmManager *fm, void *userpointer ), void *userpointer )
{
  fm->atlasfullcallback = callback;
  fm->atlasfulluserpointer = userpointer;
  return;
}

void fmGetAtlasSize( fmManager *fm, int *retwidth, int *retheight )
{
  *retwidth = fm->width;
  *retheight = fm->height;
  return;
}

int fmExpandAtlas( fmManager *fm, int width, int height )
{
  int i;
  unsigned char *data;
  unsigned char *dst;
  unsigned char *src;

  width = FM_MAX( width, fm->width );
  height = FM_MAX( height, fm->height );

  if( ( width == fm->width ) && ( height == fm->height ) )
    return 1;

  /* Flush all pending glyphs to be rendered */
  fmFlush( fm, 1 );

  /* Create new texture */
  if( fm->renderer.resizetexture )
  {
    if( fm->renderer.resizetexture( fm->rendererhandle, width, height ) == 0 )
      return 0;
  }

  /* Copy old texture data over */
  data = (unsigned char *)malloc( height * fm->bytesperline );
  if( !( data ) )
    return 0;
  for( i = 0 ; i < fm->height ; i++ )
  {
    dst = &data[ ( i * width ) * fm->bytesperpixel ];
    src = &fm->texdata[ i * fm->bytesperline ];
    memcpy( dst, src, fm->bytesperline );
    if( width > fm->width )
      memset( &dst[ fm->bytesperline ], 0, ( width - fm->width ) * fm->bytesperpixel );
  }
  if( height > fm->height )
    memset( &data[ width * fm->height * fm->bytesperpixel ], 0, ( height - fm->height ) * fm->bytesperline );
  free( fm->texdata );
  fm->texdata = data;

  /* Increase atlas size */
  abAtlasExpand( fm->atlas, width, height );

  /* Add existing data as dirty */
  fm->dirtyrect[0] = 0;
  fm->dirtyrect[1] = 0;
  fm->dirtyrect[2] = fm->width;
  fm->dirtyrect[3] = abGetAtlasMaxHeight( fm->atlas );

  fm->width = width;
  fm->height = height;
  fm->bytesperline = fm->width * fm->bytesperpixel;
  fm->widthinv = 1.0f / fm->width;
  fm->heightinv = 1.0f / fm->height;

  return 1;
}

int fmResetAtlas( fmManager *fm, int width, int height )
{
  fmFont *font;

  /* Flush all pending glyphs */
  fmFlush( fm, 1 );

  /* Create new texture */
  if( fm->renderer.resizetexture )
  {
    if( !( fm->renderer.resizetexture( fm->rendererhandle, width, height ) ) )
      return 0;
  }

  /* Reset atlas */
  abResetAtlas( fm->atlas, width, height );

  /* Clear texture data */
  fm->texdata = (unsigned char *)realloc( fm->texdata, width * height * fm->bytesperpixel );
  if( !( fm->texdata ) )
    return 0;
  memset( fm->texdata, 0, width * height * fm->bytesperpixel );

  /* Reset dirty rect */
  fm->dirtyrect[0] = width;
  fm->dirtyrect[1] = height;
  fm->dirtyrect[2] = 0;
  fm->dirtyrect[3] = 0;
  /* Reset all glyph hash tables */
  for( font = fm->fontlist ; font ; font = font->list.next )
    mmHashReset( font->glyphhashtable, &fmGlyphHashAccess );
  /* Reset the font renderer's registered image cache */
  if( fm->renderer.resetimages )
    fm->renderer.resetimages( fm->rendererhandle );

  fm->width = width;
  fm->height = height;
  fm->widthinv = 1.0f / fm->width;
  fm->heightinv = 1.0f / fm->height;

  return 1;
}


/* Get renderer's handle */
void *fmGetRendererHandle( fmManager *fm )
{
  return fm ? fm->rendererhandle : NULL;
}


////


int fmInitPathDraw( fmManager *fm, fmPathDraw *pathdraw )
{
  fmState *state;
  fmFont *font;

  state = &fm->state;
  font = state->font;
  if( !( font ) )
    return 0;
  pathdraw->prevcodepoint = -1;
  pathdraw->middlealign = font->middlealign * (float)state->size;

  return 1;
}


float fmPathDrawCharacter( fmManager *fm, fmPathDraw *pathdraw, float x, float y, float vectorx, float vectory, int unicode )
{
  int subpixel;
  fmState *state;
  fmGlyph *glyph;
  int processindex, extrapadding;
  fmFont *font;

  state = &fm->state;
  glyph = 0;
  processindex = state->processindex;
  extrapadding = state->extrapadding;
  font = state->font;

  glyph = fmGetGlyph( fm, font, unicode, state->size, 0, processindex, extrapadding, 0 );
  if( glyph )
  {
    subpixel = 0;
    if( pathdraw->prevcodepoint >= 0 && font->kernhashtable)
      subpixel = fmtt_getGlyphKernAdvance( font, pathdraw->prevcodepoint, unicode, state->size, state->kerningfactor );
    fmDrawTextGlyphFloat( fm, font, glyph, x, y, vectorx, vectory, (float)subpixel * (1.0/64.0), pathdraw->middlealign );
    subpixel += glyph->advance;
  }
  else
    subpixel = 0;
  pathdraw->prevcodepoint = unicode;

  return (float)subpixel * (1.0/64.0);
}


float fmPathDrawPredictAdvance( fmManager *fm, fmPathDraw *pathdraw, int unicode )
{
  int subpixel;
  fmState *state;
  fmGlyph *glyph;
  int processindex, extrapadding;
  fmFont *font;

  state = &fm->state;
  glyph = 0;
  processindex = state->processindex;
  extrapadding = state->extrapadding;
  font = state->font;

  subpixel = 0;
  glyph = fmGetGlyph( fm, font, unicode, state->size, 0, processindex, extrapadding, 0 );
  if( glyph )
  {
    subpixel = 0;
    if( pathdraw->prevcodepoint >= 0 && font->kernhashtable)
      subpixel = fmtt_getGlyphKernAdvance( font, pathdraw->prevcodepoint, unicode, state->size, state->kerningfactor );
    subpixel += glyph->advance;
  }

  return (float)subpixel * (1.0/64.0);
}


#define FM_CONFIG_PIXEL_EPSILON (1.0f/65536.0f)
#define FM_CONFIG_VECTOR_EPSILON (1.0f/65536.0f)

int fmPathDrawText( fmManager *fm, float *vertexlist, int vertexcount, char *string )
{
  int vertexindex, index;
  uint32_t codepoint, utf8state;
  float x, y, vectorx, vectory, advance;
  float seglen, segleninv, glyphadvance;
  fmPathDraw pathdraw;

  vertexindex = 0;
  vectorx = vertexlist[2] - vertexlist[0];
  vectory = vertexlist[3] - vertexlist[1];
  seglen = sqrtf( ( vectorx * vectorx ) + ( vectory * vectory ) ) + FM_CONFIG_PIXEL_EPSILON;
  segleninv = 1.0f / seglen;
  vectorx *= segleninv;
  vectory *= segleninv;

  if( !( fmInitPathDraw( fm, &pathdraw ) ) )
    return 0;

  x = vertexlist[0];
  y = vertexlist[1];
  utf8state = 0;
  for( index = 0 ; string[index] ; index++ )
  {
    if( ccUtf8ToUnicode( string[index], &utf8state, &codepoint ) )
      continue;
    if( ( codepoint < FM_CODEPOINT_ESCAPE_RANGE ) && ( fm->renderer.escapeskip ) )
    {
      index += fm->renderer.escapeskip( fm->rendererhandle, &string[index] );
      continue;
    }
    glyphadvance = fmPathDrawPredictAdvance( fm, &pathdraw, codepoint );
    if( glyphadvance < seglen )
      advance = fmPathDrawCharacter( fm, &pathdraw, x, y, vectorx, vectory, codepoint );
    else
    {
      float prex, prey, prevectorx, prevectory, norm;
      prex = x;
      prey = y;
      prevectorx = vectorx;
      prevectory = vectory;

      advance = glyphadvance;
      for( ; advance >= seglen ; )
      {
        vertexindex++;
        if( vertexindex >= (vertexcount-1) )
          break;
        vertexlist += 2;

        advance -= seglen;
        x = vertexlist[0];
        y = vertexlist[1];
        vectorx = vertexlist[2] - x;
        vectory = vertexlist[3] - y;
        seglen = sqrtf( ( vectorx * vectorx ) + ( vectory * vectory ) ) + FM_CONFIG_PIXEL_EPSILON;
        segleninv = 1.0f / seglen;
        vectorx *= segleninv;
        vectory *= segleninv;
      }
      glyphadvance -= advance;
      x -= glyphadvance * vectorx;
      y -= glyphadvance * vectory;
      seglen += glyphadvance;
      prevectorx += vectorx;
      prevectory += vectory;
      norm = 1.0f / sqrtf( ( prevectorx * prevectorx ) + ( prevectory * prevectory ) + FM_CONFIG_VECTOR_EPSILON );
      prevectorx *= norm;
      prevectory *= norm;
      advance = fmPathDrawCharacter( fm, &pathdraw, ( 0.5f * ( prex + x ) ), ( 0.5f * ( prey + y ) ), prevectorx, prevectory, codepoint );
    }

    x += advance * vectorx;
    y += advance * vectory;
    seglen -= advance;
  }

  return 1;
}

