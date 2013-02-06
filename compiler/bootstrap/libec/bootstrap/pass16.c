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

struct ExtDecl;

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

struct TypeName;

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

struct TemplateDatatype;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateArgument;

struct TemplateArgument;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateParameter;

struct TemplateParameter;

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

extern struct External * curExternal;

static struct Statement * curCompound;

static struct Statement * createInstancesBody;

static struct Statement * destroyInstancesBody;

extern unsigned int inCompiler;

extern struct Statement * MkCompoundStmt(struct __ecereNameSpace__ecere__sys__OldList * declarations, struct __ecereNameSpace__ecere__sys__OldList * statements);

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern struct Context * globalContext;

extern void ListAdd(struct __ecereNameSpace__ecere__sys__OldList * list, void *  item);

extern struct Specifier * MkSpecifier(int specifier);

extern char *  __ecereNameSpace__ecere__sys__GetLastDirectory(char *  string, char *  output);

extern char *  outputFile;

extern unsigned int __ecereNameSpace__ecere__sys__StripExtension(char *  string);

extern void __ecereNameSpace__ecere__sys__ChangeCh(char *  string, char ch1, char ch2);

extern int sprintf(char * , char * , ...);

extern struct Declarator * MkDeclaratorFunction(struct Declarator * declarator, struct __ecereNameSpace__ecere__sys__OldList * parameters);

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

extern struct Identifier * MkIdentifier(char *  string);

extern struct FunctionDefinition * MkFunction(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct Declarator * declarator, struct __ecereNameSpace__ecere__sys__OldList * declarationList);

extern void ProcessFunctionBody(struct FunctionDefinition * func, struct Statement * body);

extern struct __ecereNameSpace__ecere__sys__OldList *  ast;

extern struct External * MkExternalFunction(struct FunctionDefinition * function);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

static void CreateInstancesBody()
{
void * __ecereTemp1;

if(inCompiler && !createInstancesBody)
{
char registerName[1024], moduleName[274];
struct __ecereNameSpace__ecere__sys__OldList * specifiers;
struct Declarator * declarator;

createInstancesBody = MkCompoundStmt((((void *)0)), MkList());
createInstancesBody->compound.context = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ((struct Context *)__ecereTemp1)->parent = globalContext, ((struct Context *)__ecereTemp1));
specifiers = MkList();
ListAdd(specifiers, MkSpecifier(VOID));
__ecereNameSpace__ecere__sys__GetLastDirectory(outputFile, moduleName);
__ecereNameSpace__ecere__sys__StripExtension(moduleName);
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, ' ', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '.', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '-', '_');
sprintf(registerName, "__ecereCreateModuleInstances_%s", moduleName);
declarator = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(registerName)), (((void *)0)));
{
struct FunctionDefinition * function = MkFunction(specifiers, declarator, (((void *)0)));

ProcessFunctionBody(function, createInstancesBody);
ListAdd(ast, MkExternalFunction(function));
}
destroyInstancesBody = MkCompoundStmt((((void *)0)), MkList());
destroyInstancesBody->compound.context = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ((struct Context *)__ecereTemp1)->parent = globalContext, ((struct Context *)__ecereTemp1));
specifiers = MkList();
ListAdd(specifiers, MkSpecifier(VOID));
sprintf(registerName, "__ecereDestroyModuleInstances_%s", moduleName);
declarator = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(registerName)), (((void *)0)));
{
struct FunctionDefinition * function = MkFunction(specifiers, declarator, (((void *)0)));

ProcessFunctionBody(function, destroyInstancesBody);
ListAdd(ast, MkExternalFunction(function));
}
}
}

static void ProcessInitializer(struct Initializer * init);

static void ProcessMemberInitData(struct MemberInit * member)
{
if(member->initializer)
ProcessInitializer(member->initializer);
}

static void ProcessFunction(struct FunctionDefinition * function);

static void ProcessInstantiation(struct Instantiation * inst)
{
if(inst->members && (*inst->members).first)
{
struct MembersInit * members;

for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0)
{
if(members->dataMembers)
{
struct MemberInit * member;

for(member = (*members->dataMembers).first; member; member = member->next)
ProcessMemberInitData(member);
}
}
else if(members->type == 1)
{
ProcessFunction((struct FunctionDefinition *)members->function);
}
}
}
}

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Instance * privateModule;

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

extern void *  memcpy(void * , const void * , unsigned int size);

extern void __ecereNameSpace__ecere__com__eClass_FindNextMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class **  curClass, struct __ecereNameSpace__ecere__com__DataMember **  curMember, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

extern struct Expression * CopyExpression(struct Expression * exp);

extern struct Expression * MkExpConstant(char *  string);

extern struct Expression * MkExpMember(struct Expression * expression, struct Identifier * member);

extern struct Expression * MkExpOp(struct Expression * exp1, int op, struct Expression * exp2);

extern void FreeType(struct Type * type);

extern void ProcessExpressionType(struct Expression * exp);

static void ProcessExpression(struct Expression * exp);

