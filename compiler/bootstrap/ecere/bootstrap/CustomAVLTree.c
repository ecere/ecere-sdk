/* Code generated from eC source file: CustomAVLTree.ec */
#if defined(_WIN32)
#define __runtimePlatform 1
#elif defined(__APPLE__)
#define __runtimePlatform 3
#else
#define __runtimePlatform 2
#endif
#if defined(__GNUC__) || defined(__clang__)
#if defined(__clang__) && defined(__WIN32__)
#define int64 long long
#define uint64 unsigned long long
#if defined(_WIN64)
#define ssize_t long long
#else
#define ssize_t long
#endif
#else
typedef long long int64;
typedef unsigned long long uint64;
#endif
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
#   if defined(__clang__) && defined(__WIN32__)
#      define ecere_stdcall __stdcall
#      define ecere_gcc_struct
#   elif defined(__GNUC__) || defined(__TINYC__)
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

extern int __ecereVMethodID_class_OnCopy;

extern int __ecereVMethodID_class_OnFree;

struct __ecereNameSpace__ecere__com__CustomAVLTree
{
struct __ecereNameSpace__ecere__com__AVLNode * root;
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

struct __ecereNameSpace__ecere__com__AVLNode;

extern int strcmp(const char * , const char * );

extern int printf(const char * , ...);

struct __ecereNameSpace__ecere__com__IteratorPointer;

struct __ecereNameSpace__ecere__com__AVLNode;

extern void *  memcpy(void * , const void * , size_t size);

struct __ecereNameSpace__ecere__com__ClassTemplateParameter;

extern int __ecereVMethodID_class_OnCompare;

extern int __ecereVMethodID_class_OnFree;

struct __ecereNameSpace__ecere__com__AVLNode
{
struct __ecereNameSpace__ecere__com__AVLNode * parent, * left, * right;
int depth;
uint64 key;
} ecere_gcc_struct;

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

int __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_balanceFactor(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
int leftDepth = this->left ? (this->left->depth + 1) : 0;
int rightDepth = this->right ? (this->right->depth + 1) : 0;

return rightDepth - leftDepth;
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

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_maximum(struct __ecereNameSpace__ecere__com__AVLNode * this);

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_minimum(struct __ecereNameSpace__ecere__com__AVLNode * this);

int __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_count(struct __ecereNameSpace__ecere__com__AVLNode * this);

int __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_depthProp(struct __ecereNameSpace__ecere__com__AVLNode * this);

int __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_balanceFactor(struct __ecereNameSpace__ecere__com__AVLNode * this);

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_prev(struct __ecereNameSpace__ecere__com__AVLNode * this);

struct __ecereNameSpace__ecere__com__AVLNode * __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_next(struct __ecereNameSpace__ecere__com__AVLNode * this);

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

struct __ecereNameSpace__ecere__com__Property;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_prev, * __ecerePropM___ecereNameSpace__ecere__com__AVLNode_prev;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_next, * __ecerePropM___ecereNameSpace__ecere__com__AVLNode_next;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_minimum, * __ecerePropM___ecereNameSpace__ecere__com__AVLNode_minimum;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_maximum, * __ecerePropM___ecereNameSpace__ecere__com__AVLNode_maximum;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_count, * __ecerePropM___ecereNameSpace__ecere__com__AVLNode_count;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_depthProp, * __ecerePropM___ecereNameSpace__ecere__com__AVLNode_depthProp;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_balanceFactor, * __ecerePropM___ecereNameSpace__ecere__com__AVLNode_balanceFactor;

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

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Rebalance(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
while(1)
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

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} ecere_gcc_struct;

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

extern void __ecereNameSpace__ecere__com__eEnum_AddFixedValue(struct __ecereNameSpace__ecere__com__Class * _class, const char *  string, long long value);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  dataType, void *  setStmt, void *  getStmt, int declMode);

extern void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(struct __ecereNameSpace__ecere__com__Class * base);

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

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove;

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__AVLNode *  __ecereMethod___ecereNameSpace__ecere__com__AVLNode_FindAll(struct __ecereNameSpace__ecere__com__AVLNode *  this, const uint64 key);

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLNode_FindAll(struct __ecereNameSpace__ecere__com__AVLNode * this, const uint64 key)
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

struct __ecereNameSpace__ecere__com__AVLNode *  __ecereMethod___ecereNameSpace__ecere__com__AVLNode_FindEx(struct __ecereNameSpace__ecere__com__AVLNode *  this, struct __ecereNameSpace__ecere__com__Class *  Tclass, const uint64 key, struct __ecereNameSpace__ecere__com__AVLNode * *  addTo, int *  addSide);

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Find(struct __ecereNameSpace__ecere__com__AVLNode * this, struct __ecereNameSpace__ecere__com__Class * Tclass, const uint64 key)
{
return __ecereMethod___ecereNameSpace__ecere__com__AVLNode_FindEx(this, Tclass, key, (((void *)0)), (((void *)0)));
}

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, const char *  name);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, const char *  name, const char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__AddSide;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__AVLNode;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__CustomAVLTree;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IteratorPointer;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_uint64;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_int64;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_double;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_int;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_uint;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

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

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetFirst(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

return (struct __ecereNameSpace__ecere__com__IteratorPointer *)(__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root ? __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_minimum(((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root)))) : (((void *)0)));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetLast(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

return (struct __ecereNameSpace__ecere__com__IteratorPointer *)(__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root ? __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_maximum(((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root)))) : (((void *)0)));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetPrev(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * node)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

