/* Code generated from eC source file: firstPass.ec */
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
IDENTIFIER = 258, CONSTANT = 259, STRING_LITERAL = 260, SIZEOF = 261, PTR_OP = 262, INC_OP = 263, DEC_OP = 264, LEFT_OP = 265, RIGHT_OP = 266, LE_OP = 267, GE_OP = 268, EQ_OP = 269, NE_OP = 270, AND_OP = 271, OR_OP = 272, MUL_ASSIGN = 273, DIV_ASSIGN = 274, MOD_ASSIGN = 275, ADD_ASSIGN = 276, SUB_ASSIGN = 277, LEFT_ASSIGN = 278, RIGHT_ASSIGN = 279, AND_ASSIGN = 280, XOR_ASSIGN = 281, OR_ASSIGN = 282, TYPE_NAME = 283, TYPEDEF = 284, EXTERN = 285, STATIC = 286, AUTO = 287, REGISTER = 288, CHAR = 289, SHORT = 290, INT = 291, UINT = 292, INT64 = 293, INT128 = 294, FLOAT128 = 295, LONG = 296, SIGNED = 297, UNSIGNED = 298, FLOAT = 299, DOUBLE = 300, CONST = 301, VOLATILE = 302, VOID = 303, VALIST = 304, STRUCT = 305, UNION = 306, ENUM = 307, ELLIPSIS = 308, CASE = 309, DEFAULT = 310, IF = 311, SWITCH = 312, WHILE = 313, DO = 314, FOR = 315, GOTO = 316, CONTINUE = 317, BREAK = 318, RETURN = 319, IFX = 320, ELSE = 321, CLASS = 322, THISCLASS = 323, PROPERTY = 324, SETPROP = 325, GETPROP = 326, NEWOP = 327, RENEW = 328, DELETE = 329, EXT_DECL = 330, EXT_STORAGE = 331, IMPORT = 332, DEFINE = 333, VIRTUAL = 334, ATTRIB = 335, PUBLIC = 336, PRIVATE = 337, TYPED_OBJECT = 338, ANY_OBJECT = 339, _INCREF = 340, EXTENSION = 341, ASM = 342, TYPEOF = 343, WATCH = 344, STOPWATCHING = 345, FIREWATCHERS = 346, WATCHABLE = 347, CLASS_DESIGNER = 348, CLASS_NO_EXPANSION = 349, CLASS_FIXED = 350, ISPROPSET = 351, CLASS_DEFAULT_PROPERTY = 352, PROPERTY_CATEGORY = 353, CLASS_DATA = 354, CLASS_PROPERTY = 355, SUBCLASS = 356, NAMESPACE = 357, NEW0OP = 358, RENEW0 = 359, VAARG = 360, DBTABLE = 361, DBFIELD = 362, DBINDEX = 363, DATABASE_OPEN = 364, ALIGNOF = 365, ATTRIB_DEP = 366, __ATTRIB = 367, BOOL = 368, _BOOL = 369, _COMPLEX = 370, _IMAGINARY = 371, RESTRICT = 372, THREAD = 373, WIDE_STRING_LITERAL = 374, BUILTIN_OFFSETOF = 375
};

extern unsigned int inCompiler;

extern unsigned int buildingECERECOMModule;

struct __ecereNameSpace__ecere__sys__OldList
{
void *  first;
void *  last;
int count;
unsigned int offset;
unsigned int circ;
} ecere_gcc_struct;

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

struct Enumerator;

struct Pointer;

struct Initializer;

struct InitDeclarator;

struct TypeName;

struct Statement;

struct FunctionDefinition;

struct AsmField;

struct Attrib;

struct ExtDecl;

struct Attribute;

struct MembersInit;

struct MemberInit;

struct PropertyWatch;

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

extern int strtol(const char * , char * * , int base);

extern void Compiler_Error(const char *  format, ...);

extern const char *  __ecereNameSpace__ecere__GetTranslatedString(const char * name, const char *  string, const char *  stringAndContext);

extern char *  __ecereNameSpace__ecere__sys__CopyString(const char *  string);

struct ModuleImport;

struct ClassImport;

struct __ecereNameSpace__ecere__com__ClassProperty;

extern int strcmp(const char * , const char * );

extern char *  strcpy(char * , const char * );

extern char *  strcat(char * , const char * );

