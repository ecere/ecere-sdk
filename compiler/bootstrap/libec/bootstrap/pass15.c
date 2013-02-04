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
struct Type * dataType;
int memberAccess;
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
struct Type * dataType;
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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_CodePosition;

struct CodePosition
{
int line;
int charPos;
int pos;
unsigned int included;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Location;

struct Location
{
struct CodePosition start;
struct CodePosition end;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Attrib;

struct Attrib;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ExtDecl;

struct ExtDecl
{
struct Location loc;
int type;
union
{
char * s;
struct Attrib * attr;
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassDefinition;

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
int endid;
int declMode;
unsigned int deleteWatchable;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Context;

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Instantiation;

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declaration;

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
} __attribute__ ((gcc_struct));
struct Instantiation * inst;
struct
{
struct Identifier * id;
struct Expression * exp;
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));
struct Specifier * extStorage;
struct Symbol * symbol;
int declMode;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Statement;

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
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TypeName;

struct TypeName
{
struct TypeName * prev;
struct TypeName * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList *  qualifiers;
struct Declarator * declarator;
int classObjectType;
struct Expression * bitCount;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Initializer;

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
} __attribute__ ((gcc_struct));
unsigned int isConstant;
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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Expression;

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
} __attribute__ ((gcc_struct));
struct Statement * compound;
struct Instantiation * instance;
char *  string;
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
} __attribute__ ((gcc_struct));
unsigned int debugValue;
struct __ecereNameSpace__ecere__com__DataValue val;
unsigned int address;
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
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateDatatype;

struct TemplateDatatype
{
struct __ecereNameSpace__ecere__sys__OldList *  specifiers;
struct Declarator * decl;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateArgument;

struct TemplateArgument;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateParameter;

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
} __attribute__ ((gcc_struct));
struct TemplateArgument * defaultArgument;
char *  dataTypeString;
struct Type * baseType;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Specifier;

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
} __attribute__ ((gcc_struct));
struct
{
struct Identifier * id;
struct __ecereNameSpace__ecere__sys__OldList *  list;
struct __ecereNameSpace__ecere__sys__OldList *  baseSpecs;
struct __ecereNameSpace__ecere__sys__OldList *  definitions;
unsigned int addNameSpace;
struct Context * ctx;
} __attribute__ ((gcc_struct));
struct Expression * expression;
struct Specifier * _class;
struct TemplateParameter * templateParameter;
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Identifier;

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Pointer;

struct Pointer;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declarator;

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
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionDefinition;

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBTableDef;

struct DBTableDef;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_External;

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
} __attribute__ ((gcc_struct));
int importType;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ModuleImport;

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassImport;

struct ClassImport
{
struct ClassImport * prev;
struct ClassImport * next;
char *  name;
struct __ecereNameSpace__ecere__sys__OldList methods;
struct __ecereNameSpace__ecere__sys__OldList properties;
unsigned int itself;
unsigned int isRemote;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Symbol;

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
} __attribute__ ((gcc_struct));
int id;
int idCode;
union
{
struct
{
struct External * pointerExternal;
struct External * structExternal;
} __attribute__ ((gcc_struct));
struct
{
struct External * externalGet;
struct External * externalSet;
struct External * externalPtr;
struct External * externalIsSet;
} __attribute__ ((gcc_struct));
struct
{
struct External * methodExternal;
struct External * methodCodeExternal;
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));
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
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Type;

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
} __attribute__ ((gcc_struct));
struct
{
struct Type * returnType;
struct __ecereNameSpace__ecere__sys__OldList params;
struct Symbol * thisClass;
unsigned int staticMethod;
struct TemplateParameter * thisClassTemplate;
} __attribute__ ((gcc_struct));
struct
{
struct __ecereNameSpace__ecere__com__Method * method;
struct __ecereNameSpace__ecere__com__Class * methodClass;
struct __ecereNameSpace__ecere__com__Class * usedClass;
} __attribute__ ((gcc_struct));
struct
{
struct Type * arrayType;
int arraySize;
struct Expression * arraySizeExp;
unsigned int freeExp;
struct Symbol * enumClass;
} __attribute__ ((gcc_struct));
struct Type * type;
struct TemplateParameter * templateParameter;
} __attribute__ ((gcc_struct));
unsigned int isSigned;
int kind;
unsigned int constant;
unsigned int size;
char *  name;
char *  typeName;
unsigned int count;
unsigned int truth;
int classObjectType;
unsigned int byReference;
unsigned int extraParam;
int alignment;
unsigned int directClassAccess;
unsigned int computing;
unsigned int dllExport;
unsigned int offset;
unsigned int keepCast;
unsigned int passAsTemplate;
int bitFieldCount;
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
struct Type * dataType;
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
struct Type * dataType;
int type;
int offset;
int memberID;
struct __ecereNameSpace__ecere__sys__OldList members;
struct __ecereNameSpace__ecere__sys__BinaryTree membersAlpha;
int memberOffset;
int structAlignment;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SerialBuffer;

struct __ecereNameSpace__ecere__com__SerialBuffer
{
unsigned char *  _buffer;
unsigned int count;
unsigned int _size;
unsigned int pos;
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

enum yytokentype
{
IDENTIFIER = 258, CONSTANT = 259, STRING_LITERAL = 260, SIZEOF = 261, PTR_OP = 262, INC_OP = 263, DEC_OP = 264, LEFT_OP = 265, RIGHT_OP = 266, LE_OP = 267, GE_OP = 268, EQ_OP = 269, NE_OP = 270, AND_OP = 271, OR_OP = 272, MUL_ASSIGN = 273, DIV_ASSIGN = 274, MOD_ASSIGN = 275, ADD_ASSIGN = 276, SUB_ASSIGN = 277, LEFT_ASSIGN = 278, RIGHT_ASSIGN = 279, AND_ASSIGN = 280, XOR_ASSIGN = 281, OR_ASSIGN = 282, TYPE_NAME = 283, TYPEDEF = 284, EXTERN = 285, STATIC = 286, AUTO = 287, REGISTER = 288, CHAR = 289, SHORT = 290, INT = 291, UINT = 292, INT64 = 293, LONG = 294, SIGNED = 295, UNSIGNED = 296, FLOAT = 297, DOUBLE = 298, CONST = 299, VOLATILE = 300, VOID = 301, VALIST = 302, STRUCT = 303, UNION = 304, ENUM = 305, ELLIPSIS = 306, CASE = 307, DEFAULT = 308, IF = 309, SWITCH = 310, WHILE = 311, DO = 312, FOR = 313, GOTO = 314, CONTINUE = 315, BREAK = 316, RETURN = 317, IFX = 318, ELSE = 319, CLASS = 320, THISCLASS = 321, CLASS_NAME = 322, PROPERTY = 323, SETPROP = 324, GETPROP = 325, NEWOP = 326, RENEW = 327, DELETE = 328, EXT_DECL = 329, EXT_STORAGE = 330, IMPORT = 331, DEFINE = 332, VIRTUAL = 333, ATTRIB = 334, PUBLIC = 335, PRIVATE = 336, TYPED_OBJECT = 337, ANY_OBJECT = 338, _INCREF = 339, EXTENSION = 340, ASM = 341, TYPEOF = 342, WATCH = 343, STOPWATCHING = 344, FIREWATCHERS = 345, WATCHABLE = 346, CLASS_DESIGNER = 347, CLASS_NO_EXPANSION = 348, CLASS_FIXED = 349, ISPROPSET = 350, CLASS_DEFAULT_PROPERTY = 351, PROPERTY_CATEGORY = 352, CLASS_DATA = 353, CLASS_PROPERTY = 354, SUBCLASS = 355, NAMESPACE = 356, NEW0OP = 357, RENEW0 = 358, VAARG = 359, DBTABLE = 360, DBFIELD = 361, DBINDEX = 362, DATABASE_OPEN = 363, ALIGNOF = 364, ATTRIB_DEP = 365, __ATTRIB = 366
};

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Enumerator;

struct Enumerator
{
struct Enumerator * prev;
struct Enumerator * next;
struct Location loc;
struct Identifier * id;
struct Expression * exp;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_InitDeclarator;

struct InitDeclarator
{
struct InitDeclarator * prev;
struct InitDeclarator * next;
struct Location loc;
struct Declarator * declarator;
struct Initializer * initializer;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_AsmField;

struct AsmField
{
struct AsmField * prev;
struct AsmField * next;
struct Location loc;
char *  command;
struct Expression * expression;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Attribute;

struct Attribute;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassFunction;

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_MembersInit;

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
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_MemberInit;

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyDef;

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
unsigned int conversion;
unsigned int isWatchable;
struct Expression * category;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyWatch;

struct PropertyWatch
{
struct PropertyWatch * prev;
struct PropertyWatch * next;
struct Location loc;
struct Statement * compound;
struct __ecereNameSpace__ecere__sys__OldList *  properties;
unsigned int deleteWatch;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassDef;

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
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));
int memberAccess;
void *  object;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBTableEntry;

struct DBTableEntry;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBIndexItem;

struct DBIndexItem;

extern YYSTYPE yylval;

extern struct Location yylloc;

extern struct __ecereNameSpace__ecere__sys__OldList * ast;

extern int returnCode;

extern struct Expression * parsedExpression;

extern unsigned int yydebug;

void SetYydebug(unsigned int b)
{
yydebug = b;
}

extern unsigned int echoOn;

void resetScanner();

int propWatcherID;

int expression_yyparse();

static struct Statement * curCompound;

struct External * curExternal, * afterExternal;

static struct Type * curSwitchType;

static struct __ecereNameSpace__ecere__com__Class * currentClass;

struct __ecereNameSpace__ecere__com__Class * thisClass;

void SetThisClass(struct __ecereNameSpace__ecere__com__Class * c)
{
thisClass = c;
}

struct __ecereNameSpace__ecere__com__Class * GetThisClass()
{
return thisClass;
}

static char * thisNameSpace;

struct __ecereNameSpace__ecere__com__Class * containerClass;

unsigned int thisClassParams = 0x1;

unsigned int internalValueCounter;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

struct __ecereNameSpace__ecere__sys__TempFile
{
char __ecere_padding[24];
} __attribute__ ((gcc_struct));

extern void OutputExpression(struct Expression * exp, struct __ecereNameSpace__ecere__com__Instance * f);

extern int strlen(const char * );

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

void PrintExpression(struct Expression * exp, char * string)
{
{
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);
int count;

if(exp)
OutputExpression(exp, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(f, 0, 0);
count = strlen(string);
count += ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read])(f, string + count, 1, 1023);
string[count] = '\0';
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}
}

extern int isspace(int c);

long long _strtoi64(char * string, char ** endString, int base)
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
if(endString)
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
if(endString)
*endString = string + c;
break;
}
}
return sign * value;
}

uint64 _strtoui64(char * string, char ** endString, int base)
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
if(endString)
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
if(endString)
*endString = string + c;
break;
}
}
return sign * value;
}

extern struct Type * ProcessTypeString(char *  string, unsigned int staticMethod);

extern struct Type * ProcessType(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

struct Type * ProcessTemplateParameterType(struct TemplateParameter * param)
{
if(param && param->type == 0 && (param->dataType || param->dataTypeString))
{
if(!param->baseType)
{
if(param->dataTypeString)
param->baseType = ProcessTypeString(param->dataTypeString, 0x0);
else
param->baseType = ProcessType(param->dataType->specifiers, param->dataType->decl);
}
return param->baseType;
}
return (((void *)0));
}

unsigned int NeedCast(struct Type * type1, struct Type * type2)
{
if(!type1 || !type2 || type1->keepCast || type2->keepCast)
return 0x1;
if(type1->kind == 20 && type2->kind == 4 && type2->passAsTemplate == 0x0)
{
return 0x0;
}
if(type1->kind == type2->kind)
{
switch(type1->kind)
{
case 1:
case 2:
case 3:
case 4:
case 22:
if(type1->passAsTemplate && !type2->passAsTemplate)
return 0x1;
return type1->isSigned != type2->isSigned;
case 8:
return type1->_class != type2->_class;
case 13:
return NeedCast(type1->type, type2->type);
default:
return 0x1;
}
}
return 0x1;
}

extern int strcmp(const char * , const char * );

extern struct Context * curContext;

extern struct Context * topContext;

extern unsigned int __ecereNameSpace__ecere__com__eClass_IsDerived(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class * from);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Instance * privateModule;

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassProperty;

struct __ecereNameSpace__ecere__com__ClassProperty
{
char *  name;
struct __ecereNameSpace__ecere__com__ClassProperty * parent;
struct __ecereNameSpace__ecere__com__ClassProperty * left;
struct __ecereNameSpace__ecere__com__ClassProperty * right;
int depth;
void (*  Set)(struct __ecereNameSpace__ecere__com__Class *, int);
int (*  Get)(struct __ecereNameSpace__ecere__com__Class *);
char *  dataTypeString;
struct Type * dataType;
unsigned int constant;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__ClassProperty * __ecereNameSpace__ecere__com__eClass_FindClassProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name);

extern struct Expression * QMkExpId(char *  id);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateParameter;

struct __ecereNameSpace__ecere__com__ClassTemplateParameter
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * prev;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * next;
char *  name;
int type;
union
{
char *  dataTypeString;
int memberType;
} __attribute__ ((gcc_struct));
struct __ecereNameSpace__ecere__com__ClassTemplateArgument defaultArg;
void *  param;
char __ecere_padding[4];
} __attribute__ ((gcc_struct));

extern struct Expression * GetTemplateArgExpByName(char *  paramName, struct __ecereNameSpace__ecere__com__Class * curClass, int tplType);

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern void FreeIdentifier(struct Identifier * id);

void ProcessExpressionType(struct Expression * exp);

extern struct Declarator * SpecDeclFromString(char *  string, struct __ecereNameSpace__ecere__sys__OldList *  specs, struct Declarator * baseDecl);

extern struct __ecereNameSpace__ecere__sys__OldList *  MkListOne(void *  item);

extern struct Expression * MkExpOp(struct Expression * exp1, int op, struct Expression * exp2);

extern struct Expression * MkExpCast(struct TypeName * typeName, struct Expression * expression);

extern struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator);

extern struct Declarator * MkDeclaratorPointer(struct Pointer * pointer, struct Declarator * declarator);

extern struct Pointer * MkPointer(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Pointer * pointer);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, char *  key);

static void ReplaceClassMembers(struct Expression * exp, struct __ecereNameSpace__ecere__com__Class * _class)
{
if(exp->type == 0 && exp->identifier)
{
struct Identifier * id = exp->identifier;
struct Context * ctx;
struct Symbol * symbol = (((void *)0));

if(!id->_class || !id->_class->name || strcmp(id->_class->name, "property"))
{
for(ctx = curContext; ctx != topContext->parent && !symbol; ctx = ctx->parent)
{
symbol = (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&ctx->symbols, id->string);
if(symbol)
break;
}
}
if(!symbol && ((!id->_class || (id->_class->name && !strcmp(id->_class->name, "property"))) || (id->classSym && __ecereNameSpace__ecere__com__eClass_IsDerived(_class, id->classSym->registered))))
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
exp->member.member = id;
exp->member.memberType = 0;
exp->member.exp = QMkExpId("this");
exp->addedThis = 0x1;
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
struct Expression * argExp = GetTemplateArgExpByName(param->name, _class, 2);

if(argExp)
{
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

FreeIdentifier(exp->member.member);
ProcessExpressionType(argExp);
decl = SpecDeclFromString(param->dataTypeString, specs, (((void *)0)));
exp->expType = ProcessType(specs, decl);
exp->type = 5;
exp->list = MkListOne(MkExpOp((((void *)0)), '*', MkExpCast(MkTypeName(specs, MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), decl)), MkExpOp((((void *)0)), '&', argExp))));
}
}
}
}
}
}
}
}
}

extern int sprintf(char * , char * , ...);

extern int __ecereNameSpace__ecere__com__GetRuntimePlatform(void);

extern char *  __ecereNameSpace__ecere__sys__CopyString(char *  string);

char * PrintInt(long long result)
{
char temp[100];

if(result > (((long long)0x7fffffffffffffffLL)))
sprintf(temp, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "0x%I64XLL" : "0x%llXLL"), result);
else
sprintf(temp, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "%I64dLL" : "%lldLL"), result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintUInt(uint64 result)
{
char temp[100];

if(result > (0xffffffff))
sprintf(temp, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "0x%I64XLL" : "0x%llXLL"), result);
else if(result > (((int)0x7fffffff)))
sprintf(temp, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "0x%I64X" : "0x%llX"), result);
else
sprintf(temp, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "%I64d" : "%lld"), result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintInt64(long long result)
{
char temp[100];

sprintf(temp, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "%I64dLL" : "%lldLL"), result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintUInt64(uint64 result)
{
char temp[100];

if(result > (((long long)0x7fffffffffffffffLL)))
sprintf(temp, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "0x%I64XLL" : "0x%llXLL"), result);
else
sprintf(temp, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "%I64dLL" : "%lldLL"), result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintHexUInt(uint64 result)
{
char temp[100];

if(result > (0xffffffff))
sprintf(temp, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "0x%I64XLL" : "0x%llXLL"), result);
else
sprintf(temp, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "0x%I64X" : "0x%llX"), result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintHexUInt64(uint64 result)
{
char temp[100];

if(result > (0xffffffff))
sprintf(temp, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "0x%I64XLL" : "0x%llXLL"), result);
else
sprintf(temp, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "0x%I64X" : "0x%llX"), result);
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

if(result > (unsigned short)32767)
sprintf(temp, "0x%X", (int)result);
else
sprintf(temp, "%d", result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

extern int isprint(int c);

char * PrintChar(char result)
{
char temp[100];

if(result > (char)0 && isprint(result))
sprintf(temp, "'%c'", result);
else if(result < (char)0)
sprintf(temp, "%d", result);
else
sprintf(temp, "0x%X", (unsigned char)result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintUChar(unsigned char result)
{
char temp[100];

sprintf(temp, "0x%X", result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintFloat(float result)
{
char temp[350];

sprintf(temp, "%.16ff", result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

char * PrintDouble(double result)
{
char temp[350];

sprintf(temp, "%.16f", result);
return __ecereNameSpace__ecere__sys__CopyString(temp);
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_OpTable;

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
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Operand;

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
unsigned char *  p;
long long i64;
uint64 ui64;
intptr_t iptr;
uintptr_t uiptr;
} __attribute__ ((gcc_struct));
struct OpTable ops;
} __attribute__ ((gcc_struct));

struct Operand GetOperand(struct Expression * exp);

unsigned int GetInt(struct Expression * exp, int * value2)
{
struct Operand op2 = GetOperand(exp);

if(op2.kind == 3 && op2.type->isSigned)
*value2 = op2.i;
else if(op2.kind == 3)
*value2 = (int)op2.ui;
if(op2.kind == 4 && op2.type->isSigned)
*value2 = (int)op2.i64;
else if(op2.kind == 4)
*value2 = (int)op2.ui64;
else if(op2.kind == 22 && op2.type->isSigned)
*value2 = (int)op2.iptr;
else if(op2.kind == 22)
*value2 = (int)op2.uiptr;
else if(op2.kind == 2 && op2.type->isSigned)
*value2 = (int)op2.s;
else if(op2.kind == 2)
*value2 = (int)op2.us;
else if(op2.kind == 1 && op2.type->isSigned)
*value2 = (int)op2.c;
else if(op2.kind == 1)
*value2 = (int)op2.uc;
else if(op2.kind == 6)
*value2 = (int)op2.f;
else if(op2.kind == 7)
*value2 = (int)op2.d;
else if(op2.kind == 13)
*value2 = (int)op2.ui;
else
return 0x0;
return 0x1;
}

unsigned int GetUInt(struct Expression * exp, unsigned int * value2)
{
struct Operand op2 = GetOperand(exp);

if(op2.kind == 3 && op2.type->isSigned)
*value2 = (unsigned int)op2.i;
else if(op2.kind == 3)
*value2 = op2.ui;
if(op2.kind == 4 && op2.type->isSigned)
*value2 = (unsigned int)op2.i64;
else if(op2.kind == 4)
*value2 = (unsigned int)op2.ui64;
else if(op2.kind == 22 && op2.type->isSigned)
*value2 = (unsigned int)op2.iptr;
else if(op2.kind == 22)
*value2 = (unsigned int)op2.uiptr;
else if(op2.kind == 2 && op2.type->isSigned)
*value2 = (unsigned int)op2.s;
else if(op2.kind == 2)
*value2 = (unsigned int)op2.us;
else if(op2.kind == 1 && op2.type->isSigned)
*value2 = (unsigned int)op2.c;
else if(op2.kind == 1)
*value2 = (unsigned int)op2.uc;
else if(op2.kind == 6)
*value2 = (unsigned int)op2.f;
else if(op2.kind == 7)
*value2 = (unsigned int)op2.d;
else if(op2.kind == 13)
*value2 = op2.ui;
else
return 0x0;
return 0x1;
}

unsigned int GetInt64(struct Expression * exp, long long * value2)
{
struct Operand op2 = GetOperand(exp);

if(op2.kind == 3 && op2.type->isSigned)
*value2 = (long long)op2.i;
else if(op2.kind == 3)
*value2 = (long long)op2.ui;
if(op2.kind == 4 && op2.type->isSigned)
*value2 = op2.i64;
else if(op2.kind == 4)
*value2 = (long long)op2.ui64;
else if(op2.kind == 22 && op2.type->isSigned)
*value2 = (long long)op2.iptr;
else if(op2.kind == 22)
*value2 = (long long)op2.uiptr;
else if(op2.kind == 2 && op2.type->isSigned)
*value2 = (long long)op2.s;
else if(op2.kind == 2)
*value2 = (long long)op2.us;
else if(op2.kind == 1 && op2.type->isSigned)
*value2 = (long long)op2.c;
else if(op2.kind == 1)
*value2 = (long long)op2.uc;
else if(op2.kind == 6)
*value2 = (long long)op2.f;
else if(op2.kind == 7)
*value2 = (long long)op2.d;
else if(op2.kind == 13)
*value2 = (long long)op2.ui;
else
return 0x0;
return 0x1;
}

unsigned int GetUInt64(struct Expression * exp, uint64 * value2)
{
struct Operand op2 = GetOperand(exp);

if(op2.kind == 3 && op2.type->isSigned)
*value2 = (uint64)op2.i;
else if(op2.kind == 3)
*value2 = (uint64)op2.ui;
if(op2.kind == 4 && op2.type->isSigned)
*value2 = (uint64)op2.i64;
else if(op2.kind == 4)
*value2 = op2.ui64;
else if(op2.kind == 22 && op2.type->isSigned)
*value2 = (uint64)op2.iptr;
else if(op2.kind == 22)
*value2 = (uint64)op2.uiptr;
else if(op2.kind == 2 && op2.type->isSigned)
*value2 = (uint64)op2.s;
else if(op2.kind == 2)
*value2 = (uint64)op2.us;
else if(op2.kind == 1 && op2.type->isSigned)
*value2 = (uint64)op2.c;
else if(op2.kind == 1)
*value2 = (uint64)op2.uc;
else if(op2.kind == 6)
*value2 = (uint64)op2.f;
else if(op2.kind == 7)
*value2 = (uint64)op2.d;
else if(op2.kind == 13)
*value2 = (uint64)op2.ui;
else
return 0x0;
return 0x1;
}

unsigned int GetIntPtr(struct Expression * exp, intptr_t * value2)
{
struct Operand op2 = GetOperand(exp);

if(op2.kind == 3 && op2.type->isSigned)
*value2 = (intptr_t)op2.i;
else if(op2.kind == 3)
*value2 = (intptr_t)op2.ui;
if(op2.kind == 4 && op2.type->isSigned)
*value2 = (intptr_t)op2.i64;
else if(op2.kind == 4)
*value2 = (intptr_t)op2.ui64;
else if(op2.kind == 22 && op2.type->isSigned)
*value2 = op2.iptr;
else if(op2.kind == 22)
*value2 = (intptr_t)op2.uiptr;
else if(op2.kind == 2 && op2.type->isSigned)
*value2 = (intptr_t)op2.s;
else if(op2.kind == 2)
*value2 = (intptr_t)op2.us;
else if(op2.kind == 1 && op2.type->isSigned)
*value2 = (intptr_t)op2.c;
else if(op2.kind == 1)
*value2 = (intptr_t)op2.uc;
else if(op2.kind == 6)
*value2 = (intptr_t)op2.f;
else if(op2.kind == 7)
*value2 = (intptr_t)op2.d;
else if(op2.kind == 13)
*value2 = (intptr_t)op2.ui;
else
return 0x0;
return 0x1;
}

unsigned int GetUIntPtr(struct Expression * exp, uintptr_t * value2)
{
struct Operand op2 = GetOperand(exp);

if(op2.kind == 3 && op2.type->isSigned)
*value2 = (uintptr_t)op2.i;
else if(op2.kind == 3)
*value2 = (uintptr_t)op2.ui;
if(op2.kind == 4 && op2.type->isSigned)
*value2 = (uintptr_t)op2.i64;
else if(op2.kind == 4)
*value2 = (uintptr_t)op2.ui64;
else if(op2.kind == 22 && op2.type->isSigned)
*value2 = (uintptr_t)op2.iptr;
else if(op2.kind == 22)
*value2 = op2.uiptr;
else if(op2.kind == 2 && op2.type->isSigned)
*value2 = (uintptr_t)op2.s;
else if(op2.kind == 2)
*value2 = (uintptr_t)op2.us;
else if(op2.kind == 1 && op2.type->isSigned)
*value2 = (uintptr_t)op2.c;
else if(op2.kind == 1)
*value2 = (uintptr_t)op2.uc;
else if(op2.kind == 6)
*value2 = (uintptr_t)op2.f;
else if(op2.kind == 7)
*value2 = (uintptr_t)op2.d;
else if(op2.kind == 13)
*value2 = (uintptr_t)op2.ui;
else
return 0x0;
return 0x1;
}

unsigned int GetShort(struct Expression * exp, short * value2)
{
struct Operand op2 = GetOperand(exp);

if(op2.kind == 3 && op2.type->isSigned)
*value2 = (short)op2.i;
else if(op2.kind == 3)
*value2 = (short)op2.ui;
if(op2.kind == 4 && op2.type->isSigned)
*value2 = (short)op2.i64;
else if(op2.kind == 4)
*value2 = (short)op2.ui64;
else if(op2.kind == 22 && op2.type->isSigned)
*value2 = (short)op2.iptr;
else if(op2.kind == 22)
*value2 = (short)op2.uiptr;
else if(op2.kind == 2 && op2.type->isSigned)
*value2 = op2.s;
else if(op2.kind == 2)
*value2 = (short)op2.us;
else if(op2.kind == 1 && op2.type->isSigned)
*value2 = (short)op2.c;
else if(op2.kind == 1)
*value2 = (short)op2.uc;
else if(op2.kind == 6)
*value2 = (short)op2.f;
else if(op2.kind == 7)
*value2 = (short)op2.d;
else if(op2.kind == 13)
*value2 = (short)op2.ui;
else
return 0x0;
return 0x1;
}

unsigned int GetUShort(struct Expression * exp, unsigned short * value2)
{
struct Operand op2 = GetOperand(exp);

if(op2.kind == 3 && op2.type->isSigned)
*value2 = (unsigned short)op2.i;
else if(op2.kind == 3)
*value2 = (unsigned short)op2.ui;
if(op2.kind == 4 && op2.type->isSigned)
*value2 = (unsigned short)op2.i64;
else if(op2.kind == 4)
*value2 = (unsigned short)op2.ui64;
else if(op2.kind == 22 && op2.type->isSigned)
*value2 = (unsigned short)op2.iptr;
else if(op2.kind == 22)
*value2 = (unsigned short)op2.uiptr;
else if(op2.kind == 2 && op2.type->isSigned)
*value2 = (unsigned short)op2.s;
else if(op2.kind == 2)
*value2 = op2.us;
else if(op2.kind == 1 && op2.type->isSigned)
*value2 = (unsigned short)op2.c;
else if(op2.kind == 1)
*value2 = (unsigned short)op2.uc;
else if(op2.kind == 6)
*value2 = (unsigned short)op2.f;
else if(op2.kind == 7)
*value2 = (unsigned short)op2.d;
else if(op2.kind == 13)
*value2 = (unsigned short)op2.ui;
else
return 0x0;
return 0x1;
}

unsigned int GetChar(struct Expression * exp, char * value2)
{
struct Operand op2 = GetOperand(exp);

if(op2.kind == 3 && op2.type->isSigned)
*value2 = (char)op2.i;
else if(op2.kind == 3)
*value2 = (char)op2.ui;
if(op2.kind == 4 && op2.type->isSigned)
*value2 = (char)op2.i64;
else if(op2.kind == 4)
*value2 = (char)op2.ui64;
else if(op2.kind == 22 && op2.type->isSigned)
*value2 = (char)op2.iptr;
else if(op2.kind == 22)
*value2 = (char)op2.uiptr;
else if(op2.kind == 2 && op2.type->isSigned)
*value2 = (char)op2.s;
else if(op2.kind == 2)
*value2 = (char)op2.us;
else if(op2.kind == 1 && op2.type->isSigned)
*value2 = op2.c;
else if(op2.kind == 1)
*value2 = (char)op2.uc;
else if(op2.kind == 6)
*value2 = (char)op2.f;
else if(op2.kind == 7)
*value2 = (char)op2.d;
else if(op2.kind == 13)
*value2 = (char)op2.ui;
else
return 0x0;
return 0x1;
}

unsigned int GetUChar(struct Expression * exp, unsigned char * value2)
{
struct Operand op2 = GetOperand(exp);

if(op2.kind == 3 && op2.type->isSigned)
*value2 = (unsigned char)op2.i;
else if(op2.kind == 3)
*value2 = (unsigned char)op2.ui;
if(op2.kind == 4 && op2.type->isSigned)
*value2 = (unsigned char)op2.i64;
else if(op2.kind == 4)
*value2 = (unsigned char)op2.ui64;
else if(op2.kind == 22 && op2.type->isSigned)
*value2 = (unsigned char)op2.iptr;
else if(op2.kind == 22)
*value2 = (unsigned char)op2.uiptr;
else if(op2.kind == 2 && op2.type->isSigned)
*value2 = (unsigned char)op2.s;
else if(op2.kind == 2)
*value2 = (unsigned char)op2.us;
else if(op2.kind == 1 && op2.type->isSigned)
*value2 = (unsigned char)op2.c;
else if(op2.kind == 1)
*value2 = op2.uc;
else if(op2.kind == 6)
*value2 = (unsigned char)op2.f;
else if(op2.kind == 7)
*value2 = (unsigned char)op2.d;
else if(op2.kind == 13)
*value2 = (unsigned char)op2.ui;
else
return 0x0;
return 0x1;
}

unsigned int GetFloat(struct Expression * exp, float * value2)
{
struct Operand op2 = GetOperand(exp);

if(op2.kind == 3 && op2.type->isSigned)
*value2 = (float)(float)op2.i;
else if(op2.kind == 3)
*value2 = (float)(float)op2.ui;
if(op2.kind == 4 && op2.type->isSigned)
*value2 = (float)(float)op2.i64;
else if(op2.kind == 4)
*value2 = (float)(float)op2.ui64;
else if(op2.kind == 22 && op2.type->isSigned)
*value2 = (float)op2.iptr;
else if(op2.kind == 22)
*value2 = (float)op2.uiptr;
else if(op2.kind == 2 && op2.type->isSigned)
*value2 = (float)(float)op2.s;
else if(op2.kind == 2)
*value2 = (float)(float)op2.us;
else if(op2.kind == 1 && op2.type->isSigned)
*value2 = (float)(float)op2.c;
else if(op2.kind == 1)
*value2 = (float)(float)op2.uc;
else if(op2.kind == 6)
*value2 = (float)op2.f;
else if(op2.kind == 7)
*value2 = (float)op2.d;
else if(op2.kind == 13)
*value2 = (float)(float)op2.ui;
else
return 0x0;
return 0x1;
}

unsigned int GetDouble(struct Expression * exp, double * value2)
{
struct Operand op2 = GetOperand(exp);

if(op2.kind == 3 && op2.type->isSigned)
*value2 = (double)(double)op2.i;
else if(op2.kind == 3)
*value2 = (double)(double)op2.ui;
if(op2.kind == 4 && op2.type->isSigned)
*value2 = (double)(double)op2.i64;
else if(op2.kind == 4)
*value2 = (double)(double)op2.ui64;
else if(op2.kind == 22 && op2.type->isSigned)
*value2 = (double)op2.iptr;
else if(op2.kind == 22)
*value2 = (double)op2.uiptr;
else if(op2.kind == 2 && op2.type->isSigned)
*value2 = (double)(double)op2.s;
else if(op2.kind == 2)
*value2 = (double)(double)op2.us;
else if(op2.kind == 1 && op2.type->isSigned)
*value2 = (double)(double)op2.c;
else if(op2.kind == 1)
*value2 = (double)(double)op2.uc;
else if(op2.kind == 6)
*value2 = (double)op2.f;
else if(op2.kind == 7)
*value2 = (double)op2.d;
else if(op2.kind == 13)
*value2 = (double)(double)op2.ui;
else
return 0x0;
return 0x1;
}

void ComputeExpression(struct Expression * exp);

struct Context * SetupTemplatesContext(struct __ecereNameSpace__ecere__com__Class * _class);

int ComputeTypeSize(struct Type * type);

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
struct Type * dataType;
int type;
int size;
int pos;
uint64 mask;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldLink;

struct __ecereNameSpace__ecere__sys__OldLink
{
struct __ecereNameSpace__ecere__sys__OldLink * prev;
struct __ecereNameSpace__ecere__sys__OldLink * next;
void *  data;
} __attribute__ ((gcc_struct));

void FinishTemplatesContext(struct Context * context);

void ComputeClassMembers(struct __ecereNameSpace__ecere__com__Class * _class, unsigned int isMember)
{
struct __ecereNameSpace__ecere__com__DataMember * member = isMember ? (struct __ecereNameSpace__ecere__com__DataMember *)_class : (((void *)0));
struct Context * context = isMember ? (((void *)0)) : SetupTemplatesContext(_class);

if(member || ((_class->type == 2 || _class->type == 0 || _class->type == 1 || _class->type == 5) && (_class->type == 2 || _class->structSize == _class->offset) && _class->computeSize))
{
int c;
int unionMemberOffset = 0;
int bitFields = 0;

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
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0x0);
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
bitMember->mask = mask << bitMember->pos;
}
else if(dataMember->type == 0 && dataMember->dataType)
{
int size;
int alignment = 0;

if(dataMember->dataType->kind != 8 || ((!dataMember->dataType->_class || !dataMember->dataType->_class->registered || dataMember->dataType->_class->registered != _class || _class->type != 1)))
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
int __simpleStruct0;

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
int __simpleStruct0;

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
int __simpleStruct0;

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
int __simpleStruct0;

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
ComputeClassMembers((struct __ecereNameSpace__ecere__com__Class *)dataMember, 0x1);
if(isMember)
{
int __simpleStruct2;
int __simpleStruct0, __simpleStruct1;

member->structAlignment = (__simpleStruct0 = member->structAlignment, __simpleStruct1 = dataMember->structAlignment, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
dataMember->offset = member->memberOffset;
if(member->type == 1)
unionMemberOffset = (__simpleStruct2 = dataMember->memberOffset, (unionMemberOffset > __simpleStruct2) ? unionMemberOffset : __simpleStruct2);
else
member->memberOffset += dataMember->memberOffset;
}
else
{
int __simpleStruct0, __simpleStruct1;

_class->structAlignment = (__simpleStruct0 = _class->structAlignment, __simpleStruct1 = dataMember->structAlignment, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
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
int __simpleStruct0;

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
int __simpleStruct0;

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
_class->structSize = (_class->base ? (_class->base->templateClass ? _class->base->templateClass->structSize : _class->base->structSize) : 0) + _class->memberOffset;
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
deriv->offset = _class->structSize;
deriv->memberOffset = 0;
deriv->structSize = deriv->offset;
ComputeClassMembers(deriv, 0x0);
}
}
}
}
}
}
if(context)
FinishTemplatesContext(context);
}

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

void ComputeModuleClasses(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * _class;
struct __ecereNameSpace__ecere__sys__OldLink * subModule;

for(subModule = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->modules.first; subModule; subModule = subModule->next)
ComputeModuleClasses(subModule->data);
for(_class = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->classes.first; _class; _class = _class->next)
ComputeClassMembers(_class, 0x0);
}

extern unsigned int inCompiler;

extern void Compiler_Error(char *  format, ...);

extern char *  __ecereNameSpace__ecere__GetTranslatedString(struct __ecereNameSpace__ecere__com__Instance * module, char *  string, char *  stringAndContext);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern int __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name);

int ComputeTypeSize(struct Type * type)
{
unsigned int size = type ? type->size : 0;

if(!size && type && !type->computing)
{
type->computing = 0x1;
switch(type->kind)
{
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
type->alignment = size = sizeof(intptr_t);
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
struct __ecereNameSpace__ecere__com__Class * _class = type->_class ? type->_class->registered : (((void *)0));

if(_class && _class->type == 1)
{
ComputeClassMembers(_class, 0x0);
type->alignment = _class->structAlignment;
size = _class->structSize;
if(type->alignment && size % type->alignment)
size += type->alignment - (size % type->alignment);
}
else if(_class && (_class->type == 3 || _class->type == 4 || _class->type == 2))
{
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0x0);
size = type->alignment = ComputeTypeSize(_class->dataType);
}
else
size = type->alignment = sizeof(struct __ecereNameSpace__ecere__com__Instance **);
break;
}
case 13:
case 19:
size = type->alignment = sizeof(void *);
break;
case 12:
if(type->arraySizeExp)
{
ProcessExpressionType(type->arraySizeExp);
ComputeExpression(type->arraySizeExp);
if(!type->arraySizeExp->isConstant || (type->arraySizeExp->expType->kind != 3 && type->arraySizeExp->expType->kind != 15 && (type->arraySizeExp->expType->kind != 8 || !type->arraySizeExp->expType->_class->registered || type->arraySizeExp->expType->_class->registered->type != 4)))
{
struct Location oldLoc = yylloc;
char expression[10240];

expression[0] = '\0';
type->arraySizeExp->expType = (((void *)0));
yylloc = type->arraySizeExp->loc;
if(inCompiler)
PrintExpression(type->arraySizeExp, expression);
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Array size not constant int (%s)\n", (((void *)0))), expression);
yylloc = oldLoc;
}
GetInt(type->arraySizeExp, &type->arraySize);
}
else if(type->enumClass)
{
if(type->enumClass && type->enumClass->registered && type->enumClass->registered->type == 4)
{
type->arraySize = __ecereNameSpace__ecere__com__eClass_GetProperty(type->enumClass->registered, "enumSize");
}
else
type->arraySize = 0;
}
else
{
type->arraySize = 0;
}
size = ComputeTypeSize(type->type) * type->arraySize;
type->alignment = type->type->alignment;
break;
case 9:
{
struct Type * member;

for(member = type->members.first; member; member = member->next)
{
int __simpleStruct0, __simpleStruct1;
unsigned int addSize = ComputeTypeSize(member);

member->offset = size;
if(member->alignment && size % member->alignment)
member->offset += member->alignment - (size % member->alignment);
size = member->offset;
type->alignment = (__simpleStruct0 = type->alignment, __simpleStruct1 = member->alignment, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
size += addSize;
}
if(type->alignment && size % type->alignment)
size += type->alignment - (size % type->alignment);
break;
}
case 10:
{
struct Type * member;

for(member = type->members.first; member; member = member->next)
{
int __simpleStruct0, __simpleStruct1;
unsigned int addSize = ComputeTypeSize(member);

member->offset = size;
if(member->alignment && size % member->alignment)
member->offset += member->alignment - (size % member->alignment);
size = member->offset;
type->alignment = (__simpleStruct0 = type->alignment, __simpleStruct1 = member->alignment, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
size = ((size > addSize) ? size : addSize);
}
if(type->alignment && size % type->alignment)
size += type->alignment - (size % type->alignment);
break;
}
case 20:
{
struct TemplateParameter * param = type->templateParameter;
struct Type * baseType = ProcessTemplateParameterType(param);

if(baseType)
size = ComputeTypeSize(baseType);
else
size = sizeof(uint64);
break;
}
case 15:
{
size = sizeof(enum
{
test
});
break;
}
case 21:
{
size = sizeof(void *);
break;
}
}
type->size = size;
type->computing = 0x0;
}
return size;
}

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

extern struct Identifier * MkIdentifier(char *  string);

extern void ListAdd(struct __ecereNameSpace__ecere__sys__OldList * list, void *  item);

extern struct Declarator * MkStructDeclarator(struct Declarator * declarator, struct Expression * exp);

extern struct ClassDef * MkClassDefDeclaration(struct Declaration * decl);

extern struct Declaration * MkStructDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * declarators, struct Specifier * extStorage);

void ReplaceThisClassSpecifiers(struct __ecereNameSpace__ecere__sys__OldList * specs, struct __ecereNameSpace__ecere__com__Class * _class);

static void DeclareType(struct Type * type, unsigned int declarePointers, unsigned int declareParams);

extern void FreeType(struct Type * type);

extern struct Specifier * MkStructOrUnion(int type, struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * definitions);

extern struct Specifier * MkSpecifier(int specifier);

extern struct Declarator * MkDeclaratorArray(struct Declarator * declarator, struct Expression * exp);

extern struct Expression * MkExpConstant(char *  string);

int AddMembers(struct __ecereNameSpace__ecere__sys__OldList * declarations, struct __ecereNameSpace__ecere__com__Class * _class, unsigned int isMember, unsigned int * retSize, struct __ecereNameSpace__ecere__com__Class * topClass)
{
struct __ecereNameSpace__ecere__com__DataMember * topMember = isMember ? (struct __ecereNameSpace__ecere__com__DataMember *)_class : (((void *)0));
unsigned int totalSize = 0;
unsigned int maxSize = 0;
int alignment, size;
struct __ecereNameSpace__ecere__com__DataMember * member;
struct Context * context = isMember ? (((void *)0)) : SetupTemplatesContext(_class);

if(!isMember && _class->base)
{
maxSize = _class->structSize;
{
if(_class->type == 1 || _class->type == 5)
AddMembers(declarations, _class->base, 0x0, &totalSize, topClass);
else
maxSize -= _class->base->templateClass ? _class->base->templateClass->structSize : _class->base->structSize;
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

DeclareType(member->dataType, 0x0, 0x0);
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

size = 0;
AddMembers(list, (struct __ecereNameSpace__ecere__com__Class *)member, 0x1, &size, topClass);
ListAdd(specs, MkStructOrUnion((member->type == 1) ? 4 : 3, (((void *)0)), list));
ListAdd(declarations, MkClassDefDeclaration(MkStructDeclaration(specs, (((void *)0)), (((void *)0)))));
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
else if(totalSize < maxSize && _class->type != 1000)
{
char sizeString[50];

sprintf(sizeString, "%d", maxSize - totalSize);
ListAdd(declarations, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifier(CHAR)), MkListOne(MkDeclaratorArray(MkDeclaratorIdentifier(MkIdentifier("__ecere_padding")), MkExpConstant(sizeString))), (((void *)0)))));
}
if(context)
FinishTemplatesContext(context);
return topMember ? topMember->memberID : _class->memberID;
}

