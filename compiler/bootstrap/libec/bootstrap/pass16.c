/* Code generated from eC source file: pass16.ec */
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
enum yytokentype
{
IDENTIFIER = 258, CONSTANT = 259, STRING_LITERAL = 260, SIZEOF = 261, PTR_OP = 262, INC_OP = 263, DEC_OP = 264, LEFT_OP = 265, RIGHT_OP = 266, LE_OP = 267, GE_OP = 268, EQ_OP = 269, NE_OP = 270, AND_OP = 271, OR_OP = 272, MUL_ASSIGN = 273, DIV_ASSIGN = 274, MOD_ASSIGN = 275, ADD_ASSIGN = 276, SUB_ASSIGN = 277, LEFT_ASSIGN = 278, RIGHT_ASSIGN = 279, AND_ASSIGN = 280, XOR_ASSIGN = 281, OR_ASSIGN = 282, TYPE_NAME = 283, TYPEDEF = 284, EXTERN = 285, STATIC = 286, AUTO = 287, REGISTER = 288, CHAR = 289, SHORT = 290, INT = 291, UINT = 292, INT64 = 293, LONG = 294, SIGNED = 295, UNSIGNED = 296, FLOAT = 297, DOUBLE = 298, CONST = 299, VOLATILE = 300, VOID = 301, VALIST = 302, STRUCT = 303, UNION = 304, ENUM = 305, ELLIPSIS = 306, CASE = 307, DEFAULT = 308, IF = 309, SWITCH = 310, WHILE = 311, DO = 312, FOR = 313, GOTO = 314, CONTINUE = 315, BREAK = 316, RETURN = 317, IFX = 318, ELSE = 319, CLASS = 320, THISCLASS = 321, CLASS_NAME = 322, PROPERTY = 323, SETPROP = 324, GETPROP = 325, NEWOP = 326, RENEW = 327, DELETE = 328, EXT_DECL = 329, EXT_STORAGE = 330, IMPORT = 331, DEFINE = 332, VIRTUAL = 333, ATTRIB = 334, PUBLIC = 335, PRIVATE = 336, TYPED_OBJECT = 337, ANY_OBJECT = 338, _INCREF = 339, EXTENSION = 340, ASM = 341, TYPEOF = 342, WATCH = 343, STOPWATCHING = 344, FIREWATCHERS = 345, WATCHABLE = 346, CLASS_DESIGNER = 347, CLASS_NO_EXPANSION = 348, CLASS_FIXED = 349, ISPROPSET = 350, CLASS_DEFAULT_PROPERTY = 351, PROPERTY_CATEGORY = 352, CLASS_DATA = 353, CLASS_PROPERTY = 354, SUBCLASS = 355, NAMESPACE = 356, NEW0OP = 357, RENEW0 = 358, VAARG = 359, DBTABLE = 360, DBFIELD = 361, DBINDEX = 362, DATABASE_OPEN = 363, ALIGNOF = 364, ATTRIB_DEP = 365, __ATTRIB = 366, BOOL = 367, _BOOL = 368, _COMPLEX = 369, _IMAGINARY = 370, RESTRICT = 371, THREAD = 372, WIDE_STRING_LITERAL = 373
};

extern unsigned int inCompiler;

extern const char *  outputFile;

static int declTempCount;

struct __ecereNameSpace__ecere__sys__OldList
{
void *  first;
void *  last;
int count;
unsigned int offset;
unsigned int circ;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__sys__BTNode;

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

struct Pointer;

struct TypeName;

struct Attrib;

struct ExtDecl;

struct Attribute;

struct TemplateParameter;

struct TemplateArgument;

struct TemplateDatatype;

struct DBTableEntry;

struct DBIndexItem;

struct DBTableDef;

struct CodePosition
{
int line;
int charPos;
int pos;
int included;
} __attribute__ ((gcc_struct));

extern char *  __ecereNameSpace__ecere__sys__GetLastDirectory(const char *  string, char *  output);

extern unsigned int __ecereNameSpace__ecere__sys__StripExtension(char *  string);

extern void FixModuleName(char *  moduleName);

extern int sprintf(char * , const char * , ...);

extern void *  memcpy(void * , const void * , size_t size);

extern char *  __ecereNameSpace__ecere__sys__CopyString(const char *  string);

extern char *  strcpy(char * , const char * );

extern void FullClassNameCat(char *  output, const char *  className, unsigned int includeTemplateParams);

struct __ecereNameSpace__ecere__com__LinkList
{
void * first;
void * last;
int count;
} __attribute__ ((gcc_struct));

extern int strcmp(const char * , const char * );

extern void Compiler_Error(const char *  format, ...);

extern const char *  __ecereNameSpace__ecere__GetTranslatedString(const char * name, const char *  string, const char *  stringAndContext);

struct __ecereNameSpace__ecere__com__LinkElement
{
void * prev;
void * next;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__IteratorPointer;

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern void ListAdd(struct __ecereNameSpace__ecere__sys__OldList * list, void *  item);

extern struct __ecereNameSpace__ecere__sys__OldList *  ast;

extern struct __ecereNameSpace__ecere__sys__OldList *  MkListOne(void *  item);

extern void FreeList(struct __ecereNameSpace__ecere__sys__OldList * list, void (*  FreeFunction)(void * ));

extern void ListAddFront(struct __ecereNameSpace__ecere__sys__OldList * list, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear(struct __ecereNameSpace__ecere__sys__OldList * this);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(struct __ecereNameSpace__ecere__sys__OldList * this, void *  prevItem, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(struct __ecereNameSpace__ecere__sys__OldList * this, void (*  freeFn)(void * ));

extern struct Pointer * MkPointer(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Pointer * pointer);

struct Location
{
struct CodePosition start;
struct CodePosition end;
} __attribute__ ((gcc_struct));

extern struct Location yylloc;

struct External;

extern struct External * curExternal;

static struct External * createInstancesExternal;

static struct External * destroyInstancesExternal;

extern struct External * DeclareStruct(struct External * neededBy, const char *  name, unsigned int skipNoHead, unsigned int needDereference);

struct TopoEdge
{
struct __ecereNameSpace__ecere__com__LinkElement in;
struct __ecereNameSpace__ecere__com__LinkElement out;
struct External * from;
struct External * to;
unsigned int breakable;
} __attribute__ ((gcc_struct));

struct Statement;

static struct Statement * curCompound;

static struct Statement * createInstancesBody;

static struct Statement * destroyInstancesBody;

extern struct Statement * MkCompoundStmt(struct __ecereNameSpace__ecere__sys__OldList * declarations, struct __ecereNameSpace__ecere__sys__OldList * statements);

extern struct Statement * MkExpressionStmt(struct __ecereNameSpace__ecere__sys__OldList * expressions);

struct Context;

extern struct Context * globalContext;

extern struct Context * curContext;

extern struct Context * PushContext(void);

extern void PopContext(struct Context * ctx);

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
} __attribute__ ((gcc_struct));

struct Expression;

extern struct Expression * CopyExpression(struct Expression * exp);

extern struct Expression * MkExpConstant(const char *  string);

extern struct Expression * MkExpOp(struct Expression * exp1, int op, struct Expression * exp2);

extern void ProcessExpressionType(struct Expression * exp);

extern struct Expression * MkExpBrackets(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern struct Expression * MkExpCast(struct TypeName * typeName, struct Expression * expression);

extern struct Expression * MkExpCall(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * arguments);

extern void FreeExpression(struct Expression * exp);

extern struct Expression * QMkExpId(const char *  id);

extern void CheckTemplateTypes(struct Expression * exp);

static void ProcessExpression(struct Expression *  exp);

void ProcessExpressionInstPass(struct Expression * exp)
{
ProcessExpression(exp);
}

struct Declaration;

extern struct Declaration * MkDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators);

extern struct External * MkExternalDeclaration(struct Declaration * declaration);

static struct Declaration * curDecl;

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} __attribute__ ((gcc_struct));

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

extern unsigned int __ecereNameSpace__ecere__com__eClass_IsDerived(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class * from);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

struct __ecereNameSpace__ecere__com__Property;

extern void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

extern void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object);

extern void __ecereNameSpace__ecere__com__eInstance_Watch(void *  instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

extern void DeclareProperty(struct External * neededBy, struct __ecereNameSpace__ecere__com__Property * prop, char *  setName, char *  getName);

struct Specifier;

extern struct Specifier * MkSpecifier(int specifier);

extern struct Specifier * MkSpecifierName(const char *  name);

extern struct Specifier * CopySpecifier(struct Specifier * spec);

extern struct Expression * MkExpClassSize(struct Specifier * _class);

struct Identifier;

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
} __attribute__ ((gcc_struct)) labeled;
struct
{
struct Expression * exp;
struct Statement * stmt;
} __attribute__ ((gcc_struct)) caseStmt;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * declarations;
struct __ecereNameSpace__ecere__sys__OldList * statements;
struct Context * context;
unsigned int isSwitch;
} __attribute__ ((gcc_struct)) compound;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct Statement * stmt;
struct Statement * elseStmt;
} __attribute__ ((gcc_struct)) ifStmt;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct Statement * stmt;
} __attribute__ ((gcc_struct)) switchStmt;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct Statement * stmt;
} __attribute__ ((gcc_struct)) whileStmt;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct Statement * stmt;
} __attribute__ ((gcc_struct)) doWhile;
struct
{
struct Statement * init;
struct Statement * check;
struct __ecereNameSpace__ecere__sys__OldList * increment;
struct Statement * stmt;
} __attribute__ ((gcc_struct)) forStmt;
struct
{
struct Identifier * id;
} __attribute__ ((gcc_struct)) gotoStmt;
struct
{
struct Specifier * spec;
char * statements;
struct __ecereNameSpace__ecere__sys__OldList * inputFields;
struct __ecereNameSpace__ecere__sys__OldList * outputFields;
struct __ecereNameSpace__ecere__sys__OldList * clobberedFields;
} __attribute__ ((gcc_struct)) asmStmt;
struct
{
struct Expression * watcher;
struct Expression * object;
struct __ecereNameSpace__ecere__sys__OldList * watches;
} __attribute__ ((gcc_struct)) _watch;
struct
{
struct Identifier * id;
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct __ecereNameSpace__ecere__sys__OldList * filter;
struct Statement * stmt;
} __attribute__ ((gcc_struct)) forEachStmt;
struct Declaration * decl;
} __attribute__ ((gcc_struct)) __anon1;
} __attribute__ ((gcc_struct));

extern struct Identifier * MkIdentifier(const char *  string);

extern struct Expression * MkExpMember(struct Expression * expression, struct Identifier * member);

extern struct Expression * MkExpIdentifier(struct Identifier * id);

extern struct Specifier * MkStructOrUnion(int type, struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * definitions);

extern struct Identifier * CopyIdentifier(struct Identifier * id);

extern void FreeIdentifier(struct Identifier * id);

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
} __attribute__ ((gcc_struct));

extern void FreeType(struct Type * type);

extern struct Type * MkClassType(const char *  name);

extern void CopyTypeInto(struct Type * type, struct Type * src);

extern struct Type * ProcessTypeString(const char *  string, unsigned int staticMethod);

struct Initializer;

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
} __attribute__ ((gcc_struct)) __anon1;
unsigned int isConstant;
struct Identifier * id;
} __attribute__ ((gcc_struct));

extern void FreeInitializer(struct Initializer * initializer);

extern struct Initializer * MkInitializerList(struct __ecereNameSpace__ecere__sys__OldList * list);

extern struct Initializer * MkInitializerAssignment(struct Expression * exp);

struct Symbol;

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
} __attribute__ ((gcc_struct)) __anon1;
struct
{
struct Identifier * id;
struct __ecereNameSpace__ecere__sys__OldList *  list;
struct __ecereNameSpace__ecere__sys__OldList *  baseSpecs;
struct __ecereNameSpace__ecere__sys__OldList *  definitions;
unsigned int addNameSpace;
struct Context * ctx;
struct ExtDecl * extDeclStruct;
} __attribute__ ((gcc_struct)) __anon2;
struct Expression * expression;
struct Specifier * _class;
struct TemplateParameter * templateParameter;
} __attribute__ ((gcc_struct)) __anon1;
} __attribute__ ((gcc_struct));

struct Identifier
{
struct Identifier * prev;
struct Identifier * next;
struct Location loc;
struct Symbol * classSym;
struct Specifier * _class;
char *  string;
struct Identifier * badID;
} __attribute__ ((gcc_struct));

extern struct Symbol * FindClass(const char *  name);

extern struct Specifier * _MkSpecifierName(const char *  name, struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * templateArgs);

extern struct Type * MkClassTypeSymbol(struct Symbol * symbol);

