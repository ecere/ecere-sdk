#if defined(__GNUC__)
typedef long long int64;
typedef unsigned long long uint64;
#ifdef _WIN32
#define stdcall __attribute__((__stdcall__))
#else
#define stdcall
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
#define stdcall __attribute__((__stdcall__))
#else
#define stdcall
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

struct __ecereNameSpace__ecere__com__Class
{
struct __ecereNameSpace__ecere__com__Class * prev, * next;
char * name;
int offset, structSize;
int (** _vTbl)();
int vTblSize;
int (* Constructor)(struct __ecereNameSpace__ecere__com__Instance *);
void (* Destructor)(struct __ecereNameSpace__ecere__com__Instance *);
int offsetClass, sizeClass;
struct __ecereNameSpace__ecere__com__Class * base;
struct __ecereNameSpace__ecere__sys__BinaryTree methods;
struct __ecereNameSpace__ecere__sys__BinaryTree members;
struct __ecereNameSpace__ecere__sys__BinaryTree prop;
struct __ecereNameSpace__ecere__sys__OldList membersAndProperties;
struct __ecereNameSpace__ecere__sys__BinaryTree classProperties;
struct __ecereNameSpace__ecere__sys__OldList derivatives;
int memberID, startMemberID;
int type;
struct __ecereNameSpace__ecere__com__Instance * module;
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace;
char * dataTypeString;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int typeSize;
int defaultAlignment;
void (* Initialize)();
int memberOffset;
struct __ecereNameSpace__ecere__sys__OldList selfWatchers;
char * designerClass;
unsigned int noExpansion;
char * defaultProperty;
unsigned int comRedefinition;
int count;
unsigned int isRemote;
unsigned int internalDecl;
void * data;
unsigned int computeSize;
int structAlignment;
int destructionWatchOffset;
unsigned int fixed;
struct __ecereNameSpace__ecere__sys__OldList delayedCPValues;
int inheritanceAccess;
char * fullName;
void * symbol;
struct __ecereNameSpace__ecere__sys__OldList conversions;
struct __ecereNameSpace__ecere__sys__OldList templateParams;
struct __ecereNameSpace__ecere__com__ClassTemplateArgument * templateArgs;
struct __ecereNameSpace__ecere__com__Class * templateClass;
struct __ecereNameSpace__ecere__sys__OldList templatized;
int numParams;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Class;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

struct __ecereNameSpace__ecere__com__Instance
{
int (* *  _vTbl)();
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__com__Property
{
struct __ecereNameSpace__ecere__com__Property * prev, * next;
char * name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
char * dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
struct __ecereNameSpace__ecere__com__Instance * dataType;
void (* Set)();
int (* Get)();
unsigned int (* IsSet)();
void * data;
void * symbol;
int vid;
unsigned int conversion;
unsigned int watcherOffset;
char * category;
unsigned int compiled;
unsigned int selfWatchable, isWatchable;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Property;

struct __ecereNameSpace__ecere__com__DataMember
{
struct __ecereNameSpace__ecere__com__DataMember * prev, * next;
char * name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
char * dataTypeString;
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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DataMember;

struct __ecereNameSpace__ecere__com__Method
{
char * name;
struct __ecereNameSpace__ecere__com__Method * parent, * left, * right;
int depth;
int (* function)();
int vid;
int type;
struct __ecereNameSpace__ecere__com__Class * _class;
void * symbol;
char * dataTypeString;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int memberAccess;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Method;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SerialBuffer;

struct __ecereNameSpace__ecere__com__SerialBuffer
{
unsigned char *  _buffer;
unsigned int count;
unsigned int _size;
unsigned int pos;
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
void * p;
float f;
double d;
long long i64;
uint64 ui64;
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DataValue;

struct __ecereNameSpace__ecere__com__ClassTemplateArgument
{
union
{
struct
{
char * dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
} __attribute__ ((gcc_struct));
struct __ecereNameSpace__ecere__com__DataValue expression;
struct
{
char * memberString;
union
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__Method * method;
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateArgument;

typedef unsigned int size_t;

void exit(int status);

void * calloc(size_t nmemb, size_t size);

void free(void * ptr);

void * malloc(size_t size);

void * realloc(void * ptr, size_t size);

long int strtol(const char * nptr, char ** endptr, int base);

long long int strtoll(const char * nptr, char ** endptr, int base);

unsigned long long int strtoull(const char * nptr, char ** endptr, int base);

typedef __builtin_va_list __gnuc_va_list;

typedef __gnuc_va_list va_list;

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


struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, char * name);

void * __ecereNameSpace__ecere__com__eSystem_Renew(void * memory, unsigned int size);

void * __ecereNameSpace__ecere__com__eSystem_Renew0(void * memory, unsigned int size);

void * __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

void * __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

void __ecereNameSpace__ecere__com__eSystem_Delete(void * memory);

void * __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

extern int __ecereVMethodID_class_OnGetDataFromString;

unsigned int Instance_LocateModule(char * name, char * fileName);

void Instance_COM_Initialize(int argc, char ** argv, char ** parsedCommand, int * argcPtr, char *** argvPtr);

void * Instance_Module_Load(char * name, void ** Load, void ** Unload);

void Instance_Module_Free(void * library);

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__unichar;

int __ecereNameSpace__ecere__sys__UTF32toUTF8Len(unsigned int *  source, int count, unsigned char *  dest, int max);

char * __ecereMethod___ecereNameSpace__ecere__com__unichar_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, unsigned int * this, char * tempString, void * fieldData, unsigned int * needClass)
{
__ecereNameSpace__ecere__sys__UTF32toUTF8Len(&(*(this)), 1, tempString, 5);
return tempString;
}

unsigned int __ecereNameSpace__ecere__sys__UTF8GetChar(char *  string, int *  numBytes);

unsigned int __ecereMethod___ecereNameSpace__ecere__com__unichar_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * class, unsigned int * this, char * string)
{
int nb;

(*(this)) = __ecereNameSpace__ecere__sys__UTF8GetChar(string, &nb);
return 0x1;
}

void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

void __ecereNameSpace__ecere__com__MemoryGuard_PushLoc(char * loc)
{
}

void __ecereNameSpace__ecere__com__MemoryGuard_PopLoc()
{
}

extern unsigned int __ecereDll_Load_ecere(struct __ecereNameSpace__ecere__com__Instance * module);

extern unsigned int __ecereDll_Unload_ecere(struct __ecereNameSpace__ecere__com__Instance * module);

struct __ecereNameSpace__ecere__com__BTNamedLink
{
char * name;
struct __ecereNameSpace__ecere__com__BTNamedLink * parent, * left, * right;
int depth;
void * data;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BTNamedLink;

struct __ecereNameSpace__ecere__com__SelfWatcher
{
struct __ecereNameSpace__ecere__com__SelfWatcher * prev, * next;
void (* callback)(struct __ecereNameSpace__ecere__com__Instance *);
struct __ecereNameSpace__ecere__com__Property * _property;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SelfWatcher;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__AccessMode;

struct __ecereNameSpace__ecere__com__SubModule
{
struct __ecereNameSpace__ecere__com__SubModule * prev, * next;
struct __ecereNameSpace__ecere__com__Instance * module;
int importMode;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SubModule;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DataMemberType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassType;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Class_char__PTR_, * __ecerePropM___ecereNameSpace__ecere__com__Class_char__PTR_;

char *  __ecereProp___ecereNameSpace__ecere__com__Class_Get_char__PTR_(struct __ecereNameSpace__ecere__com__Class * this)
{
return this->name;
}

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

struct __ecereNameSpace__ecere__com__Class * __ecereProp___ecereNameSpace__ecere__com__Class_Set_char__PTR_(char *  value)
{
struct __ecereNameSpace__ecere__com__Class * theClass = __ecereNameSpace__ecere__com__eSystem_FindClass(__thisModule, value);

return theClass;
}

char * __ecereMethod___ecereNameSpace__ecere__com__Class_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Class * this, char * tempString, void * fieldData, unsigned int * needClass)
{
return this->name;
}

struct __ecereNameSpace__ecere__com__NameSpace
{
char * name;
struct __ecereNameSpace__ecere__com__NameSpace * btParent, * left, * right;
int depth;
struct __ecereNameSpace__ecere__com__NameSpace * parent;
struct __ecereNameSpace__ecere__sys__BinaryTree nameSpaces;
struct __ecereNameSpace__ecere__sys__BinaryTree classes;
struct __ecereNameSpace__ecere__sys__BinaryTree defines;
struct __ecereNameSpace__ecere__sys__BinaryTree functions;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__NameSpace;

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

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Class_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Class ** this, char * string)
{
struct __ecereNameSpace__ecere__com__Class * theClass;

theClass = __ecereNameSpace__ecere__com__eSystem_FindClass(__thisModule, string);
if(!theClass)
theClass = __ecereNameSpace__ecere__com__eSystem_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application, string);
(*(this)) = (void *)theClass;
return theClass != (((void *)0));
}

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * data);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_char__PTR_;

void __ecereMethod___ecereNameSpace__ecere__com__Class_OnSerialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Class * this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Serialize(channel, __ecereClass_char__PTR_, this->fullName);
}

void __ecereMethod___ecereNameSpace__ecere__com__Class_OnFree(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Class * this)
{
}

void __ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * *  data);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_String;

void __ecereMethod___ecereNameSpace__ecere__com__Class_OnUnserialize(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Class ** this, struct __ecereNameSpace__ecere__com__Instance * channel)
{
struct __ecereNameSpace__ecere__com__Class * theClass;
char * string;

__ecereMethod___ecereNameSpace__ecere__com__IOChannel_Unserialize(channel, __ecereClass_String, &string);
theClass = __ecereNameSpace__ecere__com__eSystem_FindClass(__thisModule, string);
if(!theClass)
theClass = __ecereNameSpace__ecere__com__eSystem_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application, string);
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
(*(this)) = (void *)theClass;
}

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__TemplateParameterType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__TemplateMemberType;

struct __ecereNameSpace__ecere__com__ClassTemplateParameter
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * prev, * next;
char * name;
int type;
union
{
char * dataTypeString;
int memberType;
} __attribute__ ((gcc_struct));
struct __ecereNameSpace__ecere__com__ClassTemplateArgument defaultArg;
void * param;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateParameter;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__MethodType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ImportType;

struct __ecereNameSpace__ecere__com__BitMember
{
struct __ecereNameSpace__ecere__com__BitMember * prev, * next;
char * name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
char * dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
struct __ecereNameSpace__ecere__com__Instance * dataType;
int type;
int size;
int pos;
uint64 mask;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BitMember;

struct __ecereNameSpace__ecere__com__ClassProperty
{
char * name;
struct __ecereNameSpace__ecere__com__ClassProperty * parent, * left, * right;
int depth;
void (* Set)(struct __ecereNameSpace__ecere__com__Class *, int);
int (* Get)(struct __ecereNameSpace__ecere__com__Class *);
char * dataTypeString;
struct __ecereNameSpace__ecere__com__Instance * dataType;
unsigned int constant;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassProperty;

struct __ecereNameSpace__ecere__com__DefinedExpression
{
struct __ecereNameSpace__ecere__com__DefinedExpression * prev, * next;
char * name;
char * value;
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DefinedExpression;

struct __ecereNameSpace__ecere__com__GlobalFunction
{
struct __ecereNameSpace__ecere__com__GlobalFunction * prev, * next;
char * name;
int (* function)();
struct __ecereNameSpace__ecere__com__Instance * module;
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace;
char * dataTypeString;
struct __ecereNameSpace__ecere__com__Instance * dataType;
void * symbol;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__EnumClassData
{
struct __ecereNameSpace__ecere__sys__OldList values;
int largest;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__EnumClassData;

struct __ecereNameSpace__ecere__com__Watcher
{
struct __ecereNameSpace__ecere__com__Watcher * prev, * next;
void (* callback)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__Instance *);
struct __ecereNameSpace__ecere__com__Instance * object;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Watcher;

static unsigned int __ecereNameSpace__ecere__com__TOTAL_MEM = 0;

static unsigned int __ecereNameSpace__ecere__com__OUTSIDE_MEM = 0;

struct __ecereNameSpace__ecere__com__MemBlock
{
struct __ecereNameSpace__ecere__com__MemBlock * prev, * next;
struct __ecereNameSpace__ecere__com__MemPart * part;
unsigned int size;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__MemBlock;

struct __ecereNameSpace__ecere__com__MemPart
{
void * memory;
int blocksUsed;
int size;
struct __ecereNameSpace__ecere__com__BlockPool * pool;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__MemPart;

static int __ecereNameSpace__ecere__com__power15[] = 
{
4, 8, 12, 16, 24, 32, 48, 64, 96, 144, 224, 320, 480, 720, 1072, 1600, 2400, 6900, 5408, 8096, 12144, 18208, 27312, 40976, 61456, 92176, 138256, 207392, 311088, 466624, 699920
};

struct __ecereNameSpace__ecere__com__BlockPool
{
struct __ecereNameSpace__ecere__com__MemBlock * first, * last;
struct __ecereNameSpace__ecere__com__MemBlock * free;
unsigned int blockSize;
unsigned int blockSpace;
int numParts;
int numBlocks;
unsigned int totalSize;
unsigned int usedSpace;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BlockPool;

unsigned int __ecereMethod___ecereNameSpace__ecere__com__BlockPool_Expand(struct __ecereNameSpace__ecere__com__BlockPool * this, unsigned int numBlocks)
{
unsigned char * memory = malloc(numBlocks * this->blockSpace);

__ecereNameSpace__ecere__com__TOTAL_MEM += numBlocks * this->blockSpace;
if(memory)
{
int c;
struct __ecereNameSpace__ecere__com__MemBlock * block = (struct __ecereNameSpace__ecere__com__MemBlock *)memory;
struct __ecereNameSpace__ecere__com__MemPart * part = calloc(1, sizeof(struct __ecereNameSpace__ecere__com__MemPart));

__ecereNameSpace__ecere__com__TOTAL_MEM += sizeof(struct __ecereNameSpace__ecere__com__MemPart);
this->free = block;
for(c = 0; c < numBlocks - 1; c++)
{
block->part = part;
block->prev = (((void *)0));
block->next = (struct __ecereNameSpace__ecere__com__MemBlock *)((unsigned char *)block + this->blockSpace);
block = block->next;
}
part->blocksUsed = 0;
part->pool = this;
part->memory = memory;
part->size = numBlocks;
block->part = part;
block->prev = (((void *)0));
block->next = (((void *)0));
this->totalSize += numBlocks;
this->numParts++;
return 0x1;
}
return 0x0;
}

struct __ecereNameSpace__ecere__com__MemBlock * __ecereMethod___ecereNameSpace__ecere__com__BlockPool_Add(struct __ecereNameSpace__ecere__com__BlockPool * this)
{
int __simpleStruct0;
struct __ecereNameSpace__ecere__com__MemBlock * block = (((void *)0));

if(!this->free)
__ecereMethod___ecereNameSpace__ecere__com__BlockPool_Expand(this, (__simpleStruct0 = this->numBlocks / 2, (1 > __simpleStruct0) ? 1 : __simpleStruct0));
if(this->free)
{
block = this->free;
block->prev = this->last;
if(block->prev)
block->prev->next = block;
if(!this->first)
this->first = block;
this->last = block;
this->free = block->next;
block->next = (((void *)0));
block->part->blocksUsed++;
this->numBlocks++;
}
return block;
}

void __ecereMethod___ecereNameSpace__ecere__com__BlockPool_Remove(struct __ecereNameSpace__ecere__com__BlockPool * this, struct __ecereNameSpace__ecere__com__MemBlock * block)
{
if(block->prev)
block->prev->next = block->next;
if(block->next)
block->next->prev = block->prev;
if(this->first == block)
this->first = block->next;
if(this->last == block)
this->last = block->prev;
block->next = this->free;
this->free = block;
block->part->blocksUsed--;
this->numBlocks--;
(*block->part->pool).usedSpace -= block->size;
if(!block->part->blocksUsed && this->numBlocks && this->totalSize > this->numBlocks + this->numBlocks / 2)
{
struct __ecereNameSpace__ecere__com__MemBlock * next = this->free, * prev = (((void *)0));
struct __ecereNameSpace__ecere__com__MemPart * part = block->part;

this->free = (((void *)0));
this->totalSize -= part->size;
while(next)
{
if(next->part != part)
{
if(prev)
prev->next = next;
else
this->free = next;
prev = next;
}
next = next->next;
}
;
if(prev)
prev->next = (((void *)0));
__ecereNameSpace__ecere__com__TOTAL_MEM -= part->size * this->blockSpace;
__ecereNameSpace__ecere__com__TOTAL_MEM -= sizeof(struct __ecereNameSpace__ecere__com__MemPart);
this->numParts--;
free(part->memory);
free(part);
}
}

static struct __ecereNameSpace__ecere__com__BlockPool * __ecereNameSpace__ecere__com__pools;

static unsigned int __ecereNameSpace__ecere__com__PosFibonacci(unsigned int number)
{
unsigned int pos;
unsigned int last = 1, prev = 0;
unsigned int current = 1;

for(pos = 0; ; pos++)
{
current += prev;
prev = last;
last = current;
if(current >= number)
break;
}
return pos;
}

static unsigned int __ecereNameSpace__ecere__com__NthFibonacci(unsigned int number)
{
unsigned int pos;
unsigned int last = 1, prev = 0;
unsigned int current = 1;

for(pos = 0; pos <= number; pos++)
{
current += prev;
prev = last;
last = current;
}
return current;
}

static unsigned int __ecereNameSpace__ecere__com__NextFibonacci(unsigned int number)
{
unsigned int pos;
unsigned int last = 1, prev = 0;
unsigned int current = 1;

for(pos = 0; ; pos++)
{
current += prev;
prev = last;
last = current;
if(current >= number)
return current;
}
}

static unsigned int __ecereNameSpace__ecere__com__log1_5i(unsigned int number)
{
unsigned int pos;
uint64 current = sizeof(void *);

for(pos = 0; pos < 31; pos++)
{
if(current >= number)
break;
current = current * 3 / 2;
if(current == 1)
current = 2;
}
return pos;
}

static unsigned int __ecereNameSpace__ecere__com__pow1_5(unsigned int number)
{
unsigned int pos;
uint64 current = sizeof(void *);

for(pos = 0; pos < number; pos++)
{
current = current * 3 / 2;
if(current == 1)
current = 2;
}
return (unsigned int)current;
}

static unsigned int __ecereNameSpace__ecere__com__pow1_5i(unsigned int number)
{
unsigned int pos;
uint64 current = sizeof(void *);

for(pos = 0; pos < 31; pos++)
{
if(current >= number)
return (unsigned int)current;
current = current * 3 / 2;
if(current == 1)
current = 2;
}
return (unsigned int)current;
}

unsigned int __ecereNameSpace__ecere__com__log2i(unsigned int number)
{
unsigned int power;

for(power = 0; power < 32; power++)
if((1L << power) >= number)
break;
return power;
}

unsigned int __ecereNameSpace__ecere__com__pow2i(unsigned int number)
{
return 1 << __ecereNameSpace__ecere__com__log2i(number);
}

static unsigned int __ecereNameSpace__ecere__com__memoryInitialized = 0x0;

static void __ecereNameSpace__ecere__com__InitMemory()
{
int c;

__ecereNameSpace__ecere__com__memoryInitialized = 0x1;
__ecereNameSpace__ecere__com__pools = calloc(1, sizeof(struct __ecereNameSpace__ecere__com__BlockPool) * 31);
for(c = 0; c < 31; c++)
{
int expansion;

__ecereNameSpace__ecere__com__pools[c].blockSize = __ecereNameSpace__ecere__com__pow1_5(c);
if(__ecereNameSpace__ecere__com__pools[c].blockSize % sizeof(void *))
__ecereNameSpace__ecere__com__pools[c].blockSize += sizeof(void *) - (__ecereNameSpace__ecere__com__pools[c].blockSize % sizeof(void *));
__ecereNameSpace__ecere__com__pools[c].blockSpace = __ecereNameSpace__ecere__com__pools[c].blockSize;
__ecereNameSpace__ecere__com__pools[c].blockSpace += sizeof(struct __ecereNameSpace__ecere__com__MemBlock);
expansion = (__ecereNameSpace__ecere__com__pools[c].blockSize < 128) ? 1024 : (131072 / __ecereNameSpace__ecere__com__pools[c].blockSize);
if(c < 12)
__ecereMethod___ecereNameSpace__ecere__com__BlockPool_Expand(&__ecereNameSpace__ecere__com__pools[c], ((1 > expansion) ? 1 : expansion));
}
}

static void * __ecereNameSpace__ecere__com___mymalloc(unsigned int size)
{
struct __ecereNameSpace__ecere__com__MemBlock * block = (((void *)0));

if(size)
{
unsigned int p = __ecereNameSpace__ecere__com__log1_5i(size);

if(!__ecereNameSpace__ecere__com__memoryInitialized)
__ecereNameSpace__ecere__com__InitMemory();
if(p < 31)
{
block = __ecereMethod___ecereNameSpace__ecere__com__BlockPool_Add(&__ecereNameSpace__ecere__com__pools[p]);
if(block)
{
block->size = size;
__ecereNameSpace__ecere__com__pools[p].usedSpace += size;
}
}
else
{
block = malloc(sizeof(struct __ecereNameSpace__ecere__com__MemBlock) + size);
if(block)
{
__ecereNameSpace__ecere__com__TOTAL_MEM += sizeof(struct __ecereNameSpace__ecere__com__MemBlock) + size;
__ecereNameSpace__ecere__com__OUTSIDE_MEM += sizeof(struct __ecereNameSpace__ecere__com__MemBlock) + size;
block->part = (((void *)0));
}
}
}
return block ? ((struct __ecereNameSpace__ecere__com__MemBlock *)block + 1) : (((void *)0));
}

extern void memset(void *  area, unsigned char value, unsigned int count);

static void * __ecereNameSpace__ecere__com___mycalloc(int n, unsigned int size)
{
void * pointer = __ecereNameSpace__ecere__com___mymalloc(size);

if(pointer)
memset(pointer, (unsigned char)0, size);
return pointer;
}

static void __ecereNameSpace__ecere__com___myfree(void * pointer)
{
if(pointer)
{
struct __ecereNameSpace__ecere__com__MemBlock * block = (struct __ecereNameSpace__ecere__com__MemBlock *)((unsigned char *)pointer - sizeof(struct __ecereNameSpace__ecere__com__MemBlock));
struct __ecereNameSpace__ecere__com__MemPart * part = block->part;
struct __ecereNameSpace__ecere__com__BlockPool * pool = part ? part->pool : (((void *)0));

if(pool)
__ecereMethod___ecereNameSpace__ecere__com__BlockPool_Remove((&*pool), block);
else
{
__ecereNameSpace__ecere__com__TOTAL_MEM -= sizeof(struct __ecereNameSpace__ecere__com__MemBlock) + block->size;
__ecereNameSpace__ecere__com__OUTSIDE_MEM -= sizeof(struct __ecereNameSpace__ecere__com__MemBlock) + block->size;
free(block);
}
}
}

extern void *  memcpy(void * , const void * , unsigned int size);

static void * __ecereNameSpace__ecere__com___myrealloc(void * pointer, unsigned int size)
{
struct __ecereNameSpace__ecere__com__MemBlock * block = pointer ? ((struct __ecereNameSpace__ecere__com__MemBlock *)((unsigned char *)pointer - sizeof(struct __ecereNameSpace__ecere__com__MemBlock))) : (((void *)0));
void * newPointer = (((void *)0));
struct __ecereNameSpace__ecere__com__MemPart * part = block ? block->part : (((void *)0));
struct __ecereNameSpace__ecere__com__BlockPool * pool = part ? part->pool : (((void *)0));

if(block)
{
if(pool)
{
unsigned int ns = __ecereNameSpace__ecere__com__pow1_5i(size);
unsigned int mod = ns % sizeof(void *);

if(mod)
ns += sizeof(void *) - mod;
if(ns == (*pool).blockSize)
{
newPointer = pointer;
(*pool).usedSpace += size - block->size;
block->size = size;
}
}
else if(size)
{
struct __ecereNameSpace__ecere__com__MemBlock * newBlock = realloc(block, sizeof(struct __ecereNameSpace__ecere__com__MemBlock) + size);

if(newBlock)
{
__ecereNameSpace__ecere__com__TOTAL_MEM += size - newBlock->size;
__ecereNameSpace__ecere__com__OUTSIDE_MEM += size - newBlock->size;
newPointer = ((struct __ecereNameSpace__ecere__com__MemBlock *)newBlock + 1);
}
}
}
if(!newPointer)
{
newPointer = __ecereNameSpace__ecere__com___mymalloc(size);
if(pointer && newPointer)
{
unsigned int __simpleStruct0;

memcpy(newPointer, pointer, (__simpleStruct0 = block->size, (size < __simpleStruct0) ? size : __simpleStruct0));
__ecereNameSpace__ecere__com___myfree(pointer);
}
}
return newPointer;
}

static void * __ecereNameSpace__ecere__com___mycrealloc(void * pointer, unsigned int size)
{
struct __ecereNameSpace__ecere__com__MemBlock * block = pointer ? ((struct __ecereNameSpace__ecere__com__MemBlock *)((unsigned char *)pointer - sizeof(struct __ecereNameSpace__ecere__com__MemBlock))) : (((void *)0));
void * newPointer = (((void *)0));
struct __ecereNameSpace__ecere__com__MemPart * part = block ? block->part : (((void *)0));
struct __ecereNameSpace__ecere__com__BlockPool * pool = part ? part->pool : (((void *)0));

if(block)
{
if(pool)
{
unsigned int ns = __ecereNameSpace__ecere__com__pow1_5i(size);
unsigned int mod = ns % sizeof(void *);

if(mod)
ns += sizeof(void *) - mod;
if(ns == (*pool).blockSize)
{
int extra = size - block->size;

newPointer = pointer;
(*pool).usedSpace += extra;
if(extra > 0)
memset((unsigned char *)pointer + block->size, (unsigned char)0, extra);
block->size = size;
}
}
else if(size)
{
struct __ecereNameSpace__ecere__com__MemBlock * newBlock = realloc(block, sizeof(struct __ecereNameSpace__ecere__com__MemBlock) + size);

if(newBlock)
{
int extra = size - newBlock->size;

__ecereNameSpace__ecere__com__TOTAL_MEM += extra;
__ecereNameSpace__ecere__com__OUTSIDE_MEM += extra;
newPointer = ((struct __ecereNameSpace__ecere__com__MemBlock *)newBlock + 1);
if(extra > 0)
memset((unsigned char *)newPointer + newBlock->size, (unsigned char)0, extra);
newBlock->size = size;
}
}
}
if(!newPointer)
{
newPointer = __ecereNameSpace__ecere__com___mymalloc(size);
if(newPointer)
{
if(pointer)
{
unsigned int __simpleStruct0;

memcpy(newPointer, pointer, (__simpleStruct0 = block->size, (size < __simpleStruct0) ? size : __simpleStruct0));
if(size > block->size)
memset((unsigned char *)newPointer + block->size, (unsigned char)0, size - block->size);
__ecereNameSpace__ecere__com___myfree(pointer);
}
else
memset((unsigned char *)newPointer, (unsigned char)0, size);
}
}
return newPointer;
}

static void * __ecereNameSpace__ecere__com___malloc(unsigned int size)
{
void * pointer;

pointer = __ecereNameSpace__ecere__com___mymalloc(size + 2 * 0);
return (unsigned char *)pointer + 0;
}

static void * __ecereNameSpace__ecere__com___calloc(int n, unsigned int size)
{
void * pointer;

pointer = __ecereNameSpace__ecere__com___mycalloc(n, size + 2 * 0);
return (unsigned char *)pointer + 0;
}

static void __ecereNameSpace__ecere__com___free(void *  pointer);

static void * __ecereNameSpace__ecere__com___realloc(void * pointer, unsigned int size)
{
if(!size)
{
__ecereNameSpace__ecere__com___free(pointer);
return (((void *)0));
}
pointer = __ecereNameSpace__ecere__com___myrealloc(pointer, size);
return (unsigned char *)pointer + 0;
}

static void * __ecereNameSpace__ecere__com___crealloc(void * pointer, unsigned int size)
{
if(!size)
return (((void *)0));
pointer = __ecereNameSpace__ecere__com___mycrealloc(pointer, size);
return (unsigned char *)pointer + 0;
}

static void __ecereNameSpace__ecere__com___free(void * pointer)
{
if(pointer)
{
__ecereNameSpace__ecere__com___myfree(pointer);
}
}

void __ecereNameSpace__ecere__com__memswap(unsigned char * a, unsigned char * b, unsigned int size)
{
unsigned int c;
unsigned char buffer[1024];

for(c = 0; c < size; )
{
int s = sizeof buffer;

if(c + s > size)
s = size - c;
memcpy(buffer, a + c, s);
memcpy(a + c, b + c, s);
memcpy(b + c, buffer, s);
c += s;
}
}

void __ecereNameSpace__ecere__com__CheckMemory()
{
}

static void __ecereNameSpace__ecere__com__ComputeClassParameters(struct __ecereNameSpace__ecere__com__Class * templatedClass, char *  templateParams, struct __ecereNameSpace__ecere__com__Instance * findModule);

extern char *  strchr(char * , int);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldLink;

struct __ecereNameSpace__ecere__sys__OldLink
{
struct __ecereNameSpace__ecere__sys__OldLink * prev;
struct __ecereNameSpace__ecere__sys__OldLink * next;
void *  data;
} __attribute__ ((gcc_struct));

extern char *  __ecereNameSpace__ecere__sys__CopyString(char *  string);

extern void *  memmove(void * , const void * , unsigned int size);

static void __ecereNameSpace__ecere__com__SetDelayedCPValues(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__ClassProperty * _property);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(struct __ecereNameSpace__ecere__sys__BinaryTree * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first;

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(struct __ecereNameSpace__ecere__sys__BTNode * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__sys__BTNode_next;

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, char *  key);

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

static void __ecereNameSpace__ecere__com__FixDerivativesBase(struct __ecereNameSpace__ecere__com__Class * base, struct __ecereNameSpace__ecere__com__Class * mod)
{
struct __ecereNameSpace__ecere__sys__OldLink * derivative;
struct __ecereNameSpace__ecere__sys__OldLink * templateLink;

__ecereNameSpace__ecere__com__ComputeClassParameters(base, strchr(base->name, '<'), (((void *)0)));
for(derivative = base->derivatives.first; derivative; derivative = derivative->next)
{
struct __ecereNameSpace__ecere__com__Class * _class = derivative->data;
int type = _class->type;
int size = _class->structSize - _class->offset;
int oldSizeClass = _class->sizeClass;
int sizeClass = _class->sizeClass - _class->offsetClass;
struct __ecereNameSpace__ecere__com__Class * enumBase = (((void *)0));
char * dataTypeString = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * baseClass;
unsigned int offsetBefore = _class->offset;
int offsetClass, totalSizeClass;

for(baseClass = base; baseClass->base; baseClass = baseClass->base)
;
if(base && !base->internalDecl && (base->type == 5 || base->type == 1 || base->type == 0))
{
if(base->type == 1 && type == 0)
type = 5;
else
type = base->type;
}
if(base && (_class->type == 0 || _class->type == 5 || _class->type == 1) && (base->type == 3 || base->type == 2 || base->type == 4))
{
type = base->type;
}
if(type == 4)
{
if(base->type != 4)
{
enumBase = base;
base = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, "enum");
}
}
dataTypeString = enumBase ? enumBase->dataTypeString : base->dataTypeString;
offsetClass = base ? (base->templateClass ? base->templateClass->sizeClass : base->sizeClass) : (type == 5 ? 0 : 0);
totalSizeClass = offsetClass + sizeClass;
if(type == 0 || type == 5)
_class->offset = (base && (base->templateClass ? base->templateClass->structSize : base->structSize) && base->type != 1000) ? (base->templateClass ? base->templateClass->structSize : base->structSize) : ((type == 5) ? 0 : 12);
if(type == 1)
{
_class->memberOffset = (base && (base->templateClass ? base->templateClass->structSize : base->structSize) && base->type != 1000) ? (base->templateClass ? base->templateClass->structSize : base->structSize) : 0;
_class->typeSize = _class->structSize = _class->memberOffset + size;
}
else if(type == 2 || type == 4 || type == 3)
{
struct __ecereNameSpace__ecere__com__Class * dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, dataTypeString);

if(dataTypeClass)
_class->typeSize = dataTypeClass->typeSize;
_class->structSize = 0;
}
else if(type == 0 || type == 5)
{
_class->structSize = _class->offset + size;
_class->typeSize = sizeof(void *);
}
if(_class->type != 1000)
_class->type = type;
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->dataTypeString), _class->dataTypeString = 0);
_class->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(dataTypeString);
if(totalSizeClass != oldSizeClass)
{
_class->data = __ecereNameSpace__ecere__com__eSystem_Renew(_class->data, sizeof(unsigned char) * (totalSizeClass));
memmove((unsigned char *)_class->data + mod->offsetClass, (unsigned char *)_class->data, totalSizeClass - mod->sizeClass);
if(base->type != 1000 && base->type != 4)
memcpy((unsigned char *)_class->data, (unsigned char *)base->data, totalSizeClass - _class->sizeClass);
else
memset((unsigned char *)_class->data, (unsigned char)0, totalSizeClass - _class->sizeClass);
}
_class->offsetClass = offsetClass;
_class->sizeClass = totalSizeClass;
{
struct __ecereNameSpace__ecere__com__Method * method, * next;
struct __ecereNameSpace__ecere__com__Class * b;
unsigned int needUpdate = (mod != (base->templateClass ? base->templateClass : base) || _class->vTblSize != mod->vTblSize);
int updateStart = -1, updateEnd = -1;

if(mod->base && mod->base->base && mod->base->vTblSize > baseClass->vTblSize && needUpdate)
{
_class->vTblSize += mod->base->vTblSize - baseClass->vTblSize;
_class->_vTbl = __ecereNameSpace__ecere__com__eSystem_Renew(_class->_vTbl, sizeof(void *) * (_class->vTblSize));
memmove(_class->_vTbl + mod->base->vTblSize, _class->_vTbl + baseClass->vTblSize, (_class->vTblSize - mod->vTblSize) * sizeof(void *));
updateStart = baseClass->vTblSize;
updateEnd = updateStart + mod->base->vTblSize - baseClass->vTblSize;
for(method = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->methods); method; method = next)
{
next = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)method));
if(method->type == 1)
method->vid += mod->base->vTblSize - baseClass->vTblSize;
}
}
for(b = mod->base; b && b != (((void *)0)); b = b->base)
{
struct __ecereNameSpace__ecere__com__Method * vMethod;

for(vMethod = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&b->methods); vMethod; vMethod = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)vMethod)))
{
if(vMethod->type == 1)
{
method = (struct __ecereNameSpace__ecere__com__Method *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->methods, vMethod->name);
if(method)
{
if(method->function)
_class->_vTbl[vMethod->vid] = method->function;
if(!method->symbol)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(method->name), method->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(method->dataTypeString), method->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&_class->methods, (struct __ecereNameSpace__ecere__sys__BTNode *)method);
}
else
{
(__ecereNameSpace__ecere__com__eSystem_Delete(method->dataTypeString), method->dataTypeString = 0);
method->type = vMethod->type;
method->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(vMethod->dataTypeString);
method->_class = vMethod->_class;
}
}
else if((vMethod->vid >= updateStart && vMethod->vid < updateEnd) || _class->_vTbl[vMethod->vid] == b->_vTbl[vMethod->vid])
_class->_vTbl[vMethod->vid] = _class->base->_vTbl[vMethod->vid];
}
}
}
}
if(type == 0 || type == 5 || type == 1)
{
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Class * c;

for(c = mod->base; c; c = c->base)
{
struct __ecereNameSpace__ecere__com__Property * _property;

for(_property = c->membersAndProperties.first; _property; _property = _property->next)
{
if(_property->isProperty)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->prop, _property->name);

if(link)
{
prop = link->data;
if(!prop->Set && !prop->Get && prop->memberAccess == 4)
{
struct __ecereNameSpace__ecere__com__SelfWatcher * watcher;

for(watcher = _class->selfWatchers.first; watcher; watcher = watcher->next)
{
if(watcher->_property == prop)
watcher->_property = _property;
}
_property->selfWatchable = 0x1;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&_class->prop, (struct __ecereNameSpace__ecere__sys__BTNode *)link);
(__ecereNameSpace__ecere__com__eSystem_Delete(prop->name), prop->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(prop->dataTypeString), prop->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->membersAndProperties, prop);
}
}
}
}
}
{
for(member = _class->membersAndProperties.first; member; member = member->next)
{
int offsetDiff = _class->offset - offsetBefore;

if(!member->isProperty && offsetDiff > 0)
{
member->offset += offsetDiff;
member->memberOffset += offsetDiff;
}
member->id += mod->base->memberID;
}
_class->memberID += mod->base->memberID;
_class->startMemberID += mod->base->memberID;
}
}
__ecereNameSpace__ecere__com__FixDerivativesBase(_class, mod);
{
struct __ecereNameSpace__ecere__com__Class * c;

for(c = mod->base; c; c = c->base)
{
struct __ecereNameSpace__ecere__com__ClassProperty * _property;

for(_property = (struct __ecereNameSpace__ecere__com__ClassProperty *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&c->classProperties); _property; _property = (struct __ecereNameSpace__ecere__com__ClassProperty *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)_property)))
{
__ecereNameSpace__ecere__com__SetDelayedCPValues(_class, _property);
}
}
}
}
{
struct __ecereNameSpace__ecere__sys__OldLink * templateLink;

for(templateLink = base->templatized.first; templateLink; templateLink = templateLink->next)
{
struct __ecereNameSpace__ecere__com__Class * template = templateLink->data;
char * templateParams = strchr(template->name, '<');

template->base = base->base;
template->_vTbl = base->_vTbl;
template->data = base->data;
template->offset = base->offset;
template->offsetClass = base->offsetClass;
template->sizeClass = base->sizeClass;
template->structSize = base->structSize;
template->vTblSize = base->vTblSize;
__ecereNameSpace__ecere__com__FixDerivativesBase(template, mod);
}
}
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Application;

