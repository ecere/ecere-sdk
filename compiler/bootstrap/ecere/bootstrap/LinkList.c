/* Code generated from eC source file: LinkList.ec */
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
#define structSize_LinkElement            (_64BIT ? 16 : 8)

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
int isRemote;
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
unsigned int isInstanceClass;
unsigned int byValueSystemClass;
} __attribute__ ((gcc_struct));

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name);

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
void (*  Set)(void * , int);
int (*  Get)(void * );
unsigned int (*  IsSet)(void * );
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

extern void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

struct __ecereNameSpace__ecere__com__Instance
{
int (* *  _vTbl)();
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
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

struct __ecereNameSpace__ecere__com__LinkElement
{
void * prev, * next;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__LinkElement;

struct __ecereNameSpace__ecere__com__ListItem
{
union
{
struct __ecereNameSpace__ecere__com__LinkElement link;
struct
{
struct __ecereNameSpace__ecere__com__ListItem * prev, * next;
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ListItem;

struct __ecereNameSpace__ecere__com__LinkList
{
void * first, * last;
int count;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__LinkList;

void * __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetFirst(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + structSize_Instance) : 0);

return __ecerePointer___ecereNameSpace__ecere__com__LinkList->first;
}

void * __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetLast(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + structSize_Instance) : 0);

return __ecerePointer___ecereNameSpace__ecere__com__LinkList->last;
}

void * __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetPrev(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * item)
{
struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + structSize_Instance) : 0);

return (*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)item)) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev;
}

void * __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetNext(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * item)
{
struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + structSize_Instance) : 0);

return (*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)item)) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next;
}

void * __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer)
{
struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + structSize_Instance) : 0);

return (void *)pointer;
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetAtPosition(struct __ecereNameSpace__ecere__com__Instance * this, uint64 pos, unsigned int create)
{
struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + structSize_Instance) : 0);
int c;
void * item;

for(c = 0, item = __ecerePointer___ecereNameSpace__ecere__com__LinkList->first; c < (int)pos && item; c++, item = (*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next)
;
return (struct __ecereNameSpace__ecere__com__IteratorPointer *)item;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__LinkList_SetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data)
{
struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + structSize_Instance) : 0);

return 0x0;
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__LinkList_Add(struct __ecereNameSpace__ecere__com__Instance * this, uint64 item)
{
struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + structSize_Instance) : 0);

if(item)
{
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev = __ecerePointer___ecereNameSpace__ecere__com__LinkList->last;
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next = item;
if(!__ecerePointer___ecereNameSpace__ecere__com__LinkList->first)
__ecerePointer___ecereNameSpace__ecere__com__LinkList->first = item;
__ecerePointer___ecereNameSpace__ecere__com__LinkList->last = item;
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next = (*(unsigned int *)&((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4]) ? __ecerePointer___ecereNameSpace__ecere__com__LinkList->first : (uint64)(((uint64)(((uint64)((void *)0)))));
if((*(unsigned int *)&((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4]))
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)__ecerePointer___ecereNameSpace__ecere__com__LinkList->first) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev = item;
__ecerePointer___ecereNameSpace__ecere__com__LinkList->count++;
}
return (struct __ecereNameSpace__ecere__com__IteratorPointer *)item;
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__LinkList_Insert(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * _prevItem, uint64 item)
{
struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + structSize_Instance) : 0);
void * prevItem = (void *)_prevItem;

if(item && prevItem != item)
{
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev = prevItem ? prevItem : ((*(unsigned int *)&((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4]) ? __ecerePointer___ecereNameSpace__ecere__com__LinkList->last : (uint64)(((uint64)(((uint64)((void *)0))))));
if(prevItem)
{
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next = (*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)prevItem) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next;
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)prevItem) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next = item;
}
else
{
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next = __ecerePointer___ecereNameSpace__ecere__com__LinkList->first;
__ecerePointer___ecereNameSpace__ecere__com__LinkList->first = item;
if((*(unsigned int *)&((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4]))
{
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next = item;
else
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next = item;
}
}
if(prevItem == __ecerePointer___ecereNameSpace__ecere__com__LinkList->last)
__ecerePointer___ecereNameSpace__ecere__com__LinkList->last = item;
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev = item;
__ecerePointer___ecereNameSpace__ecere__com__LinkList->count++;
return (struct __ecereNameSpace__ecere__com__IteratorPointer *)item;
}
return (((void *)0));
}