extern void FreeSymbol(struct Symbol * symbol);

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
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct)) __anon1;
struct Instantiation * inst;
struct
{
struct Identifier * id;
struct Expression * exp;
} __attribute__ ((gcc_struct)) __anon2;
} __attribute__ ((gcc_struct)) __anon1;
struct Specifier * extStorage;
struct Symbol * symbol;
int declMode;
} __attribute__ ((gcc_struct));

extern struct Declaration * MkDeclarationInst(struct Instantiation * inst);

extern struct Instantiation * MkInstantiation(struct Specifier * _class, struct Expression * exp, struct __ecereNameSpace__ecere__sys__OldList * members);

extern void FreeInstance(struct Instantiation * inst);

extern struct Expression * MkExpInstance(struct Instantiation * inst);

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
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct)) __anon1;
struct
{
struct Type * returnType;
struct __ecereNameSpace__ecere__sys__OldList params;
struct Symbol * thisClass;
unsigned int staticMethod;
struct TemplateParameter * thisClassTemplate;
} __attribute__ ((gcc_struct)) __anon2;
struct
{
struct __ecereNameSpace__ecere__com__Method * method;
struct __ecereNameSpace__ecere__com__Class * methodClass;
struct __ecereNameSpace__ecere__com__Class * usedClass;
} __attribute__ ((gcc_struct)) __anon3;
struct
{
struct Type * arrayType;
int arraySize;
struct Expression * arraySizeExp;
unsigned int freeExp;
struct Symbol * enumClass;
} __attribute__ ((gcc_struct)) __anon4;
struct Type * type;
struct TemplateParameter * templateParameter;
} __attribute__ ((gcc_struct)) __anon1;
int kind;
unsigned int size;
char *  name;
char *  typeName;
struct __ecereNameSpace__ecere__com__Class * thisClassFrom;
int classObjectType;
int alignment;
unsigned int offset;
int bitFieldCount;
int count;
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
} __attribute__ ((gcc_struct));

extern void ProcessMethodType(struct __ecereNameSpace__ecere__com__Method * method);

struct Declarator;

extern struct Declarator * MkDeclaratorFunction(struct Declarator * declarator, struct __ecereNameSpace__ecere__sys__OldList * parameters);

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

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
} __attribute__ ((gcc_struct)) __anon1;
struct Statement * compound;
struct Instantiation * instance;
struct
{
char *  string;
unsigned int intlString;
unsigned int wideString;
} __attribute__ ((gcc_struct)) __anon2;
struct __ecereNameSpace__ecere__sys__OldList *  list;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * specifiers;
struct Declarator * decl;
} __attribute__ ((gcc_struct)) _classExp;
struct
{
struct Identifier * id;
} __attribute__ ((gcc_struct)) classData;
struct
{
struct Expression * exp;
struct __ecereNameSpace__ecere__sys__OldList * arguments;
struct Location argLoc;
} __attribute__ ((gcc_struct)) call;
struct
{
struct Expression * exp;
struct __ecereNameSpace__ecere__sys__OldList * index;
} __attribute__ ((gcc_struct)) index;
struct
{
struct Expression * exp;
struct Identifier * member;
int memberType;
unsigned int thisPtr;
} __attribute__ ((gcc_struct)) member;
struct
{
int op;
struct Expression * exp1;
struct Expression * exp2;
} __attribute__ ((gcc_struct)) op;
struct TypeName * typeName;
struct Specifier * _class;
struct
{
struct TypeName * typeName;
struct Expression * exp;
} __attribute__ ((gcc_struct)) cast;
struct
{
struct Expression * cond;
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct Expression * elseExp;
} __attribute__ ((gcc_struct)) cond;
struct
{
struct TypeName * typeName;
struct Expression * size;
} __attribute__ ((gcc_struct)) _new;
struct
{
struct TypeName * typeName;
struct Expression * size;
struct Expression * exp;
} __attribute__ ((gcc_struct)) _renew;
struct
{
char * table;
struct Identifier * id;
} __attribute__ ((gcc_struct)) db;
struct
{
struct Expression * ds;
struct Expression * name;
} __attribute__ ((gcc_struct)) dbopen;
struct
{
struct TypeName * typeName;
struct Initializer * initializer;
} __attribute__ ((gcc_struct)) initializer;
struct
{
struct Expression * exp;
struct TypeName * typeName;
} __attribute__ ((gcc_struct)) vaArg;
} __attribute__ ((gcc_struct)) __anon1;
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
} __attribute__ ((gcc_struct));

extern struct Declarator * SpecDeclFromString(const char *  string, struct __ecereNameSpace__ecere__sys__OldList *  specs, struct Declarator * baseDecl);

extern struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator);

extern struct TypeName * QMkClass(const char *  spec, struct Declarator * decl);

extern struct Declarator * MkDeclaratorPointer(struct Pointer * pointer, struct Declarator * declarator);

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
} __attribute__ ((gcc_struct)) structDecl;
struct
{
struct Expression * exp;
struct Specifier * enumClass;
} __attribute__ ((gcc_struct)) array;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * parameters;
} __attribute__ ((gcc_struct)) function;
struct
{
struct Pointer * pointer;
} __attribute__ ((gcc_struct)) pointer;
struct
{
struct ExtDecl * extended;
} __attribute__ ((gcc_struct)) extended;
} __attribute__ ((gcc_struct)) __anon1;
} __attribute__ ((gcc_struct));

static void ProcessInitializer(struct Initializer * init)
{
switch(init->type)
{
case 0:
init->__anon1.exp->usage = (init->__anon1.exp->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(init->__anon1.exp);
break;
case 1:
{
struct Initializer * i;

for(i = (*init->__anon1.list).first; i; i = i->next)
ProcessInitializer(i);
break;
}
}
}

struct ClassImport;

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
} __attribute__ ((gcc_struct)) __anon1;
unsigned int notYetDeclared;
union
{
struct
{
struct External * pointerExternal;
struct External * structExternal;
} __attribute__ ((gcc_struct)) __anon1;
struct
{
struct External * externalGet;
struct External * externalSet;
struct External * externalPtr;
struct External * externalIsSet;
} __attribute__ ((gcc_struct)) __anon2;
struct
{
struct External * methodExternal;
struct External * methodCodeExternal;
} __attribute__ ((gcc_struct)) __anon3;
} __attribute__ ((gcc_struct)) __anon2;
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
} __attribute__ ((gcc_struct));

struct ClassImport
{
struct ClassImport * prev;
struct ClassImport * next;
char *  name;
struct __ecereNameSpace__ecere__sys__OldList methods;
struct __ecereNameSpace__ecere__sys__OldList properties;
unsigned int itself;
int isRemote;
} __attribute__ ((gcc_struct));

struct MembersInit;

extern struct MembersInit * MkMembersInitList(struct __ecereNameSpace__ecere__sys__OldList * dataMembers);

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} __attribute__ ((gcc_struct));

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

struct FunctionDefinition;

extern struct FunctionDefinition * _MkFunction(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct Declarator * declarator, struct __ecereNameSpace__ecere__sys__OldList * declarationList, unsigned int errorOnOmit);

extern void ProcessFunctionBody(struct FunctionDefinition * func, struct Statement * body);

extern struct External * MkExternalFunction(struct FunctionDefinition * function);

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
} __attribute__ ((gcc_struct));

struct PropertyWatch;

struct PropertyWatch
{
struct PropertyWatch * prev;
struct PropertyWatch * next;
struct Location loc;
struct Statement * compound;
struct __ecereNameSpace__ecere__sys__OldList *  properties;
unsigned int deleteWatch;
} __attribute__ ((gcc_struct));

struct InitDeclarator;

extern struct InitDeclarator * MkInitDeclarator(struct Declarator * declarator, struct Initializer * initializer);

extern struct Declaration * QMkDeclaration(const char *  name, struct InitDeclarator * initDecl);

struct InitDeclarator
{
struct InitDeclarator * prev;
struct InitDeclarator * next;
struct Location loc;
struct Declarator * declarator;
struct Initializer * initializer;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__com__DataMember;

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
} __attribute__ ((gcc_struct));

extern void __ecereNameSpace__ecere__com__eClass_FindNextMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class **  curClass, struct __ecereNameSpace__ecere__com__DataMember **  curMember, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

struct __ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Instance * privateModule;

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(const char *  name, const char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

struct Enumerator;

struct Enumerator
{
struct Enumerator * prev;
struct Enumerator * next;
struct Location loc;
struct Identifier * id;
struct Expression * exp;
} __attribute__ ((gcc_struct));

struct AsmField;

struct AsmField
{
struct AsmField * prev;
struct AsmField * next;
struct Location loc;
char *  command;
struct Expression * expression;
struct Identifier * symbolic;
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct));

struct MemberInit;

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
} __attribute__ ((gcc_struct));

extern struct MemberInit * MkMemberInit(struct __ecereNameSpace__ecere__sys__OldList * ids, struct Initializer * initializer);

static void ProcessMemberInitData(struct MemberInit * member)
{
if(member->initializer)
ProcessInitializer(member->initializer);
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
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct)) __anon1;
int importType;
struct External * fwdDecl;
struct __ecereNameSpace__ecere__com__Instance * outgoing;
struct __ecereNameSpace__ecere__com__Instance * incoming;
int nonBreakableIncoming;
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct));

void __ecereMethod_External_CreateUniqueEdge(struct External * this, struct External * from, unsigned int soft);

void __ecereMethod_External_CreateEdge(struct External * this, struct External * from, unsigned int soft);

struct ClassFunction;

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
} __attribute__ ((gcc_struct)) __anon1;
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct));

static unsigned int ProcessInstMembers_SimpleMemberEnsure(struct __ecereNameSpace__ecere__com__DataMember * parentMember, struct Instantiation * inst, struct Expression * instExp, struct __ecereNameSpace__ecere__sys__OldList * list, unsigned int zeroOut)
{
struct Symbol * classSym = inst->_class->__anon1.__anon1.symbol;
unsigned int fullSet = 1;
struct __ecereNameSpace__ecere__com__DataMember * dataMember;

for(dataMember = parentMember->members.first; dataMember; dataMember = dataMember->next)
{
if(!dataMember->isProperty)
{
if(!dataMember->name && (dataMember->type == 1 || dataMember->type == 2))
{
if(!ProcessInstMembers_SimpleMemberEnsure(dataMember, inst, instExp, list, zeroOut))
fullSet = 0;
}
else
{
unsigned int memberFilled = 0;

if(inst->members && (*inst->members).first)
{
struct __ecereNameSpace__ecere__com__Class * curClass = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * curMember = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * subMemberStack[256];
int subMemberStackPos = 0;
struct MembersInit * members;

for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0)
{
struct MemberInit * member = (((void *)0));

for(member = (*members->__anon1.dataMembers).first; member; member = member->next)
{
if(member->identifiers)
{
struct Identifier * firstID = (*member->identifiers).first;
struct __ecereNameSpace__ecere__com__DataMember * _subMemberStack[256];
int _subMemberStackPos = 0;
struct __ecereNameSpace__ecere__com__DataMember * thisMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(classSym->__anon1.registered, firstID->string, privateModule);

if(!thisMember)
thisMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(classSym->__anon1.registered, firstID->string, privateModule, _subMemberStack, &_subMemberStackPos);
if(thisMember)
{
if(thisMember && thisMember->memberAccess == 1)
{
curMember = thisMember;
curClass = curMember->_class;
memcpy(subMemberStack, _subMemberStack, sizeof(struct __ecereNameSpace__ecere__com__DataMember *) * _subMemberStackPos);
subMemberStackPos = _subMemberStackPos;
}
if(!firstID->next && thisMember == dataMember)
{
memberFilled = 1;
break;
}
}
}
else
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(classSym->__anon1.registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
if(curMember == dataMember)
{
memberFilled = 1;
break;
}
}
}
if(memberFilled)
break;
}
if(memberFilled)
break;
}
}
if(!memberFilled)
{
if(zeroOut)
{
struct Expression * instExpCopy = CopyExpression(instExp);
struct Expression * memberExp;
struct Expression * setExp;
struct Expression * value = MkExpConstant("0");

memberExp = MkExpMember(instExpCopy, MkIdentifier(dataMember->name));
memberExp->__anon1.member.memberType = 3;
value->usage = (value->usage & ~0x1) | (((unsigned int)(1)) << 0);
setExp = MkExpOp(memberExp, '=', value);
value->loc = inst->loc;
setExp->loc = inst->loc;
FreeType(instExpCopy->expType);
instExpCopy->expType = instExp->expType;
if(instExp->expType)
instExp->expType->refCount++;
ProcessExpressionType(setExp);
ProcessExpression(setExp);
ListAdd(list, setExp);
}
fullSet = 0;
}
}
}
}
return fullSet;
}

struct PropertyDef;

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
} __attribute__ ((gcc_struct)) __anon1;
} __attribute__ ((gcc_struct));

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

