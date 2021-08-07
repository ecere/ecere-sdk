/* Code generated from eC source file: dataTypes.ec */
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
extern int runtimePlatform;


















typedef __builtin_va_list va_list;

void exit(int status);

void * calloc(size_t nmemb, size_t size);

void free(void * ptr);

void * malloc(size_t size);

void * realloc(void * ptr, size_t size);

long int strtol(const char * nptr, char ** endptr, int base);

long long int strtoll(const char * nptr, char ** endptr, int base);

unsigned long long int strtoull(const char * nptr, char ** endptr, int base);

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

FILE * eC_stdout(void);

FILE * eC_stderr(void);

unsigned int Float_isNan(float n);

unsigned int Float_isInf(float n);

int Float_signBit(float n);

float Float_nan(void);

float Float_inf(void);

unsigned int Double_isNan(double n);

unsigned int Double_isInf(double n);

int Double_signBit(double n);

double Double_nan(void);

double Double_inf(void);

extern int __ecereVMethodID_class_OnGetString;

extern int __ecereVMethodID_class_OnGetDataFromString;

extern int __ecereVMethodID_class_OnCompare;

extern int __ecereVMethodID_class_OnSerialize;

extern int __ecereVMethodID_class_OnUnserialize;

extern int __ecereVMethodID_class_OnCopy;

struct __ecereNameSpace__ecere__com__SerialBuffer
{
unsigned char * _buffer;
size_t count;
size_t _size;
size_t pos;
} ecere_gcc_struct;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp_float_isInf;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp_float_signBit;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp_float_isNan;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp_double_isInf;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp_double_signBit;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp_double_isNan;

struct __ecereNameSpace__ecere__com__StaticString
{
char string[1];
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__sys__BTNode;

struct __ecereNameSpace__ecere__sys__OldList
{
void *  first;
void *  last;
int count;
unsigned int offset;
unsigned int circ;
} ecere_gcc_struct;

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
void *  p;
float f;
double d;
long long i64;
uint64 ui64;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

extern void *  __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew(void *  memory, unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew0(void *  memory, unsigned int size);

extern void __ecereNameSpace__ecere__com__eSystem_Delete(void *  memory);

extern void *  memcpy(void * , const void * , size_t size);

extern int strcmp(const char * , const char * );

extern char *  strcpy(char * , const char * );

extern int toupper(int);

extern int strcasecmp(const char * , const char * );

extern char *  strchr(const char * , int);

extern char *  strcat(char * , const char * );

extern size_t strlen(const char * );

extern void *  memset(void *  area, int value, size_t count);

extern char *  __ecereNameSpace__ecere__sys__TrimRSpaces(const char *  string, char *  output);

extern int sprintf(char * , const char * , ...);

extern unsigned long strtoul(const char *  nptr, char * *  endptr, int base);

extern long long __ecereNameSpace__ecere__com___strtoi64(const char *  string, const char * *  endString, int base);

extern uint64 __ecereNameSpace__ecere__com___strtoui64(const char *  string, const char * *  endString, int base);

extern char *  __ecereNameSpace__ecere__sys__CopyString(const char *  string);

extern double strtod(const char * , char * * );

extern unsigned int __ecereNameSpace__ecere__sys__UTF8Validate(const char *  source);

extern int __ecereNameSpace__ecere__sys__ISO8859_1toUTF8(const char *  source, char *  dest, int max);

extern int puts(const char * );

extern int fputs(const char * , void *  stream);

struct __ecereNameSpace__ecere__com__DefinedExpression;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern int __ecereVMethodID_class_OnGetString;

extern int __ecereVMethodID_class_OnFree;

extern int __ecereVMethodID_class_OnCopy;

extern int __ecereVMethodID_class_OnCompare;

extern int __ecereVMethodID_class_OnGetDataFromString;

extern unsigned int (* __ecereProp_float_Get_isInf)(float this);

extern int (* __ecereProp_float_Get_signBit)(float this);

extern unsigned int (* __ecereProp_float_Get_isNan)(float this);

extern unsigned int (* __ecereProp_double_Get_isInf)(double this);

extern int (* __ecereProp_double_Get_signBit)(double this);

extern unsigned int (* __ecereProp_double_Get_isNan)(double this);

struct __ecereNameSpace__ecere__com__EnumClassData
{
struct __ecereNameSpace__ecere__sys__OldList values;
long long largest;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__Property;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_buffer, * __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_buffer;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_size, * __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_size;

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} ecere_gcc_struct;

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

static int __ecereNameSpace__ecere__com__Integer_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, int * data1, int * data2)
{
int result = 0;

if(!data1 && !data2)
result = 0;
else if(data1 && !data2)
result = 1;
else if(!data1 && data2)
result = -1;
else if(*data1 > *data2)
result = 1;
else if(*data1 < *data2)
result = -1;
return result;
}

const char * __ecereNameSpace__ecere__com__Integer_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, int * data, char * string, void * fieldData, unsigned int * onType)
{
sprintf(string, "%d", *data);
return string;
}

static unsigned int __ecereNameSpace__ecere__com__Integer_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, int * data, const char * string)
{
char * end;
int result = (int)strtol(string, &end, 0);

if(end > string)
{
*data = result;
return 1;
}
return 0;
}

static const char * __ecereNameSpace__ecere__com__Int16_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, short * data, char * string, void * fieldData, unsigned int * onType)
{
sprintf(string, "%d", (int)*data);
return string;
}

static unsigned int __ecereNameSpace__ecere__com__Int16_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, short * data, const char * string)
{
char * end;
short result = (short)strtol(string, &end, 0);

if(end > string)
{
*data = result;
return 1;
}
return 0;
}

static int __ecereNameSpace__ecere__com__Int16_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, short * data1, short * data2)
{
int result = 0;

if(!data1 && !data2)
result = 0;
else if(data1 && !data2)
result = 1;
else if(!data1 && data2)
result = -1;
else if(*data1 > *data2)
result = 1;
else if(*data1 < *data2)
result = -1;
return result;
}

static int __ecereNameSpace__ecere__com__UInteger_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, unsigned int * data1, unsigned int * data2)
{
int result = 0;

if(!data1 && !data2)
result = 0;
else if(data1 && !data2)
result = 1;
else if(!data1 && data2)
result = -1;
else if(*data1 > *data2)
result = 1;
else if(*data1 < *data2)
result = -1;
return result;
}

static const char * __ecereNameSpace__ecere__com__UInteger_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, unsigned int * data, char * string, void * fieldData, unsigned int * onType)
{
sprintf(string, "%u", *data);
return string;
}

static int __ecereNameSpace__ecere__com__UInt16_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, unsigned short * data1, unsigned int * data2)
{
int result = 0;

if(!data1 && !data2)
result = 0;
else if(data1 && !data2)
result = 1;
else if(!data1 && data2)
result = -1;
else if(*data1 > *data2)
result = 1;
else if(*data1 < *data2)
result = -1;
return result;
}

static const char * __ecereNameSpace__ecere__com__UInt16_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, unsigned short * data, char * string, void * fieldData, unsigned int * onType)
{
sprintf(string, "%u", (unsigned int)*data);
return string;
}

static const char * __ecereNameSpace__ecere__com__UIntegerHex_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, unsigned int * data, char * string, void * fieldData, unsigned int * onType)
{
sprintf(string, "%x", *data);
return string;
}

static unsigned int __ecereNameSpace__ecere__com__UInteger_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, unsigned int * data, const char * string)
{
char * end;
unsigned int result = (unsigned int)strtoul(string, &end, 0);

if(end > string)
{
*data = result;
return 1;
}
return 0;
}

static unsigned int __ecereNameSpace__ecere__com__UInt16_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, unsigned short * data, const char * string)
{
char * end;
unsigned short result = (unsigned short)strtoul(string, &end, 0);

if(end > string)
{
*data = result;
return 1;
}
return 0;
}

static int __ecereNameSpace__ecere__com__Byte_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, unsigned char * data1, unsigned char * data2)
{
int result = 0;

if(!data1 && !data2)
result = 0;
else if(data1 && !data2)
result = 1;
else if(!data1 && data2)
result = -1;
else if(*data1 > *data2)
result = 1;
else if(*data1 < *data2)
result = -1;
return result;
}

static const char * __ecereNameSpace__ecere__com__Byte_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, unsigned char * data, char * string, void * fieldData, unsigned int * onType)
{
sprintf(string, "%u", (int)*data);
return string;
}

static const char * __ecereNameSpace__ecere__com__Char_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, char * data, char * string, void * fieldData, unsigned int * onType)
{
if(onType && *onType)
{
char ch = *data;

if(ch == '\t')
strcpy(string, "'\\t'");
else if(ch == '\n')
strcpy(string, "'\\n'");
else if(ch == '\r')
strcpy(string, "'\\r'");
else if(ch == '\a')
strcpy(string, "'\\a'");
else if(ch == '\\')
strcpy(string, "'\\\\'");
else if(ch < 32 || ch >= 127)
sprintf(string, "'\\x%x'", ch);
else
sprintf(string, "'%c'", ch);
}
else
sprintf(string, "%c", *data);
return string;
}

static unsigned int __ecereNameSpace__ecere__com__Byte_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, unsigned char * data, const char * string)
{
char * end;
unsigned char result = (unsigned char)strtoul(string, &end, 0);

if(end > string)
{
*data = result;
return 1;
}
return 0;
}

static int __ecereNameSpace__ecere__com__Int64_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, long long * data1, long long * data2)
{
int result = 0;

if(!data1 && !data2)
result = 0;
else if(data1 && !data2)
result = 1;
else if(!data1 && data2)
result = -1;
else if(*data1 > *data2)
result = 1;
else if(*data1 < *data2)
result = -1;
return result;
}

static int __ecereNameSpace__ecere__com__UInt64_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, uint64 * data1, uint64 * data2)
{
int result = 0;

if(!data1 && !data2)
result = 0;
else if(data1 && !data2)
result = 1;
else if(!data1 && data2)
result = -1;
else if(*data1 > *data2)
result = 1;
else if(*data1 < *data2)
result = -1;
return result;
}

static int __ecereNameSpace__ecere__com__IntPtr64_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, long long data1, long long data2)
{
int result = 0;

if(data1 > data2)
result = 1;
else if(data1 < data2)
result = -1;
return result;
}

static int __ecereNameSpace__ecere__com__IntPtr32_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, int data1, int data2)
{
int result = 0;

if(data1 > data2)
result = 1;
else if(data1 < data2)
result = -1;
return result;
}

static int __ecereNameSpace__ecere__com__UIntPtr64_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, uint64 data1, uint64 data2)
{
int result = 0;

if(data1 > data2)
result = 1;
else if(data1 < data2)
result = -1;
return result;
}

static int __ecereNameSpace__ecere__com__UIntPtr32_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, unsigned int data1, unsigned int data2)
{
int result = 0;

if(data1 > data2)
result = 1;
else if(data1 < data2)
result = -1;
return result;
}

static const char * __ecereNameSpace__ecere__com__Int64_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, long long * data, char * string, void * fieldData, unsigned int * onType)
{
sprintf(string, ((__runtimePlatform == 1) ? "%I64d" : "%lld"), *data);
return string;
}

static const char * __ecereNameSpace__ecere__com__UInt64_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, uint64 * data, char * string, void * fieldData, unsigned int * onType)
{
sprintf(string, ((__runtimePlatform == 1) ? "%I64u" : "%llu"), *data);
return string;
}

static const char * __ecereNameSpace__ecere__com__UInt64Hex_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, uint64 * data, char * string, void * fieldData, unsigned int * onType)
{
sprintf(string, ((__runtimePlatform == 1) ? "0x%I64X" : "0x%llX"), *data);
return string;
}

static unsigned int __ecereNameSpace__ecere__com__Int64_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, long long * data, const char * string)
{
const char * end;
uint64 result = __ecereNameSpace__ecere__com___strtoi64(string, &end, 0);

if(end > string)
{
*data = result;
return 1;
}
return 0;
}

static unsigned int __ecereNameSpace__ecere__com__UInt64_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, uint64 * data, const char * string)
{
const char * end;
uint64 result = __ecereNameSpace__ecere__com___strtoui64(string, &end, 0);

if(end > string)
{
*data = result;
return 1;
}
return 0;
}

