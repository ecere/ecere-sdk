/* Code generated from eC source file: instance.ec */
#if defined(_WIN32)
#define __runtimePlatform 1
#elif defined(__APPLE__)
#define __runtimePlatform 3
#else
#define __runtimePlatform 2
#endif
#if defined(__GNUC__) || defined(__clang__)
#if defined(__clang__) && defined(__WIN32__)
#define int64 long long
#define uint64 unsigned long long
#if defined(_WIN64)
#define ssize_t long long
#else
#define ssize_t long
#endif
#else
typedef long long int64;
typedef unsigned long long uint64;
#endif
#ifndef _WIN32
#define __declspec(x)
#endif
#elif defined(__TINYC__)
#include <stdarg.h>
#define __builtin_va_list va_list
#define __builtin_va_start va_start
#define __builtin_va_end va_end
#ifdef _WIN32
#define strcasecmp stricmp
#define strncasecmp strnicmp
#define __declspec(x) __attribute__((x))
#else
#define __declspec(x)
#endif
typedef long long int64;
typedef unsigned long long uint64;
#else
typedef __int64 int64;
typedef unsigned __int64 uint64;
#endif
#ifdef __BIG_ENDIAN__
#define __ENDIAN_PAD(x) (8 - (x))
#else
#define __ENDIAN_PAD(x) 0
#endif
#if defined(_WIN32)
#   if defined(__clang__) && defined(__WIN32__)
#      define ecere_stdcall __stdcall
#      define ecere_gcc_struct
#   elif defined(__GNUC__) || defined(__TINYC__)
#      define ecere_stdcall __attribute__((__stdcall__))
#      define ecere_gcc_struct __attribute__((gcc_struct))
#   else
#      define ecere_stdcall __stdcall
#      define ecere_gcc_struct
#   endif
#else
#   define ecere_stdcall
#   define ecere_gcc_struct
#endif
#include <stdint.h>
#include <sys/types.h>
void exit(int status);

void * calloc(size_t nmemb, size_t size);

void free(void * ptr);

void * malloc(size_t size);

void * realloc(void * ptr, size_t size);

long int strtol(const char * nptr, char ** endptr, int base);

long long int strtoll(const char * nptr, char ** endptr, int base);

unsigned long long int strtoull(const char * nptr, char ** endptr, int base);

typedef __builtin_va_list va_list;

typedef void FILE;

FILE * bsl_stdin(void);

FILE * bsl_stdout(void);

FILE * bsl_stderr(void);

char * fgets(char * s, int size, FILE * stream);

FILE * fopen(const char * path, const char * mode);

int fclose(FILE * fp);

int fflush(FILE * stream);

int fgetc(FILE * stream);

int fprintf(FILE * stream, const char * format, ...);

int fputc(int c, FILE * stream);

size_t fread(void * ptr, size_t size, size_t nmemb, FILE * stream);

size_t fwrite(const void * ptr, size_t size, size_t nmemb, FILE * stream);

int vsnprintf(char *, size_t, const char *, va_list args);

int snprintf(char * str, size_t, const char * format, ...);

int fseek(FILE * stream, long offset, int whence);

long ftell(FILE * stream);

int feof(FILE * stream);

int ferror(FILE * stream);

int fileno(FILE * stream);


void * __ecereNameSpace__ecere__com__eSystem_Renew(void * memory, unsigned int size);

void * __ecereNameSpace__ecere__com__eSystem_Renew0(void * memory, unsigned int size);

void * __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

void * __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

void __ecereNameSpace__ecere__com__eSystem_Delete(void * memory);

extern int __ecereVMethodID_class_OnGetDataFromString;

unsigned int Instance_LocateModule(const char * name, const char * fileName);

void Instance_COM_Initialize(int argc, char ** argv, char ** parsedCommand, int * argcPtr, const char *** argvPtr);

void System_SetArgs(int argc, char ** argv, int * argcPtr, const char *** argvPtr);

void * Instance_Module_Load(const char * libLocation, const char * name, void ** Load, void ** Unload);

void Instance_Module_Free(void * library);

void __ecereNameSpace__ecere__com__MemoryGuard_PushLoc(const char * loc)
{
}

void __ecereNameSpace__ecere__com__MemoryGuard_PopLoc()
{
}

struct __ecereNameSpace__ecere__com__DataValue
{
union
{
char c;
unsigned char uc;
short s;
unsigned short us;
int i;
unsigned int ui;
void * p;
float f;
double d;
long long i64;
uint64 ui64;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

static uint64 __ecereNameSpace__ecere__com__TOTAL_MEM = 0;

static uint64 __ecereNameSpace__ecere__com__OUTSIDE_MEM = 0;

static unsigned int __ecereNameSpace__ecere__com__log1_5i(unsigned int number)
{
unsigned int pos;
uint64 current = sizeof(void *);

for(pos = 0; pos < 31; pos++)
{
if(current >= number)
break;
current = current * 3 / 2;
if(current == 1)
current = 2;
if(current & 7)
current += 8 - (current & 7);
}
return pos;
}

static unsigned int __ecereNameSpace__ecere__com__pow1_5(unsigned int number)
{
unsigned int pos;
uint64 current = sizeof(void *);

for(pos = 0; pos < number; pos++)
{
current = current * 3 / 2;
if(current == 1)
current = 2;
if(current & 7)
current += 8 - (current & 7);
}
return (unsigned int)current;
}

static unsigned int __ecereNameSpace__ecere__com__pow1_5i(unsigned int number)
{
unsigned int pos;
uint64 current = sizeof(void *);

for(pos = 0; pos < 31; pos++)
{
if(current >= number)
return (unsigned int)current;
current = current * 3 / 2;
if(current == 1)
current = 2;
if(current & 7)
current += 8 - (current & 7);
}
return (unsigned int)current;
}

unsigned int __ecereNameSpace__ecere__com__log2i(unsigned int number)
{
unsigned int power;

for(power = 0; power < 32; power++)
if((1L << power) >= number)
break;
return power;
}

static unsigned int __ecereNameSpace__ecere__com__memoryInitialized = 0;

void __ecereNameSpace__ecere__com__CheckConsistency()
{
}

void __ecereNameSpace__ecere__com__CheckMemory()
{
}

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_next;

unsigned int __ecereNameSpace__ecere__com__DefaultFunction()
{
return 1;
}

char * strlwr(char * string)
{
int c;

for(c = 0; string[c]; c++)
if(string[c] >= 'A' && string[c] <= 'Z')
string[c] += 'a' - 'A';
return string;
}

char * strupr(char * string)
{
int c;

for(c = 0; string[c]; c++)
if(string[c] >= 'a' && string[c] <= 'z')
string[c] -= 'a' - 'A';
return string;
}

static const char * __ecereNameSpace__ecere__com__platformNames[4] =
{
"", "win32", "linux", "apple"
};

static const int __ecereNameSpace__ecere__com__firstPlatform = 1;

static const int __ecereNameSpace__ecere__com__lastPlatform = 3;

extern int runtimePlatform;

unsigned int __ecereNameSpace__ecere__com__poolingDisabled;



unsigned int ccUtf8ToUnicode(unsigned int byte, unsigned int * state, unsigned int * retunicode);

int __ecereNameSpace__ecere__sys__ISO8859_1toUTF8(const char * source, char * dest, int max)
{
int c;
int d = 0;
unsigned char * byteDest = (unsigned char *)dest;

for(c = 0; source[c]; c++)
{
unsigned int ch = ((unsigned char *)source)[c];

switch(ch)
{
case 128:
ch = 0x20AC;
break;
case 130:
ch = 0x201A;
break;
case 131:
ch = 0x0192;
break;
case 132:
ch = 0x201E;
break;
case 133:
ch = 0x2026;
break;
case 134:
ch = 0x2020;
break;
case 135:
ch = 0x2021;
break;
case 136:
ch = 0x02C6;
break;
case 137:
ch = 0x2030;
break;
case 138:
ch = 0x0160;
break;
case 139:
ch = 0x2039;
break;
case 140:
ch = 0x0152;
break;
case 142:
ch = 0x017D;
break;
case 145:
ch = 0x2018;
break;
case 146:
ch = 0x2019;
break;
case 147:
ch = 0x201C;
break;
case 148:
ch = 0x201D;
break;
case 149:
ch = 0x2022;
break;
case 150:
ch = 0x2013;
break;
case 151:
ch = 0x2014;
break;
case 152:
ch = 0x02DC;
break;
case 153:
ch = 0x2122;
break;
case 154:
ch = 0x0161;
break;
case 155:
ch = 0x203A;
break;
case 156:
ch = 0x0153;
break;
case 158:
ch = 0x017E;
break;
case 159:
ch = 0x0178;
break;
}
if(ch < 0x80)
{
if(d + 1 >= max)
break;
byteDest[d++] = (char)ch;
}
else if(ch < 0x800)
{
if(d + 2 >= max)
break;
byteDest[d++] = 0xC0 | (unsigned char)((ch & 0x7C0) >> 6);
byteDest[d++] = 0x80 | (unsigned char)(ch & 0x03F);
}
else if(ch < 0x10000)
{
if(d + 3 >= max)
break;
byteDest[d++] = 0xE0 | (unsigned char)((ch & 0xF000) >> 12);
byteDest[d++] = 0x80 | (unsigned char)((ch & 0xFC0) >> 6);
byteDest[d++] = 0x80 | (unsigned char)(ch & 0x03F);
}
else
{
if(d + 4 >= max)
break;
byteDest[d++] = 0xF0 | (unsigned char)((ch & 0x1C0000) >> 18);
byteDest[d++] = 0x80 | (unsigned char)((ch & 0x3F000) >> 12);
byteDest[d++] = 0x80 | (unsigned char)((ch & 0xFC0) >> 6);
byteDest[d++] = 0x80 | (unsigned char)(ch & 0x03F);
}
}
dest[d] = 0;
return d;
}

int __ecereNameSpace__ecere__sys__UTF16toUTF8Buffer(const unsigned short * source, char * dest, int max)
{
int c;
int d = 0;
unsigned short u16;
unsigned char * byteDest = (unsigned char *)dest;

for(c = 0; (u16 = source[c]); c++)
{
unsigned int ch;

if(u16 < 0xD800 || u16 > 0xDBFF)
ch = u16;
else
ch = (u16 << 10) + source[c++] + (0x10000 - (0xD800 << 10) - 0xDC00);
if(ch < 0x80)
{
if(d + 1 >= max)
break;
byteDest[d++] = (char)ch;
}
else if(ch < 0x800)
{
if(d + 2 >= max)
break;
byteDest[d++] = 0xC0 | (unsigned char)((ch & 0x7C0) >> 6);
byteDest[d++] = 0x80 | (unsigned char)(ch & 0x03F);
}
else if(ch < 0x10000)
{
if(d + 3 >= max)
break;
byteDest[d++] = 0xE0 | (unsigned char)((ch & 0xF000) >> 12);
byteDest[d++] = 0x80 | (unsigned char)((ch & 0xFC0) >> 6);
byteDest[d++] = 0x80 | (unsigned char)(ch & 0x03F);
}
else
{
if(d + 4 >= max)
break;
byteDest[d++] = 0xF0 | (unsigned char)((ch & 0x1C0000) >> 18);
byteDest[d++] = 0x80 | (unsigned char)((ch & 0x3F000) >> 12);
byteDest[d++] = 0x80 | (unsigned char)((ch & 0xFC0) >> 6);
byteDest[d++] = 0x80 | (unsigned char)(ch & 0x03F);
}
}
byteDest[d] = 0;
return d;
}

unsigned int __ecereNameSpace__ecere__sys__UTF8GetChar(const char * string, int * numBytes)
{
unsigned int ch;
unsigned char b = ((unsigned char *)string)[0];
int i;
unsigned char mask = 0x7F;
int nb = b ? 1 : 0;

ch = 0;
if(b & 0x80)
{
if(b & 0x40)
{
mask >>= 2;
nb++;
if(b & 0x20)
{
nb++;
mask >>= 1;
if(b & 0x10)
{
if(b & 0x08)
{
nb = 0;
}
nb++;
mask >>= 1;
}
}
}
else
nb = 0;
}
for(i = 0; i < nb; i++)
{
ch <<= 6;
ch |= (b = ((unsigned char *)string)[i]) & mask;
mask = 0x3F;
if(i > 1 && (!(b & 0x80) || (b & 0x40)))
{
nb = 0;
ch = 0;
}
}
if(i < nb || ch > 0x10FFFF || (ch >= 0xD800 && ch <= 0xDFFF) || (ch < 0x80 && nb > 1) || (ch < 0x800 && nb > 2) || (ch < 0x10000 && nb > 3))
{
ch = 0;
nb = 0;
}
if(numBytes)
*numBytes = nb;
return ch;
}

int __ecereNameSpace__ecere__sys__UTF8toUTF16Buffer(const char * source, unsigned short * dest, int max)
{
if(source)
{
int c;
int d = 0;

for(c = 0; source[c]; )
{
unsigned char ch = source[c];
unsigned int codePoint = 0;
int numBytes = 1;
int i;
unsigned char mask = 0x7F;

if(ch & 0x80 && ch & 0x40)
{
mask >>= 2;
numBytes++;
if(ch & 0x20)
{
numBytes++;
mask >>= 1;
if(ch & 0x10)
{
numBytes++;
mask >>= 1;
}
}
}
for(i = 0; i < numBytes; i++)
{
codePoint <<= 6;
codePoint |= source[c++] & mask;
mask = 0x3F;
}
if(codePoint > 0xFFFF)
{
unsigned short lead = (unsigned short)((0xD800 - (0x10000 >> 10)) + (codePoint >> 10));
unsigned short trail = (unsigned short)(0xDC00 | (codePoint & 0x3FF));

if(d >= max - 1)
break;
dest[d++] = lead;
dest[d++] = trail;
}
else
{
if(d >= max)
break;
dest[d++] = (unsigned short)codePoint;
}
}
dest[d] = 0;
return d;
}
return 0;
}

int __ecereNameSpace__ecere__sys__UTF32toUTF8Len(const unsigned int * source, int count, char * dest, int max)
{
int c;
int d = 0;
unsigned int ch;
unsigned char * byteDest = (unsigned char *)dest;

for(c = 0; c < count && (ch = source[c]); c++)
{
if(ch < 0x80)
{
if(d + 1 >= max)
break;
byteDest[d++] = (char)ch;
}
else if(ch < 0x800)
{
if(d + 2 >= max)
break;
byteDest[d++] = 0xC0 | (unsigned char)((ch & 0x7C0) >> 6);
byteDest[d++] = 0x80 | (unsigned char)(ch & 0x03F);
}
else if(ch < 0x10000)
{
if(d + 3 >= max)
break;
byteDest[d++] = 0xE0 | (unsigned char)((ch & 0xF000) >> 12);
byteDest[d++] = 0x80 | (unsigned char)((ch & 0xFC0) >> 6);
byteDest[d++] = 0x80 | (unsigned char)(ch & 0x03F);
}
else
{
if(d + 4 >= max)
break;
byteDest[d++] = 0xF0 | (unsigned char)((ch & 0x1C0000) >> 18);
byteDest[d++] = 0x80 | (unsigned char)((ch & 0x3F000) >> 12);
byteDest[d++] = 0x80 | (unsigned char)((ch & 0xFC0) >> 6);
byteDest[d++] = 0x80 | (unsigned char)(ch & 0x03F);
}
}
byteDest[d] = 0;
return d;
}

void __ecereNameSpace__ecere__com__queryMemInfo(char * string)
{
}

void __ecereNameSpace__ecere__com__eSystem_LockMem()
{
}

void __ecereNameSpace__ecere__com__eSystem_UnlockMem()
{
}

struct __ecereNameSpace__ecere__sys__OldList
{
void *  first;
void *  last;
int count;
unsigned int offset;
unsigned int circ;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__SerialBuffer
{
unsigned char *  _buffer;
size_t count;
size_t _size;
size_t pos;
} ecere_gcc_struct;

extern void *  memset(void *  area, int value, size_t count);

extern void *  memcpy(void * , const void * , size_t size);

extern char *  strchr(const char * , int);

extern char *  __ecereNameSpace__ecere__sys__CopyString(const char *  string);

extern void *  memmove(void * , const void * , size_t size);

extern int strcmp(const char * , const char * );

extern char *  strncpy(char * , const char * , size_t n);

extern char *  __ecereNameSpace__ecere__sys__RSearchString(const char *  buffer, const char *  subStr, int maxLen, unsigned int matchCase, unsigned int matchWord);

extern size_t strlen(const char * );

extern int printf(const char * , ...);

extern char *  strcpy(char * , const char * );

extern char *  strstr(const char * , const char * );

extern int isspace(int c);

extern int strncmp(const char * , const char * , size_t n);

extern char *  strcat(char * , const char * );

extern char *  __ecereNameSpace__ecere__sys__TrimRSpaces(const char *  string, char *  output);

extern unsigned long strtoul(const char *  nptr, char * *  endptr, int base);

extern double strtod(const char * , char * * );

extern int sprintf(char * , const char * , ...);

extern char *  __ecereNameSpace__ecere__sys__GetLastDirectory(const char *  string, char *  output);

extern char *  __ecereNameSpace__ecere__sys__GetExtension(const char *  string, char *  output);

extern unsigned int __ecereNameSpace__ecere__sys__StripExtension(char *  string);

extern int strcasecmp(const char * , const char * );

extern double sin(double number);

extern double sinh(double number);

extern double cosh(double number);

extern double tanh(double number);

extern double sqrt(double number);

extern double cos(double number);

extern double tan(double number);

extern double atan2(double y, double x);

extern double asin(double number);

extern double acos(double number);

extern double atan(double number);

extern double asinh(double number);

extern double acosh(double number);

extern double atanh(double number);

extern double pow(double number, double number2);

extern double fmod(double x, double y);

extern double fabs(double number);

extern double log(double number);

extern double log10(double number);

extern double ceil(double number);

extern double floor(double number);

extern double exp(double number);

extern void qsort(void * , size_t, size_t, int (* )(void * , void * ));

extern int system(const char * );

extern int atoi(const char * );

extern double atof(const char * );

extern char *  getenv(const char *  name);

extern int rename(const char *  oldpath, const char *  newpath);

extern char *  strncat(char * , const char * , size_t n);

extern size_t strspn(const char * , const char * );

extern size_t strcspn(const char * , const char * );

extern char *  strpbrk(const char * , const char * );

extern int strncasecmp(const char * , const char * , size_t n);

extern int memcmp(const void * , const void * , size_t size);

extern int vsprintf(char * , const char * , __builtin_va_list);

extern int puts(const char * );

extern int fputs(const char * , void *  stream);

extern int tolower(int);

extern int toupper(int);

extern unsigned int isdigit(int);

extern unsigned int isxdigit(int);

extern int isalnum(int c);

extern int isalpha(int c);

extern int islower(int c);

extern int isupper(int c);

extern int isprint(int c);

extern int isblank(int c);

extern int __ecereVMethodID_class_OnGetString;

const char *  __ecereProp___ecereNameSpace__ecere__com__Platform_Get_char__PTR_(int this);

int __ecereProp___ecereNameSpace__ecere__com__Platform_Set_char__PTR_(const char *  value);

char * __ecereNameSpace__ecere__sys__UTF16toUTF8(const unsigned short * source)
{
int c;
int d = 0;
int len;
unsigned char * dest;
unsigned short u16;
unsigned int invert = 0;

for(len = 0; source[len]; len++)
;
dest = __ecereNameSpace__ecere__com__eSystem_New(sizeof(unsigned char) * (len * 3 + 1));
for(c = 0; (u16 = source[c]); c++)
{
unsigned int ch;

if(!c && (u16 == 0xFFFE || u16 == 0xFEFF))
{
if(u16 == 0xFFFE)
invert = 1;
continue;
}
if(invert)
{
u16 = ((u16 & 0xFF00) >> 8) | ((u16 & 0x00FF) << 8);
}
if(u16 < 0xD800 || u16 > 0xDBFF)
ch = u16;
else
ch = (u16 << 10) + source[c++] + (0x10000 - (0xD800 << 10) - 0xDC00);
if(ch < 0x80)
{
dest[d++] = (char)ch;
}
else if(ch < 0x800)
{
dest[d++] = 0xC0 | (unsigned char)((ch & 0x7C0) >> 6);
dest[d++] = 0x80 | (unsigned char)(ch & 0x03F);
}
else if(ch < 0x10000)
{
dest[d++] = 0xE0 | (unsigned char)((ch & 0xF000) >> 12);
dest[d++] = 0x80 | (unsigned char)((ch & 0xFC0) >> 6);
dest[d++] = 0x80 | (unsigned char)(ch & 0x03F);
}
else
{
dest[d++] = 0xF0 | (unsigned char)((ch & 0x1C0000) >> 18);
dest[d++] = 0x80 | (unsigned char)((ch & 0x3F000) >> 12);
dest[d++] = 0x80 | (unsigned char)((ch & 0xFC0) >> 6);
dest[d++] = 0x80 | (unsigned char)(ch & 0x03F);
}
}
dest[d] = 0;
dest = __ecereNameSpace__ecere__com__eSystem_Renew(dest, sizeof(unsigned char) * (d + 1));
return (char *)dest;
}

unsigned int __ecereNameSpace__ecere__com__LocateModule(const char * name, const char * fileName)
{
return Instance_LocateModule(name, fileName);
}

unsigned int __ecereNameSpace__ecere__com__pow2i(unsigned int number)
{
return 1 << __ecereNameSpace__ecere__com__log2i(number);
}

int __ecereNameSpace__ecere__com__GetRuntimePlatform()
{
return runtimePlatform;
}

void __ecereNameSpace__ecere__com__eSystem_SetPoolingDisabled(unsigned int disabled)
{
__ecereNameSpace__ecere__com__poolingDisabled = disabled;
}

static inline unsigned int __ecereNameSpace__ecere__sys__decodeUTF8(unsigned int b, unsigned int * state, unsigned int * retCodePoint)
{
return ccUtf8ToUnicode(b, state, retCodePoint);
}

struct __ecereNameSpace__ecere__com__EnumClassData
{
struct __ecereNameSpace__ecere__sys__OldList values;
long long largest;
} ecere_gcc_struct;

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(struct __ecereNameSpace__ecere__sys__OldList * this, void *  prevItem, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(struct __ecereNameSpace__ecere__sys__OldList * this, void (*  freeFn)(void * ));

void __ecereNameSpace__ecere__com__memswap(unsigned char * a, unsigned char * b, unsigned int size)
{
unsigned int c;
unsigned char buffer[1024];

for(c = 0; c < size; )
{
int s = sizeof (buffer);

if(c + s > size)
s = size - c;
memcpy(buffer, a + c, s);
memcpy(a + c, b + c, s);
memcpy(b + c, buffer, s);
c += s;
}
}

unsigned short * __ecereNameSpace__ecere__sys__UTF8toUTF16(const char * source, int * wordCount)
{
if(source)
{
int len = (int)strlen(source);
unsigned short * dest = __ecereNameSpace__ecere__com__eSystem_New(sizeof(unsigned short) * (len + 1));
int c;
int d = 0;

for(c = 0; source[c]; )
{
unsigned char ch = source[c];
unsigned int codePoint = 0;
int numBytes = 1;
int i;
unsigned char mask = 0x7F;

if(ch & 0x80 && ch & 0x40)
{
mask >>= 2;
numBytes++;
if(ch & 0x20)
{
numBytes++;
mask >>= 1;
if(ch & 0x10)
{
numBytes++;
mask >>= 1;
}
}
}
for(i = 0; i < numBytes; i++)
{
codePoint <<= 6;
codePoint |= source[c++] & mask;
mask = 0x3F;
}
if(codePoint > 0xFFFF)
{
unsigned short lead = (unsigned short)((0xD800 - (0x10000 >> 10)) + (codePoint >> 10));
unsigned short trail = (unsigned short)(0xDC00 | (codePoint & 0x3FF));

dest[d++] = lead;
dest[d++] = trail;
}
else
{
dest[d++] = (unsigned short)codePoint;
}
}
dest[d] = 0;
if(wordCount)
*wordCount = d;
return dest;
}
return (((void *)0));
}

long long __ecereNameSpace__ecere__com___strtoi64(const char * string, const char ** endString, int base)
{
long long value = 0;
int sign = 1;
int c;
char ch;

for(c = 0; (ch = string[c]) && isspace(ch); c++)
;
if(ch == '+')
c++;
else if(ch == '-')
{
sign = -1;
c++;
}
;
if(!base)
{
if(ch == '0' && string[c + 1] == 'x')
{
base = 16;
c += 2;
}
else if(ch == '0')
{
base = 8;
c++;
}
else
base = 10;
}
for(; (ch = string[c]); c++)
{
if(ch >= '0' && ch <= '9')
ch -= '0';
else if(ch >= 'a' && ch <= 'z')
ch -= ('a' - 10);
else if(ch >= 'A' && ch <= 'Z')
ch -= ('A' - 10);
else
break;
if(ch < base)
{
value *= base;
value += ch;
}
else
break;
}
if(endString)
*endString = string + c;
return sign * value;
}

uint64 __ecereNameSpace__ecere__com___strtoui64(const char * string, const char ** endString, int base)
{
uint64 value = 0;
int sign = 1;
int c;
char ch;

for(c = 0; (ch = string[c]) && isspace(ch); c++)
;
if(ch == '+')
c++;
else if(ch == '-')
{
sign = -1;
c++;
}
;
if(!base)
{
if(ch == '0' && string[c + 1] == 'x')
{
base = 16;
c += 2;
}
else if(ch == '0')
{
base = 8;
c++;
}
else
base = 10;
}
for(; (ch = string[c]); c++)
{
if(ch >= '0' && ch <= '9')
ch -= '0';
else if(ch >= 'a' && ch <= 'z')
ch -= ('a' - 10);
else if(ch >= 'A' && ch <= 'Z')
ch -= ('A' - 10);
else
break;
if(ch < base)
{
value *= base;
value += ch;
}
else
break;
}
if(endString)
*endString = string + c;
return sign * value;
}

int __ecereProp___ecereNameSpace__ecere__com__Platform_Set_char__PTR_(const char *  value)
{
if(value)
{
int c;

for(c = __ecereNameSpace__ecere__com__firstPlatform; c <= __ecereNameSpace__ecere__com__lastPlatform; c++)
if(!strcasecmp(value, __ecereNameSpace__ecere__com__platformNames[c]))
return c;
}
return 0;
}

unsigned int __ecereNameSpace__ecere__sys__UTF8Validate(const char * source)
{
if(source)
{
const unsigned char * s = (const unsigned char *)source;
unsigned int codepoint;
unsigned int state = 0;

while(*s)
__ecereNameSpace__ecere__sys__decodeUTF8(*s++, &state, &codepoint);
return state == 0;
}
return 1;
}

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} ecere_gcc_struct;

void * __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

struct __ecereNameSpace__ecere__com__DesignerBase
{
struct __ecereNameSpace__ecere__com__Instance * classDesigner;
const char * objectClass;
unsigned int isDragging;
} ecere_gcc_struct;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_Reset;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_AddObject;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_DestroyObject;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_CreateNew;

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, const void * data);

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * *  data);

extern int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_FindObject;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_AddToolBoxClass;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_AddDefaultMethod;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_ModifyCode;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_UpdateProperties;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_ListToolBoxClasses;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_PrepareTestObject;

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Get_classDesigner(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Set_classDesigner(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * value);

const char *  __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Get_objectClass(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Set_objectClass(struct __ecereNameSpace__ecere__com__Instance * this, const char *  value);

unsigned int __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Get_isDragging(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Set_isDragging(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value);

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__activeDesigner;

void __ecereNameSpace__ecere__com__SetActiveDesigner(struct __ecereNameSpace__ecere__com__Instance * designer)
{
__ecereNameSpace__ecere__com__activeDesigner = designer;
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__GetActiveDesigner()
{
return __ecereNameSpace__ecere__com__activeDesigner;
}

struct __ecereNameSpace__ecere__com__BTNamedLink;

struct __ecereNameSpace__ecere__com__BTNamedLink
{
const char * name;
struct __ecereNameSpace__ecere__com__BTNamedLink * parent, * left, * right;
int depth;
void * data;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__SelfWatcher;

struct __ecereNameSpace__ecere__com__Property;

struct __ecereNameSpace__ecere__com__Property
{
struct __ecereNameSpace__ecere__com__Property * prev, * next;
const char * name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
const char * dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
struct __ecereNameSpace__ecere__com__Instance * dataType;
void (* Set)(void *, int);
int (* Get)(void *);
unsigned int (* IsSet)(void *);
void * data;
void * symbol;
int vid;
unsigned int conversion;
unsigned int watcherOffset;
const char * category;
unsigned int compiled;
unsigned int selfWatchable, isWatchable;
} ecere_gcc_struct;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_FixProperty;

void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

struct __ecereNameSpace__ecere__com__SelfWatcher
{
struct __ecereNameSpace__ecere__com__SelfWatcher * prev, * next;
void (* callback)(void *);
struct __ecereNameSpace__ecere__com__Property * _property;
} ecere_gcc_struct;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Class_char__PTR_, * __ecerePropM___ecereNameSpace__ecere__com__Class_char__PTR_;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Platform_char__PTR_, * __ecerePropM___ecereNameSpace__ecere__com__Platform_char__PTR_;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__DesignerBase_classDesigner, * __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_classDesigner;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__DesignerBase_objectClass, * __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_objectClass;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__DesignerBase_isDragging, * __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_isDragging;

struct __ecereNameSpace__ecere__com__DefinedExpression;

struct __ecereNameSpace__ecere__com__MemBlock;

struct __ecereNameSpace__ecere__com__BlockPool
{
struct __ecereNameSpace__ecere__com__MemBlock * first, * last;
struct __ecereNameSpace__ecere__com__MemBlock * free;
unsigned int blockSize;
unsigned int blockSpace;
int numParts;
int numBlocks;
unsigned int totalSize;
unsigned int usedSpace;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__MemPart
{
void * memory;
int blocksUsed;
int size;
struct __ecereNameSpace__ecere__com__BlockPool * pool;
} ecere_gcc_struct;

static struct __ecereNameSpace__ecere__com__BlockPool * __ecereNameSpace__ecere__com__pools;

struct __ecereNameSpace__ecere__com__MemBlock
{
struct __ecereNameSpace__ecere__com__MemBlock * prev, * next;
struct __ecereNameSpace__ecere__com__MemPart * part;
unsigned int size;
} ecere_gcc_struct;

unsigned int __ecereMethod___ecereNameSpace__ecere__com__BlockPool_Expand(struct __ecereNameSpace__ecere__com__BlockPool * this, unsigned int numBlocks)
{
unsigned char * memory = malloc((size_t)numBlocks * this->blockSpace);

__ecereNameSpace__ecere__com__TOTAL_MEM += (uint64)numBlocks * this->blockSpace;
if(memory)
{
int c;
struct __ecereNameSpace__ecere__com__MemBlock * block = (struct __ecereNameSpace__ecere__com__MemBlock *)memory;
struct __ecereNameSpace__ecere__com__MemPart * part = calloc(1, sizeof(struct __ecereNameSpace__ecere__com__MemPart));

__ecereNameSpace__ecere__com__TOTAL_MEM += sizeof(struct __ecereNameSpace__ecere__com__MemPart);
this->free = block;
for(c = 0; c < numBlocks - 1; c++)
{
block->part = part;
block->prev = (((void *)0));
block->next = (struct __ecereNameSpace__ecere__com__MemBlock *)((unsigned char *)block + this->blockSpace);
block = block->next;
}
part->blocksUsed = 0;
part->pool = this;
part->memory = memory;
part->size = numBlocks;
block->part = part;
block->prev = (((void *)0));
block->next = (((void *)0));
this->totalSize += numBlocks;
this->numParts++;
return 1;
}
return 0;
}

void __ecereMethod___ecereNameSpace__ecere__com__BlockPool_Remove(struct __ecereNameSpace__ecere__com__BlockPool * this, struct __ecereNameSpace__ecere__com__MemBlock * block)
{
struct __ecereNameSpace__ecere__com__MemPart * part = block->part;

if(block->prev)
block->prev->next = block->next;
if(block->next)
block->next->prev = block->prev;
if(this->first == block)
this->first = block->next;
if(this->last == block)
this->last = block->prev;
block->next = this->free;
this->free = block;
part->blocksUsed--;
this->numBlocks--;
(*part->pool).usedSpace -= block->size;
if(!part->blocksUsed && this->numBlocks && this->totalSize > this->numBlocks + this->numBlocks / 2)
{
struct __ecereNameSpace__ecere__com__MemBlock * next = this->free, * prev = (((void *)0));

this->free = (((void *)0));
this->totalSize -= part->size;
while(next)
{
if(next->part != part)
{
if(prev)
prev->next = next;
else
this->free = next;
prev = next;
}
next = next->next;
}
;
if(prev)
prev->next = (((void *)0));
__ecereNameSpace__ecere__com__TOTAL_MEM -= (uint64)part->size * this->blockSpace;
__ecereNameSpace__ecere__com__TOTAL_MEM -= sizeof(struct __ecereNameSpace__ecere__com__MemPart);
this->numParts--;
free(part->memory);
free(part);
}
}

struct __ecereNameSpace__ecere__com__MemBlock * __ecereMethod___ecereNameSpace__ecere__com__BlockPool_Add(struct __ecereNameSpace__ecere__com__BlockPool * this)
{
int __simpleStruct0;
struct __ecereNameSpace__ecere__com__MemBlock * block = (((void *)0));

if(!this->free)
__ecereMethod___ecereNameSpace__ecere__com__BlockPool_Expand(this, (__simpleStruct0 = this->numBlocks / 2, (1 > __simpleStruct0) ? 1 : __simpleStruct0));
if(this->free)
{
block = this->free;
block->prev = this->last;
if(block->prev)
block->prev->next = block;
if(!this->first)
this->first = block;
this->last = block;
this->free = block->next;
block->next = (((void *)0));
block->part->blocksUsed++;
this->numBlocks++;
}
return block;
}

static void __ecereNameSpace__ecere__com__InitMemory()
{
int c;

__ecereNameSpace__ecere__com__memoryInitialized = 1;
__ecereNameSpace__ecere__com__pools = calloc(1, sizeof(struct __ecereNameSpace__ecere__com__BlockPool) * 31);
for(c = 0; c < 31; c++)
{
int expansion;

__ecereNameSpace__ecere__com__pools[c].blockSize = __ecereNameSpace__ecere__com__pow1_5(c);
if(__ecereNameSpace__ecere__com__pools[c].blockSize % sizeof(void *))
__ecereNameSpace__ecere__com__pools[c].blockSize += sizeof(void *) - (__ecereNameSpace__ecere__com__pools[c].blockSize % sizeof(void *));
__ecereNameSpace__ecere__com__pools[c].blockSpace = __ecereNameSpace__ecere__com__pools[c].blockSize;
__ecereNameSpace__ecere__com__pools[c].blockSpace += sizeof(struct __ecereNameSpace__ecere__com__MemBlock);
expansion = (__ecereNameSpace__ecere__com__pools[c].blockSize < 128) ? 1024 : (131072 / __ecereNameSpace__ecere__com__pools[c].blockSize);
if(c < 12)
__ecereMethod___ecereNameSpace__ecere__com__BlockPool_Expand(&__ecereNameSpace__ecere__com__pools[c], ((1 > expansion) ? 1 : expansion));
}
}

static void __ecereNameSpace__ecere__com___myfree(void * pointer)
{
if(pointer)
{
struct __ecereNameSpace__ecere__com__MemBlock * block = (struct __ecereNameSpace__ecere__com__MemBlock *)((unsigned char *)pointer - sizeof(struct __ecereNameSpace__ecere__com__MemBlock));
struct __ecereNameSpace__ecere__com__MemPart * part = block->part;
struct __ecereNameSpace__ecere__com__BlockPool * pool = part ? part->pool : (((void *)0));

if(pool)
{
__ecereMethod___ecereNameSpace__ecere__com__BlockPool_Remove((&*pool), block);
}
else
{
__ecereNameSpace__ecere__com__TOTAL_MEM -= sizeof(struct __ecereNameSpace__ecere__com__MemBlock) + block->size;
__ecereNameSpace__ecere__com__OUTSIDE_MEM -= sizeof(struct __ecereNameSpace__ecere__com__MemBlock) + block->size;
free(block);
}
}
}

static void * __ecereNameSpace__ecere__com___mymalloc(unsigned int size)
{
struct __ecereNameSpace__ecere__com__MemBlock * block = (((void *)0));

if(size)
{
unsigned int p = __ecereNameSpace__ecere__com__log1_5i(size);

if(!__ecereNameSpace__ecere__com__memoryInitialized)
__ecereNameSpace__ecere__com__InitMemory();
if(!__ecereNameSpace__ecere__com__poolingDisabled && p < 31)
{
block = __ecereMethod___ecereNameSpace__ecere__com__BlockPool_Add(&__ecereNameSpace__ecere__com__pools[p]);
if(block)
{
block->size = size;
__ecereNameSpace__ecere__com__pools[p].usedSpace += size;
}
}
else
{
block = malloc(sizeof(struct __ecereNameSpace__ecere__com__MemBlock) + size);
if(block)
{
__ecereNameSpace__ecere__com__TOTAL_MEM += sizeof(struct __ecereNameSpace__ecere__com__MemBlock) + size;
__ecereNameSpace__ecere__com__OUTSIDE_MEM += sizeof(struct __ecereNameSpace__ecere__com__MemBlock) + size;
block->part = (((void *)0));
block->size = size;
}
}
}
return block ? ((struct __ecereNameSpace__ecere__com__MemBlock *)block + 1) : (((void *)0));
}

static void __ecereNameSpace__ecere__com___free(void * pointer)
{
if(pointer)
{
__ecereNameSpace__ecere__com___myfree(pointer);
}
}

static void * __ecereNameSpace__ecere__com___mycalloc(int n, unsigned int size)
{
void * pointer = __ecereNameSpace__ecere__com___mymalloc(n * size);

if(pointer)
memset(pointer, 0, n * size);
return pointer;
}

static void * __ecereNameSpace__ecere__com___myrealloc(void * pointer, unsigned int size)
{
struct __ecereNameSpace__ecere__com__MemBlock * block = pointer ? ((struct __ecereNameSpace__ecere__com__MemBlock *)((unsigned char *)pointer - sizeof(struct __ecereNameSpace__ecere__com__MemBlock))) : (((void *)0));
void * newPointer = (((void *)0));
struct __ecereNameSpace__ecere__com__MemPart * part = block ? block->part : (((void *)0));
struct __ecereNameSpace__ecere__com__BlockPool * pool = part ? part->pool : (((void *)0));

if(block)
{
if(pool)
{
unsigned int ns = __ecereNameSpace__ecere__com__pow1_5i(size);
unsigned int mod = ns % sizeof(void *);

if(mod)
ns += sizeof(void *) - mod;
if(ns == (*pool).blockSize)
{
newPointer = pointer;
(*pool).usedSpace += size - block->size;
block->size = size;
}
}
else if(size)
{
struct __ecereNameSpace__ecere__com__MemBlock * newBlock = realloc(block, sizeof(struct __ecereNameSpace__ecere__com__MemBlock) + size);

if(newBlock)
{
__ecereNameSpace__ecere__com__TOTAL_MEM += size - newBlock->size;
__ecereNameSpace__ecere__com__OUTSIDE_MEM += size - newBlock->size;
newPointer = ((struct __ecereNameSpace__ecere__com__MemBlock *)newBlock + 1);
newBlock->size = size;
}
}
}
if(!newPointer)
{
newPointer = __ecereNameSpace__ecere__com___mymalloc(size);
if(pointer && newPointer)
{
unsigned int __simpleStruct0;

memcpy(newPointer, pointer, (__simpleStruct0 = block->size, (size < __simpleStruct0) ? size : __simpleStruct0));
__ecereNameSpace__ecere__com___myfree(pointer);
}
}
return newPointer;
}

static void * __ecereNameSpace__ecere__com___mycrealloc(void * pointer, unsigned int size)
{
struct __ecereNameSpace__ecere__com__MemBlock * block = pointer ? ((struct __ecereNameSpace__ecere__com__MemBlock *)((unsigned char *)pointer - sizeof(struct __ecereNameSpace__ecere__com__MemBlock))) : (((void *)0));
void * newPointer = (((void *)0));
struct __ecereNameSpace__ecere__com__MemPart * part = block ? block->part : (((void *)0));
struct __ecereNameSpace__ecere__com__BlockPool * pool = part ? part->pool : (((void *)0));

if(block)
{
if(pool)
{
unsigned int ns = __ecereNameSpace__ecere__com__pow1_5i(size);
unsigned int mod = ns % sizeof(void *);

if(mod)
ns += sizeof(void *) - mod;
if(ns == (*pool).blockSize)
{
int extra = size - block->size;

newPointer = pointer;
(*pool).usedSpace += extra;
if(extra > 0)
memset((unsigned char *)pointer + block->size, 0, extra);
block->size = size;
}
}
else if(size)
{
struct __ecereNameSpace__ecere__com__MemBlock * newBlock = realloc(block, sizeof(struct __ecereNameSpace__ecere__com__MemBlock) + size);

if(newBlock)
{
int extra = size - newBlock->size;

__ecereNameSpace__ecere__com__TOTAL_MEM += extra;
__ecereNameSpace__ecere__com__OUTSIDE_MEM += extra;
newPointer = ((struct __ecereNameSpace__ecere__com__MemBlock *)newBlock + 1);
if(extra > 0)
memset((unsigned char *)newPointer + newBlock->size, 0, extra);
newBlock->size = size;
}
}
}
if(!newPointer)
{
newPointer = __ecereNameSpace__ecere__com___mymalloc(size);
if(newPointer)
{
if(pointer)
{
unsigned int __simpleStruct0;

memcpy(newPointer, pointer, (__simpleStruct0 = block->size, (size < __simpleStruct0) ? size : __simpleStruct0));
if(size > block->size)
memset((unsigned char *)newPointer + block->size, 0, size - block->size);
__ecereNameSpace__ecere__com___myfree(pointer);
}
else
memset((unsigned char *)newPointer, 0, size);
}
}
return newPointer;
}

static void * __ecereNameSpace__ecere__com___malloc(unsigned int size)
{
void * pointer;

pointer = size ? __ecereNameSpace__ecere__com___mymalloc(size + 2 * 0) : (((void *)0));
return pointer ? ((unsigned char *)pointer + 0) : (((void *)0));
}

void __ecereNameSpace__ecere__com__eSystem_Delete(void * memory)
{
if(memory)
__ecereNameSpace__ecere__com___free(memory);
}

static void * __ecereNameSpace__ecere__com___calloc(int n, unsigned int size)
{
void * pointer;

pointer = n && size ? __ecereNameSpace__ecere__com___mycalloc(1, n * size + 2 * 0) : (((void *)0));
return pointer ? ((unsigned char *)pointer + 0) : (((void *)0));
}

static void * __ecereNameSpace__ecere__com___realloc(void * pointer, unsigned int size)
{
if(!size)
{
__ecereNameSpace__ecere__com___free(pointer);
return (((void *)0));
}
pointer = __ecereNameSpace__ecere__com___myrealloc(pointer, size);
return pointer ? ((unsigned char *)pointer + 0) : (((void *)0));
}

static void * __ecereNameSpace__ecere__com___crealloc(void * pointer, unsigned int size)
{
if(!size)
{
__ecereNameSpace__ecere__com___free(pointer);
return (((void *)0));
}
pointer = __ecereNameSpace__ecere__com___mycrealloc(pointer, size);
return pointer ? ((unsigned char *)pointer + 0) : (((void *)0));
}

void * __ecereNameSpace__ecere__com__eSystem_New(unsigned int size)
{
return __ecereNameSpace__ecere__com___malloc(size);
}

void * __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size)
{
return __ecereNameSpace__ecere__com___calloc(1, size);
}

void * __ecereNameSpace__ecere__com__eSystem_Renew(void * memory, unsigned int size)
{
return __ecereNameSpace__ecere__com___realloc(memory, size);
}

void * __ecereNameSpace__ecere__com__eSystem_Renew0(void * memory, unsigned int size)
{
return __ecereNameSpace__ecere__com___crealloc(memory, size);
}

struct __ecereNameSpace__ecere__sys__BTNode;

struct __ecereNameSpace__ecere__sys__BTNode
{
uintptr_t key;
struct __ecereNameSpace__ecere__sys__BTNode * parent;
struct __ecereNameSpace__ecere__sys__BTNode * left;
struct __ecereNameSpace__ecere__sys__BTNode * right;
int depth;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(struct __ecereNameSpace__ecere__sys__BTNode * this);

struct __ecereNameSpace__ecere__sys__OldLink;

struct __ecereNameSpace__ecere__sys__OldLink
{
struct __ecereNameSpace__ecere__sys__OldLink * prev;
struct __ecereNameSpace__ecere__sys__OldLink * next;
void *  data;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__sys__OldLink * __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindLink(struct __ecereNameSpace__ecere__sys__OldList * this, void *  data);

struct __ecereNameSpace__ecere__sys__NamedLink64;

struct __ecereNameSpace__ecere__sys__NamedLink64
{
struct __ecereNameSpace__ecere__sys__NamedLink64 * prev;
struct __ecereNameSpace__ecere__sys__NamedLink64 * next;
char *  name;
long long data;
} ecere_gcc_struct;

static void __ecereNameSpace__ecere__com__FreeEnumValue(struct __ecereNameSpace__ecere__sys__NamedLink64 * value)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(value->name), value->name = 0);
}

static void *  __ecereNameSpace__ecere__com__Instance_New(struct __ecereNameSpace__ecere__com__Class *  _class, unsigned int bindingsAlloc);

void * __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class)
{
return __ecereNameSpace__ecere__com__Instance_New(_class, 1);
}

void * __ecereNameSpace__ecere__com__eInstance_NewEx(struct __ecereNameSpace__ecere__com__Class * _class, unsigned int bindingsAlloc)
{
return __ecereNameSpace__ecere__com__Instance_New(_class, bindingsAlloc);
}

struct __ecereNameSpace__ecere__com__Method;

struct __ecereNameSpace__ecere__com__Method
{
const char * name;
struct __ecereNameSpace__ecere__com__Method * parent, * left, * right;
int depth;
int (* function)();
int vid;
int type;
struct __ecereNameSpace__ecere__com__Class * _class;
void * symbol;
const char * dataTypeString;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int memberAccess;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__ObjectInfo;

struct __ecereNameSpace__ecere__com__ObjectInfo
{
struct __ecereNameSpace__ecere__com__ObjectInfo * prev, * next;
struct __ecereNameSpace__ecere__com__Instance * instance;
char * name;
struct __ecereNameSpace__ecere__com__Instance * instCode;
unsigned int deleted;
struct __ecereNameSpace__ecere__com__ObjectInfo * oClass;
struct __ecereNameSpace__ecere__sys__OldList instances;
struct __ecereNameSpace__ecere__com__Instance * classDefinition;
unsigned int modified;
void * i18nStrings;
} ecere_gcc_struct;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_RenameObject;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_SelectObjectFromDesigner;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_CodeAddObject;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_SheetAddObject;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_DeleteObject;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_ObjectContainsCode;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_SelectObject;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_CreateObject;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_PostCreateObject;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_DroppedObject;

struct __ecereNameSpace__ecere__com__Module;

struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, const char * name);

extern unsigned int __ecereDll_Load_ecere(struct __ecereNameSpace__ecere__com__Instance * module);

extern unsigned int __ecereDll_Unload_ecere(struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern void __ecereNameSpace__ecere__com__InitializeDataTypes1(struct __ecereNameSpace__ecere__com__Instance * module);

extern void __ecereNameSpace__ecere__com__InitializeDataTypes(struct __ecereNameSpace__ecere__com__Instance * module);

struct __ecereNameSpace__ecere__com__Class * __ecereProp___ecereNameSpace__ecere__com__Class_Set_char__PTR_(const char *  value)
{
struct __ecereNameSpace__ecere__com__Class * theClass = __ecereNameSpace__ecere__com__eSystem_FindClass(__thisModule, value);

return theClass;
}

struct __ecereNameSpace__ecere__com__BitMember;

struct __ecereNameSpace__ecere__com__BitMember
{
struct __ecereNameSpace__ecere__com__BitMember * prev, * next;
const char * name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
const char * dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int type;
int size;
int pos;
uint64 mask;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__ClassProperty;

struct __ecereNameSpace__ecere__com__ClassProperty
{
const char * name;
struct __ecereNameSpace__ecere__com__ClassProperty * parent, * left, * right;
int depth;
void (* Set)(struct __ecereNameSpace__ecere__com__Class *, long long);
long long (* Get)(struct __ecereNameSpace__ecere__com__Class *);
const char * dataTypeString;
struct __ecereNameSpace__ecere__com__Instance * dataType;
unsigned int constant;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__Watcher;

struct __ecereNameSpace__ecere__com__Watcher
{
struct __ecereNameSpace__ecere__com__Watcher * prev, * next;
void (* callback)(void *, void *);
struct __ecereNameSpace__ecere__com__Instance * object;
} ecere_gcc_struct;

void __ecereNameSpace__ecere__com__eInstance_Watch(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, void * object, void (* callback)(void *, void *))
{
if(_property->isWatchable)
{
struct __ecereNameSpace__ecere__sys__OldList * watchers = (struct __ecereNameSpace__ecere__sys__OldList *)((unsigned char *)instance + _property->watcherOffset);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*watchers), __extension__ ({
struct __ecereNameSpace__ecere__com__Watcher * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__Watcher));

__ecereInstance1->callback = callback, __ecereInstance1->object = object, __ecereInstance1;
}));
}
}

struct __ecereNameSpace__ecere__com__NameSpace;

struct __ecereNameSpace__ecere__com__DefinedExpression
{
struct __ecereNameSpace__ecere__com__DefinedExpression * prev, * next;
const char * name;
const char * value;
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__NameSpace
{
const char * name;
struct __ecereNameSpace__ecere__com__NameSpace * btParent, * left, * right;
int depth;
struct __ecereNameSpace__ecere__com__NameSpace * parent;
struct __ecereNameSpace__ecere__sys__BinaryTree nameSpaces;
struct __ecereNameSpace__ecere__sys__BinaryTree classes;
struct __ecereNameSpace__ecere__sys__BinaryTree defines;
struct __ecereNameSpace__ecere__sys__BinaryTree functions;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(struct __ecereNameSpace__ecere__sys__BinaryTree * this);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, const char *  key);

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, const char *  a, const char *  b);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Find(struct __ecereNameSpace__ecere__sys__BinaryTree * this, uintptr_t key);

struct __ecereNameSpace__ecere__com__Application
{
int argc;
const char * *  argv;
int exitCode;
unsigned int isGUIApp;
struct __ecereNameSpace__ecere__sys__OldList allModules;
char *  parsedCommand;
struct __ecereNameSpace__ecere__com__NameSpace systemNameSpace;
} ecere_gcc_struct;

static void __ecereNameSpace__ecere__com__NameSpace_Free(struct __ecereNameSpace__ecere__com__NameSpace * parentNameSpace)
{
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace;

(__ecereNameSpace__ecere__com__eSystem_Delete((void *)parentNameSpace->name), parentNameSpace->name = 0);
while((nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&parentNameSpace->nameSpaces)))
{
__ecereNameSpace__ecere__com__NameSpace_Free(nameSpace);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&parentNameSpace->nameSpaces, (struct __ecereNameSpace__ecere__sys__BTNode *)nameSpace);
}
}

static struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereNameSpace__ecere__com__ScanNameSpace(struct __ecereNameSpace__ecere__com__NameSpace * nameSpace, const char * name, void * listOffset)
{
struct __ecereNameSpace__ecere__sys__BinaryTree * tree = (struct __ecereNameSpace__ecere__sys__BinaryTree *)((unsigned char *)nameSpace + (uintptr_t)listOffset);
struct __ecereNameSpace__ecere__com__BTNamedLink * link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Find((&*tree), (uintptr_t)name);
struct __ecereNameSpace__ecere__com__NameSpace * child;

if(!link)
{
for(child = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&nameSpace->nameSpaces); child; child = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)child)))
{
link = __ecereNameSpace__ecere__com__ScanNameSpace(child, name, listOffset);
if(link)
break;
}
}
return link;
}

