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

struct FunctionDefinition;

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBTableEntry;

struct DBTableEntry;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBIndexItem;

struct DBIndexItem;

extern YYSTYPE yylval;

extern struct Location yylloc;

extern struct Identifier * GetDeclId(struct Declarator * decl);

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

extern void Compiler_Error(char *  format, ...);

extern char *  __ecereNameSpace__ecere__GetTranslatedString(struct __ecereNameSpace__ecere__com__Instance * module, char *  string, char *  stringAndContext);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern void FreeType(struct Type * type);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_AddDataMember(struct __ecereNameSpace__ecere__com__DataMember * member, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_New(int type, int declMode);

extern unsigned int __ecereNameSpace__ecere__com__eMember_AddMember(struct __ecereNameSpace__ecere__com__DataMember * addTo, struct __ecereNameSpace__ecere__com__DataMember * dataMember);

extern unsigned int __ecereNameSpace__ecere__com__eClass_AddMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__DataMember * dataMember);

extern struct __ecereNameSpace__ecere__sys__OldList *  MkListOne(void *  item);

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

extern char *  StringFromSpecDecl(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  dataType, void *  setStmt, void *  getStmt, int declMode);

extern unsigned int inCompiler;

extern char *  __ecereNameSpace__ecere__sys__CopyString(char *  string);

extern void __ecereNameSpace__ecere__com__eProperty_Watchable(struct __ecereNameSpace__ecere__com__Property * _property);

extern int printf(char * , ...);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassProperty;

struct __ecereNameSpace__ecere__com__ClassProperty;

extern struct __ecereNameSpace__ecere__com__ClassProperty * __ecereNameSpace__ecere__com__eClass_AddClassProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  dataType, void *  setStmt, void *  getStmt);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

static void AddDefinitions(struct __ecereNameSpace__ecere__com__Class * regClass, struct __ecereNameSpace__ecere__com__DataMember * member, struct __ecereNameSpace__ecere__sys__OldList * definitions)
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
if(regClass && regClass->type == 2)
{
struct Expression * sizeExp = d->structDecl.exp, * posExp = d->structDecl.posExp;
int bitSize = 0, bitPos = -1;
char dataTypeString[1024] = "";

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
d->structDecl.posExp = (((void *)0));
d->structDecl.exp = (((void *)0));
dataType = ProcessType(decl->specifiers, d);
PrintType(dataType, dataTypeString, 0x0, 0x1);
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
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Member with same name already exists %s in class %s\n", (((void *)0))), declId->string, regClass->name);
FreeType(dataType);
}
}
else
{
{
char typeString[1024] = "";

dataType = ProcessType(decl->specifiers, d);
PrintType(dataType, typeString, 0x0, 0x1);
if(member)
{
dataMember = __ecereNameSpace__ecere__com__eMember_AddDataMember(member, declId->string, typeString, 0, 0, def->memberAccess);
if(!dataMember)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Member with same name already exists %s in member %s\n", (((void *)0))), declId->string, member->name);
}
else
{
dataMember = __ecereNameSpace__ecere__com__eClass_AddDataMember(regClass, declId->string, typeString, 0, 0, def->memberAccess);
if(!dataMember)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Member with same name already exists %s in class %s\n", (((void *)0))), declId->string, regClass->name);
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

AddDefinitions((((void *)0)), dataMember, spec->definitions);
if(member)
{
__ecereNameSpace__ecere__com__eMember_AddMember(member, dataMember);
}
else
{
__ecereNameSpace__ecere__com__eClass_AddMember(regClass, dataMember);
}
}
else if(spec->definitions && spec->id)
{
{
struct Identifier * id = spec->id;
char typeString[1024] = "";

spec->id = (((void *)0));
decl->declarators = MkListOne(MkDeclaratorIdentifier(id));
dataType = ProcessType(decl->specifiers, (((void *)0)));
PrintType(dataType, typeString, 0x0, 0x1);
if(member)
{
dataMember = __ecereNameSpace__ecere__com__eMember_AddDataMember(member, id->string, typeString, 0, 0, def->memberAccess);
if(!dataMember)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Member with same name already exists %s in member %s\n", (((void *)0))), id->string, member->name);
}
else
{
dataMember = __ecereNameSpace__ecere__com__eClass_AddDataMember(regClass, id->string, typeString, 0, 0, def->memberAccess);
if(!dataMember)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Member with same name already exists %s in class %s\n", (((void *)0))), id->string, regClass->name);
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
struct Instantiation * inst = decl->inst;
struct Expression * exp = inst->exp;

if(exp)
{
char * string = exp->identifier->string;

{
struct Type * dataType = (dataType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), dataType->kind = 8, dataType->_class = inst->_class->symbol, dataType->refCount = 1, dataType);

if(member)
{
dataMember = __ecereNameSpace__ecere__com__eMember_AddDataMember(member, string, inst->_class->name, 0, 0, def->memberAccess);
if(!dataMember)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Member with same name already exists %s in member %s\n", (((void *)0))), string, member->name);
}
else
{
dataMember = __ecereNameSpace__ecere__com__eClass_AddDataMember(regClass, string, inst->_class->name, 0, 0, def->memberAccess);
if(!dataMember)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Member with same name already exists %s in class %s\n", (((void *)0))), string, regClass->name);
}
if(dataMember)
dataMember->dataType = dataType;
else
FreeType(dataType);
}
}
}
}
else if(def->type == 3 && def->propertyDef)
{
struct PropertyDef * propertyDef = def->propertyDef;
struct __ecereNameSpace__ecere__com__Property * prop;
char * dataTypeString = StringFromSpecDecl(propertyDef->specifiers, propertyDef->declarator);

prop = __ecereNameSpace__ecere__com__eClass_AddProperty(regClass, propertyDef->conversion ? (((void *)0)) : propertyDef->id->string, dataTypeString, inCompiler ? propertyDef->setStmt : (((void *)0)), inCompiler ? propertyDef->getStmt : (((void *)0)), def->memberAccess);
(__ecereNameSpace__ecere__com__eSystem_Delete(dataTypeString), dataTypeString = 0);
if(prop)
{
if(inCompiler)
prop->IsSet = (void *)propertyDef->issetStmt;
prop->compiled = 0x0;
prop->symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString(propertyDef->symbol->string), ((struct Symbol *)__ecereTemp1)->id = propertyDef->symbol->id, ((struct Symbol *)__ecereTemp1)->type = propertyDef->symbol->type, ((struct Symbol *)__ecereTemp1));
((struct Symbol *)prop->symbol)->propCategory = propertyDef->category;
propertyDef->category = (((void *)0));
if(propertyDef->isWatchable)
__ecereNameSpace__ecere__com__eProperty_Watchable(prop);
}
else
printf("");
propertyDef->symbol->_property = prop;
if(propertyDef->symbol->type)
propertyDef->symbol->type->refCount++;
}
else if(def->type == 10 && def->propertyDef)
{
struct PropertyDef * propertyDef = def->propertyDef;
struct __ecereNameSpace__ecere__com__ClassProperty * prop;
char * dataTypeString = StringFromSpecDecl(propertyDef->specifiers, propertyDef->declarator);

prop = __ecereNameSpace__ecere__com__eClass_AddClassProperty(regClass, propertyDef->id->string, dataTypeString, inCompiler ? propertyDef->setStmt : (((void *)0)), inCompiler ? propertyDef->getStmt : (((void *)0)));
(__ecereNameSpace__ecere__com__eSystem_Delete(dataTypeString), dataTypeString = 0);
}
}
}
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

