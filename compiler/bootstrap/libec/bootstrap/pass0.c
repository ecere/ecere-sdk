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

struct Enumerator;

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

struct PropertyWatch;

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

void MangleClassName(char * className)
{
char output[1024];
int c, d = 0;
char ch;

for(c = 0; (ch = className[c]); c++)
{
if(ch == ' ')
output[d++] = '_';
else if(ch == '*')
{
output[d++] = '_';
output[d++] = 'P';
output[d++] = 'T';
output[d++] = 'R';
output[d++] = '_';
}
else if(ch == '<')
{
output[d++] = '_';
output[d++] = 'T';
output[d++] = 'P';
output[d++] = 'L';
output[d++] = '_';
}
else if(ch == '=')
{
output[d++] = '_';
output[d++] = 'E';
output[d++] = 'Q';
output[d++] = 'U';
output[d++] = '_';
}
else if(ch == '>')
{
output[d++] = '_';
}
else if(ch == ',')
{
output[d++] = '__';
}
else
output[d++] = ch;
}
output[d] = (char)0;
}

extern char *  strcat(char * , const char * );

extern int strlen(const char * );

void FullClassNameCat(char * output, char * className, unsigned int includeTemplateParams)
{
int c;
char ch;
int len;

for(c = 0; (ch = className[c]) && ch != '<'; c++)
{
if(ch == ':')
{
strcat(output, "__ecereNameSpace__");
break;
}
}
len = strlen(output);
for(c = 0; (ch = className[c]); c++)
{
if(ch == ':')
output[len++] = '_';
else if(ch == ' ')
output[len++] = '_';
else if(ch == '*')
{
output[len++] = '_';
output[len++] = 'P';
output[len++] = 'T';
output[len++] = 'R';
output[len++] = '_';
}
else if(ch == '=')
{
output[len++] = '_';
output[len++] = 'E';
output[len++] = 'Q';
output[len++] = 'U';
output[len++] = '_';
}
else if(ch == '<')
{
if(!includeTemplateParams)
break;
output[len++] = '_';
output[len++] = 'T';
output[len++] = 'P';
output[len++] = 'L';
output[len++] = '_';
}
else if(ch == '>')
{
output[len++] = '_';
}
else if(ch == ',')
{
output[len++] = '__';
}
else
output[len++] = ch;
}
output[len++] = (char)0;
}

extern int AddMembers(struct __ecereNameSpace__ecere__sys__OldList *  declarations, struct __ecereNameSpace__ecere__com__Class * _class, unsigned int isMember, unsigned int *  retSize, struct __ecereNameSpace__ecere__com__Class * topClass);

static void AddSimpleBaseMembers(struct __ecereNameSpace__ecere__sys__OldList * list, struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class * topClass)
{
if(_class->type != 1000)
AddMembers(list, _class, 0x0, (((void *)0)), topClass);
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

static unsigned int NameSpaceContained(struct __ecereNameSpace__ecere__com__NameSpace * ns, struct __ecereNameSpace__ecere__com__NameSpace * parent)
{
if(ns == parent)
return 0x1;
else if((*ns).parent)
return NameSpaceContained((*ns).parent, parent);
else
return 0x0;
}

extern void Compiler_Error(char *  format, ...);

extern char *  __ecereNameSpace__ecere__GetTranslatedString(struct __ecereNameSpace__ecere__com__Instance * module, char *  string, char *  stringAndContext);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

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

extern unsigned int ModuleAccess(struct __ecereNameSpace__ecere__com__Instance * searchIn, struct __ecereNameSpace__ecere__com__Instance * searchFor);

extern struct __ecereNameSpace__ecere__com__Instance * privateModule;

static void CheckPublicClass(struct Symbol * classSym, int access, char * word)
{
struct __ecereNameSpace__ecere__com__Class * regClass = classSym ? classSym->registered : (((void *)0));

if(regClass)
{
if(regClass->templateClass)
regClass = regClass->templateClass;
if(classSym->isStatic && access != 3)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Non-static %s making use of a static class\n", (((void *)0))), word);
}
else if(access == 1)
{
if(!NameSpaceContained(regClass->nameSpace, &((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Module *)(((char *)regClass->module + 12)))->application + 300)))->systemNameSpace))
{
if(NameSpaceContained(regClass->nameSpace, &((struct __ecereNameSpace__ecere__com__Module *)(((char *)regClass->module + 12)))->privateNameSpace) || !ModuleAccess(privateModule, regClass->module))
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Public %s making use of a private class\n", (((void *)0))), word);
}
}
}
}

static void CheckPublicTypeName(struct TypeName * type, int access)
{
if(type->qualifiers)
{
struct Specifier * spec;

for(spec = (*type->qualifiers).first; spec; spec = spec->next)
{
if(spec->type == 1)
{
struct Symbol * classSym = spec->symbol;

CheckPublicClass(classSym, access, "define");
}
}
}
}

static void CheckPublicExpression(struct Expression * exp, int access);

static void CheckPublicInitializer(struct Initializer * init, int access)
{
switch(init->type)
{
case 0:
CheckPublicExpression(init->exp, access);
break;
case 1:
{
struct Initializer * i;

for(i = (*init->list).first; i; i = i->next)
CheckPublicInitializer(i, access);
break;
}
}
}

