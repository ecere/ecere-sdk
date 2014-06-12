/* Code generated from eC source file: Container.ec */
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
#include <stdint.h>
#include <sys/types.h>

#if /*defined(_W64) || */(defined(__WORDSIZE) && __WORDSIZE == 8) || defined(__x86_64__)
#define _64BIT 1
#else
#define _64BIT 0
#endif

#define arch_PointerSize                  sizeof(void *)
#define structSize_Instance               (_64BIT ? 24 : 12)

struct __ecereNameSpace__ecere__com__Instance;

extern void *  __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew(void *  memory, unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew0(void *  memory, unsigned int size);

extern void __ecereNameSpace__ecere__com__eSystem_Delete(void *  memory);

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
int structAlignment;
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
} __attribute__ ((gcc_struct));

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Property;

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
} __attribute__ ((gcc_struct));

extern void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

extern void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object);

extern void __ecereNameSpace__ecere__com__eInstance_Watch(void *  instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DataMember;

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
int structAlignment;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Method;

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
} __attribute__ ((gcc_struct)) __anon1;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateArgument;

struct __ecereNameSpace__ecere__com__ClassTemplateArgument
{
union
{
struct
{
const char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
} __attribute__ ((gcc_struct)) __anon1;
struct __ecereNameSpace__ecere__com__DataValue expression;
struct
{
const char *  memberString;
union
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__Method * method;
} __attribute__ ((gcc_struct)) __anon1;
} __attribute__ ((gcc_struct)) __anon2;
} __attribute__ ((gcc_struct)) __anon1;
} __attribute__ ((gcc_struct));

int __ecereVMethodID_class_OnCompare;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_int;

int __ecereVMethodID_class_OnCopy;

int __ecereVMethodID_class_OnGetString;

int __ecereVMethodID_class_OnSerialize;

int __ecereVMethodID_class_OnUnserialize;

static __attribute__((unused)) void UnusedFunction()
{
int a;

((int (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, const void * object))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnCompare])(__ecereClass_int, (void *)&a, (((void *)0)));
((void (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, const void * newData))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnCopy])(__ecereClass_int, (void *)&a, (((void *)0)));
((const char *  (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, char *  tempString, void *  fieldData, unsigned int *  needClass))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnGetString])(__ecereClass_int, (void *)&a, (((void *)0)), (((void *)0)), (((void *)0)));
((void (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, struct __ecereNameSpace__ecere__com__Instance * channel))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnSerialize])(__ecereClass_int, (void *)&a, (((void *)0)));
((void (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, struct __ecereNameSpace__ecere__com__Instance * channel))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnUnserialize])(__ecereClass_int, (void *)&a, (((void *)0)));
}

extern int __ecereVMethodID_class_OnCompare;

extern int __ecereVMethodID_class_OnGetString;

extern int __ecereVMethodID_class_OnSerialize;

extern int __ecereVMethodID_class_OnUnserialize;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Iterator_data, * __ecerePropM___ecereNameSpace__ecere__com__Iterator_data;

struct __ecereNameSpace__ecere__com__Iterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Iterator;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Container_copySrc, * __ecerePropM___ecereNameSpace__ecere__com__Container_copySrc;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Container_firstIterator, * __ecerePropM___ecereNameSpace__ecere__com__Container_firstIterator;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Container_lastIterator, * __ecerePropM___ecereNameSpace__ecere__com__Container_lastIterator;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Container;

uint64 __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(struct __ecereNameSpace__ecere__com__Iterator * this)
{
return ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(this->container, this->pointer);
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData;

void __ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(struct __ecereNameSpace__ecere__com__Iterator * this, uint64 value)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData])(this->container, this->pointer, value);
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetPrev;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetLast;

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Prev(struct __ecereNameSpace__ecere__com__Iterator * this)
{
if(this->pointer && this->container)
this->pointer = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetPrev])(this->container, this->pointer);
else if(this->container)
this->pointer = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetLast])(this->container);
return this->pointer != (((void *)0));
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst;

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Next(struct __ecereNameSpace__ecere__com__Iterator * this)
{
if(this->pointer && this->container)
this->pointer = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext])(this->container, this->pointer);
else if(this->container)
this->pointer = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst])(this->container);
return this->pointer != (((void *)0));
}

