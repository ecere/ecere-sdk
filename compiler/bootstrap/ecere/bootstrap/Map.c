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

extern int __ecereVMethodID_class_OnCopy;

extern int __ecereVMethodID_class_OnFree;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapNode_key, * __ecerePropM___ecereNameSpace__ecere__com__MapNode_key;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapNode_value, * __ecerePropM___ecereNameSpace__ecere__com__MapNode_value;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapNode_prev, * __ecerePropM___ecereNameSpace__ecere__com__MapNode_prev;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapNode_next, * __ecerePropM___ecereNameSpace__ecere__com__MapNode_next;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapNode_minimum, * __ecerePropM___ecereNameSpace__ecere__com__MapNode_minimum;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapNode_maximum, * __ecerePropM___ecereNameSpace__ecere__com__MapNode_maximum;

struct __ecereNameSpace__ecere__com__MapNode
{
struct __ecereNameSpace__ecere__com__MapNode * parent;
struct __ecereNameSpace__ecere__com__MapNode * left;
struct __ecereNameSpace__ecere__com__MapNode * right;
int depth;
uint64 key;
uint64 value;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__MapNode;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__AVLNode;

struct __ecereNameSpace__ecere__com__AVLNode
{
struct __ecereNameSpace__ecere__com__AVLNode * parent;
struct __ecereNameSpace__ecere__com__AVLNode * left;
struct __ecereNameSpace__ecere__com__AVLNode * right;
int depth;
uint64 key;
} __attribute__ ((gcc_struct));

uint64 __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key(struct __ecereNameSpace__ecere__com__MapNode * this)
{
return this->key;
}

void __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_key(struct __ecereNameSpace__ecere__com__MapNode * this, uint64 value)
{
this->key = value;
}

uint64 __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_value(struct __ecereNameSpace__ecere__com__MapNode * this)
{
return this ? this->value : (uint64)0;
}

void __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_value(struct __ecereNameSpace__ecere__com__MapNode * this, uint64 value)
{
this->value = value;
}

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_prev(struct __ecereNameSpace__ecere__com__AVLNode * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__com__AVLNode_prev;

struct __ecereNameSpace__ecere__com__MapNode * __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_prev(struct __ecereNameSpace__ecere__com__MapNode * this)
{
return (struct __ecereNameSpace__ecere__com__MapNode *)__ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_prev(this);
}

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_next(struct __ecereNameSpace__ecere__com__AVLNode * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__com__AVLNode_next;

struct __ecereNameSpace__ecere__com__MapNode * __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_next(struct __ecereNameSpace__ecere__com__MapNode * this)
{
return (struct __ecereNameSpace__ecere__com__MapNode *)__ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_next(this);
}

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_minimum(struct __ecereNameSpace__ecere__com__AVLNode * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__com__AVLNode_minimum;

struct __ecereNameSpace__ecere__com__MapNode * __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_minimum(struct __ecereNameSpace__ecere__com__MapNode * this)
{
return (struct __ecereNameSpace__ecere__com__MapNode *)__ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_minimum(this);
}

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_maximum(struct __ecereNameSpace__ecere__com__AVLNode * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__com__AVLNode_maximum;

struct __ecereNameSpace__ecere__com__MapNode * __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_maximum(struct __ecereNameSpace__ecere__com__MapNode * this)
{
return (struct __ecereNameSpace__ecere__com__MapNode *)__ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_maximum(this);
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IteratorPointer;

struct __ecereNameSpace__ecere__com__IteratorPointer;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_map, * __ecerePropM___ecereNameSpace__ecere__com__MapIterator_map;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_key, * __ecerePropM___ecereNameSpace__ecere__com__MapIterator_key;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_value, * __ecerePropM___ecereNameSpace__ecere__com__MapIterator_value;

struct __ecereNameSpace__ecere__com__MapIterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__MapIterator;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Map_mapSrc, * __ecerePropM___ecereNameSpace__ecere__com__Map_mapSrc;

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_map(struct __ecereNameSpace__ecere__com__MapIterator * this)
{
return (struct __ecereNameSpace__ecere__com__Instance *)this->container;
}

void __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(struct __ecereNameSpace__ecere__com__MapIterator * this, struct __ecereNameSpace__ecere__com__Instance * value)
{
this->container = (struct __ecereNameSpace__ecere__com__Instance *)value;
}

uint64 __ecereMethod___ecereNameSpace__ecere__com__Map_GetKey(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__MapNode * node);

uint64 __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_key(struct __ecereNameSpace__ecere__com__MapIterator * this)
{
return __ecereMethod___ecereNameSpace__ecere__com__Map_GetKey(((struct __ecereNameSpace__ecere__com__Instance *)this->container), (struct __ecereNameSpace__ecere__com__MapNode *)this->pointer);
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData;

uint64 __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_value(struct __ecereNameSpace__ecere__com__MapIterator * this)
{
return ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))this->container->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(this->container, this->pointer);
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData;

void __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_value(struct __ecereNameSpace__ecere__com__MapIterator * this, uint64 value)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data))this->container->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData])(this->container, this->pointer, value);
}

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map;

uint64 __ecereMethod___ecereNameSpace__ecere__com__Map_GetKey(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__MapNode * node)
{
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->type == 1)
return (uint64)(((unsigned char *)&node->key) + __ENDIAN_PAD(sizeof(void *)));
return __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key(node);
}

