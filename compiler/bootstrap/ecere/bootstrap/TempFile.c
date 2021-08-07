/* Code generated from eC source file: TempFile.ec */
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
struct __ecereNameSpace__ecere__sys__TempFile
{
unsigned char * buffer;
size_t size;
size_t position;
unsigned int eof;
int openMode;
size_t allocated;
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

extern void *  memcpy(void * , const void * , size_t size);

extern size_t strlen(const char * );

struct __ecereNameSpace__ecere__com__Property;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__TempFile_openMode, * __ecerePropM___ecereNameSpace__ecere__sys__TempFile_openMode;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__TempFile_buffer, * __ecerePropM___ecereNameSpace__ecere__sys__TempFile_buffer;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__TempFile_size, * __ecerePropM___ecereNameSpace__ecere__sys__TempFile_size;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__TempFile_allocated, * __ecerePropM___ecereNameSpace__ecere__sys__TempFile_allocated;

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

int __ecereProp___ecereNameSpace__ecere__sys__TempFile_Get_openMode(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__sys__TempFile_Set_openMode(struct __ecereNameSpace__ecere__com__Instance * this, int value);

unsigned char *  __ecereProp___ecereNameSpace__ecere__sys__TempFile_Get_buffer(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__sys__TempFile_Set_buffer(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char *  value);

size_t __ecereProp___ecereNameSpace__ecere__sys__TempFile_Get_size(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__sys__TempFile_Set_size(struct __ecereNameSpace__ecere__com__Instance * this, size_t value);

size_t __ecereProp___ecereNameSpace__ecere__sys__TempFile_Get_allocated(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__sys__TempFile_Set_allocated(struct __ecereNameSpace__ecere__com__Instance * this, size_t value);

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

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

unsigned int __ecereConstructor___ecereNameSpace__ecere__sys__TempFile(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__sys__TempFile->openMode = 5;
return 1;
}

void __ecereDestructor___ecereNameSpace__ecere__sys__TempFile(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

{
(__ecereNameSpace__ecere__com__eSystem_Delete(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer), __ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer = 0);
}
}

size_t __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Read(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char * buffer, size_t size, size_t count)
{
size_t __simpleStruct0;
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);
size_t readSize = size * count;
size_t read = (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size - __ecerePointer___ecereNameSpace__ecere__sys__TempFile->position, (readSize < __simpleStruct0) ? readSize : __simpleStruct0);

if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position >= __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size)
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->eof = 1;
if(buffer && read)
memcpy(buffer, __ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer + __ecerePointer___ecereNameSpace__ecere__sys__TempFile->position, read);
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position += read;
return read / size;
}

size_t __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Write(struct __ecereNameSpace__ecere__com__Instance * this, const unsigned char * buffer, size_t size, size_t count)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);
size_t writeSize = size * count;
size_t written = writeSize;

if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size - __ecerePointer___ecereNameSpace__ecere__sys__TempFile->position < writeSize)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size += writeSize - (__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size - __ecerePointer___ecereNameSpace__ecere__sys__TempFile->position);
if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->allocated < __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->allocated *= 2;
if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->allocated < __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size)
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->allocated = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size * 2;
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer = __ecereNameSpace__ecere__com__eSystem_Renew0(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer, sizeof(unsigned char) * (__ecerePointer___ecereNameSpace__ecere__sys__TempFile->allocated));
}
}
if(writeSize)
memcpy(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer + __ecerePointer___ecereNameSpace__ecere__sys__TempFile->position, buffer, writeSize);
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position += written;
return written / size;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Getc(struct __ecereNameSpace__ecere__com__Instance * this, char * ch)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);
long long read = (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__TempFile->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, ch, 1, 1) : (size_t)1;
}));

return !__ecerePointer___ecereNameSpace__ecere__sys__TempFile->eof && read != 0;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Putc(struct __ecereNameSpace__ecere__com__Instance * this, char ch)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);
long long written = (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__TempFile->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, &ch, 1, 1) : (size_t)1;
}));

