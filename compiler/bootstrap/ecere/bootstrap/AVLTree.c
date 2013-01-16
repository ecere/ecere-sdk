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
extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BTNode;

struct __ecereNameSpace__ecere__sys__BTNode;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, unsigned int a, unsigned int b);
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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__AVLTree;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__AVLNode;

struct __ecereNameSpace__ecere__com__AVLNode
{
struct __ecereNameSpace__ecere__com__AVLNode * parent;
struct __ecereNameSpace__ecere__com__AVLNode * left;
struct __ecereNameSpace__ecere__com__AVLNode * right;
int depth;
uint64 key;
} __attribute__ ((gcc_struct));

uint64 __ecereMethod___ecereNameSpace__ecere__com__AVLTree_GetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__AVLNode * node)
{
return node ? ((((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->type == 1) ? (uint64)(((unsigned char *)&node->key) + __ENDIAN_PAD(sizeof(void *))) : node->key) : (uint64)0;
}

extern void *  memcpy(void * , const void * , unsigned int size);

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Find;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

unsigned int __ecereMethod___ecereNameSpace__ecere__com__AVLTree_SetData(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__AVLNode * node, uint64 value)
{
if(!((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Find])(this, value))
{
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, node);
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->type == 1)
memcpy((void *)(((unsigned char *)&node->key) + __ENDIAN_PAD(sizeof(void *))), (void *)value, ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->structSize);
else
node->key = value;
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__ecereClass___ecereNameSpace__ecere__com__AVLTree->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(this, (uint64)node);
return 0x1;
}
return 0x0;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__CustomAVLTree;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IteratorPointer;

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLTree_Add(struct __ecereNameSpace__ecere__com__Instance * this, uint64 value)
{
void * __ecereTemp1;
struct __ecereNameSpace__ecere__com__AVLNode * node;

if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->type == 1)
{
node = (struct __ecereNameSpace__ecere__com__AVLNode *)__ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (sizeof(struct __ecereNameSpace__ecere__com__AVLNode) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->structSize - sizeof node->key));
memcpy((void *)(((unsigned char *)&node->key) + __ENDIAN_PAD(sizeof(void *))), (void *)value, ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass->structSize);
}
else
node = (struct __ecereNameSpace__ecere__com__AVLNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(24), ((struct __ecereNameSpace__ecere__com__AVLNode *)__ecereTemp1)->key = value, ((struct __ecereNameSpace__ecere__com__AVLNode *)__ecereTemp1));
if(!((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(this, (uint64)node))
((node ? (__ecereClass___ecereNameSpace__ecere__com__AVLNode->Destructor ? __ecereClass___ecereNameSpace__ecere__com__AVLNode->Destructor(node) : 0, __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor ? __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor(node) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(node)) : 0), node = 0);
return node;
}

void __ecereMethod___ecereNameSpace__ecere__com__AVLTree_Remove(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__AVLNode * node)
{
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(this, node);
((node ? (__ecereClass___ecereNameSpace__ecere__com__AVLNode->Destructor ? __ecereClass___ecereNameSpace__ecere__com__AVLNode->Destructor(node) : 0, __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor ? __ecereClass___ecereNameSpace__ecere__com__IteratorPointer->Destructor(node) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(node)) : 0), node = 0);
}

struct __ecereNameSpace__ecere__com__CustomAVLTree
{
struct __ecereNameSpace__ecere__com__AVLNode * root;
int count;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Find(struct __ecereNameSpace__ecere__com__AVLNode * this, struct __ecereNameSpace__ecere__com__Class * Tclass, uint64 key);

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLTree_Find(struct __ecereNameSpace__ecere__com__Instance * this, uint64 key)
{
struct __ecereNameSpace__ecere__com__AVLNode * root = ((struct __ecereNameSpace__ecere__com__AVLNode *)((struct __ecereNameSpace__ecere__com__CustomAVLTree *)(((char *)this + 12)))->root);

return root ? __ecereMethod___ecereNameSpace__ecere__com__AVLNode_Find(root, ((struct __ecereNameSpace__ecere__com__Instance *)(char *)this)->_class->templateArgs[5].dataTypeClass, key) : (((void *)0));
}

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLNode_FindAll(struct __ecereNameSpace__ecere__com__AVLNode * this, uint64 key);

struct __ecereNameSpace__ecere__com__AVLNode * __ecereMethod___ecereNameSpace__ecere__com__AVLTree_FindAll(struct __ecereNameSpace__ecere__com__Instance * this, uint64 key)
{
struct __ecereNameSpace__ecere__com__AVLNode * root = ((struct __ecereNameSpace__ecere__com__AVLNode *)((struct __ecereNameSpace__ecere__com__CustomAVLTree *)(((char *)this + 12)))->root);

return root ? __ecereMethod___ecereNameSpace__ecere__com__AVLNode_FindAll(root, key) : (((void *)0));
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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateParameter;

struct __ecereNameSpace__ecere__com__ClassTemplateParameter;

extern struct __ecereNameSpace__ecere__com__ClassTemplateParameter * __ecereNameSpace__ecere__com__eClass_AddTemplateParameter(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, int type, void *  info, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * defaultArg);

extern void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(struct __ecereNameSpace__ecere__com__Class * base);

void __ecereRegisterModule_AVLTree(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::AVLTree", "ecere::com::CustomAVLTree<BT = ecere::com::AVLNode<AT>, KT = AT, T = AT, D = AT>", 0, 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__AVLTree = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetData", 0, __ecereMethod___ecereNameSpace__ecere__com__AVLTree_GetData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "SetData", 0, __ecereMethod___ecereNameSpace__ecere__com__AVLTree_SetData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Add", 0, __ecereMethod___ecereNameSpace__ecere__com__AVLTree_Add, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Remove", 0, __ecereMethod___ecereNameSpace__ecere__com__AVLTree_Remove, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Find", 0, __ecereMethod___ecereNameSpace__ecere__com__AVLTree_Find, 1);
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(class, "AT", 0, 0, (((void *)0)));
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(class);
if(class)
class->fixed = (unsigned int)1;
}

void __ecereUnregisterModule_AVLTree(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

