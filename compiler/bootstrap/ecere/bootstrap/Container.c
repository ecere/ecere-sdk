/* Code generated from eC source file: Container.ec */
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
extern int __ecereVMethodID_class_OnCompare;

extern int __ecereVMethodID_class_OnGetString;

extern int __ecereVMethodID_class_OnSerialize;

extern int __ecereVMethodID_class_OnUnserialize;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Class_char__PTR_;

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

struct __ecereNameSpace__ecere__com__IteratorPointer;

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

extern int strcmp(const char * , const char * );

extern char *  strcat(char * , const char * );

extern void *  memset(void *  area, int value, size_t count);

extern unsigned int __ecereNameSpace__ecere__com__log2i(unsigned int number);

struct __ecereNameSpace__ecere__com__ClassTemplateParameter;

extern int __ecereVMethodID_class_OnCompare;

extern int __ecereVMethodID_class_OnCopy;

extern int __ecereVMethodID_class_OnGetString;

extern int __ecereVMethodID_class_OnFree;

struct __ecereNameSpace__ecere__com__Property;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Iterator_data, * __ecerePropM___ecereNameSpace__ecere__com__Iterator_data;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Container_copySrc, * __ecerePropM___ecereNameSpace__ecere__com__Container_copySrc;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Container_firstIterator, * __ecerePropM___ecereNameSpace__ecere__com__Container_firstIterator;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Container_lastIterator, * __ecerePropM___ecereNameSpace__ecere__com__Container_lastIterator;

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

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  dataType, void *  setStmt, void *  getStmt, int declMode);

extern void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(struct __ecereNameSpace__ecere__com__Class * base);

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetLast;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetPrev;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Insert;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Move;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Copy;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Find;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_FreeIterator;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetCount;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Free;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Delete;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Sort;

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

struct __ecereNameSpace__ecere__com__Iterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} ecere_gcc_struct;

void __ecereProp___ecereNameSpace__ecere__com__Container_Set_copySrc(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * value);

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__Container_GetFirst(struct __ecereNameSpace__ecere__com__Instance * this)
{
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__Container_GetLast(struct __ecereNameSpace__ecere__com__Instance * this)
{
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__Container_GetPrev(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer)
{
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__Container_GetNext(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer)
{
return (((void *)0));
}

uint64 __ecereMethod___ecereNameSpace__ecere__com__Container_GetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer)
{
return (uint64)0;
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__Container_GetAtPosition(struct __ecereNameSpace__ecere__com__Instance * this, const uint64 pos, unsigned int create, unsigned int * justAdded)
{
return (((void *)0));
}

extern int __ecereVMethodID_class_OnSerialize;

extern int __ecereVMethodID_class_OnUnserialize;

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Put(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, const void * data);

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Get(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * *  data);

uint64 __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(struct __ecereNameSpace__ecere__com__Iterator * this);

void __ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(struct __ecereNameSpace__ecere__com__Iterator * this, uint64 value);

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

extern struct __ecereNameSpace__ecere__com__ClassTemplateParameter * __ecereNameSpace__ecere__com__eClass_AddTemplateParameter(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, int type, const void *  info, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * defaultArg);

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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Iterator;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Container;

void __ecereMethod___ecereNameSpace__ecere__com__Container_OnFree(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance * this)
{
if((struct __ecereNameSpace__ecere__com__Instance *)this)
{
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Free]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (void)1;
}));
(__ecereNameSpace__ecere__com__eInstance_DecRef(this), this = 0);
}
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_int;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_int64;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_uint64;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_uint;

const char *  __ecereProp___ecereNameSpace__ecere__com__Class_Get_char__PTR_(struct __ecereNameSpace__ecere__com__Class * this);

struct __ecereNameSpace__ecere__com__Class * __ecereProp___ecereNameSpace__ecere__com__Class_Set_char__PTR_(const char *  value);

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

uint64 __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(struct __ecereNameSpace__ecere__com__Iterator * this)
{
return (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData]);
__internal_VirtualMethod ? __internal_VirtualMethod(this->container, this->pointer) : (uint64)1;
}));
}

