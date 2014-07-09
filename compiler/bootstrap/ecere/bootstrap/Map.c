/* Code generated from eC source file: Map.ec */
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
extern int __ecereVMethodID_class_OnCopy;

extern int __ecereVMethodID_class_OnFree;

extern int __ecereVMethodID_class_OnSerialize;

extern int __ecereVMethodID_class_OnUnserialize;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_prev;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_next;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_minimum;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_maximum;

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
unsigned int count;
unsigned int _size;
unsigned int pos;
} ecere_gcc_struct;

extern void *  __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew(void *  memory, unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew0(void *  memory, unsigned int size);

extern void __ecereNameSpace__ecere__com__eSystem_Delete(void *  memory);

struct __ecereNameSpace__ecere__com__MapNode;

struct __ecereNameSpace__ecere__com__MapNode;

extern void *  memcpy(void * , const void * , size_t size);

struct __ecereNameSpace__ecere__com__CustomAVLTree
{
struct __ecereNameSpace__ecere__com__AVLNode * root;
int count;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__ClassTemplateParameter;

int __ecereVMethodID_class_OnFree;

struct __ecereNameSpace__ecere__com__MapNode
{
struct __ecereNameSpace__ecere__com__MapNode * parent;
struct __ecereNameSpace__ecere__com__MapNode * left;
struct __ecereNameSpace__ecere__com__MapNode * right;
int depth;
uint64 key;
uint64 value;
} ecere_gcc_struct;

uint64 __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_value(struct __ecereNameSpace__ecere__com__MapNode * this)
{
return this ? this->value : (uint64)0;
}

void __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_value(struct __ecereNameSpace__ecere__com__MapNode * this, uint64 value)
{
this->value = value;
}

const uint64 __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key(struct __ecereNameSpace__ecere__com__MapNode * this);

void __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_key(struct __ecereNameSpace__ecere__com__MapNode * this, const uint64 value);

uint64 __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_value(struct __ecereNameSpace__ecere__com__MapNode * this);

void __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_value(struct __ecereNameSpace__ecere__com__MapNode * this, uint64 value);

struct __ecereNameSpace__ecere__com__Property;

extern void __ecereNameSpace__ecere__com__eInstance_Watch(void *  instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapNode_key, * __ecerePropM___ecereNameSpace__ecere__com__MapNode_key;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapNode_value, * __ecerePropM___ecereNameSpace__ecere__com__MapNode_value;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapNode_prev, * __ecerePropM___ecereNameSpace__ecere__com__MapNode_prev;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapNode_next, * __ecerePropM___ecereNameSpace__ecere__com__MapNode_next;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapNode_minimum, * __ecerePropM___ecereNameSpace__ecere__com__MapNode_minimum;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapNode_maximum, * __ecerePropM___ecereNameSpace__ecere__com__MapNode_maximum;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_map, * __ecerePropM___ecereNameSpace__ecere__com__MapIterator_map;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_key, * __ecerePropM___ecereNameSpace__ecere__com__MapIterator_key;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_value, * __ecerePropM___ecereNameSpace__ecere__com__MapIterator_value;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Map_mapSrc, * __ecerePropM___ecereNameSpace__ecere__com__Map_mapSrc;

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} ecere_gcc_struct;

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

extern unsigned int __ecereNameSpace__ecere__com__eClass_IsDerived(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class * from);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  dataType, void *  setStmt, void *  getStmt, int declMode);

extern void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(struct __ecereNameSpace__ecere__com__Class * base);

struct __ecereNameSpace__ecere__com__MapIterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
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

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

extern void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object);

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

struct __ecereNameSpace__ecere__com__Iterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} ecere_gcc_struct;

void __ecereProp___ecereNameSpace__ecere__com__Map_Set_mapSrc(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * value);

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Find;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Free;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetCount;

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Put(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, const void * data);

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Get(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * *  data);

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_map(struct __ecereNameSpace__ecere__com__MapIterator * this)
{
return (struct __ecereNameSpace__ecere__com__Instance *)this->container;
}