return (void *)(__ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_prev(((struct __ecereNameSpace__ecere__com__AVLNode *)node)));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetNext(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * node)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

return (void *)(__ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_next(((struct __ecereNameSpace__ecere__com__AVLNode *)node)));
}

uint64 __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * node)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

return (uint64)(uintptr_t)(struct __ecereNameSpace__ecere__com__AVLNode *)(uintptr_t)node;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_SetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * node, uint64 data)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

return 0;
}

void __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Remove(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * node)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);
struct __ecereNameSpace__ecere__com__AVLNode * parent = ((struct __ecereNameSpace__ecere__com__AVLNode *)node)->parent;

if(parent || ((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root))) == (struct __ecereNameSpace__ecere__com__AVLNode *)node)
{
__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root = __ecereMethod___ecereNameSpace__ecere__com__AVLNode_RemoveSwapRight(((struct __ecereNameSpace__ecere__com__AVLNode *)node));
__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->count--;
((struct __ecereNameSpace__ecere__com__AVLNode *)node)->parent = (((void *)0));
}
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Find(struct __ecereNameSpace__ecere__com__Instance * this, uint64 value)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

return (struct __ecereNameSpace__ecere__com__IteratorPointer *)((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(value)));
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Add(struct __ecereNameSpace__ecere__com__AVLNode * this, struct __ecereNameSpace__ecere__com__Class * Tclass, struct __ecereNameSpace__ecere__com__AVLNode * node, int addSide)
{
int t;
int (* onCompare)(void *, void *, void *);
unsigned int offset = 0;
unsigned int reference = 0;
unsigned char * a;

if(!Tclass)
Tclass = __ecereClass_uint64;
t = Tclass->type;
onCompare = (void *)Tclass->_vTbl[__ecereVMethodID_class_OnCompare];
if((t == 1000 && !Tclass->byValueSystemClass) || t == 2 || t == 4 || t == 3 || t == 1)
{
reference = 1;
offset = __ENDIAN_PAD((t == 1) ? sizeof(void *) : Tclass->typeSize);
}
a = reference ? ((unsigned char *)&node->key + offset) : ((unsigned char *)(uintptr_t)(uint64)(node->key));
while(1)
{
int result;

if(addSide)
result = addSide;
else
{
unsigned char * b = reference ? ((unsigned char *)&this->key + offset) : (unsigned char *)(uintptr_t)(uint64)(this->key);

result = onCompare(Tclass, a, b);
}
if(!result)
return 0;
else if(result > 0)
{
if(this->right)
this = this->right;
else
{
this->right = node;
break;
}
}
else
{
if(this->left)
this = this->left;
else
{
this->left = node;
break;
}
}
}
node->parent = this;
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
return 1;
}

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLNode_FindEx(struct __ecereNameSpace__ecere__com__AVLNode * this, struct __ecereNameSpace__ecere__com__Class * Tclass, const uint64 key, struct __ecereNameSpace__ecere__com__AVLNode ** addTo, int * addSide)
{
unsigned char * a;
unsigned int reference = 0;
unsigned int offset = 0;
int t = Tclass->type;
int (* onCompare)(void *, void *, void *) = (void *)Tclass->_vTbl[__ecereVMethodID_class_OnCompare];
unsigned int isInt64 = 0, isDouble = 0;
struct __ecereNameSpace__ecere__com__AVLNode * to = (((void *)0));
int side = (int)0;

if(onCompare == (void *)__ecereClass_int64->_vTbl[__ecereVMethodID_class_OnCompare] || (Tclass->type == 3 && Tclass->typeSize == sizeof(long long) && !strcmp(Tclass->name, "Id")) || (Tclass->type == 2 && Tclass->typeSize == sizeof(long long)))
isInt64 = 1;
else if(onCompare == (void *)__ecereClass_double->_vTbl[__ecereVMethodID_class_OnCompare])
isDouble = 1;
reference = (t == 1000 && !Tclass->byValueSystemClass) || t == 2 || t == 4 || t == 3;
offset = __ENDIAN_PAD(Tclass->typeSize);
a = reference ? ((unsigned char *)&key) + offset : (unsigned char *)(uintptr_t)key;
if(t == 1)
{
reference = 1;
offset = __ENDIAN_PAD(sizeof(void *));
}
if(Tclass == __ecereClass_int)
{
int ia = *(int *)a;

if(reference)
{
while(this)
{
unsigned char * b = (((unsigned char *)&this->key) + __ENDIAN_PAD(sizeof(int)));
int ib = *(int *)b;
int result = ia > ib ? 1 : ia < ib ? -1 : 0;

if(result)
{
struct __ecereNameSpace__ecere__com__AVLNode * node = result < 0 ? this->left : this->right;

if(!node)
to = this, side = (int)result;
this = node;
}
else
break;
}
}
else
{
while(this)
{
int ib = *(int *)((unsigned char *)(uintptr_t)(uint64)(this->key));
int result = ia > ib ? 1 : ia < ib ? -1 : 0;

if(result)
{
struct __ecereNameSpace__ecere__com__AVLNode * node = result < 0 ? this->left : this->right;

if(!node)
to = this, side = (int)result;
this = node;
}
else
break;
}
}
}
else if(Tclass == __ecereClass_uint)
{
unsigned int ia = *(unsigned int *)a;

if(reference)
{
while(this)
{
unsigned char * b = (((unsigned char *)&this->key) + __ENDIAN_PAD(sizeof(unsigned int)));
unsigned int ib = *(unsigned int *)b;
int result = ia > ib ? 1 : ia < ib ? -1 : 0;

if(result)
{
struct __ecereNameSpace__ecere__com__AVLNode * node = result < 0 ? this->left : this->right;

if(!node)
to = this, side = (int)result;
this = node;
}
else
break;
}
}
else
{
while(this)
{
unsigned int ib = *(unsigned int *)((unsigned char *)(uintptr_t)(uint64)(this->key));
int result = ia > ib ? 1 : ia < ib ? -1 : 0;

if(result)
{
struct __ecereNameSpace__ecere__com__AVLNode * node = result < 0 ? this->left : this->right;

if(!node)
to = this, side = (int)result;
this = node;
}
else
break;
}
}
}
else
{
int result;
long long a64;
double aDouble;

if(isInt64)
a64 = *(long long *)a;
else if(isDouble)
aDouble = *(double *)a;
if(reference)
{
if(isInt64)
{
while(this)
{
long long b64 = this->key;

if(a64 > b64)
result = 1;
else if(a64 < b64)
result = -1;
else
result = 0;
if(result)
{
struct __ecereNameSpace__ecere__com__AVLNode * node = result < 0 ? this->left : this->right;

if(!node)
to = this, side = (int)result;
this = node;
}
else
break;
}
}
else if(isDouble)
{
while(this)
{
const unsigned char * b = (unsigned char *)&this->key;
double bDouble = *(double *)(unsigned char *)b;

if(aDouble > bDouble)
result = 1;
else if(aDouble < bDouble)
result = -1;
else
result = 0;
if(result)
{
struct __ecereNameSpace__ecere__com__AVLNode * node = result < 0 ? this->left : this->right;

if(!node)
to = this, side = (int)result;
this = node;
}
else
break;
}
}
else
{
while(this)
{
const unsigned char * b = ((unsigned char *)&this->key) + offset;

result = onCompare(Tclass, a, (unsigned char *)b);
if(result)
{
struct __ecereNameSpace__ecere__com__AVLNode * node = result < 0 ? this->left : this->right;

if(!node)
to = this, side = (int)result;
this = node;
}
else
break;
}
}
}
else
{
if(isInt64)
{
while(this)
{
long long b64 = *(long long *)(uintptr_t)(uint64)(this->key);

if(a64 > b64)
result = 1;
else if(a64 < b64)
result = -1;
else
result = 0;
if(result)
{
struct __ecereNameSpace__ecere__com__AVLNode * node = result < 0 ? this->left : this->right;

if(!node)
to = this, side = (int)result;
this = node;
}
else
break;
}
}
else if(isDouble)
{
while(this)
{
double bDouble = *(double *)(uintptr_t)(uint64)(this->key);

if(aDouble > bDouble)
result = 1;
else if(aDouble < bDouble)
result = -1;
else
result = 0;
if(result)
{
struct __ecereNameSpace__ecere__com__AVLNode * node = result < 0 ? this->left : this->right;

if(!node)
to = this, side = (int)result;
this = node;
}
else
break;
}
}
else
{
while(this)
{
const unsigned char * b = (unsigned char *)(uintptr_t)(uint64)(this->key);

result = onCompare(Tclass, a, (unsigned char *)b);
if(result)
{
struct __ecereNameSpace__ecere__com__AVLNode * node = result < 0 ? this->left : this->right;

if(!node)
to = this, side = (int)result;
this = node;
}
else
break;
}
}
}
}
if(addTo)
*addTo = to;
if(addSide)
*addSide = side;
return this;
}

