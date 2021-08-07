/* Code generated from eC source file: ecdefs.ec */
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
void exit(int status);

void * calloc(size_t nmemb, size_t size);

void free(void * ptr);

void * malloc(size_t size);

void * realloc(void * ptr, size_t size);

long int strtol(const char * nptr, char ** endptr, int base);

long long int strtoll(const char * nptr, char ** endptr, int base);

unsigned long long int strtoull(const char * nptr, char ** endptr, int base);

typedef __builtin_va_list va_list;

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

int vsnprintf(char *, size_t, const char *, va_list args);

int snprintf(char * str, size_t, const char * format, ...);

int fseek(FILE * stream, long offset, int whence);

long ftell(FILE * stream);

int feof(FILE * stream);

int ferror(FILE * stream);

int fileno(FILE * stream);

extern int yydebug;

enum yytokentype
{
IDENTIFIER = 258, CONSTANT = 259, STRING_LITERAL = 260, SIZEOF = 261, PTR_OP = 262, INC_OP = 263, DEC_OP = 264, LEFT_OP = 265, RIGHT_OP = 266, LE_OP = 267, GE_OP = 268, EQ_OP = 269, NE_OP = 270, AND_OP = 271, OR_OP = 272, MUL_ASSIGN = 273, DIV_ASSIGN = 274, MOD_ASSIGN = 275, ADD_ASSIGN = 276, SUB_ASSIGN = 277, LEFT_ASSIGN = 278, RIGHT_ASSIGN = 279, AND_ASSIGN = 280, XOR_ASSIGN = 281, OR_ASSIGN = 282, TYPE_NAME = 283, TYPEDEF = 284, EXTERN = 285, STATIC = 286, AUTO = 287, REGISTER = 288, CHAR = 289, SHORT = 290, INT = 291, UINT = 292, INT64 = 293, INT128 = 294, FLOAT128 = 295, LONG = 296, SIGNED = 297, UNSIGNED = 298, FLOAT = 299, DOUBLE = 300, CONST = 301, VOLATILE = 302, VOID = 303, VALIST = 304, STRUCT = 305, UNION = 306, ENUM = 307, ELLIPSIS = 308, CASE = 309, DEFAULT = 310, IF = 311, SWITCH = 312, WHILE = 313, DO = 314, FOR = 315, GOTO = 316, CONTINUE = 317, BREAK = 318, RETURN = 319, IFX = 320, ELSE = 321, CLASS = 322, THISCLASS = 323, PROPERTY = 324, SETPROP = 325, GETPROP = 326, NEWOP = 327, RENEW = 328, DELETE = 329, EXT_DECL = 330, EXT_STORAGE = 331, IMPORT = 332, DEFINE = 333, VIRTUAL = 334, ATTRIB = 335, PUBLIC = 336, PRIVATE = 337, TYPED_OBJECT = 338, ANY_OBJECT = 339, _INCREF = 340, EXTENSION = 341, ASM = 342, TYPEOF = 343, WATCH = 344, STOPWATCHING = 345, FIREWATCHERS = 346, WATCHABLE = 347, CLASS_DESIGNER = 348, CLASS_NO_EXPANSION = 349, CLASS_FIXED = 350, ISPROPSET = 351, CLASS_DEFAULT_PROPERTY = 352, PROPERTY_CATEGORY = 353, CLASS_DATA = 354, CLASS_PROPERTY = 355, SUBCLASS = 356, NAMESPACE = 357, NEW0OP = 358, RENEW0 = 359, VAARG = 360, DBTABLE = 361, DBFIELD = 362, DBINDEX = 363, DATABASE_OPEN = 364, ALIGNOF = 365, ATTRIB_DEP = 366, __ATTRIB = 367, BOOL = 368, _BOOL = 369, _COMPLEX = 370, _IMAGINARY = 371, RESTRICT = 372, THREAD = 373, WIDE_STRING_LITERAL = 374, BUILTIN_OFFSETOF = 375, PRAGMA = 376, STATIC_ASSERT = 377
};

typedef struct YYLTYPE
{
int first_line;
int first_column;
int last_line;
int last_column;
} ecere_gcc_struct YYLTYPE;

extern YYLTYPE _yylloc;

int yyparse(void);

unsigned int inCompiler = 0;

unsigned int inDebugger = 0;

unsigned int inBGen = 0;

const char * (* bgenSymbolSwap)(const char * symbol, unsigned int reduce, unsigned int macro);

char * symbolsDir = (((void *)0));

const char * outputFile;

const char * sourceFile;

const char * i18nModuleName;

unsigned int outputLineNumbers = 1;

struct CodePosition
{
int line, charPos, pos;
int included;
} ecere_gcc_struct;


extern unsigned int parsingType;

extern unsigned int parseTypeError;

int numWarnings;

unsigned int parseError;

unsigned int skipErrors;

int targetPlatform;

int GetRuntimeBits()
{
return (sizeof(uintptr_t) == 8) ? 64 : 32;
}

int targetBits;

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

struct __ecereNameSpace__ecere__com__LinkElement
{
void * prev;
void * next;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__LinkList
{
void * first;
void * last;
int count;
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

extern char *  __ecereNameSpace__ecere__sys__CopyString(const char *  string);

extern void __ecereNameSpace__ecere__sys__ChangeCh(char *  string, char ch1, char ch2);

extern char *  strchr(const char * , int);

struct __ecereNameSpace__ecere__gui__controls__EditLine;

extern int strcmp(const char * , const char * );

extern char *  __ecereNameSpace__ecere__sys__GetWorkingDir(char *  buf, int size);

extern char *  __ecereNameSpace__ecere__sys__PathCat(char *  string, const char *  addedPath);

extern char *  GetIncludeFileFromID(int id);

extern int printf(const char * , ...);

extern const char *  __ecereNameSpace__ecere__GetTranslatedString(const char * name, const char *  string, const char *  stringAndContext);

extern int fputs(const char * , void *  stream);

extern char *  __ecereNameSpace__ecere__sys__GetLastDirectory(const char *  string, char *  output);

extern char *  getenv(const char *  name);

struct __ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__BitMember;

struct __ecereNameSpace__ecere__com__DefinedExpression;

struct __ecereNameSpace__ecere__com__IteratorPointer;

void SetInCompiler(unsigned int b)
{
inCompiler = b;
}

void SetInDebugger(unsigned int b)
{
inDebugger = b;
}

void SetInBGen(unsigned int b)
{
inBGen = b;
}

void SetBGenSymbolSwapCallback(const char * (* cb)(const char * spec, unsigned int reduce, unsigned int macro))
{
bgenSymbolSwap = cb;
}

const char * GetSymbolsDir()
{
return symbolsDir ? symbolsDir : "";
}

void SetOutputFile(const char * s)
{
outputFile = s;
}

const char * GetOutputFile()
{
return outputFile;
}

void SetSourceFile(const char * s)
{
sourceFile = s;
}

const char * GetSourceFile()
{
return sourceFile;
}

void SetI18nModuleName(const char * s)
{
i18nModuleName = s;
}

const char * GetI18nModuleName()
{
return i18nModuleName;
}

void SetOutputLineNumbers(unsigned int value)
{
outputLineNumbers = value;
}

struct Location
{
struct CodePosition start, end;
} ecere_gcc_struct;

int GetNumWarnings()
{
return numWarnings;
}

void SetTargetPlatform(int platform)
{
targetPlatform = platform;
}

void SetTargetBits(int bits)
{
targetBits = bits;
}

int GetTargetBits()
{
return targetBits;
}

struct __ecereNameSpace__ecere__sys__OldList * excludedSymbols;

struct __ecereNameSpace__ecere__sys__OldList * imports;

struct __ecereNameSpace__ecere__sys__OldList * defines;

extern struct __ecereNameSpace__ecere__sys__OldList *  MkListOne(void *  item);

extern struct __ecereNameSpace__ecere__sys__OldList *  CopyList(struct __ecereNameSpace__ecere__sys__OldList *  source, void *  (*  CopyFunction)(void * ));

void SetSymbolsDir(const char * s)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(symbolsDir), symbolsDir = 0);
symbolsDir = __ecereNameSpace__ecere__sys__CopyString(s);
}

void FixModuleName(char * moduleName)
{
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '.', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, ' ', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '-', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '&', '_');
}

char * PassArg(char * output, const char * input)
{
const char * escChars, * escCharsQuoted;
unsigned int quoting = 0;
char * o = output;
const char * i = input, * l = input;

if(__runtimePlatform == 1)
{
escChars = " !\"%&'()+,;=[]^`{}~";
escCharsQuoted = "\"";
while(*l && !strchr(escChars, *l))
l++;
if(*l)
quoting = 1;
}
else
{
escChars = " !\"$&'()*:;<=>?[\\`{|";
escCharsQuoted = "\"()$";
if(*i == '-')
{
l++;
while(*l && !strchr(escChars, *l))
l++;
if(*l)
quoting = 1;
*o++ = *i++;
}
}
if(quoting)
*o++ = '\"';
while(*i)
{
if(strchr(quoting ? escCharsQuoted : escChars, *i))
*o++ = '\\';
*o++ = *i++;
}
if(quoting)
*o++ = '\"';
*o = '\0';
return o;
}

struct __ecereNameSpace__ecere__gui__controls__BufferLocation
{
struct __ecereNameSpace__ecere__gui__controls__EditLine * line;
int y;
int x;
} ecere_gcc_struct;

unsigned int __ecereMethod_Location_Inside(struct Location * this, int line, int charPos)
{
return (this->start.line < line || (this->start.line == line && this->start.charPos <= charPos)) && (this->end.line > line || (this->end.line == line && this->end.charPos >= charPos));
}

extern struct Location yylloc;

void SetExcludedSymbols(struct __ecereNameSpace__ecere__sys__OldList * list)
{
excludedSymbols = list;
}

void SetImports(struct __ecereNameSpace__ecere__sys__OldList * list)
{
imports = list;
}

void SetDefines(struct __ecereNameSpace__ecere__sys__OldList * list)
{
defines = list;
}

void __ecereMethod_CodePosition_AdjustDelete(struct CodePosition * this, struct __ecereNameSpace__ecere__gui__controls__BufferLocation * start, struct __ecereNameSpace__ecere__gui__controls__BufferLocation * end)
{
if(this->line - 1 < start->y || (this->line - 1 == start->y && this->charPos - 1 < start->x))
return ;
if((this->line - 1 >= start->y && (this->line - 1 > start->y || this->charPos - 1 >= start->x)) && (this->line - 1 >= end->y && (this->line - 1 > end->y || this->charPos - 1 >= end->x)))
{
if(this->line - 1 >= end->y)
{
if(this->line - 1 > end->y)
this->line -= end->y - start->y;
else
{
if(this->charPos - 1 >= end->x)
{
this->line = start->y + 1;
this->charPos -= end->x - start->x;
}
}
}
}
else
{
this->line = start->y + 1;
this->charPos = start->x + 1;
}
}