static int DeclareMembers(struct __ecereNameSpace__ecere__com__Class * _class, unsigned int isMember)
{
struct __ecereNameSpace__ecere__com__DataMember * topMember = isMember ? (struct __ecereNameSpace__ecere__com__DataMember *)_class : (((void *)0));
unsigned int totalSize = 0;
struct __ecereNameSpace__ecere__com__DataMember * member;
struct Context * context = isMember ? (((void *)0)) : SetupTemplatesContext(_class);

if(!isMember && (_class->type == 1 || _class->type == 5) && _class->base->type != 1000)
DeclareMembers(_class->base, 0x0);
for(member = isMember ? topMember->members.first : _class->membersAndProperties.first; member; member = member->next)
{
if(!member->isProperty)
{
switch(member->type)
{
case 0:
{
if(!member->dataType && member->dataTypeString)
member->dataType = ProcessTypeString(member->dataTypeString, 0x0);
if(member->dataType)
DeclareType(member->dataType, 0x0, 0x0);
break;
}
case 1:
case 2:
{
DeclareMembers((struct __ecereNameSpace__ecere__com__Class *)member, 0x1);
break;
}
}
}
}
if(context)
FinishTemplatesContext(context);
return topMember ? topMember->memberID : _class->memberID;
}

extern struct Symbol * FindClass(char *  name);

extern char *  strchr(char * , int);

extern void FullClassNameCat(char *  output, char *  className, unsigned int includeTemplateParams);

extern void FreeList(struct __ecereNameSpace__ecere__sys__OldList * list, void (* )(void * ));

extern struct External * MkExternalDeclaration(struct Declaration * declaration);

extern struct Declaration * MkDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators);

extern char *  strcpy(char * , const char * );

extern void MangleClassName(char *  className);

extern void DeclareClass(struct Symbol * classSym, char *  className);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Move(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item, void *  prevItem);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(struct __ecereNameSpace__ecere__sys__OldList * this, void *  prevItem, void *  item);

void DeclareStruct(char * name, unsigned int skipNoHead)
{
struct External * external = (((void *)0));
struct Symbol * classSym = FindClass(name);

if(!inCompiler || !classSym)
return (((void *)0));
if(classSym->registered && (classSym->registered->type == 2 || classSym->registered->type == 3 || classSym->registered->type == 4))
return (((void *)0));
if(classSym->registered && classSym->imported && !classSym->declaredStructSym)
{
struct Declaration * decl;
struct __ecereNameSpace__ecere__sys__OldList * specifiers, * declarators;
struct __ecereNameSpace__ecere__sys__OldList * declarations = (((void *)0));
char structName[1024];

external = (classSym->registered && classSym->registered->type == 1) ? classSym->pointerExternal : classSym->structExternal;
classSym->declaring++;
if(strchr(classSym->string, '<'))
{
if(classSym->registered->templateClass)
{
DeclareStruct(classSym->registered->templateClass->fullName, skipNoHead);
classSym->declaring--;
}
return (((void *)0));
}
DeclareMembers(classSym->registered, 0x0);
structName[0] = (char)0;
FullClassNameCat(structName, name, 0x0);
if(!skipNoHead)
{
classSym->declaredStructSym = 0x1;
declarations = MkList();
AddMembers(declarations, classSym->registered, 0x0, (((void *)0)), classSym->registered);
if(!(*declarations).count)
{
FreeList(declarations, (((void *)0)));
declarations = (((void *)0));
}
}
if(skipNoHead || declarations)
{
if(external && external->declaration)
{
((struct Specifier *)(*external->declaration->specifiers).first)->definitions = declarations;
if(curExternal && curExternal->symbol && curExternal->symbol->idCode < classSym->id)
{
if(classSym->structExternal)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Move((&*ast), classSym->structExternal, curExternal->prev);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Move((&*ast), classSym->pointerExternal, curExternal->prev);
classSym->id = curExternal->symbol->idCode;
classSym->idCode = curExternal->symbol->idCode;
}
}
else
{
if(!external)
external = MkExternalDeclaration((((void *)0)));
specifiers = MkList();
declarators = MkList();
ListAdd(specifiers, MkStructOrUnion(3, MkIdentifier(structName), declarations));
external->declaration = decl = MkDeclaration(specifiers, declarators);
if(decl->symbol && !decl->symbol->pointerExternal)
decl->symbol->pointerExternal = external;
if(classSym->registered && classSym->registered->type == 1)
{
char className[1024];

strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 0x1);
MangleClassName(className);
DeclareClass(classSym, className);
external->symbol = classSym;
classSym->pointerExternal = external;
classSym->id = (curExternal && curExternal->symbol) ? curExternal->symbol->idCode : 0;
classSym->idCode = (curExternal && curExternal->symbol) ? curExternal->symbol->idCode : 0;
}
else
{
char className[1024];

strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 0x1);
MangleClassName(className);
classSym->structExternal = external;
DeclareClass(classSym, className);
external->symbol = classSym;
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), curExternal ? curExternal->prev : (((void *)0)), external);
}
}
classSym->declaring--;
}
else if(curExternal && curExternal->symbol && curExternal->symbol->idCode < classSym->id)
{
classSym->declaring++;
{
if(classSym->registered)
DeclareMembers(classSym->registered, 0x0);
}
if(classSym->registered && (classSym->registered->type == 1 || classSym->registered->type == 5))
{
if(classSym->structExternal)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Move((&*ast), classSym->structExternal, curExternal->prev);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Move((&*ast), classSym->pointerExternal, curExternal->prev);
classSym->id = curExternal->symbol->idCode;
classSym->idCode = curExternal->symbol->idCode;
}
classSym->declaring--;
}
}

extern char *  strcat(char * , const char * );

extern struct ModuleImport * FindModule(struct __ecereNameSpace__ecere__com__Instance * moduleToFind);

extern struct ModuleImport * mainModule;

extern struct Specifier * MkSpecifierName(char *  name);

extern struct Declarator * MkDeclaratorBrackets(struct Declarator * declarator);

extern struct Declarator * PlugDeclarator(struct Declarator * decl, struct Declarator * baseDecl);

extern struct Declarator * MkDeclaratorFunction(struct Declarator * declarator, struct __ecereNameSpace__ecere__sys__OldList * parameters);

extern struct InitDeclarator * MkInitDeclarator(struct Declarator * declarator, struct Initializer * initializer);

extern void FreeDeclarator(struct Declarator * decl);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyImport;

struct PropertyImport
{
struct PropertyImport * prev;
struct PropertyImport * next;
char *  name;
unsigned int isVirtual;
unsigned int hasSet;
unsigned int hasGet;
} __attribute__ ((gcc_struct));

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void DeclareProperty(struct __ecereNameSpace__ecere__com__Property * prop, char * setName, char * getName)
{
void * __ecereTemp1;
struct Symbol * symbol = prop->symbol;
char propName[1024];

strcpy(setName, "__ecereProp_");
FullClassNameCat(setName, prop->_class->fullName, 0x0);
strcat(setName, "_Set_");
FullClassNameCat(setName, prop->name, 0x1);
strcpy(getName, "__ecereProp_");
FullClassNameCat(getName, prop->_class->fullName, 0x0);
strcat(getName, "_Get_");
FullClassNameCat(getName, prop->name, 0x1);
strcpy(propName, "__ecereProp_");
FullClassNameCat(propName, prop->_class->fullName, 0x0);
strcat(propName, "_");
FullClassNameCat(propName, prop->name, 0x1);
MangleClassName(getName);
MangleClassName(setName);
MangleClassName(propName);
if(prop->_class->type == 1)
DeclareStruct(prop->_class->fullName, 0x0);
if(!symbol || curExternal->symbol->idCode < symbol->id)
{
unsigned int imported = 0x0;
unsigned int dllImport = 0x0;

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
classSym->_import = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassImport), ((struct ClassImport *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(prop->_class->fullName), ((struct ClassImport *)__ecereTemp1)->isRemote = prop->_class->isRemote, ((struct ClassImport *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&module->classes, classSym->_import);
}
symbol = prop->symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);
symbol->_import = (struct ClassImport *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_PropertyImport), ((struct PropertyImport *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(prop->name), ((struct PropertyImport *)__ecereTemp1)->isVirtual = 0x0, ((struct PropertyImport *)__ecereTemp1)->hasSet = prop->Set ? 0x1 : 0x0, ((struct PropertyImport *)__ecereTemp1)->hasGet = prop->Get ? 0x1 : 0x0, ((struct PropertyImport *)__ecereTemp1));
if(classSym)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&classSym->_import->properties, symbol->_import);
}
imported = 0x1;
if(prop->_class->module != privateModule && ((struct __ecereNameSpace__ecere__com__Module *)(((char *)prop->_class->module + 12)))->importType != 1)
dllImport = 0x1;
}
if(!symbol->type)
{
struct Context * context = SetupTemplatesContext(prop->_class);

symbol->type = ProcessTypeString(prop->dataTypeString, 0x0);
FinishTemplatesContext(context);
}
if(prop->Get)
{
if(!symbol->externalGet || symbol->externalGet->type == 0)
{
struct Declaration * decl;
struct __ecereNameSpace__ecere__sys__OldList * specifiers, * declarators;
struct Declarator * d;
struct __ecereNameSpace__ecere__sys__OldList * params;
struct Specifier * spec;
struct External * external;
struct Declarator * typeDecl;
unsigned int simple = 0x0;

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
for(spec = (*specifiers).first; spec; spec = spec->next)
{
if(spec->type == 1)
{
if((!typeDecl || typeDecl->type == 1))
{
struct Symbol * classSym = spec->symbol;

symbol->_class = classSym->registered;
if(classSym->registered && classSym->registered->type == 1)
{
DeclareStruct(spec->name, 0x0);
simple = 0x1;
}
}
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
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), curExternal->prev, external);
external->symbol = symbol;
symbol->externalGet = external;
ReplaceThisClassSpecifiers(specifiers, prop->_class);
if(typeDecl)
FreeDeclarator(typeDecl);
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Move((&*ast), symbol->externalGet, curExternal->prev);
}
}
if(prop->Set)
{
if(!symbol->externalSet || symbol->externalSet->type == 0)
{
struct Declaration * decl;
struct __ecereNameSpace__ecere__sys__OldList * specifiers, * declarators;
struct Declarator * d;
struct __ecereNameSpace__ecere__sys__OldList * params;
struct Specifier * spec;
struct External * external;
struct Declarator * typeDecl;

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
ListAdd(params, MkTypeName(specifiers, d));
d = MkDeclaratorIdentifier(MkIdentifier(setName));
if(dllImport)
d = MkDeclaratorBrackets(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), d));
d = MkDeclaratorFunction(d, params);
for(spec = (*specifiers).first; spec; spec = spec->next)
{
if(spec->type == 1)
{
if((!typeDecl || typeDecl->type == 1))
{
struct Symbol * classSym = spec->symbol;

symbol->_class = classSym->registered;
if(classSym->registered && classSym->registered->type == 1)
DeclareStruct(spec->name, 0x0);
}
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
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), curExternal->prev, external);
external->symbol = symbol;
symbol->externalSet = external;
ReplaceThisClassSpecifiers(specifiers, prop->_class);
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Move((&*ast), symbol->externalSet, curExternal->prev);
}
}
if(!symbol->externalPtr)
{
struct Declaration * decl;
struct External * external;
struct __ecereNameSpace__ecere__sys__OldList * specifiers = MkList();

if(imported)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*specifiers), (((void *)0)), MkSpecifier(EXTERN));
else
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*specifiers), (((void *)0)), MkSpecifier(STATIC));
ListAdd(specifiers, MkSpecifierName("Property"));
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();

ListAdd(list, MkInitDeclarator(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(MkIdentifier(propName))), (((void *)0))));
if(!imported)
{
strcpy(propName, "__ecerePropM_");
FullClassNameCat(propName, prop->_class->fullName, 0x0);
strcat(propName, "_");
FullClassNameCat(propName, prop->name, 0x1);
MangleClassName(propName);
ListAdd(list, MkInitDeclarator(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(MkIdentifier(propName))), (((void *)0))));
}
decl = MkDeclaration(specifiers, list);
}
external = MkExternalDeclaration(decl);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), curExternal->prev, external);
external->symbol = symbol;
symbol->externalPtr = external;
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Move((&*ast), symbol->externalPtr, curExternal->prev);
}
symbol->id = curExternal->symbol->idCode;
}
}

struct Type * Dereference(struct Type * source)
{
void * __ecereTemp1;
struct Type * type = (((void *)0));

if(source)
{
if(source->kind == 13 || source->kind == 12)
{
type = source->type;
source->type->refCount++;
}
else if(source->kind == 8 && !strcmp(source->_class->string, "String"))
{
type = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->kind = 1, ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
}
else if(source->kind == 8 && source->_class && source->_class->registered && source->_class->registered->type == 5)
{
type = source;
source->refCount++;
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "cannot dereference type\n", (((void *)0))));
}
return type;
}

static struct Type * Reference(struct Type * source)
{
void * __ecereTemp1;
struct Type * type = (((void *)0));

if(source)
{
type = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->kind = 13, ((struct Type *)__ecereTemp1)->type = source, ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
source->refCount++;
}
return type;
}

extern void __ecereNameSpace__ecere__com__eClass_FindNextMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class **  curClass, struct __ecereNameSpace__ecere__com__DataMember **  curMember, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

extern void *  memcpy(void * , const void * , unsigned int size);

void ProcessMethodType(struct __ecereNameSpace__ecere__com__Method * method);

extern void FreeExpression(struct Expression * exp);

extern void __ecereNameSpace__ecere__sys__ChangeCh(char *  string, char ch1, char ch2);

unsigned int MatchTypes(struct Type * source, struct Type * dest, struct __ecereNameSpace__ecere__sys__OldList * conversions, struct __ecereNameSpace__ecere__com__Class * owningClassSource, struct __ecereNameSpace__ecere__com__Class * owningClassDest, unsigned int doConversion, unsigned int enumBaseType, unsigned int acceptReversedParams, unsigned int isConversionExploration);

static void ProcessInitializer(struct Initializer * init, struct Type * type);

extern struct Type * MkClassType(char *  name);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

void ProcessMemberInitData(struct MemberInit * member, struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class ** curClass, struct __ecereNameSpace__ecere__com__DataMember ** curMember, struct __ecereNameSpace__ecere__com__DataMember ** subMemberStack, int * subMemberStackPos)
{
struct Identifier * ident = member->identifiers ? (*member->identifiers).first : (((void *)0));
unsigned int found = 0x0;
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (((void *)0));
struct __ecereNameSpace__ecere__com__Method * method = (((void *)0));
unsigned int freeType = 0x0;

yylloc = member->loc;
if(!ident)
{
if(curMember)
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(_class, curClass, curMember, subMemberStack, subMemberStackPos);
if(*curMember)
{
found = 0x1;
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
memcpy(subMemberStack, _subMemberStack, sizeof(int) * _subMemberStackPos);
*subMemberStackPos = _subMemberStackPos;
}
found = 0x1;
}
else
{
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, ident->string, privateModule);
if(method && method->type == 1)
found = 0x1;
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

dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0x0);
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
dataMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(type->_class->registered, ident->string, privateModule);
if(!dataMember)
dataMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(type->_class->registered, ident->string, privateModule, (((void *)0)), (((void *)0)));
if(dataMember)
type = dataMember->dataType;
}
else if(type->kind == 9 || type->kind == 10)
{
struct Type * memberType;

for(memberType = type->members.first; memberType; memberType = memberType->next)
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
if(type && type->kind == 20 && type->templateParameter->type == 0 && _class->templateArgs)
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
if(curParam->type == 0 && !strcmp(type->templateParameter->identifier->string, curParam->name))
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

if(arg.dataTypeString)
{
type = ProcessTypeString(arg.dataTypeString, 0x0);
freeType = 0x1;
if(type && _class->templateClass)
type->passAsTemplate = 0x1;
if(type)
{
}
}
}
}
if(type && type->kind == 8 && type->_class && type->_class->registered && strchr(type->_class->registered->fullName, '<'))
{
struct __ecereNameSpace__ecere__com__Class * expClass = type->_class->registered;
struct __ecereNameSpace__ecere__com__Class * cClass = (((void *)0));
int c;
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
if(cParam->type == 0 && arg.dataTypeString && !strcmp(cParam->name, arg.dataTypeString))
{
if(_class->templateArgs && arg.dataTypeString && (!param->defaultArg.dataTypeString || strcmp(arg.dataTypeString, param->defaultArg.dataTypeString)))
{
arg.dataTypeString = _class->templateArgs[p].dataTypeString;
arg.dataTypeClass = _class->templateArgs[p].dataTypeClass;
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
struct Declarator * decl = SpecDeclFromString(param->dataTypeString, specs, (((void *)0)));
struct Expression * exp;
char * string = PrintHexUInt64(arg.expression.ui64);

exp = MkExpCast(MkTypeName(specs, decl), MkExpConstant(string));
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
strcat(argument, arg.member->name);
break;
}
case 0:
{
if(arg.dataTypeString && (!param->defaultArg.dataTypeString || strcmp(arg.dataTypeString, param->defaultArg.dataTypeString)))
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
type = ProcessTypeString(templateString, 0x0);
freeType = 0x1;
FinishTemplatesContext(context);
}
}
if(method && member->initializer && member->initializer->type == 0 && member->initializer->exp)
{
ProcessExpressionType(member->initializer->exp);
if(!member->initializer->exp->expType)
{
if(inCompiler)
{
char expString[10240];

expString[0] = '\0';
PrintExpression(member->initializer->exp, expString);
__ecereNameSpace__ecere__sys__ChangeCh(expString, '\n', ' ');
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "unresolved symbol used as an instance method %s\n", (((void *)0))), expString);
}
}
else if(!MatchTypes(member->initializer->exp->expType, type, (((void *)0)), (((void *)0)), _class, 0x1, 0x1, 0x0, 0x0))
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "incompatible instance method %s\n", (((void *)0))), ident->string);
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
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "couldn't find virtual method %s in class %s\n", (((void *)0))), ident->string, _class->fullName);
}
else if(_class)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "couldn't find member %s in class %s\n", (((void *)0))), ident->string, _class->fullName);
if(inCompiler)
__ecereNameSpace__ecere__com__eClass_AddDataMember(_class, ident->string, "int", 0, 0, 1);
}
}
else if(_class)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "too many initializers for instantiation of class %s\n", (((void *)0))), _class->fullName);
}
}
}

extern struct Identifier * GetDeclId(struct Declarator * decl);

extern struct External * ProcessClassFunction(struct __ecereNameSpace__ecere__com__Class * owningClass, struct ClassFunction * func, struct __ecereNameSpace__ecere__sys__OldList * defs, struct External * after, unsigned int makeStatic);

extern void FreeSpecifier(struct Specifier * spec);

static void ProcessFunction(struct FunctionDefinition * function);

extern struct __ecereNameSpace__ecere__sys__OldList *  CopyList(struct __ecereNameSpace__ecere__sys__OldList *  source, void *  (* )(void * ));

extern struct Specifier * CopySpecifier(struct Specifier * spec);

extern struct Declarator * CopyDeclarator(struct Declarator * declarator);

extern void FreeClassFunction(struct ClassFunction * func);

extern struct MemberInit * MkMemberInit(struct __ecereNameSpace__ecere__sys__OldList * ids, struct Initializer * initializer);

extern struct Initializer * MkInitializerAssignment(struct Expression * exp);

void ProcessInstantiationType(struct Instantiation * inst)
{
yylloc = inst->loc;
if(inst->_class)
{
struct MembersInit * members;
struct Symbol * classSym;
struct __ecereNameSpace__ecere__com__Class * _class;

classSym = inst->_class->symbol;
_class = classSym ? classSym->registered : (((void *)0));
if(!_class || _class->type != 5)
DeclareStruct(inst->_class->name, 0x0);
afterExternal = afterExternal ? afterExternal : curExternal;
if(inst->exp)
ProcessExpressionType(inst->exp);
inst->isConstant = 0x1;
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
struct Declarator * declarator = members->function->declarator;
struct Identifier * nameID = GetDeclId(declarator);
char * unmangled = nameID ? nameID->string : (((void *)0));
struct Expression * exp;
struct External * createdExternal = (((void *)0));

if(inCompiler)
{
char number[16];

strcpy(name, "__ecereInstMeth_");
FullClassNameCat(name, _class ? _class->fullName : "_UNKNOWNCLASS", 0x0);
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
symbol->method = method;
ProcessMethodType(method);
if(!symbol->type->thisClass)
{
if(method->dataType->thisClass && currentClass && __ecereNameSpace__ecere__com__eClass_IsDerived(currentClass, method->dataType->thisClass->registered))
{
if(!currentClass->symbol)
currentClass->symbol = FindClass(currentClass->fullName);
symbol->type->thisClass = currentClass->symbol;
}
else
{
if(!_class->symbol)
_class->symbol = FindClass(_class->fullName);
symbol->type->thisClass = _class->symbol;
}
}
DeclareType(symbol->type, 0x1, 0x1);
}
else if(classSym)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "couldn't find virtual method %s in class %s\n", (((void *)0))), unmangled, classSym->string);
}
}
createdExternal = ProcessClassFunction(classSym ? classSym->registered : (((void *)0)), members->function, ast, afterExternal, 0x1);
if(nameID)
{
FreeSpecifier(nameID->_class);
nameID->_class = (((void *)0));
}
if(inCompiler)
{
struct Type * type = declarator->symbol->type;
struct External * oldExternal = curExternal;

declarator->symbol->id = declarator->symbol->idCode = curExternal->symbol->idCode;
{
struct External * externalDecl;

externalDecl = MkExternalDeclaration((((void *)0)));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), oldExternal->prev, externalDecl);
if(createdExternal->function)
{
ProcessFunction(createdExternal->function);
{
struct Declaration * decl = MkDeclaration(CopyList(createdExternal->function->specifiers, CopySpecifier), MkListOne(MkInitDeclarator(CopyDeclarator(declarator), (((void *)0)))));

externalDecl->declaration = decl;
if(decl->symbol && !decl->symbol->pointerExternal)
decl->symbol->pointerExternal = externalDecl;
declarator->symbol->pointerExternal = externalDecl;
}
}
}
}
else if(declarator)
{
curExternal = declarator->symbol->pointerExternal;
ProcessFunction((struct FunctionDefinition *)members->function);
}
curExternal = external;
curContext = context;
if(inCompiler)
{
FreeClassFunction(members->function);
exp = QMkExpId(name);
members->type = 0;
members->dataMembers = MkListOne(MkMemberInit(MkListOne(MkIdentifier(unmangled)), MkInitializerAssignment(exp)));
(__ecereNameSpace__ecere__com__eSystem_Delete(unmangled), unmangled = 0);
}
break;
}
case 0:
{
if(members->dataMembers && classSym)
{
struct MemberInit * member;
struct Location oldyyloc = yylloc;

for(member = (*members->dataMembers).first; member; member = member->next)
{
ProcessMemberInitData(member, classSym->registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
if(member->initializer && !member->initializer->isConstant)
inst->isConstant = 0x0;
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

static void DeclareType(struct Type * type, unsigned int declarePointers, unsigned int declareParams)
{
if(inCompiler)
{
if(type->kind == 11)
{
struct Type * param;

if(declareParams)
{
for(param = type->params.first; param; param = param->next)
DeclareType(param, declarePointers, 0x1);
}
DeclareType(type->returnType, declarePointers, 0x1);
}
else if(type->kind == 13 && declarePointers)
DeclareType(type->type, declarePointers, 0x0);
else if(type->kind == 8)
{
if(type->_class->registered && (type->_class->registered->type == 1 || type->_class->registered->type == 5) && !type->_class->declaring)
DeclareStruct(type->_class->registered->fullName, type->_class->registered->type == 5);
}
else if(type->kind == 9 || type->kind == 10)
{
struct Type * member;

for(member = type->members.first; member; member = member->next)
DeclareType(member, 0x0, 0x0);
}
else if(type->kind == 12)
DeclareType(type->arrayType, declarePointers, 0x0);
}
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

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
(*arg).dataTypeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, (*arg).dataTypeString);
}
return arg;
}

extern struct Context * PushContext(void);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplatedType;

struct TemplatedType
{
uintptr_t key;
struct __ecereNameSpace__ecere__sys__BTNode * parent;
struct __ecereNameSpace__ecere__sys__BTNode * left;
struct __ecereNameSpace__ecere__sys__BTNode * right;
int depth;
struct TemplateParameter * param;
} __attribute__ ((gcc_struct));

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

struct Context * SetupTemplatesContext(struct __ecereNameSpace__ecere__com__Class * _class)
{
void * __ecereTemp1;
struct Context * context = PushContext();

context->templateTypesOnly = 0x1;
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
p->param = param = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplateParameter), ((struct TemplateParameter *)__ecereTemp1)->identifier = MkIdentifier(p->name), ((struct TemplateParameter *)__ecereTemp1)->type = p->type, ((struct TemplateParameter *)__ecereTemp1)->dataTypeString = p->dataTypeString, ((struct TemplateParameter *)__ecereTemp1));
}
type = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplatedType), ((struct TemplatedType *)__ecereTemp1)->key = (uintptr_t)p->name, ((struct TemplatedType *)__ecereTemp1)->param = param, ((struct TemplatedType *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&curContext->templateTypes, (struct __ecereNameSpace__ecere__sys__BTNode *)type);
}
}
}
}
return context;
}

extern void PopContext(struct Context * ctx);

extern void FreeContext(struct Context * context);

void FinishTemplatesContext(struct Context * context)
{
PopContext(context);
FreeContext(context);
((context ? (__ecereClass_Context->Destructor ? __ecereClass_Context->Destructor(context) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(context)) : 0), context = 0);
}

void ProcessMethodType(struct __ecereNameSpace__ecere__com__Method * method)
{
if(!method->dataType)
{
struct Context * context = SetupTemplatesContext(method->_class);

method->dataType = ProcessTypeString(method->dataTypeString, 0x0);
FinishTemplatesContext(context);
if(method->type != 1 && method->dataType)
{
if(!method->dataType->thisClass && !method->dataType->staticMethod)
{
if(!method->_class->symbol)
method->_class->symbol = FindClass(method->_class->fullName);
method->dataType->thisClass = method->_class->symbol;
}
}
}
}

void ProcessPropertyType(struct __ecereNameSpace__ecere__com__Property * prop)
{
if(!prop->dataType)
{
struct Context * context = SetupTemplatesContext(prop->_class);

prop->dataType = ProcessTypeString(prop->dataTypeString, 0x0);
FinishTemplatesContext(context);
}
}

extern struct Declarator * GetFuncDecl(struct Declarator * decl);

extern void FreeTypeName(struct TypeName * typeName);

static void ProcessDeclarator(struct Declarator * decl);

extern struct __ecereNameSpace__ecere__sys__OldList *  excludedSymbols;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_MethodImport;

struct MethodImport
{
struct MethodImport * prev;
struct MethodImport * next;
char *  name;
unsigned int isVirtual;
} __attribute__ ((gcc_struct));

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void DeclareMethod(struct __ecereNameSpace__ecere__com__Method * method, char * name)
{
void * __ecereTemp1;
struct Symbol * symbol = method->symbol;

if(!symbol || (!symbol->pointerExternal && method->type == 1) || symbol->id > (curExternal ? curExternal->symbol->idCode : -1))
{
unsigned int imported = 0x0;
unsigned int dllImport = 0x0;

if(!method->dataType)
method->dataType = ProcessTypeString(method->dataTypeString, 0x0);
if(!symbol || symbol->_import || method->type == 1)
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

if(method->_class->module && ((struct __ecereNameSpace__ecere__com__Module *)(((char *)method->_class->module + 12)))->name)
module = FindModule(method->_class->module);
else
module = mainModule;
classSym->_import = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassImport), ((struct ClassImport *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(method->_class->fullName), ((struct ClassImport *)__ecereTemp1)->isRemote = method->_class->isRemote, ((struct ClassImport *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&module->classes, classSym->_import);
}
if(!symbol)
{
symbol = method->symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);
}
if(!symbol->_import)
{
symbol->_import = (struct ClassImport *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_MethodImport), ((struct MethodImport *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(method->name), ((struct MethodImport *)__ecereTemp1)->isVirtual = method->type == 1, ((struct MethodImport *)__ecereTemp1));
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
imported = 0x1;
if(method->_class->module != privateModule && ((struct __ecereNameSpace__ecere__com__Module *)(((char *)method->_class->module + 12)))->importType != 1)
dllImport = 0x1;
}
}
if(method->type != 1 && method->dataType)
DeclareType(method->dataType, 0x1, 0x1);
if(!symbol->pointerExternal || symbol->pointerExternal->type == 0)
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
if(method->dataType && !method->dataType->staticMethod)
{
if(funcDecl && funcDecl->function.parameters && (*funcDecl->function.parameters).count)
{
struct __ecereNameSpace__ecere__com__Class * _class = method->dataType->thisClass ? method->dataType->thisClass->registered : method->_class;
struct TypeName * thisParam = MkTypeName(MkListOne(MkSpecifierName(method->dataType->thisClass ? method->dataType->thisClass->string : method->_class->fullName)), (_class && _class->type == 1000) ? MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(MkIdentifier("this"))) : MkDeclaratorIdentifier(MkIdentifier("this")));
struct TypeName * firstParam = ((struct TypeName *)(*funcDecl->function.parameters).first);
struct Specifier * firstSpec = firstParam->qualifiers ? (*firstParam->qualifiers).first : (((void *)0));

if(firstSpec && firstSpec->type == 0 && firstSpec->specifier == VOID && !firstParam->declarator)
{
struct TypeName * param = (*funcDecl->function.parameters).first;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*funcDecl->function.parameters), param);
FreeTypeName(param);
}
if(!funcDecl->function.parameters)
funcDecl->function.parameters = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->function.parameters), (((void *)0)), thisParam);
}
}
}
ProcessDeclarator(d);
ListAdd(declarators, MkInitDeclarator(d, (((void *)0))));
decl = MkDeclaration(specifiers, declarators);
ReplaceThisClassSpecifiers(specifiers, method->_class);
if(symbol->pointerExternal)
{
struct Symbol * functionSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

{
*functionSymbol = *symbol;
functionSymbol->string = __ecereNameSpace__ecere__sys__CopyString(symbol->string);
if(functionSymbol->type)
functionSymbol->type->refCount++;
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), functionSymbol);
symbol->pointerExternal->symbol = functionSymbol;
}
external = MkExternalDeclaration(decl);
if(curExternal)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), curExternal ? curExternal->prev : (((void *)0)), external);
external->symbol = symbol;
symbol->pointerExternal = external;
}
else if(ast)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Move((&*ast), symbol->pointerExternal, curExternal->prev);
}
symbol->id = curExternal ? curExternal->symbol->idCode : (((int)0x7fffffff));
}
}

char * ReplaceThisClass(struct __ecereNameSpace__ecere__com__Class * _class)
{
if(thisClassParams && _class->templateParams.count && !_class->templateClass)
{
unsigned int first = 0x1;
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
first = 0x0;
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
if(thisClassParams && _class->templateParams.count && !_class->templateClass)
{
unsigned int first = 0x1;
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
first = 0x0;
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
return MkClassType(className);
}
else
{
return MkClassType(_class->fullName);
}
}

void ReplaceThisClassSpecifiers(struct __ecereNameSpace__ecere__sys__OldList * specs, struct __ecereNameSpace__ecere__com__Class * _class)
{
if(specs != (((void *)0)) && _class)
{
struct Specifier * spec;

for(spec = specs->first; spec; spec = spec->next)
{
if(spec->type == 0 && spec->specifier == THISCLASS)
{
spec->type = 1;
spec->name = ReplaceThisClass(_class);
spec->symbol = FindClass(spec->name);
}
}
}
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction
{
struct __ecereNameSpace__ecere__com__GlobalFunction * prev;
struct __ecereNameSpace__ecere__com__GlobalFunction * next;
char *  name;
int (*  function)();
struct __ecereNameSpace__ecere__com__Instance * module;
struct __ecereNameSpace__ecere__com__NameSpace *  nameSpace;
char *  dataTypeString;
struct Type * dataType;
void *  symbol;
} __attribute__ ((gcc_struct));

extern struct Context * globalContext;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionImport;

struct FunctionImport
{
struct FunctionImport * prev;
struct FunctionImport * next;
char *  name;
} __attribute__ ((gcc_struct));

unsigned int DeclareFunction(struct __ecereNameSpace__ecere__com__GlobalFunction * function, char * name)
{
void * __ecereTemp1;
struct Symbol * symbol = function->symbol;

if(curExternal && (!symbol || symbol->id > curExternal->symbol->idCode))
{
unsigned int imported = 0x0;
unsigned int dllImport = 0x0;

if(!function->dataType)
{
function->dataType = ProcessTypeString(function->dataTypeString, 0x0);
if(!function->dataType->thisClass)
function->dataType->staticMethod = 0x1;
}
if(inCompiler)
{
if(!symbol)
{
struct ModuleImport * module = FindModule(function->module);

symbol = function->symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);
if(module->name)
{
if(!function->dataType->dllExport)
{
symbol->_import = (struct ClassImport *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_FunctionImport), ((struct FunctionImport *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(function->name), ((struct FunctionImport *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&module->functions, symbol->_import);
}
}
{
symbol->type = ProcessTypeString(function->dataTypeString, 0x0);
if(!symbol->type->thisClass)
symbol->type->staticMethod = 0x1;
}
}
imported = symbol->_import ? 0x1 : 0x0;
if(imported && function->module != privateModule && ((struct __ecereNameSpace__ecere__com__Module *)(((char *)function->module + 12)))->importType != 1)
dllImport = 0x1;
}
DeclareType(function->dataType, 0x1, 0x1);
if(inCompiler)
{
if(!symbol->pointerExternal || symbol->pointerExternal->type == 0)
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
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)function->module + 12)))->importType == 1)
{
struct Specifier * spec;

for(spec = (*specifiers).first; spec; spec = spec->next)
if(spec->type == 5 && spec->extDecl && spec->extDecl->type == 0 && !strcmp(spec->extDecl->s, "dllexport"))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*specifiers), spec);
FreeSpecifier(spec);
break;
}
}
funcDecl = GetFuncDecl(d);
if(funcDecl && !funcDecl->function.parameters)
{
funcDecl->function.parameters = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->function.parameters), (((void *)0)), MkTypeName(MkListOne(MkSpecifier(VOID)), (((void *)0))));
}
ListAdd(declarators, MkInitDeclarator(d, (((void *)0))));
{
struct Context * oldCtx = curContext;

curContext = globalContext;
decl = MkDeclaration(specifiers, declarators);
curContext = oldCtx;
}
if(symbol->pointerExternal)
{
struct Symbol * functionSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

{
*functionSymbol = *symbol;
functionSymbol->string = __ecereNameSpace__ecere__sys__CopyString(symbol->string);
if(functionSymbol->type)
functionSymbol->type->refCount++;
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), functionSymbol);
symbol->pointerExternal->symbol = functionSymbol;
}
external = MkExternalDeclaration(decl);
if(curExternal)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), curExternal->prev, external);
external->symbol = symbol;
symbol->pointerExternal = external;
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Move((&*ast), symbol->pointerExternal, curExternal->prev);
}
if(curExternal)
symbol->id = curExternal->symbol->idCode;
}
}
return (symbol && symbol->_import && function->module != privateModule && ((struct __ecereNameSpace__ecere__com__Module *)(((char *)function->module + 12)))->importType != 1) ? 0x1 : 0x0;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_GlobalData;

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
} __attribute__ ((gcc_struct));

