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

extern char * yytext;

char * defaultNameSpace;

int defaultNameSpaceLen;

extern int strlen(const char * );

void SetDefaultNameSpace(char * s)
{
defaultNameSpace = s;
defaultNameSpaceLen = s ? strlen(s) : 0;
}

unsigned int strictNameSpaces;

void SetStrictNameSpaces(unsigned int b)
{
strictNameSpaces = b;
}

int declMode = 2;

void SetDeclMode(int accessMode)
{
declMode = accessMode;
}

int defaultDeclMode = 2;

void SetDefaultDeclMode(int accessMode)
{
defaultDeclMode = accessMode;
}

char * currentNameSpace;

int currentNameSpaceLen;

void SetCurrentNameSpace(char * s)
{
currentNameSpace = s;
currentNameSpaceLen = s ? strlen(s) : 0;
}

struct __ecereNameSpace__ecere__sys__OldList * MkList()
{
return __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__sys__OldList) * (1));
}

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

struct __ecereNameSpace__ecere__sys__OldList * MkListOne(void * item)
{
struct __ecereNameSpace__ecere__sys__OldList * list = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__sys__OldList) * (1));

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*list), item);
return list;
}

void ListAdd(struct __ecereNameSpace__ecere__sys__OldList * list, void * item)
{
if(item)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(list, item);
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(struct __ecereNameSpace__ecere__sys__OldList * this, void *  prevItem, void *  item);

void ListAddFront(struct __ecereNameSpace__ecere__sys__OldList * list, void * item)
{
if(item)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(list, (((void *)0)), item);
}

extern void *  memcpy(void * , const void * , unsigned int size);

extern int strcmp(const char * , const char * );

struct Specifier * MkSpecifierName(char *  name);

extern char *  __ecereNameSpace__ecere__sys__CopyString(char *  string);

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

struct TemplatedType * FindTemplateTypeParameter(struct Context * ctx, char *  name);

extern struct Context * curContext;

struct Symbol * FindClass(char *  name);

struct Specifier * _MkSpecifierName(char *  name, struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * templateArgs);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

struct Identifier * MkIdentifier(char * string)
{
void * __ecereTemp1;
struct Identifier * id = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Identifier);
int c;

id->_class = (((void *)0));
if(string)
{
char * namePart;
unsigned int gotColon = 0x0;

for(c = strlen(string) - 1; c >= 0; c--)
if(string[c] == ':')
{
gotColon = 0x1;
break;
}
namePart = string + c + 1;
while(c >= 0 && string[c] == ':')
c--;
if(c >= 0)
{
char name[1024];
struct Symbol * symbol;

memcpy(name, string, c + 1);
name[c + 1] = '\0';
if(!strcmp(name, "typed_object"))
{
id->_class = MkSpecifierName("class");
id->string = __ecereNameSpace__ecere__sys__CopyString(namePart);
}
else if(!strcmp(name, "property"))
{
id->_class = MkSpecifierName("property");
id->string = __ecereNameSpace__ecere__sys__CopyString(namePart);
}
else if(!strcmp(name, "typed_object&"))
{
id->_class = MkSpecifierName("typed_object&");
id->string = __ecereNameSpace__ecere__sys__CopyString(namePart);
}
else if(!strcmp(name, "any_object"))
{
id->_class = MkSpecifierName("any_object");
id->string = __ecereNameSpace__ecere__sys__CopyString(namePart);
}
else
{
struct TemplatedType * templatedType = FindTemplateTypeParameter(curContext, name);

if(templatedType)
{
id->_class = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier), ((struct Specifier *)__ecereTemp1)->type = 8, ((struct Specifier *)__ecereTemp1)->templateParameter = templatedType->param, ((struct Specifier *)__ecereTemp1));
id->string = __ecereNameSpace__ecere__sys__CopyString(namePart);
}
else
{
symbol = FindClass(name);
if(symbol)
{
id->_class = _MkSpecifierName(symbol->string, symbol, (((void *)0)));
id->string = __ecereNameSpace__ecere__sys__CopyString(namePart);
}
else
id->string = __ecereNameSpace__ecere__sys__CopyString(string);
}
}
}
else if(gotColon)
{
id->_class = MkSpecifierName((((void *)0)));
id->string = __ecereNameSpace__ecere__sys__CopyString(namePart);
}
else
id->string = __ecereNameSpace__ecere__sys__CopyString(string);
}
else
id->string = __ecereNameSpace__ecere__sys__CopyString("");
return id;
}

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

struct TemplateParameter * MkTypeTemplateParameter(struct Identifier * identifier, struct TemplateDatatype * baseTplDatatype, struct TemplateArgument * defaultArgument)
{
if(identifier->string)
{
struct TemplateParameter * param = (param = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplateParameter), param->type = 0, param->identifier = identifier, param->dataType = baseTplDatatype, param->defaultArgument = defaultArgument, param);
struct TemplatedType * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplatedType), type->key = (uintptr_t)identifier->string, type->param = param, type);

if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&curContext->templateTypes, (struct __ecereNameSpace__ecere__sys__BTNode *)type))
((type ? (__ecereClass_TemplatedType->Destructor ? __ecereClass_TemplatedType->Destructor(type) : 0, __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor ? __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor(type) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(type)) : 0), type = 0);
return param;
}
return (((void *)0));
}

struct TemplateParameter * MkIdentifierTemplateParameter(struct Identifier * identifier, int memberType, struct TemplateArgument * defaultArgument)
{
if(identifier->string)
{
struct TemplateParameter * param = (param = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplateParameter), param->type = 1, param->identifier = identifier, param->memberType = memberType, param->defaultArgument = defaultArgument, param);

return param;
}
return (((void *)0));
}

struct TemplateParameter * MkExpressionTemplateParameter(struct Identifier * identifier, struct TemplateDatatype * dataType, struct TemplateArgument * defaultArgument)
{
if(identifier->string)
{
struct TemplateParameter * param = (param = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplateParameter), param->type = 2, param->identifier = identifier, param->dataType = dataType, param->defaultArgument = defaultArgument, param);

return param;
}
return (((void *)0));
}

struct TemplateDatatype * MkTemplateDatatype(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct Declarator * decl)
{
struct TemplateDatatype * datatype = (datatype = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplateDatatype), datatype->specifiers = specifiers, datatype->decl = decl, datatype);

return datatype;
}

struct TemplateArgument * MkTemplateTypeArgument(struct TemplateDatatype * tplDatatype)
{
struct TemplateArgument * argument = (argument = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplateArgument), argument->type = 0, argument->templateDatatype = tplDatatype, argument);

return argument;
}

struct TemplateArgument * MkTemplateExpressionArgument(struct Expression * expr)
{
struct TemplateArgument * argument = (argument = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplateArgument), argument->type = 2, argument->expression = expr, argument);

return argument;
}

struct TemplateArgument * MkTemplateIdentifierArgument(struct Identifier * ident)
{
struct TemplateArgument * argument = (argument = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplateArgument), argument->type = 1, argument->identifier = ident, argument);

return argument;
}

struct Expression * MkExpExtensionCompound(struct Statement * compound)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 25, ((struct Expression *)__ecereTemp1)->compound = compound, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpExtensionExpression(struct __ecereNameSpace__ecere__sys__OldList * expressions)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 34, ((struct Expression *)__ecereTemp1)->list = expressions, ((struct Expression *)__ecereTemp1)->loc = yylloc, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpExtensionInitializer(struct TypeName * typeName, struct Initializer * initializer)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 35, ((struct Expression *)__ecereTemp1)->initializer.typeName = typeName, ((struct Expression *)__ecereTemp1)->initializer.initializer = initializer, ((struct Expression *)__ecereTemp1)->loc = yylloc, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpIdentifier(struct Identifier * id)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 0, ((struct Expression *)__ecereTemp1)->identifier = id, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpDummy()
{
struct Expression * exp = (exp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), exp->type = 16, exp);

return exp;
}

struct Expression * MkExpConstant(char * string)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 2, ((struct Expression *)__ecereTemp1)->constant = __ecereNameSpace__ecere__sys__CopyString(string), ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpString(char * string)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 3, ((struct Expression *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString(string), ((struct Expression *)__ecereTemp1));
}

struct ContextStringPair
{
char * string, * context;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ContextStringPair;

void __ecereMethod_ContextStringPair_OnFree(struct __ecereNameSpace__ecere__com__Class * class, struct ContextStringPair * this)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(this->string), this->string = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(this->context), this->context = 0);
}

int __ecereMethod_ContextStringPair_OnCompare(struct __ecereNameSpace__ecere__com__Class * class, struct ContextStringPair * this, struct ContextStringPair * b)
{
int result;

result = (this->string && b->string) ? strcmp(this->string, b->string) : (!this->string && b->string) ? 1 : (this->string && !b->string) ? -1 : 0;
if(result)
return result;
result = (this->context && b->context) ? strcmp(this->context, b->context) : (!this->context && b->context) ? 1 : (this->context && !b->context) ? -1 : 0;
return result;
}

struct __ecereNameSpace__ecere__com__Instance * intlStrings;

extern unsigned int inCompiler;

extern struct Expression * QMkExpId(char *  id);

struct Expression * MkExpCall(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * arguments);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List_TPL_Location_;

struct __ecereNameSpace__ecere__com__IteratorPointer;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IteratorPointer;

struct __ecereNameSpace__ecere__com__Iterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} __attribute__ ((gcc_struct));

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(struct __ecereNameSpace__ecere__com__Iterator * this, uint64 index, unsigned int create);

uint64 __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(struct __ecereNameSpace__ecere__com__Iterator * this);

void __ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(struct __ecereNameSpace__ecere__com__Iterator * this, uint64 value);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__com__Iterator_data;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

struct Expression * MkExpIntlString(char * string, char * context)
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();

if(inCompiler)
{
struct ContextStringPair pair = 
{
0, 0
};
struct __ecereNameSpace__ecere__com__Instance * list;
int len = strlen(string);

pair.string = __ecereNameSpace__ecere__com__eSystem_New(sizeof(unsigned char) * (len - 2 + 1));
memcpy(pair.string, string + 1, len - 2);
pair.string[len - 2] = '\0';
if(context)
{
len = strlen(context);
pair.context = __ecereNameSpace__ecere__com__eSystem_New(sizeof(unsigned char) * (len - 2 + 1));
memcpy(pair.context, context + 1, len - 2);
pair.context[len - 2] = '\0';
}
list = (__extension__ ({
struct __ecereNameSpace__ecere__com__Iterator __internalIterator = 
{
intlStrings, 0
};

__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(&__internalIterator, (((&pair))), 0x0);
((struct __ecereNameSpace__ecere__com__Instance *)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&__internalIterator));
}));
if(!list)
{
list = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__List_TPL_Location_);
__extension__ ({
struct __ecereNameSpace__ecere__com__Iterator __internalIterator = 
{
intlStrings, 0
};

__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(&__internalIterator, (((&pair))), 0x1);
__ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(&__internalIterator, list);
});
}
else
{
(__ecereNameSpace__ecere__com__eSystem_Delete(pair.string), pair.string = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(pair.context), pair.context = 0);
}
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))list->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(list, (&yylloc));
}
ListAdd(list, QMkExpId("__thisModule"));
ListAdd(list, MkExpString(string));
if(context)
{
int lenString = strlen(string), lenContext = strlen(context);
char * msgid = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (lenString - 2 + lenContext - 2 + 4));

msgid[0] = '\"';
memcpy(msgid + 1, context + 1, lenContext - 2);
msgid[1 + lenContext - 2] = (char)4;
memcpy(msgid + 1 + lenContext - 2 + 1, string + 1, lenString - 2);
memcpy(msgid + 1 + lenContext - 2 + 1 + lenString - 2, "\"", 2);
ListAdd(list, MkExpString(msgid));
(__ecereNameSpace__ecere__com__eSystem_Delete(msgid), msgid = 0);
}
else
ListAdd(list, QMkExpId("null"));
return MkExpCall(QMkExpId("GetTranslatedString"), list);
}

struct Expression * MkExpOp(struct Expression * exp1, int op, struct Expression * exp2)
{
struct Expression * exp = (exp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), exp->type = 4, exp->op.op = op, exp->op.exp1 = exp1, exp->op.exp2 = exp2, exp);

if(exp1 || exp2)
{
exp->loc.start = exp1 ? exp1->loc.start : exp2->loc.start;
exp->loc.end = exp2 ? exp2->loc.end : exp1->loc.end;
}
return exp;
}

struct Expression * MkExpBrackets(struct __ecereNameSpace__ecere__sys__OldList * expressions)
{
struct Expression * exp = (exp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), exp->type = 5, exp->list = expressions, exp);

if(expressions && expressions->first)
{
exp->loc.start = ((struct Expression *)expressions->first)->loc.start;
exp->loc.end = ((struct Expression *)expressions->last)->loc.end;
}
return exp;
}

struct Expression * MkExpIndex(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * index)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 6, ((struct Expression *)__ecereTemp1)->index.exp = expression, ((struct Expression *)__ecereTemp1)->index.index = index, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpCall(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * arguments)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 7, ((struct Expression *)__ecereTemp1)->call.exp = expression, ((struct Expression *)__ecereTemp1)->call.arguments = arguments, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpMember(struct Expression * expression, struct Identifier * member)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 8, ((struct Expression *)__ecereTemp1)->member.exp = expression, ((struct Expression *)__ecereTemp1)->member.member = member, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpPointer(struct Expression * expression, struct Identifier * member)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 9, ((struct Expression *)__ecereTemp1)->member.exp = expression, ((struct Expression *)__ecereTemp1)->member.member = member, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpTypeSize(struct TypeName * typeName)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 10, ((struct Expression *)__ecereTemp1)->typeName = typeName, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpTypeAlign(struct TypeName * typeName)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 38, ((struct Expression *)__ecereTemp1)->typeName = typeName, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpClassSize(struct Specifier * _class)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 15, ((struct Expression *)__ecereTemp1)->_class = _class, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpCast(struct TypeName * typeName, struct Expression * expression)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 11, ((struct Expression *)__ecereTemp1)->cast.typeName = typeName, ((struct Expression *)__ecereTemp1)->cast.exp = expression, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpCondition(struct Expression * cond, struct __ecereNameSpace__ecere__sys__OldList * expressions, struct Expression * elseExp)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 12, ((struct Expression *)__ecereTemp1)->cond.cond = cond, ((struct Expression *)__ecereTemp1)->cond.exp = expressions, ((struct Expression *)__ecereTemp1)->cond.elseExp = elseExp, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpRenew(struct Expression * memExp, struct TypeName * type, struct Expression * size)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 14, ((struct Expression *)__ecereTemp1)->_renew.exp = memExp, ((struct Expression *)__ecereTemp1)->_renew.typeName = type, ((struct Expression *)__ecereTemp1)->_renew.size = size, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpRenew0(struct Expression * memExp, struct TypeName * type, struct Expression * size)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 29, ((struct Expression *)__ecereTemp1)->_renew.exp = memExp, ((struct Expression *)__ecereTemp1)->_renew.typeName = type, ((struct Expression *)__ecereTemp1)->_renew.size = size, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpNew(struct TypeName * type, struct Expression * size)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 13, ((struct Expression *)__ecereTemp1)->_new.typeName = type, ((struct Expression *)__ecereTemp1)->_new.size = size, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpNew0(struct TypeName * type, struct Expression * size)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 28, ((struct Expression *)__ecereTemp1)->_new.typeName = type, ((struct Expression *)__ecereTemp1)->_new.size = size, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpVaArg(struct Expression * exp, struct TypeName * type)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 36, ((struct Expression *)__ecereTemp1)->vaArg.exp = exp, ((struct Expression *)__ecereTemp1)->vaArg.typeName = type, ((struct Expression *)__ecereTemp1));
}