void __ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(struct __ecereNameSpace__ecere__com__Iterator * this, uint64 value)
{
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData]);
__internal_VirtualMethod ? __internal_VirtualMethod(this->container, this->pointer, value) : (unsigned int)1;
}));
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Prev(struct __ecereNameSpace__ecere__com__Iterator * this)
{
if(this->pointer && this->container)
this->pointer = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetPrev]);
__internal_VirtualMethod ? __internal_VirtualMethod(this->container, this->pointer) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
else if(this->container)
this->pointer = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetLast]);
__internal_VirtualMethod ? __internal_VirtualMethod(this->container) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
return this->pointer != (((void *)0));
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Next(struct __ecereNameSpace__ecere__com__Iterator * this)
{
if(this->pointer && this->container)
this->pointer = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext]);
__internal_VirtualMethod ? __internal_VirtualMethod(this->container, this->pointer) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
else if(this->container)
this->pointer = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst]);
__internal_VirtualMethod ? __internal_VirtualMethod(this->container) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
return this->pointer != (((void *)0));
}

uint64 __ecereMethod___ecereNameSpace__ecere__com__Iterator_GetData(struct __ecereNameSpace__ecere__com__Iterator * this)
{
return (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData]);
__internal_VirtualMethod ? __internal_VirtualMethod(this->container, this->pointer) : (uint64)1;
}));
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_SetData(struct __ecereNameSpace__ecere__com__Iterator * this, uint64 value)
{
return (__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData]);
__internal_VirtualMethod ? __internal_VirtualMethod(this->container, this->pointer, value) : (unsigned int)1;
}));
}

void __ecereMethod___ecereNameSpace__ecere__com__Iterator_Remove(struct __ecereNameSpace__ecere__com__Iterator * this)
{
if(this->container)
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove]);
__internal_VirtualMethod ? __internal_VirtualMethod(this->container, this->pointer) : (void)1;
}));
this->pointer = (((void *)0));
}

void __ecereMethod___ecereNameSpace__ecere__com__Iterator_Free(struct __ecereNameSpace__ecere__com__Iterator * this)
{
if(this->container)
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_FreeIterator]);
__internal_VirtualMethod ? __internal_VirtualMethod(this->container, this->pointer) : (void)1;
}));
}

void __ecereDestructor___ecereNameSpace__ecere__com__Container(struct __ecereNameSpace__ecere__com__Instance * this)
{
{
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (void)1;
}));
}
}

void __ecereProp___ecereNameSpace__ecere__com__Container_Set_copySrc(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * value)
{
if(value)
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__Instance * source);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__Instance * source))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Copy]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, value) : (void)1;
}));
__ecereProp___ecereNameSpace__ecere__com__Container_copySrc && __ecereProp___ecereNameSpace__ecere__com__Container_copySrc->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__com__Container_copySrc) : (void)0, __ecerePropM___ecereNameSpace__ecere__com__Container_copySrc && __ecerePropM___ecereNameSpace__ecere__com__Container_copySrc->selfWatchable ? __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__com__Container_copySrc) : (void)0;
}

void __ecereProp___ecereNameSpace__ecere__com__Container_Get_firstIterator(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Iterator * value)
{
struct __ecereNameSpace__ecere__com__Iterator __simpleStruct0;

*value = (__simpleStruct0.container = (struct __ecereNameSpace__ecere__com__Instance *)this, __simpleStruct0.pointer = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})), __simpleStruct0);
}

void __ecereProp___ecereNameSpace__ecere__com__Container_Get_lastIterator(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Iterator * value)
{
struct __ecereNameSpace__ecere__com__Iterator __simpleStruct0;

*value = (__simpleStruct0.container = (struct __ecereNameSpace__ecere__com__Instance *)this, __simpleStruct0.pointer = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetLast]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})), __simpleStruct0);
}

