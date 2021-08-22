/* Code generated from eC source file: BinaryTree.ec */
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
extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_count;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_minimum;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_maximum;

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

extern int strcmp(const char * , const char * );

struct __ecereNameSpace__ecere__sys__StringBTNode;

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FreeString(char * string)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}

struct __ecereNameSpace__ecere__com__Property;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first, * __ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_first;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_last, * __ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_last;

struct __ecereNameSpace__ecere__sys__BTNode;

struct __ecereNameSpace__ecere__sys__BTNode
{
uintptr_t key;
struct __ecereNameSpace__ecere__sys__BTNode * parent;
struct __ecereNameSpace__ecere__sys__BTNode * left;
struct __ecereNameSpace__ecere__sys__BTNode * right;
int depth;
} ecere_gcc_struct;

int __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_count(struct __ecereNameSpace__ecere__sys__BTNode * this);

void __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Free(struct __ecereNameSpace__ecere__sys__BTNode * this, void (*  FreeKey)(void *  key));

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Rebalance();

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindString(struct __ecereNameSpace__ecere__sys__BTNode * this, const char *  key);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindPrefix(struct __ecereNameSpace__ecere__sys__BTNode * this, const char *  key);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindAll(struct __ecereNameSpace__ecere__sys__BTNode * this, uintptr_t key);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_RemoveSwapRight();

char *  __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Print(struct __ecereNameSpace__ecere__sys__BTNode * this, char *  output, int tps);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_minimum(struct __ecereNameSpace__ecere__sys__BTNode * this);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_maximum(struct __ecereNameSpace__ecere__sys__BTNode * this);

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

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, const void * data);

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * *  data);

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (* CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (* FreeKey)(void * key);
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__sys__StringBinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} ecere_gcc_struct;

__attribute__((unused)) static struct __ecereNameSpace__ecere__sys__BinaryTree __ecereNameSpace__ecere__sys__dummy;

int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareInt(struct __ecereNameSpace__ecere__sys__BinaryTree * this, uintptr_t a, uintptr_t b)
{
return (a > b) ? 1 : ((a < b) ? -1 : 0);
}

