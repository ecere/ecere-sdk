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

unsigned int FILE_GetSize(FILE * input);

unsigned int FILE_Lock(FILE * input, FILE * output, int type, uint64 start, uint64 length, unsigned int wait);

void FILE_set_buffered(FILE * input, FILE * output, unsigned int value);

unsigned int FILE_FileExists(char * fileName);

unsigned int FILE_FileGetSize(char * fileName, unsigned int * size);

unsigned int FILE_FileGetStats(char * fileName, struct __ecereNameSpace__ecere__sys__FileStats * stats);

void FILE_FileFixCase(char * file);

void FILE_FileOpen(char * fileName, int mode, FILE ** input, FILE ** output);

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__httpFileSystem;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__FileSize;

int __ecereMethod___ecereNameSpace__ecere__sys__FileSize_OnCompare(struct __ecereNameSpace__ecere__com__Class * class, unsigned int * this, unsigned int * data2)
{
int result = 0;

if(&(*(this)) && &(*(data2)))
{
if((*(this)) > (*(data2)))
result = 1;
else if((*(this)) < (*(data2)))
result = -1;
}
return result;
}

extern void __ecereNameSpace__ecere__sys__PrintSize(char *  string, unsigned int size, int prec);

char * __ecereMethod___ecereNameSpace__ecere__sys__FileSize_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, unsigned int * this, char * string, void * fieldData, unsigned int * needClass)
{
__ecereNameSpace__ecere__sys__PrintSize(string, *(unsigned int *)this, 2);
return string;
}

extern double strtod(char * , char * * );

extern char *  strstr(char * , const char * );

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__FileSize_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * class, unsigned int * this, char * string)
{
char * end;
double value = strtod(string, &end);
unsigned int multiplier = 1;

if(strstr(end, "GB") || strstr(end, "gb"))
multiplier = (unsigned int)1024 * 1024 * 1024;
else if(strstr(end, "MB") || strstr(end, "mb"))
multiplier = (unsigned int)1024 * 1024;
else if(strstr(end, "KB") || strstr(end, "kb"))
multiplier = 1024;
(*(this)) = (unsigned int)((double)multiplier * value);
return 0x1;
}

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__FileSize64;

int __ecereMethod___ecereNameSpace__ecere__sys__FileSize64_OnCompare(struct __ecereNameSpace__ecere__com__Class * class, uint64 * this, uint64 * data2)
{
int result = 0;

if(&(*(this)) && &(*(data2)))
{
if((*(this)) > (*(data2)))
result = 1;
else if((*(this)) < (*(data2)))
result = -1;
}
return result;
}

extern void __ecereNameSpace__ecere__sys__PrintBigSize(char *  string, double size, int prec);

char * __ecereMethod___ecereNameSpace__ecere__sys__FileSize64_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, uint64 * this, char * string, void * fieldData, unsigned int * needClass)
{
__ecereNameSpace__ecere__sys__PrintBigSize(string, *(uint64 *)this, 2);
return string;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__FileSize64_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * class, uint64 * this, char * string)
{
char * end;
double value = strtod(string, &end);
uint64 multiplier = 1;

if(strstr(end, "PB") || strstr(end, "pb"))
multiplier = (uint64)1024 * 1024 * 1024 * 1024;
else if(strstr(end, "TB") || strstr(end, "tb"))
multiplier = (uint64)1024 * 1024 * 1024 * 1024;
else if(strstr(end, "GB") || strstr(end, "gb"))
multiplier = (uint64)1024 * 1024 * 1024;
else if(strstr(end, "MB") || strstr(end, "mb"))
multiplier = (uint64)1024 * 1024;
else if(strstr(end, "KB") || strstr(end, "kb"))
multiplier = 1024;
(*(this)) = (uint64)((double)multiplier * value);
return 0x1;
}

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__FileSystem;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__FileOpenMode;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__FileSeekMode;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__FileLock;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__File_input, * __ecerePropM___ecereNameSpace__ecere__sys__File_input;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__File_output, * __ecerePropM___ecereNameSpace__ecere__sys__File_output;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__File_buffered, * __ecerePropM___ecereNameSpace__ecere__sys__File_buffered;

static struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__File_eof, * __ecerePropM___ecereNameSpace__ecere__sys__File_eof;

