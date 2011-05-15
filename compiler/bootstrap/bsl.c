#include <stdio.h>

/* stdio.h */

FILE *bsl_stdin(void) {
   return stdin;
}
FILE *bsl_stdout(void) {
   return stdout;
}
FILE *bsl_stderr(void) {
   return stderr;
}
