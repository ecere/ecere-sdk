/* Code generated from eC source file: pass2.ec */
#if defined(_WIN32)
#define __runtimePlatform 1
#elif defined(__APPLE__)
#define __runtimePlatform 3
#else
#define __runtimePlatform 2
#endif
#if defined(__GNUC__)
typedef long long int64;
typedef unsigned long long uint64;
#ifndef _WIN32
#define __declspec(x)
#endif
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
#include <sys/types.h>
struct __ecereNameSpace__ecere__com__Instance;

extern void *  __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew(void *  memory, unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew0(void *  memory, unsigned int size);

extern void __ecereNameSpace__ecere__com__eSystem_Delete(void *  memory);

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
const char *  name;
struct __ecereNameSpace__ecere__com__Method * parent;
struct __ecereNameSpace__ecere__com__Method * left;
struct __ecereNameSpace__ecere__com__Method * right;
int depth;
int (*  function)();
int vid;
int type;
struct __ecereNameSpace__ecere__com__Class * _class;
void *  symbol;
const char *  dataTypeString;
struct Type * dataType;
int memberAccess;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Property;

struct __ecereNameSpace__ecere__com__Property
{
struct __ecereNameSpace__ecere__com__Property * prev;
struct __ecereNameSpace__ecere__com__Property * next;
const char *  name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
const char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
struct Type * dataType;
void (*  Set)(void * , int);
int (*  Get)(void * );
unsigned int (*  IsSet)(void * );
void *  data;
void *  symbol;
int vid;
unsigned int conversion;
unsigned int watcherOffset;
const char *  category;
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
int included;
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
} __attribute__ ((gcc_struct)) __anon1;
struct Instantiation * inst;
struct
{
struct Identifier * id;
struct Expression * exp;
} __attribute__ ((gcc_struct)) __anon2;
} __attribute__ ((gcc_struct)) __anon1;
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
} __attribute__ ((gcc_struct)) __anon1;
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
} __attribute__ ((gcc_struct)) __anon1;
unsigned int isConstant;
struct Identifier * id;
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
} __attribute__ ((gcc_struct)) __anon1;
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
} __attribute__ ((gcc_struct)) __anon1;
struct Statement * compound;
struct Instantiation * instance;
struct
{
char *  string;
unsigned int intlString;
} __attribute__ ((gcc_struct)) __anon2;
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
} __attribute__ ((gcc_struct)) __anon1;
unsigned int debugValue;
struct __ecereNameSpace__ecere__com__DataValue val;
uint64 address;
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
unsigned int opDestType;
unsigned int needTemplateCast;
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
} __attribute__ ((gcc_struct)) __anon1;
struct TemplateArgument * defaultArgument;
const char *  dataTypeString;
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
} __attribute__ ((gcc_struct)) __anon1;
struct
{
struct Identifier * id;
struct __ecereNameSpace__ecere__sys__OldList *  list;
struct __ecereNameSpace__ecere__sys__OldList *  baseSpecs;
struct __ecereNameSpace__ecere__sys__OldList *  definitions;
unsigned int addNameSpace;
struct Context * ctx;
struct ExtDecl * extDeclStruct;
} __attribute__ ((gcc_struct)) __anon2;
struct Expression * expression;
struct Specifier * _class;
struct TemplateParameter * templateParameter;
} __attribute__ ((gcc_struct)) __anon1;
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
} __attribute__ ((gcc_struct)) __anon1;
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
} __attribute__ ((gcc_struct)) __anon1;
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
} __attribute__ ((gcc_struct)) __anon1;
int id;
int idCode;
union
{
struct
{
struct External * pointerExternal;
struct External * structExternal;
} __attribute__ ((gcc_struct)) __anon1;
struct
{
struct External * externalGet;
struct External * externalSet;
struct External * externalPtr;
struct External * externalIsSet;
} __attribute__ ((gcc_struct)) __anon2;
struct
{
struct External * methodExternal;
struct External * methodCodeExternal;
} __attribute__ ((gcc_struct)) __anon3;
} __attribute__ ((gcc_struct)) __anon2;
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
} __attribute__ ((gcc_struct)) __anon1;
struct
{
struct Type * returnType;
struct __ecereNameSpace__ecere__sys__OldList params;
struct Symbol * thisClass;
unsigned int staticMethod;
struct TemplateParameter * thisClassTemplate;
} __attribute__ ((gcc_struct)) __anon2;
struct
{
struct __ecereNameSpace__ecere__com__Method * method;
struct __ecereNameSpace__ecere__com__Class * methodClass;
struct __ecereNameSpace__ecere__com__Class * usedClass;
} __attribute__ ((gcc_struct)) __anon3;
struct
{
struct Type * arrayType;
int arraySize;
struct Expression * arraySizeExp;
unsigned int freeExp;
struct Symbol * enumClass;
} __attribute__ ((gcc_struct)) __anon4;
struct Type * type;
struct TemplateParameter * templateParameter;
} __attribute__ ((gcc_struct)) __anon1;
int kind;
unsigned int size;
char *  name;
char *  typeName;
int classObjectType;
int alignment;
unsigned int offset;
int bitFieldCount;
int count;
unsigned int isSigned : 1;
unsigned int constant : 1;
unsigned int truth : 1;
unsigned int byReference : 1;
unsigned int extraParam : 1;
unsigned int directClassAccess : 1;
unsigned int computing : 1;
unsigned int keepCast : 1;
unsigned int passAsTemplate : 1;
unsigned int dllExport : 1;
unsigned int attrStdcall : 1;
unsigned int declaredWithStruct : 1;
unsigned int typedByReference : 1;
unsigned int casted : 1;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Class
{
struct __ecereNameSpace__ecere__com__Class * prev;
struct __ecereNameSpace__ecere__com__Class * next;
const char *  name;
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
const char *  dataTypeString;
struct Type * dataType;
int typeSize;
int defaultAlignment;
void (*  Initialize)();
int memberOffset;
struct __ecereNameSpace__ecere__sys__OldList selfWatchers;
const char *  designerClass;
unsigned int noExpansion;
const char *  defaultProperty;
unsigned int comRedefinition;
int count;
int isRemote;
unsigned int internalDecl;
void *  data;
unsigned int computeSize;
int structAlignment;
int destructionWatchOffset;
unsigned int fixed;
struct __ecereNameSpace__ecere__sys__OldList delayedCPValues;
int inheritanceAccess;
const char *  fullName;
void *  symbol;
struct __ecereNameSpace__ecere__sys__OldList conversions;
struct __ecereNameSpace__ecere__sys__OldList templateParams;
struct __ecereNameSpace__ecere__com__ClassTemplateArgument *  templateArgs;
struct __ecereNameSpace__ecere__com__Class * templateClass;
struct __ecereNameSpace__ecere__sys__OldList templatized;
int numParams;
unsigned int isInstanceClass;
unsigned int byValueSystemClass;
} __attribute__ ((gcc_struct));

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

extern void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

extern void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object);

extern void __ecereNameSpace__ecere__com__eInstance_Watch(void *  instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

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
const char *  name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
const char *  dataTypeString;
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
const char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
} __attribute__ ((gcc_struct)) __anon1;
struct __ecereNameSpace__ecere__com__DataValue expression;
struct
{
const char *  memberString;
union
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__Method * method;
} __attribute__ ((gcc_struct)) __anon1;
} __attribute__ ((gcc_struct)) __anon2;
} __attribute__ ((gcc_struct)) __anon1;
} __attribute__ ((gcc_struct));

enum yytokentype
{
IDENTIFIER = 258, CONSTANT = 259, STRING_LITERAL = 260, SIZEOF = 261, PTR_OP = 262, INC_OP = 263, DEC_OP = 264, LEFT_OP = 265, RIGHT_OP = 266, LE_OP = 267, GE_OP = 268, EQ_OP = 269, NE_OP = 270, AND_OP = 271, OR_OP = 272, MUL_ASSIGN = 273, DIV_ASSIGN = 274, MOD_ASSIGN = 275, ADD_ASSIGN = 276, SUB_ASSIGN = 277, LEFT_ASSIGN = 278, RIGHT_ASSIGN = 279, AND_ASSIGN = 280, XOR_ASSIGN = 281, OR_ASSIGN = 282, TYPE_NAME = 283, TYPEDEF = 284, EXTERN = 285, STATIC = 286, AUTO = 287, REGISTER = 288, CHAR = 289, SHORT = 290, INT = 291, UINT = 292, INT64 = 293, LONG = 294, SIGNED = 295, UNSIGNED = 296, FLOAT = 297, DOUBLE = 298, CONST = 299, VOLATILE = 300, VOID = 301, VALIST = 302, STRUCT = 303, UNION = 304, ENUM = 305, ELLIPSIS = 306, CASE = 307, DEFAULT = 308, IF = 309, SWITCH = 310, WHILE = 311, DO = 312, FOR = 313, GOTO = 314, CONTINUE = 315, BREAK = 316, RETURN = 317, IFX = 318, ELSE = 319, CLASS = 320, THISCLASS = 321, CLASS_NAME = 322, PROPERTY = 323, SETPROP = 324, GETPROP = 325, NEWOP = 326, RENEW = 327, DELETE = 328, EXT_DECL = 329, EXT_STORAGE = 330, IMPORT = 331, DEFINE = 332, VIRTUAL = 333, ATTRIB = 334, PUBLIC = 335, PRIVATE = 336, TYPED_OBJECT = 337, ANY_OBJECT = 338, _INCREF = 339, EXTENSION = 340, ASM = 341, TYPEOF = 342, WATCH = 343, STOPWATCHING = 344, FIREWATCHERS = 345, WATCHABLE = 346, CLASS_DESIGNER = 347, CLASS_NO_EXPANSION = 348, CLASS_FIXED = 349, ISPROPSET = 350, CLASS_DEFAULT_PROPERTY = 351, PROPERTY_CATEGORY = 352, CLASS_DATA = 353, CLASS_PROPERTY = 354, SUBCLASS = 355, NAMESPACE = 356, NEW0OP = 357, RENEW0 = 358, VAARG = 359, DBTABLE = 360, DBFIELD = 361, DBINDEX = 362, DATABASE_OPEN = 363, ALIGNOF = 364, ATTRIB_DEP = 365, __ATTRIB = 366, BOOL = 367, _BOOL = 368, _COMPLEX = 369, _IMAGINARY = 370, RESTRICT = 371, THREAD = 372
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
struct Identifier * symbolic;
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
} __attribute__ ((gcc_struct)) __anon1;
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
struct Expression * category;
struct
{
unsigned int conversion : 1;
unsigned int isWatchable : 1;
unsigned int isDBProp : 1;
} __attribute__ ((gcc_struct)) __anon1;
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
} __attribute__ ((gcc_struct)) __anon1;
} __attribute__ ((gcc_struct)) __anon1;
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

extern void FreeExpContents(struct Expression * exp);

extern void FreeExpression(struct Expression * exp);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

static void _FixRefExp(struct Expression ** expPtr, struct Expression ** memberExpPtr)
{
struct Expression * memberExp = *memberExpPtr;

if(memberExp && memberExp->type == 8 && memberExp->__anon1.member.exp && (memberExp->__anon1.member.exp->type == 5 || memberExp->__anon1.member.exp->type == 32))
{
struct Expression * bracketExp = memberExp->__anon1.member.exp;
struct Expression * idExp = (*bracketExp->__anon1.list).last;

if(idExp && idExp->type == 0)
{
struct Expression * newExp = (((void *)0));
struct Expression * exp = *expPtr;

*memberExpPtr = (((void *)0));
newExp = CopyExpression(exp);
FreeExpContents(exp);
*(struct Expression **)((unsigned char *)newExp + ((unsigned char *)memberExpPtr - (unsigned char *)exp)) = memberExp;
memberExp->__anon1.member.exp = idExp;
exp->type = 5;
exp->__anon1.list = bracketExp->__anon1.list;
bracketExp->__anon1.list = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*exp->__anon1.list), idExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*exp->__anon1.list), newExp);
FreeExpression(bracketExp);
*expPtr = exp;
}
}
else if(*expPtr && (*expPtr)->type == 4 && (*expPtr)->__anon1.op.op == '&' && !(*expPtr)->__anon1.op.exp1 && memberExp && (memberExp->type == 5 || memberExp->type == 32) && memberExp->__anon1.list && (*memberExp->__anon1.list).count > 1)
{
struct Expression * newExp = (((void *)0));
struct Expression * exp = *expPtr;

*memberExpPtr = (((void *)0));
newExp = CopyExpression(exp);
*(struct Expression **)((unsigned char *)newExp + ((unsigned char *)memberExpPtr - (unsigned char *)exp)) = (*memberExp->__anon1.list).last;
exp->type = 5;
exp->__anon1.list = memberExp->__anon1.list;
memberExp->__anon1.list = (((void *)0));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*exp->__anon1.list), (*exp->__anon1.list).last);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*exp->__anon1.list), newExp);
FreeExpression(memberExp);
*expPtr = newExp;
}
}

static struct Expression * FixRefExp(struct Expression * exp)
{
if(exp->type == 4)
{
_FixRefExp(&exp, &exp->__anon1.op.exp1);
_FixRefExp(&exp, &exp->__anon1.op.exp2);
}
else if(exp->type == 6)
_FixRefExp(&exp, &exp->__anon1.index.exp);
else if(exp->type == 8)
_FixRefExp(&exp, &exp->__anon1.member.exp);
return exp;
}

extern int strcmp(const char * , const char * );

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