void __ecereMethod_CodePosition_AdjustAdd(struct CodePosition * this, struct __ecereNameSpace__ecere__gui__controls__BufferLocation * start, struct __ecereNameSpace__ecere__gui__controls__BufferLocation * end)
{
int numLines = end->y - start->y;

if(this->line - 1 >= start->y)
{
if(this->line - 1 > start->y)
this->line += numLines;
else
{
if(this->charPos - 1 > start->x || (this->charPos - 1 == start->x))
{
this->line += numLines;
this->charPos += end->x - start->x;
}
}
}
}

void Compiler_Warning(const char * format, ...)
{
if(inCompiler)
{
va_list args;
char string[10000];
char fileName[274];

if(yylloc.start.included)
{
char * include = GetIncludeFileFromID(yylloc.start.included);

__ecereNameSpace__ecere__sys__GetWorkingDir(string, sizeof (string));
__ecereNameSpace__ecere__sys__PathCat(string, include);
}
else
{
__ecereNameSpace__ecere__sys__GetWorkingDir(string, sizeof (string));
__ecereNameSpace__ecere__sys__PathCat(string, sourceFile);
}
__ecereNameSpace__ecere__sys__GetLastDirectory(string, fileName);
if(!strcmp(fileName, "intrin-impl.h"))
return ;
printf("%s", string);
printf(__ecereNameSpace__ecere__GetTranslatedString("ec", ":%d:%d: warning: ", (((void *)0))), yylloc.start.line, yylloc.start.charPos);
__builtin_va_start(args, format);
vsnprintf(string, sizeof (string), format, args);
string[sizeof (string) - 1] = 0;
__builtin_va_end(args);
fputs(string, (bsl_stdout()));
fflush((bsl_stdout()));
numWarnings++;
}
}

struct DBIndexItem;

struct Context;

struct Context * curContext;

struct Context * globalContext;

struct Context * topContext;

void SetCurrentContext(struct Context * context)
{
curContext = context;
}

struct Context * GetCurrentContext()
{
return curContext;
}

void SetGlobalContext(struct Context * context)
{
globalContext = context;
}

struct Context * GetGlobalContext()
{
return globalContext;
}

void SetTopContext(struct Context * context)
{
topContext = context;
}

struct Context * GetTopContext()
{
return topContext;
}

struct ModuleImport;

struct ModuleImport
{
struct ModuleImport * prev, * next;
char * name;
struct __ecereNameSpace__ecere__sys__OldList classes;
struct __ecereNameSpace__ecere__sys__OldList functions;
int importType;
int importAccess;
} ecere_gcc_struct;

struct ModuleImport * mainModule;

void SetMainModule(struct ModuleImport * moduleImport)
{
mainModule = moduleImport;
}

struct ModuleImport * GetMainModule()
{
return mainModule;
}

struct DataRedefinition;

struct DataRedefinition
{
struct DataRedefinition * prev, * next;
char name[1024];
char type1[1024], type2[1024];
} ecere_gcc_struct;

struct Definition;

struct Definition
{
struct Definition * prev, * next;
char * name;
int type;
} ecere_gcc_struct;

struct ImportedModule;

struct ImportedModule
{
struct ImportedModule * prev, * next;
char * name;
int type;
int importType;
unsigned int globalInstance;
unsigned int dllOnly;
int importAccess;
} ecere_gcc_struct;

struct FunctionImport;

struct FunctionImport
{
struct FunctionImport * prev, * next;
char * name;
} ecere_gcc_struct;

struct PropertyImport;

struct PropertyImport
{
struct PropertyImport * prev, * next;
char * name;
unsigned int isVirtual;
unsigned int hasSet, hasGet;
} ecere_gcc_struct;

struct MethodImport;

struct MethodImport
{
struct MethodImport * prev, * next;
char * name;
unsigned int isVirtual;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__Property;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp_Type_specConst, * __ecerePropM_Type_specConst;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp_Type_isPointerTypeSize, * __ecerePropM_Type_isPointerTypeSize;

static __attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * __ecereProp_Type_isPointerType, * __ecerePropM_Type_isPointerType;

struct Expression;

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

extern struct __ecereNameSpace__ecere__com__BitMember * __ecereNameSpace__ecere__com__eClass_AddBitMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, int bitSize, int bitPos, int declMode);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  dataType, void *  setStmt, void *  getStmt, int declMode);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

extern void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

extern void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object);

extern void __ecereNameSpace__ecere__com__eInstance_Watch(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

struct __ecereNameSpace__ecere__com__Instance * fileInput;

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__DualPipeOpen(unsigned int mode, const char *  commandLine);

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext;

extern int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(struct __ecereNameSpace__ecere__com__Instance * this, char *  s, int max);

void __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Wait();

void SetFileInput(struct __ecereNameSpace__ecere__com__Instance * file)
{
fileInput = file;
}

int GetHostBits()
{
int hostBits = GetRuntimeBits();
char * hostType = getenv("HOSTTYPE");
char host[256];

if(!hostType)
{
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__sys__DualPipeOpen((((unsigned int)(1))), "uname -m");

if(f)
{
if(__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, host, sizeof (host)))
hostType = host;
__ecereMethod___ecereNameSpace__ecere__sys__DualPipe_Wait(f);
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}
}
if(hostType)
{
if(!strcmp(hostType, "x86_64"))
hostBits = 64;
else if(!strcmp(hostType, "i386") || !strcmp(hostType, "i686"))
hostBits = 32;
}
return hostBits;
}

struct Declaration;

extern struct Declaration * MkDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators);

struct Identifier;

struct DBIndexItem
{
struct DBIndexItem * prev, * next;
struct Identifier * id;
int order;
} ecere_gcc_struct;

extern struct Identifier * CopyIdentifier(struct Identifier * id);

struct Specifier;

extern struct Specifier * MkStructOrUnion(int type, struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * definitions);

extern struct Specifier * CopySpecifier(struct Specifier * spec);

struct Declarator;

struct TemplateDatatype
{
struct __ecereNameSpace__ecere__sys__OldList * specifiers;
struct Declarator * decl;
} ecere_gcc_struct;

extern struct Declarator * CopyDeclarator(struct Declarator * declarator);

struct External;

struct TopoEdge
{
struct __ecereNameSpace__ecere__com__LinkElement in, out;
struct External * from, * to;
unsigned int breakable;
} ecere_gcc_struct;

extern struct External * MkExternalDeclaration(struct Declaration * declaration);

struct Type;

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
struct Type * dataType;
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

extern void DeclareTypeForwardDeclare(struct External * neededFor, struct Type * type, unsigned int needDereference, unsigned int forFunctionDef);

extern void PrintType(struct Type * type, char *  string, unsigned int printName, unsigned int fullName);

struct __ecereNameSpace__ecere__com__DataMember;

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_New(int type, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_AddDataMember(struct __ecereNameSpace__ecere__com__DataMember * member, const char *  name, const char *  type, unsigned int size, unsigned int alignment, int declMode);

extern unsigned int __ecereNameSpace__ecere__com__eClass_AddMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__DataMember * dataMember);

extern unsigned int __ecereNameSpace__ecere__com__eMember_AddMember(struct __ecereNameSpace__ecere__com__DataMember * addTo, struct __ecereNameSpace__ecere__com__DataMember * dataMember);

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} ecere_gcc_struct;

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
struct Type * dataType;
int type;
int offset;
int memberID;
struct __ecereNameSpace__ecere__sys__OldList members;
struct __ecereNameSpace__ecere__sys__BinaryTree membersAlpha;
int memberOffset;
short structAlignment;
short pointerAlignment;
} ecere_gcc_struct;

int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, const char *  a, const char *  b);

struct TemplateParameter;

struct TemplatedType
{
uintptr_t key;
struct __ecereNameSpace__ecere__sys__BTNode * parent;
struct __ecereNameSpace__ecere__sys__BTNode * left;
struct __ecereNameSpace__ecere__sys__BTNode * right;
int depth;
struct TemplateParameter * param;
} ecere_gcc_struct;

extern struct Type * ProcessTemplateParameterType(struct TemplateParameter * param);

struct Symbol;

struct DBTableDef
{
char * name;
struct Symbol * symbol;
struct __ecereNameSpace__ecere__sys__OldList * definitions;
int declMode;
} ecere_gcc_struct;

struct Identifier
{
struct Identifier * prev, * next;
struct Location loc;
struct Symbol * classSym;
struct Specifier * _class;
char * string;
struct Identifier * badID;
} ecere_gcc_struct;

struct ClassImport;

struct ClassImport
{
struct ClassImport * prev, * next;
char * name;
struct __ecereNameSpace__ecere__sys__OldList methods;
struct __ecereNameSpace__ecere__sys__OldList properties;
unsigned int itself;
int isRemote;
} ecere_gcc_struct;

void Compiler_Error(const char *  format, ...);

int yyerror()
{
if(!skipErrors)
{
parseError = 1;
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "syntax error\n", (((void *)0))));
}
return 0;
}

struct Attrib;

struct Attrib
{
struct Attrib * prev, * next;
struct Location loc;
int type;
struct __ecereNameSpace__ecere__sys__OldList * attribs;
} ecere_gcc_struct;

