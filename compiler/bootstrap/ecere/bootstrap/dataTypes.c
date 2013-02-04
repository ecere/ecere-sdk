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

extern int runtimePlatform;


















int __ecereVMethodID_class_OnGetString;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_int;

int __ecereVMethodID_class_OnFree;

int __ecereVMethodID_class_OnCopy;

int __ecereVMethodID_class_OnCompare;

int __ecereVMethodID_class_OnSaveEdit;

int __ecereVMethodID_class_OnEdit;

int __ecereVMethodID_class_OnDisplay;

int __ecereVMethodID_class_OnGetDataFromString;

static void __ecereNameSpace__ecere__com__UnusedFunction()
{
int a;

((char *  (*)(struct __ecereNameSpace__ecere__com__Class *, void *, char *  tempString, void *  fieldData, unsigned int *  needClass))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnGetString])(__ecereClass_int, &a, 0, 0, 0);
((void (*)(struct __ecereNameSpace__ecere__com__Class *, void *))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnFree])(__ecereClass_int, &a);
((void (*)(struct __ecereNameSpace__ecere__com__Class *, void *, void * newData))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnCopy])(__ecereClass_int, &a, (((void *)0)));
((int (*)(struct __ecereNameSpace__ecere__com__Class *, void *, void * object))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnCompare])(__ecereClass_int, &a, (((void *)0)));
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Class *, void *, struct __ecereNameSpace__ecere__com__Instance * window, void *  object))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnSaveEdit])(__ecereClass_int, &a, (((void *)0)), 0);
((struct __ecereNameSpace__ecere__com__Instance * (*)(struct __ecereNameSpace__ecere__com__Class *, void *, struct __ecereNameSpace__ecere__com__Instance * dataBox, struct __ecereNameSpace__ecere__com__Instance * obsolete, int x, int y, int w, int h, void *  userData))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnEdit])(__ecereClass_int, &a, (((void *)0)), (((void *)0)), 0, 0, 0, 0, 0);
((void (*)(struct __ecereNameSpace__ecere__com__Class *, void *, struct __ecereNameSpace__ecere__com__Instance * surface, int x, int y, int width, void *  fieldData, struct __ecereNameSpace__ecere__com__Instance * alignment, struct __ecereNameSpace__ecere__com__Instance * displayFlags))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnDisplay])(__ecereClass_int, &a, (((void *)0)), 0, 0, 0, 0, (((void *)0)), (((void *)0)));
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Class *, void *, char *  string))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnGetDataFromString])(__ecereClass_int, &a, (((void *)0)));
}

extern int __ecereVMethodID_class_OnGetString;

extern int __ecereVMethodID_class_OnGetDataFromString;

extern int __ecereVMethodID_class_OnCompare;

extern int __ecereVMethodID_class_OnSerialize;

extern int __ecereVMethodID_class_OnUnserialize;

extern int __ecereVMethodID_class_OnCopy;

void __ecereNameSpace__ecere__com__eSystem_Delete(void * memory);

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IOChannel;

int __ecereVMethodID_class_OnSerialize;

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * data)
{
((void (*)(struct __ecereNameSpace__ecere__com__Class *, void *, struct __ecereNameSpace__ecere__com__Instance * channel))class->_vTbl[__ecereVMethodID_class_OnSerialize])(class, data, this);
}

int __ecereVMethodID_class_OnUnserialize;

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * * data)
{
((void (*)(struct __ecereNameSpace__ecere__com__Class *, void *, struct __ecereNameSpace__ecere__com__Instance * channel))class->_vTbl[__ecereVMethodID_class_OnUnserialize])(class, data, this);
}

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Put(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * data)
{
((void (*)(struct __ecereNameSpace__ecere__com__Class *, void *, struct __ecereNameSpace__ecere__com__Instance * channel))class->_vTbl[__ecereVMethodID_class_OnSerialize])(class, data, this);
}

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Get(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * * data)
{
((void (*)(struct __ecereNameSpace__ecere__com__Class *, void *, struct __ecereNameSpace__ecere__com__Instance * channel))class->_vTbl[__ecereVMethodID_class_OnUnserialize])(class, data, this);
}

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_buffer, * __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_buffer;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_size, * __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_size;

struct __ecereNameSpace__ecere__com__SerialBuffer
{
unsigned char * _buffer;
unsigned int count;
unsigned int _size;
unsigned int pos;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SerialBuffer;

void __ecereMethod___ecereNameSpace__ecere__com__SerialBuffer_Free();

void __ecereDestructor___ecereNameSpace__ecere__com__SerialBuffer(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__SerialBuffer * __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer = (struct __ecereNameSpace__ecere__com__SerialBuffer *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__SerialBuffer->offset) : 0);

{
__ecereMethod___ecereNameSpace__ecere__com__SerialBuffer_Free(this);
}
}

extern void *  memcpy(void * , const void * , unsigned int size);

unsigned int __ecereMethod___ecereNameSpace__ecere__com__SerialBuffer_WriteData(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char * bytes, unsigned int numBytes)
{
struct __ecereNameSpace__ecere__com__SerialBuffer * __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer = (struct __ecereNameSpace__ecere__com__SerialBuffer *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__SerialBuffer->offset) : 0);

if(this != (((void *)0)))
{
if(__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->count + numBytes > __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_size)
{
__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_size = __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->count + numBytes;
__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_size += __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_size / 2;
__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_buffer = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_buffer, sizeof(unsigned char) * (__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_size));
}
memcpy(__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_buffer + __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->count, bytes, numBytes);
__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->count += numBytes;
return numBytes;
}
return 0;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__SerialBuffer_ReadData(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char * bytes, unsigned int numBytes)
{
struct __ecereNameSpace__ecere__com__SerialBuffer * __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer = (struct __ecereNameSpace__ecere__com__SerialBuffer *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__SerialBuffer->offset) : 0);

if(this != (((void *)0)))
{
unsigned int __simpleStruct0;
int read = (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->count - __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->pos, (numBytes < __simpleStruct0) ? numBytes : __simpleStruct0);

memcpy(bytes, __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_buffer + __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->pos, read);
__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->pos += read;
return read;
}
return 0;
}

void __ecereMethod___ecereNameSpace__ecere__com__SerialBuffer_Free(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__SerialBuffer * __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer = (struct __ecereNameSpace__ecere__com__SerialBuffer *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__SerialBuffer->offset) : 0);

if(this)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_buffer), __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_buffer = 0);
__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->count = 0;
__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_size = 0;
__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->pos = 0;
}
}

unsigned char *  __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Get_buffer(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__SerialBuffer * __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer = (struct __ecereNameSpace__ecere__com__SerialBuffer *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__SerialBuffer->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_buffer + __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->pos;
}

void __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Set_buffer(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char *  value)
{
struct __ecereNameSpace__ecere__com__SerialBuffer * __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer = (struct __ecereNameSpace__ecere__com__SerialBuffer *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__SerialBuffer->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->_buffer = value;
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_buffer), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_buffer);
}

unsigned int __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Get_size(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__SerialBuffer * __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer = (struct __ecereNameSpace__ecere__com__SerialBuffer *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__SerialBuffer->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->count - __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->pos;
}

void __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Set_size(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value)
{
struct __ecereNameSpace__ecere__com__SerialBuffer * __ecerePointer___ecereNameSpace__ecere__com__SerialBuffer = (struct __ecereNameSpace__ecere__com__SerialBuffer *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__SerialBuffer->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__com__SerialBuffer->count = value;
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_size), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_size);
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__EnumClassData;

struct __ecereNameSpace__ecere__com__EnumClassData
{
struct __ecereNameSpace__ecere__sys__OldList values;
int largest;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__NamedLink;

struct __ecereNameSpace__ecere__sys__NamedLink
{
struct __ecereNameSpace__ecere__sys__NamedLink * prev;
struct __ecereNameSpace__ecere__sys__NamedLink * next;
char *  name;
void *  data;
} __attribute__ ((gcc_struct));

extern char *  strcpy(char * , const char * );

extern int toupper(int);

char * __ecereNameSpace__ecere__com__Enum_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, int * data, char * tempString, void * fieldData, unsigned int * needClass)
{
struct __ecereNameSpace__ecere__com__EnumClassData * enumeration = (struct __ecereNameSpace__ecere__com__EnumClassData *)_class->data;
struct __ecereNameSpace__ecere__sys__NamedLink * item;

for(item = enumeration->values.first; item; item = item->next)
if((int)item->data == *data)
break;
if(item)
{
strcpy(tempString, item->name);
if(!needClass || !*needClass)
tempString[0] = (char)toupper(tempString[0]);
return tempString;
}
else
return (((void *)0));
}

extern int strcasecmp(const char * , const char * );

static unsigned int __ecereNameSpace__ecere__com__Integer_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, int *  data, char *  string);

