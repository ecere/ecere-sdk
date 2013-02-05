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

struct Attrib
{
struct Location loc;
int type;
struct __ecereNameSpace__ecere__sys__OldList *  attribs;
} __attribute__ ((gcc_struct));

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

struct Context;

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

struct Pointer
{
struct Pointer * prev;
struct Pointer * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList *  qualifiers;
struct Pointer * pointer;
} __attribute__ ((gcc_struct));

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

struct Attribute
{
struct Attribute * prev;
struct Attribute * next;
struct Location loc;
char * attr;
struct Expression * exp;
} __attribute__ ((gcc_struct));

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

struct PropertyDef;

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

int outputLine;

unsigned int memoryGuard = 0x0;

void SetMemoryGuard(unsigned int b)
{
memoryGuard = b;
}

unsigned int GetMemoryGuard()
{
return memoryGuard;
}

extern int strcmp(const char * , const char * );

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts;

static void OutputIdentifier(struct Identifier * id, struct __ecereNameSpace__ecere__com__Instance * f)
{
if(id)
{
if(id->_class)
{
if(id->_class->type == 8)
{
if(id->_class->templateParameter && id->_class->templateParameter->identifier && id->_class->templateParameter->identifier->string)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, id->_class->templateParameter->identifier->string);
}
else
{
if(id->_class->name)
{
if(!strcmp(id->_class->name, "class"))
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "typed_object");
else
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, id->_class->name);
}
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "::");
}
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, (id && id->string) ? id->string : "(null identifier)");
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Putc;

static void OutputOperator(int op, struct __ecereNameSpace__ecere__com__Instance * f)
{
switch(op)
{
case INC_OP:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "++");
break;
case DEC_OP:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "--");
break;
case SIZEOF:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "sizeof ");
break;
case LEFT_OP:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "<<");
break;
case RIGHT_OP:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ">>");
break;
case LE_OP:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "<=");
break;
case GE_OP:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ">=");
break;
case EQ_OP:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "==");
break;
case NE_OP:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "!=");
break;
case AND_OP:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "&&");
break;
case OR_OP:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "||");
break;
case MUL_ASSIGN:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "*=");
break;
case DIV_ASSIGN:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "/=");
break;
case MOD_ASSIGN:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "%=");
break;
case ADD_ASSIGN:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "+=");
break;
case SUB_ASSIGN:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "-=");
break;
case LEFT_ASSIGN:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "<<=");
break;
case RIGHT_ASSIGN:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ">>=");
break;
case AND_ASSIGN:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "&=");
break;
case XOR_ASSIGN:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "^=");
break;
case OR_ASSIGN:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "|=");
break;
case '&':
case '*':
case '+':
case '-':
case '~':
case '!':
case '/':
case '%':
case '<':
case '>':
case '|':
case '^':
case '=':
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, char ch))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Putc])(f, (char)op);
break;
case DELETE:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "delete ");
break;
}
}

static void OutputSpecifier(struct Specifier * spec, struct __ecereNameSpace__ecere__com__Instance * f);

static void OutputDeclarator(struct Declarator * decl, struct __ecereNameSpace__ecere__com__Instance * f);

void OutputTypeName(struct TypeName * type, struct __ecereNameSpace__ecere__com__Instance * f)
{
if(type->qualifiers)
{
struct Specifier * spec;

for(spec = (*type->qualifiers).first; spec; spec = spec->next)
{
OutputSpecifier(spec, f);
if(spec->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
}
}
if(type->declarator)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputDeclarator(type->declarator, f);
}
if(!type->qualifiers && !type->declarator)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "...");
}

static void OutputStatement(struct Statement * stmt, struct __ecereNameSpace__ecere__com__Instance * f);

static void OutputInstance(struct Instantiation * inst, struct __ecereNameSpace__ecere__com__Instance * f);

extern int printf(char * , ...);

static void OutputInitializer(struct Initializer * initializer, struct __ecereNameSpace__ecere__com__Instance * f);