struct __ecereNameSpace__ecere__com__Application
{
int argc;
char * *  argv;
int exitCode;
unsigned int isGUIApp;
struct __ecereNameSpace__ecere__sys__OldList allModules;
char *  parsedCommand;
struct __ecereNameSpace__ecere__com__NameSpace systemNameSpace;
} __attribute__ ((gcc_struct));

extern char *  strncpy(char * , const char * , int n);

extern int strcmp(const char * , const char * );

static void __ecereNameSpace__ecere__com__FreeTemplatesDerivatives(struct __ecereNameSpace__ecere__com__Class * base);

extern int printf(char * , ...);

static void __ecereNameSpace__ecere__com__NameSpace_Free(struct __ecereNameSpace__ecere__com__NameSpace * parentNameSpace);

static struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereNameSpace__ecere__com__SearchNameSpace(struct __ecereNameSpace__ecere__com__NameSpace * nameSpace, char *  name, void *  listOffset);

extern char *  strcpy(char * , const char * );

static void __ecereNameSpace__ecere__com__FreeTemplateArgs(struct __ecereNameSpace__ecere__com__Class * template);

static void __ecereNameSpace__ecere__com__CopyTemplateArg(struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * arg);

int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, char *  a, char *  b);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

struct __ecereNameSpace__ecere__sys__OldLink * __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindLink(struct __ecereNameSpace__ecere__sys__OldList * this, void *  data);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, char * name, char * baseName, int size, int sizeClass, unsigned int (* Constructor)(void *), void (* Destructor)(void *), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess)
{
void * __ecereTemp1;
int start = 0, c;
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace = (((void *)0));
unsigned int force64Bits = ((unsigned int)((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 300)))->isGUIApp & 2) ? 0x1 : 0x0;

{
nameSpace = (declMode == 1) ? &((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->publicNameSpace : &((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->privateNameSpace;
if(declMode == 4)
nameSpace = &((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 300)))->systemNameSpace;
{
for(c = 0; name[c]; c++)
{
if(name[c] == '.' || (name[c] == ':' && name[c + 1] == ':'))
{
struct __ecereNameSpace__ecere__com__NameSpace * newSpace;
char * spaceName = __ecereNameSpace__ecere__com___malloc(c - start + 1);

strncpy(spaceName, name + start, c - start);
spaceName[c - start] = '\0';
newSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*nameSpace).nameSpaces, spaceName);
if(!newSpace)
{
newSpace = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__NameSpace) * (1));
(*newSpace).classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).name = spaceName;
(*newSpace).parent = nameSpace;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*nameSpace).nameSpaces, (struct __ecereNameSpace__ecere__sys__BTNode *)newSpace);
}
else
(__ecereNameSpace__ecere__com__eSystem_Delete(spaceName), spaceName = 0);
nameSpace = newSpace;
if(name[c] == ':')
c++;
start = c + 1;
}
}
}
}
if(c - start)
{
int offsetClass;
int totalSizeClass;
struct __ecereNameSpace__ecere__com__BTNamedLink * classLink = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * _class = (((void *)0));
char * dataTypeString = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * enumBase = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * base = (baseName && baseName[0]) ? __ecereNameSpace__ecere__com__eSystem_FindClass(module, baseName) : (((void *)0));
unsigned int refine = 0x0;

if(base && !base->internalDecl && (base->type == 5 || base->type == 1 || base->type == 0))
{
if(base->type == 1 && type == 0)
type = 5;
else
type = base->type;
}
if(base && (type == 0 || type == 5 || type == 1) && (base->type == 3 || base->type == 2 || base->type == 4))
{
type = base->type;
}
if(!base || base->type == 1000)
{
if(type == 4)
{
if(base || !baseName || !baseName[0] || !strcmp(baseName, "unsigned int") || !strcmp(baseName, "uint") || !strcmp(baseName, "unsigned int64") || !strcmp(baseName, "uint64") || !strcmp(baseName, "int64") || !strcmp(baseName, "unsigned short") || !strcmp(baseName, "short") || !strcmp(baseName, "unsigned char") || !strcmp(baseName, "byte") || !strcmp(baseName, "char") || !strcmp(baseName, "uint32") || !strcmp(baseName, "uint16"))
{
base = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "enum");
dataTypeString = (baseName && baseName[0]) ? baseName : "int";
}
else
{
base = __ecereNameSpace__ecere__com__eSystem_RegisterClass((int)0, baseName, (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, declMode, 1);
base->internalDecl = 0x1;
enumBase = base;
base = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "enum");
}
}
else if(type == 1 && (!baseName || !baseName[0]))
{
base = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "struct");
dataTypeString = name + start;
}
else
{
if(type == 0)
dataTypeString = "struct __ecereNameSpace__ecere__com__Instance";
else if(type == 5)
dataTypeString = "void *";
else if(type == 2)
dataTypeString = (baseName && baseName[0]) ? baseName : "unsigned int";
else if(type == 3)
dataTypeString = (baseName && baseName[0]) ? baseName : "int";
else if(type == 1)
dataTypeString = name + start;
if(base || (!baseName || !baseName[0]) || type == 2 || type == 3)
{
if(base || !baseName || !baseName[0] || !strcmp(baseName, "unsigned int") || !strcmp(baseName, "uint") || !strcmp(baseName, "unsigned int64") || !strcmp(baseName, "uint64") || !strcmp(baseName, "int64") || !strcmp(baseName, "unsigned short") || !strcmp(baseName, "short") || !strcmp(baseName, "unsigned char") || !strcmp(baseName, "byte") || !strcmp(baseName, "char") || !strcmp(baseName, "uint32") || !strcmp(baseName, "uint16"))
{
if(type == 0 && strcmp(name, "ecere::com::Instance") && strcmp(name, "enum") && strcmp(name, "struct"))
base = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Instance");
else
base = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "class");
}
}
else
{
}
}
}
else
{
if(type == 4)
{
if(base->type != 4)
{
enumBase = base;
base = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "enum");
}
}
dataTypeString = enumBase ? enumBase->dataTypeString : base->dataTypeString;
}
offsetClass = base ? base->sizeClass : (type == 5 ? 0 : 0);
totalSizeClass = offsetClass + sizeClass;
if((_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, name)))
{
__ecereNameSpace__ecere__com__FreeTemplatesDerivatives(_class);
if(!_class->internalDecl)
{
if(declMode != 4)
printf("error: Redefinition of class %s\n", name);
else
{
_class->comRedefinition = 0x1;
return _class;
}
return (((void *)0));
}
classLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*_class->nameSpace).classes, name + start);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*_class->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)classLink);
{
struct __ecereNameSpace__ecere__sys__OldLink * t;

for(t = _class->templatized.first; t; t = t->next)
{
struct __ecereNameSpace__ecere__com__Class * template = t->data;

classLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*_class->nameSpace).classes, template->name);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*_class->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)classLink);
}
}
{
struct __ecereNameSpace__ecere__com__NameSpace * ns = _class->nameSpace;

while((*ns).parent && !__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&(*ns).classes) && !__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&(*ns).functions) && !__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&(*ns).defines) && !__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&(*ns).nameSpaces))
{
struct __ecereNameSpace__ecere__com__NameSpace * parent = (*ns).parent;

__ecereNameSpace__ecere__com__NameSpace_Free(ns);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*parent).nameSpaces, (struct __ecereNameSpace__ecere__sys__BTNode *)ns);
ns = parent;
}
}
refine = 0x1;
}
else
{
classLink = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 12)))->privateNameSpace, name, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes);
if(!classLink)
classLink = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 12)))->publicNameSpace, name, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes);
if(!classLink)
classLink = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 12)))->privateNameSpace, name + start, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes);
if(!classLink)
classLink = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 12)))->publicNameSpace, name + start, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes);
if(classLink)
_class = classLink->data;
if(_class && _class->internalDecl)
{
__ecereNameSpace__ecere__com__FreeTemplatesDerivatives(_class);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*_class->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)classLink);
{
struct __ecereNameSpace__ecere__sys__OldLink * t;

for(t = _class->templatized.first; t; t = t->next)
{
struct __ecereNameSpace__ecere__com__Class * template = t->data;

classLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*_class->nameSpace).classes, template->name);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*_class->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)classLink);
}
}
refine = 0x1;
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->fullName), _class->fullName = 0);
_class->fullName = __ecereNameSpace__ecere__sys__CopyString(name);
}
else
{
_class = __ecereNameSpace__ecere__com___calloc(1, sizeof(struct __ecereNameSpace__ecere__com__Class));
_class->methods.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
_class->members.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
_class->prop.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
_class->classProperties.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
_class->name = __ecereNameSpace__ecere__sys__CopyString(name + start);
_class->fullName = __ecereNameSpace__ecere__sys__CopyString(name);
}
}
if(nameSpace)
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(24), ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->name = _class->name, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->data = _class, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)));
{
struct __ecereNameSpace__ecere__sys__OldLink * t;

for(t = _class->templatized.first; t; t = t->next)
{
struct __ecereNameSpace__ecere__com__Class * template = t->data;

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(24), ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->name = template->name, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->data = template, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)));
}
}
}
if(_class)
{
if(!base && baseName && strcmp(baseName, name))
{
if(strchr(baseName, '<'))
{
char templateClassName[1024];
struct __ecereNameSpace__ecere__com__Class * templateBase;

strcpy(templateClassName, baseName);
*strchr(templateClassName, '<') = '\0';
templateBase = __ecereNameSpace__ecere__com__eSystem_FindClass(module, templateClassName);
if(!templateBase)
{
templateBase = __ecereNameSpace__ecere__com__eSystem_RegisterClass((int)0, templateClassName, (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, declMode, 1);
templateBase->internalDecl = 0x1;
}
base = __ecereNameSpace__ecere__com__eSystem_FindClass(module, baseName);
}
else
{
base = __ecereNameSpace__ecere__com__eSystem_RegisterClass((int)0, baseName, (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, declMode, 1);
base->internalDecl = 0x1;
}
}
else
_class->internalDecl = 0x0;
if(totalSizeClass)
{
_class->data = __ecereNameSpace__ecere__com__eSystem_Renew(_class->data, sizeof(unsigned char) * (totalSizeClass));
if(base && base->type != 1000 && base->type != 4)
memcpy(_class->data, base->data, offsetClass);
else
memset(_class->data, (unsigned char)0, offsetClass);
memset((unsigned char *)_class->data + offsetClass, (unsigned char)0, sizeClass);
}
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->dataTypeString), _class->dataTypeString = 0);
_class->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(dataTypeString);
_class->defaultAlignment = base ? base->defaultAlignment : 0;
if(_class->module)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)_class->module + 12)))->classes, _class);
}
if(_class->base)
{
struct __ecereNameSpace__ecere__com__Class * base = _class->base;
struct __ecereNameSpace__ecere__sys__OldLink * deriv = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindLink(&base->derivatives, _class);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&base->derivatives, deriv);
}
if(module)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->classes, _class);
}
_class->nameSpace = nameSpace;
{
struct __ecereNameSpace__ecere__sys__OldLink * t;

for(t = _class->templatized.first; t; t = t->next)
{
struct __ecereNameSpace__ecere__com__Class * template = t->data;

template->nameSpace = nameSpace;
}
}
_class->module = module;
_class->base = base;
if(base)
{
int numParams = 0;
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = base; sClass; sClass = sClass->base)
{
if(sClass->templateClass)
sClass = sClass->templateClass;
numParams += sClass->templateParams.count;
}
if(numParams)
{
if(_class->templateArgs)
{
__ecereNameSpace__ecere__com__FreeTemplateArgs(_class);
}
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->templateArgs), _class->templateArgs = 0);
_class->templateArgs = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__ClassTemplateArgument) * (numParams));
_class->numParams = numParams;
for(sClass = _class; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__Class * prevClass;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;
int id = 0;

if(sClass->templateClass)
sClass = sClass->templateClass;
for(prevClass = sClass->base; prevClass; prevClass = prevClass->base)
{
if(prevClass->templateClass)
prevClass = prevClass->templateClass;
id += prevClass->templateParams.count;
}
if(base->templateArgs)
{
for(param = sClass->templateParams.first; param; param = param->next)
{
_class->templateArgs[id] = base->templateArgs[id];
__ecereNameSpace__ecere__com__CopyTemplateArg(param, &_class->templateArgs[id]);
id++;
}
}
}
}
}
_class->memberID = _class->startMemberID = (base && (type == 0 || type == 5 || type == 1)) ? base->memberID : 0;
if(type == 0 || type == 5)
_class->offset = (base && base->structSize && base->type != 1000) ? base->structSize : ((type == 5) ? 0 : (force64Bits ? 24 : 12));
if(type == 1)
{
_class->memberOffset = (base && base->structSize && base->type != 1000) ? base->structSize : 0;
_class->typeSize = _class->structSize = _class->memberOffset + size;
}
else if(type == 2 || type == 4 || type == 3)
{
struct __ecereNameSpace__ecere__com__Class * dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, dataTypeString);

if(dataTypeClass)
_class->typeSize = dataTypeClass->typeSize;
_class->structSize = 0;
}
else if(type == 0 || type == 5)
{
_class->structSize = _class->offset + size;
_class->typeSize = sizeof(void *);
}
_class->offsetClass = offsetClass;
_class->sizeClass = totalSizeClass;
_class->Constructor = (void *)Constructor;
_class->Destructor = Destructor;
if(_class->type != 1000)
_class->type = type;
if(!size)
_class->computeSize = 0x1;
else
_class->computeSize = 0x0;
_class->inheritanceAccess = inheritanceAccess;
if(type == 4)
{
if(enumBase)
_class->base = base = enumBase;
{
struct __ecereNameSpace__ecere__com__EnumClassData * data = (struct __ecereNameSpace__ecere__com__EnumClassData *)_class->data;

if(base && base->type != 4)
data->largest = -1;
else
data->largest = ((struct __ecereNameSpace__ecere__com__EnumClassData *)base->data)->largest;
}
}
if(base && base->vTblSize)
{
_class->vTblSize = base->vTblSize;
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->_vTbl), _class->_vTbl = 0);
_class->_vTbl = __ecereNameSpace__ecere__com___malloc(sizeof(int (*)()) * _class->vTblSize);
memcpy(_class->_vTbl, base->_vTbl, sizeof(int (*)()) * _class->vTblSize);
}
if(_class->base)
{
struct __ecereNameSpace__ecere__sys__OldLink * link = (link = __ecereNameSpace__ecere__com__eSystem_New0(12), link->data = _class, link);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->base->derivatives, link);
}
__ecereNameSpace__ecere__com__FixDerivativesBase(_class, _class);
return _class;
}
}
return (((void *)0));
}

static void __ecereNameSpace__ecere__com__DataMember_Free(struct __ecereNameSpace__ecere__com__DataMember * parentMember)
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__BTNamedLink * namedLink;

(__ecereNameSpace__ecere__com__eSystem_Delete(parentMember->name), parentMember->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(parentMember->dataTypeString), parentMember->dataTypeString = 0);
while((member = parentMember->members.first))
{
__ecereNameSpace__ecere__com__DataMember_Free(member);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&parentMember->members, member);
}
while((namedLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&parentMember->membersAlpha)))
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&parentMember->membersAlpha, (struct __ecereNameSpace__ecere__sys__BTNode *)namedLink);
}
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__NamedLink;

struct __ecereNameSpace__ecere__sys__NamedLink
{
struct __ecereNameSpace__ecere__sys__NamedLink * prev;
struct __ecereNameSpace__ecere__sys__NamedLink * next;
char *  name;
void *  data;
} __attribute__ ((gcc_struct));

static void __ecereNameSpace__ecere__com__FreeEnumValue(struct __ecereNameSpace__ecere__sys__NamedLink * value)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(value->name), value->name = 0);
}

static void __ecereNameSpace__ecere__com__FreeTemplateArg(struct __ecereNameSpace__ecere__com__Class * template, struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param, int id)
{
switch(param->type)
{
case 0:
(__ecereNameSpace__ecere__com__eSystem_Delete(template->templateArgs[id].dataTypeString), template->templateArgs[id].dataTypeString = 0);
break;
case 1:
(__ecereNameSpace__ecere__com__eSystem_Delete(template->templateArgs[id].memberString), template->templateArgs[id].memberString = 0);
break;
case 2:
break;
}
}