static unsigned int __ecereNameSpace__ecere__com__Enum_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, int * data, char * string)
{
struct __ecereNameSpace__ecere__com__EnumClassData * enumeration = (struct __ecereNameSpace__ecere__com__EnumClassData *)_class->data;
struct __ecereNameSpace__ecere__sys__NamedLink * item;

for(item = enumeration->values.first; item; item = item->next)
{
if(item->name && !(strcasecmp)(item->name, string))
break;
}
if(item)
{
*data = (int)item->data;
return 0x1;
}
else
return __ecereNameSpace__ecere__com__Integer_OnGetDataFromString(_class, data, string);
return 0x0;
}

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

static void __ecereNameSpace__ecere__com__OnFree(struct __ecereNameSpace__ecere__com__Class * _class, void * data)
{
if(_class->templateClass)
_class = _class->templateClass;
if(_class->type == 0)
{
__ecereNameSpace__ecere__com__eInstance_DecRef(data);
}
else if(_class->type == 5 && data)
{
while(_class && _class->type == 5)
{
if(_class->Destructor)
_class->Destructor(data);
_class = _class->base;
}
(__ecereNameSpace__ecere__com__eSystem_Delete(data), data = 0);
}
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

static int __ecereNameSpace__ecere__com__DataMember_OnCompare(struct __ecereNameSpace__ecere__com__DataMember * parentMember, void * data1, void * data2)
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Instance * module = parentMember->_class->module;

for(member = parentMember->members.first; member; member = member->next)
{
int memberResult = 0;

if(member->type == 0)
{
struct __ecereNameSpace__ecere__com__Class * memberType = member->dataTypeClass;

if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, member->dataTypeString);
if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "int");
if(memberType->type == 1 || memberType->type == 0 || memberType->type == 5)
{
memberResult = memberType->_vTbl[__ecereVMethodID_class_OnCompare](memberType, (unsigned char *)data1 + member->offset, (unsigned char *)data2 + member->offset);
if(memberResult)
return memberResult;
}
else
{
struct __ecereNameSpace__ecere__com__DataValue value1, value2;

value1.i = *(int *)((unsigned char *)data1 + member->offset);
value2.i = *(int *)((unsigned char *)data2 + member->offset);
memberResult = memberType->_vTbl[__ecereVMethodID_class_OnCompare](memberType, &value1, &value2);
if(memberResult)
return memberResult;
}
}
else
{
memberResult = __ecereNameSpace__ecere__com__DataMember_OnCompare(member, (unsigned char *)data1 + member->offset, (unsigned char *)data2 + member->offset);
if(memberResult)
return memberResult;
}
}
return 0;
}

extern int strcmp(const char * , const char * );

static int __ecereNameSpace__ecere__com__OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, void * data1, void * data2)
{
struct __ecereNameSpace__ecere__com__Instance * module = _class->module;

if(_class->type == 0 || _class->type == 5 || _class->type == 1)
{
if(data1 && data2)
{
for(; _class && _class->type != 1000; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__DataMember * member;

if(_class->noExpansion)
{
if(data1 > data2)
return 1;
else if(data1 < data2)
return -1;
else
return 0;
}
for(member = _class->membersAndProperties.first; member; member = member->next)
{
int memberResult = 0;

if(member->isProperty || member->type == 0)
{
struct __ecereNameSpace__ecere__com__Class * memberType = member->dataTypeClass;

if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, member->dataTypeString);
if(memberType)
{
if(member->isProperty)
{
struct __ecereNameSpace__ecere__com__Property * prop = (struct __ecereNameSpace__ecere__com__Property *)member;

if(!prop->conversion && prop->Get && prop->Set)
{
if(memberType->type == 1 || memberType->type == 0 || memberType->type == 5)
{
if(!strcmp(memberType->dataTypeString, "char *"))
{
char * a = ((char * (*)())(void *)prop->Get)(data1);
char * b = ((char * (*)())(void *)prop->Get)(data2);

memberResult = memberType->_vTbl[__ecereVMethodID_class_OnCompare](memberType, a, b);
}
}
else
{
struct __ecereNameSpace__ecere__com__DataValue value1, value2;

if(!strcmp(memberType->dataTypeString, "float"))
{
value1.f = ((float (*)())(void *)prop->Get)(data1);
value2.f = ((float (*)())(void *)prop->Get)(data2);
}
else
{
value1.i = prop->Get(data1);
value2.i = prop->Get(data2);
}
memberResult = memberType->_vTbl[__ecereVMethodID_class_OnCompare](memberType, &value1, &value2);
}
}
}
else
{
if(memberType->type == 1 || memberType->type == 0 || memberType->type == 5)
{
if(memberType->type == 0 || memberType->type == 5)
{
memberResult = memberType->_vTbl[__ecereVMethodID_class_OnCompare](memberType, *(void **)((unsigned char *)data1 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset)), *(void **)((unsigned char *)data2 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset)));
}
else
{
memberResult = memberType->_vTbl[__ecereVMethodID_class_OnCompare](memberType, (unsigned char *)data1 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset), (unsigned char *)data2 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset));
}
}
else
{
struct __ecereNameSpace__ecere__com__DataValue value1, value2;

if(memberType->typeSize == 8)
{
value1.ui64 = *(uint64 *)((unsigned char *)data1 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset));
value2.ui64 = *(uint64 *)((unsigned char *)data2 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset));
}
else
{
value1.i = *(int *)((unsigned char *)data1 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset));
value2.i = *(int *)((unsigned char *)data2 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset));
}
memberResult = memberType->_vTbl[__ecereVMethodID_class_OnCompare](memberType, &value1, &value2);
}
}
}
else
{
}
}
else
{
memberResult = __ecereNameSpace__ecere__com__DataMember_OnCompare(member, (unsigned char *)data1 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset), (unsigned char *)data2 + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset));
}
if(memberResult)
return memberResult;
}
}
}
else if(!data1 && data2)
return 1;
else if(data1 && !data2)
return -1;
}
else if(_class->type == 3)
{
struct __ecereNameSpace__ecere__com__Class * dataType = __ecereNameSpace__ecere__com__eSystem_FindClass(module, _class->dataTypeString);

return dataType->_vTbl[__ecereVMethodID_class_OnCompare](dataType, data1, data2);
}
else
{
int result = 0;

if(data1 && data2)
{
if(*(void **)data1 > *(void **)data2)
result = 1;
else if(*(void **)data1 < *(void **)data2)
result = -1;
}
else if(!data1 && data2)
return 1;
else if(data1 && !data2)
return -1;
return result;
}
return 0;
}

extern char *  strchr(char * , int);

extern char *  strcat(char * , const char * );

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BitMember;

struct __ecereNameSpace__ecere__com__BitMember
{
struct __ecereNameSpace__ecere__com__BitMember * prev;
struct __ecereNameSpace__ecere__com__BitMember * next;
char *  name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int type;
int size;
int pos;
uint64 mask;
} __attribute__ ((gcc_struct));

extern int strlen(const char * );

