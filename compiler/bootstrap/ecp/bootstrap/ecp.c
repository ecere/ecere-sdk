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

struct Statement;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TypeName;

struct TypeName;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Initializer;

struct Initializer;

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
struct __ecereNameSpace__ecere__com__Instance * pointer;
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
struct __ecereNameSpace__ecere__com__Instance * pointer;
struct Initializer * initializer;
struct InitDeclarator * initDeclarator;
struct TypeName * typeName;
struct Declaration * declaration;
struct Statement * stmt;
struct FunctionDefinition * function;
struct External * external;
struct Context * context;
struct __ecereNameSpace__ecere__com__Instance * asmField;
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
struct __ecereNameSpace__ecere__com__Instance * dbtableEntry;
struct __ecereNameSpace__ecere__com__Instance * dbindexItem;
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

extern YYSTYPE yylval;

extern struct Location yylloc;

typedef __builtin_va_list __gnuc_va_list;

typedef __gnuc_va_list va_list;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Definition;

struct Definition
{
struct Definition * prev;
struct Definition * next;
char *  name;
int type;
} __attribute__ ((gcc_struct));

struct ClassDefine
{
struct Definition * prev;
struct Definition * next;
char *  name;
int type;
char * base;
struct __ecereNameSpace__ecere__sys__OldList propertiesAndMembers;
struct __ecereNameSpace__ecere__sys__OldList classProperties;
struct __ecereNameSpace__ecere__sys__OldList methods;
unsigned int isRemote;
unsigned int isWatchable;
unsigned int fixed;
unsigned int isStatic;
unsigned int noExpansion;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassDefine;

struct Define
{
struct Definition * prev;
struct Definition * next;
char *  name;
int type;
struct Expression * exp;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_Define;

struct FunctionDefine
{
struct Definition * prev;
struct Definition * next;
char *  name;
int type;
char * dataType;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionDefine;

struct DataDefine
{
struct Definition * prev;
struct Definition * next;
char *  name;
int type;
char * dataType;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_DataDefine;

struct MethodDefine
{
struct MethodDefine * prev, * next;
char * name;
int memberAccess;
char * type;
unsigned int isVirtual;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_MethodDefine;

struct PropertyDefine
{
struct PropertyDefine * prev, * next;
char * name;
int isProperty;
char * type;
unsigned int isWatchable;
int memberAccess;
unsigned int isVirtual;
unsigned int hasSet, hasGet;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyDefine;

struct DataMemberDefine
{
struct DataMemberDefine * prev, * next;
char * name;
int isProperty;
char * type;
struct __ecereNameSpace__ecere__sys__OldList dataMembers;
struct __ecereNameSpace__ecere__sys__OldList classProperties;
int memberAccess;
int memberType;
int size, bitPos;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_DataMemberDefine;

void FreeMethodDefine(struct MethodDefine * method)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(method->name), method->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(method->type), method->type = 0);
}

void FreeDataMemberDefine(struct DataMemberDefine * dataMember)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(dataMember->name), dataMember->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(dataMember->type), dataMember->type = 0);
}

void FreeDataDefine(struct DataDefine * data)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(data->name), data->name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(data->type), data->type = 0);
}

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(struct __ecereNameSpace__ecere__sys__OldList * this, void (*  freeFn)(void * ));

void FreeDefinition(struct Definition * definition)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(definition->name), definition->name = 0);
switch(definition->type)
{
case 1:
{
struct ClassDefine * classDefine = (struct ClassDefine *)definition;

(__ecereNameSpace__ecere__com__eSystem_Delete(classDefine->base), classDefine->base = 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&classDefine->methods, FreeMethodDefine);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&classDefine->propertiesAndMembers, FreeDataMemberDefine);
break;
}
case 3:
(__ecereNameSpace__ecere__com__eSystem_Delete(((struct FunctionDefine *)definition)->dataType), ((struct FunctionDefine *)definition)->dataType = 0);
break;
case 4:
(__ecereNameSpace__ecere__com__eSystem_Delete(((struct DataDefine *)definition)->dataType), ((struct DataDefine *)definition)->dataType = 0);
break;
case 2:
break;
}
}

static unsigned int globalInstance = 0x0;

static struct Context * globalContext;

static struct __ecereNameSpace__ecere__sys__OldList defines, imports, precompDefines;

static struct __ecereNameSpace__ecere__com__Instance * privateModule;

struct __ecereNameSpace__ecere__sys__OldList _excludedSymbols = 
{
0, 0, 0, (unsigned int)&((struct Symbol *)(void *)0)->left, 0
};

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

static struct __ecereNameSpace__ecere__com__NameSpace globalData;

extern struct Identifier * GetDeclId(struct Declarator * decl);

extern char *  __ecereNameSpace__ecere__sys__CopyString(char *  string);

extern void ProcessExpressionType(struct Expression * exp);

extern void ComputeExpression(struct Expression * exp);

extern int strtol(char * , char * * , int base);

extern void FreeExpression(struct Expression * exp);

extern struct Type * ProcessType(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

extern void PrintType(struct Type * type, char *  string, unsigned int printName, unsigned int fullName);

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

extern struct __ecereNameSpace__ecere__com__BitMember * __ecereNameSpace__ecere__com__eClass_AddBitMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, int bitSize, int bitPos, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_AddDataMember(struct __ecereNameSpace__ecere__com__DataMember * member, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_New(int type, int declMode);

extern unsigned int __ecereNameSpace__ecere__com__eMember_AddMember(struct __ecereNameSpace__ecere__com__DataMember * addTo, struct __ecereNameSpace__ecere__com__DataMember * dataMember);

extern unsigned int __ecereNameSpace__ecere__com__eClass_AddMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__DataMember * dataMember);

extern struct __ecereNameSpace__ecere__sys__OldList *  MkListOne(void *  item);

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

extern char *  StringFromSpecDecl(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  dataType, void *  setStmt, void *  getStmt, int declMode);

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

extern struct __ecereNameSpace__ecere__com__ClassProperty * __ecereNameSpace__ecere__com__eClass_AddClassProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  dataType, void *  setStmt, void *  getStmt);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