extern struct __ecereNameSpace__ecere__com__Instance * privateModule;

extern struct Context * globalContext;

extern struct __ecereNameSpace__ecere__sys__OldList *  excludedSymbols;

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, char *  name, char *  baseName, int size, int sizeClass, unsigned int (* )(void * ), void (* )(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern unsigned int buildingECERECOMModule;

extern struct Declarator * GetFuncDecl(struct Declarator * decl);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

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

struct __ecereNameSpace__ecere__com__ClassTemplateParameter;

extern struct __ecereNameSpace__ecere__com__ClassTemplateParameter * __ecereNameSpace__ecere__com__eClass_AddTemplateParameter(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, int type, void *  info, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * defaultArg);

extern void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(struct __ecereNameSpace__ecere__com__Class * base);

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

static void ProcessClass(int classType, struct __ecereNameSpace__ecere__sys__OldList * definitions, struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * baseSpecs, struct __ecereNameSpace__ecere__sys__OldList * enumValues, struct Location * loc, struct __ecereNameSpace__ecere__sys__OldList * defs, void * after, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators, int declMode)
{
void * __ecereTemp1;
struct __ecereNameSpace__ecere__com__Class * regClass;
struct ClassDef * def;
unsigned int redefinition = 0x0;

regClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, symbol->string);
if(regClass && !regClass->internalDecl)
{
if(symbol->parent || (struct Symbol *)globalContext->classes.root == symbol)
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->classes, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
}
redefinition = 0x1;
if(inCompiler)
{
yylloc = *loc;
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "redefinition of class %s\n", (((void *)0))), symbol->string);
return ;
}
}
else
{
char baseName[1024] = "";
unsigned int unitType = 0x0;
unsigned int wouldBeEnum = 0x0;
int inheritanceAccess = 1;

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
regClass = symbol->registered = __ecereNameSpace__ecere__com__eSystem_RegisterClass((classType == 6) ? 1 : classType, symbol->string, baseName[0] ? baseName : (((void *)0)), 0, 0, (((void *)0)), (((void *)0)), privateModule, buildingECERECOMModule ? 4 : declMode, inheritanceAccess);
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
if(def->type == 0 && def->function->declarator)
{
struct ClassFunction * func = def->function;

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
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Redefinition of method %s in class %s\n", (((void *)0))), id->string, regClass->name);
(__ecereNameSpace__ecere__com__eSystem_Delete(typeString), typeString = 0);
}
if(method && (method->type != 1 || method->_class == regClass))
{
method->symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString(func->declarator->symbol->string), ((struct Symbol *)__ecereTemp1)->id = func->declarator->symbol->id, ((struct Symbol *)__ecereTemp1)->type = func->declarator->symbol->type, ((struct Symbol *)__ecereTemp1)->method = method, ((struct Symbol *)__ecereTemp1));
if(func->declarator->symbol->type)
func->declarator->symbol->type->refCount++;
func->declarator->symbol->method = method;
}
else
{
func->declarator->symbol->method = method;
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
if(param->defaultArgument->identifier->_class)
{
if(param->defaultArgument->identifier->_class->type == 8)
{
if(param->defaultArgument->identifier->_class->templateParameter)
strcpy(memberString, param->defaultArgument->identifier->_class->templateParameter->identifier->string);
}
else
{
if(param->defaultArgument->identifier->_class->name)
strcpy(memberString, param->defaultArgument->identifier->_class->name);
}
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

param->defaultArgument->expression->destType = ProcessType(param->dataType->specifiers, param->dataType->decl);
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
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(regClass, param->identifier->string, 1, (void *)param->memberType, &defaultArg);
}
else
{
char * typeString = param->dataType ? StringFromSpecDecl(param->dataType->specifiers, param->dataType->decl) : (((void *)0));

__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(regClass, param->identifier->string, param->type, typeString, &defaultArg);
(__ecereNameSpace__ecere__com__eSystem_Delete(typeString), typeString = 0);
}
if(param->type == 0 || param->type == 1)
(__ecereNameSpace__ecere__com__eSystem_Delete(defaultArg.dataTypeString), defaultArg.dataTypeString = 0);
}
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(regClass);
}
}