void DeclareGlobalData(struct GlobalData * data)
{
struct Symbol * symbol = data->symbol;

if(curExternal && (!symbol || symbol->id > curExternal->symbol->idCode))
{
if(inCompiler)
{
if(!symbol)
symbol = data->symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);
}
if(!data->dataType)
data->dataType = ProcessTypeString(data->dataTypeString, 0x0);
DeclareType(data->dataType, 0x1, 0x1);
if(inCompiler)
{
if(!symbol->pointerExternal)
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
symbol->pointerExternal = external;
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Move((&*ast), symbol->pointerExternal, curExternal->prev);
}
if(curExternal)
symbol->id = curExternal->symbol->idCode;
}
}
}

struct Conversion
{
struct Conversion * prev, * next;
struct __ecereNameSpace__ecere__com__Property * convert;
unsigned int isGet;
struct Type * resultType;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Conversion;

extern void Compiler_Warning(char *  format, ...);

void PrintType(struct Type * type, char *  string, unsigned int printName, unsigned int fullName);

unsigned int MatchTypes(struct Type * source, struct Type * dest, struct __ecereNameSpace__ecere__sys__OldList * conversions, struct __ecereNameSpace__ecere__com__Class * owningClassSource, struct __ecereNameSpace__ecere__com__Class * owningClassDest, unsigned int doConversion, unsigned int enumBaseType, unsigned int acceptReversedParams, unsigned int isConversionExploration)
{
if(source && dest)
{
if(source->kind == 20 && dest->kind != 20)
{
struct Type * type = ProcessTemplateParameterType(source->templateParameter);

if(type)
source = type;
}
if(dest->kind == 20 && source->kind != 20)
{
struct Type * type = ProcessTemplateParameterType(dest->templateParameter);

if(type)
dest = type;
}
if((dest->classObjectType == 2 && source->classObjectType != 3) || (dest->classObjectType == 3 && source->classObjectType != 2))
{
return 0x1;
}
if(source->classObjectType == 3 && dest->classObjectType != 2)
{
return 0x1;
}
if((dest->kind == 9 && source->kind == 9) || (dest->kind == 10 && source->kind == 10))
{
if((dest->enumName && source->enumName && !strcmp(dest->enumName, source->enumName)) || (source->members.first && source->members.first == dest->members.first))
return 0x1;
}
if(dest->kind == 14 && source->kind != 0)
return 0x1;
if(dest->kind == 13 && dest->type->kind == 0 && ((source->kind == 8 && (!source->_class || !source->_class->registered || source->_class->registered->type == 1 || source->_class->registered->type == 0 || source->_class->registered->type == 5 || source->_class->registered->type == 1000)) || source->kind == 19 || source->kind == 13 || source->kind == 12 || source->kind == 11 || source->kind == 21))
return 0x1;
if(!isConversionExploration && source->kind == 13 && source->type->kind == 0 && ((dest->kind == 8 && (!dest->_class || !dest->_class->registered || dest->_class->registered->type == 1 || dest->_class->registered->type == 0 || dest->_class->registered->type == 5 || dest->_class->registered->type == 1000)) || dest->kind == 19 || dest->kind == 13 || dest->kind == 12 || dest->kind == 11 || dest->kind == 21))
return 0x1;
if(((source->kind == 8 && dest->kind == 8) || (source->kind == 19 && dest->kind == 19)) && source->_class)
{
if(source->_class->registered && source->_class->registered->type == 3)
{
if(conversions != (((void *)0)))
{
if(source->_class->registered == dest->_class->registered)
return 0x1;
}
else
{
struct __ecereNameSpace__ecere__com__Class * sourceBase, * destBase;

for(sourceBase = source->_class->registered; sourceBase && sourceBase->base->type != 1000; sourceBase = sourceBase->base)
;
for(destBase = dest->_class->registered; destBase && destBase->base->type != 1000; destBase = destBase->base)
;
if(sourceBase == destBase)
return 0x1;
}
}
else if(source->_class && dest->_class && (dest->classObjectType == source->classObjectType || !dest->classObjectType) && (enumBaseType || (!source->_class->registered || source->_class->registered->type != 4) || (!dest->_class->registered || dest->_class->registered->type != 4)) && __ecereNameSpace__ecere__com__eClass_IsDerived(source->_class->registered, dest->_class->registered))
return 0x1;
else
{
if(enumBaseType && dest->_class && dest->_class->registered && dest->_class->registered->type == 4 && source->_class && source->_class->registered && source->_class->registered->type != 4)
{
if(__ecereNameSpace__ecere__com__eClass_IsDerived(dest->_class->registered, source->_class->registered))
{
return 0x1;
}
}
}
}
if(source->kind == 19 && dest->kind == 8 && dest->_class && !strcmp(dest->_class->string, "ecere::com::Class"))
return 0x1;
if(doConversion)
{
if(source->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class;

for(_class = source->_class ? source->_class->registered : (((void *)0)); _class; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__Property * convert;

for(convert = _class->conversions.first; convert; convert = convert->next)
{
if(convert->memberAccess == 1 || _class->module == privateModule)
{
struct Conversion * after = (conversions != (((void *)0))) ? conversions->last : (((void *)0));

if(!convert->dataType)
convert->dataType = ProcessTypeString(convert->dataTypeString, 0x0);
if(MatchTypes(convert->dataType, dest, conversions, (((void *)0)), (((void *)0)), 0x0, 0x1, 0x0, 0x1))
{
if(!conversions && !convert->Get)
return 0x1;
else if(conversions != (((void *)0)))
{
if(_class->type == 3 && convert->dataType->kind == 8 && convert->dataType->_class && convert->dataType->_class->registered && _class->base == convert->dataType->_class->registered->base && (dest->kind != 8 || dest->_class->registered != _class->base))
return 0x1;
else
{
struct Conversion * conv = (conv = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Conversion), conv->convert = convert, conv->isGet = 0x1, conv);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(conversions, after, conv);
return 0x1;
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

for(_class = dest->_class ? dest->_class->registered : (((void *)0)); _class; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__Property * convert;

for(convert = _class->conversions.first; convert; convert = convert->next)
{
if(convert->memberAccess == 1 || _class->module == privateModule)
{
if(!convert->dataType)
convert->dataType = ProcessTypeString(convert->dataTypeString, 0x0);
if(convert->dataType != dest && MatchTypes(source, convert->dataType, conversions, (((void *)0)), (((void *)0)), 0x1, 0x0, 0x0, 0x1))
{
if(!conversions && !convert->Set)
return 0x1;
else if(conversions != (((void *)0)))
{
if(_class->type == 3 && convert->dataType->kind == 8 && convert->dataType->_class && convert->dataType->_class->registered && _class->base == convert->dataType->_class->registered->base && (source->kind != 8 || source->_class->registered != _class->base))
return 0x1;
else
{
struct Conversion * conv = (conv = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Conversion), conv->convert = convert, conv);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(conversions, conv);
return 0x1;
}
}
}
}
}
}
if(enumBaseType && dest->_class && dest->_class->registered && dest->_class->registered->type == 4)
{
if(!dest->_class->registered->dataType)
dest->_class->registered->dataType = ProcessTypeString(dest->_class->registered->dataTypeString, 0x0);
if(dest->_class->registered->dataType->kind == 8 || source->truth || dest->truth)
{
if(MatchTypes(source, dest->_class->registered->dataType, conversions, (((void *)0)), (((void *)0)), 0x1, 0x1, 0x0, 0x0))
{
return 0x1;
}
}
}
}
if(source->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class;

for(_class = source->_class ? source->_class->registered : (((void *)0)); _class; _class = _class->base)
{
struct __ecereNameSpace__ecere__com__Property * convert;

for(convert = _class->conversions.first; convert; convert = convert->next)
{
if(convert->memberAccess == 1 || _class->module == privateModule)
{
struct Conversion * after = (conversions != (((void *)0))) ? conversions->last : (((void *)0));

if(!convert->dataType)
convert->dataType = ProcessTypeString(convert->dataTypeString, 0x0);
if(convert->dataType != source && MatchTypes(convert->dataType, dest, conversions, (((void *)0)), (((void *)0)), 0x1, 0x1, 0x0, 0x1))
{
if(!conversions && !convert->Get)
return 0x1;
else if(conversions != (((void *)0)))
{
if(_class->type == 3 && convert->dataType->kind == 8 && convert->dataType->_class && convert->dataType->_class->registered && _class->base == convert->dataType->_class->registered->base && (dest->kind != 8 || dest->_class->registered != _class->base))
return 0x1;
else
{
struct Conversion * conv = (conv = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Conversion), conv->convert = convert, conv->isGet = 0x1, conv);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(conversions, after, conv);
return 0x1;
}
}
}
}
}
}
if(enumBaseType && source->_class && source->_class->registered && source->_class->registered->type == 4)
{
if(!source->_class->registered->dataType)
source->_class->registered->dataType = ProcessTypeString(source->_class->registered->dataTypeString, 0x0);
if(MatchTypes(source->_class->registered->dataType, dest, conversions, (((void *)0)), (((void *)0)), 0x1, 0x1, 0x0, 0x0))
{
return 0x1;
}
}
}
}
if(source->kind == 8 || source->kind == 19)
;
else if(dest->kind == source->kind && (dest->kind != 9 && dest->kind != 10 && dest->kind != 11 && dest->kind != 12 && dest->kind != 13 && dest->kind != 16))
return 0x1;
else if(dest->kind == 7 && source->kind == 6)
return 0x1;
else if(dest->kind == 2 && source->kind == 1)
return 0x1;
else if(dest->kind == 3 && (source->kind == 2 || source->kind == 1))
return 0x1;
else if(dest->kind == 4 && (source->kind == 2 || source->kind == 1 || source->kind == 3))
return 0x1;
else if(dest->kind == 22 && (source->kind == 2 || source->kind == 1 || source->kind == 3))
return 0x1;
else if(source->kind == 15 && (dest->kind == 3 || dest->kind == 2 || dest->kind == 1 || dest->kind == 5 || dest->kind == 4 || dest->kind == 22))
return 0x1;
else if(dest->kind == 15 && (source->kind == 3 || source->kind == 2 || source->kind == 1 || source->kind == 5 || source->kind == 4 || source->kind == 22))
return 0x1;
else if((dest->kind == 11 || (dest->kind == 13 && dest->type->kind == 11) || dest->kind == 16) && ((source->kind == 11 || (source->kind == 13 && source->type->kind == 11) || source->kind == 16)))
{
struct Type * paramSource, * paramDest;

if(dest->kind == 16)
owningClassDest = dest->methodClass ? dest->methodClass : dest->method->_class;
if(source->kind == 16)
owningClassSource = source->methodClass ? source->methodClass : source->method->_class;
if(dest->kind == 13 && dest->type->kind == 11)
dest = dest->type;
if(source->kind == 13 && source->type->kind == 11)
source = source->type;
if(dest->kind == 16)
dest = dest->method->dataType;
if(source->kind == 16)
source = source->method->dataType;
paramSource = source->params.first;
if(paramSource && paramSource->kind == 0)
paramSource = (((void *)0));
paramDest = dest->params.first;
if(paramDest && paramDest->kind == 0)
paramDest = (((void *)0));
if((dest->staticMethod || (!dest->thisClass && !owningClassDest)) && !(source->staticMethod || (!source->thisClass && !owningClassSource)))
{
if(!paramDest || (!(paramDest->kind == 13 && paramDest->type && paramDest->type->kind == 0) && (paramDest->kind != 8 || !__ecereNameSpace__ecere__com__eClass_IsDerived(source->thisClass ? source->thisClass->registered : owningClassSource, paramDest->_class->registered))))
{
if(paramDest && paramDest->kind == 8)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "method class must be derived from %s\n", (((void *)0))), paramDest->_class->string);
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "method class should not take an object\n", (((void *)0))));
return 0x0;
}
paramDest = paramDest->next;
}
else if(!dest->staticMethod && (dest->thisClass || owningClassDest))
{
if((source->staticMethod || (!source->thisClass && !owningClassSource)))
{
if(dest->thisClass)
{
if(!paramSource || paramSource->kind != 8 || !__ecereNameSpace__ecere__com__eClass_IsDerived(paramSource->_class->registered, dest->thisClass->registered))
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "method class must be derived from %s\n", (((void *)0))), dest->thisClass->string);
return 0x0;
}
}
else
{
if(!paramSource || paramSource->kind != 8 || (owningClassDest && !__ecereNameSpace__ecere__com__eClass_IsDerived(paramSource->_class->registered, owningClassDest)))
{
if(owningClassDest)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "%s expected to be derived from method class\n", (((void *)0))), owningClassDest->fullName);
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "overriding class expected to be derived from method class\n", (((void *)0))));
return 0x0;
}
}
paramSource = paramSource->next;
}
else
{
if(dest->thisClass)
{
if(!__ecereNameSpace__ecere__com__eClass_IsDerived(source->thisClass ? source->thisClass->registered : owningClassSource, dest->thisClass->registered))
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "method class must be derived from %s\n", (((void *)0))), dest->thisClass->string);
return 0x0;
}
}
else
{
if(source->thisClass && source->thisClass->registered && owningClassDest && !__ecereNameSpace__ecere__com__eClass_IsDerived(source->thisClass->registered, owningClassDest))
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "%s expected to be derived from method class\n", (((void *)0))), source->thisClass->registered->fullName);
return 0x0;
}
}
}
}
if(!MatchTypes(source->returnType, dest->returnType, (((void *)0)), (((void *)0)), (((void *)0)), 0x1, 0x1, 0x0, 0x0))
{
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "incompatible return type for function\n", (((void *)0))));
return 0x0;
}
for(; paramDest; paramDest = paramDest->next)
{
if(!paramSource)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "not enough parameters\n", (((void *)0))));
return 0x0;
}
{
struct Type * paramDestType = paramDest;
struct Type * paramSourceType = paramSource;
struct Type * type = paramDestType;

if(paramDest->kind == 20 && paramDest->templateParameter->type == 0 && owningClassSource && paramSource->kind != 20)
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
if(curParam->type == 0 && !strcmp(type->templateParameter->identifier->string, curParam->name))
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

paramDestType = type = ProcessTypeString(arg.dataTypeString, 0x0);
}
}
if(!MatchTypes(paramDestType, paramSourceType, (((void *)0)), (((void *)0)), (((void *)0)), 0x1, 0x1, 0x0, 0x0) && (!acceptReversedParams || !MatchTypes(paramSourceType, paramDestType, (((void *)0)), (((void *)0)), (((void *)0)), 0x1, 0x1, 0x0, 0x0)))
{
char type[1024];

type[0] = (char)0;
PrintType(paramDest, type, 0x0, 0x1);
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "incompatible parameter %s (expected %s)\n", (((void *)0))), paramSource->name, type);
if(paramDestType != paramDest)
FreeType(paramDestType);
return 0x0;
}
if(paramDestType != paramDest)
FreeType(paramDestType);
}
paramSource = paramSource->next;
}
if(paramSource)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "too many parameters\n", (((void *)0))));
return 0x0;
}
return 0x1;
}
else if((dest->kind == 11 || (dest->kind == 13 && dest->type->kind == 11) || dest->kind == 16) && (source->kind == 13 && source->type->kind == 0))
{
return 0x1;
}
else if((dest->kind == 13 || dest->kind == 12) && (source->kind == 12 || source->kind == 13))
{
if(MatchTypes(source->type, dest->type, (((void *)0)), (((void *)0)), (((void *)0)), 0x1, 0x1, 0x0, 0x0))
return 0x1;
}
}
return 0x0;
}

static void FreeConvert(struct Conversion * convert)
{
if(convert->resultType)
FreeType(convert->resultType);
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BTNamedLink;

struct __ecereNameSpace__ecere__com__BTNamedLink
{
char *  name;
struct __ecereNameSpace__ecere__com__BTNamedLink * parent;
struct __ecereNameSpace__ecere__com__BTNamedLink * left;
struct __ecereNameSpace__ecere__com__BTNamedLink * right;
int depth;
void *  data;
} __attribute__ ((gcc_struct));

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

extern void FreeExpContents(struct Expression * exp);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(struct __ecereNameSpace__ecere__sys__BinaryTree * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first;

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(struct __ecereNameSpace__ecere__sys__BTNode * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__sys__BTNode_next;

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(struct __ecereNameSpace__ecere__sys__OldList * this, void (*  freeFn)(void * ));

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
type->_class = _class->symbol;
if(MatchTypes(type, dest, &converts, (((void *)0)), (((void *)0)), 0x1, 0x0, 0x0, 0x0))
{
struct __ecereNameSpace__ecere__sys__NamedLink * value;
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
FreeExpContents(sourceExp);
FreeType(sourceExp->expType);
sourceExp->isConstant = 0x1;
sourceExp->expType = MkClassType(baseClass->fullName);
{
char constant[256];

sourceExp->type = 2;
if(!strcmp(baseClass->dataTypeString, "int"))
sprintf(constant, "%d", value->data);
else
sprintf(constant, "0x%X", value->data);
sourceExp->constant = __ecereNameSpace__ecere__sys__CopyString(constant);
}
while(converts.first)
{
struct Conversion * convert = converts.first;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&converts, convert);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(conversions, convert);
}
((type ? (__ecereClass_Type->Destructor ? __ecereClass_Type->Destructor(type) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(type)) : 0), type = 0);
return 0x1;
}
}
}
}
if(converts.first)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&converts, FreeConvert);
((type ? (__ecereClass_Type->Destructor ? __ecereClass_Type->Destructor(type) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(type)) : 0), type = 0);
}
}
for(nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&nameSpace->nameSpaces); nameSpace != (((void *)0)); nameSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)nameSpace)))
if(MatchWithEnums_NameSpace(nameSpace, sourceExp, dest, string, conversions))
return 0x1;
return 0x0;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SubModule;

struct __ecereNameSpace__ecere__com__SubModule
{
struct __ecereNameSpace__ecere__com__SubModule * prev;
struct __ecereNameSpace__ecere__com__SubModule * next;
struct __ecereNameSpace__ecere__com__Instance * module;
int importMode;
} __attribute__ ((gcc_struct));

unsigned int ModuleVisibility(struct __ecereNameSpace__ecere__com__Instance * searchIn, struct __ecereNameSpace__ecere__com__Instance * searchFor)
{
struct __ecereNameSpace__ecere__com__SubModule * subModule;

if(searchFor == searchIn)
return 0x1;
for(subModule = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)searchIn + 12)))->modules.first; subModule; subModule = subModule->next)
{
if(subModule->importMode == 1 || searchIn == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)searchIn + 12)))->application)
{
if(ModuleVisibility(subModule->module, searchFor))
return 0x1;
}
}
return 0x0;
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

unsigned int MatchWithEnums_Module(struct __ecereNameSpace__ecere__com__Instance * mainModule, struct Expression * sourceExp, struct Type * dest, char * string, struct __ecereNameSpace__ecere__sys__OldList * conversions)
{
struct __ecereNameSpace__ecere__com__Instance * module;

if(MatchWithEnums_NameSpace(&((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)mainModule + 12)))->application + 300)))->systemNameSpace, sourceExp, dest, string, conversions))
return 0x1;
if(MatchWithEnums_NameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)mainModule + 12)))->application + 12)))->privateNameSpace, sourceExp, dest, string, conversions))
return 0x1;
if(MatchWithEnums_NameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)mainModule + 12)))->application + 12)))->publicNameSpace, sourceExp, dest, string, conversions))
return 0x1;
for(module = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)mainModule + 12)))->application + 300)))->allModules.first; module; module = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->next)
{
if(ModuleVisibility(mainModule, module) && MatchWithEnums_NameSpace(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->publicNameSpace, sourceExp, dest, string, conversions))
return 0x1;
}
return 0x0;
}

extern unsigned long strtoul(const char *  nptr, char * *  endptr, int base);

void ReadString(char *  output, char *  string);

extern struct Specifier * MkEnum(struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * list);

extern struct TypeName * QMkClass(char *  spec, struct Declarator * decl);

extern struct Expression * MkExpBrackets(struct __ecereNameSpace__ecere__sys__OldList * expressions);

unsigned int MatchTypeExpression(struct Expression * sourceExp, struct Type * dest, struct __ecereNameSpace__ecere__sys__OldList * conversions, unsigned int skipUnitBla)
{
void * __ecereTemp1;
struct Type * source = sourceExp->expType;
struct Type * realDest = dest;

if(dest->kind == 13 && sourceExp->type == 2 && !strtoul(sourceExp->constant, (((void *)0)), 0))
return 0x1;
if(!skipUnitBla && source && dest && source->kind == 8 && dest->kind == 8)
{
if(source->_class && source->_class->registered && source->_class->registered->type == 3)
{
struct __ecereNameSpace__ecere__com__Class * sourceBase, * destBase;

for(sourceBase = source->_class->registered; sourceBase && sourceBase->base && sourceBase->base->type != 1000; sourceBase = sourceBase->base)
;
for(destBase = dest->_class->registered; destBase && destBase->base && destBase->base->type != 1000; destBase = destBase->base)
;
if(sourceBase == destBase)
return 0x1;
}
}
if(source)
{
struct __ecereNameSpace__ecere__sys__OldList * specs;
unsigned int flag = 0x0;
long long value = (((int)0x7fffffff));

source->refCount++;
dest->refCount++;
if(sourceExp->type == 2)
{
if(source->isSigned)
value = strtoll(sourceExp->constant, (((void *)0)), 0);
else
value = strtoull(sourceExp->constant, (((void *)0)), 0);
}
else if(sourceExp->type == 4 && sourceExp->op.op == '-' && !sourceExp->op.exp1 && sourceExp->op.exp2 && sourceExp->op.exp2->type == 2)
{
if(source->isSigned)
value = -strtoll(sourceExp->op.exp2->constant, (((void *)0)), 0);
else
value = -strtoull(sourceExp->op.exp2->constant, (((void *)0)), 0);
}
if(dest->kind != 8 && source->kind == 8 && source->_class && source->_class->registered && !strcmp(source->_class->registered->fullName, "ecere::com::unichar"))
{
FreeType(source);
source = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->kind = 3, ((struct Type *)__ecereTemp1)->isSigned = 0x0, ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
}
if(dest->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = dest->_class ? dest->_class->registered : (((void *)0));

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
tempType->_class = _class->symbol;
tempType->truth = dest->truth;
if(tempType->_class)
MatchTypes(tempSource, tempDest, conversions, (((void *)0)), (((void *)0)), 0x1, 0x1, 0x0, 0x0);
FreeType(sourceExp->expType);
sourceExp->expType = dest;
dest->refCount++;
flag = 0x1;
((tempType ? (__ecereClass_Type->Destructor ? __ecereClass_Type->Destructor(tempType) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(tempType)) : 0), tempType = 0);
}
}
if(_class && _class->type == 2 && source->kind != 8)
{
if(!dest->_class->registered->dataType)
dest->_class->registered->dataType = ProcessTypeString(dest->_class->registered->dataTypeString, 0x0);
if(MatchTypes(source, dest->_class->registered->dataType, conversions, (((void *)0)), (((void *)0)), 0x1, 0x1, 0x0, 0x0))
{
FreeType(source);
FreeType(sourceExp->expType);
source = sourceExp->expType = MkClassType(dest->_class->string);
source->refCount++;
}
}
if(_class && !strcmp(_class->fullName, "ecere::com::Class") && source->kind == 13 && source->type && source->type->kind == 1 && sourceExp->type == 3)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;
char string[1024];

ReadString(string, sourceExp->string);
decl = SpecDeclFromString(string, specs, (((void *)0)));
FreeExpContents(sourceExp);
FreeType(sourceExp->expType);
sourceExp->type = 26;
sourceExp->_classExp.specifiers = specs;
sourceExp->_classExp.decl = decl;
sourceExp->expType = dest;
dest->refCount++;
FreeType(source);
FreeType(dest);
return 0x1;
}
}
else if(source->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = source->_class ? source->_class->registered : (((void *)0));

if(_class && (_class->type == 3 || !strcmp(_class->fullName, "bool") || _class->type == 2))
{
if(dest->kind != 8)
{
struct Type * tempType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
struct Type * tempDest, * tempSource;

if(!source->_class->registered->dataType)
source->_class->registered->dataType = ProcessTypeString(source->_class->registered->dataTypeString, 0x0);
for(; _class->base->type != 1000; _class = _class->base)
;
tempDest = source;
tempSource = tempType;
tempType->kind = 8;
tempType->_class = FindClass(_class->fullName);
tempType->truth = source->truth;
tempType->classObjectType = source->classObjectType;
if(tempType->_class)
MatchTypes(tempSource, tempDest, conversions, (((void *)0)), (((void *)0)), 0x1, 0x1, 0x0, 0x0);
if(conversions->last)
{
((struct Conversion *)conversions->last)->resultType = dest;
dest->refCount++;
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
_class->dataType = ProcessTypeString(_class->dataTypeString, 0x0);
FreeType(dest);
dest = MkClassType(source->_class->string);
dest->truth = source->truth;
dest->classObjectType = source->classObjectType;
FreeType(source);
source = _class->dataType;
source->refCount++;
((tempType ? (__ecereClass_Type->Destructor ? __ecereClass_Type->Destructor(tempType) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(tempType)) : 0), tempType = 0);
}
}
}
if(!flag)
{
if(MatchTypes(source, dest, conversions, (((void *)0)), (((void *)0)), 0x1, 0x1, 0x0, 0x0))
{
FreeType(source);
FreeType(dest);
return 0x1;
}
}
if(dest->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = dest->_class ? dest->_class->registered : (((void *)0));

if(_class && !dest->truth && (_class->type == 3 || !strcmp(_class->fullName, "bool") || (_class->type != 1 && !value && source->kind == 3) || _class->type == 2))
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
sourceExp->cast.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0))));
sourceExp->cast.exp = newExp;
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
return 0x1;
}
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0x0);
FreeType(dest);
dest = _class->dataType;
dest->refCount++;
}
if(dest->kind == 7 && (source->kind == 7 || source->kind == 6 || dest->kind == 4 || source->kind == 3 || source->kind == 2 || source->kind == 1))
{
specs = MkListOne(MkSpecifier(DOUBLE));
}
else if(dest->kind == 6 && (source->kind == 6 || dest->kind == 4 || source->kind == 3 || source->kind == 2 || source->kind == 1 || source->kind == 7))
{
specs = MkListOne(MkSpecifier(FLOAT));
}
else if(dest->kind == 4 && (source->kind == 4 || source->kind == 3 || source->kind == 2 || source->kind == 1 || source->kind == 6 || source->kind == 7))
{
specs = MkList();
if(!dest->isSigned)
ListAdd(specs, MkSpecifier(UNSIGNED));
ListAdd(specs, MkSpecifier(INT64));
}
else if(dest->kind == 3 && (source->kind == 3 || source->kind == 2 || source->kind == 1 || source->kind == 6 || source->kind == 7))
{
specs = MkList();
if(!dest->isSigned)
ListAdd(specs, MkSpecifier(UNSIGNED));
ListAdd(specs, MkSpecifier(INT));
}
else if(dest->kind == 2 && (source->kind == 2 || source->kind == 1 || source->kind == 3 || source->kind == 6 || source->kind == 7))
{
specs = MkList();
if(!dest->isSigned)
ListAdd(specs, MkSpecifier(UNSIGNED));
ListAdd(specs, MkSpecifier(SHORT));
}
else if(dest->kind == 1 && (source->kind == 1 || source->kind == 2 || source->kind == 3 || source->kind == 6 || source->kind == 7))
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
return 0x0;
}
}
else if(dest->kind == 7 && (source->kind == 7 || source->kind == 6 || source->kind == 4 || source->kind == 3 || source->kind == 15 || source->kind == 2 || source->kind == 1))
{
specs = MkListOne(MkSpecifier(DOUBLE));
}
else if(dest->kind == 6 && (source->kind == 6 || source->kind == 15 || source->kind == 4 || source->kind == 3 || source->kind == 2 || source->kind == 1))
{
specs = MkListOne(MkSpecifier(FLOAT));
}
else if(dest->kind == 1 && (source->kind == 1 || source->kind == 15 || source->kind == 2 || source->kind == 3) && (dest->isSigned ? (value >= -128 && value <= 127) : (value >= 0 && value <= 255)))
{
specs = MkList();
if(!dest->isSigned)
ListAdd(specs, MkSpecifier(UNSIGNED));
ListAdd(specs, MkSpecifier(CHAR));
}
else if(dest->kind == 2 && (source->kind == 15 || source->kind == 1 || source->kind == 2 || (source->kind == 3 && (dest->isSigned ? (value >= -32768 && value <= 32767) : (value >= 0 && value <= 65535)))))
{
specs = MkList();
if(!dest->isSigned)
ListAdd(specs, MkSpecifier(UNSIGNED));
ListAdd(specs, MkSpecifier(SHORT));
}
else if(dest->kind == 3 && (source->kind == 15 || source->kind == 2 || source->kind == 1 || source->kind == 3))
{
specs = MkList();
if(!dest->isSigned)
ListAdd(specs, MkSpecifier(UNSIGNED));
ListAdd(specs, MkSpecifier(INT));
}
else if(dest->kind == 4 && (source->kind == 15 || source->kind == 2 || source->kind == 1 || source->kind == 3 || source->kind == 4))
{
specs = MkList();
if(!dest->isSigned)
ListAdd(specs, MkSpecifier(UNSIGNED));
ListAdd(specs, MkSpecifier(INT64));
}
else if(dest->kind == 15 && (source->kind == 4 || source->kind == 3 || source->kind == 2 || source->kind == 1))
{
specs = MkListOne(MkEnum(MkIdentifier(dest->enumName), (((void *)0))));
}
else
{
FreeType(source);
FreeType(dest);
return 0x0;
}
if(!flag)
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
sourceExp->cast.typeName = QMkClass(realDest->_class->string, (((void *)0)));
FreeList(specs, FreeSpecifier);
}
else
sourceExp->cast.typeName = MkTypeName(specs, (((void *)0)));
if(newExp->type == 4)
{
sourceExp->cast.exp = MkExpBrackets(MkListOne(newExp));
}
else
sourceExp->cast.exp = newExp;
FreeType(sourceExp->expType);
sourceExp->expType = (((void *)0));
ProcessExpressionType(sourceExp);
}
else
FreeList(specs, FreeSpecifier);
FreeType(dest);
FreeType(source);
return 0x1;
}
else
{
while((sourceExp->type == 5 || sourceExp->type == 34) && sourceExp->list)
sourceExp = (*sourceExp->list).last;
if(sourceExp->type == 0)
{
struct Identifier * id = sourceExp->identifier;

if(dest->kind == 8)
{
if(dest->_class && dest->_class->registered && dest->_class->registered->type == 4)
{
struct __ecereNameSpace__ecere__com__Class * _class = dest->_class->registered;
struct __ecereNameSpace__ecere__com__Class * enumClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "enum");

if(enumClass)
{
for(; _class && _class->type == 4; _class = _class->base)
{
struct __ecereNameSpace__ecere__sys__NamedLink * value;
struct __ecereNameSpace__ecere__com__EnumClassData * e = (_class ? ((void *)(((char *)_class->data) + enumClass->offsetClass)) : (((void *)0)));

for(value = e->values.first; value; value = value->next)
{
if(!strcmp(value->name, id->string))
break;
}
if(value)
{
FreeExpContents(sourceExp);
FreeType(sourceExp->expType);
sourceExp->isConstant = 0x1;
sourceExp->expType = MkClassType(_class->fullName);
{
char constant[256];

sourceExp->type = 2;
if(_class->dataTypeString && !strcmp(_class->dataTypeString, "int"))
sprintf(constant, "%d", value->data);
else
sprintf(constant, "0x%X", value->data);
sourceExp->constant = __ecereNameSpace__ecere__sys__CopyString(constant);
}
return 0x1;
}
}
}
}
}
if(dest->classObjectType != 2 && dest->kind == 8 && MatchWithEnums_Module(privateModule, sourceExp, dest, id->string, conversions))
return 0x1;
}
}
return 0x0;
}