static char * __ecereNameSpace__ecere__com__OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, void * data, char * tempString, void * fieldData, unsigned int * needClass)
{
struct __ecereNameSpace__ecere__com__Instance * module = _class->templateClass ? _class->templateClass->module : _class->module;

if(_class->type == 4)
{
return __ecereNameSpace__ecere__com__Enum_OnGetString(_class, data, tempString, fieldData, needClass);
}
else if(_class->type == 3)
{
struct __ecereNameSpace__ecere__com__Class * dataType = __ecereNameSpace__ecere__com__eSystem_FindClass(module, _class->dataTypeString);

return (char *)dataType->_vTbl[__ecereVMethodID_class_OnGetString](dataType, data, tempString, fieldData, needClass);
}
else
{
unsigned int atMember = 0x1;
unsigned int prev = 0x0;
struct __ecereNameSpace__ecere__com__Class * mainClass = _class;

_class = (((void *)0));
tempString[0] = '\0';
if(!data && (mainClass->type == 0 || mainClass->type == 5))
return tempString;
while(_class != mainClass)
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Class * lastClass = _class;

for(_class = mainClass; _class->base != lastClass && _class->base->type != 1000; _class = _class->base)
;
for(member = _class->membersAndProperties.first; member; member = member->next)
{
char memberString[1024];
struct __ecereNameSpace__ecere__com__Class * memberType = member->dataTypeClass;
char * name = member->name;

memberString[0] = (char)0;
if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, member->dataTypeString);
if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "int");
if(member->isProperty)
{
struct __ecereNameSpace__ecere__com__Property * prop = (struct __ecereNameSpace__ecere__com__Property *)member;

if(!prop->conversion && prop->Get && prop->Set && (!prop->IsSet || prop->IsSet(data)))
{
if(memberType->type != 1 && (memberType->type != 0 || !strcmp(memberType->dataTypeString, "char *")) && memberType->type != 2 && data)
{
struct __ecereNameSpace__ecere__com__DataValue value = 
{
(char)0
};

if(!strcmp(prop->dataTypeString, "float"))
{
value.f = ((float (*)())(void *)prop->Get)(data);
if(value.f)
{
unsigned int needClass = 0x1;
char * result = (char *)memberType->_vTbl[__ecereVMethodID_class_OnGetString](memberType, &value, memberString, (((void *)0)), &needClass);

if(result && result != memberString)
strcpy(memberString, result);
if(strchr(memberString, '.'))
strcat(memberString, "f");
}
}
else
{
value.i = prop->Get(data);
if(value.i || prop->IsSet)
{
unsigned int needClass = 0x1;
char * result = (char *)memberType->_vTbl[__ecereVMethodID_class_OnGetString](memberType, (memberType->type == 0) ? value.p : &value, memberString, (((void *)0)), &needClass);

if(result && result != memberString)
strcpy(memberString, result);
}
}
}
}
}
else
{
if(member->type == 0)
{
if(memberType->type == 1 || memberType->type == 0)
{
char internalMemberString[1024];
unsigned char * memberData = ((unsigned char *)data + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset));
int c;

for(c = 0; c < memberType->structSize; c++)
if(memberData[c])
break;
if(c < memberType->structSize)
{
unsigned int needClass = 0x1;
char * result;

if(memberType->type == 0)
result = (char *)memberType->_vTbl[__ecereVMethodID_class_OnGetString](memberType, *(struct __ecereNameSpace__ecere__com__Instance **)memberData, internalMemberString, (((void *)0)), &needClass);
else
result = (char *)memberType->_vTbl[__ecereVMethodID_class_OnGetString](memberType, memberData, internalMemberString, (((void *)0)), &needClass);
if(needClass)
{
strcat(memberString, "{ ");
if(result)
strcat(memberString, result);
strcat(memberString, " }");
}
else if(result)
strcpy(memberString, result);
}
}
else
{
struct __ecereNameSpace__ecere__com__DataValue value = 
{
(char)0
};

if(_class->type == 2)
{
struct __ecereNameSpace__ecere__com__BitMember * bitMember = (struct __ecereNameSpace__ecere__com__BitMember *)member;

value.ui64 = ((*(unsigned int *)data & bitMember->mask) >> bitMember->pos);
if(value.ui64)
{
unsigned int needClass = 0x1;
char internalMemberString[1024];
char * result = (char *)memberType->_vTbl[__ecereVMethodID_class_OnGetString](memberType, &value, internalMemberString, (((void *)0)), &needClass);

if(needClass && memberType->type != 1000 && memberType->type != 4 && memberType->type != 3)
{
strcat(memberString, " { ");
if(result)
strcat(memberString, result);
strcat(memberString, " }");
}
else if(result)
strcpy(memberString, result);
}
}
else if(!memberType->noExpansion)
{
if(memberType->typeSize <= 4)
{
value.i = *(int *)((unsigned char *)data + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset));
if(value.i)
{
unsigned int needClass = 0x1;
char * result = (char *)memberType->_vTbl[__ecereVMethodID_class_OnGetString](memberType, &value, memberString, (((void *)0)), &needClass);

if(result && memberString != result)
strcpy(memberString, result);
}
}
else
{
unsigned int needClass = 0x1;
char * result = (char *)memberType->_vTbl[__ecereVMethodID_class_OnGetString](memberType, ((unsigned char *)data + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset)), memberString, (((void *)0)), &needClass);

if(result && memberString != result)
strcpy(memberString, result);
}
}
}
}
}
if(memberString[0])
{
if(prev)
strcat(tempString, ", ");
if(!atMember || !strcmp(memberType->name, "bool"))
{
strcat(tempString, name);
strcat(tempString, " = ");
}
if(!strcmp(memberType->name, "char *"))
{
int len = strlen(tempString);
int c;

strcat(tempString, "\"");
len++;
for(c = 0; memberString[c]; c++)
{
if(memberString[c] == '\"')
{
strcat(tempString, "\\\"");
len += 2;
}
else if(memberString[c] == '\\')
{
strcat(tempString, "\\\\");
len += 2;
}
else
{
tempString[len++] = memberString[c];
tempString[len] = (char)0;
}
}
strcat(tempString, "\"");
}
else
strcat(tempString, memberString);
atMember = 0x1;
prev = 0x1;
}
else if(member && (!member->isProperty || !((struct __ecereNameSpace__ecere__com__Property *)member)->conversion))
atMember = 0x0;
}
}
}
return tempString;
}

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

extern void memset(void *  area, unsigned char value, unsigned int count);

extern char *  __ecereNameSpace__ecere__sys__TrimRSpaces(char *  string, char *  output);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, unsigned int *  offset, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern void __ecereNameSpace__ecere__com__eClass_FindNextMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class **  curClass, struct __ecereNameSpace__ecere__com__DataMember **  curMember, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

static unsigned int __ecereNameSpace__ecere__com__OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, void ** data, char * string)
{
unsigned int result;
struct __ecereNameSpace__ecere__com__Instance * module = _class->module;

if(_class->type == 4)
result = __ecereNameSpace__ecere__com__Enum_OnGetDataFromString(_class, (int *)data, string);
else if(_class->type == 3)
{
struct __ecereNameSpace__ecere__com__Class * dataType = __ecereNameSpace__ecere__com__eSystem_FindClass(module, _class->dataTypeString);

return (unsigned int)dataType->_vTbl[__ecereVMethodID_class_OnGetDataFromString](dataType, data, string);
}
else if(!string[0] && _class->type == 0)
{
*data = (((void *)0));
return 0x1;
}
else
{
int c;
char memberName[1024];
char memberString[10240];
int count = 0;
unsigned int quoted = 0x0;
int brackets = 0;
char ch;
unsigned int escape = 0x0;
unsigned int gotChar;
unsigned int memberOffset;
struct __ecereNameSpace__ecere__com__Class * curClass = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * curMember = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * subMemberStack[256];
int subMemberStackPos = 0;

result = 0x1;
if(_class->type == 5 || _class->type == 0)
{
data = *data = __ecereNameSpace__ecere__com__eInstance_New(_class);
if(_class->type == 0)
((struct __ecereNameSpace__ecere__com__Instance *)(char *)((struct __ecereNameSpace__ecere__com__Instance *)data))->_refCount++;
}
else if(_class->type == 1)
memset(data, (unsigned char)0, _class->structSize);
memberName[0] = '\0';
for(c = 0; string[c] && count < sizeof memberString; )
{
unsigned int found = 0x0;
struct __ecereNameSpace__ecere__com__DataMember * thisMember = (((void *)0));

brackets = 0;
gotChar = 0x0;
for(; (ch = string[c]) && count < sizeof memberString; c++)
{
if(ch == '\"' && !escape)
{
quoted ^= 0x1;
}
else if(quoted)
{
if(!escape && ch == '\\')
{
escape = 0x1;
}
else
{
memberString[count++] = ch;
escape = 0x0;
}
}
else if(ch == ' ')
{
if(gotChar)
memberString[count++] = ch;
}
else if(ch == ',')
{
if(brackets)
{
memberString[count++] = ch;
}
else
{
c++;
break;
}
}
else if(ch == '{')
{
if(gotChar && !brackets)
{
count = 0;
gotChar = 0x0;
}
if(brackets)
{
memberString[count++] = ch;
gotChar = 0x1;
}
brackets++;
}
else if(ch == '}')
{
brackets--;
if(brackets)
{
gotChar = 0x1;
memberString[count++] = ch;
}
}
else if(ch == '=')
{
if(brackets)
{
memberString[count++] = ch;
}
else
{
memberString[count] = '\0';
__ecereNameSpace__ecere__sys__TrimRSpaces(memberString, memberName);
count = 0;
gotChar = 0x0;
}
}
else
{
memberString[count++] = ch;
gotChar = 0x1;
}
}
memberString[count] = '\0';
__ecereNameSpace__ecere__sys__TrimRSpaces(memberString, memberString);
if(memberName[0])
{
struct __ecereNameSpace__ecere__com__DataMember * _subMemberStack[256];
int _subMemberStackPos = 0;

thisMember = __ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(_class, memberName, &memberOffset, _class->module, _subMemberStack, &_subMemberStackPos);
if(!thisMember)
thisMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(_class, memberName, _class->module);
if(thisMember)
{
if(thisMember->memberAccess == 1)
{
curMember = thisMember;
curClass = thisMember->_class;
memcpy(subMemberStack, _subMemberStack, sizeof(int) * _subMemberStackPos);
subMemberStackPos = _subMemberStackPos;
}
found = 0x1;
}
}
else
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(_class, &curClass, &curMember, subMemberStack, &subMemberStackPos);
thisMember = curMember;
if(thisMember)
{
found = 0x1;
__ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(_class, thisMember->name, &memberOffset, _class->module, (((void *)0)), (((void *)0)));
}
}
if(found)
{
struct __ecereNameSpace__ecere__com__Class * memberType = thisMember->dataTypeClass;

if(!memberType)
memberType = thisMember->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, thisMember->dataTypeString);
if(!memberType)
memberType = thisMember->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "int");
if(memberType->type == 1)
{
if(thisMember)
{
if(!memberType->_vTbl[__ecereVMethodID_class_OnGetDataFromString](memberType, (unsigned char *)data + (((thisMember->_class->type == 0) ? thisMember->_class->offset : 0) + memberOffset), memberString))
result = 0x0;
}
}
else
{
struct __ecereNameSpace__ecere__com__DataValue value = 
{
(char)0
};

if(memberType->_vTbl[__ecereVMethodID_class_OnGetDataFromString] == _class->_vTbl[__ecereVMethodID_class_OnGetDataFromString])
{
if(!__ecereNameSpace__ecere__com__OnGetDataFromString(memberType, &value, memberString))
result = 0x0;
}
else if(!memberType->_vTbl[__ecereVMethodID_class_OnGetDataFromString](memberType, &value, memberString))
result = 0x0;
if(thisMember && !thisMember->isProperty)
{
if(_class->type == 2)
{
struct __ecereNameSpace__ecere__com__BitMember * bitMember = (struct __ecereNameSpace__ecere__com__BitMember *)thisMember;

*(unsigned int *)data = (unsigned int)(((*(unsigned int *)data & ~bitMember->mask)) | ((value.ui64 << bitMember->pos) & bitMember->mask));
}
else
*(int *)((unsigned char *)data + (((thisMember->_class->type == 0) ? thisMember->_class->offset : 0) + thisMember->offset)) = value.i;
}
else if(thisMember->isProperty && ((struct __ecereNameSpace__ecere__com__Property *)thisMember)->Set)
((struct __ecereNameSpace__ecere__com__Property *)thisMember)->Set(data, value.i);
}
}
else
result = 0x0;
count = 0;
memberName[0] = '\0';
}
}
return result;
}