void OutputExpression(struct Expression * exp, struct __ecereNameSpace__ecere__com__Instance * f)
{
switch(exp->type)
{
case 26:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "class(");
if(exp->_classExp.specifiers)
{
struct Specifier * spec;

for(spec = (*exp->_classExp.specifiers).first; spec; spec = spec->next)
{
OutputSpecifier(spec, f);
if(spec->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
}
if(exp->_classExp.decl)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputDeclarator(exp->_classExp.decl, f);
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")");
}
break;
case 25:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "__extension__ (");
OutputStatement(exp->compound, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")");
break;
case 13:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "new ");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputTypeName(exp->_renew.typeName, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "[");
OutputExpression(exp->_renew.size, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "]");
break;
case 28:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "new0 ");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputTypeName(exp->_renew.typeName, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "[");
OutputExpression(exp->_renew.size, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "]");
break;
case 14:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "renew ");
OutputExpression(exp->_renew.exp, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputTypeName(exp->_renew.typeName, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "[");
OutputExpression(exp->_renew.size, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "]");
break;
case 29:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "renew0 ");
OutputExpression(exp->_renew.exp, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputTypeName(exp->_renew.typeName, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "[");
OutputExpression(exp->_renew.size, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "]");
break;
case 0:
if(exp->identifier)
OutputIdentifier(exp->identifier, f);
break;
case 1:
if(exp->instance)
OutputInstance(exp->instance, f);
break;
case 2:
if(exp->constant)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, exp->constant);
else
printf("");
break;
case 3:
if(exp->string)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, exp->string);
break;
case 4:
if(exp->op.exp1)
{
OutputExpression(exp->op.exp1, f);
if(exp->op.exp2)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
}
OutputOperator(exp->op.op, f);
if(exp->op.exp2)
{
if(exp->op.exp1 || (exp->op.exp2->type == 4 && !exp->op.exp2->op.exp1 && exp->op.exp2->op.op == exp->op.op))
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputExpression(exp->op.exp2, f);
}
break;
case 34:
case 5:
{
struct Expression * expression;

if(exp->type == 34)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "__extension__ (");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "(");
if(exp->list)
{
for(expression = (*exp->list).first; expression; expression = expression->next)
{
OutputExpression(expression, f);
if(expression->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")");
break;
}
case 6:
{
struct Expression * expression;

if(exp->index.exp)
OutputExpression(exp->index.exp, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "[");
if(exp->index.index)
for(expression = (*exp->index.index).first; expression; expression = expression->next)
{
OutputExpression(expression, f);
if(expression->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "]");
break;
}
case 7:
{
OutputExpression(exp->call.exp, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "(");
if(exp->call.arguments)
{
struct Expression * expression;

for(expression = (*exp->call.arguments).first; expression; expression = expression->next)
{
OutputExpression(expression, f);
if(expression->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")");
break;
}
case 8:
if(exp->member.exp)
OutputExpression(exp->member.exp, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ".");
if(exp->member.member)
OutputIdentifier(exp->member.member, f);
break;
case 9:
OutputExpression(exp->member.exp, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "->");
OutputIdentifier(exp->member.member, f);
break;
case 10:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "sizeof(");
OutputTypeName(exp->typeName, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")");
break;
case 38:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "__alignof__(");
OutputTypeName(exp->typeName, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")");
break;
case 35:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "__extension__ (");
if(exp->initializer.typeName)
OutputTypeName(exp->initializer.typeName, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")");
if(exp->initializer.initializer)
OutputInitializer(exp->initializer.initializer, f);
break;
case 11:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "(");
OutputTypeName(exp->cast.typeName, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")");
if(exp->cast.exp)
OutputExpression(exp->cast.exp, f);
break;
case 12:
OutputExpression(exp->cond.cond, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ? ");
{
struct Expression * expression;

for(expression = (*exp->cond.exp).first; expression; expression = expression->next)
{
OutputExpression(expression, f);
if(expression->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " : ");
OutputExpression(exp->cond.elseExp, f);
break;
case 36:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "__builtin_va_arg(");
OutputExpression(exp->vaArg.exp, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
OutputTypeName(exp->vaArg.typeName, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")");
break;
case 37:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "[");
if(exp->list)
{
struct Expression * expression;

for(expression = (*exp->list).first; expression; expression = expression->next)
{
OutputExpression(expression, f);
if(expression->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "]");
break;
}
}

static void OutputAsmField(struct AsmField * field, struct __ecereNameSpace__ecere__com__Instance * f)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, field->command);
if(field->expression)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "(");
OutputExpression(field->expression, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")");
}
}

extern unsigned int inCompiler;

extern char *  __ecereNameSpace__ecere__sys__PathCat(char *  string, char *  addedPath);

extern char *  GetIncludeFileFromID(int id);

extern char *  sourceFile;

extern void __ecereNameSpace__ecere__sys__ChangeCh(char *  string, char ch1, char ch2);

extern char *  outputFile;

extern unsigned int outputLineNumbers;

static void OutputDeclaration(struct Declaration * decl, struct __ecereNameSpace__ecere__com__Instance * f);

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern struct Declarator * SpecDeclFromString(char *  string, struct __ecereNameSpace__ecere__sys__OldList *  specs, struct Declarator * baseDecl);

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

