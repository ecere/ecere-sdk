/* Code generated from eC source file: ast.ec */
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
#if defined(_WIN32)
#   if defined(__GNUC__) || defined(__TINYC__)
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
enum yytokentype
{
IDENTIFIER = 258, CONSTANT = 259, STRING_LITERAL = 260, SIZEOF = 261, PTR_OP = 262, INC_OP = 263, DEC_OP = 264, LEFT_OP = 265, RIGHT_OP = 266, LE_OP = 267, GE_OP = 268, EQ_OP = 269, NE_OP = 270, AND_OP = 271, OR_OP = 272, MUL_ASSIGN = 273, DIV_ASSIGN = 274, MOD_ASSIGN = 275, ADD_ASSIGN = 276, SUB_ASSIGN = 277, LEFT_ASSIGN = 278, RIGHT_ASSIGN = 279, AND_ASSIGN = 280, XOR_ASSIGN = 281, OR_ASSIGN = 282, TYPE_NAME = 283, TYPEDEF = 284, EXTERN = 285, STATIC = 286, AUTO = 287, REGISTER = 288, CHAR = 289, SHORT = 290, INT = 291, UINT = 292, INT64 = 293, LONG = 294, SIGNED = 295, UNSIGNED = 296, FLOAT = 297, DOUBLE = 298, CONST = 299, VOLATILE = 300, VOID = 301, VALIST = 302, STRUCT = 303, UNION = 304, ENUM = 305, ELLIPSIS = 306, CASE = 307, DEFAULT = 308, IF = 309, SWITCH = 310, WHILE = 311, DO = 312, FOR = 313, GOTO = 314, CONTINUE = 315, BREAK = 316, RETURN = 317, IFX = 318, ELSE = 319, CLASS = 320, THISCLASS = 321, CLASS_NAME = 322, PROPERTY = 323, SETPROP = 324, GETPROP = 325, NEWOP = 326, RENEW = 327, DELETE = 328, EXT_DECL = 329, EXT_STORAGE = 330, IMPORT = 331, DEFINE = 332, VIRTUAL = 333, ATTRIB = 334, PUBLIC = 335, PRIVATE = 336, TYPED_OBJECT = 337, ANY_OBJECT = 338, _INCREF = 339, EXTENSION = 340, ASM = 341, TYPEOF = 342, WATCH = 343, STOPWATCHING = 344, FIREWATCHERS = 345, WATCHABLE = 346, CLASS_DESIGNER = 347, CLASS_NO_EXPANSION = 348, CLASS_FIXED = 349, ISPROPSET = 350, CLASS_DEFAULT_PROPERTY = 351, PROPERTY_CATEGORY = 352, CLASS_DATA = 353, CLASS_PROPERTY = 354, SUBCLASS = 355, NAMESPACE = 356, NEW0OP = 357, RENEW0 = 358, VAARG = 359, DBTABLE = 360, DBFIELD = 361, DBINDEX = 362, DATABASE_OPEN = 363, ALIGNOF = 364, ATTRIB_DEP = 365, __ATTRIB = 366, BOOL = 367, _BOOL = 368, _COMPLEX = 369, _IMAGINARY = 370, RESTRICT = 371, THREAD = 372, WIDE_STRING_LITERAL = 373, BUILTIN_OFFSETOF = 374
};

extern char * yytext;

const char * defaultNameSpace;

int defaultNameSpaceLen;

unsigned int strictNameSpaces;

int declMode = 2;

int structDeclMode = 2;

int defaultDeclMode = 2;

const char * currentNameSpace;

int currentNameSpaceLen;

struct ContextStringPair
{
char * string, * context;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__Instance * intlStrings;

extern unsigned int inCompiler;

extern const char *  i18nModuleName;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Iterator_data;

extern unsigned int buildingECERECOMModule;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_next;

extern unsigned int inIDE;

extern int targetBits;

extern int targetPlatform;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_map;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_key;

extern int yyparse();

extern int yylex();

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
unsigned int count;
unsigned int _size;
unsigned int pos;
} ecere_gcc_struct;

extern void *  __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew(void *  memory, unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew0(void *  memory, unsigned int size);

extern void __ecereNameSpace__ecere__com__eSystem_Delete(void *  memory);

struct CodePosition
{
int line;
int charPos;
int pos;
int included;
} ecere_gcc_struct;

extern size_t strlen(const char * );

extern void *  memcpy(void * , const void * , size_t size);

extern int strcmp(const char * , const char * );

extern char *  __ecereNameSpace__ecere__sys__CopyString(const char *  string);

struct ClassImport;

extern char *  QMkString(const char *  source);

extern char *  strstr(const char * , const char * );

extern char *  __ecereNameSpace__ecere__sys__RSearchString(const char *  buffer, const char *  subStr, int maxLen, unsigned int matchCase, unsigned int matchWord);

struct __ecereNameSpace__ecere__com__DefinedExpression;

extern void Compiler_Warning(const char *  format, ...);

extern const char *  __ecereNameSpace__ecere__GetTranslatedString(const char * name, const char *  string, const char *  stringAndContext);

extern int sprintf(char * , const char * , ...);

extern void Compiler_Error(const char *  format, ...);

struct __ecereNameSpace__ecere__com__LinkList
{
void * first;
void * last;
int count;
} ecere_gcc_struct;

extern char *  strncpy(char * , const char * , size_t n);

extern void ImportModule(const char *  name, int importType, int importAccess, unsigned int loadDllOnly);

extern char *  strcpy(char * , const char * );

extern char *  strcat(char * , const char * );

extern int strncmp(const char * , const char * , size_t n);

extern char *  strchr(const char * , int);

extern long long strtoll(const char *  nptr, char * *  endptr, int base);

extern unsigned long strtoul(const char *  nptr, char * *  endptr, int base);

extern void FullClassNameCat(char *  output, const char *  className, unsigned int includeTemplateParams);

struct __ecereNameSpace__ecere__com__CustomAVLTree
{
struct __ecereNameSpace__ecere__com__AVLNode * root;
int count;
} ecere_gcc_struct;

extern const char *  GetSourceFile(void);

extern const char *  GetOutputFile(void);

extern char *  __ecereNameSpace__ecere__sys__ChangeExtension(const char *  string, const char *  ext, char *  output);

extern char *  __ecereNameSpace__ecere__sys__GetSlashPathBuffer(char *  d, const char *  p);

struct __ecereNameSpace__ecere__com__IteratorPointer;

struct __ecereNameSpace__ecere__com__GlobalFunction;

const char * GetYYText()
{
return yytext;
}

void SetStrictNameSpaces(unsigned int b)
{
strictNameSpaces = b;
}

void SetDeclMode(int accessMode)
{
structDeclMode = declMode = accessMode;
}

void SetDefaultDeclMode(int accessMode)
{
defaultDeclMode = accessMode;
}

void ParseEc()
{
yyparse();
}

int LexEc()
{
return yylex();
}

extern struct __ecereNameSpace__ecere__sys__OldList *  excludedSymbols;

extern void FreeList(struct __ecereNameSpace__ecere__sys__OldList * list, void (*  FreeFunction)(void * ));

extern struct __ecereNameSpace__ecere__sys__OldList *  imports;

extern struct __ecereNameSpace__ecere__sys__OldList * ast;

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(struct __ecereNameSpace__ecere__sys__OldList * this, void *  prevItem, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear(struct __ecereNameSpace__ecere__sys__OldList * this);

struct __ecereNameSpace__ecere__sys__OldList * MkList()
{
return __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__sys__OldList) * (1));
}

struct Location
{
struct CodePosition start;
struct CodePosition end;
} ecere_gcc_struct;

void SetDefaultNameSpace(const char * s)
{
defaultNameSpace = s;
defaultNameSpaceLen = s ? strlen(s) : 0;
}

void SetCurrentNameSpace(const char * s)
{
currentNameSpace = s;
currentNameSpaceLen = s ? strlen(s) : 0;
}

void SetAST(struct __ecereNameSpace__ecere__sys__OldList * list)
{
ast = list;
}

struct __ecereNameSpace__ecere__sys__OldList * GetAST()
{
return ast;
}

struct __ecereNameSpace__ecere__sys__OldList * MkListOne(void * item)
{
struct __ecereNameSpace__ecere__sys__OldList * list = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__sys__OldList) * (1));

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*list), item);
return list;
}

void ListAdd(struct __ecereNameSpace__ecere__sys__OldList * list, void * item)
{
if(item)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(list, item);
}

void ListAddFront(struct __ecereNameSpace__ecere__sys__OldList * list, void * item)
{
if(item)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(list, (((void *)0)), item);
}

extern struct Location yylloc;

struct Attrib
{
struct Location loc;
int type;
struct __ecereNameSpace__ecere__sys__OldList *  attribs;
} ecere_gcc_struct;

struct ExtDecl
{
struct Location loc;
int type;
union
{
char * s;
struct Attrib * attr;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

struct Context;

extern struct Context * curContext;

extern struct Context * globalContext;

extern void FreeContext(struct Context * context);

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} ecere_gcc_struct;

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

extern struct __ecereNameSpace__ecere__com__Class * thisClass;

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpen(const char *  fileName, int mode);

struct __ecereNameSpace__ecere__com__MapIterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__Iterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} ecere_gcc_struct;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

int __ecereMethod___ecereNameSpace__ecere__sys__File_Printf(struct __ecereNameSpace__ecere__com__Instance * this, const char *  format, ...);

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Free;

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_map(struct __ecereNameSpace__ecere__com__MapIterator * this);

void __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(struct __ecereNameSpace__ecere__com__MapIterator * this, struct __ecereNameSpace__ecere__com__Instance * value);

const uint64 __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_key(struct __ecereNameSpace__ecere__com__MapIterator * this);

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(struct __ecereNameSpace__ecere__com__Iterator * this, const uint64 index, unsigned int create);

uint64 __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(struct __ecereNameSpace__ecere__com__Iterator * this);

void __ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(struct __ecereNameSpace__ecere__com__Iterator * this, uint64 value);

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Next();

void __ecereDestroyModuleInstances_ast()
{
(__ecereNameSpace__ecere__com__eInstance_DecRef(intlStrings), intlStrings = 0);
}

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

struct Expression;

extern struct Expression * QMkExpId(const char *  id);

extern void PrintExpression(struct Expression * exp, char *  string);

extern void FreeExpression(struct Expression * exp);

extern struct Expression * CopyExpression(struct Expression * exp);

extern void ProcessExpressionType(struct Expression * exp);

extern void ComputeExpression(struct Expression * exp);

struct External;

extern void FreeExternal(struct External * external);

extern struct External * curExternal;

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

struct __ecereNameSpace__ecere__com__Property;

extern void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

extern void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object);

extern void __ecereNameSpace__ecere__com__eInstance_Watch(void *  instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

struct DBIndexItem;

struct Symbol;

extern void FreeSymbol(struct Symbol * symbol);

extern struct Symbol * FindSymbol(const char *  name, struct Context * startContext, struct Context * endContext, unsigned int isStruct, unsigned int globalNameSpace);

extern void DeclareClass(struct External * neededFor, struct Symbol * classSym, const char *  className);

struct DBTableDef
{
char *  name;
struct Symbol * symbol;
struct __ecereNameSpace__ecere__sys__OldList *  definitions;
int declMode;
} ecere_gcc_struct;

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

extern void FreeType(struct Type * type);

extern void PrintTypeNoConst(struct Type * type, char *  string, unsigned int printName, unsigned int fullName);

struct Declarator;

extern void FreeDeclarator(struct Declarator * decl);

extern struct Declarator * GetFuncDecl(struct Declarator * decl);

extern char *  StringFromSpecDecl(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

struct TemplateDatatype
{
struct __ecereNameSpace__ecere__sys__OldList *  specifiers;
struct Declarator * decl;
} ecere_gcc_struct;

extern struct Declarator * SpecDeclFromString(const char *  string, struct __ecereNameSpace__ecere__sys__OldList *  specs, struct Declarator * baseDecl);

struct Specifier;

extern void FreeSpecifier(struct Specifier * spec);

extern struct Specifier * CopySpecifier(struct Specifier * spec);

struct __ecereNameSpace__ecere__sys__OldList * MkSpecsClass(struct Specifier * _class)
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();

ListAdd(list, _class);
return list;
}

struct Specifier *  _MkSpecifierName(const char *  name, struct Symbol *  symbol, struct __ecereNameSpace__ecere__sys__OldList *  templateArgs);

struct Specifier * MkSpecifierName(const char * name)
{
return _MkSpecifierName(name, (((void *)0)), (((void *)0)));
}

struct Specifier * MkSpecifierNameArgs(const char * name, struct __ecereNameSpace__ecere__sys__OldList * templateArgs)
{
return _MkSpecifierName(name, (((void *)0)), templateArgs);
}

struct TemplateArgument;

extern void FreeTemplateArgument(struct TemplateArgument * arg);

struct ClassFunction;

extern void FreeClassFunction(struct ClassFunction * func);

struct __ecereNameSpace__ecere__sys__NamedLink64;

struct __ecereNameSpace__ecere__sys__NamedLink64
{
struct __ecereNameSpace__ecere__sys__NamedLink64 * prev;
struct __ecereNameSpace__ecere__sys__NamedLink64 * next;
char *  name;
long long data;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__sys__OldLink;

struct __ecereNameSpace__ecere__sys__OldLink
{
struct __ecereNameSpace__ecere__sys__OldLink * prev;
struct __ecereNameSpace__ecere__sys__OldLink * next;
void *  data;
} ecere_gcc_struct;

int CheckType(const char *  text);

int check_type()
{
return CheckType(yytext);
}

struct DBTableEntry;

struct MemberInit;

struct Pointer;

struct Pointer
{
struct Pointer * prev;
struct Pointer * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList *  qualifiers;
struct Pointer * pointer;
} ecere_gcc_struct;

struct PropertyWatch;

struct Symbol *  FindType(struct Context *  ctx, const char *  name);

struct __ecereNameSpace__ecere__com__Method;

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

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, void *  function, int declMode);

struct __ecereNameSpace__ecere__com__DataMember;

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

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, unsigned int size, unsigned int alignment, int declMode);

struct __ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_FindDefine(struct __ecereNameSpace__ecere__com__Instance * module, const char *  name);

extern struct __ecereNameSpace__ecere__com__Instance * privateModule;

extern struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_RegisterDefine(const char *  name, const char *  value, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, const char *  name);

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(const char *  name, const char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, const char *  name, const char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

struct Enumerator;

struct Initializer;

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

struct Attribute;

struct Attribute
{
struct Attribute * prev;
struct Attribute * next;
struct Location loc;
char * attr;
struct Expression * exp;
} ecere_gcc_struct;

struct AsmField;

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

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, const char *  key);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(struct __ecereNameSpace__ecere__sys__BinaryTree * this);

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
} ecere_gcc_struct;

struct TemplatedType *  FindTemplateTypeParameter(struct Context *  ctx, const char *  name);

void CopyTypeInto(struct Type * type, struct Type * src)
{
*type = *src;
type->name = __ecereNameSpace__ecere__sys__CopyString(src->name);
type->typeName = __ecereNameSpace__ecere__sys__CopyString(src->typeName);
type->refCount = 1;
if(src->kind == 15)
{
struct __ecereNameSpace__ecere__sys__NamedLink64 * member;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear(&type->__anon1.__anon1.members);
for(member = src->__anon1.__anon1.members.first; member; member = member->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&type->__anon1.__anon1.members, __extension__ ({
struct __ecereNameSpace__ecere__sys__NamedLink64 * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__sys__NamedLink64));

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(member->name), __ecereInstance1->data = member->data, __ecereInstance1;
}));
}
type->__anon1.__anon1.enumName = __ecereNameSpace__ecere__sys__CopyString(src->__anon1.__anon1.enumName);
}
else if(src->kind == 9 || src->kind == 10)
{
struct Type * member;

for(member = type->__anon1.__anon1.members.first; member; member = member->next)
member->refCount++;
type->__anon1.__anon1.enumName = __ecereNameSpace__ecere__sys__CopyString(src->__anon1.__anon1.enumName);
}
else if(src->kind == 11)
{
struct Type * param;

type->__anon1.__anon2.returnType->refCount++;
for(param = type->__anon1.__anon2.params.first; param; param = param->next)
param->refCount++;
}
else if(src->kind == 13 || src->kind == 12)
{
type->__anon1.type->refCount++;
if(src->kind == 12)
{
if(type->__anon1.__anon4.arraySizeExp)
type->__anon1.__anon4.arraySizeExp = CopyExpression(type->__anon1.__anon4.arraySizeExp);
}
}
}

struct Identifier;

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

