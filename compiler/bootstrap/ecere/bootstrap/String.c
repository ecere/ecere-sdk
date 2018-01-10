/* Code generated from eC source file: String.ec */
#if defined(_WIN32)
#define __runtimePlatform 1
#elif defined(__APPLE__)
#define __runtimePlatform 3
#else
#define __runtimePlatform 2
#endif
#if defined(__GNUC__)
typedef long long int64;
typedef unsigned long long uint64;
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
#   if defined(__GNUC__) || defined(__TINYC__)
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

extern __attribute__ ((visibility("default"))) unsigned int ccUtf8ToUnicode(unsigned int b, unsigned int * state, unsigned int * retunicode)
{
unsigned int type;
static const unsigned char utf8d[] =
{
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 10, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 3, 3, 11, 6, 6, 6, 5, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 0, 12, 24, 36, 60, 96, 84, 12, 12, 12, 48, 72, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 0, 12, 12, 12, 12, 12, 0, 12, 0, 12, 12, 12, 24, 12, 12, 12, 12, 12, 24, 12, 24, 12, 12, 12, 12, 12, 12, 12, 12, 12, 24, 12, 12, 12, 12, 12, 24, 12, 12, 12, 12, 12, 12, 12, 24, 12, 12, 12, 12, 12, 12, 12, 12, 12, 36, 12, 36, 12, 12, 12, 36, 12, 12, 12, 12, 12, 36, 12, 36, 12, 12, 12, 36, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12
};

type = utf8d[b];
*retunicode = ((*state != 0) ? ((b & 0x3fu) | (*retunicode << 6)) : ((0xff >> type) & (b)));
*state = utf8d[256 + *state + type];
return *state;
}

extern int runtimePlatform;








void __ecereNameSpace__ecere__sys__ChangeCh(char * string, char ch1, char ch2)
{
int c;

for(c = 0; string[c]; c++)
if(string[c] == ch1)
string[c] = ch2;
}

void __ecereNameSpace__ecere__sys__RepeatCh(char * string, int count, char ch)
{
int c;

for(c = 0; c < count; c++)
string[c] = ch;
string[c] = 0;
}

unsigned int __ecereNameSpace__ecere__sys__GetString(const char ** buffer, char * string, int max)
{
int c;
char ch;
unsigned int quoted = 0;
unsigned int result = 1;

if(!* *buffer)
{
string[0] = 0;
return 0;
}
for(; ; )
{
if(!(ch = *((*buffer)++)))
result = 0;
if((ch != '\n') && (ch != '\r') && (ch != ' ') && (ch != ',') && (ch != '\t'))
break;
if(!*(*buffer))
break;
}
if(result)
{
for(c = 0; c < max - 1; c++)
{
if(!quoted && ((ch == '\n') || (ch == '\r') || (ch == ' ') || (ch == ',') || (ch == '\t')))
{
result = 1;
break;
}
if(ch == '\"')
{
quoted ^= (unsigned int)1;
c--;
}
else
string[c] = ch;
if(!(ch = *(*buffer)))
{
c++;
break;
}
(*buffer)++;
}
string[c] = 0;
}
return result;
}