static unsigned int IntAdd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i + value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntAdd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui + value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortAdd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s + value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortAdd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us + value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharAdd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c + value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharAdd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc + value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatAdd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(op1->f + value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleAdd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(op1->d + value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntSub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i - value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntSub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui - value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortSub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s - value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortSub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us - value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharSub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c - value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharSub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc - value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatSub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(op1->f - value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleSub(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(op1->d - value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntMul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i * value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntMul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui * value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortMul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s * value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortMul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us * value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharMul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c * value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharMul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc * value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatMul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(op1->f * value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleMul(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(op1->d * value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntDiv(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(value2 ? (op1->i / value2) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntDiv(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(value2 ? (op1->ui / value2) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortDiv(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(value2 ? (op1->s / value2) : (short)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortDiv(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(value2 ? (op1->us / value2) : (unsigned short)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharDiv(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(value2 ? (op1->c / value2) : (char)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharDiv(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(value2 ? (op1->uc / value2) : (unsigned char)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatDiv(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(value2 ? (op1->f / value2) : (float)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleDiv(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(value2 ? (op1->d / value2) : (double)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntMod(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(value2 ? (op1->i % value2) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntMod(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(value2 ? (op1->ui % value2) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortMod(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(value2 ? (op1->s % value2) : (short)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortMod(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(value2 ? (op1->us % value2) : (unsigned short)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharMod(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(value2 ? (op1->c % value2) : (char)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharMod(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(value2 ? (op1->uc % value2) : (unsigned char)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntNeg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintInt(-op1->i);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntNeg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintUInt(-op1->ui);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortNeg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintShort(-op1->s);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortNeg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintUShort(-op1->us);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharNeg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintChar(-op1->c);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharNeg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintUChar(-op1->uc);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatNeg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintFloat(-op1->f);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleNeg(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintDouble(-op1->d);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntInc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintInt(++op1->i);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntInc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintUInt(++op1->ui);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortInc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintShort(++op1->s);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortInc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintUShort(++op1->us);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharInc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintChar(++op1->c);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharInc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintUChar(++op1->uc);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatInc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintFloat(++op1->f);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleInc(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintDouble(++op1->d);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntDec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintInt(--op1->i);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntDec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintUInt(--op1->ui);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortDec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintShort(--op1->s);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortDec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintUShort(--op1->us);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharDec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintChar(--op1->c);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharDec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintUChar(--op1->uc);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatDec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintFloat(--op1->f);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleDec(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintDouble(--op1->d);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i = value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui = value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s = value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us = value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c = value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc = value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(op1->f = value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(op1->d = value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntAddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i += value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntAddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui += value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortAddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s += value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortAddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us += value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharAddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c += value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharAddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc += value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatAddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(op1->f += value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleAddAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(op1->d += value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntSubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i -= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntSubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui -= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortSubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s -= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortSubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us -= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharSubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c -= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharSubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc -= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatSubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(op1->f -= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleSubAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(op1->d -= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntMulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i *= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntMulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui *= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortMulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s *= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortMulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us *= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharMulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c *= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharMulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc *= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatMulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(op1->f *= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleMulAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(op1->d *= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntDivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(value2 ? (op1->i /= value2) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntDivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(value2 ? (op1->ui /= value2) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortDivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(value2 ? (op1->s /= value2) : (short)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortDivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(value2 ? (op1->us /= value2) : (unsigned short)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharDivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(value2 ? (op1->c /= value2) : (char)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharDivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(value2 ? (op1->uc /= value2) : (unsigned char)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatDivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(value2 ? (op1->f /= value2) : (float)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleDivAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(value2 ? (op1->d /= value2) : (double)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntModAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(value2 ? (op1->i %= value2) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntModAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(value2 ? (op1->ui %= value2) : 0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortModAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(value2 ? (op1->s %= value2) : (short)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortModAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(value2 ? (op1->us %= value2) : (unsigned short)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharModAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(value2 ? (op1->c %= value2) : (char)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharModAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(value2 ? (op1->uc %= value2) : (unsigned char)0);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntBitAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i & value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntBitAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui & value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortBitAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s & value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortBitAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us & value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharBitAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c & value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharBitAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc & value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntBitOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i | value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntBitOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui | value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortBitOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s | value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortBitOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us | value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharBitOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c | value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharBitOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc | value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntBitXor(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i ^ value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntBitXor(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui ^ value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortBitXor(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s ^ value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortBitXor(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us ^ value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharBitXor(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c ^ value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharBitXor(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc ^ value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntLShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i << value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntLShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui << value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortLShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s << value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortLShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us << value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharLShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c << value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharLShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc << value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntRShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i >> value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntRShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui >> value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortRShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s >> value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortRShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us >> value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharRShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c >> value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharRShift(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc >> value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntBitNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintInt(~op1->i);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntBitNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintUInt(~op1->ui);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortBitNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintShort(~op1->s);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortBitNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintUShort(~op1->us);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharBitNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintChar(~op1->c);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharBitNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintUChar(~op1->uc);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntAndAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i &= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntAndAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui &= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortAndAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s &= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortAndAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us &= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharAndAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c &= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharAndAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc &= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntOrAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i |= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntOrAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui |= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortOrAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s |= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortOrAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us |= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharOrAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c |= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharOrAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc |= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntXorAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i ^= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntXorAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui ^= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortXorAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s ^= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortXorAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us ^= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharXorAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c ^= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharXorAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc ^= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntLShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i <<= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntLShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui <<= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortLShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s <<= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortLShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us <<= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharLShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c <<= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharLShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc <<= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntRShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i >>= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntRShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui >>= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortRShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s >>= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortRShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us >>= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharRShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c >>= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharRShiftAsign(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc >>= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintInt(!op1->i);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintUInt(!op1->ui);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintShort(!op1->s);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintUShort(!op1->us);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintChar(!op1->c);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharNot(struct Expression * exp, struct Operand * op1)
{
exp->type = 2;
exp->string = PrintUChar(!op1->uc);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i == value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui == value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s == value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us == value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c == value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc == value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(op1->f == value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(op1->d == value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntNqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i != value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntNqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui != value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortNqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s != value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortNqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us != value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharNqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c != value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharNqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc != value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatNqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(op1->f != value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleNqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(op1->d != value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i && value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui && value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s && value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us && value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c && value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc && value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(op1->f && value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleAnd(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(op1->d && value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i || value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui || value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s || value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us || value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c || value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc || value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(op1->f || value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleOr(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(op1->d || value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntGrt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i > value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntGrt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui > value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortGrt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s > value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortGrt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us > value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharGrt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c > value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharGrt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc > value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatGrt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(op1->f > value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleGrt(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(op1->d > value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntSma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i < value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntSma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui < value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortSma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s < value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortSma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us < value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharSma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c < value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharSma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc < value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatSma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(op1->f < value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleSma(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(op1->d < value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntGrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i >= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntGrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui >= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortGrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s >= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortGrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us >= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharGrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c >= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharGrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc >= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatGrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(op1->f >= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleGrtEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(op1->d >= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntSmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
int value2 = op2->i;

exp->type = 2;
exp->string = PrintInt(op1->i <= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntSmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned int value2 = op2->ui;

exp->type = 2;
exp->string = PrintUInt(op1->ui <= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortSmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
short value2 = op2->s;

exp->type = 2;
exp->string = PrintShort(op1->s <= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortSmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned short value2 = op2->us;

exp->type = 2;
exp->string = PrintUShort(op1->us <= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharSmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
char value2 = op2->c;

exp->type = 2;
exp->string = PrintChar(op1->c <= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharSmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
unsigned char value2 = op2->uc;

exp->type = 2;
exp->string = PrintUChar(op1->uc <= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatSmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
float value2 = op2->f;

exp->type = 2;
exp->string = PrintFloat(op1->f <= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleSmaEqu(struct Expression * exp, struct Operand * op1, struct Operand * op2)
{
double value2 = op2->d;

exp->type = 2;
exp->string = PrintDouble(op1->d <= value2);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int IntCond(struct Expression * exp, struct Operand * op1, struct Operand * op2, struct Operand * op3)
{
exp->type = 2;
exp->string = PrintInt(op1->i ? op2->i : op3->i);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UIntCond(struct Expression * exp, struct Operand * op1, struct Operand * op2, struct Operand * op3)
{
exp->type = 2;
exp->string = PrintUInt(op1->ui ? op2->ui : op3->ui);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int ShortCond(struct Expression * exp, struct Operand * op1, struct Operand * op2, struct Operand * op3)
{
exp->type = 2;
exp->string = PrintShort(op1->s ? op2->s : op3->s);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UShortCond(struct Expression * exp, struct Operand * op1, struct Operand * op2, struct Operand * op3)
{
exp->type = 2;
exp->string = PrintUShort(op1->us ? op2->us : op3->us);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int CharCond(struct Expression * exp, struct Operand * op1, struct Operand * op2, struct Operand * op3)
{
exp->type = 2;
exp->string = PrintChar(op1->c ? op2->c : op3->c);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int UCharCond(struct Expression * exp, struct Operand * op1, struct Operand * op2, struct Operand * op3)
{
exp->type = 2;
exp->string = PrintUChar(op1->uc ? op2->uc : op3->uc);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int FloatCond(struct Expression * exp, struct Operand * op1, struct Operand * op2, struct Operand * op3)
{
exp->type = 2;
exp->string = PrintFloat(op1->f ? op2->f : op3->f);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

static unsigned int DoubleCond(struct Expression * exp, struct Operand * op1, struct Operand * op2, struct Operand * op3)
{
exp->type = 2;
exp->string = PrintDouble(op1->d ? op2->d : op3->d);
if(!exp->expType)
{
exp->expType = op1->type;
if(op1->type)
op1->type->refCount++;
}
return 0x1;
}

struct OpTable intOps = 
{
IntAdd, IntSub, IntMul, IntDiv, IntMod, IntNeg, IntInc, IntDec, IntAsign, IntAddAsign, IntSubAsign, IntMulAsign, IntDivAsign, IntModAsign, IntBitAnd, IntBitOr, IntBitXor, IntLShift, IntRShift, IntBitNot, IntAndAsign, IntOrAsign, IntXorAsign, IntLShiftAsign, IntRShiftAsign, IntNot, IntEqu, IntNqu, IntAnd, IntOr, IntGrt, IntSma, IntGrtEqu, IntSmaEqu, IntCond
};

struct OpTable uintOps = 
{
UIntAdd, UIntSub, UIntMul, UIntDiv, UIntMod, UIntNeg, UIntInc, UIntDec, UIntAsign, UIntAddAsign, UIntSubAsign, UIntMulAsign, UIntDivAsign, UIntModAsign, UIntBitAnd, UIntBitOr, UIntBitXor, UIntLShift, UIntRShift, UIntBitNot, UIntAndAsign, UIntOrAsign, UIntXorAsign, UIntLShiftAsign, UIntRShiftAsign, UIntNot, UIntEqu, UIntNqu, UIntAnd, UIntOr, UIntGrt, UIntSma, UIntGrtEqu, UIntSmaEqu, UIntCond
};

struct OpTable shortOps = 
{
ShortAdd, ShortSub, ShortMul, ShortDiv, ShortMod, ShortNeg, ShortInc, ShortDec, ShortAsign, ShortAddAsign, ShortSubAsign, ShortMulAsign, ShortDivAsign, ShortModAsign, ShortBitAnd, ShortBitOr, ShortBitXor, ShortLShift, ShortRShift, ShortBitNot, ShortAndAsign, ShortOrAsign, ShortXorAsign, ShortLShiftAsign, ShortRShiftAsign, ShortNot, ShortEqu, ShortNqu, ShortAnd, ShortOr, ShortGrt, ShortSma, ShortGrtEqu, ShortSmaEqu, ShortCond
};

struct OpTable ushortOps = 
{
UShortAdd, UShortSub, UShortMul, UShortDiv, UShortMod, UShortNeg, UShortInc, UShortDec, UShortAsign, UShortAddAsign, UShortSubAsign, UShortMulAsign, UShortDivAsign, UShortModAsign, UShortBitAnd, UShortBitOr, UShortBitXor, UShortLShift, UShortRShift, UShortBitNot, UShortAndAsign, UShortOrAsign, UShortXorAsign, UShortLShiftAsign, UShortRShiftAsign, UShortNot, UShortEqu, UShortNqu, UShortAnd, UShortOr, UShortGrt, UShortSma, UShortGrtEqu, UShortSmaEqu, UShortCond
};

struct OpTable floatOps = 
{
FloatAdd, FloatSub, FloatMul, FloatDiv, (((void *)0)), FloatNeg, FloatInc, FloatDec, FloatAsign, FloatAddAsign, FloatSubAsign, FloatMulAsign, FloatDivAsign, (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), FloatEqu, FloatNqu, FloatAnd, FloatOr, FloatGrt, FloatSma, FloatGrtEqu, FloatSmaEqu
};

struct OpTable doubleOps = 
{
DoubleAdd, DoubleSub, DoubleMul, DoubleDiv, (((void *)0)), DoubleNeg, DoubleInc, DoubleDec, DoubleAsign, DoubleAddAsign, DoubleSubAsign, DoubleMulAsign, DoubleDivAsign, (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)), DoubleEqu, DoubleNqu, DoubleAnd, DoubleOr, DoubleGrt, DoubleSma, DoubleGrtEqu, DoubleSmaEqu
};

struct OpTable charOps = 
{
CharAdd, CharSub, CharMul, CharDiv, CharMod, CharNeg, CharInc, CharDec, CharAsign, CharAddAsign, CharSubAsign, CharMulAsign, CharDivAsign, CharModAsign, CharBitAnd, CharBitOr, CharBitXor, CharLShift, CharRShift, CharBitNot, CharAndAsign, CharOrAsign, CharXorAsign, CharLShiftAsign, CharRShiftAsign, CharNot, CharEqu, CharNqu, CharAnd, CharOr, CharGrt, CharSma, CharGrtEqu, CharSmaEqu, CharCond
};

struct OpTable ucharOps = 
{
UCharAdd, UCharSub, UCharMul, UCharDiv, UCharMod, UCharNeg, UCharInc, UCharDec, UCharAsign, UCharAddAsign, UCharSubAsign, UCharMulAsign, UCharDivAsign, UCharModAsign, UCharBitAnd, UCharBitOr, UCharBitXor, UCharLShift, UCharRShift, UCharBitNot, UCharAndAsign, UCharOrAsign, UCharXorAsign, UCharLShiftAsign, UCharRShiftAsign, UCharNot, UCharEqu, UCharNqu, UCharAnd, UCharOr, UCharGrt, UCharSma, UCharGrtEqu, UCharSmaEqu, UCharCond
};

void ReadString(char * output, char * string)
{
int len = strlen(string);
int c, d = 0;
unsigned int quoted = 0x0, escaped = 0x0;

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
default:
output[d++] = '\\';
output[d] = ch;
}
d++;
escaped = 0x0;
}
else
{
if(ch == '\"')
quoted ^= 0x1;
else if(quoted)
{
if(ch == '\\')
escaped = 0x1;
else
output[d++] = ch;
}
}
}
output[d] = '\0';
}

extern double strtod(char * , char * * );

struct Operand GetOperand(struct Expression * exp)
{
struct Operand op = 
{
0, 0, 0, 0, 
{
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
};
struct Type * type = exp->expType;

if(type)
{
while(type->kind == 8 && type->_class->registered && (type->_class->registered->type == 2 || type->_class->registered->type == 3 || type->_class->registered->type == 4))
{
if(!type->_class->registered->dataType)
type->_class->registered->dataType = ProcessTypeString(type->_class->registered->dataTypeString, 0x0);
type = type->_class->registered->dataType;
}
op.kind = type->kind;
op.type = exp->expType;
if(exp->isConstant && exp->type == 2)
{
switch(op.kind)
{
case 1:
{
if(exp->constant[0] == '\'')
op.c = exp->constant[1];
else if(type->isSigned)
{
op.c = (char)strtol(exp->constant, (((void *)0)), 0);
op.ops = charOps;
}
else
{
op.uc = (unsigned char)strtoul(exp->constant, (((void *)0)), 0);
op.ops = ucharOps;
}
break;
}
case 2:
if(type->isSigned)
{
op.s = (short)strtol(exp->constant, (((void *)0)), 0);
op.ops = shortOps;
}
else
{
op.us = (unsigned short)strtoul(exp->constant, (((void *)0)), 0);
op.ops = ushortOps;
}
break;
case 3:
case 5:
if(type->isSigned)
{
op.i = strtol(exp->constant, (((void *)0)), 0);
op.ops = intOps;
}
else
{
op.ui = strtoul(exp->constant, (((void *)0)), 0);
op.ops = uintOps;
}
op.kind = 3;
break;
case 4:
if(type->isSigned)
{
op.i64 = _strtoi64(exp->constant, (((void *)0)), 0);
op.ops = intOps;
}
else
{
op.ui64 = _strtoui64(exp->constant, (((void *)0)), 0);
op.ops = uintOps;
}
op.kind = 3;
break;
case 22:
if(type->isSigned)
{
op.iptr = (intptr_t)_strtoi64(exp->constant, (((void *)0)), 0);
op.ops = intOps;
}
else
{
op.uiptr = (uintptr_t)_strtoui64(exp->constant, (((void *)0)), 0);
op.ops = uintOps;
}
op.kind = 3;
break;
case 6:
op.f = (float)strtod(exp->constant, (((void *)0)));
op.ops = floatOps;
break;
case 7:
op.d = (double)strtod(exp->constant, (((void *)0)));
op.ops = doubleOps;
break;
case 12:
case 13:
case 8:
op.p = (unsigned char *)strtoul(exp->constant, (((void *)0)), 0);
op.kind = 13;
op.ops = uintOps;
break;
}
}
}
return op;
}

int __ecereVMethodID_class_OnGetString;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_int;

static void UnusedFunction()
{
int a;

((char *  (*)(struct __ecereNameSpace__ecere__com__Class *, void *, char *  tempString, void *  fieldData, unsigned int *  needClass))__ecereClass_int->_vTbl[__ecereVMethodID_class_OnGetString])(__ecereClass_int, &a, 0, 0, 0);
}

extern int __ecereVMethodID_class_OnGetString;

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
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0x0);
type = dataMember->dataType;
if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = type->_class->registered;

if(_class->type == 4)
{
struct __ecereNameSpace__ecere__com__Class * enumClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "enum");

if(enumClass)
{
struct __ecereNameSpace__ecere__com__EnumClassData * e = (_class ? ((void *)(((char *)_class->data) + enumClass->offsetClass)) : (((void *)0)));
struct __ecereNameSpace__ecere__sys__NamedLink * item;

for(item = e->values.first; item; item = item->next)
{
if((int)item->data == *(int *)ptr)
{
result = item->name;
break;
}
}
if(result)
{
exp->identifier = MkIdentifier(result);
exp->type = 0;
exp->destType = MkClassType(_class->fullName);
ProcessExpressionType(exp);
}
}
}
if(_class->type == 4 || _class->type == 3 || _class->type == 2)
{
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0x0);
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
exp->constant = PrintFloat(*(float *)ptr);
exp->type = 2;
break;
}
case 7:
{
FreeExpContents(exp);
exp->constant = PrintDouble(*(double *)ptr);
exp->type = 2;
break;
}
case 3:
{
FreeExpContents(exp);
exp->constant = PrintInt(*(int *)ptr);
exp->type = 2;
break;
}
case 4:
{
FreeExpContents(exp);
exp->constant = PrintInt64(*(long long *)ptr);
exp->type = 2;
break;
}
case 22:
{
FreeExpContents(exp);
exp->constant = PrintInt64((long long)*(intptr_t *)ptr);
exp->type = 2;
break;
}
default:
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Unhandled type populating instance\n", (((void *)0))));
}
}
ListAdd(memberList, member);
}
if(parentDataMember->type == 1)
break;
}
}

extern struct MembersInit * MkMembersInitList(struct __ecereNameSpace__ecere__sys__OldList * dataMembers);

void PopulateInstance(struct Instantiation * inst)
{
struct Symbol * classSym = inst->_class->symbol;
struct __ecereNameSpace__ecere__com__Class * _class = classSym->registered;
struct __ecereNameSpace__ecere__com__DataMember * dataMember;
struct __ecereNameSpace__ecere__sys__OldList * memberList = MkList();

inst->members = MkListOne(MkMembersInitList(memberList));
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
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0x0);
type = dataMember->dataType;
if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = type->_class->registered;

if(_class->type == 4)
{
struct __ecereNameSpace__ecere__com__Class * enumClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "enum");

if(enumClass)
{
struct __ecereNameSpace__ecere__com__EnumClassData * e = (_class ? ((void *)(((char *)_class->data) + enumClass->offsetClass)) : (((void *)0)));
struct __ecereNameSpace__ecere__sys__NamedLink * item;

for(item = e->values.first; item; item = item->next)
{
if((int)item->data == *(int *)ptr)
{
result = item->name;
break;
}
}
}
if(result)
{
exp->identifier = MkIdentifier(result);
exp->type = 0;
exp->destType = MkClassType(_class->fullName);
ProcessExpressionType(exp);
}
}
if(_class->type == 4 || _class->type == 3 || _class->type == 2)
{
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0x0);
type = _class->dataType;
}
}
if(!result)
{
switch(type->kind)
{
case 6:
{
exp->constant = PrintFloat(*(float *)ptr);
exp->type = 2;
break;
}
case 7:
{
exp->constant = PrintDouble(*(double *)ptr);
exp->type = 2;
break;
}
case 3:
{
exp->constant = PrintInt(*(int *)ptr);
exp->type = 2;
break;
}
case 4:
{
exp->constant = PrintInt64(*(long long *)ptr);
exp->type = 2;
break;
}
case 22:
{
exp->constant = PrintInt64((long long)*(intptr_t *)ptr);
exp->type = 2;
break;
}
default:
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Unhandled type populating instance\n", (((void *)0))));
}
}
ListAdd(memberList, member);
}
}
}
}

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, unsigned int *  offset, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

extern void FreeInstance(struct Instantiation * inst);

void ComputeInstantiation(struct Expression * exp)
{
struct Instantiation * inst = exp->instance;
struct MembersInit * members;
struct Symbol * classSym = inst->_class ? inst->_class->symbol : (((void *)0));
struct __ecereNameSpace__ecere__com__Class * _class = classSym ? classSym->registered : (((void *)0));
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
inst->data = (unsigned char *)__ecereNameSpace__ecere__com__eInstance_New(_class);
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
if(members->dataMembers)
{
struct MemberInit * member;

for(member = (*members->dataMembers).first; member; member = member->next)
{
struct Identifier * ident = member->identifiers ? (*member->identifiers).first : (((void *)0));
unsigned int found = 0x0;
struct __ecereNameSpace__ecere__com__Property * prop = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (((void *)0));
struct __ecereNameSpace__ecere__com__Method * method = (((void *)0));
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
}
found = 0x1;
}
}
else
{
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, ident->string, privateModule);
if(prop)
{
found = 0x1;
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
found = 0x1;
if(dataMember->memberAccess == 1)
{
curMember = dataMember;
curClass = dataMember->_class;
memcpy(subMemberStack, _subMemberStack, sizeof(int) * _subMemberStackPos);
subMemberStackPos = _subMemberStackPos;
}
}
}
}
if(found && member->initializer && member->initializer->type == 0)
{
struct Expression * value = member->initializer->exp;
struct Type * type = (((void *)0));

if(prop)
{
type = prop->dataType;
}
else if(dataMember)
{
if(!dataMember->dataType)
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0x0);
type = dataMember->dataType;
}
if(ident && ident->next)
{
for(ident = ident->next; ident && type; ident = ident->next)
{
if(type->kind == 8)
{
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(type->_class->registered, ident->string, privateModule);
if(prop)
type = prop->dataType;
else
{
dataMember = __ecereNameSpace__ecere__com__eClass_FindDataMemberAndOffset(type->_class->registered, ident->string, &dataMemberOffset, privateModule, (((void *)0)), (((void *)0)));
if(dataMember)
type = dataMember->dataType;
}
}
else if(type->kind == 9 || type->kind == 10)
{
struct Type * memberType;

for(memberType = type->members.first; memberType; memberType = memberType->next)
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
if(value && (_class->type == 1 || _class->type == 0 || _class->type == 5))
{
if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = type->_class->registered;

if(_class->type == 2 || _class->type == 3 || _class->type == 4)
{
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0x0);
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
struct __ecereNameSpace__ecere__com__Class * _class = type->_class->registered;

if(_class->type == 1)
{
ComputeTypeSize(type);
if(value->instance->data)
memcpy(ptr, value->instance->data, type->size);
}
}
}
}
else if(prop)
{
if(value->type == 1 && value->instance->data)
{
void (* Set)(void *, void *) = (void *)prop->Set;

Set(inst->data, value->instance->data);
PopulateInstance(inst);
}
else if(value->type == 2)
{
switch(type->kind)
{
case 7:
{
void (* Set)(void *, double) = (void *)prop->Set;

Set(inst->data, strtod(value->constant, (((void *)0))));
break;
}
case 6:
{
void (* Set)(void *, float) = (void *)prop->Set;

Set(inst->data, (float)(strtod(value->constant, (((void *)0)))));
break;
}
case 3:
{
void (* Set)(void *, int) = (void *)prop->Set;

Set(inst->data, strtol(value->constant, (((void *)0)), 0));
break;
}
case 4:
{
void (* Set)(void *, long long) = (void *)prop->Set;

Set(inst->data, _strtoi64(value->constant, (((void *)0)), 0));
break;
}
case 22:
{
void (* Set)(void *, intptr_t) = (void *)prop->Set;

Set(inst->data, (intptr_t)_strtoi64(value->constant, (((void *)0)), 0));
break;
}
}
}
else if(value->type == 3)
{
char temp[1024];

ReadString(temp, value->string);
prop->Set(inst->data, temp);
}
}
}
else if(_class->type == 3)
{
if(prop)
{
if(value->type == 2)
{
if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = type->_class->registered;

if(_class->type == 3)
{
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0x0);
type = _class->dataType;
}
}
switch(type->kind)
{
case 6:
{
float fValue;
float (* Set)(float) = (void *)prop->Set;

GetFloat(member->initializer->exp, &fValue);
exp->constant = PrintFloat(Set(fValue));
exp->type = 2;
break;
}
case 7:
{
double dValue;
double (* Set)(double) = (void *)prop->Set;

GetDouble(member->initializer->exp, &dValue);
exp->constant = PrintDouble(Set(dValue));
exp->type = 2;
break;
}
}
}
}
}
else if(_class->type == 2)
{
if(prop)
{
if(value->type == 1 && value->instance->data)
{
unsigned int (* Set)(void *) = (void *)prop->Set;

bits = Set(value->instance->data);
}
else if(value->type == 2)
{
}
}
else if(dataMember)
{
struct __ecereNameSpace__ecere__com__BitMember * bitMember = (struct __ecereNameSpace__ecere__com__BitMember *)dataMember;
struct Type * type;
int part = 0;

GetInt(value, &part);
bits = (bits & ~bitMember->mask);
if(!bitMember->dataType)
bitMember->dataType = ProcessTypeString(bitMember->dataTypeString, 0x0);
type = bitMember->dataType;
if(type->kind == 8 && type->_class && type->_class->registered)
{
if(!type->_class->registered->dataType)
type->_class->registered->dataType = ProcessTypeString(type->_class->registered->dataTypeString, 0x0);
type = type->_class->registered->dataType;
}
switch(type->kind)
{
case 1:
if(type->isSigned)
bits |= ((char)part << bitMember->pos);
else
bits |= ((unsigned char)part << bitMember->pos);
break;
case 2:
if(type->isSigned)
bits |= ((short)part << bitMember->pos);
else
bits |= ((unsigned short)part << bitMember->pos);
break;
case 3:
case 5:
if(type->isSigned)
bits |= (part << bitMember->pos);
else
bits |= ((unsigned int)part << bitMember->pos);
break;
case 4:
if(type->isSigned)
bits |= ((long long)part << bitMember->pos);
else
bits |= ((uint64)part << bitMember->pos);
break;
case 22:
if(type->isSigned)
bits |= ((intptr_t)part << bitMember->pos);
else
bits |= ((uintptr_t)part << bitMember->pos);
break;
}
}
}
}
else
{
if(_class && _class->type == 3)
{
ComputeExpression(member->initializer->exp);
exp->constant = member->initializer->exp->constant;
exp->type = 2;
member->initializer->exp->constant = (((void *)0));
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
exp->constant = PrintHexUInt(bits);
exp->type = 2;
}
if(exp->type != 1)
{
FreeInstance(inst);
}
}

void CallOperator(struct Expression * exp, struct Expression * exp1, struct Expression * exp2, struct Operand * op1, struct Operand * op2)
{
if(exp->op.op == SIZEOF)
{
FreeExpContents(exp);
exp->type = 2;
exp->constant = PrintUInt(ComputeTypeSize(op1->type));
}
else
{
if(!exp->op.exp1)
{
switch(exp->op.op)
{
case '+':
{
struct Expression * exp2 = exp->op.exp2;

exp->op.exp2 = (((void *)0));
FreeExpContents(exp);
FreeType(exp->expType);
FreeType(exp->destType);
*exp = *exp2;
((exp2 ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor(exp2) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(exp2)) : 0), exp2 = 0);
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
switch(exp->op.op)
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
if(exp->op.exp2)
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

extern struct Expression * MkExpIdentifier(struct Identifier * id);

void ComputeExpression(struct Expression * exp)
{
char expString[10240];

expString[0] = '\0';
switch(exp->type)
{
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
0, 0, 0, 0, 
{
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
};
struct Operand op2 = 
{
0, 0, 0, 0, 
{
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
};

if(exp->op.exp2)
ComputeExpression(exp->op.exp2);
if(exp->op.exp1)
{
ComputeExpression(exp->op.exp1);
exp1 = exp->op.exp1;
exp2 = exp->op.exp2;
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
exp1 = exp->op.exp2;
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
case 34:
{
struct Expression * e, * n;

for(e = (*exp->list).first; e; e = n)
{
n = e->next;
if(!n)
{
struct __ecereNameSpace__ecere__sys__OldList * list = exp->list;

ComputeExpression(e);
FreeType(exp->expType);
FreeType(exp->destType);
*exp = *e;
((e ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor(e) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(e)) : 0), e = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(list), list = 0);
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
struct Expression * memberExp = exp->member.exp;
struct Identifier * memberID = exp->member.member;
struct Type * type;

ComputeExpression(exp->member.exp);
type = exp->member.exp->expType;
if(type)
{
struct __ecereNameSpace__ecere__com__Class * _class = (exp->member.member && exp->member.member->classSym) ? exp->member.member->classSym->registered : (((type->kind == 8 || type->kind == 19) && type->_class) ? type->_class->registered : (((void *)0)));
struct __ecereNameSpace__ecere__com__Property * prop = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * member = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * convertTo = (((void *)0));

if(type->kind == 19 && exp->member.exp->type == 26)
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "ecere::com::Class");
if(!_class)
{
char string[256];
struct Symbol * classSym;

string[0] = '\0';
PrintType(type, string, 0x0, 0x1);
classSym = FindClass(string);
_class = classSym ? classSym->registered : (((void *)0));
}
if(exp->member.member)
{
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, exp->member.member->string, privateModule);
if(!prop)
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, exp->member.member->string, privateModule, (((void *)0)), (((void *)0)));
}
if(!prop && !member && _class && exp->member.member)
{
struct Symbol * classSym = FindClass(exp->member.member->string);

convertTo = _class;
_class = classSym ? classSym->registered : (((void *)0));
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
struct __ecereNameSpace__ecere__com__Class * _class = type->_class->registered;

if(_class->type == 3)
{
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0x0);
type = _class->dataType;
}
}
switch(type->kind)
{
case 6:
{
float value;
float (* Get)(float) = (void *)prop->Get;

GetFloat(exp->member.exp, &value);
exp->constant = PrintFloat(Get ? Get(value) : value);
exp->type = 2;
break;
}
case 7:
{
double value;
double (* Get)(double);

GetDouble(exp->member.exp, &value);
if(convertTo)
Get = (void *)prop->Set;
else
Get = (void *)prop->Get;
exp->constant = PrintDouble(Get ? Get(value) : value);
exp->type = 2;
break;
}
}
}
else
{
if(convertTo)
{
struct Expression * value = exp->member.exp;
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
struct __ecereNameSpace__ecere__com__Class * propertyClass = type->_class->registered;

if(propertyClass->type == 1 && value->type == 1)
{
void (* Set)(void *, void *) = (void *)prop->Set;

exp->instance = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);
exp->instance->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
exp->instance->_class = MkSpecifierName(_class->fullName);
exp->instance->loc = exp->loc;
exp->type = 1;
Set(exp->instance->data, value->instance->data);
PopulateInstance(exp->instance);
}
break;
}
case 3:
{
int intValue;
void (* Set)(void *, int) = (void *)prop->Set;

exp->instance = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);
exp->instance->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
exp->instance->_class = MkSpecifierName(_class->fullName);
exp->instance->loc = exp->loc;
exp->type = 1;
GetInt(value, &intValue);
Set(exp->instance->data, intValue);
PopulateInstance(exp->instance);
break;
}
case 4:
{
long long intValue;
void (* Set)(void *, long long) = (void *)prop->Set;

exp->instance = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);
exp->instance->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
exp->instance->_class = MkSpecifierName(_class->fullName);
exp->instance->loc = exp->loc;
exp->type = 1;
GetInt64(value, &intValue);
Set(exp->instance->data, intValue);
PopulateInstance(exp->instance);
break;
}
case 22:
{
intptr_t intValue;
void (* Set)(void *, intptr_t) = (void *)prop->Set;

exp->instance = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);
exp->instance->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
exp->instance->_class = MkSpecifierName(_class->fullName);
exp->instance->loc = exp->loc;
exp->type = 1;
GetIntPtr(value, &intValue);
Set(exp->instance->data, intValue);
PopulateInstance(exp->instance);
break;
}
case 7:
{
double doubleValue;
void (* Set)(void *, double) = (void *)prop->Set;

exp->instance = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);
exp->instance->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
exp->instance->_class = MkSpecifierName(_class->fullName);
exp->instance->loc = exp->loc;
exp->type = 1;
GetDouble(value, &doubleValue);
Set(exp->instance->data, doubleValue);
PopulateInstance(exp->instance);
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
struct __ecereNameSpace__ecere__com__Class * propertyClass = type->_class->registered;

if(propertyClass->type == 1 && value->instance->data)
{
unsigned int (* Set)(void *) = (void *)prop->Set;
unsigned int bits = Set(value->instance->data);

exp->constant = PrintHexUInt(bits);
exp->type = 2;
break;
}
else if(_class->type == 2)
{
unsigned int value;
unsigned int (* Set)(unsigned int) = (void *)prop->Set;
unsigned int bits;

GetUInt(exp->member.exp, &value);
bits = Set(value);
exp->constant = PrintHexUInt(bits);
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

GetUInt(exp->member.exp, &value);
switch(type->kind)
{
case 8:
{
struct __ecereNameSpace__ecere__com__Class * _class = type->_class->registered;

if(_class->type == 1)
{
void (* Get)(unsigned int, void *) = (void *)prop->Get;

exp->instance = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);
exp->instance->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
exp->instance->_class = MkSpecifierName(_class->fullName);
exp->instance->loc = exp->loc;
exp->type = 1;
Get(value, exp->instance->data);
PopulateInstance(exp->instance);
}
else if(_class->type == 2)
{
unsigned int (* Get)(unsigned int) = (void *)prop->Get;
uint64 bits = Get(value);

exp->constant = PrintHexUInt64(bits);
exp->type = 2;
}
break;
}
}
}
else if(_class->type == 1)
{
char * value = (exp->member.exp->type == 1) ? exp->member.exp->instance->data : (((void *)0));

switch(type->kind)
{
case 8:
{
struct __ecereNameSpace__ecere__com__Class * _class = type->_class->registered;

if(_class->type == 1 && value)
{
void (* Get)(void *, void *) = (void *)prop->Get;

exp->instance = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);
exp->instance->data = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(unsigned char) * (_class->structSize));
exp->instance->_class = MkSpecifierName(_class->fullName);
exp->instance->loc = exp->loc;
exp->type = 1;
Get(value, exp->instance->data);
PopulateInstance(exp->instance);
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
exp->isConstant = 0x0;
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
struct Type * type = ProcessType(exp->typeName->qualifiers, exp->typeName->declarator);

FreeExpContents(exp);
exp->constant = PrintUInt(ComputeTypeSize(type));
exp->type = 2;
FreeType(type);
break;
}
case 15:
{
struct Symbol * classSym = exp->_class->symbol;

if(classSym && classSym->registered)
{
if(classSym->registered->fixed)
{
FreeSpecifier(exp->_class);
exp->constant = PrintUInt(classSym->registered->templateClass ? classSym->registered->templateClass->structSize : classSym->registered->structSize);
exp->type = 2;
}
else
{
char className[1024];

strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 0x1);
MangleClassName(className);
FreeExpContents(exp);
exp->type = 9;
exp->member.exp = MkExpIdentifier(MkIdentifier(className));
exp->member.member = MkIdentifier("structSize");
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
if(exp->cast.exp)
ComputeExpression(exp->cast.exp);
e = exp->cast.exp;
}
if(e && exp->expType)
{
type = exp->expType;
if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = type->_class->registered;

if(_class && (_class->type == 3 || _class->type == 2))
{
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0x0);
type = _class->dataType;
}
}
switch(type->kind)
{
case 1:
if(type->isSigned)
{
char value;

GetChar(e, &value);
FreeExpContents(exp);
exp->constant = PrintChar(value);
exp->type = 2;
}
else
{
unsigned char value;

GetUChar(e, &value);
FreeExpContents(exp);
exp->constant = PrintUChar(value);
exp->type = 2;
}
break;
case 2:
if(type->isSigned)
{
short value;

GetShort(e, &value);
FreeExpContents(exp);
exp->constant = PrintShort(value);
exp->type = 2;
}
else
{
unsigned short value;

GetUShort(e, &value);
FreeExpContents(exp);
exp->constant = PrintUShort(value);
exp->type = 2;
}
break;
case 3:
if(type->isSigned)
{
int value;

GetInt(e, &value);
FreeExpContents(exp);
exp->constant = PrintInt(value);
exp->type = 2;
}
else
{
unsigned int value;

GetUInt(e, &value);
FreeExpContents(exp);
exp->constant = PrintUInt(value);
exp->type = 2;
}
break;
case 4:
if(type->isSigned)
{
long long value;

GetInt64(e, &value);
FreeExpContents(exp);
exp->constant = PrintInt64(value);
exp->type = 2;
}
else
{
uint64 value;

GetUInt64(e, &value);
FreeExpContents(exp);
exp->constant = PrintUInt64(value);
exp->type = 2;
}
break;
case 22:
if(type->isSigned)
{
intptr_t value;

GetIntPtr(e, &value);
FreeExpContents(exp);
exp->constant = PrintInt64((long long)value);
exp->type = 2;
}
else
{
uintptr_t value;

GetUIntPtr(e, &value);
FreeExpContents(exp);
exp->constant = PrintUInt64((uint64)value);
exp->type = 2;
}
break;
case 6:
{
float value;

GetFloat(e, &value);
FreeExpContents(exp);
exp->constant = PrintFloat(value);
exp->type = 2;
break;
}
case 7:
{
double value;

GetDouble(e, &value);
FreeExpContents(exp);
exp->constant = PrintDouble(value);
exp->type = 2;
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
0, 0, 0, 0, 
{
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
};
struct Operand op2 = 
{
0, 0, 0, 0, 
{
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
};
struct Operand op3 = 
{
0, 0, 0, 0, 
{
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
};

if(exp->cond.exp)
ComputeExpression((*exp->cond.exp).last);
if(exp->cond.elseExp)
ComputeExpression(exp->cond.elseExp);
if(exp->cond.cond)
ComputeExpression(exp->cond.cond);
op1 = GetOperand(exp->cond.cond);
if(op1.type)
op1.type->refCount++;
op2 = GetOperand((*exp->cond.exp).last);
if(op2.type)
op2.type->refCount++;
op3 = GetOperand(exp->cond.elseExp);
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

void ApplyAnyObjectLogic(struct Expression * e);

extern void CopyTypeInto(struct Type * type, struct Type * src);

static unsigned int CheckExpressionType(struct Expression * exp, struct Type * destType, unsigned int skipUnitBla)
{
unsigned int result = 0x1;

if(destType)
{
struct __ecereNameSpace__ecere__sys__OldList converts = 
{
0, 0, 0, 0, 0
};
struct Conversion * convert;

if(destType->kind == 0)
return 0x0;
if(!MatchTypeExpression(exp, destType, &converts, skipUnitBla))
result = 0x0;
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
newExp->destType = (((void *)0));
if(convert->isGet)
{
exp->type = 8;
exp->addedThis = 0x1;
exp->member.exp = newExp;
FreeType(exp->member.exp->expType);
exp->member.exp->expType = MkClassType(convert->convert->_class->fullName);
exp->member.exp->expType->classObjectType = objectType;
exp->member.member = MkIdentifier(convert->convert->dataTypeString);
exp->member.memberType = 1;
exp->expType = convert->resultType ? convert->resultType : convert->convert->dataType;
exp->needCast = 0x1;
if(exp->expType)
exp->expType->refCount++;
ApplyAnyObjectLogic(exp->member.exp);
}
else
{
{
exp->type = 8;
exp->addedThis = 0x1;
exp->member.exp = newExp;
if(newExp->expType && newExp->expType->kind == 8 && newExp->expType->_class && newExp->expType->_class->registered && newExp->expType->_class->registered->type == 5)
{
newExp->byReference = 0x1;
}
FreeType(exp->member.exp->expType);
exp->member.exp->expType = (((void *)0));
if(convert->convert->dataType)
{
exp->member.exp->expType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
CopyTypeInto(exp->member.exp->expType, convert->convert->dataType);
exp->member.exp->expType->refCount = 1;
exp->member.exp->expType->classObjectType = objectType;
ApplyAnyObjectLogic(exp->member.exp);
}
exp->member.member = MkIdentifier(convert->convert->_class->fullName);
exp->member.memberType = 4;
exp->expType = convert->resultType ? convert->resultType : MkClassType(convert->convert->_class->fullName);
exp->needCast = 0x1;
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
exp->needCast = 0x1;
if(exp->expType)
exp->expType->refCount++;
}
else
{
exp->expType = convert->resultType ? convert->resultType : MkClassType(convert->convert->_class->fullName);
exp->needCast = 0x1;
if(convert->resultType)
convert->resultType->refCount++;
}
}
}
if(exp->isConstant && inCompiler)
ComputeExpression(exp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&converts, FreeConvert);
}
if(!result && exp->expType && converts.count)
{
result = MatchTypes(exp->expType, exp->destType, (((void *)0)), (((void *)0)), (((void *)0)), 0x1, 0x1, 0x0, 0x0);
}
if(!result && exp->expType && exp->destType)
{
if((exp->destType->kind == 8 && exp->expType->kind == 13 && exp->expType->type->kind == 8 && exp->expType->type->_class == exp->destType->_class && exp->destType->_class->registered && exp->destType->_class->registered->type == 1) || (exp->expType->kind == 8 && exp->destType->kind == 13 && exp->destType->type->kind == 8 && exp->destType->type->_class == exp->expType->_class && exp->expType->_class->registered && exp->expType->_class->registered->type == 1))
result = 0x1;
}
}
return result;
}

extern struct Statement * MkCompoundStmt(struct __ecereNameSpace__ecere__sys__OldList * declarations, struct __ecereNameSpace__ecere__sys__OldList * statements);

extern struct Statement * MkExpressionStmt(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern struct Expression * MkExpMember(struct Expression * expression, struct Identifier * member);

void CheckTemplateTypes(struct Expression * exp)
{
if(exp->destType && exp->destType->passAsTemplate && exp->expType && exp->expType->kind != 20 && !exp->expType->passAsTemplate)
{
struct Expression * newExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);
struct Statement * compound;
struct Context * context;

*newExp = *exp;
if(exp->destType)
exp->destType->refCount++;
if(exp->expType)
exp->expType->refCount++;
newExp->prev = (((void *)0));
newExp->next = (((void *)0));
switch(exp->expType->kind)
{
case 7:
if(exp->destType->classObjectType)
{
if(exp->destType)
exp->destType->refCount--;
if(exp->expType)
exp->expType->refCount--;
((newExp ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor(newExp) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(newExp)) : 0), newExp = 0);
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
exp->type = 25;
exp->compound = MkCompoundStmt(MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_union")), (((void *)0)))))), statements);
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("d")), '=', newExp))));
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("i")))));
exp->compound->compound.context = context;
PopContext(context);
}
break;
default:
exp->type = 11;
exp->cast.typeName = MkTypeName(MkListOne(MkSpecifierName("uint64")), (((void *)0)));
exp->cast.exp = MkExpBrackets(MkListOne(newExp));
break;
}
}
else if(exp->expType && exp->expType->passAsTemplate && exp->destType && ((unsigned int)((exp->usage & 0x1) >> 0)) && exp->destType->kind != 20 && !exp->destType->passAsTemplate)
{
struct Expression * newExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);
struct Statement * compound;
struct Context * context;

*newExp = *exp;
if(exp->destType)
exp->destType->refCount++;
if(exp->expType)
exp->expType->refCount++;
newExp->prev = (((void *)0));
newExp->next = (((void *)0));
switch(exp->expType->kind)
{
case 7:
if(exp->destType->classObjectType)
{
if(exp->destType)
exp->destType->refCount--;
if(exp->expType)
exp->expType->refCount--;
((newExp ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor(newExp) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(newExp)) : 0), newExp = 0);
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
exp->type = 25;
exp->compound = MkCompoundStmt(MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_union")), (((void *)0)))))), statements);
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("i")), '=', newExp))));
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("d")))));
exp->compound->compound.context = context;
PopContext(context);
}
break;
case 8:
{
if(exp->expType->_class && exp->expType->_class->registered && exp->expType->_class->registered->type == 1)
{
exp->type = 5;
exp->list = MkListOne(MkExpOp((((void *)0)), '*', MkExpCast(MkTypeName(MkListOne(MkSpecifierName(exp->expType->_class->string)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), newExp)));
ProcessExpressionType((*exp->list).first);
break;
}
else
{
exp->type = 5;
exp->list = MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName(exp->expType->_class->string)), (((void *)0))), newExp));
newExp->needCast = 0x1;
ProcessExpressionType((*exp->list).first);
break;
}
}
default:
{
if(exp->expType->kind == 20)
{
struct Type * type = ProcessTemplateParameterType(exp->expType->templateParameter);

if(type)
{
FreeType(exp->destType);
FreeType(exp->expType);
((newExp ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor(newExp) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(newExp)) : 0), newExp = 0);
break;
}
}
if(newExp->type == 8 && newExp->member.memberType == 3)
{
exp->type = 4;
exp->op.op = '*';
exp->op.exp1 = (((void *)0));
exp->op.exp2 = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpBrackets(MkListOne(MkExpOp((((void *)0)), '&', newExp))));
}
else
{
char typeString[1024];
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

typeString[0] = '\0';
PrintType(exp->expType, typeString, 0x0, 0x0);
decl = SpecDeclFromString(typeString, specs, (((void *)0)));
exp->type = 11;
exp->cast.typeName = MkTypeName(specs, decl);
exp->cast.exp = MkExpBrackets(MkListOne(newExp));
exp->cast.exp->needCast = 0x1;
}
break;
}
}
}
}

extern int strncmp(const char * , const char * , int n);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindPrefix(struct __ecereNameSpace__ecere__sys__BinaryTree * this, char *  key);

static struct Symbol * ScanWithNameSpace(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, char * nameSpace, char * name)
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

static struct Symbol * FindWithNameSpace(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, char * name)
{
int c;
char nameSpace[1024];
char * namePart;
unsigned int gotColon = 0x0;

nameSpace[0] = '\0';
for(c = strlen(name) - 1; c >= 0; c--)
if(name[c] == ':')
{
gotColon = 0x1;
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
nameSpace[c + 1] = (char)0;
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

static void ProcessDeclaration(struct Declaration * decl);

struct Symbol * FindSymbol(char * name, struct Context * startContext, struct Context * endContext, unsigned int isStruct, unsigned int globalNameSpace)
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
if(inCompiler && curExternal && symbol && ctx == globalContext && curExternal->symbol && symbol->id > curExternal->symbol->idCode && symbol->pointerExternal)
{
if(symbol->pointerExternal->type == 0)
{
struct FunctionDefinition * function = symbol->pointerExternal->function;
struct Context * tmpContext = curContext;

curContext = (((void *)0));
symbol->pointerExternal = MkExternalDeclaration(MkDeclaration(CopyList(function->specifiers, CopySpecifier), MkListOne(MkInitDeclarator(CopyDeclarator(function->declarator), (((void *)0))))));
curContext = tmpContext;
symbol->pointerExternal->symbol = symbol;
DeclareType(symbol->type, 0x1, 0x1);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), curExternal->prev, symbol->pointerExternal);
symbol->id = curExternal->symbol->idCode;
}
else if(symbol->pointerExternal->type == 1 && curExternal->symbol->idCode < symbol->pointerExternal->symbol->id)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Move((&*ast), symbol->pointerExternal, curExternal->prev);
symbol->id = curExternal->symbol->idCode;
}
}
return symbol;
}

static void GetTypeSpecs(struct Type * type, struct __ecereNameSpace__ecere__sys__OldList * specs)
{
if(!type->isSigned && type->kind != 22)
ListAdd(specs, MkSpecifier(UNSIGNED));
switch(type->kind)
{
case 8:
{
if(type->_class->registered)
{
if(!type->_class->registered->dataType)
type->_class->registered->dataType = ProcessTypeString(type->_class->registered->dataTypeString, 0x0);
GetTypeSpecs(type->_class->registered->dataType, specs);
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
case 2:
ListAdd(specs, MkSpecifier(SHORT));
break;
case 4:
ListAdd(specs, MkSpecifier(INT64));
break;
case 22:
ListAdd(specs, MkSpecifierName(type->isSigned ? "intptr" : "uintptr"));
break;
case 3:
default:
ListAdd(specs, MkSpecifier(INT));
break;
}
}

extern char *  __ecereNameSpace__ecere__sys__RSearchString(char *  buffer, char *  subStr, int maxLen, unsigned int matchCase, unsigned int matchWord);

static void _PrintType(struct Type * type, char * string, unsigned int printName, unsigned int printFunction, unsigned int fullName)
{
if(type)
{
switch(type->kind)
{
case 8:
if(type->_class && type->_class->string)
{
if(type->classObjectType == 2)
strcat(string, "typed_object");
else if(fullName)
strcat(string, type->_class->string);
else
{
if(type->_class->registered)
strcat(string, type->_class->registered->name);
else
strcat(string, type->_class->string);
}
}
break;
case 13:
{
{
_PrintType(type->type, string, 0x0, printFunction, fullName);
strcat(string, " *");
}
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
case 22:
strcat(string, type->isSigned ? "intptr" : "uintptr");
break;
case 1:
strcat(string, type->isSigned ? "char" : "byte");
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
if(type->enumName)
{
strcat(string, "struct ");
strcat(string, type->enumName);
}
else if(type->typeName)
{
strcat(string, type->typeName);
}
else
{
struct Type * member;

strcat(string, "struct {");
for(member = type->members.first; member; member = member->next)
{
PrintType(member, string, 0x1, fullName);
strcat(string, "; ");
}
strcat(string, "}");
}
break;
case 10:
if(type->enumName)
{
strcat(string, "union ");
strcat(string, type->enumName);
}
else if(type->typeName)
{
strcat(string, type->typeName);
}
else
{
strcat(string, "union ");
strcat(string, "(unnamed)");
}
break;
case 15:
if(type->enumName)
{
strcat(string, "enum ");
strcat(string, type->enumName);
}
else if(type->typeName)
{
strcat(string, type->typeName);
}
else
strcat(string, "enum");
break;
case 11:
{
if(printFunction)
{
if(type->dllExport)
strcat(string, "dllexport ");
PrintType(type->returnType, string, 0x0, fullName);
strcat(string, " ");
}
if(printName)
{
if(type->name)
{
if(fullName)
strcat(string, type->name);
else
{
char * name = __ecereNameSpace__ecere__sys__RSearchString(type->name, "::", strlen(type->name), 0x1, 0x0);

if(name)
name += 2;
else
name = type->name;
strcat(string, name);
}
}
}
if(printFunction)
{
struct Type * param;

strcat(string, "(");
for(param = type->params.first; param; param = param->next)
{
PrintType(param, string, 0x1, fullName);
if(param->next)
strcat(string, ", ");
}
strcat(string, ")");
}
break;
}
case 12:
{
{
char baseType[1024], size[256];
struct Type * arrayType = type;

baseType[0] = '\0';
size[0] = '\0';
while(arrayType->kind == 12)
{
strcat(size, "[");
if(arrayType->enumClass)
strcat(size, arrayType->enumClass->string);
else if(arrayType->arraySizeExp)
PrintExpression(arrayType->arraySizeExp, size);
strcat(size, "]");
arrayType = arrayType->arrayType;
}
_PrintType(arrayType, baseType, printName, printFunction, fullName);
strcat(string, baseType);
strcat(string, size);
}
printName = 0x0;
break;
}
case 14:
strcat(string, "...");
break;
case 16:
_PrintType(type->method->dataType, string, 0x0, printFunction, fullName);
break;
case 19:
strcat(string, "subclass(");
strcat(string, type->_class ? type->_class->string : "int");
strcat(string, ")");
break;
case 20:
strcat(string, type->templateParameter->identifier->string);
break;
case 21:
strcat(string, "thisclass");
break;
case 17:
strcat(string, "__builtin_va_list");
break;
}
if(type->name && printName && type->kind != 11 && (type->kind != 13 || type->type->kind != 11))
{
strcat(string, " ");
strcat(string, type->name);
}
}
}

void PrintType(struct Type * type, char * string, unsigned int printName, unsigned int fullName)
{
struct Type * funcType;

for(funcType = type; funcType && (funcType->kind == 13 || funcType->kind == 12); funcType = funcType->type)
;
if(funcType && funcType->kind == 11 && type != funcType)
{
char typeString[1024];
struct Type * param;

PrintType(funcType->returnType, string, 0x0, fullName);
strcat(string, "(");
_PrintType(type, string, printName, 0x0, fullName);
strcat(string, ")");
strcat(string, "(");
for(param = funcType->params.first; param; param = param->next)
{
PrintType(param, string, 0x1, fullName);
if(param->next)
strcat(string, ", ");
}
strcat(string, ")");
}
else
_PrintType(type, string, printName, 0x1, fullName);
if(type->bitFieldCount)
{
char count[100];

sprintf(count, ":%d", type->bitFieldCount);
strcat(string, count);
}
}

static struct Type * FindMember(struct Type * type, char * string)
{
struct Type * memberType;

for(memberType = type->members.first; memberType; memberType = memberType->next)
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

struct Type * FindMemberAndOffset(struct Type * type, char * string, unsigned int * offset)
{
struct Type * memberType;

for(memberType = type->members.first; memberType; memberType = memberType->next)
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

extern struct __ecereNameSpace__ecere__com__Instance * fileInput;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

struct Expression * ParseExpressionString(char * expression)
{
fileInput = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);
((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))fileInput->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])(fileInput, expression, 1, strlen(expression));
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))fileInput->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(fileInput, 0, 0);
echoOn = 0x0;
parsedExpression = (((void *)0));
resetScanner();
expression_yyparse();
(__ecereNameSpace__ecere__com__eInstance_DecRef(fileInput), fileInput = 0);
return parsedExpression;
}

extern char *  QMkString(char *  source);

static unsigned int ResolveIdWithClass(struct Expression * exp, struct __ecereNameSpace__ecere__com__Class * _class, unsigned int skipIDClassCheck)
{
void * __ecereTemp1;
struct Identifier * id = exp->identifier;
struct __ecereNameSpace__ecere__com__Method * method = (((void *)0));
struct __ecereNameSpace__ecere__com__Property * prop = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * member = (((void *)0));
struct __ecereNameSpace__ecere__com__ClassProperty * classProp = (((void *)0));

if(_class && _class->type == 4)
{
struct __ecereNameSpace__ecere__sys__NamedLink * value = (((void *)0));
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
if(value)
{
char constant[256];

FreeExpContents(exp);
exp->type = 2;
exp->isConstant = 0x1;
if(!strcmp(baseClass->dataTypeString, "int"))
sprintf(constant, "%d", value->data);
else
sprintf(constant, "0x%X", value->data);
exp->constant = __ecereNameSpace__ecere__sys__CopyString(constant);
exp->expType = MkClassType(baseClass->fullName);
break;
}
}
}
if(value)
return 0x1;
}
if((method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, id->string, privateModule)))
{
ProcessMethodType(method);
exp->expType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1)->kind = 16, ((struct Type *)__ecereTemp1)->method = method, ((struct Type *)__ecereTemp1)->methodClass = (skipIDClassCheck || (id && id->_class)) ? _class : (((void *)0)), ((struct Type *)__ecereTemp1));
return 0x1;
}
else if((prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, id->string, privateModule)))
{
if(!prop->dataType)
ProcessPropertyType(prop);
exp->expType = prop->dataType;
if(prop->dataType)
prop->dataType->refCount++;
return 0x1;
}
else if((member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, id->string, privateModule, (((void *)0)), (((void *)0)))))
{
if(!member->dataType)
member->dataType = ProcessTypeString(member->dataTypeString, 0x0);
exp->expType = member->dataType;
if(member->dataType)
member->dataType->refCount++;
return 0x1;
}
else if((classProp = __ecereNameSpace__ecere__com__eClass_FindClassProperty(_class, id->string)))
{
if(!classProp->dataType)
classProp->dataType = ProcessTypeString(classProp->dataTypeString, 0x0);
if(classProp->constant)
{
FreeExpContents(exp);
exp->isConstant = 0x1;
if(classProp->dataType->kind == 13 && classProp->dataType->type->kind == 1)
{
exp->type = 3;
exp->constant = QMkString((char *)classProp->Get(_class));
}
else
{
char constant[256];

exp->type = 2;
sprintf(constant, "%d", classProp->Get(_class));
exp->constant = __ecereNameSpace__ecere__sys__CopyString(constant);
}
}
else
{
}
exp->expType = classProp->dataType;
if(classProp->dataType)
classProp->dataType->refCount++;
return 0x1;
}
return 0x0;
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

extern struct __ecereNameSpace__ecere__com__NameSpace *  globalData;

extern char *  strncpy(char * , const char * , int n);

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
if(c - start)
{
return ScanGlobalData(nameSpace, name + start);
}
return (((void *)0));
}

static int definedExpStackPos;

static void * definedExpStack[512];

void ReplaceExpContents(struct Expression * checkedExp, struct Expression * newExp)
{
struct Expression * prev = checkedExp->prev, * next = checkedExp->next;

FreeExpContents(checkedExp);
FreeType(checkedExp->expType);
FreeType(checkedExp->destType);
*checkedExp = *newExp;
((newExp ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor(newExp) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(newExp)) : 0), newExp = 0);
checkedExp->prev = prev;
checkedExp->next = next;
}

extern struct Expression * MkExpCall(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * arguments);

extern int printf(char * , ...);

void __ecereMethod_Expression_Clear();

void ApplyAnyObjectLogic(struct Expression * e)
{
struct Type * destType = e->destType;

if(destType && (destType->classObjectType == 3))
{
if(e && e->expType)
{
struct Type * type = e->expType;
struct __ecereNameSpace__ecere__com__Class * _class = (((void *)0));

if(type->kind == 8 && type->_class && type->_class->registered)
{
_class = type->_class->registered;
}
else if(type->kind == 19)
{
_class = FindClass("ecere::com::Class")->registered;
}
else
{
char string[1024] = "";
struct Symbol * classSym;

PrintType(type, string, 0x0, 0x1);
classSym = FindClass(string);
if(classSym)
_class = classSym->registered;
}
if((_class && (_class->type == 4 || _class->type == 3 || _class->type == 2 || _class->type == 1000) && strcmp(_class->fullName, "class") && strcmp(_class->fullName, "ecere::com::Class")) || (!e->expType->classObjectType && (((type->kind != 13 && type->kind != 19 && (type->kind != 8 || !type->_class || !type->_class->registered || type->_class->registered->type == 1))) || destType->byReference)))
{
if(!_class || strcmp(_class->fullName, "char *"))
{
struct Expression * checkedExp = e, * newExp;

while(((checkedExp->type == 5 || checkedExp->type == 34 || checkedExp->type == 25) && checkedExp->list) || checkedExp->type == 11)
{
if(checkedExp->type == 5 || checkedExp->type == 34 || checkedExp->type == 25)
{
if(checkedExp->type == 25)
{
checkedExp = (*((struct Statement *)(*checkedExp->compound->compound.statements).last)->expressions).last;
}
else
checkedExp = (*checkedExp->list).last;
}
else if(checkedExp->type == 11)
checkedExp = checkedExp->cast.exp;
}
if(checkedExp && checkedExp->type == 4 && checkedExp->op.op == '*' && !checkedExp->op.exp1)
{
newExp = checkedExp->op.exp2;
checkedExp->op.exp2 = (((void *)0));
FreeExpContents(checkedExp);
if(e->expType && e->expType->passAsTemplate)
{
char size[100];

ComputeTypeSize(e->expType);
sprintf(size, "%d", e->expType->size);
newExp = MkExpBrackets(MkListOne(MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), newExp), '+', MkExpCall(MkExpIdentifier(MkIdentifier("__ENDIAN_PAD")), MkListOne(MkExpConstant(size))))));
}
ReplaceExpContents(checkedExp, newExp);
e->byReference = 0x1;
}
else if(!e->byReference || (_class && _class->type == 5))
{
struct Expression * checkedExp, * newExp;

{
unsigned int hasAddress = e->type == 0 || (e->type == 8 && e->member.memberType == 3) || (e->type == 9 && e->member.memberType == 3) || (e->type == 4 && !e->op.exp1 && e->op.op == '*') || e->type == 6;

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
PrintType(e->expType, typeString, 0x0, 0x1);
decl = SpecDeclFromString(typeString, specs, (((void *)0)));
newExp->destType = ProcessType(specs, decl);
curContext = context;
e->type = 25;
if(curCompound)
{
char name[100];
struct __ecereNameSpace__ecere__sys__OldList * stmts = MkList();

sprintf(name, "__internalValue%03X", internalValueCounter++);
if(!curCompound->compound.declarations)
curCompound->compound.declarations = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*curCompound->compound.declarations), (((void *)0)), MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(name)), (((void *)0))))));
ListAdd(stmts, MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(name)), '=', newExp))));
ListAdd(stmts, MkExpressionStmt(MkListOne(MkExpIdentifier(MkIdentifier(name)))));
e->compound = MkCompoundStmt((((void *)0)), stmts);
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
e->compound->compound.context = context;
PopContext(context);
curContext = context->parent;
}
}
checkedExp = e;
while(((checkedExp->type == 5 || checkedExp->type == 34 || checkedExp->type == 25) && checkedExp->list) || checkedExp->type == 11)
{
if(checkedExp->type == 5 || checkedExp->type == 34 || checkedExp->type == 25)
{
if(checkedExp->type == 25)
{
checkedExp = (*((struct Statement *)(*checkedExp->compound->compound.statements).last)->expressions).last;
}
else
checkedExp = (*checkedExp->list).last;
}
else if(checkedExp->type == 11)
checkedExp = checkedExp->cast.exp;
}
{
struct Expression * operand = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

*operand = *checkedExp;
checkedExp->destType = (((void *)0));
checkedExp->expType = (((void *)0));
__ecereMethod_Expression_Clear(checkedExp);
checkedExp->type = 4;
checkedExp->op.op = '&';
checkedExp->op.exp1 = (((void *)0));
checkedExp->op.exp2 = operand;
}
}
}
}
}
}
{
}
if((!destType || destType->kind == 14 || destType->kind == 0) && e->expType && (e->expType->classObjectType == 3 || e->expType->classObjectType == 2) && (e->expType->byReference || (e->expType->kind == 8 && e->expType->_class && e->expType->_class->registered && (e->expType->_class->registered->type == 2 || e->expType->_class->registered->type == 4 || e->expType->_class->registered->type == 3))))
{
if(e->expType->kind == 8 && e->expType->_class && e->expType->_class->registered && !strcmp(e->expType->_class->registered->name, "class"))
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
e->list = MkListOne(MkExpOp((((void *)0)), '*', MkExpBrackets(MkListOne(thisExp))));
if(thisExp->expType->kind == 8 && thisExp->expType->_class && thisExp->expType->_class->registered && thisExp->expType->_class->registered->type == 5)
((struct Expression *)(*e->list).first)->byReference = 0x1;
{
e->expType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
CopyTypeInto(e->expType, thisExp->expType);
e->expType->byReference = 0x0;
e->expType->refCount = 1;
if(e->expType->kind == 8 && e->expType->_class && e->expType->_class->registered && (e->expType->_class->registered->type == 2 || e->expType->_class->registered->type == 4 || e->expType->_class->registered->type == 3))
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
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Unspecified type\n", (((void *)0))));
}
else if(!(destType->truth && e->expType->kind == 8 && e->expType->_class && e->expType->_class->registered && e->expType->_class->registered->type == 1))
{
unsigned int byReference = e->expType->byReference;
struct Expression * thisExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
char typeString[1024];
struct Type * type;
int backupClassObjectType;

if(e->expType->kind == 8 && e->expType->_class && e->expType->_class->registered && strcmp(e->expType->_class->registered->name, "class"))
type = e->expType;
else
type = destType;
backupClassObjectType = type->classObjectType;
type->classObjectType = 0;
typeString[0] = '\0';
PrintType(type, typeString, 0x0, 0x1);
decl = SpecDeclFromString(typeString, specs, (((void *)0)));
type->classObjectType = backupClassObjectType;
*thisExp = *e;
thisExp->prev = (((void *)0));
thisExp->next = (((void *)0));
__ecereMethod_Expression_Clear(e);
if((type->kind == 8 && type->_class && type->_class->registered && strcmp(type->_class->registered->fullName, "ecere::com::Instance") && (type->_class->registered->type == 1000 || type->_class->registered->type == 2 || type->_class->registered->type == 4 || type->_class->registered->type == 3)) || (type->kind != 13 && type->kind != 12 && type->kind != 8) || (!destType->byReference && byReference && (destType->kind != 13 || type->kind != 13)))
{
e->type = 4;
e->op.op = '*';
e->op.exp1 = (((void *)0));
e->op.exp2 = MkExpCast(MkTypeName(specs, MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), decl)), thisExp);
}
else
{
e->type = 11;
e->cast.typeName = MkTypeName(specs, decl);
e->cast.exp = thisExp;
e->byReference = 0x1;
}
e->expType = type;
e->destType = destType;
type->refCount++;
destType->refCount++;
}
}
}

extern char *  strstr(char * , const char * );

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DefinedExpression;

struct __ecereNameSpace__ecere__com__DefinedExpression
{
struct __ecereNameSpace__ecere__com__DefinedExpression * prev;
struct __ecereNameSpace__ecere__com__DefinedExpression * next;
char *  name;
char *  value;
struct __ecereNameSpace__ecere__com__NameSpace *  nameSpace;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_FindDefine(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_FindFunction(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

extern unsigned int __ecereNameSpace__ecere__sys__UTF8GetChar(char *  string, int *  numBytes);

extern struct Expression * GetTemplateArgExp(struct TemplateParameter * param, struct __ecereNameSpace__ecere__com__Class * curClass, unsigned int pointer);

extern struct Expression * MkExpCondition(struct Expression * cond, struct __ecereNameSpace__ecere__sys__OldList * expressions, struct Expression * elseExp);

extern struct Expression * CopyExpression(struct Expression * exp);

extern struct Expression * MkExpTypeSize(struct TypeName * typeName);

extern struct Expression * MkExpClass(struct __ecereNameSpace__ecere__sys__OldList *  specifiers, struct Declarator * decl);

static void ProcessStatement(struct Statement * stmt);

extern struct Expression * MkExpExtensionInitializer(struct TypeName * typeName, struct Initializer * initializer);

extern struct Initializer * MkInitializerList(struct __ecereNameSpace__ecere__sys__OldList * list);

extern char *  __ecereNameSpace__ecere__com__PrintString(struct __ecereNameSpace__ecere__com__Class * class, void * object, ...);

extern char *  sourceFile;

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear(struct __ecereNameSpace__ecere__sys__OldList * this);

void ProcessExpressionType(struct Expression * exp)
{
void * __ecereTemp2;
void * __ecereTemp1;
unsigned int unresolved = 0x0;
struct Location oldyylloc = yylloc;
unsigned int notByReference = 0x0;

if(!exp || exp->expType)
return ;
yylloc = exp->loc;
switch(exp->type)
{
case 0:
{
struct Identifier * id = exp->identifier;

if(!id)
return ;
if(id->_class && id->_class->name)
{
id->classSym = id->_class->symbol;
}
if(strstr(id->string, "__ecereClass") == id->string)
{
exp->expType = ProcessTypeString("ecere::com::Class", 0x1);
break;
}
else if(id->_class && (id->classSym || (id->_class->name && !strcmp(id->_class->name, "property"))))
{
ReplaceClassMembers(exp, thisClass);
if(exp->type != 0)
{
ProcessExpressionType(exp);
break;
}
if(id->classSym && ResolveIdWithClass(exp, id->classSym->registered, 0x0))
break;
}
else
{
struct Symbol * symbol = FindSymbol(id->string, curContext, topContext, 0x0, id->_class && id->_class->name == (((void *)0)));

if(!symbol)
{
if(exp->destType && CheckExpressionType(exp, exp->destType, 0x0))
break;
else
{
if(thisClass)
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
if(ResolveIdWithClass(exp, currentClass, 0x1))
break;
}
symbol = FindSymbol(id->string, topContext->parent, globalContext, 0x0, id->_class && id->_class->name == (((void *)0)));
}
}
if(symbol)
{
struct Type * type = symbol->type;
struct __ecereNameSpace__ecere__com__Class * _class = (type && type->kind == 8 && type->_class) ? type->_class->registered : (((void *)0));

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
if(type && (type->kind == 15 || (_class && _class->type == 4)))
exp->isConstant = 0x1;
if(symbol->isParam || !strcmp(id->string, "this"))
{
if(_class && _class->type == 1)
exp->byReference = 0x1;
}
if(symbol->isIterator)
{
if(symbol->isIterator == 3)
{
exp->type = 5;
exp->list = MkListOne(MkExpOp((((void *)0)), '*', MkExpIdentifier(exp->identifier)));
((struct Expression *)(*exp->list).first)->op.exp2->expType = exp->expType;
exp->expType = (((void *)0));
ProcessExpressionType(exp);
}
else if(symbol->isIterator != 4)
{
exp->type = 8;
exp->member.exp = MkExpIdentifier(exp->identifier);
exp->member.exp->expType = exp->expType;
exp->member.member = MkIdentifier("data");
exp->expType = (((void *)0));
ProcessExpressionType(exp);
}
}
break;
}
else
{
struct __ecereNameSpace__ecere__com__DefinedExpression * definedExp = (((void *)0));

if(thisNameSpace && !(id->_class && !id->_class->name))
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
int c;

for(c = 0; c < definedExpStackPos; c++)
if(definedExpStack[c] == definedExp)
break;
if(c == definedExpStackPos && c < sizeof definedExpStack / sizeof(void *))
{
struct Location backupYylloc = yylloc;

definedExpStack[definedExpStackPos++] = definedExp;
fileInput = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);
((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))fileInput->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])(fileInput, definedExp->value, 1, strlen(definedExp->value));
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))fileInput->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(fileInput, 0, 0);
echoOn = 0x0;
parsedExpression = (((void *)0));
resetScanner();
expression_yyparse();
(__ecereNameSpace__ecere__com__eInstance_DecRef(fileInput), fileInput = 0);
yylloc = backupYylloc;
if(parsedExpression)
{
FreeIdentifier(id);
exp->type = 5;
exp->list = MkListOne(parsedExpression);
parsedExpression->loc = yylloc;
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
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Recursion in defined expression %s\n", (((void *)0))), id->string);
}
}
}
else
{
struct GlobalData * data = (((void *)0));

if(thisNameSpace && !(id->_class && !id->_class->name))
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
DeclareGlobalData(data);
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

if(thisNameSpace && !(id->_class && !id->_class->name))
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
name[0] = (char)0;
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)function->module + 12)))->importType != 1 && (!function->dataType || !function->dataType->dllExport))
strcpy(name, "__ecereFunction_");
FullClassNameCat(name, id->string, 0x0);
if(DeclareFunction(function, name))
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
unresolved = 0x1;
break;
}
case 1:
{
struct __ecereNameSpace__ecere__com__Class * _class;

if(!exp->instance->_class)
{
if(exp->destType && exp->destType->kind == 8 && exp->destType->_class)
{
exp->instance->_class = MkSpecifierName(exp->destType->_class->string);
}
}
ProcessInstantiationType(exp->instance);
exp->isConstant = exp->instance->isConstant;
if(exp->instance->_class)
{
exp->expType = MkClassType(exp->instance->_class->name);
}
break;
}
case 2:
{
if(!exp->expType)
{
struct Type * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), type->refCount = 1, type->constant = 0x1, type);

exp->expType = type;
if(exp->constant[0] == '\'')
{
if((int)((unsigned char *)exp->constant)[1] > 127)
{
int nb;
unsigned int ch = __ecereNameSpace__ecere__sys__UTF8GetChar(exp->constant + 1, &nb);

if(nb < 2)
ch = exp->constant[1];
(__ecereNameSpace__ecere__com__eSystem_Delete(exp->constant), exp->constant = 0);
exp->constant = PrintUInt(ch);
type->kind = 8;
type->_class = FindClass("unichar");
type->isSigned = 0x0;
}
else
{
type->kind = 1;
type->isSigned = 0x1;
}
}
else if(strchr(exp->constant, '.'))
{
char ch = exp->constant[strlen(exp->constant) - 1];

if(ch == 'f')
type->kind = 6;
else
type->kind = 7;
type->isSigned = 0x1;
}
else
{
if(exp->constant[0] == '0' && exp->constant[1])
type->isSigned = 0x0;
else if(strchr(exp->constant, 'L') || strchr(exp->constant, 'l'))
type->isSigned = 0x0;
else if(strtoll(exp->constant, (((void *)0)), 0) > (((int)0x7fffffff)))
type->isSigned = 0x0;
else
type->isSigned = 0x1;
type->kind = 3;
}
exp->isConstant = 0x1;
}
break;
}
case 3:
{
exp->isConstant = 0x1;
exp->expType = (__ecereTemp2 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp2)->refCount = 1, ((struct Type *)__ecereTemp2)->kind = 13, ((struct Type *)__ecereTemp2)->type = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1)->kind = 1, ((struct Type *)__ecereTemp1)->constant = 0x1, ((struct Type *)__ecereTemp1)), ((struct Type *)__ecereTemp2));
break;
}
case 13:
case 28:
ProcessExpressionType(exp->_new.size);
exp->expType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1)->kind = 13, ((struct Type *)__ecereTemp1)->type = ProcessType(exp->_new.typeName->qualifiers, exp->_new.typeName->declarator), ((struct Type *)__ecereTemp1));
DeclareType(exp->expType->type, 0x0, 0x0);
break;
case 14:
case 29:
ProcessExpressionType(exp->_renew.size);
ProcessExpressionType(exp->_renew.exp);
exp->expType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1)->kind = 13, ((struct Type *)__ecereTemp1)->type = ProcessType(exp->_renew.typeName->qualifiers, exp->_renew.typeName->declarator), ((struct Type *)__ecereTemp1));
DeclareType(exp->expType->type, 0x0, 0x0);
break;
case 4:
{
unsigned int assign = 0x0, boolResult = 0x0, boolOps = 0x0;
struct Type * type1 = (((void *)0)), * type2 = (((void *)0));
unsigned int useDestType = 0x0, useSideType = 0x0;
struct Location oldyylloc = yylloc;
unsigned int useSideUnit = 0x0;
struct Type * dummy = (dummy = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), dummy->count = (unsigned int)1, dummy->refCount = 1, dummy);

switch(exp->op.op)
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
assign = 0x1;
break;
case '!':
break;
case AND_OP:
case OR_OP:
boolOps = 0x1;
boolResult = 0x1;
break;
case EQ_OP:
case '<':
case '>':
case LE_OP:
case GE_OP:
case NE_OP:
boolResult = 0x1;
useSideType = 0x1;
break;
case '+':
case '-':
useSideUnit = 0x1;
case '|':
case '&':
case '^':
case '/':
case '%':
case '*':
if(exp->op.op != '*' || exp->op.exp1)
{
useSideType = 0x1;
useDestType = 0x1;
}
break;
}
if(exp->op.op == '&')
{
if(!exp->op.exp1 && exp->op.exp2 && exp->op.exp2->type == 0 && exp->op.exp2->identifier)
{
struct Identifier * id = exp->op.exp2->identifier;
struct Symbol * symbol = FindSymbol(id->string, curContext, topContext, 0x0, id->_class && id->_class->name == (((void *)0)));

if(symbol && symbol->isIterator == 2)
{
exp->type = 8;
exp->member.exp = exp->op.exp2;
exp->member.member = MkIdentifier("key");
exp->expType = (((void *)0));
exp->op.exp2->expType = symbol->type;
symbol->type->refCount++;
ProcessExpressionType(exp);
FreeType(dummy);
break;
}
}
}
if(exp->op.exp1)
{
if(exp->destType && exp->destType->kind == 8 && exp->destType->_class && exp->destType->_class->registered && useDestType && ((exp->destType->_class->registered->type == 3 && useSideUnit) || exp->destType->_class->registered->type == 4 || exp->destType->_class->registered->type == 2))
{
if(exp->op.exp1->destType)
FreeType(exp->op.exp1->destType);
exp->op.exp1->destType = exp->destType;
if(exp->destType)
exp->destType->refCount++;
}
else if(!assign)
{
if(exp->op.exp1->destType)
FreeType(exp->op.exp1->destType);
exp->op.exp1->destType = dummy;
dummy->refCount++;
}
if(exp->op.exp1->destType && exp->op.op != '=')
exp->op.exp1->destType->count++;
ProcessExpressionType(exp->op.exp1);
if(exp->op.exp1->destType && exp->op.op != '=')
exp->op.exp1->destType->count--;
if(exp->op.exp1->destType == dummy)
{
FreeType(dummy);
exp->op.exp1->destType = (((void *)0));
}
type1 = exp->op.exp1->expType;
}
if(exp->op.exp2)
{
char expString[10240];

expString[0] = '\0';
if(exp->op.exp2->type == 1 && !exp->op.exp2->instance->_class)
{
if(exp->op.exp1)
{
exp->op.exp2->destType = exp->op.exp1->expType;
if(exp->op.exp1->expType)
exp->op.exp1->expType->refCount++;
}
else
{
exp->op.exp2->destType = exp->destType;
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
PrintExpression(exp->op.exp2, expString);
if(type1 && type1->kind == 13)
{
if(exp->op.op == MUL_ASSIGN || exp->op.op == DIV_ASSIGN || exp->op.op == MOD_ASSIGN || exp->op.op == LEFT_ASSIGN || exp->op.op == RIGHT_ASSIGN || exp->op.op == AND_ASSIGN || exp->op.op == OR_ASSIGN)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "operator %s illegal on pointer\n", (((void *)0))), exp->op.op);
else if(exp->op.op == '=')
{
if(exp->op.exp2->destType)
FreeType(exp->op.exp2->destType);
exp->op.exp2->destType = type1;
if(type1)
type1->refCount++;
}
}
else
{
if(exp->op.op == MUL_ASSIGN || exp->op.op == DIV_ASSIGN || exp->op.op == MOD_ASSIGN || exp->op.op == LEFT_ASSIGN || exp->op.op == RIGHT_ASSIGN)
;
else
{
if(exp->op.exp2->destType)
FreeType(exp->op.exp2->destType);
exp->op.exp2->destType = type1;
if(type1)
type1->refCount++;
}
}
if(type1)
type1->refCount++;
exp->expType = type1;
}
else if(exp->destType && exp->destType->kind == 8 && exp->destType->_class && exp->destType->_class->registered && ((exp->destType->_class->registered->type == 3 && useDestType && useSideUnit) || (exp->destType->_class->registered->type == 4 && useDestType)))
{
if(exp->op.exp2->destType)
FreeType(exp->op.exp2->destType);
exp->op.exp2->destType = exp->destType;
if(exp->destType)
exp->destType->refCount++;
}
else
{
if(exp->op.exp2->destType)
FreeType(exp->op.exp2->destType);
exp->op.exp2->destType = dummy;
dummy->refCount++;
}
if(type1 && boolResult && useSideType && type1->kind == 8 && type1->_class && type1->_class->registered && (type1->_class->registered->type == 2 || type1->_class->registered->type == 4))
{
FreeType(exp->op.exp2->destType);
exp->op.exp2->destType = type1;
type1->refCount++;
}
if(exp->op.exp2->destType && exp->op.op != '=')
exp->op.exp2->destType->count++;
ProcessExpressionType(exp->op.exp2);
if(exp->op.exp2->destType && exp->op.op != '=')
exp->op.exp2->destType->count--;
if(assign && type1 && type1->kind == 13 && exp->op.exp2->expType)
{
if(exp->op.exp2->expType->kind == 22 || exp->op.exp2->expType->kind == 4 || exp->op.exp2->expType->kind == 3 || exp->op.exp2->expType->kind == 2 || exp->op.exp2->expType->kind == 1)
{
if(exp->op.op != '=' && type1->type->kind == 0)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "void *: unknown size\n", (((void *)0))));
}
else if(exp->op.exp2->expType->kind == 13 || exp->op.exp2->expType->kind == 12 || exp->op.exp2->expType->kind == 11 || exp->op.exp2->expType->kind == 16 || (type1->type->kind == 0 && exp->op.exp2->expType->kind == 8 && exp->op.exp2->expType->_class->registered && (exp->op.exp2->expType->_class->registered->type == 0 || exp->op.exp2->expType->_class->registered->type == 1 || exp->op.exp2->expType->_class->registered->type == 5)))
{
if(exp->op.op == ADD_ASSIGN)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "cannot add two pointers\n", (((void *)0))));
}
else if((exp->op.exp2->expType->kind == 8 && type1->kind == 13 && type1->type->kind == 8 && type1->type->_class == exp->op.exp2->expType->_class && exp->op.exp2->expType->_class->registered && exp->op.exp2->expType->_class->registered->type == 1))
{
if(exp->op.op == ADD_ASSIGN)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "cannot add two pointers\n", (((void *)0))));
}
else if(inCompiler)
{
char type1String[1024];
char type2String[1024];

type1String[0] = '\0';
type2String[0] = '\0';
PrintType(exp->op.exp2->expType, type1String, 0x0, 0x1);
PrintType(type1, type2String, 0x0, 0x1);
__ecereNameSpace__ecere__sys__ChangeCh(expString, '\n', ' ');
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "incompatible expression %s (%s); expected %s\n", (((void *)0))), expString, type1String, type2String);
}
}
if(exp->op.exp2->destType == dummy)
{
FreeType(dummy);
exp->op.exp2->destType = (((void *)0));
}
type2 = exp->op.exp2->expType;
}
dummy->kind = 0;
if(exp->op.op == SIZEOF)
{
exp->expType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1)->kind = 3, ((struct Type *)__ecereTemp1));
exp->isConstant = 0x1;
}
else if(exp->op.op == '*' && !exp->op.exp1)
{
exp->expType = Dereference(type2);
if(type2 && type2->kind == 8)
notByReference = 0x1;
}
else if(exp->op.op == '&' && !exp->op.exp1)
exp->expType = Reference(type2);
else if(!assign)
{
if(boolOps)
{
if(exp->op.exp1)
{
if(exp->op.exp1->destType)
FreeType(exp->op.exp1->destType);
exp->op.exp1->destType = MkClassType("bool");
exp->op.exp1->destType->truth = 0x1;
if(!exp->op.exp1->expType)
ProcessExpressionType(exp->op.exp1);
else
CheckExpressionType(exp->op.exp1, exp->op.exp1->destType, 0x0);
FreeType(exp->op.exp1->expType);
exp->op.exp1->expType = MkClassType("bool");
exp->op.exp1->expType->truth = 0x1;
}
if(exp->op.exp2)
{
if(exp->op.exp2->destType)
FreeType(exp->op.exp2->destType);
exp->op.exp2->destType = MkClassType("bool");
exp->op.exp2->destType->truth = 0x1;
if(!exp->op.exp2->expType)
ProcessExpressionType(exp->op.exp2);
else
CheckExpressionType(exp->op.exp2, exp->op.exp2->destType, 0x0);
FreeType(exp->op.exp2->expType);
exp->op.exp2->expType = MkClassType("bool");
exp->op.exp2->expType->truth = 0x1;
}
}
else if(exp->op.exp1 && exp->op.exp2 && ((useSideType) || ((!type1 || type1->kind != 8 || !strcmp(type1->_class->string, "String")) && (!type2 || type2->kind != 8 || !strcmp(type2->_class->string, "String")))))
{
if(type1 && type2 && ((type1->kind == 8 && type1->_class && strcmp(type1->_class->string, "String")) == (type2->kind == 8 && type2->_class && strcmp(type2->_class->string, "String"))))
{
if(exp->op.exp2->destType)
FreeType(exp->op.exp2->destType);
exp->op.exp2->destType = type1;
type1->refCount++;
if(exp->op.exp1->destType)
FreeType(exp->op.exp1->destType);
exp->op.exp1->destType = type2;
type2->refCount++;
if(!boolResult && type1->kind == 8 && (!exp->destType || exp->destType->kind != 8) && type1->_class->registered && type1->_class->registered->type == 3 && type2->_class->registered && type2->_class->registered->type == 3 && type1->_class->registered != type2->_class->registered)
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "operating on %s and %s with an untyped result, assuming %s\n", (((void *)0))), type1->_class->string, type2->_class->string, type1->_class->string);
if(type1->kind == 13 && type1->type->kind == 20 && type2->kind != 13)
{
struct Expression * argExp = GetTemplateArgExp(type1->type->templateParameter, thisClass, 0x1);

if(argExp)
{
struct Expression * classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));

exp->op.exp1 = MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), exp->op.exp1)));
ProcessExpressionType(exp->op.exp1);
if(type2->kind != 13)
{
ProcessExpressionType(classExp);
exp->op.exp2 = MkExpBrackets(MkListOne(MkExpOp(exp->op.exp2, '*', MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpConstant("5")), OR_OP, MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpConstant("0"))))), MkListOne(MkExpTypeSize(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))))), MkExpMember(classExp, MkIdentifier("typeSize"))))))));
if(!exp->op.exp2->expType)
type2 = exp->op.exp2->expType = ProcessTypeString("int", 0x0);
ProcessExpressionType(exp->op.exp2);
}
}
}
if(!boolResult && ((type1->kind == 13 || type1->kind == 12 || (type1->kind == 8 && !strcmp(type1->_class->string, "String"))) && (type2->kind == 22 || type2->kind == 4 || type2->kind == 3 || type2->kind == 2 || type2->kind == 1)))
{
if(type1->kind != 8 && type1->type->kind == 0)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "void *: unknown size\n", (((void *)0))));
exp->expType = type1;
if(type1)
type1->refCount++;
}
else if(!boolResult && ((type2->kind == 13 || type2->kind == 12 || (type2->kind == 8 && !strcmp(type2->_class->string, "String"))) && (type1->kind == 22 || type1->kind == 4 || type1->kind == 3 || type1->kind == 2 || type1->kind == 1)))
{
if(type2->kind != 8 && type2->type->kind == 0)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "void *: unknown size\n", (((void *)0))));
exp->expType = type2;
if(type2)
type2->refCount++;
}
else if((type1->kind == 13 && type2->kind != 13 && type2->kind != 12 && type2->kind != 11 && type2->kind != 16 && type2->kind != 8 && type2->kind != 19) || (type2->kind == 13 && type1->kind != 13 && type1->kind != 12 && type1->kind != 11 && type1->kind != 16 && type1->kind != 8 && type1->kind != 19))
{
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "different levels of indirection\n", (((void *)0))));
}
else
{
unsigned int success = 0x0;

if(type1->kind == 13 && type2->kind == 13)
{
if(exp->op.op == '+')
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "cannot add two pointers\n", (((void *)0))));
else if(exp->op.op == '-')
{
if(MatchTypes(type1->type, type2->type, (((void *)0)), (((void *)0)), (((void *)0)), 0x0, 0x0, 0x0, 0x0))
{
exp->expType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->kind = 3, ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
success = 0x1;
if(type1->type->kind == 20)
{
struct Expression * argExp = GetTemplateArgExp(type1->type->templateParameter, thisClass, 0x1);

if(argExp)
{
struct Expression * classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));

ProcessExpressionType(classExp);
exp->type = 5;
exp->list = MkListOne(MkExpOp(MkExpBrackets(MkListOne(MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpBrackets(MkListOne(exp->op.exp1))), exp->op.op, MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpBrackets(MkListOne(exp->op.exp2)))))), '/', MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("noHeadClass"))), OR_OP, MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("normalClass")))))), MkListOne(MkExpTypeSize(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))))), MkExpMember(classExp, MkIdentifier("typeSize")))))));
ProcessExpressionType(((struct Expression *)(*exp->list).first)->op.exp2);
FreeType(dummy);
return ;
}
}
}
}
}
if(!success && exp->op.exp1->type == 2)
{
if(CheckExpressionType(exp->op.exp1, exp->op.exp1->destType, 0x0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->op.exp1->destType;
if(exp->op.exp1->destType)
exp->op.exp1->destType->refCount++;
success = 0x1;
}
else if(CheckExpressionType(exp->op.exp2, exp->op.exp2->destType, 0x0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->op.exp2->destType;
if(exp->op.exp2->destType)
exp->op.exp2->destType->refCount++;
success = 0x1;
}
}
else if(!success)
{
if(CheckExpressionType(exp->op.exp2, exp->op.exp2->destType, 0x0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->op.exp2->destType;
if(exp->op.exp2->destType)
exp->op.exp2->destType->refCount++;
success = 0x1;
}
else if(CheckExpressionType(exp->op.exp1, exp->op.exp1->destType, 0x0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->op.exp1->destType;
if(exp->op.exp1->destType)
exp->op.exp1->destType->refCount++;
success = 0x1;
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
PrintExpression(exp->op.exp1, expString1);
__ecereNameSpace__ecere__sys__ChangeCh(expString1, '\n', ' ');
PrintExpression(exp->op.exp2, expString2);
__ecereNameSpace__ecere__sys__ChangeCh(expString2, '\n', ' ');
PrintType(exp->op.exp1->expType, type1, 0x0, 0x1);
PrintType(exp->op.exp2->expType, type2, 0x0, 0x1);
}
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "incompatible expressions %s (%s) and %s (%s)\n", (((void *)0))), expString1, type1, expString2, type2);
}
}
}
else if(!boolResult && (!useSideUnit) && type2 && type1 && type2->kind == 8 && type1->kind != 8 && type2->_class && type2->_class->registered && type2->_class->registered->type == 3)
{
if(exp->op.exp1->destType)
FreeType(exp->op.exp1->destType);
exp->op.exp1->destType = type2->_class->registered->dataType;
if(type2->_class->registered->dataType)
type2->_class->registered->dataType->refCount++;
CheckExpressionType(exp->op.exp1, exp->op.exp1->destType, 0x0);
exp->expType = type2;
if(type2)
type2->refCount++;
}
else if(!boolResult && (!useSideUnit) && type1 && type2 && type1->kind == 8 && type2->kind != 8 && type1->_class && type1->_class->registered && type1->_class->registered->type == 3)
{
if(exp->op.exp2->destType)
FreeType(exp->op.exp2->destType);
exp->op.exp2->destType = type1->_class->registered->dataType;
if(type1->_class->registered->dataType)
type1->_class->registered->dataType->refCount++;
CheckExpressionType(exp->op.exp2, exp->op.exp2->destType, 0x0);
exp->expType = type1;
if(type1)
type1->refCount++;
}
else if(type1)
{
unsigned int valid = 0x0;

if(!boolResult && useSideUnit && type1 && type1->kind == 8 && type1->_class->registered && type1->_class->registered->type == 3 && type2 && type2->kind != 8)
{
if(exp->op.exp2->destType)
FreeType(exp->op.exp2->destType);
if(!type1->_class->registered->dataType)
type1->_class->registered->dataType = ProcessTypeString(type1->_class->registered->dataTypeString, 0x0);
exp->op.exp2->destType = type1->_class->registered->dataType;
exp->op.exp2->destType->refCount++;
CheckExpressionType(exp->op.exp2, exp->op.exp2->destType, 0x0);
type2 = exp->op.exp2->destType;
exp->expType = type2;
type2->refCount++;
}
if(!boolResult && useSideUnit && type2 && type2->kind == 8 && type2->_class->registered && type2->_class->registered->type == 3 && type1 && type1->kind != 8)
{
if(exp->op.exp1->destType)
FreeType(exp->op.exp1->destType);
if(!type2->_class->registered->dataType)
type2->_class->registered->dataType = ProcessTypeString(type2->_class->registered->dataTypeString, 0x0);
exp->op.exp1->destType = type2->_class->registered->dataType;
exp->op.exp1->destType->refCount++;
CheckExpressionType(exp->op.exp1, exp->op.exp1->destType, 0x0);
type1 = exp->op.exp1->destType;
exp->expType = type1;
type1->refCount++;
}
if(!boolResult || exp->op.op == '>' || exp->op.op == '<')
{
if(type1->kind == 8 && type1->_class && type1->_class->registered && type1->_class->registered->type == 4 && exp->op.exp2->expType)
{
if(CheckExpressionType(exp->op.exp1, exp->op.exp2->expType, 0x0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->op.exp1->expType;
if(exp->op.exp2->expType)
exp->op.exp1->expType->refCount++;
valid = 0x1;
}
}
else if(type2 && (type2->kind == 8 && type2->_class && type2->_class->registered && type2->_class->registered->type == 4 && exp->op.exp1->expType))
{
if(CheckExpressionType(exp->op.exp2, exp->op.exp1->expType, 0x0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->op.exp2->expType;
if(exp->op.exp2->expType)
exp->op.exp2->expType->refCount++;
valid = 0x1;
}
}
}
if(!valid)
{
if(exp->op.exp2->destType)
FreeType(exp->op.exp2->destType);
exp->op.exp2->destType = type1;
type1->refCount++;
if(CheckExpressionType(exp->op.exp2, exp->op.exp2->destType, 0x0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->op.exp2->destType;
if(exp->op.exp2->destType)
exp->op.exp2->destType->refCount++;
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
PrintExpression(exp->op.exp1, expString1);
__ecereNameSpace__ecere__sys__ChangeCh(expString1, '\n', ' ');
PrintExpression(exp->op.exp2, expString2);
__ecereNameSpace__ecere__sys__ChangeCh(expString2, '\n', ' ');
PrintType(exp->op.exp1->expType, type1String, 0x0, 0x1);
PrintType(exp->op.exp2->expType, type2String, 0x0, 0x1);
}
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "incompatible expressions %s (%s) and %s (%s)\n", (((void *)0))), expString1, type1String, expString2, type2String);
if(type1->kind == 8 && type1->_class && type1->_class->registered && type1->_class->registered->type == 4)
{
exp->expType = exp->op.exp1->expType;
if(exp->op.exp1->expType)
exp->op.exp1->expType->refCount++;
}
else if(type2->kind == 8 && type2->_class && type2->_class->registered && type2->_class->registered->type == 4)
{
exp->expType = exp->op.exp2->expType;
if(exp->op.exp2->expType)
exp->op.exp2->expType->refCount++;
}
}
}
}
else if(type2)
{
if(type2->kind == 8 && type2->_class && type2->_class->registered && type2->_class->registered->type == 4)
{
struct Type * oldType = exp->op.exp1->expType;

exp->op.exp1->expType = (((void *)0));
if(CheckExpressionType(exp->op.exp1, exp->op.exp1->destType, 0x0))
FreeType(oldType);
else
exp->op.exp1->expType = oldType;
}
if(exp->op.exp1->destType)
FreeType(exp->op.exp1->destType);
exp->op.exp1->destType = type2;
type2->refCount++;
if(CheckExpressionType(exp->op.exp1, exp->op.exp1->destType, 0x0))
{
if(exp->expType)
FreeType(exp->expType);
exp->expType = exp->op.exp1->destType;
if(exp->op.exp1->destType)
exp->op.exp1->destType->refCount++;
}
}
}
else if(type2 && (!type1 || (type2->kind == 8 && type1->kind != 8)))
{
if(type1 && type2->_class && type2->_class->registered && type2->_class->registered->type == 3)
{
if(exp->op.exp1->destType)
FreeType(exp->op.exp1->destType);
exp->op.exp1->destType = type2->_class->registered->dataType;
if(type2->_class->registered->dataType)
type2->_class->registered->dataType->refCount++;
CheckExpressionType(exp->op.exp1, exp->op.exp1->destType, 0x0);
}
if(exp->op.op == '!')
{
exp->expType = MkClassType("bool");
exp->expType->truth = 0x1;
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
if(type2 && type1->_class && type1->_class->registered && type1->_class->registered->type == 3)
{
if(exp->op.exp2->destType)
FreeType(exp->op.exp2->destType);
exp->op.exp2->destType = type1->_class->registered->dataType;
if(type1->_class->registered->dataType)
type1->_class->registered->dataType->refCount++;
CheckExpressionType(exp->op.exp2, exp->op.exp2->destType, 0x0);
}
exp->expType = type1;
if(type1)
type1->refCount++;
}
}
yylloc = exp->loc;
if(exp->op.exp1 && !exp->op.exp1->expType)
{
char expString[10000];

expString[0] = '\0';
if(inCompiler)
{
PrintExpression(exp->op.exp1, expString);
__ecereNameSpace__ecere__sys__ChangeCh(expString, '\n', ' ');
}
if(expString[0])
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "couldn't determine type of %s\n", (((void *)0))), expString);
}
if(exp->op.exp2 && !exp->op.exp2->expType)
{
char expString[10240];

expString[0] = '\0';
if(inCompiler)
{
PrintExpression(exp->op.exp2, expString);
__ecereNameSpace__ecere__sys__ChangeCh(expString, '\n', ' ');
}
if(expString[0])
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "couldn't determine type of %s\n", (((void *)0))), expString);
}
if(boolResult)
{
FreeType(exp->expType);
exp->expType = MkClassType("bool");
exp->expType->truth = 0x1;
}
if(exp->op.op != SIZEOF)
exp->isConstant = (!exp->op.exp1 || exp->op.exp1->isConstant) && (!exp->op.exp2 || exp->op.exp2->isConstant);
if(exp->op.op == SIZEOF && exp->op.exp2->expType)
{
DeclareType(exp->op.exp2->expType, 0x0, 0x0);
}
yylloc = oldyylloc;
FreeType(dummy);
break;
}
case 5:
case 34:
{
struct Expression * e;

exp->isConstant = 0x1;
for(e = (*exp->list).first; e; e = e->next)
{
unsigned int inced = 0x0;

if(!e->next)
{
FreeType(e->destType);
e->destType = exp->destType;
if(e->destType)
{
exp->destType->refCount++;
e->destType->count++;
inced = 0x1;
}
}
ProcessExpressionType(e);
if(inced)
exp->destType->count--;
if(!exp->expType && !e->next)
{
exp->expType = e->expType;
if(e->expType)
e->expType->refCount++;
}
if(!e->isConstant)
exp->isConstant = 0x0;
}
e = (*exp->list).first;
if(!e->next && e->type == 8)
{
struct Expression * next = exp->next, * prev = exp->prev;

FreeType(exp->expType);
FreeType(exp->destType);
(__ecereNameSpace__ecere__com__eSystem_Delete(exp->list), exp->list = 0);
*exp = *e;
exp->prev = prev;
exp->next = next;
((e ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor(e) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(e)) : 0), e = 0);
ProcessExpressionType(exp);
}
break;
}
case 6:
{
struct Expression * e;

exp->isConstant = 0x1;
ProcessExpressionType(exp->index.exp);
if(!exp->index.exp->isConstant)
exp->isConstant = 0x0;
if(exp->index.exp->expType)
{
struct Type * source = exp->index.exp->expType;

if(source->kind == 8 && source->_class && source->_class->registered && source->_class->registered != containerClass && __ecereNameSpace__ecere__com__eClass_IsDerived(source->_class->registered, containerClass) && source->_class->registered->templateArgs)
{
struct __ecereNameSpace__ecere__com__Class * _class = source->_class->registered;

exp->expType = ProcessTypeString(_class->templateArgs[2].dataTypeString, 0x0);
if(exp->index.index && (*exp->index.index).last)
{
((struct Expression *)(*exp->index.index).last)->destType = ProcessTypeString(_class->templateArgs[1].dataTypeString, 0x0);
}
}
}
for(e = (*exp->index.index).first; e; e = e->next)
{
if(!e->next && exp->index.exp->expType && exp->index.exp->expType->kind == 12 && exp->index.exp->expType->enumClass)
{
if(e->destType)
FreeType(e->destType);
e->destType = MkClassType(exp->index.exp->expType->enumClass->string);
}
ProcessExpressionType(e);
if(!e->next)
{
}
if(!e->isConstant)
exp->isConstant = 0x0;
}
if(!exp->expType)
exp->expType = Dereference(exp->index.exp->expType);
if(exp->expType)
DeclareType(exp->expType, 0x0, 0x0);
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
PrintExpression(exp->call.exp, name);
if(exp->call.exp->expType && !exp->call.exp->expType->returnType)
{
PrintExpression(exp->call.exp, name);
}
}
if(exp->call.exp->type == 0)
{
struct Expression * idExp = exp->call.exp;
struct Identifier * id = idExp->identifier;

if(!strcmp(id->string, "__ENDIAN_PAD"))
{
exp->expType = ProcessTypeString("int", 0x1);
if(exp->call.arguments && (*exp->call.arguments).first)
ProcessExpressionType((*exp->call.arguments).first);
break;
}
else if(!strcmp(id->string, "Max") || !strcmp(id->string, "Min") || !strcmp(id->string, "Sgn") || !strcmp(id->string, "Abs"))
{
struct Expression * a = (((void *)0));
struct Expression * b = (((void *)0));
struct Expression * tempExp1 = (((void *)0)), * tempExp2 = (((void *)0));

if((!strcmp(id->string, "Max") || !strcmp(id->string, "Min")) && (*exp->call.arguments).count == 2)
{
a = (*exp->call.arguments).first;
b = (*exp->call.arguments).last;
tempExp1 = a;
tempExp2 = b;
}
else if((*exp->call.arguments).count == 1)
{
a = (*exp->call.arguments).first;
tempExp1 = a;
}
if(a)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear((&*exp->call.arguments));
idExp->identifier = (((void *)0));
FreeExpContents(exp);
ProcessExpressionType(a);
if(b)
ProcessExpressionType(b);
exp->type = 5;
exp->list = MkList();
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
ListAdd(exp->list, MkExpOp(CopyExpression(tempExp1), '=', a));
}
if(b && !b->isConstant && b->type != 0)
{
sprintf(temp2, "__simpleStruct%d", curContext->simpleID++);
ListAdd(decls, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(temp2)), (((void *)0))));
tempExp2 = QMkExpId(temp2);
tempExp2->expType = b->expType;
if(b->expType)
b->expType->refCount++;
ListAdd(exp->list, MkExpOp(CopyExpression(tempExp2), '=', b));
}
decl = MkDeclaration(specs, decls);
if(!curCompound->compound.declarations)
curCompound->compound.declarations = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*curCompound->compound.declarations), (((void *)0)), decl);
}
}
}
if(!strcmp(id->string, "Max") || !strcmp(id->string, "Min"))
{
int op = (!strcmp(id->string, "Max")) ? '>' : '<';

ListAdd(exp->list, MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(tempExp1), op, CopyExpression(tempExp2)))), MkListOne(CopyExpression(tempExp1)), CopyExpression(tempExp2)));
exp->expType = a->expType;
if(a->expType)
a->expType->refCount++;
}
else if(!strcmp(id->string, "Abs"))
{
ListAdd(exp->list, MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(tempExp1), '<', MkExpConstant("0")))), MkListOne(MkExpOp((((void *)0)), '-', CopyExpression(tempExp1))), CopyExpression(tempExp1)));
exp->expType = a->expType;
if(a->expType)
a->expType->refCount++;
}
else if(!strcmp(id->string, "Sgn"))
{
ListAdd(exp->list, MkExpCondition(MkExpBrackets(MkListOne(MkExpOp((((void *)0)), '!', CopyExpression(tempExp1)))), MkListOne(MkExpConstant("0")), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(tempExp1), '<', MkExpConstant("0")))), MkListOne(MkExpConstant("-1")), MkExpConstant("1"))))));
exp->expType = ProcessTypeString("int", 0x0);
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
struct Type * dummy = (dummy = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), dummy->count = (unsigned int)1, dummy->refCount = 1, dummy);

