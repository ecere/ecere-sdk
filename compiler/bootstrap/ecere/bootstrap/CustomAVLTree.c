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

extern int __ecereVMethodID_class_OnCompare;

extern int __ecereVMethodID_class_OnCopy;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_prev, * __ecerePropM___ecereNameSpace__ecere__com__AVLNode_prev;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_next, * __ecerePropM___ecereNameSpace__ecere__com__AVLNode_next;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_count, * __ecerePropM___ecereNameSpace__ecere__com__AVLNode_count;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_depthProp, * __ecerePropM___ecereNameSpace__ecere__com__AVLNode_depthProp;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_balanceFactor, * __ecerePropM___ecereNameSpace__ecere__com__AVLNode_balanceFactor;

struct __ecereNameSpace__ecere__com__AVLNode
{
struct __ecereNameSpace__ecere__com__AVLNode * parent, * left, * right;
int depth;
uint64 key;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__AVLNode;

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_maximum(struct __ecereNameSpace__ecere__com__AVLNode * this);

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_maximum, * __ecerePropM___ecereNameSpace__ecere__com__AVLNode_maximum;

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_prev(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
if(this->left)
return __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_maximum(this->left);
while(this)
{
if(this->parent && this == this->parent->right)
return this->parent;
else
this = this->parent;
}
return this;
}

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_minimum(struct __ecereNameSpace__ecere__com__AVLNode * this);

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_minimum, * __ecerePropM___ecereNameSpace__ecere__com__AVLNode_minimum;

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_next(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
struct __ecereNameSpace__ecere__com__AVLNode * right = this->right;

if(right)
return __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_minimum(right);
while(this)
{
struct __ecereNameSpace__ecere__com__AVLNode * parent = this->parent;

if(parent && this == parent->left)
return parent;
else
this = parent;
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_minimum(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
while(this->left)
this = this->left;
return this;
}

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_maximum(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
while(this->right)
this = this->right;
return this;
}

int __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_count(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
return 1 + (this->left ? __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_count(this->left) : 0) + (this->right ? __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_count(this->right) : 0);
}

int __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_depthProp(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
int leftDepth = this->left ? (__ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_depthProp(this->left) + 1) : 0;
int rightDepth = this->right ? (__ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_depthProp(this->right) + 1) : 0;

return ((leftDepth > rightDepth) ? leftDepth : rightDepth);
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IteratorPointer;

void __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Free(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
if(this->left)
__ecereMethod___ecereNameSpace__ecere__com__AVLNode_Free(this->left);
if(this->right)
__ecereMethod___ecereNameSpace__ecere__com__AVLNode_Free(this->right);
((this ? (__ecereClass___ecereNameSpace__ecere__com__AVLNode->Destructor ? __ecereClass___ecereNameSpace__ecere__com__AVLNode->Destructor(this) : 0, __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor ? __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor(this) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(this)) : 0), this = 0);
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_uint64;

unsigned int __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Add(struct __ecereNameSpace__ecere__com__AVLNode * this, struct __ecereNameSpace__ecere__com__Class * Tclass, struct __ecereNameSpace__ecere__com__AVLNode * node)
{
uint64 newKey = node->key;

if(!Tclass)
Tclass = __ecereClass_uint64;
while(0x1)
{
int result = Tclass->_vTbl[__ecereVMethodID_class_OnCompare](Tclass, (Tclass->type == 1000 || Tclass->type == 2 || Tclass->type == 4 || Tclass->type == 3 || Tclass->type == 1) ? (((unsigned char *)&node->key) + __ENDIAN_PAD((Tclass->type == 1) ? sizeof(void *) : Tclass->typeSize)) : (void *)*(uint64 *)(&node->key), (Tclass->type == 1000 || Tclass->type == 2 || Tclass->type == 4 || Tclass->type == 3 || Tclass->type == 1) ? (((unsigned char *)&this->key) + __ENDIAN_PAD((Tclass->type == 1) ? sizeof(void *) : Tclass->typeSize)) : (void *)*(uint64 *)(&this->key));

if(!result)
{
return 0x0;
}
else if(result > 0)
{
if(this->right)
this = this->right;
else
{
node->parent = this;
this->right = node;
node->depth = 0;
{
struct __ecereNameSpace__ecere__com__AVLNode * n;

for(n = this; n; n = n->parent)
{
int __simpleStruct0, __simpleStruct1;
int newDepth = (__simpleStruct0 = n->left ? (n->left->depth + 1) : 0, __simpleStruct1 = n->right ? (n->right->depth + 1) : 0, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);

if(newDepth == n->depth)
break;
n->depth = newDepth;
}
}
return 0x1;
}
}
else
{
if(this->left)
this = this->left;
else
{
node->parent = this;
this->left = node;
node->depth = 0;
{
struct __ecereNameSpace__ecere__com__AVLNode * n;

for(n = this; n; n = n->parent)
{
int __simpleStruct0, __simpleStruct1;
int newDepth = (__simpleStruct0 = n->left ? (n->left->depth + 1) : 0, __simpleStruct1 = n->right ? (n->right->depth + 1) : 0, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);

if(newDepth == n->depth)
break;
n->depth = newDepth;
}
}
return 0x1;
}
}
}
}

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Find(struct __ecereNameSpace__ecere__com__AVLNode * this, struct __ecereNameSpace__ecere__com__Class * Tclass, uint64 key)
{
while(this)
{
int result = Tclass->_vTbl[__ecereVMethodID_class_OnCompare](Tclass, (Tclass->type == 1000 || Tclass->type == 2 || Tclass->type == 4 || Tclass->type == 3) ? (((unsigned char *)&key) + __ENDIAN_PAD(Tclass->typeSize)) : (void *)key, (Tclass->type == 1000 || Tclass->type == 2 || Tclass->type == 4 || Tclass->type == 3 || Tclass->type == 1) ? (((unsigned char *)&this->key) + __ENDIAN_PAD((Tclass->type == 1) ? sizeof(void *) : Tclass->typeSize)) : (void *)*(uint64 *)(&this->key));

if(result < 0)
this = this->left;
else if(result > 0)
this = this->right;
else
break;
}
return this;
}

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLNode_FindAll(struct __ecereNameSpace__ecere__com__AVLNode * this, uint64 key)
{
struct __ecereNameSpace__ecere__com__AVLNode * result = (((void *)0));

if(this->key == key)
result = this;
if(!result && this->left)
result = __ecereMethod___ecereNameSpace__ecere__com__AVLNode_FindAll(this->left, key);
if(!result && this->right)
result = __ecereMethod___ecereNameSpace__ecere__com__AVLNode_FindAll(this->right, key);
return result;
}

void __ecereMethod___ecereNameSpace__ecere__com__AVLNode_RemoveSwap(struct __ecereNameSpace__ecere__com__AVLNode * this, struct __ecereNameSpace__ecere__com__AVLNode * swap)
{
if(swap->left)
{
swap->left->parent = swap->parent;
if(swap == swap->parent->left)
swap->parent->left = swap->left;
else if(swap == swap->parent->right)
swap->parent->right = swap->left;
swap->left = (((void *)0));
}
if(swap->right)
{
swap->right->parent = swap->parent;
if(swap == swap->parent->left)
swap->parent->left = swap->right;
else if(swap == swap->parent->right)
swap->parent->right = swap->right;
swap->right = (((void *)0));
}
if(swap == swap->parent->left)
swap->parent->left = (((void *)0));
else if(swap == swap->parent->right)
swap->parent->right = (((void *)0));
{
struct __ecereNameSpace__ecere__com__AVLNode * n;

for(n = swap->parent; n; n = n->parent)
{
int __simpleStruct0, __simpleStruct1;
int newDepth = (__simpleStruct0 = n->left ? (n->left->depth + 1) : 0, __simpleStruct1 = n->right ? (n->right->depth + 1) : 0, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);

if(newDepth == n->depth)
break;
n->depth = newDepth;
if(n == this)
break;
}
}
swap->left = this->left;
if(this->left)
this->left->parent = swap;
swap->right = this->right;
if(this->right)
this->right->parent = swap;
swap->parent = this->parent;
this->left = (((void *)0));
this->right = (((void *)0));
if(this->parent)
{
if(this == this->parent->left)
this->parent->left = swap;
else if(this == this->parent->right)
this->parent->right = swap;
}
}

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Rebalance();

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLNode_RemoveSwapLeft(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
struct __ecereNameSpace__ecere__com__AVLNode * swap = this->left ? __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_maximum(this->left) : this->right;
struct __ecereNameSpace__ecere__com__AVLNode * swapParent = (((void *)0));

if(swap)
{
swapParent = swap->parent;
__ecereMethod___ecereNameSpace__ecere__com__AVLNode_RemoveSwap(this, swap);
}
if(this->parent)
{
if(this == this->parent->left)
this->parent->left = (((void *)0));
else if(this == this->parent->right)
this->parent->right = (((void *)0));
}
{
struct __ecereNameSpace__ecere__com__AVLNode * n;

for(n = swap ? swap : this->parent; n; n = n->parent)
{
int __simpleStruct0, __simpleStruct1;
int newDepth = (__simpleStruct0 = n->left ? (n->left->depth + 1) : 0, __simpleStruct1 = n->right ? (n->right->depth + 1) : 0, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);

if(newDepth == n->depth && n != swap)
break;
n->depth = newDepth;
}
}
if(swapParent && swapParent != this)
return __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Rebalance(swapParent);
else if(swap)
return __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Rebalance(swap);
else if(this->parent)
return __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Rebalance(this->parent);
else
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLNode_RemoveSwapRight(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
struct __ecereNameSpace__ecere__com__AVLNode * result;
struct __ecereNameSpace__ecere__com__AVLNode * swap = this->right ? __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_minimum(this->right) : this->left;
struct __ecereNameSpace__ecere__com__AVLNode * swapParent = (((void *)0));

if(swap)
{
swapParent = swap->parent;
__ecereMethod___ecereNameSpace__ecere__com__AVLNode_RemoveSwap(this, swap);
}
if(this->parent)
{
if(this == this->parent->left)
this->parent->left = (((void *)0));
else if(this == this->parent->right)
this->parent->right = (((void *)0));
}
{
struct __ecereNameSpace__ecere__com__AVLNode * n;

for(n = swap ? swap : this->parent; n; n = n->parent)
{
int __simpleStruct0, __simpleStruct1;
int newDepth = (__simpleStruct0 = n->left ? (n->left->depth + 1) : 0, __simpleStruct1 = n->right ? (n->right->depth + 1) : 0, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);

if(newDepth == n->depth && n != swap)
break;
n->depth = newDepth;
}
}
if(swapParent && swapParent != this)
result = __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Rebalance(swapParent);
else if(swap)
result = __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Rebalance(swap);
else if(this->parent)
result = __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Rebalance(this->parent);
else
result = (((void *)0));
return result;
}

int __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_balanceFactor(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
int leftDepth = this->left ? (this->left->depth + 1) : 0;
int rightDepth = this->right ? (this->right->depth + 1) : 0;

return rightDepth - leftDepth;
}

void __ecereMethod___ecereNameSpace__ecere__com__AVLNode_DoubleRotateRight();

void __ecereMethod___ecereNameSpace__ecere__com__AVLNode_SingleRotateRight();

void __ecereMethod___ecereNameSpace__ecere__com__AVLNode_DoubleRotateLeft();

void __ecereMethod___ecereNameSpace__ecere__com__AVLNode_SingleRotateLeft();

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Rebalance(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
while(0x1)
{
int factor = __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_balanceFactor(this);

if(factor < -1)
{
if(__ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_balanceFactor(this->left) == 1)
__ecereMethod___ecereNameSpace__ecere__com__AVLNode_DoubleRotateRight(this);
else
__ecereMethod___ecereNameSpace__ecere__com__AVLNode_SingleRotateRight(this);
}
else if(factor > 1)
{
if(__ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_balanceFactor(this->right) == -1)
__ecereMethod___ecereNameSpace__ecere__com__AVLNode_DoubleRotateLeft(this);
else
__ecereMethod___ecereNameSpace__ecere__com__AVLNode_SingleRotateLeft(this);
}
if(this->parent)
this = this->parent;
else
return this;
}
}

void __ecereMethod___ecereNameSpace__ecere__com__AVLNode_SingleRotateRight(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
int __simpleStruct2, __simpleStruct3;
int __simpleStruct0, __simpleStruct1;

if(this->parent)
{
if(this == this->parent->left)
this->parent->left = this->left;
else if(this == this->parent->right)
this->parent->right = this->left;
}
this->left->parent = this->parent;
this->parent = this->left;
this->left = this->parent->right;
if(this->left)
this->left->parent = this;
this->parent->right = this;
this->depth = (__simpleStruct0 = this->left ? (this->left->depth + 1) : 0, __simpleStruct1 = this->right ? (this->right->depth + 1) : 0, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
this->parent->depth = (__simpleStruct2 = this->parent->left ? (this->parent->left->depth + 1) : 0, __simpleStruct3 = this->parent->right ? (this->parent->right->depth + 1) : 0, (__simpleStruct2 > __simpleStruct3) ? __simpleStruct2 : __simpleStruct3);
{
struct __ecereNameSpace__ecere__com__AVLNode * n;

for(n = this->parent->parent; n; n = n->parent)
{
int __simpleStruct0, __simpleStruct1;
int newDepth = (__simpleStruct0 = n->left ? (n->left->depth + 1) : 0, __simpleStruct1 = n->right ? (n->right->depth + 1) : 0, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);

if(newDepth == n->depth)
break;
n->depth = newDepth;
}
}
}

void __ecereMethod___ecereNameSpace__ecere__com__AVLNode_SingleRotateLeft(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
int __simpleStruct2, __simpleStruct3;
int __simpleStruct0, __simpleStruct1;

if(this->parent)
{
if(this == this->parent->right)
this->parent->right = this->right;
else if(this == this->parent->left)
this->parent->left = this->right;
}
this->right->parent = this->parent;
this->parent = this->right;
this->right = this->parent->left;
if(this->right)
this->right->parent = this;
this->parent->left = this;
this->depth = (__simpleStruct0 = this->left ? (this->left->depth + 1) : 0, __simpleStruct1 = this->right ? (this->right->depth + 1) : 0, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
this->parent->depth = (__simpleStruct2 = this->parent->left ? (this->parent->left->depth + 1) : 0, __simpleStruct3 = this->parent->right ? (this->parent->right->depth + 1) : 0, (__simpleStruct2 > __simpleStruct3) ? __simpleStruct2 : __simpleStruct3);
{
struct __ecereNameSpace__ecere__com__AVLNode * n;

for(n = this->parent->parent; n; n = n->parent)
{
int __simpleStruct0, __simpleStruct1;
int newDepth = (__simpleStruct0 = n->left ? (n->left->depth + 1) : 0, __simpleStruct1 = n->right ? (n->right->depth + 1) : 0, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);

if(newDepth == n->depth)
break;
n->depth = newDepth;
}
}
}

void __ecereMethod___ecereNameSpace__ecere__com__AVLNode_DoubleRotateRight(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
__ecereMethod___ecereNameSpace__ecere__com__AVLNode_SingleRotateLeft(this->left);
__ecereMethod___ecereNameSpace__ecere__com__AVLNode_SingleRotateRight(this);
}

void __ecereMethod___ecereNameSpace__ecere__com__AVLNode_DoubleRotateLeft(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
__ecereMethod___ecereNameSpace__ecere__com__AVLNode_SingleRotateRight(this->right);
__ecereMethod___ecereNameSpace__ecere__com__AVLNode_SingleRotateLeft(this);
}

struct __ecereNameSpace__ecere__com__CustomAVLTree
{
struct __ecereNameSpace__ecere__com__AVLNode * root;
int count;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__CustomAVLTree;

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetFirst(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 12) : 0);

return (struct __ecereNameSpace__ecere__com__IteratorPointer *)(__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root ? __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_minimum(__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root) : (((void *)0)));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetLast(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 12) : 0);

return (struct __ecereNameSpace__ecere__com__IteratorPointer *)(__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root ? __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_maximum(__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root) : (((void *)0)));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetPrev(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * node)
{
struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 12) : 0);

return __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_prev(((struct __ecereNameSpace__ecere__com__AVLNode *)node));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetNext(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * node)
{
struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 12) : 0);

return __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_next(((struct __ecereNameSpace__ecere__com__AVLNode *)node));
}

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * node)
{
struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 12) : 0);

return (struct __ecereNameSpace__ecere__com__AVLNode *)node;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_SetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * node, uint64 data)
{
struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 12) : 0);