static void AddDefinitions(struct ClassDefine * classDefine, struct DataMemberDefine * parentMemberDefine, struct __ecereNameSpace__ecere__com__Class * regClass, struct __ecereNameSpace__ecere__com__DataMember * member, struct __ecereNameSpace__ecere__sys__OldList * definitions)
{
void * __ecereTemp1;

if(definitions != (((void *)0)))
{
struct ClassDef * def;

for(def = definitions->first; def; def = def->next)
{
if(def->type == 2)
{
struct Declaration * decl = def->decl;
struct __ecereNameSpace__ecere__com__DataMember * dataMember;
struct Type * dataType;
struct DataMemberDefine * dataMemberDefine;

if(decl->type == 0)
{
struct Declarator * d;

if(decl->declarators)
{
for(d = (*decl->declarators).first; d; d = d->next)
{
{
struct Identifier * declId = GetDeclId(d);

dataMemberDefine = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_DataMemberDefine), ((struct DataMemberDefine *)__ecereTemp1)->isProperty = 3, ((struct DataMemberDefine *)__ecereTemp1)->memberType = 0, ((struct DataMemberDefine *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(declId->string), ((struct DataMemberDefine *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&parentMemberDefine->dataMembers, dataMemberDefine);
if(regClass && regClass->type == 2)
{
struct Expression * sizeExp = d->structDecl.exp, * posExp = d->structDecl.posExp;
int bitSize = 0, bitPos = -1;
char dataTypeString[1024];

dataTypeString[0] = '\0';
if(sizeExp)
{
ProcessExpressionType(sizeExp);
ComputeExpression(sizeExp);
if(sizeExp->isConstant)
bitSize = strtol(sizeExp->constant, (((void *)0)), 0);
FreeExpression(sizeExp);
}
if(posExp)
{
ProcessExpressionType(posExp);
ComputeExpression(posExp);
if(posExp->isConstant)
bitPos = strtol(posExp->constant, (((void *)0)), 0);
FreeExpression(posExp);
}
d->structDecl.exp = (((void *)0));
d->structDecl.posExp = (((void *)0));
dataType = ProcessType(decl->specifiers, d);
PrintType(dataType, dataTypeString, 0x0, 0x1);
{
struct __ecereNameSpace__ecere__com__BitMember * member = __ecereNameSpace__ecere__com__eClass_AddBitMember(regClass, declId->string, dataTypeString, 0, 0, def->memberAccess);

member->size = bitSize;
member->pos = bitPos;
dataMember = (struct __ecereNameSpace__ecere__com__DataMember *)member;
}
if(dataMember)
dataMember->dataType = dataType;
dataMemberDefine->size = bitSize;
dataMemberDefine->bitPos = bitPos;
dataMemberDefine->type = __ecereNameSpace__ecere__sys__CopyString(dataTypeString);
}
else
{
{
char typeString[1024];

typeString[0] = '\0';
dataType = ProcessType(decl->specifiers, d);
PrintType(dataType, typeString, 0x0, 0x1);
if(member)
dataMember = __ecereNameSpace__ecere__com__eMember_AddDataMember(member, declId->string, typeString, 0, 0, def->memberAccess);
else
dataMember = __ecereNameSpace__ecere__com__eClass_AddDataMember(regClass, declId->string, typeString, 0, 0, def->memberAccess);
if(dataMember)
dataMember->dataType = dataType;
dataMemberDefine->type = __ecereNameSpace__ecere__sys__CopyString(typeString);
}
}
dataMemberDefine->memberAccess = def->memberAccess;
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
struct __ecereNameSpace__ecere__com__DataMember * dataMember = __ecereNameSpace__ecere__com__eMember_New((spec->type == 4) ? 1 : 2, def->memberAccess);

dataMemberDefine = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_DataMemberDefine), ((struct DataMemberDefine *)__ecereTemp1)->isProperty = 3, ((struct DataMemberDefine *)__ecereTemp1)->memberType = (spec->type == 4) ? 1 : 2, ((struct DataMemberDefine *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&parentMemberDefine->dataMembers, dataMemberDefine);
AddDefinitions((((void *)0)), dataMemberDefine, (((void *)0)), dataMember, spec->definitions);
if(member)
__ecereNameSpace__ecere__com__eMember_AddMember(member, dataMember);
else
__ecereNameSpace__ecere__com__eClass_AddMember(regClass, dataMember);
}
else if(spec->definitions && spec->id && (*spec->definitions).count)
{
{
struct Identifier * id = spec->id;
char typeString[1024];

typeString[0] = '\0';
spec->id = (((void *)0));
decl->declarators = MkListOne(MkDeclaratorIdentifier(id));
dataType = ProcessType(decl->specifiers, (((void *)0)));
PrintType(dataType, typeString, 0x0, 0x1);
if(member)
dataMember = __ecereNameSpace__ecere__com__eMember_AddDataMember(member, id->string, typeString, 0, 0, def->memberAccess);
else
dataMember = __ecereNameSpace__ecere__com__eClass_AddDataMember(regClass, id->string, typeString, 0, 0, def->memberAccess);
if(dataMember)
dataMember->dataType = dataType;
}
}
}
}
}
}
else if(decl->type == 2)
{
struct Instantiation * inst = decl->inst;
struct Expression * exp = inst->exp;

if(exp)
{
{
char * string = exp->identifier->string;

{
struct Type * dataType = (dataType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), dataType->kind = 8, dataType->_class = inst->_class->symbol, dataType->refCount = 1, dataType);

if(member)
dataMember = __ecereNameSpace__ecere__com__eMember_AddDataMember(member, string, inst->_class->name, 0, 0, def->memberAccess);
else
dataMember = __ecereNameSpace__ecere__com__eClass_AddDataMember(regClass, string, inst->_class->name, 0, 0, def->memberAccess);
if(dataMember)
dataMember->dataType = dataType;
}
dataMemberDefine = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_DataMemberDefine), ((struct DataMemberDefine *)__ecereTemp1)->isProperty = 3, ((struct DataMemberDefine *)__ecereTemp1)->memberType = 0, ((struct DataMemberDefine *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(string), ((struct DataMemberDefine *)__ecereTemp1)->type = __ecereNameSpace__ecere__sys__CopyString(inst->_class->name), ((struct DataMemberDefine *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&parentMemberDefine->dataMembers, dataMemberDefine);
}
}
}
}
else if(def->type == 3 && def->propertyDef)
{
struct PropertyDef * propertyDef = def->propertyDef;

{
struct __ecereNameSpace__ecere__com__Property * prop;
struct PropertyDefine * propDefine;

{
char * dataTypeString = StringFromSpecDecl(propertyDef->specifiers, propertyDef->declarator);

prop = __ecereNameSpace__ecere__com__eClass_AddProperty(regClass, propertyDef->conversion ? (((void *)0)) : propertyDef->id->string, dataTypeString, propertyDef->setStmt, propertyDef->getStmt, def->memberAccess);
if(prop)
{
prop->IsSet = (void *)propertyDef->issetStmt;
prop->compiled = 0x0;
}
(__ecereNameSpace__ecere__com__eSystem_Delete(dataTypeString), dataTypeString = 0);
}
if(prop)
{
prop->symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString(propertyDef->symbol->string), ((struct Symbol *)__ecereTemp1)->id = propertyDef->symbol->id, ((struct Symbol *)__ecereTemp1)->type = propertyDef->symbol->type, ((struct Symbol *)__ecereTemp1));
if(propertyDef->symbol->type)
propertyDef->symbol->type->refCount++;
propDefine = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_PropertyDefine), ((struct PropertyDefine *)__ecereTemp1)->isProperty = 1, ((struct PropertyDefine *)__ecereTemp1)->name = prop->conversion ? (((void *)0)) : __ecereNameSpace__ecere__sys__CopyString(prop->name), ((struct PropertyDefine *)__ecereTemp1)->type = __ecereNameSpace__ecere__sys__CopyString(prop->dataTypeString), ((struct PropertyDefine *)__ecereTemp1)->isVirtual = 0x0, ((struct PropertyDefine *)__ecereTemp1)->memberAccess = def->memberAccess, ((struct PropertyDefine *)__ecereTemp1)->hasSet = propertyDef->setStmt ? 0x1 : 0x0, ((struct PropertyDefine *)__ecereTemp1)->hasGet = propertyDef->getStmt ? 0x1 : 0x0, ((struct PropertyDefine *)__ecereTemp1)->isWatchable = propertyDef->isWatchable, ((struct PropertyDefine *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&classDefine->propertiesAndMembers, propDefine);
}
}
}
else if(def->type == 10 && def->propertyDef)
{
struct PropertyDef * propertyDef = def->propertyDef;

{
struct __ecereNameSpace__ecere__com__ClassProperty * prop;
struct PropertyDefine * propDefine;

{
char * dataTypeString = StringFromSpecDecl(propertyDef->specifiers, propertyDef->declarator);

prop = __ecereNameSpace__ecere__com__eClass_AddClassProperty(regClass, propertyDef->id->string, dataTypeString, propertyDef->setStmt, propertyDef->getStmt);
(__ecereNameSpace__ecere__com__eSystem_Delete(dataTypeString), dataTypeString = 0);
}
if(prop)
{
propDefine = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_PropertyDefine), ((struct PropertyDefine *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(prop->name), ((struct PropertyDefine *)__ecereTemp1)->type = __ecereNameSpace__ecere__sys__CopyString(prop->dataTypeString), ((struct PropertyDefine *)__ecereTemp1)->hasSet = propertyDef->setStmt ? 0x1 : 0x0, ((struct PropertyDefine *)__ecereTemp1)->hasGet = propertyDef->getStmt ? 0x1 : 0x0, ((struct PropertyDefine *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&classDefine->classProperties, propDefine);
}
}
}
else if(def->type == 7)
{
classDefine->fixed = 0x1;
}
else if(def->type == 6)
{
classDefine->noExpansion = 0x1;
}
else if(def->type == 13)
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__Method * method;

if((prop = __ecereNameSpace__ecere__com__eClass_FindProperty(regClass, def->id->string, privateModule)))
{
struct PropertyDefine * propDefine;

prop = __ecereNameSpace__ecere__com__eClass_AddProperty(regClass, def->id->string, (((void *)0)), (((void *)0)), (((void *)0)), def->memberAccess);
if(prop)
{
propDefine = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_PropertyDefine), ((struct PropertyDefine *)__ecereTemp1)->isProperty = 1, ((struct PropertyDefine *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(prop->name), ((struct PropertyDefine *)__ecereTemp1)->memberAccess = def->memberAccess, ((struct PropertyDefine *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&classDefine->propertiesAndMembers, propDefine);
}
}
else if((member = __ecereNameSpace__ecere__com__eClass_FindDataMember(regClass, def->id->string, privateModule, (((void *)0)), (((void *)0)))))
{
struct DataMemberDefine * dataMemberDefine;

member = __ecereNameSpace__ecere__com__eClass_AddDataMember(regClass, def->id->string, (((void *)0)), 0, 0, def->memberAccess);
dataMemberDefine = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_DataMemberDefine), ((struct DataMemberDefine *)__ecereTemp1)->isProperty = 3, ((struct DataMemberDefine *)__ecereTemp1)->memberType = 0, ((struct DataMemberDefine *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(def->id->string), ((struct DataMemberDefine *)__ecereTemp1)->memberAccess = def->memberAccess, ((struct DataMemberDefine *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&parentMemberDefine->dataMembers, dataMemberDefine);
}
}
}
}
}

extern void FreeType(struct Type * type);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, char *  name, char *  baseName, int size, int sizeClass, unsigned int (* )(void * ), void (* )(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern char *  strcpy(char * , const char * );

extern char *  strcat(char * , const char * );

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

extern struct __ecereNameSpace__ecere__com__ClassTemplateParameter * __ecereNameSpace__ecere__com__eClass_AddTemplateParameter(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, int type, void *  info, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * defaultArg);

static void ProcessClass(int classType, struct __ecereNameSpace__ecere__sys__OldList * definitions, struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * baseSpecs, struct __ecereNameSpace__ecere__sys__OldList * enumValues, unsigned int isWatchable, int declMode)
{
void * __ecereTemp1;
struct __ecereNameSpace__ecere__com__Class * regClass;
struct ClassDef * def;
struct ClassDefine * classDefine;
char baseName[1024];
unsigned int unitType = 0x0;
unsigned int wouldBeEnum = 0x0;
int inheritanceAccess = 1;

baseName[0] = '\0';
if(baseSpecs != (((void *)0)))
{
struct Type * baseType = ProcessType(baseSpecs, (((void *)0)));

PrintType(baseType, baseName, 0x0, 0x1);
if(baseType->kind == 8)
{
if(baseType->_class->registered && classType == 0)
{
if(baseType->_class->registered->type == 3)
classType = 3;
else if(baseType->_class->registered->type == 2)
classType = 2;
else if(baseType->_class->registered->type == 5)
classType = 5;
else if(baseType->_class->registered->type == 4)
{
wouldBeEnum = 0x1;
}
}
}
else if(baseType->kind == 9 || baseType->kind == 10)
{
classType = 5;
baseName[0] = '\0';
}
else
unitType = 0x1;
FreeType(baseType);
if(((struct Specifier *)baseSpecs->first)->type == 0 && ((struct Specifier *)baseSpecs->first)->specifier == PRIVATE)
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
struct Declaration * decl = def->decl;

if(decl->type == 0)
{
if(unitType)
{
classType = 2;
break;
}
if(decl->declarators)
{
struct Declarator * d;

for(d = (*decl->declarators).first; d; d = d->next)
{
if(d->structDecl.exp)
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
regClass = symbol->registered = __ecereNameSpace__ecere__com__eSystem_RegisterClass((classType == 6) ? 1 : classType, symbol->string, baseName[0] ? baseName : (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), privateModule, 1, inheritanceAccess);
if(regClass)
regClass->symbol = symbol;
classDefine = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDefine), ((struct ClassDefine *)__ecereTemp1)->type = 1, ((struct ClassDefine *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(symbol->string), ((struct ClassDefine *)__ecereTemp1)->base = baseName[0] ? __ecereNameSpace__ecere__sys__CopyString(baseName) : (((void *)0)), ((struct ClassDefine *)__ecereTemp1)->isStatic = declMode == 3, ((struct ClassDefine *)__ecereTemp1)->isRemote = symbol->isRemote, ((struct ClassDefine *)__ecereTemp1)->isWatchable = isWatchable, ((struct ClassDefine *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&precompDefines, classDefine);
if(classType == 6)
{
struct __ecereNameSpace__ecere__com__DataMember * unionMember = __ecereNameSpace__ecere__com__eMember_New(1, 1);
struct DataMemberDefine * unionDefine;

unionDefine = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_DataMemberDefine), ((struct DataMemberDefine *)__ecereTemp1)->isProperty = 3, ((struct DataMemberDefine *)__ecereTemp1)->memberType = 1, ((struct DataMemberDefine *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&classDefine->propertiesAndMembers, unionDefine);
AddDefinitions(classDefine, unionDefine, regClass, unionMember, definitions);
__ecereNameSpace__ecere__com__eClass_AddMember(regClass, unionMember);
}
else if(regClass)
AddDefinitions(classDefine, (struct DataMemberDefine *)classDefine, regClass, (((void *)0)), definitions);
if(definitions != (((void *)0)))
{
for(def = definitions->first; def; def = def->next)
{
if(def->type == 0)
{
struct ClassFunction * func = def->function;

if(!func->dontMangle && func->declarator)
{
struct Identifier * id = GetDeclId(func->declarator);
struct __ecereNameSpace__ecere__com__Method * method;
struct MethodDefine * methodDefine;

{
char * dataTypeString = StringFromSpecDecl(func->specifiers, func->declarator);

if(func->isVirtual)
method = __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(regClass, id->string, dataTypeString, func->declarator->symbol, def->memberAccess);
else
method = __ecereNameSpace__ecere__com__eClass_AddMethod(regClass, id->string, dataTypeString, func->declarator->symbol, def->memberAccess);
(__ecereNameSpace__ecere__com__eSystem_Delete(dataTypeString), dataTypeString = 0);
}
if(method)
{
method->symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString(func->declarator->symbol->string), ((struct Symbol *)__ecereTemp1)->id = func->declarator->symbol->id, ((struct Symbol *)__ecereTemp1)->type = func->declarator->symbol->type, ((struct Symbol *)__ecereTemp1));
if(func->declarator->symbol->type)
func->declarator->symbol->type->refCount++;
((struct Symbol *)method->symbol)->method = method;
func->declarator->symbol = (((void *)0));
if(method->type != 1 || method->_class == regClass)
{
methodDefine = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_MethodDefine), ((struct MethodDefine *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(method->name), ((struct MethodDefine *)__ecereTemp1)->type = __ecereNameSpace__ecere__sys__CopyString(method->dataTypeString), ((struct MethodDefine *)__ecereTemp1)->memberAccess = def->memberAccess, ((struct MethodDefine *)__ecereTemp1)->isVirtual = method->type == 1, ((struct MethodDefine *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&classDefine->methods, methodDefine);
}
}
}
}
else if(def->type == 13)
{
struct __ecereNameSpace__ecere__com__Method * method;

if((method = __ecereNameSpace__ecere__com__eClass_FindMethod(regClass, def->id->string, privateModule)))
{
struct MethodDefine * methodDefine;

method = __ecereNameSpace__ecere__com__eClass_AddMethod(regClass, def->id->string, (((void *)0)), (((void *)0)), def->memberAccess);
methodDefine = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_MethodDefine), ((struct MethodDefine *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(method->name), ((struct MethodDefine *)__ecereTemp1)->memberAccess = def->memberAccess, ((struct MethodDefine *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&classDefine->methods, methodDefine);
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
0, 0, 0, 0, 0
};

if(param->defaultArgument)
{
switch(param->type)
{
case 0:
defaultArg.dataTypeString = StringFromSpecDecl(param->defaultArgument->templateDatatype->specifiers, param->defaultArgument->templateDatatype->decl);
break;
case 1:
{
char memberString[1024];

memberString[0] = '\0';
if(param->defaultArgument->identifier->_class && param->defaultArgument->identifier->_class->name)
{
if(param->defaultArgument->identifier->_class->type == 8)
strcpy(memberString, param->defaultArgument->identifier->_class->templateParameter->identifier->string);
else
strcpy(memberString, param->defaultArgument->identifier->_class->name);
}
if(memberString[0])
{
strcat(memberString, "::");
}
strcat(memberString, param->defaultArgument->identifier->string);
defaultArg.memberString = __ecereNameSpace__ecere__sys__CopyString(memberString);
break;
}
case 2:
{
struct Operand op;

ProcessExpressionType(param->defaultArgument->expression);
ComputeExpression(param->defaultArgument->expression);
op = GetOperand(param->defaultArgument->expression);
defaultArg.expression.ui64 = op.ui64;
break;
}
}
}
if(param->type == 1)
{
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(regClass, param->identifier->string, param->type, (void *)param->memberType, &defaultArg);
}
else
{
char * typeString = param->dataType ? StringFromSpecDecl(param->dataType->specifiers, param->dataType->decl) : (((void *)0));

__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(regClass, param->identifier->string, param->type, typeString, &defaultArg);
}
}
}
}

extern void SetParsingType(unsigned int b);

extern void __ecereNameSpace__ecere__com__eEnum_AddFixedValue(struct __ecereNameSpace__ecere__com__Class * _class, char *  string, int value);

extern int __ecereNameSpace__ecere__com__eEnum_AddValue(struct __ecereNameSpace__ecere__com__Class * _class, char *  string);

static void ProcessClassEnumValues(int classType, struct __ecereNameSpace__ecere__sys__OldList * definitions, struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * baseSpecs, struct __ecereNameSpace__ecere__sys__OldList * enumValues)
{
struct __ecereNameSpace__ecere__com__Class * regClass = symbol->registered;

if(regClass && enumValues)
{
struct Enumerator * e;

for(e = enumValues->first; e; e = e->next)
{
if(e->exp)
{
struct Type * destType = (destType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), destType->kind = 3, destType->refCount = 1, destType);

e->exp->destType = destType;
SetParsingType(0x1);
ProcessExpressionType(e->exp);
SetParsingType(0x0);
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
value = op.type->isSigned ? (int)op.c : (int)op.uc;
break;
case 2:
value = op.type->isSigned ? (int)op.s : (int)op.us;
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
}

extern struct __ecereNameSpace__ecere__sys__OldList *  GetAST(void);

extern struct Symbol * FindClass(char *  name);

extern void SetCurrentNameSpace(char *  s);

extern void ComputeModuleClasses(struct __ecereNameSpace__ecere__com__Instance * module);

void PreCompPreProcessClassDefinitions()
{
void * __ecereTemp1;
struct __ecereNameSpace__ecere__sys__OldList * ast = GetAST();
struct External * external, * next;

for(external = (*ast).first; external; external = next)
{
next = external->next;
if(external->type == 2)
{
struct ClassDefinition * _class = external->_class;

if(_class->declMode == 1 || _class->declMode == 2 || _class->declMode == 3)
{
if(_class->definitions)
{
ProcessClass(0, _class->definitions, _class->symbol, _class->baseSpecs, (((void *)0)), _class->deleteWatchable, _class->declMode);
}
}
}
else if(external->type == 1)
{
struct Declaration * declaration = external->declaration;

if(declaration->type == 1)
{
if(external->declaration->declMode == 1 || external->declaration->declMode == 2 || external->declaration->declMode == 3)
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
int classType;

if(specifier->type == 2)
classType = 4;
else if(specifier->type == 4)
classType = 6;
else
classType = 1;
ProcessClass(classType, specifier->definitions, symbol, specifier->baseSpecs, specifier->list, 0x0, external->declaration->declMode);
}
}
}
}
if(external->declaration->declMode == 1 || external->declaration->declMode == 2)
{
if(declaration->declarators)
{
struct InitDeclarator * d;

for(d = (*declaration->declarators).first; d; d = d->next)
{
if(d->declarator)
{
struct Symbol * symbol = d->declarator->symbol;

if(symbol)
{
struct DataDefine * dataDefine;
char typeString[1024];

typeString[0] = '\0';
PrintType(symbol->type, typeString, 0x0, 0x1);
dataDefine = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_DataDefine), ((struct DataDefine *)__ecereTemp1)->type = 4, ((struct DataDefine *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(symbol->string), ((struct DataDefine *)__ecereTemp1)->dataType = __ecereNameSpace__ecere__sys__CopyString(typeString), ((struct DataDefine *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&precompDefines, dataDefine);
}
}
}
}
}
}
}
else if(declaration->type == 2)
{
if(external->declaration->declMode == 1 || external->declaration->declMode == 2)
{
struct Symbol * symbol = declaration->inst->symbol;

if(symbol)
{
struct DataDefine * dataDefine;
char typeString[1024];

typeString[0] = '\0';
PrintType(symbol->type, typeString, 0x0, 0x1);
dataDefine = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_DataDefine), ((struct DataDefine *)__ecereTemp1)->type = 4, ((struct DataDefine *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(symbol->string), ((struct DataDefine *)__ecereTemp1)->dataType = __ecereNameSpace__ecere__sys__CopyString(typeString), ((struct DataDefine *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&precompDefines, dataDefine);
}
}
globalInstance = 0x1;
}
else if(declaration->type == 3)
{
if(external->declaration->declMode == 1 || external->declaration->declMode == 2)
{
struct Define * definition = (definition = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Define), definition->type = 2, definition->name = __ecereNameSpace__ecere__sys__CopyString(declaration->id->string), definition->exp = declaration->exp, definition);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&precompDefines, definition);
}
}
}
else if(external->type == 0 && (external->function->declMode == 1 || external->function->declMode == 2))
{
struct FunctionDefinition * function = external->function;
struct FunctionDefine * functionDefine;
char typeString[1024];

typeString[0] = '\0';
PrintType(function->declarator->symbol->type, typeString, 0x1, 0x1);
functionDefine = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_FunctionDefine), ((struct FunctionDefine *)__ecereTemp1)->type = 3, ((struct FunctionDefine *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(function->declarator->symbol->string), ((struct FunctionDefine *)__ecereTemp1)->dataType = __ecereNameSpace__ecere__sys__CopyString(typeString), ((struct FunctionDefine *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&precompDefines, functionDefine);
}
else if(external->type == 4)
{
SetCurrentNameSpace(external->id->string);
}
}
ComputeModuleClasses(privateModule);
for(external = (*ast).first; external; external = next)
{
next = external->next;
if(external->type == 1 && (external->declaration->declMode == 1 || external->declaration->declMode == 2))
{
struct Declaration * declaration = external->declaration;

if(declaration->type == 1)
{
if(declaration->specifiers)
{
struct Specifier * specifier;

for(specifier = (*declaration->specifiers).first; specifier; specifier = specifier->next)
{
if((specifier->type == 2) && specifier->id && specifier->id->string && (declaration->declMode || specifier->baseSpecs || (specifier->type == 2 && specifier->definitions)))
{
struct Symbol * symbol = FindClass(specifier->id->string);

if(symbol)
{
ProcessClassEnumValues(4, specifier->definitions, symbol, specifier->baseSpecs, specifier->list);
}
}
}
}
}
}
}
}

int __ecereMethod___ecereNameSpace__ecere__sys__File_Printf(struct __ecereNameSpace__ecere__com__Instance * this, char *  format, ...);

static void OutputDataMembers(struct ClassDefine * classDefine, struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Instance * f)
{
if(classDefine->propertiesAndMembers.first)
{
struct DataMemberDefine * member = classDefine->propertiesAndMembers.first;
int last = 0;

for(member = classDefine->propertiesAndMembers.first; member; member = member->next)
{
if(member->isProperty == 1)
{
struct PropertyDefine * prop = (struct PropertyDefine *)member;

if(last != 1)
{
if(last)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         .\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Defined Properties]\n");
}
if(prop->name)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         %s\n", prop->name);
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         [Conversion]\n");
if(prop->memberAccess == 1)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Public]\n");
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Private]\n");
if(prop->isVirtual)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Virtual]\n");
if(prop->hasSet)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Set]\n");
if(prop->hasGet)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Get]\n");
if(prop->isWatchable)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Watchable]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Type]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               %s\n", prop->type ? prop->type : "");
}
else
{
if(last != 3)
{
if(last)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         .\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Defined Data Members]\n");
}
if(member->memberType == 0)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         %s\n", member->name);
if(member->memberAccess == 1)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Public]\n");
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Private]\n");
if(_class && _class->type == 2)
{
if(member->size)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Size]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               %d\n", member->size);
}
if(member->bitPos != -1)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Pos]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               %d\n", member->bitPos);
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Type]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               %s\n", member->type ? member->type : "");
}
else
{
if(member->memberAccess == 1)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Public]\n");
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Private]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, (member->memberType == 1) ? "      [Union]\n" : "      [Struct]\n");
OutputDataMembers((struct ClassDefine *)member, (((void *)0)), f);
}
}
last = member->isProperty;
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         .\n");
}
if(classDefine->classProperties.first)
{
struct PropertyDefine * prop = classDefine->propertiesAndMembers.first;

__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Defined Class Properties]\n");
for(prop = classDefine->classProperties.first; prop; prop = prop->next)
{
if(prop->name)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         %s\n", prop->name);
if(prop->hasSet)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Set]\n");
if(prop->hasGet)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Get]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Type]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               %s\n", prop->type ? prop->type : "");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         .\n");
}
}

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpen(char *  fileName, int mode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ImportedModule;

struct ImportedModule
{
struct ImportedModule * prev;
struct ImportedModule * next;
char *  name;
int type;
int importType;
unsigned int globalInstance;
unsigned int dllOnly;
int importAccess;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

extern void PrintExpression(struct Expression * exp, char *  string);

extern void __ecereNameSpace__ecere__sys__ChangeCh(char *  string, char ch1, char ch2);

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DefinedExpression;

struct __ecereNameSpace__ecere__com__DefinedExpression;

extern struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_FindDefine(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

extern void OutputExpression(struct Expression * exp, struct __ecereNameSpace__ecere__com__Instance * f);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts;

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

static void OutputSymbols(char * fileName)
{
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__sys__FileOpen(fileName, 2);

if(f)
{
int lastType = (int)-1;
struct Definition * definition;

if(globalInstance)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "[Global Instance]\n");
for(definition = precompDefines.first; definition; definition = definition->next)
{
if(definition->type != lastType)
{
if(lastType != (int)-1)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   .\n");
if(definition->type == 0)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "[Imported Modules]\n");
else if(definition->type == 1)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "[Defined Classes]\n");
else if(definition->type == 2)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "[Defined Expressions]\n");
else if(definition->type == 3)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "[Defined Functions]\n");
else if(definition->type == 4)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "[Defined Data]\n");
lastType = definition->type;
}
if(definition->type == 0)
{
struct ImportedModule * module = (struct ImportedModule *)definition;

if(module->importType == 1)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   [Static]\n");
else if(module->importType == 2)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   [Remote]\n");
if(module->importAccess == 2)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   [Private]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   %s\n", module->name);
}
else if(definition->type == 1)
{
struct __ecereNameSpace__ecere__com__Class * _class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, definition->name);
struct ClassDefine * classDefine = (struct ClassDefine *)definition;

