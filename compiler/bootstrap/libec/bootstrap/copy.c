/* Code generated from eC source file: copy.ec */
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
#if defined(_WIN32)
#   if defined(__GNUC__) || defined(__TINYC__)
#      define ecere_stdcall __attribute__((__stdcall__))
#      define ecere_gcc_struct __attribute__((gcc_struct))
#   else
#      define ecere_stdcall __stdcall
#      define ecere_gcc_struct
#   endif
#else
#   define ecere_stdcall
#   define ecere_gcc_struct
#endif
#include <stdint.h>
#include <sys/types.h>
struct __ecereNameSpace__ecere__sys__OldList
{
void *  first;
void *  last;
int count;
unsigned int offset;
unsigned int circ;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__sys__BTNode;

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
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__SerialBuffer
{
unsigned char *  _buffer;
unsigned int count;
unsigned int _size;
unsigned int pos;
} ecere_gcc_struct;

extern void *  __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew(void *  memory, unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew0(void *  memory, unsigned int size);

extern void __ecereNameSpace__ecere__com__eSystem_Delete(void *  memory);

struct CodePosition
{
int line;
int charPos;
int pos;
int included;
} ecere_gcc_struct;

struct Context;

struct TemplateParameter;

struct ClassFunction;

struct External;

struct ModuleImport;

struct ClassImport;

struct PropertyDef;

struct PropertyWatch;

extern char *  __ecereNameSpace__ecere__sys__CopyString(const char *  string);

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern void ListAdd(struct __ecereNameSpace__ecere__sys__OldList * list, void *  item);

struct Location
{
struct CodePosition start;
struct CodePosition end;
} ecere_gcc_struct;

struct Attrib
{
struct Location loc;
int type;
struct __ecereNameSpace__ecere__sys__OldList *  attribs;
} ecere_gcc_struct;

struct ExtDecl
{
struct Location loc;
int type;
union
{
char * s;
struct Attrib * attr;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

extern struct Attrib * MkAttrib(int type, struct __ecereNameSpace__ecere__sys__OldList *  attribs);

extern struct ExtDecl * MkExtDeclAttrib(struct Attrib * attr);

extern struct ExtDecl * MkExtDeclString(char * s);

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} ecere_gcc_struct;

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

struct __ecereNameSpace__ecere__com__Property;

extern void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

extern void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object);

extern void __ecereNameSpace__ecere__com__eInstance_Watch(void *  instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

struct Identifier;

extern struct Identifier * MkIdentifier(const char *  string);

struct Expression;

extern struct Expression * MkExpDummy(void);

extern struct Expression * MkExpIdentifier(struct Identifier * id);

extern struct Expression * MkExpConstant(const char *  string);

extern struct Expression * MkExpString(const char *  string);

extern struct Expression * MkExpOp(struct Expression * exp1, int op, struct Expression * exp2);

extern struct Expression * MkExpBrackets(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern struct Expression * MkExpIndex(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * index);

extern struct Expression * MkExpCall(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * arguments);

extern struct Expression * MkExpMember(struct Expression * expression, struct Identifier * member);

extern struct Expression * MkExpPointer(struct Expression * expression, struct Identifier * member);

extern struct Expression * MkExpCondition(struct Expression * cond, struct __ecereNameSpace__ecere__sys__OldList * expressions, struct Expression * elseExp);

struct Symbol;

extern struct Symbol * FindClass(const char *  name);

struct Declaration;

extern struct Declaration * MkDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators);

struct Specifier;

struct Identifier
{
struct Identifier * prev;
struct Identifier * next;
struct Location loc;
struct Symbol * classSym;
struct Specifier * _class;
char *  string;
struct Identifier * badID;
} ecere_gcc_struct;

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
struct Specifier * nsSpec;
} ecere_gcc_struct __anon1;
struct
{
struct Identifier * id;
struct __ecereNameSpace__ecere__sys__OldList *  list;
struct __ecereNameSpace__ecere__sys__OldList *  baseSpecs;
struct __ecereNameSpace__ecere__sys__OldList *  definitions;
unsigned int addNameSpace;
struct Context * ctx;
struct ExtDecl * extDeclStruct;
} ecere_gcc_struct __anon2;
struct Expression * expression;
struct Specifier * _class;
struct TemplateParameter * templateParameter;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

extern struct Specifier * MkSpecifier(int specifier);

extern struct Specifier * MkEnum(struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * list);

extern struct Specifier * MkStructOrUnion(int type, struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * definitions);

extern struct Specifier * MkSpecifierSubClass(struct Specifier * _class);

extern struct Specifier * MkSpecifierExtended(struct ExtDecl * extDecl);

struct Declarator;

extern struct Expression * MkExpClass(struct __ecereNameSpace__ecere__sys__OldList *  specifiers, struct Declarator * decl);

extern struct Declarator * MkStructDeclarator(struct Declarator * declarator, struct Expression * exp);

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

extern struct Declarator * MkDeclaratorBrackets(struct Declarator * declarator);

extern struct Declarator * MkDeclaratorEnumArray(struct Declarator * declarator, struct Specifier * _class);

extern struct Declarator * MkDeclaratorArray(struct Declarator * declarator, struct Expression * exp);

extern struct Declarator * MkDeclaratorFunction(struct Declarator * declarator, struct __ecereNameSpace__ecere__sys__OldList * parameters);

extern struct Declarator * MkDeclaratorExtended(struct ExtDecl * extended, struct Declarator * declarator);

extern struct Declarator * MkDeclaratorExtendedEnd(struct ExtDecl * extended, struct Declarator * declarator);

struct __ecereNameSpace__ecere__sys__Item;

struct __ecereNameSpace__ecere__sys__Item
{
struct __ecereNameSpace__ecere__sys__Item * prev;
struct __ecereNameSpace__ecere__sys__Item * next;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__sys__OldList * CopyList(struct __ecereNameSpace__ecere__sys__OldList * source, void * (* CopyFunction)(void *))
{
struct __ecereNameSpace__ecere__sys__OldList * list = (((void *)0));

if(source)
{
struct __ecereNameSpace__ecere__sys__Item * item;

list = MkList();
for(item = (*source).first; item; item = item->next)
ListAdd(list, CopyFunction(item));
}
return list;
}

struct Pointer;

struct Pointer
{
struct Pointer * prev;
struct Pointer * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList *  qualifiers;
struct Pointer * pointer;
} ecere_gcc_struct;

extern struct Pointer * MkPointer(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Pointer * pointer);

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
} ecere_gcc_struct structDecl;
struct
{
struct Expression * exp;
struct Specifier * enumClass;
} ecere_gcc_struct array;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * parameters;
} ecere_gcc_struct function;
struct
{
struct Pointer * pointer;
} ecere_gcc_struct pointer;
struct
{
struct ExtDecl * extended;
} ecere_gcc_struct extended;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

extern struct Declarator * MkDeclaratorPointer(struct Pointer * pointer, struct Declarator * declarator);

struct Initializer;

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
} ecere_gcc_struct __anon1;
unsigned int isConstant;
struct Identifier * id;
} ecere_gcc_struct;