return 0x0;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

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

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Add(struct __ecereNameSpace__ecere__com__Instance * this, uint64 node)
{
struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 12) : 0);

if(!__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root)
__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root = node;
else
{
struct __ecereNameSpace__ecere__com__Class * Tclass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].dataTypeClass->templateArgs[0].dataTypeClass;

if(!Tclass)
{
Tclass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].dataTypeClass->templateArgs[0].dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application, ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].dataTypeClass->templateArgs[0].dataTypeString);
}
if(__ecereMethod___ecereNameSpace__ecere__com__AVLNode_Add(__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root, Tclass, node))
__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root = (uint64)(__ecereMethod___ecereNameSpace__ecere__com__AVLNode_Rebalance(node));
else
return (((void *)0));
}
__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->count++;
return (struct __ecereNameSpace__ecere__com__IteratorPointer *)node;
}

void __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Remove(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * node)
{
struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 12) : 0);
struct __ecereNameSpace__ecere__com__AVLNode * parent = ((struct __ecereNameSpace__ecere__com__AVLNode *)node)->parent;

if(parent || __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root == (struct __ecereNameSpace__ecere__com__AVLNode *)node)
{
__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root = (uint64)(__ecereMethod___ecereNameSpace__ecere__com__AVLNode_RemoveSwapRight(((struct __ecereNameSpace__ecere__com__AVLNode *)node)));
__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->count--;
((struct __ecereNameSpace__ecere__com__AVLNode *)node)->parent = (((void *)0));
}
}

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove;