__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   %s\n", definition->name);
if(classDefine->isStatic)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Static]\n");
if(classDefine->fixed)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Fixed]\n");
if(classDefine->noExpansion)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [No Expansion]\n");
if(classDefine->isRemote)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Remote]\n");
if(classDefine->isWatchable)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Watchable]\n");
if(_class->type == 4)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Enum]\n");
else if(_class->type == 2)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Bit]\n");
else if(_class->type == 1)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Struct]\n");
else if(_class->type == 3)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Unit]\n");
else if(_class->type == 5)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [NoHead]\n");
if(_class->inheritanceAccess == 2)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Private Base]\n");
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Base]\n");
if(classDefine->base)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         %s\n", classDefine->base);
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         [None]\n");
if(_class->templateParams.count)
{
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * param;
struct TemplateParameter * tp;

__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         [Template Parameters]\n");
for(tp = (*((struct Symbol *)_class->symbol)->templateParams).first, param = _class->templateParams.first; param && tp; param = param->next, tp = tp->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               %s\n", param->name);
switch(param->type)
{
case 0:
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               [Type]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               %s\n", param->dataTypeString ? param->dataTypeString : "[None]");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               %s\n", param->defaultArg.dataTypeString ? param->defaultArg.dataTypeString : "[None]");
break;
case 2:
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               [Expression]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               %s\n", param->dataTypeString ? param->dataTypeString : "[None]");
if(tp->defaultArgument && tp->defaultArgument->expression)
{
char temp[8192];

temp[0] = (char)0;
PrintExpression(tp->defaultArgument->expression, temp);
__ecereNameSpace__ecere__sys__ChangeCh(temp, '\n', ' ');
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               ");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, temp);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               [None]\n");
break;
case 1:
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               [Identifier]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               %s\n", (param->memberType == 0) ? "[Data member]" : ((param->memberType == 1) ? "[Method]" : "[Property]"));
if(tp->defaultArgument && tp->defaultArgument->identifier)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               ");
if(tp->defaultArgument->identifier->_class && tp->defaultArgument->identifier->_class->type == 1 && tp->defaultArgument->identifier->_class->name)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "%s::", tp->defaultArgument->identifier->_class->name);
}
else if(tp->defaultArgument->identifier->_class && tp->defaultArgument->identifier->_class->type == 8 && tp->defaultArgument->identifier->_class->templateParameter->identifier)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "%s::", tp->defaultArgument->identifier->_class->templateParameter->identifier->string);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "%s\n", tp->defaultArgument->identifier->string);
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               [None]\n");
}
break;
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         .\n");
}
if(!classDefine->isStatic)
{
if(classDefine->methods.first)
{
struct MethodDefine * method;

__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Defined Methods]\n");
for(method = classDefine->methods.first; method; method = method->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         %s\n", method->name);
if(method->memberAccess == 1)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Public]\n");
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Private]\n");
if(method->isVirtual)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Virtual]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Type]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               %s\n", method->type ? method->type : "");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         .\n");
}
OutputDataMembers(classDefine, _class, f);
if(_class->type == 4)
{
struct __ecereNameSpace__ecere__sys__NamedLink * value;
struct __ecereNameSpace__ecere__com__Class * enumClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "enum");
struct __ecereNameSpace__ecere__com__EnumClassData * e = (_class ? ((void *)(((char *)_class->data) + enumClass->offsetClass)) : (((void *)0)));

