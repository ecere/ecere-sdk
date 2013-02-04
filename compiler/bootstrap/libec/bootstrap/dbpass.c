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

struct Declarator;

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

struct DBTableDef
{
char *  name;
struct Symbol * symbol;
struct __ecereNameSpace__ecere__sys__OldList *  definitions;
int declMode;
} __attribute__ ((gcc_struct));

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

struct InitDeclarator
{
struct InitDeclarator * prev;
struct InitDeclarator * next;
struct Location loc;
struct Declarator * declarator;
struct Initializer * initializer;
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct));
struct __ecereNameSpace__ecere__sys__OldList *  items;
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBIndexItem;

struct DBIndexItem
{
struct DBIndexItem * prev;
struct DBIndexItem * next;
struct Identifier * id;
int order;
} __attribute__ ((gcc_struct));

extern YYSTYPE yylval;

extern struct Location yylloc;

static struct __ecereNameSpace__ecere__sys__OldList * tableStatements, * indexStatements, * addFieldStatements;

static int numIndexes;

static struct External * addAfter;

static void ProcessDeclaration(struct Declaration * decl);

extern struct __ecereNameSpace__ecere__com__Class * thisClass;

static void ProcessMemberInit(struct MemberInit * init);

static void ProcessClassFunction(struct ClassFunction * func);

static void ProcessProperty(struct PropertyDef * def);

static void ProcessStatement(struct Statement * stmt);

static void ProcessSpecifier(struct Specifier * spec)
{
switch(spec->type)
{
case 2:
case 3:
case 4:
{
if(spec->definitions)
{
struct ClassDef * def;

for(def = (*spec->definitions).first; def; def = def->next)
{
switch(def->type)
{
case 2:
ProcessDeclaration(def->decl);
break;
case 1:
{
struct MemberInit * init;

for(init = (*def->defProperties).first; init; init = init->next)
{
struct __ecereNameSpace__ecere__com__Class * oldThisClass = thisClass;

ProcessMemberInit(init);
}
break;
}
case 0:
ProcessClassFunction(def->function);
break;
case 3:
if(def->propertyDef)
{
ProcessProperty(def->propertyDef);
}
break;
case 4:
if(def->propertyWatch && def->propertyWatch->compound)
{
ProcessStatement(def->propertyWatch->compound);
}
break;
}
}
}
break;
}
}
}

static void ProcessIdentifier(struct Identifier * id)
{
}

static void ProcessInstance(struct Instantiation * inst);

extern int strlen(const char * );

extern void *  memcpy(void * , const void * , unsigned int size);

extern void __ecereNameSpace__ecere__sys__ChangeCh(char *  string, char ch1, char ch2);

extern int sprintf(char * , char * , ...);

extern void FreeExpContents(struct Expression * exp);

extern struct Identifier * MkIdentifier(char *  string);

extern struct Statement * MkCompoundStmt(struct __ecereNameSpace__ecere__sys__OldList * declarations, struct __ecereNameSpace__ecere__sys__OldList * statements);

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern struct Context * curContext;

extern struct Declaration * MkDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators);

extern struct __ecereNameSpace__ecere__sys__OldList *  MkListOne(void *  item);

extern struct Specifier * MkSpecifierName(char *  name);

extern struct InitDeclarator * MkInitDeclarator(struct Declarator * declarator, struct Initializer * initializer);

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

extern struct Initializer * MkInitializerAssignment(struct Expression * exp);

extern struct Expression * MkExpIdentifier(struct Identifier * id);

extern struct Specifier * MkSpecifier(int specifier);

extern struct Statement * MkIfStmt(struct __ecereNameSpace__ecere__sys__OldList * exp, struct Statement * statement, struct Statement * elseStmt);

extern struct Statement * MkReturnStmt(struct __ecereNameSpace__ecere__sys__OldList * exp);

