#define __CONSOLE_APP__
#include "eC.h"

APP_INTRO(0)
{
   printLn(CO(String), __STDC_VERSION__, null);
   printLn(CO(String), "C: Hello, eC!", null);
}
APP_OUTRO
