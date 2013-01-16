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

typedef __builtin_va_list __gnuc_va_list;

typedef __gnuc_va_list va_list;

void DualPipe_Destructor(struct __ecereNameSpace__ecere__com__Instance ** dp);

void DualPipe_CloseInput(struct __ecereNameSpace__ecere__com__Instance ** dp);

void DualPipe_CloseOutput(struct __ecereNameSpace__ecere__com__Instance ** dp);

int DualPipe_Read(struct __ecereNameSpace__ecere__com__Instance ** dp, unsigned char * buffer, unsigned int size, unsigned int count);

int DualPipe_Write(struct __ecereNameSpace__ecere__com__Instance ** dp, unsigned char * buffer, unsigned int size, unsigned int count);

unsigned int DualPipe_Getc(struct __ecereNameSpace__ecere__com__Instance ** dp, char * ch);

unsigned int DualPipe_Putc(struct __ecereNameSpace__ecere__com__Instance ** dp, char ch);

unsigned int DualPipe_Puts(struct __ecereNameSpace__ecere__com__Instance ** dp, char * string);

unsigned int DualPipe_Seek(struct __ecereNameSpace__ecere__com__Instance ** dp, int pos, int mode);

unsigned int DualPipe_Tell(struct __ecereNameSpace__ecere__com__Instance ** dp);

unsigned int DualPipe_Eof(struct __ecereNameSpace__ecere__com__Instance ** dp);

unsigned int DualPipe_GetSize(struct __ecereNameSpace__ecere__com__Instance ** dp);

unsigned int DualPipe_Peek(struct __ecereNameSpace__ecere__com__Instance ** dp);

void DualPipe_Terminate(struct __ecereNameSpace__ecere__com__Instance ** dp);

int DualPipe_GetExitCode(struct __ecereNameSpace__ecere__com__Instance ** dp);

int DualPipe_GetProcessID(struct __ecereNameSpace__ecere__com__Instance ** dp);

void DualPipe_Wait(struct __ecereNameSpace__ecere__com__Instance ** dp);

struct __ecereNameSpace__ecere__com__Instance ** _DualPipeOpen(unsigned int mode, char * commandLine, char * env, void ** inputPtr, void ** outputPtr);

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__PipeOpenMode;