static int __ecereNameSpace__ecere__com__Float_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, float * data1, float * data2)
{
int result = 0;

if(!data1 && !data2)
result = 0;
else if(data1 && !data2)
result = 1;
else if(!data1 && data2)
result = -1;
else if(*data1 > *data2)
result = 1;
else if(*data1 < *data2)
result = -1;
return result;
}

static char * __ecereNameSpace__ecere__com__Float_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, float * data, char * string, void * fieldData, unsigned int * onType)
{
float f = *data;

if(__ecereProp_float_Get_isInf(f))
{
if(__ecereProp_float_Get_signBit(f))
strcpy(string, "-inf");
else
strcpy(string, "inf");
}
else if(__ecereProp_float_Get_isNan(f))
{
if(__ecereProp_float_Get_signBit(f))
strcpy(string, "-nan");
else
strcpy(string, "nan");
}
else if(f && (((f < 0) ? -f : f) > 1E20 || ((f < 0) ? -f : f) < 1E-20))
sprintf(string, "%.15e", f);
else
{
int c;
int last = 0;
unsigned int checkFor1 = 1, checkFor9 = 1;
int numDigits = 7, num = 1;
int first9 = 0;
char format[10];
char * dot;
int len;

while(numDigits && (float)num < f)
numDigits--, num *= 10;
sprintf(format, "%%.%df", numDigits);
sprintf(string, format, f);
dot = strchr(string, '.');
len = strlen(string);
c = len - 1;
for(; c >= 0; c--)
{
char ch = string[c];

if(ch != '0' && dot)
{
if(ch == '1' && string + c - dot >= 6 && c == len - 1 && checkFor1)
checkFor1 = 0;
else if(ch == '9' && string + c - dot >= 6 && c == len - 1 && checkFor9)
first9 = c;
else
{
last = ((last > c) ? last : c);
checkFor9 = 0;
checkFor1 = 0;
}
}
if(ch == '.')
{
if(last == c)
string[c] = 0;
else
{
string[last + 1] = 0;
if(first9)
{
while(--first9 > 0)
{
if(first9 != c)
if(string[first9] < '9')
{
string[first9]++;
break;
}
}
if(first9 < c)
{
string[c - 1] = '1';
first9 = c;
}
string[first9] = 0;
}
}
break;
}
}
}
return string;
}

static unsigned int __ecereNameSpace__ecere__com__Float_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, float * data, char * string)
{
char * end;
float result = (float)strtod(string, &end);

if(end > string)
{
*data = result;
return 1;
}
return 0;
}

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  dataType, void *  setStmt, void *  getStmt, int declMode);

static int __ecereNameSpace__ecere__com__Double_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, double * data1, double * data2)
{
int result = 0;

if(!data1 && !data2)
result = 0;
else if(data1 && !data2)
result = 1;
else if(!data1 && data2)
result = -1;
else if(*data1 > *data2)
result = 1;
else if(*data1 < *data2)
result = -1;
return result;
}

static char * __ecereNameSpace__ecere__com__Double_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, double * data, char * string, void * fieldData, unsigned int * onType)
{
double f = *data;

if(__ecereProp_double_Get_isInf(f))
{
if(__ecereProp_double_Get_signBit(f))
strcpy(string, "-inf");
else
strcpy(string, "inf");
}
else if(__ecereProp_double_Get_isNan(f))
{
if(__ecereProp_double_Get_signBit(f))
strcpy(string, "-nan");
else
strcpy(string, "nan");
}
else if(f && (((f < 0) ? -f : f) > 1E20 || ((f < 0) ? -f : f) < 1E-20))
sprintf(string, "%.15e", f);
else
{
int c;
int last = 0;

if(runtimePlatform == 1)
sprintf(string, "%.15g", f);
else
sprintf(string, "%.13lf", f);
c = strlen(string) - 1;
for(; c >= 0; c--)
{
if(string[c] != '0')
last = ((last > c) ? last : c);
if(string[c] == '.')
{
if(last == c)
string[c] = 0;
else
string[last + 1] = 0;
break;
}
}
}
return string;
}

static unsigned int __ecereNameSpace__ecere__com__Double_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, double * data, char * string)
{
char * end;
double result;

result = strtod(string, &end);
if(end > string)
{
*data = result;
return 1;
}
return 0;
}

static void __ecereNameSpace__ecere__com__String_OnCopy(struct __ecereNameSpace__ecere__com__Class * _class, char ** data, char * newData)
{
if(newData)
{
int len = strlen(newData);

if(1)
{
*data = __ecereNameSpace__ecere__com__eSystem_New(len + 1);
memcpy(*data, newData, len + 1);
}
else
*data = (((void *)0));
}
else
*data = (((void *)0));
}

static unsigned int __ecereNameSpace__ecere__com__String_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, char ** data, char * newData)
{
if(newData)
{
int len = strlen(newData);

if(len)
{
*data = __ecereNameSpace__ecere__com__eSystem_New(len + 1);
memcpy(*data, newData, len + 1);
}
else
*data = (((void *)0));
}
return 1;
}

static int __ecereNameSpace__ecere__com__String_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, const char * string1, const char * string2)
{
if(string1 && string2)
return strcmp(string1, string2);
if(!string1 && string2)
return 1;
if(string1 && !string2)
return -1;
return 0;
}

static char * __ecereNameSpace__ecere__com__String_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, char * string, char * tempString, void * fieldData, unsigned int * onType)
{
return string;
}

static void __ecereNameSpace__ecere__com__String_OnFree(struct __ecereNameSpace__ecere__com__Class * _class, char * string)
{
if(string)
{
__ecereNameSpace__ecere__com__eSystem_Delete(string);
}
}

extern void __ecereNameSpace__ecere__com__eEnum_AddFixedValue(struct __ecereNameSpace__ecere__com__Class * _class, const char *  string, long long value);

extern int __ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData;

struct __ecereNameSpace__ecere__com__Property
{
struct __ecereNameSpace__ecere__com__Property * prev;
struct __ecereNameSpace__ecere__com__Property * next;
const char *  name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
const char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
struct __ecereNameSpace__ecere__com__Instance * dataType;
void (*  Set)(void * , int);
int (*  Get)(void * );
unsigned int (*  IsSet)(void * );
void *  data;
void *  symbol;
int vid;
unsigned int conversion;
unsigned int watcherOffset;
const char *  category;
unsigned int compiled;
unsigned int selfWatchable;
unsigned int isWatchable;
} ecere_gcc_struct;

extern void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

extern void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object);

extern void __ecereNameSpace__ecere__com__eInstance_Watch(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

unsigned char *  __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Get_buffer(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Set_buffer(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char *  value);

unsigned int __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Get_size(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Set_size(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value);

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

extern int __ecereVMethodID_class_OnSaveEdit;

extern int __ecereVMethodID_class_OnEdit;

extern int __ecereVMethodID_class_OnSerialize;

extern int __ecereVMethodID_class_OnUnserialize;

static const char * __ecereNameSpace__ecere__com__IntPtr32_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, int data, char * string, void * fieldData, unsigned int * onType)
{
return __ecereNameSpace__ecere__com__Integer_OnGetString(_class, &data, string, fieldData, onType);
}

static const char * __ecereNameSpace__ecere__com__UIntPtr32_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, unsigned int data, char * string, void * fieldData, unsigned int * onType)
{
return __ecereNameSpace__ecere__com__UIntegerHex_OnGetString(_class, &data, string, fieldData, onType);
}

static const char * __ecereNameSpace__ecere__com__IntPtr64_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, long long data, char * string, void * fieldData, unsigned int * onType)
{
return __ecereNameSpace__ecere__com__Int64_OnGetString(_class, &data, string, fieldData, onType);
}

static const char * __ecereNameSpace__ecere__com__UIntPtr64_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, uint64 data, char * string, void * fieldData, unsigned int * onType)
{
return __ecereNameSpace__ecere__com__UInt64Hex_OnGetString(_class, &data, string, fieldData, onType);
}

struct __ecereNameSpace__ecere__sys__NamedLink64;

struct __ecereNameSpace__ecere__sys__NamedLink64
{
struct __ecereNameSpace__ecere__sys__NamedLink64 * prev;
struct __ecereNameSpace__ecere__sys__NamedLink64 * next;
char *  name;
long long data;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__DataMember;

struct __ecereNameSpace__ecere__com__DataMember
{
struct __ecereNameSpace__ecere__com__DataMember * prev;
struct __ecereNameSpace__ecere__com__DataMember * next;
const char *  name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
const char *  dataTypeString;
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

extern void __ecereNameSpace__ecere__com__eClass_FindNextMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class **  curClass, struct __ecereNameSpace__ecere__com__DataMember **  curMember, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, unsigned int size, unsigned int alignment, int declMode);

struct __ecereNameSpace__ecere__com__Method;

struct __ecereNameSpace__ecere__com__ClassTemplateArgument
{
union
{
struct
{
const char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
} ecere_gcc_struct __anon1;
struct __ecereNameSpace__ecere__com__DataValue expression;
struct
{
const char *  memberString;
union
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__Method * method;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct __anon2;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__Method
{
const char *  name;
struct __ecereNameSpace__ecere__com__Method * parent;
struct __ecereNameSpace__ecere__com__Method * left;
struct __ecereNameSpace__ecere__com__Method * right;
int depth;
int (*  function)();
int vid;
int type;
struct __ecereNameSpace__ecere__com__Class * _class;
void *  symbol;
const char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int memberAccess;
} ecere_gcc_struct;

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, void *  function, int declMode);

struct __ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, const char *  name);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, unsigned int *  offset, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, const char *  name, const char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_RegisterDefine(const char *  name, const char *  value, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(const char *  name, const char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

struct __ecereNameSpace__ecere__com__BitMember;

struct __ecereNameSpace__ecere__com__BitMember
{
struct __ecereNameSpace__ecere__com__BitMember * prev;
struct __ecereNameSpace__ecere__com__BitMember * next;
const char *  name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
const char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int type;
int size;
int pos;
uint64 mask;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__NameSpace;

struct __ecereNameSpace__ecere__com__NameSpace
{
const char *  name;
struct __ecereNameSpace__ecere__com__NameSpace *  btParent;
struct __ecereNameSpace__ecere__com__NameSpace *  left;
struct __ecereNameSpace__ecere__com__NameSpace *  right;
int depth;
struct __ecereNameSpace__ecere__com__NameSpace *  parent;
struct __ecereNameSpace__ecere__sys__BinaryTree nameSpaces;
struct __ecereNameSpace__ecere__sys__BinaryTree classes;
struct __ecereNameSpace__ecere__sys__BinaryTree defines;
struct __ecereNameSpace__ecere__sys__BinaryTree functions;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__Class
{
struct __ecereNameSpace__ecere__com__Class * prev;
struct __ecereNameSpace__ecere__com__Class * next;
const char *  name;
int offset;
int structSize;
void * *  _vTbl;
int vTblSize;
unsigned int (*  Constructor)(void * );
void (*  Destructor)(void * );
int offsetClass;
int sizeClass;
struct __ecereNameSpace__ecere__com__Class * base;
struct __ecereNameSpace__ecere__sys__BinaryTree methods;
struct __ecereNameSpace__ecere__sys__BinaryTree members;
struct __ecereNameSpace__ecere__sys__BinaryTree prop;
struct __ecereNameSpace__ecere__sys__OldList membersAndProperties;
struct __ecereNameSpace__ecere__sys__BinaryTree classProperties;
struct __ecereNameSpace__ecere__sys__OldList derivatives;
int memberID;
int startMemberID;
int type;
struct __ecereNameSpace__ecere__com__Instance * module;
struct __ecereNameSpace__ecere__com__NameSpace *  nameSpace;
const char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int typeSize;
int defaultAlignment;
void (*  Initialize)();
int memberOffset;
struct __ecereNameSpace__ecere__sys__OldList selfWatchers;
const char *  designerClass;
unsigned int noExpansion;
const char *  defaultProperty;
unsigned int comRedefinition;
int count;
int isRemote;
unsigned int internalDecl;
void *  data;
unsigned int computeSize;
short structAlignment;
short pointerAlignment;
int destructionWatchOffset;
unsigned int fixed;
struct __ecereNameSpace__ecere__sys__OldList delayedCPValues;
int inheritanceAccess;
const char *  fullName;
void *  symbol;
struct __ecereNameSpace__ecere__sys__OldList conversions;
struct __ecereNameSpace__ecere__sys__OldList templateParams;
struct __ecereNameSpace__ecere__com__ClassTemplateArgument *  templateArgs;
struct __ecereNameSpace__ecere__com__Class * templateClass;
struct __ecereNameSpace__ecere__sys__OldList templatized;
int numParams;
unsigned int isInstanceClass;
unsigned int byValueSystemClass;
void *  bindingsClass;
} ecere_gcc_struct;

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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IOChannel;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SerialBuffer;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ObjectNotationType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__StaticString;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__CIString;

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, const void * data)
{
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , struct __ecereNameSpace__ecere__com__Instance * channel);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, struct __ecereNameSpace__ecere__com__Instance * channel))class->_vTbl[__ecereVMethodID_class_OnSerialize]);
__internal_VirtualMethod ? __internal_VirtualMethod(class, data, this) : (void)1;
}));
}

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * * data)
{
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , struct __ecereNameSpace__ecere__com__Instance * channel);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, struct __ecereNameSpace__ecere__com__Instance * channel))class->_vTbl[__ecereVMethodID_class_OnUnserialize]);
__internal_VirtualMethod ? __internal_VirtualMethod(class, data, this) : (void)1;
}));
}

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Put(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, const void * data)
{
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , struct __ecereNameSpace__ecere__com__Instance * channel);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, struct __ecereNameSpace__ecere__com__Instance * channel))class->_vTbl[__ecereVMethodID_class_OnSerialize]);
__internal_VirtualMethod ? __internal_VirtualMethod(class, data, this) : (void)1;
}));
}

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Get(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * * data)
{
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , struct __ecereNameSpace__ecere__com__Instance * channel);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, struct __ecereNameSpace__ecere__com__Instance * channel))class->_vTbl[__ecereVMethodID_class_OnUnserialize]);
__internal_VirtualMethod ? __internal_VirtualMethod(class, data, this) : (void)1;
}));
}

