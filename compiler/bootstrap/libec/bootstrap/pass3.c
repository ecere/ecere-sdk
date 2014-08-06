/* Code generated from eC source file: pass3.ec */
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
enum yytokentype
{
IDENTIFIER = 258, CONSTANT = 259, STRING_LITERAL = 260, SIZEOF = 261, PTR_OP = 262, INC_OP = 263, DEC_OP = 264, LEFT_OP = 265, RIGHT_OP = 266, LE_OP = 267, GE_OP = 268, EQ_OP = 269, NE_OP = 270, AND_OP = 271, OR_OP = 272, MUL_ASSIGN = 273, DIV_ASSIGN = 274, MOD_ASSIGN = 275, ADD_ASSIGN = 276, SUB_ASSIGN = 277, LEFT_ASSIGN = 278, RIGHT_ASSIGN = 279, AND_ASSIGN = 280, XOR_ASSIGN = 281, OR_ASSIGN = 282, TYPE_NAME = 283, TYPEDEF = 284, EXTERN = 285, STATIC = 286, AUTO = 287, REGISTER = 288, CHAR = 289, SHORT = 290, INT = 291, UINT = 292, INT64 = 293, LONG = 294, SIGNED = 295, UNSIGNED = 296, FLOAT = 297, DOUBLE = 298, CONST = 299, VOLATILE = 300, VOID = 301, VALIST = 302, STRUCT = 303, UNION = 304, ENUM = 305, ELLIPSIS = 306, CASE = 307, DEFAULT = 308, IF = 309, SWITCH = 310, WHILE = 311, DO = 312, FOR = 313, GOTO = 314, CONTINUE = 315, BREAK = 316, RETURN = 317, IFX = 318, ELSE = 319, CLASS = 320, THISCLASS = 321, CLASS_NAME = 322, PROPERTY = 323, SETPROP = 324, GETPROP = 325, NEWOP = 326, RENEW = 327, DELETE = 328, EXT_DECL = 329, EXT_STORAGE = 330, IMPORT = 331, DEFINE = 332, VIRTUAL = 333, ATTRIB = 334, PUBLIC = 335, PRIVATE = 336, TYPED_OBJECT = 337, ANY_OBJECT = 338, _INCREF = 339, EXTENSION = 340, ASM = 341, TYPEOF = 342, WATCH = 343, STOPWATCHING = 344, FIREWATCHERS = 345, WATCHABLE = 346, CLASS_DESIGNER = 347, CLASS_NO_EXPANSION = 348, CLASS_FIXED = 349, ISPROPSET = 350, CLASS_DEFAULT_PROPERTY = 351, PROPERTY_CATEGORY = 352, CLASS_DATA = 353, CLASS_PROPERTY = 354, SUBCLASS = 355, NAMESPACE = 356, NEW0OP = 357, RENEW0 = 358, VAARG = 359, DBTABLE = 360, DBFIELD = 361, DBINDEX = 362, DATABASE_OPEN = 363, ALIGNOF = 364, ATTRIB_DEP = 365, __ATTRIB = 366, BOOL = 367, _BOOL = 368, _COMPLEX = 369, _IMAGINARY = 370, RESTRICT = 371, THREAD = 372, WIDE_STRING_LITERAL = 373, BUILTIN_OFFSETOF = 374
};

extern int targetPlatform;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp_Type_isPointerType;

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

struct Context;

struct Attrib;

struct Attribute;

struct Instantiation;

struct MembersInit;

struct MemberInit;

struct ClassFunction;

struct ClassDefinition;

struct PropertyDef;

struct PropertyWatch;

struct TemplateArgument;

struct DBTableEntry;

struct DBIndexItem;

struct DBTableDef;

struct CodePosition
{
int line;
int charPos;
int pos;
int included;
} ecere_gcc_struct;

extern char *  __ecereNameSpace__ecere__sys__CopyString(const char *  string);

struct ModuleImport;

struct ClassImport;

extern void FullClassNameCat(char *  output, const char *  className, unsigned int includeTemplateParams);

extern int strcmp(const char * , const char * );

extern char *  strchr(const char * , int);

extern char *  strcpy(char * , const char * );

extern size_t strlen(const char * );