extern struct Initializer * MkInitializerAssignment(struct Expression * exp);

extern struct Initializer * MkInitializerList(struct __ecereNameSpace__ecere__sys__OldList * list);

struct MembersInit;

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
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

extern struct MembersInit * MkMembersInitList(struct __ecereNameSpace__ecere__sys__OldList * dataMembers);

struct Statement;

extern struct Expression * MkExpExtensionCompound(struct Statement * compound);

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
} ecere_gcc_struct labeled;
struct
{
struct Expression * exp;
struct Statement * stmt;
} ecere_gcc_struct caseStmt;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * declarations;
struct __ecereNameSpace__ecere__sys__OldList * statements;
struct Context * context;
unsigned int isSwitch;
} ecere_gcc_struct compound;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct Statement * stmt;
struct Statement * elseStmt;
} ecere_gcc_struct ifStmt;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct Statement * stmt;
} ecere_gcc_struct switchStmt;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct Statement * stmt;
} ecere_gcc_struct whileStmt;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct Statement * stmt;
} ecere_gcc_struct doWhile;
struct
{
struct Statement * init;
struct Statement * check;
struct __ecereNameSpace__ecere__sys__OldList * increment;
struct Statement * stmt;
} ecere_gcc_struct forStmt;
struct
{
struct Identifier * id;
} ecere_gcc_struct gotoStmt;
struct
{
struct Specifier * spec;
char * statements;
struct __ecereNameSpace__ecere__sys__OldList * inputFields;
struct __ecereNameSpace__ecere__sys__OldList * outputFields;
struct __ecereNameSpace__ecere__sys__OldList * clobberedFields;
} ecere_gcc_struct asmStmt;
struct
{
struct Expression * watcher;
struct Expression * object;
struct __ecereNameSpace__ecere__sys__OldList * watches;
} ecere_gcc_struct _watch;
struct
{
struct Identifier * id;
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct __ecereNameSpace__ecere__sys__OldList * filter;
struct Statement * stmt;
} ecere_gcc_struct forEachStmt;
struct Declaration * decl;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