struct __ecereNameSpace__ecere__com__ClassTemplateParameter;

struct __ecereNameSpace__ecere__com__LinkList
{
void * first;
void * last;
int count;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__sys__OldList *  MkListOne(void *  item);

extern struct __ecereNameSpace__ecere__sys__OldList *  excludedSymbols;

extern void FreeList(struct __ecereNameSpace__ecere__sys__OldList * list, void (*  FreeFunction)(void * ));

extern struct __ecereNameSpace__ecere__sys__OldList *  ast;

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

struct Location
{
struct CodePosition start;
struct CodePosition end;
} ecere_gcc_struct;

extern struct ModuleImport * mainModule;

extern struct Location yylloc;

struct Expression;

extern void ProcessExpressionType(struct Expression * exp);

extern void ComputeExpression(struct Expression * exp);

extern void FreeExpression(struct Expression * exp);

struct Context;

extern struct Context * globalContext;

struct External;

extern struct External * curExternal;

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} ecere_gcc_struct;

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

extern struct __ecereNameSpace__ecere__com__ClassProperty * __ecereNameSpace__ecere__com__eClass_AddClassProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  dataType, void *  setStmt, void *  getStmt);

extern void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(struct __ecereNameSpace__ecere__com__Class * base);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

struct Declarator;

extern char *  StringFromSpecDecl(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

extern struct Declarator * GetFuncDecl(struct Declarator * decl);

struct TemplateDatatype
{
struct __ecereNameSpace__ecere__sys__OldList *  specifiers;
struct Declarator * decl;
} ecere_gcc_struct;

struct Type;

extern struct Type * ProcessType(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

extern void PrintType(struct Type * type, char *  string, unsigned int printName, unsigned int fullName);

extern void FreeType(struct Type * type);

struct __ecereNameSpace__ecere__com__DataMember;

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_AddDataMember(struct __ecereNameSpace__ecere__com__DataMember * member, const char *  name, const char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_New(int type, int declMode);

extern unsigned int __ecereNameSpace__ecere__com__eMember_AddMember(struct __ecereNameSpace__ecere__com__DataMember * addTo, struct __ecereNameSpace__ecere__com__DataMember * dataMember);

extern unsigned int __ecereNameSpace__ecere__com__eClass_AddMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__DataMember * dataMember);

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

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  dataType, void *  setStmt, void *  getStmt, int declMode);

extern void __ecereNameSpace__ecere__com__eProperty_Watchable(struct __ecereNameSpace__ecere__com__Property * _property);

struct Specifier;

extern void FreeSpecifier(struct Specifier * spec);

struct Symbol;

extern struct Symbol * FindType(struct Context * ctx, const char *  name);

extern struct Symbol * FindClass(const char *  name);

struct __ecereNameSpace__ecere__sys__OldLink;

struct __ecereNameSpace__ecere__sys__OldLink
{
struct __ecereNameSpace__ecere__sys__OldLink * prev;
struct __ecereNameSpace__ecere__sys__OldLink * next;
void *  data;
} ecere_gcc_struct;

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

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

struct ClassDef;

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

extern struct Operand GetOperand(struct Expression * exp);

struct __ecereNameSpace__ecere__com__BitMember;

extern struct __ecereNameSpace__ecere__com__BitMember * __ecereNameSpace__ecere__com__eClass_AddBitMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, int bitSize, int bitPos, int declMode);

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

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__ClassTemplateParameter * __ecereNameSpace__ecere__com__eClass_AddTemplateParameter(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, int type, const void *  info, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * defaultArg);

struct __ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, const char *  name);