__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Enum Values]\n");
for(value = e->values.first; value; value = value->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         %s = %d\n", value->name, value->data);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         .\n");
}
}
}
else if(definition->type == 2)
{
struct __ecereNameSpace__ecere__com__DefinedExpression * defExp = __ecereNameSpace__ecere__com__eSystem_FindDefine(privateModule, definition->name);
struct Define * defineDefine = (struct Define *)definition;

__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   %s\n", definition->name);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Value]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         ");
OutputExpression(defineDefine->exp, f);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
}
else if(definition->type == 3)
{
struct FunctionDefine * functionDefine = (struct FunctionDefine *)definition;

__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   %s\n", functionDefine->name);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Type]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         %s\n", functionDefine->dataType);
}
else if(definition->type == 4)
{
struct DataDefine * dataDefine = (struct DataDefine *)definition;

__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   %s\n", dataDefine->name);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Type]\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         %s\n", dataDefine->dataType);
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   .\n");
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}
}

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_PrecompApp;

extern int __ecereNameSpace__ecere__com__GetRuntimePlatform(void);

extern int GetHostBits(void);

extern int strcmp(const char * , const char * );

extern int strlen(const char * );

extern char *  GetOutputFile(void);

extern void SetOutputFile(char *  s);

extern char *  GetSourceFile(void);

