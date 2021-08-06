/* Code generated from eC source file: File.ec */
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

FILE * eC_stdin(void);

FILE * eC_stdout(void);

unsigned int FILE_GetSize(FILE * input);

unsigned int FILE_Lock(FILE * input, FILE * output, int type, uint64 start, uint64 length, unsigned int wait);

void FILE_set_buffered(FILE * input, FILE * output, unsigned int value);

unsigned int FILE_FileExists(const char * fileName);

unsigned int FILE_FileGetSize(const char * fileName, unsigned int * size);

void FILE_FileFixCase(char * file);

void FILE_FileOpen(const char * fileName, int mode, FILE ** input, FILE ** output);

int FILE_Seek64(FILE * f, long long offset, int origin);

struct __ecereNameSpace__ecere__sys__File
{
FILE * input, * output;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__sys__FileStats
{
unsigned int attribs;
uint64 size;
int64 accessed;
int64 modified;
int64 created;
} ecere_gcc_struct;

static int __ecereNameSpace__ecere__sys__openCount;

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__CreateTemporaryFile(char * tempFileName, const char * template)
{
return (((void *)0));
}

void __ecereNameSpace__ecere__sys__CreateTemporaryDir(char * tempFileName, const char * template)
{
}

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

extern void __ecereNameSpace__ecere__sys__PrintSize(char *  string, uint64 size, int prec);

extern double strtod(const char * , char * * );

extern char *  strstr(const char * , const char * );

extern void __ecereNameSpace__ecere__sys__PrintBigSize(char *  string, double size, int prec);

struct __ecereNameSpace__ecere__sys__TempFile
{
unsigned char *  buffer;
size_t size;
size_t position;
unsigned int eof;
int openMode;
size_t allocated;
} ecere_gcc_struct;

extern int fputs(const char * , void *  stream);

extern size_t strlen(const char * );

extern int atoi(const char * );

extern unsigned long strtoul(const char *  nptr, char * *  endptr, int base);

extern double __ecereNameSpace__ecere__sys__FloatFromString(const char *  string);

extern void __ecereNameSpace__ecere__sys__ChangeCh(char *  string, char ch1, char ch2);

extern char *  __ecereNameSpace__ecere__sys__CopyString(const char *  string);

extern char *  strcpy(char * , const char * );

struct __ecereNameSpace__ecere__com__BitMember;

struct __ecereNameSpace__ecere__com__GlobalFunction;

unsigned int __ecereNameSpace__ecere__sys__FileExists(const char * fileName)
{
return FILE_FileExists(fileName);
}

unsigned int __ecereNameSpace__ecere__sys__FileGetSize(const char * fileName, unsigned int * size)
{
unsigned int result = 0;

if(size)
{
*size = 0;
if(fileName)
{
result = FILE_FileGetSize(fileName, size);
}
}
return result;
}

void __ecereNameSpace__ecere__sys__FileFixCase(char * file)
{
FILE_FileFixCase(file);
}

unsigned int FILE_FileGetStats(const char * fileName, struct __ecereNameSpace__ecere__sys__FileStats * stats);

void __ecereNameSpace__ecere__sys__MakeSlashPath(char * p)
{
__ecereNameSpace__ecere__sys__FileFixCase(p);
if(__runtimePlatform == 1)
__ecereNameSpace__ecere__sys__ChangeCh(p, '\\', '/');
}

void __ecereNameSpace__ecere__sys__MakeSystemPath(char * p)
{
__ecereNameSpace__ecere__sys__FileFixCase(p);
}

unsigned int __ecereNameSpace__ecere__sys__FileGetStats(const char * fileName, struct __ecereNameSpace__ecere__sys__FileStats * stats)
{
unsigned int result = 0;

if(stats && fileName)
{
return FILE_FileGetStats(fileName, stats);
}
return result;
}

char * __ecereNameSpace__ecere__sys__CopyUnixPath(const char * p)
{
char * d = __ecereNameSpace__ecere__sys__CopyString(p);

if(d)
__ecereNameSpace__ecere__sys__MakeSlashPath(d);
return d;
}

char * __ecereNameSpace__ecere__sys__GetSlashPathBuffer(char * d, const char * p)
{
if(d != p)
strcpy(d, p ? p : "");
__ecereNameSpace__ecere__sys__MakeSlashPath(d);
return d;
}

char * __ecereNameSpace__ecere__sys__CopySystemPath(const char * p)
{
char * d = __ecereNameSpace__ecere__sys__CopyString(p);

if(d)
__ecereNameSpace__ecere__sys__MakeSystemPath(d);
return d;
}

char * __ecereNameSpace__ecere__sys__GetSystemPathBuffer(char * d, const char * p)
{
if(d != p)
strcpy(d, p ? p : "");
__ecereNameSpace__ecere__sys__MakeSystemPath(d);
return d;
}

struct __ecereNameSpace__ecere__com__Property;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__File_input, * __ecerePropM___ecereNameSpace__ecere__sys__File_input;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__File_output, * __ecerePropM___ecereNameSpace__ecere__sys__File_output;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__File_buffered, * __ecerePropM___ecereNameSpace__ecere__sys__File_buffered;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__File_eof, * __ecerePropM___ecereNameSpace__ecere__sys__File_eof;

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} ecere_gcc_struct;

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

