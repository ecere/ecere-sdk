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

struct __ecereNameSpace__ecere__sys__BTNode
{
uintptr_t key;
struct __ecereNameSpace__ecere__sys__BTNode * parent;
struct __ecereNameSpace__ecere__sys__BTNode * left;
struct __ecereNameSpace__ecere__sys__BTNode * right;
int depth;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BTNode;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (* CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (* FreeKey)(void * key);
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BinaryTree;

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

static struct __ecereNameSpace__ecere__sys__BinaryTree __ecereNameSpace__ecere__sys__dummy;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first, * __ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_first;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_last, * __ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_last;

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * data);

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_OnSerialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(channel, __ecereClass___ecereNameSpace__ecere__sys__BTNode, this->root);
}

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * *  data);

int __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_count(struct __ecereNameSpace__ecere__sys__BTNode * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__sys__BTNode_count;

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(channel, __ecereClass___ecereNameSpace__ecere__sys__BTNode, &(*(this)).root);
(*(this)).count = (*(this)).root ? __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_count((*(this)).root) : 0;
}

int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareInt(struct __ecereNameSpace__ecere__sys__BinaryTree * this, uintptr_t a, uintptr_t b)
{
return (a > b) ? 1 : ((a < b) ? -1 : 0);
}

extern int strcmp(const char * , const char * );

int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, char * a, char * b)
{
return (a && b) ? strcmp(a, b) : -1;
}

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FreeString(char * string)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}

void __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Free(struct __ecereNameSpace__ecere__sys__BTNode * this, void (*  FreeKey)(void *  key));

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Free(struct __ecereNameSpace__ecere__sys__BinaryTree * this)
{
if(this->root)
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_Free(this->root, this->FreeKey);
this->root = (((void *)0));
this->count = 0;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Add(struct __ecereNameSpace__ecere__sys__BTNode * this, struct __ecereNameSpace__ecere__sys__BinaryTree * tree, struct __ecereNameSpace__ecere__sys__BTNode * node);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Rebalance();

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node)
{
if(!this->CompareKey)
this->CompareKey = __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareInt;
if(!this->root)
this->root = node;
else if(__ecereMethod___ecereNameSpace__ecere__sys__BTNode_Add(this->root, this, node))
this->root = __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Rebalance(node);
else
return 0x0;
this->count++;
return 0x1;
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Find(struct __ecereNameSpace__ecere__sys__BTNode * this, struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t key);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Find(struct __ecereNameSpace__ecere__sys__BinaryTree * this, uintptr_t key)
{
if(!this->CompareKey)
this->CompareKey = __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareInt;
return this->root ? __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Find(this->root, this, key) : (((void *)0));
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindString(struct __ecereNameSpace__ecere__sys__BTNode * this, char *  key);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, char * key)
{
return this->root ? __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindString(this->root, key) : (((void *)0));
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindPrefix(struct __ecereNameSpace__ecere__sys__BTNode * this, char *  key);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindPrefix(struct __ecereNameSpace__ecere__sys__BinaryTree * this, char * key)
{
return this->root ? __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindPrefix(this->root, key) : (((void *)0));
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindAll(struct __ecereNameSpace__ecere__sys__BTNode * this, uintptr_t key);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindAll(struct __ecereNameSpace__ecere__sys__BinaryTree * this, uintptr_t key)
{
return this->root ? __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindAll(this->root, key) : (((void *)0));
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_RemoveSwapRight();

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

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node)
{
void * voidNode = node;

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(this, node);
(__ecereNameSpace__ecere__com__eSystem_Delete(voidNode), voidNode = 0);
}

char *  __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Print(struct __ecereNameSpace__ecere__sys__BTNode * this, char *  output, int tps);

char * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Print(struct __ecereNameSpace__ecere__sys__BinaryTree * this, char * output, int tps)
{
output[0] = (char)0;
if(this->root)
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_Print(this->root, output, tps);
return output;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Check(struct __ecereNameSpace__ecere__sys__BTNode * this, struct __ecereNameSpace__ecere__sys__BinaryTree * tree);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Check(struct __ecereNameSpace__ecere__sys__BinaryTree * this)
{
return this->root ? __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Check(this->root, this) : 0x1;
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_minimum(struct __ecereNameSpace__ecere__sys__BTNode * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__sys__BTNode_minimum;

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(struct __ecereNameSpace__ecere__sys__BinaryTree * this)
{
return this->root ? __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_minimum(this->root) : (((void *)0));
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_maximum(struct __ecereNameSpace__ecere__sys__BTNode * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__sys__BTNode_maximum;

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_last(struct __ecereNameSpace__ecere__sys__BinaryTree * this)
{
return this->root ? __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_maximum(this->root) : (((void *)0));
}

struct __ecereNameSpace__ecere__sys__StringBinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__StringBinaryTree;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__StringBTNode;

void __ecereMethod___ecereNameSpace__ecere__sys__StringBinaryTree_OnSerialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__sys__StringBinaryTree * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(channel, __ecereClass___ecereNameSpace__ecere__sys__StringBTNode, (struct __ecereNameSpace__ecere__sys__StringBTNode *)this->root);
}

void __ecereMethod___ecereNameSpace__ecere__sys__StringBinaryTree_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__sys__StringBinaryTree * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
struct __ecereNameSpace__ecere__sys__StringBTNode * root = (((void *)0));

__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(channel, __ecereClass___ecereNameSpace__ecere__sys__StringBTNode, &root);
(*(this)).root = (struct __ecereNameSpace__ecere__sys__BTNode *)root;
(*(this)).count = root ? __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_count((*(this)).root) : 0;
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

void __ecereRegisterModule_BinaryTree(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::sys::BinaryTree", 0, sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__BinaryTree = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnSerialize", 0, __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnUnserialize", 0, __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Add", "bool Add(ecere::sys::BTNode node)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Check", "bool Check()", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Check, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CompareInt", "int CompareInt(uintptr a, uintptr b)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareInt, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CompareString", "int CompareString(char * a, char * b)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Delete", "void Delete(ecere::sys::BTNode node)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Find", "ecere::sys::BTNode Find(uintptr key)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Find, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "FindAll", "ecere::sys::BTNode FindAll(uintptr key)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindAll, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "FindPrefix", "ecere::sys::BTNode FindPrefix(char * key)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindPrefix, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "FindString", "ecere::sys::BTNode FindString(char * key)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Free", "void Free()", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Free, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "FreeString", "void ::FreeString(char * string)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FreeString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Print", "char * Print(char * output, ecere::sys::TreePrintStyle tps)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Print, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Remove", "void Remove(ecere::sys::BTNode node)", __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "root", "ecere::sys::BTNode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "count", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "CompareKey", "int( *)(ecere::sys::BinaryTree tree, uintptr a, uintptr b)", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "FreeKey", "void( *)(void * key)", 4, 4, 1);
__ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_first = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "first", "ecere::sys::BTNode", 0, __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first = __ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_first, __ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_first = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_last = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "last", "ecere::sys::BTNode", 0, __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_last, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_last = __ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_last, __ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_last = (void *)0;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::sys::StringBinaryTree", "ecere::sys::BinaryTree", sizeof(struct __ecereNameSpace__ecere__sys__StringBinaryTree) - sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__StringBinaryTree = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnSerialize", 0, __ecereMethod___ecereNameSpace__ecere__sys__StringBinaryTree_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnUnserialize", 0, __ecereMethod___ecereNameSpace__ecere__sys__StringBinaryTree_OnUnserialize, 1);
}

void __ecereUnregisterModule_BinaryTree(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_first = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BinaryTree_last = (void *)0;
}