const char * __ecereNameSpace__ecere__com__Enum_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, void * data, char * tempString, void * fieldData, unsigned int * onType)
{
struct __ecereNameSpace__ecere__sys__NamedLink64 * item = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * b;
long long i64Data = 0;

switch(_class->typeSize)
{
case 1:
i64Data = !strcmp(_class->dataTypeString, "byte") ? (long long)*(unsigned char *)data : (long long)*(char *)data;
break;
case 2:
i64Data = !strcmp(_class->dataTypeString, "uint16") ? (long long)*(unsigned short *)data : (long long)*(short *)data;
break;
case 4:
i64Data = !strcmp(_class->dataTypeString, "uint") ? (long long)*(unsigned int *)data : (long long)*(int *)data;
break;
case 8:
i64Data = !strcmp(_class->dataTypeString, "uint64") ? *(long long *)data : *(long long *)data;
break;
}
for(b = _class; !item && b && b->type == 4; b = b->base)
{
struct __ecereNameSpace__ecere__com__EnumClassData * enumeration = (struct __ecereNameSpace__ecere__com__EnumClassData *)b->data;

for(item = enumeration->values.first; item; item = item->next)
if(item->data == i64Data)
break;
}
if(item)
{
if(tempString)
{
strcpy(tempString, item->name);
if(!onType || *onType != 1)
tempString[0] = (char)toupper(tempString[0]);
return tempString;
}
else
return item->name;
}
else
return (((void *)0));
}

static unsigned int __ecereNameSpace__ecere__com__Enum_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, void * data, const char * string)
{
struct __ecereNameSpace__ecere__sys__NamedLink64 * item = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * b;

for(b = _class; !item && b && b->type == 4; b = b->base)
{
struct __ecereNameSpace__ecere__com__EnumClassData * enumeration = (struct __ecereNameSpace__ecere__com__EnumClassData *)_class->data;

for(item = enumeration->values.first; item; item = item->next)
{
if(item->name && !(strcasecmp)(item->name, string))
break;
}
}
if(item)
{
switch(_class->typeSize)
{
case 1:
if(!strcmp(_class->dataTypeString, "byte"))
*(unsigned char *)data = (unsigned char)item->data;
else
*(char *)data = (char)item->data;
break;
case 2:
if(!strcmp(_class->dataTypeString, "uint16"))
*(unsigned short *)data = (unsigned short)item->data;
else
*(short *)data = (short)item->data;
break;
case 4:
if(!strcmp(_class->dataTypeString, "uint"))
*(unsigned int *)data = (unsigned int)item->data;
else
*(int *)data = (int)item->data;
break;
case 8:
if(!strcmp(_class->dataTypeString, "uint64"))
*(uint64 *)data = *(uint64 *)&item->data;
else
*(long long *)data = item->data;
break;
}
return 1;
}
else
{
switch(_class->typeSize)
{
case 1:
return __ecereNameSpace__ecere__com__Byte_OnGetDataFromString(_class, data, string);
case 2:
return __ecereNameSpace__ecere__com__Int16_OnGetDataFromString(_class, data, string);
case 4:
return __ecereNameSpace__ecere__com__Integer_OnGetDataFromString(_class, data, string);
case 8:
return __ecereNameSpace__ecere__com__Int64_OnGetDataFromString(_class, data, string);
}
}
return 0;
}

static void __ecereNameSpace__ecere__com__OnFree(struct __ecereNameSpace__ecere__com__Class * _class, void * data)
{
if(_class->templateClass)
_class = _class->templateClass;
if(_class->type == 0)
{
__ecereNameSpace__ecere__com__eInstance_DecRef(data);
}
else if(_class->type == 5 && data)
{
while(_class && _class->type == 5)
{
if(_class->Destructor)
_class->Destructor(data);
_class = _class->base;
}
(__ecereNameSpace__ecere__com__eSystem_Delete(data), data = 0);
}
}

static int __ecereNameSpace__ecere__com__DataMember_OnCompare(struct __ecereNameSpace__ecere__com__DataMember * parentMember, void * data1, void * data2)
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Instance * module = parentMember->_class->module;

for(member = parentMember->members.first; member; member = member->next)
{
int memberResult = 0;

if(member->type == 0)
{
struct __ecereNameSpace__ecere__com__Class * memberType = member->dataTypeClass;

if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, member->dataTypeString);
if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "int");
if(memberType->type == 1 || memberType->type == 0 || memberType->type == 5)
{
memberResult = ((int (*)(void *, void *, void *))(void *)memberType->_vTbl[__ecereVMethodID_class_OnCompare])(memberType, (unsigned char *)data1 + member->offset, (unsigned char *)data2 + member->offset);
if(memberResult)
return memberResult;
}
else
{
struct __ecereNameSpace__ecere__com__DataValue value1, value2;

value1.__anon1.i = *(int *)((unsigned char *)data1 + member->offset);
value2.__anon1.i = *(int *)((unsigned char *)data2 + member->offset);
memberResult = ((int (*)(void *, void *, void *))(void *)memberType->_vTbl[__ecereVMethodID_class_OnCompare])(memberType, &value1, &value2);
if(memberResult)
return memberResult;
}
}
else
{
memberResult = __ecereNameSpace__ecere__com__DataMember_OnCompare(member, (unsigned char *)data1 + member->offset, (unsigned char *)data2 + member->offset);
if(memberResult)
return memberResult;
}
}
return 0;
}

static void __ecereNameSpace__ecere__com__OnCopy(struct __ecereNameSpace__ecere__com__Class * _class, void ** data, void * newData)
{
if(_class->type == 3 || _class->type == 2 || _class->type == 4)
{
if(newData)
memcpy(data, newData, _class->typeSize);
else
memset(data, 0, _class->typeSize);
}
else if(_class->type != 1 && (_class->type != 1000 || _class->byValueSystemClass))
{
*data = newData;
}
else if(newData)
memcpy(data, newData, _class->typeSize);
else
memset(data, 0, _class->typeSize);
}

static int __ecereNameSpace__ecere__com__DataMember_OnSerialize(struct __ecereNameSpace__ecere__com__DataMember * parentMember, void * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Instance * module = parentMember->_class->module;

for(member = parentMember->members.first; member; member = member->next)
{
if(member->type == 0)
{
struct __ecereNameSpace__ecere__com__Class * memberType = member->dataTypeClass;

if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, member->dataTypeString);
if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "int");
if(memberType->type == 1 || memberType->type == 0 || memberType->type == 5)
{
((void (*)(void *, void *, void *))(void *)memberType->_vTbl[__ecereVMethodID_class_OnSerialize])(memberType, (unsigned char *)data + member->offset, channel);
}
else
{
struct __ecereNameSpace__ecere__com__DataValue value;

value.__anon1.i = *(int *)((unsigned char *)data + member->offset);
((void (*)(void *, void *, void *))(void *)memberType->_vTbl[__ecereVMethodID_class_OnSerialize])(memberType, &value, channel);
}
}
else
{
__ecereNameSpace__ecere__com__DataMember_OnSerialize(member, (unsigned char *)data + member->offset, channel);
}
}
return 0;
}

static int __ecereNameSpace__ecere__com__DataMember_OnUnserialize(struct __ecereNameSpace__ecere__com__DataMember * parentMember, void * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Instance * module = parentMember->_class->module;

for(member = parentMember->members.first; member; member = member->next)
{
if(member->type == 0)
{
struct __ecereNameSpace__ecere__com__Class * memberType = member->dataTypeClass;

if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, member->dataTypeString);
if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "int");
if(memberType->type == 1 || memberType->type == 0 || memberType->type == 5)
{
((void (*)(void *, void *, void *))(void *)memberType->_vTbl[__ecereVMethodID_class_OnUnserialize])(memberType, (unsigned char *)data + member->offset, channel);
}
else
{
struct __ecereNameSpace__ecere__com__DataValue value;

((void (*)(void *, void *, void *))(void *)memberType->_vTbl[__ecereVMethodID_class_OnUnserialize])(memberType, &value, channel);
*(int *)((unsigned char *)data + member->offset) = value.__anon1.i;
}
}
else
{
__ecereNameSpace__ecere__com__DataMember_OnUnserialize(member, (unsigned char *)data + member->offset, channel);
}
}
return 0;
}

int __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnCompare(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__StaticString * this, struct __ecereNameSpace__ecere__com__StaticString * string2)
{
int result = 0;

if(this && string2)
result = (strcasecmp)(this->string, string2->string);
else if(!this && string2)
result = -1;
else if(this && !string2)
result = 1;
return result;
}

const char * __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__StaticString * this, char * tempString, void * fieldData, unsigned int * onType)
{
return this ? this->string : (((void *)0));
}

void __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnFree(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__StaticString * this)
{
}

int __ecereMethod___ecereNameSpace__ecere__com__CIString_OnCompare(struct __ecereNameSpace__ecere__com__Class * class, char * this, const char ** string2)
{
if(this && string2)
return (strcasecmp)(this, (const char *)string2);
if(!this && string2)
return 1;
if(this && !string2)
return -1;
return 0;
}

int __ecereNameSpace__ecere__com__PrintStdArgsToBuffer(char * buffer, int maxLen, struct __ecereNameSpace__ecere__com__Class * class, const void * object, va_list args)
{
int len = 0;
const char * result = (__extension__ ({
const char *  (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , char *  tempString, void *  reserved, unsigned int *  onType);

__internal_VirtualMethod = ((const char *  (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, char *  tempString, void *  reserved, unsigned int *  onType))class->_vTbl[__ecereVMethodID_class_OnGetString]);
__internal_VirtualMethod ? __internal_VirtualMethod(class, object, buffer, (((void *)0)), (((void *)0))) : (const char * )1;
}));

if(result)
{
len = strlen(result);
if(len >= maxLen)
len = maxLen - 1;
if(result != buffer)
memcpy(buffer, result, len);
}
while(1)
{
struct __ecereNameSpace__ecere__com__Class * _class = (((void *)0));
void * data = (((void *)0));

_class = __builtin_va_arg(args, void *);
if(!_class)
break;
data = __builtin_va_arg(args, void *);
if(data)
{
result = ((const char * (*)(void *, void *, char *, void *, unsigned int *))(void *)_class->_vTbl[__ecereVMethodID_class_OnGetString])(_class, data, buffer + len, (((void *)0)), (((void *)0)));
if(result)
{
int newLen = strlen(result);

if(len + newLen >= maxLen)
newLen = maxLen - 1 - len;
if(result != buffer + len)
memcpy(buffer + len, result, newLen);
len += newLen;
}
}
}
buffer[len] = 0;
return len;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_int;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_double;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_float;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_int64;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Container;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_uint;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Module;

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

void __ecereNameSpace__ecere__com__Byte_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, unsigned char * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, data, 1) : (size_t)1;
}));
}

