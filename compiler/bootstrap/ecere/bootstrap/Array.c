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
extern void *  __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew(void *  memory, unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew0(void *  memory, unsigned int size);

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

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Array_size, * __ecerePropM___ecereNameSpace__ecere__com__Array_size;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Array_minAllocSize, * __ecerePropM___ecereNameSpace__ecere__com__Array_minAllocSize;

struct __ecereNameSpace__ecere__com__Array
{
uint64 * array;
unsigned int count;
unsigned int minAllocSize;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Array;

void __ecereDestructor___ecereNameSpace__ecere__com__Array(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);

{
(__ecereNameSpace__ecere__com__eSystem_Delete(__ecerePointer___ecereNameSpace__ecere__com__Array->array), __ecerePointer___ecereNameSpace__ecere__com__Array->array = 0);
}
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__Array_GetFirst(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);

return (struct __ecereNameSpace__ecere__com__IteratorPointer *)__ecerePointer___ecereNameSpace__ecere__com__Array->array;
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__Array_GetLast(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);

return (struct __ecereNameSpace__ecere__com__IteratorPointer *)(__ecerePointer___ecereNameSpace__ecere__com__Array->array ? (((unsigned char *)__ecerePointer___ecereNameSpace__ecere__com__Array->array) + ((__ecerePointer___ecereNameSpace__ecere__com__Array->count - 1) * ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize))) : (((void *)0)));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__Array_GetPrev(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * ip)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);
uint64 * item = (uint64 *)ip;

return (struct __ecereNameSpace__ecere__com__IteratorPointer *)((item && item > __ecerePointer___ecereNameSpace__ecere__com__Array->array) ? (((unsigned char *)item) - (1 * ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize))) : (((void *)0)));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__Array_GetNext(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * ip)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);
uint64 * item = (uint64 *)ip;

return (struct __ecereNameSpace__ecere__com__IteratorPointer *)((item && item < ((unsigned char *)((unsigned char *)__ecerePointer___ecereNameSpace__ecere__com__Array->array) + (__ecerePointer___ecereNameSpace__ecere__com__Array->count * ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize))) - (1 * ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize))) ? (((unsigned char *)item) + (1 * ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize))) : (((void *)0)));
}

uint64 __ecereMethod___ecereNameSpace__ecere__com__Array_GetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * ip)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);
uint64 * item = (uint64 *)ip;

return ((((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 1) ? ((uint64)item) : (((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? (uint64)*((void **)item) : ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize == 1) ? *((unsigned char *)item) : ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize == 2) ? *((unsigned short *)item) : ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize == 4) ? *((unsigned int *)item) : *(item)))))));
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Array_SetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * ip, uint64 value)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);
uint64 * item = (uint64 *)ip;

(memcpy(item, (char *)(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 1) ? value : ((char *)&value + __ENDIAN_PAD((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 1 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize)), (((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize));
return 0x1;
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__Array_GetAtPosition(struct __ecereNameSpace__ecere__com__Instance * this, uint64 pos, unsigned int create)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);

if((int)pos > __ecerePointer___ecereNameSpace__ecere__com__Array->count && create)
{
if((int)pos + 1 > __ecerePointer___ecereNameSpace__ecere__com__Array->minAllocSize)
__ecerePointer___ecereNameSpace__ecere__com__Array->array = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__com__Array->array, ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize) * ((int)pos + 1));
__ecerePointer___ecereNameSpace__ecere__com__Array->count = (int)pos + 1;
}
return ((int)pos < __ecerePointer___ecereNameSpace__ecere__com__Array->count && __ecerePointer___ecereNameSpace__ecere__com__Array->array) ? (struct __ecereNameSpace__ecere__com__IteratorPointer *)(((unsigned char *)__ecerePointer___ecereNameSpace__ecere__com__Array->array) + ((int)pos * ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize))) : (((void *)0));
}

extern void *  memmove(void * , const void * , unsigned int size);

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__Array_Insert(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * ip, uint64 value)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);
unsigned int tsize = ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize);
unsigned char * pos = ip ? ((unsigned char *)ip + tsize) : (unsigned char *)__ecerePointer___ecereNameSpace__ecere__com__Array->array;

