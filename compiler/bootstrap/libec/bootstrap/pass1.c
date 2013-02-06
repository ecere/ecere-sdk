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

struct Instantiation;

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
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));

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

struct ModuleImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassImport;

struct ClassImport;

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

struct InitDeclarator;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_AsmField;

struct AsmField;

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

struct MembersInit;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_MemberInit;

struct MemberInit;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyDef;

struct PropertyDef;

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

static struct Statement * registerModuleBody;

static struct External * registerModuleExternal;

static struct Statement * unregisterModuleBody;

static struct External * unregisterModuleExternal;

extern int propWatcherID;

unsigned int buildingECERECOM = 0x0;

void SetBuildingEcereCom(unsigned int b)
{
buildingECERECOM = b;
}

unsigned int GetBuildingEcereCom()
{
return buildingECERECOM;
}

unsigned int buildingECERECOMModule = 0x0;

void SetBuildingEcereComModule(unsigned int b)
{
buildingECERECOMModule = b;
}

unsigned int GetBuildingEcereComModule()
{
return buildingECERECOMModule;
}

extern struct Identifier * GetDeclId(struct Declarator * decl);

extern unsigned int inCompiler;

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern struct Specifier * MkSpecifier(int specifier);

extern void ReplaceThisClassSpecifiers(struct __ecereNameSpace__ecere__sys__OldList * specs, struct __ecereNameSpace__ecere__com__Class * _class);

extern struct FunctionDefinition * MkFunction(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct Declarator * declarator, struct __ecereNameSpace__ecere__sys__OldList * declarationList);

extern void ProcessFunctionBody(struct FunctionDefinition * func, struct Statement * body);

extern struct External * MkExternalFunction(struct FunctionDefinition * function);

extern void ProcessMethodType(struct __ecereNameSpace__ecere__com__Method * method);

extern struct __ecereNameSpace__ecere__com__ClassTemplateArgument *  FindTemplateArg(struct __ecereNameSpace__ecere__com__Class * _class, struct TemplateParameter * param);

extern struct Type * ProcessTypeString(char *  string, unsigned int staticMethod);

extern struct Symbol * FindClass(char *  name);

extern unsigned int MatchTypes(struct Type * source, struct Type * dest, struct __ecereNameSpace__ecere__sys__OldList * conversions, struct __ecereNameSpace__ecere__com__Class * owningClassSource, struct __ecereNameSpace__ecere__com__Class * owningClassDest, unsigned int doConversion, unsigned int enumBaseType, unsigned int acceptReversedParams, unsigned int isConversionExploration);

extern void Compiler_Error(char *  format, ...);

extern char *  __ecereNameSpace__ecere__GetTranslatedString(struct __ecereNameSpace__ecere__com__Instance * module, char *  string, char *  stringAndContext);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern struct Declarator * GetFuncDecl(struct Declarator * decl);

extern void FreeType(struct Type * type);

extern void FreeExternal(struct External * external);

extern struct Context * globalContext;

extern struct __ecereNameSpace__ecere__sys__OldList *  excludedSymbols;

extern struct Declarator * CopyDeclarator(struct Declarator * declarator);

extern struct __ecereNameSpace__ecere__sys__OldList *  CopyList(struct __ecereNameSpace__ecere__sys__OldList *  source, void *  (* )(void * ));

extern struct Specifier * CopySpecifier(struct Specifier * spec);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(struct __ecereNameSpace__ecere__sys__OldList * this, void *  prevItem, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

struct External * ProcessClassFunction(struct __ecereNameSpace__ecere__com__Class * owningClass, struct ClassFunction * func, struct __ecereNameSpace__ecere__sys__OldList * defs, struct External * after, unsigned int makeStatic)
{
struct Identifier * id = GetDeclId(func->declarator);
struct Type * type = (((void *)0));
struct Symbol * symbol;
struct External * external = (((void *)0));

if(defs && func->declarator)
{
struct FunctionDefinition * function = (((void *)0));
struct Symbol * propSymbol;
int symid = func->declarator->symbol->id;
int symidCode = func->declarator->symbol->idCode;

if(inCompiler)
{
if(!func->specifiers)
func->specifiers = MkList();
if(makeStatic)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*func->specifiers), (((void *)0)), MkSpecifier(STATIC));
}
propSymbol = func->declarator->symbol;
ReplaceThisClassSpecifiers(func->specifiers, owningClass);
if(propSymbol->externalGet == (struct External *)func)
func->declarator->symbol = (((void *)0));
else if(propSymbol->externalSet == (struct External *)func)
{
func->declarator->symbol = (((void *)0));
symid++;
}
else if(propSymbol->externalIsSet == (struct External *)func)
{
func->declarator->symbol = (((void *)0));
symid += 2;
}
{
function = MkFunction(func->specifiers, func->declarator, (((void *)0)));
function->propSet = func->propSet;
ProcessFunctionBody(function, func->body);
external = MkExternalFunction(function);
external->symbol = func->declarator->symbol;
external->function->_class = func->_class;
}
symbol = func->declarator->symbol;
symbol->id = symid;
symbol->idCode = symidCode;
if(!func->dontMangle)
{
struct __ecereNameSpace__ecere__com__Method * method = func->declarator->symbol->method;

func->declarator->symbol->methodExternal = external;
if(method && method->symbol)
((struct Symbol *)method->symbol)->methodCodeExternal = external;
if(method && method->type == 1)
{
struct Type * methodDataType;

ProcessMethodType(method);
methodDataType = method->dataType;
type = symbol->type;
if(!type->staticMethod && !type->thisClass && !type->thisClassTemplate)
{
if(method->dataType->thisClassTemplate)
{
if(owningClass->templateArgs)
{
struct __ecereNameSpace__ecere__com__ClassTemplateArgument * arg = FindTemplateArg(owningClass, method->dataType->thisClassTemplate);

type->byReference = method->dataType->byReference;
methodDataType = ProcessTypeString(method->dataTypeString, 0x0);
type->thisClass = methodDataType->thisClass = arg ? FindClass((*arg).dataTypeString) : (((void *)0));
}
}
else if(method->dataType->staticMethod)
type->staticMethod = 0x1;
else if(method->dataType->thisClass)
{
type->thisClass = method->dataType->thisClass;
type->byReference = method->dataType->byReference;
}
else
{
if(!owningClass->symbol)
owningClass->symbol = FindClass(owningClass->fullName);
type->thisClass = owningClass->symbol;
type->extraParam = 0x1;
}
}
yylloc = func->loc;
if(!MatchTypes(type, methodDataType, (((void *)0)), owningClass, method->_class, 0x1, 0x1, 0x1, 0x0))
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Incompatible virtual function %s\n", (((void *)0))), method->name);
}
else
{
struct Type * typeParam;
struct Declarator * funcDecl = GetFuncDecl(func->declarator);

if(funcDecl->function.parameters)
{
struct TypeName * param = (*funcDecl->function.parameters).first;

for(typeParam = methodDataType->params.first; typeParam; typeParam = typeParam->next)
{
if(typeParam->classObjectType)
{
param->classObjectType = typeParam->classObjectType;
if(param->declarator && param->declarator->symbol)
param->declarator->symbol->type->classObjectType = typeParam->classObjectType;
}
param = param->next;
}
}
}
if(methodDataType != method->dataType)
FreeType(methodDataType);
}
else
{
type = symbol->type;
if(!type->staticMethod && !type->thisClass)
{
if(owningClass && !owningClass->symbol)
owningClass->symbol = FindClass(owningClass->fullName);
type->thisClass = owningClass ? FindClass(owningClass->fullName) : (((void *)0));
}
}
}
else
{
if(symbol->type && !symbol->type->staticMethod && !symbol->type->thisClass)
{
if(!owningClass->symbol)
owningClass->symbol = FindClass(owningClass->fullName);
symbol->type->thisClass = owningClass->symbol;
}
if(propSymbol->externalSet == (struct External *)func && propSymbol->_property && propSymbol->_property->conversion)
{
if(symbol->type->thisClass && symbol->type->classObjectType != 1)
{
if(owningClass->type != 1)
symbol->type->thisClass = (((void *)0));
}
}
if(propSymbol->externalGet == (struct External *)func)
{
propSymbol->externalGet = external;
}
else if(propSymbol->externalSet == (struct External *)func)
{
propSymbol->externalSet = external;
}
else if(propSymbol->externalIsSet == (struct External *)func)
{
propSymbol->externalIsSet = external;
}
else
{
}
}
if(inCompiler)
{
if(func->body)
{
func->declarator = (((void *)0));
func->specifiers = (((void *)0));
func->body = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(defs, after, external);
}
else
{
struct __ecereNameSpace__ecere__com__Method * method = func->declarator->symbol->method;

if(method && method->symbol)
((struct Symbol *)method->symbol)->methodCodeExternal = (((void *)0));
func->declarator = (((void *)0));
func->specifiers = (((void *)0));
FreeExternal(external);
}
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(defs, after, external);
external->function->declarator = CopyDeclarator(external->function->declarator);
external->function->specifiers = CopyList(external->function->specifiers, CopySpecifier);
external->function->body = (((void *)0));
}
}
return external;
}