static unsigned int ProcessInstMembers_SimpleMemberEnsure(struct __ecereNameSpace__ecere__com__DataMember * parentMember, struct Instantiation * inst, struct Expression * instExp, struct __ecereNameSpace__ecere__sys__OldList * list, unsigned int zeroOut)
{
struct Symbol * classSym = inst->_class->symbol;
unsigned int fullSet = 0x1;
struct __ecereNameSpace__ecere__com__DataMember * dataMember;

for(dataMember = parentMember->members.first; dataMember; dataMember = dataMember->next)
{
if(!dataMember->isProperty)
{
if(!dataMember->name && (dataMember->type == 1 || dataMember->type == 2))
{
if(!ProcessInstMembers_SimpleMemberEnsure(dataMember, inst, instExp, list, zeroOut))
fullSet = 0x0;
}
else
{
unsigned int memberFilled = 0x0;

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

for(member = (*members->dataMembers).first; member; member = member->next)
{
if(member->identifiers)
{
struct Identifier * firstID = (*member->identifiers).first;
struct __ecereNameSpace__ecere__com__DataMember * _subMemberStack[256];
int _subMemberStackPos = 0;
struct __ecereNameSpace__ecere__com__DataMember * thisMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(classSym->registered, firstID->string, privateModule);

if(!thisMember)
thisMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(classSym->registered, firstID->string, privateModule, _subMemberStack, &_subMemberStackPos);
if(thisMember)
{
if(thisMember && thisMember->memberAccess == 1)
{
curMember = thisMember;
curClass = curMember->_class;
memcpy(subMemberStack, _subMemberStack, sizeof(int) * _subMemberStackPos);
subMemberStackPos = _subMemberStackPos;
}
if(!firstID->next && thisMember == dataMember)
{
memberFilled = 0x1;
break;
}
}
}
else
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(classSym->registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
if(curMember == dataMember)
{
memberFilled = 0x1;
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
memberExp->member.memberType = 3;
value->usage = (value->usage & ~0x1) | (((unsigned int)0x1) << 0);
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
fullSet = 0x0;
}
}
}
}
return fullSet;
}

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

extern struct Declarator * SpecDeclFromString(char *  string, struct __ecereNameSpace__ecere__sys__OldList *  specs, struct Declarator * baseDecl);

extern struct Expression * MkExpBrackets(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern struct __ecereNameSpace__ecere__sys__OldList *  MkListOne(void *  item);

extern struct Expression * MkExpCast(struct TypeName * typeName, struct Expression * expression);

extern struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator);

extern void FreeInitializer(struct Initializer * initializer);

extern void DeclareProperty(struct __ecereNameSpace__ecere__com__Property * prop, char *  setName, char *  getName);

extern struct Expression * MkExpCall(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * arguments);

extern struct Expression * MkExpIdentifier(struct Identifier * id);

extern struct Type * MkClassType(char *  name);

extern struct TypeName * QMkClass(char *  spec, struct Declarator * decl);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear(struct __ecereNameSpace__ecere__sys__OldList * this);

static unsigned int ProcessInstMembers(struct Instantiation * inst, struct Expression * instExp, struct __ecereNameSpace__ecere__sys__OldList * list, unsigned int zeroOut)
{
struct MembersInit * members;
struct Symbol * classSym = inst->_class->symbol;
unsigned int fullSet = 0x1, convert = 0x0;

if(classSym && classSym->registered && classSym->registered->type == 2)
{
struct Expression * exp = (((void *)0));

if(inst->members && (*inst->members).first)
{
struct __ecereNameSpace__ecere__com__Class * _class = (((void *)0));

while(_class != classSym->registered)
{
struct __ecereNameSpace__ecere__com__BitMember * bitMember = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * lastClass = _class;

for(_class = classSym->registered; _class->base != lastClass && _class->base->type != 1000; _class = _class->base)
;
for(bitMember = _class->membersAndProperties.first; bitMember; bitMember = bitMember->next)
{
struct __ecereNameSpace__ecere__com__BitMember * curMember = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * curClass = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * subMemberStack[256];
int subMemberStackPos = 0;
struct MemberInit * member = (((void *)0));
unsigned int found = 0x0;

for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0)
{
for(member = (*members->dataMembers).first; member; member = member->next)
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
memcpy(subMemberStack, _subMemberStack, sizeof(int) * _subMemberStackPos);
subMemberStackPos = _subMemberStackPos;
}
if(thisMember == bitMember)
{
found = 0x1;
break;
}
}
else
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(classSym->registered, &curClass, (struct __ecereNameSpace__ecere__com__DataMember **)&curMember, subMemberStack, &subMemberStackPos);
if(curMember == bitMember)
{
found = 0x1;
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
part = MkExpBrackets(MkListOne(MkExpOp(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(specs, decl), MkExpBrackets(MkListOne(member->initializer->exp))))), LEFT_OP, MkExpConstant(pos))));
}
else
part = MkExpBrackets(MkListOne(MkExpCast(MkTypeName(specs, decl), MkExpBrackets(MkListOne(member->initializer->exp)))));
member->initializer->exp = (((void *)0));
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

DeclareProperty((struct __ecereNameSpace__ecere__com__Property *)bitMember, setName, getName);
if(member->initializer && member->initializer->type == 0)
{
exp = MkExpCall(MkExpIdentifier(MkIdentifier(setName)), MkListOne(member->initializer->exp));
member->initializer->exp = (((void *)0));
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
else if(classSym && classSym->registered && classSym->registered->type == 3)
{
struct __ecereNameSpace__ecere__com__Class * _class = classSym->registered;
struct Expression * exp = (((void *)0));

if(inst->members && (*inst->members).first)
{
struct MemberInit * member = (((void *)0));
struct __ecereNameSpace__ecere__com__Property * prop = (((void *)0));
unsigned int found = 0x0;

for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0)
{
for(member = (*members->dataMembers).first; member; member = member->next)
{
if(member->identifiers)
{
struct Identifier * firstID = (*member->identifiers).first;

prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, firstID->string, privateModule);
if(prop)
{
found = 0x1;
break;
}
prop = (((void *)0));
}
else
{
found = 0x1;
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

DeclareProperty(prop, setName, getName);
if(member->initializer && member->initializer->type == 0)
{
exp = MkExpCall(MkExpIdentifier(MkIdentifier(setName)), MkListOne(member->initializer->exp));
member->initializer->exp = (((void *)0));
FreeInitializer(member->initializer);
member->initializer = (((void *)0));
}
}
else
{
ProcessInitializer(member->initializer);
if(member->initializer && member->initializer->type == 0)
{
exp = MkExpCast(QMkClass(_class->fullName, (((void *)0))), MkExpBrackets(MkListOne(member->initializer->exp)));
member->initializer->exp = (((void *)0));
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
else if(classSym && classSym->registered)
{
if(classSym->registered->type == 1)
{
struct __ecereNameSpace__ecere__com__Class * _class = (((void *)0));

while(_class != classSym->registered)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember;
struct __ecereNameSpace__ecere__com__Class * lastClass = _class;

for(_class = classSym->registered; _class->base != lastClass && _class->base->type != 1000; _class = _class->base)
;
if(_class->structSize != _class->memberOffset)
fullSet = 0x0;
for(dataMember = _class->membersAndProperties.first; dataMember; dataMember = dataMember->next)
{
if(!dataMember->isProperty)
{
if(!dataMember->name && (dataMember->type == 1 || dataMember->type == 2))
{
if(!ProcessInstMembers_SimpleMemberEnsure(dataMember, inst, instExp, list, zeroOut))
fullSet = 0x0;
}
else
{
unsigned int memberFilled = 0x0;

if(inst->members && (*inst->members).first)
{
struct __ecereNameSpace__ecere__com__Class * curClass = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * curMember = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * subMemberStack[256];
int subMemberStackPos = 0;

for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0 && members->dataMembers)
{
struct MemberInit * member = (((void *)0));

for(member = (*members->dataMembers).first; member; member = member->next)
{
if(member->identifiers)
{
struct __ecereNameSpace__ecere__com__DataMember * _subMemberStack[256];
int _subMemberStackPos = 0;
struct Identifier * firstID = (*member->identifiers).first;
struct __ecereNameSpace__ecere__com__DataMember * thisMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(classSym->registered, firstID->string, privateModule);

if(!thisMember)
thisMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(classSym->registered, firstID->string, privateModule, _subMemberStack, &_subMemberStackPos);
if(thisMember)
{
if(thisMember->memberAccess == 1)
{
curMember = thisMember;
curClass = curMember->_class;
memcpy(subMemberStack, _subMemberStack, sizeof(int) * _subMemberStackPos);
subMemberStackPos = _subMemberStackPos;
}
if(!firstID->next && curMember == dataMember)
{
memberFilled = 0x1;
break;
}
}
}
else
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(classSym->registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
if(curMember == dataMember)
{
memberFilled = 0x1;
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
memberExp->member.memberType = 3;
value->usage = (value->usage & ~0x1) | (((unsigned int)0x1) << 0);
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
fullSet = 0x0;
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
if(members->type == 0 && members->dataMembers)
{
struct MemberInit * member = (((void *)0));
struct __ecereNameSpace__ecere__com__Method * method = (((void *)0));

for(member = (*members->dataMembers).first; member; member = member->next)
{
struct Identifier * ident = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * thisMember = (((void *)0));

if(member->identifiers)
{
struct __ecereNameSpace__ecere__com__DataMember * _subMemberStack[256];
int _subMemberStackPos = 0;
struct Identifier * firstID = (*member->identifiers).first;

thisMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(classSym->registered, firstID->string, privateModule);
if(!thisMember)
thisMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(classSym->registered, firstID->string, privateModule, _subMemberStack, &_subMemberStackPos);
ident = firstID;
if(thisMember)
{
if(thisMember->memberAccess == 1)
{
curMember = thisMember;
curClass = curMember->_class;
memcpy(subMemberStack, _subMemberStack, sizeof(int) * _subMemberStackPos);
subMemberStackPos = _subMemberStackPos;
}
}
else if(classSym->registered->type != 1)
{
method = __ecereNameSpace__ecere__com__eClass_FindMethod(classSym->registered, ident->string, privateModule);
if(!method || method->type != 1)
method = (((void *)0));
}
}
else
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(classSym->registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
thisMember = curMember;
}
if(thisMember || method)
{
struct Expression * instExpCopy = CopyExpression(instExp);
struct Expression * setExp = (((void *)0));

instExpCopy->tempCount = instExp->tempCount;
if(!ident)
ident = MkIdentifier(thisMember->name);
if(ident)
{
struct Expression * memberExp;

if(thisMember && thisMember->isProperty && ((struct __ecereNameSpace__ecere__com__Property *)thisMember)->conversion)
convert = 0x1;
if(member->identifiers && (*member->identifiers).count > 1)
{
struct Identifier * id = (*member->identifiers).first;

memberExp = MkExpMember(instExpCopy, id);
for(id = id->next; id; id = id->next)
memberExp = MkExpMember(memberExp, id);
}
else
memberExp = MkExpMember(instExpCopy, ident);
if(member->initializer && member->initializer->type == 0 && member->initializer->exp)
{
member->initializer->exp->usage = (member->initializer->exp->usage & ~0x1) | (((unsigned int)0x1) << 0);
setExp = MkExpOp(memberExp, '=', member->initializer->exp);
member->initializer->exp = (((void *)0));
FreeInitializer(member->initializer);
member->initializer = (((void *)0));
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
}
}
}
}
}
}
}
return fullSet || convert;
}

extern struct ModuleImport * mainModule;

extern char *  __ecereNameSpace__ecere__sys__CopyString(char *  string);

extern struct Specifier * MkStructOrUnion(int type, struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * definitions);

extern struct Declarator * MkDeclaratorPointer(struct Pointer * pointer, struct Declarator * declarator);

extern struct Pointer * MkPointer(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Pointer * pointer);

extern struct InitDeclarator * MkInitDeclarator(struct Declarator * declarator, struct Initializer * initializer);

extern struct Declaration * MkDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators);

extern struct External * MkExternalDeclaration(struct Declaration * declaration);

extern void DeclareStruct(char *  name, unsigned int skipNoHead);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(struct __ecereNameSpace__ecere__sys__OldList * this, void *  prevItem, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Move(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item, void *  prevItem);

void DeclareClass(struct Symbol * classSym, char * className)
{
void * __ecereTemp1;

if(classSym && classSym->id == (((int)0x7fffffff)))
{
struct Declaration * decl;
struct __ecereNameSpace__ecere__sys__OldList * specifiers, * declarators;
struct Declarator * d;

if(!classSym->_import)
{
if(!classSym->module)
classSym->module = mainModule;
if(!classSym->module)
return ;
classSym->_import = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassImport), ((struct ClassImport *)__ecereTemp1)->isRemote = classSym->registered ? classSym->registered->isRemote : 0x0, ((struct ClassImport *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(classSym->string), ((struct ClassImport *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&classSym->module->classes, classSym->_import);
}
classSym->_import->itself = 0x1;
specifiers = MkList();
declarators = MkList();
ListAdd(specifiers, MkSpecifier(EXTERN));
ListAdd(specifiers, MkStructOrUnion(3, MkIdentifier("__ecereNameSpace__ecere__com__Class"), (((void *)0))));
d = MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(MkIdentifier(className)));
ListAdd(declarators, MkInitDeclarator(d, (((void *)0))));
decl = MkDeclaration(specifiers, declarators);
if(curExternal)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), curExternal->prev, (classSym->pointerExternal = MkExternalDeclaration(decl)));
classSym->id = curExternal->symbol ? curExternal->symbol->idCode : 0;
classSym->idCode = classSym->id;
}
}
else if(classSym && curExternal->symbol->idCode < classSym->id)
{
if(classSym->structExternal)
DeclareStruct(classSym->string, classSym->registered && classSym->registered->type == 5);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Move((&*ast), classSym->pointerExternal, curExternal->prev);
if(classSym->structExternal)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Move((&*ast), classSym->structExternal, classSym->pointerExternal);
classSym->id = curExternal->symbol->idCode;
classSym->idCode = classSym->id;
}
}

void ProcessExpressionInstPass(struct Expression * exp)
{
ProcessExpression(exp);
}

extern void FreeExpression(struct Expression * exp);

extern struct Context * curContext;

static unsigned int ProcessBracketInst(struct Instantiation * inst, struct __ecereNameSpace__ecere__sys__OldList * list);

extern struct Specifier * MkSpecifierName(char *  name);

extern struct Initializer * MkInitializerList(struct __ecereNameSpace__ecere__sys__OldList * list);

extern struct Declaration * MkDeclarationInst(struct Instantiation * inst);

extern struct Instantiation * MkInstantiation(struct Specifier * _class, struct Expression * exp, struct __ecereNameSpace__ecere__sys__OldList * members);

extern struct Specifier * CopySpecifier(struct Specifier * spec);

extern struct Expression * QMkExpId(char *  id);

static void ProcessDeclaration(struct Declaration * decl);

extern char *  strcpy(char * , const char * );

extern struct Symbol * FindClass(char *  name);

extern void FullClassNameCat(char *  output, char *  className, unsigned int includeTemplateParams);

extern void MangleClassName(char *  className);

static struct Declaration * curDecl;

static int declTempCount;

extern void FreeInstance(struct Instantiation * inst);

extern struct Type * ProcessTypeString(char *  string, unsigned int staticMethod);

extern void ProcessMethodType(struct __ecereNameSpace__ecere__com__Method * method);

static void ProcessStatement(struct Statement * stmt);

extern void CheckTemplateTypes(struct Expression * exp);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(struct __ecereNameSpace__ecere__sys__OldList * this, void (*  freeFn)(void * ));

static void ProcessExpression(struct Expression * exp)
{
switch(exp->type)
{
case 0:
break;
case 1:
{
struct Instantiation * inst = exp->instance;

if(inCompiler && inst->_class)
{
char className[1024];
struct Symbol * classSym = inst->_class->symbol;
struct Expression * instExp;

if(classSym && classSym->registered && classSym->registered->type == 2)
{
if(inst->exp)
{
struct __ecereNameSpace__ecere__sys__OldList list = 
{
0
};

ProcessInstMembers(inst, (((void *)0)), &list, 0x0);
ProcessExpression(inst->exp);
exp->type = 4;
exp->op.op = '=';
exp->op.exp1 = inst->exp;
exp->op.exp2 = list.first;
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

ProcessInstMembers(inst, (((void *)0)), &list, 0x0);
FreeType(exp->destType);
*exp = *(struct Expression *)list.first;
{
struct Expression * firstExp = list.first;

((firstExp ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor(firstExp) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(firstExp)) : 0), firstExp = 0);
}
FreeType(exp->destType);
exp->destType = expType;
exp->prev = prev;
exp->next = next;
}
}
else if(classSym && classSym->registered && (classSym->registered->type == 3 || classSym->registered->type == 4))
{
if(inst->exp)
{
struct __ecereNameSpace__ecere__sys__OldList list = 
{
0
};
struct Expression * e;

ProcessInstMembers(inst, (((void *)0)), &list, 0x0);
ProcessExpression(inst->exp);
exp->type = 4;
exp->op.op = '=';
exp->op.exp1 = inst->exp;
exp->op.exp2 = list.first;
inst->exp = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&list, list.first);
while(e = list.first)
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

ProcessInstMembers(inst, (((void *)0)), &list, 0x0);
if(list.first)
{
struct Expression * e = list.first;

FreeType(exp->destType);
*exp = *e;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&list, e);
((e ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor(e) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(e)) : 0), e = 0);
exp->expType = expType;
exp->prev = prev;
exp->next = next;
while(e = list.first)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&list, e);
FreeExpression(e);
}
}
else
{
exp->type = 2;
exp->constant = __ecereNameSpace__ecere__sys__CopyString("0");
}
}
}
else if(classSym && classSym->registered && classSym->registered->type == 1)
{
if(inst->exp)
{
exp->type = 5;
exp->list = MkList();
ProcessInstMembers(inst, inst->exp, exp->list, 0x0);
ProcessExpression(inst->exp);
if(!(*exp->list).count)
{
exp->type = (int)1000;
}
inst->exp = (((void *)0));
}
else
{
struct Declaration * decl;
struct Declaration * dummyDecl;

{
dummyDecl = MkDeclaration((((void *)0)), (((void *)0)));
if(!curCompound->compound.declarations)
curCompound->compound.declarations = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*curCompound->compound.declarations), (((void *)0)), dummyDecl);
sprintf(className, "__simpleStruct%d", curContext->simpleID++);
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();

if(inst->isConstant && ProcessBracketInst(inst, list))
{
decl = MkDeclaration(MkList(), MkList());
ListAdd(decl->specifiers, MkSpecifierName(inst->_class->name));
ListAdd(decl->declarators, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(className)), MkInitializerList(list)));
exp->type = 0;
exp->identifier = MkIdentifier(className);
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free((&*list), (((void *)0)));
(__ecereNameSpace__ecere__com__eSystem_Delete(list), list = 0);
decl = MkDeclarationInst(MkInstantiation(CopySpecifier(inst->_class), MkExpIdentifier(MkIdentifier(className)), (((void *)0))));
exp->type = 5;
exp->list = MkList();
instExp = QMkExpId(className);
instExp->loc = exp->loc;
instExp->expType = MkClassType(inst->_class->name);
decl->inst->fullSet = ProcessInstMembers(inst, instExp, exp->list, 0x0);
ListAdd(exp->list, instExp);
}
}
FreeType(exp->expType);
exp->expType = MkClassType(inst->_class->name);
{
void * prev = dummyDecl->prev, * next = dummyDecl->next;

*dummyDecl = *decl;
dummyDecl->prev = prev;
dummyDecl->next = next;
((decl ? (__ecereClass_Declaration->Destructor ? __ecereClass_Declaration->Destructor(decl) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(decl)) : 0), decl = 0);
decl = dummyDecl;
}
ProcessDeclaration(decl);
}
}
}
else
{
struct Expression * newCall;

if(classSym && classSym->registered && classSym->registered->type == 5 && (classSym->registered->templateClass ? classSym->registered->templateClass->fixed : classSym->registered->fixed))
{
char size[256];

sprintf(size, "%d", classSym->registered->templateClass ? classSym->registered->templateClass->structSize : classSym->registered->structSize);
newCall = MkExpCall(QMkExpId("ecere::com::eSystem_New0"), MkListOne(MkExpConstant(size)));
newCall->byReference = 0x1;
}
else
{
strcpy(className, "__ecereClass_");
if(classSym && classSym->registered && classSym->registered->type == 5 && classSym->registered->templateClass)
{
classSym = FindClass(classSym->registered->templateClass->fullName);
FullClassNameCat(className, classSym->string, 0x1);
}
else
FullClassNameCat(className, inst->_class->name, 0x1);
MangleClassName(className);
DeclareClass(classSym, className);
newCall = MkExpCall(QMkExpId("ecere::com::eInstance_New"), MkListOne(QMkExpId(className)));
ProcessExpressionType(newCall);
newCall->byReference = 0x1;
}
if(inst->exp)
{
if(inst->members && (*inst->members).first)
{
exp->type = 5;
exp->list = MkList();
if(!inst->built)
{
ListAdd(exp->list, MkExpOp(inst->exp, '=', newCall));
}
else
FreeExpression(newCall);
ProcessInstMembers(inst, inst->exp, exp->list, 0x0);
if(inst->built)
FreeExpression(inst->exp);
}
else
{
exp->type = 4;
exp->op.op = '=';
exp->op.exp1 = inst->exp;
exp->op.exp2 = newCall;
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
struct Expression * tmpExp;

for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0 && members->dataMembers)
{
struct MemberInit * member;

for(member = (*members->dataMembers).first; member; member = member->next)
{
if(member->initializer && member->initializer->type == 0)
{
int __simpleStruct0;

ProcessMemberInitData(member);
tempCount = (__simpleStruct0 = member->initializer->exp->tempCount, (tempCount > __simpleStruct0) ? tempCount : __simpleStruct0);
}
}
}
}
if(curDecl)
{
tempCount = ((tempCount > declTempCount) ? tempCount : declTempCount);
}
tempCount++;
curExternal->function->tempCount = (__simpleStruct0 = curExternal->function->tempCount, (__simpleStruct0 > tempCount) ? __simpleStruct0 : tempCount);
sprintf(ecereTemp, "__ecereTemp%d", tempCount);
instExp = MkExpBrackets(MkListOne(MkExpCast(QMkClass(inst->_class->name, (((void *)0))), (tmpExp = QMkExpId(ecereTemp), tmpExp->byReference = 0x1, tmpExp))));
instExp->tempCount = tempCount;
exp->type = 5;
exp->list = MkList();
ListAdd(exp->list, MkExpOp((tmpExp = QMkExpId(ecereTemp), tmpExp->byReference = 0x1, tmpExp), '=', newCall));
instExp->expType = MkClassType(inst->_class->name);
ProcessInstMembers(inst, instExp, exp->list, 0x0);
FreeExpression(instExp);
ProcessExpression(tmpExp);
if(exp->usage)
ListAdd(exp->list, MkExpBrackets(MkListOne(MkExpCast(QMkClass(inst->_class->name, (((void *)0))), (tmpExp = QMkExpId(ecereTemp), tmpExp->byReference = 0x1, tmpExp)))));
exp->tempCount = tempCount;
if(curDecl)
{
declTempCount = ((declTempCount > tempCount) ? declTempCount : tempCount);
}
}
else
{
FreeType(newCall->destType);
FreeType(newCall->expType);
newCall->destType = exp->destType;
newCall->expType = exp->expType;
*exp = *newCall;
((newCall ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor(newCall) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(newCall)) : 0), newCall = 0);
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
case 28:
ProcessExpression(exp->_new.size);
break;
case 14:
case 29:
ProcessExpression(exp->_renew.size);
ProcessExpression(exp->_renew.exp);
break;
case 4:
{
unsigned int assign = 0x0;

switch(exp->op.op)
{
case '=':
if(exp->op.exp2)
exp->op.exp2->usage = (exp->op.exp2->usage & ~0x1) | (((unsigned int)0x1) << 0);
if(exp->op.exp1)
exp->op.exp1->usage = (exp->op.exp1->usage & ~0x2) | (((unsigned int)0x1) << 1);
assign = 0x1;
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
if(exp->op.exp2)
exp->op.exp2->usage = (exp->op.exp2->usage & ~0x1) | (((unsigned int)0x1) << 0);
assign = 0x1;
if(exp->op.exp1)
exp->op.exp1->usage = (exp->op.exp1->usage & ~0x2) | (((unsigned int)0x1) << 1);
break;
case INC_OP:
case DEC_OP:
if(exp->op.exp1)
exp->op.exp1->usage = (exp->op.exp1->usage & ~0x2) | (((unsigned int)0x1) << 1);
case '&':
if(exp->op.exp1 && exp->op.exp2)
{
exp->op.exp1->usage = (exp->op.exp1->usage & ~0x1) | (((unsigned int)0x1) << 0);
exp->op.exp2->usage = (exp->op.exp2->usage & ~0x1) | (((unsigned int)0x1) << 0);
}
break;
case '*':
case '+':
case '-':
if(exp->op.exp1)
{
exp->op.exp1->usage = (exp->op.exp1->usage & ~0x1) | (((unsigned int)0x1) << 0);
}
case '~':
case '!':
if(exp->op.exp2)
exp->op.exp2->usage = (exp->op.exp2->usage & ~0x1) | (((unsigned int)0x1) << 0);
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
if(exp->op.exp1)
exp->op.exp1->usage = (exp->op.exp1->usage & ~0x1) | (((unsigned int)0x1) << 0);
if(exp->op.exp2)
exp->op.exp2->usage = (exp->op.exp2->usage & ~0x1) | (((unsigned int)0x1) << 0);
break;
}
if(exp->op.exp1)
{
ProcessExpression(exp->op.exp1);
}
if(exp->op.exp2)
{
if(exp->op.exp1)
exp->op.exp2->tempCount = exp->op.exp1->tempCount;
ProcessExpression(exp->op.exp2);
}
break;
}
case 34:
case 5:
{
struct Expression * e;

for(e = (*exp->list).first; e; e = e->next)
{
int __simpleStruct2, __simpleStruct3;
int __simpleStruct0, __simpleStruct1;

e->tempCount = (__simpleStruct0 = e->tempCount, __simpleStruct1 = exp->tempCount, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
if(!e->next)
{
e->usage |= (exp->usage & ((((unsigned int)(0x1)) | (((unsigned int)(0x1)) << 2))));
}
ProcessExpression(e);
exp->tempCount = (__simpleStruct2 = exp->tempCount, __simpleStruct3 = e->tempCount, (__simpleStruct2 > __simpleStruct3) ? __simpleStruct2 : __simpleStruct3);
}
break;
}
case 6:
{
struct Expression * e;

exp->index.exp->usage = (exp->index.exp->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(exp->index.exp);
for(e = (*exp->index.index).first; e; e = e->next)
{
if(!e->next)
e->usage = (e->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(e);
}
exp->tempCount = exp->index.exp->tempCount;
break;
}
case 7:
{
struct Expression * e;
struct __ecereNameSpace__ecere__com__Method * method = (((void *)0));

ProcessExpression(exp->call.exp);
if(exp->call.arguments)
{
for(e = (*exp->call.arguments).first; e; e = e->next)
{
e->usage = (e->usage & ~0x1) | (((unsigned int)0x1) << 0);
e->usage = (e->usage & ~0x4) | (((unsigned int)0x1) << 2);
ProcessExpression(e);
}
}
break;
}
case 8:
{
exp->member.exp->usage = (exp->member.exp->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(exp->member.exp);
if(!exp->member.memberType)
{
struct Type * type = exp->member.exp->expType;

if((type && type->kind == 8 && exp->member.member))
{
struct __ecereNameSpace__ecere__com__Class * _class = (exp->member.member->_class && exp->member.member->classSym) ? exp->member.member->classSym->registered : (type->_class ? type->_class->registered : (((void *)0)));
struct __ecereNameSpace__ecere__com__Property * prop = (((void *)0));
struct __ecereNameSpace__ecere__com__Method * method = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * member = (((void *)0));
struct __ecereNameSpace__ecere__com__Property * revConvert = (((void *)0));

if(exp->member.thisPtr)
{
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, exp->member.member->string, privateModule, (((void *)0)), (((void *)0)));
if(!member)
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, exp->member.member->string, privateModule);
}
else
{
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, exp->member.member->string, (((void *)0)));
if(!prop)
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, exp->member.member->string, (((void *)0)), (((void *)0)), (((void *)0)));
if(!prop && !member)
{
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, exp->member.member->string, (((void *)0)));
if(!method)
{
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, exp->member.member->string, privateModule);
if(!prop)
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, exp->member.member->string, privateModule, (((void *)0)), (((void *)0)));
}
}
}
if(!prop && !member)
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, exp->member.member->string, privateModule);
if(!prop && !member && !method)
{
struct Symbol * classSym = FindClass(exp->member.member->string);

if(classSym)
{
struct __ecereNameSpace__ecere__com__Class * convertClass = classSym->registered;

if(convertClass)
revConvert = __ecereNameSpace__ecere__com__eClass_FindProperty(convertClass, _class->fullName, privateModule);
}
}
if(prop)
{
exp->member.memberType = 1;
if(!prop->dataType)
prop->dataType = ProcessTypeString(prop->dataTypeString, 0x0);
FreeType(exp->expType);
exp->expType = prop->dataType;
if(prop->dataType)
prop->dataType->refCount++;
}
else if(method)
{
exp->member.memberType = 2;
if(!method->dataType)
ProcessMethodType(method);
FreeType(exp->expType);
exp->expType = method->dataType;
if(method->dataType)
method->dataType->refCount++;
}
else if(member)
{
exp->member.memberType = 3;
DeclareStruct(_class->fullName, 0x0);
if(!member->dataType)
member->dataType = ProcessTypeString(member->dataTypeString, 0x0);
FreeType(exp->expType);
exp->expType = member->dataType;
if(member->dataType)
member->dataType->refCount++;
}
else if(revConvert)
{
exp->member.memberType = 4;
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
exp->cast.exp->usage = (exp->cast.exp->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(exp->cast.exp);
break;
}
case 12:
{
struct Expression * e;

if(((unsigned int)((exp->usage & 0x1) >> 0)))
exp->cond.cond->usage = (exp->cond.cond->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(exp->cond.cond);
for(e = (*exp->cond.exp).first; e; e = e->next)
{
if(!e->next && ((unsigned int)((exp->usage & 0x1) >> 0)))
e->usage = (e->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(e);
}
if(exp->cond.elseExp)
{
if(((unsigned int)((exp->usage & 0x1) >> 0)))
exp->cond.elseExp->usage = (exp->cond.elseExp->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(exp->cond.elseExp);
}
break;
}
case 25:
{
if(exp->compound->compound.statements && ((struct Statement *)(*exp->compound->compound.statements).last)->type == 3 && (*((struct Statement *)(*exp->compound->compound.statements).last)->expressions).last)
{
((struct Expression *)(*((struct Statement *)(*exp->compound->compound.statements).last)->expressions).last)->usage = exp->usage;
}
ProcessStatement(exp->compound);
break;
}
case 36:
{
ProcessExpression(exp->vaArg.exp);
break;
}
case 35:
{
ProcessInitializer(exp->initializer.initializer);
break;
}
}
CheckTemplateTypes(exp);
}

static void ProcessInitializer(struct Initializer * init)
{
switch(init->type)
{
case 0:
init->exp->usage = (init->exp->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(init->exp);
break;
case 1:
{
struct Initializer * i;

for(i = (*init->list).first; i; i = i->next)
ProcessInitializer(i);
break;
}
}
}

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

if(spec->list)
{
for(e = (*spec->list).first; e; e = e->next)
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
if(spec->definitions)
{
struct ClassDef * def;

for(def = (*spec->definitions).first; def; def = def->next)
{
if(def->type == 2 && def->decl && def->decl->type == 0)
ProcessDeclaration(def->decl);
}
}
break;
}
}
}

extern struct Specifier * _MkSpecifierName(char *  name, struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * templateArgs);

extern struct Identifier * CopyIdentifier(struct Identifier * id);

extern struct MemberInit * MkMemberInit(struct __ecereNameSpace__ecere__sys__OldList * ids, struct Initializer * initializer);

extern struct Initializer * MkInitializerAssignment(struct Expression * exp);

extern int strcmp(const char * , const char * );

extern struct Expression * MkExpInstance(struct Instantiation * inst);

extern struct MembersInit * MkMembersInitList(struct __ecereNameSpace__ecere__sys__OldList * dataMembers);

static unsigned int ProcessBracketInst_DataMember(struct __ecereNameSpace__ecere__com__DataMember * parentMember, struct Instantiation * inst, struct __ecereNameSpace__ecere__sys__OldList * list)
{
struct Symbol * classSym = inst->_class->symbol;
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (((void *)0));
unsigned int someMemberSet = 0x0;

for(dataMember = parentMember->members.first; dataMember; dataMember = dataMember->next)
{
struct MembersInit * members;
struct MemberInit * member = (((void *)0));

if(!dataMember->name && (dataMember->type == 1 || dataMember->type == 2))
{
if(!ProcessBracketInst_DataMember(dataMember, inst, list))
return 0x0;
}
else
{
struct __ecereNameSpace__ecere__com__Class * curClass = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * curMember = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * subMemberStack[256];
int subMemberStackPos = 0;
unsigned int found = 0x0;

if(inst->members && (*inst->members).first)
{
for(members = (*inst->members).first; members; members = members->next)
{
if(members->type == 0)
{
for(member = (*members->dataMembers).first; member; member = member->next)
{
if(member->identifiers)
{
struct Identifier * firstID = (*member->identifiers).first;
struct __ecereNameSpace__ecere__com__DataMember * _subMemberStack[256];
int _subMemberStackPos = 0;
struct __ecereNameSpace__ecere__com__DataMember * thisMember;

thisMember = firstID ? (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(classSym->registered, firstID->string, privateModule) : (((void *)0));
if(!thisMember && firstID)
thisMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(classSym->registered, firstID->string, privateModule, _subMemberStack, &_subMemberStackPos);
if(thisMember && thisMember->memberAccess == 1)
{
curMember = thisMember;
curClass = curMember->_class;
memcpy(subMemberStack, _subMemberStack, sizeof(int) * _subMemberStackPos);
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
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0x0);
symbol = (dataMember->dataType && dataMember->dataType->kind == 8) ? dataMember->dataType->_class : (((void *)0));
spec = _MkSpecifierName(dataMember->dataTypeString, symbol, (((void *)0)));
{
struct __ecereNameSpace__ecere__sys__OldList * identifiers = MkList();
struct Identifier * id;

for(id = ((struct Identifier *)(*member->identifiers).first)->next; id; id = id->next)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*identifiers), CopyIdentifier(id));
ListAdd(partList, MkMemberInit(identifiers, MkInitializerAssignment(member->initializer->exp)));
}
for(nextMembers = members; nextMembers; nextMembers = nextMembers->next)
{
if(!nextMembers->dataMembers)
continue;
if(members != nextMembers)
next = (*nextMembers->dataMembers).first;
if(nextMembers->type == 0)
{
struct MemberInit * nextMember;

for(nextMember = next; nextMember; nextMember = next, next = nextMember ? nextMember->next : (((void *)0)))
{
struct Identifier * nextID = (*nextMember->identifiers).first;

if(nextMember->identifiers && (*nextMember->identifiers).count > 1 && !strcmp(firstID->string, nextID->string))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*nextMembers->dataMembers), nextMember);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*nextMember->identifiers), nextID);
ListAdd(partList, nextMember);
}
}
}
}
member->initializer->exp = MkExpInstance(MkInstantiation(spec, (((void *)0)), MkListOne(MkMembersInitList(partList))));
}
found = 0x1;
break;
}
}
else
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(classSym->registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
if(curMember == dataMember)
{
found = 0x1;
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
struct Expression * memberExp = (((void *)0));

if(member->initializer->exp->type == 1 && member->initializer->exp->expType && member->initializer->exp->expType->_class->registered->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldList * subList = MkList();

ProcessBracketInst(member->initializer->exp->instance, subList);
FreeExpression(member->initializer->exp);
ListAdd(list, MkInitializerList(subList));
}
else
{
member->initializer->exp->usage = (member->initializer->exp->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(member->initializer->exp);
ListAdd(list, MkInitializerAssignment(member->initializer->exp));
}
member->initializer->exp = (((void *)0));
FreeInitializer(member->initializer);
member->initializer = (((void *)0));
someMemberSet = 0x1;
}
else if(member && member->initializer && member->initializer->type == 1)
{
ListAdd(list, member->initializer);
member->initializer = (((void *)0));
someMemberSet = 0x1;
}
else if(dataMember && dataMember->dataTypeString && parentMember->type != 1)
{
struct Symbol * classSym;

if(!dataMember->dataType)
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0x0);
classSym = (dataMember->dataType && dataMember->dataType->kind == 8) ? dataMember->dataType->_class : (((void *)0));
if(classSym && classSym->registered && classSym->registered->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldList * subList = MkList();
struct Specifier * spec = _MkSpecifierName(dataMember->dataTypeString, classSym, (((void *)0)));
struct Instantiation * inst = MkInstantiation(spec, (((void *)0)), (((void *)0)));

ProcessBracketInst(inst, subList);
FreeInstance(inst);
ListAdd(list, MkInitializerList(subList));
}
else
ListAdd(list, MkInitializerAssignment(MkExpConstant("0")));
}
}
}
if(parentMember->type == 1 && !someMemberSet)
{
struct Symbol * classSym;

dataMember = parentMember->members.first;
if(!dataMember->dataType && dataMember->dataTypeString)
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0x0);
classSym = (dataMember->dataType && dataMember->dataType->kind == 8) ? dataMember->dataType->_class : (((void *)0));
if(classSym && classSym->registered && classSym->registered->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldList * subList = MkList();
struct Specifier * spec = _MkSpecifierName(dataMember->dataTypeString, classSym, (((void *)0)));
struct Instantiation * inst = MkInstantiation(spec, (((void *)0)), (((void *)0)));

ProcessBracketInst(inst, subList);
FreeInstance(inst);
ListAdd(list, MkInitializerList(subList));
}
else
ListAdd(list, MkInitializerAssignment(MkExpConstant("0")));
}
return 0x1;
}

