/* Code generated from eC source file: pass15.ec */
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
extern int yydebug;

enum yytokentype
{
IDENTIFIER = 258, CONSTANT = 259, STRING_LITERAL = 260, SIZEOF = 261, PTR_OP = 262, INC_OP = 263, DEC_OP = 264, LEFT_OP = 265, RIGHT_OP = 266, LE_OP = 267, GE_OP = 268, EQ_OP = 269, NE_OP = 270, AND_OP = 271, OR_OP = 272, MUL_ASSIGN = 273, DIV_ASSIGN = 274, MOD_ASSIGN = 275, ADD_ASSIGN = 276, SUB_ASSIGN = 277, LEFT_ASSIGN = 278, RIGHT_ASSIGN = 279, AND_ASSIGN = 280, XOR_ASSIGN = 281, OR_ASSIGN = 282, TYPE_NAME = 283, TYPEDEF = 284, EXTERN = 285, STATIC = 286, AUTO = 287, REGISTER = 288, CHAR = 289, SHORT = 290, INT = 291, UINT = 292, INT64 = 293, INT128 = 294, FLOAT128 = 295, LONG = 296, SIGNED = 297, UNSIGNED = 298, FLOAT = 299, DOUBLE = 300, CONST = 301, VOLATILE = 302, VOID = 303, VALIST = 304, STRUCT = 305, UNION = 306, ENUM = 307, ELLIPSIS = 308, CASE = 309, DEFAULT = 310, IF = 311, SWITCH = 312, WHILE = 313, DO = 314, FOR = 315, GOTO = 316, CONTINUE = 317, BREAK = 318, RETURN = 319, IFX = 320, ELSE = 321, CLASS = 322, THISCLASS = 323, PROPERTY = 324, SETPROP = 325, GETPROP = 326, NEWOP = 327, RENEW = 328, DELETE = 329, EXT_DECL = 330, EXT_STORAGE = 331, IMPORT = 332, DEFINE = 333, VIRTUAL = 334, ATTRIB = 335, PUBLIC = 336, PRIVATE = 337, TYPED_OBJECT = 338, ANY_OBJECT = 339, _INCREF = 340, EXTENSION = 341, ASM = 342, TYPEOF = 343, WATCH = 344, STOPWATCHING = 345, FIREWATCHERS = 346, WATCHABLE = 347, CLASS_DESIGNER = 348, CLASS_NO_EXPANSION = 349, CLASS_FIXED = 350, ISPROPSET = 351, CLASS_DEFAULT_PROPERTY = 352, PROPERTY_CATEGORY = 353, CLASS_DATA = 354, CLASS_PROPERTY = 355, SUBCLASS = 356, NAMESPACE = 357, NEW0OP = 358, RENEW0 = 359, VAARG = 360, DBTABLE = 361, DBFIELD = 362, DBINDEX = 363, DATABASE_OPEN = 364, ALIGNOF = 365, ATTRIB_DEP = 366, __ATTRIB = 367, BOOL = 368, _BOOL = 369, _COMPLEX = 370, _IMAGINARY = 371, RESTRICT = 372, THREAD = 373, WIDE_STRING_LITERAL = 374, BUILTIN_OFFSETOF = 375, PRAGMA = 376, STATIC_ASSERT = 377
};

int yyparse(void);

extern int returnCode;

extern int yydebug;

extern unsigned int echoOn;

void resetScanner();

int propWatcherID;

int expression_yyparse();

static char * thisNameSpace;

unsigned int thisClassParams = 1;

unsigned int internalValueCounter;

extern unsigned int outputLineNumbers;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp_float_isInf;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp_float_signBit;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp_float_isNan;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp_double_isInf;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp_double_signBit;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp_double_isNan;

extern int targetBits;

extern unsigned int inCompiler;

extern unsigned int inPreCompiler;

extern unsigned int inDebugger;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_next;

extern unsigned int inBGen;

char * OffsetEscapedString(char * s, int len, int offset)
{
char ch;
int j = 0, k = 0;

while(j < len && k < offset && (ch = s[j]))
{
if(ch == '\\')
++j;
j++, k++;
}
return (k == offset) ? s + j : (((void *)0));
}

extern int __ecereVMethodID_class_OnGetString;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp_Type_isPointerType;

extern const char *  (*  bgenSymbolSwap)(const char *  symbol, unsigned int reduce, unsigned int macro);

extern unsigned int parseError;

static int definedExpStackPos;

static void * definedExpStack[512];

extern const char *  sourceFile;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp_Type_specConst;

unsigned int reachedPass15;

extern unsigned int memoryGuard;

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

struct Pointer;

struct Attrib;

struct Attribute;

struct TemplateArgument;

struct DBTableEntry;

struct DBIndexItem;

struct DBTableDef;

struct CodePosition
{
int line;
int charPos;
int pos;
int included;
} ecere_gcc_struct;

extern size_t strlen(const char * );

extern int strcmp(const char * , const char * );

extern int sprintf(char * , const char * , ...);

extern char *  strcat(char * , const char * );

extern char *  __ecereNameSpace__ecere__sys__CopyString(const char *  string);

extern int isprint(int c);

extern char *  strcpy(char * , const char * );

extern void Compiler_Error(const char *  format, ...);

extern const char *  __ecereNameSpace__ecere__GetTranslatedString(const char * name, const char *  string, const char *  stringAndContext);

struct __ecereNameSpace__ecere__com__LinkList
{
void * first;
void * last;
int count;
} ecere_gcc_struct;

extern char *  strchr(const char * , int);

extern void FullClassNameCat(char *  output, const char *  className, unsigned int includeTemplateParams);

extern void *  memcpy(void * , const void * , size_t size);

extern void __ecereNameSpace__ecere__sys__ChangeCh(char *  string, char ch1, char ch2);

extern void Compiler_Warning(const char *  format, ...);

extern unsigned long strtoul(const char *  nptr, char * *  endptr, int base);

extern long long strtoll(const char *  nptr, char * *  endptr, int base);

extern uint64 strtoull(const char *  nptr, char * *  endptr, int base);

extern int __ecereNameSpace__ecere__sys__UnescapeCString(char *  d, const char *  s, int len);

extern int strtol(const char * , char * * , int base);

extern long long __ecereNameSpace__ecere__com___strtoi64(const char *  string, const char * *  endString, int base);

extern uint64 __ecereNameSpace__ecere__com___strtoui64(const char *  string, const char * *  endString, int base);

extern double strtod(const char * , char * * );

extern int strcasecmp(const char * , const char * );

extern int strncmp(const char * , const char * , size_t n);

extern char *  __ecereNameSpace__ecere__sys__RSearchString(const char *  buffer, const char *  subStr, int maxLen, unsigned int matchCase, unsigned int matchWord);

extern char *  QMkString(const char *  source);

extern char *  strncpy(char * , const char * , size_t n);

extern int printf(const char * , ...);

extern char *  strstr(const char * , const char * );

extern unsigned int __ecereNameSpace__ecere__sys__UTF8GetChar(const char *  string, int *  numBytes);

extern unsigned int (* __ecereProp_float_Get_isInf)(float this);

extern int (* __ecereProp_float_Get_signBit)(float this);

extern unsigned int (* __ecereProp_float_Get_isNan)(float this);

extern unsigned int (* __ecereProp_double_Get_isInf)(double this);

extern int (* __ecereProp_double_Get_signBit)(double this);

extern unsigned int (* __ecereProp_double_Get_isNan)(double this);

extern float (* __ecereMethod_float_inf)(void);

extern float (* __ecereMethod_float_nan)(void);

extern double (* __ecereMethod_double_inf)(void);

extern double (* __ecereMethod_double_nan)(void);

extern int __ecereVMethodID_class_OnGetString;

void SetYydebug(unsigned int b)
{
yydebug = b;
}

unsigned int GetParseError()
{
return parseError;
}

extern struct __ecereNameSpace__ecere__sys__OldList * ast;

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern struct __ecereNameSpace__ecere__sys__OldList *  MkListOne(void *  item);

extern void ListAdd(struct __ecereNameSpace__ecere__sys__OldList * list, void *  item);

extern void FreeList(struct __ecereNameSpace__ecere__sys__OldList * list, void (*  FreeFunction)(void * ));

struct __ecereNameSpace__ecere__com__EnumClassData
{
struct __ecereNameSpace__ecere__sys__OldList values;
long long largest;
} ecere_gcc_struct;

extern struct __ecereNameSpace__ecere__sys__OldList *  CopyList(struct __ecereNameSpace__ecere__sys__OldList *  source, void *  (*  CopyFunction)(void * ));

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(struct __ecereNameSpace__ecere__sys__OldList * this, void *  prevItem, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(struct __ecereNameSpace__ecere__sys__OldList * this, void (*  freeFn)(void * ));

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear(struct __ecereNameSpace__ecere__sys__OldList * this);

extern struct Pointer * MkPointer(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Pointer * pointer);

extern struct Attrib * MkAttrib(int type, struct __ecereNameSpace__ecere__sys__OldList *  attribs);

struct Location
{
struct CodePosition start;
struct CodePosition end;
} ecere_gcc_struct;

void ReadString(char * output, char * string)
{
int len = strlen(string);
int c, d = 0;
unsigned int quoted = 0, escaped = 0;

for(c = 0; c < len; c++)
{
char ch = string[c];

if(escaped)
{
switch(ch)
{
case 'n':
output[d] = '\n';
break;
case 't':
output[d] = '\t';
break;
case 'a':
output[d] = '\a';
break;
case 'b':
output[d] = '\b';
break;
case 'f':
output[d] = '\f';
break;
case 'r':
output[d] = '\r';
break;
case 'v':
output[d] = '\v';
break;
case '\\':
output[d] = '\\';
break;
case '\"':
output[d] = '\"';
break;
case '\'':
output[d] = '\'';
break;
default:
output[d] = ch;
}
d++;
escaped = 0;
}
else
{
if(ch == '\"')
quoted ^= 1;
else if(quoted)
{
if(ch == '\\')
escaped = 1;
else
output[d++] = ch;
}
}
}
output[d] = '\0';
}

char * PrintInt(long long result)
{
char temp[100];

if(result > (((int)0x7fffffff)))
sprintf(temp, ((__runtimePlatform == 1) ? "0x%I64X" : "0x%llX"), result);
else
sprintf(temp, ((__runtimePlatform == 1) ? "%I64d" : "%lld"), result);
if(result > (((int)0x7fffffff)) || result < (((int)0x80000000)))
strcat(temp, "LL");
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintUInt(uint64 result)
{
char temp[100];

if(result > (0xffffffff))
sprintf(temp, ((__runtimePlatform == 1) ? "0x%I64XLL" : "0x%llXLL"), result);
else if(result > (((int)0x7fffffff)))
sprintf(temp, ((__runtimePlatform == 1) ? "0x%I64X" : "0x%llX"), result);
else
sprintf(temp, ((__runtimePlatform == 1) ? "%I64d" : "%lld"), result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintInt64(long long result)
{
char temp[100];

if(result > (((int)0x7fffffff)) || result < (((int)0x80000000)))
sprintf(temp, ((__runtimePlatform == 1) ? "%I64dLL" : "%lldLL"), result);
else
sprintf(temp, ((__runtimePlatform == 1) ? "%I64d" : "%lld"), result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintUInt64(uint64 result)
{
char temp[100];

if(result > (0xffffffff))
sprintf(temp, ((__runtimePlatform == 1) ? "0x%I64XLL" : "0x%llXLL"), result);
else if(result > (((int)0x7fffffff)))
sprintf(temp, ((__runtimePlatform == 1) ? "0x%I64X" : "0x%llX"), result);
else
sprintf(temp, ((__runtimePlatform == 1) ? "%I64d" : "%lld"), result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintHexUInt(uint64 result)
{
char temp[100];

if(result > (0xffffffff))
sprintf(temp, ((__runtimePlatform == 1) ? "0x%I64X" : "0x%llX"), result);
else
sprintf(temp, ((__runtimePlatform == 1) ? "0x%I64X" : "0x%llX"), result);
if(result > (0xffffffff))
strcat(temp, "LL");
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintHexUInt64(uint64 result)
{
char temp[100];

if(result > (0xffffffff))
sprintf(temp, ((__runtimePlatform == 1) ? "0x%I64XLL" : "0x%llXLL"), result);
else
sprintf(temp, ((__runtimePlatform == 1) ? "0x%I64X" : "0x%llX"), result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintShort(short result)
{
char temp[100];

sprintf(temp, "%d", (unsigned short)result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintUShort(unsigned short result)
{
char temp[100];

if(result > 32767)
sprintf(temp, "0x%X", (int)result);
else
sprintf(temp, "%d", (int)result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintUChar(unsigned char result)
{
char temp[100];

sprintf(temp, "0x%X", result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintChar(char result)
{
char temp[100];

if(result > 0 && isprint(result))
sprintf(temp, "'%c'", result);
else if(result < 0)
sprintf(temp, "%d", (int)result);
else
sprintf(temp, "0x%X", (unsigned char)result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

int UnescapeString(char * d, char * s, int len)
{
return __ecereNameSpace__ecere__sys__UnescapeCString(d, s, len);
}

char * PrintFloat(float result)
{
char temp[350];

if(__ecereProp_float_Get_isInf(result))
{
if(__ecereProp_float_Get_signBit(result))
strcpy(temp, "-inf");
else
strcpy(temp, "inf");
}
else if(__ecereProp_float_Get_isNan(result))
{
if(__ecereProp_float_Get_signBit(result))
strcpy(temp, "-nan");
else
strcpy(temp, "nan");
}
else
sprintf(temp, "%.16ff", result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintDouble(double result)
{
char temp[350];

if(__ecereProp_double_Get_isInf(result))
{
if(__ecereProp_double_Get_signBit(result))
strcpy(temp, "-inf");
else
strcpy(temp, "inf");
}
else if(__ecereProp_double_Get_isNan(result))
{
if(__ecereProp_double_Get_signBit(result))
strcpy(temp, "-nan");
else
strcpy(temp, "nan");
}
else
sprintf(temp, "%.16f", result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

extern struct Location yylloc;

struct ExtDecl
{
struct Location loc;
int type;
union
{
char * s;
struct Attrib * attr;
struct __ecereNameSpace__ecere__sys__OldList *  multiAttr;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

extern struct ExtDecl * MkExtDeclAttrib(struct Attrib * attr);

struct Expression;

extern struct Expression * parsedExpression;

extern struct Expression * QMkExpId(const char *  id);

extern struct Expression * MkExpOp(struct Expression * exp1, int op, struct Expression * exp2);

void ComputeExpression(struct Expression * exp);

extern struct Expression * MkExpConstant(const char *  string);

extern struct Attribute * MkAttribute(char * attr, struct Expression * exp);

extern void FreeExpression(struct Expression * exp);

extern void FreeExpContents(struct Expression * exp);

extern struct Expression * GetNonBracketsExp(struct Expression * exp);

extern struct Expression * CopyExpression(struct Expression * exp);

extern struct Expression * MkExpBrackets(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern struct Expression * MkExpCall(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * arguments);

extern struct Expression * MkExpCondition(struct Expression * cond, struct __ecereNameSpace__ecere__sys__OldList * expressions, struct Expression * elseExp);

extern struct Expression * MoveExpContents(struct Expression * exp);

extern struct Expression * QBrackets(struct Expression * exp);

extern struct Expression * QMkExpCond(struct Expression * cond, struct Expression * exp, struct Expression * elseExp);

struct Statement;

static struct Statement * curCompound;

extern struct Statement * MkCompoundStmt(struct __ecereNameSpace__ecere__sys__OldList * declarations, struct __ecereNameSpace__ecere__sys__OldList * statements);

extern struct Statement * MkExpressionStmt(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern struct Statement * MkIfStmt(struct __ecereNameSpace__ecere__sys__OldList * exp, struct Statement * statement, struct Statement * elseStmt);

extern struct Statement * MkForStmt(struct Statement * init, struct Statement * check, struct __ecereNameSpace__ecere__sys__OldList * inc, struct Statement * statement);

extern struct Statement * MkWhileStmt(struct __ecereNameSpace__ecere__sys__OldList * exp, struct Statement * statement);

extern struct Statement * MkFireWatchersStmt(struct Expression * object, struct __ecereNameSpace__ecere__sys__OldList * watches);

struct External;

struct External * curExternal, * afterExternal;

extern void FreeExternal(struct External * external);

struct Type;

static struct Type * curSwitchType;

extern struct Type * ProcessTypeString(const char *  string, unsigned int staticMethod);

extern void FreeType(struct Type * type);

extern void CopyTypeInto(struct Type * type, struct Type * src);

extern struct Type * MkClassType(const char *  name);

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} ecere_gcc_struct;

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

static struct __ecereNameSpace__ecere__com__Class * currentClass;

struct __ecereNameSpace__ecere__com__Class * thisClass;

struct __ecereNameSpace__ecere__com__Class * containerClass;

extern unsigned int __ecereNameSpace__ecere__com__eClass_IsDerived(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class * from);

extern struct Expression * GetTemplateArgExpByName(const char *  paramName, struct __ecereNameSpace__ecere__com__Class * thisClassFrom, struct __ecereNameSpace__ecere__com__Class * curClass, int tplType);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

extern void OutputExpression(struct Expression * exp, struct __ecereNameSpace__ecere__com__Instance * f);

extern struct __ecereNameSpace__ecere__com__Instance * fileInput;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

extern int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

void SetThisClass(struct __ecereNameSpace__ecere__com__Class * c)
{
thisClass = c;
}

struct __ecereNameSpace__ecere__com__Class * GetThisClass()
{
return thisClass;
}

struct Context;

extern struct Context * curContext;

extern struct Context * topContext;

extern struct Context * PushContext(void);

extern void PopContext(struct Context * ctx);

extern void FreeContext(struct Context * context);

extern struct Context * globalContext;

struct ModuleImport;

extern struct ModuleImport * mainModule;

struct ModuleImport
{
struct ModuleImport * prev;
struct ModuleImport * next;
char *  name;
struct __ecereNameSpace__ecere__sys__OldList classes;
struct __ecereNameSpace__ecere__sys__OldList functions;
int importType;
int importAccess;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__NameSpace;

extern struct __ecereNameSpace__ecere__com__NameSpace *  globalData;

struct FunctionDefinition;

static struct FunctionDefinition * curFunction;

struct __ecereNameSpace__ecere__sys__BTNode;

struct __ecereNameSpace__ecere__sys__BTNode
{
uintptr_t key;
struct __ecereNameSpace__ecere__sys__BTNode * parent;
struct __ecereNameSpace__ecere__sys__BTNode * left;
struct __ecereNameSpace__ecere__sys__BTNode * right;
int depth;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(struct __ecereNameSpace__ecere__sys__BTNode * this);

struct Identifier;

extern void FreeIdentifier(struct Identifier * id);

extern struct Identifier * MkIdentifier(const char *  string);

extern struct Expression * MkExpIdentifier(struct Identifier * id);

extern struct Expression * MkExpMember(struct Expression * expression, struct Identifier * member);

extern struct Identifier * CopyIdentifier(struct Identifier * id);

extern struct Expression * MkExpPointer(struct Expression * expression, struct Identifier * member);

struct __ecereNameSpace__ecere__sys__OldLink;

struct __ecereNameSpace__ecere__sys__OldLink
{
struct __ecereNameSpace__ecere__sys__OldLink * prev;
struct __ecereNameSpace__ecere__sys__OldLink * next;
void *  data;
} ecere_gcc_struct;

struct Declaration;

extern struct External * MkExternalDeclaration(struct Declaration * declaration);

extern struct Declaration * MkDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators);

struct Specifier;

extern struct Declaration * MkStructDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * declarators, struct Specifier * extStorage);

extern struct Specifier * MkStructOrUnion(int type, struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * definitions);

extern struct Specifier * MkSpecifier(int specifier);

extern struct Specifier * MkSpecifierName(const char *  name);

extern struct Specifier * MkSpecifierExtended(struct ExtDecl * extDecl);

extern void FreeSpecifier(struct Specifier * spec);

extern struct Specifier * MkEnum(struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * list);

struct Statement
{
struct Statement * prev;
struct Statement * next;
struct Location loc;
int type;
union
{
struct __ecereNameSpace__ecere__sys__OldList *  expressions;
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
struct Expression * watcher;
struct Expression * object;
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

extern struct Specifier * CopySpecifier(struct Specifier * spec);

extern struct Expression * MkExpClassSize(struct Specifier * _class);

struct Symbol;

struct Identifier
{
struct Identifier * prev;
struct Identifier * next;
struct Location loc;
struct Symbol * classSym;
struct Specifier * _class;
char *  string;
struct Identifier * badID;
} ecere_gcc_struct;

extern struct Symbol * FindStruct(struct Context * ctx, const char *  name);

extern struct Symbol * FindClass(const char *  name);

extern void DeclareClass(struct External * neededFor, struct Symbol * classSym, const char *  className);

extern struct Symbol * FindType(struct Context * ctx, const char *  name);

extern void FreeSymbol(struct Symbol * symbol);

struct ClassDef;

extern struct ClassDef * MkClassDefDeclaration(struct Declaration * decl);

extern void FreeClassDef(struct ClassDef * def);

struct Declarator;

extern struct Type * ProcessType(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

struct TemplateDatatype
{
struct __ecereNameSpace__ecere__sys__OldList *  specifiers;
struct Declarator * decl;
} ecere_gcc_struct;

extern struct Declarator * SpecDeclFromString(const char *  string, struct __ecereNameSpace__ecere__sys__OldList *  specs, struct Declarator * baseDecl);

extern struct Declarator * MkDeclaratorPointer(struct Pointer * pointer, struct Declarator * declarator);

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

extern struct Declarator * MkStructDeclarator(struct Declarator * declarator, struct Expression * exp);

extern struct Declarator * MkDeclaratorArray(struct Declarator * declarator, struct Expression * exp);

struct Declarator
{
struct Declarator * prev;
struct Declarator * next;
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

extern struct Identifier * GetDeclId(struct Declarator * decl);

extern struct Declarator * MkDeclaratorBrackets(struct Declarator * declarator);

extern struct Declarator * PlugDeclarator(struct Declarator * decl, struct Declarator * baseDecl);

extern struct Declarator * MkDeclaratorFunction(struct Declarator * declarator, struct __ecereNameSpace__ecere__sys__OldList * parameters);

extern void FreeDeclarator(struct Declarator * decl);

extern struct Declarator * GetFuncDecl(struct Declarator * decl);

extern struct Expression * MkExpClass(struct __ecereNameSpace__ecere__sys__OldList *  specifiers, struct Declarator * decl);

extern struct Declarator * CopyDeclarator(struct Declarator * declarator);

struct FunctionDefinition
{
struct FunctionDefinition * prev;
struct FunctionDefinition * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList *  specifiers;
struct Declarator * declarator;
struct __ecereNameSpace__ecere__sys__OldList *  declarations;
struct Statement * body;
struct __ecereNameSpace__ecere__com__Class * _class;
struct __ecereNameSpace__ecere__sys__OldList attached;
int declMode;
struct Type * type;
struct Symbol * propSet;
int tempCount;
unsigned int propertyNoThis;
} ecere_gcc_struct;

extern struct Declarator * QMkPtrDecl(const char *  id);

struct ClassFunction;

struct ClassFunction
{
struct ClassFunction * prev;
struct ClassFunction * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList *  specifiers;
struct Declarator * declarator;
struct __ecereNameSpace__ecere__sys__OldList *  declarations;
struct Statement * body;
struct __ecereNameSpace__ecere__com__Class * _class;
struct __ecereNameSpace__ecere__sys__OldList attached;
int declMode;
struct Type * type;
struct Symbol * propSet;
unsigned int isVirtual;
unsigned int isConstructor;
unsigned int isDestructor;
unsigned int dontMangle;
int id;
int idCode;
} ecere_gcc_struct;

extern struct External * ProcessClassFunction(struct __ecereNameSpace__ecere__com__Class * owningClass, struct ClassFunction * func, struct __ecereNameSpace__ecere__sys__OldList * defs, struct External * after, unsigned int makeStatic);

extern void FreeClassFunction(struct ClassFunction * func);

extern struct ClassFunction * MkClassFunction(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct Specifier * _class, struct Declarator * decl, struct __ecereNameSpace__ecere__sys__OldList * declList);

extern void ProcessClassFunctionBody(struct ClassFunction * func, struct Statement * body);

struct TypeName;

extern struct Expression * MkExpCast(struct TypeName * typeName, struct Expression * expression);

extern struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator);

struct TypeName
{
struct TypeName * prev;
struct TypeName * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList *  qualifiers;
struct Declarator * declarator;
int classObjectType;
struct Expression * bitCount;
} ecere_gcc_struct;

extern void FreeTypeName(struct TypeName * typeName);

extern struct TypeName * QMkClass(const char *  spec, struct Declarator * decl);

extern struct Expression * MkExpTypeSize(struct TypeName * typeName);

extern unsigned int IsVoidPtrCast(struct TypeName * typeName);

extern struct TypeName * QMkType(const char *  spec, struct Declarator * decl);

struct __ecereNameSpace__ecere__com__BTNamedLink;

struct __ecereNameSpace__ecere__com__BTNamedLink
{
const char *  name;
struct __ecereNameSpace__ecere__com__BTNamedLink * parent;
struct __ecereNameSpace__ecere__com__BTNamedLink * left;
struct __ecereNameSpace__ecere__com__BTNamedLink * right;
int depth;
void *  data;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__sys__NamedLink64;

struct __ecereNameSpace__ecere__sys__NamedLink64
{
struct __ecereNameSpace__ecere__sys__NamedLink64 * prev;
struct __ecereNameSpace__ecere__sys__NamedLink64 * next;
char *  name;
long long data;
} ecere_gcc_struct;

struct Instantiation;

struct Declaration
{
struct Declaration * prev;
struct Declaration * next;
struct Location loc;
int type;
union
{
struct
{
struct __ecereNameSpace__ecere__sys__OldList *  specifiers;
struct __ecereNameSpace__ecere__sys__OldList *  declarators;
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

struct Instantiation
{
struct Instantiation * prev;
struct Instantiation * next;
struct Location loc;
struct Specifier * _class;
struct Expression * exp;
struct __ecereNameSpace__ecere__sys__OldList *  members;
struct Symbol * symbol;
unsigned int fullSet;
unsigned int isConstant;
unsigned char *  data;
struct Location nameLoc;
struct Location insideLoc;
unsigned int built;
} ecere_gcc_struct;

extern void FreeInstance(struct Instantiation * inst);

extern struct Declaration * MkDeclarationInst(struct Instantiation * inst);

extern struct Instantiation * MkInstantiationNamed(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Expression * exp, struct __ecereNameSpace__ecere__sys__OldList * members);

struct InitDeclarator;

extern void FreeInitDeclarator(struct InitDeclarator * decl);

struct PropertyWatch;

struct PropertyWatch
{
struct PropertyWatch * prev;
struct PropertyWatch * next;
struct Location loc;
struct Statement * compound;
struct __ecereNameSpace__ecere__sys__OldList *  properties;
unsigned int deleteWatch;
} ecere_gcc_struct;

extern void FreePropertyWatch(struct PropertyWatch * watcher);

struct PropertyImport;

struct PropertyImport
{
struct PropertyImport * prev;
struct PropertyImport * next;
char *  name;
unsigned int isVirtual;
unsigned int hasSet;
unsigned int hasGet;
} ecere_gcc_struct;

struct MethodImport;

struct MethodImport
{
struct MethodImport * prev;
struct MethodImport * next;
char *  name;
unsigned int isVirtual;
} ecere_gcc_struct;

struct FunctionImport;

struct FunctionImport
{
struct FunctionImport * prev;
struct FunctionImport * next;
char *  name;
} ecere_gcc_struct;

struct ClassImport;

struct ClassImport
{
struct ClassImport * prev;
struct ClassImport * next;
char *  name;
struct __ecereNameSpace__ecere__sys__OldList methods;
struct __ecereNameSpace__ecere__sys__OldList properties;
unsigned int itself;
int isRemote;
} ecere_gcc_struct;

struct Initializer;

struct Expression
{
struct Expression * prev;
struct Expression * next;
struct Location loc;
int type;
union
{
struct
{
char *  constant;
struct Identifier * identifier;
} ecere_gcc_struct __anon1;
struct Statement * compound;
struct Instantiation * instance;
struct
{
char *  string;
unsigned int intlString;
unsigned int wideString;
} ecere_gcc_struct __anon2;
struct __ecereNameSpace__ecere__sys__OldList *  list;
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
struct Expression * exp1;
struct Expression * exp2;
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

extern struct InitDeclarator * MkInitDeclarator(struct Declarator * declarator, struct Initializer * initializer);

struct Initializer
{
struct Initializer * prev;
struct Initializer * next;
struct Location loc;
int type;
union
{
struct Expression * exp;
struct __ecereNameSpace__ecere__sys__OldList *  list;
} ecere_gcc_struct __anon1;
unsigned int isConstant;
struct Identifier * id;
} ecere_gcc_struct;

extern struct Initializer * MkInitializerAssignment(struct Expression * exp);

extern struct Expression * MkExpExtensionInitializer(struct TypeName * typeName, struct Initializer * initializer);

extern struct Initializer * MkInitializerList(struct __ecereNameSpace__ecere__sys__OldList * list);

struct InitDeclarator
{
struct InitDeclarator * prev;
struct InitDeclarator * next;
struct Location loc;
struct Declarator * declarator;
struct Initializer * initializer;
} ecere_gcc_struct;

void ApplyLocation(struct Expression * exp, struct Location * loc)
{
exp->loc = *loc;
switch(exp->type)
{
case 4:
if(exp->__anon1.op.exp1)
ApplyLocation(exp->__anon1.op.exp1, loc);
if(exp->__anon1.op.exp2)
ApplyLocation(exp->__anon1.op.exp2, loc);
break;
case 5:
if(exp->__anon1.list)
{
struct Expression * e;

for(e = (*exp->__anon1.list).first; e; e = e->next)
ApplyLocation(e, loc);
}
break;
case 6:
if(exp->__anon1.index.index)
{
struct Expression * e;

for(e = (*exp->__anon1.index.index).first; e; e = e->next)
ApplyLocation(e, loc);
}
if(exp->__anon1.index.exp)
ApplyLocation(exp->__anon1.index.exp, loc);
break;
case 7:
if(exp->__anon1.call.arguments)
{
struct Expression * arg;

for(arg = (*exp->__anon1.call.arguments).first; arg; arg = arg->next)
ApplyLocation(arg, loc);
}
if(exp->__anon1.call.exp)
ApplyLocation(exp->__anon1.call.exp, loc);
break;
case 8:
case 9:
if(exp->__anon1.member.exp)
ApplyLocation(exp->__anon1.member.exp, loc);
break;
case 11:
if(exp->__anon1.cast.exp)
ApplyLocation(exp->__anon1.cast.exp, loc);
break;
case 12:
if(exp->__anon1.cond.exp)
{
struct Expression * e;

for(e = (*exp->__anon1.cond.exp).first; e; e = e->next)
ApplyLocation(e, loc);
}
if(exp->__anon1.cond.cond)
ApplyLocation(exp->__anon1.cond.cond, loc);
if(exp->__anon1.cond.elseExp)
ApplyLocation(exp->__anon1.cond.elseExp, loc);
break;
case 34:
if(exp->__anon1.vaArg.exp)
ApplyLocation(exp->__anon1.vaArg.exp, loc);
break;
default:
break;
}
}

void __ecereMethod_Expression_Clear();

struct MembersInit;

struct MembersInit
{
struct MembersInit * prev;
struct MembersInit * next;
struct Location loc;
int type;
union
{
struct __ecereNameSpace__ecere__sys__OldList *  dataMembers;
struct ClassFunction * function;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

extern struct MembersInit * MkMembersInitList(struct __ecereNameSpace__ecere__sys__OldList * dataMembers);

struct Operand;

struct OpTable
{
unsigned int (*  Add)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  Sub)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  Mul)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  Div)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  Mod)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  Neg)(struct Expression *, struct Operand *);
unsigned int (*  Inc)(struct Expression *, struct Operand *);
unsigned int (*  Dec)(struct Expression *, struct Operand *);
unsigned int (*  Asign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  AddAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  SubAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  MulAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  DivAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  ModAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  BitAnd)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  BitOr)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  BitXor)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  LShift)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  RShift)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  BitNot)(struct Expression *, struct Operand *);
unsigned int (*  AndAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  OrAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  XorAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  LShiftAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  RShiftAsign)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  Not)(struct Expression *, struct Operand *);
unsigned int (*  Equ)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  Nqu)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  And)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  Or)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  Grt)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  Sma)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  GrtEqu)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  SmaEqu)(struct Expression *, struct Operand *, struct Operand *);
unsigned int (*  Cond)(struct Expression *, struct Operand *, struct Operand *, struct Operand *);
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

struct External *  _DeclareStruct(struct External *  neededBy, const char *  name, unsigned int skipNoHead, unsigned int needDereference, unsigned int fwdDecl);

struct External * DeclareStruct(struct External * neededBy, const char * name, unsigned int skipNoHead, unsigned int needDereference)
{
return _DeclareStruct(neededBy, name, skipNoHead, needDereference, 0);
}

static void _DeclareType(struct External *  neededFor, struct Type *  type, unsigned int needDereference, unsigned int forFunctionDef, unsigned int fwdDecl);

void DeclareType(struct External * neededFor, struct Type * type, unsigned int needDereference, unsigned int forFunctionDef)
{
_DeclareType(neededFor, type, needDereference, forFunctionDef, 0);
}

void DeclareTypeForwardDeclare(struct External * neededFor, struct Type * type, unsigned int needDereference, unsigned int forFunctionDef)
{
_DeclareType(neededFor, type, needDereference, forFunctionDef, 1);
}

struct Conversion;

static void _PrintType(struct Type *  type, char *  string, unsigned int printName, unsigned int fullName, unsigned int printConst);

void PrintType(struct Type * type, char * string, unsigned int printName, unsigned int fullName)
{
_PrintType(type, string, printName, fullName, 1);
}

void PrintTypeNoConst(struct Type * type, char * string, unsigned int printName, unsigned int fullName)
{
_PrintType(type, string, printName, fullName, 0);
}

struct __ecereNameSpace__ecere__com__DataMember;

extern void __ecereNameSpace__ecere__com__eClass_FindNextMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class **  curClass, struct __ecereNameSpace__ecere__com__DataMember **  curMember, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, unsigned int size, unsigned int alignment, int declMode);

struct __ecereNameSpace__ecere__com__Property;

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

extern void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

extern void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object);

extern void __ecereNameSpace__ecere__com__eInstance_Watch(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

struct Conversion
{
struct Conversion * prev, * next;
struct __ecereNameSpace__ecere__com__Property * convert;
unsigned int isGet;
struct Type * resultType;
} ecere_gcc_struct;

static void FreeConvert(struct Conversion * convert)
{
if(convert->resultType)
FreeType(convert->resultType);
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
struct Type * dataType;
int memberAccess;
} ecere_gcc_struct;

struct Symbol
{
char *  string;
struct Symbol * parent;
struct Symbol * left;
struct Symbol * right;
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
unsigned int imported;
unsigned int declaredStructSym;
struct __ecereNameSpace__ecere__com__Class * _class;
unsigned int declaredStruct;
unsigned int needConstructor;
unsigned int needDestructor;
char *  constructorName;
char *  structName;
char *  className;
char *  destructorName;
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
char *  shortName;
struct __ecereNameSpace__ecere__sys__OldList *  templateParams;
struct __ecereNameSpace__ecere__sys__OldList templatedClasses;
struct Context * ctx;
int isIterator;
struct Expression * propCategory;
unsigned int mustRegister;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__ClassProperty;

extern struct __ecereNameSpace__ecere__com__ClassProperty * __ecereNameSpace__ecere__com__eClass_FindClassProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

struct __ecereNameSpace__ecere__com__ClassProperty
{
const char *  name;
struct __ecereNameSpace__ecere__com__ClassProperty * parent;
struct __ecereNameSpace__ecere__com__ClassProperty * left;
struct __ecereNameSpace__ecere__com__ClassProperty * right;
int depth;
void (*  Set)(struct __ecereNameSpace__ecere__com__Class *, long long);
long long (*  Get)(struct __ecereNameSpace__ecere__com__Class *);
const char *  dataTypeString;
struct Type * dataType;
unsigned int constant;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__BitMember;

struct __ecereNameSpace__ecere__com__BitMember
{
struct __ecereNameSpace__ecere__com__BitMember * prev;
struct __ecereNameSpace__ecere__com__BitMember * next;
const char *  name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
const char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
struct Type * dataType;
int type;
int size;
int pos;
uint64 mask;
} ecere_gcc_struct;

struct TemplateParameter;

struct TemplateParameter
{
struct TemplateParameter * prev;
struct TemplateParameter * next;
struct Location loc;
int type;
struct Identifier * identifier;
union
{
struct TemplateDatatype * dataType;
int memberType;
} ecere_gcc_struct __anon1;
struct TemplateArgument * defaultArgument;
const char *  dataTypeString;
struct Type * baseType;
} ecere_gcc_struct;

struct Type
{
struct Type * prev;
struct Type * next;
int refCount;
union
{
struct Symbol * _class;
struct
{
struct __ecereNameSpace__ecere__sys__OldList members;
char *  enumName;
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
char *  name;
char *  typeName;
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

struct Specifier
{
struct Specifier * prev;
struct Specifier * next;
struct Location loc;
int type;
union
{
int specifier;
struct
{
struct ExtDecl * extDecl;
char *  name;
struct Symbol * symbol;
struct __ecereNameSpace__ecere__sys__OldList *  templateArgs;
struct Specifier * nsSpec;
} ecere_gcc_struct __anon1;
struct
{
struct Identifier * id;
struct __ecereNameSpace__ecere__sys__OldList *  list;
struct __ecereNameSpace__ecere__sys__OldList *  baseSpecs;
struct __ecereNameSpace__ecere__sys__OldList *  definitions;
unsigned int addNameSpace;
struct Context * ctx;
struct ExtDecl * extDeclStruct;
} ecere_gcc_struct __anon2;
struct Expression * expression;
struct Specifier * _class;
struct TemplateParameter * templateParameter;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

extern struct Expression * GetTemplateArgExp(struct TemplateParameter * param, struct __ecereNameSpace__ecere__com__Class * thisClassFrom, struct __ecereNameSpace__ecere__com__Class * curClass, unsigned int pointer);

struct TemplatedType
{
uintptr_t key;
struct __ecereNameSpace__ecere__sys__BTNode * parent;
struct __ecereNameSpace__ecere__sys__BTNode * left;
struct __ecereNameSpace__ecere__sys__BTNode * right;
int depth;
struct TemplateParameter * param;
} ecere_gcc_struct;

struct Type * ProcessTemplateParameterType(struct TemplateParameter * param)
{
if(param && param->type == 0 && (param->__anon1.dataType || param->dataTypeString))
{
if(!param->baseType)
{
if(param->dataTypeString)
param->baseType = ProcessTypeString(param->dataTypeString, 0);
else
param->baseType = ProcessType(param->__anon1.dataType->specifiers, param->__anon1.dataType->decl);
}
return param->baseType;
}
return (((void *)0));
}

unsigned int NeedCast(struct Type * type1, struct Type * type2)
{
if(!type1 || !type2 || type1->keepCast || type2->keepCast)
return 1;
if(type1->kind == 20 && type2->kind == 4 && type2->passAsTemplate == 0)
{
return 0;
}
if(type1->kind == type2->kind && type1->isLong == type2->isLong)
{
switch(type1->kind)
{
case 24:
case 1:
case 2:
case 3:
case 4:
case 22:
case 23:
if(type1->passAsTemplate && !type2->passAsTemplate)
return 1;
return type1->isSigned != type2->isSigned;
case 8:
return type1->__anon1._class != type2->__anon1._class;
case 13:
return (type1->__anon1.type && type2->__anon1.type && type1->__anon1.type->constant != type2->__anon1.type->constant) || NeedCast(type1->__anon1.type, type2->__anon1.type);
default:
return 1;
}
}
return 1;
}

unsigned int GetOpInt(struct Operand * op2, int * value2)
{
if(op2->kind == 3 && op2->type->isSigned)
*value2 = op2->__anon1.i;
else if(op2->kind == 3)
*value2 = (int)op2->__anon1.ui;
else if(op2->kind == 4 && op2->type->isSigned)
*value2 = (int)op2->__anon1.i64;
else if(op2->kind == 4)
*value2 = (int)op2->__anon1.ui64;
else if(op2->kind == 23 && op2->type->isSigned)
*value2 = (int)op2->__anon1.i64;
else if(op2->kind == 23)
*value2 = (int)op2->__anon1.ui64;
else if(op2->kind == 22 && op2->type->isSigned)
*value2 = (int)op2->__anon1.i64;
else if(op2->kind == 22)
*value2 = (int)op2->__anon1.ui64;
else if(op2->kind == 2 && op2->type->isSigned)
*value2 = (int)op2->__anon1.s;
else if(op2->kind == 2)
*value2 = (int)op2->__anon1.us;
else if(op2->kind == 1 && op2->type->isSigned)
*value2 = (int)op2->__anon1.c;
else if(op2->kind == 24 || op2->kind == 1)
*value2 = (int)op2->__anon1.uc;
else if(op2->kind == 6)
*value2 = (int)op2->__anon1.f;
else if(op2->kind == 7)
*value2 = (int)op2->__anon1.d;
else if(op2->kind == 13)
*value2 = (int)op2->__anon1.ui64;
else
return 0;
return 1;
}

unsigned int GetOpUInt(struct Operand * op2, unsigned int * value2)
{
if(op2->kind == 3 && op2->type->isSigned)
*value2 = (unsigned int)op2->__anon1.i;
else if(op2->kind == 3)
*value2 = op2->__anon1.ui;
else if(op2->kind == 4 && op2->type->isSigned)
*value2 = (unsigned int)op2->__anon1.i64;
else if(op2->kind == 4)
*value2 = (unsigned int)op2->__anon1.ui64;
else if(op2->kind == 23 && op2->type->isSigned)
*value2 = (unsigned int)op2->__anon1.i64;
else if(op2->kind == 23)
*value2 = (unsigned int)op2->__anon1.ui64;
else if(op2->kind == 22 && op2->type->isSigned)
*value2 = (unsigned int)op2->__anon1.i64;
else if(op2->kind == 22)
*value2 = (unsigned int)op2->__anon1.ui64;
else if(op2->kind == 2 && op2->type->isSigned)
*value2 = (unsigned int)op2->__anon1.s;
else if(op2->kind == 2)
*value2 = (unsigned int)op2->__anon1.us;
else if(op2->kind == 1 && op2->type->isSigned)
*value2 = (unsigned int)op2->__anon1.c;
else if(op2->kind == 24 || op2->kind == 1)
*value2 = (unsigned int)op2->__anon1.uc;
else if(op2->kind == 6)
*value2 = (unsigned int)op2->__anon1.f;
else if(op2->kind == 7)
*value2 = (unsigned int)op2->__anon1.d;
else if(op2->kind == 13)
*value2 = (unsigned int)op2->__anon1.ui64;
else
return 0;
return 1;
}

unsigned int GetOpInt64(struct Operand * op2, long long * value2)
{
if(op2->kind == 3 && op2->type->isSigned)
*value2 = (long long)op2->__anon1.i;
else if(op2->kind == 3)
*value2 = (long long)op2->__anon1.ui;
else if(op2->kind == 4 && op2->type->isSigned)
*value2 = op2->__anon1.i64;
else if(op2->kind == 4)
*value2 = (long long)op2->__anon1.ui64;
else if(op2->kind == 23 && op2->type->isSigned)
*value2 = op2->__anon1.i64;
else if(op2->kind == 23)
*value2 = (long long)op2->__anon1.ui64;
else if(op2->kind == 22 && op2->type->isSigned)
*value2 = op2->__anon1.i64;
else if(op2->kind == 22)
*value2 = (long long)op2->__anon1.ui64;
else if(op2->kind == 2 && op2->type->isSigned)
*value2 = (long long)op2->__anon1.s;
else if(op2->kind == 2)
*value2 = (long long)op2->__anon1.us;
else if(op2->kind == 1 && op2->type->isSigned)
*value2 = (long long)op2->__anon1.c;
else if(op2->kind == 24 || op2->kind == 1)
*value2 = (long long)op2->__anon1.uc;
else if(op2->kind == 6)
*value2 = (long long)op2->__anon1.f;
else if(op2->kind == 7)
*value2 = (long long)op2->__anon1.d;
else if(op2->kind == 13)
*value2 = (long long)op2->__anon1.ui64;
else
return 0;
return 1;
}

unsigned int GetOpUInt64(struct Operand * op2, uint64 * value2)
{
if(op2->kind == 3 && op2->type->isSigned)
*value2 = (uint64)op2->__anon1.i;
else if(op2->kind == 3)
*value2 = (uint64)op2->__anon1.ui;
else if(op2->kind == 4 && op2->type->isSigned)
*value2 = (uint64)op2->__anon1.i64;
else if(op2->kind == 4)
*value2 = op2->__anon1.ui64;
else if(op2->kind == 23 && op2->type->isSigned)
*value2 = (uint64)op2->__anon1.i64;
else if(op2->kind == 23)
*value2 = op2->__anon1.ui64;
else if(op2->kind == 22 && op2->type->isSigned)
*value2 = (uint64)op2->__anon1.i64;
else if(op2->kind == 22)
*value2 = op2->__anon1.ui64;
else if(op2->kind == 2 && op2->type->isSigned)
*value2 = (uint64)op2->__anon1.s;
else if(op2->kind == 2)
*value2 = (uint64)op2->__anon1.us;
else if(op2->kind == 1 && op2->type->isSigned)
*value2 = (uint64)op2->__anon1.c;
else if(op2->kind == 24 || op2->kind == 1)
*value2 = (uint64)op2->__anon1.uc;
else if(op2->kind == 6)
*value2 = (uint64)op2->__anon1.f;
else if(op2->kind == 7)
*value2 = (uint64)op2->__anon1.d;
else if(op2->kind == 13)
*value2 = op2->__anon1.ui64;
else
return 0;
return 1;
}

unsigned int GetOpIntPtr(struct Operand * op2, intptr_t * value2)
{
if(op2->kind == 3 && op2->type->isSigned)
*value2 = (intptr_t)op2->__anon1.i;
else if(op2->kind == 3)
*value2 = (intptr_t)op2->__anon1.ui;
else if(op2->kind == 4 && op2->type->isSigned)
*value2 = (intptr_t)op2->__anon1.i64;
else if(op2->kind == 4)
*value2 = (intptr_t)op2->__anon1.ui64;
else if(op2->kind == 23 && op2->type->isSigned)
*value2 = (intptr_t)op2->__anon1.i64;
else if(op2->kind == 23)
*value2 = (intptr_t)op2->__anon1.ui64;
else if(op2->kind == 22 && op2->type->isSigned)
*value2 = (intptr_t)op2->__anon1.i64;
else if(op2->kind == 22)
*value2 = (intptr_t)op2->__anon1.ui64;
else if(op2->kind == 2 && op2->type->isSigned)
*value2 = (intptr_t)op2->__anon1.s;
else if(op2->kind == 2)
*value2 = (intptr_t)op2->__anon1.us;
else if(op2->kind == 1 && op2->type->isSigned)
*value2 = (intptr_t)op2->__anon1.c;
else if(op2->kind == 24 || op2->kind == 1)
*value2 = (intptr_t)op2->__anon1.uc;
else if(op2->kind == 6)
*value2 = (intptr_t)op2->__anon1.f;
else if(op2->kind == 7)
*value2 = (intptr_t)op2->__anon1.d;
else if(op2->kind == 13)
*value2 = (intptr_t)op2->__anon1.ui64;
else
return 0;
return 1;
}

unsigned int GetOpUIntPtr(struct Operand * op2, uintptr_t * value2)
{
if(op2->kind == 3 && op2->type->isSigned)
*value2 = (uintptr_t)op2->__anon1.i;
else if(op2->kind == 3)
*value2 = (uintptr_t)op2->__anon1.ui;
else if(op2->kind == 4 && op2->type->isSigned)
*value2 = (uintptr_t)op2->__anon1.i64;
else if(op2->kind == 4)
*value2 = (uintptr_t)op2->__anon1.ui64;
else if(op2->kind == 23 && op2->type->isSigned)
*value2 = (uintptr_t)op2->__anon1.i64;
else if(op2->kind == 23)
*value2 = (uintptr_t)op2->__anon1.ui64;
else if(op2->kind == 22 && op2->type->isSigned)
*value2 = (uintptr_t)op2->__anon1.i64;
else if(op2->kind == 22)
*value2 = (uintptr_t)op2->__anon1.ui64;
else if(op2->kind == 2 && op2->type->isSigned)
*value2 = (uintptr_t)op2->__anon1.s;
else if(op2->kind == 2)
*value2 = (uintptr_t)op2->__anon1.us;
else if(op2->kind == 1 && op2->type->isSigned)
*value2 = (uintptr_t)op2->__anon1.c;
else if(op2->kind == 24 || op2->kind == 1)
*value2 = (uintptr_t)op2->__anon1.uc;
else if(op2->kind == 6)
*value2 = (uintptr_t)op2->__anon1.f;
else if(op2->kind == 7)
*value2 = (uintptr_t)op2->__anon1.d;
else if(op2->kind == 13)
*value2 = (uintptr_t)op2->__anon1.ui64;
else
return 0;
return 1;
}

unsigned int GetOpIntSize(struct Operand * op2, ssize_t * value2)
{
if(op2->kind == 3 && op2->type->isSigned)
*value2 = (ssize_t)op2->__anon1.i;
else if(op2->kind == 3)
*value2 = (ssize_t)op2->__anon1.ui;
else if(op2->kind == 4 && op2->type->isSigned)
*value2 = (ssize_t)op2->__anon1.i64;
else if(op2->kind == 4)
*value2 = (ssize_t)op2->__anon1.ui64;
else if(op2->kind == 23 && op2->type->isSigned)
*value2 = (ssize_t)op2->__anon1.i64;
else if(op2->kind == 23)
*value2 = (ssize_t)op2->__anon1.ui64;
else if(op2->kind == 22 && op2->type->isSigned)
*value2 = (ssize_t)op2->__anon1.i64;
else if(op2->kind == 22)
*value2 = (ssize_t)op2->__anon1.ui64;
else if(op2->kind == 2 && op2->type->isSigned)
*value2 = (ssize_t)op2->__anon1.s;
else if(op2->kind == 2)
*value2 = (ssize_t)op2->__anon1.us;
else if(op2->kind == 1 && op2->type->isSigned)
*value2 = (ssize_t)op2->__anon1.c;
else if(op2->kind == 24 || op2->kind == 1)
*value2 = (ssize_t)op2->__anon1.uc;
else if(op2->kind == 6)
*value2 = (ssize_t)op2->__anon1.f;
else if(op2->kind == 7)
*value2 = (ssize_t)op2->__anon1.d;
else if(op2->kind == 13)
*value2 = (ssize_t)op2->__anon1.ui64;
else
return 0;
return 1;
}

unsigned int GetOpUIntSize(struct Operand * op2, size_t * value2)
{
if(op2->kind == 3 && op2->type->isSigned)
*value2 = (size_t)op2->__anon1.i;
else if(op2->kind == 3)
*value2 = (size_t)op2->__anon1.ui;
else if(op2->kind == 4 && op2->type->isSigned)
*value2 = (size_t)op2->__anon1.i64;
else if(op2->kind == 4)
*value2 = (size_t)op2->__anon1.ui64;
else if(op2->kind == 23 && op2->type->isSigned)
*value2 = (size_t)op2->__anon1.i64;
else if(op2->kind == 23)
*value2 = (size_t)op2->__anon1.ui64;
else if(op2->kind == 22 && op2->type->isSigned)
*value2 = (size_t)op2->__anon1.i64;
else if(op2->kind == 22)
*value2 = (size_t)op2->__anon1.ui64;
else if(op2->kind == 2 && op2->type->isSigned)
*value2 = (size_t)op2->__anon1.s;
else if(op2->kind == 2)
*value2 = (size_t)op2->__anon1.us;
else if(op2->kind == 1 && op2->type->isSigned)
*value2 = (size_t)op2->__anon1.c;
else if(op2->kind == 24 || op2->kind == 1)
*value2 = (size_t)op2->__anon1.uc;
else if(op2->kind == 6)
*value2 = (size_t)op2->__anon1.f;
else if(op2->kind == 7)
*value2 = (size_t)op2->__anon1.d;
else if(op2->kind == 13)
*value2 = (size_t)op2->__anon1.ui64;
else
return 0;
return 1;
}

unsigned int GetOpShort(struct Operand * op2, short * value2)
{
if(op2->kind == 3 && op2->type->isSigned)
*value2 = (short)op2->__anon1.i;
else if(op2->kind == 3)
*value2 = (short)op2->__anon1.ui;
else if(op2->kind == 4 && op2->type->isSigned)
*value2 = (short)op2->__anon1.i64;
else if(op2->kind == 4)
*value2 = (short)op2->__anon1.ui64;
else if(op2->kind == 23 && op2->type->isSigned)
*value2 = (short)op2->__anon1.i64;
else if(op2->kind == 23)
*value2 = (short)op2->__anon1.ui64;
else if(op2->kind == 22 && op2->type->isSigned)
*value2 = (short)op2->__anon1.i64;
else if(op2->kind == 22)
*value2 = (short)op2->__anon1.ui64;
else if(op2->kind == 2 && op2->type->isSigned)
*value2 = op2->__anon1.s;
else if(op2->kind == 2)
*value2 = (short)op2->__anon1.us;
else if(op2->kind == 1 && op2->type->isSigned)
*value2 = (short)op2->__anon1.c;
else if(op2->kind == 24 || op2->kind == 1)
*value2 = (short)op2->__anon1.uc;
else if(op2->kind == 6)
*value2 = (short)op2->__anon1.f;
else if(op2->kind == 7)
*value2 = (short)op2->__anon1.d;
else if(op2->kind == 13)
*value2 = (short)op2->__anon1.ui64;
else
return 0;
return 1;
}

unsigned int GetOpUShort(struct Operand * op2, unsigned short * value2)
{
if(op2->kind == 3 && op2->type->isSigned)
*value2 = (unsigned short)op2->__anon1.i;
else if(op2->kind == 3)
*value2 = (unsigned short)op2->__anon1.ui;
else if(op2->kind == 4 && op2->type->isSigned)
*value2 = (unsigned short)op2->__anon1.i64;
else if(op2->kind == 4)
*value2 = (unsigned short)op2->__anon1.ui64;
else if(op2->kind == 23 && op2->type->isSigned)
*value2 = (unsigned short)op2->__anon1.i64;
else if(op2->kind == 23)
*value2 = (unsigned short)op2->__anon1.ui64;
else if(op2->kind == 22 && op2->type->isSigned)
*value2 = (unsigned short)op2->__anon1.i64;
else if(op2->kind == 22)
*value2 = (unsigned short)op2->__anon1.ui64;
else if(op2->kind == 2 && op2->type->isSigned)
*value2 = (unsigned short)op2->__anon1.s;
else if(op2->kind == 2)
*value2 = op2->__anon1.us;
else if(op2->kind == 1 && op2->type->isSigned)
*value2 = (unsigned short)op2->__anon1.c;
else if(op2->kind == 24 || op2->kind == 1)
*value2 = (unsigned short)op2->__anon1.uc;
else if(op2->kind == 6)
*value2 = (unsigned short)op2->__anon1.f;
else if(op2->kind == 7)
*value2 = (unsigned short)op2->__anon1.d;
else if(op2->kind == 13)
*value2 = (unsigned short)op2->__anon1.ui64;
else
return 0;
return 1;
}

unsigned int GetOpChar(struct Operand * op2, char * value2)
{
if(op2->kind == 3 && op2->type->isSigned)
*value2 = (char)op2->__anon1.i;
else if(op2->kind == 3)
*value2 = (char)op2->__anon1.ui;
else if(op2->kind == 4 && op2->type->isSigned)
*value2 = (char)op2->__anon1.i64;
else if(op2->kind == 4)
*value2 = (char)op2->__anon1.ui64;
else if(op2->kind == 23 && op2->type->isSigned)
*value2 = (char)op2->__anon1.i64;
else if(op2->kind == 23)
*value2 = (char)op2->__anon1.ui64;
else if(op2->kind == 22 && op2->type->isSigned)
*value2 = (char)op2->__anon1.i64;
else if(op2->kind == 22)
*value2 = (char)op2->__anon1.ui64;
else if(op2->kind == 2 && op2->type->isSigned)
*value2 = (char)op2->__anon1.s;
else if(op2->kind == 2)
*value2 = (char)op2->__anon1.us;
else if(op2->kind == 1 && op2->type->isSigned)
*value2 = op2->__anon1.c;
else if(op2->kind == 24 || op2->kind == 1)
*value2 = (char)op2->__anon1.uc;
else if(op2->kind == 6)
*value2 = (char)op2->__anon1.f;
else if(op2->kind == 7)
*value2 = (char)op2->__anon1.d;
else if(op2->kind == 13)
*value2 = (char)op2->__anon1.ui64;
else
return 0;
return 1;
}

unsigned int GetOpUChar(struct Operand * op2, unsigned char * value2)
{
if(op2->kind == 3 && op2->type->isSigned)
*value2 = (unsigned char)op2->__anon1.i;
else if(op2->kind == 3)
*value2 = (unsigned char)op2->__anon1.ui;
else if(op2->kind == 4 && op2->type->isSigned)
*value2 = (unsigned char)op2->__anon1.i64;
else if(op2->kind == 4)
*value2 = (unsigned char)op2->__anon1.ui64;
else if(op2->kind == 23 && op2->type->isSigned)
*value2 = (unsigned char)op2->__anon1.i64;
else if(op2->kind == 23)
*value2 = (unsigned char)op2->__anon1.ui64;
else if(op2->kind == 22 && op2->type->isSigned)
*value2 = (unsigned char)op2->__anon1.i64;
else if(op2->kind == 22)
*value2 = (unsigned char)op2->__anon1.ui64;
else if(op2->kind == 2 && op2->type->isSigned)
*value2 = (unsigned char)op2->__anon1.s;
else if(op2->kind == 2)
*value2 = (unsigned char)op2->__anon1.us;
else if(op2->kind == 1 && op2->type->isSigned)
*value2 = (unsigned char)op2->__anon1.c;
else if(op2->kind == 24 || op2->kind == 1)
*value2 = op2->__anon1.uc;
else if(op2->kind == 6)
*value2 = (unsigned char)op2->__anon1.f;
else if(op2->kind == 7)
*value2 = (unsigned char)op2->__anon1.d;
else if(op2->kind == 13)
*value2 = (unsigned char)op2->__anon1.ui64;
else
return 0;
return 1;
}

unsigned int GetOpFloat(struct Operand * op2, float * value2)
{
if(op2->kind == 3 && op2->type->isSigned)
*value2 = (float)(float)op2->__anon1.i;
else if(op2->kind == 3)
*value2 = (float)(float)op2->__anon1.ui;
else if(op2->kind == 4 && op2->type->isSigned)
*value2 = (float)(float)op2->__anon1.i64;
else if(op2->kind == 4)
*value2 = (float)(float)op2->__anon1.ui64;
else if(op2->kind == 23 && op2->type->isSigned)
*value2 = (float)(float)op2->__anon1.i64;
else if(op2->kind == 23)
*value2 = (float)(float)op2->__anon1.ui64;
else if(op2->kind == 22 && op2->type->isSigned)
*value2 = (float)(float)op2->__anon1.i64;
else if(op2->kind == 22)
*value2 = (float)(float)op2->__anon1.ui64;
else if(op2->kind == 2 && op2->type->isSigned)
*value2 = (float)(float)op2->__anon1.s;
else if(op2->kind == 2)
*value2 = (float)(float)op2->__anon1.us;
else if(op2->kind == 1 && op2->type->isSigned)
*value2 = (float)(float)op2->__anon1.c;
else if(op2->kind == 24 || op2->kind == 1)
*value2 = (float)(float)op2->__anon1.uc;
else if(op2->kind == 6)
*value2 = (float)op2->__anon1.f;
else if(op2->kind == 7)
*value2 = (float)op2->__anon1.d;
else if(op2->kind == 13)
*value2 = (float)(float)op2->__anon1.ui64;
else
return 0;
return 1;
}

unsigned int GetOpDouble(struct Operand * op2, double * value2)
{
if(op2->kind == 3 && op2->type->isSigned)
*value2 = (double)(double)op2->__anon1.i;
else if(op2->kind == 3)
*value2 = (double)(double)op2->__anon1.ui;
else if(op2->kind == 4 && op2->type->isSigned)
*value2 = (double)(double)op2->__anon1.i64;
else if(op2->kind == 4)
*value2 = (double)(double)op2->__anon1.ui64;
else if(op2->kind == 23 && op2->type->isSigned)
*value2 = (double)(double)op2->__anon1.i64;
else if(op2->kind == 23)
*value2 = (double)(double)op2->__anon1.ui64;
else if(op2->kind == 22 && op2->type->isSigned)
*value2 = (double)(double)op2->__anon1.i64;
else if(op2->kind == 22)
*value2 = (double)(double)op2->__anon1.ui64;
else if(op2->kind == 2 && op2->type->isSigned)
*value2 = (double)(double)op2->__anon1.s;
else if(op2->kind == 2)
*value2 = (double)(double)op2->__anon1.us;
else if(op2->kind == 1 && op2->type->isSigned)
*value2 = (double)(double)op2->__anon1.c;
else if(op2->kind == 24 || op2->kind == 1)
*value2 = (double)(double)op2->__anon1.uc;
else if(op2->kind == 6)
*value2 = (double)op2->__anon1.f;
else if(op2->kind == 7)
*value2 = (double)op2->__anon1.d;
else if(op2->kind == 13)
*value2 = (double)(double)op2->__anon1.ui64;
else
return 0;
return 1;
}

static unsigned int IntAdd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i + value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntAdd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui + value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64Add(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 + value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64Add(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 + value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortAdd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(op1->__anon1.s + value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortAdd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(op1->__anon1.us + value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharAdd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(op1->__anon1.c + value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharAdd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(op1->__anon1.uc + value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatAdd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f + value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleAdd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d + value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntSub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i - value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntSub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui - value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64Sub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 - value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64Sub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 - value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortSub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(op1->__anon1.s - value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortSub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(op1->__anon1.us - value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharSub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(op1->__anon1.c - value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharSub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(op1->__anon1.uc - value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatSub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f - value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleSub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d - value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntMul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i * value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntMul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui * value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64Mul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 * value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64Mul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 * value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortMul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(op1->__anon1.s * value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortMul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(op1->__anon1.us * value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharMul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(op1->__anon1.c * value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharMul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(op1->__anon1.uc * value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatMul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f * value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleMul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d * value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntDiv(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt(value2 ? ((op1->__anon1.i / value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntDiv(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt(value2 ? ((op1->__anon1.ui / value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64Div(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64(value2 ? ((op1->__anon1.i64 / value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64Div(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64(value2 ? ((op1->__anon1.ui64 / value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortDiv(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort(value2 ? ((short)(op1->__anon1.s / value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortDiv(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort(value2 ? ((unsigned short)(op1->__anon1.us / value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharDiv(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar(value2 ? ((char)(op1->__anon1.c / value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharDiv(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar(value2 ? ((unsigned char)(op1->__anon1.uc / value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatDiv(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f / value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleDiv(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d / value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntMod(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt(value2 ? ((op1->__anon1.i % value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntMod(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt(value2 ? ((op1->__anon1.ui % value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64Mod(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64(value2 ? ((op1->__anon1.i64 % value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64Mod(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64(value2 ? ((op1->__anon1.ui64 % value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortMod(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort(value2 ? ((short)(op1->__anon1.s % value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortMod(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort(value2 ? ((unsigned short)(op1->__anon1.us % value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharMod(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar(value2 ? ((char)(op1->__anon1.c % value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharMod(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar(value2 ? ((unsigned char)(op1->__anon1.uc % value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntNeg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((-op1->__anon1.i));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntNeg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((unsigned int)(-op1->__anon1.ui));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64Neg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((-op1->__anon1.i64));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64Neg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((uint64)(-op1->__anon1.ui64));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortNeg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((-op1->__anon1.s));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortNeg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(-op1->__anon1.us));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharNeg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((-op1->__anon1.c));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharNeg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(-op1->__anon1.uc));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatNeg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(-op1->__anon1.f));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleNeg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(-op1->__anon1.d));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntInc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((++op1->__anon1.i));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntInc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((++op1->__anon1.ui));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64Inc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((++op1->__anon1.i64));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64Inc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((++op1->__anon1.ui64));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortInc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((++op1->__anon1.s));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortInc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((++op1->__anon1.us));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharInc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((++op1->__anon1.c));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharInc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((++op1->__anon1.uc));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatInc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(++op1->__anon1.f));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleInc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(++op1->__anon1.d));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntDec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((--op1->__anon1.i));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntDec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((--op1->__anon1.ui));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64Dec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((--op1->__anon1.i64));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64Dec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((--op1->__anon1.ui64));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortDec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((--op1->__anon1.s));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortDec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((--op1->__anon1.us));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharDec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((--op1->__anon1.c));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharDec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((--op1->__anon1.uc));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatDec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(--op1->__anon1.f));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleDec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(--op1->__anon1.d));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i = value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui = value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64Asign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 = value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64Asign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 = value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((op1->__anon1.s = value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((op1->__anon1.us = value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((op1->__anon1.c = value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((op1->__anon1.uc = value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f = value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d = value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntAddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i += value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntAddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui += value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64AddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 += value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64AddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 += value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortAddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((op1->__anon1.s += value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortAddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((op1->__anon1.us += value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharAddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((op1->__anon1.c += value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharAddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((op1->__anon1.uc += value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatAddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f += value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleAddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d += value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntSubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i -= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntSubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui -= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64SubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 -= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64SubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 -= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortSubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((op1->__anon1.s -= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortSubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((op1->__anon1.us -= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharSubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((op1->__anon1.c -= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharSubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((op1->__anon1.uc -= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatSubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f -= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleSubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d -= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntMulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i *= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntMulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui *= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64MulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 *= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64MulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 *= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortMulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((op1->__anon1.s *= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortMulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((op1->__anon1.us *= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharMulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((op1->__anon1.c *= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharMulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((op1->__anon1.uc *= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatMulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f *= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleMulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d *= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntDivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt(value2 ? ((op1->__anon1.i /= value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntDivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt(value2 ? ((op1->__anon1.ui /= value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64DivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64(value2 ? ((op1->__anon1.i64 /= value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64DivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64(value2 ? ((op1->__anon1.ui64 /= value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortDivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort(value2 ? ((op1->__anon1.s /= value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortDivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort(value2 ? ((op1->__anon1.us /= value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharDivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar(value2 ? ((op1->__anon1.c /= value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharDivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar(value2 ? ((op1->__anon1.uc /= value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatDivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f /= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleDivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d /= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntModAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt(value2 ? ((op1->__anon1.i %= value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntModAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt(value2 ? ((op1->__anon1.ui %= value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64ModAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64(value2 ? ((op1->__anon1.i64 %= value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64ModAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64(value2 ? ((op1->__anon1.ui64 %= value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortModAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort(value2 ? ((op1->__anon1.s %= value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortModAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort(value2 ? ((op1->__anon1.us %= value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharModAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar(value2 ? ((op1->__anon1.c %= value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharModAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar(value2 ? ((op1->__anon1.uc %= value2)) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntBitAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i & value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntBitAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui & value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64BitAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 & value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64BitAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 & value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortBitAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(op1->__anon1.s & value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortBitAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(op1->__anon1.us & value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharBitAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(op1->__anon1.c & value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharBitAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(op1->__anon1.uc & value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntBitOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i | value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntBitOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui | value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64BitOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 | value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64BitOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 | value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortBitOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(op1->__anon1.s | value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortBitOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(op1->__anon1.us | value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharBitOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(op1->__anon1.c | value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharBitOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(op1->__anon1.uc | value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntBitXor(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i ^ value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntBitXor(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui ^ value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64BitXor(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 ^ value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64BitXor(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 ^ value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortBitXor(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(op1->__anon1.s ^ value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortBitXor(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(op1->__anon1.us ^ value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharBitXor(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(op1->__anon1.c ^ value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharBitXor(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(op1->__anon1.uc ^ value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntLShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i << value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntLShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui << value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64LShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 << value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64LShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 << value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortLShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(op1->__anon1.s << value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortLShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(op1->__anon1.us << value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharLShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(op1->__anon1.c << value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharLShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(op1->__anon1.uc << value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntRShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i >> value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntRShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui >> value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64RShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 >> value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64RShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 >> value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortRShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(op1->__anon1.s >> value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortRShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(op1->__anon1.us >> value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharRShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(op1->__anon1.c >> value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharRShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(op1->__anon1.uc >> value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntBitNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((~op1->__anon1.i));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntBitNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((unsigned int)(~op1->__anon1.ui));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64BitNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((long long)(~op1->__anon1.i64));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64BitNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((uint64)(~op1->__anon1.ui64));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortBitNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(~op1->__anon1.s));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortBitNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(~op1->__anon1.us));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharBitNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(~op1->__anon1.c));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharBitNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(~op1->__anon1.uc));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntAndAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i &= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntAndAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui &= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64AndAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 &= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64AndAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 &= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortAndAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((op1->__anon1.s &= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortAndAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((op1->__anon1.us &= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharAndAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((op1->__anon1.c &= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharAndAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((op1->__anon1.uc &= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntOrAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i |= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntOrAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui |= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64OrAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 |= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64OrAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 |= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortOrAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((op1->__anon1.s |= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortOrAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((op1->__anon1.us |= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharOrAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((op1->__anon1.c |= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharOrAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((op1->__anon1.uc |= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntXorAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i ^= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntXorAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui ^= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64XorAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 ^= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64XorAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 ^= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortXorAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((op1->__anon1.s ^= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortXorAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((op1->__anon1.us ^= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharXorAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((op1->__anon1.c ^= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharXorAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((op1->__anon1.uc ^= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntLShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i <<= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntLShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui <<= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64LShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 <<= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64LShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 <<= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortLShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((op1->__anon1.s <<= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortLShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((op1->__anon1.us <<= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharLShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((op1->__anon1.c <<= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharLShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((op1->__anon1.uc <<= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntRShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((op1->__anon1.i >>= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntRShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((op1->__anon1.ui >>= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64RShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((op1->__anon1.i64 >>= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64RShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((op1->__anon1.ui64 >>= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortRShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((op1->__anon1.s >>= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortRShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((op1->__anon1.us >>= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharRShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((op1->__anon1.c >>= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharRShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((op1->__anon1.uc >>= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((int)(!op1->__anon1.i));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((unsigned int)(!op1->__anon1.ui));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64Not(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((long long)(!op1->__anon1.i64));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64Not(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((uint64)(!op1->__anon1.ui64));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(!op1->__anon1.s));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(!op1->__anon1.us));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(!op1->__anon1.c));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(!op1->__anon1.uc));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((int)(op1->__anon1.i == value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((unsigned int)(op1->__anon1.ui == value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64Equ(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((long long)(op1->__anon1.i64 == value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64Equ(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((uint64)(op1->__anon1.ui64 == value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(op1->__anon1.s == value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(op1->__anon1.us == value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(op1->__anon1.c == value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(op1->__anon1.uc == value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f == value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d == value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntNqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((int)(op1->__anon1.i != value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntNqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((unsigned int)(op1->__anon1.ui != value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64Nqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((long long)(op1->__anon1.i64 != value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64Nqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((uint64)(op1->__anon1.ui64 != value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortNqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(op1->__anon1.s != value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortNqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(op1->__anon1.us != value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharNqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(op1->__anon1.c != value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharNqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(op1->__anon1.uc != value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatNqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f != value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleNqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d != value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((int)(op1->__anon1.i && value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((unsigned int)(op1->__anon1.ui && value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64And(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((long long)(op1->__anon1.i64 && value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64And(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((uint64)(op1->__anon1.ui64 && value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(op1->__anon1.s && value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(op1->__anon1.us && value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(op1->__anon1.c && value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(op1->__anon1.uc && value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f && value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d && value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((int)(op1->__anon1.i || value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((unsigned int)(op1->__anon1.ui || value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64Or(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((long long)(op1->__anon1.i64 || value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64Or(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((uint64)(op1->__anon1.ui64 || value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(op1->__anon1.s || value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(op1->__anon1.us || value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(op1->__anon1.c || value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(op1->__anon1.uc || value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f || value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d || value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntGrt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((int)(op1->__anon1.i > value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntGrt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((unsigned int)(op1->__anon1.ui > value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64Grt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((long long)(op1->__anon1.i64 > value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64Grt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((uint64)(op1->__anon1.ui64 > value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortGrt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(op1->__anon1.s > value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortGrt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(op1->__anon1.us > value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharGrt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(op1->__anon1.c > value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharGrt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(op1->__anon1.uc > value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatGrt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f > value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleGrt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d > value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntSma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((int)(op1->__anon1.i < value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntSma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((unsigned int)(op1->__anon1.ui < value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64Sma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((long long)(op1->__anon1.i64 < value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64Sma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((uint64)(op1->__anon1.ui64 < value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortSma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(op1->__anon1.s < value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortSma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(op1->__anon1.us < value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharSma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(op1->__anon1.c < value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharSma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(op1->__anon1.uc < value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatSma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f < value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleSma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d < value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntGrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((int)(op1->__anon1.i >= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntGrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((unsigned int)(op1->__anon1.ui >= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64GrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((long long)(op1->__anon1.i64 >= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64GrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((uint64)(op1->__anon1.ui64 >= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortGrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(op1->__anon1.s >= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortGrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(op1->__anon1.us >= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharGrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(op1->__anon1.c >= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharGrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(op1->__anon1.uc >= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatGrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f >= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleGrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d >= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntSmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->__anon1.i;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt((int)(op1->__anon1.i <= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntSmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->__anon1.ui;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt((unsigned int)(op1->__anon1.ui <= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64SmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
long long value2 = op2->__anon1.i64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64((long long)(op1->__anon1.i64 <= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64SmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
uint64 value2 = op2->__anon1.ui64;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64((uint64)(op1->__anon1.ui64 <= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortSmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->__anon1.s;

exp->type = 2;
exp->__anon1.__anon2.string = PrintShort((short)(op1->__anon1.s <= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortSmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->__anon1.us;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort((unsigned short)(op1->__anon1.us <= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharSmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->__anon1.c;

exp->type = 2;
exp->__anon1.__anon2.string = PrintChar((char)(op1->__anon1.c <= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharSmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->__anon1.uc;

exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar((unsigned char)(op1->__anon1.uc <= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int FloatSmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->__anon1.f;

exp->type = 2;
exp->__anon1.__anon2.string = PrintFloat((float)(op1->__anon1.f <= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int DoubleSmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->__anon1.d;

exp->type = 2;
exp->__anon1.__anon2.string = PrintDouble((double)(op1->__anon1.d <= value2));
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int IntCond(struct Expression * exp, struct Operand * op1, struct Operand * op2, struct Operand * op3)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintInt(op1->__anon1.i ? op2->__anon1.i : op3->__anon1.i);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UIntCond(struct Expression * exp, struct Operand * op1, struct Operand * op2, struct Operand * op3)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt(op1->__anon1.ui ? op2->__anon1.ui : op3->__anon1.ui);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int Int64Cond(struct Expression * exp, struct Operand * op1, struct Operand * op2, struct Operand * op3)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintInt64(op1->__anon1.i64 ? op2->__anon1.i64 : op3->__anon1.i64);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UInt64Cond(struct Expression * exp, struct Operand * op1, struct Operand * op2, struct Operand * op3)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUInt64(op1->__anon1.ui64 ? op2->__anon1.ui64 : op3->__anon1.ui64);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int ShortCond(struct Expression * exp, struct Operand * op1, struct Operand * op2, struct Operand * op3)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintShort(op1->__anon1.s ? op2->__anon1.s : op3->__anon1.s);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UShortCond(struct Expression * exp, struct Operand * op1, struct Operand * op2, struct Operand * op3)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUShort(op1->__anon1.us ? op2->__anon1.us : op3->__anon1.us);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int CharCond(struct Expression * exp, struct Operand * op1, struct Operand * op2, struct Operand * op3)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintChar(op1->__anon1.c ? op2->__anon1.c : op3->__anon1.c);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static unsigned int UCharCond(struct Expression * exp, struct Operand * op1, struct Operand * op2, struct Operand * op3)
{
exp->type = 2;
exp->__anon1.__anon2.string = PrintUChar(op1->__anon1.uc ? op2->__anon1.uc : op3->__anon1.uc);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 1;
}

static void PrintName(struct Type * type, char * string, unsigned int fullName)
{
if(type->name && type->name[0])
{
if(fullName)
strcat(string, type->name);
else
{
char * name = __ecereNameSpace__ecere__sys__RSearchString(type->name, "::", strlen(type->name), 1, 0);

if(name)
name += 2;
else
name = type->name;
strcat(string, name);
}
}
}

static void PrintAttribs(struct Type * type, char * string)
{
if(type)
{
if(type->dllExport)
strcat(string, "dllexport ");
if(type->attrStdcall)
strcat(string, "stdcall ");
}
}

static struct Type * FindMember(struct Type * type, char * string)
{
struct Type * memberType;

for(memberType = type->__anon1.__anon1.members.first; memberType; memberType = memberType->next)
{
if(!memberType->name)
{
struct Type * subType = FindMember(memberType, string);

if(subType)
return subType;
}
else if(!strcmp(memberType->name, string))
return memberType;
}
return (((void *)0));
}

unsigned int __ecereProp_Type_Get_isPointerType(struct Type * this);

unsigned int __ecereProp_Type_Get_specConst(struct Type * this);

static unsigned int Promote(struct Operand * op, int kind, unsigned int isSigned)
{
unsigned int result = 0;

switch(kind)
{
case 2:
if(op->kind == 1 || op->kind == 15 || op->kind == 24)
result = isSigned ? GetOpShort(op, &op->__anon1.s) : GetOpUShort(op, &op->__anon1.us);
break;
case 3:
case 5:
if(op->kind == 1 || op->kind == 2 || op->kind == 15 || op->kind == 24)
result = isSigned ? GetOpInt(op, &op->__anon1.i) : GetOpUInt(op, &op->__anon1.ui);
break;
case 4:
if(op->kind == 1 || op->kind == 2 || op->kind == 3 || op->kind == 4 || op->kind == 5 || op->kind == 6 || op->kind == 7 || op->kind == 13 || op->kind == 15 || op->kind == 22 || op->kind == 23 || op->kind == 24)
result = isSigned ? GetOpInt64(op, &op->__anon1.i64) : GetOpUInt64(op, &op->__anon1.ui64);
break;
case 6:
if(op->kind == 1 || op->kind == 2 || op->kind == 3 || op->kind == 4 || op->kind == 5 || op->kind == 15 || op->kind == 22 || op->kind == 23 || op->kind == 24)
result = GetOpFloat(op, &op->__anon1.f);
break;
case 7:
if(op->kind == 1 || op->kind == 2 || op->kind == 3 || op->kind == 4 || op->kind == 5 || op->kind == 6 || op->kind == 15 || op->kind == 22 || op->kind == 23 || op->kind == 24)
result = GetOpDouble(op, &op->__anon1.d);
break;
case 13:
if(op->kind == 1 || op->kind == 2 || op->kind == 3 || op->kind == 4 || op->kind == 5 || op->kind == 6 || op->kind == 7 || op->kind == 13 || op->kind == 15 || op->kind == 22 || op->kind == 23 || op->kind == 24)
result = GetOpUInt64(op, &op->__anon1.ui64);
break;
case 15:
if(op->kind == 1 || op->kind == 2 || op->kind == 3 || op->kind == 4 || op->kind == 5 || op->kind == 6 || op->kind == 7 || op->kind == 13 || op->kind == 15 || op->kind == 22 || op->kind == 23 || op->kind == 24)
result = isSigned ? GetOpInt(op, &op->__anon1.i) : GetOpUInt(op, &op->__anon1.ui);
break;
case 22:
if(op->kind == 1 || op->kind == 2 || op->kind == 3 || op->kind == 5 || op->kind == 15 || op->kind == 24)
result = isSigned ? GetOpInt64(op, &op->__anon1.i64) : GetOpUInt64(op, &op->__anon1.ui64);
break;
case 23:
if(op->kind == 1 || op->kind == 2 || op->kind == 3 || op->kind == 5 || op->kind == 15 || op->kind == 24)
result = isSigned ? GetOpInt64(op, &op->__anon1.i64) : GetOpUInt64(op, &op->__anon1.ui64);
break;
}
return result;
}

struct OpTable floatOps =
{
(void *)(FloatAdd), (void *)(FloatSub), (void *)(FloatMul), (void *)(FloatDiv), (((void *)0)), (void *)(FloatNeg), (void *)(FloatInc), (void *)(FloatDec), (void *)(FloatAsign), (void *)(FloatAddAsign), (void *)(FloatSubAsign), (void *)(FloatMulAsign), (void *)(FloatDivAsign), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (void *)(FloatEqu), (void *)(FloatNqu), (void *)(FloatAnd), (void *)(FloatOr), (void *)(FloatGrt), (void *)(FloatSma), (void *)(FloatGrtEqu), (void *)(FloatSmaEqu)
};

struct OpTable doubleOps =
{
(void *)(DoubleAdd), (void *)(DoubleSub), (void *)(DoubleMul), (void *)(DoubleDiv), (((void *)0)), (void *)(DoubleNeg), (void *)(DoubleInc), (void *)(DoubleDec), (void *)(DoubleAsign), (void *)(DoubleAddAsign), (void *)(DoubleSubAsign), (void *)(DoubleMulAsign), (void *)(DoubleDivAsign), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (void *)(DoubleEqu), (void *)(DoubleNqu), (void *)(DoubleAnd), (void *)(DoubleOr), (void *)(DoubleGrt), (void *)(DoubleSma), (void *)(DoubleGrtEqu), (void *)(DoubleSmaEqu)
};

struct OpTable intOps =
{
(void *)(IntAdd), (void *)(IntSub), (void *)(IntMul), (void *)(IntDiv), (void *)(IntMod), (void *)(IntNeg), (void *)(IntInc), (void *)(IntDec), (void *)(IntAsign), (void *)(IntAddAsign), (void *)(IntSubAsign), (void *)(IntMulAsign), (void *)(IntDivAsign), (void *)(IntModAsign), (void *)(IntBitAnd), (void *)(IntBitOr), (void *)(IntBitXor), (void *)(IntLShift), (void *)(IntRShift), (void *)(IntBitNot), (void *)(IntAndAsign), (void *)(IntOrAsign), (void *)(IntXorAsign), (void *)(IntLShiftAsign), (void *)(IntRShiftAsign), (void *)(IntNot), (void *)(IntEqu), (void *)(IntNqu), (void *)(IntAnd), (void *)(IntOr), (void *)(IntGrt), (void *)(IntSma), (void *)(IntGrtEqu), (void *)(IntSmaEqu), (void *)(IntCond)
};

struct OpTable uintOps =
{
(void *)(UIntAdd), (void *)(UIntSub), (void *)(UIntMul), (void *)(UIntDiv), (void *)(UIntMod), (void *)(UIntNeg), (void *)(UIntInc), (void *)(UIntDec), (void *)(UIntAsign), (void *)(UIntAddAsign), (void *)(UIntSubAsign), (void *)(UIntMulAsign), (void *)(UIntDivAsign), (void *)(UIntModAsign), (void *)(UIntBitAnd), (void *)(UIntBitOr), (void *)(UIntBitXor), (void *)(UIntLShift), (void *)(UIntRShift), (void *)(UIntBitNot), (void *)(UIntAndAsign), (void *)(UIntOrAsign), (void *)(UIntXorAsign), (void *)(UIntLShiftAsign), (void *)(UIntRShiftAsign), (void *)(UIntNot), (void *)(UIntEqu), (void *)(UIntNqu), (void *)(UIntAnd), (void *)(UIntOr), (void *)(UIntGrt), (void *)(UIntSma), (void *)(UIntGrtEqu), (void *)(UIntSmaEqu), (void *)(UIntCond)
};

struct OpTable int64Ops =
{
(void *)(Int64Add), (void *)(Int64Sub), (void *)(Int64Mul), (void *)(Int64Div), (void *)(Int64Mod), (void *)(Int64Neg), (void *)(Int64Inc), (void *)(Int64Dec), (void *)(Int64Asign), (void *)(Int64AddAsign), (void *)(Int64SubAsign), (void *)(Int64MulAsign), (void *)(Int64DivAsign), (void *)(Int64ModAsign), (void *)(Int64BitAnd), (void *)(Int64BitOr), (void *)(Int64BitXor), (void *)(Int64LShift), (void *)(Int64RShift), (void *)(Int64BitNot), (void *)(Int64AndAsign), (void *)(Int64OrAsign), (void *)(Int64XorAsign), (void *)(Int64LShiftAsign), (void *)(Int64RShiftAsign), (void *)(Int64Not), (void *)(Int64Equ), (void *)(Int64Nqu), (void *)(Int64And), (void *)(Int64Or), (void *)(Int64Grt), (void *)(Int64Sma), (void *)(Int64GrtEqu), (void *)(Int64SmaEqu), (void *)(Int64Cond)
};

struct OpTable uint64Ops =
{
(void *)(UInt64Add), (void *)(UInt64Sub), (void *)(UInt64Mul), (void *)(UInt64Div), (void *)(UInt64Mod), (void *)(UInt64Neg), (void *)(UInt64Inc), (void *)(UInt64Dec), (void *)(UInt64Asign), (void *)(UInt64AddAsign), (void *)(UInt64SubAsign), (void *)(UInt64MulAsign), (void *)(UInt64DivAsign), (void *)(UInt64ModAsign), (void *)(UInt64BitAnd), (void *)(UInt64BitOr), (void *)(UInt64BitXor), (void *)(UInt64LShift), (void *)(UInt64RShift), (void *)(UInt64BitNot), (void *)(UInt64AndAsign), (void *)(UInt64OrAsign), (void *)(UInt64XorAsign), (void *)(UInt64LShiftAsign), (void *)(UInt64RShiftAsign), (void *)(UInt64Not), (void *)(UInt64Equ), (void *)(UInt64Nqu), (void *)(UInt64And), (void *)(UInt64Or), (void *)(UInt64Grt), (void *)(UInt64Sma), (void *)(UInt64GrtEqu), (void *)(UInt64SmaEqu), (void *)(UInt64Cond)
};

struct OpTable shortOps =
{
(void *)(ShortAdd), (void *)(ShortSub), (void *)(ShortMul), (void *)(ShortDiv), (void *)(ShortMod), (void *)(ShortNeg), (void *)(ShortInc), (void *)(ShortDec), (void *)(ShortAsign), (void *)(ShortAddAsign), (void *)(ShortSubAsign), (void *)(ShortMulAsign), (void *)(ShortDivAsign), (void *)(ShortModAsign), (void *)(ShortBitAnd), (void *)(ShortBitOr), (void *)(ShortBitXor), (void *)(ShortLShift), (void *)(ShortRShift), (void *)(ShortBitNot), (void *)(ShortAndAsign), (void *)(ShortOrAsign), (void *)(ShortXorAsign), (void *)(ShortLShiftAsign), (void *)(ShortRShiftAsign), (void *)(ShortNot), (void *)(ShortEqu), (void *)(ShortNqu), (void *)(ShortAnd), (void *)(ShortOr), (void *)(ShortGrt), (void *)(ShortSma), (void *)(ShortGrtEqu), (void *)(ShortSmaEqu), (void *)(ShortCond)
};

struct OpTable ushortOps =
{
(void *)(UShortAdd), (void *)(UShortSub), (void *)(UShortMul), (void *)(UShortDiv), (void *)(UShortMod), (void *)(UShortNeg), (void *)(UShortInc), (void *)(UShortDec), (void *)(UShortAsign), (void *)(UShortAddAsign), (void *)(UShortSubAsign), (void *)(UShortMulAsign), (void *)(UShortDivAsign), (void *)(UShortModAsign), (void *)(UShortBitAnd), (void *)(UShortBitOr), (void *)(UShortBitXor), (void *)(UShortLShift), (void *)(UShortRShift), (void *)(UShortBitNot), (void *)(UShortAndAsign), (void *)(UShortOrAsign), (void *)(UShortXorAsign), (void *)(UShortLShiftAsign), (void *)(UShortRShiftAsign), (void *)(UShortNot), (void *)(UShortEqu), (void *)(UShortNqu), (void *)(UShortAnd), (void *)(UShortOr), (void *)(UShortGrt), (void *)(UShortSma), (void *)(UShortGrtEqu), (void *)(UShortSmaEqu), (void *)(UShortCond)
};

struct OpTable charOps =
{
(void *)(CharAdd), (void *)(CharSub), (void *)(CharMul), (void *)(CharDiv), (void *)(CharMod), (void *)(CharNeg), (void *)(CharInc), (void *)(CharDec), (void *)(CharAsign), (void *)(CharAddAsign), (void *)(CharSubAsign), (void *)(CharMulAsign), (void *)(CharDivAsign), (void *)(CharModAsign), (void *)(CharBitAnd), (void *)(CharBitOr), (void *)(CharBitXor), (void *)(CharLShift), (void *)(CharRShift), (void *)(CharBitNot), (void *)(CharAndAsign), (void *)(CharOrAsign), (void *)(CharXorAsign), (void *)(CharLShiftAsign), (void *)(CharRShiftAsign), (void *)(CharNot), (void *)(CharEqu), (void *)(CharNqu), (void *)(CharAnd), (void *)(CharOr), (void *)(CharGrt), (void *)(CharSma), (void *)(CharGrtEqu), (void *)(CharSmaEqu), (void *)(CharCond)
};

struct OpTable ucharOps =
{
(void *)(UCharAdd), (void *)(UCharSub), (void *)(UCharMul), (void *)(UCharDiv), (void *)(UCharMod), (void *)(UCharNeg), (void *)(UCharInc), (void *)(UCharDec), (void *)(UCharAsign), (void *)(UCharAddAsign), (void *)(UCharSubAsign), (void *)(UCharMulAsign), (void *)(UCharDivAsign), (void *)(UCharModAsign), (void *)(UCharBitAnd), (void *)(UCharBitOr), (void *)(UCharBitXor), (void *)(UCharLShift), (void *)(UCharRShift), (void *)(UCharBitNot), (void *)(UCharAndAsign), (void *)(UCharOrAsign), (void *)(UCharXorAsign), (void *)(UCharLShiftAsign), (void *)(UCharRShiftAsign), (void *)(UCharNot), (void *)(UCharEqu), (void *)(UCharNqu), (void *)(UCharAnd), (void *)(UCharOr), (void *)(UCharGrt), (void *)(UCharSma), (void *)(UCharGrtEqu), (void *)(UCharSmaEqu), (void *)(UCharCond)
};

struct Type * FindMemberAndOffset(struct Type * type, char * string, unsigned int * offset)
{
struct Type * memberType;

for(memberType = type->__anon1.__anon1.members.first; memberType; memberType = memberType->next)
{
if(!memberType->name)
{
struct Type * subType = FindMember(memberType, string);

if(subType)
{
*offset += memberType->offset;
return subType;
}
}
else if(!strcmp(memberType->name, string))
{
*offset += memberType->offset;
return memberType;
}
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Instance * privateModule;

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

extern struct ModuleImport * FindModule(struct __ecereNameSpace__ecere__com__Instance * moduleToFind);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, const char *  name);

struct GlobalData
{
uintptr_t key;
struct __ecereNameSpace__ecere__sys__BTNode * parent;
struct __ecereNameSpace__ecere__sys__BTNode * left;
struct __ecereNameSpace__ecere__sys__BTNode * right;
int depth;
struct __ecereNameSpace__ecere__com__Instance * module;
char *  dataTypeString;
struct Type * dataType;
void *  symbol;
char *  fullName;
} ecere_gcc_struct;

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, unsigned int *  offset, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

extern struct __ecereNameSpace__ecere__com__Instance * GetPrivateModule(void);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, const char *  name, const char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

struct __ecereNameSpace__ecere__com__DefinedExpression;

extern struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_FindDefine(struct __ecereNameSpace__ecere__com__Instance * module, const char *  name);

struct __ecereNameSpace__ecere__com__DefinedExpression
{
struct __ecereNameSpace__ecere__com__DefinedExpression * prev;
struct __ecereNameSpace__ecere__com__DefinedExpression * next;
const char *  name;
const char *  value;
struct __ecereNameSpace__ecere__com__NameSpace *  nameSpace;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
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

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, const char *  key);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(struct __ecereNameSpace__ecere__sys__BinaryTree * this);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindPrefix(struct __ecereNameSpace__ecere__sys__BinaryTree * this, const char *  key);

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Conversion;

static void _DeclareType(struct External * neededFor, struct Type * type, unsigned int needDereference, unsigned int forFunctionDef, unsigned int fwdDecl)
{
if(inCompiler)
{
if(type->kind == 11)
{
struct Type * param;

for(param = type->__anon1.__anon2.params.first; param; param = param->next)
_DeclareType(neededFor, param, forFunctionDef, 0, fwdDecl);
_DeclareType(neededFor, type->__anon1.__anon2.returnType, forFunctionDef, 0, fwdDecl);
}
else if(type->kind == 13)
_DeclareType(neededFor, type->__anon1.type, 0, 0, fwdDecl);
else if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * c = type->__anon1._class ? type->__anon1._class->__anon1.registered : (((void *)0));

_DeclareStruct(neededFor, c ? c->fullName : "ecere::com::Instance", c ? c->type == 5 : 0, needDereference && c && c->type == 1, fwdDecl);
}
else if(type->kind == 9 || type->kind == 10)
{
struct Type * member;

for(member = type->__anon1.__anon1.members.first; member; member = member->next)
_DeclareType(neededFor, member, needDereference, forFunctionDef, fwdDecl);
}
else if(type->kind == 12)
_DeclareType(neededFor, type->__anon1.__anon4.arrayType, 1, 0, fwdDecl);
}
}

static unsigned int CheckConstCompatibility(struct Type * source, struct Type * dest, unsigned int warn)
{
unsigned int status = 1;

if(((source->kind == 8 && source->__anon1._class && source->__anon1._class->__anon1.registered) || source->kind == 12 || source->kind == 13) && ((dest->kind == 8 && dest->__anon1._class && dest->__anon1._class->__anon1.registered) || dest->kind == 13))
{
struct __ecereNameSpace__ecere__com__Class * sourceClass = source->kind == 8 ? source->__anon1._class->__anon1.registered : (((void *)0));
struct __ecereNameSpace__ecere__com__Class * destClass = dest->kind == 8 ? dest->__anon1._class->__anon1.registered : (((void *)0));

if((!sourceClass || (sourceClass && sourceClass->type == 0 && !sourceClass->structSize)) && (!destClass || (destClass && destClass->type == 0 && !destClass->structSize)))
{
struct Type * sourceType = source, * destType = dest;

while((sourceType->kind == 13 || sourceType->kind == 12) && sourceType->__anon1.type)
sourceType = sourceType->__anon1.type;
while((destType->kind == 13 || destType->kind == 12) && destType->__anon1.type)
destType = destType->__anon1.type;
if(!destType->constant && sourceType->constant)
{
status = 0;
if(warn)
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "discarding const qualifier\n", (((void *)0))));
}
}
}
return status;
}

struct Operand GetOperand(struct Expression * exp)
{
struct Operand op =
{
0, 0, 0,
.__anon1 = {
.c = 0
},
{
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
};
struct Type * type = exp->expType;

if(type)
{
while(type->kind == 8 && type->__anon1._class && type->__anon1._class->__anon1.registered && (type->__anon1._class->__anon1.registered->type == 2 || type->__anon1._class->__anon1.registered->type == 3 || type->__anon1._class->__anon1.registered->type == 4))
{
if(!type->__anon1._class->__anon1.registered->dataType)
type->__anon1._class->__anon1.registered->dataType = ProcessTypeString(type->__anon1._class->__anon1.registered->dataTypeString, 0);
type = type->__anon1._class->__anon1.registered->dataType;
}
if(exp->type == 3 && op.kind == 13)
{
op.__anon1.ui64 = (uint64)(uintptr_t)exp->__anon1.__anon2.string;
op.kind = 13;
op.ops = uint64Ops;
}
else if(exp->isConstant && exp->type == 2)
{
op.kind = type->kind;
op.type = type;
switch(op.kind)
{
case 24:
case 1:
{
if(exp->__anon1.__anon1.constant[0] == '\'')
{
op.__anon1.c = exp->__anon1.__anon1.constant[1];
op.ops = charOps;
}
else if(type->isSigned)
{
op.__anon1.c = (char)strtol(exp->__anon1.__anon1.constant, (((void *)0)), 0);
op.ops = charOps;
}
else
{
op.__anon1.uc = (unsigned char)strtoul(exp->__anon1.__anon1.constant, (((void *)0)), 0);
op.ops = ucharOps;
}
break;
}
case 2:
if(exp->__anon1.__anon1.constant[0] == '\'')
{
op.__anon1.s = exp->__anon1.__anon1.constant[1];
op.ops = shortOps;
}
else if(type->isSigned)
{
op.__anon1.s = (short)strtol(exp->__anon1.__anon1.constant, (((void *)0)), 0);
op.ops = shortOps;
}
else
{
op.__anon1.us = (unsigned short)strtoul(exp->__anon1.__anon1.constant, (((void *)0)), 0);
op.ops = ushortOps;
}
break;
case 3:
case 5:
if(exp->__anon1.__anon1.constant[0] == '\'')
{
op.__anon1.i = exp->__anon1.__anon1.constant[1];
op.ops = intOps;
}
else if(type->isSigned)
{
op.__anon1.i = strtol(exp->__anon1.__anon1.constant, (((void *)0)), 0);
op.ops = intOps;
}
else
{
op.__anon1.ui = (unsigned int)strtoul(exp->__anon1.__anon1.constant, (((void *)0)), 0);
op.ops = uintOps;
}
op.kind = 3;
break;
case 4:
if(exp->__anon1.__anon1.constant[0] == '\'')
{
op.__anon1.i = exp->__anon1.__anon1.constant[1];
op.ops = intOps;
}
else if(type->isSigned)
{
op.__anon1.i64 = __ecereNameSpace__ecere__com___strtoi64(exp->__anon1.__anon1.constant, (((void *)0)), 0);
op.ops = int64Ops;
}
else
{
op.__anon1.ui64 = __ecereNameSpace__ecere__com___strtoui64(exp->__anon1.__anon1.constant, (((void *)0)), 0);
op.ops = uint64Ops;
}
op.kind = 4;
break;
case 22:
if(type->isSigned)
{
op.__anon1.i64 = __ecereNameSpace__ecere__com___strtoi64(exp->__anon1.__anon1.constant, (((void *)0)), 0);
op.ops = int64Ops;
}
else
{
op.__anon1.ui64 = __ecereNameSpace__ecere__com___strtoui64(exp->__anon1.__anon1.constant, (((void *)0)), 0);
op.ops = uint64Ops;
}
op.kind = 4;
break;
case 23:
if(type->isSigned)
{
op.__anon1.i64 = __ecereNameSpace__ecere__com___strtoi64(exp->__anon1.__anon1.constant, (((void *)0)), 0);
op.ops = int64Ops;
}
else
{
op.__anon1.ui64 = __ecereNameSpace__ecere__com___strtoui64(exp->__anon1.__anon1.constant, (((void *)0)), 0);
op.ops = uint64Ops;
}
op.kind = 4;
break;
case 6:
if(!strcmp(exp->__anon1.__anon1.constant, "inf"))
op.__anon1.f = __ecereMethod_float_inf();
else if(!strcmp(exp->__anon1.__anon1.constant, "-inf"))
op.__anon1.f = -__ecereMethod_float_inf();
else if(!strcmp(exp->__anon1.__anon1.constant, "nan"))
op.__anon1.f = __ecereMethod_float_nan();
else if(!strcmp(exp->__anon1.__anon1.constant, "-nan"))
op.__anon1.f = -__ecereMethod_float_nan();
else
op.__anon1.f = (float)strtod(exp->__anon1.__anon1.constant, (((void *)0)));
op.ops = floatOps;
break;
case 7:
if(!strcmp(exp->__anon1.__anon1.constant, "inf"))
op.__anon1.d = __ecereMethod_double_inf();
else if(!strcmp(exp->__anon1.__anon1.constant, "-inf"))
op.__anon1.d = -__ecereMethod_double_inf();
else if(!strcmp(exp->__anon1.__anon1.constant, "nan"))
op.__anon1.d = __ecereMethod_double_nan();
else if(!strcmp(exp->__anon1.__anon1.constant, "-nan"))
op.__anon1.d = -__ecereMethod_double_nan();
else
op.__anon1.d = (double)strtod(exp->__anon1.__anon1.constant, (((void *)0)));
op.ops = doubleOps;
break;
case 12:
case 13:
case 8:
op.__anon1.ui64 = __ecereNameSpace__ecere__com___strtoui64(exp->__anon1.__anon1.constant, (((void *)0)), 0);
op.kind = 13;
op.ops = uint64Ops;
break;
}
}
}
return op;
}

static long long GetEnumValue(struct __ecereNameSpace__ecere__com__Class * _class, void * ptr)
{
long long v = 0;

switch(_class->typeSize)
{
case 8:
if(!strcmp(_class->dataTypeString, "uint64"))
v = (long long)*(uint64 *)ptr;
else
v = *(long long *)ptr;
break;
case 4:
if(!strcmp(_class->dataTypeString, "uint"))
v = (long long)*(unsigned int *)ptr;
else
v = (long long)*(int *)ptr;
break;
case 2:
if(!strcmp(_class->dataTypeString, "uint16"))
v = (long long)*(unsigned short *)ptr;
else
v = (long long)*(short *)ptr;
break;
case 1:
if(!strcmp(_class->dataTypeString, "byte"))
v = (long long)*(unsigned char *)ptr;
else
v = (long long)*(char *)ptr;
break;
}
return v;
}

static void GetTypeSpecs(struct Type * type, struct __ecereNameSpace__ecere__sys__OldList * specs)
{
if(!type->isSigned && type->kind != 22 && type->kind != 23)
ListAdd(specs, MkSpecifier(UNSIGNED));
switch(type->kind)
{
case 8:
{
if(type->__anon1._class->__anon1.registered)
{
if(!type->__anon1._class->__anon1.registered->dataType)
type->__anon1._class->__anon1.registered->dataType = ProcessTypeString(type->__anon1._class->__anon1.registered->dataTypeString, 0);
GetTypeSpecs(type->__anon1._class->__anon1.registered->dataType, specs);
}
break;
}
case 7:
ListAdd(specs, MkSpecifier(DOUBLE));
break;
case 6:
ListAdd(specs, MkSpecifier(FLOAT));
break;
case 1:
ListAdd(specs, MkSpecifier(CHAR));
break;
case 24:
ListAdd(specs, MkSpecifier(_BOOL));
break;
case 2:
ListAdd(specs, MkSpecifier(SHORT));
break;
case 4:
ListAdd(specs, MkSpecifier(INT64));
break;
case 25:
ListAdd(specs, MkSpecifier(INT128));
break;
case 26:
ListAdd(specs, MkSpecifier(FLOAT128));
break;
case 22:
ListAdd(specs, MkSpecifierName(type->isSigned ? "intptr" : "uintptr"));
break;
case 23:
ListAdd(specs, MkSpecifierName(type->isSigned ? "intsize" : "uintsize"));
break;
case 3:
default:
ListAdd(specs, MkSpecifier(INT));
break;
}
}

static void PrintTypeSpecs(struct Type * type, char * string, unsigned int fullName, unsigned int printConst)
{
if(type)
{
if(printConst && type->constant)
strcat(string, "const ");
switch(type->kind)
{
case 8:
{
struct Symbol * c = type->__anon1._class;
unsigned int isObjectBaseClass = !c || !c->string || !strcmp(c->string, "class");

if(type->classObjectType == 2 && isObjectBaseClass)
strcat(string, "typed_object");
else if(type->classObjectType == 3 && isObjectBaseClass)
strcat(string, "any_object");
else
{
if(c && c->string)
{
const char * name = (fullName || !c->__anon1.registered) ? c->string : c->__anon1.registered->name;

if(inBGen && bgenSymbolSwap)
name = bgenSymbolSwap(name, 1, 1);
strcat(string, name);
}
}
if(type->byReference)
strcat(string, " &");
break;
}
case 0:
strcat(string, "void");
break;
case 3:
strcat(string, type->isSigned ? "int" : "uint");
break;
case 4:
strcat(string, type->isSigned ? "int64" : "uint64");
break;
case 25:
strcat(string, type->isSigned ? "__int128" : "unsigned __int128");
break;
case 26:
strcat(string, type->isSigned ? "__float128" : "unsigned __float128");
break;
case 22:
strcat(string, type->isSigned ? "intptr" : "uintptr");
break;
case 23:
strcat(string, type->isSigned ? "intsize" : "uintsize");
break;
case 1:
strcat(string, type->isSigned ? "char" : "byte");
break;
case 24:
strcat(string, "_Bool");
break;
case 2:
strcat(string, type->isSigned ? "short" : "uint16");
break;
case 6:
strcat(string, "float");
break;
case 7:
strcat(string, "double");
break;
case 9:
if(type->__anon1.__anon1.enumName)
{
strcat(string, "struct ");
strcat(string, type->__anon1.__anon1.enumName);
}
else if(type->typeName)
strcat(string, type->typeName);
else
{
struct Type * member;

strcat(string, "struct { ");
for(member = type->__anon1.__anon1.members.first; member; member = member->next)
{
PrintType(member, string, 1, fullName);
strcat(string, "; ");
}
strcat(string, "}");
}
break;
case 10:
if(type->__anon1.__anon1.enumName)
{
strcat(string, "union ");
strcat(string, type->__anon1.__anon1.enumName);
}
else if(type->typeName)
strcat(string, type->typeName);
else
{
strcat(string, "union ");
strcat(string, "(unnamed)");
}
break;
case 15:
if(type->__anon1.__anon1.enumName)
{
strcat(string, "enum ");
strcat(string, type->__anon1.__anon1.enumName);
}
else if(type->typeName)
strcat(string, type->typeName);
else
strcat(string, "int");
break;
case 14:
strcat(string, "...");
break;
case 19:
strcat(string, "subclass(");
strcat(string, type->__anon1._class ? type->__anon1._class->string : "int");
strcat(string, ")");
break;
case 20:
strcat(string, type->__anon1.templateParameter->identifier->string);
break;
case 21:
strcat(string, "thisclass");
break;
case 17:
strcat(string, "__builtin_va_list");
break;
}
}
}

unsigned int RelatedUnits(struct __ecereNameSpace__ecere__com__Class * c1, struct __ecereNameSpace__ecere__com__Class * c2)
{
if(c1->base->type == 3)
c1 = c1->base;
if(c2->base->type == 3)
c2 = c2->base;
return c1 == c2;
}

extern void __ecereNameSpace__ecere__com__PrintLn(struct __ecereNameSpace__ecere__com__Class * class, const void * object, ...);

extern char *  __ecereNameSpace__ecere__com__PrintString(struct __ecereNameSpace__ecere__com__Class * class, const void * object, ...);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Symbol;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Type;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplatedType;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateParameter;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_MethodImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Expression;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Instantiation;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__NamedLink64;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TypeName;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Context;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_char__PTR_;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_int;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__LinkList;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Application;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__File;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_External;

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

static void FindNextDataMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class ** curClass, struct __ecereNameSpace__ecere__com__DataMember ** curMember, struct __ecereNameSpace__ecere__com__DataMember ** subMemberStack, int * subMemberStackPos)
{
if(*curMember)
{
*curMember = (*curMember)->next;
if(subMemberStackPos && *subMemberStackPos > 0 && subMemberStack[*subMemberStackPos - 1]->type == 1)
{
*curMember = subMemberStack[--(*subMemberStackPos)];
*curMember = (*curMember)->next;
}
while((*curMember) && (*curMember)->isProperty)
*curMember = (*curMember)->next;
if(subMemberStackPos)
{
while((*curMember) && !(*curMember)->isProperty && !(*curMember)->name && ((*curMember)->type == 2 || (*curMember)->type == 1))
{
subMemberStack[(*subMemberStackPos)++] = *curMember;
*curMember = (*curMember)->members.first;
while(*curMember && (*curMember)->isProperty)
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
for(*curClass = _class; (*curClass)->base != lastCurClass && (*curClass)->base->type != 1000; *curClass = (*curClass)->base)
;
*curMember = (*curClass)->membersAndProperties.first;
}
while((*curMember) && (*curMember)->isProperty)
*curMember = (*curMember)->next;
if(subMemberStackPos)
{
while((*curMember) && !(*curMember)->isProperty && !(*curMember)->name && ((*curMember)->type == 2 || (*curMember)->type == 1))
{
subMemberStack[(*subMemberStackPos)++] = *curMember;
*curMember = (*curMember)->members.first;
while(*curMember && (*curMember)->isProperty)
*curMember = (*curMember)->next;
}
}
}
}
}

static struct GlobalData * ScanGlobalData(struct __ecereNameSpace__ecere__com__NameSpace * nameSpace, char * name)
{
struct __ecereNameSpace__ecere__sys__BinaryTree * tree = &nameSpace->functions;
struct GlobalData * data = (struct GlobalData *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString((&*tree), name);
struct __ecereNameSpace__ecere__com__NameSpace * child;

if(!data)
{
for(child = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&nameSpace->nameSpaces); child; child = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)child)))
{
data = ScanGlobalData(child, name);
if(data)
break;
}
}
return data;
}

static struct Symbol * ScanWithNameSpace(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, const char * nameSpace, const char * name)
{
int nsLen = strlen(nameSpace);
struct Symbol * symbol;

for(symbol = (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindPrefix(tree, nameSpace); symbol; symbol = (struct Symbol *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)symbol)))
{
char * s = symbol->string;

if(!strncmp(s, nameSpace, nsLen))
{
int c;
char * namePart;

for(c = strlen(s) - 1; c >= 0; c--)
if(s[c] == ':')
break;
namePart = s + c + 1;
if(!strcmp(namePart, name))
{
return symbol;
}
}
else
break;
}
return (((void *)0));
}

unsigned int GetInt(struct Expression * exp, int * value2)
{
struct Operand op2 = GetOperand(exp);

return GetOpInt(&op2, value2);
}

unsigned int GetUInt(struct Expression * exp, unsigned int * value2)
{
struct Operand op2 = GetOperand(exp);

return GetOpUInt(&op2, value2);
}

unsigned int GetInt64(struct Expression * exp, long long * value2)
{
struct Operand op2 = GetOperand(exp);

return GetOpInt64(&op2, value2);
}

unsigned int GetUInt64(struct Expression * exp, uint64 * value2)
{
struct Operand op2 = GetOperand(exp);

return GetOpUInt64(&op2, value2);
}

unsigned int GetIntPtr(struct Expression * exp, intptr_t * value2)
{
struct Operand op2 = GetOperand(exp);

return GetOpIntPtr(&op2, value2);
}

unsigned int GetUIntPtr(struct Expression * exp, uintptr_t * value2)
{
struct Operand op2 = GetOperand(exp);

return GetOpUIntPtr(&op2, value2);
}

unsigned int GetIntSize(struct Expression * exp, ssize_t * value2)
{
struct Operand op2 = GetOperand(exp);

return GetOpIntSize(&op2, value2);
}

unsigned int GetUIntSize(struct Expression * exp, size_t * value2)
{
struct Operand op2 = GetOperand(exp);

return GetOpUIntSize(&op2, value2);
}

unsigned int GetShort(struct Expression * exp, short * value2)
{
struct Operand op2 = GetOperand(exp);

return GetOpShort(&op2, value2);
}

unsigned int GetUShort(struct Expression * exp, unsigned short * value2)
{
struct Operand op2 = GetOperand(exp);

return GetOpUShort(&op2, value2);
}

unsigned int GetChar(struct Expression * exp, char * value2)
{
struct Operand op2 = GetOperand(exp);

return GetOpChar(&op2, value2);
}

unsigned int GetUChar(struct Expression * exp, unsigned char * value2)
{
struct Operand op2 = GetOperand(exp);

return GetOpUChar(&op2, value2);
}

unsigned int GetFloat(struct Expression * exp, float * value2)
{
struct Operand op2 = GetOperand(exp);

return GetOpFloat(&op2, value2);
}

unsigned int GetDouble(struct Expression * exp, double * value2)
{
struct Operand op2 = GetOperand(exp);

return GetOpDouble(&op2, value2);
}

static void PrePrintType(struct Type * type, char * string, unsigned int fullName, struct Type * parentType, unsigned int printConst)
{
if(type->kind == 12 || type->kind == 13 || type->kind == 11 || type->kind == 16)
{
if((type->kind == 11 || type->kind == 16) && (!parentType || parentType->kind != 13))
PrintAttribs(type, string);
if(printConst && type->constant && (type->kind == 11 || type->kind == 16))
strcat(string, " const");
PrePrintType(type->kind == 16 ? type->__anon1.__anon3.method->dataType : type->__anon1.type, string, fullName, type, printConst);
if(type->kind == 13 && (type->__anon1.type->kind == 12 || type->__anon1.type->kind == 11 || type->__anon1.type->kind == 16))
strcat(string, " (");
if(type->kind == 13)
{
if(type->__anon1.type->kind == 11 || type->__anon1.type->kind == 16)
PrintAttribs(type->__anon1.type, string);
}
if(type->kind == 13)
{
if(type->__anon1.type->kind == 11 || type->__anon1.type->kind == 16 || type->__anon1.type->kind == 12)
strcat(string, "*");
else
strcat(string, " *");
}
if(printConst && type->constant && type->kind == 13)
strcat(string, " const");
}
else
PrintTypeSpecs(type, string, fullName, printConst);
}

void PrintExpression(struct Expression * exp, char * string)
{
{
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);
int count;
unsigned int backOutputLineNumbers = outputLineNumbers;

outputLineNumbers = 0;
if(exp)
OutputExpression(exp, f);
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__TempFile->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, 0, 0) : (unsigned int)1;
}));
count = strlen(string);
count += (__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__TempFile->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, string + count, 1, 1023) : (size_t)1;
}));
string[count] = '\0';
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
outputLineNumbers = backOutputLineNumbers;
}
}

struct Type * Dereference(struct Type * source)
{
struct Type * type = (((void *)0));

if(source)
{
if(source->isVector)
{
type = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1;
});
CopyTypeInto(type, source);
type->isVector = 0;
}
else if(source->kind == 13 || source->kind == 12)
{
type = source->__anon1.type;
source->__anon1.type->refCount++;
}
else if(source->kind == 8 && !strcmp(source->__anon1._class->string, "String"))
{
type = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->kind = 1, __ecereInstance1->refCount = 1, __ecereInstance1;
});
}
else if(source->kind == 8 && source->__anon1._class && source->__anon1._class->__anon1.registered && source->__anon1._class->__anon1.registered->type == 5)
{
type = source;
source->refCount++;
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "cannot dereference type\n", (((void *)0))));
}
return type;
}

static struct Type * Reference(struct Type * source)
{
struct Type * type = (((void *)0));

if(source)
{
type = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->kind = 13, __ecereInstance1->__anon1.type = source, __ecereInstance1->refCount = 1, __ecereInstance1;
});
source->refCount++;
}
return type;
}

void modifyPassAsTemplate(struct Type ** typePtr, unsigned int value)
{
if(*typePtr && (*typePtr)->passAsTemplate != value)
{
struct Type * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), type->refCount = 1, type);

CopyTypeInto(type, *typePtr);
type->passAsTemplate = value;
FreeType(*typePtr);
*typePtr = type;
}
}

void ReplaceExpContents(struct Expression * checkedExp, struct Expression * newExp)
{
struct Expression * prev = checkedExp->prev, * next = checkedExp->next;

FreeExpContents(checkedExp);
FreeType(checkedExp->expType);
FreeType(checkedExp->destType);
*checkedExp = *newExp;
((newExp ? __extension__ ({
void * __ecerePtrToDelete = (newExp);

__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), newExp = 0);
checkedExp->prev = prev;
checkedExp->next = next;
}

void FinishTemplatesContext(struct Context * context)
{
PopContext(context);
FreeContext(context);
((context ? __extension__ ({
void * __ecerePtrToDelete = (context);

__ecereClass_Context->Destructor ? __ecereClass_Context->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), context = 0);
}

static __attribute__((unused)) void UnusedFunction()
{
int a;

(__extension__ ({
const char *  (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Class * , const void * , char *  tempString, void *  reserved, unsigned int *  onType);

__internal_VirtualMethod = ((const char *  (*)(struct __ecereNameSpace__ecere__com__Class *, const void *, char *  tempString, void *  reserved, unsigned int *  onType))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnGetString]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecereClass_int, (void *)&a, 0, 0, 0) : (const char * )1;
}));
}

struct Expression * ParseExpressionString(char * expression)
{
parseError = 0;
fileInput = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = fileInput;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write]);
__internal_VirtualMethod ? __internal_VirtualMethod(fileInput, expression, 1, strlen(expression)) : (size_t)1;
}));
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = fileInput;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(fileInput, 0, 0) : (unsigned int)1;
}));
echoOn = 0;
parsedExpression = (((void *)0));
resetScanner();
expression_yyparse();
(__ecereNameSpace__ecere__com__eInstance_DecRef(fileInput), fileInput = 0);
return parsedExpression;
}

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

static struct GlobalData * FindGlobalData(char * name)
{
int start = 0, c;
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace;

nameSpace = globalData;
for(c = 0; name[c]; c++)
{
if(name[c] == '.' || (name[c] == ':' && name[c + 1] == ':'))
{
struct __ecereNameSpace__ecere__com__NameSpace * newSpace;
char * spaceName = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (c - start + 1));

strncpy(spaceName, name + start, c - start);
spaceName[c - start] = '\0';
newSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*nameSpace).nameSpaces, spaceName);
(__ecereNameSpace__ecere__com__eSystem_Delete(spaceName), spaceName = 0);
if(!newSpace)
return (((void *)0));
nameSpace = newSpace;
if(name[c] == ':')
c++;
start = c + 1;
}
}
if(nameSpace && c - start)
{
return ScanGlobalData(nameSpace, name + start);
}
return (((void *)0));
}

static struct Symbol * FindWithNameSpace(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, const char * name)
{
int c;
char nameSpace[1024];
const char * namePart;
unsigned int gotColon = 0;

nameSpace[0] = '\0';
for(c = strlen(name) - 1; c >= 0; c--)
if(name[c] == ':')
{
gotColon = 1;
break;
}
namePart = name + c + 1;
while(c >= 0 && name[c] == ':')
c--;
if(c >= 0)
{
struct Symbol * symbol = (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(tree, name);

if(symbol)
return symbol;
memcpy(nameSpace, name, c + 1);
nameSpace[c + 1] = 0;
return ScanWithNameSpace(tree, nameSpace, namePart);
}
else if(gotColon)
{
struct Symbol * symbol = (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(tree, namePart);

return symbol;
}
else
{
struct Symbol * symbol = (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(tree, namePart);

if(symbol)
return symbol;
return ScanWithNameSpace(tree, "", namePart);
}
return (((void *)0));
}

static void PrintArraySize(struct Type * arrayType, char * string)
{
char size[256];

size[0] = '\0';
strcat(size, "[");
if(arrayType->__anon1.__anon4.enumClass)
strcat(size, arrayType->__anon1.__anon4.enumClass->string);
else if(arrayType->__anon1.__anon4.arraySizeExp)
PrintExpression(arrayType->__anon1.__anon4.arraySizeExp, size);
strcat(size, "]");
strcat(string, size);
}

void __ecereUnregisterModule_pass15(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

static void PostPrintType(struct Type * type, char * string, unsigned int fullName)
{
if(type->kind == 13 && (type->__anon1.type->kind == 12 || type->__anon1.type->kind == 11 || type->__anon1.type->kind == 16))
strcat(string, ")");
if(type->kind == 12)
PrintArraySize(type, string);
else if(type->kind == 11)
{
struct Type * param;

strcat(string, "(");
for(param = type->__anon1.__anon2.params.first; param; param = param->next)
{
PrintType(param, string, 1, fullName);
if(param->next)
strcat(string, ", ");
}
strcat(string, ")");
}
if(type->kind == 12 || type->kind == 13 || type->kind == 11 || type->kind == 16)
PostPrintType(type->kind == 16 ? type->__anon1.__anon3.method->dataType : type->__anon1.type, string, fullName);
}

static void _PrintType(struct Type * type, char * string, unsigned int printName, unsigned int fullName, unsigned int printConst)
{
PrePrintType(type, string, fullName, (((void *)0)), printConst);
if(type->__anon1.__anon2.thisClass || (printName && type->name && type->name[0]))
strcat(string, " ");
if((type->__anon1.__anon2.thisClass || type->__anon1.__anon2.staticMethod))
{
struct Symbol * _class = type->__anon1.__anon2.thisClass;

if((type->classObjectType == 2 || type->classObjectType == 1) || (_class && !strcmp(_class->string, "class")))
{
if(type->classObjectType == 1)
strcat(string, "class");
else
strcat(string, type->byReference ? "typed_object&" : "typed_object");
}
else if(_class && _class->string)
{
char * s = _class->string;

if(fullName)
strcat(string, s);
else
{
char * name = __ecereNameSpace__ecere__sys__RSearchString(s, "::", strlen(s), 1, 0);

if(name)
name += 2;
else
name = s;
strcat(string, name);
}
}
strcat(string, "::");
}
if(printName && type->name)
PrintName(type, string, fullName);
PostPrintType(type, string, fullName);
if(type->bitFieldCount)
{
char count[100];

sprintf(count, ":%d", type->bitFieldCount);
strcat(string, count);
}
}

struct Enumerator;

struct Enumerator
{
struct Enumerator * prev;
struct Enumerator * next;
struct Location loc;
struct Identifier * id;
struct Expression * exp;
struct __ecereNameSpace__ecere__sys__OldList *  attribs;
} ecere_gcc_struct;

struct AsmField;

struct AsmField
{
struct AsmField * prev;
struct AsmField * next;
struct Location loc;
char *  command;
struct Expression * expression;
struct Identifier * symbolic;
} ecere_gcc_struct;

struct ClassDefinition;

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

struct External
{
struct External * prev;
struct External * next;
struct Location loc;
int type;
struct Symbol * symbol;
union
{
struct FunctionDefinition * function;
struct ClassDefinition * _class;
struct Declaration * declaration;
char *  importString;
struct Identifier * id;
struct DBTableDef * table;
char *  pragma;
} ecere_gcc_struct __anon1;
int importType;
struct External * fwdDecl;
struct __ecereNameSpace__ecere__com__Instance * outgoing;
struct __ecereNameSpace__ecere__com__Instance * incoming;
int nonBreakableIncoming;
} ecere_gcc_struct;

struct ClassDefinition
{
struct ClassDefinition * prev;
struct ClassDefinition * next;
struct Location loc;
struct Specifier * _class;
struct __ecereNameSpace__ecere__sys__OldList *  baseSpecs;
struct __ecereNameSpace__ecere__sys__OldList *  definitions;
struct Symbol * symbol;
struct Location blockStart;
struct Location nameLoc;
int declMode;
unsigned int deleteWatchable;
} ecere_gcc_struct;

void __ecereMethod_External_CreateUniqueEdge(struct External * this, struct External * from, unsigned int soft);

void __ecereMethod_External_CreateEdge(struct External * this, struct External * from, unsigned int soft);

void DeclareGlobalData(struct External * neededFor, struct GlobalData * data)
{
struct Symbol * symbol = data->symbol;

if(!symbol || !symbol->__anon2.__anon1.pointerExternal)
{
if(inCompiler)
{
if(!symbol)
symbol = data->symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);
}
if(!data->dataType)
data->dataType = ProcessTypeString(data->dataTypeString, 0);
if(inCompiler)
{
struct Declaration * decl;
struct __ecereNameSpace__ecere__sys__OldList * specifiers, * declarators;
struct Declarator * d;
struct External * external;

specifiers = MkList();
declarators = MkList();
ListAdd(specifiers, MkSpecifier(EXTERN));
d = MkDeclaratorIdentifier(MkIdentifier(data->fullName));
d = SpecDeclFromString(data->dataTypeString, specifiers, d);
ListAdd(declarators, MkInitDeclarator(d, (((void *)0))));
decl = MkDeclaration(specifiers, declarators);
external = MkExternalDeclaration(decl);
if(curExternal)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), curExternal->prev, external);
external->symbol = symbol;
symbol->__anon2.__anon1.pointerExternal = external;
DeclareType(external, data->dataType, 1, 1);
}
}
if(inCompiler && neededFor && symbol && symbol->__anon2.__anon1.pointerExternal)
__ecereMethod_External_CreateUniqueEdge(neededFor, symbol->__anon2.__anon1.pointerExternal, 0);
}

struct Symbol * FindSymbol(const char * name, struct Context * startContext, struct Context * endContext, unsigned int isStruct, unsigned int globalNameSpace)
{
struct Context * ctx;
struct Symbol * symbol = (((void *)0));

for(ctx = startContext; ctx && !symbol; ctx = ctx->parent)
{
if(ctx == globalContext && !globalNameSpace && ctx->hasNameSpace)
{
symbol = (((void *)0));
if(thisNameSpace)
{
char curName[1024];

strcpy(curName, thisNameSpace);
strcat(curName, "::");
strcat(curName, name);
symbol = FindWithNameSpace(isStruct ? &ctx->structSymbols : &ctx->symbols, curName);
}
if(!symbol)
symbol = FindWithNameSpace(isStruct ? &ctx->structSymbols : &ctx->symbols, name);
}
else
symbol = (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString((isStruct ? &ctx->structSymbols : &ctx->symbols), name);
if(symbol || ctx == endContext)
break;
}
if(inCompiler && symbol && ctx == globalContext && symbol->__anon2.__anon1.pointerExternal && curExternal && symbol->__anon2.__anon1.pointerExternal != curExternal)
__ecereMethod_External_CreateUniqueEdge(curExternal, symbol->__anon2.__anon1.pointerExternal, symbol->__anon2.__anon1.pointerExternal->type == 0);
return symbol;
}

struct PropertyDef;

struct ClassDef
{
struct ClassDef * prev;
struct ClassDef * next;
struct Location loc;
int type;
union
{
struct Declaration * decl;
struct ClassFunction * function;
struct __ecereNameSpace__ecere__sys__OldList *  defProperties;
struct PropertyDef * propertyDef;
struct PropertyWatch * propertyWatch;
char *  designer;
struct Identifier * defaultProperty;
struct
{
struct Identifier * id;
struct Initializer * initializer;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct __anon1;
int memberAccess;
void *  object;
} ecere_gcc_struct;

struct PropertyDef
{
struct PropertyDef * prev;
struct PropertyDef * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList *  specifiers;
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

static void IdentifyAnonStructs(struct __ecereNameSpace__ecere__sys__OldList * definitions)
{
struct ClassDef * def;
int anonID = 1;

for(def = (*definitions).first; def; def = def->next)
{
if(def->type == 2)
{
struct Declaration * decl = def->__anon1.decl;

if(decl && decl->__anon1.__anon1.specifiers)
{
struct Specifier * spec;
unsigned int isStruct = 0;

for(spec = (*decl->__anon1.__anon1.specifiers).first; spec; spec = spec->next)
{
if(spec->type == 3 || spec->type == 4)
{
if(spec->__anon1.__anon2.definitions)
IdentifyAnonStructs(spec->__anon1.__anon2.definitions);
isStruct = 1;
}
}
if(isStruct)
{
struct Declarator * d = (((void *)0));

if(decl->__anon1.__anon1.declarators)
{
for(d = (*decl->__anon1.__anon1.declarators).first; d; d = d->next)
{
struct Identifier * idDecl = GetDeclId(d);

if(idDecl)
break;
}
}
if(!d)
{
char id[100];

sprintf(id, "__anon%d", anonID++);
if(!decl->__anon1.__anon1.declarators)
decl->__anon1.__anon1.declarators = MkList();
ListAdd(decl->__anon1.__anon1.declarators, MkDeclaratorIdentifier(MkIdentifier(id)));
}
}
}
}
}
}

struct MemberInit;

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

struct MemberInit
{
struct MemberInit * prev;
struct MemberInit * next;
struct Location loc;
struct Location realLoc;
struct __ecereNameSpace__ecere__sys__OldList *  identifiers;
struct Initializer * initializer;
unsigned int used;
unsigned int variable;
unsigned int takeOutExp;
} ecere_gcc_struct;

extern struct MemberInit * MkMemberInit(struct __ecereNameSpace__ecere__sys__OldList * ids, struct Initializer * initializer);

struct __ecereNameSpace__ecere__com__ClassTemplateParameter;

struct __ecereNameSpace__ecere__com__ClassTemplateParameter
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * prev;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * next;
const char *  name;
int type;
union
{
const char *  dataTypeString;
int memberType;
} ecere_gcc_struct __anon1;
struct __ecereNameSpace__ecere__com__ClassTemplateArgument defaultArg;
void *  param;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__ClassTemplateArgument * FindTemplateArg(struct __ecereNameSpace__ecere__com__Class * _class, struct TemplateParameter * param)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument * arg = (((void *)0));
int id = 0;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * curParam = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = _class; sClass; sClass = sClass->base)
{
id = 0;
if(sClass->templateClass)
sClass = sClass->templateClass;
for(curParam = sClass->templateParams.first; curParam; curParam = curParam->next)
{
if(curParam->type == 0 && !strcmp(param->identifier->string, curParam->name))
{
for(sClass = sClass->base; sClass; sClass = sClass->base)
{
if(sClass->templateClass)
sClass = sClass->templateClass;
id += sClass->templateParams.count;
}
break;
}
id++;
}
if(curParam)
break;
}
if(curParam)
{
arg = &_class->templateArgs[id];
if(arg && param->type == 0)
(*arg).__anon1.__anon1.dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, (*arg).__anon1.__anon1.dataTypeString);
}
return arg;
}

struct Context * SetupTemplatesContext(struct __ecereNameSpace__ecere__com__Class * _class)
{
struct Context * context = PushContext();

context->templateTypesOnly = 1;
if(_class->symbol && ((struct Symbol *)_class->symbol)->templateParams)
{
struct TemplateParameter * param = (*((struct Symbol *)_class->symbol)->templateParams).first;

for(; param; param = param->next)
{
if(param->type == 0 && param->identifier)
{
struct TemplatedType * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplatedType), type->key = (uintptr_t)param->identifier->string, type->param = param, type);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&curContext->templateTypes, (struct __ecereNameSpace__ecere__sys__BTNode *)type);
}
}
}
else if(_class)
{
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = _class; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * p;

for(p = sClass->templateParams.first; p; p = p->next)
{
if(p->type == 0)
{
struct TemplateParameter * param = p->param;
struct TemplatedType * type;

if(!param)
{
p->param = param = __extension__ ({
struct TemplateParameter * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplateParameter);

__ecereInstance1->identifier = MkIdentifier(p->name), __ecereInstance1->type = p->type, __ecereInstance1->dataTypeString = p->__anon1.dataTypeString, __ecereInstance1;
});
}
type = __extension__ ({
struct TemplatedType * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplatedType);

__ecereInstance1->key = (uintptr_t)p->name, __ecereInstance1->param = param, __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&curContext->templateTypes, (struct __ecereNameSpace__ecere__sys__BTNode *)type);
}
}
}
}
return context;
}

char * ReplaceThisClass(struct __ecereNameSpace__ecere__com__Class * _class)
{
if(thisClassParams && _class->templateParams.count && !_class->templateClass)
{
unsigned int first = 1;
int p = 0;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;
int lastParam = -1;
char className[1024];

strcpy(className, _class->fullName);
for(param = _class->templateParams.first; param; param = param->next)
{
{
if(first)
strcat(className, "<");
if(!first)
strcat(className, ", ");
if(lastParam + 1 != p)
{
strcat(className, param->name);
strcat(className, " = ");
}
strcat(className, param->name);
first = 0;
lastParam = p;
}
p++;
}
if(!first)
{
int len = strlen(className);

if(className[len - 1] == '>')
className[len++] = ' ';
className[len++] = '>';
className[len++] = '\0';
}
return __ecereNameSpace__ecere__sys__CopyString(className);
}
else
return __ecereNameSpace__ecere__sys__CopyString(_class->fullName);
}

struct Type * ReplaceThisClassType(struct __ecereNameSpace__ecere__com__Class * _class)
{
struct Type * type;

if(thisClassParams && _class->templateParams.count && !_class->templateClass)
{
unsigned int first = 1;
int p = 0;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;
int lastParam = -1;
char className[1024];

strcpy(className, _class->fullName);
for(param = _class->templateParams.first; param; param = param->next)
{
{
if(first)
strcat(className, "<");
if(!first)
strcat(className, ", ");
if(lastParam + 1 != p)
{
strcat(className, param->name);
strcat(className, " = ");
}
strcat(className, param->name);
first = 0;
lastParam = p;
}
p++;
}
if(!first)
{
int len = strlen(className);

if(className[len - 1] == '>')
className[len++] = ' ';
className[len++] = '>';
className[len++] = '\0';
}
type = MkClassType(className);
}
else
{
type = MkClassType(_class->fullName);
}
return type;
}

static int DeclareMembers(struct External * neededBy, struct __ecereNameSpace__ecere__com__Class * _class, unsigned int isMember)
{
struct __ecereNameSpace__ecere__com__DataMember * topMember = isMember ? (struct __ecereNameSpace__ecere__com__DataMember *)_class : (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * member;
struct Context * context = isMember ? (((void *)0)) : SetupTemplatesContext(_class);

if(!isMember && (_class->type == 1 || _class->type == 5) && _class->base->type != 1000)
DeclareMembers(neededBy, _class->base, 0);
for(member = isMember ? topMember->members.first : _class->membersAndProperties.first; member; member = member->next)
{
if(!member->isProperty)
{
switch(member->type)
{
case 0:
{
if(!member->dataType && member->dataTypeString)
member->dataType = ProcessTypeString(member->dataTypeString, 0);
if(member->dataType)
DeclareType(neededBy, member->dataType, 1, 0);
break;
}
case 1:
case 2:
{
DeclareMembers(neededBy, (struct __ecereNameSpace__ecere__com__Class *)member, 1);
break;
}
}
}
}
if(context)
FinishTemplatesContext(context);
return topMember ? topMember->memberID : _class->memberID;
}

void ProcessMethodType(struct __ecereNameSpace__ecere__com__Method * method)
{
if(!method->dataType)
{
struct Context * context = SetupTemplatesContext(method->_class);

method->dataType = ProcessTypeString(method->dataTypeString, 0);
FinishTemplatesContext(context);
if(method->type != 1 && method->dataType)
{
if(!method->dataType->__anon1.__anon2.thisClass && !method->dataType->__anon1.__anon2.staticMethod)
{
if(!method->_class->symbol)
method->_class->symbol = FindClass(method->_class->fullName);
method->dataType->__anon1.__anon2.thisClass = method->_class->symbol;
}
}
}
}

void ProcessPropertyType(struct __ecereNameSpace__ecere__com__Property * prop)
{
if(!prop->dataType)
{
struct Context * context = SetupTemplatesContext(prop->_class);

prop->dataType = ProcessTypeString(prop->dataTypeString, 0);
FinishTemplatesContext(context);
}
}

void ReplaceThisClassSpecifiers(struct __ecereNameSpace__ecere__sys__OldList * specs, struct __ecereNameSpace__ecere__com__Class * _class)
{
if(specs != (((void *)0)) && _class)
{
struct Specifier * spec;

for(spec = specs->first; spec; spec = spec->next)
{
if(spec->type == 0 && spec->__anon1.specifier == THISCLASS)
{
spec->type = 1;
spec->__anon1.__anon1.name = ReplaceThisClass(_class);
spec->__anon1.__anon1.symbol = FindClass(spec->__anon1.__anon1.name);
}
}
}
}

static unsigned int ResolveIdWithClass(struct Expression * exp, struct __ecereNameSpace__ecere__com__Class * _class, unsigned int skipIDClassCheck)
{
struct Identifier * id = exp->__anon1.__anon1.identifier;
struct __ecereNameSpace__ecere__com__Method * method = (((void *)0));
struct __ecereNameSpace__ecere__com__Property * prop = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * member = (((void *)0));
struct __ecereNameSpace__ecere__com__ClassProperty * classProp = (((void *)0));

if(_class && _class->type == 4)
{
struct __ecereNameSpace__ecere__sys__NamedLink64 * value = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * enumClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "enum");

if(enumClass)
{
struct __ecereNameSpace__ecere__com__Class * baseClass;

for(baseClass = _class; baseClass && baseClass->type == 4; baseClass = baseClass->base)
{
struct __ecereNameSpace__ecere__com__EnumClassData * e = (baseClass ? ((void *)(((char *)baseClass->data) + enumClass->offsetClass)) : (((void *)0)));

for(value = e->values.first; value; value = value->next)
{
if(!strcmp(value->name, id->string))
break;
}
if(inBGen && value)
{
exp->expType = MkClassType(baseClass->fullName);
break;
}
else if(value)
{
exp->isConstant = 1;
if(inCompiler || inPreCompiler || inDebugger)
{
char constant[256];

FreeExpContents(exp);
exp->type = 2;
if(!strcmp(baseClass->dataTypeString, "int") || !strcmp(baseClass->dataTypeString, "int64") || !strcmp(baseClass->dataTypeString, "char") || !strcmp(baseClass->dataTypeString, "short"))
sprintf(constant, ((__runtimePlatform == 1) ? "%I64d" : "%lld"), value->data);
else
sprintf(constant, ((__runtimePlatform == 1) ? "0x%I64X" : "0x%llX"), value->data);
exp->__anon1.__anon1.constant = __ecereNameSpace__ecere__sys__CopyString(constant);
}
exp->expType = MkClassType(baseClass->fullName);
break;
}
}
}
if(value)
return 1;
}
if((method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, id->string, privateModule)))
{
ProcessMethodType(method);
exp->expType = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1->kind = 16, __ecereInstance1->__anon1.__anon3.method = method, __ecereInstance1->__anon1.__anon3.methodClass = (skipIDClassCheck || (id && id->_class)) ? _class : (((void *)0)), __ecereInstance1;
});
return 1;
}
else if((prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, id->string, privateModule)))
{
if(!prop->dataType)
ProcessPropertyType(prop);
exp->expType = prop->dataType;
if(prop->dataType)
prop->dataType->refCount++;
return 1;
}
else if((member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, id->string, privateModule, (((void *)0)), (((void *)0)))))
{
if(!member->dataType)
member->dataType = ProcessTypeString(member->dataTypeString, 0);
exp->expType = member->dataType;
if(member->dataType)
member->dataType->refCount++;
return 1;
}
else if((classProp = __ecereNameSpace__ecere__com__eClass_FindClassProperty(_class, id->string)))
{
if(!classProp->dataType)
classProp->dataType = ProcessTypeString(classProp->dataTypeString, 0);
if(classProp->constant)
{
FreeExpContents(exp);
exp->isConstant = 1;
if(classProp->dataType->kind == 13 && classProp->dataType->__anon1.type->kind == 1)
{
exp->type = 3;
exp->__anon1.__anon1.constant = QMkString((char *)(uintptr_t)classProp->Get(_class));
}
else
{
char constant[256];

exp->type = 2;
sprintf(constant, "%d", (int)classProp->Get(_class));
exp->__anon1.__anon1.constant = __ecereNameSpace__ecere__sys__CopyString(constant);
}
}
else
{
}
exp->expType = classProp->dataType;
if(classProp->dataType)
classProp->dataType->refCount++;
return 1;
}
return 0;
}

void DeclareProperty(struct External * neededBy, struct __ecereNameSpace__ecere__com__Property * prop, char * setName, char * getName)
{
struct Symbol * symbol = prop->symbol;
unsigned int imported = 0;
unsigned int dllImport = 0;
struct External * structExternal = (((void *)0));
struct External * instExternal = (((void *)0));

strcpy(setName, "__ecereProp_");
FullClassNameCat(setName, prop->_class->fullName, 0);
strcat(setName, "_Set_");
FullClassNameCat(setName, prop->name, 1);
strcpy(getName, "__ecereProp_");
FullClassNameCat(getName, prop->_class->fullName, 0);
strcat(getName, "_Get_");
FullClassNameCat(getName, prop->name, 1);
if(!symbol || symbol->_import)
{
if(!symbol)
{
struct Symbol * classSym;

if(!prop->_class->symbol)
prop->_class->symbol = FindClass(prop->_class->fullName);
classSym = prop->_class->symbol;
if(classSym && !classSym->_import)
{
struct ModuleImport * module;

if(prop->_class->module)
module = FindModule(prop->_class->module);
else
module = mainModule;
classSym->_import = __extension__ ({
struct ClassImport * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassImport);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(prop->_class->fullName), __ecereInstance1->isRemote = prop->_class->isRemote, __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&module->classes, classSym->_import);
}
symbol = prop->symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);
symbol->_import = (struct ClassImport *)__extension__ ({
struct PropertyImport * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_PropertyImport);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(prop->name), __ecereInstance1->isVirtual = 0, __ecereInstance1->hasSet = prop->Set ? 1 : 0, __ecereInstance1->hasGet = prop->Get ? 1 : 0, __ecereInstance1;
});
if(classSym)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&classSym->_import->properties, symbol->_import);
}
imported = 1;
if((prop->_class->module != privateModule || !strcmp(prop->_class->name, "float") || !strcmp(prop->_class->name, "double")) && ((struct __ecereNameSpace__ecere__com__Module *)(((char *)prop->_class->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->importType != 1)
dllImport = 1;
}
if(!symbol->type)
{
struct Context * context = SetupTemplatesContext(prop->_class);

symbol->type = ProcessTypeString(prop->dataTypeString, 0);
FinishTemplatesContext(context);
}
if((prop->Get && !symbol->__anon2.__anon2.externalGet) || (prop->Set && !symbol->__anon2.__anon2.externalSet))
{
if(prop->_class->type == 0 && prop->_class->structSize)
instExternal = DeclareStruct((((void *)0)), "ecere::com::Instance", 0, 1);
structExternal = DeclareStruct((((void *)0)), prop->_class->fullName, prop->_class->type != 1, 0);
}
if(prop->Get && !symbol->__anon2.__anon2.externalGet)
{
struct Declaration * decl;
struct __ecereNameSpace__ecere__sys__OldList * specifiers, * declarators;
struct Declarator * d;
struct __ecereNameSpace__ecere__sys__OldList * params;
struct Specifier * spec = (((void *)0));
struct External * external;
struct Declarator * typeDecl;
unsigned int simple = 0;
unsigned int needReference;

specifiers = MkList();
declarators = MkList();
params = MkList();
ListAdd(params, MkTypeName(MkListOne(MkSpecifierName(prop->_class->fullName)), MkDeclaratorIdentifier(MkIdentifier("this"))));
d = MkDeclaratorIdentifier(MkIdentifier(getName));
if(dllImport)
d = MkDeclaratorBrackets(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), d));
{
struct Context * context = SetupTemplatesContext(prop->_class);

typeDecl = SpecDeclFromString(prop->dataTypeString, specifiers, (((void *)0)));
FinishTemplatesContext(context);
}
needReference = !typeDecl || typeDecl->type == 1;
for(spec = (*specifiers).first; spec; spec = spec->next)
{
if(spec->type == 1)
{
struct Symbol * classSym = spec->__anon1.__anon1.symbol;

if(needReference)
{
symbol->_class = classSym->__anon1.registered;
if(classSym->__anon1.registered && classSym->__anon1.registered->type == 1)
simple = 1;
}
break;
}
}
if(!simple)
d = PlugDeclarator(typeDecl, d);
else
{
ListAdd(params, MkTypeName(specifiers, PlugDeclarator(typeDecl, MkDeclaratorIdentifier(MkIdentifier("value")))));
specifiers = MkList();
}
d = MkDeclaratorFunction(d, params);
if(dllImport)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*specifiers), (((void *)0)), MkSpecifier(EXTERN));
else if(prop->_class->symbol && ((struct Symbol *)prop->_class->symbol)->isStatic)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*specifiers), (((void *)0)), MkSpecifier(STATIC));
if(simple)
ListAdd(specifiers, MkSpecifier(VOID));
ListAdd(declarators, MkInitDeclarator(d, (((void *)0))));
decl = MkDeclaration(specifiers, declarators);
external = MkExternalDeclaration(decl);
if(structExternal)
__ecereMethod_External_CreateEdge(external, structExternal, 0);
if(instExternal)
__ecereMethod_External_CreateEdge(external, instExternal, 0);
if(spec)
DeclareStruct(external, spec->__anon1.__anon1.name, 0, needReference);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*ast), external);
external->symbol = symbol;
symbol->__anon2.__anon2.externalGet = external;
ReplaceThisClassSpecifiers(specifiers, prop->_class);
if(typeDecl)
FreeDeclarator(typeDecl);
}
if(prop->Set && !symbol->__anon2.__anon2.externalSet)
{
struct Declaration * decl;
struct __ecereNameSpace__ecere__sys__OldList * specifiers, * declarators;
struct Declarator * d;
struct __ecereNameSpace__ecere__sys__OldList * params;
struct Specifier * spec = (((void *)0));
struct External * external;
struct Declarator * typeDecl;
unsigned int needReference;

declarators = MkList();
params = MkList();
if(!prop->conversion || prop->_class->type == 1)
{
ListAdd(params, MkTypeName(MkListOne(MkSpecifierName(prop->_class->fullName)), MkDeclaratorIdentifier(MkIdentifier("this"))));
}
specifiers = MkList();
{
struct Context * context = SetupTemplatesContext(prop->_class);

typeDecl = d = SpecDeclFromString(prop->dataTypeString, specifiers, MkDeclaratorIdentifier(MkIdentifier("value")));
FinishTemplatesContext(context);
}
if(!strcmp(prop->_class->base->fullName, "eda::Row") || !strcmp(prop->_class->base->fullName, "eda::Id"))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*specifiers), (((void *)0)), MkSpecifier(CONST));
ListAdd(params, MkTypeName(specifiers, d));
d = MkDeclaratorIdentifier(MkIdentifier(setName));
if(dllImport)
d = MkDeclaratorBrackets(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), d));
d = MkDeclaratorFunction(d, params);
needReference = !typeDecl || typeDecl->type == 1;
for(spec = (*specifiers).first; spec; spec = spec->next)
{
if(spec->type == 1)
{
struct Symbol * classSym = spec->__anon1.__anon1.symbol;

if(needReference)
symbol->_class = classSym->__anon1.registered;
break;
}
}
ListAdd(declarators, MkInitDeclarator(d, (((void *)0))));
specifiers = MkList();
if(dllImport)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*specifiers), (((void *)0)), MkSpecifier(EXTERN));
else if(prop->_class->symbol && ((struct Symbol *)prop->_class->symbol)->isStatic)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*specifiers), (((void *)0)), MkSpecifier(STATIC));
if(!prop->conversion || prop->_class->type == 1)
ListAdd(specifiers, MkSpecifier(VOID));
else
ListAdd(specifiers, MkSpecifierName(prop->_class->fullName));
decl = MkDeclaration(specifiers, declarators);
external = MkExternalDeclaration(decl);
if(structExternal)
__ecereMethod_External_CreateEdge(external, structExternal, 0);
if(instExternal)
__ecereMethod_External_CreateEdge(external, instExternal, 0);
if(spec)
DeclareStruct(external, spec->__anon1.__anon1.name, 0, needReference);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*ast), external);
external->symbol = symbol;
symbol->__anon2.__anon2.externalSet = external;
ReplaceThisClassSpecifiers(specifiers, prop->_class);
}
if(!symbol->__anon2.__anon2.externalPtr)
{
struct Declaration * decl;
struct External * external;
struct __ecereNameSpace__ecere__sys__OldList * specifiers = MkList();
char propName[1024];

if(imported)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*specifiers), (((void *)0)), MkSpecifier(EXTERN));
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*specifiers), (((void *)0)), MkSpecifier(STATIC));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*specifiers), MkSpecifierExtended(MkExtDeclAttrib(MkAttrib(ATTRIB, MkListOne(MkAttribute(__ecereNameSpace__ecere__sys__CopyString("unused"), (((void *)0))))))));
}
ListAdd(specifiers, MkSpecifierName("Property"));
strcpy(propName, "__ecereProp_");
FullClassNameCat(propName, prop->_class->fullName, 0);
strcat(propName, "_");
FullClassNameCat(propName, prop->name, 1);
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();

ListAdd(list, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(propName)), (((void *)0))));
if(!imported)
{
strcpy(propName, "__ecerePropM_");
FullClassNameCat(propName, prop->_class->fullName, 0);
strcat(propName, "_");
FullClassNameCat(propName, prop->name, 1);
ListAdd(list, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(propName)), (((void *)0))));
}
decl = MkDeclaration(specifiers, list);
}
external = MkExternalDeclaration(decl);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), curExternal->prev, external);
external->symbol = symbol;
symbol->__anon2.__anon2.externalPtr = external;
}
if(inCompiler && neededBy)
{
if(symbol->__anon2.__anon2.externalPtr)
__ecereMethod_External_CreateUniqueEdge(neededBy, symbol->__anon2.__anon2.externalPtr, 0);
if(symbol->__anon2.__anon2.externalGet)
__ecereMethod_External_CreateUniqueEdge(neededBy, symbol->__anon2.__anon2.externalGet, symbol->__anon2.__anon2.externalGet->type == 0);
if(symbol->__anon2.__anon2.externalSet)
__ecereMethod_External_CreateUniqueEdge(neededBy, symbol->__anon2.__anon2.externalSet, symbol->__anon2.__anon2.externalSet->type == 0);
}
}

static void ProcessDeclarator(struct Declarator *  decl, unsigned int isFunction);

void DeclareMethod(struct External * neededFor, struct __ecereNameSpace__ecere__com__Method * method, const char * name)
{
struct Symbol * symbol = method->symbol;

if(!symbol || (!symbol->__anon2.__anon1.pointerExternal && (!symbol->__anon2.__anon3.methodCodeExternal || method->type == 1)))
{
unsigned int dllImport = 0;

if(!method->dataType)
method->dataType = ProcessTypeString(method->dataTypeString, 0);
{
if(!symbol || method->type == 1)
{
struct Symbol * classSym;

if(!method->_class->symbol)
method->_class->symbol = FindClass(method->_class->fullName);
classSym = method->_class->symbol;
if(!classSym->_import)
{
struct ModuleImport * module;

if(method->_class->module && ((struct __ecereNameSpace__ecere__com__Module *)(((char *)method->_class->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name)
module = FindModule(method->_class->module);
else
module = mainModule;
classSym->_import = __extension__ ({
struct ClassImport * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassImport);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(method->_class->fullName), __ecereInstance1->isRemote = method->_class->isRemote, __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&module->classes, classSym->_import);
}
if(!symbol)
{
symbol = method->symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);
}
if(!symbol->_import)
{
symbol->_import = (struct ClassImport *)__extension__ ({
struct MethodImport * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_MethodImport);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(method->name), __ecereInstance1->isVirtual = method->type == 1, __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&classSym->_import->methods, symbol->_import);
}
if(!symbol)
{
symbol->type = method->dataType;
if(symbol->type)
symbol->type->refCount++;
}
}
if(!method->dataType->dllExport)
{
if((method->_class->module != privateModule || !strcmp(method->_class->name, "float") || !strcmp(method->_class->name, "double")) && ((struct __ecereNameSpace__ecere__com__Module *)(((char *)method->_class->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->importType != 1)
dllImport = 1;
}
}
if(inCompiler)
{
struct Declaration * decl;
struct __ecereNameSpace__ecere__sys__OldList * specifiers, * declarators;
struct Declarator * d;
struct Declarator * funcDecl;
struct External * external;

specifiers = MkList();
declarators = MkList();
if(dllImport)
ListAdd(specifiers, MkSpecifier(EXTERN));
else if(method->_class->symbol && ((struct Symbol *)method->_class->symbol)->isStatic)
ListAdd(specifiers, MkSpecifier(STATIC));
if(method->type == 1)
{
if(!dllImport && !(*specifiers).count)
ListAdd(specifiers, MkSpecifier(EXTERN));
ListAdd(specifiers, MkSpecifier(INT));
d = MkDeclaratorIdentifier(MkIdentifier(name));
}
else
{
d = MkDeclaratorIdentifier(MkIdentifier(name));
if(dllImport)
d = MkDeclaratorBrackets(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), d));
{
struct Context * context = SetupTemplatesContext(method->_class);

d = SpecDeclFromString(method->dataTypeString, specifiers, d);
FinishTemplatesContext(context);
}
funcDecl = GetFuncDecl(d);
if(dllImport)
{
struct Specifier * spec, * next;

for(spec = (*specifiers).first; spec; spec = next)
{
next = spec->next;
if(spec->type == 5)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*specifiers), spec);
FreeSpecifier(spec);
}
}
}
if(method->dataType && !method->dataType->__anon1.__anon2.staticMethod)
{
if(funcDecl && funcDecl->__anon1.function.parameters && (*funcDecl->__anon1.function.parameters).count)
{
struct __ecereNameSpace__ecere__com__Class * _class = method->dataType->__anon1.__anon2.thisClass ? method->dataType->__anon1.__anon2.thisClass->__anon1.registered : method->_class;
struct TypeName * thisParam = MkTypeName(MkListOne(MkSpecifierName(method->dataType->__anon1.__anon2.thisClass ? method->dataType->__anon1.__anon2.thisClass->string : method->_class->fullName)), (_class && _class->type == 1000) ? MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(MkIdentifier("this"))) : MkDeclaratorIdentifier(MkIdentifier("this")));
struct TypeName * firstParam = ((struct TypeName *)(*funcDecl->__anon1.function.parameters).first);
struct Specifier * firstSpec = firstParam->qualifiers ? (*firstParam->qualifiers).first : (((void *)0));

if(firstSpec && firstSpec->type == 0 && firstSpec->__anon1.specifier == VOID && !firstParam->declarator)
{
struct TypeName * param = (*funcDecl->__anon1.function.parameters).first;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*funcDecl->__anon1.function.parameters), param);
FreeTypeName(param);
}
if(!funcDecl->__anon1.function.parameters)
funcDecl->__anon1.function.parameters = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->__anon1.function.parameters), (((void *)0)), thisParam);
}
}
}
ProcessDeclarator(d, 1);
ListAdd(declarators, MkInitDeclarator(d, (((void *)0))));
decl = MkDeclaration(specifiers, declarators);
ReplaceThisClassSpecifiers(specifiers, method->_class);
external = MkExternalDeclaration(decl);
external->symbol = symbol;
symbol->__anon2.__anon1.pointerExternal = external;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*ast), external);
DeclareStruct(external, method->_class->fullName, 1, 1);
if(method->dataType)
DeclareType(external, method->dataType, 1, 1);
}
}
if(inCompiler && neededFor)
{
struct External * external = symbol->__anon2.__anon1.pointerExternal ? symbol->__anon2.__anon1.pointerExternal : symbol->__anon2.__anon3.methodCodeExternal;

__ecereMethod_External_CreateUniqueEdge(neededFor, external, external->type == 0);
}
}

struct __ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction
{
struct __ecereNameSpace__ecere__com__GlobalFunction * prev;
struct __ecereNameSpace__ecere__com__GlobalFunction * next;
const char *  name;
int (*  function)();
struct __ecereNameSpace__ecere__com__Instance * module;
struct __ecereNameSpace__ecere__com__NameSpace *  nameSpace;
const char *  dataTypeString;
struct Type * dataType;
void *  symbol;
} ecere_gcc_struct;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_FindFunction(struct __ecereNameSpace__ecere__com__Instance * module, const char *  name);

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(const char *  name, const char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

unsigned int DeclareFunction(struct External * neededFor, struct __ecereNameSpace__ecere__com__GlobalFunction * function, char * name)
{
struct Symbol * symbol = function->symbol;

if(!symbol || !symbol->__anon2.__anon1.pointerExternal)
{
unsigned int imported = 0;
unsigned int dllImport = 0;

if(!function->dataType)
{
function->dataType = ProcessTypeString(function->dataTypeString, 0);
if(!function->dataType->__anon1.__anon2.thisClass)
function->dataType->__anon1.__anon2.staticMethod = 1;
}
if(inCompiler)
{
if(!symbol)
{
struct ModuleImport * module = FindModule(function->module);

symbol = function->symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);
if(module && module->name)
{
if(!function->dataType->dllExport)
{
symbol->_import = (struct ClassImport *)__extension__ ({
struct FunctionImport * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_FunctionImport);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(function->name), __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&module->functions, symbol->_import);
}
}
{
symbol->type = ProcessTypeString(function->dataTypeString, 0);
if(!symbol->type->__anon1.__anon2.thisClass)
symbol->type->__anon1.__anon2.staticMethod = 1;
}
}
imported = symbol->_import ? 1 : 0;
if(imported && function->module != privateModule && ((struct __ecereNameSpace__ecere__com__Module *)(((char *)function->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->importType != 1)
dllImport = 1;
}
if(inCompiler)
{
{
struct Declaration * decl;
struct __ecereNameSpace__ecere__sys__OldList * specifiers, * declarators;
struct Declarator * d;
struct Declarator * funcDecl;
struct External * external;

specifiers = MkList();
declarators = MkList();
ListAdd(specifiers, MkSpecifier(EXTERN));
d = MkDeclaratorIdentifier(MkIdentifier(imported ? name : function->name));
if(dllImport)
d = MkDeclaratorBrackets(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), d));
d = SpecDeclFromString(function->dataTypeString, specifiers, d);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)function->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->importType == 1)
{
struct Specifier * spec;

for(spec = (*specifiers).first; spec; spec = spec->next)
if(spec->type == 5 && spec->__anon1.__anon1.extDecl && spec->__anon1.__anon1.extDecl->type == 0 && !strcmp(spec->__anon1.__anon1.extDecl->__anon1.s, "dllexport"))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*specifiers), spec);
FreeSpecifier(spec);
break;
}
}
funcDecl = GetFuncDecl(d);
if(funcDecl && !funcDecl->__anon1.function.parameters)
{
funcDecl->__anon1.function.parameters = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->__anon1.function.parameters), (((void *)0)), MkTypeName(MkListOne(MkSpecifier(VOID)), (((void *)0))));
}
ListAdd(declarators, MkInitDeclarator(d, (((void *)0))));
{
struct Context * oldCtx = curContext;

curContext = globalContext;
decl = MkDeclaration(specifiers, declarators);
curContext = oldCtx;
}
external = MkExternalDeclaration(decl);
if(ast)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*ast), external);
external->symbol = symbol;
symbol->__anon2.__anon1.pointerExternal = external;
DeclareType(external, function->dataType, 1, 1);
}
}
}
if(inCompiler && neededFor && symbol && symbol->__anon2.__anon1.pointerExternal)
__ecereMethod_External_CreateUniqueEdge(neededFor, symbol->__anon2.__anon1.pointerExternal, symbol->__anon2.__anon1.pointerExternal->type == 0);
return (symbol && symbol->_import && function->module != privateModule && ((struct __ecereNameSpace__ecere__com__Module *)(((char *)function->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->importType != 1) ? 1 : 0;
}

void DeclareFunctionUtil(struct External * neededBy, const char * s)
{
struct __ecereNameSpace__ecere__com__GlobalFunction * function = __ecereNameSpace__ecere__com__eSystem_FindFunction(privateModule, s);

if(function)
{
char name[1024];

name[0] = 0;
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)function->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->importType != 1 && (!function->dataType || !function->dataType->dllExport))
strcpy(name, "__ecereFunction_");
FullClassNameCat(name, s, 0);
DeclareFunction(neededBy, function, name);
}
else if(neededBy)
FindSymbol(s, globalContext, globalContext, 0, 0);
}

struct __ecereNameSpace__ecere__com__SubModule;

struct __ecereNameSpace__ecere__com__SubModule
{
struct __ecereNameSpace__ecere__com__SubModule * prev;
struct __ecereNameSpace__ecere__com__SubModule * next;
struct __ecereNameSpace__ecere__com__Instance * module;
int importMode;
} ecere_gcc_struct;

unsigned int ModuleVisibility(struct __ecereNameSpace__ecere__com__Instance * searchIn, struct __ecereNameSpace__ecere__com__Instance * searchFor)
{
struct __ecereNameSpace__ecere__com__SubModule * subModule;

if(searchFor == searchIn)
return 1;
for(subModule = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)searchIn + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->modules.first; subModule; subModule = subModule->next)
{
if(subModule->importMode == 1 || searchIn == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)searchIn + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application)
{
if(ModuleVisibility(subModule->module, searchFor))
return 1;
}
}
return 0;
}

unsigned int MatchTypes(struct Type *  source, struct Type *  dest, struct __ecereNameSpace__ecere__sys__OldList *  conversions, struct __ecereNameSpace__ecere__com__Class *  owningClassSource, struct __ecereNameSpace__ecere__com__Class *  owningClassDest, unsigned int doConversion, unsigned int enumBaseType, unsigned int acceptReversedParams, unsigned int isConversionExploration, unsigned int warnConst);

unsigned int MatchWithEnums_NameSpace(struct __ecereNameSpace__ecere__com__NameSpace * nameSpace, struct Expression * sourceExp, struct Type * dest, char * string, struct __ecereNameSpace__ecere__sys__OldList * conversions)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link;

for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&nameSpace->classes); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
{
struct __ecereNameSpace__ecere__com__Class * _class = link->data;

if(_class->type == 4)
{
struct __ecereNameSpace__ecere__sys__OldList converts =
{
0, 0, 0, 0, 0
};
struct Type * type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

type->kind = 8;
if(!_class->symbol)
_class->symbol = FindClass(_class->fullName);
type->__anon1._class = _class->symbol;
if(MatchTypes(type, dest, &converts, (((void *)0)), (((void *)0)), dest->kind != 8 || !dest->__anon1._class || strcmp(dest->__anon1._class->string, "bool"), 0, 0, 0, 0))
{
struct __ecereNameSpace__ecere__sys__NamedLink64 * value;
struct __ecereNameSpace__ecere__com__Class * enumClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "enum");

if(enumClass)
{
struct __ecereNameSpace__ecere__com__Class * baseClass;

for(baseClass = _class; baseClass && baseClass->type == 4; baseClass = baseClass->base)
{
struct __ecereNameSpace__ecere__com__EnumClassData * e = (baseClass ? ((void *)(((char *)baseClass->data) + enumClass->offsetClass)) : (((void *)0)));

for(value = e->values.first; value; value = value->next)
{
if(!strcmp(value->name, string))
break;
}
if(value)
{
FreeType(sourceExp->expType);
sourceExp->isConstant = 1;
sourceExp->expType = MkClassType(baseClass->fullName);
if(inCompiler || inPreCompiler || inDebugger)
{
char constant[256];

FreeExpContents(sourceExp);
sourceExp->type = 2;
if(!strcmp(baseClass->dataTypeString, "int") || !strcmp(baseClass->dataTypeString, "int64") || !strcmp(baseClass->dataTypeString, "short") || !strcmp(baseClass->dataTypeString, "char"))
sprintf(constant, ((__runtimePlatform == 1) ? "%I64d" : "%lld"), value->data);
else
sprintf(constant, ((__runtimePlatform == 1) ? "0x%I64XLL" : "0x%llXLL"), value->data);
sourceExp->__anon1.__anon1.constant = __ecereNameSpace__ecere__sys__CopyString(constant);
}
while(converts.first)
{
struct Conversion * convert = converts.first;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&converts, convert);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(conversions, convert);
}
((type ? __extension__ ({
void * __ecerePtrToDelete = (type);

__ecereClass_Type->Destructor ? __ecereClass_Type->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), type = 0);
return 1;
}
}
}
}
if(converts.first)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&converts, (void *)(FreeConvert));
((type ? __extension__ ({
void * __ecerePtrToDelete = (type);

__ecereClass_Type->Destructor ? __ecereClass_Type->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), type = 0);
}
}
for(nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&nameSpace->nameSpaces); nameSpace != (((void *)0)); nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)nameSpace)))
if(MatchWithEnums_NameSpace(nameSpace, sourceExp, dest, string, conversions))
return 1;
return 0;
}

unsigned int MatchWithEnums_Module(struct __ecereNameSpace__ecere__com__Instance * mainModule, struct Expression * sourceExp, struct Type * dest, char * string, struct __ecereNameSpace__ecere__sys__OldList * conversions)
{
struct __ecereNameSpace__ecere__com__Instance * module;

if(MatchWithEnums_NameSpace(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)mainModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->systemNameSpace, sourceExp, dest, string, conversions))
return 1;
if(MatchWithEnums_NameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)mainModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace, sourceExp, dest, string, conversions))
return 1;
if(MatchWithEnums_NameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)mainModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace, sourceExp, dest, string, conversions))
return 1;
for(module = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)mainModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->allModules.first; module; module = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->next)
{
if(ModuleVisibility(mainModule, module) && MatchWithEnums_NameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace, sourceExp, dest, string, conversions))
return 1;
}
return 0;
}

int ComputeTypeSize(struct Type *  type);

void ComputeClassMembers(struct __ecereNameSpace__ecere__com__Class * _class, unsigned int isMember)
{
struct __ecereNameSpace__ecere__com__DataMember * member = isMember ? (struct __ecereNameSpace__ecere__com__DataMember *)_class : (((void *)0));
struct Context * context = isMember ? (((void *)0)) : SetupTemplatesContext(_class);

if(member || ((_class->type == 2 || _class->type == 0 || _class->type == 1 || _class->type == 5) && (_class->type == 2 || (!_class->structSize || _class->structSize == _class->offset)) && _class->computeSize))
{
int unionMemberOffset = 0;
int bitFields = 0;

if(member)
{
member->memberOffset = 0;
if(targetBits < sizeof(void *) * 8)
member->structAlignment = 0;
}
else if(targetBits < sizeof(void *) * 8)
_class->structAlignment = 0;
if(!member && ((_class->type == 0 || _class->type == 5) || (_class->type == 1 && _class->memberOffset && _class->memberOffset > _class->base->structSize)))
_class->memberOffset = (_class->base && _class->type == 1) ? _class->base->structSize : 0;
if(!member && _class->destructionWatchOffset)
_class->memberOffset += sizeof(struct __ecereNameSpace__ecere__sys__OldList);
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember;

for(dataMember = member ? member->members.first : _class->membersAndProperties.first; dataMember; dataMember = dataMember->next)
{
if(!dataMember->isProperty)
{
if(dataMember->type == 0 && dataMember->dataTypeString && !dataMember->dataType)
{
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0);
}
}
}
}
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember;

for(dataMember = member ? member->members.first : _class->membersAndProperties.first; dataMember; dataMember = dataMember->next)
{
if(!dataMember->isProperty && (dataMember->type != 0 || dataMember->dataTypeString))
{
if(!isMember && _class->type == 2 && dataMember->dataType)
{
struct __ecereNameSpace__ecere__com__BitMember * bitMember = (struct __ecereNameSpace__ecere__com__BitMember *)dataMember;
uint64 mask = 0;
int d;

ComputeTypeSize(dataMember->dataType);
if(bitMember->pos == -1)
bitMember->pos = _class->memberOffset;
if(!bitMember->size)
bitMember->size = dataMember->dataType->size * 8;
_class->memberOffset = bitMember->pos + bitMember->size;
for(d = 0; d < bitMember->size; d++)
{
if(d)
mask <<= 1;
mask |= 1;
}
if(bitMember->pos + bitMember->size > _class->typeSize * 8 || bitMember->pos == 64)
{
if(inCompiler)
Compiler_Error("overflowing bits in %s: bit class member %s at position %d\n", _class->name, bitMember->name, bitMember->pos, "\n");
else
__ecereNameSpace__ecere__com__PrintLn(__ecereClass_char__PTR_, "overflowing bits in ", __ecereClass_char__PTR_, _class->name, __ecereClass_char__PTR_, ": bit class member ", __ecereClass_char__PTR_, bitMember->name, __ecereClass_char__PTR_, " at position ", __ecereClass_int, (void *)&bitMember->pos, (void *)0);
}
bitMember->mask = mask << bitMember->pos;
}
else if(dataMember->type == 0 && dataMember->dataType)
{
int size;
int alignment = 0;

if(dataMember->dataType->kind != 8 || ((!dataMember->dataType->__anon1._class || !dataMember->dataType->__anon1._class->__anon1.registered || dataMember->dataType->__anon1._class->__anon1.registered != _class || _class->type != 1)))
ComputeTypeSize(dataMember->dataType);
if(dataMember->dataType->bitFieldCount)
{
bitFields += dataMember->dataType->bitFieldCount;
size = 0;
}
else
{
if(bitFields)
{
int size = (bitFields + 7) / 8;

if(isMember)
{
int __simpleStruct0;

if(alignment)
{
short __simpleStruct0;

member->structAlignment = (__simpleStruct0 = member->structAlignment, (__simpleStruct0 > alignment) ? __simpleStruct0 : alignment);
if(member->memberOffset % alignment)
member->memberOffset += alignment - (member->memberOffset % alignment);
}
dataMember->offset = member->memberOffset;
if(member->type == 1)
unionMemberOffset = (__simpleStruct0 = dataMember->dataType->size, (unionMemberOffset > __simpleStruct0) ? unionMemberOffset : __simpleStruct0);
else
{
member->memberOffset += size;
}
}
else
{
if(alignment)
{
short __simpleStruct0;

_class->structAlignment = (__simpleStruct0 = _class->structAlignment, (__simpleStruct0 > alignment) ? __simpleStruct0 : alignment);
if(_class->memberOffset % alignment)
_class->memberOffset += alignment - (_class->memberOffset % alignment);
}
dataMember->offset = _class->memberOffset;
_class->memberOffset += size;
}
bitFields = 0;
}
size = dataMember->dataType->size;
alignment = dataMember->dataType->alignment;
}
if(isMember)
{
int __simpleStruct0;

if(alignment)
{
short __simpleStruct0;

member->structAlignment = (__simpleStruct0 = member->structAlignment, (__simpleStruct0 > alignment) ? __simpleStruct0 : alignment);
if(member->memberOffset % alignment)
member->memberOffset += alignment - (member->memberOffset % alignment);
}
dataMember->offset = member->memberOffset;
if(member->type == 1)
unionMemberOffset = (__simpleStruct0 = dataMember->dataType->size, (unionMemberOffset > __simpleStruct0) ? unionMemberOffset : __simpleStruct0);
else
{
member->memberOffset += size;
}
}
else
{
if(alignment)
{
short __simpleStruct0;

_class->structAlignment = (__simpleStruct0 = _class->structAlignment, (__simpleStruct0 > alignment) ? __simpleStruct0 : alignment);
if(_class->memberOffset % alignment)
_class->memberOffset += alignment - (_class->memberOffset % alignment);
}
dataMember->offset = _class->memberOffset;
_class->memberOffset += size;
}
}
else
{
int alignment;

ComputeClassMembers((struct __ecereNameSpace__ecere__com__Class *)dataMember, 1);
alignment = dataMember->structAlignment;
if(isMember)
{
int __simpleStruct0;

if(alignment)
{
short __simpleStruct0;

if(member->memberOffset % alignment)
member->memberOffset += alignment - (member->memberOffset % alignment);
member->structAlignment = (__simpleStruct0 = member->structAlignment, (__simpleStruct0 > alignment) ? __simpleStruct0 : alignment);
}
dataMember->offset = member->memberOffset;
if(member->type == 1)
unionMemberOffset = (__simpleStruct0 = dataMember->memberOffset, (unionMemberOffset > __simpleStruct0) ? unionMemberOffset : __simpleStruct0);
else
member->memberOffset += dataMember->memberOffset;
}
else
{
if(alignment)
{
short __simpleStruct0;

if(_class->memberOffset % alignment)
_class->memberOffset += alignment - (_class->memberOffset % alignment);
_class->structAlignment = (__simpleStruct0 = _class->structAlignment, (__simpleStruct0 > alignment) ? __simpleStruct0 : alignment);
}
dataMember->offset = _class->memberOffset;
_class->memberOffset += dataMember->memberOffset;
}
}
}
}
if(bitFields)
{
int alignment = 0;
int size = (bitFields + 7) / 8;

if(isMember)
{
int __simpleStruct0;

if(alignment)
{
short __simpleStruct0;

member->structAlignment = (__simpleStruct0 = member->structAlignment, (__simpleStruct0 > alignment) ? __simpleStruct0 : alignment);
if(member->memberOffset % alignment)
member->memberOffset += alignment - (member->memberOffset % alignment);
}
if(member->type == 1)
unionMemberOffset = (__simpleStruct0 = dataMember->dataType->size, (unionMemberOffset > __simpleStruct0) ? unionMemberOffset : __simpleStruct0);
else
{
member->memberOffset += size;
}
}
else
{
if(alignment)
{
short __simpleStruct0;

_class->structAlignment = (__simpleStruct0 = _class->structAlignment, (__simpleStruct0 > alignment) ? __simpleStruct0 : alignment);
if(_class->memberOffset % alignment)
_class->memberOffset += alignment - (_class->memberOffset % alignment);
}
_class->memberOffset += size;
}
bitFields = 0;
}
}
if(member && member->type == 1)
{
member->memberOffset = unionMemberOffset;
}
if(!isMember)
{
if(_class->type != 2)
{
int extra = 0;

if(_class->structAlignment)
{
if(_class->memberOffset % _class->structAlignment)
extra += _class->structAlignment - (_class->memberOffset % _class->structAlignment);
}
_class->structSize = (_class->base ? (_class->base->templateClass ? _class->base->templateClass->structSize : _class->base->structSize) : 0) + _class->memberOffset + extra;
if(!member)
{
struct __ecereNameSpace__ecere__com__Property * prop;

for(prop = _class->membersAndProperties.first; prop; prop = prop->next)
{
if(prop->isProperty && prop->isWatchable)
{
prop->watcherOffset = _class->structSize;
_class->structSize += sizeof(struct __ecereNameSpace__ecere__sys__OldList);
}
}
}
{
struct __ecereNameSpace__ecere__sys__OldLink * derivative;

for(derivative = _class->derivatives.first; derivative; derivative = derivative->next)
{
struct __ecereNameSpace__ecere__com__Class * deriv = derivative->data;

if(deriv->computeSize)
{
deriv->offset = (_class->type == 5 ? _class->structSize : _class->structSize);
deriv->memberOffset = 0;
deriv->structSize = deriv->offset;
ComputeClassMembers(deriv, 0);
}
}
}
}
}
}
if(context)
FinishTemplatesContext(context);
}

int AddMembers(struct External * neededBy, struct __ecereNameSpace__ecere__sys__OldList * declarations, struct __ecereNameSpace__ecere__com__Class * _class, unsigned int isMember, unsigned int * retSize, struct __ecereNameSpace__ecere__com__Class * topClass, unsigned int * addedPadding)
{
struct __ecereNameSpace__ecere__com__DataMember * topMember = isMember ? (struct __ecereNameSpace__ecere__com__DataMember *)_class : (((void *)0));
unsigned int totalSize = 0;
unsigned int maxSize = 0;
int alignment;
unsigned int size;
static int paddingID = 0;
struct __ecereNameSpace__ecere__com__DataMember * member;
int anonID = 1;
struct Context * context = isMember ? (((void *)0)) : SetupTemplatesContext(_class);

if(addedPadding)
*addedPadding = 0;
paddingID++;
if(!isMember && _class->base)
{
maxSize = _class->structSize;
{
if(_class->type == 1 || _class->type == 5)
AddMembers(neededBy, declarations, _class->base, 0, &totalSize, topClass, (((void *)0)));
else
{
unsigned int baseSize = _class->base->templateClass ? _class->base->templateClass->structSize : _class->base->structSize;

if(maxSize > baseSize)
maxSize -= baseSize;
else
maxSize = 0;
}
}
}
for(member = isMember ? topMember->members.first : _class->membersAndProperties.first; member; member = member->next)
{
if(!member->isProperty)
{
switch(member->type)
{
case 0:
{
if(member->dataTypeString)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList(), * decls = MkList();
struct Declarator * decl;

decl = SpecDeclFromString(member->dataTypeString, specs, MkDeclaratorIdentifier(MkIdentifier(member->name)));
ListAdd(decls, MkStructDeclarator(decl, (((void *)0))));
ListAdd(declarations, MkClassDefDeclaration(MkStructDeclaration(specs, decls, (((void *)0)))));
if(!member->dataType)
member->dataType = ProcessType(specs, decl);
ReplaceThisClassSpecifiers(specs, topClass);
{
struct Type * type = ProcessType(specs, decl);

DeclareType(neededBy, member->dataType, 1, 0);
FreeType(type);
}
ComputeTypeSize(member->dataType);
size = member->dataType->size;
alignment = member->dataType->alignment;
if(alignment)
{
if(totalSize % alignment)
totalSize += alignment - (totalSize % alignment);
}
totalSize += size;
}
break;
}
case 1:
case 2:
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList(), * list = MkList();
char id[100];

sprintf(id, "__anon%d", anonID++);
size = 0;
AddMembers(neededBy, list, (struct __ecereNameSpace__ecere__com__Class *)member, 1, &size, topClass, (((void *)0)));
ListAdd(specs, MkStructOrUnion((member->type == 1) ? 4 : 3, (((void *)0)), list));
ListAdd(declarations, MkClassDefDeclaration(MkStructDeclaration(specs, MkListOne(MkDeclaratorIdentifier(MkIdentifier(id))), (((void *)0)))));
alignment = member->structAlignment;
if(alignment)
{
if(totalSize % alignment)
totalSize += alignment - (totalSize % alignment);
}
totalSize += size;
break;
}
}
}
}
if(retSize)
{
unsigned int __simpleStruct0;

if(topMember && topMember->type == 1)
*retSize = (__simpleStruct0 = *retSize, (__simpleStruct0 > totalSize) ? __simpleStruct0 : totalSize);
else
*retSize += totalSize;
}
if(totalSize < maxSize && _class->type != 1000)
{
int autoPadding = 0;

if(!isMember && _class->structAlignment && totalSize % _class->structAlignment)
autoPadding = _class->structAlignment - (totalSize % _class->structAlignment);
if(totalSize + autoPadding < maxSize)
{
char sizeString[50];
char * paddingString = __ecereNameSpace__ecere__com__PrintString(__ecereClass_char__PTR_, "__ecere_padding", __ecereClass_int, (void *)&paddingID, (void *)0);

sprintf(sizeString, "%d", maxSize - totalSize);
ListAdd(declarations, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifier(CHAR)), MkListOne(MkDeclaratorArray(MkDeclaratorIdentifier(MkIdentifier(paddingString)), MkExpConstant(sizeString))), (((void *)0)))));
if(addedPadding)
*addedPadding = 1;
(__ecereNameSpace__ecere__com__eSystem_Delete(paddingString), paddingString = 0);
}
}
if(context)
FinishTemplatesContext(context);
paddingID--;
return topMember ? topMember->memberID : _class->memberID;
}

unsigned int MatchTypes(struct Type * source, struct Type * dest, struct __ecereNameSpace__ecere__sys__OldList * conversions, struct __ecereNameSpace__ecere__com__Class * owningClassSource, struct __ecereNameSpace__ecere__com__Class * owningClassDest, unsigned int doConversion, unsigned int enumBaseType, unsigned int acceptReversedParams, unsigned int isConversionExploration, unsigned int warnConst)
{
if(source && dest)
{
if(warnConst)
CheckConstCompatibility(source, dest, 1);
if(source->kind == 20 && dest->kind != 20)
{
struct Type * type = ProcessTemplateParameterType(source->__anon1.templateParameter);

if(type)
source = type;
}
if(dest->kind == 20 && source->kind != 20)
{
struct Type * type = ProcessTemplateParameterType(dest->__anon1.templateParameter);

if(type)
dest = type;
}
if(dest->classObjectType == 2 && dest->kind != 11)
{
if(source->classObjectType != 3)
return 1;
else
{
if((dest->__anon1._class && strcmp(dest->__anon1._class->string, "class")) || (source->__anon1._class && strcmp(source->__anon1._class->string, "class")))
{
return 1;
}
}
}
else
{
if(source->kind != 11 && source->classObjectType == 3)
return 1;
if(dest->kind != 11 && dest->classObjectType == 3 && source->classObjectType != 2)
return 1;
}
if((dest->kind == 9 && source->kind == 9) || (dest->kind == 10 && source->kind == 10))
{
if((dest->__anon1.__anon1.enumName && source->__anon1.__anon1.enumName && !strcmp(dest->__anon1.__anon1.enumName, source->__anon1.__anon1.enumName)) || (source->__anon1.__anon1.members.first && source->__anon1.__anon1.members.first == dest->__anon1.__anon1.members.first))
return 1;
}
if(dest->kind == 14 && source->kind != 0)
return 1;
if(dest->kind == 13 && dest->__anon1.type->kind == 0 && ((source->kind == 8 && (!source->__anon1._class || !source->__anon1._class->__anon1.registered || source->__anon1._class->__anon1.registered->type == 1 || source->__anon1._class->__anon1.registered->type == 0 || source->__anon1._class->__anon1.registered->type == 5 || source->__anon1._class->__anon1.registered->type == 1000)) || source->kind == 19 || source->kind == 13 || source->kind == 12 || source->kind == 11 || source->kind == 21))
return 1;
if(!isConversionExploration && source->kind == 13 && source->__anon1.type->kind == 0 && ((dest->kind == 8 && (!dest->__anon1._class || !dest->__anon1._class->__anon1.registered || dest->__anon1._class->__anon1.registered->type == 1 || dest->__anon1._class->__anon1.registered->type == 0 || dest->__anon1._class->__anon1.registered->type == 5 || dest->__anon1._class->__anon1.registered->type == 1000)) || dest->kind == 19 || dest->kind == 13 || dest->kind == 12 || dest->kind == 11 || dest->kind == 21))
return 1;
if(((source->kind == 8 && dest->kind == 8) || (source->kind == 19 && dest->kind == 19)) && source->__anon1._class)
{
if(source->__anon1._class->__anon1.registered && source->__anon1._class->__anon1.registered->type == 3)
{
if(conversions != (((void *)0)))
{
if(source->__anon1._class->__anon1.registered == dest->__anon1._class->__anon1.registered)
return 1;
}
else
{
struct __ecereNameSpace__ecere__com__Class * sourceBase, * destBase;

for(sourceBase = source->__anon1._class->__anon1.registered; sourceBase && sourceBase->base->type != 1000; sourceBase = sourceBase->base)
;
for(destBase = dest->__anon1._class->__anon1.registered; destBase && destBase->base->type != 1000; destBase = destBase->base)
;
if(sourceBase == destBase)
return 1;
}
}
else if(source->__anon1._class && dest->__anon1._class && (dest->classObjectType == source->classObjectType || !dest->classObjectType) && (enumBaseType || (!source->__anon1._class->__anon1.registered || source->__anon1._class->__anon1.registered->type != 4) || (!dest->__anon1._class->__anon1.registered || dest->__anon1._class->__anon1.registered->type != 4)) && __ecereNameSpace__ecere__com__eClass_IsDerived(source->__anon1._class->__anon1.registered, dest->__anon1._class->__anon1.registered))
return 1;
else
{
if(dest->__anon1._class && dest->__anon1._class->__anon1.registered && source->__anon1._class && source->__anon1._class->__anon1.registered && (dest->casted || (enumBaseType && dest->__anon1._class->__anon1.registered->type == 4 && (source->kind == 8 || source->__anon1._class->__anon1.registered->type != 4))))
{
if(__ecereNameSpace__ecere__com__eClass_IsDerived(dest->__anon1._class->__anon1.registered, source->__anon1._class->__anon1.registered))
{
return 1;
}
}
else if(dest->__anon1._class && dest->__anon1._class->__anon1.registered && source->__anon1._class && source->__anon1._class->__anon1.registered && dest->__anon1._class->__anon1.registered->templateClass && source->__anon1._class->__anon1.registered->templateClass)
{
if(__ecereNameSpace__ecere__com__eClass_IsDerived(dest->__anon1._class->__anon1.registered->templateClass, source->__anon1._class->__anon1.registered->templateClass))
return 1;
}
}
}
if(source->kind == 19 && dest->kind == 8 && dest->__anon1._class && !strcmp(dest->__anon1._class->string, "ecere::com::Class"))
return 1;
if(doConversion)
{
if(source->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class;

for(_class = source->__anon1._class ? source->__anon1._class->__anon1.registered : (((void *)0)); _class; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__Property * convert;

for(convert = _class->conversions.first; convert; convert = convert->next)
{
if(convert->memberAccess == 1 || _class->module == privateModule)
{
struct Conversion * after = (conversions != (((void *)0))) ? conversions->last : (((void *)0));

if(!convert->dataType)
convert->dataType = ProcessTypeString(convert->dataTypeString, 0);
if((!isConversionExploration || convert->dataType->kind == 8 || !strcmp(_class->name, "String")) && MatchTypes(convert->dataType, dest, conversions, (((void *)0)), (((void *)0)), (convert->dataType->kind == 8 && !strcmp(convert->dataTypeString, "String")) ? 1 : 0, convert->dataType->kind == 8, 0, 1, warnConst))
{
if(!conversions && !convert->Get)
return 1;
else if(conversions != (((void *)0)))
{
if(_class->type == 3 && convert->dataType->kind == 8 && convert->dataType->__anon1._class && convert->dataType->__anon1._class->__anon1.registered && _class->base == convert->dataType->__anon1._class->__anon1.registered->base && (dest->kind != 8 || dest->__anon1._class->__anon1.registered != _class->base))
return 1;
else
{
struct Conversion * conv = (conv = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Conversion), conv->convert = convert, conv->isGet = 1, conv);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(conversions, after, conv);
return 1;
}
}
}
}
}
}
}
if(dest->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class;

for(_class = dest->__anon1._class ? dest->__anon1._class->__anon1.registered : (((void *)0)); _class; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__Property * convert;

for(convert = _class->conversions.first; convert; convert = convert->next)
{
if(convert->memberAccess == 1 || _class->module == privateModule)
{
struct Type * constType = (((void *)0));
unsigned int success = 0;

if(!convert->dataType)
convert->dataType = ProcessTypeString(convert->dataTypeString, 0);
if(warnConst && convert->dataType->kind == 13 && convert->dataType->__anon1.type && dest->constant)
{
struct Type * ptrType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

constType = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->kind = 13, __ecereInstance1->refCount = 1, __ecereInstance1->__anon1.type = ptrType, __ecereInstance1;
});
CopyTypeInto(ptrType, convert->dataType->__anon1.type);
ptrType->constant = 1;
}
if((constType || convert->dataType != dest) && MatchTypes(source, constType ? constType : convert->dataType, conversions, (((void *)0)), (((void *)0)), 1, 0, 0, 1, warnConst))
{
if(!conversions && !convert->Set)
success = 1;
else if(conversions != (((void *)0)))
{
if(_class->type == 3 && convert->dataType->kind == 8 && convert->dataType->__anon1._class && convert->dataType->__anon1._class->__anon1.registered && _class->base == convert->dataType->__anon1._class->__anon1.registered->base && (source->kind != 8 || source->__anon1._class->__anon1.registered != _class->base))
success = 1;
else
{
struct Conversion * conv = (conv = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Conversion), conv->convert = convert, conv);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(conversions, conv);
success = 1;
}
}
}
if(constType)
FreeType(constType);
if(success)
return 1;
}
}
}
if(enumBaseType && dest->__anon1._class && dest->__anon1._class->__anon1.registered && dest->__anon1._class->__anon1.registered->type == 4)
{
if(!dest->__anon1._class->__anon1.registered->dataType)
dest->__anon1._class->__anon1.registered->dataType = ProcessTypeString(dest->__anon1._class->__anon1.registered->dataTypeString, 0);
if(dest->__anon1._class->__anon1.registered->dataType->kind == 8 || source->truth || dest->truth)
{
if(MatchTypes(source, dest->__anon1._class->__anon1.registered->dataType, conversions, (((void *)0)), (((void *)0)), 1, dest->__anon1._class->__anon1.registered->dataType->kind == 8, 0, 0, warnConst))
{
return 1;
}
}
}
}
if(source->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class;

for(_class = source->__anon1._class ? source->__anon1._class->__anon1.registered : (((void *)0)); _class; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__Property * convert;

for(convert = _class->conversions.first; convert; convert = convert->next)
{
if(convert->memberAccess == 1 || _class->module == privateModule)
{
struct Conversion * after = (conversions != (((void *)0))) ? conversions->last : (((void *)0));

if(!convert->dataType)
convert->dataType = ProcessTypeString(convert->dataTypeString, 0);
if(convert->dataType != source && (!isConversionExploration || convert->dataType->kind == 8 || !strcmp(_class->name, "String")) && MatchTypes(convert->dataType, dest, conversions, (((void *)0)), (((void *)0)), convert->dataType->kind == 8, convert->dataType->kind == 8, 0, 1, warnConst))
{
if(!conversions && !convert->Get)
return 1;
else if(conversions != (((void *)0)))
{
if(_class->type == 3 && convert->dataType->kind == 8 && convert->dataType->__anon1._class && convert->dataType->__anon1._class->__anon1.registered && _class->base == convert->dataType->__anon1._class->__anon1.registered->base && (dest->kind != 8 || dest->__anon1._class->__anon1.registered != _class->base))
return 1;
else
{
struct Conversion * conv = (conv = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Conversion), conv->convert = convert, conv->isGet = 1, conv);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(conversions, after, conv);
return 1;
}
}
}
}
}
}
if(enumBaseType && source->__anon1._class && source->__anon1._class->__anon1.registered && source->__anon1._class->__anon1.registered->type == 4)
{
if(!source->__anon1._class->__anon1.registered->dataType)
source->__anon1._class->__anon1.registered->dataType = ProcessTypeString(source->__anon1._class->__anon1.registered->dataTypeString, 0);
if(!isConversionExploration || source->__anon1._class->__anon1.registered->dataType->kind == 8 || !strcmp(source->__anon1._class->__anon1.registered->name, "String"))
{
if(MatchTypes(source->__anon1._class->__anon1.registered->dataType, dest, conversions, (((void *)0)), (((void *)0)), source->__anon1._class->__anon1.registered->dataType->kind == 8, source->__anon1._class->__anon1.registered->dataType->kind == 8, 0, 0, warnConst))
return 1;
else if(MatchTypes(dest, source->__anon1._class->__anon1.registered->dataType, (((void *)0)), (((void *)0)), (((void *)0)), 0, 0, 0, 0, warnConst))
return 1;
}
}
}
}
if(source->kind == 8 || source->kind == 19)
;
else if(dest->kind == source->kind && (dest->kind != 9 && dest->kind != 10 && dest->kind != 11 && dest->kind != 12 && dest->kind != 13 && dest->kind != 16))
return 1;
else if(dest->kind == 7 && source->kind == 6)
return 1;
else if(dest->kind == 26 && (source->kind == 6 || source->kind == 7))
return 1;
else if(dest->kind == 2 && (source->kind == 1 || source->kind == 24))
return 1;
else if(dest->kind == 3 && (source->kind == 2 || source->kind == 1 || source->kind == 24 || source->kind == 23))
return 1;
else if(dest->kind == 4 && (source->kind == 2 || source->kind == 1 || source->kind == 24 || source->kind == 3 || source->kind == 22 || source->kind == 23))
return 1;
else if(dest->kind == 25 && (source->kind == 2 || source->kind == 1 || source->kind == 24 || source->kind == 3 || source->kind == 22 || source->kind == 4 || source->kind == 23))
return 1;
else if(dest->kind == 22 && (source->kind == 2 || source->kind == 1 || source->kind == 24 || source->kind == 3 || source->kind == 23 || source->kind == 4))
return 1;
else if(dest->kind == 23 && (source->kind == 2 || source->kind == 1 || source->kind == 24 || source->kind == 3 || source->kind == 4 || source->kind == 22))
return 1;
else if(source->kind == 15 && (dest->kind == 3 || dest->kind == 2 || dest->kind == 1 || source->kind == 24 || dest->kind == 5 || dest->kind == 4 || dest->kind == 22 || dest->kind == 23))
return 1;
else if(dest->kind == 15 && !isConversionExploration && (source->kind == 3 || source->kind == 2 || source->kind == 1 || source->kind == 24 || source->kind == 5 || source->kind == 4 || source->kind == 22 || source->kind == 23))
return 1;
else if((dest->kind == 11 || (dest->kind == 13 && dest->__anon1.type->kind == 11) || dest->kind == 16) && ((source->kind == 11 || (source->kind == 13 && source->__anon1.type->kind == 11) || source->kind == 16)))
{
struct Type * paramSource, * paramDest;

if(dest->kind == 16)
owningClassDest = dest->__anon1.__anon3.methodClass ? dest->__anon1.__anon3.methodClass : dest->__anon1.__anon3.method->_class;
if(source->kind == 16)
owningClassSource = source->__anon1.__anon3.methodClass ? source->__anon1.__anon3.methodClass : source->__anon1.__anon3.method->_class;
if(dest->kind == 13 && dest->__anon1.type->kind == 11)
dest = dest->__anon1.type;
if(source->kind == 13 && source->__anon1.type->kind == 11)
source = source->__anon1.type;
if(dest->kind == 16)
dest = dest->__anon1.__anon3.method->dataType;
if(source->kind == 16)
source = source->__anon1.__anon3.method->dataType;
paramSource = source->__anon1.__anon2.params.first;
if(paramSource && paramSource->kind == 0)
paramSource = (((void *)0));
paramDest = dest->__anon1.__anon2.params.first;
if(paramDest && paramDest->kind == 0)
paramDest = (((void *)0));
if((dest->__anon1.__anon2.staticMethod || (!dest->__anon1.__anon2.thisClass && !owningClassDest)) && !(source->__anon1.__anon2.staticMethod || (!source->__anon1.__anon2.thisClass && !owningClassSource)))
{
if(!paramDest || (!(paramDest->kind == 13 && paramDest->__anon1.type && paramDest->__anon1.type->kind == 0) && (paramDest->kind != 8 || !__ecereNameSpace__ecere__com__eClass_IsDerived(source->__anon1.__anon2.thisClass ? source->__anon1.__anon2.thisClass->__anon1.registered : owningClassSource, paramDest->__anon1._class->__anon1.registered))))
{
if(paramDest && paramDest->kind == 8)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "method class must be derived from %s\n", (((void *)0))), paramDest->__anon1._class->string);
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "method class should not take an object\n", (((void *)0))));
return 0;
}
paramDest = paramDest->next;
}
else if(!dest->__anon1.__anon2.staticMethod && (dest->__anon1.__anon2.thisClass || owningClassDest))
{
if((source->__anon1.__anon2.staticMethod || (!source->__anon1.__anon2.thisClass && !owningClassSource)))
{
if(dest->__anon1.__anon2.thisClass)
{
if(!paramSource || paramSource->kind != 8 || !__ecereNameSpace__ecere__com__eClass_IsDerived(paramSource->__anon1._class->__anon1.registered, dest->__anon1.__anon2.thisClass->__anon1.registered))
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "method class must be derived from %s\n", (((void *)0))), dest->__anon1.__anon2.thisClass->string);
return 0;
}
}
else
{
if(!paramSource || paramSource->kind != 8 || (owningClassDest && !__ecereNameSpace__ecere__com__eClass_IsDerived(paramSource->__anon1._class->__anon1.registered, owningClassDest)))
{
if(owningClassDest)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "%s expected to be derived from method class\n", (((void *)0))), owningClassDest->fullName);
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "overriding class expected to be derived from method class\n", (((void *)0))));
return 0;
}
}
paramSource = paramSource->next;
}
else
{
if(dest->__anon1.__anon2.thisClass)
{
if(!__ecereNameSpace__ecere__com__eClass_IsDerived(source->__anon1.__anon2.thisClass ? source->__anon1.__anon2.thisClass->__anon1.registered : owningClassSource, dest->__anon1.__anon2.thisClass->__anon1.registered))
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "method class must be derived from %s\n", (((void *)0))), dest->__anon1.__anon2.thisClass->string);
return 0;
}
}
else
{
if(source->__anon1.__anon2.thisClass && source->__anon1.__anon2.thisClass->__anon1.registered && owningClassDest && !__ecereNameSpace__ecere__com__eClass_IsDerived(source->__anon1.__anon2.thisClass->__anon1.registered, owningClassDest))
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "%s expected to be derived from method class\n", (((void *)0))), source->__anon1.__anon2.thisClass->__anon1.registered->fullName);
return 0;
}
}
}
}
if(!MatchTypes(source->__anon1.__anon2.returnType, dest->__anon1.__anon2.returnType, (((void *)0)), (((void *)0)), (((void *)0)), 1, 1, 0, 0, warnConst))
{
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "incompatible return type for function\n", (((void *)0))));
return 0;
}
else
CheckConstCompatibility(dest->__anon1.__anon2.returnType, source->__anon1.__anon2.returnType, 1);
for(; paramDest; paramDest = paramDest->next)
{
if(!paramSource)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "not enough parameters\n", (((void *)0))));
return 0;
}
{
struct Type * paramDestType = paramDest;
struct Type * paramSourceType = paramSource;
struct Type * type = paramDestType;

if(paramDest->kind == 20 && paramDest->__anon1.templateParameter->type == 0 && owningClassSource && paramSource->kind != 20)
{
int id = 0;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * curParam = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = owningClassSource; sClass; sClass = sClass->base)
{
id = 0;
if(sClass->templateClass)
sClass = sClass->templateClass;
for(curParam = sClass->templateParams.first; curParam; curParam = curParam->next)
{
if(curParam->type == 0 && !strcmp(type->__anon1.templateParameter->identifier->string, curParam->name))
{
for(sClass = sClass->base; sClass; sClass = sClass->base)
{
if(sClass->templateClass)
sClass = sClass->templateClass;
id += sClass->templateParams.count;
}
break;
}
id++;
}
if(curParam)
break;
}
if(curParam)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument arg = owningClassSource->templateArgs[id];

paramDestType = type = ProcessTypeString(arg.__anon1.__anon1.dataTypeString, 0);
}
}
if(!MatchTypes(paramDestType, paramSourceType, (((void *)0)), (((void *)0)), (((void *)0)), 1, 1, 0, 0, warnConst) && (!acceptReversedParams || !MatchTypes(paramSourceType, paramDestType, (((void *)0)), (((void *)0)), (((void *)0)), 1, 1, 0, 0, warnConst)))
{
char type[1024];

type[0] = 0;
PrintType(paramDest, type, 0, 1);
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "incompatible parameter %s (expected %s)\n", (((void *)0))), paramSource->name, type);
if(paramDestType != paramDest)
FreeType(paramDestType);
return 0;
}
if(paramDestType != paramDest)
FreeType(paramDestType);
}
paramSource = paramSource->next;
}
if(paramSource)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "too many parameters\n", (((void *)0))));
return 0;
}
return 1;
}
else if((dest->kind == 11 || (dest->kind == 13 && dest->__anon1.type->kind == 11) || dest->kind == 16) && (source->kind == 13 && source->__anon1.type->kind == 0))
{
return 1;
}
else if((dest->kind == 13 || dest->kind == 12) && (source->kind == 12 || source->kind == 13))
{
if(!(dest->__anon1.type && dest->__anon1.type->kind == 13 && source->__anon1.type->kind == 8 && source->__anon1.type->__anon1._class && source->__anon1.type->__anon1._class->__anon1.registered && (source->__anon1.type->__anon1._class->__anon1.registered->type != 0 && source->__anon1.type->__anon1._class->__anon1.registered->type != 5) && !source->__anon1.type->byReference))
{
ComputeTypeSize(source->__anon1.type);
ComputeTypeSize(dest->__anon1.type);
if(source->__anon1.type->size == dest->__anon1.type->size && MatchTypes(source->__anon1.type, dest->__anon1.type, (((void *)0)), (((void *)0)), (((void *)0)), 1, 1, 0, 0, warnConst))
return 1;
}
}
}
return 0;
}

void CallOperator(struct Expression * exp, struct Expression * exp1, struct Expression * exp2, struct Operand * op1, struct Operand * op2)
{
if(exp->__anon1.op.op == SIZEOF)
{
FreeExpContents(exp);
exp->type = 2;
exp->__anon1.__anon1.constant = PrintUInt(ComputeTypeSize(op1->type));
}
else
{
if(!exp->__anon1.op.exp1)
{
switch(exp->__anon1.op.op)
{
case '+':
{
struct Expression * exp2 = exp->__anon1.op.exp2;

exp->__anon1.op.exp2 = (((void *)0));
FreeExpContents(exp);
FreeType(exp->expType);
FreeType(exp->destType);
*exp = *exp2;
((exp2 ? __extension__ ({
void * __ecerePtrToDelete = (exp2);

__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), exp2 = 0);
break;
}
case '-':
if(op1->ops.Neg)
{
FreeExpContents(exp);
op1->ops.Neg(exp, op1);
}
break;
case '~':
if(op1->ops.BitNot)
{
FreeExpContents(exp);
op1->ops.BitNot(exp, op1);
}
break;
case '!':
if(op1->ops.Not)
{
FreeExpContents(exp);
op1->ops.Not(exp, op1);
}
break;
}
}
else
{
if(op1 && op2 && op1->type && op2->type && op1->kind != op2->kind)
{
if(Promote(op2, op1->kind, op1->type->isSigned))
op2->kind = op1->kind, op2->ops = op1->ops;
else if(Promote(op1, op2->kind, op2->type->isSigned))
op1->kind = op2->kind, op1->ops = op2->ops;
}
switch(exp->__anon1.op.op)
{
case '+':
if(op1->ops.Add)
{
FreeExpContents(exp);
op1->ops.Add(exp, op1, op2);
}
break;
case '-':
if(op1->ops.Sub)
{
FreeExpContents(exp);
op1->ops.Sub(exp, op1, op2);
}
break;
case '*':
if(op1->ops.Mul)
{
FreeExpContents(exp);
op1->ops.Mul(exp, op1, op2);
}
break;
case '/':
if(op1->ops.Div)
{
FreeExpContents(exp);
op1->ops.Div(exp, op1, op2);
}
break;
case '%':
if(op1->ops.Mod)
{
FreeExpContents(exp);
op1->ops.Mod(exp, op1, op2);
}
break;
case '&':
if(exp->__anon1.op.exp2)
{
if(op1->ops.BitAnd)
{
FreeExpContents(exp);
op1->ops.BitAnd(exp, op1, op2);
}
}
break;
case '|':
if(op1->ops.BitOr)
{
FreeExpContents(exp);
op1->ops.BitOr(exp, op1, op2);
}
break;
case '^':
if(op1->ops.BitXor)
{
FreeExpContents(exp);
op1->ops.BitXor(exp, op1, op2);
}
break;
case LEFT_OP:
if(op1->ops.LShift)
{
FreeExpContents(exp);
op1->ops.LShift(exp, op1, op2);
}
break;
case RIGHT_OP:
if(op1->ops.RShift)
{
FreeExpContents(exp);
op1->ops.RShift(exp, op1, op2);
}
break;
case EQ_OP:
if(op1->ops.Equ)
{
FreeExpContents(exp);
op1->ops.Equ(exp, op1, op2);
}
break;
case NE_OP:
if(op1->ops.Nqu)
{
FreeExpContents(exp);
op1->ops.Nqu(exp, op1, op2);
}
break;
case AND_OP:
if(op1->ops.And)
{
FreeExpContents(exp);
op1->ops.And(exp, op1, op2);
}
break;
case OR_OP:
if(op1->ops.Or)
{
FreeExpContents(exp);
op1->ops.Or(exp, op1, op2);
}
break;
case '>':
if(op1->ops.Grt)
{
FreeExpContents(exp);
op1->ops.Grt(exp, op1, op2);
}
break;
case '<':
if(op1->ops.Sma)
{
FreeExpContents(exp);
op1->ops.Sma(exp, op1, op2);
}
break;
case GE_OP:
if(op1->ops.GrtEqu)
{
FreeExpContents(exp);
op1->ops.GrtEqu(exp, op1, op2);
}
break;
case LE_OP:
if(op1->ops.SmaEqu)
{
FreeExpContents(exp);
op1->ops.SmaEqu(exp, op1, op2);
}
break;
}
}
}
}

void ApplyAnyObjectLogic(struct Expression * e)
{
struct Type * destType = e->destType;

if(destType && (destType->classObjectType == 3))
{
if(e && e->expType)
{
struct Type * type = e->expType;
struct __ecereNameSpace__ecere__com__Class * _class = (((void *)0));

if(type->kind == 8 && type->__anon1._class && type->__anon1._class->__anon1.registered)
{
_class = type->__anon1._class->__anon1.registered;
}
else if(type->kind == 19)
{
_class = FindClass("ecere::com::Class")->__anon1.registered;
}
else
{
char string[1024] = "";
struct Symbol * classSym;

PrintTypeNoConst(type, string, 0, 1);
classSym = FindClass(string);
if(classSym)
_class = classSym->__anon1.registered;
}
if((_class && (_class->type == 4 || _class->type == 3 || _class->type == 2 || _class->type == 1000) && strcmp(_class->fullName, "class") && strcmp(_class->fullName, "uintptr") && strcmp(_class->fullName, "intptr")) || (!e->expType->classObjectType && (((type->kind != 13 && type->kind != 22 && type->kind != 19 && (type->kind != 8 || !type->__anon1._class || !type->__anon1._class->__anon1.registered || type->__anon1._class->__anon1.registered->type == 1))) || destType->byReference)))
{
if(!_class || strcmp(_class->fullName, "char *"))
{
struct Expression * checkedExp = e, * newExp;

while(((checkedExp->type == 5 || checkedExp->type == 32 || checkedExp->type == 23) && checkedExp->__anon1.list) || checkedExp->type == 11)
{
if(checkedExp->type == 5 || checkedExp->type == 32 || checkedExp->type == 23)
{
if(checkedExp->type == 23)
{
checkedExp = (*((struct Statement *)(*checkedExp->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions).last;
}
else
checkedExp = (*checkedExp->__anon1.list).last;
}
else if(checkedExp->type == 11)
checkedExp = checkedExp->__anon1.cast.exp;
}
if(checkedExp && checkedExp->type == 4 && checkedExp->__anon1.op.op == '*' && !checkedExp->__anon1.op.exp1)
{
newExp = checkedExp->__anon1.op.exp2;
checkedExp->__anon1.op.exp2 = (((void *)0));
FreeExpContents(checkedExp);
if(e->expType && e->expType->passAsTemplate)
{
char size[100];

ComputeTypeSize(e->expType);
sprintf(size, "%d", e->expType->size);
newExp = MkExpBrackets(MkListOne(MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), newExp), '+', MkExpCall(MkExpIdentifier(MkIdentifier("__ENDIAN_PAD")), MkListOne(MkExpConstant(size))))));
}
ReplaceExpContents(checkedExp, newExp);
e->byReference = 1;
}
else if(!e->byReference || (_class && _class->type == 5))
{
struct Expression * checkedExp;

{
unsigned int hasAddress = e->type == 0 || (e->type == 8 && e->__anon1.member.memberType == 3) || (e->type == 9 && e->__anon1.member.memberType == 3) || (e->type == 4 && !e->__anon1.op.exp1 && e->__anon1.op.op == '*') || e->type == 6;

if(_class && _class->type != 5 && _class->type != 0 && _class->type != 1 && !hasAddress)
{
struct Context * context = PushContext();
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
char typeString[1024];
struct Expression * newExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

typeString[0] = '\0';
*newExp = *e;
newExp->prev = (((void *)0));
newExp->next = (((void *)0));
newExp->expType = (((void *)0));
PrintTypeNoConst(e->expType, typeString, 0, 1);
decl = SpecDeclFromString(typeString, specs, (((void *)0)));
newExp->destType = ProcessType(specs, decl);
curContext = context;
if(curCompound)
{
char name[100];
struct __ecereNameSpace__ecere__sys__OldList * stmts = MkList();

e->type = 23;
sprintf(name, "__internalValue%03X", internalValueCounter++);
if(!curCompound->__anon1.compound.declarations)
curCompound->__anon1.compound.declarations = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*curCompound->__anon1.compound.declarations), (((void *)0)), MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(name)), (((void *)0))))));
ListAdd(stmts, MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(name)), '=', newExp))));
ListAdd(stmts, MkExpressionStmt(MkListOne(MkExpIdentifier(MkIdentifier(name)))));
e->__anon1.compound = MkCompoundStmt((((void *)0)), stmts);
}
else
printf("libec: compiler error, curCompound is null in ApplyAnyObjectLogic\n");
{
struct Type * type = e->destType;

e->destType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
CopyTypeInto(e->destType, type);
e->destType->refCount = 1;
e->destType->classObjectType = 0;
FreeType(type);
}
e->__anon1.compound->__anon1.compound.context = context;
PopContext(context);
curContext = context->parent;
}
}
checkedExp = e;
while(((checkedExp->type == 5 || checkedExp->type == 32 || checkedExp->type == 23) && checkedExp->__anon1.list) || checkedExp->type == 11)
{
if(checkedExp->type == 5 || checkedExp->type == 32 || checkedExp->type == 23)
{
if(checkedExp->type == 23)
{
checkedExp = (*((struct Statement *)(*checkedExp->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions).last;
}
else
checkedExp = (*checkedExp->__anon1.list).last;
}
else if(checkedExp->type == 11)
checkedExp = checkedExp->__anon1.cast.exp;
}
{
struct Expression * operand = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

*operand = *checkedExp;
__ecereMethod_Expression_Clear(checkedExp);
checkedExp->destType = ProcessTypeString("void *", 0);
checkedExp->expType = checkedExp->destType;
checkedExp->destType->refCount++;
checkedExp->type = 4;
checkedExp->__anon1.op.op = '&';
checkedExp->__anon1.op.exp1 = (((void *)0));
checkedExp->__anon1.op.exp2 = operand;
}
}
}
}
}
}
{
}
if((!destType || destType->kind == 14 || destType->kind == 0) && e->expType && (e->expType->classObjectType == 3 || e->expType->classObjectType == 2) && (e->expType->byReference || (e->expType->kind == 8 && e->expType->__anon1._class && e->expType->__anon1._class->__anon1.registered && (e->expType->__anon1._class->__anon1.registered->type == 2 || e->expType->__anon1._class->__anon1.registered->type == 4 || e->expType->__anon1._class->__anon1.registered->type == 3))))
{
if(e->expType->classObjectType && destType && destType->classObjectType)
{
return ;
}
else
{
struct Expression * thisExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

*thisExp = *e;
thisExp->prev = (((void *)0));
thisExp->next = (((void *)0));
__ecereMethod_Expression_Clear(e);
e->type = 5;
e->__anon1.list = MkListOne(MkExpOp((((void *)0)), '*', thisExp->type == 0 ? thisExp : MkExpBrackets(MkListOne(thisExp))));
if(thisExp->expType->kind == 8 && thisExp->expType->__anon1._class && thisExp->expType->__anon1._class->__anon1.registered && thisExp->expType->__anon1._class->__anon1.registered->type == 5)
((struct Expression *)(*e->__anon1.list).first)->byReference = 1;
{
e->expType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
CopyTypeInto(e->expType, thisExp->expType);
e->expType->byReference = 0;
e->expType->refCount = 1;
if(e->expType->kind == 8 && e->expType->__anon1._class && e->expType->__anon1._class->__anon1.registered && (e->expType->__anon1._class->__anon1.registered->type == 2 || e->expType->__anon1._class->__anon1.registered->type == 4 || e->expType->__anon1._class->__anon1.registered->type == 3))
{
e->expType->classObjectType = 0;
}
}
}
}
else if(destType && e->expType && (e->expType->classObjectType == 3 || e->expType->classObjectType == 2) && !destType->classObjectType && destType->kind != 0)
{
if(destType->kind == 14)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Unspecified type\n", (((void *)0))));
}
else if(!(destType->truth && e->expType->kind == 8 && e->expType->__anon1._class && e->expType->__anon1._class->__anon1.registered && e->expType->__anon1._class->__anon1.registered->type == 1))
{
unsigned int byReference = e->expType->byReference;
struct Expression * thisExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
char typeString[1024];
struct Type * type;
int backupClassObjectType;
unsigned int backupByReference;

if(e->expType->kind == 8 && e->expType->__anon1._class && e->expType->__anon1._class->__anon1.registered && strcmp(e->expType->__anon1._class->__anon1.registered->name, "class"))
type = e->expType;
else
type = destType;
backupClassObjectType = type->classObjectType;
backupByReference = type->byReference;
type->classObjectType = 0;
type->byReference = 0;
typeString[0] = '\0';
PrintType(type, typeString, 0, 1);
decl = SpecDeclFromString(typeString, specs, (((void *)0)));
type->classObjectType = backupClassObjectType;
type->byReference = backupByReference;
*thisExp = *e;
thisExp->prev = (((void *)0));
thisExp->next = (((void *)0));
__ecereMethod_Expression_Clear(e);
if((type->kind == 8 && type->__anon1._class && type->__anon1._class->__anon1.registered && (type->__anon1._class->__anon1.registered->type == 1000 || type->__anon1._class->__anon1.registered->type == 2 || type->__anon1._class->__anon1.registered->type == 4 || type->__anon1._class->__anon1.registered->type == 3)) || (type->kind != 13 && type->kind != 22 && type->kind != 12 && type->kind != 8) || (!destType->byReference && byReference && (destType->kind != 13 || type->kind != 13)))
{
unsigned int passAsTemplate = thisExp->destType->passAsTemplate;
struct Type * t;

destType->refCount++;
e->type = 4;
e->__anon1.op.op = '*';
e->__anon1.op.exp1 = (((void *)0));
e->__anon1.op.exp2 = MkExpCast(MkTypeName(specs, MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), decl)), thisExp);
t = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
CopyTypeInto(t, thisExp->destType);
t->passAsTemplate = 0;
FreeType(thisExp->destType);
thisExp->destType = t;
t = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
CopyTypeInto(t, destType);
t->passAsTemplate = passAsTemplate;
FreeType(destType);
destType = t;
destType->refCount = 0;
e->expType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
CopyTypeInto(e->expType, type);
if(type->passAsTemplate)
{
e->expType->classObjectType = 0;
e->expType->passAsTemplate = 0;
}
e->expType->byReference = 0;
e->expType->refCount = 1;
}
else
{
e->type = 11;
e->__anon1.cast.typeName = MkTypeName(specs, decl);
e->__anon1.cast.exp = thisExp;
e->byReference = 1;
e->expType = type;
type->refCount++;
}
if(e->destType)
FreeType(e->destType);
e->destType = destType;
destType->refCount++;
}
}
}

void ComputeModuleClasses(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * _class;
struct __ecereNameSpace__ecere__sys__OldLink * subModule;

for(subModule = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->modules.first; subModule; subModule = subModule->next)
ComputeModuleClasses(subModule->data);
for(_class = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->classes.first; _class; _class = _class->next)
ComputeClassMembers(_class, 0);
}

struct External * _DeclareStruct(struct External * neededBy, const char * name, unsigned int skipNoHead, unsigned int needDereference, unsigned int fwdDecl)
{
struct External * external = (((void *)0));
struct Symbol * classSym = FindClass(name);
struct __ecereNameSpace__ecere__sys__OldList * curDeclarations = (((void *)0));

if(!inCompiler || !classSym)
return (((void *)0));
if(classSym->__anon1.registered && (classSym->__anon1.registered->type == 2 || classSym->__anon1.registered->type == 3 || classSym->__anon1.registered->type == 4))
return (((void *)0));
if(!classSym->__anon1.registered || (classSym->__anon1.registered->type == 0 && classSym->__anon1.registered->structSize && classSym->__anon1.registered->base && classSym->__anon1.registered->base->base))
_DeclareStruct(neededBy, "ecere::com::Instance", 0, 1, fwdDecl);
external = classSym->__anon2.__anon1.structExternal;
if(external && external->__anon1.declaration)
{
struct Specifier * spec;

for(spec = external->__anon1.declaration->__anon1.__anon1.specifiers ? (*external->__anon1.declaration->__anon1.__anon1.specifiers).first : (((void *)0)); spec; spec = spec->next)
if(spec->type == 3 || spec->type == 4)
{
curDeclarations = spec->__anon1.__anon2.definitions;
break;
}
}
if(classSym->__anon1.registered && !classSym->declaring && classSym->imported && (!classSym->declaredStructSym || (classSym->__anon1.registered->type == 5 && !skipNoHead && external && !curDeclarations)))
{
struct __ecereNameSpace__ecere__sys__OldList * specifiers, * declarators;
struct __ecereNameSpace__ecere__sys__OldList * declarations = (((void *)0));
char structName[1024];
unsigned int addedPadding = 0;
struct Specifier * curSpec = (((void *)0));

classSym->declaring++;
if(strchr(classSym->string, '<'))
{
if(classSym->__anon1.registered->templateClass)
external = _DeclareStruct(neededBy, classSym->__anon1.registered->templateClass->fullName, skipNoHead, needDereference, fwdDecl);
classSym->declaring--;
return external;
}
structName[0] = 0;
FullClassNameCat(structName, name, 0);
classSym->declaredStructSym = 1;
if(!external || (classSym->__anon1.registered->type == 5 && !skipNoHead && !curDeclarations))
{
unsigned int add = 0;

if(!external)
{
external = MkExternalDeclaration((((void *)0)));
classSym->__anon2.__anon1.structExternal = external;
external->symbol = classSym;
add = 1;
}
if(!skipNoHead)
{
declarations = MkList();
AddMembers(external, declarations, classSym->__anon1.registered, 0, (((void *)0)), classSym->__anon1.registered, &addedPadding);
}
if(external->__anon1.declaration)
{
struct Specifier * spec;

for(spec = external->__anon1.declaration->__anon1.__anon1.specifiers ? (*external->__anon1.declaration->__anon1.__anon1.specifiers).first : (((void *)0)); spec; spec = spec->next)
if(spec->type == 3 || spec->type == 4)
{
curSpec = spec;
curDeclarations = spec->__anon1.__anon2.definitions;
break;
}
}
if(declarations && (!(*declarations).count || ((*declarations).count == 1 && addedPadding)) && classSym->__anon1.registered->type != 1)
{
FreeList(declarations, (void *)(FreeClassDef));
declarations = (((void *)0));
}
if(classSym->__anon1.registered->type != 5 && !declarations)
{
FreeExternal(external);
external = (((void *)0));
classSym->__anon2.__anon1.structExternal = (((void *)0));
}
else
{
if(curSpec)
curSpec->__anon1.__anon2.definitions = declarations;
else
{
specifiers = MkList();
declarators = MkList();
ListAdd(specifiers, MkStructOrUnion(3, MkIdentifier(structName), declarations));
external->__anon1.declaration = MkDeclaration(specifiers, declarators);
}
if(add)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*ast), external);
}
}
classSym->declaring--;
}
else if(!classSym->declaredStructSym && classSym->__anon2.__anon1.structExternal)
{
classSym->declaredStructSym = 1;
if(classSym->__anon1.registered)
DeclareMembers(classSym->__anon2.__anon1.structExternal, classSym->__anon1.registered, 0);
if(classSym->__anon2.__anon1.structExternal->__anon1.declaration && classSym->__anon2.__anon1.structExternal->__anon1.declaration->__anon1.__anon1.specifiers)
{
struct Specifier * spec;

for(spec = (*classSym->__anon2.__anon1.structExternal->__anon1.declaration->__anon1.__anon1.specifiers).first; spec; spec = spec->next)
{
if(spec->__anon1.__anon2.definitions)
IdentifyAnonStructs(spec->__anon1.__anon2.definitions);
}
}
}
if(inCompiler && neededBy && (external || !classSym->imported))
{
if(!external)
{
classSym->__anon2.__anon1.structExternal = external = MkExternalDeclaration((((void *)0)));
external->symbol = classSym;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*ast), external);
}
if(reachedPass15 && !external->__anon1.declaration && classSym->__anon1.registered && classSym->__anon1.registered->type == 5)
{
char structName[1024];
struct __ecereNameSpace__ecere__sys__OldList * specifiers, * declarators;

structName[0] = 0;
FullClassNameCat(structName, name, 0);
specifiers = MkList();
declarators = MkList();
ListAdd(specifiers, MkStructOrUnion(3, MkIdentifier(structName), (((void *)0))));
external->__anon1.declaration = MkDeclaration(specifiers, declarators);
}
if(fwdDecl)
{
struct External * e = external->fwdDecl ? external->fwdDecl : external;

if(((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)e->incoming + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->count)
__ecereMethod_External_CreateUniqueEdge(neededBy, e, !needDereference && !external->fwdDecl);
}
else
__ecereMethod_External_CreateUniqueEdge(neededBy, external, !needDereference);
}
return external;
}

void ProcessExpressionType(struct Expression *  exp);

static void ReplaceClassMembers(struct Expression * exp, struct __ecereNameSpace__ecere__com__Class * _class)
{
if(exp->type == 0 && exp->__anon1.__anon1.identifier)
{
struct Identifier * id = exp->__anon1.__anon1.identifier;
struct Context * ctx;
struct Symbol * symbol = (((void *)0));

if(!id->_class || !id->_class->__anon1.__anon1.name || strcmp(id->_class->__anon1.__anon1.name, "property"))
{
for(ctx = curContext; ctx != topContext->parent && !symbol; ctx = ctx->parent)
{
if(!ctx)
break;
symbol = (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&ctx->symbols, id->string);
if(symbol)
break;
}
}
if(!symbol && ((!id->_class || (id->_class->__anon1.__anon1.name && !strcmp(id->_class->__anon1.__anon1.name, "property"))) || (id->classSym && __ecereNameSpace__ecere__com__eClass_IsDerived(_class, id->classSym->__anon1.registered))))
{
struct __ecereNameSpace__ecere__com__Property * prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, id->string, privateModule);
struct __ecereNameSpace__ecere__com__Method * method = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * member = (((void *)0));
struct __ecereNameSpace__ecere__com__ClassProperty * classProp = (((void *)0));

if(!prop)
{
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, id->string, privateModule);
}
if(!prop && !method)
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, id->string, privateModule, (((void *)0)), (((void *)0)));
if(!prop && !method && !member)
{
classProp = __ecereNameSpace__ecere__com__eClass_FindClassProperty(_class, id->string);
}
if(prop || method || member || classProp)
{
exp->type = 8;
exp->__anon1.member.member = id;
exp->__anon1.member.memberType = 0;
exp->__anon1.member.exp = QMkExpId("this");
exp->addedThis = 1;
}
else if(_class && _class->templateParams.first)
{
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = _class; sClass; sClass = sClass->base)
{
if(sClass->templateParams.first)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

for(param = sClass->templateParams.first; param; param = param->next)
{
if(param->type == 2 && !strcmp(param->name, id->string))
{
struct Expression * argExp = GetTemplateArgExpByName(param->name, (((void *)0)), _class, 2);

if(argExp)
{
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

FreeIdentifier(exp->__anon1.member.member);
ProcessExpressionType(argExp);
decl = SpecDeclFromString(param->__anon1.dataTypeString, specs, (((void *)0)));
exp->expType = ProcessType(specs, decl);
exp->type = 5;
exp->__anon1.list = MkListOne(MkExpOp((((void *)0)), '*', MkExpCast(MkTypeName(specs, MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), decl)), MkExpOp((((void *)0)), '&', argExp))));
}
}
}
}
}
}
}
}
}

int ComputeTypeSize(struct Type * type)
{
unsigned int size = type ? type->size : 0;

if(!size && type && !type->computing)
{
type->computing = 1;
switch(type->kind)
{
case 24:
type->alignment = size = sizeof(char);
break;
case 1:
type->alignment = size = sizeof(char);
break;
case 3:
type->alignment = size = sizeof(int);
break;
case 4:
type->alignment = size = sizeof(long long);
break;
case 22:
type->alignment = size = targetBits / 8;
type->pointerAlignment = 1;
break;
case 23:
type->alignment = size = targetBits / 8;
type->pointerAlignment = 1;
break;
case 5:
type->alignment = size = sizeof(long);
break;
case 2:
type->alignment = size = sizeof(short);
break;
case 6:
type->alignment = size = sizeof(float);
break;
case 7:
type->alignment = size = sizeof(double);
break;
case 8:
{
struct __ecereNameSpace__ecere__com__Class * _class = type->__anon1._class ? type->__anon1._class->__anon1.registered : (((void *)0));

if(_class && _class->type == 1)
{
ComputeClassMembers(_class, 0);
type->alignment = _class->structAlignment;
type->pointerAlignment = (unsigned int)_class->pointerAlignment;
size = _class->structSize;
if(type->alignment && size % type->alignment)
size += type->alignment - (size % type->alignment);
}
else if(_class && (_class->type == 3 || _class->type == 4 || _class->type == 2 || _class->type == 1000))
{
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0);
size = type->alignment = ComputeTypeSize(_class->dataType);
}
else
{
size = type->alignment = targetBits / 8;
type->pointerAlignment = 1;
}
break;
}
case 13:
case 19:
size = type->alignment = targetBits / 8;
type->pointerAlignment = 1;
break;
case 12:
if(type->__anon1.__anon4.arraySizeExp)
{
ProcessExpressionType(type->__anon1.__anon4.arraySizeExp);
ComputeExpression(type->__anon1.__anon4.arraySizeExp);
if(!type->__anon1.__anon4.arraySizeExp->isConstant || (type->__anon1.__anon4.arraySizeExp->expType && type->__anon1.__anon4.arraySizeExp->expType->kind != 3 && type->__anon1.__anon4.arraySizeExp->expType->kind != 2 && type->__anon1.__anon4.arraySizeExp->expType->kind != 1 && type->__anon1.__anon4.arraySizeExp->expType->kind != 5 && type->__anon1.__anon4.arraySizeExp->expType->kind != 4 && type->__anon1.__anon4.arraySizeExp->expType->kind != 23 && type->__anon1.__anon4.arraySizeExp->expType->kind != 22 && type->__anon1.__anon4.arraySizeExp->expType->kind != 15 && (type->__anon1.__anon4.arraySizeExp->expType->kind != 8 || !type->__anon1.__anon4.arraySizeExp->expType->__anon1._class->__anon1.registered || type->__anon1.__anon4.arraySizeExp->expType->__anon1._class->__anon1.registered->type != 4)))
{
struct Location oldLoc = yylloc;
char expression[10240];

expression[0] = '\0';
type->__anon1.__anon4.arraySizeExp->expType = (((void *)0));
yylloc = type->__anon1.__anon4.arraySizeExp->loc;
if(inCompiler)
PrintExpression(type->__anon1.__anon4.arraySizeExp, expression);
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Array size not constant int (%s)\n", (((void *)0))), expression);
yylloc = oldLoc;
}
GetInt(type->__anon1.__anon4.arraySizeExp, &type->__anon1.__anon4.arraySize);
}
else if(type->__anon1.__anon4.enumClass)
{
if(type->__anon1.__anon4.enumClass && type->__anon1.__anon4.enumClass->__anon1.registered && type->__anon1.__anon4.enumClass->__anon1.registered->type == 4)
{
type->__anon1.__anon4.arraySize = (int)__ecereNameSpace__ecere__com__eClass_GetProperty(type->__anon1.__anon4.enumClass->__anon1.registered, "enumSize");
}
else
type->__anon1.__anon4.arraySize = 0;
}
else
{
type->__anon1.__anon4.arraySize = 0;
}
size = ComputeTypeSize(type->__anon1.type) * type->__anon1.__anon4.arraySize;
if(type->__anon1.type)
{
type->alignment = type->__anon1.type->alignment;
type->pointerAlignment = type->__anon1.type->pointerAlignment;
}
break;
case 9:
{
if(!type->__anon1.__anon1.members.first && type->__anon1.__anon1.enumName)
{
struct Symbol * symbol = FindStruct(curContext, type->__anon1.__anon1.enumName);

if(symbol && symbol->type)
{
ComputeTypeSize(symbol->type);
size = symbol->type->size;
}
}
else
{
struct Type * member;

for(member = type->__anon1.__anon1.members.first; member; member = member->next)
{
int __simpleStruct0, __simpleStruct1;
unsigned int addSize = ComputeTypeSize(member);

member->offset = size;
if(member->alignment && size % member->alignment)
member->offset += member->alignment - (size % member->alignment);
size = member->offset;
if(member->pointerAlignment && type->size <= 4)
type->pointerAlignment = 1;
else if(!member->pointerAlignment && member->alignment >= 8)
type->pointerAlignment = 0;
type->alignment = (__simpleStruct0 = type->alignment, __simpleStruct1 = member->alignment, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
size += addSize;
}
if(type->alignment && size % type->alignment)
size += type->alignment - (size % type->alignment);
}
break;
}
case 10:
{
if(!type->__anon1.__anon1.members.first && type->__anon1.__anon1.enumName)
{
struct Symbol * symbol = FindStruct(curContext, type->__anon1.__anon1.enumName);

if(symbol && symbol->type)
{
ComputeTypeSize(symbol->type);
size = symbol->type->size;
type->alignment = symbol->type->alignment;
}
}
else
{
struct Type * member;

for(member = type->__anon1.__anon1.members.first; member; member = member->next)
{
int __simpleStruct0, __simpleStruct1;
unsigned int addSize = ComputeTypeSize(member);

member->offset = size;
if(member->alignment && size % member->alignment)
member->offset += member->alignment - (size % member->alignment);
size = member->offset;
if(member->pointerAlignment && type->size <= 4)
type->pointerAlignment = 1;
else if(!member->pointerAlignment && member->alignment >= 8)
type->pointerAlignment = 0;
type->alignment = (__simpleStruct0 = type->alignment, __simpleStruct1 = member->alignment, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
size = ((size > addSize) ? size : addSize);
}
if(type->alignment && size % type->alignment)
size += type->alignment - (size % type->alignment);
}
break;
}
case 20:
{
struct TemplateParameter * param = type->__anon1.templateParameter;
struct Type * baseType = ProcessTemplateParameterType(param);

if(baseType)
{
size = ComputeTypeSize(baseType);
type->alignment = baseType->alignment;
type->pointerAlignment = baseType->pointerAlignment;
}
else
type->alignment = size = sizeof(uint64);
break;
}
case 15:
{
type->alignment = size = sizeof(enum
{
test
});
break;
}
case 21:
{
type->alignment = size = targetBits / 8;
type->pointerAlignment = 1;
break;
}
}
type->size = size;
type->computing = 0;
}
return size;
}

unsigned int MatchTypeExpression(struct Expression * sourceExp, struct Type * dest, struct __ecereNameSpace__ecere__sys__OldList * conversions, unsigned int skipUnitBla, unsigned int warnConst)
{
struct Type * source;
struct Type * realDest = dest;
struct Type * backupSourceExpType = (((void *)0));
struct Expression * nbExp = GetNonBracketsExp(sourceExp);
struct Expression * computedExp = nbExp;

dest->refCount++;
if(sourceExp->isConstant && sourceExp->type != 2 && sourceExp->type != 0 && sourceExp->type != 11 && dest->kind == 8 && dest->__anon1._class && dest->__anon1._class->__anon1.registered && dest->__anon1._class->__anon1.registered->type == 4)
{
computedExp = CopyExpression(nbExp);
ComputeExpression(computedExp);
}
source = sourceExp->expType;
if(dest->kind == 13 && sourceExp->type == 2 && !strtoul(sourceExp->__anon1.__anon1.constant, (((void *)0)), 0))
{
if(computedExp != nbExp)
{
FreeExpression(computedExp);
computedExp = nbExp;
}
FreeType(dest);
return 1;
}
if(!skipUnitBla && source && dest && source->kind == 8 && dest->kind == 8)
{
if(source->__anon1._class && source->__anon1._class->__anon1.registered && source->__anon1._class->__anon1.registered->type == 3)
{
struct __ecereNameSpace__ecere__com__Class * sourceBase, * destBase;

for(sourceBase = source->__anon1._class->__anon1.registered; sourceBase && sourceBase->base && sourceBase->base->type != 1000; sourceBase = sourceBase->base)
;
for(destBase = dest->__anon1._class->__anon1.registered; destBase && destBase->base && destBase->base->type != 1000; destBase = destBase->base)
;
if(sourceBase == destBase)
{
if(computedExp != nbExp)
{
FreeExpression(computedExp);
computedExp = nbExp;
}
FreeType(dest);
return 1;
}
}
}
if(source)
{
struct __ecereNameSpace__ecere__sys__OldList * specs;
unsigned int flag = 0;
long long value = (((int)0x7fffffff));

source->refCount++;
if(computedExp->type == 2)
{
if(source->isSigned)
value = strtoll(computedExp->__anon1.__anon1.constant, (((void *)0)), 0);
else
value = strtoull(computedExp->__anon1.__anon1.constant, (((void *)0)), 0);
}
else if(computedExp->type == 4 && computedExp->__anon1.op.op == '-' && !computedExp->__anon1.op.exp1 && computedExp->__anon1.op.exp2 && computedExp->__anon1.op.exp2->type == 2)
{
if(source->isSigned)
value = -strtoll(computedExp->__anon1.op.exp2->__anon1.__anon1.constant, (((void *)0)), 0);
else
value = -strtoull(computedExp->__anon1.op.exp2->__anon1.__anon1.constant, (((void *)0)), 0);
}
if(computedExp != nbExp)
{
FreeExpression(computedExp);
computedExp = nbExp;
}
if(dest->kind != 8 && source->kind == 8 && source->__anon1._class && source->__anon1._class->__anon1.registered && !strcmp(source->__anon1._class->__anon1.registered->fullName, "unichar"))
{
FreeType(source);
source = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->kind = 3, __ecereInstance1->isSigned = 0, __ecereInstance1->refCount = 1, __ecereInstance1;
});
}
if(dest->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = dest->__anon1._class ? dest->__anon1._class->__anon1.registered : (((void *)0));

if(_class && _class->type == 3)
{
if(source->kind != 8)
{
struct Type * tempType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
struct Type * tempDest, * tempSource;

for(; _class->base->type != 1000; _class = _class->base)
;
tempSource = dest;
tempDest = tempType;
tempType->kind = 8;
if(!_class->symbol)
_class->symbol = FindClass(_class->fullName);
tempType->__anon1._class = _class->symbol;
tempType->truth = dest->truth;
if(tempType->__anon1._class)
MatchTypes(tempSource, tempDest, conversions, (((void *)0)), (((void *)0)), 1, 1, 0, 0, warnConst);
backupSourceExpType = sourceExp->expType;
if(dest->passAsTemplate)
{
sourceExp->expType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
CopyTypeInto(sourceExp->expType, dest);
sourceExp->expType->passAsTemplate = 0;
}
else
{
sourceExp->expType = dest;
dest->refCount++;
}
flag = 1;
((tempType ? __extension__ ({
void * __ecerePtrToDelete = (tempType);

__ecereClass_Type->Destructor ? __ecereClass_Type->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), tempType = 0);
}
}
if(_class && _class->type == 2 && source->kind != 8)
{
if(!dest->__anon1._class->__anon1.registered->dataType)
dest->__anon1._class->__anon1.registered->dataType = ProcessTypeString(dest->__anon1._class->__anon1.registered->dataTypeString, 0);
if(MatchTypes(source, dest->__anon1._class->__anon1.registered->dataType, conversions, (((void *)0)), (((void *)0)), 1, 1, 0, 0, warnConst))
{
FreeType(source);
FreeType(sourceExp->expType);
source = sourceExp->expType = MkClassType(dest->__anon1._class->string);
source->refCount++;
}
}
if(_class && !strcmp(_class->fullName, "ecere::com::Class") && source->kind == 13 && source->__anon1.type && source->__anon1.type->kind == 1 && sourceExp->type == 3)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;
char string[1024];

ReadString(string, sourceExp->__anon1.__anon2.string);
decl = SpecDeclFromString(string, specs, (((void *)0)));
FreeExpContents(sourceExp);
FreeType(sourceExp->expType);
sourceExp->type = 24;
sourceExp->__anon1._classExp.specifiers = specs;
sourceExp->__anon1._classExp.decl = decl;
sourceExp->expType = dest;
dest->refCount++;
FreeType(source);
FreeType(dest);
if(backupSourceExpType)
FreeType(backupSourceExpType);
return 1;
}
}
else if(source->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = source->__anon1._class ? source->__anon1._class->__anon1.registered : (((void *)0));

if(_class && (_class->type == 3 || _class->type == 2))
{
if(dest->kind != 8)
{
struct Type * tempType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
struct Type * tempDest, * tempSource;

if(!source->__anon1._class->__anon1.registered->dataType)
source->__anon1._class->__anon1.registered->dataType = ProcessTypeString(source->__anon1._class->__anon1.registered->dataTypeString, 0);
for(; _class->base->type != 1000; _class = _class->base)
;
tempDest = source;
tempSource = tempType;
tempType->kind = 8;
tempType->__anon1._class = FindClass(_class->fullName);
tempType->truth = source->truth;
tempType->classObjectType = source->classObjectType;
if(tempType->__anon1._class)
MatchTypes(tempSource, tempDest, conversions, (((void *)0)), (((void *)0)), 1, 1, 0, 0, warnConst);
if(conversions && conversions->last)
{
((struct Conversion *)conversions->last)->resultType = dest;
dest->refCount++;
modifyPassAsTemplate(&((struct Conversion *)conversions->last)->resultType, 0);
}
FreeType(sourceExp->expType);
sourceExp->expType = MkClassType(_class->fullName);
sourceExp->expType->truth = source->truth;
sourceExp->expType->classObjectType = source->classObjectType;
if(!sourceExp->destType)
{
FreeType(sourceExp->destType);
sourceExp->destType = sourceExp->expType;
if(sourceExp->expType)
sourceExp->expType->refCount++;
}
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0);
FreeType(dest);
dest = MkClassType(source->__anon1._class->string);
dest->truth = source->truth;
dest->classObjectType = source->classObjectType;
FreeType(source);
source = _class->dataType;
source->refCount++;
((tempType ? __extension__ ({
void * __ecerePtrToDelete = (tempType);

__ecereClass_Type->Destructor ? __ecereClass_Type->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), tempType = 0);
}
}
}
if(!flag)
{
if(MatchTypes(source, dest, conversions, (((void *)0)), (((void *)0)), 1, 1, 0, 0, warnConst))
{
FreeType(source);
FreeType(dest);
return 1;
}
}
if(dest->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = dest->__anon1._class ? dest->__anon1._class->__anon1.registered : (((void *)0));
unsigned int fittingValue = 0;

if(_class && _class->type == 4)
{
struct __ecereNameSpace__ecere__com__Class * enumClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "enum");
struct __ecereNameSpace__ecere__com__EnumClassData * c = (_class ? ((void *)(((char *)_class->data) + enumClass->offsetClass)) : (((void *)0)));

if(c && value >= 0 && value <= c->largest)
fittingValue = 1;
}
if(_class && !dest->truth && (_class->type == 3 || fittingValue || (_class->type != 1 && !value && source->kind == 3) || _class->type == 2))
{
if(_class->type == 0 || _class->type == 5)
{
struct Expression * newExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

*newExp = *sourceExp;
if(sourceExp->destType)
sourceExp->destType->refCount++;
if(sourceExp->expType)
sourceExp->expType->refCount++;
sourceExp->type = 11;
sourceExp->__anon1.cast.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0))));
sourceExp->__anon1.cast.exp = newExp;
FreeType(sourceExp->expType);
sourceExp->expType = (((void *)0));
ProcessExpressionType(sourceExp);
if(!inCompiler)
{
FreeType(sourceExp->expType);
sourceExp->expType = dest;
}
FreeType(source);
if(inCompiler)
FreeType(dest);
if(backupSourceExpType)
FreeType(backupSourceExpType);
return 1;
}
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0);
FreeType(dest);
dest = _class->dataType;
dest->refCount++;
}
if(dest->kind == 7 && (source->kind == 7 || source->kind == 6 || dest->kind == 4 || source->kind == 3 || source->kind == 2 || source->kind == 1 || source->kind == 24))
{
specs = MkListOne(MkSpecifier(DOUBLE));
}
else if(dest->kind == 6 && (source->kind == 6 || dest->kind == 4 || source->kind == 3 || source->kind == 2 || source->kind == 1 || source->kind == 24 || source->kind == 7))
{
specs = MkListOne(MkSpecifier(FLOAT));
}
else if(dest->kind == 4 && (source->kind == 4 || source->kind == 3 || source->kind == 2 || source->kind == 1 || source->kind == 24 || source->kind == 6 || source->kind == 7))
{
specs = MkList();
if(!dest->isSigned)
ListAdd(specs, MkSpecifier(UNSIGNED));
ListAdd(specs, MkSpecifier(INT64));
}
else if(dest->kind == 3 && (source->kind == 3 || source->kind == 2 || source->kind == 1 || source->kind == 24 || source->kind == 6 || source->kind == 7))
{
specs = MkList();
if(!dest->isSigned)
ListAdd(specs, MkSpecifier(UNSIGNED));
ListAdd(specs, MkSpecifier(INT));
}
else if(dest->kind == 2 && (source->kind == 2 || source->kind == 1 || source->kind == 24 || source->kind == 3 || source->kind == 6 || source->kind == 7))
{
specs = MkList();
if(!dest->isSigned)
ListAdd(specs, MkSpecifier(UNSIGNED));
ListAdd(specs, MkSpecifier(SHORT));
}
else if(dest->kind == 1 && (source->kind == 1 || source->kind == 24 || source->kind == 2 || source->kind == 3 || source->kind == 6 || source->kind == 7))
{
specs = MkList();
if(!dest->isSigned)
ListAdd(specs, MkSpecifier(UNSIGNED));
ListAdd(specs, MkSpecifier(CHAR));
}
else
{
FreeType(source);
FreeType(dest);
if(backupSourceExpType)
{
if(sourceExp->expType)
FreeType(sourceExp->expType);
sourceExp->expType = backupSourceExpType;
}
return 0;
}
}
else if(dest->kind == 7 && (source->kind == 7 || source->kind == 6 || source->kind == 4 || source->kind == 3 || source->kind == 15 || source->kind == 2 || source->kind == 24 || source->kind == 1))
{
specs = MkListOne(MkSpecifier(DOUBLE));
}
else if(dest->kind == 6 && (source->kind == 6 || source->kind == 15 || source->kind == 4 || source->kind == 3 || source->kind == 2 || source->kind == 24 || source->kind == 1))
{
specs = MkListOne(MkSpecifier(FLOAT));
}
else if(dest->kind == 24 && (source->kind == 24 || source->kind == 1 || source->kind == 15 || source->kind == 2 || source->kind == 3) && (value == 1 || value == 0))
{
specs = MkList();
ListAdd(specs, MkSpecifier(BOOL));
}
else if(dest->kind == 1 && (source->kind == 24 || source->kind == 1 || source->kind == 15 || source->kind == 2 || source->kind == 3) && (dest->isSigned ? (value >= -128 && value <= 127) : (value >= 0 && value <= 255)))
{
if(source->kind == 3)
{
FreeType(dest);
FreeType(source);
if(backupSourceExpType)
FreeType(backupSourceExpType);
return 1;
}
else
{
specs = MkList();
if(!dest->isSigned)
ListAdd(specs, MkSpecifier(UNSIGNED));
ListAdd(specs, MkSpecifier(CHAR));
}
}
else if(dest->kind == 2 && (source->kind == 15 || source->kind == 24 || source->kind == 1 || source->kind == 2 || (source->kind == 3 && (dest->isSigned ? (value >= -32768 && value <= 32767) : (value >= 0 && value <= 65535)))))
{
if(source->kind == 3)
{
FreeType(dest);
FreeType(source);
if(backupSourceExpType)
FreeType(backupSourceExpType);
return 1;
}
else
{
specs = MkList();
if(!dest->isSigned)
ListAdd(specs, MkSpecifier(UNSIGNED));
ListAdd(specs, MkSpecifier(SHORT));
}
}
else if(dest->kind == 3 && (source->kind == 15 || source->kind == 2 || source->kind == 24 || source->kind == 1 || source->kind == 3))
{
specs = MkList();
if(!dest->isSigned)
ListAdd(specs, MkSpecifier(UNSIGNED));
ListAdd(specs, MkSpecifier(INT));
}
else if(dest->kind == 4 && (source->kind == 15 || source->kind == 2 || source->kind == 24 || source->kind == 1 || source->kind == 3 || source->kind == 4))
{
specs = MkList();
if(!dest->isSigned)
ListAdd(specs, MkSpecifier(UNSIGNED));
ListAdd(specs, MkSpecifier(INT64));
}
else if(dest->kind == 15 && (source->kind == 4 || source->kind == 3 || source->kind == 2 || source->kind == 24 || source->kind == 1))
{
specs = MkListOne(MkEnum(MkIdentifier(dest->__anon1.__anon1.enumName), (((void *)0))));
}
else
{
FreeType(source);
FreeType(dest);
if(backupSourceExpType)
{
if(sourceExp->expType)
FreeType(sourceExp->expType);
sourceExp->expType = backupSourceExpType;
}
return 0;
}
if(!flag && !sourceExp->opDestType)
{
struct Expression * newExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

*newExp = *sourceExp;
newExp->prev = (((void *)0));
newExp->next = (((void *)0));
if(sourceExp->destType)
sourceExp->destType->refCount++;
if(sourceExp->expType)
sourceExp->expType->refCount++;
sourceExp->type = 11;
if(realDest->kind == 8)
{
sourceExp->__anon1.cast.typeName = QMkClass(realDest->__anon1._class->string, (((void *)0)));
FreeList(specs, (void *)(FreeSpecifier));
}
else
sourceExp->__anon1.cast.typeName = MkTypeName(specs, (((void *)0)));
if(newExp->type == 4)
{
sourceExp->__anon1.cast.exp = MkExpBrackets(MkListOne(newExp));
}
else
sourceExp->__anon1.cast.exp = newExp;
FreeType(sourceExp->expType);
sourceExp->expType = (((void *)0));
ProcessExpressionType(sourceExp);
}
else
FreeList(specs, (void *)(FreeSpecifier));
FreeType(dest);
FreeType(source);
if(backupSourceExpType)
FreeType(backupSourceExpType);
return 1;
}
else
{
if(computedExp != nbExp)
{
FreeExpression(computedExp);
computedExp = nbExp;
}
while((sourceExp->type == 5 || sourceExp->type == 32) && sourceExp->__anon1.list)
sourceExp = (*sourceExp->__anon1.list).last;
if(sourceExp->type == 0)
{
struct Identifier * id = sourceExp->__anon1.__anon1.identifier;

if(dest->kind == 8)
{
if(dest->__anon1._class && dest->__anon1._class->__anon1.registered && dest->__anon1._class->__anon1.registered->type == 4)
{
struct __ecereNameSpace__ecere__com__Class * _class = dest->__anon1._class->__anon1.registered;
struct __ecereNameSpace__ecere__com__Class * enumClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "enum");

if(enumClass)
{
for(; _class && _class->type == 4; _class = _class->base)
{
struct __ecereNameSpace__ecere__sys__NamedLink64 * value;
struct __ecereNameSpace__ecere__com__EnumClassData * e = (_class ? ((void *)(((char *)_class->data) + enumClass->offsetClass)) : (((void *)0)));

for(value = e->values.first; value; value = value->next)
{
if(!strcmp(value->name, id->string))
break;
}
if(inBGen && value)
{
if(strcmp(_class->name, "bool"))
{
(__ecereNameSpace__ecere__com__eSystem_Delete(id->string), id->string = 0);
id->string = __ecereNameSpace__ecere__com__PrintString(__ecereClass_char__PTR_, _class->name, __ecereClass_char__PTR_, "_", __ecereClass_char__PTR_, value->name, (void *)0);
}
FreeType(dest);
return 1;
}
else if(value)
{
FreeType(sourceExp->expType);
sourceExp->isConstant = 1;
sourceExp->expType = MkClassType(_class->fullName);
if(inCompiler || inPreCompiler || inDebugger)
{
FreeExpContents(sourceExp);
sourceExp->type = 2;
if(_class->dataTypeString && (!strcmp(_class->dataTypeString, "int") || !strcmp(_class->dataTypeString, "int64") || !strcmp(_class->dataTypeString, "short") || !strcmp(_class->dataTypeString, "char")))
sourceExp->__anon1.__anon1.constant = PrintInt64(value->data);
else
sourceExp->__anon1.__anon1.constant = PrintUInt64(value->data);
}
FreeType(dest);
return 1;
}
}
}
}
}
if(dest->classObjectType != 2 && dest->kind == 8 && MatchWithEnums_Module(privateModule, sourceExp, dest, id->string, conversions))
{
FreeType(dest);
return 1;
}
}
FreeType(dest);
}
return 0;
}

static void PopulateInstanceProcessMember(struct Instantiation * inst, struct __ecereNameSpace__ecere__sys__OldList * memberList, struct __ecereNameSpace__ecere__com__DataMember * parentDataMember, unsigned int offset)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember;

for(dataMember = parentDataMember->members.first; dataMember; dataMember = dataMember->next)
{
if(!dataMember->name && (dataMember->type == 2 || dataMember->type == 1))
PopulateInstanceProcessMember(inst, memberList, dataMember, offset + dataMember->offset);
else
{
struct Expression * exp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);
struct MemberInit * member = MkMemberInit(MkListOne(MkIdentifier(dataMember->name)), MkInitializerAssignment(exp));
struct Type * type;
void * ptr = inst->data + dataMember->offset + offset;
char * result = (((void *)0));

exp->loc = member->loc = inst->loc;
((struct Identifier *)(*member->identifiers).first)->loc = inst->loc;
if(!dataMember->dataType)
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0);
type = dataMember->dataType;
if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = type->__anon1._class->__anon1.registered;

if(_class->type == 4)
{
struct __ecereNameSpace__ecere__com__Class * enumClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "enum");

if(enumClass)
{
struct __ecereNameSpace__ecere__com__EnumClassData * e = (_class ? ((void *)(((char *)_class->data) + enumClass->offsetClass)) : (((void *)0)));
struct __ecereNameSpace__ecere__sys__NamedLink64 * item;

for(item = e->values.first; item; item = item->next)
{
if(item->data == GetEnumValue(_class, ptr))
{
result = item->name;
break;
}
}
if(result)
{
exp->__anon1.__anon1.identifier = MkIdentifier(result);
exp->type = 0;
exp->destType = MkClassType(_class->fullName);
ProcessExpressionType(exp);
}
}
}
if(_class->type == 4 || _class->type == 3 || _class->type == 2)
{
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0);
type = _class->dataType;
}
}
if(!result)
{
switch(type->kind)
{
case 6:
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintFloat(*(float *)ptr);
exp->type = 2;
break;
}
case 7:
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintDouble(*(double *)ptr);
exp->type = 2;
break;
}
case 3:
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintInt(*(int *)ptr);
exp->type = 2;
break;
}
case 4:
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintInt64(*(long long *)ptr);
exp->type = 2;
break;
}
case 22:
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintInt64((long long)*(intptr_t *)ptr);
exp->type = 2;
break;
}
case 23:
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintInt64((long long)*(ssize_t *)ptr);
exp->type = 2;
break;
}
default:
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Unhandled type populating instance\n", (((void *)0))));
}
}
ListAdd(memberList, member);
}
if(parentDataMember->type == 1)
break;
}
}

void CheckTemplateTypes(struct Expression * exp)
{
struct Expression * nbExp = GetNonBracketsExp(exp);

if(exp->destType && exp->destType->passAsTemplate && exp->expType && exp->expType->kind != 20 && !exp->expType->passAsTemplate && (nbExp == exp || nbExp->type != 11))
{
struct Expression * newExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);
struct Context * context;
int kind = exp->expType->kind;

*newExp = *exp;
if(exp->destType)
exp->destType->refCount++;
if(exp->expType)
exp->expType->refCount++;
newExp->prev = (((void *)0));
newExp->next = (((void *)0));
if(exp->expType->kind == 8 && exp->expType->__anon1._class && exp->expType->__anon1._class->__anon1.registered)
{
struct __ecereNameSpace__ecere__com__Class * c = exp->expType->__anon1._class->__anon1.registered;

if(c->type == 2 || c->type == 4 || c->type == 3)
{
if(!c->dataType)
c->dataType = ProcessTypeString(c->dataTypeString, 0);
kind = c->dataType->kind;
}
}
switch(kind)
{
case 7:
if(exp->destType->classObjectType)
{
if(exp->destType)
exp->destType->refCount--;
if(exp->expType)
exp->expType->refCount--;
((newExp ? __extension__ ({
void * __ecerePtrToDelete = (newExp);

__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), newExp = 0);
}
else
{
struct __ecereNameSpace__ecere__sys__OldList * specs;
struct __ecereNameSpace__ecere__sys__OldList * unionDefs = MkList();
struct __ecereNameSpace__ecere__sys__OldList * statements = MkList();

context = PushContext();
ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifier(DOUBLE)), MkListOne(MkDeclaratorIdentifier(MkIdentifier("d"))), (((void *)0)))));
ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifierName("uint64")), MkListOne(MkDeclaratorIdentifier(MkIdentifier("i"))), (((void *)0)))));
specs = MkListOne(MkStructOrUnion(4, (((void *)0)), unionDefs));
exp->type = 23;
modifyPassAsTemplate(&exp->expType, 1);
modifyPassAsTemplate(&newExp->destType, 0);
modifyPassAsTemplate(&newExp->expType, 0);
exp->__anon1.compound = MkCompoundStmt(MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_union")), (((void *)0)))))), statements);
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("d")), '=', newExp))));
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("i")))));
exp->__anon1.compound->__anon1.compound.context = context;
PopContext(context);
}
break;
case 6:
if(exp->destType->classObjectType)
{
if(exp->destType)
exp->destType->refCount--;
if(exp->expType)
exp->expType->refCount--;
((newExp ? __extension__ ({
void * __ecerePtrToDelete = (newExp);

__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), newExp = 0);
}
else
{
struct __ecereNameSpace__ecere__sys__OldList * specs;
struct __ecereNameSpace__ecere__sys__OldList * unionDefs = MkList();
struct __ecereNameSpace__ecere__sys__OldList * statements = MkList();

context = PushContext();
ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifier(FLOAT)), MkListOne(MkDeclaratorIdentifier(MkIdentifier("f"))), (((void *)0)))));
ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifierName("uint64")), MkListOne(MkDeclaratorIdentifier(MkIdentifier("i"))), (((void *)0)))));
specs = MkListOne(MkStructOrUnion(4, (((void *)0)), unionDefs));
exp->type = 23;
exp->__anon1.compound = MkCompoundStmt(MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_union")), (((void *)0)))))), statements);
modifyPassAsTemplate(&exp->expType, 1);
modifyPassAsTemplate(&newExp->destType, 0);
modifyPassAsTemplate(&newExp->expType, 0);
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("f")), '=', newExp))));
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("i")))));
exp->__anon1.compound->__anon1.compound.context = context;
PopContext(context);
}
break;
case 0:
break;
default:
exp->type = 11;
exp->__anon1.cast.typeName = MkTypeName(MkListOne(MkSpecifierName("uint64")), (((void *)0)));
if((exp->expType->kind == 8 && exp->expType->__anon1._class && exp->expType->__anon1._class->__anon1.registered && exp->expType->__anon1._class->__anon1.registered->type == 1) || __ecereProp_Type_Get_isPointerType(exp->expType))
exp->__anon1.cast.exp = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), (((void *)0))), MkExpBrackets(MkListOne(newExp)));
else
exp->__anon1.cast.exp = MkExpBrackets(MkListOne(newExp));
exp->needCast = 1;
break;
}
}
else if(exp->expType && exp->expType->passAsTemplate && exp->destType && ((unsigned int)((exp->usage & 0x1) >> 0)) && exp->destType->kind != 20 && !exp->destType->passAsTemplate)
{
struct Expression * newExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);
struct Context * context;
int kind = exp->expType->kind;

*newExp = *exp;
if(exp->destType)
exp->destType->refCount++;
if(exp->expType)
exp->expType->refCount++;
newExp->prev = (((void *)0));
newExp->next = (((void *)0));
if(exp->expType->kind == 8 && exp->expType->__anon1._class && exp->expType->__anon1._class->__anon1.registered)
{
struct __ecereNameSpace__ecere__com__Class * c = exp->expType->__anon1._class->__anon1.registered;

if(c->type == 2 || c->type == 4 || c->type == 3)
{
if(!c->dataType)
c->dataType = ProcessTypeString(c->dataTypeString, 0);
kind = c->dataType->kind;
}
}
switch(kind)
{
case 7:
if(exp->destType->classObjectType)
{
if(exp->destType)
exp->destType->refCount--;
if(exp->expType)
exp->expType->refCount--;
((newExp ? __extension__ ({
void * __ecerePtrToDelete = (newExp);

__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), newExp = 0);
}
else
{
struct __ecereNameSpace__ecere__sys__OldList * specs;
struct __ecereNameSpace__ecere__sys__OldList * unionDefs = MkList();
struct __ecereNameSpace__ecere__sys__OldList * statements = MkList();

context = PushContext();
ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifier(DOUBLE)), MkListOne(MkDeclaratorIdentifier(MkIdentifier("d"))), (((void *)0)))));
ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifierName("uint64")), MkListOne(MkDeclaratorIdentifier(MkIdentifier("i"))), (((void *)0)))));
specs = MkListOne(MkStructOrUnion(4, (((void *)0)), unionDefs));
exp->type = 23;
exp->__anon1.compound = MkCompoundStmt(MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_union")), (((void *)0)))))), statements);
modifyPassAsTemplate(&exp->expType, 0);
modifyPassAsTemplate(&newExp->destType, 1);
modifyPassAsTemplate(&newExp->expType, 1);
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("i")), '=', newExp))));
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("d")))));
exp->__anon1.compound->__anon1.compound.context = context;
PopContext(context);
}
break;
case 6:
if(exp->destType->classObjectType)
{
if(exp->destType)
exp->destType->refCount--;
if(exp->expType)
exp->expType->refCount--;
((newExp ? __extension__ ({
void * __ecerePtrToDelete = (newExp);

__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), newExp = 0);
}
else
{
struct __ecereNameSpace__ecere__sys__OldList * specs;
struct __ecereNameSpace__ecere__sys__OldList * unionDefs = MkList();
struct __ecereNameSpace__ecere__sys__OldList * statements = MkList();

context = PushContext();
ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifier(FLOAT)), MkListOne(MkDeclaratorIdentifier(MkIdentifier("f"))), (((void *)0)))));
ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifierName("uint64")), MkListOne(MkDeclaratorIdentifier(MkIdentifier("i"))), (((void *)0)))));
specs = MkListOne(MkStructOrUnion(4, (((void *)0)), unionDefs));
exp->type = 23;
exp->__anon1.compound = MkCompoundStmt(MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_union")), (((void *)0)))))), statements);
modifyPassAsTemplate(&exp->expType, 0);
modifyPassAsTemplate(&newExp->destType, 1);
modifyPassAsTemplate(&newExp->expType, 1);
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("i")), '=', newExp))));
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("f")))));
exp->__anon1.compound->__anon1.compound.context = context;
PopContext(context);
}
break;
case 8:
{
if(exp->expType->__anon1._class && exp->expType->__anon1._class->__anon1.registered && exp->expType->__anon1._class->__anon1.registered->type == 1)
{
exp->type = 5;
newExp = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), (((void *)0))), newExp);
exp->__anon1.list = MkListOne(MkExpOp((((void *)0)), '*', MkExpCast(MkTypeName(MkListOne(MkSpecifierName(exp->expType->__anon1._class->string)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), newExp)));
ProcessExpressionType((*exp->__anon1.list).first);
break;
}
else
{
exp->type = 5;
if(__ecereProp_Type_Get_isPointerType(exp->expType))
{
exp->needTemplateCast = 2;
newExp->needCast = 1;
newExp->needTemplateCast = 2;
newExp = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), (((void *)0))), newExp);
}
exp->__anon1.list = MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName(exp->expType->__anon1._class->string)), (((void *)0))), newExp));
exp->needTemplateCast = 2;
newExp->needCast = 1;
newExp->needTemplateCast = 2;
ProcessExpressionType((*exp->__anon1.list).first);
break;
}
}
default:
{
if(exp->expType->kind == 20)
{
struct Type * type = ProcessTemplateParameterType(exp->expType->__anon1.templateParameter);

if(type)
{
FreeType(exp->destType);
FreeType(exp->expType);
((newExp ? __extension__ ({
void * __ecerePtrToDelete = (newExp);

__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), newExp = 0);
break;
}
}
{
char typeString[1024];
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

typeString[0] = '\0';
PrintType(exp->expType, typeString, 0, 0);
decl = SpecDeclFromString(typeString, specs, (((void *)0)));
exp->type = 11;
exp->__anon1.cast.typeName = MkTypeName(specs, decl);
exp->__anon1.cast.exp = MkExpBrackets(MkListOne(newExp));
exp->__anon1.cast.exp->needCast = 1;
exp->needTemplateCast = 2;
newExp->needTemplateCast = 2;
}
break;
}
}
}
}

static void ProcessInitializer(struct Initializer * init, struct Type * type)
{
switch(init->type)
{
case 0:
if(!init->__anon1.exp || init->__anon1.exp->type != 1 || !init->__anon1.exp->__anon1.instance || init->__anon1.exp->__anon1.instance->_class || !type || type->kind == 8)
{
if(init->__anon1.exp && !init->__anon1.exp->destType)
{
FreeType(init->__anon1.exp->destType);
init->__anon1.exp->destType = type;
if(type)
type->refCount++;
}
if(init->__anon1.exp)
{
ProcessExpressionType(init->__anon1.exp);
init->isConstant = init->__anon1.exp->isConstant;
}
break;
}
else
{
struct Expression * exp = init->__anon1.exp;
struct Instantiation * inst = exp->__anon1.instance;
struct MembersInit * members;

init->type = 1;
init->__anon1.list = MkList();
if(inst->members)
{
for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0)
{
struct MemberInit * member;

for(member = (*members->__anon1.dataMembers).first; member; member = member->next)
{
ListAdd(init->__anon1.list, member->initializer);
member->initializer = (((void *)0));
}
}
}
}
FreeExpression(exp);
}
case 1:
{
struct Initializer * i;
struct Type * initializerType = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * curClass = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * curMember = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * subMemberStack[256];
int subMemberStackPos = 0;

if(type && type->kind == 12)
initializerType = Dereference(type);
else if(type && (type->kind == 9 || type->kind == 10))
initializerType = type->__anon1.__anon1.members.first;
for(i = (*init->__anon1.list).first; i; i = i->next)
{
if(type && type->kind == 8 && type->__anon1._class && type->__anon1._class->__anon1.registered)
{
FindNextDataMember(type->__anon1._class->__anon1.registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
if(curMember)
{
if(!curMember->dataType)
curMember->dataType = ProcessTypeString(curMember->dataTypeString, 0);
initializerType = curMember->dataType;
}
}
ProcessInitializer(i, initializerType);
if(initializerType && type && (type->kind == 9 || type->kind == 10))
initializerType = initializerType->next;
if(!i->isConstant)
init->isConstant = 0;
}
if(type && type->kind == 12)
FreeType(initializerType);
if(type && type->kind != 12 && type->kind != 9 && type->kind != 10 && (type->kind != 8 || !type->__anon1._class->__anon1.registered || type->__anon1._class->__anon1.registered->type != 1))
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Assigning list initializer to non list\n", (((void *)0))));
}
break;
}
}
}

static void CreateFireWatcher(struct __ecereNameSpace__ecere__com__Property * prop, struct Expression * object, struct Statement * stmt)
{
char propName[1024], propNameM[1024];
char getName[1024], setName[1024];
struct __ecereNameSpace__ecere__sys__OldList * args;

DeclareProperty(curExternal, prop, setName, getName);
strcpy(propName, "__ecereProp_");
FullClassNameCat(propName, prop->_class->fullName, 0);
strcat(propName, "_");
FullClassNameCat(propName, prop->name, 1);
strcpy(propNameM, "__ecerePropM_");
FullClassNameCat(propNameM, prop->_class->fullName, 0);
strcat(propNameM, "_");
FullClassNameCat(propNameM, prop->name, 1);
if(prop->isWatchable)
{
args = MkList();
ListAdd(args, object ? CopyExpression(object) : MkExpIdentifier(MkIdentifier("this")));
ListAdd(args, MkExpIdentifier(MkIdentifier(propName)));
ListAdd(stmt->__anon1.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_FireWatchers")), args));
args = MkList();
ListAdd(args, object ? CopyExpression(object) : MkExpIdentifier(MkIdentifier("this")));
ListAdd(args, MkExpIdentifier(MkIdentifier(propNameM)));
ListAdd(stmt->__anon1.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_FireWatchers")), args));
DeclareFunctionUtil(curExternal, "eInstance_FireWatchers");
}
{
args = MkList();
ListAdd(args, object ? CopyExpression(object) : MkExpIdentifier(MkIdentifier("this")));
ListAdd(args, MkExpIdentifier(MkIdentifier(propName)));
ListAdd(stmt->__anon1.expressions, MkExpCondition(MkExpOp(MkExpIdentifier(MkIdentifier(propName)), AND_OP, MkExpMember(MkExpIdentifier(MkIdentifier(propName)), MkIdentifier("selfWatchable"))), MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_FireSelfWatchers")), args)), MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), (((void *)0))), MkExpConstant("0"))));
ProcessExpressionType((*stmt->__anon1.expressions).last);
args = MkList();
ListAdd(args, object ? CopyExpression(object) : MkExpIdentifier(MkIdentifier("this")));
ListAdd(args, MkExpIdentifier(MkIdentifier(propNameM)));
ListAdd(stmt->__anon1.expressions, MkExpCondition(MkExpOp(MkExpIdentifier(MkIdentifier(propNameM)), AND_OP, MkExpMember(MkExpIdentifier(MkIdentifier(propNameM)), MkIdentifier("selfWatchable"))), MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_FireSelfWatchers")), args)), MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), (((void *)0))), MkExpConstant("0"))));
ProcessExpressionType((*stmt->__anon1.expressions).last);
DeclareFunctionUtil(curExternal, "eInstance_FireSelfWatchers");
}
if(curFunction->propSet && !strcmp(curFunction->propSet->string, prop->name) && (!object || (object->type == 0 && !strcmp(object->__anon1.__anon1.identifier->string, "this"))))
curFunction->propSet->fireWatchersDone = 1;
}

static unsigned int CheckExpressionType(struct Expression * exp, struct Type * destType, unsigned int skipUnitBla, unsigned int warnConst)
{
unsigned int result = 1;

if(destType)
{
struct __ecereNameSpace__ecere__sys__OldList converts =
{
0, 0, 0, 0, 0
};
struct Conversion * convert;

if(destType->kind == 0)
return 0;
if(!MatchTypeExpression(exp, destType, &converts, skipUnitBla, warnConst))
result = 0;
if(converts.count)
{
for(convert = converts.first; convert; convert = convert->next)
{
unsigned int empty = !(convert->isGet ? (void *)convert->convert->Get : (void *)convert->convert->Set);

if(!empty)
{
struct Expression * newExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);
int objectType = exp->expType ? exp->expType->classObjectType : 0;

*newExp = *exp;
newExp->prev = (((void *)0));
newExp->next = (((void *)0));
newExp->destType = (((void *)0));
if(convert->isGet)
{
exp->type = 8;
exp->addedThis = 1;
exp->__anon1.member.exp = newExp;
FreeType(exp->__anon1.member.exp->expType);
exp->__anon1.member.exp->expType = MkClassType(convert->convert->_class->fullName);
exp->__anon1.member.exp->expType->classObjectType = objectType;
exp->__anon1.member.member = MkIdentifier(convert->convert->dataTypeString);
exp->__anon1.member.memberType = 1;
exp->expType = convert->resultType ? convert->resultType : convert->convert->dataType;
exp->needCast = 1;
if(exp->expType)
exp->expType->refCount++;
ApplyAnyObjectLogic(exp->__anon1.member.exp);
}
else
{
{
exp->type = 8;
exp->addedThis = 1;
exp->__anon1.member.exp = newExp;
if(newExp->expType && newExp->expType->kind == 8 && newExp->expType->__anon1._class && newExp->expType->__anon1._class->__anon1.registered && newExp->expType->__anon1._class->__anon1.registered->type == 5)
{
newExp->byReference = 1;
}
FreeType(exp->__anon1.member.exp->expType);
exp->__anon1.member.exp->expType = (((void *)0));
if(convert->convert->dataType)
{
exp->__anon1.member.exp->expType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
CopyTypeInto(exp->__anon1.member.exp->expType, convert->convert->dataType);
exp->__anon1.member.exp->expType->refCount = 1;
exp->__anon1.member.exp->expType->classObjectType = objectType;
ApplyAnyObjectLogic(exp->__anon1.member.exp);
}
exp->__anon1.member.member = MkIdentifier(convert->convert->_class->fullName);
exp->__anon1.member.memberType = 4;
exp->expType = convert->resultType ? convert->resultType : MkClassType(convert->convert->_class->fullName);
exp->needCast = 1;
if(convert->resultType)
convert->resultType->refCount++;
}
}
}
else
{
FreeType(exp->expType);
if(convert->isGet)
{
exp->expType = convert->resultType ? convert->resultType : convert->convert->dataType;
if(exp->destType && exp->destType->casted)
exp->needCast = 1;
if(exp->expType)
exp->expType->refCount++;
}
else
{
exp->expType = convert->resultType ? convert->resultType : MkClassType(convert->convert->_class->fullName);
if(exp->destType && exp->destType->casted)
exp->needCast = 1;
if(convert->resultType)
convert->resultType->refCount++;
}
}
}
if(exp->isConstant && inCompiler)
ComputeExpression(exp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&converts, (void *)(FreeConvert));
}
if(!result && exp->expType && converts.count)
{
result = MatchTypes(exp->expType, exp->destType, (((void *)0)), (((void *)0)), (((void *)0)), 1, 1, 0, 0, warnConst);
}
if(!result && exp->expType && exp->destType)
{
if((exp->destType->kind == 8 && exp->expType->kind == 13 && exp->expType->__anon1.type->kind == 8 && exp->expType->__anon1.type->__anon1._class == exp->destType->__anon1._class && exp->destType->__anon1._class->__anon1.registered && exp->destType->__anon1._class->__anon1.registered->type == 1) || (exp->expType->kind == 8 && exp->destType->kind == 13 && exp->destType->__anon1.type->kind == 8 && exp->destType->__anon1.type->__anon1._class == exp->expType->__anon1._class && exp->expType->__anon1._class->__anon1.registered && exp->expType->__anon1._class->__anon1.registered->type == 1))
result = 1;
}
}
return result;
}

void PopulateInstance(struct Instantiation * inst)
{
struct Symbol * classSym = inst->_class->__anon1.__anon1.symbol;
struct __ecereNameSpace__ecere__com__Class * _class = classSym->__anon1.registered;
struct __ecereNameSpace__ecere__com__DataMember * dataMember;
struct __ecereNameSpace__ecere__sys__OldList * memberList = MkList();

if(!inst->members)
inst->members = MkListOne(MkMembersInitList(memberList));
else
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*inst->members), MkMembersInitList(memberList));
for(dataMember = _class->membersAndProperties.first; dataMember; dataMember = dataMember->next)
{
if(!dataMember->isProperty)
{
if(!dataMember->name && (dataMember->type == 2 || dataMember->type == 1))
PopulateInstanceProcessMember(inst, memberList, dataMember, dataMember->offset);
else
{
struct Expression * exp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);
struct MemberInit * member = MkMemberInit(MkListOne(MkIdentifier(dataMember->name)), MkInitializerAssignment(exp));
struct Type * type;
void * ptr = inst->data + dataMember->offset;
char * result = (((void *)0));

exp->loc = member->loc = inst->loc;
((struct Identifier *)(*member->identifiers).first)->loc = inst->loc;
if(!dataMember->dataType)
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0);
type = dataMember->dataType;
if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = type->__anon1._class->__anon1.registered;

if(_class->type == 4)
{
struct __ecereNameSpace__ecere__com__Class * enumClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "enum");

if(enumClass)
{
struct __ecereNameSpace__ecere__com__EnumClassData * e = (_class ? ((void *)(((char *)_class->data) + enumClass->offsetClass)) : (((void *)0)));
struct __ecereNameSpace__ecere__sys__NamedLink64 * item;

for(item = e->values.first; item; item = item->next)
{
if(item->data == GetEnumValue(_class, ptr))
{
result = item->name;
break;
}
}
}
if(result)
{
exp->__anon1.__anon1.identifier = MkIdentifier(result);
exp->type = 0;
exp->destType = MkClassType(_class->fullName);
ProcessExpressionType(exp);
}
}
if(_class->type == 4 || _class->type == 3 || _class->type == 2)
{
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0);
type = _class->dataType;
}
}
if(!result)
{
switch(type->kind)
{
case 6:
{
exp->__anon1.__anon1.constant = PrintFloat(*(float *)ptr);
exp->type = 2;
break;
}
case 7:
{
exp->__anon1.__anon1.constant = PrintDouble(*(double *)ptr);
exp->type = 2;
break;
}
case 3:
{
exp->__anon1.__anon1.constant = PrintInt(*(int *)ptr);
exp->type = 2;
break;
}
case 4:
{
exp->__anon1.__anon1.constant = PrintInt64(*(long long *)ptr);
exp->type = 2;
break;
}
case 22:
{
exp->__anon1.__anon1.constant = PrintInt64((long long)*(intptr_t *)ptr);
exp->type = 2;
break;
}
default:
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Unhandled type populating instance\n", (((void *)0))));
}
}
ListAdd(memberList, member);
}
}
}
}

void ProcessMemberInitData(struct MemberInit * member, struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class ** curClass, struct __ecereNameSpace__ecere__com__DataMember ** curMember, struct __ecereNameSpace__ecere__com__DataMember ** subMemberStack, int * subMemberStackPos)
{
struct Identifier * ident = member->identifiers ? (*member->identifiers).first : (((void *)0));
unsigned int found = 0;
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (((void *)0));
struct __ecereNameSpace__ecere__com__Method * method = (((void *)0));
unsigned int freeType = 0;

yylloc = member->loc;
if(!ident)
{
if(curMember)
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(_class, curClass, curMember, subMemberStack, subMemberStackPos);
if(*curMember)
{
found = 1;
dataMember = *curMember;
}
}
}
else
{
struct __ecereNameSpace__ecere__com__DataMember * thisMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(_class, ident->string, privateModule);
struct __ecereNameSpace__ecere__com__DataMember * _subMemberStack[256];
int _subMemberStackPos = 0;

if(!thisMember)
thisMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, ident->string, privateModule, _subMemberStack, &_subMemberStackPos);
if(thisMember)
{
dataMember = thisMember;
if(curMember && thisMember->memberAccess == 1)
{
*curMember = thisMember;
*curClass = thisMember->_class;
memcpy(subMemberStack, _subMemberStack, sizeof(struct __ecereNameSpace__ecere__com__DataMember *) * _subMemberStackPos);
*subMemberStackPos = _subMemberStackPos;
}
found = 1;
}
else
{
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, ident->string, privateModule);
if(method && method->type == 1)
found = 1;
else
method = (((void *)0));
}
}
if(found)
{
struct Type * type = (((void *)0));

if(dataMember)
{
if(!dataMember->dataType && dataMember->dataTypeString)
{
struct Context * context = SetupTemplatesContext(_class);

dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0);
FinishTemplatesContext(context);
}
type = dataMember->dataType;
}
else if(method)
{
if(!method->dataType)
ProcessMethodType(method);
type = method->dataType;
}
if(ident && ident->next)
{
for(ident = ident->next; ident && type; ident = ident->next)
{
if(type->kind == 8)
{
dataMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(type->__anon1._class->__anon1.registered, ident->string, privateModule);
if(!dataMember)
dataMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(type->__anon1._class->__anon1.registered, ident->string, privateModule, (((void *)0)), (((void *)0)));
if(dataMember)
type = dataMember->dataType;
}
else if(type->kind == 9 || type->kind == 10)
{
struct Type * memberType;

for(memberType = type->__anon1.__anon1.members.first; memberType; memberType = memberType->next)
{
if(!strcmp(memberType->name, ident->string))
{
type = memberType;
break;
}
}
}
}
}
if(type && type->kind == 20 && type->__anon1.templateParameter->type == 0 && _class->templateArgs)
{
int id = 0;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * curParam = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = _class; sClass; sClass = sClass->base)
{
id = 0;
if(sClass->templateClass)
sClass = sClass->templateClass;
for(curParam = sClass->templateParams.first; curParam; curParam = curParam->next)
{
if(curParam->type == 0 && !strcmp(type->__anon1.templateParameter->identifier->string, curParam->name))
{
for(sClass = sClass->base; sClass; sClass = sClass->base)
{
if(sClass->templateClass)
sClass = sClass->templateClass;
id += sClass->templateParams.count;
}
break;
}
id++;
}
if(curParam)
break;
}
if(curParam)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument arg = _class->templateArgs[id];

if(arg.__anon1.__anon1.dataTypeString)
{
unsigned int constant = type->constant;

type = ProcessTypeString(arg.__anon1.__anon1.dataTypeString, 0);
if(type->kind == 8 && constant)
type->constant = 1;
else if(type->kind == 13)
{
struct Type * t = type->__anon1.type;

while(t->kind == 13)
t = t->__anon1.type;
if(constant)
t->constant = constant;
}
freeType = 1;
if(type && _class->templateClass)
type->passAsTemplate = 1;
if(type)
{
}
}
}
}
if(type && type->kind == 8 && type->__anon1._class && type->__anon1._class->__anon1.registered && strchr(type->__anon1._class->__anon1.registered->fullName, '<'))
{
struct __ecereNameSpace__ecere__com__Class * expClass = type->__anon1._class->__anon1.registered;
struct __ecereNameSpace__ecere__com__Class * cClass = (((void *)0));
int paramCount = 0;
int lastParam = -1;
char templateString[1024];
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

sprintf(templateString, "%s<", expClass->templateClass->fullName);
for(cClass = expClass; cClass; cClass = cClass->base)
{
int p = 0;

if(cClass->templateClass)
cClass = cClass->templateClass;
for(param = cClass->templateParams.first; param; param = param->next)
{
int id = p;
struct __ecereNameSpace__ecere__com__Class * sClass;
struct __ecereNameSpace__ecere__com__ClassTemplateArgument arg;

for(sClass = cClass->base; sClass; sClass = sClass->base)
{
if(sClass->templateClass)
sClass = sClass->templateClass;
id += sClass->templateParams.count;
}
arg = expClass->templateArgs[id];
for(sClass = _class; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * cParam;
int p = 0;
struct __ecereNameSpace__ecere__com__Class * nextClass;

if(sClass->templateClass)
sClass = sClass->templateClass;
for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
{
if(nextClass->templateClass)
nextClass = nextClass->templateClass;
p += nextClass->templateParams.count;
}
for(cParam = sClass->templateParams.first; cParam; cParam = cParam->next, p++)
{
if(cParam->type == 0 && arg.__anon1.__anon1.dataTypeString && !strcmp(cParam->name, arg.__anon1.__anon1.dataTypeString))
{
if(_class->templateArgs && arg.__anon1.__anon1.dataTypeString && (!param->defaultArg.__anon1.__anon1.dataTypeString || strcmp(arg.__anon1.__anon1.dataTypeString, param->defaultArg.__anon1.__anon1.dataTypeString)))
{
arg.__anon1.__anon1.dataTypeString = _class->templateArgs[p].__anon1.__anon1.dataTypeString;
arg.__anon1.__anon1.dataTypeClass = _class->templateArgs[p].__anon1.__anon1.dataTypeClass;
break;
}
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
char expString[1024];
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl = SpecDeclFromString(param->__anon1.dataTypeString, specs, (((void *)0)));
struct Expression * exp;
char * string = PrintHexUInt64(arg.__anon1.expression.__anon1.ui64);

exp = MkExpCast(MkTypeName(specs, decl), MkExpConstant(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
ProcessExpressionType(exp);
ComputeExpression(exp);
expString[0] = '\0';
PrintExpression(exp, expString);
strcat(argument, expString);
FreeExpression(exp);
break;
}
case 1:
{
strcat(argument, arg.__anon1.__anon2.__anon1.member->name);
break;
}
case 0:
{
if(arg.__anon1.__anon1.dataTypeString && (!param->defaultArg.__anon1.__anon1.dataTypeString || strcmp(arg.__anon1.__anon1.dataTypeString, param->defaultArg.__anon1.__anon1.dataTypeString)))
strcat(argument, arg.__anon1.__anon1.dataTypeString);
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
p++;
}
}
}
{
int len = strlen(templateString);

if(templateString[len - 1] == '<')
len--;
else
{
if(templateString[len - 1] == '>')
templateString[len++] = ' ';
templateString[len++] = '>';
}
templateString[len++] = '\0';
}
{
struct Context * context = SetupTemplatesContext(_class);

if(freeType)
FreeType(type);
type = ProcessTypeString(templateString, 0);
freeType = 1;
FinishTemplatesContext(context);
}
}
if(method && member->initializer && member->initializer->type == 0 && member->initializer->__anon1.exp)
{
ProcessExpressionType(member->initializer->__anon1.exp);
if(!member->initializer->__anon1.exp->expType)
{
if(inCompiler)
{
char expString[10240];

expString[0] = '\0';
PrintExpression(member->initializer->__anon1.exp, expString);
__ecereNameSpace__ecere__sys__ChangeCh(expString, '\n', ' ');
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "unresolved symbol used as an instance method %s\n", (((void *)0))), expString);
}
}
else if(!MatchTypes(member->initializer->__anon1.exp->expType, type, (((void *)0)), (((void *)0)), _class, 1, 1, 0, 0, 1))
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "incompatible instance method %s\n", (((void *)0))), ident->string);
}
}
else if(member->initializer)
{
ProcessInitializer(member->initializer, type);
}
if(freeType)
FreeType(type);
}
else
{
if(_class && _class->type == 3)
{
if(member->initializer)
{
struct Type * type = MkClassType(_class->fullName);

ProcessInitializer(member->initializer, type);
FreeType(type);
}
}
else
{
if(member->initializer)
{
ProcessInitializer(member->initializer, (((void *)0)));
}
if(ident)
{
if(method)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "couldn't find virtual method %s in class %s\n", (((void *)0))), ident->string, _class->fullName);
}
else if(_class)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "couldn't find member %s in class %s\n", (((void *)0))), ident->string, _class->fullName);
if(inCompiler)
__ecereNameSpace__ecere__com__eClass_AddDataMember(_class, ident->string, "int", 0, 0, 1);
}
}
else if(_class)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "too many initializers for instantiation of class %s\n", (((void *)0))), _class->fullName);
}
}
}

void ComputeInstantiation(struct Expression * exp)
{
struct Instantiation * inst = exp->__anon1.instance;
struct MembersInit * members;
struct Symbol * classSym = inst->_class ? inst->_class->__anon1.__anon1.symbol : (((void *)0));
struct __ecereNameSpace__ecere__com__Class * _class = classSym ? classSym->__anon1.registered : (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * curMember = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * curClass = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * subMemberStack[256];
int subMemberStackPos = 0;
uint64 bits = 0;

if(_class && (_class->type == 1 || _class->type == 0 || _class->type == 5))
{
if(inst->data)
return ;
if(_class->type == 0 || _class->type == 5)
{
inst->data = (unsigned char *)__ecereNameSpace__ecere__com__eInstance_New(_class);
if(_class->type == 0)
((struct __ecereNameSpace__ecere__com__Instance *)(char *)((struct __ecereNameSpace__ecere__com__Instance *)inst->data))->_refCount++;
}
else
inst->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
}
if(inst->members)
{
for(members = (*inst->members).first; members; members = members->next)
{
switch(members->type)
{
case 0:
{
if(members->__anon1.dataMembers)
{
struct MemberInit * member;

for(member = (*members->__anon1.dataMembers).first; member; member = member->next)
{
struct Identifier * ident = member->identifiers ? (*member->identifiers).first : (((void *)0));
unsigned int found = 0;
struct __ecereNameSpace__ecere__com__Property * prop = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (((void *)0));
unsigned int dataMemberOffset;

if(!ident)
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(_class, &curClass, &curMember, subMemberStack, &subMemberStackPos);
if(curMember)
{
if(curMember->isProperty)
prop = (struct __ecereNameSpace__ecere__com__Property *)curMember;
else
{
dataMember = curMember;
__ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(_class, dataMember->name, &dataMemberOffset, privateModule, (((void *)0)), (((void *)0)));
if(dataMember->_class->type == 0 || dataMember->_class->type == 5)
dataMemberOffset += dataMember->_class->base->structSize;
}
found = 1;
}
}
else
{
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, ident->string, privateModule);
if(prop)
{
found = 1;
if(prop->memberAccess == 1)
{
curMember = (struct __ecereNameSpace__ecere__com__DataMember *)prop;
curClass = prop->_class;
}
}
else
{
struct __ecereNameSpace__ecere__com__DataMember * _subMemberStack[256];
int _subMemberStackPos = 0;

dataMember = __ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(_class, ident->string, &dataMemberOffset, privateModule, _subMemberStack, &_subMemberStackPos);
if(dataMember)
{
if(dataMember->_class->type == 0 || dataMember->_class->type == 5)
dataMemberOffset += dataMember->_class->base->structSize;
found = 1;
if(dataMember->memberAccess == 1)
{
curMember = dataMember;
curClass = dataMember->_class;
memcpy(subMemberStack, _subMemberStack, sizeof(struct __ecereNameSpace__ecere__com__DataMember *) * _subMemberStackPos);
subMemberStackPos = _subMemberStackPos;
}
}
}
}
if(found && member->initializer && member->initializer->type == 0)
{
struct Expression * value = member->initializer->__anon1.exp;
struct Type * type = (((void *)0));
unsigned int deepMember = 0;

if(prop)
{
type = prop->dataType;
}
else if(dataMember)
{
if(!dataMember->dataType)
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0);
type = dataMember->dataType;
}
if(ident && ident->next)
{
deepMember = 1;
for(ident = ident->next; ident && type; ident = ident->next)
{
if(type->kind == 8)
{
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(type->__anon1._class->__anon1.registered, ident->string, privateModule);
if(prop)
type = prop->dataType;
else
{
dataMember = __ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(type->__anon1._class->__anon1.registered, ident->string, &dataMemberOffset, privateModule, (((void *)0)), (((void *)0)));
if(dataMember)
{
if(dataMember->_class->type == 0 || dataMember->_class->type == 5)
dataMemberOffset += dataMember->_class->base->structSize;
type = dataMember->dataType;
}
}
}
else if(type->kind == 9 || type->kind == 10)
{
struct Type * memberType;

for(memberType = type->__anon1.__anon1.members.first; memberType; memberType = memberType->next)
{
if(!strcmp(memberType->name, ident->string))
{
type = memberType;
break;
}
}
}
}
}
if(value)
{
FreeType(value->destType);
value->destType = type;
if(type)
type->refCount++;
ComputeExpression(value);
}
if(!deepMember && type && value && (_class->type == 1 || _class->type == 0 || _class->type == 5))
{
if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = type->__anon1._class->__anon1.registered;

if(_class && (_class->type == 2 || _class->type == 3 || _class->type == 4))
{
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0);
type = _class->dataType;
}
}
if(dataMember)
{
void * ptr = inst->data + dataMemberOffset;

if(value->type == 2)
{
switch(type->kind)
{
case 3:
{
GetInt(value, (int *)ptr);
break;
}
case 4:
{
GetInt64(value, (long long *)ptr);
break;
}
case 22:
{
GetIntPtr(value, (intptr_t *)ptr);
break;
}
case 23:
{
GetIntSize(value, (ssize_t *)ptr);
break;
}
case 6:
{
GetFloat(value, (float *)ptr);
break;
}
case 7:
{
GetDouble(value, (double *)ptr);
break;
}
}
}
else if(value->type == 1)
{
if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = type->__anon1._class->__anon1.registered;

if(_class->type == 1)
{
ComputeTypeSize(type);
if(value->__anon1.instance->data)
memcpy(ptr, value->__anon1.instance->data, type->size);
}
}
}
}
else if(prop && prop->Set && prop->Set != (void *)(intptr_t)1)
{
if(value->type == 1 && value->__anon1.instance->data)
{
if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = type->__anon1._class->__anon1.registered;

if(_class && (_class->type != 0 || __ecereNameSpace__ecere__com__eClass_IsDerived(((struct __ecereNameSpace__ecere__com__Instance *)(char *)((struct __ecereNameSpace__ecere__com__Instance *)value->__anon1.instance->data))->_class, _class)))
{
void (* Set)(void *, void *) = (void *)prop->Set;

Set(inst->data, value->__anon1.instance->data);
PopulateInstance(inst);
}
}
}
else if(value->type == 2)
{
switch(type->kind)
{
case 7:
{
void (* Set)(void *, double) = (void *)prop->Set;

Set(inst->data, strtod(value->__anon1.__anon1.constant, (((void *)0))));
break;
}
case 6:
{
void (* Set)(void *, float) = (void *)prop->Set;

Set(inst->data, (float)(strtod(value->__anon1.__anon1.constant, (((void *)0)))));
break;
}
case 3:
{
void (* Set)(void *, int) = (void *)prop->Set;

Set(inst->data, strtol(value->__anon1.__anon1.constant, (((void *)0)), 0));
break;
}
case 4:
{
void (* Set)(void *, long long) = (void *)prop->Set;

Set(inst->data, __ecereNameSpace__ecere__com___strtoi64(value->__anon1.__anon1.constant, (((void *)0)), 0));
break;
}
case 22:
{
void (* Set)(void *, intptr_t) = (void *)prop->Set;

Set(inst->data, (intptr_t)__ecereNameSpace__ecere__com___strtoi64(value->__anon1.__anon1.constant, (((void *)0)), 0));
break;
}
case 23:
{
void (* Set)(void *, ssize_t) = (void *)prop->Set;

Set(inst->data, (ssize_t)__ecereNameSpace__ecere__com___strtoi64(value->__anon1.__anon1.constant, (((void *)0)), 0));
break;
}
}
}
else if(value->type == 3)
{
char temp[1024];

ReadString(temp, value->__anon1.__anon2.string);
((void (*)(void *, void *))(void *)prop->Set)(inst->data, temp);
}
}
}
else if(!deepMember && type && _class->type == 3)
{
if(prop)
{
if(value->type == 2)
{
if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = type->__anon1._class->__anon1.registered;

if(_class->type == 3)
{
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0);
type = _class->dataType;
}
}
switch(type->kind)
{
case 6:
{
float fValue;
float (* Set)(float) = (void *)prop->Set;

GetFloat(member->initializer->__anon1.exp, &fValue);
exp->__anon1.__anon1.constant = PrintFloat(Set(fValue));
exp->type = 2;
break;
}
case 7:
{
double dValue;
double (* Set)(double) = (void *)prop->Set;

GetDouble(member->initializer->__anon1.exp, &dValue);
exp->__anon1.__anon1.constant = PrintDouble(Set(dValue));
exp->type = 2;
break;
}
}
}
}
}
else if(!deepMember && type && _class->type == 2)
{
if(prop)
{
if(value->type == 1 && value->__anon1.instance->data)
{
unsigned int (* Set)(void *) = (void *)prop->Set;

bits = Set(value->__anon1.instance->data);
}
else if(value->type == 2)
{
}
}
else if(dataMember)
{
struct __ecereNameSpace__ecere__com__BitMember * bitMember = (struct __ecereNameSpace__ecere__com__BitMember *)dataMember;
struct Type * type;
uint64 part = 0;

bits = (bits & ~bitMember->mask);
if(!bitMember->dataType)
bitMember->dataType = ProcessTypeString(bitMember->dataTypeString, 0);
type = bitMember->dataType;
if(type->kind == 8 && type->__anon1._class && type->__anon1._class->__anon1.registered)
{
if(!type->__anon1._class->__anon1.registered->dataType)
type->__anon1._class->__anon1.registered->dataType = ProcessTypeString(type->__anon1._class->__anon1.registered->dataTypeString, 0);
type = type->__anon1._class->__anon1.registered->dataType;
}
switch(type->kind)
{
case 24:
case 1:
{
unsigned char v;

type->isSigned ? GetChar(value, (char *)&v) : GetUChar(value, &v);
part = (uint64)v;
break;
}
case 2:
{
unsigned short v;

type->isSigned ? GetShort(value, (short *)&v) : GetUShort(value, &v);
part = (uint64)v;
break;
}
case 3:
case 5:
{
unsigned int v;

type->isSigned ? GetInt(value, (int *)&v) : GetUInt(value, &v);
part = (uint64)v;
break;
}
case 4:
{
uint64 v;

type->isSigned ? GetInt64(value, (long long *)&v) : GetUInt64(value, &v);
part = v;
break;
}
case 22:
{
uintptr_t v;

type->isSigned ? GetIntPtr(value, (intptr_t *)&v) : GetUIntPtr(value, &v);
part = (uint64)v;
break;
}
case 23:
{
size_t v;

type->isSigned ? GetIntSize(value, (ssize_t *)&v) : GetUIntSize(value, &v);
part = (uint64)v;
break;
}
}
bits |= part << bitMember->pos;
}
}
}
else
{
if(_class && _class->type == 3)
{
ComputeExpression(member->initializer->__anon1.exp);
exp->__anon1.__anon1.constant = member->initializer->__anon1.exp->__anon1.__anon1.constant;
exp->type = 2;
member->initializer->__anon1.exp->__anon1.__anon1.constant = (((void *)0));
}
}
}
}
break;
}
}
}
}
if(_class && _class->type == 2)
{
exp->__anon1.__anon1.constant = PrintHexUInt(bits);
exp->type = 2;
}
if(exp->type != 1)
{
FreeInstance(inst);
}
}

void ComputeExpression(struct Expression * exp)
{
switch(exp->type)
{
case 0:
{
struct Identifier * id = exp->__anon1.__anon1.identifier;

if(id && exp->isConstant && !inCompiler && !inPreCompiler && !inDebugger)
{
struct __ecereNameSpace__ecere__com__Class * c = (exp->expType && exp->expType->kind == 8 && exp->expType->__anon1._class) ? exp->expType->__anon1._class->__anon1.registered : (((void *)0));

if(c && c->type == 4)
{
struct __ecereNameSpace__ecere__com__Class * enumClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "enum");

if(enumClass)
{
struct __ecereNameSpace__ecere__sys__NamedLink64 * value;
struct __ecereNameSpace__ecere__com__EnumClassData * e = (c ? ((void *)(((char *)c->data) + enumClass->offsetClass)) : (((void *)0)));

for(value = e->values.first; value; value = value->next)
{
if(!strcmp(value->name, id->string))
break;
}
if(value)
{
const char * dts = c->dataTypeString;

FreeExpContents(exp);
exp->type = 2;
exp->__anon1.__anon1.constant = (dts && (!strcmp(dts, "int") || !strcmp(dts, "int64") || !strcmp(dts, "short") || !strcmp(dts, "char"))) ? PrintInt64(value->data) : PrintUInt64(value->data);
}
}
}
}
break;
}
case 1:
{
ComputeInstantiation(exp);
break;
}
case 4:
{
struct Expression * exp1, * exp2 = (((void *)0));
struct Operand op1 =
{
0, 0, 0,
.__anon1 = {
.c = 0
},
{
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
};
struct Operand op2 =
{
0, 0, 0,
.__anon1 = {
.c = 0
},
{
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
};

if(exp->__anon1.op.exp2)
{
struct Expression * e = exp->__anon1.op.exp2;

while((e->type == 5 || e->type == 32 || e->type == 23) && e->__anon1.list)
{
if(e->type == 5 || e->type == 32 || e->type == 23)
{
if(e->type == 23)
e = (*((struct Statement *)(*e->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions).last;
else
e = (*e->__anon1.list).last;
}
}
if(exp->__anon1.op.op == 261 && e && e->expType)
{
if(e->type == 3 && e->__anon1.__anon2.string)
{
char * string = e->__anon1.__anon2.string;
int len = strlen(string);
char * tmp = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (len - 2 + 1));

len = UnescapeString(tmp, string + 1, len - 2);
(__ecereNameSpace__ecere__com__eSystem_Delete(tmp), tmp = 0);
FreeExpContents(exp);
exp->type = 2;
exp->__anon1.__anon1.constant = PrintUInt(len + 1);
}
else
{
struct Type * type = e->expType;

type->refCount++;
FreeExpContents(exp);
exp->type = 2;
exp->__anon1.__anon1.constant = PrintUInt(ComputeTypeSize(type));
FreeType(type);
}
break;
}
else
ComputeExpression(exp->__anon1.op.exp2);
}
if(exp->__anon1.op.exp1)
{
ComputeExpression(exp->__anon1.op.exp1);
exp1 = exp->__anon1.op.exp1;
exp2 = exp->__anon1.op.exp2;
op1 = GetOperand(exp1);
if(op1.type)
op1.type->refCount++;
if(exp2)
{
op2 = GetOperand(exp2);
if(op2.type)
op2.type->refCount++;
}
}
else
{
exp1 = exp->__anon1.op.exp2;
op1 = GetOperand(exp1);
if(op1.type)
op1.type->refCount++;
}
CallOperator(exp, exp1, exp2, &op1, &op2);
if(op1.type)
FreeType(op1.type);
if(op2.type)
FreeType(op2.type);
break;
}
case 5:
case 32:
{
struct Expression * e, * n;

for(e = (*exp->__anon1.list).first; e; e = n)
{
n = e->next;
if(!n)
{
struct __ecereNameSpace__ecere__sys__OldList * list = exp->__anon1.list;
struct Expression * prev = exp->prev;
struct Expression * next = exp->next;

if(exp->expType && exp->expType->kind == 8 && (!e->expType || e->expType->kind != 8))
{
FreeType(e->expType);
e->expType = exp->expType;
e->expType->refCount++;
}
ComputeExpression(e);
if(e->type != 4 && e->type != 11)
{
FreeType(exp->expType);
FreeType(exp->destType);
*exp = *e;
exp->prev = prev;
exp->next = next;
((e ? __extension__ ({
void * __ecerePtrToDelete = (e);

__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), e = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(list), list = 0);
}
}
else
{
FreeExpression(e);
}
}
break;
}
case 8:
{
struct Expression * memberExp = exp->__anon1.member.exp;
struct Identifier * memberID = exp->__anon1.member.member;
struct Type * type;

ComputeExpression(exp->__anon1.member.exp);
type = exp->__anon1.member.exp->expType;
if(type)
{
struct __ecereNameSpace__ecere__com__Class * _class = (exp->__anon1.member.member && exp->__anon1.member.member->classSym) ? exp->__anon1.member.member->classSym->__anon1.registered : (((type->kind == 8 || type->kind == 19) && type->__anon1._class) ? type->__anon1._class->__anon1.registered : (((void *)0)));
struct __ecereNameSpace__ecere__com__Property * prop = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * member = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * convertTo = (((void *)0));

if(type->kind == 19 && exp->__anon1.member.exp->type == 24)
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "ecere::com::Class");
if(!_class)
{
char string[256];
struct Symbol * classSym;

string[0] = '\0';
PrintTypeNoConst(type, string, 0, 1);
classSym = FindClass(string);
_class = classSym ? classSym->__anon1.registered : (((void *)0));
}
if(exp->__anon1.member.member)
{
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, exp->__anon1.member.member->string, privateModule);
if(!prop)
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, exp->__anon1.member.member->string, privateModule, (((void *)0)), (((void *)0)));
}
if(!prop && !member && _class && exp->__anon1.member.member)
{
struct Symbol * classSym = FindClass(exp->__anon1.member.member->string);

convertTo = _class;
_class = classSym ? classSym->__anon1.registered : (((void *)0));
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, convertTo->fullName, privateModule);
}
if(prop)
{
if(prop->compiled)
{
struct Type * type = prop->dataType;

if(_class->type == 3)
{
if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = type->__anon1._class->__anon1.registered;

if(_class->type == 3)
{
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0);
type = _class->dataType;
}
}
switch(type->kind)
{
case 6:
{
float value;
float (* Get)(float) = (void *)prop->Get;

GetFloat(exp->__anon1.member.exp, &value);
exp->__anon1.__anon1.constant = PrintFloat(Get ? Get(value) : value);
exp->type = 2;
break;
}
case 7:
{
double value;
double (* Get)(double);

GetDouble(exp->__anon1.member.exp, &value);
if(convertTo)
Get = (void *)prop->Set;
else
Get = (void *)prop->Get;
exp->__anon1.__anon1.constant = PrintDouble(Get ? Get(value) : value);
exp->type = 2;
break;
}
}
}
else
{
if(convertTo)
{
struct Expression * value = exp->__anon1.member.exp;
struct Type * type;

if(!prop->dataType)
ProcessPropertyType(prop);
type = prop->dataType;
if(!type)
{
}
else if(_class->type == 1)
{
switch(type->kind)
{
case 8:
{
struct __ecereNameSpace__ecere__com__Class * propertyClass = type->__anon1._class->__anon1.registered;

if(propertyClass->type == 1 && value->type == 1)
{
void (* Set)(void *, void *) = (void *)prop->Set;

exp->__anon1.instance = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);
exp->__anon1.instance->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
exp->__anon1.instance->_class = MkSpecifierName(_class->fullName);
exp->__anon1.instance->loc = exp->loc;
exp->type = 1;
Set(exp->__anon1.instance->data, value->__anon1.instance->data);
PopulateInstance(exp->__anon1.instance);
}
break;
}
case 3:
{
int intValue;
void (* Set)(void *, int) = (void *)prop->Set;

exp->__anon1.instance = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);
exp->__anon1.instance->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
exp->__anon1.instance->_class = MkSpecifierName(_class->fullName);
exp->__anon1.instance->loc = exp->loc;
exp->type = 1;
GetInt(value, &intValue);
Set(exp->__anon1.instance->data, intValue);
PopulateInstance(exp->__anon1.instance);
break;
}
case 4:
{
long long intValue;
void (* Set)(void *, long long) = (void *)prop->Set;

exp->__anon1.instance = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);
exp->__anon1.instance->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
exp->__anon1.instance->_class = MkSpecifierName(_class->fullName);
exp->__anon1.instance->loc = exp->loc;
exp->type = 1;
GetInt64(value, &intValue);
Set(exp->__anon1.instance->data, intValue);
PopulateInstance(exp->__anon1.instance);
break;
}
case 22:
{
intptr_t intValue;
void (* Set)(void *, intptr_t) = (void *)prop->Set;

exp->__anon1.instance = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);
exp->__anon1.instance->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
exp->__anon1.instance->_class = MkSpecifierName(_class->fullName);
exp->__anon1.instance->loc = exp->loc;
exp->type = 1;
GetIntPtr(value, &intValue);
Set(exp->__anon1.instance->data, intValue);
PopulateInstance(exp->__anon1.instance);
break;
}
case 23:
{
ssize_t intValue;
void (* Set)(void *, ssize_t) = (void *)prop->Set;

exp->__anon1.instance = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);
exp->__anon1.instance->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
exp->__anon1.instance->_class = MkSpecifierName(_class->fullName);
exp->__anon1.instance->loc = exp->loc;
exp->type = 1;
GetIntSize(value, &intValue);
Set(exp->__anon1.instance->data, intValue);
PopulateInstance(exp->__anon1.instance);
break;
}
case 6:
{
float floatValue;
void (* Set)(void *, float) = (void *)prop->Set;

exp->__anon1.instance = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);
exp->__anon1.instance->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
exp->__anon1.instance->_class = MkSpecifierName(_class->fullName);
exp->__anon1.instance->loc = exp->loc;
exp->type = 1;
GetFloat(value, &floatValue);
Set(exp->__anon1.instance->data, floatValue);
PopulateInstance(exp->__anon1.instance);
break;
}
case 7:
{
double doubleValue;
void (* Set)(void *, double) = (void *)prop->Set;

exp->__anon1.instance = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);
exp->__anon1.instance->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
exp->__anon1.instance->_class = MkSpecifierName(_class->fullName);
exp->__anon1.instance->loc = exp->loc;
exp->type = 1;
GetDouble(value, &doubleValue);
Set(exp->__anon1.instance->data, doubleValue);
PopulateInstance(exp->__anon1.instance);
break;
}
}
}
else if(_class->type == 2)
{
switch(type->kind)
{
case 8:
{
struct __ecereNameSpace__ecere__com__Class * propertyClass = type->__anon1._class->__anon1.registered;

if(propertyClass->type == 1 && value->__anon1.instance->data)
{
unsigned int (* Set)(void *) = (void *)prop->Set;
unsigned int bits = Set(value->__anon1.instance->data);

exp->__anon1.__anon1.constant = PrintHexUInt(bits);
exp->type = 2;
break;
}
else if(_class->type == 2)
{
unsigned int value;
unsigned int (* Set)(unsigned int) = (void *)prop->Set;
unsigned int bits;

GetUInt(exp->__anon1.member.exp, &value);
bits = Set(value);
exp->__anon1.__anon1.constant = PrintHexUInt(bits);
exp->type = 2;
}
}
}
}
}
else
{
if(_class->type == 2)
{
unsigned int value;

GetUInt(exp->__anon1.member.exp, &value);
switch(type->kind)
{
case 8:
{
struct __ecereNameSpace__ecere__com__Class * _class = type->__anon1._class->__anon1.registered;

if(_class->type == 1)
{
void (* Get)(unsigned int, void *) = (void *)prop->Get;

exp->__anon1.instance = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);
exp->__anon1.instance->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
exp->__anon1.instance->_class = MkSpecifierName(_class->fullName);
exp->__anon1.instance->loc = exp->loc;
exp->type = 1;
Get(value, exp->__anon1.instance->data);
PopulateInstance(exp->__anon1.instance);
}
else if(_class->type == 2)
{
unsigned int (* Get)(unsigned int) = (void *)prop->Get;
uint64 bits = Get(value);

exp->__anon1.__anon1.constant = PrintHexUInt64(bits);
exp->type = 2;
}
break;
}
}
}
else if(_class->type == 1)
{
unsigned char * value = (exp->__anon1.member.exp->type == 1) ? exp->__anon1.member.exp->__anon1.instance->data : (((void *)0));

switch(type->kind)
{
case 8:
{
struct __ecereNameSpace__ecere__com__Class * _class = type->__anon1._class->__anon1.registered;

if(_class->type == 1 && value)
{
void (* Get)(void *, void *) = (void *)prop->Get;

exp->__anon1.instance = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);
exp->__anon1.instance->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
exp->__anon1.instance->_class = MkSpecifierName(_class->fullName);
exp->__anon1.instance->loc = exp->loc;
exp->type = 1;
Get(value, exp->__anon1.instance->data);
PopulateInstance(exp->__anon1.instance);
}
break;
}
}
}
}
}
}
else
{
exp->isConstant = 0;
}
}
else if(member)
{
}
}
if(exp->type != 8)
{
FreeExpression(memberExp);
FreeIdentifier(memberID);
}
break;
}
case 10:
{
struct Type * type = ProcessType(exp->__anon1.typeName->qualifiers, exp->__anon1.typeName->declarator);

if(type->name && (!(strcasecmp)(type->name, "SCOPE_ID") || !(strcasecmp)(type->name, "IN_PKTINFO_EX")))
;
else
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintUInt(ComputeTypeSize(type));
exp->type = 2;
FreeType(type);
}
break;
}
case 15:
{
struct Symbol * classSym = exp->__anon1._class->__anon1.__anon1.symbol;

if(classSym && classSym->__anon1.registered)
{
if(classSym->__anon1.registered->fixed)
{
FreeSpecifier(exp->__anon1._class);
exp->__anon1.__anon1.constant = PrintUInt(classSym->__anon1.registered->templateClass ? classSym->__anon1.registered->templateClass->structSize : classSym->__anon1.registered->structSize);
exp->type = 2;
}
else
{
char className[1024];

strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 1);
DeclareClass(curExternal, classSym, className);
FreeExpContents(exp);
exp->type = 9;
exp->__anon1.member.exp = MkExpIdentifier(MkIdentifier(className));
exp->__anon1.member.member = MkIdentifier("structSize");
}
}
break;
}
case 11:
{
struct Type * type;
struct Expression * e = exp;

if(exp->type == 11)
{
if(exp->__anon1.cast.exp)
ComputeExpression(exp->__anon1.cast.exp);
e = exp->__anon1.cast.exp;
}
if(e && exp->expType)
{
type = exp->expType;
if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = type->__anon1._class->__anon1.registered;

if(_class && (_class->type == 3 || _class->type == 2))
{
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0);
type = _class->dataType;
}
}
switch(type->kind)
{
case 24:
case 1:
if(type->isSigned)
{
char value = 0;

if(GetChar(e, &value))
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintChar(value);
exp->type = 2;
}
}
else
{
unsigned char value = 0;

if(GetUChar(e, &value))
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintUChar(value);
exp->type = 2;
}
}
break;
case 2:
if(type->isSigned)
{
short value = 0;

if(GetShort(e, &value))
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintShort(value);
exp->type = 2;
}
}
else
{
unsigned short value = 0;

if(GetUShort(e, &value))
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintUShort(value);
exp->type = 2;
}
}
break;
case 3:
if(type->isSigned)
{
int value = 0;

if(GetInt(e, &value))
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintInt(value);
exp->type = 2;
}
}
else
{
unsigned int value = 0;

if(GetUInt(e, &value))
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintUInt(value);
exp->type = 2;
}
}
break;
case 4:
if(type->isSigned)
{
long long value = 0;

if(GetInt64(e, &value))
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintInt64(value);
exp->type = 2;
}
}
else
{
uint64 value = 0;

if(GetUInt64(e, &value))
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintUInt64(value);
exp->type = 2;
}
}
break;
case 22:
if(type->isSigned)
{
intptr_t value = 0;

if(GetIntPtr(e, &value))
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintInt64((long long)value);
exp->type = 2;
}
}
else
{
uintptr_t value = 0;

if(GetUIntPtr(e, &value))
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintUInt64((uint64)value);
exp->type = 2;
}
}
break;
case 23:
if(type->isSigned)
{
ssize_t value = 0;

if(GetIntSize(e, &value))
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintInt64((long long)value);
exp->type = 2;
}
}
else
{
size_t value = 0;

if(GetUIntSize(e, &value))
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintUInt64((uint64)value);
exp->type = 2;
}
}
break;
case 6:
{
float value = 0;

if(GetFloat(e, &value))
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintFloat(value);
exp->type = 2;
}
break;
}
case 7:
{
double value = 0;

if(GetDouble(e, &value))
{
FreeExpContents(exp);
exp->__anon1.__anon1.constant = PrintDouble(value);
exp->type = 2;
}
break;
}
}
}
break;
}
case 12:
{
struct Operand op1 =
{
0, 0, 0,
.__anon1 = {
.c = 0
},
{
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
};
struct Operand op2 =
{
0, 0, 0,
.__anon1 = {
.c = 0
},
{
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
};
struct Operand op3 =
{
0, 0, 0,
.__anon1 = {
.c = 0
},
{
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
};

if(exp->__anon1.cond.exp)
ComputeExpression((*exp->__anon1.cond.exp).last);
if(exp->__anon1.cond.elseExp)
ComputeExpression(exp->__anon1.cond.elseExp);
if(exp->__anon1.cond.cond)
ComputeExpression(exp->__anon1.cond.cond);
op1 = GetOperand(exp->__anon1.cond.cond);
if(op1.type)
op1.type->refCount++;
op2 = GetOperand((*exp->__anon1.cond.exp).last);
if(op2.type)
op2.type->refCount++;
op3 = GetOperand(exp->__anon1.cond.elseExp);
if(op3.type)
op3.type->refCount++;
if(op1.ops.Cond)
{
FreeExpContents(exp);
op1.ops.Cond(exp, &op1, &op2, &op3);
}
if(op1.type)
FreeType(op1.type);
if(op2.type)
FreeType(op2.type);
if(op3.type)
FreeType(op3.type);
break;
}
}
}

static void ProcessFunction(struct FunctionDefinition *  function);

void ProcessInstantiationType(struct Instantiation * inst)
{
yylloc = inst->loc;
if(inst->_class)
{
struct MembersInit * members;
struct Symbol * classSym;
struct __ecereNameSpace__ecere__com__Class * _class;

classSym = inst->_class->__anon1.__anon1.symbol;
_class = classSym ? classSym->__anon1.registered : (((void *)0));
if(ast && (!_class || _class->type != 5))
DeclareStruct(curExternal, inst->_class->__anon1.__anon1.name, 0, 1);
afterExternal = afterExternal ? afterExternal : curExternal;
if(inst->exp)
ProcessExpressionType(inst->exp);
inst->isConstant = 1;
if(inst->members)
{
struct __ecereNameSpace__ecere__com__DataMember * curMember = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * curClass = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * subMemberStack[256];
int subMemberStackPos = 0;

for(members = (*inst->members).first; members; members = members->next)
{
switch(members->type)
{
case 1:
{
char name[1024];
static unsigned int instMethodID = 0;
struct External * external = curExternal;
struct Context * context = curContext;
struct Declarator * declarator = members->__anon1.function->declarator;
struct Identifier * nameID = GetDeclId(declarator);
char * unmangled = nameID ? nameID->string : (((void *)0));
struct Expression * exp;
struct External * createdExternal = (((void *)0));

if(inCompiler)
{
char number[16];

strcpy(name, "__ecereInstMeth_");
FullClassNameCat(name, _class ? _class->fullName : "_UNKNOWNCLASS", 0);
strcat(name, "_");
strcat(name, nameID->string);
strcat(name, "_");
sprintf(number, "_%08d", instMethodID++);
strcat(name, number);
nameID->string = __ecereNameSpace__ecere__sys__CopyString(name);
}
if(declarator)
{
struct Symbol * symbol = declarator->symbol;
struct __ecereNameSpace__ecere__com__Method * method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, unmangled, privateModule);

if(method && method->type == 1)
{
symbol->__anon1.method = method;
ProcessMethodType(method);
if(!symbol->type->__anon1.__anon2.thisClass)
{
if(method->dataType->__anon1.__anon2.thisClass && currentClass && __ecereNameSpace__ecere__com__eClass_IsDerived(currentClass, method->dataType->__anon1.__anon2.thisClass->__anon1.registered))
{
if(!currentClass->symbol)
currentClass->symbol = FindClass(currentClass->fullName);
symbol->type->__anon1.__anon2.thisClass = currentClass->symbol;
}
else
{
if(!_class->symbol)
_class->symbol = FindClass(_class->fullName);
symbol->type->__anon1.__anon2.thisClass = _class->symbol;
}
}
DeclareType(curExternal, symbol->type, 1, 1);
}
else if(classSym)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "couldn't find virtual method %s in class %s\n", (((void *)0))), unmangled, classSym->string);
}
}
createdExternal = ProcessClassFunction(classSym ? classSym->__anon1.registered : (((void *)0)), members->__anon1.function, ast, afterExternal, 1);
if(nameID)
{
FreeSpecifier(nameID->_class);
nameID->_class = (((void *)0));
}
curExternal = createdExternal;
if(inCompiler)
{
if(createdExternal->__anon1.function)
ProcessFunction(createdExternal->__anon1.function);
}
else if(declarator)
{
curExternal = declarator->symbol->__anon2.__anon1.pointerExternal;
ProcessFunction((struct FunctionDefinition *)members->__anon1.function);
}
curExternal = external;
curContext = context;
if(inCompiler)
{
FreeClassFunction(members->__anon1.function);
exp = QMkExpId(name);
members->type = 0;
members->__anon1.dataMembers = MkListOne(MkMemberInit(MkListOne(MkIdentifier(unmangled)), MkInitializerAssignment(exp)));
(__ecereNameSpace__ecere__com__eSystem_Delete(unmangled), unmangled = 0);
}
break;
}
case 0:
{
if(members->__anon1.dataMembers && classSym)
{
struct MemberInit * member;
struct Location oldyyloc = yylloc;

for(member = (*members->__anon1.dataMembers).first; member; member = member->next)
{
ProcessMemberInitData(member, classSym->__anon1.registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
if(member->initializer && !member->initializer->isConstant)
inst->isConstant = 0;
}
yylloc = oldyyloc;
}
break;
}
}
}
}
}
}

static void ProcessClass(struct __ecereNameSpace__ecere__sys__OldList *  definitions, struct Symbol *  symbol);

static void ProcessSpecifier(struct Specifier * spec, unsigned int declareStruct, unsigned int warnClasses)
{
switch(spec->type)
{
case 0:
{
if(spec->__anon1.specifier == THISCLASS)
{
if(thisClass)
{
spec->type = 1;
spec->__anon1.__anon1.name = ReplaceThisClass(thisClass);
spec->__anon1.__anon1.symbol = FindClass(spec->__anon1.__anon1.name);
ProcessSpecifier(spec, declareStruct, 0);
}
}
break;
}
case 1:
{
struct Symbol * symbol = FindType(curContext, spec->__anon1.__anon1.name);

if(symbol)
DeclareType(curExternal, symbol->type, 1, 1);
else if(spec->__anon1.__anon1.symbol)
{
struct __ecereNameSpace__ecere__com__Class * c = spec->__anon1.__anon1.symbol->__anon1.registered;

if(warnClasses && !c)
Compiler_Warning("Undeclared class %s\n", spec->__anon1.__anon1.name);
DeclareStruct(curExternal, spec->__anon1.__anon1.name, c && c->type == 5, declareStruct && c && c->type == 1);
}
break;
}
case 2:
{
struct Enumerator * e;

if(spec->__anon1.__anon2.list)
{
for(e = (*spec->__anon1.__anon2.list).first; e; e = e->next)
{
if(e->exp)
ProcessExpressionType(e->exp);
}
}
if(inCompiler)
break;
}
case 3:
case 4:
{
if(spec->__anon1.__anon2.definitions)
{
struct Symbol * symbol = spec->__anon1.__anon2.id ? FindClass(spec->__anon1.__anon2.id->string) : (((void *)0));

ProcessClass(spec->__anon1.__anon2.definitions, symbol);
}
break;
}
}
}

static void ProcessDeclarator(struct Declarator * decl, unsigned int isFunction)
{
switch(decl->type)
{
case 1:
if(decl->__anon1.identifier->classSym)
{
FreeSpecifier(decl->__anon1.identifier->_class);
decl->__anon1.identifier->_class = (((void *)0));
}
break;
case 3:
if(decl->__anon1.array.exp)
ProcessExpressionType(decl->__anon1.array.exp);
case 0:
case 2:
case 4:
case 5:
case 6:
case 7:
{
struct Identifier * id = (((void *)0));
struct Specifier * classSpec = (((void *)0));

if(decl->type == 4)
{
id = GetDeclId(decl);
if(id && id->_class)
{
classSpec = id->_class;
id->_class = (((void *)0));
}
}
if(decl->declarator)
ProcessDeclarator(decl->declarator, isFunction);
if(decl->type == 4)
{
if(classSpec)
{
struct TypeName * param = (param = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TypeName), param->qualifiers = MkListOne(classSpec), param->declarator = (((void *)0)), param);

if(!decl->__anon1.function.parameters)
decl->__anon1.function.parameters = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*decl->__anon1.function.parameters), (((void *)0)), param);
}
if(decl->__anon1.function.parameters)
{
struct TypeName * param;

for(param = (*decl->__anon1.function.parameters).first; param; param = param->next)
{
if(param->qualifiers)
{
struct Specifier * spec;

for(spec = (*param->qualifiers).first; spec; spec = spec->next)
{
if(spec->type == 0)
{
if(spec->__anon1.specifier == TYPED_OBJECT)
{
struct Declarator * d = param->declarator;
struct TypeName * newParam = (newParam = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TypeName), newParam->qualifiers = MkListOne(MkSpecifier(VOID)), newParam->declarator = MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), d), newParam);

if(!d || d->type != 5)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*newParam->qualifiers), (((void *)0)), MkSpecifier(CONST));
FreeList(param->qualifiers, (void *)(FreeSpecifier));
param->qualifiers = MkListOne(MkStructOrUnion(3, MkIdentifier("__ecereNameSpace__ecere__com__Class"), (((void *)0))));
param->declarator = MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(MkIdentifier("class")));
DeclareStruct(curExternal, "ecere::com::Class", 0, 1);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*decl->__anon1.function.parameters), param, newParam);
param = newParam;
break;
}
else if(spec->__anon1.specifier == ANY_OBJECT)
{
struct Declarator * d = param->declarator;

FreeList(param->qualifiers, (void *)(FreeSpecifier));
param->qualifiers = MkListOne(MkSpecifier(VOID));
if(!d || d->type != 5)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*param->qualifiers), (((void *)0)), MkSpecifier(CONST));
param->declarator = MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), d);
break;
}
else if(spec->__anon1.specifier == THISCLASS)
{
if(thisClass)
{
spec->type = 1;
spec->__anon1.__anon1.name = ReplaceThisClass(thisClass);
spec->__anon1.__anon1.symbol = FindClass(spec->__anon1.__anon1.name);
ProcessSpecifier(spec, 0, 0);
}
break;
}
}
else if(spec->type == 1)
{
ProcessSpecifier(spec, isFunction, 1);
}
else if((spec->type == 3 || spec->type == 4) && !spec->__anon1.__anon2.definitions && spec->__anon1.__anon2.id && spec->__anon1.__anon2.id->string)
{
struct Declarator * d = param->declarator;

if(!d || d->type != 5)
DeclareStruct(curExternal, spec->__anon1.__anon2.id->string, 0, 1);
}
}
}
if(param->declarator)
ProcessDeclarator(param->declarator, 0);
}
}
}
break;
}
}
}

static void ProcessDeclaration(struct Declaration * decl, unsigned int warnClasses)
{
yylloc = decl->loc;
switch(decl->type)
{
case 1:
{
unsigned int declareStruct = 0;

if(decl->__anon1.__anon1.declarators)
{
struct InitDeclarator * d;

for(d = (*decl->__anon1.__anon1.declarators).first; d; d = d->next)
{
struct Type * type, * subType;

ProcessDeclarator(d->declarator, 0);
type = ProcessType(decl->__anon1.__anon1.specifiers, d->declarator);
if(d->initializer)
{
ProcessInitializer(d->initializer, type);
if((*decl->__anon1.__anon1.declarators).count == 1 && d->initializer->type == 0 && d->initializer->__anon1.exp->type == 1)
{
if(type->kind == 8 && type->__anon1._class == d->initializer->__anon1.exp->expType->__anon1._class)
{
struct Instantiation * inst = d->initializer->__anon1.exp->__anon1.instance;

inst->exp = MkExpIdentifier(CopyIdentifier(GetDeclId(d->declarator)));
d->initializer->__anon1.exp->__anon1.instance = (((void *)0));
if(decl->__anon1.__anon1.specifiers)
FreeList(decl->__anon1.__anon1.specifiers, (void *)(FreeSpecifier));
FreeList(decl->__anon1.__anon1.declarators, (void *)(FreeInitDeclarator));
d = (((void *)0));
decl->type = 2;
decl->__anon1.inst = inst;
}
}
}
for(subType = type; subType; )
{
if(subType->kind == 8)
{
declareStruct = 1;
break;
}
else if(subType->kind == 13)
break;
else if(subType->kind == 12)
subType = subType->__anon1.__anon4.arrayType;
else
break;
}
FreeType(type);
if(!d)
break;
}
}
if(decl->__anon1.__anon1.specifiers)
{
struct Specifier * s;

for(s = (*decl->__anon1.__anon1.specifiers).first; s; s = s->next)
{
ProcessSpecifier(s, declareStruct, 1);
}
}
break;
}
case 2:
{
ProcessInstantiationType(decl->__anon1.inst);
break;
}
case 0:
{
struct Specifier * spec;
struct Declarator * d;
unsigned int declareStruct = 0;

if(decl->__anon1.__anon1.declarators)
{
for(d = (*decl->__anon1.__anon1.declarators).first; d; d = d->next)
{
struct Type * type = ProcessType(decl->__anon1.__anon1.specifiers, d->declarator);
struct Type * subType;

ProcessDeclarator(d, 0);
for(subType = type; subType; )
{
if(subType->kind == 8)
{
declareStruct = 1;
break;
}
else if(subType->kind == 13)
break;
else if(subType->kind == 12)
subType = subType->__anon1.__anon4.arrayType;
else
break;
}
FreeType(type);
}
}
if(decl->__anon1.__anon1.specifiers)
{
for(spec = (*decl->__anon1.__anon1.specifiers).first; spec; spec = spec->next)
ProcessSpecifier(spec, declareStruct, warnClasses);
}
break;
}
}
}

static void ProcessStatement(struct Statement * stmt)
{
yylloc = stmt->loc;
switch(stmt->type)
{
case 0:
ProcessStatement(stmt->__anon1.labeled.stmt);
break;
case 1:
if(stmt->__anon1.caseStmt.exp)
{
FreeType(stmt->__anon1.caseStmt.exp->destType);
stmt->__anon1.caseStmt.exp->destType = curSwitchType;
if(curSwitchType)
curSwitchType->refCount++;
ProcessExpressionType(stmt->__anon1.caseStmt.exp);
ComputeExpression(stmt->__anon1.caseStmt.exp);
}
if(stmt->__anon1.caseStmt.stmt)
ProcessStatement(stmt->__anon1.caseStmt.stmt);
break;
case 2:
{
if(stmt->__anon1.compound.context)
{
struct Declaration * decl;
struct Statement * s;
struct Statement * prevCompound = curCompound;
struct Context * prevContext = curContext;

if(!stmt->__anon1.compound.isSwitch)
curCompound = stmt;
curContext = stmt->__anon1.compound.context;
if(stmt->__anon1.compound.declarations)
{
for(decl = (*stmt->__anon1.compound.declarations).first; decl; decl = decl->next)
ProcessDeclaration(decl, 1);
}
if(stmt->__anon1.compound.statements)
{
for(s = (*stmt->__anon1.compound.statements).first; s; s = s->next)
ProcessStatement(s);
}
curContext = prevContext;
curCompound = prevCompound;
}
break;
}
case 3:
{
struct Expression * exp;

if(stmt->__anon1.expressions)
{
for(exp = (*stmt->__anon1.expressions).first; exp; exp = exp->next)
ProcessExpressionType(exp);
}
break;
}
case 4:
{
struct Expression * exp;

FreeType(((struct Expression *)(*stmt->__anon1.ifStmt.exp).last)->destType);
((struct Expression *)(*stmt->__anon1.ifStmt.exp).last)->destType = MkClassType("bool");
((struct Expression *)(*stmt->__anon1.ifStmt.exp).last)->destType->truth = 1;
for(exp = (*stmt->__anon1.ifStmt.exp).first; exp; exp = exp->next)
{
ProcessExpressionType(exp);
}
if(stmt->__anon1.ifStmt.stmt)
ProcessStatement(stmt->__anon1.ifStmt.stmt);
if(stmt->__anon1.ifStmt.elseStmt)
ProcessStatement(stmt->__anon1.ifStmt.elseStmt);
break;
}
case 5:
{
struct Type * oldSwitchType = curSwitchType;

if(stmt->__anon1.switchStmt.exp)
{
struct Expression * exp;

for(exp = (*stmt->__anon1.switchStmt.exp).first; exp; exp = exp->next)
{
if(!exp->next)
{
ProcessExpressionType(exp);
}
if(!exp->next)
curSwitchType = exp->expType;
}
}
ProcessStatement(stmt->__anon1.switchStmt.stmt);
curSwitchType = oldSwitchType;
break;
}
case 6:
{
if(stmt->__anon1.whileStmt.exp)
{
struct Expression * exp;

FreeType(((struct Expression *)(*stmt->__anon1.whileStmt.exp).last)->destType);
((struct Expression *)(*stmt->__anon1.whileStmt.exp).last)->destType = MkClassType("bool");
((struct Expression *)(*stmt->__anon1.whileStmt.exp).last)->destType->truth = 1;
for(exp = (*stmt->__anon1.whileStmt.exp).first; exp; exp = exp->next)
{
ProcessExpressionType(exp);
}
}
if(stmt->__anon1.whileStmt.stmt)
ProcessStatement(stmt->__anon1.whileStmt.stmt);
break;
}
case 7:
{
if(stmt->__anon1.doWhile.exp)
{
struct Expression * exp;

if((*stmt->__anon1.doWhile.exp).last)
{
FreeType(((struct Expression *)(*stmt->__anon1.doWhile.exp).last)->destType);
((struct Expression *)(*stmt->__anon1.doWhile.exp).last)->destType = MkClassType("bool");
((struct Expression *)(*stmt->__anon1.doWhile.exp).last)->destType->truth = 1;
}
for(exp = (*stmt->__anon1.doWhile.exp).first; exp; exp = exp->next)
{
ProcessExpressionType(exp);
}
}
if(stmt->__anon1.doWhile.stmt)
ProcessStatement(stmt->__anon1.doWhile.stmt);
break;
}
case 8:
{
struct Expression * exp;

if(stmt->__anon1.forStmt.init)
ProcessStatement(stmt->__anon1.forStmt.init);
if(stmt->__anon1.forStmt.check && stmt->__anon1.forStmt.check->__anon1.expressions)
{
FreeType(((struct Expression *)(*stmt->__anon1.forStmt.check->__anon1.expressions).last)->destType);
((struct Expression *)(*stmt->__anon1.forStmt.check->__anon1.expressions).last)->destType = MkClassType("bool");
((struct Expression *)(*stmt->__anon1.forStmt.check->__anon1.expressions).last)->destType->truth = 1;
}
if(stmt->__anon1.forStmt.check)
ProcessStatement(stmt->__anon1.forStmt.check);
if(stmt->__anon1.forStmt.increment)
{
for(exp = (*stmt->__anon1.forStmt.increment).first; exp; exp = exp->next)
ProcessExpressionType(exp);
}
if(stmt->__anon1.forStmt.stmt)
ProcessStatement(stmt->__anon1.forStmt.stmt);
break;
}
case 18:
{
struct Identifier * id = stmt->__anon1.forEachStmt.id;
struct __ecereNameSpace__ecere__sys__OldList * exp = stmt->__anon1.forEachStmt.exp;
struct __ecereNameSpace__ecere__sys__OldList * filter = stmt->__anon1.forEachStmt.filter;
struct Statement * block = stmt->__anon1.forEachStmt.stmt;
char iteratorType[1024];
struct Type * source;
struct Expression * e;
unsigned int isBuiltin = exp && (*exp).last && (((struct Expression *)(*exp).last)->type == 35 || (((struct Expression *)(*exp).last)->type == 11 && ((struct Expression *)(*exp).last)->__anon1.cast.exp->type == 35));
struct Expression * arrayExp;
const char * typeString = (((void *)0));
int builtinCount = 0;

for(e = exp ? (*exp).first : (((void *)0)); e; e = e->next)
{
if(!e->next)
{
FreeType(e->destType);
e->destType = ProcessTypeString("Container", 0);
}
if(!isBuiltin || e->next)
ProcessExpressionType(e);
}
source = (exp && (*exp).last) ? ((struct Expression *)(*exp).last)->expType : (((void *)0));
if(isBuiltin || (source && source->kind == 8 && source->__anon1._class && source->__anon1._class->__anon1.registered && source->__anon1._class->__anon1.registered != containerClass && __ecereNameSpace__ecere__com__eClass_IsDerived(source->__anon1._class->__anon1.registered, containerClass)))
{
struct __ecereNameSpace__ecere__com__Class * _class = source ? source->__anon1._class->__anon1.registered : (((void *)0));
struct Symbol * symbol;
struct Expression * expIt = (((void *)0));
unsigned int isMap = 0, isArray = 0, isLinkList = 0, isList = 0, isCustomAVLTree = 0;
struct __ecereNameSpace__ecere__com__Class * arrayClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "Array");
struct __ecereNameSpace__ecere__com__Class * linkListClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "LinkList");
struct __ecereNameSpace__ecere__com__Class * customAVLTreeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "CustomAVLTree");

if(inCompiler)
{
stmt->type = 2;
stmt->__anon1.compound.context = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context);
stmt->__anon1.compound.context->parent = curContext;
curContext = stmt->__anon1.compound.context;
}
if(source && __ecereNameSpace__ecere__com__eClass_IsDerived(source->__anon1._class->__anon1.registered, customAVLTreeClass))
{
struct __ecereNameSpace__ecere__com__Class * mapClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "Map");

isCustomAVLTree = 1;
if(__ecereNameSpace__ecere__com__eClass_IsDerived(source->__anon1._class->__anon1.registered, mapClass))
isMap = 1;
}
else if(source && __ecereNameSpace__ecere__com__eClass_IsDerived(source->__anon1._class->__anon1.registered, arrayClass))
isArray = 1;
else if(source && __ecereNameSpace__ecere__com__eClass_IsDerived(source->__anon1._class->__anon1.registered, linkListClass))
{
struct __ecereNameSpace__ecere__com__Class * listClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "List");

isLinkList = 1;
isList = __ecereNameSpace__ecere__com__eClass_IsDerived(source->__anon1._class->__anon1.registered, listClass);
}
if(inCompiler && isArray)
{
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

decl = SpecDeclFromString(_class->templateArgs[2].__anon1.__anon1.dataTypeString, specs, MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(id)));
stmt->__anon1.compound.declarations = MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(decl, (((void *)0))))));
ListAdd(stmt->__anon1.compound.declarations, MkDeclaration(MkListOne(MkSpecifierName(source->__anon1._class->__anon1.registered->fullName)), MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internalArray")), MkInitializerAssignment(MkExpBrackets(exp))))));
}
else if(isBuiltin)
{
struct Type * type = (((void *)0));
char typeStringBuf[1024];

arrayExp = (((struct Expression *)(*exp).last)->type == 35) ? (struct Expression *)(*exp).last : ((struct Expression *)(*exp).last)->__anon1.cast.exp;
if(((struct Expression *)(*exp).last)->type == 11)
{
struct TypeName * typeName = ((struct Expression *)(*exp).last)->__anon1.cast.typeName;

if(typeName)
arrayExp->destType = ProcessType(typeName->qualifiers, typeName->declarator);
}
if(arrayExp->destType && arrayExp->destType->kind == 8 && arrayExp->destType->__anon1._class && arrayExp->destType->__anon1._class->__anon1.registered && arrayExp->destType->__anon1._class->__anon1.registered != containerClass && __ecereNameSpace__ecere__com__eClass_IsDerived(arrayExp->destType->__anon1._class->__anon1.registered, containerClass) && arrayExp->destType->__anon1._class->__anon1.registered->templateArgs)
{
struct __ecereNameSpace__ecere__com__Class * templateClass = arrayExp->destType->__anon1._class->__anon1.registered;

typeString = templateClass->templateArgs[2].__anon1.__anon1.dataTypeString;
}
else if(arrayExp->__anon1.list)
{
struct Expression * e;

for(e = (*arrayExp->__anon1.list).first; e; e = e->next)
{
ProcessExpressionType(e);
if(e->expType)
{
if(!type)
{
type = e->expType;
type->refCount++;
}
else
{
if(!MatchTypeExpression(e, type, (((void *)0)), 0, 1))
{
FreeType(type);
type = e->expType;
e->expType = (((void *)0));
e = (*arrayExp->__anon1.list).first;
ProcessExpressionType(e);
if(e->expType)
{
if(!MatchTypeExpression(e, type, (((void *)0)), 0, 1))
{
FreeType(e->expType);
e->expType = (((void *)0));
FreeType(type);
type = (((void *)0));
break;
}
}
}
}
if(e->expType)
{
FreeType(e->expType);
e->expType = (((void *)0));
}
}
}
if(type)
{
typeStringBuf[0] = '\0';
PrintType(type, typeStringBuf, 0, 1);
typeString = typeStringBuf;
FreeType(type);
}
}
if(typeString)
{
if(inCompiler)
{
struct __ecereNameSpace__ecere__sys__OldList * initializers = MkList();
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

if(arrayExp->__anon1.list)
{
struct Expression * e;

builtinCount = (*arrayExp->__anon1.list).count;
type = ProcessTypeString(typeString, 0);
while((e = (*arrayExp->__anon1.list).first))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*arrayExp->__anon1.list), e);
e->destType = type;
type->refCount++;
ProcessExpressionType(e);
if(inCompiler)
ListAdd(initializers, MkInitializerAssignment(e));
}
FreeType(type);
(__ecereNameSpace__ecere__com__eSystem_Delete(arrayExp->__anon1.list), arrayExp->__anon1.list = 0);
}
decl = SpecDeclFromString(typeString, specs, MkDeclaratorIdentifier(id));
stmt->__anon1.compound.declarations = MkListOne(MkDeclaration(CopyList(specs, (void *)(CopySpecifier)), MkListOne(MkInitDeclarator(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), decl), (((void *)0))))));
ListAdd(stmt->__anon1.compound.declarations, MkDeclaration(specs, MkListOne(MkInitDeclarator(PlugDeclarator(decl, MkDeclaratorArray(MkDeclaratorIdentifier(MkIdentifier("__internalArray")), (((void *)0)))), MkInitializerList(initializers)))));
FreeList(exp, (void *)(FreeExpression));
}
else if(arrayExp->__anon1.list)
{
struct Expression * e;

type = ProcessTypeString(typeString, 0);
for(e = (*arrayExp->__anon1.list).first; e; e = e->next)
{
e->destType = type;
type->refCount++;
ProcessExpressionType(e);
}
FreeType(type);
}
}
else
{
arrayExp->expType = ProcessTypeString("Container", 0);
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Couldn't determine type of array elements\n", (((void *)0))));
}
}
else if(inCompiler && isLinkList && !isList)
{
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

decl = SpecDeclFromString(_class->templateArgs[3].__anon1.__anon1.dataTypeString, specs, MkDeclaratorIdentifier(id));
stmt->__anon1.compound.declarations = MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(decl, (((void *)0))))));
ListAdd(stmt->__anon1.compound.declarations, MkDeclaration(MkListOne(MkSpecifierName(source->__anon1._class->__anon1.registered->fullName)), MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internalLinkList")), MkInitializerAssignment(MkExpBrackets(exp))))));
}
else if(inCompiler && _class->templateArgs)
{
if(isMap)
sprintf(iteratorType, "MapIterator<%s, %s >", _class->templateArgs[5].__anon1.__anon1.dataTypeString, _class->templateArgs[6].__anon1.__anon1.dataTypeString);
else
sprintf(iteratorType, "Iterator<%s, %s >", _class->templateArgs[2].__anon1.__anon1.dataTypeString, _class->templateArgs[1].__anon1.__anon1.dataTypeString);
stmt->__anon1.compound.declarations = MkListOne(MkDeclarationInst(MkInstantiationNamed(MkListOne(MkSpecifierName(iteratorType)), MkExpIdentifier(id), MkListOne(MkMembersInitList(MkListOne(MkMemberInit(isMap ? MkListOne(MkIdentifier("map")) : (((void *)0)), MkInitializerAssignment(MkExpBrackets(exp)))))))));
}
if(inCompiler)
{
symbol = FindSymbol(id->string, curContext, curContext, 0, 0);
if(block)
{
switch(block->type)
{
case 2:
if(block->__anon1.compound.context)
block->__anon1.compound.context->parent = stmt->__anon1.compound.context;
break;
case 4:
if(block->__anon1.ifStmt.stmt && block->__anon1.ifStmt.stmt->type == 2 && block->__anon1.ifStmt.stmt->__anon1.compound.context)
block->__anon1.ifStmt.stmt->__anon1.compound.context->parent = stmt->__anon1.compound.context;
if(block->__anon1.ifStmt.elseStmt && block->__anon1.ifStmt.elseStmt->type == 2 && block->__anon1.ifStmt.elseStmt->__anon1.compound.context)
block->__anon1.ifStmt.elseStmt->__anon1.compound.context->parent = stmt->__anon1.compound.context;
break;
case 5:
if(block->__anon1.switchStmt.stmt && block->__anon1.switchStmt.stmt->type == 2 && block->__anon1.switchStmt.stmt->__anon1.compound.context)
block->__anon1.switchStmt.stmt->__anon1.compound.context->parent = stmt->__anon1.compound.context;
break;
case 6:
if(block->__anon1.whileStmt.stmt && block->__anon1.whileStmt.stmt->type == 2 && block->__anon1.whileStmt.stmt->__anon1.compound.context)
block->__anon1.whileStmt.stmt->__anon1.compound.context->parent = stmt->__anon1.compound.context;
break;
case 7:
if(block->__anon1.doWhile.stmt && block->__anon1.doWhile.stmt->type == 2 && block->__anon1.doWhile.stmt->__anon1.compound.context)
block->__anon1.doWhile.stmt->__anon1.compound.context->parent = stmt->__anon1.compound.context;
break;
case 8:
if(block->__anon1.forStmt.stmt && block->__anon1.forStmt.stmt->type == 2 && block->__anon1.forStmt.stmt->__anon1.compound.context)
block->__anon1.forStmt.stmt->__anon1.compound.context->parent = stmt->__anon1.compound.context;
break;
case 18:
if(block->__anon1.forEachStmt.stmt && block->__anon1.forEachStmt.stmt->type == 2 && block->__anon1.forEachStmt.stmt->__anon1.compound.context)
block->__anon1.forEachStmt.stmt->__anon1.compound.context->parent = stmt->__anon1.compound.context;
break;
}
}
if(filter)
{
block = MkIfStmt(filter, block, (((void *)0)));
}
if(isArray)
{
stmt->__anon1.compound.statements = MkListOne(MkForStmt(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpMember(MkExpIdentifier(MkIdentifier("__internalArray")), MkIdentifier("array"))))), MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '<', MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("__internalArray")), MkIdentifier("array")), '+', MkExpMember(MkExpIdentifier(MkIdentifier("__internalArray")), MkIdentifier("count")))))), MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), INC_OP, (((void *)0)))), block));
ProcessStatement(((struct Statement *)(*stmt->__anon1.compound.statements).first)->__anon1.forStmt.init);
ProcessStatement(((struct Statement *)(*stmt->__anon1.compound.statements).first)->__anon1.forStmt.check);
ProcessExpressionType((*((struct Statement *)(*stmt->__anon1.compound.statements).first)->__anon1.forStmt.increment).first);
}
else if(isBuiltin)
{
char count[128];

sprintf(count, "%d", builtinCount);
stmt->__anon1.compound.statements = MkListOne(MkForStmt(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpIdentifier(MkIdentifier("__internalArray"))))), MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '<', MkExpOp(MkExpIdentifier(MkIdentifier("__internalArray")), '+', MkExpConstant(count))))), MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), INC_OP, (((void *)0)))), block));
ProcessStatement(((struct Statement *)(*stmt->__anon1.compound.statements).first)->__anon1.forStmt.init);
ProcessStatement(((struct Statement *)(*stmt->__anon1.compound.statements).first)->__anon1.forStmt.check);
ProcessExpressionType((*((struct Statement *)(*stmt->__anon1.compound.statements).first)->__anon1.forStmt.increment).first);
}
else if(isLinkList && !isList)
{
struct __ecereNameSpace__ecere__com__Class * typeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, _class->templateArgs[3].__anon1.__anon1.dataTypeString);
struct __ecereNameSpace__ecere__com__Class * listItemClass = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, "ListItem");

if(typeClass && __ecereNameSpace__ecere__com__eClass_IsDerived(typeClass, listItemClass) && _class->templateArgs[5].__anon1.__anon1.dataTypeString && !strcmp(_class->templateArgs[5].__anon1.__anon1.dataTypeString, "LT::link"))
{
stmt->__anon1.compound.statements = MkListOne(MkForStmt(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpMember(MkExpIdentifier(MkIdentifier("__internalLinkList")), MkIdentifier("first"))))), MkExpressionStmt(MkListOne(MkExpIdentifier(CopyIdentifier(id)))), MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpMember(MkExpIdentifier(CopyIdentifier(id)), MkIdentifier("next")))), block));
}
else
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl = SpecDeclFromString(_class->templateArgs[3].__anon1.__anon1.dataTypeString, specs, (((void *)0)));

stmt->__anon1.compound.statements = MkListOne(MkForStmt(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpMember(MkExpIdentifier(MkIdentifier("__internalLinkList")), MkIdentifier("first"))))), MkExpressionStmt(MkListOne(MkExpIdentifier(CopyIdentifier(id)))), MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpCast(MkTypeName(specs, decl), MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier("__internalLinkList")), MkIdentifier("GetNext")), MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("IteratorPointer")), (((void *)0))), MkExpIdentifier(CopyIdentifier(id)))))))), block));
}
ProcessStatement(((struct Statement *)(*stmt->__anon1.compound.statements).first)->__anon1.forStmt.init);
ProcessStatement(((struct Statement *)(*stmt->__anon1.compound.statements).first)->__anon1.forStmt.check);
ProcessExpressionType((*((struct Statement *)(*stmt->__anon1.compound.statements).first)->__anon1.forStmt.increment).first);
}
else
{
stmt->__anon1.compound.statements = MkListOne(MkWhileStmt(MkListOne(MkExpCall(MkExpMember(expIt = MkExpIdentifier(CopyIdentifier(id)), MkIdentifier("Next")), (((void *)0)))), block));
}
ProcessExpressionType(expIt);
if((*stmt->__anon1.compound.declarations).first)
ProcessDeclaration((*stmt->__anon1.compound.declarations).first, 1);
if(symbol)
symbol->isIterator = isMap ? 2 : ((isArray || isBuiltin) ? 3 : (isLinkList ? (isList ? 5 : 4) : (isCustomAVLTree ? 6 : 1)));
ProcessStatement(stmt);
}
else
ProcessStatement(stmt->__anon1.forEachStmt.stmt);
if(inCompiler)
curContext = stmt->__anon1.compound.context->parent;
break;
}
else
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Expression is not a container\n", (((void *)0))));
}
break;
}
case 9:
break;
case 10:
break;
case 11:
break;
case 12:
{
struct Expression * exp;

if(stmt->__anon1.expressions)
{
for(exp = (*stmt->__anon1.expressions).first; exp; exp = exp->next)
{
if(!exp->next)
{
if(curFunction && !curFunction->type)
curFunction->type = ProcessType(curFunction->specifiers, curFunction->declarator);
FreeType(exp->destType);
exp->destType = (curFunction && curFunction->type && curFunction->type->kind == 11) ? curFunction->type->__anon1.__anon2.returnType : (((void *)0));
if(exp->destType)
exp->destType->refCount++;
}
ProcessExpressionType(exp);
}
}
break;
}
case 14:
{
ProcessDeclaration(stmt->__anon1.decl, 1);
break;
}
case 13:
{
struct AsmField * field;

if(stmt->__anon1.asmStmt.inputFields)
{
for(field = (*stmt->__anon1.asmStmt.inputFields).first; field; field = field->next)
if(field->expression)
ProcessExpressionType(field->expression);
}
if(stmt->__anon1.asmStmt.outputFields)
{
for(field = (*stmt->__anon1.asmStmt.outputFields).first; field; field = field->next)
if(field->expression)
ProcessExpressionType(field->expression);
}
if(stmt->__anon1.asmStmt.clobberedFields)
{
for(field = (*stmt->__anon1.asmStmt.clobberedFields).first; field; field = field->next)
{
if(field->expression)
ProcessExpressionType(field->expression);
}
}
break;
}
case 17:
{
struct PropertyWatch * propWatch;
struct __ecereNameSpace__ecere__sys__OldList * watches = stmt->__anon1._watch.watches;
struct Expression * object = stmt->__anon1._watch.object;
struct Expression * watcher = stmt->__anon1._watch.watcher;

if(watcher)
ProcessExpressionType(watcher);
if(object)
ProcessExpressionType(object);
if(inCompiler)
{
if(watcher || thisClass)
{
struct External * external = curExternal;
struct Context * context = curContext;

stmt->type = 3;
stmt->__anon1.expressions = MkList();
for(propWatch = (*watches).first; propWatch; propWatch = propWatch->next)
{
struct ClassFunction * func;
char watcherName[1024];
struct __ecereNameSpace__ecere__com__Class * watcherClass = watcher ? ((watcher->expType && watcher->expType->kind == 8 && watcher->expType->__anon1._class) ? watcher->expType->__anon1._class->__anon1.registered : (((void *)0))) : thisClass;
struct External * createdExternal;

sprintf(watcherName, "__ecerePropertyWatcher_%d", propWatcherID++);
if(propWatch->deleteWatch)
strcat(watcherName, "_delete");
else
{
struct Identifier * propID;

for(propID = (*propWatch->properties).first; propID; propID = propID->next)
{
strcat(watcherName, "_");
strcat(watcherName, propID->string);
}
}
if(object && object->expType && object->expType->kind == 8 && object->expType->__anon1._class && object->expType->__anon1._class->__anon1.registered)
{
func = MkClassFunction(MkListOne(MkSpecifier(VOID)), (((void *)0)), MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(watcherName)), MkListOne(MkTypeName(MkListOne(MkSpecifierName(object->expType->__anon1._class->string)), MkDeclaratorIdentifier(MkIdentifier("value"))))), (((void *)0)));
ProcessClassFunctionBody(func, propWatch->compound);
propWatch->compound = (((void *)0));
createdExternal = ProcessClassFunction(watcherClass, func, ast, curExternal, 1);
FreeClassFunction(func);
curExternal = createdExternal;
ProcessFunction(createdExternal->__anon1.function);
if(propWatch->deleteWatch)
{
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

ListAdd(args, CopyExpression(object));
ListAdd(args, watcher ? CopyExpression(watcher) : MkExpIdentifier(MkIdentifier("this")));
ListAdd(args, MkExpIdentifier(MkIdentifier(watcherName)));
ListAdd(stmt->__anon1.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_WatchDestruction")), args));
}
else
{
struct __ecereNameSpace__ecere__com__Class * _class = object->expType->__anon1._class->__anon1.registered;
struct Identifier * propID;

for(propID = (*propWatch->properties).first; propID; propID = propID->next)
{
char propName[1024];
struct __ecereNameSpace__ecere__com__Property * prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, propID->string, privateModule);

if(prop)
{
char getName[1024], setName[1024];
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

DeclareProperty(createdExternal, prop, setName, getName);
strcpy(propName, "__ecereProp_");
FullClassNameCat(propName, prop->_class->fullName, 0);
strcat(propName, "_");
FullClassNameCat(propName, prop->name, 1);
ListAdd(args, CopyExpression(object));
ListAdd(args, MkExpIdentifier(MkIdentifier(propName)));
ListAdd(args, watcher ? CopyExpression(watcher) : MkExpIdentifier(MkIdentifier("this")));
ListAdd(args, MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpIdentifier(MkIdentifier(watcherName))));
ListAdd(stmt->__anon1.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_Watch")), args));
__ecereMethod_External_CreateUniqueEdge(external, createdExternal, 1);
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Property %s not found in class %s\n", (((void *)0))), propID->string, _class->fullName);
}
}
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Invalid watched object\n", (((void *)0))));
}
curExternal = external;
curContext = context;
if(watcher)
FreeExpression(watcher);
if(object)
FreeExpression(object);
FreeList(watches, (void *)(FreePropertyWatch));
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "No observer specified and not inside a class\n", (((void *)0))));
}
else
{
for(propWatch = (*watches).first; propWatch; propWatch = propWatch->next)
{
ProcessStatement(propWatch->compound);
}
}
break;
}
case 15:
{
struct __ecereNameSpace__ecere__sys__OldList * watches = stmt->__anon1._watch.watches;
struct Expression * object = stmt->__anon1._watch.object;
struct __ecereNameSpace__ecere__com__Class * _class;

if(object)
ProcessExpressionType(object);
if(inCompiler)
{
_class = object ? ((object->expType && object->expType->kind == 8 && object->expType->__anon1._class) ? object->expType->__anon1._class->__anon1.registered : (((void *)0))) : thisClass;
if(_class)
{
struct Identifier * propID;

stmt->type = 3;
stmt->__anon1.expressions = MkList();
if(!watches && curFunction->propSet && (!object || (object->type == 0 && !strcmp(object->__anon1.__anon1.identifier->string, "this"))))
{
watches = MkListOne(MkIdentifier(curFunction->propSet->string));
}
else if(!watches)
{
}
if(watches)
{
for(propID = (*watches).first; propID; propID = propID->next)
{
struct __ecereNameSpace__ecere__com__Property * prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, propID->string, privateModule);

if(prop)
{
CreateFireWatcher(prop, object, stmt);
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Property %s not found in class %s\n", (((void *)0))), propID->string, _class->fullName);
}
}
else
{
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__Class * base;

for(base = _class; base; base = base->base)
{
for(prop = base->membersAndProperties.first; prop; prop = prop->next)
{
if(prop->isProperty && prop->isWatchable)
{
CreateFireWatcher(prop, object, stmt);
}
}
}
}
if(object)
FreeExpression(object);
FreeList(watches, (void *)(FreeIdentifier));
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Invalid object specified and not inside a class\n", (((void *)0))));
}
break;
}
case 16:
{
struct __ecereNameSpace__ecere__sys__OldList * watches = stmt->__anon1._watch.watches;
struct Expression * object = stmt->__anon1._watch.object;
struct Expression * watcher = stmt->__anon1._watch.watcher;
struct __ecereNameSpace__ecere__com__Class * _class;

if(object)
ProcessExpressionType(object);
if(watcher)
ProcessExpressionType(watcher);
if(inCompiler)
{
_class = (object && object->expType && object->expType->kind == 8 && object->expType->__anon1._class) ? object->expType->__anon1._class->__anon1.registered : (((void *)0));
if(watcher || thisClass)
{
if(_class)
{
struct Identifier * propID;

stmt->type = 3;
stmt->__anon1.expressions = MkList();
if(!watches)
{
struct __ecereNameSpace__ecere__sys__OldList * args;

args = MkList();
ListAdd(args, CopyExpression(object));
ListAdd(args, MkExpConstant("0"));
ListAdd(args, watcher ? CopyExpression(watcher) : MkExpIdentifier(MkIdentifier("this")));
ListAdd(stmt->__anon1.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_StopWatching")), args));
}
else
{
for(propID = (*watches).first; propID; propID = propID->next)
{
char propName[1024];
struct __ecereNameSpace__ecere__com__Property * prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, propID->string, privateModule);

if(prop)
{
char getName[1024], setName[1024];
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

DeclareProperty(curExternal, prop, setName, getName);
strcpy(propName, "__ecereProp_");
FullClassNameCat(propName, prop->_class->fullName, 0);
strcat(propName, "_");
FullClassNameCat(propName, prop->name, 1);
ListAdd(args, CopyExpression(object));
ListAdd(args, MkExpIdentifier(MkIdentifier(propName)));
ListAdd(args, watcher ? CopyExpression(watcher) : MkExpIdentifier(MkIdentifier("this")));
ListAdd(stmt->__anon1.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_StopWatching")), args));
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Property %s not found in class %s\n", (((void *)0))), propID->string, _class->fullName);
}
}
if(object)
FreeExpression(object);
if(watcher)
FreeExpression(watcher);
FreeList(watches, (void *)(FreeIdentifier));
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Invalid object specified and not inside a class\n", (((void *)0))));
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "No observer specified and not inside a class\n", (((void *)0))));
}
break;
}
}
}

void ComputeDataTypes()
{
struct External * external;

currentClass = (((void *)0));
containerClass = __ecereNameSpace__ecere__com__eSystem_FindClass(GetPrivateModule(), "Container");
DeclareStruct((((void *)0)), "ecere::com::Class", 0, 1);
DeclareStruct((((void *)0)), "ecere::com::Instance", 0, 1);
DeclareStruct((((void *)0)), "ecere::com::Property", 0, 1);
DeclareStruct((((void *)0)), "ecere::com::DataMember", 0, 1);
DeclareStruct((((void *)0)), "ecere::com::Method", 0, 1);
DeclareStruct((((void *)0)), "ecere::com::SerialBuffer", 0, 1);
DeclareStruct((((void *)0)), "ecere::com::ClassTemplateArgument", 0, 1);
DeclareFunctionUtil((((void *)0)), "eSystem_New");
DeclareFunctionUtil((((void *)0)), "eSystem_New0");
DeclareFunctionUtil((((void *)0)), "eSystem_Renew");
DeclareFunctionUtil((((void *)0)), "eSystem_Renew0");
DeclareFunctionUtil((((void *)0)), "eSystem_Delete");
DeclareFunctionUtil((((void *)0)), "eClass_GetProperty");
DeclareFunctionUtil((((void *)0)), "eClass_SetProperty");
DeclareFunctionUtil((((void *)0)), "eInstance_FireSelfWatchers");
DeclareFunctionUtil((((void *)0)), "eInstance_SetMethod");
DeclareFunctionUtil((((void *)0)), "eInstance_IncRef");
DeclareFunctionUtil((((void *)0)), "eInstance_StopWatching");
DeclareFunctionUtil((((void *)0)), "eInstance_Watch");
DeclareFunctionUtil((((void *)0)), "eInstance_FireWatchers");
reachedPass15 = 1;
for(external = (*ast).first; external; external = external->next)
{
afterExternal = curExternal = external;
if(external->type == 0)
{
if(memoryGuard)
{
DeclareFunctionUtil(external, "MemoryGuard_PushLoc");
DeclareFunctionUtil(external, "MemoryGuard_PopLoc");
}
currentClass = external->__anon1.function->_class;
ProcessFunction(external->__anon1.function);
}
else if(external->type == 1)
{
if(memoryGuard && external->__anon1.declaration && external->__anon1.declaration->type == 2)
{
DeclareFunctionUtil(external, "MemoryGuard_PushLoc");
DeclareFunctionUtil(external, "MemoryGuard_PopLoc");
}
currentClass = (((void *)0));
if(external->__anon1.declaration)
ProcessDeclaration(external->__anon1.declaration, 1);
}
else if(external->type == 2)
{
struct ClassDefinition * _class = external->__anon1._class;

currentClass = external->symbol->__anon1.registered;
if(memoryGuard)
{
DeclareFunctionUtil(external, "MemoryGuard_PushLoc");
DeclareFunctionUtil(external, "MemoryGuard_PopLoc");
}
if(_class->definitions)
{
ProcessClass(_class->definitions, _class->symbol);
}
if(inCompiler)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*ast), external);
((external ? __extension__ ({
void * __ecerePtrToDelete = (external);

__ecereClass_External->Destructor ? __ecereClass_External->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), external = 0);
}
}
else if(external->type == 4)
{
thisNameSpace = external->__anon1.id->string;
}
}
currentClass = (((void *)0));
thisNameSpace = (((void *)0));
curExternal = (((void *)0));
}

void ProcessExpressionType(struct Expression * exp)
{
unsigned int unresolved = 0;
struct Location oldyylloc = yylloc;
unsigned int notByReference = 0;

if(!exp || exp->expType)
return ;
yylloc = exp->loc;
switch(exp->type)
{
case 0:
{
struct Identifier * id = exp->__anon1.__anon1.identifier;

if(!id || !topContext)
return ;
if(id->_class && id->_class->__anon1.__anon1.name)
{
id->classSym = id->_class->__anon1.__anon1.symbol;
}
if(!strcmp(id->string, "__runtimePlatform"))
{
exp->expType = ProcessTypeString("ecere::com::Platform", 1);
break;
}
else if(strstr(id->string, "__ecereClass") == id->string)
{
exp->expType = ProcessTypeString("ecere::com::Class", 1);
break;
}
else if(id->_class && (id->classSym || (id->_class->__anon1.__anon1.name && !strcmp(id->_class->__anon1.__anon1.name, "property"))))
{
ReplaceClassMembers(exp, thisClass);
if(exp->type != 0)
{
ProcessExpressionType(exp);
break;
}
if(id->classSym && ResolveIdWithClass(exp, id->classSym->__anon1.registered, 0))
break;
}
else
{
struct Symbol * symbol = (((void *)0));
unsigned int findInGlobal = 0;

if(!topContext->parent && exp->destType && exp->destType->kind == 8 && exp->destType->__anon1._class && exp->destType->__anon1._class->__anon1.registered && exp->destType->__anon1._class->__anon1.registered->type == 4)
findInGlobal = 1;
else
symbol = FindSymbol(id->string, curContext, topContext, 0, id->_class && id->_class->__anon1.__anon1.name == (((void *)0)));
if(!symbol)
{
if(exp->destType && CheckExpressionType(exp, exp->destType, 0, 0))
break;
else
{
if(thisClass && strcmp(id->string, "this"))
{
ReplaceClassMembers(exp, thisClass ? thisClass : currentClass);
if(exp->type != 0)
{
ProcessExpressionType(exp);
break;
}
}
else if(currentClass && !id->_class)
{
if(ResolveIdWithClass(exp, currentClass, 1))
break;
}
symbol = FindSymbol(id->string, topContext->parent, globalContext, 0, id->_class && id->_class->__anon1.__anon1.name == (((void *)0)));
}
}
if(findInGlobal)
symbol = FindSymbol(id->string, curContext, topContext, 0, id->_class && id->_class->__anon1.__anon1.name == (((void *)0)));
if(symbol && !symbol->ctx && symbol->type && symbol->type->kind == 11 && (!strcmp(id->string, "sin") || !strcmp(id->string, "cos") || !strcmp(id->string, "tan") || !strcmp(id->string, "asin") || !strcmp(id->string, "acos") || !strcmp(id->string, "atan") || !strcmp(id->string, "atan2") || !strcmp(id->string, "sinh") || !strcmp(id->string, "cosh") || !strcmp(id->string, "tanh") || !strcmp(id->string, "asinh") || !strcmp(id->string, "acosh") || !strcmp(id->string, "atanh")))
symbol = (((void *)0));
if(symbol)
{
struct Type * type = symbol->type;
struct __ecereNameSpace__ecere__com__Class * _class = (type && type->kind == 8 && type->__anon1._class) ? type->__anon1._class->__anon1.registered : (((void *)0));

if(_class && !strcmp(id->string, "this") && !type->classObjectType)
{
struct Context * context = SetupTemplatesContext(_class);

type = ReplaceThisClassType(_class);
FinishTemplatesContext(context);
if(type)
type->refCount = 0;
}
FreeSpecifier(id->_class);
id->_class = (((void *)0));
(__ecereNameSpace__ecere__com__eSystem_Delete(id->string), id->string = 0);
id->string = __ecereNameSpace__ecere__sys__CopyString(symbol->string);
id->classSym = (((void *)0));
exp->expType = type;
if(type)
type->refCount++;
if(type && (type->kind == 15))
exp->isConstant = 1;
if(symbol->isParam || !strcmp(id->string, "this"))
{
if(_class && _class->type == 1 && !type->declaredWithStruct)
exp->byReference = 1;
}
if(symbol->isIterator)
{
if(symbol->isIterator == 3)
{
exp->type = 5;
exp->__anon1.list = MkListOne(MkExpOp((((void *)0)), '*', MkExpIdentifier(exp->__anon1.__anon1.identifier)));
((struct Expression *)(*exp->__anon1.list).first)->__anon1.op.exp2->expType = exp->expType;
exp->expType = (((void *)0));
ProcessExpressionType(exp);
}
else if(symbol->isIterator != 4)
{
exp->type = 8;
exp->__anon1.member.exp = MkExpIdentifier(exp->__anon1.__anon1.identifier);
exp->__anon1.member.exp->expType = exp->expType;
exp->__anon1.member.member = MkIdentifier("data");
exp->expType = (((void *)0));
ProcessExpressionType(exp);
}
}
break;
}
else
{
struct __ecereNameSpace__ecere__com__DefinedExpression * definedExp = (((void *)0));

if(thisNameSpace && !(id->_class && !id->_class->__anon1.__anon1.name))
{
char name[1024];

strcpy(name, thisNameSpace);
strcat(name, "::");
strcat(name, id->string);
definedExp = __ecereNameSpace__ecere__com__eSystem_FindDefine(privateModule, name);
}
if(!definedExp)
definedExp = __ecereNameSpace__ecere__com__eSystem_FindDefine(privateModule, id->string);
if(definedExp)
{
if(!inBGen)
{
int c;

for(c = 0; c < definedExpStackPos; c++)
if(definedExpStack[c] == definedExp)
break;
if(c == definedExpStackPos && c < sizeof (definedExpStack) / sizeof(void *))
{
struct Location backupYylloc = yylloc;
struct __ecereNameSpace__ecere__com__Instance * backInput = fileInput;

definedExpStack[definedExpStackPos++] = definedExp;
fileInput = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = fileInput;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write]);
__internal_VirtualMethod ? __internal_VirtualMethod(fileInput, definedExp->value, 1, strlen(definedExp->value)) : (size_t)1;
}));
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = fileInput;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(fileInput, 0, 0) : (unsigned int)1;
}));
echoOn = 0;
parsedExpression = (((void *)0));
resetScanner();
expression_yyparse();
(__ecereNameSpace__ecere__com__eInstance_DecRef(fileInput), fileInput = 0);
if(backInput)
fileInput = backInput;
yylloc = backupYylloc;
if(parsedExpression)
{
FreeIdentifier(id);
exp->type = 5;
exp->__anon1.list = MkListOne(parsedExpression);
ApplyLocation(parsedExpression, &yylloc);
ProcessExpressionType(exp);
definedExpStackPos--;
return ;
}
definedExpStackPos--;
}
else
{
if(inCompiler)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Recursion in defined expression %s\n", (((void *)0))), id->string);
}
}
}
}
else
{
struct GlobalData * data = (((void *)0));

if(thisNameSpace && !(id->_class && !id->_class->__anon1.__anon1.name))
{
char name[1024];

strcpy(name, thisNameSpace);
strcat(name, "::");
strcat(name, id->string);
data = FindGlobalData(name);
}
if(!data)
data = FindGlobalData(id->string);
if(data)
{
DeclareGlobalData(curExternal, data);
exp->expType = data->dataType;
if(data->dataType)
data->dataType->refCount++;
(__ecereNameSpace__ecere__com__eSystem_Delete(id->string), id->string = 0);
id->string = __ecereNameSpace__ecere__sys__CopyString(data->fullName);
FreeSpecifier(id->_class);
id->_class = (((void *)0));
break;
}
else
{
struct __ecereNameSpace__ecere__com__GlobalFunction * function = (((void *)0));

if(thisNameSpace && !(id->_class && !id->_class->__anon1.__anon1.name))
{
char name[1024];

strcpy(name, thisNameSpace);
strcat(name, "::");
strcat(name, id->string);
function = __ecereNameSpace__ecere__com__eSystem_FindFunction(privateModule, name);
}
if(!function)
function = __ecereNameSpace__ecere__com__eSystem_FindFunction(privateModule, id->string);
if(function)
{
char name[1024];

(__ecereNameSpace__ecere__com__eSystem_Delete(id->string), id->string = 0);
id->string = __ecereNameSpace__ecere__sys__CopyString(function->name);
name[0] = 0;
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)function->module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->importType != 1 && (!function->dataType || !function->dataType->dllExport))
strcpy(name, "__ecereFunction_");
FullClassNameCat(name, id->string, 0);
if(DeclareFunction(curExternal, function, name))
{
(__ecereNameSpace__ecere__com__eSystem_Delete(id->string), id->string = 0);
id->string = __ecereNameSpace__ecere__sys__CopyString(name);
}
exp->expType = function->dataType;
if(function->dataType)
function->dataType->refCount++;
FreeSpecifier(id->_class);
id->_class = (((void *)0));
break;
}
}
}
}
}
unresolved = 1;
break;
}
case 1:
{
if(!exp->__anon1.instance->_class)
{
if(exp->destType && exp->destType->kind == 8 && exp->destType->__anon1._class)
{
exp->__anon1.instance->_class = MkSpecifierName(exp->destType->__anon1._class->string);
}
}
ProcessInstantiationType(exp->__anon1.instance);
exp->isConstant = exp->__anon1.instance->isConstant;
if(exp->__anon1.instance->_class)
{
exp->expType = MkClassType(exp->__anon1.instance->_class->__anon1.__anon1.name);
}
break;
}
case 2:
{
if(!exp->expType)
{
char * constant = exp->__anon1.__anon1.constant;
struct Type * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), type->refCount = 1, type->constant = 1, type);

exp->expType = type;
if(constant[0] == '\'')
{
if((int)((unsigned char *)constant)[1] > 127)
{
int nb;
unsigned int ch = __ecereNameSpace__ecere__sys__UTF8GetChar(constant + 1, &nb);

if(nb < 2)
ch = constant[1];
(__ecereNameSpace__ecere__com__eSystem_Delete(constant), constant = 0);
exp->__anon1.__anon1.constant = PrintUInt(ch);
type->kind = 8;
type->__anon1._class = FindClass("unichar");
type->isSigned = 0;
}
else
{
type->kind = 1;
type->isSigned = 1;
}
}
else
{
char * dot = strchr(constant, '.');
unsigned int isHex = (constant[0] == '0' && (constant[1] == 'x' || constant[1] == 'X'));
char * exponent;

if(isHex)
{
exponent = strchr(constant, 'p');
if(!exponent)
exponent = strchr(constant, 'P');
}
else
{
exponent = strchr(constant, 'e');
if(!exponent)
exponent = strchr(constant, 'E');
}
if(dot || exponent)
{
if(strchr(constant, 'f') || strchr(constant, 'F'))
type->kind = 6;
else
type->kind = 7;
type->isSigned = 1;
}
else
{
unsigned int isSigned = constant[0] == '-';
char * endP = (((void *)0));
long long i64 = strtoll(constant, &endP, 0);
uint64 ui64 = strtoull(constant, &endP, 0);
unsigned int is64Bit = endP && (!strcmp(endP, "LL") || !strcmp(endP, "ll") || !strcmp(endP, "LLU") || !strcmp(endP, "llu") || !strcmp(endP, "ull") || !strcmp(endP, "ULL"));
unsigned int forceUnsigned = endP && (!strcmp(endP, "U") || !strcmp(endP, "u") || !strcmp(endP, "LLU") || !strcmp(endP, "llu") || !strcmp(endP, "ull") || !strcmp(endP, "ULL"));

if(isSigned)
{
if(i64 < (((int)0x80000000)))
is64Bit = 1;
}
else
{
if(ui64 > (((int)0x7fffffff)))
{
if(ui64 > (0xffffffff))
{
is64Bit = 1;
if(ui64 <= (((long long)0x7fffffffffffffffLL)) && (constant[0] != '0' || !constant[1]))
isSigned = 1;
}
}
else if(constant[0] != '0' || !constant[1])
isSigned = 1;
}
if(forceUnsigned)
isSigned = 0;
type->kind = is64Bit ? 4 : 3;
type->isSigned = isSigned;
}
}
exp->isConstant = 1;
if(exp->destType && exp->destType->kind == 7)
type->kind = 7;
else if(exp->destType && exp->destType->kind == 6)
type->kind = 6;
else if(exp->destType && exp->destType->kind == 4)
type->kind = 4;
}
break;
}
case 3:
{
exp->isConstant = 1;
exp->expType = __extension__ ({
struct Type * __ecereInstance2 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance2->refCount = 1, __ecereInstance2->kind = 13, __ecereInstance2->__anon1.type = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1->kind = exp->__anon1.__anon2.wideString ? 2 : 1, __ecereInstance1->constant = 1, __ecereInstance1->isSigned = exp->__anon1.__anon2.wideString ? 0 : 1, __ecereInstance1;
}), __ecereInstance2;
});
break;
}
case 13:
case 26:
ProcessExpressionType(exp->__anon1._new.size);
exp->expType = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1->kind = 13, __ecereInstance1->__anon1.type = ProcessType(exp->__anon1._new.typeName->qualifiers, exp->__anon1._new.typeName->declarator), __ecereInstance1;
});
DeclareType(curExternal, exp->expType->__anon1.type, 1, 0);
break;
case 14:
case 27:
ProcessExpressionType(exp->__anon1._renew.size);
ProcessExpressionType(exp->__anon1._renew.exp);
exp->expType = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1->kind = 13, __ecereInstance1->__anon1.type = ProcessType(exp->__anon1._renew.typeName->qualifiers, exp->__anon1._renew.typeName->declarator), __ecereInstance1;
});
DeclareType(curExternal, exp->expType->__anon1.type, 1, 0);
break;
case 4:
{
unsigned int assign = 0, boolResult = 0, boolOps = 0;
struct Type * type1 = (((void *)0)), * type2 = (((void *)0));
unsigned int useDestType = 0, useSideType = 0;
struct Location oldyylloc = yylloc;
unsigned int useSideUnit = 0;
struct __ecereNameSpace__ecere__com__Class * destClass = (exp->destType && exp->destType->kind == 8 && exp->destType->__anon1._class) ? exp->destType->__anon1._class->__anon1.registered : (((void *)0));
unsigned int powerOp = 0, relationOp = 0;
struct __ecereNameSpace__ecere__com__Class * c1 = (((void *)0)), * c2 = (((void *)0));
struct Type * dummy = (dummy = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), dummy->count = 1, dummy->refCount = 1, dummy);

switch(exp->__anon1.op.op)
{
case '=':
case MUL_ASSIGN:
case DIV_ASSIGN:
case MOD_ASSIGN:
case ADD_ASSIGN:
case SUB_ASSIGN:
case LEFT_ASSIGN:
case RIGHT_ASSIGN:
case AND_ASSIGN:
case XOR_ASSIGN:
case OR_ASSIGN:
assign = 1;
break;
case '!':
break;
case AND_OP:
case OR_OP:
boolOps = 1;
boolResult = 1;
break;
case EQ_OP:
case '<':
case '>':
case LE_OP:
case GE_OP:
case NE_OP:
boolResult = 1;
useSideType = 1;
relationOp = 1;
break;
case '+':
case '-':
useSideUnit = 1;
useSideType = 1;
useDestType = 1;
break;
case LEFT_OP:
case RIGHT_OP:
break;
case '|':
case '^':
useSideType = 1;
useDestType = 1;
break;
case '/':
case '%':
useSideType = 1;
useDestType = 1;
if(exp->__anon1.op.op == '/')
powerOp = 1;
break;
case '&':
case '*':
if(exp->__anon1.op.exp1)
{
useSideType = 1;
useDestType = 1;
if(exp->__anon1.op.op == '*')
powerOp = 1;
}
break;
}
if(exp->__anon1.op.op == '&')
{
if(!exp->__anon1.op.exp1 && exp->__anon1.op.exp2 && exp->__anon1.op.exp2->type == 0 && exp->__anon1.op.exp2->__anon1.__anon1.identifier)
{
struct Identifier * id = exp->__anon1.op.exp2->__anon1.__anon1.identifier;
struct Symbol * symbol = FindSymbol(id->string, curContext, topContext, 0, id->_class && id->_class->__anon1.__anon1.name == (((void *)0)));

if(symbol && symbol->isIterator == 2)
{
exp->type = 8;
exp->__anon1.member.exp = exp->__anon1.op.exp2;
exp->__anon1.member.member = MkIdentifier("key");
exp->expType = (((void *)0));
exp->__anon1.op.exp2->expType = symbol->type;
symbol->type->refCount++;
ProcessExpressionType(exp);
FreeType(dummy);
break;
}
}
}
if(exp->__anon1.op.exp1)
{
if(exp->__anon1.op.exp2 && useSideUnit && useDestType && destClass && destClass->type == 3 && destClass->base->type != 3)
useDestType = 0;
if(destClass && useDestType && ((destClass->type == 3 && useSideUnit) || destClass->type == 4 || destClass->type == 2))
{
if(exp->__anon1.op.exp1->destType)
FreeType(exp->__anon1.op.exp1->destType);
exp->__anon1.op.exp1->destType = exp->destType;
exp->__anon1.op.exp1->opDestType = 1;
if(exp->destType)
exp->destType->refCount++;
}
else if(!assign)
{
if(exp->__anon1.op.exp1->destType)
FreeType(exp->__anon1.op.exp1->destType);
exp->__anon1.op.exp1->destType = dummy;
dummy->refCount++;
if(powerOp)
exp->__anon1.op.exp1->opDestType = 1;
if(relationOp)
exp->__anon1.op.exp1->usedInComparison = 1;
}
if(exp->__anon1.op.op == '+' || exp->__anon1.op.op == '-')
{
if(exp->opDestType)
exp->__anon1.op.exp1->parentOpDestType = 1;
if(exp->usedInComparison)
exp->__anon1.op.exp1->usedInComparison = 1;
}
if(exp->__anon1.op.exp1->destType && exp->__anon1.op.op != '=')
exp->__anon1.op.exp1->destType->count++;
ProcessExpressionType(exp->__anon1.op.exp1);
if(exp->__anon1.op.exp1->destType && exp->__anon1.op.op != '=')
exp->__anon1.op.exp1->destType->count--;
exp->__anon1.op.exp1->opDestType = 0;
exp->__anon1.op.exp1->usedInComparison = 0;
if(!exp->__anon1.op.exp2 && (exp->__anon1.op.op == INC_OP || exp->__anon1.op.op == DEC_OP) && exp->__anon1.op.exp1->expType && exp->__anon1.op.exp1->expType->kind == 8 && exp->__anon1.op.exp1->expType->__anon1._class && exp->__anon1.op.exp1->expType->__anon1._class->__anon1.registered && exp->__anon1.op.exp1->expType->__anon1._class->__anon1.registered->type == 3)
{
exp->__anon1.op.exp2 = MkExpConstant("1");
exp->__anon1.op.op = exp->__anon1.op.op == INC_OP ? ADD_ASSIGN : SUB_ASSIGN;
assign = 1;
}
if(exp->__anon1.op.exp1->destType == dummy)
{
FreeType(dummy);
exp->__anon1.op.exp1->destType = (((void *)0));
}
if(exp->__anon1.op.exp2)
{
if(!assign && exp->__anon1.op.exp1->expType && (exp->__anon1.op.exp1->expType->kind == 1 || exp->__anon1.op.exp1->expType->kind == 2))
{
struct Type * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), type->kind = 3, type->isSigned = 1, type->refCount = 1, type->signedBeforePromotion = exp->__anon1.op.exp1->expType->isSigned, type->bitMemberSize = exp->__anon1.op.exp1->expType->bitMemberSize, type->promotedFrom = exp->__anon1.op.exp1->expType->kind, type);

FreeType(exp->__anon1.op.exp1->expType);
exp->__anon1.op.exp1->expType = type;
}
}
type1 = exp->__anon1.op.exp1->expType;
}
if(exp->__anon1.op.exp2)
{
char expString[10240];

expString[0] = '\0';
if(exp->__anon1.op.exp2->type == 1 && !exp->__anon1.op.exp2->__anon1.instance->_class)
{
if(exp->__anon1.op.exp1)
{
exp->__anon1.op.exp2->destType = exp->__anon1.op.exp1->expType;
if(exp->__anon1.op.exp1->expType)
exp->__anon1.op.exp1->expType->refCount++;
}
else
{
exp->__anon1.op.exp2->destType = exp->destType;
if(!exp->__anon1.op.exp1 || (exp->__anon1.op.op != '&' && exp->__anon1.op.op != '^'))
exp->__anon1.op.exp2->opDestType = 1;
if(exp->destType)
exp->destType->refCount++;
}
if(type1)
type1->refCount++;
exp->expType = type1;
}
else if(assign)
{
if(inCompiler)
PrintExpression(exp->__anon1.op.exp2, expString);
if(type1 && type1->kind == 13)
{
if(exp->__anon1.op.op == MUL_ASSIGN || exp->__anon1.op.op == DIV_ASSIGN || exp->__anon1.op.op == MOD_ASSIGN || exp->__anon1.op.op == LEFT_ASSIGN || exp->__anon1.op.op == RIGHT_ASSIGN || exp->__anon1.op.op == AND_ASSIGN || exp->__anon1.op.op == OR_ASSIGN)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "operator %s illegal on pointer\n", (((void *)0))), exp->__anon1.op.op);
else if(exp->__anon1.op.op == '=')
{
if(exp->__anon1.op.exp2->destType)
FreeType(exp->__anon1.op.exp2->destType);
exp->__anon1.op.exp2->destType = type1;
if(type1)
type1->refCount++;
}
}
else
{
if(exp->__anon1.op.op == MUL_ASSIGN || exp->__anon1.op.op == DIV_ASSIGN || exp->__anon1.op.op == MOD_ASSIGN || exp->__anon1.op.op == LEFT_ASSIGN || exp->__anon1.op.op == RIGHT_ASSIGN)
;
else
{
if(exp->__anon1.op.exp2->destType)
FreeType(exp->__anon1.op.exp2->destType);
exp->__anon1.op.exp2->destType = type1;
if(type1)
type1->refCount++;
}
}
if(type1)
type1->refCount++;
exp->expType = type1;
}
else if(destClass && ((destClass->type == 3 && useDestType && useSideUnit) || (destClass->type == 4 && useDestType)))
{
if(exp->__anon1.op.exp2->destType)
FreeType(exp->__anon1.op.exp2->destType);
exp->__anon1.op.exp2->destType = exp->destType;
if(exp->__anon1.op.op != '&' && exp->__anon1.op.op != '^')
exp->__anon1.op.exp2->opDestType = 1;
if(exp->destType)
exp->destType->refCount++;
}
else
{
if(exp->__anon1.op.exp2->destType)
FreeType(exp->__anon1.op.exp2->destType);
exp->__anon1.op.exp2->destType = dummy;
dummy->refCount++;
if(powerOp)
exp->__anon1.op.exp2->opDestType = 1;
if(relationOp)
exp->__anon1.op.exp2->usedInComparison = 1;
}
if(type1 && boolResult && useSideType && type1->kind == 8 && type1->__anon1._class && type1->__anon1._class->__anon1.registered && (type1->__anon1._class->__anon1.registered->type == 2 || type1->__anon1._class->__anon1.registered->type == 4))
{
FreeType(exp->__anon1.op.exp2->destType);
exp->__anon1.op.exp2->destType = type1;
type1->refCount++;
}
if(exp->__anon1.op.exp2->destType && exp->__anon1.op.op != '=')
exp->__anon1.op.exp2->destType->count++;
if(exp->__anon1.op.op == SIZEOF)
{
struct Expression * e = exp->__anon1.op.exp2;

while((e->type == 5 || e->type == 32 || e->type == 23) && e->__anon1.list)
{
if(e->type == 5 || e->type == 32 || e->type == 23)
{
if(e->type == 23)
e = (*((struct Statement *)(*e->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions).last;
else
e = (*e->__anon1.list).last;
}
}
if(e->type == 11 && e->__anon1.cast.exp)
e->__anon1.cast.exp->needCast = 1;
}
if(exp->__anon1.op.op == '+' || exp->__anon1.op.op == '-')
{
if(exp->opDestType)
exp->__anon1.op.exp2->parentOpDestType = 1;
if(exp->usedInComparison)
exp->__anon1.op.exp2->usedInComparison = 1;
}
ProcessExpressionType(exp->__anon1.op.exp2);
exp->__anon1.op.exp2->opDestType = 0;
exp->__anon1.op.exp2->usedInComparison = 0;
if(exp->__anon1.op.exp2->destType && exp->__anon1.op.op != '=')
exp->__anon1.op.exp2->destType->count--;
if(!assign && (exp->__anon1.op.exp1 || exp->__anon1.op.op == '~'))
{
if(exp->__anon1.op.exp2->expType && (exp->__anon1.op.exp2->expType->kind == 1 || exp->__anon1.op.exp2->expType->kind == 2))
{
struct Type * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), type->kind = 3, type->isSigned = 1, type->refCount = 1, type->signedBeforePromotion = exp->__anon1.op.exp2->expType->isSigned, type->bitMemberSize = exp->__anon1.op.exp2->expType->bitMemberSize, type->promotedFrom = exp->__anon1.op.exp2->expType->kind, type);

FreeType(exp->__anon1.op.exp2->expType);
exp->__anon1.op.exp2->expType = type;
}
}
if(assign && type1 && type1->kind == 13 && exp->__anon1.op.exp2->expType)
{
if(exp->__anon1.op.exp2->expType->kind == 23 || exp->__anon1.op.exp2->expType->kind == 22 || exp->__anon1.op.exp2->expType->kind == 4 || exp->__anon1.op.exp2->expType->kind == 3 || exp->__anon1.op.exp2->expType->kind == 2 || exp->__anon1.op.exp2->expType->kind == 1)
{
if(exp->__anon1.op.op != '=' && type1->__anon1.type->kind == 0)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "void *: unknown size\n", (((void *)0))));
}
else if(exp->__anon1.op.exp2->expType->kind == 13 || exp->__anon1.op.exp2->expType->kind == 12 || exp->__anon1.op.exp2->expType->kind == 11 || exp->__anon1.op.exp2->expType->kind == 16 || (type1->__anon1.type->kind == 0 && exp->__anon1.op.exp2->expType->kind == 8 && exp->__anon1.op.exp2->expType->__anon1._class->__anon1.registered && (exp->__anon1.op.exp2->expType->__anon1._class->__anon1.registered->type == 0 || exp->__anon1.op.exp2->expType->__anon1._class->__anon1.registered->type == 1 || exp->__anon1.op.exp2->expType->__anon1._class->__anon1.registered->type == 5)))
{
if(exp->__anon1.op.op == ADD_ASSIGN)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "cannot add two pointers\n", (((void *)0))));
}
else if((exp->__anon1.op.exp2->expType->kind == 8 && type1->kind == 13 && type1->__anon1.type->kind == 8 && type1->__anon1.type->__anon1._class == exp->__anon1.op.exp2->expType->__anon1._class && exp->__anon1.op.exp2->expType->__anon1._class->__anon1.registered && exp->__anon1.op.exp2->expType->__anon1._class->__anon1.registered->type == 1))
{
if(exp->__anon1.op.op == ADD_ASSIGN)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "cannot add two pointers\n", (((void *)0))));
}
else if(inCompiler)
{
char type1String[1024];
char type2String[1024];

type1String[0] = '\0';
type2String[0] = '\0';
PrintType(exp->__anon1.op.exp2->expType, type1String, 0, 1);
PrintType(type1, type2String, 0, 1);
__ecereNameSpace__ecere__sys__ChangeCh(expString, '\n', ' ');
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "incompatible expression %s (%s); expected %s\n", (((void *)0))), expString, type1String, type2String);
}
}
if(exp->__anon1.op.exp2->destType == dummy)
{
FreeType(dummy);
exp->__anon1.op.exp2->destType = (((void *)0));
}
if(exp->__anon1.op.op == '-' && !exp->__anon1.op.exp1 && exp->__anon1.op.exp2->expType && !exp->__anon1.op.exp2->expType->isSigned)
{
type2 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
type2->refCount = 1;
CopyTypeInto(type2, exp->__anon1.op.exp2->expType);
type2->isSigned = 1;
}
else if(exp->__anon1.op.op == '~' && !exp->__anon1.op.exp1 && exp->__anon1.op.exp2->expType && (!exp->__anon1.op.exp2->expType->isSigned || exp->__anon1.op.exp2->expType->kind != 3))
{
type2 = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->kind = 3, __ecereInstance1;
});
type2->refCount = 1;
type2->isSigned = 1;
}
else
{
type2 = exp->__anon1.op.exp2->expType;
if(type2)
type2->refCount++;
}
}
c1 = type1 && type1->kind == 8 && type1->__anon1._class ? type1->__anon1._class->__anon1.registered : (((void *)0));
c2 = type2 && type2->kind == 8 && type2->__anon1._class ? type2->__anon1._class->__anon1.registered : (((void *)0));
if(relationOp && ((exp->__anon1.op.exp1 && exp->__anon1.op.exp1->ambiguousUnits && (!c2 || c2->type != 3)) || (exp->__anon1.op.exp2 && exp->__anon1.op.exp2->ambiguousUnits && (!c1 || c1->type != 3))))
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "ambiguous units in relational operation\n", (((void *)0))));
if(!relationOp && ((exp->__anon1.op.exp1 && exp->__anon1.op.exp1->ambiguousUnits) || (exp->__anon1.op.exp2 && exp->__anon1.op.exp2->ambiguousUnits)) && (!powerOp || !c1 || c1->type != 3 || !c2 || c2->type != 3 || !RelatedUnits(c1, c2)))
{
if(exp->opDestType || exp->usedInComparison)
exp->ambiguousUnits = 1;
else
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "ambiguous units\n", (((void *)0))));
}
dummy->kind = 0;
if(exp->__anon1.op.op == SIZEOF)
{
exp->expType = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1->kind = 23, __ecereInstance1;
});
exp->isConstant = 1;
}
else if(exp->__anon1.op.op == '*' && !exp->__anon1.op.exp1)
{
exp->expType = Dereference(type2);
if(type2 && type2->kind == 8)
notByReference = 1;
}
else if(exp->__anon1.op.op == '&' && !exp->__anon1.op.exp1)
exp->expType = Reference(type2);
else if(exp->__anon1.op.op == LEFT_OP || exp->__anon1.op.op == RIGHT_OP)
{
if(exp->__anon1.op.exp1->expType)
{
exp->expType = exp->__anon1.op.exp1->expType;
exp->expType->refCount++;
}
}
else if(!assign)
{
if(c1 && !c1->dataType)
c1->dataType = ProcessTypeString(c1->dataTypeString, 0);
if(c2 && !c2->dataType)
c2->dataType = ProcessTypeString(c2->dataTypeString, 0);
if(boolOps)
{
if(exp->__anon1.op.exp1)
{
if(exp->__anon1.op.exp1->destType)
FreeType(exp->__anon1.op.exp1->destType);
exp->__anon1.op.exp1->destType = MkClassType("bool");
exp->__anon1.op.exp1->destType->truth = 1;
if(!exp->__anon1.op.exp1->expType)
ProcessExpressionType(exp->__anon1.op.exp1);
else
CheckExpressionType(exp->__anon1.op.exp1, exp->__anon1.op.exp1->destType, 0, 0);
FreeType(exp->__anon1.op.exp1->expType);
exp->__anon1.op.exp1->expType = MkClassType("bool");
exp->__anon1.op.exp1->expType->truth = 1;
}
if(exp->__anon1.op.exp2)
{
if(exp->__anon1.op.exp2->destType)
FreeType(exp->__anon1.op.exp2->destType);
exp->__anon1.op.exp2->destType = MkClassType("bool");
exp->__anon1.op.exp2->destType->truth = 1;
if(!exp->__anon1.op.exp2->expType)
ProcessExpressionType(exp->__anon1.op.exp2);
else
CheckExpressionType(exp->__anon1.op.exp2, exp->__anon1.op.exp2->destType, 0, 0);
FreeType(exp->__anon1.op.exp2->expType);
exp->__anon1.op.exp2->expType = MkClassType("bool");
exp->__anon1.op.exp2->expType->truth = 1;
}
}
else if(powerOp && exp->__anon1.op.exp1 && exp->__anon1.op.exp2 && ((c1 && c1->type == 3) || (c2 && c2->type == 3)))
{
if(c1 && c1->type == 3 && c2 && c2->type == 3)
{
if(c1->dataType->kind == 7)
exp->expType = c1->dataType;
else if(c2->dataType->kind == 7)
exp->expType = c2->dataType;
else if(c1->dataType->kind == 6)
exp->expType = c1->dataType;
else if(c2->dataType->kind == 6)
exp->expType = c2->dataType;
else
exp->expType = c1->dataType;
}
else if((c1 && c1->type == 3) || exp->__anon1.op.op == '/')
exp->expType = type1;
else
exp->expType = type2;
if(exp->expType)
exp->expType->refCount++;
}
else if(exp->__anon1.op.exp1 && exp->__anon1.op.exp2 && ((useSideType) || ((!type1 || type1->kind != 8 || !strcmp(type1->__anon1._class->string, "String")) && (!type2 || type2->kind != 8 || !strcmp(type2->__anon1._class->string, "String")))))
{
if(type1 && type2 && ((type1->kind == 8 && type1->__anon1._class && strcmp(type1->__anon1._class->string, "String")) == (type2->kind == 8 && type2->__anon1._class && strcmp(type2->__anon1._class->string, "String"))))
{
if(exp->__anon1.op.op == '-' && ((c1 && c1->type == 4) || (c2 && c2->type == 4)))
{
struct Type * intType = ProcessTypeString((c1 && c1->dataType->kind == 4) || (c2 && c2->dataType->kind == 4) ? "int64" : "int", 0);

if(exp->__anon1.op.exp1->destType)
FreeType(exp->__anon1.op.exp1->destType);
if(exp->__anon1.op.exp2->destType)
FreeType(exp->__anon1.op.exp2->destType);
exp->__anon1.op.exp1->destType = intType;
exp->__anon1.op.exp2->destType = intType;
intType->refCount++;
}
else
{
if(exp->__anon1.op.exp2->destType)
FreeType(exp->__anon1.op.exp2->destType);
exp->__anon1.op.exp2->destType = type1;
type1->refCount++;
if(exp->__anon1.op.exp1->destType)
FreeType(exp->__anon1.op.exp1->destType);
exp->__anon1.op.exp1->destType = type2;
type2->refCount++;
}
if(!boolResult && !exp->opDestType && (!exp->destType || exp->destType->kind != 8) && c1 && c1->type == 3 && c2 && c2->type == 3 && c1 != c2)
{
if(exp->usedInComparison || exp->parentOpDestType)
exp->ambiguousUnits = 1;
else
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "operating on %s and %s with an untyped result, assuming %s\n", (((void *)0))), type1->__anon1._class->string, type2->__anon1._class->string, type1->__anon1._class->string);
}
if(type1->kind == 13 && type1->__anon1.type->kind == 20 && type2->kind != 13)
{
struct Expression * argExp = GetTemplateArgExp(type1->__anon1.type->__anon1.templateParameter, type1->__anon1.type->thisClassFrom, thisClass, 1);

if(argExp)
{
struct Expression * classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));

exp->__anon1.op.exp1 = MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), exp->__anon1.op.exp1)));
ProcessExpressionType(exp->__anon1.op.exp1);
if(type2->kind != 13)
{
ProcessExpressionType(classExp);
exp->__anon1.op.exp2 = MkExpBrackets(MkListOne(MkExpOp(exp->__anon1.op.exp2, '*', MkExpMember(classExp, MkIdentifier("typeSize")))));
if(!exp->__anon1.op.exp2->expType)
{
if(type2)
FreeType(type2);
type2 = exp->__anon1.op.exp2->expType = ProcessTypeString("int", 0);
c2 = (((void *)0));
type2->refCount++;
}
ProcessExpressionType(exp->__anon1.op.exp2);
}
}
}
if(!boolResult && ((type1->kind == 13 || type1->kind == 12 || (type1->kind == 8 && !strcmp(type1->__anon1._class->string, "String"))) && (type2->kind == 23 || type2->kind == 22 || type2->kind == 4 || type2->kind == 3 || type2->kind == 2 || type2->kind == 1)))
{
if(type1->kind != 8 && type1->__anon1.type->kind == 0)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "void *: unknown size\n", (((void *)0))));
exp->expType = type1;
if(type1)
type1->refCount++;
}
else if(!boolResult && ((type2->kind == 13 || type2->kind == 12 || (type2->kind == 8 && !strcmp(type2->__anon1._class->string, "String"))) && (type1->kind == 23 || type1->kind == 22 || type1->kind == 4 || type1->kind == 3 || type1->kind == 2 || type1->kind == 1)))
{
if(type2->kind != 8 && type2->__anon1.type->kind == 0)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "void *: unknown size\n", (((void *)0))));
exp->expType = type2;
if(type2)
type2->refCount++;
}
else if((type1->kind == 13 && type2->kind != 13 && type2->kind != 12 && type2->kind != 11 && type2->kind != 16 && type2->kind != 8 && type2->kind != 19) || (type2->kind == 13 && type1->kind != 13 && type1->kind != 12 && type1->kind != 11 && type1->kind != 16 && type1->kind != 8 && type1->kind != 19))
{
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "different levels of indirection\n", (((void *)0))));
}
else
{
unsigned int success = 0;

if(type1->kind == 13 && type2->kind == 13)
{
if(exp->__anon1.op.op == '+')
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "cannot add two pointers\n", (((void *)0))));
else if(exp->__anon1.op.op == '-')
{
if(MatchTypes(type1->__anon1.type, type2->__anon1.type, (((void *)0)), (((void *)0)), (((void *)0)), 0, 0, 0, 0, 0))
{
exp->expType = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->kind = 3, __ecereInstance1->refCount = 1, __ecereInstance1;
});
success = 1;
if(type1->__anon1.type->kind == 20)
{
struct Expression * argExp = GetTemplateArgExp(type1->__anon1.type->__anon1.templateParameter, type1->__anon1.type->thisClassFrom, thisClass, 1);

if(argExp)
{
struct Expression * classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));

ProcessExpressionType(classExp);
exp->type = 5;
exp->__anon1.list = MkListOne(MkExpOp(MkExpBrackets(MkListOne(MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpBrackets(MkListOne(exp->__anon1.op.exp1))), exp->__anon1.op.op, MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpBrackets(MkListOne(exp->__anon1.op.exp2)))))), '/', MkExpMember(classExp, MkIdentifier("typeSize"))));
ProcessExpressionType(((struct Expression *)(*exp->__anon1.list).first)->__anon1.op.exp2);
FreeType(dummy);
return ;
}
}
}
}
}
if(!success && exp->__anon1.op.exp1->type == 2)
{
if(CheckExpressionType(exp->__anon1.op.exp1, exp->__anon1.op.exp1->destType, 0, 0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->__anon1.op.exp1->destType;
if(exp->__anon1.op.exp1->destType)
exp->__anon1.op.exp1->destType->refCount++;
success = 1;
}
else if(CheckExpressionType(exp->__anon1.op.exp2, exp->__anon1.op.exp2->destType, 0, 0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->__anon1.op.exp2->destType;
if(exp->__anon1.op.exp2->destType)
exp->__anon1.op.exp2->destType->refCount++;
success = 1;
}
}
else if(!success)
{
if(CheckExpressionType(exp->__anon1.op.exp2, exp->__anon1.op.exp2->destType, 0, 0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->__anon1.op.exp2->destType;
if(exp->__anon1.op.exp2->destType)
exp->__anon1.op.exp2->destType->refCount++;
success = 1;
}
else if(CheckExpressionType(exp->__anon1.op.exp1, exp->__anon1.op.exp1->destType, 0, 0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->__anon1.op.exp1->destType;
if(exp->__anon1.op.exp1->destType)
exp->__anon1.op.exp1->destType->refCount++;
success = 1;
}
}
if(!success)
{
char expString1[10240];
char expString2[10240];
char type1[1024];
char type2[1024];

expString1[0] = '\0';
expString2[0] = '\0';
type1[0] = '\0';
type2[0] = '\0';
if(inCompiler)
{
PrintExpression(exp->__anon1.op.exp1, expString1);
__ecereNameSpace__ecere__sys__ChangeCh(expString1, '\n', ' ');
PrintExpression(exp->__anon1.op.exp2, expString2);
__ecereNameSpace__ecere__sys__ChangeCh(expString2, '\n', ' ');
PrintType(exp->__anon1.op.exp1->expType, type1, 0, 1);
PrintType(exp->__anon1.op.exp2->expType, type2, 0, 1);
}
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "incompatible expressions %s (%s) and %s (%s)\n", (((void *)0))), expString1, type1, expString2, type2);
}
}
}
else if(!boolResult && !useSideUnit && c2 && c2->type == 3 && type1 && type1->kind != 8)
{
if(exp->__anon1.op.exp1->destType)
FreeType(exp->__anon1.op.exp1->destType);
exp->__anon1.op.exp1->destType = type2->__anon1._class->__anon1.registered->dataType;
if(type2->__anon1._class->__anon1.registered->dataType)
type2->__anon1._class->__anon1.registered->dataType->refCount++;
CheckExpressionType(exp->__anon1.op.exp1, exp->__anon1.op.exp1->destType, 0, 0);
exp->expType = type2;
if(type2)
type2->refCount++;
}
else if(!boolResult && !useSideUnit && c1 && c1->type == 3 && type2 && type2->kind != 8)
{
if(exp->__anon1.op.exp2->destType)
FreeType(exp->__anon1.op.exp2->destType);
exp->__anon1.op.exp2->destType = type1->__anon1._class->__anon1.registered->dataType;
if(type1->__anon1._class->__anon1.registered->dataType)
type1->__anon1._class->__anon1.registered->dataType->refCount++;
CheckExpressionType(exp->__anon1.op.exp2, exp->__anon1.op.exp2->destType, 0, 0);
exp->expType = type1;
if(type1)
type1->refCount++;
}
else if(type1)
{
unsigned int valid = 0;

if(!boolResult && useSideUnit && c1 && c1->type == 3 && type2 && type2->kind != 8)
{
if(exp->__anon1.op.exp2->destType)
FreeType(exp->__anon1.op.exp2->destType);
exp->__anon1.op.exp2->destType = c1->dataType;
exp->__anon1.op.exp2->destType->refCount++;
CheckExpressionType(exp->__anon1.op.exp2, exp->__anon1.op.exp2->destType, 0, 0);
if(type2)
FreeType(type2);
type2 = exp->__anon1.op.exp2->destType;
c2 = type2 && type2->kind == 8 && type2->__anon1._class ? type2->__anon1._class->__anon1.registered : (((void *)0));
if(type2)
type2->refCount++;
exp->expType = type2;
type2->refCount++;
}
if(!boolResult && useSideUnit && c2 && c2->type == 3 && type1 && type1->kind != 8)
{
if(exp->__anon1.op.exp1->destType)
FreeType(exp->__anon1.op.exp1->destType);
exp->__anon1.op.exp1->destType = c2->dataType;
exp->__anon1.op.exp1->destType->refCount++;
CheckExpressionType(exp->__anon1.op.exp1, exp->__anon1.op.exp1->destType, 0, 0);
type1 = exp->__anon1.op.exp1->destType;
c1 = type1 && type1->kind == 8 && type1->__anon1._class ? type1->__anon1._class->__anon1.registered : (((void *)0));
exp->expType = type1;
type1->refCount++;
}
if(!boolResult || exp->__anon1.op.op == '>' || exp->__anon1.op.op == '<' || exp->__anon1.op.op == GE_OP || exp->__anon1.op.op == LE_OP)
{
unsigned int op1IsEnum = c1 && c1->type == 4;
unsigned int op2IsEnum = c2 && c2->type == 4;

if(exp->__anon1.op.op == '*' || exp->__anon1.op.op == '/' || exp->__anon1.op.op == '-' || exp->__anon1.op.op == '|' || exp->__anon1.op.op == '^')
{
if(op1IsEnum && exp->__anon1.op.exp2->expType)
{
if(CheckExpressionType(exp->__anon1.op.exp1, exp->__anon1.op.exp2->expType, 0, 0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->__anon1.op.exp2->expType;
if(exp->__anon1.op.exp2->expType)
exp->__anon1.op.exp2->expType->refCount++;
valid = 1;
}
}
else if(op2IsEnum && exp->__anon1.op.exp1->expType)
{
if(CheckExpressionType(exp->__anon1.op.exp2, exp->__anon1.op.exp1->expType, 0, 0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->__anon1.op.exp1->expType;
if(exp->__anon1.op.exp1->expType)
exp->__anon1.op.exp1->expType->refCount++;
valid = 1;
}
}
}
else
{
if(op1IsEnum && exp->__anon1.op.exp2->expType)
{
if(CheckExpressionType(exp->__anon1.op.exp1, exp->__anon1.op.exp2->expType, 0, 0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->__anon1.op.exp1->expType;
if(exp->__anon1.op.exp1->expType)
exp->__anon1.op.exp1->expType->refCount++;
valid = 1;
}
}
else if(op2IsEnum && exp->__anon1.op.exp1->expType)
{
if(CheckExpressionType(exp->__anon1.op.exp2, exp->__anon1.op.exp1->expType, 0, 0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->__anon1.op.exp2->expType;
if(exp->__anon1.op.exp2->expType)
exp->__anon1.op.exp2->expType->refCount++;
valid = 1;
}
}
}
}
if(!valid)
{
if(c2 && c2->type == 3 && (!c1 || c1->type != 3))
{
if(exp->__anon1.op.exp1->destType)
FreeType(exp->__anon1.op.exp1->destType);
exp->__anon1.op.exp1->destType = type2;
type2->refCount++;
if(CheckExpressionType(exp->__anon1.op.exp1, exp->__anon1.op.exp1->destType, 0, 0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->__anon1.op.exp1->destType;
if(exp->__anon1.op.exp1->destType)
exp->__anon1.op.exp1->destType->refCount++;
}
}
else
{
if(exp->__anon1.op.exp2->destType)
FreeType(exp->__anon1.op.exp2->destType);
exp->__anon1.op.exp2->destType = type1;
type1->refCount++;
if(CheckExpressionType(exp->__anon1.op.exp2, exp->__anon1.op.exp2->destType, 0, 0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->__anon1.op.exp2->destType;
if(exp->__anon1.op.exp2->destType)
exp->__anon1.op.exp2->destType->refCount++;
}
else if(type1 && type2)
{
char expString1[10240];
char expString2[10240];
char type1String[1024];
char type2String[1024];

expString1[0] = '\0';
expString2[0] = '\0';
type1String[0] = '\0';
type2String[0] = '\0';
if(inCompiler)
{
PrintExpression(exp->__anon1.op.exp1, expString1);
__ecereNameSpace__ecere__sys__ChangeCh(expString1, '\n', ' ');
PrintExpression(exp->__anon1.op.exp2, expString2);
__ecereNameSpace__ecere__sys__ChangeCh(expString2, '\n', ' ');
PrintType(exp->__anon1.op.exp1->expType, type1String, 0, 1);
PrintType(exp->__anon1.op.exp2->expType, type2String, 0, 1);
}
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "incompatible expressions %s (%s) and %s (%s)\n", (((void *)0))), expString1, type1String, expString2, type2String);
if(c1 && c1->type == 4)
{
exp->expType = exp->__anon1.op.exp1->expType;
if(exp->__anon1.op.exp1->expType)
exp->__anon1.op.exp1->expType->refCount++;
}
else if(c2 && c2->type == 4)
{
exp->expType = exp->__anon1.op.exp2->expType;
if(exp->__anon1.op.exp2->expType)
exp->__anon1.op.exp2->expType->refCount++;
}
}
}
}
}
else if(type2)
{
if(c2 && c2->type == 4)
{
struct Type * oldType = exp->__anon1.op.exp1->expType;

exp->__anon1.op.exp1->expType = (((void *)0));
if(CheckExpressionType(exp->__anon1.op.exp1, exp->__anon1.op.exp1->destType, 0, 0))
FreeType(oldType);
else
exp->__anon1.op.exp1->expType = oldType;
}
if(exp->__anon1.op.exp1->destType)
FreeType(exp->__anon1.op.exp1->destType);
exp->__anon1.op.exp1->destType = type2;
type2->refCount++;
if(CheckExpressionType(exp->__anon1.op.exp1, exp->__anon1.op.exp1->destType, 0, 0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->__anon1.op.exp1->destType;
if(exp->__anon1.op.exp1->destType)
exp->__anon1.op.exp1->destType->refCount++;
}
}
}
else if(type2 && (!type1 || (type2->kind == 8 && type1->kind != 8)))
{
if(type1 && c2 && c2->type == 3)
{
if(exp->__anon1.op.exp1->destType)
FreeType(exp->__anon1.op.exp1->destType);
exp->__anon1.op.exp1->destType = type2->__anon1._class->__anon1.registered->dataType;
if(type2->__anon1._class->__anon1.registered->dataType)
type2->__anon1._class->__anon1.registered->dataType->refCount++;
CheckExpressionType(exp->__anon1.op.exp1, exp->__anon1.op.exp1->destType, 0, 0);
}
if(exp->__anon1.op.op == '!')
{
exp->expType = MkClassType("bool");
exp->expType->truth = 1;
}
else
{
exp->expType = type2;
if(type2)
type2->refCount++;
}
}
else if(type1 && (!type2 || (type1->kind == 8 && type2->kind != 8)))
{
if(c2 && c2->type == 3)
{
if(exp->__anon1.op.exp2->destType)
FreeType(exp->__anon1.op.exp2->destType);
exp->__anon1.op.exp2->destType = type1->__anon1._class->__anon1.registered->dataType;
if(type1->__anon1._class->__anon1.registered->dataType)
type1->__anon1._class->__anon1.registered->dataType->refCount++;
CheckExpressionType(exp->__anon1.op.exp2, exp->__anon1.op.exp2->destType, 0, 0);
}
exp->expType = type1;
if(type1)
type1->refCount++;
}
}
yylloc = exp->loc;
if(exp->__anon1.op.exp1 && !exp->__anon1.op.exp1->expType)
{
char expString[10000];

expString[0] = '\0';
if(inCompiler)
{
PrintExpression(exp->__anon1.op.exp1, expString);
__ecereNameSpace__ecere__sys__ChangeCh(expString, '\n', ' ');
}
if(expString[0])
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "couldn't determine type of %s\n", (((void *)0))), expString);
}
if(exp->__anon1.op.exp2 && !exp->__anon1.op.exp2->expType)
{
char expString[10240];

expString[0] = '\0';
if(inCompiler)
{
PrintExpression(exp->__anon1.op.exp2, expString);
__ecereNameSpace__ecere__sys__ChangeCh(expString, '\n', ' ');
}
if(expString[0])
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "couldn't determine type of %s\n", (((void *)0))), expString);
}
if(boolResult)
{
FreeType(exp->expType);
exp->expType = MkClassType("bool");
exp->expType->truth = 1;
}
if(exp->__anon1.op.op != SIZEOF)
exp->isConstant = (!exp->__anon1.op.exp1 || exp->__anon1.op.exp1->isConstant) && (!exp->__anon1.op.exp2 || exp->__anon1.op.exp2->isConstant);
if(exp->__anon1.op.op == SIZEOF && exp->__anon1.op.exp2->expType)
{
DeclareType(curExternal, exp->__anon1.op.exp2->expType, 1, 0);
}
if(exp->__anon1.op.op == DELETE && exp->__anon1.op.exp2 && exp->__anon1.op.exp2->expType && __ecereProp_Type_Get_specConst(exp->__anon1.op.exp2->expType))
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "deleting const qualified object\n", (((void *)0))));
yylloc = oldyylloc;
FreeType(dummy);
if(type2)
FreeType(type2);
break;
}
case 5:
case 32:
{
struct Expression * e;

exp->isConstant = 1;
for(e = (*exp->__anon1.list).first; e; e = e->next)
{
if(!e->next)
{
FreeType(e->destType);
e->opDestType = exp->opDestType;
e->usedInComparison = exp->usedInComparison;
e->parentOpDestType = exp->parentOpDestType;
e->destType = exp->destType;
if(e->destType)
{
exp->destType->refCount++;
}
}
ProcessExpressionType(e);
if(e->ambiguousUnits)
exp->ambiguousUnits = 1;
if(!exp->expType && !e->next)
{
exp->expType = e->expType;
if(e->expType)
e->expType->refCount++;
exp->needCast = e->needCast;
}
if(!e->isConstant)
exp->isConstant = 0;
}
e = (*exp->__anon1.list).first;
if(!e->next && e->type == 8)
{
struct Expression * next = exp->next, * prev = exp->prev;

FreeType(exp->expType);
FreeType(exp->destType);
(__ecereNameSpace__ecere__com__eSystem_Delete(exp->__anon1.list), exp->__anon1.list = 0);
*exp = *e;
exp->prev = prev;
exp->next = next;
((e ? __extension__ ({
void * __ecerePtrToDelete = (e);

__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), e = 0);
ProcessExpressionType(exp);
}
break;
}
case 6:
{
struct Expression * e;

exp->isConstant = 1;
ProcessExpressionType(exp->__anon1.index.exp);
if(!exp->__anon1.index.exp->isConstant)
exp->isConstant = 0;
if(exp->__anon1.index.exp->expType)
{
struct Type * source = exp->__anon1.index.exp->expType;

if(source->kind == 8 && source->__anon1._class && source->__anon1._class->__anon1.registered)
{
struct __ecereNameSpace__ecere__com__Class * _class = source->__anon1._class->__anon1.registered;
struct __ecereNameSpace__ecere__com__Class * c = _class->templateClass ? _class->templateClass : _class;

if(_class != containerClass && __ecereNameSpace__ecere__com__eClass_IsDerived(c, containerClass) && _class->templateArgs)
{
exp->expType = ProcessTypeString(_class->templateArgs[2].__anon1.__anon1.dataTypeString, 0);
if(exp->__anon1.index.index && (*exp->__anon1.index.index).last)
{
struct Type * type = ProcessTypeString(_class->templateArgs[1].__anon1.__anon1.dataTypeString, 0);

if(type->kind == 8)
type->constant = 1;
else if(type->kind == 13)
{
struct Type * t = type;

while(t->kind == 13)
t = t->__anon1.type;
t->constant = 1;
}
((struct Expression *)(*exp->__anon1.index.index).last)->destType = type;
}
}
}
}
for(e = (*exp->__anon1.index.index).first; e; e = e->next)
{
if(!e->next && exp->__anon1.index.exp->expType && exp->__anon1.index.exp->expType->kind == 12 && exp->__anon1.index.exp->expType->__anon1.__anon4.enumClass)
{
if(e->destType)
FreeType(e->destType);
e->destType = MkClassType(exp->__anon1.index.exp->expType->__anon1.__anon4.enumClass->string);
}
ProcessExpressionType(e);
if(!e->next)
{
}
if(!e->isConstant)
exp->isConstant = 0;
}
if(!exp->expType)
exp->expType = Dereference(exp->__anon1.index.exp->expType);
if(exp->expType)
DeclareType(curExternal, exp->expType, 1, 0);
break;
}
case 7:
{
struct Expression * e;
struct Type * functionType;
struct Type * methodType = (((void *)0));
char name[1024];

name[0] = '\0';
if(inCompiler)
{
PrintExpression(exp->__anon1.call.exp, name);
if(exp->__anon1.call.exp->expType && !exp->__anon1.call.exp->expType->__anon1.__anon2.returnType)
{
PrintExpression(exp->__anon1.call.exp, name);
}
}
if(exp->__anon1.call.exp->type == 0)
{
struct Expression * idExp = exp->__anon1.call.exp;
struct Identifier * id = idExp->__anon1.__anon1.identifier;

if(!strcmp(id->string, "__sync_synchronize") || !strcmp(id->string, "__sync_lock_release"))
{
exp->expType = ProcessTypeString("void", 1);
break;
}
else if(!strcmp(id->string, "__sync_bool_compare_and_swap"))
{
exp->expType = ProcessTypeString("bool", 1);
break;
}
else if(!strcmp(id->string, "__sync_sub_and_fetch") || !strcmp(id->string, "__sync_fetch_and_sub") || !strcmp(id->string, "__sync_add_and_fetch") || !strcmp(id->string, "__sync_fetch_and_add") || !strcmp(id->string, "__sync_or_and_fetch") || !strcmp(id->string, "__sync_fetch_and_or") || !strcmp(id->string, "__sync_and_and_fetch") || !strcmp(id->string, "__sync_fetch_and_and") || !strcmp(id->string, "__sync_xor_and_fetch") || !strcmp(id->string, "__sync_fetch_and_xor") || !strcmp(id->string, "__sync_nand_and_fetch") || !strcmp(id->string, "__sync_fetch_and_nand") || !strcmp(id->string, "__sync_val_compare_and_swap") || !strcmp(id->string, "__sync_lock_test_and_set"))
{
if(exp->__anon1.call.arguments && (*exp->__anon1.call.arguments).first && ((struct Expression *)(*exp->__anon1.call.arguments).first)->next)
ProcessExpressionType((*exp->__anon1.call.arguments).first);
if(exp->__anon1.call.arguments && (*exp->__anon1.call.arguments).first && ((struct Expression *)(*exp->__anon1.call.arguments).first)->next && ((struct Expression *)(*exp->__anon1.call.arguments).first)->next->expType)
{
exp->expType = ((struct Expression *)(*exp->__anon1.call.arguments).first)->next->expType;
exp->expType->refCount++;
}
else
exp->expType = ProcessTypeString("int", 1);
break;
}
else if(!strcmp(id->string, "__builtin_frame_address"))
{
exp->expType = ProcessTypeString("void *", 1);
if(exp->__anon1.call.arguments && (*exp->__anon1.call.arguments).first)
ProcessExpressionType((*exp->__anon1.call.arguments).first);
break;
}
else if(!strcmp(id->string, "__ENDIAN_PAD"))
{
exp->expType = ProcessTypeString("int", 1);
if(exp->__anon1.call.arguments && (*exp->__anon1.call.arguments).first)
ProcessExpressionType((*exp->__anon1.call.arguments).first);
break;
}
else if(!strcmp(id->string, "Max") || !strcmp(id->string, "Min") || !strcmp(id->string, "Sgn") || !strcmp(id->string, "Abs"))
{
struct Expression * a = (((void *)0));
struct Expression * b = (((void *)0));
struct Expression * tempExp1 = (((void *)0)), * tempExp2 = (((void *)0));

if((!strcmp(id->string, "Max") || !strcmp(id->string, "Min")) && (*exp->__anon1.call.arguments).count == 2)
{
a = (*exp->__anon1.call.arguments).first;
b = (*exp->__anon1.call.arguments).last;
tempExp1 = a;
tempExp2 = b;
}
else if((*exp->__anon1.call.arguments).count == 1)
{
a = (*exp->__anon1.call.arguments).first;
tempExp1 = a;
}
if(a)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear((&*exp->__anon1.call.arguments));
idExp->__anon1.__anon1.identifier = (((void *)0));
FreeExpContents(exp);
ProcessExpressionType(a);
if(b)
ProcessExpressionType(b);
exp->type = 5;
exp->__anon1.list = MkList();
if(a->expType && (!b || b->expType))
{
if((!a->isConstant && a->type != 0) || (b && !b->isConstant && b->type != 0))
{
if(inCompiler)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct __ecereNameSpace__ecere__sys__OldList * decls = MkList();
struct Declaration * decl;
char temp1[1024], temp2[1024];

GetTypeSpecs(a->expType, specs);
if(a && !a->isConstant && a->type != 0)
{
sprintf(temp1, "__simpleStruct%d", curContext->simpleID++);
ListAdd(decls, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(temp1)), (((void *)0))));
tempExp1 = QMkExpId(temp1);
tempExp1->expType = a->expType;
if(a->expType)
a->expType->refCount++;
ListAdd(exp->__anon1.list, MkExpOp(CopyExpression(tempExp1), '=', a));
}
if(b && !b->isConstant && b->type != 0)
{
sprintf(temp2, "__simpleStruct%d", curContext->simpleID++);
ListAdd(decls, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(temp2)), (((void *)0))));
tempExp2 = QMkExpId(temp2);
tempExp2->expType = b->expType;
if(b->expType)
b->expType->refCount++;
ListAdd(exp->__anon1.list, MkExpOp(CopyExpression(tempExp2), '=', b));
}
decl = MkDeclaration(specs, decls);
if(!curCompound->__anon1.compound.declarations)
curCompound->__anon1.compound.declarations = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*curCompound->__anon1.compound.declarations), (((void *)0)), decl);
}
}
}
if(!strcmp(id->string, "Max") || !strcmp(id->string, "Min"))
{
int op = (!strcmp(id->string, "Max")) ? '>' : '<';

ListAdd(exp->__anon1.list, MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(tempExp1), op, CopyExpression(tempExp2)))), MkListOne(CopyExpression(tempExp1)), CopyExpression(tempExp2)));
exp->expType = a->expType;
if(a->expType)
a->expType->refCount++;
}
else if(!strcmp(id->string, "Abs"))
{
ListAdd(exp->__anon1.list, MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(tempExp1), '<', MkExpConstant("0")))), MkListOne(MkExpOp((((void *)0)), '-', CopyExpression(tempExp1))), CopyExpression(tempExp1)));
exp->expType = a->expType;
if(a->expType)
a->expType->refCount++;
}
else if(!strcmp(id->string, "Sgn"))
{
ListAdd(exp->__anon1.list, MkExpCondition(MkExpBrackets(MkListOne(MkExpOp((((void *)0)), '!', CopyExpression(tempExp1)))), MkListOne(MkExpConstant("0")), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(tempExp1), '<', MkExpConstant("0")))), MkListOne(MkExpConstant("-1")), MkExpConstant("1"))))));
exp->expType = ProcessTypeString("int", 0);
}
FreeExpression(tempExp1);
if(tempExp2)
FreeExpression(tempExp2);
FreeIdentifier(id);
break;
}
}
}
{
struct Type * dummy = (dummy = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), dummy->count = 1, dummy->refCount = 1, dummy);

if(!exp->__anon1.call.exp->destType)
{
exp->__anon1.call.exp->destType = dummy;
dummy->refCount++;
}
ProcessExpressionType(exp->__anon1.call.exp);
if(exp->__anon1.call.exp->destType == dummy)
{
FreeType(dummy);
exp->__anon1.call.exp->destType = (((void *)0));
}
FreeType(dummy);
}
functionType = exp->__anon1.call.exp->expType;
if(functionType && functionType->kind == 16)
{
methodType = functionType;
functionType = methodType->__anon1.__anon3.method->dataType;
if(exp->__anon1.call.exp->expType->__anon1.__anon3.usedClass)
{
char typeString[1024];

typeString[0] = '\0';
{
struct Symbol * back = functionType->__anon1.__anon2.thisClass;

functionType->__anon1.__anon2.thisClass = (((void *)0));
PrintType(functionType, typeString, 1, 1);
functionType->__anon1.__anon2.thisClass = back;
}
if(strstr(typeString, "thisclass"))
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;

{
struct Context * context = SetupTemplatesContext(exp->__anon1.call.exp->expType->__anon1.__anon3.usedClass);

decl = SpecDeclFromString(typeString, specs, (((void *)0)));
if(thisClass != (exp->__anon1.call.exp->expType->__anon1.__anon3.usedClass->templateClass ? exp->__anon1.call.exp->expType->__anon1.__anon3.usedClass->templateClass : exp->__anon1.call.exp->expType->__anon1.__anon3.usedClass))
thisClassParams = 0;
ReplaceThisClassSpecifiers(specs, exp->__anon1.call.exp->expType->__anon1.__anon3.usedClass);
{
struct __ecereNameSpace__ecere__com__Class * backupThisClass = thisClass;

thisClass = exp->__anon1.call.exp->expType->__anon1.__anon3.usedClass;
ProcessDeclarator(decl, 1);
thisClass = backupThisClass;
}
thisClassParams = 1;
functionType = ProcessType(specs, decl);
functionType->refCount = 0;
FinishTemplatesContext(context);
{
struct Type * p, * op;

for(p = functionType->__anon1.__anon2.params.first, op = methodType->__anon1.__anon3.method->dataType->__anon1.__anon2.params.first; p && op; p = p->next, op = op->next)
{
if(op->kind == 21)
p->thisClassFrom = methodType->__anon1.__anon3.method->_class;
}
}
if(methodType->__anon1.__anon3.method->dataType->__anon1.__anon2.returnType->kind == 21)
{
functionType->__anon1.__anon2.returnType->thisClassFrom = methodType->__anon1.__anon3.method->_class;
}
}
FreeList(specs, (void *)(FreeSpecifier));
FreeDeclarator(decl);
}
}
}
if(functionType && functionType->kind == 13 && functionType->__anon1.type && functionType->__anon1.type->kind == 11)
{
struct Type * type = functionType->__anon1.type;

if(!functionType->refCount)
{
functionType->__anon1.type = (((void *)0));
FreeType(functionType);
}
functionType = type;
}
if(functionType && functionType->kind != 11)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "called object %s is not a function\n", (((void *)0))), name);
}
else if(functionType)
{
unsigned int emptyParams = 0, noParams = 0;
struct Expression * e = exp->__anon1.call.arguments ? (*exp->__anon1.call.arguments).first : (((void *)0));
struct Type * type = functionType->__anon1.__anon2.params.first;
struct Expression * memberExp = (exp->__anon1.call.exp->type == 8) ? exp->__anon1.call.exp : (((void *)0));
int extra = 0;
struct Location oldyylloc = yylloc;

if(!type)
emptyParams = 1;
if(functionType->extraParam && e && functionType->__anon1.__anon2.thisClass)
{
e->destType = MkClassType(functionType->__anon1.__anon2.thisClass->string);
e = e->next;
}
if(!functionType->__anon1.__anon2.staticMethod && !functionType->extraParam)
{
if(memberExp && memberExp->__anon1.member.exp && memberExp->__anon1.member.exp->expType && memberExp->__anon1.member.exp->expType->kind == 19 && memberExp->__anon1.member.exp->expType->__anon1._class)
{
type = MkClassType(memberExp->__anon1.member.exp->expType->__anon1._class->string);
if(e)
{
e->destType = type;
e = e->next;
type = functionType->__anon1.__anon2.params.first;
}
else
type->refCount = 0;
}
else if(!memberExp && (functionType->__anon1.__anon2.thisClass || (methodType && methodType->__anon1.__anon3.methodClass)))
{
type = MkClassType(functionType->__anon1.__anon2.thisClass ? functionType->__anon1.__anon2.thisClass->string : (methodType ? methodType->__anon1.__anon3.methodClass->fullName : (((void *)0))));
type->byReference = functionType->byReference;
type->typedByReference = functionType->typedByReference;
if(e)
{
if(e->next && type->kind == 8 && (functionType && functionType->__anon1.__anon2.thisClass) && functionType->classObjectType == 2)
e = e->next;
e->destType = type;
e = e->next;
type = functionType->__anon1.__anon2.params.first;
}
else
type->refCount = 0;
}
}
if(type && type->kind == 0)
{
noParams = 1;
if(!type->refCount)
FreeType(type);
type = (((void *)0));
}
for(; e; e = e->next)
{
if(!type && !emptyParams)
{
yylloc = e->loc;
if(methodType && methodType->__anon1.__anon3.methodClass)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "too many arguments for method %s::%s (%d given, expected %d)\n", (((void *)0))), methodType->__anon1.__anon3.methodClass->fullName, methodType->__anon1.__anon3.method->name, (*exp->__anon1.call.arguments).count, noParams ? 0 : functionType->__anon1.__anon2.params.count);
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "too many arguments for function %s (%d given, expected %d)\n", (((void *)0))), name, (*exp->__anon1.call.arguments).count, noParams ? 0 : functionType->__anon1.__anon2.params.count);
break;
}
if(methodType && type && type->kind == 20 && type->__anon1.templateParameter->type == 0)
{
struct Type * templatedType = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * _class = methodType->__anon1.__anon3.usedClass;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * curParam = (((void *)0));
int id = 0;

if(_class && _class->templateArgs)
{
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = _class; sClass; sClass = sClass->base)
{
if(sClass->templateClass)
sClass = sClass->templateClass;
id = 0;
for(curParam = sClass->templateParams.first; curParam; curParam = curParam->next)
{
if(curParam->type == 0 && !strcmp(type->__anon1.templateParameter->identifier->string, curParam->name))
{
struct __ecereNameSpace__ecere__com__Class * nextClass;

for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
{
if(nextClass->templateClass)
nextClass = nextClass->templateClass;
id += nextClass->templateParams.count;
}
break;
}
id++;
}
if(curParam)
break;
}
}
if(curParam && _class->templateArgs[id].__anon1.__anon1.dataTypeString)
{
unsigned int constant = type->constant;
struct __ecereNameSpace__ecere__com__ClassTemplateArgument arg = _class->templateArgs[id];

{
struct Context * context = SetupTemplatesContext(_class);

templatedType = ProcessTypeString(arg.__anon1.__anon1.dataTypeString, 0);
FinishTemplatesContext(context);
}
if(templatedType->kind == 8 && constant)
templatedType->constant = 1;
else if(templatedType->kind == 13)
{
struct Type * t = templatedType->__anon1.type;

while(t->kind == 13)
t = t->__anon1.type;
if(constant)
t->constant = constant;
}
e->destType = templatedType;
if(templatedType)
{
templatedType->passAsTemplate = 1;
}
}
else
{
e->destType = type;
if(type)
type->refCount++;
}
}
else
{
if(type && type->kind == 14 && type->prev && type->prev->kind == 8 && type->prev->classObjectType)
{
e->destType = type->prev;
e->destType->refCount++;
}
else
{
e->destType = type;
if(type)
type->refCount++;
}
}
if(type && type->kind != 14)
{
struct Type * next = type->next;

if(!type->refCount)
FreeType(type);
type = next;
}
}
if(type && type->kind != 14)
{
if(methodType && methodType->__anon1.__anon3.methodClass)
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "not enough arguments for method %s::%s (%d given, expected %d)\n", (((void *)0))), methodType->__anon1.__anon3.methodClass->fullName, methodType->__anon1.__anon3.method->name, exp->__anon1.call.arguments ? (*exp->__anon1.call.arguments).count : 0, functionType->__anon1.__anon2.params.count + extra);
else
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "not enough arguments for function %s (%d given, expected %d)\n", (((void *)0))), name, exp->__anon1.call.arguments ? (*exp->__anon1.call.arguments).count : 0, functionType->__anon1.__anon2.params.count + extra);
}
yylloc = oldyylloc;
if(type && !type->refCount)
FreeType(type);
}
else
{
functionType = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 0, __ecereInstance1->kind = 11, __ecereInstance1;
});
if(exp->__anon1.call.exp->type == 0)
{
char * string = exp->__anon1.call.exp->__anon1.__anon1.identifier->string;

if(inCompiler)
{
struct Symbol * symbol;
struct Location oldyylloc = yylloc;

yylloc = exp->__anon1.call.exp->__anon1.__anon1.identifier->loc;
if(strstr(string, "__builtin_") == string)
{
if(exp->destType)
{
functionType->__anon1.__anon2.returnType = exp->destType;
exp->destType->refCount++;
}
}
else
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "%s undefined; assuming extern returning int\n", (((void *)0))), string);
symbol = __extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString(string), __ecereInstance1->type = ProcessTypeString("int()", 1), __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol);
if(strstr(symbol->string, "::"))
globalContext->hasNameSpace = 1;
yylloc = oldyylloc;
}
}
else if(exp->__anon1.call.exp->type == 8)
{
}
else
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "callable object undefined; extern assuming returning int\n", (((void *)0))));
if(!functionType->__anon1.__anon2.returnType)
{
functionType->__anon1.__anon2.returnType = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1->kind = 3, __ecereInstance1;
});
}
}
if(functionType && functionType->kind == 11)
{
exp->expType = functionType->__anon1.__anon2.returnType;
if(functionType->__anon1.__anon2.returnType)
functionType->__anon1.__anon2.returnType->refCount++;
if(!functionType->refCount)
FreeType(functionType);
}
if(exp->__anon1.call.arguments)
{
for(e = (*exp->__anon1.call.arguments).first; e; e = e->next)
ProcessExpressionType(e);
}
break;
}
case 8:
{
struct Type * type;
struct Location oldyylloc = yylloc;
unsigned int thisPtr;
struct Expression * checkExp = exp->__anon1.member.exp;

while(checkExp)
{
if(checkExp->type == 11)
checkExp = checkExp->__anon1.cast.exp;
else if(checkExp->type == 5)
checkExp = checkExp->__anon1.list ? (*checkExp->__anon1.list).first : (((void *)0));
else
break;
}
thisPtr = (checkExp && checkExp->type == 0 && !strcmp(checkExp->__anon1.__anon1.identifier->string, "this"));
exp->thisPtr = thisPtr;
if(exp->__anon1.member.member && exp->__anon1.member.member->_class && exp->__anon1.member.member->_class->__anon1.__anon1.name)
{
exp->__anon1.member.member->classSym = exp->__anon1.member.member->_class->__anon1.__anon1.symbol;
}
ProcessExpressionType(exp->__anon1.member.exp);
if(exp->__anon1.member.exp->expType && exp->__anon1.member.exp->expType->kind == 8 && exp->__anon1.member.exp->expType->__anon1._class && exp->__anon1.member.exp->expType->__anon1._class->__anon1.registered && exp->__anon1.member.exp->expType->__anon1._class->__anon1.registered->type == 0)
{
exp->isConstant = 0;
}
else
exp->isConstant = exp->__anon1.member.exp->isConstant;
type = exp->__anon1.member.exp->expType;
yylloc = exp->loc;
if(type && (type->kind == 20))
{
struct __ecereNameSpace__ecere__com__Class * _class = thisClass ? thisClass : currentClass;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param = (((void *)0));

if(_class)
{
for(param = _class->templateParams.first; param; param = param->next)
{
if(param->type == 1 && exp->__anon1.member.member && exp->__anon1.member.member->string && !strcmp(param->name, exp->__anon1.member.member->string))
break;
}
}
if(param && param->defaultArg.__anon1.__anon2.__anon1.member)
{
struct Expression * argExp = GetTemplateArgExpByName(param->name, (((void *)0)), thisClass, 1);

if(argExp)
{
struct Expression * expMember = exp->__anon1.member.exp;
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
char thisClassTypeString[1024];

FreeIdentifier(exp->__anon1.member.member);
ProcessExpressionType(argExp);
{
char * colon = strstr(param->defaultArg.__anon1.__anon2.memberString, "::");

if(colon)
{
memcpy(thisClassTypeString, param->defaultArg.__anon1.__anon2.memberString, colon - param->defaultArg.__anon1.__anon2.memberString);
thisClassTypeString[colon - param->defaultArg.__anon1.__anon2.memberString] = '\0';
}
else
strcpy(thisClassTypeString, _class->fullName);
}
decl = SpecDeclFromString(param->defaultArg.__anon1.__anon2.__anon1.member->dataTypeString, specs, (((void *)0)));
exp->expType = ProcessType(specs, decl);
if(exp->expType->kind == 8 && exp->expType->__anon1._class && exp->expType->__anon1._class->__anon1.registered && exp->expType->__anon1._class->__anon1.registered->templateClass)
{
struct __ecereNameSpace__ecere__com__Class * expClass = exp->expType->__anon1._class->__anon1.registered;
struct __ecereNameSpace__ecere__com__Class * cClass = (((void *)0));
int paramCount = 0;
int lastParam = -1;
char templateString[1024];
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

sprintf(templateString, "%s<", expClass->templateClass->fullName);
for(cClass = expClass; cClass; cClass = cClass->base)
{
int p = 0;

for(param = cClass->templateParams.first; param; param = param->next)
{
int id = p;
struct __ecereNameSpace__ecere__com__Class * sClass;
struct __ecereNameSpace__ecere__com__ClassTemplateArgument arg;

for(sClass = cClass->base; sClass; sClass = sClass->base)
id += sClass->templateParams.count;
arg = expClass->templateArgs[id];
for(sClass = _class; sClass; sClass = sClass->base)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * cParam;
int p = 0;
struct __ecereNameSpace__ecere__com__Class * nextClass;

for(nextClass = sClass->base; nextClass; nextClass = nextClass->base)
p += nextClass->templateParams.count;
for(cParam = sClass->templateParams.first; cParam; cParam = cParam->next, p++)
{
if(cParam->type == 0 && arg.__anon1.__anon1.dataTypeString && !strcmp(cParam->name, arg.__anon1.__anon1.dataTypeString))
{
if(_class->templateArgs && arg.__anon1.__anon1.dataTypeString && (!param->defaultArg.__anon1.__anon1.dataTypeString || strcmp(arg.__anon1.__anon1.dataTypeString, param->defaultArg.__anon1.__anon1.dataTypeString)))
{
arg.__anon1.__anon1.dataTypeString = _class->templateArgs[p].__anon1.__anon1.dataTypeString;
arg.__anon1.__anon1.dataTypeClass = _class->templateArgs[p].__anon1.__anon1.dataTypeClass;
break;
}
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
char expString[1024];
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl = SpecDeclFromString(param->__anon1.dataTypeString, specs, (((void *)0)));
struct Expression * exp;
char * string = PrintHexUInt64(arg.__anon1.expression.__anon1.ui64);

exp = MkExpCast(MkTypeName(specs, decl), MkExpConstant(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
ProcessExpressionType(exp);
ComputeExpression(exp);
expString[0] = '\0';
PrintExpression(exp, expString);
strcat(argument, expString);
FreeExpression(exp);
break;
}
case 1:
{
strcat(argument, arg.__anon1.__anon2.__anon1.member->name);
break;
}
case 0:
{
if(arg.__anon1.__anon1.dataTypeString && (!param->defaultArg.__anon1.__anon1.dataTypeString || strcmp(arg.__anon1.__anon1.dataTypeString, param->defaultArg.__anon1.__anon1.dataTypeString)))
{
if(!strcmp(arg.__anon1.__anon1.dataTypeString, "thisclass"))
strcat(argument, thisClassTypeString);
else
strcat(argument, arg.__anon1.__anon1.dataTypeString);
}
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
p++;
}
}
}
{
int len = strlen(templateString);

if(templateString[len - 1] == '>')
templateString[len++] = ' ';
templateString[len++] = '>';
templateString[len++] = '\0';
}
{
struct Context * context = SetupTemplatesContext(_class);

FreeType(exp->expType);
exp->expType = ProcessTypeString(templateString, 0);
FinishTemplatesContext(context);
}
}
if(!__ecereProp_Type_Get_isPointerType(expMember->expType))
expMember = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), (((void *)0))), expMember);
exp->type = 5;
exp->__anon1.list = MkListOne(MkExpOp((((void *)0)), '*', MkExpCast(MkTypeName(specs, MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), decl)), MkExpBrackets(MkListOne(MkExpOp(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), expMember))), '+', MkExpOp(MkExpMember(MkExpMember(argExp, MkIdentifier("member")), MkIdentifier("offset")), '+', MkExpMember(MkExpMember(MkExpMember(CopyExpression(argExp), MkIdentifier("member")), MkIdentifier("_class")), MkIdentifier("offset")))))))));
}
}
else if(type->__anon1.templateParameter && type->__anon1.templateParameter->type == 0 && (type->__anon1.templateParameter->__anon1.dataType || type->__anon1.templateParameter->dataTypeString))
{
type = ProcessTemplateParameterType(type->__anon1.templateParameter);
}
}
if(type && (type->kind == 20))
;
else if(type && (type->kind == 8 || type->kind == 19 || type->kind == 3 || type->kind == 15 || type->kind == 4 || type->kind == 2 || type->kind == 5 || type->kind == 1 || type->kind == 24 || type->kind == 22 || type->kind == 23 || type->kind == 6 || type->kind == 7 || (type->kind == 13 && type->__anon1.type->kind == 1)))
{
struct Identifier * id = exp->__anon1.member.member;
int typeKind = type->kind;
struct __ecereNameSpace__ecere__com__Class * _class = (id && (!id->_class || id->_class->__anon1.__anon1.name)) ? (id->classSym ? id->classSym->__anon1.registered : (type->__anon1._class ? type->__anon1._class->__anon1.registered : (((void *)0)))) : (((void *)0));

if(typeKind == 19 && exp->__anon1.member.exp->type == 24)
{
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "ecere::com::Class");
typeKind = 8;
}
if(id)
{
if(typeKind == 3 || typeKind == 15)
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "int");
else if(!_class)
{
if(type->kind == 8 && type->__anon1._class && type->__anon1._class->__anon1.registered)
{
_class = type->__anon1._class->__anon1.registered;
}
else if((type->kind == 12 || type->kind == 13) && type->__anon1.type && type->__anon1.type->kind == 1)
{
_class = FindClass("char *")->__anon1.registered;
}
else if(type->kind == 13)
{
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "uintptr");
FreeType(exp->expType);
exp->expType = ProcessTypeString("uintptr", 0);
exp->byReference = 1;
}
else
{
char string[1024] = "";
struct Symbol * classSym;

PrintTypeNoConst(type, string, 0, 1);
classSym = FindClass(string);
if(classSym)
_class = classSym->__anon1.registered;
}
}
}
if(_class && id)
{
struct __ecereNameSpace__ecere__com__Property * prop = (((void *)0));
struct __ecereNameSpace__ecere__com__Method * method = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * member = (((void *)0));
struct __ecereNameSpace__ecere__com__Property * revConvert = (((void *)0));
struct __ecereNameSpace__ecere__com__ClassProperty * classProp = (((void *)0));

if(id && id->_class && id->_class->__anon1.__anon1.name && !strcmp(id->_class->__anon1.__anon1.name, "property"))
exp->__anon1.member.memberType = 1;
if(id && id->_class && type->__anon1._class && !__ecereNameSpace__ecere__com__eClass_IsDerived(type->__anon1._class->__anon1.registered, _class))
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "invalid class specifier %s for object of class %s\n", (((void *)0))), _class->fullName, type->__anon1._class->string);
if(typeKind != 19)
{
if((exp->__anon1.member.memberType == 0 && thisPtr) || exp->__anon1.member.memberType == 3)
{
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, id->string, privateModule, (((void *)0)), (((void *)0)));
if(member && member->_class != (_class->templateClass ? _class->templateClass : _class) && exp->__anon1.member.memberType != 3)
{
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, id->string, privateModule);
if(prop)
member = (((void *)0));
}
if(!member && !prop)
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, id->string, privateModule);
if((member && member->_class == (_class->templateClass ? _class->templateClass : _class)) || (prop && prop->_class == (_class->templateClass ? _class->templateClass : _class)))
exp->__anon1.member.thisPtr = 1;
}
else
{
unsigned int useMemberForNonConst = 0;

if(!id->classSym)
{
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, id->string, (((void *)0)));
useMemberForNonConst = prop && exp->destType && ((exp->destType->kind == 8 && !exp->destType->constant) || ((exp->destType->kind == 13 || exp->destType->kind == 12) && exp->destType->__anon1.type && !exp->destType->__anon1.type->constant)) && !strncmp(prop->dataTypeString, "const ", 6);
if(useMemberForNonConst || !id->_class || !id->_class->__anon1.__anon1.name || strcmp(id->_class->__anon1.__anon1.name, "property"))
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, id->string, (((void *)0)), (((void *)0)), (((void *)0)));
}
if((!prop || useMemberForNonConst) && !member)
{
method = useMemberForNonConst ? (((void *)0)) : __ecereNameSpace__ecere__com__eClass_FindMethod(_class, id->string, (((void *)0)));
if(!method)
{
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, id->string, privateModule);
useMemberForNonConst |= prop && exp->destType && ((exp->destType->kind == 8 && !exp->destType->constant) || ((exp->destType->kind == 13 || exp->destType->kind == 12) && exp->destType->__anon1.type && !exp->destType->__anon1.type->constant)) && !strncmp(prop->dataTypeString, "const ", 6);
if(useMemberForNonConst || !id->_class || !id->_class->__anon1.__anon1.name || strcmp(id->_class->__anon1.__anon1.name, "property"))
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, id->string, privateModule, (((void *)0)), (((void *)0)));
}
}
if(member && prop)
{
if(useMemberForNonConst || (member->_class != prop->_class && !id->_class && __ecereNameSpace__ecere__com__eClass_IsDerived(member->_class, prop->_class)))
prop = (((void *)0));
else
member = (((void *)0));
}
}
}
if(!prop && !member && !method)
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, id->string, privateModule);
if(!prop && !member && !method)
{
if(typeKind == 19)
{
classProp = __ecereNameSpace__ecere__com__eClass_FindClassProperty(type->__anon1._class->__anon1.registered, exp->__anon1.member.member->string);
if(classProp)
{
exp->__anon1.member.memberType = 5;
exp->expType = ProcessTypeString(classProp->dataTypeString, 0);
}
else
{
char structName[1024];
struct Identifier * id = exp->__anon1.member.member;
struct Expression * classExp = exp->__anon1.member.exp;

type->refCount++;
FreeType(classExp->expType);
classExp->expType = ProcessTypeString("ecere::com::Class", 0);
strcpy(structName, "__ecereClassData_");
FullClassNameCat(structName, type->__anon1._class->string, 0);
exp->type = 9;
exp->__anon1.member.member = id;
exp->__anon1.member.exp = MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(structName), (((void *)0)))), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpBrackets(MkListOne(MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpMember(classExp, MkIdentifier("data"))), '+', MkExpMember(MkExpClass(MkListOne(MkSpecifierName(type->__anon1._class->string)), (((void *)0))), MkIdentifier("offsetClass"))))))));
FreeType(type);
ProcessExpressionType(exp);
return ;
}
}
else
{
struct Symbol * classSym = FindClass(id->string);

if(classSym)
{
struct __ecereNameSpace__ecere__com__Class * convertClass = classSym->__anon1.registered;

if(convertClass)
revConvert = __ecereNameSpace__ecere__com__eClass_FindProperty(convertClass, _class->fullName, privateModule);
}
}
}
if(exp->__anon1.member.exp->destType)
FreeType(exp->__anon1.member.exp->destType);
{
if(method && !method->_class->symbol)
method->_class->symbol = FindClass(method->_class->fullName);
if(prop && !prop->_class->symbol)
prop->_class->symbol = FindClass(prop->_class->fullName);
exp->__anon1.member.exp->destType = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1->kind = 8, __ecereInstance1->__anon1._class = prop ? prop->_class->symbol : method ? method->_class->symbol : _class->symbol, __ecereInstance1->thisClassFrom = type ? type->thisClassFrom : (((void *)0)), __ecereInstance1;
});
}
if(prop)
{
exp->__anon1.member.memberType = 1;
if(!prop->dataType)
ProcessPropertyType(prop);
exp->expType = prop->dataType;
if(!strcmp(_class->base->fullName, "eda::Row") && !exp->expType->constant && !exp->destType)
{
struct Type * type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

CopyTypeInto(type, exp->expType);
type->refCount = 1;
type->constant = 1;
exp->expType = type;
}
else if(prop->dataType)
prop->dataType->refCount++;
}
else if(member)
{
if(exp->__anon1.member.exp->expType->classObjectType == 2 && !strcmp(exp->__anon1.member.member->string, "_class"))
{
FreeExpContents(exp);
exp->type = 0;
exp->__anon1.__anon1.identifier = MkIdentifier("class");
ProcessExpressionType(exp);
return ;
}
exp->__anon1.member.memberType = 3;
DeclareStruct(curExternal, _class->fullName, 0, 1);
if(member->_class != _class)
DeclareStruct(curExternal, member->_class->fullName, 0, 1);
if(!member->dataType)
{
struct Context * context = SetupTemplatesContext(_class);

member->dataType = ProcessTypeString(member->dataTypeString, 0);
FinishTemplatesContext(context);
}
if(exp->__anon1.member.exp->expType->kind == 8 && exp->__anon1.member.exp->expType->__anon1._class && exp->__anon1.member.exp->expType->__anon1._class->__anon1.registered && exp->__anon1.member.exp->expType->__anon1._class->__anon1.registered->type == 2)
member->dataType->bitMemberSize = ((struct __ecereNameSpace__ecere__com__BitMember *)member)->size;
exp->expType = member->dataType;
if(member->dataType)
member->dataType->refCount++;
}
else if(revConvert)
{
exp->__anon1.member.memberType = 4;
exp->expType = MkClassType(revConvert->_class->fullName);
}
else if(method)
{
{
exp->__anon1.member.memberType = 2;
}
if(!method->dataType)
ProcessMethodType(method);
exp->expType = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1->kind = 16, __ecereInstance1->__anon1.__anon3.method = method, __ecereInstance1;
});
exp->expType->__anon1.__anon3.methodClass = (id && id->_class) ? _class : (((void *)0));
exp->expType->__anon1.__anon3.usedClass = _class;
}
else if(!classProp)
{
if(exp->__anon1.member.exp->expType->classObjectType == 2 && !strcmp(exp->__anon1.member.member->string, "_class"))
{
FreeExpContents(exp);
exp->type = 0;
exp->__anon1.__anon1.identifier = MkIdentifier("class");
FreeType(exp->expType);
exp->expType = MkClassType("ecere::com::Class");
return ;
}
yylloc = exp->__anon1.member.member->loc;
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "couldn't find member %s in class %s\n", (((void *)0))), id->string, _class->fullName);
if(inCompiler)
__ecereNameSpace__ecere__com__eClass_AddDataMember(_class, id->string, "int", 0, 0, 1);
}
if(_class && exp->expType)
{
struct __ecereNameSpace__ecere__com__Class * tClass;

tClass = type->__anon1._class && type->__anon1._class->__anon1.registered ? type->__anon1._class->__anon1.registered : _class;
while(tClass && !tClass->templateClass)
tClass = tClass->base;
if(tClass && exp->expType->kind == 20 && exp->expType->__anon1.templateParameter->type == 0)
{
int id = 0;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * curParam = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = tClass; sClass; sClass = sClass->base)
{
id = 0;
if(sClass->templateClass)
sClass = sClass->templateClass;
for(curParam = sClass->templateParams.first; curParam; curParam = curParam->next)
{
if(curParam->type == 0 && !strcmp(exp->expType->__anon1.templateParameter->identifier->string, curParam->name))
{
for(sClass = sClass->base; sClass; sClass = sClass->base)
id += sClass->templateParams.count;
break;
}
id++;
}
if(curParam)
break;
}
if(curParam && tClass->templateArgs[id].__anon1.__anon1.dataTypeString)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument arg = tClass->templateArgs[id];
struct Context * context = SetupTemplatesContext(tClass);
unsigned int constant = exp->expType->constant;
unsigned int passAsTemplate = 0;
struct __ecereNameSpace__ecere__com__Class * thisClassFrom = (((void *)0));
struct Type * t = exp->expType->__anon1.templateParameter->dataTypeString ? ProcessTypeString(exp->expType->__anon1.templateParameter->dataTypeString, 0) : (((void *)0));

if(t && t->kind == 8 && t->__anon1._class)
thisClassFrom = t->__anon1._class->__anon1.registered;
else if(exp->expType->thisClassFrom)
thisClassFrom = thisClass;
else
thisClassFrom = __ecereNameSpace__ecere__com__eSystem_FindClass(GetPrivateModule(), "class");
FreeType(t);
passAsTemplate = tClass->templateClass && (exp->expType->kind != 20 || (!exp->expType->__anon1.templateParameter || (!exp->expType->__anon1.templateParameter->dataTypeString && !exp->expType->__anon1.templateParameter->__anon1.dataType)));
FreeType(exp->expType);
exp->expType = ProcessTypeString(arg.__anon1.__anon1.dataTypeString, 0);
exp->expType->thisClassFrom = thisClassFrom;
if(exp->expType->kind == 8 && constant)
exp->expType->constant = 1;
else if(exp->expType->kind == 13)
{
struct Type * t = exp->expType->__anon1.type;

while(t->kind == 13)
t = t->__anon1.type;
if(constant)
t->constant = constant;
}
if(exp->expType)
{
if(exp->expType->kind == 21)
{
FreeType(exp->expType);
exp->expType = ReplaceThisClassType(_class);
}
if(passAsTemplate)
exp->expType->passAsTemplate = 1;
if(!exp->destType)
{
exp->destType = ProcessTypeString(arg.__anon1.__anon1.dataTypeString, 0);
if(exp->destType->kind == 8 && constant)
exp->destType->constant = 1;
else if(exp->destType->kind == 13)
{
struct Type * t = exp->destType->__anon1.type;

while(t->kind == 13)
t = t->__anon1.type;
if(constant)
t->constant = constant;
}
if(exp->destType->kind == 21)
{
FreeType(exp->destType);
exp->destType = ReplaceThisClassType(_class);
}
}
}
FinishTemplatesContext(context);
}
}
else if(tClass && exp->expType->kind == 13 && exp->expType->__anon1.type && exp->expType->__anon1.type->kind == 20 && exp->expType->__anon1.type->__anon1.templateParameter->type == 0)
{
int id = 0;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * curParam = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = tClass; sClass; sClass = sClass->base)
{
id = 0;
if(sClass->templateClass)
sClass = sClass->templateClass;
for(curParam = sClass->templateParams.first; curParam; curParam = curParam->next)
{
if(curParam->type == 0 && !strcmp(exp->expType->__anon1.type->__anon1.templateParameter->identifier->string, curParam->name))
{
for(sClass = sClass->base; sClass; sClass = sClass->base)
id += sClass->templateParams.count;
break;
}
id++;
}
if(curParam)
break;
}
if(curParam)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument arg = tClass->templateArgs[id];
struct Context * context = SetupTemplatesContext(tClass);
struct Type * basicType;

basicType = ProcessTypeString(arg.__anon1.__anon1.dataTypeString, 0);
if(basicType)
{
if(basicType->kind == 21)
{
FreeType(basicType);
basicType = ReplaceThisClassType(_class);
}
FreeType(exp->expType);
exp->expType = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1->kind = 13, __ecereInstance1->__anon1.type = basicType, __ecereInstance1;
});
if(!exp->destType)
{
exp->destType = exp->expType;
exp->destType->refCount++;
}
{
struct Expression * newExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;

decl = SpecDeclFromString(arg.__anon1.__anon1.dataTypeString, specs, (((void *)0)));
*newExp = *exp;
if(exp->destType)
exp->destType->refCount++;
if(exp->expType)
exp->expType->refCount++;
exp->type = 5;
exp->__anon1.list = MkListOne(MkExpCast(MkTypeName(specs, MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), decl)), newExp));
((struct Expression *)(*exp->__anon1.list).first)->expType = exp->expType;
if(exp->expType)
exp->expType->refCount++;
}
}
FinishTemplatesContext(context);
}
}
else if(tClass && exp->expType->kind == 8 && exp->expType->__anon1._class && strchr(exp->expType->__anon1._class->string, '<'))
{
struct __ecereNameSpace__ecere__com__Class * expClass = exp->expType->__anon1._class->__anon1.registered;

if(expClass)
{
struct __ecereNameSpace__ecere__com__Class * cClass = (((void *)0));
int p = 0;
int paramCount = 0;
int lastParam = -1;
char templateString[1024];
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;

sprintf(templateString, "%s<", expClass->templateClass->fullName);
while(cClass != expClass)
{
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = expClass; sClass && sClass->base != cClass; sClass = sClass->base)
;
cClass = sClass;
for(param = cClass->templateParams.first; param; param = param->next)
{
struct __ecereNameSpace__ecere__com__Class * cClassCur = (((void *)0));
int cp = 0;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * paramCur = (((void *)0));
struct __ecereNameSpace__ecere__com__ClassTemplateArgument arg;

while(cClassCur != tClass && !paramCur)
{
struct __ecereNameSpace__ecere__com__Class * sClassCur;

for(sClassCur = tClass; sClassCur && sClassCur->base != cClassCur; sClassCur = sClassCur->base)
;
cClassCur = sClassCur;
for(paramCur = cClassCur->templateParams.first; paramCur; paramCur = paramCur->next)
{
if(!strcmp(paramCur->name, param->name))
{
break;
}
cp++;
}
}
if(paramCur && paramCur->type == 0)
arg = tClass->templateArgs[cp];
else
arg = expClass->templateArgs[p];
{
char argument[256];

argument[0] = '\0';
switch(param->type)
{
case 2:
{
char expString[1024];
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl = SpecDeclFromString(param->__anon1.dataTypeString, specs, (((void *)0)));
struct Expression * exp;
char * string = PrintHexUInt64(arg.__anon1.expression.__anon1.ui64);

exp = MkExpCast(MkTypeName(specs, decl), MkExpConstant(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
ProcessExpressionType(exp);
ComputeExpression(exp);
expString[0] = '\0';
PrintExpression(exp, expString);
strcat(argument, expString);
FreeExpression(exp);
break;
}
case 1:
{
strcat(argument, arg.__anon1.__anon2.__anon1.member->name);
break;
}
case 0:
{
if(arg.__anon1.__anon1.dataTypeString && (!param->defaultArg.__anon1.__anon1.dataTypeString || strcmp(arg.__anon1.__anon1.dataTypeString, param->defaultArg.__anon1.__anon1.dataTypeString)))
strcat(argument, arg.__anon1.__anon1.dataTypeString);
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
FreeType(exp->expType);
{
struct Context * context = SetupTemplatesContext(tClass);

exp->expType = ProcessTypeString(templateString, 0);
FinishTemplatesContext(context);
}
}
}
}
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "undefined class %s\n", (((void *)0))), (id && (!id->_class || id->_class->__anon1.__anon1.name)) ? (id->classSym ? id->classSym->string : (type->__anon1._class ? type->__anon1._class->string : (((void *)0)))) : "(null)");
}
else if(type && (type->kind == 9 || type->kind == 10))
{
struct Type * memberType = exp->__anon1.member.member ? FindMember(type, exp->__anon1.member.member->string) : (((void *)0));

if(memberType)
{
exp->expType = memberType;
if(memberType)
memberType->refCount++;
}
}
else
{
char expString[10240];

expString[0] = '\0';
if(inCompiler)
{
PrintExpression(exp, expString);
__ecereNameSpace__ecere__sys__ChangeCh(expString, '\n', ' ');
}
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "member operator on non-structure type expression %s\n", (((void *)0))), expString);
}
if(exp->expType && exp->expType->kind == 21 && (!exp->destType || exp->destType->kind != 21))
{
if(type && (type->kind == 8 || type->kind == 19 || type->kind == 3 || type->kind == 15))
{
struct Identifier * id = exp->__anon1.member.member;
struct __ecereNameSpace__ecere__com__Class * _class = (id && (!id->_class || id->_class->__anon1.__anon1.name)) ? (id->classSym ? id->classSym->__anon1.registered : (type->__anon1._class ? type->__anon1._class->__anon1.registered : (((void *)0)))) : (((void *)0));

if(_class)
{
FreeType(exp->expType);
exp->expType = ReplaceThisClassType(_class);
}
}
}
yylloc = oldyylloc;
break;
}
case 9:
{
struct Type * destType = exp->destType;

if(exp->__anon1.member.member && exp->__anon1.member.member->_class && exp->__anon1.member.member->_class->__anon1.__anon1.name)
{
exp->__anon1.member.member->classSym = exp->__anon1.member.member->_class->__anon1.__anon1.symbol;
}
exp->__anon1.member.exp = MkExpBrackets(MkListOne(MkExpOp((((void *)0)), '*', exp->__anon1.member.exp)));
exp->type = 8;
if(destType)
destType->count++;
ProcessExpressionType(exp);
if(destType)
destType->count--;
break;
}
case 15:
{
struct Symbol * classSym = exp->__anon1._class->__anon1.__anon1.symbol;

if(classSym && classSym->__anon1.registered)
{
if(classSym->__anon1.registered->type == 5 || (classSym->__anon1.registered->fixed && classSym->__anon1.registered->structSize))
{
char name[1024];
struct __ecereNameSpace__ecere__com__Class * b = classSym->__anon1.registered;

name[0] = '\0';
DeclareStruct(curExternal, classSym->string, 0, 1);
FreeSpecifier(exp->__anon1._class);
FullClassNameCat(name, classSym->string, 0);
if(b->offset == 0)
{
exp->type = 10;
exp->__anon1.typeName = MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(name), (((void *)0)))), (((void *)0)));
}
else
{
struct Expression * e;

exp->type = 4;
if(b->structSize == b->offset)
exp->__anon1.op.exp1 = MkExpConstant("0");
else
exp->__anon1.op.exp1 = MkExpTypeSize(MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(name), (((void *)0)))), (((void *)0))));
exp->__anon1.op.op = '+';
e = exp;
while(b->offset != 0)
{
struct Symbol * sym;
struct Expression * typeSize;

b = b->base;
sym = FindClass(b->fullName);
name[0] = '\0';
DeclareStruct(curExternal, sym->string, 0, 1);
FullClassNameCat(name, sym->string, 0);
if(b->structSize == b->offset)
typeSize = MkExpConstant("0");
else
typeSize = MkExpTypeSize(MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(name), (((void *)0)))), (((void *)0))));
e->__anon1.op.exp2 = b->offset ? MkExpOp(typeSize, '+', (((void *)0))) : typeSize;
e = e->__anon1.op.exp2;
}
}
}
else
{
if(classSym->__anon1.registered->fixed && !classSym->__anon1.registered->structSize)
{
FreeSpecifier(exp->__anon1._class);
exp->__anon1.__anon1.constant = PrintUInt(classSym->__anon1.registered->templateClass ? classSym->__anon1.registered->templateClass->structSize : classSym->__anon1.registered->structSize);
exp->type = 2;
}
else
{
char className[1024];

strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 1);
DeclareClass(curExternal, classSym, className);
FreeExpContents(exp);
exp->type = 9;
exp->__anon1.member.exp = MkExpIdentifier(MkIdentifier(className));
exp->__anon1.member.member = MkIdentifier("structSize");
}
}
}
exp->expType = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1->kind = 23, __ecereInstance1;
});
break;
}
case 10:
{
struct Type * type = ProcessType(exp->__anon1.typeName->qualifiers, exp->__anon1.typeName->declarator);

exp->expType = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1->kind = 23, __ecereInstance1;
});
exp->isConstant = 1;
DeclareType(curExternal, type, 1, 0);
FreeType(type);
break;
}
case 36:
{
exp->expType = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1->kind = 23, __ecereInstance1;
});
exp->isConstant = 1;
break;
}
case 11:
{
struct Type * type = ProcessType(exp->__anon1.cast.typeName->qualifiers, exp->__anon1.cast.typeName->declarator);

type->count = 1;
FreeType(exp->__anon1.cast.exp->destType);
exp->__anon1.cast.exp->destType = type;
type->refCount++;
type->casted = 1;
ProcessExpressionType(exp->__anon1.cast.exp);
type->casted = 0;
type->count = 0;
exp->expType = type;
if(!exp->__anon1.cast.exp->needCast && !NeedCast(exp->__anon1.cast.exp->expType, type))
{
void * prev = exp->prev, * next = exp->next;
struct Type * expType = exp->__anon1.cast.exp->destType;
struct Expression * castExp = exp->__anon1.cast.exp;
struct Type * destType = exp->destType;

if(expType)
expType->refCount++;
FreeType(exp->expType);
FreeTypeName(exp->__anon1.cast.typeName);
*exp = *castExp;
FreeType(exp->expType);
FreeType(exp->destType);
exp->expType = expType;
exp->destType = destType;
((castExp ? __extension__ ({
void * __ecerePtrToDelete = (castExp);

__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), castExp = 0);
exp->prev = prev;
exp->next = next;
}
else
{
exp->isConstant = exp->__anon1.cast.exp->isConstant;
}
break;
}
case 33:
{
struct Type * type = ProcessType(exp->__anon1.initializer.typeName->qualifiers, exp->__anon1.initializer.typeName->declarator);

exp->expType = type;
break;
}
case 34:
{
struct Type * type = ProcessType(exp->__anon1.vaArg.typeName->qualifiers, exp->__anon1.vaArg.typeName->declarator);

ProcessExpressionType(exp->__anon1.vaArg.exp);
exp->expType = type;
break;
}
case 12:
{
struct Expression * e;
struct Type * t = exp->destType;

if(t && !exp->destType->casted)
{
t = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
CopyTypeInto(t, exp->destType);
t->count = 0;
}
else if(t)
t->refCount++;
exp->isConstant = 1;
FreeType(exp->__anon1.cond.cond->destType);
exp->__anon1.cond.cond->destType = MkClassType("bool");
exp->__anon1.cond.cond->destType->truth = 1;
ProcessExpressionType(exp->__anon1.cond.cond);
if(!exp->__anon1.cond.cond->isConstant)
exp->isConstant = 0;
for(e = (*exp->__anon1.cond.exp).first; e; e = e->next)
{
if(!e->next)
{
FreeType(e->destType);
e->destType = t;
if(e->destType)
e->destType->refCount++;
}
ProcessExpressionType(e);
if(!e->next)
{
exp->expType = e->expType;
if(e->expType)
e->expType->refCount++;
}
if(!e->isConstant)
exp->isConstant = 0;
}
FreeType(exp->__anon1.cond.elseExp->destType);
exp->__anon1.cond.elseExp->destType = t ? t : exp->expType;
if(exp->__anon1.cond.elseExp->destType)
exp->__anon1.cond.elseExp->destType->refCount++;
ProcessExpressionType(exp->__anon1.cond.elseExp);
if(!exp->__anon1.cond.elseExp->isConstant)
exp->isConstant = 0;
FreeType(t);
break;
}
case 23:
{
if(exp->__anon1.compound && exp->__anon1.compound->__anon1.compound.statements && (*exp->__anon1.compound->__anon1.compound.statements).last)
{
struct Statement * last = (*exp->__anon1.compound->__anon1.compound.statements).last;

if(last->type == 3 && last->__anon1.expressions && (*last->__anon1.expressions).last)
{
((struct Expression *)(*last->__anon1.expressions).last)->destType = exp->destType;
if(exp->destType)
exp->destType->refCount++;
}
ProcessStatement(exp->__anon1.compound);
exp->expType = (last->__anon1.expressions && (*last->__anon1.expressions).last) ? ((struct Expression *)(*last->__anon1.expressions).last)->expType : (((void *)0));
if(exp->expType)
exp->expType->refCount++;
}
break;
}
case 24:
{
struct Specifier * spec = (*exp->__anon1._classExp.specifiers).first;

if(spec && spec->type == 1)
{
exp->expType = MkClassType(spec->__anon1.__anon1.name);
exp->expType->kind = 19;
exp->byReference = 1;
}
else
{
exp->expType = MkClassType("ecere::com::Class");
exp->byReference = 1;
}
break;
}
case 25:
{
struct __ecereNameSpace__ecere__com__Class * _class = thisClass ? thisClass : currentClass;

if(_class)
{
struct Identifier * id = exp->__anon1.classData.id;
char structName[1024];
struct Expression * classExp;

strcpy(structName, "__ecereClassData_");
FullClassNameCat(structName, _class->fullName, 0);
exp->type = 9;
exp->__anon1.member.member = id;
if(curCompound && FindSymbol("this", curContext, curCompound->__anon1.compound.context, 0, 0))
classExp = MkExpMember(MkExpIdentifier(MkIdentifier("this")), MkIdentifier("_class"));
else
classExp = MkExpIdentifier(MkIdentifier("class"));
exp->__anon1.member.exp = MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(structName), (((void *)0)))), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpBrackets(MkListOne(MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpMember(classExp, MkIdentifier("data"))), '+', MkExpMember(MkExpClass(MkListOne(MkSpecifierName(_class->fullName)), (((void *)0))), MkIdentifier("offsetClass"))))))));
ProcessExpressionType(exp);
return ;
}
break;
}
case 35:
{
struct Type * type = (((void *)0));
const char * typeString = (((void *)0));
char typeStringBuf[1024];

if(exp->destType && exp->destType->kind == 8 && exp->destType->__anon1._class && exp->destType->__anon1._class->__anon1.registered && exp->destType->__anon1._class->__anon1.registered != containerClass && __ecereNameSpace__ecere__com__eClass_IsDerived(exp->destType->__anon1._class->__anon1.registered, containerClass))
{
struct __ecereNameSpace__ecere__com__Class * templateClass = exp->destType->__anon1._class->__anon1.registered;

typeString = templateClass->templateArgs[2].__anon1.__anon1.dataTypeString;
}
else if(exp->__anon1.list)
{
struct Expression * e;

for(e = (*exp->__anon1.list).first; e; e = e->next)
{
ProcessExpressionType(e);
if(e->expType)
{
if(!type)
{
type = e->expType;
type->refCount++;
}
else
{
if(!MatchTypeExpression(e, type, (((void *)0)), 0, 1))
{
FreeType(type);
type = e->expType;
e->expType = (((void *)0));
e = (*exp->__anon1.list).first;
ProcessExpressionType(e);
if(e->expType)
{
if(!MatchTypeExpression(e, type, (((void *)0)), 0, 1))
{
FreeType(e->expType);
e->expType = (((void *)0));
FreeType(type);
type = (((void *)0));
break;
}
}
}
}
if(e->expType)
{
FreeType(e->expType);
e->expType = (((void *)0));
}
}
}
if(type)
{
typeStringBuf[0] = '\0';
PrintTypeNoConst(type, typeStringBuf, 0, 1);
typeString = typeStringBuf;
FreeType(type);
type = (((void *)0));
}
}
if(typeString)
{
char templateString[1024];
struct __ecereNameSpace__ecere__sys__OldList * initializers = MkList();
struct __ecereNameSpace__ecere__sys__OldList * structInitializers = MkList();
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Expression * expExt;
struct Declarator * decl = SpecDeclFromString(typeString, specs, (((void *)0)));

sprintf(templateString, "Container<%s>", typeString);
if(exp->__anon1.list)
{
struct Expression * e;

type = ProcessTypeString(typeString, 0);
while((e = (*exp->__anon1.list).first))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*exp->__anon1.list), e);
e->destType = type;
type->refCount++;
ProcessExpressionType(e);
ListAdd(initializers, MkInitializerAssignment(e));
}
FreeType(type);
(__ecereNameSpace__ecere__com__eSystem_Delete(exp->__anon1.list), exp->__anon1.list = 0);
}
DeclareStruct(curExternal, "ecere::com::BuiltInContainer", 0, 1);
ListAdd(structInitializers, MkInitializerAssignment(MkExpMember(MkExpClass(MkListOne(MkSpecifierName("BuiltInContainer")), (((void *)0))), MkIdentifier("_vTbl"))));
ProcessExpressionType(((struct Initializer *)(*structInitializers).last)->__anon1.exp);
ListAdd(structInitializers, MkInitializerAssignment(MkExpClass(MkListOne(MkSpecifierName("BuiltInContainer")), (((void *)0)))));
ProcessExpressionType(((struct Initializer *)(*structInitializers).last)->__anon1.exp);
ListAdd(structInitializers, MkInitializerAssignment(MkExpConstant("0")));
ProcessExpressionType(((struct Initializer *)(*structInitializers).last)->__anon1.exp);
ListAdd(structInitializers, MkInitializerAssignment(MkExpExtensionInitializer(MkTypeName(specs, MkDeclaratorArray(decl, (((void *)0)))), MkInitializerList(initializers))));
ProcessExpressionType(((struct Initializer *)(*structInitializers).last)->__anon1.exp);
ListAdd(structInitializers, MkInitializerAssignment(__extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 2, __ecereInstance1->__anon1.__anon1.constant = __ecereNameSpace__ecere__com__PrintString(__ecereClass_int, (void *)&(*initializers).count, (void *)0), __ecereInstance1;
})));
ProcessExpressionType(((struct Initializer *)(*structInitializers).last)->__anon1.exp);
ListAdd(structInitializers, MkInitializerAssignment(MkExpClass(CopyList(specs, (void *)(CopySpecifier)), CopyDeclarator(decl))));
ProcessExpressionType(((struct Initializer *)(*structInitializers).last)->__anon1.exp);
exp->expType = ProcessTypeString(templateString, 0);
exp->type = 5;
exp->__anon1.list = MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName(templateString)), (((void *)0))), MkExpOp((((void *)0)), '&', expExt = MkExpExtensionInitializer(MkTypeName(MkListOne(MkSpecifierName("BuiltInContainer")), (((void *)0))), MkInitializerList(structInitializers)))));
ProcessExpressionType(expExt);
}
else
{
exp->expType = ProcessTypeString("Container", 0);
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Couldn't determine type of array elements\n", (((void *)0))));
}
break;
}
}
if(exp->expType && exp->expType->kind == 21 && thisClass && (!exp->destType || exp->destType->kind != 21))
{
FreeType(exp->expType);
exp->expType = ReplaceThisClassType(thisClass);
}
if(exp->expType && (exp->expType->kind == 9 || exp->expType->kind == 10 || exp->expType->kind == 15) && !exp->expType->__anon1.__anon1.members.first && exp->expType->__anon1.__anon1.enumName)
{
struct Symbol * symbol = FindSymbol(exp->expType->__anon1.__anon1.enumName, curContext, globalContext, 1, 0);

if(symbol)
{
if(exp->expType->kind != 15)
{
struct Type * member;
char * enumName = __ecereNameSpace__ecere__sys__CopyString(exp->expType->__anon1.__anon1.enumName);

FreeType(exp->expType);
exp->expType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
exp->expType->kind = symbol->type->kind;
exp->expType->refCount++;
exp->expType->__anon1.__anon1.enumName = enumName;
exp->expType->__anon1.__anon1.members = symbol->type->__anon1.__anon1.members;
for(member = symbol->type->__anon1.__anon1.members.first; member; member = member->next)
member->refCount++;
}
else
{
struct __ecereNameSpace__ecere__sys__NamedLink64 * member;

for(member = symbol->type->__anon1.__anon1.members.first; member; member = member->next)
{
struct __ecereNameSpace__ecere__sys__NamedLink64 * value = (value = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__sys__NamedLink64)), value->name = __ecereNameSpace__ecere__sys__CopyString(member->name), value);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&exp->expType->__anon1.__anon1.members, value);
}
}
}
}
if(!notByReference && exp->expType && exp->expType->kind == 8 && exp->expType->__anon1._class && exp->expType->__anon1._class->__anon1.registered && exp->expType->__anon1._class->__anon1.registered->type == 5 && (!exp->destType || (exp->destType->kind != 3 && exp->destType->kind != 4 && exp->destType->kind != 22 && exp->destType->kind != 23 && exp->destType->kind != 5 && exp->destType->kind != 2 && exp->destType->kind != 1 && exp->destType->kind != 24)))
{
exp->byReference = 1;
}
yylloc = exp->loc;
if(exp->destType && (exp->destType->kind == 18))
;
else if(exp->destType && !exp->destType->keepCast)
{
if(!exp->needTemplateCast && exp->expType && (exp->expType->kind == 20 || exp->expType->passAsTemplate))
exp->needTemplateCast = 1;
if(exp->destType->kind == 0)
;
else if(!CheckExpressionType(exp, exp->destType, 0, !exp->destType->casted))
{
unsigned int invalidCast = 0;

if(inCompiler && exp->destType->count && exp->expType)
{
struct __ecereNameSpace__ecere__com__Class * c1 = (exp->expType->kind == 8 && exp->expType->__anon1._class) ? exp->expType->__anon1._class->__anon1.registered : (((void *)0));
struct __ecereNameSpace__ecere__com__Class * c2 = (exp->destType->kind == 8 && exp->destType->__anon1._class) ? exp->destType->__anon1._class->__anon1.registered : (((void *)0));

if(c1 && c1->type != 1)
c1 = (((void *)0));
if(c2 && c2->type != 1)
c2 = (((void *)0));
if((c1 && !exp->expType->byReference && !c2 && !__ecereProp_Type_Get_isPointerType(exp->destType)) || (c2 && !exp->destType->byReference && !c1 && !__ecereProp_Type_Get_isPointerType(exp->expType)))
invalidCast = 1;
}
if(!exp->destType->count || unresolved || invalidCast)
{
if(!exp->expType)
{
yylloc = exp->loc;
if(exp->destType->kind != 14)
{
char type2[1024];

type2[0] = '\0';
if(inCompiler)
{
char expString[10240];

expString[0] = '\0';
PrintType(exp->destType, type2, 0, 1);
if(inCompiler)
{
PrintExpression(exp, expString);
__ecereNameSpace__ecere__sys__ChangeCh(expString, '\n', ' ');
}
if(unresolved)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "unresolved identifier %s; expected %s\n", (((void *)0))), expString, type2);
else if(exp->type != 16)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "couldn't determine type of %s; expected %s\n", (((void *)0))), expString, type2);
}
}
else
{
char expString[10240];

expString[0] = '\0';
if(inCompiler)
{
PrintExpression(exp, expString);
__ecereNameSpace__ecere__sys__ChangeCh(expString, '\n', ' ');
}
if(unresolved)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "unresolved identifier %s\n", (((void *)0))), expString);
else if(exp->type != 16)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "couldn't determine type of %s\n", (((void *)0))), expString);
}
}
else
{
char type1[1024];
char type2[1024];

type1[0] = '\0';
type2[0] = '\0';
if(inCompiler)
{
PrintType(exp->expType, type1, 0, 1);
PrintType(exp->destType, type2, 0, 1);
}
if(exp->destType->truth && exp->destType->__anon1._class && exp->destType->__anon1._class->__anon1.registered && !strcmp(exp->destType->__anon1._class->__anon1.registered->name, "bool") && exp->expType->kind != 0 && exp->expType->kind != 9 && exp->expType->kind != 10 && (exp->expType->kind != 8 || exp->expType->classObjectType || (exp->expType->__anon1._class && exp->expType->__anon1._class->__anon1.registered && exp->expType->__anon1._class->__anon1.registered->type != 1)))
;
else
{
struct Expression * nbExp = GetNonBracketsExp(exp);
unsigned int skipWarning = 0;
int kind = exp->destType->kind;

if(nbExp->type == 12 && nbExp->destType && !nbExp->destType->casted && nbExp->destType->kind == exp->destType->kind)
skipWarning = 1;
if((kind == 1 || kind == 2) && exp->destType->isSigned == exp->expType->signedBeforePromotion && nbExp->type == 4 && nbExp->__anon1.op.exp1 && nbExp->__anon1.op.exp2)
{
int op = nbExp->__anon1.op.op;
struct Expression * nbExp1, * nbExp2;
int from;

switch(op)
{
case '%':
case '/':
nbExp1 = GetNonBracketsExp(nbExp->__anon1.op.exp1);
from = nbExp1->expType->promotedFrom;
if(from == 1 || (kind == 2 && from == 2))
skipWarning = 1;
break;
case LEFT_OP:
case RIGHT_OP:
nbExp1 = GetNonBracketsExp(nbExp->__anon1.op.exp1);
nbExp2 = GetNonBracketsExp(nbExp->__anon1.op.exp2);
from = nbExp1->expType->promotedFrom;
if(op == RIGHT_OP && (from == 1 || (kind == 2 && from == 2)))
skipWarning = 1;
else if(nbExp2->isConstant && nbExp2->type == 2 && (nbExp->__anon1.op.op == RIGHT_OP || nbExp1->expType->bitMemberSize))
{
int n = strtol(nbExp2->__anon1.__anon1.constant, (((void *)0)), 0);
int s = from == 1 ? 8 : 16;

if(nbExp1->expType->bitMemberSize && nbExp1->expType->bitMemberSize < s)
s = nbExp1->expType->bitMemberSize;
if(nbExp->__anon1.op.op == RIGHT_OP)
s -= n;
else
s += n;
if(s <= (kind == 1 ? 8 : 16))
skipWarning = 1;
}
break;
case '-':
if(!exp->destType->isSigned)
{
nbExp1 = GetNonBracketsExp(nbExp->__anon1.op.exp1);
nbExp2 = GetNonBracketsExp(nbExp->__anon1.op.exp2);
from = nbExp2->expType->promotedFrom;
if((from == 1 || from == 2) && nbExp1->isConstant && nbExp1->type == 2)
{
int n = strtol(nbExp1->__anon1.__anon1.constant, (((void *)0)), 0);

if(n == (from == 1 ? 255 : 65535))
skipWarning = 1;
}
}
break;
case '|':
{
int kind1, kind2;

nbExp1 = GetNonBracketsExp(nbExp->__anon1.op.exp1);
nbExp2 = GetNonBracketsExp(nbExp->__anon1.op.exp2);
kind1 = nbExp1->expType->promotedFrom ? nbExp1->expType->promotedFrom : nbExp1->expType->kind;
kind2 = nbExp2->expType->promotedFrom ? nbExp2->expType->promotedFrom : nbExp2->expType->kind;
if(((kind1 == 1 || (kind1 == 2 && kind == 2)) || MatchTypeExpression(nbExp1, exp->destType, (((void *)0)), 0, 0)) && ((kind2 == 1 || (kind2 == 2 && kind == 2)) || MatchTypeExpression(nbExp2, exp->destType, (((void *)0)), 0, 0)))
skipWarning = 1;
break;
}
case '&':
{
int kind1, kind2;

nbExp1 = GetNonBracketsExp(nbExp->__anon1.op.exp1);
nbExp2 = GetNonBracketsExp(nbExp->__anon1.op.exp2);
kind1 = nbExp1->expType->promotedFrom ? nbExp1->expType->promotedFrom : nbExp1->expType->kind;
kind2 = nbExp2->expType->promotedFrom ? nbExp2->expType->promotedFrom : nbExp2->expType->kind;
if(((kind1 == 1 || (kind1 == 2 && kind == 2)) || MatchTypeExpression(nbExp1, exp->destType, (((void *)0)), 0, 0)) || ((kind2 == 1 || (kind2 == 2 && kind == 2)) || MatchTypeExpression(nbExp2, exp->destType, (((void *)0)), 0, 0)))
skipWarning = 1;
break;
}
}
}
if(!skipWarning)
{
char expString[10240];

expString[0] = '\0';
if(inCompiler)
{
PrintExpression(exp, expString);
__ecereNameSpace__ecere__sys__ChangeCh(expString, '\n', ' ');
}
if(!sourceFile || (!strstr(sourceFile, "src\\lexer.ec") && !strstr(sourceFile, "src/lexer.ec") && !strstr(sourceFile, "src\\grammar.ec") && !strstr(sourceFile, "src/grammar.ec") && !strstr(sourceFile, "src\\type.ec") && !strstr(sourceFile, "src/type.ec") && !strstr(sourceFile, "src\\expression.ec") && !strstr(sourceFile, "src/expression.ec")))
{
if(invalidCast)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "incompatible expression %s (%s); expected %s\n", (((void *)0))), expString, type1, type2);
else
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "incompatible expression %s (%s); expected %s\n", (((void *)0))), expString, type1, type2);
}
}
if(!inCompiler)
{
FreeType(exp->expType);
exp->destType->refCount++;
exp->expType = exp->destType;
}
}
}
}
}
else if(exp->destType && exp->destType->kind == 13 && exp->destType->__anon1.type && exp->destType->__anon1.type->kind == 11 && exp->expType && (exp->expType->kind == 11 || exp->expType->kind == 16))
{
struct Expression * nbExp = GetNonBracketsExp(exp);

if(nbExp->type != 11 || !IsVoidPtrCast(nbExp->__anon1.cast.typeName))
{
struct Expression * e = MoveExpContents(exp);

exp->__anon1.cast.exp = MkExpBrackets(MkListOne(e));
exp->type = 11;
exp->__anon1.cast.exp->destType = exp->destType;
if(exp->destType)
exp->destType->refCount++;
exp->__anon1.cast.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0))));
}
}
}
else if(unresolved)
{
if(exp->__anon1.__anon1.identifier->_class && exp->__anon1.__anon1.identifier->_class->__anon1.__anon1.name)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "unresolved identifier %s::%s\n", (((void *)0))), exp->__anon1.__anon1.identifier->_class->__anon1.__anon1.name, exp->__anon1.__anon1.identifier->string);
else if(exp->__anon1.__anon1.identifier->string && exp->__anon1.__anon1.identifier->string[0])
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "unresolved identifier %s\n", (((void *)0))), exp->__anon1.__anon1.identifier->string);
}
else if(!exp->expType && exp->type != 16)
{
char expString[10240];

expString[0] = '\0';
if(inCompiler)
{
PrintExpression(exp, expString);
__ecereNameSpace__ecere__sys__ChangeCh(expString, '\n', ' ');
}
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "couldn't determine type of %s\n", (((void *)0))), expString);
}
if(inCompiler)
ApplyAnyObjectLogic(exp);
if(!notByReference && exp->expType && exp->expType->kind == 8 && exp->expType->__anon1._class && exp->expType->__anon1._class->__anon1.registered && exp->expType->__anon1._class->__anon1.registered->type == 5 && (!exp->destType || (exp->destType->kind != 3 && exp->destType->kind != 4 && exp->destType->kind != 22 && exp->destType->kind != 23 && exp->destType->kind != 5 && exp->destType->kind != 2 && exp->destType->kind != 1 && exp->destType->kind != 24)))
{
exp->byReference = 1;
}
yylloc = oldyylloc;
}

static void ProcessFunction(struct FunctionDefinition * function)
{
struct Identifier * id = GetDeclId(function->declarator);
struct Symbol * symbol = function->declarator ? function->declarator->symbol : (((void *)0));
struct Type * type = symbol ? symbol->type : (((void *)0));
struct __ecereNameSpace__ecere__com__Class * oldThisClass = thisClass;
struct Context * oldTopContext = topContext;

yylloc = function->loc;
if(type && type->__anon1.__anon2.thisClass)
{
struct Symbol * classSym = type->__anon1.__anon2.thisClass;
struct __ecereNameSpace__ecere__com__Class * _class = type->__anon1.__anon2.thisClass->__anon1.registered;
char className[1024];
char structName[1024];
struct Declarator * funcDecl;
struct Symbol * thisSymbol;
unsigned int typedObject = 0;

if(_class && !_class->base)
{
_class = currentClass;
if(_class && !_class->symbol)
_class->symbol = FindClass(_class->fullName);
classSym = _class ? _class->symbol : (((void *)0));
typedObject = 1;
}
thisClass = _class;
if(inCompiler && _class)
{
if(type->kind == 11)
{
if(symbol->type->__anon1.__anon2.params.count == 1 && ((struct Type *)symbol->type->__anon1.__anon2.params.first)->kind == 0)
{
struct Type * param = symbol->type->__anon1.__anon2.params.first;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&symbol->type->__anon1.__anon2.params, param);
FreeType(param);
}
if(type->classObjectType != 1)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(&symbol->type->__anon1.__anon2.params, (((void *)0)), MkClassType(_class->fullName));
symbol->type->__anon1.__anon2.staticMethod = 1;
symbol->type->__anon1.__anon2.thisClass = (((void *)0));
symbol->type->extraParam = 0;
}
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, _class->fullName, 1);
structName[0] = 0;
FullClassNameCat(structName, _class->fullName, 0);
funcDecl = GetFuncDecl(function->declarator);
if(funcDecl)
{
if(funcDecl->__anon1.function.parameters && (*funcDecl->__anon1.function.parameters).count == 1)
{
struct TypeName * param = (*funcDecl->__anon1.function.parameters).first;

if(param->qualifiers && (*param->qualifiers).count == 1 && ((struct Specifier *)(*param->qualifiers).first)->__anon1.specifier == VOID && !param->declarator)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*funcDecl->__anon1.function.parameters), param);
FreeTypeName(param);
}
}
if(!function->propertyNoThis)
{
struct TypeName * thisParam = (((void *)0));

if(type->classObjectType != 1)
{
thisParam = QMkClass(_class->fullName, MkDeclaratorIdentifier(MkIdentifier("this")));
if(!funcDecl->__anon1.function.parameters)
funcDecl->__anon1.function.parameters = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->__anon1.function.parameters), (((void *)0)), thisParam);
}
if(typedObject)
{
if(type->classObjectType != 1)
{
if(type->byReference || _class->type == 3 || _class->type == 1000 || _class->type == 4 || _class->type == 2)
thisParam->declarator = MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), thisParam->declarator);
}
thisParam = __extension__ ({
struct TypeName * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TypeName);

__ecereInstance1->declarator = MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(MkIdentifier("class"))), __ecereInstance1->qualifiers = MkListOne(MkStructOrUnion(3, MkIdentifier("__ecereNameSpace__ecere__com__Class"), (((void *)0)))), __ecereInstance1;
});
DeclareStruct(curExternal, "ecere::com::Class", 0, 1);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->__anon1.function.parameters), (((void *)0)), thisParam);
}
}
}
if(symbol && symbol->__anon2.__anon1.pointerExternal && symbol->__anon2.__anon1.pointerExternal->type == 1)
{
struct InitDeclarator * initDecl = (*symbol->__anon2.__anon1.pointerExternal->__anon1.declaration->__anon1.__anon1.declarators).first;

funcDecl = GetFuncDecl(initDecl->declarator);
if(funcDecl)
{
if(funcDecl->__anon1.function.parameters && (*funcDecl->__anon1.function.parameters).count == 1)
{
struct TypeName * param = (*funcDecl->__anon1.function.parameters).first;

if(param->qualifiers && (*param->qualifiers).count == 1 && ((struct Specifier *)(*param->qualifiers).first)->__anon1.specifier == VOID && !param->declarator)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*funcDecl->__anon1.function.parameters), param);
FreeTypeName(param);
}
}
if(type->classObjectType != 1)
{
if((_class->type != 2 && _class->type != 3 && _class->type != 4) || function != (struct FunctionDefinition *)symbol->__anon2.__anon2.externalSet)
{
struct TypeName * thisParam = QMkClass(_class->fullName, MkDeclaratorIdentifier(MkIdentifier("this")));

if(!funcDecl->__anon1.function.parameters)
funcDecl->__anon1.function.parameters = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->__anon1.function.parameters), (((void *)0)), thisParam);
}
}
}
}
}
if(function->body)
{
if(type->classObjectType != 1)
{
thisSymbol = __extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString("this"), __ecereInstance1->type = classSym ? MkClassType(classSym->string) : (((void *)0)), __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&function->body->__anon1.compound.context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
if(typedObject && thisSymbol->type)
{
thisSymbol->type->classObjectType = 2;
thisSymbol->type->byReference = type->byReference;
thisSymbol->type->typedByReference = type->byReference;
}
}
}
if(inCompiler && _class && _class->type == 0 && type->classObjectType != 1)
{
struct __ecereNameSpace__ecere__com__DataMember * member = (((void *)0));

{
struct __ecereNameSpace__ecere__com__Class * base;

for(base = _class; base && base->type != 1000; base = base->next)
{
for(member = base->membersAndProperties.first; member; member = member->next)
if(!member->isProperty)
break;
if(member)
break;
}
}
for(member = _class->membersAndProperties.first; member; member = member->next)
if(!member->isProperty)
break;
if(member)
{
char pointerName[1024];
struct Declaration * decl;
struct Initializer * initializer;
struct Expression * exp, * bytePtr;

strcpy(pointerName, "__ecerePointer_");
FullClassNameCat(pointerName, _class->fullName, 0);
{
char className[1024];

strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 1);
DeclareClass(curExternal, classSym, className);
}
bytePtr = QBrackets(MkExpCast(QMkType("char", QMkPtrDecl((((void *)0)))), QMkExpId("this")));
if(_class->fixed)
{
struct Expression * e;

if(_class->offset && _class->offset == (_class->base->type == 5 ? _class->base->memberOffset : _class->base->structSize))
{
e = MkExpClassSize(MkSpecifierName(_class->base->fullName));
ProcessExpressionType(e);
}
else
{
char string[256];

sprintf(string, "%d", _class->offset);
e = MkExpConstant(string);
}
exp = QBrackets(MkExpOp(bytePtr, '+', e));
}
else
{
exp = QBrackets(MkExpOp(bytePtr, '+', MkExpPointer(QMkExpId(className), MkIdentifier("offset"))));
}
exp = QBrackets(QMkExpCond(QMkExpId("this"), exp, MkExpConstant("0")));
exp->expType = __extension__ ({
struct Type * __ecereInstance2 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance2->refCount = 1, __ecereInstance2->kind = 13, __ecereInstance2->__anon1.type = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1->kind = 0, __ecereInstance1;
}), __ecereInstance2;
});
if(function->body)
{
yylloc = function->body->loc;
initializer = MkInitializerAssignment(MkExpCast(MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(structName), (((void *)0)))), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), exp));
{
struct Context * prevContext = curContext;
struct __ecereNameSpace__ecere__sys__OldList * list;

curContext = function->body->__anon1.compound.context;
decl = MkDeclaration((list = MkListOne(MkStructOrUnion(3, MkIdentifier(structName), (((void *)0))))), MkListOne(MkInitDeclarator(QMkPtrDecl(pointerName), initializer)));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*list), (((void *)0)), MkSpecifierExtended(MkExtDeclAttrib(MkAttrib(ATTRIB, MkListOne(MkAttribute(__ecereNameSpace__ecere__sys__CopyString("unused"), (((void *)0))))))));
curContext = prevContext;
}
decl->symbol = (((void *)0));
if(!function->body->__anon1.compound.declarations)
function->body->__anon1.compound.declarations = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*function->body->__anon1.compound.declarations), (((void *)0)), decl);
}
}
}
}
else
thisClass = (((void *)0));
if(id)
{
FreeSpecifier(id->_class);
id->_class = (((void *)0));
if(symbol && symbol->__anon2.__anon1.pointerExternal && symbol->__anon2.__anon1.pointerExternal->type == 1)
{
struct InitDeclarator * initDecl = (*symbol->__anon2.__anon1.pointerExternal->__anon1.declaration->__anon1.__anon1.declarators).first;

id = GetDeclId(initDecl->declarator);
FreeSpecifier(id->_class);
id->_class = (((void *)0));
}
}
if(function->body)
topContext = function->body->__anon1.compound.context;
{
struct FunctionDefinition * oldFunction = curFunction;

curFunction = function;
if(function->body)
ProcessStatement(function->body);
if(inCompiler && function->propSet && !function->propSet->fireWatchersDone)
{
struct Statement * prevCompound = curCompound;
struct Context * prevContext = curContext;
struct Statement * fireWatchers = MkFireWatchersStmt((((void *)0)), (((void *)0)));

if(!function->body->__anon1.compound.statements)
function->body->__anon1.compound.statements = MkList();
ListAdd(function->body->__anon1.compound.statements, fireWatchers);
curCompound = function->body;
curContext = function->body->__anon1.compound.context;
ProcessStatement(fireWatchers);
curContext = prevContext;
curCompound = prevCompound;
}
curFunction = oldFunction;
}
if(function->declarator)
{
ProcessDeclarator(function->declarator, 1);
}
topContext = oldTopContext;
thisClass = oldThisClass;
}

static void ProcessClass(struct __ecereNameSpace__ecere__sys__OldList * definitions, struct Symbol * symbol)
{
struct ClassDef * def;
struct External * external = curExternal;
struct __ecereNameSpace__ecere__com__Class * regClass = symbol ? symbol->__anon1.registered : (((void *)0));

for(def = definitions->first; def; def = def->next)
{
if(def->type == 0)
{
if(def->__anon1.function->declarator)
curExternal = def->__anon1.function->declarator->symbol->__anon2.__anon1.pointerExternal;
else
curExternal = external;
ProcessFunction((struct FunctionDefinition *)def->__anon1.function);
}
else if(def->type == 2)
{
if(def->__anon1.decl->type == 2)
{
thisClass = regClass;
ProcessInstantiationType(def->__anon1.decl->__anon1.inst);
thisClass = (((void *)0));
}
else
{
struct __ecereNameSpace__ecere__com__Class * backThisClass = thisClass;

if(regClass)
thisClass = regClass;
ProcessDeclaration(def->__anon1.decl, symbol ? 1 : 0);
thisClass = backThisClass;
}
}
else if(def->type == 1 && def->__anon1.defProperties)
{
struct MemberInit * defProperty;
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = regClass ? MkClassType(regClass->fullName) : (((void *)0)), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
for(defProperty = (*def->__anon1.defProperties).first; defProperty; defProperty = defProperty->next)
{
thisClass = regClass;
ProcessMemberInitData(defProperty, regClass, (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)));
thisClass = (((void *)0));
}
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
FreeSymbol(thisSymbol);
}
else if(def->type == 3 && def->__anon1.propertyDef)
{
struct PropertyDef * prop = def->__anon1.propertyDef;

thisClass = regClass;
if(prop->setStmt)
{
if(regClass)
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(regClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&prop->setStmt->__anon1.compound.context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
}
curExternal = prop->symbol ? prop->symbol->__anon2.__anon2.externalSet : (((void *)0));
ProcessStatement(prop->setStmt);
}
if(prop->getStmt)
{
if(regClass)
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(regClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&prop->getStmt->__anon1.compound.context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
}
curExternal = prop->symbol ? prop->symbol->__anon2.__anon2.externalGet : (((void *)0));
ProcessStatement(prop->getStmt);
}
if(prop->issetStmt)
{
if(regClass)
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(regClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&prop->issetStmt->__anon1.compound.context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
}
curExternal = prop->symbol ? prop->symbol->__anon2.__anon2.externalIsSet : (((void *)0));
ProcessStatement(prop->issetStmt);
}
thisClass = (((void *)0));
}
else if(def->type == 4 && def->__anon1.propertyWatch)
{
struct PropertyWatch * propertyWatch = def->__anon1.propertyWatch;

thisClass = regClass;
if(propertyWatch->compound)
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = regClass ? MkClassType(regClass->fullName) : (((void *)0)), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&propertyWatch->compound->__anon1.compound.context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
curExternal = (((void *)0));
ProcessStatement(propertyWatch->compound);
}
thisClass = (((void *)0));
}
}
}

void __ecereRegisterModule_pass15(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetYydebug", "void SetYydebug(bool b)", SetYydebug, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetThisClass", "void SetThisClass(ecere::com::Class c)", SetThisClass, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetThisClass", "ecere::com::Class GetThisClass(void)", GetThisClass, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintExpression", "void PrintExpression(Expression exp, char * string)", PrintExpression, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessTemplateParameterType", "Type ProcessTemplateParameterType(TemplateParameter param)", ProcessTemplateParameterType, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("NeedCast", "bool NeedCast(Type type1, Type type2)", NeedCast, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintInt", "char * PrintInt(int64 result)", PrintInt, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintUInt", "char * PrintUInt(uint64 result)", PrintUInt, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintInt64", "char * PrintInt64(int64 result)", PrintInt64, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintUInt64", "char * PrintUInt64(uint64 result)", PrintUInt64, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintHexUInt", "char * PrintHexUInt(uint64 result)", PrintHexUInt, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintHexUInt64", "char * PrintHexUInt64(uint64 result)", PrintHexUInt64, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintShort", "char * PrintShort(short result)", PrintShort, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintUShort", "char * PrintUShort(uint16 result)", PrintUShort, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintChar", "char * PrintChar(char result)", PrintChar, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintUChar", "char * PrintUChar(byte result)", PrintUChar, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintFloat", "char * PrintFloat(float result)", PrintFloat, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintDouble", "char * PrintDouble(double result)", PrintDouble, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOpInt", "bool GetOpInt(Operand op2, int * value2)", GetOpInt, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetInt", "bool GetInt(Expression exp, int * value2)", GetInt, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOpUInt", "bool GetOpUInt(Operand op2, uint * value2)", GetOpUInt, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetUInt", "bool GetUInt(Expression exp, uint * value2)", GetUInt, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOpInt64", "bool GetOpInt64(Operand op2, int64 * value2)", GetOpInt64, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetInt64", "bool GetInt64(Expression exp, int64 * value2)", GetInt64, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOpUInt64", "bool GetOpUInt64(Operand op2, uint64 * value2)", GetOpUInt64, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetUInt64", "bool GetUInt64(Expression exp, uint64 * value2)", GetUInt64, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOpIntPtr", "bool GetOpIntPtr(Operand op2, intptr * value2)", GetOpIntPtr, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetIntPtr", "bool GetIntPtr(Expression exp, intptr * value2)", GetIntPtr, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOpUIntPtr", "bool GetOpUIntPtr(Operand op2, uintptr * value2)", GetOpUIntPtr, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetUIntPtr", "bool GetUIntPtr(Expression exp, uintptr * value2)", GetUIntPtr, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOpIntSize", "bool GetOpIntSize(Operand op2, intsize * value2)", GetOpIntSize, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetIntSize", "bool GetIntSize(Expression exp, intsize * value2)", GetIntSize, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOpUIntSize", "bool GetOpUIntSize(Operand op2, uintsize * value2)", GetOpUIntSize, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetUIntSize", "bool GetUIntSize(Expression exp, uintsize * value2)", GetUIntSize, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOpShort", "bool GetOpShort(Operand op2, short * value2)", GetOpShort, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetShort", "bool GetShort(Expression exp, short * value2)", GetShort, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOpUShort", "bool GetOpUShort(Operand op2, uint16 * value2)", GetOpUShort, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetUShort", "bool GetUShort(Expression exp, uint16 * value2)", GetUShort, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOpChar", "bool GetOpChar(Operand op2, char * value2)", GetOpChar, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetChar", "bool GetChar(Expression exp, char * value2)", GetChar, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOpUChar", "bool GetOpUChar(Operand op2, byte * value2)", GetOpUChar, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetUChar", "bool GetUChar(Expression exp, byte * value2)", GetUChar, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOpFloat", "bool GetOpFloat(Operand op2, float * value2)", GetOpFloat, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetFloat", "bool GetFloat(Expression exp, float * value2)", GetFloat, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOpDouble", "bool GetOpDouble(Operand op2, double * value2)", GetOpDouble, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetDouble", "bool GetDouble(Expression exp, double * value2)", GetDouble, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ComputeClassMembers", "void ComputeClassMembers(ecere::com::Class _class, bool isMember)", ComputeClassMembers, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ComputeModuleClasses", "void ComputeModuleClasses(ecere::com::Module module)", ComputeModuleClasses, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ComputeTypeSize", "int ComputeTypeSize(Type type)", ComputeTypeSize, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("AddMembers", "int AddMembers(External neededBy, ecere::sys::OldList * declarations, ecere::com::Class _class, bool isMember, uint * retSize, ecere::com::Class topClass, bool * addedPadding)", AddMembers, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclareStruct", "External DeclareStruct(External neededBy, const char * name, bool skipNoHead, bool needDereference)", DeclareStruct, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("_DeclareStruct", "External _DeclareStruct(External neededBy, const char * name, bool skipNoHead, bool needDereference, bool fwdDecl)", _DeclareStruct, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclareProperty", "void DeclareProperty(External neededBy, ecere::com::Property prop, char * setName, char * getName)", DeclareProperty, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("Dereference", "Type Dereference(Type source)", Dereference, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessMemberInitData", "void ProcessMemberInitData(MemberInit member, ecere::com::Class _class, ecere::com::Class * curClass, ecere::com::DataMember * curMember, ecere::com::DataMember * subMemberStack, int * subMemberStackPos)", ProcessMemberInitData, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessInstantiationType", "void ProcessInstantiationType(Instantiation inst)", ProcessInstantiationType, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclareType", "void DeclareType(External neededFor, Type type, bool needDereference, bool forFunctionDef)", DeclareType, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclareTypeForwardDeclare", "void DeclareTypeForwardDeclare(External neededFor, Type type, bool needDereference, bool forFunctionDef)", DeclareTypeForwardDeclare, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FindTemplateArg", "ecere::com::ClassTemplateArgument * FindTemplateArg(ecere::com::Class _class, TemplateParameter param)", FindTemplateArg, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetupTemplatesContext", "Context SetupTemplatesContext(ecere::com::Class _class)", SetupTemplatesContext, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FinishTemplatesContext", "void FinishTemplatesContext(Context context)", FinishTemplatesContext, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessMethodType", "void ProcessMethodType(ecere::com::Method method)", ProcessMethodType, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessPropertyType", "void ProcessPropertyType(ecere::com::Property prop)", ProcessPropertyType, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclareMethod", "void DeclareMethod(External neededFor, ecere::com::Method method, const char * name)", DeclareMethod, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ReplaceThisClass", "char * ReplaceThisClass(ecere::com::Class _class)", ReplaceThisClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ReplaceThisClassType", "Type ReplaceThisClassType(ecere::com::Class _class)", ReplaceThisClassType, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ReplaceThisClassSpecifiers", "void ReplaceThisClassSpecifiers(ecere::sys::OldList specs, ecere::com::Class _class)", ReplaceThisClassSpecifiers, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclareFunction", "bool DeclareFunction(External neededFor, ecere::com::GlobalFunction function, char * name)", DeclareFunction, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclareGlobalData", "void DeclareGlobalData(External neededFor, GlobalData data)", DeclareGlobalData, module, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Conversion", 0, sizeof(struct Conversion), 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_Conversion = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, (((void *)0)), (((void *)0)), 0, sizeof(void *) > 4 ? sizeof(void *) : 4, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MatchTypes", "bool MatchTypes(Type source, Type dest, ecere::sys::OldList conversions, ecere::com::Class owningClassSource, ecere::com::Class owningClassDest, bool doConversion, bool enumBaseType, bool acceptReversedParams, bool isConversionExploration, bool warnConst)", MatchTypes, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MatchWithEnums_NameSpace", "bool MatchWithEnums_NameSpace(ecere::com::NameSpace nameSpace, Expression sourceExp, Type dest, char * string, ecere::sys::OldList conversions)", MatchWithEnums_NameSpace, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ModuleVisibility", "bool ModuleVisibility(ecere::com::Module searchIn, ecere::com::Module searchFor)", ModuleVisibility, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MatchWithEnums_Module", "bool MatchWithEnums_Module(ecere::com::Module mainModule, Expression sourceExp, Type dest, char * string, ecere::sys::OldList conversions)", MatchWithEnums_Module, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MatchTypeExpression", "bool MatchTypeExpression(Expression sourceExp, Type dest, ecere::sys::OldList conversions, bool skipUnitBla, bool warnConst)", MatchTypeExpression, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ReadString", "void ReadString(char * output, char * string)", ReadString, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("UnescapeString", "int UnescapeString(char * d, char * s, int len)", UnescapeString, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("OffsetEscapedString", "char * OffsetEscapedString(char * s, int len, int offset)", OffsetEscapedString, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOperand", "Operand GetOperand(Expression exp)", GetOperand, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PopulateInstance", "void PopulateInstance(Instantiation inst)", PopulateInstance, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ComputeInstantiation", "void ComputeInstantiation(Expression exp)", ComputeInstantiation, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CallOperator", "void CallOperator(Expression exp, Expression exp1, Expression exp2, Operand op1, Operand op2)", CallOperator, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ComputeExpression", "void ComputeExpression(Expression exp)", ComputeExpression, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("modifyPassAsTemplate", "void modifyPassAsTemplate(Type * typePtr, bool value)", modifyPassAsTemplate, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CheckTemplateTypes", "void CheckTemplateTypes(Expression exp)", CheckTemplateTypes, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FindSymbol", "Symbol FindSymbol(const char * name, Context startContext, Context endContext, bool isStruct, bool globalNameSpace)", FindSymbol, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintType", "void PrintType(Type type, char * string, bool printName, bool fullName)", PrintType, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintTypeNoConst", "void PrintTypeNoConst(Type type, char * string, bool printName, bool fullName)", PrintTypeNoConst, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FindMemberAndOffset", "Type FindMemberAndOffset(Type type, char * string, uint * offset)", FindMemberAndOffset, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetParseError", "bool GetParseError(void)", GetParseError, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ParseExpressionString", "Expression ParseExpressionString(char * expression)", ParseExpressionString, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ReplaceExpContents", "void ReplaceExpContents(Expression checkedExp, Expression newExp)", ReplaceExpContents, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ApplyAnyObjectLogic", "void ApplyAnyObjectLogic(Expression e)", ApplyAnyObjectLogic, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ApplyLocation", "void ApplyLocation(Expression exp, Location loc)", ApplyLocation, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("RelatedUnits", "bool RelatedUnits(ecere::com::Class c1, ecere::com::Class c2)", RelatedUnits, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessExpressionType", "void ProcessExpressionType(Expression exp)", ProcessExpressionType, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclareFunctionUtil", "void DeclareFunctionUtil(External neededBy, const String s)", DeclareFunctionUtil, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ComputeDataTypes", "void ComputeDataTypes(void)", ComputeDataTypes, module, 1);
}