extern struct Statement * MkCompoundStmt(struct __ecereNameSpace__ecere__sys__OldList * declarations, struct __ecereNameSpace__ecere__sys__OldList * statements);

extern void ListAdd(struct __ecereNameSpace__ecere__sys__OldList * list, void *  item);

extern struct Declaration * MkDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators);

extern struct __ecereNameSpace__ecere__sys__OldList *  MkListOne(void *  item);

extern struct Specifier * MkSpecifierName(char *  name);

extern struct InitDeclarator * MkInitDeclarator(struct Declarator * declarator, struct Initializer * initializer);

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

extern struct Identifier * MkIdentifier(char *  string);

extern struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator);

extern char *  __ecereNameSpace__ecere__sys__GetLastDirectory(char *  string, char *  output);

extern char *  outputFile;

extern unsigned int __ecereNameSpace__ecere__sys__StripExtension(char *  string);

extern void __ecereNameSpace__ecere__sys__ChangeCh(char *  string, char ch1, char ch2);

extern int sprintf(char * , char * , ...);

extern struct Declarator * MkDeclaratorFunction(struct Declarator * declarator, struct __ecereNameSpace__ecere__sys__OldList * parameters);

extern struct __ecereNameSpace__ecere__sys__OldList *  ast;

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

void CreateRegisterModuleBody()
{
void * __ecereTemp1;

if(!registerModuleBody && inCompiler)
{
char registerName[1024], moduleName[274];
struct __ecereNameSpace__ecere__sys__OldList * specifiers;
struct Declarator * declarator;
struct TypeName * moduleParam;

registerModuleBody = MkCompoundStmt(MkList(), MkList());
registerModuleBody->compound.context = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ((struct Context *)__ecereTemp1)->parent = globalContext, ((struct Context *)__ecereTemp1));
ListAdd(registerModuleBody->compound.declarations, MkDeclaration(MkListOne(MkSpecifierName("ecere::com::Class")), MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("class")), (((void *)0))))));
specifiers = MkList();
ListAdd(specifiers, MkSpecifier(VOID));
moduleParam = MkTypeName(MkListOne(MkSpecifierName("Module")), MkDeclaratorIdentifier(MkIdentifier("module")));
__ecereNameSpace__ecere__sys__GetLastDirectory(outputFile, moduleName);
__ecereNameSpace__ecere__sys__StripExtension(moduleName);
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '.', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, ' ', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '-', '_');
sprintf(registerName, "__ecereRegisterModule_%s", moduleName);
declarator = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(registerName)), MkListOne(moduleParam));
{
struct FunctionDefinition * function = MkFunction(specifiers, declarator, (((void *)0)));

ProcessFunctionBody(function, registerModuleBody);
function->declMode = 0;
if(!ast)
ast = MkList();
ListAdd(ast, (registerModuleExternal = MkExternalFunction(function)));
}
}
if(!unregisterModuleBody && inCompiler)
{
char registerName[1024], moduleName[274];
struct __ecereNameSpace__ecere__sys__OldList * specifiers;
struct Declarator * declarator;
struct TypeName * moduleParam;

unregisterModuleBody = MkCompoundStmt(MkList(), MkList());
unregisterModuleBody->compound.context = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ((struct Context *)__ecereTemp1)->parent = globalContext, ((struct Context *)__ecereTemp1));
specifiers = MkList();
ListAdd(specifiers, MkSpecifier(VOID));
moduleParam = MkTypeName(MkListOne(MkSpecifierName("Module")), MkDeclaratorIdentifier(MkIdentifier("module")));
__ecereNameSpace__ecere__sys__GetLastDirectory(outputFile, moduleName);
__ecereNameSpace__ecere__sys__StripExtension(moduleName);
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '.', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, ' ', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '-', '_');
sprintf(registerName, "__ecereUnregisterModule_%s", moduleName);
declarator = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(registerName)), MkListOne(moduleParam));
{
struct FunctionDefinition * function = MkFunction(specifiers, declarator, (((void *)0)));

ProcessFunctionBody(function, unregisterModuleBody);
function->declMode = 0;
if(!ast)
ast = MkList();
ListAdd(ast, (unregisterModuleExternal = MkExternalFunction(function)));
}
}
}

extern struct Expression * MkExpIdentifier(struct Identifier * id);

extern struct Expression * MkExpConstant(char *  string);

extern char *  QMkString(char *  source);

extern struct Expression * MkExpString(char *  string);

extern char *  strcpy(char * , const char * );

extern void FullClassNameCat(char *  output, char *  className, unsigned int includeTemplateParams);

extern char *  strcat(char * , const char * );

extern void MangleClassName(char *  className);

