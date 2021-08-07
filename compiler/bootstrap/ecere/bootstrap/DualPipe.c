/* Code generated from eC source file: DualPipe.ec */
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
typedef __builtin_va_list va_list;

typedef struct _DualPipe _DualPipe;

void DualPipe_Destructor(_DualPipe * dp);

void DualPipe_CloseInput(_DualPipe * dp);

void DualPipe_CloseOutput(_DualPipe * dp);

size_t DualPipe_Read(_DualPipe * dp, unsigned char * buffer, size_t size, size_t count);

size_t DualPipe_Write(_DualPipe * dp, const unsigned char * buffer, size_t size, size_t count);

unsigned int DualPipe_Getc(_DualPipe * dp, char * ch);

unsigned int DualPipe_Putc(_DualPipe * dp, char ch);

unsigned int DualPipe_Puts(_DualPipe * dp, const char * string);

unsigned int DualPipe_Seek(_DualPipe * dp, long long pos, int mode);

uint64 DualPipe_Tell(_DualPipe * dp);

unsigned int DualPipe_Eof(_DualPipe * dp);

uint64 DualPipe_GetSize(_DualPipe * dp);

unsigned int DualPipe_Peek(_DualPipe * dp);

void DualPipe_Terminate(_DualPipe * dp);

int DualPipe_GetExitCode(_DualPipe * dp);

int DualPipe_GetProcessID(_DualPipe * dp);

void DualPipe_Wait(_DualPipe * dp);

_DualPipe * _DualPipeOpen(unsigned int mode, const char * commandLine, const char * env, void ** inputPtr, void ** outputPtr);

struct __ecereNameSpace__ecere__sys__DualPipe
{
void * dp;
} ecere_gcc_struct;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__File_input;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__File_output;

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

extern int vsnprintf(char * , size_t, const char * , __builtin_va_list);

struct __ecereNameSpace__ecere__com__BitMember;

struct __ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} ecere_gcc_struct;

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

extern struct __ecereNameSpace__ecere__com__BitMember * __ecereNameSpace__ecere__com__eClass_AddBitMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, int bitSize, int bitPos, int declMode);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

void *  __ecereProp___ecereNameSpace__ecere__sys__File_Get_input(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__sys__File_Set_input(struct __ecereNameSpace__ecere__com__Instance * this, void *  value);

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseInput;

void *  __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__sys__File_Set_output(struct __ecereNameSpace__ecere__com__Instance * this, void *  value);

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseOutput;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Putc;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Flush(struct __ecereNameSpace__ecere__com__Instance * this);

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Tell;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof;

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__Instance *  __ecereNameSpace__ecere__sys__DualPipeOpen(unsigned int mode, const char *  commandLine);

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__DualPipeOpenf(unsigned int mode, const char * command, ...)
{
char commandLine[1025];
va_list args;

__builtin_va_start(args, command);
vsnprintf(commandLine, sizeof (commandLine), command, args);
commandLine[sizeof (commandLine) - 1] = 0;
__builtin_va_end(args);
return __ecereNameSpace__ecere__sys__DualPipeOpen(mode, commandLine);
}

struct __ecereNameSpace__ecere__com__Instance *  __ecereNameSpace__ecere__sys__DualPipeOpenEnv(unsigned int mode, const char *  env, const char *  commandLine);

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__DualPipeOpenEnvf(unsigned int mode, const char * env, const char * command, ...)
{
char commandLine[1025];
va_list args;

__builtin_va_start(args, command);
vsnprintf(commandLine, sizeof (commandLine), command, args);
commandLine[sizeof (commandLine) - 1] = 0;
__builtin_va_end(args);
return __ecereNameSpace__ecere__sys__DualPipeOpenEnv(mode, env, commandLine);
}

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

struct __ecereNameSpace__ecere__com__Method;

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

struct __ecereNameSpace__ecere__com__Property;

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

extern void __ecereNameSpace__ecere__com__eInstance_Watch(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__PipeOpenMode;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__DualPipe;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__File;

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

void __ecereDestructor___ecereNameSpace__ecere__sys__DualPipe(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

{
DualPipe_Destructor(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}
}

size_t __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Read(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char * buffer, size_t size, size_t count)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return DualPipe_Read(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp, buffer, size, count);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Eof(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return DualPipe_Eof(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Peek(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return DualPipe_Peek(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

void __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Terminate(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

DualPipe_Terminate(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetExitCode(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return DualPipe_GetExitCode(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetProcessID(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return DualPipe_GetProcessID(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

void __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Wait(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

DualPipe_Wait(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__DualPipeOpen(unsigned int mode, const char * commandLine)
{
void * input, * output;
void * f = _DualPipeOpen(mode, commandLine, (((void *)0)), &input, &output);

if(f)
return __extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__DualPipe);

((struct __ecereNameSpace__ecere__sys__DualPipe *)(((char *)__ecereInstance1 + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset)))->dp = f, __ecereProp___ecereNameSpace__ecere__sys__File_Set_input(__ecereInstance1, input), __ecereProp___ecereNameSpace__ecere__sys__File_Set_output(__ecereInstance1, output), __ecereInstance1;
});
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__DualPipeOpenEnv(unsigned int mode, const char * env, const char * commandLine)
{
void * input, * output;
void * f = _DualPipeOpen(mode, commandLine, env, &input, &output);

if(f)
return __extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__DualPipe);

((struct __ecereNameSpace__ecere__sys__DualPipe *)(((char *)__ecereInstance1 + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset)))->dp = f, __ecereProp___ecereNameSpace__ecere__sys__File_Set_input(__ecereInstance1, input), __ecereProp___ecereNameSpace__ecere__sys__File_Set_output(__ecereInstance1, output), __ecereInstance1;
});
return (((void *)0));
}

void __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_CloseInput(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

(__ecereProp___ecereNameSpace__ecere__sys__File_Get_input(this) != (((void *)0))) ? (__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseInput]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (void)1;
})) : DualPipe_CloseInput(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

void __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_CloseOutput(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

(__ecereProp___ecereNameSpace__ecere__sys__File_Get_output(this) != (((void *)0))) ? (__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseOutput]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (void)1;
})) : DualPipe_CloseOutput(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

size_t __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Write(struct __ecereNameSpace__ecere__com__Instance * this, const unsigned char * buffer, size_t size, size_t count)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(this) ? (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, buffer, size, count) : (size_t)1;
})) : DualPipe_Write(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp, buffer, size, count);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Getc(struct __ecereNameSpace__ecere__com__Instance * this, char * ch)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return __ecereProp___ecereNameSpace__ecere__sys__File_Get_input(this) ? (__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, ch) : (unsigned int)1;
})) : DualPipe_Getc(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp, ch);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Putc(struct __ecereNameSpace__ecere__com__Instance * this, char ch)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(this) ? (__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, char ch);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, char ch))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Putc]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, ch) : (unsigned int)1;
})) : DualPipe_Putc(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp, ch);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Puts(struct __ecereNameSpace__ecere__com__Instance * this, const char * string)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(this) ? ((__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, string) : (unsigned int)1;
})), __ecereMethod___ecereNameSpace__ecere__sys__File_Flush(this)) : DualPipe_Puts(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp, string);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Seek(struct __ecereNameSpace__ecere__com__Instance * this, long long pos, int mode)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return (__ecereProp___ecereNameSpace__ecere__sys__File_Get_input(this) || __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(this)) ? (__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, pos, mode) : (unsigned int)1;
})) : DualPipe_Seek(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp, pos, mode);
}