static void __ecereNameSpace__ecere__com__OnCopy(struct __ecereNameSpace__ecere__com__Class * _class, void ** data, void * newData)
{
if(_class->type == 3 || _class->type == 2 || _class->type == 4)
{
struct __ecereNameSpace__ecere__com__Class * dataType = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, _class->dataTypeString);

if(dataType)
dataType->_vTbl[__ecereVMethodID_class_OnCopy](dataType, data, newData);
}
else if(_class->type != 1 && _class->type != 1000)
{
*data = newData;
}
else if(newData)
memcpy(data, newData, _class->typeSize);
else
memset(data, (unsigned char)0, _class->typeSize);
}

static int __ecereNameSpace__ecere__com__DataMember_OnSerialize(struct __ecereNameSpace__ecere__com__DataMember * parentMember, void * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Instance * module = parentMember->_class->module;

for(member = parentMember->members.first; member; member = member->next)
{
if(member->type == 0)
{
struct __ecereNameSpace__ecere__com__Class * memberType = member->dataTypeClass;

if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, member->dataTypeString);
if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "int");
if(memberType->type == 1 || memberType->type == 0 || memberType->type == 5)
{
memberType->_vTbl[__ecereVMethodID_class_OnSerialize](memberType, (unsigned char *)data + member->offset, channel);
}
else
{
struct __ecereNameSpace__ecere__com__DataValue value;

value.i = *(int *)((unsigned char *)data + member->offset);
memberType->_vTbl[__ecereVMethodID_class_OnSerialize](memberType, &value);
}
}
else
{
__ecereNameSpace__ecere__com__DataMember_OnSerialize(member, (unsigned char *)data + member->offset, channel);
}
}
return 0;
}

static void __ecereNameSpace__ecere__com__OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, void * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
struct __ecereNameSpace__ecere__com__Instance * module = _class->module;

if(_class->type == 3 || _class->type == 2 || _class->type == 4)
{
struct __ecereNameSpace__ecere__com__Class * dataType = __ecereNameSpace__ecere__com__eSystem_FindClass(module, _class->dataTypeString);

if(dataType)
dataType->_vTbl[__ecereVMethodID_class_OnSerialize](dataType, data, channel);
}
else if(_class->type == 0 || _class->type == 5 || _class->type == 1)
{
{
struct __ecereNameSpace__ecere__com__Class * lastClass = (((void *)0));

while(lastClass != _class)
{
struct __ecereNameSpace__ecere__com__DataMember * member;

for(; _class && (!_class->base || _class->base->type != 1000) && _class != lastClass; _class = _class->base)
;
lastClass = _class;
for(member = _class->membersAndProperties.first; member; member = member->next)
{
if(member->isProperty || member->type == 0)
{
struct __ecereNameSpace__ecere__com__Class * memberType = member->dataTypeClass;

if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, member->dataTypeString);
if(memberType)
{
if(member->isProperty)
{
}
else
{
if(!strcmp(memberType->name, "String") || memberType->type == 0 || memberType->type == 5)
{
memberType->_vTbl[__ecereVMethodID_class_OnSerialize](memberType, data ? (*(void **)((unsigned char *)data + member->_class->offset + member->offset)) : (((void *)0)), channel);
}
else
memberType->_vTbl[__ecereVMethodID_class_OnSerialize](memberType, data ? (((unsigned char *)data + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset))) : (((void *)0)), channel);
}
}
else
{
}
}
else
{
__ecereNameSpace__ecere__com__DataMember_OnSerialize(member, data ? ((unsigned char *)data + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset)) : (((void *)0)), channel);
}
}
}
}
}
}

static int __ecereNameSpace__ecere__com__DataMember_OnUnserialize(struct __ecereNameSpace__ecere__com__DataMember * parentMember, void * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Instance * module = parentMember->_class->module;

for(member = parentMember->members.first; member; member = member->next)
{
if(member->type == 0)
{
struct __ecereNameSpace__ecere__com__Class * memberType = member->dataTypeClass;

if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, member->dataTypeString);
if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "int");
if(memberType->type == 1 || memberType->type == 0 || memberType->type == 5)
{
memberType->_vTbl[__ecereVMethodID_class_OnUnserialize](memberType, (unsigned char *)data + member->offset, channel);
}
else
{
struct __ecereNameSpace__ecere__com__DataValue value;

memberType->_vTbl[__ecereVMethodID_class_OnUnserialize](memberType, &value, channel);
*(int *)((unsigned char *)data + member->offset) = value.i;
}
}
else
{
__ecereNameSpace__ecere__com__DataMember_OnUnserialize(member, (unsigned char *)data + member->offset, channel);
}
}
return 0;
}

static void __ecereNameSpace__ecere__com__OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, void ** data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
struct __ecereNameSpace__ecere__com__Instance * module = _class->module;

if(_class->type == 3 || _class->type == 2 || _class->type == 4)
{
struct __ecereNameSpace__ecere__com__Class * dataType = __ecereNameSpace__ecere__com__eSystem_FindClass(module, _class->dataTypeString);

if(dataType)
dataType->_vTbl[__ecereVMethodID_class_OnUnserialize](dataType, data, channel);
}
else if(_class->type == 0 || _class->type == 5 || _class->type == 1)
{
if(data)
{
struct __ecereNameSpace__ecere__com__Class * lastClass = (((void *)0));

if(_class->type == 0 || _class->type == 5)
{
data = *data = __ecereNameSpace__ecere__com__eInstance_New(_class);
if(_class->type == 0)
((struct __ecereNameSpace__ecere__com__Instance *)(char *)((struct __ecereNameSpace__ecere__com__Instance *)data))->_refCount++;
}
else if(_class->type == 1)
memset(data, (unsigned char)0, _class->structSize);
while(lastClass != _class)
{
struct __ecereNameSpace__ecere__com__DataMember * member;

for(; _class && (!_class->base || _class->base->type != 1000) && _class != lastClass; _class = _class->base)
;
lastClass = _class;
for(member = _class->membersAndProperties.first; member; member = member->next)
{
if(member->isProperty || member->type == 0)
{
struct __ecereNameSpace__ecere__com__Class * memberType = member->dataTypeClass;

if(!memberType)
memberType = member->dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, member->dataTypeString);
if(memberType)
{
if(member->isProperty)
{
}
else
memberType->_vTbl[__ecereVMethodID_class_OnUnserialize](memberType, (unsigned char *)data + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset), channel);
}
else
{
}
}
else
{
__ecereNameSpace__ecere__com__DataMember_OnUnserialize(member, (unsigned char *)data + (((member->_class->type == 0) ? member->_class->offset : 0) + member->offset), channel);
}
}
}
}
}
}

static int __ecereNameSpace__ecere__com__Integer_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, int * data1, int * data2)
{
int result = 0;

if(!data1 && !data2)
result = 0;
else if(data1 && !data2)
result = 1;
else if(!data1 && data2)
result = -1;
else if(*data1 > *data2)
result = 1;
else if(*data1 < *data2)
result = -1;
return result;
}