struct __ecereNameSpace__ecere__com__Module
{
struct __ecereNameSpace__ecere__com__Instance * application;
struct __ecereNameSpace__ecere__sys__OldList classes;
struct __ecereNameSpace__ecere__sys__OldList defines;
struct __ecereNameSpace__ecere__sys__OldList functions;
struct __ecereNameSpace__ecere__sys__OldList modules;
struct __ecereNameSpace__ecere__com__Instance * prev;
struct __ecereNameSpace__ecere__com__Instance * next;
const char *  name;
void *  library;
void *  Unload;
int importType;
int origImportType;
struct __ecereNameSpace__ecere__com__NameSpace privateNameSpace;
struct __ecereNameSpace__ecere__com__NameSpace publicNameSpace;
} ecere_gcc_struct;

static struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereNameSpace__ecere__com__SearchNameSpace(struct __ecereNameSpace__ecere__com__NameSpace * nameSpace, const char * name, void * listOffset)
{
int start = 0, c;
char ch;
int level = 0;

for(c = 0; (ch = name[c]); c++)
{
if(ch == '<')
level++;
if(ch == '>')
level--;
if(level == 0 && (ch == '.' || (ch == ':' && name[c + 1] == ':')))
{
struct __ecereNameSpace__ecere__com__NameSpace * newSpace;
char * spaceName = __ecereNameSpace__ecere__com___malloc(c - start + 1);

memcpy(spaceName, name + start, c - start);
spaceName[c - start] = '\0';
newSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&nameSpace->nameSpaces, spaceName);
__ecereNameSpace__ecere__com___free(spaceName);
if(!newSpace)
return (((void *)0));
nameSpace = newSpace;
if(level == 0 && ch == ':')
c++;
start = c + 1;
}
}
if(c - start)
{
return __ecereNameSpace__ecere__com__ScanNameSpace(nameSpace, name + start, listOffset);
}
return (((void *)0));
}

void __ecereUnregisterModule_instance(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__com__DesignerBase_classDesigner = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__DesignerBase_objectClass = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__DesignerBase_isDragging = (void *)0;
}

struct __ecereNameSpace__ecere__com__DataMember;

struct __ecereNameSpace__ecere__com__DataMember
{
struct __ecereNameSpace__ecere__com__DataMember * prev, * next;
const char * name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
const char * dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int type;
int offset;
int memberID;
struct __ecereNameSpace__ecere__sys__OldList members;
struct __ecereNameSpace__ecere__sys__BinaryTree membersAlpha;
int memberOffset;
short structAlignment;
short pointerAlignment;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__ClassTemplateArgument
{
union
{
struct
{
const char * dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
} ecere_gcc_struct __anon1;
struct __ecereNameSpace__ecere__com__DataValue expression;
struct
{
const char * memberString;
union
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__Method * method;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct __anon2;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

static void __ecereNameSpace__ecere__com__DataMember_Free(struct __ecereNameSpace__ecere__com__DataMember * parentMember)
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__BTNamedLink * namedLink;

(__ecereNameSpace__ecere__com__eSystem_Delete((void *)parentMember->name), parentMember->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)parentMember->dataTypeString), parentMember->dataTypeString = 0);
while((member = parentMember->members.first))
{
__ecereNameSpace__ecere__com__DataMember_Free(member);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&parentMember->members, member);
}
while((namedLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&parentMember->membersAlpha)))
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&parentMember->membersAlpha, (struct __ecereNameSpace__ecere__sys__BTNode *)namedLink);
}
}

static struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__FindDataMember(struct __ecereNameSpace__ecere__sys__OldList * list, struct __ecereNameSpace__ecere__sys__BinaryTree * alist, const char * name, unsigned int * offset, int * id, unsigned int searchPrivate, struct __ecereNameSpace__ecere__com__DataMember ** subMemberStack, int * subMemberStackPos)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link;
struct __ecereNameSpace__ecere__com__DataMember * dataMember;

link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(alist, name);
if(link)
{
dataMember = link->data;
if(dataMember->type == 0 && (dataMember->memberAccess == 1 || searchPrivate || !dataMember->dataTypeString))
{
if(offset)
*offset += dataMember->offset;
if(id)
*id = dataMember->id;
return dataMember;
}
return (((void *)0));
}
for(dataMember = list->first; dataMember; dataMember = dataMember->next)
{
if(!dataMember->isProperty && (dataMember->memberAccess == 1 || searchPrivate) && !dataMember->name && (dataMember->type == 1 || dataMember->type == 2))
{
struct __ecereNameSpace__ecere__com__DataMember * childMember;

if(subMemberStackPos)
subMemberStack[(*subMemberStackPos)++] = dataMember;
childMember = __ecereNameSpace__ecere__com__FindDataMember(&dataMember->members, &dataMember->membersAlpha, name, offset, id, searchPrivate, subMemberStack, subMemberStackPos);
if(childMember)
{
if(offset)
*offset += dataMember->offset;
if(id)
*id += dataMember->id;
return childMember;
}
if(subMemberStackPos)
(*subMemberStackPos)--;
}
}
return (((void *)0));
}

static void __ecereNameSpace__ecere__com__SetMemberClass(struct __ecereNameSpace__ecere__com__DataMember * member, struct __ecereNameSpace__ecere__com__Class * _class)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember;

member->_class = _class;
for(dataMember = member->members.first; dataMember; dataMember = dataMember->next)
__ecereNameSpace__ecere__com__SetMemberClass(dataMember, _class);
}

struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_New(int type, int declMode)
{
return __extension__ ({
struct __ecereNameSpace__ecere__com__DataMember * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__DataMember));

__ecereInstance1->type = type, __ecereInstance1->memberAccess = declMode, __ecereInstance1->membersAlpha.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, __ecereInstance1;
});
}

struct __ecereNameSpace__ecere__com__Class
{
struct __ecereNameSpace__ecere__com__Class * prev, * next;
const char * name;
int offset, structSize;
void ** _vTbl;
int vTblSize;
unsigned int (* Constructor)(void *);
void (* Destructor)(void *);
int offsetClass, sizeClass;
struct __ecereNameSpace__ecere__com__Class * base;
struct __ecereNameSpace__ecere__sys__BinaryTree methods;
struct __ecereNameSpace__ecere__sys__BinaryTree members;
struct __ecereNameSpace__ecere__sys__BinaryTree prop;
struct __ecereNameSpace__ecere__sys__OldList membersAndProperties;
struct __ecereNameSpace__ecere__sys__BinaryTree classProperties;
struct __ecereNameSpace__ecere__sys__OldList derivatives;
int memberID, startMemberID;
int type;
struct __ecereNameSpace__ecere__com__Instance * module;
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace;
const char * dataTypeString;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int typeSize;
int defaultAlignment;
void (* Initialize)();
int memberOffset;
struct __ecereNameSpace__ecere__sys__OldList selfWatchers;
const char * designerClass;
unsigned int noExpansion;
const char * defaultProperty;
unsigned int comRedefinition;
int count;
int isRemote;
unsigned int internalDecl;
void * data;
unsigned int computeSize;
short structAlignment;
short pointerAlignment;
int destructionWatchOffset;
unsigned int fixed;
struct __ecereNameSpace__ecere__sys__OldList delayedCPValues;
int inheritanceAccess;
const char * fullName;
void * symbol;
struct __ecereNameSpace__ecere__sys__OldList conversions;
struct __ecereNameSpace__ecere__sys__OldList templateParams;
struct __ecereNameSpace__ecere__com__ClassTemplateArgument * templateArgs;
struct __ecereNameSpace__ecere__com__Class * templateClass;
struct __ecereNameSpace__ecere__sys__OldList templatized;
int numParams;
unsigned int isInstanceClass;
unsigned int byValueSystemClass;
void * bindingsClass;
} ecere_gcc_struct;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Angle;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_unichar;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Property;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BTNamedLink;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SelfWatcher;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__AccessMode;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SubModule;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DataMemberType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Class;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__TemplateParameterType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__TemplateMemberType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateArgument;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateParameter;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__MethodType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Method;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ImportType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__NameSpace;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DataValue;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DataMember;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BitMember;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassProperty;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DefinedExpression;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__EnumClassData;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Watcher;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__MemBlock;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__MemPart;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BlockPool;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Platform;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ObjectInfo;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DesignerBase;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassDesignerBase;