extern struct External * curExternal;

extern struct __ecereNameSpace__ecere__sys__OldList *  ast;

extern struct Symbol * FindType(struct Context * ctx, char *  name);

extern struct Symbol * FindClass(char *  name);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldLink;

struct __ecereNameSpace__ecere__sys__OldLink
{
struct __ecereNameSpace__ecere__sys__OldLink * prev;
struct __ecereNameSpace__ecere__sys__OldLink * next;
void *  data;
} __attribute__ ((gcc_struct));

extern struct ModuleImport * mainModule;

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
struct ClassDefinition * _class = external->_class;

if(_class->definitions && (!_class->symbol->registered || !inCompiler))
{
ProcessClass(0, _class->definitions, _class->symbol, _class->baseSpecs, (((void *)0)), &_class->loc, ast, external->prev, (((void *)0)), _class->declMode);
_class->symbol->isStatic = _class->declMode == 3;
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
struct Symbol * type = FindType(globalContext, specifier->id->string);
struct Symbol * symbol = FindClass(specifier->id->string);

if(type)
{
declaration->declMode = 0;
if(symbol)
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->classes, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
}
}
else if(symbol && !symbol->registered)
{
int classType;

if(specifier->type == 2)
classType = 4;
else if(specifier->type == 4)
classType = 6;
else
classType = 1;
ProcessClass(classType, specifier->definitions, symbol, specifier->baseSpecs, specifier->list, &specifier->loc, ast, external->prev, declaration->declarators, declaration->declMode);
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
struct ClassDefinition * _class = external->_class;

if(_class->symbol)
{
struct __ecereNameSpace__ecere__sys__OldLink * link;

for(link = _class->symbol->templatedClasses.first; link; link = link->next)
{
struct Symbol * symbol = link->data;

symbol->registered = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, symbol->string);
}
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
struct Symbol * type = FindType(globalContext, specifier->id->string);
struct Symbol * symbol = FindClass(specifier->id->string);

if(type)
{
}
else if(symbol)
{
struct __ecereNameSpace__ecere__sys__OldLink * link;

for(link = symbol->templatedClasses.first; link; link = link->next)
{
struct Symbol * tplSymbol = link->data;

tplSymbol->registered = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, tplSymbol->string);
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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

void __ecereRegisterModule_firstPass(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PrePreProcessClassDefinitions", "void PrePreProcessClassDefinitions(void)", PrePreProcessClassDefinitions, module, 1);
}

void __ecereUnregisterModule_firstPass(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

