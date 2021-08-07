/* Code generated from eC source file: BufferedFile.ec */
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
extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__File_buffered;

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

struct __ecereNameSpace__ecere__sys__File
{
void *  input;
void *  output;
} ecere_gcc_struct;

extern void *  memcpy(void * , const void * , size_t size);

extern size_t strlen(const char * );

struct __ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__Property;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_handle, * __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_handle;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_bufferSize, * __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferSize;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_bufferRead, * __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferRead;

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} ecere_gcc_struct;

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

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

struct __ecereNameSpace__ecere__sys__BufferedFile
{
int mode;
struct __ecereNameSpace__ecere__com__Instance * handle;
size_t bufferSize;
size_t bufferCount;
size_t bufferPos;
uint64 pos;
unsigned char * buffer;
unsigned int eof;
size_t bufferRead;
uint64 fileSize;
} ecere_gcc_struct;

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpen(const char *  fileName, int mode);

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseInput;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseOutput;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Truncate;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Lock;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Unlock;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize;

void __ecereProp___ecereNameSpace__ecere__sys__File_Set_buffered(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value);

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_handle(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_handle(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * value);

size_t __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_bufferSize(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_bufferSize(struct __ecereNameSpace__ecere__com__Instance * this, size_t value);

size_t __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_bufferRead(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_bufferRead(struct __ecereNameSpace__ecere__com__Instance * this, size_t value);

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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BufferedFile;

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

unsigned int __ecereConstructor___ecereNameSpace__ecere__sys__BufferedFile(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_bufferSize(this, 512 * 1024);
__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_bufferRead(this, 1 * 1024);
return 1;
}

void __ecereDestructor___ecereNameSpace__ecere__sys__BufferedFile(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

{
(__ecereNameSpace__ecere__com__eInstance_DecRef(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle), __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer), __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer = 0);
}
}

void __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_CloseInput(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseInput]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle) : (void)1;
}));
}

void __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_CloseOutput(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseOutput]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle) : (void)1;
}));
}

size_t __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Read(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char * buffer, size_t size, size_t count)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

if(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle)
{
size_t totalBytesRead = 0;
size_t bufferCount = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount;
size_t bufferPos = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos;
unsigned char * fileBuffer = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer + bufferPos;
size_t readCount = count;

readCount *= size;
while(1)
{
size_t bytesRead = (bufferCount > bufferPos) ? (bufferCount - bufferPos) : 0;

if(bytesRead > readCount)
bytesRead = readCount;
if(bytesRead)
{
memcpy(buffer + totalBytesRead, fileBuffer, bytesRead);
bufferPos += bytesRead;
totalBytesRead += bytesRead;
readCount -= bytesRead;
}
if(readCount)
{
size_t read;

if(readCount < __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize)
{
size_t __simpleStruct0;

read = (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferRead, (readCount > __simpleStruct0) ? readCount : __simpleStruct0);
if(bufferPos > bufferCount)
{
if(bufferPos + readCount - bufferCount > read && (bufferPos + readCount - bufferCount < bufferCount))
read = bufferPos + readCount - bufferCount;
else
{
bufferPos = 0;
bufferCount = 0;
}
}
if(bufferCount + read > __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize)
{
bufferPos = 0;
bufferCount = 0;
}
}
else
{
read = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize;
bufferPos = 0;
bufferCount = 0;
}
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos + totalBytesRead - bufferPos + bufferCount, 0) : (unsigned int)1;
}));
read = (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer + bufferCount, 1, (unsigned int)read) : (size_t)1;
}));
fileBuffer = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer + bufferPos;
bufferCount += read;
if(!read)
{
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->eof = 1;
break;
}
}
else
break;
}
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = bufferCount;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos = bufferPos;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos += totalBytesRead;
return totalBytesRead / size;
}
return 0;
}

size_t __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Write(struct __ecereNameSpace__ecere__com__Instance * this, const unsigned char * buffer, size_t size, size_t count)
{
unsigned long long __simpleStruct0, __simpleStruct1;
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);
size_t result;
size_t numBytes;
size_t bytesToBuffer;
size_t missing;

