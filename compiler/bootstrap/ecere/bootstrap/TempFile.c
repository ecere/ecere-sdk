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

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__TempFile_openMode, * __ecerePropM___ecereNameSpace__ecere__sys__TempFile_openMode;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__TempFile_buffer, * __ecerePropM___ecereNameSpace__ecere__sys__TempFile_buffer;

struct __ecereNameSpace__ecere__sys__TempFile
{
unsigned char * buffer;
unsigned int size;
unsigned int position;
unsigned int eof;
int openMode;
unsigned int allocated;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

unsigned int __ecereConstructor___ecereNameSpace__ecere__sys__TempFile(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__sys__TempFile->openMode = 5;
return 0x1;
}

void __ecereDestructor___ecereNameSpace__ecere__sys__TempFile(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

{
(__ecereNameSpace__ecere__com__eSystem_Delete(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer), __ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer = 0);
}
}

extern void *  memcpy(void * , const void * , unsigned int size);

int __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Read(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char * buffer, unsigned int size, unsigned int count)
{
int __simpleStruct0;
struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);
int readSize = size * count;
int read = (__simpleStruct0 = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size - __ecerePointer___ecereNameSpace__ecere__sys__TempFile->position, (readSize < __simpleStruct0) ? readSize : __simpleStruct0);

if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position >= __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size)
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->eof = 0x1;
if(buffer)
memcpy(buffer, __ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer + __ecerePointer___ecereNameSpace__ecere__sys__TempFile->position, read);
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position += read;
return read / size;
}

int __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Write(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char * buffer, unsigned int size, unsigned int count)
{
struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);
int writeSize = size * count;
int written = writeSize;

if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size - __ecerePointer___ecereNameSpace__ecere__sys__TempFile->position < writeSize)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size += writeSize - (__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size - __ecerePointer___ecereNameSpace__ecere__sys__TempFile->position);
if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->allocated < __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->allocated *= 2;
if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->allocated < __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size)
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->allocated = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size * 2;
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer, sizeof(unsigned char) * (__ecerePointer___ecereNameSpace__ecere__sys__TempFile->allocated));
}
}
memcpy(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer + __ecerePointer___ecereNameSpace__ecere__sys__TempFile->position, buffer, writeSize);
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position += written;
return written / size;
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Getc(struct __ecereNameSpace__ecere__com__Instance * this, char * ch)
{
struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);
int read = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read])(this, ch, 1, 1);

return !__ecerePointer___ecereNameSpace__ecere__sys__TempFile->eof && read != 0;
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Putc(struct __ecereNameSpace__ecere__com__Instance * this, char ch)
{
struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);
int written = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])(this, &ch, 1, 1);

return written != 0;
}

extern int strlen(const char * );

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Puts(struct __ecereNameSpace__ecere__com__Instance * this, char * string)
{
struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);
int len = strlen(string);
int written = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])(this, string, 1, len);

return written == len;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Seek(struct __ecereNameSpace__ecere__com__Instance * this, int pos, int mode)
{
struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);
unsigned int result = 0x1;
unsigned int increase = 0;

switch(mode)
{
case 0:
{
if(pos >= __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size)
{
if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->openMode == 4)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = pos;
increase = pos - __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size;
}
else
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size;
result = 0x0;
}
}
else if(pos < 0)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = 0;
result = 0x0;
}
else
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = pos;
break;
}
case 1:
{
if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position + pos >= __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size)
{
if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->openMode == 4)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position += pos;
increase = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->position - __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size;
}
else
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size;
result = 0x0;
}
}
else if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position + pos < 0)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = 0;
result = 0x0;
}
else
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position += pos;
break;
}
case 2:
{
if((int)__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size + pos >= (int)__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size)
{
if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->openMode == 4)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size + pos;
increase = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->position - __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size;
}
else
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size;
result = 0x0;
}
}
else if((int)__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size + pos < 0)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = 0;
result = 0x0;
}
else
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = __ecerePointer___ecereNameSpace__ecere__sys__TempFile->size + pos;
break;
}
}
if(result)
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->eof = 0x0;
if(increase)
{
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size += increase;
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer, sizeof(unsigned char) * (__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size));
}
return result;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Tell(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__TempFile->position;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Eof(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__TempFile->eof;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__TempFile_GetSize(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

return (unsigned int)__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Truncate(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int size)
{
struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer = __ecereNameSpace__ecere__com__eSystem_Renew(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer, sizeof(unsigned char) * (size));
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->size = (unsigned int)size;
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->allocated = (unsigned int)size;
if(__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position > (unsigned int)size)
__ecerePointer___ecereNameSpace__ecere__sys__TempFile->position = (unsigned int)size;
return 0x1;
}

int __ecereProp___ecereNameSpace__ecere__sys__TempFile_Get_openMode(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__TempFile->openMode;
}

void __ecereProp___ecereNameSpace__ecere__sys__TempFile_Set_openMode(struct __ecereNameSpace__ecere__com__Instance * this, int value)
{
struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__sys__TempFile->openMode = value;
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__TempFile_openMode), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__TempFile_openMode);
}

unsigned char *  __ecereProp___ecereNameSpace__ecere__sys__TempFile_Get_buffer(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__TempFile * __ecerePointer___ecereNameSpace__ecere__sys__TempFile = (struct __ecereNameSpace__ecere__sys__TempFile *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__TempFile->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__TempFile->buffer;
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

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  dataType, void *  setStmt, void *  getStmt, int declMode);

void __ecereRegisterModule_TempFile(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::sys::TempFile", "ecere::sys::File", sizeof(struct __ecereNameSpace__ecere__sys__TempFile), 0, __ecereConstructor___ecereNameSpace__ecere__sys__TempFile, __ecereDestructor___ecereNameSpace__ecere__sys__TempFile, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__TempFile = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Seek", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Seek, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Tell", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Tell, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Read", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Read, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Write", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Write, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Getc", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Getc, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Putc", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Putc, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Puts", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Puts, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Eof", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Eof, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Truncate", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_Truncate, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetSize", 0, __ecereMethod___ecereNameSpace__ecere__sys__TempFile_GetSize, 1);
__ecerePropM___ecereNameSpace__ecere__sys__TempFile_openMode = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "openMode", "ecere::sys::FileOpenMode", __ecereProp___ecereNameSpace__ecere__sys__TempFile_Set_openMode, __ecereProp___ecereNameSpace__ecere__sys__TempFile_Get_openMode, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__TempFile_openMode = __ecerePropM___ecereNameSpace__ecere__sys__TempFile_openMode, __ecerePropM___ecereNameSpace__ecere__sys__TempFile_openMode = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__TempFile_buffer = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "buffer", "byte *", 0, __ecereProp___ecereNameSpace__ecere__sys__TempFile_Get_buffer, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__TempFile_buffer = __ecerePropM___ecereNameSpace__ecere__sys__TempFile_buffer, __ecerePropM___ecereNameSpace__ecere__sys__TempFile_buffer = (void *)0;
}

void __ecereUnregisterModule_TempFile(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__sys__TempFile_openMode = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__TempFile_buffer = (void *)0;
}