static struct Expression * FixReference(struct Expression * e, unsigned int wantReference)
{
if(e->expType && e->type != 2)
{
struct Type * type = e->expType;
unsigned int isPointer = 0;

if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = type->__anon1._class ? type->__anon1._class->__anon1.registered : (((void *)0));

if(_class && ((_class->type == 1 && !type->declaredWithStruct) || _class->type == 5 || (_class->type == 1000 && _class->base && strcmp(_class->fullName, "uintptr") && strcmp(_class->fullName, "intptr") && strcmp(_class->fullName, "uintsize") && strcmp(_class->fullName, "intsize"))))
{
if(wantReference != (e->byReference || isPointer))
{
struct Expression * exp = e;

for(; ; )
{
if(exp->type == 5 || exp->type == 32)
{
if(exp->__anon1.list)
{
exp->byReference = wantReference;
exp = (*exp->__anon1.list).last;
}
else
break;
}
else if(exp->type == 11)
{
exp->byReference = wantReference;
exp = exp->__anon1.cast.exp;
}
else if(exp->type == 12)
{
if((*exp->__anon1.cond.exp).last)
FixReference((*exp->__anon1.cond.exp).last, wantReference);
FixReference(exp->__anon1.cond.elseExp, wantReference);
break;
}
else
{
if(wantReference != (exp->byReference || isPointer))
{
struct Expression * newExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

*newExp = *exp;
newExp->prev = (((void *)0));
newExp->next = (((void *)0));
if(exp->destType)
exp->destType->refCount++;
if(exp->expType)
exp->expType->refCount++;
exp->type = 4;
exp->__anon1.op.exp1 = (((void *)0));
exp->__anon1.op.exp2 = newExp;
if(wantReference)
exp->__anon1.op.op = '&';
else
exp->__anon1.op.op = '*';
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

static struct Expression * GetInnerExp(struct Expression * exp)
{
struct Expression * e = exp;

while(e && (e->type == 5 || e->type == 11))
{
if(e->type == 5)
e = e->__anon1.list ? (*e->__anon1.list).last : (((void *)0));
else if(e->type == 11)
e = e->__anon1.cast.exp;
}
return e;
}

struct Expression * GetNonBracketsExp(struct Expression * exp)
{
struct Expression * e = exp;

while(e && e->type == 5)
e = e->__anon1.list ? (*e->__anon1.list).last : (((void *)0));
return e;
}

static unsigned int FixMember(struct Expression * exp)
{
unsigned int byReference = 0;

for(; exp; )
{
if(exp->type == 5 || exp->type == 32)
{
if((*exp->__anon1.list).count > 1)
byReference = 1;
exp = (*exp->__anon1.list).last;
}
else if(exp->type == 11)
{
exp = exp->__anon1.cast.exp;
}
else
{
if(byReference)
FixReference(exp, 1);
else
byReference = exp->byReference;
break;
}
}
return byReference;
}

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern char *  strcpy(char * , const char * );

extern void FullClassNameCat(char *  output, const char *  className, unsigned int includeTemplateParams);

extern char *  strcat(char * , const char * );

extern void DeclareMethod(struct __ecereNameSpace__ecere__com__Method * method, const char *  name);

extern struct Declarator * SpecDeclFromString(const char *  string, struct __ecereNameSpace__ecere__sys__OldList *  specs, struct Declarator * baseDecl);

extern struct Declarator * MkDeclaratorBrackets(struct Declarator * declarator);

extern struct Declarator * MkDeclaratorPointer(struct Pointer * pointer, struct Declarator * declarator);

extern struct Pointer * MkPointer(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Pointer * pointer);

extern struct Declarator * GetFuncDecl(struct Declarator * decl);

extern struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator);

extern struct __ecereNameSpace__ecere__sys__OldList *  MkListOne(void *  item);

extern struct Specifier * MkSpecifierName(const char *  name);

extern struct Symbol * FindClass(const char *  name);

extern void DeclareClass(struct Symbol * classSym, const char *  className);

extern void FreeIdentifier(struct Identifier * id);

extern struct Expression * MkExpCast(struct TypeName * typeName, struct Expression * expression);

extern struct Expression * MkExpIndex(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * index);

extern struct Expression * MkExpPointer(struct Expression * expression, struct Identifier * member);

extern struct Expression * MkExpIdentifier(struct Identifier * id);

extern struct Identifier * MkIdentifier(const char *  string);

extern void FreeSpecifier(struct Specifier * spec);

extern char *  __ecereNameSpace__ecere__sys__CopyString(const char *  string);

extern void ListAdd(struct __ecereNameSpace__ecere__sys__OldList * list, void *  item);

extern struct Expression * MkExpOp(struct Expression * exp1, int op, struct Expression * exp2);

extern struct Expression * MkExpTypeSize(struct TypeName * typeName);

extern struct Expression * MkExpBrackets(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern struct Expression * QMkExpId(const char *  id);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Instance * privateModule;

extern void DeclareProperty(struct __ecereNameSpace__ecere__com__Property * prop, char *  setName, char *  getName);

extern int sprintf(char * , const char * , ...);

extern struct Context * curContext;

extern struct Type * MkClassType(const char *  name);

extern struct __ecereNameSpace__ecere__com__Class * containerClass;

extern unsigned int __ecereNameSpace__ecere__com__eClass_IsDerived(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__Class * from);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_FindDataMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module, struct __ecereNameSpace__ecere__com__DataMember **  subMemberStack, int *  subMemberStackPos);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BitMember;

struct __ecereNameSpace__ecere__com__BitMember
{
struct __ecereNameSpace__ecere__com__BitMember * prev;
struct __ecereNameSpace__ecere__com__BitMember * next;
const char *  name;
unsigned int isProperty;
int memberAccess;
int id;
struct __ecereNameSpace__ecere__com__Class * _class;
const char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
struct Type * dataType;
int type;
int size;
int pos;
uint64 mask;
} __attribute__ ((gcc_struct));

extern struct Expression * MkExpConstant(const char *  string);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassProperty;

struct __ecereNameSpace__ecere__com__ClassProperty
{
const char *  name;
struct __ecereNameSpace__ecere__com__ClassProperty * parent;
struct __ecereNameSpace__ecere__com__ClassProperty * left;
struct __ecereNameSpace__ecere__com__ClassProperty * right;
int depth;
void (*  Set)(struct __ecereNameSpace__ecere__com__Class *, long long);
long long (*  Get)(struct __ecereNameSpace__ecere__com__Class *);
const char *  dataTypeString;
struct Type * dataType;
unsigned int constant;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__ClassProperty * __ecereNameSpace__ecere__com__eClass_FindClassProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern char *  QMkString(const char *  source);

extern struct Expression * MkExpString(const char *  string);

extern struct Specifier * MkSpecifier(int specifier);

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

extern void Compiler_Error(const char *  format, ...);

extern const char *  __ecereNameSpace__ecere__GetTranslatedString(const char * name, const char *  string, const char *  stringAndContext);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern void ProcessExpressionType(struct Expression * exp);

extern struct Expression * MkExpCondition(struct Expression * cond, struct __ecereNameSpace__ecere__sys__OldList * expressions, struct Expression * elseExp);

extern struct Declarator * QMkPtrDecl(const char *  id);

extern struct Expression * GetTemplateArgExp(struct TemplateParameter * param, struct __ecereNameSpace__ecere__com__Class * curClass, unsigned int pointer);

extern struct __ecereNameSpace__ecere__com__Class * thisClass;

extern struct Expression * MkExpMember(struct Expression * expression, struct Identifier * member);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, const char *  name);

extern struct Context * globalContext;

extern void DeclareFunctionUtil(const char * s);

extern void FreeSymbol(struct Symbol * symbol);

extern struct __ecereNameSpace__ecere__sys__OldList *  CopyList(struct __ecereNameSpace__ecere__sys__OldList *  source, void *  (*  CopyFunction)(void * ));

extern struct TypeName * QMkType(const char *  spec, struct Declarator * decl);

extern struct MemberInit * MkMemberInit(struct __ecereNameSpace__ecere__sys__OldList * ids, struct Initializer * initializer);

extern struct Declaration * MkDeclarationInst(struct Instantiation * inst);

extern struct Instantiation * MkInstantiationNamed(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Expression * exp, struct __ecereNameSpace__ecere__sys__OldList * members);

extern struct MembersInit * MkMembersInitList(struct __ecereNameSpace__ecere__sys__OldList * dataMembers);

extern struct Expression * MkExpExtensionCompound(struct Statement * compound);

extern void ProcessExpressionInstPass(struct Expression * exp);

extern struct Context * SetupTemplatesContext(struct __ecereNameSpace__ecere__com__Class * _class);

extern void FinishTemplatesContext(struct Context * context);

extern void FreeTypeName(struct TypeName * typeName);

extern struct Specifier * MkStructOrUnion(int type, struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * definitions);

extern struct Type * ProcessTypeString(const char *  string, unsigned int staticMethod);

extern void PrintTypeNoConst(struct Type * type, char *  string, unsigned int printName, unsigned int fullName);

extern int ComputeTypeSize(struct Type * type);

extern struct Type * ProcessType(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

extern unsigned int internalValueCounter;

extern int printf(const char * , ...);

extern struct Type * ProcessTemplateParameterType(struct TemplateParameter * param);

extern void PrintType(struct Type * type, char *  string, unsigned int printName, unsigned int fullName);

extern char *  __ecereNameSpace__ecere__com__PrintString(struct __ecereNameSpace__ecere__com__Class * class, const void * object, ...);

extern void DeclareStruct(const char *  name, unsigned int skipNoHead);

static void ProcessStatement(struct Statement * stmt);

extern void FreeList(struct __ecereNameSpace__ecere__sys__OldList * list, void (*  FreeFunction)(void * ));

extern void FreeDeclarator(struct Declarator * decl);

extern char *  StringFromSpecDecl(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

static void ProcessInitializer(struct Initializer * init);

extern struct Expression * MoveExpContents(struct Expression * exp);

extern struct Specifier * CopySpecifier(struct Specifier * spec);

extern struct Declarator * CopyDeclarator(struct Declarator * declarator);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(struct __ecereNameSpace__ecere__sys__OldList * this, void *  prevItem, void *  item);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_int;

unsigned int __ecereProp_Type_Get_specConst(struct Type * this);

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp_Type_specConst;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_String;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_char__PTR_;

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
struct __ecereNameSpace__ecere__com__Class * _class = exp->expType->__anon1.__anon3.methodClass;
struct __ecereNameSpace__ecere__com__Method * method = exp->expType->__anon1.__anon3.method;

if(method->type == 1)
{
char name[1024];
struct TypeName * typeName;
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

strcpy(name, "__ecereVMethodID_");
FullClassNameCat(name, method->_class->fullName, 0);
strcat(name, "_");
strcat(name, method->name);
DeclareMethod(method, name);
decl = SpecDeclFromString(method->dataTypeString, specs, MkDeclaratorBrackets(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))));
if(!method->dataType->__anon1.__anon2.staticMethod)
{
struct Declarator * funcDecl = GetFuncDecl(decl);

if(!funcDecl->__anon1.function.parameters)
funcDecl->__anon1.function.parameters = MkList();
{
struct TypeName * firstParam = ((struct TypeName *)(*funcDecl->__anon1.function.parameters).first);
struct Specifier * firstSpec = firstParam ? (*firstParam->qualifiers).first : (((void *)0));

if(firstParam && firstSpec->type == 0 && firstSpec->__anon1.specifier == VOID && !firstParam->declarator)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*funcDecl->__anon1.function.parameters), (*funcDecl->__anon1.function.parameters).first);
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->__anon1.function.parameters), (((void *)0)), MkTypeName(MkListOne(MkSpecifierName(method->dataType->__anon1.__anon2.thisClass ? method->dataType->__anon1.__anon2.thisClass->string : method->_class->fullName)), (((void *)0))));
}
typeName = MkTypeName(specs, decl);
if(_class)
{
char className[1024];

strcpy(className, "__ecereClass_");
FullClassNameCat(className, _class->fullName, 1);
if(!_class->symbol)
_class->symbol = FindClass(_class->fullName);
DeclareClass(_class->symbol, className);
if(exp->__anon1.__anon1.identifier)
FreeIdentifier(exp->__anon1.__anon1.identifier);
exp->type = 5;
exp->__anon1.list = MkListOne(MkExpCast(typeName, MkExpIndex(MkExpPointer(MkExpIdentifier(MkIdentifier(className)), MkIdentifier("_vTbl")), MkListOne(MkExpIdentifier(MkIdentifier(name))))));
}
}
else
{
char name[1024];

strcpy(name, "__ecereMethod_");
FullClassNameCat(name, method->_class->fullName, 0);
strcat(name, "_");
strcat(name, method->name);
(__ecereNameSpace__ecere__com__eSystem_Delete(exp->__anon1.__anon1.identifier->string), exp->__anon1.__anon1.identifier->string = 0);
FreeSpecifier(exp->__anon1.__anon1.identifier->_class);
exp->__anon1.__anon1.identifier->_class = (((void *)0));
exp->__anon1.__anon1.identifier->string = __ecereNameSpace__ecere__sys__CopyString(name);
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
case 26:
case 14:
case 27:
{
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

if(exp->type == 14 || exp->type == 27)
ListAdd(args, exp->__anon1._renew.exp);
ListAdd(args, MkExpOp(MkExpTypeSize(exp->__anon1._new.typeName), '*', MkExpBrackets(MkListOne(exp->__anon1._new.size))));
switch(exp->type)
{
case 13:
exp->__anon1.call.exp = QMkExpId("ecere::com::eSystem_New");
break;
case 26:
exp->__anon1.call.exp = QMkExpId("ecere::com::eSystem_New0");
break;
case 14:
exp->__anon1.call.exp = QMkExpId("ecere::com::eSystem_Renew");
break;
case 27:
exp->__anon1.call.exp = QMkExpId("ecere::com::eSystem_Renew0");
break;
}
exp->__anon1.call.arguments = args;
exp->type = 7;
ProcessExpression(exp);
break;
}
case 4:
{
struct Expression * exp1 = exp->__anon1.op.exp1;
struct Expression * exp2 = exp->__anon1.op.exp2;

switch(exp->__anon1.op.op)
{
case '=':
if(exp->__anon1.op.exp2)
exp->__anon1.op.exp2->usage = (exp->__anon1.op.exp2->usage & ~0x1) | (((unsigned int)(1)) << 0);
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
exp->__anon1.op.exp2->usage = (exp->__anon1.op.exp2->usage & ~0x1) | (((unsigned int)(1)) << 0);
break;
case INC_OP:
case DEC_OP:
case '&':
if(exp->__anon1.op.exp1 && exp->__anon1.op.exp2)
{
exp->__anon1.op.exp1->usage = (exp->__anon1.op.exp1->usage & ~0x1) | (((unsigned int)(1)) << 0);
exp->__anon1.op.exp2->usage = (exp->__anon1.op.exp2->usage & ~0x1) | (((unsigned int)(1)) << 0);
}
else if(exp->__anon1.op.exp2)
{
exp->__anon1.op.exp2->usage = (exp->__anon1.op.exp2->usage & ~0x40) | (((unsigned int)(1)) << 6);
}
break;
case '*':
case '+':
case '-':
if(exp->__anon1.op.exp1)
{
exp->__anon1.op.exp1->usage = (exp->__anon1.op.exp1->usage & ~0x1) | (((unsigned int)(1)) << 0);
}
case '~':
case '!':
if(exp->__anon1.op.exp2)
exp->__anon1.op.exp2->usage = (exp->__anon1.op.exp2->usage & ~0x1) | (((unsigned int)(1)) << 0);
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
if(exp->__anon1.op.exp1)
exp->__anon1.op.exp1->usage = (exp->__anon1.op.exp1->usage & ~0x1) | (((unsigned int)(1)) << 0);
if(exp->__anon1.op.exp2)
exp->__anon1.op.exp2->usage = (exp->__anon1.op.exp2->usage & ~0x1) | (((unsigned int)(1)) << 0);
break;
}
if(exp->__anon1.op.op == '=' || exp->__anon1.op.op == MUL_ASSIGN || exp->__anon1.op.op == DIV_ASSIGN || exp->__anon1.op.op == ADD_ASSIGN || exp->__anon1.op.op == MOD_ASSIGN || exp->__anon1.op.op == SUB_ASSIGN || exp->__anon1.op.op == LEFT_ASSIGN || exp->__anon1.op.op == RIGHT_ASSIGN || exp->__anon1.op.op == AND_ASSIGN || exp->__anon1.op.op == OR_ASSIGN || exp->__anon1.op.op == XOR_ASSIGN || exp->__anon1.op.op == INC_OP || exp->__anon1.op.op == DEC_OP)
{
struct Expression * memberExp;
struct Expression * parentExp = (((void *)0));
unsigned int isIndexedContainerAssignment = 0;

if(exp->__anon1.op.exp1 && exp->__anon1.op.exp1->type == 8)
{
struct Expression * testExp, * topExp = (((void *)0));
struct Expression * lastExp = exp->__anon1.op.exp1, * parentExp = (((void *)0));
struct __ecereNameSpace__ecere__com__Property * lastProperty = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * propertyClass;
char setName[1024], getName[1024];

testExp = exp->__anon1.op.exp1->__anon1.member.exp;
while(1)
{
while(testExp)
{
if(testExp->type == 11)
testExp = testExp->__anon1.cast.exp;
else if(testExp->type == 5 || testExp->type == 32)
testExp = (*testExp->__anon1.list).last;
else if(testExp->type == 8)
break;
else
testExp = (((void *)0));
}
if(!testExp)
break;
if(testExp->__anon1.member.memberType == 1 || testExp->__anon1.member.memberType == 4)
{
struct Type * type = testExp->__anon1.member.exp->expType;

if(type)
{
if(type->kind == 8)
{
struct __ecereNameSpace__ecere__com__Class * _class = testExp->__anon1.member.member->classSym ? testExp->__anon1.member.member->classSym->__anon1.registered : type->__anon1._class->__anon1.registered;
struct __ecereNameSpace__ecere__com__Class * convertTo = (((void *)0));

if(testExp->__anon1.member.memberType == 4)
{
convertTo = _class;
_class = FindClass(testExp->__anon1.member.member->string)->__anon1.registered;
lastProperty = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, convertTo->fullName, privateModule);
}
else
{
lastProperty = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, testExp->__anon1.member.member->string, privateModule);
}
if(lastProperty && lastProperty->Get && lastProperty->Set)
{
DeclareProperty(lastProperty, setName, getName);
propertyClass = convertTo ? _class : ((((struct Symbol *)lastProperty->symbol)->type && ((struct Symbol *)lastProperty->symbol)->type->kind == 8) ? ((struct Symbol *)lastProperty->symbol)->type->__anon1._class->__anon1.registered : ((struct Symbol *)lastProperty->symbol)->_class);
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
testExp = testExp->__anon1.member.exp;
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
parentExp->__anon1.member.exp = tempExp;
value = MkExpBrackets(MkList());
copy = CopyExpression(topExp);
copy->usage = (copy->usage & ~0x1) | (((unsigned int)(1)) << 0);
copy->usage = (copy->usage & ~0x20) | (((unsigned int)(1)) << 5);
ListAdd(value->__anon1.list, copy);
ListAdd(value->__anon1.list, MkExpOp(exp->__anon1.op.exp1, exp->__anon1.op.op, exp->__anon1.op.exp2));
ListAdd(value->__anon1.list, CopyExpression(tempExp));
value->expType = tempExp->expType;
tempExp->expType->refCount++;
exp->__anon1.op.exp1 = topExp;
exp->__anon1.op.exp2 = value;
exp->__anon1.op.op = '=';
exp1 = exp->__anon1.op.exp1;
exp2 = exp->__anon1.op.exp2;
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
parentExp->__anon1.member.exp = tempExp;
value = MkExpBrackets(MkList());
copy = CopyExpression(topExp);
copy->usage = (copy->usage & ~0x1) | (((unsigned int)(1)) << 0);
copy->usage = (copy->usage & ~0x20) | (((unsigned int)(1)) << 5);
ListAdd(value->__anon1.list, copy);
ListAdd(value->__anon1.list, MkExpOp(exp->__anon1.op.exp1, exp->__anon1.op.op, exp->__anon1.op.exp2));
ListAdd(value->__anon1.list, CopyExpression(tempExp));
value->expType = tempExp->expType;
value->expType->refCount++;
exp->__anon1.op.exp1 = topExp;
exp->__anon1.op.exp2 = value;
exp->__anon1.op.op = '=';
exp1 = exp->__anon1.op.exp1;
exp2 = exp->__anon1.op.exp2;
}
}
}
memberExp = exp->__anon1.op.exp1;
while(memberExp && ((memberExp->type == 5 && (*memberExp->__anon1.list).count == 1) || memberExp->type == 32 || memberExp->type == 23))
{
parentExp = memberExp;
if(memberExp->type == 23)
memberExp = (*((struct Statement *)(*memberExp->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions).last;
else
memberExp = (*memberExp->__anon1.list).last;
}
if(memberExp && memberExp->type == 6 && memberExp->__anon1.index.exp && memberExp->__anon1.index.exp->expType && memberExp->__anon1.index.exp->expType->kind == 8 && memberExp->__anon1.index.exp->expType->__anon1._class && memberExp->__anon1.index.exp->expType->__anon1._class->__anon1.registered && memberExp->__anon1.index.exp->expType->__anon1._class->__anon1.registered != containerClass && __ecereNameSpace__ecere__com__eClass_IsDerived(memberExp->__anon1.index.exp->expType->__anon1._class->__anon1.registered, containerClass))
{
struct __ecereNameSpace__ecere__com__Class * c = memberExp->__anon1.index.exp->expType->__anon1._class->__anon1.registered;

if(strcmp((c->templateClass ? c->templateClass : c)->name, "Array"))
{
exp->__anon1.op.exp2 = MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), (((void *)0))), MkExpBrackets(MkListOne(exp->__anon1.op.exp2)))));
isIndexedContainerAssignment = 1;
}
ProcessExpression(memberExp);
while(memberExp && ((memberExp->type == 5 && (*memberExp->__anon1.list).count == 1) || memberExp->type == 32 || memberExp->type == 23))
{
parentExp = memberExp;
if(memberExp->type == 23)
memberExp = (*((struct Statement *)(*memberExp->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions).last;
else
memberExp = (*memberExp->__anon1.list).last;
}
if(memberExp && memberExp->type == 23)
{
parentExp = memberExp;
if(memberExp->type == 23)
{
struct Statement * stmt = memberExp->__anon1.compound->__anon1.compound.statements ? (*memberExp->__anon1.compound->__anon1.compound.statements).last : (((void *)0));

if(stmt && stmt->type != 3)
stmt = (((void *)0));
memberExp = (stmt && stmt->__anon1.expressions) ? (*stmt->__anon1.expressions).last : (((void *)0));
if(memberExp)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*stmt->__anon1.expressions), memberExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*stmt->__anon1.expressions), MkExpOp(memberExp, exp->__anon1.op.op, exp->__anon1.op.exp2));
exp->type = 5;
exp->__anon1.list = MkListOne(parentExp);
ProcessExpression(exp);
break;
}
}
else
memberExp = (*memberExp->__anon1.list).last;
}
}
if(memberExp && memberExp->type != 8)
memberExp = (((void *)0));
if(memberExp && memberExp->type == 8 && memberExp->__anon1.member.member)
{
struct Type * type = memberExp->__anon1.member.exp->expType;

if(type)
{
if(type->kind == 8 || type->kind == 19)
{
struct __ecereNameSpace__ecere__com__Class * _class = memberExp->__anon1.member.member->classSym ? (memberExp->__anon1.member.member->classSym ? memberExp->__anon1.member.member->classSym->__anon1.registered : (((void *)0))) : (type->__anon1._class ? type->__anon1._class->__anon1.registered : (((void *)0)));

if(memberExp == exp1)
exp1 = (((void *)0));
else
{
if(parentExp->type == 23)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*((struct Statement *)(*parentExp->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions), memberExp);
else
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*parentExp->__anon1.list), memberExp);
}
if(_class && _class->type == 2 && memberExp->__anon1.member.memberType == 3)
{
struct __ecereNameSpace__ecere__com__BitMember * bitMember = (struct __ecereNameSpace__ecere__com__BitMember *)__ecereNameSpace__ecere__com__eClass_FindDataMember(_class, memberExp->__anon1.member.member->string, privateModule, (((void *)0)), (((void *)0)));
char mask[32], shift[10];
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl = SpecDeclFromString(_class->dataTypeString, specs, (((void *)0)));
struct TypeName * type = MkTypeName(specs, decl);

if(bitMember->mask > (0xffffffff))
sprintf(mask, ((__runtimePlatform == 1) ? "0x%I64XLL" : "0x%llXLL"), bitMember->mask);
else
sprintf(mask, ((__runtimePlatform == 1) ? "0x%I64X" : "0x%llX"), bitMember->mask);
sprintf(shift, "%d", bitMember->pos);
exp->__anon1.op.exp1 = memberExp->__anon1.member.exp;
if(exp->__anon1.op.op == XOR_ASSIGN)
{
exp->__anon1.op.exp2 = MkExpOp(MkExpBrackets(MkListOne(MkExpCast(type, exp->__anon1.op.exp2))), LEFT_OP, MkExpConstant(shift));
}
else
{
exp->__anon1.op.exp2 = MkExpOp(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(memberExp->__anon1.member.exp), '&', MkExpOp((((void *)0)), '~', MkExpConstant(mask))))), '|', MkExpBrackets(MkListOne(MkExpOp(MkExpBrackets(MkListOne(MkExpCast(type, MkExpBrackets(MkListOne(exp->__anon1.op.exp2))))), LEFT_OP, MkExpConstant(shift)))));
}
memberExp->__anon1.member.exp = (((void *)0));
FreeExpression(memberExp);
ProcessExpression(exp);
return ;
}
else if(_class && _class->type == 3 && memberExp->__anon1.member.memberType == 3)
{
}
else if(memberExp->__anon1.member.memberType != 3)
{
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__Class * convertTo = (((void *)0));
struct __ecereNameSpace__ecere__com__ClassProperty * classProperty = (((void *)0));

if(memberExp->__anon1.member.memberType == 4)
{
convertTo = _class;
_class = FindClass(memberExp->__anon1.member.member->string)->__anon1.registered;
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, convertTo->fullName, privateModule);
}
else
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, memberExp->__anon1.member.member->string, privateModule);
if(memberExp->__anon1.member.memberType == 5)
classProperty = __ecereNameSpace__ecere__com__eClass_FindClassProperty(_class, memberExp->__anon1.member.member->string);
exp->tempCount = memberExp->__anon1.member.exp->tempCount;
if(classProperty)
{
if(classProperty->Set)
{
struct Identifier * id = memberExp->__anon1.member.member;
struct Expression * classExp = memberExp->__anon1.member.exp;
struct Expression * value = exp->__anon1.op.exp2;

memberExp->__anon1.member.exp = (((void *)0));
memberExp->__anon1.member.member = (((void *)0));
exp->__anon1.op.exp2 = (((void *)0));
FreeExpContents(memberExp);
exp->type = 7;
exp->__anon1.call.exp = MkExpIdentifier(MkIdentifier("ecere::com::eClass_SetProperty"));
exp->__anon1.call.arguments = MkList();
ListAdd(exp->__anon1.call.arguments, classExp);
{
char * s = QMkString(id->string);

ListAdd(exp->__anon1.call.arguments, MkExpString(s));
(__ecereNameSpace__ecere__com__eSystem_Delete(s), s = 0);
}
ListAdd(exp->__anon1.call.arguments, MkExpCast(MkTypeName(MkListOne(MkSpecifier(INT64)), (((void *)0))), value));
FreeIdentifier(id);
ProcessExpression(exp);
return ;
}
}
else if(prop)
{
if((!convertTo && prop->Set) || (convertTo && prop->Get))
{
struct Expression * value = exp->__anon1.op.exp2;
char setName[1024], getName[1024];
char * setToUse = convertTo ? getName : setName;
char * getToUse = convertTo ? setName : getName;
unsigned int needAddress = 0;
int operator = exp->__anon1.op.op;

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
value->usage = (value->usage & ~0x4) | (((unsigned int)(1)) << 2);
}
else if(value)
{
exp2 = (((void *)0));
}
if(value)
value->usage = (value->usage & ~0x4) | (((unsigned int)(1)) << 2);
DeclareProperty(prop, setName, getName);
if(memberExp->__anon1.member.exp)
ProcessExpression(memberExp->__anon1.member.exp);
if(((unsigned int)((exp->usage & 0x1) >> 0)) && ((!convertTo && prop->Get) || (convertTo && prop->Set)))
{
int __simpleStruct0, __simpleStruct1;
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct __ecereNameSpace__ecere__sys__OldList * args;
char ecereTemp[100];
struct Context * context = PushContext();

exp->tempCount++;
curExternal->__anon1.function->tempCount = (__simpleStruct0 = curExternal->__anon1.function->tempCount, __simpleStruct1 = exp->tempCount, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
sprintf(ecereTemp, "__ecTemp%d", exp->tempCount);
curContext = context;
exp->type = 23;
exp->__anon1.compound = MkCompoundStmt(MkListOne(MkDeclaration(MkListOne(MkSpecifier(VOID)), MkListOne(MkInitDeclarator(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(MkIdentifier(ecereTemp))), MkInitializerAssignment(QBrackets(memberExp->__anon1.member.exp)))))), list);
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
exp->__anon1.compound->__anon1.compound.context = context;
PopContext(context);
curContext = context->parent;
}
else
{
struct Expression * newExp = exp;

if(parentExp && parentExp->type == 23)
{
newExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*((struct Statement *)(*parentExp->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions), newExp);
FreeType(exp->expType);
FreeType(exp->destType);
*exp = *parentExp;
parentExp->type = 16;
parentExp->expType = (((void *)0));
parentExp->destType = (((void *)0));
}
newExp->type = 7;
newExp->__anon1.call.exp = QMkExpId(setToUse);
newExp->__anon1.call.arguments = MkList();
if(convertTo)
{
ListAdd(newExp->__anon1.call.arguments, value);
ListAdd(newExp->__anon1.call.arguments, FixReference(memberExp->__anon1.member.exp, 1));
}
else
{
ListAdd(newExp->__anon1.call.arguments, FixReference(memberExp->__anon1.member.exp, 1));
ListAdd(newExp->__anon1.call.arguments, value);
}
needAddress = 1;
}
memberExp->__anon1.member.exp = (((void *)0));
if(value)
{
value->tempCount = exp->tempCount;
ProcessExpression(value);
if(needAddress)
FixReference(isIndexedContainerAssignment ? GetInnerExp(value) : value, 1);
}
FreeExpression(memberExp);
}
else
{
struct __ecereNameSpace__ecere__com__DataMember * member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, memberExp->__anon1.member.member->string, privateModule, (((void *)0)), (((void *)0)));