return written != 0;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Puts(struct __ecereNameSpace__ecere__com__Instance * this, const char * string)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);
int len = string ? strlen(string) : 0;
long long written = (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__TempFile->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, string, 1, len) : (size_t)1;
}));

return written == len;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Seek(struct __ecereNameSpace__ecere__com__Instance * this, long long pos, int mode)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);
unsigned int result = 1;
uint64 increase = 0;

switch(mode)
{
case 0:
{
if(pos >= __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size)
{
if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->openMode == 4)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = pos;
increase = pos - __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size;
}
else
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size;
result = 0;
}
}
else if(pos < 0)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = 0;
result = 0;
}
else
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = pos;
break;
}
case 1:
{
if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position + pos >= __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size)
{
if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->openMode == 4)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position += pos;
increase = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->position - __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size;
}
else
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size;
result = 0;
}
}
else if((long long)__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position + pos < 0)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = 0;
result = 0;
}
else
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position += pos;
break;
}
case 2:
{
if((long long)__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size + pos >= (long long)__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size)
{
if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->openMode == 4)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size + pos;
increase = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->position - __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size;
}
else
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size;
result = 0;
}
}
else if((int)__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size + pos < 0)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = 0;
result = 0;
}
else
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size + pos;
break;
}
}
if(result)
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->eof = 0;
if(increase)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size += increase;
if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size > __ecerePointer___ecereNameSpace__ecere__sys__TempFile->allocated)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->allocated = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size;
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer = __ecereNameSpace__ecere__com__eSystem_Renew0(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer, sizeof(unsigned char) * (__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size));
}
}
return result;
}

uint64 __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Tell(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__TempFile->position;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Eof(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__TempFile->eof;
}

uint64 __ecereMethod___ecereNameSpace__ecere__sys__TempFile_GetSize(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Truncate(struct __ecereNameSpace__ecere__com__Instance * this, uint64 size)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer, sizeof(unsigned char) * (size));
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size = size;
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->allocated = size;
if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position > size)
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = size;
return 1;
}

int __ecereProp___ecereNameSpace__ecere__sys__TempFile_Get_openMode(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__TempFile->openMode;
}

void __ecereProp___ecereNameSpace__ecere__sys__TempFile_Set_openMode(struct __ecereNameSpace__ecere__com__Instance * this, int value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__sys__TempFile->openMode = value;
__ecereProp___ecereNameSpace__ecere__sys__TempFile_openMode && __ecereProp___ecereNameSpace__ecere__sys__TempFile_openMode->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__TempFile_openMode) : (void)0, __ecerePropM___ecereNameSpace__ecere__sys__TempFile_openMode && __ecerePropM___ecereNameSpace__ecere__sys__TempFile_openMode->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__TempFile_openMode) : (void)0;
}

unsigned char *  __ecereProp___ecereNameSpace__ecere__sys__TempFile_Get_buffer(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer;
}

void __ecereProp___ecereNameSpace__ecere__sys__TempFile_Set_buffer(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char *  value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

(__ecereNameSpace__ecere__com__eSystem_Delete(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer), __ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer = 0);
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer = value;
__ecereProp___ecereNameSpace__ecere__sys__TempFile_buffer && __ecereProp___ecereNameSpace__ecere__sys__TempFile_buffer->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__TempFile_buffer) : (void)0, __ecerePropM___ecereNameSpace__ecere__sys__TempFile_buffer && __ecerePropM___ecereNameSpace__ecere__sys__TempFile_buffer->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__TempFile_buffer) : (void)0;
}

size_t __ecereProp___ecereNameSpace__ecere__sys__TempFile_Get_size(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size;
}

void __ecereProp___ecereNameSpace__ecere__sys__TempFile_Set_size(struct __ecereNameSpace__ecere__com__Instance * this, size_t value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size = value;
__ecereProp___ecereNameSpace__ecere__sys__TempFile_size && __ecereProp___ecereNameSpace__ecere__sys__TempFile_size->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__TempFile_size) : (void)0, __ecerePropM___ecereNameSpace__ecere__sys__TempFile_size && __ecerePropM___ecereNameSpace__ecere__sys__TempFile_size->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__TempFile_size) : (void)0;
}