extern struct __ecereNameSpace__ecere__com__Instance * privateModule;

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, const char *  name, const char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(const char *  name, const char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

struct Identifier;

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

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

struct Instantiation;

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Type;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Symbol;

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

void __ecereUnregisterModule_firstPass(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

struct TemplateParameter;

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
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

struct TemplateArgument;

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

struct Declaration;

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

static void AddDefinitions(struct __ecereNameSpace__ecere__com__Class * regClass, struct __ecereNameSpace__ecere__com__DataMember * member, struct __ecereNameSpace__ecere__sys__OldList * definitions)
{
if(definitions != (((void *)0)))
{
struct ClassDef * def;

for(def = definitions->first; def; def = def->next)
{
if(def->type == 2)
{
struct Declaration * decl = def->__anon1.decl;
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (((void *)0));
struct Type * dataType;

if(decl->type == 0)
{
struct Declarator * d;

if(decl->__anon1.__anon1.declarators)
{
for(d = (*decl->__anon1.__anon1.declarators).first; d; d = d->next)
{
struct Identifier * declId = GetDeclId(d);

if(declId)
{
if(regClass && regClass->type == 2)
{
struct Expression * sizeExp = (d->type == 0) ? d->__anon1.structDecl.exp : (((void *)0));
struct Expression * posExp = (d->type == 0) ? d->__anon1.structDecl.posExp : (((void *)0));
int bitSize = 0, bitPos = -1;
char dataTypeString[8192];

dataTypeString[0] = 0;
if(sizeExp)
{
ProcessExpressionType(sizeExp);
ComputeExpression(sizeExp);
if(sizeExp->isConstant)
bitSize = strtol(sizeExp->__anon1.__anon1.constant, (((void *)0)), 0);
FreeExpression(sizeExp);
}
if(posExp)
{
ProcessExpressionType(posExp);
ComputeExpression(posExp);
if(posExp->isConstant)
bitPos = strtol(posExp->__anon1.__anon1.constant, (((void *)0)), 0);
FreeExpression(posExp);
}
if(d->type == 0)
{
d->__anon1.structDecl.posExp = (((void *)0));
d->__anon1.structDecl.exp = (((void *)0));
}
dataType = ProcessType(decl->__anon1.__anon1.specifiers, d);
PrintType(dataType, dataTypeString, 0, 1);
{
struct __ecereNameSpace__ecere__com__BitMember * member = __ecereNameSpace__ecere__com__eClass_AddBitMember(regClass, declId->string, dataTypeString, 0, 0, def->memberAccess);

if(member)
{
member->size = bitSize;
member->pos = bitPos;
}
dataMember = (struct __ecereNameSpace__ecere__com__DataMember *)member;
}
if(dataMember)
dataMember->dataType = dataType;
else
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Member with same name (%s) already exists in class %s\n", (((void *)0))), declId->string, regClass->name);
FreeType(dataType);
}
}
else
{
{
char typeString[8192];

typeString[0] = 0;
dataType = ProcessType(decl->__anon1.__anon1.specifiers, d);
if(dataType && dataType->kind == 20)
dataType->thisClassFrom = regClass;
PrintType(dataType, typeString, 0, 1);
if(member)
{
dataMember = __ecereNameSpace__ecere__com__eMember_AddDataMember(member, declId->string, typeString, 0, 0, def->memberAccess);
if(!dataMember)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Member with same name (%s) already exists in member %s\n", (((void *)0))), declId->string, member->name);
}
else if(regClass)
{
dataMember = __ecereNameSpace__ecere__com__eClass_AddDataMember(regClass, declId->string, typeString, 0, 0, def->memberAccess);
if(!dataMember)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Member with same name (%s) already exists in class %s\n", (((void *)0))), declId->string, regClass->name);
}
if(dataMember)
dataMember->dataType = dataType;
else
FreeType(dataType);
}
}
}
}
}
else if(decl->__anon1.__anon1.specifiers)
{
struct Specifier * spec;

for(spec = (*decl->__anon1.__anon1.specifiers).first; spec; spec = spec->next)
{
if(spec->type == 3 || spec->type == 4)
{
if(spec->__anon1.__anon2.definitions && !spec->__anon1.__anon2.id)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember = __ecereNameSpace__ecere__com__eMember_New((spec->type == 4) ? 1 : 2, def->memberAccess);

AddDefinitions((((void *)0)), dataMember, spec->__anon1.__anon2.definitions);
if(member)
{
__ecereNameSpace__ecere__com__eMember_AddMember(member, dataMember);
}
else
{
__ecereNameSpace__ecere__com__eClass_AddMember(regClass, dataMember);
}
}
else if(spec->__anon1.__anon2.definitions && spec->__anon1.__anon2.id)
{
{
struct Identifier * id = spec->__anon1.__anon2.id;
char typeString[8192];

typeString[0] = 0;
spec->__anon1.__anon2.id = (((void *)0));
decl->__anon1.__anon1.declarators = MkListOne(MkDeclaratorIdentifier(id));
dataType = ProcessType(decl->__anon1.__anon1.specifiers, (((void *)0)));
PrintType(dataType, typeString, 0, 1);
if(member)
{
dataMember = __ecereNameSpace__ecere__com__eMember_AddDataMember(member, id->string, typeString, 0, 0, def->memberAccess);
if(!dataMember)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Member with same name (%s) already exists in member %s\n", (((void *)0))), id->string, member->name);
}
else
{
dataMember = __ecereNameSpace__ecere__com__eClass_AddDataMember(regClass, id->string, typeString, 0, 0, def->memberAccess);
if(!dataMember)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Member with same name (%s) already exists in class %s\n", (((void *)0))), id->string, regClass->name);
}
if(dataMember)
dataMember->dataType = dataType;
else
FreeType(dataType);
}
}
}
}
}
}
else if(decl->type == 2)
{
struct Instantiation * inst = decl->__anon1.inst;
struct Expression * exp = inst->exp;

if(exp)
{
char * string = exp->__anon1.__anon1.identifier->string;

{
struct Type * dataType = (dataType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), dataType->kind = 8, dataType->__anon1._class = inst->_class->__anon1.__anon1.symbol, dataType->refCount = 1, dataType);

if(member)
{
dataMember = __ecereNameSpace__ecere__com__eMember_AddDataMember(member, string, inst->_class->__anon1.__anon1.name, 0, 0, def->memberAccess);
if(!dataMember)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Member with same name (%s) already exists in member %s\n", (((void *)0))), string, member->name);
}
else
{
dataMember = __ecereNameSpace__ecere__com__eClass_AddDataMember(regClass, string, inst->_class->__anon1.__anon1.name, 0, 0, def->memberAccess);
if(!dataMember)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Member with same name (%s) already exists in class %s\n", (((void *)0))), string, regClass->name);
}
if(dataMember)
dataMember->dataType = dataType;
else
FreeType(dataType);
}
}
}
}
else if(def->type == 3 && def->__anon1.propertyDef)
{
struct PropertyDef * propertyDef = def->__anon1.propertyDef;
struct __ecereNameSpace__ecere__com__Property * prop;
char * dataTypeString = StringFromSpecDecl(propertyDef->specifiers, propertyDef->declarator);

prop = __ecereNameSpace__ecere__com__eClass_AddProperty(regClass, propertyDef->__anon1.conversion ? (((void *)0)) : propertyDef->id->string, dataTypeString, inCompiler ? propertyDef->setStmt : (((void *)0)), inCompiler ? propertyDef->getStmt : (((void *)0)), def->memberAccess);
(__ecereNameSpace__ecere__com__eSystem_Delete(dataTypeString), dataTypeString = 0);
if(prop)
{
if(inCompiler)
prop->IsSet = (void *)propertyDef->issetStmt;
prop->compiled = 0;
prop->symbol = __extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString(propertyDef->symbol->string), __ecereInstance1->type = propertyDef->symbol->type, __ecereInstance1;
});
((struct Symbol *)prop->symbol)->propCategory = propertyDef->category;
propertyDef->category = (((void *)0));
if(propertyDef->__anon1.isWatchable)
__ecereNameSpace__ecere__com__eProperty_Watchable(prop);
}
propertyDef->symbol->__anon1._property = prop;
if(propertyDef->symbol->type)
propertyDef->symbol->type->refCount++;
}
else if(def->type == 10 && def->__anon1.propertyDef)
{
struct PropertyDef * propertyDef = def->__anon1.propertyDef;
char * dataTypeString = StringFromSpecDecl(propertyDef->specifiers, propertyDef->declarator);

__ecereNameSpace__ecere__com__eClass_AddClassProperty(regClass, propertyDef->id->string, dataTypeString, inCompiler ? propertyDef->setStmt : (((void *)0)), inCompiler ? propertyDef->getStmt : (((void *)0)));
(__ecereNameSpace__ecere__com__eSystem_Delete(dataTypeString), dataTypeString = 0);
}
}
}
}