struct Enumerator
{
struct Enumerator * prev;
struct Enumerator * next;
struct Location loc;
struct Identifier * id;
struct Expression * exp;
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

struct TemplateArgument
{
struct TemplateArgument * prev;
struct TemplateArgument * next;
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

struct AsmField
{
struct AsmField * prev;
struct AsmField * next;
struct Location loc;
char *  command;
struct Expression * expression;
struct Identifier * symbolic;
} ecere_gcc_struct;

struct DBIndexItem
{
struct DBIndexItem * prev;
struct DBIndexItem * next;
struct Identifier * id;
int order;
} ecere_gcc_struct;

struct Identifier * GetDeclId(struct Declarator * decl)
{
while(decl && decl->type != 1)
decl = decl->declarator;
return decl ? decl->__anon1.identifier : (((void *)0));
}

struct TypeName;

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

struct DBTableEntry
{
struct DBTableEntry * prev;
struct DBTableEntry * next;
int type;
struct Identifier * id;
union
{
struct
{
struct TypeName * dataType;
char *  name;
} ecere_gcc_struct __anon1;
struct __ecereNameSpace__ecere__sys__OldList *  items;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

struct FunctionDefinition;

struct FunctionDefinition *  _MkFunction(struct __ecereNameSpace__ecere__sys__OldList *  specifiers, struct Declarator *  declarator, struct __ecereNameSpace__ecere__sys__OldList *  declarationList, unsigned int errorOnOmit);

struct FunctionDefinition * MkFunction(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct Declarator * declarator, struct __ecereNameSpace__ecere__sys__OldList * declarationList)
{
return _MkFunction(specifiers, declarator, declarationList, 1);
}

static struct Type *  ProcessTypeDecls(struct __ecereNameSpace__ecere__sys__OldList *  specs, struct Declarator *  decl, struct Type *  parentType);

struct Type * ProcessType(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl)
{
return ProcessTypeDecls(specs, decl, (((void *)0)));
}

struct Type * ProcessTypeString(const char * string, unsigned int staticMethod)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl = SpecDeclFromString(string, specs, (((void *)0)));
struct Type * type = ProcessType(specs, decl);

if(type && !type->__anon1.__anon2.thisClass && staticMethod)
type->__anon1.__anon2.staticMethod = 1;
FreeList(specs, (void *)(FreeSpecifier));
if(decl)
FreeDeclarator(decl);
return type;
}

struct Instantiation;

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

struct Symbol *  _DeclClass(struct Specifier *  _class, const char *  name);

struct Symbol * DeclClassAddNameSpace(struct Specifier * _class, const char * className)
{
char name[1024];
int len = 0, stringLen;

name[0] = '\0';
if(className[0] != ':' && (currentNameSpace || defaultNameSpace) && declMode != 0 && defaultDeclMode != 0 && (!_class || _class->__anon1.__anon1.name))
{
if(defaultNameSpace)
{
memcpy(name, defaultNameSpace, defaultNameSpaceLen);
len += defaultNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
if(currentNameSpace)
{
memcpy(name + len, currentNameSpace, currentNameSpaceLen);
len += currentNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
}
stringLen = strlen(className);
memcpy(name + len, className, stringLen);
len += stringLen;
name[len] = 0;
return _DeclClass(_class, name);
}

struct Symbol * DeclClass(struct Specifier * _class, const char * name)
{
if(_class || strchr(name, ':'))
return _DeclClass(_class, name);
else
return DeclClassAddNameSpace(_class, name);
}

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

void PopContext(struct Context * ctx)
{
curContext = ctx->parent;
}

struct Symbol * FindType(struct Context * ctx, const char * name)
{
struct Symbol * type = (((void *)0));

if(ctx)
{
type = (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&ctx->types, name);
if(!type && ctx->parent)
type = FindType(ctx->parent, name);
}
return type;
}

struct Symbol * FindStruct(struct Context * ctx, const char * name)
{
struct Symbol * type = (((void *)0));

if(ctx)
{
type = (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&ctx->structSymbols, name);
if(!type && ctx->parent)
type = FindStruct(ctx->parent, name);
}
return type;
}

struct TemplatedType * FindTemplateTypeParameter(struct Context * ctx, const char * name)
{
struct TemplatedType * templatedType = (((void *)0));

if(curContext)
{
templatedType = (struct TemplatedType *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&ctx->templateTypes, name);
if(!templatedType && ctx->parent)
templatedType = FindTemplateTypeParameter(ctx->parent, name);
}
return templatedType;
}

struct Statement;

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
unsigned int needTemplateCast;
} ecere_gcc_struct;

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

struct PropertyWatch
{
struct PropertyWatch * prev;
struct PropertyWatch * next;
struct Location loc;
struct Statement * compound;
struct __ecereNameSpace__ecere__sys__OldList *  properties;
unsigned int deleteWatch;
} ecere_gcc_struct;

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

struct __ecereNameSpace__ecere__com__SubModule;

struct __ecereNameSpace__ecere__com__SubModule
{
struct __ecereNameSpace__ecere__com__SubModule * prev;
struct __ecereNameSpace__ecere__com__SubModule * next;
struct __ecereNameSpace__ecere__com__Instance * module;
int importMode;
} ecere_gcc_struct;

struct InitDeclarator;

struct InitDeclarator
{
struct InitDeclarator * prev;
struct InitDeclarator * next;
struct Location loc;
struct Declarator * declarator;
struct Initializer * initializer;
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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ContextStringPair;

void __ecereMethod_ContextStringPair_OnFree(struct __ecereNameSpace__ecere__com__Class * class, struct ContextStringPair * this)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(this->string), this->string = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(this->context), this->context = 0);
}

int __ecereMethod_ContextStringPair_OnCompare(struct __ecereNameSpace__ecere__com__Class * class, struct ContextStringPair * this, struct ContextStringPair * b)
{
int result;

result = (this->string && b->string) ? strcmp(this->string, b->string) : (!this->string && b->string) ? 1 : (this->string && !b->string) ? -1 : 0;
if(result)
return result;
result = (this->context && b->context) ? strcmp(this->context, b->context) : (!this->context && b->context) ? 1 : (this->context && !b->context) ? -1 : 0;
return result;
}

extern void __ecereNameSpace__ecere__com__PrintLn(struct __ecereNameSpace__ecere__com__Class * class, const void * object, ...);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Identifier;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Specifier;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateParameter;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplatedType;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateDatatype;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateArgument;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Expression;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List_TPL_Location_;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Symbol;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Attribute;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Attrib;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ExtDecl;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declarator;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Enumerator;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Pointer;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Initializer;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_InitDeclarator;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TypeName;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declaration;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Statement;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionDefinition;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Type;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_External;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassFunction;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_MemberInit;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_MembersInit;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Instantiation;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassDef;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassDefinition;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyDef;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Context;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ModuleImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__NamedLink64;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_AsmField;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyWatch;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBTableDef;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBTableEntry;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBIndexItem;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map_TPL_ContextStringPair__ecere__com__List_TPL_Location___;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BTNode;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_char__PTR_;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_DeclaratorType;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__CustomAVLTree;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map;

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

struct Specifier * MkSpecifier(int specifier)
{
if(specifier == _BOOL && (declMode != 0 && defaultDeclMode != 0))
return MkSpecifierName("bool");
else if(specifier == _BOOL || specifier == BOOL)
return __extension__ ({
struct Specifier * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier);

__ecereInstance1->type = 0, __ecereInstance1->__anon1.specifier = specifier, __ecereInstance1;
});
else
return __extension__ ({
struct Specifier * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier);

__ecereInstance1->type = 0, __ecereInstance1->__anon1.specifier = specifier, __ecereInstance1;
});
}

struct Specifier * MkSpecifierTypeOf(struct Expression * expression)
{
return __extension__ ({
struct Specifier * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier);

__ecereInstance1->type = 6, __ecereInstance1->__anon1.expression = expression, __ecereInstance1;
});
}

struct Specifier * MkSpecifierSubClass(struct Specifier * _class)
{
return __extension__ ({
struct Specifier * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier);

__ecereInstance1->type = 7, __ecereInstance1->__anon1._class = _class, __ecereInstance1;
});
}

struct Specifier * MkSpecifierExtended(struct ExtDecl * extDecl)
{
return __extension__ ({
struct Specifier * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier);

__ecereInstance1->type = 5, __ecereInstance1->__anon1.__anon1.extDecl = extDecl, __ecereInstance1;
});
}

struct TemplateParameter * MkIdentifierTemplateParameter(struct Identifier * identifier, int memberType, struct TemplateArgument * defaultArgument)
{
if(identifier->string)
{
struct TemplateParameter * param = (param = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplateParameter), param->type = 1, param->identifier = identifier, param->__anon1.memberType = memberType, param->defaultArgument = defaultArgument, param);

return param;
}
return (((void *)0));
}

struct TemplateParameter * MkExpressionTemplateParameter(struct Identifier * identifier, struct TemplateDatatype * dataType, struct TemplateArgument * defaultArgument)
{
if(identifier->string)
{
struct TemplateParameter * param = (param = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplateParameter), param->type = 2, param->identifier = identifier, param->__anon1.dataType = dataType, param->defaultArgument = defaultArgument, param);

return param;
}
return (((void *)0));
}

struct TemplateDatatype * MkTemplateDatatype(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct Declarator * decl)
{
struct TemplateDatatype * datatype = (datatype = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplateDatatype), datatype->specifiers = specifiers, datatype->decl = decl, datatype);

return datatype;
}

struct TemplateArgument * MkTemplateTypeArgument(struct TemplateDatatype * tplDatatype)
{
struct TemplateArgument * argument = (argument = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplateArgument), argument->type = 0, argument->__anon1.templateDatatype = tplDatatype, argument);

return argument;
}

struct TemplateArgument * MkTemplateExpressionArgument(struct Expression * expr)
{
struct TemplateArgument * argument = (argument = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplateArgument), argument->type = 2, argument->__anon1.expression = expr, argument);

return argument;
}

struct TemplateArgument * MkTemplateIdentifierArgument(struct Identifier * ident)
{
struct TemplateArgument * argument = (argument = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplateArgument), argument->type = 1, argument->__anon1.identifier = ident, argument);

return argument;
}

struct Expression * MkExpExtensionCompound(struct Statement * compound)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 23, __ecereInstance1->__anon1.compound = compound, __ecereInstance1;
});
}

struct Expression * MkExpExtensionExpression(struct __ecereNameSpace__ecere__sys__OldList * expressions)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 32, __ecereInstance1->__anon1.list = expressions, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpExtensionInitializer(struct TypeName * typeName, struct Initializer * initializer)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 33, __ecereInstance1->__anon1.initializer.typeName = typeName, __ecereInstance1->__anon1.initializer.initializer = initializer, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpIdentifier(struct Identifier * id)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 0, __ecereInstance1->__anon1.__anon1.identifier = id, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpDummy()
{
struct Expression * exp = (exp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), exp->type = 16, exp);

return exp;
}

struct Expression * MkExpConstant(const char * string)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 2, __ecereInstance1->__anon1.__anon1.constant = __ecereNameSpace__ecere__sys__CopyString(string), __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpString(const char * string)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 3, __ecereInstance1->__anon1.__anon2.string = __ecereNameSpace__ecere__sys__CopyString(string), __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpWideString(const char * string)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 3, __ecereInstance1->__anon1.__anon2.string = __ecereNameSpace__ecere__sys__CopyString(string), __ecereInstance1->loc = yylloc, __ecereInstance1->__anon1.__anon2.wideString = 1, __ecereInstance1;
});
}

struct Expression * MkExpOp(struct Expression * exp1, int op, struct Expression * exp2)
{
struct Expression * exp = (exp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), exp->type = 4, exp->__anon1.op.op = op, exp->__anon1.op.exp1 = exp1, exp->__anon1.op.exp2 = exp2, exp);

if(exp1 || exp2)
{
exp->loc.start = exp1 ? exp1->loc.start : exp2->loc.start;
exp->loc.end = exp2 ? exp2->loc.end : exp1->loc.end;
}
return exp;
}

struct Expression * MkExpBrackets(struct __ecereNameSpace__ecere__sys__OldList * expressions)
{
struct Expression * exp = (exp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), exp->type = 5, exp->__anon1.list = expressions, exp);

if(expressions && expressions->first)
{
exp->loc.start = ((struct Expression *)expressions->first)->loc.start;
exp->loc.end = ((struct Expression *)expressions->last)->loc.end;
}
return exp;
}

struct Expression * MkExpIndex(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * index)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 6, __ecereInstance1->__anon1.index.exp = expression, __ecereInstance1->__anon1.index.index = index, __ecereInstance1;
});
}

struct Expression * MkExpCall(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * arguments)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 7, __ecereInstance1->__anon1.call.exp = expression, __ecereInstance1->__anon1.call.arguments = arguments, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpMember(struct Expression * expression, struct Identifier * member)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 8, __ecereInstance1->__anon1.member.exp = expression, __ecereInstance1->__anon1.member.member = member, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpPointer(struct Expression * expression, struct Identifier * member)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 9, __ecereInstance1->__anon1.member.exp = expression, __ecereInstance1->__anon1.member.member = member, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpTypeSize(struct TypeName * typeName)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 10, __ecereInstance1->__anon1.typeName = typeName, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpTypeAlign(struct TypeName * typeName)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 36, __ecereInstance1->__anon1.typeName = typeName, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpOffsetOf(struct TypeName * typeName, struct Identifier * id)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 40, __ecereInstance1->__anon1.offset.typeName = typeName, __ecereInstance1->__anon1.offset.id = id, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpClassSize(struct Specifier * _class)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 15, __ecereInstance1->__anon1._class = _class, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpCast(struct TypeName * typeName, struct Expression * expression)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 11, __ecereInstance1->__anon1.cast.typeName = typeName, __ecereInstance1->__anon1.cast.exp = expression, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpCondition(struct Expression * cond, struct __ecereNameSpace__ecere__sys__OldList * expressions, struct Expression * elseExp)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 12, __ecereInstance1->__anon1.cond.cond = cond, __ecereInstance1->__anon1.cond.exp = expressions, __ecereInstance1->__anon1.cond.elseExp = elseExp, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpRenew(struct Expression * memExp, struct TypeName * type, struct Expression * size)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 14, __ecereInstance1->__anon1._renew.exp = memExp, __ecereInstance1->__anon1._renew.typeName = type, __ecereInstance1->__anon1._renew.size = size, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpRenew0(struct Expression * memExp, struct TypeName * type, struct Expression * size)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 27, __ecereInstance1->__anon1._renew.exp = memExp, __ecereInstance1->__anon1._renew.typeName = type, __ecereInstance1->__anon1._renew.size = size, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpNew(struct TypeName * type, struct Expression * size)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 13, __ecereInstance1->__anon1._new.typeName = type, __ecereInstance1->__anon1._new.size = size, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpNew0(struct TypeName * type, struct Expression * size)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 26, __ecereInstance1->__anon1._new.typeName = type, __ecereInstance1->__anon1._new.size = size, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpVaArg(struct Expression * exp, struct TypeName * type)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 34, __ecereInstance1->__anon1.vaArg.exp = exp, __ecereInstance1->__anon1.vaArg.typeName = type, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Expression * MkExpInstance(struct Instantiation * inst)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 1, __ecereInstance1->__anon1.instance = inst, __ecereInstance1;
});
}

struct Expression * MkExpClass(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct Declarator * decl)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 24, __ecereInstance1->__anon1._classExp.specifiers = specifiers, __ecereInstance1->__anon1._classExp.decl = decl, __ecereInstance1;
});
}

struct Expression * MkExpClassData(struct Identifier * id)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 25, __ecereInstance1->__anon1.classData.id = id, __ecereInstance1;
});
}

struct Expression * MkExpDBOpen(struct Expression * ds, struct Expression * dbName)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 28, __ecereInstance1->__anon1.dbopen.ds = ds, __ecereInstance1->__anon1.dbopen.name = dbName, __ecereInstance1;
});
}

struct Expression * MkExpDBField(char * table, struct Identifier * id)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 29, __ecereInstance1->__anon1.db.table = table, __ecereInstance1->__anon1.db.id = id, __ecereInstance1;
});
}

struct Expression * MkExpDBIndex(char * table, struct Identifier * id)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 31, __ecereInstance1->__anon1.db.table = table, __ecereInstance1->__anon1.db.id = id, __ecereInstance1;
});
}

struct Expression * MkExpDBTable(char * table)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 30, __ecereInstance1->__anon1.db.table = table, __ecereInstance1;
});
}

struct Expression * MkExpArray(struct __ecereNameSpace__ecere__sys__OldList * expressions)
{
return __extension__ ({
struct Expression * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

__ecereInstance1->type = 35, __ecereInstance1->__anon1.list = expressions, __ecereInstance1;
});
}

struct Specifier * MkEnum(struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * list)
{
struct Specifier * spec = (spec = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier), spec->type = 2, spec->__anon1.__anon2.id = id, spec->__anon1.__anon2.list = list, spec);

if(list && (!declMode || !id))
{
struct Type * type;
struct Enumerator * e;
struct __ecereNameSpace__ecere__sys__OldList specs =
{
0, 0, 0, 0, 0
};

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&specs, spec);
type = ProcessType(&specs, (((void *)0)));
if(id)
{
struct Symbol * symbol = (symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), symbol->string = __ecereNameSpace__ecere__sys__CopyString(id->string), symbol->isStruct = 1, symbol->type = type, symbol);

type->refCount++;
if(strstr(symbol->string, "::"))
curContext->hasNameSpace = 1;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&curContext->structSymbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
FreeSymbol(symbol);
}
for(e = list->first; e; e = e->next)
{
struct Symbol * symbol = (symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), symbol->string = __ecereNameSpace__ecere__sys__CopyString(e->id->string), symbol->type = type, symbol);

type->refCount++;
if(strstr(symbol->string, "::"))
curContext->hasNameSpace = 1;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(curContext->templateTypesOnly ? curContext->parent : curContext)->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
FreeSymbol(symbol);
}
FreeType(type);
}
return spec;
}

struct Specifier * MkStructOrUnion(int type, struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * definitions)
{
struct Specifier * spec = (spec = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier), spec->type = type, spec->__anon1.__anon2.id = id, spec);