void __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_FreeKey(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__AVLNode * item)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].__anon1.__anon1.dataTypeClass->type == 1)
{
struct __ecereNameSpace__ecere__com__Class * Tclass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].__anon1.__anon1.dataTypeClass;

((void (*)(void *, void *))(void *)Tclass->_vTbl[__ecereVMethodID_class_OnFree])(Tclass, (((unsigned char *)&item->key) + __ENDIAN_PAD(sizeof(void *))));
}
else
(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4].__anon1.__anon1.dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance * )(char * )this)->_class->templateArgs[4].__anon1.__anon1.dataTypeClass, ((void * )((uintptr_t)(item->key)))), item->key = 0);
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

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Add(struct __ecereNameSpace__ecere__com__Instance * this, uint64 node)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

if(!((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root))))
__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root = ((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(node)));
else
{
struct __ecereNameSpace__ecere__com__Class * btClass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].__anon1.__anon1.dataTypeClass;
struct __ecereNameSpace__ecere__com__Class * Tclass = btClass->templateArgs[0].__anon1.__anon1.dataTypeClass;

if(!Tclass)
{
Tclass = btClass->templateArgs[0].__anon1.__anon1.dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application, btClass->templateArgs[0].__anon1.__anon1.dataTypeString);
}
if(__ecereMethod___ecereNameSpace__ecere__com__AVLNode_Add(((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root))), Tclass, ((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(node))), (int)0))
__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root = __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Rebalance(((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(node))));
else
return (((void *)0));
}
__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->count++;
return (struct __ecereNameSpace__ecere__com__IteratorPointer *)((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(node)));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_AddEx(struct __ecereNameSpace__ecere__com__Instance * this, uint64 node, uint64 addNode, int addSide)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