extern void SetSourceFile(char *  s);

extern void SetSymbolsDir(char *  s);

extern void SetDefaultNameSpace(char *  s);

extern void SetStrictNameSpaces(unsigned int b);

extern char *  GetSymbolsDir(void);

extern char *  __ecereNameSpace__ecere__sys__PathCat(char *  string, char *  addedPath);

extern char *  __ecereNameSpace__ecere__sys__ChangeExtension(char *  string, char *  ext, char *  output);

extern int printf(char * , ...);

extern char *  __ecereNameSpace__ecere__GetTranslatedString(struct __ecereNameSpace__ecere__com__Instance * module, char *  string, char *  stringAndContext);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern void SetGlobalContext(struct Context * context);

extern void SetTopContext(struct Context * context);

extern void SetCurrentContext(struct Context * context);

extern void SetExcludedSymbols(struct __ecereNameSpace__ecere__sys__OldList *  list);

extern void SetGlobalData(struct __ecereNameSpace__ecere__com__NameSpace *  nameSpace);

extern void SetDefines(struct __ecereNameSpace__ecere__sys__OldList *  list);

extern void SetImports(struct __ecereNameSpace__ecere__sys__OldList *  list);

extern void SetPrecompDefines(struct __ecereNameSpace__ecere__sys__OldList *  list);

