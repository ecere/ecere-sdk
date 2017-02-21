/* Code generated from eC source file: LinkList.ec */
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
extern int __ecereVMethodID_class_OnCompare;

struct __ecereNameSpace__ecere__com__LinkElement
{
void * prev, * next;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__LinkList
{
void * first, * last;
int count;
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

struct __ecereNameSpace__ecere__com__IteratorPointer;

extern unsigned int __ecereNameSpace__ecere__com__log2i(unsigned int number);

struct __ecereNameSpace__ecere__com__ClassTemplateParameter;

int __ecereVMethodID_class_OnFree;

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

extern void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(struct __ecereNameSpace__ecere__com__Class * base);

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

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

struct __ecereNameSpace__ecere__com__Link;

struct __ecereNameSpace__ecere__com__Link
{
union
{
struct __ecereNameSpace__ecere__com__LinkElement link;
struct
{
struct __ecereNameSpace__ecere__com__Link * prev;
struct __ecereNameSpace__ecere__com__Link * next;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct __anon1;
uint64 data;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__DataMember;

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_New(int type, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_AddDataMember(struct __ecereNameSpace__ecere__com__DataMember * member, const char *  name, const char *  type, unsigned int size, unsigned int alignment, int declMode);

extern unsigned int __ecereNameSpace__ecere__com__eMember_AddMember(struct __ecereNameSpace__ecere__com__DataMember * addTo, struct __ecereNameSpace__ecere__com__DataMember * dataMember);

extern unsigned int __ecereNameSpace__ecere__com__eClass_AddMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__DataMember * dataMember);

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} ecere_gcc_struct;

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

struct __ecereNameSpace__ecere__com__ListItem;

struct __ecereNameSpace__ecere__com__ListItem
{
union
{
struct __ecereNameSpace__ecere__com__LinkElement link;
struct
{
struct __ecereNameSpace__ecere__com__ListItem * prev, * next;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__LinkElement;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ListItem;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__LinkList;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List;

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

void * __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetFirst(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

return ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->first)));
}

void * __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetLast(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

return ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->last)));
}

void * __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

return (void *)pointer;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__LinkList_SetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

return 0;
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__LinkList_Find(struct __ecereNameSpace__ecere__com__Instance * this, uint64 value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

return (struct __ecereNameSpace__ecere__com__IteratorPointer *)((void *)((uintptr_t)(value)));
}

void __ecereMethod___ecereNameSpace__ecere__com__LinkList_Delete(struct __ecereNameSpace__ecere__com__Instance * this, void * item)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, item) : (void)1;
}));
(__ecereNameSpace__ecere__com__eSystem_Delete(item), item = 0);
}

void * __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetPrev(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * item)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

return ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)item)) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev)));
}

void * __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetNext(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * item)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

return ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)item)) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__LinkList_GetAtPosition(struct __ecereNameSpace__ecere__com__Instance * this, const uint64 pos, unsigned int create, unsigned int * justAdded)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);
int c;
void * item;

for(c = 0, item = ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->first))); c < (int)((const uint64)(pos)) && item; c++, item = ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next))))
;
return (struct __ecereNameSpace__ecere__com__IteratorPointer *)((void *)((uintptr_t)(item)));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__LinkList_Add(struct __ecereNameSpace__ecere__com__Instance * this, uint64 item)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

if(item)
{
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev = ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->last)));
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next = ((void * )((uintptr_t)(item)));
if(!((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->first))))
__ecerePointer___ecereNameSpace__ecere__com__LinkList->first = ((void * )((uintptr_t)(item)));
__ecerePointer___ecereNameSpace__ecere__com__LinkList->last = ((void * )((uintptr_t)(item)));
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next = ((void * )((uintptr_t)((*(unsigned int *)&((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4]) ? ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->first))) : (((void *)0)))));
if((*(unsigned int *)&((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4]))
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->first)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev = ((void * )((uintptr_t)(item)));
__ecerePointer___ecereNameSpace__ecere__com__LinkList->count++;
}
return (struct __ecereNameSpace__ecere__com__IteratorPointer *)((void *)((uintptr_t)(item)));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__LinkList_Insert(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * _prevItem, uint64 item)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);
void * prevItem = (void *)_prevItem;

