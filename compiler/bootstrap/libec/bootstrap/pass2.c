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

extern struct Expression * CopyExpression(struct Expression * exp);

extern void FreeExpression(struct Expression * exp);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

static void _FixRefExp(struct Expression ** expPtr, struct Expression ** memberExpPtr)
{
struct Expression * memberExp = *memberExpPtr;

if(memberExp && memberExp->type == 8 && memberExp->member.exp && (memberExp->member.exp->type == 5 || memberExp->member.exp->type == 34))
{
struct Expression * bracketExp = memberExp->member.exp;
struct Expression * idExp = (*bracketExp->list).last;

if(idExp && idExp->type == 0)
{
struct Expression * newExp = (((void *)0));
struct Expression * exp = *expPtr;

*memberExpPtr = (((void *)0));
newExp = CopyExpression(exp);
*(struct Expression **)((unsigned char *)newExp + ((unsigned char *)memberExpPtr - (unsigned char *)exp)) = memberExp;
memberExp->member.exp = idExp;
exp->type = 5;
exp->list = bracketExp->list;
bracketExp->list = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*exp->list), idExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*exp->list), newExp);
FreeExpression(bracketExp);
*expPtr = newExp;
}
}
else if(*expPtr && (*expPtr)->type == 4 && (*expPtr)->op.op == '&' && !(*expPtr)->op.exp1 && memberExp && (memberExp->type == 5 || memberExp->type == 34) && memberExp->list && (*memberExp->list).count > 1)
{
struct Expression * newExp = (((void *)0));
struct Expression * exp = *expPtr;

*memberExpPtr = (((void *)0));
newExp = CopyExpression(exp);
*(struct Expression **)((unsigned char *)newExp + ((unsigned char *)memberExpPtr - (unsigned char *)exp)) = (*memberExp->list).last;
exp->type = 5;
exp->list = memberExp->list;
memberExp->list = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*exp->list), (*exp->list).last);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*exp->list), newExp);
FreeExpression(memberExp);
*expPtr = newExp;
}
}

static struct Expression * FixRefExp(struct Expression * exp)
{
if(exp->type == 4)
{
_FixRefExp(&exp, &exp->op.exp1);
_FixRefExp(&exp, &exp->op.exp2);
}
else if(exp->type == 6)
_FixRefExp(&exp, &exp->index.exp);
else if(exp->type == 8)
_FixRefExp(&exp, &exp->member.exp);
return exp;
}

extern int strcmp(const char * , const char * );

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

static struct Expression * FixReference(struct Expression * e, unsigned int wantReference)
{
if(e->expType && e->type != 2)
{
struct Type * type = e->expType;
unsigned int isPointer = 0x0;

if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = type->_class ? type->_class->registered : (((void *)0));

if(_class && (_class->type == 1 || _class->type == 5 || (_class->type == 1000 && _class->base && strcmp(_class->fullName, "uintptr") && strcmp(_class->fullName, "intptr") && strcmp(_class->fullName, "ecere::com::Instance") && strcmp(_class->fullName, "ecere::com::Class") && strcmp(_class->dataTypeString, "char *"))))
{
if(wantReference != (e->byReference || isPointer))
{
struct Expression * exp = e;

for(; ; )
{
if(exp->type == 5 || exp->type == 34)
{
if(exp->list)
{
exp->byReference = wantReference;
exp = (*exp->list).last;
}
else
break;
}
else if(exp->type == 11)
{
exp->byReference = wantReference;
exp = exp->cast.exp;
}
else if(exp->type == 12)
{
if((*exp->cond.exp).last)
FixReference((*exp->cond.exp).last, wantReference);
FixReference(exp->cond.elseExp, wantReference);
break;
}
else
{
if(wantReference != (exp->byReference || isPointer))
{
struct Expression * newExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

*newExp = *exp;
if(exp->destType)
exp->destType->refCount++;
if(exp->expType)
exp->expType->refCount++;
exp->type = 4;
exp->op.exp1 = (((void *)0));
exp->op.exp2 = newExp;
if(wantReference)
exp->op.op = '&';
else
exp->op.op = '*';
e->byReference = wantReference;
exp->byReference = wantReference;
}
break;
}
}
}
}
}
}
e = FixRefExp(e);
return e;
}

static unsigned int FixMember(struct Expression * exp)
{
unsigned int byReference = 0x0;

for(; exp; )
{
if(exp->type == 5 || exp->type == 34)
{
if((*exp->list).count > 1)
byReference = 0x1;
exp = (*exp->list).last;
}
else if(exp->type == 11)
{
exp = exp->cast.exp;
}
else
{
if(byReference)
FixReference(exp, 0x1);
else
byReference = exp->byReference;
break;
}
}
return byReference;
}

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern char *  strcpy(char * , const char * );

extern void FullClassNameCat(char *  output, char *  className, unsigned int includeTemplateParams);

extern char *  strcat(char * , const char * );

extern void DeclareMethod(struct __ecereNameSpace__ecere__com__Method * method, char *  name);

extern struct Declarator * SpecDeclFromString(char *  string, struct __ecereNameSpace__ecere__sys__OldList *  specs, struct Declarator * baseDecl);

extern struct Declarator * MkDeclaratorBrackets(struct Declarator * declarator);

extern struct Declarator * MkDeclaratorPointer(struct Pointer * pointer, struct Declarator * declarator);

extern struct Pointer * MkPointer(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Pointer * pointer);

extern struct Declarator * GetFuncDecl(struct Declarator * decl);

extern struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator);

extern struct __ecereNameSpace__ecere__sys__OldList *  MkListOne(void *  item);

extern struct Specifier * MkSpecifierName(char *  name);

extern void MangleClassName(char *  className);

extern struct Symbol * FindClass(char *  name);

extern void DeclareClass(struct Symbol * classSym, char *  className);

extern struct Expression * MkExpCast(struct TypeName * typeName, struct Expression * expression);

extern struct Expression * MkExpIndex(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * index);

extern struct Expression * MkExpPointer(struct Expression * expression, struct Identifier * member);

extern struct Expression * MkExpIdentifier(struct Identifier * id);

extern struct Identifier * MkIdentifier(char *  string);

extern char *  __ecereNameSpace__ecere__sys__CopyString(char *  string);

extern void ListAdd(struct __ecereNameSpace__ecere__sys__OldList * list, void *  item);

extern struct Expression * MkExpOp(struct Expression * exp1, int op, struct Expression * exp2);

extern struct Expression * MkExpTypeSize(struct TypeName * typeName);

extern struct Expression * MkExpBrackets(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern struct Expression * QMkExpId(char *  id);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Instance * privateModule;

extern void DeclareProperty(struct __ecereNameSpace__ecere__com__Property * prop, char *  setName, char *  getName);

extern int sprintf(char * , char * , ...);

extern struct Context * curContext;

extern struct Type * MkClassType(char *  name);

extern struct __ecereNameSpace__ecere__com__Class * containerClass;

extern unsigned int __ecereNameSpace__ecere__com__eClass_IsDerived(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class * from);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

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

extern int __ecereNameSpace__ecere__com__GetRuntimePlatform(void);

extern struct Expression * MkExpConstant(char *  string);

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

extern void FreeExpContents(struct Expression * exp);

extern struct Expression * MkExpString(char *  string);

extern char *  QMkString(char *  source);

extern struct Specifier * MkSpecifier(int specifier);

extern void FreeIdentifier(struct Identifier * id);

extern struct Context * PushContext(void);

extern struct Statement * MkCompoundStmt(struct __ecereNameSpace__ecere__sys__OldList * declarations, struct __ecereNameSpace__ecere__sys__OldList * statements);

extern struct Declaration * MkDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators);

extern struct InitDeclarator * MkInitDeclarator(struct Declarator * declarator, struct Initializer * initializer);

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

extern struct Initializer * MkInitializerAssignment(struct Expression * exp);

extern struct Expression * QBrackets(struct Expression * exp);