if(!exp->call.exp->destType)
{
exp->call.exp->destType = dummy;
dummy->refCount++;
}
ProcessExpressionType(exp->call.exp);
if(exp->call.exp->destType == dummy)
{
FreeType(dummy);
exp->call.exp->destType = (((void *)0));
}
FreeType(dummy);
}
functionType = exp->call.exp->expType;
if(functionType && functionType->kind == 16)
{
methodType = functionType;
functionType = methodType->method->dataType;
if(exp->call.exp->expType->usedClass)
{
char typeString[1024];

typeString[0] = '\0';
PrintType(functionType, typeString, 0x1, 0x1);
if(strstr(typeString, "thisclass"))
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;

{
struct Context * context = SetupTemplatesContext(exp->call.exp->expType->usedClass);

decl = SpecDeclFromString(typeString, specs, (((void *)0)));
if(thisClass != (exp->call.exp->expType->usedClass->templateClass ? exp->call.exp->expType->usedClass->templateClass : exp->call.exp->expType->usedClass))
thisClassParams = 0x0;
ReplaceThisClassSpecifiers(specs, exp->call.exp->expType->usedClass);
{
struct __ecereNameSpace__ecere__com__Class * backupThisClass = thisClass;

thisClass = exp->call.exp->expType->usedClass;
ProcessDeclarator(decl);
thisClass = backupThisClass;
}
thisClassParams = 0x1;
functionType = ProcessType(specs, decl);
functionType->refCount = 0;
FinishTemplatesContext(context);
}
FreeList(specs, FreeSpecifier);
FreeDeclarator(decl);
}
}
}
if(functionType && functionType->kind == 13 && functionType->type && functionType->type->kind == 11)
{
struct Type * type = functionType->type;

if(!functionType->refCount)
{
functionType->type = (((void *)0));
FreeType(functionType);
}
functionType = type;
}
if(functionType && functionType->kind != 11)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "called object %s is not a function\n", (((void *)0))), name);
}
else if(functionType)
{
unsigned int emptyParams = 0x0, noParams = 0x0;
struct Expression * e = exp->call.arguments ? (*exp->call.arguments).first : (((void *)0));
struct Type * type = functionType->params.first;
struct Expression * memberExp = (exp->call.exp->type == 8) ? exp->call.exp : (((void *)0));
int extra = 0;
struct Location oldyylloc = yylloc;

if(!type)
emptyParams = 0x1;
if(functionType->extraParam && e)
{
e->destType = MkClassType(functionType->thisClass->string);
e = e->next;
}
if(!functionType->staticMethod)
{
if(memberExp && memberExp->member.exp && memberExp->member.exp->expType && memberExp->member.exp->expType->kind == 19 && memberExp->member.exp->expType->_class)
{
type = MkClassType(memberExp->member.exp->expType->_class->string);
if(e)
{
e->destType = type;
e = e->next;
type = functionType->params.first;
}
else
type->refCount = 0;
}
else if(!memberExp && (functionType->thisClass || (methodType && methodType->methodClass)))
{
type = MkClassType(functionType->thisClass ? functionType->thisClass->string : (methodType ? methodType->methodClass->fullName : (((void *)0))));
if(e)
{
e->destType = type;
e = e->next;
type = functionType->params.first;
}
else
type->refCount = 0;
}
}
if(type && type->kind == 0)
{
noParams = 0x1;
if(!type->refCount)
FreeType(type);
type = (((void *)0));
}
for(; e; e = e->next)
{
if(!type && !emptyParams)
{
yylloc = e->loc;
if(methodType && methodType->methodClass)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "too many arguments for method %s::%s (%d given, expected %d)\n", (((void *)0))), methodType->methodClass->fullName, methodType->method->name, (*exp->call.arguments).count, noParams ? 0 : functionType->params.count);
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "too many arguments for function %s (%d given, expected %d)\n", (((void *)0))), name, (*exp->call.arguments).count, noParams ? 0 : functionType->params.count);
break;
}
if(methodType && type && type->kind == 20 && type->templateParameter->type == 0)
{
struct Type * templatedType = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * _class = methodType->usedClass;
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
if(curParam->type == 0 && !strcmp(type->templateParameter->identifier->string, curParam->name))
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
if(curParam && _class->templateArgs[id].dataTypeString)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument arg = _class->templateArgs[id];

{
struct Context * context = SetupTemplatesContext(_class);

templatedType = ProcessTypeString(arg.dataTypeString, 0x0);
FinishTemplatesContext(context);
}
e->destType = templatedType;
if(templatedType)
{
templatedType->passAsTemplate = 0x1;
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
e->destType = type;
if(type)
type->refCount++;
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
if(methodType && methodType->methodClass)
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "not enough arguments for method %s::%s (%d given, expected %d)\n", (((void *)0))), methodType->methodClass->fullName, methodType->method->name, exp->call.arguments ? (*exp->call.arguments).count : 0, functionType->params.count + extra);
else
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "not enough arguments for function %s (%d given, expected %d)\n", (((void *)0))), name, exp->call.arguments ? (*exp->call.arguments).count : 0, functionType->params.count + extra);
}
yylloc = oldyylloc;
if(type && !type->refCount)
FreeType(type);
}
else
{
functionType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 0, ((struct Type *)__ecereTemp1)->kind = 11, ((struct Type *)__ecereTemp1));
if(exp->call.exp->type == 0)
{
char * string = exp->call.exp->identifier->string;

if(inCompiler)
{
struct Symbol * symbol;
struct Location oldyylloc = yylloc;

yylloc = exp->call.exp->identifier->loc;
if(strstr(string, "__builtin_") == string)
;
else
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "%s undefined; assuming extern returning int\n", (((void *)0))), string);
symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString(string), ((struct Symbol *)__ecereTemp1)->type = ProcessTypeString("int()", 0x1), ((struct Symbol *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol);
if(strstr(symbol->string, "::"))
globalContext->hasNameSpace = 0x1;
yylloc = oldyylloc;
}
}
else if(exp->call.exp->type == 8)
{
}
else
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "callable object undefined; extern assuming returning int\n", (((void *)0))));
if(!functionType->returnType)
{
functionType->returnType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1)->kind = 3, ((struct Type *)__ecereTemp1));
}
}
if(functionType && functionType->kind == 11)
{
exp->expType = functionType->returnType;
if(functionType->returnType)
functionType->returnType->refCount++;
if(!functionType->refCount)
FreeType(functionType);
}
if(exp->call.arguments)
{
for(e = (*exp->call.arguments).first; e; e = e->next)
{
struct Type * destType = e->destType;

ProcessExpressionType(e);
}
}
break;
}
case 8:
{
struct Type * type;
struct Location oldyylloc = yylloc;
unsigned int thisPtr = (exp->member.exp && exp->member.exp->type == 0 && !strcmp(exp->member.exp->identifier->string, "this"));

exp->thisPtr = thisPtr;
if(exp->member.member && exp->member.member->_class && exp->member.member->_class->name)
{
exp->member.member->classSym = exp->member.member->_class->symbol;
}
ProcessExpressionType(exp->member.exp);
if(exp->member.exp->expType && exp->member.exp->expType->kind == 8 && exp->member.exp->expType->_class && exp->member.exp->expType->_class->registered && exp->member.exp->expType->_class->registered->type == 0)
{
exp->isConstant = 0x0;
}
else
exp->isConstant = exp->member.exp->isConstant;
type = exp->member.exp->expType;
yylloc = exp->loc;
if(type && (type->kind == 20))
{
struct __ecereNameSpace__ecere__com__Class * _class = thisClass ? thisClass : currentClass;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param = (((void *)0));

if(_class)
{
for(param = _class->templateParams.first; param; param = param->next)
{
if(param->type == 1 && exp->member.member && exp->member.member->string && !strcmp(param->name, exp->member.member->string))
break;
}
}
if(param && param->defaultArg.member)
{
struct Expression * argExp = GetTemplateArgExpByName(param->name, thisClass, 1);

if(argExp)
{
struct Expression * expMember = exp->member.exp;
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
char thisClassTypeString[1024];

FreeIdentifier(exp->member.member);
ProcessExpressionType(argExp);
{
char * colon = strstr(param->defaultArg.memberString, "::");

if(colon)
{
char className[1024];
struct __ecereNameSpace__ecere__com__Class * sClass;

memcpy(thisClassTypeString, param->defaultArg.memberString, colon - param->defaultArg.memberString);
thisClassTypeString[colon - param->defaultArg.memberString] = '\0';
}
else
strcpy(thisClassTypeString, _class->fullName);
}
decl = SpecDeclFromString(param->defaultArg.member->dataTypeString, specs, (((void *)0)));
exp->expType = ProcessType(specs, decl);
if(exp->expType->kind == 8 && exp->expType->_class && exp->expType->_class->registered && exp->expType->_class->registered->templateClass)
{
struct __ecereNameSpace__ecere__com__Class * expClass = exp->expType->_class->registered;
struct __ecereNameSpace__ecere__com__Class * cClass = (((void *)0));
int c;
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
if(cParam->type == 0 && arg.dataTypeString && !strcmp(cParam->name, arg.dataTypeString))
{
if(_class->templateArgs && arg.dataTypeString && (!param->defaultArg.dataTypeString || strcmp(arg.dataTypeString, param->defaultArg.dataTypeString)))
{
arg.dataTypeString = _class->templateArgs[p].dataTypeString;
arg.dataTypeClass = _class->templateArgs[p].dataTypeClass;
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
struct Declarator * decl = SpecDeclFromString(param->dataTypeString, specs, (((void *)0)));
struct Expression * exp;
char * string = PrintHexUInt64(arg.expression.ui64);

exp = MkExpCast(MkTypeName(specs, decl), MkExpConstant(string));
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
strcat(argument, arg.member->name);
break;
}
case 0:
{
if(arg.dataTypeString && (!param->defaultArg.dataTypeString || strcmp(arg.dataTypeString, param->defaultArg.dataTypeString)))
{
if(!strcmp(arg.dataTypeString, "thisclass"))
strcat(argument, thisClassTypeString);
else
strcat(argument, arg.dataTypeString);
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
exp->expType = ProcessTypeString(templateString, 0x0);
FinishTemplatesContext(context);
}
}
exp->type = 5;
exp->list = MkListOne(MkExpOp((((void *)0)), '*', MkExpCast(MkTypeName(specs, MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), decl)), MkExpBrackets(MkListOne(MkExpOp(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), expMember))), '+', MkExpOp(MkExpMember(MkExpMember(argExp, MkIdentifier("member")), MkIdentifier("offset")), '+', MkExpMember(MkExpMember(MkExpMember(CopyExpression(argExp), MkIdentifier("member")), MkIdentifier("_class")), MkIdentifier("offset")))))))));
}
}
else if(type->templateParameter && type->templateParameter->type == 0 && (type->templateParameter->dataType || type->templateParameter->dataTypeString))
{
type = ProcessTemplateParameterType(type->templateParameter);
}
}
if(type && (type->kind == 20))
;
else if(type && (type->kind == 8 || type->kind == 19 || type->kind == 3 || type->kind == 15))
{
struct Identifier * id = exp->member.member;
int typeKind = type->kind;
struct __ecereNameSpace__ecere__com__Class * _class = (id && (!id->_class || id->_class->name)) ? (id->classSym ? id->classSym->registered : (type->_class ? type->_class->registered : (((void *)0)))) : (((void *)0));

if(typeKind == 19 && exp->member.exp->type == 26)
{
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "ecere::com::Class");
typeKind = 8;
}
if(id && (typeKind == 3 || typeKind == 15))
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "int");
if(_class && id)
{
struct __ecereNameSpace__ecere__com__Property * prop = (((void *)0));
struct __ecereNameSpace__ecere__com__Method * method = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * member = (((void *)0));
struct __ecereNameSpace__ecere__com__Property * revConvert = (((void *)0));
struct __ecereNameSpace__ecere__com__ClassProperty * classProp = (((void *)0));

if(id && id->_class && id->_class->name && !strcmp(id->_class->name, "property"))
exp->member.memberType = 1;
if(id && id->_class && type->_class && !__ecereNameSpace__ecere__com__eClass_IsDerived(type->_class->registered, _class))
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "invalid class specifier %s for object of class %s\n", (((void *)0))), _class->fullName, type->_class->string);
if(typeKind != 19)
{
if((exp->member.memberType == 0 && thisPtr) || exp->member.memberType == 3)
{
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, id->string, privateModule, (((void *)0)), (((void *)0)));
if(member && member->_class != (_class->templateClass ? _class->templateClass : _class) && exp->member.memberType != 3)
{
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, id->string, privateModule);
if(prop)
member = (((void *)0));
}
if(!member && !prop)
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, id->string, privateModule);
if((member && member->_class == (_class->templateClass ? _class->templateClass : _class)) || (prop && prop->_class == (_class->templateClass ? _class->templateClass : _class)))
exp->member.thisPtr = 0x1;
}
else
{
if(!id->classSym)
{
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, id->string, (((void *)0)));
if(!id->_class || !id->_class->name || strcmp(id->_class->name, "property"))
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, id->string, (((void *)0)), (((void *)0)), (((void *)0)));
}
if(!prop && !member)
{
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, id->string, (((void *)0)));
if(!method)
{
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, id->string, privateModule);
if(!id->_class || !id->_class->name || strcmp(id->_class->name, "property"))
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, id->string, privateModule, (((void *)0)), (((void *)0)));
}
}
if(member && prop)
{
if(member->_class != prop->_class && !id->_class && __ecereNameSpace__ecere__com__eClass_IsDerived(member->_class, prop->_class))
prop = (((void *)0));
else
member = (((void *)0));
}
}
}
if(!prop && !member)
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, id->string, privateModule);
if(!prop && !member && !method)
{
if(typeKind == 19)
{
classProp = __ecereNameSpace__ecere__com__eClass_FindClassProperty(type->_class->registered, exp->member.member->string);
if(classProp)
{
exp->member.memberType = 5;
exp->expType = ProcessTypeString(classProp->dataTypeString, 0x0);
}
else
{
char structName[1024];
struct Identifier * id = exp->member.member;
struct Expression * classExp = exp->member.exp;

type->refCount++;
FreeType(classExp->expType);
classExp->expType = ProcessTypeString("ecere::com::Class", 0x0);
strcpy(structName, "__ecereClassData_");
FullClassNameCat(structName, type->_class->string, 0x0);
exp->type = 9;
exp->member.member = id;
exp->member.exp = MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(structName), (((void *)0)))), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpBrackets(MkListOne(MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpMember(classExp, MkIdentifier("data"))), '+', MkExpMember(MkExpClass(MkListOne(MkSpecifierName(type->_class->string)), (((void *)0))), MkIdentifier("offsetClass"))))))));
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
struct __ecereNameSpace__ecere__com__Class * convertClass = classSym->registered;