uint64 __ecereMethod___ecereNameSpace__ecere__com__Map_GetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__MapNode * node)
{
if(node)
{
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->type == 1)
node = (struct __ecereNameSpace__ecere__com__MapNode *)(((unsigned char *)node) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->structSize - sizeof node->key);
return (((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass->type == 1) ? (uint64)&node->value : __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_value(node);
}
return (uint64)0;
}

extern void *  memcpy(void * , const void * , unsigned int size);

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Map_SetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__MapNode * node, uint64 value)
{
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->type == 1)
node = (struct __ecereNameSpace__ecere__com__MapNode *)(((unsigned char *)node) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->structSize - sizeof node->key);
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass->type == 1)
memcpy((void *)&node->value, (void *)value, ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass->structSize);
else
__ecereProp___ecereNameSpace__ecere__com__MapNode_Set_value(node, value);
return 0x1;
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__CustomAVLTree;

struct __ecereNameSpace__ecere__com__CustomAVLTree
{
struct __ecereNameSpace__ecere__com__AVLNode * root;
int count;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Find(struct __ecereNameSpace__ecere__com__AVLNode * this, struct __ecereNameSpace__ecere__com__Class * Tclass, uint64 key);

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

struct __ecereNameSpace__ecere__com__MapNode * __ecereMethod___ecereNameSpace__ecere__com__Map_Add(struct __ecereNameSpace__ecere__com__Instance * this, uint64 _newNode)
{
struct __ecereNameSpace__ecere__com__MapNode * newNode = (struct __ecereNameSpace__ecere__com__MapNode *)_newNode;

if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->type == 1 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass->type == 1)
{
struct __ecereNameSpace__ecere__com__MapNode * realNode = (struct __ecereNameSpace__ecere__com__MapNode *)((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 pos, unsigned int create))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition])(this, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key(newNode), 0x1);

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData])(this, realNode, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_value(newNode));
return newNode;
}
else
{
struct __ecereNameSpace__ecere__com__MapNode * node = ((struct __ecereNameSpace__ecere__com__MapNode *)((struct __ecereNameSpace__ecere__com__CustomAVLTree *)(((char *)this + 12)))->root) ? __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Find(((struct __ecereNameSpace__ecere__com__MapNode *)((struct __ecereNameSpace__ecere__com__CustomAVLTree *)(((char *)this + 12)))->root), ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass, (uint64)__ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key(newNode)) : (((void *)0));

if(!node)
{
struct __ecereNameSpace__ecere__com__Class * Tclass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass;

if(Tclass->type == 1000 || Tclass->type == 2 || Tclass->type == 4 || Tclass->type == 3)
{
Tclass->_vTbl[__ecereVMethodID_class_OnCopy](Tclass, (((unsigned char *)&newNode->key) + __ENDIAN_PAD(Tclass->typeSize)), (((unsigned char *)&newNode->key) + __ENDIAN_PAD(Tclass->typeSize)));
}
else
Tclass->_vTbl[__ecereVMethodID_class_OnCopy](Tclass, (((unsigned char *)&newNode->key) + __ENDIAN_PAD(sizeof(void *))), (void *)(uint64)(__ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key(newNode)));
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(this, (uint64)newNode);
return newNode;
}
else
{
((newNode ? (__ecereClass___ecereNameSpace__ecere__com__MapNode->Destructor ? __ecereClass___ecereNameSpace__ecere__com__MapNode->Destructor(newNode) : 0, __ecereClass___ecereNameSpace__ecere__com__AVLNode->Destructor ? __ecereClass___ecereNameSpace__ecere__com__AVLNode->Destructor(newNode) : 0, __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor ? __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor(newNode) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(newNode)) : 0), newNode = 0);
return (((void *)0));
}
}
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove;