struct __ecereNameSpace__ecere__com__LinkList
{
void * first;
void * last;
int count;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__LinkElement
{
void * prev;
void * next;
} ecere_gcc_struct;

extern void Compiler_Error(const char *  format, ...);

struct __ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__IteratorPointer;

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern void FreeList(struct __ecereNameSpace__ecere__sys__OldList * list, void (*  FreeFunction)(void * ));

extern struct __ecereNameSpace__ecere__sys__OldList *  MkListOne(void *  item);

extern struct __ecereNameSpace__ecere__sys__OldList *  ast;

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert(struct __ecereNameSpace__ecere__sys__OldList * this, void *  prevItem, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

extern struct Context * curContext;

extern struct Context * globalContext;

struct Location
{
struct CodePosition start;
struct CodePosition end;
} ecere_gcc_struct;

extern struct Location yylloc;

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

extern struct ExtDecl * MkExtDeclString(char * s);

struct External;

extern struct External * curExternal;

extern struct External * DeclareStruct(struct External * neededBy, const char *  name, unsigned int skipNoHead, unsigned int needDereference);

extern void FreeExternal(struct External * external);

struct TopoEdge
{
struct __ecereNameSpace__ecere__com__LinkElement in;
struct __ecereNameSpace__ecere__com__LinkElement out;
struct External * from;
struct External * to;
unsigned int breakable;
} ecere_gcc_struct;

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

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

struct __ecereNameSpace__ecere__com__Property;

extern void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

extern void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object);

extern void __ecereNameSpace__ecere__com__eInstance_Watch(void *  instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

struct Specifier;

extern struct Specifier * CopySpecifier(struct Specifier * spec);

extern void FreeSpecifier(struct Specifier * spec);

extern void FreeSpecifierContents(struct Specifier * spec);

extern struct Specifier * MkSpecifier(int specifier);

extern struct Specifier * MkSpecifierName(const char *  name);

struct Declarator;

extern struct Declarator * SpecDeclFromString(const char *  string, struct __ecereNameSpace__ecere__sys__OldList *  specs, struct Declarator * baseDecl);

extern void FreeDeclarator(struct Declarator * decl);

struct TemplateDatatype
{
struct __ecereNameSpace__ecere__sys__OldList *  specifiers;
struct Declarator * decl;
} ecere_gcc_struct;

extern struct Declarator * QMkPtrDecl(const char *  id);

struct Symbol;

extern struct Symbol * FindClass(const char *  name);

struct Identifier;

extern struct Identifier * MkIdentifier(const char *  string);

extern struct Specifier * MkStructOrUnion(int type, struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * definitions);

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

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

static void InstDeclPassIdentifier(struct Identifier * id)
{
if(strchr(id->string, ':'))
{
char newID[1024];
int c;
char ch;
int len;

strcpy(newID, "__ecereNameSpace__");
len = strlen(newID);
for(c = 0; (ch = id->string[c]); c++)
{
if(ch == ':')
ch = '_';
newID[len++] = ch;
}
newID[len] = 0;
(__ecereNameSpace__ecere__com__eSystem_Delete(id->string), id->string = 0);
id->string = __ecereNameSpace__ecere__sys__CopyString(newID);
}
}

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

extern struct Type * ProcessTypeString(const char *  string, unsigned int staticMethod);

extern struct Type * ProcessType(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * decl);

extern void FreeType(struct Type * type);

struct Expression;

extern struct Expression * MkExpBrackets(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern struct Expression * MoveExpContents(struct Expression * exp);

extern struct Expression * GetNonBracketsExp(struct Expression * exp);

extern void FreeExpContents(struct Expression * exp);

struct TypeName;

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

extern void FreeTypeName(struct TypeName * typeName);

extern struct Expression * MkExpCast(struct TypeName * typeName, struct Expression * expression);

struct Pointer;

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

extern struct Pointer * MkPointer(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Pointer * pointer);

extern struct Declarator * MkDeclaratorPointer(struct Pointer * pointer, struct Declarator * declarator);

struct Pointer
{
struct Pointer * prev;
struct Pointer * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList *  qualifiers;
struct Pointer * pointer;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(const char *  name, const char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

struct __ecereNameSpace__ecere__com__DataMember;

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

struct InitDeclarator;

struct ClassDef;

struct FunctionDefinition;

struct __ecereNameSpace__ecere__com__Method;

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

struct TemplateParameter;

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
} ecere_gcc_struct __anon1;
struct TemplateArgument * defaultArgument;
const char *  dataTypeString;
struct Type * baseType;
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
} ecere_gcc_struct;

unsigned int IsVoidPtrCast(struct TypeName * typeName)
{
unsigned int result = 0;
struct Declarator * d = typeName->declarator;

if(d && d->type == 5 && d->__anon1.pointer.pointer && !d->__anon1.pointer.pointer->pointer)
{
if(typeName->qualifiers)
{
struct Specifier * s;

for(s = (*typeName->qualifiers).first; s; s = s->next)
{
if(s->type == 0 && s->__anon1.specifier == VOID)
result = 1;
}
}
}
return result;
}

unsigned int __ecereProp_Type_Get_isPointerType(struct Type * this);

struct Enumerator;

struct Enumerator
{
struct Enumerator * prev;
struct Enumerator * next;
struct Location loc;
struct Identifier * id;
struct Expression * exp;
} ecere_gcc_struct;

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

struct InitDeclarator
{
struct InitDeclarator * prev;
struct InitDeclarator * next;
struct Location loc;
struct Declarator * declarator;
struct Initializer * initializer;
} ecere_gcc_struct;

struct Declaration;

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
} ecere_gcc_struct __anon1;
int importType;
struct External * fwdDecl;
struct __ecereNameSpace__ecere__com__Instance * outgoing;
struct __ecereNameSpace__ecere__com__Instance * incoming;
int nonBreakableIncoming;
} ecere_gcc_struct;

struct External * __ecereMethod_External_ForwardDeclare();

struct AsmField;

struct AsmField
{
struct AsmField * prev;
struct AsmField * next;
struct Location loc;
char *  command;
struct Expression * expression;
struct Identifier * symbolic;
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

extern void __ecereNameSpace__ecere__com__PrintLn(struct __ecereNameSpace__ecere__com__Class * class, const void * object, ...);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declarator;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TypeName;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Specifier;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Expression;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__LinkList;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_char__PTR_;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TopoEdge;

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

static void ReplaceByInstancePtr(struct Specifier * spec, struct Declarator ** declPtr, int type)
{
struct Declarator * decl = *declPtr;

if(decl && decl->type == 5)
{
if(type == 2)
;
else
decl->__anon1.pointer.pointer = MkPointer((((void *)0)), decl->__anon1.pointer.pointer);
}
else
{
struct Declarator * newDecl = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Declarator);

if(decl)
{
*newDecl = *decl;
decl->declarator = newDecl;
}
else
decl = newDecl;
decl->type = 5;
decl->__anon1.pointer.pointer = MkPointer((((void *)0)), (((void *)0)));
*declPtr = decl;
}
}

static int ReplaceClassSpec(struct __ecereNameSpace__ecere__sys__OldList * specs, struct Specifier * spec, unsigned int param)
{
if(spec->type == 8)
{
struct TemplateParameter * parameter = spec->__anon1.templateParameter;

if(!param && parameter->dataTypeString)
{
struct __ecereNameSpace__ecere__sys__OldList * newSpecs = MkList();
struct Declarator * decl = SpecDeclFromString(parameter->dataTypeString, newSpecs, (((void *)0)));

if((*newSpecs).first)
{
struct Specifier * newSpec = CopySpecifier((*newSpecs).first);

*spec = *newSpec;
((newSpec ? __extension__ ({
void * __ecerePtrToDelete = (newSpec);

__ecereClass_Specifier->Destructor ? __ecereClass_Specifier->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), newSpec = 0);
}
FreeList(newSpecs, (void *)(FreeSpecifier));
if(decl)
{
unsigned int isPointer = decl->type == 5;

if(decl)
FreeDeclarator(decl);
if(isPointer)
return 1;
}
}
else if(!param && parameter->__anon1.dataType)
{
struct __ecereNameSpace__ecere__sys__OldList * newSpecs = parameter->__anon1.dataType->specifiers;
struct Declarator * decl = parameter->__anon1.dataType->decl;

if((*newSpecs).first)
{
struct Specifier * newSpec = CopySpecifier((*newSpecs).first);

*spec = *newSpec;
((newSpec ? __extension__ ({
void * __ecerePtrToDelete = (newSpec);

__ecereClass_Specifier->Destructor ? __ecereClass_Specifier->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), newSpec = 0);
}
if(decl)
{
unsigned int isPointer = decl->type == 5;

if(isPointer)
return 1;
}
}
else
{
spec->type = 1;
spec->__anon1.__anon1.name = __ecereNameSpace__ecere__sys__CopyString("uint64");
spec->__anon1.__anon1.symbol = FindClass("uint64");
}
}
if(spec->type == 1 || spec->type == 7)
{
struct Symbol * classSym = spec->__anon1.__anon1.symbol;

if(spec->type == 7)
{
classSym = FindClass("ecere::com::Class");
}
if(classSym)
{
struct __ecereNameSpace__ecere__com__Class * _class = classSym->__anon1.registered;

FreeSpecifierContents(spec);
spec->type = 1;
if(_class && _class->type == 1)
{
char name[1024];

name[0] = 0;
FullClassNameCat(name, _class->fullName, 0);
FreeSpecifierContents(spec);
spec->type = 3;
spec->__anon1.__anon2.baseSpecs = (((void *)0));
spec->__anon1.__anon2.id = MkIdentifier(name);
spec->__anon1.__anon2.list = (((void *)0));
spec->__anon1.__anon2.definitions = (((void *)0));
spec->__anon1.__anon2.ctx = (((void *)0));
spec->__anon1.__anon2.addNameSpace = 0;
}
else if(_class && _class->type == 5)
{
char name[1024] = "";

FullClassNameCat(name, _class->fullName, 0);
spec->type = 3;
spec->__anon1.__anon2.baseSpecs = (((void *)0));
spec->__anon1.__anon2.id = MkIdentifier(name);
spec->__anon1.__anon2.list = (((void *)0));
spec->__anon1.__anon2.definitions = (((void *)0));
spec->__anon1.__anon2.ctx = (((void *)0));
spec->__anon1.__anon2.addNameSpace = 0;
}
else if(_class)
{
if((_class->type != 1000 || !strcmp(_class->fullName, "enum") || (_class->dataTypeString && !strcmp(_class->dataTypeString, "char *")) || !strcmp(_class->fullName, "uint64") || !strcmp(_class->fullName, "uint32") || !strcmp(_class->fullName, "uint16") || !strcmp(_class->fullName, "uintptr") || !strcmp(_class->fullName, "intptr") || !strcmp(_class->fullName, "uintsize") || !strcmp(_class->fullName, "intsize") || !strcmp(_class->fullName, "uint") || !strcmp(_class->fullName, "byte")))
{
if(_class->dataTypeString)
{
if(!strcmp(_class->dataTypeString, "uint64") || !strcmp(_class->dataTypeString, "uint32") || !strcmp(_class->dataTypeString, "uint16") || !strcmp(_class->dataTypeString, "uintptr") || !strcmp(_class->dataTypeString, "intptr") || !strcmp(_class->dataTypeString, "uintsize") || !strcmp(_class->dataTypeString, "intsize") || !strcmp(_class->dataTypeString, "uint") || !strcmp(_class->dataTypeString, "byte"))
{
if(!_class->dataType)
_class->dataType = ProcessTypeString(_class->dataTypeString, 0);
if(_class->dataType && _class->dataType->kind == 8)
classSym = _class->dataType->__anon1._class;
else
classSym = FindClass(_class->dataTypeString);
_class = classSym ? classSym->__anon1.registered : (((void *)0));
}
spec->__anon1.__anon1.name = __ecereNameSpace__ecere__sys__CopyString(!strcmp(_class->dataTypeString, "char *") ? "char" : _class->dataTypeString);
spec->__anon1.__anon1.symbol = (((void *)0));
}
else
{
spec->__anon1.__anon1.name = __ecereNameSpace__ecere__sys__CopyString((((void *)0)));
spec->__anon1.__anon1.symbol = (((void *)0));
}
}
else if(!_class->base)
{
spec->type = 0;
spec->__anon1.specifier = VOID;
return 1;
}
}
else
{
spec->type = 3;
spec->__anon1.__anon2.id = MkIdentifier("__ecereNameSpace__ecere__com__Instance");
spec->__anon1.__anon2.list = (((void *)0));
spec->__anon1.__anon2.baseSpecs = (((void *)0));
spec->__anon1.__anon2.definitions = (((void *)0));
spec->__anon1.__anon2.ctx = (((void *)0));
spec->__anon1.__anon2.addNameSpace = 0;
}
if(_class && _class->dataTypeString && !strcmp(_class->dataTypeString, "char *"))
return 1;
if(!_class || _class->type == 0 || _class->type == 5)
return 1;
else if(param && _class->type == 1)
return 2;
}
}
else if(spec->type == 0)
{
if(spec->__anon1.specifier == ANY_OBJECT || spec->__anon1.specifier == CLASS)
{
spec->__anon1.specifier = CONST;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(specs, MkSpecifier(VOID));
return 1;
}
}
return 0;
}

void TopoSort(struct __ecereNameSpace__ecere__sys__OldList * input)
{
struct __ecereNameSpace__ecere__sys__OldList L =
{
0, 0, 0, 0, 0
};
struct __ecereNameSpace__ecere__sys__OldList S =
{
0, 0, 0, 0, 0
};
struct __ecereNameSpace__ecere__sys__OldList B =
{
0, 0, 0, 0, 0
};
struct External * n, * next;

for(n = (*input).first; n; n = next)
{
next = n->next;
if(n->type == 1 && !n->__anon1.declaration)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*input), n);
if(n->symbol && n->symbol->__anon2.__anon1.structExternal == n)
n->symbol->__anon2.__anon1.structExternal = (((void *)0));
FreeExternal(n);
}
else if(!((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)n->incoming + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->count)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*input), n);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&S, n);
}
else if(!n->nonBreakableIncoming)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*input), n);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&B, n);
}
}
while(1)
{
struct TopoEdge * e, * ne;

if((n = S.first))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&S, (struct __ecereNameSpace__ecere__com__IteratorPointer *)n);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&L, n);
for(e = ((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)n->outgoing + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->first; e; e = ne)
{
struct External * m = e->to;
struct __ecereNameSpace__ecere__sys__OldList * list;

if(m->nonBreakableIncoming)
{
list = input;
}
else
{
list = &B;
}
if(!(*list).count)
__ecereNameSpace__ecere__com__PrintLn(__ecereClass_char__PTR_, "!!! Something's wrong !!!", (void *)0);
ne = e->out.next;
if(!e->breakable)
{
m->nonBreakableIncoming--;
}
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = n->outgoing;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(n->outgoing, (struct __ecereNameSpace__ecere__com__IteratorPointer *)e);
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = m->incoming;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(m->incoming, (struct __ecereNameSpace__ecere__com__IteratorPointer *)e);
((e ? __extension__ ({
void * __ecerePtrToDelete = (e);

__ecereClass_TopoEdge->Destructor ? __ecereClass_TopoEdge->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), e = 0);
if(!((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)m->incoming + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->count)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*list), m);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&S, m);
}
else if(!m->nonBreakableIncoming)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*list), m);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&B, m);
}
}
}
else if((n = B.first))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&B, (struct __ecereNameSpace__ecere__com__IteratorPointer *)n);
for(e = ((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)n->incoming + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->first; e; e = ne)
{
struct TopoEdge * e2, * n2;
struct External * m = e->from;
struct External * f;

f = __ecereMethod_External_ForwardDeclare(m);
ne = e->in.next;
{
struct External * c, * next;

for(c = (*input).first; c; c = next)
{
next = c->next;
if(!((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)c->incoming + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->count)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*input), c);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&S, c);
}
else if(!c->nonBreakableIncoming)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*input), c);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&B, c);
}
}
}
for(e2 = ((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)m->outgoing + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->first; e2; e2 = n2)
{
n2 = e2->out.next;
if(e2->breakable)
{
struct External * to = e2->to;

if(e2 == e)
;
else
;
e2->breakable = 0;
e2->from = f;
((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * it))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = m->outgoing;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove])(m->outgoing, (struct __ecereNameSpace__ecere__com__IteratorPointer *)e2);
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f->outgoing;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__LinkList->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(f->outgoing, (uint64)(uintptr_t)(e2));
to->nonBreakableIncoming++;
if(e2 != e && to->nonBreakableIncoming == 1)
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(&B, to);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*input), to);
}
}
}
if(!((struct __ecereNameSpace__ecere__com__LinkList *)(((char *)f->incoming + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->count)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&S, f);
else if(!f->nonBreakableIncoming)
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&B, f);
else
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*input), f);
if(S.first)
break;
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*input), n);
}
else
{
if((*input).count)
{
Compiler_Error("declarations cycles found\n");
}
else
*input = L;
break;
}
}
for(n = (*input).first; n; n = next)
{
next = n->next;
if(n->type == 1 && (!n->__anon1.declaration || ((!n->__anon1.declaration->__anon1.__anon1.specifiers || !(*n->__anon1.declaration->__anon1.__anon1.specifiers).count) && (!n->__anon1.declaration->__anon1.__anon1.declarators || !(*n->__anon1.declaration->__anon1.__anon1.declarators).count))))
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*input), n);
if(n->symbol && n->symbol->__anon2.__anon1.structExternal == n)
n->symbol->__anon2.__anon1.structExternal = (((void *)0));
FreeExternal(n);
}
}
}