if(id && FindType(curContext, id->string))
structDeclMode = 0;
spec->__anon1.__anon2.definitions = definitions;
if(definitions && id && structDeclMode == 0)
{
struct __ecereNameSpace__ecere__sys__OldList specs =
{
0, 0, 0, 0, 0
};
struct Symbol * symbol;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&specs, spec);
symbol = __extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString(id->string), __ecereInstance1->type = ProcessType(&specs, (((void *)0))), __ecereInstance1->isStruct = 1, __ecereInstance1;
});
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&curContext->structSymbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
FreeSymbol(symbol);
}
return spec;
}

void AddStructDefinitions(struct Specifier * spec, struct __ecereNameSpace__ecere__sys__OldList * definitions)
{
spec->__anon1.__anon2.definitions = definitions;
if(definitions && spec->__anon1.__anon2.id && !declMode)
{
struct Symbol * symbol;
struct __ecereNameSpace__ecere__sys__OldList specs =
{
0, 0, 0, 0, 0
};

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&specs, spec);
symbol = __extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString(spec->__anon1.__anon2.id->string), __ecereInstance1->type = ProcessType(&specs, (((void *)0))), __ecereInstance1->isStruct = 1, __ecereInstance1;
});
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&curContext->parent->structSymbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
FreeSymbol(symbol);
}
}

struct Attribute * MkAttribute(char * attr, struct Expression * exp)
{
return __extension__ ({
struct Attribute * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Attribute);

__ecereInstance1->attr = attr, __ecereInstance1->exp = exp, __ecereInstance1;
});
}

struct Attrib * MkAttrib(int type, struct __ecereNameSpace__ecere__sys__OldList * attribs)
{
return __extension__ ({
struct Attrib * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Attrib);

__ecereInstance1->type = type, __ecereInstance1->attribs = attribs, __ecereInstance1;
});
}

struct ExtDecl * MkExtDeclString(char * s)
{
return __extension__ ({
struct ExtDecl * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ExtDecl);

__ecereInstance1->type = 0, __ecereInstance1->__anon1.s = s, __ecereInstance1;
});
}

struct ExtDecl * MkExtDeclAttrib(struct Attrib * attr)
{
return __extension__ ({
struct ExtDecl * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ExtDecl);

__ecereInstance1->type = 1, __ecereInstance1->__anon1.attr = attr, __ecereInstance1;
});
}

struct Declarator * MkDeclaratorIdentifier(struct Identifier * id)
{
return __extension__ ({
struct Declarator * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator);

__ecereInstance1->type = 1, __ecereInstance1->__anon1.identifier = id, __ecereInstance1;
});
}

struct Declarator * MkDeclaratorFunction(struct Declarator * declarator, struct __ecereNameSpace__ecere__sys__OldList * parameters)
{
return __extension__ ({
struct Declarator * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator);

__ecereInstance1->type = 4, __ecereInstance1->declarator = declarator, __ecereInstance1->__anon1.function.parameters = parameters, __ecereInstance1;
});
}

struct Declarator * MkDeclaratorExtended(struct ExtDecl * extended, struct Declarator * declarator)
{
return __extension__ ({
struct Declarator * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator);

__ecereInstance1->type = 6, __ecereInstance1->declarator = declarator, __ecereInstance1->__anon1.extended.extended = extended, __ecereInstance1;
});
}

struct Declarator * MkDeclaratorExtendedEnd(struct ExtDecl * extended, struct Declarator * declarator)
{
return __extension__ ({
struct Declarator * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator);

__ecereInstance1->type = 7, __ecereInstance1->declarator = declarator, __ecereInstance1->__anon1.extended.extended = extended, __ecereInstance1;
});
}

struct Declarator * MkStructDeclarator(struct Declarator * declarator, struct Expression * exp)
{
return __extension__ ({
struct Declarator * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator);

__ecereInstance1->type = 0, __ecereInstance1->declarator = declarator, __ecereInstance1->__anon1.structDecl.exp = exp, __ecereInstance1;
});
}

struct Declarator * MkDeclaratorBrackets(struct Declarator * declarator)
{
return __extension__ ({
struct Declarator * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator);

__ecereInstance1->type = 2, __ecereInstance1->declarator = declarator, __ecereInstance1;
});
}

struct Declarator * MkDeclaratorArray(struct Declarator * declarator, struct Expression * exp)
{
return __extension__ ({
struct Declarator * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator);

__ecereInstance1->type = 3, __ecereInstance1->declarator = declarator, __ecereInstance1->__anon1.array.exp = exp, __ecereInstance1;
});
}

struct Declarator * MkDeclaratorEnumArray(struct Declarator * declarator, struct Specifier * _class)
{
return __extension__ ({
struct Declarator * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator);

__ecereInstance1->type = 3, __ecereInstance1->declarator = declarator, __ecereInstance1->__anon1.array.enumClass = _class, __ecereInstance1;
});
}

struct Declarator * MkDeclaratorPointer(struct Pointer * pointer, struct Declarator * declarator)
{
return __extension__ ({
struct Declarator * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator);

__ecereInstance1->type = 5, __ecereInstance1->declarator = declarator, __ecereInstance1->__anon1.pointer.pointer = pointer, __ecereInstance1;
});
}

struct Enumerator * MkEnumerator(struct Identifier * id, struct Expression * exp)
{
return __extension__ ({
struct Enumerator * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Enumerator);

__ecereInstance1->id = id, __ecereInstance1->exp = exp, __ecereInstance1;
});
}

struct Pointer * MkPointer(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Pointer * pointer)
{
return __extension__ ({
struct Pointer * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Pointer);

__ecereInstance1->qualifiers = qualifiers, __ecereInstance1->pointer = pointer, __ecereInstance1;
});
}

struct Initializer * MkInitializerAssignment(struct Expression * exp)
{
return __extension__ ({
struct Initializer * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Initializer);

__ecereInstance1->type = 0, __ecereInstance1->__anon1.exp = exp, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Initializer * MkInitializerList(struct __ecereNameSpace__ecere__sys__OldList * list)
{
return __extension__ ({
struct Initializer * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Initializer);

__ecereInstance1->type = 1, __ecereInstance1->__anon1.list = list, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct InitDeclarator * MkInitDeclarator(struct Declarator * declarator, struct Initializer * initializer)
{
return __extension__ ({
struct InitDeclarator * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_InitDeclarator);

__ecereInstance1->declarator = declarator, __ecereInstance1->initializer = initializer, __ecereInstance1;
});
}

struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator)
{
if(qualifiers != (((void *)0)))
{
struct Declarator * parentDecl = declarator;
struct Declarator * decl = declarator;

while(decl && decl->type == 3)
decl = decl->declarator;
if(decl && decl->type == 1 && decl->__anon1.identifier->string && CheckType(decl->__anon1.identifier->string) == TYPE_NAME)
{
struct Specifier * spec;

for(spec = qualifiers->first; spec; spec = spec->next)
{
if(spec->type == 0)
{
if(spec->__anon1.specifier == CONST || spec->__anon1.specifier == VOLATILE || spec->__anon1.specifier == EXTERN || spec->__anon1.specifier == STATIC || spec->__anon1.specifier == AUTO || spec->__anon1.specifier == REGISTER)
continue;
break;
}
else if(spec->type != 5)
break;
}
if(!spec)
{
ListAdd(qualifiers, MkSpecifierName(decl->__anon1.identifier->string));
FreeDeclarator(decl);
parentDecl->declarator = (((void *)0));
}
}
}
return __extension__ ({
struct TypeName * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TypeName);

__ecereInstance1->qualifiers = qualifiers, __ecereInstance1->declarator = declarator, __ecereInstance1;
});
}

struct FunctionDefinition * _MkFunction(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct Declarator * declarator, struct __ecereNameSpace__ecere__sys__OldList * declarationList, unsigned int errorOnOmit)
{
if(errorOnOmit)
{
struct Declarator * funcDecl = GetFuncDecl(declarator);

if(funcDecl && funcDecl->__anon1.function.parameters)
{
struct TypeName * tn;

for(tn = (*funcDecl->__anon1.function.parameters).first; tn; tn = tn->next)
{
if(tn->qualifiers || tn->declarator)
{
struct Identifier * declID = tn->declarator ? GetDeclId(tn->declarator) : (((void *)0));

if(!declID)
{
struct Specifier * spec = tn->qualifiers ? (*tn->qualifiers).first : (((void *)0));

if(!tn->declarator && !tn->prev && !tn->next && spec && !spec->next && spec->type == 0 && spec->__anon1.specifier == VOID)
;
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "parameter name omitted\n", (((void *)0))));
break;
}
}
}
}
}
return __extension__ ({
struct FunctionDefinition * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_FunctionDefinition);

__ecereInstance1->specifiers = specifiers, __ecereInstance1->declarator = declarator, __ecereInstance1->declarations = declarationList, __ecereInstance1;
});
}

struct Type * MkClassTypeSymbol(struct Symbol * symbol)
{
if(symbol)
{
struct Type * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), type->kind = 8, type->__anon1._class = symbol, type);

if(!type->__anon1._class)
{
type->kind = 3;
}
type->refCount = 1;
return type;
}
return (((void *)0));
}

struct ClassFunction * MkClassFunction(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct Specifier * _class, struct Declarator * decl, struct __ecereNameSpace__ecere__sys__OldList * declList)
{
return __extension__ ({
struct ClassFunction * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassFunction);

__ecereInstance1->specifiers = specifiers, __ecereInstance1->declarator = decl, __ecereInstance1->declarations = declList, __ecereInstance1;
});
}

struct MemberInit * MkMemberInit(struct __ecereNameSpace__ecere__sys__OldList * ids, struct Initializer * initializer)
{
return __extension__ ({
struct MemberInit * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_MemberInit);

__ecereInstance1->identifiers = ids, __ecereInstance1->initializer = initializer, __ecereInstance1;
});
}

struct MemberInit * MkMemberInitExp(struct Expression * idExp, struct Initializer * initializer)
{
struct MemberInit * init = (init = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_MemberInit), init->initializer = initializer, init->identifiers = MkList(), init);
struct Expression * exp;

for(exp = idExp; exp && exp->type == 8; exp = exp->__anon1.member.exp)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*init->identifiers), (((void *)0)), exp->__anon1.member.member);
exp->__anon1.member.member = (((void *)0));
}
if(exp && exp->type == 0)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*init->identifiers), (((void *)0)), exp->__anon1.__anon1.identifier);
exp->__anon1.__anon1.identifier = (((void *)0));
}
FreeExpression(idExp);
return init;
}

struct MembersInit * MkMembersInitList(struct __ecereNameSpace__ecere__sys__OldList * dataMembers)
{
return __extension__ ({
struct MembersInit * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_MembersInit);

__ecereInstance1->type = 0, __ecereInstance1->__anon1.dataMembers = dataMembers, __ecereInstance1;
});
}

struct MembersInit * MkMembersInitMethod(struct ClassFunction * function)
{
return __extension__ ({
struct MembersInit * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_MembersInit);

__ecereInstance1->type = 1, __ecereInstance1->__anon1.function = function, __ecereInstance1;
});
}

struct Instantiation * MkInstantiation(struct Specifier * _class, struct Expression * exp, struct __ecereNameSpace__ecere__sys__OldList * members)
{
return __extension__ ({
struct Instantiation * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);

__ecereInstance1->_class = _class, __ecereInstance1->exp = exp, __ecereInstance1->members = members, __ecereInstance1;
});
}

struct Instantiation * MkInstantiationNamed(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Expression * exp, struct __ecereNameSpace__ecere__sys__OldList * members)
{
struct Instantiation * inst = (inst = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation), inst->exp = exp, inst->members = members, inst);

if(specs != (((void *)0)))
{
struct Specifier * spec;

for(spec = specs->first; spec; spec = spec->next)
if(spec->type == 1)
{
inst->_class = spec;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(specs, spec);
break;
}
FreeList(specs, (void *)(FreeSpecifier));
if(!spec)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Expecting class specifier\n", (((void *)0))));
inst->_class = MkSpecifierName("");
}
}
return inst;
}

struct Context * PushContext()
{
struct Context * ctx = (ctx = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ctx->parent = curContext, ctx);

curContext = ctx;
return ctx;
}

struct AsmField * MkAsmField(char * command, struct Expression * expression, struct Identifier * symbolic)
{
return __extension__ ({
struct AsmField * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_AsmField);

__ecereInstance1->command = command, __ecereInstance1->expression = expression, __ecereInstance1->symbolic = symbolic, __ecereInstance1;
});
}

struct PropertyWatch * MkDeleteWatch(struct Statement * compound)
{
return __extension__ ({
struct PropertyWatch * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_PropertyWatch);

__ecereInstance1->compound = compound, __ecereInstance1->deleteWatch = 1, __ecereInstance1;
});
}

struct PropertyWatch * MkPropertyWatch(struct __ecereNameSpace__ecere__sys__OldList * properties, struct Statement * compound)
{
return __extension__ ({
struct PropertyWatch * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_PropertyWatch);

__ecereInstance1->compound = compound, __ecereInstance1->properties = properties, __ecereInstance1;
});
}

struct DBTableDef * MkDBTableDef(char * name, struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * definitions)
{
return __extension__ ({
struct DBTableDef * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_DBTableDef);

__ecereInstance1->name = name, __ecereInstance1->symbol = symbol, __ecereInstance1->definitions = definitions, __ecereInstance1;
});
}

struct DBTableEntry * MkDBFieldEntry(struct TypeName * type, struct Identifier * id, char * name)
{
return __extension__ ({
struct DBTableEntry * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_DBTableEntry);

__ecereInstance1->type = 0, __ecereInstance1->__anon1.__anon1.dataType = type, __ecereInstance1->id = id, __ecereInstance1->__anon1.__anon1.name = name, __ecereInstance1;
});
}

struct DBTableEntry * MkDBIndexEntry(struct __ecereNameSpace__ecere__sys__OldList * items, struct Identifier * id)
{
return __extension__ ({
struct DBTableEntry * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_DBTableEntry);

__ecereInstance1->type = 1, __ecereInstance1->__anon1.items = items, __ecereInstance1->id = id, __ecereInstance1;
});
}

struct DBIndexItem * MkDBIndexItem(struct Identifier * id, int order)
{
return __extension__ ({
struct DBIndexItem * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_DBIndexItem);

__ecereInstance1->id = id, __ecereInstance1->order = order, __ecereInstance1;
});
}

void __ecereCreateModuleInstances_ast()
{
intlStrings = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__Map_TPL_ContextStringPair__ecere__com__List_TPL_Location___);
__ecereNameSpace__ecere__com__eInstance_IncRef(intlStrings);
}

struct TemplateParameter * MkTypeTemplateParameter(struct Identifier * identifier, struct TemplateDatatype * baseTplDatatype, struct TemplateArgument * defaultArgument)
{
if(identifier->string)
{
struct TemplateParameter * param = (param = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplateParameter), param->type = 0, param->identifier = identifier, param->__anon1.dataType = baseTplDatatype, param->defaultArgument = defaultArgument, param);
struct TemplatedType * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplatedType), type->key = (uintptr_t)identifier->string, type->param = param, type);

if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&curContext->templateTypes, (struct __ecereNameSpace__ecere__sys__BTNode *)type))
((type ? (__ecereClass_TemplatedType->Destructor ? __ecereClass_TemplatedType->Destructor((void *)type) : 0, __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor ? __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor((void *)type) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(type)) : 0), type = 0);
return param;
}
return (((void *)0));
}

void OutputIntlStrings()
{
if(((struct __ecereNameSpace__ecere__com__CustomAVLTree *)(((char *)intlStrings + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->count)
{
const char * srcFile = GetSourceFile();
const char * objFile = GetOutputFile();
char srcFileFixed[797];
char potFile[797];
struct __ecereNameSpace__ecere__com__Instance * f;

__ecereNameSpace__ecere__sys__ChangeExtension(objFile, "bowl", potFile);
f = __ecereNameSpace__ecere__sys__FileOpen(potFile, 2);
if(f)
{
const char * filePrefix = "";

if(!(srcFile[0] && (srcFile[1] == ':' || srcFile[0] == '/')))
filePrefix = "./";
__ecereNameSpace__ecere__sys__GetSlashPathBuffer(srcFileFixed, srcFile);
{
struct __ecereNameSpace__ecere__com__MapIterator s = (s.container = (void *)0, s.pointer = (void *)0, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(&s, (intlStrings)), s);

while(__ecereMethod___ecereNameSpace__ecere__com__Iterator_Next((void *)(&s)))
{
struct ContextStringPair pair = (*(struct ContextStringPair *)(uintptr_t)__ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_key(&s));

{
struct __ecereNameSpace__ecere__com__Iterator l =
{
((struct __ecereNameSpace__ecere__com__Instance *)(uintptr_t)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data((void *)(&s))), 0
};

while(__ecereMethod___ecereNameSpace__ecere__com__Iterator_Next(&l))
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "#: %s%s:%d\n", filePrefix, srcFileFixed, (*(struct Location *)(uintptr_t)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&l)).start.line);
}
if(pair.context)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "msgctxt \"%s\"\n", pair.context);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "msgid \"%s\"\n", pair.string);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "msgstr \"%s\"\n\n", pair.string);
}
}
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}
((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = intlStrings;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Free])(intlStrings);
}
}