void __ecereNameSpace__ecere__com__Byte_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, unsigned char * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
if((__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, data, 1) : (size_t)1;
})) != 1)
*data = 0;
}

void __ecereNameSpace__ecere__com__Int_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, int * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[4];

(bytes)[0] = (unsigned char)(((*data) >> 24) & 0xFF);
(bytes)[1] = (unsigned char)(((*data) >> 16) & 0xFF);
(bytes)[2] = (unsigned char)(((*data) >> 8) & 0xFF);
(bytes)[3] = (unsigned char)((*data) & 0xFF);
;
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, bytes, 4) : (size_t)1;
}));
}

void __ecereNameSpace__ecere__com__IntPtr32_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, int data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[4];

(bytes)[0] = (unsigned char)(((data) >> 24) & 0xFF);
(bytes)[1] = (unsigned char)(((data) >> 16) & 0xFF);
(bytes)[2] = (unsigned char)(((data) >> 8) & 0xFF);
(bytes)[3] = (unsigned char)((data) & 0xFF);
;
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, bytes, 4) : (size_t)1;
}));
}

void __ecereNameSpace__ecere__com__Int_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, int * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[4];

if((__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, bytes, 4) : (size_t)1;
})) == 4)
*data = (unsigned int)(((bytes)[0] << 24) | ((bytes)[1] << 16) | ((bytes)[2] << 8) | (bytes)[3]);
else
*data = 0;
}

void __ecereNameSpace__ecere__com__Int64_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, long long * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[8];

(bytes)[0] = (unsigned char)(((*data) >> 56) & 0xFF);
(bytes)[1] = (unsigned char)(((*data) >> 48) & 0xFF);
(bytes)[2] = (unsigned char)(((*data) >> 40) & 0xFF);
(bytes)[3] = (unsigned char)(((*data) >> 32) & 0xFF);
(bytes)[4] = (unsigned char)(((*data) >> 24) & 0xFF);
(bytes)[5] = (unsigned char)(((*data) >> 16) & 0xFF);
(bytes)[6] = (unsigned char)(((*data) >> 8) & 0xFF);
(bytes)[7] = (unsigned char)((*data) & 0xFF);
;
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, bytes, 8) : (size_t)1;
}));
}

static void __ecereNameSpace__ecere__com__IntPtr64_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, long long data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[8];

(bytes)[0] = (unsigned char)(((data) >> 56) & 0xFF);
(bytes)[1] = (unsigned char)(((data) >> 48) & 0xFF);
(bytes)[2] = (unsigned char)(((data) >> 40) & 0xFF);
(bytes)[3] = (unsigned char)(((data) >> 32) & 0xFF);
(bytes)[4] = (unsigned char)(((data) >> 24) & 0xFF);
(bytes)[5] = (unsigned char)(((data) >> 16) & 0xFF);
(bytes)[6] = (unsigned char)(((data) >> 8) & 0xFF);
(bytes)[7] = (unsigned char)((data) & 0xFF);
;
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, bytes, 8) : (size_t)1;
}));
}

void __ecereNameSpace__ecere__com__Int64_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, long long * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[8];

if((__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, bytes, 8) : (size_t)1;
})) == 8)
*data = (((uint64)(bytes)[0] << 56) | ((uint64)(bytes)[1] << 48) | ((uint64)(bytes)[2] << 40) | ((uint64)(bytes)[3] << 32) | ((uint64)(bytes)[4] << 24) | ((bytes)[5] << 16) | ((bytes)[6] << 8) | (bytes)[7]);
else
*data = 0;
}

void __ecereNameSpace__ecere__com__Word_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, unsigned short * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[2];

(bytes)[0] = (unsigned char)(((*data) >> 8) & 0xFF);
(bytes)[1] = (unsigned char)(((*data)) & 0xFF);
;
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, bytes, 2) : (size_t)1;
}));
}

void __ecereNameSpace__ecere__com__Word_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, unsigned short * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[2];

if((__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, bytes, 2) : (size_t)1;
})) == 2)
*data = (unsigned short)(((bytes)[0] << 8) | (bytes)[1]);
else
*data = 0;
}

static void __ecereNameSpace__ecere__com__Float_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, float * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[4];

(bytes)[0] = (unsigned char)(((*(unsigned int *)data) >> 24) & 0xFF);
(bytes)[1] = (unsigned char)(((*(unsigned int *)data) >> 16) & 0xFF);
(bytes)[2] = (unsigned char)(((*(unsigned int *)data) >> 8) & 0xFF);
(bytes)[3] = (unsigned char)((*(unsigned int *)data) & 0xFF);
;
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, bytes, 4) : (size_t)1;
}));
}

static void __ecereNameSpace__ecere__com__Float_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, float * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[4];

if((__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, bytes, 4) : (size_t)1;
})) == 4)
*(unsigned int *)data = (unsigned int)(((bytes)[0] << 24) | ((bytes)[1] << 16) | ((bytes)[2] << 8) | (bytes)[3]);
else
*data = 0;
}

static void __ecereNameSpace__ecere__com__Double_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, double * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[8];

(bytes)[0] = (unsigned char)(((*(uint64 *)data) >> 56) & 0xFF);
(bytes)[1] = (unsigned char)(((*(uint64 *)data) >> 48) & 0xFF);
(bytes)[2] = (unsigned char)(((*(uint64 *)data) >> 40) & 0xFF);
(bytes)[3] = (unsigned char)(((*(uint64 *)data) >> 32) & 0xFF);
(bytes)[4] = (unsigned char)(((*(uint64 *)data) >> 24) & 0xFF);
(bytes)[5] = (unsigned char)(((*(uint64 *)data) >> 16) & 0xFF);
(bytes)[6] = (unsigned char)(((*(uint64 *)data) >> 8) & 0xFF);
(bytes)[7] = (unsigned char)((*(uint64 *)data) & 0xFF);
;
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, bytes, 8) : (size_t)1;
}));
}

static void __ecereNameSpace__ecere__com__Double_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, double * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[8];

if((__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, bytes, 8) : (size_t)1;
})) == 8)
*(uint64 *)data = (((uint64)(bytes)[0] << 56) | ((uint64)(bytes)[1] << 48) | ((uint64)(bytes)[2] << 40) | ((uint64)(bytes)[3] << 32) | ((uint64)(bytes)[4] << 24) | ((bytes)[5] << 16) | ((bytes)[6] << 8) | (bytes)[7]);
else
*data = 0;
}

void __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnSerialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__StaticString * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned int len = this ? strlen(this->string) : 0;

(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, this ? this->string : "", len + 1) : (size_t)1;
}));
}

void __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__StaticString * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
if(this)
{
int c;

for(c = 0; (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, &(*this).string[c], 1) : (size_t)1;
})) && (*this).string[c]; c++)
;
(*this).string[c++] = '\0';
}
}

static void __ecereNameSpace__ecere__com__String_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, char * string, struct __ecereNameSpace__ecere__com__Instance * channel)
{
int len = string ? strlen(string) : 0;

(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, string ? string : "", len + 1) : (size_t)1;
}));
}

static void __ecereNameSpace__ecere__com__String_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, char ** string, struct __ecereNameSpace__ecere__com__Instance * channel)
{
if(string)
{
int c;
unsigned int size = 64;

*string = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (size));
for(c = 0; (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = channel;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__IOChannel->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData]);
__internal_VirtualMethod ? __internal_VirtualMethod(channel, &(*string)[c], 1) : (size_t)1;
})) && (*string)[c]; c++)
{
if(c == size - 1)
{
size += size / 2;
*string = __ecereNameSpace__ecere__com__eSystem_Renew(*string, sizeof(char) * (size));
}
}
(*string)[c++] = '\0';
if(!__ecereNameSpace__ecere__sys__UTF8Validate(*string))
{
char * newString = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (c * 2));

__ecereNameSpace__ecere__sys__ISO8859_1toUTF8(*string, newString, c * 2);
(__ecereNameSpace__ecere__com__eSystem_Delete(*string), *string = 0);
*string = __ecereNameSpace__ecere__com__eSystem_Renew(newString, sizeof(char) * (strlen(newString) + 1));
}
else
*string = __ecereNameSpace__ecere__com__eSystem_Renew(*string, sizeof(char) * (c));
}
}

size_t __ecereMethod___ecereNameSpace__ecere__com__SerialBuffer_WriteData(struct __ecereNameSpace__ecere__com__Instance * this, const void * bytes, size_t numBytes)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__SerialBuffer * __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer = (struct __ecereNameSpace__ecere__com__SerialBuffer *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__SerialBuffer->offset) : 0);

if(this != (((void *)0)))
{
if(__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->count + numBytes > __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_size)
{
__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_size = __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->count + numBytes;
__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_size += __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_size / 2;
__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_buffer = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_buffer, sizeof(unsigned char) * (__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_size));
}
memcpy(__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_buffer + __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->count, bytes, numBytes);
__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->count += numBytes;
return numBytes;
}
return 0;
}

size_t __ecereMethod___ecereNameSpace__ecere__com__SerialBuffer_ReadData(struct __ecereNameSpace__ecere__com__Instance * this, void * bytes, size_t numBytes)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__SerialBuffer * __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer = (struct __ecereNameSpace__ecere__com__SerialBuffer *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__SerialBuffer->offset) : 0);

if(this != (((void *)0)))
{
size_t __simpleStruct0;
int read = (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->count - __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->pos, (numBytes < __simpleStruct0) ? numBytes : __simpleStruct0);

memcpy(bytes, __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_buffer + __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->pos, read);
__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->pos += read;
return read;
}
return 0;
}

void __ecereMethod___ecereNameSpace__ecere__com__SerialBuffer_Free(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__SerialBuffer * __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer = (struct __ecereNameSpace__ecere__com__SerialBuffer *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__SerialBuffer->offset) : 0);

if(this)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_buffer), __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_buffer = 0);
__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->count = 0;
__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_size = 0;
__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->pos = 0;
}
}

unsigned char *  __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Get_buffer(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__SerialBuffer * __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer = (struct __ecereNameSpace__ecere__com__SerialBuffer *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__SerialBuffer->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_buffer + __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->pos;
}

void __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Set_buffer(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char *  value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__SerialBuffer * __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer = (struct __ecereNameSpace__ecere__com__SerialBuffer *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__SerialBuffer->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_buffer = value;
__ecereProp___ecereNameSpace__ecere__com__SerialBuffer_buffer && __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_buffer->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_buffer) : (void)0, __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_buffer && __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_buffer->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_buffer) : (void)0;
}

unsigned int __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Get_size(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__SerialBuffer * __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer = (struct __ecereNameSpace__ecere__com__SerialBuffer *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__SerialBuffer->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->count - __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->pos;
}

void __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Set_size(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__SerialBuffer * __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer = (struct __ecereNameSpace__ecere__com__SerialBuffer *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__SerialBuffer->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->count = value;
__ecereProp___ecereNameSpace__ecere__com__SerialBuffer_size && __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_size->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_size) : (void)0, __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_size && __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_size->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_size) : (void)0;
}