struct __ecereNameSpace__ecere__sys__ZString
{
char * _string;
int len;
int allocType;
int size;
int minSize;
int maxSize;
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

struct __ecereNameSpace__ecere__com__SerialBuffer
{
unsigned char *  _buffer;
size_t count;
size_t _size;
size_t pos;
} ecere_gcc_struct;

extern void *  __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew(void *  memory, unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew0(void *  memory, unsigned int size);

extern void __ecereNameSpace__ecere__com__eSystem_Delete(void *  memory);

extern size_t strlen(const char * );

extern char *  strcpy(char * , const char * );

extern int strcmp(const char * , const char * );

extern void *  memmove(void * , const void * , size_t size);

extern char *  strncpy(char * , const char * , size_t n);

extern char *  strstr(const char * , const char * );

extern void *  memcpy(void * , const void * , size_t size);

extern int toupper(int);

extern char *  strcat(char * , const char * );

extern int sprintf(char * , const char * , ...);

extern int strcasecmp(const char * , const char * );

extern int strncmp(const char * , const char * , size_t n);

extern int strncasecmp(const char * , const char * , size_t n);

extern int tolower(int);

extern int isalnum(int c);

extern char *  strchr(const char * , int);

extern int atoi(const char * );

extern unsigned long strtoul(const char *  nptr, char * *  endptr, int base);

extern unsigned int isdigit(int);

extern int vsnprintf(char * , size_t, const char * , __builtin_va_list);

struct __ecereNameSpace__ecere__com__DefinedExpression;

struct __ecereNameSpace__ecere__com__GlobalFunction;

unsigned int __ecereNameSpace__ecere__sys__StripExtension(char * string)
{
int c;

for(c = strlen(string); c >= 0; c--)
if(string[c] == '.')
{
string[c] = '\0';
return 1;
}
else if(string[c] == '\\' || string[c] == '/')
break;
return 0;
}

char * __ecereNameSpace__ecere__sys__GetExtension(const char * string, char * output)
{
int __simpleStruct0;
int c;
int len = strlen(string);
int limit = (__simpleStruct0 = len - (17), (0 > __simpleStruct0) ? 0 : __simpleStruct0);

output[0] = '\0';
for(c = len; c >= limit; c--)
{
char ch = string[c];

if(ch == '.')
{
strcpy(output, string + c + 1);
break;
}
else if(ch == '/' || ch == '\\')
break;
}
return output;
}

char * __ecereNameSpace__ecere__sys__StripLastDirectory(const char * string, char * output)
{
int c;

if(runtimePlatform == 1 && !strcmp(string, "\\\\"))
{
strcpy(output, "/");
return output;
}
else
{
int len = strlen(string);

for(c = len - 2; c >= 0; c--)
if(string[c] == '/' || string[c] == '\\')
break;
else if(string[c] == '>' || (string[c] == ':' && c == 0))
{
c++;
break;
}
if((runtimePlatform == 1) ? (c >= 0) : (c > 0))
{
memmove(output, string, c);
if(c > 0)
{
if(runtimePlatform == 1 && c == 1 && output[0] == '\\' && output[1] == '\\')
output[2] = '\0';
else
output[c] = '\0';
}
else
strcpy(output, ((__runtimePlatform == 1) ? "\\" : "/"));
return output;
}
else
{
if(c == 0)
{
strcpy(output, ((__runtimePlatform == 1) ? "\\" : "/"));
return output;
}
else
{
strcpy(output, "");
return (((void *)0));
}
}
}
}

char * __ecereNameSpace__ecere__sys__SplitDirectory(const char * string, char * part, char * rest)
{
int len = 0;
char ch;
int c = 0;

for(; (ch = string[c]) && (ch == '/' || ch == '\\'); c++)
;
if(c)
part[len++] = ((__runtimePlatform == 1) ? '\\' : '/');
else
{
for(; (ch = string[c]) && (ch != '/' && ch != '\\'); c++)
{
if(len < (274))
part[len++] = ch;
}
}
for(; (ch = string[c]) && (ch == '/' || ch == '\\'); c++)
;
memmove(rest, string + c, strlen(string + c) + 1);
for(c = strlen(rest); c >= 0; c--)
if(ch != '/' && ch != '\\')
break;
if(c > 0)
rest[c] = '\0';
part[len] = '\0';
return rest;
}

char * __ecereNameSpace__ecere__sys__GetLastDirectory(const char * string, char * output)
{
int c;
int len = string ? strlen(string) : 0;

for(c = len - 2; c >= 0; c--)
if(string[c] == '/' || string[c] == '\\' || string[c] == ':' || string[c] == '>')
break;
c++;
if(c >= 0)
memmove(output, string + c, strlen(string + c) + 1);
else
output[0] = '\0';
len = strlen(output);
if(len > 1 && (output[len - 1] == '\\' || output[len - 1] == '/'))
output[len - 1] = '\0';
return output;
}

char * __ecereNameSpace__ecere__sys__TrimLSpaces(const char * string, char * output)
{
int c;

for(c = 0; string[c] && string[c] == ' '; c++)
;
memmove(output, string + c, strlen(string + c) + 1);
return output;
}

char * __ecereNameSpace__ecere__sys__TrimRSpaces(const char * string, char * output)
{
int c;

for(c = strlen(string) - 1; c >= 0 && string[c] == ' '; c--)
;
if(c >= 0)
{
memmove(output, string, c + 1);
output[c + 1] = '\0';
}
else
output[0] = '\0';
return output;
}

char * __ecereNameSpace__ecere__sys__StripQuotes(const char * string, char * output)
{
int len;
const char * src = (string[0] == '\"') ? (string + 1) : string;

memmove(output, src, strlen(src) + 1);
len = strlen(output);
if(len && output[len - 1] == '\"')
output[len - 1] = '\0';
return output;
}

unsigned int __ecereNameSpace__ecere__sys__SplitArchivePath(const char * fileName, char * archiveName, const char ** archiveFile)
{
if(fileName[0] == '<')
{
int c = strlen(fileName);

for(; c > 0 && fileName[c] != '>'; c--)
;
if(c > 0)
{
strncpy(archiveName, fileName + 1, c - 1);
archiveName[c - 1] = '\0';
*archiveFile = fileName + c + 1;
return 1;
}
}
else if(fileName[0] == ':')
{
strcpy(archiveName, ":");
*archiveFile = fileName + 1;
return 1;
}
return 0;
}

char * __ecereNameSpace__ecere__sys__CopyString(const char * string)
{
if(string)
{
int len = strlen(string);
char * destination = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (len + 1));

if(destination)
memcpy(destination, string, len + 1);
return destination;
}
else
return (((void *)0));
}

void __ecereNameSpace__ecere__sys__PrintSize(char * string, uint64 size, int prec)
{
if(size > 1024)
{
char format[8];

sprintf(format, "%%.0%df", prec);
if(size > 1024 * 1024 * 1024)
{
sprintf(string, format, (float)size / (float)((float)(float)(1024 * 1024 * 1024)));
strcat(string, " GB");
}
else if(size > 1024 * 1024)
{
sprintf(string, format, (float)size / (float)((float)(float)(1024 * 1024)));
strcat(string, " MB");
}
else
{
sprintf(string, format, (float)size / (float)1024);
strcat(string, " KB");
}
}
else
sprintf(string, "%d B", (unsigned int)size);
}

void __ecereNameSpace__ecere__sys__PrintBigSize(char * string, double size, int prec)
{
if(size > (double)1024)
{
char format[8];

sprintf(format, "%%.0%df", prec);
if(size > 1024.0 * 1024.0 * 1024.0 * 1024.0)
{
sprintf(string, format, size / ((double)(double)(1024 * 1024) * 1024.0 * 1024.0));
strcat(string, " TB");
}
else if(size > 1024.0 * 1024.0 * 1024.0)
{
sprintf(string, format, size / (1024.0 * 1024.0 * 1024.0));
strcat(string, " GB");
}
else if(size > 1024.0 * 1024.0)
{
sprintf(string, format, size / (1024.0 * 1024.0));
strcat(string, " MB");
}
else
{
sprintf(string, format, size / 1024.0);
strcat(string, " KB");
}
}
else
sprintf(string, "%.0f B", size);
}

char * __ecereNameSpace__ecere__sys__SearchString(const char * buffer, int start, const char * subStr, unsigned int matchCase, unsigned int matchWord)
{
if(buffer && subStr)
{
const char * ptr;
const char * strBuffer = buffer + start;
int subLen = strlen(subStr);
char beforeChar = start ? *(strBuffer - 1) : 0;
int (* strcompare)(const char *, const char *, size_t) = (void *)(matchCase ? (void *)(strncmp) : ((void *)(strncasecmp)));

for(ptr = strBuffer; *ptr; ptr++)
{
if(matchCase ? (*subStr == *ptr) : (tolower(*subStr) == tolower(*ptr)))
{
if(matchWord)
{
if(!strcompare(ptr, subStr, subLen) && (!((subStr[subLen - 1]) == '_' || isalnum((subStr[subLen - 1]))) || !((ptr[subLen]) == '_' || isalnum((ptr[subLen])))) && (!((subStr[0]) == '_' || isalnum((subStr[0]))) || !((beforeChar) == '_' || isalnum((beforeChar)))))
return (char *)ptr;
}
else
{
if(!strcompare(ptr, subStr, subLen))
return (char *)ptr;
}
}
beforeChar = ptr[0];
}
}
return (((void *)0));
}

char * __ecereNameSpace__ecere__sys__RSearchString(const char * buffer, const char * subStr, int maxLen, unsigned int matchCase, unsigned int matchWord)
{
if(buffer && subStr)
{
int subLen = strlen(subStr);
const char * ptr1 = buffer + maxLen - subLen;
const char * ptr2 = buffer + maxLen - subLen - 1;
int (* strcompare)(const char *, const char *, size_t) = (void *)(matchCase ? (void *)(strncmp) : ((void *)(strncasecmp)));

for(; ptr1 >= buffer; ptr1--, ptr2--)
{
if(tolower(*subStr) == tolower(*ptr1))
{
if(matchWord)
{
if(!strcompare(ptr1, subStr, subLen) && (!((subStr[subLen - 1]) == '_' || isalnum((subStr[subLen - 1]))) || !((ptr1[subLen]) == '_' || isalnum((ptr1[subLen])))) && (!((subStr[0]) == '_' || isalnum((subStr[0]))) || !((*ptr2) == '_' || isalnum((*ptr2)))))
return (char *)ptr1;
}
else
{
if(!strcompare(ptr1, subStr, subLen))
return (char *)ptr1;
}
}
}
}
return (((void *)0));
}

int __ecereNameSpace__ecere__sys__Tokenize(char * string, int maxTokens, char * tokens[], unsigned int esc)
{
const char * escChars, * escCharsQuoted;
int count = 0;
unsigned int quoted = 0, escaped = 0;
char * start = (((void *)0)), * output = string;
char ch;

if(__runtimePlatform == 1)
{
escChars = " !\"%&'()+,;=[]^`{}~";
escCharsQuoted = "\"";
}
else
{
escChars = " !\"$&'()*:;<=>?[\\`{|";
escCharsQuoted = "\"()$";
}
for(; (ch = *string) && count < maxTokens; string++, output++)
{
unsigned int wasEscaped = escaped;

if(output != string)
*output = ch;
if(start)
{
if(escaped)
{
escaped = 0;
output--;
*output = ch;
}
else if(ch == '\"')
{
quoted ^= 1;
output--;
}
else if(ch == ' ' && !quoted)
{
tokens[count++] = start;
*output = '\0';
start = (((void *)0));
}
}
else if(ch != ' ')
{
if(ch == '\"')
{
quoted = 1;
start = output + 1;
}
else
start = output;
}
if(!wasEscaped && ch == '\\' && (esc == 1 || (esc == 2 && strchr(quoted ? escCharsQuoted : escChars, *(string + 1)))))
escaped = 1;
}
if(start && count < maxTokens)
{
tokens[count++] = start;
*output = '\0';
}
return count;
}

int __ecereNameSpace__ecere__sys__TokenizeWith(char * string, int maxTokens, char * tokens[], const char * tokenizers, unsigned int escapeBackSlashes)
{
int count = 0;
unsigned int quoted = 0;
char * start = (((void *)0));
unsigned int escaped = 0;
char * output = string;
unsigned int quotedFromStart = 0;

for(; *string && count < maxTokens; string++, output++)
{
if(output != string)
*output = *string;
if(start)
{
if(escaped)
{
escaped = 0;
output--;
if(output != string)
*output = *string;
}
else if(escapeBackSlashes && *string == '\\')
escaped = 1;
else if(*string == '\"')
{
if(quoted)
{
if(quotedFromStart)
*output = '\0';
quotedFromStart = 0;
quoted = 0;
}
else
quoted = 1;
}
else if(strchr(tokenizers, *string) && !quoted)
{
tokens[count++] = start;
*output = '\0';
start = (((void *)0));
}
}
else if(!strchr(tokenizers, *string))
{
if(*string == '\"')
{
quotedFromStart = 1;
quoted = 1;
start = output + 1;
}
else
{
start = output;
if(*string == '\\' && escapeBackSlashes)
escaped = 1;
}
}
}
if(start && count < maxTokens)
{
tokens[count++] = start;
*output = '\0';
}
return count;
}

void __ecereNameSpace__ecere__sys__ChangeChars(char * string, const char * chars, char alt)
{
int c;

for(c = 0; string[c]; c++)
if(strchr(chars, string[c]))
string[c] = alt;
}

int __ecereNameSpace__ecere__sys__GetValue(const char ** buffer)
{
char string[20];

__ecereNameSpace__ecere__sys__GetString(buffer, string, 20);
return atoi(string);
}

unsigned int __ecereNameSpace__ecere__sys__GetHexValue(const char ** buffer)
{
char string[20];

__ecereNameSpace__ecere__sys__GetString(buffer, string, 20);
return (unsigned int)strtoul(string, (((void *)0)), 16);
}

double __ecereNameSpace__ecere__sys__FloatFromString(const char * string)
{
int c, dig;
double dec = 0, res = 0;
int neg = 1;
char ch;

for(c = 0; string[c]; c++)
{
ch = string[c];
if(ch == ' ')
continue;
if(ch == '-')
{
if(neg == -1)
break;
neg = -1;
}
else if((ch == '.') && !dec)
dec = 10;
else if(isdigit(ch))
{
dig = ch - '0';
if(dec)
{
res += (double)dig / dec;
dec *= 10;
}
else
res = res * (double)10 + (double)dig;
}
else
break;
}
return (double)neg * res;
}

char * __ecereNameSpace__ecere__sys__ChangeExtension(const char * string, const char * ext, char * output)
{
if(string != output)
strcpy(output, string);
__ecereNameSpace__ecere__sys__StripExtension(output);
if(ext[0])
strcat(output, ".");
strcat(output, ext);
return output;
}

unsigned int __ecereNameSpace__ecere__sys__IsPathInsideOf(const char * path, const char * of)
{
if(!path[0] || !of[0])
return 0;
else
{
char ofPart[274], ofRest[797];
char pathPart[274], pathRest[797];

strcpy(ofRest, of);
strcpy(pathRest, path);
for(; ofRest[0] && pathRest[0]; )
{
__ecereNameSpace__ecere__sys__SplitDirectory(ofRest, ofPart, ofRest);
__ecereNameSpace__ecere__sys__SplitDirectory(pathRest, pathPart, pathRest);
if(((__runtimePlatform == 1) ? (strcasecmp) : strcmp)(pathPart, ofPart))
return 0;
}
if(!ofRest[0] && !pathRest[0])
return 0;
else if(!pathRest[0])
return 0;
return 1;
}
}

char * __ecereNameSpace__ecere__sys__PathCatSlash(char * string, const char * addedPath)
{
unsigned int modified = 0;

if(addedPath)
{
char fileName[797] = "", archiveName[797] = "";
const char * file = (((void *)0));
int c = 0;
unsigned int isURL = 0;
unsigned int isArchive = __ecereNameSpace__ecere__sys__SplitArchivePath(string, archiveName, &file);
char * urlFileName = (((void *)0));
char * protocolSymbol;

strcpy(fileName, isArchive ? file : string);
if(!isArchive)
{
protocolSymbol = (fileName[0] && fileName[0] != '.' && fileName[0] != '/' && fileName[0] != '\\' && fileName[1] != ':') ? strstr(fileName, "://") : (((void *)0));
if(protocolSymbol)
{
char * slash = strstr(protocolSymbol + 3, "/");

isURL = 1;
if(slash)
urlFileName = slash;
else
urlFileName = fileName + strlen(fileName);
}
}
protocolSymbol = (addedPath[0] && addedPath[0] != '.' && addedPath[0] != '/' && addedPath[0] != '\\' && addedPath[1] != ':') ? strstr(addedPath, "://") : (((void *)0));
if(protocolSymbol)
{
int len = protocolSymbol - addedPath + 3;

memcpy(fileName, addedPath, len);
fileName[len] = 0;
isURL = 1;
c = len;
}
else if(__runtimePlatform == 1)
{
if(addedPath[0] && addedPath[1] == ':' && addedPath[0] != '<')
{
fileName[0] = (char)toupper(addedPath[0]);
fileName[1] = ':';
fileName[2] = '\0';
c = 2;
modified = 1;
}
else if(addedPath[0] == '\\' && addedPath[1] == '\\')
{
fileName[0] = fileName[1] = '\\';
fileName[2] = '\0';
c = 2;
modified = 1;
}
}
if(!modified && isURL && (addedPath[0] == '\\' || addedPath[0] == '/'))
{
urlFileName[0] = '/';
urlFileName[1] = '\0';
}
else if(!modified && (addedPath[0] == '\\' || addedPath[0] == '/'))
{
if(__runtimePlatform == 1)
{
if(addedPath[0] == '/' && !addedPath[1])
{
fileName[0] = addedPath[0];
fileName[1] = '\0';
modified = 1;
}
else if(fileName[0] && fileName[1] == ':')
{
fileName[2] = '\0';
modified = 1;
}
else
{
fileName[0] = '\\';
fileName[1] = '\0';
modified = 1;
}
}
else
{
fileName[0] = '/';
fileName[1] = '\0';
modified = 1;
}
c = 1;
}
for(; addedPath[c]; )
{
char directory[4384];
int len = 0;
char ch;
int count;

for(; (ch = addedPath[c]) && (ch == '/' || ch == '\\'); c++)
;
for(; (ch = addedPath[c]) && (ch != '/' && ch != '\\'); c++)
{
if(isURL && ch == '?')
{
break;
}
if(len < (274))
directory[len++] = ch;
}
directory[len] = '\0';
for(count = len - 1; count >= 0 && (directory[count] == ' ' || directory[count] == '\t'); count--)
{
directory[count] = '\0';
len--;
}
if(len > 0)
{
modified = 1;
if(strstr(directory, "..") == directory && (!directory[2] || directory[2] == ((__runtimePlatform == 1) ? '\\' : '/') || directory[2] == '/'))
{
int strLen = strlen(fileName) - 1;

if(strLen > -1)
{
for(; strLen > -1 && (ch = fileName[strLen]) && (ch == '/' || ch == '\\'); strLen--)
;
for(; strLen > -1 && (ch = fileName[strLen]) && (ch != '/' && ch != '\\' && ch != ':'); strLen--)
;
for(; strLen > -1 && (ch = fileName[strLen]) && (ch == '/' || ch == '\\'); strLen--)
;
if(isURL)
{
int __simpleStruct0;

strLen = (__simpleStruct0 = urlFileName - fileName, (strLen > __simpleStruct0) ? strLen : __simpleStruct0);
}
if(!strcmp(fileName + strLen + 1, ".."))
{
strcat(fileName, "/");
strcat(fileName, "..");
}
else
{
if(__runtimePlatform == 1)
{
if(!strLen && fileName[0] == '\\' && fileName[1] == '\\')
{
if(!fileName[2])
return (((void *)0));
else
{
fileName[0] = '\\';
fileName[1] = '\\';
fileName[2] = '\0';
}
}
else
fileName[strLen + 1] = '\0';
}
else
{
fileName[strLen + 1] = '\0';
if(strLen < 0)
{
fileName[0] = '/';
fileName[1] = '\0';
strLen = 2;
}
}
}
}
else
{
strcpy(fileName, "..");
}
}
else if(strcmp(directory, "."))
{
int strLen = strlen(fileName);
unsigned int notZeroLen = strLen > 0;

if(strLen > 0 && (fileName[strLen - 1] == '/' || fileName[strLen - 1] == '\\'))
strLen--;
if(notZeroLen)
fileName[strLen++] = '/';
fileName[strLen] = '\0';
if(strLen + strlen(directory) > (797) - 3)
return (((void *)0));
strcat(fileName, directory);
}
}
if(isURL && ch == '/')
strcat(fileName, "/");
if(isURL && ch == '?')
{
strcat(fileName, addedPath + c);
break;
}
}
if(archiveName[0])
sprintf(string, "<%s>%s", archiveName, fileName);
else
strcpy(string, fileName);
}
return modified ? string : (((void *)0));
}

char * __ecereNameSpace__ecere__sys__PathCat(char * string, const char * addedPath)
{
unsigned int modified = 0;

if(addedPath)
{
char fileName[797] = "", archiveName[797] = "";
const char * file = (((void *)0));
int c = 0;
unsigned int isURL = 0;
unsigned int isArchive = __ecereNameSpace__ecere__sys__SplitArchivePath(string, archiveName, &file);
char * urlFileName = (((void *)0));
char * protocolSymbol;

strcpy(fileName, isArchive ? file : string);
if(!isArchive)
{
protocolSymbol = (fileName[0] && fileName[0] != '.' && fileName[0] != '/' && fileName[0] != '\\' && fileName[1] != ':') ? strstr(fileName, "://") : (((void *)0));
if(protocolSymbol)
{
char * slash = strstr(protocolSymbol + 3, "/");

isURL = 1;
if(slash)
urlFileName = slash;
else
urlFileName = fileName + strlen(fileName);
}
}
protocolSymbol = (addedPath[0] && addedPath[0] != '.' && addedPath[0] != '/' && addedPath[0] != '\\' && addedPath[1] != ':') ? strstr(addedPath, "://") : (((void *)0));
if(protocolSymbol)
{
int len = protocolSymbol - addedPath + 3;

memcpy(fileName, addedPath, len);
fileName[len] = 0;
isURL = 1;
c = len;
}
else if(runtimePlatform == 1)
{
if(addedPath[0] && addedPath[1] == ':' && addedPath[0] != '<')
{
fileName[0] = (char)toupper(addedPath[0]);
fileName[1] = ':';
fileName[2] = '\0';
c = 2;
modified = 1;
}
else if(addedPath[0] == '\\' && addedPath[1] == '\\')
{
fileName[0] = fileName[1] = '\\';
fileName[2] = '\0';
c = 2;
modified = 1;
}
else if(fileName[0] == '/' && !archiveName[0] && strcmp(addedPath, "/"))
return (((void *)0));
}
if(!modified && isURL && (addedPath[0] == '\\' || addedPath[0] == '/'))
{
urlFileName[0] = '/';
urlFileName[1] = '\0';
}
else if(!modified && (addedPath[0] == '\\' || addedPath[0] == '/'))
{
if(runtimePlatform == 1)
{
if(addedPath[0] == '/' && !addedPath[1])
{
fileName[0] = addedPath[0];
fileName[1] = '\0';
modified = 1;
}
else if(fileName[0] && fileName[1] == ':')
{
fileName[2] = '\0';
modified = 1;
}
else
{
fileName[0] = '\\';
fileName[1] = '\0';
modified = 1;
}
}
else
{
fileName[0] = '/';
fileName[1] = '\0';
modified = 1;
}
c = 1;
}
for(; addedPath[c]; )
{
char directory[4384];
int len = 0;
char ch;
int count;

for(; (ch = addedPath[c]) && (ch == '/' || ch == '\\'); c++)
;
for(; (ch = addedPath[c]) && (ch != '/' && ch != '\\'); c++)
{
if(isURL && ch == '?')
{
break;
}
if(len < (274))
directory[len++] = ch;
}
directory[len] = '\0';
for(count = len - 1; count >= 0 && (directory[count] == ' ' || directory[count] == '\t'); count--)
{
directory[count] = '\0';
len--;
}
if(len > 0)
{
modified = 1;
if(strstr(directory, "..") == directory && (!directory[2] || directory[2] == ((__runtimePlatform == 1) ? '\\' : '/')))
{
int strLen = strlen(fileName) - 1;

if(strLen > -1)
{
unsigned int separator = 0;

for(; strLen > -1 && (ch = fileName[strLen]) && (ch == '/' || ch == '\\'); strLen--)
;
for(; strLen > -1 && (ch = fileName[strLen]) && (ch != '/' && ch != '\\' && ch != ':'); strLen--)
;
for(; strLen > -1 && (ch = fileName[strLen]) && (ch == '/' || ch == '\\'); strLen--)
separator = 1;
if(isURL)
{
int __simpleStruct0;

strLen = (__simpleStruct0 = urlFileName - fileName, (strLen > __simpleStruct0) ? strLen : __simpleStruct0);
}
if(!strcmp(fileName + strLen + (separator ? 2 : 1), ".."))
{
strcat(fileName, ((__runtimePlatform == 1) ? "\\" : "/"));
strcat(fileName, "..");
}
else
{
if(runtimePlatform == 1)
{
if(!strLen && fileName[0] == '\\' && fileName[1] == '\\')
{
if(!fileName[2])
return (((void *)0));
else
{
fileName[0] = '\\';
fileName[1] = '\\';
fileName[2] = '\0';
}
}
else
fileName[strLen + 1] = '\0';
}
else
{
fileName[strLen + 1] = '\0';
if(strLen < 0)
{
fileName[0] = '/';
fileName[1] = '\0';
strLen = 2;
}
}
}
}
else
{
strcpy(fileName, "..");
}
}
else if(strcmp(directory, "."))
{
int strLen = strlen(fileName);
unsigned int notZeroLen = strLen > 0;

if(strLen > 0 && (fileName[strLen - 1] == '/' || fileName[strLen - 1] == '\\'))
strLen--;
if(notZeroLen)
{
if(isURL)
fileName[strLen++] = '/';
else
fileName[strLen++] = ((__runtimePlatform == 1) ? '\\' : '/');
}
fileName[strLen] = '\0';
if(strLen + strlen(directory) > (797) - 3)
return (((void *)0));
strcat(fileName, directory);
}
}
if(isURL && ch == '/')
strcat(fileName, "/");
if(isURL && ch == '?')
{
strcat(fileName, addedPath + c);
break;
}
}
if(archiveName[0])
sprintf(string, "<%s>%s", archiveName, fileName);
else
strcpy(string, fileName);
}
return modified ? string : (((void *)0));
}

char * __ecereNameSpace__ecere__sys__MakePathRelative(const char * path, const char * to, char * destination)
{
int len;

if(!path[0])
memmove(destination, path, strlen(path) + 1);
else
{
char pathPart[4384], pathRest[797];
char toPart[4384], toRest[797];
unsigned int different = 0;

strcpy(pathRest, path);
strcpy(toRest, to);
destination[0] = '\0';
for(; toRest[0]; )
{
__ecereNameSpace__ecere__sys__SplitDirectory(toRest, toPart, toRest);
if(!different)
__ecereNameSpace__ecere__sys__SplitDirectory(pathRest, pathPart, pathRest);
if(different || ((__runtimePlatform == 1) ? (strcasecmp) : strcmp)(toPart, pathPart))
{
different = 1;
strcat(destination, "..");
strcat(destination, ((__runtimePlatform == 1) ? "\\" : "/"));
}
}
if(different)
__ecereNameSpace__ecere__sys__PathCat(destination, pathPart);
for(; pathRest[0]; )
{
__ecereNameSpace__ecere__sys__SplitDirectory(pathRest, pathPart, pathRest);
__ecereNameSpace__ecere__sys__PathCat(destination, pathPart);
}
}
len = strlen(destination);
if(len > 1 && (destination[len - 1] == '/' || destination[len - 1] == '\\'))
destination[--len] = '\0';
return destination;
}

struct __ecereNameSpace__ecere__com__Property;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__ZString_string, * __ecerePropM___ecereNameSpace__ecere__sys__ZString_string;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__ZString_char__PTR_, * __ecerePropM___ecereNameSpace__ecere__sys__ZString_char__PTR_;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__ZString_String, * __ecerePropM___ecereNameSpace__ecere__sys__ZString_String;

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} ecere_gcc_struct;

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