static void __ecereNameSpace__ecere__com__FreeTemplateArgs(struct __ecereNameSpace__ecere__com__Class * template)
{
if(template->templateArgs)
{
struct __ecereNameSpace__ecere__com__Class * _class;

for(_class = template; _class; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__Class * prevClass;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;
int id = 0;

if(_class->templateClass)
_class = _class->templateClass;
for(prevClass = _class->base; prevClass; prevClass = prevClass->base)
{
if(prevClass->templateClass)
prevClass = prevClass->templateClass;
id += prevClass->templateParams.count;
}
if(id < template->numParams)
{
for(param = _class->templateParams.first; param; param = param->next)
{
switch(param->type)
{
case 0:
(__ecereNameSpace__ecere__com__eSystem_Delete(template->templateArgs[id].dataTypeString), template->templateArgs[id].dataTypeString = 0);
break;
case 1:
(__ecereNameSpace__ecere__com__eSystem_Delete(template->templateArgs[id].memberString), template->templateArgs[id].memberString = 0);
break;
case 2:
break;
}
id++;
}
}
}
}
}

static void __ecereNameSpace__ecere__com__FreeTemplate(struct __ecereNameSpace__ecere__com__Class * template)
{
struct __ecereNameSpace__ecere__sys__OldLink * deriv;

if(template->nameSpace)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*template->nameSpace).classes, template->name);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*template->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)link);
}
__ecereNameSpace__ecere__com__FreeTemplateArgs(template);
(__ecereNameSpace__ecere__com__eSystem_Delete(template->fullName), template->fullName = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(template->name), template->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(template->templateArgs), template->templateArgs = 0);
while((deriv = template->derivatives.first))
{
((struct __ecereNameSpace__ecere__com__Class *)deriv->data)->base = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&template->derivatives, deriv);
}
__ecereNameSpace__ecere__com___free(template);
}

static void __ecereNameSpace__ecere__com__FreeTemplates(struct __ecereNameSpace__ecere__com__Class * _class)
{
struct __ecereNameSpace__ecere__sys__OldLink * deriv, * template;

for(deriv = _class->derivatives.first; deriv; deriv = deriv->next)
{
__ecereNameSpace__ecere__com__FreeTemplates(deriv->data);
}
__ecereNameSpace__ecere__com__FreeTemplateArgs(_class);
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->templateArgs), _class->templateArgs = 0);
while((template = _class->templatized.first))
{
__ecereNameSpace__ecere__com__FreeTemplates(template->data);
__ecereNameSpace__ecere__com__FreeTemplate(template->data);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->templatized, template);
}
}

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(struct __ecereNameSpace__ecere__sys__OldList * this, void (*  freeFn)(void * ));

void __ecereNameSpace__ecere__com__eClass_Unregister(struct __ecereNameSpace__ecere__com__Class * _class)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * namedLink;
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Method * method;
struct __ecereNameSpace__ecere__sys__OldLink * deriv, * template;
struct __ecereNameSpace__ecere__com__ClassProperty * classProp;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

(__ecereNameSpace__ecere__com__eSystem_Delete(_class->_vTbl), _class->_vTbl = 0);
__ecereNameSpace__ecere__com__FreeTemplates(_class);
__ecereNameSpace__ecere__com__FreeTemplateArgs(_class);
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->templateArgs), _class->templateArgs = 0);
while((template = _class->templatized.first))
{
__ecereNameSpace__ecere__com__FreeTemplate(template->data);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->templatized, template);
}
while((member = _class->membersAndProperties.first))
{
if(!member->isProperty && (member->type == 1 || member->type == 2))
__ecereNameSpace__ecere__com__DataMember_Free(member);
(__ecereNameSpace__ecere__com__eSystem_Delete(member->name), member->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(member->dataTypeString), member->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->membersAndProperties, member);
}
while((member = _class->conversions.first))
{
(__ecereNameSpace__ecere__com__eSystem_Delete(member->name), member->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(member->dataTypeString), member->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->conversions, member);
}
while((namedLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->prop)))
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&_class->prop, (struct __ecereNameSpace__ecere__sys__BTNode *)namedLink);
}
while((namedLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->members)))
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&_class->members, (struct __ecereNameSpace__ecere__sys__BTNode *)namedLink);
}
while((classProp = (struct __ecereNameSpace__ecere__com__ClassProperty *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->classProperties)))
{
(__ecereNameSpace__ecere__com__eSystem_Delete(classProp->name), classProp->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(classProp->dataTypeString), classProp->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&_class->classProperties, (struct __ecereNameSpace__ecere__sys__BTNode *)classProp);
}
while((method = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->methods)))
{
(__ecereNameSpace__ecere__com__eSystem_Delete(method->name), method->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(method->dataTypeString), method->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&_class->methods, (struct __ecereNameSpace__ecere__sys__BTNode *)method);
}
if(_class->type == 4)
{
struct __ecereNameSpace__ecere__com__EnumClassData * data = (struct __ecereNameSpace__ecere__com__EnumClassData *)_class->data;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&data->values, (void *)__ecereNameSpace__ecere__com__FreeEnumValue);
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&_class->delayedCPValues, (((void *)0)));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&_class->selfWatchers, (((void *)0)));
if(_class->base)
{
struct __ecereNameSpace__ecere__com__Class * base = _class->base;

for(deriv = base->derivatives.first; deriv; deriv = deriv->next)
{
if(deriv->data == _class)
break;
}
if(deriv)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&base->derivatives, deriv);
}
while((deriv = _class->derivatives.first))
{
((struct __ecereNameSpace__ecere__com__Class *)deriv->data)->base = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->derivatives, deriv);
}
if(_class->nameSpace)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*_class->nameSpace).classes, _class->name);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*_class->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)link);
}
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->name), _class->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->fullName), _class->fullName = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->dataTypeString), _class->dataTypeString = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->data), _class->data = 0);
while((param = _class->templateParams.first))
{
switch(param->type)
{
case 0:
(__ecereNameSpace__ecere__com__eSystem_Delete(param->defaultArg.dataTypeString), param->defaultArg.dataTypeString = 0);
break;
case 1:
(__ecereNameSpace__ecere__com__eSystem_Delete(param->defaultArg.memberString), param->defaultArg.memberString = 0);
break;
case 2:
break;
}
if(param->type != 1)
(__ecereNameSpace__ecere__com__eSystem_Delete(param->dataTypeString), param->dataTypeString = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(param->name), param->name = 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->templateParams, param);
}
__ecereNameSpace__ecere__com___free(_class);
}

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Find(struct __ecereNameSpace__ecere__sys__BinaryTree * this, uintptr_t key);

static struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereNameSpace__ecere__com__ScanNameSpace(struct __ecereNameSpace__ecere__com__NameSpace * nameSpace, char * name, void * listOffset)
{
struct __ecereNameSpace__ecere__sys__BinaryTree * tree = (struct __ecereNameSpace__ecere__sys__BinaryTree *)((unsigned char *)nameSpace + (unsigned int)listOffset);
struct __ecereNameSpace__ecere__com__BTNamedLink * link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Find((&*tree), (uintptr_t)name);
struct __ecereNameSpace__ecere__com__NameSpace * child;

if(!link)
{
for(child = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&nameSpace->nameSpaces); child; child = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)child)))
{
link = __ecereNameSpace__ecere__com__ScanNameSpace(child, name, listOffset);
if(link)
break;
}
}
return link;
}

static struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereNameSpace__ecere__com__SearchNameSpace(struct __ecereNameSpace__ecere__com__NameSpace * nameSpace, char * name, void * listOffset)
{
int start = 0, c;
char ch;
int level = 0;

for(c = 0; (ch = name[c]); c++)
{
if(ch == '<')
level++;
if(ch == '>')
level--;
if(level == 0 && (ch == '.' || (ch == ':' && name[c + 1] == ':')))
{
struct __ecereNameSpace__ecere__com__NameSpace * newSpace;
char * spaceName = __ecereNameSpace__ecere__com___malloc(c - start + 1);

memcpy(spaceName, name + start, c - start);
spaceName[c - start] = '\0';
newSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&nameSpace->nameSpaces, spaceName);
__ecereNameSpace__ecere__com___free(spaceName);
if(!newSpace)
return (((void *)0));
nameSpace = newSpace;
if(level == 0 && ch == ':')
c++;
start = c + 1;
}
}
if(c - start)
{
return __ecereNameSpace__ecere__com__ScanNameSpace(nameSpace, name + start, listOffset);
}
return (((void *)0));
}

static struct __ecereNameSpace__ecere__com__BTNamedLink * __ecereNameSpace__ecere__com__SearchModule(struct __ecereNameSpace__ecere__com__Instance * module, char * name, void * listOffset, unsigned int searchPrivate)
{
struct __ecereNameSpace__ecere__com__SubModule * subModule;
struct __ecereNameSpace__ecere__com__BTNamedLink * link;

if(searchPrivate)
{
link = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->privateNameSpace, name, listOffset);
if(link)
return link;
}
link = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->publicNameSpace, name, listOffset);
if(link)
return link;
for(subModule = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->modules.first; subModule; subModule = subModule->next)
{
if(searchPrivate || subModule->importMode == 1)
{
link = __ecereNameSpace__ecere__com__SearchModule(subModule->module, name, listOffset, 0x0);
if(link)
return link;
}
}
return (((void *)0));
}

extern int isspace(int c);

long long __ecereNameSpace__ecere__com___strtoi64(char * string, char ** endString, int base)
{
long long value = 0;
int sign = 1;
int c;
char ch;

for(c = 0; (ch = string[c]) && isspace(ch); c++)
;
if(ch == '+')
c++;
else if(ch == '-')
{
sign = -1;
c++;
}
;
if(!base)
{
if(ch == (char)0 && string[c + 1] == 'x')
{
base = 16;
c += 2;
}
else if(ch == '0')
{
base = 8;
c++;
}
else
base = 10;
}
for(; (ch = string[c]); c++)
{
if(ch == '0')
ch = (char)0;
else if(ch >= '1' && ch <= '9')
ch -= '1';
else if(ch >= 'a' && ch <= 'z')
ch -= 'a';
else if(ch >= 'A' && ch <= 'Z')
ch -= 'A';
else
{
*endString = string + c;
break;
}
if(ch < base)
{
value *= base;
value += ch;
}
else
{
*endString = string + c;
break;
}
}
return sign * value;
}

uint64 __ecereNameSpace__ecere__com___strtoui64(char * string, char ** endString, int base)
{
uint64 value = 0;
int sign = 1;
int c;
char ch;

for(c = 0; (ch = string[c]) && isspace(ch); c++)
;
if(ch == '+')
c++;
else if(ch == '-')
{
sign = -1;
c++;
}
;
if(!base)
{
if(ch == (char)0 && string[c + 1] == 'x')
{
base = 16;
c += 2;
}
else if(ch == '0')
{
base = 8;
c++;
}
else
base = 10;
}
for(; (ch = string[c]); c++)
{
if(ch == '0')
ch = (char)0;
else if(ch >= '1' && ch <= '9')
ch -= '1';
else if(ch >= 'a' && ch <= 'z')
ch -= 'a';
else if(ch >= 'A' && ch <= 'Z')
ch -= 'A';
else
{
*endString = string + c;
break;
}
if(ch < base)
{
value *= base;
value += ch;
}
else
{
*endString = string + c;
break;
}
}
return sign * value;
}

extern char *  strcat(char * , const char * );

extern int strlen(const char * );

struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, char * name)
{
void * __ecereTemp1;

if(name && module)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link;

link = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 300)))->systemNameSpace, name, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes);
if(link)
return link->data;
link = __ecereNameSpace__ecere__com__SearchModule(module, name, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes, 0x1);
if(link)
return link->data;
{
char noTemplateName[1024];
char * templateParams = strchr(name, '<');

if(templateParams)
{
strncpy(noTemplateName, name, templateParams - name);
noTemplateName[templateParams - name] = '\0';
}
else
strcpy(noTemplateName, name);
link = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 300)))->systemNameSpace, noTemplateName, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes);
if(!link)
link = __ecereNameSpace__ecere__com__SearchModule(module, noTemplateName, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes, 0x1);
if(link)
{
struct __ecereNameSpace__ecere__com__Class * _class = link->data;
struct __ecereNameSpace__ecere__com__Class * templatedClass = (((void *)0));
char className[1024];

strcpy(className, _class->fullName);
strcat(className, templateParams);
link = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 300)))->systemNameSpace, className, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes);
if(link)
return link->data;
link = __ecereNameSpace__ecere__com__SearchModule(module, className, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).classes, 0x1);
if(link)
return link->data;
if(_class && templateParams)
{
struct __ecereNameSpace__ecere__sys__OldList __simpleStruct1 = 
{
0, 0, 0, 0, 0
};
struct __ecereNameSpace__ecere__sys__OldList __simpleStruct0 = 
{
0, 0, 0, 0, 0
};

templatedClass = __ecereNameSpace__ecere__com__eSystem_New0(368);
*templatedClass = *_class;
templatedClass->templateClass = _class;
templatedClass->fullName = __ecereNameSpace__ecere__sys__CopyString(className);
templatedClass->name = __ecereNameSpace__ecere__sys__CopyString(templatedClass->fullName + strlen(_class->fullName) - strlen(_class->name));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*templatedClass->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(24), ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->name = templatedClass->name, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->data = templatedClass, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)));
templatedClass->templateArgs = (((void *)0));
templatedClass->numParams = 0;
templatedClass->derivatives = __simpleStruct0;
templatedClass->templatized = __simpleStruct1;
__ecereNameSpace__ecere__com__ComputeClassParameters(templatedClass, templateParams, module);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->templatized, (__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(12), ((struct __ecereNameSpace__ecere__sys__OldLink *)__ecereTemp1)->data = templatedClass, ((struct __ecereNameSpace__ecere__sys__OldLink *)__ecereTemp1)));
}
return templatedClass;
}
}
}
return (((void *)0));
}

static void __ecereNameSpace__ecere__com__CopyTemplateArg(struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * arg)
{
switch(param->type)
{
case 0:
arg->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(arg->dataTypeString);
break;
case 2:
break;
case 1:
arg->memberString = __ecereNameSpace__ecere__sys__CopyString(arg->memberString);
break;
}
}

extern char *  __ecereNameSpace__ecere__sys__TrimRSpaces(char *  string, char *  output);

extern unsigned long strtoul(const char *  nptr, char * *  endptr, int base);

extern double strtod(char * , char * * );

extern int sprintf(char * , char * , ...);

extern char *  strstr(char * , const char * );

struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

static void __ecereNameSpace__ecere__com__ComputeClassParameters(struct __ecereNameSpace__ecere__com__Class * templatedClass, char * templateParams, struct __ecereNameSpace__ecere__com__Instance * findModule)
{
char ch;
char * nextParamStart = templateParams ? (templateParams + 1) : (((void *)0));
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * curParam = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * lastClass = (((void *)0)), * sClass;
int curParamID = 0;
int numParams = 0;
struct __ecereNameSpace__ecere__com__Class * _class = templatedClass->templateClass ? templatedClass->templateClass : templatedClass;

for(sClass = _class; sClass; sClass = sClass->base)
{
if(sClass->templateClass)
sClass = sClass->templateClass;
numParams += sClass->templateParams.count;
}
if(templatedClass->templateArgs)
__ecereNameSpace__ecere__com__FreeTemplateArgs(templatedClass);
(__ecereNameSpace__ecere__com__eSystem_Delete(templatedClass->templateArgs), templatedClass->templateArgs = 0);
templatedClass->templateArgs = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__ClassTemplateArgument) * (numParams));
templatedClass->numParams = numParams;
if(_class != templatedClass)
{
}
if(templatedClass->base && templatedClass->base->templateArgs && _class == templatedClass)
{
struct __ecereNameSpace__ecere__com__Class * sClass;

memcpy(templatedClass->templateArgs, templatedClass->base->templateArgs, sizeof(struct __ecereNameSpace__ecere__com__ClassTemplateArgument) * (numParams - templatedClass->templateParams.count));
for(sClass = templatedClass->base; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;
struct __ecereNameSpace__ecere__com__Class * prevClass;
int id = 0;

for(prevClass = sClass->base; prevClass; prevClass = prevClass->base)
{
if(prevClass->templateClass)
prevClass = prevClass->templateClass;
id += prevClass->templateParams.count;
}
if(sClass->templateClass)
sClass = sClass->templateClass;
for(param = sClass->templateParams.first; param; param = param->next)
__ecereNameSpace__ecere__com__CopyTemplateArg(param, &templatedClass->templateArgs[id++]);
}
}
while(nextParamStart)
{
char * paramStart = nextParamStart;
char * paramEnd;
int level = 0;

while(*paramStart == ' ')
paramStart++;
paramEnd = paramStart;
while((ch = *paramEnd, ch && (level > 0 || (ch != '>' && ch != ','))))
{
if(ch == '<')
level++;
if(ch == '>')
level--;
paramEnd++;
}
nextParamStart = (ch == ',') ? (paramEnd + 1) : (((void *)0));
while(*paramEnd == ' ')
paramEnd--;
if(paramEnd > paramStart)
{
char * ptr, * equal = (((void *)0));

for(ptr = paramStart; ptr <= paramEnd; ptr++)
{
if(*ptr == '=')
{
equal = ptr;
break;
}
}
if(equal)
{
char * end = equal - 1;
char ident[1024];

while(*end == ' ')
end--;
strncpy(ident, paramStart, end + 1 - paramStart);
ident[end + 1 - paramStart] = (char)0;
for(sClass = _class; sClass; sClass = sClass->base)
{
if(sClass->templateClass)
sClass = sClass->templateClass;
for(curParam = sClass->templateParams.first; curParam; curParam = curParam->next)
{
if(!strcmp(curParam->name, ident))
break;
}
if(curParam)
{
struct __ecereNameSpace__ecere__com__Class * nextClass;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * prevParam;

curParamID = 0;
for(prevParam = curParam->prev; prevParam; prevParam = prevParam->prev)
curParamID++;
for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
{
if(nextClass->templateClass)
nextClass = nextClass->templateClass;
curParamID += nextClass->templateParams.count;
}
break;
}
}
lastClass = sClass;
}
else
{
if(curParam)
{
curParam = curParam->next;
curParamID++;
}
if(!curParam)
{
for(sClass = lastClass ? lastClass->base : _class; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

curParamID = 0;
if(sClass->templateClass)
sClass = sClass->templateClass;
for(param = sClass->templateParams.first; param; param = param->next, curParamID++)
{
curParam = param;
break;
}
if(curParam)
{
struct __ecereNameSpace__ecere__com__Class * nextClass;

for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
{
if(nextClass->templateClass)
nextClass = nextClass->templateClass;
curParamID += nextClass->templateParams.count;
}
lastClass = sClass;
break;
}
}
}
}
if(curParam)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument argument = 
{
0, 0, 0, 0, 0
};
char value[1024];

if(equal)
{
equal++;
while(*equal == ' ')
equal++;
memcpy(value, equal, paramEnd - equal);
value[paramEnd - equal] = (char)0;
}
else
{
memcpy(value, paramStart, paramEnd - paramStart);
value[paramEnd - paramStart] = (char)0;
}
__ecereNameSpace__ecere__sys__TrimRSpaces(value, value);
switch(curParam->type)
{
case 0:
argument.dataTypeString = __ecereNameSpace__ecere__sys__CopyString(value);
argument.dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, value);
if(!argument.dataTypeClass)
argument.dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)_class->module + 12)))->application, value);
if(!argument.dataTypeClass)
argument.dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(findModule, value);
break;
case 2:
{
struct __ecereNameSpace__ecere__com__Class * expClass = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, curParam->dataTypeString);

if(!expClass)
expClass = __ecereNameSpace__ecere__com__eSystem_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)_class->module + 12)))->application, curParam->dataTypeString);
if(expClass)
{
expClass->_vTbl[__ecereVMethodID_class_OnGetDataFromString](expClass, &argument.expression, value);
}
else if(value[0] == '\"')
{
char * endQuote = value + strlen(value) - 1;

if(*endQuote != '\"')
endQuote++;
*endQuote = '\0';
argument.expression.p = __ecereNameSpace__ecere__sys__CopyString(value + 1);
}
else if(value[0] == '\'')
{
int nb;
unsigned int ch = __ecereNameSpace__ecere__sys__UTF8GetChar(value + 1, &nb);

argument.expression.ui = ch;
}
else if(!strcmp(curParam->dataTypeString, "uint"))
{
argument.expression.ui = strtoul(value, (((void *)0)), 0);
}
else if(!strcmp(curParam->dataTypeString, "char"))
{
argument.expression.c = (char)strtol(value, (((void *)0)), 0);
}
else if(!strcmp(curParam->dataTypeString, "byte"))
{
argument.expression.uc = (unsigned char)strtoul(value, (((void *)0)), 0);
}
else if(!strcmp(curParam->dataTypeString, "short"))
{
argument.expression.s = (short)strtol(value, (((void *)0)), 0);
}
else if(!strcmp(curParam->dataTypeString, "uint16"))
{
argument.expression.us = (unsigned short)strtoul(value, (((void *)0)), 0);
}
else if(!strcmp(curParam->dataTypeString, "int64"))
{
argument.expression.i64 = __ecereNameSpace__ecere__com___strtoi64(value, (((void *)0)), 0);
}
else if(!strcmp(curParam->dataTypeString, "uint64"))
{
argument.expression.ui64 = __ecereNameSpace__ecere__com___strtoui64(value, (((void *)0)), 0);
}
else if(!strcmp(curParam->dataTypeString, "float"))
{
argument.expression.f = (float)strtod(value, (((void *)0)));
}
else if(!strcmp(curParam->dataTypeString, "double"))
{
argument.expression.d = strtod(value, (((void *)0)));
}
else
{
argument.expression.i = strtol(value, (((void *)0)), 0);
}
break;
}
case 1:
argument.memberString = __ecereNameSpace__ecere__sys__CopyString(value);
break;
}
__ecereNameSpace__ecere__com__FreeTemplateArg(templatedClass, curParam, curParamID);
templatedClass->templateArgs[curParamID] = argument;
}
}
}
if(templatedClass == _class)
{
struct __ecereNameSpace__ecere__com__Class * sClass = _class;
int curParamID = 0;
struct __ecereNameSpace__ecere__com__Class * nextClass;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
{
if(nextClass->templateClass)
nextClass = nextClass->templateClass;
curParamID += nextClass->templateParams.count;
}
for(param = sClass->templateParams.first; param; param = param->next)
{
if(!templatedClass->templateArgs[curParamID].dataTypeString)
{
templatedClass->templateArgs[curParamID] = param->defaultArg;
__ecereNameSpace__ecere__com__CopyTemplateArg(param, &templatedClass->templateArgs[curParamID]);
if(param->type == 0 && param->defaultArg.dataTypeString)
{
templatedClass->templateArgs[curParamID].dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(templatedClass->module, param->defaultArg.dataTypeString);
if(!templatedClass->templateArgs[curParamID].dataTypeClass)
templatedClass->templateArgs[curParamID].dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)templatedClass->module + 12)))->application, param->defaultArg.dataTypeString);
if(!templatedClass->templateArgs[curParamID].dataTypeClass)
templatedClass->templateArgs[curParamID].dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(findModule, param->defaultArg.dataTypeString);
}
}
curParamID++;
}
}
if(templatedClass->base && templatedClass->base->templateArgs && numParams - _class->templateParams.count)
{
int c = numParams - _class->templateParams.count - 1;

for(sClass = _class->base; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

if(sClass->templateClass)
sClass = sClass->templateClass;
for(param = sClass->templateParams.last; param; param = param->prev)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument * arg = &templatedClass->templateArgs[c];
struct __ecereNameSpace__ecere__com__ClassTemplateArgument * baseArg = &templatedClass->base->templateArgs[c];

if(!(*arg).dataTypeString)
{
*arg = templatedClass->base->templateArgs[c];
__ecereNameSpace__ecere__com__CopyTemplateArg(param, arg);
if(param->type == 0)
{
if((*arg).dataTypeClass && strchr((*arg).dataTypeString, '<') && (*arg).dataTypeClass->templateArgs)
{
struct __ecereNameSpace__ecere__com__Class * expClass = (*arg).dataTypeClass;
struct __ecereNameSpace__ecere__com__Class * cClass = (((void *)0));
int paramCount = 0;
int lastParam = -1;
char templateString[1024];

sprintf(templateString, "%s<", expClass->templateClass->fullName);
for(cClass = expClass; cClass; cClass = cClass->base)
{
int p = 0;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

for(param = cClass->templateParams.first; param; param = param->next)
{
int id = p;
struct __ecereNameSpace__ecere__com__Class * sClass;
struct __ecereNameSpace__ecere__com__ClassTemplateArgument arg;

for(sClass = expClass->base; sClass; sClass = sClass->base)
id += sClass->templateParams.count;
arg = expClass->templateArgs[id];
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * cParam;
int p = numParams - _class->templateParams.count;

for(cParam = _class->templateParams.first; cParam; cParam = cParam->next, p++)
{
if(cParam->type == 0 && arg.dataTypeString && !strcmp(cParam->name, arg.dataTypeString))
{
arg.dataTypeString = templatedClass->templateArgs[p].dataTypeString;
arg.dataTypeClass = templatedClass->templateArgs[p].dataTypeClass;
break;
}
}
}
{
char argument[256];

argument[0] = '\0';
switch(param->type)
{
case 2:
{
break;
}
case 1:
{
strcat(argument, arg.member->name);
break;
}
case 0:
{
if(arg.dataTypeString)
strcat(argument, arg.dataTypeString);
break;
}
}
if(argument[0])
{
if(paramCount)
strcat(templateString, ", ");
if(lastParam != p - 1)
{
strcat(templateString, param->name);
strcat(templateString, " = ");
}
strcat(templateString, argument);
paramCount++;
lastParam = p;
}
}
p++;
}
}
{
int len = strlen(templateString);

if(templateString[len - 1] == '>')
templateString[len++] = ' ';
templateString[len++] = '>';
templateString[len++] = '\0';
}
__ecereNameSpace__ecere__com__FreeTemplateArg(templatedClass, param, c);
(*arg).dataTypeString = __ecereNameSpace__ecere__sys__CopyString(templateString);
(*arg).dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(templatedClass->module, templateString);
if(!(*arg).dataTypeClass)
(*arg).dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)templatedClass->module + 12)))->application, templateString);
}
else
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * cParam;
int p = numParams - _class->templateParams.count;