if(member)
{
memberExp->__anon1.member.memberType = 3;
}
else
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "no set defined for property %s of class %s\n", (((void *)0))), prop->name, prop->_class->fullName);
}
}
else
{
struct __ecereNameSpace__ecere__com__Method * method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, memberExp->__anon1.member.member->string, privateModule);

if(method && method->type == 1 && type->kind != 19)
{
struct Expression * value = exp->__anon1.op.exp2;

value->tempCount = exp->tempCount;
ProcessExpression(value);
if(memberExp->__anon1.member.exp)
ProcessExpression(memberExp->__anon1.member.exp);
if(((unsigned int)((exp->usage & 0x1) >> 0)))
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct __ecereNameSpace__ecere__sys__OldList * args;

args = MkList();
ListAdd(args, memberExp->__anon1.member.exp);
{
char * string = QMkString(memberExp->__anon1.member.member->string);

ListAdd(args, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
ListAdd(args, value);
ListAdd(list, MkExpCall(QMkExpId("ecere::com::eInstance_SetMethod"), args));
ListAdd(list, CopyExpression(value));
exp->type = 5;
exp->__anon1.list = list;
}
else
{
exp->type = 7;
exp->__anon1.call.exp = QMkExpId("ecere::com::eInstance_SetMethod");
exp->__anon1.call.arguments = MkList();
ListAdd(exp->__anon1.call.arguments, memberExp->__anon1.member.exp);
{
char * string = QMkString(memberExp->__anon1.member.member->string);

ListAdd(exp->__anon1.call.arguments, MkExpString(string));
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
}
ListAdd(exp->__anon1.call.arguments, value);
}
memberExp->__anon1.member.exp = (((void *)0));
exp2 = (((void *)0));
FreeExpression(memberExp);
}
}
}
else if(memberExp->__anon1.member.memberType == 3)
{
if(FixMember(memberExp->__anon1.member.exp))
{
ProcessExpression(memberExp);
memberExp->type = 9;
}
}
}
}
}
}
else if(exp->__anon1.op.op == _INCREF)
{
struct Expression * object = exp->__anon1.op.exp2;

exp->__anon1.op.exp2 = (((void *)0));
FreeExpContents(exp);
FreeType(exp->expType);
FreeType(exp->destType);
exp->expType = (((void *)0));
exp->destType = (((void *)0));
exp->__anon1.op.op = INC_OP;
exp->__anon1.op.exp1 = MkExpPointer(object, MkIdentifier("_refCount"));
}
else if(exp->__anon1.op.op == DELETE)
{
struct Expression * object = exp->__anon1.op.exp2;
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

exp->type = 5;
exp->__anon1.list = MkList();
object->usage = (object->usage & ~0x80) | (((unsigned int)(1)) << 7);
ProcessExpression(object);
ListAdd(args, object);
if(exp->expType && exp->expType->kind == 8 && exp->expType->__anon1._class && exp->expType->__anon1._class->__anon1.registered && exp->expType->__anon1._class->__anon1.registered->type == 0 && strcmp(exp->expType->__anon1._class->__anon1.registered->dataTypeString, "char *"))
{
struct Expression * decRefExp = MkExpCall(QMkExpId("ecere::com::eInstance_DecRef"), args);

ProcessExpressionType(decRefExp);
ListAdd(exp->__anon1.list, decRefExp);
}
else if(exp->expType && exp->expType->kind == 8 && exp->expType->__anon1._class && exp->expType->__anon1._class->__anon1.registered && exp->expType->__anon1._class->__anon1.registered->type == 5)
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct __ecereNameSpace__ecere__com__Class * _class;
struct Expression * o;

for(_class = exp->expType->__anon1._class->__anon1.registered; _class && _class->type == 5; _class = _class->base)
{
char className[1024];

if(_class->templateClass)
_class = _class->templateClass;
strcpy(className, "__ecereClass_");
FullClassNameCat(className, _class->fullName, 0);
if(!_class->symbol)
_class->symbol = FindClass(_class->fullName);
DeclareClass(_class->symbol, className);
ListAdd(list, MkExpCondition(MkExpPointer(QMkExpId(className), MkIdentifier("Destructor")), MkListOne(MkExpCall(MkExpPointer(QMkExpId(className), MkIdentifier("Destructor")), MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), QMkPtrDecl((((void *)0)))), CopyExpression((*args).first))))), MkExpConstant("0")));
}
ListAdd(list, MkExpCall(QMkExpId("ecere::com::eSystem_Delete"), args));
o = CopyExpression(object);
ProcessExpressionType(o);
o->usage = (o->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(o);
ListAdd(exp->__anon1.list, MkExpBrackets(MkListOne(MkExpCondition(o, MkListOne(MkExpBrackets(list)), MkExpConstant("0")))));
}
else if(exp->expType && exp->expType->kind == 20)
{
struct Expression * argExp = GetTemplateArgExp(exp->expType->__anon1.templateParameter, thisClass, 0);

if(argExp)
{
struct Expression * classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
struct TypeName * typeName;
struct __ecereNameSpace__ecere__sys__OldList * qualifiers = MkList();
struct Declarator * declarator = SpecDeclFromString("void (*)(void * _class, void * data)", qualifiers, (((void *)0)));

typeName = MkTypeName(qualifiers, declarator);
ProcessExpressionType(classExp);
ProcessExpression(classExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*args), (((void *)0)), CopyExpression(classExp));
DeclareMethod(__ecereNameSpace__ecere__com__eClass_FindMethod(__ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "class"), "OnFree", privateModule), "__ecereVMethodID_class_OnFree");
ListAdd(exp->__anon1.list, MkExpCall(MkExpBrackets(MkListOne(MkExpCast(typeName, MkExpIndex(MkExpPointer(classExp, MkIdentifier("_vTbl")), MkListOne(MkExpIdentifier(MkIdentifier("__ecereVMethodID_class_OnFree"))))))), args));
}
}
else
ListAdd(exp->__anon1.list, MkExpCall(QMkExpId("ecere::com::eSystem_Delete"), args));
ListAdd(exp->__anon1.list, MkExpOp(CopyExpression(GetInnerExp(object)), '=', MkExpConstant("0")));
exp2 = (((void *)0));
ProcessExpression(exp);
}
if(exp->type == 4)
{
if(exp->__anon1.op.op == '=' && exp->__anon1.op.exp1 && exp->__anon1.op.exp1->expType && exp->__anon1.op.exp1->expType->kind == 20 && (exp->__anon1.op.exp1->type == 6 || (exp->__anon1.op.exp1->type == 4 && exp->__anon1.op.exp1->__anon1.op.op == '*' && !exp->__anon1.op.exp1->__anon1.op.exp1)))
{
struct Expression * argExp = GetTemplateArgExp(exp->__anon1.op.exp1->expType->__anon1.templateParameter, thisClass, 0);

if(argExp)
{
struct Expression * classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();
struct Expression * derefExp = exp->__anon1.op.exp1;
struct Expression * sizeExp;

ProcessExpressionType(classExp);
ProcessExpression(classExp);
sizeExp = MkExpMember(CopyExpression(classExp), MkIdentifier("typeSize"));
if(exp->__anon1.op.exp1->type == 6)
{
struct Expression * indexExp = derefExp->__anon1.index.exp;
struct __ecereNameSpace__ecere__sys__OldList * indexExpIndex = derefExp->__anon1.index.index;

derefExp->__anon1.index.index = (((void *)0));
derefExp->__anon1.index.exp = (((void *)0));
FreeExpression(derefExp);
derefExp = MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), indexExp), '+', MkExpBrackets(MkListOne(MkExpOp(MkExpBrackets(indexExpIndex), '*', MkExpBrackets(MkListOne(CopyExpression(sizeExp)))))));
}
else
{
struct Expression * indexExp = derefExp->__anon1.op.exp2;

derefExp->__anon1.op.exp2 = (((void *)0));
FreeExpression(derefExp);
derefExp = indexExp;
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), derefExp);
ProcessExpressionType((*args).last);
ProcessExpression((*args).last);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(MkExpMember(classExp, MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("structClass"))))), MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), (((void *)0))), MkExpBrackets(MkListOne(exp->__anon1.op.exp2))))), MkExpOp((((void *)0)), '&', CopyExpression(exp->__anon1.op.exp2)))));
thisClass = curExternal->__anon1.function ? curExternal->__anon1.function->_class : (((void *)0));
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(thisClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
ProcessExpressionType((*args).last);
ProcessExpression((*args).last);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*args), sizeExp);
ProcessExpressionType((*args).last);
ProcessExpression((*args).last);
DeclareFunctionUtil("memcpy");
exp->__anon1.list = MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("memcpy")), args));
exp->type = 5;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
FreeSymbol(thisSymbol);
}
thisClass = (((void *)0));
return ;
}
}
else if(exp->__anon1.op.op == '*' && !exp->__anon1.op.exp1 && exp->__anon1.op.exp2 && exp->__anon1.op.exp2->expType && exp->__anon1.op.exp2->expType->kind == 13 && exp->__anon1.op.exp2->expType->__anon1.type && exp->__anon1.op.exp2->expType->__anon1.type->kind == 20)
{
struct Expression * argExp = GetTemplateArgExp(exp->__anon1.op.exp2->expType->__anon1.type->__anon1.templateParameter, thisClass, 0);

if(argExp)
{
struct Expression * classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
struct Expression * sizeExp;

ProcessExpressionType(classExp);
ProcessExpression(classExp);
sizeExp = MkExpMember(CopyExpression(classExp), MkIdentifier("typeSize"));
exp->type = 5;
exp->__anon1.list = MkListOne(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), (((void *)0))), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("structClass"))))), MkListOne(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), (((void *)0))), CopyExpression(exp->__anon1.op.exp2))))), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(sizeExp), EQ_OP, MkExpConstant("1")))), MkListOne(MkExpOp((((void *)0)), '*', MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), CopyExpression(exp->__anon1.op.exp2)))))), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(sizeExp), EQ_OP, MkExpConstant("2")))), MkListOne(MkExpOp((((void *)0)), '*', MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint16")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), CopyExpression(exp->__anon1.op.exp2)))))), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(sizeExp, EQ_OP, MkExpConstant("4")))), MkListOne(MkExpOp((((void *)0)), '*', MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint32")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), CopyExpression(exp->__anon1.op.exp2)))))), MkExpOp((((void *)0)), '*', MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), exp->__anon1.op.exp2))))))))))))))))))));
thisClass = curExternal->__anon1.function ? curExternal->__anon1.function->_class : (((void *)0));
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(thisClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
ProcessExpressionType((*exp->__anon1.list).first);
ProcessExpression((*exp->__anon1.list).first);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
FreeSymbol(thisSymbol);
}
thisClass = (((void *)0));
return ;
}
}
else
{
if(exp->__anon1.op.exp1)
{
if(exp->__anon1.op.exp2)
exp->__anon1.op.exp1->tempCount = exp->__anon1.op.exp2->tempCount;
ProcessExpression(exp->__anon1.op.exp1);
if(exp->__anon1.op.op == '=' && exp->__anon1.op.exp2 && (!exp->__anon1.op.exp2->byReference || (exp->__anon1.op.exp2->expType && exp->__anon1.op.exp2->expType->kind == 8 && exp->__anon1.op.exp2->expType->__anon1._class && exp->__anon1.op.exp2->expType->__anon1._class->__anon1.registered && exp->__anon1.op.exp2->expType->__anon1._class->__anon1.registered->type == 1)) && exp->__anon1.op.exp2->expType && (exp->__anon1.op.exp2->expType->kind != 13 && exp->__anon1.op.exp2->expType->kind != 20))
FixReference(exp->__anon1.op.exp1, 0);
}
if(exp->__anon1.op.exp2)
{
if(exp->__anon1.op.exp1)
exp->__anon1.op.exp2->tempCount = exp->__anon1.op.exp1->tempCount;
ProcessExpression(exp->__anon1.op.exp2);
if(exp->__anon1.op.exp1 || (exp->__anon1.op.op != '*' && exp->__anon1.op.op != '&'))
{
if((!exp->__anon1.op.exp1 && (!exp->__anon1.op.exp2 || !exp->__anon1.op.exp2->expType || exp->__anon1.op.exp2->expType->kind != 8 || !exp->__anon1.op.exp2->expType->__anon1._class || !exp->__anon1.op.exp2->expType->__anon1._class->__anon1.registered || (exp->__anon1.op.exp2->expType->__anon1._class->__anon1.registered->type != 0 && exp->__anon1.op.exp2->expType->__anon1._class->__anon1.registered->type != 1 && exp->__anon1.op.exp2->expType->__anon1._class->__anon1.registered->type != 5))) || (exp->__anon1.op.exp1 && exp->__anon1.op.exp1->expType && exp->__anon1.op.exp1->expType->kind != 13 && exp->__anon1.op.exp1->expType->kind != 20))
{
FixReference(exp->__anon1.op.exp2, exp->__anon1.op.exp1 ? exp->__anon1.op.exp1->byReference : 0);
}
}
}
}
if(exp->__anon1.op.op == '*' && !exp->__anon1.op.exp1 && exp->__anon1.op.exp2 && exp->__anon1.op.exp2->type == 4 && exp->__anon1.op.exp2->__anon1.op.op == '&' && !exp->__anon1.op.exp2->__anon1.op.exp1)
{
struct Expression * next = exp->next, * prev = exp->prev;
struct Expression * derefExp = exp->__anon1.op.exp2;
struct Expression * refExp = exp->__anon1.op.exp2->__anon1.op.exp2;

derefExp->__anon1.op.exp2 = (((void *)0));
FreeExpression(derefExp);
FreeType(exp->expType);
FreeType(exp->destType);
*exp = *refExp;
exp->prev = prev;
exp->next = next;
((refExp ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor((void *)refExp) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(refExp)) : 0), refExp = 0);
}
if(exp->__anon1.op.op == '&' && !exp->__anon1.op.exp1 && exp->__anon1.op.exp2 && exp->__anon1.op.exp2->expType && exp->__anon1.op.exp2->expType->kind == 20 && !exp->__anon1.op.exp2->expType->passAsTemplate)
{
struct Expression * exp2 = exp->__anon1.op.exp2;
struct Expression * argExp = GetTemplateArgExp(exp2->expType->__anon1.templateParameter, thisClass, 0);

if(argExp)
{
struct Expression * classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
struct Expression * e;

ProcessExpressionType(classExp);
ProcessExpression(classExp);
exp->type = 5;
exp->__anon1.list = MkListOne(MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpOp((((void *)0)), '&', exp2)), '+', MkExpCall(MkExpIdentifier(MkIdentifier("__ENDIAN_PAD")), MkListOne((e = MkExpMember(classExp, MkIdentifier("typeSize")))))));
thisClass = curExternal->__anon1.function ? curExternal->__anon1.function->_class : (((void *)0));
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
case 32:
{
if(exp->__anon1.list)
{
struct Expression * e;

for(e = (*exp->__anon1.list).first; e; e = e->next)
{
if(!e->next)
{
e->usage |= (exp->usage & (((unsigned int)(1)) | (((unsigned int)(1)) << 2) | (((unsigned int)(1)) << 4)));
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
struct Expression * checkedExp = exp->__anon1.index.exp;
unsigned int isBuiltin = 0;

while(checkedExp->type == 23 || checkedExp->type == 5 || checkedExp->type == 11)
{
if(checkedExp->type == 23)
{
isBuiltin = 1;
break;
}
else if(checkedExp->type == 5)
checkedExp = checkedExp->__anon1.list ? (*checkedExp->__anon1.list).last : (((void *)0));
else
checkedExp = checkedExp->__anon1.cast.exp;
}
exp->__anon1.index.exp->tempCount = exp->tempCount;
exp->__anon1.index.exp->usage = (exp->__anon1.index.exp->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(exp->__anon1.index.exp);
if(exp->__anon1.index.exp->expType && exp->__anon1.index.exp->expType->kind == 13 && exp->__anon1.index.exp->expType->__anon1.type && exp->__anon1.index.exp->expType->__anon1.type->kind == 20)
{
struct Expression * argExp = GetTemplateArgExp(exp->__anon1.index.exp->expType->__anon1.type->__anon1.templateParameter, thisClass, 0);

if(argExp)
{
struct Expression * classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
struct Expression * sizeExp;

ProcessExpressionType(classExp);
ProcessExpression(classExp);
sizeExp = MkExpMember(CopyExpression(classExp), MkIdentifier("typeSize"));
exp->type = 5;
exp->__anon1.list = MkListOne(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), (((void *)0))), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("structClass"))))), MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), (((void *)0))), MkExpBrackets(MkListOne(MkExpOp(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), CopyExpression(exp->__anon1.index.exp)))), '+', MkExpOp(MkExpBrackets(CopyList(exp->__anon1.index.index, (void *)(CopyExpression))), '*', CopyExpression(sizeExp))))))), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(sizeExp), EQ_OP, MkExpConstant("1")))), MkListOne(MkExpIndex(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), CopyExpression(exp->__anon1.index.exp)))), CopyList(exp->__anon1.index.index, (void *)(CopyExpression)))), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(sizeExp), EQ_OP, MkExpConstant("2")))), MkListOne(MkExpIndex(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint16")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), CopyExpression(exp->__anon1.index.exp)))), CopyList(exp->__anon1.index.index, (void *)(CopyExpression)))), MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(sizeExp, EQ_OP, MkExpConstant("4")))), MkListOne(MkExpIndex(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint32")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), CopyExpression(exp->__anon1.index.exp)))), CopyList(exp->__anon1.index.index, (void *)(CopyExpression)))), MkExpIndex(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), exp->__anon1.index.exp))), exp->__anon1.index.index)))))))))))))))));
thisClass = curExternal->__anon1.function ? curExternal->__anon1.function->_class : (((void *)0));
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(thisClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
ProcessExpressionType((*exp->__anon1.list).first);
ProcessExpression((*exp->__anon1.list).first);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
FreeSymbol(thisSymbol);
}
thisClass = (((void *)0));
return ;
}
}
for(e = (*exp->__anon1.index.index).first; e; e = e->next)
{
if(!e->next)
e->usage = (e->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(e);
}
exp->tempCount = exp->__anon1.index.exp->tempCount;
if(exp->__anon1.index.exp->expType)
{
struct Type * source = exp->__anon1.index.exp->expType;

if(source->kind == 8 && source->__anon1._class && source->__anon1._class->__anon1.registered && source->__anon1._class->__anon1.registered != containerClass && __ecereNameSpace__ecere__com__eClass_IsDerived(source->__anon1._class->__anon1.registered, containerClass))
{
struct __ecereNameSpace__ecere__com__Class * _class = source->__anon1._class->__anon1.registered;
unsigned int isArray = 0;
struct __ecereNameSpace__ecere__com__Class * arrayClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "Array");

if(source && __ecereNameSpace__ecere__com__eClass_IsDerived(source->__anon1._class->__anon1.registered, arrayClass))
isArray = 1;
if(isArray && _class->templateArgs)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl = SpecDeclFromString(_class->templateArgs[2].__anon1.__anon1.dataTypeString, specs, (((void *)0)));
struct TypeName * typeName = MkTypeName(specs, MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), decl));