void __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(struct __ecereNameSpace__ecere__com__MapIterator * this, struct __ecereNameSpace__ecere__com__Instance * value)
{
this->container = (struct __ecereNameSpace__ecere__com__Instance *)value;
}

struct __ecereNameSpace__ecere__com__AVLNode;

struct __ecereNameSpace__ecere__com__AVLNode
{
struct __ecereNameSpace__ecere__com__AVLNode * parent;
struct __ecereNameSpace__ecere__com__AVLNode * left;
struct __ecereNameSpace__ecere__com__AVLNode * right;
int depth;
uint64 key;
} ecere_gcc_struct;

const uint64 __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key(struct __ecereNameSpace__ecere__com__MapNode * this)
{
return this->key;
}

void __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_key(struct __ecereNameSpace__ecere__com__MapNode * this, const uint64 value)
{
this->key = value;
}

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_prev(struct __ecereNameSpace__ecere__com__AVLNode * this);

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_next(struct __ecereNameSpace__ecere__com__AVLNode * this);

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_minimum(struct __ecereNameSpace__ecere__com__AVLNode * this);

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_maximum(struct __ecereNameSpace__ecere__com__AVLNode * this);

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Find(struct __ecereNameSpace__ecere__com__AVLNode * this, struct __ecereNameSpace__ecere__com__Class * Tclass, const uint64 key);

struct __ecereNameSpace__ecere__com__MapNode * __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_prev(struct __ecereNameSpace__ecere__com__MapNode * this)
{
return (struct __ecereNameSpace__ecere__com__MapNode *)__ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_prev((void *)(this));
}

struct __ecereNameSpace__ecere__com__MapNode * __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_next(struct __ecereNameSpace__ecere__com__MapNode * this)
{
return (struct __ecereNameSpace__ecere__com__MapNode *)__ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_next((void *)(this));
}

struct __ecereNameSpace__ecere__com__MapNode * __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_minimum(struct __ecereNameSpace__ecere__com__MapNode * this)
{
return (struct __ecereNameSpace__ecere__com__MapNode *)__ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_minimum((void *)(this));
}

struct __ecereNameSpace__ecere__com__MapNode * __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_maximum(struct __ecereNameSpace__ecere__com__MapNode * this)
{
return (struct __ecereNameSpace__ecere__com__MapNode *)__ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_maximum((void *)(this));
}

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

extern struct __ecereNameSpace__ecere__com__ClassTemplateParameter * __ecereNameSpace__ecere__com__eClass_AddTemplateParameter(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, int type, const void *  info, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * defaultArg);

struct __ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, const char *  name, const char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

uint64 __ecereMethod___ecereNameSpace__ecere__com__Map_GetKey(struct __ecereNameSpace__ecere__com__Instance *  this, struct __ecereNameSpace__ecere__com__MapNode *  node);

const uint64 __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_key(struct __ecereNameSpace__ecere__com__MapIterator * this)
{
return __ecereMethod___ecereNameSpace__ecere__com__Map_GetKey(((struct __ecereNameSpace__ecere__com__Instance *)this->container), (struct __ecereNameSpace__ecere__com__MapNode *)this->pointer);
}

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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__MapNode;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__MapIterator;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Container;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__CustomAVLTree;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__AVLNode;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IteratorPointer;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BuiltInContainer;

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

uint64 __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_value(struct __ecereNameSpace__ecere__com__MapIterator * this)
{
return ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(this->container, this->pointer);
}

void __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_value(struct __ecereNameSpace__ecere__com__MapIterator * this, uint64 value)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData])(this->container, this->pointer, value);
}

struct __ecereNameSpace__ecere__com__MapNode * __ecereMethod___ecereNameSpace__ecere__com__Map_Find(struct __ecereNameSpace__ecere__com__Instance * this, uint64 value)
{
return (struct __ecereNameSpace__ecere__com__MapNode *)((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 value))__ecereClass___ecereNameSpace__ecere__com__Container->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Find])(this, value);
}