static unsigned int ProcessInstMembers(struct Instantiation * inst, struct Expression * instExp, struct __ecereNameSpace__ecere__sys__OldList * list, unsigned int zeroOut)
{
struct MembersInit * members;
struct Symbol * classSym = inst->_class->__anon1.__anon1.symbol;
unsigned int fullSet = 1, convert = 0;

if(classSym && classSym->__anon1.registered && classSym->__anon1.registered->type == 2)
{
struct Expression * exp = (((void *)0));

if(inst->members && (*inst->members).first)
{
struct __ecereNameSpace__ecere__com__Class * _class = (((void *)0));

while(_class != classSym->__anon1.registered)
{
struct __ecereNameSpace__ecere__com__BitMember * bitMember = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * lastClass = _class;

for(_class = classSym->__anon1.registered; _class->base != lastClass && _class->base->type != 1000; _class = _class->base)
;
for(bitMember = _class->membersAndProperties.first; bitMember; bitMember = bitMember->next)
{
struct __ecereNameSpace__ecere__com__BitMember * curMember = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * curClass = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * subMemberStack[256];
int subMemberStackPos = 0;
struct MemberInit * member = (((void *)0));
unsigned int found = 0;

for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0)
{
for(member = (*members->__anon1.dataMembers).first; member; member = member->next)
{
if(member->identifiers)
{
struct Identifier * firstID = (*member->identifiers).first;
struct __ecereNameSpace__ecere__com__DataMember * _subMemberStack[256];
int _subMemberStackPos = 0;
struct __ecereNameSpace__ecere__com__BitMember * thisMember = (struct __ecereNameSpace__ecere__com__BitMember *)__ecereNameSpace__ecere__com__eClass_FindDataMember(_class, firstID->string, privateModule, _subMemberStack, &_subMemberStackPos);

if(!thisMember)
{
thisMember = (struct __ecereNameSpace__ecere__com__BitMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(_class, firstID->string, privateModule);
}
if(thisMember && thisMember->memberAccess == 1)
{
curMember = thisMember;
curClass = curMember->_class;
memcpy(subMemberStack, _subMemberStack, sizeof(struct __ecereNameSpace__ecere__com__DataMember *) * _subMemberStackPos);
subMemberStackPos = _subMemberStackPos;
}
if(thisMember == bitMember)
{
found = 1;
break;
}
}
else
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(classSym->__anon1.registered, &curClass, (struct __ecereNameSpace__ecere__com__DataMember **)&curMember, subMemberStack, &subMemberStackPos);
if(curMember == bitMember)
{
found = 1;
break;
}
}
}
}
if(found)
break;
}
if(member)
{
if(!bitMember->isProperty)
{
struct Expression * part = (((void *)0));
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;

decl = SpecDeclFromString(_class->dataTypeString, specs, (((void *)0)));
ProcessInitializer(member->initializer);
if(member->initializer && member->initializer->type == 0)
{
if(bitMember->pos)
{
char pos[10];

sprintf(pos, "%d", bitMember->pos);
part = MkExpBrackets(MkListOne(MkExpOp(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(specs, decl), MkExpBrackets(MkListOne(member->initializer->__anon1.exp))))), LEFT_OP, MkExpConstant(pos))));
}
else
part = MkExpBrackets(MkListOne(MkExpCast(MkTypeName(specs, decl), MkExpBrackets(MkListOne(member->initializer->__anon1.exp)))));
member->initializer->__anon1.exp = (((void *)0));
FreeInitializer(member->initializer);
member->initializer = (((void *)0));
}
if(exp)
exp = MkExpOp(exp, '|', part);
else
exp = part;
}
else
{
char setName[1024], getName[1024];

DeclareProperty(curExternal, (struct __ecereNameSpace__ecere__com__Property *)bitMember, setName, getName);
if(member->initializer && member->initializer->type == 0)
{
exp = MkExpCall(MkExpIdentifier(MkIdentifier(setName)), MkListOne(member->initializer->__anon1.exp));
member->initializer->__anon1.exp = (((void *)0));
FreeInitializer(member->initializer);
member->initializer = (((void *)0));
}
}
}
}
}
}
if(exp)
exp = MkExpBrackets(MkListOne(exp));
else
exp = MkExpConstant("0");
exp->expType = MkClassType(classSym->string);
ProcessExpression(exp);
ListAdd(list, exp);
}
else if(classSym && classSym->__anon1.registered && classSym->__anon1.registered->type == 3)
{
struct __ecereNameSpace__ecere__com__Class * _class = classSym->__anon1.registered;
struct Expression * exp = (((void *)0));

if(inst->members && (*inst->members).first)
{
struct MemberInit * member = (((void *)0));
struct __ecereNameSpace__ecere__com__Property * prop = (((void *)0));
unsigned int found = 0;

for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0)
{
for(member = (*members->__anon1.dataMembers).first; member; member = member->next)
{
if(member->identifiers)
{
struct Identifier * firstID = (*member->identifiers).first;

prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, firstID->string, privateModule);
if(prop)
{
found = 1;
break;
}
prop = (((void *)0));
}
else
{
found = 1;
break;
}
}
}
if(found)
break;
}
if(member)
{
if(prop)
{
char setName[1024], getName[1024];

DeclareProperty(curExternal, prop, setName, getName);
if(member->initializer && member->initializer->type == 0)
{
exp = MkExpCall(MkExpIdentifier(MkIdentifier(setName)), MkListOne(member->initializer->__anon1.exp));
member->initializer->__anon1.exp = (((void *)0));
FreeInitializer(member->initializer);
member->initializer = (((void *)0));
}
}
else
{
ProcessInitializer(member->initializer);
if(member->initializer && member->initializer->type == 0)
{
exp = MkExpCast(QMkClass(_class->fullName, (((void *)0))), MkExpBrackets(MkListOne(member->initializer->__anon1.exp)));
member->initializer->__anon1.exp = (((void *)0));
FreeInitializer(member->initializer);
member->initializer = (((void *)0));
}
}
}
}
if(exp)
exp = MkExpBrackets(MkListOne(exp));
else
exp = MkExpConstant("0");
ProcessExpression(exp);
ListAdd(list, exp);
}
else if(classSym && classSym->__anon1.registered)
{
if(classSym->__anon1.registered->type == 1)
{
struct __ecereNameSpace__ecere__com__Class * _class = (((void *)0));

while(_class != classSym->__anon1.registered)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember;
struct __ecereNameSpace__ecere__com__Class * lastClass = _class;

for(_class = classSym->__anon1.registered; _class->base != lastClass && _class->base->type != 1000; _class = _class->base)
;
if(_class->structSize != _class->memberOffset)
fullSet = 0;
for(dataMember = _class->membersAndProperties.first; dataMember; dataMember = dataMember->next)
{
if(!dataMember->isProperty)
{
if(!dataMember->name && (dataMember->type == 1 || dataMember->type == 2))
{
if(!ProcessInstMembers_SimpleMemberEnsure(dataMember, inst, instExp, list, zeroOut))
fullSet = 0;
}
else
{
unsigned int memberFilled = 0;

if(inst->members && (*inst->members).first)
{
struct __ecereNameSpace__ecere__com__Class * curClass = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * curMember = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * subMemberStack[256];
int subMemberStackPos = 0;

for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0 && members->__anon1.dataMembers)
{
struct MemberInit * member = (((void *)0));

for(member = (*members->__anon1.dataMembers).first; member; member = member->next)
{
if(member->identifiers)
{
struct __ecereNameSpace__ecere__com__DataMember * _subMemberStack[256];
int _subMemberStackPos = 0;
struct Identifier * firstID = (*member->identifiers).first;
struct __ecereNameSpace__ecere__com__DataMember * thisMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(classSym->__anon1.registered, firstID->string, privateModule);

if(!thisMember)
thisMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(classSym->__anon1.registered, firstID->string, privateModule, _subMemberStack, &_subMemberStackPos);
if(thisMember)
{
if(thisMember->memberAccess == 1)
{
curMember = thisMember;
curClass = curMember->_class;
memcpy(subMemberStack, _subMemberStack, sizeof(struct __ecereNameSpace__ecere__com__DataMember *) * _subMemberStackPos);
subMemberStackPos = _subMemberStackPos;
}
if(!firstID->next && curMember == dataMember)
{
memberFilled = 1;
break;
}
}
}
else
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(classSym->__anon1.registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
if(curMember == dataMember)
{
memberFilled = 1;
break;
}
}
}
if(memberFilled)
break;
}
if(memberFilled)
break;
}
}
if(!memberFilled)
{
if(zeroOut)
{
struct Expression * instExpCopy = CopyExpression(instExp);
struct Expression * memberExp;
struct Expression * setExp;
struct Expression * value = MkExpConstant("0");

memberExp = MkExpMember(instExpCopy, MkIdentifier(dataMember->name));
memberExp->__anon1.member.memberType = 3;
value->usage = (value->usage & ~0x1) | (((unsigned int)(1)) << 0);
setExp = MkExpOp(memberExp, '=', value);
value->loc = inst->loc;
setExp->loc = inst->loc;
FreeType(instExpCopy->expType);
instExpCopy->expType = instExp->expType;
if(instExp->expType)
instExp->expType->refCount++;
ProcessExpressionType(setExp);
ProcessExpression(setExp);
ListAdd(list, setExp);
}
fullSet = 0;
}
}
}
}
}
}
if(inst->members && (*inst->members).first)
{
struct __ecereNameSpace__ecere__com__Class * curClass = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * curMember = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * subMemberStack[256];
int subMemberStackPos = 0;

for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0 && members->__anon1.dataMembers)
{
struct MemberInit * member = (((void *)0));
struct __ecereNameSpace__ecere__com__Method * method = (((void *)0));

for(member = (*members->__anon1.dataMembers).first; member; member = member->next)
{
struct Identifier * ident = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * thisMember = (((void *)0));

if(member->identifiers)
{
struct __ecereNameSpace__ecere__com__DataMember * _subMemberStack[256];
int _subMemberStackPos = 0;
struct Identifier * firstID = (*member->identifiers).first;

thisMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(classSym->__anon1.registered, firstID->string, privateModule);
if(!thisMember)
thisMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(classSym->__anon1.registered, firstID->string, privateModule, _subMemberStack, &_subMemberStackPos);
ident = firstID;
if(thisMember)
{
if(thisMember->memberAccess == 1)
{
curMember = thisMember;
curClass = curMember->_class;
memcpy(subMemberStack, _subMemberStack, sizeof(struct __ecereNameSpace__ecere__com__DataMember *) * _subMemberStackPos);
subMemberStackPos = _subMemberStackPos;
}
}
else if(classSym->__anon1.registered->type != 1)
{
method = __ecereNameSpace__ecere__com__eClass_FindMethod(classSym->__anon1.registered, ident->string, privateModule);
if(!method || method->type != 1)
method = (((void *)0));
}
}
else
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(classSym->__anon1.registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
thisMember = curMember;
}
if(instExp && (thisMember || method))
{
struct Expression * instExpCopy = CopyExpression(instExp);
struct Expression * setExp = (((void *)0));

instExpCopy->tempCount = instExp->tempCount;
if(!ident)
ident = MkIdentifier(thisMember->name);
if(ident)
{
struct Expression * memberExp;
unsigned int freeMemberExp = 0;

if(thisMember && thisMember->isProperty && ((struct __ecereNameSpace__ecere__com__Property *)thisMember)->conversion)
convert = 1;
if(member->identifiers && (*member->identifiers).count > 1)
{
struct Identifier * id = (*member->identifiers).first;

memberExp = MkExpMember(instExpCopy, id);
for(id = id->next; id; id = id->next)
memberExp = MkExpMember(memberExp, id);
}
else
memberExp = MkExpMember(instExpCopy, ident);
if(member->initializer && member->initializer->type == 0 && member->initializer->__anon1.exp)
{
member->initializer->__anon1.exp->usage = (member->initializer->__anon1.exp->usage & ~0x1) | (((unsigned int)(1)) << 0);
setExp = MkExpOp(memberExp, '=', member->initializer->__anon1.exp);
member->initializer->__anon1.exp = (((void *)0));
FreeInitializer(member->initializer);
member->initializer = (((void *)0));
}
else
{
freeMemberExp = 1;
}
memberExp->loc = inst->loc;
if(member->identifiers)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear((&*member->identifiers));
if(setExp)
setExp->loc = inst->loc;
FreeType(instExpCopy->expType);
instExpCopy->expType = instExp->expType;
if(instExp->expType)
instExp->expType->refCount++;
if(setExp)
{
ProcessExpressionType(setExp);
ProcessExpression(setExp);
ListAdd(list, setExp);
}
if(freeMemberExp)
FreeExpression(memberExp);
}
}
}
}
}
}
}
return fullSet || convert;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Context;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Type;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Initializer;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Symbol;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Expression;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declaration;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__LinkList;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TopoEdge;

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