exp->__anon1.index.exp = MkExpBrackets(MkListOne(MkExpCast(typeName, MkExpMember(exp->__anon1.index.exp, MkIdentifier("array")))));
ProcessExpressionType(exp->__anon1.index.exp);
ProcessExpression(exp);
}
else if(isBuiltin && _class->templateArgs)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl = SpecDeclFromString(_class->templateArgs[2].__anon1.__anon1.dataTypeString, specs, (((void *)0)));
struct TypeName * typeName = MkTypeName(specs, MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), decl));

exp->__anon1.index.exp = MkExpBrackets(MkListOne(MkExpCast(typeName, MkExpPointer(MkExpCast(QMkType("BuiltInContainer", QMkPtrDecl((((void *)0)))), exp->__anon1.index.exp), MkIdentifier("data")))));
ProcessExpressionType(exp->__anon1.index.exp);
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

sprintf(iteratorType, "Iterator<%s, %s >", _class->templateArgs[2].__anon1.__anon1.dataTypeString, _class->templateArgs[1].__anon1.__anon1.dataTypeString);
ListAdd(instMembers, MkMemberInit((((void *)0)), MkInitializerAssignment(exp->__anon1.index.exp)));
ListAdd(declarations, MkDeclarationInst(MkInstantiationNamed(MkListOne(MkSpecifierName(iteratorType)), MkExpIdentifier(MkIdentifier("__internalIterator")), MkListOne(MkMembersInitList(instMembers)))));
ListAdd(args, MkExpBrackets(exp->__anon1.index.index));
ListAdd(args, ((unsigned int)((exp->usage & 0x2) >> 1)) ? MkExpIdentifier(MkIdentifier("true")) : MkExpIdentifier(MkIdentifier("false")));
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier("__internalIterator")), MkIdentifier("Index")), args))));
ListAdd(statements, MkExpressionStmt(MkListOne(MkExpMember(MkExpIdentifier(MkIdentifier("__internalIterator")), MkIdentifier("data")))));
exp->type = 5;
exp->__anon1.list = MkListOne(expExt = (MkExpExtensionCompound(MkCompoundStmt(declarations, statements))));
expExt->__anon1.compound->__anon1.compound.context = context;
PopContext(context);
expExt->usage = exp->usage;
ProcessExpressionType((*exp->__anon1.list).first);
ProcessExpressionInstPass((*exp->__anon1.list).first);
ProcessExpression((*exp->__anon1.list).first);
}
}
}
break;
}
case 7:
{
struct Expression * e;
unsigned int typedObject = 0;
struct Type * ellipsisDestType = (((void *)0));
unsigned int usedEllipsis = 0;

if(exp->__anon1.call.arguments)
{
for(e = (*exp->__anon1.call.arguments).first; e; e = e->next)
{
int __simpleStruct2, __simpleStruct3;
int __simpleStruct0, __simpleStruct1;

e->usage = (e->usage & ~0x1) | (((unsigned int)(1)) << 0);
e->usage = (e->usage & ~0x4) | (((unsigned int)(1)) << 2);
e->tempCount = (__simpleStruct0 = e->tempCount, __simpleStruct1 = exp->tempCount, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
ProcessExpression(e);
exp->tempCount = (__simpleStruct2 = exp->tempCount, __simpleStruct3 = e->tempCount, (__simpleStruct2 > __simpleStruct3) ? __simpleStruct2 : __simpleStruct3);
}
}
exp->__anon1.call.exp->usage = (exp->__anon1.call.exp->usage & ~0x1) | (((unsigned int)(1)) << 0);
exp->__anon1.call.exp->usage = (exp->__anon1.call.exp->usage & ~0x8) | (((unsigned int)(1)) << 3);
exp->__anon1.call.exp->tempCount = exp->tempCount;
ProcessExpression(exp->__anon1.call.exp);
if(exp->__anon1.call.exp->expType && exp->__anon1.call.exp->expType->kind == 16)
{
unsigned int nullMemberExp = 0;
struct Expression * memberExp = (exp->__anon1.call.exp->type == 8) ? exp->__anon1.call.exp : (((void *)0));
struct __ecereNameSpace__ecere__com__Class * _class = exp->__anon1.call.exp->expType->__anon1.__anon3.methodClass;
struct __ecereNameSpace__ecere__com__Class * argClass = exp->__anon1.call.exp->expType->__anon1.__anon3.methodClass;
struct __ecereNameSpace__ecere__com__Method * method = exp->__anon1.call.exp->expType->__anon1.__anon3.method;

if(method->type == 1)
{
char name[1024];
struct TypeName * typeName;
struct Declarator * decl;
struct Context * back;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

strcpy(name, "__ecereVMethodID_");
FullClassNameCat(name, method->_class->fullName, 0);
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
if(method->dataType && !method->dataType->__anon1.__anon2.staticMethod)
{
struct Declarator * funcDecl = GetFuncDecl(decl);

if(!funcDecl->__anon1.function.parameters)
funcDecl->__anon1.function.parameters = MkList();
{
struct TypeName * firstParam = ((struct TypeName *)(*funcDecl->__anon1.function.parameters).first);
struct Specifier * firstSpec = firstParam ? (*firstParam->qualifiers).first : (((void *)0));

if(firstParam && firstSpec && firstSpec->type == 0 && firstSpec->__anon1.specifier == VOID && !firstParam->declarator)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*funcDecl->__anon1.function.parameters), (*funcDecl->__anon1.function.parameters).first);
FreeTypeName(firstParam);
}
}
if(method->dataType->__anon1.__anon2.thisClass && !strcmp(method->dataType->__anon1.__anon2.thisClass->string, "class"))
{
struct TypeName * param;

typedObject = 1;
param = MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0))));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*param->qualifiers), (((void *)0)), MkSpecifier(CONST));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->__anon1.function.parameters), (((void *)0)), param);
if(!method->dataType->extraParam)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->__anon1.function.parameters), (((void *)0)), MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier("__ecereNameSpace__ecere__com__Class"), (((void *)0)))), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))));
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*funcDecl->__anon1.function.parameters), (((void *)0)), MkTypeName(MkListOne(MkSpecifierName(method->dataType->__anon1.__anon2.thisClass ? method->dataType->__anon1.__anon2.thisClass->string : method->_class->fullName)), (((void *)0))));
}
}
typeName = MkTypeName(specs, decl);
if(memberExp && memberExp->__anon1.member.exp->expType)
{
struct Type * type = memberExp->__anon1.member.exp->expType;

if(type->kind == 8 && type->__anon1._class && type->__anon1._class->__anon1.registered)
{
struct __ecereNameSpace__ecere__com__Class * regClass = type->__anon1._class->__anon1.registered;
int classType = regClass->type;

if(classType != 0 || !strcmp(regClass->dataTypeString, "char *") || method->dataType->byReference)
argClass = regClass;
}
else if(type->kind == 19)
{
argClass = FindClass("ecere::com::Class")->__anon1.registered;
}
else if((type->kind == 12 || type->kind == 13) && type->__anon1.type && type->__anon1.type->kind == 1)
{
argClass = FindClass("char *")->__anon1.registered;
}
else if(type->kind == 13)
{
argClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "uintptr");
FreeType(memberExp->__anon1.member.exp->expType);
memberExp->__anon1.member.exp->expType = ProcessTypeString("uintptr", 0);
memberExp->__anon1.member.exp->byReference = 1;
}
else
{
char string[1024] = "";
struct Symbol * classSym;

PrintTypeNoConst(type, string, 0, 1);
classSym = FindClass(string);
if(classSym)
argClass = classSym->__anon1.registered;
}
}
{
struct Type * type = memberExp ? memberExp->__anon1.member.exp->expType : (((void *)0));
struct __ecereNameSpace__ecere__com__Class * regClass = (type && type->kind == 8 && type->__anon1._class) ? type->__anon1._class->__anon1.registered : (((void *)0));
char className[1024];

if(!exp->__anon1.call.exp->expType->__anon1.__anon3.methodClass && !_class && type && type->classObjectType)
strcpy(className, "class");
else
{
struct __ecereNameSpace__ecere__com__Class * cl = _class;

if(!cl && argClass && strcmp(argClass->fullName, "class"))
cl = argClass;
if(!cl)
cl = regClass;
if(!cl)
cl = __ecereClass_int;
if(cl->templateClass && !_class && exp->__anon1.call.exp->expType->__anon1._class && !exp->__anon1.call.exp->expType->__anon1.__anon3.methodClass && (type->kind == 19 || (regClass && regClass->type == 0 && strcmp(regClass->dataTypeString, "char *"))))
cl = cl->templateClass;
strcpy(className, "__ecereClass_");
FullClassNameCat(className, cl->fullName, 1);
if(!cl->symbol)
cl->symbol = FindClass(cl->fullName);
DeclareClass(cl->symbol, className);
}
if(type && type->kind == 19 && !_class && !exp->__anon1.call.exp->expType->__anon1.__anon3.methodClass && memberExp)
{
exp->__anon1.call.exp = MkExpBrackets(MkListOne(MkExpCast(typeName, MkExpIndex(MkExpPointer(CopyExpression(memberExp->__anon1.member.exp), MkIdentifier("_vTbl")), MkListOne(MkExpIdentifier(MkIdentifier(name)))))));
}
else if(_class || exp->__anon1.call.exp->expType->__anon1.__anon3.methodClass || !memberExp || !regClass || regClass->type != 0 || !strcmp(regClass->dataTypeString, "char *"))
{
if(!memberExp)
FreeExpression(exp->__anon1.call.exp);
exp->__anon1.call.exp = MkExpBrackets(MkListOne(MkExpCast(typeName, MkExpIndex(MkExpPointer(MkExpIdentifier(MkIdentifier(className)), MkIdentifier("_vTbl")), MkListOne(MkExpIdentifier(MkIdentifier(name)))))));
}
else
{
struct Expression * c;
struct Context * context = PushContext();
struct __ecereNameSpace__ecere__sys__OldList * specs;

c = MkExpExtensionCompound(MkCompoundStmt(MkListOne(MkDeclaration((specs = MkListOne(MkSpecifierName("Instance"))), MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_ClassInst")), MkInitializerAssignment(CopyExpression(memberExp->__anon1.member.exp)))))), MkListOne(MkExpressionStmt(MkListOne(MkExpCondition(MkExpIdentifier(MkIdentifier("__internal_ClassInst")), MkListOne(MkExpPointer(MkExpIdentifier(MkIdentifier("__internal_ClassInst")), MkIdentifier("_vTbl"))), MkExpPointer(MkExpIdentifier(MkIdentifier(className)), MkIdentifier("_vTbl"))))))));
if(__ecereProp_Type_Get_specConst(type))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*specs), (((void *)0)), MkSpecifier(CONST));
c->loc = exp->loc;
c->__anon1.compound->__anon1.compound.context = context;
PopContext(context);
exp->__anon1.call.exp = MkExpBrackets(MkListOne(MkExpCast(typeName, MkExpIndex(c, MkListOne(MkExpIdentifier(MkIdentifier(name)))))));
}
}
}
else
{
char name[1024];

strcpy(name, "__ecereMethod_");
FullClassNameCat(name, method->_class->fullName, 0);
strcat(name, "_");
strcat(name, method->name);
if(!memberExp)
FreeExpression(exp->__anon1.call.exp);
exp->__anon1.call.exp = MkExpIdentifier(MkIdentifier(name));
DeclareMethod(method, name);
if(memberExp && memberExp->expType && method->dataType)
{
exp->__anon1.call.exp->expType = method->dataType;
method->dataType->refCount++;
}
}
if(memberExp && (!memberExp->__anon1.member.exp || !memberExp->__anon1.member.exp->expType || memberExp->__anon1.member.exp->expType->kind != 19))
{
if(method->dataType && !method->dataType->__anon1.__anon2.staticMethod && !method->dataType->extraParam)
{
if(!exp->__anon1.call.arguments)
exp->__anon1.call.arguments = MkList();
if(typedObject && memberExp->__anon1.member.exp && memberExp->__anon1.member.exp->expType)
{
unsigned int changeReference = 0;
struct Expression * memberExpMemberExp = CopyExpression(memberExp->__anon1.member.exp);

if(argClass && (argClass->type == 4 || argClass->type == 3 || argClass->type == 2 || argClass->type == 1000) && strcmp(argClass->fullName, "class") && strcmp(argClass->fullName, "uintptr") && strcmp(argClass->fullName, "intptr"))
changeReference = 1;
if(!memberExp->__anon1.member.exp->expType->classObjectType && ((((memberExp->__anon1.member.exp->expType->kind != 13 && (memberExp->__anon1.member.exp->expType->kind != 8 || !memberExp->__anon1.member.exp->expType->__anon1._class || !memberExp->__anon1.member.exp->expType->__anon1._class->__anon1.registered || memberExp->__anon1.member.exp->expType->__anon1._class->__anon1.registered->type == 1)))) || method->dataType->byReference))
changeReference = 1;
if(typedObject && memberExp->__anon1.member.exp->expType->classObjectType && memberExp->__anon1.member.exp->expType->byReference != method->dataType->byReference)
changeReference = 1;
if(changeReference)
{
if(memberExp->__anon1.member.exp->type == 5 && memberExp->__anon1.member.exp->__anon1.list && (*memberExp->__anon1.member.exp->__anon1.list).count == 1 && ((struct Expression *)(*memberExp->__anon1.member.exp->__anon1.list).first)->type == 4 && ((struct Expression *)(*memberExp->__anon1.member.exp->__anon1.list).first)->__anon1.op.op == '*' && !((struct Expression *)(*memberExp->__anon1.member.exp->__anon1.list).first)->__anon1.op.exp1)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->__anon1.call.arguments), (((void *)0)), ((struct Expression *)(*memberExp->__anon1.member.exp->__anon1.list).first)->__anon1.op.exp2);
((struct Expression *)(*memberExp->__anon1.member.exp->__anon1.list).first)->__anon1.op.exp2 = (((void *)0));
}
else if(memberExp->__anon1.member.exp->type == 4 && memberExp->__anon1.member.exp->__anon1.op.op == '*' && !memberExp->__anon1.member.exp->__anon1.op.exp1)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->__anon1.call.arguments), (((void *)0)), memberExp->__anon1.member.exp->__anon1.op.exp2);
memberExp->__anon1.member.exp->__anon1.op.exp2 = (((void *)0));
}
else if(!memberExp->__anon1.member.exp->byReference)
{
struct Expression * checkedExp = memberExp->__anon1.member.exp;
struct Expression * parentExp = (((void *)0));
struct Expression * newExp;
unsigned int disconnected = 0;

while(((checkedExp->type == 5 || checkedExp->type == 32) && checkedExp->__anon1.list) || checkedExp->type == 11)
{
parentExp = checkedExp;
if(checkedExp->type == 5 || checkedExp->type == 32)
{
checkedExp = (*checkedExp->__anon1.list).last;
if(checkedExp && !disconnected)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*parentExp->__anon1.list), checkedExp);
disconnected = 1;
}
}
else if(checkedExp->type == 11)
{
checkedExp = checkedExp->__anon1.cast.exp;
if(checkedExp && !disconnected)
{
checkedExp->__anon1.cast.exp = (((void *)0));
disconnected = 1;
}
}
}
if(!parentExp)
nullMemberExp = 1;
newExp = (typedObject && !memberExp->__anon1.member.exp->expType->classObjectType) ? checkedExp : MkExpOp((((void *)0)), '&', checkedExp);
if(parentExp && (parentExp->type == 5 || parentExp->type == 32))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*parentExp->__anon1.list), checkedExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*parentExp->__anon1.list), newExp);
}
else if(parentExp && parentExp->type == 11)
{
parentExp->__anon1.cast.exp = newExp;
if(newExp->expType && newExp->expType->classObjectType)
parentExp->__anon1.cast.typeName->declarator = MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), parentExp->__anon1.cast.typeName->declarator);
}
if(typedObject && !memberExp->__anon1.member.exp->expType->classObjectType)
{
struct Type * destType = (destType = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Type), destType->refCount = 1, destType->kind = 8, destType->classObjectType = 3, destType);