static void CheckPublicExpression(struct Expression * exp, int access)
{
if(exp)
{
switch(exp->type)
{
case 0:
break;
case 2:
break;
case 3:
break;
case 4:
if(exp->op.exp1)
CheckPublicExpression(exp->op.exp1, access);
if(exp->op.exp2)
CheckPublicExpression(exp->op.exp2, access);
break;
case 5:
{
struct Expression * e;

for(e = (*exp->list).first; e; e = e->next)
CheckPublicExpression(e, access);
break;
}
case 6:
{
struct Expression * e;

CheckPublicExpression(exp->index.exp, access);
for(e = (*exp->index.index).first; e; e = e->next)
CheckPublicExpression(e, access);
break;
}
case 7:
{
struct Expression * e;

CheckPublicExpression(exp->call.exp, access);
if(exp->call.arguments)
{
for(e = (*exp->call.arguments).first; e; e = e->next)
CheckPublicExpression(e, access);
}
break;
}
case 8:
{
CheckPublicExpression(exp->member.exp, access);
break;
}
case 9:
{
CheckPublicExpression(exp->member.exp, access);
break;
}
case 10:
CheckPublicTypeName(exp->typeName, access);
break;
case 11:
{
struct Type * type = exp->expType;

CheckPublicTypeName(exp->cast.typeName, access);
if(exp->cast.exp)
CheckPublicExpression(exp->cast.exp, access);
break;
}
case 12:
{
struct Expression * e;

CheckPublicExpression(exp->cond.cond, access);
for(e = (*exp->cond.exp).first; e; e = e->next)
CheckPublicExpression(e, access);
CheckPublicExpression(exp->cond.elseExp, access);
break;
}
case 13:
case 28:
CheckPublicExpression(exp->_new.size, access);
break;
case 14:
case 29:
CheckPublicExpression(exp->_renew.size, access);
CheckPublicExpression(exp->_renew.exp, access);
break;
case 1:
{
struct MembersInit * members;

CheckPublicClass(exp->instance->_class->symbol, access, "define");
for(members = (*exp->instance->members).first; members; members = members->next)
{
if(members->type == 0)
{
struct MemberInit * member;

for(member = (*members->dataMembers).first; member; member = member->next)
{
CheckPublicInitializer(member->initializer, access);
}
}
}
break;
}
}
}
}

static void CheckPublicDataType(struct Type * type, int access, char * word)
{
if(type)
{
switch(type->kind)
{
case 8:
{
CheckPublicClass(type->_class, access, word);
break;
}
case 9:
case 10:
{
break;
}
case 11:
{
struct Type * param;

CheckPublicDataType(type->returnType, access, word);
for(param = type->params.first; param; param = param->next)
CheckPublicDataType(param, access, word);
CheckPublicClass(type->thisClass, access, word);
break;
}
case 12:
CheckPublicDataType(type->arrayType, access, word);
if(type->enumClass)
CheckPublicClass(type->enumClass, access, word);
break;
case 13:
{
CheckPublicDataType(type->type, access, word);
break;
}
case 16:
{
break;
}
case 19:
{
CheckPublicClass(type->_class, access, word);
break;
}
}
}
}

extern struct Identifier * GetDeclId(struct Declarator * decl);

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

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, char *  key);

static void CheckMembersDefinitions(struct __ecereNameSpace__ecere__com__Class * regClass, struct __ecereNameSpace__ecere__com__DataMember * member, struct __ecereNameSpace__ecere__sys__OldList * definitions, int access)
{
if(definitions != (((void *)0)))
{
struct ClassDef * def;

for(def = definitions->first; def; def = def->next)
{
if(def->type == 2)
{
struct Declaration * decl = def->decl;
struct __ecereNameSpace__ecere__com__DataMember * dataMember;

yylloc = def->loc;
if(decl->type == 0)
{
struct Declarator * d;

if(decl->declarators)
{
for(d = (*decl->declarators).first; d; d = d->next)
{
struct Identifier * declId = GetDeclId(d);

if(declId)
{
if(member)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&member->membersAlpha, declId->string);

dataMember = link ? link->data : (((void *)0));
}
else
dataMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(regClass, declId->string, privateModule, (((void *)0)), (((void *)0)));
if(dataMember)
CheckPublicDataType(dataMember->dataType, (def->memberAccess == 2) ? 2 : access, __ecereNameSpace__ecere__GetTranslatedString(__thisModule, "class data member", (((void *)0))));
}
}
}
else if(decl->specifiers)
{
struct Specifier * spec;

for(spec = (*decl->specifiers).first; spec; spec = spec->next)
{
if(spec->type == 3 || spec->type == 4)
{
if(spec->definitions && !spec->id)
{
CheckMembersDefinitions(regClass, member, spec->definitions, (def->memberAccess == 2) ? 2 : access);
}
else if(spec->definitions && spec->id)
{
if(member)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&member->membersAlpha, spec->id->string);

dataMember = link ? link->data : (((void *)0));
}
else
dataMember = __ecereNameSpace__ecere__com__eClass_FindDataMember(regClass, spec->id->string, privateModule, (((void *)0)), (((void *)0)));
if(dataMember)
CheckPublicDataType(dataMember->dataType, (def->memberAccess == 2) ? 2 : access, __ecereNameSpace__ecere__GetTranslatedString(__thisModule, "class data member", (((void *)0))));
}
}
}
}
}
else if(decl->type == 2)
{
CheckPublicClass(decl->inst->_class->symbol, (def->memberAccess == 2) ? 2 : access, __ecereNameSpace__ecere__GetTranslatedString(__thisModule, "class member instance", (((void *)0))));
}
}
}
}
}

extern unsigned int inCompiler;

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

extern struct Symbol * FindClass(char *  name);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  dataType, void *  setStmt, void *  getStmt, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

extern struct External * MkExternalDeclaration(struct Declaration * declaration);