extern int sprintf(char * , char * , ...);

char * __ecereNameSpace__ecere__com__Integer_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, int * data, char * string, void * fieldData, unsigned int * needClass)
{
sprintf(string, "%d", *data);
return string;
}

long int strtol(const char * nptr, char ** endptr, int base);

static unsigned int __ecereNameSpace__ecere__com__Integer_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, int * data, char * string)
{
char * end;
int result = strtol(string, &end, 0);

if(end > string)
{
*data = result;
return 0x1;
}
return 0x0;
}

static int __ecereNameSpace__ecere__com__UInteger_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, unsigned int * data1, unsigned int * data2)
{
int result = 0;

if(!data1 && !data2)
result = 0;
else if(data1 && !data2)
result = 1;
else if(!data1 && data2)
result = -1;
else if(*data1 > *data2)
result = 1;
else if(*data1 < *data2)
result = -1;
return result;
}

static char * __ecereNameSpace__ecere__com__UInteger_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, unsigned int * data, char * string, void * fieldData, unsigned int * needClass)
{
sprintf(string, "%u", *data);
return string;
}

extern unsigned long strtoul(const char *  nptr, char * *  endptr, int base);

static unsigned int __ecereNameSpace__ecere__com__UInteger_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, unsigned int * data, char * string)
{
char * end;
unsigned int result = strtoul(string, &end, 0);

if(end > string)
{
*data = result;
return 0x1;
}
return 0x0;
}

static int __ecereNameSpace__ecere__com__Byte_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, unsigned char * data1, unsigned char * data2)
{
int result = 0;

if(!data1 && !data2)
result = 0;
else if(data1 && !data2)
result = 1;
else if(!data1 && data2)
result = -1;
else if(*data1 > *data2)
result = 1;
else if(*data1 < *data2)
result = -1;
return result;
}

static char * __ecereNameSpace__ecere__com__Byte_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, unsigned char * data, char * string, void * fieldData, unsigned int * needClass)
{
sprintf(string, "%u", (int)*data);
return string;
}

static char * __ecereNameSpace__ecere__com__Char_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, char * data, char * string, void * fieldData, unsigned int * needClass)
{
if(needClass && *needClass)
{
char ch = *data;

if(ch == '\t')
strcpy(string, "'\t'");
else if(ch == '\n')
strcpy(string, "'\n'");
else if(ch == '\r')
strcpy(string, "'\r'");
else if(ch == '\a')
strcpy(string, "'\a'");
else if(ch == '\\')
strcpy(string, "'\\'");
else if(ch < (char)32 || ch >= (char)127)
sprintf(string, "'\o'", ch);
else
sprintf(string, "'%c'", ch);
}
else
sprintf(string, "%c", *data);
return string;
}

static unsigned int __ecereNameSpace__ecere__com__Byte_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, unsigned char * data, char * string)
{
char * end;
unsigned char result = (unsigned char)strtoul(string, &end, 0);

if(end > string)
{
*data = result;
return 0x1;
}
return 0x0;
}

static int __ecereNameSpace__ecere__com__Int64_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, long long * data1, long long * data2)
{
int result = 0;

if(!data1 && !data2)
result = 0;
else if(data1 && !data2)
result = 1;
else if(!data1 && data2)
result = -1;
else if(*data1 > *data2)
result = 1;
else if(*data1 < *data2)
result = -1;
return result;
}

static int __ecereNameSpace__ecere__com__UInt64_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, uint64 * data1, uint64 * data2)
{
int result = 0;

if(!data1 && !data2)
result = 0;
else if(data1 && !data2)
result = 1;
else if(!data1 && data2)
result = -1;
else if(*data1 > *data2)
result = 1;
else if(*data1 < *data2)
result = -1;
return result;
}

extern int __ecereNameSpace__ecere__com__GetRuntimePlatform(void);

static char * __ecereNameSpace__ecere__com__Int64_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, long long * data, char * string, void * fieldData, unsigned int * needClass)
{
sprintf(string, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "%I64d" : "%lld"), *data);
return string;
}

static char * __ecereNameSpace__ecere__com__UInt64_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, uint64 * data, char * string, void * fieldData, unsigned int * needClass)
{
sprintf(string, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "%I64u" : "%llu"), *data);
return string;
}

int __ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData;

void __ecereNameSpace__ecere__com__Byte_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, unsigned char * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned char *  data, unsigned int numBytes))channel->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData])(channel, data, 1);
}

int __ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData;

void __ecereNameSpace__ecere__com__Byte_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, unsigned char * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
if(((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned char *  data, unsigned int numBytes))channel->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData])(channel, data, 1) != 1)
*data = (unsigned char)0;
}

void __ecereNameSpace__ecere__com__Int_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, int * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[4];

(bytes)[0] = (unsigned char)(((*data) >> 24) & 0xFF);
(bytes)[1] = (unsigned char)(((*data) >> 16) & 0xFF);
(bytes)[2] = (unsigned char)(((*data) >> 8) & 0xFF);
(bytes)[3] = (unsigned char)((*data) & 0xFF);
;
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned char *  data, unsigned int numBytes))channel->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData])(channel, bytes, 4);
}

void __ecereNameSpace__ecere__com__Int_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, int * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[4];

if(((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned char *  data, unsigned int numBytes))channel->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData])(channel, bytes, 4) == 4)
*data = (unsigned int)(((bytes)[0] << (unsigned char)24) | ((bytes)[1] << (unsigned char)16) | ((bytes)[2] << (unsigned char)8) | (bytes)[3]);
else
*data = 0;
}

void __ecereNameSpace__ecere__com__Int64_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, long long * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[8];

(bytes)[0] = (unsigned char)(((*data) >> 56) & 0xFF);
(bytes)[1] = (unsigned char)(((*data) >> 48) & 0xFF);
(bytes)[2] = (unsigned char)(((*data) >> 40) & 0xFF);
(bytes)[3] = (unsigned char)(((*data) >> 32) & 0xFF);
(bytes)[4] = (unsigned char)(((*data) >> 24) & 0xFF);
(bytes)[5] = (unsigned char)(((*data) >> 16) & 0xFF);
(bytes)[6] = (unsigned char)(((*data) >> 8) & 0xFF);
(bytes)[7] = (unsigned char)((*data) & 0xFF);
;
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned char *  data, unsigned int numBytes))channel->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData])(channel, bytes, 8);
}

void __ecereNameSpace__ecere__com__Int64_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, long long * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[8];

if(((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned char *  data, unsigned int numBytes))channel->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData])(channel, bytes, 8) == 8)
*data = (((uint64)(bytes)[0] << 56) | ((uint64)(bytes)[1] << 48) | ((uint64)(bytes)[2] << 40) | ((uint64)(bytes)[3] << 32) | ((uint64)(bytes)[4] << 24) | ((bytes)[5] << (unsigned char)16) | ((bytes)[6] << (unsigned char)8) | (bytes)[7]);
else
*data = 0;
}

void __ecereNameSpace__ecere__com__Word_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, unsigned short * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[2];

(bytes)[0] = (unsigned char)(((*data) >> (unsigned short)8) & (unsigned short)0xFF);
(bytes)[1] = (unsigned char)(((*data)) & (unsigned short)0xFF);
;
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned char *  data, unsigned int numBytes))channel->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData])(channel, bytes, 2);
}

void __ecereNameSpace__ecere__com__Word_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, unsigned short * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[2];

