/* Code generated from eC source file: BuiltInContainer.ec */
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
extern int __ecereVMethodID_class_OnCompare;

extern int __ecereVMethodID_class_OnFree;

extern int __ecereVMethodID_class_OnGetString;

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

extern char *  strcat(char * , const char * );

struct __ecereNameSpace__ecere__com__Property;

extern void __ecereNameSpace__ecere__com__eInstance_Watch(void *  instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__BuiltInContainer___ecereNameSpace__ecere__com__Container, * __ecerePropM___ecereNameSpace__ecere__com__BuiltInContainer___ecereNameSpace__ecere__com__Container;

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__com__BuiltInContainer
{
void * _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
void * data;
int count;
struct __ecereNameSpace__ecere__com__Class * type;
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct));

extern void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

extern void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object);

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetFirst;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetLast;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetPrev;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetNext;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetData;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_SetData;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetAtPosition;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Insert;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Add;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Remove;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Move;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_RemoveAll;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Copy;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Find;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_FreeIterator;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetCount;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Free;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Delete;

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_GetFirst(struct __ecereNameSpace__ecere__com__BuiltInContainer * this)
{
return this->data;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_SetData(struct __ecereNameSpace__ecere__com__BuiltInContainer * this, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer, uint64 data)
{
return 0;
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_Insert(struct __ecereNameSpace__ecere__com__BuiltInContainer * this, struct __ecereNameSpace__ecere__com__IteratorPointer * after, uint64 value)
{
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_Add(struct __ecereNameSpace__ecere__com__BuiltInContainer * this, uint64 value)
{
return (((void *)0));
}

void __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_Remove(struct __ecereNameSpace__ecere__com__BuiltInContainer * this, struct __ecereNameSpace__ecere__com__IteratorPointer * it)
{
}

void __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_Move(struct __ecereNameSpace__ecere__com__BuiltInContainer * this, struct __ecereNameSpace__ecere__com__IteratorPointer * it, struct __ecereNameSpace__ecere__com__IteratorPointer * after)
{
}

void __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_Copy(struct __ecereNameSpace__ecere__com__BuiltInContainer * this, struct __ecereNameSpace__ecere__com__Instance * source)
{
}

int __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_GetCount(struct __ecereNameSpace__ecere__com__BuiltInContainer * this)
{
return this->count;
}

void __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_Delete(struct __ecereNameSpace__ecere__com__BuiltInContainer * this, struct __ecereNameSpace__ecere__com__IteratorPointer * it)
{
}

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__com__BuiltInContainer_Get___ecereNameSpace__ecere__com__Container(struct __ecereNameSpace__ecere__com__BuiltInContainer * this);

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__com__BuiltInContainer_Get___ecereNameSpace__ecere__com__Container(struct __ecereNameSpace__ecere__com__BuiltInContainer * this)
{
return __ecereProp___ecereNameSpace__ecere__com__BuiltInContainer_Get___ecereNameSpace__ecere__com__Container(this);
}

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

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, void *  function, int declMode);

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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IteratorPointer;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BuiltInContainer;

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_GetLast(struct __ecereNameSpace__ecere__com__BuiltInContainer * this)
{
return (struct __ecereNameSpace__ecere__com__IteratorPointer *)(this->data ? ((unsigned char *)this->data + (this->count * this->type->typeSize) - 1) : (((void *)0)));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_GetPrev(struct __ecereNameSpace__ecere__com__BuiltInContainer * this, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer)
{
return (struct __ecereNameSpace__ecere__com__IteratorPointer *)((pointer && (unsigned char *)pointer > (unsigned char *)this->data) ? ((unsigned char *)pointer - this->type->typeSize) : (((void *)0)));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_GetNext(struct __ecereNameSpace__ecere__com__BuiltInContainer * this, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer)
{
return (struct __ecereNameSpace__ecere__com__IteratorPointer *)((pointer && (unsigned char *)pointer < (unsigned char *)this->data + (this->count - 1) * this->type->typeSize) ? ((unsigned char *)pointer + this->type->typeSize) : (((void *)0)));
}

uint64 __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_GetData(struct __ecereNameSpace__ecere__com__BuiltInContainer * this, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer)
{
uint64 * item = (uint64 *)pointer;

return ((((this->type->type == 1) ? ((uint64)(uintptr_t)item) : ((this->type->typeSize == 1) ? *((unsigned char *)item) : ((this->type->typeSize == 2) ? *((unsigned short *)item) : ((this->type->typeSize == 4) ? *((unsigned int *)item) : *(item)))))));
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_GetAtPosition(struct __ecereNameSpace__ecere__com__BuiltInContainer * this, const uint64 pos, unsigned int create)
{
return this->data ? (struct __ecereNameSpace__ecere__com__IteratorPointer *)((unsigned char *)this->data + this->type->typeSize) : (((void *)0));
}

const char * __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__BuiltInContainer * this, char * tempString, void * fieldData, unsigned int * needClass)
{
if(this)
{
struct __ecereNameSpace__ecere__com__Class * Dclass = this->type;
char itemString[4096];
unsigned int first = 1;
unsigned char * data = this->data;
int i;

tempString[0] = '\0';
for(i = 0; i < this->count; i++)
{
const char * result;

itemString[0] = '\0';
result = ((const char * (*)(void *, void *, char *, void *, unsigned int *))(void *)Dclass->_vTbl[__ecereVMethodID_class_OnGetString])(Dclass, (this->type->type == 0 || this->type->type == 5) ? *(void **)data : data, itemString, (((void *)0)), (((void *)0)));
if(!first)
strcat(tempString, ", ");
strcat(tempString, result);
first = 0;
data += Dclass->typeSize;
}
}
else
tempString[0] = (char)0;
return tempString;
}

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

void __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_RemoveAll(struct __ecereNameSpace__ecere__com__BuiltInContainer * this)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i;

for(i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__BuiltInContainer *))__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetFirst])(this); i; i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__BuiltInContainer *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetNext])(this, i))
((void (*)(struct __ecereNameSpace__ecere__com__BuiltInContainer *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Remove])(this, i);
}