const char * __ecereMethod_unichar_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, unsigned int * this, char * tempString, void * fieldData, unsigned int * onType)
{
__ecereNameSpace__ecere__sys__UTF32toUTF8Len(&(*this), 1, tempString, 5);
return tempString;
}

unsigned int __ecereMethod_unichar_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * class, unsigned int * this, const char * string)
{
int nb;

(*this) = __ecereNameSpace__ecere__sys__UTF8GetChar(string, &nb);
return 1;
}

const char *  __ecereProp___ecereNameSpace__ecere__com__Class_Get_char__PTR_(struct __ecereNameSpace__ecere__com__Class * this)
{
return this->name;
}

const char * __ecereMethod___ecereNameSpace__ecere__com__Class_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Class * this, char * tempString, void * fieldData, unsigned int * onType)
{
return this->name;
}

void __ecereMethod___ecereNameSpace__ecere__com__Class_OnFree(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Class * this)
{
}

static void __ecereNameSpace__ecere__com__FixDerivativeVirtualMethod(struct __ecereNameSpace__ecere__com__Class * base, const char * name, int vid, void * origFunction, const char * type)
{
struct __ecereNameSpace__ecere__sys__OldLink * derivative;

for(derivative = base->derivatives.first; derivative; derivative = derivative->next)
{
struct __ecereNameSpace__ecere__com__Class * _class = derivative->data;
struct __ecereNameSpace__ecere__com__Method * method, * next;
void * function = origFunction;

_class->vTblSize++;
_class->_vTbl = __ecereNameSpace__ecere__com__eSystem_Renew(_class->_vTbl, sizeof(void *) * (_class->vTblSize));
memmove(_class->_vTbl + vid + 1, _class->_vTbl + vid, (_class->vTblSize - vid - 1) * sizeof(void *));
method = (struct __ecereNameSpace__ecere__com__Method *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->methods, name);
if(method)
{
if(method->function)
function = method->function;
if(!method->symbol)
{
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)method->name), method->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)method->dataTypeString), method->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&_class->methods, (struct __ecereNameSpace__ecere__sys__BTNode *)method);
}
else
{
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)method->dataTypeString), method->dataTypeString = 0);
method->type = 1;
method->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(type);
method->_class = base;
}
}
for(method = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->methods); method; method = next)
{
next = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)method));
if(method->type == 1)
method->vid++;
}
_class->_vTbl[vid] = function;
{
struct __ecereNameSpace__ecere__sys__OldLink * templateLink;

for(templateLink = _class->templatized.first; templateLink; templateLink = templateLink->next)
{
struct __ecereNameSpace__ecere__com__Class * template = templateLink->data;

template->_vTbl = _class->_vTbl;
}
}
if(_class->derivatives.first || _class->templatized.first)
__ecereNameSpace__ecere__com__FixDerivativeVirtualMethod(_class, name, vid, function, type);
}
{
struct __ecereNameSpace__ecere__sys__OldLink * templateLink;

for(templateLink = base->templatized.first; templateLink; templateLink = templateLink->next)
{
struct __ecereNameSpace__ecere__com__Class * template = templateLink->data;

template->_vTbl = base->_vTbl;
__ecereNameSpace__ecere__com__FixDerivativeVirtualMethod(template, name, vid, origFunction, type);
}
}
}

static void __ecereNameSpace__ecere__com__FixDerivativeProperty(struct __ecereNameSpace__ecere__com__Class * base, struct __ecereNameSpace__ecere__com__Property * _property)
{
struct __ecereNameSpace__ecere__sys__OldLink * derivative;

for(derivative = base->derivatives.first; derivative; derivative = derivative->next)
{
struct __ecereNameSpace__ecere__com__Class * _class = derivative->data;
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__BTNamedLink * link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->prop, _property->name);

if(link)
{
prop = link->data;
if(!prop->Set && !prop->Get && prop->memberAccess == 4)
{
struct __ecereNameSpace__ecere__com__SelfWatcher * watcher;

for(watcher = _class->selfWatchers.first; watcher; watcher = watcher->next)
{
if(watcher->_property == prop)
watcher->_property = _property;
}
_property->selfWatchable = 1;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)prop->name), prop->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)prop->dataTypeString), prop->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->membersAndProperties, prop);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&_class->prop, (struct __ecereNameSpace__ecere__sys__BTNode *)link);
}
}
for(prop = _class->membersAndProperties.first; prop; prop = prop->next)
prop->id++;
_class->memberID++;
_class->startMemberID++;
__ecereNameSpace__ecere__com__FixDerivativeProperty(_class, _property);
}
}

static void __ecereNameSpace__ecere__com__SetDelayedCPValues(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__ClassProperty * _property)
{
struct __ecereNameSpace__ecere__sys__OldLink * deriv;
struct __ecereNameSpace__ecere__sys__NamedLink64 * value, * next;

for(value = _class->delayedCPValues.first; value; value = next)
{
next = value->next;
if(!strcmp(value->name, _property->name))
{
_property->Set(_class, value->data);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->delayedCPValues, value);
}
}
for(deriv = _class->derivatives.first; deriv; deriv = deriv->next)
{
__ecereNameSpace__ecere__com__SetDelayedCPValues(deriv->data, _property);
}
}

struct __ecereNameSpace__ecere__com__ClassProperty * __ecereNameSpace__ecere__com__eClass_FindClassProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char * name)
{
struct __ecereNameSpace__ecere__com__ClassProperty * _property = (((void *)0));

if(name && _class)
{
struct __ecereNameSpace__ecere__com__Class * origClass = _class;

for(; _class; _class = _class->base)
{
_property = (struct __ecereNameSpace__ecere__com__ClassProperty *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->classProperties, name);
if(_property)
break;
}
if(!_property && origClass->type == 4)
{
struct __ecereNameSpace__ecere__com__Class * enumClass = __ecereNameSpace__ecere__com__eSystem_FindClass(origClass->module, "enum");

_property = __ecereNameSpace__ecere__com__eClass_FindClassProperty(enumClass, name);
}
}
return _property;
}

struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char * name, struct __ecereNameSpace__ecere__com__Instance * module)
{
if(_class && name)
{
for(; _class; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__Method * method;

if(_class->templateClass)
_class = _class->templateClass;
method = (struct __ecereNameSpace__ecere__com__Method *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->methods, name);
if(method && (method->memberAccess == 1 || _class->module == module || !method->dataTypeString))
{
if(!method->dataTypeString)
{
if(_class->module != module)
{
if(method->memberAccess == 1)
module = _class->module;
else
{
return (((void *)0));
}
}
}
else
{
return method;
}
}
if(_class->inheritanceAccess == 2 && _class->module != module)
break;
}
}
return (((void *)0));
}

static unsigned int __ecereNameSpace__ecere__com__ConstructInstance(void * instance, struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class * from, unsigned int bindingsAlloc)
{
if(_class->templateClass)
_class = _class->templateClass;
if(_class->base && from != _class->base)
{
if(!__ecereNameSpace__ecere__com__ConstructInstance(instance, _class->base, from, 0))
return 0;
}
if(_class->Initialize)
{
void (* Initialize)(struct __ecereNameSpace__ecere__com__Instance * module) = (void *)_class->Initialize;

_class->Initialize = (((void *)0));
Initialize(_class->module);
}
if(_class->Constructor)
{
unsigned int result;

if(_class->bindingsClass)
result = ((unsigned int (*)(void *, unsigned int))(void *)_class->Constructor)(instance, bindingsAlloc);
else
result = _class->Constructor(instance);
if(!result)
{
for(; _class; _class = _class->base)
{
if(_class->templateClass)
_class = _class->templateClass;
if(_class->Destructor)
_class->Destructor(instance);
}
return 0;
}
}
(_class->templateClass ? _class->templateClass : _class)->count++;
return 1;
}

struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char * name, struct __ecereNameSpace__ecere__com__Instance * module)
{
if(_class && name)
{
if(!strncmp(name, "const ", 6))
name += 6;
for(; _class; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link;

if(_class->templateClass)
_class = _class->templateClass;
link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->prop, name);
if(link)
{
struct __ecereNameSpace__ecere__com__Property * _property = (struct __ecereNameSpace__ecere__com__Property *)link->data;

if(_property->memberAccess == 1 || _class->module == module || !_property->dataTypeString)
{
if(!_property->dataTypeString)
{
if(_class->module != module)
{
if(_property->memberAccess == 1)
module = _class->module;
else
{
return (((void *)0));
}
}
}
else
{
return _property;
}
}
}
if(_class->inheritanceAccess == 2 && _class->module != module)
break;
}
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMember(struct __ecereNameSpace__ecere__com__Class * _class, const char * name, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember ** subMemberStack, int * subMemberStackPos)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (((void *)0));

if(subMemberStackPos)
*subMemberStackPos = 0;
if(_class && name)
{
for(; _class; _class = _class->base)
{
if(_class->templateClass)
_class = _class->templateClass;
dataMember = __ecereNameSpace__ecere__com__FindDataMember(&_class->membersAndProperties, &_class->members, name, (((void *)0)), (((void *)0)), _class->module == module, subMemberStack, subMemberStackPos);
if(dataMember)
{
if(!dataMember->dataTypeString)
{
if(_class->module != module)
{
if(dataMember->memberAccess == 1)
module = _class->module;
else
{
return (((void *)0));
}
}
dataMember = (((void *)0));
}
else
{
dataMember->_class = _class->templateClass ? _class->templateClass : _class;
return dataMember;
}
}
if(_class->inheritanceAccess == 2 && _class->module != module)
break;
}
}
return dataMember;
}

struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(struct __ecereNameSpace__ecere__com__Class * _class, const char * name, unsigned int * offset, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember ** subMemberStack, int * subMemberStackPos)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (((void *)0));

if(subMemberStackPos)
*subMemberStackPos = 0;
if(offset)
*offset = 0;
if(_class)
{
for(; _class; _class = _class->base)
{
if(_class->templateClass)
_class = _class->templateClass;
dataMember = __ecereNameSpace__ecere__com__FindDataMember(&_class->membersAndProperties, &_class->members, name, offset, (((void *)0)), _class->module == module, subMemberStack, subMemberStackPos);
if(dataMember)
{
if(!dataMember->dataTypeString)
{
if(_class->module != module)
{
if(dataMember->memberAccess == 1)
module = _class->module;
else
{
return (((void *)0));
}
}
dataMember = (((void *)0));
}
else
{
dataMember->_class = _class;
return dataMember;
}
}
if(_class->inheritanceAccess == 2 && _class->module != module)
break;
}
}
return dataMember;
}

struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMemberAndId(struct __ecereNameSpace__ecere__com__Class * _class, const char * name, int * id, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember ** subMemberStack, int * subMemberStackPos)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (((void *)0));

if(subMemberStackPos)
*subMemberStackPos = 0;
if(_class)
{
for(; _class; _class = _class->base)
{
if(_class->templateClass)
_class = _class->templateClass;
dataMember = __ecereNameSpace__ecere__com__FindDataMember(&_class->membersAndProperties, &_class->members, name, (((void *)0)), id, _class->module == module, subMemberStack, subMemberStackPos);
if(dataMember)
{
if(!dataMember->dataTypeString)
{
if(_class->module != module)
{
if(dataMember->memberAccess == 1)
module = _class->module;
else
{
return (((void *)0));
}
}
dataMember = (((void *)0));
}
else
{
dataMember->_class = _class;
return dataMember;
}
}
if(_class->inheritanceAccess == 2 && _class->module != module)
break;
}
}
return dataMember;
}

static void __ecereNameSpace__ecere__com__FixOffsets(struct __ecereNameSpace__ecere__com__Class * _class)
{
struct __ecereNameSpace__ecere__sys__OldLink * deriv;

_class->structSize += _class->base->structSize - _class->offset;
_class->offset = _class->base->structSize;
for(deriv = _class->derivatives.first; deriv; deriv = deriv->next)
__ecereNameSpace__ecere__com__FixOffsets(deriv->data);
}

void __ecereNameSpace__ecere__com__eEnum_AddFixedValue(struct __ecereNameSpace__ecere__com__Class * _class, const char * string, long long value)
{
if(_class && _class->type == 4)
{
struct __ecereNameSpace__ecere__com__EnumClassData * data = (struct __ecereNameSpace__ecere__com__EnumClassData *)_class->data;
struct __ecereNameSpace__ecere__sys__NamedLink64 * item;

for(item = data->values.first; item; item = item->next)
if(!strcmp(item->name, string))
break;
if(!item)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&data->values, __extension__ ({
struct __ecereNameSpace__ecere__sys__NamedLink64 * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__sys__NamedLink64));

__ecereInstance1->data = value, __ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(string), __ecereInstance1;
}));
if(value > data->largest)
data->largest = value;
}
}
}

long long __ecereNameSpace__ecere__com__eEnum_AddValue(struct __ecereNameSpace__ecere__com__Class * _class, const char * string)
{
if(_class && _class->type == 4)
{
struct __ecereNameSpace__ecere__com__EnumClassData * data = (struct __ecereNameSpace__ecere__com__EnumClassData *)_class->data;
long long value = data->largest + 1;
struct __ecereNameSpace__ecere__sys__NamedLink64 * item;

for(item = data->values.first; item; item = item->next)
if(!strcmp(item->name, string))
break;
if(!item)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&data->values, __extension__ ({
struct __ecereNameSpace__ecere__sys__NamedLink64 * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__sys__NamedLink64));

__ecereInstance1->data = value, __ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(string), __ecereInstance1;
}));
if(value > data->largest)
data->largest = value;
return value;
}
}
return -1;
}

static long long __ecereNameSpace__ecere__com__GetEnumSize(struct __ecereNameSpace__ecere__com__Class * _class)
{
struct __ecereNameSpace__ecere__com__EnumClassData * data = (struct __ecereNameSpace__ecere__com__EnumClassData *)_class->data;

return data->largest + 1;
}

struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eClass_GetDesigner(struct __ecereNameSpace__ecere__com__Class * _class)
{
for(; _class; _class = _class->base)
{
if(_class->designerClass)
return (struct __ecereNameSpace__ecere__com__Class *)__ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, _class->designerClass);
}
return (((void *)0));
}

const char * __ecereMethod___ecereNameSpace__ecere__com__Platform_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, int * this, char * tempString, void * fieldData, unsigned int * onType)
{
if((*this) >= __ecereNameSpace__ecere__com__firstPlatform && (*this) <= __ecereNameSpace__ecere__com__lastPlatform)
{
if(tempString)
strcpy(tempString, __ecereNameSpace__ecere__com__platformNames[*(int *)this]);
return __ecereNameSpace__ecere__com__platformNames[*(int *)this];
}
if(tempString && tempString[0])
tempString[0] = '\0';
return (((void *)0));
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Platform_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * class, int * this, const char * string)
{
(*this) = __ecereProp___ecereNameSpace__ecere__com__Platform_Set_char__PTR_(string);
return (*this) != 0;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldLink;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_char__PTR_;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_String;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Application;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char * name, const char * type, void * function, int declMode)
{
if(_class && !_class->comRedefinition && name)
{
struct __ecereNameSpace__ecere__com__Class * base;

for(base = _class; base; base = base->base)
{
struct __ecereNameSpace__ecere__com__Method * method;

if(base->templateClass)
base = base->templateClass;
method = (struct __ecereNameSpace__ecere__com__Method *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&base->methods, name);
if(method)
{
if(method->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldLink * deriv;
void * oldFunction = _class->_vTbl[method->vid];

if(method->vid >= _class->vTblSize)
printf("error: virtual methods overriding failure\n");
else
_class->_vTbl[method->vid] = function ? function : (((void *)0));
for(deriv = _class->derivatives.first; deriv; deriv = deriv->next)
{
struct __ecereNameSpace__ecere__com__Class * derivClass = deriv->data;

if(derivClass->_vTbl[method->vid] == oldFunction)
__ecereNameSpace__ecere__com__eClass_AddMethod(derivClass, name, type, function, declMode);
}
{
struct __ecereNameSpace__ecere__sys__OldLink * templateLink;

for(templateLink = _class->templatized.first; templateLink; templateLink = templateLink->next)
{
struct __ecereNameSpace__ecere__com__Class * template = templateLink->data;

for(deriv = template->derivatives.first; deriv; deriv = deriv->next)
{
struct __ecereNameSpace__ecere__com__Class * derivClass = deriv->data;

if(derivClass->_vTbl[method->vid] == oldFunction)
__ecereNameSpace__ecere__com__eClass_AddMethod(derivClass, name, type, function, declMode);
}
}
}
}
else
{
if(base == _class)
{
break;
}
base = (((void *)0));
break;
}
return method;
}
}
if(!base)
{
struct __ecereNameSpace__ecere__com__Method * method = (method = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__Method)), method->name = __ecereNameSpace__ecere__sys__CopyString(name), method->function = function ? function : (((void *)0)), method->_class = _class, method->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(type), method->memberAccess = declMode, method);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&_class->methods, (struct __ecereNameSpace__ecere__sys__BTNode *)method);
return method;
}
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_AddDataMember(struct __ecereNameSpace__ecere__com__DataMember * member, const char * name, const char * type, unsigned int size, unsigned int alignment, int declMode)
{
if((name && !__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&member->membersAlpha, name)) || (!name && !type && !size && alignment))
{
if(alignment)
{
short __simpleStruct0;
unsigned int pointerAlignment = alignment == 0xF000F000;
unsigned int force64Bits = 0;
unsigned int force32Bits = 0;

if(pointerAlignment)
alignment = force64Bits ? 8 : force32Bits ? 4 : sizeof(void *);
if(pointerAlignment && member->structAlignment <= 4)
member->pointerAlignment = 1;
else if(!pointerAlignment && alignment >= 8)
member->pointerAlignment = 0;
member->structAlignment = (__simpleStruct0 = member->structAlignment, (__simpleStruct0 > alignment) ? __simpleStruct0 : alignment);
if(member->memberOffset % alignment)
member->memberOffset += alignment - (member->memberOffset % alignment);
}
if(name)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (dataMember = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__DataMember)), dataMember->name = __ecereNameSpace__ecere__sys__CopyString(name), dataMember->_class = member->_class, dataMember->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(type), dataMember->id = member->memberID++, dataMember->offset = (member->type == 1) ? 0 : member->memberOffset, dataMember->memberAccess = declMode, dataMember->membersAlpha.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, dataMember);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&member->members, dataMember);
if(member->type == 1)
{
if(size > member->memberOffset)
member->memberOffset = size;
}
else
member->memberOffset += size;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&member->membersAlpha, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__BTNamedLink));

__ecereInstance1->name = dataMember->name, __ecereInstance1->data = dataMember, __ecereInstance1;
}));
return dataMember;
}
}
return (((void *)0));
}

unsigned int __ecereNameSpace__ecere__com__eMember_AddMember(struct __ecereNameSpace__ecere__com__DataMember * addTo, struct __ecereNameSpace__ecere__com__DataMember * dataMember)
{
short __simpleStruct0, __simpleStruct1;

if(dataMember->name && __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&addTo->membersAlpha, dataMember->name))
{
__ecereNameSpace__ecere__com__DataMember_Free(dataMember);
((dataMember ? __extension__ ({
void * __ecerePtrToDelete = (dataMember);

__ecereClass___ecereNameSpace__ecere__com__DataMember->Destructor ? __ecereClass___ecereNameSpace__ecere__com__DataMember->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), dataMember = 0);
return 0;
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&addTo->members, dataMember);
if(dataMember->name)
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&addTo->membersAlpha, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__BTNamedLink));

__ecereInstance1->name = dataMember->name, __ecereInstance1->data = dataMember, __ecereInstance1;
}));
dataMember->_class = addTo->_class;
dataMember->id = addTo->memberID;
if(dataMember->type == 1)
addTo->memberID += 1;
else
addTo->memberID += dataMember->memberID;
if(dataMember->pointerAlignment && dataMember->structAlignment <= 4)
addTo->pointerAlignment = 1;
else if(!dataMember->pointerAlignment && dataMember->structAlignment >= 8)
addTo->pointerAlignment = 0;
addTo->structAlignment = (__simpleStruct0 = addTo->structAlignment, __simpleStruct1 = dataMember->structAlignment, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
dataMember->offset = (addTo->type == 1) ? 0 : addTo->memberOffset;
if(dataMember->structAlignment)
{
if(addTo->memberOffset % dataMember->structAlignment)
addTo->memberOffset += dataMember->structAlignment - (addTo->memberOffset % dataMember->structAlignment);
}
if(addTo->type == 1)
{
if(dataMember->memberOffset > addTo->memberOffset)
addTo->memberOffset = dataMember->memberOffset;
}
else
addTo->memberOffset += dataMember->memberOffset;
return 1;
}

unsigned int __ecereNameSpace__ecere__com__eClass_AddMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__DataMember * dataMember)
{
short __simpleStruct0, __simpleStruct1;

if(!_class || _class->comRedefinition || (dataMember->name && __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->members, dataMember->name)))
{
__ecereNameSpace__ecere__com__DataMember_Free(dataMember);
((dataMember ? __extension__ ({
void * __ecerePtrToDelete = (dataMember);

__ecereClass___ecereNameSpace__ecere__com__DataMember->Destructor ? __ecereClass___ecereNameSpace__ecere__com__DataMember->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), dataMember = 0);
return 0;
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->membersAndProperties, dataMember);
if(dataMember->name)
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&_class->members, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__BTNamedLink));

__ecereInstance1->name = dataMember->name, __ecereInstance1->data = dataMember, __ecereInstance1;
}));
__ecereNameSpace__ecere__com__SetMemberClass(dataMember, _class);
dataMember->id = _class->memberID;
if(dataMember->pointerAlignment && dataMember->structAlignment <= 4)
_class->pointerAlignment = 1;
else if(!dataMember->pointerAlignment && dataMember->structAlignment >= 8)
_class->pointerAlignment = 0;
_class->structAlignment = (__simpleStruct0 = _class->structAlignment, __simpleStruct1 = dataMember->structAlignment, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
if(dataMember->type == 1)
_class->memberID += 1;
else
_class->memberID += dataMember->memberID;
if(dataMember->structAlignment)
{
if(_class->memberOffset % dataMember->structAlignment)
_class->memberOffset += dataMember->structAlignment - (_class->memberOffset % dataMember->structAlignment);
}
dataMember->offset = _class->memberOffset;
_class->memberOffset += dataMember->memberOffset;
return 1;
}

struct __ecereNameSpace__ecere__com__BitMember * __ecereNameSpace__ecere__com__eClass_AddBitMember(struct __ecereNameSpace__ecere__com__Class * _class, const char * name, const char * type, int bitSize, int bitPos, int declMode)
{
if(_class && name && !__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->members, name))
{
uint64 mask = 0;
int c;
struct __ecereNameSpace__ecere__com__BitMember * bitMember = (bitMember = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__BitMember)), bitMember->name = __ecereNameSpace__ecere__sys__CopyString(name), bitMember->_class = _class, bitMember->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(type), bitMember->id = _class->memberID++, bitMember->memberAccess = declMode, bitMember);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->membersAndProperties, bitMember);
if(bitSize)
{
bitMember->pos = (bitPos == -1) ? _class->memberOffset : bitPos;
bitMember->size = bitSize;
_class->memberOffset = bitMember->pos + bitMember->size;
for(c = 0; c < bitSize; c++)
{
if(c)
mask <<= 1;
mask |= 1;
}
bitMember->mask = mask << bitMember->pos;
}
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&_class->members, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__BTNamedLink));

__ecereInstance1->name = bitMember->name, __ecereInstance1->data = bitMember, __ecereInstance1;
}));
return bitMember;
}
return (((void *)0));
}

const char *  __ecereProp___ecereNameSpace__ecere__com__Platform_Get_char__PTR_(int this)
{
return (__extension__ ({
const char *  (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , char *  tempString, void *  reserved, unsigned int *  onType);

__internal_VirtualMethod = ((const char *  (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, char *  tempString, void *  reserved, unsigned int *  onType))__ecereClass___ecereNameSpace__ecere__com__Platform->_vTbl[__ecereVMethodID_class_OnGetString]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecereClass___ecereNameSpace__ecere__com__Platform, (void *)&this, (((void *)0)), (((void *)0)), (((void *)0))) : (const char * )1;
}));
}

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Get_classDesigner(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__DesignerBase * __ecerePointer___ecereNameSpace__ecere__com__DesignerBase = (struct __ecereNameSpace__ecere__com__DesignerBase *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__DesignerBase->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__com__DesignerBase->classDesigner;
}

const char *  __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Get_objectClass(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__DesignerBase * __ecerePointer___ecereNameSpace__ecere__com__DesignerBase = (struct __ecereNameSpace__ecere__com__DesignerBase *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__DesignerBase->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__com__DesignerBase->objectClass;
}

unsigned int __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Get_isDragging(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__DesignerBase * __ecerePointer___ecereNameSpace__ecere__com__DesignerBase = (struct __ecereNameSpace__ecere__com__DesignerBase *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__DesignerBase->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__com__DesignerBase->isDragging;
}

struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char * name, const char * type, void * function, int declMode)
{
if(_class && !_class->comRedefinition && name)
{
struct __ecereNameSpace__ecere__com__Class * base;

for(base = _class; base; base = base->base)
{
struct __ecereNameSpace__ecere__com__Method * method = (struct __ecereNameSpace__ecere__com__Method *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&base->methods, name);

if(method)
{
if(method->type == 1)
{
if(method->vid >= _class->vTblSize)
printf("error: virtual methods overriding failure\n");
else
_class->_vTbl[method->vid] = function ? function : (((void *)0));
}
else
base = (((void *)0));
return method;
}
}
if(!base)
{
struct __ecereNameSpace__ecere__com__Method * method = (method = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__Method)), method->name = __ecereNameSpace__ecere__sys__CopyString(name), method->function = function ? function : (((void *)0)), method->type = 1, method->_class = _class, method->vid = _class->vTblSize++, method->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(type), method->memberAccess = declMode, method);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&_class->methods, (struct __ecereNameSpace__ecere__sys__BTNode *)method);
_class->_vTbl = __ecereNameSpace__ecere__com__eSystem_Renew(_class->_vTbl, sizeof(void *) * (_class->vTblSize));
_class->_vTbl[method->vid] = function ? function : (((void *)0));
if(_class->derivatives.first || _class->templatized.first)
__ecereNameSpace__ecere__com__FixDerivativeVirtualMethod(_class, name, method->vid, function ? function : (((void *)0)), type);
return method;
}
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char * name, const char * dataType, void * setStmt, void * getStmt, int declMode)
{
struct __ecereNameSpace__ecere__com__Property * _property = (((void *)0));

if(_class)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->prop, name ? name : dataType);
unsigned int isConversion = name ? 0 : 1;

if(!name && dataType && !strncmp(dataType, "const ", 6))
{
name = dataType + 6;
isConversion = 1;
}
if(link)
_property = link->data;
if(!_property)
{
_property = __extension__ ({
struct __ecereNameSpace__ecere__com__Property * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__Property));

__ecereInstance1->isProperty = 1, __ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(name ? name : dataType), __ecereInstance1->id = (name && (setStmt || getStmt || dataType)) ? _class->memberID++ : 0, __ecereInstance1->Set = setStmt, __ecereInstance1->Get = getStmt, __ecereInstance1->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(dataType), __ecereInstance1->_class = _class, __ecereInstance1->compiled = 1, __ecereInstance1->conversion = isConversion, __ecereInstance1->memberAccess = declMode, __ecereInstance1;
});
if(!isConversion)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->membersAndProperties, _property);
else
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->conversions, _property);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&_class->prop, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__BTNamedLink));

__ecereInstance1->name = _property->name, __ecereInstance1->data = _property, __ecereInstance1;
}));
if(!_property->conversion)
{
__ecereNameSpace__ecere__com__FixDerivativeProperty(_class, _property);
}
}
}
return _property;
}

struct __ecereNameSpace__ecere__com__ClassProperty * __ecereNameSpace__ecere__com__eClass_AddClassProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char * name, const char * dataType, void * setStmt, void * getStmt)
{
if(name && !__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->classProperties, name))
{
struct __ecereNameSpace__ecere__com__ClassProperty * _property = (_property = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__ClassProperty)), _property->name = __ecereNameSpace__ecere__sys__CopyString(name), _property->Set = setStmt, _property->Get = getStmt, _property->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(dataType), _property);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&_class->classProperties, (struct __ecereNameSpace__ecere__sys__BTNode *)_property);
__ecereNameSpace__ecere__com__SetDelayedCPValues(_class, _property);
return _property;
}
return (((void *)0));
}

long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char * name)
{
struct __ecereNameSpace__ecere__com__ClassProperty * _property = __ecereNameSpace__ecere__com__eClass_FindClassProperty(_class, name);

if(_property && _property->Get && _property->Get != (void *)1)
{
long long result = _property->Get(_class);

return result;
}
return 0;
}