extern unsigned int __ecereNameSpace__ecere__com__eClass_IsDerived(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class * from);

extern void __ecereNameSpace__ecere__com__eEnum_AddFixedValue(struct __ecereNameSpace__ecere__com__Class * _class, const char *  string, long long value);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  dataType, void *  setStmt, void *  getStmt, int declMode);

extern struct __ecereNameSpace__ecere__com__BitMember * __ecereNameSpace__ecere__com__eClass_AddBitMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, int bitSize, int bitPos, int declMode);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_Open;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_Exists;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_GetSize;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_Stats;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_FixCase;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_Find;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_FindNext;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_CloseDir;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_OpenArchive;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_QuerySize;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Tell;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Putc;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Truncate;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseInput;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseOutput;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Lock;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Unlock;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Close;

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

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__httpFileSystem;

void *  __ecereProp___ecereNameSpace__ecere__sys__File_Get_input(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__sys__File_Set_input(struct __ecereNameSpace__ecere__com__Instance * this, void *  value);

void *  __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__sys__File_Set_output(struct __ecereNameSpace__ecere__com__Instance * this, void *  value);

void __ecereProp___ecereNameSpace__ecere__sys__File_Set_buffered(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value);

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

extern int __ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData;

unsigned int __ecereConstructor___ecereNameSpace__ecere__sys__ConsoleFile(struct __ecereNameSpace__ecere__com__Instance * this)
{
__ecereProp___ecereNameSpace__ecere__sys__File_Set_input(this, eC_stdin());
__ecereProp___ecereNameSpace__ecere__sys__File_Set_output(this, eC_stdout());
return 1;
}

void __ecereDestructor___ecereNameSpace__ecere__sys__ConsoleFile(struct __ecereNameSpace__ecere__com__Instance * this)
{
{
__ecereProp___ecereNameSpace__ecere__sys__File_Set_input(this, (((void *)0)));
__ecereProp___ecereNameSpace__ecere__sys__File_Set_output(this, (((void *)0)));
}
}

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

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, void *  function, int declMode);

struct __ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, const char *  name, const char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(const char *  name, const char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__FileSize;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__FileSize64;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__FileSystem;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__FileOpenMode;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__FileSeekMode;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__FileLock;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__File;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__ConsoleFile;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__FileAttribs;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__SecSince1970;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__FileStats;

int __ecereMethod___ecereNameSpace__ecere__sys__FileSize_OnCompare(struct __ecereNameSpace__ecere__com__Class * class, unsigned int * this, unsigned int * data2)
{
int result = 0;

if(&(*this) && &(*data2))
{
if((*this) > (*data2))
result = 1;
else if((*this) < (*data2))
result = -1;
}
return result;
}

const char * __ecereMethod___ecereNameSpace__ecere__sys__FileSize_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, unsigned int * this, char * string, void * fieldData, unsigned int * onType)
{
__ecereNameSpace__ecere__sys__PrintSize(string, *(unsigned int *)this, 2);
return string;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__FileSize_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * class, unsigned int * this, const char * string)
{
char * end;
double value = strtod(string, &end);
unsigned int multiplier = 1;

if(strstr(end, "GB") || strstr(end, "gb"))
multiplier = (unsigned int)1024 * 1024 * 1024;
else if(strstr(end, "MB") || strstr(end, "mb"))
multiplier = (unsigned int)1024 * 1024;
else if(strstr(end, "KB") || strstr(end, "kb"))
multiplier = 1024;
(*this) = (unsigned int)((double)multiplier * value);
return 1;
}

int __ecereMethod___ecereNameSpace__ecere__sys__FileSize64_OnCompare(struct __ecereNameSpace__ecere__com__Class * class, uint64 * this, uint64 * data2)
{
int result = 0;

if(&(*this) && &(*data2))
{
if((*this) > (*data2))
result = 1;
else if((*this) < (*data2))
result = -1;
}
return result;
}