extern struct Statement * MkExpressionStmt(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern struct Expression * MkExpOp(struct Expression * exp1, int op, struct Expression * exp2);

extern struct Expression * MkExpCall(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * arguments);

extern struct Expression * MkExpMember(struct Expression * expression, struct Identifier * member);

extern struct Expression * MkExpCast(struct TypeName * typeName, struct Expression * expression);

extern struct Declarator * MkDeclaratorPointer(struct Pointer * pointer, struct Declarator * declarator);

extern struct Pointer * MkPointer(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Pointer * pointer);

extern struct Expression * CopyExpression(struct Expression * exp);

extern struct Statement * MkIfStmt(struct __ecereNameSpace__ecere__sys__OldList * exp, struct Statement * statement, struct Statement * elseStmt);

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

extern int ComputeTypeSize(struct Type * type);

extern struct Context * curContext;

extern struct Context * PushContext(void);

extern struct Initializer * MkInitializerAssignment(struct Expression * exp);

extern void PopContext(struct Context * ctx);

extern struct Expression * MkExpCondition(struct Expression * cond, struct __ecereNameSpace__ecere__sys__OldList * expressions, struct Expression * elseExp);

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

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(struct __ecereNameSpace__ecere__sys__BinaryTree * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first;

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(struct __ecereNameSpace__ecere__sys__BTNode * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__sys__BTNode_next;

void RegisterMembersAndProperties(struct __ecereNameSpace__ecere__com__Class * regClass, unsigned int isMember, char * className, struct Statement * statement)
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember = isMember ? (struct __ecereNameSpace__ecere__com__DataMember *)regClass : (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Property * prop;
struct Expression * exp;
struct Statement * stmt;
char dataMemberSize[16];
unsigned int lastOffset = 0;
int privateID = 0;
unsigned int privateMembers = 0x0;

sprintf(dataMemberSize, "%d", sizeof(struct __ecereNameSpace__ecere__com__DataMember *));
if(!isMember)
{
for(prop = regClass->conversions.first; prop; prop = prop->next)
{
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();
char name[1024];

ListAdd(args, MkExpIdentifier(MkIdentifier(className)));
ListAdd(args, MkExpConstant("0"));
{
char * string = QMkString(prop->dataTypeString);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
if(prop->Set)
{
strcpy(name, "__ecereProp_");
FullClassNameCat(name, regClass->fullName, 0x0);
strcat(name, "_Set_");
FullClassNameCat(name, prop->name, 0x1);
MangleClassName(name);
ListAdd(args, MkExpIdentifier(MkIdentifier(name)));
}
else
ListAdd(args, MkExpConstant("0"));
if(prop->Get)
{
strcpy(name, "__ecereProp_");
FullClassNameCat(name, regClass->fullName, 0x0);
strcat(name, "_Get_");
FullClassNameCat(name, prop->name, 0x1);
MangleClassName(name);
ListAdd(args, MkExpIdentifier(MkIdentifier(name)));
}
else
ListAdd(args, MkExpConstant("0"));
switch(prop->memberAccess)
{
case 3:
ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
break;
case 2:
ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
break;
case 1:
default:
ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
break;
}
strcpy(name, "__ecereProp_");
FullClassNameCat(name, regClass->fullName, 0x0);
strcat(name, "_");
FullClassNameCat(name, prop->name, 0x1);
MangleClassName(name);
stmt = MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(name)), '=', MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddProperty")), args))));
ListAdd(registerModuleBody->compound.statements, stmt);
}
}
for(member = isMember ? dataMember->members.first : regClass->membersAndProperties.first; member; member = member->next)
{
if(member->isProperty)
{
prop = (struct __ecereNameSpace__ecere__com__Property *)member;
{
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();
char name[1024], nameM[1024];
char * string = QMkString(prop->name);

ListAdd(args, MkExpIdentifier(MkIdentifier(className)));
ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
{
char * string = QMkString(prop->dataTypeString);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
if(prop->Set)
{
strcpy(name, "__ecereProp_");
FullClassNameCat(name, regClass->fullName, 0x0);
strcat(name, "_Set_");
FullClassNameCat(name, prop->name, 0x1);
MangleClassName(name);
ListAdd(args, MkExpIdentifier(MkIdentifier(name)));
}
else
ListAdd(args, MkExpConstant("0"));
if(prop->Get)
{
strcpy(name, "__ecereProp_");
FullClassNameCat(name, regClass->fullName, 0x0);
strcat(name, "_Get_");
FullClassNameCat(name, prop->name, 0x1);
MangleClassName(name);
ListAdd(args, MkExpIdentifier(MkIdentifier(name)));
}
else
ListAdd(args, MkExpConstant("0"));
switch(prop->memberAccess)
{
case 3:
ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
break;
case 2:
ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
break;
case 1:
default:
ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
break;
}
strcpy(name, "__ecereProp_");
FullClassNameCat(name, regClass->fullName, 0x0);
strcat(name, "_");
FullClassNameCat(name, prop->name, 0x1);
MangleClassName(name);
strcpy(nameM, "__ecerePropM_");
FullClassNameCat(nameM, regClass->fullName, 0x0);
strcat(nameM, "_");
FullClassNameCat(nameM, prop->name, 0x1);
MangleClassName(nameM);
if(prop->dataTypeString)
{
stmt = MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(nameM)), '=', MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddProperty")), args))));
}
else
{
stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddProperty")), args)));
}
ListAdd(registerModuleBody->compound.statements, stmt);
if(prop->IsSet)
{
char name[1024];

strcpy(name, "__ecereProp_");
FullClassNameCat(name, regClass->fullName, 0x1);
strcat(name, "_IsSet_");
FullClassNameCat(name, prop->name, 0x0);
MangleClassName(name);
stmt = MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier(nameM)), MkIdentifier("IsSet")), '=', MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpIdentifier(MkIdentifier(name))))));
ListAdd(registerModuleBody->compound.statements, stmt);
}
if(((struct Symbol *)prop->symbol)->propCategory)
{
stmt = MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier(nameM)), MkIdentifier("category")), '=', CopyExpression(((struct Symbol *)prop->symbol)->propCategory))));
ListAdd(registerModuleBody->compound.statements, stmt);
}
if(prop->dataTypeString)
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();