void __ecereUnregisterModule_ast(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

unsigned int ModuleAccess(struct __ecereNameSpace__ecere__com__Instance * searchIn, struct __ecereNameSpace__ecere__com__Instance * searchFor)
{
struct __ecereNameSpace__ecere__com__SubModule * subModule;

if(searchFor == searchIn)
return 1;
for(subModule = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)searchIn + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->modules.first; subModule; subModule = subModule->next)
{
if(subModule->importMode == 1)
{
if(ModuleAccess(subModule->module, searchFor))
return 1;
}
}
return 0;
}

struct Expression * MkExpIntlString(const char * string, const char * context)
{
if(inCompiler)
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
char * s;

if(inCompiler)
{
struct ContextStringPair pair =
{
0, 0
};
struct __ecereNameSpace__ecere__com__Instance * list;
int len = strlen(string);

pair.string = __ecereNameSpace__ecere__com__eSystem_New(sizeof(unsigned char) * (len - 2 + 1));
memcpy(pair.string, string + 1, len - 2);
pair.string[len - 2] = '\0';
if(context)
{
len = strlen(context);
pair.context = __ecereNameSpace__ecere__com__eSystem_New(sizeof(unsigned char) * (len - 2 + 1));
memcpy(pair.context, context + 1, len - 2);
pair.context[len - 2] = '\0';
}
list = (((struct __ecereNameSpace__ecere__com__Instance *)((uintptr_t)(__extension__ ({
struct __ecereNameSpace__ecere__com__Iterator __internalIterator =
{
intlStrings, 0
};

__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(&__internalIterator, ((uint64)(uintptr_t)(&pair)), 0);
((struct __ecereNameSpace__ecere__com__Instance *)(uintptr_t)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&__internalIterator));
})))));
if(!list)
{
list = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__List_TPL_Location_);
__extension__ ({
struct __ecereNameSpace__ecere__com__Iterator __internalIterator =
{
intlStrings, 0
};

__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(&__internalIterator, ((uint64)(uintptr_t)(&pair)), 1);
__ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(&__internalIterator, ((uint64)((uintptr_t)(list))));
});
}
else
{
(__ecereNameSpace__ecere__com__eSystem_Delete(pair.string), pair.string = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(pair.context), pair.context = 0);
}
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = list;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__List->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(list, (uint64)(uintptr_t)(&yylloc));
}
s = QMkString(i18nModuleName ? i18nModuleName : "");
ListAdd(list, MkExpString(s));
(__ecereNameSpace__ecere__com__eSystem_Delete(s), s = 0);
ListAdd(list, MkExpString(string));
if(context)
{
int lenString = strlen(string), lenContext = strlen(context);
char * msgid = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (lenString - 2 + lenContext - 2 + 4));

msgid[0] = '\"';
memcpy(msgid + 1, context + 1, lenContext - 2);
msgid[1 + lenContext - 2] = 4;
memcpy(msgid + 1 + lenContext - 2 + 1, string + 1, lenString - 2);
memcpy(msgid + 1 + lenContext - 2 + 1 + lenString - 2, "\"", 2);
ListAdd(list, MkExpString(msgid));
(__ecereNameSpace__ecere__com__eSystem_Delete(msgid), msgid = 0);
}
else
ListAdd(list, QMkExpId("null"));
return MkExpCall(QMkExpId("GetTranslatedString"), list);
}
else
{
struct Expression * e = MkExpString(string);

e->__anon1.__anon2.intlString = 1;
return e;
}
}

struct ModuleImport * FindModule(struct __ecereNameSpace__ecere__com__Instance * moduleToFind)
{
struct ModuleImport * module;

if(!((struct __ecereNameSpace__ecere__com__Module *)(((char *)moduleToFind + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name)
return mainModule;
for(module = (*imports).first; module; module = module->next)
if(module->name && !strcmp(module->name, ((struct __ecereNameSpace__ecere__com__Module *)(((char *)moduleToFind + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name))
break;
if(!module)
{
module = __extension__ ({
struct ModuleImport * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ModuleImport);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(((struct __ecereNameSpace__ecere__com__Module *)(((char *)moduleToFind + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->name), __ecereInstance1->importType = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)moduleToFind + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->importType, __ecereInstance1->importAccess = ModuleAccess(privateModule, moduleToFind) ? 1 : 2, __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*imports), module);
}
return module;
}

struct Symbol * FindClass(const char * name)
{
struct Symbol * cl = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * _class;
unsigned int global = 0;
char fullName[1024];

if(name[0] == ':' && name[1] == ':')
{
global = 1;
name += 2;
}
if(!global && (currentNameSpace || defaultNameSpace) && declMode != 0 && defaultDeclMode != 0)
{
int len = 0, stringLen;

if(defaultNameSpace)
{
memcpy(fullName, defaultNameSpace, defaultNameSpaceLen);
len += defaultNameSpaceLen;
fullName[len++] = ':';
fullName[len++] = ':';
}
if(currentNameSpace)
{
memcpy(fullName + len, currentNameSpace, currentNameSpaceLen);
len += currentNameSpaceLen;
fullName[len++] = ':';
fullName[len++] = ':';
}
stringLen = strlen(name);
memcpy(fullName + len, name, stringLen);
len += stringLen;
fullName[len] = 0;
cl = globalContext ? (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&globalContext->classes, fullName) : (((void *)0));
}
if(!cl)
cl = globalContext ? (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&globalContext->classes, name) : (((void *)0));
if(!cl && !global)
{
for(cl = globalContext ? (struct Symbol *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&globalContext->classes) : (((void *)0)); cl; cl = (struct Symbol *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)cl)))
{
if(cl->shortName && !strcmp(cl->shortName, name))
break;
}
}
if(!cl)
{
_class = (((void *)0));
if(!global && (currentNameSpace || defaultNameSpace) && declMode != 0 && defaultDeclMode != 0)
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, fullName);
if(!_class)
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, name);
if(_class)
{
name = _class->fullName;
cl = (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&globalContext->classes, name);
if(!cl)
{
cl = __extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString(name), __ecereInstance1->__anon1.registered = _class, __ecereInstance1->notYetDeclared = 1, __ecereInstance1->imported = 1, __ecereInstance1;
});
_class->symbol = cl;
if(_class->module)
cl->module = FindModule(_class->module);
else
cl->module = mainModule;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->classes, (struct __ecereNameSpace__ecere__sys__BTNode *)cl))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), cl);
if(strcmp(name, _class->name))
cl->shortName = __ecereNameSpace__ecere__sys__CopyString(_class->name);
}
}
}
return cl;
}

struct Identifier * MkIdentifier(const char * string)
{
struct Identifier * id = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Identifier);
int c;

id->_class = (((void *)0));
if(string)
{
const char * namePart;
unsigned int gotColon = 0;

for(c = strlen(string) - 1; c >= 0; c--)
if(string[c] == ':')
{
gotColon = 1;
break;
}
namePart = string + c + 1;
while(c >= 0 && string[c] == ':')
c--;
if(c >= 0)
{
char name[1024];
struct Symbol * symbol;

memcpy(name, string, c + 1);
name[c + 1] = '\0';
if(!strcmp(name, "typed_object"))
{
id->_class = MkSpecifierName("typed_object");
id->string = __ecereNameSpace__ecere__sys__CopyString(namePart);
}
else if(!strcmp(name, "property"))
{
id->_class = MkSpecifierName("property");
id->string = __ecereNameSpace__ecere__sys__CopyString(namePart);
}
else if(!strcmp(name, "typed_object&"))
{
id->_class = MkSpecifierName("typed_object&");
id->string = __ecereNameSpace__ecere__sys__CopyString(namePart);
}
else if(!strcmp(name, "any_object"))
{
id->_class = MkSpecifierName("any_object");
id->string = __ecereNameSpace__ecere__sys__CopyString(namePart);
}
else
{
struct TemplatedType * templatedType = FindTemplateTypeParameter(curContext, name);

if(templatedType)
{
id->_class = __extension__ ({
struct Specifier * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier);

__ecereInstance1->type = 8, __ecereInstance1->__anon1.templateParameter = templatedType->param, __ecereInstance1;
});
id->string = __ecereNameSpace__ecere__sys__CopyString(namePart);
}
else
{
symbol = FindClass(name);
if(symbol)
{
id->_class = _MkSpecifierName(symbol->string, symbol, (((void *)0)));
id->string = __ecereNameSpace__ecere__sys__CopyString(namePart);
}
else
id->string = __ecereNameSpace__ecere__sys__CopyString(string);
}
}
}
else if(gotColon)
{
id->_class = MkSpecifierName((((void *)0)));
id->string = __ecereNameSpace__ecere__sys__CopyString(namePart);
}
else
id->string = __ecereNameSpace__ecere__sys__CopyString(string);
}
else
id->string = __ecereNameSpace__ecere__sys__CopyString("");
return id;
}

void SetClassTemplateArgs(struct Specifier * spec, struct __ecereNameSpace__ecere__sys__OldList * templateArgs)
{
if(spec->type == 1)
{
struct Symbol * symbol = spec->__anon1.__anon1.symbol;

spec->__anon1.__anon1.templateArgs = templateArgs;
if(templateArgs && templateArgs->first)
{
char templateString[1024];
struct TemplateArgument * arg;

strcpy(templateString, symbol ? symbol->string : spec->__anon1.__anon1.name);
strcat(templateString, "<");
for(arg = templateArgs->first; arg; arg = arg->next)
{
char argument[256];

argument[0] = '\0';
switch(arg->type)
{
case 2:
{
char expString[1024];
struct __ecereNameSpace__ecere__com__Class * backupThisClass = thisClass;

thisClass = (((void *)0));
expString[0] = '\0';
PrintExpression(arg->__anon1.expression, expString);
strcat(argument, expString);
thisClass = backupThisClass;
break;
}
case 1:
{
strcat(argument, arg->__anon1.identifier->string);
break;
}
case 0:
{
char * typeString = StringFromSpecDecl(arg->__anon1.templateDatatype->specifiers, arg->__anon1.templateDatatype->decl);

strcat(argument, typeString);
(__ecereNameSpace__ecere__com__eSystem_Delete(typeString), typeString = 0);
break;
}
}
if(argument[0])
{
if(arg->prev)
strcat(templateString, ", ");
if(arg->name)
{
strcat(templateString, arg->name->string);
strcat(templateString, " = ");
}
strcat(templateString, argument);
}
}
{
int len = strlen(templateString);

if(templateString[len - 1] == '>')
templateString[len++] = ' ';
templateString[len++] = '>';
templateString[len++] = '\0';
}
symbol = FindClass(templateString);
if(!symbol && spec->__anon1.__anon1.symbol)
{
symbol = _DeclClass((((void *)0)), templateString);
symbol->notYetDeclared = 1;
}
if(spec->__anon1.__anon1.symbol)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&spec->__anon1.__anon1.symbol->templatedClasses, __extension__ ({
struct __ecereNameSpace__ecere__sys__OldLink * __ecereInstance1 = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__sys__OldLink));

__ecereInstance1->data = symbol, __ecereInstance1;
}));
(__ecereNameSpace__ecere__com__eSystem_Delete(spec->__anon1.__anon1.name), spec->__anon1.__anon1.name = 0);
spec->__anon1.__anon1.symbol = symbol;
spec->__anon1.__anon1.name = __ecereNameSpace__ecere__sys__CopyString(symbol ? symbol->string : templateString);
}
}
else
FreeList(templateArgs, (void *)(FreeTemplateArgument));
}

struct Symbol * _DeclClass(struct Specifier * _class, const char * name)
{
struct Symbol * symbol;
char nameBuffer[1024];

if(_class)
{
strcpy(nameBuffer, _class->__anon1.__anon1.name ? _class->__anon1.__anon1.name : "");
strcat(nameBuffer, "::");
strcat(nameBuffer, name);
name = nameBuffer;
}
symbol = FindClass(name);
if(!symbol)
{
if(name[0] == ':' && name[1] == ':')
name += 2;
symbol = __extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString(name), __ecereInstance1->notYetDeclared = 1, __ecereInstance1;
});
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->classes, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
{
int start = 0, c;
char ch;

for(c = 0; (ch = name[c]); c++)
{
if(ch == '.' || (ch == ':' && name[c + 1] == ':'))
{
if(ch == ':')
c++;
start = c + 1;
}
}
if(start && c - start)
symbol->shortName = __ecereNameSpace__ecere__sys__CopyString(name + start);
}
}
return symbol;
}

int CheckType(const char * text)
{
if(inIDE)
{
if(!strcmp(text, "WINAPI"))
return EXT_DECL;
else if(!strcmp(text, "BOOL") || !strcmp(text, "WINUSERAPI"))
return TYPE_NAME;
}
if(FindTemplateTypeParameter(curContext, text))
{
return TYPE_NAME;
}
if(FindType(curContext, text))
{
return TYPE_NAME;
}
if(FindClass(text))
{
return TYPE_NAME;
}
return IDENTIFIER;
}

struct Type * MkClassType(const char * name)
{
if(name)
{
struct Type * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), type->kind = 8, type->__anon1._class = FindClass(name), type);

if(!type->__anon1._class)
{
type->kind = 3;
}
type->refCount = 1;
return type;
}
return (((void *)0));
}

struct TypeName * MkTypeNameGuessDecl(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator)
{
if(qualifiers != (((void *)0)))
{
unsigned int gotType = 0;
unsigned int gotFullType = 0;
struct Specifier * spec, * next;

for(spec = qualifiers->first; spec; spec = next)
{
next = spec->next;
if(gotType && !declarator && ((spec->type == 1 && spec->__anon1.__anon1.name) || (spec->type == 0 && gotFullType)))
{
const char * s = (((void *)0));

if(spec->type == 1)
{
char * colon = __ecereNameSpace__ecere__sys__RSearchString(spec->__anon1.__anon1.name, "::", strlen(spec->__anon1.__anon1.name), 1, 0);

s = colon ? colon + 2 : spec->__anon1.__anon1.name;
}
else if(spec->type == 0)
{
if(spec->__anon1.specifier == INT64)
s = "int64";
}
if(s)
{
declarator = MkDeclaratorIdentifier(MkIdentifier(s));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(qualifiers, spec);
FreeSpecifier(spec);
spec = (((void *)0));
}
}
if(spec && spec->type != 5)
{
if(spec->type == 0)
{
if(spec->__anon1.specifier == CONST || spec->__anon1.specifier == VOLATILE || spec->__anon1.specifier == EXTERN || spec->__anon1.specifier == STATIC || spec->__anon1.specifier == AUTO || spec->__anon1.specifier == REGISTER)
continue;
else if(spec->__anon1.specifier != UNSIGNED && spec->__anon1.specifier != SIGNED && spec->__anon1.specifier != LONG)
gotFullType = 1;
gotType = 1;
}
else
{
gotFullType = 1;
gotType = 1;
}
}
}
}
return __extension__ ({
struct TypeName * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TypeName);

__ecereInstance1->qualifiers = qualifiers, __ecereInstance1->declarator = declarator, __ecereInstance1;
});
}

void SetupBaseSpecs(struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * baseSpecs)
{
if(baseSpecs && baseSpecs->first && ((struct Specifier *)baseSpecs->first)->type == 1)
{
char name[1024];
struct Symbol * baseClass;
char * tpl;

strcpy(name, ((struct Specifier *)baseSpecs->first)->__anon1.__anon1.name);
tpl = strchr(name, '<');
if(tpl)
*tpl = 0;
baseClass = FindClass(name);
if(baseClass && baseClass->ctx)
{
struct TemplatedType * copy;

for(copy = (struct TemplatedType *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&baseClass->ctx->templateTypes); copy; copy = (struct TemplatedType *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next((void *)(copy)))
{
struct TemplatedType * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplatedType), type->key = copy->key, type->param = copy->param, type);

if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&curContext->templateTypes, (struct __ecereNameSpace__ecere__sys__BTNode *)type))
((type ? (__ecereClass_TemplatedType->Destructor ? __ecereClass_TemplatedType->Destructor((void *)type) : 0, __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor ? __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor((void *)type) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(type)) : 0), type = 0);
}
}
else if(baseClass && baseClass->__anon1.registered)
{
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = baseClass->__anon1.registered; sClass; sClass = sClass->base)
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
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&curContext->templateTypes, (struct __ecereNameSpace__ecere__sys__BTNode *)type))
((type ? (__ecereClass_TemplatedType->Destructor ? __ecereClass_TemplatedType->Destructor((void *)type) : 0, __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor ? __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor((void *)type) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(type)) : 0), type = 0);
}
}
}
}
}
}

struct Specifier * _MkSpecifierName(const char * name, struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * templateArgs)
{
struct Specifier * spec = (spec = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier), spec->type = 1, spec);

if(name)
{
if(!symbol)
{
struct TemplatedType * templatedType = FindTemplateTypeParameter(curContext, name);

if(templatedType)
{
spec->__anon1.templateParameter = templatedType->param;
spec->type = 8;
return spec;
}
else
symbol = FindClass(name);
}
if(symbol && symbol->__anon1.registered && symbol->__anon1.registered->isRemote == 1)
{
char className[1024];

strcpy(className, "DCOMClient_");
if(!strncmp(name, className, strlen(className)))
spec->__anon1.__anon1.name = __ecereNameSpace__ecere__sys__CopyString(name);
else
{
strcat(className, name);
spec->__anon1.__anon1.name = __ecereNameSpace__ecere__sys__CopyString(className);
}
}
else if(symbol)
{
char nameSpace[1024];
char * c = strstr(name, symbol->string);

spec->__anon1.__anon1.name = __ecereNameSpace__ecere__sys__CopyString(symbol->string);
if(c && c >= name + 2 && c[-1] == ':' && c[-2] == ':')
{
if(c > name + 2)
{
memcpy(nameSpace, name, c - name - 2);
nameSpace[c - name] = 0;
spec->__anon1.__anon1.nsSpec = _MkSpecifierName(nameSpace, (((void *)0)), (((void *)0)));
}
else
spec->__anon1.__anon1.nsSpec = _MkSpecifierName((((void *)0)), (((void *)0)), (((void *)0)));
}
}
else
spec->__anon1.__anon1.name = __ecereNameSpace__ecere__sys__CopyString(name);
spec->__anon1.__anon1.symbol = symbol;
if(templateArgs != (((void *)0)))
SetClassTemplateArgs(spec, templateArgs);
}
return spec;
}