extern void Compiler_Error(char *  format, ...);

extern char *  __ecereNameSpace__ecere__GetTranslatedString(struct __ecereNameSpace__ecere__com__Instance * module, char *  string, char *  stringAndContext);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

static unsigned int ProcessBracketInst(struct Instantiation * inst, struct __ecereNameSpace__ecere__sys__OldList * list)
{
static int recursionCount = 0;
struct Symbol * classSym = inst->_class->symbol;
struct __ecereNameSpace__ecere__com__Class * _class = (((void *)0));

if(recursionCount > 500)
return 0x0;
recursionCount++;
while(_class != classSym->registered)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember;
struct __ecereNameSpace__ecere__com__Class * lastClass = _class;

for(_class = classSym->registered; _class->base != lastClass && _class->base->type != 1000; _class = _class->base)
;
for(dataMember = _class->membersAndProperties.first; dataMember; dataMember = dataMember->next)
{
if(!dataMember->isProperty && !dataMember->name && (dataMember->type == 1 || dataMember->type == 2))
{
if(!ProcessBracketInst_DataMember(dataMember, inst, list))
{
recursionCount--;
return 0x0;
}
}
else
{
struct MembersInit * members;
struct MemberInit * member = (((void *)0));
unsigned int found = 0x0;

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
for(member = (*members->dataMembers).first; member; member = member->next)
{
struct Identifier * firstID = member->identifiers ? (*member->identifiers).first : (((void *)0));

if(firstID)
{
struct __ecereNameSpace__ecere__com__DataMember * _subMemberStack[256];
int _subMemberStackPos = 0;
struct __ecereNameSpace__ecere__com__DataMember * thisMember = (struct __ecereNameSpace__ecere__com__DataMember *)__ecereNameSpace__ecere__com__eClass_FindProperty(classSym->registered, firstID->string, privateModule);

if(!thisMember)
thisMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(classSym->registered, firstID->string, privateModule, _subMemberStack, &_subMemberStackPos);
if(thisMember)
{
curMember = thisMember;
curClass = curMember->_class;
memcpy(subMemberStack, _subMemberStack, sizeof(int) * _subMemberStackPos);
subMemberStackPos = _subMemberStackPos;
}
if(curMember == dataMember)
{
if(dataMember->isProperty)
{
if(!((struct __ecereNameSpace__ecere__com__Property *)dataMember)->Set)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "No set defined for property %s\n", (((void *)0))), dataMember->name);
continue;
}
recursionCount--;
return 0x0;
}
if((*member->identifiers).count > 1 && member->initializer && member->initializer->type == 0)
{
struct __ecereNameSpace__ecere__sys__OldList * partList = MkList();
struct Specifier * spec;
struct MembersInit * nextMembers;
struct MemberInit * next = member->next;
struct Symbol * symbol;

if(!dataMember->dataType)
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0x0);
symbol = (dataMember->dataType && dataMember->dataType->kind == 8) ? dataMember->dataType->_class : (((void *)0));
spec = _MkSpecifierName(dataMember->dataTypeString, symbol, (((void *)0)));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*member->identifiers), firstID);
ListAdd(partList, MkMemberInit(member->identifiers, MkInitializerAssignment(member->initializer->exp)));
for(nextMembers = members; nextMembers; nextMembers = nextMembers->next)
{
if(!nextMembers->dataMembers)
continue;
if(members != nextMembers)
next = (*nextMembers->dataMembers).first;
if(nextMembers->type == 0)
{
struct MemberInit * nextMember;

for(nextMember = next; nextMember; nextMember = next, next = nextMember ? nextMember->next : (((void *)0)))
{
struct Identifier * nextID = (*nextMember->identifiers).first;

if(nextMember->identifiers && (*nextMember->identifiers).count > 1 && !strcmp(firstID->string, nextID->string))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*nextMembers->dataMembers), nextMember);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*nextMember->identifiers), nextID);
ListAdd(partList, nextMember);
}
}
}
}
member->initializer->exp = MkExpInstance(MkInstantiation(spec, (((void *)0)), MkListOne(MkMembersInitList(partList))));
member->identifiers = (((void *)0));
}
found = 0x1;
break;
}
}
else
{
__ecereNameSpace__ecere__com__eClass_FindNextMember(classSym->registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
if(curMember == dataMember)
{
if(dataMember->isProperty)
{
if(!((struct __ecereNameSpace__ecere__com__Property *)dataMember)->Set)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "No set defined for property %s\n", (((void *)0))), dataMember->name);
continue;
}
recursionCount--;
return 0x0;
}
found = 0x1;
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
struct Expression * memberExp = (((void *)0));