struct ExtDecl
{
struct Location loc;
int type;
union
{
char * s;
struct Attrib * attr;
struct __ecereNameSpace__ecere__sys__OldList * multiAttr;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

struct Specifier
{
struct Specifier * prev, * next;
struct Location loc;
int type;
union
{
int specifier;
struct
{
struct ExtDecl * extDecl;
char * name;
struct Symbol * symbol;
struct __ecereNameSpace__ecere__sys__OldList * templateArgs;
struct Specifier * nsSpec;
} ecere_gcc_struct __anon1;
struct
{
struct Identifier * id;
struct __ecereNameSpace__ecere__sys__OldList * list;
struct __ecereNameSpace__ecere__sys__OldList * baseSpecs;
struct __ecereNameSpace__ecere__sys__OldList * definitions;
unsigned int addNameSpace;
struct Context * ctx;
struct ExtDecl * extDeclStruct;
} ecere_gcc_struct __anon2;
struct Expression * expression;
struct Specifier * _class;
struct TemplateParameter * templateParameter;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

struct Pointer;

struct Pointer
{
struct Pointer * prev, * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList * qualifiers;
struct Pointer * pointer;
} ecere_gcc_struct;

struct Declarator
{
struct Declarator * prev, * next;
struct Location loc;
int type;
struct Symbol * symbol;
struct Declarator * declarator;
union
{
struct Identifier * identifier;
struct
{
struct Expression * exp;
struct Expression * posExp;
struct Attrib * attrib;
} ecere_gcc_struct structDecl;
struct
{
struct Expression * exp;
struct Specifier * enumClass;
} ecere_gcc_struct array;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * parameters;
} ecere_gcc_struct function;
struct
{
struct Pointer * pointer;
} ecere_gcc_struct pointer;
struct
{
struct ExtDecl * extended;
} ecere_gcc_struct extended;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

struct MembersInit;

struct MemberInit;

struct PropertyWatch;

struct Operand;

struct OpTable
{
unsigned int (* Add)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* Sub)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* Mul)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* Div)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* Mod)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* Neg)(struct Expression *, struct Operand *);
unsigned int (* Inc)(struct Expression *, struct Operand *);
unsigned int (* Dec)(struct Expression *, struct Operand *);
unsigned int (* Asign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* AddAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* SubAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* MulAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* DivAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* ModAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* BitAnd)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* BitOr)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* BitXor)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* LShift)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* RShift)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* BitNot)(struct Expression *, struct Operand *);
unsigned int (* AndAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* OrAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* XorAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* LShiftAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* RShiftAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* Not)(struct Expression *, struct Operand *);
unsigned int (* Equ)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* Nqu)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* And)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* Or)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* Grt)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* Sma)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* GrtEqu)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* SmaEqu)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (* Cond)(struct Expression *, struct Operand *, struct Operand *, struct Operand *);
} ecere_gcc_struct;

struct Operand
{
int kind;
struct Type * type;
unsigned int ptrSize;
union
{
char c;
unsigned char uc;
short s;
unsigned short us;
int i;
unsigned int ui;
float f;
double d;
long long i64;
uint64 ui64;
} ecere_gcc_struct __anon1;
struct OpTable ops;
} ecere_gcc_struct;

struct Attribute;

struct Attribute
{
struct Attribute * prev, * next;
struct Location loc;
char * attr;
struct Expression * exp;
} ecere_gcc_struct;

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

struct Type
{
struct Type * prev, * next;
int refCount;
union
{
struct Symbol * _class;
struct
{
struct __ecereNameSpace__ecere__sys__OldList members;
char * enumName;
} ecere_gcc_struct __anon1;
struct
{
struct Type * returnType;
struct __ecereNameSpace__ecere__sys__OldList params;
struct Symbol * thisClass;
unsigned int staticMethod;
struct TemplateParameter * thisClassTemplate;
} ecere_gcc_struct __anon2;
struct
{
struct __ecereNameSpace__ecere__com__Method * method;
struct __ecereNameSpace__ecere__com__Class * methodClass;
struct __ecereNameSpace__ecere__com__Class * usedClass;
} ecere_gcc_struct __anon3;
struct
{
struct Type * arrayType;
int arraySize;
struct Expression * arraySizeExp;
unsigned int freeExp;
struct Symbol * enumClass;
} ecere_gcc_struct __anon4;
struct Type * type;
struct TemplateParameter * templateParameter;
} ecere_gcc_struct __anon1;
int kind;
unsigned int size;
char * name;
char * typeName;
struct __ecereNameSpace__ecere__com__Class * thisClassFrom;
int promotedFrom;
int classObjectType;
int alignment;
unsigned int offset;
int bitFieldCount;
int count;
int bitMemberSize;
unsigned int isSigned : 1;
unsigned int constant : 1;
unsigned int truth : 1;
unsigned int byReference : 1;
unsigned int extraParam : 1;
unsigned int directClassAccess : 1;
unsigned int computing : 1;
unsigned int keepCast : 1;
unsigned int passAsTemplate : 1;
unsigned int dllExport : 1;
unsigned int attrStdcall : 1;
unsigned int declaredWithStruct : 1;
unsigned int typedByReference : 1;
unsigned int casted : 1;
unsigned int pointerAlignment : 1;
unsigned int isLong : 1;
unsigned int signedBeforePromotion : 1;
unsigned int isVector : 1;
} ecere_gcc_struct;

struct Symbol
{
char * string;
struct Symbol * parent, * left, * right;
int depth;
struct Type * type;
union
{
struct __ecereNameSpace__ecere__com__Method * method;
struct __ecereNameSpace__ecere__com__Property * _property;
struct __ecereNameSpace__ecere__com__Class * registered;
} ecere_gcc_struct __anon1;
unsigned int notYetDeclared;
union
{
struct
{
struct External * pointerExternal;
struct External * structExternal;
} ecere_gcc_struct __anon1;
struct
{
struct External * externalGet;
struct External * externalSet;
struct External * externalPtr;
struct External * externalIsSet;
} ecere_gcc_struct __anon2;
struct
{
struct External * methodExternal;
struct External * methodCodeExternal;
} ecere_gcc_struct __anon3;
} ecere_gcc_struct __anon2;
unsigned int imported, declaredStructSym;
struct __ecereNameSpace__ecere__com__Class * _class;
unsigned int declaredStruct;
unsigned int needConstructor, needDestructor;
char * constructorName, * structName, * className, * destructorName;
struct ModuleImport * module;
struct ClassImport * _import;
struct Location nameLoc;
unsigned int isParam;
unsigned int isRemote;
unsigned int isStruct;
unsigned int fireWatchersDone;
int declaring;
unsigned int classData;
unsigned int isStatic;
char * shortName;
struct __ecereNameSpace__ecere__sys__OldList * templateParams;
struct __ecereNameSpace__ecere__sys__OldList templatedClasses;
struct Context * ctx;
int isIterator;
struct Expression * propCategory;
unsigned int mustRegister;
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
struct Type * dataType;
int memberAccess;
} ecere_gcc_struct;

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, void *  function, int declMode);

unsigned int __ecereProp_Type_Get_specConst(struct Type * this)
{
struct Type * t = this;

while((t->kind == 13 || t->kind == 12) && t->__anon1.type)
t = t->__anon1.type;
return t->constant;
}

unsigned int __ecereProp_Type_Get_isPointerTypeSize(struct Type * this);

struct __ecereNameSpace__ecere__com__Module;

struct __ecereNameSpace__ecere__com__Instance * privateModule;

struct GlobalData
{
uintptr_t key;
struct __ecereNameSpace__ecere__sys__BTNode * parent;
struct __ecereNameSpace__ecere__sys__BTNode * left;
struct __ecereNameSpace__ecere__sys__BTNode * right;
int depth;
struct __ecereNameSpace__ecere__com__Instance * module;
char * dataTypeString;
struct Type * dataType;
void * symbol;
char * fullName;
} ecere_gcc_struct;

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, const char *  name, const char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(const char *  name, const char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

extern struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_RegisterDefine(const char *  name, const char *  value, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

void SetPrivateModule(struct __ecereNameSpace__ecere__com__Instance * module)
{
privateModule = module;
}

struct __ecereNameSpace__ecere__com__Instance * GetPrivateModule()
{
return privateModule;
}

struct Initializer;

struct Initializer
{
struct Initializer * prev, * next;
struct Location loc;
int type;
union
{
struct Expression * exp;
struct __ecereNameSpace__ecere__sys__OldList * list;
} ecere_gcc_struct __anon1;
unsigned int isConstant;
struct Identifier * id;
} ecere_gcc_struct;

struct MemberInit
{
struct MemberInit * prev, * next;
struct Location loc;
struct Location realLoc;
struct __ecereNameSpace__ecere__sys__OldList * identifiers;
struct Initializer * initializer;
unsigned int used;
unsigned int variable;
unsigned int takeOutExp;
} ecere_gcc_struct;

struct Enumerator;

struct Enumerator
{
struct Enumerator * prev, * next;
struct Location loc;
struct Identifier * id;
struct Expression * exp;
struct __ecereNameSpace__ecere__sys__OldList * attribs;
} ecere_gcc_struct;

struct AsmField;

struct AsmField
{
struct AsmField * prev, * next;
struct Location loc;
char * command;
struct Expression * expression;
struct Identifier * symbolic;
} ecere_gcc_struct;

struct DBTableEntry;

struct Statement;

struct Statement
{
struct Statement * prev, * next;
struct Location loc;
int type;
union
{
struct __ecereNameSpace__ecere__sys__OldList * expressions;
struct
{
struct Identifier * id;
struct Statement * stmt;
} ecere_gcc_struct labeled;
struct
{
struct Expression * exp;
struct Statement * stmt;
} ecere_gcc_struct caseStmt;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * declarations;
struct __ecereNameSpace__ecere__sys__OldList * statements;
struct Context * context;
unsigned int isSwitch;
} ecere_gcc_struct compound;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct Statement * stmt;
struct Statement * elseStmt;
} ecere_gcc_struct ifStmt;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct Statement * stmt;
} ecere_gcc_struct switchStmt;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct Statement * stmt;
} ecere_gcc_struct whileStmt;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct Statement * stmt;
} ecere_gcc_struct doWhile;
struct
{
struct Statement * init;
struct Statement * check;
struct __ecereNameSpace__ecere__sys__OldList * increment;
struct Statement * stmt;
} ecere_gcc_struct forStmt;
struct
{
struct Identifier * id;
} ecere_gcc_struct gotoStmt;
struct
{
struct Specifier * spec;
char * statements;
struct __ecereNameSpace__ecere__sys__OldList * inputFields;
struct __ecereNameSpace__ecere__sys__OldList * outputFields;
struct __ecereNameSpace__ecere__sys__OldList * clobberedFields;
} ecere_gcc_struct asmStmt;
struct
{
struct Expression * watcher, * object;
struct __ecereNameSpace__ecere__sys__OldList * watches;
} ecere_gcc_struct _watch;
struct
{
struct Identifier * id;
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct __ecereNameSpace__ecere__sys__OldList * filter;
struct Statement * stmt;
} ecere_gcc_struct forEachStmt;
struct Declaration * decl;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

struct PropertyWatch
{
struct PropertyWatch * prev, * next;
struct Location loc;
struct Statement * compound;
struct __ecereNameSpace__ecere__sys__OldList * properties;
unsigned int deleteWatch;
} ecere_gcc_struct;

struct TypeName;

struct TypeName
{
struct TypeName * prev, * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList * qualifiers;
struct Declarator * declarator;
int classObjectType;
struct Expression * bitCount;
} ecere_gcc_struct;