static void CreateInstancesBody()
{
if(inCompiler && !createInstancesBody)
{
char registerName[1024], moduleName[274];
struct __ecereNameSpace__ecere__sys__OldList * specifiers;
struct Declarator * declarator;

createInstancesBody = MkCompoundStmt((((void *)0)), MkList());
createInstancesBody->__anon1.compound.context = __extension__ ({
struct Context * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context);

__ecereInstance1->parent = globalContext, __ecereInstance1;
});
specifiers = MkList();
ListAdd(specifiers, MkSpecifier(VOID));
__ecereNameSpace__ecere__sys__GetLastDirectory(outputFile, moduleName);
__ecereNameSpace__ecere__sys__StripExtension(moduleName);
FixModuleName(moduleName);
sprintf(registerName, "__ecereCreateModuleInstances_%s", moduleName);
declarator = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(registerName)), (((void *)0)));
{
struct FunctionDefinition * function = _MkFunction(specifiers, declarator, (((void *)0)), 0);

ProcessFunctionBody(function, createInstancesBody);
ListAdd(ast, createInstancesExternal = MkExternalFunction(function));
}
destroyInstancesBody = MkCompoundStmt((((void *)0)), MkList());
destroyInstancesBody->__anon1.compound.context = __extension__ ({
struct Context * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context);

__ecereInstance1->parent = globalContext, __ecereInstance1;
});
specifiers = MkList();
ListAdd(specifiers, MkSpecifier(VOID));
sprintf(registerName, "__ecereDestroyModuleInstances_%s", moduleName);
declarator = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(registerName)), (((void *)0)));
{
struct FunctionDefinition * function = _MkFunction(specifiers, declarator, (((void *)0)), 0);

ProcessFunctionBody(function, destroyInstancesBody);
ListAdd(ast, destroyInstancesExternal = MkExternalFunction(function));
}
}
}

void DeclareClass(struct External * neededFor, struct Symbol * classSym, const char * className)
{
if(classSym && classSym->notYetDeclared)
{
if(!classSym->mustRegister)
{
if(!classSym->_import)
{
if(!classSym->module)
classSym->module = mainModule;
if(!classSym->module)
return ;
classSym->_import = __extension__ ({
struct ClassImport * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassImport);

__ecereInstance1->isRemote = classSym->__anon1.registered ? classSym->__anon1.registered->isRemote : 0, __ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(classSym->string), __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&classSym->module->classes, classSym->_import);
}
classSym->_import->itself = 1;
}
classSym->notYetDeclared = 0;
if(!classSym->__anon2.__anon1.pointerExternal && inCompiler)
{
struct Declaration * decl;
struct __ecereNameSpace__ecere__sys__OldList * specifiers, * declarators;
struct Declarator * d;

specifiers = MkList();
declarators = MkList();
ListAdd(specifiers, MkSpecifier(EXTERN));
ListAdd(specifiers, MkStructOrUnion(3, MkIdentifier("__ecereNameSpace__ecere__com__Class"), (((void *)0))));
d = MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(MkIdentifier(className)));
ListAdd(declarators, MkInitDeclarator(d, (((void *)0))));
decl = MkDeclaration(specifiers, declarators);
classSym->__anon2.__anon1.pointerExternal = MkExternalDeclaration(decl);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*ast), classSym->__anon2.__anon1.pointerExternal);
DeclareStruct(classSym->__anon2.__anon1.pointerExternal, "ecere::com::Class", 0, 1);
}
}
if(inCompiler && classSym && classSym->__anon2.__anon1.pointerExternal && neededFor)
__ecereMethod_External_CreateUniqueEdge(neededFor, classSym->__anon2.__anon1.pointerExternal, 0);
}

void __ecereUnregisterModule_pass16(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

static void ProcessStatement(struct Statement *  stmt);

static void ProcessFunction(struct FunctionDefinition * function)
{
if(function->body)
{
yylloc = function->loc;
ProcessStatement(function->body);
}
}

static void ProcessInstantiation(struct Instantiation * inst)
{
if(inst->members && (*inst->members).first)
{
struct MembersInit * members;

for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0)
{
if(members->__anon1.dataMembers)
{
struct MemberInit * member;

for(member = (*members->__anon1.dataMembers).first; member; member = member->next)
ProcessMemberInitData(member);
}
}
else if(members->type == 1)
{
ProcessFunction((struct FunctionDefinition *)members->__anon1.function);
}
}
}
}

static void ProcessDeclaration(struct Declaration *  decl);

static void ProcessStatement(struct Statement * stmt)
{
yylloc = stmt->loc;
switch(stmt->type)
{
case 0:
if(stmt->__anon1.labeled.stmt)
ProcessStatement(stmt->__anon1.labeled.stmt);
break;
case 1:
if(stmt->__anon1.caseStmt.exp)
ProcessExpression(stmt->__anon1.caseStmt.exp);
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
{
curCompound = stmt;
curContext = stmt->__anon1.compound.context;
}
if(stmt->__anon1.compound.declarations)
{
for(decl = (*stmt->__anon1.compound.declarations).first; decl; decl = decl->next)
ProcessDeclaration(decl);
}
if(stmt->__anon1.compound.statements)
{
for(s = (*stmt->__anon1.compound.statements).first; s; s = s->next)
{
ProcessStatement(s);
}
}
curCompound = prevCompound;
curContext = prevContext;
}
break;
}
case 3:
{
struct Expression * exp;

if(stmt->__anon1.expressions)
{
for(exp = (*stmt->__anon1.expressions).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
}
break;
}
case 4:
{
struct Expression * exp;

((struct Expression *)(*stmt->__anon1.ifStmt.exp).last)->usage = (((struct Expression *)(*stmt->__anon1.ifStmt.exp).last)->usage & ~0x1) | (((unsigned int)(1)) << 0);
for(exp = (*stmt->__anon1.ifStmt.exp).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
if(stmt->__anon1.ifStmt.stmt)
ProcessStatement(stmt->__anon1.ifStmt.stmt);
if(stmt->__anon1.ifStmt.elseStmt)
ProcessStatement(stmt->__anon1.ifStmt.elseStmt);
break;
}
case 5:
{
struct Expression * exp;

((struct Expression *)(*stmt->__anon1.switchStmt.exp).last)->usage = (((struct Expression *)(*stmt->__anon1.switchStmt.exp).last)->usage & ~0x1) | (((unsigned int)(1)) << 0);
for(exp = (*stmt->__anon1.switchStmt.exp).first; exp; exp = exp->next)
ProcessExpression(exp);
ProcessStatement(stmt->__anon1.switchStmt.stmt);
break;
}
case 6:
{
if(stmt->__anon1.whileStmt.exp)
{
struct Expression * exp;

((struct Expression *)(*stmt->__anon1.whileStmt.exp).last)->usage = (((struct Expression *)(*stmt->__anon1.whileStmt.exp).last)->usage & ~0x1) | (((unsigned int)(1)) << 0);
for(exp = (*stmt->__anon1.whileStmt.exp).first; exp; exp = exp->next)
{
ProcessExpression(exp);
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

((struct Expression *)(*stmt->__anon1.doWhile.exp).last)->usage = (((struct Expression *)(*stmt->__anon1.doWhile.exp).last)->usage & ~0x1) | (((unsigned int)(1)) << 0);
for(exp = (*stmt->__anon1.doWhile.exp).first; exp; exp = exp->next)
{
ProcessExpression(exp);
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
((struct Expression *)(*stmt->__anon1.forStmt.check->__anon1.expressions).last)->usage = (((struct Expression *)(*stmt->__anon1.forStmt.check->__anon1.expressions).last)->usage & ~0x1) | (((unsigned int)(1)) << 0);
}
if(stmt->__anon1.forStmt.check)
ProcessStatement(stmt->__anon1.forStmt.check);
if(stmt->__anon1.forStmt.increment)
{
for(exp = (*stmt->__anon1.forStmt.increment).first; exp; exp = exp->next)
ProcessExpression(exp);
}
if(stmt->__anon1.forStmt.stmt)
ProcessStatement(stmt->__anon1.forStmt.stmt);
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

if(stmt->__anon1.expressions && (*stmt->__anon1.expressions).last)
{
((struct Expression *)(*stmt->__anon1.expressions).last)->usage = (((struct Expression *)(*stmt->__anon1.expressions).last)->usage & ~0x1) | (((unsigned int)(1)) << 0);
for(exp = (*stmt->__anon1.expressions).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
}
break;
}
case 14:
{
ProcessDeclaration(stmt->__anon1.decl);
break;
}
case 13:
{
struct AsmField * field;

if(stmt->__anon1.asmStmt.inputFields)
{
for(field = (*stmt->__anon1.asmStmt.inputFields).first; field; field = field->next)
if(field->expression)
ProcessExpression(field->expression);
}
if(stmt->__anon1.asmStmt.outputFields)
{
for(field = (*stmt->__anon1.asmStmt.outputFields).first; field; field = field->next)
if(field->expression)
ProcessExpression(field->expression);
}
if(stmt->__anon1.asmStmt.clobberedFields)
{
for(field = (*stmt->__anon1.asmStmt.clobberedFields).first; field; field = field->next)
if(field->expression)
ProcessExpression(field->expression);
}
break;
}
}
}

struct ClassDef;

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
} __attribute__ ((gcc_struct)) YYSTYPE;

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
} __attribute__ ((gcc_struct)) __anon1;
} __attribute__ ((gcc_struct)) __anon1;
int memberAccess;
void *  object;
} __attribute__ ((gcc_struct));

static void ProcessSpecifier(struct Specifier * spec)
{
switch(spec->type)
{
case 0:
break;
case 1:
{
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
ProcessExpression(e->exp);
}
}
break;
}
case 3:
case 4:
{
if(spec->__anon1.__anon2.definitions)
{
struct ClassDef * def;

for(def = (*spec->__anon1.__anon2.definitions).first; def; def = def->next)
{
if(def->type == 2 && def->__anon1.decl && def->__anon1.decl->type == 0)
ProcessDeclaration(def->__anon1.decl);
}
}
break;
}
}
}

void ProcessInstantiations()
{
struct External * external;

for(external = (*ast).first; external; external = external->next)
{
curExternal = external;
if(external->type == 1)
{
if(external->__anon1.declaration)
{
unsigned int isInstance = external->__anon1.declaration->type == 2;
struct Symbol * sym = isInstance ? FindClass(external->__anon1.declaration->__anon1.inst->_class->__anon1.__anon1.name) : (((void *)0));

ProcessDeclaration(external->__anon1.declaration);
if(isInstance)
{
struct TopoEdge * e, * next;

for(e = ((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)external->incoming + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->first; e; e = next)
{
struct External * from = e->from;

next = e->in.next;
if(((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)from->incoming + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->count)
{
unsigned int reroute = 1;

if(sym && sym->__anon1.registered && sym->__anon1.registered->type == 1)
reroute = 0;
else if(from->type == 1 && from->__anon1.declaration && (!from->__anon1.declaration->__anon1.__anon1.declarators || !(*from->__anon1.declaration->__anon1.__anon1.declarators).count) && from->__anon1.declaration->__anon1.__anon1.specifiers)
{
struct Specifier * spec = (((void *)0));

for(spec = (*from->__anon1.declaration->__anon1.__anon1.specifiers).first; spec; spec = spec->next)
{
if(spec->type == 3 || spec->type == 4)
break;
}
if(sym->__anon1.registered && spec && spec->__anon1.__anon2.id && spec->__anon1.__anon2.id->string)
{
char className[1024];
struct __ecereNameSpace__ecere__com__Class * c = sym->__anon1.registered;

strcpy(className, "__ecereClass_");
if(c->type == 5 && c->templateClass)
FullClassNameCat(className, c->templateClass->name, 1);
else
FullClassNameCat(className, c->name, 1);
if(!strcmp(c->name, spec->__anon1.__anon2.id->string))
reroute = 0;
}
}
if(reroute)
{
unsigned int skip = 0;

e->to = createInstancesExternal;
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = external->incoming;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(external->incoming, (struct __ecereNameSpace__ecere__com__IteratorPointer *)e);
{
struct TopoEdge * i;
struct __ecereNameSpace__ecere__com__Instance * __internalLinkList = createInstancesExternal->incoming;

for(i = ((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)__internalLinkList + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->first; i; i = (struct TopoEdge *)((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * pointer))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = __internalLinkList;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext])(__internalLinkList, (struct __ecereNameSpace__ecere__com__IteratorPointer *)i))
{
if(i->from == from)
{
skip = 1;
if(i->breakable && !e->breakable)
{
i->breakable = 1;
createInstancesExternal->nonBreakableIncoming++;
}
break;
}
}
}
if(skip)
{
external->nonBreakableIncoming--;
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = e->from->outgoing;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(e->from->outgoing, (struct __ecereNameSpace__ecere__com__IteratorPointer *)e);
((e ? (__ecereClass_TopoEdge->Destructor ? __ecereClass_TopoEdge->Destructor((void *)e) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(e)) : 0), e = 0);
}
else
{
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = createInstancesExternal->incoming;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(createInstancesExternal->incoming, (uint64)(uintptr_t)(e));
if(!e->breakable)
{
external->nonBreakableIncoming--;
createInstancesExternal->nonBreakableIncoming++;
}
}
}
}
}
}
}
}
else if(external->type == 0)
{
ProcessFunction(external->__anon1.function);
}
else if(external->type == 2)
{
struct ClassDefinition * _class = external->__anon1._class;

if(_class->definitions)
{
struct ClassDef * def;

for(def = (*_class->definitions).first; def; def = def->next)
{
if(def->type == 0)
{
curExternal = def->__anon1.function->declarator ? def->__anon1.function->declarator->symbol->__anon2.__anon1.pointerExternal : external;
ProcessFunction((struct FunctionDefinition *)def->__anon1.function);
}
else if(def->type == 2 && def->__anon1.decl->type == 2)
{
ProcessInstantiation(def->__anon1.decl->__anon1.inst);
}
else if(def->type == 1 && def->__anon1.defProperties)
{
struct MemberInit * defProperty;
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassTypeSymbol(_class->symbol), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
for(defProperty = (*def->__anon1.defProperties).first; defProperty; defProperty = defProperty->next)
{
ProcessMemberInitData(defProperty);
}
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
FreeSymbol(thisSymbol);
}
else if(def->type == 3 && def->__anon1.propertyDef)
{
struct PropertyDef * prop = def->__anon1.propertyDef;
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassTypeSymbol(_class->symbol), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
if(prop->setStmt)
{
curExternal = prop->symbol ? prop->symbol->__anon2.__anon2.externalSet : (((void *)0));
ProcessStatement(prop->setStmt);
}
if(prop->getStmt)
{
curExternal = prop->symbol ? prop->symbol->__anon2.__anon2.externalGet : (((void *)0));
ProcessStatement(prop->getStmt);
}
if(prop->issetStmt)
{
curExternal = prop->symbol ? prop->symbol->__anon2.__anon2.externalIsSet : (((void *)0));
ProcessStatement(prop->issetStmt);
}
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
FreeSymbol(thisSymbol);
}
else if(def->type == 4 && def->__anon1.propertyWatch)
{
struct PropertyWatch * propertyWatch = def->__anon1.propertyWatch;
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassTypeSymbol(_class->symbol), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
if(propertyWatch->compound)
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&propertyWatch->compound->__anon1.compound.context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
curExternal = (((void *)0));
ProcessStatement(propertyWatch->compound);
}
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
FreeSymbol(thisSymbol);
}
}
}
}
}
}