extern struct Statement * MkExpressionStmt(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern struct Expression * MkExpOp(struct Expression * exp1, int op, struct Expression * exp2);

extern struct Expression * CopyExpression(struct Expression * exp);

extern struct Expression * MkExpCall(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * arguments);

extern struct Expression * MkExpMember(struct Expression * expression, struct Identifier * member);

extern struct Declarator * MkDeclaratorArray(struct Declarator * declarator, struct Expression * exp);

extern struct Expression * MkExpConstant(char *  string);

extern struct Initializer * MkInitializerList(struct __ecereNameSpace__ecere__sys__OldList * list);

extern void Compiler_Error(char *  format, ...);

extern char *  __ecereNameSpace__ecere__GetTranslatedString(struct __ecereNameSpace__ecere__com__Instance * module, char *  string, char *  stringAndContext);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

static void ProcessExpression(struct Expression * exp)
{
void * __ecereTemp1;

switch(exp->type)
{
case 13:
ProcessExpression(exp->_new.size);
break;
case 14:
ProcessExpression(exp->_renew.exp);
ProcessExpression(exp->_renew.size);
break;
case 2:
break;
case 0:
ProcessIdentifier(exp->identifier);
break;
case 1:
ProcessInstance(exp->instance);
break;
case 3:
break;
case 4:
if(exp->op.exp1)
{
ProcessExpression(exp->op.exp1);
}
if(exp->op.exp2)
{
ProcessExpression(exp->op.exp2);
}
break;
case 5:
{
struct Expression * expression;

for(expression = (*exp->list).first; expression; expression = expression->next)
{
ProcessExpression(expression);
}
break;
}
case 6:
{
struct Expression * expression;

ProcessExpression(exp->index.exp);
for(expression = (*exp->index.index).first; expression; expression = expression->next)
{
ProcessExpression(expression);
}
break;
}
case 7:
{
ProcessExpression(exp->call.exp);
if(exp->call.arguments)
{
struct Expression * expression;

for(expression = (*exp->call.arguments).first; expression; expression = expression->next)
{
ProcessExpression(expression);
}
}
break;
}
case 8:
ProcessExpression(exp->member.exp);
break;
case 9:
ProcessExpression(exp->member.exp);
break;
case 10:
break;
case 11:
ProcessExpression(exp->cast.exp);
break;
case 12:
ProcessExpression(exp->cond.cond);
{
struct Expression * expression;

for(expression = (*exp->cond.exp).first; expression; expression = expression->next)
{
ProcessExpression(expression);
}
}
ProcessExpression(exp->cond.elseExp);
break;
case 16:
break;
case 31:
{
char tableName[1024];
char name[1024];
int len = strlen(exp->db.table);

memcpy(tableName, exp->db.table + 1, len - 2);
tableName[len - 2] = (char)0;
__ecereNameSpace__ecere__sys__ChangeCh(tableName, ' ', '_');
sprintf(name, "__ecereDBField_%s_%s", tableName, exp->db.id->string);
FreeExpContents(exp);
exp->type = 0;
exp->identifier = MkIdentifier(name);
break;
}
case 32:
{
char tableName[1024];
char name[1024];
int len = strlen(exp->db.table);

memcpy(tableName, exp->db.table + 1, len - 2);
tableName[len - 2] = (char)0;
__ecereNameSpace__ecere__sys__ChangeCh(tableName, ' ', '_');
sprintf(name, "__ecereDBTable_%s", tableName);
FreeExpContents(exp);
exp->type = 0;
exp->identifier = MkIdentifier(name);
break;
}
case 33:
{
char tableName[1024];
char name[1024];
int len = strlen(exp->db.table);

memcpy(tableName, exp->db.table + 1, len - 2);
tableName[len - 2] = (char)0;
__ecereNameSpace__ecere__sys__ChangeCh(tableName, ' ', '_');
sprintf(name, "__ecereDBIndex_%s_%s", tableName, exp->db.id->string);
FreeExpContents(exp);
exp->type = 0;
exp->identifier = MkIdentifier(name);
break;
}
case 30:
{
if(tableStatements)
{
struct Statement * databaseOpenStmt = MkCompoundStmt(MkList(), MkList());
struct Statement * compound, * compound2;
struct Statement * ifDBStmt;
struct __ecereNameSpace__ecere__sys__OldList * args;
char numIndexesString[16];

databaseOpenStmt->compound.context = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ((struct Context *)__ecereTemp1)->parent = curContext, ((struct Context *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*databaseOpenStmt->compound.declarations), MkDeclaration(MkListOne(MkSpecifierName("Database")), MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("db")), (((void *)0))))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*databaseOpenStmt->compound.declarations), MkDeclaration(MkListOne(MkSpecifierName("bool")), MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("createNow")), MkInitializerAssignment(MkExpIdentifier(MkIdentifier("false")))))));
args = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkSpecifier(STATIC));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkSpecifierName("bool"));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*databaseOpenStmt->compound.declarations), MkDeclaration(args, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("initialized")), MkInitializerAssignment(MkExpIdentifier(MkIdentifier("false")))))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*databaseOpenStmt->compound.statements), MkIfStmt(MkListOne(MkExpIdentifier(MkIdentifier("initialized"))), MkReturnStmt(MkListOne(MkExpIdentifier(MkIdentifier("null")))), (((void *)0))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*databaseOpenStmt->compound.statements), MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier("initialized")), '=', MkExpIdentifier(MkIdentifier("true"))))));
args = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), CopyExpression(exp->dbopen.name));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpIdentifier(MkIdentifier("no")));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*databaseOpenStmt->compound.statements), MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier("db")), '=', MkExpCall(MkExpMember(CopyExpression(exp->dbopen.ds), MkIdentifier("OpenDatabase")), args)))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*databaseOpenStmt->compound.statements), MkIfStmt(MkListOne(MkExpOp((((void *)0)), '!', MkExpIdentifier(MkIdentifier("db")))), compound = MkCompoundStmt((((void *)0)), MkList()), (((void *)0))));
compound->compound.context = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ((struct Context *)__ecereTemp1)->parent = databaseOpenStmt->compound.context, ((struct Context *)__ecereTemp1));
args = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), exp->dbopen.name);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpIdentifier(MkIdentifier("create")));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*compound->compound.statements), MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier("db")), '=', MkExpCall(MkExpMember(exp->dbopen.ds, MkIdentifier("OpenDatabase")), args)))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*compound->compound.statements), MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier("createNow")), '=', MkExpIdentifier(MkIdentifier("true"))))));
exp->dbopen.name = (((void *)0));
exp->dbopen.ds = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*databaseOpenStmt->compound.statements), MkIfStmt(MkListOne(MkExpIdentifier(MkIdentifier("db"))), ifDBStmt = MkCompoundStmt(MkList(), MkList()), (((void *)0))));
ifDBStmt->compound.context = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ((struct Context *)__ecereTemp1)->parent = databaseOpenStmt->compound.context, ((struct Context *)__ecereTemp1));
sprintf(numIndexesString, "%d", numIndexes);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*ifDBStmt->compound.declarations), MkDeclaration(MkListOne(MkSpecifierName("FieldIndex")), MkListOne(MkInitDeclarator(MkDeclaratorArray(MkDeclaratorIdentifier(MkIdentifier("indexes")), MkExpConstant(numIndexesString)), MkInitializerList(MkListOne(MkInitializerList(MkListOne(MkInitializerAssignment(MkExpIdentifier(MkIdentifier("null")))))))))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*ifDBStmt->compound.statements), compound = MkCompoundStmt((((void *)0)), tableStatements));
compound->compound.context = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ((struct Context *)__ecereTemp1)->parent = ifDBStmt->compound.context, ((struct Context *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*ifDBStmt->compound.statements), (compound = MkCompoundStmt((((void *)0)), addFieldStatements), compound->compound.context = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ((struct Context *)__ecereTemp1)->parent = ifDBStmt->compound.context, ((struct Context *)__ecereTemp1)), compound));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*ifDBStmt->compound.statements), compound = MkCompoundStmt((((void *)0)), indexStatements));
compound->compound.context = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ((struct Context *)__ecereTemp1)->parent = ifDBStmt->compound.context, ((struct Context *)__ecereTemp1));
exp->type = 25;
exp->compound = databaseOpenStmt;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*databaseOpenStmt->compound.statements), MkExpressionStmt(MkListOne(MkExpIdentifier(MkIdentifier("db")))));
tableStatements = (((void *)0));
}
else
{
FreeExpContents(exp);
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "No database table defined in this module or database_open already used.\n", (((void *)0))));
exp->type = 16;
}
break;
}
}
}