struct DBTableEntry
{
struct DBTableEntry * prev, * next;
int type;
struct Identifier * id;
union
{
struct
{
struct TypeName * dataType;
char * name;
} ecere_gcc_struct __anon1;
struct __ecereNameSpace__ecere__sys__OldList * items;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

struct TemplateArgument;

struct TemplateArgument
{
struct TemplateArgument * prev, * next;
struct Location loc;
struct Identifier * name;
int type;
union
{
struct Expression * expression;
struct Identifier * identifier;
struct TemplateDatatype * templateDatatype;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

struct TemplateParameter
{
struct TemplateParameter * prev, * next;
struct Location loc;
int type;
struct Identifier * identifier;
union
{
struct TemplateDatatype * dataType;
int memberType;
} ecere_gcc_struct __anon1;
struct TemplateArgument * defaultArgument;
const char * dataTypeString;
struct Type * baseType;
} ecere_gcc_struct;

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
struct Type * dataType;
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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_TokenType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Order;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBTableDef;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBTableEntryType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBTableEntry;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBIndexItem;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_GlobalData;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplatedType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_DataRedefinition;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_CodePosition;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Location;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_DefinitionType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Definition;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ImportedModule;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Identifier;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ExpressionType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_MemberType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ExpUsage;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateParameter;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateDatatype;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateArgument;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_SpecifierType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Specifier;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Attribute;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Attrib;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ExtDecl;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ExtDeclType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Expression;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Enumerator;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Pointer;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_DeclaratorType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declarator;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_InitializerType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Initializer;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_InitDeclarator;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassObjectType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_TypeName;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_AsmField;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_StmtType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Statement;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_DeclarationType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declaration;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Instantiation;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_MembersInitType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionDefinition;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassFunction;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_MembersInit;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_MemberInit;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassDefinition;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyWatch;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassDefType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyDef;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassDef;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_TopoEdge;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ExternalType;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_External;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Context;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Symbol;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassImport;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionImport;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ModuleImport;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyImport;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_MethodImport;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_TypeKind;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Type;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Operand;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_OpTable;

const char * __ecereMethod_Type_OnGetString(struct __ecereNameSpace__ecere__com__Class * class, struct Type * this, char * tempString, void * fieldData, unsigned int * onType)
{
struct Type * type = (struct Type *)this;

tempString[0] = '\0';
if(type)
PrintType(type, tempString, 0, 1);
return tempString;
}

void __ecereMethod_Type_OnFree(struct __ecereNameSpace__ecere__com__Class * class, struct Type * this)
{
}

unsigned int __ecereProp_Type_Get_isPointerTypeSize(struct Type * this)
{
unsigned int result = 0;

if(this)
{
switch(this->kind)
{
case 8:
{
struct __ecereNameSpace__ecere__com__Class * _class = this->__anon1._class ? this->__anon1._class->__anon1.registered : (((void *)0));

if(!_class || (_class->type != 1 && _class->type != 3 && _class->type != 4 && _class->type != 2))
result = 1;
break;
}
case 13:
case 19:
case 21:
case 22:
case 23:
result = 1;
break;
case 20:
{
struct TemplateParameter * param = this->__anon1.templateParameter;
struct Type * baseType = ProcessTemplateParameterType(param);

if(baseType)
result = __ecereProp_Type_Get_isPointerTypeSize(baseType);
break;
}
}
}
return result;
}

unsigned int __ecereProp_Type_Get_isPointerType(struct Type * this)
{
if(this)
{
if(this->kind == 13 || this->kind == 16 || this->kind == 11 || this->kind == 12 || this->kind == 19)
return 1;
else if(this->kind == 8)
{
if(this->__anon1._class && this->__anon1._class->__anon1.registered)
{
struct __ecereNameSpace__ecere__com__Class * c = this->__anon1._class->__anon1.registered;

if(c->type == 2 || c->type == 3 || c->type == 4 || c->type == 1000)
return 0;
else if(c->type == 1 && !this->byReference)
return 0;
}
return 1;
}
else if(this->kind == 20)
{
if(this->passAsTemplate)
return 0;
if(this->__anon1.templateParameter)
{
if(this->__anon1.templateParameter->__anon1.dataType)
{
struct Specifier * spec = this->__anon1.templateParameter->__anon1.dataType->specifiers ? (*this->__anon1.templateParameter->__anon1.dataType->specifiers).first : (((void *)0));

if(this->__anon1.templateParameter->__anon1.dataType->decl && this->__anon1.templateParameter->__anon1.dataType->decl->type == 5)
return 1;
if(spec && spec->type == 1 && strcmp(spec->__anon1.__anon1.name, "uint64"))
return 1;
}
if(this->__anon1.templateParameter->dataTypeString)
return 1;
}
}
else
return 0;
}
return 0;
}

extern void __ecereNameSpace__ecere__com__PrintLn(struct __ecereNameSpace__ecere__com__Class * class, const void * object, ...);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__LinkList_TPL_TopoEdge__link__EQU__out_;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__LinkList_TPL_TopoEdge__link__EQU__in_;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__LinkList;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_char__PTR_;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Application;

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

void __ecereUnregisterModule_ecdefs(struct __ecereNameSpace__ecere__com__Instance * module)
{

__ecerePropM_Type_specConst = (void *)0;
__ecerePropM_Type_isPointerTypeSize = (void *)0;
__ecerePropM_Type_isPointerType = (void *)0;
}

void Compiler_Error(const char * format, ...)
{
if(inCompiler)
{
if(!parsingType)
{
va_list args;
char string[10000];

if(yylloc.start.included)
{
__ecereNameSpace__ecere__sys__GetWorkingDir(string, sizeof (string));
__ecereNameSpace__ecere__sys__PathCat(string, GetIncludeFileFromID(yylloc.start.included));
}
else
{
__ecereNameSpace__ecere__sys__GetWorkingDir(string, sizeof (string));
__ecereNameSpace__ecere__sys__PathCat(string, sourceFile);
}
printf("%s", string);
printf(__ecereNameSpace__ecere__GetTranslatedString("ec", ":%d:%d: error: ", (((void *)0))), yylloc.start.line, yylloc.start.charPos);
__builtin_va_start(args, format);
vsnprintf(string, sizeof (string), format, args);
string[sizeof (string) - 1] = 0;
__builtin_va_end(args);
fputs(string, (bsl_stdout()));
fflush((bsl_stdout()));
((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->exitCode = 1;
}
else
{
parseTypeError = 1;
}
}
}

struct ClassDefinition;

struct ClassDefinition
{
struct ClassDefinition * prev, * next;
struct Location loc;
struct Specifier * _class;
struct __ecereNameSpace__ecere__sys__OldList * baseSpecs;
struct __ecereNameSpace__ecere__sys__OldList * definitions;
struct Symbol * symbol;
struct Location blockStart;
struct Location nameLoc;
int declMode;
unsigned int deleteWatchable;
} ecere_gcc_struct;

struct Context
{
struct Context * parent;
struct __ecereNameSpace__ecere__sys__BinaryTree types;
struct __ecereNameSpace__ecere__sys__BinaryTree classes;
struct __ecereNameSpace__ecere__sys__BinaryTree symbols;
struct __ecereNameSpace__ecere__sys__BinaryTree structSymbols;
int nextID;
int simpleID;
struct __ecereNameSpace__ecere__sys__BinaryTree templateTypes;
struct ClassDefinition * classDef;
unsigned int templateTypesOnly;
unsigned int hasNameSpace;
} ecere_gcc_struct;

unsigned int __ecereConstructor_Context(struct Context * this)
{
(this->types.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString);
(this->classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString);
(this->symbols.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString);
(this->structSymbols.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString);
(this->templateTypes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString);
return 1;
}

struct Instantiation;

struct Instantiation
{
struct Instantiation * prev, * next;
struct Location loc;
struct Specifier * _class;
struct Expression * exp;
struct __ecereNameSpace__ecere__sys__OldList * members;
struct Symbol * symbol;
unsigned int fullSet;
unsigned int isConstant;
unsigned char * data;
struct Location nameLoc, insideLoc;
unsigned int built;
} ecere_gcc_struct;

struct Declaration
{
struct Declaration * prev, * next;
struct Location loc;
int type;
union
{
struct
{
struct __ecereNameSpace__ecere__sys__OldList * specifiers;
struct __ecereNameSpace__ecere__sys__OldList * declarators;
} ecere_gcc_struct __anon1;
struct Instantiation * inst;
struct
{
struct Identifier * id;
struct Expression * exp;
} ecere_gcc_struct __anon2;
} ecere_gcc_struct __anon1;
struct Specifier * extStorage;
struct Symbol * symbol;
int declMode;
} ecere_gcc_struct;

struct Expression
{
struct Expression * prev, * next;
struct Location loc;
int type;
union
{
struct
{
char * constant;
struct Identifier * identifier;
} ecere_gcc_struct __anon1;
struct Statement * compound;
struct Instantiation * instance;
struct
{
char * string;
unsigned int intlString;
unsigned int wideString;
} ecere_gcc_struct __anon2;
struct __ecereNameSpace__ecere__sys__OldList * list;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * specifiers;
struct Declarator * decl;
} ecere_gcc_struct _classExp;
struct
{
struct Identifier * id;
} ecere_gcc_struct classData;
struct
{
struct Expression * exp;
struct __ecereNameSpace__ecere__sys__OldList * arguments;
struct Location argLoc;
} ecere_gcc_struct call;
struct
{
struct Expression * exp;
struct __ecereNameSpace__ecere__sys__OldList * index;
} ecere_gcc_struct index;
struct
{
struct Expression * exp;
struct Identifier * member;
int memberType;
unsigned int thisPtr;
} ecere_gcc_struct member;
struct
{
int op;
struct Expression * exp1, * exp2;
} ecere_gcc_struct op;
struct TypeName * typeName;
struct Specifier * _class;
struct
{
struct TypeName * typeName;
struct Expression * exp;
} ecere_gcc_struct cast;
struct
{
struct Expression * cond;
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct Expression * elseExp;
} ecere_gcc_struct cond;
struct
{
struct TypeName * typeName;
struct Expression * size;
} ecere_gcc_struct _new;
struct
{
struct TypeName * typeName;
struct Expression * size;
struct Expression * exp;
} ecere_gcc_struct _renew;
struct
{
char * table;
struct Identifier * id;
} ecere_gcc_struct db;
struct
{
struct Expression * ds;
struct Expression * name;
} ecere_gcc_struct dbopen;
struct
{
struct TypeName * typeName;
struct Initializer * initializer;
} ecere_gcc_struct initializer;
struct
{
struct Expression * exp;
struct TypeName * typeName;
} ecere_gcc_struct vaArg;
struct
{
struct TypeName * typeName;
struct Identifier * id;
} ecere_gcc_struct offset;
} ecere_gcc_struct __anon1;
unsigned int debugValue;
struct __ecereNameSpace__ecere__com__DataValue val;
uint64 address;
unsigned int hasAddress;
struct Type * expType;
struct Type * destType;
unsigned int usage;
int tempCount;
unsigned int byReference;
unsigned int isConstant;
unsigned int addedThis;
unsigned int needCast;
unsigned int thisPtr;
unsigned int opDestType;
unsigned int usedInComparison;
unsigned int ambiguousUnits;
unsigned int parentOpDestType;
unsigned int needTemplateCast;
} ecere_gcc_struct;

void __ecereMethod_Expression_Clear(struct Expression * this)
{
struct __ecereNameSpace__ecere__com__DataValue __simpleStruct0 =
{

.__anon1 = {
.c = 0
}
};

this->debugValue = 0;
this->val = __simpleStruct0;
this->address = 0;
this->hasAddress = 0;
this->expType = (((void *)0));
this->destType = (((void *)0));
this->usage = 0;
this->tempCount = 0;
this->byReference = 0;
this->isConstant = 0;
this->addedThis = 0;
this->needCast = 0;
this->thisPtr = 0;
this->opDestType = 0;
this->parentOpDestType = 0;
this->usedInComparison = 0;
this->needTemplateCast = 0;
}

struct ClassFunction;

struct ClassFunction
{
struct ClassFunction * prev, * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList * specifiers;
struct Declarator * declarator;
struct __ecereNameSpace__ecere__sys__OldList * declarations;
struct Statement * body;
struct __ecereNameSpace__ecere__com__Class * _class;
struct __ecereNameSpace__ecere__sys__OldList attached;
int declMode;
struct Type * type;
struct Symbol * propSet;
unsigned int isVirtual;
unsigned int isConstructor, isDestructor;
unsigned int dontMangle;
int id, idCode;
} ecere_gcc_struct;

struct MembersInit
{
struct MembersInit * prev, * next;
struct Location loc;
int type;
union
{
struct __ecereNameSpace__ecere__sys__OldList * dataMembers;
struct ClassFunction * function;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

struct InitDeclarator;

struct InitDeclarator
{
struct InitDeclarator * prev, * next;
struct Location loc;
struct Declarator * declarator;
struct Initializer * initializer;
} ecere_gcc_struct;

extern struct InitDeclarator * MkInitDeclarator(struct Declarator * declarator, struct Initializer * initializer);

struct FunctionDefinition;

struct FunctionDefinition
{
struct FunctionDefinition * prev, * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList * specifiers;
struct Declarator * declarator;
struct __ecereNameSpace__ecere__sys__OldList * declarations;
struct Statement * body;
struct __ecereNameSpace__ecere__com__Class * _class;
struct __ecereNameSpace__ecere__sys__OldList attached;
int declMode;
struct Type * type;
struct Symbol * propSet;
int tempCount;
unsigned int propertyNoThis;
} ecere_gcc_struct;

struct External
{
struct External * prev, * next;
struct Location loc;
int type;
struct Symbol * symbol;
union
{
struct FunctionDefinition * function;
struct ClassDefinition * _class;
struct Declaration * declaration;
char * importString;
struct Identifier * id;
struct DBTableDef * table;
char * pragma;
} ecere_gcc_struct __anon1;
int importType;
struct External * fwdDecl;
struct __ecereNameSpace__ecere__com__Instance * outgoing;
struct __ecereNameSpace__ecere__com__Instance * incoming;
int nonBreakableIncoming;
} ecere_gcc_struct;

unsigned int __ecereConstructor_External(struct External * this)
{
this->outgoing = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__LinkList_TPL_TopoEdge__link__EQU__out_);
__ecereNameSpace__ecere__com__eInstance_IncRef(this->outgoing);
this->incoming = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__LinkList_TPL_TopoEdge__link__EQU__in_);
__ecereNameSpace__ecere__com__eInstance_IncRef(this->incoming);
return 1;
}

void __ecereDestructor_External(struct External * this)
{
(__ecereNameSpace__ecere__com__eInstance_DecRef(this->outgoing), this->outgoing = 0);
(__ecereNameSpace__ecere__com__eInstance_DecRef(this->incoming), this->incoming = 0);
}

void __ecereMethod_External_CreateEdge(struct External * this, struct External * from, unsigned int soft)
{
struct TopoEdge * e = (e = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TopoEdge), e->from = from, e->to = this, e->breakable = soft, e);

(__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = from->outgoing;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add]);
__internal_VirtualMethod ? __internal_VirtualMethod(from->outgoing, (uint64)(uintptr_t)(e)) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
(__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = this->incoming;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add]);
__internal_VirtualMethod ? __internal_VirtualMethod(this->incoming, (uint64)(uintptr_t)(e)) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
}));
if(!soft)
this->nonBreakableIncoming++;
}