struct Specifier * MkSpecifier(int specifier)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier), ((struct Specifier *)__ecereTemp1)->type = 0, ((struct Specifier *)__ecereTemp1)->specifier = specifier, ((struct Specifier *)__ecereTemp1));
}

struct Specifier * MkSpecifierTypeOf(struct Expression * expression)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier), ((struct Specifier *)__ecereTemp1)->type = 6, ((struct Specifier *)__ecereTemp1)->expression = expression, ((struct Specifier *)__ecereTemp1));
}

struct Specifier * MkSpecifierSubClass(struct Specifier * _class)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier), ((struct Specifier *)__ecereTemp1)->type = 7, ((struct Specifier *)__ecereTemp1)->_class = _class, ((struct Specifier *)__ecereTemp1));
}

struct Specifier * MkSpecifierExtended(struct ExtDecl * extDecl)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier), ((struct Specifier *)__ecereTemp1)->type = 5, ((struct Specifier *)__ecereTemp1)->extDecl = extDecl, ((struct Specifier *)__ecereTemp1));
}

struct Type * ProcessType(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

extern char *  strstr(char * , const char * );

extern void FreeSymbol(struct Symbol * symbol);

extern void FreeType(struct Type * type);

struct Specifier * MkEnum(struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * list)
{
struct Specifier * spec = (spec = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier), spec->type = 2, spec->id = id, spec->list = list, spec);

if(list && (!declMode || !id))
{
struct Type * type;
struct Enumerator * e;
struct __ecereNameSpace__ecere__sys__OldList specs = 
{
0, 0, 0, 0, 0
};

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&specs, spec);
type = ProcessType(&specs, (((void *)0)));
if(id)
{
struct Symbol * symbol = (symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), symbol->string = __ecereNameSpace__ecere__sys__CopyString(id->string), symbol->isStruct = 0x1, symbol->type = type, symbol);

type->refCount++;
if(strstr(symbol->string, "::"))
curContext->hasNameSpace = 0x1;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&curContext->structSymbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
FreeSymbol(symbol);
}
for(e = list->first; e; e = e->next)
{
struct Symbol * symbol = (symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), symbol->string = __ecereNameSpace__ecere__sys__CopyString(e->id->string), symbol->type = type, symbol);

type->refCount++;
if(strstr(symbol->string, "::"))
curContext->hasNameSpace = 0x1;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(curContext->templateTypesOnly ? curContext->parent : curContext)->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
FreeSymbol(symbol);
}
FreeType(type);
}
return spec;
}

struct Symbol * FindType(struct Context * ctx, char *  name);

struct Specifier * MkStructOrUnion(int type, struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * definitions)
{
void * __ecereTemp1;
struct Specifier * spec = (spec = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier), spec->type = type, spec->id = id, spec);

if(id && FindType(curContext, id->string))
declMode = 0;
spec->definitions = definitions;
if(definitions && id && !declMode)
{
struct __ecereNameSpace__ecere__sys__OldList specs = 
{
0, 0, 0, 0, 0
};
struct Symbol * symbol;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&specs, spec);
symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString(id->string), ((struct Symbol *)__ecereTemp1)->type = ProcessType(&specs, (((void *)0))), ((struct Symbol *)__ecereTemp1)->isStruct = 0x1, ((struct Symbol *)__ecereTemp1));
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&curContext->structSymbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
FreeSymbol(symbol);
}
return spec;
}

void AddStructDefinitions(struct Specifier * spec, struct __ecereNameSpace__ecere__sys__OldList * definitions)
{
void * __ecereTemp1;

spec->definitions = definitions;
if(definitions && spec->id && !declMode)
{
struct Symbol * symbol;
struct __ecereNameSpace__ecere__sys__OldList specs = 
{
0, 0, 0, 0, 0
};

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&specs, spec);
symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString(spec->id->string), ((struct Symbol *)__ecereTemp1)->type = ProcessType(&specs, (((void *)0))), ((struct Symbol *)__ecereTemp1)->isStruct = 0x1, ((struct Symbol *)__ecereTemp1));
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&curContext->parent->structSymbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
FreeSymbol(symbol);
}
}

struct Attribute * MkAttribute(char * attr, struct Expression * exp)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Attribute), ((struct Attribute *)__ecereTemp1)->attr = attr, ((struct Attribute *)__ecereTemp1)->exp = exp, ((struct Attribute *)__ecereTemp1));
}

struct Attrib * MkAttrib(int type, struct __ecereNameSpace__ecere__sys__OldList * attribs)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Attrib), ((struct Attrib *)__ecereTemp1)->type = type, ((struct Attrib *)__ecereTemp1)->attribs = attribs, ((struct Attrib *)__ecereTemp1));
}

struct ExtDecl * MkExtDeclString(char * s)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ExtDecl), ((struct ExtDecl *)__ecereTemp1)->type = 0, ((struct ExtDecl *)__ecereTemp1)->s = s, ((struct ExtDecl *)__ecereTemp1));
}

struct ExtDecl * MkExtDeclAttrib(struct Attrib * attr)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ExtDecl), ((struct ExtDecl *)__ecereTemp1)->type = 1, ((struct ExtDecl *)__ecereTemp1)->attr = attr, ((struct ExtDecl *)__ecereTemp1));
}

struct Declarator * MkDeclaratorIdentifier(struct Identifier * id)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator), ((struct Declarator *)__ecereTemp1)->type = 1, ((struct Declarator *)__ecereTemp1)->identifier = id, ((struct Declarator *)__ecereTemp1));
}

struct Declarator * MkDeclaratorFunction(struct Declarator * declarator, struct __ecereNameSpace__ecere__sys__OldList * parameters)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator), ((struct Declarator *)__ecereTemp1)->type = 4, ((struct Declarator *)__ecereTemp1)->declarator = declarator, ((struct Declarator *)__ecereTemp1)->function.parameters = parameters, ((struct Declarator *)__ecereTemp1));
}

struct Declarator * MkDeclaratorExtended(struct ExtDecl * extended, struct Declarator * declarator)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator), ((struct Declarator *)__ecereTemp1)->type = 6, ((struct Declarator *)__ecereTemp1)->declarator = declarator, ((struct Declarator *)__ecereTemp1)->extended.extended = extended, ((struct Declarator *)__ecereTemp1));
}

struct Declarator * MkDeclaratorExtendedEnd(struct ExtDecl * extended, struct Declarator * declarator)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator), ((struct Declarator *)__ecereTemp1)->type = 7, ((struct Declarator *)__ecereTemp1)->declarator = declarator, ((struct Declarator *)__ecereTemp1)->extended.extended = extended, ((struct Declarator *)__ecereTemp1));
}

struct Declarator * MkStructDeclarator(struct Declarator * declarator, struct Expression * exp)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator), ((struct Declarator *)__ecereTemp1)->type = 0, ((struct Declarator *)__ecereTemp1)->declarator = declarator, ((struct Declarator *)__ecereTemp1)->structDecl.exp = exp, ((struct Declarator *)__ecereTemp1));
}

struct Declarator * MkDeclaratorBrackets(struct Declarator * declarator)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator), ((struct Declarator *)__ecereTemp1)->type = 2, ((struct Declarator *)__ecereTemp1)->declarator = declarator, ((struct Declarator *)__ecereTemp1));
}

struct Declarator * MkDeclaratorArray(struct Declarator * declarator, struct Expression * exp)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator), ((struct Declarator *)__ecereTemp1)->type = 3, ((struct Declarator *)__ecereTemp1)->declarator = declarator, ((struct Declarator *)__ecereTemp1)->array.exp = exp, ((struct Declarator *)__ecereTemp1));
}

struct Declarator * MkDeclaratorEnumArray(struct Declarator * declarator, struct Specifier * _class)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator), ((struct Declarator *)__ecereTemp1)->type = 3, ((struct Declarator *)__ecereTemp1)->declarator = declarator, ((struct Declarator *)__ecereTemp1)->array.enumClass = _class, ((struct Declarator *)__ecereTemp1));
}

struct Declarator * MkDeclaratorPointer(struct Pointer * pointer, struct Declarator * declarator)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator), ((struct Declarator *)__ecereTemp1)->type = 5, ((struct Declarator *)__ecereTemp1)->declarator = declarator, ((struct Declarator *)__ecereTemp1)->pointer.pointer = pointer, ((struct Declarator *)__ecereTemp1));
}

struct Enumerator * MkEnumerator(struct Identifier * id, struct Expression * exp)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Enumerator), ((struct Enumerator *)__ecereTemp1)->id = id, ((struct Enumerator *)__ecereTemp1)->exp = exp, ((struct Enumerator *)__ecereTemp1));
}

struct Pointer * MkPointer(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Pointer * pointer)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Pointer), ((struct Pointer *)__ecereTemp1)->qualifiers = qualifiers, ((struct Pointer *)__ecereTemp1)->pointer = pointer, ((struct Pointer *)__ecereTemp1));
}

struct Initializer * MkInitializerAssignment(struct Expression * exp)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Initializer), ((struct Initializer *)__ecereTemp1)->type = 0, ((struct Initializer *)__ecereTemp1)->exp = exp, ((struct Initializer *)__ecereTemp1)->loc = yylloc, ((struct Initializer *)__ecereTemp1));
}

struct Initializer * MkInitializerList(struct __ecereNameSpace__ecere__sys__OldList * list)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Initializer), ((struct Initializer *)__ecereTemp1)->type = 1, ((struct Initializer *)__ecereTemp1)->list = list, ((struct Initializer *)__ecereTemp1)->loc = yylloc, ((struct Initializer *)__ecereTemp1));
}

struct InitDeclarator * MkInitDeclarator(struct Declarator * declarator, struct Initializer * initializer)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_InitDeclarator), ((struct InitDeclarator *)__ecereTemp1)->declarator = declarator, ((struct InitDeclarator *)__ecereTemp1)->initializer = initializer, ((struct InitDeclarator *)__ecereTemp1));
}

struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TypeName), ((struct TypeName *)__ecereTemp1)->qualifiers = qualifiers, ((struct TypeName *)__ecereTemp1)->declarator = declarator, ((struct TypeName *)__ecereTemp1));
}

struct Identifier * GetDeclId(struct Declarator * decl)
{
while(decl && decl->type != 1)
decl = decl->declarator;
return decl ? decl->identifier : (((void *)0));
}

struct Declaration * MkDeclarationClassInst(struct Instantiation * inst)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declaration), ((struct Declaration *)__ecereTemp1)->type = 2, ((struct Declaration *)__ecereTemp1)->inst = inst, ((struct Declaration *)__ecereTemp1)->loc = yylloc, ((struct Declaration *)__ecereTemp1));
}

extern struct Context * globalContext;

struct Type * MkClassTypeSymbol(struct Symbol * symbol);

extern struct __ecereNameSpace__ecere__sys__OldList *  excludedSymbols;

struct Declaration * MkDeclarationInst(struct Instantiation * inst)
{
void * __ecereTemp1;
struct Declaration * decl = (decl = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declaration), decl->type = 2, decl->inst = inst, decl->loc = yylloc, decl);
struct Symbol * symbol;

if(curContext == globalContext && (currentNameSpace || defaultNameSpace) && declMode != 0 && defaultDeclMode != 0)
{
char name[1024];
int len = 0, stringLen;

if(defaultNameSpace)
{
memcpy(name, defaultNameSpace, defaultNameSpaceLen);
len += defaultNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
if(currentNameSpace)
{
memcpy(name + len, currentNameSpace, currentNameSpaceLen);
len += currentNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
stringLen = strlen(inst->exp->identifier->string);
memcpy(name + len, inst->exp->identifier->string, stringLen);
len += stringLen;
name[len] = (char)0;
(__ecereNameSpace__ecere__com__eSystem_Delete(inst->exp->identifier->string), inst->exp->identifier->string = 0);
inst->exp->identifier->string = __ecereNameSpace__ecere__sys__CopyString(name);
}
symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = (inst->exp->type == 0) ? __ecereNameSpace__ecere__sys__CopyString(inst->exp->identifier->string) : (((void *)0)), ((struct Symbol *)__ecereTemp1)->type = MkClassTypeSymbol(inst->_class->symbol), ((struct Symbol *)__ecereTemp1));
symbol->idCode = symbol->id = curContext->nextID++;
if(strstr(symbol->string, "::"))
curContext->hasNameSpace = 0x1;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(curContext->templateTypesOnly ? curContext->parent : curContext)->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
decl->symbol = inst->symbol = symbol;
return decl;
}

extern void PrintExpression(struct Expression * exp, char *  string);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DefinedExpression;

struct __ecereNameSpace__ecere__com__DefinedExpression;