extern struct Identifier * MkIdentifier(char *  string);

extern struct __ecereNameSpace__ecere__sys__OldList *  CopyList(struct __ecereNameSpace__ecere__sys__OldList *  source, void *  (* )(void * ));

extern struct Specifier * CopySpecifier(struct Specifier * spec);

extern struct Declarator * PlugDeclarator(struct Declarator * decl, struct Declarator * baseDecl);

extern void ListAdd(struct __ecereNameSpace__ecere__sys__OldList * list, void *  item);

extern struct Specifier * MkSpecifierName(char *  name);

extern void PrintType(struct Type * type, char *  string, unsigned int printName, unsigned int fullName);

extern struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator);

extern void InstDeclPassTypeName(struct TypeName * type, unsigned int param);

extern void FreeTypeName(struct TypeName * typeName);

int __ecereMethod___ecereNameSpace__ecere__sys__File_Printf(struct __ecereNameSpace__ecere__com__Instance * this, char *  format, ...);

static void OutputStatement(struct Statement * stmt, struct __ecereNameSpace__ecere__com__Instance * f)
{
char name[274] = "";
char origName[274] = "";

if(inCompiler)
{
if(yylloc.start.included)
{
__ecereNameSpace__ecere__sys__PathCat(name, GetIncludeFileFromID((unsigned int)yylloc.start.included));
}
else if(sourceFile)
{
__ecereNameSpace__ecere__sys__PathCat(name, sourceFile);
}
__ecereNameSpace__ecere__sys__ChangeCh(name, '\\', '/');
__ecereNameSpace__ecere__sys__PathCat(origName, outputFile);
__ecereNameSpace__ecere__sys__ChangeCh(origName, '\\', '/');
}
if(inCompiler && outputLineNumbers && stmt->loc.start.line)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n#line %d \"%s\"\n", stmt->loc.start.line, name);
outputLine += 2;
}
switch(stmt->type)
{
case 0:
OutputIdentifier(stmt->labeled.id, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ":\n");
outputLine++;
OutputStatement(stmt->labeled.stmt, f);
break;
case 1:
if(stmt->caseStmt.exp)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "case ");
OutputExpression(stmt->caseStmt.exp, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ":\n");
outputLine++;
}
else
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "default:\n");
outputLine++;
}
if(stmt->caseStmt.stmt)
OutputStatement(stmt->caseStmt.stmt, f);
break;
case 2:
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "{\n");
outputLine++;
if(stmt->compound.declarations)
{
struct Declaration * decl;

for(decl = (*stmt->compound.declarations).first; decl; decl = decl->next)
{
OutputDeclaration(decl, f);
}
}
if(stmt->compound.statements)
{
struct Statement * statement;

if(stmt->compound.declarations)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
outputLine++;
}
for(statement = (*stmt->compound.statements).first; statement; statement = statement->next)
{
OutputStatement(statement, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
outputLine++;
}
}
if(inCompiler && outputLineNumbers && stmt->loc.end.line)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n#line %d \"%s\"\n", stmt->loc.end.line, name);
outputLine += 2;
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "}");
break;
}
case 3:
{
if(stmt->expressions)
{
struct Expression * exp;

for(exp = (*stmt->expressions).first; exp; exp = exp->next)
{
OutputExpression(exp, f);
if(exp->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ";");
break;
}
case 4:
{
struct Expression * exp;

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "if(");
for(exp = (*stmt->ifStmt.exp).first; exp; exp = exp->next)
{
OutputExpression(exp, f);
if(exp->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")\n");
outputLine++;
if(stmt->ifStmt.stmt)
OutputStatement(stmt->ifStmt.stmt, f);
if(stmt->ifStmt.elseStmt)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
outputLine++;
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "else");
if(stmt->ifStmt.elseStmt->type != 4)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
outputLine++;
}
else
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputStatement(stmt->ifStmt.elseStmt, f);
}
break;
}
case 5:
{
struct Expression * exp;

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "switch(");
for(exp = (*stmt->switchStmt.exp).first; exp; exp = exp->next)
{
OutputExpression(exp, f);
if(exp->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")\n");
outputLine++;
OutputStatement(stmt->switchStmt.stmt, f);
break;
}
case 6:
{
struct Expression * exp;

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "while(");
for(exp = (*stmt->switchStmt.exp).first; exp; exp = exp->next)
{
OutputExpression(exp, f);
if(exp->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")\n");
outputLine++;
OutputStatement(stmt->whileStmt.stmt, f);
break;
}
case 7:
{
struct Expression * exp;

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "do\n");
outputLine++;
OutputStatement(stmt->whileStmt.stmt, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "while(");
for(exp = (*stmt->switchStmt.exp).first; exp; exp = exp->next)
{
OutputExpression(exp, f);
if(exp->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ");");
break;
}
case 8:
{
struct Expression * exp;

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "for(");
OutputStatement(stmt->forStmt.init, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputStatement(stmt->forStmt.check, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
if(stmt->forStmt.increment)
{
if(inCompiler && outputLineNumbers && stmt->loc.end.line)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n#line %d \"%s\"\n", stmt->loc.end.line, name);
outputLine += 2;
}
for(exp = (*stmt->forStmt.increment).first; exp; exp = exp->next)
{
OutputExpression(exp, f);
if(exp->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")\n");
outputLine++;
OutputStatement(stmt->forStmt.stmt, f);
break;
}
case 9:
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "goto ");
OutputIdentifier(stmt->gotoStmt.id, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ";");
break;
}
case 10:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "continue;");
break;
case 11:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "break;");
break;
case 12:
{
struct Expression * exp;

if(inCompiler && memoryGuard)
{
struct Expression * exp = stmt->expressions ? (*stmt->expressions).last : (((void *)0));

__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "{ ");
if(exp && exp->expType)
{
char string[1024] = "";
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;
struct TypeName * typeName;

if(exp->expType->kind == 20)
{
if(exp->expType->templateParameter->dataTypeString)
decl = SpecDeclFromString(exp->expType->templateParameter->dataTypeString, specs, MkDeclaratorIdentifier(MkIdentifier("__ecereReturnVal")));
else if(exp->expType->templateParameter->dataType)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(specs), specs = 0);
specs = CopyList(exp->expType->templateParameter->dataType->specifiers, CopySpecifier);
decl = PlugDeclarator(exp->expType->templateParameter->dataType->decl, MkDeclaratorIdentifier(MkIdentifier("__ecereReturnVal")));
}
else
{
ListAdd(specs, MkSpecifierName("uint64"));
decl = MkDeclaratorIdentifier(MkIdentifier("__ecereReturnVal"));
}
}
else
{
PrintType(exp->expType, string, 0x1, 0x1);
decl = SpecDeclFromString(string, specs, MkDeclaratorIdentifier(MkIdentifier("__ecereReturnVal")));
}
typeName = MkTypeName(specs, decl);
InstDeclPassTypeName(typeName, 0x0);
OutputTypeName(typeName, f);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ";");
FreeTypeName(typeName);
}
}
if(!memoryGuard)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "return ");
else
{
struct Expression * exp = stmt->expressions ? (*stmt->expressions).last : (((void *)0));

if(exp && exp->expType)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "__ecereReturnVal = ");
}
if(stmt->expressions)
{
for(exp = (*stmt->expressions).first; exp; exp = exp->next)
{
OutputExpression(exp, f);
if(exp->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ";");
if(inCompiler && memoryGuard)
{
struct Expression * exp = stmt->expressions ? (struct Expression *)(*stmt->expressions).last : (((void *)0));

__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, " __ecereNameSpace__ecere__com__MemoryGuard_PopLoc();");
if(exp && exp->expType)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "return __ecereReturnVal;");
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "return;");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "}");
}
break;
}
case 13:
{
struct AsmField * field;

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "__asm__ ");
if(stmt->asmStmt.spec)
OutputSpecifier(stmt->asmStmt.spec, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "(");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, stmt->asmStmt.statements);
if(stmt->asmStmt.inputFields || stmt->asmStmt.outputFields || stmt->asmStmt.clobberedFields)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ":");
if(stmt->asmStmt.inputFields)
{
for(field = (*stmt->asmStmt.inputFields).first; field; field = field->next)
{
if(field->prev)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ",");
OutputAsmField(field, f);
}
}
}
if(stmt->asmStmt.outputFields || stmt->asmStmt.clobberedFields)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ":");
if(stmt->asmStmt.outputFields)
{
for(field = (*stmt->asmStmt.outputFields).first; field; field = field->next)
{
if(field->prev)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ",");
OutputAsmField(field, f);
}
}
}
if(stmt->asmStmt.clobberedFields)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ":");
for(field = (*stmt->asmStmt.clobberedFields).first; field; field = field->next)
{
if(field->prev)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ",");
OutputAsmField(field, f);
}
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ");\n");
break;
}
}
if(inCompiler && outputLineNumbers && stmt->loc.start.line)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n#line %d \"%s\"\n", outputLine + 2, origName);
outputLine += 2;
}
}