for(cParam = _class->templateParams.first; cParam; cParam = cParam->next, p++)
{
if(cParam->type == 0 && (*baseArg).dataTypeString && !strcmp(cParam->name, (*baseArg).dataTypeString))
{
__ecereNameSpace__ecere__com__FreeTemplateArg(templatedClass, param, c);
(*arg).dataTypeString = templatedClass->templateArgs[p].dataTypeString;
(*arg).dataTypeClass = templatedClass->templateArgs[p].dataTypeClass;
__ecereNameSpace__ecere__com__CopyTemplateArg(cParam, arg);
break;
}
}
}
}
}
c--;
}
}
}
{
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = _class; sClass; sClass = sClass->base)
{
int curParamID = 0;
struct __ecereNameSpace__ecere__com__Class * nextClass;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

if(sClass->templateClass)
sClass = sClass->templateClass;
for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
{
if(nextClass->templateClass)
nextClass = nextClass->templateClass;
curParamID += nextClass->templateParams.count;
}
for(param = sClass->templateParams.first; param; param = param->next)
{
if(!templatedClass->templateArgs[curParamID].dataTypeString)
{
templatedClass->templateArgs[curParamID] = param->defaultArg;
__ecereNameSpace__ecere__com__CopyTemplateArg(param, &templatedClass->templateArgs[curParamID]);
if(param->type == 0 && param->defaultArg.dataTypeString)
{
templatedClass->templateArgs[curParamID].dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(templatedClass->module, param->defaultArg.dataTypeString);
if(!templatedClass->templateArgs[curParamID].dataTypeClass)
templatedClass->templateArgs[curParamID].dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)templatedClass->module + 12)))->application, param->defaultArg.dataTypeString);
if(!templatedClass->templateArgs[curParamID].dataTypeClass)
templatedClass->templateArgs[curParamID].dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(findModule, param->defaultArg.dataTypeString);
}
}
curParamID++;
}
}
}
{
int c = numParams - 1;

for(sClass = _class; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

if(sClass->templateClass)
sClass = sClass->templateClass;
for(param = sClass->templateParams.last; param; param = param->prev)
{
if(param->type == 0)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument * arg = &templatedClass->templateArgs[c];
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * cParam;
struct __ecereNameSpace__ecere__com__Class * dClass;
int p = numParams - 1;

for(dClass = _class; dClass; dClass = dClass->base)
{
if(dClass->templateClass)
dClass = dClass->templateClass;
for(cParam = dClass->templateParams.last; cParam; cParam = cParam->prev, p--)
{
if(cParam->type == 0 && (*arg).dataTypeString && !strcmp(cParam->name, (*arg).dataTypeString))
{
if(templatedClass->templateArgs[p].dataTypeString && c != p)
{
__ecereNameSpace__ecere__com__FreeTemplateArg(templatedClass, param, c);
(*arg).dataTypeString = templatedClass->templateArgs[p].dataTypeString;
(*arg).dataTypeClass = templatedClass->templateArgs[p].dataTypeClass;
__ecereNameSpace__ecere__com__CopyTemplateArg(cParam, arg);
}
}
}
}
}
c--;
}
}
}
{
struct __ecereNameSpace__ecere__com__Class * tClass;
int c = numParams - 1;

for(tClass = _class; tClass; tClass = tClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

if(tClass->templateClass)
tClass = tClass->templateClass;
for(param = tClass->templateParams.last; param; param = param->prev)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument * arg = &templatedClass->templateArgs[c];

if(param->type == 1 && (*arg).memberString)
{
struct __ecereNameSpace__ecere__com__Class * memberClass = templatedClass;
char * memberString = (*arg).memberString;
char * colon = strstr(memberString, "::");
char * memberName = memberString;

if(colon)
memberName = colon + 2;
if(!colon)
{
memberString = param->defaultArg.memberString;
colon = memberString ? strstr(memberString, "::") : (((void *)0));
}
if(colon)
{
char className[1024];
struct __ecereNameSpace__ecere__com__Class * sClass;

memcpy(className, memberString, colon - memberString);
className[colon - memberString] = '\0';
for(sClass = _class; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * cParam;
struct __ecereNameSpace__ecere__com__Class * nextClass;
int id = 0;

if(sClass->templateClass)
sClass = sClass->templateClass;
for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
{
if(nextClass->templateClass)
nextClass = nextClass->templateClass;
id += nextClass->templateParams.count;
}
for(cParam = sClass->templateParams.first; cParam; cParam = cParam->next)
{
if(cParam->type == 0 && !strcmp(cParam->name, className) && templatedClass->templateArgs[id].dataTypeString)
{
strcpy(className, templatedClass->templateArgs[id].dataTypeString);
}
id++;
}
}
memberClass = __ecereNameSpace__ecere__com__eSystem_FindClass(templatedClass->module, className);
if(!memberClass)
memberClass = __ecereNameSpace__ecere__com__eSystem_FindClass(findModule, className);
if(!memberClass)
memberClass = __ecereNameSpace__ecere__com__eSystem_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)templatedClass->module + 12)))->application, className);
}
if(memberClass)
{
switch(param->memberType)
{
case 0:
(*arg).member = __ecereNameSpace__ecere__com__eClass_FindDataMember(memberClass, memberName, memberClass->module, (((void *)0)), (((void *)0)));
break;
case 1:
(*arg).method = __ecereNameSpace__ecere__com__eClass_FindMethod(memberClass, memberName, memberClass->module);
break;
case 2:
(*arg).prop = __ecereNameSpace__ecere__com__eClass_FindProperty(memberClass, memberName, memberClass->module);
break;
}
}
}
c--;
}
}
}
}

unsigned int __ecereNameSpace__ecere__com__DefaultFunction()
{
return 0x1;
}

unsigned int __ecereNameSpace__ecere__com__eClass_IsDerived(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class * from)
{
if(!_class && !from)
return 0x1;
if(_class && from && (_class->templateClass || from->templateClass))
{
if(__ecereNameSpace__ecere__com__eClass_IsDerived(_class->templateClass ? _class->templateClass : _class, from->templateClass ? from->templateClass : from))
{
if(!from->templateClass)
return 0x1;
else if(!_class->templateClass && _class == from->templateClass)
return 0x0;
else
{
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = from; sClass; sClass = sClass->base)
{
if(sClass->templateParams.first)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;
struct __ecereNameSpace__ecere__com__Class * nextClass;
int p = 0;

for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
p += nextClass->templateParams.count;
for(param = sClass->templateParams.first; param; param = param->next, p++)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument * arg = &_class->templateArgs[p];
struct __ecereNameSpace__ecere__com__ClassTemplateArgument * fArg = &from->templateArgs[p];

if(param->type == 0)
{
if((*arg).dataTypeString != (*fArg).dataTypeString && (*arg).dataTypeString && (*fArg).dataTypeString && strcmp((*arg).dataTypeString, (*fArg).dataTypeString))
break;
}
else if(param->type == 1)
{
if((*arg).member != (*fArg).member)
break;
}
else if(param->type == 2)
{
if((*arg).expression.ui64 != (*fArg).expression.ui64)
break;
}
}
if(param)
return 0x0;
}
}
return 0x1;
}
}
}
else
{
for(; _class && from; _class = _class->base)
{
if(_class == from || _class->templateClass == from || (_class->type == 1000 && from->name && !strcmp(_class->name, from->name)))
return 0x1;
}
}
return 0x0;
}

static void __ecereNameSpace__ecere__com__FixDerivativeVirtualMethod(struct __ecereNameSpace__ecere__com__Class * base, char * name, int vid, void * origFunction, char * type)
{
struct __ecereNameSpace__ecere__sys__OldLink * derivative;

for(derivative = base->derivatives.first; derivative; derivative = derivative->next)
{
struct __ecereNameSpace__ecere__com__Class * _class = derivative->data;
struct __ecereNameSpace__ecere__com__Method * method, * next;
void * function = origFunction;

_class->vTblSize++;
_class->_vTbl = __ecereNameSpace__ecere__com__eSystem_Renew(_class->_vTbl, sizeof(void *) * (_class->vTblSize));
memmove(_class->_vTbl + vid + 1, _class->_vTbl + vid, (_class->vTblSize - vid - 1) * sizeof(void *));
method = (struct __ecereNameSpace__ecere__com__Method *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->methods, name);
if(method)
{
if(method->function)
function = method->function;
if(!method->symbol)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(method->name), method->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(method->dataTypeString), method->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&_class->methods, (struct __ecereNameSpace__ecere__sys__BTNode *)method);
}
else
{
(__ecereNameSpace__ecere__com__eSystem_Delete(method->dataTypeString), method->dataTypeString = 0);
method->type = 1;
method->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(type);
method->_class = base;
}
}
for(method = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->methods); method; method = next)
{
next = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)method));
if(method->type == 1)
method->vid++;
}
_class->_vTbl[vid] = function;
{
struct __ecereNameSpace__ecere__sys__OldLink * templateLink;

for(templateLink = _class->templatized.first; templateLink; templateLink = templateLink->next)
{
struct __ecereNameSpace__ecere__com__Class * template = templateLink->data;

template->_vTbl = _class->_vTbl;
}
}
if(_class->derivatives.first || _class->templatized.first)
__ecereNameSpace__ecere__com__FixDerivativeVirtualMethod(_class, name, vid, function, type);
}
{
struct __ecereNameSpace__ecere__sys__OldLink * templateLink;

for(templateLink = base->templatized.first; templateLink; templateLink = templateLink->next)
{
struct __ecereNameSpace__ecere__com__Class * template = templateLink->data;

template->_vTbl = base->_vTbl;
__ecereNameSpace__ecere__com__FixDerivativeVirtualMethod(template, name, vid, origFunction, type);
}
}
}

struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, char * name, char * type, void * function, int declMode)
{
if(_class && name)
{
struct __ecereNameSpace__ecere__com__Class * base;

for(base = _class; base; base = base->base)
{
struct __ecereNameSpace__ecere__com__Method * method = (struct __ecereNameSpace__ecere__com__Method *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&base->methods, name);

if(method)
{
if(method->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldLink * deriv;
void * oldFunction = _class->_vTbl[method->vid];

if(method->vid > _class->vTblSize)
printf("error");
else
_class->_vTbl[method->vid] = function ? function : __ecereNameSpace__ecere__com__DefaultFunction;
for(deriv = _class->derivatives.first; deriv; deriv = deriv->next)
{
struct __ecereNameSpace__ecere__com__Class * derivClass = deriv->data;

if(derivClass->_vTbl[method->vid] == oldFunction)
__ecereNameSpace__ecere__com__eClass_AddMethod(derivClass, name, type, function, declMode);
}
{
struct __ecereNameSpace__ecere__sys__OldLink * templateLink;

for(templateLink = _class->templatized.first; templateLink; templateLink = templateLink->next)
{
struct __ecereNameSpace__ecere__com__Class * template = templateLink->data;

for(deriv = template->derivatives.first; deriv; deriv = deriv->next)
{
struct __ecereNameSpace__ecere__com__Class * derivClass = deriv->data;

if(derivClass->_vTbl[method->vid] == oldFunction)
__ecereNameSpace__ecere__com__eClass_AddMethod(derivClass, name, type, function, declMode);
}
}
}
}
else
{
if(base == _class)
{
break;
}
base = (((void *)0));
break;
}
return method;
}
}
if(!base)
{
struct __ecereNameSpace__ecere__com__Method * method = (method = __ecereNameSpace__ecere__com__eSystem_New0(52), method->name = __ecereNameSpace__ecere__sys__CopyString(name), method->function = function ? function : __ecereNameSpace__ecere__com__DefaultFunction, method->_class = _class, method->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(type), method->memberAccess = declMode, method);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&_class->methods, (struct __ecereNameSpace__ecere__sys__BTNode *)method);
return method;
}
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(struct __ecereNameSpace__ecere__com__Class * _class, char * name, char * type, void * function, int declMode)
{
if(_class && name)
{
struct __ecereNameSpace__ecere__com__Class * base;

for(base = _class; base; base = base->base)
{
struct __ecereNameSpace__ecere__com__Method * method = (struct __ecereNameSpace__ecere__com__Method *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&base->methods, name);

if(method)
{
if(method->type == 1)
_class->_vTbl[method->vid] = function ? function : __ecereNameSpace__ecere__com__DefaultFunction;
else
base = (((void *)0));
return method;
}
}
if(!base)
{
struct __ecereNameSpace__ecere__com__Method * method = (method = __ecereNameSpace__ecere__com__eSystem_New0(52), method->name = __ecereNameSpace__ecere__sys__CopyString(name), method->function = function ? function : __ecereNameSpace__ecere__com__DefaultFunction, method->type = 1, method->_class = _class, method->vid = _class->vTblSize++, method->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(type), method->memberAccess = declMode, method);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&_class->methods, (struct __ecereNameSpace__ecere__sys__BTNode *)method);
_class->_vTbl = __ecereNameSpace__ecere__com__eSystem_Renew(_class->_vTbl, sizeof(void *) * (_class->vTblSize));
_class->_vTbl[method->vid] = function ? function : __ecereNameSpace__ecere__com__DefaultFunction;
if(_class->derivatives.first || _class->templatized.first)
__ecereNameSpace__ecere__com__FixDerivativeVirtualMethod(_class, name, method->vid, function ? function : (void *)__ecereNameSpace__ecere__com__DefaultFunction, type);
return method;
}
}
return (((void *)0));
}

static void __ecereNameSpace__ecere__com__FixDerivativeProperty(struct __ecereNameSpace__ecere__com__Class * base, struct __ecereNameSpace__ecere__com__Property * _property)
{
struct __ecereNameSpace__ecere__sys__OldLink * derivative;

for(derivative = base->derivatives.first; derivative; derivative = derivative->next)
{
struct __ecereNameSpace__ecere__com__Class * _class = derivative->data;
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__BTNamedLink * link;

link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->prop, _property->name);
if(link)
{
prop = link->data;
if(!prop->Set && !prop->Get && prop->memberAccess == 4)
{
struct __ecereNameSpace__ecere__com__SelfWatcher * watcher;

for(watcher = _class->selfWatchers.first; watcher; watcher = watcher->next)
{
if(watcher->_property == prop)
watcher->_property = _property;
}
_property->selfWatchable = 0x1;
(__ecereNameSpace__ecere__com__eSystem_Delete(prop->name), prop->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(prop->dataTypeString), prop->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->membersAndProperties, prop);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&_class->prop, (struct __ecereNameSpace__ecere__sys__BTNode *)link);
}
}
for(prop = _class->membersAndProperties.first; prop; prop = prop->next)
prop->id++;
_class->memberID++;
_class->startMemberID++;
__ecereNameSpace__ecere__com__FixDerivativeProperty(_class, _property);
}
}

struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, char * name, char * dataType, void * setStmt, void * getStmt, int declMode)
{
void * __ecereTemp1;
struct __ecereNameSpace__ecere__com__Property * _property = (((void *)0));

if(_class)
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->prop, (name ? name : dataType)))
{
_property = (__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(88), ((struct __ecereNameSpace__ecere__com__Property *)__ecereTemp1)->isProperty = 0x1, ((struct __ecereNameSpace__ecere__com__Property *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(name ? name : dataType), ((struct __ecereNameSpace__ecere__com__Property *)__ecereTemp1)->id = (name && (setStmt || getStmt || dataType)) ? _class->memberID++ : 0, ((struct __ecereNameSpace__ecere__com__Property *)__ecereTemp1)->Set = setStmt, ((struct __ecereNameSpace__ecere__com__Property *)__ecereTemp1)->Get = getStmt, ((struct __ecereNameSpace__ecere__com__Property *)__ecereTemp1)->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(dataType), ((struct __ecereNameSpace__ecere__com__Property *)__ecereTemp1)->_class = _class, ((struct __ecereNameSpace__ecere__com__Property *)__ecereTemp1)->compiled = 0x1, ((struct __ecereNameSpace__ecere__com__Property *)__ecereTemp1)->conversion = name ? 0x0 : 0x1, ((struct __ecereNameSpace__ecere__com__Property *)__ecereTemp1)->memberAccess = declMode, ((struct __ecereNameSpace__ecere__com__Property *)__ecereTemp1));
if(name)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->membersAndProperties, _property);
else
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->conversions, _property);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&_class->prop, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(24), ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->name = _property->name, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->data = _property, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)));
if(!_property->conversion)
{
__ecereNameSpace__ecere__com__FixDerivativeProperty(_class, _property);
}
}
}
return _property;
}

static void __ecereNameSpace__ecere__com__SetDelayedCPValues(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__ClassProperty * _property)
{
struct __ecereNameSpace__ecere__sys__OldLink * deriv;
struct __ecereNameSpace__ecere__sys__NamedLink * value, * next;

for(value = _class->delayedCPValues.first; value; value = next)
{
next = value->next;
if(!strcmp(value->name, _property->name))
{
_property->Set(_class, (int)value->data);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&_class->delayedCPValues, value);
}
}
for(deriv = _class->derivatives.first; deriv; deriv = deriv->next)
{
__ecereNameSpace__ecere__com__SetDelayedCPValues(deriv->data, _property);
}
}

struct __ecereNameSpace__ecere__com__ClassProperty * __ecereNameSpace__ecere__com__eClass_AddClassProperty(struct __ecereNameSpace__ecere__com__Class * _class, char * name, char * dataType, void * setStmt, void * getStmt)
{
if(name && !__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->classProperties, name))
{
struct __ecereNameSpace__ecere__com__ClassProperty * _property = (_property = __ecereNameSpace__ecere__com__eSystem_New0(40), _property->name = __ecereNameSpace__ecere__sys__CopyString(name), _property->Set = setStmt, _property->Get = getStmt, _property->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(dataType), _property);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&_class->classProperties, (struct __ecereNameSpace__ecere__sys__BTNode *)_property);
__ecereNameSpace__ecere__com__SetDelayedCPValues(_class, _property);
return _property;
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__ClassProperty * __ecereNameSpace__ecere__com__eClass_FindClassProperty(struct __ecereNameSpace__ecere__com__Class * _class, char * name)
{
struct __ecereNameSpace__ecere__com__ClassProperty * _property = (((void *)0));

if(name && _class)
{
struct __ecereNameSpace__ecere__com__Class * origClass = _class;

for(; _class; _class = _class->base)
{
_property = (struct __ecereNameSpace__ecere__com__ClassProperty *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->classProperties, name);
if(_property)
break;
}
if(!_property && origClass->type == 4)
{
struct __ecereNameSpace__ecere__com__Class * enumClass = __ecereNameSpace__ecere__com__eSystem_FindClass(origClass->module, "enum");

_property = __ecereNameSpace__ecere__com__eClass_FindClassProperty(enumClass, name);
}
}
return _property;
}

int __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, char * name)
{
struct __ecereNameSpace__ecere__com__ClassProperty * _property = __ecereNameSpace__ecere__com__eClass_FindClassProperty(_class, name);

if(_property && _property->Get && _property->Get != (void *)1)
{
int result = _property->Get(_class);

return result;
}
return 0;
}

void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, char * name, int value)
{
void * __ecereTemp1;
struct __ecereNameSpace__ecere__com__ClassProperty * _property = __ecereNameSpace__ecere__com__eClass_FindClassProperty(_class, name);

if(_property)
{
if(_property->Set)
_property->Set(_class, value);
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->delayedCPValues, (__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(16), ((struct __ecereNameSpace__ecere__sys__NamedLink *)__ecereTemp1)->name = name, ((struct __ecereNameSpace__ecere__sys__NamedLink *)__ecereTemp1)->data = (void *)value, ((struct __ecereNameSpace__ecere__sys__NamedLink *)__ecereTemp1)));
}
}

struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, char * name, struct __ecereNameSpace__ecere__com__Instance * module)
{
if(_class && name)
{
for(; _class; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__Method * method;

if(_class->templateClass)
_class = _class->templateClass;
method = (struct __ecereNameSpace__ecere__com__Method *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->methods, name);
if(method && (method->memberAccess == 1 || _class->module == module || !method->dataTypeString))
{
if(!method->dataTypeString)
{
if(_class->module != module)
{
if(method->memberAccess == 1)
module = _class->module;
else
{
return (((void *)0));
}
}
}
else
{
return method;
}
}
if(_class->inheritanceAccess == 2 && _class->module != module)
break;
}
}
return (((void *)0));
}

static unsigned int __ecereNameSpace__ecere__com__ConstructInstance(void * instance, struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class * from)
{
if(_class->templateClass)
_class = _class->templateClass;
if(_class->base && from != _class->base)
{
if(!__ecereNameSpace__ecere__com__ConstructInstance(instance, _class->base, from))
return 0x0;
}
if(_class->Initialize)
{
void (* Initialize)(struct __ecereNameSpace__ecere__com__Instance * module) = (void *)_class->Initialize;

_class->Initialize = (((void *)0));
Initialize(_class->module);
}
if(_class->Constructor)
{
if(!_class->Constructor(instance))
{
for(; _class; _class = _class->base)
{
if(_class->templateClass)
_class = _class->templateClass;
if(_class->Destructor)
_class->Destructor(instance);
}
return 0x0;
}
}
(_class->templateClass ? _class->templateClass : _class)->count++;
return 0x1;
}