extern struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_FindDefine(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

extern struct __ecereNameSpace__ecere__com__Instance * privateModule;

extern struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_RegisterDefine(char *  name, char *  value, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

extern unsigned int buildingECERECOMModule;

extern void Compiler_Warning(char *  format, ...);

extern char *  __ecereNameSpace__ecere__GetTranslatedString(struct __ecereNameSpace__ecere__com__Instance * module, char *  string, char *  stringAndContext);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

struct Declaration * MkDeclarationDefine(struct Identifier * id, struct Expression * exp)
{
struct Declaration * decl = (decl = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declaration), decl->type = 3, decl->id = id, decl->exp = exp, decl->loc = yylloc, decl);
char expString[1024];

expString[0] = '\0';
PrintExpression(exp, expString);
if(curContext == globalContext && (currentNameSpace || defaultNameSpace) && declMode != 0 && defaultDeclMode != 0)
{
char name[1024];
int len = 0, stringLen;

if(defaultNameSpace)
{
memcpy(name, defaultNameSpace, defaultNameSpaceLen);
len += defaultNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
if(currentNameSpace)
{
memcpy(name + len, currentNameSpace, currentNameSpaceLen);
len += currentNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
stringLen = strlen(id->string);
memcpy(name + len, id->string, stringLen);
len += stringLen;
name[len] = (char)0;
(__ecereNameSpace__ecere__com__eSystem_Delete(id->string), id->string = 0);
id->string = __ecereNameSpace__ecere__sys__CopyString(name);
}
if(!__ecereNameSpace__ecere__com__eSystem_FindDefine(privateModule, id->string))
__ecereNameSpace__ecere__com__eSystem_RegisterDefine(id->string, expString, privateModule, buildingECERECOMModule ? 4 : 1);
else
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Redefinition of %s ignored\n", (((void *)0))), id->string);
return decl;
}

extern int sprintf(char * , char * , ...);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, char *  key);

struct Declaration * MkDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators)
{
void * __ecereTemp1;
struct Declaration * decl = (decl = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declaration), decl->type = 1, decl->declarators = initDeclarators, decl->specifiers = specifiers, decl->loc = yylloc, decl);
unsigned int variable = 0x1;

if(specifiers != (((void *)0)))
{
struct Specifier * spec;

for(spec = specifiers->first; spec; spec = spec->next)
{
if(spec->type == 0 && spec->specifier == TYPEDEF)
{
if(initDeclarators != (((void *)0)))
{
struct InitDeclarator * d;

for(d = initDeclarators->first; d; d = d->next)
{
if(GetDeclId(d->declarator)->string)
{
struct Symbol * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), type->string = __ecereNameSpace__ecere__sys__CopyString(GetDeclId(d->declarator)->string), type->type = ProcessType(specifiers, d->declarator), type);

type->id = type->idCode = curContext->nextID++;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(curContext->templateTypesOnly ? curContext->parent : curContext)->types, (struct __ecereNameSpace__ecere__sys__BTNode *)type))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), type);
decl->symbol = d->declarator->symbol = type;
}
}
}
else if(spec->next)
{
for(; spec; spec = spec->next)
{
if(spec->type == 1 && spec->name)
{
struct Symbol * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), type->string = __ecereNameSpace__ecere__sys__CopyString(spec->name), type->type = ProcessType(specifiers, (((void *)0))), type);

type->id = type->idCode = curContext->nextID++;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(curContext->templateTypesOnly ? curContext->parent : curContext)->types, (struct __ecereNameSpace__ecere__sys__BTNode *)type))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), type);
decl->symbol = type;
}
}
}
variable = 0x0;
break;
}
else if(spec->type == 0 && (spec->specifier == STRUCT || spec->specifier == UNION))
variable = 0x0;
}
}
if(variable && initDeclarators)
{
struct InitDeclarator * d;

for(d = initDeclarators->first; d; d = d->next)
{
struct Identifier * id = GetDeclId(d->declarator);

if(id && id->string && id->string[0])
{
if(curContext)
{
struct Symbol * symbol;

if(curContext == globalContext && (currentNameSpace || defaultNameSpace) && declMode != 0 && defaultDeclMode != 0)
{
char name[1024];
int len = 0, stringLen;

if(defaultNameSpace)
{
memcpy(name, defaultNameSpace, defaultNameSpaceLen);
len += defaultNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
if(currentNameSpace)
{
memcpy(name + len, currentNameSpace, currentNameSpaceLen);
len += currentNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
stringLen = strlen(id->string);
memcpy(name + len, id->string, stringLen);
len += stringLen;
name[len] = (char)0;
(__ecereNameSpace__ecere__com__eSystem_Delete(id->string), id->string = 0);
id->string = __ecereNameSpace__ecere__sys__CopyString(name);
}
symbol = (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(curContext->templateTypesOnly ? curContext->parent : curContext)->symbols, id->string);
if(!symbol)
{
symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString(id->string), ((struct Symbol *)__ecereTemp1)->type = ProcessType(specifiers, d->declarator), ((struct Symbol *)__ecereTemp1));
if(strstr(symbol->string, "::"))
curContext->hasNameSpace = 0x1;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(curContext->templateTypesOnly ? curContext->parent : curContext)->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
if(symbol->type && symbol->type->kind == 12 && !symbol->type->arraySizeExp && d->initializer)
{
if(d->initializer->type == 1)
{
char string[256];

sprintf(string, "%d", (*d->initializer->list).count);
symbol->type->arraySizeExp = MkExpConstant(string);
symbol->type->freeExp = 0x1;
}
else if(d->initializer->type == 0 && d->initializer->exp->type == 3 && d->initializer->exp->string)
{
char string[256];
int c, count = 0;
char ch;
unsigned int escaped = 0x0;
char * s = d->initializer->exp->string;

for(c = 1; (ch = s[c]); c++)
{
if(ch == '\\' && !escaped)
escaped = 0x1;
else
{
count++;
escaped = 0x0;
}
}
sprintf(string, "%d", count);
symbol->type->arraySizeExp = MkExpConstant(string);
symbol->type->freeExp = 0x1;
}
}
symbol->id = symbol->idCode = curContext->nextID++;
}
decl->symbol = d->declarator->symbol = symbol;
}
}
}
}
else
{
decl->symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);
decl->symbol->id = decl->symbol->idCode = curContext->nextID++;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), decl->symbol);
}
return decl;
}

struct Declaration * MkStructDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * declarators, struct Specifier * extStorage)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declaration), ((struct Declaration *)__ecereTemp1)->type = 0, ((struct Declaration *)__ecereTemp1)->declarators = declarators, ((struct Declaration *)__ecereTemp1)->specifiers = specifiers, ((struct Declaration *)__ecereTemp1)->extStorage = extStorage, ((struct Declaration *)__ecereTemp1)->loc = yylloc, ((struct Declaration *)__ecereTemp1));
}

struct Statement * MkLabeledStmt(struct Identifier * id, struct Statement * statement)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 0, ((struct Statement *)__ecereTemp1)->labeled.id = id, ((struct Statement *)__ecereTemp1)->labeled.stmt = statement, ((struct Statement *)__ecereTemp1)->loc = yylloc, ((struct Statement *)__ecereTemp1));
}

struct Statement * MkCaseStmt(struct Expression * exp, struct Statement * statement)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 1, ((struct Statement *)__ecereTemp1)->caseStmt.exp = exp, ((struct Statement *)__ecereTemp1)->caseStmt.stmt = statement, ((struct Statement *)__ecereTemp1)->loc = yylloc, ((struct Statement *)__ecereTemp1));
}

struct Statement * MkCompoundStmt(struct __ecereNameSpace__ecere__sys__OldList * declarations, struct __ecereNameSpace__ecere__sys__OldList * statements)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 2, ((struct Statement *)__ecereTemp1)->compound.declarations = declarations, ((struct Statement *)__ecereTemp1)->compound.statements = statements, ((struct Statement *)__ecereTemp1)->loc = yylloc, ((struct Statement *)__ecereTemp1));
}

struct Statement * MkExpressionStmt(struct __ecereNameSpace__ecere__sys__OldList * expressions)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 3, ((struct Statement *)__ecereTemp1)->expressions = expressions, ((struct Statement *)__ecereTemp1)->loc = yylloc, ((struct Statement *)__ecereTemp1));
}

struct Statement * MkBadDeclStmt(struct Declaration * decl)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 14, ((struct Statement *)__ecereTemp1)->decl = decl, ((struct Statement *)__ecereTemp1)->loc = yylloc, ((struct Statement *)__ecereTemp1));
}

struct Statement * MkIfStmt(struct __ecereNameSpace__ecere__sys__OldList * exp, struct Statement * statement, struct Statement * elseStmt)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 4, ((struct Statement *)__ecereTemp1)->ifStmt.exp = exp, ((struct Statement *)__ecereTemp1)->ifStmt.stmt = statement, ((struct Statement *)__ecereTemp1)->ifStmt.elseStmt = elseStmt, ((struct Statement *)__ecereTemp1)->loc = yylloc, ((struct Statement *)__ecereTemp1));
}

struct Statement * MkSwitchStmt(struct __ecereNameSpace__ecere__sys__OldList * exp, struct Statement * statement)
{
void * __ecereTemp1;

if(statement)
statement->compound.isSwitch = 0x1;
return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 5, ((struct Statement *)__ecereTemp1)->switchStmt.exp = exp, ((struct Statement *)__ecereTemp1)->switchStmt.stmt = statement, ((struct Statement *)__ecereTemp1)->loc = yylloc, ((struct Statement *)__ecereTemp1));
}

struct Statement * MkWhileStmt(struct __ecereNameSpace__ecere__sys__OldList * exp, struct Statement * statement)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 6, ((struct Statement *)__ecereTemp1)->whileStmt.exp = exp, ((struct Statement *)__ecereTemp1)->whileStmt.stmt = statement, ((struct Statement *)__ecereTemp1)->loc = yylloc, ((struct Statement *)__ecereTemp1));
}

struct Statement * MkDoWhileStmt(struct Statement * statement, struct __ecereNameSpace__ecere__sys__OldList * exp)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 7, ((struct Statement *)__ecereTemp1)->doWhile.exp = exp, ((struct Statement *)__ecereTemp1)->doWhile.stmt = statement, ((struct Statement *)__ecereTemp1)->loc = yylloc, ((struct Statement *)__ecereTemp1));
}

struct Statement * MkForStmt(struct Statement * init, struct Statement * check, struct __ecereNameSpace__ecere__sys__OldList * inc, struct Statement * statement)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 8, ((struct Statement *)__ecereTemp1)->forStmt.init = init, ((struct Statement *)__ecereTemp1)->forStmt.check = check, ((struct Statement *)__ecereTemp1)->forStmt.increment = inc, ((struct Statement *)__ecereTemp1)->forStmt.stmt = statement, ((struct Statement *)__ecereTemp1)->loc = yylloc, ((struct Statement *)__ecereTemp1));
}

struct Statement * MkForEachStmt(struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * exp, struct __ecereNameSpace__ecere__sys__OldList * filter, struct Statement * statement)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 18, ((struct Statement *)__ecereTemp1)->forEachStmt.id = id, ((struct Statement *)__ecereTemp1)->forEachStmt.exp = exp, ((struct Statement *)__ecereTemp1)->forEachStmt.filter = filter, ((struct Statement *)__ecereTemp1)->forEachStmt.stmt = statement, ((struct Statement *)__ecereTemp1)->loc = yylloc, ((struct Statement *)__ecereTemp1));
}

struct Statement * MkGotoStmt(struct Identifier * id)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 9, ((struct Statement *)__ecereTemp1)->gotoStmt.id = id, ((struct Statement *)__ecereTemp1)->loc = yylloc, ((struct Statement *)__ecereTemp1));
}

struct Statement * MkContinueStmt()
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 10, ((struct Statement *)__ecereTemp1)->loc = yylloc, ((struct Statement *)__ecereTemp1));
}

struct Statement * MkBreakStmt()
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 11, ((struct Statement *)__ecereTemp1)->loc = yylloc, ((struct Statement *)__ecereTemp1));
}

struct Statement * MkReturnStmt(struct __ecereNameSpace__ecere__sys__OldList * exp)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 12, ((struct Statement *)__ecereTemp1)->expressions = exp, ((struct Statement *)__ecereTemp1)->loc = yylloc, ((struct Statement *)__ecereTemp1));
}

struct FunctionDefinition * MkFunction(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct Declarator * declarator, struct __ecereNameSpace__ecere__sys__OldList * declarationList)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_FunctionDefinition), ((struct FunctionDefinition *)__ecereTemp1)->specifiers = specifiers, ((struct FunctionDefinition *)__ecereTemp1)->declarator = declarator, ((struct FunctionDefinition *)__ecereTemp1)->declarations = declarationList, ((struct FunctionDefinition *)__ecereTemp1));
}

extern struct Declarator * GetFuncDecl(struct Declarator * decl);

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(struct __ecereNameSpace__ecere__sys__BinaryTree * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first;

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(struct __ecereNameSpace__ecere__sys__BTNode * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__sys__BTNode_next;

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void ProcessFunctionBody(struct FunctionDefinition * func, struct Statement * body)
{
void * __ecereTemp1;
struct Declarator * declarator = func->declarator;
struct Declarator * funcDecl = GetFuncDecl(declarator);
struct Symbol * symbol;

func->body = body;
if(funcDecl && funcDecl->function.parameters && body)
{
struct Context * context = body->compound.context;
struct TypeName * param;

for(param = (*funcDecl->function.parameters).first; param; param = param->next)
{
if(param->declarator)
{
struct Symbol * symbol = (((void *)0));
struct Identifier * id = GetDeclId(param->declarator);
char * string = id ? id->string : (((void *)0));

if(string)
{
for(symbol = (struct Symbol *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&context->symbols); symbol; symbol = (struct Symbol *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)symbol)))
if(!strcmp(symbol->string, string))
break;
if(!symbol && id)
{
symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString(id->string), ((struct Symbol *)__ecereTemp1)->type = ProcessType(param->qualifiers, param->declarator), ((struct Symbol *)__ecereTemp1)->isParam = 0x1, ((struct Symbol *)__ecereTemp1));
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
symbol->id = context->nextID++;
param->declarator->symbol = symbol;
}
}
}
}
}
if(!declarator->symbol)
{
struct Identifier * id = GetDeclId(declarator);

if((currentNameSpace || defaultNameSpace) && declMode != 0 && defaultDeclMode != 0 && strcmp(id->string, "__on_register_module"))
{
char name[1024];
int len = 0, stringLen;

if(defaultNameSpace)
{
memcpy(name, defaultNameSpace, defaultNameSpaceLen);
len += defaultNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
if(currentNameSpace)
{
memcpy(name + len, currentNameSpace, currentNameSpaceLen);
len += currentNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
stringLen = strlen(id->string);
memcpy(name + len, id->string, stringLen);
len += stringLen;
name[len] = (char)0;
(__ecereNameSpace__ecere__com__eSystem_Delete(id->string), id->string = 0);
id->string = __ecereNameSpace__ecere__sys__CopyString(name);
}
symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString(id->string), ((struct Symbol *)__ecereTemp1)->type = ProcessType(func->specifiers, declarator), ((struct Symbol *)__ecereTemp1));
symbol->idCode = symbol->id = globalContext->nextID++;
if(strstr(symbol->string, "::"))
globalContext->hasNameSpace = 0x1;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
declarator->symbol = symbol;
}
else
{
symbol = declarator->symbol;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*excludedSymbols), declarator->symbol);
(__ecereNameSpace__ecere__com__eSystem_Delete(symbol->string), symbol->string = 0);
symbol->string = __ecereNameSpace__ecere__sys__CopyString(GetDeclId(declarator)->string);
if(strstr(symbol->string, "::"))
globalContext->hasNameSpace = 0x1;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
if(!symbol->type)
symbol->type = ProcessType(func->specifiers, declarator);
}
if(symbol->type && (symbol->type->kind == 11 || symbol->type->kind == 16))
{
if(!symbol->type->params.count)
{
struct Type * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), type->refCount = 1, type);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&symbol->type->params, type);
}
}
else
{
}
}

struct External * MkExternalFunction(struct FunctionDefinition * function)
{
struct External * external = (external = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_External), external->type = 0, external->function = function, external->symbol = function->declarator->symbol, external);

if(function->specifiers)
{
struct Specifier * spec;

for(spec = (*function->specifiers).first; spec; spec = spec->next)
if(spec->type == 0 && spec->specifier == STATIC)
{
declMode = 3;
break;
}
}
if(external->symbol && !external->symbol->methodExternal)
external->symbol->methodExternal = external;
return external;
}

extern char *  strncpy(char * , const char * , int n);

extern void ImportModule(char *  name, int importType, int importAccess, unsigned int loadDllOnly);

struct External * MkExternalImport(char * name, int importType, int importAccess)
{
struct External * external = (external = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_External), external->type = 3, external);
int len = strlen(name) - 2;

external->importString = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (len + 1));
strncpy(external->importString, name + 1, len);
external->importString[len] = '\0';
(__ecereNameSpace__ecere__com__eSystem_Delete(name), name = 0);
{
ImportModule(external->importString, importType, importAccess, 0x1);
ImportModule(external->importString, importType, importAccess, 0x0);
}
return external;
}

struct External * MkExternalDeclaration(struct Declaration * declaration)
{
struct External * external = (external = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_External), external->type = 1, external->declaration = declaration, external->symbol = declaration ? declaration->symbol : (((void *)0)), external);
struct InitDeclarator * d = (declaration && declaration->declarators) ? (*declaration->declarators).last : (((void *)0));

if(declaration && declaration->type == 1 && declaration->specifiers)
{
struct Specifier * spec;

for(spec = (*declaration->specifiers).first; spec; spec = spec->next)
if(spec->type == 0 && spec->specifier == TYPEDEF)
{
declMode = 0;
break;
}
else if(spec->type == 0 && spec->specifier == STATIC)
{
declMode = 3;
break;
}
}
if(declaration && declaration->symbol && !declaration->symbol->methodExternal)
declaration->symbol->methodExternal = external;
return external;
}

struct External * MkExternalNameSpace(struct Identifier * identifier)
{
struct External * external = (external = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_External), external->type = 4, external->id = identifier, external);

currentNameSpace = identifier ? identifier->string : (((void *)0));
currentNameSpaceLen = currentNameSpace ? strlen(currentNameSpace) : 0;
return external;
}

extern char *  strcpy(char * , const char * );

extern char *  strcat(char * , const char * );

extern struct __ecereNameSpace__ecere__com__Class * thisClass;