extern void __ecereNameSpace__ecere__com__eEnum_AddFixedValue(struct __ecereNameSpace__ecere__com__Class * _class, const char *  string, long long value);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  dataType, void *  setStmt, void *  getStmt, int declMode);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

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

const char *  __ecereProp___ecereNameSpace__ecere__sys__ZString_Get_string(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__sys__ZString_Set_string(struct __ecereNameSpace__ecere__com__Instance * this, const char *  value);

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

const char *  __ecereProp___ecereNameSpace__ecere__sys__ZString_Get_char__PTR_(struct __ecereNameSpace__ecere__com__Instance * this);

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__sys__ZString_Set_char__PTR_(const char *  value);

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

struct __ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_RegisterDefine(const char *  name, const char *  value, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(const char *  name, const char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, const char *  name, const char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BackSlashEscaping;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__StringAllocType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__ZString;

extern int __ecereNameSpace__ecere__com__PrintStdArgsToBuffer(char *  buffer, int maxLen, struct __ecereNameSpace__ecere__com__Class * class, const void * object, __builtin_va_list args);

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

unsigned int __ecereConstructor___ecereNameSpace__ecere__sys__ZString(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__ZString * __ecerePointer___ecereNameSpace__ecere__sys__ZString = (struct __ecereNameSpace__ecere__sys__ZString *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset) : 0);

{
__ecerePointer___ecereNameSpace__ecere__sys__ZString->maxSize = (((int)0x7fffffff));
}
return 1;
}

void __ecereDestructor___ecereNameSpace__ecere__sys__ZString(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__ZString * __ecerePointer___ecereNameSpace__ecere__sys__ZString = (struct __ecereNameSpace__ecere__sys__ZString *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset) : 0);

{
if(__ecerePointer___ecereNameSpace__ecere__sys__ZString->allocType == 2)
(__ecereNameSpace__ecere__com__eSystem_Delete(__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string), __ecerePointer___ecereNameSpace__ecere__sys__ZString->_string = 0);
}
}

void __ecereMethod___ecereNameSpace__ecere__sys__ZString_copyString(struct __ecereNameSpace__ecere__com__Instance * this, const char * value, int newLen)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__ZString * __ecerePointer___ecereNameSpace__ecere__sys__ZString = (struct __ecereNameSpace__ecere__sys__ZString *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset) : 0);