void __ecereMethod___ecereNameSpace__ecere__com__Container_RemoveAll(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i, * next;

for(i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})), next = i ? (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})) : (((void *)0)); i; i = next, next = i ? (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})) : (((void *)0)))
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (void)1;
}));
}

void __ecereMethod___ecereNameSpace__ecere__com__Container_Copy(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * source)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i;

(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (void)1;
}));
for(i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = source;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst]);
__internal_VirtualMethod ? __internal_VirtualMethod(source) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})); i; i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = source;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext]);
__internal_VirtualMethod ? __internal_VirtualMethod(source, i) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})))
{
uint64 data = (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = source;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData]);
__internal_VirtualMethod ? __internal_VirtualMethod(source, i) : (uint64)1;
}));

(__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, data) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
}
}

int __ecereMethod___ecereNameSpace__ecere__com__Container_OnCompare(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * b)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * ia, * ib;
struct __ecereNameSpace__ecere__com__Class * Dclass = class->templateArgs[2].__anon1.__anon1.dataTypeClass;
unsigned int byRef = (Dclass->type == 1000 && !Dclass->byValueSystemClass) || Dclass->type == 2 || Dclass->type == 4 || Dclass->type == 3;
int (* onCompare)(void *, const void *, const void *) = (void *)Dclass->_vTbl[__ecereVMethodID_class_OnCompare];

if(this && !b)
return 1;
if(b && !this)
return -1;
if(!b && !this)
return 0;
if((__extension__ ({
int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetCount]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (int)1;
})) > (__extension__ ({
int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = b;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetCount]);
__internal_VirtualMethod ? __internal_VirtualMethod(b) : (int)1;
})))
return 1;
if((__extension__ ({
int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetCount]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (int)1;
})) < (__extension__ ({
int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = b;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetCount]);
__internal_VirtualMethod ? __internal_VirtualMethod(b) : (int)1;
})))
return -1;
ia = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
ib = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = b;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst]);
__internal_VirtualMethod ? __internal_VirtualMethod(b) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
while(ia && ib)
{
uint64 dataA = (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, ia) : (uint64)1;
}));
uint64 dataB = (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = b;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData]);
__internal_VirtualMethod ? __internal_VirtualMethod(b, ib) : (uint64)1;
}));
int r = onCompare(Dclass, byRef ? ((char *)&dataA + __ENDIAN_PAD(class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)) : (const void *)(uintptr_t)dataA, byRef ? ((char *)&dataB + __ENDIAN_PAD(class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)) : (const void *)(uintptr_t)dataB);

if(r)
return r;
ia = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, ia) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
ib = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = b;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext]);
__internal_VirtualMethod ? __internal_VirtualMethod(b, ib) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
}
if(ia)
return 1;
if(ib)
return -1;
return 0;
}

int __ecereMethod___ecereNameSpace__ecere__com__Container_GetCount(struct __ecereNameSpace__ecere__com__Instance * this)
{
int count = 0;
struct __ecereNameSpace__ecere__com__IteratorPointer * i;

for(i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})); i; i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})))
count++;
return count;
}

void __ecereMethod___ecereNameSpace__ecere__com__Container_Free(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i;

while((i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}))))
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * i);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * i))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Delete]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (void)1;
}));
}

const char * __ecereMethod___ecereNameSpace__ecere__com__Container_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance * this, char * tempString, void * fieldData, unsigned int * onType)
{
if((struct __ecereNameSpace__ecere__com__Instance *)this)
{
char itemString[4096];
unsigned int first = 1;
struct __ecereNameSpace__ecere__com__IteratorPointer * i;

tempString[0] = '\0';
for(i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})); i; i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})))
{
struct __ecereNameSpace__ecere__com__Class * Dclass = class->templateArgs[2].__anon1.__anon1.dataTypeClass;
uint64 data = (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (uint64)1;
}));
const char * result;