static void OutputPointer(struct Pointer * ptr, struct __ecereNameSpace__ecere__com__Instance * f)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "*");
if(ptr->qualifiers)
{
struct Specifier * spec;

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
for(spec = (*ptr->qualifiers).first; spec; spec = spec->next)
{
OutputSpecifier(spec, f);
if(spec->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
}
}
if(ptr->pointer)
{
OutputPointer(ptr->pointer, f);
}
}

static void OutputAttrib(struct Attrib * attr, struct __ecereNameSpace__ecere__com__Instance * f);

static void OutputExtDecl(struct ExtDecl * extDecl, struct __ecereNameSpace__ecere__com__Instance * f);

extern void ProcessExpressionType(struct Expression * exp);

extern void ComputeExpression(struct Expression * exp);

extern int __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name);

static void OutputDeclarator(struct Declarator * decl, struct __ecereNameSpace__ecere__com__Instance * f)
{
switch(decl->type)
{
case 0:
if(decl->declarator)
{
OutputDeclarator(decl->declarator, f);
}
if(decl->structDecl.exp)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " : ");
OutputExpression(decl->structDecl.exp, f);
}
if(decl->structDecl.posExp)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " : ");
OutputExpression(decl->structDecl.posExp, f);
}
if(decl->structDecl.attrib)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputAttrib(decl->structDecl.attrib, f);
}
break;
case 1:
OutputIdentifier(decl->identifier, f);
break;
case 2:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "(");
OutputDeclarator(decl->declarator, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")");
break;
case 6:
if(decl->extended.extended)
OutputExtDecl(decl->extended.extended, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputDeclarator(decl->declarator, f);
break;
case 7:
OutputDeclarator(decl->declarator, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
if(decl->extended.extended)
OutputExtDecl(decl->extended.extended, f);
break;
case 3:
if(decl->declarator)
{
OutputDeclarator(decl->declarator, f);
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "[");
if(decl->array.exp)
{
ProcessExpressionType(decl->array.exp);
ComputeExpression(decl->array.exp);
OutputExpression(decl->array.exp, f);
}
else if(decl->array.enumClass)
{
struct Symbol * _class = decl->array.enumClass->symbol;

if(_class && _class->registered)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "%d", __ecereNameSpace__ecere__com__eClass_GetProperty(_class->registered, "enumSize"));
}
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "]");
break;
case 4:
{
struct TypeName * param;

if(decl->declarator)
OutputDeclarator(decl->declarator, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "(");
if(decl->function.parameters && (*decl->function.parameters).first)
{
for(param = (*decl->function.parameters).first; param; param = param->next)
{
OutputTypeName(param, f);
if(param->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")");
break;
}
case 5:
if(decl->pointer.pointer)
OutputPointer(decl->pointer.pointer, f);
if(decl->declarator)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputDeclarator(decl->declarator, f);
}
break;
}
}