uint64 __ecereMethod___ecereNameSpace__ecere__com__Iterator_GetData(struct __ecereNameSpace__ecere__com__Iterator * this)
{
return ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(this->container, this->pointer);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_SetData(struct __ecereNameSpace__ecere__com__Iterator * this, uint64 value)
{
return ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData])(this->container, this->pointer, value);
}

void __ecereMethod___ecereNameSpace__ecere__com__Iterator_Free();

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Find;

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Find(struct __ecereNameSpace__ecere__com__Iterator * this, const uint64 value)
{
if(this->container)
{
__ecereMethod___ecereNameSpace__ecere__com__Iterator_Free(this);
this->pointer = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Find])(this->container, value);
}
return this->pointer != (((void *)0));
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove;

void __ecereMethod___ecereNameSpace__ecere__com__Iterator_Remove(struct __ecereNameSpace__ecere__com__Iterator * this)
{
if(this->container)
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this->container, this->pointer);
this->pointer = (((void *)0));
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_FreeIterator;

void __ecereMethod___ecereNameSpace__ecere__com__Iterator_Free(struct __ecereNameSpace__ecere__com__Iterator * this)
{
if(this->container)
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_FreeIterator])(this->container, this->pointer);
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition;

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(struct __ecereNameSpace__ecere__com__Iterator * this, const uint64 index, unsigned int create)
{
if(this->container)
{
__ecereMethod___ecereNameSpace__ecere__com__Iterator_Free(this);
this->pointer = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 pos, unsigned int create))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition])(this->container, index, create);
return this->pointer != (((void *)0));
}
return 0;
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll;

void __ecereDestructor___ecereNameSpace__ecere__com__Container(struct __ecereNameSpace__ecere__com__Instance * this)
{
{
((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll])(this);
}
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Copy;

void __ecereProp___ecereNameSpace__ecere__com__Container_Set_copySrc(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * value)
{
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__Instance * source))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Copy])(this, value);
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__com__Container_copySrc), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__com__Container_copySrc);
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IteratorPointer;

struct __ecereNameSpace__ecere__com__IteratorPointer;

void __ecereProp___ecereNameSpace__ecere__com__Container_Get_firstIterator(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Iterator * value)
{
struct __ecereNameSpace__ecere__com__Iterator __simpleStruct0;

*value = (__simpleStruct0.container = (struct __ecereNameSpace__ecere__com__Instance *)this, __simpleStruct0.pointer = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst])(this), __simpleStruct0);
}

void __ecereProp___ecereNameSpace__ecere__com__Container_Get_lastIterator(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Iterator * value)
{
struct __ecereNameSpace__ecere__com__Iterator __simpleStruct0;

*value = (__simpleStruct0.container = (struct __ecereNameSpace__ecere__com__Instance *)this, __simpleStruct0.pointer = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetLast])(this), __simpleStruct0);
}

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

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__Container_GetAtPosition(struct __ecereNameSpace__ecere__com__Instance * this, const uint64 pos, unsigned int create)
{
return (((void *)0));
}

void __ecereMethod___ecereNameSpace__ecere__com__Container_RemoveAll(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i, * next;

for(i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst])(this), next = i ? ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext])(this, i) : (((void *)0)); i; i = next, next = i ? ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext])(this, i) : (((void *)0)))
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, i);
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

void __ecereMethod___ecereNameSpace__ecere__com__Container_Copy(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * source)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i;