extern void SetInPreCompiler(unsigned int b);

extern void SetTargetPlatform(int platform);

extern void SetTargetBits(int bits);

extern void SetEchoOn(unsigned int b);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com____ecere_COM_Initialize(unsigned int guiApp, int argc, char *  argv[]);

extern void SetPrivateModule(struct __ecereNameSpace__ecere__com__Instance * module);

extern struct Type * ProcessTypeString(char *  string, unsigned int staticMethod);

extern unsigned int __ecereNameSpace__ecere__sys__FileExists(char *  fileName);

extern unsigned int __ecereNameSpace__ecere__sys__DeleteFile(char *  fileName);

extern int snprintf(char * , int, char * , ...);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__DualPipeOpen(unsigned int mode, char *  commandLine);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

struct __ecereNameSpace__ecere__sys__TempFile
{
char __ecere_padding[24];
} __attribute__ ((gcc_struct));

extern void SetFileInput(struct __ecereNameSpace__ecere__com__Instance * file);

extern void SetMainModule(struct ModuleImport * moduleImport);

extern void resetScanner(void);

extern void ParseEc(void);

extern void SetYydebug(unsigned int b);

extern void ProcessDBTableDefinitions(void);

extern void FreeASTTree(struct __ecereNameSpace__ecere__sys__OldList * ast);