if(((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned char *  data, unsigned int numBytes))channel->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData])(channel, bytes, 2) == 2)
*data = (unsigned short)(((bytes)[0] << (unsigned char)8) | (bytes)[1]);
else
*data = (unsigned short)0;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, char *  name, char *  baseName, int size, int sizeClass, unsigned int (* )(void * ), void (* )(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern char *  __ecereNameSpace__ecere__sys__CopyString(char *  string);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

static void __ecereNameSpace__ecere__com__RegisterClass_Integer(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "int", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);

integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete(integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("int");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(int);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Integer_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Integer_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Integer_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnUnserialize, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "int64", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
integerClass->structSize = 0;
integerClass->typeSize = sizeof(long long);
(__ecereNameSpace__ecere__com__eSystem_Delete(integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("int64");
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnUnserialize, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "uint", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete(integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("unsigned int");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(unsigned int);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnUnserialize, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "unsigned int", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete(integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("unsigned int");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(unsigned int);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnUnserialize, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "uint16", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete(integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("unsigned short");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(unsigned short);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Word_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Word_OnUnserialize, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "short", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete(integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("short");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(short);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Word_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Word_OnUnserialize, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "uint32", "uint", 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete(integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("unsigned int");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(unsigned int);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "uint64", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete(integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("uint64");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(uint64);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__UInt64_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnCompare, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "byte", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete(integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("unsigned char");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(unsigned char);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnUnserialize, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "char", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete(integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("char");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(char);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Char_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Byte_OnUnserialize, 1);
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "uintptr", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete(integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("uintptr_t");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(uintptr_t);
if(sizeof(uintptr_t) == 8)
{
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__UInt64_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__UInt64_OnCompare, 1);
}
else
{
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__UInteger_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnUnserialize, 1);
}
integerClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "intptr", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
integerClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete(integerClass->dataTypeString), integerClass->dataTypeString = 0);
integerClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("intptr_t");
integerClass->structSize = 0;
integerClass->typeSize = sizeof(intptr_t);
if(sizeof(intptr_t) == 8)
{
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Int64_OnCompare, 1);
}
else
{
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Integer_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Integer_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Integer_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(integerClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnUnserialize, 1);
}
}

static int __ecereNameSpace__ecere__com__Float_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, float * data1, float * data2)
{
int result = 0;

if(!data1 && !data2)
result = 0;
else if(data1 && !data2)
result = 1;
else if(!data1 && data2)
result = -1;
else if(*data1 > *data2)
result = 1;
else if(*data1 < *data2)
result = -1;
return result;
}

static char * __ecereNameSpace__ecere__com__Float_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, float * data, char * string, void * fieldData, unsigned int * needClass)
{
int c;
int last = 0;
int numDigits = 7, num = 1;
char format[10];

while(numDigits && (float)num < *data)
numDigits--, num *= 10;
sprintf(format, "%%.%df", numDigits);
sprintf(string, format, *data);
c = strlen(string) - 1;
for(; c >= 0; c--)
{
if(string[c] != '0')
last = ((last > c) ? last : c);
if(string[c] == '.')
{
if(last == c)
string[c] = (char)0;
else
string[last + 1] = (char)0;
break;
}
}
return string;
}

extern double strtod(char * , char * * );

static unsigned int __ecereNameSpace__ecere__com__Float_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, float * data, char * string)
{
char * end;
float result = (float)strtod(string, &end);

if(end > string)
{
*data = result;
return 0x1;
}
return 0x0;
}

static void __ecereNameSpace__ecere__com__Float_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, float * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[4];

(bytes)[0] = (unsigned char)(((*(unsigned int *)data) >> 24) & 0xFF);
(bytes)[1] = (unsigned char)(((*(unsigned int *)data) >> 16) & 0xFF);
(bytes)[2] = (unsigned char)(((*(unsigned int *)data) >> 8) & 0xFF);
(bytes)[3] = (unsigned char)((*(unsigned int *)data) & 0xFF);
;
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned char *  data, unsigned int numBytes))channel->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData])(channel, bytes, 4);
}

static void __ecereNameSpace__ecere__com__Float_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, float * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[4];

if(((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned char *  data, unsigned int numBytes))channel->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData])(channel, bytes, 4) == 4)
*(unsigned int *)data = (unsigned int)(((bytes)[0] << (unsigned char)24) | ((bytes)[1] << (unsigned char)16) | ((bytes)[2] << (unsigned char)8) | (bytes)[3]);
else
*data = (float)0;
}

static void __ecereNameSpace__ecere__com__RegisterClass_Float(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * floatClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "float", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);

floatClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete(floatClass->dataTypeString), floatClass->dataTypeString = 0);
floatClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("float");
floatClass->structSize = 0;
floatClass->typeSize = sizeof(float);
__ecereNameSpace__ecere__com__eClass_AddMethod(floatClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Float_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(floatClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Float_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(floatClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Float_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(floatClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Float_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(floatClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Float_OnUnserialize, 1);
}

static int __ecereNameSpace__ecere__com__Double_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, double * data1, double * data2)
{
int result = 0;

if(!data1 && !data2)
result = 0;
else if(data1 && !data2)
result = 1;
else if(!data1 && data2)
result = -1;
else if(*data1 > *data2)
result = 1;
else if(*data1 < *data2)
result = -1;
return result;
}

static char * __ecereNameSpace__ecere__com__Double_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, double * data, char * string, void * fieldData, unsigned int * needClass)
{
int c;
int last = 0;

if(runtimePlatform == 1)
sprintf(string, "%.15g", *data);
else
sprintf(string, "%.13lf", *data);
c = strlen(string) - 1;
for(; c >= 0; c--)
{
if(string[c] != '0')
last = ((last > c) ? last : c);
if(string[c] == '.')
{
if(last == c)
string[c] = (char)0;
else
string[last + 1] = (char)0;
break;
}
}
return string;
}

static unsigned int __ecereNameSpace__ecere__com__Double_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, double * data, char * string)
{
char * end;
double result;

result = strtod(string, &end);
if(end > string)
{
*data = result;
return 0x1;
}
return 0x0;
}

static void __ecereNameSpace__ecere__com__Double_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, double * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[8];

(bytes)[0] = (unsigned char)(((*(uint64 *)data) >> 56) & 0xFF);
(bytes)[1] = (unsigned char)(((*(uint64 *)data) >> 48) & 0xFF);
(bytes)[2] = (unsigned char)(((*(uint64 *)data) >> 40) & 0xFF);
(bytes)[3] = (unsigned char)(((*(uint64 *)data) >> 32) & 0xFF);
(bytes)[4] = (unsigned char)(((*(uint64 *)data) >> 24) & 0xFF);
(bytes)[5] = (unsigned char)(((*(uint64 *)data) >> 16) & 0xFF);
(bytes)[6] = (unsigned char)(((*(uint64 *)data) >> 8) & 0xFF);
(bytes)[7] = (unsigned char)((*(uint64 *)data) & 0xFF);
;
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned char *  data, unsigned int numBytes))channel->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData])(channel, bytes, 8);
}

static void __ecereNameSpace__ecere__com__Double_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, double * data, struct __ecereNameSpace__ecere__com__Instance * channel)
{
unsigned char bytes[8];

if(((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned char *  data, unsigned int numBytes))channel->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData])(channel, bytes, 8) == 8)
*(uint64 *)data = (((uint64)(bytes)[0] << 56) | ((uint64)(bytes)[1] << 48) | ((uint64)(bytes)[2] << 40) | ((uint64)(bytes)[3] << 32) | ((uint64)(bytes)[4] << 24) | ((bytes)[5] << (unsigned char)16) | ((bytes)[6] << (unsigned char)8) | (bytes)[7]);
else
*data = (double)0;
}

static void __ecereNameSpace__ecere__com__RegisterClass_Double(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * doubleClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "double", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);

doubleClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete(doubleClass->dataTypeString), doubleClass->dataTypeString = 0);
doubleClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("double");
doubleClass->structSize = 0;
doubleClass->typeSize = sizeof(double);
__ecereNameSpace__ecere__com__eClass_AddMethod(doubleClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__Double_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(doubleClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__Double_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(doubleClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__Double_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(doubleClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Double_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(doubleClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Double_OnUnserialize, 1);
}

struct __ecereNameSpace__ecere__com__StaticString
{
char string[1];
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__StaticString;

void __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnSerialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__StaticString * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
int len = this ? strlen(this->string) : 0;

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned char *  data, unsigned int numBytes))channel->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData])(channel, this ? this->string : "", len + 1);
}

void __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__StaticString * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
if(this)
{
int c;
unsigned int size;

for(c = 0; ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned char *  data, unsigned int numBytes))channel->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData])(channel, &(*(this)).string[c], 1) && (*(this)).string[c]; c++)
;
(*(this)).string[c++] = '\0';
}
}

int __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnCompare(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__StaticString * this, struct __ecereNameSpace__ecere__com__StaticString * string2)
{
int result = 0;

if(this && string2)
result = (strcasecmp)(this->string, string2->string);
else if(!this && string2)
result = -1;
else if(this && !string2)
result = 1;
return result;
}

char * __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__StaticString * this, char * tempString, void * fieldData, unsigned int * needClass)
{
return (char *)(this ? this->string : (((void *)0)));
}

void __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnFree(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__StaticString * this)
{
}

extern void *  __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

static void __ecereNameSpace__ecere__com__String_OnCopy(struct __ecereNameSpace__ecere__com__Class * _class, char ** data, char * newData)
{
if(newData)
{
int len = strlen(newData);

if(len)
{
*data = __ecereNameSpace__ecere__com__eSystem_New(len + 1);
memcpy(*data, newData, len + 1);
}
else
*data = (((void *)0));
}
else
*data = (((void *)0));
}

static unsigned int __ecereNameSpace__ecere__com__String_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * _class, char ** data, char * newData)
{
if(newData)
{
int len = strlen(newData);

if(len)
{
*data = __ecereNameSpace__ecere__com__eSystem_New(len + 1);
memcpy(*data, newData, len + 1);
}
else
*data = (((void *)0));
}
return 0x1;
}