void __ecereUnregisterModule_pass3(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

struct Statement;

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
} ecere_gcc_struct YYSTYPE;

extern YYSTYPE yylval;

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
} ecere_gcc_struct;

static void AddPointerCast(struct Expression * e)
{
struct Type * src = e->expType;

if(src && (src->kind == 20 || src->kind == 8))
{
if(e->type != 11 || !IsVoidPtrCast(e->__anon1.cast.typeName))
{
if(src)
src->refCount++;
if(src->kind == 20 && src->__anon1.templateParameter && src->__anon1.templateParameter->type == 0)
{
struct Type * newType = (((void *)0));

if(src->__anon1.templateParameter->dataTypeString)
newType = ProcessTypeString(src->__anon1.templateParameter->dataTypeString, 0);
else if(src->__anon1.templateParameter->__anon1.dataType)
newType = ProcessType(src->__anon1.templateParameter->__anon1.dataType->specifiers, src->__anon1.templateParameter->__anon1.dataType->decl);
if(newType)
{
FreeType(src);
src = newType;
}
}
if(src && src->kind == 8 && src->__anon1._class)
{
struct __ecereNameSpace__ecere__com__Class * sc = src->__anon1._class->__anon1.registered;

if(src->thisClassFrom && src->thisClassFrom->base)
sc = src->thisClassFrom;
if(sc && (sc->type == 1 || sc->type == 5))
{
struct Type * dest = e->destType;

if(dest && (dest->kind == 20 || dest->kind == 8))
{
if(dest)
dest->refCount++;
if(dest->kind == 20 && dest->__anon1.templateParameter && dest->__anon1.templateParameter->type == 0)
{
struct Type * newType = (((void *)0));

if(dest->__anon1.templateParameter->dataTypeString)
newType = ProcessTypeString(dest->__anon1.templateParameter->dataTypeString, 0);
else if(dest->__anon1.templateParameter->__anon1.dataType)
newType = ProcessType(dest->__anon1.templateParameter->__anon1.dataType->specifiers, dest->__anon1.templateParameter->__anon1.dataType->decl);
if(newType)
{
FreeType(dest);
dest = newType;
}
}
if(!dest->passAsTemplate && dest->kind == 8 && dest->__anon1._class && dest->__anon1._class->__anon1.registered)
{
struct __ecereNameSpace__ecere__com__Class * dc = dest->__anon1._class->__anon1.registered;

if(sc->templateClass)
sc = sc->templateClass;
if(dc->templateClass)
dc = dc->templateClass;
if(dc->base && sc != dc)
{
e->__anon1.cast.exp = MkExpBrackets(MkListOne(MoveExpContents(e)));
e->type = 11;
e->__anon1.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), QMkPtrDecl((((void *)0))));
}
}
FreeType(dest);
}
}
}
FreeType(src);
}
}
else if(src && src->kind == 22 && e->destType && e->destType->classObjectType)
{
struct Expression * nbExp = GetNonBracketsExp(e);

if(nbExp->type != 11 || !IsVoidPtrCast(nbExp->__anon1.cast.typeName))
{
e->__anon1.cast.exp = MkExpBrackets(MkListOne(MoveExpContents(e)));
e->type = 11;
e->__anon1.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), QMkPtrDecl((((void *)0))));
}
}
}