static void OutputEnumerator(struct Enumerator * enumerator, struct __ecereNameSpace__ecere__com__Instance * f)
{
OutputIdentifier(enumerator->id, f);
if(enumerator->exp)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " = ");
OutputExpression(enumerator->exp, f);
}
}

static void OutputAttribute(struct Attribute * attr, struct __ecereNameSpace__ecere__com__Instance * f)
{
if(attr->attr)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, attr->attr);
if(attr->exp)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputExpression(attr->exp, f);
}
}

static void OutputAttrib(struct Attrib * attr, struct __ecereNameSpace__ecere__com__Instance * f)
{
switch(attr->type)
{
case ATTRIB:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "__attribute__((");
break;
case __ATTRIB:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "__attribute((");
break;
case ATTRIB_DEP:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "__attribute_deprecated__((");
break;
}
if(attr->attribs)
{
struct Attribute * attrib;

for(attrib = (*attr->attribs).first; attrib; attrib = attrib->next)
{
if(attrib->prev)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputAttribute(attrib, f);
}
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "))");
}

static void OutputExtDecl(struct ExtDecl * extDecl, struct __ecereNameSpace__ecere__com__Instance * f)
{
if(extDecl->type == 0 && extDecl->s)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, extDecl->s);
else if(extDecl->type == 1)
OutputAttrib(extDecl->attr, f);
}

extern struct Symbol * FindClass(char *  name);

static void OutputClassDef(struct ClassDef * def, struct __ecereNameSpace__ecere__com__Instance * f);