((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll])(this);
for(i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = source;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst])(source); i; i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = source;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext])(source, i))
{
uint64 data = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = source;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(source, i);

((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(this, data);
}
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Free;

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

void __ecereMethod___ecereNameSpace__ecere__com__Container_OnFree(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance * this)
{
if((struct __ecereNameSpace__ecere__com__Instance *)this)
{
((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Free])(this);
(__ecereNameSpace__ecere__com__eInstance_DecRef(this), this = 0);
}
}

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

void __ecereMethod___ecereNameSpace__ecere__com__Container_OnCopy(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance ** this, struct __ecereNameSpace__ecere__com__Instance * source)
{
if((struct __ecereNameSpace__ecere__com__Instance *)source)
{
struct __ecereNameSpace__ecere__com__Instance * container = __ecereNameSpace__ecere__com__eInstance_New(((struct __ecereNameSpace__ecere__com__Instance *)(char *)source)->_class);

((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__Instance * source))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Copy])(container, (struct __ecereNameSpace__ecere__com__Instance *)source);
(*this) = container;
}
else
{
(*this) = (((void *)0));
}
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__Container_Find(struct __ecereNameSpace__ecere__com__Instance * this, const uint64 value)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i;
struct __ecereNameSpace__ecere__com__Class * Dclass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass;

if(((Dclass->type == 1000 && !Dclass->byValueSystemClass) || Dclass->type == 2 || Dclass->type == 4 || Dclass->type == 3))
{
for(i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst])(this); i; i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext])(this, i))
{
uint64 data = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(this, i);
int result = ((int (*)(void *, const void *, const void *))(void *)Dclass->_vTbl[__ecereVMethodID_class_OnCompare])(Dclass, ((char *)&value + __ENDIAN_PAD(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)), ((char *)&data + __ENDIAN_PAD(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)));

if(!result)
return i;
}
}
else
{
for(i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst])(this); i; i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext])(this, i))
{
uint64 data = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(this, i);
int result = ((int (*)(void *, const void *, const void *))(void *)Dclass->_vTbl[__ecereVMethodID_class_OnCompare])(Dclass, (const void *)value, (const void *)data);

if(!result)
return i;
}
}
return (((void *)0));
}

int __ecereMethod___ecereNameSpace__ecere__com__Container_GetCount(struct __ecereNameSpace__ecere__com__Instance * this)
{
int count = 0;
struct __ecereNameSpace__ecere__com__IteratorPointer * i;

for(i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst])(this); i; i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext])(this, i))
count++;
return count;
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Delete;

void __ecereMethod___ecereNameSpace__ecere__com__Container_Free(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i;

while((i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst])(this)))
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * i))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Delete])(this, i);
}

int __ecereVMethodID_class_OnFree;

void __ecereMethod___ecereNameSpace__ecere__com__Container_Delete(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * i)
{
uint64 data = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(this, i);

(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance * )(char * )this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass, ((void * )(data))), data = 0);
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, i);
}

extern char *  strcat(char * , const char * );

const char * __ecereMethod___ecereNameSpace__ecere__com__Container_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance * this, char * tempString, void * fieldData, unsigned int * needClass)
{
if((struct __ecereNameSpace__ecere__com__Instance *)this)
{
char itemString[4096];
unsigned int first = 1;
struct __ecereNameSpace__ecere__com__IteratorPointer * i;

tempString[0] = '\0';
for(i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst])(this); i; i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext])(this, i))
{
struct __ecereNameSpace__ecere__com__Class * Dclass = class->templateArgs[2].__anon1.__anon1.dataTypeClass;
uint64 data = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(this, i);
const char * result;

itemString[0] = '\0';
result = ((const char * (*)(void *, void *, char *, void *, unsigned int *))(void *)Dclass->_vTbl[__ecereVMethodID_class_OnGetString])(Dclass, ((Dclass->type == 1000 && !Dclass->byValueSystemClass) || Dclass->type == 2 || Dclass->type == 4 || Dclass->type == 3) ? ((char *)&data + __ENDIAN_PAD(class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)) : (void *)data, itemString, (((void *)0)), (((void *)0)));
if(!first)
strcat(tempString, ", ");
strcat(tempString, result);
first = 0;
}
}
else
tempString[0] = (char)0;
return tempString;
}