struct ClassDef;

struct Expression *  GetTemplateArgExpByName(const char *  paramName, struct __ecereNameSpace__ecere__com__Class *  curClass, int tplType);

struct Expression * GetTemplateArgExp(struct TemplateParameter * param, struct __ecereNameSpace__ecere__com__Class * curClass, unsigned int pointer)
{
return param->identifier ? GetTemplateArgExpByName(param->identifier->string, curClass, 0) : (((void *)0));
}

struct Declaration;

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
} ecere_gcc_struct __anon1;
int importType;
struct External * fwdDecl;
struct __ecereNameSpace__ecere__com__Instance * outgoing;
struct __ecereNameSpace__ecere__com__Instance * incoming;
int nonBreakableIncoming;
} ecere_gcc_struct;

struct Declaration * MkDeclarationInst(struct Instantiation * inst)
{
struct Declaration * decl = (decl = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declaration), decl->type = 2, decl->__anon1.inst = inst, decl->loc = yylloc, decl);
struct Symbol * symbol;

if(curContext == globalContext && (currentNameSpace || defaultNameSpace) && declMode != 0 && defaultDeclMode != 0)
{
char name[1024];
int len = 0, stringLen;

if(defaultNameSpace)
{
memcpy(name, defaultNameSpace, defaultNameSpaceLen);
len += defaultNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
if(currentNameSpace)
{
memcpy(name + len, currentNameSpace, currentNameSpaceLen);
len += currentNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
stringLen = strlen(inst->exp->__anon1.__anon1.identifier->string);
memcpy(name + len, inst->exp->__anon1.__anon1.identifier->string, stringLen);
len += stringLen;
name[len] = 0;
(__ecereNameSpace__ecere__com__eSystem_Delete(inst->exp->__anon1.__anon1.identifier->string), inst->exp->__anon1.__anon1.identifier->string = 0);
inst->exp->__anon1.__anon1.identifier->string = __ecereNameSpace__ecere__sys__CopyString(name);
}
symbol = __extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = (inst->exp->type == 0) ? __ecereNameSpace__ecere__sys__CopyString(inst->exp->__anon1.__anon1.identifier->string) : (((void *)0)), __ecereInstance1->type = MkClassTypeSymbol(inst->_class->__anon1.__anon1.symbol), __ecereInstance1;
});
if(strstr(symbol->string, "::"))
curContext->hasNameSpace = 1;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(curContext->templateTypesOnly ? curContext->parent : curContext)->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
decl->symbol = inst->symbol = symbol;
return decl;
}

struct Declaration * MkDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators)
{
struct Declaration * decl = (decl = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declaration), decl->type = 1, decl->__anon1.__anon1.declarators = initDeclarators, decl->__anon1.__anon1.specifiers = specifiers, decl->loc = yylloc, decl);
unsigned int variable = 1;

if(specifiers != (((void *)0)))
{
unsigned int gotType = 0;
struct Specifier * spec, * next;

for(spec = specifiers->first; spec; spec = next)
{
next = spec->next;
if(spec->type == 0 && spec->__anon1.specifier == TYPEDEF)
{
if(initDeclarators != (((void *)0)))
{
struct InitDeclarator * d;

for(d = initDeclarators->first; d; d = d->next)
{
if(GetDeclId(d->declarator)->string)
{
struct Symbol * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), type->string = __ecereNameSpace__ecere__sys__CopyString(GetDeclId(d->declarator)->string), type->type = ProcessType(specifiers, d->declarator), type);

if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(curContext->templateTypesOnly ? curContext->parent : curContext)->types, (struct __ecereNameSpace__ecere__sys__BTNode *)type))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), type);
decl->symbol = d->declarator->symbol = type;
}
}
}
else if(spec->next)
{
spec = specifiers->last;
{
if((spec->type == 1 && spec->__anon1.__anon1.name) || spec->type == 0)
{
const char * s = (((void *)0));

if(spec->type == 1)
{
const char * colon = __ecereNameSpace__ecere__sys__RSearchString(spec->__anon1.__anon1.name, "::", strlen(spec->__anon1.__anon1.name), 1, 0);

s = colon ? colon + 2 : spec->__anon1.__anon1.name;
}
else if(spec->type == 0)
{
if(spec->__anon1.specifier == INT64)
s = "int64";
}
if(s)
{
struct Symbol * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), type->string = __ecereNameSpace__ecere__sys__CopyString(s), type->type = ProcessType(specifiers, (((void *)0))), type);

decl->symbol = type;
decl->__anon1.__anon1.declarators = initDeclarators = MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(s)), (((void *)0))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(specifiers, spec);
FreeSpecifier(spec);
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(curContext->templateTypesOnly ? curContext->parent : curContext)->types, (struct __ecereNameSpace__ecere__sys__BTNode *)type))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), type);
}
}
}
}
variable = 0;
break;
}
else if(spec->type == 0 && (spec->__anon1.specifier == STRUCT || spec->__anon1.specifier == UNION))
variable = 0;
else
{
if(gotType && initDeclarators == (((void *)0)) && !spec->next && ((spec->type == 1 && spec->__anon1.__anon1.name) || spec->type == 0))
{
const char * s = (((void *)0));

if(spec->type == 1)
{
char * colon = __ecereNameSpace__ecere__sys__RSearchString(spec->__anon1.__anon1.name, "::", strlen(spec->__anon1.__anon1.name), 1, 0);

s = colon ? colon + 2 : spec->__anon1.__anon1.name;
}
else if(spec->type == 0)
{
if(spec->__anon1.specifier == INT64)
s = "int64";
}
if(s)
{
decl->__anon1.__anon1.declarators = initDeclarators = MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(s)), (((void *)0))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(specifiers, spec);
FreeSpecifier(spec);
spec = (((void *)0));
}
}
}
if(spec && spec->type != 5)
gotType = 1;
}
}
if(variable && initDeclarators)
{
struct InitDeclarator * d;

for(d = initDeclarators->first; d; d = d->next)
{
struct Identifier * id = GetDeclId(d->declarator);

if(id && id->string && id->string[0])
{
if(curContext)
{
struct Symbol * symbol;

if(curContext == globalContext && (currentNameSpace || defaultNameSpace) && declMode != 0 && defaultDeclMode != 0)
{
char name[1024];
int len = 0, stringLen;

if(defaultNameSpace)
{
memcpy(name, defaultNameSpace, defaultNameSpaceLen);
len += defaultNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
if(currentNameSpace)
{
memcpy(name + len, currentNameSpace, currentNameSpaceLen);
len += currentNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
stringLen = strlen(id->string);
memcpy(name + len, id->string, stringLen);
len += stringLen;
name[len] = 0;
(__ecereNameSpace__ecere__com__eSystem_Delete(id->string), id->string = 0);
id->string = __ecereNameSpace__ecere__sys__CopyString(name);
}
symbol = (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(curContext->templateTypesOnly ? curContext->parent : curContext)->symbols, id->string);
if(!symbol && strcmp(id->string, "strlen"))
{
symbol = __extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString(id->string), __ecereInstance1->type = ProcessType(specifiers, d->declarator), __ecereInstance1;
});
if(strstr(symbol->string, "::"))
curContext->hasNameSpace = 1;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(curContext->templateTypesOnly ? curContext->parent : curContext)->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
if(symbol->type && symbol->type->kind == 12 && !symbol->type->__anon1.__anon4.arraySizeExp && d->initializer)
{
if(d->initializer->type == 1)
{
char string[256];

sprintf(string, "%d", (*d->initializer->__anon1.list).count);
symbol->type->__anon1.__anon4.arraySizeExp = MkExpConstant(string);
symbol->type->__anon1.__anon4.freeExp = 1;
}
else if(d->initializer->type == 0 && d->initializer->__anon1.exp->type == 3 && d->initializer->__anon1.exp->__anon1.__anon2.string)
{
char string[256];
int c, count = 0;
char ch;
unsigned int escaped = 0;
char * s = d->initializer->__anon1.exp->__anon1.__anon2.string;

if(s[0] == 'L')
s++;
for(c = 1; (ch = s[c]); c++)
{
if(ch == '\\' && !escaped)
escaped = 1;
else
{
count++;
escaped = 0;
}
}
sprintf(string, "%d", count);
symbol->type->__anon1.__anon4.arraySizeExp = MkExpConstant(string);
symbol->type->__anon1.__anon4.freeExp = 1;
}
}
}
decl->symbol = d->declarator->symbol = symbol;
}
}
}
}
else
{
decl->symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), decl->symbol);
}
return decl;
}

struct Declaration * MkStructDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * declarators, struct Specifier * extStorage)
{
struct Declaration * decl = (decl = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declaration), decl->type = 0, decl->__anon1.__anon1.declarators = declarators, decl->__anon1.__anon1.specifiers = specifiers, decl->extStorage = extStorage, decl->loc = yylloc, decl);

if(specifiers != (((void *)0)))
{
unsigned int gotType = 0;
struct Specifier * spec, * next;

for(spec = specifiers->first; spec; spec = next)
{
next = spec->next;
if(gotType && declarators == (((void *)0)) && ((spec->type == 1 && spec->__anon1.__anon1.name) || spec->type == 0))
{
const char * s = (((void *)0));

if(spec->type == 1)
{
const char * colon = __ecereNameSpace__ecere__sys__RSearchString(spec->__anon1.__anon1.name, "::", strlen(spec->__anon1.__anon1.name), 1, 0);

s = colon ? colon + 2 : spec->__anon1.__anon1.name;
}
else if(spec->type == 0)
{
if(spec->__anon1.specifier == INT64)
s = "int64";
}
if(s)
{
decl->__anon1.__anon1.declarators = declarators = MkListOne(MkStructDeclarator(MkDeclaratorIdentifier(MkIdentifier(s)), (((void *)0))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(specifiers, spec);
FreeSpecifier(spec);
spec = (((void *)0));
}
}
if(spec && spec->type != 5)
gotType = 1;
}
}
return decl;
}

struct Declaration * MkDeclarationClassInst(struct Instantiation * inst)
{
return __extension__ ({
struct Declaration * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declaration);

__ecereInstance1->type = 2, __ecereInstance1->__anon1.inst = inst, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Declaration * MkDeclarationDefine(struct Identifier * id, struct Expression * exp)
{
struct Declaration * decl = (decl = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declaration), decl->type = 3, decl->__anon1.__anon2.id = id, decl->__anon1.__anon2.exp = exp, decl->loc = yylloc, decl);
char expString[1024];

expString[0] = '\0';
PrintExpression(exp, expString);
if(curContext == globalContext && (currentNameSpace || defaultNameSpace) && declMode != 0 && defaultDeclMode != 0)
{
char name[1024];
int len = 0, stringLen;

if(defaultNameSpace)
{
memcpy(name, defaultNameSpace, defaultNameSpaceLen);
len += defaultNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
if(currentNameSpace)
{
memcpy(name + len, currentNameSpace, currentNameSpaceLen);
len += currentNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
stringLen = strlen(id->string);
memcpy(name + len, id->string, stringLen);
len += stringLen;
name[len] = 0;
(__ecereNameSpace__ecere__com__eSystem_Delete(id->string), id->string = 0);
id->string = __ecereNameSpace__ecere__sys__CopyString(name);
}
if(!__ecereNameSpace__ecere__com__eSystem_FindDefine(privateModule, id->string))
__ecereNameSpace__ecere__com__eSystem_RegisterDefine(id->string, expString, privateModule, buildingECERECOMModule ? 4 : 1);
else
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "Redefinition of %s ignored\n", (((void *)0))), id->string);
return decl;
}

struct Statement * MkLabeledStmt(struct Identifier * id, struct Statement * statement)
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 0, __ecereInstance1->__anon1.labeled.id = id, __ecereInstance1->__anon1.labeled.stmt = statement, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Statement * MkCaseStmt(struct Expression * exp, struct Statement * statement)
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 1, __ecereInstance1->__anon1.caseStmt.exp = exp, __ecereInstance1->__anon1.caseStmt.stmt = statement, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Statement * MkIfStmt(struct __ecereNameSpace__ecere__sys__OldList * exp, struct Statement * statement, struct Statement * elseStmt)
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 4, __ecereInstance1->__anon1.ifStmt.exp = exp, __ecereInstance1->__anon1.ifStmt.stmt = statement, __ecereInstance1->__anon1.ifStmt.elseStmt = elseStmt, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Statement * MkSwitchStmt(struct __ecereNameSpace__ecere__sys__OldList * exp, struct Statement * statement)
{
if(statement)
statement->__anon1.compound.isSwitch = 1;
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 5, __ecereInstance1->__anon1.switchStmt.exp = exp, __ecereInstance1->__anon1.switchStmt.stmt = statement, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Statement * MkWhileStmt(struct __ecereNameSpace__ecere__sys__OldList * exp, struct Statement * statement)
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 6, __ecereInstance1->__anon1.whileStmt.exp = exp, __ecereInstance1->__anon1.whileStmt.stmt = statement, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Statement * MkDoWhileStmt(struct Statement * statement, struct __ecereNameSpace__ecere__sys__OldList * exp)
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 7, __ecereInstance1->__anon1.doWhile.exp = exp, __ecereInstance1->__anon1.doWhile.stmt = statement, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Statement * MkForStmt(struct Statement * init, struct Statement * check, struct __ecereNameSpace__ecere__sys__OldList * inc, struct Statement * statement)
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 8, __ecereInstance1->__anon1.forStmt.init = init, __ecereInstance1->__anon1.forStmt.check = check, __ecereInstance1->__anon1.forStmt.increment = inc, __ecereInstance1->__anon1.forStmt.stmt = statement, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Statement * MkForEachStmt(struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * exp, struct __ecereNameSpace__ecere__sys__OldList * filter, struct Statement * statement)
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 18, __ecereInstance1->__anon1.forEachStmt.id = id, __ecereInstance1->__anon1.forEachStmt.exp = exp, __ecereInstance1->__anon1.forEachStmt.filter = filter, __ecereInstance1->__anon1.forEachStmt.stmt = statement, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

void ProcessFunctionBody(struct FunctionDefinition * func, struct Statement * body)
{
struct Declarator * declarator = func->declarator;
struct Declarator * funcDecl = GetFuncDecl(declarator);
struct Symbol * symbol;

func->body = body;
if(funcDecl && funcDecl->__anon1.function.parameters && body)
{
struct Context * context = body->__anon1.compound.context;
struct TypeName * param;

for(param = (*funcDecl->__anon1.function.parameters).first; param; param = param->next)
{
if(param->declarator)
{
struct Symbol * symbol = (((void *)0));
struct Identifier * id = GetDeclId(param->declarator);
char * string = id ? id->string : (((void *)0));

if(string)
{
for(symbol = (struct Symbol *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&context->symbols); symbol; symbol = (struct Symbol *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)symbol)))
if(!strcmp(symbol->string, string))
break;
if(!symbol && id)
{
symbol = __extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString(id->string), __ecereInstance1->type = ProcessType(param->qualifiers, param->declarator), __ecereInstance1->isParam = 1, __ecereInstance1;
});
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
param->declarator->symbol = symbol;
}
}
}
}
}
if(!declarator->symbol)
{
struct Identifier * id = GetDeclId(declarator);

if((currentNameSpace || defaultNameSpace) && declMode != 0 && defaultDeclMode != 0 && strcmp(id->string, "__on_register_module"))
{
char name[1024];
int len = 0, stringLen;

if(defaultNameSpace)
{
memcpy(name, defaultNameSpace, defaultNameSpaceLen);
len += defaultNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
if(currentNameSpace)
{
memcpy(name + len, currentNameSpace, currentNameSpaceLen);
len += currentNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
stringLen = strlen(id->string);
memcpy(name + len, id->string, stringLen);
len += stringLen;
name[len] = 0;
(__ecereNameSpace__ecere__com__eSystem_Delete(id->string), id->string = 0);
id->string = __ecereNameSpace__ecere__sys__CopyString(name);
}
symbol = __extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString(id->string), __ecereInstance1->type = ProcessType(func->specifiers, declarator), __ecereInstance1;
});
if(strstr(symbol->string, "::"))
globalContext->hasNameSpace = 1;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
declarator->symbol = symbol;
}
else
{
symbol = declarator->symbol;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*excludedSymbols), declarator->symbol);
(__ecereNameSpace__ecere__com__eSystem_Delete(symbol->string), symbol->string = 0);
symbol->string = __ecereNameSpace__ecere__sys__CopyString(GetDeclId(declarator)->string);
if(strstr(symbol->string, "::"))
globalContext->hasNameSpace = 1;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
if(!symbol->type)
symbol->type = ProcessType(func->specifiers, declarator);
}
if(symbol->type && (symbol->type->kind == 11 || symbol->type->kind == 16))
{
if(!symbol->type->__anon1.__anon2.params.count)
{
struct Type * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), type->refCount = 1, type);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&symbol->type->__anon1.__anon2.params, type);
}
}
else
{
}
}