itemString[0] = '\0';
result = ((const char * (*)(void *, void *, char *, void *, unsigned int *))(void *)Dclass->_vTbl[__ecereVMethodID_class_OnGetString])(Dclass, ((Dclass->type == 1000 && !Dclass->byValueSystemClass) || Dclass->type == 2 || Dclass->type == 4 || Dclass->type == 3) ? ((char *)&data + __ENDIAN_PAD(class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)) : (void *)(uintptr_t)data, itemString, (((void *)0)), (((void *)0)));
if(!first)
strcat(tempString, ", ");
strcat(tempString, result);
first = 0;
}
}
else
tempString[0] = 0;
return tempString;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Container_TakeOut(struct __ecereNameSpace__ecere__com__Instance * this, const uint64 d)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 value);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Find]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, d) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));

if(i)
{
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (void)1;
}));
return 1;
}
return 0;
}

static __attribute__((unused)) void UnusedFunction()
{
int a = 0;

(__extension__ ({
int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , const void * object);

__internal_VirtualMethod = ((int (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, const void * object))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnCompare]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecereClass_int, (void *)&a, (((void *)0))) : (int)1;
}));
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , const void * newData);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, const void * newData))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnCopy]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecereClass_int, (void *)&a, (((void *)0))) : (void)1;
}));
(__extension__ ({
const char *  (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , char *  tempString, void *  reserved, unsigned int *  onType);

__internal_VirtualMethod = ((const char *  (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, char *  tempString, void *  reserved, unsigned int *  onType))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnGetString]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecereClass_int, (void *)&a, (((void *)0)), (((void *)0)), (((void *)0))) : (const char * )1;
}));
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , struct __ecereNameSpace__ecere__com__Instance * channel);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, struct __ecereNameSpace__ecere__com__Instance * channel))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnSerialize]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecereClass_int, (void *)&a, (((void *)0))) : (void)1;
}));
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , struct __ecereNameSpace__ecere__com__Instance * channel);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, struct __ecereNameSpace__ecere__com__Instance * channel))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnUnserialize]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecereClass_int, (void *)&a, (((void *)0))) : (void)1;
}));
}

void __ecereMethod___ecereNameSpace__ecere__com__Container_OnCopy(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance ** this, struct __ecereNameSpace__ecere__com__Instance * source)
{
if((struct __ecereNameSpace__ecere__com__Instance *)source)
{
struct __ecereNameSpace__ecere__com__Instance * container = __ecereNameSpace__ecere__com__eInstance_New(((struct __ecereNameSpace__ecere__com__Instance *)(char *)source)->_class);

(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__Instance * source);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__Instance * source))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Copy]);
__internal_VirtualMethod ? __internal_VirtualMethod(container, (struct __ecereNameSpace__ecere__com__Instance *)source) : (void)1;
}));
(*this) = container;
}
else
{
(*this) = (((void *)0));
}
}

void __ecereMethod___ecereNameSpace__ecere__com__Container_Delete(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * i)
{
uint64 data = (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (uint64)1;
}));

(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance * )(char * )this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass, ((void * )((uintptr_t)(data)))), data = 0);
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (void)1;
}));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__Container_Find(struct __ecereNameSpace__ecere__com__Instance * this, const uint64 value)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i;
struct __ecereNameSpace__ecere__com__Class * Dclass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass;
unsigned int byRef = (Dclass->type == 1000 && !Dclass->byValueSystemClass) || Dclass->type == 2 || Dclass->type == 4 || Dclass->type == 3;
int (* onCompare)(void *, const void *, const void *) = (void *)Dclass->_vTbl[__ecereVMethodID_class_OnCompare];
unsigned int isInt64 = 0;

if(onCompare == (void *)__ecereClass_int64->_vTbl[__ecereVMethodID_class_OnCompare] || (Dclass->type == 3 && Dclass->typeSize == sizeof(long long) && !strcmp(Dclass->name, "Id")))
{
onCompare = (void *)((int (*)(struct __ecereNameSpace__ecere__com__Class * class, void *, const void * object))__ecereClass_uint64->_vTbl[__ecereVMethodID_class_OnCompare]);
isInt64 = 1;
}
if(isInt64)
{
for(i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})); i; i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})))
{
uint64 data = (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (uint64)1;
}));