void __ecereMethod___ecereNameSpace__ecere__com__Container_TakeOut(struct __ecereNameSpace__ecere__com__Instance * this, const uint64 d)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Find])(this, d);

if(i)
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, i);
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetCount;

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Put(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, const void * data);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_uint;

void __ecereMethod___ecereNameSpace__ecere__com__Container_OnSerialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned int count = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetCount])(this);
struct __ecereNameSpace__ecere__com__IteratorPointer * i;
struct __ecereNameSpace__ecere__com__Class * Dclass = class->templateArgs[2].__anon1.__anon1.dataTypeClass;
unsigned int isNormalClass = (Dclass->type == 0) && Dclass->structSize;

__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Put(channel, __ecereClass_uint, (void *)&count);
for(i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst])(this); i; i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext])(this, i))
{
uint64 data = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(this, i);
struct __ecereNameSpace__ecere__com__Class * Eclass = isNormalClass ? ((struct __ecereNameSpace__ecere__com__Instance *)(char *)((struct __ecereNameSpace__ecere__com__Instance *)((uint64)(data))))->_class : Dclass;

((void (*)(void *, void *, void *))(void *)Eclass->_vTbl[__ecereVMethodID_class_OnSerialize])(Eclass, ((Dclass->type == 1000 && !Dclass->byValueSystemClass) || Dclass->type == 2 || Dclass->type == 4 || Dclass->type == 3) ? ((char *)&data + __ENDIAN_PAD(class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)) : (void *)data, channel);
}
}

const char *  __ecereProp___ecereNameSpace__ecere__com__Class_Get_char__PTR_(struct __ecereNameSpace__ecere__com__Class * this);

struct __ecereNameSpace__ecere__com__Class * __ecereProp___ecereNameSpace__ecere__com__Class_Set_char__PTR_(const char *  value);

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Class_char__PTR_;

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Get(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * *  data);

void __ecereMethod___ecereNameSpace__ecere__com__Container_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance ** this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
struct __ecereNameSpace__ecere__com__Instance * container = __ecereNameSpace__ecere__com__eInstance_New(__ecereProp___ecereNameSpace__ecere__com__Class_Set_char__PTR_(class->fullName));
unsigned int count, c;
struct __ecereNameSpace__ecere__com__Class * Dclass = class->templateArgs[2].__anon1.__anon1.dataTypeClass;
uint64 data;