ListAdd(list, MkExpOp(MkExpIdentifier(MkIdentifier(name)), '=', MkExpIdentifier(MkIdentifier(nameM))));
ListAdd(list, MkExpOp(MkExpIdentifier(MkIdentifier(nameM)), '=', MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpConstant("0"))));
stmt = MkIfStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("module")), MkIdentifier("application")), EQ_OP, MkExpMember(MkExpIdentifier(MkIdentifier("__thisModule")), MkIdentifier("application")))), MkExpressionStmt(list), (((void *)0)));
ListAdd(registerModuleBody->compound.statements, stmt);
stmt = MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(nameM)), '=', MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpConstant("0")))));
ListAdd(unregisterModuleBody->compound.statements, stmt);
}
}
}
else if(member->type == 0 && !isMember && regClass->type == 2)
{
struct __ecereNameSpace__ecere__com__BitMember * bitMember = (struct __ecereNameSpace__ecere__com__BitMember *)member;
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

ListAdd(args, MkExpIdentifier(MkIdentifier(className)));
{
char * string = QMkString(bitMember->name);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
{
char * string = QMkString(bitMember->dataTypeString);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
{
char string[256];

sprintf(string, "%d", bitMember->size);
ListAdd(args, (exp = MkExpConstant(string)));
}
{
char string[256];

sprintf(string, "%d", bitMember->pos);
ListAdd(args, (exp = MkExpConstant(string)));
}
switch(member->memberAccess)
{
case 3:
ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
break;
case 2:
ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
break;
case 1:
default:
ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
break;
}
stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddBitMember")), args)));
ListAdd(statement->compound.statements, stmt);
}
else if(member->memberAccess == 1 || (member->type == 0 && !member->dataTypeString))
{
struct __ecereNameSpace__ecere__sys__OldList * args;

if(privateMembers)
{
unsigned int offset = member->offset - lastOffset;

args = MkList();
ListAdd(args, MkExpIdentifier(MkIdentifier(className)));
{
char string[200];

sprintf(string, "\"__ecerePrivateData%d\"", privateID++);
ListAdd(args, MkExpString(string));
}
{
char string[200];

sprintf(string, "\"byte[%d]\"", offset);
ListAdd(args, MkExpString(string));
}
{
char string[256];

sprintf(string, "%d", offset);
ListAdd(args, (exp = MkExpConstant(string)));
}
ListAdd(args, (exp = MkExpConstant("1")));
ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier(isMember ? "eMember_AddDataMember" : "eClass_AddDataMember")), args)));
ListAdd(statement->compound.statements, stmt);
privateMembers = 0x0;
}
if(member->type == 0)
{
if(!member->dataType)
member->dataType = ProcessTypeString(member->dataTypeString, 0x0);
ComputeTypeSize(member->dataType);
args = MkList();
ListAdd(args, MkExpIdentifier(MkIdentifier(className)));
{
char * string = QMkString(member->name);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
{
char * string = QMkString(member->dataTypeString);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
{
char string[256];

sprintf(string, "%d", member->dataType->size);
ListAdd(args, (exp = MkExpConstant(string)));
}
{
char string[256];

sprintf(string, "%d", member->dataType->alignment);
ListAdd(args, (exp = MkExpConstant(string)));
}
switch(member->memberAccess)
{
case 3:
ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
break;
case 2:
ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
break;
case 1:
default:
ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
break;
}
stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier(isMember ? "eMember_AddDataMember" : "eClass_AddDataMember")), args)));
ListAdd(statement->compound.statements, stmt);
lastOffset = member->offset + member->dataType->size;
}
else
{
static int memberCount = 0;
struct Context * context;
struct Statement * compound;
char memberName[256];

sprintf(memberName, "dataMember%d", memberCount);
memberCount++;
curContext = statement->compound.context;
context = PushContext();
args = MkListOne(MkExpIdentifier(MkIdentifier((member->type == 1) ? "unionMember" : "structMember")));
switch(member->memberAccess)
{
case 3:
ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
break;
case 2:
ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
break;
case 1:
default:
ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
break;
}
compound = MkCompoundStmt(MkListOne(MkDeclaration(MkListOne(MkSpecifierName("DataMember")), MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(memberName)), MkInitializerAssignment(MkExpCall(MkExpIdentifier(MkIdentifier("eMember_New")), args)))))), MkList());
compound->compound.context = context;
args = MkList();
ListAdd(args, MkExpIdentifier(MkIdentifier(className)));
ListAdd(args, MkExpIdentifier(MkIdentifier(memberName)));
RegisterMembersAndProperties((struct __ecereNameSpace__ecere__com__Class *)member, 0x1, memberName, compound);
if(isMember)
stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("eMember_AddMember")), args)));
else
stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddMember")), args)));
ListAdd(compound->compound.statements, stmt);
PopContext(context);
ListAdd(statement->compound.statements, compound);
memberCount--;
lastOffset = member->offset + member->memberOffset;
}
}
else
privateMembers = 0x1;
}
if(!isMember)
{
struct __ecereNameSpace__ecere__com__ClassProperty * classProperty;

for(prop = regClass->membersAndProperties.first; prop; prop = prop->next)
{
if(prop->isProperty && prop->isWatchable)
{
struct __ecereNameSpace__ecere__sys__OldList * args;
char name[1024], nameM[1024];

strcpy(name, "__ecereProp_");
FullClassNameCat(name, regClass->fullName, 0x1);
strcat(name, "_");
FullClassNameCat(name, prop->name, 0x0);
MangleClassName(name);
strcpy(nameM, "__ecerePropM_");
FullClassNameCat(nameM, regClass->fullName, 0x1);
strcat(nameM, "_");
FullClassNameCat(nameM, prop->name, 0x0);
MangleClassName(nameM);
args = MkListOne(MkExpCondition(MkExpIdentifier(MkIdentifier(nameM)), MkListOne(MkExpIdentifier(MkIdentifier(nameM))), MkExpIdentifier(MkIdentifier(name))));
stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("eProperty_Watchable")), args)));
ListAdd(registerModuleBody->compound.statements, stmt);
}
}
for(classProperty = (struct __ecereNameSpace__ecere__com__ClassProperty *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&regClass->classProperties); classProperty; classProperty = (struct __ecereNameSpace__ecere__com__ClassProperty *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)classProperty)))
{
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();
char name[1024];
char * string = QMkString(classProperty->name);

ListAdd(args, MkExpIdentifier(MkIdentifier(className)));
ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
{
char * string = QMkString(classProperty->dataTypeString);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
if(classProperty->Set)
{
strcpy(name, "__ecereClassProp_");
FullClassNameCat(name, regClass->fullName, 0x1);
strcat(name, "_Set_");
strcat(name, classProperty->name);
MangleClassName(name);
ListAdd(args, MkExpIdentifier(MkIdentifier(name)));
}
else
ListAdd(args, MkExpConstant("0"));
if(classProperty->Get)
{
strcpy(name, "__ecereClassProp_");
FullClassNameCat(name, regClass->fullName, 0x1);
strcat(name, "_Get_");
strcat(name, classProperty->name);
MangleClassName(name);
ListAdd(args, MkExpIdentifier(MkIdentifier(name)));
}
else
ListAdd(args, MkExpConstant("0"));
stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddClassProperty")), args)));
ListAdd(registerModuleBody->compound.statements, stmt);
}
}
}

extern struct External * curExternal;

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

void GetNameSpaceString(struct __ecereNameSpace__ecere__com__NameSpace * ns, char * string)
{
if(ns->parent)
GetNameSpaceString(ns->parent, string);
if(ns->name)
{
strcat(string, ns->name);
strcat(string, "::");
}
}

extern unsigned int parsingType;

extern void ProcessExpressionType(struct Expression * exp);

extern void ComputeExpression(struct Expression * exp);

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

extern struct Operand GetOperand(struct Expression * exp);

extern void __ecereNameSpace__ecere__com__eEnum_AddFixedValue(struct __ecereNameSpace__ecere__com__Class * _class, char *  string, int value);

extern int __ecereNameSpace__ecere__com__eEnum_AddValue(struct __ecereNameSpace__ecere__com__Class * _class, char *  string);