static void InstDeclPassDeclaration(struct Declaration *  decl);

static void InstDeclPassSpecifier(struct Specifier * spec, unsigned int byRefTypedObject)
{
switch(spec->type)
{
case 0:
if(spec->__anon1.specifier == TYPED_OBJECT)
{
spec->type = 5;
spec->__anon1.__anon1.extDecl = MkExtDeclString(__ecereNameSpace__ecere__sys__CopyString(byRefTypedObject ? "struct __ecereNameSpace__ecere__com__Class * class, void *" : "struct __ecereNameSpace__ecere__com__Class * class, const void *"));
DeclareStruct(curExternal, "ecere::com::Class", 0, 1);
}
break;
case 1:
break;
case 2:
{
struct Enumerator * e;

if(spec->__anon1.__anon2.list)
{
for(e = (*spec->__anon1.__anon2.list).first; e; e = e->next)
{
}
}
break;
}
case 3:
case 4:
{
if(spec->__anon1.__anon2.definitions)
{
struct ClassDef * def;

for(def = (*spec->__anon1.__anon2.definitions).first; def; def = def->next)
if(def->__anon1.decl)
InstDeclPassDeclaration(def->__anon1.decl);
}
if(spec->__anon1.__anon2.id)
InstDeclPassIdentifier(spec->__anon1.__anon2.id);
break;
}
case 5:
if(spec->__anon1.__anon1.extDecl && spec->__anon1.__anon1.extDecl->type == 0 && spec->__anon1.__anon1.extDecl->__anon1.s)
{
if(!strcmp(spec->__anon1.__anon1.extDecl->__anon1.s, "dllexport"))
{
struct Specifier * prevSpec;

(__ecereNameSpace__ecere__com__eSystem_Delete(spec->__anon1.__anon1.extDecl->__anon1.s), spec->__anon1.__anon1.extDecl->__anon1.s = 0);
for(prevSpec = spec->prev; prevSpec; prevSpec = prevSpec->prev)
if(prevSpec->type == 0 && prevSpec->__anon1.specifier == EXTERN)
break;
if(prevSpec)
{
if(targetPlatform == 1)
spec->__anon1.__anon1.extDecl->__anon1.s = __ecereNameSpace__ecere__sys__CopyString("__declspec(dllexport)");
else
spec->__anon1.__anon1.extDecl->__anon1.s = __ecereNameSpace__ecere__sys__CopyString("__attribute__ ((visibility(\"default\")))");
}
else
{
if(targetPlatform == 1)
spec->__anon1.__anon1.extDecl->__anon1.s = __ecereNameSpace__ecere__sys__CopyString("extern __declspec(dllexport)");
else
spec->__anon1.__anon1.extDecl->__anon1.s = __ecereNameSpace__ecere__sys__CopyString("extern __attribute__ ((visibility(\"default\")))");
}
}
else if(!strcmp(spec->__anon1.__anon1.extDecl->__anon1.s, "stdcall") || !strcmp(spec->__anon1.__anon1.extDecl->__anon1.s, "_stdcall") || !strcmp(spec->__anon1.__anon1.extDecl->__anon1.s, "__stdcall") || !strcmp(spec->__anon1.__anon1.extDecl->__anon1.s, "__stdcall__"))
{
(__ecereNameSpace__ecere__com__eSystem_Delete(spec->__anon1.__anon1.extDecl->__anon1.s), spec->__anon1.__anon1.extDecl->__anon1.s = 0);
spec->__anon1.__anon1.extDecl->__anon1.s = __ecereNameSpace__ecere__sys__CopyString("ecere_stdcall");
}
}
break;
}
}

