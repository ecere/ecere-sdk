#include "EtcConfig.h"
#include "Etc.h"
#include "EtcFilter.h"
#include "EtcMath.h"
#include "EtcImage.h"
#include "EtcErrorMetric.h"
#include "EtcBlock4x4EncodingBits.h"

#include <cstdlib>
#include <cstring>

using namespace Etc;

extern "C" __attribute__((visibility("default"))) void * etc2Compress(float * pixelData, unsigned int width, unsigned int height,
   unsigned int * size, unsigned int * dw, unsigned int * dh)
{
   Etc::Image image(pixelData, width, height, ErrorMetric::RGBA /*BT709 /* RGBA*/);
   // Image::Format::RGB8
   // Image::Format::SRGB8
   // Image::Format::SRGBA8
   image.Encode(Image::Format::RGBA8, ErrorMetric::RGBA /*BT709*/, ETCCOMP_DEFAULT_EFFORT_LEVEL, 4, 4);
   *size = image.GetEncodingBitsBytes();
   *dw = image.GetExtendedWidth();
   *dh = image.GetExtendedHeight();
   void * cData = malloc(*size);
   memcpy(cData, image.GetEncodingBits(), *size);
   return cData;
}

extern "C" __attribute__((visibility("default"))) void * etc2Alloc(size_t size)
{
   return malloc(size);
}

extern "C" __attribute__((visibility("default"))) void etc2Free(void * data)
{
   free(data);
}