struct __ecereNameSpace__ecere__sys__DualPipe
{
void * dp;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__DualPipe;

void __ecereDestructor___ecereNameSpace__ecere__sys__DualPipe(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

{
DualPipe_Destructor(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}
}

void *  __ecereProp___ecereNameSpace__ecere__sys__File_Get_input(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__sys__File_Set_input(struct __ecereNameSpace__ecere__com__Instance * this, void *  value);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__sys__File_input;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseInput;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__File;

void __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_CloseInput(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

(__ecereProp___ecereNameSpace__ecere__sys__File_Get_input(this) != (((void *)0))) ? ((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseInput])(this) : DualPipe_CloseInput(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

void *  __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(struct __ecereNameSpace__ecere__com__Instance * this);

void __ecereProp___ecereNameSpace__ecere__sys__File_Set_output(struct __ecereNameSpace__ecere__com__Instance * this, void *  value);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__sys__File_output;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseOutput;

void __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_CloseOutput(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

(__ecereProp___ecereNameSpace__ecere__sys__File_Get_output(this) != (((void *)0))) ? ((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseOutput])(this) : DualPipe_CloseOutput(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Read(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char * buffer, unsigned int size, unsigned int count)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return DualPipe_Read(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp, buffer, size, count);
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Write(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char * buffer, unsigned int size, unsigned int count)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(this) ? ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])(this, buffer, size, count) : DualPipe_Write(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp, buffer, size, count);
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Getc(struct __ecereNameSpace__ecere__com__Instance * this, char * ch)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return __ecereProp___ecereNameSpace__ecere__sys__File_Get_input(this) ? ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc])(this, ch) : DualPipe_Getc(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp, ch);
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Putc;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Putc(struct __ecereNameSpace__ecere__com__Instance * this, char ch)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(this) ? ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, char ch))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Putc])(this, ch) : DualPipe_Putc(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp, ch);
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Flush(struct __ecereNameSpace__ecere__com__Instance * this);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Puts(struct __ecereNameSpace__ecere__com__Instance * this, char * string)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(this) ? (((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(this, string), __ecereMethod___ecereNameSpace__ecere__sys__File_Flush(this)) : DualPipe_Puts(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp, string);
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Seek(struct __ecereNameSpace__ecere__com__Instance * this, int pos, int mode)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return (__ecereProp___ecereNameSpace__ecere__sys__File_Get_input(this) || __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(this)) ? ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(this, pos, mode) : DualPipe_Seek(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp, pos, mode);
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Tell;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Tell(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return (__ecereProp___ecereNameSpace__ecere__sys__File_Get_input(this) || __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(this)) ? ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Tell])(this) : DualPipe_Tell(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Eof(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return DualPipe_Eof(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetSize(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return (__ecereProp___ecereNameSpace__ecere__sys__File_Get_input(this) || __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(this)) ? (unsigned int)((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))__ecereClass___ecereNameSpace__ecere__sys__File->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize])(this) : DualPipe_GetSize(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Peek(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return DualPipe_Peek(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

void __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Terminate(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

DualPipe_Terminate(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetExitCode(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return DualPipe_GetExitCode(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetProcessID(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

return DualPipe_GetProcessID(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

void __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Wait(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__DualPipe * __ecerePointer___ecereNameSpace__ecere__sys__DualPipe = (struct __ecereNameSpace__ecere__sys__DualPipe *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset) : 0);

DualPipe_Wait(__ecerePointer___ecereNameSpace__ecere__sys__DualPipe->dp);
}

extern int vsprintf(char * , const char * , __builtin_va_list);

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__DualPipeOpen(unsigned int mode, char *  commandLine);

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__DualPipeOpenf(unsigned int mode, char * command, ...)
{
char commandLine[1025];
va_list args;

__builtin_va_start(args, command);
vsprintf(commandLine, command, args);
__builtin_va_end(args);
return __ecereNameSpace__ecere__sys__DualPipeOpen(mode, commandLine);
}

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__DualPipeOpen(unsigned int mode, char * commandLine)
{
void * __ecereTemp1;
void * input, * output;
void * f = _DualPipeOpen(mode, commandLine, (((void *)0)), &input, &output);

if(f)
return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__DualPipe), ((struct __ecereNameSpace__ecere__sys__DualPipe *)(((char *)((struct __ecereNameSpace__ecere__com__Instance *)__ecereTemp1) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset)))->dp = f, __ecereProp___ecereNameSpace__ecere__sys__File_Set_input(((struct __ecereNameSpace__ecere__com__Instance *)__ecereTemp1), input), __ecereProp___ecereNameSpace__ecere__sys__File_Set_output(((struct __ecereNameSpace__ecere__com__Instance *)__ecereTemp1), output), ((struct __ecereNameSpace__ecere__com__Instance *)__ecereTemp1));
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__DualPipeOpenEnv(unsigned int mode, char *  env, char *  commandLine);

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__DualPipeOpenEnvf(unsigned int mode, char * env, char * command, ...)
{
char commandLine[1025];
va_list args;

__builtin_va_start(args, command);
vsprintf(commandLine, command, args);
__builtin_va_end(args);
return __ecereNameSpace__ecere__sys__DualPipeOpenEnv(mode, env, commandLine);
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__DualPipeOpenEnv(unsigned int mode, char * env, char * commandLine)
{
void * __ecereTemp1;
void * input, * output;
void * f = _DualPipeOpen(mode, commandLine, env, &input, &output);

if(f)
return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__DualPipe), ((struct __ecereNameSpace__ecere__sys__DualPipe *)(((char *)((struct __ecereNameSpace__ecere__com__Instance *)__ecereTemp1) + __ecereClass___ecereNameSpace__ecere__sys__DualPipe->offset)))->dp = f, __ecereProp___ecereNameSpace__ecere__sys__File_Set_input(((struct __ecereNameSpace__ecere__com__Instance *)__ecereTemp1), input), __ecereProp___ecereNameSpace__ecere__sys__File_Set_output(((struct __ecereNameSpace__ecere__com__Instance *)__ecereTemp1), output), ((struct __ecereNameSpace__ecere__com__Instance *)__ecereTemp1));
return (((void *)0));
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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BitMember;

struct __ecereNameSpace__ecere__com__BitMember;

extern struct __ecereNameSpace__ecere__com__BitMember * __ecereNameSpace__ecere__com__eClass_AddBitMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, int bitSize, int bitPos, int declMode);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

void __ecereRegisterModule_DualPipe(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(2, "ecere::sys::PipeOpenMode", 0, 0, 0, 0, 0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__PipeOpenMode = class;
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "output", "bool", 1, 0, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "error", "bool", 1, 1, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "input", "bool", 1, 2, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::sys::DualPipe", "ecere::sys::File", sizeof(struct __ecereNameSpace__ecere__sys__DualPipe), 0, 0, __ecereDestructor___ecereNameSpace__ecere__sys__DualPipe, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__DualPipe = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Seek", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Seek, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Tell", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Tell, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Read", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Read, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Write", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Write, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Getc", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Getc, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Putc", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Putc, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Puts", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Puts, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Eof", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Eof, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetSize", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetSize, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CloseInput", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_CloseInput, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CloseOutput", 0, __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_CloseOutput, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetExitCode", "int GetExitCode()", __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetExitCode, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetProcessID", "int GetProcessID()", __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetProcessID, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Peek", "bool Peek()", __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Peek, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Terminate", "void Terminate()", __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Terminate, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Wait", "void Wait()", __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Wait, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::DualPipeOpenf", "ecere::sys::DualPipe ecere::sys::DualPipeOpenf(ecere::sys::PipeOpenMode mode, char * command, ...)", __ecereNameSpace__ecere__sys__DualPipeOpenf, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::DualPipeOpen", "ecere::sys::DualPipe ecere::sys::DualPipeOpen(ecere::sys::PipeOpenMode mode, char * commandLine)", __ecereNameSpace__ecere__sys__DualPipeOpen, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::DualPipeOpenEnvf", "ecere::sys::DualPipe ecere::sys::DualPipeOpenEnvf(ecere::sys::PipeOpenMode mode, char * env, char * command, ...)", __ecereNameSpace__ecere__sys__DualPipeOpenEnvf, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::DualPipeOpenEnv", "ecere::sys::DualPipe ecere::sys::DualPipeOpenEnv(ecere::sys::PipeOpenMode mode, char * env, char * commandLine)", __ecereNameSpace__ecere__sys__DualPipeOpenEnv, module, 1);
}

void __ecereUnregisterModule_DualPipe(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