struct External * __ecereMethod_External_ForwardDeclare(struct External * this)
{
struct External * f = (((void *)0));
struct Context * tmpContext = curContext;

switch(this->type)
{
case 1:
{
if(this->__anon1.declaration->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = this->__anon1.declaration->__anon1.__anon1.specifiers;

if(specs)
{
struct Specifier * s;

for(s = (*specs).first; s; s = s->next)
{
if(s->type == 3 || s->type == 4)
break;
}
if(s)
{
curContext = (((void *)0));
f = MkExternalDeclaration(MkDeclaration(MkListOne(MkStructOrUnion(s->type, CopyIdentifier(s->__anon1.__anon2.id), (((void *)0)))), (((void *)0))));
curContext = tmpContext;
}
}
}
break;
}
case 0:
{
curContext = (((void *)0));
f = MkExternalDeclaration(MkDeclaration(CopyList(this->__anon1.function->specifiers, (void *)(CopySpecifier)), MkListOne(MkInitDeclarator(CopyDeclarator(this->__anon1.function->declarator), (((void *)0))))));
curContext = tmpContext;
f->symbol = this->symbol;
DeclareTypeForwardDeclare(f, this->symbol->type, 0, 0);
break;
}
}
this->fwdDecl = f;
if(!f)
__ecereNameSpace__ecere__com__PrintLn(__ecereClass_char__PTR_, "warning: unhandled forward declaration requested", (void *)0);
return f;
}