if(((uint64)(value)) == ((uint64)(data)))
return i;
}
}
else if(byRef)
{
for(i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})); i; i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})))
{
uint64 data = (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (uint64)1;
}));
int result = onCompare(Dclass, ((char *)&value + __ENDIAN_PAD(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)), ((char *)&data + __ENDIAN_PAD(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)));

if(!result)
return i;
}
}
else
{
for(i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})); i; i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})))
{
uint64 data = (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (uint64)1;
}));
int result = onCompare(Dclass, (const void *)(uintptr_t)value, (const void *)(uintptr_t)data);

if(!result)
return i;
}
}
return (((void *)0));
}

void __ecereMethod___ecereNameSpace__ecere__com__Container_OnSerialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned int count = (struct __ecereNameSpace__ecere__com__Instance *)this ? (__extension__ ({
int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetCount]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (int)1;
})) : 0;
struct __ecereNameSpace__ecere__com__IteratorPointer * i;
struct __ecereNameSpace__ecere__com__Class * Dclass = class->templateArgs[2].__anon1.__anon1.dataTypeClass;
unsigned int isNormalClass = (Dclass->type == 0) && Dclass->structSize;

__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Put(channel, __ecereClass_uint, (void *)&count);
if((struct __ecereNameSpace__ecere__com__Instance *)this)
for(i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})); i; i = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})))
{
uint64 data = (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, i) : (uint64)1;
}));
struct __ecereNameSpace__ecere__com__Class * Eclass = isNormalClass ? ((struct __ecereNameSpace__ecere__com__Instance *)(char *)((struct __ecereNameSpace__ecere__com__Instance *)((uintptr_t)((uint64)(data)))))->_class : Dclass;

((void (*)(void *, void *, void *))(void *)Eclass->_vTbl[__ecereVMethodID_class_OnSerialize])(Eclass, ((Dclass->type == 1000 && !Dclass->byValueSystemClass) || Dclass->type == 2 || Dclass->type == 4 || Dclass->type == 3) ? ((char *)&data + __ENDIAN_PAD(class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)) : (void *)(uintptr_t)data, channel);
}
}

void __ecereMethod___ecereNameSpace__ecere__com__Container_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance ** this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
struct __ecereNameSpace__ecere__com__Instance * container = __ecereNameSpace__ecere__com__eInstance_New(__ecereProp___ecereNameSpace__ecere__com__Class_Set_char__PTR_(class->fullName));
unsigned int count, c;
struct __ecereNameSpace__ecere__com__Class * Dclass = class->templateArgs[2].__anon1.__anon1.dataTypeClass;
uint64 data;
unsigned int isStruct = Dclass->type == 1;

container->_refCount++;
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Get(channel, __ecereClass_uint, (void *)&count);
if(isStruct)
data = (uint64)(uintptr_t)(__ecereNameSpace__ecere__com__eSystem_New(sizeof(unsigned char) * (Dclass->structSize)));
for(c = 0; c < count; c++)
{
if(isStruct)
memset((char *)(uintptr_t)data, 0, Dclass->structSize);
else
data = (uint64)0;
((void (*)(void *, void *, void *))(void *)Dclass->_vTbl[__ecereVMethodID_class_OnUnserialize])(Dclass, isStruct ? (void *)(uintptr_t)data : ((char *)&data + __ENDIAN_PAD(class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)), channel);
(__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add]);
__internal_VirtualMethod ? __internal_VirtualMethod(container, data) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
}
if(isStruct)
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)(uintptr_t)data), data = 0);
(*this) = container;
}