uint64 __ecereMethod___ecereNameSpace__ecere__com__Map_GetKey(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__MapNode * node)
{
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass->type == 1)
return (uint64)(uintptr_t)(((unsigned char *)&node->key) + __ENDIAN_PAD(sizeof(void *)));
return __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key(node);
}

uint64 __ecereMethod___ecereNameSpace__ecere__com__Map_GetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__MapNode * node)
{
if(node)
{
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass->type == 1)
node = (struct __ecereNameSpace__ecere__com__MapNode *)(((unsigned char *)node) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass->structSize - sizeof node->key);
return (((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass->type == 1) ? (uint64)(uintptr_t)&node->value : __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_value(node);
}
return (uint64)0;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Map_SetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__MapNode * node, uint64 value)
{
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass->type == 1)
node = (struct __ecereNameSpace__ecere__com__MapNode *)(((unsigned char *)node) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass->structSize - sizeof node->key);
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass->type == 1)
memcpy((void *)&node->value, (void *)(uintptr_t)value, ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass->structSize);
else
__ecereProp___ecereNameSpace__ecere__com__MapNode_Set_value(node, value);
return 1;
}

void __ecereMethod___ecereNameSpace__ecere__com__Map_Delete(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__MapNode * node)
{
struct __ecereNameSpace__ecere__com__MapNode * n = node;

if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass->type == 1)
n = (struct __ecereNameSpace__ecere__com__MapNode *)(((unsigned char *)node) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass->structSize - sizeof node->key);
(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance * )(char * )this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass, ((void * )((uintptr_t)(__ecereProp___ecereNameSpace__ecere__com__MapNode_Get_value(n))))), __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_value(n, 0));
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, (void *)(node));
}

void __ecereProp___ecereNameSpace__ecere__com__Map_Set_mapSrc(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * value)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i;

((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll])(this);
if(__ecereNameSpace__ecere__com__eClass_IsDerived(((struct __ecereNameSpace__ecere__com__Instance *)(char *)value)->_class, __ecereClass___ecereNameSpace__ecere__com__Map))
{
for(i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = value;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst])(value); i; i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = value;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext])(value, i))
{
struct __ecereNameSpace__ecere__com__MapNode * srcNode = (struct __ecereNameSpace__ecere__com__MapNode *)i;
struct __ecereNameSpace__ecere__com__MapNode * destNode = (struct __ecereNameSpace__ecere__com__MapNode *)((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 pos, unsigned int create))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition])(this, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key(srcNode), 1);

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData])(this, (void *)(destNode), ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(this, (void *)(srcNode)));
}
}
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__com__Map_mapSrc), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__com__Map_mapSrc);
}

void __ecereMethod___ecereNameSpace__ecere__com__Map_Free(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__MapNode * node;

while((node = (void *)(((struct __ecereNameSpace__ecere__com__CustomAVLTree *)(((char *)this + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->root)))
{
struct __ecereNameSpace__ecere__com__MapNode * n = node;

if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass->type == 1)
n = (struct __ecereNameSpace__ecere__com__MapNode *)(((unsigned char *)node) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass->structSize - sizeof node->key);
(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance * )(char * )this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass, ((void * )((uintptr_t)(__ecereProp___ecereNameSpace__ecere__com__MapNode_Get_value(n))))), __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_value(n, 0));
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, (void *)(node));
}
}