extern struct ClassFunction * MkClassFunction(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct Specifier * _class, struct Declarator * decl, struct __ecereNameSpace__ecere__sys__OldList * declList);

extern void ProcessClassFunctionBody(struct ClassFunction * func, struct Statement * body);

extern struct External * MkExternalDeclaration(struct Declaration * declaration);

extern struct ClassDef * MkClassDefFunction(struct ClassFunction * function);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Instance * privateModule;

extern void FreePropertyWatch(struct PropertyWatch * watcher);

extern char *  sourceFile;

extern struct Type * ProcessType(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

extern void PrintType(struct Type * type, char *  string, unsigned int printName, unsigned int fullName);

extern struct Expression * MkExpTypeSize(struct TypeName * typeName);

extern struct Specifier * MkStructOrUnion(int type, struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * definitions);

extern unsigned int DummyMethod(void);

extern void DeclareMethod(struct __ecereNameSpace__ecere__com__Method * method, char *  name);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

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

extern char *  StringFromSpecDecl(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

extern int strlen(const char * );

extern struct MemberInit * MkMemberInit(struct __ecereNameSpace__ecere__sys__OldList * ids, struct Initializer * initializer);

extern char *  PrintUInt64(uint64 result);

extern struct Expression * MkExpInstance(struct Instantiation * inst);

extern struct Instantiation * MkInstantiation(struct Specifier * _class, struct Expression * exp, struct __ecereNameSpace__ecere__sys__OldList * members);

extern struct MembersInit * MkMembersInitList(struct __ecereNameSpace__ecere__sys__OldList * dataMembers);

int __ecereVMethodID_class_OnGetString;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__TemplateMemberType;

static void ProcessClass(int classType, struct __ecereNameSpace__ecere__sys__OldList * definitions, struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * baseSpecs, struct __ecereNameSpace__ecere__sys__OldList * enumValues, struct __ecereNameSpace__ecere__sys__OldList * defs, struct External * external, int declMode)
{
void * __ecereTemp1;
struct ClassDef * def;
struct __ecereNameSpace__ecere__com__Class * regClass = symbol->registered;

if(regClass)
{
classType = regClass->type;
if(classType == 4 && enumValues && (inCompiler || !buildingECERECOMModule))
{
struct Enumerator * e;

for(e = enumValues->first; e; e = e->next)
{
if(e->exp)
{
struct Type * destType = (destType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), destType->kind = 3, destType->refCount = 1, destType);

e->exp->destType = destType;
parsingType = 0x1;
ProcessExpressionType(e->exp);
parsingType = 0x0;
if(!e->exp->expType)
{
destType->kind = 8;
destType->_class = symbol;
ProcessExpressionType(e->exp);
}
ComputeExpression(e->exp);
if(e->exp->isConstant && e->exp->type == 2)
{
struct Operand op = GetOperand(e->exp);
int value;

switch(op.kind)
{
case 1:
value = op.c;
break;
case 2:
value = op.s;
break;
default:
value = op.i;
}
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(regClass, e->id->string, value);
}
else
__ecereNameSpace__ecere__com__eEnum_AddValue(regClass, e->id->string);
}
else
__ecereNameSpace__ecere__com__eEnum_AddValue(regClass, e->id->string);
}
}
if(definitions != (((void *)0)))
{
if(inCompiler)
{
for(def = definitions->first; def; def = def->next)
{
if(def->type == 4 && def->propertyWatch)
{
struct PropertyWatch * propWatch = def->propertyWatch;
struct ClassFunction * func;
char watcherName[1024];
struct Identifier * propID;
struct Statement * stmt = MkExpressionStmt(MkList());
struct Declarator * decl;

sprintf(watcherName, "__ecerePropertySelfWatcher_%d", propWatcherID++);
for(propID = (*propWatch->properties).first; propID; propID = propID->next)
{
strcat(watcherName, "_");
strcat(watcherName, propID->string);
}
decl = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(watcherName)), MkListOne(MkTypeName(MkListOne(MkSpecifier(VOID)), (((void *)0)))));
func = MkClassFunction(MkListOne(MkSpecifier(VOID)), (((void *)0)), decl, (((void *)0)));
ProcessClassFunctionBody(func, propWatch->compound);
decl->symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->id = symbol->id, ((struct Symbol *)__ecereTemp1)->idCode = symbol->idCode, ((struct Symbol *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), decl->symbol);
func->id = symbol->id;
func->idCode = symbol->idCode;
func->dontMangle = 0x1;
{
struct External * externalDecl = MkExternalDeclaration((((void *)0)));
struct Declaration * decl;
struct __ecereNameSpace__ecere__sys__OldList * specifiers = MkList();

ListAdd(specifiers, MkSpecifier(STATIC));
ListAdd(specifiers, MkSpecifier(VOID));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), curExternal->prev, externalDecl);
decl = MkDeclaration(specifiers, MkListOne(MkInitDeclarator(MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(watcherName)), MkListOne(MkTypeName(MkListOne(MkSpecifierName(regClass->fullName)), (((void *)0))))), (((void *)0)))));
externalDecl->declaration = decl;
if(decl->symbol && !decl->symbol->methodExternal)
{
decl->symbol->methodExternal = externalDecl;
decl->symbol->id = symbol->id;
decl->symbol->idCode = symbol->idCode;
}
}
propWatch->compound = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(definitions, (((void *)0)), MkClassDefFunction(func));
stmt->type = 3;
stmt->expressions = MkList();
for(propID = (*propWatch->properties).first; propID; propID = propID->next)
{
struct __ecereNameSpace__ecere__com__Property * prop = __ecereNameSpace__ecere__com__eClass_FindProperty(regClass, propID->string, privateModule);

if(prop)
{
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

ListAdd(args, MkExpIdentifier(MkIdentifier("class")));
ListAdd(args, MkExpString(QMkString(propID->string)));
ListAdd(args, MkExpIdentifier(MkIdentifier(watcherName)));
ListAdd(stmt->expressions, MkExpCall(MkExpIdentifier(MkIdentifier("eProperty_SelfWatch")), args));
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Property %s not found in class %s\n", (((void *)0))), propID->string, regClass->fullName);
}
FreePropertyWatch(def->propertyWatch);
def->propertyWatch = (struct PropertyWatch *)stmt;
}
}
}
for(def = definitions->first; def; def = def->next)
{
if(def->type == 0)
{
ProcessClassFunction(regClass, def->function, defs, external->prev, declMode == 3);
}
}
}
if(inCompiler && symbol->id != (((int)0x7fffffff)) && regClass)
{
struct Statement * stmt;
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();
struct __ecereNameSpace__ecere__com__Method * method;
struct Expression * exp;
char * registerFunction = (((void *)0));
int inheritanceAccess = 1;

CreateRegisterModuleBody();
curExternal = registerModuleExternal;
switch(regClass->type)
{
case 1:
ListAdd(args, MkExpIdentifier(MkIdentifier("structClass")));
break;
case 2:
ListAdd(args, MkExpIdentifier(MkIdentifier("bitClass")));
break;
case 4:
ListAdd(args, MkExpIdentifier(MkIdentifier("enumClass")));
break;
case 5:
ListAdd(args, MkExpIdentifier(MkIdentifier("noHeadClass")));
break;
case 3:
ListAdd(args, MkExpIdentifier(MkIdentifier("unitClass")));
break;
case 0:
ListAdd(args, MkExpIdentifier(MkIdentifier("normalClass")));
break;
}
{
char nameSpace[1024] = "";
char className[1024] = "";
char * string;

GetNameSpaceString(regClass->nameSpace, nameSpace);
if(declMode == 3)
{
__ecereNameSpace__ecere__sys__GetLastDirectory(sourceFile, className);
__ecereNameSpace__ecere__sys__ChangeCh(className, '.', '_');
strcat(className, "}");
}
strcat(className, nameSpace);
strcat(className, regClass->name);
string = QMkString(className);
ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
if(baseSpecs != (((void *)0)))
{
struct Type * baseType = ProcessType(baseSpecs, (((void *)0)));

if(baseType->kind != 9 && baseType->kind != 10)
{
char baseName[1024] = "";
char * string;

if(baseType->kind == 8 && baseType->_class && baseType->_class->isStatic)
{
__ecereNameSpace__ecere__sys__GetLastDirectory(sourceFile, baseName);
__ecereNameSpace__ecere__sys__ChangeCh(baseName, '.', '_');
strcat(baseName, "}");
strcat(baseName, baseType->_class->string);
}
else
PrintType(baseType, baseName, 0x0, 0x1);
string = QMkString(baseName);
ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
else
ListAdd(args, MkExpConstant("0"));
FreeType(baseType);
if(((struct Specifier *)baseSpecs->first)->type == 0 && ((struct Specifier *)baseSpecs->first)->specifier == PRIVATE)
inheritanceAccess = 2;
}
else
ListAdd(args, MkExpConstant("0"));
if(regClass->type == 1 || regClass->type == 0 || regClass->type == 5)
{
struct __ecereNameSpace__ecere__com__DataMember * member = (((void *)0));

{
struct __ecereNameSpace__ecere__com__Class * base;

for(base = regClass->base; base && base->type != 1000; base = base->next)
{
for(member = base->membersAndProperties.first; member; member = member->next)
if(!member->isProperty)
break;
if(member)
break;
}
}
if(regClass->type == 1 && symbol->declaredStruct && member)
{
char baseStructName[1024];

baseStructName[0] = (char)0;
strcpy(baseStructName, (regClass->base->templateClass ? regClass->base->templateClass : regClass->base)->fullName);
ListAdd(args, MkExpOp(MkExpTypeSize(MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(symbol->structName), (((void *)0)))), (((void *)0)))), '-', MkExpTypeSize(MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(baseStructName), (((void *)0)))), (((void *)0))))));
}
else
ListAdd(args, symbol->declaredStruct ? MkExpTypeSize(MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(symbol->structName), (((void *)0)))), (((void *)0)))) : MkExpConstant("0"));
}
else
{
ListAdd(args, MkExpConstant("0"));
}
{
char classDataStructName[1024];

strcpy(classDataStructName, "__ecereClassData_");
FullClassNameCat(classDataStructName, symbol->string, 0x0);
ListAdd(args, symbol->classData ? MkExpTypeSize(MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(classDataStructName), (((void *)0)))), (((void *)0)))) : MkExpConstant("0"));
}
if(regClass->type == 0 || regClass->type == 5)
{
ListAdd(args, symbol->needConstructor ? MkExpIdentifier(MkIdentifier(symbol->constructorName)) : MkExpConstant("0"));
ListAdd(args, symbol->needDestructor ? MkExpIdentifier(MkIdentifier(symbol->destructorName)) : MkExpConstant("0"));
}
else
{
ListAdd(args, MkExpConstant("0"));
ListAdd(args, MkExpConstant("0"));
}
ListAdd(args, MkExpIdentifier(MkIdentifier("module")));
switch(declMode)
{
case 3:
ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
break;
case 2:
ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
break;
case 1:
default:
ListAdd(args, MkExpIdentifier(MkIdentifier(buildingECERECOMModule ? "baseSystemAccess" : "publicAccess")));
break;
}
switch(inheritanceAccess)
{
case 2:
ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
break;
case 1:
default:
ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
break;
}
registerFunction = "eSystem_RegisterClass";
stmt = MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier("class")), '=', MkExpCall((exp = MkExpIdentifier(MkIdentifier(registerFunction))), args))));
ListAdd(registerModuleBody->compound.statements, stmt);
stmt = MkIfStmt(MkListOne(MkExpOp(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("module")), MkIdentifier("application")), EQ_OP, MkExpMember(MkExpIdentifier(MkIdentifier("__thisModule")), MkIdentifier("application"))), AND_OP, MkExpIdentifier(MkIdentifier("class")))), MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(symbol->className)), '=', MkExpIdentifier(MkIdentifier("class"))))), (((void *)0)));
ListAdd(registerModuleBody->compound.statements, stmt);
if(external && external->type == 2 && external->_class->deleteWatchable)
{
args = MkListOne(MkExpIdentifier(MkIdentifier("class")));
stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("eClass_DestructionWatchable")), args)));
ListAdd(registerModuleBody->compound.statements, stmt);
}
if(regClass->base)
{
struct __ecereNameSpace__ecere__com__Class * base = regClass->base;
int c;

for(c = 0; c < base->vTblSize; c++)
{
struct Symbol * method = (struct Symbol *)regClass->_vTbl[c];

if((void *)method != DummyMethod && base->_vTbl[c] != (void *)method)
{
struct External * external = method->methodExternal;
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();
struct Identifier * id = external->function ? GetDeclId(external->function->declarator) : (((void *)0));

ListAdd(args, MkExpIdentifier(MkIdentifier("class")));
{
char * string = QMkString(method->method->name);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
ListAdd(args, MkExpConstant("0"));
ListAdd(args, (exp = MkExpIdentifier(MkIdentifier(id->string))));
ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
exp->expType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddMethod")), args)));
ListAdd(registerModuleBody->compound.statements, stmt);
}
}
}
{
int c;

for(c = regClass->base ? regClass->base->vTblSize : 0; c < regClass->vTblSize; c++)
{
for(method = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&regClass->methods); method; method = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)method)))
{
if(method->type == 1 && method->_class == regClass && method->vid == c)
{
char name[1024];
struct Expression * exp;
struct External * external = method->symbol ? ((struct Symbol *)method->symbol)->methodCodeExternal : (((void *)0));
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();
struct Identifier * id = (external && external->function) ? GetDeclId(external->function->declarator) : (((void *)0));

ListAdd(args, MkExpIdentifier(MkIdentifier("class")));
{
char * string = QMkString(method->name);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
{
char * string = QMkString(method->dataTypeString);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
if(id && external->function->body)
{
ListAdd(args, (exp = MkExpIdentifier(MkIdentifier(id->string))));
exp->expType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
}
else
{
ListAdd(args, (exp = MkExpConstant("0")));
}
switch(method->memberAccess)
{
case 3:
ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
break;
case 2:
ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
break;
case 1:
default:
ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
break;
}
strcpy(name, "__ecereVMethodID_");
FullClassNameCat(name, method->_class->fullName, 0x0);
strcat(name, "_");
strcat(name, method->name);
exp = MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddVirtualMethod")), args);
stmt = MkExpressionStmt(MkListOne(exp));
DeclareMethod(method, name);
ListAdd(registerModuleBody->compound.statements, stmt);
}
}
}
}
for(method = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&regClass->methods); method; method = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)method)))
{
if(method->type == 1 && method->_class == regClass)
;
else if(method->memberAccess == 1 || !method->dataTypeString)
{
struct External * external = method->symbol ? ((struct Symbol *)method->symbol)->methodCodeExternal : (((void *)0));
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();
struct Identifier * id = (external && external->function) ? GetDeclId(external->function->declarator) : (((void *)0));

ListAdd(args, MkExpIdentifier(MkIdentifier("class")));
{
char * string = QMkString(method->name);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
{
char * string = QMkString(method->dataTypeString);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
if(id && external->function->body)
{
ListAdd(args, (exp = MkExpIdentifier(MkIdentifier(id->string))));
exp->expType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
}
else
{
ListAdd(args, (exp = MkExpConstant("0")));
}
switch(method->memberAccess)
{
case 3:
ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
break;
case 2:
ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
break;
case 1:
default:
ListAdd(args, MkExpIdentifier(MkIdentifier("publicAccess")));
break;
}
stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddMethod")), args)));
ListAdd(registerModuleBody->compound.statements, stmt);
}
}
RegisterMembersAndProperties(regClass, 0x0, "class", registerModuleBody);
if(classType == 4)
{
struct __ecereNameSpace__ecere__sys__NamedLink * value;
struct __ecereNameSpace__ecere__com__Class * enumClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "enum");
struct __ecereNameSpace__ecere__com__EnumClassData * e = (regClass ? ((void *)(((char *)regClass->data) + enumClass->offsetClass)) : (((void *)0)));

for(value = e->values.first; value; value = value->next)
{
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

ListAdd(args, MkExpIdentifier(MkIdentifier("class")));
{
char * string = QMkString(value->name);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
{
char temp[1024];

sprintf(temp, "%d", value->data);
ListAdd(args, MkExpConstant(temp));
}
stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("eEnum_AddFixedValue")), args)));
ListAdd(registerModuleBody->compound.statements, stmt);
}
}
if(symbol->templateParams)
{
struct TemplateParameter * param;

for(param = (*symbol->templateParams).first; param; param = param->next)
{
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

ListAdd(args, MkExpIdentifier(MkIdentifier("class")));
{
char * string = QMkString(param->identifier->string);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
ListAdd(args, MkExpIdentifier(MkIdentifier((param->type == 0) ? "type" : ((param->type == 1) ? "identifier" : "expression"))));
switch(param->type)
{
case 0:
case 2:
{
char * typeString = param->dataType ? StringFromSpecDecl(param->dataType->specifiers, param->dataType->decl) : (((void *)0));
char * string = QMkString(typeString);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(typeString), typeString = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
break;
}
case 1:
{
char memberTypeString[132] = "TemplateMemberType::";
unsigned int needClass = 0x1;

((char *  (*)(struct __ecereNameSpace__ecere__com__Class *, void *, char *  tempString, void *  fieldData, unsigned int *  needClass))__ecereClass___ecereNameSpace__ecere__com__TemplateMemberType->_vTbl[__ecereVMethodID_class_OnGetString])(__ecereClass___ecereNameSpace__ecere__com__TemplateMemberType, &param->memberType, memberTypeString + strlen(memberTypeString), (((void *)0)), &needClass);
ListAdd(args, MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpIdentifier(MkIdentifier(memberTypeString))));
break;
}
}
if(param->defaultArgument)
{
struct __ecereNameSpace__ecere__sys__OldList * members = MkList();

switch(param->type)
{
case 0:
{
char * typeString = param->defaultArgument->templateDatatype ? StringFromSpecDecl(param->defaultArgument->templateDatatype->specifiers, param->defaultArgument->templateDatatype->decl) : (((void *)0));
char * string = QMkString(typeString);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*members), MkMemberInit(MkListOne(MkIdentifier("dataTypeString")), MkInitializerAssignment(MkExpString(string))));
(__ecereNameSpace__ecere__com__eSystem_Delete(typeString), typeString = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
break;
}
case 1:
{
char memberString[1024];
char * string;

memberString[0] = '\0';
if(param->defaultArgument->identifier->_class)
{
if(param->defaultArgument->identifier->_class->type == 8)
strcpy(memberString, param->defaultArgument->identifier->_class->templateParameter->identifier->string);
else if(param->defaultArgument->identifier->_class->name)
strcpy(memberString, param->defaultArgument->identifier->_class->name);
}
if(memberString[0])
strcat(memberString, "::");
strcat(memberString, param->defaultArgument->identifier->string);
string = QMkString(memberString);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*members), MkMemberInit(MkListOne(MkIdentifier("dataTypeString")), MkInitializerAssignment(MkExpString(string))));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
break;
}
case 2:
{
struct Operand op = 
{
0, 0, 0, 0, 
{
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
};
struct __ecereNameSpace__ecere__sys__OldList * ids = MkList();
char * ui64String;
char * string = (((void *)0));

op = GetOperand(param->defaultArgument->expression);
ui64String = PrintUInt64(op.ui64);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*ids), MkIdentifier("expression"));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*ids), MkIdentifier("ui64"));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*members), MkMemberInit(ids, MkInitializerAssignment(MkExpConstant(ui64String))));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(ui64String), ui64String = 0);
break;
}
}
ListAdd(args, MkExpInstance(MkInstantiation(MkSpecifierName("ClassTemplateArgument"), (((void *)0)), MkListOne(MkMembersInitList(members)))));
}
else
ListAdd(args, MkExpIdentifier(MkIdentifier("null")));
stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("eClass_AddTemplateParameter")), args)));
ListAdd(registerModuleBody->compound.statements, stmt);
}
stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("eClass_DoneAddingTemplateParameters")), MkListOne(MkExpIdentifier(MkIdentifier("class"))))));
ListAdd(registerModuleBody->compound.statements, stmt);
}
if(definitions != (((void *)0)))
{
for(def = definitions->first; def; def = def->next)
{
if(def->type == 4 && def->propertyWatch)
{
ListAdd(registerModuleBody->compound.statements, (struct Statement *)def->propertyWatch);
def->propertyWatch = (((void *)0));
}
else if(def->type == 5)
{
stmt = MkIfStmt(MkListOne(MkExpIdentifier(MkIdentifier("class"))), MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("class")), MkIdentifier("designerClass")), '=', MkExpString(QMkString(def->designer))))), (((void *)0)));
ListAdd(registerModuleBody->compound.statements, stmt);
}
else if(def->type == 6)
{
stmt = MkIfStmt(MkListOne(MkExpIdentifier(MkIdentifier("class"))), MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("class")), MkIdentifier("noExpansion")), '=', MkExpConstant("1")))), (((void *)0)));
ListAdd(registerModuleBody->compound.statements, stmt);
}
else if(def->type == 7)
{
stmt = MkIfStmt(MkListOne(MkExpIdentifier(MkIdentifier("class"))), MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("class")), MkIdentifier("fixed")), '=', MkExpConstant("1")))), (((void *)0)));
ListAdd(registerModuleBody->compound.statements, stmt);
if(regClass)
regClass->fixed = 0x1;
}
else if(def->type == 8)
{
stmt = MkIfStmt(MkListOne(MkExpIdentifier(MkIdentifier("class"))), MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("class")), MkIdentifier("defaultProperty")), '=', MkExpString(QMkString(def->defaultProperty->string))))), (((void *)0)));
ListAdd(registerModuleBody->compound.statements, stmt);
}
else if(def->type == 11)
{
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

ListAdd(args, MkExpIdentifier(MkIdentifier("class")));
ListAdd(args, MkExpString(QMkString(def->id->string)));
ListAdd(args, MkExpCast(MkTypeName(MkListOne(MkSpecifier(INT)), (((void *)0))), def->initializer->exp));
def->initializer->exp = (((void *)0));
stmt = MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eClass_SetProperty")), args)));
ListAdd(registerModuleBody->compound.statements, stmt);
}
}
}
}
}
}