const char * __ecereMethod___ecereNameSpace__ecere__sys__FileSize64_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, uint64 * this, char * string, void * fieldData, unsigned int * onType)
{
__ecereNameSpace__ecere__sys__PrintBigSize(string, *(uint64 *)this, 2);
return string;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__FileSize64_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * class, uint64 * this, const char * string)
{
char * end;
double value = strtod(string, &end);
uint64 multiplier = 1;

if(strstr(end, "PB") || strstr(end, "pb"))
multiplier = (uint64)1024 * 1024 * 1024 * 1024;
else if(strstr(end, "TB") || strstr(end, "tb"))
multiplier = (uint64)1024 * 1024 * 1024 * 1024;
else if(strstr(end, "GB") || strstr(end, "gb"))
multiplier = (uint64)1024 * 1024 * 1024;
else if(strstr(end, "MB") || strstr(end, "mb"))
multiplier = (uint64)1024 * 1024;
else if(strstr(end, "KB") || strstr(end, "kb"))
multiplier = 1024;
(*this) = (uint64)((double)multiplier * value);
return 1;
}

extern int __ecereNameSpace__ecere__com__PrintStdArgsToBuffer(char *  buffer, int maxLen, struct __ecereNameSpace__ecere__com__Class * class, const void * object, __builtin_va_list args);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

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

void __ecereDestructor___ecereNameSpace__ecere__sys__File(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

{
if(__ecerePointer___ecereNameSpace__ecere__sys__File->output && __ecerePointer___ecereNameSpace__ecere__sys__File->output != __ecerePointer___ecereNameSpace__ecere__sys__File->input)
{
__ecereNameSpace__ecere__sys__openCount--;
fclose(__ecerePointer___ecereNameSpace__ecere__sys__File->output);
}
if(__ecerePointer___ecereNameSpace__ecere__sys__File->input)
{
__ecereNameSpace__ecere__sys__openCount--;
fclose(__ecerePointer___ecereNameSpace__ecere__sys__File->input);
}
__ecerePointer___ecereNameSpace__ecere__sys__File->input = (((void *)0));
__ecerePointer___ecereNameSpace__ecere__sys__File->output = (((void *)0));
}
}

size_t __ecereMethod___ecereNameSpace__ecere__sys__File_ReadData(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char * bytes, size_t numBytes)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, bytes, 1, numBytes) : (size_t)1;
}));
}

size_t __ecereMethod___ecereNameSpace__ecere__sys__File_WriteData(struct __ecereNameSpace__ecere__com__Instance * this, const unsigned char * bytes, size_t numBytes)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, bytes, 1, numBytes) : (size_t)1;
}));
}

const char * __ecereMethod___ecereNameSpace__ecere__sys__File_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance * this, char * tempString, void * fieldData, unsigned int * onType)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

if((struct __ecereNameSpace__ecere__com__Instance *)this)
{
__ecereNameSpace__ecere__sys__PrintSize(tempString, (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (uint64)1;
})), 2);
return tempString;
}
return (((void *)0));
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Seek(struct __ecereNameSpace__ecere__com__Instance * this, long long pos, int mode)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
unsigned int fmode = 0;

switch(mode)
{
case 0:
fmode = 0;
break;
case 2:
fmode = 2;
break;
case 1:
fmode = 1;
break;
}
return FILE_Seek64(__ecerePointer___ecereNameSpace__ecere__sys__File->input ? __ecerePointer___ecereNameSpace__ecere__sys__File->input : __ecerePointer___ecereNameSpace__ecere__sys__File->output, pos, fmode) != (-1);
}

uint64 __ecereMethod___ecereNameSpace__ecere__sys__File_Tell(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return (__ecerePointer___ecereNameSpace__ecere__sys__File->input ? ftell(__ecerePointer___ecereNameSpace__ecere__sys__File->input) : ftell(__ecerePointer___ecereNameSpace__ecere__sys__File->output));
}

size_t __ecereMethod___ecereNameSpace__ecere__sys__File_Read(struct __ecereNameSpace__ecere__com__Instance * this, void * buffer, size_t size, size_t count)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__File->input ? fread(buffer, size, count, __ecerePointer___ecereNameSpace__ecere__sys__File->input) : 0;
}

size_t __ecereMethod___ecereNameSpace__ecere__sys__File_Write(struct __ecereNameSpace__ecere__com__Instance * this, const void * buffer, size_t size, size_t count)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__File->output ? fwrite(buffer, size, count, __ecerePointer___ecereNameSpace__ecere__sys__File->output) : 0;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Getc(struct __ecereNameSpace__ecere__com__Instance * this, char * ch)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
int ich = fgetc(__ecerePointer___ecereNameSpace__ecere__sys__File->input);

if(ich != (-1))
{
if(ch)
*ch = (char)ich;
return 1;
}
return 0;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Putc(struct __ecereNameSpace__ecere__com__Instance * this, char ch)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return (fputc((int)ch, __ecerePointer___ecereNameSpace__ecere__sys__File->output) == (-1)) ? 0 : 1;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Puts(struct __ecereNameSpace__ecere__com__Instance * this, const char * string)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
unsigned int result = 0;