void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char * name, long long value)
{
struct __ecereNameSpace__ecere__com__ClassProperty * _property = __ecereNameSpace__ecere__com__eClass_FindClassProperty(_class, name);

if(_property)
{
if(_property->Set)
((void (*)(void *, long long))_property->Set)(_class, value);
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->delayedCPValues, __extension__ ({
struct __ecereNameSpace__ecere__sys__NamedLink64 * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__sys__NamedLink64));

__ecereInstance1->name = (char *)name, __ecereInstance1->data = value, __ecereInstance1;
}));
}
}

void __ecereNameSpace__ecere__com__eClass_FindNextMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class ** curClass, struct __ecereNameSpace__ecere__com__DataMember ** curMember, struct __ecereNameSpace__ecere__com__DataMember ** subMemberStack, int * subMemberStackPos)
{
if(*curMember)
{
*curMember = (*curMember)->next;
if(subMemberStackPos && *subMemberStackPos > 0 && subMemberStack[*subMemberStackPos - 1]->type == 1)
{
*curMember = subMemberStack[--(*subMemberStackPos)];
*curMember = (*curMember)->next;
}
if(subMemberStackPos && *subMemberStackPos > 0)
{
while(*curMember && ((*curMember)->memberAccess == 2))
*curMember = (*curMember)->next;
}
else
while(*curMember && (*curMember)->name)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, (*curMember)->name, (((void *)0)), (((void *)0)), (((void *)0)));

if(!dataMember)
dataMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(_class, (*curMember)->name, (((void *)0)));
if(dataMember && dataMember->memberAccess != 2)
{
*curMember = dataMember;
break;
}
else
*curMember = (*curMember)->next;
}
if(subMemberStackPos)
{
while((*curMember) && !(*curMember)->isProperty && !(*curMember)->name && ((*curMember)->type == 2 || (*curMember)->type == 1))
{
subMemberStack[(*subMemberStackPos)++] = *curMember;
*curMember = (*curMember)->members.first;
while(*curMember && ((*curMember)->memberAccess == 2))
*curMember = (*curMember)->next;
}
}
}
while(!*curMember)
{
if(!*curMember)
{
if(subMemberStackPos && *subMemberStackPos)
{
*curMember = subMemberStack[--(*subMemberStackPos)];
*curMember = (*curMember)->next;
}
else
{
struct __ecereNameSpace__ecere__com__Class * lastCurClass = *curClass;

if(*curClass == _class)
break;
for(*curClass = _class; (*curClass)->base != lastCurClass && (*curClass)->base->type != 1000 && (*curClass)->inheritanceAccess != 2; *curClass = (*curClass)->base)
;
*curMember = (*curClass)->membersAndProperties.first;
}
if(subMemberStackPos && *subMemberStackPos > 0)
{
while(*curMember && ((*curMember)->memberAccess == 2))
*curMember = (*curMember)->next;
}
else
while(*curMember && (*curMember)->name)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (((void *)0));

if(((*curMember)->memberAccess != 2))
{
dataMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, (*curMember)->name, (((void *)0)), (((void *)0)), (((void *)0)));
if(!dataMember)
dataMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(_class, (*curMember)->name, (((void *)0)));
}
if(dataMember && dataMember->memberAccess != 2 && dataMember->id >= 0)
{
*curMember = dataMember;
break;
}
else
*curMember = (*curMember)->next;
}
if(subMemberStackPos)
{
while((*curMember) && !(*curMember)->isProperty && !(*curMember)->name && ((*curMember)->type == 2 || (*curMember)->type == 1))
{
subMemberStack[(*subMemberStackPos)++] = *curMember;
*curMember = (*curMember)->members.first;
while(*curMember && (*curMember)->memberAccess == 2)
*curMember = (*curMember)->next;
}
}
}
}
}

void __ecereNameSpace__ecere__com__eClass_Resize(struct __ecereNameSpace__ecere__com__Class * _class, int newSize)
{
struct __ecereNameSpace__ecere__sys__OldLink * deriv;

_class->structSize = newSize;
for(deriv = _class->derivatives.first; deriv; deriv = deriv->next)
__ecereNameSpace__ecere__com__FixOffsets(deriv->data);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Class_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Class ** this, const char * string)
{
struct __ecereNameSpace__ecere__com__Class * theClass;

theClass = __ecereNameSpace__ecere__com__eSystem_FindClass(__thisModule, string);
if(!theClass)
theClass = __ecereNameSpace__ecere__com__eSystem_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application, string);
(*this) = (void *)theClass;
return theClass != (((void *)0));
}

static unsigned int __ecereNameSpace__ecere__com__Module_Constructor(struct __ecereNameSpace__ecere__com__Instance * module)
{
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace.classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace.defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace.functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace.nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace.classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace.defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace.functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace.nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
return 1;
}

void __ecereMethod___ecereNameSpace__ecere__com__Class_OnSerialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Class * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(channel, __ecereClass_char__PTR_, this->fullName);
}

void __ecereMethod___ecereNameSpace__ecere__com__Class_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Class ** this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
struct __ecereNameSpace__ecere__com__Class * theClass;
char * string;

__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(channel, __ecereClass_String, (void *)&string);
theClass = __ecereNameSpace__ecere__com__eSystem_FindClass(__thisModule, string);
if(!theClass)
theClass = __ecereNameSpace__ecere__com__eSystem_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application, string);
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
(*this) = (void *)theClass;
}

struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, const char * name, const char * type, unsigned int size, unsigned int alignment, int declMode)
{
if(_class && (name || (!name && !size && !type && alignment)))
{
if(!name || !__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->members, name))
{
if(alignment)
{
short __simpleStruct0;
unsigned int pointerAlignment = alignment == 0xF000F000;
unsigned int force64Bits = (((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)_class->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->isGUIApp & 2) ? 1 : 0;
unsigned int force32Bits = (((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)_class->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->isGUIApp & 4) ? 1 : 0;

if((force32Bits || force64Bits) && name && !strcmp(_class->name, "AVLNode") && !strcmp(name, "__ecerePrivateData0"))
{
if(force64Bits)
{
type = "byte[32]";
size = 32;
}
if(force32Bits)
{
type = "byte[16]";
size = 16;
}
}
if(pointerAlignment)
alignment = force64Bits ? 8 : force32Bits ? 4 : sizeof(void *);
if(pointerAlignment && _class->structAlignment <= 4)
_class->pointerAlignment = 1;
else if(!pointerAlignment && alignment >= 8)
_class->pointerAlignment = 0;
_class->structAlignment = (__simpleStruct0 = _class->structAlignment, (__simpleStruct0 > alignment) ? __simpleStruct0 : alignment);
if(_class->offset % alignment)
{
_class->structSize += alignment - (_class->offset % alignment);
_class->offset += alignment - (_class->offset % alignment);
}
if(_class->memberOffset % alignment)
_class->memberOffset += alignment - (_class->memberOffset % alignment);
}
if(name)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (dataMember = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__DataMember)), dataMember->name = __ecereNameSpace__ecere__sys__CopyString(name), dataMember->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(type), dataMember->id = _class->memberID++, dataMember->_class = _class, dataMember->offset = _class->memberOffset, dataMember->memberOffset = size, dataMember->memberAccess = declMode, dataMember->membersAlpha.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, dataMember);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->membersAndProperties, dataMember);
_class->memberOffset += size;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&_class->members, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__BTNamedLink));

__ecereInstance1->name = dataMember->name, __ecereInstance1->data = dataMember, __ecereInstance1;
}));
return dataMember;
}
}
}
return (((void *)0));
}

static void __ecereNameSpace__ecere__com__Application_Destructor(struct __ecereNameSpace__ecere__com__Instance * app)
{
if(((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->parsedCommand)
{
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv), ((struct __ecereNameSpace__ecere__com__Application * )(((char * )app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->parsedCommand), ((struct __ecereNameSpace__ecere__com__Application * )(((char * )app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->parsedCommand = 0);
}
}

struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_RegisterDefine(const char * name, const char * value, struct __ecereNameSpace__ecere__com__Instance * module, int declMode)
{
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace = (((void *)0));
int start = 0, c;

nameSpace = (declMode == 1) ? &((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace : &((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace;
if(declMode == 4)
nameSpace = &((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace;
if(declMode != 3)
{
for(c = 0; name[c]; c++)
{
if(name[c] == '.' || (name[c] == ':' && name[c + 1] == ':'))
{
struct __ecereNameSpace__ecere__com__NameSpace * newSpace;
char * spaceName = __ecereNameSpace__ecere__com___malloc(c - start + 1);

strncpy(spaceName, name + start, c - start);
spaceName[c - start] = '\0';
newSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*nameSpace).nameSpaces, spaceName);
if(!newSpace)
{
newSpace = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__NameSpace) * (1));
(*newSpace).classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).name = spaceName;
(*newSpace).parent = nameSpace;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*nameSpace).nameSpaces, (struct __ecereNameSpace__ecere__sys__BTNode *)newSpace);
}
else
(__ecereNameSpace__ecere__com__eSystem_Delete(spaceName), spaceName = 0);
nameSpace = newSpace;
if(name[c] == ':')
c++;
start = c + 1;
}
}
}
else
c = (int)strlen(name);
if(c - start && !__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*nameSpace).defines, name + start))
{
struct __ecereNameSpace__ecere__com__DefinedExpression * def = (def = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__DefinedExpression)), def->name = __ecereNameSpace__ecere__sys__CopyString(name), def->nameSpace = nameSpace, def->value = __ecereNameSpace__ecere__sys__CopyString(value), def);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*nameSpace).defines, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__BTNamedLink));

__ecereInstance1->name = def->name + start, __ecereInstance1->data = def, __ecereInstance1;
}));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->defines, def);
return def;
}
return (((void *)0));
}

void __ecereNameSpace__ecere__com__eSystem_SetArgs(struct __ecereNameSpace__ecere__com__Instance * app, int argc, char * argv[])
{
System_SetArgs(argc, argv, &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc, &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv);
}

static void * __ecereNameSpace__ecere__com__Instance_New(struct __ecereNameSpace__ecere__com__Class * _class, unsigned int bindingsAlloc)
{
struct __ecereNameSpace__ecere__com__Instance * instance = (((void *)0));

if(_class)
{
{
int size = _class->structSize;
int flags = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)_class->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->isGUIApp;
unsigned int inCompiler = (flags & 8) ? 1 : 0;
unsigned int force32Bits = (flags & 4) ? 1 : 0;

if(force32Bits && inCompiler)
{
if(!strcmp(_class->name, "Module"))
size = 560;
else if(_class->templateClass && !strcmp(_class->templateClass->name, "Map"))
size = 40;
else
size *= 3;
}
instance = __ecereNameSpace__ecere__com___calloc(1, size);
if(!instance && size)
printf("Failed to allocate memory instantiating %s object!\n", _class->name);
else if(!size)
printf("Warning: 0 size instantiating %s object!\n", _class->name);
}
if(instance && _class->type == 0)
{
((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class = _class;
((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_vTbl = _class->_vTbl;
}
if(instance && !__ecereNameSpace__ecere__com__ConstructInstance(instance, _class, (((void *)0)), bindingsAlloc))
{
__ecereNameSpace__ecere__com___free(instance);
instance = (((void *)0));
}
}
return instance;
}

void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char * name, void * function)
{
if(instance && name)
{
struct __ecereNameSpace__ecere__com__Class * _class;

for(_class = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class; _class; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__Method * method = (struct __ecereNameSpace__ecere__com__Method *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->methods, name);

if(method && method->type == 1)
{
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_vTbl == ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->_vTbl)
{
((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_vTbl = __ecereNameSpace__ecere__com___malloc(sizeof(void *) * ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->vTblSize);
memcpy(((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_vTbl, ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->_vTbl, sizeof(int (*)()) * ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->vTblSize);
}
((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_vTbl[method->vid] = function ? function : (((void *)0));
}
}
}
}

unsigned int __ecereNameSpace__ecere__com__eInstance_IsDerived(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Class * from)
{
if(instance)
{
struct __ecereNameSpace__ecere__com__Class * _class = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class;

for(; _class; _class = _class->base)
{
if(_class == from)
return 1;
}
}
return 0;
}

void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance)
{
if(instance)
((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_refCount++;
}

void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property)
{
if(instance && _property && _property->selfWatchable)
{
struct __ecereNameSpace__ecere__com__Class * _class;

for(_class = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class; _class; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__SelfWatcher * selfWatcher, * next;

for(selfWatcher = _class->selfWatchers.first; selfWatcher; selfWatcher = next)
{
next = selfWatcher->next;
if(selfWatcher->_property == _property)
selfWatcher->callback(instance);
}
}
}
}

void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property)
{
if(instance && _property && _property->isWatchable)
{
struct __ecereNameSpace__ecere__com__Instance * module = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class ? ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->module : (((void *)0));
struct __ecereNameSpace__ecere__com__Instance * application = module ? ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application : (((void *)0));
int flags = application ? ((struct __ecereNameSpace__ecere__com__Application *)(((char *)application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->isGUIApp : 0;
unsigned int inCompiler = (flags & 8) ? 1 : 0;
unsigned int force32Bits = (flags & 4) ? 1 : 0;

if(!force32Bits || !inCompiler)
{
struct __ecereNameSpace__ecere__sys__OldList * watchers = (struct __ecereNameSpace__ecere__sys__OldList *)((unsigned char *)instance + _property->watcherOffset);
struct __ecereNameSpace__ecere__com__Watcher * watcher, * next;

for(watcher = (*watchers).first; watcher; watcher = next)
{
next = watcher->next;
watcher->callback(watcher->object, instance);
}
}
}
}

void __ecereNameSpace__ecere__com__eInstance_WatchDestruction(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Instance * object, void (* callback)(void *, void *))
{
struct __ecereNameSpace__ecere__sys__OldList * watchers = (struct __ecereNameSpace__ecere__sys__OldList *)((unsigned char *)instance + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->destructionWatchOffset);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*watchers), __extension__ ({
struct __ecereNameSpace__ecere__com__Watcher * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__Watcher));

__ecereInstance1->callback = callback, __ecereInstance1->object = object, __ecereInstance1;
}));
}

void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object)
{
if(instance && (!_property || _property->isWatchable))
{
if(_property)
{
struct __ecereNameSpace__ecere__sys__OldList * watchers = (struct __ecereNameSpace__ecere__sys__OldList *)((unsigned char *)instance + _property->watcherOffset);
struct __ecereNameSpace__ecere__com__Watcher * watcher;

for(watcher = (*watchers).first; watcher; watcher = watcher->next)
if(watcher->object == object)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete((&*watchers), watcher);
break;
}
}
else
{
struct __ecereNameSpace__ecere__com__Class * _class, * base;

for(_class = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class; _class; _class = base)
{
if(_class->destructionWatchOffset)
{
struct __ecereNameSpace__ecere__sys__OldList * watchers = (struct __ecereNameSpace__ecere__sys__OldList *)((unsigned char *)instance + _class->destructionWatchOffset);
struct __ecereNameSpace__ecere__com__Watcher * watcher;

for(watcher = (*watchers).first; watcher; watcher = watcher->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete((&*watchers), watcher);
break;
}
}
for(_property = (struct __ecereNameSpace__ecere__com__Property *)_class->membersAndProperties.first; _property; _property = _property->next)
{
if(_property->isProperty && _property->isWatchable)
{
struct __ecereNameSpace__ecere__sys__OldList * watchers = (struct __ecereNameSpace__ecere__sys__OldList *)((unsigned char *)instance + _property->watcherOffset);
struct __ecereNameSpace__ecere__com__Watcher * watcher;

for(watcher = (*watchers).first; watcher; watcher = watcher->next)
if(watcher->object == object)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete((&*watchers), watcher);
break;
}
}
}
base = _class->base;
if(base && (base->type == 1000 || base->isInstanceClass))
base = (((void *)0));
}
}
}
}

struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eInstance_GetDesigner(struct __ecereNameSpace__ecere__com__Instance * instance)
{
if(instance)
return __ecereNameSpace__ecere__com__eClass_GetDesigner(((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class);
return (((void *)0));
}

void __ecereNameSpace__ecere__com__eProperty_SelfWatch(struct __ecereNameSpace__ecere__com__Class * _class, const char * name, void (* callback)(void *))
{
if(_class)
{
struct __ecereNameSpace__ecere__com__Property * _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, name, _class->module);

if(!_property)
_property = __ecereNameSpace__ecere__com__eClass_AddProperty(_class, name, (((void *)0)), (((void *)0)), (((void *)0)), 4);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->selfWatchers, __extension__ ({
struct __ecereNameSpace__ecere__com__SelfWatcher * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__SelfWatcher));

__ecereInstance1->_property = _property, __ecereInstance1->callback = callback, __ecereInstance1;
}));
_property->selfWatchable = 1;
}
}

void __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Set_classDesigner(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__DesignerBase * __ecerePointer___ecereNameSpace__ecere__com__DesignerBase = (struct __ecereNameSpace__ecere__com__DesignerBase *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__DesignerBase->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__com__DesignerBase->classDesigner = value;
__ecereProp___ecereNameSpace__ecere__com__DesignerBase_classDesigner && __ecereProp___ecereNameSpace__ecere__com__DesignerBase_classDesigner->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__com__DesignerBase_classDesigner) : (void)0, __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_classDesigner && __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_classDesigner->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_classDesigner) : (void)0;
}

void __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Set_objectClass(struct __ecereNameSpace__ecere__com__Instance * this, const char *  value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__DesignerBase * __ecerePointer___ecereNameSpace__ecere__com__DesignerBase = (struct __ecereNameSpace__ecere__com__DesignerBase *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__DesignerBase->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__com__DesignerBase->objectClass = value;
__ecereProp___ecereNameSpace__ecere__com__DesignerBase_objectClass && __ecereProp___ecereNameSpace__ecere__com__DesignerBase_objectClass->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__com__DesignerBase_objectClass) : (void)0, __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_objectClass && __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_objectClass->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_objectClass) : (void)0;
}

void __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Set_isDragging(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__DesignerBase * __ecerePointer___ecereNameSpace__ecere__com__DesignerBase = (struct __ecereNameSpace__ecere__com__DesignerBase *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__DesignerBase->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__com__DesignerBase->isDragging = value;
__ecereProp___ecereNameSpace__ecere__com__DesignerBase_isDragging && __ecereProp___ecereNameSpace__ecere__com__DesignerBase_isDragging->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__com__DesignerBase_isDragging) : (void)0, __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_isDragging && __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_isDragging->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_isDragging) : (void)0;
}

struct __ecereNameSpace__ecere__com__SubModule;

struct __ecereNameSpace__ecere__com__SubModule
{
struct __ecereNameSpace__ecere__com__SubModule * prev, * next;
struct __ecereNameSpace__ecere__com__Instance * module;
int importMode;
} ecere_gcc_struct;

static struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereNameSpace__ecere__com__SearchModule(struct __ecereNameSpace__ecere__com__Instance * module, const char * name, void * listOffset, unsigned int searchPrivate)
{
struct __ecereNameSpace__ecere__com__SubModule * subModule;
struct __ecereNameSpace__ecere__com__BTNamedLink * link;

if(searchPrivate)
{
link = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace, name, listOffset);
if(link)
return link;
}
link = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace, name, listOffset);
if(link)
return link;
for(subModule = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->modules.first; subModule; subModule = subModule->next)
{
if(searchPrivate || subModule->importMode == 1)
{
link = __ecereNameSpace__ecere__com__SearchModule(subModule->module, name, listOffset, 0);
if(link)
return link;
}
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_FindDefine(struct __ecereNameSpace__ecere__com__Instance * module, const char * name)
{
if(name && module)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link;

link = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace, name, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).defines);
if(link)
return link->data;
link = __ecereNameSpace__ecere__com__SearchModule(module, name, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).defines, 1);
if(link)
return link->data;
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_FindFunction(struct __ecereNameSpace__ecere__com__Instance * module, const char * name)
{
if(name && module)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link;

link = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace, name, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).functions);
if(link)
return link->data;
link = __ecereNameSpace__ecere__com__SearchModule(module, name, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).functions, 1);
if(link)
return link->data;
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__Class *  __ecereNameSpace__ecere__com__System_FindClass(struct __ecereNameSpace__ecere__com__Instance *  module, const char *  name, unsigned int registerTemplatesInternalDecl);

struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, const char * name)
{
return __ecereNameSpace__ecere__com__System_FindClass(module, name, 0);
}

static struct __ecereNameSpace__ecere__com__Instance *  __ecereNameSpace__ecere__com__Module_Load(struct __ecereNameSpace__ecere__com__Instance *  fromModule, const char *  name, int importAccess, unsigned int ensureCOM);

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__eModule_Load(struct __ecereNameSpace__ecere__com__Instance * fromModule, const char * name, int importAccess)
{
return __ecereNameSpace__ecere__com__Module_Load(fromModule, name, importAccess, 1);
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__eModule_LoadStrict(struct __ecereNameSpace__ecere__com__Instance * fromModule, const char * name, int importAccess)
{
return __ecereNameSpace__ecere__com__Module_Load(fromModule, name, importAccess, 0);
}

struct __ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction
{
struct __ecereNameSpace__ecere__com__GlobalFunction * prev, * next;
const char * name;
int (* function)();
struct __ecereNameSpace__ecere__com__Instance * module;
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace;
const char * dataTypeString;
struct __ecereNameSpace__ecere__com__Instance * dataType;
void * symbol;
} ecere_gcc_struct;

void __ecereNameSpace__ecere__com__eInstance_Evolve(struct __ecereNameSpace__ecere__com__Instance ** instancePtr, struct __ecereNameSpace__ecere__com__Class * _class)
{
if(_class && instancePtr && *instancePtr)
{
unsigned int wasApp = 0, wasGuiApp = 0;
struct __ecereNameSpace__ecere__com__Instance * oldInstance = *instancePtr;
struct __ecereNameSpace__ecere__com__Instance * instance = (struct __ecereNameSpace__ecere__com__Instance *)__ecereNameSpace__ecere__com__eSystem_Renew(*instancePtr, sizeof(unsigned char) * (_class->structSize));
struct __ecereNameSpace__ecere__com__Class * fromClass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class;

*instancePtr = instance;
memset(((unsigned char *)instance) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->structSize, 0, _class->structSize - ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->structSize);
if((wasApp = !strcmp(((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->name, "Application")) || (wasGuiApp = !strcmp(((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->name, "GuiApplication")))
{
struct __ecereNameSpace__ecere__com__Instance * module;
struct __ecereNameSpace__ecere__com__Instance * app = (struct __ecereNameSpace__ecere__com__Instance *)instance;
struct __ecereNameSpace__ecere__com__BTNamedLink * link;
struct __ecereNameSpace__ecere__com__Class * _class;
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace;

for(module = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->allModules.first; module; module = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->next)
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application = app;
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace.classes); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
{
struct __ecereNameSpace__ecere__sys__OldLink * t;

((struct __ecereNameSpace__ecere__com__Class *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace;
for(t = ((struct __ecereNameSpace__ecere__com__Class *)link->data)->templatized.first; t; t = t->next)
{
struct __ecereNameSpace__ecere__com__Class * template = t->data;

template->nameSpace = ((struct __ecereNameSpace__ecere__com__Class *)link->data)->nameSpace;
}
}
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace.classes); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
{
struct __ecereNameSpace__ecere__sys__OldLink * t;

((struct __ecereNameSpace__ecere__com__Class *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace;
for(t = ((struct __ecereNameSpace__ecere__com__Class *)link->data)->templatized.first; t; t = t->next)
{
struct __ecereNameSpace__ecere__com__Class * template = t->data;

template->nameSpace = ((struct __ecereNameSpace__ecere__com__Class *)link->data)->nameSpace;
}
}
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace.defines); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
((struct __ecereNameSpace__ecere__com__DefinedExpression *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace;
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace.defines); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
((struct __ecereNameSpace__ecere__com__DefinedExpression *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace;
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace.functions); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
((struct __ecereNameSpace__ecere__com__GlobalFunction *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace;
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace.functions); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
((struct __ecereNameSpace__ecere__com__GlobalFunction *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace;
for(nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace.nameSpaces); nameSpace; nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)nameSpace)))
(*nameSpace).parent = &((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace;
for(nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace.nameSpaces); nameSpace; nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)nameSpace)))
(*nameSpace).parent = &((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace;
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace.classes); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
{
struct __ecereNameSpace__ecere__sys__OldLink * t;

((struct __ecereNameSpace__ecere__com__Class *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace;
for(t = ((struct __ecereNameSpace__ecere__com__Class *)link->data)->templatized.first; t; t = t->next)
{
struct __ecereNameSpace__ecere__com__Class * template = t->data;

template->nameSpace = ((struct __ecereNameSpace__ecere__com__Class *)link->data)->nameSpace;
}
}
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace.defines); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
((struct __ecereNameSpace__ecere__com__DefinedExpression *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace;
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace.functions); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
((struct __ecereNameSpace__ecere__com__GlobalFunction *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace;
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace.functions); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
((struct __ecereNameSpace__ecere__com__GlobalFunction *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace;
for(nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace.nameSpaces); nameSpace; nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)nameSpace)))
(*nameSpace).parent = &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace;
for(_class = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->classes.first; _class; _class = _class->next)
{
struct __ecereNameSpace__ecere__sys__OldLink * templateLink;

_class->module = (struct __ecereNameSpace__ecere__com__Instance *)app;
for(templateLink = _class->templatized.first; templateLink; templateLink = templateLink->next)
{
struct __ecereNameSpace__ecere__com__Class * template = templateLink->data;

if(template->module == oldInstance)
template->module = _class->module;
}
}
for(module = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->allModules.first; module; module = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->next)
{
for(_class = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->classes.first; _class; _class = _class->next)
{
struct __ecereNameSpace__ecere__sys__OldLink * templateLink;
struct __ecereNameSpace__ecere__com__Instance * oldModule = _class->module;

_class->module = module;
for(templateLink = _class->templatized.first; templateLink; templateLink = templateLink->next)
{
struct __ecereNameSpace__ecere__com__Class * template = templateLink->data;

if(template->module == oldModule)
template->module = _class->module;
}
}
}
((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application = app;
}
{
struct __ecereNameSpace__ecere__com__Class * base;

for(base = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class; base && base->type == 0 && base->count; base = base->base)
(base->templateClass ? base->templateClass : base)->count--;
}
((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class = _class;
((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_vTbl = _class->_vTbl;
if(!__ecereNameSpace__ecere__com__ConstructInstance(instance, _class, fromClass, 0))
{
__ecereNameSpace__ecere__com___free(instance);
*instancePtr = (((void *)0));
}
}
}

struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(const char * name, const char * type, void * func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode)
{
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace = (((void *)0));
int start = 0, c;

nameSpace = (declMode == 1) ? &((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace : &((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace;
if(declMode == 4)
nameSpace = &((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace;
if(declMode != 3)
{
for(c = 0; name[c]; c++)
{
if(name[c] == '.' || (name[c] == ':' && name[c + 1] == ':'))
{
struct __ecereNameSpace__ecere__com__NameSpace * newSpace;
char * spaceName = __ecereNameSpace__ecere__com___malloc(c - start + 1);

strncpy(spaceName, name + start, c - start);
spaceName[c - start] = '\0';
newSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*nameSpace).nameSpaces, spaceName);
if(!newSpace)
{
newSpace = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__NameSpace) * (1));
(*newSpace).classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).name = spaceName;
(*newSpace).parent = nameSpace;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*nameSpace).nameSpaces, (struct __ecereNameSpace__ecere__sys__BTNode *)newSpace);
}
else
(__ecereNameSpace__ecere__com__eSystem_Delete(spaceName), spaceName = 0);
nameSpace = newSpace;
if(name[c] == ':')
c++;
start = c + 1;
}
}
}
else
c = (int)strlen(name);
if(c - start && !__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*nameSpace).functions, name + start))
{
struct __ecereNameSpace__ecere__com__GlobalFunction * function = (function = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__GlobalFunction)), function->name = __ecereNameSpace__ecere__sys__CopyString(name), function->nameSpace = nameSpace, function->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(type), function->function = func, function->module = module, function);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*nameSpace).functions, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__BTNamedLink));

__ecereInstance1->name = function->name + start, __ecereInstance1->data = function, __ecereInstance1;
}));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->functions, function);
return function;
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__ClassTemplateParameter;

struct __ecereNameSpace__ecere__com__ClassTemplateParameter
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * prev, * next;
const char * name;
int type;
union
{
const char * dataTypeString;
int memberType;
} ecere_gcc_struct __anon1;
struct __ecereNameSpace__ecere__com__ClassTemplateArgument defaultArg;
void * param;
} ecere_gcc_struct;

static void __ecereNameSpace__ecere__com__FreeTemplateArg(struct __ecereNameSpace__ecere__com__Class * template, struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param, int id)
{
switch(param->type)
{
case 0:
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)template->templateArgs[id].__anon1.__anon1.dataTypeString), template->templateArgs[id].__anon1.__anon1.dataTypeString = 0);
template->templateArgs[id].__anon1.__anon1.dataTypeClass = (((void *)0));
break;
case 1:
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)template->templateArgs[id].__anon1.__anon2.memberString), template->templateArgs[id].__anon1.__anon2.memberString = 0);
break;
case 2:
break;
}
}