int __ecereNameSpace__ecere__com__String_OnCompare(struct __ecereNameSpace__ecere__com__Class * _class, char * string1, char * string2)
{
int result = 0;

if(string1 && string2)
result = (strcasecmp)(string1, string2);
else if(!string1 && string2)
result = 1;
else if(string1 && !string2)
result = -1;
return result;
}

static char * __ecereNameSpace__ecere__com__String_OnGetString(struct __ecereNameSpace__ecere__com__Class * _class, char * string, char * tempString, void * fieldData, unsigned int * needClass)
{
return string;
}

static void __ecereNameSpace__ecere__com__String_OnFree(struct __ecereNameSpace__ecere__com__Class * _class, char * string)
{
if(string)
{
__ecereNameSpace__ecere__com__eSystem_Delete(string);
}
}

static void __ecereNameSpace__ecere__com__String_OnSerialize(struct __ecereNameSpace__ecere__com__Class * _class, char * string, struct __ecereNameSpace__ecere__com__Instance * channel)
{
int len = string ? strlen(string) : 0;

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned char *  data, unsigned int numBytes))channel->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData])(channel, string ? string : "", len + 1);
}

extern unsigned int __ecereNameSpace__ecere__sys__UTF8Validate(char *  source);

extern int __ecereNameSpace__ecere__sys__ISO8859_1toUTF8(char *  source, char *  dest, int max);

static void __ecereNameSpace__ecere__com__String_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * _class, char ** string, struct __ecereNameSpace__ecere__com__Instance * channel)
{
if(string)
{
int c;
unsigned int size = 64;

*string = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (size));
for(c = 0; ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, unsigned char *  data, unsigned int numBytes))channel->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData])(channel, &(*string)[c], 1) && (*string)[c]; c++)
{
if(c == size - 1)
{
size += size / 2;
*string = __ecereNameSpace__ecere__com__eSystem_Renew(*string, sizeof(char) * (size));
}
}
(*string)[c++] = '\0';
if(!__ecereNameSpace__ecere__sys__UTF8Validate(*string))
{
char * newString = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (c * 2));

__ecereNameSpace__ecere__sys__ISO8859_1toUTF8(*string, newString, c * 2);
(__ecereNameSpace__ecere__com__eSystem_Delete(*string), *string = 0);
*string = __ecereNameSpace__ecere__com__eSystem_Renew(newString, sizeof(char) * (strlen(newString) + 1));
}
else
*string = __ecereNameSpace__ecere__com__eSystem_Renew(*string, sizeof(char) * (c));
}
}

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  dataType, void *  setStmt, void *  getStmt, int declMode);

static void __ecereNameSpace__ecere__com__RegisterClass_String(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * stringClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "char *", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);

