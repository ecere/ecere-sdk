#define __CONSOLE_APP__
#include "eC.h"

APP_INTRO(false)   // false for NOT linking libecere_c (only linking libeC_c)
{
   //eC_printLn(    // with -DECPRFX=eC_
   //F(printLn)(    // with macros (regardless of prefix)
   printLn(
      class_String,  "C"
#if 1
                     "(v.",
      class_int,     ({ int v = __STDC_VERSION__; &v; }),
      class_String,  ")"
#endif
                     ": Hello, eC!",
      null);
}
APP_OUTRO