(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos, 0) : (unsigned int)1;
}));
result = (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, buffer, size, count) : (size_t)1;
}));
numBytes = result * size;
bytesToBuffer = (__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize > __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos) ? (__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos) : 0;
missing = numBytes - bytesToBuffer;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos += numBytes;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->fileSize = (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->fileSize, __simpleStruct1 = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
if(bytesToBuffer < numBytes && __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount >= __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos && numBytes < __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize && missing < __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos)
{
memcpy(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer + missing, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos - missing);
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos -= missing;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount -= missing;
bytesToBuffer += missing;
}
if(bytesToBuffer >= numBytes)
{
size_t __simpleStruct0, __simpleStruct1;

bytesToBuffer = numBytes;
memcpy(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer + __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos, buffer, bytesToBuffer);
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos += bytesToBuffer;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount, __simpleStruct1 = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
}
else
{
size_t __simpleStruct0;

bytesToBuffer = (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize, (numBytes < __simpleStruct0) ? numBytes : __simpleStruct0);
memcpy(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer, buffer + numBytes - bytesToBuffer, bytesToBuffer);
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos = bytesToBuffer;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = (unsigned int)bytesToBuffer;
}
return result;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Getc(struct __ecereNameSpace__ecere__com__Instance * this, char * ch)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

if(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle)
{
while(1)
{
if(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount > __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos)
{
*ch = *(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer + __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos);
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos++;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos++;
return 1;
}
else
{
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos = 0;
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos, 0) : (unsigned int)1;
}));
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer, 1, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize) : (size_t)1;
}));
if(!__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount)
{
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->eof = 1;
break;
}
}
}
}
return 0;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Putc(struct __ecereNameSpace__ecere__com__Instance * this, char ch)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);
long long written = (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__BufferedFile->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, &ch, 1, 1) : (size_t)1;
}));

return written != 0;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Puts(struct __ecereNameSpace__ecere__com__Instance * this, const char * string)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);
int len = strlen(string);
long long written = (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__BufferedFile->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, string, 1, len) : (size_t)1;
}));

return written == len;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Seek(struct __ecereNameSpace__ecere__com__Instance * this, long long pos, int mode)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);
uint64 newPosition = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos;

switch(mode)
{
case 0:
newPosition = pos;
break;
case 1:
newPosition += pos;
break;
case 2:
{
newPosition = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->fileSize + pos;
break;
}
}
if(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos != newPosition)
{
if(newPosition >= __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos && newPosition < __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos + __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize)
{
if(newPosition < __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos + __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount)
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos += newPosition - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos;
else
{
size_t read = newPosition - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount;

if(read < __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount * 2)
{
if(read > __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize)
{
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = 0;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos = 0;
}
else
{
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos + __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount, 0) : (unsigned int)1;
}));
read = (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer + __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount, 1, (unsigned int)read) : (size_t)1;
}));
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos += newPosition - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount += read;
}
}
else
{
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = 0;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos = 0;
}
}
}
else
{
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = 0;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos = 0;
}
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->eof = newPosition > __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->fileSize;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos = newPosition;
}
return !__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->eof;
}

uint64 __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Tell(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Eof(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->eof;
}

uint64 __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_GetSize(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->fileSize;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Truncate(struct __ecereNameSpace__ecere__com__Instance * this, uint64 size)
{
unsigned long long __simpleStruct1;
size_t __simpleStruct0;
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);
uint64 bytesAhead = size - (__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos - __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos);

(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, uint64 size);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 size))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Truncate]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, size) : (unsigned int)1;
}));
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount, (__simpleStruct0 < bytesAhead) ? __simpleStruct0 : bytesAhead);
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->fileSize = (__simpleStruct1 = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->fileSize, (__simpleStruct1 < size) ? __simpleStruct1 : size);
return 1;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Lock(struct __ecereNameSpace__ecere__com__Instance * this, int type, uint64 start, uint64 length, unsigned int wait)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

return (__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, int type, uint64 start, uint64 length, unsigned int wait);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int type, uint64 start, uint64 length, unsigned int wait))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Lock]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, type, start, length, wait) : (unsigned int)1;
}));
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Unlock(struct __ecereNameSpace__ecere__com__Instance * this, uint64 start, uint64 length, unsigned int wait)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

return (__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, uint64 start, uint64 length, unsigned int wait);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 start, uint64 length, unsigned int wait))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Unlock]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle, start, length, wait) : (unsigned int)1;
}));
}

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_handle(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle;
}

void __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_handle(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

if(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle)
(__ecereNameSpace__ecere__com__eInstance_DecRef(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle), __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle = 0);
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle = value;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = 0;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferPos = 0;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->pos = 0;
if(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle)
{
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->handle->_refCount++;
}
__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_handle && __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_handle->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_handle) : (void)0, __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_handle && __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_handle->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_handle) : (void)0;
}