extern char *  StringFromSpecDecl(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

struct Symbol * _DeclClass(int symbolID, char *  name);

extern void FreeList(struct __ecereNameSpace__ecere__sys__OldList * list, void (* )(void * ));

extern void FreeTemplateArgument(struct TemplateArgument * arg);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldLink;

struct __ecereNameSpace__ecere__sys__OldLink
{
struct __ecereNameSpace__ecere__sys__OldLink * prev;
struct __ecereNameSpace__ecere__sys__OldLink * next;
void *  data;
} __attribute__ ((gcc_struct));

void SetClassTemplateArgs(struct Specifier * spec, struct __ecereNameSpace__ecere__sys__OldList * templateArgs)
{
void * __ecereTemp1;

if(spec->type == 1)
{
struct Symbol * symbol = spec->symbol;

spec->templateArgs = templateArgs;
if(templateArgs && templateArgs->first)
{
char templateString[1024];
struct TemplateArgument * arg;

strcpy(templateString, symbol ? symbol->string : spec->name);
strcat(templateString, "<");
for(arg = templateArgs->first; arg; arg = arg->next)
{
char argument[256];

argument[0] = '\0';
switch(arg->type)
{
case 2:
{
char expString[1024];
struct __ecereNameSpace__ecere__com__Class * backupThisClass = thisClass;

thisClass = (((void *)0));
expString[0] = '\0';
PrintExpression(arg->expression, expString);
strcat(argument, expString);
thisClass = backupThisClass;
break;
}
case 1:
{
strcat(argument, arg->identifier->string);
break;
}
case 0:
{
char * typeString = StringFromSpecDecl(arg->templateDatatype->specifiers, arg->templateDatatype->decl);

strcat(argument, typeString);
(__ecereNameSpace__ecere__com__eSystem_Delete(typeString), typeString = 0);
break;
}
}
if(argument[0])
{
if(arg->prev)
strcat(templateString, ", ");
if(arg->name)
{
strcat(templateString, arg->name->string);
strcat(templateString, " = ");
}
strcat(templateString, argument);
}
}
{
int len = strlen(templateString);

if(templateString[len - 1] == '>')
templateString[len++] = ' ';
templateString[len++] = '>';
templateString[len++] = '\0';
}
symbol = FindClass(templateString);
if(!symbol && spec->symbol)
{
symbol = _DeclClass((((int)0x7fffffff)), templateString);
}
if(spec->symbol)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&spec->symbol->templatedClasses, (__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(12), ((struct __ecereNameSpace__ecere__sys__OldLink *)__ecereTemp1)->data = symbol, ((struct __ecereNameSpace__ecere__sys__OldLink *)__ecereTemp1)));
(__ecereNameSpace__ecere__com__eSystem_Delete(spec->name), spec->name = 0);
spec->symbol = symbol;
spec->name = __ecereNameSpace__ecere__sys__CopyString(symbol ? symbol->string : templateString);
}
}
else
FreeList(templateArgs, FreeTemplateArgument);
}

extern int strncmp(const char * , const char * , int n);

struct Specifier * _MkSpecifierName(char * name, struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * templateArgs)
{
struct Specifier * spec = (spec = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier), spec->type = 1, spec);

if(name)
{
if(!symbol)
{
struct TemplatedType * templatedType = FindTemplateTypeParameter(curContext, name);

if(templatedType)
{
spec->templateParameter = templatedType->param;
spec->type = 8;
return spec;
}
else
symbol = FindClass(name);
}
if(symbol && symbol->registered && symbol->registered->isRemote == (unsigned int)1)
{
char className[1024];

strcpy(className, "DCOMClient_");
if(!strncmp(name, className, strlen(className)))
spec->name = __ecereNameSpace__ecere__sys__CopyString(name);
else
{
strcat(className, name);
spec->name = __ecereNameSpace__ecere__sys__CopyString(className);
}
}
else if(symbol)
spec->name = __ecereNameSpace__ecere__sys__CopyString(symbol->string);
else
spec->name = __ecereNameSpace__ecere__sys__CopyString(name);
spec->symbol = symbol;
if(templateArgs != (((void *)0)))
SetClassTemplateArgs(spec, templateArgs);
}
return spec;
}

struct Specifier * MkSpecifierName(char * name)
{
return _MkSpecifierName(name, (((void *)0)), (((void *)0)));
}

struct Specifier * MkSpecifierNameArgs(char * name, struct __ecereNameSpace__ecere__sys__OldList * templateArgs)
{
return _MkSpecifierName(name, (((void *)0)), templateArgs);
}

struct ClassFunction * MkClassFunction(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct Specifier * _class, struct Declarator * decl, struct __ecereNameSpace__ecere__sys__OldList * declList)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassFunction), ((struct ClassFunction *)__ecereTemp1)->specifiers = specifiers, ((struct ClassFunction *)__ecereTemp1)->declarator = decl, ((struct ClassFunction *)__ecereTemp1)->declarations = declList, ((struct ClassFunction *)__ecereTemp1));
}

extern struct Specifier * CopySpecifier(struct Specifier * spec);

extern void FreeSpecifier(struct Specifier * spec);

void ProcessClassFunctionBody(struct ClassFunction * func, struct Statement * body)
{
void * __ecereTemp1;
struct Symbol * symbol;
struct Declarator * decl = func->declarator;
struct Declarator * funcDecl = GetFuncDecl(func->declarator);

func->body = body;
if(decl && !decl->symbol)
{
struct __ecereNameSpace__ecere__sys__OldList * symbolSpecs = MkList();

if(funcDecl && funcDecl->function.parameters && body)
{
struct Context * context = body->compound.context;
struct TypeName * param;

for(param = (*funcDecl->function.parameters).first; param; param = param->next)
{
if(param->declarator)
{
struct Symbol * symbol = (((void *)0));
struct Identifier * id = GetDeclId(param->declarator);
char * string = id ? id->string : (((void *)0));

if(string)
{
symbol = (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&context->symbols, string);
}
if(!symbol && id)
{
symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString(id->string), ((struct Symbol *)__ecereTemp1)->type = ProcessType(param->qualifiers, param->declarator), ((struct Symbol *)__ecereTemp1)->isParam = 0x1, ((struct Symbol *)__ecereTemp1));
symbol->idCode = symbol->id = context->nextID++;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
param->declarator->symbol = symbol;
}
}
}
}
symbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);
{
struct Identifier * id = GetDeclId(funcDecl);

if(id)
{
int c;

for(c = strlen(id->string) - 1; c >= 0; c--)
{
if(id->string[c] == ':')
{
char * string = __ecereNameSpace__ecere__sys__CopyString(id->string + c + 1);

id->string[c - 1] = (char)0;
id->_class = MkSpecifierName(id->string);
(__ecereNameSpace__ecere__com__eSystem_Delete(id->string), id->string = 0);
id->string = string;
break;
}
}
symbol->string = __ecereNameSpace__ecere__sys__CopyString(id->string);
}
}
if(func->specifiers)
{
struct Specifier * spec;

for(spec = (*func->specifiers).first; spec; spec = spec->next)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*symbolSpecs), CopySpecifier(spec));
}
symbol->type = ProcessType(symbolSpecs, decl);
symbol->idCode = symbol->id = globalContext->nextID++;
decl->symbol = symbol;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
FreeList(symbolSpecs, FreeSpecifier);
}
}

struct __ecereNameSpace__ecere__sys__OldList * MkSpecsClass(struct Specifier * _class)
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();

ListAdd(list, _class);
return list;
}

struct MemberInit * MkMemberInit(struct __ecereNameSpace__ecere__sys__OldList * ids, struct Initializer * initializer)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_MemberInit), ((struct MemberInit *)__ecereTemp1)->identifiers = ids, ((struct MemberInit *)__ecereTemp1)->initializer = initializer, ((struct MemberInit *)__ecereTemp1));
}

extern void FreeExpression(struct Expression * exp);

struct MemberInit * MkMemberInitExp(struct Expression * idExp, struct Initializer * initializer)
{
struct MemberInit * init = (init = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_MemberInit), init->initializer = initializer, init->identifiers = MkList(), init);
struct Expression * exp;

for(exp = idExp; exp && exp->type == 8; exp = exp->member.exp)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*init->identifiers), (((void *)0)), exp->member.member);
exp->member.member = (((void *)0));
}
if(exp && exp->type == 0)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*init->identifiers), (((void *)0)), exp->identifier);
exp->identifier = (((void *)0));
}
FreeExpression(idExp);
return init;
}

struct MembersInit * MkMembersInitList(struct __ecereNameSpace__ecere__sys__OldList * dataMembers)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_MembersInit), ((struct MembersInit *)__ecereTemp1)->type = 0, ((struct MembersInit *)__ecereTemp1)->dataMembers = dataMembers, ((struct MembersInit *)__ecereTemp1));
}

struct MembersInit * MkMembersInitMethod(struct ClassFunction * function)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_MembersInit), ((struct MembersInit *)__ecereTemp1)->type = 1, ((struct MembersInit *)__ecereTemp1)->function = function, ((struct MembersInit *)__ecereTemp1));
}

struct Instantiation * MkInstantiation(struct Specifier * _class, struct Expression * exp, struct __ecereNameSpace__ecere__sys__OldList * members)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation), ((struct Instantiation *)__ecereTemp1)->_class = _class, ((struct Instantiation *)__ecereTemp1)->exp = exp, ((struct Instantiation *)__ecereTemp1)->members = members, ((struct Instantiation *)__ecereTemp1));
}

extern void Compiler_Error(char *  format, ...);

struct Instantiation * MkInstantiationNamed(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Expression * exp, struct __ecereNameSpace__ecere__sys__OldList * members)
{
struct Instantiation * inst = (inst = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Instantiation), inst->exp = exp, inst->members = members, inst);

if(specs != (((void *)0)))
{
struct Specifier * spec;

for(spec = specs->first; spec; spec = spec->next)
if(spec->type == 1)
{
inst->_class = spec;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(specs, spec);
break;
}
FreeList(specs, FreeSpecifier);
if(!spec)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Expecting class specifier\n", (((void *)0))));
inst->_class = MkSpecifierName("");
}
}
return inst;
}

struct ClassDef * MkClassDefAccessOverride(int access, struct Identifier * id)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef), ((struct ClassDef *)__ecereTemp1)->type = 13, ((struct ClassDef *)__ecereTemp1)->id = id, ((struct ClassDef *)__ecereTemp1)->memberAccess = access, ((struct ClassDef *)__ecereTemp1));
}

struct ClassDef * MkClassDefMemberAccess()
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef), ((struct ClassDef *)__ecereTemp1)->type = 12, ((struct ClassDef *)__ecereTemp1));
}

struct ClassDef * MkClassDefDeclaration(struct Declaration * decl)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef), ((struct ClassDef *)__ecereTemp1)->type = 2, ((struct ClassDef *)__ecereTemp1)->decl = decl, ((struct ClassDef *)__ecereTemp1));
}

struct ClassDef * MkClassDefClassData(struct Declaration * decl)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef), ((struct ClassDef *)__ecereTemp1)->type = 9, ((struct ClassDef *)__ecereTemp1)->decl = decl, ((struct ClassDef *)__ecereTemp1));
}

struct ClassDef * MkClassDefDesigner(char * designer)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef), ((struct ClassDef *)__ecereTemp1)->type = 5, ((struct ClassDef *)__ecereTemp1)->designer = __ecereNameSpace__ecere__sys__CopyString(designer), ((struct ClassDef *)__ecereTemp1));
}

struct ClassDef * MkClassDefNoExpansion()
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef), ((struct ClassDef *)__ecereTemp1)->type = 6, ((struct ClassDef *)__ecereTemp1));
}

struct ClassDef * MkClassDefFixed()
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef), ((struct ClassDef *)__ecereTemp1)->type = 7, ((struct ClassDef *)__ecereTemp1));
}

struct ClassDef * MkClassDefDesignerDefaultProperty(struct Identifier * id)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef), ((struct ClassDef *)__ecereTemp1)->type = 8, ((struct ClassDef *)__ecereTemp1)->defaultProperty = id, ((struct ClassDef *)__ecereTemp1));
}

struct ClassDef * MkClassDefDefaultProperty(struct __ecereNameSpace__ecere__sys__OldList * defProperties)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef), ((struct ClassDef *)__ecereTemp1)->type = 1, ((struct ClassDef *)__ecereTemp1)->defProperties = defProperties, ((struct ClassDef *)__ecereTemp1));
}

extern void FreeClassFunction(struct ClassFunction * func);

struct ClassDef * MkClassDefFunction(struct ClassFunction * function)
{
struct ClassDef * def = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef);

if(function && function->declarator)
{
struct Declarator * funcDecl = GetFuncDecl(function->declarator);

if(funcDecl && funcDecl->declarator && funcDecl->declarator->type == 2)
{
def->type = 2;
def->decl = MkStructDeclaration(function->specifiers, MkListOne(MkStructDeclarator(function->declarator, (((void *)0)))), (((void *)0)));
function->declarator = (((void *)0));
function->specifiers = (((void *)0));
FreeClassFunction(function);
return def;
}
}
def->type = 0;
def->function = function;
return def;
}

struct Symbol * DeclClassAddNameSpace(int symbolID, char * className)
{
char name[1024];
int len = 0, stringLen;

name[0] = '\0';
if((currentNameSpace || defaultNameSpace) && declMode != 0 && defaultDeclMode != 0)
{
if(defaultNameSpace)
{
memcpy(name, defaultNameSpace, defaultNameSpaceLen);
len += defaultNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
if(currentNameSpace)
{
memcpy(name + len, currentNameSpace, currentNameSpaceLen);
len += currentNameSpaceLen;
name[len++] = ':';
name[len++] = ':';
}
}
stringLen = strlen(className);
memcpy(name + len, className, stringLen);
len += stringLen;
name[len] = (char)0;
return _DeclClass(symbolID, name);
}

extern char *  strchr(char * , int);

struct Symbol * DeclClass(int symbolID, char * name)
{
if(strchr(name, ':'))
return _DeclClass(symbolID, name);
else
return DeclClassAddNameSpace(symbolID, name);
}

struct Symbol * _DeclClass(int symbolID, char * name)
{
void * __ecereTemp1;
struct Symbol * symbol = FindClass(name);

if(!symbol)
{
if(name[0] == ':' && name[1] == ':')
name += 2;
symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString(name), ((struct Symbol *)__ecereTemp1)->idCode = symbolID, ((struct Symbol *)__ecereTemp1)->id = symbolID, ((struct Symbol *)__ecereTemp1));
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->classes, (struct __ecereNameSpace__ecere__sys__BTNode *)symbol))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
{
int start = 0, c;
char ch;

for(c = 0; (ch = name[c]); c++)
{
if(ch == '.' || (ch == ':' && name[c + 1] == ':'))
{
if(ch == ':')
c++;
start = c + 1;
}
}
if(start && c - start)
symbol->shortName = __ecereNameSpace__ecere__sys__CopyString(name + start);
}
}
if(symbolID)
symbol->idCode = symbol->id = symbolID;
return symbol;
}

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