void __ecereMethod_External_CreateUniqueEdge(struct External * this, struct External * from, unsigned int soft)
{
{
struct TopoEdge * i;
struct __ecereNameSpace__ecere__com__Instance * __internalLinkList = from->outgoing;

for(i = ((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)__internalLinkList + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->first; i; i = (struct TopoEdge *)(__extension__ ({
struct __ecereNameSpace__ecere__com__IteratorPointer * (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer);

__internal_VirtualMethod = ((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = __internalLinkList;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext]);
__internal_VirtualMethod ? __internal_VirtualMethod(__internalLinkList, (struct __ecereNameSpace__ecere__com__IteratorPointer *)i) : (struct __ecereNameSpace__ecere__com__IteratorPointer *)1;
})))
if(i->to == this)
{
if(i->breakable && !soft)
{
i->breakable = 0;
this->nonBreakableIncoming++;
}
return ;
}
}
__ecereMethod_External_CreateEdge(this, from, soft);
}

struct PropertyDef;

struct PropertyDef
{
struct PropertyDef * prev, * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList * specifiers;
struct Declarator * declarator;
struct Identifier * id;
struct Statement * getStmt;
struct Statement * setStmt;
struct Statement * issetStmt;
struct Symbol * symbol;
struct Expression * category;
struct
{
unsigned int conversion : 1;
unsigned int isWatchable : 1;
unsigned int isDBProp : 1;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

struct ClassDef;

struct ClassDef
{
struct ClassDef * prev, * next;
struct Location loc;
int type;
union
{
struct Declaration * decl;
struct ClassFunction * function;
struct __ecereNameSpace__ecere__sys__OldList * defProperties;
struct PropertyDef * propertyDef;
struct PropertyWatch * propertyWatch;
char * designer;
struct Identifier * defaultProperty;
struct
{
struct Identifier * id;
struct Initializer * initializer;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct __anon1;
int memberAccess;
void * object;
} ecere_gcc_struct;

typedef union YYSTYPE
{
int specifierType;
int i;
int declMode;
struct Identifier * id;
struct Expression * exp;
struct Specifier * specifier;
struct __ecereNameSpace__ecere__sys__OldList * list;
struct Enumerator * enumerator;
struct Declarator * declarator;
struct Pointer * pointer;
struct Initializer * initializer;
struct InitDeclarator * initDeclarator;
struct TypeName * typeName;
struct Declaration * declaration;
struct Statement * stmt;
struct FunctionDefinition * function;
struct External * external;
struct Context * context;
struct AsmField * asmField;
struct Attrib * attrib;
struct ExtDecl * extDecl;
struct Attribute * attribute;
struct Instantiation * instance;
struct MembersInit * membersInit;
struct MemberInit * memberInit;
struct ClassFunction * classFunction;
struct ClassDefinition * _class;
struct ClassDef * classDef;
struct PropertyDef * prop;
char * string;
struct Symbol * symbol;
struct PropertyWatch * propertyWatch;
struct TemplateParameter * templateParameter;
struct TemplateArgument * templateArgument;
struct TemplateDatatype * templateDatatype;
struct DBTableEntry * dbtableEntry;
struct DBIndexItem * dbindexItem;
struct DBTableDef * dbtableDef;
} ecere_gcc_struct YYSTYPE;

extern YYSTYPE yylval;

void __ecereRegisterModule_ecdefs(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "TokenType", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_TokenType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "identifier", 258);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "constant", 259);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "stringLiteral", 260);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "sizeOf", 261);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "ptrOp", 262);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "incOp", 263);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "decOp", 264);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "leftOp", 265);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "rightOp", 266);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "leOp", 267);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "geOp", 268);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "eqOp", 269);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "neOp", 270);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "andOp", 271);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "orOp", 272);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "mulAssign", 273);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "divAssign", 274);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "modAssign", 275);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "addAssign", 276);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "subAssign", 277);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "leftAssign", 278);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "rightAssign", 279);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "andAssign", 280);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "xorAssign", 281);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "orAssign", 282);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "typeName", 283);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_typedef", 284);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_extern", 285);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_static", 286);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_auto", 287);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_register", 288);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_char", 289);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_short", 290);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_int", 291);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_uint", 292);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_int64", 293);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_int128", 294);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_float128", 295);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_long", 296);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_signed", 297);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_unsigned", 298);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_float", 299);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_double", 300);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_const", 301);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_volatile", 302);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_void", 303);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_valist", 304);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_struct", 305);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_union", 306);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_enum", 307);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "ellipsis", 308);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_case", 309);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_default", 310);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_if", 311);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_switch", 312);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_while", 313);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_do", 314);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_for", 315);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_goto", 316);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_continue", 317);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_break", 318);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_return", 319);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "ifx", 320);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_else", 321);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_class", 322);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "thisClass", 323);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_property", 324);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "setProp", 325);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "getProp", 326);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "newOp", 327);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_renew", 328);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_delete", 329);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_extDecl", 330);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_extStorage", 331);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_import", 332);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_define", 333);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_virtual", 334);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "attrib", 335);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_public", 336);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_priate", 337);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "typedObject", 338);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "anyObject", 339);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_incref", 340);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "extension", 341);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "___asm", 342);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_typeof", 343);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_watch", 344);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "stopWatching", 345);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "fireWatchers", 346);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_watchable", 347);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classDesigner", 348);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classNoExpansion", 349);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classFixed", 350);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "isPropSet", 351);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classDefaultProperty", 352);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "propertyCategory", 353);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classData", 354);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classProperty", 355);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "subClass", 356);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "nameSpace", 357);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "new0Op", 358);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "renew0Op", 359);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "vaArg", 360);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "dbTable", 361);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "dbField", 362);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "dbIndex", 363);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "databaseOpen", 364);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "alignOf", 365);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "attribDep", 366);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_attrib", 367);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "BOOL", 368);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_BOOL", 369);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "complex", 370);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "imaginary", 371);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_restrict", 372);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_thread", 373);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "Order", 0, 0, 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Order = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "ascending", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "descending", 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "DBTableDef", 0, sizeof(struct DBTableDef), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_DBTableDef = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbol", "Symbol", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "definitions", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declMode", "ecere::com::AccessMode", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "DBTableEntryType", 0, 0, 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_DBTableEntryType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "fieldEntry", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "indexEntry", 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "DBTableEntry", 0, sizeof(struct DBTableEntry), 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_DBTableEntry = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, (((void *)0)), (((void *)0)), 0, sizeof(void *) > 8 ? sizeof(void *) : 8, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "DBIndexItem", 0, sizeof(struct DBIndexItem), 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_DBIndexItem = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, (((void *)0)), (((void *)0)), 0, sizeof(void *) > 4 ? sizeof(void *) : 4, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetInCompiler", "void SetInCompiler(bool b)", SetInCompiler, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetInDebugger", "void SetInDebugger(bool b)", SetInDebugger, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetInBGen", "void SetInBGen(bool b)", SetInBGen, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetBGenSymbolSwapCallback", "void SetBGenSymbolSwapCallback(const char * (* cb)(const char * spec, bool reduce, bool macro))", SetBGenSymbolSwapCallback, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetPrivateModule", "void SetPrivateModule(ecere::com::Module module)", SetPrivateModule, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetPrivateModule", "ecere::com::Module GetPrivateModule(void)", GetPrivateModule, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetMainModule", "void SetMainModule(ModuleImport moduleImport)", SetMainModule, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetMainModule", "ModuleImport GetMainModule(void)", GetMainModule, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetFileInput", "void SetFileInput(ecere::sys::File file)", SetFileInput, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetSymbolsDir", "void SetSymbolsDir(const char * s)", SetSymbolsDir, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetSymbolsDir", "const char * GetSymbolsDir(void)", GetSymbolsDir, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetOutputFile", "void SetOutputFile(const char * s)", SetOutputFile, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOutputFile", "const char * GetOutputFile(void)", GetOutputFile, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetSourceFile", "void SetSourceFile(const char * s)", SetSourceFile, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetSourceFile", "const char * GetSourceFile(void)", GetSourceFile, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetI18nModuleName", "void SetI18nModuleName(const char * s)", SetI18nModuleName, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetI18nModuleName", "const char * GetI18nModuleName(void)", GetI18nModuleName, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetGlobalContext", "void SetGlobalContext(Context context)", SetGlobalContext, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetGlobalContext", "Context GetGlobalContext(void)", GetGlobalContext, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetTopContext", "void SetTopContext(Context context)", SetTopContext, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetTopContext", "Context GetTopContext(void)", GetTopContext, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetCurrentContext", "void SetCurrentContext(Context context)", SetCurrentContext, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetCurrentContext", "Context GetCurrentContext(void)", GetCurrentContext, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetExcludedSymbols", "void SetExcludedSymbols(ecere::sys::OldList * list)", SetExcludedSymbols, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetImports", "void SetImports(ecere::sys::OldList * list)", SetImports, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetDefines", "void SetDefines(ecere::sys::OldList * list)", SetDefines, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetOutputLineNumbers", "void SetOutputLineNumbers(bool value)", SetOutputLineNumbers, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FixModuleName", "void FixModuleName(char * moduleName)", FixModuleName, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PassArg", "char * PassArg(char * output, const char * input)", PassArg, module, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "GlobalData", "ecere::sys::BTNode", sizeof(struct GlobalData), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_GlobalData = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "module", "ecere::com::Module", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeString", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbol", "void *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "fullName", "char *", sizeof(void *), 0xF000F000, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "TemplatedType", "ecere::sys::BTNode", sizeof(struct TemplatedType), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_TemplatedType = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "param", "TemplateParameter", sizeof(void *), 0xF000F000, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "DataRedefinition", 0, sizeof(struct DataRedefinition), 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_DataRedefinition = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, (((void *)0)), (((void *)0)), 0, sizeof(void *) > 1 ? sizeof(void *) : 1, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "CodePosition", 0, sizeof(struct CodePosition), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_CodePosition = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "AdjustAdd", "void AdjustAdd(ecere::gui::controls::BufferLocation start, ecere::gui::controls::BufferLocation end)", __ecereMethod_CodePosition_AdjustAdd, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "AdjustDelete", "void AdjustDelete(ecere::gui::controls::BufferLocation start, ecere::gui::controls::BufferLocation end)", __ecereMethod_CodePosition_AdjustDelete, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "line", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "charPos", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "pos", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "included", "int", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "Location", 0, sizeof(struct Location), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Location = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Inside", "bool Inside(int line, int charPos)", __ecereMethod_Location_Inside, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "start", "CodePosition", sizeof(struct CodePosition), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "end", "CodePosition", sizeof(struct CodePosition), 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "DefinitionType", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_DefinitionType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "moduleDefinition", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classDefinition", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "defineDefinition", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "functionDefinition", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "dataDefinition", 4);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Definition", 0, sizeof(struct Definition), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Definition = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "Definition", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "Definition", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "DefinitionType", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ImportedModule", 0, sizeof(struct ImportedModule), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_ImportedModule = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ImportedModule", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ImportedModule", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "DefinitionType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "importType", "ecere::com::ImportType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "globalInstance", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dllOnly", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "importAccess", "ecere::com::AccessMode", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Identifier", 0, sizeof(struct Identifier), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Identifier = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "Identifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "Identifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "classSym", "Symbol", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_class", "Specifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "string", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "badID", "Identifier", sizeof(void *), 0xF000F000, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ExpressionType", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_ExpressionType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "identifierExp", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "instanceExp", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "constantExp", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "stringExp", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "opExp", 4);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "bracketsExp", 5);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "indexExp", 6);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "callExp", 7);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "memberExp", 8);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "pointerExp", 9);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "typeSizeExp", 10);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "castExp", 11);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "conditionExp", 12);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "newExp", 13);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "renewExp", 14);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classSizeExp", 15);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "dummyExp", 16);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "dereferenceErrorExp", 17);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "symbolErrorExp", 18);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "memberSymbolErrorExp", 19);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "memoryErrorExp", 20);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "unknownErrorExp", 21);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "noDebuggerErrorExp", 22);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "extensionCompoundExp", 23);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classExp", 24);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classDataExp", 25);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "new0Exp", 26);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "renew0Exp", 27);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "dbopenExp", 28);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "dbfieldExp", 29);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "dbtableExp", 30);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "dbindexExp", 31);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "extensionExpressionExp", 32);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "extensionInitializerExp", 33);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "vaArgExp", 34);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "arrayExp", 35);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "typeAlignExp", 36);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "memberPropertyErrorExp", 37);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "functionCallErrorExp", 38);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "divideBy0ErrorExp", 39);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "offsetOfExp", 40);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "MemberType", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_MemberType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "unresolvedMember", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "propertyMember", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "methodMember", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "dataMember", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "reverseConversionMember", 4);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classPropertyMember", 5);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(2, "ExpUsage", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_ExpUsage = class;
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "usageGet", "bool", 1, 0, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "usageSet", "bool", 1, 1, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "usageArg", "bool", 1, 2, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "usageCall", "bool", 1, 3, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "usageMember", "bool", 1, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "usageDeepGet", "bool", 1, 5, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "usageRef", "bool", 1, 6, 1);
__ecereNameSpace__ecere__com__eClass_AddBitMember(class, "usageDelete", "bool", 1, 7, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "TemplateParameter", 0, sizeof(struct TemplateParameter), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_TemplateParameter = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "TemplateParameter", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "TemplateParameter", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ecere::com::TemplateParameterType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "identifier", "Identifier", sizeof(void *), 0xF000F000, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "dataType", "TemplateDatatype", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "memberType", "ecere::com::TemplateMemberType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "defaultArgument", "TemplateArgument", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataTypeString", "const char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "baseType", "Type", sizeof(void *), 0xF000F000, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "TemplateDatatype", 0, sizeof(struct TemplateDatatype), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_TemplateDatatype = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "specifiers", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "decl", "Declarator", sizeof(void *), 0xF000F000, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "TemplateArgument", 0, sizeof(struct TemplateArgument), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_TemplateArgument = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "TemplateArgument", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "TemplateArgument", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "Identifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ecere::com::TemplateParameterType", 4, 4, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "expression", "Expression", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "identifier", "Identifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "templateDatatype", "TemplateDatatype", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "SpecifierType", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_SpecifierType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "baseSpecifier", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "nameSpecifier", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "enumSpecifier", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "structSpecifier", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "unionSpecifier", 4);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "extendedSpecifier", 5);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "typeOfSpecifier", 6);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "subClassSpecifier", 7);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "templateTypeSpecifier", 8);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Specifier", 0, sizeof(struct Specifier), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Specifier = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "Specifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "Specifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "SpecifierType", 4, 4, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "specifier", "int", 4, 4, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "extDecl", "ExtDecl", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "name", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "symbol", "Symbol", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "templateArgs", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "nsSpec", "Specifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "id", "Identifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "list", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "baseSpecs", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "definitions", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "addNameSpace", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "ctx", "Context", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "extDeclStruct", "ExtDecl", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "expression", "Expression", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "_class", "Specifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "templateParameter", "TemplateParameter", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Attribute", 0, sizeof(struct Attribute), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Attribute = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "Attribute", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "Attribute", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "attr", "String", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "exp", "Expression", sizeof(void *), 0xF000F000, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Attrib", 0, sizeof(struct Attrib), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Attrib = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "Attrib", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "Attrib", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "attribs", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ExtDecl", 0, sizeof(struct ExtDecl), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_ExtDecl = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ExtDeclType", 4, 4, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "s", "String", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "attr", "Attrib", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "multiAttr", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ExtDeclType", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_ExtDeclType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "extDeclString", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "extDeclAttrib", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "extDeclMultiAttrib", 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Expression", 0, sizeof(struct Expression), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Expression = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Clear", "void Clear()", __ecereMethod_Expression_Clear, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "Expression", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "Expression", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ExpressionType", 4, 4, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "constant", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "identifier", "Identifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "compound", "Statement", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "instance", "Instantiation", sizeof(void *), 0xF000F000, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "string", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "intlString", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "wideString", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "list", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "_classExp", "struct { ecere::sys::OldList * specifiers; Declarator decl; }", 16, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "classData", "struct { Identifier id; }", 8, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "call", "struct { Expression exp; ecere::sys::OldList * arguments; Location argLoc; }", 48, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "index", "struct { Expression exp; ecere::sys::OldList * index; }", 16, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "member", "struct { Expression exp; Identifier member; MemberType memberType; bool thisPtr; }", 24, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "op", "struct { int op; Expression exp1; Expression exp2; }", 24, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "typeName", "TypeName", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "_class", "Specifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "cast", "struct { TypeName typeName; Expression exp; }", 16, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "cond", "struct { Expression cond; ecere::sys::OldList * exp; Expression elseExp; }", 24, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "_new", "struct { TypeName typeName; Expression size; }", 16, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "_renew", "struct { TypeName typeName; Expression size; Expression exp; }", 24, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "db", "struct { char * table; Identifier id; }", 16, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "dbopen", "struct { Expression ds; Expression name; }", 16, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "initializer", "struct { TypeName typeName; Initializer initializer; }", 16, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "vaArg", "struct { Expression exp; TypeName typeName; }", 16, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "offset", "struct { TypeName typeName; Identifier id; }", 16, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "debugValue", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "val", "ecere::com::DataValue", sizeof(struct __ecereNameSpace__ecere__com__DataValue), 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "address", "uint64", 8, 8, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "hasAddress", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "expType", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "destType", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "usage", "ExpUsage", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "tempCount", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "byReference", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isConstant", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "addedThis", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "needCast", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "thisPtr", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "opDestType", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "usedInComparison", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "ambiguousUnits", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "parentOpDestType", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "needTemplateCast", "uint", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Enumerator", 0, sizeof(struct Enumerator), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Enumerator = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "Enumerator", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "Enumerator", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "id", "Identifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "exp", "Expression", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "attribs", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Pointer", 0, sizeof(struct Pointer), 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Pointer = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, (((void *)0)), (((void *)0)), 0, sizeof(void *) > 4 ? sizeof(void *) : 4, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "DeclaratorType", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_DeclaratorType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "structDeclarator", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "identifierDeclarator", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "bracketsDeclarator", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "arrayDeclarator", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "functionDeclarator", 4);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "pointerDeclarator", 5);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "extendedDeclarator", 6);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "extendedDeclaratorEnd", 7);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Declarator", 0, sizeof(struct Declarator), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Declarator = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "Declarator", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "Declarator", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "DeclaratorType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbol", "Symbol", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declarator", "Declarator", sizeof(void *), 0xF000F000, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "identifier", "Identifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "structDecl", "struct { Expression exp; Expression posExp; Attrib attrib; }", 24, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "array", "struct { Expression exp; Specifier enumClass; }", 16, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "function", "struct { ecere::sys::OldList * parameters; }", 8, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "pointer", "struct { Pointer pointer; }", 8, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "extended", "struct { ExtDecl extended; }", 8, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "InitializerType", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_InitializerType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "expInitializer", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "listInitializer", 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Initializer", 0, sizeof(struct Initializer), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Initializer = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "Initializer", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "Initializer", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "InitializerType", 4, 4, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "exp", "Expression", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "list", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isConstant", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "id", "Identifier", sizeof(void *), 0xF000F000, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "InitDeclarator", 0, sizeof(struct InitDeclarator), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_InitDeclarator = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "InitDeclarator", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "InitDeclarator", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declarator", "Declarator", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "initializer", "Initializer", sizeof(void *), 0xF000F000, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ClassObjectType", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_ClassObjectType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "none", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classPointer", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "typedObject", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "anyObject", 3);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "TypeName", 0, sizeof(struct TypeName), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_TypeName = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "TypeName", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "TypeName", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "qualifiers", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declarator", "Declarator", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "classObjectType", "ClassObjectType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "bitCount", "Expression", sizeof(void *), 0xF000F000, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "AsmField", 0, sizeof(struct AsmField), 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_AsmField = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, (((void *)0)), (((void *)0)), 0, sizeof(void *) > 4 ? sizeof(void *) : 4, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "StmtType", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_StmtType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "labeledStmt", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "caseStmt", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "compoundStmt", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "expressionStmt", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "ifStmt", 4);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "switchStmt", 5);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "whileStmt", 6);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "doWhileStmt", 7);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "forStmt", 8);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "gotoStmt", 9);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "continueStmt", 10);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "breakStmt", 11);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "returnStmt", 12);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "asmStmt", 13);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "badDeclarationStmt", 14);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "fireWatchersStmt", 15);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "stopWatchingStmt", 16);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "watchStmt", 17);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "forEachStmt", 18);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Statement", 0, sizeof(struct Statement), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Statement = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "Statement", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "Statement", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "StmtType", 4, 4, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "expressions", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "labeled", "struct { Identifier id; Statement stmt; }", 16, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "caseStmt", "struct { Expression exp; Statement stmt; }", 16, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "compound", "struct { ecere::sys::OldList * declarations; ecere::sys::OldList * statements; Context context; bool isSwitch; }", 32, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "ifStmt", "struct { ecere::sys::OldList * exp; Statement stmt; Statement elseStmt; }", 24, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "switchStmt", "struct { ecere::sys::OldList * exp; Statement stmt; }", 16, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "whileStmt", "struct { ecere::sys::OldList * exp; Statement stmt; }", 16, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "doWhile", "struct { ecere::sys::OldList * exp; Statement stmt; }", 16, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "forStmt", "struct { Statement init; Statement check; ecere::sys::OldList * increment; Statement stmt; }", 32, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "gotoStmt", "struct { Identifier id; }", 8, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "asmStmt", "struct { Specifier spec; char * statements; ecere::sys::OldList * inputFields; ecere::sys::OldList * outputFields; ecere::sys::OldList * clobberedFields; }", 40, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "_watch", "struct { Expression watcher; Expression object; ecere::sys::OldList * watches; }", 24, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "forEachStmt", "struct { Identifier id; ecere::sys::OldList * exp; ecere::sys::OldList * filter; Statement stmt; }", 32, 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "decl", "Declaration", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "DeclarationType", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_DeclarationType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "structDeclaration", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "initDeclaration", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "instDeclaration", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "defineDeclaration", 3);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Declaration", 0, sizeof(struct Declaration), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Declaration = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "Declaration", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "Declaration", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "DeclarationType", 4, 4, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "specifiers", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "declarators", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "inst", "Instantiation", sizeof(void *), 0xF000F000, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "id", "Identifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "exp", "Expression", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "extStorage", "Specifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbol", "Symbol", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declMode", "ecere::com::AccessMode", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Instantiation", 0, sizeof(struct Instantiation), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Instantiation = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "Instantiation", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "Instantiation", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_class", "Specifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "exp", "Expression", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "members", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbol", "Symbol", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "fullSet", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isConstant", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "data", "byte *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "nameLoc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "insideLoc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "built", "bool", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "MembersInitType", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_MembersInitType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "dataMembersInit", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "methodMembersInit", 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "FunctionDefinition", 0, sizeof(struct FunctionDefinition), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_FunctionDefinition = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "FunctionDefinition", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "FunctionDefinition", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "specifiers", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declarator", "Declarator", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declarations", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "body", "Statement", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_class", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "attached", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declMode", "ecere::com::AccessMode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "propSet", "Symbol", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "tempCount", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "propertyNoThis", "bool", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ClassFunction", 0, sizeof(struct ClassFunction), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_ClassFunction = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ClassFunction", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ClassFunction", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "specifiers", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declarator", "Declarator", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declarations", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "body", "Statement", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_class", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "attached", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declMode", "ecere::com::AccessMode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "propSet", "Symbol", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isVirtual", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isConstructor", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isDestructor", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dontMangle", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "id", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "idCode", "int", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "MembersInit", 0, sizeof(struct MembersInit), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_MembersInit = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "MembersInit", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "MembersInit", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "MembersInitType", 4, 4, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "dataMembers", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "function", "ClassFunction", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "MemberInit", 0, sizeof(struct MemberInit), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_MemberInit = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "MemberInit", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "MemberInit", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "realLoc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "identifiers", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "initializer", "Initializer", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "used", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "variable", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "takeOutExp", "bool", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ClassDefinition", 0, sizeof(struct ClassDefinition), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_ClassDefinition = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ClassDefinition", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ClassDefinition", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_class", "Specifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "baseSpecs", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "definitions", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbol", "Symbol", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "blockStart", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "nameLoc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declMode", "ecere::com::AccessMode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "deleteWatchable", "bool", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "PropertyWatch", 0, sizeof(struct PropertyWatch), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_PropertyWatch = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "PropertyWatch", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "PropertyWatch", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "compound", "Statement", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "properties", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "deleteWatch", "bool", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ClassDefType", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_ClassDefType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "functionClassDef", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "defaultPropertiesClassDef", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "declarationClassDef", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "propertyClassDef", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "propertyWatchClassDef", 4);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classDesignerClassDef", 5);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classNoExpansionClassDef", 6);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classFixedClassDef", 7);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "designerDefaultPropertyClassDef", 8);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classDataClassDef", 9);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classPropertyClassDef", 10);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classPropertyValueClassDef", 11);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "memberAccessClassDef", 12);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "accessOverrideClassDef", 13);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "PropertyDef", 0, sizeof(struct PropertyDef), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_PropertyDef = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "PropertyDef", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "PropertyDef", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "specifiers", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declarator", "Declarator", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "id", "Identifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "getStmt", "Statement", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "setStmt", "Statement", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "issetStmt", "Statement", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbol", "Symbol", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "category", "Expression", sizeof(void *), 0xF000F000, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "conversion", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "isWatchable", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "isDBProp", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ClassDef", 0, sizeof(struct ClassDef), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_ClassDef = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ClassDef", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ClassDef", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ClassDefType", 4, 4, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "decl", "Declaration", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "function", "ClassFunction", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "defProperties", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "propertyDef", "PropertyDef", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "propertyWatch", "PropertyWatch", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "designer", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "defaultProperty", "Identifier", sizeof(void *), 0xF000F000, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "id", "Identifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "initializer", "Initializer", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "memberAccess", "ecere::com::AccessMode", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "object", "void *", sizeof(void *), 0xF000F000, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "TopoEdge", 0, sizeof(struct TopoEdge), 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_TopoEdge = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "in", "ecere::com::LinkElement<TopoEdge>", sizeof(struct __ecereNameSpace__ecere__com__LinkElement), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "out", "ecere::com::LinkElement<TopoEdge>", sizeof(struct __ecereNameSpace__ecere__com__LinkElement), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, (((void *)0)), (((void *)0)), 0, sizeof(void *) > 4 ? sizeof(void *) : 4, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "ExternalType", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_ExternalType = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "functionExternal", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "declarationExternal", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classExternal", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "importExternal", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "nameSpaceExternal", 4);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "dbtableExternal", 5);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "pragmaExternal", 6);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "External", 0, sizeof(struct External), 0, (void *)__ecereConstructor_External, (void *)__ecereDestructor_External, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_External = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CreateEdge", "void CreateEdge(External from, bool soft)", __ecereMethod_External_CreateEdge, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "CreateUniqueEdge", "void CreateUniqueEdge(External from, bool soft)", __ecereMethod_External_CreateUniqueEdge, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "ForwardDeclare", "External ForwardDeclare()", __ecereMethod_External_ForwardDeclare, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "External", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "External", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "loc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "ExternalType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbol", "Symbol", sizeof(void *), 0xF000F000, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "function", "FunctionDefinition", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "_class", "ClassDefinition", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "declaration", "Declaration", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "importString", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "id", "Identifier", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "table", "DBTableDef", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "pragma", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "importType", "ecere::com::ImportType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "fwdDecl", "External", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "outgoing", "ecere::com::LinkList<TopoEdge, link = out>", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "incoming", "ecere::com::LinkList<TopoEdge, link = in>", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "nonBreakableIncoming", "int", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Context", 0, sizeof(struct Context), 0, (void *)__ecereConstructor_Context, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Context = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "parent", "Context", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "types", "ecere::sys::BinaryTree", sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "classes", "ecere::sys::BinaryTree", sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "symbols", "ecere::sys::BinaryTree", sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "structSymbols", "ecere::sys::BinaryTree", sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "nextID", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "simpleID", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "templateTypes", "ecere::sys::BinaryTree", sizeof(struct __ecereNameSpace__ecere__sys__BinaryTree), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "classDef", "ClassDefinition", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "templateTypesOnly", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "hasNameSpace", "bool", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Symbol", 0, sizeof(struct Symbol), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Symbol = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "string", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "parent", "Symbol", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "left", "Symbol", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "right", "Symbol", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "depth", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "Type", sizeof(void *), 0xF000F000, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "method", "ecere::com::Method", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "_property", "ecere::com::Property", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "registered", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "notYetDeclared", "bool", 4, 4, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "pointerExternal", "External", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "structExternal", "External", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "externalGet", "External", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "externalSet", "External", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "externalPtr", "External", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "externalIsSet", "External", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "methodExternal", "External", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "methodCodeExternal", "External", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "imported", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declaredStructSym", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_class", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declaredStruct", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "needConstructor", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "needDestructor", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "constructorName", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "structName", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "className", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "destructorName", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "module", "ModuleImport", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "_import", "ClassImport", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "nameLoc", "Location", sizeof(struct Location), 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isParam", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isRemote", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isStruct", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "fireWatchersDone", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declaring", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "classData", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isStatic", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "shortName", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "templateParams", "ecere::sys::OldList *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "templatedClasses", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "ctx", "Context", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isIterator", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "propCategory", "Expression", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "mustRegister", "bool", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ClassImport", 0, sizeof(struct ClassImport), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_ClassImport = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ClassImport", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ClassImport", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "methods", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "properties", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "itself", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isRemote", "int", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "FunctionImport", 0, sizeof(struct FunctionImport), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_FunctionImport = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "FunctionImport", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "FunctionImport", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", sizeof(void *), 0xF000F000, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ModuleImport", 0, sizeof(struct ModuleImport), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_ModuleImport = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "ModuleImport", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "ModuleImport", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "classes", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "functions", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "importType", "ecere::com::ImportType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "importAccess", "ecere::com::AccessMode", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "PropertyImport", 0, sizeof(struct PropertyImport), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_PropertyImport = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "PropertyImport", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "PropertyImport", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isVirtual", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "hasSet", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "hasGet", "bool", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "MethodImport", 0, sizeof(struct MethodImport), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_MethodImport = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "MethodImport", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "MethodImport", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isVirtual", "bool", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(4, "TypeKind", 0, 0, 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_TypeKind = class;
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "voidType", 0);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "charType", 1);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "shortType", 2);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "intType", 3);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "int64Type", 4);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "longType", 5);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "floatType", 6);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "doubleType", 7);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "classType", 8);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "structType", 9);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "unionType", 10);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "functionType", 11);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "arrayType", 12);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "pointerType", 13);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "ellipsisType", 14);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "enumType", 15);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "methodType", 16);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "vaListType", 17);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "dummyType", 18);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "subClassType", 19);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "templateType", 20);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "thisClassType", 21);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "intPtrType", 22);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "intSizeType", 23);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "_BoolType", 24);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "int128Type", 25);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(class, "float128Type", 26);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Type", 0, sizeof(struct Type), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Type = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnFree", 0, __ecereMethod_Type_OnFree, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnGetString", 0, __ecereMethod_Type_OnGetString, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "prev", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "next", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "refCount", "int", 4, 4, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "_class", "Symbol", sizeof(void *), 0xF000F000, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "members", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "enumName", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "returnType", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "params", "ecere::sys::OldList", sizeof(struct __ecereNameSpace__ecere__sys__OldList), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "thisClass", "Symbol", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "staticMethod", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "thisClassTemplate", "TemplateParameter", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "method", "ecere::com::Method", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "methodClass", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "usedClass", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember1 = __ecereNameSpace__ecere__com__eMember_New(2, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "arrayType", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "arraySize", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "arraySizeExp", "Expression", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "freeExp", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember1, "enumClass", "Symbol", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddMember(dataMember0, dataMember1);
}
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "type", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "templateParameter", "TemplateParameter", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "kind", "TypeKind", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "size", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "name", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "typeName", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "thisClassFrom", "ecere::com::Class", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "promotedFrom", "TypeKind", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "classObjectType", "ClassObjectType", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "alignment", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "offset", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "bitFieldCount", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "count", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "bitMemberSize", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isSigned", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "constant", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "truth", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "byReference", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "extraParam", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "directClassAccess", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "computing", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "keepCast", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "passAsTemplate", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dllExport", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "attrStdcall", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "declaredWithStruct", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "typedByReference", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "casted", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "pointerAlignment", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isLong", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "signedBeforePromotion", "bool:1", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isVector", "bool:1", 4, 4, 1);
__ecerePropM_Type_specConst = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "specConst", "bool", 0, __ecereProp_Type_Get_specConst, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp_Type_specConst = __ecerePropM_Type_specConst, __ecerePropM_Type_specConst = (void *)0;
__ecerePropM_Type_isPointerTypeSize = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "isPointerTypeSize", "bool", 0, __ecereProp_Type_Get_isPointerTypeSize, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp_Type_isPointerTypeSize = __ecerePropM_Type_isPointerTypeSize, __ecerePropM_Type_isPointerTypeSize = (void *)0;
__ecerePropM_Type_isPointerType = __ecereNameSpace__ecere__com__eClass_AddProperty(class, "isPointerType", "bool", 0, __ecereProp_Type_Get_isPointerType, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
__ecereProp_Type_isPointerType = __ecerePropM_Type_isPointerType, __ecerePropM_Type_isPointerType = (void *)0;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "Operand", 0, sizeof(struct Operand), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Operand = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "kind", "TypeKind", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "type", "Type", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "ptrSize", "uint", 4, 4, 1);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember0 = __ecereNameSpace__ecere__com__eMember_New(1, 1);