static void ProcessClass(int classType, struct __ecereNameSpace__ecere__sys__OldList * definitions, struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * baseSpecs, struct __ecereNameSpace__ecere__sys__OldList * enumValues, struct Location * loc, struct __ecereNameSpace__ecere__sys__OldList * defs, void * after, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators, int declMode)
{
struct __ecereNameSpace__ecere__com__Class * regClass;
struct ClassDef * def;
unsigned int redefinition = 0;

regClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, symbol->string);
if(regClass && !regClass->internalDecl)
{
if(symbol->parent || (struct Symbol *)globalContext->classes.root == symbol)
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->classes, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
}
redefinition = 1;
if(inCompiler)
{
yylloc = *loc;
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "redefinition of class %s\n", (((void *)0))), symbol->string);
return ;
}
}
else
{
char baseName[1024] = "";
unsigned int unitType = 0;
unsigned int wouldBeEnum = 0;
int inheritanceAccess = 1;

if(baseSpecs != (((void *)0)))
{
struct Type * baseType = ProcessType(baseSpecs, (((void *)0)));

PrintType(baseType, baseName, 0, 1);
if(baseType->kind == 8)
{
if(baseType->__anon1._class->__anon1.registered && classType == 0)
{
if(baseType->__anon1._class->__anon1.registered->type == 3)
classType = 3;
else if(baseType->__anon1._class->__anon1.registered->type == 2)
classType = 2;
else if(baseType->__anon1._class->__anon1.registered->type == 5)
classType = 5;
else if(baseType->__anon1._class->__anon1.registered->type == 4)
{
wouldBeEnum = 1;
}
}
}
else if(baseType->kind == 9 || baseType->kind == 10)
{
classType = 5;
baseName[0] = '\0';
}
else
unitType = 1;
FreeType(baseType);
if(((struct Specifier *)baseSpecs->first)->type == 0 && ((struct Specifier *)baseSpecs->first)->__anon1.specifier == PRIVATE)
inheritanceAccess = 2;
}
if(classType == 0)
{
if(unitType)
classType = 3;
if(definitions != (((void *)0)))
{
for(def = definitions->first; def; def = def->next)
{
if(def->type == 2)
{
struct Declaration * decl = def->__anon1.decl;

if(decl->type == 0)
{
if(unitType)
{
classType = 2;
break;
}
if(decl->__anon1.__anon1.declarators)
{
struct Declarator * d;

for(d = (*decl->__anon1.__anon1.declarators).first; d; d = d->next)
{
if(d->type != 0)
continue;
if(d->__anon1.structDecl.exp)
{
classType = 2;
break;
}
}
if(d)
break;
}
}
}
}
}
}
if(classType == 0 && wouldBeEnum)
classType = 4;
regClass = symbol->__anon1.registered = __ecereNameSpace__ecere__com__eSystem_RegisterClass((classType == 6) ? 1 : classType, symbol->string, baseName[0] ? baseName : (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), privateModule, buildingECERECOMModule ? 4 : declMode, inheritanceAccess);
if(regClass)
regClass->symbol = symbol;
}
if(!redefinition)
{
if(classType == 6)
{
struct __ecereNameSpace__ecere__com__DataMember * unionMember = __ecereNameSpace__ecere__com__eMember_New(1, 1);

AddDefinitions(regClass, unionMember, definitions);
__ecereNameSpace__ecere__com__eClass_AddMember(regClass, unionMember);
}
else
AddDefinitions(regClass, (((void *)0)), definitions);
}
if(definitions != (((void *)0)))
{
for(def = definitions->first; def; def = def->next)
{
if(def->type == 0 && (def->__anon1.function->isConstructor || def->__anon1.function->isDestructor))
{
struct Specifier * spec = def->__anon1.function->specifiers ? (*def->__anon1.function->specifiers).last : (((void *)0));

if(!spec || spec->type != 1 || !spec->__anon1.__anon1.name || (strcmp(spec->__anon1.__anon1.name, regClass->name) && (!spec->__anon1.__anon1.symbol || !spec->__anon1.__anon1.symbol->__anon1.registered || strcmp(spec->__anon1.__anon1.symbol->__anon1.registered->name, regClass->name))))
{
yylloc = def->__anon1.function->loc;
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "wrong class name specified for %s\n", (((void *)0))), def->__anon1.function->isConstructor ? __ecereNameSpace__ecere__GetTranslatedString("ec", "constructor", (((void *)0))) : __ecereNameSpace__ecere__GetTranslatedString("ec", "destructor", (((void *)0))));
}
FreeList(def->__anon1.function->specifiers, (void *)(FreeSpecifier));
def->__anon1.function->specifiers = (((void *)0));
}
if(def->type == 0 && def->__anon1.function->declarator)
{
struct ClassFunction * func = def->__anon1.function;

func->_class = regClass;
if(!redefinition && !func->dontMangle)
{
struct Declarator * funcDecl = GetFuncDecl(func->declarator);
struct Identifier * id = GetDeclId(funcDecl);
struct __ecereNameSpace__ecere__com__Method * method;

if(func->isVirtual)
{
char * typeString = StringFromSpecDecl(func->specifiers, func->declarator);

method = __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(regClass, id->string, typeString, inCompiler ? func->declarator->symbol : (((void *)0)), def->memberAccess);
(__ecereNameSpace__ecere__com__eSystem_Delete(typeString), typeString = 0);
}
else
{
char * typeString = StringFromSpecDecl(func->specifiers, func->declarator);

method = __ecereNameSpace__ecere__com__eClass_AddMethod(regClass, id->string, typeString, inCompiler ? func->declarator->symbol : (((void *)0)), def->memberAccess);
if(!method)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Redefinition of method %s in class %s\n", (((void *)0))), id->string, regClass->name);
(__ecereNameSpace__ecere__com__eSystem_Delete(typeString), typeString = 0);
}
if(method && (method->type != 1 || method->_class == regClass))
{
method->symbol = __extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString(func->declarator->symbol->string), __ecereInstance1->type = func->declarator->symbol->type, __ecereInstance1->__anon1.method = method, __ecereInstance1;
});
if(func->declarator->symbol->type)
func->declarator->symbol->type->refCount++;
func->declarator->symbol->__anon1.method = method;
}
else
{
func->declarator->symbol->__anon1.method = method;
}
}
}
}
}
if(regClass && symbol->templateParams)
{
struct TemplateParameter * param;

for(param = (*symbol->templateParams).first; param; param = param->next)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument defaultArg =
{

.__anon1 = {

.__anon1 = {
.dataTypeString = 0
}
}
};

if(param->defaultArgument)
{
switch(param->type)
{
case 0:
defaultArg.__anon1.__anon1.dataTypeString = StringFromSpecDecl(param->defaultArgument->__anon1.templateDatatype->specifiers, param->defaultArgument->__anon1.templateDatatype->decl);
break;
case 1:
{
char memberString[1024];

memberString[0] = '\0';
if(param->defaultArgument->__anon1.identifier->_class)
{
if(param->defaultArgument->__anon1.identifier->_class->type == 8)
{
if(param->defaultArgument->__anon1.identifier->_class->__anon1.templateParameter)
strcpy(memberString, param->defaultArgument->__anon1.identifier->_class->__anon1.templateParameter->identifier->string);
}
else
{
if(param->defaultArgument->__anon1.identifier->_class->__anon1.__anon1.name)
strcpy(memberString, param->defaultArgument->__anon1.identifier->_class->__anon1.__anon1.name);
}
}
if(memberString[0])
{
strcat(memberString, "::");
}
strcat(memberString, param->defaultArgument->__anon1.identifier->string);
defaultArg.__anon1.__anon2.memberString = __ecereNameSpace__ecere__sys__CopyString(memberString);
break;
}
case 2:
{
struct Operand op;

param->defaultArgument->__anon1.expression->destType = ProcessType(param->__anon1.dataType->specifiers, param->__anon1.dataType->decl);
ProcessExpressionType(param->defaultArgument->__anon1.expression);
ComputeExpression(param->defaultArgument->__anon1.expression);
op = GetOperand(param->defaultArgument->__anon1.expression);
defaultArg.__anon1.expression.__anon1.ui64 = op.__anon1.ui64;
break;
}
}
}
if(param->type == 1)
{
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(regClass, param->identifier->string, 1, (void *)(uintptr_t)param->__anon1.memberType, &defaultArg);
}
else
{
char * typeString = param->__anon1.dataType ? StringFromSpecDecl(param->__anon1.dataType->specifiers, param->__anon1.dataType->decl) : (((void *)0));

__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(regClass, param->identifier->string, param->type, typeString, &defaultArg);
(__ecereNameSpace__ecere__com__eSystem_Delete(typeString), typeString = 0);
}
if(param->type == 0 || param->type == 1)
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)defaultArg.__anon1.__anon1.dataTypeString), defaultArg.__anon1.__anon1.dataTypeString = 0);
}
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(regClass);
}
}