void SetupBaseSpecs(struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * baseSpecs)
{
void * __ecereTemp1;

if(baseSpecs && baseSpecs->first && ((struct Specifier *)baseSpecs->first)->type == 1)
{
char name[1024];
struct Symbol * baseClass;
char * tpl;

strcpy(name, ((struct Specifier *)baseSpecs->first)->name);
tpl = strchr(name, '<');
if(tpl)
*tpl = (char)0;
baseClass = FindClass(name);
if(baseClass->ctx)
{
struct TemplatedType * copy;

for(copy = (struct TemplatedType *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&baseClass->ctx->templateTypes); copy; copy = (struct TemplatedType *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(copy))
{
struct TemplatedType * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TemplatedType), type->key = copy->key, type->param = copy->param, type);

if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&curContext->templateTypes, (struct __ecereNameSpace__ecere__sys__BTNode *)type))
((type ? (__ecereClass_TemplatedType->Destructor ? __ecereClass_TemplatedType->Destructor(type) : 0, __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor ? __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor(type) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(type)) : 0), type = 0);
}
}
else if(baseClass->registered)
{
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = baseClass->registered; sClass; sClass = sClass->base)
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
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&curContext->templateTypes, (struct __ecereNameSpace__ecere__sys__BTNode *)type))
((type ? (__ecereClass_TemplatedType->Destructor ? __ecereClass_TemplatedType->Destructor(type) : 0, __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor ? __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor(type) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(type)) : 0), type = 0);
}
}
}
}
}
}

extern struct __ecereNameSpace__ecere__sys__OldList * ast;

extern void FreeExternal(struct External * external);

extern void FreeContext(struct Context * context);

struct ClassDefinition * MkClass(struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * baseSpecs, struct __ecereNameSpace__ecere__sys__OldList * definitions)
{
void * __ecereTemp1;
struct ClassDefinition * classDef;

SetupBaseSpecs(symbol, baseSpecs);
if(symbol->ctx)
{
struct ClassDefinition * classDef = symbol->ctx->classDef;

if(classDef)
{
struct External * external;

for(external = (*ast).first; external; external = external->next)
{
if(external->type == 2 && external->_class == classDef)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*ast), external);
FreeExternal(external);
break;
}
}
}
FreeContext(symbol->ctx);
((symbol->ctx ? (__ecereClass_Context->Destructor ? __ecereClass_Context->Destructor(symbol->ctx) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(symbol->ctx)) : 0), symbol->ctx = 0);
}
symbol->ctx = curContext;
classDef = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDefinition), ((struct ClassDefinition *)__ecereTemp1)->symbol = symbol, ((struct ClassDefinition *)__ecereTemp1)->_class = MkSpecifierName(symbol->string), ((struct ClassDefinition *)__ecereTemp1)->baseSpecs = baseSpecs, ((struct ClassDefinition *)__ecereTemp1)->definitions = definitions, ((struct ClassDefinition *)__ecereTemp1)->nameLoc = symbol->nameLoc, ((struct ClassDefinition *)__ecereTemp1));
curContext->classDef = classDef;
return classDef;
}

struct Expression * MkExpInstance(struct Instantiation * inst)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 1, ((struct Expression *)__ecereTemp1)->instance = inst, ((struct Expression *)__ecereTemp1));
}

struct External * MkExternalClass(struct ClassDefinition * _class)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_External), ((struct External *)__ecereTemp1)->type = 2, ((struct External *)__ecereTemp1)->_class = _class, ((struct External *)__ecereTemp1)->symbol = _class->symbol, ((struct External *)__ecereTemp1));
}

extern void PrintType(struct Type * type, char *  string, unsigned int printName, unsigned int fullName);

struct PropertyDef * MkProperty(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl, struct Identifier * id, struct Statement * setStmt, struct Statement * getStmt)
{
void * __ecereTemp1;
struct PropertyDef * prop = (prop = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_PropertyDef), prop->specifiers = specs, prop->declarator = decl, prop->setStmt = setStmt, prop->getStmt = getStmt, prop);
struct Symbol * symbol;
struct Type * type = ProcessType(specs, decl);

if(!id)
{
char typeString[1024];

typeString[0] = '\0';
PrintType(type, typeString, 0x0, 0x1);
id = MkIdentifier(typeString);
prop->conversion = 0x1;
}
prop->id = id;
symbol = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString(id->string), ((struct Symbol *)__ecereTemp1)->type = type, ((struct Symbol *)__ecereTemp1));
symbol->idCode = symbol->id = globalContext->nextID++;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), symbol);
globalContext->nextID++;
globalContext->nextID++;
prop->symbol = symbol;
return prop;
}

struct ClassDef * MkClassDefProperty(struct PropertyDef * propertyDef)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef), ((struct ClassDef *)__ecereTemp1)->type = 3, ((struct ClassDef *)__ecereTemp1)->propertyDef = propertyDef, ((struct ClassDef *)__ecereTemp1));
}

struct ClassDef * MkClassDefClassProperty(struct PropertyDef * propertyDef)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef), ((struct ClassDef *)__ecereTemp1)->type = 10, ((struct ClassDef *)__ecereTemp1)->propertyDef = propertyDef, ((struct ClassDef *)__ecereTemp1));
}

struct ClassDef * MkClassDefClassPropertyValue(struct Identifier * id, struct Initializer * initializer)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef), ((struct ClassDef *)__ecereTemp1)->type = 11, ((struct ClassDef *)__ecereTemp1)->id = id, ((struct ClassDef *)__ecereTemp1)->initializer = initializer, ((struct ClassDef *)__ecereTemp1));
}

int CheckType(char * text)
{
if(FindTemplateTypeParameter(curContext, text))
{
return TYPE_NAME;
}
if(FindType(curContext, text))
{
return TYPE_NAME;
}
if(FindClass(text))
{
return TYPE_NAME;
}
return IDENTIFIER;
}

int check_type()
{
return CheckType(yytext);
}

struct Context * PushContext()
{
struct Context * ctx = (ctx = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context), ctx->parent = curContext, ctx);

curContext = ctx;
return ctx;
}

void PopContext(struct Context * ctx)
{
curContext = ctx->parent;
}

struct Symbol * FindType(struct Context * ctx, char * name)
{
struct Symbol * type = (((void *)0));

if(curContext)
{
type = (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&ctx->types, name);
if(!type && ctx->parent)
type = FindType(ctx->parent, name);
}
return type;
}

struct TemplatedType * FindTemplateTypeParameter(struct Context * ctx, char * name)
{
struct TemplatedType * templatedType = (((void *)0));

if(curContext)
{
templatedType = (struct TemplatedType *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&ctx->templateTypes, name);
if(!templatedType && ctx->parent)
templatedType = FindTemplateTypeParameter(ctx->parent, name);
}
return templatedType;
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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SubModule;

struct __ecereNameSpace__ecere__com__SubModule
{
struct __ecereNameSpace__ecere__com__SubModule * prev;
struct __ecereNameSpace__ecere__com__SubModule * next;
struct __ecereNameSpace__ecere__com__Instance * module;
int importMode;
} __attribute__ ((gcc_struct));

unsigned int ModuleAccess(struct __ecereNameSpace__ecere__com__Instance * searchIn, struct __ecereNameSpace__ecere__com__Instance * searchFor)
{
struct __ecereNameSpace__ecere__com__SubModule * subModule;

if(searchFor == searchIn)
return 0x1;
for(subModule = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)searchIn + 12)))->modules.first; subModule; subModule = subModule->next)
{
if(subModule->importMode == 1)
{
if(ModuleAccess(subModule->module, searchFor))
return 0x1;
}
}
return 0x0;
}

extern struct ModuleImport * mainModule;

extern struct __ecereNameSpace__ecere__sys__OldList *  imports;

struct ModuleImport * FindModule(struct __ecereNameSpace__ecere__com__Instance * moduleToFind)
{
void * __ecereTemp1;
struct ModuleImport * module;

if(!((struct __ecereNameSpace__ecere__com__Module *)(((char *)moduleToFind + 12)))->name)
return mainModule;
for(module = (*imports).first; module; module = module->next)
if(module->name && !strcmp(module->name, ((struct __ecereNameSpace__ecere__com__Module *)(((char *)moduleToFind + 12)))->name))
break;
if(!module)
{
module = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ModuleImport), ((struct ModuleImport *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(((struct __ecereNameSpace__ecere__com__Module *)(((char *)moduleToFind + 12)))->name), ((struct ModuleImport *)__ecereTemp1)->importType = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)moduleToFind + 12)))->importType, ((struct ModuleImport *)__ecereTemp1)->importAccess = ModuleAccess(privateModule, moduleToFind) ? 1 : 2, ((struct ModuleImport *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*imports), module);
}
return module;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

struct Symbol * FindClass(char * name)
{
void * __ecereTemp1;
struct Symbol * cl = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * _class;
unsigned int global = 0x0;
char fullName[1024];

if(name[0] == ':' && name[1] == ':')
{
global = 0x1;
name += 2;
}
if(!global && (currentNameSpace || defaultNameSpace) && declMode != 0 && defaultDeclMode != 0)
{
int len = 0, stringLen;

if(defaultNameSpace)
{
memcpy(fullName, defaultNameSpace, defaultNameSpaceLen);
len += defaultNameSpaceLen;
fullName[len++] = ':';
fullName[len++] = ':';
}
if(currentNameSpace)
{
memcpy(fullName + len, currentNameSpace, currentNameSpaceLen);
len += currentNameSpaceLen;
fullName[len++] = ':';
fullName[len++] = ':';
}
stringLen = strlen(name);
memcpy(fullName + len, name, stringLen);
len += stringLen;
fullName[len] = (char)0;
cl = globalContext ? (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&globalContext->classes, fullName) : (((void *)0));
}
if(!cl)
cl = globalContext ? (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&globalContext->classes, name) : (((void *)0));
if(!cl && !global)
{
for(cl = globalContext ? (struct Symbol *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&globalContext->classes) : (((void *)0)); cl; cl = (struct Symbol *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)cl)))
{
if(cl->shortName && !strcmp(cl->shortName, name))
break;
}
}
if(!cl)
{
_class = (((void *)0));
if(!global && (currentNameSpace || defaultNameSpace) && declMode != 0 && defaultDeclMode != 0)
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, fullName);
if(!_class)
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, name);
if(_class)
{
name = _class->fullName;
cl = (struct Symbol *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&globalContext->classes, name);
if(!cl)
{
cl = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString(name), ((struct Symbol *)__ecereTemp1)->registered = _class, ((struct Symbol *)__ecereTemp1)->id = (((int)0x7fffffff)), ((struct Symbol *)__ecereTemp1)->idCode = (((int)0x7fffffff)), ((struct Symbol *)__ecereTemp1)->imported = 0x1, ((struct Symbol *)__ecereTemp1));
_class->symbol = cl;
if(_class->module)
cl->module = FindModule(_class->module);
else
cl->module = mainModule;
if(!__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->classes, (struct __ecereNameSpace__ecere__sys__BTNode *)cl))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*excludedSymbols), cl);
if(strcmp(name, _class->name))
cl->shortName = __ecereNameSpace__ecere__sys__CopyString(_class->name);
}
}
}
return cl;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__NamedLink;

struct __ecereNameSpace__ecere__sys__NamedLink
{
struct __ecereNameSpace__ecere__sys__NamedLink * prev;
struct __ecereNameSpace__ecere__sys__NamedLink * next;
char *  name;
void *  data;
} __attribute__ ((gcc_struct));

extern struct Expression * CopyExpression(struct Expression * exp);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear(struct __ecereNameSpace__ecere__sys__OldList * this);