void __ecereUnregisterModule_Container(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__com__Iterator_data = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__Container_copySrc = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__Container_firstIterator = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__Container_lastIterator = (void *)0;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Find(struct __ecereNameSpace__ecere__com__Iterator * this, const uint64 value)
{
if(this->container)
{
__ecereMethod___ecereNameSpace__ecere__com__Iterator_Free(this);
this->pointer = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 value);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Find]);
__internal_VirtualMethod ? __internal_VirtualMethod(this->container, value) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
}
return this->pointer != (((void *)0));
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(struct __ecereNameSpace__ecere__com__Iterator * this, const uint64 index, unsigned int create)
{
if(this->container)
{
unsigned int justAdded = 0;

__ecereMethod___ecereNameSpace__ecere__com__Iterator_Free(this);
this->pointer = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 pos, unsigned int create, unsigned int *  justAdded);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 pos, unsigned int create, unsigned int *  justAdded))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition]);
__internal_VirtualMethod ? __internal_VirtualMethod(this->container, index, create, &justAdded) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
return !justAdded && this->pointer != (((void *)0));
}
return 0;
}

static void __ecereMethod___ecereNameSpace__ecere__com__Container__Sort(struct __ecereNameSpace__ecere__com__Instance *  this, unsigned int ascending, struct __ecereNameSpace__ecere__com__Instance * *  lists);

static void __ecereMethod___ecereNameSpace__ecere__com__Container__Sort(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int ascending, struct __ecereNameSpace__ecere__com__Instance ** lists)
{
int count = (__extension__ ({
int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetCount]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (int)1;
}));

if(count >= 2 && ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[1].__anon1.__anon1.dataTypeClass == __ecereClass_int)
{
struct __ecereNameSpace__ecere__com__Iterator __simpleStruct1 =
{
0, 0
};
struct __ecereNameSpace__ecere__com__Iterator __simpleStruct0 =
{
0, 0
};
struct __ecereNameSpace__ecere__com__Iterator a =
{
this, 0
};
struct __ecereNameSpace__ecere__com__Iterator b =
{
this, 0
};
struct __ecereNameSpace__ecere__com__Iterator mid =
{
this, 0
};
struct __ecereNameSpace__ecere__com__Class * Dclass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass;
unsigned int byRef = (Dclass->type == 1000 && !Dclass->byValueSystemClass) || Dclass->type == 2 || Dclass->type == 4 || Dclass->type == 3;
int (* onCompare)(void *, const void *, const void *) = (void *)Dclass->_vTbl[__ecereVMethodID_class_OnCompare];
struct __ecereNameSpace__ecere__com__Instance * listA = lists[0];
struct __ecereNameSpace__ecere__com__Instance * listB = lists[1];

__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(&mid, (uint64)(count / 2 - 1), 0);
while(__ecereMethod___ecereNameSpace__ecere__com__Iterator_Next(&a))
{
(__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = listA;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add]);
__internal_VirtualMethod ? __internal_VirtualMethod(listA, __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&a)) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
if(a.pointer == mid.pointer)
break;
}
b.pointer = mid.pointer;
while(__ecereMethod___ecereNameSpace__ecere__com__Iterator_Next(&b))
(__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = listB;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add]);
__internal_VirtualMethod ? __internal_VirtualMethod(listB, __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&b)) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (void)1;
}));
__ecereMethod___ecereNameSpace__ecere__com__Container__Sort(listA, ascending, lists + 2);
__ecereMethod___ecereNameSpace__ecere__com__Container__Sort(listB, ascending, lists + 2);
a = (__simpleStruct0.container = listA, __simpleStruct0);
b = (__simpleStruct1.container = listB, __simpleStruct1);
__ecereMethod___ecereNameSpace__ecere__com__Iterator_Next(&a);
__ecereMethod___ecereNameSpace__ecere__com__Iterator_Next(&b);
while(a.pointer || b.pointer)
{
int r;

if(a.pointer && b.pointer)
{
uint64 dataA = __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&a), dataB = __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&b);