void * __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class)
{
struct __ecereNameSpace__ecere__com__Instance * instance = (((void *)0));

if(_class)
{
instance = __ecereNameSpace__ecere__com___calloc(1, _class->structSize);
if(_class->type == 0)
{
((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class = _class;
((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_vTbl = _class->_vTbl;
}
if(!__ecereNameSpace__ecere__com__ConstructInstance(instance, _class, (((void *)0))))
{
__ecereNameSpace__ecere__com___free(instance);
instance = (((void *)0));
}
}
return instance;
}

void __ecereNameSpace__ecere__com__eInstance_Evolve(struct __ecereNameSpace__ecere__com__Instance ** instancePtr, struct __ecereNameSpace__ecere__com__Class * _class)
{
if(_class && instancePtr && *instancePtr)
{
unsigned int wasApp = 0x0, wasGuiApp = 0x0;
struct __ecereNameSpace__ecere__com__Instance * instance = (struct __ecereNameSpace__ecere__com__Instance *)__ecereNameSpace__ecere__com__eSystem_Renew(*instancePtr, sizeof(unsigned char) * (_class->structSize));
struct __ecereNameSpace__ecere__com__Class * fromClass = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class;

*instancePtr = instance;
memset(((unsigned char *)instance) + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->structSize, (unsigned char)0, _class->structSize - ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->structSize);
if((wasApp = !strcmp(((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->name, "Application")) || (wasGuiApp = !strcmp(((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->name, "GuiApplication")))
{
struct __ecereNameSpace__ecere__com__Instance * module;
struct __ecereNameSpace__ecere__com__Instance * app = (struct __ecereNameSpace__ecere__com__Instance *)instance;
struct __ecereNameSpace__ecere__com__BTNamedLink * link;
struct __ecereNameSpace__ecere__com__Class * _class;
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace;

for(module = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->allModules.first; module; module = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->next)
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application = app;
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->privateNameSpace.classes); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
{
struct __ecereNameSpace__ecere__sys__OldLink * t;

((struct __ecereNameSpace__ecere__com__Class *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->privateNameSpace;
for(t = ((struct __ecereNameSpace__ecere__com__Class *)link->data)->templatized.first; t; t = t->next)
{
struct __ecereNameSpace__ecere__com__Class * template = t->data;

template->nameSpace = ((struct __ecereNameSpace__ecere__com__Class *)link->data)->nameSpace;
}
}
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->publicNameSpace.classes); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
{
struct __ecereNameSpace__ecere__sys__OldLink * t;

((struct __ecereNameSpace__ecere__com__Class *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->publicNameSpace;
for(t = ((struct __ecereNameSpace__ecere__com__Class *)link->data)->templatized.first; t; t = t->next)
{
struct __ecereNameSpace__ecere__com__Class * template = t->data;

template->nameSpace = ((struct __ecereNameSpace__ecere__com__Class *)link->data)->nameSpace;
}
}
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->privateNameSpace.defines); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
((struct __ecereNameSpace__ecere__com__DefinedExpression *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->privateNameSpace;
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->publicNameSpace.defines); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
((struct __ecereNameSpace__ecere__com__DefinedExpression *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->publicNameSpace;
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->privateNameSpace.functions); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
((struct __ecereNameSpace__ecere__com__GlobalFunction *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->privateNameSpace;
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->publicNameSpace.functions); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
((struct __ecereNameSpace__ecere__com__GlobalFunction *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->publicNameSpace;
for(nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->privateNameSpace.nameSpaces); nameSpace; nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)nameSpace)))
(*nameSpace).parent = &((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->privateNameSpace;
for(nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->publicNameSpace.nameSpaces); nameSpace; nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)nameSpace)))
(*nameSpace).parent = &((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->publicNameSpace;
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->systemNameSpace.classes); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
{
struct __ecereNameSpace__ecere__sys__OldLink * t;

((struct __ecereNameSpace__ecere__com__Class *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->systemNameSpace;
for(t = ((struct __ecereNameSpace__ecere__com__Class *)link->data)->templatized.first; t; t = t->next)
{
struct __ecereNameSpace__ecere__com__Class * template = t->data;

template->nameSpace = ((struct __ecereNameSpace__ecere__com__Class *)link->data)->nameSpace;
}
}
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->systemNameSpace.defines); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
((struct __ecereNameSpace__ecere__com__DefinedExpression *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->systemNameSpace;
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->systemNameSpace.functions); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
((struct __ecereNameSpace__ecere__com__GlobalFunction *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->systemNameSpace;
for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->systemNameSpace.functions); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
((struct __ecereNameSpace__ecere__com__GlobalFunction *)link->data)->nameSpace = &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->systemNameSpace;
for(nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->systemNameSpace.nameSpaces); nameSpace; nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)nameSpace)))
(*nameSpace).parent = &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->systemNameSpace;
for(_class = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->classes.first; _class; _class = _class->next)
{
struct __ecereNameSpace__ecere__sys__OldLink * templateLink;

_class->module = (struct __ecereNameSpace__ecere__com__Instance *)app;
for(templateLink = _class->templatized.first; templateLink; templateLink = templateLink->next)
{
struct __ecereNameSpace__ecere__com__Class * template = templateLink->data;

template->module = _class->module;
}
}
for(module = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->allModules.first; module; module = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->next)
{
for(_class = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->classes.first; _class; _class = _class->next)
{
struct __ecereNameSpace__ecere__sys__OldLink * templateLink;

_class->module = module;
for(templateLink = _class->templatized.first; templateLink; templateLink = templateLink->next)
{
struct __ecereNameSpace__ecere__com__Class * template = templateLink->data;

template->module = _class->module;
}
}
}
((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->application = app;
}
{
struct __ecereNameSpace__ecere__com__Class * base;

for(base = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class; base && base->type == 0 && base->count; base = base->base)
(base->templateClass ? base->templateClass : base)->count--;
}
((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class = _class;
((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_vTbl = _class->_vTbl;
if(!__ecereNameSpace__ecere__com__ConstructInstance(instance, _class, fromClass))
{
__ecereNameSpace__ecere__com___free(instance);
*instancePtr = (((void *)0));
}
}
}

void __ecereNameSpace__ecere__com__eInstance_Delete(struct __ecereNameSpace__ecere__com__Instance * instance)
{
if(instance)
{
struct __ecereNameSpace__ecere__com__Class * _class, * base;
unsigned int ownVtbl;

ownVtbl = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_vTbl != ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->_vTbl;
for(_class = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class; _class; _class = base)
{
if(_class->templateClass)
_class = _class->templateClass;
if(_class->destructionWatchOffset)
{
struct __ecereNameSpace__ecere__sys__OldList * watchers = (struct __ecereNameSpace__ecere__sys__OldList *)((unsigned char *)instance + _class->destructionWatchOffset);
struct __ecereNameSpace__ecere__com__Watcher * watcher, * next;

for(watcher = (*watchers).first; watcher; watcher = next)
{
next = watcher->next;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*watchers), watcher);
watcher->callback(watcher->object, instance);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete((&*watchers), watcher);
}
}
base = _class->base;
if(base && base->type == 1000)
base = (((void *)0));
if(_class->Destructor)
_class->Destructor(instance);
}
for(_class = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class; _class; _class = base)
{
if(_class->templateClass)
_class = _class->templateClass;
base = _class->base;
(_class->templateClass ? _class->templateClass : _class)->count--;
if(_class->type == 0 && !_class->count && !_class->module)
{
__ecereNameSpace__ecere__com__eClass_Unregister(_class);
}
}
if(ownVtbl)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_vTbl), ((struct __ecereNameSpace__ecere__com__Instance * )(char * )instance)->_vTbl = 0);
}
__ecereNameSpace__ecere__com___free(instance);
}
}

struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, char * name, struct __ecereNameSpace__ecere__com__Instance * module)
{
if(_class && name)
{
for(; _class; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link;

if(_class->templateClass)
_class = _class->templateClass;
link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->prop, name);
if(link)
{
struct __ecereNameSpace__ecere__com__Property * _property = (struct __ecereNameSpace__ecere__com__Property *)link->data;

if(_property->memberAccess == 1 || _class->module == module || !_property->dataTypeString)
{
if(!_property->dataTypeString)
{
if(_class->module != module)
{
if(_property->memberAccess == 1)
module = _class->module;
else
{
return (((void *)0));
}
}
}
else
{
return _property;
}
}
}
if(_class->inheritanceAccess == 2 && _class->module != module)
break;
}
}
return (((void *)0));
}

static struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__FindDataMember(struct __ecereNameSpace__ecere__sys__OldList * list, struct __ecereNameSpace__ecere__sys__BinaryTree * alist, char * name, unsigned int * offset, int * id, unsigned int searchPrivate, struct __ecereNameSpace__ecere__com__DataMember ** subMemberStack, int * subMemberStackPos)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link;
struct __ecereNameSpace__ecere__com__DataMember * dataMember;

link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(alist, name);
if(link)
{
dataMember = link->data;
if(dataMember->type == 0 && (dataMember->memberAccess == 1 || searchPrivate || !dataMember->dataTypeString))
{
if(offset)
*offset += dataMember->offset;
if(id)
*id = dataMember->id;
return dataMember;
}
return (((void *)0));
}
for(dataMember = list->first; dataMember; dataMember = dataMember->next)
{
if(!dataMember->isProperty && (dataMember->memberAccess == 1 || searchPrivate) && !dataMember->name && (dataMember->type == 1 || dataMember->type == 2))
{
struct __ecereNameSpace__ecere__com__DataMember * childMember;

if(subMemberStackPos)
subMemberStack[(*subMemberStackPos)++] = dataMember;
childMember = __ecereNameSpace__ecere__com__FindDataMember(&dataMember->members, &dataMember->membersAlpha, name, offset, id, searchPrivate, subMemberStack, subMemberStackPos);
if(childMember)
{
if(offset)
*offset += dataMember->offset;
if(id)
*id += dataMember->id;
return childMember;
}
if(subMemberStackPos)
(*subMemberStackPos)--;
}
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char * name, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember ** subMemberStack, int * subMemberStackPos)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (((void *)0));

if(subMemberStackPos)
*subMemberStackPos = 0;
if(_class && name)
{
for(; _class; _class = _class->base)
{
if(_class->templateClass)
_class = _class->templateClass;
dataMember = __ecereNameSpace__ecere__com__FindDataMember(&_class->membersAndProperties, &_class->members, name, (((void *)0)), (((void *)0)), _class->module == module, subMemberStack, subMemberStackPos);
if(dataMember)
{
if(!dataMember->dataTypeString)
{
if(_class->module != module)
{
if(dataMember->memberAccess == 1)
module = _class->module;
else
{
return (((void *)0));
}
}
dataMember = (((void *)0));
}
else
{
dataMember->_class = _class->templateClass ? _class->templateClass : _class;
return dataMember;
}
}
if(_class->inheritanceAccess == 2 && _class->module != module)
break;
}
}
return dataMember;
}

struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(struct __ecereNameSpace__ecere__com__Class * _class, char * name, unsigned int * offset, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember ** subMemberStack, int * subMemberStackPos)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (((void *)0));

if(subMemberStackPos)
*subMemberStackPos = 0;
if(offset)
*offset = 0;
if(_class)
{
for(; _class; _class = _class->base)
{
if(_class->templateClass)
_class = _class->templateClass;
dataMember = __ecereNameSpace__ecere__com__FindDataMember(&_class->membersAndProperties, &_class->members, name, offset, (((void *)0)), _class->module == module, subMemberStack, subMemberStackPos);
if(dataMember)
{
if(!dataMember->dataTypeString)
{
if(_class->module != module)
{
if(dataMember->memberAccess == 1)
module = _class->module;
else
{
return (((void *)0));
}
}
dataMember = (((void *)0));
}
else
{
dataMember->_class = _class;
return dataMember;
}
}
if(_class->inheritanceAccess == 2 && _class->module != module)
break;
}
}
return dataMember;
}

struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMemberAndId(struct __ecereNameSpace__ecere__com__Class * _class, char * name, int * id, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember ** subMemberStack, int * subMemberStackPos)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (((void *)0));

if(subMemberStackPos)
*subMemberStackPos = 0;
if(_class)
{
for(; _class; _class = _class->base)
{
if(_class->templateClass)
_class = _class->templateClass;
dataMember = __ecereNameSpace__ecere__com__FindDataMember(&_class->membersAndProperties, &_class->members, name, (((void *)0)), id, _class->module == module, subMemberStack, subMemberStackPos);
if(dataMember)
{
if(!dataMember->dataTypeString)
{
if(_class->module != module)
{
if(dataMember->memberAccess == 1)
module = _class->module;
else
{
return (((void *)0));
}
}
dataMember = (((void *)0));
}
else
{
dataMember->_class = _class;
return dataMember;
}
}
if(_class->inheritanceAccess == 2 && _class->module != module)
break;
}
}
return dataMember;
}

void __ecereNameSpace__ecere__com__eClass_FindNextMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class ** curClass, struct __ecereNameSpace__ecere__com__DataMember ** curMember, struct __ecereNameSpace__ecere__com__DataMember ** subMemberStack, int * subMemberStackPos)
{
if(*curMember)
{
*curMember = (*curMember)->next;
if(subMemberStackPos && *subMemberStackPos > 0 && subMemberStack[*subMemberStackPos - 1]->type == 1)
{
*curMember = subMemberStack[--(*subMemberStackPos)];
*curMember = (*curMember)->next;
}
if(subMemberStackPos && *subMemberStackPos > 0)
{
while(*curMember && ((*curMember)->memberAccess == 2))
*curMember = (*curMember)->next;
}
else
while(*curMember && (*curMember)->name)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, (*curMember)->name, (((void *)0)), (((void *)0)), (((void *)0)));

if(!dataMember)
dataMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(_class, (*curMember)->name, (((void *)0)));
if(dataMember && dataMember->memberAccess != 2)
{
*curMember = dataMember;
break;
}
else
*curMember = (*curMember)->next;
}
if(subMemberStackPos)
{
while((*curMember) && !(*curMember)->isProperty && !(*curMember)->name && ((*curMember)->type == 2 || (*curMember)->type == 1))
{
subMemberStack[(*subMemberStackPos)++] = *curMember;
*curMember = (*curMember)->members.first;
while(*curMember && ((*curMember)->memberAccess == 2))
*curMember = (*curMember)->next;
}
}
}
while(!*curMember)
{
if(!*curMember)
{
if(subMemberStackPos && *subMemberStackPos)
{
*curMember = subMemberStack[--(*subMemberStackPos)];
*curMember = (*curMember)->next;
}
else
{
struct __ecereNameSpace__ecere__com__Class * lastCurClass = *curClass;

if(*curClass == _class)
break;
for(*curClass = _class; (*curClass)->base != lastCurClass && (*curClass)->base->type != 1000 && (*curClass)->inheritanceAccess != 2; *curClass = (*curClass)->base)
;
*curMember = (*curClass)->membersAndProperties.first;
}
if(subMemberStackPos && *subMemberStackPos > 0)
{
while(*curMember && ((*curMember)->memberAccess == 2))
*curMember = (*curMember)->next;
}
else
while(*curMember && (*curMember)->name)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, (*curMember)->name, (((void *)0)), (((void *)0)), (((void *)0)));

if(!dataMember)
dataMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(_class, (*curMember)->name, (((void *)0)));
if(dataMember && dataMember->memberAccess != 2)
{
*curMember = dataMember;
break;
}
else
*curMember = (*curMember)->next;
}
if(subMemberStackPos)
{
while((*curMember) && !(*curMember)->isProperty && !(*curMember)->name && ((*curMember)->type == 2 || (*curMember)->type == 1))
{
subMemberStack[(*subMemberStackPos)++] = *curMember;
*curMember = (*curMember)->members.first;
while(*curMember && (*curMember)->memberAccess == 2)
*curMember = (*curMember)->next;
}
}
}
}
}

void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, char * name, void * function)
{
if(instance && name)
{
struct __ecereNameSpace__ecere__com__Class * _class;

for(_class = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class; _class; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__Method * method = (struct __ecereNameSpace__ecere__com__Method *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->methods, name);

if(method && method->type == 1)
{
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_vTbl == ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->_vTbl)
{
((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_vTbl = __ecereNameSpace__ecere__com___malloc(sizeof(void *) * ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->vTblSize);
memcpy(((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_vTbl, ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->_vTbl, sizeof(int (*)()) * ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->vTblSize);
}
((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_vTbl[method->vid] = function ? function : __ecereNameSpace__ecere__com__DefaultFunction;
}
}
}
}

unsigned int __ecereNameSpace__ecere__com__eInstance_IsDerived(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Class * from)
{
if(instance)
{
struct __ecereNameSpace__ecere__com__Class * _class = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class;

for(; _class; _class = _class->base)
{
if(_class == from)
return 0x1;
}
}
return 0x0;
}

void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance)
{
if(instance)
((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_refCount++;
}

void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance)
{
if(instance)
{
((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_refCount--;
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_refCount <= 0)
{
__ecereNameSpace__ecere__com__eInstance_Delete(instance);
}
}
}

static void __ecereNameSpace__ecere__com__FixOffsets(struct __ecereNameSpace__ecere__com__Class * _class)
{
struct __ecereNameSpace__ecere__sys__OldLink * deriv;

_class->structSize += _class->base->structSize - _class->offset;
_class->offset = _class->base->structSize;
for(deriv = _class->derivatives.first; deriv; deriv = deriv->next)
__ecereNameSpace__ecere__com__FixOffsets(deriv->data);
}

void __ecereNameSpace__ecere__com__eClass_Resize(struct __ecereNameSpace__ecere__com__Class * _class, int newSize)
{
struct __ecereNameSpace__ecere__sys__OldLink * deriv;

_class->structSize = newSize;
for(deriv = _class->derivatives.first; deriv; deriv = deriv->next)
__ecereNameSpace__ecere__com__FixOffsets(deriv->data);
}

struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char * name, char * type, unsigned int size, unsigned int alignment, int declMode)
{
void * __ecereTemp1;

if(_class && name)
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->members, name))
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember;

if(alignment)
{
int __simpleStruct0;

_class->structAlignment = (__simpleStruct0 = _class->structAlignment, (__simpleStruct0 > alignment) ? __simpleStruct0 : alignment);
if(_class->memberOffset % alignment)
_class->memberOffset += alignment - (_class->memberOffset % alignment);
}
dataMember = (__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(96), ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(name), ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(type), ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->id = _class->memberID++, ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->_class = _class, ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->offset = _class->memberOffset, ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->memberOffset = size, ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->memberAccess = declMode, ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->membersAlpha.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->membersAndProperties, dataMember);
_class->memberOffset += size;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&_class->members, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(24), ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->name = dataMember->name, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->data = dataMember, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)));
return dataMember;
}
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_AddDataMember(struct __ecereNameSpace__ecere__com__DataMember * member, char * name, char * type, unsigned int size, unsigned int alignment, int declMode)
{
void * __ecereTemp1;

if(name && !__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&member->membersAlpha, name))
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember;

if(alignment)
{
int __simpleStruct0;

member->structAlignment = (__simpleStruct0 = member->structAlignment, (__simpleStruct0 > alignment) ? __simpleStruct0 : alignment);
if(member->memberOffset % alignment)
member->memberOffset += alignment - (member->memberOffset % alignment);
}
dataMember = (__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(96), ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(name), ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->_class = member->_class, ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(type), ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->id = member->memberID++, ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->offset = (member->type == 1) ? 0 : member->memberOffset, ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->memberAccess = declMode, ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->membersAlpha.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&member->members, dataMember);
if(member->type == 1)
{
if(size > member->memberOffset)
member->memberOffset = size;
}
else
member->memberOffset += size;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&member->membersAlpha, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(24), ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->name = dataMember->name, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->data = dataMember, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)));
return dataMember;
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_New(int type, int declMode)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(96), ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->type = type, ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->memberAccess = declMode, ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1)->membersAlpha.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, ((struct __ecereNameSpace__ecere__com__DataMember *)__ecereTemp1));
}

static void __ecereNameSpace__ecere__com__SetMemberClass(struct __ecereNameSpace__ecere__com__DataMember * member, struct __ecereNameSpace__ecere__com__Class * _class)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember;

member->_class = _class;
for(dataMember = member->members.first; dataMember; dataMember = dataMember->next)
__ecereNameSpace__ecere__com__SetMemberClass(dataMember, _class);
}

unsigned int __ecereNameSpace__ecere__com__eMember_AddMember(struct __ecereNameSpace__ecere__com__DataMember * addTo, struct __ecereNameSpace__ecere__com__DataMember * dataMember)
{
void * __ecereTemp1;
int __simpleStruct0, __simpleStruct1;

if(dataMember->name && __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&addTo->membersAlpha, dataMember->name))
return 0x0;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&addTo->members, dataMember);
if(dataMember->name)
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&addTo->membersAlpha, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(24), ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->name = dataMember->name, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->data = dataMember, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)));
dataMember->_class = addTo->_class;
dataMember->id = addTo->memberID;
if(dataMember->type == 1)
addTo->memberID += 1;
else
addTo->memberID += dataMember->memberID;
addTo->structAlignment = (__simpleStruct0 = addTo->structAlignment, __simpleStruct1 = dataMember->structAlignment, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
dataMember->offset = (addTo->type == 1) ? 0 : addTo->memberOffset;
if(addTo->type == 1)
{
if(dataMember->memberOffset > addTo->memberOffset)
addTo->memberOffset = dataMember->memberOffset;
}
else
addTo->memberOffset += dataMember->memberOffset;
return 0x1;
}

unsigned int __ecereNameSpace__ecere__com__eClass_AddMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__DataMember * dataMember)
{
void * __ecereTemp1;
int __simpleStruct0, __simpleStruct1;

if(!_class || _class->comRedefinition || (dataMember->name && __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->members, dataMember->name)))
return 0x0;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->membersAndProperties, dataMember);
if(dataMember->name)
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&_class->members, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(24), ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->name = dataMember->name, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->data = dataMember, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)));
__ecereNameSpace__ecere__com__SetMemberClass(dataMember, _class);
dataMember->id = _class->memberID;
_class->structAlignment = (__simpleStruct0 = _class->structAlignment, __simpleStruct1 = dataMember->structAlignment, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
if(dataMember->type == 1)
_class->memberID += 1;
else
_class->memberID += dataMember->memberID;
dataMember->offset = _class->memberOffset;
_class->memberOffset += dataMember->memberOffset;
return 0x1;
}

struct __ecereNameSpace__ecere__com__BitMember * __ecereNameSpace__ecere__com__eClass_AddBitMember(struct __ecereNameSpace__ecere__com__Class * _class, char * name, char * type, int bitSize, int bitPos, int declMode)
{
void * __ecereTemp1;

if(_class && name && !__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&_class->members, name))
{
uint64 mask = 0;
int c;
struct __ecereNameSpace__ecere__com__BitMember * bitMember = (bitMember = __ecereNameSpace__ecere__com__eSystem_New0(64), bitMember->name = __ecereNameSpace__ecere__sys__CopyString(name), bitMember->_class = _class, bitMember->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(type), bitMember->id = _class->memberID++, bitMember->memberAccess = declMode, bitMember);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->membersAndProperties, bitMember);
if(bitSize)
{
bitMember->pos = (bitPos == -1) ? _class->memberOffset : bitPos;
bitMember->size = bitSize;
_class->memberOffset = bitMember->pos + bitMember->size;
for(c = 0; c < bitSize; c++)
{
if(c)
mask <<= 1;
mask |= 1;
}
bitMember->mask = mask << bitMember->pos;
}
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&_class->members, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(24), ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->name = bitMember->name, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->data = bitMember, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)));
return bitMember;
}
return (((void *)0));
}

static struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__Module_Load(struct __ecereNameSpace__ecere__com__Instance * fromModule, char * name, int importAccess, unsigned int ensureCOM)
{
void * __ecereTemp1;
unsigned int (stdcall * Load)(struct __ecereNameSpace__ecere__com__Instance * module) = (((void *)0));
unsigned int (stdcall * Unload)(struct __ecereNameSpace__ecere__com__Instance * module) = (((void *)0));
struct __ecereNameSpace__ecere__com__Instance * module;

for(module = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + 12)))->application + 300)))->allModules.first; module; module = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->next)
{
if(!strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->name, name))
break;
}
if(ensureCOM && (!strcmp(name, "ecereCOM") || !strcmp(name, "ecere")))
{
for(module = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + 12)))->application + 300)))->allModules.first; module; module = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->next)
{
if(!strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->name, "ecere") || !strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->name, "ecereCOM"))
break;
}
}
if(!module)
{
void * library = (((void *)0));

if(ensureCOM && !strcmp(name, "ecereCOM"))
{
Load = __ecereDll_Load_ecere;
Unload = __ecereDll_Unload_ecere;
}
else
{
library = Instance_Module_Load(name, &Load, &Unload);
}
if(Load)
{
module = (struct __ecereNameSpace__ecere__com__Instance *)__ecereNameSpace__ecere__com__eInstance_New(__ecereNameSpace__ecere__com__eSystem_FindClass(fromModule, "Module"));
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + 12)))->application;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->library = library;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->name = __ecereNameSpace__ecere__sys__CopyString(name);
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->Unload = Unload;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->origImportType = 0;
if(!Load(module))
{
__ecereNameSpace__ecere__com__eInstance_Delete((struct __ecereNameSpace__ecere__com__Instance *)module);
module = (((void *)0));
}
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + 12)))->application + 300)))->allModules, module);
}
if(ensureCOM && !strcmp(name, "ecere") && module)
{
name = !strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->name, "ecereCOM") ? "ecere" : "ecereCOM";
if((!Load && !strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->name, "ecereCOM")) || (Load && (!__thisModule || !((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->name || !strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->name, "ecereCOM")) && Load != __ecereDll_Load_ecere))
{
struct __ecereNameSpace__ecere__com__Instance * module;

for(module = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + 12)))->application + 300)))->allModules.first; module; module = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->next)
{
if(!strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->name, name))
break;
}
if(!module)
{
Load = __ecereDll_Load_ecere;
Unload = __ecereDll_Unload_ecere;
module = (struct __ecereNameSpace__ecere__com__Instance *)__ecereNameSpace__ecere__com__eInstance_New(__ecereNameSpace__ecere__com__eSystem_FindClass(fromModule, "Module"));
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + 12)))->application;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->library = (((void *)0));
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->name = __ecereNameSpace__ecere__sys__CopyString(name);
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->Unload = Unload;
if(!Load(module))
{
__ecereNameSpace__ecere__com__eInstance_Delete((struct __ecereNameSpace__ecere__com__Instance *)module);
module = (((void *)0));
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + 12)))->application + 300)))->allModules, module);
}
if(module)
{
if(fromModule)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + 12)))->modules, (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__SubModule), ((struct __ecereNameSpace__ecere__com__SubModule *)__ecereTemp1)->module = module, ((struct __ecereNameSpace__ecere__com__SubModule *)__ecereTemp1)->importMode = importAccess, ((struct __ecereNameSpace__ecere__com__SubModule *)__ecereTemp1)));
}
module->_refCount++;
}
}
}
if(module)
{
if(fromModule)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + 12)))->modules, (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__SubModule), ((struct __ecereNameSpace__ecere__com__SubModule *)__ecereTemp1)->module = module, ((struct __ecereNameSpace__ecere__com__SubModule *)__ecereTemp1)->importMode = importAccess, ((struct __ecereNameSpace__ecere__com__SubModule *)__ecereTemp1)));
}
module->_refCount++;
}
return module;
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__eModule_Load(struct __ecereNameSpace__ecere__com__Instance * fromModule, char * name, int importAccess)
{
return __ecereNameSpace__ecere__com__Module_Load(fromModule, name, importAccess, 0x1);
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__eModule_LoadStrict(struct __ecereNameSpace__ecere__com__Instance * fromModule, char * name, int importAccess)
{
return __ecereNameSpace__ecere__com__Module_Load(fromModule, name, importAccess, 0x0);
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__eModule_LoadStatic(struct __ecereNameSpace__ecere__com__Instance * fromModule, char * name, int importAccess, unsigned int (* Load)(struct __ecereNameSpace__ecere__com__Instance * module), unsigned int (* Unload)(struct __ecereNameSpace__ecere__com__Instance * module))
{
void * __ecereTemp1;
struct __ecereNameSpace__ecere__com__Instance * module;

for(module = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + 12)))->application + 300)))->allModules.first; module; module = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->next)
{
if(!strcmp(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->name, name))
break;
}
if(!module)
{
if(Load)
{
module = (struct __ecereNameSpace__ecere__com__Instance *)__ecereNameSpace__ecere__com__eInstance_New(__ecereNameSpace__ecere__com__eSystem_FindClass(fromModule, "Module"));
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + 12)))->application;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->name = __ecereNameSpace__ecere__sys__CopyString(name);
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->origImportType = 1;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->Unload = (void *)Unload;
if(!Load(module))
{
__ecereNameSpace__ecere__com__eInstance_Delete((struct __ecereNameSpace__ecere__com__Instance *)module);
module = (((void *)0));
}
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + 12)))->application + 300)))->allModules, module);
}
if(module)
{
if(fromModule)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + 12)))->modules, (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__SubModule), ((struct __ecereNameSpace__ecere__com__SubModule *)__ecereTemp1)->module = module, ((struct __ecereNameSpace__ecere__com__SubModule *)__ecereTemp1)->importMode = importAccess, ((struct __ecereNameSpace__ecere__com__SubModule *)__ecereTemp1)));
}
module->_refCount++;
}
return module;
}

void __ecereNameSpace__ecere__com__eModule_Unload(struct __ecereNameSpace__ecere__com__Instance * fromModule, struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__sys__OldLink * m;

for(m = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + 12)))->modules.first; m; m = m->next)
{
if(m->data == module)
break;
}
if(m)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)fromModule + 12)))->modules, m);
(__ecereNameSpace__ecere__com__eInstance_DecRef(module), module = 0);
}
}

void __ecereNameSpace__ecere__com__eEnum_AddFixedValue(struct __ecereNameSpace__ecere__com__Class * _class, char * string, int value)
{
void * __ecereTemp1;

if(_class && _class->type == 4)
{
struct __ecereNameSpace__ecere__com__EnumClassData * data = (struct __ecereNameSpace__ecere__com__EnumClassData *)_class->data;
struct __ecereNameSpace__ecere__sys__NamedLink * item;

for(item = data->values.first; item; item = item->next)
if(!strcmp(item->name, string))
break;
if(!item)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&data->values, (__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(16), ((struct __ecereNameSpace__ecere__sys__NamedLink *)__ecereTemp1)->data = (void *)value, ((struct __ecereNameSpace__ecere__sys__NamedLink *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(string), ((struct __ecereNameSpace__ecere__sys__NamedLink *)__ecereTemp1)));
if(value > data->largest)
data->largest = value;
}
}
}

int __ecereNameSpace__ecere__com__eEnum_AddValue(struct __ecereNameSpace__ecere__com__Class * _class, char * string)
{
void * __ecereTemp1;

if(_class && _class->type == 4)
{
struct __ecereNameSpace__ecere__com__EnumClassData * data = (struct __ecereNameSpace__ecere__com__EnumClassData *)_class->data;
int value = data->largest + 1;
struct __ecereNameSpace__ecere__sys__NamedLink * item;

for(item = data->values.first; item; item = item->next)
if(!strcmp(item->name, string))
break;
if(!item)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&data->values, (__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(16), ((struct __ecereNameSpace__ecere__sys__NamedLink *)__ecereTemp1)->data = (void *)value, ((struct __ecereNameSpace__ecere__sys__NamedLink *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(string), ((struct __ecereNameSpace__ecere__sys__NamedLink *)__ecereTemp1)));
if(value > data->largest)
data->largest = value;
return value;
}
}
return -1;
}

static void __ecereNameSpace__ecere__com__NameSpace_Free(struct __ecereNameSpace__ecere__com__NameSpace * parentNameSpace)
{
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace;

(__ecereNameSpace__ecere__com__eSystem_Delete(parentNameSpace->name), parentNameSpace->name = 0);
while((nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&parentNameSpace->nameSpaces)))
{
__ecereNameSpace__ecere__com__NameSpace_Free(nameSpace);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&parentNameSpace->nameSpaces, (struct __ecereNameSpace__ecere__sys__BTNode *)nameSpace);
}
}

static void __ecereNameSpace__ecere__com__Application_Destructor(struct __ecereNameSpace__ecere__com__Instance * app)
{
if(((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->parsedCommand)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->argv), ((struct __ecereNameSpace__ecere__com__Application * )(((char * )app + 300)))->argv = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->parsedCommand), ((struct __ecereNameSpace__ecere__com__Application * )(((char * )app + 300)))->parsedCommand = 0);
}
}

static unsigned int __ecereNameSpace__ecere__com__Module_Constructor(struct __ecereNameSpace__ecere__com__Instance * module)
{
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->privateNameSpace.classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->privateNameSpace.defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->privateNameSpace.functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->privateNameSpace.nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->publicNameSpace.classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->publicNameSpace.defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->publicNameSpace.functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->publicNameSpace.nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
return 0x1;
}

static void __ecereNameSpace__ecere__com__Module_Destructor(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * _class;
struct __ecereNameSpace__ecere__com__DefinedExpression * def;
struct __ecereNameSpace__ecere__com__GlobalFunction * function;
struct __ecereNameSpace__ecere__com__Instance * m;
struct __ecereNameSpace__ecere__com__SubModule * handle;

for(m = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 300)))->allModules.first; m; m = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)m + 12)))->next)
{
struct __ecereNameSpace__ecere__com__SubModule * next;

for(handle = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)m + 12)))->modules.first; handle; handle = next)
{
next = handle->next;
if(handle->module == module)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)m + 12)))->modules, handle);
}
}
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->Unload)
{
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->origImportType == 1)
{
unsigned int (* Unload)(struct __ecereNameSpace__ecere__com__Instance * module) = (void *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->Unload;

Unload(module);
}
else
{
unsigned int (stdcall * Unload)(struct __ecereNameSpace__ecere__com__Instance * module) = (void *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->Unload;

Unload(module);
}
}
{
struct __ecereNameSpace__ecere__com__Instance * ourWorld = __ecereClass___ecereNameSpace__ecere__com__Class->module;
void * ourHandle = (((void *)0));

while((handle = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->modules.last))
{
struct __ecereNameSpace__ecere__com__Instance * depModule = handle->module;

if(depModule == ourWorld)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->modules, handle);
ourHandle = handle;
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->modules, handle);
(__ecereNameSpace__ecere__com__eInstance_DecRef(depModule), depModule = 0);
}
}
if(ourHandle)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(ourHandle), ourHandle = 0);
(__ecereNameSpace__ecere__com__eInstance_DecRef(ourWorld), ourWorld = 0);
}
}
for(; (_class = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->classes.first); )
{
if(_class->nameSpace)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * classLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*_class->nameSpace).classes, _class->name);
struct __ecereNameSpace__ecere__sys__OldLink * t;