if(!((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root))))
__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root = ((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(node)));
else
{
struct __ecereNameSpace__ecere__com__Class * Tclass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].__anon1.__anon1.dataTypeClass->templateArgs[0].__anon1.__anon1.dataTypeClass;

if(!Tclass)
{
Tclass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].__anon1.__anon1.dataTypeClass->templateArgs[0].__anon1.__anon1.dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application, ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].__anon1.__anon1.dataTypeClass->templateArgs[0].__anon1.__anon1.dataTypeString);
}
if(__ecereMethod___ecereNameSpace__ecere__com__AVLNode_Add(((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(addNode))), Tclass, ((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(node))), addSide))
__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root = __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Rebalance(((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(node))));
else
return (((void *)0));
}
__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->count++;
return (struct __ecereNameSpace__ecere__com__IteratorPointer *)((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(node)));
}

void __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Delete(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__IteratorPointer * _item)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);
struct __ecereNameSpace__ecere__com__AVLNode * item = (struct __ecereNameSpace__ecere__com__AVLNode *)_item;

(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove]);
__internal_VirtualMethod ? __internal_VirtualMethod(this, _item) : (void)1;
}));
__ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_FreeKey(this, ((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(item))));
(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].__anon1.__anon1.dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance * )(char * )this)->_class->templateArgs[3].__anon1.__anon1.dataTypeClass, ((void * )((uintptr_t)(item)))), item = 0);
}