static int __ecereNameSpace__ecere__com__OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, void * data1, void * data2)
{
struct __ecereNameSpace__ecere__com__Instance * module = _class->module;

if(_class->type == 0 || _class->type == 5 || _class->type == 1)
{
if(data1 && data2)
{
for(; _class && _class->type != 1000; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__DataMember * member;

if(_class->noExpansion)
{
if(data1 > data2)
return 1;
else if(data1 < data2)
return -1;
else
return 0;
}
for(member = _class->membersAndProperties.first; member; member = member->next)
{
int memberResult = 0;

if(member->id < 0)
continue;
if(member->isProperty || member->type == 0)
{
struct __ecereNameSpace__ecere__com__Class * memberType = member->dataTypeClass;

if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, member->dataTypeString);
if(memberType)
{
if(member->isProperty)
{
struct __ecereNameSpace__ecere__com__Property * prop = (struct __ecereNameSpace__ecere__com__Property *)member;

if(!prop->conversion && prop->Get && prop->Set)
{
if(memberType->type == 1 || memberType->type == 0 || memberType->type == 5)
{
if(!strcmp(memberType->dataTypeString, "char *"))
{
char * a = ((char * (*)(void *))(void *)prop->Get)(data1);
char * b = ((char * (*)(void *))(void *)prop->Get)(data2);

memberResult = ((int (*)(void *, void *, void *))(void *)memberType->_vTbl[__ecereVMethodID_class_OnCompare])(memberType, a, b);
}
}
else
{
struct __ecereNameSpace__ecere__com__DataValue value1, value2;

if(!strcmp(memberType->dataTypeString, "float"))
{
value1.__anon1.f = ((float (*)(void *))(void *)prop->Get)(data1);
value2.__anon1.f = ((float (*)(void *))(void *)prop->Get)(data2);
}
else
{
value1.__anon1.i = ((int (*)(void *))(void *)prop->Get)(data1);
value2.__anon1.i = ((int (*)(void *))(void *)prop->Get)(data2);
}
memberResult = ((int (*)(void *, void *, void *))(void *)memberType->_vTbl[__ecereVMethodID_class_OnCompare])(memberType, &value1, &value2);
}
}
}
else
{
if(memberType->type == 1 || memberType->type == 0 || memberType->type == 5)
{
if(memberType->type == 0 || memberType->type == 5)
{
memberResult = ((int (*)(void *, void *, void *))(void *)memberType->_vTbl[__ecereVMethodID_class_OnCompare])(memberType, *(void **)((unsigned char *)data1 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset)), *(void **)((unsigned char *)data2 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset)));
}
else
{
memberResult = ((int (*)(void *, void *, void *))(void *)memberType->_vTbl[__ecereVMethodID_class_OnCompare])(memberType, (unsigned char *)data1 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset), (unsigned char *)data2 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset));
}
}
else
{
struct __ecereNameSpace__ecere__com__DataValue value1, value2;

if(memberType->typeSize == 8)
{
value1.__anon1.ui64 = *(uint64 *)((unsigned char *)data1 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset));
value2.__anon1.ui64 = *(uint64 *)((unsigned char *)data2 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset));
}
else
{
value1.__anon1.i = *(int *)((unsigned char *)data1 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset));
value2.__anon1.i = *(int *)((unsigned char *)data2 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset));
}
memberResult = ((int (*)(void *, void *, void *))(void *)memberType->_vTbl[__ecereVMethodID_class_OnCompare])(memberType, &value1, &value2);
}
}
}
else
{
}
}
else
{
memberResult = __ecereNameSpace__ecere__com__DataMember_OnCompare(member, (unsigned char *)data1 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset), (unsigned char *)data2 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset));
}
if(memberResult)
return memberResult;
}
}
}
else if(!data1 && data2)
return 1;
else if(data1 && !data2)
return -1;
}
else if(_class->type == 3)
{
struct __ecereNameSpace__ecere__com__Class * dataType = __ecereNameSpace__ecere__com__eSystem_FindClass(module, _class->dataTypeString);

return ((int (*)(void *, void *, void *))(void *)dataType->_vTbl[__ecereVMethodID_class_OnCompare])(dataType, data1, data2);
}
else
{
int result = 0;

if(data1 && data2)
{
if(_class->typeSize == 8)
{
if(*(uint64 *)data1 > *(uint64 *)data2)
result = 1;
else if(*(uint64 *)data1 < *(uint64 *)data2)
result = -1;
}
else
{
if(*(unsigned int *)data1 > *(unsigned int *)data2)
result = 1;
else if(*(unsigned int *)data1 < *(unsigned int *)data2)
result = -1;
}
}
else if(!data1 && data2)
return 1;
else if(data1 && !data2)
return -1;
return result;
}
return 0;
}

static void __ecereNameSpace__ecere__com__OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, void * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
struct __ecereNameSpace__ecere__com__Instance * module = _class->module;

if(_class->type == 3 || _class->type == 2 || _class->type == 4)
{
struct __ecereNameSpace__ecere__com__Class * dataType = __ecereNameSpace__ecere__com__eSystem_FindClass(module, _class->dataTypeString);

if(dataType)
((void (*)(void *, void *, void *))(void *)dataType->_vTbl[__ecereVMethodID_class_OnSerialize])(dataType, data, channel);
}
else if(_class->type == 0 || _class->type == 5 || _class->type == 1)
{
{
struct __ecereNameSpace__ecere__com__Class * lastClass = (((void *)0));

while(lastClass != _class)
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Class * c;

for(c = _class; c && (!c->base || c->base->type != 1000) && c->base != lastClass; c = c->base)
;
lastClass = c;
for(member = c->membersAndProperties.first; member; member = member->next)
{
if(member->id < 0)
continue;
if(member->isProperty || member->type == 0)
{
struct __ecereNameSpace__ecere__com__Class * memberType = member->dataTypeClass;

if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, member->dataTypeString);
if(memberType)
{
if(member->isProperty)
{
}
else
{
if(!strcmp(memberType->name, "String") || memberType->type == 0 || memberType->type == 5)
{
((void (*)(void *, void *, void *))(void *)memberType->_vTbl[__ecereVMethodID_class_OnSerialize])(memberType, data ? (*(void **)((unsigned char *)data + member->_class->offset + member->offset)) : (((void *)0)), channel);
}
else
((void (*)(void *, void *, void *))(void *)memberType->_vTbl[__ecereVMethodID_class_OnSerialize])(memberType, data ? (((unsigned char *)data + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset))) : (((void *)0)), channel);
}
}
else
{
}
}
else
{
__ecereNameSpace__ecere__com__DataMember_OnSerialize(member, data ? ((unsigned char *)data + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset)) : (((void *)0)), channel);
}
}
}
}
}
}

int __ecereNameSpace__ecere__com__PrintBuf(char * buffer, int maxLen, struct __ecereNameSpace__ecere__com__Class * class, const void * object, ...)
{
va_list args;
int len;

__builtin_va_start(args, object);
len = __ecereNameSpace__ecere__com__PrintStdArgsToBuffer(buffer, maxLen, class, object, args);
__builtin_va_end(args);
return len;
}

int __ecereNameSpace__ecere__com__PrintLnBuf(char * buffer, int maxLen, struct __ecereNameSpace__ecere__com__Class * class, const void * object, ...)
{
va_list args;
int len;

__builtin_va_start(args, object);
len = __ecereNameSpace__ecere__com__PrintStdArgsToBuffer(buffer, maxLen - 1, class, object, args);
buffer[len++] = '\n';
buffer[len] = '\0';
__builtin_va_end(args);
return len;
}

char * __ecereNameSpace__ecere__com__PrintString(struct __ecereNameSpace__ecere__com__Class * class, const void * object, ...)
{
char buffer[4096];
va_list args;
char * string;
int len;

__builtin_va_start(args, object);
len = __ecereNameSpace__ecere__com__PrintStdArgsToBuffer(buffer, sizeof (buffer), class, object, args);
string = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (len + 1));
memcpy(string, buffer, len + 1);
__builtin_va_end(args);
return string;
}

char * __ecereNameSpace__ecere__com__PrintLnString(struct __ecereNameSpace__ecere__com__Class * class, const void * object, ...)
{
char buffer[4096];
va_list args;
char * string;
int len;

__builtin_va_start(args, object);
len = __ecereNameSpace__ecere__com__PrintStdArgsToBuffer(buffer, sizeof (buffer), class, object, args);
string = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (len + 2));
memcpy(string, buffer, len);
string[len++] = '\n';
string[len] = '\0';
__builtin_va_end(args);
return string;
}

void __ecereNameSpace__ecere__com__PrintLn(struct __ecereNameSpace__ecere__com__Class * class, const void * object, ...)
{
va_list args;
char buffer[4096];

__builtin_va_start(args, object);
__ecereNameSpace__ecere__com__PrintStdArgsToBuffer(buffer, sizeof (buffer), class, object, args);
__builtin_va_end(args);
puts(buffer);
}

void __ecereNameSpace__ecere__com__Print(struct __ecereNameSpace__ecere__com__Class * class, const void * object, ...)
{
va_list args;
char buffer[4096];

__builtin_va_start(args, object);
__ecereNameSpace__ecere__com__PrintStdArgsToBuffer(buffer, sizeof (buffer), class, object, args);
__builtin_va_end(args);
fputs(buffer, eC_stdout());
}

__attribute__((unused)) static void __ecereNameSpace__ecere__com__UnusedFunction()
{
int __internalValue001;
int __internalValue000;
int a = 0;

(__extension__ ({
const char *  (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , char *  tempString, void *  reserved, unsigned int *  onType);

__internal_VirtualMethod = ((const char *  (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, char *  tempString, void *  reserved, unsigned int *  onType))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnGetString]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecereClass_int, (void *)&a, 0, 0, 0) : (const char * )1;
}));
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * );

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Class *, const void *))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnFree]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecereClass_int, (void *)&a) : (void)1;
}));
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , const void * newData);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, const void * newData))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnCopy]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecereClass_int, (void *)&a, __extension__ ({
__internalValue000 = 0;
&__internalValue000;
})) : (void)1;
}));
(__extension__ ({
int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , const void * object);

__internal_VirtualMethod = ((int (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, const void * object))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnCompare]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecereClass_int, (void *)&a, __extension__ ({
__internalValue001 = 0;
&__internalValue001;
})) : (int)1;
}));
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , struct __ecereNameSpace__ecere__com__Instance * window, void *  object);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, struct __ecereNameSpace__ecere__com__Instance * window, void *  object))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnSaveEdit]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecereClass_int, (void *)&a, (((void *)0)), 0) : (unsigned int)1;
}));
(__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , struct __ecereNameSpace__ecere__com__Instance * dataBox, struct __ecereNameSpace__ecere__com__Instance * obsolete, int x, int y, int w, int h, void *  userData);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__Instance * (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, struct __ecereNameSpace__ecere__com__Instance * dataBox, struct __ecereNameSpace__ecere__com__Instance * obsolete, int x, int y, int w, int h, void *  userData))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnEdit]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecereClass_int, (void *)&a, (((void *)0)), (((void *)0)), 0, 0, 0, 20, 0) : (struct __ecereNameSpace__ecere__com__Instance *)1;
}));
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , const char *  string);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, const char *  string))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnGetDataFromString]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecereClass_int, (void *)&a, (((void *)0))) : (unsigned int)1;
}));
}