uint64 __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Tell(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return (__ecereProp___ecereNameSpace__ecere__sys__File_Get_input(this) || __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(this)) ? (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Tell]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (uint64)1;
})) : DualPipe_Tell(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

uint64 __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetSize(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return (__ecereProp___ecereNameSpace__ecere__sys__File_Get_input(this) || __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(this)) ? (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (uint64)1;
})) : DualPipe_GetSize(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

void __ecereUnregisterModule_DualPipe(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetLinePeek(struct __ecereNameSpace__ecere__com__Instance * this, char * s, int max, int * charsRead)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);
char ch = 0;
int c = 0;

while(c < max - 1 && __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Peek(this) && (__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__DualPipe->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, &ch) : (unsigned int)1;
})) && ch != '\n')
if(ch != '\r')
s[c++] = ch;
s[c] = '\0';
*charsRead = c;
return (__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__DualPipe->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (unsigned int)1;
})) || ch == '\n';
}

void __ecereRegisterModule_DualPipe(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(2, "ecere::sys::PipeOpenMode", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__PipeOpenMode = class;
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "output", "bool", 1, 0, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "error", "bool", 1, 1, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "input", "bool", 1, 2, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "showWindow", "bool", 1, 3, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::sys::DualPipe", "ecere::sys::File", sizeof(struct __ecereNameSpace__ecere__sys__DualPipe), 0, (void *)0, (void *)__ecereDestructor___ecereNameSpace__ecere__sys__DualPipe, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__DualPipe = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Seek", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Seek, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Tell", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Tell, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Read", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Read, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Write", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Write, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Getc", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Getc, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Putc", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Putc, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Puts", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Puts, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Eof", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Eof, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetSize", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetSize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CloseInput", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_CloseInput, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CloseOutput", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_CloseOutput, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetExitCode", "int GetExitCode()", __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetExitCode, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetLinePeek", "bool GetLinePeek(char * s, int max, int * charsRead)", __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetLinePeek, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetProcessID", "int GetProcessID()", __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetProcessID, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Peek", "bool Peek()", __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Peek, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Terminate", "void Terminate()", __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Terminate, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Wait", "void Wait()", __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Wait, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::DualPipeOpenf", "ecere::sys::DualPipe ecere::sys::DualPipeOpenf(ecere::sys::PipeOpenMode mode, const char * command, ...)", __ecereNameSpace__ecere__sys__DualPipeOpenf, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::DualPipeOpen", "ecere::sys::DualPipe ecere::sys::DualPipeOpen(ecere::sys::PipeOpenMode mode, const char * commandLine)", __ecereNameSpace__ecere__sys__DualPipeOpen, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::DualPipeOpenEnvf", "ecere::sys::DualPipe ecere::sys::DualPipeOpenEnvf(ecere::sys::PipeOpenMode mode, const char * env, const char * command, ...)", __ecereNameSpace__ecere__sys__DualPipeOpenEnvf, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::DualPipeOpenEnv", "ecere::sys::DualPipe ecere::sys::DualPipeOpenEnv(ecere::sys::PipeOpenMode mode, const char * env, const char * commandLine)", __ecereNameSpace__ecere__sys__DualPipeOpenEnv, module, 1);
}