struct __ecereNameSpace__ecere__sys__File
{
FILE * input, * output;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__File;

static int __ecereNameSpace__ecere__sys__openCount;

void __ecereDestructor___ecereNameSpace__ecere__sys__File(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

{
if(__ecerePointer___ecereNameSpace__ecere__sys__File->output && __ecerePointer___ecereNameSpace__ecere__sys__File->output != __ecerePointer___ecereNameSpace__ecere__sys__File->input)
{
__ecereNameSpace__ecere__sys__openCount--;
fclose(__ecerePointer___ecereNameSpace__ecere__sys__File->output);
}
if(__ecerePointer___ecereNameSpace__ecere__sys__File->input)
{
__ecereNameSpace__ecere__sys__openCount--;
fclose(__ecerePointer___ecereNameSpace__ecere__sys__File->input);
}
__ecerePointer___ecereNameSpace__ecere__sys__File->input = (((void *)0));
__ecerePointer___ecereNameSpace__ecere__sys__File->output = (((void *)0));
}
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_ReadData(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char * bytes, unsigned int numBytes)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read])(this, bytes, 1, numBytes);
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_WriteData(struct __ecereNameSpace__ecere__com__Instance * this, unsigned char * bytes, unsigned int numBytes)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])(this, bytes, 1, numBytes);
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpen(char *  fileName, int mode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

struct __ecereNameSpace__ecere__sys__TempFile
{
unsigned char *  buffer;
unsigned int size;
unsigned int position;
unsigned int eof;
int openMode;
unsigned int allocated;
} __attribute__ ((gcc_struct));

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof;

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_OnGetDataFromString(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance ** this, char * string)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

if(!string[0])
{
(*(this)) = (((void *)0));
return 0x1;
}
else
{
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__sys__FileOpen(string, 1);

if(f)
{
(*(this)) = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);
while(!((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof])(f))
{
unsigned char buffer[4096];
unsigned int read = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read])(f, buffer, 1, sizeof buffer);

((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))((*(this)))->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])((*(this)), buffer, 1, read);
}
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
return 0x1;
}
}
return 0x0;
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize;

char * __ecereMethod___ecereNameSpace__ecere__sys__File_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, struct __ecereNameSpace__ecere__com__Instance * this, char * tempString, void * fieldData, unsigned int * needClass)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

if((struct __ecereNameSpace__ecere__com__Instance *)this)
{
__ecereNameSpace__ecere__sys__PrintSize(tempString, ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))(this)->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize])(this), 2);
return tempString;
}
return (((void *)0));
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Seek(struct __ecereNameSpace__ecere__com__Instance * this, int pos, int mode)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
unsigned int fmode = 0;

switch(mode)
{
case 0:
fmode = 0;
break;
case 2:
fmode = 2;
break;
case 1:
fmode = 1;
break;
}
return fseek(__ecerePointer___ecereNameSpace__ecere__sys__File->input ? __ecerePointer___ecereNameSpace__ecere__sys__File->input : __ecerePointer___ecereNameSpace__ecere__sys__File->output, pos, fmode) != (-1);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Tell(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__File->input ? ftell(__ecerePointer___ecereNameSpace__ecere__sys__File->input) : ftell(__ecerePointer___ecereNameSpace__ecere__sys__File->output);
}

int __ecereMethod___ecereNameSpace__ecere__sys__File_Read(struct __ecereNameSpace__ecere__com__Instance * this, void * buffer, unsigned int size, unsigned int count)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__File->input ? (int)fread(buffer, size, count, __ecerePointer___ecereNameSpace__ecere__sys__File->input) : 0;
}

int __ecereMethod___ecereNameSpace__ecere__sys__File_Write(struct __ecereNameSpace__ecere__com__Instance * this, void * buffer, unsigned int size, unsigned int count)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__File->output ? (int)fwrite(buffer, size, count, __ecerePointer___ecereNameSpace__ecere__sys__File->output) : 0;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Getc(struct __ecereNameSpace__ecere__com__Instance * this, char * ch)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
int ich = fgetc(__ecerePointer___ecereNameSpace__ecere__sys__File->input);

if(ich != (-1))
{
if(ch)
*ch = (char)ich;
return 0x1;
}
return 0x0;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Putc(struct __ecereNameSpace__ecere__com__Instance * this, char ch)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return (fputc((int)ch, __ecerePointer___ecereNameSpace__ecere__sys__File->output) == (-1)) ? 0x0 : 0x1;
}

extern int fputs(char * , void *  stream);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Puts(struct __ecereNameSpace__ecere__com__Instance * this, const char * string)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
unsigned int result = 0x0;