if(item && prevItem != ((void * )((uintptr_t)(item))))
{
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(uintptr_t)((uint64)(item))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev = ((void * )((uintptr_t)(prevItem ? ((void * )((uintptr_t)(prevItem))) : (((void * )((uintptr_t)((*(unsigned int *)&((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4]) ? ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->last))) : (((void *)0)))))))));
if(prevItem)
{
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(uintptr_t)((uint64)(item))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next = ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(prevItem)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)));
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(prevItem)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next = ((void * )((uintptr_t)(item)));
}
else
{
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(uintptr_t)((uint64)(item))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next = ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->first)));
__ecerePointer___ecereNameSpace__ecere__com__LinkList->first = ((void * )((uintptr_t)(item)));
if((*(unsigned int *)&((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4]))
{
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(uintptr_t)((uint64)(item))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(uintptr_t)((uint64)(item))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next = ((void * )((uintptr_t)(item)));
else
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(uintptr_t)((uint64)(item))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next = ((void * )((uintptr_t)(item)));
}
}
if(((void * )((uintptr_t)(prevItem))) == ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->last))))
__ecerePointer___ecereNameSpace__ecere__com__LinkList->last = ((void * )((uintptr_t)(item)));
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(uintptr_t)((uint64)(item))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)(uintptr_t)((uint64)(item))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev = ((void * )((uintptr_t)(item)));
__ecerePointer___ecereNameSpace__ecere__com__LinkList->count++;
return (struct __ecereNameSpace__ecere__com__IteratorPointer *)((uintptr_t)((uint64)(item)));
}
return (((void *)0));
}

void __ecereMethod___ecereNameSpace__ecere__com__LinkList_Remove(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * _item)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);
void * item = (void *)_item;

if(item)
{
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next = ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)));
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev = ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev)));
if((*(unsigned int *)&((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4]) && ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->last))) == ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->first))))
__ecerePointer___ecereNameSpace__ecere__com__LinkList->last = __ecerePointer___ecereNameSpace__ecere__com__LinkList->first = (((void *)0));
else
{
if(((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->last))) == ((void * )((uintptr_t)(item))))
__ecerePointer___ecereNameSpace__ecere__com__LinkList->last = ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev)));
if(((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->first))) == ((void * )((uintptr_t)(item))))
__ecerePointer___ecereNameSpace__ecere__com__LinkList->first = ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)));
}
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev = (((void *)0));
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next = (((void *)0));
__ecerePointer___ecereNameSpace__ecere__com__LinkList->count--;
}
}

void __ecereMethod___ecereNameSpace__ecere__com__LinkList_Move(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * _item, struct __ecereNameSpace__ecere__com__IteratorPointer * _prevItem)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);
void * item = (void *)_item;
void * prevItem = (void *)_prevItem;

if(item)
{
if(((void * )((uintptr_t)(prevItem))) != ((void * )((uintptr_t)(item))) && (((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->first))) != ((void * )((uintptr_t)(item))) || prevItem))
{
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next = ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)));
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev = ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev)));
if(((void * )((uintptr_t)(item))) == ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->first))))
__ecerePointer___ecereNameSpace__ecere__com__LinkList->first = ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)));
if(((void * )((uintptr_t)(item))) == ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->last))))
__ecerePointer___ecereNameSpace__ecere__com__LinkList->last = ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev)));
if(((void * )((uintptr_t)(prevItem))) == ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->last))))
__ecerePointer___ecereNameSpace__ecere__com__LinkList->last = ((void * )((uintptr_t)(item)));
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev = ((void * )((uintptr_t)(prevItem ? ((void * )((uintptr_t)(prevItem))) : (((void * )((uintptr_t)((*(unsigned int *)&((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4]) ? ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->last))) : (((void *)0)))))))));
if(prevItem)
{
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next = ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(prevItem)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)));
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(prevItem)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next = ((void * )((uintptr_t)(item)));
}
else
{
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next = ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->first)));
__ecerePointer___ecereNameSpace__ecere__com__LinkList->first = ((void * )((uintptr_t)(item)));
if((*(unsigned int *)&((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4]))
{
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next = ((void * )((uintptr_t)(item)));
else
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next = ((void * )((uintptr_t)(item)));
}
}
if((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)
(*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(item)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).prev = ((void * )((uintptr_t)(item)));
}
}
}