if(__ecerePointer___ecereNameSpace__ecere__com__Array->count + 1 > __ecerePointer___ecereNameSpace__ecere__com__Array->minAllocSize)
{
int offset = pos - (unsigned char *)__ecerePointer___ecereNameSpace__ecere__com__Array->array;

__ecerePointer___ecereNameSpace__ecere__com__Array->array = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__com__Array->array, ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize) * (__ecerePointer___ecereNameSpace__ecere__com__Array->count + 1));
pos = (unsigned char *)__ecerePointer___ecereNameSpace__ecere__com__Array->array + offset;
}
memmove(pos + tsize, pos, (unsigned char *)__ecerePointer___ecereNameSpace__ecere__com__Array->array + (__ecerePointer___ecereNameSpace__ecere__com__Array->count++) * tsize - pos);
(memcpy((uint64 *)pos, (char *)(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 1) ? value : ((char *)&value + __ENDIAN_PAD((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 1 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize)), (((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize));
return (struct __ecereNameSpace__ecere__com__IteratorPointer *)pos;
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__Array_Add(struct __ecereNameSpace__ecere__com__Instance * this, uint64 value)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);

if(__ecerePointer___ecereNameSpace__ecere__com__Array->count + 1 > __ecerePointer___ecereNameSpace__ecere__com__Array->minAllocSize)
__ecerePointer___ecereNameSpace__ecere__com__Array->array = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__com__Array->array, ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize) * (__ecerePointer___ecereNameSpace__ecere__com__Array->count + 1));
(memcpy((char *)__ecerePointer___ecereNameSpace__ecere__com__Array->array + (__ecerePointer___ecereNameSpace__ecere__com__Array->count * ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void * ) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize)), (char *)(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 1) ? value : ((char *)&value + __ENDIAN_PAD((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 1 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize)), (((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize));
return (struct __ecereNameSpace__ecere__com__IteratorPointer *)(((unsigned char *)__ecerePointer___ecereNameSpace__ecere__com__Array->array) + ((__ecerePointer___ecereNameSpace__ecere__com__Array->count++) * ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize)));
}

void __ecereMethod___ecereNameSpace__ecere__com__Array_Remove(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * ip)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);
uint64 * it = (uint64 *)ip;

memmove(it, ((unsigned char *)it) + (1 * ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize)), (__ecerePointer___ecereNameSpace__ecere__com__Array->count - ((((unsigned char *)(it) - (unsigned char *)(__ecerePointer___ecereNameSpace__ecere__com__Array->array)) / ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize))) - 1) * ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize));
__ecerePointer___ecereNameSpace__ecere__com__Array->count--;
if(__ecerePointer___ecereNameSpace__ecere__com__Array->count + 1 > __ecerePointer___ecereNameSpace__ecere__com__Array->minAllocSize)
__ecerePointer___ecereNameSpace__ecere__com__Array->array = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__com__Array->array, ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize) * (__ecerePointer___ecereNameSpace__ecere__com__Array->count));
}

void __ecereMethod___ecereNameSpace__ecere__com__Array_Move(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * ip, struct __ecereNameSpace__ecere__com__IteratorPointer * afterIp)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);
uint64 * it = (uint64 *)ip;
uint64 * after = (uint64 *)afterIp;
}

void __ecereMethod___ecereNameSpace__ecere__com__Array_RemoveAll(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);

if(__ecerePointer___ecereNameSpace__ecere__com__Array->minAllocSize && __ecerePointer___ecereNameSpace__ecere__com__Array->array)
__ecerePointer___ecereNameSpace__ecere__com__Array->array = __ecereNameSpace__ecere__com__eSystem_Renew0(__ecerePointer___ecereNameSpace__ecere__com__Array->array, ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize) * (__ecerePointer___ecereNameSpace__ecere__com__Array->minAllocSize));
else
(__ecereNameSpace__ecere__com__eSystem_Delete(__ecerePointer___ecereNameSpace__ecere__com__Array->array), __ecerePointer___ecereNameSpace__ecere__com__Array->array = 0);
__ecerePointer___ecereNameSpace__ecere__com__Array->count = 0;
}

int __ecereMethod___ecereNameSpace__ecere__com__Array_GetCount(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);

return __ecerePointer___ecereNameSpace__ecere__com__Array->count;
}

unsigned int __ecereProp___ecereNameSpace__ecere__com__Array_Get_size(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);

return __ecerePointer___ecereNameSpace__ecere__com__Array->count;
}

extern void memset(void *  area, unsigned char value, unsigned int count);

void __ecereProp___ecereNameSpace__ecere__com__Array_Set_size(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);