void __ecereMethod___ecereNameSpace__ecere__com__LinkList_Remove(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * _item)
{
struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + structSize_Instance) : 0);
void * item = (void *)_item;

if(item)
{
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next = (*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next;
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev = (*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev;
if((*(unsigned int *)&((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4]) && __ecerePointer___ecereNameSpace__ecere__com__LinkList->last == __ecerePointer___ecereNameSpace__ecere__com__LinkList->first)
__ecerePointer___ecereNameSpace__ecere__com__LinkList->last = __ecerePointer___ecereNameSpace__ecere__com__LinkList->first = (uint64)(((uint64)(((uint64)((void *)0)))));
else
{
if(__ecerePointer___ecereNameSpace__ecere__com__LinkList->last == item)
__ecerePointer___ecereNameSpace__ecere__com__LinkList->last = (*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev;
if(__ecerePointer___ecereNameSpace__ecere__com__LinkList->first == item)
__ecerePointer___ecereNameSpace__ecere__com__LinkList->first = (*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next;
}
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev = (uint64)(((uint64)(((uint64)((void *)0)))));
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next = (uint64)(((uint64)(((uint64)((void *)0)))));
__ecerePointer___ecereNameSpace__ecere__com__LinkList->count--;
}
}

void __ecereMethod___ecereNameSpace__ecere__com__LinkList_Move(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * _item, struct __ecereNameSpace__ecere__com__IteratorPointer * _prevItem)
{
struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + structSize_Instance) : 0);
void * item = (void *)_item;
void * prevItem = (void *)_prevItem;

if(item)
{
if(prevItem != item && (__ecerePointer___ecereNameSpace__ecere__com__LinkList->first != item || prevItem))
{
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next = (*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next;
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev = (*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev;
if(item == __ecerePointer___ecereNameSpace__ecere__com__LinkList->first)
__ecerePointer___ecereNameSpace__ecere__com__LinkList->first = (*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next;
if(item == __ecerePointer___ecereNameSpace__ecere__com__LinkList->last)
__ecerePointer___ecereNameSpace__ecere__com__LinkList->last = (*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev;
if(prevItem == __ecerePointer___ecereNameSpace__ecere__com__LinkList->last)
__ecerePointer___ecereNameSpace__ecere__com__LinkList->last = item;
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev = prevItem ? prevItem : ((*(unsigned int *)&((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4]) ? __ecerePointer___ecereNameSpace__ecere__com__LinkList->last : (uint64)(((uint64)(((uint64)((void *)0))))));
if(prevItem)
{
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next = (*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)prevItem) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next;
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)prevItem) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next = item;
}
else
{
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next = __ecerePointer___ecereNameSpace__ecere__com__LinkList->first;
__ecerePointer___ecereNameSpace__ecere__com__LinkList->first = item;
if((*(unsigned int *)&((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4]))
{
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next = item;
else
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next = item;
}
}
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)item) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).next) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].member->_class->offset)).prev = item;
}
}
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__LinkList_Find(struct __ecereNameSpace__ecere__com__Instance * this, uint64 value)
{
struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + structSize_Instance) : 0);

return (struct __ecereNameSpace__ecere__com__IteratorPointer *)value;
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove;

int __ecereVMethodID_class_OnFree;

void __ecereMethod___ecereNameSpace__ecere__com__LinkList_Free(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + structSize_Instance) : 0);
void * item;

while(item = __ecerePointer___ecereNameSpace__ecere__com__LinkList->first)
{
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, item);
(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].dataTypeClass, item), item = 0);
}
}