for(t = _class->templatized.first; t; t = t->next)
{
struct __ecereNameSpace__ecere__com__Class * template = t->data;
struct __ecereNameSpace__ecere__com__BTNamedLink * link;

link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*template->nameSpace).classes, template->name);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*template->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)link);
template->nameSpace = (((void *)0));
}
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*_class->nameSpace).classes, (struct __ecereNameSpace__ecere__sys__BTNode *)classLink);
_class->nameSpace = (((void *)0));
}
_class->module = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->classes, _class);
if(!_class->count || _class->type != 0)
__ecereNameSpace__ecere__com__eClass_Unregister(_class);
else
{
}
}
for(; (def = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->defines.first); )
{
if(def->nameSpace)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * defLink;

for(defLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&(*def->nameSpace).defines); defLink; defLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)defLink)))
if(defLink->data == def)
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*def->nameSpace).defines, (struct __ecereNameSpace__ecere__sys__BTNode *)defLink);
break;
}
}
(__ecereNameSpace__ecere__com__eSystem_Delete(def->name), def->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(def->value), def->value = 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->defines, def);
}
for(; (function = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->functions.first); )
{
if(function->nameSpace)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * functionLink;

for(functionLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&(*function->nameSpace).functions); functionLink; functionLink = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)functionLink)))
if(functionLink->data == function)
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Delete(&(*function->nameSpace).functions, (struct __ecereNameSpace__ecere__sys__BTNode *)functionLink);
break;
}
}
(__ecereNameSpace__ecere__com__eSystem_Delete(function->name), function->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(function->dataTypeString), function->dataTypeString = 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->functions, function);
}
(__ecereNameSpace__ecere__com__eSystem_Delete(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->name), ((struct __ecereNameSpace__ecere__com__Module * )(((char * )module + 12)))->name = 0);
__ecereNameSpace__ecere__com__NameSpace_Free(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->privateNameSpace);
__ecereNameSpace__ecere__com__NameSpace_Free(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->publicNameSpace);
if(module != ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 300)))->allModules, module);
else
__ecereNameSpace__ecere__com__NameSpace_Free(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 300)))->systemNameSpace);
Instance_Module_Free(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->library);
}

static int __ecereNameSpace__ecere__com__GetEnumSize(struct __ecereNameSpace__ecere__com__Class * _class)
{
struct __ecereNameSpace__ecere__com__EnumClassData * data = (struct __ecereNameSpace__ecere__com__EnumClassData *)_class->data;

return data->largest + 1;
}

char * strlwr(char * string)
{
int c;

for(c = 0; string[c]; c++)
if(string[c] >= 'A' && string[c] <= 'Z')
string[c] += 'a' - 'A';
return string;
}

char * strupr(char * string)
{
int c;

for(c = 0; string[c]; c++)
if(string[c] >= 'a' && string[c] <= 'z')
string[c] -= 'a' - 'A';
return string;
}

struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_RegisterDefine(char * name, char * value, struct __ecereNameSpace__ecere__com__Instance * module, int declMode)
{
void * __ecereTemp1;
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace = (((void *)0));
int start = 0, c;

nameSpace = (declMode == 1) ? &((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->publicNameSpace : &((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->privateNameSpace;
if(declMode == 4)
nameSpace = &((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 300)))->systemNameSpace;
if(declMode != 3)
{
for(c = 0; name[c]; c++)
{
if(name[c] == '.' || (name[c] == ':' && name[c + 1] == ':'))
{
struct __ecereNameSpace__ecere__com__NameSpace * newSpace;
char * spaceName = __ecereNameSpace__ecere__com___malloc(c - start + 1);

strncpy(spaceName, name + start, c - start);
spaceName[c - start] = '\0';
newSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*nameSpace).nameSpaces, spaceName);
if(!newSpace)
{
newSpace = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__NameSpace) * (1));
(*newSpace).classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).name = spaceName;
(*newSpace).parent = nameSpace;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*nameSpace).nameSpaces, (struct __ecereNameSpace__ecere__sys__BTNode *)newSpace);
}
else
(__ecereNameSpace__ecere__com__eSystem_Delete(spaceName), spaceName = 0);
nameSpace = newSpace;
if(name[c] == ':')
c++;
start = c + 1;
}
}
}
else
c = strlen(name);
if(c - start && !__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*nameSpace).defines, name + start))
{
struct __ecereNameSpace__ecere__com__DefinedExpression * def = (def = __ecereNameSpace__ecere__com__eSystem_New0(20), def->name = __ecereNameSpace__ecere__sys__CopyString(name), def->nameSpace = nameSpace, def->value = __ecereNameSpace__ecere__sys__CopyString(value), def);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*nameSpace).defines, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(24), ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->name = def->name + start, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->data = def, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->defines, def);
return def;
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char * name, char * type, void * func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode)
{
void * __ecereTemp1;
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace = (((void *)0));
int start = 0, c;

nameSpace = (declMode == 1) ? &((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->publicNameSpace : &((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->privateNameSpace;
if(declMode == 4)
nameSpace = &((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 300)))->systemNameSpace;
if(declMode != 3)
{
for(c = 0; name[c]; c++)
{
if(name[c] == '.' || (name[c] == ':' && name[c + 1] == ':'))
{
struct __ecereNameSpace__ecere__com__NameSpace * newSpace;
char * spaceName = __ecereNameSpace__ecere__com___malloc(c - start + 1);

strncpy(spaceName, name + start, c - start);
spaceName[c - start] = '\0';
newSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*nameSpace).nameSpaces, spaceName);
if(!newSpace)
{
newSpace = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__NameSpace) * (1));
(*newSpace).classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).name = spaceName;
(*newSpace).parent = nameSpace;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*nameSpace).nameSpaces, (struct __ecereNameSpace__ecere__sys__BTNode *)newSpace);
}
else
(__ecereNameSpace__ecere__com__eSystem_Delete(spaceName), spaceName = 0);
nameSpace = newSpace;
if(name[c] == ':')
c++;
start = c + 1;
}
}
}
else
c = strlen(name);
if(c - start && !__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*nameSpace).functions, name + start))
{
struct __ecereNameSpace__ecere__com__GlobalFunction * function = (function = __ecereNameSpace__ecere__com__eSystem_New0(36), function->name = __ecereNameSpace__ecere__sys__CopyString(name), function->nameSpace = nameSpace, function->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(type), function->function = func, function->module = module, function);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*nameSpace).functions, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(24), ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->name = function->name + start, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)->data = function, ((struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereTemp1)));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->functions, function);
return function;
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_FindDefine(struct __ecereNameSpace__ecere__com__Instance * module, char * name)
{
if(name && module)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link;

link = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 300)))->systemNameSpace, name, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).defines);
if(link)
return link->data;
link = __ecereNameSpace__ecere__com__SearchModule(module, name, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).defines, 0x1);
if(link)
return link->data;
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_FindFunction(struct __ecereNameSpace__ecere__com__Instance * module, char * name)
{
if(name && module)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link;

link = __ecereNameSpace__ecere__com__SearchNameSpace(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 300)))->systemNameSpace, name, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).functions);
if(link)
return link->data;
link = __ecereNameSpace__ecere__com__SearchModule(module, name, &(*((struct __ecereNameSpace__ecere__com__NameSpace *)0)).functions, 0x1);
if(link)
return link->data;
}
return (((void *)0));
}

void * __ecereNameSpace__ecere__com__eSystem_Renew(void * memory, unsigned int size)
{
return __ecereNameSpace__ecere__com___realloc(memory, size);
}

void * __ecereNameSpace__ecere__com__eSystem_Renew0(void * memory, unsigned int size)
{
return __ecereNameSpace__ecere__com___crealloc(memory, size);
}

void * __ecereNameSpace__ecere__com__eSystem_New(unsigned int size)
{
return __ecereNameSpace__ecere__com___malloc(size);
}

void * __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size)
{
return __ecereNameSpace__ecere__com___calloc(1, size);
}

void __ecereNameSpace__ecere__com__eSystem_Delete(void * memory)
{
if(memory)
__ecereNameSpace__ecere__com___free(memory);
}

void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property)
{
if(instance && _property && _property->selfWatchable)
{
struct __ecereNameSpace__ecere__com__Class * _class;

for(_class = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class; _class; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__SelfWatcher * selfWatcher, * next;

for(selfWatcher = _class->selfWatchers.first; selfWatcher; selfWatcher = next)
{
next = selfWatcher->next;
if(selfWatcher->_property == _property)
selfWatcher->callback(instance);
}
}
}
}

void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property)
{
if(instance && _property && _property->isWatchable)
{
struct __ecereNameSpace__ecere__sys__OldList * watchers = (struct __ecereNameSpace__ecere__sys__OldList *)((unsigned char *)instance + _property->watcherOffset);
struct __ecereNameSpace__ecere__com__Watcher * watcher, * next;

for(watcher = (*watchers).first; watcher; watcher = next)
{
next = watcher->next;
watcher->callback(watcher->object, instance);
}
}
}

void __ecereNameSpace__ecere__com__eProperty_Watchable(struct __ecereNameSpace__ecere__com__Property * _property)
{
if(!_property->isWatchable)
{
struct __ecereNameSpace__ecere__com__Class * _class = _property->_class;

if(!_class->computeSize)
{
_property->watcherOffset = _class->structSize;
_class->structSize += sizeof(struct __ecereNameSpace__ecere__sys__OldList);
__ecereNameSpace__ecere__com__FixDerivativesBase(_class, _class);
}
_property->isWatchable = 0x1;
}
}

void __ecereNameSpace__ecere__com__eClass_DestructionWatchable(struct __ecereNameSpace__ecere__com__Class * _class)
{
if(!_class->destructionWatchOffset)
{
_class->destructionWatchOffset = _class->structSize;
_class->structSize += sizeof(struct __ecereNameSpace__ecere__sys__OldList);
__ecereNameSpace__ecere__com__FixDerivativesBase(_class, _class);
}
}

void __ecereNameSpace__ecere__com__eProperty_SelfWatch(struct __ecereNameSpace__ecere__com__Class * _class, char * name, void (* callback)(void *))
{
void * __ecereTemp1;

if(_class)
{
struct __ecereNameSpace__ecere__com__Property * _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, name, _class->module);

if(!_property)
_property = __ecereNameSpace__ecere__com__eClass_AddProperty(_class, name, (((void *)0)), (((void *)0)), (((void *)0)), 4);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->selfWatchers, (__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(16), ((struct __ecereNameSpace__ecere__com__SelfWatcher *)__ecereTemp1)->_property = _property, ((struct __ecereNameSpace__ecere__com__SelfWatcher *)__ecereTemp1)->callback = callback, ((struct __ecereNameSpace__ecere__com__SelfWatcher *)__ecereTemp1)));
_property->selfWatchable = 0x1;
}
}

void __ecereNameSpace__ecere__com__eInstance_Watch(void * instance, struct __ecereNameSpace__ecere__com__Property * _property, void * object, void (* callback)(void *, void *))
{
void * __ecereTemp1;

if(_property->isWatchable)
{
struct __ecereNameSpace__ecere__sys__OldList * watchers = (struct __ecereNameSpace__ecere__sys__OldList *)((unsigned char *)instance + _property->watcherOffset);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*watchers), (__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(16), ((struct __ecereNameSpace__ecere__com__Watcher *)__ecereTemp1)->callback = callback, ((struct __ecereNameSpace__ecere__com__Watcher *)__ecereTemp1)->object = object, ((struct __ecereNameSpace__ecere__com__Watcher *)__ecereTemp1)));
}
}

void __ecereNameSpace__ecere__com__eInstance_WatchDestruction(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Instance * object, void (* callback)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__Instance *))
{
void * __ecereTemp1;
struct __ecereNameSpace__ecere__sys__OldList * watchers = (struct __ecereNameSpace__ecere__sys__OldList *)((unsigned char *)instance + ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class->destructionWatchOffset);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*watchers), (__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(16), ((struct __ecereNameSpace__ecere__com__Watcher *)__ecereTemp1)->callback = callback, ((struct __ecereNameSpace__ecere__com__Watcher *)__ecereTemp1)->object = object, ((struct __ecereNameSpace__ecere__com__Watcher *)__ecereTemp1)));
}

void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object)
{
if(instance && (!_property || _property->isWatchable))
{
if(_property)
{
struct __ecereNameSpace__ecere__sys__OldList * watchers = (struct __ecereNameSpace__ecere__sys__OldList *)((unsigned char *)instance + _property->watcherOffset);
struct __ecereNameSpace__ecere__com__Watcher * watcher;

for(watcher = (*watchers).first; watcher; watcher = watcher->next)
if(watcher->object == object)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete((&*watchers), watcher);
break;
}
}
else
{
struct __ecereNameSpace__ecere__com__Class * _class, * base;

for(_class = ((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class; _class; _class = base)
{
if(_class->destructionWatchOffset)
{
struct __ecereNameSpace__ecere__sys__OldList * watchers = (struct __ecereNameSpace__ecere__sys__OldList *)((unsigned char *)instance + _class->destructionWatchOffset);
struct __ecereNameSpace__ecere__com__Watcher * watcher;

for(watcher = (*watchers).first; watcher; watcher = watcher->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete((&*watchers), watcher);
break;
}
}
for(_property = (struct __ecereNameSpace__ecere__com__Property *)_class->membersAndProperties.first; _property; _property = _property->next)
{
if(_property->isProperty && _property->isWatchable)
{
struct __ecereNameSpace__ecere__sys__OldList * watchers = (struct __ecereNameSpace__ecere__sys__OldList *)((unsigned char *)instance + _property->watcherOffset);
struct __ecereNameSpace__ecere__com__Watcher * watcher;

for(watcher = (*watchers).first; watcher; watcher = watcher->next)
if(watcher->object == object)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete((&*watchers), watcher);
break;
}
}
}
base = _class->base;
if(base && base->type == 1000)
base = (((void *)0));
}
}
}
}

struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eClass_GetDesigner(struct __ecereNameSpace__ecere__com__Class * _class)
{
for(; _class; _class = _class->base)
{
if(_class->designerClass)
return (struct __ecereNameSpace__ecere__com__Class *)__ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, _class->designerClass);
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eInstance_GetDesigner(struct __ecereNameSpace__ecere__com__Instance * instance)
{
if(instance)
return __ecereNameSpace__ecere__com__eClass_GetDesigner(((struct __ecereNameSpace__ecere__com__Instance *)(char *)instance)->_class);
return (((void *)0));
}

unsigned int __ecereNameSpace__ecere__com__LocateModule(char * name, char * fileName)
{
return Instance_LocateModule(name, fileName);
}

extern void __ecereNameSpace__ecere__com__InitializeDataTypes1(struct __ecereNameSpace__ecere__com__Instance * module);

extern void __ecereNameSpace__ecere__com__InitializeDataTypes(struct __ecereNameSpace__ecere__com__Instance * module);

extern double sin(struct __ecereNameSpace__ecere__com__Instance * number);

extern double sinh(struct __ecereNameSpace__ecere__com__Instance * number);

extern double cosh(struct __ecereNameSpace__ecere__com__Instance * number);

extern double tanh(struct __ecereNameSpace__ecere__com__Instance * number);

extern double sqrt(double number);

extern double cos(struct __ecereNameSpace__ecere__com__Instance * number);

extern double tan(struct __ecereNameSpace__ecere__com__Instance * number);

extern struct __ecereNameSpace__ecere__com__Instance * atan2(double y, double x);

extern struct __ecereNameSpace__ecere__com__Instance * asin(double number);

extern struct __ecereNameSpace__ecere__com__Instance * acos(double number);

extern struct __ecereNameSpace__ecere__com__Instance * atan(double number);

extern double pow(double number, double number2);

extern double fmod(double x, double y);

extern double fabs(double number);

extern double log(double number);

extern double log10(double number);

extern double ceil(double number);

extern double floor(double number);

extern double exp(double number);

extern void qsort(void * , unsigned int, unsigned int, int (* )(void * , void * ));

extern int system(const char * );

extern int atoi(const char * );

extern float atof(const char * );

extern int tolower(int);

extern int toupper(int);

extern unsigned int isdigit(int);

extern char *  getenv(const char *  name);

extern int rename(const char *  oldpath, const char *  newpath);

extern char *  strncat(char * , const char * , int n);

extern int strcasecmp(const char * , const char * );

extern int strncasecmp(const char * , const char * , int n);

extern int strncmp(const char * , const char * , int n);

extern int vsprintf(char * , const char * , __builtin_va_list);

extern int puts(char * );

extern int fputs(char * , void *  stream);

extern int isalnum(int c);

extern int isalpha(int c);

extern int islower(int c);

extern int isupper(int c);

extern int isprint(int c);

static void __ecereNameSpace__ecere__com__LoadCOM(struct __ecereNameSpace__ecere__com__Instance * module)
{
unsigned int force64Bits = ((unsigned int)((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application + 300)))->isGUIApp & 2) ? 0x1 : 0x0;
int pointerSize = force64Bits ? 8 : sizeof(void *);
struct __ecereNameSpace__ecere__com__Class * applicationClass;
struct __ecereNameSpace__ecere__com__Class * enumClass, * structClass, * boolClass;
struct __ecereNameSpace__ecere__com__Class * moduleClass;
struct __ecereNameSpace__ecere__com__Class * baseClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "class", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);

