/* Code generated from eC source file: System.ec */
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

unsigned int System_MoveFile(const char * source, const char * dest);

unsigned int System_RenameFile(const char * oldName, const char * newName);

unsigned int System_DeleteFile(const char * fileName);

unsigned int System_MakeDir(const char * path);

unsigned int System_RemoveDir(const char * path);

char * System_GetWorkingDir(char * buf, int size);

unsigned int System_ChangeWorkingDir(const char * buf);

char * System_GetEnvironment(const char * envName, char * envValue, int max);

void System_SetEnvironment(const char * envName, const char * envValue);

void System_UnsetEnvironment(const char * envName);

unsigned int System_Execute(const char * env, const char * command, va_list args, unsigned int wait);

unsigned int System_ShellOpen(const char * fileName, va_list args);

void System_GetFreeSpace(const char * path, uint64 * size);




struct __ecereNameSpace__ecere__sys__System
{
int errorLoggingMode;
char * errorBuffer;
int errorBufferSize;
char logFile[797];
unsigned int lastErrorCode;
int errorLevel;
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
unsigned int count;
unsigned int _size;
unsigned int pos;
} ecere_gcc_struct;

extern void *  __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew(void *  memory, unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew0(void *  memory, unsigned int size);

extern void __ecereNameSpace__ecere__com__eSystem_Delete(void *  memory);

struct __ecereNameSpace__ecere__com__Array
{
uint64 *  array;
unsigned int count;
unsigned int minAllocSize;
} ecere_gcc_struct;

extern const char *  __ecereNameSpace__ecere__GetTranslatedString(const char * name, const char *  string, const char *  stringAndContext);

extern int fputs(const char * , void *  stream);

struct __ecereNameSpace__ecere__sys__File
{
void *  input;
void *  output;
} ecere_gcc_struct;

extern char *  strcat(char * , const char * );

extern int printf(const char * , ...);

extern char *  strcpy(char * , const char * );

struct __ecereNameSpace__ecere__com__DefinedExpression;

struct __ecereNameSpace__ecere__com__BitMember;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Container_copySrc;

unsigned int __ecereNameSpace__ecere__sys__MoveFile(const char * source, const char * dest)
{
return System_MoveFile(source, dest);
}

unsigned int __ecereNameSpace__ecere__sys__RenameFile(const char * oldName, const char * newName)
{
return System_RenameFile(oldName, newName);
}

unsigned int __ecereNameSpace__ecere__sys__DeleteFile(const char * fileName)
{
return System_DeleteFile(fileName);
}

unsigned int __ecereNameSpace__ecere__sys__MakeDir(const char * path)
{
return System_MakeDir(path);
}

unsigned int __ecereNameSpace__ecere__sys__RemoveDir(const char * path)
{
return System_RemoveDir(path);
}

char * __ecereNameSpace__ecere__sys__GetWorkingDir(char * buf, int size)
{
return System_GetWorkingDir(buf, size);
}

unsigned int __ecereNameSpace__ecere__sys__ChangeWorkingDir(const char * buf)
{
return System_ChangeWorkingDir(buf);
}

char * __ecereNameSpace__ecere__sys__GetEnvironment(const char * envName, char * envValue, int max)
{
return System_GetEnvironment(envName, envValue, max);
}

void __ecereNameSpace__ecere__sys__SetEnvironment(const char * envName, const char * envValue)
{
System_SetEnvironment(envName, envValue);
}

void __ecereNameSpace__ecere__sys__UnsetEnvironment(const char * envName)
{
System_UnsetEnvironment(envName);
}

unsigned int __ecereNameSpace__ecere__sys__Execute(const char * command, ...)
{
unsigned int result;
va_list args;

__builtin_va_start(args, command);
result = System_Execute((((void *)0)), command, args, 0);
__builtin_va_end(args);
return result;
}

unsigned int __ecereNameSpace__ecere__sys__ExecuteWait(const char * command, ...)
{
unsigned int result;
va_list args;

__builtin_va_start(args, command);
result = System_Execute((((void *)0)), command, args, 1);
__builtin_va_end(args);
return result;
}

unsigned int __ecereNameSpace__ecere__sys__ExecuteEnv(const char * env, const char * command, ...)
{
unsigned int result;
va_list args;

__builtin_va_start(args, command);
result = System_Execute(env, command, args, 0);
__builtin_va_end(args);
return result;
}

unsigned int __ecereNameSpace__ecere__sys__ShellOpen(const char * fileName, ...)
{
unsigned int result;
va_list args;

__builtin_va_start(args, fileName);
result = System_ShellOpen(fileName, args);
__builtin_va_end(args);
return result;
}

void __ecereNameSpace__ecere__sys__GetFreeSpace(const char * path, uint64 * size)
{
System_GetFreeSpace(path, size);
}

struct __ecereNameSpace__ecere__sys__System __ecereNameSpace__ecere__sys__globalSystem;

static struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__errorMessages;

static struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__sysErrorMessages;

static struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__guiErrorMessages;

void __ecereNameSpace__ecere__sys__DumpErrors(unsigned int display)
{
if(__ecereNameSpace__ecere__sys__globalSystem.errorBuffer && __ecereNameSpace__ecere__sys__globalSystem.errorBuffer[0])
{
if(display)
{
printf("%s", __ecereNameSpace__ecere__sys__globalSystem.errorBuffer);
}
__ecereNameSpace__ecere__sys__globalSystem.errorBuffer[0] = '\0';
}
}

unsigned int __ecereNameSpace__ecere__sys__GetLastErrorCode()
{
return (unsigned int)__ecereNameSpace__ecere__sys__globalSystem.lastErrorCode;
}

void __ecereNameSpace__ecere__sys__ResetError()
{
__ecereNameSpace__ecere__sys__globalSystem.lastErrorCode = 0;
}

void __ecereNameSpace__ecere__sys__SetErrorLevel(int level)
{
__ecereNameSpace__ecere__sys__globalSystem.errorLevel = level;
}

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} ecere_gcc_struct;

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