void InstDeclPassTypeName(struct TypeName *  type, unsigned int param);

static void InstDeclPassDeclarator(struct Declarator * decl)
{
switch(decl->type)
{
case 0:
if(decl->declarator)
InstDeclPassDeclarator(decl->declarator);
break;
case 1:
{
if(decl->__anon1.identifier)
InstDeclPassIdentifier(decl->__anon1.identifier);
break;
}
case 2:
if(decl->declarator)
InstDeclPassDeclarator(decl->declarator);
break;
case 3:
if(decl->declarator)
InstDeclPassDeclarator(decl->declarator);
break;
case 4:
{
if(decl->declarator)
InstDeclPassDeclarator(decl->declarator);
if(decl->__anon1.function.parameters)
{
struct TypeName * type;

if(decl->declarator)
InstDeclPassDeclarator(decl->declarator);
for(type = (*decl->__anon1.function.parameters).first; type; type = type->next)
{
unsigned int typedObject = 0;
struct Specifier * spec = (((void *)0));

if(type->qualifiers)
{
spec = (struct Specifier *)(*type->qualifiers).first;
if(spec && spec->type == 1 && !strcmp(spec->__anon1.__anon1.name, "class"))
typedObject = 1;
}
InstDeclPassTypeName(type, 1);
if(typedObject)
{
struct TypeName * _class = (_class = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_TypeName), _class->qualifiers = MkListOne(MkStructOrUnion(3, MkIdentifier("__ecereNameSpace__ecere__com__Class"), (((void *)0)))), _class->declarator = MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), MkDeclaratorIdentifier(MkIdentifier("class"))), _class);

DeclareStruct(curExternal, "ecere::com::Class", 0, 1);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Insert((&*decl->__anon1.function.parameters), spec->prev, _class);
}
}
}
break;
}
case 5:
case 6:
case 7:
if((decl->type == 6 || decl->type == 7) && decl->__anon1.extended.extended)
{
if(decl->__anon1.extended.extended->type == 0 && decl->__anon1.extended.extended->__anon1.s && !strcmp(decl->__anon1.extended.extended->__anon1.s, "dllexport"))
{
(__ecereNameSpace__ecere__com__eSystem_Delete(decl->__anon1.extended.extended->__anon1.s), decl->__anon1.extended.extended->__anon1.s = 0);
if(targetPlatform == 1)
decl->__anon1.extended.extended->__anon1.s = __ecereNameSpace__ecere__sys__CopyString("extern __declspec(dllexport)");
else
decl->__anon1.extended.extended->__anon1.s = __ecereNameSpace__ecere__sys__CopyString("extern __attribute__ ((visibility(\"default\")))");
}
else if(decl->__anon1.extended.extended->type == 0 && decl->__anon1.extended.extended->__anon1.s && (!strcmp(decl->__anon1.extended.extended->__anon1.s, "stdcall") || !strcmp(decl->__anon1.extended.extended->__anon1.s, "_stdcall") || !strcmp(decl->__anon1.extended.extended->__anon1.s, "__stdcall") || !strcmp(decl->__anon1.extended.extended->__anon1.s, "__stdcall__")))
{
(__ecereNameSpace__ecere__com__eSystem_Delete(decl->__anon1.extended.extended->__anon1.s), decl->__anon1.extended.extended->__anon1.s = 0);
decl->__anon1.extended.extended->__anon1.s = __ecereNameSpace__ecere__sys__CopyString("ecere_stdcall");
}
}
if(decl->declarator)
InstDeclPassDeclarator(decl->declarator);
break;
}
}