size_t __ecereProp___ecereNameSpace__ecere__sys__TempFile_Get_allocated(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__TempFile->allocated;
}

void __ecereProp___ecereNameSpace__ecere__sys__TempFile_Set_allocated(struct __ecereNameSpace__ecere__com__Instance * this, size_t value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__sys__TempFile->allocated = value;
__ecereProp___ecereNameSpace__ecere__sys__TempFile_allocated && __ecereProp___ecereNameSpace__ecere__sys__TempFile_allocated->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__TempFile_allocated) : (void)0, __ecerePropM___ecereNameSpace__ecere__sys__TempFile_allocated && __ecerePropM___ecereNameSpace__ecere__sys__TempFile_allocated->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__TempFile_allocated) : (void)0;
}

unsigned char * __ecereMethod___ecereNameSpace__ecere__sys__TempFile_StealBuffer(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);
unsigned char * result = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer;

__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer = (((void *)0));
return result;
}

void __ecereUnregisterModule_TempFile(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__sys__TempFile_openMode = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__TempFile_buffer = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__TempFile_size = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__TempFile_allocated = (void *)0;
}

void __ecereRegisterModule_TempFile(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::sys::TempFile", "ecere::sys::File", sizeof(struct __ecereNameSpace__ecere__sys__TempFile), 0, (void *)__ecereConstructor___ecereNameSpace__ecere__sys__TempFile, (void *)__ecereDestructor___ecereNameSpace__ecere__sys__TempFile, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__TempFile = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Seek", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Seek, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Tell", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Tell, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Read", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Read, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Write", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Write, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Getc", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Getc, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Putc", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Putc, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Puts", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Puts, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Eof", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Eof, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Truncate", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Truncate, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetSize", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_GetSize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "StealBuffer", "byte * StealBuffer()", __ecereMethod___ecereNameSpace__ecere__sys__TempFile_StealBuffer, 1);
__ecerePropM___ecereNameSpace__ecere__sys__TempFile_openMode = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "openMode", "ecere::sys::FileOpenMode", __ecereProp___ecereNameSpace__ecere__sys__TempFile_Set_openMode, __ecereProp___ecereNameSpace__ecere__sys__TempFile_Get_openMode, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__sys__TempFile_openMode = __ecerePropM___ecereNameSpace__ecere__sys__TempFile_openMode, __ecerePropM___ecereNameSpace__ecere__sys__TempFile_openMode = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__TempFile_buffer = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "buffer", "byte *", __ecereProp___ecereNameSpace__ecere__sys__TempFile_Set_buffer, __ecereProp___ecereNameSpace__ecere__sys__TempFile_Get_buffer, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__sys__TempFile_buffer = __ecerePropM___ecereNameSpace__ecere__sys__TempFile_buffer, __ecerePropM___ecereNameSpace__ecere__sys__TempFile_buffer = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__TempFile_size = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "size", "uintsize", __ecereProp___ecereNameSpace__ecere__sys__TempFile_Set_size, __ecereProp___ecereNameSpace__ecere__sys__TempFile_Get_size, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__sys__TempFile_size = __ecerePropM___ecereNameSpace__ecere__sys__TempFile_size, __ecerePropM___ecereNameSpace__ecere__sys__TempFile_size = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__TempFile_allocated = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "allocated", "uintsize", __ecereProp___ecereNameSpace__ecere__sys__TempFile_Set_allocated, __ecereProp___ecereNameSpace__ecere__sys__TempFile_Get_allocated, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__sys__TempFile_allocated = __ecerePropM___ecereNameSpace__ecere__sys__TempFile_allocated, __ecerePropM___ecereNameSpace__ecere__sys__TempFile_allocated = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, (((void *)0)), (((void *)0)), 0, sizeof(void *) > 4 ? sizeof(void *) : 4, 2);
}