__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Get(channel, __ecereClass_uint, (void *)&count);
if(Dclass->type == 1)
data = (uint64)(__ecereNameSpace__ecere__com__eSystem_New(sizeof(unsigned char) * (Dclass->structSize)));
for(c = 0; c < count; c++)
{
((void (*)(void *, void *, void *))(void *)Dclass->_vTbl[__ecereVMethodID_class_OnUnserialize])(Dclass, (Dclass->type == 1) ? (void *)data : ((char *)&data + __ENDIAN_PAD(class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)), channel);
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(container, data);
}
if(Dclass->type == 1)
(((void (* )(void *  _class, void *  data))class->templateArgs[2].__anon1.__anon1.dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(class->templateArgs[2].__anon1.__anon1.dataTypeClass, ((void * )(data))), data = 0);
(*this) = container;
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Insert;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Move;

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, const char *  name, const char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__NameSpace;

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
const char *  name;
void *  library;
void *  Unload;
int importType;
int origImportType;
struct __ecereNameSpace__ecere__com__NameSpace privateNameSpace;
struct __ecereNameSpace__ecere__com__NameSpace publicNameSpace;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  dataType, void *  setStmt, void *  getStmt, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateParameter;

struct __ecereNameSpace__ecere__com__ClassTemplateParameter;

extern struct __ecereNameSpace__ecere__com__ClassTemplateParameter * __ecereNameSpace__ecere__com__eClass_AddTemplateParameter(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, int type, const void *  info, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * defaultArg);

extern void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(struct __ecereNameSpace__ecere__com__Class * base);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, void *  function, int declMode);

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
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + structSize_Instance)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + structSize_Instance)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Iterator = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Find", "bool Find(const T value)", __ecereMethod___ecereNameSpace__ecere__com__Iterator_Find, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Free", "void Free()", __ecereMethod___ecereNameSpace__ecere__com__Iterator_Free, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetData", "T GetData()", __ecereMethod___ecereNameSpace__ecere__com__Iterator_GetData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Index", "bool Index(const IT index, bool create)", __ecereMethod___ecereNameSpace__ecere__com__Iterator_Index, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Next", "bool Next()", __ecereMethod___ecereNameSpace__ecere__com__Iterator_Next, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Prev", "bool Prev()", __ecereMethod___ecereNameSpace__ecere__com__Iterator_Prev, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Remove", "void Remove()", __ecereMethod___ecereNameSpace__ecere__com__Iterator_Remove, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "SetData", "bool SetData(T value)", __ecereMethod___ecereNameSpace__ecere__com__Iterator_SetData, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "container", "ecere::com::Container<T, IT>", arch_PointerSize, arch_PointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "pointer", "ecere::com::IteratorPointer", arch_PointerSize, arch_PointerSize, 1);
__ecerePropM___ecereNameSpace__ecere__com__Iterator_data = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "data", "T", __ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data, __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + structSize_Instance)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + structSize_Instance)))->application)
__ecereProp___ecereNameSpace__ecere__com__Iterator_data = __ecerePropM___ecereNameSpace__ecere__com__Iterator_data, __ecerePropM___ecereNameSpace__ecere__com__Iterator_data = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "T", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "IT", 0, 0, &__simpleStruct0);
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::Container", 0, 0, 0, (void *)0, (void *)__ecereDestructor___ecereNameSpace__ecere__com__Container, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + structSize_Instance)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + structSize_Instance)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Container = class;
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
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetAtPosition", "ecere::com::IteratorPointer GetAtPosition(const I pos, bool create)", __ecereMethod___ecereNameSpace__ecere__com__Container_GetAtPosition, 1);
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
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "TakeOut", "void TakeOut(const D d)", __ecereMethod___ecereNameSpace__ecere__com__Container_TakeOut, 1);
__ecerePropM___ecereNameSpace__ecere__com__Container_copySrc = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "copySrc", "ecere::com::Container<T>", __ecereProp___ecereNameSpace__ecere__com__Container_Set_copySrc, 0, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + structSize_Instance)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + structSize_Instance)))->application)
__ecereProp___ecereNameSpace__ecere__com__Container_copySrc = __ecerePropM___ecereNameSpace__ecere__com__Container_copySrc, __ecerePropM___ecereNameSpace__ecere__com__Container_copySrc = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__Container_firstIterator = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "firstIterator", "ecere::com::Iterator<T>", 0, __ecereProp___ecereNameSpace__ecere__com__Container_Get_firstIterator, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + structSize_Instance)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + structSize_Instance)))->application)
__ecereProp___ecereNameSpace__ecere__com__Container_firstIterator = __ecerePropM___ecereNameSpace__ecere__com__Container_firstIterator, __ecerePropM___ecereNameSpace__ecere__com__Container_firstIterator = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__Container_lastIterator = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "lastIterator", "ecere::com::Iterator<T>", 0, __ecereProp___ecereNameSpace__ecere__com__Container_Get_lastIterator, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + structSize_Instance)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + structSize_Instance)))->application)
__ecereProp___ecereNameSpace__ecere__com__Container_lastIterator = __ecerePropM___ecereNameSpace__ecere__com__Container_lastIterator, __ecerePropM___ecereNameSpace__ecere__com__Container_lastIterator = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "T", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "I", 0, 0, &__simpleStruct1);
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "D", 0, 0, &__simpleStruct2);
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
if(class)
class->fixed = (unsigned int)1;
}

void __ecereUnregisterModule_Container(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__com__Iterator_data = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__Container_copySrc = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__Container_firstIterator = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__Container_lastIterator = (void *)0;
}