struct __ecereNameSpace__ecere__com__IteratorPointer * __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_Find(struct __ecereNameSpace__ecere__com__BuiltInContainer * this, uint64 value)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i;

for(i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__BuiltInContainer *))__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetFirst])(this); i; i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__BuiltInContainer *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetNext])(this, i))
{
uint64 data = ((uint64 (*)(struct __ecereNameSpace__ecere__com__BuiltInContainer *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetData])(this, i);
struct __ecereNameSpace__ecere__com__Class * Dclass = this->type;
int result = ((int (*)(void *, void *, void *))(void *)Dclass->_vTbl[__ecereVMethodID_class_OnCompare])(Dclass, ((Dclass->type == 1000 && !Dclass->byValueSystemClass) || Dclass->type == 2 || Dclass->type == 4 || Dclass->type == 3) ? &value : (void *)(uintptr_t)value, ((Dclass->type == 1000 && !Dclass->byValueSystemClass) || Dclass->type == 2 || Dclass->type == 4 || Dclass->type == 3) ? &data : (void *)(uintptr_t)data);

if(!result)
return i;
}
return (((void *)0));
}

void __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_Free(struct __ecereNameSpace__ecere__com__BuiltInContainer * this)
{
struct __ecereNameSpace__ecere__com__IteratorPointer * i;

for(i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__BuiltInContainer *))__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetFirst])(this); i; i = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__BuiltInContainer *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetNext])(this, i))
((void (*)(void *, void *))(void *)this->type->_vTbl[__ecereVMethodID_class_OnFree])(this->type, (void *)(uintptr_t)((uint64 (*)(struct __ecereNameSpace__ecere__com__BuiltInContainer *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetData])(this, i));
}

void __ecereUnregisterModule_BuiltInContainer(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

void __ecereRegisterModule_BuiltInContainer(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::IteratorPointer", 0, 0, 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__IteratorPointer = class;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::com::BuiltInContainer", 0, sizeof(struct __ecereNameSpace__ecere__com__BuiltInContainer), 0, (void *)0, (void *)0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetFirst", "ecere::com::IteratorPointer GetFirst()", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_GetFirst, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetLast", "ecere::com::IteratorPointer GetLast()", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_GetLast, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetPrev", "ecere::com::IteratorPointer GetPrev(ecere::com::IteratorPointer pointer)", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_GetPrev, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetNext", "ecere::com::IteratorPointer GetNext(ecere::com::IteratorPointer pointer)", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_GetNext, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetData", "uint64 GetData(ecere::com::IteratorPointer pointer)", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_GetData, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "SetData", "bool SetData(ecere::com::IteratorPointer pointer, uint64 data)", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_SetData, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetAtPosition", "ecere::com::IteratorPointer GetAtPosition(const uint64 pos, bool create)", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_GetAtPosition, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Insert", "ecere::com::IteratorPointer Insert(ecere::com::IteratorPointer after, uint64 value)", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_Insert, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Add", "ecere::com::IteratorPointer Add(uint64 value)", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_Add, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Remove", "void Remove(ecere::com::IteratorPointer it)", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_Remove, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Move", "void Move(ecere::com::IteratorPointer it, ecere::com::IteratorPointer after)", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_Move, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "RemoveAll", "void RemoveAll()", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_RemoveAll, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Copy", "void Copy(ecere::com::Container source)", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_Copy, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Find", "ecere::com::IteratorPointer Find(uint64 value)", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_Find, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "FreeIterator", "void FreeIterator(ecere::com::IteratorPointer it)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetCount", "int GetCount()", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_GetCount, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Free", "void Free()", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_Free, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Delete", "void Delete(ecere::com::IteratorPointer it)", __ecereMethod___ecereNameSpace__ecere__com__BuiltInContainer_Delete, 1);
__ecereProp___ecereNameSpace__ecere__com__BuiltInContainer___ecereNameSpace__ecere__com__Container = __ecereNameSpace__ecere__com__eClass_AddProperty(class, 0, "ecere::com::Container", 0, __ecereProp___ecereNameSpace__ecere__com__BuiltInContainer_Get___ecereNameSpace__ecere__com__Container, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_vTbl", "void *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_class", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_refCount", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "data", "void *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "count", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
}