extern int strcmp(const char * , const char * );

extern void PrintExpression(struct Expression * exp, char *  string);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void ProcessClassDefinitions()
{
struct External * external, * next;

CreateRegisterModuleBody();
if(ast)
{
for(external = (*ast).first; external; external = next)
{
next = external->next;
curExternal = external;
if(external->type == 2)
{
struct ClassDefinition * _class = external->_class;

if(_class->definitions)
{
ProcessClass(0, _class->definitions, _class->symbol, _class->baseSpecs, (((void *)0)), ast, external, _class->declMode);
}
if(inCompiler)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*ast), external);
FreeExternal(external);
}
}
else if(external->type == 0)
{
if(external->symbol && !external->symbol->type->thisClass)
external->symbol->type->staticMethod = 0x1;
if(inCompiler)
{
struct FunctionDefinition * function = external->function;
struct Statement * stmt;
struct __ecereNameSpace__ecere__sys__OldList * args;

if(!strcmp(function->declarator->symbol->string, "__on_register_module"))
{
ListAdd(registerModuleBody->compound.statements, function->body);
function->body->compound.context->parent = registerModuleBody->compound.context;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*ast), external);
function->body = (((void *)0));
FreeExternal(external);
continue;
}
if(function->declMode != 2 && function->declMode != 1)
continue;
args = MkList();
CreateRegisterModuleBody();
{
char * string = QMkString(function->declarator->symbol->string);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
{
char * string;
char type[1024] = "";

PrintType(function->declarator->symbol->type, type, 0x1, 0x1);
string = QMkString(type);
ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
{
ListAdd(args, MkExpIdentifier(MkIdentifier(function->declarator->symbol->string)));
}
ListAdd(args, MkExpIdentifier(MkIdentifier("module")));
switch(function->declMode)
{
case 3:
ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
break;
case 2:
ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
break;
case 1:
default:
ListAdd(args, MkExpIdentifier(MkIdentifier(buildingECERECOMModule ? "baseSystemAccess" : "publicAccess")));
break;
}
stmt = MkExpressionStmt(MkListOne(MkExpCall((MkExpIdentifier(MkIdentifier("eSystem_RegisterFunction"))), args)));
ListAdd(registerModuleBody->compound.statements, stmt);
}
}
else if(external->type == 1)
{
struct Declaration * declaration = external->declaration;

if(external->symbol)
{
if(external->symbol->type && external->symbol->type->kind == 11 && !external->symbol->type->thisClass)
external->symbol->type->staticMethod = 0x1;
}
if(external->symbol && declaration->type == 1)
{
if(declaration->specifiers)
{
struct Specifier * specifier;
unsigned int removeExternal = 0x0;

for(specifier = (*declaration->specifiers).first; specifier; specifier = specifier->next)
{
if((specifier->type == 2 || specifier->type == 3 || specifier->type == 4) && specifier->id && specifier->id->string && (declaration->declMode || specifier->baseSpecs || (specifier->type == 2 && specifier->definitions)))
{
struct Symbol * symbol = FindClass(specifier->id->string);

if(symbol)
{
int classType;

if(specifier->type == 2)
classType = 4;
else
classType = 1;
removeExternal = 0x1;
symbol->ctx = specifier->ctx;
specifier->ctx = (((void *)0));
ProcessClass(classType, specifier->definitions, symbol, specifier->baseSpecs, specifier->list, ast, external, declaration->declMode);
}
}
}
if(inCompiler && removeExternal)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*ast), external);
FreeExternal(external);
}
}
}
else if(declaration->type == 3)
{
if(inCompiler && declaration->declMode != 3)
{
struct Statement * stmt;
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

CreateRegisterModuleBody();
{
char * string = QMkString(declaration->id->string);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
{
char * string;
char type[1024] = "";

PrintExpression(declaration->exp, type);
string = QMkString(type);
ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
ListAdd(args, MkExpIdentifier(MkIdentifier("module")));
switch(declaration->declMode)
{
case 3:
ListAdd(args, MkExpIdentifier(MkIdentifier("staticAccess")));
break;
case 2:
ListAdd(args, MkExpIdentifier(MkIdentifier("privateAccess")));
break;
case 1:
default:
ListAdd(args, MkExpIdentifier(MkIdentifier(buildingECERECOMModule ? "baseSystemAccess" : "publicAccess")));
break;
}
stmt = MkExpressionStmt(MkListOne(MkExpCall((MkExpIdentifier(MkIdentifier("eSystem_RegisterDefine"))), args)));
ListAdd(registerModuleBody->compound.statements, stmt);
}
}
}
}
}
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

void __ecereRegisterModule_pass1(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetBuildingEcereCom", "void SetBuildingEcereCom(bool b)", SetBuildingEcereCom, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetBuildingEcereCom", "bool GetBuildingEcereCom(void)", GetBuildingEcereCom, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetBuildingEcereComModule", "void SetBuildingEcereComModule(bool b)", SetBuildingEcereComModule, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetBuildingEcereComModule", "bool GetBuildingEcereComModule(void)", GetBuildingEcereComModule, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessClassFunction", "External ProcessClassFunction(ecere::com::Class owningClass, ClassFunction func, ecere::sys::OldList defs, External after, bool makeStatic)", ProcessClassFunction, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CreateRegisterModuleBody", "void CreateRegisterModuleBody(void)", CreateRegisterModuleBody, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("RegisterMembersAndProperties", "void RegisterMembersAndProperties(ecere::com::Class regClass, bool isMember, char * className, Statement statement)", RegisterMembersAndProperties, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetNameSpaceString", "void GetNameSpaceString(ecere::com::NameSpace ns, char * string)", GetNameSpaceString, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessClassDefinitions", "void ProcessClassDefinitions(void)", ProcessClassDefinitions, module, 1);
}

void __ecereUnregisterModule_pass1(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