if(__ecerePointer___ecereNameSpace__ecere__com__Array->count != value)
{
if(value > __ecerePointer___ecereNameSpace__ecere__com__Array->minAllocSize)
__ecerePointer___ecereNameSpace__ecere__com__Array->array = __ecereNameSpace__ecere__com__eSystem_Renew0(__ecerePointer___ecereNameSpace__ecere__com__Array->array, ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize) * (value));
else if(value > __ecerePointer___ecereNameSpace__ecere__com__Array->count)
memset(((unsigned char *)__ecerePointer___ecereNameSpace__ecere__com__Array->array) + (__ecerePointer___ecereNameSpace__ecere__com__Array->count * ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize)), (unsigned char)0, (value - __ecerePointer___ecereNameSpace__ecere__com__Array->count) * ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize));
__ecerePointer___ecereNameSpace__ecere__com__Array->count = value;
}
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__com__Array_size), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__com__Array_size);
}

unsigned int __ecereProp___ecereNameSpace__ecere__com__Array_Get_minAllocSize(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);

return __ecerePointer___ecereNameSpace__ecere__com__Array->minAllocSize;
}

void __ecereProp___ecereNameSpace__ecere__com__Array_Set_minAllocSize(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);

if(__ecerePointer___ecereNameSpace__ecere__com__Array->minAllocSize != value)
{
if(value > __ecerePointer___ecereNameSpace__ecere__com__Array->count)
__ecerePointer___ecereNameSpace__ecere__com__Array->array = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__com__Array->array, ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize) * (value));
__ecerePointer___ecereNameSpace__ecere__com__Array->minAllocSize = value;
}
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__com__Array_minAllocSize), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__com__Array_minAllocSize);
}

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

extern unsigned int __ecereNameSpace__ecere__com__eClass_IsDerived(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class * from);

extern void *  memcpy(void * , const void * , unsigned int size);

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetCount;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData;

void __ecereMethod___ecereNameSpace__ecere__com__Array_Copy(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * source)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);

__ecerePointer___ecereNameSpace__ecere__com__Array->count = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *))source->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetCount])(source);
if(__ecerePointer___ecereNameSpace__ecere__com__Array->count > __ecerePointer___ecereNameSpace__ecere__com__Array->minAllocSize)
__ecerePointer___ecereNameSpace__ecere__com__Array->array = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__com__Array->array, ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize) * (__ecerePointer___ecereNameSpace__ecere__com__Array->count));
if((((struct __ecereNameSpace__ecere__com__Instance *)(char *)source)->_class == __ecereClass___ecereNameSpace__ecere__com__BuiltInContainer && (*((struct __ecereNameSpace__ecere__com__BuiltInContainer *)source)).type->type != 1) || __ecereNameSpace__ecere__com__eClass_IsDerived(((struct __ecereNameSpace__ecere__com__Instance *)(char *)source)->_class, __ecereClass___ecereNameSpace__ecere__com__Array))
{
memcpy(__ecerePointer___ecereNameSpace__ecere__com__Array->array, ((struct __ecereNameSpace__ecere__com__Array *)(((char *)((struct __ecereNameSpace__ecere__com__Instance *)source) + 12)))->array, __ecerePointer___ecereNameSpace__ecere__com__Array->count * ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize));
}
else
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i;
int c;

for(c = 0, i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))source->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst])(source); i; i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))source->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext])(source, i), c++)
{
uint64 data = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))source->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(source, i);

(memcpy((char *)__ecerePointer___ecereNameSpace__ecere__com__Array->array + ((c) * ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void * ) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize)), (char *)(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 1) ? data : ((char *)&data + __ENDIAN_PAD((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].dataTypeClass->type == 1 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].dataTypeClass->type == 5) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].dataTypeClass->typeSize)), (((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? sizeof(void *) : ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize));
}
}
}

int __ecereVMethodID_class_OnFree;

void __ecereMethod___ecereNameSpace__ecere__com__Array_Free(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);
int c;

for(c = 0; c < __ecerePointer___ecereNameSpace__ecere__com__Array->count; c++)
{
uint64 data = ((((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 1) ? (uint64)(((unsigned char *)__ecerePointer___ecereNameSpace__ecere__com__Array->array) + (c) * ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize) : (((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? (uint64)((void **)__ecerePointer___ecereNameSpace__ecere__com__Array->array)[c] : ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize == 1) ? ((unsigned char *)__ecerePointer___ecereNameSpace__ecere__com__Array->array)[c] : ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize == 2) ? ((unsigned short *)__ecerePointer___ecereNameSpace__ecere__com__Array->array)[c] : ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize == 4) ? ((unsigned int *)__ecerePointer___ecereNameSpace__ecere__com__Array->array)[c] : (__ecerePointer___ecereNameSpace__ecere__com__Array->array)[c]))))));