static void OutputSpecifier(struct Specifier * spec, struct __ecereNameSpace__ecere__com__Instance * f)
{
switch(spec->type)
{
case 0:
switch(spec->specifier)
{
case TYPEDEF:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "typedef");
break;
case EXTERN:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "extern");
break;
case STATIC:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "static");
break;
case AUTO:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "auto");
break;
case REGISTER:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "register");
break;
case CONST:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "const");
break;
case VOLATILE:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "volatile");
break;
case VOID:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "void");
break;
case CHAR:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "char");
break;
case SHORT:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "short");
break;
case INT:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "int");
break;
case UINT:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "unsigned int");
break;
case INT64:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "long long");
break;
case VALIST:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "__builtin_va_list");
break;
case LONG:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "long");
break;
case FLOAT:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "float");
break;
case DOUBLE:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "double");
break;
case SIGNED:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "signed");
break;
case UNSIGNED:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "unsigned");
break;
case TYPED_OBJECT:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "typed_object");
break;
case ANY_OBJECT:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "any_object");
break;
case CLASS:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "class");
break;
case THISCLASS:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "thisclass");
break;
}
break;
case 5:
if(spec->extDecl)
OutputExtDecl(spec->extDecl, f);
break;
case 1:
if(spec->name && !strcmp(spec->name, "class"))
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "typed_object");
}
else
{
struct Symbol * symbol = spec->symbol;

if(!symbol && spec->name)
symbol = FindClass(spec->name);
if(symbol)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, symbol->string ? symbol->string : "(null)");
}
else if(spec->name)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, spec->name);
}
break;
case 2:
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "enum");
if(spec->id)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputIdentifier(spec->id, f);
}
if(spec->list)
{
struct Enumerator * enumerator;

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n{\n");
outputLine += 2;
for(enumerator = (*spec->list).first; enumerator; enumerator = enumerator->next)
{
OutputEnumerator(enumerator, f);
if(enumerator->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n}");
outputLine++;
}
break;
}
case 3:
case 4:
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, (spec->type == 3) ? "struct" : "union");
if(spec->id)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputIdentifier(spec->id, f);
}
if(spec->definitions)
{
struct ClassDef * def;

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n{\n");
outputLine += 2;
for(def = (*spec->definitions).first; def; def = def->next)
{
OutputClassDef(def, f);
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "} __attribute__ ((gcc_struct))");
}
break;
}
case 6:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "__typeof(");
OutputExpression(spec->expression, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")");
break;
case 7:
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "subclass(");
OutputSpecifier(spec->_class, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ")");
break;
case 8:
OutputIdentifier(spec->templateParameter->identifier, f);
break;
}
}

static void OutputInitializer(struct Initializer * initializer, struct __ecereNameSpace__ecere__com__Instance * f)
{
char name[274] = "";
char origName[274] = "";

if(inCompiler)
{
if(yylloc.start.included)
{
__ecereNameSpace__ecere__sys__PathCat(name, GetIncludeFileFromID((unsigned int)yylloc.start.included));
}
else if(sourceFile)
{
__ecereNameSpace__ecere__sys__PathCat(name, sourceFile);
}
__ecereNameSpace__ecere__sys__ChangeCh(name, '\\', '/');
__ecereNameSpace__ecere__sys__PathCat(origName, outputFile);
__ecereNameSpace__ecere__sys__ChangeCh(origName, '\\', '/');
}
switch(initializer->type)
{
case 1:
{
struct Initializer * init;

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n{\n");
outputLine += 2;
if(inCompiler && outputLineNumbers && initializer->loc.start.line)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n#line %d \"%s\"\n", initializer->loc.start.line, name);
outputLine += 2;
}
for(init = (*initializer->list).first; init; init = init->next)
{
OutputInitializer(init, f);
if(init->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n}");
if(inCompiler && outputLineNumbers && initializer->loc.start.line)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n#line %d \"%s\"\n", initializer->loc.start.line, name);
outputLine += 2;
}
outputLine++;
break;
}
case 0:
if(initializer->exp)
OutputExpression(initializer->exp, f);
break;
}
}

static void OutputInitDeclarator(struct InitDeclarator * decl, struct __ecereNameSpace__ecere__com__Instance * f)
{
OutputDeclarator(decl->declarator, f);
if(decl->initializer)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " = ");
OutputInitializer(decl->initializer, f);
}
}