(__ecereNameSpace__ecere__com__eSystem_Delete(stringClass->dataTypeString), stringClass->dataTypeString = 0);
stringClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("char *");
stringClass->structSize = 0;
__ecereNameSpace__ecere__com__eClass_AddMethod(stringClass, "OnCompare", (((void *)0)), __ecereNameSpace__ecere__com__String_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(stringClass, "OnCopy", (((void *)0)), __ecereNameSpace__ecere__com__String_OnCopy, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(stringClass, "OnFree", (((void *)0)), __ecereNameSpace__ecere__com__String_OnFree, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(stringClass, "OnGetString", (((void *)0)), __ecereNameSpace__ecere__com__String_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(stringClass, "OnGetDataFromString", (((void *)0)), __ecereNameSpace__ecere__com__String_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(stringClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__String_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(stringClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__String_OnUnserialize, 1);
stringClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "String", "char *", 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
stringClass->structSize = 0;
__ecereNameSpace__ecere__com__eClass_AddProperty(stringClass, (((void *)0)), "char *", (((void *)0)), (((void *)0)), 1);
}

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

void __ecereNameSpace__ecere__com__InitializeDataTypes1(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * baseClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "class");

__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnDisplay", "void typed_object::OnDisplay(Surface surface, int x, int y, int width, void * fieldData, Alignment alignment, DataDisplayFlags displayFlags)", (((void *)0)), 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnCompare", "int typed_object::OnCompare(any_object object)", __ecereNameSpace__ecere__com__OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnCopy", "void typed_object&::OnCopy(any_object newData)", __ecereNameSpace__ecere__com__OnCopy, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnFree", "void typed_object::OnFree(void)", __ecereNameSpace__ecere__com__OnFree, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnGetString", "char * typed_object::OnGetString(char * tempString, void * fieldData, bool * needClass)", __ecereNameSpace__ecere__com__OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnGetDataFromString", "bool typed_object&::OnGetDataFromString(char * string)", __ecereNameSpace__ecere__com__OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnEdit", "Window typed_object::OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)", (((void *)0)), 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnSerialize", "void typed_object::OnSerialize(IOChannel channel)", __ecereNameSpace__ecere__com__OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnUnserialize", "void typed_object&::OnUnserialize(IOChannel channel)", __ecereNameSpace__ecere__com__OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(baseClass, "OnSaveEdit", "bool typed_object&::OnSaveEdit(Window window, void * object)", (((void *)0)), 1);
}

void __ecereNameSpace__ecere__com__InitializeDataTypes(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * enumClass = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "enum");

__ecereNameSpace__ecere__com__eClass_AddMethod(enumClass, "OnSerialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(enumClass, "OnUnserialize", (((void *)0)), __ecereNameSpace__ecere__com__Int_OnUnserialize, 1);
__ecereNameSpace__ecere__com__RegisterClass_Integer(module);
__ecereNameSpace__ecere__com__RegisterClass_Float(module);
__ecereNameSpace__ecere__com__RegisterClass_Double(module);
__ecereNameSpace__ecere__com__RegisterClass_String(module);
}

typedef __builtin_va_list __gnuc_va_list;

typedef __gnuc_va_list va_list;

typedef unsigned int size_t;

void exit(int status);

void * calloc(size_t nmemb, size_t size);

void free(void * ptr);

void * malloc(size_t size);

void * realloc(void * ptr, size_t size);

long long int strtoll(const char * nptr, char ** endptr, int base);

unsigned long long int strtoull(const char * nptr, char ** endptr, int base);

typedef void FILE;

FILE * bsl_stdin(void);

FILE * bsl_stdout(void);

FILE * bsl_stderr(void);

char * fgets(char * s, int size, FILE * stream);

FILE * fopen(const char * path, const char * mode);

int fclose(FILE * fp);

int fflush(FILE * stream);

int fgetc(FILE * stream);

int fprintf(FILE * stream, const char * format, ...);

int fputc(int c, FILE * stream);

size_t fread(void * ptr, size_t size, size_t nmemb, FILE * stream);

size_t fwrite(const void * ptr, size_t size, size_t nmemb, FILE * stream);

int vsnprintf(char *, size_t, const char *, ...);

int snprintf(char * str, size_t, const char * format, ...);

int fseek(FILE * stream, long offset, int whence);

long ftell(FILE * stream);

int feof(FILE * stream);

int ferror(FILE * stream);

int fileno(FILE * stream);

int __ecereNameSpace__ecere__com__PrintStdArgsToBuffer(char * buffer, int maxLen, struct __ecereNameSpace__ecere__com__Class * class, void * object, va_list args)
{
int len = 0;
char * result = ((char *  (*)(struct __ecereNameSpace__ecere__com__Class *, void *, char *  tempString, void *  fieldData, unsigned int *  needClass))class->_vTbl[__ecereVMethodID_class_OnGetString])(class, object, buffer, (((void *)0)), (((void *)0)));

if(result)
{
len = strlen(result);
if(len >= maxLen)
len = maxLen - 1;
if(result != buffer)
memcpy(buffer, result, len);
}
while(0x1)
{
struct __ecereNameSpace__ecere__com__Class * _class = (((void *)0));
void * data = (((void *)0));

_class = __builtin_va_arg(args, void *);
if(!_class)
break;
data = __builtin_va_arg(args, void *);
if(data)
{
result = (char *)_class->_vTbl[__ecereVMethodID_class_OnGetString](_class, data, buffer + len, (((void *)0)), (((void *)0)));
if(result)
{
int newLen = strlen(result);

if(len + newLen >= maxLen)
newLen = maxLen - 1 - len;
if(result != buffer + len)
memcpy(buffer + len, result, newLen);
len += newLen;
}
}
}
buffer[len] = (char)0;
return len;
}

int __ecereNameSpace__ecere__com__PrintBuf(char * buffer, int maxLen, struct __ecereNameSpace__ecere__com__Class * class, void * object, ...)
{
va_list args;
int len;

__builtin_va_start(args, object);
len = __ecereNameSpace__ecere__com__PrintStdArgsToBuffer(buffer, maxLen, class, object, args);
__builtin_va_end(args);
return len;
}

int __ecereNameSpace__ecere__com__PrintLnBuf(char * buffer, int maxLen, struct __ecereNameSpace__ecere__com__Class * class, void * object, ...)
{
va_list args;
int len;

__builtin_va_start(args, object);
len = __ecereNameSpace__ecere__com__PrintStdArgsToBuffer(buffer, maxLen - 1, class, object, args);
buffer[len++] = '\n';
buffer[len] = '\0';
__builtin_va_end(args);
return len;
}

char * __ecereNameSpace__ecere__com__PrintString(struct __ecereNameSpace__ecere__com__Class * class, void * object, ...)
{
char buffer[4096];
va_list args;
char * string;
int len;

__builtin_va_start(args, object);
len = __ecereNameSpace__ecere__com__PrintStdArgsToBuffer(buffer, sizeof buffer, class, object, args);
string = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (len + 1));
memcpy(string, buffer, len + 1);
__builtin_va_end(args);
return string;
}

char * __ecereNameSpace__ecere__com__PrintLnString(struct __ecereNameSpace__ecere__com__Class * class, void * object, ...)
{
char buffer[4096];
va_list args;
char * string;
int len;

__builtin_va_start(args, object);
len = __ecereNameSpace__ecere__com__PrintStdArgsToBuffer(buffer, sizeof buffer, class, object, args);
string = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (len + 2));
memcpy(string, buffer, len);
string[len++] = '\n';
string[len] = '\0';
__builtin_va_end(args);
return string;
}

extern int puts(char * );

void __ecereNameSpace__ecere__com__PrintLn(struct __ecereNameSpace__ecere__com__Class * class, void * object, ...)
{
va_list args;
char buffer[4096];

__builtin_va_start(args, object);
__ecereNameSpace__ecere__com__PrintStdArgsToBuffer(buffer, sizeof buffer, class, object, args);
__builtin_va_end(args);
puts(buffer);
}

extern int fputs(char * , void *  stream);

void __ecereNameSpace__ecere__com__Print(struct __ecereNameSpace__ecere__com__Class * class, void * object, ...)
{
va_list args;
char buffer[4096];

__builtin_va_start(args, object);
__ecereNameSpace__ecere__com__PrintStdArgsToBuffer(buffer, sizeof buffer, class, object, args);
__builtin_va_end(args);
fputs(buffer, (bsl_stdout()));
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DefinedExpression;

struct __ecereNameSpace__ecere__com__DefinedExpression;

extern struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_RegisterDefine(char *  name, char *  value, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

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

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

void __ecereRegisterModule_dataTypes(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MAXBYTE", "0xff", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MAXWORD", "0xffff", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MININT", "((int)0x80000000)", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MAXINT", "((int)0x7fffffff)", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MININT64", "((long long)0x8000000000000000LL)", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MAXINT64", "((long long)0x7fffffffffffffffLL)", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MAXDWORD", "0xffffffff", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MAXQWORD", "0xffffffffffffffffLL", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MINFLOAT", "((float)1.17549435082228750e-38)", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MAXFLOAT", "((float)3.40282346638528860e+38)", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MINDOUBLE", "((double)2.2250738585072014e-308)", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::MAXDOUBLE", "((double)1.7976931348623158e+308)", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::FORMAT64HEXLL", "(GetRuntimePlatform() == win32) ? \"0x%I64XLL\" : \"0x%llXLL\"", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::FORMAT64HEX", "(GetRuntimePlatform() == win32) ? \"0x%I64X\" : \"0x%llX\"", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::FORMAT64DLL", "(GetRuntimePlatform() == win32) ? \"%I64dLL\" : \"%lldLL\"", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::FORMAT64D", "(GetRuntimePlatform() == win32) ? \"%I64d\" : \"%lld\"", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::FORMAT64U", "(GetRuntimePlatform() == win32) ? \"%I64u\" : \"%llu\"", module, 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::IOChannel", 0, 0, 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__IOChannel = class;
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "WriteData", "unsigned int WriteData(byte * data, unsigned int numBytes)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "ReadData", "unsigned int ReadData(byte * data, unsigned int numBytes)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Get", "void Get(typed_object * data)", __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Get, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Put", "void Put(typed_object data)", __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Put, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Serialize", "void Serialize(typed_object data)", __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Unserialize", "void Unserialize(typed_object * data)", __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::SerialBuffer", "ecere::com::IOChannel", sizeof(struct __ecereNameSpace__ecere__com__SerialBuffer), 0, 0, __ecereDestructor___ecereNameSpace__ecere__com__SerialBuffer, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__SerialBuffer = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "WriteData", 0, __ecereMethod___ecereNameSpace__ecere__com__SerialBuffer_WriteData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "ReadData", 0, __ecereMethod___ecereNameSpace__ecere__com__SerialBuffer_ReadData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Free", "void Free()", __ecereMethod___ecereNameSpace__ecere__com__SerialBuffer_Free, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_buffer", "byte *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "count", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_size", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "pos", "uint", 4, 4, 1);
__ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_buffer = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "buffer", "byte *", __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Set_buffer, __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Get_buffer, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__SerialBuffer_buffer = __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_buffer, __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_buffer = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_size = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "size", "unsigned int", __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Set_size, __ecereProp___ecereNameSpace__ecere__com__SerialBuffer_Get_size, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__SerialBuffer_size = __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_size, __ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_size = (void *)0;
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Enum_OnGetString", "char * ecere::com::Enum_OnGetString(ecere::com::Class _class, int * data, char * tempString, void * fieldData, bool * needClass)", __ecereNameSpace__ecere__com__Enum_OnGetString, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Integer_OnGetString", "char * ecere::com::Integer_OnGetString(ecere::com::Class _class, int * data, char * string, void * fieldData, bool * needClass)", __ecereNameSpace__ecere__com__Integer_OnGetString, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Byte_OnSerialize", "void ecere::com::Byte_OnSerialize(ecere::com::Class _class, byte * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Byte_OnSerialize, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Byte_OnUnserialize", "void ecere::com::Byte_OnUnserialize(ecere::com::Class _class, byte * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Byte_OnUnserialize, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Int_OnSerialize", "void ecere::com::Int_OnSerialize(ecere::com::Class _class, int * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Int_OnSerialize, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Int_OnUnserialize", "void ecere::com::Int_OnUnserialize(ecere::com::Class _class, int * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Int_OnUnserialize, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Int64_OnSerialize", "void ecere::com::Int64_OnSerialize(ecere::com::Class _class, int64 * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Int64_OnSerialize, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Int64_OnUnserialize", "void ecere::com::Int64_OnUnserialize(ecere::com::Class _class, int64 * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Int64_OnUnserialize, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Word_OnSerialize", "void ecere::com::Word_OnSerialize(ecere::com::Class _class, uint16 * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Word_OnSerialize, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Word_OnUnserialize", "void ecere::com::Word_OnUnserialize(ecere::com::Class _class, uint16 * data, ecere::com::IOChannel channel)", __ecereNameSpace__ecere__com__Word_OnUnserialize, module, 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::com::StaticString", 0, sizeof(struct __ecereNameSpace__ecere__com__StaticString), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__StaticString = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnCompare", 0, __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnFree", 0, __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnFree, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnSerialize", 0, __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnUnserialize", 0, __ecereMethod___ecereNameSpace__ecere__com__StaticString_OnUnserialize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "string", "char[1]", 1, 1, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::String_OnCompare", "int ecere::com::String_OnCompare(ecere::com::Class _class, char * string1, char * string2)", __ecereNameSpace__ecere__com__String_OnCompare, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::InitializeDataTypes1", "void ecere::com::InitializeDataTypes1(ecere::com::Module module)", __ecereNameSpace__ecere__com__InitializeDataTypes1, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::InitializeDataTypes", "void ecere::com::InitializeDataTypes(ecere::com::Module module)", __ecereNameSpace__ecere__com__InitializeDataTypes, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::PrintStdArgsToBuffer", "int ecere::com::PrintStdArgsToBuffer(char * buffer, int maxLen, typed_object object, __builtin_va_list args)", __ecereNameSpace__ecere__com__PrintStdArgsToBuffer, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::PrintBuf", "int ecere::com::PrintBuf(char * buffer, int maxLen, typed_object object, ...)", __ecereNameSpace__ecere__com__PrintBuf, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::PrintLnBuf", "int ecere::com::PrintLnBuf(char * buffer, int maxLen, typed_object object, ...)", __ecereNameSpace__ecere__com__PrintLnBuf, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::PrintString", "char * ecere::com::PrintString(typed_object object, ...)", __ecereNameSpace__ecere__com__PrintString, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::PrintLnString", "char * ecere::com::PrintLnString(typed_object object, ...)", __ecereNameSpace__ecere__com__PrintLnString, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::PrintLn", "void ecere::com::PrintLn(typed_object object, ...)", __ecereNameSpace__ecere__com__PrintLn, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::Print", "void ecere::com::Print(typed_object object, ...)", __ecereNameSpace__ecere__com__Print, module, 4);
}

void __ecereUnregisterModule_dataTypes(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_buffer = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__SerialBuffer_size = (void *)0;
}