static void ProcessStatement(struct Statement * stmt)
{
switch(stmt->type)
{
case 0:
ProcessStatement(stmt->labeled.stmt);
break;
case 1:
if(stmt->caseStmt.exp)
{
ProcessExpression(stmt->caseStmt.exp);
}
if(stmt->caseStmt.stmt)
{
ProcessStatement(stmt->caseStmt.stmt);
}
break;
case 14:
{
ProcessDeclaration(stmt->decl);
break;
}
case 2:
{
struct Context * oldContext = curContext;

curContext = stmt->compound.context;
if(stmt->compound.declarations)
{
struct Declaration * decl;

for(decl = (*stmt->compound.declarations).first; decl; decl = decl->next)
{
ProcessDeclaration(decl);
}
}
if(stmt->compound.statements)
{
struct Statement * statement;

for(statement = (*stmt->compound.statements).first; statement; statement = statement->next)
{
ProcessStatement(statement);
}
}
curContext = oldContext;
break;
}
case 3:
{
if(stmt->expressions)
{
struct Expression * exp;

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

for(exp = (*stmt->ifStmt.exp).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
if(stmt->ifStmt.stmt)
{
ProcessStatement(stmt->ifStmt.stmt);
}
if(stmt->ifStmt.elseStmt)
{
ProcessStatement(stmt->ifStmt.elseStmt);
}
break;
}
case 5:
{
struct Expression * exp;

for(exp = (*stmt->switchStmt.exp).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
ProcessStatement(stmt->switchStmt.stmt);
break;
}
case 6:
{
struct Expression * exp;

if(stmt->whileStmt.exp)
{
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
ProcessStatement(stmt->doWhile.stmt);
if(stmt->doWhile.exp)
{
struct Expression * exp;

for(exp = (*stmt->doWhile.exp).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
}
break;
}
case 8:
{
struct Expression * exp;

if(stmt->forStmt.init)
{
ProcessStatement(stmt->forStmt.init);
}
if(stmt->forStmt.check)
{
ProcessStatement(stmt->forStmt.check);
}
if(stmt->forStmt.increment)
{
for(exp = (*stmt->forStmt.increment).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
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
if(stmt->expressions)
{
struct Expression * exp;

for(exp = (*stmt->expressions).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
}
break;
case 15:
case 16:
{
struct Identifier * _watch;

if(stmt->_watch.watcher)
{
ProcessExpression(stmt->_watch.watcher);
}
if(stmt->_watch.object)
{
ProcessExpression(stmt->_watch.object);
}
if(stmt->_watch.watches)
{
for(_watch = (*stmt->_watch.watches).first; _watch; _watch = _watch->next)
{
ProcessIdentifier(_watch);
}
}
break;
}
case 17:
{
struct PropertyWatch * _watch;

if(stmt->_watch.watcher)
{
ProcessExpression(stmt->_watch.watcher);
}
if(stmt->_watch.object)
{
ProcessExpression(stmt->_watch.object);
}
if(stmt->_watch.watches)
{
for(_watch = (*stmt->_watch.watches).first; _watch; _watch = _watch->next)
{
if(_watch->compound)
{
ProcessStatement(_watch->compound);
}
}
}
break;
}
}
}

static void ProcessInitializer(struct Initializer * initializer)
{
switch(initializer->type)
{
case 1:
{
struct Initializer * init;

for(init = (*initializer->list).first; init; init = init->next)
{
ProcessInitializer(init);
}
break;
}
case 0:
ProcessExpression(initializer->exp);
break;
}
}

static void ProcessInitDeclarator(struct InitDeclarator * decl)
{
if(decl->initializer)
ProcessInitializer(decl->initializer);
}

static void ProcessDeclaration(struct Declaration * decl)
{
switch(decl->type)
{
case 0:
{
struct Specifier * spec;

if(decl->specifiers)
{
for(spec = (*decl->specifiers).first; spec; spec = spec->next)
{
ProcessSpecifier(spec);
}
}
break;
}
case 1:
{
if(decl->specifiers)
{
struct Specifier * s;

for(s = (*decl->specifiers).first; s; s = s->next)
{
ProcessSpecifier(s);
}
}
if(decl->declarators && (*decl->declarators).first)
{
struct InitDeclarator * d;

for(d = (*decl->declarators).first; d; d = d->next)
{
ProcessInitDeclarator(d);
}
}
break;
}
case 2:
ProcessInstance(decl->inst);
break;
}
}

static void ProcessFunction(struct FunctionDefinition * func)
{
if(func->body)
{
ProcessStatement(func->body);
}
}

static void ProcessMemberInit(struct MemberInit * init)
{
if(init->initializer)
{
ProcessInitializer(init->initializer);
}
}

static void ProcessInstance(struct Instantiation * inst)
{
if(inst->members)
{
struct MembersInit * init;
struct MemberInit * memberInit;

for(init = (*inst->members).first; init; init = init->next)
{
if(init->type == 0 && init->dataMembers)
{
for(memberInit = (*init->dataMembers).first; memberInit; memberInit = memberInit->next)
{
ProcessMemberInit(memberInit);
}
}
if(init->type == 1)
{
ProcessClassFunction(init->function);
}
}
}
}

static void ProcessClassFunction(struct ClassFunction * func)
{
if(func->body)
{
ProcessStatement(func->body);
}
}

static void ProcessProperty(struct PropertyDef * def)
{
if(def->getStmt)
{
ProcessStatement(def->getStmt);
}
if(def->setStmt)
{
ProcessStatement(def->setStmt);
}
}

static void ProcessClassDef(struct ClassDef * def)
{
switch(def->type)
{
case 2:
ProcessDeclaration(def->decl);
break;
case 1:
{
struct MemberInit * init;

for(init = (*def->defProperties).first; init; init = init->next)
{
ProcessMemberInit(init);
}
break;
}
case 0:
ProcessClassFunction(def->function);
break;
case 3:
if(def->propertyDef)
{
ProcessProperty(def->propertyDef);
}
break;
case 4:
if(def->propertyWatch && def->propertyWatch->compound)
{
ProcessStatement(def->propertyWatch->compound);
}
break;
}
}

static void ProcessClass(struct ClassDefinition * _class)
{
if(_class->definitions)
{
struct ClassDef * def;

for(def = (*_class->definitions).first; def; def = def->next)
{
ProcessClassDef(def);
}
}
}

extern struct External * MkExternalDeclaration(struct Declaration * declaration);

extern struct __ecereNameSpace__ecere__sys__OldList *  ast;

extern struct Expression * MkExpString(char *  string);

extern struct Expression * MkExpInstance(struct Instantiation * inst);

extern struct Instantiation * MkInstantiation(struct Specifier * _class, struct Expression * exp, struct __ecereNameSpace__ecere__sys__OldList * members);

extern struct MembersInit * MkMembersInitList(struct __ecereNameSpace__ecere__sys__OldList * dataMembers);

extern struct MemberInit * MkMemberInit(struct __ecereNameSpace__ecere__sys__OldList * ids, struct Initializer * initializer);

extern struct Context * PushContext(void);

extern struct ClassDefinition * MkClass(struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * baseSpecs, struct __ecereNameSpace__ecere__sys__OldList * definitions);

extern struct Symbol * DeclClass(int symbolID, char *  name);

extern struct Context * globalContext;

extern void PopContext(struct Context * ctx);

extern struct ClassDef * MkClassDefDefaultProperty(struct __ecereNameSpace__ecere__sys__OldList * defProperties);

extern struct MemberInit * MkMemberInitExp(struct Expression * idExp, struct Initializer * initializer);

extern struct External * MkExternalClass(struct ClassDefinition * _class);

extern int strcmp(const char * , const char * );

extern char *  strcpy(char * , const char * );

extern struct ClassDef * MkClassDefProperty(struct PropertyDef * propertyDef);

extern struct PropertyDef * MkProperty(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl, struct Identifier * id, struct Statement * setStmt, struct Statement * getStmt);

extern struct __ecereNameSpace__ecere__sys__OldList *  CopyList(struct __ecereNameSpace__ecere__sys__OldList *  source, void *  (* )(void * ));

extern struct Specifier * CopySpecifier(struct Specifier * spec);

extern struct Declarator * CopyDeclarator(struct Declarator * declarator);

extern struct Declaration * MkDeclarationInst(struct Instantiation * inst);

extern struct Identifier * CopyIdentifier(struct Identifier * id);

extern struct Expression * MkExpClass(struct __ecereNameSpace__ecere__sys__OldList *  specifiers, struct Declarator * decl);

extern struct Expression * MkExpIndex(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * index);

extern struct ClassDef * MkClassDefClassPropertyValue(struct Identifier * id, struct Initializer * initializer);

extern struct Expression * MkExpDBTable(char *  table);

extern char *  __ecereNameSpace__ecere__sys__CopyString(char *  string);

extern struct Expression * MkExpDBField(char *  table, struct Identifier * id);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(struct __ecereNameSpace__ecere__sys__OldList * this, void *  prevItem, void *  item);

static void ProcessDBTable(struct DBTableDef * table)
{
void * __ecereTemp1;
struct __ecereNameSpace__ecere__sys__OldList * rowClassDefs = MkList(), * idClassDefs = (((void *)0));
char tableName[1024];
char rowClassName[1024];
int len = strlen(table->name);
unsigned int indexed = 0x0;
char tableID[1024];
char nameField[1024];
struct __ecereNameSpace__ecere__sys__OldList * args;
struct __ecereNameSpace__ecere__sys__OldList * members;
int symbolID = 0;

if(table->symbol)
idClassDefs = MkList();
nameField[0] = (char)0;
memcpy(tableName, table->name + 1, len - 2);
tableName[len - 2] = (char)0;
__ecereNameSpace__ecere__sys__ChangeCh(tableName, ' ', '_');
sprintf(tableID, "__ecereDBTable_%s", tableName);
sprintf(rowClassName, "Row%s", tableName);
__ecereNameSpace__ecere__sys__ChangeCh(rowClassName, ' ', '_');
if(!tableStatements)
{
tableStatements = MkList();
indexStatements = MkList();
addFieldStatements = MkList();
}
{
struct External * external;

external = MkExternalDeclaration(MkDeclaration(MkListOne(MkSpecifierName("Table")), MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(tableID)), (((void *)0))))));
external->declaration->declMode = table->declMode;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), addAfter, external);
args = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*tableStatements), MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(tableID)), '=', MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier("db")), MkIdentifier("OpenTable")), args)))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpString(table->name));
members = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpInstance(MkInstantiation((((void *)0)), (((void *)0)), MkListOne(MkMembersInitList(members)))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*members), MkMemberInit((((void *)0)), MkInitializerAssignment(MkExpIdentifier(MkIdentifier("tableRows")))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*members), MkMemberInit((((void *)0)), MkInitializerAssignment(MkExpIdentifier(MkIdentifier("create")))));
}
{
struct ClassDefinition * _class;
struct ClassDef * def;
struct External * external;
struct __ecereNameSpace__ecere__sys__OldList * inheritanceSpecs = MkList();

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*inheritanceSpecs), MkSpecifier(PRIVATE));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*inheritanceSpecs), MkSpecifierName("Row"));
PushContext();
_class = MkClass(DeclClass(globalContext->nextID++, rowClassName), inheritanceSpecs, rowClassDefs);
PopContext(curContext);
def = MkClassDefDefaultProperty(MkListOne(MkMemberInitExp(MkExpIdentifier(MkIdentifier("tbl")), MkInitializerAssignment(MkExpIdentifier(MkIdentifier(tableID))))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*rowClassDefs), def);
_class->symbol->idCode = symbolID;
_class->declMode = table->declMode;
external = MkExternalClass(_class);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), addAfter, external);
addAfter = external;
}
if(table->definitions)
{
struct DBTableEntry * entry;

for(entry = (*table->definitions).first; entry; entry = entry->next)
{
switch(entry->type)
{
case 0:
{
unsigned int isIndex = 0x0;
char fieldID[1024];
struct __ecereNameSpace__ecere__sys__OldList * args;
struct Specifier * spec = entry->dataType->qualifiers ? (struct Specifier *)(*entry->dataType->qualifiers).first : (((void *)0));

sprintf(fieldID, "__ecereDBField_%s_%s", tableName, entry->id->string);
if(idClassDefs)
{
if(!nameField[0] && spec->type == 1 && (!strcmp(spec->name, "String") || !strcmp(spec->name, "eda::CIString")))
{
strcpy(nameField, entry->id->string);
}
if(!indexed && spec->type == 1 && !strcmp(spec->name, table->symbol->string))
{
struct Statement * rowSet = MkCompoundStmt(MkList(), MkList());
char name[1024];
struct ClassDef * def;

numIndexes = ((numIndexes > 1) ? numIndexes : 1);
isIndex = 0x1;
indexed = 0x1;
sprintf(name, "_%s", entry->id->string);
curContext = rowSet->compound.context = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ((struct Context *)__ecereTemp1)->parent = globalContext, ((struct Context *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*rowSet->compound.statements), MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("Find")), args = MkList()))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpIdentifier(MkIdentifier(fieldID)));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpIdentifier(MkIdentifier("middle")));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpIdentifier(MkIdentifier("nil")));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpIdentifier(MkIdentifier("value")));
curContext = globalContext;
def = MkClassDefProperty(MkProperty(CopyList(entry->dataType->qualifiers, CopySpecifier), CopyDeclarator(entry->dataType->declarator), MkIdentifier(name), rowSet, (((void *)0))));
def->propertyDef->symbol->id = def->propertyDef->symbol->idCode = symbolID;
def->memberAccess = 1;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*rowClassDefs), def);
}
}
if(rowClassDefs)
{
struct Statement * rowSet = MkCompoundStmt(MkList(), MkList()), * rowGet = MkCompoundStmt(MkList(), MkList());
struct ClassDef * def;

curContext = rowGet->compound.context = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ((struct Context *)__ecereTemp1)->parent = globalContext, ((struct Context *)__ecereTemp1));
if(spec->type == 1 && spec->symbol && spec->symbol->registered && spec->symbol->registered->type == 1)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*rowGet->compound.declarations), MkDeclarationInst(MkInstantiation(MkSpecifierName(spec->name), MkExpIdentifier(MkIdentifier("d")), (((void *)0)))));
}
else
{
struct Expression * exp;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*rowGet->compound.declarations), MkDeclaration(CopyList(entry->dataType->qualifiers, CopySpecifier), MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("d")), MkInitializerAssignment(exp = MkExpConstant("0"))))));
exp->destType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->kind = 3, ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*rowGet->compound.statements), MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("GetData")), args = MkList()))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpIdentifier(MkIdentifier(fieldID)));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpIdentifier(MkIdentifier("d")));
if(spec->type == 1 && spec->symbol && spec->symbol->registered && spec->symbol->registered->type == 1)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*rowGet->compound.statements), MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier("value")), '=', MkExpIdentifier(MkIdentifier("d"))))));
}
else
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*rowGet->compound.statements), MkReturnStmt(MkListOne(MkExpIdentifier(MkIdentifier("d")))));
curContext = rowSet->compound.context = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ((struct Context *)__ecereTemp1)->parent = globalContext, ((struct Context *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*rowSet->compound.statements), MkExpressionStmt(MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("SetData")), args = MkList()))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpIdentifier(MkIdentifier(fieldID)));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpIdentifier(MkIdentifier("value")));
curContext = globalContext;
def = MkClassDefProperty(MkProperty(CopyList(entry->dataType->qualifiers, CopySpecifier), entry->dataType->declarator, CopyIdentifier(entry->id), rowSet, rowGet));
def->propertyDef->symbol->id = def->propertyDef->symbol->idCode = symbolID;
def->memberAccess = 1;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*rowClassDefs), def);
}
{
struct External * external;

external = MkExternalDeclaration(MkDeclaration(MkListOne(MkSpecifierName("Field")), MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(fieldID)), (((void *)0))))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*ast), external);
external->declaration->declMode = table->declMode;
args = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*addFieldStatements), MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(fieldID)), '=', MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier(tableID)), MkIdentifier("FindField")), args)))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpString(entry->name));
args = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*addFieldStatements), MkIfStmt(MkListOne(MkExpOp((((void *)0)), '!', MkExpIdentifier(MkIdentifier(fieldID)))), MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(fieldID)), '=', MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier(tableID)), MkIdentifier("AddField")), args)))), (((void *)0))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpString(entry->name));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpClass(CopyList(entry->dataType->qualifiers, CopySpecifier), CopyDeclarator(entry->dataType->declarator)));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpConstant("0"));
}
if(isIndex)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*indexStatements), MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIndex(MkExpIdentifier(MkIdentifier("indexes")), MkListOne(MkExpConstant("0"))), MkIdentifier("field")), '=', MkExpIdentifier(MkIdentifier(fieldID))))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*indexStatements), MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIndex(MkExpIdentifier(MkIdentifier("indexes")), MkListOne(MkExpConstant("0"))), MkIdentifier("order")), '=', MkExpIdentifier(MkIdentifier("ascending"))))));
args = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*indexStatements), MkExpressionStmt(MkListOne(MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier(tableID)), MkIdentifier("Index")), args))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpConstant("1"));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpIdentifier(MkIdentifier("indexes")));
}
break;
}
}
}
}
if(table->symbol)
{
struct ClassDefinition * _class;
struct External * external;
struct ClassDef * def;
struct Expression * exp;

PushContext();
_class = MkClass(table->symbol, MkListOne(MkSpecifierName("Id")), idClassDefs);
PopContext(curContext);
_class->declMode = table->declMode;
external = MkExternalClass(_class);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*ast), addAfter, external);
addAfter = external;
def = MkClassDefClassPropertyValue(MkIdentifier("table"), MkInitializerAssignment(exp = MkExpOp((((void *)0)), '&', MkExpDBTable(__ecereNameSpace__ecere__sys__CopyString(table->name)))));
ProcessExpression(exp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*idClassDefs), def);
if(nameField[0])
{
def = MkClassDefClassPropertyValue(MkIdentifier("nameField"), MkInitializerAssignment(exp = MkExpOp((((void *)0)), '&', MkExpDBField(__ecereNameSpace__ecere__sys__CopyString(table->name), MkIdentifier(nameField)))));
ProcessExpression(exp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*idClassDefs), def);
}
}
if(table->definitions)
{
struct DBTableEntry * entry;

for(entry = (*table->definitions).first; entry; entry = entry->next)
{
switch(entry->type)
{
case 0:
{
char fieldID[1024];
struct __ecereNameSpace__ecere__sys__OldList * args;
struct Specifier * spec = entry->dataType->qualifiers ? (struct Specifier *)(*entry->dataType->qualifiers).first : (((void *)0));

sprintf(fieldID, "__ecereDBField_%s_%s", tableName, entry->id->string);
if(idClassDefs && spec)
{
struct Statement * idSet = MkCompoundStmt(MkList(), MkList()), * idGet = MkCompoundStmt(MkList(), MkList());
struct ClassDef * def;

curContext = idGet->compound.context = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ((struct Context *)__ecereTemp1)->parent = globalContext, ((struct Context *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*idGet->compound.declarations), MkDeclarationInst(MkInstantiation(MkSpecifierName(rowClassName), MkExpIdentifier(MkIdentifier("r")), MkListOne(MkMembersInitList(MkListOne(MkMemberInit((((void *)0)), MkInitializerAssignment(MkExpIdentifier(MkIdentifier("this"))))))))));
if(spec->type == 1 && spec->symbol && spec->symbol->registered && spec->symbol->registered->type == 1)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*idGet->compound.declarations), MkDeclarationInst(MkInstantiation(MkSpecifierName(spec->name), MkExpIdentifier(MkIdentifier("d")), (((void *)0)))));
}
else
{
struct Expression * exp;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*idGet->compound.declarations), MkDeclaration(CopyList(entry->dataType->qualifiers, CopySpecifier), MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("d")), MkInitializerAssignment(exp = MkExpConstant("0"))))));
exp->destType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->kind = 3, ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*idGet->compound.statements), MkExpressionStmt(MkListOne(MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier("r")), MkIdentifier("GetData")), args = MkList()))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpIdentifier(MkIdentifier(fieldID)));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpIdentifier(MkIdentifier("d")));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*idGet->compound.statements), MkExpressionStmt(MkListOne(MkExpOp((((void *)0)), DELETE, MkExpIdentifier(MkIdentifier("r"))))));
if(spec->type == 1 && spec->symbol && spec->symbol->registered && spec->symbol->registered->type == 1)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*idGet->compound.statements), MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier("value")), '=', MkExpIdentifier(MkIdentifier("d"))))));
}
else
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*idGet->compound.statements), MkReturnStmt(MkListOne(MkExpIdentifier(MkIdentifier("d")))));
curContext = idSet->compound.context = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ((struct Context *)__ecereTemp1)->parent = globalContext, ((struct Context *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*idSet->compound.declarations), MkDeclarationInst(MkInstantiation(MkSpecifierName(rowClassName), MkExpIdentifier(MkIdentifier("r")), MkListOne(MkMembersInitList(MkListOne(MkMemberInit((((void *)0)), MkInitializerAssignment(MkExpIdentifier(MkIdentifier("this"))))))))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*idSet->compound.statements), MkExpressionStmt(MkListOne(MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier("r")), MkIdentifier("SetData")), args = MkList()))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpIdentifier(MkIdentifier(fieldID)));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpIdentifier(MkIdentifier("value")));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*idSet->compound.statements), MkExpressionStmt(MkListOne(MkExpOp((((void *)0)), DELETE, MkExpIdentifier(MkIdentifier("r"))))));
curContext = globalContext;
def = MkClassDefProperty(MkProperty(CopyList(entry->dataType->qualifiers, CopySpecifier), CopyDeclarator(entry->dataType->declarator), CopyIdentifier(entry->id), idSet, idGet));
def->propertyDef->symbol->id = def->propertyDef->symbol->idCode = symbolID;
def->memberAccess = 1;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*idClassDefs), def);
}
break;
}
case 1:
{
if(entry->items && (*entry->items).count)
{
char indexID[1024];
struct DBIndexItem * item;
int c;
unsigned int needTable = 0x0;
char num[16];

if(entry->id || indexed)
{
if(entry->id || (*entry->items).count == 1)
{
struct External * external;
struct Identifier * id = entry->id ? entry->id : ((struct DBIndexItem *)(*entry->items).first)->id;

sprintf(indexID, "__ecereDBIndex_%s_%s", tableName, id->string);
external = MkExternalDeclaration(MkDeclaration(MkListOne(MkSpecifierName("Table")), MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(indexID)), (((void *)0))))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*ast), external);
external->declaration->declMode = table->declMode;
needTable = 0x1;
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Multiple field index requires a name\n", (((void *)0))));
}
else
{
indexed = 0x1;
strcpy(indexID, tableID);
}
for(c = 0, item = (*entry->items).first; item; item = item->next, c++)
{
char fieldID[1024];

sprintf(num, "%d", c);
sprintf(fieldID, "__ecereDBField_%s_%s", tableName, item->id->string);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*indexStatements), MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIndex(MkExpIdentifier(MkIdentifier("indexes")), MkListOne(MkExpConstant(num))), MkIdentifier("field")), '=', MkExpIdentifier(MkIdentifier(fieldID))))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*indexStatements), MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIndex(MkExpIdentifier(MkIdentifier("indexes")), MkListOne(MkExpConstant(num))), MkIdentifier("order")), '=', MkExpIdentifier(MkIdentifier((item->order == 0) ? "ascending" : "descending"))))));
}
sprintf(num, "%d", c);
numIndexes = ((numIndexes > c) ? numIndexes : c);
if(needTable)
{
args = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*indexStatements), MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(indexID)), '=', MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier("db")), MkIdentifier("OpenTable")), args)))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpString(table->name));
members = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpInstance(MkInstantiation((((void *)0)), (((void *)0)), MkListOne(MkMembersInitList(members)))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*members), MkMemberInit((((void *)0)), MkInitializerAssignment(MkExpIdentifier(MkIdentifier("tableRows")))));
}
args = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*indexStatements), MkExpressionStmt(MkListOne(MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier(indexID)), MkIdentifier("Index")), args))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpConstant(num));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpIdentifier(MkIdentifier("indexes")));
}
break;
}
}
}
}
}

extern unsigned int inCompiler;

extern void PrePreProcessClassDefinitions(void);

extern struct External * curExternal;

void ProcessDBTableDefinitions()
{
struct External * external;

addAfter = (((void *)0));
curContext = globalContext;
if(inCompiler)
PrePreProcessClassDefinitions();
DeclClass(0, "Field");
DeclClass(0, "Table");
DeclClass(0, "Row");
DeclClass(0, "Id");
numIndexes = 0;
if(ast != (((void *)0)))
{
for(external = (*ast).first; external; external = external->next)
{
curExternal = external;
switch(external->type)
{
case 5:
ProcessDBTable(external->table);
break;
}
}
for(external = (*ast).first; external; external = external->next)
{
curExternal = external;
switch(external->type)
{
case 0:
ProcessFunction(external->function);
break;
case 1:
ProcessDeclaration(external->declaration);
break;
case 2:
ProcessClass(external->_class);
break;
}
}
}
curContext = globalContext;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

void __ecereRegisterModule_dbpass(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessDBTableDefinitions", "void ProcessDBTableDefinitions(void)", ProcessDBTableDefinitions, module, 1);
}

void __ecereUnregisterModule_dbpass(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