void ProcessClassFunctionBody(struct ClassFunction * func, struct Statement * body)
{
struct Symbol * symbol;
struct Declarator * decl = func->declarator;
struct Declarator * funcDecl = GetFuncDecl(func->declarator);

func->body = body;
if(decl && !decl->symbol)
{
struct __ecereNameSpace__ecere__sys__OldList * symbolSpecs = MkList();

if(funcDecl && funcDecl->__anon1.function.parameters && body)
{
struct Context * context = body->__anon1.compound.context;
struct TypeName * param;

for(param = (*funcDecl->__anon1.function.parameters).first; param; param = param->next)
{
if(param->declarator)
{
struct Symbol * symbol = (((void *)0));
struct Identifier * id = GetDeclId(param->declarator);
char * string = id ? id->string : (((void *)0));

if(string)
{
symbol = (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&context->symbols, string);
}
if(!symbol && id)
{
symbol = __extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString(id->string), __ecereInstance1->type = ProcessType(param->qualifiers, param->declarator), __ecereInstance1->isParam = 1, __ecereInstance1;
});
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
param->declarator->symbol = symbol;
}
}
}
}
symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);
{
struct Identifier * id = GetDeclId(funcDecl);

if(id)
{
int c;

for(c = strlen(id->string) - 1; c >= 0; c--)
{
if(id->string[c] == ':')
{
char * string = __ecereNameSpace__ecere__sys__CopyString(id->string + c + 1);

id->string[c - 1] = 0;
id->_class = MkSpecifierName(id->string);
(__ecereNameSpace__ecere__com__eSystem_Delete(id->string), id->string = 0);
id->string = string;
break;
}
}
symbol->string = __ecereNameSpace__ecere__sys__CopyString(id->string);
}
}
if(func->specifiers)
{
struct Specifier * spec;

for(spec = (*func->specifiers).first; spec; spec = spec->next)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*symbolSpecs), CopySpecifier(spec));
}
symbol->type = ProcessType(symbolSpecs, decl);
decl->symbol = symbol;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
FreeList(symbolSpecs, (void *)(FreeSpecifier));
}
}

struct Statement * MkCompoundStmt(struct __ecereNameSpace__ecere__sys__OldList * declarations, struct __ecereNameSpace__ecere__sys__OldList * statements)
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 2, __ecereInstance1->__anon1.compound.declarations = declarations, __ecereInstance1->__anon1.compound.statements = statements, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Statement * MkExpressionStmt(struct __ecereNameSpace__ecere__sys__OldList * expressions)
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 3, __ecereInstance1->__anon1.expressions = expressions, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Statement * MkBadDeclStmt(struct Declaration * decl)
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 14, __ecereInstance1->__anon1.decl = decl, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Statement * MkGotoStmt(struct Identifier * id)
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 9, __ecereInstance1->__anon1.gotoStmt.id = id, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Statement * MkContinueStmt()
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 10, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Statement * MkBreakStmt()
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 11, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Statement * MkReturnStmt(struct __ecereNameSpace__ecere__sys__OldList * exp)
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 12, __ecereInstance1->__anon1.expressions = exp, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct Statement * MkAsmStmt(struct Specifier * spec, char * statements, struct __ecereNameSpace__ecere__sys__OldList * inputFields, struct __ecereNameSpace__ecere__sys__OldList * outputFields, struct __ecereNameSpace__ecere__sys__OldList * clobberedFields)
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 13, __ecereInstance1->__anon1.asmStmt.spec = spec, __ecereInstance1->__anon1.asmStmt.statements = statements, __ecereInstance1->__anon1.asmStmt.inputFields = inputFields, __ecereInstance1->__anon1.asmStmt.outputFields = outputFields, __ecereInstance1->__anon1.asmStmt.clobberedFields = clobberedFields, __ecereInstance1;
});
}

struct Statement * MkFireWatchersStmt(struct Expression * object, struct __ecereNameSpace__ecere__sys__OldList * watches)
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 15, __ecereInstance1->__anon1._watch.object = object, __ecereInstance1->__anon1._watch.watches = watches, __ecereInstance1;
});
}

struct Statement * MkStopWatchingStmt(struct Expression * watcher, struct Expression * object, struct __ecereNameSpace__ecere__sys__OldList * watches)
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 16, __ecereInstance1->__anon1._watch.watcher = watcher, __ecereInstance1->__anon1._watch.object = object, __ecereInstance1->__anon1._watch.watches = watches, __ecereInstance1;
});
}

struct Statement * MkWatchStmt(struct Expression * watcher, struct Expression * object, struct __ecereNameSpace__ecere__sys__OldList * watches)
{
return __extension__ ({
struct Statement * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement);

__ecereInstance1->type = 17, __ecereInstance1->__anon1._watch.watcher = watcher, __ecereInstance1->__anon1._watch.object = object, __ecereInstance1->__anon1._watch.watches = watches, __ecereInstance1;
});
}

struct External * MkExternalFunction(struct FunctionDefinition * function)
{
struct External * external = (external = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_External), external->type = 0, external->__anon1.function = function, external->symbol = function->declarator->symbol, external);

if(function->specifiers)
{
struct Specifier * spec;

for(spec = (*function->specifiers).first; spec; spec = spec->next)
if(spec->type == 0 && spec->__anon1.specifier == STATIC)
{
structDeclMode = declMode = 3;
break;
}
}
if(external->symbol && !external->symbol->__anon2.__anon3.methodExternal)
external->symbol->__anon2.__anon3.methodExternal = external;
return external;
}

struct External * MkExternalImport(char * name, int importType, int importAccess)
{
struct External * external = (external = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_External), external->type = 3, external);
int len = strlen(name) - 2;

external->__anon1.importString = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (len + 1));
strncpy(external->__anon1.importString, name + 1, len);
external->__anon1.importString[len] = '\0';
(__ecereNameSpace__ecere__com__eSystem_Delete(name), name = 0);
{
ImportModule(external->__anon1.importString, importType, importAccess, 1);
ImportModule(external->__anon1.importString, importType, importAccess, 0);
}
return external;
}

struct ClassDefinition * MkClass(struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * baseSpecs, struct __ecereNameSpace__ecere__sys__OldList * definitions)
{
struct ClassDefinition * classDef;

SetupBaseSpecs(symbol, baseSpecs);
if(symbol->ctx)
{
struct ClassDefinition * classDef = symbol->ctx->classDef;

if(classDef)
{
struct External * external;

for(external = (*ast).first; external; external = external->next)
{
if(external->type == 2 && external->__anon1._class == classDef)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*ast), external);
FreeExternal(external);
break;
}
}
}
FreeContext(symbol->ctx);
((symbol->ctx ? (__ecereClass_Context->Destructor ? __ecereClass_Context->Destructor((void *)symbol->ctx) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(symbol->ctx)) : 0), symbol->ctx = 0);
}
symbol->ctx = curContext;
classDef = __extension__ ({
struct ClassDefinition * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDefinition);

__ecereInstance1->symbol = symbol, __ecereInstance1->_class = MkSpecifierName(symbol->string), __ecereInstance1->baseSpecs = baseSpecs, __ecereInstance1->definitions = definitions, __ecereInstance1->nameLoc = symbol->nameLoc, __ecereInstance1;
});
curContext->classDef = classDef;
return classDef;
}

struct Expression * GetTemplateArgExpByName(const char * paramName, struct __ecereNameSpace__ecere__com__Class * curClass, int tplType)
{
struct Expression * argExp = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * _class = curClass ? curClass : ((curExternal && curExternal->type == 0 && curExternal->__anon1.function) ? curExternal->__anon1.function->_class : (((void *)0)));

if(_class)
{
int id = 0;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * curParam;
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = _class; sClass; sClass = sClass->base)
{
id = 0;
for(curParam = sClass->templateParams.first; curParam; curParam = curParam->next)
{
if(!strcmp(curParam->name, paramName))
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
if(curParam && curParam->type != tplType)
curParam = (((void *)0));
if(curParam)
{
char idString[32];
char className[1024];

sprintf(idString, "%d", id);
strcpy(className, "__ecereClass_");
FullClassNameCat(className, _class->fullName, 1);
DeclareClass(curExternal, FindClass(_class->fullName), className);
argExp = MkExpIndex((MkExpMember)(MkExpMember(MkExpIdentifier(MkIdentifier("this")), MkIdentifier("_class")), MkIdentifier("templateArgs")), MkListOne(MkExpConstant(idString)));
}
}
return argExp;
}

struct External * MkExternalDeclaration(struct Declaration * declaration)
{
struct External * external = (external = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_External), external->type = 1, external->__anon1.declaration = declaration, external->symbol = declaration ? declaration->symbol : (((void *)0)), external);

if(declaration && declaration->type == 1 && declaration->__anon1.__anon1.specifiers)
{
struct Specifier * spec;

for(spec = (*declaration->__anon1.__anon1.specifiers).first; spec; spec = spec->next)
if(spec->type == 0 && spec->__anon1.specifier == TYPEDEF)
{
structDeclMode = declMode = 0;
break;
}
else if(spec->type == 0 && spec->__anon1.specifier == STATIC)
{
structDeclMode = declMode = 3;
break;
}
}
if(declaration && declaration->symbol && !declaration->symbol->__anon2.__anon3.methodExternal)
declaration->symbol->__anon2.__anon3.methodExternal = external;
return external;
}

struct External * MkExternalNameSpace(struct Identifier * identifier)
{
struct External * external = (external = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_External), external->type = 4, external->__anon1.id = identifier, external);

currentNameSpace = identifier ? identifier->string : (((void *)0));
currentNameSpaceLen = currentNameSpace ? strlen(currentNameSpace) : 0;
return external;
}

struct External * MkExternalClass(struct ClassDefinition * _class)
{
return __extension__ ({
struct External * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_External);

__ecereInstance1->type = 2, __ecereInstance1->__anon1._class = _class, __ecereInstance1->symbol = _class->symbol, __ecereInstance1;
});
}

struct External * MkExternalDBTable(struct DBTableDef * table)
{
return __extension__ ({
struct External * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_External);

__ecereInstance1->type = 5, __ecereInstance1->__anon1.table = table, __ecereInstance1;
});
}

struct PropertyDef;

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

struct ClassDef * MkClassDefFunction(struct ClassFunction * function)
{
struct ClassDef * def = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef);

if(function && function->declarator)
{
struct Declarator * funcDecl = GetFuncDecl(function->declarator);

if(funcDecl && funcDecl->declarator && funcDecl->declarator->type == 2)
{
def->type = 2;
def->__anon1.decl = MkStructDeclaration(function->specifiers, MkListOne(MkStructDeclarator(function->declarator, (((void *)0)))), (((void *)0)));
function->declarator = (((void *)0));
function->specifiers = (((void *)0));
FreeClassFunction(function);
return def;
}
}
def->type = 0;
def->__anon1.function = function;
return def;
}

static struct Type * ProcessTypeSpecs(struct __ecereNameSpace__ecere__sys__OldList * specs, unsigned int assumeEllipsis, unsigned int keepTypeName)
{
struct Type * specType = (specType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), specType->refCount = 1, specType->kind = 3, specType->isSigned = 1, specType);

if(specs != (((void *)0)))
{
unsigned int isTypedef = 0;
struct Specifier * spec;
unsigned int isLong = 0;

for(spec = specs->first; spec; spec = spec->next)
{
if(spec->type == 5)
{
struct ExtDecl * extDecl = spec->__anon1.__anon1.extDecl;

if(extDecl->type == 0)
{
if(!strcmp(spec->__anon1.__anon1.extDecl->__anon1.s, "__declspec(dllexport)") || !strcmp(spec->__anon1.__anon1.extDecl->__anon1.s, "dllexport"))
specType->dllExport = 1;
else if(!strcmp(spec->__anon1.__anon1.extDecl->__anon1.s, "__declspec(stdcall)") || !strcmp(spec->__anon1.__anon1.extDecl->__anon1.s, "stdcall"))
specType->attrStdcall = 1;
}
else if(extDecl->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldList * attribs = extDecl->__anon1.attr->attribs;

if(attribs)
{
struct Attribute * attr;

for(attr = (*attribs).first; attr; attr = attr->next)
{
char * s = attr->attr;

if(s)
{
if(!strcmp(s, "dllexport"))
specType->dllExport = 1;
else if(!strcmp(s, "stdcall"))
specType->attrStdcall = 1;
}
}
}
specType->keepCast = 1;
}
}
if(spec->__anon1.specifier != CONST && (specType->kind == 9 || specType->kind == 10))
{
FreeType(specType);
specType = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->kind = 3, __ecereInstance1->isSigned = 1, __ecereInstance1->refCount = 1, __ecereInstance1;
});
}
if(isTypedef && keepTypeName)
{
specType->kind = 18;
return specType;
}
else if(spec->type == 0)
{
if(spec->__anon1.specifier == TYPEDEF)
isTypedef = 1;
else if(spec->__anon1.specifier == VOID)
specType->kind = 0;
else if(spec->__anon1.specifier == CHAR)
specType->kind = 1;
else if(spec->__anon1.specifier == INT)
{
if(specType->kind != 2 && specType->kind != 5 && !isLong)
specType->kind = 3;
}
else if(spec->__anon1.specifier == _BOOL || spec->__anon1.specifier == BOOL)
specType->kind = 24;
else if(spec->__anon1.specifier == UINT)
{
if(specType->kind != 2 && specType->kind != 5)
specType->kind = 3;
specType->isSigned = 0;
}
else if(spec->__anon1.specifier == INT64)
specType->kind = 4;
else if(spec->__anon1.specifier == VALIST)
specType->kind = 17;
else if(spec->__anon1.specifier == SHORT)
specType->kind = 2;
else if(spec->__anon1.specifier == LONG)
{
if(isLong || (targetBits == 64 && targetPlatform != 1))
specType->kind = 4;
else
specType->kind = 3;
specType->isLong = 1;
isLong = 1;
}
else if(spec->__anon1.specifier == FLOAT)
specType->kind = 6;
else if(spec->__anon1.specifier == DOUBLE)
specType->kind = 7;
else if(spec->__anon1.specifier == SIGNED)
specType->isSigned = 1;
else if(spec->__anon1.specifier == UNSIGNED)
specType->isSigned = 0;
else if(spec->__anon1.specifier == CONST)
specType->constant = 1;
else if(spec->__anon1.specifier == TYPED_OBJECT || spec->__anon1.specifier == ANY_OBJECT || spec->__anon1.specifier == CLASS)
{
switch(spec->__anon1.specifier)
{
case TYPED_OBJECT:
specType->classObjectType = 2;
break;
case ANY_OBJECT:
specType->classObjectType = 3;
break;
case CLASS:
specType->classObjectType = 1;
break;
}
specType->kind = 8;
specType->__anon1._class = FindClass("class");
}
else if(spec->__anon1.specifier == THISCLASS)
specType->kind = 21;
}
else if(spec->type == 1)
{
if(spec->__anon1.__anon1.name && (!strcmp(spec->__anon1.__anon1.name, "intptr") || !strcmp(spec->__anon1.__anon1.name, "uintptr")))
{
specType->kind = 22;
if(!strcmp(spec->__anon1.__anon1.name, "uintptr"))
specType->isSigned = 0;
}
else if(spec->__anon1.__anon1.name && (!strcmp(spec->__anon1.__anon1.name, "uintsize") || !strcmp(spec->__anon1.__anon1.name, "intsize")))
{
specType->kind = 23;
if(!strcmp(spec->__anon1.__anon1.name, "uintsize"))
specType->isSigned = 0;
}
else
{
struct Symbol * symbol = spec->__anon1.__anon1.name ? FindType(curContext, spec->__anon1.__anon1.name) : (((void *)0));

if(symbol && symbol->type)
{
unsigned int isConstant = specType->constant;
struct Type * dummy = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

*dummy = *specType;
FreeType(dummy);
CopyTypeInto(specType, symbol->type);
specType->constant = isConstant;
(__ecereNameSpace__ecere__com__eSystem_Delete(specType->typeName), specType->typeName = 0);
specType->typeName = __ecereNameSpace__ecere__sys__CopyString(symbol->type->name);
}
else if(!isTypedef)
{
specType->__anon1._class = spec->__anon1.__anon1.name ? FindClass(spec->__anon1.__anon1.name) : (((void *)0));
specType->kind = 8;
if(!specType->__anon1._class)
specType->kind = 3;
}
}
}
else if(spec->type == 2)
{
specType->kind = 15;
specType->__anon1.__anon1.enumName = spec->__anon1.__anon2.id ? __ecereNameSpace__ecere__sys__CopyString(spec->__anon1.__anon2.id->string) : (((void *)0));
if(spec->__anon1.__anon2.list)
{
struct Enumerator * e;

for(e = (*spec->__anon1.__anon2.list).first; e; e = e->next)
{
struct __ecereNameSpace__ecere__sys__NamedLink64 * i = (i = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__sys__NamedLink64)), i->name = __ecereNameSpace__ecere__sys__CopyString(e->id->string), i);

if(e->exp && e->exp->type == 2 && e->exp->__anon1.__anon1.constant)
i->data = strtoll(e->exp->__anon1.__anon1.constant, (((void *)0)), 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&specType->__anon1.__anon1.members, i);
}
}
}
else if(spec->type == 8)
{
specType->kind = 20;
specType->__anon1.templateParameter = spec->__anon1.templateParameter;
}
else if(spec->type == 3 || spec->type == 4)
{
struct Symbol * _class = spec->__anon1.__anon2.id ? FindClass(spec->__anon1.__anon2.id->string) : (((void *)0));

if(_class)
{
specType->declaredWithStruct = 1;
if(!_class->__anon1.registered || _class->__anon1.registered->type != 1)
specType->directClassAccess = 1;
specType->__anon1._class = _class;
specType->kind = 8;
break;
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear(&specType->__anon1.__anon1.members);
if(spec->type == 3)
specType->kind = 9;
else if(spec->type == 4)
specType->kind = 10;
if(spec->__anon1.__anon2.id)
{
if(!spec->__anon1.__anon2.definitions && !isTypedef)
{
struct Symbol * symbol = spec->__anon1.__anon2.id->string ? FindSymbol(spec->__anon1.__anon2.id->string, curContext, globalContext, 1, 0) : (((void *)0));

if(symbol && symbol->type)
{
*specType = *symbol->type;
specType->name = __ecereNameSpace__ecere__sys__CopyString(symbol->type->name);
specType->typeName = __ecereNameSpace__ecere__sys__CopyString(spec->__anon1.__anon1.name);
specType->__anon1.__anon1.enumName = __ecereNameSpace__ecere__sys__CopyString(symbol->type->__anon1.__anon1.enumName);
specType->refCount = 1;
if(symbol->type->kind == 15)
{
struct __ecereNameSpace__ecere__sys__NamedLink64 * member;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear(&specType->__anon1.__anon1.members);
for(member = symbol->type->__anon1.__anon1.members.first; member; member = member->next)
{
struct __ecereNameSpace__ecere__sys__NamedLink64 * item = (item = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__sys__NamedLink64)), item->name = __ecereNameSpace__ecere__sys__CopyString(member->name), item->data = member->data, item);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&specType->__anon1.__anon1.members, item);
}
}
else if(symbol->type->kind == 9 || symbol->type->kind == 10)
{
struct Type * member;

for(member = specType->__anon1.__anon1.members.first; member; member = member->next)
member->refCount++;
}
else if(symbol->type->kind == 11)
{
struct Type * param;

specType->__anon1.__anon2.returnType->refCount++;
for(param = specType->__anon1.__anon2.params.first; param; param = param->next)
param->refCount++;
}
else if(symbol->type->kind == 13 || symbol->type->kind == 12)
{
specType->__anon1.type->refCount++;
if(symbol->type->kind == 12)
{
if(specType->__anon1.__anon4.arraySizeExp)
specType->__anon1.__anon4.arraySizeExp = CopyExpression(specType->__anon1.__anon4.arraySizeExp);
}
}
}
else
specType->__anon1.__anon1.enumName = __ecereNameSpace__ecere__sys__CopyString(spec->__anon1.__anon2.id->string);
}
else
specType->__anon1.__anon1.enumName = __ecereNameSpace__ecere__sys__CopyString(spec->__anon1.__anon2.id->string);
}
if(spec->__anon1.__anon2.definitions)
{
struct ClassDef * def;

for(def = (*spec->__anon1.__anon2.definitions).first; def; def = def->next)
{
if(def->type == 2 && def->__anon1.decl->type == 0)
{
struct Declaration * decl = def->__anon1.decl;

if(decl->__anon1.__anon1.declarators)
{
struct Declarator * d;

for(d = (*decl->__anon1.__anon1.declarators).first; d; d = d->next)
{
struct Type * memberType = ProcessType(decl->__anon1.__anon1.specifiers, d);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&specType->__anon1.__anon1.members, memberType);
}
}
else if(decl->__anon1.__anon1.specifiers)
{
struct Type * memberType = ProcessType(decl->__anon1.__anon1.specifiers, (((void *)0)));

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&specType->__anon1.__anon1.members, memberType);
}
}
}
}
break;
}
else if(spec->type == 7)
{
specType->kind = 19;
specType->__anon1._class = spec->__anon1._class->__anon1.__anon1.symbol;
}
}
}
else if(assumeEllipsis)
specType->kind = 14;
return specType;
}