void PrePreProcessClassDefinitions()
{
struct External * external, * next;

curExternal = (((void *)0));
if(ast)
{
for(external = (*ast).first; external; external = next)
{
next = external->next;
curExternal = external;
if(external->type == 2)
{
struct ClassDefinition * _class = external->__anon1._class;

if((!_class->symbol->__anon1.registered || !inCompiler))
{
if(_class->definitions)
_class->symbol->mustRegister = 1;
ProcessClass(0, _class->definitions, _class->symbol, _class->baseSpecs, (((void *)0)), &_class->loc, ast, external->prev, (((void *)0)), _class->declMode);
_class->symbol->isStatic = _class->declMode == 3;
}
}
else if(external->type == 1)
{
struct Declaration * declaration = external->__anon1.declaration;

if(declaration->type == 1)
{
if(declaration->__anon1.__anon1.specifiers)
{
struct Specifier * specifier;

for(specifier = (*declaration->__anon1.__anon1.specifiers).first; specifier; specifier = specifier->next)
{
if((specifier->type == 2 || specifier->type == 3 || specifier->type == 4) && specifier->__anon1.__anon2.id && specifier->__anon1.__anon2.id->string && (declaration->declMode || specifier->__anon1.__anon2.baseSpecs || (specifier->type == 2 && specifier->__anon1.__anon2.definitions)))
{
struct Symbol * type = FindType(globalContext, specifier->__anon1.__anon2.id->string);
struct Symbol * symbol = FindClass(specifier->__anon1.__anon2.id->string);

if(type)
{
declaration->declMode = 0;
if(symbol)
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->classes, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
}
}
else if(symbol && !symbol->__anon1.registered)
{
int classType;

if(specifier->type == 2)
classType = 4;
else if(specifier->type == 4)
classType = 6;
else
classType = 1;
if(specifier->__anon1.__anon2.definitions || specifier->type == 2 || specifier->__anon1.__anon2.baseSpecs)
symbol->mustRegister = 1;
ProcessClass(classType, specifier->__anon1.__anon2.definitions, symbol, specifier->__anon1.__anon2.baseSpecs, specifier->__anon1.__anon2.list, &specifier->loc, ast, external->prev, declaration->__anon1.__anon1.declarators, declaration->declMode);
symbol->isStatic = declaration->declMode == 3;
}
}
}
}
}
}
else if(external->type == 3)
{
}
}
{
for(external = (*ast).first; external; external = external->next)
{
if(external->type == 2)
{
struct ClassDefinition * _class = external->__anon1._class;

if(_class->symbol)
{
struct __ecereNameSpace__ecere__sys__OldLink * link;

for(link = _class->symbol->templatedClasses.first; link; link = link->next)
{
struct Symbol * symbol = link->data;

symbol->__anon1.registered = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, symbol->string);
}
}
}
else if(external->type == 1)
{
struct Declaration * declaration = external->__anon1.declaration;

if(declaration->type == 1)
{
if(declaration->__anon1.__anon1.specifiers)
{
struct Specifier * specifier;

for(specifier = (*declaration->__anon1.__anon1.specifiers).first; specifier; specifier = specifier->next)
{
if((specifier->type == 2 || specifier->type == 3 || specifier->type == 4) && specifier->__anon1.__anon2.id && specifier->__anon1.__anon2.id->string && (declaration->declMode || specifier->__anon1.__anon2.baseSpecs || (specifier->type == 2 && specifier->__anon1.__anon2.definitions)))
{
struct Symbol * type = FindType(globalContext, specifier->__anon1.__anon2.id->string);
struct Symbol * symbol = FindClass(specifier->__anon1.__anon2.id->string);

if(type)
{
}
else if(symbol)
{
struct __ecereNameSpace__ecere__sys__OldLink * link;

for(link = symbol->templatedClasses.first; link; link = link->next)
{
struct Symbol * tplSymbol = link->data;

tplSymbol->__anon1.registered = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, tplSymbol->string);
tplSymbol->module = symbol->module ? symbol->module : mainModule;
}
}
}
}
}
}
}
}
}
}
}

void __ecereRegisterModule_firstPass(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrePreProcessClassDefinitions", "void PrePreProcessClassDefinitions(void)", PrePreProcessClassDefinitions, module, 1);
}

