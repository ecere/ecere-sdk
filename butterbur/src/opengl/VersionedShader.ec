public import IMPORT_STATIC "ecere"

#include "gl123es.h"

class VersionedShader : Shader
{
   ZString getDefinitions(uint64 _state)
   {
      ZString defs { allocType = heap, minSize = 256 };

#if defined(_GLES3) || defined(__LUMIN__) || defined(__EMSCRIPTEN__)
      defs.concatf("#version 300 es\n");
      defs.concatf("#define GLSL_FLOAT_PRECISION   1\n");
      defs.concatf("#define sampler1D   sampler2D\n");
      defs.concatf("#define NOSAMPLER1D   1\n");
      defs.concatf("#define NORMALIZER    (1.0 / 65535.0)\n");
      defs.concatf("#define USAMPLER2DARRAY usampler2DArray\n");
#elif defined(_GLES2)
      defs.concatf("#version 100\n");
      defs.concatf("#define GLSL_FLOAT_PRECISION   1\n");
      defs.concatf("#define NOSAMPLER1D   1\n");
      defs.concatf("#define NORMALIZER    (1.0 / 65535.0)\n");
      defs.concatf("#define USAMPLER2DARRAY usampler2DArray\n");
#else
      //defs.concatf("#version 110\n");
      //defs.concatf("#version 460\n");
      //defs.concatf("#version 450\n");
      defs.concatf("#version 430\n");
      defs.concatf("#define GLSL_FLOAT_PRECISION   0\n");
      defs.concatf("#define NOSAMPLER1D   0\n");
      defs.concatf("#define NORMALIZER    1.0\n");
      defs.concatf("#define USAMPLER2DARRAY sampler2DArray\n");
#endif
      return defs;
   }
}