void __ecereRegisterModule_pass16(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclareClass", "void DeclareClass(External neededFor, Symbol classSym, const char * className)", DeclareClass, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessExpressionInstPass", "void ProcessExpressionInstPass(Expression exp)", ProcessExpressionInstPass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessInstantiations", "void ProcessInstantiations(void)", ProcessInstantiations, module, 1);
}

static unsigned int ProcessBracketInst_DataMember(struct __ecereNameSpace__ecere__com__DataMember *  parentMember, struct Instantiation *  inst, struct __ecereNameSpace__ecere__sys__OldList *  list, struct __ecereNameSpace__ecere__com__DataMember *  namedParentMember, unsigned int parentMemberSet);

static unsigned int ProcessBracketInst(struct Instantiation * inst, struct __ecereNameSpace__ecere__sys__OldList * list)
{
static int recursionCount = 0;
struct Symbol * classSym = inst->_class->__anon1.__anon1.symbol;
struct __ecereNameSpace__ecere__com__Class * _class = (((void *)0));
int anonID = 1;

if(recursionCount > 500)
return 0;
recursionCount++;
while(_class != classSym->__anon1.registered)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember;
struct __ecereNameSpace__ecere__com__Class * lastClass = _class;

for(_class = classSym->__anon1.registered; _class->base != lastClass && _class->base->type != 1000; _class = _class->base)
;
for(dataMember = _class->membersAndProperties.first; dataMember; dataMember = dataMember->next)
{
if(!dataMember->isProperty && !dataMember->name && (dataMember->type == 1 || dataMember->type == 2))
{
struct __ecereNameSpace__ecere__sys__OldList * subList = MkList();

if(!ProcessBracketInst_DataMember(dataMember, inst, subList ? subList : list, dataMember, 0))
{
if(subList)
FreeList(subList, (void *)(FreeInitializer));
recursionCount--;
return 0;
}
if(dataMember->type == 2 || (subList && (*subList).count))
{
struct Initializer * init = MkInitializerList(subList);
char id[100];

sprintf(id, "__anon%d", anonID);
init->id = MkIdentifier(id);
ListAdd(list, init);
}
else
(__ecereNameSpace__ecere__com__eSystem_Delete(subList), subList = 0);
anonID++;
}
else
{
struct MembersInit * members;
struct MemberInit * member = (((void *)0));
unsigned int found = 0;

if(inst->members && (*inst->members).first)
{
struct __ecereNameSpace__ecere__com__DataMember * curMember = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * curClass = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * subMemberStack[256];
int subMemberStackPos = 0;

for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0)
{
for(member = (*members->__anon1.dataMembers).first; member; member = member->next)
{
struct Identifier * firstID = member->identifiers ? (*member->identifiers).first : (((void *)0));

if(firstID)
{
struct __ecereNameSpace__ecere__com__DataMember * _subMemberStack[256];
int _subMemberStackPos = 0;
struct __ecereNameSpace__ecere__com__DataMember * thisMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(classSym->__anon1.registered, firstID->string, privateModule);

if(!thisMember)
thisMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(classSym->__anon1.registered, firstID->string, privateModule, _subMemberStack, &_subMemberStackPos);
if(thisMember)
{
curMember = thisMember;
curClass = curMember->_class;
memcpy(subMemberStack, _subMemberStack, sizeof(struct __ecereNameSpace__ecere__com__DataMember *) * _subMemberStackPos);
subMemberStackPos = _subMemberStackPos;
}
if(curMember == dataMember)
{
if(dataMember->isProperty)
{
if(!((struct __ecereNameSpace__ecere__com__Property *)dataMember)->Set)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "No set defined for property %s\n", (((void *)0))), dataMember->name);
continue;
}
recursionCount--;
return 0;
}
if((*member->identifiers).count > 1 && member->initializer && member->initializer->type == 0)
{
struct __ecereNameSpace__ecere__sys__OldList * partList = MkList();
struct Specifier * spec;
struct MembersInit * nextMembers;
struct MemberInit * next = member->next;
struct Symbol * symbol;

if(!dataMember->dataType)
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0);
symbol = (dataMember->dataType && dataMember->dataType->kind == 8) ? dataMember->dataType->__anon1._class : (((void *)0));
spec = _MkSpecifierName(dataMember->dataTypeString, symbol, (((void *)0)));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*member->identifiers), firstID);
ListAdd(partList, MkMemberInit(member->identifiers, MkInitializerAssignment(member->initializer->__anon1.exp)));
for(nextMembers = members; nextMembers; nextMembers = nextMembers->next)
{
if(!nextMembers->__anon1.dataMembers)
continue;
if(members != nextMembers)
next = (*nextMembers->__anon1.dataMembers).first;
if(nextMembers->type == 0)
{
struct MemberInit * nextMember;

for(nextMember = next; nextMember; nextMember = next, next = nextMember ? nextMember->next : (((void *)0)))
{
struct Identifier * nextID = (*nextMember->identifiers).first;

if(nextMember->identifiers && (*nextMember->identifiers).count > 1 && !strcmp(firstID->string, nextID->string))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*nextMembers->__anon1.dataMembers), nextMember);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*nextMember->identifiers), nextID);
ListAdd(partList, nextMember);
FreeIdentifier(nextID);
}
}
}
}
member->initializer->__anon1.exp = MkExpInstance(MkInstantiation(spec, (((void *)0)), MkListOne(MkMembersInitList(partList))));
FreeIdentifier(firstID);
member->identifiers = (((void *)0));
}
found = 1;
break;
}
}
else
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(classSym->__anon1.registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
if(curMember == dataMember)
{
if(dataMember->isProperty)
{
if(!((struct __ecereNameSpace__ecere__com__Property *)dataMember)->Set)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "No set defined for property %s\n", (((void *)0))), dataMember->name);
continue;
}
recursionCount--;
return 0;
}
found = 1;
break;
}
}
}
}
if(found)
break;
}
}
if(dataMember->isProperty)
continue;
if(member && member->initializer && member->initializer->type == 0)
{
if(member->initializer->__anon1.exp->type == 1 && member->initializer->__anon1.exp->expType && member->initializer->__anon1.exp->expType->__anon1._class && member->initializer->__anon1.exp->expType->__anon1._class->__anon1.registered && member->initializer->__anon1.exp->expType->__anon1._class->__anon1.registered->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldList * subList = MkList();

ProcessBracketInst(member->initializer->__anon1.exp->__anon1.instance, subList);
FreeExpression(member->initializer->__anon1.exp);
member->initializer->__anon1.exp = (((void *)0));
ListAdd(list, MkInitializerList(subList));
}
else
{
member->initializer->__anon1.exp->usage = (member->initializer->__anon1.exp->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(member->initializer->__anon1.exp);
ListAdd(list, MkInitializerAssignment(CopyExpression(member->initializer->__anon1.exp)));
}
member->takeOutExp = 1;
}
else if(member && member->initializer && member->initializer->type == 1)
{
ListAdd(list, member->initializer);
member->initializer = (((void *)0));
}
else if(dataMember && dataMember->dataTypeString)
{
struct Symbol * classSym;

if(!dataMember->dataType)
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0);
classSym = (dataMember->dataType && dataMember->dataType->kind == 8) ? dataMember->dataType->__anon1._class : (((void *)0));
if(classSym && classSym->__anon1.registered && classSym->__anon1.registered->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldList * subList = MkList();
struct Specifier * spec = _MkSpecifierName(dataMember->dataTypeString, classSym, (((void *)0)));
struct Instantiation * inst = MkInstantiation(spec, (((void *)0)), (((void *)0)));

ProcessBracketInst(inst, subList);
FreeInstance(inst);
ListAdd(list, MkInitializerList(subList));
}
else if(dataMember->dataType->kind == 12)
{
struct Type * t = dataMember->dataType->__anon1.type;
struct Initializer * inner = MkInitializerAssignment((((void *)0))), * i = inner;

while(t && t->kind == 12)
{
i = MkInitializerList(MkListOne(i));
t = t->__anon1.type;
}
if(t && t->kind == 8 && t->__anon1._class && t->__anon1._class->__anon1.registered && t->__anon1._class->__anon1.registered->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldList * subList = MkList();
struct Specifier * spec = _MkSpecifierName(t->__anon1._class->__anon1.registered->name, classSym, (((void *)0)));
struct Instantiation * inst = MkInstantiation(spec, (((void *)0)), (((void *)0)));

ProcessBracketInst(inst, subList);
FreeInstance(inst);
inner->type = 1;
inner->__anon1.list = subList;
}
else
inner->__anon1.exp = MkExpConstant("0");
ListAdd(list, MkInitializerList(MkListOne(i)));
}
else
ListAdd(list, MkInitializerAssignment(MkExpConstant("0")));
}
}
}
}
if(inst->members && (*inst->members).first)
{
struct MembersInit * members;
struct MemberInit * member = (((void *)0));

for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0)
{
for(member = (*members->__anon1.dataMembers).first; member; member = member->next)
{
if(member->takeOutExp)
{
FreeInitializer(member->initializer);
member->initializer = (((void *)0));
}
}
}
}
}
recursionCount--;
return 1;
}