if(__ecerePointer___ecereNameSpace__ecere__sys__File->output)
{
result = (fputs(string, __ecerePointer___ecereNameSpace__ecere__sys__File->output) == (-1)) ? 0x0 : 0x1;
}
return result;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Eof(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__File->input ? (unsigned int)feof(__ecerePointer___ecereNameSpace__ecere__sys__File->input) : 0x1;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Truncate(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int size)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

fprintf((bsl_stderr()), "WARNING:  File::Truncate unimplemented in ecereBootstrap.\n");
return 0x0;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_GetSize(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return FILE_GetSize(__ecerePointer___ecereNameSpace__ecere__sys__File->input);
}

void __ecereMethod___ecereNameSpace__ecere__sys__File_CloseInput(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

if(__ecerePointer___ecereNameSpace__ecere__sys__File->input)
{
fclose(__ecerePointer___ecereNameSpace__ecere__sys__File->input);
if(__ecerePointer___ecereNameSpace__ecere__sys__File->output == __ecerePointer___ecereNameSpace__ecere__sys__File->input)
__ecerePointer___ecereNameSpace__ecere__sys__File->output = (((void *)0));
__ecerePointer___ecereNameSpace__ecere__sys__File->input = (((void *)0));
}
}

void __ecereMethod___ecereNameSpace__ecere__sys__File_CloseOutput(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

if(__ecerePointer___ecereNameSpace__ecere__sys__File->output)
{
fclose(__ecerePointer___ecereNameSpace__ecere__sys__File->output);
if(__ecerePointer___ecereNameSpace__ecere__sys__File->input == __ecerePointer___ecereNameSpace__ecere__sys__File->output)
__ecerePointer___ecereNameSpace__ecere__sys__File->input = (((void *)0));
__ecerePointer___ecereNameSpace__ecere__sys__File->output = (((void *)0));
}
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Lock(struct __ecereNameSpace__ecere__com__Instance * this, int type, uint64 start, uint64 length, unsigned int wait)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return FILE_Lock(__ecerePointer___ecereNameSpace__ecere__sys__File->input, __ecerePointer___ecereNameSpace__ecere__sys__File->output, type, start, length, wait);
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Lock;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Unlock(struct __ecereNameSpace__ecere__com__Instance * this, uint64 start, uint64 length, unsigned int wait)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int type, uint64 start, uint64 length, unsigned int wait))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Lock])(this, 0, start, length, wait);
}

extern int strlen(const char * );

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts;

int __ecereMethod___ecereNameSpace__ecere__sys__File_Printf(struct __ecereNameSpace__ecere__com__Instance * this, char * format, ...)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
int result = 0;

if(format)
{
char text[1025];
va_list args;

__builtin_va_start(args, format);
vsnprintf(text, sizeof text, format, args);
text[sizeof text - 1] = (char)0;
if(((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(this, text))
result = strlen(text);
__builtin_va_end(args);
}
return result;
}

extern int __ecereNameSpace__ecere__com__PrintStdArgsToBuffer(char *  buffer, int maxLen, struct __ecereNameSpace__ecere__com__Class * class, void * object, __builtin_va_list args);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Putc;

void __ecereMethod___ecereNameSpace__ecere__sys__File_PrintLn(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * object, ...)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
va_list args;
char buffer[4096];

__builtin_va_start(args, object);
__ecereNameSpace__ecere__com__PrintStdArgsToBuffer(buffer, sizeof buffer, class, object, args);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(this, buffer);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, char ch))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Putc])(this, '\n');
__builtin_va_end(args);
}

void __ecereMethod___ecereNameSpace__ecere__sys__File_Print(struct __ecereNameSpace__ecere__com__Instance * this, struct __ecereNameSpace__ecere__com__Class * class, void * object, ...)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
va_list args;
char buffer[4096];

__builtin_va_start(args, object);
__ecereNameSpace__ecere__com__PrintStdArgsToBuffer(buffer, sizeof buffer, class, object, args);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(this, buffer);
__builtin_va_end(args);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_Flush(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

fflush(__ecerePointer___ecereNameSpace__ecere__sys__File->output);
return 0x1;
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(struct __ecereNameSpace__ecere__com__Instance * this, char * s, int max)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
int c = 0;
unsigned int result = 0x1;

s[c] = (char)0;
if(((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof])(this))
{
result = 0x0;
}
else
{
while(c < max - 1)
{
char ch = (char)0;

if(!((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc])(this, &ch))
{
result = 0x0;
break;
}
if(ch == '\n')
break;
if(ch != '\r')
s[c++] = ch;
}
}
s[c] = (char)0;
return result || c > 1;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_GetString(struct __ecereNameSpace__ecere__com__Instance * this, char * string, int max)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
int c;
char ch;
unsigned int quoted = 0x0;
unsigned int result = 0x1;

*string = (char)0;
while(0x1)
{
if(!((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc])(this, &ch))
result = 0x0;
if((ch != '\n') && (ch != '\r') && (ch != ' ') && (ch != ',') && (ch != '\t'))
break;
if(((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof])(this))
break;
}
if(result)
{
for(c = 0; c < max - 1; c++)
{
if(!quoted && ((ch == '\n') || (ch == '\r') || (ch == ' ') || (ch == ',') || (ch == '\t')))
{
result = 0x1;
break;
}
if(ch == '\"')
{
quoted ^= (unsigned int)1;
c--;
}
else
string[c] = ch;
if(!((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc])(this, &ch))
{
c++;
result = 0x0;
break;
}
}
string[c] = (char)0;
}
return result;
}