static void OutputDeclaration(struct Declaration * decl, struct __ecereNameSpace__ecere__com__Instance * f)
{
struct Specifier * spec;
char origName[274] = "";

switch(decl->type)
{
case 1:
{
struct InitDeclarator * d;

if(inCompiler)
{
__ecereNameSpace__ecere__sys__PathCat(origName, outputFile);
__ecereNameSpace__ecere__sys__ChangeCh(origName, '\\', '/');
}
if(decl->declarators && (*decl->declarators).first)
{
for(d = (*decl->declarators).first; d; d = d->next)
if(d->initializer)
{
char name[274] = "";

if(yylloc.start.included)
{
__ecereNameSpace__ecere__sys__PathCat(name, GetIncludeFileFromID((unsigned int)yylloc.start.included));
}
else if(sourceFile)
{
__ecereNameSpace__ecere__sys__PathCat(name, sourceFile);
}
__ecereNameSpace__ecere__sys__ChangeCh(name, '\\', '/');
if(inCompiler && outputLineNumbers && decl->loc.start.line)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n#line %d \"%s\"\n", decl->loc.start.line, name);
outputLine += 2;
}
break;
}
}
if(decl->specifiers)
{
for(spec = (*decl->specifiers).first; spec; spec = spec->next)
{
OutputSpecifier(spec, f);
if(spec->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
}
}
if(decl->declarators && (*decl->declarators).first)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
for(d = (*decl->declarators).first; d; d = d->next)
{
OutputInitDeclarator(d, f);
if(d->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
}
break;
}
case 0:
{
if(decl->specifiers)
{
for(spec = (*decl->specifiers).first; spec; spec = spec->next)
{
OutputSpecifier(spec, f);
if(spec->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
}
}
if(decl->declarators)
{
struct Declarator * d;

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
for(d = (*decl->declarators).first; d; d = d->next)
{
OutputDeclarator(d, f);
if(d->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
}
if(decl->extStorage)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputSpecifier(decl->extStorage, f);
}
break;
}
case 2:
if(decl->inst)
{
OutputInstance(decl->inst, f);
}
break;
case 3:
return ;
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ";\n");
outputLine++;
if(inCompiler && outputLineNumbers && decl->loc.start.line && decl->type == 1)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n#line %d \"%s\"\n", outputLine + 2, origName);
outputLine += 2;
}
}

static struct FunctionDefinition * curFunction;

extern struct Identifier * GetDeclId(struct Declarator * decl);

static void OutputFunction(struct FunctionDefinition * func, struct __ecereNameSpace__ecere__com__Instance * f)
{
struct FunctionDefinition * oldFunc = curFunction;

curFunction = func;
if(func->specifiers)
{
struct Specifier * spec;

for(spec = (*func->specifiers).first; spec; spec = spec->next)
{
OutputSpecifier(spec, f);
if(spec->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
}
if(func->declarator)
OutputDeclarator(func->declarator, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
outputLine++;
if(func->declarations)
{
struct Declaration * decl;

for(decl = (*func->declarations).first; decl; decl = decl->next)
{
OutputDeclaration(decl, f);
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
outputLine++;
}
if(func->body)
{
if(inCompiler && memoryGuard)
{
char name[1024] = "";
struct Identifier * id = GetDeclId(func->declarator);

if(yylloc.start.included)
{
__ecereNameSpace__ecere__sys__PathCat(name, GetIncludeFileFromID((unsigned int)yylloc.start.included));
}
else if(sourceFile)
{
__ecereNameSpace__ecere__sys__PathCat(name, sourceFile);
}
__ecereNameSpace__ecere__sys__ChangeCh(name, '\\', '/');
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "{\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereNameSpace__ecere__com__MemoryGuard_PushLoc(\"%s:%s\");\n", name, id->string);
outputLine += 2;
}
OutputStatement(func->body, f);
if(inCompiler && memoryGuard)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereNameSpace__ecere__com__MemoryGuard_PopLoc();\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "}\n");
outputLine += 2;
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
outputLine++;
}
curFunction = oldFunc;
}

static void OutputMemberInit(struct MemberInit * init, struct __ecereNameSpace__ecere__com__Instance * f)
{
if(init->identifiers)
{
if((*init->identifiers).count > 1)
{
struct Identifier * id;

for(id = (*init->identifiers).first; id; id = id->next)
{
OutputIdentifier(id, f);
if(id->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ".");
}
}
else if((*init->identifiers).first)
OutputIdentifier((*init->identifiers).first, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " = ");
}
if(init->initializer)
OutputInitializer(init->initializer, f);
}

static void OutputClassFunction(struct ClassFunction * func, struct __ecereNameSpace__ecere__com__Instance * f);

static void OutputMembersInit(struct MembersInit * init, struct __ecereNameSpace__ecere__com__Instance * f)
{
switch(init->type)
{
case 0:
{
struct MemberInit * member;

if(init->dataMembers)
{
for(member = (*init->dataMembers).first; member; member = member->next)
{
OutputMemberInit(member, f);
if(member->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
}
break;
}
case 1:
OutputClassFunction(init->function, f);
break;
}
}

static void OutputInstance(struct Instantiation * inst, struct __ecereNameSpace__ecere__com__Instance * f)
{
if(inst->_class)
OutputSpecifier(inst->_class, f);
if(inst->exp)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
OutputExpression(inst->exp, f);
}
if(inst->members && (*inst->members).count > 1)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n{\n");
outputLine += 2;
}
else if(inst->members)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " { ");
else
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "{");
if(inst->members)
{
struct MembersInit * init;

for(init = (*inst->members).first; init; init = init->next)
{
OutputMembersInit(init, f);
if(init->type == 0 && init->next)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ";\n");
outputLine++;
}
}
}
if(inst->members)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " }");
else
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "}");
}