struct __ecereNameSpace__ecere__com__BuiltInContainer
{
void *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
void *  data;
int count;
struct __ecereNameSpace__ecere__com__Class * type;
} ecere_gcc_struct;

extern void __ecereNameSpace__ecere__com__eEnum_AddFixedValue(struct __ecereNameSpace__ecere__com__Class * _class, const char *  string, long long value);

extern struct __ecereNameSpace__ecere__com__BitMember * __ecereNameSpace__ecere__com__eClass_AddBitMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, int bitSize, int bitPos, int declMode);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpen(const char *  fileName, int mode);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts;

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

void __ecereProp___ecereNameSpace__ecere__com__Container_Set_copySrc(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * value);

void __ecereNameSpace__ecere__sys__SetLoggingMode(int mode, void * where)
{
__ecereNameSpace__ecere__sys__globalSystem.errorLoggingMode = mode;
if(mode == 4)
{
struct __ecereNameSpace__ecere__com__Instance * file;

strcpy(__ecereNameSpace__ecere__sys__globalSystem.logFile, where);
file = __ecereNameSpace__ecere__sys__FileOpen(__ecereNameSpace__ecere__sys__globalSystem.logFile, 2);
(__ecereNameSpace__ecere__com__eInstance_DecRef(file), file = 0);
}
else if(mode == 6 || mode == 5)
{
if(!__ecereNameSpace__ecere__sys__globalSystem.errorBuffer)
{
__ecereNameSpace__ecere__sys__globalSystem.errorBufferSize = (100 * (1025));
__ecereNameSpace__ecere__sys__globalSystem.errorBuffer = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * ((100 * (1025))));
}
__ecereNameSpace__ecere__sys__globalSystem.errorBuffer[0] = 0;
}
else if(mode == 3)
{
}
if(mode == (int)0)
{
__ecereNameSpace__ecere__sys__DumpErrors(1);
if(__ecereNameSpace__ecere__sys__globalSystem.errorBuffer)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(__ecereNameSpace__ecere__sys__globalSystem.errorBuffer), __ecereNameSpace__ecere__sys__globalSystem.errorBuffer = 0);
__ecereNameSpace__ecere__sys__globalSystem.errorBufferSize = 0;
}
}
}