if(__ecerePointer___ecereNameSpace__ecere__sys__File->output)
{
result = (fputs(string, __ecerePointer___ecereNameSpace__ecere__sys__File->output) == (-1)) ? 0 : 1;
}
return result;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Eof(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__File->input ? feof(__ecerePointer___ecereNameSpace__ecere__sys__File->input) != 0 : 1;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Truncate(struct __ecereNameSpace__ecere__com__Instance * this, uint64 size)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

fprintf((bsl_stderr()), "WARNING:  File::Truncate unimplemented in ecereBootstrap.\n");
return 0;
}

uint64 __ecereMethod___ecereNameSpace__ecere__sys__File_GetSize(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return FILE_GetSize(__ecerePointer___ecereNameSpace__ecere__sys__File->input);
}

void __ecereMethod___ecereNameSpace__ecere__sys__File_CloseInput(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

if(__ecerePointer___ecereNameSpace__ecere__sys__File->input)
{
fclose(__ecerePointer___ecereNameSpace__ecere__sys__File->input);
if(__ecerePointer___ecereNameSpace__ecere__sys__File->output == __ecerePointer___ecereNameSpace__ecere__sys__File->input)
__ecerePointer___ecereNameSpace__ecere__sys__File->output = (((void *)0));
__ecerePointer___ecereNameSpace__ecere__sys__File->input = (((void *)0));
}
}

void __ecereMethod___ecereNameSpace__ecere__sys__File_CloseOutput(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

if(__ecerePointer___ecereNameSpace__ecere__sys__File->output)
{
fclose(__ecerePointer___ecereNameSpace__ecere__sys__File->output);
if(__ecerePointer___ecereNameSpace__ecere__sys__File->input == __ecerePointer___ecereNameSpace__ecere__sys__File->output)
__ecerePointer___ecereNameSpace__ecere__sys__File->input = (((void *)0));
__ecerePointer___ecereNameSpace__ecere__sys__File->output = (((void *)0));
}
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Lock(struct __ecereNameSpace__ecere__com__Instance * this, int type, uint64 start, uint64 length, unsigned int wait)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return FILE_Lock(__ecerePointer___ecereNameSpace__ecere__sys__File->input, __ecerePointer___ecereNameSpace__ecere__sys__File->output, type, start, length, wait);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Unlock(struct __ecereNameSpace__ecere__com__Instance * this, uint64 start, uint64 length, unsigned int wait)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return (__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, int type, uint64 start, uint64 length, unsigned int wait);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int type, uint64 start, uint64 length, unsigned int wait))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Lock]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, 0, start, length, wait) : (unsigned int)1;
}));
}

int __ecereMethod___ecereNameSpace__ecere__sys__File_Printf(struct __ecereNameSpace__ecere__com__Instance * this, const char * format, ...)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
int result = 0;

if(format)
{
char text[1025];
va_list args;

__builtin_va_start(args, format);
vsnprintf(text, sizeof (text), format, args);
text[sizeof (text) - 1] = 0;
if((__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, text) : (unsigned int)1;
})))
result = strlen(text);
__builtin_va_end(args);
}
return result;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Flush(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

fflush(__ecerePointer___ecereNameSpace__ecere__sys__File->output);
return 1;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(struct __ecereNameSpace__ecere__com__Instance * this, char * s, int max)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
int c = 0;
unsigned int result = 1;

s[c] = 0;
if((__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (unsigned int)1;
})))
{
result = 0;
}
else
{
while(c < max - 1)
{
char ch = 0;

if(!(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, &ch) : (unsigned int)1;
})))
{
result = 0;
break;
}
if(ch == '\n')
break;
if(ch != '\r')
s[c++] = ch;
}
}
s[c] = 0;
return result || c > 1;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_GetString(struct __ecereNameSpace__ecere__com__Instance * this, char * string, int max)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
int c;
char ch;
unsigned int quoted = 0;
unsigned int result = 1;

*string = 0;
while(1)
{
if(!(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, &ch) : (unsigned int)1;
})))
{
result = 0;
break;
}
if((ch != '\n') && (ch != '\r') && (ch != ' ') && (ch != ',') && (ch != '\t'))
break;
if((__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (unsigned int)1;
})))
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
if(!(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, &ch) : (unsigned int)1;
})))
{
c++;
result = 0;
break;
}
}
string[c] = 0;
}
return result;
}

void *  __ecereProp___ecereNameSpace__ecere__sys__File_Get_input(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__File->input;
}

