#if defined(__GNUC__)
typedef long long int64;
typedef unsigned long long uint64;
#elif defined(__TINYC__)
#include <stdarg.h>
#define __builtin_va_list va_list
#define __builtin_va_start va_start
#define __builtin_va_end va_end
#ifdef _WIN32
#define strcasecmp stricmp
#define strncasecmp strnicmp
#define __declspec(x) __attribute__((x))
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
#include <stdint.h>
extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BTNode;

struct __ecereNameSpace__ecere__sys__BTNode;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldList;

struct __ecereNameSpace__ecere__sys__OldList
{
void *  first;
void *  last;
int count;
unsigned int offset;
unsigned int circ;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Class
{
struct __ecereNameSpace__ecere__com__Class * prev;
struct __ecereNameSpace__ecere__com__Class * next;
char *  name;
int offset;
int structSize;
int (* *  _vTbl)();
int vTblSize;
int (*  Constructor)(struct __ecereNameSpace__ecere__com__Instance *);
void (*  Destructor)(struct __ecereNameSpace__ecere__com__Instance *);
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
char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int typeSize;
int defaultAlignment;
void (*  Initialize)();
int memberOffset;
struct __ecereNameSpace__ecere__sys__OldList selfWatchers;
char *  designerClass;
unsigned int noExpansion;
char *  defaultProperty;
unsigned int comRedefinition;
int count;
unsigned int isRemote;
unsigned int internalDecl;
void *  data;
unsigned int computeSize;
int structAlignment;
int destructionWatchOffset;
unsigned int fixed;
struct __ecereNameSpace__ecere__sys__OldList delayedCPValues;
int inheritanceAccess;
char *  fullName;
void *  symbol;
struct __ecereNameSpace__ecere__sys__OldList conversions;
struct __ecereNameSpace__ecere__sys__OldList templateParams;
struct __ecereNameSpace__ecere__com__ClassTemplateArgument *  templateArgs;
struct __ecereNameSpace__ecere__com__Class * templateClass;
struct __ecereNameSpace__ecere__sys__OldList templatized;
int numParams;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

struct __ecereNameSpace__ecere__com__Instance
{
int (* *  _vTbl)();
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Property;

struct __ecereNameSpace__ecere__com__Property
{
struct __ecereNameSpace__ecere__com__Property * prev;
struct __ecereNameSpace__ecere__com__Property * next;
char *  name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
struct __ecereNameSpace__ecere__com__Instance * dataType;
void (*  Set)();
int (*  Get)();
unsigned int (*  IsSet)();
void *  data;
void *  symbol;
int vid;
unsigned int conversion;
unsigned int watcherOffset;
char *  category;
unsigned int compiled;
unsigned int selfWatchable;
unsigned int isWatchable;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DataMember;

struct __ecereNameSpace__ecere__com__DataMember
{
struct __ecereNameSpace__ecere__com__DataMember * prev;
struct __ecereNameSpace__ecere__com__DataMember * next;
char *  name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int type;
int offset;
int memberID;
struct __ecereNameSpace__ecere__sys__OldList members;
struct __ecereNameSpace__ecere__sys__BinaryTree membersAlpha;
int memberOffset;
int structAlignment;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Method;

struct __ecereNameSpace__ecere__com__Method
{
char *  name;
struct __ecereNameSpace__ecere__com__Method * parent;
struct __ecereNameSpace__ecere__com__Method * left;
struct __ecereNameSpace__ecere__com__Method * right;
int depth;
int (*  function)();
int vid;
int type;
struct __ecereNameSpace__ecere__com__Class * _class;
void *  symbol;
char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int memberAccess;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SerialBuffer;

struct __ecereNameSpace__ecere__com__SerialBuffer
{
unsigned char *  _buffer;
unsigned int count;
unsigned int _size;
unsigned int pos;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DataValue;

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
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateArgument;

struct __ecereNameSpace__ecere__com__ClassTemplateArgument
{
union
{
struct
{
char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
} __attribute__ ((gcc_struct));
struct __ecereNameSpace__ecere__com__DataValue expression;
struct
{
char *  memberString;
union
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__Method * method;
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));

typedef __builtin_va_list __gnuc_va_list;

typedef __gnuc_va_list va_list;

typedef unsigned int size_t;

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

int vsnprintf(char *, size_t, const char *, ...);

int snprintf(char * str, size_t, const char * format, ...);

int fseek(FILE * stream, long offset, int whence);

long ftell(FILE * stream);

int feof(FILE * stream);

int ferror(FILE * stream);

int fileno(FILE * stream);

unsigned int System_MoveFile(char * source, char * dest);

unsigned int System_RenameFile(char * oldName, char * newName);

unsigned int System_DeleteFile(char * fileName);

unsigned int System_MakeDir(char * path);

unsigned int System_RemoveDir(char * path);

char * System_GetWorkingDir(char * buf, int size);

unsigned int System_ChangeWorkingDir(char * buf);

char * System_GetEnvironment(char * envName, char * envValue, int max);

void System_SetEnvironment(char * envName, char * envValue);

void System_UnsetEnvironment(char * envName);

unsigned int System_Execute(char * env, char * command, va_list args);

unsigned int System_ShellOpen(char * fileName, va_list args);

void System_GetFreeSpace(char * path, struct __ecereNameSpace__ecere__com__Instance ** size);

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__LoggingMode;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__ErrorLevel;


static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__ErrorCode;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__SysErrorCode;


extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Array;

struct __ecereNameSpace__ecere__com__Array
{
uint64 *  array;
unsigned int count;
unsigned int minAllocSize;
} __attribute__ ((gcc_struct));

extern char *  __ecereNameSpace__ecere__GetTranslatedString(struct __ecereNameSpace__ecere__com__Instance * module, char *  string, char *  stringAndContext);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BuiltInContainer;

struct __ecereNameSpace__ecere__com__BuiltInContainer
{
void *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
void *  data;
int count;
struct __ecereNameSpace__ecere__com__Class * type;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__errorMessages;

unsigned int __ecereNameSpace__ecere__sys__MoveFile(char * source, char * dest)
{
return System_MoveFile(source, dest);
}

unsigned int __ecereNameSpace__ecere__sys__RenameFile(char * oldName, char * newName)
{
return System_RenameFile(oldName, newName);
}

unsigned int __ecereNameSpace__ecere__sys__DeleteFile(char * fileName)
{
return System_DeleteFile(fileName);
}

unsigned int __ecereNameSpace__ecere__sys__MakeDir(char * path)
{
return System_MakeDir(path);
}

unsigned int __ecereNameSpace__ecere__sys__RemoveDir(char * path)
{
return System_RemoveDir(path);
}

char * __ecereNameSpace__ecere__sys__GetWorkingDir(char * buf, int size)
{
return System_GetWorkingDir(buf, size);
}

unsigned int __ecereNameSpace__ecere__sys__ChangeWorkingDir(char * buf)
{
return System_ChangeWorkingDir(buf);
}

char * __ecereNameSpace__ecere__sys__GetEnvironment(char * envName, char * envValue, int max)
{
return System_GetEnvironment(envName, envValue, max);
}

void __ecereNameSpace__ecere__sys__SetEnvironment(char * envName, char * envValue)
{
System_SetEnvironment(envName, envValue);
}

void __ecereNameSpace__ecere__sys__UnsetEnvironment(char * envName)
{
System_UnsetEnvironment(envName);
}

unsigned int __ecereNameSpace__ecere__sys__Execute(char * command, ...)
{
unsigned int result;
va_list args;

__builtin_va_start(args, command);
result = System_Execute((((void *)0)), command, args);
__builtin_va_end(args);
return result;
}

unsigned int __ecereNameSpace__ecere__sys__ExecuteEnv(char * env, char * command, ...)
{
unsigned int result;
va_list args;

__builtin_va_start(args, command);
result = System_Execute(env, command, args);
__builtin_va_end(args);
return result;
}

unsigned int __ecereNameSpace__ecere__sys__ShellOpen(char * fileName, ...)
{
unsigned int result;
va_list args;

result = System_ShellOpen(fileName, args);
__builtin_va_end(args);
return result;
}

void __ecereNameSpace__ecere__sys__GetFreeSpace(char * path, struct __ecereNameSpace__ecere__com__Instance ** size)
{
System_GetFreeSpace(path, size);
}

void __ecereNameSpace__ecere__sys__Log(char *  text);

void __ecereNameSpace__ecere__sys__Logf(char * format, ...)
{
va_list args;
char string[1025];

__builtin_va_start(args, format);
vsnprintf(string, sizeof string, format, args);
string[sizeof string - 1] = (char)0;
__ecereNameSpace__ecere__sys__Log(string);
__builtin_va_end(args);
}

struct __ecereNameSpace__ecere__sys__System __ecereNameSpace__ecere__sys__globalSystem;

struct __ecereNameSpace__ecere__sys__System
{
int errorLoggingMode;
char * errorBuffer;
int errorBufferSize;
char logFile[797];
unsigned int lastErrorCode;
int errorLevel;
struct __ecereNameSpace__ecere__com__Instance * eventSemaphore;
struct __ecereNameSpace__ecere__sys__OldList fileMonitors;
struct __ecereNameSpace__ecere__com__Instance * fileMonitorMutex;
struct __ecereNameSpace__ecere__com__Instance * fileMonitorThread;
unsigned int systemTerminate;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__System;

extern int fputs(char * , void *  stream);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpen(char *  fileName, int mode);

extern char *  strcat(char * , const char * );

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts;

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

void __ecereNameSpace__ecere__sys__Log(char * text)
{
switch(__ecereNameSpace__ecere__sys__globalSystem.errorLoggingMode)
{
case 3:
case 1:
fputs(text, (bsl_stdout()));
fflush((bsl_stdout()));
break;
case 2:
fputs(text, (bsl_stderr()));
fflush((bsl_stderr()));
break;
case 4:
{
struct __ecereNameSpace__ecere__com__Instance * f;

if((f = __ecereNameSpace__ecere__sys__FileOpen(__ecereNameSpace__ecere__sys__globalSystem.logFile, 3)))
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, text);
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

extern int printf(char * , ...);

void __ecereNameSpace__ecere__sys__DumpErrors(unsigned int display)
{
if(__ecereNameSpace__ecere__sys__globalSystem.errorBuffer && __ecereNameSpace__ecere__sys__globalSystem.errorBuffer[0])
{
if(display)
{
printf(__ecereNameSpace__ecere__sys__globalSystem.errorBuffer);
}
__ecereNameSpace__ecere__sys__globalSystem.errorBuffer[0] = '\0';
}
}

void __ecereNameSpace__ecere__sys__LogErrorCode(unsigned int errorCode, char * details)
{
if(((int)((errorCode & 0x3000) >> 12)) <= __ecereNameSpace__ecere__sys__globalSystem.errorLevel)
{
if(details)
__ecereNameSpace__ecere__sys__Logf("System Error [%d]: %s (%s).\n", ((int)((errorCode & 0x3000) >> 12)), ((char **)((struct __ecereNameSpace__ecere__com__Array *)(((char *)__ecereNameSpace__ecere__sys__errorMessages + 12)))->array)[((unsigned int)((errorCode & 0xFFF) >> 0))], details);
else
__ecereNameSpace__ecere__sys__Logf("System Error [%d]: %s.\n", ((int)((errorCode & 0x3000) >> 12)), ((char **)((struct __ecereNameSpace__ecere__com__Array *)(((char *)__ecereNameSpace__ecere__sys__errorMessages + 12)))->array)[((unsigned int)((errorCode & 0xFFF) >> 0))]);
}
__ecereNameSpace__ecere__sys__globalSystem.lastErrorCode = errorCode;
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

extern char *  strcpy(char * , const char * );

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
__ecereNameSpace__ecere__sys__globalSystem.errorBuffer[0] = (char)0;
}
else if(mode == 3)
{
}
if(mode == (int)0)
{
__ecereNameSpace__ecere__sys__DumpErrors(0x1);
if(__ecereNameSpace__ecere__sys__globalSystem.errorBuffer)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(__ecereNameSpace__ecere__sys__globalSystem.errorBuffer), __ecereNameSpace__ecere__sys__globalSystem.errorBuffer = 0);
__ecereNameSpace__ecere__sys__globalSystem.errorBufferSize = 0;
}
}
}


extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, char *  name, char *  baseName, int size, int sizeClass, unsigned int (* )(void * ), void (* )(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__NameSpace;

struct __ecereNameSpace__ecere__com__NameSpace
{
char *  name;
struct __ecereNameSpace__ecere__com__NameSpace *  btParent;
struct __ecereNameSpace__ecere__com__NameSpace *  left;
struct __ecereNameSpace__ecere__com__NameSpace *  right;
int depth;
struct __ecereNameSpace__ecere__com__NameSpace *  parent;
struct __ecereNameSpace__ecere__sys__BinaryTree nameSpaces;
struct __ecereNameSpace__ecere__sys__BinaryTree classes;
struct __ecereNameSpace__ecere__sys__BinaryTree defines;
struct __ecereNameSpace__ecere__sys__BinaryTree functions;
} __attribute__ ((gcc_struct));

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
char *  name;
void *  library;
void *  Unload;
int importType;
int origImportType;
struct __ecereNameSpace__ecere__com__NameSpace privateNameSpace;
struct __ecereNameSpace__ecere__com__NameSpace publicNameSpace;
} __attribute__ ((gcc_struct));

extern void __ecereNameSpace__ecere__com__eEnum_AddFixedValue(struct __ecereNameSpace__ecere__com__Class * _class, char *  string, int value);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DefinedExpression;

struct __ecereNameSpace__ecere__com__DefinedExpression;

extern struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_RegisterDefine(char *  name, char *  value, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BitMember;

struct __ecereNameSpace__ecere__com__BitMember;

extern struct __ecereNameSpace__ecere__com__BitMember * __ecereNameSpace__ecere__com__eClass_AddBitMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, int bitSize, int bitPos, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

void __ecereRegisterModule_System(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::sys::LoggingMode", 0, 0, 0, 0, 0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__LoggingMode = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "noLogging", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "stdOut", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "stdErr", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "debug", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "logFile", 4);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "msgBox", 5);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "buffer", 6);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::sys::ErrorLevel", 0, 0, 0, 0, 0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__ErrorLevel = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "veryFatal", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "fatal", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "major", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "minor", 3);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::sys::AllErrors", "ecere::sys::ErrorLevel::Minor", module, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(2, "ecere::sys::ErrorCode", 0, 0, 0, 0, 0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__ErrorCode = class;
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "level", "ecere::sys::ErrorLevel", 2, 12, 2);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "code", "uint", 12, 0, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::sys::SysErrorCode", "ecere::sys::ErrorCode", 0, 0, 0, 0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__SysErrorCode = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "allocationFailed", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "nameInexistant", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "nameExists", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "missingLibrary", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "fileNotFound", 4);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "writeFailed", 5);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::MoveFile", "bool ecere::sys::MoveFile(char * source, char * dest)", __ecereNameSpace__ecere__sys__MoveFile, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::RenameFile", "bool ecere::sys::RenameFile(char * oldName, char * newName)", __ecereNameSpace__ecere__sys__RenameFile, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::DeleteFile", "bool ecere::sys::DeleteFile(char * fileName)", __ecereNameSpace__ecere__sys__DeleteFile, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::MakeDir", "bool ecere::sys::MakeDir(char * path)", __ecereNameSpace__ecere__sys__MakeDir, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::RemoveDir", "bool ecere::sys::RemoveDir(char * path)", __ecereNameSpace__ecere__sys__RemoveDir, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetWorkingDir", "char * ecere::sys::GetWorkingDir(char * buf, int size)", __ecereNameSpace__ecere__sys__GetWorkingDir, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::ChangeWorkingDir", "bool ecere::sys::ChangeWorkingDir(char * buf)", __ecereNameSpace__ecere__sys__ChangeWorkingDir, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetEnvironment", "char * ecere::sys::GetEnvironment(char * envName, char * envValue, int max)", __ecereNameSpace__ecere__sys__GetEnvironment, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::SetEnvironment", "void ecere::sys::SetEnvironment(char * envName, char * envValue)", __ecereNameSpace__ecere__sys__SetEnvironment, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::UnsetEnvironment", "void ecere::sys::UnsetEnvironment(char * envName)", __ecereNameSpace__ecere__sys__UnsetEnvironment, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::Execute", "bool ecere::sys::Execute(char * command, ...)", __ecereNameSpace__ecere__sys__Execute, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::ExecuteEnv", "bool ecere::sys::ExecuteEnv(char * env, char * command, ...)", __ecereNameSpace__ecere__sys__ExecuteEnv, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::ShellOpen", "bool ecere::sys::ShellOpen(char * fileName, ...)", __ecereNameSpace__ecere__sys__ShellOpen, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetFreeSpace", "void ecere::sys::GetFreeSpace(char * path, FileSize64 * size)", __ecereNameSpace__ecere__sys__GetFreeSpace, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::Logf", "void ecere::sys::Logf(char * format, ...)", __ecereNameSpace__ecere__sys__Logf, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::Log", "void ecere::sys::Log(char * text)", __ecereNameSpace__ecere__sys__Log, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::DumpErrors", "void ecere::sys::DumpErrors(bool display)", __ecereNameSpace__ecere__sys__DumpErrors, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::LogErrorCode", "void ecere::sys::LogErrorCode(ecere::sys::ErrorCode errorCode, char * details)", __ecereNameSpace__ecere__sys__LogErrorCode, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetLastErrorCode", "uint ecere::sys::GetLastErrorCode(void)", __ecereNameSpace__ecere__sys__GetLastErrorCode, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::ResetError", "void ecere::sys::ResetError(void)", __ecereNameSpace__ecere__sys__ResetError, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::SetErrorLevel", "void ecere::sys::SetErrorLevel(ecere::sys::ErrorLevel level)", __ecereNameSpace__ecere__sys__SetErrorLevel, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::SetLoggingMode", "void ecere::sys::SetLoggingMode(ecere::sys::LoggingMode mode, void * where)", __ecereNameSpace__ecere__sys__SetLoggingMode, module, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::sys::System", 0, sizeof(struct __ecereNameSpace__ecere__sys__System), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__System = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "errorLoggingMode", "ecere::sys::LoggingMode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "errorBuffer", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "errorBufferSize", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "logFile", "char[MAX_LOCATION]", 797, 1, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "lastErrorCode", "ecere::sys::ErrorCode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "errorLevel", "ecere::sys::ErrorLevel", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "eventSemaphore", "Semaphore", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "fileMonitors", "ecere::sys::OldList", 20, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "fileMonitorMutex", "Mutex", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "fileMonitorThread", "Thread", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "systemTerminate", "bool", 4, 4, 1);
}

void __ecereUnregisterModule_System(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Array_TPL_String_;

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

void __ecereProp___ecereNameSpace__ecere__com__Container_Set_copySrc(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * value);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__com__Container_copySrc;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_String;

void __ecereCreateModuleInstances_System()
{
(__ecereNameSpace__ecere__sys__errorMessages = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__Array_TPL_String_), __ecereProp___ecereNameSpace__ecere__com__Container_Set_copySrc(__ecereNameSpace__ecere__sys__errorMessages, ((struct __ecereNameSpace__ecere__com__Instance *)&__extension__ (struct __ecereNameSpace__ecere__com__BuiltInContainer)
{
__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer->_vTbl, __ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, 0, __extension__ (char * [])
{
__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "No error", (((void *)0))), __ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Memory allocation failed", (((void *)0))), __ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Inexistant string identifier specified", (((void *)0))), __ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Identic string identifier already exists", (((void *)0))), __ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Shared library loading failed", (((void *)0))), __ecereNameSpace__ecere__GetTranslatedString(__thisModule, "File not found", (((void *)0))), __ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Couldn't write to file", (((void *)0)))
}, 7, __ecereClass_String
})));
__ecereNameSpace__ecere__com__eInstance_IncRef(__ecereNameSpace__ecere__sys__errorMessages);
}

void __ecereDestroyModuleInstances_System()
{
(__ecereNameSpace__ecere__com__eInstance_DecRef(__ecereNameSpace__ecere__sys__errorMessages), __ecereNameSpace__ecere__sys__errorMessages = 0);
}