extern int atoi(const char * );

int __ecereMethod___ecereNameSpace__ecere__sys__File_GetValue(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
char string[32];

__ecereMethod___ecereNameSpace__ecere__sys__File_GetString(this, string, sizeof string);
return atoi(string);
}

extern unsigned long strtoul(const char *  nptr, char * *  endptr, int base);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_GetHexValue(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
char string[32];

__ecereMethod___ecereNameSpace__ecere__sys__File_GetString(this, string, sizeof string);
return strtoul(string, (((void *)0)), 16);
}

extern double __ecereNameSpace__ecere__sys__FloatFromString(char *  string);

float __ecereMethod___ecereNameSpace__ecere__sys__File_GetFloat(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
char string[32];

__ecereMethod___ecereNameSpace__ecere__sys__File_GetString(this, string, sizeof string);
return (float)__ecereNameSpace__ecere__sys__FloatFromString(string);
}

double __ecereMethod___ecereNameSpace__ecere__sys__File_GetDouble(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
char string[32];

__ecereMethod___ecereNameSpace__ecere__sys__File_GetString(this, string, sizeof string);
return __ecereNameSpace__ecere__sys__FloatFromString(string);
}

void *  __ecereProp___ecereNameSpace__ecere__sys__File_Get_input(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__File->input;
}

void __ecereProp___ecereNameSpace__ecere__sys__File_Set_input(struct __ecereNameSpace__ecere__com__Instance * this, void *  value)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__sys__File->input = value;
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__File_input), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__File_input);
}

void *  __ecereProp___ecereNameSpace__ecere__sys__File_Get_output(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return __ecerePointer___ecereNameSpace__ecere__sys__File->output;
}

void __ecereProp___ecereNameSpace__ecere__sys__File_Set_output(struct __ecereNameSpace__ecere__com__Instance * this, void *  value)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

__ecerePointer___ecereNameSpace__ecere__sys__File->output = value;
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__File_output), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__File_output);
}

void __ecereProp___ecereNameSpace__ecere__sys__File_Set_buffered(struct __ecereNameSpace__ecere__com__Instance * this, unsigned int value)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

FILE_set_buffered(__ecerePointer___ecereNameSpace__ecere__sys__File->input, __ecerePointer___ecereNameSpace__ecere__sys__File->output, value);
__ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecereProp___ecereNameSpace__ecere__sys__File_buffered), __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(this, __ecerePropM___ecereNameSpace__ecere__sys__File_buffered);
}

unsigned int __ecereProp___ecereNameSpace__ecere__sys__File_Get_eof(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

return ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof])(this);
}

int __ecereMethod___ecereNameSpace__ecere__sys__File_GetLineEx(struct __ecereNameSpace__ecere__com__Instance * this, char * s, int max, unsigned int * hasNewLineChar)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
int c = 0;

s[c] = '\0';
if(!((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof])(this))
{
char ch = '\0';

while(c < max - 1)
{
if(!((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, char *  ch))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc])(this, &ch))
break;
if(ch == '\n')
break;
if(ch != '\r')
s[c++] = ch;
}
if(hasNewLineChar)
*hasNewLineChar = (ch == '\n');
}
s[c] = '\0';
return c;
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_CopyTo(struct __ecereNameSpace__ecere__com__Instance * this, char * outputFileName)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);
unsigned int result = 0x0;
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__sys__FileOpen(outputFileName, 2);

if(f)
{
unsigned char buffer[65536];

result = 0x1;
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(this, 0, 0);
while(!((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof])(this))
{
unsigned int count = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read])(this, buffer, 1, sizeof buffer);

if(count && !((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])(f, buffer, 1, count))
{
result = 0x0;
break;
}
}
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(this, 0, 0);
return result;
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseOutput;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseInput;