if(convertClass)
revConvert = __ecereNameSpace__ecere__com__eClass_FindProperty(convertClass, _class->fullName, privateModule);
}
}
}
if(prop)
{
exp->member.memberType = 1;
if(!prop->dataType)
ProcessPropertyType(prop);
exp->expType = prop->dataType;
if(prop->dataType)
prop->dataType->refCount++;
}
else if(member)
{
if(exp->member.exp->expType->classObjectType == 2 && !strcmp(exp->member.member->string, "_class"))
{
FreeExpContents(exp);
exp->type = 0;
exp->identifier = MkIdentifier("class");
ProcessExpressionType(exp);
return ;
}
exp->member.memberType = 3;
DeclareStruct(_class->fullName, 0x0);
if(!member->dataType)
{
struct Context * context = SetupTemplatesContext(_class);

member->dataType = ProcessTypeString(member->dataTypeString, 0x0);
FinishTemplatesContext(context);
}
exp->expType = member->dataType;
if(member->dataType)
member->dataType->refCount++;
}
else if(revConvert)
{
exp->member.memberType = 4;
exp->expType = MkClassType(revConvert->_class->fullName);
}
else if(method)
{
if(inCompiler)
{
exp->member.memberType = 2;
}
if(!method->dataType)
ProcessMethodType(method);
exp->expType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1)->kind = 16, ((struct Type *)__ecereTemp1)->method = method, ((struct Type *)__ecereTemp1));
exp->expType->methodClass = (id && id->_class) ? _class : (((void *)0));
exp->expType->usedClass = _class;
}
else if(!classProp)
{
if(exp->member.exp->expType->classObjectType == 2 && !strcmp(exp->member.member->string, "_class"))
{
FreeExpContents(exp);
exp->type = 0;
exp->identifier = MkIdentifier("class");
ProcessExpressionType(exp);
return ;
}
yylloc = exp->member.member->loc;
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "couldn't find member %s in class %s\n", (((void *)0))), id->string, _class->fullName);
if(inCompiler)
__ecereNameSpace__ecere__com__eClass_AddDataMember(_class, id->string, "int", 0, 0, 1);
}
if(_class && exp->expType)
{
struct __ecereNameSpace__ecere__com__Class * tClass;

tClass = _class;
while(tClass && !tClass->templateClass)
tClass = tClass->base;
if(tClass && exp->expType->kind == 20 && exp->expType->templateParameter->type == 0)
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
if(curParam->type == 0 && !strcmp(exp->expType->templateParameter->identifier->string, curParam->name))
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
if(curParam && tClass->templateArgs[id].dataTypeString)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument arg = tClass->templateArgs[id];
struct Context * context = SetupTemplatesContext(tClass);

FreeType(exp->expType);
exp->expType = ProcessTypeString(arg.dataTypeString, 0x0);
if(exp->expType)
{
if(exp->expType->kind == 21)
{
FreeType(exp->expType);
exp->expType = ReplaceThisClassType(_class);
}
if(tClass->templateClass)
exp->expType->passAsTemplate = 0x1;
if(!exp->destType)
{
exp->destType = ProcessTypeString(arg.dataTypeString, 0x0);
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
else if(tClass && exp->expType->kind == 13 && exp->expType->type && exp->expType->type->kind == 20 && exp->expType->type->templateParameter->type == 0)
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
if(curParam->type == 0 && !strcmp(exp->expType->type->templateParameter->identifier->string, curParam->name))
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

basicType = ProcessTypeString(arg.dataTypeString, 0x0);
if(basicType)
{
if(basicType->kind == 21)
{
FreeType(basicType);
basicType = ReplaceThisClassType(_class);
}
FreeType(exp->expType);
exp->expType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1)->kind = 13, ((struct Type *)__ecereTemp1)->type = basicType, ((struct Type *)__ecereTemp1));
if(!exp->destType)
{
exp->destType = exp->expType;
exp->destType->refCount++;
}
{
struct Expression * newExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;

decl = SpecDeclFromString(arg.dataTypeString, specs, (((void *)0)));
*newExp = *exp;
if(exp->destType)
exp->destType->refCount++;
if(exp->expType)
exp->expType->refCount++;
exp->type = 11;
exp->cast.typeName = MkTypeName(specs, MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), decl));
exp->cast.exp = newExp;
}
}
FinishTemplatesContext(context);
}
}
else if(tClass && exp->expType->kind == 8 && exp->expType->_class && strchr(exp->expType->_class->string, '<'))
{
struct __ecereNameSpace__ecere__com__Class * expClass = exp->expType->_class->registered;

if(expClass)
{
struct __ecereNameSpace__ecere__com__Class * cClass = (((void *)0));
int c;
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
int c;
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
struct Declarator * decl = SpecDeclFromString(param->dataTypeString, specs, (((void *)0)));
struct Expression * exp;
char * string = PrintHexUInt64(arg.expression.ui64);

exp = MkExpCast(MkTypeName(specs, decl), MkExpConstant(string));
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
strcat(argument, arg.member->name);
break;
}
case 0:
{
if(arg.dataTypeString && (!param->defaultArg.dataTypeString || strcmp(arg.dataTypeString, param->defaultArg.dataTypeString)))
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
FreeType(exp->expType);
{
struct Context * context = SetupTemplatesContext(tClass);

exp->expType = ProcessTypeString(templateString, 0x0);
FinishTemplatesContext(context);
}
}
}
}
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "undefined class %s\n", (((void *)0))), (id && (!id->_class || id->_class->name)) ? (id->classSym ? id->classSym->string : (type->_class ? type->_class->string : (((void *)0)))) : "(null)");
}
else if(type && (type->kind == 9 || type->kind == 10))
{
struct Type * memberType = exp->member.member ? FindMember(type, exp->member.member->string) : (((void *)0));

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
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "member operator on non-structure type expression %s\n", (((void *)0))), expString);
}
if(exp->expType && exp->expType->kind == 21 && (!exp->destType || exp->destType->kind != 21))
{
if(type && (type->kind == 8 || type->kind == 19 || type->kind == 3 || type->kind == 15))
{
struct Identifier * id = exp->member.member;
struct __ecereNameSpace__ecere__com__Class * _class = (id && (!id->_class || id->_class->name)) ? (id->classSym ? id->classSym->registered : (type->_class ? type->_class->registered : (((void *)0)))) : (((void *)0));

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

if(exp->member.member && exp->member.member->_class && exp->member.member->_class->name)
{
exp->member.member->classSym = exp->member.member->_class->symbol;
}
exp->member.exp = MkExpBrackets(MkListOne(MkExpOp((((void *)0)), '*', exp->member.exp)));
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
struct Symbol * classSym = exp->_class->symbol;

if(classSym && classSym->registered)
{
if(classSym->registered->type == 5)
{
char name[1024];

name[0] = '\0';
DeclareStruct(classSym->string, 0x0);
FreeSpecifier(exp->_class);
exp->type = 10;
FullClassNameCat(name, classSym->string, 0x0);
exp->typeName = MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(name), (((void *)0)))), (((void *)0)));
}
else
{
if(classSym->registered->fixed)
{
FreeSpecifier(exp->_class);
exp->constant = PrintUInt(classSym->registered->templateClass ? classSym->registered->templateClass->structSize : classSym->registered->structSize);
exp->type = 2;
}
else
{
char className[1024];

strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 0x1);
MangleClassName(className);
DeclareClass(classSym, className);
FreeExpContents(exp);
exp->type = 9;
exp->member.exp = MkExpIdentifier(MkIdentifier(className));
exp->member.member = MkIdentifier("structSize");
}
}
}
exp->expType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1)->kind = 3, ((struct Type *)__ecereTemp1));
break;
}
case 10:
{
struct Type * type = ProcessType(exp->typeName->qualifiers, exp->typeName->declarator);

exp->expType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1)->kind = 3, ((struct Type *)__ecereTemp1));
exp->isConstant = 0x1;
DeclareType(type, 0x0, 0x0);
FreeType(type);
break;
}
case 11:
{
struct Type * type = ProcessType(exp->cast.typeName->qualifiers, exp->cast.typeName->declarator);

type->count = (unsigned int)1;
FreeType(exp->cast.exp->destType);
exp->cast.exp->destType = type;
type->refCount++;
ProcessExpressionType(exp->cast.exp);
type->count = (unsigned int)0;
exp->expType = type;
if(!exp->cast.exp->needCast && !NeedCast(exp->cast.exp->expType, type))
{
void * prev = exp->prev, * next = exp->next;
struct Type * expType = exp->cast.exp->destType;
struct Expression * castExp = exp->cast.exp;
struct Type * destType = exp->destType;

if(expType)
expType->refCount++;
FreeType(exp->expType);
FreeTypeName(exp->cast.typeName);
*exp = *castExp;
FreeType(exp->expType);
FreeType(exp->destType);
exp->expType = expType;
exp->destType = destType;
((castExp ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor(castExp) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(castExp)) : 0), castExp = 0);
exp->prev = prev;
exp->next = next;
}
else
{
exp->isConstant = exp->cast.exp->isConstant;
}
break;
}
case 35:
{
struct Type * type = ProcessType(exp->initializer.typeName->qualifiers, exp->initializer.typeName->declarator);

type->refCount++;
exp->expType = type;
break;
}
case 36:
{
struct Type * type = ProcessType(exp->vaArg.typeName->qualifiers, exp->vaArg.typeName->declarator);

ProcessExpressionType(exp->vaArg.exp);
type->refCount++;
exp->expType = type;
break;
}
case 12:
{
struct Expression * e;

exp->isConstant = 0x1;
FreeType(exp->cond.cond->destType);
exp->cond.cond->destType = MkClassType("bool");
exp->cond.cond->destType->truth = 0x1;
ProcessExpressionType(exp->cond.cond);
if(!exp->cond.cond->isConstant)
exp->isConstant = 0x0;
for(e = (*exp->cond.exp).first; e; e = e->next)
{
if(!e->next)
{
FreeType(e->destType);
e->destType = exp->destType;
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
exp->isConstant = 0x0;
}
FreeType(exp->cond.elseExp->destType);
exp->cond.elseExp->destType = exp->destType ? exp->destType : exp->expType;
if(exp->cond.elseExp->destType)
exp->cond.elseExp->destType->refCount++;
ProcessExpressionType(exp->cond.elseExp);
if(!exp->cond.elseExp->isConstant)
exp->isConstant = 0x0;
break;
}
case 25:
{
if(exp->compound && exp->compound->compound.statements && (*exp->compound->compound.statements).last)
{
struct Statement * last = (*exp->compound->compound.statements).last;

if(last->type == 3 && last->expressions && (*last->expressions).last)
{
((struct Expression *)(*last->expressions).last)->destType = exp->destType;
if(exp->destType)
exp->destType->refCount++;
}
ProcessStatement(exp->compound);
exp->expType = ((struct Expression *)(*last->expressions).last)->expType;
if(((struct Expression *)(*last->expressions).last)->expType)
exp->expType->refCount++;
}
break;
}
case 26:
{
struct Specifier * spec = (*exp->_classExp.specifiers).first;

if(spec && spec->type == 1)
{
exp->expType = MkClassType(spec->name);
exp->expType->kind = 19;
exp->byReference = 0x1;
}
else
{
exp->expType = MkClassType("ecere::com::Class");
exp->byReference = 0x1;
}
break;
}
case 27:
{
struct __ecereNameSpace__ecere__com__Class * _class = thisClass ? thisClass : currentClass;

if(_class)
{
struct Identifier * id = exp->classData.id;
char structName[1024];
struct Expression * classExp;

strcpy(structName, "__ecereClassData_");
FullClassNameCat(structName, _class->fullName, 0x0);
exp->type = 9;
exp->member.member = id;
if(curCompound && FindSymbol("this", curContext, curCompound->compound.context, 0x0, 0x0))
classExp = MkExpMember(MkExpIdentifier(MkIdentifier("this")), MkIdentifier("_class"));
else
classExp = MkExpIdentifier(MkIdentifier("class"));
exp->member.exp = MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(structName), (((void *)0)))), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpBrackets(MkListOne(MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpMember(classExp, MkIdentifier("data"))), '+', MkExpMember(MkExpClass(MkListOne(MkSpecifierName(_class->fullName)), (((void *)0))), MkIdentifier("offsetClass"))))))));
ProcessExpressionType(exp);
return ;
}
break;
}
case 37:
{
struct Type * type = (((void *)0));
char * typeString = (((void *)0));
char typeStringBuf[1024];

if(exp->destType && exp->destType->kind == 8 && exp->destType->_class && exp->destType->_class->registered && exp->destType->_class->registered != containerClass && __ecereNameSpace__ecere__com__eClass_IsDerived(exp->destType->_class->registered, containerClass))
{
struct __ecereNameSpace__ecere__com__Class * templateClass = exp->destType->_class->registered;

typeString = templateClass->templateArgs[2].dataTypeString;
}
else if(exp->list)
{
struct Expression * e;

for(e = (*exp->list).first; e; e = e->next)
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
if(!MatchTypeExpression(e, type, (((void *)0)), 0x0))
{
FreeType(type);
type = e->expType;
e->expType = (((void *)0));
e = (*exp->list).first;
ProcessExpressionType(e);
if(e->expType)
{
if(!MatchTypeExpression(e, type, (((void *)0)), 0x0))
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
PrintType(type, typeStringBuf, 0x0, 0x1);
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
if(exp->list)
{
struct Expression * e;

type = ProcessTypeString(typeString, 0x0);
while(e = (*exp->list).first)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*exp->list), e);
e->destType = type;
type->refCount++;
ProcessExpressionType(e);
ListAdd(initializers, MkInitializerAssignment(e));
}
FreeType(type);
(__ecereNameSpace__ecere__com__eSystem_Delete(exp->list), exp->list = 0);
}
DeclareStruct("ecere::com::BuiltInContainer", 0x0);
ListAdd(structInitializers, MkInitializerAssignment(MkExpMember(MkExpClass(MkListOne(MkSpecifierName("BuiltInContainer")), (((void *)0))), MkIdentifier("_vTbl"))));
ProcessExpressionType(((struct Initializer *)(*structInitializers).last)->exp);
ListAdd(structInitializers, MkInitializerAssignment(MkExpClass(MkListOne(MkSpecifierName("BuiltInContainer")), (((void *)0)))));
ProcessExpressionType(((struct Initializer *)(*structInitializers).last)->exp);
ListAdd(structInitializers, MkInitializerAssignment(MkExpConstant("0")));
ProcessExpressionType(((struct Initializer *)(*structInitializers).last)->exp);
ListAdd(structInitializers, MkInitializerAssignment(MkExpExtensionInitializer(MkTypeName(specs, MkDeclaratorArray(decl, (((void *)0)))), MkInitializerList(initializers))));
ProcessExpressionType(((struct Initializer *)(*structInitializers).last)->exp);
ListAdd(structInitializers, MkInitializerAssignment((__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 2, ((struct Expression *)__ecereTemp1)->constant = __ecereNameSpace__ecere__com__PrintString(__ecereClass_int, &(*initializers).count, 0), ((struct Expression *)__ecereTemp1))));
ProcessExpressionType(((struct Initializer *)(*structInitializers).last)->exp);
ListAdd(structInitializers, MkInitializerAssignment(MkExpClass(CopyList(specs, CopySpecifier), CopyDeclarator(decl))));
ProcessExpressionType(((struct Initializer *)(*structInitializers).last)->exp);
exp->expType = ProcessTypeString(templateString, 0x0);
exp->type = 5;
exp->list = MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName(templateString)), (((void *)0))), MkExpOp((((void *)0)), '&', expExt = MkExpExtensionInitializer(MkTypeName(MkListOne(MkSpecifierName("BuiltInContainer")), (((void *)0))), MkInitializerList(structInitializers)))));
ProcessExpressionType(expExt);
}
else
{
exp->expType = ProcessTypeString("Container", 0x0);
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Couldn't determine type of array elements\n", (((void *)0))));
}
break;
}
}
if(exp->expType && exp->expType->kind == 21 && thisClass && (!exp->destType || exp->destType->kind != 21))
{
FreeType(exp->expType);
exp->expType = ReplaceThisClassType(thisClass);
}
if(exp->expType && (exp->expType->kind == 9 || exp->expType->kind == 10 || exp->expType->kind == 15) && !exp->expType->members.first && exp->expType->enumName)
{
struct Symbol * symbol = FindSymbol(exp->expType->enumName, curContext, globalContext, 0x1, 0x0);

if(symbol)
{
if(exp->expType->kind != 15)
{
struct Type * member;
char * enumName = __ecereNameSpace__ecere__sys__CopyString(exp->expType->enumName);

FreeType(exp->expType);
exp->expType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
exp->expType->kind = symbol->type->kind;
exp->expType->refCount++;
exp->expType->enumName = enumName;
exp->expType->members = symbol->type->members;
for(member = symbol->type->members.first; member; member = member->next)
member->refCount++;
}
else
{
struct __ecereNameSpace__ecere__sys__NamedLink * member;

for(member = symbol->type->members.first; member; member = member->next)
{
struct __ecereNameSpace__ecere__sys__NamedLink * value = (value = __ecereNameSpace__ecere__com__eSystem_New0(16), value->name = __ecereNameSpace__ecere__sys__CopyString(member->name), value);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&exp->expType->members, value);
}
}
}
}
yylloc = exp->loc;
if(exp->destType && (exp->destType->kind == 0 || exp->destType->kind == 18))
;
else if(exp->destType && !exp->destType->keepCast)
{
if(!CheckExpressionType(exp, exp->destType, 0x0))
{
if(!exp->destType->count || unresolved)
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
PrintType(exp->destType, type2, 0x0, 0x1);
if(inCompiler)
{
PrintExpression(exp, expString);
__ecereNameSpace__ecere__sys__ChangeCh(expString, '\n', ' ');
}
if(unresolved)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "unresolved identifier %s; expected %s\n", (((void *)0))), expString, type2);
else if(exp->type != 16)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "couldn't determine type of %s; expected %s\n", (((void *)0))), expString, type2);
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
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "unresolved identifier %s\n", (((void *)0))), expString);
else if(exp->type != 16)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "couldn't determine type of %s\n", (((void *)0))), expString);
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
PrintType(exp->expType, type1, 0x0, 0x1);
PrintType(exp->destType, type2, 0x0, 0x1);
}
if(exp->destType->truth && exp->destType->_class && exp->destType->_class->registered && !strcmp(exp->destType->_class->registered->name, "bool") && exp->expType->kind != 0 && exp->expType->kind != 9 && exp->expType->kind != 10 && (exp->expType->kind != 8 || exp->expType->classObjectType || (exp->expType->_class && exp->expType->_class->registered && exp->expType->_class->registered->type != 1)))
;
else
{
char expString[10240];

expString[0] = '\0';
if(inCompiler)
{
PrintExpression(exp, expString);
__ecereNameSpace__ecere__sys__ChangeCh(expString, '\n', ' ');
}
if(!sourceFile || (strcmp(sourceFile, "src\\lexer.ec") && strcmp(sourceFile, "src/lexer.ec") && strcmp(sourceFile, "src\\grammar.ec") && strcmp(sourceFile, "src/grammar.ec")))
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "incompatible expression %s (%s); expected %s\n", (((void *)0))), expString, type1, type2);
FreeType(exp->expType);
exp->destType->refCount++;
exp->expType = exp->destType;
}
}
}
}
else if(exp->destType && exp->destType->kind == 14 && exp->expType && exp->expType->passAsTemplate)
{
struct Expression * newExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);
char typeString[1024];
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;