void __ecereProp___ecereNameSpace__ecere__sys__File_Set_input(struct __ecereNameSpace__ecere__com__Instance * this, void *  value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__sys__File->input = value;
__ecereProp___ecereNameSpace__ecere__sys__File_input && __ecereProp___ecereNameSpace__ecere__sys__File_input->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__File_input) : (void)0, __ecerePropM___ecereNameSpace__ecere__sys__File_input && __ecerePropM___ecereNameSpace__ecere__sys__File_input->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__File_input) : (void)0;
}

void *  __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__File->output;
}

void __ecereProp___ecereNameSpace__ecere__sys__File_Set_output(struct __ecereNameSpace__ecere__com__Instance * this, void *  value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__sys__File->output = value;
__ecereProp___ecereNameSpace__ecere__sys__File_output && __ecereProp___ecereNameSpace__ecere__sys__File_output->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__File_output) : (void)0, __ecerePropM___ecereNameSpace__ecere__sys__File_output && __ecerePropM___ecereNameSpace__ecere__sys__File_output->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__File_output) : (void)0;
}

void __ecereProp___ecereNameSpace__ecere__sys__File_Set_buffered(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

FILE_set_buffered(__ecerePointer___ecereNameSpace__ecere__sys__File->input, __ecerePointer___ecereNameSpace__ecere__sys__File->output, value);
__ecereProp___ecereNameSpace__ecere__sys__File_buffered && __ecereProp___ecereNameSpace__ecere__sys__File_buffered->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__File_buffered) : (void)0, __ecerePropM___ecereNameSpace__ecere__sys__File_buffered && __ecerePropM___ecereNameSpace__ecere__sys__File_buffered->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__File_buffered) : (void)0;
}

unsigned int __ecereProp___ecereNameSpace__ecere__sys__File_Get_eof(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return (__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (unsigned int)1;
}));
}

int __ecereMethod___ecereNameSpace__ecere__sys__File_GetLineEx(struct __ecereNameSpace__ecere__com__Instance * this, char * s, int max, unsigned int * hasNewLineChar)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
int c = 0;

s[c] = '\0';
if(!(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (unsigned int)1;
})))
{
char ch = '\0';

while(c < max - 1)
{
if(!(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, &ch) : (unsigned int)1;
})))
break;
if(ch == '\n')
break;
if(ch != '\r')
s[c++] = ch;
}
if(hasNewLineChar)
*hasNewLineChar = (ch == '\n');
}
s[c] = '\0';
return c;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_CopyToFile(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * f)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
unsigned int result = 0;

if(f)
{
unsigned char buffer[65536];

result = 1;
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, 0, 0) : (unsigned int)1;
}));
while(!(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (unsigned int)1;
})))
{
size_t count = (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, buffer, 1, sizeof (buffer)) : (size_t)1;
}));

if(count && !(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, buffer, 1, count) : (size_t)1;
})))
{
result = 0;
break;
}
if(!count)
break;
}
}
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, 0, 0) : (unsigned int)1;
}));
return result;
}

void __ecereMethod___ecereNameSpace__ecere__sys__File_Close(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseOutput]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (void)1;
}));
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseInput]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (void)1;
}));
}

void __ecereMethod___ecereNameSpace__ecere__sys__File_PrintLn(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, const void * object, ...)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
va_list args;
char buffer[4096];
int len;

__builtin_va_start(args, object);
len = __ecereNameSpace__ecere__com__PrintStdArgsToBuffer(buffer, sizeof (buffer), class, object, args);
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, buffer, len) : (size_t)1;
}));
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, char ch);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, char ch))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Putc]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, '\n') : (unsigned int)1;
}));
__builtin_va_end(args);
}

void __ecereMethod___ecereNameSpace__ecere__sys__File_Print(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, const void * object, ...)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
va_list args;
char buffer[4096];
int len;

__builtin_va_start(args, object);
len = __ecereNameSpace__ecere__com__PrintStdArgsToBuffer(buffer, sizeof (buffer), class, object, args);
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  data, size_t numBytes))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, buffer, len) : (size_t)1;
}));
__builtin_va_end(args);
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpen(const char * fileName, int mode)
{
struct __ecereNameSpace__ecere__com__Instance * result = (((void *)0));

if(fileName)
{
if(strstr(fileName, "File://") == fileName)
{
result = (struct __ecereNameSpace__ecere__com__Instance *)(uintptr_t)strtoull(fileName + 7, (((void *)0)), 16);
if(result)
{
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)result)->_class && __ecereNameSpace__ecere__com__eClass_IsDerived(((struct __ecereNameSpace__ecere__com__Instance *)(char *)result)->_class, __ecereClass___ecereNameSpace__ecere__sys__File))
{
if(!((struct __ecereNameSpace__ecere__com__Instance *)(char *)result)->_refCount)
result->_refCount++;
result->_refCount++;
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = result;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(result, 0, 0) : (unsigned int)1;
}));
}
else
result = (((void *)0));
}
}
else
{
struct __ecereNameSpace__ecere__com__Instance * file = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__File);