extern struct Statement * MkCompoundStmt(struct __ecereNameSpace__ecere__sys__OldList * declarations, struct __ecereNameSpace__ecere__sys__OldList * statements);

extern struct Statement * MkExpressionStmt(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern struct Statement * MkBadDeclStmt(struct Declaration * decl);

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} ecere_gcc_struct;

struct Attrib *  CopyAttrib(struct Attrib *  attrib);

struct ExtDecl * CopyExtDecl(struct ExtDecl * extDecl)
{
if(extDecl)
{
if(extDecl->type == 1)
return MkExtDeclAttrib(CopyAttrib(extDecl->__anon1.attr));
else if(extDecl->type == 0)
return MkExtDeclString(__ecereNameSpace__ecere__sys__CopyString(extDecl->__anon1.s));
}
return (((void *)0));
}

struct __ecereNameSpace__ecere__com__Method;

struct __ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(const char *  name, const char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

struct Type;

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
} ecere_gcc_struct;

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
} ecere_gcc_struct;

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
} ecere_gcc_struct __anon1;
unsigned int notYetDeclared;
union
{
struct
{
struct External * pointerExternal;
struct External * structExternal;
} ecere_gcc_struct __anon1;
struct
{
struct External * externalGet;
struct External * externalSet;
struct External * externalPtr;
struct External * externalIsSet;
} ecere_gcc_struct __anon2;
struct
{
struct External * methodExternal;
struct External * methodCodeExternal;
} ecere_gcc_struct __anon3;
} ecere_gcc_struct __anon2;
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
unsigned int mustRegister;
} ecere_gcc_struct;

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
} ecere_gcc_struct __anon1;
struct
{
struct Type * returnType;
struct __ecereNameSpace__ecere__sys__OldList params;
struct Symbol * thisClass;
unsigned int staticMethod;
struct TemplateParameter * thisClassTemplate;
} ecere_gcc_struct __anon2;
struct
{
struct __ecereNameSpace__ecere__com__Method * method;
struct __ecereNameSpace__ecere__com__Class * methodClass;
struct __ecereNameSpace__ecere__com__Class * usedClass;
} ecere_gcc_struct __anon3;
struct
{
struct Type * arrayType;
int arraySize;
struct Expression * arraySizeExp;
unsigned int freeExp;
struct Symbol * enumClass;
} ecere_gcc_struct __anon4;
struct Type * type;
struct TemplateParameter * templateParameter;
} ecere_gcc_struct __anon1;
int kind;
unsigned int size;
char *  name;
char *  typeName;
struct __ecereNameSpace__ecere__com__Class * thisClassFrom;
int promotedFrom;
int classObjectType;
int alignment;
unsigned int offset;
int bitFieldCount;
int count;
int bitMemberSize;
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
unsigned int pointerAlignment : 1;
unsigned int isLong : 1;
unsigned int signedBeforePromotion : 1;
unsigned int isVector : 1;
} ecere_gcc_struct;

struct Instantiation;

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
} ecere_gcc_struct;

extern struct Instantiation * MkInstantiation(struct Specifier * _class, struct Expression * exp, struct __ecereNameSpace__ecere__sys__OldList * members);

extern struct Expression * MkExpInstance(struct Instantiation * inst);

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
} ecere_gcc_struct __anon1;
struct Instantiation * inst;
struct
{
struct Identifier * id;
struct Expression * exp;
} ecere_gcc_struct __anon2;
} ecere_gcc_struct __anon1;
struct Specifier * extStorage;
struct Symbol * symbol;
int declMode;
} ecere_gcc_struct;

