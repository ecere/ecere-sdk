public import IMPORT_STATIC "ecere"

#include "gl123es.h"

class VersionedShader : Shader
{
   ZString getDefinitions(uint64 _state)
   {
      ZString defs { allocType = heap, minSize = 256 };

#if defined(_GLES2)
      //defs.concatf("#version 100\n");
      defs.concatf("#version 300 es\n");
      defs.concatf("#define GLSL_FLOAT_PRECISION   1\n");
      defs.concatf("precision highp float;\n"); // medium?
#else
      //defs.concatf("#version 110\n");
      //defs.concatf("#version 460\n");
      //defs.concatf("#version 450\n");
      defs.concatf("#version 430\n");
      defs.concatf("#define GLSL_FLOAT_PRECISION   0\n");
#endif
      return defs;
   }
}