void InstDeclPassTypeName(struct TypeName * type, unsigned int param)
{
if(type->qualifiers)
{
struct Specifier * spec;

for(spec = (*type->qualifiers).first; spec; spec = spec->next)
{
int result;

if((result = ReplaceClassSpec(type->qualifiers, spec, param)))
ReplaceByInstancePtr(spec, &type->declarator, result);
else
{
struct Symbol * classSym = (spec->type == 1) ? spec->__anon1.__anon1.symbol : (((void *)0));

if(type->classObjectType && (!classSym || (classSym && classSym->__anon1.registered && (classSym->__anon1.registered->type == 4 || classSym->__anon1.registered->type == 2 || classSym->__anon1.registered->type == 3))))
ReplaceByInstancePtr(spec, &type->declarator, 2);
}
InstDeclPassSpecifier(spec, type->declarator && type->declarator->type == 5);
}
}
if(type->declarator)
InstDeclPassDeclarator(type->declarator);
}

static void InstDeclPassExpression(struct Expression *  exp);

static void InstDeclPassInitializer(struct Initializer * init)
{
switch(init->type)
{
case 0:
if(init->__anon1.exp)
{
InstDeclPassExpression(init->__anon1.exp);
AddPointerCast(init->__anon1.exp);
}
break;
case 1:
{
struct Initializer * i;

for(i = (*init->__anon1.list).first; i; i = i->next)
InstDeclPassInitializer(i);
break;
}
}
}

static void InstDeclPassStatement(struct Statement * stmt)
{
switch(stmt->type)
{
case 14:
if(stmt->__anon1.decl)
InstDeclPassDeclaration(stmt->__anon1.decl);
break;
case 0:
InstDeclPassStatement(stmt->__anon1.labeled.stmt);
break;
case 1:
if(stmt->__anon1.caseStmt.exp)
InstDeclPassExpression(stmt->__anon1.caseStmt.exp);
if(stmt->__anon1.caseStmt.stmt)
InstDeclPassStatement(stmt->__anon1.caseStmt.stmt);
break;
case 2:
{
struct Declaration * decl;
struct Statement * s;
struct Context * prevContext = curContext;

if(!stmt->__anon1.compound.isSwitch)
curContext = stmt->__anon1.compound.context;
if(stmt->__anon1.compound.declarations)
{
for(decl = (*stmt->__anon1.compound.declarations).first; decl; decl = decl->next)
InstDeclPassDeclaration(decl);
}
if(stmt->__anon1.compound.statements)
{
for(s = (*stmt->__anon1.compound.statements).first; s; s = s->next)
InstDeclPassStatement(s);
}
curContext = prevContext;
break;
}
case 3:
{
if(stmt->__anon1.expressions)
{
struct Expression * exp;

for(exp = (*stmt->__anon1.expressions).first; exp; exp = exp->next)
InstDeclPassExpression(exp);
}
break;
}
case 4:
{
if(stmt->__anon1.ifStmt.exp)
{
struct Expression * exp;

for(exp = (*stmt->__anon1.ifStmt.exp).first; exp; exp = exp->next)
InstDeclPassExpression(exp);
}
if(stmt->__anon1.ifStmt.stmt)
InstDeclPassStatement(stmt->__anon1.ifStmt.stmt);
if(stmt->__anon1.ifStmt.elseStmt)
InstDeclPassStatement(stmt->__anon1.ifStmt.elseStmt);
break;
}
case 5:
{
struct Expression * exp;

if(stmt->__anon1.switchStmt.exp)
{
for(exp = (*stmt->__anon1.switchStmt.exp).first; exp; exp = exp->next)
InstDeclPassExpression(exp);
}
InstDeclPassStatement(stmt->__anon1.switchStmt.stmt);
break;
}
case 6:
{
struct Expression * exp;

if(stmt->__anon1.whileStmt.exp)
{
for(exp = (*stmt->__anon1.whileStmt.exp).first; exp; exp = exp->next)
InstDeclPassExpression(exp);
}
InstDeclPassStatement(stmt->__anon1.whileStmt.stmt);
break;
}
case 7:
{
if(stmt->__anon1.doWhile.exp)
{
struct Expression * exp;

for(exp = (*stmt->__anon1.doWhile.exp).first; exp; exp = exp->next)
InstDeclPassExpression(exp);
}
if(stmt->__anon1.doWhile.stmt)
InstDeclPassStatement(stmt->__anon1.doWhile.stmt);
break;
}
case 8:
{
struct Expression * exp;

if(stmt->__anon1.forStmt.init)
InstDeclPassStatement(stmt->__anon1.forStmt.init);
if(stmt->__anon1.forStmt.check)
InstDeclPassStatement(stmt->__anon1.forStmt.check);
if(stmt->__anon1.forStmt.increment)
{
for(exp = (*stmt->__anon1.forStmt.increment).first; exp; exp = exp->next)
InstDeclPassExpression(exp);
}
if(stmt->__anon1.forStmt.stmt)
InstDeclPassStatement(stmt->__anon1.forStmt.stmt);
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
for(exp = (*stmt->__anon1.expressions).first; exp; exp = exp->next)
InstDeclPassExpression(exp);
AddPointerCast((*stmt->__anon1.expressions).last);
}
break;
}
case 13:
{
struct AsmField * field;

if(stmt->__anon1.asmStmt.inputFields)
{
for(field = (*stmt->__anon1.asmStmt.inputFields).first; field; field = field->next)
if(field->expression)
InstDeclPassExpression(field->expression);
}
if(stmt->__anon1.asmStmt.outputFields)
{
for(field = (*stmt->__anon1.asmStmt.outputFields).first; field; field = field->next)
if(field->expression)
InstDeclPassExpression(field->expression);
}
if(stmt->__anon1.asmStmt.clobberedFields)
{
for(field = (*stmt->__anon1.asmStmt.clobberedFields).first; field; field = field->next)
if(field->expression)
InstDeclPassExpression(field->expression);
}
break;
}
}
}