FreeType((parentExp ? parentExp : newExp)->expType);
FreeType((parentExp ? parentExp : newExp)->destType);
(parentExp ? parentExp : newExp)->expType = checkedExp->expType;
(parentExp ? parentExp : newExp)->destType = destType;
if(checkedExp->expType)
checkedExp->expType->refCount++;
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->__anon1.call.arguments), (((void *)0)), parentExp ? parentExp : newExp);
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->__anon1.call.arguments), (((void *)0)), memberExp->__anon1.member.exp);
nullMemberExp = 1;
}
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->__anon1.call.arguments), (((void *)0)), memberExp->__anon1.member.exp);
nullMemberExp = 1;
}
{
char className[1024];
struct Type * type = memberExp->__anon1.member.exp ? memberExp->__anon1.member.exp->expType : (((void *)0));
struct __ecereNameSpace__ecere__com__Class * regClass = (type && type->kind == 8 && type->__anon1._class) ? type->__anon1._class->__anon1.registered : (((void *)0));
struct __ecereNameSpace__ecere__com__Class * cl = argClass ? argClass : regClass;

className[0] = (char)0;
if(memberExp->__anon1.member.exp && memberExp->__anon1.member.exp->expType && memberExp->__anon1.member.exp->expType->classObjectType == 2)
strcpy(className, "class");
else if(cl)
{
strcpy(className, "__ecereClass_");
FullClassNameCat(className, cl->fullName, 1);
if(!cl->symbol)
cl->symbol = FindClass(cl->fullName);
DeclareClass(cl->symbol, className);
}
if(className[0])
{
if(memberExp && cl && cl->type == 0 && (!type || type->byReference == 0) && strcmp(cl->dataTypeString, "char *"))
{
struct Expression * c;
struct Context * context = PushContext();
struct __ecereNameSpace__ecere__sys__OldList * specs;

c = MkExpExtensionCompound(MkCompoundStmt(MkListOne(MkDeclaration((specs = MkListOne(MkSpecifierName("Instance"))), MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_ClassInst")), MkInitializerAssignment(memberExpMemberExp))))), MkListOne(MkExpressionStmt(MkListOne(MkExpCondition(MkExpIdentifier(MkIdentifier("__internal_ClassInst")), MkListOne(MkExpPointer(MkExpIdentifier(MkIdentifier("__internal_ClassInst")), MkIdentifier("_class"))), MkExpIdentifier(MkIdentifier(className))))))));
c->__anon1.compound->__anon1.compound.context = context;
PopContext(context);
if(__ecereProp_Type_Get_specConst(type))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*specs), (((void *)0)), MkSpecifier(CONST));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->__anon1.call.arguments), (((void *)0)), c);
memberExpMemberExp = (((void *)0));
}
else
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->__anon1.call.arguments), (((void *)0)), MkExpIdentifier(MkIdentifier(className)));
}
}
if(memberExpMemberExp)
FreeExpression(memberExpMemberExp);
}
else
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->__anon1.call.arguments), (((void *)0)), memberExp->__anon1.member.exp);
nullMemberExp = 1;
}
}
}
if(memberExp)
{
if(nullMemberExp)
memberExp->__anon1.member.exp = (((void *)0));
FreeExpression(memberExp);
}
}
if(exp->__anon1.call.arguments)
{
for(e = (*exp->__anon1.call.arguments).first; e; e = e->next)
{
struct Type * destType = (e->destType && e->destType->kind == 14) ? ellipsisDestType : e->destType;

if(destType && (destType->classObjectType == 2 || destType->classObjectType == 3))
{
if(e->destType && e->destType->kind == 14)
usedEllipsis = 1;
ellipsisDestType = destType;
if(e && e->expType)
{
struct Type * type = e->expType;
struct __ecereNameSpace__ecere__com__Class * _class = (((void *)0));

if(type->kind == 8 && type->__anon1._class && type->__anon1._class->__anon1.registered)
{
_class = type->__anon1._class->__anon1.registered;
}
else if(type->kind == 19)
{
_class = FindClass("ecere::com::Class")->__anon1.registered;
}
else if((type->kind == 12 || type->kind == 13) && type->__anon1.type && type->__anon1.type->kind == 1)
{
_class = FindClass("char *")->__anon1.registered;
}
else if(type->kind == 13)
{
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "uintptr");
FreeType(e->expType);
e->expType = ProcessTypeString("uintptr", 0);
e->byReference = 1;
}
else
{
char string[1024] = "";
struct Symbol * classSym;

PrintTypeNoConst(type, string, 0, 1);
classSym = FindClass(string);
if(classSym)
_class = classSym->__anon1.registered;
}
if((_class && (_class->type == 4 || _class->type == 3 || _class->type == 2 || _class->type == 1000) && strcmp(_class->fullName, "class") && strcmp(_class->fullName, "uintptr") && strcmp(_class->fullName, "intptr")) || (!e->expType->classObjectType && (((type->kind != 13 && type->kind != 22 && type->kind != 19 && type->kind != 12 && (type->kind != 8 || !type->__anon1._class || !type->__anon1._class->__anon1.registered || type->__anon1._class->__anon1.registered->type == 1))) || destType->byReference)))
{
{
struct Expression * checkedExp;
struct Expression * parentExp;
struct Expression * newExp;

checkedExp = e;
parentExp = exp;
while(((checkedExp->type == 5 || checkedExp->type == 32 || checkedExp->type == 23) && checkedExp->__anon1.list) || checkedExp->type == 11)
{
parentExp = checkedExp;
if(checkedExp->type == 5 || checkedExp->type == 32 || checkedExp->type == 23)
{
if(checkedExp->type == 23)
{
checkedExp = (*((struct Statement *)(*checkedExp->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions).last;
}
else
checkedExp = (*checkedExp->__anon1.list).last;
}
else if(checkedExp->type == 11)
checkedExp = checkedExp->__anon1.cast.exp;
}
if(checkedExp && checkedExp->type == 4 && checkedExp->__anon1.op.op == '*' && !checkedExp->__anon1.op.exp1)
{
newExp = checkedExp->__anon1.op.exp2;
checkedExp->__anon1.op.exp2 = (((void *)0));
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
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->__anon1.call.arguments), e->prev, newExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*exp->__anon1.call.arguments), e);
e = newExp;
}
else if(parentExp->type == 5 || parentExp->type == 32)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*parentExp->__anon1.list), checkedExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*parentExp->__anon1.list), newExp);
}
else if(parentExp->type == 11)
{
if(parentExp->destType && parentExp->destType->kind == 14)
{
FreeTypeName(parentExp->__anon1.cast.typeName);
parentExp->__anon1.cast.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0))));
}
parentExp->__anon1.cast.exp = newExp;
}
else if(parentExp->type == 23)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*((struct Statement *)(*parentExp->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions), checkedExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*((struct Statement *)(*parentExp->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions), newExp);
}
e->byReference = 1;
FreeType(checkedExp->expType);
FreeType(checkedExp->destType);
((checkedExp ? (__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor((void *)checkedExp) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(checkedExp)) : 0), checkedExp = 0);
}
else if((!e->byReference && (!e->expType || !e->expType->classObjectType)) || (_class && _class->type == 5))
{
struct Expression * checkedExp;
struct Expression * parentExp;
struct Expression * newExp;

{
unsigned int hasAddress = e->type == 0 || (e->type == 8 && e->__anon1.member.memberType == 3) || (e->type == 9 && e->__anon1.member.memberType == 3) || (e->type == 4 && !e->__anon1.op.exp1 && e->__anon1.op.op == '*') || e->type == 6;

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
PrintTypeNoConst(e->expType, typeString, 0, 1);
decl = SpecDeclFromString(typeString, specs, (((void *)0)));
newExp->destType = ProcessType(specs, decl);
curContext = context;
e->type = 23;
if(curCompound)
{
char name[100];
struct __ecereNameSpace__ecere__sys__OldList * stmts = MkList();

sprintf(name, "__internalValue%03X", internalValueCounter++);
if(!curCompound->__anon1.compound.declarations)
curCompound->__anon1.compound.declarations = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*curCompound->__anon1.compound.declarations), (((void *)0)), MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(name)), (((void *)0))))));
ListAdd(stmts, MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(name)), '=', newExp))));
ListAdd(stmts, MkExpressionStmt(MkListOne(MkExpIdentifier(MkIdentifier(name)))));
e->__anon1.compound = MkCompoundStmt((((void *)0)), stmts);
}
else
printf("libec: compiler error, curCompound is null in ApplyAnyObjectLogic\n");
e->__anon1.compound->__anon1.compound.context = context;
PopContext(context);
curContext = context->parent;
}
}
checkedExp = e;
parentExp = exp;
while(((checkedExp->type == 5 || checkedExp->type == 32 || checkedExp->type == 23) && checkedExp->__anon1.list) || checkedExp->type == 11)
{
parentExp = checkedExp;
if(checkedExp->type == 5 || checkedExp->type == 32 || checkedExp->type == 23)
{
if(checkedExp->type == 23)
{
checkedExp = (*((struct Statement *)(*checkedExp->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions).last;
}
else
checkedExp = (*checkedExp->__anon1.list).last;
}
else if(checkedExp->type == 11)
checkedExp = checkedExp->__anon1.cast.exp;
}
newExp = MkExpOp((((void *)0)), '&', checkedExp);
newExp->byReference = 1;
if(parentExp->type == 7)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->__anon1.call.arguments), e->prev, newExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*exp->__anon1.call.arguments), e);
e = newExp;
}
else if(parentExp->type == 5 || parentExp->type == 32)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*parentExp->__anon1.list), checkedExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*parentExp->__anon1.list), newExp);
}
else if(parentExp->type == 11)
parentExp->__anon1.cast.exp = newExp;
else if(parentExp->type == 5 || parentExp->type == 23)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*((struct Statement *)(*parentExp->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions), checkedExp);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*((struct Statement *)(*parentExp->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions), newExp);
}
}
}
}
if(destType->classObjectType == 2)
{
char className[1024];

if(!_class && type->kind == 13 && type->__anon1.type && type->__anon1.type->kind == 1)
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
FullClassNameCat(className, _class->fullName, 1);
if(!_class->symbol)
_class->symbol = FindClass(_class->fullName);
DeclareClass(_class->symbol, className);
}
if(_class->type == 0 && destType->byReference == 0 && strcmp(_class->dataTypeString, "char *"))
{
struct Expression * c;
struct Context * context = PushContext();

if(_class->templateClass && !strcmp(_class->templateClass->name, "Container") && e->__anon1.list && (*e->__anon1.list).first && ((struct Expression *)(*e->__anon1.list).first)->type == 11 && ((struct Expression *)(*e->__anon1.list).first)->__anon1.cast.exp && ((struct Expression *)(*e->__anon1.list).first)->__anon1.cast.exp->type == 4 && ((struct Expression *)(*e->__anon1.list).first)->__anon1.cast.exp->__anon1.op.op == '&' && ((struct Expression *)(*e->__anon1.list).first)->__anon1.cast.exp->__anon1.op.exp2 && ((struct Expression *)(*e->__anon1.list).first)->__anon1.cast.exp->__anon1.op.exp2->type == 33)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->__anon1.call.arguments), e->prev, MkExpIdentifier(MkIdentifier(className)));
}
else
{
struct __ecereNameSpace__ecere__sys__OldList * specs;

c = MkExpExtensionCompound(MkCompoundStmt(MkListOne(MkDeclaration((specs = MkListOne(MkSpecifierName("Instance"))), MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_ClassInst")), MkInitializerAssignment(CopyExpression(e)))))), MkListOne(MkExpressionStmt(MkListOne(MkExpCondition(MkExpIdentifier(MkIdentifier("__internal_ClassInst")), MkListOne(MkExpPointer(MkExpIdentifier(MkIdentifier("__internal_ClassInst")), MkIdentifier("_class"))), MkExpIdentifier(MkIdentifier(className))))))));
c->__anon1.compound->__anon1.compound.context = context;
PopContext(context);
if(__ecereProp_Type_Get_specConst(type))
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*specs), (((void *)0)), MkSpecifier(CONST));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->__anon1.call.arguments), e->prev, c);
}
}
else
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->__anon1.call.arguments), e->prev, MkExpIdentifier(MkIdentifier(className)));
}
}
}
{
FixReference(e, !destType || !destType->declaredWithStruct);
}
}
if(ellipsisDestType)
{
if(usedEllipsis || (exp->__anon1.call.exp->expType && exp->__anon1.call.exp->expType->kind == 11 && exp->__anon1.call.exp->expType->__anon1.__anon2.params.last && ((struct Type *)exp->__anon1.call.exp->expType->__anon1.__anon2.params.last)->kind == 14))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*exp->__anon1.call.arguments), (*exp->__anon1.call.arguments).last, MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), MkExpConstant("0")));
}
}
}
break;
}
case 8:
{
unsigned int changeToPtr = 0;
unsigned int noHead = 0;
struct Type * type = exp->__anon1.member.exp ? exp->__anon1.member.exp->expType : (((void *)0));
struct Specifier * memberClassSpecifier = exp->__anon1.member.member ? exp->__anon1.member.member->_class : (((void *)0));

if(exp->__anon1.member.member)
exp->__anon1.member.member->_class = (((void *)0));
if(type && type->kind == 20)
{
struct Type * baseType = ProcessTemplateParameterType(type->__anon1.templateParameter);

if(baseType)
type = baseType;
}
if(type && exp->__anon1.member.member && !type->directClassAccess)
{
struct __ecereNameSpace__ecere__com__Class * _class = exp->__anon1.member.member->classSym ? exp->__anon1.member.member->classSym->__anon1.registered : (((type->kind == 8 || type->kind == 19) && type->__anon1._class) ? type->__anon1._class->__anon1.registered : (((void *)0)));
struct __ecereNameSpace__ecere__com__Property * prop = (((void *)0));
struct __ecereNameSpace__ecere__com__ClassProperty * classProperty = (((void *)0));
struct __ecereNameSpace__ecere__com__Method * method = (((void *)0));
struct __ecereNameSpace__ecere__com__Class * convertTo = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * member = (((void *)0));
struct __ecereNameSpace__ecere__com__DataMember * subMemberStack[256];
int subMemberStackPos = 0;
unsigned int thisPtr = exp->__anon1.member.thisPtr;

if(type->kind == 19 && exp->__anon1.member.exp->type == 24)
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "ecere::com::Class");
if(!_class)
{
char string[2048] = "";
struct Symbol * classSym;

PrintTypeNoConst(type, string, 0, 1);
classSym = FindClass(string);
_class = classSym ? classSym->__anon1.registered : (((void *)0));
}
if(_class && exp->__anon1.member.memberType == 3)
{
if(!thisPtr && !exp->__anon1.member.member->classSym)
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, exp->__anon1.member.member->string, (((void *)0)), subMemberStack, &subMemberStackPos);
if(!member)
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, exp->__anon1.member.member->string, privateModule, subMemberStack, &subMemberStackPos);
}
else if(_class && exp->__anon1.member.memberType == 1)
{
if(!thisPtr && !exp->__anon1.member.member->classSym)
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, exp->__anon1.member.member->string, (((void *)0)));
if(!prop)
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, exp->__anon1.member.member->string, privateModule);
if(prop && (((unsigned int)((exp->usage & 0x40) >> 6)) || (((unsigned int)((exp->usage & 0x1) >> 0)) && !prop->Get && !prop->conversion) || (((unsigned int)((exp->usage & 0x80) >> 7)) && !prop->Set && !prop->conversion)))
{
member = __ecereNameSpace__ecere__com__eClass_FindDataMember(_class, exp->__anon1.member.member->string, privateModule, subMemberStack, &subMemberStackPos);
if(member)
{
exp->__anon1.member.memberType = 3;
prop = (((void *)0));
}
else
{
if(((unsigned int)((exp->usage & 0x40) >> 6)))
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "cannot obtain address of property\n", (((void *)0))));
else if(!prop->Get)
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "no get defined for property %s of class %s\n", (((void *)0))), prop->name, prop->_class->fullName);
else if(((unsigned int)((exp->usage & 0x80) >> 7)))
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "no get defined for property %s of class %s\n", (((void *)0))), prop->name, prop->_class->fullName);
}
}
}
else if(_class && exp->__anon1.member.memberType == 2)
{
if(!thisPtr)
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, exp->__anon1.member.member->string, (((void *)0)));
if(!method)
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, exp->__anon1.member.member->string, privateModule);
}
else if(_class && exp->__anon1.member.memberType == 4)
{
convertTo = _class;
_class = FindClass(exp->__anon1.member.member->string)->__anon1.registered;
prop = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, convertTo->fullName, privateModule);
}
else if(_class && exp->__anon1.member.memberType == 5)
{
classProperty = __ecereNameSpace__ecere__com__eClass_FindClassProperty(_class, exp->__anon1.member.member->string);
}
if(prop)
{
if(((unsigned int)((exp->usage & 0x1) >> 0)))
{
if(prop->Get)
{
char getName[1024], setName[1024];
struct Expression * ptr = exp->__anon1.member.exp;
struct __ecereNameSpace__ecere__com__Class * propertyClass;
char * nameToUse = convertTo ? setName : getName;

FreeIdentifier(exp->__anon1.member.member);
exp->__anon1.member.exp->usage = (exp->__anon1.member.exp->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(exp->__anon1.member.exp);
DeclareProperty(prop, setName, getName);
propertyClass = convertTo ? _class : ((((struct Symbol *)prop->symbol)->type && ((struct Symbol *)prop->symbol)->type->kind == 8) ? ((struct Symbol *)prop->symbol)->type->__anon1._class->__anon1.registered : ((struct Symbol *)prop->symbol)->_class);
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
if(!curCompound->__anon1.compound.declarations)
curCompound->__anon1.compound.declarations = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*curCompound->__anon1.compound.declarations), (((void *)0)), decl);
tempExp = QMkExpId(className);
tempExp->expType = MkClassType(propertyClass->fullName);
exp->__anon1.op.exp1 = tempExp;
exp->__anon1.op.exp2 = MkExpCall(QMkExpId(nameToUse), args);
exp->__anon1.op.op = '=';
exp->type = 4;
}
else
{
exp->type = 7;
exp->__anon1.call.exp = QMkExpId(nameToUse);
exp->__anon1.call.arguments = args;
}
ListAdd(args, FixReference(ptr, 1));
}
else if(propertyClass && propertyClass->type == 3)
{
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

ListAdd(args, FixReference(ptr, 1));
exp->type = 7;
exp->__anon1.call.exp = QMkExpId(nameToUse);
exp->__anon1.call.arguments = args;
}
else if(propertyClass && propertyClass->type == 1)
{
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();
char className[1024];
struct Declaration * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList(), * decls = MkList();
struct Expression * tempExp;

className[0] = (char)0;
FullClassNameCat(className, propertyClass->fullName, 0);
ListAdd(specs, MkStructOrUnion(3, MkIdentifier(className), (((void *)0))));
sprintf(className, "__simpleStruct%d", curContext->simpleID++);
ListAdd(decls, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(className)), (((void *)0))));
decl = MkDeclaration(specs, decls);
if(curCompound)
{
if(!curCompound->__anon1.compound.declarations)
curCompound->__anon1.compound.declarations = MkList();
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*curCompound->__anon1.compound.declarations), (((void *)0)), decl);
}
tempExp = QMkExpId(className);
tempExp->expType = MkClassType(propertyClass->fullName);
if(convertTo)
{
ListAdd(args, FixReference(CopyExpression(tempExp), 1));
ListAdd(args, FixReference(ptr, 1));
}
else
{
ListAdd(args, FixReference(ptr, 1));
ListAdd(args, FixReference(CopyExpression(tempExp), 1));
}
if(((unsigned int)((exp->usage & 0x20) >> 5)))
{
exp->type = 7;
exp->__anon1.call.exp = QMkExpId(nameToUse);
exp->__anon1.call.arguments = args;
FreeExpression(tempExp);
}
else
{
exp->type = 5;
exp->__anon1.list = MkList();
ListAdd(exp->__anon1.list, MkExpCall(QMkExpId(nameToUse), args));
if(((unsigned int)((exp->usage & 0x10) >> 4)))
{
ListAdd(exp->__anon1.list, FixReference(tempExp, 1));
exp->byReference = 1;
}
else
ListAdd(exp->__anon1.list, tempExp);
}
}
else
{
exp->type = 7;
exp->__anon1.call.exp = QMkExpId(nameToUse);
exp->__anon1.call.arguments = MkList();
ListAdd(exp->__anon1.call.arguments, FixReference(ptr, 1));
}
}
else if(prop->conversion)
{
void * prev = exp->prev, * next = exp->next;

*exp = *exp->__anon1.member.exp;
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
struct Identifier * id = exp->__anon1.member.member;
struct Expression * classExp = exp->__anon1.member.exp;
struct __ecereNameSpace__ecere__sys__OldList * args = MkList();

exp->type = 11;
if(exp->expType)
{
char typeString[2048];
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;

typeString[0] = (char)0;
PrintType(exp->expType, typeString, 0, 0);
decl = SpecDeclFromString(typeString, specs, (((void *)0)));
exp->__anon1.cast.typeName = MkTypeName(specs, decl);
}
else
exp->__anon1.cast.typeName = QMkType("uint64", (((void *)0)));
exp->__anon1.cast.exp = MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eClass_GetProperty")), args);
ListAdd(args, classExp);
{
char * s = QMkString(id->string);

ListAdd(args, MkExpString(s));
(__ecereNameSpace__ecere__com__eSystem_Delete(s), s = 0);
}
FreeIdentifier(id);
ProcessExpression(exp);
return ;
}
}
}
else if(method)
{
if((((unsigned int)((exp->usage & 0x1) >> 0)) || exp->__anon1.member.exp->expType->kind == 19) && !((unsigned int)((exp->usage & 0x8) >> 3)))
{
char name[1024];

FreeIdentifier(exp->__anon1.member.member);
exp->__anon1.member.exp->usage = (exp->__anon1.member.exp->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(exp->__anon1.member.exp);
if(method->type == 1)
{
strcpy(name, "__ecereVMethodID_");
FullClassNameCat(name, method->_class->fullName, 0);
strcat(name, "_");
strcat(name, method->name);
exp->type = 6;
if(memberClassSpecifier)
{
char className[1024];

strcpy(className, "__ecereClass_");
FullClassNameCat(className, _class->fullName, 1);
if(!_class->symbol)
_class->symbol = FindClass(_class->fullName);
DeclareClass(_class->symbol, className);
FreeExpression(exp->__anon1.member.exp);
exp->__anon1.index.exp = MkExpPointer(MkExpIdentifier(MkIdentifier(className)), MkIdentifier("_vTbl"));
}
else
{
if(exp->thisPtr && _class->type != 0)
{
FreeExpression(exp->__anon1.member.exp);
exp->__anon1.index.exp = MkExpPointer(MkExpIdentifier(MkIdentifier("class")), MkIdentifier("_vTbl"));
}
else
exp->__anon1.index.exp = MkExpPointer(exp->__anon1.member.exp, MkIdentifier("_vTbl"));
}
exp->__anon1.index.index = MkListOne(QMkExpId(name));
DeclareMethod(method, name);
}
else
{
FreeExpression(exp->__anon1.member.exp);
exp->type = 0;
strcpy(name, "__ecereMethod_");
FullClassNameCat(name, method->_class->fullName, 0);
strcat(name, "_");
strcat(name, method->name);
exp->__anon1.__anon1.identifier = MkIdentifier(name);
DeclareMethod(method, name);
}
}
}
else if(member)
{
if(subMemberStackPos)
{
int i;
struct __ecereNameSpace__ecere__com__DataMember * parentMember = (((void *)0));
char * s, * prefix = (((void *)0));

for(i = 0; i < subMemberStackPos; i++)
{
struct __ecereNameSpace__ecere__com__DataMember * curMember = subMemberStack[i];
struct __ecereNameSpace__ecere__com__DataMember * m;
int anonID = 1;

for(m = parentMember ? parentMember->members.first : _class->membersAndProperties.first; m; m = m->next)
{
if(m && !m->isProperty && (m->type == 1 || m->type == 2) && !m->name)
{
if(m == curMember)
break;
anonID++;
}
}
if(prefix)
{
s = prefix;
prefix = __ecereNameSpace__ecere__com__PrintString(__ecereClass_String, prefix, __ecereClass_char__PTR_, ".__anon", __ecereClass_int, &anonID, (void *)0);
(__ecereNameSpace__ecere__com__eSystem_Delete(s), s = 0);
}
else
prefix = __ecereNameSpace__ecere__com__PrintString(__ecereClass_char__PTR_, "__anon", __ecereClass_int, &anonID, (void *)0);
parentMember = curMember;
}
s = exp->__anon1.member.member->string;
exp->__anon1.member.member->string = __ecereNameSpace__ecere__com__PrintString(__ecereClass_String, prefix, __ecereClass_char__PTR_, ".", __ecereClass_String, s, (void *)0);
(__ecereNameSpace__ecere__com__eSystem_Delete(prefix), prefix = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(s), s = 0);
}
if(((unsigned int)((exp->usage & 0x1) >> 0)))
{
exp->__anon1.member.exp->usage = (exp->__anon1.member.exp->usage & ~0x1) | (((unsigned int)(1)) << 0);
}
ProcessExpression(exp->__anon1.member.exp);
if(type->kind == 8 && type->__anon1._class && type->__anon1._class->__anon1.registered)
DeclareStruct(type->__anon1._class->__anon1.registered->fullName, 0);
if(_class->type == 5)
{
noHead = 1;
}
else if(_class->type == 1)
{
changeToPtr = 1;
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
sprintf(mask, ((__runtimePlatform == 1) ? "0x%I64XLL" : "0x%llXLL"), bitMember->mask);
else
sprintf(mask, ((__runtimePlatform == 1) ? "0x%I64X" : "0x%llX"), bitMember->mask);
sprintf(shift, "%d", bitMember->pos);
FreeIdentifier(exp->__anon1.member.member);
ListAdd(list, MkExpCast(type, MkExpBrackets(MkListOne(MkExpOp(MkExpBrackets(MkListOne(MkExpOp(exp->__anon1.member.exp, '&', MkExpConstant(mask)))), RIGHT_OP, MkExpConstant(shift))))));
exp->type = 5;
exp->__anon1.list = list;
}
else if(_class->type == 3)
{
}
else
{
if(exp->__anon1.member.exp->type == 0 && thisPtr && type->kind == 8 && (!exp->__anon1.member.exp->expType || !exp->__anon1.member.exp->expType->typedByReference))
{
char pointerName[1024];

strcpy(pointerName, "__ecerePointer_");
FullClassNameCat(pointerName, type->__anon1._class->__anon1.registered->fullName, 0);
if(exp->__anon1.member.exp->__anon1.__anon1.identifier)
FreeIdentifier(exp->__anon1.member.exp->__anon1.__anon1.identifier);
exp->__anon1.member.exp->__anon1.__anon1.identifier = MkIdentifier(pointerName);
}
else
{
struct Expression * bytePtr, * e;
struct Expression * checkedExp;
char structName[1024];
char className[1024];

strcpy(className, "__ecereClass_");
FullClassNameCat(className, member->_class->fullName, 1);
if(!member->_class->symbol)
member->_class->symbol = FindClass(member->_class->fullName);
DeclareClass(member->_class->symbol, className);
DeclareStruct(member->_class->fullName, 0);
structName[0] = (char)0;
FullClassNameCat(structName, member->_class->fullName, 0);
checkedExp = exp->__anon1.member.exp;
while(((checkedExp->type == 5 || checkedExp->type == 32) && checkedExp->__anon1.list && (*checkedExp->__anon1.list).count == 1) || checkedExp->type == 11)
{
if(checkedExp->type == 5 || checkedExp->type == 32)
checkedExp = (*checkedExp->__anon1.list).last;
else if(checkedExp->type == 11)
checkedExp = checkedExp->__anon1.cast.exp;
}
if(checkedExp->type != 0 && checkedExp->type != 2 && checkedExp->type != 8 && checkedExp->type != 9)
{
int __simpleStruct0, __simpleStruct1;
char ecereTemp[100];
struct Statement * compound;
struct Context * context = PushContext();

if(exp->__anon1.member.exp->tempCount > exp->tempCount)
exp->tempCount = exp->__anon1.member.exp->tempCount;
exp->tempCount++;
curExternal->__anon1.function->tempCount = (__simpleStruct0 = curExternal->__anon1.function->tempCount, __simpleStruct1 = exp->tempCount, (__simpleStruct0 > __simpleStruct1) ? __simpleStruct0 : __simpleStruct1);
sprintf(ecereTemp, "__ecTemp%d", exp->tempCount);
curContext = context;
compound = MkCompoundStmt(MkListOne(MkDeclaration(MkListOne(MkSpecifier(CHAR)), MkListOne(MkInitDeclarator(MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(MkIdentifier(ecereTemp))), MkInitializerAssignment(QBrackets(exp->__anon1.member.exp)))))), (((void *)0)));
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
compound->__anon1.compound.context = context;
compound->__anon1.compound.statements = MkListOne(MkExpressionStmt(MkListOne(QBrackets(MkExpCast(MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(structName), (((void *)0)))), MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), (((void *)0)))), e)))));
exp->__anon1.member.exp = MkExpExtensionCompound(compound);
PopContext(context);
curContext = context->parent;
}
else
{
bytePtr = MkExpCast(QMkType("char", QMkPtrDecl((((void *)0)))), exp->__anon1.member.exp);
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
exp->__anon1.member.exp = QBrackets(MkExpCast(MkTypeName(MkListOne(MkStructOrUnion(3, MkIdentifier(structName), (((void *)0)))), QMkPtrDecl((((void *)0)))), e));
}
}
exp->type = 9;
}
}
}
FreeSpecifier(memberClassSpecifier);
if(exp->__anon1.member.exp && (exp->type == 8 || exp->type == 9))
{
exp->__anon1.member.exp->usage = (exp->__anon1.member.exp->usage & ~0x1) | (((unsigned int)(1)) << 0);
exp->__anon1.member.exp->usage = (exp->__anon1.member.exp->usage & ~0x10) | (((unsigned int)(1)) << 4);
exp->__anon1.member.exp->tempCount = exp->tempCount;
ProcessExpression(exp->__anon1.member.exp);
exp->tempCount = exp->__anon1.member.exp->tempCount;
if((changeToPtr && exp->__anon1.member.exp->byReference) || noHead)
exp->type = 9;
}
break;
}
case 23:
{
struct Expression * e = (*((struct Statement *)(*exp->__anon1.compound->__anon1.compound.statements).last)->__anon1.expressions).last;

if(e)
e->usage |= exp->usage & (((unsigned int)(1)) | (((unsigned int)(1)) << 2) | (((unsigned int)(1)) << 4));
ProcessStatement(exp->__anon1.compound);
break;
}
case 9:
{
exp->__anon1.member.exp->usage = (exp->__anon1.member.exp->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(exp->__anon1.member.exp);
break;
}
case 10:
{
struct Specifier * spec = exp->__anon1.typeName->qualifiers ? (*exp->__anon1.typeName->qualifiers).first : (((void *)0));

if(spec && spec->type == 8 && !exp->__anon1.typeName->declarator)
{
struct Expression * argExp = GetTemplateArgExp(spec->__anon1.templateParameter, thisClass, 0);

if(argExp)
{
struct Expression * classExp;

FreeTypeName(exp->__anon1.typeName);
classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
ProcessExpressionType(classExp);
ProcessExpression(classExp);
exp->type = 5;
exp->__anon1.list = MkListOne(MkExpMember(classExp, MkIdentifier("typeSize")));
ProcessExpressionType(exp);
ProcessExpression(exp);
}
}
break;
}
case 11:
{
if(exp->__anon1.cast.exp)
{
exp->__anon1.cast.exp->usage |= exp->usage & (((unsigned int)(1)) | (((unsigned int)(1)) << 4));
ProcessExpression(exp->__anon1.cast.exp);
if(exp->__anon1.cast.exp->byReference)
exp->byReference = exp->__anon1.cast.exp->byReference;
if(exp->expType && exp->expType->kind == 8 && exp->expType->__anon1._class && exp->expType->__anon1._class->__anon1.registered && exp->expType->__anon1._class->__anon1.registered->type == 1 && exp->__anon1.cast.exp->expType && (exp->__anon1.cast.exp->expType->kind == 13 || exp->__anon1.cast.exp->expType->kind == 12 || (exp->__anon1.cast.exp->expType->kind == 8 && exp->__anon1.cast.exp->expType->__anon1._class && exp->__anon1.cast.exp->expType->__anon1._class->__anon1.registered && !strcmp(exp->__anon1.cast.exp->expType->__anon1._class->__anon1.registered->dataTypeString, "char *"))))
exp->byReference = 1;
}
break;
}
case 12:
{
struct Expression * e;

if(((unsigned int)((exp->usage & 0x1) >> 0)))
exp->__anon1.cond.cond->usage = (exp->__anon1.cond.cond->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(exp->__anon1.cond.cond);
for(e = (*exp->__anon1.cond.exp).first; e; e = e->next)
{
if(!e->next && ((unsigned int)((exp->usage & 0x1) >> 0)))
e->usage = (e->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(e);
}
if(((unsigned int)((exp->usage & 0x1) >> 0)))
exp->__anon1.cond.elseExp->usage = (exp->__anon1.cond.elseExp->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(exp->__anon1.cond.elseExp);
break;
}
case 24:
{
if(exp->__anon1._classExp.specifiers && (*exp->__anon1._classExp.specifiers).first && ((struct Specifier *)(*exp->__anon1._classExp.specifiers).first)->type == 8)
{
struct Specifier * spec = (*exp->__anon1._classExp.specifiers).first;
struct Expression * argExp = GetTemplateArgExp(spec->__anon1.templateParameter, thisClass, 1);

if(argExp)
{
FreeList(exp->__anon1._classExp.specifiers, (void *)(FreeSpecifier));
if(exp->__anon1._classExp.decl)
FreeDeclarator(exp->__anon1._classExp.decl);
exp->type = 8;
exp->__anon1.member.exp = argExp;
exp->__anon1.member.member = MkIdentifier("dataTypeClass");
exp->__anon1.member.memberType = 3;
ProcessExpressionType(argExp);
ProcessExpressionType(exp);
ProcessExpression(exp);
}
}
else
{
char className[1024];
char * string = StringFromSpecDecl(exp->__anon1._classExp.specifiers, exp->__anon1._classExp.decl);
struct Symbol * classSym = FindClass(string);

strcpy(className, "__ecereClass_");
FullClassNameCat(className, string, 1);
DeclareClass(classSym, className);
(__ecereNameSpace__ecere__com__eSystem_Delete(string), string = 0);
FreeList(exp->__anon1._classExp.specifiers, (void *)(FreeSpecifier));
if(exp->__anon1._classExp.decl)
FreeDeclarator(exp->__anon1._classExp.decl);
exp->type = 0;
exp->__anon1.__anon1.identifier = MkIdentifier(className);
}
break;
}
case 34:
{
ProcessExpression(exp->__anon1.vaArg.exp);
break;
}
case 33:
{
ProcessInitializer(exp->__anon1.initializer.initializer);
break;
}
}
FixRefExp(exp);
if(exp->needTemplateCast != 2 && (exp->needTemplateCast == 1 || (exp->expType && (exp->expType->kind == 20 || exp->expType->passAsTemplate))))
{
struct Expression * nbExp = GetNonBracketsExp(exp);
struct Expression * inner = GetInnerExp(nbExp);

if((!exp->expType || exp->expType->kind != 20 || nbExp->type != 11) && !((unsigned int)((exp->usage & 0x40) >> 6)) && (!exp->destType || (!exp->destType->truth && (exp->destType->kind != 20 || (exp->destType->__anon1.templateParameter && (exp->destType->__anon1.templateParameter->dataTypeString || exp->destType->__anon1.templateParameter->__anon1.dataType))))) && (((unsigned int)((exp->usage & 0x80) >> 7)) || ((unsigned int)((exp->usage & 0x1) >> 0)) || ((unsigned int)((exp->usage & 0x4) >> 2))) && (!exp->destType || (!exp->destType->passAsTemplate && exp->expType && (exp->expType->kind != 13 || exp->destType->kind == 13) && (exp->destType->kind != 13 || exp->expType->kind == 13))) && !inner->needCast && inner->type != 4)
{
struct Expression * e = MoveExpContents(exp);
struct Declarator * decl;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
char typeString[1024];

typeString[0] = '\0';
e->needTemplateCast = 2;
inner->needTemplateCast = 2;
nbExp->needTemplateCast = 2;
if(((unsigned int)((exp->usage & 0x80) >> 7)))
strcpy(typeString, "void *");
else
PrintType(exp->expType, typeString, 0, 0);
decl = SpecDeclFromString(typeString, specs, (((void *)0)));
if(specs && (*specs).first && ((struct Specifier *)(*specs).first)->type == 8 && exp->destType && !exp->destType->passAsTemplate && exp->destType->kind == 20 && exp->destType->__anon1.templateParameter && (exp->destType->__anon1.templateParameter->dataTypeString || exp->destType->__anon1.templateParameter->__anon1.dataType) && !((unsigned int)((exp->usage & 0x4) >> 2)))
{
if(decl)
FreeDeclarator(decl);
FreeList(specs, (void *)(FreeSpecifier));
if(exp->destType->__anon1.templateParameter->dataTypeString)
{
specs = MkList();
strcpy(typeString, exp->destType->__anon1.templateParameter->dataTypeString);
decl = SpecDeclFromString(typeString, specs, (((void *)0)));
}
else
{
specs = CopyList(exp->destType->__anon1.templateParameter->__anon1.dataType->specifiers, (void *)(CopySpecifier));
decl = CopyDeclarator(exp->destType->__anon1.templateParameter->__anon1.dataType->decl);
}
}
e->destType = exp->destType;
if(exp->destType)
exp->destType->refCount++;
exp->type = 5;
exp->__anon1.list = MkListOne(MkExpCast(MkTypeName(specs, decl), MkExpBrackets(MkListOne(e))));
exp->needTemplateCast = 2;
}
}
yylloc = oldyylloc;
}

static void ProcessInitializer(struct Initializer * init)
{
switch(init->type)
{
case 0:
if(init->__anon1.exp)
{
init->__anon1.exp->usage = (init->__anon1.exp->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(init->__anon1.exp);
if(init->__anon1.exp->destType && init->__anon1.exp->destType->kind == 8 && init->__anon1.exp->destType->__anon1._class && init->__anon1.exp->destType->__anon1._class->__anon1.registered && init->__anon1.exp->destType->__anon1._class->__anon1.registered->type == 5)
{
FixReference(init->__anon1.exp, 1);
}
else if(init->__anon1.exp->destType && init->__anon1.exp->destType->kind == 8)
FixReference(init->__anon1.exp, 0);
}
break;
case 1:
{
if(init->__anon1.list)
{
struct Initializer * i;

for(i = (*init->__anon1.list).first; i; i = i->next)
ProcessInitializer(i);
}
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
if(decl->__anon1.__anon1.declarators)
{
struct InitDeclarator * d;

for(d = (*decl->__anon1.__anon1.declarators).first; d; d = d->next)
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
ProcessStatement(stmt->__anon1.labeled.stmt);
break;
case 1:
if(stmt->__anon1.caseStmt.exp)
{
stmt->__anon1.caseStmt.exp->usage = (stmt->__anon1.caseStmt.exp->usage & ~0x1) | (((unsigned int)(1)) << 0);
ProcessExpression(stmt->__anon1.caseStmt.exp);
}
if(stmt->__anon1.caseStmt.stmt)
ProcessStatement(stmt->__anon1.caseStmt.stmt);
break;
case 2:
{
if(stmt->__anon1.compound.context)
{
struct Declaration * decl;
struct Statement * s;
struct Statement * prevCompound = curCompound;
struct Context * prevContext = curContext;

if(!stmt->__anon1.compound.isSwitch)
{
curCompound = stmt;
curContext = stmt->__anon1.compound.context;
}
if(stmt->__anon1.compound.declarations)
{
for(decl = (*stmt->__anon1.compound.declarations).first; decl; decl = decl->next)
ProcessDeclaration(decl);
}
if(stmt->__anon1.compound.statements)
{
for(s = (*stmt->__anon1.compound.statements).first; s; s = s->next)
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

if(stmt->__anon1.expressions)
{
for(exp = (*stmt->__anon1.expressions).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
}
break;
}
case 4:
{
if(stmt->__anon1.ifStmt.exp)
{
struct Expression * exp;

((struct Expression *)(*stmt->__anon1.ifStmt.exp).last)->usage = (((struct Expression *)(*stmt->__anon1.ifStmt.exp).last)->usage & ~0x1) | (((unsigned int)(1)) << 0);
for(exp = (*stmt->__anon1.ifStmt.exp).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
}
if(stmt->__anon1.ifStmt.stmt)
ProcessStatement(stmt->__anon1.ifStmt.stmt);
if(stmt->__anon1.ifStmt.elseStmt)
ProcessStatement(stmt->__anon1.ifStmt.elseStmt);
break;
}
case 5:
{
struct Expression * exp;

if(stmt->__anon1.switchStmt.exp && (*stmt->__anon1.switchStmt.exp).last)
{
((struct Expression *)(*stmt->__anon1.switchStmt.exp).last)->usage = (((struct Expression *)(*stmt->__anon1.switchStmt.exp).last)->usage & ~0x1) | (((unsigned int)(1)) << 0);
for(exp = (*stmt->__anon1.switchStmt.exp).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
}
ProcessStatement(stmt->__anon1.switchStmt.stmt);
break;
}
case 6:
{
struct Expression * exp;

if(stmt->__anon1.whileStmt.exp && (*stmt->__anon1.whileStmt.exp).last)
{
((struct Expression *)(*stmt->__anon1.whileStmt.exp).last)->usage = (((struct Expression *)(*stmt->__anon1.whileStmt.exp).last)->usage & ~0x1) | (((unsigned int)(1)) << 0);
for(exp = (*stmt->__anon1.whileStmt.exp).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
}
ProcessStatement(stmt->__anon1.whileStmt.stmt);
break;
}
case 7:
{
struct Expression * exp;

if(stmt->__anon1.doWhile.exp && (*stmt->__anon1.doWhile.exp).last)
{
((struct Expression *)(*stmt->__anon1.doWhile.exp).last)->usage = (((struct Expression *)(*stmt->__anon1.doWhile.exp).last)->usage & ~0x1) | (((unsigned int)(1)) << 0);
for(exp = (*stmt->__anon1.doWhile.exp).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
}
if(stmt->__anon1.doWhile.stmt)
ProcessStatement(stmt->__anon1.doWhile.stmt);
break;
}
case 8:
{
struct Expression * exp;

if(stmt->__anon1.forStmt.init)
ProcessStatement(stmt->__anon1.forStmt.init);
if(stmt->__anon1.forStmt.check)
{
if(stmt->__anon1.forStmt.check->__anon1.expressions)
{
((struct Expression *)(*stmt->__anon1.forStmt.check->__anon1.expressions).last)->usage = (((struct Expression *)(*stmt->__anon1.forStmt.check->__anon1.expressions).last)->usage & ~0x1) | (((unsigned int)(1)) << 0);
}
ProcessStatement(stmt->__anon1.forStmt.check);
}
if(stmt->__anon1.forStmt.increment)
{
for(exp = (*stmt->__anon1.forStmt.increment).first; exp; exp = exp->next)
{
ProcessExpression(exp);
}
}
if(stmt->__anon1.forStmt.stmt)
ProcessStatement(stmt->__anon1.forStmt.stmt);
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

if(stmt->__anon1.expressions)
{
((struct Expression *)(*stmt->__anon1.expressions).last)->usage = (((struct Expression *)(*stmt->__anon1.expressions).last)->usage & ~0x1) | (((unsigned int)(1)) << 0);
for(exp = (*stmt->__anon1.expressions).first; exp; exp = exp->next)
{
ProcessExpression(exp);
if(!exp->next && exp->destType && exp->destType->byReference)
FixReference(exp, 1);
}
}
break;
}
case 14:
{
ProcessDeclaration(stmt->__anon1.decl);
break;
}
case 13:
{
struct AsmField * field;

if(stmt->__anon1.asmStmt.inputFields)
{
for(field = (*stmt->__anon1.asmStmt.inputFields).first; field; field = field->next)
if(field->expression)
ProcessExpression(field->expression);
}
if(stmt->__anon1.asmStmt.outputFields)
{
for(field = (*stmt->__anon1.asmStmt.outputFields).first; field; field = field->next)
if(field->expression)
ProcessExpression(field->expression);
}
if(stmt->__anon1.asmStmt.clobberedFields)
{
for(field = (*stmt->__anon1.asmStmt.clobberedFields).first; field; field = field->next)
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
ProcessStatement(function->body);
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
if(members->__anon1.dataMembers)
{
struct MemberInit * member;

for(member = (*members->__anon1.dataMembers).first; member; member = member->next)
ProcessMemberInitData(member);
}
}
else if(members->type == 1)
{
ProcessFunction((struct FunctionDefinition *)members->__anon1.function);
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
if(external->__anon1.declaration)
ProcessDeclaration(external->__anon1.declaration);
}
}
for(external = (*ast).first; external; external = external->next)
{
curExternal = external;
if(external->type == 0)
{
ProcessFunction(external->__anon1.function);
}
else if(external->type == 1)
{
if(external->__anon1.declaration)
ProcessDeclaration(external->__anon1.declaration);
}
else if(external->type == 2)
{
struct ClassDefinition * _class = external->__anon1._class;

if(_class->definitions)
{
struct ClassDef * def;
struct __ecereNameSpace__ecere__com__Class * regClass = _class->symbol->__anon1.registered;

for(def = (*_class->definitions).first; def; def = def->next)
{
if(def->type == 0)
{
curExternal = def->__anon1.function->declarator->symbol->__anon2.__anon1.pointerExternal;
ProcessFunction((struct FunctionDefinition *)def->__anon1.function);
}
else if(def->type == 2 && def->__anon1.decl->type == 2)
{
ProcessInstantiation(def->__anon1.decl->__anon1.inst);
}
else if(def->type == 1 && def->__anon1.defProperties)
{
struct MemberInit * defProperty;
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(regClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
for(defProperty = (*def->__anon1.defProperties).first; defProperty; defProperty = defProperty->next)
{
ProcessMemberInitData(defProperty);
}
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
FreeSymbol(thisSymbol);
}
else if(def->type == 3 && def->__anon1.propertyDef)
{
struct PropertyDef * prop = def->__anon1.propertyDef;
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(regClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
if(prop->setStmt)
{
curExternal = prop->symbol->__anon2.__anon2.externalSet;
ProcessStatement(prop->setStmt);
}
if(prop->getStmt)
{
curExternal = prop->symbol->__anon2.__anon2.externalGet;
ProcessStatement(prop->getStmt);
}
if(prop->issetStmt)
{
curExternal = prop->symbol->__anon2.__anon2.externalIsSet;
ProcessStatement(prop->issetStmt);
}
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
FreeSymbol(thisSymbol);
}
else if(def->type == 10 && def->__anon1.propertyDef)
{
struct PropertyDef * prop = def->__anon1.propertyDef;

if(prop->setStmt)
{
curExternal = prop->symbol->__anon2.__anon2.externalSet;
ProcessStatement(prop->setStmt);
}
if(prop->getStmt)
{
curExternal = prop->symbol->__anon2.__anon2.externalGet;
ProcessStatement(prop->getStmt);
}
}
else if(def->type == 4 && def->__anon1.propertyWatch)
{
struct PropertyWatch * propertyWatch = def->__anon1.propertyWatch;
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(regClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
if(propertyWatch->compound)
{
struct Symbol * thisSymbol = (thisSymbol = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), thisSymbol->string = __ecereNameSpace__ecere__sys__CopyString("this"), thisSymbol->type = MkClassType(regClass->fullName), thisSymbol);

__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&propertyWatch->compound->__anon1.compound.context->symbols, (struct __ecereNameSpace__ecere__sys__BTNode *)thisSymbol);
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

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(const char *  name, const char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

void __ecereRegisterModule_pass2(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetNonBracketsExp", "Expression GetNonBracketsExp(Expression exp)", GetNonBracketsExp, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessMemberAccess", "void ProcessMemberAccess(void)", ProcessMemberAccess, module, 1);
}

void __ecereUnregisterModule_pass2(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

