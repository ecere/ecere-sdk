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
struct __ecereNameSpace__ecere__sys__BTNode
{
uintptr_t key;
struct __ecereNameSpace__ecere__sys__BTNode * parent, * left, * right;
int depth;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BTNode;

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

typedef __builtin_va_list __gnuc_va_list;

typedef __gnuc_va_list va_list;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TreePrintStyle;

extern int vsprintf(char * , const char * , __builtin_va_list);

extern int strlen(const char * );

void __ecereNameSpace__ecere__sys__strcatf(char * string, char * format, ...)
{
va_list args;

__builtin_va_start(args, format);
vsprintf(string + strlen(string), format, args);
__builtin_va_end(args);
}

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_prev, * __ecerePropM___ecereNameSpace__ecere__sys__BTNode_prev;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_next, * __ecerePropM___ecereNameSpace__ecere__sys__BTNode_next;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_count, * __ecerePropM___ecereNameSpace__ecere__sys__BTNode_count;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_balanceFactor, * __ecerePropM___ecereNameSpace__ecere__sys__BTNode_balanceFactor;

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * data);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_bool;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_uintptr;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_uint;

void __ecereMethod___ecereNameSpace__ecere__sys__BTNode_OnSerialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__sys__BTNode * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
if((struct __ecereNameSpace__ecere__sys__BTNode *)this)
{
unsigned int truth = 0x1;

__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(channel, __ecereClass_bool, &truth);
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(channel, __ecereClass_uintptr, &this->key);
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(channel, __ecereClass___ecereNameSpace__ecere__sys__BTNode, this->left);
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(channel, __ecereClass___ecereNameSpace__ecere__sys__BTNode, this->right);
}
else
{
unsigned int nothing = 0;

__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(channel, __ecereClass_uint, &nothing);
}
}

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * *  data);

int __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_depthProp(struct __ecereNameSpace__ecere__sys__BTNode * this);

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_depthProp, * __ecerePropM___ecereNameSpace__ecere__sys__BTNode_depthProp;

void __ecereMethod___ecereNameSpace__ecere__sys__BTNode_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__sys__BTNode ** this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned int truth;