if(__ecerePointer___ecereNameSpace__ecere__sys__ZString->allocType == 0)
{
__ecerePointer___ecereNameSpace__ecere__sys__ZString->size = 0;
__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string = (((void *)0));
__ecerePointer___ecereNameSpace__ecere__sys__ZString->allocType = 2;
}
if(__ecerePointer___ecereNameSpace__ecere__sys__ZString->allocType == 2)
{
int newSize = newLen ? newLen + 1 : 0;

if(newSize != __ecerePointer___ecereNameSpace__ecere__sys__ZString->size)
{
if(newSize < __ecerePointer___ecereNameSpace__ecere__sys__ZString->minSize)
newSize = __ecerePointer___ecereNameSpace__ecere__sys__ZString->minSize;
else if(newSize > __ecerePointer___ecereNameSpace__ecere__sys__ZString->maxSize)
newSize = __ecerePointer___ecereNameSpace__ecere__sys__ZString->maxSize;
if(newSize && __ecerePointer___ecereNameSpace__ecere__sys__ZString->size)
__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string, sizeof(char) * (newSize));
else if(newSize)
__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (newSize));
else
(__ecereNameSpace__ecere__com__eSystem_Delete(__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string), __ecerePointer___ecereNameSpace__ecere__sys__ZString->_string = 0);
__ecerePointer___ecereNameSpace__ecere__sys__ZString->size = newSize;
}
}
if(newLen + 1 > __ecerePointer___ecereNameSpace__ecere__sys__ZString->size)
newLen = __ecerePointer___ecereNameSpace__ecere__sys__ZString->size - 1;
__ecerePointer___ecereNameSpace__ecere__sys__ZString->len = newLen;
if(value)
{
memcpy(__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string, value, newLen);
__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string[newLen] = 0;
}
}