static const char * __ecereNameSpace__ecere__com__OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, void * data, char * tempString, void * fieldData, unsigned int * _onType)
{
unsigned int onType = _onType ? *_onType : 0;
struct __ecereNameSpace__ecere__com__Instance * module = _class->templateClass ? _class->templateClass->module : _class->module;

if(_class->type == 0 && _class->base && !_class->base->base)
{
if(sizeof(size_t) == 8)
return __ecereNameSpace__ecere__com__UInt64Hex_OnGetString(_class, (void *)&data, tempString, fieldData, _onType);
else
return __ecereNameSpace__ecere__com__UIntegerHex_OnGetString(_class, (void *)&data, tempString, fieldData, _onType);
}
else if(_class->type == 4)
{
return __ecereNameSpace__ecere__com__Enum_OnGetString(_class, data, tempString, fieldData, _onType);
}
else if(_class->type == 3 || _class->type == 1000)
{
struct __ecereNameSpace__ecere__com__Class * dataType;
struct __ecereNameSpace__ecere__com__Property * prop;

for(prop = _class->conversions.first; prop; prop = prop->next)
{
unsigned int refProp = 0;
struct __ecereNameSpace__ecere__com__Class * c;

if(!strcmp(prop->name, _class->base->fullName))
refProp = 1;
else if((c = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, prop->name)))
{
struct __ecereNameSpace__ecere__com__Property * p;

for(p = c->conversions.first; p; p = p->next)
{
if(!strcmp(p->name, _class->base->fullName) && !p->Set && !p->Get)
{
refProp = 1;
break;
}
}
}
if(refProp)
{
if(prop->Set && prop->Get)
{
const char * dts = _class->base->dataTypeString;

if(!strcmp(dts, "double"))
{
double d = ((double (*)(double))(void *)prop->Set)(*(double *)data);

return ((const char * (*)(void *, void *, char *, void *, unsigned int *))(void *)__ecereClass_double->_vTbl[__ecereVMethodID_class_OnGetString])(__ecereClass_double, &d, tempString, fieldData, _onType);
}
else if(!strcmp(dts, "float"))
{
float d = ((float (*)(float))(void *)prop->Set)(*(float *)data);

return ((const char * (*)(void *, void *, char *, void *, unsigned int *))(void *)__ecereClass_float->_vTbl[__ecereVMethodID_class_OnGetString])(__ecereClass_float, &d, tempString, fieldData, _onType);
}
else if(!strcmp(dts, "int"))
{
int d = ((int (*)(int))(void *)prop->Set)(*(int *)data);

return ((const char * (*)(void *, void *, char *, void *, unsigned int *))(void *)__ecereClass_int->_vTbl[__ecereVMethodID_class_OnGetString])(__ecereClass_int, &d, tempString, fieldData, _onType);
}
else if(!strcmp(dts, "int64"))
{
long long d = ((long long (*)(long long))(void *)prop->Set)(*(long long *)data);

return ((const char * (*)(void *, void *, char *, void *, unsigned int *))(void *)__ecereClass_int64->_vTbl[__ecereVMethodID_class_OnGetString])(__ecereClass_int64, &d, tempString, fieldData, _onType);
}
}
else
break;
}
}
dataType = __ecereNameSpace__ecere__com__eSystem_FindClass(module, _class->dataTypeString);
return ((const char * (*)(void *, void *, char *, void *, unsigned int *))(void *)dataType->_vTbl[__ecereVMethodID_class_OnGetString])(dataType, data, tempString, fieldData, _onType);
}
else
{
unsigned int atMember = 1;
unsigned int prev = 0;
struct __ecereNameSpace__ecere__com__Class * mainClass = _class;

_class = (((void *)0));
tempString[0] = '\0';
if(!data && (mainClass->type == 0 || mainClass->type == 5))
return tempString;
while(_class != mainClass)
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Class * lastClass = _class;

for(_class = mainClass; _class->base != lastClass && _class->base->type != 1000; _class = _class->base)
;
for(member = _class->membersAndProperties.first; member; member = member->next)
{
struct __ecereNameSpace__ecere__com__DataMember * m = member;
char memberString[1024];
struct __ecereNameSpace__ecere__com__Class * memberType;
const char * name;
const char * (* onGetString)(void *, void *, char *, void *, unsigned int *);

if(m->id < 0)
continue;
if(m->type == 1 && m->members.first)
m = m->members.first;
name = m->name;
memberType = m->dataTypeClass;
memberString[0] = 0;
if(!memberType)
memberType = m->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, m->dataTypeString);
if(!memberType)
memberType = m->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "int");
onGetString = memberType->_vTbl[__ecereVMethodID_class_OnGetString];
if(m->isProperty)
{
struct __ecereNameSpace__ecere__com__Property * prop = (struct __ecereNameSpace__ecere__com__Property *)m;

if(!prop->conversion && prop->Get && prop->Set && (!prop->IsSet || prop->IsSet(data)))
{
if(memberType->type != 1 && (memberType->type != 0 || !strcmp(memberType->dataTypeString, "char *")) && memberType->type != 2 && data)
{
struct __ecereNameSpace__ecere__com__DataValue value =
{

.__anon1 = {
.c = 0
}
};

if(!strcmp(prop->dataTypeString, "float"))
{
value.__anon1.f = ((float (*)(void *))(void *)prop->Get)(data);
if(value.__anon1.f)
{
unsigned int _onType = onType;
const char * result = onGetString(memberType, &value, memberString, (((void *)0)), &_onType);

if(result && result != memberString)
strcpy(memberString, result);
if(strchr(memberString, '.'))
strcat(memberString, "f");
}
}
else if(memberType->type == 0 || memberType->type == 5)
{
value.__anon1.p = ((void * (*)(void *))(void *)prop->Get)(data);
if(value.__anon1.p || prop->IsSet)
{
unsigned int onType = 1;
const char * result = onGetString(memberType, (memberType->type == 0) ? value.__anon1.p : &value, memberString, (((void *)0)), &onType);

if(result && result != memberString)
strcpy(memberString, result);
}
}
else
{
value.__anon1.i = ((int (*)(void *))(void *)prop->Get)(data);
if(value.__anon1.i || prop->IsSet)
{
unsigned int onType = 1;
const char * result = onGetString(memberType, &value, memberString, (((void *)0)), &onType);

if(result && result != memberString)
strcpy(memberString, result);
}
}
}
}
}
else
{
unsigned int offset;
unsigned char * memberData;
struct __ecereNameSpace__ecere__com__Property * p = __ecereNameSpace__ecere__com__eClass_FindProperty(m->_class, m->name, m->_class->module);

if(p && p->IsSet && !p->Get && !p->Set)
{
unsigned int isSet = 1;

if(_class->type == 0 || _class->type == 5 || _class->type == 1)
isSet = p->IsSet(data);
else
{
switch(_class->typeSize)
{
case 8:
isSet = ((unsigned int (*)(uint64))(void *)p->IsSet)(*(uint64 *)data);
break;
case 4:
isSet = ((unsigned int (*)(unsigned int))(void *)p->IsSet)(*(unsigned int *)data);
break;
case 2:
isSet = ((unsigned int (*)(unsigned short))(void *)p->IsSet)(*(unsigned short *)data);
break;
case 1:
isSet = ((unsigned int (*)(unsigned char))(void *)p->IsSet)(*(unsigned char *)data);
break;
default:
isSet = 1;
}
}
if(!isSet)
{
atMember = 0;
continue;
}
}
__ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(m->_class, m->name, &offset, m->_class->module, (((void *)0)), (((void *)0)));
if(m->_class->type == 0 || m->_class->type == 5)
offset += m->_class->base->structSize;
memberData = (unsigned char *)data + offset;
if(m->type == 0)
{
if(memberType->type == 1 || memberType->type == 0)
{
char internalMemberString[1024];
int c;
unsigned int typeSize = (memberType->type == 0) ? memberType->typeSize : memberType->structSize;

for(c = 0; c < typeSize; c++)
if(memberData[c])
break;
if(c < typeSize)
{
unsigned int onType = 1;
const char * result;

if(memberType->type == 0)
result = onGetString(memberType, *(struct __ecereNameSpace__ecere__com__Instance **)memberData, internalMemberString, (((void *)0)), &onType);
else
result = onGetString(memberType, memberData, internalMemberString, (((void *)0)), &onType);
if(onType && strcmp(memberType->dataTypeString, "char *"))
{
strcat(memberString, "{ ");
if(result)
strcat(memberString, result);
strcat(memberString, " }");
}
else if(result)
strcpy(memberString, result);
}
}
else
{
struct __ecereNameSpace__ecere__com__DataValue value =
{

.__anon1 = {
.c = 0
}
};

if(_class->type == 2)
{
struct __ecereNameSpace__ecere__com__BitMember * bitMember = (struct __ecereNameSpace__ecere__com__BitMember *)m;

switch(_class->typeSize)
{
case 8:
value.__anon1.ui64 = *(uint64 *)data;
break;
case 4:
value.__anon1.ui64 = *(unsigned int *)data;
break;
case 2:
value.__anon1.ui64 = *(unsigned short *)data;
break;
case 1:
value.__anon1.ui64 = *(unsigned char *)data;
break;
default:
value.__anon1.ui64 = 0;
}
value.__anon1.ui64 = (value.__anon1.ui64 & bitMember->mask) >> bitMember->pos;
if(value.__anon1.ui64 && (memberType != _class))
{
unsigned int _onType = onType;
char internalMemberString[1024];
const char * result = onGetString(memberType, &value, internalMemberString, (((void *)0)), &_onType);

if(onType && memberType->type != 1000 && memberType->type != 4 && memberType->type != 3)
{
strcat(memberString, " { ");
if(onType == 2)
strcat(memberString, "\"");
if(result)
strcat(memberString, result);
if(onType == 2)
strcat(memberString, "\"");
strcat(memberString, " }");
}
else if(result)
strcpy(memberString, result);
}
}
else if(!memberType->noExpansion)
{
if(memberType->typeSize > 4 || *(int *)memberData)
{
unsigned int onType = 1;
const char * result = onGetString(memberType, memberData, memberString, (((void *)0)), &onType);

if(result && memberString != result)
strcpy(memberString, result);
}
}
}
}
}
if(memberString[0])
{
if(prev)
strcat(tempString, ", ");
if(!atMember || onType == 2 || !strcmp(memberType->name, "bool"))
{
if(onType == 2)
strcat(tempString, "\"");
strcat(tempString, name);
if(onType == 2)
strcat(tempString, "\"");
strcat(tempString, onType == 2 ? " : " : " = ");
}
if(onType == 2 || (onType && !strcmp(memberType->name, "char *")))
{
int len = strlen(tempString);
int c;

strcat(tempString, "\"");
len++;
for(c = 0; memberString[c]; c++)
{
if(memberString[c] == '\"')
{
strcat(tempString, "\\\"");
len += 2;
}
else if(memberString[c] == '\\')
{
strcat(tempString, "\\\\");
len += 2;
}
else
{
tempString[len++] = memberString[c];
tempString[len] = 0;
}
}
strcat(tempString, "\"");
}
else
strcat(tempString, memberString);
atMember = 1;
prev = 1;
}
else if(m && (!m->isProperty || !((struct __ecereNameSpace__ecere__com__Property *)m)->conversion))
atMember = 0;
}
}
}
return tempString;
}