void __ecereMethod___ecereNameSpace__ecere__com__LinkList_Delete(struct __ecereNameSpace__ecere__com__Instance * this, uint64 item)
{
struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + structSize_Instance) : 0);

((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, item);
(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].dataTypeClass, item), item = 0);
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, char *  name, char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

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

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateParameter;

struct __ecereNameSpace__ecere__com__ClassTemplateParameter;

extern struct __ecereNameSpace__ecere__com__ClassTemplateParameter * __ecereNameSpace__ecere__com__eClass_AddTemplateParameter(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, int type, void *  info, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * defaultArg);

extern void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(struct __ecereNameSpace__ecere__com__Class * base);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_New(int type, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_AddDataMember(struct __ecereNameSpace__ecere__com__DataMember * member, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

extern unsigned int __ecereNameSpace__ecere__com__eMember_AddMember(struct __ecereNameSpace__ecere__com__DataMember * addTo, struct __ecereNameSpace__ecere__com__DataMember * dataMember);

extern unsigned int __ecereNameSpace__ecere__com__eClass_AddMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__DataMember * dataMember);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

void __ecereRegisterModule_LinkList(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument __simpleStruct3 =
{
.dataTypeString = "LT::link"
};
struct __ecereNameSpace__ecere__com__DataValue __simpleStruct2 =
{
.c = 0
};
struct __ecereNameSpace__ecere__com__ClassTemplateArgument __simpleStruct1 =
{
.expression = (__simpleStruct2.ui64 = 0LL, __simpleStruct2)
};
struct __ecereNameSpace__ecere__com__ClassTemplateArgument __simpleStruct0 =
{
.dataTypeString = "ecere::com::ListItem"
};
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::com::LinkElement", 0, sizeof(struct __ecereNameSpace__ecere__com__LinkElement), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + structSize_Instance)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + structSize_Instance)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__LinkElement = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "T", arch_PointerSize, arch_PointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "T", arch_PointerSize, arch_PointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "T", 0, "void *", (((void *)0)));
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::ListItem", "ecere::com::IteratorPointer", sizeof(struct __ecereNameSpace__ecere__com__ListItem), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + structSize_Instance)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + structSize_Instance)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ListItem = class;
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "link", "ecere::com::LinkElement<thisclass>", structSize_LinkElement, arch_PointerSize, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "prev", "thisclass", arch_PointerSize, arch_PointerSize, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "next", "thisclass", arch_PointerSize, arch_PointerSize, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::LinkList", "ecere::com::Container<LT>", sizeof(struct __ecereNameSpace__ecere__com__LinkList), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + structSize_Instance)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + structSize_Instance)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__LinkList = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetFirst", 0, __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetFirst, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetLast", 0, __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetLast, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetPrev", 0, __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetPrev, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetNext", 0, __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetNext, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetData", 0, __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "SetData", 0, __ecereMethod___ecereNameSpace__ecere__com__LinkList_SetData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetAtPosition", 0, __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetAtPosition, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Insert", 0, __ecereMethod___ecereNameSpace__ecere__com__LinkList_Insert, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Add", 0, __ecereMethod___ecereNameSpace__ecere__com__LinkList_Add, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Remove", 0, __ecereMethod___ecereNameSpace__ecere__com__LinkList_Remove, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Move", 0, __ecereMethod___ecereNameSpace__ecere__com__LinkList_Move, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Find", 0, __ecereMethod___ecereNameSpace__ecere__com__LinkList_Find, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Free", 0, __ecereMethod___ecereNameSpace__ecere__com__LinkList_Free, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Delete", 0, __ecereMethod___ecereNameSpace__ecere__com__LinkList_Delete, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "first", "LT", arch_PointerSize, arch_PointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "last", "LT", arch_PointerSize, arch_PointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "count", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "LT", 0, "void *", &__simpleStruct0);
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "circ", 2, "bool", &__simpleStruct1);
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "link", 1, (void *)0, &__simpleStruct3);
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
if(class)
class->fixed = (unsigned int)1;
}

void __ecereUnregisterModule_LinkList(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