void __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Free(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);
struct __ecereNameSpace__ecere__com__AVLNode * item;

item = ((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root)));
while(item)
{
if(((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(item)))->left)
{
struct __ecereNameSpace__ecere__com__AVLNode * left = ((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(item)))->left;

((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(item)))->left = (((void *)0));
item = ((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(left)));
}
else if(((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(item)))->right)
{
struct __ecereNameSpace__ecere__com__AVLNode * right = ((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(item)))->right;

((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(item)))->right = (((void *)0));
item = ((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(right)));
}
else
{
struct __ecereNameSpace__ecere__com__AVLNode * parent = ((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(item)))->parent;

__ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_FreeKey(this, ((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(item))));
(((void (* )(void *  _class, void *  data))((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[3].__anon1.__anon1.dataTypeClass->_vTbl[__ecereVMethodID_class_OnFree])(((struct __ecereNameSpace__ecere__com__Instance * )(char * )this)->_class->templateArgs[3].__anon1.__anon1.dataTypeClass, ((void * )((uintptr_t)(item)))), item = 0);
item = ((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(parent)));
}
}
__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root = (((void *)0));
__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->count = 0;
}

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetAtPosition(struct __ecereNameSpace__ecere__com__Instance * this, const uint64 pos, unsigned int create, unsigned int * justAdded)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);
struct __ecereNameSpace__ecere__com__AVLNode * addNode = (((void *)0));
int addSide = 0;
struct __ecereNameSpace__ecere__com__AVLNode * node = __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root ? __ecereMethod___ecereNameSpace__ecere__com__AVLNode_FindEx(((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root))), ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4].__anon1.__anon1.dataTypeClass, pos, &addNode, &addSide) : (((void *)0));

if(!node && create)
{
struct __ecereNameSpace__ecere__com__Class * Tclass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4].__anon1.__anon1.dataTypeClass;
void (* onCopy)(void *, void *, void *) = Tclass->_vTbl[__ecereVMethodID_class_OnCopy];

if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4].__anon1.__anon1.dataTypeClass->type == 1)
{
unsigned int size = sizeof(struct __ecereNameSpace__ecere__com__AVLNode);

if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4].__anon1.__anon1.dataTypeClass->type == 1)
size += ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4].__anon1.__anon1.dataTypeClass->typeSize - sizeof node->key;
node = (struct __ecereNameSpace__ecere__com__AVLNode *)__ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (size));
}
else
{
node = __extension__ ({
struct __ecereNameSpace__ecere__com__AVLNode * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__AVLNode));

__ecereInstance1->key = pos, __ecereInstance1;
});
}
if((Tclass->type == 1000 && !Tclass->byValueSystemClass) || Tclass->type == 2 || Tclass->type == 4 || Tclass->type == 3)
memcpy((unsigned char *)&node->key + __ENDIAN_PAD(Tclass->typeSize), (unsigned char *)((char *)&pos + __ENDIAN_PAD(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4].__anon1.__anon1.dataTypeClass->typeSize)) + __ENDIAN_PAD(Tclass->typeSize), Tclass->typeSize);
else
onCopy(Tclass, (unsigned char *)&node->key + __ENDIAN_PAD(sizeof(void *)), (void *)(uintptr_t)pos);
__ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_AddEx(this, (uint64)(uintptr_t)node, (uint64)(uintptr_t)addNode, addSide);
if(justAdded)
*justAdded = 1;
}
return node;
}