__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(channel, __ecereClass_bool, &truth);
if(truth)
{
(*(this)) = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__BTNode);
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(channel, __ecereClass_uintptr, &(*(this))->key);
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(channel, __ecereClass___ecereNameSpace__ecere__sys__BTNode, &(*(this))->left);
if((*(this))->left)
{
(*(this))->left->parent = (void *)*(struct __ecereNameSpace__ecere__sys__BTNode **)this;
}
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(channel, __ecereClass___ecereNameSpace__ecere__sys__BTNode, &(*(this))->right);
if((*(this))->right)
{
(*(this))->right->parent = (void *)*(struct __ecereNameSpace__ecere__sys__BTNode **)this;
}
(*(this))->depth = __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_depthProp(((struct __ecereNameSpace__ecere__sys__BTNode *)(void *)*(struct __ecereNameSpace__ecere__sys__BTNode **)this));
}
else
(*(this)) = (((void *)0));
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_maximum(struct __ecereNameSpace__ecere__sys__BTNode * this);

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_maximum, * __ecerePropM___ecereNameSpace__ecere__sys__BTNode_maximum;

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_prev(struct __ecereNameSpace__ecere__sys__BTNode * this)
{
if(this->left)
return __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_maximum(this->left);
while(this)
{
if(this->parent && this == this->parent->right)
return this->parent;
else
this = this->parent;
}
return this;
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_minimum(struct __ecereNameSpace__ecere__sys__BTNode * this);

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_minimum, * __ecerePropM___ecereNameSpace__ecere__sys__BTNode_minimum;

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(struct __ecereNameSpace__ecere__sys__BTNode * this)
{
struct __ecereNameSpace__ecere__sys__BTNode * right = this->right;

if(right)
return __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_minimum(right);
while(this)
{
struct __ecereNameSpace__ecere__sys__BTNode * parent = this->parent;

if(parent && this == parent->left)
return parent;
else
this = parent;
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_minimum(struct __ecereNameSpace__ecere__sys__BTNode * this)
{
while(this->left)
this = this->left;
return this;
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_maximum(struct __ecereNameSpace__ecere__sys__BTNode * this)
{
while(this->right)
this = this->right;
return this;
}

int __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_count(struct __ecereNameSpace__ecere__sys__BTNode * this)
{
return 1 + (this->left ? __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_count(this->left) : 0) + (this->right ? __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_count(this->right) : 0);
}

int __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_depthProp(struct __ecereNameSpace__ecere__sys__BTNode * this)
{
int leftDepth = this->left ? (__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_depthProp(this->left) + 1) : 0;
int rightDepth = this->right ? (__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_depthProp(this->right) + 1) : 0;

return ((leftDepth > rightDepth) ? leftDepth : rightDepth);
}

void __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Free(struct __ecereNameSpace__ecere__sys__BTNode * this, void (* FreeKey)(void * key))
{
if(this->left)
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_Free(this->left, FreeKey);
if(this->right)
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_Free(this->right, FreeKey);
if(FreeKey)
FreeKey((void *)this->key);
((this ? (__ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor ? __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor(this) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(this)) : 0), this = 0);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Add(struct __ecereNameSpace__ecere__sys__BTNode * this, struct __ecereNameSpace__ecere__sys__BinaryTree * tree, struct __ecereNameSpace__ecere__sys__BTNode * node)
{
uintptr_t newKey = node->key;

while(0x1)
{
int result = tree->CompareKey(tree, newKey, this->key);

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
struct __ecereNameSpace__ecere__sys__BTNode * n;

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
struct __ecereNameSpace__ecere__sys__BTNode * n;

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

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindNode(struct __ecereNameSpace__ecere__sys__BTNode * this, struct __ecereNameSpace__ecere__sys__BTNode * node)
{
if(this == node)
return 0x1;
else if(this->left && __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindNode(this->left, node))
return 0x1;
else if(this->right && __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindNode(this->right, node))
return 0x1;
return 0x0;
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Find(struct __ecereNameSpace__ecere__sys__BTNode * this, struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t key)
{
while(this)
{
int result = tree->CompareKey(tree, key, this->key);

if(result < 0)
this = this->left;
else if(result > 0)
this = this->right;
else
break;
}
return this;
}

extern int strcmp(const char * , const char * );

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindString(struct __ecereNameSpace__ecere__sys__BTNode * this, char * key)
{
while(this)
{
int result;

if(key && this->key)
result = strcmp(key, (char *)this->key);
else if(key && !this->key)
result = 1;
else if(!key && this->key)
result = -1;
else
result = 0;
if(result < 0)
this = this->left;
else if(result > 0)
this = this->right;
else
break;
}
return this;
}

extern int strncmp(const char * , const char * , int n);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindPrefix(struct __ecereNameSpace__ecere__sys__BTNode * this, char * key)
{
struct __ecereNameSpace__ecere__sys__BTNode * subString = (((void *)0));
int len = key ? strlen(key) : 0;

while(this)
{
int result;

if(key && this->key)
result = strcmp(key, (char *)this->key);
else if(key && !this->key)
result = 1;
else if(!key && this->key)
result = -1;
else
result = 0;
if(result < 0)
{
if(!strncmp(key, (char *)this->key, len))
subString = this;
this = this->left;
}
else if(result > 0)
this = this->right;
else
{
subString = this;
break;
}
}
return subString;
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindAll(struct __ecereNameSpace__ecere__sys__BTNode * this, uintptr_t key)
{
struct __ecereNameSpace__ecere__sys__BTNode * result = (((void *)0));

if(this->key == key)
result = this;
if(!result && this->left)
result = __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindAll(this->left, key);
if(!result && this->right)
result = __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindAll(this->right, key);
return result;
}

void __ecereMethod___ecereNameSpace__ecere__sys__BTNode_RemoveSwap(struct __ecereNameSpace__ecere__sys__BTNode * this, struct __ecereNameSpace__ecere__sys__BTNode * swap)
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
struct __ecereNameSpace__ecere__sys__BTNode * n;

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
{
swap->left = this->left;
if(this->left)
this->left->parent = swap;
}
{
swap->right = this->right;
if(this->right)
this->right->parent = swap;
}
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

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Rebalance();

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_RemoveSwapLeft(struct __ecereNameSpace__ecere__sys__BTNode * this)
{
struct __ecereNameSpace__ecere__sys__BTNode * swap = this->left ? __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_maximum(this->left) : this->right;
struct __ecereNameSpace__ecere__sys__BTNode * swapParent = (((void *)0));

if(swap)
{
swapParent = swap->parent;
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_RemoveSwap(this, swap);
}
if(this->parent)
{
if(this == this->parent->left)
this->parent->left = (((void *)0));
else if(this == this->parent->right)
this->parent->right = (((void *)0));
}
{
struct __ecereNameSpace__ecere__sys__BTNode * n;

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
return __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Rebalance(swapParent);
else if(swap)
return __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Rebalance(swap);
else if(this->parent)
return __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Rebalance(this->parent);
else
return (((void *)0));
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_RemoveSwapRight(struct __ecereNameSpace__ecere__sys__BTNode * this)
{
struct __ecereNameSpace__ecere__sys__BTNode * result;
struct __ecereNameSpace__ecere__sys__BTNode * swap = this->right ? __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_minimum(this->right) : this->left;
struct __ecereNameSpace__ecere__sys__BTNode * swapParent = (((void *)0));

if(swap)
{
swapParent = swap->parent;
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_RemoveSwap(this, swap);
}
if(this->parent)
{
if(this == this->parent->left)
this->parent->left = (((void *)0));
else if(this == this->parent->right)
this->parent->right = (((void *)0));
}
{
struct __ecereNameSpace__ecere__sys__BTNode * n;

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
result = __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Rebalance(swapParent);
else if(swap)
result = __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Rebalance(swap);
else if(this->parent)
result = __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Rebalance(this->parent);
else
result = (((void *)0));
return result;
}

int __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_balanceFactor(struct __ecereNameSpace__ecere__sys__BTNode * this)
{
int leftDepth = this->left ? (this->left->depth + 1) : 0;
int rightDepth = this->right ? (this->right->depth + 1) : 0;

return rightDepth - leftDepth;
}

void __ecereMethod___ecereNameSpace__ecere__sys__BTNode_DoubleRotateRight();

void __ecereMethod___ecereNameSpace__ecere__sys__BTNode_SingleRotateRight();

void __ecereMethod___ecereNameSpace__ecere__sys__BTNode_DoubleRotateLeft();

void __ecereMethod___ecereNameSpace__ecere__sys__BTNode_SingleRotateLeft();

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Rebalance(struct __ecereNameSpace__ecere__sys__BTNode * this)
{
while(0x1)
{
int factor = __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_balanceFactor(this);

if(factor < -1)
{
if(__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_balanceFactor(this->left) == 1)
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_DoubleRotateRight(this);
else
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_SingleRotateRight(this);
}
else if(factor > 1)
{
if(__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_balanceFactor(this->right) == -1)
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_DoubleRotateLeft(this);
else
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_SingleRotateLeft(this);
}
if(this->parent)
this = this->parent;
else
return this;
}
}

void __ecereMethod___ecereNameSpace__ecere__sys__BTNode_SingleRotateRight(struct __ecereNameSpace__ecere__sys__BTNode * this)
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
struct __ecereNameSpace__ecere__sys__BTNode * n;

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

void __ecereMethod___ecereNameSpace__ecere__sys__BTNode_SingleRotateLeft(struct __ecereNameSpace__ecere__sys__BTNode * this)
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
struct __ecereNameSpace__ecere__sys__BTNode * n;

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

void __ecereMethod___ecereNameSpace__ecere__sys__BTNode_DoubleRotateRight(struct __ecereNameSpace__ecere__sys__BTNode * this)
{
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_SingleRotateLeft(this->left);
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_SingleRotateRight(this);
}

void __ecereMethod___ecereNameSpace__ecere__sys__BTNode_DoubleRotateLeft(struct __ecereNameSpace__ecere__sys__BTNode * this)
{
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_SingleRotateRight(this->right);
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_SingleRotateLeft(this);
}

extern char *  strcat(char * , const char * );

void __ecereMethod___ecereNameSpace__ecere__sys__BTNode_PrintDepth(struct __ecereNameSpace__ecere__sys__BTNode * this, char *  output, int wantedDepth, int curDepth, int maxDepth, unsigned int last);

char * __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Print(struct __ecereNameSpace__ecere__sys__BTNode * this, char * output, int tps)
{
switch(tps)
{
case 0:
case 2:
case 1:
{
if(tps == 2)
__ecereNameSpace__ecere__sys__strcatf(output, "%d ", this->key);
if(this->left)
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_Print(this->left, output, tps);
if(tps == 0)
__ecereNameSpace__ecere__sys__strcatf(output, "%d ", this->key);
if(this->right)
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_Print(this->right, output, tps);
if(tps == 1)
__ecereNameSpace__ecere__sys__strcatf(output, "%d ", this->key);
return output;
}
case 3:
{
int maxDepth = this->depth;
int curDepth;

for(curDepth = 0; curDepth <= maxDepth; curDepth++)
{
int c;

for(c = 0; c < ((1 << (maxDepth - curDepth)) - 1) * 4 / 2; c++)
strcat(output, " ");
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_PrintDepth(this, output, curDepth, 0, maxDepth, 0x1);
strcat(output, "\n");
}
return output;
}
}
return (((void *)0));
}

extern int sprintf(char * , char * , ...);

void __ecereMethod___ecereNameSpace__ecere__sys__BTNode_PrintDepth(struct __ecereNameSpace__ecere__sys__BTNode * this, char * output, int wantedDepth, int curDepth, int maxDepth, unsigned int last)
{
int c;

if(wantedDepth == curDepth)
{
char nodeString[10] = "";
int len;

if(this)
sprintf(nodeString, "%d", this->key);
len = strlen(nodeString);
for(c = 0; c < (4 - len) / 2; c++)
strcat(output, " ");
len += c;
strcat(output, nodeString);
for(c = len; c < 4; c++)
strcat(output, " ");
if(curDepth && !last)
{
for(c = 0; c < ((1 << (maxDepth - curDepth)) - 1) * 4; c++)
strcat(output, " ");
}
}
else if(curDepth <= maxDepth)
{
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_PrintDepth((this ? this->left : (struct __ecereNameSpace__ecere__sys__BTNode *)(((void *)0))), output, wantedDepth, curDepth + 1, maxDepth, last && this && !this->right);
__ecereMethod___ecereNameSpace__ecere__sys__BTNode_PrintDepth((this ? this->right : (struct __ecereNameSpace__ecere__sys__BTNode *)(((void *)0))), output, wantedDepth, curDepth + 1, maxDepth, last);
}
}

extern int printf(char * , ...);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Check(struct __ecereNameSpace__ecere__sys__BTNode * this, struct __ecereNameSpace__ecere__sys__BinaryTree * tree)
{
unsigned int valid = 0x1;
int leftHeight = this->left ? __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_depthProp(this->left) + 1 : 0;
int rightHeight = this->right ? __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_depthProp(this->right) + 1 : 0;
int diffHeight = rightHeight - leftHeight;

if(this->left)
{
if(this->left->parent != this)
{
printf("Parent not set properly at node %d\n", this->left->key);
valid = 0x0;
}
valid *= __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Check(this->left, tree);
}
if(this->right)
{
if(this->right->parent != this)
{
printf("Parent not set properly at node %d\n", this->right->key);
valid = 0x0;
}
valid *= __ecereMethod___ecereNameSpace__ecere__sys__BTNode_Check(this->right, tree);
}
if(this->depth != __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_depthProp(this))
{
printf("Depth value at node %d (%d) doesn't match depth property (%d)\n", this->key, this->depth, __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_depthProp(this));
valid = (unsigned int)0;
}
if(diffHeight < -1 || diffHeight > 1)
{
valid = (unsigned int)0;
printf("Height difference is %d at node %d\n", diffHeight, this->key);
}
if(diffHeight != __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_balanceFactor(this))
{
valid = (unsigned int)0;
printf("Height difference %d doesnt match balance-factor of %d at node \n", diffHeight, __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_balanceFactor(this), this->key);
}
if(this->left && tree->CompareKey(tree, this->left->key, this->key) > 0)
{
valid = 0x0;
printf("Node %d is *smaller* than left subtree %d\n", this->key, this->left->key);
}
if(this->right && tree->CompareKey(tree, this->right->key, this->key) < 0)
{
valid = 0x0;
printf("Node %d is *greater* than right subtree %d\n", this->key, this->right->key);
}
return valid;
}

struct __ecereNameSpace__ecere__sys__StringBTNode
{
char * key;
struct __ecereNameSpace__ecere__sys__StringBTNode * parent, * left, * right;
int depth;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__StringBTNode;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_String;

void __ecereMethod___ecereNameSpace__ecere__sys__StringBTNode_OnSerialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__sys__StringBTNode * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
if((struct __ecereNameSpace__ecere__sys__StringBTNode *)this)
{
unsigned int truth = 0x1;

__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(channel, __ecereClass_bool, &truth);
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(channel, __ecereClass_String, this->key);
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(channel, __ecereClass___ecereNameSpace__ecere__sys__StringBTNode, this->left);
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(channel, __ecereClass___ecereNameSpace__ecere__sys__StringBTNode, this->right);
}
else
{
unsigned int nothing = 0;

__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(channel, __ecereClass_uint, &nothing);
}
}

void __ecereMethod___ecereNameSpace__ecere__sys__StringBTNode_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__sys__StringBTNode ** this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned int truth;

__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(channel, __ecereClass_bool, &truth);
if(truth)
{
(*(this)) = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__StringBTNode);
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(channel, __ecereClass_String, &(*(this))->key);
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(channel, __ecereClass___ecereNameSpace__ecere__sys__StringBTNode, &(*(this))->left);
if((*(this))->left)
{
(*(this))->left->parent = (void *)*(struct __ecereNameSpace__ecere__sys__StringBTNode **)this;
}
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(channel, __ecereClass___ecereNameSpace__ecere__sys__StringBTNode, &(*(this))->right);
if((*(this))->right)
{
(*(this))->right->parent = (void *)*(struct __ecereNameSpace__ecere__sys__StringBTNode **)this;
}
(*(this))->depth = __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_depthProp(((struct __ecereNameSpace__ecere__sys__BTNode *)((void *)*(struct __ecereNameSpace__ecere__sys__StringBTNode **)this)));
}
else
(*(this)) = (((void *)0));
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

extern void __ecereNameSpace__ecere__com__eEnum_AddFixedValue(struct __ecereNameSpace__ecere__com__Class * _class, char *  string, int value);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  dataType, void *  setStmt, void *  getStmt, int declMode);

void __ecereRegisterModule_BTNode(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::sys::TreePrintStyle", 0, 0, 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__TreePrintStyle = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "inOrder", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "postOrder", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "preOrder", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "depthOrder", 3);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::strcatf", "void ecere::sys::strcatf(char * string, char * format, ...)", __ecereNameSpace__ecere__sys__strcatf, module, 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::sys::BTNode", 0, sizeof(struct __ecereNameSpace__ecere__sys__BTNode), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__BTNode = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnSerialize", 0, __ecereMethod___ecereNameSpace__ecere__sys__BTNode_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnUnserialize", 0, __ecereMethod___ecereNameSpace__ecere__sys__BTNode_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "FindPrefix", "ecere::sys::BTNode FindPrefix(char * key)", __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindPrefix, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "FindString", "ecere::sys::BTNode FindString(char * key)", __ecereMethod___ecereNameSpace__ecere__sys__BTNode_FindString, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "key", "uintptr", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "parent", "ecere::sys::BTNode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "left", "ecere::sys::BTNode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "right", "ecere::sys::BTNode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "depth", "int", 4, 4, 1);
__ecerePropM___ecereNameSpace__ecere__sys__BTNode_prev = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "prev", "ecere::sys::BTNode", 0, __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_prev, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__BTNode_prev = __ecerePropM___ecereNameSpace__ecere__sys__BTNode_prev, __ecerePropM___ecereNameSpace__ecere__sys__BTNode_prev = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BTNode_next = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "next", "ecere::sys::BTNode", 0, __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__BTNode_next = __ecerePropM___ecereNameSpace__ecere__sys__BTNode_next, __ecerePropM___ecereNameSpace__ecere__sys__BTNode_next = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BTNode_minimum = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "minimum", "ecere::sys::BTNode", 0, __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_minimum, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__BTNode_minimum = __ecerePropM___ecereNameSpace__ecere__sys__BTNode_minimum, __ecerePropM___ecereNameSpace__ecere__sys__BTNode_minimum = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BTNode_maximum = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "maximum", "ecere::sys::BTNode", 0, __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_maximum, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__BTNode_maximum = __ecerePropM___ecereNameSpace__ecere__sys__BTNode_maximum, __ecerePropM___ecereNameSpace__ecere__sys__BTNode_maximum = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BTNode_count = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "count", "int", 0, __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_count, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__BTNode_count = __ecerePropM___ecereNameSpace__ecere__sys__BTNode_count, __ecerePropM___ecereNameSpace__ecere__sys__BTNode_count = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BTNode_depthProp = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "depthProp", "int", 0, __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_depthProp, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__BTNode_depthProp = __ecerePropM___ecereNameSpace__ecere__sys__BTNode_depthProp, __ecerePropM___ecereNameSpace__ecere__sys__BTNode_depthProp = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BTNode_balanceFactor = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "balanceFactor", "int", 0, __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_balanceFactor, 2);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__BTNode_balanceFactor = __ecerePropM___ecereNameSpace__ecere__sys__BTNode_balanceFactor, __ecerePropM___ecereNameSpace__ecere__sys__BTNode_balanceFactor = (void *)0;
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::sys::StringBTNode", 0, sizeof(struct __ecereNameSpace__ecere__sys__StringBTNode), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__StringBTNode = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnSerialize", 0, __ecereMethod___ecereNameSpace__ecere__sys__StringBTNode_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnUnserialize", 0, __ecereMethod___ecereNameSpace__ecere__sys__StringBTNode_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "key", "String", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "parent", "ecere::sys::StringBTNode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "left", "ecere::sys::StringBTNode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "right", "ecere::sys::StringBTNode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "depth", "int", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
}

void __ecereUnregisterModule_BTNode(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__sys__BTNode_prev = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BTNode_next = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BTNode_minimum = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BTNode_maximum = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BTNode_count = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BTNode_depthProp = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__BTNode_balanceFactor = (void *)0;
}

