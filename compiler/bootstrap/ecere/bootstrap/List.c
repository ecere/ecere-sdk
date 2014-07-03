/* Code generated from eC source file: List.ec */
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
struct __ecereNameSpace__ecere__com__LinkElement
{
void * prev;
void * next;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__sys__BTNode;

struct __ecereNameSpace__ecere__sys__OldList
{
void *  first;
void *  last;
int count;
unsigned int offset;
unsigned int circ;
} __attribute__ ((gcc_struct));

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

struct __ecereNameSpace__ecere__com__SerialBuffer
{
unsigned char *  _buffer;
unsigned int count;
unsigned int _size;
unsigned int pos;
} __attribute__ ((gcc_struct));

extern void *  __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew(void *  memory, unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew0(void *  memory, unsigned int size);

extern void __ecereNameSpace__ecere__com__eSystem_Delete(void *  memory);

extern void *  memcpy(void * , const void * , size_t size);

struct __ecereNameSpace__ecere__com__LinkList
{
void * first;
void * last;
int count;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__com__ClassTemplateParameter;

struct __ecereNameSpace__ecere__com__IteratorPointer;

int __ecereVMethodID_class_OnFree;

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} __attribute__ ((gcc_struct));

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

extern void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(struct __ecereNameSpace__ecere__com__Class * base);

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Insert;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Find;

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
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct)) __anon1;
} __attribute__ ((gcc_struct)) __anon1;
uint64 data;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__com__ListItem;

struct __ecereNameSpace__ecere__com__ListItem
{
union
{
struct __ecereNameSpace__ecere__com__LinkElement link;
struct
{
struct __ecereNameSpace__ecere__com__ListItem * prev;
struct __ecereNameSpace__ecere__com__ListItem * next;
} __attribute__ ((gcc_struct)) __anon1;
} __attribute__ ((gcc_struct)) __anon1;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__com__Application
{
int argc;
const char * *  argv;
int exitCode;
unsigned int isGUIApp;
struct __ecereNameSpace__ecere__sys__OldList allModules;
char *  parsedCommand;
struct __ecereNameSpace__ecere__com__NameSpace systemNameSpace;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Link;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__LinkList;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ListItem;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IteratorPointer;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Container;

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

uint64 __ecereMethod___ecereNameSpace__ecere__com__List_GetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Link * link)
{
return link ? ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass && ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass->type == 1) ? (uint64)(uintptr_t)&link->data : (uint64)link->data) : (uint64)0;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__List_SetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Link * link, uint64 value)
{
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass->type == 1)
memcpy((void *)&link->data, (void *)(uintptr_t)value, ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass->structSize);
else
link->data = ((uint64)(value));
return 1;
}

void __ecereMethod___ecereNameSpace__ecere__com__List_Delete(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Link * link)
{
uint64 data = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__List->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(this, (void *)(link));

(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance * )(char * )this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass, ((void * )((uintptr_t)(data)))), data = 0);
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__List->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, (void *)(link));
}

struct __ecereNameSpace__ecere__com__Link * __ecereMethod___ecereNameSpace__ecere__com__List_Insert(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Link * after, uint64 value)
{
struct __ecereNameSpace__ecere__com__Link * link;

if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass && ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass->type == 1)
{
link = (struct __ecereNameSpace__ecere__com__Link *)__ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (sizeof(struct __ecereNameSpace__ecere__com__ListItem) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass->structSize));
memcpy((void *)&link->data, (void *)(uintptr_t)value, ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass->structSize);
}
else
link = __extension__ ({
struct __ecereNameSpace__ecere__com__Link * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__Link) + sizeof(struct __ecereNameSpace__ecere__com__ListItem));

__ecereInstance1->data = ((uint64)(value)), __ecereInstance1;
});
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * after, uint64 value))__ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Insert])(this, (void *)(after), (uint64)(uintptr_t)link);
return link;
}

struct __ecereNameSpace__ecere__com__Link * __ecereMethod___ecereNameSpace__ecere__com__List_Add(struct __ecereNameSpace__ecere__com__Instance * this, uint64 value)
{
return (struct __ecereNameSpace__ecere__com__Link *)((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * after, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__List->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Insert])(this, (void *)(((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)this + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->last), value);
}

void __ecereMethod___ecereNameSpace__ecere__com__List_Free(struct __ecereNameSpace__ecere__com__Instance * this)
{
void * item;

while((item = ((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)this + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->first))
{
uint64 data = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__List->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(this, ((void * )((uintptr_t)(item))));

(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance * )(char * )this)->_class->templateArgs[2].__anon1.__anon1.dataTypeClass, ((void * )((uintptr_t)(data)))), data = 0);
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__List->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, ((void * )((uintptr_t)(item))));
}
}

void __ecereMethod___ecereNameSpace__ecere__com__List_Remove(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Link * link)
{
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, (void *)(link));
((link ? (__ecereClass___ecereNameSpace__ecere__com__Link->Destructor ? __ecereClass___ecereNameSpace__ecere__com__Link->Destructor((void *)link) : 0, __ecereClass___ecereNameSpace__ecere__com__ListItem->Destructor ? __ecereClass___ecereNameSpace__ecere__com__ListItem->Destructor((void *)link) : 0, __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor ? __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor((void *)link) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(link)) : 0), link = 0);
}

struct __ecereNameSpace__ecere__com__Link * __ecereMethod___ecereNameSpace__ecere__com__List_Find(struct __ecereNameSpace__ecere__com__Instance * this, const uint64 value)
{
return (struct __ecereNameSpace__ecere__com__Link *)((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 value))__ecereClass___ecereNameSpace__ecere__com__Container->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Find])(this, value);
}

void __ecereUnregisterModule_List(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

void __ecereRegisterModule_List(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::Link", "ecere::com::ListItem", sizeof(struct __ecereNameSpace__ecere__com__Link), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Link = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "data", "uint64", 8, 8, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::List", "ecere::com::LinkList<ecere::com::Link, T = LLT, D = LLT>", 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__List = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetData", 0, __ecereMethod___ecereNameSpace__ecere__com__List_GetData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "SetData", 0, __ecereMethod___ecereNameSpace__ecere__com__List_SetData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Insert", 0, __ecereMethod___ecereNameSpace__ecere__com__List_Insert, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Add", 0, __ecereMethod___ecereNameSpace__ecere__com__List_Add, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Remove", 0, __ecereMethod___ecereNameSpace__ecere__com__List_Remove, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Find", 0, __ecereMethod___ecereNameSpace__ecere__com__List_Find, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Free", 0, __ecereMethod___ecereNameSpace__ecere__com__List_Free, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Delete", 0, __ecereMethod___ecereNameSpace__ecere__com__List_Delete, 1);
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "LLT", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
if(class)
class->fixed = (unsigned int)1;
}