(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass, data), data = 0);
}
(__ecereNameSpace__ecere__com__eSystem_Delete(__ecerePointer___ecereNameSpace__ecere__com__Array->array), __ecerePointer___ecereNameSpace__ecere__com__Array->array = 0);
__ecerePointer___ecereNameSpace__ecere__com__Array->count = 0;
__ecerePointer___ecereNameSpace__ecere__com__Array->minAllocSize = 0;
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove;

void __ecereMethod___ecereNameSpace__ecere__com__Array_Delete(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * item)
{
struct __ecereNameSpace__ecere__com__Array * __ecerePointer___ecereNameSpace__ecere__com__Array = (struct __ecereNameSpace__ecere__com__Array *)(this ? (((char *)this) + 12) : 0);
uint64 data = ((((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 1) ? ((uint64)(uint64 * )item) : (((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->type == 5) ? (uint64)*((void **)(uint64 * )item) : ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize == 1) ? *((unsigned char *)(uint64 * )item) : ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize == 2) ? *((unsigned short *)(uint64 * )item) : ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->typeSize == 4) ? *((unsigned int *)(uint64 * )item) : *((uint64 *)item)))))));

(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[0].dataTypeClass, data), data = 0);
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, item);
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

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  dataType, void *  setStmt, void *  getStmt, int declMode);

void __ecereRegisterModule_Array(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::Array", "ecere::com::Container", sizeof(struct __ecereNameSpace__ecere__com__Array), 0, 0, __ecereDestructor___ecereNameSpace__ecere__com__Array, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Array = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetFirst", 0, __ecereMethod___ecereNameSpace__ecere__com__Array_GetFirst, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetLast", 0, __ecereMethod___ecereNameSpace__ecere__com__Array_GetLast, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetPrev", 0, __ecereMethod___ecereNameSpace__ecere__com__Array_GetPrev, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetNext", 0, __ecereMethod___ecereNameSpace__ecere__com__Array_GetNext, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetData", 0, __ecereMethod___ecereNameSpace__ecere__com__Array_GetData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "SetData", 0, __ecereMethod___ecereNameSpace__ecere__com__Array_SetData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetAtPosition", 0, __ecereMethod___ecereNameSpace__ecere__com__Array_GetAtPosition, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Insert", 0, __ecereMethod___ecereNameSpace__ecere__com__Array_Insert, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Add", 0, __ecereMethod___ecereNameSpace__ecere__com__Array_Add, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Remove", 0, __ecereMethod___ecereNameSpace__ecere__com__Array_Remove, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Move", 0, __ecereMethod___ecereNameSpace__ecere__com__Array_Move, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "RemoveAll", 0, __ecereMethod___ecereNameSpace__ecere__com__Array_RemoveAll, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Copy", 0, __ecereMethod___ecereNameSpace__ecere__com__Array_Copy, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetCount", 0, __ecereMethod___ecereNameSpace__ecere__com__Array_GetCount, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Free", 0, __ecereMethod___ecereNameSpace__ecere__com__Array_Free, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Delete", 0, __ecereMethod___ecereNameSpace__ecere__com__Array_Delete, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "array", "T *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "count", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "minAllocSize", "uint", 4, 4, 1);
__ecerePropM___ecereNameSpace__ecere__com__Array_size = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "size", "unsigned int", __ecereProp___ecereNameSpace__ecere__com__Array_Set_size, __ecereProp___ecereNameSpace__ecere__com__Array_Get_size, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__Array_size = __ecerePropM___ecereNameSpace__ecere__com__Array_size, __ecerePropM___ecereNameSpace__ecere__com__Array_size = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__Array_minAllocSize = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "minAllocSize", "unsigned int", __ecereProp___ecereNameSpace__ecere__com__Array_Set_minAllocSize, __ecereProp___ecereNameSpace__ecere__com__Array_Get_minAllocSize, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__Array_minAllocSize = __ecerePropM___ecereNameSpace__ecere__com__Array_minAllocSize, __ecerePropM___ecereNameSpace__ecere__com__Array_minAllocSize = (void *)0;
if(class)
class->fixed = (unsigned int)1;
}

void __ecereUnregisterModule_Array(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__com__Array_size = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__Array_minAllocSize = (void *)0;
}