if(file)
{
FILE_FileOpen(fileName, mode, &((struct __ecereNameSpace__ecere__sys__File *)(((char *)file + __ecereClass___ecereNameSpace__ecere__sys__File->offset)))->input, &((struct __ecereNameSpace__ecere__sys__File *)(((char *)file + __ecereClass___ecereNameSpace__ecere__sys__File->offset)))->output);
if(!__ecereProp___ecereNameSpace__ecere__sys__File_Get_input(file) && !__ecereProp___ecereNameSpace__ecere__sys__File_Get_output(file))
;
else
{
__ecereNameSpace__ecere__sys__openCount++;
result = file;
}
if(!result)
{
(__ecereNameSpace__ecere__com__eInstance_DecRef(file), file = 0);
}
}
}
}
return result;
}

void __ecereUnregisterModule_File(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__sys__File_input = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__File_output = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__File_buffered = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__File_eof = (void *)0;
}

int __ecereMethod___ecereNameSpace__ecere__sys__File_GetValue(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
char string[32];

__ecereMethod___ecereNameSpace__ecere__sys__File_GetString(this, string, sizeof (string));
return atoi(string);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_GetHexValue(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
char string[32];

__ecereMethod___ecereNameSpace__ecere__sys__File_GetString(this, string, sizeof (string));
return (unsigned int)strtoul(string, (((void *)0)), 16);
}

float __ecereMethod___ecereNameSpace__ecere__sys__File_GetFloat(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
char string[32];

__ecereMethod___ecereNameSpace__ecere__sys__File_GetString(this, string, sizeof (string));
return (float)__ecereNameSpace__ecere__sys__FloatFromString(string);
}

double __ecereMethod___ecereNameSpace__ecere__sys__File_GetDouble(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
char string[32];

__ecereMethod___ecereNameSpace__ecere__sys__File_GetString(this, string, sizeof (string));
return __ecereNameSpace__ecere__sys__FloatFromString(string);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance ** this, const char * string)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

if(!string[0])
{
(*this) = (((void *)0));
return 1;
}
else
{
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__sys__FileOpen(string, 1);

if(f)
{
(*this) = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);
while(!(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof]);
__internal_VirtualMethod ? __internal_VirtualMethod(f) : (unsigned int)1;
})))
{
unsigned char buffer[4096];
size_t read = (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, buffer, 1, sizeof (buffer)) : (size_t)1;
}));

(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = (*this);

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write]);
__internal_VirtualMethod ? __internal_VirtualMethod((*this), buffer, 1, read) : (size_t)1;
}));
}
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
return 1;
}
}
return 0;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_CopyTo(struct __ecereNameSpace__ecere__com__Instance * this, const char * outputFileName)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
unsigned int result = 0;
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__sys__FileOpen(outputFileName, 2);

if(f)
{
unsigned char buffer[65536];

result = 1;
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, 0, 0) : (unsigned int)1;
}));
while(!(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (unsigned int)1;
})))
{
size_t count = (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, buffer, 1, sizeof (buffer)) : (size_t)1;
}));

if(count && !(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, buffer, 1, count) : (size_t)1;
})))
{
result = 0;
break;
}
if(!count)
break;
}
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, 0, 0) : (unsigned int)1;
}));
return result;
}