if(member->initializer->exp->type == 1 && member->initializer->exp->expType && member->initializer->exp->expType->_class && member->initializer->exp->expType->_class->registered && member->initializer->exp->expType->_class->registered->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldList * subList = MkList();

ProcessBracketInst(member->initializer->exp->instance, subList);
FreeExpression(member->initializer->exp);
ListAdd(list, MkInitializerList(subList));
}
else
{
member->initializer->exp->usage = (member->initializer->exp->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(member->initializer->exp);
ListAdd(list, MkInitializerAssignment(member->initializer->exp));
}
member->takeOutExp = 0x1;
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
dataMember->dataType = ProcessTypeString(dataMember->dataTypeString, 0x0);
classSym = (dataMember->dataType && dataMember->dataType->kind == 8) ? dataMember->dataType->_class : (((void *)0));
if(classSym && classSym->registered && classSym->registered->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldList * subList = MkList();
struct Specifier * spec = _MkSpecifierName(dataMember->dataTypeString, classSym, (((void *)0)));
struct Instantiation * inst = MkInstantiation(spec, (((void *)0)), (((void *)0)));

ProcessBracketInst(inst, subList);
FreeInstance(inst);
ListAdd(list, MkInitializerList(subList));
}
else if(dataMember->dataType->kind == 12)
ListAdd(list, MkInitializerList(MkListOne(MkInitializerAssignment(MkExpConstant("0")))));
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
for(member = (*members->dataMembers).first; member; member = member->next)
{
if(member->takeOutExp)
{
member->initializer->exp = (((void *)0));
FreeInitializer(member->initializer);
member->initializer = (((void *)0));
}
}
}
}
}
recursionCount--;
return 0x1;
}