void __ecereDestroyModuleInstances_System()
{
(__ecereNameSpace__ecere__com__eInstance_DecRef(__ecereNameSpace__ecere__sys__errorMessages), __ecereNameSpace__ecere__sys__errorMessages = 0);
(__ecereNameSpace__ecere__com__eInstance_DecRef(__ecereNameSpace__ecere__sys__guiErrorMessages), __ecereNameSpace__ecere__sys__guiErrorMessages = 0);
(__ecereNameSpace__ecere__com__eInstance_DecRef(__ecereNameSpace__ecere__sys__sysErrorMessages), __ecereNameSpace__ecere__sys__sysErrorMessages = 0);
}

struct __ecereNameSpace__ecere__com__Property;

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

extern void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object);

extern void __ecereNameSpace__ecere__com__eInstance_Watch(void *  instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

void __ecereNameSpace__ecere__sys__Log(const char *  text);

void __ecereNameSpace__ecere__sys__Logf(const char * format, ...)
{
va_list args;
char string[1025];

__builtin_va_start(args, format);
vsnprintf(string, sizeof (string), format, args);
string[sizeof (string) - 1] = 0;
__ecereNameSpace__ecere__sys__Log(string);
__builtin_va_end(args);
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

struct __ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, const char *  name, const char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_RegisterDefine(const char *  name, const char *  value, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__LoggingMode;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__ErrorLevel;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__ErrorCode;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__SysErrorCode;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__GuiErrorCode;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__System;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Array_TPL_String_;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Array_TPL_ecere__com__Array_TPL_String___;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__File;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Array;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BuiltInContainer;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_String;

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

void __ecereNameSpace__ecere__sys__Log(const char * text)
{
switch(__ecereNameSpace__ecere__sys__globalSystem.errorLoggingMode)
{
case 3:
case 1:
fputs(text, eC_stdout());
fflush(eC_stdout());
break;
case 2:
fputs(text, eC_stderr());
fflush(eC_stderr());
break;
case 4:
{
struct __ecereNameSpace__ecere__com__Instance * f;

if((f = __ecereNameSpace__ecere__sys__FileOpen(__ecereNameSpace__ecere__sys__globalSystem.logFile, 3)))
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, text);
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}
break;
}
case 6:
case 5:
strcat(__ecereNameSpace__ecere__sys__globalSystem.errorBuffer, text);
break;
}
}

void __ecereNameSpace__ecere__sys__LogErrorCode(unsigned int errorCode, const char * details)
{
if(((int)((errorCode & 0x3000) >> 12)) <= __ecereNameSpace__ecere__sys__globalSystem.errorLevel)
{
int cat = (((unsigned int)((errorCode & 0xFFF) >> 0)) & 0xF00) >> 8;
int code = ((unsigned int)((errorCode & 0xFFF) >> 0)) & 0xFF;

if(details)
__ecereNameSpace__ecere__sys__Logf("System Error [%d]: %s (%s).\n", ((int)((errorCode & 0x3000) >> 12)), ((const char **)__extension__ ({
char * __ecTemp1 = (char *)(((struct __ecereNameSpace__ecere__com__Instance **)((struct __ecereNameSpace__ecere__com__Array *)(((char *)__ecereNameSpace__ecere__sys__errorMessages + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->array)[cat]);

((struct __ecereNameSpace__ecere__com__Array *)(__ecTemp1 + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)));
})->array)[code], details);
else
__ecereNameSpace__ecere__sys__Logf("System Error [%d]: %s.\n", ((int)((errorCode & 0x3000) >> 12)), ((const char **)__extension__ ({
char * __ecTemp1 = (char *)(((struct __ecereNameSpace__ecere__com__Instance **)((struct __ecereNameSpace__ecere__com__Array *)(((char *)__ecereNameSpace__ecere__sys__errorMessages + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->array)[cat]);

((struct __ecereNameSpace__ecere__com__Array *)(__ecTemp1 + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)));
})->array)[code]);
}
__ecereNameSpace__ecere__sys__globalSystem.lastErrorCode = errorCode;
}

void __ecereCreateModuleInstances_System()
{
(__ecereNameSpace__ecere__sys__sysErrorMessages = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__Array_TPL_String_), __ecereProp___ecereNameSpace__ecere__com__Container_Set_copySrc(__ecereNameSpace__ecere__sys__sysErrorMessages, ((struct __ecereNameSpace__ecere__com__Instance *)&__extension__ (struct __ecereNameSpace__ecere__com__BuiltInContainer)
{
__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer->_vTbl, __ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, 0, __extension__ (const char * [])
{
__ecereNameSpace__ecere__GetTranslatedString("ecere", "No error", (((void *)0))), __ecereNameSpace__ecere__GetTranslatedString("ecere", "Memory allocation failed", (((void *)0))), __ecereNameSpace__ecere__GetTranslatedString("ecere", "Inexistant string identifier specified", (((void *)0))), __ecereNameSpace__ecere__GetTranslatedString("ecere", "Identic string identifier already exists", (((void *)0))), __ecereNameSpace__ecere__GetTranslatedString("ecere", "Shared library loading failed", (((void *)0))), __ecereNameSpace__ecere__GetTranslatedString("ecere", "File not found", (((void *)0))), __ecereNameSpace__ecere__GetTranslatedString("ecere", "Couldn't write to file", (((void *)0)))
}, 7, __ecereClass_String
})));
__ecereNameSpace__ecere__com__eInstance_IncRef(__ecereNameSpace__ecere__sys__sysErrorMessages);
(__ecereNameSpace__ecere__sys__guiErrorMessages = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__Array_TPL_String_), __ecereProp___ecereNameSpace__ecere__com__Container_Set_copySrc(__ecereNameSpace__ecere__sys__guiErrorMessages, ((struct __ecereNameSpace__ecere__com__Instance *)&__extension__ (struct __ecereNameSpace__ecere__com__BuiltInContainer)
{
__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer->_vTbl, __ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, 0, __extension__ (const char * [])
{
__ecereNameSpace__ecere__GetTranslatedString("ecere", "No error", (((void *)0))), __ecereNameSpace__ecere__GetTranslatedString("ecere", "Graphics driver not supported by any user interface system", (((void *)0))), __ecereNameSpace__ecere__GetTranslatedString("ecere", "Window creation failed", (((void *)0))), __ecereNameSpace__ecere__GetTranslatedString("ecere", "Window graphics loading failed", (((void *)0))), __ecereNameSpace__ecere__GetTranslatedString("ecere", "Driver/Mode switch failed", (((void *)0)))
}, 5, __ecereClass_String
})));
__ecereNameSpace__ecere__com__eInstance_IncRef(__ecereNameSpace__ecere__sys__guiErrorMessages);
(__ecereNameSpace__ecere__sys__errorMessages = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__Array_TPL_ecere__com__Array_TPL_String___), __ecereProp___ecereNameSpace__ecere__com__Container_Set_copySrc(__ecereNameSpace__ecere__sys__errorMessages, ((struct __ecereNameSpace__ecere__com__Instance *)&__extension__ (struct __ecereNameSpace__ecere__com__BuiltInContainer)
{
__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer->_vTbl, __ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, 0, __extension__ (struct __ecereNameSpace__ecere__com__Instance * [])
{
__ecereNameSpace__ecere__sys__sysErrorMessages, __ecereNameSpace__ecere__sys__guiErrorMessages
}, 2, __ecereClass___ecereNameSpace__ecere__com__Array_TPL_String_
})));
__ecereNameSpace__ecere__com__eInstance_IncRef(__ecereNameSpace__ecere__sys__errorMessages);
}

void __ecereUnregisterModule_System(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

void __ecereRegisterModule_System(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::sys::LoggingMode", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__LoggingMode = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "noLogging", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "stdOut", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "stdErr", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "debug", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "logFile", 4);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "msgBox", 5);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "buffer", 6);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::sys::ErrorLevel", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__ErrorLevel = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "veryFatal", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "fatal", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "major", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "minor", 3);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::sys::AllErrors", "ecere::sys::ErrorLevel::minor", module, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(2, "ecere::sys::ErrorCode", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__ErrorCode = class;
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "level", "ecere::sys::ErrorLevel", 2, 12, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "code", "uint", 12, 0, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::sys::SysErrorCode", "ecere::sys::ErrorCode", 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__SysErrorCode = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "allocationFailed", 4097);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "nameInexistant", 4098);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "nameExists", 4099);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "missingLibrary", 4100);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "fileNotFound", 12293);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "writeFailed", 8198);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::sys::GuiErrorCode", "ecere::sys::ErrorCode", 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__GuiErrorCode = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "driverNotSupported", 257);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "windowCreationFailed", 258);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "graphicsLoadingFailed", 259);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "modeSwitchFailed", 260);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::MoveFile", "bool ecere::sys::MoveFile(const char * source, const char * dest)", __ecereNameSpace__ecere__sys__MoveFile, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::RenameFile", "bool ecere::sys::RenameFile(const char * oldName, const char * newName)", __ecereNameSpace__ecere__sys__RenameFile, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::DeleteFile", "bool ecere::sys::DeleteFile(const char * fileName)", __ecereNameSpace__ecere__sys__DeleteFile, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::MakeDir", "bool ecere::sys::MakeDir(const char * path)", __ecereNameSpace__ecere__sys__MakeDir, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::RemoveDir", "bool ecere::sys::RemoveDir(const char * path)", __ecereNameSpace__ecere__sys__RemoveDir, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetWorkingDir", "char * ecere::sys::GetWorkingDir(char * buf, int size)", __ecereNameSpace__ecere__sys__GetWorkingDir, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::ChangeWorkingDir", "bool ecere::sys::ChangeWorkingDir(const char * buf)", __ecereNameSpace__ecere__sys__ChangeWorkingDir, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetEnvironment", "char * ecere::sys::GetEnvironment(const char * envName, char * envValue, int max)", __ecereNameSpace__ecere__sys__GetEnvironment, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::SetEnvironment", "void ecere::sys::SetEnvironment(const char * envName, const char * envValue)", __ecereNameSpace__ecere__sys__SetEnvironment, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::UnsetEnvironment", "void ecere::sys::UnsetEnvironment(const char * envName)", __ecereNameSpace__ecere__sys__UnsetEnvironment, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::Execute", "bool ecere::sys::Execute(const char * command, ...)", __ecereNameSpace__ecere__sys__Execute, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::ExecuteWait", "bool ecere::sys::ExecuteWait(const char * command, ...)", __ecereNameSpace__ecere__sys__ExecuteWait, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::ExecuteEnv", "bool ecere::sys::ExecuteEnv(const char * env, const char * command, ...)", __ecereNameSpace__ecere__sys__ExecuteEnv, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::ShellOpen", "bool ecere::sys::ShellOpen(const char * fileName, ...)", __ecereNameSpace__ecere__sys__ShellOpen, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetFreeSpace", "void ecere::sys::GetFreeSpace(const char * path, ecere::sys::FileSize64 * size)", __ecereNameSpace__ecere__sys__GetFreeSpace, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::Logf", "void ecere::sys::Logf(const char * format, ...)", __ecereNameSpace__ecere__sys__Logf, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::Log", "void ecere::sys::Log(const char * text)", __ecereNameSpace__ecere__sys__Log, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::DumpErrors", "void ecere::sys::DumpErrors(bool display)", __ecereNameSpace__ecere__sys__DumpErrors, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::LogErrorCode", "void ecere::sys::LogErrorCode(ecere::sys::ErrorCode errorCode, const char * details)", __ecereNameSpace__ecere__sys__LogErrorCode, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetLastErrorCode", "uint ecere::sys::GetLastErrorCode(void)", __ecereNameSpace__ecere__sys__GetLastErrorCode, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::ResetError", "void ecere::sys::ResetError(void)", __ecereNameSpace__ecere__sys__ResetError, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::SetErrorLevel", "void ecere::sys::SetErrorLevel(ecere::sys::ErrorLevel level)", __ecereNameSpace__ecere__sys__SetErrorLevel, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::SetLoggingMode", "void ecere::sys::SetLoggingMode(ecere::sys::LoggingMode mode, void * where)", __ecereNameSpace__ecere__sys__SetLoggingMode, module, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::sys::System", 0, sizeof(struct __ecereNameSpace__ecere__sys__System), 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__System = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "errorLoggingMode", "ecere::sys::LoggingMode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "errorBuffer", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "errorBufferSize", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "logFile", "char[MAX_LOCATION]", 797, 1, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "lastErrorCode", "ecere::sys::ErrorCode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "errorLevel", "ecere::sys::ErrorLevel", 4, 4, 1);
}