int __ecereVMethodID_class_OnFree;

void __ecereMethod___ecereNameSpace__ecere__com__Map_Remove(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__MapNode * node)
{
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, node);
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->type == 1)
{
struct __ecereNameSpace__ecere__com__Class * Tclass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass;

Tclass->_vTbl[__ecereVMethodID_class_OnFree](Tclass, (((unsigned char *)&node->key) + __ENDIAN_PAD(sizeof(void *))));
}
else
(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key(node)), __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_key(node, 0));
((node ? (__ecereClass___ecereNameSpace__ecere__com__MapNode->Destructor ? __ecereClass___ecereNameSpace__ecere__com__MapNode->Destructor(node) : 0, __ecereClass___ecereNameSpace__ecere__com__AVLNode->Destructor ? __ecereClass___ecereNameSpace__ecere__com__AVLNode->Destructor(node) : 0, __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor ? __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor(node) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(node)) : 0), node = 0);
}

void __ecereMethod___ecereNameSpace__ecere__com__Map_Free(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__MapNode * node;

while(node = ((struct __ecereNameSpace__ecere__com__MapNode *)((struct __ecereNameSpace__ecere__com__CustomAVLTree *)(((char *)this + 12)))->root))
{
(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_value(node)), __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_value(node, 0));
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, node);
}
}

void __ecereMethod___ecereNameSpace__ecere__com__Map_Delete(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__MapNode * node)
{
(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_value(node)), __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_value(node, 0));
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, node);
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Find;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Container;

struct __ecereNameSpace__ecere__com__MapNode * __ecereMethod___ecereNameSpace__ecere__com__Map_Find(struct __ecereNameSpace__ecere__com__Instance * this, uint64 value)
{
return (struct __ecereNameSpace__ecere__com__MapNode *)((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__ecereClass___ecereNameSpace__ecere__com__Container->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Find])(this, value);
}