void __ecereMethod___ecereNameSpace__ecere__sys__File_Close(struct __ecereNameSpace__ecere__com__Instance * this)
{
struct __ecereNameSpace__ecere__sys__File * __ecerePointer___ecereNameSpace__ecere__sys__File = (struct __ecereNameSpace__ecere__sys__File *)(this ? (((char *)this) + __ecereClass___ecereNameSpace__ecere__sys__File->offset) : 0);

((void (*)(struct __ecereNameSpace__ecere__com__Instance *))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseOutput])(this);
((void (*)(struct __ecereNameSpace__ecere__com__Instance *))this->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseInput])(this);
}

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__ConsoleFile;

unsigned int __ecereConstructor___ecereNameSpace__ecere__sys__ConsoleFile(struct __ecereNameSpace__ecere__com__Instance * this)
{
__ecereProp___ecereNameSpace__ecere__sys__File_Set_input(this, (bsl_stdin()));
__ecereProp___ecereNameSpace__ecere__sys__File_Set_output(this, (bsl_stdout()));
return 0x1;
}

void __ecereDestructor___ecereNameSpace__ecere__sys__ConsoleFile(struct __ecereNameSpace__ecere__com__Instance * this)
{
{
__ecereProp___ecereNameSpace__ecere__sys__File_Set_input(this, (((void *)0)));
__ecereProp___ecereNameSpace__ecere__sys__File_Set_output(this, (((void *)0)));
}
}

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__FileAttribs;

struct __ecereNameSpace__ecere__sys__FileStats
{
unsigned int attribs;
unsigned int size;
struct __ecereNameSpace__ecere__com__Instance * accessed;
struct __ecereNameSpace__ecere__com__Instance * modified;
struct __ecereNameSpace__ecere__com__Instance * created;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__FileStats;

unsigned int __ecereNameSpace__ecere__sys__FileExists(char * fileName)
{
char archiveName[797], * archiveFile;

return FILE_FileExists(fileName);
}

extern unsigned int __ecereNameSpace__ecere__com__eClass_IsDerived(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class * from);

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpen(char * fileName, int mode)
{
struct __ecereNameSpace__ecere__com__Instance * result = (((void *)0));

if(fileName)
{
char archiveName[797], * archiveFile;

if(strstr(fileName, "File://") == fileName)
{
result = (struct __ecereNameSpace__ecere__com__Instance *)strtoul(fileName + 7, (((void *)0)), 16);
if(result)
{
if(((struct __ecereNameSpace__ecere__com__Instance *)(char *)result)->_class && __ecereNameSpace__ecere__com__eClass_IsDerived(((struct __ecereNameSpace__ecere__com__Instance *)(char *)result)->_class, __ecereClass___ecereNameSpace__ecere__sys__File))
{
if(!((struct __ecereNameSpace__ecere__com__Instance *)(char *)result)->_refCount)
result->_refCount++;
result->_refCount++;
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))result->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(result, 0, 0);
}
else
result = (((void *)0));
}
}
else
{
struct __ecereNameSpace__ecere__com__Instance * file = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__File);

if(file)
{
FILE_FileOpen(fileName, mode, &((struct __ecereNameSpace__ecere__sys__File *)(((char *)file + __ecereClass___ecereNameSpace__ecere__sys__File->offset)))->input, &((struct __ecereNameSpace__ecere__sys__File *)(((char *)file + __ecereClass___ecereNameSpace__ecere__sys__File->offset)))->output);
if(!__ecereProp___ecereNameSpace__ecere__sys__File_Get_input(file) && !__ecereProp___ecereNameSpace__ecere__sys__File_Get_output(file))
;
else
{
__ecereNameSpace__ecere__sys__openCount++;
result = file;
}
if(!result)
{
(__ecereNameSpace__ecere__com__eInstance_DecRef(file), file = 0);
}
}
}
}
return result;
}

void __ecereNameSpace__ecere__sys__FileFixCase(char * file)
{
FILE_FileFixCase(file);
}

unsigned int __ecereNameSpace__ecere__sys__FileGetSize(char * fileName, unsigned int * size)
{
unsigned int result = 0x0;

if(size)
{
*size = 0;
if(fileName)
{
result = FILE_FileGetSize(fileName, size);
}
}
return result;
}

unsigned int __ecereNameSpace__ecere__sys__FileGetStats(char * fileName, struct __ecereNameSpace__ecere__sys__FileStats * stats)
{
unsigned int result = 0x0;

if(stats && fileName)
{
return FILE_FileGetStats(fileName, stats);
}
return result;
}

struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__CreateTemporaryFile(char * tempFileName, char * template)
{
}

void __ecereNameSpace__ecere__sys__CreateTemporaryDir(char * tempFileName, char * template)
{
}

extern void __ecereNameSpace__ecere__sys__ChangeCh(char *  string, char ch1, char ch2);

void __ecereNameSpace__ecere__sys__MakeSlashPath(char * p)
{
__ecereNameSpace__ecere__sys__FileFixCase(p);
__ecereNameSpace__ecere__sys__ChangeCh(p, '\\', '/');
}

void __ecereNameSpace__ecere__sys__MakeSystemPath(char * p)
{
__ecereNameSpace__ecere__sys__FileFixCase(p);
}

extern char *  __ecereNameSpace__ecere__sys__CopyString(char *  string);

char * __ecereNameSpace__ecere__sys__CopySystemPath(char * p)
{
char * d = __ecereNameSpace__ecere__sys__CopyString(p);

if(d)
__ecereNameSpace__ecere__sys__MakeSystemPath(d);
return d;
}

char * __ecereNameSpace__ecere__sys__CopyUnixPath(char * p)
{
char * d = __ecereNameSpace__ecere__sys__CopyString(p);

if(d)
__ecereNameSpace__ecere__sys__MakeSlashPath(d);
return d;
}

extern char *  strcpy(char * , const char * );

char * __ecereNameSpace__ecere__sys__GetSystemPathBuffer(char * d, char * p)
{
if(d != p)
strcpy(d, p ? p : "");
__ecereNameSpace__ecere__sys__MakeSystemPath(d);
return d;
}