static void __ecereNameSpace__ecere__com__FreeTemplateArgs(struct __ecereNameSpace__ecere__com__Class * template)
{
if(template->templateArgs)
{
struct __ecereNameSpace__ecere__com__Class * _class;

for(_class = template; _class; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__Class * prevClass;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;
int id = 0;

if(_class->templateClass)
_class = _class->templateClass;
for(prevClass = _class->base; prevClass; prevClass = prevClass->base)
{
if(prevClass->templateClass)
prevClass = prevClass->templateClass;
id += prevClass->templateParams.count;
}
if(id < template->numParams)
{
for(param = _class->templateParams.first; param; param = param->next)
{
switch(param->type)
{
case 0:
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)template->templateArgs[id].__anon1.__anon1.dataTypeString), template->templateArgs[id].__anon1.__anon1.dataTypeString = 0);
template->templateArgs[id].__anon1.__anon1.dataTypeClass = (((void *)0));
break;
case 1:
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)template->templateArgs[id].__anon1.__anon2.memberString), template->templateArgs[id].__anon1.__anon2.memberString = 0);
break;
case 2:
break;
}
id++;
}
}
}
}
}

static void __ecereNameSpace__ecere__com__CopyTemplateArg(struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * arg)
{
switch(param->type)
{
case 0:
arg->__anon1.__anon1.dataTypeString = __ecereNameSpace__ecere__sys__CopyString(arg->__anon1.__anon1.dataTypeString);
break;
case 2:
break;
case 1:
arg->__anon1.__anon2.memberString = __ecereNameSpace__ecere__sys__CopyString(arg->__anon1.__anon2.memberString);
break;
}
}

unsigned int __ecereNameSpace__ecere__com__eClass_IsDerived(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class * from)
{
if(!_class && !from)
return 1;
if(_class && from && (_class->templateClass || from->templateClass))
{
if(__ecereNameSpace__ecere__com__eClass_IsDerived(_class->templateClass ? _class->templateClass : _class, from->templateClass ? from->templateClass : from))
{
if(!from->templateClass)
return 1;
else if(!_class->templateClass && _class == from->templateClass)
return 0;
else
{
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = from; sClass; sClass = sClass->base)
{
if(sClass->templateParams.first)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;
struct __ecereNameSpace__ecere__com__Class * nextClass;
int p = 0;

for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
p += nextClass->templateParams.count;
for(param = sClass->templateParams.first; param; param = param->next, p++)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument * arg = &_class->templateArgs[p];
struct __ecereNameSpace__ecere__com__ClassTemplateArgument * fArg = &from->templateArgs[p];

if(param->type == 0)
{
if((*arg).__anon1.__anon1.dataTypeString != (*fArg).__anon1.__anon1.dataTypeString && (*arg).__anon1.__anon1.dataTypeString && (*fArg).__anon1.__anon1.dataTypeString && strcmp((*arg).__anon1.__anon1.dataTypeString, (*fArg).__anon1.__anon1.dataTypeString))
break;
}
else if(param->type == 1)
{
if((*arg).__anon1.__anon2.__anon1.member != (*fArg).__anon1.__anon2.__anon1.member)
break;
}
else if(param->type == 2)
{
if((*arg).__anon1.expression.__anon1.ui64 != (*fArg).__anon1.expression.__anon1.ui64)
break;
}
}
if(param)
return 0;
}
}
return 1;
}
}
}
else
{
for(; _class && from; _class = _class->base)
{
if(_class == from || _class->templateClass == from || ((_class->type == 1000 || (_class->type == 0 && _class->isInstanceClass)) && from->name && !strcmp(_class->name, from->name)))
return 1;
}
}
return 0;
}

static void __ecereNameSpace__ecere__com__FreeTemplatesDerivatives(struct __ecereNameSpace__ecere__com__Class * base)
{
struct __ecereNameSpace__ecere__sys__OldLink * derivative, * templateLink;

for(derivative = base->derivatives.first; derivative; derivative = derivative->next)
{
struct __ecereNameSpace__ecere__com__Class * _class = derivative->data;

if(_class->templateArgs)
{
__ecereNameSpace__ecere__com__FreeTemplateArgs(_class);
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->templateArgs), _class->templateArgs = 0);
}
__ecereNameSpace__ecere__com__FreeTemplatesDerivatives(_class);
}
for(templateLink = base->templatized.first; templateLink; templateLink = templateLink->next)
{
struct __ecereNameSpace__ecere__com__Class * _class = templateLink->data;

if(_class->templateArgs)
{
__ecereNameSpace__ecere__com__FreeTemplateArgs(_class);
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->templateArgs), _class->templateArgs = 0);
}
__ecereNameSpace__ecere__com__FreeTemplatesDerivatives(_class);
}
}

static void __ecereNameSpace__ecere__com__FreeTemplate(struct __ecereNameSpace__ecere__com__Class * template)
{
struct __ecereNameSpace__ecere__sys__OldLink * deriv;

if(template->nameSpace)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*template->nameSpace).classes, template->name);

if(link)
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*template->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)link);
}
__ecereNameSpace__ecere__com__FreeTemplatesDerivatives(template);
__ecereNameSpace__ecere__com__FreeTemplateArgs(template);
while((deriv = template->derivatives.first))
{
((struct __ecereNameSpace__ecere__com__Class *)deriv->data)->base = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&template->derivatives, deriv);
}
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)template->fullName), template->fullName = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)template->name), template->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(template->templateArgs), template->templateArgs = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)template->dataTypeString), template->dataTypeString = 0);
if(template->module)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)template->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->classes, template);
else
__ecereNameSpace__ecere__com___free(template);
}

static void __ecereNameSpace__ecere__com__FreeTemplates(struct __ecereNameSpace__ecere__com__Class * _class)
{
struct __ecereNameSpace__ecere__sys__OldLink * deriv, * template;

for(deriv = _class->derivatives.first; deriv; deriv = deriv->next)
{
__ecereNameSpace__ecere__com__FreeTemplates(deriv->data);
}
__ecereNameSpace__ecere__com__FreeTemplateArgs(_class);
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->templateArgs), _class->templateArgs = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)_class->dataTypeString), _class->dataTypeString = 0);
while((template = _class->templatized.first))
{
__ecereNameSpace__ecere__com__FreeTemplates(template->data);
__ecereNameSpace__ecere__com__FreeTemplate(template->data);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->templatized, template);
}
}

void __ecereNameSpace__ecere__com__eClass_Unregister(struct __ecereNameSpace__ecere__com__Class * _class)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * namedLink;
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Method * method;
struct __ecereNameSpace__ecere__sys__OldLink * deriv, * template;
struct __ecereNameSpace__ecere__com__ClassProperty * classProp;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

if(_class->templateClass)
{
struct __ecereNameSpace__ecere__sys__OldLink * templateLink;

for(templateLink = _class->templateClass->templatized.first; templateLink; templateLink = templateLink->next)
{
if(templateLink->data == _class)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->templateClass->templatized, templateLink);
break;
}
}
__ecereNameSpace__ecere__com__FreeTemplate(_class);
return ;
}
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->_vTbl), _class->_vTbl = 0);
__ecereNameSpace__ecere__com__FreeTemplates(_class);
while((template = _class->templatized.first))
{
__ecereNameSpace__ecere__com__FreeTemplate(template->data);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->templatized, template);
}
while((member = _class->membersAndProperties.first))
{
if(!member->isProperty && (member->type == 1 || member->type == 2))
__ecereNameSpace__ecere__com__DataMember_Free(member);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)member->name), member->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)member->dataTypeString), member->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->membersAndProperties, member);
}
while((member = _class->conversions.first))
{
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)member->name), member->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)member->dataTypeString), member->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->conversions, member);
}
while((namedLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->prop)))
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&_class->prop, (struct __ecereNameSpace__ecere__sys__BTNode *)namedLink);
}
while((namedLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->members)))
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&_class->members, (struct __ecereNameSpace__ecere__sys__BTNode *)namedLink);
}
while((classProp = (struct __ecereNameSpace__ecere__com__ClassProperty *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->classProperties)))
{
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)classProp->name), classProp->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)classProp->dataTypeString), classProp->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&_class->classProperties, (struct __ecereNameSpace__ecere__sys__BTNode *)classProp);
}
while((method = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->methods)))
{
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)method->name), method->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)method->dataTypeString), method->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&_class->methods, (struct __ecereNameSpace__ecere__sys__BTNode *)method);
}
if(_class->type == 4)
{
struct __ecereNameSpace__ecere__com__EnumClassData * data = (struct __ecereNameSpace__ecere__com__EnumClassData *)_class->data;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&data->values, (void *)__ecereNameSpace__ecere__com__FreeEnumValue);
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&_class->delayedCPValues, (((void *)0)));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&_class->selfWatchers, (((void *)0)));
if(_class->base)
{
struct __ecereNameSpace__ecere__com__Class * base = _class->base;

for(deriv = base->derivatives.first; deriv; deriv = deriv->next)
{
if(deriv->data == _class)
break;
}
if(deriv)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&base->derivatives, deriv);
}
while((deriv = _class->derivatives.first))
{
((struct __ecereNameSpace__ecere__com__Class *)deriv->data)->base = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->derivatives, deriv);
}
if(_class->nameSpace)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*_class->nameSpace).classes, _class->name);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*_class->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)link);
}
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)_class->name), _class->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)_class->fullName), _class->fullName = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)_class->dataTypeString), _class->dataTypeString = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->data), _class->data = 0);
while((param = _class->templateParams.first))
{
switch(param->type)
{
case 0:
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)param->defaultArg.__anon1.__anon1.dataTypeString), param->defaultArg.__anon1.__anon1.dataTypeString = 0);
break;
case 1:
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)param->defaultArg.__anon1.__anon2.memberString), param->defaultArg.__anon1.__anon2.memberString = 0);
break;
case 2:
break;
}
if(param->type != 1)
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)param->__anon1.dataTypeString), param->__anon1.dataTypeString = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)param->name), param->name = 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->templateParams, param);
}
__ecereNameSpace__ecere__com___free(_class);
}

void __ecereNameSpace__ecere__com__eInstance_Delete(struct __ecereNameSpace__ecere__com__Instance * instance)
{
if(instance)
{
struct __ecereNameSpace__ecere__com__Class * _class, * base;
unsigned int ownVtbl;

ownVtbl = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_vTbl != ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->_vTbl;
for(_class = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class; _class; _class = base)
{
if(_class->templateClass)
_class = _class->templateClass;
if(_class->destructionWatchOffset)
{
struct __ecereNameSpace__ecere__sys__OldList * watchers = (struct __ecereNameSpace__ecere__sys__OldList *)((unsigned char *)instance + _class->destructionWatchOffset);
struct __ecereNameSpace__ecere__com__Watcher * watcher, * next;

for(watcher = (*watchers).first; watcher; watcher = next)
{
next = watcher->next;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*watchers), watcher);
watcher->callback(watcher->object, instance);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete((&*watchers), watcher);
}
}
base = _class->base;
if(base && (base->type == 1000 || base->isInstanceClass))
base = (((void *)0));
if(_class->Destructor)
_class->Destructor(instance);
}
for(_class = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class; _class; _class = base)
{
int cCount;

if(_class->templateClass)
_class = _class->templateClass;
base = _class->base;
cCount = --(_class->templateClass ? _class->templateClass : _class)->count;
if(!cCount && _class->type == 0 && !_class->module)
{
__ecereNameSpace__ecere__com__eClass_Unregister(_class);
}
}
if(ownVtbl)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_vTbl), ((struct __ecereNameSpace__ecere__com__Instance * )(char * )instance)->_vTbl = 0);
}
__ecereNameSpace__ecere__com___free(instance);
}
}

struct __ecereNameSpace__ecere__com__ClassTemplateParameter * __ecereNameSpace__ecere__com__eClass_AddTemplateParameter(struct __ecereNameSpace__ecere__com__Class * _class, const char * name, int type, const void * info, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * defaultArg)
{
if(_class && name)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

for(param = _class->templateParams.first; param; param = param->next)
{
if(!strcmp(param->name, name))
return param;
}
param = __extension__ ({
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__ClassTemplateParameter));

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(name), __ecereInstance1->type = type, __ecereInstance1->__anon1.dataTypeString = (type == 1) ? info : __ecereNameSpace__ecere__sys__CopyString(info), __ecereInstance1;
});
{
struct __ecereNameSpace__ecere__com__Class * c = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, name);

if(c && c->internalDecl)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)c->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->classes, c);
__ecereNameSpace__ecere__com__eClass_Unregister(c);
}
}
if(defaultArg != (((void *)0)))
{
param->defaultArg = *defaultArg;
__ecereNameSpace__ecere__com__CopyTemplateArg(param, &param->defaultArg);
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->templateParams, param);
return param;
}
return (((void *)0));
}

void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance)
{
if(instance)
{
((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_refCount--;
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_refCount <= 0)
{
__ecereNameSpace__ecere__com__eInstance_Delete(instance);
}
}
}

static struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__Module_Load(struct __ecereNameSpace__ecere__com__Instance * fromModule, const char * name, int importAccess, unsigned int ensureCOM)
{
unsigned int (ecere_stdcall * Load)(struct __ecereNameSpace__ecere__com__Instance * module) = (((void *)0));
unsigned int (ecere_stdcall * Unload)(struct __ecereNameSpace__ecere__com__Instance * module) = (((void *)0));
struct __ecereNameSpace__ecere__com__Instance * module;

for(module = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->allModules.first; module; module = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->next)
{
if(!strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name, name))
break;
}
if(ensureCOM && (!strcmp(name, "ecereCOM") || !strcmp(name, "ecere")))
{
for(module = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->allModules.first; module; module = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->next)
{
if(!strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name, "ecere") || !strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name, "ecereCOM"))
break;
}
}
if(!module)
{
void * library = (((void *)0));

if(ensureCOM && !strcmp(name, "ecereCOM"))
{
Load = (void *)(__ecereDll_Load_ecere);
Unload = (void *)(__ecereDll_Unload_ecere);
}
else
{
const char * libLocation = (((void *)0));

library = Instance_Module_Load(libLocation, name, (void *)(&Load), (void *)(&Unload));
}
if(Load)
{
module = (struct __ecereNameSpace__ecere__com__Instance *)__ecereNameSpace__ecere__com__eInstance_New(__ecereNameSpace__ecere__com__eSystem_FindClass(fromModule, "Module"));
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->library = library;
{
char moduleName[274];
char ext[17];

__ecereNameSpace__ecere__sys__GetLastDirectory(name, moduleName);
__ecereNameSpace__ecere__sys__GetExtension(moduleName, ext);
__ecereNameSpace__ecere__sys__StripExtension(moduleName);
if((!(strcasecmp)(ext, "dylib") || !(strcasecmp)(ext, "so")) && strstr(moduleName, "lib") == moduleName)
{
int len = (int)strlen(moduleName) - 3;

memmove(moduleName, moduleName + 3, len);
moduleName[len] = 0;
}
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name = __ecereNameSpace__ecere__sys__CopyString(moduleName);
}
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->Unload = Unload;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->origImportType = 0;
if(!Load(module))
{
__ecereNameSpace__ecere__com__eInstance_Delete((struct __ecereNameSpace__ecere__com__Instance *)module);
module = (((void *)0));
}
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->allModules, module);
}
if(ensureCOM && !strcmp(name, "ecere") && module)
{
name = !strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name, "ecereCOM") ? "ecereCOM" : "ecere";
if((!Load && !strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name, "ecereCOM")) || (Load && (!__thisModule || !((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name || !strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name, "ecereCOM")) && Load != (void *)__ecereDll_Load_ecere))
{
struct __ecereNameSpace__ecere__com__Instance * module;

for(module = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->allModules.first; module; module = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->next)
{
if(!strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name, name))
break;
}
if(!module)
{
Load = (void *)(__ecereDll_Load_ecere);
Unload = (void *)(__ecereDll_Unload_ecere);
module = (struct __ecereNameSpace__ecere__com__Instance *)__ecereNameSpace__ecere__com__eInstance_New(__ecereNameSpace__ecere__com__eSystem_FindClass(fromModule, "Module"));
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->library = (((void *)0));
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name = __ecereNameSpace__ecere__sys__CopyString(name);
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->Unload = Unload;
if(!Load(module))
{
__ecereNameSpace__ecere__com__eInstance_Delete((struct __ecereNameSpace__ecere__com__Instance *)module);
module = (((void *)0));
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->allModules, module);
}
if(module)
{
if(fromModule)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->modules, __extension__ ({
struct __ecereNameSpace__ecere__com__SubModule * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__SubModule);

__ecereInstance1->module = module, __ecereInstance1->importMode = importAccess, __ecereInstance1;
}));
}
module->_refCount++;
}
}
}
if(module)
{
if(fromModule)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->modules, __extension__ ({
struct __ecereNameSpace__ecere__com__SubModule * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__SubModule);

__ecereInstance1->module = module, __ecereInstance1->importMode = importAccess, __ecereInstance1;
}));
}
module->_refCount++;
}
return module;
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__eModule_LoadStatic(struct __ecereNameSpace__ecere__com__Instance * fromModule, const char * name, int importAccess, unsigned int (* Load)(struct __ecereNameSpace__ecere__com__Instance * module), unsigned int (* Unload)(struct __ecereNameSpace__ecere__com__Instance * module))
{
struct __ecereNameSpace__ecere__com__Instance * module;

for(module = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->allModules.first; module; module = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->next)
{
if(!strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name, name))
break;
}
if(!module)
{
if(Load)
{
module = (struct __ecereNameSpace__ecere__com__Instance *)__ecereNameSpace__ecere__com__eInstance_New(__ecereNameSpace__ecere__com__eSystem_FindClass(fromModule, "Module"));
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name = __ecereNameSpace__ecere__sys__CopyString(name);
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->origImportType = 1;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->Unload = (void *)Unload;
if(!Load(module))
{
__ecereNameSpace__ecere__com__eInstance_Delete((struct __ecereNameSpace__ecere__com__Instance *)module);
module = (((void *)0));
}
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->allModules, module);
}
if(module)
{
if(fromModule)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->modules, __extension__ ({
struct __ecereNameSpace__ecere__com__SubModule * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__SubModule);

__ecereInstance1->module = module, __ecereInstance1->importMode = importAccess, __ecereInstance1;
}));
}
module->_refCount++;
}
return module;
}

void __ecereNameSpace__ecere__com__eModule_Unload(struct __ecereNameSpace__ecere__com__Instance * fromModule, struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__sys__OldLink * m;

for(m = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->modules.first; m; m = m->next)
{
if(m->data == module)
break;
}
if(m)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->modules, m);
(__ecereNameSpace__ecere__com__eInstance_DecRef(module), module = 0);
}
}

static void __ecereNameSpace__ecere__com__Module_Destructor(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * _class;
struct __ecereNameSpace__ecere__com__DefinedExpression * def;
struct __ecereNameSpace__ecere__com__GlobalFunction * function;
struct __ecereNameSpace__ecere__com__Instance * m;
struct __ecereNameSpace__ecere__com__SubModule * handle;

for(m = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->allModules.first; m; m = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)m + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->next)
{
struct __ecereNameSpace__ecere__com__SubModule * next;

for(handle = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)m + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->modules.first; handle; handle = next)
{
next = handle->next;
if(handle->module == module)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)m + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->modules, handle);
}
}
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->Unload)
{
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->origImportType == 1)
{
unsigned int (* Unload)(struct __ecereNameSpace__ecere__com__Instance * module) = (void *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->Unload;

Unload(module);
}
else
{
unsigned int (ecere_stdcall * Unload)(struct __ecereNameSpace__ecere__com__Instance * module) = (void *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->Unload;

Unload(module);
}
}
{
struct __ecereNameSpace__ecere__com__Instance * ourWorld = __ecereClass___ecereNameSpace__ecere__com__Class->module;
void * ourHandle = (((void *)0));

while((handle = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->modules.last))
{
struct __ecereNameSpace__ecere__com__Instance * depModule = handle->module;

if(depModule == ourWorld)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->modules, handle);
ourHandle = handle;
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->modules, handle);
(__ecereNameSpace__ecere__com__eInstance_DecRef(depModule), depModule = 0);
}
}
if(ourHandle)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(ourHandle), ourHandle = 0);
(__ecereNameSpace__ecere__com__eInstance_DecRef(ourWorld), ourWorld = 0);
}
}
for(; (_class = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->classes.first); )
{
if(_class->nameSpace)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * classLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*_class->nameSpace).classes, _class->name);

if(classLink)
{
struct __ecereNameSpace__ecere__sys__OldLink * t;

for(t = _class->templatized.first; t; t = t->next)
{
struct __ecereNameSpace__ecere__com__Class * template = t->data;
struct __ecereNameSpace__ecere__com__BTNamedLink * link;

link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*template->nameSpace).classes, template->name);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*template->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)link);
template->nameSpace = (((void *)0));
}
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*_class->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)classLink);
}
_class->nameSpace = (((void *)0));
}
_class->module = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->classes, _class);
if(_class->count <= 0 || _class->type != 0 || _class->isInstanceClass)
__ecereNameSpace__ecere__com__eClass_Unregister(_class);
else
{
}
}
for(; (def = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->defines.first); )
{
if(def->nameSpace)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * defLink;

for(defLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&(*def->nameSpace).defines); defLink; defLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)defLink)))
if(defLink->data == def)
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*def->nameSpace).defines, (struct __ecereNameSpace__ecere__sys__BTNode *)defLink);
break;
}
}
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)def->name), def->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)def->value), def->value = 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->defines, def);
}
for(; (function = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->functions.first); )
{
if(function->nameSpace)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * functionLink;

for(functionLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&(*function->nameSpace).functions); functionLink; functionLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)functionLink)))
if(functionLink->data == function)
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*function->nameSpace).functions, (struct __ecereNameSpace__ecere__sys__BTNode *)functionLink);
break;
}
}
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)function->name), function->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)function->dataTypeString), function->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->functions, function);
}
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name), ((struct __ecereNameSpace__ecere__com__Module * )(((char * )module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name = 0);
__ecereNameSpace__ecere__com__NameSpace_Free(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace);
__ecereNameSpace__ecere__com__NameSpace_Free(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace);
if(module != ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->allModules, module);
else
__ecereNameSpace__ecere__com__NameSpace_Free(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace);
Instance_Module_Free(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->library);
}

static void __ecereNameSpace__ecere__com__FixDerivativesBase(struct __ecereNameSpace__ecere__com__Class *  base, struct __ecereNameSpace__ecere__com__Class *  mod);

struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, const char * name, const char * baseName, int size, int sizeClass, unsigned int (* Constructor)(void *), void (* Destructor)(void *), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess)
{
int start = 0, c;
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace = (((void *)0));
unsigned int force64Bits = (((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->isGUIApp & 2) ? 1 : 0;
unsigned int force32Bits = (((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->isGUIApp & 4) ? 1 : 0;
unsigned int inCompiler = (((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->isGUIApp & 8) ? 1 : 0;
unsigned int crossBits = force32Bits || force64Bits;
unsigned int fixed = 0;

if(inCompiler && crossBits)
{
struct __ecereNameSpace__ecere__com__Class * c = __ecereNameSpace__ecere__com__eSystem_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application, name);

if(c && c->fixed)
fixed = 1;
else if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name && !strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name, "ecereCOM"))
fixed = 1;
}
{
nameSpace = (declMode == 1) ? &((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace : &((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace;
if(declMode == 4)
nameSpace = &((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace;
{
for(c = 0; name[c]; c++)
{
if(name[c] == '.' || (name[c] == ':' && name[c + 1] == ':'))
{
struct __ecereNameSpace__ecere__com__NameSpace * newSpace;
char * spaceName = __ecereNameSpace__ecere__com___malloc(c - start + 1);

strncpy(spaceName, name + start, c - start);
spaceName[c - start] = '\0';
newSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*nameSpace).nameSpaces, spaceName);
if(!newSpace)
{
newSpace = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__NameSpace) * (1));
(*newSpace).classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).name = spaceName;
(*newSpace).parent = nameSpace;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*nameSpace).nameSpaces, (struct __ecereNameSpace__ecere__sys__BTNode *)newSpace);
}
else
(__ecereNameSpace__ecere__com__eSystem_Delete(spaceName), spaceName = 0);
nameSpace = newSpace;
if(name[c] == ':')
c++;
start = c + 1;
}
}
}
}
if(c - start)
{
int offsetClass;
int totalSizeClass;
struct __ecereNameSpace__ecere__com__BTNamedLink * classLink = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * _class = (((void *)0));
const char * dataTypeString = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * enumBase = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * base = (baseName && baseName[0]) ? __ecereNameSpace__ecere__com__System_FindClass(module, baseName, 1) : (((void *)0));
struct __ecereNameSpace__ecere__com__Class * prevBase = (((void *)0));

if(base && !base->internalDecl && (base->type == 5 || base->type == 1 || base->type == 0))
{
if(base->type == 1 && type == 0)
type = 5;
else
type = base->type;
}
if(base && (type == 0 || type == 5 || type == 1) && (base->type == 3 || base->type == 2 || base->type == 4))
{
type = base->type;
}
if(!base || base->type == 1000 || base->isInstanceClass)
{
if(type == 4)
{
if(base || !baseName || !baseName[0] || !strcmp(baseName, "unsigned int") || !strcmp(baseName, "uint") || !strcmp(baseName, "unsigned int64") || !strcmp(baseName, "uint64") || !strcmp(baseName, "int64") || !strcmp(baseName, "unsigned short") || !strcmp(baseName, "short") || !strcmp(baseName, "unsigned char") || !strcmp(baseName, "byte") || !strcmp(baseName, "char") || !strcmp(baseName, "uint32") || !strcmp(baseName, "uint16"))
{
base = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "enum");
dataTypeString = (baseName && baseName[0]) ? baseName : "int";
}
else
{
base = __ecereNameSpace__ecere__com__eSystem_RegisterClass((int)0, baseName, (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, declMode, 1);
base->internalDecl = 1;
enumBase = base;
base = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "enum");
}
}
else if(type == 1 && (!baseName || !baseName[0]))
{
base = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "struct");
dataTypeString = name + start;
}
else
{
if(type == 0)
dataTypeString = "struct __ecereNameSpace__ecere__com__Instance";
else if(type == 5)
dataTypeString = "void *";
else if(type == 2)
dataTypeString = (baseName && baseName[0]) ? baseName : "unsigned int";
else if(type == 3)
dataTypeString = (baseName && baseName[0]) ? baseName : "int";
else if(type == 1)
dataTypeString = name + start;
if(base || (!baseName || !baseName[0]) || type == 2 || type == 3)
{
if(base || !baseName || !baseName[0] || !strcmp(baseName, "unsigned int") || !strcmp(baseName, "uint") || !strcmp(baseName, "unsigned int64") || !strcmp(baseName, "uint64") || !strcmp(baseName, "int64") || !strcmp(baseName, "unsigned short") || !strcmp(baseName, "short") || !strcmp(baseName, "unsigned char") || !strcmp(baseName, "byte") || !strcmp(baseName, "char") || !strcmp(baseName, "uint32") || !strcmp(baseName, "uint16"))
{
if(type == 0 && strcmp(name, "ecere::com::Instance") && strcmp(name, "enum") && strcmp(name, "struct"))
base = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Instance");
else
base = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "class");
}
}
else
{
}
}
}
else
{
if(type == 4)
{
if(base->type != 4)
{
enumBase = base;
base = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "enum");
}
}
dataTypeString = enumBase ? enumBase->dataTypeString : base->dataTypeString;
}
offsetClass = base ? base->sizeClass : (type == 5 ? 0 : 0);
totalSizeClass = offsetClass + sizeClass;
_class = __ecereNameSpace__ecere__com__System_FindClass(module, name, 1);
if(!_class)
{
const char * colons = __ecereNameSpace__ecere__sys__RSearchString(name, "::", strlen(name), 1, 0);

if(colons && colons)
{
_class = __ecereNameSpace__ecere__com__System_FindClass(module, colons + 2, 1);
if(_class)
{
if(_class->internalDecl)
{
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)_class->fullName), _class->fullName = 0);
_class->fullName = __ecereNameSpace__ecere__sys__CopyString(name);
}
else
_class = (((void *)0));
}
}
}
if(_class)
{
if(!_class->internalDecl)
{
if(declMode != 4)
printf("error: Redefinition of class %s\n", name);
else
{
_class->comRedefinition = 1;
return _class;
}
return (((void *)0));
}
__ecereNameSpace__ecere__com__FreeTemplatesDerivatives(_class);
classLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*_class->nameSpace).classes, name + start);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*_class->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)classLink);
{
struct __ecereNameSpace__ecere__sys__OldLink * t;

for(t = _class->templatized.first; t; t = t->next)
{
struct __ecereNameSpace__ecere__com__Class * template = t->data;

classLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*_class->nameSpace).classes, template->name);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*_class->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)classLink);
}
}
{
struct __ecereNameSpace__ecere__com__NameSpace * ns = _class->nameSpace;

while(ns != nameSpace && (*ns).parent && !__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&(*ns).classes) && !__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&(*ns).functions) && !__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&(*ns).defines) && !__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&(*ns).nameSpaces))
{
struct __ecereNameSpace__ecere__com__NameSpace * parent = (*ns).parent;

__ecereNameSpace__ecere__com__NameSpace_Free(ns);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*parent).nameSpaces, (struct __ecereNameSpace__ecere__sys__BTNode *)ns);
ns = parent;
}
}
}
else
{
classLink = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace, name, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes);
if(!classLink)
classLink = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace, name, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes);
if(!classLink)
classLink = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace, name + start, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes);
if(!classLink)
classLink = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace, name + start, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes);
if(classLink)
_class = classLink->data;
if(_class && _class->internalDecl)
{
__ecereNameSpace__ecere__com__FreeTemplatesDerivatives(_class);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*_class->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)classLink);
{
struct __ecereNameSpace__ecere__sys__OldLink * t;

for(t = _class->templatized.first; t; t = t->next)
{
struct __ecereNameSpace__ecere__com__Class * template = t->data;

classLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*_class->nameSpace).classes, template->name);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*_class->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)classLink);
}
}
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)_class->fullName), _class->fullName = 0);
_class->fullName = __ecereNameSpace__ecere__sys__CopyString(name);
}
else
{
_class = __ecereNameSpace__ecere__com___calloc(1, sizeof(struct __ecereNameSpace__ecere__com__Class));
_class->methods.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
_class->members.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
_class->prop.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
_class->classProperties.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
_class->name = __ecereNameSpace__ecere__sys__CopyString(name + start);
_class->fullName = __ecereNameSpace__ecere__sys__CopyString(name);
}
}
if(nameSpace)
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__BTNamedLink));