struct __ecereNameSpace__ecere__com__MapNode * __ecereMethod___ecereNameSpace__ecere__com__Map_GetAtPosition(struct __ecereNameSpace__ecere__com__Instance * this, uint64 pos, unsigned int create)
{
void * __ecereTemp1;
struct __ecereNameSpace__ecere__com__MapNode * node = ((struct __ecereNameSpace__ecere__com__MapNode *)((struct __ecereNameSpace__ecere__com__CustomAVLTree *)(((char *)this + 12)))->root) ? __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Find(((struct __ecereNameSpace__ecere__com__MapNode *)((struct __ecereNameSpace__ecere__com__CustomAVLTree *)(((char *)this + 12)))->root), ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass, pos) : (((void *)0));

if(!node && create)
{
struct __ecereNameSpace__ecere__com__Class * Tclass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass;

if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->type == 1 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass->type == 1)
{
unsigned int size = sizeof(struct __ecereNameSpace__ecere__com__MapNode);

if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->type == 1)
size += ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->typeSize - sizeof node->key;
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass->type == 1)
size += ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass->typeSize - sizeof ((((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass->type == 1) ? ((uint64)&node->value) : (((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass->type == 0 || ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass->type == 5) ? (uint64)*((void **)&node->value) : ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass->typeSize == 1) ? *((unsigned char *)&node->value) : ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass->typeSize == 2) ? *((unsigned short *)&node->value) : ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[6].dataTypeClass->typeSize == 4) ? *((unsigned int *)&node->value) : *(&node->value)))))));
node = (struct __ecereNameSpace__ecere__com__MapNode *)__ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (size));
}
else
{
node = (__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(32), __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_key(((struct __ecereNameSpace__ecere__com__MapNode *)__ecereTemp1), pos), ((struct __ecereNameSpace__ecere__com__MapNode *)__ecereTemp1));
}
if(Tclass->type == 1000 || Tclass->type == 2 || Tclass->type == 4 || Tclass->type == 3)
{
Tclass->_vTbl[__ecereVMethodID_class_OnCopy](Tclass, (((unsigned char *)&node->key) + __ENDIAN_PAD(Tclass->typeSize)), (((unsigned char *)&pos) + __ENDIAN_PAD(Tclass->typeSize)));
}
else
Tclass->_vTbl[__ecereVMethodID_class_OnCopy](Tclass, (((unsigned char *)&node->key) + __ENDIAN_PAD(sizeof(void *))), (void *)pos);
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(this, (uint64)node);
}
return node;
}

extern unsigned int __ecereNameSpace__ecere__com__eClass_IsDerived(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class * from);

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BuiltInContainer;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Free;

void __ecereMethod___ecereNameSpace__ecere__com__Map_Copy(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * source)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i;

((void (*)(struct __ecereNameSpace__ecere__com__Instance *))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll])(this);
if(!__ecereNameSpace__ecere__com__eClass_IsDerived(((struct __ecereNameSpace__ecere__com__Instance *)(char *)source)->_class, __ecereClass___ecereNameSpace__ecere__com__Map))
{
for(i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))source->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst])(source); i; i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))source->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext])(source, i))
{
struct __ecereNameSpace__ecere__com__MapNode * srcNode = (struct __ecereNameSpace__ecere__com__MapNode *)((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))source->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(source, i);
struct __ecereNameSpace__ecere__com__MapNode * destNode = (struct __ecereNameSpace__ecere__com__MapNode *)((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 pos, unsigned int create))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition])(this, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key(srcNode), 0x1);

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData])(this, destNode, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_value(srcNode));
}
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)source)->_class == __ecereClass___ecereNameSpace__ecere__com__BuiltInContainer)
((void (*)(struct __ecereNameSpace__ecere__com__Instance *))source->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Free])(source);
}
}

void __ecereProp___ecereNameSpace__ecere__com__Map_Set_mapSrc(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * value)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i;

((void (*)(struct __ecereNameSpace__ecere__com__Instance *))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll])(this);
if(__ecereNameSpace__ecere__com__eClass_IsDerived(((struct __ecereNameSpace__ecere__com__Instance *)(char *)value)->_class, __ecereClass___ecereNameSpace__ecere__com__Map))
{
for(i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *))value->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst])(value); i; i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))value->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext])(value, i))
{
struct __ecereNameSpace__ecere__com__MapNode * srcNode = (struct __ecereNameSpace__ecere__com__MapNode *)i;
struct __ecereNameSpace__ecere__com__MapNode * destNode = (struct __ecereNameSpace__ecere__com__MapNode *)((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 pos, unsigned int create))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition])(this, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key(srcNode), 0x1);

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData])(this, destNode, ((uint64 (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData])(this, srcNode));
}
}
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__com__Map_mapSrc), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__com__Map_mapSrc);
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

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  dataType, void *  setStmt, void *  getStmt, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateParameter;