struct ClassDef * MkClassDefAccessOverride(int access, struct Identifier * id)
{
return __extension__ ({
struct ClassDef * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef);

__ecereInstance1->type = 13, __ecereInstance1->__anon1.__anon1.id = id, __ecereInstance1->memberAccess = access, __ecereInstance1;
});
}

struct ClassDef * MkClassDefMemberAccess()
{
return __extension__ ({
struct ClassDef * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef);

__ecereInstance1->type = 12, __ecereInstance1;
});
}

struct ClassDef * MkClassDefDeclaration(struct Declaration * decl)
{
return __extension__ ({
struct ClassDef * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef);

__ecereInstance1->type = 2, __ecereInstance1->__anon1.decl = decl, __ecereInstance1;
});
}

struct ClassDef * MkClassDefClassData(struct Declaration * decl)
{
return __extension__ ({
struct ClassDef * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef);

__ecereInstance1->type = 9, __ecereInstance1->__anon1.decl = decl, __ecereInstance1;
});
}

struct ClassDef * MkClassDefDesigner(const char * designer)
{
return __extension__ ({
struct ClassDef * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef);

__ecereInstance1->type = 5, __ecereInstance1->__anon1.designer = __ecereNameSpace__ecere__sys__CopyString(designer), __ecereInstance1;
});
}

struct ClassDef * MkClassDefNoExpansion()
{
return __extension__ ({
struct ClassDef * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef);

__ecereInstance1->type = 6, __ecereInstance1;
});
}

struct ClassDef * MkClassDefFixed()
{
return __extension__ ({
struct ClassDef * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef);

__ecereInstance1->type = 7, __ecereInstance1;
});
}

struct ClassDef * MkClassDefDesignerDefaultProperty(struct Identifier * id)
{
return __extension__ ({
struct ClassDef * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef);

__ecereInstance1->type = 8, __ecereInstance1->__anon1.defaultProperty = id, __ecereInstance1;
});
}

struct ClassDef * MkClassDefDefaultProperty(struct __ecereNameSpace__ecere__sys__OldList * defProperties)
{
return __extension__ ({
struct ClassDef * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef);

__ecereInstance1->type = 1, __ecereInstance1->__anon1.defProperties = defProperties, __ecereInstance1;
});
}

struct ClassDef * MkClassDefProperty(struct PropertyDef * propertyDef)
{
return __extension__ ({
struct ClassDef * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef);

__ecereInstance1->type = 3, __ecereInstance1->__anon1.propertyDef = propertyDef, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct ClassDef * MkClassDefClassProperty(struct PropertyDef * propertyDef)
{
return __extension__ ({
struct ClassDef * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef);

__ecereInstance1->type = 10, __ecereInstance1->__anon1.propertyDef = propertyDef, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct ClassDef * MkClassDefClassPropertyValue(struct Identifier * id, struct Initializer * initializer)
{
return __extension__ ({
struct ClassDef * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef);

__ecereInstance1->type = 11, __ecereInstance1->__anon1.__anon1.id = id, __ecereInstance1->__anon1.__anon1.initializer = initializer, __ecereInstance1->loc = yylloc, __ecereInstance1;
});
}

struct ClassDef * MkClassDefPropertyWatch(struct PropertyWatch * watcher)
{
return __extension__ ({
struct ClassDef * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef);

__ecereInstance1->type = 4, __ecereInstance1->__anon1.propertyWatch = watcher, __ecereInstance1;
});
}

struct PropertyDef * MkProperty(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl, struct Identifier * id, struct Statement * setStmt, struct Statement * getStmt)
{
struct PropertyDef * prop = (prop = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_PropertyDef), prop->specifiers = specs, prop->declarator = decl, prop->setStmt = setStmt, prop->getStmt = getStmt, prop);
struct Symbol * symbol;
struct Type * type = ProcessType(specs, decl);

if(!id)
{
char typeString[1024];

typeString[0] = '\0';
PrintTypeNoConst(type, typeString, 0, 1);
id = MkIdentifier(typeString);
prop->__anon1.conversion = 1;
}
prop->id = id;
symbol = __extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString(id->string), __ecereInstance1->type = type, __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
prop->symbol = symbol;
return prop;
}

static struct Type * ProcessTypeDecls(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl, struct Type * parentType)
{
struct Type * type = parentType;
struct Declarator * subDecl = decl ? decl->declarator : (((void *)0));

if(!parentType)
type = ProcessTypeSpecs(specs, decl == (((void *)0)), (decl && decl->type == 7) ? 1 : 0);
if(decl)
{
switch(decl->type)
{
case 2:
break;
case 6:
case 7:
{
struct ExtDecl * extDecl = decl->__anon1.extended.extended;

if(extDecl)
{
switch(extDecl->type)
{
case 0:
{
char * s = extDecl->__anon1.s;

if(s)
{
if(!strcmp(s, "__declspec(dllexport)") || !strcmp(s, "dllexport"))
type->dllExport = 1;
else if(!strcmp(s, "__declspec(stdcall)") || !strcmp(s, "stdcall"))
type->attrStdcall = 1;
}
break;
}
case 1:
{
struct __ecereNameSpace__ecere__sys__OldList * attribs = extDecl->__anon1.attr->attribs;

if(attribs)
{
struct Attribute * attr;

for(attr = (*attribs).first; attr; attr = attr->next)
{
char * s = attr->attr;

if(s)
{
if(!strcmp(s, "dllexport"))
type->dllExport = 1;
else if(!strcmp(s, "stdcall"))
type->attrStdcall = 1;
}
}
}
type->keepCast = 1;
break;
}
}
}
break;
}
case 0:
{
struct Expression * exp = decl->__anon1.structDecl.exp;

if(exp)
{
ProcessExpressionType(exp);
ComputeExpression(exp);
if(exp->type == 2)
type->bitFieldCount = (unsigned int)strtoul(exp->__anon1.__anon1.constant, (((void *)0)), 0);
}
break;
}
case 4:
{
type = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1->kind = 11, __ecereInstance1->__anon1.__anon2.returnType = type, __ecereInstance1->dllExport = type->dllExport, __ecereInstance1->attrStdcall = type->attrStdcall, __ecereInstance1;
});
if(decl->__anon1.function.parameters)
{
struct TypeName * param;

for(param = (*decl->__anon1.function.parameters).first; param; param = param->next)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&type->__anon1.__anon2.params, ProcessType(param->qualifiers, param->declarator));
}
break;
}
case 3:
{
type = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1->kind = 12, __ecereInstance1->__anon1.__anon4.arraySizeExp = CopyExpression(decl->__anon1.array.exp), __ecereInstance1->__anon1.__anon4.freeExp = 1, __ecereInstance1->__anon1.type = type, __ecereInstance1->dllExport = type->dllExport, __ecereInstance1->attrStdcall = type->attrStdcall, __ecereInstance1;
});
if(decl->__anon1.array.enumClass)
type->__anon1.__anon4.enumClass = decl->__anon1.array.enumClass->__anon1.__anon1.symbol;
break;
}
case 5:
{
struct Pointer * pointer = decl->__anon1.pointer.pointer;

while(pointer)
{
struct __ecereNameSpace__ecere__sys__OldList * qualifiers = pointer->qualifiers;

if(type->classObjectType)
type->byReference = 1;
else
type = __extension__ ({
struct Type * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

__ecereInstance1->refCount = 1, __ecereInstance1->kind = 13, __ecereInstance1->__anon1.type = type, __ecereInstance1->dllExport = type->dllExport, __ecereInstance1->attrStdcall = type->attrStdcall, __ecereInstance1;
});
if(qualifiers)
{
struct Specifier * spec;

for(spec = (*qualifiers).first; spec; spec = spec->next)
{
if(spec->type == 0 && spec->__anon1.specifier == CONST)
type->constant = 1;
}
}
pointer = pointer->pointer;
}
break;
}
case 1:
{
struct Identifier * id = decl->__anon1.identifier;
struct Specifier * _class = id->_class;

(__ecereNameSpace__ecere__com__eSystem_Delete(type->name), type->name = 0);
type->name = __ecereNameSpace__ecere__sys__CopyString(id->string);
if(_class)
{
if(_class->type == 8)
{
type->__anon1.__anon2.thisClassTemplate = _class->__anon1.templateParameter;
type->extraParam = 1;
}
else
{
char * name = _class->__anon1.__anon1.name;

if(!name)
type->__anon1.__anon2.staticMethod = 1;
else
{
if(!id->classSym)
id->classSym = _class->__anon1.__anon1.symbol;
if(name[strlen(name) - 1] == '&')
{
type->__anon1.__anon2.thisClass = FindClass("class");
type->byReference = 1;
}
else
type->__anon1.__anon2.thisClass = _class->__anon1.__anon1.symbol;
if(type->__anon1.__anon2.thisClass && strcmp(type->__anon1.__anon2.thisClass->string, "class"))
type->extraParam = 1;
else if(!strcmp(name, "any_object"))
{
type->extraParam = 1;
type->__anon1.__anon2.thisClass = FindClass("class");
}
else if(!strcmp(name, "class"))
{
type->__anon1.__anon2.thisClass = FindClass("class");
type->classObjectType = 1;
}
else if(!strcmp(name, "typed_object") || !strcmp(name, "typed_object&"))
{
type->__anon1.__anon2.thisClass = FindClass("class");
type->classObjectType = 2;
}
}
}
}
break;
}
default:
__ecereNameSpace__ecere__com__PrintLn(__ecereClass_char__PTR_, "Unhandled Declarator Type: ", __ecereClass_DeclaratorType, (void *)&decl->type, (void *)0);
}
}
if(subDecl)
{
struct Type * curType = type;

type = ProcessTypeDecls((((void *)0)), subDecl, type);
if(curType && type->kind != 11)
{
curType->__anon1.__anon2.thisClassTemplate = type->__anon1.__anon2.thisClassTemplate;
curType->extraParam = type->extraParam;
curType->__anon1.__anon2.staticMethod = type->__anon1.__anon2.staticMethod;
curType->__anon1.__anon2.thisClass = type->__anon1.__anon2.thisClass;
curType->byReference = type->byReference;
curType->classObjectType = type->classObjectType;
}
}
return type;
}