extern struct Statement * MkExpressionStmt(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern struct Expression * MkExpCall(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * arguments);

extern void PopContext(struct Context * ctx);

extern void FreeType(struct Type * type);

extern void Compiler_Error(char *  format, ...);

extern char *  __ecereNameSpace__ecere__GetTranslatedString(struct __ecereNameSpace__ecere__com__Instance * module, char *  string, char *  stringAndContext);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

extern void ProcessExpressionType(struct Expression * exp);

extern struct Expression * MkExpCondition(struct Expression * cond, struct __ecereNameSpace__ecere__sys__OldList * expressions, struct Expression * elseExp);

extern struct __ecereNameSpace__ecere__sys__OldList *  CopyList(struct __ecereNameSpace__ecere__sys__OldList *  source, void *  (* )(void * ));

extern struct Expression * GetTemplateArgExp(struct TemplateParameter * param, struct __ecereNameSpace__ecere__com__Class * curClass, unsigned int pointer);

extern struct __ecereNameSpace__ecere__com__Class * thisClass;

extern struct Expression * MkExpMember(struct Expression * expression, struct Identifier * member);

extern struct Context * globalContext;

extern void FreeSymbol(struct Symbol * symbol);

extern struct TypeName * QMkType(char *  spec, struct Declarator * decl);

extern struct Declarator * QMkPtrDecl(char *  id);

extern struct MemberInit * MkMemberInit(struct __ecereNameSpace__ecere__sys__OldList * ids, struct Initializer * initializer);

extern struct Declaration * MkDeclarationInst(struct Instantiation * inst);

extern struct Instantiation * MkInstantiationNamed(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Expression * exp, struct __ecereNameSpace__ecere__sys__OldList * members);

extern struct MembersInit * MkMembersInitList(struct __ecereNameSpace__ecere__sys__OldList * dataMembers);

extern struct Expression * MkExpExtensionCompound(struct Statement * compound);

extern void ProcessExpressionInstPass(struct Expression * exp);

extern struct Context * SetupTemplatesContext(struct __ecereNameSpace__ecere__com__Class * _class);

extern void FinishTemplatesContext(struct Context * context);

extern struct Specifier * MkStructOrUnion(int type, struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * definitions);

extern void PrintType(struct Type * type, char *  string, unsigned int printName, unsigned int fullName);

extern int ComputeTypeSize(struct Type * type);

extern void FreeTypeName(struct TypeName * typeName);

extern struct Type * ProcessType(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

extern unsigned int internalValueCounter;

extern int printf(char * , ...);

extern struct Type * ProcessTemplateParameterType(struct TemplateParameter * param);

extern void DeclareStruct(char *  name, unsigned int skipNoHead);

extern void FreeSpecifier(struct Specifier * spec);

static void ProcessStatement(struct Statement * stmt);

extern void FreeList(struct __ecereNameSpace__ecere__sys__OldList * list, void (* )(void * ));

extern void FreeDeclarator(struct Declarator * decl);

extern char *  StringFromSpecDecl(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

static void ProcessInitializer(struct Initializer * init);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(struct __ecereNameSpace__ecere__sys__OldList * this, void *  prevItem, void *  item);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_int;

static void ProcessExpression(struct Expression * exp)
{
struct Location oldyylloc = yylloc;

yylloc = exp->loc;
switch(exp->type)
{
case 0:
{
if(exp->expType && exp->expType->kind == 16)
{
struct __ecereNameSpace__ecere__com__Class * _class = exp->expType->methodClass;
struct __ecereNameSpace__ecere__com__Method * method = exp->expType->method;

if(method->type == 1)
{
char name[1024];
struct TypeName * typeName;
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

strcpy(name, "__ecereVMethodID_");
FullClassNameCat(name, method->_class->fullName, 0x0);
strcat(name, "_");
strcat(name, method->name);
DeclareMethod(method, name);
decl = SpecDeclFromString(method->dataTypeString, specs, MkDeclaratorBrackets(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))));
if(!method->dataType->staticMethod)
{
struct Declarator * funcDecl = GetFuncDecl(decl);

if(!funcDecl->function.parameters)
funcDecl->function.parameters = MkList();
{
struct TypeName * firstParam = ((struct TypeName *)(*funcDecl->function.parameters).first);
struct Specifier * firstSpec = firstParam ? (*firstParam->qualifiers).first : (((void *)0));

if(firstParam && firstSpec->type == 0 && firstSpec->specifier == VOID && !firstParam->declarator)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*funcDecl->function.parameters), (*funcDecl->function.parameters).first);
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->function.parameters), (((void *)0)), MkTypeName(MkListOne(MkSpecifierName(method->dataType->thisClass ? method->dataType->thisClass->string : method->_class->fullName)), (((void *)0))));
}
typeName = MkTypeName(specs, decl);
if(_class)
{
char className[1024];

strcpy(className, "__ecereClass_");
FullClassNameCat(className, _class->fullName, 0x1);
MangleClassName(className);
if(!_class->symbol)
_class->symbol = FindClass(_class->fullName);
DeclareClass(_class->symbol, className);
exp->type = 5;
exp->list = MkListOne(MkExpCast(typeName, MkExpIndex(MkExpPointer(MkExpIdentifier(MkIdentifier(className)), MkIdentifier("_vTbl")), MkListOne(MkExpIdentifier(MkIdentifier(name))))));
}
}
else
{
char name[1024];

strcpy(name, "__ecereMethod_");
FullClassNameCat(name, method->_class->fullName, 0x0);
strcat(name, "_");
strcat(name, method->name);
(__ecereNameSpace__ecere__com__eSystem_Delete(exp->identifier->string), exp->identifier->string = 0);
exp->identifier->_class = (((void *)0));
exp->identifier->string = __ecereNameSpace__ecere__sys__CopyString(name);
DeclareMethod(method, name);
}
}
break;
}
case 2:
break;
case 3:
break;
case 13:
case 28:
case 14:
case 29:
{
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

if(exp->type == 14 || exp->type == 29)
ListAdd(args, exp->_renew.exp);
ListAdd(args, MkExpOp(MkExpTypeSize(exp->_new.typeName), '*', MkExpBrackets(MkListOne(exp->_new.size))));
switch(exp->type)
{
case 13:
exp->call.exp = QMkExpId("ecere::com::eSystem_New");
break;
case 28:
exp->call.exp = QMkExpId("ecere::com::eSystem_New0");
break;
case 14:
exp->call.exp = QMkExpId("ecere::com::eSystem_Renew");
break;
case 29:
exp->call.exp = QMkExpId("ecere::com::eSystem_Renew0");
break;
}
exp->call.arguments = args;
exp->type = 7;
ProcessExpression(exp);
break;
}
case 4:
{
struct Expression * exp1 = exp->op.exp1;
struct Expression * exp2 = exp->op.exp2;

switch(exp->op.op)
{
case '=':
if(exp->op.exp2)
exp->op.exp2->usage = (exp->op.exp2->usage & ~0x1) | (((unsigned int)0x1) << 0);
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
exp->op.exp2->usage = (exp->op.exp2->usage & ~0x1) | (((unsigned int)0x1) << 0);
break;
case INC_OP:
case DEC_OP:
case '&':
if(exp->op.exp1 && exp->op.exp2)
{
exp->op.exp1->usage = (exp->op.exp1->usage & ~0x1) | (((unsigned int)0x1) << 0);
exp->op.exp2->usage = (exp->op.exp2->usage & ~0x1) | (((unsigned int)0x1) << 0);
}
else if(exp->op.exp2)
{
exp->op.exp2->usage = (exp->op.exp2->usage & ~0x40) | (((unsigned int)0x1) << 6);
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
if(exp->op.op == '=' || exp->op.op == MUL_ASSIGN || exp->op.op == DIV_ASSIGN || exp->op.op == ADD_ASSIGN || exp->op.op == MOD_ASSIGN || exp->op.op == SUB_ASSIGN || exp->op.op == LEFT_ASSIGN || exp->op.op == RIGHT_ASSIGN || exp->op.op == AND_ASSIGN || exp->op.op == OR_ASSIGN || exp->op.op == XOR_ASSIGN || exp->op.op == INC_OP || exp->op.op == DEC_OP)
{
struct Expression * memberExp;
struct Expression * parentExp = (((void *)0));

if(exp->op.exp1 && exp->op.exp1->type == 8)
{
struct Expression * testExp, * topExp = (((void *)0));
struct Expression * lastExp = exp->op.exp1, * parentExp = (((void *)0));
struct __ecereNameSpace__ecere__com__Property * lastProperty = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * propertyClass;
char setName[1024], getName[1024];

testExp = exp->op.exp1->member.exp;
while(0x1)
{
while(testExp)
{
if(testExp->type == 11)
testExp = testExp->cast.exp;
else if(testExp->type == 5 || testExp->type == 34)
testExp = (*testExp->list).last;
else if(testExp->type == 8)
break;
else
testExp = (((void *)0));
}
if(!testExp)
break;
if(testExp->member.memberType == 1 || testExp->member.memberType == 4)
{
struct Type * type = testExp->member.exp->expType;

if(type)
{
if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = testExp->member.member->classSym ? testExp->member.member->classSym->registered : type->_class->registered;
struct __ecereNameSpace__ecere__com__Class * convertTo = (((void *)0));

if(testExp->member.memberType == 4)
{
convertTo = _class;
_class = FindClass(testExp->member.member->string)->registered;
lastProperty = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, convertTo->fullName, privateModule);
}
else
{
lastProperty = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, testExp->member.member->string, privateModule);
}
if(lastProperty && lastProperty->Get && lastProperty->Set)
{
DeclareProperty(lastProperty, setName, getName);
propertyClass = convertTo ? _class : ((((struct Symbol *)lastProperty->symbol)->type && ((struct Symbol *)lastProperty->symbol)->type->kind == 8) ? ((struct Symbol *)lastProperty->symbol)->type->_class->registered : ((struct Symbol *)lastProperty->symbol)->_class);
if(propertyClass && propertyClass->type == 1)
{
topExp = testExp;
parentExp = lastExp;
}
else if(propertyClass && propertyClass->type == 2)
{
topExp = testExp;
parentExp = lastExp;
}
}
}
}
}
lastExp = testExp;
testExp = testExp->member.exp;
}
if(topExp)
{
if(propertyClass->type == 1)
{
struct Expression * copy;
struct Expression * value;
char className[1024];
struct Expression * tempExp;

sprintf(className, "__simpleStruct%d", curContext->simpleID);
tempExp = QMkExpId(className);
tempExp->expType = MkClassType(propertyClass->fullName);
parentExp->member.exp = tempExp;
value = MkExpBrackets(MkList());
copy = CopyExpression(topExp);
copy->usage = (copy->usage & ~0x1) | (((unsigned int)0x1) << 0);
copy->usage = (copy->usage & ~0x20) | (((unsigned int)0x1) << 5);
ListAdd(value->list, copy);
ListAdd(value->list, MkExpOp(exp->op.exp1, exp->op.op, exp->op.exp2));
ListAdd(value->list, CopyExpression(tempExp));
value->expType = tempExp->expType;
tempExp->expType->refCount++;
exp->op.exp1 = topExp;
exp->op.exp2 = value;
exp->op.op = '=';
exp1 = exp->op.exp1;
exp2 = exp->op.exp2;
}
else if(propertyClass->type == 2)
{
struct Expression * copy;
struct Expression * value;
char className[1024];
struct Expression * tempExp;

sprintf(className, "__simpleStruct%d", curContext->simpleID);
tempExp = QMkExpId(className);
tempExp->expType = MkClassType(propertyClass->fullName);
parentExp->member.exp = tempExp;
value = MkExpBrackets(MkList());
copy = CopyExpression(topExp);
copy->usage = (copy->usage & ~0x1) | (((unsigned int)0x1) << 0);
copy->usage = (copy->usage & ~0x20) | (((unsigned int)0x1) << 5);
ListAdd(value->list, copy);
ListAdd(value->list, MkExpOp(exp->op.exp1, exp->op.op, exp->op.exp2));
ListAdd(value->list, CopyExpression(tempExp));
value->expType = tempExp->expType;
value->expType->refCount++;
exp->op.exp1 = topExp;
exp->op.exp2 = value;
exp->op.op = '=';
exp1 = exp->op.exp1;
exp2 = exp->op.exp2;
}
}
}
memberExp = exp->op.exp1;
while(memberExp && ((memberExp->type == 5 && (*memberExp->list).count == 1) || memberExp->type == 34 || memberExp->type == 25))
{
parentExp = memberExp;
if(memberExp->type == 25)
memberExp = (*((struct Statement *)(*memberExp->compound->compound.statements).last)->expressions).last;
else
memberExp = (*memberExp->list).last;
}
if(memberExp && memberExp->type == 6 && memberExp->index.exp && memberExp->index.exp->expType && memberExp->index.exp->expType->kind == 8 && memberExp->index.exp->expType->_class && memberExp->index.exp->expType->_class->registered && memberExp->index.exp->expType->_class->registered != containerClass && __ecereNameSpace__ecere__com__eClass_IsDerived(memberExp->index.exp->expType->_class->registered, containerClass))
{
ProcessExpression(memberExp);
while(memberExp && ((memberExp->type == 5 && (*memberExp->list).count == 1) || memberExp->type == 34 || memberExp->type == 25))
{
parentExp = memberExp;
if(memberExp->type == 25)
memberExp = (*((struct Statement *)(*memberExp->compound->compound.statements).last)->expressions).last;
else
memberExp = (*memberExp->list).last;
}
if(memberExp && memberExp->type == 25)
{
parentExp = memberExp;
if(memberExp->type == 25)
{
struct Statement * stmt = memberExp->compound->compound.statements ? (*memberExp->compound->compound.statements).last : (((void *)0));

if(stmt && stmt->type != 3)
stmt = (((void *)0));
memberExp = (stmt && stmt->expressions) ? (*stmt->expressions).last : (((void *)0));
if(memberExp)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*stmt->expressions), memberExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*stmt->expressions), MkExpOp(memberExp, exp->op.op, exp->op.exp2));
exp->type = 5;
exp->list = MkListOne(parentExp);
ProcessExpression(exp);
break;
}
}
else
memberExp = (*memberExp->list).last;
}
}
if(memberExp && memberExp->type != 8)
memberExp = (((void *)0));
if(memberExp && memberExp->type == 8)
{
struct Type * type = memberExp->member.exp->expType;

if(type)
{
if(type->kind == 8 || type->kind == 19)
{
struct __ecereNameSpace__ecere__com__Class * _class = memberExp->member.member->classSym ? (memberExp->member.member->classSym ? memberExp->member.member->classSym->registered : (((void *)0))) : (type->_class ? type->_class->registered : (((void *)0)));

if(memberExp == exp1)
exp1 = (((void *)0));
else
{
if(parentExp->type == 25)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*((struct Statement *)(*parentExp->compound->compound.statements).last)->expressions), memberExp);
else
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*parentExp->list), memberExp);
}
if(_class && _class->type == 2 && memberExp->member.memberType == 3)
{
struct __ecereNameSpace__ecere__com__BitMember * bitMember = (struct __ecereNameSpace__ecere__com__BitMember *)__ecereNameSpace__ecere__com__eClass_FindDataMember(_class, memberExp->member.member->string, privateModule, (((void *)0)), (((void *)0)));
char mask[32], shift[10];
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl = SpecDeclFromString(_class->dataTypeString, specs, (((void *)0)));
struct TypeName * type = MkTypeName(specs, decl);

if(bitMember->mask > (0xffffffff))
sprintf(mask, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "0x%I64XLL" : "0x%llXLL"), bitMember->mask);
else
sprintf(mask, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "0x%I64X" : "0x%llX"), bitMember->mask);
sprintf(shift, "%d", bitMember->pos);
exp->op.exp1 = memberExp->member.exp;
if(exp->op.op == XOR_ASSIGN)
{
exp->op.exp2 = MkExpOp(MkExpBrackets(MkListOne(MkExpCast(type, exp->op.exp2))), LEFT_OP, MkExpConstant(shift));
}
else
{
exp->op.exp2 = MkExpOp(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(memberExp->member.exp), '&', MkExpOp((((void *)0)), '~', MkExpConstant(mask))))), '|', MkExpBrackets(MkListOne(MkExpOp(MkExpBrackets(MkListOne(MkExpCast(type, exp->op.exp2))), LEFT_OP, MkExpConstant(shift)))));
}
memberExp->member.exp = (((void *)0));
FreeExpression(memberExp);
ProcessExpression(exp);
return ;
}
else if(_class && _class->type == 3 && memberExp->member.memberType == 3)
{
}
else if(memberExp->member.memberType != 3)
{
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__Class * convertTo = (((void *)0));
struct __ecereNameSpace__ecere__com__ClassProperty * classProperty = (((void *)0));

if(memberExp->member.memberType == 4)
{
convertTo = _class;
_class = FindClass(memberExp->member.member->string)->registered;
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, convertTo->fullName, privateModule);
}
else
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, memberExp->member.member->string, privateModule);
if(memberExp->member.memberType == 5)
classProperty = __ecereNameSpace__ecere__com__eClass_FindClassProperty(_class, memberExp->member.member->string);
exp->tempCount = memberExp->member.exp->tempCount;
if(classProperty)
{
if(classProperty->Set)
{
struct Identifier * id = memberExp->member.member;
struct Expression * classExp = memberExp->member.exp;
struct Expression * value = exp->op.exp2;

memberExp->member.exp = (((void *)0));
memberExp->member.member = (((void *)0));
exp->op.exp2 = (((void *)0));
FreeExpContents(memberExp);
exp->type = 7;
exp->call.exp = MkExpIdentifier(MkIdentifier("ecere::com::eClass_SetProperty"));
exp->call.arguments = MkList();
ListAdd(exp->call.arguments, classExp);
ListAdd(exp->call.arguments, MkExpString(QMkString(id->string)));
ListAdd(exp->call.arguments, MkExpCast(MkTypeName(MkListOne(MkSpecifier(INT)), (((void *)0))), value));
FreeIdentifier(id);
ProcessExpression(exp);
return ;
}
}
else if(prop)
{
if((!convertTo && prop->Set) || (convertTo && prop->Get))
{
struct Expression * value = exp->op.exp2;
char setName[1024], getName[1024];
char * setToUse = convertTo ? getName : setName;
char * getToUse = convertTo ? setName : getName;
unsigned int needAddress = 0x0;
int operator = exp->op.op;

switch(operator)
{
case MUL_ASSIGN:
operator = '*';
break;
case DIV_ASSIGN:
operator = '/';
break;
case MOD_ASSIGN:
operator = '%';
break;
case SUB_ASSIGN:
operator = '-';
break;
case ADD_ASSIGN:
operator = '+';
break;
case LEFT_ASSIGN:
operator = LEFT_OP;
break;
case RIGHT_ASSIGN:
operator = RIGHT_OP;
break;
case AND_ASSIGN:
operator = '&';
break;
case OR_ASSIGN:
operator = '|';
break;
case XOR_ASSIGN:
operator = '^';
break;
}
if(operator != '=')
{
if(operator == INC_OP)
value = MkExpOp(CopyExpression(memberExp), '+', MkExpConstant("1"));
else if(operator == DEC_OP)
value = MkExpOp(CopyExpression(memberExp), '-', MkExpConstant("1"));
else
{
value = MkExpOp(CopyExpression(memberExp), operator, value);
exp2 = (((void *)0));
}
value->expType = memberExp->expType;
memberExp->expType->refCount++;
value->usage = (value->usage & ~0x4) | (((unsigned int)0x1) << 2);
}
else if(value)
{
exp2 = (((void *)0));
}
if(value)
value->usage = (value->usage & ~0x4) | (((unsigned int)0x1) << 2);
DeclareProperty(prop, setName, getName);
if(memberExp->member.exp)
ProcessExpression(memberExp->member.exp);
if(((unsigned int)((exp->usage & 0x1) >> 0)) && ((!convertTo && prop->Get) || (convertTo && prop->Set)))
{
int __simpleStruct0, __simpleStruct1;
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct __ecereNameSpace__ecere__sys__OldList * args;
char ecereTemp[100];
struct Context * context = PushContext();

exp->tempCount++;
curExternal->function->tempCount = (__simpleStruct0 = curExternal->function->tempCount, __simpleStruct1 = exp->tempCount, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
sprintf(ecereTemp, "__ecTemp%d", exp->tempCount);
curContext = context;
exp->type = 25;
exp->compound = MkCompoundStmt(MkListOne(MkDeclaration(MkListOne(MkSpecifier(VOID)), MkListOne(MkInitDeclarator(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(MkIdentifier(ecereTemp))), MkInitializerAssignment(QBrackets(memberExp->member.exp)))))), list);
args = MkList();
if(convertTo)
{
ListAdd(args, value);
ListAdd(args, QMkExpId(ecereTemp));
ListAdd(list, MkExpressionStmt(MkListOne(MkExpCall(QMkExpId(getName), args))));
}
else
{
ListAdd(args, QMkExpId(ecereTemp));
ListAdd(args, value);
ListAdd(list, MkExpressionStmt(MkListOne(MkExpCall(QMkExpId(setName), args))));
}
args = MkList();
if(convertTo)
ListAdd(args, QMkExpId(ecereTemp));
else
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*args), (((void *)0)), QMkExpId(ecereTemp));
ListAdd(list, MkExpressionStmt(MkListOne(MkExpCall(QMkExpId(getToUse), args))));
exp->compound->compound.context = context;
PopContext(context);
curContext = context->parent;
}
else
{
struct Expression * newExp = exp;

if(parentExp && parentExp->type == 25)
{
newExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*((struct Statement *)(*parentExp->compound->compound.statements).last)->expressions), newExp);
FreeType(exp->expType);
FreeType(exp->destType);
*exp = *parentExp;
parentExp->type = 16;
parentExp->expType = (((void *)0));
parentExp->destType = (((void *)0));
}
newExp->type = 7;
newExp->call.exp = QMkExpId(setToUse);
newExp->call.arguments = MkList();
if(convertTo)
{
ListAdd(newExp->call.arguments, value);
ListAdd(newExp->call.arguments, FixReference(memberExp->member.exp, 0x1));
}
else
{
ListAdd(newExp->call.arguments, FixReference(memberExp->member.exp, 0x1));
ListAdd(newExp->call.arguments, value);
}
needAddress = 0x1;
}
memberExp->member.exp = (((void *)0));
if(value)
{
value->tempCount = exp->tempCount;
ProcessExpression(value);
if(needAddress)
FixReference(value, 0x1);
}
FreeExpression(memberExp);
}
else
{
struct __ecereNameSpace__ecere__com__DataMember * member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, memberExp->member.member->string, privateModule, (((void *)0)), (((void *)0)));