static void InstDeclPassDeclaration(struct Declaration * decl)
{
switch(decl->type)
{
case 1:
{
if(decl->__anon1.__anon1.specifiers)
{
struct Specifier * spec;

for(spec = (*decl->__anon1.__anon1.specifiers).first; spec; spec = spec->next)
{
int type;

if((type = ReplaceClassSpec(decl->__anon1.__anon1.specifiers, spec, 0)))
{
struct InitDeclarator * d;

if(decl->__anon1.__anon1.declarators)
{
for(d = (*decl->__anon1.__anon1.declarators).first; d; d = d->next)
ReplaceByInstancePtr(spec, &d->declarator, type);
}
}
InstDeclPassSpecifier(spec, 0);
}
}
if(decl->__anon1.__anon1.declarators)
{
struct InitDeclarator * d;

for(d = (*decl->__anon1.__anon1.declarators).first; d; d = d->next)
{
InstDeclPassDeclarator(d->declarator);
if(d->initializer)
InstDeclPassInitializer(d->initializer);
}
}
break;
}
case 0:
{
if(decl->__anon1.__anon1.specifiers)
{
struct Specifier * spec;

for(spec = (*decl->__anon1.__anon1.specifiers).first; spec; spec = spec->next)
{
int type;

if((type = ReplaceClassSpec(decl->__anon1.__anon1.specifiers, spec, 0)))
{
if(decl->__anon1.__anon1.declarators)
{
struct Declarator * d;

for(d = (*decl->__anon1.__anon1.declarators).first; d; d = d->next)
ReplaceByInstancePtr(spec, &d, type);
}
}
InstDeclPassSpecifier(spec, 0);
}
}
if(decl->__anon1.__anon1.declarators)
{
struct Declarator * d;

for(d = (*decl->__anon1.__anon1.declarators).first; d; d = d->next)
InstDeclPassDeclarator(d);
}
break;
}
case 2:
break;
}
}