void CopyTypeInto(struct Type * type, struct Type * src)
{
void * __ecereTemp1;

*type = *src;
type->name = __ecereNameSpace__ecere__sys__CopyString(src->name);
type->enumName = __ecereNameSpace__ecere__sys__CopyString(src->enumName);
type->refCount = 1;
if(src->kind == 15)
{
struct __ecereNameSpace__ecere__sys__NamedLink * member;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear(&type->members);
for(member = src->members.first; member; member = member->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&type->members, (__ecereTemp1 = __ecereNameSpace__ecere__com__eSystem_New0(16), ((struct __ecereNameSpace__ecere__sys__NamedLink *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(member->name), ((struct __ecereNameSpace__ecere__sys__NamedLink *)__ecereTemp1)->data = member->data, ((struct __ecereNameSpace__ecere__sys__NamedLink *)__ecereTemp1)));
}
}
else if(src->kind == 9 || src->kind == 10)
{
struct Type * member;

for(member = type->members.first; member; member = member->next)
member->refCount++;
}
else if(src->kind == 11)
{
struct Type * param;

type->returnType->refCount++;
for(param = type->params.first; param; param = param->next)
param->refCount++;
}
else if(src->kind == 13 || src->kind == 12)
{
type->type->refCount++;
if(src->kind == 12)
{
if(type->arraySizeExp)
type->arraySizeExp = CopyExpression(type->arraySizeExp);
}
}
}

extern void ProcessExpressionType(struct Expression * exp);

extern void ComputeExpression(struct Expression * exp);

extern unsigned long strtoul(const char *  nptr, char * *  endptr, int base);

extern struct Symbol * FindSymbol(char *  name, struct Context * startContext, struct Context * endContext, unsigned int isStruct, unsigned int globalNameSpace);

struct Type * ProcessType(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl)
{
void * __ecereTemp1;
struct Type * type = (((void *)0));
unsigned int isTypedef = 0x0;

if(!specs || specs->first)
{
struct Declarator * funcDecl = GetFuncDecl(decl);
struct Type * specType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
unsigned int dllExport = 0x0;

specType->kind = 3;
specType->isSigned = 0x1;
specType->refCount = 1;
type = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
while(decl && (decl->type == 0 || decl->type == 6 || decl->type == 7))
{
if(decl->type == 0 && decl->structDecl.exp)
{
ProcessExpressionType(decl->structDecl.exp);
ComputeExpression(decl->structDecl.exp);
if(decl->structDecl.exp->type == 2)
specType->bitFieldCount = strtoul(decl->structDecl.exp->constant, (((void *)0)), 0);
}
if((decl->type == 6 || decl->type == 7) && decl->extended.extended && decl->extended.extended->type == 0 && decl->extended.extended->s && (!strcmp(decl->extended.extended->s, "__declspec(dllexport)") || !strcmp(decl->extended.extended->s, "dllexport")))
{
dllExport = 0x1;
}
if((decl->type == 6 || decl->type == 7) && decl->extended.extended && decl->extended.extended->type == 1)
{
specType->keepCast = 0x1;
}
decl = decl->declarator;
}
if(funcDecl || !decl || decl->type == 1)
{
struct Specifier * spec;

if(specs != (((void *)0)))
{
unsigned int isLong = 0x0;

for(spec = specs->first; spec; spec = spec->next)
{
if(spec->type == 5 && spec->extDecl && spec->extDecl->type == 0 && spec->extDecl->s && (!strcmp(spec->extDecl->s, "__declspec(dllexport)") || !strcmp(spec->extDecl->s, "dllexport")))
{
dllExport = 0x1;
}
if(spec->type == 5 && spec->extDecl->type == 1)
{
specType->keepCast = 0x1;
}
if(spec->specifier != CONST && (specType->kind == 9 || specType->kind == 10))
{
FreeType(specType);
specType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->kind = 3, ((struct Type *)__ecereTemp1)->isSigned = 0x1, ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
}
if(spec->type == 0)
{
if(spec->specifier == TYPEDEF)
isTypedef = 0x1;
else if(spec->specifier == VOID)
specType->kind = 0;
else if(spec->specifier == CHAR)
specType->kind = 1;
else if(spec->specifier == INT)
{
if(specType->kind != 2 && specType->kind != 5)
specType->kind = 3;
}
else if(spec->specifier == UINT)
{
if(specType->kind != 2 && specType->kind != 5)
specType->kind = 3;
specType->isSigned = 0x0;
}
else if(spec->specifier == INT64)
specType->kind = 4;
else if(spec->specifier == VALIST)
specType->kind = 17;
else if(spec->specifier == SHORT)
specType->kind = 2;
else if(spec->specifier == LONG)
{
if(isLong)
specType->kind = 4;
else
specType->kind = 3;
isLong = 0x1;
}
else if(spec->specifier == FLOAT)
specType->kind = 6;
else if(spec->specifier == DOUBLE)
specType->kind = 7;
else if(spec->specifier == SIGNED)
specType->isSigned = 0x1;
else if(spec->specifier == UNSIGNED)
specType->isSigned = 0x0;
else if(spec->specifier == CONST)
specType->constant = 0x1;
else if(spec->specifier == TYPED_OBJECT)
{
specType->classObjectType = 2;
specType->kind = 8;
specType->_class = FindClass("class");
}
else if(spec->specifier == ANY_OBJECT)
{
specType->classObjectType = 3;
specType->kind = 8;
specType->_class = FindClass("class");
}
else if(spec->specifier == CLASS)
{
specType->classObjectType = 1;
specType->kind = 8;
specType->_class = FindClass("class");
}
else if(spec->specifier == THISCLASS)
specType->kind = 21;
}
else if(spec->type == 1)
{
if(spec->name && (!strcmp(spec->name, "intptr") || !strcmp(spec->name, "uintptr")))
{
specType->kind = 22;
if(!strcmp(spec->name, "uintptr"))
specType->isSigned = 0x0;
}
else
{
struct Symbol * symbol = spec->name ? FindType(curContext, spec->name) : (((void *)0));

if(symbol && symbol->type)
{
struct Type * dummy = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

*dummy = *specType;
FreeType(dummy);
CopyTypeInto(specType, symbol->type);
specType->typeName = __ecereNameSpace__ecere__sys__CopyString(symbol->type->name);
}
else if(!isTypedef)
{
specType->_class = spec->name ? FindClass(spec->name) : (((void *)0));
specType->kind = 8;
if(!specType->_class)
specType->kind = 3;
}
}
}
else if(spec->type == 2)
{
specType->kind = 15;
specType->enumName = spec->id ? __ecereNameSpace__ecere__sys__CopyString(spec->id->string) : (((void *)0));
if(spec->list)
{
struct Enumerator * e;
int nextValue = 0;

for(e = (*spec->list).first; e; e = e->next)
{
struct __ecereNameSpace__ecere__sys__NamedLink * i = (i = __ecereNameSpace__ecere__com__eSystem_New0(16), i->name = __ecereNameSpace__ecere__sys__CopyString(e->id->string), i);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&specType->members, i);
}
}
}
else if(spec->type == 8)
{
specType->kind = 20;
specType->templateParameter = spec->templateParameter;
}
else if(spec->type == 3 || spec->type == 4)
{
struct Symbol * _class = spec->id ? FindClass(spec->id->string) : (((void *)0));

if(_class)
{
if(!_class->registered || _class->registered->type != 1)
specType->directClassAccess = 0x1;
specType->_class = _class;
specType->kind = 8;
break;
}
if(spec->type == 3)
specType->kind = 9;
else if(spec->type == 4)
specType->kind = 10;
if(spec->id)
{
if(!spec->definitions && !isTypedef)
{
struct Symbol * symbol = spec->id->string ? FindSymbol(spec->id->string, curContext, globalContext, 0x1, 0x0) : (((void *)0));

if(symbol && symbol->type)
{
*specType = *symbol->type;
specType->name = __ecereNameSpace__ecere__sys__CopyString(symbol->type->name);
specType->typeName = __ecereNameSpace__ecere__sys__CopyString(spec->name);
specType->enumName = __ecereNameSpace__ecere__sys__CopyString(symbol->type->enumName);
specType->refCount = 1;
if(symbol->type->kind == 15)
{
struct __ecereNameSpace__ecere__sys__NamedLink * member;

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Clear(&specType->members);
for(member = symbol->type->members.first; member; member = member->next)
{
struct __ecereNameSpace__ecere__sys__NamedLink * item = (item = __ecereNameSpace__ecere__com__eSystem_New0(16), item->name = __ecereNameSpace__ecere__sys__CopyString(member->name), item->data = member->data, item);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&specType->members, item);
}
}
else if(symbol->type->kind == 9 || symbol->type->kind == 10)
{
struct Type * member;

for(member = specType->members.first; member; member = member->next)
member->refCount++;
}
else if(symbol->type->kind == 11)
{
struct Type * param;

specType->returnType->refCount++;
for(param = specType->params.first; param; param = param->next)
param->refCount++;
}
else if(symbol->type->kind == 13 || symbol->type->kind == 12)
{
specType->type->refCount++;
if(symbol->type->kind == 12)
{
if(specType->arraySizeExp)
specType->arraySizeExp = CopyExpression(specType->arraySizeExp);
}
}
}
else
specType->enumName = __ecereNameSpace__ecere__sys__CopyString(spec->id->string);
}
else
specType->enumName = __ecereNameSpace__ecere__sys__CopyString(spec->id->string);
}
if(spec->definitions)
{
struct ClassDef * def;

for(def = (*spec->definitions).first; def; def = def->next)
{
if(def->type == 2 && def->decl->type == 0)
{
struct Declaration * decl = def->decl;

if(decl->declarators)
{
struct Declarator * d;

for(d = (*decl->declarators).first; d; d = d->next)
{
struct Type * memberType = ProcessType(decl->specifiers, d);

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&specType->members, memberType);
}
}
else if(decl->specifiers)
{
struct Type * memberType = ProcessType(decl->specifiers, (((void *)0)));

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&specType->members, memberType);
}
}
}
}
break;
}
else if(spec->type == 7)
{
specType->kind = specType->kind = 19;
specType->_class = spec->_class->symbol;
}
}
}
else if(!decl)
specType->kind = 14;
}
if(funcDecl)
{
struct Declarator * d = funcDecl->declarator;
struct Type * funcType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);
struct TypeName * param;

funcType->kind = 11;
funcType->refCount = 1;
if(funcDecl->function.parameters)
{
for(param = (*funcDecl->function.parameters).first; param; param = param->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&funcType->params, ProcessType(param->qualifiers, param->declarator));
}
}
if(decl->type == 5)
{
struct Pointer * pointer = decl->pointer.pointer;
struct Type * ptrType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type);

funcType->returnType = ptrType;
funcType->returnType->refCount = 1;
while(pointer)
{
ptrType->kind = 13;
pointer = pointer->pointer;
if(pointer)
{
ptrType->type = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
ptrType = ptrType->type;
}
}
ptrType->type = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
*ptrType->type = *specType;
}
else
{
funcType->returnType = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
*funcType->returnType = *specType;
}
while(d && (d->type == 2 || d->type == 6 || d->type == 7))
{
if((d->type == 6 || d->type == 7) && d->extended.extended && d->extended.extended->type == 0 && d->extended.extended->s && (!strcmp(d->extended.extended->s, "__declspec(dllexport)") || !strcmp(d->extended.extended->s, "dllexport")))
{
dllExport = 0x1;
}
d = d->declarator;
}
funcType->dllExport = dllExport;
if(d && d->type == 5)
{
struct Type * ptrType;
struct Identifier * id;

if(d->declarator && d->declarator->type == 3)
{
struct Pointer * pointer = d->pointer.pointer;

type->kind = 12;
type->arraySizeExp = CopyExpression(d->declarator->array.exp);
type->freeExp = 0x1;
if(d->declarator->array.enumClass)
type->enumClass = d->declarator->array.enumClass->symbol;
if(d->declarator->declarator && d->declarator->declarator->type == 3)
{
struct Type * tmpType = type;
struct Type * inType;

type = ProcessType((((void *)0)), d->declarator->declarator);
inType = type->type;
type->type = tmpType;
tmpType->type = inType;
}
else
type->type = ProcessType((((void *)0)), d->declarator->declarator);
for(ptrType = type->type; ptrType && ptrType->kind && ptrType->type; ptrType = ptrType->type)
;
while(pointer)
{
ptrType->kind = 13;
pointer = pointer->pointer;
if(pointer)
{
ptrType->type = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
ptrType = ptrType->type;
}
}
ptrType->type = ProcessType(specs, (((void *)0)));
}
else
{
struct Pointer * pointer = d->pointer.pointer;

ptrType = type;
while(pointer)
{
ptrType->kind = 13;
ptrType->type = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
pointer = pointer->pointer;
if(pointer)
ptrType = ptrType->type;
}
}
*ptrType->type = *funcType;
id = GetDeclId(d);
if(id)
{
if(id->_class && !id->_class->name)
ptrType->type->staticMethod = 0x1;
else
{
if(!id->classSym)
{
if(id->_class && id->_class->name)
{
id->classSym = id->_class->symbol;
}
}
ptrType->type->thisClass = id->classSym;
if(ptrType->type->thisClass && strcmp(ptrType->type->thisClass->string, "class"))
ptrType->type->extraParam = 0x1;
else if(id->_class && id->_class->name && !strcmp(id->_class->name, "any_object"))
{
ptrType->type->extraParam = 0x1;
ptrType->type->thisClass = FindClass("class");
}
}
type->name = __ecereNameSpace__ecere__sys__CopyString(id->string);
}
}
else if(!d || d->type == 1)
{
*type = *funcType;
if(d)
{
if(d->identifier->_class && d->identifier->_class->type == 8)
{
type->thisClassTemplate = d->identifier->_class->templateParameter;
type->extraParam = 0x1;
}
else
{
if(d->identifier->_class && !d->identifier->_class->name)
type->staticMethod = 0x1;
else
{
if(d->identifier->_class && d->identifier->_class->name && d->identifier->_class->name[strlen(d->identifier->_class->name) - 1] == '&')
{
type->thisClass = FindClass("class");
type->byReference = 0x1;
}
else
type->thisClass = d->identifier->_class ? d->identifier->_class->symbol : (((void *)0));
if(type->thisClass && strcmp(type->thisClass->string, "class"))
{
type->extraParam = 0x1;
}
else if(d->identifier->_class && d->identifier->_class->name && !strcmp(d->identifier->_class->name, "any_object"))
{
type->extraParam = 0x1;
type->thisClass = FindClass("class");
}
else if(d->identifier->_class && d->identifier->_class->name && !strcmp(d->identifier->_class->name, "class"))
{
type->thisClass = FindClass("class");
type->classObjectType = 1;
}
}
}
type->name = __ecereNameSpace__ecere__sys__CopyString(d->identifier->string);
}
}
((funcType ? (__ecereClass_Type->Destructor ? __ecereClass_Type->Destructor(funcType) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(funcType)) : 0), funcType = 0);
}
else if(decl && decl->type == 5)
{
if(decl->declarator && decl->declarator->type == 3)
{
struct Identifier * id;
struct Pointer * pointer = decl->pointer.pointer;
struct Type * ptrType;

type->kind = 12;
type->arraySizeExp = CopyExpression(decl->declarator->array.exp);
type->freeExp = 0x1;
if(decl->declarator->array.enumClass)
type->enumClass = decl->declarator->array.enumClass->symbol;
if(decl->declarator->declarator && decl->declarator->declarator->type == 3)
{
struct Type * tmpType = type;
struct Type * inType;

type = ProcessType((((void *)0)), decl->declarator->declarator);
inType = type->type;
type->type = tmpType;
tmpType->type = inType;
}
else
type->type = ProcessType((((void *)0)), decl->declarator->declarator);
for(ptrType = type->type; ptrType && ptrType->kind && ptrType->type; ptrType = ptrType->type)
;
while(pointer)
{
ptrType->kind = 13;
pointer = pointer->pointer;
if(pointer)
{
ptrType->type = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
ptrType = ptrType->type;
}
}
ptrType->type = ProcessType(specs, (((void *)0)));
id = GetDeclId(decl);
if(id)
type->name = __ecereNameSpace__ecere__sys__CopyString(id->string);
}
else
{
struct Identifier * id;
struct Pointer * pointer = decl->pointer.pointer;
struct Type * ptrType = type;

if(type->classObjectType)
{
type->byReference = 0x1;
}
else
{
while(pointer)
{
ptrType->kind = 13;
pointer = pointer->pointer;
if(pointer)
{
ptrType->type = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), ((struct Type *)__ecereTemp1)->refCount = 1, ((struct Type *)__ecereTemp1));
ptrType = ptrType->type;
}
}
ptrType->type = ProcessType(specs, decl->declarator);
if(type->type->classObjectType)
{
struct Type * subType = type->type;

type->classObjectType = subType->classObjectType;
type->kind = subType->kind;
type->_class = subType->_class;
type->byReference = 0x1;
FreeType(subType);
}
id = GetDeclId(decl);
if(id)
type->name = __ecereNameSpace__ecere__sys__CopyString(id->string);
}
}
}
else if(decl && decl->type == 3)
{
struct Identifier * id;

type->kind = 12;
type->arraySizeExp = CopyExpression(decl->array.exp);
type->freeExp = 0x1;
if(decl->array.enumClass)
type->enumClass = decl->array.enumClass->symbol;
id = GetDeclId(decl);
if(decl->declarator && decl->declarator->type == 3)
{
struct Type * tmpType = type;
struct Type * inType;

type = ProcessType(specs, decl->declarator);
inType = type->type;
type->type = tmpType;
tmpType->type = inType;
}
else
type->type = ProcessType(specs, decl->declarator);
if(id)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(type->name), type->name = 0);
type->name = __ecereNameSpace__ecere__sys__CopyString(id->string);
}
}
else
{
if(!decl || decl->type == 1)
{
*type = *specType;
(__ecereNameSpace__ecere__com__eSystem_Delete(type->name), type->name = 0);
type->name = decl ? __ecereNameSpace__ecere__sys__CopyString(decl->identifier->string) : (((void *)0));
}
}
((specType ? (__ecereClass_Type->Destructor ? __ecereClass_Type->Destructor(specType) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(specType)) : 0), specType = 0);
}
return type;
}

extern struct Declarator * SpecDeclFromString(char *  string, struct __ecereNameSpace__ecere__sys__OldList *  specs, struct Declarator * baseDecl);

extern void FreeDeclarator(struct Declarator * decl);

struct Type * ProcessTypeString(char * string, unsigned int staticMethod)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl = SpecDeclFromString(string, specs, (((void *)0)));
struct Type * type = ProcessType(specs, decl);

if(type && !type->thisClass && staticMethod)
type->staticMethod = 0x1;
FreeList(specs, FreeSpecifier);
if(decl)
FreeDeclarator(decl);
return type;
}

struct Type * MkClassTypeSymbol(struct Symbol * symbol)
{
if(symbol)
{
struct Type * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), type->kind = 8, type->_class = symbol, type);

if(!type->_class)
{
type->kind = 3;
}
type->refCount = 1;
return type;
}
return (((void *)0));
}

struct Type * MkClassType(char * name)
{
if(name)
{
struct Type * type = (type = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), type->kind = 8, type->_class = FindClass(name), type);

if(!type->_class)
{
type->kind = 3;
}
type->refCount = 1;
return type;
}
return (((void *)0));
}

struct AsmField * MkAsmField(char * command, struct Expression * expression)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_AsmField), ((struct AsmField *)__ecereTemp1)->command = command, ((struct AsmField *)__ecereTemp1)->expression = expression, ((struct AsmField *)__ecereTemp1));
}

struct Statement * MkAsmStmt(struct Specifier * spec, char * statements, struct __ecereNameSpace__ecere__sys__OldList * inputFields, struct __ecereNameSpace__ecere__sys__OldList * outputFields, struct __ecereNameSpace__ecere__sys__OldList * clobberedFields)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 13, ((struct Statement *)__ecereTemp1)->asmStmt.spec = spec, ((struct Statement *)__ecereTemp1)->asmStmt.statements = statements, ((struct Statement *)__ecereTemp1)->asmStmt.inputFields = inputFields, ((struct Statement *)__ecereTemp1)->asmStmt.outputFields = outputFields, ((struct Statement *)__ecereTemp1)->asmStmt.clobberedFields = clobberedFields, ((struct Statement *)__ecereTemp1));
}