static void ProcessExpression(struct Expression * exp)
{
switch(exp->type)
{
case 0:
break;
case 1:
{
struct Instantiation * inst = exp->__anon1.instance;

if(inCompiler && inst->_class)
{
char className[1024];
struct Symbol * classSym = inst->_class->__anon1.__anon1.symbol;
struct Expression * instExp;

if(classSym && classSym->__anon1.registered && classSym->__anon1.registered->type == 2)
{
if(inst->exp)
{
struct __ecereNameSpace__ecere__sys__OldList list =
{
0
};

ProcessInstMembers(inst, (((void *)0)), &list, 0);
ProcessExpression(inst->exp);
exp->type = 4;
exp->__anon1.op.op = '=';
exp->__anon1.op.exp1 = inst->exp;
exp->__anon1.op.exp2 = list.first;
inst->exp = (((void *)0));
}
else
{
struct Type * expType = exp->expType;
struct Expression * prev = exp->prev, * next = exp->next;
struct __ecereNameSpace__ecere__sys__OldList list =
{
0, 0, 0, 0, 0
};

ProcessInstMembers(inst, (((void *)0)), &list, 0);
FreeType(exp->destType);
*exp = *(struct Expression *)list.first;
{
struct Expression * firstExp = list.first;

((firstExp ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor((void *)firstExp) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(firstExp)) : 0), firstExp = 0);
}
FreeType(exp->destType);
exp->destType = expType;
exp->prev = prev;
exp->next = next;
}
}
else if(classSym && classSym->__anon1.registered && (classSym->__anon1.registered->type == 3 || classSym->__anon1.registered->type == 4))
{
if(inst->exp)
{
struct __ecereNameSpace__ecere__sys__OldList list =
{
0
};
struct Expression * e;

ProcessInstMembers(inst, (((void *)0)), &list, 0);
ProcessExpression(inst->exp);
exp->type = 4;
exp->__anon1.op.op = '=';
exp->__anon1.op.exp1 = inst->exp;
exp->__anon1.op.exp2 = list.first;
inst->exp = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&list, list.first);
while((e = list.first))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&list, e);
FreeExpression(e);
}
}
else
{
struct Expression * prev = exp->prev, * next = exp->next;
struct Type * expType = exp->expType;
struct __ecereNameSpace__ecere__sys__OldList list =
{
0
};

ProcessInstMembers(inst, (((void *)0)), &list, 0);
if(list.first)
{
struct Expression * e = list.first;

FreeType(exp->destType);
*exp = *e;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&list, e);
((e ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor((void *)e) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(e)) : 0), e = 0);
exp->expType = expType;
exp->prev = prev;
exp->next = next;
while((e = list.first))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&list, e);
FreeExpression(e);
}
}
else
{
exp->type = 2;
exp->__anon1.__anon1.constant = __ecereNameSpace__ecere__sys__CopyString("0");
}
}
}
else if(classSym && classSym->__anon1.registered && classSym->__anon1.registered->type == 1)
{
if(inst->exp)
{
exp->type = 5;
exp->__anon1.list = MkList();
ProcessInstMembers(inst, inst->exp, exp->__anon1.list, 0);
ProcessExpression(inst->exp);
if(!(*exp->__anon1.list).count)
{
exp->type = 16;
(__ecereNameSpace__ecere__com__eSystem_Delete(exp->__anon1.list), exp->__anon1.list = 0);
}
}
else
{
struct Declaration * decl;
struct Declaration * dummyDecl;

{
dummyDecl = MkDeclaration((((void *)0)), (((void *)0)));
if(!curCompound->__anon1.compound.declarations)
curCompound->__anon1.compound.declarations = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*curCompound->__anon1.compound.declarations), (((void *)0)), dummyDecl);
sprintf(className, "__simpleStruct%d", curContext->simpleID++);
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();

if(inst->isConstant && ProcessBracketInst(inst, list))
{
decl = MkDeclaration(MkList(), MkList());
ListAdd(decl->__anon1.__anon1.specifiers, MkSpecifierName(inst->_class->__anon1.__anon1.name));
ListAdd(decl->__anon1.__anon1.declarators, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(className)), MkInitializerList(list)));
exp->type = 0;
exp->__anon1.__anon1.identifier = MkIdentifier(className);
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free((&*list), (((void *)0)));
(__ecereNameSpace__ecere__com__eSystem_Delete(list), list = 0);
decl = MkDeclarationInst(MkInstantiation(CopySpecifier(inst->_class), MkExpIdentifier(MkIdentifier(className)), (((void *)0))));
exp->type = 5;
exp->__anon1.list = MkList();
instExp = QMkExpId(className);
instExp->loc = exp->loc;
instExp->expType = MkClassType(inst->_class->__anon1.__anon1.name);
decl->__anon1.inst->fullSet = ProcessInstMembers(inst, instExp, exp->__anon1.list, 0);
ListAdd(exp->__anon1.list, instExp);
}
}
FreeType(exp->expType);
exp->expType = MkClassType(inst->_class->__anon1.__anon1.name);
{
void * prev = dummyDecl->prev, * next = dummyDecl->next;

*dummyDecl = *decl;
dummyDecl->prev = prev;
dummyDecl->next = next;
((decl ? (__ecereClass_Declaration->Destructor ? __ecereClass_Declaration->Destructor((void *)decl) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(decl)) : 0), decl = 0);
decl = dummyDecl;
}
ProcessDeclaration(decl);
}
}
}
else
{
struct Expression * newCall;

if(classSym && classSym->__anon1.registered && classSym->__anon1.registered->type == 5 && (classSym->__anon1.registered->templateClass ? classSym->__anon1.registered->templateClass->fixed : classSym->__anon1.registered->fixed))
{
char size[256];
struct __ecereNameSpace__ecere__com__Class * c = classSym->__anon1.registered->templateClass ? classSym->__anon1.registered->templateClass : classSym->__anon1.registered;
struct Expression * e = MkExpClassSize(MkSpecifierName(c->name));

ProcessExpressionType(e);
sprintf(size, "%d", c->structSize);
newCall = MkExpCall(QMkExpId("ecere::com::eSystem_New0"), MkListOne(e));
newCall->byReference = 1;
}
else
{
strcpy(className, "__ecereClass_");
if(classSym && classSym->__anon1.registered && classSym->__anon1.registered->type == 5 && classSym->__anon1.registered->templateClass)
{
classSym = FindClass(classSym->__anon1.registered->templateClass->fullName);
FullClassNameCat(className, classSym->string, 1);
}
else
FullClassNameCat(className, inst->_class->__anon1.__anon1.name, 1);
DeclareClass(curExternal, classSym, className);
newCall = MkExpCall(QMkExpId("ecere::com::eInstance_New"), MkListOne(QMkExpId(className)));
newCall->usage = exp->usage;
ProcessExpressionType(newCall);
if(newCall->expType && exp->expType)
newCall->expType->passAsTemplate = exp->expType->passAsTemplate;
newCall->byReference = 1;
}
if(inst->exp)
{
if(inst->members && (*inst->members).first)
{
exp->type = 5;
exp->__anon1.list = MkList();
if(!inst->built)
{
ListAdd(exp->__anon1.list, MkExpOp(inst->exp, '=', newCall));
}
else
FreeExpression(newCall);
ProcessInstMembers(inst, inst->exp, exp->__anon1.list, 0);
if(inst->built)
FreeExpression(inst->exp);
}
else
{
exp->type = 4;
exp->__anon1.op.op = '=';
exp->__anon1.op.exp1 = inst->exp;
exp->__anon1.op.exp2 = newCall;
ProcessExpression(inst->exp);
}
inst->exp = (((void *)0));
}
else
{
if(inst->members && (*inst->members).first)
{
int __simpleStruct0;
char ecereTemp[100];
struct MembersInit * members;
int tempCount = exp->tempCount;
struct __ecereNameSpace__ecere__sys__OldList * expList;

for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0 && members->__anon1.dataMembers)
{
struct MemberInit * member;

for(member = (*members->__anon1.dataMembers).first; member; member = member->next)
{
if(member->initializer && member->initializer->type == 0)
{
int __simpleStruct0;

ProcessMemberInitData(member);
tempCount = (__simpleStruct0 = member->initializer->__anon1.exp->tempCount, (tempCount > __simpleStruct0) ? tempCount : __simpleStruct0);
}
}
}
}
if(curDecl)
tempCount = ((tempCount > declTempCount) ? tempCount : declTempCount);
tempCount++;
curExternal->__anon1.function->tempCount = (__simpleStruct0 = curExternal->__anon1.function->tempCount, (__simpleStruct0 > tempCount) ? __simpleStruct0 : tempCount);
sprintf(ecereTemp, "__ecereInstance%d", tempCount);
exp->type = 23;
exp->__anon1.compound = MkCompoundStmt((((void *)0)), (((void *)0)));
exp->__anon1.compound->__anon1.compound.context = PushContext();
exp->__anon1.compound->__anon1.compound.context->simpleID = exp->__anon1.compound->__anon1.compound.context->parent->simpleID;
exp->__anon1.compound->__anon1.compound.declarations = MkListOne(QMkDeclaration(inst->_class->__anon1.__anon1.name, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(ecereTemp)), MkInitializerAssignment(newCall))));
exp->__anon1.compound->__anon1.compound.statements = MkListOne(MkExpressionStmt((expList = MkList())));
instExp = QMkExpId(ecereTemp);
instExp->tempCount = tempCount;
instExp->expType = MkClassType(inst->_class->__anon1.__anon1.name);
instExp->byReference = 1;
ProcessInstMembers(inst, instExp, expList, 0);
FreeExpression(instExp);
if(exp->usage)
{
struct Expression * tmpExp = QMkExpId(ecereTemp);

tmpExp->byReference = 1;
ListAdd(expList, tmpExp);
}
exp->tempCount = tempCount;
if(curDecl)
declTempCount = ((declTempCount > tempCount) ? declTempCount : tempCount);
PopContext(exp->__anon1.compound->__anon1.compound.context);
}
else
{
struct Expression * prev = exp->prev, * next = exp->next;

FreeType(newCall->destType);
FreeType(newCall->expType);
newCall->destType = exp->destType;
newCall->expType = exp->expType;
*exp = *newCall;
exp->prev = prev;
exp->next = next;
((newCall ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor((void *)newCall) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(newCall)) : 0), newCall = 0);
}
}
}
if(exp->type != 1)
FreeInstance(inst);
}
else
ProcessInstantiation(inst);
break;
}
case 2:
break;
case 3:
break;
case 13:
case 26:
ProcessExpression(exp->__anon1._new.size);
break;
case 14:
case 27:
ProcessExpression(exp->__anon1._renew.size);
ProcessExpression(exp->__anon1._renew.exp);
break;
case 4:
{
switch(exp->__anon1.op.op)
{
case '=':
if(exp->__anon1.op.exp2)
exp->__anon1.op.exp2->usage = (exp->__anon1.op.exp2->usage & ~0x1) | (((unsigned int)(1)) << 0);
if(exp->__anon1.op.exp1)
exp->__anon1.op.exp1->usage = (exp->__anon1.op.exp1->usage & ~0x2) | (((unsigned int)(1)) << 1);
break;
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
if(exp->__anon1.op.exp2)
exp->__anon1.op.exp2->usage = (exp->__anon1.op.exp2->usage & ~0x1) | (((unsigned int)(1)) << 0);
if(exp->__anon1.op.exp1)
exp->__anon1.op.exp1->usage = (exp->__anon1.op.exp1->usage & ~0x2) | (((unsigned int)(1)) << 1);
break;
case INC_OP:
case DEC_OP:
if(exp->__anon1.op.exp1)
exp->__anon1.op.exp1->usage = (exp->__anon1.op.exp1->usage & ~0x2) | (((unsigned int)(1)) << 1);
case '&':
if(exp->__anon1.op.exp1 && exp->__anon1.op.exp2)
{
exp->__anon1.op.exp1->usage = (exp->__anon1.op.exp1->usage & ~0x1) | (((unsigned int)(1)) << 0);
exp->__anon1.op.exp2->usage = (exp->__anon1.op.exp2->usage & ~0x1) | (((unsigned int)(1)) << 0);
}
break;
case '*':
case '+':
case '-':
if(exp->__anon1.op.exp1)
{
exp->__anon1.op.exp1->usage = (exp->__anon1.op.exp1->usage & ~0x1) | (((unsigned int)(1)) << 0);
}
case '~':
case '!':
if(exp->__anon1.op.exp2)
exp->__anon1.op.exp2->usage = (exp->__anon1.op.exp2->usage & ~0x1) | (((unsigned int)(1)) << 0);
break;
case '/':
case '%':
case LEFT_OP:
case RIGHT_OP:
case '<':
case '>':
case LE_OP:
case GE_OP:
case EQ_OP:
case NE_OP:
case '|':
case '^':
case AND_OP:
case OR_OP:
if(exp->__anon1.op.exp1)
exp->__anon1.op.exp1->usage = (exp->__anon1.op.exp1->usage & ~0x1) | (((unsigned int)(1)) << 0);
if(exp->__anon1.op.exp2)
exp->__anon1.op.exp2->usage = (exp->__anon1.op.exp2->usage & ~0x1) | (((unsigned int)(1)) << 0);
break;
}
if(exp->__anon1.op.exp1)
{
if(exp->__anon1.op.exp1 && exp->__anon1.op.exp2 && exp->__anon1.op.exp1->destType && exp->__anon1.op.exp1->destType->passAsTemplate && exp->__anon1.op.exp1->expType && !exp->__anon1.op.exp1->expType->passAsTemplate && !((unsigned int)((exp->__anon1.op.exp1->usage & 0x2) >> 1)))
{
struct Type * type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

CopyTypeInto(type, exp->__anon1.op.exp1->destType);
type->passAsTemplate = 0;
FreeType(exp->__anon1.op.exp1->destType);
exp->__anon1.op.exp1->destType = type;
}
ProcessExpression(exp->__anon1.op.exp1);
}
if(exp->__anon1.op.exp2)
{
if(exp->__anon1.op.exp1 && exp->__anon1.op.exp2 && exp->__anon1.op.exp2->destType && exp->__anon1.op.exp2->destType->passAsTemplate && exp->__anon1.op.exp2->expType && !exp->__anon1.op.exp2->expType->passAsTemplate && !((unsigned int)((exp->__anon1.op.exp1->usage & 0x2) >> 1)))
{
struct Type * type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

CopyTypeInto(type, exp->__anon1.op.exp2->destType);
type->passAsTemplate = 0;
FreeType(exp->__anon1.op.exp2->destType);
exp->__anon1.op.exp2->destType = type;
}
if(exp->__anon1.op.exp1)
exp->__anon1.op.exp2->tempCount = exp->__anon1.op.exp1->tempCount;
ProcessExpression(exp->__anon1.op.exp2);
}
break;
}
case 32:
case 5:
{
struct Expression * e;

for(e = (*exp->__anon1.list).first; e; e = e->next)
{
int __simpleStruct2, __simpleStruct3;
int __simpleStruct0, __simpleStruct1;

e->tempCount = (__simpleStruct0 = e->tempCount, __simpleStruct1 = exp->tempCount, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
if(!e->next)
{
e->usage |= (exp->usage & ((((unsigned int)(1)) | (((unsigned int)(1)) << 2))));
}
ProcessExpression(e);
exp->tempCount = (__simpleStruct2 = exp->tempCount, __simpleStruct3 = e->tempCount, (__simpleStruct2 > __simpleStruct3) ? __simpleStruct2 : __simpleStruct3);
}
break;
}
case 6:
{
struct Expression * e;

exp->__anon1.index.exp->usage = (exp->__anon1.index.exp->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(exp->__anon1.index.exp);
for(e = (*exp->__anon1.index.index).first; e; e = e->next)
{
if(!e->next)
e->usage = (e->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(e);
}
exp->tempCount = exp->__anon1.index.exp->tempCount;
break;
}
case 7:
{
struct Expression * e;

ProcessExpression(exp->__anon1.call.exp);
if(exp->__anon1.call.arguments)
{
for(e = (*exp->__anon1.call.arguments).first; e; e = e->next)
{
e->usage = (e->usage & ~0x1) | (((unsigned int)(1)) << 0);
e->usage = (e->usage & ~0x4) | (((unsigned int)(1)) << 2);
ProcessExpression(e);
}
}
break;
}
case 8:
{
exp->__anon1.member.exp->usage = (exp->__anon1.member.exp->usage & ~0x1) | (((unsigned int)(1)) << 0);
if(exp->__anon1.member.memberType == 3 && exp->__anon1.member.exp->expType && exp->__anon1.member.exp->expType->thisClassFrom && exp->__anon1.member.exp->expType->kind == 8 && exp->__anon1.member.exp->expType->__anon1._class && exp->__anon1.member.exp->expType->__anon1._class->__anon1.registered && !__ecereNameSpace__ecere__com__eClass_IsDerived(exp->__anon1.member.exp->expType->thisClassFrom, exp->__anon1.member.exp->expType->__anon1._class->__anon1.registered))
exp->__anon1.member.exp->expType->passAsTemplate = 1;
ProcessExpression(exp->__anon1.member.exp);
if(!exp->__anon1.member.memberType)
{
struct Type * type = exp->__anon1.member.exp->expType;

if((type && type->kind == 8 && exp->__anon1.member.member))
{
struct __ecereNameSpace__ecere__com__Class * _class = (exp->__anon1.member.member->_class && exp->__anon1.member.member->classSym) ? exp->__anon1.member.member->classSym->__anon1.registered : (type->__anon1._class ? type->__anon1._class->__anon1.registered : (((void *)0)));
struct __ecereNameSpace__ecere__com__Property * prop = (((void *)0));
struct __ecereNameSpace__ecere__com__Method * method = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * member = (((void *)0));
struct __ecereNameSpace__ecere__com__Property * revConvert = (((void *)0));

if(exp->__anon1.member.thisPtr)
{
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, exp->__anon1.member.member->string, privateModule, (((void *)0)), (((void *)0)));
if(!member)
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, exp->__anon1.member.member->string, privateModule);
}
else
{
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, exp->__anon1.member.member->string, (((void *)0)));
if(!prop)
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, exp->__anon1.member.member->string, (((void *)0)), (((void *)0)), (((void *)0)));
if(!prop && !member)
{
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, exp->__anon1.member.member->string, (((void *)0)));
if(!method)
{
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, exp->__anon1.member.member->string, privateModule);
if(!prop)
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, exp->__anon1.member.member->string, privateModule, (((void *)0)), (((void *)0)));
}
}
}
if(!prop && !member && !method)
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, exp->__anon1.member.member->string, privateModule);
if(!prop && !member && !method)
{
struct Symbol * classSym = FindClass(exp->__anon1.member.member->string);

if(classSym)
{
struct __ecereNameSpace__ecere__com__Class * convertClass = classSym->__anon1.registered;

if(convertClass)
revConvert = __ecereNameSpace__ecere__com__eClass_FindProperty(convertClass, _class->fullName, privateModule);
}
}
if(prop)
{
exp->__anon1.member.memberType = 1;
if(!prop->dataType)
prop->dataType = ProcessTypeString(prop->dataTypeString, 0);
FreeType(exp->expType);
exp->expType = prop->dataType;
if(prop->dataType)
prop->dataType->refCount++;
}
else if(method)
{
exp->__anon1.member.memberType = 2;
if(!method->dataType)
ProcessMethodType(method);
FreeType(exp->expType);
exp->expType = method->dataType;
if(method->dataType)
method->dataType->refCount++;
}
else if(member)
{
exp->__anon1.member.memberType = 3;
DeclareStruct(curExternal, _class->fullName, 0, 1);
if(!member->dataType)
member->dataType = ProcessTypeString(member->dataTypeString, 0);
FreeType(exp->expType);
exp->expType = member->dataType;
if(member->dataType)
member->dataType->refCount++;
}
else if(revConvert)
{
exp->__anon1.member.memberType = 4;
FreeType(exp->expType);
exp->expType = MkClassType(revConvert->_class->fullName);
}
}
}
break;
}
case 10:
break;
case 11:
{
exp->__anon1.cast.exp->usage |= exp->usage;
ProcessExpression(exp->__anon1.cast.exp);
break;
}
case 12:
{
struct Expression * e;

if(((unsigned int)((exp->usage & 0x1) >> 0)))
exp->__anon1.cond.cond->usage = (exp->__anon1.cond.cond->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(exp->__anon1.cond.cond);
for(e = (*exp->__anon1.cond.exp).first; e; e = e->next)
{
if(!e->next && ((unsigned int)((exp->usage & 0x1) >> 0)))
e->usage = (e->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(e);
}
if(exp->__anon1.cond.elseExp)
{
if(((unsigned int)((exp->usage & 0x1) >> 0)))
exp->__anon1.cond.elseExp->usage = (exp->__anon1.cond.elseExp->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(exp->__anon1.cond.elseExp);
}
break;
}
case 23:
{
if(exp->__anon1.compound->__anon1.compound.statements && ((struct Statement *)(*exp->__anon1.compound->__anon1.compound.statements).last)->type == 3 && ((struct Statement *)(*exp->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions && (*((struct Statement *)(*exp->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions).last)
{
((struct Expression *)(*((struct Statement *)(*exp->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions).last)->usage = exp->usage;
}
ProcessStatement(exp->__anon1.compound);
break;
}
case 34:
{
ProcessExpression(exp->__anon1.vaArg.exp);
break;
}
case 33:
{
ProcessInitializer(exp->__anon1.initializer.initializer);
break;
}
}
CheckTemplateTypes(exp);
}

static unsigned int ProcessBracketInst_DataMember(struct __ecereNameSpace__ecere__com__DataMember * parentMember, struct Instantiation * inst, struct __ecereNameSpace__ecere__sys__OldList * list, struct __ecereNameSpace__ecere__com__DataMember * namedParentMember, unsigned int parentMemberSet)
{
struct Symbol * classSym = inst->_class->__anon1.__anon1.symbol;
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (((void *)0));
unsigned int someMemberSet = 0;
int anonID = 1;

for(dataMember = parentMember->members.first; dataMember; dataMember = dataMember->next)
{
struct MembersInit * members;
struct MemberInit * member = (((void *)0));

if(!dataMember->name && (dataMember->type == 1 || dataMember->type == 2))
{
struct __ecereNameSpace__ecere__sys__OldList * subList = MkList();

if(!ProcessBracketInst_DataMember(dataMember, inst, subList ? subList : list, dataMember->name ? dataMember : namedParentMember, someMemberSet || parentMemberSet || dataMember->prev))
{
if(subList)
FreeList(subList, (void *)(FreeInitializer));
return 0;
}
if(subList && (*subList).count)
{
struct Initializer * init = MkInitializerList(subList);
char id[100];

sprintf(id, "__anon%d", anonID);
init->id = MkIdentifier(id);
ListAdd(list, init);
someMemberSet = 1;
}
else
{
if(list->count)
someMemberSet = 1;
(__ecereNameSpace__ecere__com__eSystem_Delete(subList), subList = 0);
}
anonID++;
}
else
{
struct __ecereNameSpace__ecere__com__Class * curClass = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * curMember = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * subMemberStack[256];
int subMemberStackPos = 0;
unsigned int found = 0;

if(inst->members && (*inst->members).first)
{
for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0)
{
for(member = (*members->__anon1.dataMembers).first; member; member = member->next)
{
if(member->identifiers)
{
struct Identifier * firstID = (*member->identifiers).first;
struct __ecereNameSpace__ecere__com__DataMember * _subMemberStack[256];
int _subMemberStackPos = 0;
struct __ecereNameSpace__ecere__com__DataMember * thisMember;

thisMember = firstID ? (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(classSym->__anon1.registered, firstID->string, privateModule) : (((void *)0));
if(!thisMember && firstID)
thisMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(classSym->__anon1.registered, firstID->string, privateModule, _subMemberStack, &_subMemberStackPos);
if(thisMember && thisMember->memberAccess == 1)
{
curMember = thisMember;
curClass = curMember->_class;
memcpy(subMemberStack, _subMemberStack, sizeof(struct __ecereNameSpace__ecere__com__DataMember *) * _subMemberStackPos);
subMemberStackPos = _subMemberStackPos;
}
if(dataMember == thisMember)
{
if((*member->identifiers).count > 1 && member->initializer && member->initializer->type == 0)
{
struct __ecereNameSpace__ecere__sys__OldList * partList = MkList();
struct Symbol * symbol;
struct Specifier * spec;
struct MembersInit * nextMembers;
struct MemberInit * next = member->next;

if(!dataMember->dataType)
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0);
symbol = (dataMember->dataType && dataMember->dataType->kind == 8) ? dataMember->dataType->__anon1._class : (((void *)0));
spec = _MkSpecifierName(dataMember->dataTypeString, symbol, (((void *)0)));
{
struct __ecereNameSpace__ecere__sys__OldList * identifiers = MkList();
struct Identifier * id;

for(id = ((struct Identifier *)(*member->identifiers).first)->next; id; id = id->next)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*identifiers), CopyIdentifier(id));
ListAdd(partList, MkMemberInit(identifiers, MkInitializerAssignment(member->initializer->__anon1.exp)));
}
for(nextMembers = members; nextMembers; nextMembers = nextMembers->next)
{
if(!nextMembers->__anon1.dataMembers)
continue;
if(members != nextMembers)
next = (*nextMembers->__anon1.dataMembers).first;
if(nextMembers->type == 0)
{
struct MemberInit * nextMember;

for(nextMember = next; nextMember; nextMember = next, next = nextMember ? nextMember->next : (((void *)0)))
{
struct Identifier * nextID = (*nextMember->identifiers).first;

if(nextMember->identifiers && (*nextMember->identifiers).count > 1 && !strcmp(firstID->string, nextID->string))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*nextMembers->__anon1.dataMembers), nextMember);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*nextMember->identifiers), nextID);
ListAdd(partList, nextMember);
FreeIdentifier(nextID);
}
}
}
}
member->initializer->__anon1.exp = MkExpInstance(MkInstantiation(spec, (((void *)0)), MkListOne(MkMembersInitList(partList))));
}
found = 1;
break;
}
}
else
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(classSym->__anon1.registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
if(curMember == dataMember)
{
found = 1;
break;
}
}
}
}
if(found)
break;
}
}
if(member && member->initializer && member->initializer->type == 0)
{
struct Initializer * init = (init = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Initializer), init->loc = yylloc, init);

if(namedParentMember->type == 1 && dataMember->name)
init->id = MkIdentifier(dataMember->name);
if(member->initializer->__anon1.exp->type == 1 && member->initializer->__anon1.exp->expType && member->initializer->__anon1.exp->expType->__anon1._class->__anon1.registered->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldList * subList = MkList();

ProcessBracketInst(member->initializer->__anon1.exp->__anon1.instance, subList);
FreeExpression(member->initializer->__anon1.exp);
if((*subList).count)
{
init->type = 1;
init->__anon1.list = subList;
}
else
{
FreeInitializer(init);
init = (((void *)0));
}
}
else
{
member->initializer->__anon1.exp->usage = (member->initializer->__anon1.exp->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(member->initializer->__anon1.exp);
init->type = 0;
init->__anon1.exp = member->initializer->__anon1.exp;
}
if(init)
ListAdd(list, init);
member->initializer->__anon1.exp = (((void *)0));
FreeInitializer(member->initializer);
member->initializer = (((void *)0));
someMemberSet = 1;
}
else if(member && member->initializer && member->initializer->type == 1)
{
if(namedParentMember->type == 1 && dataMember->name)
member->initializer->id = MkIdentifier(dataMember->name);
ListAdd(list, member->initializer);
member->initializer = (((void *)0));
someMemberSet = 1;
}
else if(dataMember && dataMember->dataTypeString && parentMember->type != 1 && namedParentMember->type != 1)
{
struct Symbol * classSym;
struct Initializer * init = (init = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Initializer), init->loc = yylloc, init);

if(namedParentMember->type == 1 && dataMember->name)
init->id = MkIdentifier(dataMember->name);
if(!dataMember->dataType)
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0);
classSym = (dataMember->dataType && dataMember->dataType->kind == 8) ? dataMember->dataType->__anon1._class : (((void *)0));
if(classSym && classSym->__anon1.registered && classSym->__anon1.registered->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldList * subList = MkList();
struct Specifier * spec = _MkSpecifierName(dataMember->dataTypeString, classSym, (((void *)0)));
struct Instantiation * inst = MkInstantiation(spec, (((void *)0)), (((void *)0)));

ProcessBracketInst(inst, subList);
FreeInstance(inst);
if((*subList).count)
{
init->type = 1;
init->__anon1.list = subList;
}
else
{
FreeInitializer(init);
init = (((void *)0));
}
}
else
{
init->type = 0;
init->__anon1.exp = MkExpConstant("0");
}
someMemberSet = 1;
if(init)
ListAdd(list, init);
}
}
}
if(!someMemberSet && !parentMemberSet)
{
struct Symbol * classSym;
struct Initializer * init = (init = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Initializer), init->loc = yylloc, init);

