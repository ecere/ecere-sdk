/* *****************************************************************************
 * Copyright (c) 2007-2016 Alexis Naveros.
 *
 * Ecere Corporation has unlimited/unrestricted rights.
 * *****************************************************************************/
#include "img.h"

typedef struct
{
  GLuint gltex;
  int width;
  int height;
  float widthinv;
  float heightinv;
  int32_t flags;
  uint32_t ordermask;
} tmTexture;

#define TM_TEXTURE_FLAGS_INVALID (0x1)


tmTexture *tmCreateTexture( uint32_t textureordermask );
int tmBuildTexture( tmTexture *texture, imgImage *image, int mipmapmode, float anisotropy, int maxresolution );
int tmLoadTexture( tmTexture *texture, char *path, int mipmapmode, float anisotropy, int maxresolution );
void tmDestroyTexture( tmTexture *texture );