__ecereInstance1->name = (char *)_class->name, __ecereInstance1->data = _class, __ecereInstance1;
}));
{
struct __ecereNameSpace__ecere__sys__OldLink * t;

for(t = _class->templatized.first; t; t = t->next)
{
struct __ecereNameSpace__ecere__com__Class * template = t->data;

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__BTNamedLink));

__ecereInstance1->name = (char *)template->name, __ecereInstance1->data = template, __ecereInstance1;
}));
}
}
}
if(_class)
{
if(!base && baseName && strcmp(baseName, name))
{
if(strchr(baseName, '<'))
{
char templateClassName[1024];
struct __ecereNameSpace__ecere__com__Class * templateBase;

strcpy(templateClassName, baseName);
*strchr(templateClassName, '<') = '\0';
templateBase = __ecereNameSpace__ecere__com__System_FindClass(module, templateClassName, 1);
if(!templateBase)
{
templateBase = __ecereNameSpace__ecere__com__eSystem_RegisterClass((int)0, templateClassName, (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, declMode, 1);
templateBase->internalDecl = 1;
}
base = __ecereNameSpace__ecere__com__System_FindClass(module, baseName, 1);
}
else
{
base = __ecereNameSpace__ecere__com__eSystem_RegisterClass((int)0, baseName, (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, declMode, 1);
base->internalDecl = 1;
}
}
else
_class->internalDecl = 0;
if(totalSizeClass)
{
_class->data = __ecereNameSpace__ecere__com__eSystem_Renew(_class->data, sizeof(unsigned char) * (totalSizeClass));
if(offsetClass)
{
if(base && base->type != 1000 && base->type != 4)
memcpy(_class->data, base->data, offsetClass);
else
memset(_class->data, 0, offsetClass);
}
memset((unsigned char *)_class->data + offsetClass, 0, sizeClass);
}
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)_class->dataTypeString), _class->dataTypeString = 0);
_class->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(dataTypeString);
_class->defaultAlignment = base ? base->defaultAlignment : 0;
if(_class->module)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)_class->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->classes, _class);
}
if(_class->base)
{
struct __ecereNameSpace__ecere__com__Class * base = _class->base;
struct __ecereNameSpace__ecere__sys__OldLink * deriv = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindLink(&base->derivatives, _class);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&base->derivatives, deriv);
}
if(module)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->classes, _class);
}
_class->nameSpace = nameSpace;
{
struct __ecereNameSpace__ecere__sys__OldLink * t;

for(t = _class->templatized.first; t; t = t->next)
{
struct __ecereNameSpace__ecere__com__Class * template = t->data;

template->nameSpace = nameSpace;
}
}
_class->module = module;
prevBase = _class->base;
_class->base = base;
if(base)
{
int numParams = 0;
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = base; sClass; sClass = sClass->base)
{
if(sClass->templateClass)
sClass = sClass->templateClass;
numParams += sClass->templateParams.count;
}
if(numParams)
{
if(_class->templateArgs)
{
__ecereNameSpace__ecere__com__FreeTemplateArgs(_class);
}
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->templateArgs), _class->templateArgs = 0);
_class->templateArgs = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__ClassTemplateArgument) * (numParams));
_class->numParams = numParams;
for(sClass = _class; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__Class * prevClass;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;
int id = 0;

if(sClass->templateClass)
sClass = sClass->templateClass;
for(prevClass = sClass->base; prevClass; prevClass = prevClass->base)
{
if(prevClass->templateClass)
prevClass = prevClass->templateClass;
id += prevClass->templateParams.count;
}
if(base->templateArgs)
{
for(param = sClass->templateParams.first; param; param = param->next)
{
_class->templateArgs[id] = base->templateArgs[id];
__ecereNameSpace__ecere__com__CopyTemplateArg(param, &_class->templateArgs[id]);
id++;
}
}
}
}
}
_class->memberID = _class->startMemberID = (base && (type == 0 || type == 5 || type == 1)) ? base->memberID : 0;
if(type == 0 || type == 5)
_class->offset = (base && base->structSize && base->type != 1000) ? (base->type == 0 ? base->structSize : base->memberOffset) : ((type == 5) ? 0 : ((force64Bits && inCompiler && fixed) ? 24 : (force32Bits && inCompiler && fixed) ? 12 : sizeof(struct __ecereNameSpace__ecere__com__Instance)));
else
_class->offset = 0;
if(crossBits)
{
if(!strcmp(name, "GNOSISSystem") || !strcmp(name, "LineStyle") || !strcmp(name, "FillStyle") || !strcmp(name, "FontObject") || !strcmp(name, "FontObject") || !strcmp(name, "ecere::sys::Thread"))
{
_class->offset = force32Bits ? 24 : 12;
}
else if(strstr(name, "ecere::sys::EARHeader") || strstr(name, "AnchorValue") || !strcmp(name, "ecere::com::CustomAVLTree") || !strcmp(name, "ecere::com::Array") || !strcmp(name, "ecere::gui::Window") || !strcmp(name, "ecere::sys::Mutex"))
;
else
{
if(!strcmp(name, "ecere::sys::FileListing"))
{
size = 3 * (force32Bits ? 4 : 8);
_class->structAlignment = force32Bits ? 4 : 8;
_class->pointerAlignment = 1;
}
else if(!strcmp(name, "ecere::com::Class"))
size = 0;
else if(!strcmp(name, "ecere::com::ClassProperty"))
size = 0;
else if(!strcmp(name, "ecere::com::NameSpace"))
size = 0;
else if(!strcmp(name, "ecere::sys::BufferedFile"))
size = 0;
else if(!strcmp(name, "ecere::sys::BTNode"))
size = 0;
else if(!strcmp(name, "ecere::sys::StringBTNode"))
size = 0;
else if(!strcmp(name, "ecere::sys::OldList"))
size = 0;
else if(!strcmp(name, "ecere::sys::Item"))
size = 0;
else if(!strcmp(name, "ecere::sys::NamedLink"))
size = 0;
else if(!strcmp(name, "ecere::sys::NamedLink64"))
size = 0;
else if(!strcmp(name, "ecere::sys::OldLink"))
size = 0;
else if(!strcmp(name, "ecere::sys::NamedItem"))
size = 0;
else if(!strcmp(name, "ecere::sys::NamedItem64"))
size = 0;
else if(!strcmp(name, "ecere::sys::BinaryTree"))
size = 0;
else if(module != ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && inCompiler)
{
if(fixed || type == 1)
size = 0;
}
}
}
if(type == 1)
{
_class->memberOffset = (base && base->structSize && base->type != 1000) ? base->structSize : 0;
_class->typeSize = _class->structSize = _class->memberOffset + size;
}
else if(type == 2 || type == 4 || type == 3)
{
struct __ecereNameSpace__ecere__com__Class * dataTypeClass = dataTypeString ? __ecereNameSpace__ecere__com__System_FindClass(_class->module, dataTypeString, 1) : (((void *)0));

if(dataTypeClass)
_class->typeSize = dataTypeClass->typeSize;
_class->structSize = 0;
}
else if(type == 0 || type == 5)
{
_class->structSize = _class->offset + size;
_class->typeSize = sizeof(void *);
}
_class->offsetClass = offsetClass;
_class->sizeClass = totalSizeClass;
_class->Constructor = Constructor;
_class->Destructor = Destructor;
if(_class->type != 1000)
_class->type = type;
if(!size)
_class->computeSize = 1;
else
_class->computeSize = 0;
_class->inheritanceAccess = inheritanceAccess;
if(type == 4)
{
if(enumBase)
_class->base = base = enumBase;
{
struct __ecereNameSpace__ecere__com__EnumClassData * data = (struct __ecereNameSpace__ecere__com__EnumClassData *)_class->data;

if(base && base->type != 4)
data->largest = -1;
else
data->largest = ((struct __ecereNameSpace__ecere__com__EnumClassData *)base->data)->largest;
}
}
if(base)
{
int i;
unsigned int oldSize = _class->vTblSize;

if(base->vTblSize && _class->vTblSize < base->vTblSize)
{
_class->vTblSize = base->vTblSize;
_class->_vTbl = __ecereNameSpace__ecere__com___realloc(_class->_vTbl, sizeof(int (*)()) * _class->vTblSize);
}
if(!prevBase)
{
if(_class->type == 0 && strcmp(_class->name, "ecere::com::Instance") && strcmp(_class->name, "enum") && strcmp(_class->name, "struct"))
prevBase = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Instance");
else
prevBase = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "class");
}
for(i = 0; i < base->vTblSize; i++)
{
if(i >= oldSize || _class->_vTbl[i] == prevBase->_vTbl[i])
_class->_vTbl[i] = base->_vTbl[i];
}
}
if(_class->base)
{
struct __ecereNameSpace__ecere__sys__OldLink * link = (link = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__sys__OldLink)), link->data = _class, link);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->base->derivatives, link);
}
__ecereNameSpace__ecere__com__FixDerivativesBase(_class, _class);
return _class;
}
}
return (((void *)0));
}

void __ecereNameSpace__ecere__com__eProperty_Watchable(struct __ecereNameSpace__ecere__com__Property * _property)
{
if(!_property->isWatchable)
{
struct __ecereNameSpace__ecere__com__Class * _class = _property->_class;

if(!_class->computeSize)
{
_property->watcherOffset = _class->structSize;
_class->structSize += sizeof(struct __ecereNameSpace__ecere__sys__OldList);
__ecereNameSpace__ecere__com__FixDerivativesBase(_class, _class);
}
_property->isWatchable = 1;
}
}

void __ecereNameSpace__ecere__com__eClass_DestructionWatchable(struct __ecereNameSpace__ecere__com__Class * _class)
{
if(!_class->destructionWatchOffset)
{
_class->destructionWatchOffset = _class->structSize;
_class->structSize += sizeof(struct __ecereNameSpace__ecere__sys__OldList);
__ecereNameSpace__ecere__com__FixDerivativesBase(_class, _class);
}
}

void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(struct __ecereNameSpace__ecere__com__Class * base)
{
if(base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

{
void * first = base->templateParams.first;
int count = base->templateParams.count;

__ecereNameSpace__ecere__com__FreeTemplateArgs(base);
(__ecereNameSpace__ecere__com__eSystem_Delete(base->templateArgs), base->templateArgs = 0);
base->templateParams.first = (((void *)0));
base->templateParams.count = 0;
__ecereNameSpace__ecere__com__FreeTemplatesDerivatives(base);
base->templateParams.first = first;
base->templateParams.count = count;
}
for(param = base->templateParams.first; param; param = param->next)
{
if(param->type == 1 && param->defaultArg.__anon1.__anon2.memberString)
{
struct __ecereNameSpace__ecere__com__Class * memberClass = base;
const char * colon = strstr(param->defaultArg.__anon1.__anon2.memberString, "::");
const char * memberName;

if(colon)
{
char className[1024];
struct __ecereNameSpace__ecere__com__Class * sClass;

memcpy(className, param->defaultArg.__anon1.__anon2.memberString, colon - param->defaultArg.__anon1.__anon2.memberString);
className[colon - param->defaultArg.__anon1.__anon2.memberString] = '\0';
memberName = colon + 2;
for(sClass = base; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * cParam;
struct __ecereNameSpace__ecere__com__Class * nextClass;
int id = 0;

for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
id += nextClass->templateParams.count;
if(sClass == base || base->templateArgs)
{
for(cParam = sClass->templateParams.first; cParam; cParam = cParam->next)
{
if(cParam->type == 0 && !strcmp(cParam->name, className))
strcpy(className, (sClass == base) ? cParam->defaultArg.__anon1.__anon1.dataTypeString : base->templateArgs[id].__anon1.__anon1.dataTypeString);
id++;
}
}
}
memberClass = __ecereNameSpace__ecere__com__eSystem_FindClass(base->module, className);
if(!memberClass)
memberClass = __ecereNameSpace__ecere__com__eSystem_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)base->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application, className);
}
else
memberName = param->defaultArg.__anon1.__anon2.memberString;
if(memberClass)
{
switch(param->__anon1.memberType)
{
case 0:
param->defaultArg.__anon1.__anon2.__anon1.member = __ecereNameSpace__ecere__com__eClass_FindDataMember(memberClass, memberName, memberClass->module, (((void *)0)), (((void *)0)));
break;
case 1:
param->defaultArg.__anon1.__anon2.__anon1.method = __ecereNameSpace__ecere__com__eClass_FindMethod(memberClass, memberName, memberClass->module);
break;
case 2:
param->defaultArg.__anon1.__anon2.__anon1.prop = __ecereNameSpace__ecere__com__eClass_FindProperty(memberClass, memberName, memberClass->module);
break;
}
}
}
}
__ecereNameSpace__ecere__com__FixDerivativesBase(base, base);
}
}

static void __ecereNameSpace__ecere__com__ComputeClassParameters(struct __ecereNameSpace__ecere__com__Class * templatedClass, const char * templateParams, struct __ecereNameSpace__ecere__com__Instance * findModule, unsigned int registerInternalDecl)
{
char ch;
const char * nextParamStart = templateParams ? (templateParams + 1) : (((void *)0));
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * curParam = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * lastClass = (((void *)0)), * sClass;
int curParamID = 0;
int numParams = 0;
struct __ecereNameSpace__ecere__com__Class * _class = templatedClass->templateClass ? templatedClass->templateClass : templatedClass;

for(sClass = _class; sClass; sClass = sClass->base)
{
if(sClass->templateClass)
sClass = sClass->templateClass;
numParams += sClass->templateParams.count;
}
if(templatedClass->templateArgs)
__ecereNameSpace__ecere__com__FreeTemplateArgs(templatedClass);
(__ecereNameSpace__ecere__com__eSystem_Delete(templatedClass->templateArgs), templatedClass->templateArgs = 0);
templatedClass->templateArgs = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__ClassTemplateArgument) * (numParams));
templatedClass->numParams = numParams;
if(_class != templatedClass)
{
}
if(templatedClass->base && templatedClass->base->templateArgs && _class == templatedClass)
{
struct __ecereNameSpace__ecere__com__Class * sClass;

memcpy(templatedClass->templateArgs, templatedClass->base->templateArgs, sizeof(struct __ecereNameSpace__ecere__com__ClassTemplateArgument) * (numParams - templatedClass->templateParams.count));
for(sClass = templatedClass->base; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;
struct __ecereNameSpace__ecere__com__Class * prevClass;
int id = 0;

for(prevClass = sClass->base; prevClass; prevClass = prevClass->base)
{
if(prevClass->templateClass)
prevClass = prevClass->templateClass;
id += prevClass->templateParams.count;
}
if(sClass->templateClass)
sClass = sClass->templateClass;
for(param = sClass->templateParams.first; param; param = param->next)
__ecereNameSpace__ecere__com__CopyTemplateArg(param, &templatedClass->templateArgs[id++]);
}
}
while(nextParamStart)
{
const char * paramStart = nextParamStart;
const char * paramEnd;
int level = 0;

while(*paramStart == ' ')
paramStart++;
paramEnd = paramStart;
while((ch = *paramEnd, ch && (level > 0 || (ch != '>' && ch != ','))))
{
if(ch == '<')
level++;
if(ch == '>')
level--;
paramEnd++;
}
nextParamStart = (ch == ',') ? (paramEnd + 1) : (((void *)0));
while(*paramEnd == ' ')
paramEnd--;
if(paramEnd > paramStart)
{
const char * ptr, * equal = (((void *)0));
int subParamLevel = 0;

for(ptr = paramStart; ptr <= paramEnd; ptr++)
{
char ch = *ptr;

if(ch == '<')
subParamLevel++;
else if(ch == '>')
subParamLevel--;
if(subParamLevel == 0 && ch == '=')
{
equal = ptr;
break;
}
}
if(equal)
{
const char * end = equal - 1;
char ident[1024];

while(*end == ' ')
end--;
strncpy(ident, paramStart, end + 1 - paramStart);
ident[end + 1 - paramStart] = 0;
for(sClass = _class; sClass; sClass = sClass->base)
{
if(sClass->templateClass)
sClass = sClass->templateClass;
for(curParam = sClass->templateParams.first; curParam; curParam = curParam->next)
{
if(!strcmp(curParam->name, ident))
break;
}
if(curParam)
{
struct __ecereNameSpace__ecere__com__Class * nextClass;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * prevParam;

curParamID = 0;
for(prevParam = curParam->prev; prevParam; prevParam = prevParam->prev)
curParamID++;
for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
{
if(nextClass->templateClass)
nextClass = nextClass->templateClass;
curParamID += nextClass->templateParams.count;
}
break;
}
}
lastClass = sClass;
}
else
{
if(curParam)
{
curParam = curParam->next;
curParamID++;
}
if(!curParam)
{
for(sClass = lastClass ? lastClass->base : _class; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

curParamID = 0;
if(sClass->templateClass)
sClass = sClass->templateClass;
for(param = sClass->templateParams.first; param; param = param->next, curParamID++)
{
curParam = param;
break;
}
if(curParam)
{
struct __ecereNameSpace__ecere__com__Class * nextClass;

for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
{
if(nextClass->templateClass)
nextClass = nextClass->templateClass;
curParamID += nextClass->templateParams.count;
}
lastClass = sClass;
break;
}
}
}
}
if(curParam)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument argument =
{

.__anon1 = {

.__anon1 = {
.dataTypeString = 0
}
}
};
char value[1024];

if(equal)
{
equal++;
while(*equal == ' ')
equal++;
memcpy(value, equal, paramEnd - equal);
value[paramEnd - equal] = 0;
}
else
{
memcpy(value, paramStart, paramEnd - paramStart);
value[paramEnd - paramStart] = 0;
}
__ecereNameSpace__ecere__sys__TrimRSpaces(value, value);
switch(curParam->type)
{
case 0:
argument.__anon1.__anon1.dataTypeString = __ecereNameSpace__ecere__sys__CopyString(value);
argument.__anon1.__anon1.dataTypeClass = __ecereNameSpace__ecere__com__System_FindClass(findModule, value, registerInternalDecl);
if(!argument.__anon1.__anon1.dataTypeClass)
argument.__anon1.__anon1.dataTypeClass = __ecereNameSpace__ecere__com__System_FindClass(_class->module, value, registerInternalDecl);
if(!argument.__anon1.__anon1.dataTypeClass)
argument.__anon1.__anon1.dataTypeClass = __ecereNameSpace__ecere__com__System_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)_class->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application, value, registerInternalDecl);
if(registerInternalDecl && !argument.__anon1.__anon1.dataTypeClass)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

for(param = templatedClass->templateParams.first; param; param = param->next)
if(!strcmp(param->name, value))
break;
if(!param)
{
argument.__anon1.__anon1.dataTypeClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass((int)0, value, (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), _class->module, 1, 1);
argument.__anon1.__anon1.dataTypeClass->internalDecl = 1;
}
}
break;
case 2:
{
struct __ecereNameSpace__ecere__com__Class * expClass = __ecereNameSpace__ecere__com__System_FindClass(_class->module, curParam->__anon1.dataTypeString, 1);

if(!expClass)
expClass = __ecereNameSpace__ecere__com__System_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)_class->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application, curParam->__anon1.dataTypeString, 1);
if(expClass)
{
((unsigned int (*)(void *, void *, const char *))(void *)expClass->_vTbl[__ecereVMethodID_class_OnGetDataFromString])(expClass, &argument.__anon1.expression, value);
}
else if(value[0] == '\"')
{
char * endQuote = value + strlen(value) - 1;

if(*endQuote != '\"')
endQuote++;
*endQuote = '\0';
argument.__anon1.expression.__anon1.p = __ecereNameSpace__ecere__sys__CopyString(value + 1);
}
else if(value[0] == '\'')
{
int nb;
unsigned int ch = __ecereNameSpace__ecere__sys__UTF8GetChar(value + 1, &nb);

argument.__anon1.expression.__anon1.ui = ch;
}
else if(!strcmp(curParam->__anon1.dataTypeString, "uint"))
{
argument.__anon1.expression.__anon1.ui = (unsigned int)strtoul(value, (((void *)0)), 0);
}
else if(!strcmp(curParam->__anon1.dataTypeString, "char"))
{
argument.__anon1.expression.__anon1.c = (char)strtol(value, (((void *)0)), 0);
}
else if(!strcmp(curParam->__anon1.dataTypeString, "byte"))
{
argument.__anon1.expression.__anon1.uc = (unsigned char)strtoul(value, (((void *)0)), 0);
}
else if(!strcmp(curParam->__anon1.dataTypeString, "short"))
{
argument.__anon1.expression.__anon1.s = (short)strtol(value, (((void *)0)), 0);
}
else if(!strcmp(curParam->__anon1.dataTypeString, "uint16"))
{
argument.__anon1.expression.__anon1.us = (unsigned short)strtoul(value, (((void *)0)), 0);
}
else if(!strcmp(curParam->__anon1.dataTypeString, "int64"))
{
argument.__anon1.expression.__anon1.i64 = __ecereNameSpace__ecere__com___strtoi64(value, (((void *)0)), 0);
}
else if(!strcmp(curParam->__anon1.dataTypeString, "uint64"))
{
argument.__anon1.expression.__anon1.ui64 = __ecereNameSpace__ecere__com___strtoui64(value, (((void *)0)), 0);
}
else if(!strcmp(curParam->__anon1.dataTypeString, "float"))
{
argument.__anon1.expression.__anon1.f = (float)strtod(value, (((void *)0)));
}
else if(!strcmp(curParam->__anon1.dataTypeString, "double"))
{
argument.__anon1.expression.__anon1.d = strtod(value, (((void *)0)));
}
else
{
argument.__anon1.expression.__anon1.i = (int)strtol(value, (((void *)0)), 0);
}
break;
}
case 1:
argument.__anon1.__anon2.memberString = __ecereNameSpace__ecere__sys__CopyString(value);
break;
}
__ecereNameSpace__ecere__com__FreeTemplateArg(templatedClass, curParam, curParamID);
templatedClass->templateArgs[curParamID] = argument;
}
}
}
if(templatedClass == _class)
{
struct __ecereNameSpace__ecere__com__Class * sClass = _class;
int curParamID = 0;
struct __ecereNameSpace__ecere__com__Class * nextClass;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
{
if(nextClass->templateClass)
nextClass = nextClass->templateClass;
curParamID += nextClass->templateParams.count;
}
for(param = sClass->templateParams.first; param; param = param->next)
{
if(!templatedClass->templateArgs[curParamID].__anon1.__anon1.dataTypeString)
{
templatedClass->templateArgs[curParamID] = param->defaultArg;
__ecereNameSpace__ecere__com__CopyTemplateArg(param, &templatedClass->templateArgs[curParamID]);
if(param->type == 0 && param->defaultArg.__anon1.__anon1.dataTypeString)
{
templatedClass->templateArgs[curParamID].__anon1.__anon1.dataTypeClass = __ecereNameSpace__ecere__com__System_FindClass(findModule, param->defaultArg.__anon1.__anon1.dataTypeString, 1);
if(!templatedClass->templateArgs[curParamID].__anon1.__anon1.dataTypeClass)
templatedClass->templateArgs[curParamID].__anon1.__anon1.dataTypeClass = __ecereNameSpace__ecere__com__System_FindClass(templatedClass->module, param->defaultArg.__anon1.__anon1.dataTypeString, 1);
if(!templatedClass->templateArgs[curParamID].__anon1.__anon1.dataTypeClass)
templatedClass->templateArgs[curParamID].__anon1.__anon1.dataTypeClass = __ecereNameSpace__ecere__com__System_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)templatedClass->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application, param->defaultArg.__anon1.__anon1.dataTypeString, 1);
}
}
curParamID++;
}
}
if(templatedClass->base && templatedClass->base->templateArgs && numParams - _class->templateParams.count)
{
int c = numParams - _class->templateParams.count - 1;

for(sClass = _class->base; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

if(sClass->templateClass)
sClass = sClass->templateClass;
for(param = sClass->templateParams.last; param; param = param->prev)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument * arg = &templatedClass->templateArgs[c];
struct __ecereNameSpace__ecere__com__ClassTemplateArgument * baseArg = &templatedClass->base->templateArgs[c];

if(!(*arg).__anon1.__anon1.dataTypeString)
{
*arg = templatedClass->base->templateArgs[c];
__ecereNameSpace__ecere__com__CopyTemplateArg(param, arg);
if(param->type == 0)
{
if((*arg).__anon1.__anon1.dataTypeClass && strchr((*arg).__anon1.__anon1.dataTypeString, '<') && (*arg).__anon1.__anon1.dataTypeClass->templateArgs)
{
struct __ecereNameSpace__ecere__com__Class * expClass = (*arg).__anon1.__anon1.dataTypeClass;
struct __ecereNameSpace__ecere__com__Class * cClass = (((void *)0));
int paramCount = 0;
int lastParam = -1;
char templateString[1024];

sprintf(templateString, "%s<", expClass->templateClass->fullName);
for(cClass = expClass; cClass; cClass = cClass->base)
{
int p = 0;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

for(param = cClass->templateParams.first; param; param = param->next)
{
int id = p;
struct __ecereNameSpace__ecere__com__Class * sClass;
struct __ecereNameSpace__ecere__com__ClassTemplateArgument arg;

for(sClass = expClass->base; sClass; sClass = sClass->base)
id += sClass->templateParams.count;
arg = expClass->templateArgs[id];
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * cParam;
int p = numParams - _class->templateParams.count;

for(cParam = _class->templateParams.first; cParam; cParam = cParam->next, p++)
{
if(cParam->type == 0 && arg.__anon1.__anon1.dataTypeString && !strcmp(cParam->name, arg.__anon1.__anon1.dataTypeString))
{
arg = templatedClass->templateArgs[p];
break;
}
}
}
{
char argument[256];

argument[0] = '\0';
switch(param->type)
{
case 2:
{
break;
}
case 1:
{
strcat(argument, arg.__anon1.__anon2.__anon1.member->name);
break;
}
case 0:
{
if(arg.__anon1.__anon1.dataTypeString)
strcat(argument, arg.__anon1.__anon1.dataTypeString);
break;
}
}
if(argument[0])
{
if(paramCount)
strcat(templateString, ", ");
if(lastParam != p - 1)
{
strcat(templateString, param->name);
strcat(templateString, " = ");
}
strcat(templateString, argument);
paramCount++;
lastParam = p;
}
}
p++;
}
}
{
int len = (int)strlen(templateString);

if(templateString[len - 1] == '>')
templateString[len++] = ' ';
templateString[len++] = '>';
templateString[len++] = '\0';
}
__ecereNameSpace__ecere__com__FreeTemplateArg(templatedClass, param, c);
(*arg).__anon1.__anon1.dataTypeString = __ecereNameSpace__ecere__sys__CopyString(templateString);
(*arg).__anon1.__anon1.dataTypeClass = __ecereNameSpace__ecere__com__System_FindClass(findModule, templateString, 1);
if(!(*arg).__anon1.__anon1.dataTypeClass)
(*arg).__anon1.__anon1.dataTypeClass = __ecereNameSpace__ecere__com__System_FindClass(templatedClass->module, templateString, 1);
if(!(*arg).__anon1.__anon1.dataTypeClass)
(*arg).__anon1.__anon1.dataTypeClass = __ecereNameSpace__ecere__com__System_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)templatedClass->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application, templateString, 1);
}
else
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * cParam;
int p = numParams - _class->templateParams.count;

for(cParam = _class->templateParams.first; cParam; cParam = cParam->next, p++)
{
if(cParam->type == 0 && (*baseArg).__anon1.__anon1.dataTypeString && !strcmp(cParam->name, (*baseArg).__anon1.__anon1.dataTypeString))
{
__ecereNameSpace__ecere__com__FreeTemplateArg(templatedClass, param, c);
(*arg).__anon1.__anon1.dataTypeString = templatedClass->templateArgs[p].__anon1.__anon1.dataTypeString;
(*arg).__anon1.__anon1.dataTypeClass = templatedClass->templateArgs[p].__anon1.__anon1.dataTypeClass;
__ecereNameSpace__ecere__com__CopyTemplateArg(cParam, arg);
break;
}
}
}
}
}
c--;
}
}
}
{
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = _class; sClass; sClass = sClass->base)
{
int curParamID = 0;
struct __ecereNameSpace__ecere__com__Class * nextClass;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

if(sClass->templateClass)
sClass = sClass->templateClass;
for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
{
if(nextClass->templateClass)
nextClass = nextClass->templateClass;
curParamID += nextClass->templateParams.count;
}
for(param = sClass->templateParams.first; param; param = param->next)
{
if(!templatedClass->templateArgs[curParamID].__anon1.__anon1.dataTypeString)
{
templatedClass->templateArgs[curParamID] = param->defaultArg;
__ecereNameSpace__ecere__com__CopyTemplateArg(param, &templatedClass->templateArgs[curParamID]);
if(param->type == 0 && param->defaultArg.__anon1.__anon1.dataTypeString)
{
templatedClass->templateArgs[curParamID].__anon1.__anon1.dataTypeClass = __ecereNameSpace__ecere__com__System_FindClass(findModule, param->defaultArg.__anon1.__anon1.dataTypeString, 1);
if(!templatedClass->templateArgs[curParamID].__anon1.__anon1.dataTypeClass)
templatedClass->templateArgs[curParamID].__anon1.__anon1.dataTypeClass = __ecereNameSpace__ecere__com__System_FindClass(templatedClass->module, param->defaultArg.__anon1.__anon1.dataTypeString, 1);
if(!templatedClass->templateArgs[curParamID].__anon1.__anon1.dataTypeClass)
templatedClass->templateArgs[curParamID].__anon1.__anon1.dataTypeClass = __ecereNameSpace__ecere__com__System_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)templatedClass->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application, param->defaultArg.__anon1.__anon1.dataTypeString, 1);
}
}
curParamID++;
}
}
}
{
int c = numParams - 1;

for(sClass = _class; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

if(sClass->templateClass)
sClass = sClass->templateClass;
for(param = sClass->templateParams.last; param; param = param->prev)
{
if(param->type == 0)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument * arg = &templatedClass->templateArgs[c];
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * cParam;
struct __ecereNameSpace__ecere__com__Class * dClass;
int p = numParams - 1;

for(dClass = _class; dClass; dClass = dClass->base)
{
if(dClass->templateClass)
dClass = dClass->templateClass;
for(cParam = dClass->templateParams.last; cParam; cParam = cParam->prev, p--)
{
if(cParam->type == 0 && (*arg).__anon1.__anon1.dataTypeString && !strcmp(cParam->name, (*arg).__anon1.__anon1.dataTypeString))
{
if(templatedClass->templateArgs[p].__anon1.__anon1.dataTypeString && c != p)
{
__ecereNameSpace__ecere__com__FreeTemplateArg(templatedClass, param, c);
(*arg).__anon1.__anon1.dataTypeString = templatedClass->templateArgs[p].__anon1.__anon1.dataTypeString;
(*arg).__anon1.__anon1.dataTypeClass = templatedClass->templateArgs[p].__anon1.__anon1.dataTypeClass;
__ecereNameSpace__ecere__com__CopyTemplateArg(cParam, arg);
}
}
}
}
}
c--;
}
}
}
{
struct __ecereNameSpace__ecere__com__Class * tClass;
int c = numParams - 1;

for(tClass = _class; tClass; tClass = tClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

if(tClass->templateClass)
tClass = tClass->templateClass;
for(param = tClass->templateParams.last; param; param = param->prev)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument * arg = &templatedClass->templateArgs[c];

if(param->type == 1 && (*arg).__anon1.__anon2.memberString)
{
struct __ecereNameSpace__ecere__com__Class * memberClass = templatedClass;
const char * memberString = (*arg).__anon1.__anon2.memberString;
const char * colon = strstr(memberString, "::");
const char * memberName = memberString;

if(colon)
memberName = colon + 2;
if(!colon)
{
memberString = param->defaultArg.__anon1.__anon2.memberString;
colon = memberString ? strstr(memberString, "::") : (((void *)0));
}
if(colon)
{
char className[1024];
struct __ecereNameSpace__ecere__com__Class * sClass;

memcpy(className, memberString, colon - memberString);
className[colon - memberString] = '\0';
for(sClass = _class; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * cParam;
struct __ecereNameSpace__ecere__com__Class * nextClass;
int id = 0;

if(sClass->templateClass)
sClass = sClass->templateClass;
for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
{
if(nextClass->templateClass)
nextClass = nextClass->templateClass;
id += nextClass->templateParams.count;
}
for(cParam = sClass->templateParams.first; cParam; cParam = cParam->next)
{
if(cParam->type == 0 && !strcmp(cParam->name, className) && templatedClass->templateArgs[id].__anon1.__anon1.dataTypeString)
{
strcpy(className, templatedClass->templateArgs[id].__anon1.__anon1.dataTypeString);
}
id++;
}
}
memberClass = __ecereNameSpace__ecere__com__System_FindClass(findModule, className, 1);
if(!memberClass)
memberClass = __ecereNameSpace__ecere__com__System_FindClass(templatedClass->module, className, 1);
if(!memberClass)
memberClass = __ecereNameSpace__ecere__com__System_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)templatedClass->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application, className, 1);
}
if(memberClass)
{
switch(param->__anon1.memberType)
{
case 0:
(*arg).__anon1.__anon2.__anon1.member = __ecereNameSpace__ecere__com__eClass_FindDataMember(memberClass, memberName, memberClass->module, (((void *)0)), (((void *)0)));
break;
case 1:
(*arg).__anon1.__anon2.__anon1.method = __ecereNameSpace__ecere__com__eClass_FindMethod(memberClass, memberName, memberClass->module);
break;
case 2:
(*arg).__anon1.__anon2.__anon1.prop = __ecereNameSpace__ecere__com__eClass_FindProperty(memberClass, memberName, memberClass->module);
break;
}
}
}
c--;
}
}
}
}