struct TypeName;

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
} ecere_gcc_struct __anon1;
struct Statement * compound;
struct Instantiation * instance;
struct
{
char *  string;
unsigned int intlString;
unsigned int wideString;
} ecere_gcc_struct __anon2;
struct __ecereNameSpace__ecere__sys__OldList *  list;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * specifiers;
struct Declarator * decl;
} ecere_gcc_struct _classExp;
struct
{
struct Identifier * id;
} ecere_gcc_struct classData;
struct
{
struct Expression * exp;
struct __ecereNameSpace__ecere__sys__OldList * arguments;
struct Location argLoc;
} ecere_gcc_struct call;
struct
{
struct Expression * exp;
struct __ecereNameSpace__ecere__sys__OldList * index;
} ecere_gcc_struct index;
struct
{
struct Expression * exp;
struct Identifier * member;
int memberType;
unsigned int thisPtr;
} ecere_gcc_struct member;
struct
{
int op;
struct Expression * exp1;
struct Expression * exp2;
} ecere_gcc_struct op;
struct TypeName * typeName;
struct Specifier * _class;
struct
{
struct TypeName * typeName;
struct Expression * exp;
} ecere_gcc_struct cast;
struct
{
struct Expression * cond;
struct __ecereNameSpace__ecere__sys__OldList * exp;
struct Expression * elseExp;
} ecere_gcc_struct cond;
struct
{
struct TypeName * typeName;
struct Expression * size;
} ecere_gcc_struct _new;
struct
{
struct TypeName * typeName;
struct Expression * size;
struct Expression * exp;
} ecere_gcc_struct _renew;
struct
{
char * table;
struct Identifier * id;
} ecere_gcc_struct db;
struct
{
struct Expression * ds;
struct Expression * name;
} ecere_gcc_struct dbopen;
struct
{
struct TypeName * typeName;
struct Initializer * initializer;
} ecere_gcc_struct initializer;
struct
{
struct Expression * exp;
struct TypeName * typeName;
} ecere_gcc_struct vaArg;
struct
{
struct TypeName * typeName;
struct Identifier * id;
} ecere_gcc_struct offset;
} ecere_gcc_struct __anon1;
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
unsigned int usedInComparison;
unsigned int ambiguousUnits;
unsigned int parentOpDestType;
unsigned int needTemplateCast;
} ecere_gcc_struct;

extern struct Expression * MkExpTypeSize(struct TypeName * typeName);

extern struct Expression * MkExpTypeAlign(struct TypeName * typeName);

extern struct Expression * MkExpOffsetOf(struct TypeName * typeName, struct Identifier * id);

extern struct Expression * MkExpCast(struct TypeName * typeName, struct Expression * expression);

extern struct Expression * MkExpVaArg(struct Expression * exp, struct TypeName * type);

extern struct Expression * MkExpExtensionInitializer(struct TypeName * typeName, struct Initializer * initializer);

struct TypeName
{
struct TypeName * prev;
struct TypeName * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList *  qualifiers;
struct Declarator * declarator;
int classObjectType;
struct Expression * bitCount;
} ecere_gcc_struct;

extern struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator);

struct Enumerator;

extern struct Enumerator * MkEnumerator(struct Identifier * id, struct Expression * exp);

struct Enumerator
{
struct Enumerator * prev;
struct Enumerator * next;
struct Location loc;
struct Identifier * id;
struct Expression * exp;
} ecere_gcc_struct;

struct Attribute;

extern struct Attribute * MkAttribute(char * attr, struct Expression * exp);

struct Attribute
{
struct Attribute * prev;
struct Attribute * next;
struct Location loc;
char * attr;
struct Expression * exp;
} ecere_gcc_struct;

struct ClassDef;

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
} ecere_gcc_struct __anon1;
} ecere_gcc_struct __anon1;
int memberAccess;
void *  object;
} ecere_gcc_struct;

extern struct ClassDef * MkClassDefDeclaration(struct Declaration * decl);

struct Specifier *  CopySpecifier(struct Specifier *  spec);

struct Identifier * CopyIdentifier(struct Identifier * id)
{
if(id)
{
struct Identifier * copy = MkIdentifier(id->string);

copy->_class = id->_class ? CopySpecifier(id->_class) : (((void *)0));
copy->classSym = id->classSym;
return copy;
}
return (((void *)0));
}

static struct Pointer * CopyPointer(struct Pointer * ptr)
{
if(ptr)
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct Specifier * spec;

if(ptr->qualifiers)
{
for(spec = (*ptr->qualifiers).first; spec; spec = spec->next)
ListAdd(list, CopySpecifier(spec));
}
return MkPointer(list, CopyPointer(ptr->pointer));
}
return (((void *)0));
}

struct Attribute *  CopyAttribute(struct Attribute *  attrib);

struct Attrib * CopyAttrib(struct Attrib * attrib)
{
if(attrib)
return MkAttrib(attrib->type, CopyList(attrib->attribs, (void *)(CopyAttribute)));
return (((void *)0));
}

struct MemberInit;

extern struct MemberInit * MkMemberInit(struct __ecereNameSpace__ecere__sys__OldList * ids, struct Initializer * initializer);

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
} ecere_gcc_struct;

struct InitDeclarator;

extern struct InitDeclarator * MkInitDeclarator(struct Declarator * declarator, struct Initializer * initializer);