__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "c", "char", 1, 1, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "uc", "byte", 1, 1, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "s", "short", 2, 2, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "us", "uint16", 2, 2, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "i", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "ui", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "f", "float", 4, 4, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "d", "double", 8, 8, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "i64", "int64", 8, 8, 1);
__ecereNameSpace__ecere__com__eMember_AddDataMember(dataMember0, "ui64", "uint64", 8, 8, 1);
__ecereNameSpace__ecere__com__eClass_AddMember(class, dataMember0);
}
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "ops", "OpTable", sizeof(struct OpTable), 8, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "OpTable", 0, sizeof(struct OpTable), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_OpTable = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Add", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Sub", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Mul", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Div", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Mod", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Neg", "bool (*)(Expression, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Inc", "bool (*)(Expression, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Dec", "bool (*)(Expression, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Asign", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "AddAsign", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "SubAsign", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "MulAsign", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "DivAsign", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "ModAsign", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "BitAnd", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "BitOr", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "BitXor", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "LShift", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "RShift", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "BitNot", "bool (*)(Expression, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "AndAsign", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "OrAsign", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "XorAsign", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "LShiftAsign", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "RShiftAsign", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Not", "bool (*)(Expression, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Equ", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Nqu", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "And", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Or", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Grt", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Sma", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "GrtEqu", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "SmaEqu", "bool (*)(Expression, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "Cond", "bool (*)(Expression, Operand, Operand, Operand)", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterDefine("MAX_INCLUDE_DEPTH", "30", module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("Compiler_Error", "void Compiler_Error(const char * format, ...)", Compiler_Error, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetNumWarnings", "int GetNumWarnings(void)", GetNumWarnings, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("Compiler_Warning", "void Compiler_Warning(const char * format, ...)", Compiler_Warning, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("yyerror", "int yyerror(void)", yyerror, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetHostBits", "int GetHostBits(void)", GetHostBits, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetRuntimeBits", "int GetRuntimeBits(void)", GetRuntimeBits, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetTargetPlatform", "void SetTargetPlatform(ecere::com::Platform platform)", SetTargetPlatform, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetTargetBits", "void SetTargetBits(int bits)", SetTargetBits, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetTargetBits", "int GetTargetBits(void)", GetTargetBits, module, 1);
}