static void __ecereNameSpace__ecere__com__LoadCOM(struct __ecereNameSpace__ecere__com__Instance * module)
{
unsigned int force64Bits = (((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->isGUIApp & 2) ? 1 : 0;
unsigned int force32Bits = (((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->isGUIApp & 4) ? 1 : 0;
unsigned int inCompiler = (((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->isGUIApp & 8) ? 1 : 0;
int pointerSize = force64Bits ? 8 : force32Bits ? 4 : sizeof(void *);
struct __ecereNameSpace__ecere__com__Class * applicationClass;
struct __ecereNameSpace__ecere__com__Class * enumClass, * structClass, * boolClass;
struct __ecereNameSpace__ecere__com__Class * moduleClass;
struct __ecereNameSpace__ecere__com__Class * baseClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "class", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);

baseClass->type = 1000;
baseClass->memberOffset = 0;
baseClass->offset = 0;
baseClass->structSize = 0;
baseClass->typeSize = 0;
{
struct __ecereNameSpace__ecere__com__Class * instanceClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::Instance", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);

instanceClass->type = 0;
instanceClass->isInstanceClass = 1;
instanceClass->fixed = 1;
instanceClass->memberOffset = 0;
instanceClass->offset = 0;
instanceClass->memberID = -3;
instanceClass->startMemberID = -3;
__ecereNameSpace__ecere__com__eClass_AddDataMember(instanceClass, "_vTbl", "void **", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(instanceClass, "_class", "ecere::com::Class", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(instanceClass, "_refCount", "int", sizeof(int), sizeof(int), 1);
}
__ecereNameSpace__ecere__com__InitializeDataTypes1(module);
enumClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "enum", (((void *)0)), 0, force64Bits ? 40 : sizeof(struct __ecereNameSpace__ecere__com__EnumClassData), (((void *)0)), (((void *)0)), module, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddClassProperty(enumClass, "enumSize", "int", (((void *)0)), __ecereNameSpace__ecere__com__GetEnumSize)->constant = 1;
enumClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)enumClass->dataTypeString), enumClass->dataTypeString = 0);
enumClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("int");
structClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "struct", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
structClass->type = 1000;
structClass->memberOffset = 0;
structClass->offset = 0;
structClass->structSize = 0;
structClass->typeSize = 0;
__ecereNameSpace__ecere__com__InitializeDataTypes(module);
boolClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "bool", "uint", 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(boolClass, "true", 0x1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(boolClass, "false", 0x0);
moduleClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::Module", (((void *)0)), force64Bits ? 8 + 32 + 32 + 32 + 32 + 8 + 8 + 8 + 8 + 8 + 4 + 4 + (32 + 8 + 8 + 4 * 32) + (32 + 8 + 8 + 4 * 32) : sizeof(struct __ecereNameSpace__ecere__com__Module), 0, (void *)__ecereNameSpace__ecere__com__Module_Constructor, (void *)__ecereNameSpace__ecere__com__Module_Destructor, module, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(moduleClass, "OnLoad", "bool()", (((void *)0)), 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(moduleClass, "OnUnload", "void()", (((void *)0)), 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(moduleClass, "Load", "Module(const char * name, AccessMode importAccess)", __ecereNameSpace__ecere__com__eModule_Load, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(moduleClass, "Unload", "void(Module module)", __ecereNameSpace__ecere__com__eModule_Unload, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "application", "Application", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "classes", "OldList", force64Bits ? 32 : force32Bits ? 20 : sizeof(struct __ecereNameSpace__ecere__sys__OldList), pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "defines", "OldList", force64Bits ? 32 : force32Bits ? 20 : sizeof(struct __ecereNameSpace__ecere__sys__OldList), pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "functions", "OldList", force64Bits ? 32 : force32Bits ? 20 : sizeof(struct __ecereNameSpace__ecere__sys__OldList), pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "modules", "OldList", force64Bits ? 32 : force32Bits ? 20 : sizeof(struct __ecereNameSpace__ecere__sys__OldList), pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "prev", "Module", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "next", "Module", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "name", "const char *", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "library", "void *", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "Unload", "void *", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "importType", "ImportType", sizeof(int), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "origImportType", "ImportType", sizeof(int), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "privateNameSpace", "NameSpace", force64Bits ? (32 + 8 + 8 + 4 * 32) : force32Bits ? (16 + 4 + 4 + 4 * 16) : sizeof(struct __ecereNameSpace__ecere__com__NameSpace), pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "publicNameSpace", "NameSpace", force64Bits ? (32 + 8 + 8 + 4 * 32) : force32Bits ? (16 + 4 + 4 + 4 * 16) : sizeof(struct __ecereNameSpace__ecere__com__NameSpace), pointerSize, 1);
moduleClass->fixed = 1;
moduleClass->count++;
if(inCompiler && force32Bits)
moduleClass->structSize = 12 + 4 + 20 + 20 + 20 + 20 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + (16 + 4 + 4 + 4 * 16) + (16 + 4 + 4 + 4 * 16);
applicationClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::Application", "Module", force64Bits ? (8 + 8 + 4 + 4 + 32 + 8 + 176) : sizeof(struct __ecereNameSpace__ecere__com__Application), 0, (((void *)0)), (void *)__ecereNameSpace__ecere__com__Application_Destructor, module, 4, 1);
if(inCompiler && force32Bits)
{
applicationClass->offset = 12 + 4 + 20 + 20 + 20 + 20 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + (16 + 4 + 4 + 4 * 16) + (16 + 4 + 4 + 4 * 16);
applicationClass->structSize = applicationClass->offset + (4 + 4 + 4 + 4 + 20 + 4 + 88);
}
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(applicationClass, "Main", "void()", __ecereNameSpace__ecere__com__DefaultFunction, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(applicationClass, "argc", "int", sizeof(int), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(applicationClass, "argv", "const char **", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(applicationClass, "exitCode", "int", sizeof(int), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(applicationClass, "isGUIApp", "bool", sizeof(unsigned int), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(applicationClass, "allModules", "OldList", force64Bits ? 32 : force32Bits ? 20 : sizeof(struct __ecereNameSpace__ecere__sys__OldList), pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(applicationClass, "parsedCommand", "char *", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(applicationClass, "systemNameSpace", "NameSpace", force64Bits ? (32 + 8 + 8 + 4 * 32) : force32Bits ? (16 + 4 + 4 + 4 * 16) : sizeof(struct __ecereNameSpace__ecere__com__NameSpace), pointerSize, 1);
applicationClass->fixed = 1;
applicationClass->count++;
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("sin", "double sin(Angle number)", sin, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("sinh", "double sinh(Angle number)", sinh, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("cosh", "double cosh(Angle number)", cosh, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("tanh", "double tanh(Angle number)", tanh, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("sqrt", "double sqrt(double number)", sqrt, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("cos", "double cos(Angle number)", cos, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("tan", "double tan(Angle number)", tan, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("atan2", "Angle atan2(double y, double x)", atan2, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("asin", "Angle asin(double number)", asin, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("acos", "Angle acos(double number)", acos, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("atan", "Angle atan(double number)", atan, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("asinh", "Angle asinh(double number)", asinh, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("acosh", "Angle acosh(double number)", acosh, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("atanh", "Angle atanh(double number)", atanh, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("pow", "double pow(double number, double number2)", pow, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("fmod", "double fmod(double x, double y)", fmod, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("fabs", "double fabs(double number)", fabs, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("log", "double log(double number)", log, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("log10", "double log10(double number)", log10, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ceil", "double ceil(double number)", ceil, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("floor", "double floor(double number)", floor, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("exp", "double exp(double number)", exp, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("qsort", "void qsort(void *, uintsize, uintsize, int (*)(void *, void *))", qsort, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strtod", "double strtod(const char*, char**)", strtod, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strtol", "int strtol(const char*, char**, int base)", strtol, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strtoul", "unsigned long strtoul(const char * nptr, char ** endptr, int base)", strtoul, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strtoll", "int64 strtoll(const char * nptr, char ** endptr, int base)", strtoll, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strtoull", "uint64 strtoull(const char * nptr, char ** endptr, int base)", strtoull, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("system", "int system(const char*)", system, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("atoi", "int atoi(const char*)", atoi, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("atof", "double atof(const char*)", atof, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("memset", "void * memset(void * area, int value, uintsize count)", memset, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("getenv", "char * getenv(const char * name)", getenv, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("rename", "int rename(const char *oldpath, const char *newpath)", rename, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strlen", "uintsize strlen(const char *)", strlen, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strcat", "char * strcat(char *, const char *)", strcat, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strncat", "char * strncat(char *, const char *, uintsize n)", strncat, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strchr", "char * strchr(const char *, int)", strchr, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strstr", "char * strstr(const char *, const char *)", strstr, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strspn", "uintsize strspn(const char *, const char *)", strspn, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strcspn", "uintsize strcspn(const char *, const char *)", strcspn, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strpbrk", "char * strpbrk(const char *, const char *)", strpbrk, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("fstrcmp", "(__runtimePlatform == win32) ? strcmpi : strcmp", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("strcmpi", "strcasecmp", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("strnicmp", "strncasecmp", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strcasecmp", "int strcasecmp(const char *, const char *)", strcasecmp, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strncasecmp", "int strncasecmp(const char *, const char *, uintsize n)", strncasecmp, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strcmp", "int strcmp(const char *, const char *)", strcmp, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strncmp", "int strncmp(const char *, const char *, uintsize n)", strncmp, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strlwr", "char * strlwr(char *)", strlwr, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strupr", "char * strupr(char *)", strupr, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strcpy", "char * strcpy(char *, const char *)", strcpy, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strncpy", "char * strncpy(char *, const char *, uintsize n)", strncpy, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("memcpy", "void * memcpy(void *, const void *, uintsize size)", memcpy, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("memmove", "void * memmove(void *, const void *, uintsize size)", memmove, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("memcmp", "int memcmp(const void *, const void *, uintsize size)", memcmp, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("sprintf", "int sprintf(char *, const char *, ...)", sprintf, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("snprintf", "int snprintf(char *, uintsize, const char *, ...)", snprintf, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("printf", "int printf(const char *, ...)", printf, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("vsprintf", "int vsprintf(char*, const char*, __builtin_va_list)", vsprintf, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("vsnprintf", "int vsnprintf(char*, uintsize, const char*, __builtin_va_list)", vsnprintf, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("puts", "int puts(const char *)", puts, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("fputs", "int fputs(const char *, void * stream)", fputs, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("tolower", "int tolower(int)", tolower, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("toupper", "int toupper(int)", toupper, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("isdigit", "bool isdigit(int)", isdigit, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("isxdigit", "bool isxdigit(int)", isxdigit, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("isalnum", "int isalnum(int c)", isalnum, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("isspace", "int isspace(int c)", isspace, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("isalpha", "int isalpha(int c)", isalpha, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("islower", "int islower(int c)", islower, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("isupper", "int isupper(int c)", isupper, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("isprint", "int isprint(int c)", isprint, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("isblank", "int isblank(int c)", isblank, module, 4);
}

static void __ecereNameSpace__ecere__com__FixDerivativesBase(struct __ecereNameSpace__ecere__com__Class * base, struct __ecereNameSpace__ecere__com__Class * mod)
{
struct __ecereNameSpace__ecere__sys__OldLink * derivative;

__ecereNameSpace__ecere__com__ComputeClassParameters(base, strchr(base->name, '<'), (((void *)0)), base->templateClass != mod);
for(derivative = base->derivatives.first; derivative; derivative = derivative->next)
{
struct __ecereNameSpace__ecere__com__Class * _class = derivative->data;
int type = _class->type;
int oldType = type;
int size = _class->structSize - _class->offset;
int oldSizeClass = _class->sizeClass;
int sizeClass = _class->sizeClass - _class->offsetClass;
struct __ecereNameSpace__ecere__com__Class * enumBase = (((void *)0));
const char * dataTypeString = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * baseClass;
unsigned int offsetBefore = _class->offset;
int offsetClass, totalSizeClass;

for(baseClass = base; baseClass->base; baseClass = baseClass->base)
;
if(base && !base->internalDecl && (base->type == 5 || base->type == 1 || base->type == 0))
{
if(base->type == 1 && type == 0)
type = 5;
else
type = base->type;
}
if(base && (_class->type == 0 || _class->type == 5 || _class->type == 1) && (base->type == 3 || base->type == 2 || base->type == 4))
{
type = base->type;
}
if(type == 4)
{
if(base->type != 4)
{
enumBase = base;
base = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, "enum");
}
}
dataTypeString = enumBase ? enumBase->dataTypeString : base->dataTypeString;
offsetClass = base ? (base->templateClass ? base->templateClass->sizeClass : base->sizeClass) : (type == 5 ? 0 : 0);
totalSizeClass = offsetClass + sizeClass;
if(type == 0 || type == 5)
{
_class->offset = (base && (base->templateClass ? (type == 0 ? base->templateClass->structSize : base->templateClass->memberOffset) : (type == 0 ? base->structSize : base->memberOffset)) && base->type != 1000) ? (base->templateClass ? base->templateClass->structSize : base->structSize) : ((type == 5) ? 0 : sizeof(struct __ecereNameSpace__ecere__com__Instance));
if(_class->structAlignment && (_class->offset % _class->structAlignment))
_class->offset += _class->structAlignment - _class->offset % _class->structAlignment;
}
else
_class->offset = 0;
if(type == 1)
{
_class->memberOffset = (base && (base->templateClass ? base->templateClass->structSize : base->structSize) && base->type != 1000) ? (base->templateClass ? base->templateClass->structSize : base->structSize) : 0;
_class->typeSize = _class->structSize = _class->memberOffset + size;
}
else if(type == 2 || type == 4 || type == 3)
{
struct __ecereNameSpace__ecere__com__Class * dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, dataTypeString);

if(dataTypeClass)
_class->typeSize = dataTypeClass->typeSize;
_class->structSize = 0;
}
else if(type == 0 || type == 5)
{
_class->structSize = _class->offset + size;
_class->typeSize = sizeof(void *);
}
if(_class->type != 1000)
_class->type = type;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)_class->dataTypeString), _class->dataTypeString = 0);
_class->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(dataTypeString);
if(totalSizeClass != oldSizeClass)
{
_class->data = __ecereNameSpace__ecere__com__eSystem_Renew(_class->data, sizeof(unsigned char) * (totalSizeClass));
memmove((unsigned char *)_class->data + mod->offsetClass, (unsigned char *)_class->data, totalSizeClass - mod->sizeClass);
if(base->type != 1000 && base->type != 4)
memcpy((unsigned char *)_class->data, (unsigned char *)base->data, totalSizeClass - _class->sizeClass);
else
memset((unsigned char *)_class->data, 0, totalSizeClass - _class->sizeClass);
}
_class->offsetClass = offsetClass;
_class->sizeClass = totalSizeClass;
{
struct __ecereNameSpace__ecere__com__Method * method, * next;
struct __ecereNameSpace__ecere__com__Class * b;
unsigned int needUpdate = (mod != (base->templateClass ? base->templateClass : base) || _class->vTblSize != mod->vTblSize);
int updateStart = -1, updateEnd = -1;

if(mod->base && mod->base->base && mod->base->vTblSize > baseClass->vTblSize && needUpdate)
{
_class->vTblSize += mod->base->vTblSize - baseClass->vTblSize;
_class->_vTbl = __ecereNameSpace__ecere__com__eSystem_Renew(_class->_vTbl, sizeof(void *) * (_class->vTblSize));
memmove(_class->_vTbl + mod->base->vTblSize, _class->_vTbl + baseClass->vTblSize, (_class->vTblSize - mod->vTblSize) * sizeof(void *));
memcpy(_class->_vTbl + baseClass->vTblSize, mod->_vTbl + baseClass->vTblSize, (mod->base->vTblSize - baseClass->vTblSize) * sizeof(void *));
updateStart = baseClass->vTblSize;
updateEnd = updateStart + mod->base->vTblSize - baseClass->vTblSize;
for(method = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->methods); method; method = next)
{
next = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)method));
if(method->type == 1)
method->vid += mod->base->vTblSize - baseClass->vTblSize;
}
}
for(b = mod->base; b && b != (((void *)0)); b = b->base)
{
struct __ecereNameSpace__ecere__com__Method * vMethod;

for(vMethod = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&b->methods); vMethod; vMethod = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)vMethod)))
{
if(vMethod->type == 1)
{
method = (struct __ecereNameSpace__ecere__com__Method *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->methods, vMethod->name);
if(method)
{
if(method->function)
_class->_vTbl[vMethod->vid] = method->function;
if(!method->symbol)
{
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)method->name), method->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)method->dataTypeString), method->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&_class->methods, (struct __ecereNameSpace__ecere__sys__BTNode *)method);
}
else
{
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)method->dataTypeString), method->dataTypeString = 0);
method->type = vMethod->type;
method->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(vMethod->dataTypeString);
method->_class = vMethod->_class;
}
}
else if((vMethod->vid >= updateStart && vMethod->vid < updateEnd) || _class->_vTbl[vMethod->vid] == b->_vTbl[vMethod->vid])
_class->_vTbl[vMethod->vid] = _class->base->_vTbl[vMethod->vid];
}
}
}
}
if(type == 0 || type == 5 || type == 1)
{
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Class * c;

for(c = mod->base; c; c = c->base)
{
struct __ecereNameSpace__ecere__com__Property * _property;

for(_property = c->membersAndProperties.first; _property; _property = _property->next)
{
if(_property->isProperty)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->prop, _property->name);

if(link)
{
prop = link->data;
if(!prop->Set && !prop->Get && prop->memberAccess == 4)
{
struct __ecereNameSpace__ecere__com__SelfWatcher * watcher;

for(watcher = _class->selfWatchers.first; watcher; watcher = watcher->next)
{
if(watcher->_property == prop)
watcher->_property = _property;
}
_property->selfWatchable = 1;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&_class->prop, (struct __ecereNameSpace__ecere__sys__BTNode *)link);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)prop->name), prop->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)prop->dataTypeString), prop->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->membersAndProperties, prop);
}
}
}
}
}
{
struct __ecereNameSpace__ecere__com__DataMember * next;

for(member = _class->membersAndProperties.first; member; member = next)
{
int offsetDiff = _class->offset - offsetBefore;

next = member->next;
if(!member->isProperty)
{
if(oldType == 2 && type != 2)
{
struct __ecereNameSpace__ecere__com__DataMember * prev = member->prev;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&_class->membersAndProperties, member);
member = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eSystem_Renew0(member, sizeof(unsigned char) * (sizeof(struct __ecereNameSpace__ecere__com__DataMember)));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(&_class->membersAndProperties, prev, member);
}
if(offsetDiff > 0)
{
member->offset += offsetDiff;
member->memberOffset += offsetDiff;
}
}
member->id += mod->base->memberID;
}
_class->memberID += mod->base->memberID;
_class->startMemberID += mod->base->memberID;
}
}
__ecereNameSpace__ecere__com__FixDerivativesBase(_class, mod);
{
struct __ecereNameSpace__ecere__com__Class * c;

for(c = mod->base; c; c = c->base)
{
struct __ecereNameSpace__ecere__com__ClassProperty * _property;

for(_property = (struct __ecereNameSpace__ecere__com__ClassProperty *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&c->classProperties); _property; _property = (struct __ecereNameSpace__ecere__com__ClassProperty *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)_property)))
{
__ecereNameSpace__ecere__com__SetDelayedCPValues(_class, _property);
}
}
}
}
{
struct __ecereNameSpace__ecere__sys__OldLink * templateLink;

for(templateLink = base->templatized.first; templateLink; templateLink = templateLink->next)
{
struct __ecereNameSpace__ecere__com__Class * template = templateLink->data;

template->base = base->base;
template->_vTbl = base->_vTbl;
template->data = base->data;
template->offset = base->offset;
template->offsetClass = base->offsetClass;
template->sizeClass = base->sizeClass;
template->structSize = base->structSize;
template->vTblSize = base->vTblSize;
__ecereNameSpace__ecere__com__FixDerivativesBase(template, mod);
}
}
}

struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__System_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, const char * name, unsigned int registerTemplatesInternalDecl)
{
if(name && module)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link;

if(!strncmp(name, "const ", 6))
name += 6;
link = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace, name, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes);
if(link)
return link->data;
link = __ecereNameSpace__ecere__com__SearchModule(module, name, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes, 1);
if(link)
return link->data;
{
char noTemplateName[1024];
char * templateParams = strchr(name, '<');

if(templateParams)
{
strncpy(noTemplateName, name, templateParams - name);
noTemplateName[templateParams - name] = '\0';
}
else
strcpy(noTemplateName, name);
link = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace, noTemplateName, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes);
if(!link)
link = __ecereNameSpace__ecere__com__SearchModule(module, noTemplateName, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes, 1);
if(link)
{
struct __ecereNameSpace__ecere__com__Class * _class = link->data;
struct __ecereNameSpace__ecere__com__Class * templatedClass = (((void *)0));
char className[1024];

strcpy(className, _class->fullName);
strcat(className, templateParams);
link = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace, className, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes);
if(link)
return link->data;
link = __ecereNameSpace__ecere__com__SearchModule(module, className, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes, 1);
if(link)
return link->data;
if(_class && templateParams)
{
struct __ecereNameSpace__ecere__sys__OldList __simpleStruct1 =
{
0, 0, 0, 0, 0
};
struct __ecereNameSpace__ecere__sys__OldList __simpleStruct0 =
{
0, 0, 0, 0, 0
};

templatedClass = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__Class));
*templatedClass = *_class;
templatedClass->templateClass = _class;
templatedClass->fullName = __ecereNameSpace__ecere__sys__CopyString(className);
templatedClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(_class->dataTypeString);
templatedClass->name = __ecereNameSpace__ecere__sys__CopyString(templatedClass->fullName + strlen(_class->fullName) - strlen(_class->name));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*templatedClass->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__BTNamedLink));

__ecereInstance1->name = (char *)templatedClass->name, __ecereInstance1->data = templatedClass, __ecereInstance1;
}));
templatedClass->templateArgs = (((void *)0));
templatedClass->numParams = 0;
templatedClass->derivatives = __simpleStruct0;
templatedClass->templatized = __simpleStruct1;
templatedClass->module = module;
templatedClass->count = 0;
templatedClass->prev = (((void *)0));
templatedClass->next = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->classes, templatedClass);
__ecereNameSpace__ecere__com__ComputeClassParameters(templatedClass, templateParams, module, registerTemplatesInternalDecl);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->templatized, __extension__ ({
struct __ecereNameSpace__ecere__sys__OldLink * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__sys__OldLink));

__ecereInstance1->data = templatedClass, __ecereInstance1;
}));
}
return templatedClass;
}
}
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com____ecere_COM_Initialize(unsigned int guiApp, int argc, char * argv[])
{
struct __ecereNameSpace__ecere__com__Instance * app;

app = __ecereNameSpace__ecere__com___calloc(1, sizeof(struct __ecereNameSpace__ecere__com__Application) + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance));
__ecereNameSpace__ecere__com__Module_Constructor(app);
((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace.classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace.defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace.functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace.nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
Instance_COM_Initialize(argc, argv, &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->parsedCommand, &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc, &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv);
((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application = app;
((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->allModules.offset = sizeof(struct __ecereNameSpace__ecere__com__Instance) + (unsigned int)(uintptr_t)&(*((struct __ecereNameSpace__ecere__com__Module *)0)).prev;
((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->isGUIApp = guiApp;
__ecereNameSpace__ecere__com__LoadCOM(app);
((struct __ecereNameSpace__ecere__com__Instance *)(char *)app)->_class = __ecereNameSpace__ecere__com__eSystem_FindClass(app, "Application");
return app;
}

void __ecereRegisterModule_instance(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::null", "((void *)0)", module, 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(3, "ecere::com::Angle", "double", 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Angle = class;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(3, "unichar", "uint", 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_unichar = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod_unichar_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetDataFromString", 0, __ecereMethod_unichar_OnGetDataFromString, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::Property", 0, sizeof(struct __ecereNameSpace__ecere__com__Property), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Property = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::Property", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::Property", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isProperty", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberAccess", "ecere::com::AccessMode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "id", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_class", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeString", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeClass", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Set", "void (*)(void *, int)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Get", "int (*)(void *)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "IsSet", "bool (*)(void *)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "data", "void *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbol", "void *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "vid", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "conversion", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "watcherOffset", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "category", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "compiled", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "selfWatchable", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isWatchable", "bool", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
if(class)
class->noExpansion = (unsigned int)1;
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::MemoryGuard_PushLoc", "void ecere::com::MemoryGuard_PushLoc(const char * loc)", __ecereNameSpace__ecere__com__MemoryGuard_PushLoc, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::MemoryGuard_PopLoc", "void ecere::com::MemoryGuard_PopLoc(void)", __ecereNameSpace__ecere__com__MemoryGuard_PopLoc, module, 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::BTNamedLink", 0, sizeof(struct __ecereNameSpace__ecere__com__BTNamedLink), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__BTNamedLink = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "parent", "ecere::com::BTNamedLink", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "left", "ecere::com::BTNamedLink", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "right", "ecere::com::BTNamedLink", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "depth", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "data", "void *", sizeof(void *), 0xF000F000, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::SelfWatcher", 0, sizeof(struct __ecereNameSpace__ecere__com__SelfWatcher), 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__SelfWatcher = class;
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::AccessMode", 0, 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__AccessMode = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "defaultAccess", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "publicAccess", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "privateAccess", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "staticAccess", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "baseSystemAccess", 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::SubModule", 0, sizeof(struct __ecereNameSpace__ecere__com__SubModule), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__SubModule = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::SubModule", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::SubModule", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "module", "ecere::com::Module", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "importMode", "ecere::com::AccessMode", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::DataMemberType", 0, 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__DataMemberType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "normalMember", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "unionMember", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "structMember", 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::ClassType", 0, 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ClassType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "normalClass", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "structClass", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "bitClass", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "unitClass", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "enumClass", 4);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "noHeadClass", 5);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "unionClass", 6);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "systemClass", 1000);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::Class", 0, sizeof(struct __ecereNameSpace__ecere__com__Class), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Class = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnFree", 0, __ecereMethod___ecereNameSpace__ecere__com__Class_OnFree, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod___ecereNameSpace__ecere__com__Class_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetDataFromString", 0, __ecereMethod___ecereNameSpace__ecere__com__Class_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnSerialize", 0, __ecereMethod___ecereNameSpace__ecere__com__Class_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnUnserialize", 0, __ecereMethod___ecereNameSpace__ecere__com__Class_OnUnserialize, 1);
__ecereProp___ecereNameSpace__ecere__com__Class_char__PTR_ = __ecereNameSpace__ecere__com__eClass_AddProperty(class, 0, "const char *", __ecereProp___ecereNameSpace__ecere__com__Class_Set_char__PTR_, __ecereProp___ecereNameSpace__ecere__com__Class_Get_char__PTR_, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "offset", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "structSize", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_vTbl", "void * *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "vTblSize", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Constructor", "bool (*)(void *)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Destructor", "void (*)(void *)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "offsetClass", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "sizeClass", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "base", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "methods", "ecere::sys::BinaryTree", sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "members", "ecere::sys::BinaryTree", sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prop", "ecere::sys::BinaryTree", sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "membersAndProperties", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "classProperties", "ecere::sys::BinaryTree", sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "derivatives", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberID", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "startMemberID", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ecere::com::ClassType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "module", "ecere::com::Module", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "nameSpace", "ecere::com::NameSpace *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeString", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "typeSize", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "defaultAlignment", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Initialize", "void (*)()", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberOffset", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "selfWatchers", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "designerClass", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "noExpansion", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "defaultProperty", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "comRedefinition", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "count", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isRemote", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "internalDecl", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "data", "void *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "computeSize", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "structAlignment", "short", 2, 2, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "pointerAlignment", "short", 2, 2, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "destructionWatchOffset", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "fixed", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "delayedCPValues", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "inheritanceAccess", "ecere::com::AccessMode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "fullName", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbol", "void *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "conversions", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "templateParams", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "templateArgs", "ecere::com::ClassTemplateArgument *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "templateClass", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "templatized", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "numParams", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isInstanceClass", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "byValueSystemClass", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "bindingsClass", "void *", sizeof(void *), 0xF000F000, 1);
if(class)
class->fixed = (unsigned int)1;
if(class)
class->noExpansion = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::TemplateParameterType", 0, 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__TemplateParameterType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "type", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "identifier", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "expression", 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::TemplateMemberType", 0, 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__TemplateMemberType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "dataMember", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "method", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "prop", 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::com::ClassTemplateArgument", 0, sizeof(struct __ecereNameSpace__ecere__com__ClassTemplateArgument), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ClassTemplateArgument = class;
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "dataTypeString", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "dataTypeClass", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "expression", "ecere::com::DataValue", sizeof(struct __ecereNameSpace__ecere__com__DataValue), 8, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "memberString", "const char *", sizeof(void *), 0xF000F000, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember2 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember2, "member", "ecere::com::DataMember", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember2, "prop", "ecere::com::Property", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember2, "method", "ecere::com::Method", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember1, dataMember2);
}
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::ClassTemplateParameter", 0, sizeof(struct __ecereNameSpace__ecere__com__ClassTemplateParameter), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ClassTemplateParameter = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::ClassTemplateParameter", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::ClassTemplateParameter", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ecere::com::TemplateParameterType", 4, 4, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "dataTypeString", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "memberType", "ecere::com::TemplateMemberType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "defaultArg", "ecere::com::ClassTemplateArgument", sizeof(struct __ecereNameSpace__ecere__com__ClassTemplateArgument), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "param", "void *", sizeof(void *), 0xF000F000, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::MethodType", 0, 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__MethodType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "normalMethod", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "virtualMethod", 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::Method", 0, sizeof(struct __ecereNameSpace__ecere__com__Method), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Method = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "parent", "ecere::com::Method", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "left", "ecere::com::Method", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "right", "ecere::com::Method", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "depth", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "function", "int (*)()", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "vid", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ecere::com::MethodType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_class", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbol", "void *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeString", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberAccess", "ecere::com::AccessMode", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::ImportType", 0, 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ImportType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "normalImport", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "staticImport", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "remoteImport", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "preDeclImport", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "comCheckImport", 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::com::NameSpace", 0, sizeof(struct __ecereNameSpace__ecere__com__NameSpace), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__NameSpace = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "btParent", "ecere::com::NameSpace *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "left", "ecere::com::NameSpace *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "right", "ecere::com::NameSpace *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "depth", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "parent", "ecere::com::NameSpace *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "nameSpaces", "ecere::sys::BinaryTree", sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "classes", "ecere::sys::BinaryTree", sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "defines", "ecere::sys::BinaryTree", sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "functions", "ecere::sys::BinaryTree", sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 8, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::com::DataValue", 0, sizeof(struct __ecereNameSpace__ecere__com__DataValue), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__DataValue = class;
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "c", "char", 1, 1, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "uc", "byte", 1, 1, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "s", "short", 2, 2, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "us", "uint16", 2, 2, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "i", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "ui", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "p", "void *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "f", "float", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "d", "double", 8, 8, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "i64", "int64", 8, 8, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "ui64", "uint64", 8, 8, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::DataMember", 0, sizeof(struct __ecereNameSpace__ecere__com__DataMember), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__DataMember = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::DataMember", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::DataMember", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isProperty", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberAccess", "ecere::com::AccessMode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "id", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_class", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeString", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeClass", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ecere::com::DataMemberType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "offset", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberID", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "members", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "membersAlpha", "ecere::sys::BinaryTree", sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberOffset", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "structAlignment", "short", 2, 2, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "pointerAlignment", "short", 2, 2, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::BitMember", 0, sizeof(struct __ecereNameSpace__ecere__com__BitMember), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__BitMember = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::BitMember", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::BitMember", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isProperty", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberAccess", "ecere::com::AccessMode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "id", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_class", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeString", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeClass", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ecere::com::DataMemberType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "size", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "pos", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "mask", "uint64", 8, 8, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::ClassProperty", 0, sizeof(struct __ecereNameSpace__ecere__com__ClassProperty), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ClassProperty = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "parent", "ecere::com::ClassProperty", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "left", "ecere::com::ClassProperty", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "right", "ecere::com::ClassProperty", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "depth", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Set", "void (*)(ecere::com::Class, int64)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Get", "int64 (*)(ecere::com::Class)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeString", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "constant", "bool", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::DefinedExpression", 0, sizeof(struct __ecereNameSpace__ecere__com__DefinedExpression), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__DefinedExpression = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::DefinedExpression", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::DefinedExpression", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "value", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "nameSpace", "ecere::com::NameSpace *", sizeof(void *), 0xF000F000, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::GlobalFunction", 0, sizeof(struct __ecereNameSpace__ecere__com__GlobalFunction), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__GlobalFunction = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::GlobalFunction", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::GlobalFunction", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "function", "int (*)()", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "module", "ecere::com::Module", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "nameSpace", "ecere::com::NameSpace *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeString", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbol", "void *", sizeof(void *), 0xF000F000, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::EnumClassData", 0, sizeof(struct __ecereNameSpace__ecere__com__EnumClassData), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__EnumClassData = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "values", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "largest", "int64", 8, 8, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::Watcher", 0, sizeof(struct __ecereNameSpace__ecere__com__Watcher), 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Watcher = class;
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::MemBlock", 0, sizeof(struct __ecereNameSpace__ecere__com__MemBlock), 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__MemBlock = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, (((void *)0)), (((void *)0)), 0, sizeof(void *) > 4 ? sizeof(void *) : 4, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::MemPart", 0, sizeof(struct __ecereNameSpace__ecere__com__MemPart), 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__MemPart = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, (((void *)0)), (((void *)0)), 0, sizeof(void *) > 4 ? sizeof(void *) : 4, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::com::BlockPool", 0, sizeof(struct __ecereNameSpace__ecere__com__BlockPool), 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__BlockPool = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Add", "ecere::com::MemBlock Add()", __ecereMethod___ecereNameSpace__ecere__com__BlockPool_Add, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Expand", "bool Expand(unsigned int numBlocks)", __ecereMethod___ecereNameSpace__ecere__com__BlockPool_Expand, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Remove", "void Remove(ecere::com::MemBlock block)", __ecereMethod___ecereNameSpace__ecere__com__BlockPool_Remove, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "first", "ecere::com::MemBlock", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "last", "ecere::com::MemBlock", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "free", "ecere::com::MemBlock", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "blockSize", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "blockSpace", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "numParts", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "numBlocks", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "totalSize", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "usedSpace", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::log2i", "uint ecere::com::log2i(uint number)", __ecereNameSpace__ecere__com__log2i, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::pow2i", "uint ecere::com::pow2i(uint number)", __ecereNameSpace__ecere__com__pow2i, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::memswap", "void ecere::com::memswap(byte * a, byte * b, uint size)", __ecereNameSpace__ecere__com__memswap, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::CheckConsistency", "void ecere::com::CheckConsistency(void)", __ecereNameSpace__ecere__com__CheckConsistency, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::CheckMemory", "void ecere::com::CheckMemory(void)", __ecereNameSpace__ecere__com__CheckMemory, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_RegisterClass", "ecere::com::Class ecere::com::eSystem_RegisterClass(ecere::com::ClassType type, const char * name, const char * baseName, int size, int sizeClass, bool (* Constructor)(void *), void (* Destructor)(void *), ecere::com::Module module, ecere::com::AccessMode declMode, ecere::com::AccessMode inheritanceAccess)", __ecereNameSpace__ecere__com__eSystem_RegisterClass, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_Unregister", "void ecere::com::eClass_Unregister(ecere::com::Class _class)", __ecereNameSpace__ecere__com__eClass_Unregister, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::_strtoi64", "int64 ecere::com::_strtoi64(const char * string, const char * * endString, int base)", __ecereNameSpace__ecere__com___strtoi64, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::_strtoui64", "uint64 ecere::com::_strtoui64(const char * string, const char * * endString, int base)", __ecereNameSpace__ecere__com___strtoui64, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_FindClass", "ecere::com::Class ecere::com::eSystem_FindClass(ecere::com::Module module, const char * name)", __ecereNameSpace__ecere__com__eSystem_FindClass, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::System_FindClass", "ecere::com::Class ecere::com::System_FindClass(ecere::com::Module module, const char * name, bool registerTemplatesInternalDecl)", __ecereNameSpace__ecere__com__System_FindClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::DefaultFunction", "bool ecere::com::DefaultFunction(void)", __ecereNameSpace__ecere__com__DefaultFunction, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_IsDerived", "bool ecere::com::eClass_IsDerived(ecere::com::Class _class, ecere::com::Class from)", __ecereNameSpace__ecere__com__eClass_IsDerived, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_AddMethod", "ecere::com::Method ecere::com::eClass_AddMethod(ecere::com::Class _class, const char * name, const char * type, void * function, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eClass_AddMethod, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_AddVirtualMethod", "ecere::com::Method ecere::com::eClass_AddVirtualMethod(ecere::com::Class _class, const char * name, const char * type, void * function, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eClass_AddVirtualMethod, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_AddProperty", "ecere::com::Property ecere::com::eClass_AddProperty(ecere::com::Class _class, const char * name, const char * dataType, void * setStmt, void * getStmt, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eClass_AddProperty, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_AddClassProperty", "ecere::com::ClassProperty ecere::com::eClass_AddClassProperty(ecere::com::Class _class, const char * name, const char * dataType, void * setStmt, void * getStmt)", __ecereNameSpace__ecere__com__eClass_AddClassProperty, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_FindClassProperty", "ecere::com::ClassProperty ecere::com::eClass_FindClassProperty(ecere::com::Class _class, const char * name)", __ecereNameSpace__ecere__com__eClass_FindClassProperty, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_GetProperty", "int64 ecere::com::eClass_GetProperty(ecere::com::Class _class, const char * name)", __ecereNameSpace__ecere__com__eClass_GetProperty, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_SetProperty", "void ecere::com::eClass_SetProperty(ecere::com::Class _class, const char * name, int64 value)", __ecereNameSpace__ecere__com__eClass_SetProperty, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_FindMethod", "ecere::com::Method ecere::com::eClass_FindMethod(ecere::com::Class _class, const char * name, ecere::com::Module module)", __ecereNameSpace__ecere__com__eClass_FindMethod, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_New", "void * ecere::com::eInstance_New(ecere::com::Class _class)", __ecereNameSpace__ecere__com__eInstance_New, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_NewEx", "void * ecere::com::eInstance_NewEx(ecere::com::Class _class, bool bindingsAlloc)", __ecereNameSpace__ecere__com__eInstance_NewEx, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_Evolve", "void ecere::com::eInstance_Evolve(ecere::com::Instance * instancePtr, ecere::com::Class _class)", __ecereNameSpace__ecere__com__eInstance_Evolve, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_Delete", "void ecere::com::eInstance_Delete(ecere::com::Instance instance)", __ecereNameSpace__ecere__com__eInstance_Delete, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_FindProperty", "ecere::com::Property ecere::com::eClass_FindProperty(ecere::com::Class _class, const char * name, ecere::com::Module module)", __ecereNameSpace__ecere__com__eClass_FindProperty, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_FindDataMember", "ecere::com::DataMember ecere::com::eClass_FindDataMember(ecere::com::Class _class, const char * name, ecere::com::Module module, ecere::com::DataMember * subMemberStack, int * subMemberStackPos)", __ecereNameSpace__ecere__com__eClass_FindDataMember, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_FindDataMemberAndOffset", "ecere::com::DataMember ecere::com::eClass_FindDataMemberAndOffset(ecere::com::Class _class, const char * name, uint * offset, ecere::com::Module module, ecere::com::DataMember * subMemberStack, int * subMemberStackPos)", __ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_FindDataMemberAndId", "ecere::com::DataMember ecere::com::eClass_FindDataMemberAndId(ecere::com::Class _class, const char * name, int * id, ecere::com::Module module, ecere::com::DataMember * subMemberStack, int * subMemberStackPos)", __ecereNameSpace__ecere__com__eClass_FindDataMemberAndId, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_FindNextMember", "void ecere::com::eClass_FindNextMember(ecere::com::Class _class, ecere::com::Class * curClass, ecere::com::DataMember * curMember, ecere::com::DataMember * subMemberStack, int * subMemberStackPos)", __ecereNameSpace__ecere__com__eClass_FindNextMember, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_SetMethod", "void ecere::com::eInstance_SetMethod(ecere::com::Instance instance, const char * name, void * function)", __ecereNameSpace__ecere__com__eInstance_SetMethod, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_IsDerived", "bool ecere::com::eInstance_IsDerived(ecere::com::Instance instance, ecere::com::Class from)", __ecereNameSpace__ecere__com__eInstance_IsDerived, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_IncRef", "void ecere::com::eInstance_IncRef(ecere::com::Instance instance)", __ecereNameSpace__ecere__com__eInstance_IncRef, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_DecRef", "void ecere::com::eInstance_DecRef(ecere::com::Instance instance)", __ecereNameSpace__ecere__com__eInstance_DecRef, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_Resize", "void ecere::com::eClass_Resize(ecere::com::Class _class, int newSize)", __ecereNameSpace__ecere__com__eClass_Resize, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_AddDataMember", "ecere::com::DataMember ecere::com::eClass_AddDataMember(ecere::com::Class _class, const char * name, const char * type, uint size, uint alignment, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eClass_AddDataMember, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eMember_AddDataMember", "ecere::com::DataMember ecere::com::eMember_AddDataMember(ecere::com::DataMember member, const char * name, const char * type, uint size, uint alignment, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eMember_AddDataMember, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eMember_New", "ecere::com::DataMember ecere::com::eMember_New(ecere::com::DataMemberType type, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eMember_New, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eMember_AddMember", "bool ecere::com::eMember_AddMember(ecere::com::DataMember addTo, ecere::com::DataMember dataMember)", __ecereNameSpace__ecere__com__eMember_AddMember, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_AddMember", "bool ecere::com::eClass_AddMember(ecere::com::Class _class, ecere::com::DataMember dataMember)", __ecereNameSpace__ecere__com__eClass_AddMember, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_AddBitMember", "ecere::com::BitMember ecere::com::eClass_AddBitMember(ecere::com::Class _class, const char * name, const char * type, int bitSize, int bitPos, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eClass_AddBitMember, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eModule_Load", "ecere::com::Module ecere::com::eModule_Load(ecere::com::Module fromModule, const char * name, ecere::com::AccessMode importAccess)", __ecereNameSpace__ecere__com__eModule_Load, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eModule_LoadStrict", "ecere::com::Module ecere::com::eModule_LoadStrict(ecere::com::Module fromModule, const char * name, ecere::com::AccessMode importAccess)", __ecereNameSpace__ecere__com__eModule_LoadStrict, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eModule_LoadStatic", "ecere::com::Module ecere::com::eModule_LoadStatic(ecere::com::Module fromModule, const char * name, ecere::com::AccessMode importAccess, bool (* Load)(ecere::com::Module module), bool (* Unload)(ecere::com::Module module))", __ecereNameSpace__ecere__com__eModule_LoadStatic, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eModule_Unload", "void ecere::com::eModule_Unload(ecere::com::Module fromModule, ecere::com::Module module)", __ecereNameSpace__ecere__com__eModule_Unload, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eEnum_AddFixedValue", "void ecere::com::eEnum_AddFixedValue(ecere::com::Class _class, const char * string, int64 value)", __ecereNameSpace__ecere__com__eEnum_AddFixedValue, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eEnum_AddValue", "int64 ecere::com::eEnum_AddValue(ecere::com::Class _class, const char * string)", __ecereNameSpace__ecere__com__eEnum_AddValue, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_RegisterDefine", "ecere::com::DefinedExpression ecere::com::eSystem_RegisterDefine(const char * name, const char * value, ecere::com::Module module, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eSystem_RegisterDefine, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_RegisterFunction", "ecere::com::GlobalFunction ecere::com::eSystem_RegisterFunction(const char * name, const char * type, void * func, ecere::com::Module module, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eSystem_RegisterFunction, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_FindDefine", "ecere::com::DefinedExpression ecere::com::eSystem_FindDefine(ecere::com::Module module, const char * name)", __ecereNameSpace__ecere__com__eSystem_FindDefine, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_FindFunction", "ecere::com::GlobalFunction ecere::com::eSystem_FindFunction(ecere::com::Module module, const char * name)", __ecereNameSpace__ecere__com__eSystem_FindFunction, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_Renew", "void * ecere::com::eSystem_Renew(void * memory, uint size)", __ecereNameSpace__ecere__com__eSystem_Renew, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_Renew0", "void * ecere::com::eSystem_Renew0(void * memory, uint size)", __ecereNameSpace__ecere__com__eSystem_Renew0, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_New", "void * ecere::com::eSystem_New(uint size)", __ecereNameSpace__ecere__com__eSystem_New, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_New0", "void * ecere::com::eSystem_New0(uint size)", __ecereNameSpace__ecere__com__eSystem_New0, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_Delete", "void ecere::com::eSystem_Delete(void * memory)", __ecereNameSpace__ecere__com__eSystem_Delete, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_FireSelfWatchers", "void ecere::com::eInstance_FireSelfWatchers(ecere::com::Instance instance, ecere::com::Property _property)", __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_FireWatchers", "void ecere::com::eInstance_FireWatchers(ecere::com::Instance instance, ecere::com::Property _property)", __ecereNameSpace__ecere__com__eInstance_FireWatchers, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eProperty_Watchable", "void ecere::com::eProperty_Watchable(ecere::com::Property _property)", __ecereNameSpace__ecere__com__eProperty_Watchable, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_DestructionWatchable", "void ecere::com::eClass_DestructionWatchable(ecere::com::Class _class)", __ecereNameSpace__ecere__com__eClass_DestructionWatchable, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eProperty_SelfWatch", "void ecere::com::eProperty_SelfWatch(ecere::com::Class _class, const char * name, void (* callback)(void *))", __ecereNameSpace__ecere__com__eProperty_SelfWatch, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_Watch", "void ecere::com::eInstance_Watch(ecere::com::Instance instance, ecere::com::Property _property, void * object, void (* callback)(void *, void *))", __ecereNameSpace__ecere__com__eInstance_Watch, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_WatchDestruction", "void ecere::com::eInstance_WatchDestruction(ecere::com::Instance instance, ecere::com::Instance object, void (* callback)(void *, void *))", __ecereNameSpace__ecere__com__eInstance_WatchDestruction, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_StopWatching", "void ecere::com::eInstance_StopWatching(ecere::com::Instance instance, ecere::com::Property _property, ecere::com::Instance object)", __ecereNameSpace__ecere__com__eInstance_StopWatching, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_GetDesigner", "subclass(ecere::com::ClassDesignerBase) ecere::com::eClass_GetDesigner(ecere::com::Class _class)", __ecereNameSpace__ecere__com__eClass_GetDesigner, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_GetDesigner", "subclass(ecere::com::ClassDesignerBase) ecere::com::eInstance_GetDesigner(ecere::com::Instance instance)", __ecereNameSpace__ecere__com__eInstance_GetDesigner, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::LocateModule", "bool ecere::com::LocateModule(const char * name, const char * fileName)", __ecereNameSpace__ecere__com__LocateModule, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::__ecere_COM_Initialize", "ecere::com::Application ecere::com::__ecere_COM_Initialize(bool guiApp, int argc, char * argv[])", __ecereNameSpace__ecere__com____ecere_COM_Initialize, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_SetArgs", "void ecere::com::eSystem_SetArgs(ecere::com::Application app, int argc, char * argv[])", __ecereNameSpace__ecere__com__eSystem_SetArgs, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_AddTemplateParameter", "ecere::com::ClassTemplateParameter ecere::com::eClass_AddTemplateParameter(ecere::com::Class _class, const char * name, ecere::com::TemplateParameterType type, const void * info, ecere::com::ClassTemplateArgument defaultArg)", __ecereNameSpace__ecere__com__eClass_AddTemplateParameter, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_DoneAddingTemplateParameters", "void ecere::com::eClass_DoneAddingTemplateParameters(ecere::com::Class base)", __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters, module, 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::Platform", 0, 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Platform = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod___ecereNameSpace__ecere__com__Platform_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetDataFromString", 0, __ecereMethod___ecereNameSpace__ecere__com__Platform_OnGetDataFromString, 1);
__ecereProp___ecereNameSpace__ecere__com__Platform_char__PTR_ = __ecereNameSpace__ecere__com__eClass_AddProperty(class, 0, "const char *", __ecereProp___ecereNameSpace__ecere__com__Platform_Set_char__PTR_, __ecereProp___ecereNameSpace__ecere__com__Platform_Get_char__PTR_, 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "unknown", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "win32", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "tux", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "apple", 3);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::GetRuntimePlatform", "ecere::com::Platform ecere::com::GetRuntimePlatform(void)", __ecereNameSpace__ecere__com__GetRuntimePlatform, module, 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::ObjectInfo", 0, sizeof(struct __ecereNameSpace__ecere__com__ObjectInfo), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ObjectInfo = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::ObjectInfo", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::ObjectInfo", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "instance", "ecere::com::Instance", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "instCode", "Instantiation", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "deleted", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "oClass", "ecere::com::ObjectInfo", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "instances", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "classDefinition", "ClassDefinition", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "modified", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "i18nStrings", "void *", sizeof(void *), 0xF000F000, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::DesignerBase", "ecere::gui::Window", sizeof(struct __ecereNameSpace__ecere__com__DesignerBase), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__DesignerBase = class;
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "FindObject", "bool FindObject(ecere::com::Instance * instance, const char * string)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "RenameObject", "void RenameObject(ecere::com::ObjectInfo object, const char * name)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "SelectObjectFromDesigner", "void SelectObjectFromDesigner(ecere::com::ObjectInfo object)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "CodeAddObject", "void CodeAddObject(ecere::com::Instance instance, ecere::com::ObjectInfo * object)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "SheetAddObject", "void SheetAddObject(ecere::com::ObjectInfo object)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "AddToolBoxClass", "void AddToolBoxClass(ecere::com::Class _class)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "AddDefaultMethod", "void AddDefaultMethod(ecere::com::Instance instance, ecere::com::Instance classInstance)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "DeleteObject", "void DeleteObject(ecere::com::ObjectInfo object)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "ObjectContainsCode", "bool ObjectContainsCode(ecere::com::ObjectInfo object)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "ModifyCode", "void ModifyCode(void)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "UpdateProperties", "void UpdateProperties(void)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "classDesigner", "ecere::com::ClassDesignerBase", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "objectClass", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isDragging", "bool", 4, 4, 1);
__ecerePropM___ecereNameSpace__ecere__com__DesignerBase_classDesigner = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "classDesigner", "ecere::com::ClassDesignerBase", __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Set_classDesigner, __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Get_classDesigner, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__DesignerBase_classDesigner = __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_classDesigner, __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_classDesigner = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__DesignerBase_objectClass = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "objectClass", "const char *", __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Set_objectClass, __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Get_objectClass, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__DesignerBase_objectClass = __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_objectClass, __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_objectClass = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__DesignerBase_isDragging = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "isDragging", "bool", __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Set_isDragging, __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Get_isDragging, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__DesignerBase_isDragging = __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_isDragging, __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_isDragging = (void *)0;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::ClassDesignerBase", "ecere::gui::Window", 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ClassDesignerBase = class;
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Reset", "void Reset(void)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "AddObject", "void AddObject(void)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "SelectObject", "void SelectObject(ecere::com::ObjectInfo object, ecere::com::Instance control)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "ListToolBoxClasses", "void ListToolBoxClasses(ecere::com::DesignerBase designer)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "PrepareTestObject", "void ::PrepareTestObject(ecere::com::DesignerBase designer, ecere::com::Instance test)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "CreateObject", "void ::CreateObject(ecere::com::DesignerBase designer, ecere::com::Instance instance, ecere::com::ObjectInfo object, bool isClass, ecere::com::Instance _class)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "PostCreateObject", "void ::PostCreateObject(ecere::com::Instance instance, ecere::com::ObjectInfo object, bool isClass, ecere::com::Instance _class)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "DroppedObject", "void ::DroppedObject(ecere::com::Instance instance, ecere::com::ObjectInfo object, bool isClass, ecere::com::Instance _class)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "DestroyObject", "void ::DestroyObject(ecere::com::Instance object)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "FixProperty", "void ::FixProperty(ecere::com::Property prop, ecere::com::Instance object)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "CreateNew", "void ::CreateNew(EditBox editBox, Size clientSize, const char * name, const char * inherit)", 0, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::SetActiveDesigner", "void ecere::com::SetActiveDesigner(ecere::com::DesignerBase designer)", __ecereNameSpace__ecere__com__SetActiveDesigner, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::GetActiveDesigner", "ecere::com::DesignerBase ecere::com::GetActiveDesigner(void)", __ecereNameSpace__ecere__com__GetActiveDesigner, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_SetPoolingDisabled", "void ecere::com::eSystem_SetPoolingDisabled(bool disabled)", __ecereNameSpace__ecere__com__eSystem_SetPoolingDisabled, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::sys::LEAD_OFFSET", "0xD800 - (0x10000 >> 10)", module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::sys::SURROGATE_OFFSET", "0x10000 - (0xD800 << 10) - 0xDC00", module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::UTF8Validate", "bool ecere::sys::UTF8Validate(const char * source)", __ecereNameSpace__ecere__sys__UTF8Validate, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::ISO8859_1toUTF8", "int ecere::sys::ISO8859_1toUTF8(const char * source, char * dest, int max)", __ecereNameSpace__ecere__sys__ISO8859_1toUTF8, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::UTF16toUTF8", "char * ecere::sys::UTF16toUTF8(const uint16 * source)", __ecereNameSpace__ecere__sys__UTF16toUTF8, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::UTF16toUTF8Buffer", "int ecere::sys::UTF16toUTF8Buffer(const uint16 * source, char * dest, int max)", __ecereNameSpace__ecere__sys__UTF16toUTF8Buffer, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::UTF8GetChar", "unichar ecere::sys::UTF8GetChar(const char * string, int * numBytes)", __ecereNameSpace__ecere__sys__UTF8GetChar, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::UTF8toUTF16Buffer", "int ecere::sys::UTF8toUTF16Buffer(const char * source, uint16 * dest, int max)", __ecereNameSpace__ecere__sys__UTF8toUTF16Buffer, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::UTF32toUTF8Len", "int ecere::sys::UTF32toUTF8Len(const unichar * source, int count, char * dest, int max)", __ecereNameSpace__ecere__sys__UTF32toUTF8Len, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::UTF8toUTF16", "uint16 * ecere::sys::UTF8toUTF16(const char * source, int * wordCount)", __ecereNameSpace__ecere__sys__UTF8toUTF16, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::queryMemInfo", "void ecere::com::queryMemInfo(char * string)", __ecereNameSpace__ecere__com__queryMemInfo, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_LockMem", "void ecere::com::eSystem_LockMem(void)", __ecereNameSpace__ecere__com__eSystem_LockMem, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_UnlockMem", "void ecere::com::eSystem_UnlockMem(void)", __ecereNameSpace__ecere__com__eSystem_UnlockMem, module, 4);
}