void __ecereMethod___ecereNameSpace__ecere__com__LinkList_Free(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);
void * item;

while((item = ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->first)))))
{
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, ((void *)((uintptr_t)(item)))) : (void)1;
}));
(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].__anon1.__anon1.dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance * )(char * )this)->_class->templateArgs[3].__anon1.__anon1.dataTypeClass, ((void * )((uintptr_t)(item)))), item = 0);
}
}

void __ecereUnregisterModule_LinkList(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

static void __ecereMethod___ecereNameSpace__ecere__com__LinkList__Sort(struct __ecereNameSpace__ecere__com__Instance *  this, unsigned int ascending, struct __ecereNameSpace__ecere__com__Instance * *  lists);

static void __ecereMethod___ecereNameSpace__ecere__com__LinkList__Sort(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int ascending, struct __ecereNameSpace__ecere__com__Instance ** lists)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

if(__ecerePointer___ecereNameSpace__ecere__com__LinkList->count >= 2)
{
void * a, * b, * mid;
struct __ecereNameSpace__ecere__com__Class * Dclass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass;
unsigned int byRef = (Dclass->type == 1000 && !Dclass->byValueSystemClass) || Dclass->type == 2 || Dclass->type == 4 || Dclass->type == 3;
unsigned int isList = this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData] == ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__ecereClass___ecereNameSpace__ecere__com__List->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData]);
unsigned int isLinkList = this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData] == __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData];
unsigned int isStruct = Dclass->type == 1;
int (* onCompare)(void *, const void *, const void *) = (void *)Dclass->_vTbl[__ecereVMethodID_class_OnCompare];
struct __ecereNameSpace__ecere__com__Instance * listA = lists[0];
struct __ecereNameSpace__ecere__com__Instance * listB = lists[1];