if(member)
{
memberExp->member.memberType = 3;
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "no set defined for property %s of class %s\n", (((void *)0))), prop->name, prop->_class->fullName);
}
}
else
{
struct __ecereNameSpace__ecere__com__Method * method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, memberExp->member.member->string, privateModule);

if(method && method->type == 1 && type->kind != 19)
{
struct Expression * value = exp->op.exp2;

value->tempCount = exp->tempCount;
ProcessExpression(value);
if(memberExp->member.exp)
ProcessExpression(memberExp->member.exp);
if(((unsigned int)((exp->usage & 0x1) >> 0)))
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct __ecereNameSpace__ecere__sys__OldList * args;

args = MkList();
ListAdd(args, memberExp->member.exp);
{
char * string = QMkString(memberExp->member.member->string);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
ListAdd(args, value);
ListAdd(list, MkExpCall(QMkExpId("ecere::com::eInstance_SetMethod"), args));
ListAdd(list, CopyExpression(value));
exp->type = 5;
exp->list = list;
}
else
{
exp->type = 7;
exp->call.exp = QMkExpId("ecere::com::eInstance_SetMethod");
exp->call.arguments = MkList();
ListAdd(exp->call.arguments, memberExp->member.exp);
{
char * string = QMkString(memberExp->member.member->string);

ListAdd(exp->call.arguments, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
ListAdd(exp->call.arguments, value);
}
memberExp->member.exp = (((void *)0));
exp2 = (((void *)0));
FreeExpression(memberExp);
}
}
}
else if(memberExp->member.memberType == 3)
{
if(FixMember(memberExp->member.exp))
{
ProcessExpression(memberExp);
memberExp->type = 9;
}
}
}
}
}
}
else if(exp->op.op == _INCREF)
{
struct Expression * object = exp->op.exp2;

exp->op.exp2 = (((void *)0));
FreeExpContents(exp);
exp->expType = (((void *)0));
exp->destType = (((void *)0));
exp->op.op = INC_OP;
exp->op.exp1 = MkExpPointer(object, MkIdentifier("_refCount"));
}
else if(exp->op.op == DELETE)
{
struct Expression * object = exp->op.exp2;
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

exp->type = 5;
exp->list = MkList();
object->usage = (object->usage & ~0x80) | (((unsigned int)0x1) << 7);
ProcessExpression(object);
ListAdd(args, object);
if(exp->expType && exp->expType->kind == 8 && exp->expType->_class && exp->expType->_class->registered && ((exp->expType->_class->registered->type == 0 && !__ecereNameSpace__ecere__com__eClass_IsDerived(exp->expType->_class->registered, __ecereNameSpace__ecere__com__eSystem_FindClass(exp->expType->_class->registered->module, "char *"))) || (exp->expType->_class->registered->type == 1000 && !strcmp(exp->expType->_class->string, "ecere::com::Instance"))))
{
struct Expression * decRefExp = MkExpCall(QMkExpId("ecere::com::eInstance_DecRef"), args);

ProcessExpressionType(decRefExp);
ListAdd(exp->list, decRefExp);
}
else if(exp->expType && exp->expType->kind == 8 && exp->expType->_class && exp->expType->_class->registered && exp->expType->_class->registered->type == 5)
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct __ecereNameSpace__ecere__com__Class * _class;

for(_class = exp->expType->_class->registered; _class && _class->type == 5; _class = _class->base)
{
char className[1024];

if(_class->templateClass)
_class = _class->templateClass;
strcpy(className, "__ecereClass_");
FullClassNameCat(className, _class->fullName, 0x0);
MangleClassName(className);
if(!_class->symbol)
_class->symbol = FindClass(_class->fullName);
DeclareClass(_class->symbol, className);
ListAdd(list, MkExpCondition(MkExpPointer(QMkExpId(className), MkIdentifier("Destructor")), MkListOne(MkExpCall(MkExpPointer(QMkExpId(className), MkIdentifier("Destructor")), CopyList(args, CopyExpression))), MkExpConstant("0")));
}
ListAdd(list, MkExpCall(QMkExpId("ecere::com::eSystem_Delete"), args));
ListAdd(exp->list, MkExpBrackets(MkListOne(MkExpCondition(CopyExpression(object), MkListOne(MkExpBrackets(list)), MkExpConstant("0")))));
}
else if(exp->expType && exp->expType->kind == 20)
{
struct Expression * argExp = GetTemplateArgExp(exp->expType->templateParameter, thisClass, 0x0);

if(argExp)
{
struct Expression * classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
struct TypeName * typeName;
struct __ecereNameSpace__ecere__sys__OldList * qualifiers = MkList();
struct Declarator * declarator = SpecDeclFromString("void (*)(void * _class, void * data)", qualifiers, (((void *)0)));

typeName = MkTypeName(qualifiers, declarator);
ProcessExpressionType(classExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*args), (((void *)0)), CopyExpression(classExp));
DeclareMethod(__ecereNameSpace__ecere__com__eClass_FindMethod(__ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "class"), "OnFree", privateModule), "__ecereVMethodID_class_OnFree");
ListAdd(exp->list, MkExpCall(MkExpBrackets(MkListOne(MkExpCast(typeName, MkExpIndex(MkExpPointer(classExp, MkIdentifier("_vTbl")), MkListOne(MkExpIdentifier(MkIdentifier("__ecereVMethodID_class_OnFree"))))))), args));
}
}
else
ListAdd(exp->list, MkExpCall(QMkExpId("ecere::com::eSystem_Delete"), args));
ListAdd(exp->list, MkExpOp(CopyExpression(object), '=', MkExpConstant("0")));
exp2 = (((void *)0));
ProcessExpression(exp);
}
if(exp->type == 4)
{
if(exp->op.op == '=' && exp->op.exp1 && exp->op.exp1->expType && exp->op.exp1->expType->kind == 20 && (exp->op.exp1->type == 6 || (exp->op.exp1->type == 4 && exp->op.exp1->op.op == '*' && !exp->op.exp1->op.exp1)))
{
struct Expression * argExp = GetTemplateArgExp(exp->op.exp1->expType->templateParameter, thisClass, 0x0);

if(argExp)
{
struct Expression * classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();
struct Expression * derefExp = exp->op.exp1;
struct Expression * sizeExp = MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("normalClass"))), OR_OP, MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("noHeadClass")))))), MkListOne(MkExpTypeSize(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))))), MkExpMember(CopyExpression(classExp), MkIdentifier("typeSize")));