const char * __ecereMethod___ecereNameSpace__ecere__sys__ZString_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance * this, char * tempString, void * fieldData, unsigned int * onType)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__ZString * __ecerePointer___ecereNameSpace__ecere__sys__ZString = (struct __ecereNameSpace__ecere__sys__ZString *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__ZString->_string;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__ZString_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance ** this, const char * string)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__ZString * __ecerePointer___ecereNameSpace__ecere__sys__ZString = (struct __ecereNameSpace__ecere__sys__ZString *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset) : 0);

__ecereProp___ecereNameSpace__ecere__sys__ZString_Set_string((*this), (char *)string);
return 1;
}

const char *  __ecereProp___ecereNameSpace__ecere__sys__ZString_Get_string(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__ZString * __ecerePointer___ecereNameSpace__ecere__sys__ZString = (struct __ecereNameSpace__ecere__sys__ZString *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__ZString->_string;
}

const char *  __ecereProp___ecereNameSpace__ecere__sys__ZString_Get_char__PTR_(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__ZString * __ecerePointer___ecereNameSpace__ecere__sys__ZString = (struct __ecereNameSpace__ecere__sys__ZString *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__ZString->_string;
}

const char * __ecereProp___ecereNameSpace__ecere__sys__ZString_Get_String(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__ZString * __ecerePointer___ecereNameSpace__ecere__sys__ZString = (struct __ecereNameSpace__ecere__sys__ZString *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__ZString->_string;
}

void __ecereMethod___ecereNameSpace__ecere__sys__ZString_concatf(struct __ecereNameSpace__ecere__com__Instance * this, const char * format, ...)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__ZString * __ecerePointer___ecereNameSpace__ecere__sys__ZString = (struct __ecereNameSpace__ecere__sys__ZString *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset) : 0);

if(format && __ecerePointer___ecereNameSpace__ecere__sys__ZString->allocType != 0)
{
int __simpleStruct0;
int addedLen, n;
va_list args;

if(__ecerePointer___ecereNameSpace__ecere__sys__ZString->size < __ecerePointer___ecereNameSpace__ecere__sys__ZString->minSize)
{
__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string, sizeof(char) * (__ecerePointer___ecereNameSpace__ecere__sys__ZString->minSize));
__ecerePointer___ecereNameSpace__ecere__sys__ZString->size = __ecerePointer___ecereNameSpace__ecere__sys__ZString->minSize;
}
n = (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__sys__ZString->size - 1 - __ecerePointer___ecereNameSpace__ecere__sys__ZString->len, (0 > __simpleStruct0) ? 0 : __simpleStruct0);
if(n < 64)
{
int __simpleStruct0;

__ecerePointer___ecereNameSpace__ecere__sys__ZString->size += 64 - n;
__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string, sizeof(char) * (__ecerePointer___ecereNameSpace__ecere__sys__ZString->size));
n = (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__sys__ZString->size - 1 - __ecerePointer___ecereNameSpace__ecere__sys__ZString->len, (0 > __simpleStruct0) ? 0 : __simpleStruct0);
}
while(1)
{
int __simpleStruct2;
int __simpleStruct1;
int __simpleStruct0;

__builtin_va_start(args, format);
addedLen = vsnprintf(__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string + __ecerePointer___ecereNameSpace__ecere__sys__ZString->len, n, format, args);
if(addedLen >= 0 && addedLen < n)
break;
addedLen = (__simpleStruct1 = n + (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__sys__ZString->size / 2, (1 > __simpleStruct0) ? 1 : __simpleStruct0), (__simpleStruct1 > addedLen) ? __simpleStruct1 : addedLen);
__ecerePointer___ecereNameSpace__ecere__sys__ZString->size += addedLen + 1 - n;
__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string, sizeof(char) * (__ecerePointer___ecereNameSpace__ecere__sys__ZString->size));
n = (__simpleStruct2 = __ecerePointer___ecereNameSpace__ecere__sys__ZString->size - 1 - __ecerePointer___ecereNameSpace__ecere__sys__ZString->len, (0 > __simpleStruct2) ? 0 : __simpleStruct2);
}
if(addedLen > 0)
{
__ecerePointer___ecereNameSpace__ecere__sys__ZString->len += addedLen;
__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string[__ecerePointer___ecereNameSpace__ecere__sys__ZString->len] = 0;
}
__builtin_va_end(args);
}
}