mid = (__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 pos, unsigned int create, unsigned int *  justAdded);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 pos, unsigned int create, unsigned int *  justAdded))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, (uint64)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->count / 2 - 1), 0, (((void *)0))) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
a = ((void * )((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__LinkList->first)));
b = ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(mid)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)));
while(a)
{
void * i = ((void * )((uintptr_t)(a)));
unsigned int done = (((void * )((uintptr_t)(a))) == ((void * )((uintptr_t)(mid))));

a = ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(a)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)));
(__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add]);
__internal_VirtualMethod ? __internal_VirtualMethod(listA, (uint64)(uintptr_t)((void *)(uintptr_t)i)) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
if(done)
break;
}
while(b)
{
void * i = ((void * )((uintptr_t)(b)));

b = ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(b)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)));
(__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add]);
__internal_VirtualMethod ? __internal_VirtualMethod(listB, (uint64)(uintptr_t)((void *)(uintptr_t)i)) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
}
__ecerePointer___ecereNameSpace__ecere__com__LinkList->first = (((void *)0)), __ecerePointer___ecereNameSpace__ecere__com__LinkList->last = (((void *)0)), __ecerePointer___ecereNameSpace__ecere__com__LinkList->count = 0;
__ecereMethod___ecereNameSpace__ecere__com__LinkList__Sort(listA, ascending, lists + 2);
__ecereMethod___ecereNameSpace__ecere__com__LinkList__Sort(listB, ascending, lists + 2);
a = ((void * )((uintptr_t)(((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)listA + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->first)));
b = ((void * )((uintptr_t)(((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)listB + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->first)));
while(a || b)
{
int r;

if(a && b)
{
if(isLinkList)
r = onCompare(Dclass, a, b);
else if(isList)
{
if(isStruct || byRef)
r = onCompare(Dclass, &((struct __ecereNameSpace__ecere__com__Link *)((void *)((uintptr_t)(a))))->data, &((struct __ecereNameSpace__ecere__com__Link *)((void *)((uintptr_t)(b))))->data);
else
r = onCompare(Dclass, (const void *)(uintptr_t)((struct __ecereNameSpace__ecere__com__Link *)((void *)((uintptr_t)(a))))->data, (const void *)(uintptr_t)((struct __ecereNameSpace__ecere__com__Link *)((void *)((uintptr_t)(b))))->data);
}
else
{
uint64 dataA = (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, ((void *)((uintptr_t)(a)))) : (uint64)1;
})), dataB = (__extension__ ({
uint64 (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, ((void *)((uintptr_t)(b)))) : (uint64)1;
}));

r = onCompare(Dclass, byRef ? ((char *)&dataA + __ENDIAN_PAD(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)) : (const void *)(uintptr_t)dataA, byRef ? ((char *)&dataB + __ENDIAN_PAD(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)) : (const void *)(uintptr_t)dataB);
}
}
else if(a)
r = -1;
else
r = 1;
if(!ascending)
r *= -1;
if(r < 0)
{
void * i = ((void * )((uintptr_t)(a)));

a = ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(a)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)));
(__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, (uint64)(uintptr_t)((void *)(uintptr_t)i)) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
}
else
{
void * i = ((void * )((uintptr_t)(b)));

b = ((void * )((uintptr_t)((*(struct __ecereNameSpace__ecere__com__LinkElement *)(((unsigned char *)((void *)((uintptr_t)(b)))) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->offset + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon2.__anon1.member->_class->offset)).next)));
(__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, (uint64)(uintptr_t)((void *)(uintptr_t)i)) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
}
}
((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)listA + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->first = (((void *)0)), ((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)listA + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->last = (((void *)0)), ((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)listA + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->count = 0;
((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)listB + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->first = (((void *)0)), ((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)listB + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->last = (((void *)0)), ((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)listB + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->count = 0;
}
}

void __ecereMethod___ecereNameSpace__ecere__com__LinkList_Sort(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int ascending)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__LinkList * __ecerePointer___ecereNameSpace__ecere__com__LinkList = (struct __ecereNameSpace__ecere__com__LinkList *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);
int i, numLists = __ecereNameSpace__ecere__com__log2i(__ecerePointer___ecereNameSpace__ecere__com__LinkList->count) * 2;
struct __ecereNameSpace__ecere__com__Instance ** lists = __ecereNameSpace__ecere__com__eSystem_New(sizeof(struct __ecereNameSpace__ecere__com__Instance *) * (numLists));

for(i = 0; i < numLists; i++)
lists[i] = __ecereNameSpace__ecere__com__eInstance_New(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class);
__ecereMethod___ecereNameSpace__ecere__com__LinkList__Sort(this, ascending, lists);
for(i = 0; i < numLists; i++)
(__ecereNameSpace__ecere__com__eInstance_DecRef(lists[i]), lists[i] = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(lists), lists = 0);
}

void __ecereRegisterModule_LinkList(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument __simpleStruct3 =
{

.__anon1 = {

.__anon1 = {
.dataTypeString = "LT::link"
}
}
};
struct __ecereNameSpace__ecere__com__DataValue __simpleStruct2 =
{

.__anon1 = {
.c = 0
}
};
struct __ecereNameSpace__ecere__com__ClassTemplateArgument __simpleStruct1 =
{

.__anon1 = {

.__anon1 = {
.dataTypeString = 0
}, .expression = (__simpleStruct2.__anon1.ui64 = 0, __simpleStruct2)
}
};
struct __ecereNameSpace__ecere__com__ClassTemplateArgument __simpleStruct0 =
{

.__anon1 = {

.__anon1 = {
.dataTypeString = "ecere::com::ListItem"
}
}
};
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::com::LinkElement", 0, sizeof(struct __ecereNameSpace__ecere__com__LinkElement), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__LinkElement = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "T", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "T", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "T", 0, "void *", (((void *)0)));
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::ListItem", "ecere::com::IteratorPointer", sizeof(struct __ecereNameSpace__ecere__com__ListItem), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ListItem = class;
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "link", "ecere::com::LinkElement<thisclass>", sizeof(struct __ecereNameSpace__ecere__com__LinkElement), 8, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "prev", "thisclass", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "next", "thisclass", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::LinkList", "ecere::com::Container<LT>", sizeof(struct __ecereNameSpace__ecere__com__LinkList), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
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
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Sort", 0, __ecereMethod___ecereNameSpace__ecere__com__LinkList_Sort, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "_Sort", "static void _Sort(bool ascending, ecere::com::LinkList * lists)", __ecereMethod___ecereNameSpace__ecere__com__LinkList__Sort, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "first", "LT", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "last", "LT", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "count", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "LT", 0, "void *", &__simpleStruct0);
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "circ", 2, "bool", &__simpleStruct1);
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "link", 1, (void *)0, &__simpleStruct3);
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
if(class)
class->fixed = (unsigned int)1;
}