struct __ecereNameSpace__ecere__com__MapNode * __ecereMethod___ecereNameSpace__ecere__com__Map_GetAtPosition(struct __ecereNameSpace__ecere__com__Instance * this, const uint64 pos, unsigned int create)
{
struct __ecereNameSpace__ecere__com__MapNode * node = (void *)(((struct __ecereNameSpace__ecere__com__CustomAVLTree *)(((char *)this + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->root ? __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Find(((struct __ecereNameSpace__ecere__com__CustomAVLTree *)(((char *)this + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->root, ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass, pos) : (((void *)0)));

if(!node && create)
{
struct __ecereNameSpace__ecere__com__Class * Tclass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass;
void (* onCopy)(void *, void *, void *) = Tclass->_vTbl[__ecereVMethodID_class_OnCopy];

if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass->type == 1 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass->type == 1)
{
unsigned int size = sizeof(struct __ecereNameSpace__ecere__com__MapNode);

if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass->type == 1)
size += ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass->typeSize - sizeof node->key;
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass->type == 1)
size += ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass->typeSize - sizeof(uint64);
node = (struct __ecereNameSpace__ecere__com__MapNode *)__ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (size));
}
else
{
node = __extension__ ({
struct __ecereNameSpace__ecere__com__MapNode * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__MapNode));

__ecereProp___ecereNameSpace__ecere__com__MapNode_Set_key(__ecereInstance1, pos), __ecereInstance1;
});
}
if((Tclass->type == 1000 && !Tclass->byValueSystemClass) || Tclass->type == 2 || Tclass->type == 4 || Tclass->type == 3)
onCopy(Tclass, (unsigned char *)&node->key + __ENDIAN_PAD(Tclass->typeSize), (unsigned char *)((char *)&pos + __ENDIAN_PAD(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass->typeSize)) + __ENDIAN_PAD(Tclass->typeSize));
else
onCopy(Tclass, (unsigned char *)&node->key + __ENDIAN_PAD(sizeof(void *)), (void *)(uintptr_t)pos);
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(this, (uint64)(uintptr_t)node);
}
return node;
}

struct __ecereNameSpace__ecere__com__MapNode * __ecereMethod___ecereNameSpace__ecere__com__Map_Add(struct __ecereNameSpace__ecere__com__Instance * this, uint64 _newNode)
{
struct __ecereNameSpace__ecere__com__MapNode * newNode = (struct __ecereNameSpace__ecere__com__MapNode *)((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(_newNode)));

if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass->type == 1 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].__anon1.__anon1.dataTypeClass->type == 1)
{
struct __ecereNameSpace__ecere__com__MapNode * realNode = (struct __ecereNameSpace__ecere__com__MapNode *)((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 pos, unsigned int create))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition])(this, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key(newNode), 1);

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData])(this, (void *)(realNode), __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_value(newNode));
return newNode;
}
else
{
struct __ecereNameSpace__ecere__com__MapNode * node = (void *)(((struct __ecereNameSpace__ecere__com__CustomAVLTree *)(((char *)this + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->root ? __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Find(((struct __ecereNameSpace__ecere__com__CustomAVLTree *)(((char *)this + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->root, ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass, (uint64)__ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key(newNode)) : (((void *)0)));

if(!node)
{
struct __ecereNameSpace__ecere__com__Class * Tclass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass;
void (* onCopy)(void *, void *, void *) = Tclass->_vTbl[__ecereVMethodID_class_OnCopy];

if((Tclass->type == 1000 && !Tclass->byValueSystemClass) || Tclass->type == 2 || Tclass->type == 4 || Tclass->type == 3)
onCopy(Tclass, (unsigned char *)&newNode->key + __ENDIAN_PAD(Tclass->typeSize), (unsigned char *)&newNode->key + __ENDIAN_PAD(Tclass->typeSize));
else
onCopy(Tclass, (unsigned char *)&newNode->key + __ENDIAN_PAD(sizeof(void *)), (void *)(uintptr_t)(uint64)(newNode->key));
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(this, (uint64)(uintptr_t)newNode);
return newNode;
}
else
{
((newNode ? (__ecereClass___ecereNameSpace__ecere__com__MapNode->Destructor ? __ecereClass___ecereNameSpace__ecere__com__MapNode->Destructor((void *)newNode) : 0, __ecereClass___ecereNameSpace__ecere__com__AVLNode->Destructor ? __ecereClass___ecereNameSpace__ecere__com__AVLNode->Destructor((void *)newNode) : 0, __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor ? __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor((void *)newNode) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(newNode)) : 0), newNode = 0);
return (((void *)0));
}
}
}

void __ecereMethod___ecereNameSpace__ecere__com__Map_Remove(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__MapNode * node)
{
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, (void *)(node));
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass->type == 1)
{
struct __ecereNameSpace__ecere__com__Class * Tclass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass;

((void (*)(void *, void *))(void *)Tclass->_vTbl[__ecereVMethodID_class_OnFree])(Tclass, (((unsigned char *)&node->key) + __ENDIAN_PAD(sizeof(void *))));
}
else
(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance * )(char * )this)->_class->templateArgs[5].__anon1.__anon1.dataTypeClass, ((void * )((uintptr_t)(__ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key(node))))), __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_key(node, 0));
((node ? (__ecereClass___ecereNameSpace__ecere__com__MapNode->Destructor ? __ecereClass___ecereNameSpace__ecere__com__MapNode->Destructor((void *)node) : 0, __ecereClass___ecereNameSpace__ecere__com__AVLNode->Destructor ? __ecereClass___ecereNameSpace__ecere__com__AVLNode->Destructor((void *)node) : 0, __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor ? __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor((void *)node) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(node)) : 0), node = 0);
}