static unsigned int __ecereNameSpace__ecere__com__OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, void ** data, const char * string)
{
unsigned int result;
struct __ecereNameSpace__ecere__com__Instance * module = _class->module;

if(_class->type == 4)
result = __ecereNameSpace__ecere__com__Enum_OnGetDataFromString(_class, (long long *)data, string);
else if(_class->type == 3)
{
struct __ecereNameSpace__ecere__com__Class * dataType;
struct __ecereNameSpace__ecere__com__Property * prop;

for(prop = _class->conversions.first; prop; prop = prop->next)
{
unsigned int refProp = 0;
struct __ecereNameSpace__ecere__com__Class * c;

if(!strcmp(prop->name, _class->base->fullName))
refProp = 1;
else if((c = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, prop->name)))
{
struct __ecereNameSpace__ecere__com__Property * p;

for(p = c->conversions.first; p; p = p->next)
{
if(!strcmp(p->name, _class->base->fullName) && !p->Set && !p->Get)
{
refProp = 1;
break;
}
}
}
if(refProp)
{
if(prop->Set && prop->Get)
{
const char * dts = _class->base->dataTypeString;

if(!strcmp(dts, "double"))
{
double d;
unsigned int result = ((unsigned int (*)(void *, void *, const char *))(void *)__ecereClass_double->_vTbl[__ecereVMethodID_class_OnGetDataFromString])(__ecereClass_double, &d, string);

*(double *)data = ((double (*)(double))(void *)prop->Get)(d);
return result;
}
else if(!strcmp(dts, "float"))
{
float d;
unsigned int result = ((unsigned int (*)(void *, void *, const char *))(void *)__ecereClass_float->_vTbl[__ecereVMethodID_class_OnGetDataFromString])(__ecereClass_float, &d, string);

*(float *)data = ((float (*)(float))(void *)prop->Get)(d);
return result;
}
else if(!strcmp(dts, "int"))
{
int d;
unsigned int result = ((unsigned int (*)(void *, void *, const char *))(void *)__ecereClass_int->_vTbl[__ecereVMethodID_class_OnGetDataFromString])(__ecereClass_int, &d, string);

*(int *)data = ((int (*)(int))(void *)prop->Get)(d);
return result;
}
else if(!strcmp(dts, "int64"))
{
long long d;
unsigned int result = ((unsigned int (*)(void *, void *, const char *))(void *)__ecereClass_int64->_vTbl[__ecereVMethodID_class_OnGetDataFromString])(__ecereClass_int64, &d, string);

*(long long *)data = ((long long (*)(long long))(void *)prop->Get)(d);
return result;
}
}
else
break;
}
}
dataType = __ecereNameSpace__ecere__com__eSystem_FindClass(module, _class->dataTypeString);
return ((unsigned int (*)(void *, void *, const char *))(void *)dataType->_vTbl[__ecereVMethodID_class_OnGetDataFromString])(dataType, data, string);
}
else if(!string[0] && _class->type == 0)
{
*data = (((void *)0));
return 1;
}
else
{
int c;
char memberName[1024];
char memberString[10240];
int count = 0;
unsigned int quoted = 0;
int brackets = 0;
char ch;
unsigned int escape = 0;
unsigned int gotChar;
unsigned int memberOffset;
struct __ecereNameSpace__ecere__com__Class * curClass = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * curMember = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * subMemberStack[256];
int subMemberStackPos = 0;

result = 1;
if(_class->type == 5 || _class->type == 0)
{
data = *data = __ecereNameSpace__ecere__com__eInstance_New(_class);
if(_class->type == 0)
((struct __ecereNameSpace__ecere__com__Instance *)(char *)((struct __ecereNameSpace__ecere__com__Instance *)data))->_refCount++;
}
else if(_class->type == 1)
memset(data, 0, _class->structSize);
else if(_class->type == 2)
{
memset(data, 0, _class->typeSize);
}
memberName[0] = '\0';
for(c = 0; string[c] && count < sizeof (memberString); )
{
unsigned int found = 0;
struct __ecereNameSpace__ecere__com__DataMember * thisMember = (((void *)0));

brackets = 0;
gotChar = 0;
for(; (ch = string[c]) && count < sizeof (memberString); c++)
{
if(ch == '\"' && !escape)
{
quoted ^= 1;
}
else if(quoted)
{
if(!escape && ch == '\\')
{
escape = 1;
}
else
{
memberString[count++] = ch;
escape = 0;
}
}
else if(ch == ' ')
{
if(gotChar)
memberString[count++] = ch;
}
else if(ch == ',')
{
if(brackets)
{
memberString[count++] = ch;
}
else
{
c++;
break;
}
}
else if(ch == '{')
{
if(gotChar && !brackets)
{
count = 0;
gotChar = 0;
}
if(brackets)
{
memberString[count++] = ch;
gotChar = 1;
}
brackets++;
}
else if(ch == '}')
{
brackets--;
if(brackets)
{
gotChar = 1;
memberString[count++] = ch;
}
}
else if(ch == '=')
{
if(brackets)
{
memberString[count++] = ch;
}
else
{
memberString[count] = '\0';
__ecereNameSpace__ecere__sys__TrimRSpaces(memberString, memberName);
count = 0;
gotChar = 0;
}
}
else
{
memberString[count++] = ch;
gotChar = 1;
}
}
memberString[count] = '\0';
__ecereNameSpace__ecere__sys__TrimRSpaces(memberString, memberString);
if(memberName[0])
{
struct __ecereNameSpace__ecere__com__DataMember * _subMemberStack[256];
int _subMemberStackPos = 0;

thisMember = __ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(_class, memberName, &memberOffset, _class->module, _subMemberStack, &_subMemberStackPos);
if(!thisMember)
thisMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(_class, memberName, _class->module);
if(thisMember)
{
if(thisMember->memberAccess == 1)
{
curMember = thisMember;
curClass = thisMember->_class;
memcpy(subMemberStack, _subMemberStack, sizeof(int) * _subMemberStackPos);
subMemberStackPos = _subMemberStackPos;
}
found = 1;
}
}
else
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(_class, &curClass, &curMember, subMemberStack, &subMemberStackPos);
thisMember = curMember;
if(thisMember)
{
found = 1;
__ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(_class, thisMember->name, &memberOffset, _class->module, (((void *)0)), (((void *)0)));
}
}
if(found)
{
struct __ecereNameSpace__ecere__com__Class * memberType = thisMember->dataTypeClass;
unsigned int offset;
unsigned char * memberData;

if(!memberType)
memberType = thisMember->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, thisMember->dataTypeString);
if(!memberType)
memberType = thisMember->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "int");
offset = thisMember->_class->offset + memberOffset;
memberData = (unsigned char *)data + offset;
if(memberType->type == 1)
{
if(thisMember && !thisMember->isProperty)
{
if(_class->type == 2)
{
}
else if(!((unsigned int (*)(void *, void *, const char *))(void *)memberType->_vTbl[__ecereVMethodID_class_OnGetDataFromString])(memberType, memberData, memberString))
result = 0;
}
}
else
{
struct __ecereNameSpace__ecere__com__DataValue value =
{

.__anon1 = {
.c = 0
}
};

if(memberType->_vTbl[__ecereVMethodID_class_OnGetDataFromString] == _class->_vTbl[__ecereVMethodID_class_OnGetDataFromString])
{
if(_class->templateClass == __ecereClass___ecereNameSpace__ecere__com__Container && memberType == _class && !strcmp(thisMember->name, "copySrc"))
result = 0;
else if(!__ecereNameSpace__ecere__com__OnGetDataFromString(memberType, (void **)&value, memberString))
result = 0;
}
else if(!((unsigned int (*)(void *, void *, const char *))(void *)memberType->_vTbl[__ecereVMethodID_class_OnGetDataFromString])(memberType, &value, memberString))
result = 0;
if(thisMember && !thisMember->isProperty)
{
if(_class->type == 2)
{
struct __ecereNameSpace__ecere__com__BitMember * bitMember = (struct __ecereNameSpace__ecere__com__BitMember *)thisMember;

if(_class->typeSize == 4)
{
*(unsigned int *)data = (unsigned int)(((*(unsigned int *)data & ~bitMember->mask)) | ((value.__anon1.ui64 << bitMember->pos) & bitMember->mask));
}
else if(_class->typeSize == 8)
{
*(uint64 *)data = (((*(uint64 *)data & ~bitMember->mask)) | ((value.__anon1.ui64 << bitMember->pos) & bitMember->mask));
}
}
else
{
if(memberType->typeSize == 1)
{
*(char *)memberData = value.__anon1.c;
}
else if(memberType->typeSize == 2)
{
*(short *)memberData = value.__anon1.s;
}
else if(memberType->typeSize == 4)
{
*(int *)memberData = value.__anon1.i;
}
else if(memberType->typeSize == 8)
{
*(long long *)memberData = value.__anon1.i64;
}
}
}
else if(thisMember->isProperty && ((struct __ecereNameSpace__ecere__com__Property *)thisMember)->Set)
{
if(memberType->type == 5 || memberType->type == 0 || memberType->type == 1)
((void (*)(void *, void *))(void *)((struct __ecereNameSpace__ecere__com__Property *)thisMember)->Set)(data, value.__anon1.p);
else
{
if(!strcmp(memberType->dataTypeString, "float"))
{
((void (*)(void *, float))(void *)((struct __ecereNameSpace__ecere__com__Property *)thisMember)->Set)(data, value.__anon1.f);
}
else if(!strcmp(memberType->dataTypeString, "double"))
{
((void (*)(void *, double))(void *)((struct __ecereNameSpace__ecere__com__Property *)thisMember)->Set)(data, value.__anon1.d);
}
else if(!strcmp(memberType->dataTypeString, "int64"))
{
((void (*)(void *, long long))(void *)((struct __ecereNameSpace__ecere__com__Property *)thisMember)->Set)(data, value.__anon1.i64);
}
else
{
((void (*)(void *, int))(void *)((struct __ecereNameSpace__ecere__com__Property *)thisMember)->Set)(data, value.__anon1.i);
}
}
}
}
}
else
result = 0;
count = 0;
memberName[0] = '\0';
}
}
return result;
}

static void __ecereNameSpace__ecere__com__OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, void ** data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
struct __ecereNameSpace__ecere__com__Instance * module = _class->module;

if(_class->type == 3 || _class->type == 2 || _class->type == 4)
{
const char * dtString = _class->dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataType;

if(!strcmp(dtString, "unsigned int") || !strcmp(dtString, "uint"))
dataType = __ecereClass_uint;
else
dataType = __ecereNameSpace__ecere__com__eSystem_FindClass(module, dtString);
if(dataType)
((void (*)(void *, void *, void *))(void *)dataType->_vTbl[__ecereVMethodID_class_OnUnserialize])(dataType, data, channel);
}
else if(_class->type == 0 || _class->type == 5 || _class->type == 1)
{
if(data)
{
struct __ecereNameSpace__ecere__com__Class * lastClass = (((void *)0));

if(_class->type == 0 || _class->type == 5)
{
data = *data = __ecereNameSpace__ecere__com__eInstance_New(_class);
if(_class->type == 0)
((struct __ecereNameSpace__ecere__com__Instance *)(char *)((struct __ecereNameSpace__ecere__com__Instance *)data))->_refCount++;
}
else if(_class->type == 1)
memset(data, 0, _class->structSize);
while(lastClass != _class)
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Class * c;

for(c = _class; c && (!c->base || c->base->type != 1000) && c->base != lastClass; c = c->base)
;
lastClass = c;
for(member = c->membersAndProperties.first; member; member = member->next)
{
if(member->id < 0)
continue;
if(member->isProperty || member->type == 0)
{
struct __ecereNameSpace__ecere__com__Class * memberType = member->dataTypeClass;

if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, member->dataTypeString);
if(memberType)
{
if(member->isProperty)
{
}
else
((void (*)(void *, void *, void *))(void *)memberType->_vTbl[__ecereVMethodID_class_OnUnserialize])(memberType, (unsigned char *)data + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset), channel);
}
else
{
}
}
else
{
__ecereNameSpace__ecere__com__DataMember_OnUnserialize(member, (unsigned char *)data + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset), channel);
}
}
}
}
}
}

void __ecereUnregisterModule_dataTypes(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_buffer = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_size = (void *)0;
}

void __ecereNameSpace__ecere__com__Enum_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, int * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
struct __ecereNameSpace__ecere__com__Class * dataType = strcmp(_class->dataTypeString, "int") ? __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, _class->dataTypeString) : (((void *)0));

if(dataType)
((void (*)(void *, void *, void *))(void *)dataType->_vTbl[__ecereVMethodID_class_OnSerialize])(dataType, data, channel);
else
__ecereNameSpace__ecere__com__Int_OnSerialize(_class, data, channel);
}

void __ecereNameSpace__ecere__com__Enum_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, int * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
const char * dtString = _class->dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataType = (((void *)0));

if(strcmp(dtString, "int"))
{
if(!strcmp(dtString, "uint") || !strcmp(dtString, "unsigned int"))
dataType = __ecereClass_uint;
else
dataType = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, dtString);
}
if(dataType)
((void (*)(void *, void *, void *))(void *)dataType->_vTbl[__ecereVMethodID_class_OnUnserialize])(dataType, data, channel);
else
__ecereNameSpace__ecere__com__Int_OnUnserialize(_class, data, channel);
}

static void __ecereNameSpace__ecere__com__RegisterClass_Integer(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "int", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);

integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("int");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(int);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Integer_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Integer_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Integer_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnUnserialize, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "int64", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
integerClass->structSize = 0;
integerClass->typeSize = sizeof(long long);
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("int64");
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnUnserialize, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "uint", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("unsigned int");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(unsigned int);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnUnserialize, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "unsigned int", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("unsigned int");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(unsigned int);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnUnserialize, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "uint16", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("unsigned short");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(unsigned short);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Word_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Word_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__UInt16_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__UInt16_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__UInt16_OnGetDataFromString, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "short", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("short");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(short);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Word_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Word_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Int16_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Int16_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Int16_OnGetDataFromString, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "uint32", "uint", 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("unsigned int");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(unsigned int);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "uint64", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("uint64");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(uint64);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__UInt64_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__UInt64_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__UInt64_OnCompare, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "byte", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("unsigned char");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(unsigned char);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnUnserialize, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "char", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("char");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(char);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Char_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnUnserialize, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "intsize", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("ssize_t");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(ssize_t);
if(sizeof(ssize_t) == 8)
{
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnCompare, 1);
}
else
{
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Integer_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Integer_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Integer_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnUnserialize, 1);
}
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "uintsize", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("size_t");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(size_t);
if(sizeof(size_t) == 8)
{
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__UInt64Hex_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__UInt64_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__UInt64_OnCompare, 1);
}
else
{
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__UIntegerHex_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnCompare, 1);
}
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "uintptr", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("uintptr_t");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(uintptr_t);
integerClass->byValueSystemClass = 1;
if(sizeof(uintptr_t) == 8)
{
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__UIntPtr64_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__UInt64_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__IntPtr64_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__UIntPtr64_OnCompare, 1);
}
else
{
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__UIntPtr32_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__IntPtr32_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__UIntPtr32_OnCompare, 1);
}
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "intptr", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("intptr_t");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(intptr_t);
integerClass->byValueSystemClass = 1;
if(sizeof(intptr_t) == 8)
{
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__IntPtr64_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__IntPtr64_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__IntPtr64_OnCompare, 1);
}
else
{
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__IntPtr32_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Integer_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__IntPtr32_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__IntPtr32_OnCompare, 1);
}
}

