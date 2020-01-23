#include <stdio.h>
#include <string.h>

#ifndef CODE_LOC_FIXED_LEN
#define CODE_LOC_FIXED_LEN 28
#endif
static char ___fixedLengthCodeLocation[256];
// note: this is not thread safe! there should be a language feature in eC? -- need a way to easily make this thread safe
char * ___getFixedLengthCodeLocation(const char * prefix, const char * file, const int line)
{
   int len = strlen(file);
   int pfxlen = strlen(prefix);
   const int colsize = CODE_LOC_FIXED_LEN - 8;
   const int n = (colsize >= 4 ? colsize : 4) + 1;
   const char _dots[4] = "...";
   const int dc = sizeof(_dots);
   const char * dots = &_dots[len >= n ? 0 : dc - 1];
   const char * str = &file[len >= n ? len - (n - dc) : 0];
   sprintf(___fixedLengthCodeLocation, "%s%s%*s", prefix, dots, len >= n ? n - dc : n - 1, str);
   sprintf(&___fixedLengthCodeLocation[pfxlen + colsize + 1], "%5d: ", line);
   ___fixedLengthCodeLocation[pfxlen + colsize] = ':';
   return ___fixedLengthCodeLocation;
}