static void OutputClassFunction(struct ClassFunction * func, struct __ecereNameSpace__ecere__com__Instance * f)
{
if(func->specifiers)
{
struct Specifier * spec;

for(spec = (*func->specifiers).first; spec; spec = spec->next)
{
OutputSpecifier(spec, f);
if(spec->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " ");
}
if(func->declarator)
OutputDeclarator(func->declarator, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
outputLine++;
if(func->declarations)
{
struct Declaration * decl;

for(decl = (*func->declarations).first; decl; decl = decl->next)
{
OutputDeclaration(decl, f);
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
outputLine++;
}
if(func->body)
{
OutputStatement(func->body, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
outputLine++;
}
else
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ";");
}

static void OutputClassDef(struct ClassDef * def, struct __ecereNameSpace__ecere__com__Instance * f)
{
switch(def->type)
{
case 2:
if(def->decl)
{
OutputDeclaration(def->decl, f);
if(def->next && def->next->type != 2)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
outputLine++;
}
}
break;
case 1:
{
struct MemberInit * init;

for(init = (*def->defProperties).first; init; init = init->next)
{
OutputMemberInit(init, f);
if(init->next)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ", ");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ";\n\n");
outputLine += 2;
break;
}
case 0:
OutputClassFunction(def->function, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
outputLine++;
break;
}
}

static void OutputClass(struct ClassDefinition * _class, struct __ecereNameSpace__ecere__com__Instance * f)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "class ");
OutputSpecifier(_class->_class, f);
if(_class->baseSpecs)
{
struct Specifier * spec;

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, " : ");
for(spec = (*_class->baseSpecs).first; spec; spec = spec->next)
{
OutputSpecifier(spec, f);
}
}
if(_class->definitions)
{
struct ClassDef * def;

((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n{\n");
outputLine += 2;
for(def = (*_class->definitions).first; def; def = def->next)
{
OutputClassDef(def, f);
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "}\n");
outputLine++;
}
else
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, ";");
}

void OutputTree(struct __ecereNameSpace__ecere__sys__OldList * ast, struct __ecereNameSpace__ecere__com__Instance * f)
{
struct External * external;

outputLine = 26;
for(external = ast->first; external; external = external->next)
{
switch(external->type)
{
case 0:
OutputFunction(external->function, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
outputLine++;
break;
case 1:
OutputDeclaration(external->declaration, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
outputLine++;
break;
case 2:
OutputClass(external->_class, f);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
outputLine++;
break;
}
}
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

struct __ecereNameSpace__ecere__sys__TempFile
{
char __ecere_padding[24];
} __attribute__ ((gcc_struct));

extern char *  __ecereNameSpace__ecere__sys__TrimRSpaces(char *  string, char *  output);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

char * StringFromSpecDecl(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl)
{
char * string;
struct TypeName * typeName = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TypeName);
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);
unsigned int size;

typeName->qualifiers = specs;
typeName->declarator = decl;
OutputTypeName(typeName, f);
((typeName ? (__ecereClass_TypeName->Destructor ? __ecereClass_TypeName->Destructor(typeName) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(typeName)) : 0), typeName = 0);
size = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize])(f);
string = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (size + 1));
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(f, 0, 0);
((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read])(f, string, 1, (unsigned int)size);
string[size] = '\0';
__ecereNameSpace__ecere__sys__TrimRSpaces(string, string);
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
return string;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

void __ecereRegisterModule_output(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetMemoryGuard", "void SetMemoryGuard(bool b)", SetMemoryGuard, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetMemoryGuard", "bool GetMemoryGuard(void)", GetMemoryGuard, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("OutputTypeName", "void OutputTypeName(TypeName type, ecere::sys::File f)", OutputTypeName, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("OutputExpression", "void OutputExpression(Expression exp, ecere::sys::File f)", OutputExpression, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("OutputTree", "void OutputTree(ecere::sys::OldList ast, ecere::sys::File f)", OutputTree, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("StringFromSpecDecl", "char * StringFromSpecDecl(ecere::sys::OldList specs, Declarator decl)", StringFromSpecDecl, module, 1);
}

void __ecereUnregisterModule_output(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