struct InitDeclarator
{
struct InitDeclarator * prev;
struct InitDeclarator * next;
struct Location loc;
struct Declarator * declarator;
struct Initializer * initializer;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__NameSpace;

struct __ecereNameSpace__ecere__com__NameSpace
{
const char *  name;
struct __ecereNameSpace__ecere__com__NameSpace *  btParent;
struct __ecereNameSpace__ecere__com__NameSpace *  left;
struct __ecereNameSpace__ecere__com__NameSpace *  right;
int depth;
struct __ecereNameSpace__ecere__com__NameSpace *  parent;
struct __ecereNameSpace__ecere__sys__BinaryTree nameSpaces;
struct __ecereNameSpace__ecere__sys__BinaryTree classes;
struct __ecereNameSpace__ecere__sys__BinaryTree defines;
struct __ecereNameSpace__ecere__sys__BinaryTree functions;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__Application
{
int argc;
const char * *  argv;
int exitCode;
unsigned int isGUIApp;
struct __ecereNameSpace__ecere__sys__OldList allModules;
char *  parsedCommand;
struct __ecereNameSpace__ecere__com__NameSpace systemNameSpace;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__Module
{
struct __ecereNameSpace__ecere__com__Instance * application;
struct __ecereNameSpace__ecere__sys__OldList classes;
struct __ecereNameSpace__ecere__sys__OldList defines;
struct __ecereNameSpace__ecere__sys__OldList functions;
struct __ecereNameSpace__ecere__sys__OldList modules;
struct __ecereNameSpace__ecere__com__Instance * prev;
struct __ecereNameSpace__ecere__com__Instance * next;
const char *  name;
void *  library;
void *  Unload;
int importType;
int origImportType;
struct __ecereNameSpace__ecere__com__NameSpace privateNameSpace;
struct __ecereNameSpace__ecere__com__NameSpace publicNameSpace;
} ecere_gcc_struct;

void __ecereUnregisterModule_copy(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

struct __ecereNameSpace__ecere__com__DataMember;

struct __ecereNameSpace__ecere__com__ClassTemplateArgument
{
union
{
struct
{
const char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
} ecere_gcc_struct __anon1;
struct __ecereNameSpace__ecere__com__DataValue expression;
struct
{
const char *  memberString;
union
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__Method * method;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct __anon2;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

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
short structAlignment;
short pointerAlignment;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__Class
{
struct __ecereNameSpace__ecere__com__Class * prev;
struct __ecereNameSpace__ecere__com__Class * next;
const char *  name;
int offset;
int structSize;
void * *  _vTbl;
int vTblSize;
unsigned int (*  Constructor)(void * );
void (*  Destructor)(void * );
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
short structAlignment;
short pointerAlignment;
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
} ecere_gcc_struct;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Expression;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Context;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Specifier;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

struct Expression * MoveExpContents(struct Expression * exp)
{
struct Expression * newExp = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Expression);

*newExp = *exp;
newExp->prev = (((void *)0));
newExp->next = (((void *)0));
newExp->destType = (((void *)0));
if(exp->expType)
exp->expType->refCount++;
return newExp;
}

struct Expression *  CopyExpression(struct Expression *  exp);

static struct Initializer * CopyInitializer(struct Initializer * initializer)
{
struct Initializer * copy = (((void *)0));

;
if(initializer->type == 0)
copy = MkInitializerAssignment(CopyExpression(initializer->__anon1.exp));
else if(initializer->type == 1)
copy = MkInitializerList(CopyList(initializer->__anon1.list, (void *)(CopyInitializer)));
if(copy)
{
copy->loc = initializer->loc;
if(initializer->id)
copy->id = CopyIdentifier(initializer->id);
copy->isConstant = initializer->isConstant;
}
return copy;
}

static struct Enumerator * CopyEnumerator(struct Enumerator * enumerator)
{
return MkEnumerator(CopyIdentifier(enumerator->id), CopyExpression(enumerator->exp));
}

struct Attribute * CopyAttribute(struct Attribute * attrib)
{
if(attrib)
return MkAttribute(__ecereNameSpace__ecere__sys__CopyString(attrib->attr), CopyExpression(attrib->exp));
return (((void *)0));
}

static struct MemberInit * CopyMemberInit(struct MemberInit * member)
{
return MkMemberInit(CopyList(member->identifiers, (void *)(CopyIdentifier)), CopyInitializer(member->initializer));
}

static struct MembersInit * CopyMembersInit(struct MembersInit * members)
{
struct __ecereNameSpace__ecere__sys__OldList * list = (((void *)0));

switch(members->type)
{
case 0:
{
if(members)
{
struct MemberInit * member;

list = MkList();
for(member = (*members->__anon1.dataMembers).first; member; member = member->next)
ListAdd(list, CopyMemberInit(member));
}
}
}
return MkMembersInitList(list);
}

static struct Instantiation * CopyInstantiation(struct Instantiation * inst)
{
struct Instantiation * copy;
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct MembersInit * member;

if(inst->members)
{
for(member = (*inst->members).first; member; member = member->next)
ListAdd(list, CopyMembersInit(member));
}
copy = MkInstantiation(CopySpecifier(inst->_class), CopyExpression(inst->exp), list);
copy->data = inst->data;
if(inst->data)
{
struct Symbol * classSym = FindClass(inst->_class->__anon1.__anon1.name);
struct __ecereNameSpace__ecere__com__Class * _class = classSym ? classSym->__anon1.registered : (((void *)0));

if(_class)
{
if(_class->type == 0)
((struct __ecereNameSpace__ecere__com__Instance *)(char *)((struct __ecereNameSpace__ecere__com__Instance *)copy->data))->_refCount++;
}
}
copy->loc = inst->loc;
copy->isConstant = inst->isConstant;
return copy;
}

struct Declaration *  CopyDeclaration(struct Declaration *  decl);

static struct Statement * CopyStatement(struct Statement * stmt)
{
struct Statement * result = (((void *)0));

if(stmt)
{
switch(stmt->type)
{
case 2:
result = MkCompoundStmt(CopyList(stmt->__anon1.compound.declarations, (void *)(CopyDeclaration)), CopyList(stmt->__anon1.compound.statements, (void *)(CopyStatement)));
result->__anon1.compound.context = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context);
break;
case 3:
result = MkExpressionStmt(CopyList(stmt->__anon1.expressions, (void *)(CopyExpression)));
break;
case 14:
result = MkBadDeclStmt(CopyDeclaration(stmt->__anon1.decl));
break;
}
}
if(result)
{
result->loc = stmt->loc;
}
return result;
}

struct ClassDef * CopyClassDef(struct ClassDef * def)
{
switch(def->type)
{
case 0:
return (((void *)0));
case 1:
return (((void *)0));
case 2:
return MkClassDefDeclaration(CopyDeclaration(def->__anon1.decl));
case 3:
return (((void *)0));
}
return (((void *)0));
}

struct Specifier * CopySpecifier(struct Specifier * spec)
{
if(spec)
switch(spec->type)
{
case 0:
return MkSpecifier(spec->__anon1.specifier);
case 2:
{
struct Identifier * id = CopyIdentifier(spec->__anon1.__anon2.id);
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct Enumerator * enumerator;

if(spec->__anon1.__anon2.list)
{
for(enumerator = (*spec->__anon1.__anon2.list).first; enumerator; enumerator = enumerator->next)
ListAdd(list, CopyEnumerator(enumerator));
}
return MkEnum(id, list);
}
case 3:
case 4:
{
struct Identifier * id = CopyIdentifier(spec->__anon1.__anon2.id);
struct __ecereNameSpace__ecere__sys__OldList * list = (((void *)0));
struct ClassDef * def;
struct Specifier * s;

if(spec->__anon1.__anon2.definitions)
{
list = MkList();
if(spec->__anon1.__anon2.list)
{
for(def = (*spec->__anon1.__anon2.list).first; def; def = def->next)
ListAdd(list, CopyClassDef(def));
}
}
s = MkStructOrUnion(spec->type, id, list);
s->__anon1.__anon2.extDeclStruct = CopyExtDecl(spec->__anon1.__anon2.extDeclStruct);
return s;
}
case 1:
{
struct Specifier * copy = (copy = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier), copy->type = 1, copy->__anon1.__anon1.name = __ecereNameSpace__ecere__sys__CopyString(spec->__anon1.__anon1.name), copy->__anon1.__anon1.symbol = spec->__anon1.__anon1.symbol, copy->__anon1.__anon1.templateArgs = (((void *)0)), copy);

return copy;
}
case 7:
return MkSpecifierSubClass(CopySpecifier(spec->__anon1._class));
case 8:
return __extension__ ({
struct Specifier * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier);

__ecereInstance1->loc = spec->loc, __ecereInstance1->type = 8, __ecereInstance1->__anon1.templateParameter = spec->__anon1.templateParameter, __ecereInstance1;
});
case 5:
return MkSpecifierExtended(CopyExtDecl(spec->__anon1.__anon1.extDecl));
}
return (((void *)0));
}

struct Declarator *  CopyDeclarator(struct Declarator *  declarator);

struct TypeName * CopyTypeName(struct TypeName * typeName)
{
struct __ecereNameSpace__ecere__sys__OldList * list = (((void *)0));
struct TypeName * copy;

if(typeName->qualifiers)
{
struct Specifier * spec;

list = MkList();
for(spec = (*typeName->qualifiers).first; spec; spec = spec->next)
ListAdd(list, CopySpecifier(spec));
}
copy = MkTypeName(list, CopyDeclarator(typeName->declarator));
copy->classObjectType = typeName->classObjectType;
return copy;
}

struct InitDeclarator * CopyInitDeclarator(struct InitDeclarator * initDecl)
{
return MkInitDeclarator(CopyDeclarator(initDecl->declarator), CopyInitializer(initDecl->initializer));
}

struct Expression * CopyExpression(struct Expression * exp)
{
struct Expression * result = (((void *)0));

if(exp)
switch(exp->type)
{
case 16:
result = MkExpDummy();
break;
case 0:
result = MkExpIdentifier(CopyIdentifier(exp->__anon1.__anon1.identifier));
break;
case 1:
result = MkExpInstance(CopyInstantiation(exp->__anon1.instance));
break;
case 2:
result = MkExpConstant(exp->__anon1.__anon2.string);
break;
case 3:
result = MkExpString(exp->__anon1.__anon2.string);
break;
case 4:
result = MkExpOp(CopyExpression(exp->__anon1.op.exp1), exp->__anon1.op.op, CopyExpression(exp->__anon1.op.exp2));
break;
case 5:
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct Expression * e;

for(e = (*exp->__anon1.list).first; e; e = e->next)
ListAdd(list, CopyExpression(e));
result = MkExpBrackets(list);
break;
}
case 6:
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct Expression * e;

for(e = (*exp->__anon1.index.index).first; e; e = e->next)
ListAdd(list, CopyExpression(e));
result = MkExpIndex(CopyExpression(exp->__anon1.index.exp), list);
break;
}
case 7:
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct Expression * arg;

if(exp->__anon1.call.arguments)
{
for(arg = (*exp->__anon1.call.arguments).first; arg; arg = arg->next)
ListAdd(list, CopyExpression(arg));
}
result = MkExpCall(CopyExpression(exp->__anon1.call.exp), list);
break;
}
case 8:
result = MkExpMember(CopyExpression(exp->__anon1.member.exp), CopyIdentifier(exp->__anon1.member.member));
result->__anon1.member.memberType = exp->__anon1.member.memberType;
result->__anon1.member.thisPtr = exp->__anon1.member.thisPtr;
break;
case 9:
result = MkExpPointer(CopyExpression(exp->__anon1.member.exp), CopyIdentifier(exp->__anon1.member.member));
break;
case 10:
result = MkExpTypeSize(CopyTypeName(exp->__anon1.typeName));
break;
case 36:
result = MkExpTypeAlign(CopyTypeName(exp->__anon1.typeName));
break;
case 40:
result = MkExpOffsetOf(CopyTypeName(exp->__anon1.typeName), CopyIdentifier(exp->__anon1.__anon1.identifier));
break;
case 11:
result = MkExpCast(CopyTypeName(exp->__anon1.cast.typeName), CopyExpression(exp->__anon1.cast.exp));
break;
case 12:
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct Expression * e;

for(e = (*exp->__anon1.cond.exp).first; e; e = e->next)
ListAdd(list, CopyExpression(e));
result = MkExpCondition(CopyExpression(exp->__anon1.cond.cond), list, CopyExpression(exp->__anon1.cond.elseExp));
break;
}
case 34:
result = MkExpVaArg(CopyExpression(exp->__anon1.vaArg.exp), CopyTypeName(exp->__anon1.vaArg.typeName));
break;
case 23:
result = MkExpExtensionCompound(CopyStatement(exp->__anon1.compound));
break;
case 33:
result = MkExpExtensionInitializer(CopyTypeName(exp->__anon1.initializer.typeName), CopyInitializer(exp->__anon1.initializer.initializer));
break;
case 24:
result = MkExpClass(CopyList(exp->__anon1._classExp.specifiers, (void *)(CopySpecifier)), CopyDeclarator(exp->__anon1._classExp.decl));
break;
}
if(result)
{
result->expType = exp->expType;
if(exp->expType)
exp->expType->refCount++;
result->destType = exp->destType;
if(exp->destType)
exp->destType->refCount++;
result->loc = exp->loc;
result->isConstant = exp->isConstant;
result->byReference = exp->byReference;
result->opDestType = exp->opDestType;
result->usedInComparison = exp->usedInComparison;
result->needTemplateCast = exp->needTemplateCast;
result->parentOpDestType = exp->parentOpDestType;
}
return result;
}