extern void FreeContext(struct Context * context);

extern void FreeExcludedSymbols(struct __ecereNameSpace__ecere__sys__OldList * excludedSymbols);

extern void FreeModuleDefine(struct Definition * def);

extern void FreeModuleImport(struct ModuleImport * imp);

extern void FreeTypeData(struct __ecereNameSpace__ecere__com__Instance * privateModule);

extern void FreeIncludeFiles(void);

extern void FreeGlobalData(struct __ecereNameSpace__ecere__com__NameSpace * globalDataList);

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

char *  __ecereProp___ecereNameSpace__ecere__com__Platform_Get_char__PTR_(int this);

int __ecereProp___ecereNameSpace__ecere__com__Platform_Set_char__PTR_(char *  value);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__com__Platform_char__PTR_;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetExitCode();

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

void __ecereMethod_PrecompApp_Main(struct __ecereNameSpace__ecere__com__Instance * this)
{
void * __ecereTemp1;
int c;
unsigned int valid = 0x1;
char defaultSymFile[797];
char * cppCommand = (((void *)0));
char * cppOptions = (((void *)0));
int cppOptionsLen = 0;
int targetPlatform = __ecereNameSpace__ecere__com__GetRuntimePlatform();
int targetBits = GetHostBits();

for(c = 1; c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc; c++)
{
char * arg = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c];

if(arg[0] == '-')
{
if(!strcmp(arg + 1, "m32") || !strcmp(arg + 1, "m64"))
{
int argLen = strlen(arg);
int newLen = cppOptionsLen + 1 + argLen;

cppOptions = __ecereNameSpace__ecere__com__eSystem_Renew(cppOptions, sizeof(char) * (newLen + 1));
cppOptions[cppOptionsLen] = ' ';
strcpy(cppOptions + cppOptionsLen + 1, arg);
cppOptionsLen = newLen;
targetBits = !strcmp(arg + 1, "m32") ? 32 : 64;
}
else if(arg[1] == 'D')
{
int argLen = strlen(arg);
int newLen = cppOptionsLen + 1 + argLen;

cppOptions = __ecereNameSpace__ecere__com__eSystem_Renew(cppOptions, sizeof(char) * (newLen + 1));
cppOptions[cppOptionsLen] = ' ';
strcpy(cppOptions + cppOptionsLen + 1, arg);
cppOptionsLen = newLen;
}
else if(arg[1] == 'I')
{
int argLen = strlen(arg);
int newLen = cppOptionsLen + argLen + 3;

cppOptions = __ecereNameSpace__ecere__com__eSystem_Renew(cppOptions, sizeof(char) * (newLen + 1));
cppOptions[cppOptionsLen] = ' ';
cppOptions[cppOptionsLen + 1] = '-';
cppOptions[cppOptionsLen + 2] = 'I';
cppOptions[cppOptionsLen + 3] = '"';
strcpy(cppOptions + cppOptionsLen + 4, arg + 2);
cppOptions[newLen - 1] = '\"';
cppOptions[newLen] = '\0';
cppOptionsLen = newLen;
}
else if(!strcmp(arg + 1, "t"))
{
if(++c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc)
targetPlatform = __ecereProp___ecereNameSpace__ecere__com__Platform_Set_char__PTR_(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c]);
else
valid = 0x0;
}
else if(!strcmp(arg + 1, "cpp"))
{
if(++c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc)
cppCommand = __ecereNameSpace__ecere__sys__CopyString(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c]);
else
valid = 0x0;
}
else if(!strcmp(arg + 1, "o"))
{
if(!GetOutputFile() && c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc)
{
SetOutputFile(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c + 1]);
c++;
}
else
valid = 0x0;
}
else if(!strcmp(arg + 1, "c"))
{
if(!GetSourceFile() && c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc)
{
SetSourceFile(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c + 1]);
c++;
}
else
valid = 0x0;
}
else if(!strcmp(arg + 1, "isystem") || !strcmp(arg + 1, "isysroot"))
{
if(c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc)
{
int argLen = strlen(arg);
int arg1Len = strlen(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c + 1]);
int newLen = cppOptionsLen + argLen + arg1Len + 4;

cppOptions = __ecereNameSpace__ecere__com__eSystem_Renew(cppOptions, sizeof(char) * (newLen + 1));
cppOptions[cppOptionsLen] = ' ';
strcpy(cppOptions + cppOptionsLen + 1, arg);
cppOptions[cppOptionsLen + argLen + 1] = ' ';
cppOptions[cppOptionsLen + argLen + 2] = '"';
arg = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[++c];
strcpy(cppOptions + cppOptionsLen + argLen + 3, arg);
cppOptions[newLen - 1] = '\"';
cppOptions[newLen] = '\0';
cppOptionsLen = newLen;
}
else
valid = 0x0;
}
else if(!strcmp(arg + 1, "symbols"))
{
if(c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc)
{
SetSymbolsDir(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c + 1]);
c++;
}
else
valid = 0x0;
}
else if(!strcmp(arg + 1, "defaultns"))
{
if(c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc)
{
SetDefaultNameSpace(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c + 1]);
c++;
}
else
valid = 0x0;
}
else if(!strcmp(arg + 1, "strictns"))
{
SetStrictNameSpaces(0x1);
}
}
else
valid = 0x0;
}
if(valid)
{
if(!cppCommand)
cppCommand = __ecereNameSpace__ecere__sys__CopyString("gcc");
if(!GetSourceFile())
valid = 0x0;
else if(!GetOutputFile())
{
strcpy(defaultSymFile, GetSymbolsDir());
__ecereNameSpace__ecere__sys__PathCat(defaultSymFile, GetSourceFile());
__ecereNameSpace__ecere__sys__ChangeExtension(defaultSymFile, "sym", defaultSymFile);
SetOutputFile(defaultSymFile);
}
}
if(!valid)
printf(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Syntax:\n   ecp [-t <target platform>] [-cpp <c preprocessor>] [-o <output>] [-symbols <outputdir>] [-I<includedir>]* [-isystem <sysincludedir>]* [-D<definition>]* -c <input>\n", (((void *)0))));
else
{
char command[3075LL];
struct __ecereNameSpace__ecere__com__Instance * cppOutput;

SetGlobalContext(globalContext);
SetTopContext(globalContext);
SetCurrentContext(globalContext);
SetExcludedSymbols(&_excludedSymbols);
SetGlobalData(&globalData);
SetDefines(&defines);
SetImports(&imports);
SetPrecompDefines(&precompDefines);
SetInPreCompiler(0x1);
SetTargetPlatform(targetPlatform);
SetTargetBits(targetBits);
SetEchoOn(0x0);
privateModule = (struct __ecereNameSpace__ecere__com__Instance *)__ecereNameSpace__ecere__com____ecere_COM_Initialize(0x1 | ((targetBits == 64) ? (unsigned int)2 : (unsigned int)0), 1, (((void *)0)));
SetPrivateModule(privateModule);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString("uint"), ((struct Symbol *)__ecereTemp1)->type = ProcessTypeString("unsigned int", 0x0), ((struct Symbol *)__ecereTemp1)));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString("uint64"), ((struct Symbol *)__ecereTemp1)->type = ProcessTypeString("unsigned int64", 0x0), ((struct Symbol *)__ecereTemp1)));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString("uint32"), ((struct Symbol *)__ecereTemp1)->type = ProcessTypeString("unsigned int", 0x0), ((struct Symbol *)__ecereTemp1)));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString("uint16"), ((struct Symbol *)__ecereTemp1)->type = ProcessTypeString("unsigned short", 0x0), ((struct Symbol *)__ecereTemp1)));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString("byte"), ((struct Symbol *)__ecereTemp1)->type = ProcessTypeString("unsigned char", 0x0), ((struct Symbol *)__ecereTemp1)));
{
char * outputFilePath = GetOutputFile();

if(__ecereNameSpace__ecere__sys__FileExists(outputFilePath))
__ecereNameSpace__ecere__sys__DeleteFile(outputFilePath);
}
snprintf(command, sizeof command, "%s%s -x c -E \"%s\"", cppCommand, cppOptions ? cppOptions : "", GetSourceFile());
command[sizeof command - 1] = (char)0;
if((cppOutput = __ecereNameSpace__ecere__sys__DualPipeOpen((((unsigned int)(0x1))), command)))
{
int exitCode;
struct __ecereNameSpace__ecere__sys__OldList * ast;
struct __ecereNameSpace__ecere__com__Instance * fileInput = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);
struct ModuleImport * mainModule = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ModuleImport);