static void InstDeclPassExpression(struct Expression * exp)
{
switch(exp->type)
{
case 0:
{
if(exp->__anon1.__anon1.identifier)
InstDeclPassIdentifier(exp->__anon1.__anon1.identifier);
break;
}
case 2:
break;
case 3:
break;
case 4:
if(exp->__anon1.op.exp1)
InstDeclPassExpression(exp->__anon1.op.exp1);
if(exp->__anon1.op.exp2)
{
InstDeclPassExpression(exp->__anon1.op.exp2);
if(exp->__anon1.op.op != '=' && exp->__anon1.op.exp1 && exp->__anon1.op.exp1->expType && exp->__anon1.op.exp1->expType->kind == 13 && exp->__anon1.op.exp1->expType->__anon1.type && exp->__anon1.op.exp1->expType->__anon1.type->kind == 20 && exp->__anon1.op.exp2->expType && exp->__anon1.op.exp2->expType->kind == 13 && exp->__anon1.op.exp2->expType->__anon1.type && exp->__anon1.op.exp2->expType->__anon1.type->kind == 20)
{
struct Expression * e = exp->__anon1.op.exp2;

e->__anon1.cast.exp = MkExpBrackets(MkListOne(MoveExpContents(e)));
e->type = 11;
e->__anon1.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), QMkPtrDecl((((void *)0))));
e = exp->__anon1.op.exp1;
e->__anon1.cast.exp = MkExpBrackets(MkListOne(MoveExpContents(e)));
e->type = 11;
e->__anon1.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), QMkPtrDecl((((void *)0))));
}
else if(exp->__anon1.op.exp1 && (exp->__anon1.op.op == '=' || exp->__anon1.op.op == EQ_OP || exp->__anon1.op.op == NE_OP))
AddPointerCast(exp->__anon1.op.exp2);
}
break;
case 32:
case 5:
{
struct Expression * e;

for(e = (*exp->__anon1.list).first; e; e = e->next)
InstDeclPassExpression(e);
break;
}
case 6:
{
struct Expression * e;

InstDeclPassExpression(exp->__anon1.index.exp);
for(e = (*exp->__anon1.index.index).first; e; e = e->next)
InstDeclPassExpression(e);
break;
}
case 7:
{
struct Expression * e;

InstDeclPassExpression(exp->__anon1.call.exp);
if(exp->__anon1.call.arguments)
{
for(e = (*exp->__anon1.call.arguments).first; e; e = e->next)
{
unsigned int addCast = 0;

InstDeclPassExpression(e);
AddPointerCast(e);
if(e->expType && e->expType->kind == 13 && e->expType->__anon1.type && (e->expType->__anon1.type->kind == 8 || (e->expType->__anon1.type->kind == 13 && e->expType->__anon1.type->__anon1.type && e->expType->__anon1.type->__anon1.type->kind != 0)) && e->destType && e->destType->kind == 13 && e->destType->__anon1.type && e->destType->__anon1.type->kind == 13 && e->destType->__anon1.type->__anon1.type && e->destType->__anon1.type->__anon1.type->kind == 0)
addCast = 1;
else if(e->expType && e->expType->kind == 8 && e->expType->__anon1._class && e->expType->__anon1._class->__anon1.registered && e->expType->__anon1._class->__anon1.registered->type == 1 && e->byReference && e->destType && e->destType->kind == 8 && e->destType->classObjectType && e->destType->byReference)
addCast = 1;
if(addCast && (e->type != 11 || !IsVoidPtrCast(e->__anon1.cast.typeName)))
{
e->__anon1.cast.exp = MkExpBrackets(MkListOne(MoveExpContents(e)));
e->type = 11;
e->__anon1.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), QMkPtrDecl((((void *)0))));
}
}
}
break;
}
case 8:
{
if(exp->__anon1.member.exp)
InstDeclPassExpression(exp->__anon1.member.exp);
break;
}
case 9:
{
if(exp->__anon1.member.exp)
InstDeclPassExpression(exp->__anon1.member.exp);
break;
}
case 10:
InstDeclPassTypeName(exp->__anon1.typeName, 0);
break;
case 11:
{
struct Type * type = exp->expType;

if(type && type->kind == 8 && type->__anon1._class->__anon1.registered && type->__anon1._class->__anon1.registered->type == 1 && !exp->needCast)
{
if(exp->destType && exp->destType->classObjectType == 2 && exp->destType->byReference)
{
FreeTypeName(exp->__anon1.cast.typeName);
exp->__anon1.cast.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer((((void *)0)), MkPointer((((void *)0)), (((void *)0)))), (((void *)0))));
}
else
{
struct Expression * castExp = exp->__anon1.cast.exp;
struct Expression * prev = exp->prev, * next = exp->next;

exp->__anon1.cast.exp = (((void *)0));
FreeExpContents(exp);
FreeType(exp->expType);
FreeType(exp->destType);
*exp = *castExp;
((castExp ? __extension__ ({
void * __ecerePtrToDelete = (castExp);

__ecereClass_Expression->Destructor ? __ecereClass_Expression->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), castExp = 0);
exp->prev = prev;
exp->next = next;
InstDeclPassExpression(exp);
}
}
else
{
if(exp->expType && exp->expType->kind == 13)
{
if(exp->__anon1.cast.exp && exp->__anon1.cast.exp->expType && exp->__anon1.cast.exp->expType->kind == 20 && !__ecereProp_Type_Get_isPointerType(exp->__anon1.cast.exp->expType))
exp->__anon1.cast.exp = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), (((void *)0))), exp->__anon1.cast.exp);
}
InstDeclPassTypeName(exp->__anon1.cast.typeName, ((unsigned int)((exp->usage & 0x4) >> 2)));
if(exp->__anon1.cast.exp)
{
if(exp->expType && exp->expType->kind == 20 && exp->destType && (exp->destType->passAsTemplate || (!exp->destType->__anon1.templateParameter || (!exp->destType->__anon1.templateParameter->__anon1.dataType && !exp->destType->__anon1.templateParameter->dataTypeString))) && exp->__anon1.cast.exp->expType && !exp->__anon1.cast.exp->expType->passAsTemplate && __ecereProp_Type_Get_isPointerType(exp->__anon1.cast.exp->expType))
exp->__anon1.cast.exp = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), (((void *)0))), exp->__anon1.cast.exp);
InstDeclPassExpression(exp->__anon1.cast.exp);
}
}
break;
}
case 12:
{
struct Expression * e;

InstDeclPassExpression(exp->__anon1.cond.cond);
for(e = (*exp->__anon1.cond.exp).first; e; e = e->next)
InstDeclPassExpression(e);
InstDeclPassExpression(exp->__anon1.cond.elseExp);
break;
}
case 23:
{
InstDeclPassStatement(exp->__anon1.compound);
break;
}
case 34:
{
InstDeclPassExpression(exp->__anon1.vaArg.exp);
break;
}
case 33:
{
InstDeclPassTypeName(exp->__anon1.initializer.typeName, 0);
InstDeclPassInitializer(exp->__anon1.initializer.initializer);
break;
}
}
}

void ProcessInstanceDeclarations()
{
struct External * external;

curContext = globalContext;
for(external = (*ast).first; external; external = external->next)
{
curExternal = external;
if(external->type == 0)
{
struct FunctionDefinition * func = external->__anon1.function;

if(func->specifiers)
{
struct Specifier * spec;

for(spec = (*func->specifiers).first; spec; spec = spec->next)
{
int type;

if((type = ReplaceClassSpec(func->specifiers, spec, 0)))
ReplaceByInstancePtr(spec, &func->declarator, type);
InstDeclPassSpecifier(spec, 0);
}
}
InstDeclPassDeclarator(func->declarator);
if(func->body)
InstDeclPassStatement(func->body);
}
else if(external->type == 1)
{
if(external->__anon1.declaration)
InstDeclPassDeclaration(external->__anon1.declaration);
}
}
TopoSort(ast);
}

void __ecereRegisterModule_pass3(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("InstDeclPassTypeName", "void InstDeclPassTypeName(TypeName type, bool param)", InstDeclPassTypeName, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("IsVoidPtrCast", "bool IsVoidPtrCast(TypeName typeName)", IsVoidPtrCast, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("TopoSort", "void TopoSort(ecere::sys::OldList * input)", TopoSort, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ProcessInstanceDeclarations", "void ProcessInstanceDeclarations(void)", ProcessInstanceDeclarations, module, 1);
}