int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, const char * a, const char * b)
{
return (a && b) ? strcmp(a, b) : -1;
}

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Free(struct __ecereNameSpace__ecere__sys__BinaryTree * this)
{
if(this->root)
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_Free(this->root, this->FreeKey);
this->root = (((void *)0));
this->count = 0;
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, const char * key)
{
return this->root ? __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindString(this->root, key) : (((void *)0));
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindPrefix(struct __ecereNameSpace__ecere__sys__BinaryTree * this, const char * key)
{
return this->root ? __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindPrefix(this->root, key) : (((void *)0));
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindAll(struct __ecereNameSpace__ecere__sys__BinaryTree * this, uintptr_t key)
{
return this->root ? __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindAll(this->root, key) : (((void *)0));
}

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node)
{
struct __ecereNameSpace__ecere__sys__BTNode * parent = node->parent;

if(parent || this->root == node)
{
this->root = __ecereMethod___ecereNameSpace__ecere__sys__BTNode_RemoveSwapRight(node);
this->count--;
node->parent = (((void *)0));
}
}

char * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Print(struct __ecereNameSpace__ecere__sys__BinaryTree * this, char * output, int tps)
{
output[0] = 0;
if(this->root)
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_Print(this->root, output, tps);
return output;
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(struct __ecereNameSpace__ecere__sys__BinaryTree * this)
{
return this->root ? __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_minimum(this->root) : (((void *)0));
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_last(struct __ecereNameSpace__ecere__sys__BinaryTree * this)
{
return this->root ? __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_maximum(this->root) : (((void *)0));
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Add(struct __ecereNameSpace__ecere__sys__BTNode * this, struct __ecereNameSpace__ecere__sys__BinaryTree * tree, struct __ecereNameSpace__ecere__sys__BTNode * node);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Find(struct __ecereNameSpace__ecere__sys__BTNode * this, struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t key);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Check(struct __ecereNameSpace__ecere__sys__BTNode * this, struct __ecereNameSpace__ecere__sys__BinaryTree * tree);

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node)
{
void * voidNode = node;

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(this, node);
(__ecereNameSpace__ecere__com__eSystem_Delete(voidNode), voidNode = 0);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node)
{
if(!this->CompareKey)
this->CompareKey = (void *)(__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareInt);
if(!this->root)
this->root = node;
else if(__ecereMethod___ecereNameSpace__ecere__sys__BTNode_Add(this->root, this, node))
this->root = __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Rebalance(node);
else
return 0;
this->count++;
return 1;
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Find(struct __ecereNameSpace__ecere__sys__BinaryTree * this, uintptr_t key)
{
if(!this->CompareKey)
this->CompareKey = (void *)(__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareInt);
return this->root ? __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Find(this->root, this, key) : (((void *)0));
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Check(struct __ecereNameSpace__ecere__sys__BinaryTree * this)
{
return this->root ? __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Check(this->root, this) : 1;
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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BinaryTree;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__StringBinaryTree;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BTNode;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__StringBTNode;

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

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_OnSerialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(channel, __ecereClass___ecereNameSpace__ecere__sys__BTNode, this->root);
}

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(channel, __ecereClass___ecereNameSpace__ecere__sys__BTNode, (void *)&(*this).root);
(*this).count = (*this).root ? __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_count((*this).root) : 0;
}

void __ecereMethod___ecereNameSpace__ecere__sys__StringBinaryTree_OnSerialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__sys__StringBinaryTree * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(channel, __ecereClass___ecereNameSpace__ecere__sys__StringBTNode, (struct __ecereNameSpace__ecere__sys__StringBTNode *)this->root);
}

void __ecereMethod___ecereNameSpace__ecere__sys__StringBinaryTree_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__sys__StringBinaryTree * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
struct __ecereNameSpace__ecere__sys__StringBTNode * root = (((void *)0));

__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(channel, __ecereClass___ecereNameSpace__ecere__sys__StringBTNode, (void *)&root);
(*this).root = (struct __ecereNameSpace__ecere__sys__BTNode *)root;
(*this).count = root ? __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_count((*this).root) : 0;
}

void __ecereUnregisterModule_BinaryTree(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_first = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_last = (void *)0;
}

void __ecereRegisterModule_BinaryTree(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::sys::BinaryTree", 0, sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__BinaryTree = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnSerialize", 0, __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnUnserialize", 0, __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Add", "bool Add(ecere::sys::BTNode node)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Check", "bool Check()", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Check, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CompareInt", "int CompareInt(uintptr a, uintptr b)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareInt, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CompareString", "int CompareString(const char * a, const char * b)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Delete", "void Delete(ecere::sys::BTNode node)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Find", "ecere::sys::BTNode Find(uintptr key)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Find, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "FindAll", "ecere::sys::BTNode FindAll(uintptr key)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindAll, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "FindPrefix", "ecere::sys::BTNode FindPrefix(const char * key)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindPrefix, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "FindString", "ecere::sys::BTNode FindString(const char * key)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Free", "void Free()", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Free, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "FreeString", "void ::FreeString(char * string)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FreeString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Print", "char * Print(char * output, ecere::sys::TreePrintStyle tps)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Print, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Remove", "void Remove(ecere::sys::BTNode node)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "root", "ecere::sys::BTNode", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "count", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "CompareKey", "int (*)(ecere::sys::BinaryTree tree, uintptr a, uintptr b)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "FreeKey", "void (*)(void * key)", sizeof(void *), 0xF000F000, 1);
__ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_first = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "first", "ecere::sys::BTNode", 0, __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first = __ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_first, __ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_first = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_last = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "last", "ecere::sys::BTNode", 0, __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_last, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_last = __ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_last, __ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_last = (void *)0;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::sys::StringBinaryTree", "ecere::sys::BinaryTree", sizeof(struct __ecereNameSpace__ecere__sys__StringBinaryTree) - sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__StringBinaryTree = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnSerialize", 0, __ecereMethod___ecereNameSpace__ecere__sys__StringBinaryTree_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnUnserialize", 0, __ecereMethod___ecereNameSpace__ecere__sys__StringBinaryTree_OnUnserialize, 1);
}