typeString[0] = '\0';
*newExp = *exp;
if(exp->expType)
exp->expType->refCount++;
if(exp->expType)
exp->expType->refCount++;
exp->type = 11;
newExp->destType = exp->expType;
PrintType(exp->expType, typeString, 0x0, 0x0);
decl = SpecDeclFromString(typeString, specs, (((void *)0)));
exp->cast.typeName = MkTypeName(specs, decl);
exp->cast.exp = newExp;
}
}
else if(unresolved)
{
if(exp->identifier->_class && exp->identifier->_class->name)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "unresolved identifier %s::%s\n", (((void *)0))), exp->identifier->_class->name, exp->identifier->string);
else if(exp->identifier->string && exp->identifier->string[0])
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "unresolved identifier %s\n", (((void *)0))), exp->identifier->string);
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
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "couldn't determine type of %s\n", (((void *)0))), expString);
}
ApplyAnyObjectLogic(exp);
if(!notByReference && exp->expType && exp->expType->kind == 8 && exp->expType->_class && exp->expType->_class->registered && exp->expType->_class->registered->type == 5)
{
exp->byReference = 0x1;
}
yylloc = oldyylloc;
}

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

static void ProcessInitializer(struct Initializer * init, struct Type * type)
{
switch(init->type)
{
case 0:
if(!init->exp || init->exp->type != 1 || !init->exp->instance || init->exp->instance->_class || !type || type->kind == 8)
{
if(init->exp && !init->exp->destType)
{
FreeType(init->exp->destType);
init->exp->destType = type;
if(type)
type->refCount++;
}
if(init->exp)
{
ProcessExpressionType(init->exp);
init->isConstant = init->exp->isConstant;
}
break;
}
else
{
struct Expression * exp = init->exp;
struct Instantiation * inst = exp->instance;
struct MembersInit * members;

init->type = 1;
init->list = MkList();
if(inst->members)
{
for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0)
{
struct MemberInit * member;

for(member = (*members->dataMembers).first; member; member = member->next)
{
ListAdd(init->list, member->initializer);
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
initializerType = type->members.first;
for(i = (*init->list).first; i; i = i->next)
{
if(type && type->kind == 8 && type->_class && type->_class->registered)
{
FindNextDataMember(type->_class->registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
if(curMember)
{
if(!curMember->dataType)
curMember->dataType = ProcessTypeString(curMember->dataTypeString, 0x0);
initializerType = curMember->dataType;
}
}
ProcessInitializer(i, initializerType);
if(initializerType && type && (type->kind == 9 || type->kind == 10))
initializerType = initializerType->next;
if(!i->isConstant)
init->isConstant = 0x0;
}
if(type && type->kind == 12)
FreeType(initializerType);
if(type && type->kind != 12 && type->kind != 9 && type->kind != 10 && (type->kind != 8 || !type->_class->registered || type->_class->registered->type != 1))
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Assigning list initializer to non list\n", (((void *)0))));
}
break;
}
}
}

extern struct Symbol * FindType(struct Context * ctx, char *  name);

static void ProcessClass(struct __ecereNameSpace__ecere__sys__OldList * definitions, struct Symbol * symbol);

static void ProcessSpecifier(struct Specifier * spec, unsigned int declareStruct)
{
switch(spec->type)
{
case 0:
{
if(spec->specifier == THISCLASS)
{
if(thisClass)
{
spec->type = 1;
spec->name = ReplaceThisClass(thisClass);
spec->symbol = FindClass(spec->name);
ProcessSpecifier(spec, declareStruct);
}
}
break;
}
case 1:
{
struct Symbol * symbol = FindType(curContext, spec->name);

if(symbol)
DeclareType(symbol->type, 0x1, 0x1);
else if((symbol = spec->symbol) && symbol->registered && symbol->registered->type == 1 && declareStruct)
DeclareStruct(spec->name, 0x0);
break;
}
case 2:
{
struct Enumerator * e;

if(spec->list)
{
for(e = (*spec->list).first; e; e = e->next)
{
if(e->exp)
ProcessExpressionType(e->exp);
}
}
break;
}
case 3:
case 4:
{
if(spec->definitions)
{
struct ClassDef * def;
struct Symbol * symbol = spec->id ? FindClass(spec->id->string) : (((void *)0));

ProcessClass(spec->definitions, symbol);
}
break;
}
}
}

static void ProcessDeclarator(struct Declarator * decl)
{
switch(decl->type)
{
case 1:
if(decl->identifier->classSym)
{
FreeSpecifier(decl->identifier->_class);
decl->identifier->_class = (((void *)0));
}
break;
case 3:
if(decl->array.exp)
ProcessExpressionType(decl->array.exp);
case 0:
case 2:
case 4:
case 5:
case 6:
case 7:
if(decl->declarator)
ProcessDeclarator(decl->declarator);
if(decl->type == 4)
{
struct Identifier * id = GetDeclId(decl);

if(id && id->_class)
{
struct TypeName * param = (param = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TypeName), param->qualifiers = MkListOne(id->_class), param->declarator = (((void *)0)), param);

if(!decl->function.parameters)
decl->function.parameters = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*decl->function.parameters), (((void *)0)), param);
id->_class = (((void *)0));
}
if(decl->function.parameters)
{
struct TypeName * param;

for(param = (*decl->function.parameters).first; param; param = param->next)
{
if(param->qualifiers && (*param->qualifiers).first)
{
struct Specifier * spec = (*param->qualifiers).first;

if(spec && spec->specifier == TYPED_OBJECT)
{
struct Declarator * d = param->declarator;
struct TypeName * newParam = (newParam = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TypeName), newParam->qualifiers = MkListOne(MkSpecifier(VOID)), newParam->declarator = MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), d), newParam);

FreeList(param->qualifiers, FreeSpecifier);
param->qualifiers = MkListOne(MkStructOrUnion(3, MkIdentifier("__ecereNameSpace__ecere__com__Class"), (((void *)0))));
param->declarator = MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(MkIdentifier("class")));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*decl->function.parameters), param, newParam);
param = newParam;
}
else if(spec && spec->specifier == ANY_OBJECT)
{
struct Declarator * d = param->declarator;

FreeList(param->qualifiers, FreeSpecifier);
param->qualifiers = MkListOne(MkSpecifier(VOID));
param->declarator = MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), d);
}
else if(spec->specifier == THISCLASS)
{
if(thisClass)
{
spec->type = 1;
spec->name = ReplaceThisClass(thisClass);
spec->symbol = FindClass(spec->name);
ProcessSpecifier(spec, 0x0);
}
}
}
if(param->declarator)
ProcessDeclarator(param->declarator);
}
}
}
break;
}
}

extern struct Identifier * CopyIdentifier(struct Identifier * id);

extern void FreeInitDeclarator(struct InitDeclarator * decl);

static void ProcessDeclaration(struct Declaration * decl)
{
yylloc = decl->loc;
switch(decl->type)
{
case 1:
{
unsigned int declareStruct = 0x0;

if(decl->declarators)
{
struct InitDeclarator * d;

for(d = (*decl->declarators).first; d; d = d->next)
{
struct Type * type, * subType;

ProcessDeclarator(d->declarator);
type = ProcessType(decl->specifiers, d->declarator);
if(d->initializer)
{
ProcessInitializer(d->initializer, type);
if((*decl->declarators).count == 1 && d->initializer->type == 0 && d->initializer->exp->type == 1)
{
if(type->kind == 8 && type->_class == d->initializer->exp->expType->_class)
{
struct Instantiation * inst = d->initializer->exp->instance;

inst->exp = MkExpIdentifier(CopyIdentifier(GetDeclId(d->declarator)));
d->initializer->exp->instance = (((void *)0));
if(decl->specifiers)
FreeList(decl->specifiers, FreeSpecifier);
FreeList(decl->declarators, FreeInitDeclarator);
d = (((void *)0));
decl->type = 2;
decl->inst = inst;
}
}
}
for(subType = type; subType; )
{
if(subType->kind == 8)
{
declareStruct = 0x1;
break;
}
else if(subType->kind == 13)
break;
else if(subType->kind == 12)
subType = subType->arrayType;
else
break;
}
FreeType(type);
if(!d)
break;
}
}
if(decl->specifiers)
{
struct Specifier * s;

for(s = (*decl->specifiers).first; s; s = s->next)
{
ProcessSpecifier(s, declareStruct);
}
}
break;
}
case 2:
{
ProcessInstantiationType(decl->inst);
break;
}
case 0:
{
struct Specifier * spec;
struct Declarator * d;
unsigned int declareStruct = 0x0;

if(decl->declarators)
{
for(d = (*decl->declarators).first; d; d = d->next)
{
struct Type * type = ProcessType(decl->specifiers, d->declarator);
struct Type * subType;

ProcessDeclarator(d);
for(subType = type; subType; )
{
if(subType->kind == 8)
{
declareStruct = 0x1;
break;
}
else if(subType->kind == 13)
break;
else if(subType->kind == 12)
subType = subType->arrayType;
else
break;
}
FreeType(type);
}
}
if(decl->specifiers)
{
for(spec = (*decl->specifiers).first; spec; spec = spec->next)
ProcessSpecifier(spec, declareStruct);
}
break;
}
}
}

static struct FunctionDefinition * curFunction;