extern void ListAdd(struct __ecereNameSpace__ecere__sys__OldList * list, void *  item);

extern struct ClassDef * MkClassDefDeclaration(struct Declaration * decl);

extern struct Specifier * MkSpecifierName(char *  name);

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

extern struct Identifier * MkIdentifier(char *  string);

extern struct Declaration * MkStructDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * declarators, struct Specifier * extStorage);

extern struct Expression * QMkExpId(char *  id);

extern void FreeDeclarator(struct Declarator * decl);

extern void FreeList(struct __ecereNameSpace__ecere__sys__OldList * list, void (* )(void * ));

extern void FreeSpecifier(struct Specifier * spec);

extern char *  __ecereNameSpace__ecere__sys__CopyString(char *  string);

extern struct Type * MkClassType(char *  name);

extern char *  strcpy(char * , const char * );

extern struct Specifier * MkStructOrUnion(int type, struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * definitions);

extern struct __ecereNameSpace__ecere__sys__OldList *  MkListOne(void *  item);

extern struct Declaration * MkDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators);

extern void FreeExternal(struct External * external);

extern int declMode;

extern char *  strstr(char * , const char * );

extern char *  sourceFile;

extern struct Specifier * MkSpecifier(int specifier);

extern struct InitDeclarator * MkInitDeclarator(struct Declarator * declarator, struct Initializer * initializer);

extern struct Declarator * MkDeclaratorPointer(struct Pointer * pointer, struct Declarator * declarator);

extern struct Pointer * MkPointer(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Pointer * pointer);

extern struct Context * PushContext(void);

extern struct Expression * MkExpOp(struct Expression * exp1, int op, struct Expression * exp2);

extern struct Expression * CopyExpression(struct Expression * exp);

extern struct Statement * MkExpressionStmt(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern struct Statement * MkCompoundStmt(struct __ecereNameSpace__ecere__sys__OldList * declarations, struct __ecereNameSpace__ecere__sys__OldList * statements);

extern void PopContext(struct Context * ctx);

extern struct Declarator * MkDeclaratorFunction(struct Declarator * declarator, struct __ecereNameSpace__ecere__sys__OldList * parameters);

extern struct __ecereNameSpace__ecere__sys__OldList *  excludedSymbols;

extern struct ClassFunction * MkClassFunction(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct Specifier * _class, struct Declarator * decl, struct __ecereNameSpace__ecere__sys__OldList * declList);

extern void ProcessClassFunctionBody(struct ClassFunction * func, struct Statement * body);

extern struct ClassDef * MkClassDefFunction(struct ClassFunction * function);

extern struct Specifier * CopySpecifier(struct Specifier * spec);

extern struct Expression * MkExpInstance(struct Instantiation * inst);

extern struct Expression * MkExpCall(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * arguments);

extern struct Expression * MkExpIdentifier(struct Identifier * id);

extern struct Expression * MkExpMember(struct Expression * expression, struct Identifier * member);

extern void FreeInitializer(struct Initializer * initializer);

extern struct Statement * MkReturnStmt(struct __ecereNameSpace__ecere__sys__OldList * exp);

extern struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator);

extern struct __ecereNameSpace__ecere__sys__OldList *  CopyList(struct __ecereNameSpace__ecere__sys__OldList *  source, void *  (* )(void * ));

extern struct Declarator * PlugDeclarator(struct Declarator * decl, struct Declarator * baseDecl);

extern struct __ecereNameSpace__ecere__sys__OldList *  ast;

extern int sprintf(char * , char * , ...);

extern struct Declarator * GetFuncDecl(struct Declarator * decl);

extern void ProcessMethodType(struct __ecereNameSpace__ecere__com__Method * method);

extern void FreeInitDeclarator(struct InitDeclarator * decl);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(struct __ecereNameSpace__ecere__sys__OldList * this, void *  prevItem, void *  item);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear(struct __ecereNameSpace__ecere__sys__OldList * this);