void __ecereMethod___ecereNameSpace__ecere__com__Map_Copy(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * source)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i;

((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll])(this);
if(!__ecereNameSpace__ecere__com__eClass_IsDerived(((struct __ecereNameSpace__ecere__com__Instance *)(char *)source)->_class, __ecereClass___ecereNameSpace__ecere__com__Map))
{
for(i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = source;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst])(source); i; i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = source;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext])(source, i))
{
struct __ecereNameSpace__ecere__com__MapNode * srcNode = (struct __ecereNameSpace__ecere__com__MapNode *)((uintptr_t)((uint64)(((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = source;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(source, i))));
struct __ecereNameSpace__ecere__com__MapNode * destNode = (struct __ecereNameSpace__ecere__com__MapNode *)((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 pos, unsigned int create))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition])(this, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key(srcNode), 1);

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData])(this, (void *)(destNode), __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_value(srcNode));
}
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)source)->_class == __ecereClass___ecereNameSpace__ecere__com__BuiltInContainer)
((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = source;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Container->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Free])(source);
}
}

void __ecereMethod___ecereNameSpace__ecere__com__Map_OnSerialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned int count = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetCount])(this);
struct __ecereNameSpace__ecere__com__IteratorPointer * i;
struct __ecereNameSpace__ecere__com__Class * Kclass = class->templateArgs[5].__anon1.__anon1.dataTypeClass;
struct __ecereNameSpace__ecere__com__Class * Dclass = class->templateArgs[6].__anon1.__anon1.dataTypeClass;
unsigned int kIsNormalClass = (Kclass->type == 0) && Kclass->structSize;
unsigned int dIsNormalClass = (Dclass->type == 0) && Dclass->structSize;