r = onCompare(Dclass, byRef ? ((char *)&dataA + __ENDIAN_PAD(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)) : (const void *)(uintptr_t)dataA, byRef ? ((char *)&dataB + __ENDIAN_PAD(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)) : (const void *)(uintptr_t)dataB);
}
else if(a.pointer)
r = -1;
else
r = 1;
if(!ascending)
r *= -1;
if(r < 0)
{
(__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&a)) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
__ecereMethod___ecereNameSpace__ecere__com__Iterator_Next(&a);
}
else
{
(__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&b)) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
__ecereMethod___ecereNameSpace__ecere__com__Iterator_Next(&b);
}
}
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = listA;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll]);
__internal_VirtualMethod ? __internal_VirtualMethod(listA) : (void)1;
}));
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = listB;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll]);
__internal_VirtualMethod ? __internal_VirtualMethod(listB) : (void)1;
}));
}
}

void __ecereMethod___ecereNameSpace__ecere__com__Container_Sort(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int ascending)
{
int i, numLists = __ecereNameSpace__ecere__com__log2i((__extension__ ({
int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetCount]);
__internal_VirtualMethod ? __internal_VirtualMethod(this) : (int)1;
}))) * 2;
struct __ecereNameSpace__ecere__com__Instance ** lists = __ecereNameSpace__ecere__com__eSystem_New(sizeof(struct __ecereNameSpace__ecere__com__Instance *) * (numLists));

for(i = 0; i < numLists; i++)
lists[i] = __ecereNameSpace__ecere__com__eInstance_New(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class);
__ecereMethod___ecereNameSpace__ecere__com__Container__Sort(this, ascending, lists);
for(i = 0; i < numLists; i++)
(__ecereNameSpace__ecere__com__eInstance_DecRef(lists[i]), lists[i] = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(lists), lists = 0);
}