dataMember = parentMember->members.first;
if(namedParentMember->type == 1 && dataMember->name)
init->id = MkIdentifier(dataMember->name);
if(!dataMember->dataType && dataMember->dataTypeString)
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0);
classSym = (dataMember->dataType && dataMember->dataType->kind == 8) ? dataMember->dataType->__anon1._class : (((void *)0));
if(classSym && classSym->__anon1.registered && classSym->__anon1.registered->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldList * subList = MkList();
struct Specifier * spec = _MkSpecifierName(dataMember->dataTypeString, classSym, (((void *)0)));
struct Instantiation * inst = MkInstantiation(spec, (((void *)0)), (((void *)0)));

ProcessBracketInst(inst, subList);
FreeInstance(inst);
init->type = 1;
init->__anon1.list = subList;
}
else if(dataMember->dataType && (dataMember->dataType->kind == 12 || dataMember->dataType->kind == 9))
{
struct Type * t = dataMember->dataType->kind == 12 ? dataMember->dataType->__anon1.type : dataMember->dataType->__anon1.__anon1.members.first;
struct Initializer * i = MkInitializerAssignment(MkExpConstant("0"));

while(t && (t->kind == 12 || t->kind == 9))
{
i = MkInitializerList(MkListOne(i));
if(t->kind == 12)
t = t->__anon1.type;
else if(t->kind == 9)
t = t->__anon1.__anon1.members.first;
}
init->type = 1;
init->__anon1.list = MkListOne(i);
}
else
{
init->type = 0;
init->__anon1.exp = MkExpConstant("0");
}
ListAdd(list, init);
}
return 1;
}