static void ProcessClass(int classType, struct __ecereNameSpace__ecere__sys__OldList * definitions, struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * baseSpecs, struct __ecereNameSpace__ecere__sys__OldList * enumValues, struct Location * loc, struct __ecereNameSpace__ecere__sys__OldList * defs, void * after, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators)
{
void * __ecereTemp1;
char structName[1024];
char className[1024];
char constructorName[1024];
char destructorName[1024];
struct __ecereNameSpace__ecere__com__Class * regClass;
struct ClassFunction * destructor = (((void *)0)), * constructor = (((void *)0));
unsigned int redefinition = 0x0;
unsigned int isUnion = classType == 6;
struct External * external = (((void *)0));
struct ClassDef * def;
struct __ecereNameSpace__ecere__sys__OldList * list;
struct __ecereNameSpace__ecere__sys__OldList * classDataList;

if(inCompiler)
{
list = MkList();
classDataList = MkList();
}
regClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, symbol->string);
if(!regClass)
return ;
classType = regClass->type;
if(inCompiler)
{
yylloc = *loc;
if(!NameSpaceContained(regClass->nameSpace, &((struct __ecereNameSpace__ecere__com__Module *)(((char *)regClass->module + 12)))->privateNameSpace) && regClass->inheritanceAccess == 1)
{
if(!regClass->base->symbol)
regClass->base->symbol = FindClass(regClass->base->fullName);
CheckPublicClass(regClass->base->symbol, 1, __ecereNameSpace__ecere__GetTranslatedString(__thisModule, "class", (((void *)0))));
}
else if(!symbol->isStatic && regClass->base)
{
if(!regClass->base->symbol)
regClass->base->symbol = FindClass(regClass->base->fullName);
CheckPublicClass(regClass->base->symbol, 2, __ecereNameSpace__ecere__GetTranslatedString(__thisModule, "class", (((void *)0))));
}
}
if(definitions != (((void *)0)))
{
for(def = definitions->first; def; def = def->next)
{
if(def->type == 13)
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__Method * method;

if((prop = __ecereNameSpace__ecere__com__eClass_FindProperty(regClass, def->id->string, privateModule)))
{
__ecereNameSpace__ecere__com__eClass_AddProperty(regClass, def->id->string, (((void *)0)), (((void *)0)), (((void *)0)), def->memberAccess);
}
else if((member = __ecereNameSpace__ecere__com__eClass_FindDataMember(regClass, def->id->string, privateModule, (((void *)0)), (((void *)0)))))
{
__ecereNameSpace__ecere__com__eClass_AddDataMember(regClass, def->id->string, (((void *)0)), 0, 0, def->memberAccess);
}
else if((method = __ecereNameSpace__ecere__com__eClass_FindMethod(regClass, def->id->string, privateModule)))
{
__ecereNameSpace__ecere__com__eClass_AddMethod(regClass, def->id->string, (((void *)0)), (((void *)0)), def->memberAccess);
}
else
{
yylloc = def->loc;
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Couldn't find member %s to override\n", (((void *)0))), def->id->string);
}
}
}
}
if(inCompiler)
{
external = MkExternalDeclaration((((void *)0)));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(defs, after, external);
curExternal = external;
curExternal->symbol = symbol;
}
if((classType == 1 || classType == 5) && inCompiler)
{
AddSimpleBaseMembers(list, regClass->base, regClass);
}
if(definitions != (((void *)0)))
{
if(inCompiler)
{
if(!NameSpaceContained(regClass->nameSpace, &((struct __ecereNameSpace__ecere__com__Module *)(((char *)regClass->module + 12)))->privateNameSpace))
CheckMembersDefinitions(regClass, (((void *)0)), definitions, 1);
else if(!symbol->isStatic)
CheckMembersDefinitions(regClass, (((void *)0)), definitions, 2);
}
for(def = definitions->first; def; def = def->next)
{
if(def->type == 2)
{
struct Declaration * decl = def->decl;

if(decl->type == 0)
{
if(inCompiler && classType != 2)
{
ListAdd(list, MkClassDefDeclaration(decl));
def->decl = (((void *)0));
}
}
else if(decl->type == 2)
{
struct Instantiation * inst = decl->inst;
struct Expression * exp = inst->exp;
struct Symbol * classSym;

if(exp)
{
struct __ecereNameSpace__ecere__sys__OldList * specifiers = MkList();
struct Declarator * d;

ListAdd(specifiers, MkSpecifierName(inst->_class->name));
d = MkDeclaratorIdentifier(MkIdentifier(exp->identifier->string));
if(inCompiler)
{
struct __ecereNameSpace__ecere__sys__OldList * declarators = MkList();

ListAdd(declarators, d);
decl = MkStructDeclaration(specifiers, declarators, (((void *)0)));
ListAdd(list, MkClassDefDeclaration(decl));
exp->type = 8;
exp->member.member = exp->identifier;
exp->member.exp = QMkExpId("this");
exp->member.memberType = 3;
exp->member.thisPtr = 0x1;
}
else
{
FreeDeclarator(d);
FreeList(specifiers, FreeSpecifier);
}
}
classSym = inst->_class->symbol;
if(classSym && classSym->registered && (classSym->registered->type == 1 || classSym->registered->type == 2 || classSym->registered->type == 3))
{
if(inst->members && (*inst->members).count)
symbol->needConstructor = 0x1;
}
else
{
symbol->needConstructor = 0x1;
symbol->needDestructor = 0x1;
}
}
}
else if(def->type == 9)
{
struct Declaration * decl = def->decl;

if(decl->type == 0)
{
if(inCompiler && classType != 2)
{
ListAdd(classDataList, MkClassDefDeclaration(decl));
def->decl = (((void *)0));
}
}
}
else if(def->type == 1)
symbol->needConstructor = 0x1;
else if(def->type == 4)
symbol->needConstructor = 0x1;
else if(def->type == 0)
{
struct ClassFunction * func = def->function;

if(func->isDestructor)
{
if(destructor)
{
yylloc = *loc;
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "redefinition of destructor for class %s\n", (((void *)0))), symbol->string);
}
else
{
symbol->needDestructor = 0x1;
destructor = func;
if(!inCompiler && func->body)
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(regClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&func->body->compound.context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
}
}
}
if(func->isConstructor)
{
if(constructor)
{
yylloc = *loc;
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "redefinition of constructor for class %s\n", (((void *)0))), symbol->string);
}
else
{
symbol->needConstructor = 0x1;
constructor = func;
if(!inCompiler && func->body)
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(regClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&func->body->compound.context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
}
}
}
}
}
}
if(inCompiler)
{
external->symbol = (((void *)0));
if((*list).count)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList(), * declarators = (initDeclarators != (((void *)0))) ? initDeclarators : MkList();

initDeclarators = (((void *)0));
strcpy(structName, symbol->string);
symbol->structName = __ecereNameSpace__ecere__sys__CopyString(structName);
ListAdd(specs, MkStructOrUnion(3, MkIdentifier(structName), isUnion ? MkListOne(MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkStructOrUnion(4, (((void *)0)), list)), (((void *)0)), (((void *)0))))) : list));
external->symbol = symbol;
symbol->structExternal = external;
external->declaration = MkDeclaration(specs, declarators);
after = external;
symbol->declaredStruct = 0x1;
}
else
{
curExternal = external->prev;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(defs, external);
FreeExternal(external);
(__ecereNameSpace__ecere__com__eSystem_Delete(list), list = 0);
}
if((*classDataList).count)
{
char classDataStructName[1024];
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct External * external;

strcpy(classDataStructName, "__ecereClassData_");
FullClassNameCat(classDataStructName, symbol->string, 0x0);
declMode = 0;
ListAdd(specs, MkStructOrUnion(3, MkIdentifier(classDataStructName), classDataList));
external = MkExternalDeclaration(MkDeclaration(specs, (((void *)0))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(defs, after, external);
after = external;
symbol->classData = 0x1;
}
else
(__ecereNameSpace__ecere__com__eSystem_Delete(classDataList), classDataList = 0);
}
if(inCompiler)
{
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList(), * declarators = MkList();

strcpy(className, "__ecereClass_");
FullClassNameCat(className, symbol->string, 0x1);
MangleClassName(className);
symbol->className = __ecereNameSpace__ecere__sys__CopyString(className);
if(!strstr(sourceFile, ".main.ec"))
ListAdd(specs, MkSpecifier(STATIC));
ListAdd(specs, MkStructOrUnion(3, MkIdentifier("__ecereNameSpace__ecere__com__Class"), (((void *)0))));
ListAdd(declarators, MkInitDeclarator(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(MkIdentifier(className))), (((void *)0))));
symbol->methodExternal = MkExternalDeclaration(MkDeclaration(specs, declarators));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(defs, after, symbol->methodExternal);
after = symbol->methodExternal;
}
if(symbol->needDestructor)
{
struct ClassFunction * function;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;
struct Statement * body;
struct Context * context;
struct __ecereNameSpace__ecere__sys__OldList * declarations = (((void *)0)), * statements;

strcpy(destructorName, "__ecereDestructor_");
FullClassNameCat(destructorName, symbol->string, 0x0);
symbol->destructorName = __ecereNameSpace__ecere__sys__CopyString(destructorName);
ListAdd(specs, MkSpecifier(VOID));
context = PushContext();
statements = MkList();
if(definitions != (((void *)0)))
{
for(def = definitions->first; def; def = def->next)
{
if(def->type == 2 && def->decl && def->decl->type == 2)
{
struct Instantiation * inst = def->decl->inst;
struct Symbol * classSym = inst->_class->symbol;

if(inst->exp && (!classSym || !classSym->registered || classSym->registered->type == 0))
{
struct Expression * exp = MkExpOp((((void *)0)), DELETE, CopyExpression(inst->exp));

ListAdd(statements, MkExpressionStmt(MkListOne(exp)));
}
if(inst->exp && (!classSym || !classSym->registered || classSym->registered->type == 5))
{
struct Expression * exp = MkExpOp((((void *)0)), DELETE, CopyExpression(inst->exp));

ListAdd(statements, MkExpressionStmt(MkListOne(exp)));
}
}
}
}
if(destructor && destructor->body)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*statements), (((void *)0)), destructor->body);
destructor->body->compound.context->parent = context;
destructor->body = (((void *)0));
}
body = MkCompoundStmt(declarations, statements);
PopContext(context);
body->compound.context = context;
decl = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(destructorName)), (((void *)0)));
decl->symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->id = symbol->id, ((struct Symbol *)__ecereTemp1)->idCode = symbol->idCode, ((struct Symbol *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), decl->symbol);
function = MkClassFunction(specs, (((void *)0)), decl, (((void *)0)));
ProcessClassFunctionBody(function, body);
function->id = symbol->id;
function->idCode = symbol->idCode;
function->dontMangle = 0x1;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(definitions, (((void *)0)), MkClassDefFunction(function));
}
if(symbol->needConstructor && inCompiler)
{
struct ClassFunction * function;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;
struct Statement * body;
struct Context * context;
struct __ecereNameSpace__ecere__sys__OldList * declarations = (((void *)0)), * statements;

strcpy(constructorName, "__ecereConstructor_");
FullClassNameCat(constructorName, symbol->string, 0x0);
symbol->constructorName = __ecereNameSpace__ecere__sys__CopyString(constructorName);
ListAdd(specs, MkSpecifierName("bool"));
context = PushContext();
statements = MkList();
if(definitions != (((void *)0)))
{
for(def = definitions->first; def; def = def->next)
{
if(def->type == 2 && def->decl && def->decl->type == 2)
{
struct Instantiation * inst = def->decl->inst;
struct Symbol * classSym = inst->_class->symbol;

if(inst->exp && (!classSym || !classSym->registered || classSym->registered->type == 0 || classSym->registered->type == 5))
{
struct Instantiation * newInst = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation);

*newInst = *inst;
newInst->members = (((void *)0));
newInst->exp = CopyExpression(inst->exp);
newInst->_class = CopySpecifier(inst->_class);
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpInstance(newInst))));
inst->built = 0x1;
}
if(inst->exp && (!classSym || !classSym->registered || classSym->registered->type == 0))
{
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_IncRef")), MkListOne(CopyExpression(inst->exp))))));
}
}
}
for(def = definitions->first; def; def = def->next)
{
if(def->type == 1 && def->defProperties)
{
struct MemberInit * propertyDef;

for(propertyDef = (*def->defProperties).first; propertyDef; propertyDef = propertyDef->next)
{
struct Expression * memberExp;
struct Identifier * id = (*propertyDef->identifiers).first;

if(id)
{
memberExp = MkExpMember(MkExpIdentifier(MkIdentifier("this")), id);
for(id = id->next; id; id = id->next)
memberExp = MkExpMember(memberExp, id);
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpOp(memberExp, '=', (propertyDef->initializer && propertyDef->initializer->type == 0 ? propertyDef->initializer->exp : (((void *)0)))))));
}
if(propertyDef->initializer)
{
if(propertyDef->initializer->type == 0)
propertyDef->initializer->exp = (((void *)0));
FreeInitializer(propertyDef->initializer);
}
propertyDef->initializer = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear((&*propertyDef->identifiers));
}
}
}
for(def = definitions->first; def; def = def->next)
{
if(def->type == 2 && def->decl && def->decl->type == 2)
{
struct Instantiation * inst = def->decl->inst;
struct Symbol * classSym = inst->_class->symbol;

if(inst->exp || (!classSym || !classSym->registered || classSym->registered->type == 0 || classSym->registered->type == 5))
{
if(!(inst->exp && (!classSym || !classSym->registered || classSym->registered->type == 0 || classSym->registered->type == 5)) || (inst->members && (*inst->members).count))
{
def->decl->inst = (((void *)0));
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpInstance(inst))));
}
}
}
}
}
if(constructor && constructor->body)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*statements), constructor->body);
constructor->body->compound.context->parent = context;
constructor->body = (((void *)0));
}
ListAdd(statements, MkReturnStmt(MkListOne(MkExpIdentifier(MkIdentifier("true")))));
body = MkCompoundStmt(declarations, statements);
PopContext(context);
body->compound.context = context;
decl = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(constructorName)), (((void *)0)));
decl->symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), decl->symbol);
decl->symbol->id = symbol->id;
decl->symbol->idCode = symbol->idCode;
function = MkClassFunction(specs, (((void *)0)), decl, (((void *)0)));
ProcessClassFunctionBody(function, body);
function->id = symbol->id;
function->idCode = symbol->idCode;
function->dontMangle = 0x1;
if(definitions != (((void *)0)))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(definitions, (((void *)0)), MkClassDefFunction(function));
}
}
if(definitions != (((void *)0)))
{
for(def = definitions->first; def; def = def->next)
{
if(def->type == 3 && def->propertyDef)
{
struct PropertyDef * propertyDef = def->propertyDef;
struct ClassDef * after = def;
struct ClassDef * newDef;

if(inCompiler)
{
yylloc = propertyDef->loc;
if(!NameSpaceContained(regClass->nameSpace, &((struct __ecereNameSpace__ecere__com__Module *)(((char *)regClass->module + 12)))->privateNameSpace) && def->memberAccess == 1)
CheckPublicDataType(propertyDef->symbol->type, 1, "class property");
else if(!symbol->isStatic)
CheckPublicDataType(propertyDef->symbol->type, 2, "class property");
}
{
{
struct ClassFunction * func;
struct Declarator * decl;
char name[1024];
struct __ecereNameSpace__ecere__sys__OldList * params;

if(propertyDef->getStmt && propertyDef->id)
{
strcpy(name, "__ecereProp_");
FullClassNameCat(name, symbol->string, 0x0);
strcat(name, "_Get_");
FullClassNameCat(name, propertyDef->id->string, 0x1);
MangleClassName(name);
params = MkList();
if(propertyDef->symbol->type && propertyDef->symbol->type->kind == 8 && propertyDef->symbol->type->_class && propertyDef->symbol->type->_class->registered && propertyDef->symbol->type->_class->registered->type == 1)
{
ListAdd(params, MkTypeName(CopyList(propertyDef->specifiers, CopySpecifier), MkDeclaratorIdentifier(MkIdentifier("value"))));
decl = PlugDeclarator(propertyDef->declarator, MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(name)), params));
func = MkClassFunction(MkListOne(MkSpecifier(VOID)), (((void *)0)), decl, (((void *)0)));
}
else
{
decl = PlugDeclarator(propertyDef->declarator, MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(name)), params));
func = MkClassFunction(CopyList(propertyDef->specifiers, CopySpecifier), (((void *)0)), decl, (((void *)0)));
}
ProcessClassFunctionBody(func, propertyDef->getStmt);
func->declarator->symbol = propertyDef->symbol;
propertyDef->symbol->externalGet = (struct External *)func;
func->dontMangle = 0x1;
newDef = MkClassDefFunction(func);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(definitions, after, newDef);
after = newDef;
if(inCompiler)
propertyDef->getStmt = (((void *)0));
else
func->body = (((void *)0));
}
if(propertyDef->setStmt && propertyDef->id)
{
struct __ecereNameSpace__ecere__sys__OldList * specifiers = MkList();

strcpy(name, "__ecereProp_");
FullClassNameCat(name, symbol->string, 0x0);
strcat(name, "_Set_");
FullClassNameCat(name, propertyDef->id->string, 0x1);
MangleClassName(name);
params = MkList();
ListAdd(params, MkTypeName(CopyList(propertyDef->specifiers, CopySpecifier), PlugDeclarator(propertyDef->declarator, MkDeclaratorIdentifier(MkIdentifier("value")))));
decl = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(name)), params);
if(!propertyDef->symbol->_property || !propertyDef->symbol->_property->conversion)
ListAdd(specifiers, MkSpecifier(VOID));
else
{
if(regClass->type == 1)
ListAdd(specifiers, MkSpecifier(VOID));
else
ListAdd(specifiers, MkSpecifierName(regClass->fullName));
}
func = MkClassFunction(specifiers, (((void *)0)), decl, (((void *)0)));
ProcessClassFunctionBody(func, propertyDef->setStmt);
func->dontMangle = 0x1;
func->declarator->symbol = propertyDef->symbol;
propertyDef->symbol->externalSet = (struct External *)func;
if(!propertyDef->conversion && regClass->type == 0)
func->propSet = propertyDef->symbol;
newDef = MkClassDefFunction(func);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(definitions, after, newDef);
after = newDef;
if(inCompiler)
propertyDef->setStmt = (((void *)0));
else
func->body = (((void *)0));
}
if(propertyDef->issetStmt && propertyDef->id)
{
struct __ecereNameSpace__ecere__sys__OldList * specifiers = MkList();

strcpy(name, "__ecereProp_");
FullClassNameCat(name, symbol->string, 0x0);
strcat(name, "_IsSet_");
FullClassNameCat(name, propertyDef->id->string, 0x1);
MangleClassName(name);
params = MkList();
decl = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(name)), params);
ListAdd(specifiers, MkSpecifierName("bool"));
func = MkClassFunction(specifiers, (((void *)0)), decl, (((void *)0)));
ProcessClassFunctionBody(func, propertyDef->issetStmt);
func->dontMangle = 0x1;
func->declarator->symbol = propertyDef->symbol;
propertyDef->symbol->externalIsSet = (struct External *)func;
newDef = MkClassDefFunction(func);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(definitions, after, newDef);
after = newDef;
if(inCompiler)
propertyDef->issetStmt = (((void *)0));
else
func->body = (((void *)0));
}
if(propertyDef->id && inCompiler)
{
struct __ecereNameSpace__ecere__com__Property * prop = __ecereNameSpace__ecere__com__eClass_FindProperty(symbol->registered, propertyDef->id->string, privateModule);
struct Declaration * decl;
struct External * external;
struct __ecereNameSpace__ecere__sys__OldList * specifiers = MkList();

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*specifiers), (((void *)0)), MkSpecifier(STATIC));
ListAdd(specifiers, MkSpecifierName("Property"));
strcpy(name, "__ecereProp_");
FullClassNameCat(name, symbol->string, 0x0);
strcat(name, "_");
FullClassNameCat(name, propertyDef->id->string, 0x1);
MangleClassName(name);
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();