__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Put(channel, __ecereClass_uint, (void *)&count);
for(i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst])(this); i; i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext])(this, i))
{
struct __ecereNameSpace__ecere__com__MapNode * srcNode = (struct __ecereNameSpace__ecere__com__MapNode *)i;
uint64 key = __ecereMethod___ecereNameSpace__ecere__com__Map_GetKey(this, (struct __ecereNameSpace__ecere__com__MapNode *)srcNode);
uint64 data = ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this;

__internal_ClassInst ? __internal_ClassInst->_vTbl : class->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(this, (void *)(srcNode));
struct __ecereNameSpace__ecere__com__Class * kEclass = kIsNormalClass ? ((struct __ecereNameSpace__ecere__com__Instance *)(char *)((struct __ecereNameSpace__ecere__com__Instance *)((uintptr_t)((uint64)(key)))))->_class : Kclass;
struct __ecereNameSpace__ecere__com__Class * dEclass = dIsNormalClass ? ((struct __ecereNameSpace__ecere__com__Instance *)(char *)((struct __ecereNameSpace__ecere__com__Instance *)((uintptr_t)((uint64)(data)))))->_class : Dclass;

((void (*)(void *, void *, void *))(void *)kEclass->_vTbl[__ecereVMethodID_class_OnSerialize])(kEclass, ((Kclass->type == 1000 && !Kclass->byValueSystemClass) || Kclass->type == 2 || Kclass->type == 4 || Kclass->type == 3) ? ((char *)&key + __ENDIAN_PAD(class->templateArgs[5].__anon1.__anon1.dataTypeClass->typeSize)) : (void *)(uintptr_t)key, channel);
((void (*)(void *, void *, void *))(void *)dEclass->_vTbl[__ecereVMethodID_class_OnSerialize])(dEclass, ((Dclass->type == 1000 && !Dclass->byValueSystemClass) || Dclass->type == 2 || Dclass->type == 4 || Dclass->type == 3) ? ((char *)&data + __ENDIAN_PAD(class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)) : (void *)(uintptr_t)data, channel);
}
}

void __ecereMethod___ecereNameSpace__ecere__com__Map_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance ** this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned int c, count;
struct __ecereNameSpace__ecere__com__Instance * container = __ecereNameSpace__ecere__com__eInstance_New(__ecereProp___ecereNameSpace__ecere__com__Class_Set_char__PTR_(class->fullName));
struct __ecereNameSpace__ecere__com__Class * Kclass = class->templateArgs[5].__anon1.__anon1.dataTypeClass;
struct __ecereNameSpace__ecere__com__Class * Dclass = class->templateArgs[6].__anon1.__anon1.dataTypeClass;

__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Get(channel, __ecereClass_uint, (void *)&count);
for(c = 0; c < count; c++)
{
struct __ecereNameSpace__ecere__com__MapNode * destNode;
uint64 key = (uint64)0;
uint64 data = (uint64)0;

((void (*)(void *, void *, void *))(void *)Kclass->_vTbl[__ecereVMethodID_class_OnUnserialize])(Kclass, ((char *)&key + __ENDIAN_PAD(class->templateArgs[5].__anon1.__anon1.dataTypeClass->typeSize)), channel);
((void (*)(void *, void *, void *))(void *)Dclass->_vTbl[__ecereVMethodID_class_OnUnserialize])(Dclass, ((char *)&data + __ENDIAN_PAD(class->templateArgs[2].__anon1.__anon1.dataTypeClass->typeSize)), channel);
destNode = (struct __ecereNameSpace__ecere__com__MapNode *)((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, const uint64 pos, unsigned int create))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition])(container, key, 1);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = container;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData])(container, (void *)(destNode), data);
}
(*this) = container;
}

void __ecereUnregisterModule_Map(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__com__MapNode_key = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapNode_value = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapNode_prev = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapNode_next = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapNode_minimum = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapNode_maximum = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapIterator_map = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapIterator_key = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapIterator_value = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__Map_mapSrc = (void *)0;
}