struct ClassDef * MkClassDefPropertyWatch(struct PropertyWatch * watcher)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassDef), ((struct ClassDef *)__ecereTemp1)->type = 4, ((struct ClassDef *)__ecereTemp1)->propertyWatch = watcher, ((struct ClassDef *)__ecereTemp1));
}

struct Statement * MkFireWatchersStmt(struct Expression * object, struct __ecereNameSpace__ecere__sys__OldList * watches)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 15, ((struct Statement *)__ecereTemp1)->_watch.object = object, ((struct Statement *)__ecereTemp1)->_watch.watches = watches, ((struct Statement *)__ecereTemp1));
}

struct Statement * MkStopWatchingStmt(struct Expression * watcher, struct Expression * object, struct __ecereNameSpace__ecere__sys__OldList * watches)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 16, ((struct Statement *)__ecereTemp1)->_watch.watcher = watcher, ((struct Statement *)__ecereTemp1)->_watch.object = object, ((struct Statement *)__ecereTemp1)->_watch.watches = watches, ((struct Statement *)__ecereTemp1));
}

struct Statement * MkWatchStmt(struct Expression * watcher, struct Expression * object, struct __ecereNameSpace__ecere__sys__OldList * watches)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Statement), ((struct Statement *)__ecereTemp1)->type = 17, ((struct Statement *)__ecereTemp1)->_watch.watcher = watcher, ((struct Statement *)__ecereTemp1)->_watch.object = object, ((struct Statement *)__ecereTemp1)->_watch.watches = watches, ((struct Statement *)__ecereTemp1));
}

struct PropertyWatch * MkDeleteWatch(struct Statement * compound)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_PropertyWatch), ((struct PropertyWatch *)__ecereTemp1)->compound = compound, ((struct PropertyWatch *)__ecereTemp1)->deleteWatch = 0x1, ((struct PropertyWatch *)__ecereTemp1));
}

struct PropertyWatch * MkPropertyWatch(struct __ecereNameSpace__ecere__sys__OldList * properties, struct Statement * compound)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_PropertyWatch), ((struct PropertyWatch *)__ecereTemp1)->compound = compound, ((struct PropertyWatch *)__ecereTemp1)->properties = properties, ((struct PropertyWatch *)__ecereTemp1));
}

struct Expression * MkExpClass(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct Declarator * decl)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 26, ((struct Expression *)__ecereTemp1)->_classExp.specifiers = specifiers, ((struct Expression *)__ecereTemp1)->_classExp.decl = decl, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpClassData(struct Identifier * id)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 27, ((struct Expression *)__ecereTemp1)->classData.id = id, ((struct Expression *)__ecereTemp1));
}

struct External * MkExternalDBTable(struct DBTableDef * table)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_External), ((struct External *)__ecereTemp1)->type = 5, ((struct External *)__ecereTemp1)->table = table, ((struct External *)__ecereTemp1));
}

struct DBTableDef * MkDBTableDef(char * name, struct Symbol * symbol, struct __ecereNameSpace__ecere__sys__OldList * definitions)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_DBTableDef), ((struct DBTableDef *)__ecereTemp1)->name = name, ((struct DBTableDef *)__ecereTemp1)->symbol = symbol, ((struct DBTableDef *)__ecereTemp1)->definitions = definitions, ((struct DBTableDef *)__ecereTemp1));
}

struct DBTableEntry * MkDBFieldEntry(struct TypeName * type, struct Identifier * id, char * name)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_DBTableEntry), ((struct DBTableEntry *)__ecereTemp1)->type = 0, ((struct DBTableEntry *)__ecereTemp1)->dataType = type, ((struct DBTableEntry *)__ecereTemp1)->id = id, ((struct DBTableEntry *)__ecereTemp1)->name = name, ((struct DBTableEntry *)__ecereTemp1));
}

struct DBIndexItem * MkDBIndexItem(struct Identifier * id, int order)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_DBIndexItem), ((struct DBIndexItem *)__ecereTemp1)->id = id, ((struct DBIndexItem *)__ecereTemp1)->order = order, ((struct DBIndexItem *)__ecereTemp1));
}

struct DBTableEntry * MkDBIndexEntry(struct __ecereNameSpace__ecere__sys__OldList * items, struct Identifier * id)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_DBTableEntry), ((struct DBTableEntry *)__ecereTemp1)->type = 1, ((struct DBTableEntry *)__ecereTemp1)->items = items, ((struct DBTableEntry *)__ecereTemp1)->id = id, ((struct DBTableEntry *)__ecereTemp1));
}

struct Expression * MkExpDBOpen(struct Expression * ds, struct Expression * dbName)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 30, ((struct Expression *)__ecereTemp1)->dbopen.ds = ds, ((struct Expression *)__ecereTemp1)->dbopen.name = dbName, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpDBField(char * table, struct Identifier * id)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 31, ((struct Expression *)__ecereTemp1)->db.table = table, ((struct Expression *)__ecereTemp1)->db.id = id, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpDBIndex(char * table, struct Identifier * id)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 33, ((struct Expression *)__ecereTemp1)->db.table = table, ((struct Expression *)__ecereTemp1)->db.id = id, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpDBTable(char * table)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 32, ((struct Expression *)__ecereTemp1)->db.table = table, ((struct Expression *)__ecereTemp1));
}

struct Expression * MkExpArray(struct __ecereNameSpace__ecere__sys__OldList * expressions)
{
void * __ecereTemp1;

return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression), ((struct Expression *)__ecereTemp1)->type = 37, ((struct Expression *)__ecereTemp1)->list = expressions, ((struct Expression *)__ecereTemp1));
}

extern struct External * curExternal;

extern void FullClassNameCat(char *  output, char *  className, unsigned int includeTemplateParams);

extern void MangleClassName(char *  className);

extern void DeclareClass(struct Symbol * classSym, char *  className);

struct Expression * GetTemplateArgExpByName(char * paramName, struct __ecereNameSpace__ecere__com__Class * curClass, int tplType)
{
struct Expression * argExp = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * _class = curClass ? curClass : ((curExternal && curExternal->type == 0 && curExternal->function) ? curExternal->function->_class : (((void *)0)));

if(_class)
{
int id = 0;
struct __ecereNameSpace__ecere__com__ClassTemplateParameter * curParam;
struct __ecereNameSpace__ecere__com__Class * sClass;

for(sClass = _class; sClass; sClass = sClass->base)
{
id = 0;
for(curParam = sClass->templateParams.first; curParam; curParam = curParam->next)
{
if(!strcmp(curParam->name, paramName))
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
if(curParam && curParam->type != tplType)
curParam = (((void *)0));
if(curParam)
{
char idString[32];
char className[1024];
struct Expression * classExp;

sprintf(idString, "%d", id);
strcpy(className, "__ecereClass_");
FullClassNameCat(className, _class->fullName, 0x1);
MangleClassName(className);
DeclareClass(FindClass(_class->fullName), className);
argExp = MkExpIndex((MkExpMember)(MkExpMember(MkExpIdentifier(MkIdentifier("this")), MkIdentifier("_class")), MkIdentifier("templateArgs")), MkListOne(MkExpConstant(idString)));
}
}
return argExp;
}

struct Expression * GetTemplateArgExp(struct TemplateParameter * param, struct __ecereNameSpace__ecere__com__Class * curClass, unsigned int pointer)
{
return param->identifier ? GetTemplateArgExpByName(param->identifier->string, curClass, 0) : (((void *)0));
}

extern char *  GetSourceFile(void);

extern char *  GetOutputFile(void);

extern char *  __ecereNameSpace__ecere__sys__ChangeExtension(char *  string, char *  ext, char *  output);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpen(char *  fileName, int mode);

extern char *  __ecereNameSpace__ecere__sys__GetSlashPathBuffer(char *  d, char *  p);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__MapIterator;

struct __ecereNameSpace__ecere__com__MapIterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Iterator;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__CustomAVLTree;

struct __ecereNameSpace__ecere__com__CustomAVLTree
{
struct __ecereNameSpace__ecere__com__AVLNode * root;
int count;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_map(struct __ecereNameSpace__ecere__com__MapIterator * this);

void __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(struct __ecereNameSpace__ecere__com__MapIterator * this, struct __ecereNameSpace__ecere__com__Instance * value);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__com__MapIterator_map;

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Next();

uint64 __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_key(struct __ecereNameSpace__ecere__com__MapIterator * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__com__MapIterator_key;

int __ecereMethod___ecereNameSpace__ecere__sys__File_Printf(struct __ecereNameSpace__ecere__com__Instance * this, char *  format, ...);

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Free;

void OutputIntlStrings()
{
if(((struct __ecereNameSpace__ecere__com__CustomAVLTree *)(((char *)intlStrings + 12)))->count)
{
char * srcFile = GetSourceFile();
char * objFile = GetOutputFile();
char srcFileFixed[797];
char potFile[797];
struct __ecereNameSpace__ecere__com__Instance * f;

__ecereNameSpace__ecere__sys__ChangeExtension(objFile, "bowl", potFile);
f = __ecereNameSpace__ecere__sys__FileOpen(potFile, 2);
if(f)
{
char * filePrefix = "";

if(!(srcFile[0] && (srcFile[1] == ':' || srcFile[0] == '/')))
filePrefix = "./";
__ecereNameSpace__ecere__sys__GetSlashPathBuffer(srcFileFixed, srcFile);
{
struct __ecereNameSpace__ecere__com__MapIterator s = (s.container = (void *)0, s.pointer = (void *)0, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(&s, (intlStrings)), s);

while(__ecereMethod___ecereNameSpace__ecere__com__Iterator_Next(&s))
{
struct ContextStringPair pair = (*(struct ContextStringPair *)__ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_key(&s));

{
struct __ecereNameSpace__ecere__com__Iterator l = 
{
((struct __ecereNameSpace__ecere__com__Instance *)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&s)), 0
};

while(__ecereMethod___ecereNameSpace__ecere__com__Iterator_Next(&l))
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "#: %s%s:%d\n", filePrefix, srcFileFixed, (*(struct Location *)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&l)).start.line);
}
if(pair.context)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "msgctxt \"%s\"\n", pair.context);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "msgid \"%s\"\n", pair.string);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "msgstr \"%s\"\n\n", pair.string);
}
}
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}
((void (*)(struct __ecereNameSpace__ecere__com__Instance *))intlStrings->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Free])(intlStrings);
}
}

extern int yyparse();

void SetAST(struct __ecereNameSpace__ecere__sys__OldList * list)
{
ast = list;
}

struct __ecereNameSpace__ecere__sys__OldList * GetAST()
{
return ast;
}