static void CreateFireWatcher(struct __ecereNameSpace__ecere__com__Property * prop, struct Expression * object, struct Statement * stmt)
{
char propName[1024], propNameM[1024];
char getName[1024], setName[1024];
struct __ecereNameSpace__ecere__sys__OldList * args;

DeclareProperty(prop, setName, getName);
strcpy(propName, "__ecereProp_");
FullClassNameCat(propName, prop->_class->fullName, 0x0);
strcat(propName, "_");
FullClassNameCat(propName, prop->name, 0x1);
MangleClassName(propName);
strcpy(propNameM, "__ecerePropM_");
FullClassNameCat(propNameM, prop->_class->fullName, 0x0);
strcat(propNameM, "_");
FullClassNameCat(propNameM, prop->name, 0x1);
MangleClassName(propNameM);
if(prop->isWatchable)
{
args = MkList();
ListAdd(args, object ? CopyExpression(object) : MkExpIdentifier(MkIdentifier("this")));
ListAdd(args, MkExpIdentifier(MkIdentifier(propName)));
ListAdd(stmt->expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_FireWatchers")), args));
args = MkList();
ListAdd(args, object ? CopyExpression(object) : MkExpIdentifier(MkIdentifier("this")));
ListAdd(args, MkExpIdentifier(MkIdentifier(propNameM)));
ListAdd(stmt->expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_FireWatchers")), args));
}
{
args = MkList();
ListAdd(args, object ? CopyExpression(object) : MkExpIdentifier(MkIdentifier("this")));
ListAdd(args, MkExpIdentifier(MkIdentifier(propName)));
ListAdd(stmt->expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_FireSelfWatchers")), args));
args = MkList();
ListAdd(args, object ? CopyExpression(object) : MkExpIdentifier(MkIdentifier("this")));
ListAdd(args, MkExpIdentifier(MkIdentifier(propNameM)));
ListAdd(stmt->expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_FireSelfWatchers")), args));
}
if(curFunction->propSet && !strcmp(curFunction->propSet->string, prop->name) && (!object || (object->type == 0 && !strcmp(object->identifier->string, "this"))))
curFunction->propSet->fireWatchersDone = 0x1;
}

extern struct Declaration * MkDeclarationInst(struct Instantiation * inst);

extern struct Instantiation * MkInstantiationNamed(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Expression * exp, struct __ecereNameSpace__ecere__sys__OldList * members);

extern struct Statement * MkIfStmt(struct __ecereNameSpace__ecere__sys__OldList * exp, struct Statement * statement, struct Statement * elseStmt);

extern struct Statement * MkForStmt(struct Statement * init, struct Statement * check, struct __ecereNameSpace__ecere__sys__OldList * inc, struct Statement * statement);

extern struct Statement * MkWhileStmt(struct __ecereNameSpace__ecere__sys__OldList * exp, struct Statement * statement);

extern struct ClassFunction * MkClassFunction(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct Specifier * _class, struct Declarator * decl, struct __ecereNameSpace__ecere__sys__OldList * declList);

extern void ProcessClassFunctionBody(struct ClassFunction * func, struct Statement * body);

extern void FreePropertyWatch(struct PropertyWatch * watcher);

static void ProcessStatement(struct Statement * stmt)
{
yylloc = stmt->loc;
switch(stmt->type)
{
case 0:
ProcessStatement(stmt->labeled.stmt);
break;
case 1:
if(stmt->caseStmt.exp)
{
FreeType(stmt->caseStmt.exp->destType);
stmt->caseStmt.exp->destType = curSwitchType;
if(curSwitchType)
curSwitchType->refCount++;
ProcessExpressionType(stmt->caseStmt.exp);
ComputeExpression(stmt->caseStmt.exp);
}
if(stmt->caseStmt.stmt)
ProcessStatement(stmt->caseStmt.stmt);
break;
case 2:
{
if(stmt->compound.context)
{
struct Declaration * decl;
struct Statement * s;
struct Statement * prevCompound = curCompound;
struct Context * prevContext = curContext;

if(!stmt->compound.isSwitch)
{
curCompound = stmt;
curContext = stmt->compound.context;
}
if(stmt->compound.declarations)
{
for(decl = (*stmt->compound.declarations).first; decl; decl = decl->next)
ProcessDeclaration(decl);
}
if(stmt->compound.statements)
{
for(s = (*stmt->compound.statements).first; s; s = s->next)
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

if(stmt->expressions)
{
for(exp = (*stmt->expressions).first; exp; exp = exp->next)
ProcessExpressionType(exp);
}
break;
}
case 4:
{
struct Expression * exp;

FreeType(((struct Expression *)(*stmt->ifStmt.exp).last)->destType);
((struct Expression *)(*stmt->ifStmt.exp).last)->destType = MkClassType("bool");
((struct Expression *)(*stmt->ifStmt.exp).last)->destType->truth = 0x1;
for(exp = (*stmt->ifStmt.exp).first; exp; exp = exp->next)
{
ProcessExpressionType(exp);
}
if(stmt->ifStmt.stmt)
ProcessStatement(stmt->ifStmt.stmt);
if(stmt->ifStmt.elseStmt)
ProcessStatement(stmt->ifStmt.elseStmt);
break;
}
case 5:
{
struct Type * oldSwitchType = curSwitchType;

if(stmt->switchStmt.exp)
{
struct Expression * exp;

for(exp = (*stmt->switchStmt.exp).first; exp; exp = exp->next)
{
if(!exp->next)
{
ProcessExpressionType(exp);
}
if(!exp->next)
curSwitchType = exp->expType;
}
}
ProcessStatement(stmt->switchStmt.stmt);
curSwitchType = oldSwitchType;
break;
}
case 6:
{
if(stmt->whileStmt.exp)
{
struct Expression * exp;

FreeType(((struct Expression *)(*stmt->whileStmt.exp).last)->destType);
((struct Expression *)(*stmt->whileStmt.exp).last)->destType = MkClassType("bool");
((struct Expression *)(*stmt->whileStmt.exp).last)->destType->truth = 0x1;
for(exp = (*stmt->whileStmt.exp).first; exp; exp = exp->next)
{
ProcessExpressionType(exp);
}
}
if(stmt->whileStmt.stmt)
ProcessStatement(stmt->whileStmt.stmt);
break;
}
case 7:
{
if(stmt->doWhile.exp)
{
struct Expression * exp;

if((*stmt->doWhile.exp).last)
{
FreeType(((struct Expression *)(*stmt->doWhile.exp).last)->destType);
((struct Expression *)(*stmt->doWhile.exp).last)->destType = MkClassType("bool");
((struct Expression *)(*stmt->doWhile.exp).last)->destType->truth = 0x1;
}
for(exp = (*stmt->doWhile.exp).first; exp; exp = exp->next)
{
ProcessExpressionType(exp);
}
}
if(stmt->doWhile.stmt)
ProcessStatement(stmt->doWhile.stmt);
break;
}
case 8:
{
struct Expression * exp;

if(stmt->forStmt.init)
ProcessStatement(stmt->forStmt.init);
if(stmt->forStmt.check && stmt->forStmt.check->expressions)
{
FreeType(((struct Expression *)(*stmt->forStmt.check->expressions).last)->destType);
((struct Expression *)(*stmt->forStmt.check->expressions).last)->destType = MkClassType("bool");
((struct Expression *)(*stmt->forStmt.check->expressions).last)->destType->truth = 0x1;
}
if(stmt->forStmt.check)
ProcessStatement(stmt->forStmt.check);
if(stmt->forStmt.increment)
{
for(exp = (*stmt->forStmt.increment).first; exp; exp = exp->next)
ProcessExpressionType(exp);
}
if(stmt->forStmt.stmt)
ProcessStatement(stmt->forStmt.stmt);
break;
}
case 18:
{
struct Identifier * id = stmt->forEachStmt.id;
struct __ecereNameSpace__ecere__sys__OldList * exp = stmt->forEachStmt.exp;
struct __ecereNameSpace__ecere__sys__OldList * filter = stmt->forEachStmt.filter;
struct Statement * block = stmt->forEachStmt.stmt;
char iteratorType[1024];
struct Type * source;
struct Expression * e;
unsigned int isBuiltin = exp && (*exp).last && (((struct Expression *)(*exp).last)->type == 37 || (((struct Expression *)(*exp).last)->type == 11 && ((struct Expression *)(*exp).last)->cast.exp->type == 37));
struct Expression * arrayExp;
char * typeString = (((void *)0));
int builtinCount = 0;

for(e = exp ? (*exp).first : (((void *)0)); e; e = e->next)
{
if(!e->next)
{
FreeType(e->destType);
e->destType = ProcessTypeString("Container", 0x0);
}
if(!isBuiltin || e->next)
ProcessExpressionType(e);
}
source = (exp && (*exp).last) ? ((struct Expression *)(*exp).last)->expType : (((void *)0));
if(isBuiltin || (source && source->kind == 8 && source->_class && source->_class->registered && source->_class->registered != containerClass && __ecereNameSpace__ecere__com__eClass_IsDerived(source->_class->registered, containerClass)))
{
struct __ecereNameSpace__ecere__com__Class * _class = source ? source->_class->registered : (((void *)0));
struct Symbol * symbol;
struct Expression * expIt = (((void *)0));
unsigned int isMap = 0x0, isArray = 0x0, isLinkList = 0x0, isList = 0x0, isCustomAVLTree = 0x0, isAVLTree = 0x0;
struct __ecereNameSpace__ecere__com__Class * arrayClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "Array");
struct __ecereNameSpace__ecere__com__Class * linkListClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "LinkList");
struct __ecereNameSpace__ecere__com__Class * customAVLTreeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "CustomAVLTree");

stmt->type = 2;
stmt->compound.context = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context);
stmt->compound.context->parent = curContext;
curContext = stmt->compound.context;
if(source && __ecereNameSpace__ecere__com__eClass_IsDerived(source->_class->registered, customAVLTreeClass))
{
struct __ecereNameSpace__ecere__com__Class * mapClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "Map");
struct __ecereNameSpace__ecere__com__Class * avlTreeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "AVLTree");

isCustomAVLTree = 0x1;
if(__ecereNameSpace__ecere__com__eClass_IsDerived(source->_class->registered, avlTreeClass))
isAVLTree = 0x1;
else if(__ecereNameSpace__ecere__com__eClass_IsDerived(source->_class->registered, mapClass))
isMap = 0x1;
}
else if(source && __ecereNameSpace__ecere__com__eClass_IsDerived(source->_class->registered, arrayClass))
isArray = 0x1;
else if(source && __ecereNameSpace__ecere__com__eClass_IsDerived(source->_class->registered, linkListClass))
{
struct __ecereNameSpace__ecere__com__Class * listClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "List");

isLinkList = 0x1;
isList = __ecereNameSpace__ecere__com__eClass_IsDerived(source->_class->registered, listClass);
}
if(isArray)
{
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

decl = SpecDeclFromString(_class->templateArgs[2].dataTypeString, specs, MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(id)));
stmt->compound.declarations = MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(decl, (((void *)0))))));
ListAdd(stmt->compound.declarations, MkDeclaration(MkListOne(MkSpecifierName(source->_class->registered->fullName)), MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internalArray")), MkInitializerAssignment(MkExpBrackets(exp))))));
}
else if(isBuiltin)
{
struct Type * type = (((void *)0));
char typeStringBuf[1024];

arrayExp = (((struct Expression *)(*exp).last)->type == 37) ? (struct Expression *)(*exp).last : ((struct Expression *)(*exp).last)->cast.exp;
if(((struct Expression *)(*exp).last)->type == 11)
{
struct TypeName * typeName = ((struct Expression *)(*exp).last)->cast.typeName;

if(typeName)
arrayExp->destType = ProcessType(typeName->qualifiers, typeName->declarator);
}
if(arrayExp->destType && arrayExp->destType->kind == 8 && arrayExp->destType->_class && arrayExp->destType->_class->registered && arrayExp->destType->_class->registered != containerClass && __ecereNameSpace__ecere__com__eClass_IsDerived(arrayExp->destType->_class->registered, containerClass) && arrayExp->destType->_class->registered->templateArgs)
{
struct __ecereNameSpace__ecere__com__Class * templateClass = arrayExp->destType->_class->registered;

typeString = templateClass->templateArgs[2].dataTypeString;
}
else if(arrayExp->list)
{
struct Expression * e;

for(e = (*arrayExp->list).first; e; e = e->next)
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
if(!MatchTypeExpression(e, type, (((void *)0)), 0x0))
{
FreeType(type);
type = e->expType;
e->expType = (((void *)0));
e = (*arrayExp->list).first;
ProcessExpressionType(e);
if(e->expType)
{
if(!MatchTypeExpression(e, type, (((void *)0)), 0x0))
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
PrintType(type, typeStringBuf, 0x0, 0x1);
typeString = typeStringBuf;
FreeType(type);
}
}
if(typeString)
{
struct __ecereNameSpace__ecere__sys__OldList * initializers = MkList();
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

if(arrayExp->list)
{
struct Expression * e;

builtinCount = (*arrayExp->list).count;
type = ProcessTypeString(typeString, 0x0);
while(e = (*arrayExp->list).first)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*arrayExp->list), e);
e->destType = type;
type->refCount++;
ProcessExpressionType(e);
ListAdd(initializers, MkInitializerAssignment(e));
}
FreeType(type);
(__ecereNameSpace__ecere__com__eSystem_Delete(arrayExp->list), arrayExp->list = 0);
}
decl = SpecDeclFromString(typeString, specs, MkDeclaratorIdentifier(id));
stmt->compound.declarations = MkListOne(MkDeclaration(CopyList(specs, CopySpecifier), MkListOne(MkInitDeclarator(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), decl), (((void *)0))))));
ListAdd(stmt->compound.declarations, MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorArray(PlugDeclarator(decl, MkDeclaratorIdentifier(MkIdentifier("__internalArray"))), (((void *)0))), MkInitializerList(initializers)))));
FreeList(exp, FreeExpression);
}
else
{
arrayExp->expType = ProcessTypeString("Container", 0x0);
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Couldn't determine type of array elements\n", (((void *)0))));
}
}
else if(isLinkList && !isList)
{
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

decl = SpecDeclFromString(_class->templateArgs[3].dataTypeString, specs, MkDeclaratorIdentifier(id));
stmt->compound.declarations = MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(decl, (((void *)0))))));
ListAdd(stmt->compound.declarations, MkDeclaration(MkListOne(MkSpecifierName(source->_class->registered->fullName)), MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internalLinkList")), MkInitializerAssignment(MkExpBrackets(exp))))));
}
else if(_class->templateArgs)
{
if(isMap)
sprintf(iteratorType, "MapIterator<%s, %s >", _class->templateArgs[5].dataTypeString, _class->templateArgs[6].dataTypeString);
else
sprintf(iteratorType, "Iterator<%s, %s >", _class->templateArgs[2].dataTypeString, _class->templateArgs[1].dataTypeString);
stmt->compound.declarations = MkListOne(MkDeclarationInst(MkInstantiationNamed(MkListOne(MkSpecifierName(iteratorType)), MkExpIdentifier(id), MkListOne(MkMembersInitList(MkListOne(MkMemberInit(isMap ? MkListOne(MkIdentifier("map")) : (((void *)0)), MkInitializerAssignment(MkExpBrackets(exp)))))))));
}
symbol = FindSymbol(id->string, curContext, curContext, 0x0, 0x0);
if(block && block->type == 2 && block->compound.context)
{
block->compound.context->parent = stmt->compound.context;
}
if(filter)
{
block = MkIfStmt(filter, block, (((void *)0)));
}
if(isArray)
{
stmt->compound.statements = MkListOne(MkForStmt(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpMember(MkExpIdentifier(MkIdentifier("__internalArray")), MkIdentifier("array"))))), MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '<', MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("__internalArray")), MkIdentifier("array")), '+', MkExpMember(MkExpIdentifier(MkIdentifier("__internalArray")), MkIdentifier("count")))))), MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), INC_OP, (((void *)0)))), block));
ProcessStatement(((struct Statement *)(*stmt->compound.statements).first)->forStmt.init);
ProcessStatement(((struct Statement *)(*stmt->compound.statements).first)->forStmt.check);
ProcessExpressionType((*((struct Statement *)(*stmt->compound.statements).first)->forStmt.increment).first);
}
else if(isBuiltin)
{
char count[128];

sprintf(count, "%d", builtinCount);
stmt->compound.statements = MkListOne(MkForStmt(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpIdentifier(MkIdentifier("__internalArray"))))), MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '<', MkExpOp(MkExpIdentifier(MkIdentifier("__internalArray")), '+', MkExpConstant(count))))), MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), INC_OP, (((void *)0)))), block));
ProcessStatement(((struct Statement *)(*stmt->compound.statements).first)->forStmt.init);
ProcessStatement(((struct Statement *)(*stmt->compound.statements).first)->forStmt.check);
ProcessExpressionType((*((struct Statement *)(*stmt->compound.statements).first)->forStmt.increment).first);
}
else if(isLinkList && !isList)
{
struct __ecereNameSpace__ecere__com__Class * typeClass = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, _class->templateArgs[3].dataTypeString);
struct __ecereNameSpace__ecere__com__Class * listItemClass = __ecereNameSpace__ecere__com__eSystem_FindClass(_class->module, "ListItem");

if(typeClass && __ecereNameSpace__ecere__com__eClass_IsDerived(typeClass, listItemClass) && _class->templateArgs[5].dataTypeString && !strcmp(_class->templateArgs[5].dataTypeString, "LT::link"))
{
stmt->compound.statements = MkListOne(MkForStmt(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpMember(MkExpIdentifier(MkIdentifier("__internalLinkList")), MkIdentifier("first"))))), MkExpressionStmt(MkListOne(MkExpIdentifier(CopyIdentifier(id)))), MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpMember(MkExpIdentifier(CopyIdentifier(id)), MkIdentifier("next")))), block));
}
else
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl = SpecDeclFromString(_class->templateArgs[3].dataTypeString, specs, (((void *)0)));

stmt->compound.statements = MkListOne(MkForStmt(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpMember(MkExpIdentifier(MkIdentifier("__internalLinkList")), MkIdentifier("first"))))), MkExpressionStmt(MkListOne(MkExpIdentifier(CopyIdentifier(id)))), MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpCast(MkTypeName(specs, decl), MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier("__internalLinkList")), MkIdentifier("GetNext")), MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("IteratorPointer")), (((void *)0))), MkExpIdentifier(CopyIdentifier(id)))))))), block));
}
ProcessStatement(((struct Statement *)(*stmt->compound.statements).first)->forStmt.init);
ProcessStatement(((struct Statement *)(*stmt->compound.statements).first)->forStmt.check);
ProcessExpressionType((*((struct Statement *)(*stmt->compound.statements).first)->forStmt.increment).first);
}
else
{
stmt->compound.statements = MkListOne(MkWhileStmt(MkListOne(MkExpCall(MkExpMember(expIt = MkExpIdentifier(CopyIdentifier(id)), MkIdentifier("Next")), (((void *)0)))), block));
}
ProcessExpressionType(expIt);
if((*stmt->compound.declarations).first)
ProcessDeclaration((*stmt->compound.declarations).first);
if(symbol)
symbol->isIterator = isMap ? 2 : ((isArray || isBuiltin) ? 3 : (isLinkList ? (isList ? 5 : 4) : (isCustomAVLTree ? 6 : 1)));
ProcessStatement(stmt);
curContext = stmt->compound.context->parent;
break;
}
else
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Expression is not a container\n", (((void *)0))));
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

if(stmt->expressions)
{
for(exp = (*stmt->expressions).first; exp; exp = exp->next)
{
if(!exp->next)
{
if(curFunction && !curFunction->type)
curFunction->type = ProcessType(curFunction->specifiers, curFunction->declarator);
FreeType(exp->destType);
exp->destType = (curFunction && curFunction->type && curFunction->type->kind == 11) ? curFunction->type->returnType : (((void *)0));
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
ProcessDeclaration(stmt->decl);
break;
}
case 13:
{
struct AsmField * field;

if(stmt->asmStmt.inputFields)
{
for(field = (*stmt->asmStmt.inputFields).first; field; field = field->next)
if(field->expression)
ProcessExpressionType(field->expression);
}
if(stmt->asmStmt.outputFields)
{
for(field = (*stmt->asmStmt.outputFields).first; field; field = field->next)
if(field->expression)
ProcessExpressionType(field->expression);
}
if(stmt->asmStmt.clobberedFields)
{
for(field = (*stmt->asmStmt.clobberedFields).first; field; field = field->next)
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
struct __ecereNameSpace__ecere__sys__OldList * watches = stmt->_watch.watches;
struct Expression * object = stmt->_watch.object;
struct Expression * watcher = stmt->_watch.watcher;

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
stmt->expressions = MkList();
curExternal = external->prev;
for(propWatch = (*watches).first; propWatch; propWatch = propWatch->next)
{
struct ClassFunction * func;
char watcherName[1024];
struct __ecereNameSpace__ecere__com__Class * watcherClass = watcher ? ((watcher->expType && watcher->expType->kind == 8 && watcher->expType->_class) ? watcher->expType->_class->registered : (((void *)0))) : thisClass;
struct External * createdExternal;
struct External * externalDecl = MkExternalDeclaration((((void *)0)));

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), curExternal->prev, externalDecl);
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
if(object && object->expType && object->expType->kind == 8 && object->expType->_class && object->expType->_class->registered)
{
func = MkClassFunction(MkListOne(MkSpecifier(VOID)), (((void *)0)), MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(watcherName)), MkListOne(MkTypeName(MkListOne(MkSpecifierName(object->expType->_class->string)), MkDeclaratorIdentifier(MkIdentifier("value"))))), (((void *)0)));
ProcessClassFunctionBody(func, propWatch->compound);
propWatch->compound = (((void *)0));
createdExternal = ProcessClassFunction(watcherClass, func, ast, curExternal, 0x1);
createdExternal->symbol->idCode = external->symbol->idCode;
curExternal = createdExternal;
ProcessFunction(createdExternal->function);
{
struct Declaration * decl = MkDeclaration(CopyList(createdExternal->function->specifiers, CopySpecifier), MkListOne(MkInitDeclarator(CopyDeclarator(createdExternal->function->declarator), (((void *)0)))));

externalDecl->declaration = decl;
if(decl->symbol && !decl->symbol->pointerExternal)
decl->symbol->pointerExternal = externalDecl;
}
if(propWatch->deleteWatch)
{
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

ListAdd(args, CopyExpression(object));
ListAdd(args, watcher ? CopyExpression(watcher) : MkExpIdentifier(MkIdentifier("this")));
ListAdd(args, MkExpIdentifier(MkIdentifier(watcherName)));
ListAdd(stmt->expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_WatchDestruction")), args));
}
else
{
struct __ecereNameSpace__ecere__com__Class * _class = object->expType->_class->registered;
struct Identifier * propID;

for(propID = (*propWatch->properties).first; propID; propID = propID->next)
{
char propName[1024];
struct __ecereNameSpace__ecere__com__Property * prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, propID->string, privateModule);

if(prop)
{
char getName[1024], setName[1024];
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

DeclareProperty(prop, setName, getName);
strcpy(propName, "__ecereProp_");
FullClassNameCat(propName, prop->_class->fullName, 0x0);
strcat(propName, "_");
FullClassNameCat(propName, prop->name, 0x1);
ListAdd(args, CopyExpression(object));
ListAdd(args, MkExpIdentifier(MkIdentifier(propName)));
ListAdd(args, watcher ? CopyExpression(watcher) : MkExpIdentifier(MkIdentifier("this")));
ListAdd(args, MkExpIdentifier(MkIdentifier(watcherName)));
ListAdd(stmt->expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_Watch")), args));
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Property %s not found in class %s\n", (((void *)0))), prop->name, _class->fullName);
}
}
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Invalid watched object\n", (((void *)0))));
}
curExternal = external;
curContext = context;
if(watcher)
FreeExpression(watcher);
if(object)
FreeExpression(object);
FreeList(watches, FreePropertyWatch);
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "No observer specified and not inside a _class\n", (((void *)0))));
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
struct __ecereNameSpace__ecere__sys__OldList * watches = stmt->_watch.watches;
struct Expression * object = stmt->_watch.object;
struct __ecereNameSpace__ecere__com__Class * _class;

if(object)
ProcessExpressionType(object);
if(inCompiler)
{
_class = object ? ((object->expType && object->expType->kind == 8 && object->expType->_class) ? object->expType->_class->registered : (((void *)0))) : thisClass;
if(_class)
{
struct Identifier * propID;

stmt->type = 3;
stmt->expressions = MkList();
if(!watches && curFunction->propSet && (!object || (object->type == 0 && !strcmp(object->identifier->string, "this"))))
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
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Property %s not found in class %s\n", (((void *)0))), propID->string, _class->fullName);
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
FreeList(watches, FreeIdentifier);
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Invalid object specified and not inside a class\n", (((void *)0))));
}
break;
}
case 16:
{
struct __ecereNameSpace__ecere__sys__OldList * watches = stmt->_watch.watches;
struct Expression * object = stmt->_watch.object;
struct Expression * watcher = stmt->_watch.watcher;
struct __ecereNameSpace__ecere__com__Class * _class;

if(object)
ProcessExpressionType(object);
if(watcher)
ProcessExpressionType(watcher);
if(inCompiler)
{
_class = (object && object->expType && object->expType->kind == 8 && object->expType->_class) ? object->expType->_class->registered : (((void *)0));
if(watcher || thisClass)
{
if(_class)
{
struct Identifier * propID;

stmt->type = 3;
stmt->expressions = MkList();
if(!watches)
{
struct __ecereNameSpace__ecere__sys__OldList * args;

args = MkList();
ListAdd(args, CopyExpression(object));
ListAdd(args, MkExpConstant("0"));
ListAdd(args, watcher ? CopyExpression(watcher) : MkExpIdentifier(MkIdentifier("this")));
ListAdd(stmt->expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_StopWatching")), args));
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

DeclareProperty(prop, setName, getName);
strcpy(propName, "__ecereProp_");
FullClassNameCat(propName, prop->_class->fullName, 0x0);
strcat(propName, "_");
FullClassNameCat(propName, prop->name, 0x1);
MangleClassName(propName);
ListAdd(args, CopyExpression(object));
ListAdd(args, MkExpIdentifier(MkIdentifier(propName)));
ListAdd(args, watcher ? CopyExpression(watcher) : MkExpIdentifier(MkIdentifier("this")));
ListAdd(stmt->expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_StopWatching")), args));
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Property %s not found in class %s\n", (((void *)0))), prop->name, _class->fullName);
}
}
if(object)
FreeExpression(object);
if(watcher)
FreeExpression(watcher);
FreeList(watches, FreeIdentifier);
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Invalid object specified and not inside a class\n", (((void *)0))));
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "No observer specified and not inside a class\n", (((void *)0))));
}
break;
}
}
}

extern struct Expression * QBrackets(struct Expression * exp);

extern struct TypeName * QMkType(char *  spec, struct Declarator * decl);

extern struct Declarator * QMkPtrDecl(char *  id);

extern struct Expression * MkExpPointer(struct Expression * expression, struct Identifier * member);

extern struct Expression * QMkExpCond(struct Expression * cond, struct Expression * exp, struct Expression * elseExp);

extern struct Statement * MkFireWatchersStmt(struct Expression * object, struct __ecereNameSpace__ecere__sys__OldList * watches);

static void ProcessFunction(struct FunctionDefinition * function)
{
void * __ecereTemp2;
void * __ecereTemp1;
struct Identifier * id = GetDeclId(function->declarator);
struct Symbol * symbol = function->declarator ? function->declarator->symbol : (((void *)0));
struct Type * type = symbol ? symbol->type : (((void *)0));
struct __ecereNameSpace__ecere__com__Class * oldThisClass = thisClass;
struct Context * oldTopContext = topContext;

yylloc = function->loc;
if(type && type->thisClass)
{
struct Symbol * classSym = type->thisClass;
struct __ecereNameSpace__ecere__com__Class * _class = type->thisClass->registered;
char className[1024];
char structName[1024];
struct Declarator * funcDecl;
struct Symbol * thisSymbol;
unsigned int typedObject = 0x0;

if(_class && !_class->base)
{
_class = currentClass;
if(_class && !_class->symbol)
_class->symbol = FindClass(_class->fullName);
classSym = _class ? _class->symbol : (((void *)0));
typedObject = 0x1;
}
thisClass = _class;
if(inCompiler && _class)
{
if(type->kind == 11)
{
if(symbol->type->params.count == 1 && ((struct Type *)symbol->type->params.first)->kind == 0)
{
struct Type * param = symbol->type->params.first;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&symbol->type->params, param);
FreeType(param);
}
if(type->classObjectType != 1)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(&symbol->type->params, (((void *)0)), MkClassType(_class->fullName));
symbol->type->staticMethod = 0x1;
symbol->type->thisClass = (((void *)0));
symbol->type->extraParam = 0x0;
}
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, _class->fullName, 0x1);
MangleClassName(className);
structName[0] = (char)0;
FullClassNameCat(structName, _class->fullName, 0x0);
funcDecl = GetFuncDecl(function->declarator);
if(funcDecl)
{
if(funcDecl->function.parameters && (*funcDecl->function.parameters).count == 1)
{
struct TypeName * param = (*funcDecl->function.parameters).first;

if(param->qualifiers && (*param->qualifiers).count == 1 && ((struct Specifier *)(*param->qualifiers).first)->specifier == VOID && !param->declarator)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*funcDecl->function.parameters), param);
FreeTypeName(param);
}
}
if(!function->propertyNoThis)
{
struct TypeName * thisParam;

if(type->classObjectType != 1)
{
thisParam = QMkClass(_class->fullName, MkDeclaratorIdentifier(MkIdentifier("this")));
if(!funcDecl->function.parameters)
funcDecl->function.parameters = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->function.parameters), (((void *)0)), thisParam);
}
if(typedObject)
{
if(type->classObjectType != 1)
{
if(type->byReference || _class->type == 3 || _class->type == 1000 || _class->type == 4 || _class->type == 2)
thisParam->declarator = MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), thisParam->declarator);
}
thisParam = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TypeName), ((struct TypeName *)__ecereTemp1)->declarator = MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(MkIdentifier("class"))), ((struct TypeName *)__ecereTemp1)->qualifiers = MkListOne(MkStructOrUnion(3, MkIdentifier("__ecereNameSpace__ecere__com__Class"), (((void *)0)))), ((struct TypeName *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->function.parameters), (((void *)0)), thisParam);
}
}
}
if(symbol && symbol->pointerExternal && symbol->pointerExternal->type == 1)
{
struct InitDeclarator * initDecl = (*symbol->pointerExternal->declaration->declarators).first;

funcDecl = GetFuncDecl(initDecl->declarator);
if(funcDecl)
{
if(funcDecl->function.parameters && (*funcDecl->function.parameters).count == 1)
{
struct TypeName * param = (*funcDecl->function.parameters).first;

if(param->qualifiers && (*param->qualifiers).count == 1 && ((struct Specifier *)(*param->qualifiers).first)->specifier == VOID && !param->declarator)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*funcDecl->function.parameters), param);
FreeTypeName(param);
}
}
if(type->classObjectType != 1)
{
if((_class->type != 2 && _class->type != 3 && _class->type != 4) || function != (struct FunctionDefinition *)symbol->externalSet)
{
struct TypeName * thisParam = QMkClass(_class->fullName, MkDeclaratorIdentifier(MkIdentifier("this")));

if(!funcDecl->function.parameters)
funcDecl->function.parameters = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->function.parameters), (((void *)0)), thisParam);
}
}
}
}
}
if(function->body)
{
if(type->classObjectType != 1)
{
thisSymbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString("this"), ((struct Symbol *)__ecereTemp1)->type = classSym ? MkClassType(classSym->string) : (((void *)0)), ((struct Symbol *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&function->body->compound.context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
if(typedObject && thisSymbol->type)
{
thisSymbol->type->classObjectType = 2;
thisSymbol->type->byReference = type->byReference;
}
}
}
if(inCompiler && _class && (_class->type == 0) && type->classObjectType != 1)
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
FullClassNameCat(pointerName, _class->fullName, 0x0);
{
char className[1024];

strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 0x1);
MangleClassName(className);
DeclareClass(classSym, className);
}
bytePtr = QBrackets(MkExpCast(QMkType("char", QMkPtrDecl((((void *)0)))), QMkExpId("this")));
if(_class->fixed)
{
char string[256];

sprintf(string, "%d", _class->offset);
exp = QBrackets(MkExpOp(bytePtr, '+', MkExpConstant(string)));
}
else
{
exp = QBrackets(MkExpOp(bytePtr, '+', MkExpPointer(QMkExpId(className), MkIdentifier("offset"))));
}
exp = QBrackets(QMkExpCond(QMkExpId("this"), exp, MkExpConstant("0")));
exp->expType = (__ecereTemp2 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp2)->refCount = 1, ((struct Type *)__ecereTemp2)->kind = 13, ((struct Type *)__ecereTemp2)->type = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1)->kind = 0, ((struct Type *)__ecereTemp1)), ((struct Type *)__ecereTemp2));
if(function->body)
{
yylloc = function->body->loc;
initializer = MkInitializerAssignment(MkExpCast(MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(structName), (((void *)0)))), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), exp));
{
struct Context * prevContext = curContext;

curContext = function->body->compound.context;
decl = MkDeclaration(MkListOne(MkStructOrUnion(3, MkIdentifier(structName), (((void *)0)))), MkListOne(MkInitDeclarator(QMkPtrDecl(pointerName), initializer)));
curContext = prevContext;
}
decl->symbol = (((void *)0));
if(!function->body->compound.declarations)
function->body->compound.declarations = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*function->body->compound.declarations), (((void *)0)), decl);
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
if(symbol && symbol->pointerExternal && symbol->pointerExternal->type == 1)
{
struct InitDeclarator * initDecl = (*symbol->pointerExternal->declaration->declarators).first;

id = GetDeclId(initDecl->declarator);
FreeSpecifier(id->_class);
id->_class = (((void *)0));
}
}
if(function->body)
topContext = function->body->compound.context;
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

if(!function->body->compound.statements)
function->body->compound.statements = MkList();
ListAdd(function->body->compound.statements, fireWatchers);
curCompound = function->body;
curContext = function->body->compound.context;
ProcessStatement(fireWatchers);
curContext = prevContext;
curCompound = prevCompound;
}
curFunction = oldFunction;
}
if(function->declarator)
{
ProcessDeclarator(function->declarator);
}
topContext = oldTopContext;
thisClass = oldThisClass;
}

extern void FreeSymbol(struct Symbol * symbol);

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

static void ProcessClass(struct __ecereNameSpace__ecere__sys__OldList * definitions, struct Symbol * symbol)
{
struct ClassDef * def;
struct External * external = curExternal;
struct __ecereNameSpace__ecere__com__Class * regClass = symbol ? symbol->registered : (((void *)0));

for(def = definitions->first; def; def = def->next)
{
if(def->type == 0)
{
if(def->function->declarator)
curExternal = def->function->declarator->symbol->pointerExternal;
else
curExternal = external;
ProcessFunction((struct FunctionDefinition *)def->function);
}
else if(def->type == 2)
{
if(def->decl->type == 2)
{
thisClass = regClass;
ProcessInstantiationType(def->decl->inst);
thisClass = (((void *)0));
}
else
{
struct __ecereNameSpace__ecere__com__Class * backThisClass = thisClass;

if(regClass)
thisClass = regClass;
ProcessDeclaration(def->decl);
thisClass = backThisClass;
}
}
else if(def->type == 1 && def->defProperties)
{
struct MemberInit * defProperty;
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = regClass ? MkClassType(regClass->fullName) : (((void *)0)), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
for(defProperty = (*def->defProperties).first; defProperty; defProperty = defProperty->next)
{
thisClass = regClass;
ProcessMemberInitData(defProperty, regClass, (((void *)0)), (((void *)0)), (((void *)0)), (((void *)0)));
thisClass = (((void *)0));
}
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
FreeSymbol(thisSymbol);
}
else if(def->type == 3 && def->propertyDef)
{
struct PropertyDef * prop = def->propertyDef;

thisClass = regClass;
if(prop->setStmt)
{
if(regClass)
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(regClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&prop->setStmt->compound.context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
}
curExternal = prop->symbol ? prop->symbol->externalSet : (((void *)0));
ProcessStatement(prop->setStmt);
}
if(prop->getStmt)
{
if(regClass)
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(regClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&prop->getStmt->compound.context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
}
curExternal = prop->symbol ? prop->symbol->externalGet : (((void *)0));
ProcessStatement(prop->getStmt);
}
if(prop->issetStmt)
{
if(regClass)
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(regClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&prop->issetStmt->compound.context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
}
curExternal = prop->symbol ? prop->symbol->externalIsSet : (((void *)0));
ProcessStatement(prop->issetStmt);
}
thisClass = (((void *)0));
}
else if(def->type == 4 && def->propertyWatch)
{
struct PropertyWatch * propertyWatch = def->propertyWatch;

thisClass = regClass;
if(propertyWatch->compound)
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = regClass ? MkClassType(regClass->fullName) : (((void *)0)), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&propertyWatch->compound->compound.context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
curExternal = (((void *)0));
ProcessStatement(propertyWatch->compound);
}
thisClass = (((void *)0));
}
}
}

extern struct __ecereNameSpace__ecere__com__Instance * GetPrivateModule(void);

void ComputeDataTypes()
{
void * __ecereTemp1;
struct External * external;
struct External * temp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_External);

currentClass = (((void *)0));
containerClass = __ecereNameSpace__ecere__com__eSystem_FindClass(GetPrivateModule(), "Container");
temp->symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->id = -1000, ((struct Symbol *)__ecereTemp1)->idCode = -1000, ((struct Symbol *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), (((void *)0)), temp);
curExternal = temp;
DeclareStruct("ecere::com::Class", 0x0);
DeclareStruct("ecere::com::Instance", 0x0);
DeclareStruct("ecere::com::Property", 0x0);
DeclareStruct("ecere::com::DataMember", 0x0);
DeclareStruct("ecere::com::Method", 0x0);
DeclareStruct("ecere::com::SerialBuffer", 0x0);
DeclareStruct("ecere::com::ClassTemplateArgument", 0x0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*ast), temp);
for(external = (*ast).first; external; external = external->next)
{
afterExternal = curExternal = external;
if(external->type == 0)
{
currentClass = external->function->_class;
ProcessFunction(external->function);
}
else if(external->type == 1)
{
currentClass = (((void *)0));
ProcessDeclaration(external->declaration);
}
else if(external->type == 2)
{
struct ClassDefinition * _class = external->_class;

currentClass = external->symbol->registered;
if(_class->definitions)
{
ProcessClass(_class->definitions, _class->symbol);
}
if(inCompiler)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*ast), external);
((external ? (__ecereClass_External->Destructor ? __ecereClass_External->Destructor(external) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(external)) : 0), external = 0);
}
}
else if(external->type == 4)
{
thisNameSpace = external->id->string;
}
}
currentClass = (((void *)0));
thisNameSpace = (((void *)0));
((temp->symbol ? (__ecereClass_Symbol->Destructor ? __ecereClass_Symbol->Destructor(temp->symbol) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(temp->symbol)) : 0), temp->symbol = 0);
((temp ? (__ecereClass_External->Destructor ? __ecereClass_External->Destructor(temp) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(temp)) : 0), temp = 0);
}

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, char *  name, char *  baseName, int size, int sizeClass, unsigned int (* )(void * ), void (* )(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

void __ecereRegisterModule_pass15(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetYydebug", "void SetYydebug(bool b)", SetYydebug, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetThisClass", "void SetThisClass(ecere::com::Class c)", SetThisClass, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetThisClass", "ecere::com::Class GetThisClass(void)", GetThisClass, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintExpression", "void PrintExpression(Expression exp, char * string)", PrintExpression, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("_strtoi64", "int64 _strtoi64(char * string, char * * endString, int base)", _strtoi64, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("_strtoui64", "uint64 _strtoui64(char * string, char * * endString, int base)", _strtoui64, module, 2);
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
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetInt", "bool GetInt(Expression exp, int * value2)", GetInt, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetUInt", "bool GetUInt(Expression exp, uint * value2)", GetUInt, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetInt64", "bool GetInt64(Expression exp, int64 * value2)", GetInt64, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetUInt64", "bool GetUInt64(Expression exp, uint64 * value2)", GetUInt64, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetIntPtr", "bool GetIntPtr(Expression exp, intptr * value2)", GetIntPtr, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetUIntPtr", "bool GetUIntPtr(Expression exp, uintptr * value2)", GetUIntPtr, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetShort", "bool GetShort(Expression exp, short * value2)", GetShort, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetUShort", "bool GetUShort(Expression exp, uint16 * value2)", GetUShort, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetChar", "bool GetChar(Expression exp, char * value2)", GetChar, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetUChar", "bool GetUChar(Expression exp, byte * value2)", GetUChar, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetFloat", "bool GetFloat(Expression exp, float * value2)", GetFloat, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetDouble", "bool GetDouble(Expression exp, double * value2)", GetDouble, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ComputeClassMembers", "void ComputeClassMembers(ecere::com::Class _class, bool isMember)", ComputeClassMembers, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ComputeModuleClasses", "void ComputeModuleClasses(ecere::com::Module module)", ComputeModuleClasses, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ComputeTypeSize", "int ComputeTypeSize(Type type)", ComputeTypeSize, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("AddMembers", "int AddMembers(ecere::sys::OldList * declarations, ecere::com::Class _class, bool isMember, uint * retSize, ecere::com::Class topClass)", AddMembers, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclareStruct", "void DeclareStruct(char * name, bool skipNoHead)", DeclareStruct, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclareProperty", "void DeclareProperty(ecere::com::Property prop, char * setName, char * getName)", DeclareProperty, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("Dereference", "Type Dereference(Type source)", Dereference, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessMemberInitData", "void ProcessMemberInitData(MemberInit member, ecere::com::Class _class, ecere::com::Class * curClass, ecere::com::DataMember * curMember, ecere::com::DataMember * subMemberStack, int * subMemberStackPos)", ProcessMemberInitData, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessInstantiationType", "void ProcessInstantiationType(Instantiation inst)", ProcessInstantiationType, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FindTemplateArg", "ecere::com::ClassTemplateArgument * FindTemplateArg(ecere::com::Class _class, TemplateParameter param)", FindTemplateArg, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetupTemplatesContext", "Context SetupTemplatesContext(ecere::com::Class _class)", SetupTemplatesContext, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FinishTemplatesContext", "void FinishTemplatesContext(Context context)", FinishTemplatesContext, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessMethodType", "void ProcessMethodType(ecere::com::Method method)", ProcessMethodType, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessPropertyType", "void ProcessPropertyType(ecere::com::Property prop)", ProcessPropertyType, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclareMethod", "void DeclareMethod(ecere::com::Method method, char * name)", DeclareMethod, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ReplaceThisClass", "char * ReplaceThisClass(ecere::com::Class _class)", ReplaceThisClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ReplaceThisClassType", "Type ReplaceThisClassType(ecere::com::Class _class)", ReplaceThisClassType, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ReplaceThisClassSpecifiers", "void ReplaceThisClassSpecifiers(ecere::sys::OldList specs, ecere::com::Class _class)", ReplaceThisClassSpecifiers, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclareFunction", "bool DeclareFunction(ecere::com::GlobalFunction function, char * name)", DeclareFunction, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclareGlobalData", "void DeclareGlobalData(GlobalData data)", DeclareGlobalData, module, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Conversion", 0, sizeof(struct Conversion), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass_Conversion = class;
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MatchTypes", "bool MatchTypes(Type source, Type dest, ecere::sys::OldList conversions, ecere::com::Class owningClassSource, ecere::com::Class owningClassDest, bool doConversion, bool enumBaseType, bool acceptReversedParams, bool isConversionExploration)", MatchTypes, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MatchWithEnums_NameSpace", "bool MatchWithEnums_NameSpace(ecere::com::NameSpace nameSpace, Expression sourceExp, Type dest, char * string, ecere::sys::OldList conversions)", MatchWithEnums_NameSpace, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ModuleVisibility", "bool ModuleVisibility(ecere::com::Module searchIn, ecere::com::Module searchFor)", ModuleVisibility, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MatchWithEnums_Module", "bool MatchWithEnums_Module(ecere::com::Module mainModule, Expression sourceExp, Type dest, char * string, ecere::sys::OldList conversions)", MatchWithEnums_Module, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MatchTypeExpression", "bool MatchTypeExpression(Expression sourceExp, Type dest, ecere::sys::OldList conversions, bool skipUnitBla)", MatchTypeExpression, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ReadString", "void ReadString(char * output, char * string)", ReadString, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetOperand", "Operand GetOperand(Expression exp)", GetOperand, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PopulateInstance", "void PopulateInstance(Instantiation inst)", PopulateInstance, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ComputeInstantiation", "void ComputeInstantiation(Expression exp)", ComputeInstantiation, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CallOperator", "void CallOperator(Expression exp, Expression exp1, Expression exp2, Operand op1, Operand op2)", CallOperator, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ComputeExpression", "void ComputeExpression(Expression exp)", ComputeExpression, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CheckTemplateTypes", "void CheckTemplateTypes(Expression exp)", CheckTemplateTypes, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FindSymbol", "Symbol FindSymbol(char * name, Context startContext, Context endContext, bool isStruct, bool globalNameSpace)", FindSymbol, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrintType", "void PrintType(Type type, char * string, bool printName, bool fullName)", PrintType, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FindMemberAndOffset", "Type FindMemberAndOffset(Type type, char * string, uint * offset)", FindMemberAndOffset, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ParseExpressionString", "Expression ParseExpressionString(char * expression)", ParseExpressionString, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ReplaceExpContents", "void ReplaceExpContents(Expression checkedExp, Expression newExp)", ReplaceExpContents, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ApplyAnyObjectLogic", "void ApplyAnyObjectLogic(Expression e)", ApplyAnyObjectLogic, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessExpressionType", "void ProcessExpressionType(Expression exp)", ProcessExpressionType, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ComputeDataTypes", "void ComputeDataTypes(void)", ComputeDataTypes, module, 1);
}

void __ecereUnregisterModule_pass15(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