static void ProcessDeclaration(struct Declaration * decl)
{
yylloc = decl->loc;
switch(decl->type)
{
case 1:
{
if(!curDecl)
{
curDecl = decl;
declTempCount = 0;
}
if(decl->__anon1.__anon1.specifiers)
{
struct Specifier * s;

for(s = (*decl->__anon1.__anon1.specifiers).first; s; s = s->next)
{
ProcessSpecifier(s);
}
}
if(decl->__anon1.__anon1.declarators)
{
struct InitDeclarator * d;

for(d = (*decl->__anon1.__anon1.declarators).first; d; d = d->next)
{
if(d->initializer)
ProcessInitializer(d->initializer);
}
}
if(curDecl == decl)
{
curDecl = (((void *)0));
declTempCount = 0;
}
break;
}
case 2:
{
struct Instantiation * inst = decl->__anon1.inst;

if(inCompiler)
{
struct Symbol * classSym = inst->_class->__anon1.__anon1.symbol;

if(!curCompound)
{
struct Statement * stmt;

if(!inst->isConstant || (classSym && classSym->__anon1.registered && (classSym->__anon1.registered->type == 0 || classSym->__anon1.registered->type == 5)))
{
decl->type = 1;
decl->__anon1.__anon1.specifiers = MkListOne(MkSpecifierName(inst->_class->__anon1.__anon1.name));
if(decl->declMode == 3)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*decl->__anon1.__anon1.specifiers), (((void *)0)), MkSpecifier(STATIC));
}
decl->__anon1.__anon1.declarators = MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(inst->exp->__anon1.__anon1.identifier->string)), (((void *)0))));
ProcessDeclaration(decl);
CreateInstancesBody();
{
struct Expression * exp = MkExpInstance(inst);

stmt = MkExpressionStmt(MkListOne(exp));
ListAdd(createInstancesBody->__anon1.compound.statements, stmt);
ProcessExpressionType(exp);
}
if(classSym && classSym->__anon1.registered && (classSym->__anon1.registered->type == 0))
{
ListAdd(createInstancesBody->__anon1.compound.statements, MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_IncRef")), MkListOne(CopyExpression(inst->exp))))));
{
struct Expression * exp = MkExpOp((((void *)0)), DELETE, CopyExpression(inst->exp));

ListAddFront(destroyInstancesBody->__anon1.compound.statements, MkExpressionStmt(MkListOne(exp)));
ProcessExpressionType(exp);
}
}
else if(classSym && classSym->__anon1.registered && (classSym->__anon1.registered->type == 5))
{
struct Expression * exp = MkExpOp((((void *)0)), DELETE, CopyExpression(inst->exp));

ListAddFront(destroyInstancesBody->__anon1.compound.statements, MkExpressionStmt(MkListOne(exp)));
ProcessExpressionType(exp);
}
__ecereMethod_External_CreateEdge(createInstancesExternal, curExternal, 0);
__ecereMethod_External_CreateEdge(destroyInstancesExternal, curExternal, 0);
break;
}
else
{
CreateInstancesBody();
}
}
{
char className[1024];

className[0] = (char)0;
decl->type = 1;
decl->__anon1.__anon1.specifiers = MkList();
decl->__anon1.__anon1.declarators = MkList();
if(classSym && classSym->__anon1.registered && classSym->__anon1.registered->type == 2)
{
struct __ecereNameSpace__ecere__sys__OldList list =
{
0
};

ProcessInstMembers(inst, inst->exp, &list, 0);
ProcessExpression(inst->exp);
ListAdd(decl->__anon1.__anon1.specifiers, MkSpecifierName(inst->_class->__anon1.__anon1.name));
ListAdd(decl->__anon1.__anon1.declarators, MkInitDeclarator(MkDeclaratorIdentifier(inst->exp->__anon1.__anon1.identifier), MkInitializerAssignment(list.first)));
inst->exp->__anon1.__anon1.identifier = (((void *)0));
}
else if(classSym && classSym->__anon1.registered && classSym->__anon1.registered->type == 3)
{
struct __ecereNameSpace__ecere__sys__OldList list =
{
0
};

ProcessInstMembers(inst, inst->exp, &list, 0);
ProcessExpression(inst->exp);
ListAdd(decl->__anon1.__anon1.specifiers, MkSpecifierName(inst->_class->__anon1.__anon1.name));
ListAdd(decl->__anon1.__anon1.declarators, MkInitDeclarator(MkDeclaratorIdentifier(inst->exp->__anon1.__anon1.identifier), MkInitializerAssignment(list.first)));
inst->exp->__anon1.__anon1.identifier = (((void *)0));
}
else if(classSym && classSym->__anon1.registered && classSym->__anon1.registered->type == 1)
{
struct Expression * exp;

DeclareStruct(curExternal, inst->_class->__anon1.__anon1.name, 0, 1);
ProcessExpression(inst->exp);
{
if(inst->fullSet)
{
ListAdd(decl->__anon1.__anon1.specifiers, MkSpecifierName(inst->_class->__anon1.__anon1.name));
ListAdd(decl->__anon1.__anon1.declarators, MkInitDeclarator(MkDeclaratorIdentifier(inst->exp->__anon1.__anon1.identifier), (((void *)0))));
inst->exp->__anon1.__anon1.identifier = (((void *)0));
}
else
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();

if(ProcessBracketInst(inst, list))
{
ListAdd(decl->__anon1.__anon1.specifiers, MkSpecifierName(inst->_class->__anon1.__anon1.name));
ListAdd(decl->__anon1.__anon1.declarators, MkInitDeclarator(MkDeclaratorIdentifier(inst->exp->__anon1.__anon1.identifier), MkInitializerList(list)));
inst->exp->__anon1.__anon1.identifier = (((void *)0));
}
else
{
FreeList(list, (void *)(FreeInitializer));
exp = MkExpBrackets(MkList());
ProcessInstMembers(inst, inst->exp, exp->__anon1.list, 1);
ListAdd(exp->__anon1.list, CopyExpression(inst->exp));
ListAdd(decl->__anon1.__anon1.specifiers, MkSpecifierName(inst->_class->__anon1.__anon1.name));
ListAdd(decl->__anon1.__anon1.declarators, MkInitDeclarator(MkDeclaratorIdentifier(inst->exp->__anon1.__anon1.identifier), MkInitializerAssignment(exp)));
inst->exp->__anon1.__anon1.identifier = (((void *)0));
}
}
}
}
else
{
struct Expression * newCall;

strcpy(className, "__ecereClass_");
if(classSym && classSym->__anon1.registered && classSym->__anon1.registered->type == 5 && classSym->__anon1.registered->templateClass)
{
classSym = FindClass(classSym->__anon1.registered->templateClass->fullName);
FullClassNameCat(className, classSym->string, 1);
}
else
FullClassNameCat(className, inst->_class->__anon1.__anon1.name, 1);
if(classSym)
DeclareClass(curExternal, classSym, className);
if(classSym && classSym->__anon1.registered && classSym->__anon1.registered->type == 5 && (classSym->__anon1.registered->templateClass ? classSym->__anon1.registered->templateClass->fixed : classSym->__anon1.registered->fixed))
{
char size[256];
struct __ecereNameSpace__ecere__com__Class * c = classSym->__anon1.registered->templateClass ? classSym->__anon1.registered->templateClass : classSym->__anon1.registered;
struct Expression * e = MkExpClassSize(MkSpecifierName(c->name));

ProcessExpressionType(e);
sprintf(size, "%d", c->structSize);
newCall = MkExpCall(QMkExpId("ecere::com::eSystem_New0"), MkListOne(e));
}
else
{
newCall = MkExpCall(QMkExpId("ecere::com::eInstance_New"), MkListOne(QMkExpId(className)));
ProcessExpressionType(newCall);
newCall->byReference = 1;
}
if(inst->exp)
{
struct Expression * exp, * newExp;
struct Identifier * id = CopyIdentifier(inst->exp->__anon1.__anon1.identifier);

if(inst->members && (*inst->members).first)
{
newExp = MkExpOp(CopyExpression(inst->exp), '=', newCall);
exp = MkExpBrackets(MkList());
ListAdd(exp->__anon1.list, newExp);
ProcessInstMembers(inst, inst->exp, exp->__anon1.list, 0);
ListAdd(exp->__anon1.list, inst->exp);
ProcessExpression(inst->exp);
inst->exp = (((void *)0));
}
else
exp = newCall;
ListAdd(decl->__anon1.__anon1.specifiers, MkSpecifierName(inst->_class->__anon1.__anon1.name));
ListAdd(decl->__anon1.__anon1.declarators, MkInitDeclarator(MkDeclaratorIdentifier(id), MkInitializerAssignment(exp)));
}
else
FreeExpression(newCall);
}
}
FreeInstance(inst);
}
else
ProcessInstantiation(inst);
break;
}
case 0:
{
if(decl->__anon1.__anon1.specifiers)
{
struct Specifier * spec;

for(spec = (*decl->__anon1.__anon1.specifiers).first; spec; spec = spec->next)
ProcessSpecifier(spec);
}
break;
}
}
}