void __ecereRegisterModule_ast(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetDefaultNameSpace", "void SetDefaultNameSpace(const char * s)", SetDefaultNameSpace, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetStrictNameSpaces", "void SetStrictNameSpaces(bool b)", SetStrictNameSpaces, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetDeclMode", "void SetDeclMode(ecere::com::AccessMode accessMode)", SetDeclMode, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetDefaultDeclMode", "void SetDefaultDeclMode(ecere::com::AccessMode accessMode)", SetDefaultDeclMode, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetCurrentNameSpace", "void SetCurrentNameSpace(const char * s)", SetCurrentNameSpace, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkList", "ecere::sys::OldList * MkList(void)", MkList, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkListOne", "ecere::sys::OldList * MkListOne(void * item)", MkListOne, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ListAdd", "void ListAdd(ecere::sys::OldList list, void * item)", ListAdd, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ListAddFront", "void ListAddFront(ecere::sys::OldList list, void * item)", ListAddFront, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkIdentifier", "Identifier MkIdentifier(const char * string)", MkIdentifier, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkTypeTemplateParameter", "TemplateParameter MkTypeTemplateParameter(Identifier identifier, TemplateDatatype baseTplDatatype, TemplateArgument defaultArgument)", MkTypeTemplateParameter, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkIdentifierTemplateParameter", "TemplateParameter MkIdentifierTemplateParameter(Identifier identifier, ecere::com::TemplateMemberType memberType, TemplateArgument defaultArgument)", MkIdentifierTemplateParameter, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpressionTemplateParameter", "TemplateParameter MkExpressionTemplateParameter(Identifier identifier, TemplateDatatype dataType, TemplateArgument defaultArgument)", MkExpressionTemplateParameter, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkTemplateDatatype", "TemplateDatatype MkTemplateDatatype(ecere::sys::OldList * specifiers, Declarator decl)", MkTemplateDatatype, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkTemplateTypeArgument", "TemplateArgument MkTemplateTypeArgument(TemplateDatatype tplDatatype)", MkTemplateTypeArgument, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkTemplateExpressionArgument", "TemplateArgument MkTemplateExpressionArgument(Expression expr)", MkTemplateExpressionArgument, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkTemplateIdentifierArgument", "TemplateArgument MkTemplateIdentifierArgument(Identifier ident)", MkTemplateIdentifierArgument, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpExtensionCompound", "Expression MkExpExtensionCompound(Statement compound)", MkExpExtensionCompound, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpExtensionExpression", "Expression MkExpExtensionExpression(ecere::sys::OldList * expressions)", MkExpExtensionExpression, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpExtensionInitializer", "Expression MkExpExtensionInitializer(TypeName typeName, Initializer initializer)", MkExpExtensionInitializer, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpIdentifier", "Expression MkExpIdentifier(Identifier id)", MkExpIdentifier, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpDummy", "Expression MkExpDummy(void)", MkExpDummy, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpConstant", "Expression MkExpConstant(const char * string)", MkExpConstant, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpString", "Expression MkExpString(const char * string)", MkExpString, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpWideString", "Expression MkExpWideString(const char * string)", MkExpWideString, module, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ContextStringPair", 0, sizeof(struct ContextStringPair), 0, (void *)0, (void *)0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_ContextStringPair = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnCompare", 0, __ecereMethod_ContextStringPair_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnFree", 0, __ecereMethod_ContextStringPair_OnFree, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "string", "String", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "context", "String", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpIntlString", "Expression MkExpIntlString(const char * string, const char * context)", MkExpIntlString, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpOp", "Expression MkExpOp(Expression exp1, int op, Expression exp2)", MkExpOp, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpBrackets", "Expression MkExpBrackets(ecere::sys::OldList expressions)", MkExpBrackets, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpIndex", "Expression MkExpIndex(Expression expression, ecere::sys::OldList index)", MkExpIndex, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpCall", "Expression MkExpCall(Expression expression, ecere::sys::OldList arguments)", MkExpCall, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpMember", "Expression MkExpMember(Expression expression, Identifier member)", MkExpMember, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpPointer", "Expression MkExpPointer(Expression expression, Identifier member)", MkExpPointer, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpTypeSize", "Expression MkExpTypeSize(TypeName typeName)", MkExpTypeSize, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpTypeAlign", "Expression MkExpTypeAlign(TypeName typeName)", MkExpTypeAlign, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpOffsetOf", "Expression MkExpOffsetOf(TypeName typeName, Identifier id)", MkExpOffsetOf, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpClassSize", "Expression MkExpClassSize(Specifier _class)", MkExpClassSize, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpCast", "Expression MkExpCast(TypeName typeName, Expression expression)", MkExpCast, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpCondition", "Expression MkExpCondition(Expression cond, ecere::sys::OldList expressions, Expression elseExp)", MkExpCondition, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpRenew", "Expression MkExpRenew(Expression memExp, TypeName type, Expression size)", MkExpRenew, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpRenew0", "Expression MkExpRenew0(Expression memExp, TypeName type, Expression size)", MkExpRenew0, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpNew", "Expression MkExpNew(TypeName type, Expression size)", MkExpNew, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpNew0", "Expression MkExpNew0(TypeName type, Expression size)", MkExpNew0, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpVaArg", "Expression MkExpVaArg(Expression exp, TypeName type)", MkExpVaArg, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkSpecifier", "Specifier MkSpecifier(int specifier)", MkSpecifier, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkSpecifierTypeOf", "Specifier MkSpecifierTypeOf(Expression expression)", MkSpecifierTypeOf, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkSpecifierSubClass", "Specifier MkSpecifierSubClass(Specifier _class)", MkSpecifierSubClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkSpecifierExtended", "Specifier MkSpecifierExtended(ExtDecl extDecl)", MkSpecifierExtended, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkEnum", "Specifier MkEnum(Identifier id, ecere::sys::OldList list)", MkEnum, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkStructOrUnion", "Specifier MkStructOrUnion(SpecifierType type, Identifier id, ecere::sys::OldList definitions)", MkStructOrUnion, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("AddStructDefinitions", "void AddStructDefinitions(Specifier spec, ecere::sys::OldList definitions)", AddStructDefinitions, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkAttribute", "Attribute MkAttribute(String attr, Expression exp)", MkAttribute, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkAttrib", "Attrib MkAttrib(int type, ecere::sys::OldList * attribs)", MkAttrib, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExtDeclString", "ExtDecl MkExtDeclString(String s)", MkExtDeclString, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExtDeclAttrib", "ExtDecl MkExtDeclAttrib(Attrib attr)", MkExtDeclAttrib, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaratorIdentifier", "Declarator MkDeclaratorIdentifier(Identifier id)", MkDeclaratorIdentifier, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaratorFunction", "Declarator MkDeclaratorFunction(Declarator declarator, ecere::sys::OldList parameters)", MkDeclaratorFunction, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaratorExtended", "Declarator MkDeclaratorExtended(ExtDecl extended, Declarator declarator)", MkDeclaratorExtended, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaratorExtendedEnd", "Declarator MkDeclaratorExtendedEnd(ExtDecl extended, Declarator declarator)", MkDeclaratorExtendedEnd, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkStructDeclarator", "Declarator MkStructDeclarator(Declarator declarator, Expression exp)", MkStructDeclarator, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaratorBrackets", "Declarator MkDeclaratorBrackets(Declarator declarator)", MkDeclaratorBrackets, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaratorArray", "Declarator MkDeclaratorArray(Declarator declarator, Expression exp)", MkDeclaratorArray, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaratorEnumArray", "Declarator MkDeclaratorEnumArray(Declarator declarator, Specifier _class)", MkDeclaratorEnumArray, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaratorPointer", "Declarator MkDeclaratorPointer(Pointer pointer, Declarator declarator)", MkDeclaratorPointer, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkEnumerator", "Enumerator MkEnumerator(Identifier id, Expression exp)", MkEnumerator, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkPointer", "Pointer MkPointer(ecere::sys::OldList qualifiers, Pointer pointer)", MkPointer, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkInitializerAssignment", "Initializer MkInitializerAssignment(Expression exp)", MkInitializerAssignment, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkInitializerList", "Initializer MkInitializerList(ecere::sys::OldList list)", MkInitializerList, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkInitDeclarator", "InitDeclarator MkInitDeclarator(Declarator declarator, Initializer initializer)", MkInitDeclarator, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkTypeName", "TypeName MkTypeName(ecere::sys::OldList qualifiers, Declarator declarator)", MkTypeName, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkTypeNameGuessDecl", "TypeName MkTypeNameGuessDecl(ecere::sys::OldList qualifiers, Declarator declarator)", MkTypeNameGuessDecl, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetDeclId", "Identifier GetDeclId(Declarator decl)", GetDeclId, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclarationClassInst", "Declaration MkDeclarationClassInst(Instantiation inst)", MkDeclarationClassInst, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclarationInst", "Declaration MkDeclarationInst(Instantiation inst)", MkDeclarationInst, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclarationDefine", "Declaration MkDeclarationDefine(Identifier id, Expression exp)", MkDeclarationDefine, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaration", "Declaration MkDeclaration(ecere::sys::OldList specifiers, ecere::sys::OldList initDeclarators)", MkDeclaration, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkStructDeclaration", "Declaration MkStructDeclaration(ecere::sys::OldList specifiers, ecere::sys::OldList declarators, Specifier extStorage)", MkStructDeclaration, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkLabeledStmt", "Statement MkLabeledStmt(Identifier id, Statement statement)", MkLabeledStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkCaseStmt", "Statement MkCaseStmt(Expression exp, Statement statement)", MkCaseStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkCompoundStmt", "Statement MkCompoundStmt(ecere::sys::OldList declarations, ecere::sys::OldList statements)", MkCompoundStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpressionStmt", "Statement MkExpressionStmt(ecere::sys::OldList expressions)", MkExpressionStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkBadDeclStmt", "Statement MkBadDeclStmt(Declaration decl)", MkBadDeclStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkIfStmt", "Statement MkIfStmt(ecere::sys::OldList exp, Statement statement, Statement elseStmt)", MkIfStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkSwitchStmt", "Statement MkSwitchStmt(ecere::sys::OldList exp, Statement statement)", MkSwitchStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkWhileStmt", "Statement MkWhileStmt(ecere::sys::OldList exp, Statement statement)", MkWhileStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDoWhileStmt", "Statement MkDoWhileStmt(Statement statement, ecere::sys::OldList exp)", MkDoWhileStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkForStmt", "Statement MkForStmt(Statement init, Statement check, ecere::sys::OldList inc, Statement statement)", MkForStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkForEachStmt", "Statement MkForEachStmt(Identifier id, ecere::sys::OldList exp, ecere::sys::OldList filter, Statement statement)", MkForEachStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkGotoStmt", "Statement MkGotoStmt(Identifier id)", MkGotoStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkContinueStmt", "Statement MkContinueStmt(void)", MkContinueStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkBreakStmt", "Statement MkBreakStmt(void)", MkBreakStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkReturnStmt", "Statement MkReturnStmt(ecere::sys::OldList exp)", MkReturnStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkFunction", "FunctionDefinition MkFunction(ecere::sys::OldList specifiers, Declarator declarator, ecere::sys::OldList declarationList)", MkFunction, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("_MkFunction", "FunctionDefinition _MkFunction(ecere::sys::OldList specifiers, Declarator declarator, ecere::sys::OldList declarationList, bool errorOnOmit)", _MkFunction, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessFunctionBody", "void ProcessFunctionBody(FunctionDefinition func, Statement body)", ProcessFunctionBody, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExternalFunction", "External MkExternalFunction(FunctionDefinition function)", MkExternalFunction, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExternalImport", "External MkExternalImport(char * name, ecere::com::ImportType importType, ecere::com::AccessMode importAccess)", MkExternalImport, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExternalDeclaration", "External MkExternalDeclaration(Declaration declaration)", MkExternalDeclaration, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExternalNameSpace", "External MkExternalNameSpace(Identifier identifier)", MkExternalNameSpace, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetClassTemplateArgs", "void SetClassTemplateArgs(Specifier spec, ecere::sys::OldList templateArgs)", SetClassTemplateArgs, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("_MkSpecifierName", "Specifier _MkSpecifierName(const char * name, Symbol symbol, ecere::sys::OldList templateArgs)", _MkSpecifierName, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkSpecifierName", "Specifier MkSpecifierName(const char * name)", MkSpecifierName, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkSpecifierNameArgs", "Specifier MkSpecifierNameArgs(const char * name, ecere::sys::OldList * templateArgs)", MkSpecifierNameArgs, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassFunction", "ClassFunction MkClassFunction(ecere::sys::OldList specifiers, Specifier _class, Declarator decl, ecere::sys::OldList declList)", MkClassFunction, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessClassFunctionBody", "void ProcessClassFunctionBody(ClassFunction func, Statement body)", ProcessClassFunctionBody, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkSpecsClass", "ecere::sys::OldList * MkSpecsClass(Specifier _class)", MkSpecsClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkMemberInit", "MemberInit MkMemberInit(ecere::sys::OldList ids, Initializer initializer)", MkMemberInit, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkMemberInitExp", "MemberInit MkMemberInitExp(Expression idExp, Initializer initializer)", MkMemberInitExp, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkMembersInitList", "MembersInit MkMembersInitList(ecere::sys::OldList dataMembers)", MkMembersInitList, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkMembersInitMethod", "MembersInit MkMembersInitMethod(ClassFunction function)", MkMembersInitMethod, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkInstantiation", "Instantiation MkInstantiation(Specifier _class, Expression exp, ecere::sys::OldList members)", MkInstantiation, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkInstantiationNamed", "Instantiation MkInstantiationNamed(ecere::sys::OldList specs, Expression exp, ecere::sys::OldList members)", MkInstantiationNamed, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefAccessOverride", "ClassDef MkClassDefAccessOverride(ecere::com::AccessMode access, Identifier id)", MkClassDefAccessOverride, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefMemberAccess", "ClassDef MkClassDefMemberAccess(void)", MkClassDefMemberAccess, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefDeclaration", "ClassDef MkClassDefDeclaration(Declaration decl)", MkClassDefDeclaration, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefClassData", "ClassDef MkClassDefClassData(Declaration decl)", MkClassDefClassData, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefDesigner", "ClassDef MkClassDefDesigner(const char * designer)", MkClassDefDesigner, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefNoExpansion", "ClassDef MkClassDefNoExpansion(void)", MkClassDefNoExpansion, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefFixed", "ClassDef MkClassDefFixed(void)", MkClassDefFixed, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefDesignerDefaultProperty", "ClassDef MkClassDefDesignerDefaultProperty(Identifier id)", MkClassDefDesignerDefaultProperty, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefDefaultProperty", "ClassDef MkClassDefDefaultProperty(ecere::sys::OldList defProperties)", MkClassDefDefaultProperty, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefFunction", "ClassDef MkClassDefFunction(ClassFunction function)", MkClassDefFunction, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclClassAddNameSpace", "Symbol DeclClassAddNameSpace(Specifier _class, const char * className)", DeclClassAddNameSpace, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclClass", "Symbol DeclClass(Specifier _class, const char * name)", DeclClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("_DeclClass", "Symbol _DeclClass(Specifier _class, const char * name)", _DeclClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetupBaseSpecs", "void SetupBaseSpecs(Symbol symbol, ecere::sys::OldList baseSpecs)", SetupBaseSpecs, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClass", "ClassDefinition MkClass(Symbol symbol, ecere::sys::OldList baseSpecs, ecere::sys::OldList definitions)", MkClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpInstance", "Expression MkExpInstance(Instantiation inst)", MkExpInstance, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExternalClass", "External MkExternalClass(ClassDefinition _class)", MkExternalClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkProperty", "PropertyDef MkProperty(ecere::sys::OldList specs, Declarator decl, Identifier id, Statement setStmt, Statement getStmt)", MkProperty, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefProperty", "ClassDef MkClassDefProperty(PropertyDef propertyDef)", MkClassDefProperty, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefClassProperty", "ClassDef MkClassDefClassProperty(PropertyDef propertyDef)", MkClassDefClassProperty, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefClassPropertyValue", "ClassDef MkClassDefClassPropertyValue(Identifier id, Initializer initializer)", MkClassDefClassPropertyValue, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CheckType", "int CheckType(const char * text)", CheckType, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("check_type", "int check_type(void)", check_type, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PushContext", "Context PushContext(void)", PushContext, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PopContext", "void PopContext(Context ctx)", PopContext, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FindType", "Symbol FindType(Context ctx, const char * name)", FindType, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FindStruct", "Symbol FindStruct(Context ctx, const char * name)", FindStruct, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FindTemplateTypeParameter", "TemplatedType FindTemplateTypeParameter(Context ctx, const char * name)", FindTemplateTypeParameter, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ModuleAccess", "bool ModuleAccess(ecere::com::Module searchIn, ecere::com::Module searchFor)", ModuleAccess, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FindModule", "ModuleImport FindModule(ecere::com::Module moduleToFind)", FindModule, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FindClass", "Symbol FindClass(const char * name)", FindClass, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CopyTypeInto", "void CopyTypeInto(Type type, Type src)", CopyTypeInto, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessType", "Type ProcessType(ecere::sys::OldList specs, Declarator decl)", ProcessType, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessTypeString", "Type ProcessTypeString(const char * string, bool staticMethod)", ProcessTypeString, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassTypeSymbol", "Type MkClassTypeSymbol(Symbol symbol)", MkClassTypeSymbol, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassType", "Type MkClassType(const char * name)", MkClassType, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkAsmField", "AsmField MkAsmField(char * command, Expression expression, Identifier symbolic)", MkAsmField, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkAsmStmt", "Statement MkAsmStmt(Specifier spec, char * statements, ecere::sys::OldList inputFields, ecere::sys::OldList outputFields, ecere::sys::OldList clobberedFields)", MkAsmStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefPropertyWatch", "ClassDef MkClassDefPropertyWatch(PropertyWatch watcher)", MkClassDefPropertyWatch, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkFireWatchersStmt", "Statement MkFireWatchersStmt(Expression object, ecere::sys::OldList watches)", MkFireWatchersStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkStopWatchingStmt", "Statement MkStopWatchingStmt(Expression watcher, Expression object, ecere::sys::OldList watches)", MkStopWatchingStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkWatchStmt", "Statement MkWatchStmt(Expression watcher, Expression object, ecere::sys::OldList watches)", MkWatchStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeleteWatch", "PropertyWatch MkDeleteWatch(Statement compound)", MkDeleteWatch, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkPropertyWatch", "PropertyWatch MkPropertyWatch(ecere::sys::OldList properties, Statement compound)", MkPropertyWatch, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpClass", "Expression MkExpClass(ecere::sys::OldList * specifiers, Declarator decl)", MkExpClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpClassData", "Expression MkExpClassData(Identifier id)", MkExpClassData, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExternalDBTable", "External MkExternalDBTable(DBTableDef table)", MkExternalDBTable, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDBTableDef", "DBTableDef MkDBTableDef(char * name, Symbol symbol, ecere::sys::OldList * definitions)", MkDBTableDef, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDBFieldEntry", "DBTableEntry MkDBFieldEntry(TypeName type, Identifier id, char * name)", MkDBFieldEntry, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDBIndexItem", "DBIndexItem MkDBIndexItem(Identifier id, Order order)", MkDBIndexItem, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDBIndexEntry", "DBTableEntry MkDBIndexEntry(ecere::sys::OldList * items, Identifier id)", MkDBIndexEntry, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpDBOpen", "Expression MkExpDBOpen(Expression ds, Expression dbName)", MkExpDBOpen, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpDBField", "Expression MkExpDBField(char * table, Identifier id)", MkExpDBField, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpDBIndex", "Expression MkExpDBIndex(char * table, Identifier id)", MkExpDBIndex, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpDBTable", "Expression MkExpDBTable(char * table)", MkExpDBTable, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpArray", "Expression MkExpArray(ecere::sys::OldList * expressions)", MkExpArray, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetTemplateArgExpByName", "Expression GetTemplateArgExpByName(const char * paramName, ecere::com::Class curClass, ecere::com::TemplateParameterType tplType)", GetTemplateArgExpByName, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetTemplateArgExp", "Expression GetTemplateArgExp(TemplateParameter param, ecere::com::Class curClass, bool pointer)", GetTemplateArgExp, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("OutputIntlStrings", "void OutputIntlStrings(void)", OutputIntlStrings, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetAST", "void SetAST(ecere::sys::OldList * list)", SetAST, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetAST", "ecere::sys::OldList * GetAST(void)", GetAST, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ParseEc", "void ParseEc(void)", ParseEc, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("LexEc", "int LexEc(void)", LexEc, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetYYText", "const char * GetYYText(void)", GetYYText, module, 1);
}