if(exp->op.exp1->type == 6)
{
struct Expression * indexExp = derefExp->index.exp;
struct __ecereNameSpace__ecere__sys__OldList * indexExpIndex = derefExp->index.index;

derefExp->index.index = (((void *)0));
derefExp->index.exp = (((void *)0));
FreeExpression(derefExp);
derefExp = MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), indexExp), '+', MkExpBrackets(MkListOne(MkExpOp(MkExpBrackets(indexExpIndex), '*', MkExpBrackets(MkListOne(CopyExpression(sizeExp)))))));
}
else
{
struct Expression * indexExp = derefExp->op.exp2;

derefExp->op.exp2 = (((void *)0));
FreeExpression(derefExp);
derefExp = indexExp;
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), derefExp);
ProcessExpressionType((*args).last);
ProcessExpression((*args).last);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(MkExpMember(classExp, MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("structClass"))))), MkListOne(exp->op.exp2), MkExpOp((((void *)0)), '&', CopyExpression(exp->op.exp2)))));
thisClass = curExternal->function ? curExternal->function->_class : (((void *)0));
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(thisClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
ProcessExpressionType((*args).last);
ProcessExpression((*args).last);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), sizeExp);
ProcessExpressionType((*args).last);
ProcessExpression((*args).last);
exp->list = MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("memcpy")), args));
exp->type = 5;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
FreeSymbol(thisSymbol);
}
thisClass = (((void *)0));
return ;
}
}
else if(exp->op.op == '*' && !exp->op.exp1 && exp->op.exp2 && exp->op.exp2->expType && exp->op.exp2->expType->kind == 13 && exp->op.exp2->expType->type && exp->op.exp2->expType->type->kind == 20)
{
struct Expression * argExp = GetTemplateArgExp(exp->op.exp2->expType->type->templateParameter, thisClass, 0x0);

if(argExp)
{
struct Expression * classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
struct Expression * sizeExp = MkExpMember(CopyExpression(classExp), MkIdentifier("typeSize"));

exp->type = 5;
exp->list = MkListOne(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), (((void *)0))), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("structClass"))))), MkListOne(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), (((void *)0))), CopyExpression(exp->op.exp2))))), MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("normalClass"))), OR_OP, MkExpOp(MkExpMember(classExp, MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("noHeadClass")))))), MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), (((void *)0))), MkExpOp((((void *)0)), '*', MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), MkPointer((((void *)0)), (((void *)0)))), (((void *)0)))), CopyExpression(exp->op.exp2))))))), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(sizeExp), EQ_OP, MkExpConstant("1")))), MkListOne(MkExpOp((((void *)0)), '*', MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), CopyExpression(exp->op.exp2)))))), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(sizeExp), EQ_OP, MkExpConstant("2")))), MkListOne(MkExpOp((((void *)0)), '*', MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint16")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), CopyExpression(exp->op.exp2)))))), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(sizeExp, EQ_OP, MkExpConstant("4")))), MkListOne(MkExpOp((((void *)0)), '*', MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint32")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), CopyExpression(exp->op.exp2)))))), MkExpOp((((void *)0)), '*', MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), exp->op.exp2)))))))))))))))))))));
thisClass = curExternal->function ? curExternal->function->_class : (((void *)0));
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(thisClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
ProcessExpressionType((*exp->list).first);
ProcessExpression((*exp->list).first);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
FreeSymbol(thisSymbol);
}
thisClass = (((void *)0));
return ;
}
}
else
{
if(exp->op.exp1)
{
if(exp->op.exp2)
exp->op.exp1->tempCount = exp->op.exp2->tempCount;
ProcessExpression(exp->op.exp1);
if(exp->op.op == '=' && exp->op.exp2 && (!exp->op.exp2->byReference || (exp->op.exp2->expType && exp->op.exp2->expType->kind == 8 && exp->op.exp2->expType->_class && exp->op.exp2->expType->_class->registered && exp->op.exp2->expType->_class->registered->type == 1)) && exp->op.exp2->expType && (exp->op.exp2->expType->kind != 13 && exp->op.exp2->expType->kind != 20))
FixReference(exp->op.exp1, 0x0);
}
if(exp->op.exp2)
{
if(exp->op.exp1)
exp->op.exp2->tempCount = exp->op.exp1->tempCount;
ProcessExpression(exp->op.exp2);
if(exp->op.exp1 || (exp->op.op != '*' && exp->op.op != '&'))
{
if((!exp->op.exp1 && (!exp->op.exp2 || !exp->op.exp2->expType || exp->op.exp2->expType->kind != 8 || !exp->op.exp2->expType->_class || !exp->op.exp2->expType->_class->registered || (exp->op.exp2->expType->_class->registered->type != 0 && exp->op.exp2->expType->_class->registered->type != 1 && exp->op.exp2->expType->_class->registered->type != 5))) || (exp->op.exp1 && exp->op.exp1->expType && exp->op.exp1->expType->kind != 13 && exp->op.exp1->expType->kind != 20))
{
FixReference(exp->op.exp2, exp->op.exp1 ? exp->op.exp1->byReference : 0x0);
}
}
}
}
if(exp->op.op == '*' && !exp->op.exp1 && exp->op.exp2 && exp->op.exp2->type == 4 && exp->op.exp2->op.op == '&' && !exp->op.exp2->op.exp1)
{
struct Expression * next = exp->next, * prev = exp->prev;
struct Expression * derefExp = exp->op.exp2;
struct Expression * refExp = exp->op.exp2->op.exp2;
struct Type * expType = exp->expType, * destType = exp->destType;

derefExp->op.exp2 = (((void *)0));
FreeExpression(derefExp);
FreeType(exp->expType);
FreeType(exp->destType);
*exp = *refExp;
exp->prev = prev;
exp->next = next;
((refExp ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor(refExp) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(refExp)) : 0), refExp = 0);
}
if(exp->op.op == '&' && !exp->op.exp1 && exp->op.exp2 && exp->op.exp2->expType && exp->op.exp2->expType->kind == 20 && !exp->op.exp2->expType->passAsTemplate)
{
struct Expression * exp2 = exp->op.exp2;
struct Expression * argExp = GetTemplateArgExp(exp2->expType->templateParameter, thisClass, 0x0);

if(argExp)
{
struct Expression * classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
struct Expression * e;

exp->type = 5;
exp->list = MkListOne(MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpOp((((void *)0)), '&', exp2)), '+', MkExpCall(MkExpIdentifier(MkIdentifier("__ENDIAN_PAD")), MkListOne((e = MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(MkExpOp(MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("structClass"))), OR_OP, MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("normalClass")))), OR_OP, MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("noHeadClass")))))), MkListOne(MkExpTypeSize(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))))), MkExpMember(classExp, MkIdentifier("typeSize"))))))));
thisClass = curExternal->function ? curExternal->function->_class : (((void *)0));
{
ProcessExpressionType(e);
ProcessExpression(e);
}
thisClass = (((void *)0));
}
}
}
else
{
if(exp1)
FreeExpression(exp1);
if(exp2)
FreeExpression(exp2);
}
break;
}
case 5:
case 34:
{
if(exp->list)
{
struct Expression * e;

for(e = (*exp->list).first; e; e = e->next)
{
if(!e->next)
{
e->usage |= (exp->usage & (((unsigned int)(0x1)) | (((unsigned int)(0x1)) << 2) | (((unsigned int)(0x1)) << 4)));
}
e->tempCount = exp->tempCount;
ProcessExpression(e);
if(!e->next)
exp->byReference = e->byReference;
exp->tempCount = e->tempCount;
}
}
break;
}
case 6:
{
struct Expression * e;
struct Expression * checkedExp = exp->index.exp;
unsigned int isBuiltin = 0x0;

while(checkedExp->type == 25 || checkedExp->type == 5 || checkedExp->type == 11)
{
if(checkedExp->type == 25)
{
isBuiltin = 0x1;
break;
}
else if(checkedExp->type == 5)
checkedExp = checkedExp->list ? (*checkedExp->list).last : (((void *)0));
else
checkedExp = checkedExp->cast.exp;
}
exp->index.exp->tempCount = exp->tempCount;
exp->index.exp->usage = (exp->index.exp->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(exp->index.exp);
if(exp->index.exp->expType && exp->index.exp->expType->kind == 13 && exp->index.exp->expType->type && exp->index.exp->expType->type->kind == 20)
{
struct Expression * argExp = GetTemplateArgExp(exp->index.exp->expType->type->templateParameter, thisClass, 0x0);

if(argExp)
{
struct Expression * classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
struct Expression * sizeExp = MkExpMember(CopyExpression(classExp), MkIdentifier("typeSize"));

exp->type = 5;
exp->list = MkListOne(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), (((void *)0))), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("structClass"))))), MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), (((void *)0))), MkExpBrackets(MkListOne(MkExpOp(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), CopyExpression(exp->index.exp)))), '+', MkExpOp(MkExpBrackets(CopyList(exp->index.index, CopyExpression)), '*', CopyExpression(sizeExp))))))), MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("normalClass"))), OR_OP, MkExpOp(MkExpMember(classExp, MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("noHeadClass")))))), MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), (((void *)0))), MkExpIndex(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), MkPointer((((void *)0)), (((void *)0)))), (((void *)0)))), CopyExpression(exp->index.exp)))), CopyList(exp->index.index, CopyExpression)))), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(sizeExp), EQ_OP, MkExpConstant("1")))), MkListOne(MkExpIndex(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), CopyExpression(exp->index.exp)))), CopyList(exp->index.index, CopyExpression))), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(sizeExp), EQ_OP, MkExpConstant("2")))), MkListOne(MkExpIndex(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint16")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), CopyExpression(exp->index.exp)))), CopyList(exp->index.index, CopyExpression))), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(sizeExp, EQ_OP, MkExpConstant("4")))), MkListOne(MkExpIndex(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint32")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), CopyExpression(exp->index.exp)))), CopyList(exp->index.index, CopyExpression))), MkExpIndex(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), exp->index.exp))), exp->index.index))))))))))))))))));
thisClass = curExternal->function ? curExternal->function->_class : (((void *)0));
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(thisClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
ProcessExpressionType((*exp->list).first);
ProcessExpression((*exp->list).first);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
FreeSymbol(thisSymbol);
}
thisClass = (((void *)0));
return ;
}
}
for(e = (*exp->index.index).first; e; e = e->next)
{
if(!e->next)
e->usage = (e->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(e);
}
exp->tempCount = exp->index.exp->tempCount;
if(exp->index.exp->expType)
{
struct Type * source = exp->index.exp->expType;

if(source->kind == 8 && source->_class && source->_class->registered && source->_class->registered != containerClass && __ecereNameSpace__ecere__com__eClass_IsDerived(source->_class->registered, containerClass))
{
struct __ecereNameSpace__ecere__com__Class * _class = source->_class->registered;
unsigned int isArray = 0x0;
struct __ecereNameSpace__ecere__com__Class * arrayClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "Array");

if(source && __ecereNameSpace__ecere__com__eClass_IsDerived(source->_class->registered, arrayClass))
isArray = 0x1;
if(isArray && _class->templateArgs)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl = SpecDeclFromString(_class->templateArgs[2].dataTypeString, specs, (((void *)0)));
struct TypeName * typeName = MkTypeName(specs, MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), decl));