extern struct Statement * MkExpressionStmt(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern void FreeList(struct __ecereNameSpace__ecere__sys__OldList * list, void (* )(void * ));

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
if(decl->specifiers)
{
struct Specifier * s;

for(s = (*decl->specifiers).first; s; s = s->next)
{
ProcessSpecifier(s);
}
}
if(decl->declarators)
{
struct InitDeclarator * d;

for(d = (*decl->declarators).first; d; d = d->next)
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
struct Instantiation * inst = decl->inst;

if(inCompiler)
{
struct Symbol * classSym = inst->_class->symbol;

if(!curCompound)
{
struct Statement * stmt;

if(!inst->isConstant || (classSym && classSym->registered && (classSym->registered->type == 0 || classSym->registered->type == 5)))
{
decl->type = 1;
decl->specifiers = MkListOne(MkSpecifierName(inst->_class->name));
if(decl->declMode == 3)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*decl->specifiers), (((void *)0)), MkSpecifier(STATIC));
}
decl->declarators = MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(inst->exp->identifier->string)), (((void *)0))));
ProcessDeclaration(decl);
CreateInstancesBody();
{
struct Expression * exp = MkExpInstance(inst);

stmt = MkExpressionStmt(MkListOne(exp));
ListAdd(createInstancesBody->compound.statements, stmt);
ProcessExpressionType(exp);
}
if(classSym && classSym->registered && (classSym->registered->type == 0))
{
ListAdd(createInstancesBody->compound.statements, MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_IncRef")), MkListOne(CopyExpression(inst->exp))))));
{
struct Expression * exp = MkExpOp((((void *)0)), DELETE, CopyExpression(inst->exp));

ListAdd(destroyInstancesBody->compound.statements, MkExpressionStmt(MkListOne(exp)));
ProcessExpressionType(exp);
}
}
else if(classSym && classSym->registered && (classSym->registered->type == 5))
{
struct Expression * exp = MkExpOp((((void *)0)), DELETE, CopyExpression(inst->exp));

ListAdd(destroyInstancesBody->compound.statements, MkExpressionStmt(MkListOne(exp)));
ProcessExpressionType(exp);
}
break;
}
else
{
CreateInstancesBody();
}
}
{
char className[1024];

decl->type = 1;
decl->specifiers = MkList();
decl->declarators = MkList();
if(classSym && classSym->registered && classSym->registered->type == 2)
{
struct __ecereNameSpace__ecere__sys__OldList list = 
{
0
};

ProcessInstMembers(inst, inst->exp, &list, 0x0);
ProcessExpression(inst->exp);
ListAdd(decl->specifiers, MkSpecifierName(inst->_class->name));
ListAdd(decl->declarators, MkInitDeclarator(MkDeclaratorIdentifier(inst->exp->identifier), MkInitializerAssignment(list.first)));
inst->exp->identifier = (((void *)0));
}
else if(classSym && classSym->registered && classSym->registered->type == 3)
{
struct __ecereNameSpace__ecere__sys__OldList list = 
{
0
};

ProcessInstMembers(inst, inst->exp, &list, 0x0);
ProcessExpression(inst->exp);
ListAdd(decl->specifiers, MkSpecifierName(inst->_class->name));
ListAdd(decl->declarators, MkInitDeclarator(MkDeclaratorIdentifier(inst->exp->identifier), MkInitializerAssignment(list.first)));
inst->exp->identifier = (((void *)0));
}
else if(classSym && classSym->registered && classSym->registered->type == 1)
{
struct Expression * exp;

DeclareStruct(inst->_class->name, 0x0);
ProcessExpression(inst->exp);
{
if(inst->fullSet)
{
ListAdd(decl->specifiers, MkSpecifierName(inst->_class->name));
ListAdd(decl->declarators, MkInitDeclarator(MkDeclaratorIdentifier(inst->exp->identifier), (((void *)0))));
inst->exp->identifier = (((void *)0));
}
else
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();

if(ProcessBracketInst(inst, list))
{
ListAdd(decl->specifiers, MkSpecifierName(inst->_class->name));
ListAdd(decl->declarators, MkInitDeclarator(MkDeclaratorIdentifier(inst->exp->identifier), MkInitializerList(list)));
inst->exp->identifier = (((void *)0));
}
else
{
FreeList(list, FreeInitializer);
exp = MkExpBrackets(MkList());
ProcessInstMembers(inst, inst->exp, exp->list, 0x1);
ListAdd(exp->list, CopyExpression(inst->exp));
ListAdd(decl->specifiers, MkSpecifierName(inst->_class->name));
ListAdd(decl->declarators, MkInitDeclarator(MkDeclaratorIdentifier(inst->exp->identifier), MkInitializerAssignment(exp)));
inst->exp->identifier = (((void *)0));
}
}
}
}
else
{
struct Expression * newCall;

if(classSym && classSym->registered && classSym->registered->type == 5 && (classSym->registered->templateClass ? classSym->registered->templateClass->fixed : classSym->registered->fixed))
{
char size[256];

sprintf(size, "%d", classSym->registered->templateClass ? classSym->registered->templateClass->structSize : classSym->registered->structSize);
newCall = MkExpCall(QMkExpId("ecere::com::eSystem_New0"), MkListOne(MkExpConstant(size)));
}
else
{
strcpy(className, "__ecereClass_");
if(classSym && classSym->registered && classSym->registered->type == 5 && classSym->registered->templateClass)
{
classSym = FindClass(classSym->registered->templateClass->fullName);
FullClassNameCat(className, classSym->string, 0x1);
}
else
FullClassNameCat(className, inst->_class->name, 0x1);
MangleClassName(className);
DeclareClass(classSym, className);
newCall = MkExpCall(QMkExpId("ecere::com::eInstance_New"), MkListOne(QMkExpId(className)));
ProcessExpressionType(newCall);
newCall->byReference = 0x1;
}
if(classSym)
DeclareClass(classSym, className);
if(inst->exp)
{
struct Expression * exp, * newExp;
struct Identifier * id = CopyIdentifier(inst->exp->identifier);

if(inst->members && (*inst->members).first)
{
newExp = MkExpOp(CopyExpression(inst->exp), '=', newCall);
exp = MkExpBrackets(MkList());
ListAdd(exp->list, newExp);
ProcessInstMembers(inst, inst->exp, exp->list, 0x0);
ListAdd(exp->list, inst->exp);
ProcessExpression(inst->exp);
inst->exp = (((void *)0));
}
else
exp = newCall;
ListAdd(decl->specifiers, MkSpecifierName(inst->_class->name));
ListAdd(decl->declarators, MkInitDeclarator(MkDeclaratorIdentifier(id), MkInitializerAssignment(exp)));
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
if(decl->specifiers)
{
struct Specifier * spec;

for(spec = (*decl->specifiers).first; spec; spec = spec->next)
ProcessSpecifier(spec);
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
if(stmt->labeled.stmt)
ProcessStatement(stmt->labeled.stmt);
break;
case 1:
if(stmt->caseStmt.exp)
ProcessExpression(stmt->caseStmt.exp);
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

if(stmt->expressions)
{
for(exp = (*stmt->expressions).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
}
break;
}
case 4:
{
struct Expression * exp;

((struct Expression *)(*stmt->ifStmt.exp).last)->usage = (((struct Expression *)(*stmt->ifStmt.exp).last)->usage & ~0x1) | (((unsigned int)0x1) << 0);
for(exp = (*stmt->ifStmt.exp).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
if(stmt->ifStmt.stmt)
ProcessStatement(stmt->ifStmt.stmt);
if(stmt->ifStmt.elseStmt)
ProcessStatement(stmt->ifStmt.elseStmt);
break;
}
case 5:
{
struct Expression * exp;

((struct Expression *)(*stmt->switchStmt.exp).last)->usage = (((struct Expression *)(*stmt->switchStmt.exp).last)->usage & ~0x1) | (((unsigned int)0x1) << 0);
for(exp = (*stmt->switchStmt.exp).first; exp; exp = exp->next)
ProcessExpression(exp);
ProcessStatement(stmt->switchStmt.stmt);
break;
}
case 6:
{
if(stmt->whileStmt.exp)
{
struct Expression * exp;

((struct Expression *)(*stmt->whileStmt.exp).last)->usage = (((struct Expression *)(*stmt->whileStmt.exp).last)->usage & ~0x1) | (((unsigned int)0x1) << 0);
for(exp = (*stmt->whileStmt.exp).first; exp; exp = exp->next)
{
ProcessExpression(exp);
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

((struct Expression *)(*stmt->doWhile.exp).last)->usage = (((struct Expression *)(*stmt->doWhile.exp).last)->usage & ~0x1) | (((unsigned int)0x1) << 0);
for(exp = (*stmt->doWhile.exp).first; exp; exp = exp->next)
{
ProcessExpression(exp);
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
((struct Expression *)(*stmt->forStmt.check->expressions).last)->usage = (((struct Expression *)(*stmt->forStmt.check->expressions).last)->usage & ~0x1) | (((unsigned int)0x1) << 0);
}
if(stmt->forStmt.check)
ProcessStatement(stmt->forStmt.check);
if(stmt->forStmt.increment)
{
for(exp = (*stmt->forStmt.increment).first; exp; exp = exp->next)
ProcessExpression(exp);
}
if(stmt->forStmt.stmt)
ProcessStatement(stmt->forStmt.stmt);
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

if(stmt->expressions && (*stmt->expressions).last)
{
((struct Expression *)(*stmt->expressions).last)->usage = (((struct Expression *)(*stmt->expressions).last)->usage & ~0x1) | (((unsigned int)0x1) << 0);
for(exp = (*stmt->expressions).first; exp; exp = exp->next)
{
ProcessExpression(exp);
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
ProcessExpression(field->expression);
}
if(stmt->asmStmt.outputFields)
{
for(field = (*stmt->asmStmt.outputFields).first; field; field = field->next)
if(field->expression)
ProcessExpression(field->expression);
}
if(stmt->asmStmt.clobberedFields)
{
for(field = (*stmt->asmStmt.clobberedFields).first; field; field = field->next)
if(field->expression)
ProcessExpression(field->expression);
}
break;
}
}
}

static void ProcessFunction(struct FunctionDefinition * function)
{
if(function->body)
{
yylloc = function->loc;
ProcessStatement(function->body);
}
}

extern struct Type * MkClassTypeSymbol(struct Symbol * symbol);

extern void FreeSymbol(struct Symbol * symbol);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

void ProcessInstantiations()
{
struct External * external;

for(external = (*ast).first; external; external = external->next)
{
curExternal = external;
if(external->type == 1)
{
if(external->declaration)
ProcessDeclaration(external->declaration);
}
else if(external->type == 0)
{
ProcessFunction(external->function);
}
else if(external->type == 2)
{
struct ClassDefinition * _class = external->_class;

if(_class->definitions)
{
struct ClassDef * def;

for(def = (*_class->definitions).first; def; def = def->next)
{
if(def->type == 0)
{
curExternal = def->function->declarator ? def->function->declarator->symbol->pointerExternal : external;
ProcessFunction((struct FunctionDefinition *)def->function);
}
else if(def->type == 2 && def->decl->type == 2)
{
ProcessInstantiation(def->decl->inst);
}
else if(def->type == 1 && def->defProperties)
{
struct MemberInit * defProperty;
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassTypeSymbol(_class->symbol), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
for(defProperty = (*def->defProperties).first; defProperty; defProperty = defProperty->next)
{
ProcessMemberInitData(defProperty);
}
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
FreeSymbol(thisSymbol);
}
else if(def->type == 3 && def->propertyDef)
{
struct PropertyDef * prop = def->propertyDef;
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassTypeSymbol(_class->symbol), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
if(prop->setStmt)
{
curExternal = prop->symbol ? prop->symbol->externalSet : (((void *)0));
ProcessStatement(prop->setStmt);
}
if(prop->getStmt)
{
curExternal = prop->symbol ? prop->symbol->externalGet : (((void *)0));
ProcessStatement(prop->getStmt);
}
if(prop->issetStmt)
{
curExternal = prop->symbol ? prop->symbol->externalIsSet : (((void *)0));
ProcessStatement(prop->issetStmt);
}
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
FreeSymbol(thisSymbol);
}
else if(def->type == 4 && def->propertyWatch)
{
struct PropertyWatch * propertyWatch = def->propertyWatch;
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassTypeSymbol(_class->symbol), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
if(propertyWatch->compound)
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassTypeSymbol(_class->symbol), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&propertyWatch->compound->compound.context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

void __ecereRegisterModule_pass16(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclareClass", "void DeclareClass(Symbol classSym, char * className)", DeclareClass, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessExpressionInstPass", "void ProcessExpressionInstPass(Expression exp)", ProcessExpressionInstPass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessInstantiations", "void ProcessInstantiations(void)", ProcessInstantiations, module, 1);
}

void __ecereUnregisterModule_pass16(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