static void __ecereNameSpace__ecere__com__RegisterClass_Float(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * floatClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "float", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);

floatClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)floatClass->dataTypeString), floatClass->dataTypeString = 0);
floatClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("float");
floatClass->structSize = 0;
floatClass->typeSize = sizeof(float);
__ecereNameSpace__ecere__com__eClass_AddMethod(floatClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Float_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(floatClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Float_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(floatClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Float_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(floatClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Float_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(floatClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Float_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(floatClass, "nan", "float ::nan(void)", Float_nan, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(floatClass, "inf", "float ::inf(void)", Float_inf, 1);
__ecereNameSpace__ecere__com__eClass_AddProperty(floatClass, "isNan", "bool", (((void *)0)), Float_isNan, 1);
__ecereNameSpace__ecere__com__eClass_AddProperty(floatClass, "isInf", "bool", (((void *)0)), Float_isInf, 1);
__ecereNameSpace__ecere__com__eClass_AddProperty(floatClass, "signBit", "int", (((void *)0)), Float_signBit, 1);
}

static void __ecereNameSpace__ecere__com__RegisterClass_Double(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * doubleClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "double", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);

doubleClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)doubleClass->dataTypeString), doubleClass->dataTypeString = 0);
doubleClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("double");
doubleClass->structSize = 0;
doubleClass->typeSize = sizeof(double);
__ecereNameSpace__ecere__com__eClass_AddMethod(doubleClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Double_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(doubleClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Double_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(doubleClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Double_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(doubleClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Double_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(doubleClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Double_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddProperty(doubleClass, "isNan", "bool", (((void *)0)), Double_isNan, 1);
__ecereNameSpace__ecere__com__eClass_AddProperty(doubleClass, "isInf", "bool", (((void *)0)), Double_isInf, 1);
__ecereNameSpace__ecere__com__eClass_AddProperty(doubleClass, "signBit", "int", (((void *)0)), Double_signBit, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(doubleClass, "nan", "double ::nan(void)", Double_nan, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(doubleClass, "inf", "double ::inf(void)", Double_inf, 1);
}

static void __ecereNameSpace__ecere__com__RegisterClass_String(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * stringClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "char *", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);

(__ecereNameSpace__ecere__com__eSystem_Delete((void *)stringClass->dataTypeString), stringClass->dataTypeString = 0);
stringClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("char *");
stringClass->structSize = 0;
stringClass->computeSize = 0;
__ecereNameSpace__ecere__com__eClass_AddMethod(stringClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__String_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(stringClass, "OnCopy", (((void *)0)), __ecereNameSpace__ecere__com__String_OnCopy, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(stringClass, "OnFree", (((void *)0)), __ecereNameSpace__ecere__com__String_OnFree, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(stringClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__String_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(stringClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__String_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(stringClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__String_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(stringClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__String_OnUnserialize, 1);
stringClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "String", "char *", 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
stringClass->structSize = 0;
stringClass->computeSize = 0;
__ecereNameSpace__ecere__com__eClass_AddProperty(stringClass, (((void *)0)), "char *", (((void *)0)), (((void *)0)), 1);
}

void __ecereDestructor___ecereNameSpace__ecere__com__SerialBuffer(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__SerialBuffer * __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer = (struct __ecereNameSpace__ecere__com__SerialBuffer *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__SerialBuffer->offset) : 0);

{
__ecereMethod___ecereNameSpace__ecere__com__SerialBuffer_Free(this);
}
}

void __ecereNameSpace__ecere__com__InitializeDataTypes1(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * baseClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "class");

__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnDisplay", "void typed_object::OnDisplay(Surface surface, int x, int y, int width, void * fieldData, Alignment alignment, DataDisplayFlags displayFlags)", (((void *)0)), 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnCompare", "int typed_object::OnCompare(any_object object)", __ecereNameSpace__ecere__com__OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnCopy", "void typed_object&::OnCopy(any_object newData)", __ecereNameSpace__ecere__com__OnCopy, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnFree", "void typed_object::OnFree(void)", __ecereNameSpace__ecere__com__OnFree, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnGetString", "const char * typed_object::OnGetString(char * tempString, void * reserved, ObjectNotationType * onType)", __ecereNameSpace__ecere__com__OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnGetDataFromString", "bool typed_object&::OnGetDataFromString(const char * string)", __ecereNameSpace__ecere__com__OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnEdit", "Window typed_object::OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)", (((void *)0)), 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnSerialize", "void typed_object::OnSerialize(IOChannel channel)", __ecereNameSpace__ecere__com__OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnUnserialize", "void typed_object&::OnUnserialize(IOChannel channel)", __ecereNameSpace__ecere__com__OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnSaveEdit", "bool typed_object&::OnSaveEdit(Window window, void * object)", (((void *)0)), 1);
}

void __ecereNameSpace__ecere__com__InitializeDataTypes(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * enumClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "enum");

__ecereNameSpace__ecere__com__eClass_AddMethod(enumClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Enum_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(enumClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Enum_OnUnserialize, 1);
__ecereNameSpace__ecere__com__RegisterClass_Integer(module);
__ecereNameSpace__ecere__com__RegisterClass_Float(module);
__ecereNameSpace__ecere__com__RegisterClass_Double(module);
__ecereNameSpace__ecere__com__RegisterClass_String(module);
}

void __ecereRegisterModule_dataTypes(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MAXBYTE", "0xff", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MAXWORD", "0xffff", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MININT", "((int)0x80000000)", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MAXINT", "((int)0x7fffffff)", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MININT64", "((long long)0x8000000000000000LL)", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MAXINT64", "((long long)0x7fffffffffffffffLL)", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MAXDWORD", "0xffffffff", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MAXQWORD", "0xffffffffffffffffLL", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MINFLOAT", "1.17549435082228750e-38f", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MAXFLOAT", "3.40282346638528860e+38f", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MINDOUBLE", "2.2250738585072014e-308", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MAXDOUBLE", "1.7976931348623158e+308", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::FORMAT64HEXLL", "(__runtimePlatform == win32) ? \"0x%I64XLL\" : \"0x%llXLL\"", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::FORMAT64HEX", "(__runtimePlatform == win32) ? \"0x%I64X\" : \"0x%llX\"", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::FORMAT64DLL", "(__runtimePlatform == win32) ? \"%I64dLL\" : \"%lldLL\"", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::FORMAT64D", "(__runtimePlatform == win32) ? \"%I64d\" : \"%lld\"", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::FORMAT64U", "(__runtimePlatform == win32) ? \"%I64u\" : \"%llu\"", module, 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::IOChannel", 0, 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__IOChannel = class;
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "WriteData", "uintsize WriteData(const void * data, uintsize numBytes)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "ReadData", "uintsize ReadData(void * data, uintsize numBytes)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Get", "void Get(typed_object * data)", __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Get, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Put", "void Put(typed_object data)", __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Put, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Serialize", "void Serialize(typed_object data)", __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Unserialize", "void Unserialize(typed_object * data)", __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::SerialBuffer", "ecere::com::IOChannel", sizeof(struct __ecereNameSpace__ecere__com__SerialBuffer), 0, (void *)0, (void *)__ecereDestructor___ecereNameSpace__ecere__com__SerialBuffer, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__SerialBuffer = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "WriteData", 0, __ecereMethod___ecereNameSpace__ecere__com__SerialBuffer_WriteData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "ReadData", 0, __ecereMethod___ecereNameSpace__ecere__com__SerialBuffer_ReadData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Free", "void Free()", __ecereMethod___ecereNameSpace__ecere__com__SerialBuffer_Free, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_buffer", "byte *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "count", "uintsize", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_size", "uintsize", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "pos", "uintsize", sizeof(void *), 0xF000F000, 1);
__ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_buffer = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "buffer", "byte *", __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Set_buffer, __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Get_buffer, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__SerialBuffer_buffer = __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_buffer, __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_buffer = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_size = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "size", "uint", __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Set_size, __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Get_size, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__SerialBuffer_size = __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_size, __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_size = (void *)0;
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Enum_OnGetString", "const char * ecere::com::Enum_OnGetString(ecere::com::Class _class, void * data, char * tempString, void * fieldData, ecere::com::ObjectNotationType * onType)", __ecereNameSpace__ecere__com__Enum_OnGetString, module, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::ObjectNotationType", "bool", 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ObjectNotationType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "none", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "econ", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "json", 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Integer_OnGetString", "const char * ecere::com::Integer_OnGetString(ecere::com::Class _class, int * data, char * string, void * fieldData, ecere::com::ObjectNotationType * onType)", __ecereNameSpace__ecere__com__Integer_OnGetString, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Byte_OnSerialize", "void ecere::com::Byte_OnSerialize(ecere::com::Class _class, byte * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Byte_OnSerialize, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Byte_OnUnserialize", "void ecere::com::Byte_OnUnserialize(ecere::com::Class _class, byte * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Byte_OnUnserialize, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Int_OnSerialize", "void ecere::com::Int_OnSerialize(ecere::com::Class _class, int * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Int_OnSerialize, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::IntPtr32_OnSerialize", "void ecere::com::IntPtr32_OnSerialize(ecere::com::Class _class, int data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__IntPtr32_OnSerialize, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Int_OnUnserialize", "void ecere::com::Int_OnUnserialize(ecere::com::Class _class, int * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Int_OnUnserialize, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Enum_OnSerialize", "void ecere::com::Enum_OnSerialize(ecere::com::Class _class, int * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Enum_OnSerialize, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Enum_OnUnserialize", "void ecere::com::Enum_OnUnserialize(ecere::com::Class _class, int * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Enum_OnUnserialize, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Int64_OnSerialize", "void ecere::com::Int64_OnSerialize(ecere::com::Class _class, int64 * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Int64_OnSerialize, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Int64_OnUnserialize", "void ecere::com::Int64_OnUnserialize(ecere::com::Class _class, int64 * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Int64_OnUnserialize, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Word_OnSerialize", "void ecere::com::Word_OnSerialize(ecere::com::Class _class, uint16 * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Word_OnSerialize, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Word_OnUnserialize", "void ecere::com::Word_OnUnserialize(ecere::com::Class _class, uint16 * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Word_OnUnserialize, module, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::com::StaticString", 0, sizeof(struct __ecereNameSpace__ecere__com__StaticString), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__StaticString = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnCompare", 0, __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnFree", 0, __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnFree, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnSerialize", 0, __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnUnserialize", 0, __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "string", "char[1]", 1, 1, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::CIString", "String", 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__CIString = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnCompare", 0, __ecereMethod___ecereNameSpace__ecere__com__CIString_OnCompare, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::InitializeDataTypes1", "void ecere::com::InitializeDataTypes1(ecere::com::Module module)", __ecereNameSpace__ecere__com__InitializeDataTypes1, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::InitializeDataTypes", "void ecere::com::InitializeDataTypes(ecere::com::Module module)", __ecereNameSpace__ecere__com__InitializeDataTypes, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::PrintStdArgsToBuffer", "int ecere::com::PrintStdArgsToBuffer(char * buffer, int maxLen, const typed_object object, __builtin_va_list args)", __ecereNameSpace__ecere__com__PrintStdArgsToBuffer, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::PrintBuf", "int ecere::com::PrintBuf(char * buffer, int maxLen, const typed_object object, ...)", __ecereNameSpace__ecere__com__PrintBuf, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::PrintLnBuf", "int ecere::com::PrintLnBuf(char * buffer, int maxLen, const typed_object object, ...)", __ecereNameSpace__ecere__com__PrintLnBuf, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::PrintString", "char * ecere::com::PrintString(const typed_object object, ...)", __ecereNameSpace__ecere__com__PrintString, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::PrintLnString", "char * ecere::com::PrintLnString(const typed_object object, ...)", __ecereNameSpace__ecere__com__PrintLnString, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::PrintLn", "void ecere::com::PrintLn(const typed_object object, ...)", __ecereNameSpace__ecere__com__PrintLn, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Print", "void ecere::com::Print(const typed_object object, ...)", __ecereNameSpace__ecere__com__Print, module, 4);
}

