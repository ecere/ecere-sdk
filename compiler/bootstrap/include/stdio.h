#ifndef BSL_STDIO_H
#define BSL_STDIO_H

#include <stdlib.h>
#include <stdarg.h>

typedef void FILE;

#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2

#define EOF (-1)

#define stdin (bsl_stdin())
#define stdout (bsl_stdout())
#define stderr (bsl_stderr())

FILE *bsl_stdin(void);
FILE *bsl_stdout(void);
FILE *bsl_stderr(void);

char *fgets(char *s, int size, FILE *stream);
FILE *fopen(const char *path, const char *mode);
int fclose(FILE *fp);
int fflush(FILE *stream);
int fgetc(FILE *stream);
int fprintf(FILE *stream, const char *format, ...);
int fputc(int c, FILE *stream);
size_t fread(void *ptr, size_t size, size_t nmemb, FILE *stream);
size_t fwrite(const  void  *ptr,  size_t  size,  size_t  nmemb, FILE *stream);

int vsnprintf(char*, size_t, const char*, va_list args);
int snprintf(char *str, size_t, const char *format, ...);

int fseek(FILE *stream, long offset, int whence);
long ftell(FILE *stream);
int feof(FILE *stream);
int ferror(FILE *stream);
int fileno(FILE *stream);

/* Not required
void clearerr(FILE *stream);
int getchar(void);
int putchar(int c);
int ungetc(int c, FILE *stream);
int vfprintf(FILE *stream, const char *format, va_list ap);
int vprintf(const char *format, va_list ap);
*/

/* Defined in instance.ec
int sprintf(char *str, const char *format, ...);
int printf(const char *format, ...);
int vsprintf(char *str, const char *format, va_list ap);
int puts(const char *s);
int fputs(const char *s, FILE *stream);
int rename(const char *oldpath, const char *newpath);
*/
#endif