void __ecereRegisterModule_Map(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::MapNode", "ecere::com::AVLNode<KT>", sizeof(struct __ecereNameSpace__ecere__com__MapNode), 0, (void *)0, (void *)0, module, 4, 2);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__MapNode = class;
__ecerePropM___ecereNameSpace__ecere__com__MapNode_key = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "key", "const KT", __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_key, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__MapNode_key = __ecerePropM___ecereNameSpace__ecere__com__MapNode_key, __ecerePropM___ecereNameSpace__ecere__com__MapNode_key = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapNode_value = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "value", "V", __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_value, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_value, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__MapNode_value = __ecerePropM___ecereNameSpace__ecere__com__MapNode_value, __ecerePropM___ecereNameSpace__ecere__com__MapNode_value = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "value", "V", 8, 8, 1);
__ecerePropM___ecereNameSpace__ecere__com__MapNode_prev = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "prev", "thisclass", 0, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_prev, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__MapNode_prev = __ecerePropM___ecereNameSpace__ecere__com__MapNode_prev, __ecerePropM___ecereNameSpace__ecere__com__MapNode_prev = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapNode_next = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "next", "thisclass", 0, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_next, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__MapNode_next = __ecerePropM___ecereNameSpace__ecere__com__MapNode_next, __ecerePropM___ecereNameSpace__ecere__com__MapNode_next = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapNode_minimum = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "minimum", "thisclass", 0, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_minimum, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__MapNode_minimum = __ecerePropM___ecereNameSpace__ecere__com__MapNode_minimum, __ecerePropM___ecereNameSpace__ecere__com__MapNode_minimum = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapNode_maximum = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "maximum", "thisclass", 0, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_maximum, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__MapNode_maximum = __ecerePropM___ecereNameSpace__ecere__com__MapNode_maximum, __ecerePropM___ecereNameSpace__ecere__com__MapNode_maximum = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "KT", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "V", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::com::MapIterator", "ecere::com::Iterator<V, IT = KT>", sizeof(struct __ecereNameSpace__ecere__com__MapIterator) - sizeof(struct __ecereNameSpace__ecere__com__Iterator), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__MapIterator = class;
__ecerePropM___ecereNameSpace__ecere__com__MapIterator_map = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "map", "ecere::com::Map", __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_map, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__MapIterator_map = __ecerePropM___ecereNameSpace__ecere__com__MapIterator_map, __ecerePropM___ecereNameSpace__ecere__com__MapIterator_map = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapIterator_key = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "key", "const KT", 0, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_key, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__MapIterator_key = __ecerePropM___ecereNameSpace__ecere__com__MapIterator_key, __ecerePropM___ecereNameSpace__ecere__com__MapIterator_key = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapIterator_value = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "value", "V", __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_value, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_value, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__MapIterator_value = __ecerePropM___ecereNameSpace__ecere__com__MapIterator_value, __ecerePropM___ecereNameSpace__ecere__com__MapIterator_value = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "KT", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "V", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::Map", "ecere::com::CustomAVLTree<ecere::com::MapNode<MT, V>, I = MT, D = V, KT = MT>", 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Map = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnSerialize", 0, __ecereMethod___ecereNameSpace__ecere__com__Map_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnUnserialize", 0, __ecereMethod___ecereNameSpace__ecere__com__Map_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetData", 0, __ecereMethod___ecereNameSpace__ecere__com__Map_GetData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "SetData", 0, __ecereMethod___ecereNameSpace__ecere__com__Map_SetData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetAtPosition", 0, __ecereMethod___ecereNameSpace__ecere__com__Map_GetAtPosition, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Add", 0, __ecereMethod___ecereNameSpace__ecere__com__Map_Add, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Remove", 0, __ecereMethod___ecereNameSpace__ecere__com__Map_Remove, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Copy", 0, __ecereMethod___ecereNameSpace__ecere__com__Map_Copy, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Find", 0, __ecereMethod___ecereNameSpace__ecere__com__Map_Find, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Free", 0, __ecereMethod___ecereNameSpace__ecere__com__Map_Free, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Delete", 0, __ecereMethod___ecereNameSpace__ecere__com__Map_Delete, 1);
__ecerePropM___ecereNameSpace__ecere__com__Map_mapSrc = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "mapSrc", "ecere::com::Map", __ecereProp___ecereNameSpace__ecere__com__Map_Set_mapSrc, 0, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__Map_mapSrc = __ecerePropM___ecereNameSpace__ecere__com__Map_mapSrc, __ecerePropM___ecereNameSpace__ecere__com__Map_mapSrc = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "MT", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "V", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
if(class)
class->fixed = (unsigned int)1;
}