size_t __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_bufferSize(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize;
}

void __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_bufferSize(struct __ecereNameSpace__ecere__com__Instance * this, size_t value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize = value;
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->buffer, sizeof(unsigned char) * (value));
if(__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount > __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize)
__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferCount = __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferSize;
__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_bufferSize && __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_bufferSize->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_bufferSize) : (void)0, __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferSize && __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferSize->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferSize) : (void)0;
}

size_t __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_bufferRead(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferRead;
}

void __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_bufferRead(struct __ecereNameSpace__ecere__com__Instance * this, size_t value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__BufferedFile * __ecerePointer___ecereNameSpace__ecere__sys__BufferedFile = (struct __ecereNameSpace__ecere__sys__BufferedFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->structSize) : 0);

__ecerePointer___ecereNameSpace__ecere__sys__BufferedFile->bufferRead = value;
__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_bufferRead && __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_bufferRead->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_bufferRead) : (void)0, __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferRead && __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferRead->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferRead) : (void)0;
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpenBuffered(const char * fileName, int mode)
{
struct __ecereNameSpace__ecere__com__Instance * result = (((void *)0));

{
struct __ecereNameSpace__ecere__com__Instance * handle = __ecereNameSpace__ecere__sys__FileOpen(fileName, mode);

if(handle)
{
struct __ecereNameSpace__ecere__com__Instance * f = (f = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__BufferedFile), ((struct __ecereNameSpace__ecere__sys__BufferedFile *)(((char *)f + __ecereClass___ecereNameSpace__ecere__sys__File->structSize)))->mode = mode, ((struct __ecereNameSpace__ecere__sys__BufferedFile *)(((char *)f + __ecereClass___ecereNameSpace__ecere__sys__File->structSize)))->pos = 0, __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_handle(f, handle), ((struct __ecereNameSpace__ecere__sys__BufferedFile *)(((char *)f + __ecereClass___ecereNameSpace__ecere__sys__File->structSize)))->fileSize = (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = handle;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize]);
__internal_VirtualMethod ? __internal_VirtualMethod(handle) : (uint64)1;
})), f);

__ecereProp___ecereNameSpace__ecere__sys__File_Set_buffered(handle, 1);
result = f;
}
}
return result;
}

void __ecereUnregisterModule_BufferedFile(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_handle = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferSize = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferRead = (void *)0;
}

void __ecereRegisterModule_BufferedFile(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::sys::BufferedFile", "ecere::sys::File", sizeof(struct __ecereNameSpace__ecere__sys__BufferedFile), 0, (void *)__ecereConstructor___ecereNameSpace__ecere__sys__BufferedFile, (void *)__ecereDestructor___ecereNameSpace__ecere__sys__BufferedFile, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__BufferedFile = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Seek", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Seek, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Tell", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Tell, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Read", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Read, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Write", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Write, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Getc", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Getc, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Putc", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Putc, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Puts", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Puts, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Eof", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Eof, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Truncate", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Truncate, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetSize", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_GetSize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CloseInput", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_CloseInput, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CloseOutput", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_CloseOutput, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Lock", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Lock, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Unlock", 0, __ecereMethod___ecereNameSpace__ecere__sys__BufferedFile_Unlock, 1);
__ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_handle = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "handle", "ecere::sys::File", __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_handle, __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_handle, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_handle = __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_handle, __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_handle = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferSize = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "bufferSize", "uintsize", __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_bufferSize, __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_bufferSize, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_bufferSize = __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferSize, __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferSize = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferRead = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "bufferRead", "uintsize", __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Set_bufferRead, __ecereProp___ecereNameSpace__ecere__sys__BufferedFile_Get_bufferRead, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__sys__BufferedFile_bufferRead = __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferRead, __ecerePropM___ecereNameSpace__ecere__sys__BufferedFile_bufferRead = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, (((void *)0)), (((void *)0)), 0, sizeof(void *) > 8 ? sizeof(void *) : 8, 2);
if(class)
class->fixed = (unsigned int)1;
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::FileOpenBuffered", "ecere::sys::BufferedFile ecere::sys::FileOpenBuffered(const char * fileName, ecere::sys::FileOpenMode mode)", __ecereNameSpace__ecere__sys__FileOpenBuffered, module, 1);
}