void __ecereMethod___ecereNameSpace__ecere__sys__ZString_concat(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * s)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__ZString * __ecerePointer___ecereNameSpace__ecere__sys__ZString = (struct __ecereNameSpace__ecere__sys__ZString *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset) : 0);

if(s && __ecerePointer___ecereNameSpace__ecere__sys__ZString->allocType != 0)
{
int addedLen = ((struct __ecereNameSpace__ecere__sys__ZString *)(((char *)s + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset)))->len;
int newLen = __ecerePointer___ecereNameSpace__ecere__sys__ZString->len + addedLen;

if(__ecerePointer___ecereNameSpace__ecere__sys__ZString->allocType == 2 && newLen + 1 > __ecerePointer___ecereNameSpace__ecere__sys__ZString->size)
{
int newSize = newLen + 1;

if(newSize > __ecerePointer___ecereNameSpace__ecere__sys__ZString->maxSize)
newSize = __ecerePointer___ecereNameSpace__ecere__sys__ZString->maxSize;
if(newSize > __ecerePointer___ecereNameSpace__ecere__sys__ZString->size)
{
__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string, sizeof(char) * (newSize));
__ecerePointer___ecereNameSpace__ecere__sys__ZString->size = newSize;
}
}
if(newLen + 1 > __ecerePointer___ecereNameSpace__ecere__sys__ZString->size)
addedLen = __ecerePointer___ecereNameSpace__ecere__sys__ZString->size - 1 - __ecerePointer___ecereNameSpace__ecere__sys__ZString->len;
if(addedLen > 0)
{
memcpy(__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string + __ecerePointer___ecereNameSpace__ecere__sys__ZString->len, ((struct __ecereNameSpace__ecere__sys__ZString *)(((char *)s + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset)))->_string, addedLen);
__ecerePointer___ecereNameSpace__ecere__sys__ZString->len += addedLen;
__ecerePointer___ecereNameSpace__ecere__sys__ZString->_string[__ecerePointer___ecereNameSpace__ecere__sys__ZString->len] = 0;
}
if(((struct __ecereNameSpace__ecere__sys__ZString *)(((char *)s + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset)))->allocType == 0)
(__ecereNameSpace__ecere__com__eInstance_DecRef(s), s = 0);
}
}

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__sys__ZString_Set_char__PTR_(const char *  value)
{
return __extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__ZString);