void __ecereRegisterModule_File(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(3, "ecere::sys::FileSize", "uint", 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__FileSize = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnCompare", 0, __ecereMethod___ecereNameSpace__ecere__sys__FileSize_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod___ecereNameSpace__ecere__sys__FileSize_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetDataFromString", 0, __ecereMethod___ecereNameSpace__ecere__sys__FileSize_OnGetDataFromString, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(3, "ecere::sys::FileSize64", "uint64", 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__FileSize64 = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnCompare", 0, __ecereMethod___ecereNameSpace__ecere__sys__FileSize64_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod___ecereNameSpace__ecere__sys__FileSize64_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetDataFromString", 0, __ecereMethod___ecereNameSpace__ecere__sys__FileSize64_OnGetDataFromString, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::sys::FileSystem", 0, 0, 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__FileSystem = class;
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Open", "ecere::sys::File ::Open(const char * archive, const char * name, ecere::sys::FileOpenMode mode)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Exists", "ecere::sys::FileAttribs ::Exists(const char * archive, const char * fileName)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetSize", "bool ::GetSize(const char * archive, const char * fileName, ecere::sys::FileSize * size)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Stats", "bool ::Stats(const char * archive, const char * fileName, ecere::sys::FileStats stats)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "FixCase", "void ::FixCase(const char * archive, char * fileName)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Find", "bool ::Find(FileDesc file, const char * archive, const char * name)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "FindNext", "bool ::FindNext(FileDesc file)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "CloseDir", "void ::CloseDir(FileDesc file)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "OpenArchive", "Archive ::OpenArchive(const char * fileName, ArchiveOpenFlags create)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "QuerySize", "bool ::QuerySize(const char * fileName, ecere::sys::FileSize * size)", 0, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::sys::FileOpenMode", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__FileOpenMode = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "read", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "write", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "append", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "readWrite", 4);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "writeRead", 5);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "appendRead", 6);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::sys::FileSeekMode", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__FileSeekMode = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "start", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "current", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "end", 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::sys::FileLock", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__FileLock = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "unlocked", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "shared", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "exclusive", 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::sys::File", "ecere::com::IOChannel", sizeof(struct __ecereNameSpace__ecere__sys__File), 0, (void *)0, (void *)__ecereDestructor___ecereNameSpace__ecere__sys__File, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__File = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod___ecereNameSpace__ecere__sys__File_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetDataFromString", 0, __ecereMethod___ecereNameSpace__ecere__sys__File_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "WriteData", 0, __ecereMethod___ecereNameSpace__ecere__sys__File_WriteData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "ReadData", 0, __ecereMethod___ecereNameSpace__ecere__sys__File_ReadData, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Seek", "bool Seek(long long pos, ecere::sys::FileSeekMode mode)", __ecereMethod___ecereNameSpace__ecere__sys__File_Seek, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Tell", "uint64 Tell(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_Tell, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Read", "uintsize Read(void * buffer, uintsize size, uintsize count)", __ecereMethod___ecereNameSpace__ecere__sys__File_Read, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Write", "uintsize Write(const void * buffer, uintsize size, uintsize count)", __ecereMethod___ecereNameSpace__ecere__sys__File_Write, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Getc", "bool Getc(char * ch)", __ecereMethod___ecereNameSpace__ecere__sys__File_Getc, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Putc", "bool Putc(char ch)", __ecereMethod___ecereNameSpace__ecere__sys__File_Putc, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Puts", "bool Puts(const char * string)", __ecereMethod___ecereNameSpace__ecere__sys__File_Puts, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Eof", "bool Eof(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_Eof, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Truncate", "bool Truncate(uint64 size)", __ecereMethod___ecereNameSpace__ecere__sys__File_Truncate, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetSize", "uint64 GetSize(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_GetSize, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "CloseInput", "void CloseInput(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_CloseInput, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "CloseOutput", "void CloseOutput(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_CloseOutput, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Lock", "bool Lock(ecere::sys::FileLock type, uint64 start, uint64 length, bool wait)", __ecereMethod___ecereNameSpace__ecere__sys__File_Lock, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Unlock", "bool Unlock(uint64 start, uint64 length, bool wait)", __ecereMethod___ecereNameSpace__ecere__sys__File_Unlock, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Close", "void Close()", __ecereMethod___ecereNameSpace__ecere__sys__File_Close, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CopyTo", "bool CopyTo(const char * outputFileName)", __ecereMethod___ecereNameSpace__ecere__sys__File_CopyTo, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CopyToFile", "bool CopyToFile(ecere::sys::File f)", __ecereMethod___ecereNameSpace__ecere__sys__File_CopyToFile, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Flush", "bool Flush(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_Flush, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetDouble", "double GetDouble(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_GetDouble, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetFloat", "float GetFloat(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_GetFloat, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetHexValue", "unsigned int GetHexValue(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_GetHexValue, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetLine", "bool GetLine(char * s, int max)", __ecereMethod___ecereNameSpace__ecere__sys__File_GetLine, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetLineEx", "int GetLineEx(char * s, int max, bool * hasNewLineChar)", __ecereMethod___ecereNameSpace__ecere__sys__File_GetLineEx, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetString", "bool GetString(char * string, int max)", __ecereMethod___ecereNameSpace__ecere__sys__File_GetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetValue", "int GetValue(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_GetValue, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Print", "void Print(const typed_object object, ...)", __ecereMethod___ecereNameSpace__ecere__sys__File_Print, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "PrintLn", "void PrintLn(const typed_object object, ...)", __ecereMethod___ecereNameSpace__ecere__sys__File_PrintLn, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Printf", "int Printf(const char * format, ...)", __ecereMethod___ecereNameSpace__ecere__sys__File_Printf, 1);
__ecerePropM___ecereNameSpace__ecere__sys__File_input = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "input", "void *", __ecereProp___ecereNameSpace__ecere__sys__File_Set_input, __ecereProp___ecereNameSpace__ecere__sys__File_Get_input, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__sys__File_input = __ecerePropM___ecereNameSpace__ecere__sys__File_input, __ecerePropM___ecereNameSpace__ecere__sys__File_input = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__File_output = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "output", "void *", __ecereProp___ecereNameSpace__ecere__sys__File_Set_output, __ecereProp___ecereNameSpace__ecere__sys__File_Get_output, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__sys__File_output = __ecerePropM___ecereNameSpace__ecere__sys__File_output, __ecerePropM___ecereNameSpace__ecere__sys__File_output = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__File_buffered = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "buffered", "bool", __ecereProp___ecereNameSpace__ecere__sys__File_Set_buffered, 0, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__sys__File_buffered = __ecerePropM___ecereNameSpace__ecere__sys__File_buffered, __ecerePropM___ecereNameSpace__ecere__sys__File_buffered = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__File_eof = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "eof", "bool", 0, __ecereProp___ecereNameSpace__ecere__sys__File_Get_eof, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__sys__File_eof = __ecerePropM___ecereNameSpace__ecere__sys__File_eof, __ecerePropM___ecereNameSpace__ecere__sys__File_eof = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, (((void *)0)), (((void *)0)), 0, 8, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::sys::ConsoleFile", "ecere::sys::File", 0, 0, (void *)__ecereConstructor___ecereNameSpace__ecere__sys__ConsoleFile, (void *)__ecereDestructor___ecereNameSpace__ecere__sys__ConsoleFile, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__ConsoleFile = class;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(2, "ecere::sys::FileAttribs", "bool", 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__FileAttribs = class;
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isFile", "bool", 1, 0, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isArchive", "bool", 1, 1, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isHidden", "bool", 1, 2, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isReadOnly", "bool", 1, 3, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isSystem", "bool", 1, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isTemporary", "bool", 1, 5, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isDirectory", "bool", 1, 6, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isDrive", "bool", 1, 7, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isCDROM", "bool", 1, 8, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isRemote", "bool", 1, 9, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isRemovable", "bool", 1, 10, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isServer", "bool", 1, 11, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isShare", "bool", 1, 12, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(3, "ecere::sys::SecSince1970", "int64", 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__SecSince1970 = class;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::sys::FileStats", 0, sizeof(struct __ecereNameSpace__ecere__sys__FileStats), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__FileStats = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "attribs", "ecere::sys::FileAttribs", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "size", "uint64", 8, 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "accessed", "ecere::sys::SecSince1970", 8, 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "modified", "ecere::sys::SecSince1970", 8, 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "created", "ecere::sys::SecSince1970", 8, 8, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::FileExists", "ecere::sys::FileAttribs ecere::sys::FileExists(const char * fileName)", __ecereNameSpace__ecere__sys__FileExists, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::FileOpen", "ecere::sys::File ecere::sys::FileOpen(const char * fileName, ecere::sys::FileOpenMode mode)", __ecereNameSpace__ecere__sys__FileOpen, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::FileFixCase", "void ecere::sys::FileFixCase(char * file)", __ecereNameSpace__ecere__sys__FileFixCase, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::FileGetSize", "bool ecere::sys::FileGetSize(const char * fileName, ecere::sys::FileSize * size)", __ecereNameSpace__ecere__sys__FileGetSize, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::FileGetStats", "bool ecere::sys::FileGetStats(const char * fileName, ecere::sys::FileStats stats)", __ecereNameSpace__ecere__sys__FileGetStats, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::CreateTemporaryFile", "ecere::sys::File ecere::sys::CreateTemporaryFile(char * tempFileName, const char * template)", __ecereNameSpace__ecere__sys__CreateTemporaryFile, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::CreateTemporaryDir", "void ecere::sys::CreateTemporaryDir(char * tempFileName, const char * template)", __ecereNameSpace__ecere__sys__CreateTemporaryDir, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::MakeSlashPath", "void ecere::sys::MakeSlashPath(char * p)", __ecereNameSpace__ecere__sys__MakeSlashPath, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::MakeSystemPath", "void ecere::sys::MakeSystemPath(char * p)", __ecereNameSpace__ecere__sys__MakeSystemPath, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::CopySystemPath", "char * ecere::sys::CopySystemPath(const char * p)", __ecereNameSpace__ecere__sys__CopySystemPath, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::CopyUnixPath", "char * ecere::sys::CopyUnixPath(const char * p)", __ecereNameSpace__ecere__sys__CopyUnixPath, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetSystemPathBuffer", "char * ecere::sys::GetSystemPathBuffer(char * d, const char * p)", __ecereNameSpace__ecere__sys__GetSystemPathBuffer, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetSlashPathBuffer", "char * ecere::sys::GetSlashPathBuffer(char * d, const char * p)", __ecereNameSpace__ecere__sys__GetSlashPathBuffer, module, 1);
}