int __ecereVMethodID_class_OnFree;

void __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Delete(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * _item)
{
struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 12) : 0);
struct __ecereNameSpace__ecere__com__AVLNode * item = (struct __ecereNameSpace__ecere__com__AVLNode *)_item;

((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, _item);
(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].dataTypeClass, item), item = 0);
}

void __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Free(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 12) : 0);
struct __ecereNameSpace__ecere__com__AVLNode * item;

while(item = __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root)
{
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, item);
(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].dataTypeClass, item), item = 0);
}
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Find(struct __ecereNameSpace__ecere__com__Instance * this, uint64 value)
{
struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 12) : 0);

return (struct __ecereNameSpace__ecere__com__IteratorPointer *)value;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, char *  name, char *  baseName, int size, int sizeClass, unsigned int (* )(void * ), void (* )(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  dataType, void *  setStmt, void *  getStmt, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateParameter;

struct __ecereNameSpace__ecere__com__ClassTemplateParameter;

extern struct __ecereNameSpace__ecere__com__ClassTemplateParameter * __ecereNameSpace__ecere__com__eClass_AddTemplateParameter(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, int type, void *  info, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * defaultArg);

extern void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(struct __ecereNameSpace__ecere__com__Class * base);

void __ecereRegisterModule_CustomAVLTree(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument __simpleStruct0 = 
{
"uint64", 0, 0, 0, 0
};
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::AVLNode", "ecere::com::IteratorPointer", sizeof(struct __ecereNameSpace__ecere__com__AVLNode), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__AVLNode = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Find", "thisclass Find(ecere::com::Class Tclass, T key)", __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Find, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "__ecerePrivateData0", "byte[16]", 16, 1, 2);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "key", "T", 8, 0, 1);
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_prev = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "prev", "thisclass", 0, __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_prev, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__AVLNode_prev = __ecerePropM___ecereNameSpace__ecere__com__AVLNode_prev, __ecerePropM___ecereNameSpace__ecere__com__AVLNode_prev = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_next = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "next", "thisclass", 0, __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_next, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__AVLNode_next = __ecerePropM___ecereNameSpace__ecere__com__AVLNode_next, __ecerePropM___ecereNameSpace__ecere__com__AVLNode_next = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_minimum = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "minimum", "thisclass", 0, __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_minimum, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__AVLNode_minimum = __ecerePropM___ecereNameSpace__ecere__com__AVLNode_minimum, __ecerePropM___ecereNameSpace__ecere__com__AVLNode_minimum = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_maximum = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "maximum", "thisclass", 0, __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_maximum, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__AVLNode_maximum = __ecerePropM___ecereNameSpace__ecere__com__AVLNode_maximum, __ecerePropM___ecereNameSpace__ecere__com__AVLNode_maximum = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_count = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "count", "int", 0, __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_count, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__AVLNode_count = __ecerePropM___ecereNameSpace__ecere__com__AVLNode_count, __ecerePropM___ecereNameSpace__ecere__com__AVLNode_count = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_depthProp = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "depthProp", "int", 0, __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_depthProp, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__AVLNode_depthProp = __ecerePropM___ecereNameSpace__ecere__com__AVLNode_depthProp, __ecerePropM___ecereNameSpace__ecere__com__AVLNode_depthProp = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_balanceFactor = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "balanceFactor", "int", 0, __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_balanceFactor, 2);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__AVLNode_balanceFactor = __ecerePropM___ecereNameSpace__ecere__com__AVLNode_balanceFactor, __ecerePropM___ecereNameSpace__ecere__com__AVLNode_balanceFactor = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "T", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::CustomAVLTree", "ecere::com::Container<BT>", sizeof(struct __ecereNameSpace__ecere__com__CustomAVLTree), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetFirst", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetFirst, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetLast", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetLast, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetPrev", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetPrev, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetNext", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetNext, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetData", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "SetData", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_SetData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Add", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Add, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Remove", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Remove, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Find", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Find, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Free", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Free, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Delete", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Delete, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "root", "BT", 4, 0, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "count", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "BT", 0, "ecere::com::AVLNode", (((void *)0)));
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "KT", 0, 0, &__simpleStruct0);
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
if(class)
class->fixed = (unsigned int)1;
}

void __ecereUnregisterModule_CustomAVLTree(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__com__AVLNode_prev = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_next = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_minimum = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_maximum = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_count = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_depthProp = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_balanceFactor = (void *)0;
}