void ParseEc()
{
yyparse();
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, char *  name, char *  baseName, int size, int sizeClass, unsigned int (* )(void * ), void (* )(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

void __ecereRegisterModule_ast(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetDefaultNameSpace", "void SetDefaultNameSpace(char * s)", SetDefaultNameSpace, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetStrictNameSpaces", "void SetStrictNameSpaces(bool b)", SetStrictNameSpaces, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetDeclMode", "void SetDeclMode(ecere::com::AccessMode accessMode)", SetDeclMode, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetDefaultDeclMode", "void SetDefaultDeclMode(ecere::com::AccessMode accessMode)", SetDefaultDeclMode, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetCurrentNameSpace", "void SetCurrentNameSpace(char * s)", SetCurrentNameSpace, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkList", "ecere::sys::OldList * MkList(void)", MkList, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkListOne", "ecere::sys::OldList * MkListOne(void * item)", MkListOne, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ListAdd", "void ListAdd(ecere::sys::OldList list, void * item)", ListAdd, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ListAddFront", "void ListAddFront(ecere::sys::OldList list, void * item)", ListAddFront, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkIdentifier", "Identifier MkIdentifier(char * string)", MkIdentifier, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkTypeTemplateParameter", "TemplateParameter MkTypeTemplateParameter(Identifier identifier, TemplateDatatype baseTplDatatype, TemplateArgument defaultArgument)", MkTypeTemplateParameter, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkIdentifierTemplateParameter", "TemplateParameter MkIdentifierTemplateParameter(Identifier identifier, ecere::com::TemplateMemberType memberType, TemplateArgument defaultArgument)", MkIdentifierTemplateParameter, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpressionTemplateParameter", "TemplateParameter MkExpressionTemplateParameter(Identifier identifier, TemplateDatatype dataType, TemplateArgument defaultArgument)", MkExpressionTemplateParameter, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkTemplateDatatype", "TemplateDatatype MkTemplateDatatype(ecere::sys::OldList * specifiers, Declarator decl)", MkTemplateDatatype, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkTemplateTypeArgument", "TemplateArgument MkTemplateTypeArgument(TemplateDatatype tplDatatype)", MkTemplateTypeArgument, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkTemplateExpressionArgument", "TemplateArgument MkTemplateExpressionArgument(Expression expr)", MkTemplateExpressionArgument, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkTemplateIdentifierArgument", "TemplateArgument MkTemplateIdentifierArgument(Identifier ident)", MkTemplateIdentifierArgument, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpExtensionCompound", "Expression MkExpExtensionCompound(Statement compound)", MkExpExtensionCompound, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpExtensionExpression", "Expression MkExpExtensionExpression(ecere::sys::OldList * expressions)", MkExpExtensionExpression, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpExtensionInitializer", "Expression MkExpExtensionInitializer(TypeName typeName, Initializer initializer)", MkExpExtensionInitializer, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpIdentifier", "Expression MkExpIdentifier(Identifier id)", MkExpIdentifier, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpDummy", "Expression MkExpDummy(void)", MkExpDummy, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpConstant", "Expression MkExpConstant(char * string)", MkExpConstant, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpString", "Expression MkExpString(char * string)", MkExpString, module, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "ContextStringPair", 0, sizeof(struct ContextStringPair), 0, 0, 0, module, 1, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass_ContextStringPair = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnCompare", 0, __ecereMethod_ContextStringPair_OnCompare, 1);
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "OnFree", 0, __ecereMethod_ContextStringPair_OnFree, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "string", "String", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "context", "String", 4, 4, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpIntlString", "Expression MkExpIntlString(char * string, char * context)", MkExpIntlString, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpOp", "Expression MkExpOp(Expression exp1, int op, Expression exp2)", MkExpOp, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpBrackets", "Expression MkExpBrackets(ecere::sys::OldList expressions)", MkExpBrackets, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpIndex", "Expression MkExpIndex(Expression expression, ecere::sys::OldList index)", MkExpIndex, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpCall", "Expression MkExpCall(Expression expression, ecere::sys::OldList arguments)", MkExpCall, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpMember", "Expression MkExpMember(Expression expression, Identifier member)", MkExpMember, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpPointer", "Expression MkExpPointer(Expression expression, Identifier member)", MkExpPointer, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpTypeSize", "Expression MkExpTypeSize(TypeName typeName)", MkExpTypeSize, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpTypeAlign", "Expression MkExpTypeAlign(TypeName typeName)", MkExpTypeAlign, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpClassSize", "Expression MkExpClassSize(Specifier _class)", MkExpClassSize, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpCast", "Expression MkExpCast(TypeName typeName, Expression expression)", MkExpCast, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpCondition", "Expression MkExpCondition(Expression cond, ecere::sys::OldList expressions, Expression elseExp)", MkExpCondition, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpRenew", "Expression MkExpRenew(Expression memExp, TypeName type, Expression size)", MkExpRenew, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpRenew0", "Expression MkExpRenew0(Expression memExp, TypeName type, Expression size)", MkExpRenew0, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpNew", "Expression MkExpNew(TypeName type, Expression size)", MkExpNew, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpNew0", "Expression MkExpNew0(TypeName type, Expression size)", MkExpNew0, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpVaArg", "Expression MkExpVaArg(Expression exp, TypeName type)", MkExpVaArg, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkSpecifier", "Specifier MkSpecifier(int specifier)", MkSpecifier, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkSpecifierTypeOf", "Specifier MkSpecifierTypeOf(Expression expression)", MkSpecifierTypeOf, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkSpecifierSubClass", "Specifier MkSpecifierSubClass(Specifier _class)", MkSpecifierSubClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkSpecifierExtended", "Specifier MkSpecifierExtended(ExtDecl extDecl)", MkSpecifierExtended, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkEnum", "Specifier MkEnum(Identifier id, ecere::sys::OldList list)", MkEnum, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkStructOrUnion", "Specifier MkStructOrUnion(SpecifierType type, Identifier id, ecere::sys::OldList definitions)", MkStructOrUnion, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("AddStructDefinitions", "void AddStructDefinitions(Specifier spec, ecere::sys::OldList definitions)", AddStructDefinitions, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkAttribute", "Attribute MkAttribute(String attr, Expression exp)", MkAttribute, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkAttrib", "Attrib MkAttrib(int type, ecere::sys::OldList * attribs)", MkAttrib, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExtDeclString", "ExtDecl MkExtDeclString(String s)", MkExtDeclString, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExtDeclAttrib", "ExtDecl MkExtDeclAttrib(Attrib attr)", MkExtDeclAttrib, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaratorIdentifier", "Declarator MkDeclaratorIdentifier(Identifier id)", MkDeclaratorIdentifier, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaratorFunction", "Declarator MkDeclaratorFunction(Declarator declarator, ecere::sys::OldList parameters)", MkDeclaratorFunction, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaratorExtended", "Declarator MkDeclaratorExtended(ExtDecl extended, Declarator declarator)", MkDeclaratorExtended, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaratorExtendedEnd", "Declarator MkDeclaratorExtendedEnd(ExtDecl extended, Declarator declarator)", MkDeclaratorExtendedEnd, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkStructDeclarator", "Declarator MkStructDeclarator(Declarator declarator, Expression exp)", MkStructDeclarator, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaratorBrackets", "Declarator MkDeclaratorBrackets(Declarator declarator)", MkDeclaratorBrackets, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaratorArray", "Declarator MkDeclaratorArray(Declarator declarator, Expression exp)", MkDeclaratorArray, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaratorEnumArray", "Declarator MkDeclaratorEnumArray(Declarator declarator, Specifier _class)", MkDeclaratorEnumArray, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaratorPointer", "Declarator MkDeclaratorPointer(Pointer pointer, Declarator declarator)", MkDeclaratorPointer, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkEnumerator", "Enumerator MkEnumerator(Identifier id, Expression exp)", MkEnumerator, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkPointer", "Pointer MkPointer(ecere::sys::OldList qualifiers, Pointer pointer)", MkPointer, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkInitializerAssignment", "Initializer MkInitializerAssignment(Expression exp)", MkInitializerAssignment, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkInitializerList", "Initializer MkInitializerList(ecere::sys::OldList list)", MkInitializerList, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkInitDeclarator", "InitDeclarator MkInitDeclarator(Declarator declarator, Initializer initializer)", MkInitDeclarator, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkTypeName", "TypeName MkTypeName(ecere::sys::OldList qualifiers, Declarator declarator)", MkTypeName, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetDeclId", "Identifier GetDeclId(Declarator decl)", GetDeclId, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclarationClassInst", "Declaration MkDeclarationClassInst(Instantiation inst)", MkDeclarationClassInst, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclarationInst", "Declaration MkDeclarationInst(Instantiation inst)", MkDeclarationInst, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclarationDefine", "Declaration MkDeclarationDefine(Identifier id, Expression exp)", MkDeclarationDefine, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeclaration", "Declaration MkDeclaration(ecere::sys::OldList specifiers, ecere::sys::OldList initDeclarators)", MkDeclaration, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkStructDeclaration", "Declaration MkStructDeclaration(ecere::sys::OldList specifiers, ecere::sys::OldList declarators, Specifier extStorage)", MkStructDeclaration, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkLabeledStmt", "Statement MkLabeledStmt(Identifier id, Statement statement)", MkLabeledStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkCaseStmt", "Statement MkCaseStmt(Expression exp, Statement statement)", MkCaseStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkCompoundStmt", "Statement MkCompoundStmt(ecere::sys::OldList declarations, ecere::sys::OldList statements)", MkCompoundStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpressionStmt", "Statement MkExpressionStmt(ecere::sys::OldList expressions)", MkExpressionStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkBadDeclStmt", "Statement MkBadDeclStmt(Declaration decl)", MkBadDeclStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkIfStmt", "Statement MkIfStmt(ecere::sys::OldList exp, Statement statement, Statement elseStmt)", MkIfStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkSwitchStmt", "Statement MkSwitchStmt(ecere::sys::OldList exp, Statement statement)", MkSwitchStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkWhileStmt", "Statement MkWhileStmt(ecere::sys::OldList exp, Statement statement)", MkWhileStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDoWhileStmt", "Statement MkDoWhileStmt(Statement statement, ecere::sys::OldList exp)", MkDoWhileStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkForStmt", "Statement MkForStmt(Statement init, Statement check, ecere::sys::OldList inc, Statement statement)", MkForStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkForEachStmt", "Statement MkForEachStmt(Identifier id, ecere::sys::OldList exp, ecere::sys::OldList filter, Statement statement)", MkForEachStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkGotoStmt", "Statement MkGotoStmt(Identifier id)", MkGotoStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkContinueStmt", "Statement MkContinueStmt(void)", MkContinueStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkBreakStmt", "Statement MkBreakStmt(void)", MkBreakStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkReturnStmt", "Statement MkReturnStmt(ecere::sys::OldList exp)", MkReturnStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkFunction", "FunctionDefinition MkFunction(ecere::sys::OldList specifiers, Declarator declarator, ecere::sys::OldList declarationList)", MkFunction, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessFunctionBody", "void ProcessFunctionBody(FunctionDefinition func, Statement body)", ProcessFunctionBody, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExternalFunction", "External MkExternalFunction(FunctionDefinition function)", MkExternalFunction, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExternalImport", "External MkExternalImport(char * name, ecere::com::ImportType importType, ecere::com::AccessMode importAccess)", MkExternalImport, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExternalDeclaration", "External MkExternalDeclaration(Declaration declaration)", MkExternalDeclaration, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExternalNameSpace", "External MkExternalNameSpace(Identifier identifier)", MkExternalNameSpace, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetClassTemplateArgs", "void SetClassTemplateArgs(Specifier spec, ecere::sys::OldList templateArgs)", SetClassTemplateArgs, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("_MkSpecifierName", "Specifier _MkSpecifierName(char * name, Symbol symbol, ecere::sys::OldList templateArgs)", _MkSpecifierName, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkSpecifierName", "Specifier MkSpecifierName(char * name)", MkSpecifierName, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkSpecifierNameArgs", "Specifier MkSpecifierNameArgs(char * name, ecere::sys::OldList * templateArgs)", MkSpecifierNameArgs, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassFunction", "ClassFunction MkClassFunction(ecere::sys::OldList specifiers, Specifier _class, Declarator decl, ecere::sys::OldList declList)", MkClassFunction, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessClassFunctionBody", "void ProcessClassFunctionBody(ClassFunction func, Statement body)", ProcessClassFunctionBody, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkSpecsClass", "ecere::sys::OldList * MkSpecsClass(Specifier _class)", MkSpecsClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkMemberInit", "MemberInit MkMemberInit(ecere::sys::OldList ids, Initializer initializer)", MkMemberInit, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkMemberInitExp", "MemberInit MkMemberInitExp(Expression idExp, Initializer initializer)", MkMemberInitExp, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkMembersInitList", "MembersInit MkMembersInitList(ecere::sys::OldList dataMembers)", MkMembersInitList, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkMembersInitMethod", "MembersInit MkMembersInitMethod(ClassFunction function)", MkMembersInitMethod, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkInstantiation", "Instantiation MkInstantiation(Specifier _class, Expression exp, ecere::sys::OldList members)", MkInstantiation, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkInstantiationNamed", "Instantiation MkInstantiationNamed(ecere::sys::OldList specs, Expression exp, ecere::sys::OldList members)", MkInstantiationNamed, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefAccessOverride", "ClassDef MkClassDefAccessOverride(ecere::com::AccessMode access, Identifier id)", MkClassDefAccessOverride, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefMemberAccess", "ClassDef MkClassDefMemberAccess(void)", MkClassDefMemberAccess, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefDeclaration", "ClassDef MkClassDefDeclaration(Declaration decl)", MkClassDefDeclaration, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefClassData", "ClassDef MkClassDefClassData(Declaration decl)", MkClassDefClassData, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefDesigner", "ClassDef MkClassDefDesigner(char * designer)", MkClassDefDesigner, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefNoExpansion", "ClassDef MkClassDefNoExpansion(void)", MkClassDefNoExpansion, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefFixed", "ClassDef MkClassDefFixed(void)", MkClassDefFixed, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefDesignerDefaultProperty", "ClassDef MkClassDefDesignerDefaultProperty(Identifier id)", MkClassDefDesignerDefaultProperty, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefDefaultProperty", "ClassDef MkClassDefDefaultProperty(ecere::sys::OldList defProperties)", MkClassDefDefaultProperty, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefFunction", "ClassDef MkClassDefFunction(ClassFunction function)", MkClassDefFunction, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclClassAddNameSpace", "Symbol DeclClassAddNameSpace(int symbolID, char * className)", DeclClassAddNameSpace, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DeclClass", "Symbol DeclClass(int symbolID, char * name)", DeclClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("_DeclClass", "Symbol _DeclClass(int symbolID, char * name)", _DeclClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetupBaseSpecs", "void SetupBaseSpecs(Symbol symbol, ecere::sys::OldList baseSpecs)", SetupBaseSpecs, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClass", "ClassDefinition MkClass(Symbol symbol, ecere::sys::OldList baseSpecs, ecere::sys::OldList definitions)", MkClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpInstance", "Expression MkExpInstance(Instantiation inst)", MkExpInstance, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExternalClass", "External MkExternalClass(ClassDefinition _class)", MkExternalClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkProperty", "PropertyDef MkProperty(ecere::sys::OldList specs, Declarator decl, Identifier id, Statement setStmt, Statement getStmt)", MkProperty, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefProperty", "ClassDef MkClassDefProperty(PropertyDef propertyDef)", MkClassDefProperty, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefClassProperty", "ClassDef MkClassDefClassProperty(PropertyDef propertyDef)", MkClassDefClassProperty, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefClassPropertyValue", "ClassDef MkClassDefClassPropertyValue(Identifier id, Initializer initializer)", MkClassDefClassPropertyValue, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CheckType", "int CheckType(char * text)", CheckType, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("check_type", "int check_type(void)", check_type, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PushContext", "Context PushContext(void)", PushContext, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PopContext", "void PopContext(Context ctx)", PopContext, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FindType", "Symbol FindType(Context ctx, char * name)", FindType, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FindTemplateTypeParameter", "TemplatedType FindTemplateTypeParameter(Context ctx, char * name)", FindTemplateTypeParameter, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ModuleAccess", "bool ModuleAccess(ecere::com::Module searchIn, ecere::com::Module searchFor)", ModuleAccess, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FindModule", "ModuleImport FindModule(ecere::com::Module moduleToFind)", FindModule, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FindClass", "Symbol FindClass(char * name)", FindClass, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CopyTypeInto", "void CopyTypeInto(Type type, Type src)", CopyTypeInto, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessType", "Type ProcessType(ecere::sys::OldList specs, Declarator decl)", ProcessType, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessTypeString", "Type ProcessTypeString(char * string, bool staticMethod)", ProcessTypeString, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassTypeSymbol", "Type MkClassTypeSymbol(Symbol symbol)", MkClassTypeSymbol, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassType", "Type MkClassType(char * name)", MkClassType, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkAsmField", "AsmField MkAsmField(char * command, Expression expression)", MkAsmField, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkAsmStmt", "Statement MkAsmStmt(Specifier spec, char * statements, ecere::sys::OldList inputFields, ecere::sys::OldList outputFields, ecere::sys::OldList clobberedFields)", MkAsmStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkClassDefPropertyWatch", "ClassDef MkClassDefPropertyWatch(PropertyWatch watcher)", MkClassDefPropertyWatch, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkFireWatchersStmt", "Statement MkFireWatchersStmt(Expression object, ecere::sys::OldList watches)", MkFireWatchersStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkStopWatchingStmt", "Statement MkStopWatchingStmt(Expression watcher, Expression object, ecere::sys::OldList watches)", MkStopWatchingStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkWatchStmt", "Statement MkWatchStmt(Expression watcher, Expression object, ecere::sys::OldList watches)", MkWatchStmt, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDeleteWatch", "PropertyWatch MkDeleteWatch(Statement compound)", MkDeleteWatch, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkPropertyWatch", "PropertyWatch MkPropertyWatch(ecere::sys::OldList properties, Statement compound)", MkPropertyWatch, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpClass", "Expression MkExpClass(ecere::sys::OldList * specifiers, Declarator decl)", MkExpClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpClassData", "Expression MkExpClassData(Identifier id)", MkExpClassData, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExternalDBTable", "External MkExternalDBTable(DBTableDef table)", MkExternalDBTable, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDBTableDef", "DBTableDef MkDBTableDef(char * name, Symbol symbol, ecere::sys::OldList * definitions)", MkDBTableDef, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDBFieldEntry", "DBTableEntry MkDBFieldEntry(TypeName type, Identifier id, char * name)", MkDBFieldEntry, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDBIndexItem", "DBIndexItem MkDBIndexItem(Identifier id, Order order)", MkDBIndexItem, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkDBIndexEntry", "DBTableEntry MkDBIndexEntry(ecere::sys::OldList * items, Identifier id)", MkDBIndexEntry, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpDBOpen", "Expression MkExpDBOpen(Expression ds, Expression dbName)", MkExpDBOpen, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpDBField", "Expression MkExpDBField(char * table, Identifier id)", MkExpDBField, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpDBIndex", "Expression MkExpDBIndex(char * table, Identifier id)", MkExpDBIndex, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpDBTable", "Expression MkExpDBTable(char * table)", MkExpDBTable, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MkExpArray", "Expression MkExpArray(ecere::sys::OldList * expressions)", MkExpArray, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetTemplateArgExpByName", "Expression GetTemplateArgExpByName(char * paramName, ecere::com::Class curClass, ecere::com::TemplateParameterType tplType)", GetTemplateArgExpByName, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetTemplateArgExp", "Expression GetTemplateArgExp(TemplateParameter param, ecere::com::Class curClass, bool pointer)", GetTemplateArgExp, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("OutputIntlStrings", "void OutputIntlStrings(void)", OutputIntlStrings, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetAST", "void SetAST(ecere::sys::OldList * list)", SetAST, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetAST", "ecere::sys::OldList * GetAST(void)", GetAST, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ParseEc", "void ParseEc(void)", ParseEc, module, 1);
}

void __ecereUnregisterModule_ast(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map_TPL_ContextStringPair__ecere__com__List_TPL_Location___;

void __ecereCreateModuleInstances_ast()
{
intlStrings = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__Map_TPL_ContextStringPair__ecere__com__List_TPL_Location___);
__ecereNameSpace__ecere__com__eInstance_IncRef(intlStrings);
}

void __ecereDestroyModuleInstances_ast()
{
(__ecereNameSpace__ecere__com__eInstance_DecRef(intlStrings), intlStrings = 0);
}