SetFileInput(fileInput);
SetMainModule(mainModule);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&imports, mainModule);
resetScanner();
for(; !((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))cppOutput->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof])(cppOutput); )
{
char junk[4096];
int count = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))cppOutput->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read])(cppOutput, junk, 1, 4096);

((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))fileInput->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])(fileInput, junk, 1, count);
}
exitCode = __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetExitCode(cppOutput);
(__ecereNameSpace__ecere__com__eInstance_DecRef(cppOutput), cppOutput = 0);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))fileInput->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(fileInput, 0, 0);
ParseEc();
SetCurrentNameSpace((((void *)0)));
SetYydebug(0x0);
(__ecereNameSpace__ecere__com__eInstance_DecRef(fileInput), fileInput = 0);
SetFileInput((((void *)0)));
ast = GetAST();
if(!exitCode)
{
if(ast)
{
ProcessDBTableDefinitions();
PreCompPreProcessClassDefinitions();
}
if(!((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->exitCode)
OutputSymbols(GetOutputFile());
}
else
((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->exitCode = exitCode;
if(ast)
{
FreeASTTree(ast);
}
}
FreeContext(globalContext);
FreeExcludedSymbols(&_excludedSymbols);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&defines, FreeModuleDefine);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&imports, FreeModuleImport);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&precompDefines, FreeDefinition);
FreeTypeData(privateModule);
FreeIncludeFiles();
FreeGlobalData(&globalData);
(__ecereNameSpace__ecere__com__eInstance_DecRef(privateModule), privateModule = 0);
}
(__ecereNameSpace__ecere__com__eSystem_Delete(cppCommand), cppCommand = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(cppOptions), cppOptions = 0);
SetSymbolsDir((((void *)0)));
}

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

void __ecereRegisterModule_ecp(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ClassDefine", "Definition", sizeof(struct ClassDefine), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass_ClassDefine = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "base", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "propertiesAndMembers", "ecere::sys::OldList", 20, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "classProperties", "ecere::sys::OldList", 20, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "methods", "ecere::sys::OldList", 20, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isRemote", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isWatchable", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "fixed", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "isStatic", "bool", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "noExpansion", "bool", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "Define", "Definition", sizeof(struct Define), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass_Define = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "exp", "Expression", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "FunctionDefine", "Definition", sizeof(struct FunctionDefine), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass_FunctionDefine = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "char *", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "DataDefine", "Definition", sizeof(struct DataDefine), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass_DataDefine = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "dataType", "char *", 4, 4, 1);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "MethodDefine", 0, sizeof(struct MethodDefine), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass_MethodDefine = class;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "PropertyDefine", 0, sizeof(struct PropertyDefine), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass_PropertyDefine = class;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "DataMemberDefine", 0, sizeof(struct DataMemberDefine), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass_DataMemberDefine = class;
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FreeMethodDefine", "void FreeMethodDefine(MethodDefine method)", FreeMethodDefine, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FreeDataMemberDefine", "void FreeDataMemberDefine(DataMemberDefine dataMember)", FreeDataMemberDefine, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FreeDataDefine", "void FreeDataDefine(DataDefine data)", FreeDataDefine, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FreeDefinition", "void FreeDefinition(Definition definition)", FreeDefinition, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PreCompPreProcessClassDefinitions", "void PreCompPreProcessClassDefinitions(void)", PreCompPreProcessClassDefinitions, module, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "PrecompApp", "ecere::com::Application", 0, 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass_PrecompApp = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Main", 0, __ecereMethod_PrecompApp_Main, 1);
}

void __ecereUnregisterModule_ecp(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, char *  a, char *  b);

void __ecereCreateModuleInstances_ecp()
{
globalContext = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context);
(globalData.classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, globalData.defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, globalData.functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, globalData.nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString);
}

void __ecereDestroyModuleInstances_ecp()
{
((globalContext ? (__ecereClass_Context->Destructor ? __ecereClass_Context->Destructor(globalContext) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(globalContext)) : 0), globalContext = 0);
}