exp->index.exp = MkExpBrackets(MkListOne(MkExpCast(typeName, MkExpMember(exp->index.exp, MkIdentifier("array")))));
ProcessExpressionType(exp->index.exp);
ProcessExpression(exp);
}
else if(isBuiltin && _class->templateArgs)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl = SpecDeclFromString(_class->templateArgs[2].dataTypeString, specs, (((void *)0)));
struct TypeName * typeName = MkTypeName(specs, MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), decl));

exp->index.exp = MkExpBrackets(MkListOne(MkExpCast(typeName, MkExpPointer(MkExpCast(QMkType("BuiltInContainer", QMkPtrDecl((((void *)0)))), exp->index.exp), MkIdentifier("data")))));
ProcessExpressionType(exp->index.exp);
ProcessExpression(exp);
}
else if(_class->templateArgs)
{
char iteratorType[1024];
struct __ecereNameSpace__ecere__sys__OldList * declarations = MkList();
struct __ecereNameSpace__ecere__sys__OldList * statements = MkList();
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();
struct __ecereNameSpace__ecere__sys__OldList * instMembers = MkList();
struct Expression * expExt;
struct Context * context = PushContext();

sprintf(iteratorType, "Iterator<%s, %s >", _class->templateArgs[2].dataTypeString, _class->templateArgs[1].dataTypeString);
ListAdd(instMembers, MkMemberInit((((void *)0)), MkInitializerAssignment(exp->index.exp)));
ListAdd(declarations, MkDeclarationInst(MkInstantiationNamed(MkListOne(MkSpecifierName(iteratorType)), MkExpIdentifier(MkIdentifier("__internalIterator")), MkListOne(MkMembersInitList(instMembers)))));
ListAdd(args, MkExpBrackets(exp->index.index));
ListAdd(args, ((unsigned int)((exp->usage & 0x2) >> 1)) ? MkExpIdentifier(MkIdentifier("true")) : MkExpIdentifier(MkIdentifier("false")));
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier("__internalIterator")), MkIdentifier("Index")), args))));
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpMember(MkExpIdentifier(MkIdentifier("__internalIterator")), MkIdentifier("data")))));
exp->type = 5;
exp->list = MkListOne(expExt = (MkExpExtensionCompound(MkCompoundStmt(declarations, statements))));
expExt->compound->compound.context = context;
PopContext(context);
expExt->usage = exp->usage;
ProcessExpressionType((*exp->list).first);
ProcessExpressionInstPass((*exp->list).first);
ProcessExpression((*exp->list).first);
}
}
}
break;
}
case 7:
{
struct Expression * e;
struct Expression * memberExp;
unsigned int typedObject = 0x0;
struct Type * ellipsisDestType = (((void *)0));
unsigned int usedEllipsis = 0x0;

if(exp->call.arguments)
{
for(e = (*exp->call.arguments).first; e; e = e->next)
{
int __simpleStruct2, __simpleStruct3;
int __simpleStruct0, __simpleStruct1;

e->usage = (e->usage & ~0x1) | (((unsigned int)0x1) << 0);
e->usage = (e->usage & ~0x4) | (((unsigned int)0x1) << 2);
e->tempCount = (__simpleStruct0 = e->tempCount, __simpleStruct1 = exp->tempCount, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
ProcessExpression(e);
exp->tempCount = (__simpleStruct2 = exp->tempCount, __simpleStruct3 = e->tempCount, (__simpleStruct2 > __simpleStruct3) ? __simpleStruct2 : __simpleStruct3);
}
}
exp->call.exp->usage = (exp->call.exp->usage & ~0x1) | (((unsigned int)0x1) << 0);
exp->call.exp->usage = (exp->call.exp->usage & ~0x8) | (((unsigned int)0x1) << 3);
exp->call.exp->tempCount = exp->tempCount;
ProcessExpression(exp->call.exp);
memberExp = (exp->call.exp->type == 8) ? exp->call.exp : (((void *)0));
if(exp->call.exp->expType && exp->call.exp->expType->kind == 16)
{
struct __ecereNameSpace__ecere__com__Class * _class = exp->call.exp->expType->methodClass;
struct __ecereNameSpace__ecere__com__Class * argClass = exp->call.exp->expType->methodClass;
struct __ecereNameSpace__ecere__com__Method * method = exp->call.exp->expType->method;

if(method->type == 1)
{
char name[1024];
struct TypeName * typeName;
struct Declarator * decl;
struct Context * back;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

strcpy(name, "__ecereVMethodID_");
FullClassNameCat(name, method->_class->fullName, 0x0);
strcat(name, "_");
strcat(name, method->name);
DeclareMethod(method, name);
back = curContext;
curContext = method->_class->symbol ? ((struct Symbol *)method->_class->symbol)->ctx : globalContext;
{
struct Context * context = SetupTemplatesContext(method->_class);

decl = SpecDeclFromString(method->dataTypeString, specs, MkDeclaratorBrackets(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))));
FinishTemplatesContext(context);
}
curContext = back;
if(method->dataType && !method->dataType->staticMethod)
{
struct Declarator * funcDecl = GetFuncDecl(decl);

if(!funcDecl->function.parameters)
funcDecl->function.parameters = MkList();
{
struct TypeName * firstParam = ((struct TypeName *)(*funcDecl->function.parameters).first);
struct Specifier * firstSpec = firstParam ? (*firstParam->qualifiers).first : (((void *)0));

if(firstParam && firstSpec && firstSpec->type == 0 && firstSpec->specifier == VOID && !firstParam->declarator)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*funcDecl->function.parameters), (*funcDecl->function.parameters).first);
}
if(method->dataType->thisClass && !strcmp(method->dataType->thisClass->string, "class"))
{
typedObject = 0x1;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->function.parameters), (((void *)0)), MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))));
if(!method->dataType->extraParam)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->function.parameters), (((void *)0)), MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier("__ecereNameSpace__ecere__com__Class"), (((void *)0)))), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))));
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->function.parameters), (((void *)0)), MkTypeName(MkListOne(MkSpecifierName(method->dataType->thisClass ? method->dataType->thisClass->string : method->_class->fullName)), (((void *)0))));
}
}
typeName = MkTypeName(specs, decl);
if(memberExp && memberExp->member.exp->expType)
{
if(memberExp->member.exp->expType->kind == 8 && memberExp->member.exp->expType->_class && memberExp->member.exp->expType->_class->registered)
{
int type = memberExp->member.exp->expType->_class->registered->type;

if(type != 0 || method->dataType->byReference)
argClass = memberExp->member.exp->expType->_class->registered;
}
else
{
switch(memberExp->member.exp->expType->kind)
{
case 3:
{
argClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "int");
break;
}
}
}
}
if(!exp->call.exp->expType->methodClass && (!memberExp || !_class) && memberExp->member.exp->expType && memberExp->member.exp->expType->classObjectType)
{
if(memberExp->member.exp->expType->kind == 8 && memberExp->member.exp->expType->_class && memberExp->member.exp->expType->_class->registered && memberExp->member.exp->expType->_class->registered->type == 0)
{
exp->call.exp = MkExpBrackets(MkListOne(MkExpCast(typeName, MkExpIndex(MkExpPointer(MkExpBrackets(MkListOne(CopyExpression(memberExp->member.exp))), MkIdentifier("_vTbl")), MkListOne(MkExpIdentifier(MkIdentifier(name)))))));
}
else
{
exp->call.exp = MkExpBrackets(MkListOne(MkExpCast(typeName, MkExpIndex(MkExpPointer(MkExpIdentifier(MkIdentifier("class")), MkIdentifier("_vTbl")), MkListOne(MkExpIdentifier(MkIdentifier(name)))))));
}
}
else if(memberExp && !_class && exp->call.exp->expType->_class && (memberExp->member.exp->expType->kind == 19 || (memberExp->member.exp->expType->kind == 8 && memberExp->member.exp->expType->_class && memberExp->member.exp->expType->_class->registered && memberExp->member.exp->expType->_class->registered->type == 0)))
{
exp->call.exp = MkExpBrackets(MkListOne(MkExpCast(typeName, MkExpIndex(MkExpPointer(CopyExpression(memberExp->member.exp), MkIdentifier("_vTbl")), MkListOne(MkExpIdentifier(MkIdentifier(name)))))));
}
else
{
char className[1024];

if(!_class && argClass && strcmp(argClass->fullName, "class"))
_class = argClass;
if(!_class)
{
_class = __ecereClass_int;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, _class->fullName, 0x1);
MangleClassName(className);
if(!_class->symbol)
_class->symbol = FindClass(_class->fullName);
DeclareClass(_class->symbol, className);
exp->call.exp = MkExpBrackets(MkListOne(MkExpCast(typeName, MkExpIndex(MkExpPointer(MkExpIdentifier(MkIdentifier(className)), MkIdentifier("_vTbl")), MkListOne(MkExpIdentifier(MkIdentifier(name)))))));
}
}
else
{
char name[1024];

strcpy(name, "__ecereMethod_");
FullClassNameCat(name, method->_class->fullName, 0x0);
strcat(name, "_");
strcat(name, method->name);
exp->call.exp = MkExpIdentifier(MkIdentifier(name));
DeclareMethod(method, name);
if(memberExp && memberExp->expType && method->dataType)
{
exp->call.exp->expType = method->dataType;
method->dataType->refCount++;
}
}
if(memberExp && (!memberExp->member.exp || !memberExp->member.exp->expType || memberExp->member.exp->expType->kind != 19))
{
if(method->dataType && !method->dataType->staticMethod && !method->dataType->extraParam)
{
if(!exp->call.arguments)
exp->call.arguments = MkList();
if(typedObject && memberExp->member.exp && memberExp->member.exp->expType)
{
if((argClass && (argClass->type == 4 || argClass->type == 3 || argClass->type == 2 || argClass->type == 1000) && strcmp(argClass->fullName, "class") && strcmp(argClass->fullName, "ecere::com::Class")) || (!memberExp->member.exp->expType->classObjectType && ((((memberExp->member.exp->expType->kind != 13 && (memberExp->member.exp->expType->kind != 8 || !memberExp->member.exp->expType->_class || !memberExp->member.exp->expType->_class->registered || memberExp->member.exp->expType->_class->registered->type == 1)))) || method->dataType->byReference)))
{
if(memberExp->member.exp->type == 4 && memberExp->member.exp->op.op == '*' && !memberExp->member.exp->op.exp1)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->call.arguments), (((void *)0)), memberExp->member.exp->op.exp2);
memberExp->member.exp->op.exp2 = (((void *)0));
}
else if(!memberExp->member.exp->byReference)
{
struct Expression * checkedExp = memberExp->member.exp;
struct Expression * parentExp = (((void *)0));
struct Expression * newExp;

while(((checkedExp->type == 5 || checkedExp->type == 34) && checkedExp->list) || checkedExp->type == 11)
{
parentExp = checkedExp;
if(checkedExp->type == 5 || checkedExp->type == 34)
checkedExp = (*checkedExp->list).last;
else if(checkedExp->type == 11)
checkedExp = checkedExp->cast.exp;
}
newExp = MkExpOp((((void *)0)), '&', checkedExp);
if(parentExp && (parentExp->type == 5 || parentExp->type == 34))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*parentExp->list), checkedExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*parentExp->list), newExp);
}
else if(parentExp && parentExp->type == 11)
parentExp->cast.exp = newExp;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->call.arguments), (((void *)0)), parentExp ? parentExp : newExp);
}
else
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->call.arguments), (((void *)0)), memberExp->member.exp);
}
else
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->call.arguments), (((void *)0)), memberExp->member.exp);
if(memberExp->member.exp && memberExp->member.exp->expType && memberExp->member.exp->expType->classObjectType == 2)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->call.arguments), (((void *)0)), MkExpIdentifier(MkIdentifier("class")));
}
else
{
if(memberExp && !argClass)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->call.arguments), (((void *)0)), MkExpPointer(CopyExpression(memberExp->member.exp), MkIdentifier("_class")));
else
{
char className[1024];

strcpy(className, "__ecereClass_");
FullClassNameCat(className, argClass->fullName, 0x1);
MangleClassName(className);
if(!argClass->symbol)
argClass->symbol = FindClass(argClass->fullName);
DeclareClass(argClass->symbol, className);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->call.arguments), (((void *)0)), MkExpIdentifier(MkIdentifier(className)));
}
}
}
else
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->call.arguments), (((void *)0)), memberExp->member.exp);
memberExp->member.exp = (((void *)0));
}
FreeExpression(memberExp);
}
}
if(exp->call.arguments)
{
for(e = (*exp->call.arguments).first; e; e = e->next)
{
struct Type * destType = (e->destType && e->destType->kind == 14) ? ellipsisDestType : e->destType;

if(destType && (destType->classObjectType == 2 || destType->classObjectType == 3))
{
if(e->destType && e->destType->kind == 14)
usedEllipsis = 0x1;
ellipsisDestType = destType;
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
else if((type->kind == 12 || type->kind == 13) && type->type && type->type->kind == 1)
{
_class = FindClass("char *")->registered;
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
if((_class && (_class->type == 4 || _class->type == 3 || _class->type == 2 || _class->type == 1000) && strcmp(_class->fullName, "class") && strcmp(_class->fullName, "ecere::com::Class")) || (!e->expType->classObjectType && (((type->kind != 13 && type->kind != 19 && type->kind != 12 && (type->kind != 8 || !type->_class || !type->_class->registered || type->_class->registered->type == 1))) || destType->byReference)))
{
{
struct Expression * checkedExp;
struct Expression * parentExp;
struct Expression * newExp;

checkedExp = e;
parentExp = exp;
while(((checkedExp->type == 5 || checkedExp->type == 34 || checkedExp->type == 25) && checkedExp->list) || checkedExp->type == 11)
{
parentExp = checkedExp;
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
if(parentExp->type == 7)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->call.arguments), e->prev, newExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*exp->call.arguments), e);
e = newExp;
}
else if(parentExp->type == 5 || parentExp->type == 34)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*parentExp->list), checkedExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*parentExp->list), newExp);
}
else if(parentExp->type == 11)
{
if(parentExp->destType && parentExp->destType->kind == 14)
{
FreeTypeName(parentExp->cast.typeName);
parentExp->cast.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0))));
}
parentExp->cast.exp = newExp;
}
else if(parentExp->type == 25)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*((struct Statement *)(*parentExp->compound->compound.statements).last)->expressions), checkedExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*((struct Statement *)(*parentExp->compound->compound.statements).last)->expressions), newExp);
}
e->byReference = 0x1;
FreeType(checkedExp->expType);
FreeType(checkedExp->destType);
((checkedExp ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor(checkedExp) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(checkedExp)) : 0), checkedExp = 0);
}
else if((!e->byReference && (!e->expType || !e->expType->classObjectType)) || (_class && _class->type == 5))
{
struct Expression * checkedExp;
struct Expression * parentExp;
struct Expression * newExp;

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
if(exp->destType)
exp->destType->refCount++;
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
e->compound->compound.context = context;
PopContext(context);
curContext = context->parent;
}
}
checkedExp = e;
parentExp = exp;
while(((checkedExp->type == 5 || checkedExp->type == 34 || checkedExp->type == 25) && checkedExp->list) || checkedExp->type == 11)
{
parentExp = checkedExp;
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
newExp = MkExpOp((((void *)0)), '&', checkedExp);
newExp->byReference = 0x1;
if(parentExp->type == 7)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->call.arguments), e->prev, newExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*exp->call.arguments), e);
e = newExp;
}
else if(parentExp->type == 5 || parentExp->type == 34)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*parentExp->list), checkedExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*parentExp->list), newExp);
}
else if(parentExp->type == 11)
parentExp->cast.exp = newExp;
else if(parentExp->type == 5 || parentExp->type == 25)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*((struct Statement *)(*parentExp->compound->compound.statements).last)->expressions), checkedExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*((struct Statement *)(*parentExp->compound->compound.statements).last)->expressions), newExp);
}
}
}
}
if(destType->classObjectType == 2)
{
char className[1024];

if(!_class && type->kind == 13 && type->type && type->type->kind == 1)
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "String");
if(!_class)
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "int");
if(!strcmp(_class->name, "class"))
{
strcpy(className, "class");
}
else
{
strcpy(className, "__ecereClass_");
FullClassNameCat(className, _class->fullName, 0x1);
MangleClassName(className);
if(!_class->symbol)
_class->symbol = FindClass(_class->fullName);
DeclareClass(_class->symbol, className);
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->call.arguments), e->prev, MkExpIdentifier(MkIdentifier(className)));
}
}
}
{
FixReference(e, 0x1);
}
}
if(ellipsisDestType)
{
if(usedEllipsis || (exp->call.exp->expType && exp->call.exp->expType->kind == 11 && exp->call.exp->expType->params.last && ((struct Type *)exp->call.exp->expType->params.last)->kind == 14))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->call.arguments), (*exp->call.arguments).last, MkExpConstant("0"));
}
}
}
break;
}
case 8:
{
unsigned int changeToPtr = 0x0;
unsigned int noHead = 0x0;
struct Type * type = exp->member.exp->expType;
struct Specifier * memberClassSpecifier = exp->member.member ? exp->member.member->_class : (((void *)0));

if(exp->member.member)
exp->member.member->_class = (((void *)0));
if(type && type->kind == 20)
{
struct Type * baseType = ProcessTemplateParameterType(type->templateParameter);

if(baseType)
type = baseType;
}
if(type && exp->member.member && !type->directClassAccess)
{
struct __ecereNameSpace__ecere__com__Class * _class = exp->member.member->classSym ? exp->member.member->classSym->registered : (((type->kind == 8 || type->kind == 19) && type->_class) ? type->_class->registered : (((void *)0)));
struct __ecereNameSpace__ecere__com__Property * prop = (((void *)0));
struct __ecereNameSpace__ecere__com__ClassProperty * classProperty = (((void *)0));
struct __ecereNameSpace__ecere__com__Method * method = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * convertTo = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * member = (((void *)0));
unsigned int thisPtr = exp->member.thisPtr;

if(type->kind == 19 && exp->member.exp->type == 26)
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "ecere::com::Class");
if(!_class)
{
char string[2048] = "";
struct Symbol * classSym;

PrintType(type, string, 0x0, 0x1);
classSym = FindClass(string);
_class = classSym ? classSym->registered : (((void *)0));
}
if(_class && exp->member.memberType == 3)
{
if(!thisPtr && !exp->member.member->classSym)
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, exp->member.member->string, (((void *)0)), (((void *)0)), (((void *)0)));
if(!member)
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, exp->member.member->string, privateModule, (((void *)0)), (((void *)0)));
}
else if(_class && exp->member.memberType == 1)
{
if(!thisPtr && !exp->member.member->classSym)
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, exp->member.member->string, (((void *)0)));
if(!prop)
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, exp->member.member->string, privateModule);
if(prop && (((unsigned int)((exp->usage & 0x40) >> 6)) || (((unsigned int)((exp->usage & 0x1) >> 0)) && !prop->Get && !prop->conversion) || (((unsigned int)((exp->usage & 0x80) >> 7)) && !prop->Set && !prop->conversion)))
{
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, exp->member.member->string, privateModule, (((void *)0)), (((void *)0)));
if(member)
{
exp->member.memberType = 3;
prop = (((void *)0));
}
else
{
if(((unsigned int)((exp->usage & 0x40) >> 6)))
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "cannot obtain address of property\n", (((void *)0))));
else if(!prop->Get)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "no get defined for property %s of class %s\n", (((void *)0))), prop->name, prop->_class->fullName);
else if(((unsigned int)((exp->usage & 0x80) >> 7)))
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "no get defined for property %s of class %s\n", (((void *)0))), prop->name, prop->_class->fullName);
}
}
}
else if(_class && exp->member.memberType == 2)
{
if(!thisPtr)
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, exp->member.member->string, (((void *)0)));
if(!method)
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, exp->member.member->string, privateModule);
}
else if(_class && exp->member.memberType == 4)
{
convertTo = _class;
_class = FindClass(exp->member.member->string)->registered;
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, convertTo->fullName, privateModule);
}
else if(_class && exp->member.memberType == 5)
{
classProperty = __ecereNameSpace__ecere__com__eClass_FindClassProperty(_class, exp->member.member->string);
}
if(prop)
{
if(((unsigned int)((exp->usage & 0x1) >> 0)))
{
if(prop->Get)
{
char getName[1024], setName[1024];
struct Expression * ptr = exp->member.exp;
struct __ecereNameSpace__ecere__com__Class * propertyClass;
char * nameToUse = convertTo ? setName : getName;

FreeIdentifier(exp->member.member);
exp->member.exp->usage = (exp->member.exp->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(exp->member.exp);
DeclareProperty(prop, setName, getName);
propertyClass = convertTo ? _class : ((((struct Symbol *)prop->symbol)->type && ((struct Symbol *)prop->symbol)->type->kind == 8) ? ((struct Symbol *)prop->symbol)->type->_class->registered : ((struct Symbol *)prop->symbol)->_class);
if(propertyClass && propertyClass->type == 2)
{
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

if(((unsigned int)((exp->usage & 0x20) >> 5)))
{
char className[1024];
struct Declaration * decl;
struct Declarator * declarator;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList(), * decls = MkList();
struct Expression * tempExp;

sprintf(className, "__simpleStruct%d", curContext->simpleID++);
declarator = SpecDeclFromString(propertyClass->dataTypeString, specs, MkDeclaratorIdentifier(MkIdentifier(className)));
ListAdd(decls, MkInitDeclarator(declarator, (((void *)0))));
decl = MkDeclaration(specs, decls);
if(!curCompound->compound.declarations)
curCompound->compound.declarations = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*curCompound->compound.declarations), (((void *)0)), decl);
tempExp = QMkExpId(className);
tempExp->expType = MkClassType(propertyClass->fullName);
exp->op.exp1 = tempExp;
exp->op.exp2 = MkExpCall(QMkExpId(nameToUse), args);
exp->op.op = '=';
exp->type = 4;
}
else
{
exp->type = 7;
exp->call.exp = QMkExpId(nameToUse);
exp->call.arguments = args;
}
ListAdd(args, FixReference(ptr, 0x1));
}
else if(propertyClass && propertyClass->type == 3)
{
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

ListAdd(args, FixReference(ptr, 0x1));
exp->type = 7;
exp->call.exp = QMkExpId(nameToUse);
exp->call.arguments = args;
}
else if(propertyClass && propertyClass->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();
char className[1024];
struct Declaration * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList(), * decls = MkList();
struct Expression * tempExp;

className[0] = (char)0;
FullClassNameCat(className, propertyClass->fullName, 0x0);
ListAdd(specs, MkStructOrUnion(3, MkIdentifier(className), (((void *)0))));
sprintf(className, "__simpleStruct%d", curContext->simpleID++);
ListAdd(decls, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(className)), (((void *)0))));
decl = MkDeclaration(specs, decls);
if(curCompound)
{
if(!curCompound->compound.declarations)
curCompound->compound.declarations = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*curCompound->compound.declarations), (((void *)0)), decl);
}
tempExp = QMkExpId(className);
tempExp->expType = MkClassType(propertyClass->fullName);
if(convertTo)
{
ListAdd(args, FixReference(CopyExpression(tempExp), 0x1));
ListAdd(args, FixReference(ptr, 0x1));
}
else
{
ListAdd(args, FixReference(ptr, 0x1));
ListAdd(args, FixReference(CopyExpression(tempExp), 0x1));
}
if(((unsigned int)((exp->usage & 0x20) >> 5)))
{
exp->type = 7;
exp->call.exp = QMkExpId(nameToUse);
exp->call.arguments = args;
FreeExpression(tempExp);
}
else
{
exp->type = 5;
exp->list = MkList();
ListAdd(exp->list, MkExpCall(QMkExpId(nameToUse), args));
if(((unsigned int)((exp->usage & 0x10) >> 4)))
{
ListAdd(exp->list, FixReference(tempExp, 0x1));
exp->byReference = 0x1;
}
else
ListAdd(exp->list, tempExp);
}
}
else
{
exp->type = 7;
exp->call.exp = QMkExpId(nameToUse);
exp->call.arguments = MkList();
ListAdd(exp->call.arguments, FixReference(ptr, 0x1));
}
}
else if(prop->conversion)
{
void * prev = exp->prev, * next = exp->next;

*exp = *exp->member.exp;
exp->prev = prev;
exp->next = next;
}
}
}
else if(classProperty)
{
if(((unsigned int)((exp->usage & 0x1) >> 0)))
{
if(classProperty->Get)
{
struct Identifier * id = exp->member.member;
struct Expression * classExp = exp->member.exp;

exp->type = 7;
exp->call.exp = MkExpIdentifier(MkIdentifier("ecere::com::eClass_GetProperty"));
exp->call.arguments = MkList();
ListAdd(exp->call.arguments, classExp);
ListAdd(exp->call.arguments, MkExpString(QMkString(id->string)));
FreeIdentifier(id);
ProcessExpression(exp);
return ;
}
}
}
else if(method)
{
if((((unsigned int)((exp->usage & 0x1) >> 0)) || exp->member.exp->expType->kind == 19) && !((unsigned int)((exp->usage & 0x8) >> 3)))
{
char name[1024];

FreeIdentifier(exp->member.member);
exp->member.exp->usage = (exp->member.exp->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(exp->member.exp);
if(method->type == 1)
{
strcpy(name, "__ecereVMethodID_");
FullClassNameCat(name, method->_class->fullName, 0x0);
strcat(name, "_");
strcat(name, method->name);
exp->type = 6;
if(memberClassSpecifier)
{
char className[1024];

strcpy(className, "__ecereClass_");
FullClassNameCat(className, _class->fullName, 0x1);
MangleClassName(className);
if(!_class->symbol)
_class->symbol = FindClass(_class->fullName);
DeclareClass(_class->symbol, className);
exp->index.exp = MkExpPointer(MkExpIdentifier(MkIdentifier(className)), MkIdentifier("_vTbl"));
}
else
{
if(exp->thisPtr && _class->type != 0)
{
FreeExpression(exp->member.exp);
exp->index.exp = MkExpPointer(MkExpIdentifier(MkIdentifier("class")), MkIdentifier("_vTbl"));
}
else
exp->index.exp = MkExpPointer(exp->member.exp, MkIdentifier("_vTbl"));
}
exp->index.index = MkListOne(QMkExpId(name));
DeclareMethod(method, name);
}
else
{
FreeExpression(exp->member.exp);
exp->type = 0;
strcpy(name, "__ecereMethod_");
FullClassNameCat(name, method->_class->fullName, 0x0);
strcat(name, "_");
strcat(name, method->name);
exp->identifier = MkIdentifier(name);
DeclareMethod(method, name);
}
}
}
else if(member)
{
if(((unsigned int)((exp->usage & 0x1) >> 0)))
{
exp->member.exp->usage = (exp->member.exp->usage & ~0x1) | (((unsigned int)0x1) << 0);
}
ProcessExpression(exp->member.exp);
if(type->kind == 8)
DeclareStruct(type->_class->registered->fullName, 0x0);
if(_class->type == 5)
{
noHead = 0x1;
}
else if(_class->type == 1)
{
changeToPtr = 0x1;
}
else if(_class->type == 2)
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
char mask[32], shift[10];
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct __ecereNameSpace__ecere__com__BitMember * bitMember = (struct __ecereNameSpace__ecere__com__BitMember *)member;
struct Declarator * decl = SpecDeclFromString(bitMember->dataTypeString, specs, (((void *)0)));
struct TypeName * type = MkTypeName(specs, decl);

if(bitMember->mask > (0xffffffff))
sprintf(mask, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "0x%I64XLL" : "0x%llXLL"), bitMember->mask);
else
sprintf(mask, ((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "0x%I64X" : "0x%llX"), bitMember->mask);
sprintf(shift, "%d", bitMember->pos);
FreeIdentifier(exp->member.member);
ListAdd(list, MkExpCast(type, MkExpBrackets(MkListOne(MkExpOp(MkExpBrackets(MkListOne(MkExpOp(exp->member.exp, '&', MkExpConstant(mask)))), RIGHT_OP, MkExpConstant(shift))))));
exp->type = 5;
exp->list = list;
}
else if(_class->type == 3)
{
}
else
{
if(thisPtr)
{
char pointerName[1024];

strcpy(pointerName, "__ecerePointer_");
FullClassNameCat(pointerName, type->_class->registered->fullName, 0x0);
FreeIdentifier(exp->member.exp->identifier);
exp->member.exp->identifier = MkIdentifier(pointerName);
}
else
{
struct Expression * bytePtr, * e;
struct Expression * classExp;
struct Expression * checkedExp;
char structName[1024];
char className[1024];

strcpy(className, "__ecereClass_");
FullClassNameCat(className, member->_class->fullName, 0x1);
MangleClassName(className);
if(!member->_class->symbol)
member->_class->symbol = FindClass(member->_class->fullName);
DeclareClass(member->_class->symbol, className);
DeclareStruct(member->_class->fullName, 0x0);
structName[0] = (char)0;
FullClassNameCat(structName, member->_class->fullName, 0x0);
checkedExp = exp->member.exp;
while(((checkedExp->type == 5 || checkedExp->type == 34) && checkedExp->list && (*checkedExp->list).count == 1) || checkedExp->type == 11)
{
if(checkedExp->type == 5 || checkedExp->type == 34)
checkedExp = (*checkedExp->list).last;
else if(checkedExp->type == 11)
checkedExp = checkedExp->cast.exp;
}
if(checkedExp->type != 0 && checkedExp->type != 2 && checkedExp->type != 8 && checkedExp->type != 9)
{
int __simpleStruct0, __simpleStruct1;
char ecereTemp[100];
struct Statement * compound;
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct Context * context = PushContext();

if(exp->member.exp->tempCount > exp->tempCount)
exp->tempCount = exp->member.exp->tempCount;
exp->tempCount++;
curExternal->function->tempCount = (__simpleStruct0 = curExternal->function->tempCount, __simpleStruct1 = exp->tempCount, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
sprintf(ecereTemp, "__ecTemp%d", exp->tempCount);
curContext = context;
compound = MkCompoundStmt(MkListOne(MkDeclaration(MkListOne(MkSpecifier(CHAR)), MkListOne(MkInitDeclarator(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(MkIdentifier(ecereTemp))), MkInitializerAssignment(QBrackets(exp->member.exp)))))), (((void *)0)));
if(member->_class->fixed)
{
if(member->_class->templateClass ? member->_class->templateClass->offset : member->_class->offset)
{
char string[256];

sprintf(string, "%d", member->_class->templateClass ? member->_class->templateClass->offset : member->_class->offset);
e = QBrackets(MkExpOp(QMkExpId(ecereTemp), '+', MkExpConstant(string)));
}
else
e = QMkExpId(ecereTemp);
}
else
{
e = QBrackets(MkExpOp(QMkExpId(ecereTemp), '+', MkExpPointer(QMkExpId(className), MkIdentifier("offset"))));
}
compound->compound.context = context;
compound->compound.statements = MkListOne(MkExpressionStmt(MkListOne(QBrackets(MkExpCast(MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(structName), (((void *)0)))), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), e)))));
exp->member.exp = MkExpExtensionCompound(compound);
PopContext(context);
curContext = context->parent;
}
else
{
bytePtr = MkExpCast(QMkType("char", QMkPtrDecl((((void *)0)))), exp->member.exp);
if(member->_class->fixed)
{
if(member->_class->templateClass ? member->_class->templateClass->offset : member->_class->offset)
{
char string[256];

sprintf(string, "%d", member->_class->templateClass ? member->_class->templateClass->offset : member->_class->offset);
e = QBrackets(QBrackets(MkExpOp(bytePtr, '+', MkExpConstant(string))));
}
else
e = bytePtr;
}
else
e = QBrackets(QBrackets(MkExpOp(bytePtr, '+', MkExpPointer(QMkExpId(className), MkIdentifier("offset")))));
exp->member.exp = QBrackets(MkExpCast(MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(structName), (((void *)0)))), QMkPtrDecl((((void *)0)))), e));
}
}
exp->type = 9;
}
}
}
FreeSpecifier(memberClassSpecifier);
if(exp->type == 8 || exp->type == 9)
{
exp->member.exp->usage = (exp->member.exp->usage & ~0x1) | (((unsigned int)0x1) << 0);
exp->member.exp->usage = (exp->member.exp->usage & ~0x10) | (((unsigned int)0x1) << 4);
exp->member.exp->tempCount = exp->tempCount;
ProcessExpression(exp->member.exp);
exp->tempCount = exp->member.exp->tempCount;
if((changeToPtr && exp->member.exp->byReference) || noHead)
exp->type = 9;
}
break;
}
case 25:
{
((struct Expression *)(*((struct Statement *)(*exp->compound->compound.statements).last)->expressions).last)->usage |= exp->usage & (((unsigned int)(0x1)) | (((unsigned int)(0x1)) << 2) | (((unsigned int)(0x1)) << 4));
ProcessStatement(exp->compound);
break;
}
case 9:
{
exp->member.exp->usage = (exp->member.exp->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(exp->member.exp);
break;
}
case 10:
{
struct Specifier * spec = exp->typeName->qualifiers ? (*exp->typeName->qualifiers).first : (((void *)0));

if(spec && spec->type == 8 && !exp->typeName->declarator)
{
struct Expression * argExp = GetTemplateArgExp(spec->templateParameter, thisClass, 0x0);

if(argExp)
{
struct Expression * classExp;

FreeTypeName(exp->typeName);
classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
exp->type = 5;
exp->list = MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("normalClass"))), OR_OP, MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("noHeadClass")))))), MkListOne(MkExpTypeSize(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))))), MkExpMember(classExp, MkIdentifier("typeSize"))));
ProcessExpressionType(exp);
ProcessExpression(exp);
}
}
break;
}
case 11:
{
if(exp->cast.exp)
{
exp->cast.exp->usage |= exp->usage & (((unsigned int)(0x1)) | (((unsigned int)(0x1)) << 4));
ProcessExpression(exp->cast.exp);
if(exp->cast.exp->byReference)
exp->byReference = exp->cast.exp->byReference;
if(exp->expType && exp->expType->kind == 8 && exp->expType->_class && exp->expType->_class->registered && exp->expType->_class->registered->type == 1 && exp->cast.exp->expType && (exp->cast.exp->expType->kind == 13 || exp->cast.exp->expType->kind == 12 || (exp->cast.exp->expType->kind == 8 && exp->cast.exp->expType->_class && exp->cast.exp->expType->_class->registered && !strcmp(exp->cast.exp->expType->_class->registered->dataTypeString, "char *"))))
exp->byReference = 0x1;
}
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
if(((unsigned int)((exp->usage & 0x1) >> 0)))
exp->cond.elseExp->usage = (exp->cond.elseExp->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(exp->cond.elseExp);
break;
}
case 26:
{
if(exp->_classExp.specifiers && (*exp->_classExp.specifiers).first && ((struct Specifier *)(*exp->_classExp.specifiers).first)->type == 8)
{
struct Specifier * spec = (*exp->_classExp.specifiers).first;
struct Expression * argExp = GetTemplateArgExp(spec->templateParameter, thisClass, 0x1);

if(argExp)
{
FreeList(exp->_classExp.specifiers, FreeSpecifier);
if(exp->_classExp.decl)
FreeDeclarator(exp->_classExp.decl);
exp->type = 8;
exp->member.exp = argExp;
exp->member.member = MkIdentifier("dataTypeClass");
ProcessExpressionType(argExp);
ProcessExpression(exp);
}
}
else
{
char className[1024];
char * string = StringFromSpecDecl(exp->_classExp.specifiers, exp->_classExp.decl);

strcpy(className, "__ecereClass_");
FullClassNameCat(className, string, 0x1);
MangleClassName(className);
DeclareClass(FindClass(string), className);
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
FreeList(exp->_classExp.specifiers, FreeSpecifier);
if(exp->_classExp.decl)
FreeDeclarator(exp->_classExp.decl);
exp->type = 0;
exp->identifier = MkIdentifier(className);
}
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
FixRefExp(exp);
yylloc = oldyylloc;
}

static void ProcessInitializer(struct Initializer * init)
{
switch(init->type)
{
case 0:
init->exp->usage = (init->exp->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(init->exp);
if(init->exp->destType && init->exp->destType->kind == 8 && init->exp->destType->_class && init->exp->destType->_class->registered && init->exp->destType->_class->registered->type == 5)
{
FixReference(init->exp, 0x1);
}
else if(init->exp->destType && init->exp->destType->kind == 8)
FixReference(init->exp, 0x0);
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

static void ProcessDeclaration(struct Declaration * decl)
{
switch(decl->type)
{
case 1:
{
if(decl->declarators)
{
struct InitDeclarator * d;

for(d = (*decl->declarators).first; d; d = d->next)
{
if(d->initializer)
ProcessInitializer(d->initializer);
}
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
stmt->caseStmt.exp->usage = (stmt->caseStmt.exp->usage & ~0x1) | (((unsigned int)0x1) << 0);
ProcessExpression(stmt->caseStmt.exp);
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
{
ProcessExpression(exp);
}
}
break;
}
case 4:
{
if(stmt->ifStmt.exp)
{
struct Expression * exp;

((struct Expression *)(*stmt->ifStmt.exp).last)->usage = (((struct Expression *)(*stmt->ifStmt.exp).last)->usage & ~0x1) | (((unsigned int)0x1) << 0);
for(exp = (*stmt->ifStmt.exp).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
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
{
ProcessExpression(exp);
}
ProcessStatement(stmt->switchStmt.stmt);
break;
}
case 6:
{
struct Expression * exp;

((struct Expression *)(*stmt->whileStmt.exp).last)->usage = (((struct Expression *)(*stmt->whileStmt.exp).last)->usage & ~0x1) | (((unsigned int)0x1) << 0);
for(exp = (*stmt->whileStmt.exp).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
ProcessStatement(stmt->whileStmt.stmt);
break;
}
case 7:
{
struct Expression * exp;

if(stmt->doWhile.exp && (*stmt->doWhile.exp).last)
{
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
if(stmt->forStmt.check)
{
if(stmt->forStmt.check->expressions)
{
((struct Expression *)(*stmt->forStmt.check->expressions).last)->usage = (((struct Expression *)(*stmt->forStmt.check->expressions).last)->usage & ~0x1) | (((unsigned int)0x1) << 0);
}
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
{
struct Expression * exp;

if(stmt->expressions)
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

extern struct Declaration * QMkDeclarationBase(int base, struct InitDeclarator * initDecl);

static void ProcessFunction(struct FunctionDefinition * function)
{
if(function->body)
{
ProcessStatement(function->body);
if(function->tempCount)
{
struct Statement * stmt = function->body;
int c;

if(!stmt->compound.declarations)
stmt->compound.declarations = MkList();
curContext = stmt->compound.context;
for(c = 1; c <= function->tempCount; c++)
{
char ecereTemp[100];

sprintf(ecereTemp, "__ecereTemp%d", c);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*stmt->compound.declarations), (((void *)0)), QMkDeclarationBase(VOID, MkInitDeclarator(QMkPtrDecl(ecereTemp), (((void *)0)))));
}
curContext = stmt->compound.context->parent;
}
}
}

static void ProcessMemberInitData(struct MemberInit * member)
{
if(member->initializer)
ProcessInitializer(member->initializer);
}

static void ProcessInstantiation(struct Instantiation * inst)
{
if(inst->members)
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

extern struct __ecereNameSpace__ecere__sys__OldList *  ast;

void ProcessMemberAccess()
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
}
for(external = (*ast).first; external; external = external->next)
{
curExternal = external;
if(external->type == 0)
{
ProcessFunction(external->function);
}
else if(external->type == 1)
{
if(external->declaration)
ProcessDeclaration(external->declaration);
}
else if(external->type == 2)
{
struct ClassDefinition * _class = external->_class;

if(_class->definitions)
{
struct ClassDef * def;
struct __ecereNameSpace__ecere__com__Class * regClass = _class->symbol->registered;

for(def = (*_class->definitions).first; def; def = def->next)
{
if(def->type == 0)
{
curExternal = def->function->declarator->symbol->pointerExternal;
ProcessFunction((struct FunctionDefinition *)def->function);
}
else if(def->type == 2 && def->decl->type == 2)
{
ProcessInstantiation(def->decl->inst);
}
else if(def->type == 1 && def->defProperties)
{
struct MemberInit * defProperty;
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(regClass->fullName), thisSymbol);

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
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(regClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
if(prop->setStmt)
{
curExternal = prop->symbol->externalSet;
ProcessStatement(prop->setStmt);
}
if(prop->getStmt)
{
curExternal = prop->symbol->externalGet;
ProcessStatement(prop->getStmt);
}
if(prop->issetStmt)
{
curExternal = prop->symbol->externalIsSet;
ProcessStatement(prop->issetStmt);
}
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
FreeSymbol(thisSymbol);
}
else if(def->type == 10 && def->propertyDef)
{
struct PropertyDef * prop = def->propertyDef;

if(prop->setStmt)
{
curExternal = prop->symbol->externalSet;
ProcessStatement(prop->setStmt);
}
if(prop->getStmt)
{
curExternal = prop->symbol->externalGet;
ProcessStatement(prop->getStmt);
}
}
else if(def->type == 4 && def->propertyWatch)
{
struct PropertyWatch * propertyWatch = def->propertyWatch;
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(regClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
if(propertyWatch->compound)
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(regClass->fullName), thisSymbol);

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

void __ecereRegisterModule_pass2(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessMemberAccess", "void ProcessMemberAccess(void)", ProcessMemberAccess, module, 1);
}

void __ecereUnregisterModule_pass2(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