struct Declarator * CopyDeclarator(struct Declarator * declarator)
{
if(declarator)
{
switch(declarator->type)
{
case 0:
{
struct Declarator * decl = MkStructDeclarator(CopyDeclarator(declarator->declarator), CopyExpression(declarator->__anon1.structDecl.exp));

if(declarator->__anon1.structDecl.attrib)
decl->__anon1.structDecl.attrib = CopyAttrib(declarator->__anon1.structDecl.attrib);
return decl;
}
case 1:
return MkDeclaratorIdentifier(CopyIdentifier(declarator->__anon1.identifier));
case 2:
return MkDeclaratorBrackets(CopyDeclarator(declarator->declarator));
case 3:
if(declarator->__anon1.array.enumClass)
return MkDeclaratorEnumArray(CopyDeclarator(declarator->declarator), CopySpecifier(declarator->__anon1.array.enumClass));
else
return MkDeclaratorArray(CopyDeclarator(declarator->declarator), CopyExpression(declarator->__anon1.array.exp));
case 4:
{
struct __ecereNameSpace__ecere__sys__OldList * parameters = MkList();
struct TypeName * param;

if(declarator->__anon1.function.parameters)
{
for(param = (*declarator->__anon1.function.parameters).first; param; param = param->next)
ListAdd(parameters, CopyTypeName(param));
}
return MkDeclaratorFunction(CopyDeclarator(declarator->declarator), parameters);
}
case 5:
return MkDeclaratorPointer(CopyPointer(declarator->__anon1.pointer.pointer), CopyDeclarator(declarator->declarator));
case 6:
return MkDeclaratorExtended(CopyExtDecl(declarator->__anon1.extended.extended), CopyDeclarator(declarator->declarator));
case 7:
return MkDeclaratorExtendedEnd(CopyExtDecl(declarator->__anon1.extended.extended), CopyDeclarator(declarator->declarator));
}
}
return (((void *)0));
}