void __ecereRegisterModule_Container(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument __simpleStruct2 =
{

.__anon1 = {

.__anon1 = {
.dataTypeString = "T"
}
}
};
struct __ecereNameSpace__ecere__com__ClassTemplateArgument __simpleStruct1 =
{

.__anon1 = {

.__anon1 = {
.dataTypeString = "int"
}
}
};
struct __ecereNameSpace__ecere__com__ClassTemplateArgument __simpleStruct0 =
{

.__anon1 = {

.__anon1 = {
.dataTypeString = "int"
}
}
};
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::com::Iterator", 0, sizeof(struct __ecereNameSpace__ecere__com__Iterator), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Iterator = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Find", "bool Find(const T value)", __ecereMethod___ecereNameSpace__ecere__com__Iterator_Find, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Free", "void Free()", __ecereMethod___ecereNameSpace__ecere__com__Iterator_Free, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetData", "T GetData()", __ecereMethod___ecereNameSpace__ecere__com__Iterator_GetData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Index", "bool Index(const IT index, bool create)", __ecereMethod___ecereNameSpace__ecere__com__Iterator_Index, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Next", "bool Next()", __ecereMethod___ecereNameSpace__ecere__com__Iterator_Next, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Prev", "bool Prev()", __ecereMethod___ecereNameSpace__ecere__com__Iterator_Prev, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Remove", "void Remove()", __ecereMethod___ecereNameSpace__ecere__com__Iterator_Remove, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "SetData", "bool SetData(T value)", __ecereMethod___ecereNameSpace__ecere__com__Iterator_SetData, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "container", "ecere::com::Container<T, IT>", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "pointer", "ecere::com::IteratorPointer", sizeof(void *), 0xF000F000, 1);
__ecerePropM___ecereNameSpace__ecere__com__Iterator_data = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "data", "T", __ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data, __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__Iterator_data = __ecerePropM___ecereNameSpace__ecere__com__Iterator_data, __ecerePropM___ecereNameSpace__ecere__com__Iterator_data = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "T", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "IT", 0, 0, &__simpleStruct0);
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::Container", 0, 0, 0, (void *)0, (void *)__ecereDestructor___ecereNameSpace__ecere__com__Container, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Container = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnCompare", 0, __ecereMethod___ecereNameSpace__ecere__com__Container_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnCopy", 0, __ecereMethod___ecereNameSpace__ecere__com__Container_OnCopy, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnFree", 0, __ecereMethod___ecereNameSpace__ecere__com__Container_OnFree, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod___ecereNameSpace__ecere__com__Container_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnSerialize", 0, __ecereMethod___ecereNameSpace__ecere__com__Container_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnUnserialize", 0, __ecereMethod___ecereNameSpace__ecere__com__Container_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetFirst", "ecere::com::IteratorPointer GetFirst()", __ecereMethod___ecereNameSpace__ecere__com__Container_GetFirst, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetLast", "ecere::com::IteratorPointer GetLast()", __ecereMethod___ecereNameSpace__ecere__com__Container_GetLast, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetPrev", "ecere::com::IteratorPointer GetPrev(ecere::com::IteratorPointer pointer)", __ecereMethod___ecereNameSpace__ecere__com__Container_GetPrev, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetNext", "ecere::com::IteratorPointer GetNext(ecere::com::IteratorPointer pointer)", __ecereMethod___ecereNameSpace__ecere__com__Container_GetNext, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetData", "D GetData(ecere::com::IteratorPointer pointer)", __ecereMethod___ecereNameSpace__ecere__com__Container_GetData, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "SetData", "bool SetData(ecere::com::IteratorPointer pointer, D data)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetAtPosition", "ecere::com::IteratorPointer GetAtPosition(const I pos, bool create, bool * justAdded)", __ecereMethod___ecereNameSpace__ecere__com__Container_GetAtPosition, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Insert", "ecere::com::IteratorPointer Insert(ecere::com::IteratorPointer after, T value)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Add", "ecere::com::IteratorPointer Add(T value)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Remove", "void Remove(ecere::com::IteratorPointer it)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Move", "void Move(ecere::com::IteratorPointer it, ecere::com::IteratorPointer after)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "RemoveAll", "void RemoveAll()", __ecereMethod___ecereNameSpace__ecere__com__Container_RemoveAll, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Copy", "void Copy(ecere::com::Container<T> source)", __ecereMethod___ecereNameSpace__ecere__com__Container_Copy, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Find", "ecere::com::IteratorPointer Find(const D value)", __ecereMethod___ecereNameSpace__ecere__com__Container_Find, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "FreeIterator", "void FreeIterator(ecere::com::IteratorPointer it)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetCount", "int GetCount()", __ecereMethod___ecereNameSpace__ecere__com__Container_GetCount, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Free", "void Free()", __ecereMethod___ecereNameSpace__ecere__com__Container_Free, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Delete", "void Delete(ecere::com::IteratorPointer i)", __ecereMethod___ecereNameSpace__ecere__com__Container_Delete, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Sort", "void Sort(bool ascending)", __ecereMethod___ecereNameSpace__ecere__com__Container_Sort, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "TakeOut", "bool TakeOut(const D d)", __ecereMethod___ecereNameSpace__ecere__com__Container_TakeOut, 1);
__ecerePropM___ecereNameSpace__ecere__com__Container_copySrc = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "copySrc", "ecere::com::Container<T>", __ecereProp___ecereNameSpace__ecere__com__Container_Set_copySrc, 0, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__Container_copySrc = __ecerePropM___ecereNameSpace__ecere__com__Container_copySrc, __ecerePropM___ecereNameSpace__ecere__com__Container_copySrc = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__Container_firstIterator = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "firstIterator", "ecere::com::Iterator<T>", 0, __ecereProp___ecereNameSpace__ecere__com__Container_Get_firstIterator, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__Container_firstIterator = __ecerePropM___ecereNameSpace__ecere__com__Container_firstIterator, __ecerePropM___ecereNameSpace__ecere__com__Container_firstIterator = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__Container_lastIterator = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "lastIterator", "ecere::com::Iterator<T>", 0, __ecereProp___ecereNameSpace__ecere__com__Container_Get_lastIterator, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__Container_lastIterator = __ecerePropM___ecereNameSpace__ecere__com__Container_lastIterator, __ecerePropM___ecereNameSpace__ecere__com__Container_lastIterator = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "T", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "I", 0, 0, &__simpleStruct1);
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "D", 0, 0, &__simpleStruct2);
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
if(class)
class->fixed = (unsigned int)1;
}