char * __ecereNameSpace__ecere__sys__GetSlashPathBuffer(char * d, char * p)
{
if(d != p)
strcpy(d, p ? p : "");
__ecereNameSpace__ecere__sys__MakeSlashPath(d);
return d;
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_Open;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_Exists;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_GetSize;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_Stats;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_FixCase;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_Find;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_FindNext;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_CloseDir;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_OpenArchive;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_QuerySize;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Tell;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Truncate;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Unlock;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Close;

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

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

extern void __ecereNameSpace__ecere__com__eEnum_AddFixedValue(struct __ecereNameSpace__ecere__com__Class * _class, char *  string, int value);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  dataType, void *  setStmt, void *  getStmt, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BitMember;

struct __ecereNameSpace__ecere__com__BitMember;

extern struct __ecereNameSpace__ecere__com__BitMember * __ecereNameSpace__ecere__com__eClass_AddBitMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, int bitSize, int bitPos, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

void __ecereRegisterModule_File(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(3, "ecere::sys::FileSize", "uint", 0, 0, 0, 0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__FileSize = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnCompare", 0, __ecereMethod___ecereNameSpace__ecere__sys__FileSize_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod___ecereNameSpace__ecere__sys__FileSize_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetDataFromString", 0, __ecereMethod___ecereNameSpace__ecere__sys__FileSize_OnGetDataFromString, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(3, "ecere::sys::FileSize64", "uint64", 0, 0, 0, 0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__FileSize64 = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnCompare", 0, __ecereMethod___ecereNameSpace__ecere__sys__FileSize64_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod___ecereNameSpace__ecere__sys__FileSize64_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetDataFromString", 0, __ecereMethod___ecereNameSpace__ecere__sys__FileSize64_OnGetDataFromString, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::sys::FileSystem", 0, 0, 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__FileSystem = class;
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Open", "ecere::sys::File ::Open(char * archive, char * name, ecere::sys::FileOpenMode mode)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Exists", "ecere::sys::FileAttribs ::Exists(char * archive, char * fileName)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetSize", "bool ::GetSize(char * archive, char * fileName, ecere::sys::FileSize * size)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Stats", "bool ::Stats(char * archive, char * fileName, ecere::sys::FileStats stats)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "FixCase", "void ::FixCase(char * archive, char * fileName)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Find", "bool ::Find(FileDesc file, char * archive, char * name)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "FindNext", "bool ::FindNext(FileDesc file)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "CloseDir", "void ::CloseDir(FileDesc file)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "OpenArchive", "Archive ::OpenArchive(char * fileName, ArchiveOpenFlags create)", 0, 2);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "QuerySize", "bool ::QuerySize(char * fileName, ecere::sys::FileSize * size)", 0, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::sys::FileOpenMode", 0, 0, 0, 0, 0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__FileOpenMode = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "read", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "write", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "append", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "readWrite", 4);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "writeRead", 5);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "appendRead", 6);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::sys::FileSeekMode", 0, 0, 0, 0, 0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__FileSeekMode = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "start", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "current", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "end", 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ecere::sys::FileLock", 0, 0, 0, 0, 0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__FileLock = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "unlocked", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "shared", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "exclusive", 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::sys::File", "ecere::com::IOChannel", sizeof(struct __ecereNameSpace__ecere__sys__File), 0, 0, __ecereDestructor___ecereNameSpace__ecere__sys__File, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__File = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod___ecereNameSpace__ecere__sys__File_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetDataFromString", 0, __ecereMethod___ecereNameSpace__ecere__sys__File_OnGetDataFromString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "WriteData", 0, __ecereMethod___ecereNameSpace__ecere__sys__File_WriteData, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "ReadData", 0, __ecereMethod___ecereNameSpace__ecere__sys__File_ReadData, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Seek", "bool Seek(int pos, ecere::sys::FileSeekMode mode)", __ecereMethod___ecereNameSpace__ecere__sys__File_Seek, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Tell", "unsigned int Tell(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_Tell, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Read", "int Read(void * buffer, unsigned int size, unsigned int count)", __ecereMethod___ecereNameSpace__ecere__sys__File_Read, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Write", "int Write(void * buffer, unsigned int size, unsigned int count)", __ecereMethod___ecereNameSpace__ecere__sys__File_Write, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Getc", "bool Getc(char * ch)", __ecereMethod___ecereNameSpace__ecere__sys__File_Getc, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Putc", "bool Putc(char ch)", __ecereMethod___ecereNameSpace__ecere__sys__File_Putc, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Puts", "bool Puts(const char * string)", __ecereMethod___ecereNameSpace__ecere__sys__File_Puts, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Eof", "bool Eof(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_Eof, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Truncate", "bool Truncate(ecere::sys::FileSize size)", __ecereMethod___ecereNameSpace__ecere__sys__File_Truncate, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "GetSize", "unsigned int GetSize(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_GetSize, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "CloseInput", "void CloseInput(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_CloseInput, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "CloseOutput", "void CloseOutput(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_CloseOutput, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Lock", "bool Lock(ecere::sys::FileLock type, uint64 start, uint64 length, bool wait)", __ecereMethod___ecereNameSpace__ecere__sys__File_Lock, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Unlock", "bool Unlock(uint64 start, uint64 length, bool wait)", __ecereMethod___ecereNameSpace__ecere__sys__File_Unlock, 1);
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(class, "Close", "void Close()", __ecereMethod___ecereNameSpace__ecere__sys__File_Close, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CopyTo", "bool CopyTo(char * outputFileName)", __ecereMethod___ecereNameSpace__ecere__sys__File_CopyTo, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Flush", "bool Flush(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_Flush, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetDouble", "double GetDouble(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_GetDouble, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetFloat", "float GetFloat(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_GetFloat, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetHexValue", "unsigned int GetHexValue(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_GetHexValue, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetLine", "bool GetLine(char * s, int max)", __ecereMethod___ecereNameSpace__ecere__sys__File_GetLine, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetLineEx", "int GetLineEx(char * s, int max, bool * hasNewLineChar)", __ecereMethod___ecereNameSpace__ecere__sys__File_GetLineEx, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetString", "bool GetString(char * string, int max)", __ecereMethod___ecereNameSpace__ecere__sys__File_GetString, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "GetValue", "int GetValue(void)", __ecereMethod___ecereNameSpace__ecere__sys__File_GetValue, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Print", "void Print(typed_object object, ...)", __ecereMethod___ecereNameSpace__ecere__sys__File_Print, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "PrintLn", "void PrintLn(typed_object object, ...)", __ecereMethod___ecereNameSpace__ecere__sys__File_PrintLn, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Printf", "int Printf(char * format, ...)", __ecereMethod___ecereNameSpace__ecere__sys__File_Printf, 1);
__ecerePropM___ecereNameSpace__ecere__sys__File_input = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "input", "void *", __ecereProp___ecereNameSpace__ecere__sys__File_Set_input, __ecereProp___ecereNameSpace__ecere__sys__File_Get_input, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__File_input = __ecerePropM___ecereNameSpace__ecere__sys__File_input, __ecerePropM___ecereNameSpace__ecere__sys__File_input = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__File_output = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "output", "void *", __ecereProp___ecereNameSpace__ecere__sys__File_Set_output, __ecereProp___ecereNameSpace__ecere__sys__File_Get_output, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__File_output = __ecerePropM___ecereNameSpace__ecere__sys__File_output, __ecerePropM___ecereNameSpace__ecere__sys__File_output = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__File_buffered = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "buffered", "bool", __ecereProp___ecereNameSpace__ecere__sys__File_Set_buffered, 0, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__File_buffered = __ecerePropM___ecereNameSpace__ecere__sys__File_buffered, __ecerePropM___ecereNameSpace__ecere__sys__File_buffered = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__File_eof = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "eof", "bool", 0, __ecereProp___ecereNameSpace__ecere__sys__File_Get_eof, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application)
__ecereProp___ecereNameSpace__ecere__sys__File_eof = __ecerePropM___ecereNameSpace__ecere__sys__File_eof, __ecerePropM___ecereNameSpace__ecere__sys__File_eof = (void *)0;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "ecere::sys::ConsoleFile", "ecere::sys::File", 0, 0, __ecereConstructor___ecereNameSpace__ecere__sys__ConsoleFile, __ecereDestructor___ecereNameSpace__ecere__sys__ConsoleFile, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__ConsoleFile = class;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(2, "ecere::sys::FileAttribs", "bool", 0, 0, 0, 0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__FileAttribs = class;
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isFile", "bool", 1, 0, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isArchive", "bool", 1, 1, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isHidden", "bool", 1, 2, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isReadOnly", "bool", 1, 3, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isSystem", "bool", 1, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isTemporary", "bool", 1, 5, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isDirectory", "bool", 1, 6, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isDrive", "bool", 1, 7, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isCDROM", "bool", 1, 8, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isRemote", "bool", 1, 9, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isRemovable", "bool", 1, 10, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isServer", "bool", 1, 11, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "isShare", "bool", 1, 12, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ecere::sys::FileStats", 0, sizeof(struct __ecereNameSpace__ecere__sys__FileStats), 0, 0, 0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass___ecereNameSpace__ecere__sys__FileStats = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "attribs", "ecere::sys::FileAttribs", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "size", "ecere::sys::FileSize", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "accessed", "SecSince1970", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "modified", "SecSince1970", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "created", "SecSince1970", 4, 4, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::FileExists", "ecere::sys::FileAttribs ecere::sys::FileExists(char * fileName)", __ecereNameSpace__ecere__sys__FileExists, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::FileOpen", "ecere::sys::File ecere::sys::FileOpen(char * fileName, ecere::sys::FileOpenMode mode)", __ecereNameSpace__ecere__sys__FileOpen, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::FileFixCase", "void ecere::sys::FileFixCase(char * file)", __ecereNameSpace__ecere__sys__FileFixCase, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::FileGetSize", "bool ecere::sys::FileGetSize(char * fileName, ecere::sys::FileSize * size)", __ecereNameSpace__ecere__sys__FileGetSize, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::FileGetStats", "bool ecere::sys::FileGetStats(char * fileName, ecere::sys::FileStats stats)", __ecereNameSpace__ecere__sys__FileGetStats, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::CreateTemporaryFile", "ecere::sys::File ecere::sys::CreateTemporaryFile(char * tempFileName, char * template)", __ecereNameSpace__ecere__sys__CreateTemporaryFile, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::CreateTemporaryDir", "void ecere::sys::CreateTemporaryDir(char * tempFileName, char * template)", __ecereNameSpace__ecere__sys__CreateTemporaryDir, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::MakeSlashPath", "void ecere::sys::MakeSlashPath(char * p)", __ecereNameSpace__ecere__sys__MakeSlashPath, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::MakeSystemPath", "void ecere::sys::MakeSystemPath(char * p)", __ecereNameSpace__ecere__sys__MakeSystemPath, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::CopySystemPath", "char * ecere::sys::CopySystemPath(char * p)", __ecereNameSpace__ecere__sys__CopySystemPath, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::CopyUnixPath", "char * ecere::sys::CopyUnixPath(char * p)", __ecereNameSpace__ecere__sys__CopyUnixPath, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetSystemPathBuffer", "char * ecere::sys::GetSystemPathBuffer(char * d, char * p)", __ecereNameSpace__ecere__sys__GetSystemPathBuffer, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::sys::GetSlashPathBuffer", "char * ecere::sys::GetSlashPathBuffer(char * d, char * p)", __ecereNameSpace__ecere__sys__GetSlashPathBuffer, module, 1);
}

void __ecereUnregisterModule_File(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM___ecereNameSpace__ecere__sys__File_input = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__File_output = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__File_buffered = (void *)0;
__ecerePropM___ecereNameSpace__ecere__sys__File_eof = (void *)0;
}