ListAdd(list, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(name)), (((void *)0))));
strcpy(name, "__ecerePropM_");
FullClassNameCat(name, symbol->string, 0x0);
strcat(name, "_");
FullClassNameCat(name, propertyDef->id->string, 0x1);
MangleClassName(name);
ListAdd(list, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(name)), (((void *)0))));
decl = MkDeclaration(specifiers, list);
}
external = MkExternalDeclaration(decl);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), curExternal ? curExternal->prev : (((void *)0)), external);
external->symbol = propertyDef->symbol;
propertyDef->symbol->externalPtr = external;
if(inCompiler && prop && prop->symbol)
((struct Symbol *)prop->symbol)->externalPtr = external;
}
}
}
}
else if(def->type == 10 && def->propertyDef)
{
struct PropertyDef * propertyDef = def->propertyDef;
struct ClassDef * after = def;
struct ClassDef * newDef;

{
if(inCompiler)
{
yylloc = propertyDef->loc;
if(!NameSpaceContained(regClass->nameSpace, &((struct __ecereNameSpace__ecere__com__Module *)(((char *)regClass->module + 12)))->privateNameSpace))
CheckPublicDataType(propertyDef->symbol->type, 1, "classwide property");
else if(!symbol->isStatic)
CheckPublicDataType(propertyDef->symbol->type, 2, "classwide property");
}
{
struct ClassFunction * func;
struct Declarator * decl;
char name[1024];
struct __ecereNameSpace__ecere__sys__OldList * params;

if(propertyDef->getStmt && propertyDef->id)
{
struct Declarator * declId;

sprintf(name, "class::__ecereClassProp_");
FullClassNameCat(name, symbol->string, 0x0);
strcat(name, "_Get_");
strcat(name, propertyDef->id->string);
MangleClassName(name);
params = MkList();
declId = MkDeclaratorIdentifier(MkIdentifier(name));
if(propertyDef->symbol->type && propertyDef->symbol->type->kind == 8 && propertyDef->symbol->type->_class && propertyDef->symbol->type->_class->registered && propertyDef->symbol->type->_class->registered->type == 1)
{
ListAdd(params, MkTypeName(CopyList(propertyDef->specifiers, CopySpecifier), MkDeclaratorIdentifier(MkIdentifier("value"))));
decl = PlugDeclarator(propertyDef->declarator, MkDeclaratorFunction(declId, params));
func = MkClassFunction(MkListOne(MkSpecifier(VOID)), (((void *)0)), decl, (((void *)0)));
}
else
{
decl = PlugDeclarator(propertyDef->declarator, MkDeclaratorFunction(declId, params));
func = MkClassFunction(CopyList(propertyDef->specifiers, CopySpecifier), (((void *)0)), decl, (((void *)0)));
}
ProcessClassFunctionBody(func, propertyDef->getStmt);
func->declarator->symbol = propertyDef->symbol;
propertyDef->symbol->externalGet = (struct External *)func;
func->dontMangle = 0x1;
newDef = MkClassDefFunction(func);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(definitions, after, newDef);
after = newDef;
if(inCompiler)
propertyDef->getStmt = (((void *)0));
else
func->body = (((void *)0));
}
if(propertyDef->setStmt && propertyDef->id)
{
struct __ecereNameSpace__ecere__sys__OldList * specifiers = MkList();

strcpy(name, "class::__ecereClassProp_");
FullClassNameCat(name, symbol->string, 0x0);
strcat(name, "_Set_");
strcat(name, propertyDef->id->string);
MangleClassName(name);
params = MkList();
ListAdd(params, MkTypeName(CopyList(propertyDef->specifiers, CopySpecifier), PlugDeclarator(propertyDef->declarator, MkDeclaratorIdentifier(MkIdentifier("value")))));
decl = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(name)), params);
ListAdd(specifiers, MkSpecifier(VOID));
func = MkClassFunction(specifiers, (((void *)0)), decl, (((void *)0)));
ProcessClassFunctionBody(func, propertyDef->setStmt);
func->dontMangle = 0x1;
func->declarator->symbol = propertyDef->symbol;
propertyDef->symbol->externalSet = (struct External *)func;
newDef = MkClassDefFunction(func);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(definitions, after, newDef);
after = newDef;
if(inCompiler)
propertyDef->setStmt = (((void *)0));
else
func->body = (((void *)0));
}
}
}
}
else if(def->type == 0 && def->function->declarator)
{
struct ClassFunction * func = def->function;

func->_class = regClass;
if(!func->dontMangle)
{
struct Declarator * funcDecl = GetFuncDecl(func->declarator);
struct Identifier * id = GetDeclId(funcDecl);
struct __ecereNameSpace__ecere__com__Method * method;

if(!funcDecl->function.parameters || !(*funcDecl->function.parameters).first)
{
if(!funcDecl->function.parameters)
funcDecl->function.parameters = MkList();
ListAdd(funcDecl->function.parameters, MkTypeName(MkListOne(MkSpecifier(VOID)), (((void *)0))));
}
method = __ecereNameSpace__ecere__com__eClass_FindMethod(regClass, id->string, privateModule);
FreeSpecifier(id->_class);
id->_class = (((void *)0));
if(inCompiler && method)
{
char * newId = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (strlen(id->string) + strlen("__ecereMethod___ecereNameSpace__") + strlen(symbol->string) + 2));

newId[0] = '\0';
ProcessMethodType(method);
yylloc = def->loc;
if(!NameSpaceContained(regClass->nameSpace, &((struct __ecereNameSpace__ecere__com__Module *)(((char *)regClass->module + 12)))->privateNameSpace) && method->memberAccess == 1)
CheckPublicDataType(method->dataType, 1, "class method");
strcpy(newId, "__ecereMethod_");
FullClassNameCat(newId, symbol->string, 0x0);
strcat(newId, "_");
strcat(newId, id->string);
(__ecereNameSpace__ecere__com__eSystem_Delete(id->string), id->string = 0);
id->string = newId;
if(method->type != 1)
{
if(method->symbol)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(((struct Symbol *)method->symbol)->string), ((struct Symbol *)method->symbol)->string = 0);
((struct Symbol *)method->symbol)->string = __ecereNameSpace__ecere__sys__CopyString(newId);
}
}
}
}
}
}
}
if(initDeclarators != (((void *)0)))
FreeList(initDeclarators, FreeInitDeclarator);
}