void __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Free(struct __ecereNameSpace__ecere__com__AVLNode *  this);

void __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Free(struct __ecereNameSpace__ecere__com__AVLNode * this)
{
if(this->left)
__ecereMethod___ecereNameSpace__ecere__com__AVLNode_Free(this->left);
if(this->right)
__ecereMethod___ecereNameSpace__ecere__com__AVLNode_Free(this->right);
((this ? __extension__ ({
void * __ecerePtrToDelete = (this);

__ecereClass___ecereNameSpace__ecere__com__AVLNode->Destructor ? __ecereClass___ecereNameSpace__ecere__com__AVLNode->Destructor((void *)__ecerePtrToDelete) : 0, __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor ? __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), this = 0);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Check(struct __ecereNameSpace__ecere__com__AVLNode *  this, struct __ecereNameSpace__ecere__com__Class *  Tclass);

unsigned int __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Check(struct __ecereNameSpace__ecere__com__AVLNode * this, struct __ecereNameSpace__ecere__com__Class * Tclass)
{
unsigned int valid = 1;
unsigned int offset = 0;
unsigned int reference = 0;
unsigned char * b;
int (* onCompare)(void *, void *, void *);
int t;
int leftHeight = this->left ? __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_depthProp(this->left) + 1 : 0;
int rightHeight = this->right ? __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_depthProp(this->right) + 1 : 0;
int diffHeight = rightHeight - leftHeight;

if(!Tclass)
Tclass = __ecereClass_uint64;
t = Tclass->type;
onCompare = (void *)Tclass->_vTbl[__ecereVMethodID_class_OnCompare];
if((t == 1000 && !Tclass->byValueSystemClass) || t == 2 || t == 4 || t == 3 || t == 1)
{
reference = 1;
offset = __ENDIAN_PAD((t == 1) ? sizeof(void *) : Tclass->typeSize);
}
if(this->left)
{
if(this->left->parent != this)
{
printf("Parent not set properly at node %d\n", (int)(uint64)(this->left->key));
valid = 0;
}
valid *= __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Check(this->left, Tclass);
}
if(this->right)
{
if(this->right->parent != this)
{
printf("Parent not set properly at node %d\n", (int)(uint64)(this->right->key));
valid = 0;
}
valid *= __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Check(this->right, Tclass);
}
if(this->depth != __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_depthProp(this))
{
printf("Depth value at node %d (%d) doesn't match depth property (%d)\n", (int)(uint64)(this->key), this->depth, __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_depthProp(this));
valid = 0;
}
if(diffHeight < -1 || diffHeight > 1)
{
valid = 0;
printf("Height difference is %d at node %d\n", diffHeight, (int)(uint64)(this->key));
}
if(diffHeight != __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_balanceFactor(this))
{
valid = 0;
printf("Height difference %d doesn't match balance-factor of %d at node %d\n", diffHeight, __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_balanceFactor(this), (int)(uint64)(this->key));
}
b = reference ? ((unsigned char *)&this->key + offset) : ((unsigned char *)(uintptr_t)(uint64)(this->key));
if(this->left)
{
unsigned char * a = reference ? ((unsigned char *)&this->left->key + offset) : ((unsigned char *)(uintptr_t)(uint64)(this->left->key));

if(onCompare(Tclass, a, b) > 0)
{
valid = 0;
printf("Node %d is *smaller* than left subtree %d\n", (int)(uint64)(this->key), (int)(uint64)(this->left->key));
}
}
if(this->right)
{
unsigned char * a = reference ? ((unsigned char *)&this->right->key + offset) : ((unsigned char *)(uintptr_t)(uint64)(this->right->key));

if(onCompare(Tclass, a, b) < 0)
{
valid = 0;
printf("Node %d is *greater* than right subtree %d\n", (int)(uint64)(this->key), (int)(uint64)(this->right->key));
}
}
return valid;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Check(struct __ecereNameSpace__ecere__com__Instance * this)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__CustomAVLTree * __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree = (struct __ecereNameSpace__ecere__com__CustomAVLTree *)(this ? (((char *)this) + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance)) : 0);

return __ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root ? __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Check(((struct __ecereNameSpace__ecere__com__AVLNode *)((uintptr_t)(__ecerePointer___ecereNameSpace__ecere__com__CustomAVLTree->root))), ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[4].__anon1.__anon1.dataTypeClass) : 1;
}

void __ecereRegisterModule_CustomAVLTree(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument __simpleStruct0 =
{

.__anon1 = {

.__anon1 = {
.dataTypeString = "uint64"
}
}
};
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::AddSide", "int", 0, 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__AddSide = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "compare", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "left", -1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "right", 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::AVLNode", "ecere::com::IteratorPointer", sizeof(struct __ecereNameSpace__ecere__com__AVLNode), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__AVLNode = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Find", "thisclass Find(ecere::com::Class Tclass, const T key)", __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Find, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "__ecerePrivateData0", "byte[32]", 32, 1, 2);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "key", "T", 8, 8, 1);
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_prev = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "prev", "thisclass", 0, __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_prev, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__AVLNode_prev = __ecerePropM___ecereNameSpace__ecere__com__AVLNode_prev, __ecerePropM___ecereNameSpace__ecere__com__AVLNode_prev = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_next = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "next", "thisclass", 0, __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_next, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__AVLNode_next = __ecerePropM___ecereNameSpace__ecere__com__AVLNode_next, __ecerePropM___ecereNameSpace__ecere__com__AVLNode_next = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_minimum = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "minimum", "thisclass", 0, __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_minimum, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__AVLNode_minimum = __ecerePropM___ecereNameSpace__ecere__com__AVLNode_minimum, __ecerePropM___ecereNameSpace__ecere__com__AVLNode_minimum = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_maximum = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "maximum", "thisclass", 0, __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_maximum, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__AVLNode_maximum = __ecerePropM___ecereNameSpace__ecere__com__AVLNode_maximum, __ecerePropM___ecereNameSpace__ecere__com__AVLNode_maximum = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_count = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "count", "int", 0, __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_count, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__AVLNode_count = __ecerePropM___ecereNameSpace__ecere__com__AVLNode_count, __ecerePropM___ecereNameSpace__ecere__com__AVLNode_count = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_depthProp = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "depthProp", "int", 0, __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_depthProp, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__AVLNode_depthProp = __ecerePropM___ecereNameSpace__ecere__com__AVLNode_depthProp, __ecerePropM___ecereNameSpace__ecere__com__AVLNode_depthProp = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__AVLNode_balanceFactor = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "balanceFactor", "int", 0, __ecereProp___ecereNameSpace__ecere__com__AVLNode_Get_balanceFactor, 2);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp___ecereNameSpace__ecere__com__AVLNode_balanceFactor = __ecerePropM___ecereNameSpace__ecere__com__AVLNode_balanceFactor, __ecerePropM___ecereNameSpace__ecere__com__AVLNode_balanceFactor = (void *)0;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, (((void *)0)), (((void *)0)), 0, sizeof(void *) > 4 ? sizeof(void *) : 4, 2);
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "T", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::CustomAVLTree", "ecere::com::Container<BT, I = KT>", sizeof(struct __ecereNameSpace__ecere__com__CustomAVLTree), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetFirst", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetFirst, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetLast", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetLast, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetPrev", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetPrev, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetNext", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetNext, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetData", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "SetData", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_SetData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetAtPosition", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_GetAtPosition, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Add", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Add, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Remove", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Remove, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Find", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Find, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Free", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Free, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Delete", 0, __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Delete, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Check", "bool Check()", __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_Check, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "FreeKey", "void FreeKey(ecere::com::AVLNode<KT> item)", __ecereMethod___ecereNameSpace__ecere__com__CustomAVLTree_FreeKey, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "root", "BT", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "count", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "BT", 0, "ecere::com::AVLNode<KT>", (((void *)0)));
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "KT", 0, 0, &__simpleStruct0);
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
if(class)
class->fixed = (unsigned int)1;
}