((struct __ecereNameSpace__ecere__sys__ZString *)(((char *)__ecereInstance1 + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset)))->len = value ? strlen(value) : 0, ((struct __ecereNameSpace__ecere__sys__ZString *)(((char *)__ecereInstance1 + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset)))->_string = (char *)value, ((struct __ecereNameSpace__ecere__sys__ZString *)(((char *)__ecereInstance1 + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset)))->allocType = 0, __ecereInstance1;
});
}

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__sys__ZString_Set_String(const char * value)
{
return __extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__ZString);

((struct __ecereNameSpace__ecere__sys__ZString *)(((char *)__ecereInstance1 + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset)))->len = value ? strlen(value) : 0, ((struct __ecereNameSpace__ecere__sys__ZString *)(((char *)__ecereInstance1 + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset)))->_string = (char *)value, ((struct __ecereNameSpace__ecere__sys__ZString *)(((char *)__ecereInstance1 + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset)))->allocType = 0, __ecereInstance1;
});
}

void __ecereUnregisterModule_String(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__sys__ZString_string = (void *)0;
}

void __ecereProp___ecereNameSpace__ecere__sys__ZString_Set_string(struct __ecereNameSpace__ecere__com__Instance * this, const char *  value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__ZString * __ecerePointer___ecereNameSpace__ecere__sys__ZString = (struct __ecereNameSpace__ecere__sys__ZString *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset) : 0);

__ecereMethod___ecereNameSpace__ecere__sys__ZString_copyString(this, value, value ? strlen(value) : 0);
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__ZString_string), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__ZString_string);
}

void __ecereMethod___ecereNameSpace__ecere__sys__ZString_copy(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * s)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__ZString * __ecerePointer___ecereNameSpace__ecere__sys__ZString = (struct __ecereNameSpace__ecere__sys__ZString *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset) : 0);

__ecereMethod___ecereNameSpace__ecere__sys__ZString_copyString(this, ((struct __ecereNameSpace__ecere__sys__ZString *)(((char *)s + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset)))->_string, ((struct __ecereNameSpace__ecere__sys__ZString *)(((char *)s + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset)))->len);
}

void __ecereMethod___ecereNameSpace__ecere__sys__ZString_concatx(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, const void * object, ...)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__ZString * __ecerePointer___ecereNameSpace__ecere__sys__ZString = (struct __ecereNameSpace__ecere__sys__ZString *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__ZString->offset) : 0);

if(__ecerePointer___ecereNameSpace__ecere__sys__ZString->allocType != 0)
{
char string[1025];
va_list args;

__builtin_va_start(args, object);
__ecereNameSpace__ecere__com__PrintStdArgsToBuffer(string, sizeof (string), class, object, args);
__ecereMethod___ecereNameSpace__ecere__sys__ZString_concat(this, __ecereProp___ecereNameSpace__ecere__sys__ZString_Set_char__PTR_(string));
__builtin_va_end(args);
}
}