extern struct Type * ProcessType(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

void PreProcessClassDefinitions()
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
struct ClassDefinition * _class = external->_class;

if(_class->definitions)
{
ProcessClass(0, _class->definitions, _class->symbol, _class->baseSpecs, (((void *)0)), &_class->loc, ast, external->prev, (((void *)0)));
}
}
else if(external->type == 1)
{
struct Declaration * declaration = external->declaration;

if(declaration->type == 1)
{
if(declaration->specifiers)
{
struct Specifier * specifier;

for(specifier = (*declaration->specifiers).first; specifier; specifier = specifier->next)
{
if((specifier->type == 2 || specifier->type == 3 || specifier->type == 4) && specifier->id && specifier->id->string && (declaration->declMode || specifier->baseSpecs || (specifier->type == 2 && specifier->definitions)))
{
struct Symbol * symbol = FindClass(specifier->id->string);

if(symbol)
{
struct __ecereNameSpace__ecere__sys__OldList * initDeclarators = (((void *)0));

if(inCompiler)
{
initDeclarators = declaration->declarators;
declaration->declarators = (((void *)0));
}
ProcessClass((specifier->type == 4) ? 6 : 0, specifier->definitions, symbol, specifier->baseSpecs, specifier->list, &specifier->loc, ast, external->prev, initDeclarators);
}
}
}
}
}
else if(inCompiler && declaration->type == 3)
{
yylloc = declaration->loc;
if(declaration->declMode == 1)
CheckPublicExpression(declaration->exp, 1);
else if(declaration->declMode != 3)
CheckPublicExpression(declaration->exp, 2);
}
}
else if(external->type == 3)
{
}
else if(inCompiler && external->type == 0)
{
yylloc = external->function->loc;
if(!external->function->type)
external->function->type = ProcessType(external->function->specifiers, external->function->declarator);
if(external->function->declMode == 1)
CheckPublicDataType(external->function->type, 1, "function");
else if(external->function->declMode != 3)
CheckPublicDataType(external->function->type, 2, "function");
}
}
}
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

void __ecereRegisterModule_pass0(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MangleClassName", "void MangleClassName(char * className)", MangleClassName, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FullClassNameCat", "void FullClassNameCat(char * output, char * className, bool includeTemplateParams)", FullClassNameCat, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PreProcessClassDefinitions", "void PreProcessClassDefinitions(void)", PreProcessClassDefinitions, module, 1);
}

void __ecereUnregisterModule_pass0(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