struct Declaration * CopyDeclaration(struct Declaration * decl)
{
if(decl->type == 1)
{
return MkDeclaration(CopyList(decl->__anon1.__anon1.specifiers, (void *)(CopySpecifier)), CopyList(decl->__anon1.__anon1.declarators, (void *)(CopyInitDeclarator)));
}
else
{
struct __ecereNameSpace__ecere__sys__OldList * specifiers = MkList(), * declarators = MkList();
struct Specifier * spec;
struct Declarator * declarator;

for(spec = (*decl->__anon1.__anon1.specifiers).first; spec; spec = spec->next)
ListAdd(specifiers, CopySpecifier(spec));
if(decl->__anon1.__anon1.declarators)
{
for(declarator = (*decl->__anon1.__anon1.declarators).first; declarator; declarator = declarator->next)
ListAdd(declarators, CopyDeclarator(declarator));
}
return MkDeclaration(specifiers, declarators);
}
}

void __ecereRegisterModule_copy(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CopyIdentifier", "Identifier CopyIdentifier(Identifier id)", CopyIdentifier, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("MoveExpContents", "Expression MoveExpContents(Expression exp)", MoveExpContents, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CopyExpression", "Expression CopyExpression(Expression exp)", CopyExpression, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CopyClassDef", "ClassDef CopyClassDef(ClassDef def)", CopyClassDef, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CopySpecifier", "Specifier CopySpecifier(Specifier spec)", CopySpecifier, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CopyTypeName", "TypeName CopyTypeName(TypeName typeName)", CopyTypeName, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CopyExtDecl", "ExtDecl CopyExtDecl(ExtDecl extDecl)", CopyExtDecl, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CopyAttribute", "Attribute CopyAttribute(Attribute attrib)", CopyAttribute, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CopyAttrib", "Attrib CopyAttrib(Attrib attrib)", CopyAttrib, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CopyDeclarator", "Declarator CopyDeclarator(Declarator declarator)", CopyDeclarator, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CopyInitDeclarator", "InitDeclarator CopyInitDeclarator(InitDeclarator initDecl)", CopyInitDeclarator, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CopyDeclaration", "Declaration CopyDeclaration(Declaration decl)", CopyDeclaration, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CopyList", "ecere::sys::OldList * CopyList(ecere::sys::OldList * source, void * (* CopyFunction)(void *))", CopyList, module, 2);
}