baseClass->type = 1000;
baseClass->memberOffset = 0;
baseClass->offset = 0;
baseClass->structSize = 0;
baseClass->typeSize = 0;
{
struct __ecereNameSpace__ecere__com__Class * instanceClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::Instance", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);

instanceClass->type = 1000;
instanceClass->fixed = 0x1;
instanceClass->memberOffset = 0;
instanceClass->offset = 0;
instanceClass->memberID = -3;
instanceClass->startMemberID = -3;
__ecereNameSpace__ecere__com__eClass_AddDataMember(instanceClass, "_vTbl", "int (**)()", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(instanceClass, "_class", "ecere::com::Class", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(instanceClass, "_refCount", "int", sizeof(int), sizeof(int), 1);
}
__ecereNameSpace__ecere__com__InitializeDataTypes1(module);
enumClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "enum", (((void *)0)), 0, force64Bits ? 32 : sizeof(struct __ecereNameSpace__ecere__com__EnumClassData), (((void *)0)), (((void *)0)), module, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddClassProperty(enumClass, "enumSize", "int", (((void *)0)), __ecereNameSpace__ecere__com__GetEnumSize)->constant = 0x1;
enumClass->type = 1000;
(__ecereNameSpace__ecere__com__eSystem_Delete(enumClass->dataTypeString), enumClass->dataTypeString = 0);
enumClass->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("int");
structClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "struct", (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
structClass->type = 1000;
structClass->memberOffset = 0;
structClass->offset = 0;
structClass->structSize = 0;
structClass->typeSize = 0;
__ecereNameSpace__ecere__com__InitializeDataTypes(module);
boolClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "bool", "uint", 0, 0, (((void *)0)), (((void *)0)), module, 4, 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(boolClass, "true", (unsigned int)0x1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(boolClass, "false", (unsigned int)0x0);
moduleClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::Module", (((void *)0)), force64Bits ? 8 + 8 + 32 + 32 + 32 + 32 + 8 + 8 + 8 + 8 + 8 + 8 + (32 + 8 + 8 + 4 * 32) + (32 + 8 + 8 + 4 * 32) : sizeof(struct __ecereNameSpace__ecere__com__Module), 0, (void *)__ecereNameSpace__ecere__com__Module_Constructor, (void *)__ecereNameSpace__ecere__com__Module_Destructor, module, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(moduleClass, "OnLoad", "bool()", (((void *)0)), 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(moduleClass, "OnUnload", "void()", (((void *)0)), 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(moduleClass, "Load", "Module(char * name, AccessMode importAccess)", __ecereNameSpace__ecere__com__eModule_Load, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(moduleClass, "Unload", "void(Module module)", __ecereNameSpace__ecere__com__eModule_Unload, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "application", "Application", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "classes", "OldList", force64Bits ? 32 : sizeof(struct __ecereNameSpace__ecere__sys__OldList), pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "defines", "OldList", force64Bits ? 32 : sizeof(struct __ecereNameSpace__ecere__sys__OldList), pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "functions", "OldList", force64Bits ? 32 : sizeof(struct __ecereNameSpace__ecere__sys__OldList), pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "modules", "OldList", force64Bits ? 32 : sizeof(struct __ecereNameSpace__ecere__sys__OldList), pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "prev", "Module", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "next", "Module", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "name", "char *", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "library", "void *", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "Unload", "void *", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "importType", "ImportType", sizeof(int), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "origImportType", "ImportType", sizeof(int), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "privateNameSpace", "NameSpace", force64Bits ? (32 + 8 + 8 + 4 * 32) : sizeof(struct __ecereNameSpace__ecere__com__NameSpace), pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(moduleClass, "publicNameSpace", "NameSpace", force64Bits ? (32 + 8 + 8 + 4 * 32) : sizeof(struct __ecereNameSpace__ecere__com__NameSpace), pointerSize, 1);
moduleClass->fixed = 0x1;
moduleClass->count++;
applicationClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::Application", "Module", force64Bits ? (32 + 32 + 8 + 32) : sizeof(struct __ecereNameSpace__ecere__com__Application), 0, (((void *)0)), (void *)__ecereNameSpace__ecere__com__Application_Destructor, module, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(applicationClass, "Main", "void()", (((void *)0)), 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(applicationClass, "argc", "int", sizeof(int), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(applicationClass, "argv", "char **", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(applicationClass, "exitCode", "int", sizeof(int), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(applicationClass, "isGUIApp", "bool", sizeof(unsigned int), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(applicationClass, "allModules", "OldList", force64Bits ? 32 : sizeof(struct __ecereNameSpace__ecere__sys__OldList), pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(applicationClass, "parsedCommand", "char *", pointerSize, pointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(applicationClass, "systemNameSpace", "NameSpace", force64Bits ? (32 + 8 + 8 + 4 * 32) : sizeof(struct __ecereNameSpace__ecere__com__NameSpace), pointerSize, 1);
applicationClass->fixed = 0x1;
applicationClass->count++;
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("sin", "double sin(Angle number)", sin, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("sinh", "double sinh(Angle number)", sinh, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("cosh", "double cosh(Angle number)", cosh, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("tanh", "double tanh(Angle number)", tanh, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("sqrt", "double sqrt(double number)", sqrt, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("cos", "double cos(Angle number)", cos, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("tan", "double tan(Angle number)", tan, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("atan2", "Angle atan2(double y, double x)", atan2, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("asin", "Angle asin(double number)", asin, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("acos", "Angle acos(double number)", acos, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("atan", "Angle atan(double number)", atan, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("pow", "double pow(double number, double number2)", pow, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("fmod", "double fmod(double x, double y)", fmod, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("fabs", "double fabs(double number)", fabs, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("log", "double log(double number)", log, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("log10", "double log10(double number)", log10, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ceil", "double ceil(double number)", ceil, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("floor", "double floor(double number)", floor, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("exp", "double exp(double number)", exp, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("qsort", "void qsort(void *, uint, uint, int (*)(void *, void *))", qsort, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strtod", "double strtod(char*, char**)", strtod, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strtol", "int strtol(char*, char**, int base)", strtol, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("system", "int system(const char*)", system, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("atoi", "int atoi(const char*)", atoi, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("atof", "float atof(const char*)", atof, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("tolower", "int tolower(int)", tolower, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("toupper", "int toupper(int)", toupper, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("isdigit", "bool isdigit(int)", isdigit, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("memset", "void memset(void * area, byte value, uint count)", memset, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("getenv", "char * getenv(const char * name)", getenv, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("rename", "int rename(const char *oldpath, const char *newpath)", rename, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strlen", "int strlen(const char *)", strlen, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strcat", "char * strcat(char *, const char *)", strcat, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strncat", "char * strncat(char *, const char *, int n)", strncat, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strchr", "char * strchr(char *, int)", strchr, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strstr", "char * strstr(char *, const char *)", strstr, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("fstrcmp", "(GetRuntimePlatform() == win32) ? strcmpi : strcmp", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("strcmpi", "strcasecmp", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("strnicmp", "strncasecmp", module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strcasecmp", "int strcasecmp(const char *, const char *)", strcasecmp, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strncasecmp", "int strncasecmp(const char *, const char *, int n)", strncasecmp, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strcmp", "int strcmp(const char *, const char *)", strcmp, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strncmp", "int strncmp(const char *, const char *, int n)", strncmp, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strlwr", "char * strlwr(char *)", strlwr, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strupr", "char * strupr(char *)", strupr, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strcpy", "char * strcpy(char *, const char *)", strcpy, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strncpy", "char * strncpy(char *, const char *, int n)", strncpy, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("memcpy", "void * memcpy(void *, const void *, uint size)", memcpy, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("memmove", "void * memmove(void *, const void *, uint size)", memmove, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("sprintf", "int sprintf(char *, char *, ...)", sprintf, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("snprintf", "int sprintf(char *, int, char *, ...)", snprintf, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("printf", "int printf(char *, ...)", printf, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("vsprintf", "int vsprintf(char*, const char*, __builtin_va_list)", vsprintf, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("vsnprintf", "int vsnprintf(char*, int, const char*, __builtin_va_list)", vsnprintf, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("puts", "int puts(char *)", puts, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("fputs", "int fputs(char *, void * stream)", fputs, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("isalnum", "int isalnum(int c)", isalnum, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("isspace", "int isspace(int c)", isspace, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("isalpha", "int isalpha(int c)", isalpha, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("islower", "int islower(int c)", islower, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("isupper", "int isupper(int c)", isupper, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("isprint", "int isprint(int c)", isprint, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("strtoul", "unsigned long strtoul(const char * nptr, char ** endptr, int base)", strtoul, module, 4);
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com____ecere_COM_Initialize(unsigned int guiApp, int argc, char * argv[])
{
struct __ecereNameSpace__ecere__com__Instance * app;

app = __ecereNameSpace__ecere__com___calloc(1, 428);
__ecereNameSpace__ecere__com__Module_Constructor(app);
((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->systemNameSpace.classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->systemNameSpace.defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->systemNameSpace.functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->systemNameSpace.nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
Instance_COM_Initialize(argc, argv, &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->parsedCommand, &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->argc, &((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->argv);
((struct __ecereNameSpace__ecere__com__Module *)(((char *)app + 12)))->application = app;
((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->allModules.offset = 12 + (unsigned int)&(*((struct __ecereNameSpace__ecere__com__Module *)0)).prev;
((struct __ecereNameSpace__ecere__com__Application *)(((char *)app + 300)))->isGUIApp = guiApp;
__ecereNameSpace__ecere__com__LoadCOM(app);
((struct __ecereNameSpace__ecere__com__Instance *)(char *)app)->_class = __ecereNameSpace__ecere__com__eSystem_FindClass(app, "Application");
return app;
}

struct __ecereNameSpace__ecere__com__ClassTemplateParameter * __ecereNameSpace__ecere__com__eClass_AddTemplateParameter(struct __ecereNameSpace__ecere__com__Class * _class, char * name, int type, void * info, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * defaultArg)
{
void * __ecereTemp1;

if(_class && name)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

for(param = _class->templateParams.first; param; param = param->next)
{
if(!strcmp(param->name, name))
return param;
}
param = (__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(36), ((struct __ecereNameSpace__ecere__com__ClassTemplateParameter *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(name), ((struct __ecereNameSpace__ecere__com__ClassTemplateParameter *)__ecereTemp1)->type = type, ((struct __ecereNameSpace__ecere__com__ClassTemplateParameter *)__ecereTemp1)->dataTypeString = (type == 1) ? info : __ecereNameSpace__ecere__sys__CopyString(info), ((struct __ecereNameSpace__ecere__com__ClassTemplateParameter *)__ecereTemp1));
if(defaultArg != (((void *)0)))
{
param->defaultArg = *defaultArg;
__ecereNameSpace__ecere__com__CopyTemplateArg(param, &param->defaultArg);
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_class->templateParams, param);
return param;
}
return (((void *)0));
}

void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(struct __ecereNameSpace__ecere__com__Class * base)
{
if(base)
{
struct __ecereNameSpace__ecere__sys__OldLink * derivative;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

{
void * first = base->templateParams.first;
int count = base->templateParams.count;

base->templateParams.first = (((void *)0));
base->templateParams.count = 0;
__ecereNameSpace__ecere__com__FreeTemplateArgs(base);
(__ecereNameSpace__ecere__com__eSystem_Delete(base->templateArgs), base->templateArgs = 0);
__ecereNameSpace__ecere__com__FreeTemplatesDerivatives(base);
base->templateParams.first = first;
base->templateParams.count = count;
}
for(param = base->templateParams.first; param; param = param->next)
{
if(param->type == 1 && param->defaultArg.memberString)
{
struct __ecereNameSpace__ecere__com__Class * memberClass = base;
char * colon = strstr(param->defaultArg.memberString, "::");
char * memberName;

if(colon)
{
char className[1024];
struct __ecereNameSpace__ecere__com__Class * sClass;

memcpy(className, param->defaultArg.memberString, colon - param->defaultArg.memberString);
className[colon - param->defaultArg.memberString] = '\0';
memberName = colon + 2;
for(sClass = base; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * cParam;
struct __ecereNameSpace__ecere__com__Class * nextClass;
int id = 0;

for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
id += nextClass->templateParams.count;
if(sClass == base || base->templateArgs)
{
for(cParam = sClass->templateParams.first; cParam; cParam = cParam->next)
{
if(cParam->type == 0 && !strcmp(cParam->name, className))
strcpy(className, (sClass == base) ? cParam->defaultArg.dataTypeString : base->templateArgs[id].dataTypeString);
id++;
}
}
}
memberClass = __ecereNameSpace__ecere__com__eSystem_FindClass(base->module, className);
if(!memberClass)
memberClass = __ecereNameSpace__ecere__com__eSystem_FindClass(((struct __ecereNameSpace__ecere__com__Module *)(((char *)base->module + 12)))->application, className);
}
else
memberName = param->defaultArg.memberString;
if(memberClass)
{
switch(param->memberType)
{
case 0:
param->defaultArg.member = __ecereNameSpace__ecere__com__eClass_FindDataMember(memberClass, memberName, memberClass->module, (((void *)0)), (((void *)0)));
break;
case 1:
param->defaultArg.method = __ecereNameSpace__ecere__com__eClass_FindMethod(memberClass, memberName, memberClass->module);
break;
case 2:
param->defaultArg.prop = __ecereNameSpace__ecere__com__eClass_FindProperty(memberClass, memberName, memberClass->module);
break;
}
}
}
}
__ecereNameSpace__ecere__com__FixDerivativesBase(base, base);
}
}

static void __ecereNameSpace__ecere__com__FreeTemplatesDerivatives(struct __ecereNameSpace__ecere__com__Class * base)
{
struct __ecereNameSpace__ecere__sys__OldLink * derivative, * templateLink;

for(derivative = base->derivatives.first; derivative; derivative = derivative->next)
{
struct __ecereNameSpace__ecere__com__Class * _class = derivative->data;

if(_class->templateArgs)
{
__ecereNameSpace__ecere__com__FreeTemplateArgs(_class);
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->templateArgs), _class->templateArgs = 0);
}
__ecereNameSpace__ecere__com__FreeTemplatesDerivatives(_class);
}
for(templateLink = base->templatized.first; templateLink; templateLink = templateLink->next)
{
struct __ecereNameSpace__ecere__com__Class * _class = templateLink->data;

if(_class->templateArgs)
{
__ecereNameSpace__ecere__com__FreeTemplateArgs(_class);
(__ecereNameSpace__ecere__com__eSystem_Delete(_class->templateArgs), _class->templateArgs = 0);
}
__ecereNameSpace__ecere__com__FreeTemplatesDerivatives(_class);
}
}

static const char * __ecereNameSpace__ecere__com__platformNames[4] = 
{
"", "win32", "linux", "apple"
};

static const int __ecereNameSpace__ecere__com__firstPlatform = 1;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Platform_char__PTR_, * __ecerePropM___ecereNameSpace__ecere__com__Platform_char__PTR_;

static const int __ecereNameSpace__ecere__com__lastPlatform = 3;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Platform;

int __ecereVMethodID_class_OnGetString;

char *  __ecereProp___ecereNameSpace__ecere__com__Platform_Get_char__PTR_(int this)
{
return ((char *  (*)(struct __ecereNameSpace__ecere__com__Class *, void *, char *  tempString, void *  fieldData, unsigned int *  needClass))__ecereClass___ecereNameSpace__ecere__com__Platform->_vTbl[__ecereVMethodID_class_OnGetString])(__ecereClass___ecereNameSpace__ecere__com__Platform, &this, (((void *)0)), (((void *)0)), (((void *)0)));
}

int __ecereProp___ecereNameSpace__ecere__com__Platform_Set_char__PTR_(char *  value)
{
if(value)
{
int c;

for(c = __ecereNameSpace__ecere__com__firstPlatform; c <= __ecereNameSpace__ecere__com__lastPlatform; c++)
if(!strcasecmp(value, __ecereNameSpace__ecere__com__platformNames[c]))
return c;
}
return 0;
}

char * __ecereMethod___ecereNameSpace__ecere__com__Platform_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, int * this, char * tempString, void * fieldData, unsigned int * needClass)
{
if((*(this)) >= __ecereNameSpace__ecere__com__firstPlatform && (*(this)) <= __ecereNameSpace__ecere__com__lastPlatform)
{
if(tempString)
strcpy(tempString, __ecereNameSpace__ecere__com__platformNames[*(int *)this]);
return __ecereNameSpace__ecere__com__platformNames[*(int *)this];
}
if(tempString && tempString[0])
tempString[0] = '\0';
return (((void *)0));
}

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Platform_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * class, int * this, char * string)
{
(*(this)) = __ecereProp___ecereNameSpace__ecere__com__Platform_Set_char__PTR_(string);
return (unsigned int)*(int *)this;
}

extern int runtimePlatform;

int __ecereNameSpace__ecere__com__GetRuntimePlatform()
{
return runtimePlatform;
}

struct __ecereNameSpace__ecere__com__ObjectInfo
{
struct __ecereNameSpace__ecere__com__ObjectInfo * prev, * next;
struct __ecereNameSpace__ecere__com__Instance * instance;
char * name;
struct __ecereNameSpace__ecere__com__Instance * instCode;
unsigned int deleted;
struct __ecereNameSpace__ecere__com__ObjectInfo * oClass;
struct __ecereNameSpace__ecere__sys__OldList instances;
struct __ecereNameSpace__ecere__com__Instance * classDefinition;
unsigned int modified;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ObjectInfo;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__DesignerBase_classDesigner, * __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_classDesigner;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__DesignerBase_objectClass, * __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_objectClass;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__DesignerBase_isDragging, * __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_isDragging;

struct __ecereNameSpace__ecere__com__DesignerBase
{
struct __ecereNameSpace__ecere__com__Instance * classDesigner;
char * objectClass;
unsigned int isDragging;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DesignerBase;

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Get_classDesigner(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__DesignerBase * __ecerePointer___ecereNameSpace__ecere__com__DesignerBase = (struct __ecereNameSpace__ecere__com__DesignerBase *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__DesignerBase->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__com__DesignerBase->classDesigner;
}

void __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Set_classDesigner(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Instance * value)
{
struct __ecereNameSpace__ecere__com__DesignerBase * __ecerePointer___ecereNameSpace__ecere__com__DesignerBase = (struct __ecereNameSpace__ecere__com__DesignerBase *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__DesignerBase->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__com__DesignerBase->classDesigner = value;
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__com__DesignerBase_classDesigner), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_classDesigner);
}

char *  __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Get_objectClass(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__DesignerBase * __ecerePointer___ecereNameSpace__ecere__com__DesignerBase = (struct __ecereNameSpace__ecere__com__DesignerBase *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__DesignerBase->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__com__DesignerBase->objectClass;
}

void __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Set_objectClass(struct __ecereNameSpace__ecere__com__Instance * this, char *  value)
{
struct __ecereNameSpace__ecere__com__DesignerBase * __ecerePointer___ecereNameSpace__ecere__com__DesignerBase = (struct __ecereNameSpace__ecere__com__DesignerBase *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__DesignerBase->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__com__DesignerBase->objectClass = value;
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__com__DesignerBase_objectClass), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_objectClass);
}

unsigned int __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Get_isDragging(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__com__DesignerBase * __ecerePointer___ecereNameSpace__ecere__com__DesignerBase = (struct __ecereNameSpace__ecere__com__DesignerBase *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__DesignerBase->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__com__DesignerBase->isDragging;
}

void __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Set_isDragging(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value)
{
struct __ecereNameSpace__ecere__com__DesignerBase * __ecerePointer___ecereNameSpace__ecere__com__DesignerBase = (struct __ecereNameSpace__ecere__com__DesignerBase *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__com__DesignerBase->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__com__DesignerBase->isDragging = value;
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__com__DesignerBase_isDragging), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_isDragging);
}

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassDesignerBase;

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__activeDesigner;

void __ecereNameSpace__ecere__com__SetActiveDesigner(struct __ecereNameSpace__ecere__com__Instance * designer)
{
__ecereNameSpace__ecere__com__activeDesigner = designer;
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__GetActiveDesigner()
{
return __ecereNameSpace__ecere__com__activeDesigner;
}



unsigned int __ecereNameSpace__ecere__sys__UTF8Validate(char * source)
{
if(source)
{
int c;

for(c = 0; source[c]; )
{
unsigned char ch = source[c];
unsigned int codePoint = 0;
int numBytes = 1;
int i;
unsigned char mask = (unsigned char)0x7F;

if(ch & (unsigned char)0x80)
{
if(ch & (unsigned char)0x40)
{
mask >>= 2;
numBytes++;
if(ch & (unsigned char)0x20)
{
numBytes++;
mask >>= 1;
if(ch & (unsigned char)0x10)
{
if(ch & (unsigned char)0x08)
return 0x0;
numBytes++;
mask >>= 1;
}
}
}
else
return 0x0;
}
for(i = 0; i < numBytes && (ch = source[c]); i++, c++)
{
codePoint <<= 6;
codePoint |= ch & mask;
mask = (unsigned char)0x3F;
if(i > 1)
{
if(!(ch & (unsigned char)0x80) || (ch & (unsigned char)0x40))
return 0x0;
}
}
if(i < numBytes)
return 0x0;
if(codePoint > 0x10FFFF || (codePoint >= 0xD800 && codePoint <= 0xDFFF) || (codePoint < 0x80 && numBytes > 1) || (codePoint < 0x800 && numBytes > 2) || (codePoint < 0x10000 && numBytes > 3))
return 0x0;
}
}
return 0x1;
}

int __ecereNameSpace__ecere__sys__ISO8859_1toUTF8(char * source, char * dest, int max)
{
int c;
int d = 0;

for(c = 0; source[c]; c++)
{
unsigned int ch = ((unsigned char *)source)[c];

if(ch < 0x80)
{
if(d + 1 >= max)
break;
dest[d++] = (char)ch;
}
else if(ch < 0x800)
{
if(d + 2 >= max)
break;
dest[d++] = (unsigned char)0xC0 | (unsigned char)((ch & 0x7C0) >> 6);
dest[d++] = (unsigned char)0x80 | (unsigned char)(ch & 0x03F);
}
else if(ch < 0x10000)
{
if(d + 3 >= max)
break;
dest[d++] = (unsigned char)0xE0 | (unsigned char)((ch & 0xF000) >> 12);
dest[d++] = (unsigned char)0x80 | (unsigned char)((ch & 0xFC0) >> 6);
dest[d++] = (unsigned char)0x80 | (unsigned char)(ch & 0x03F);
}
else
{
if(d + 4 >= max)
break;
dest[d++] = (unsigned char)0xF0 | (unsigned char)((ch & 0x1C0000) >> 18);
dest[d++] = (unsigned char)0x80 | (unsigned char)((ch & 0x3F000) >> 12);
dest[d++] = (unsigned char)0x80 | (unsigned char)((ch & 0xFC0) >> 6);
dest[d++] = (unsigned char)0x80 | (unsigned char)(ch & 0x03F);
}
}
dest[d] = (char)0;
return d;
}

char * __ecereNameSpace__ecere__sys__UTF16toUTF8(unsigned short * source)
{
int c;
int d = 0;
int len;
char * dest;
unsigned short u16;
unsigned int invert = 0x0;

for(len = 0; source[len]; len++)
;
dest = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (len * 3 + 1));
for(c = 0; (u16 = source[c]); c++)
{
unsigned int ch;

if(!c && (u16 == (unsigned short)0xFFFE || u16 == (unsigned short)0xFEFF))
{
if(u16 == (unsigned short)0xFFFE)
invert = 0x1;
continue;
}
if(invert)
{
u16 = ((u16 & (unsigned short)0xFF00) >> (unsigned short)8) | ((u16 & (unsigned short)0x00FF) << (unsigned short)8);
}
if(u16 < (unsigned short)0xD800 || u16 > (unsigned short)0xDBFF)
ch = u16;
else
ch = (u16 << 10) + source[c++] + (0x10000 - (0xD800 << 10) - 0xDC00);
if(ch < 0x80)
{
dest[d++] = (char)ch;
}
else if(ch < 0x800)
{
dest[d++] = (unsigned char)0xC0 | (unsigned char)((ch & 0x7C0) >> 6);
dest[d++] = (unsigned char)0x80 | (unsigned char)(ch & 0x03F);
}
else if(ch < 0x10000)
{
dest[d++] = (unsigned char)0xE0 | (unsigned char)((ch & 0xF000) >> 12);
dest[d++] = (unsigned char)0x80 | (unsigned char)((ch & 0xFC0) >> 6);
dest[d++] = (unsigned char)0x80 | (unsigned char)(ch & 0x03F);
}
else
{
dest[d++] = (unsigned char)0xF0 | (unsigned char)((ch & 0x1C0000) >> 18);
dest[d++] = (unsigned char)0x80 | (unsigned char)((ch & 0x3F000) >> 12);
dest[d++] = (unsigned char)0x80 | (unsigned char)((ch & 0xFC0) >> 6);
dest[d++] = (unsigned char)0x80 | (unsigned char)(ch & 0x03F);
}
}
dest[d] = (char)0;
dest = __ecereNameSpace__ecere__com__eSystem_Renew(dest, sizeof(char) * (d + 1));
return dest;
}

int __ecereNameSpace__ecere__sys__UTF16toUTF8Buffer(unsigned short * source, unsigned char * dest, int max)
{
int c;
int d = 0;
unsigned short u16;

for(c = 0; (u16 = source[c]); c++)
{
unsigned int ch;

if(u16 < (unsigned short)0xD800 || u16 > (unsigned short)0xDBFF)
ch = u16;
else
ch = (u16 << 10) + source[c++] + (0x10000 - (0xD800 << 10) - 0xDC00);
if(ch < 0x80)
{
if(d + 1 >= max)
break;
dest[d++] = (char)ch;
}
else if(ch < 0x800)
{
if(d + 2 >= max)
break;
dest[d++] = (unsigned char)0xC0 | (unsigned char)((ch & 0x7C0) >> 6);
dest[d++] = (unsigned char)0x80 | (unsigned char)(ch & 0x03F);
}
else if(ch < 0x10000)
{
if(d + 3 >= max)
break;
dest[d++] = (unsigned char)0xE0 | (unsigned char)((ch & 0xF000) >> 12);
dest[d++] = (unsigned char)0x80 | (unsigned char)((ch & 0xFC0) >> 6);
dest[d++] = (unsigned char)0x80 | (unsigned char)(ch & 0x03F);
}
else
{
if(d + 4 >= max)
break;
dest[d++] = (unsigned char)0xF0 | (unsigned char)((ch & 0x1C0000) >> 18);
dest[d++] = (unsigned char)0x80 | (unsigned char)((ch & 0x3F000) >> 12);
dest[d++] = (unsigned char)0x80 | (unsigned char)((ch & 0xFC0) >> 6);
dest[d++] = (unsigned char)0x80 | (unsigned char)(ch & 0x03F);
}
}
dest[d] = (unsigned char)0;
return d;
}

unsigned int __ecereNameSpace__ecere__sys__UTF8GetChar(char * string, int * numBytes)
{
unsigned int ch;
unsigned char b = ((unsigned char *)string)[0];
int i;
unsigned char mask = (unsigned char)0x7F;
int nb = 1;

ch = 0;
if(b & (unsigned char)0x80)
{
if(b & (unsigned char)0x40)
{
mask >>= 2;
nb++;
if(b & (unsigned char)0x20)
{
nb++;
mask >>= 1;
if(b & (unsigned char)0x10)
{
if(b & (unsigned char)0x08)
{
nb = 0;
}
nb++;
mask >>= 1;
}
}
}
else
nb = 0;
}
for(i = 0; i < nb; i++)
{
ch <<= 6;
ch |= (b = ((unsigned char *)string)[i]) & mask;
mask = (unsigned char)0x3F;
if(i > 1 && (!(b & (unsigned char)0x80) || (b & (unsigned char)0x40)))
{
nb = 0;
ch = 0;
}
}
if(i < nb || ch > 0x10FFFF || (ch >= 0xD800 && ch <= 0xDFFF) || (ch < 0x80 && nb > 1) || (ch < 0x800 && nb > 2) || (ch < 0x10000 && nb > 3))
{
ch = 0;
nb = 0;
}
if(numBytes)
*numBytes = nb;
return ch;
}

int __ecereNameSpace__ecere__sys__UTF8toUTF16Buffer(char * source, unsigned short * dest, int max)
{
if(source)
{
int c;
int d = 0;

for(c = 0; source[c]; )
{
unsigned char ch = source[c];
unsigned int codePoint = 0;
int numBytes = 1;
int i;
unsigned char mask = (unsigned char)0x7F;

if(ch & (unsigned char)0x80 && ch & (unsigned char)0x40)
{
mask >>= 2;
numBytes++;
if(ch & (unsigned char)0x20)
{
numBytes++;
mask >>= 1;
if(ch & (unsigned char)0x10)
{
numBytes++;
mask >>= 1;
}
}
}
for(i = 0; i < numBytes; i++)
{
codePoint <<= 6;
codePoint |= source[c++] & mask;
mask = (unsigned char)0x3F;
}
if(codePoint > 0xFFFF)
{
unsigned short lead = (unsigned short)((0xD800 - (0x10000 >> 10)) + (codePoint >> 10));
unsigned short trail = (unsigned short)0xDC00 + (unsigned short)(codePoint & 0x3FF);

if(d >= max - 1)
break;
dest[d++] = lead;
dest[d++] = trail;
}
else
{
if(d >= max)
break;
dest[d++] = (unsigned short)codePoint;
}
}
dest[d] = (unsigned short)0;
return d;
}
return 0;
}

int __ecereNameSpace__ecere__sys__UTF32toUTF8Len(unsigned int * source, int count, unsigned char * dest, int max)
{
int c;
int d = 0;
unsigned int ch;

for(c = 0; c < count && (ch = source[c]); c++)
{
if(ch < 0x80)
{
if(d + 1 >= max)
break;
dest[d++] = (char)ch;
}
else if(ch < 0x800)
{
if(d + 2 >= max)
break;
dest[d++] = (unsigned char)0xC0 | (unsigned char)((ch & 0x7C0) >> 6);
dest[d++] = (unsigned char)0x80 | (unsigned char)(ch & 0x03F);
}
else if(ch < 0x10000)
{
if(d + 3 >= max)
break;
dest[d++] = (unsigned char)0xE0 | (unsigned char)((ch & 0xF000) >> 12);
dest[d++] = (unsigned char)0x80 | (unsigned char)((ch & 0xFC0) >> 6);
dest[d++] = (unsigned char)0x80 | (unsigned char)(ch & 0x03F);
}
else
{
if(d + 4 >= max)
break;
dest[d++] = (unsigned char)0xF0 | (unsigned char)((ch & 0x1C0000) >> 18);
dest[d++] = (unsigned char)0x80 | (unsigned char)((ch & 0x3F000) >> 12);
dest[d++] = (unsigned char)0x80 | (unsigned char)((ch & 0xFC0) >> 6);
dest[d++] = (unsigned char)0x80 | (unsigned char)(ch & 0x03F);
}
}
dest[d] = (unsigned char)0;
return d;
}

unsigned short * __ecereNameSpace__ecere__sys__UTF8toUTF16(char * source, int * wordCount)
{
if(source)
{
int len = strlen(source);
unsigned short * dest = __ecereNameSpace__ecere__com__eSystem_New(sizeof(unsigned short) * (len + 1));
int c;
int d = 0;

for(c = 0; source[c]; )
{
unsigned char ch = source[c];
unsigned int codePoint = 0;
int numBytes = 1;
int i;
unsigned char mask = (unsigned char)0x7F;

if(ch & (unsigned char)0x80 && ch & (unsigned char)0x40)
{
mask >>= 2;
numBytes++;
if(ch & (unsigned char)0x20)
{
numBytes++;
mask >>= 1;
if(ch & (unsigned char)0x10)
{
numBytes++;
mask >>= 1;
}
}
}
for(i = 0; i < numBytes; i++)
{
codePoint <<= 6;
codePoint |= source[c++] & mask;
mask = (unsigned char)0x3F;
}
if(codePoint > 0xFFFF)
{
unsigned short lead = (unsigned short)((0xD800 - (0x10000 >> 10)) + (codePoint >> 10));
unsigned short trail = (unsigned short)0xDC00 + (unsigned short)(codePoint & 0x3FF);

dest[d++] = lead;
dest[d++] = trail;
}
else
{
dest[d++] = (unsigned short)codePoint;
}
}
dest[d] = (unsigned short)0;
if(wordCount)
*wordCount = d;
return dest;
}
return (((void *)0));
}

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_FindObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_RenameObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_SelectObjectFromDesigner;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_CodeAddObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_SheetAddObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_AddToolBoxClass;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_AddDefaultMethod;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_DeleteObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_ObjectContainsCode;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_ModifyCode;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_UpdateProperties;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_Reset;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_AddObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_SelectObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_ListToolBoxClasses;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_PrepareTestObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_CreateObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_PostCreateObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_DroppedObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_DestroyObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_FixProperty;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_CreateNew;

void __ecereRegisterModule_instance(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::com::null", "((void *)0)", module, 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(3, "ecere::com::unichar", "uint", 0, 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__unichar = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod___ecereNameSpace__ecere__com__unichar_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetDataFromString", 0, __ecereMethod___ecereNameSpace__ecere__com__unichar_OnGetDataFromString, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::Property", 0, sizeof(struct __ecereNameSpace__ecere__com__Property), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Property = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::Property", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::Property", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isProperty", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberAccess", "ecere::com::AccessMode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "id", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_class", "ecere::com::Class", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeString", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeClass", "ecere::com::Class", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "Type", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Set", "void( *)()", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Get", "int( *)()", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "IsSet", "bool( *)()", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "data", "void *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbol", "void *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "vid", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "conversion", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "watcherOffset", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "category", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "compiled", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "selfWatchable", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isWatchable", "bool", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
if(class)
class->noExpansion = (unsigned int)1;
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::MemoryGuard_PushLoc", "void ecere::com::MemoryGuard_PushLoc(char * loc)", __ecereNameSpace__ecere__com__MemoryGuard_PushLoc, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::MemoryGuard_PopLoc", "void ecere::com::MemoryGuard_PopLoc(void)", __ecereNameSpace__ecere__com__MemoryGuard_PopLoc, module, 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::BTNamedLink", 0, sizeof(struct __ecereNameSpace__ecere__com__BTNamedLink), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__BTNamedLink = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "parent", "ecere::com::BTNamedLink", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "left", "ecere::com::BTNamedLink", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "right", "ecere::com::BTNamedLink", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "depth", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "data", "void *", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::SelfWatcher", 0, sizeof(struct __ecereNameSpace__ecere__com__SelfWatcher), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__SelfWatcher = class;
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::AccessMode", 0, 0, 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__AccessMode = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "defaultAccess", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "publicAccess", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "privateAccess", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "staticAccess", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "baseSystemAccess", 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::SubModule", 0, sizeof(struct __ecereNameSpace__ecere__com__SubModule), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__SubModule = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::SubModule", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::SubModule", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "module", "ecere::com::Module", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "importMode", "ecere::com::AccessMode", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::DataMemberType", 0, 0, 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__DataMemberType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "normalMember", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "unionMember", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "structMember", 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::ClassType", 0, 0, 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ClassType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "normalClass", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "structClass", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "bitClass", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "unitClass", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "enumClass", 4);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "noHeadClass", 5);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "unionClass", 6);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "systemClass", 1000);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::Class", 0, sizeof(struct __ecereNameSpace__ecere__com__Class), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Class = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnFree", 0, __ecereMethod___ecereNameSpace__ecere__com__Class_OnFree, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod___ecereNameSpace__ecere__com__Class_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetDataFromString", 0, __ecereMethod___ecereNameSpace__ecere__com__Class_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnSerialize", 0, __ecereMethod___ecereNameSpace__ecere__com__Class_OnSerialize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnUnserialize", 0, __ecereMethod___ecereNameSpace__ecere__com__Class_OnUnserialize, 1);
__ecereProp___ecereNameSpace__ecere__com__Class_char__PTR_ = __ecereNameSpace__ecere__com__eClass_AddProperty(class, 0, "char *", __ecereProp___ecereNameSpace__ecere__com__Class_Set_char__PTR_, __ecereProp___ecereNameSpace__ecere__com__Class_Get_char__PTR_, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::Class", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::Class", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "offset", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "structSize", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_vTbl", "int( * *)()", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "vTblSize", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Constructor", "int( *)(ecere::com::Instance)", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Destructor", "void( *)(ecere::com::Instance)", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "offsetClass", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "sizeClass", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "base", "ecere::com::Class", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "methods", "ecere::sys::BinaryTree", 16, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "members", "ecere::sys::BinaryTree", 16, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prop", "ecere::sys::BinaryTree", 16, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "membersAndProperties", "ecere::sys::OldList", 20, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "classProperties", "ecere::sys::BinaryTree", 16, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "derivatives", "ecere::sys::OldList", 20, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberID", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "startMemberID", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ecere::com::ClassType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "module", "ecere::com::Module", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "nameSpace", "ecere::com::NameSpace *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeString", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "Type", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "typeSize", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "defaultAlignment", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Initialize", "void( *)()", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberOffset", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "selfWatchers", "ecere::sys::OldList", 20, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "designerClass", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "noExpansion", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "defaultProperty", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "comRedefinition", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "count", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isRemote", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "internalDecl", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "data", "void *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "computeSize", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "structAlignment", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "destructionWatchOffset", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "fixed", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "delayedCPValues", "ecere::sys::OldList", 20, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "inheritanceAccess", "ecere::com::AccessMode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "fullName", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbol", "void *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "conversions", "ecere::sys::OldList", 20, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "templateParams", "ecere::sys::OldList", 20, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "templateArgs", "ecere::com::ClassTemplateArgument *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "templateClass", "ecere::com::Class", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "templatized", "ecere::sys::OldList", 20, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "numParams", "int", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
if(class)
class->noExpansion = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::TemplateParameterType", 0, 0, 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__TemplateParameterType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "type", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "identifier", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "expression", 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::TemplateMemberType", 0, 0, 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__TemplateMemberType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "dataMember", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "method", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "prop", 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::com::ClassTemplateArgument", 0, sizeof(struct __ecereNameSpace__ecere__com__ClassTemplateArgument), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ClassTemplateArgument = class;
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "dataTypeString", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "dataTypeClass", "ecere::com::Class", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "expression", "ecere::com::DataValue", 8, 8, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "memberString", "char *", 4, 4, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember2 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember2, "member", "ecere::com::DataMember", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember2, "prop", "ecere::com::Property", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember2, "method", "ecere::com::Method", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember1, dataMember2);
}
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::ClassTemplateParameter", 0, sizeof(struct __ecereNameSpace__ecere__com__ClassTemplateParameter), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ClassTemplateParameter = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::ClassTemplateParameter", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::ClassTemplateParameter", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ecere::com::TemplateParameterType", 4, 4, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "dataTypeString", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "memberType", "ecere::com::TemplateMemberType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "defaultArg", "ecere::com::ClassTemplateArgument", 8, 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "param", "void *", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::MethodType", 0, 0, 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__MethodType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "normalMethod", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "virtualMethod", 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::Method", 0, sizeof(struct __ecereNameSpace__ecere__com__Method), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Method = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "parent", "ecere::com::Method", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "left", "ecere::com::Method", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "right", "ecere::com::Method", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "depth", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "function", "int( *)()", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "vid", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ecere::com::MethodType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_class", "ecere::com::Class", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbol", "void *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeString", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "Type", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberAccess", "ecere::com::AccessMode", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::ImportType", 0, 0, 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ImportType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "normalImport", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "staticImport", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "remoteImport", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "preDeclImport", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "comCheckImport", 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::com::NameSpace", 0, sizeof(struct __ecereNameSpace__ecere__com__NameSpace), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__NameSpace = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "btParent", "ecere::com::NameSpace *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "left", "ecere::com::NameSpace *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "right", "ecere::com::NameSpace *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "depth", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "parent", "ecere::com::NameSpace *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "nameSpaces", "ecere::sys::BinaryTree", 16, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "classes", "ecere::sys::BinaryTree", 16, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "defines", "ecere::sys::BinaryTree", 16, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "functions", "ecere::sys::BinaryTree", 16, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::com::DataValue", 0, sizeof(struct __ecereNameSpace__ecere__com__DataValue), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__DataValue = class;
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "c", "char", 1, 1, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "uc", "byte", 1, 1, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "s", "short", 2, 2, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "us", "uint16", 2, 2, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "i", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "ui", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "p", "void *", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "f", "float", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "d", "double", 8, 8, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "i64", "int64", 8, 8, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "ui64", "uint64", 8, 8, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::DataMember", 0, sizeof(struct __ecereNameSpace__ecere__com__DataMember), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__DataMember = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::DataMember", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::DataMember", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isProperty", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberAccess", "ecere::com::AccessMode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "id", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_class", "ecere::com::Class", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeString", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeClass", "ecere::com::Class", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "Type", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ecere::com::DataMemberType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "offset", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberID", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "members", "ecere::sys::OldList", 20, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "membersAlpha", "ecere::sys::BinaryTree", 16, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberOffset", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "structAlignment", "int", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::BitMember", 0, sizeof(struct __ecereNameSpace__ecere__com__BitMember), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__BitMember = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::BitMember", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::BitMember", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isProperty", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberAccess", "ecere::com::AccessMode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "id", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_class", "ecere::com::Class", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeString", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeClass", "ecere::com::Class", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "Type", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ecere::com::DataMemberType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "size", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "pos", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "mask", "uint64", 8, 8, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::ClassProperty", 0, sizeof(struct __ecereNameSpace__ecere__com__ClassProperty), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ClassProperty = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "parent", "ecere::com::ClassProperty", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "left", "ecere::com::ClassProperty", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "right", "ecere::com::ClassProperty", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "depth", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Set", "void( *)(ecere::com::Class, int)", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Get", "int( *)(ecere::com::Class)", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeString", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "Type", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "constant", "bool", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::DefinedExpression", 0, sizeof(struct __ecereNameSpace__ecere__com__DefinedExpression), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__DefinedExpression = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::DefinedExpression", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::DefinedExpression", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "value", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "nameSpace", "ecere::com::NameSpace *", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::GlobalFunction", 0, sizeof(struct __ecereNameSpace__ecere__com__GlobalFunction), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__GlobalFunction = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::GlobalFunction", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::GlobalFunction", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "function", "int( *)()", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "module", "ecere::com::Module", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "nameSpace", "ecere::com::NameSpace *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeString", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "Type", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbol", "void *", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::EnumClassData", 0, sizeof(struct __ecereNameSpace__ecere__com__EnumClassData), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__EnumClassData = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "values", "ecere::sys::OldList", 20, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "largest", "int", 4, 4, 1);
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::Watcher", 0, sizeof(struct __ecereNameSpace__ecere__com__Watcher), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Watcher = class;
if(class)
class->fixed = (unsigned int)1;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::MemBlock", 0, sizeof(struct __ecereNameSpace__ecere__com__MemBlock), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__MemBlock = class;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::MemPart", 0, sizeof(struct __ecereNameSpace__ecere__com__MemPart), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__MemPart = class;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::com::BlockPool", 0, sizeof(struct __ecereNameSpace__ecere__com__BlockPool), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__BlockPool = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Add", "ecere::com::MemBlock Add()", __ecereMethod___ecereNameSpace__ecere__com__BlockPool_Add, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Expand", "bool Expand(unsigned int numBlocks)", __ecereMethod___ecereNameSpace__ecere__com__BlockPool_Expand, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Remove", "void Remove(ecere::com::MemBlock block)", __ecereMethod___ecereNameSpace__ecere__com__BlockPool_Remove, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "first", "ecere::com::MemBlock", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "last", "ecere::com::MemBlock", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "free", "ecere::com::MemBlock", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "blockSize", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "blockSpace", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "numParts", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "numBlocks", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "totalSize", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "usedSpace", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::log2i", "uint ecere::com::log2i(uint number)", __ecereNameSpace__ecere__com__log2i, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::pow2i", "uint ecere::com::pow2i(uint number)", __ecereNameSpace__ecere__com__pow2i, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::memswap", "void ecere::com::memswap(byte * a, byte * b, uint size)", __ecereNameSpace__ecere__com__memswap, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::CheckMemory", "void ecere::com::CheckMemory(void)", __ecereNameSpace__ecere__com__CheckMemory, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_RegisterClass", "ecere::com::Class ecere::com::eSystem_RegisterClass(ecere::com::ClassType type, char * name, char * baseName, int size, int sizeClass, bool( *)(void *), void( *)(void *), ecere::com::Module module, ecere::com::AccessMode declMode, ecere::com::AccessMode inheritanceAccess)", __ecereNameSpace__ecere__com__eSystem_RegisterClass, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_Unregister", "void ecere::com::eClass_Unregister(ecere::com::Class _class)", __ecereNameSpace__ecere__com__eClass_Unregister, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::_strtoi64", "int64 ecere::com::_strtoi64(char * string, char * * endString, int base)", __ecereNameSpace__ecere__com___strtoi64, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::_strtoui64", "uint64 ecere::com::_strtoui64(char * string, char * * endString, int base)", __ecereNameSpace__ecere__com___strtoui64, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_FindClass", "ecere::com::Class ecere::com::eSystem_FindClass(ecere::com::Module module, char * name)", __ecereNameSpace__ecere__com__eSystem_FindClass, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::DefaultFunction", "bool ecere::com::DefaultFunction(void)", __ecereNameSpace__ecere__com__DefaultFunction, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_IsDerived", "bool ecere::com::eClass_IsDerived(ecere::com::Class _class, ecere::com::Class from)", __ecereNameSpace__ecere__com__eClass_IsDerived, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_AddMethod", "ecere::com::Method ecere::com::eClass_AddMethod(ecere::com::Class _class, char * name, char * type, void * function, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eClass_AddMethod, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_AddVirtualMethod", "ecere::com::Method ecere::com::eClass_AddVirtualMethod(ecere::com::Class _class, char * name, char * type, void * function, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eClass_AddVirtualMethod, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_AddProperty", "ecere::com::Property ecere::com::eClass_AddProperty(ecere::com::Class _class, char * name, char * dataType, void * setStmt, void * getStmt, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eClass_AddProperty, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_AddClassProperty", "ecere::com::ClassProperty ecere::com::eClass_AddClassProperty(ecere::com::Class _class, char * name, char * dataType, void * setStmt, void * getStmt)", __ecereNameSpace__ecere__com__eClass_AddClassProperty, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_FindClassProperty", "ecere::com::ClassProperty ecere::com::eClass_FindClassProperty(ecere::com::Class _class, char * name)", __ecereNameSpace__ecere__com__eClass_FindClassProperty, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_GetProperty", "int ecere::com::eClass_GetProperty(ecere::com::Class _class, char * name)", __ecereNameSpace__ecere__com__eClass_GetProperty, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_SetProperty", "void ecere::com::eClass_SetProperty(ecere::com::Class _class, char * name, int value)", __ecereNameSpace__ecere__com__eClass_SetProperty, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_FindMethod", "ecere::com::Method ecere::com::eClass_FindMethod(ecere::com::Class _class, char * name, ecere::com::Module module)", __ecereNameSpace__ecere__com__eClass_FindMethod, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_New", "void * ecere::com::eInstance_New(ecere::com::Class _class)", __ecereNameSpace__ecere__com__eInstance_New, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_Evolve", "void ecere::com::eInstance_Evolve(ecere::com::Instance * instancePtr, ecere::com::Class _class)", __ecereNameSpace__ecere__com__eInstance_Evolve, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_Delete", "void ecere::com::eInstance_Delete(ecere::com::Instance instance)", __ecereNameSpace__ecere__com__eInstance_Delete, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_FindProperty", "ecere::com::Property ecere::com::eClass_FindProperty(ecere::com::Class _class, char * name, ecere::com::Module module)", __ecereNameSpace__ecere__com__eClass_FindProperty, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_FindDataMember", "ecere::com::DataMember ecere::com::eClass_FindDataMember(ecere::com::Class _class, char * name, ecere::com::Module module, ecere::com::DataMember * subMemberStack, int * subMemberStackPos)", __ecereNameSpace__ecere__com__eClass_FindDataMember, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_FindDataMemberAndOffset", "ecere::com::DataMember ecere::com::eClass_FindDataMemberAndOffset(ecere::com::Class _class, char * name, uint * offset, ecere::com::Module module, ecere::com::DataMember * subMemberStack, int * subMemberStackPos)", __ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_FindDataMemberAndId", "ecere::com::DataMember ecere::com::eClass_FindDataMemberAndId(ecere::com::Class _class, char * name, int * id, ecere::com::Module module, ecere::com::DataMember * subMemberStack, int * subMemberStackPos)", __ecereNameSpace__ecere__com__eClass_FindDataMemberAndId, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_FindNextMember", "void ecere::com::eClass_FindNextMember(ecere::com::Class _class, ecere::com::Class * curClass, ecere::com::DataMember * curMember, ecere::com::DataMember * subMemberStack, int * subMemberStackPos)", __ecereNameSpace__ecere__com__eClass_FindNextMember, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_SetMethod", "void ecere::com::eInstance_SetMethod(ecere::com::Instance instance, char * name, void * function)", __ecereNameSpace__ecere__com__eInstance_SetMethod, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_IsDerived", "bool ecere::com::eInstance_IsDerived(ecere::com::Instance instance, ecere::com::Class from)", __ecereNameSpace__ecere__com__eInstance_IsDerived, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_IncRef", "void ecere::com::eInstance_IncRef(ecere::com::Instance instance)", __ecereNameSpace__ecere__com__eInstance_IncRef, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_DecRef", "void ecere::com::eInstance_DecRef(ecere::com::Instance instance)", __ecereNameSpace__ecere__com__eInstance_DecRef, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_Resize", "void ecere::com::eClass_Resize(ecere::com::Class _class, int newSize)", __ecereNameSpace__ecere__com__eClass_Resize, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_AddDataMember", "ecere::com::DataMember ecere::com::eClass_AddDataMember(ecere::com::Class _class, char * name, char * type, uint size, uint alignment, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eClass_AddDataMember, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eMember_AddDataMember", "ecere::com::DataMember ecere::com::eMember_AddDataMember(ecere::com::DataMember member, char * name, char * type, uint size, uint alignment, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eMember_AddDataMember, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eMember_New", "ecere::com::DataMember ecere::com::eMember_New(ecere::com::DataMemberType type, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eMember_New, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eMember_AddMember", "bool ecere::com::eMember_AddMember(ecere::com::DataMember addTo, ecere::com::DataMember dataMember)", __ecereNameSpace__ecere__com__eMember_AddMember, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_AddMember", "bool ecere::com::eClass_AddMember(ecere::com::Class _class, ecere::com::DataMember dataMember)", __ecereNameSpace__ecere__com__eClass_AddMember, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_AddBitMember", "ecere::com::BitMember ecere::com::eClass_AddBitMember(ecere::com::Class _class, char * name, char * type, int bitSize, int bitPos, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eClass_AddBitMember, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eModule_Load", "ecere::com::Module ecere::com::eModule_Load(ecere::com::Module fromModule, char * name, ecere::com::AccessMode importAccess)", __ecereNameSpace__ecere__com__eModule_Load, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eModule_LoadStrict", "ecere::com::Module ecere::com::eModule_LoadStrict(ecere::com::Module fromModule, char * name, ecere::com::AccessMode importAccess)", __ecereNameSpace__ecere__com__eModule_LoadStrict, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eModule_LoadStatic", "ecere::com::Module ecere::com::eModule_LoadStatic(ecere::com::Module fromModule, char * name, ecere::com::AccessMode importAccess, bool( *)(ecere::com::Module module), bool( *)(ecere::com::Module module))", __ecereNameSpace__ecere__com__eModule_LoadStatic, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eModule_Unload", "void ecere::com::eModule_Unload(ecere::com::Module fromModule, ecere::com::Module module)", __ecereNameSpace__ecere__com__eModule_Unload, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eEnum_AddFixedValue", "void ecere::com::eEnum_AddFixedValue(ecere::com::Class _class, char * string, int value)", __ecereNameSpace__ecere__com__eEnum_AddFixedValue, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eEnum_AddValue", "int ecere::com::eEnum_AddValue(ecere::com::Class _class, char * string)", __ecereNameSpace__ecere__com__eEnum_AddValue, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_RegisterDefine", "ecere::com::DefinedExpression ecere::com::eSystem_RegisterDefine(char * name, char * value, ecere::com::Module module, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eSystem_RegisterDefine, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_RegisterFunction", "ecere::com::GlobalFunction ecere::com::eSystem_RegisterFunction(char * name, char * type, void * func, ecere::com::Module module, ecere::com::AccessMode declMode)", __ecereNameSpace__ecere__com__eSystem_RegisterFunction, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_FindDefine", "ecere::com::DefinedExpression ecere::com::eSystem_FindDefine(ecere::com::Module module, char * name)", __ecereNameSpace__ecere__com__eSystem_FindDefine, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_FindFunction", "ecere::com::GlobalFunction ecere::com::eSystem_FindFunction(ecere::com::Module module, char * name)", __ecereNameSpace__ecere__com__eSystem_FindFunction, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_Renew", "void * ecere::com::eSystem_Renew(void * memory, uint size)", __ecereNameSpace__ecere__com__eSystem_Renew, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_Renew0", "void * ecere::com::eSystem_Renew0(void * memory, uint size)", __ecereNameSpace__ecere__com__eSystem_Renew0, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_New", "void * ecere::com::eSystem_New(uint size)", __ecereNameSpace__ecere__com__eSystem_New, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_New0", "void * ecere::com::eSystem_New0(uint size)", __ecereNameSpace__ecere__com__eSystem_New0, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eSystem_Delete", "void ecere::com::eSystem_Delete(void * memory)", __ecereNameSpace__ecere__com__eSystem_Delete, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_FireSelfWatchers", "void ecere::com::eInstance_FireSelfWatchers(ecere::com::Instance instance, ecere::com::Property _property)", __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_FireWatchers", "void ecere::com::eInstance_FireWatchers(ecere::com::Instance instance, ecere::com::Property _property)", __ecereNameSpace__ecere__com__eInstance_FireWatchers, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eProperty_Watchable", "void ecere::com::eProperty_Watchable(ecere::com::Property _property)", __ecereNameSpace__ecere__com__eProperty_Watchable, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_DestructionWatchable", "void ecere::com::eClass_DestructionWatchable(ecere::com::Class _class)", __ecereNameSpace__ecere__com__eClass_DestructionWatchable, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eProperty_SelfWatch", "void ecere::com::eProperty_SelfWatch(ecere::com::Class _class, char * name, void( *)(void *))", __ecereNameSpace__ecere__com__eProperty_SelfWatch, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_Watch", "void ecere::com::eInstance_Watch(void * instance, ecere::com::Property _property, void * object, void( *)(void *, void *))", __ecereNameSpace__ecere__com__eInstance_Watch, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_WatchDestruction", "void ecere::com::eInstance_WatchDestruction(ecere::com::Instance instance, ecere::com::Instance object, void( *)(ecere::com::Instance, ecere::com::Instance))", __ecereNameSpace__ecere__com__eInstance_WatchDestruction, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_StopWatching", "void ecere::com::eInstance_StopWatching(ecere::com::Instance instance, ecere::com::Property _property, ecere::com::Instance object)", __ecereNameSpace__ecere__com__eInstance_StopWatching, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_GetDesigner", "subclass(ecere::com::ClassDesignerBase) ecere::com::eClass_GetDesigner(ecere::com::Class _class)", __ecereNameSpace__ecere__com__eClass_GetDesigner, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eInstance_GetDesigner", "subclass(ecere::com::ClassDesignerBase) ecere::com::eInstance_GetDesigner(ecere::com::Instance instance)", __ecereNameSpace__ecere__com__eInstance_GetDesigner, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::LocateModule", "bool ecere::com::LocateModule(char * name, char * fileName)", __ecereNameSpace__ecere__com__LocateModule, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::__ecere_COM_Initialize", "ecere::com::Application ecere::com::__ecere_COM_Initialize(bool guiApp, int argc, char * argv[])", __ecereNameSpace__ecere__com____ecere_COM_Initialize, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_AddTemplateParameter", "ecere::com::ClassTemplateParameter ecere::com::eClass_AddTemplateParameter(ecere::com::Class _class, char * name, ecere::com::TemplateParameterType type, void * info, ecere::com::ClassTemplateArgument defaultArg)", __ecereNameSpace__ecere__com__eClass_AddTemplateParameter, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::eClass_DoneAddingTemplateParameters", "void ecere::com::eClass_DoneAddingTemplateParameters(ecere::com::Class base)", __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters, module, 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::com::Platform", 0, 0, 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__Platform = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod___ecereNameSpace__ecere__com__Platform_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetDataFromString", 0, __ecereMethod___ecereNameSpace__ecere__com__Platform_OnGetDataFromString, 1);
__ecereProp___ecereNameSpace__ecere__com__Platform_char__PTR_ = __ecereNameSpace__ecere__com__eClass_AddProperty(class, 0, "char *", __ecereProp___ecereNameSpace__ecere__com__Platform_Set_char__PTR_, __ecereProp___ecereNameSpace__ecere__com__Platform_Get_char__PTR_, 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "unknown", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "win32", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "tux", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "apple", 3);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::GetRuntimePlatform", "ecere::com::Platform ecere::com::GetRuntimePlatform(void)", __ecereNameSpace__ecere__com__GetRuntimePlatform, module, 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ecere::com::ObjectInfo", 0, sizeof(struct __ecereNameSpace__ecere__com__ObjectInfo), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ObjectInfo = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ecere::com::ObjectInfo", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ecere::com::ObjectInfo", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "instance", "ecere::com::Instance", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "instCode", "Instantiation", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "deleted", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "oClass", "ecere::com::ObjectInfo", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "instances", "ecere::sys::OldList", 20, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "classDefinition", "ClassDefinition", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "modified", "bool", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::DesignerBase", "ecere::gui::Window", sizeof(struct __ecereNameSpace__ecere__com__DesignerBase), 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__DesignerBase = class;
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "FindObject", "bool FindObject(ecere::com::Instance * instance, char * string)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "RenameObject", "void RenameObject(ecere::com::ObjectInfo object, char * name)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "SelectObjectFromDesigner", "void SelectObjectFromDesigner(ecere::com::ObjectInfo object)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "CodeAddObject", "void CodeAddObject(ecere::com::Instance instance, ecere::com::ObjectInfo * object)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "SheetAddObject", "void SheetAddObject(ecere::com::ObjectInfo object)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "AddToolBoxClass", "void AddToolBoxClass(ecere::com::Class _class)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "AddDefaultMethod", "void AddDefaultMethod(ecere::com::Instance instance, ecere::com::Instance classInstance)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "DeleteObject", "void DeleteObject(ecere::com::ObjectInfo object)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "ObjectContainsCode", "bool ObjectContainsCode(ecere::com::ObjectInfo object)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "ModifyCode", "void ModifyCode(void)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "UpdateProperties", "void UpdateProperties(void)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "classDesigner", "ecere::com::ClassDesignerBase", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "objectClass", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isDragging", "bool", 4, 4, 1);
__ecerePropM___ecereNameSpace__ecere__com__DesignerBase_classDesigner = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "classDesigner", "ecere::com::ClassDesignerBase", __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Set_classDesigner, __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Get_classDesigner, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__DesignerBase_classDesigner = __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_classDesigner, __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_classDesigner = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__DesignerBase_objectClass = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "objectClass", "char *", __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Set_objectClass, __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Get_objectClass, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__DesignerBase_objectClass = __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_objectClass, __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_objectClass = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__DesignerBase_isDragging = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "isDragging", "bool", __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Set_isDragging, __ecereProp___ecereNameSpace__ecere__com__DesignerBase_Get_isDragging, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__com__DesignerBase_isDragging = __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_isDragging, __ecerePropM___ecereNameSpace__ecere__com__DesignerBase_isDragging = (void *)0;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::com::ClassDesignerBase", "ecere::gui::Window", 0, 0, 0, 0, module, 4, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__com__ClassDesignerBase = class;
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Reset", "void Reset(void)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "AddObject", "void AddObject(void)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "SelectObject", "void SelectObject(ecere::com::ObjectInfo object, ecere::com::Instance control)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "ListToolBoxClasses", "void ListToolBoxClasses(ecere::com::DesignerBase designer)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "PrepareTestObject", "void ::PrepareTestObject(ecere::com::DesignerBase designer, ecere::com::Instance test)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "CreateObject", "void ::CreateObject(ecere::com::DesignerBase designer, ecere::com::Instance instance, ecere::com::ObjectInfo object, bool isClass, ecere::com::Instance _class)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "PostCreateObject", "void ::PostCreateObject(ecere::com::Instance instance, ecere::com::ObjectInfo object, bool isClass, ecere::com::Instance _class)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "DroppedObject", "void ::DroppedObject(ecere::com::Instance instance, ecere::com::ObjectInfo object, bool isClass, ecere::com::Instance _class)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "DestroyObject", "void ::DestroyObject(ecere::com::Instance object)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "FixProperty", "void ::FixProperty(ecere::com::Property prop, ecere::com::Instance object)", 0, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "CreateNew", "void ::CreateNew(EditBox editBox, Size clientSize, char * name, char * inherit)", 0, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::SetActiveDesigner", "void ecere::com::SetActiveDesigner(ecere::com::DesignerBase designer)", __ecereNameSpace__ecere__com__SetActiveDesigner, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::com::GetActiveDesigner", "ecere::com::DesignerBase ecere::com::GetActiveDesigner(void)", __ecereNameSpace__ecere__com__GetActiveDesigner, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::sys::LEAD_OFFSET", "0xD800 - (0x10000 >> 10)", module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("ecere::sys::SURROGATE_OFFSET", "0x10000 - (0xD800 << 10) - 0xDC00", module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::UTF8Validate", "bool ecere::sys::UTF8Validate(char * source)", __ecereNameSpace__ecere__sys__UTF8Validate, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::ISO8859_1toUTF8", "int ecere::sys::ISO8859_1toUTF8(char * source, char * dest, int max)", __ecereNameSpace__ecere__sys__ISO8859_1toUTF8, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::UTF16toUTF8", "char * ecere::sys::UTF16toUTF8(uint16 * source)", __ecereNameSpace__ecere__sys__UTF16toUTF8, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::UTF16toUTF8Buffer", "int ecere::sys::UTF16toUTF8Buffer(uint16 * source, byte * dest, int max)", __ecereNameSpace__ecere__sys__UTF16toUTF8Buffer, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::UTF8GetChar", "ecere::com::unichar ecere::sys::UTF8GetChar(char * string, int * numBytes)", __ecereNameSpace__ecere__sys__UTF8GetChar, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::UTF8toUTF16Buffer", "int ecere::sys::UTF8toUTF16Buffer(char * source, uint16 * dest, int max)", __ecereNameSpace__ecere__sys__UTF8toUTF16Buffer, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::UTF32toUTF8Len", "int ecere::sys::UTF32toUTF8Len(ecere::com::unichar * source, int count, byte * dest, int max)", __ecereNameSpace__ecere__sys__UTF32toUTF8Len, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::UTF8toUTF16", "uint16 * ecere::sys::UTF8toUTF16(char * source, int * wordCount)", __ecereNameSpace__ecere__sys__UTF8toUTF16, module, 4);
}

void __ecereUnregisterModule_instance(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__com__DesignerBase_classDesigner = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__DesignerBase_objectClass = (void *)0;
__ecerePropM___ecereNameSpace__ecere__com__DesignerBase_isDragging = (void *)0;
}