void __ecereRegisterModule_String(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::sys::DIR_SEP", "(__runtimePlatform == win32) ? '\\\\' : '/'", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::sys::DIR_SEPS", "(__runtimePlatform == win32) ? \"\\\\\" : \"/\"", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::sys::MAX_F_STRING", "1025", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::sys::MAX_EXTENSION", "17", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::sys::MAX_FILENAME", "274", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::sys::MAX_DIRECTORY", "534", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::sys::MAX_LOCATION", "797", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetExtension", "char * ecere::sys::GetExtension(const char * string, char * output)", __ecereNameSpace__ecere__sys__GetExtension, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::StripLastDirectory", "char * ecere::sys::StripLastDirectory(const char * string, char * output)", __ecereNameSpace__ecere__sys__StripLastDirectory, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::SplitDirectory", "char * ecere::sys::SplitDirectory(const char * string, char * part, char * rest)", __ecereNameSpace__ecere__sys__SplitDirectory, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetLastDirectory", "char * ecere::sys::GetLastDirectory(const char * string, char * output)", __ecereNameSpace__ecere__sys__GetLastDirectory, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::SplitArchivePath", "bool ecere::sys::SplitArchivePath(const char * fileName, char * archiveName, const char * * archiveFile)", __ecereNameSpace__ecere__sys__SplitArchivePath, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::PathCatSlash", "char * ecere::sys::PathCatSlash(char * string, const char * addedPath)", __ecereNameSpace__ecere__sys__PathCatSlash, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::PathCat", "char * ecere::sys::PathCat(char * string, const char * addedPath)", __ecereNameSpace__ecere__sys__PathCat, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::MakePathRelative", "char * ecere::sys::MakePathRelative(const char * path, const char * to, char * destination)", __ecereNameSpace__ecere__sys__MakePathRelative, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::StripExtension", "bool ecere::sys::StripExtension(char * string)", __ecereNameSpace__ecere__sys__StripExtension, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::ChangeExtension", "char * ecere::sys::ChangeExtension(const char * string, const char * ext, char * output)", __ecereNameSpace__ecere__sys__ChangeExtension, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::PrintSize", "void ecere::sys::PrintSize(char * string, uint64 size, int prec)", __ecereNameSpace__ecere__sys__PrintSize, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::PrintBigSize", "void ecere::sys::PrintBigSize(char * string, double size, int prec)", __ecereNameSpace__ecere__sys__PrintBigSize, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::SearchString", "char * ecere::sys::SearchString(const char * buffer, int start, const char * subStr, bool matchCase, bool matchWord)", __ecereNameSpace__ecere__sys__SearchString, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::RSearchString", "char * ecere::sys::RSearchString(const char * buffer, const char * subStr, int maxLen, bool matchCase, bool matchWord)", __ecereNameSpace__ecere__sys__RSearchString, module, 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::sys::BackSlashEscaping", "bool", 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__BackSlashEscaping = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "forArgsPassing", 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::Tokenize", "int ecere::sys::Tokenize(char * string, int maxTokens, char * tokens[], ecere::sys::BackSlashEscaping esc)", __ecereNameSpace__ecere__sys__Tokenize, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::TokenizeWith", "int ecere::sys::TokenizeWith(char * string, int maxTokens, char * tokens[], const char * tokenizers, bool escapeBackSlashes)", __ecereNameSpace__ecere__sys__TokenizeWith, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::TrimLSpaces", "char * ecere::sys::TrimLSpaces(const char * string, char * output)", __ecereNameSpace__ecere__sys__TrimLSpaces, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::TrimRSpaces", "char * ecere::sys::TrimRSpaces(const char * string, char * output)", __ecereNameSpace__ecere__sys__TrimRSpaces, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::ChangeCh", "void ecere::sys::ChangeCh(char * string, char ch1, char ch2)", __ecereNameSpace__ecere__sys__ChangeCh, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::ChangeChars", "void ecere::sys::ChangeChars(char * string, const char * chars, char alt)", __ecereNameSpace__ecere__sys__ChangeChars, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::RepeatCh", "void ecere::sys::RepeatCh(char * string, int count, char ch)", __ecereNameSpace__ecere__sys__RepeatCh, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::CopyString", "char * ecere::sys::CopyString(const char * string)", __ecereNameSpace__ecere__sys__CopyString, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetString", "bool ecere::sys::GetString(const char * * buffer, char * string, int max)", __ecereNameSpace__ecere__sys__GetString, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetValue", "int ecere::sys::GetValue(const char * * buffer)", __ecereNameSpace__ecere__sys__GetValue, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetHexValue", "uint ecere::sys::GetHexValue(const char * * buffer)", __ecereNameSpace__ecere__sys__GetHexValue, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::StripQuotes", "char * ecere::sys::StripQuotes(const char * string, char * output)", __ecereNameSpace__ecere__sys__StripQuotes, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::FloatFromString", "double ecere::sys::FloatFromString(const char * string)", __ecereNameSpace__ecere__sys__FloatFromString, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::IsPathInsideOf", "bool ecere::sys::IsPathInsideOf(const char * path, const char * of)", __ecereNameSpace__ecere__sys__IsPathInsideOf, module, 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::sys::StringAllocType", 0, 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__StringAllocType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "pointer", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "stack", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "heap", 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::sys::ZString", 0, sizeof(struct __ecereNameSpace__ecere__sys__ZString), 0, (void *)__ecereConstructor___ecereNameSpace__ecere__sys__ZString, (void *)__ecereDestructor___ecereNameSpace__ecere__sys__ZString, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__ZString = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod___ecereNameSpace__ecere__sys__ZString_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetDataFromString", 0, __ecereMethod___ecereNameSpace__ecere__sys__ZString_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "concat", "void concat(ecere::sys::ZString s)", __ecereMethod___ecereNameSpace__ecere__sys__ZString_concat, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "concatf", "void concatf(const char * format, ...)", __ecereMethod___ecereNameSpace__ecere__sys__ZString_concatf, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "concatx", "void concatx(typed_object object, ...)", __ecereMethod___ecereNameSpace__ecere__sys__ZString_concatx, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "copy", "void copy(ecere::sys::ZString s)", __ecereMethod___ecereNameSpace__ecere__sys__ZString_copy, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "copyString", "void copyString(const char * value, int newLen)", __ecereMethod___ecereNameSpace__ecere__sys__ZString_copyString, 1);
__ecereProp___ecereNameSpace__ecere__sys__ZString_char__PTR_ = __ecereNameSpace__ecere__com__eClass_AddProperty(class, 0, "const char *", __ecereProp___ecereNameSpace__ecere__sys__ZString_Set_char__PTR_, __ecereProp___ecereNameSpace__ecere__sys__ZString_Get_char__PTR_, 1);
__ecereProp___ecereNameSpace__ecere__sys__ZString_String = __ecereNameSpace__ecere__com__eClass_AddProperty(class, 0, "const String", __ecereProp___ecereNameSpace__ecere__sys__ZString_Set_String, __ecereProp___ecereNameSpace__ecere__sys__ZString_Get_String, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_string", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "len", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "allocType", "ecere::sys::StringAllocType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "size", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "minSize", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "maxSize", "int", 4, 4, 1);
__ecerePropM___ecereNameSpace__ecere__sys__ZString_string = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "string", "const char *", __ecereProp___ecereNameSpace__ecere__sys__ZString_Set_string, __ecereProp___ecereNameSpace__ecere__sys__ZString_Get_string, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__sys__ZString_string = __ecerePropM___ecereNameSpace__ecere__sys__ZString_string, __ecerePropM___ecereNameSpace__ecere__sys__ZString_string = (void *)0;
}