struct __ecereNameSpace__ecere__com__ClassTemplateParameter;

extern struct __ecereNameSpace__ecere__com__ClassTemplateParameter * __ecereNameSpace__ecere__com__eClass_AddTemplateParameter(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, int type, void *  info, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * defaultArg);

extern void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(struct __ecereNameSpace__ecere__com__Class * base);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Iterator;

struct __ecereNameSpace__ecere__com__Iterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

void __ecereRegisterModule_Map(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::MapNode", "ecere::com::AVLNode<KT>", sizeof(struct __ecereNameSpace__ecere__com__MapNode), 0, 0, 0, module, 4, 2);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__MapNode = class;
__ecerePropM___ecereNameSpace__ecere__com__MapNode_key = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "key", "KT", __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_key, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_key, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__MapNode_key = __ecerePropM___ecereNameSpace__ecere__com__MapNode_key, __ecerePropM___ecereNameSpace__ecere__com__MapNode_key = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapNode_value = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "value", "V", __ecereProp___ecereNameSpace__ecere__com__MapNode_Set_value, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_value, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__MapNode_value = __ecerePropM___ecereNameSpace__ecere__com__MapNode_value, __ecerePropM___ecereNameSpace__ecere__com__MapNode_value = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "value", "V", 8, 0, 1);
__ecerePropM___ecereNameSpace__ecere__com__MapNode_prev = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "prev", "thisclass", 0, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_prev, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__MapNode_prev = __ecerePropM___ecereNameSpace__ecere__com__MapNode_prev, __ecerePropM___ecereNameSpace__ecere__com__MapNode_prev = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapNode_next = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "next", "thisclass", 0, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_next, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__MapNode_next = __ecerePropM___ecereNameSpace__ecere__com__MapNode_next, __ecerePropM___ecereNameSpace__ecere__com__MapNode_next = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapNode_minimum = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "minimum", "thisclass", 0, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_minimum, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__MapNode_minimum = __ecerePropM___ecereNameSpace__ecere__com__MapNode_minimum, __ecerePropM___ecereNameSpace__ecere__com__MapNode_minimum = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapNode_maximum = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "maximum", "thisclass", 0, __ecereProp___ecereNameSpace__ecere__com__MapNode_Get_maximum, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__MapNode_maximum = __ecerePropM___ecereNameSpace__ecere__com__MapNode_maximum, __ecerePropM___ecereNameSpace__ecere__com__MapNode_maximum = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "KT", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "V", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::com::MapIterator", "ecere::com::Iterator<V, IT = KT>", sizeof(struct __ecereNameSpace__ecere__com__MapIterator) - sizeof(struct __ecereNameSpace__ecere__com__Iterator), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__MapIterator = class;
__ecerePropM___ecereNameSpace__ecere__com__MapIterator_map = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "map", "ecere::com::Map", __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_map, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__MapIterator_map = __ecerePropM___ecereNameSpace__ecere__com__MapIterator_map, __ecerePropM___ecereNameSpace__ecere__com__MapIterator_map = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapIterator_key = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "key", "KT", 0, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_key, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__MapIterator_key = __ecerePropM___ecereNameSpace__ecere__com__MapIterator_key, __ecerePropM___ecereNameSpace__ecere__com__MapIterator_key = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__MapIterator_value = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "value", "V", __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_value, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_value, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__MapIterator_value = __ecerePropM___ecereNameSpace__ecere__com__MapIterator_value, __ecerePropM___ecereNameSpace__ecere__com__MapIterator_value = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "KT", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "V", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::Map", "ecere::com::CustomAVLTree<ecere::com::MapNode<MT, V>, I = MT, D = V, KT = MT>", 0, 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Map = class;
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
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__Map_mapSrc = __ecerePropM___ecereNameSpace__ecere__com__Map_mapSrc, __ecerePropM___ecereNameSpace__ecere__com__Map_mapSrc = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "MT", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "V", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
if(class)
class->fixed = (unsigned int)1;
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

