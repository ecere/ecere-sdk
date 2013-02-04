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

struct ClassDefinition;

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

struct FunctionDefinition;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBTableDef;

struct DBTableDef;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_External;

struct External;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ModuleImport;

struct ModuleImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassImport;

struct ClassImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Symbol;

struct Symbol;

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

extern struct Identifier * MkIdentifier(char *  string);

struct Specifier * CopySpecifier(struct Specifier * spec);

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

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern void ListAdd(struct __ecereNameSpace__ecere__sys__OldList * list, void *  item);

extern struct Pointer * MkPointer(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Pointer * pointer);

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

extern struct Initializer * MkInitializerAssignment(struct Expression * exp);

struct Expression * CopyExpression(struct Expression * exp);

extern struct Initializer * MkInitializerList(struct __ecereNameSpace__ecere__sys__OldList * list);

struct __ecereNameSpace__ecere__sys__OldList *  CopyList(struct __ecereNameSpace__ecere__sys__OldList *  source, void *  (*  CopyFunction)(void * ));

static struct Initializer * CopyInitializer(struct Initializer * initializer)
{
struct Initializer * copy = (((void *)0));

;
if(initializer->type == 0)
copy = MkInitializerAssignment(CopyExpression(initializer->exp));
else if(initializer->type == 1)
copy = MkInitializerList(CopyList(initializer->list, CopyInitializer));
if(copy)
{
copy->loc = initializer->loc;
copy->isConstant = initializer->isConstant;
}
return copy;
}

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

extern struct MemberInit * MkMemberInit(struct __ecereNameSpace__ecere__sys__OldList * ids, struct Initializer * initializer);

static struct MemberInit * CopyMemberInit(struct MemberInit * member)
{
return MkMemberInit(CopyList(member->identifiers, CopyIdentifier), CopyInitializer(member->initializer));
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassFunction;

struct ClassFunction;

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

extern struct MembersInit * MkMembersInitList(struct __ecereNameSpace__ecere__sys__OldList * dataMembers);

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
for(member = (*members->dataMembers).first; member; member = member->next)
ListAdd(list, CopyMemberInit(member));
}
}
}
return MkMembersInitList(list);
}

extern struct Instantiation * MkInstantiation(struct Specifier * _class, struct Expression * exp, struct __ecereNameSpace__ecere__sys__OldList * members);

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
copy->loc = inst->loc;
copy->isConstant = inst->isConstant;
return copy;
}

extern struct Expression * MkExpDummy(void);

extern struct Expression * MkExpIdentifier(struct Identifier * id);

extern struct Expression * MkExpInstance(struct Instantiation * inst);

extern struct Expression * MkExpConstant(char *  string);

extern struct Expression * MkExpString(char *  string);

extern struct Expression * MkExpOp(struct Expression * exp1, int op, struct Expression * exp2);

extern struct Expression * MkExpBrackets(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern struct Expression * MkExpIndex(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * index);

extern struct Expression * MkExpCall(struct Expression * expression, struct __ecereNameSpace__ecere__sys__OldList * arguments);

extern struct Expression * MkExpMember(struct Expression * expression, struct Identifier * member);

extern struct Expression * MkExpPointer(struct Expression * expression, struct Identifier * member);

extern struct Expression * MkExpTypeSize(struct TypeName * typeName);

struct TypeName * CopyTypeName(struct TypeName * typeName);

extern struct Expression * MkExpTypeAlign(struct TypeName * typeName);

extern struct Expression * MkExpCast(struct TypeName * typeName, struct Expression * expression);

extern struct Expression * MkExpCondition(struct Expression * cond, struct __ecereNameSpace__ecere__sys__OldList * expressions, struct Expression * elseExp);

extern struct Expression * MkExpVaArg(struct Expression * exp, struct TypeName * type);

extern struct Expression * MkExpExtensionCompound(struct Statement * compound);

static struct Statement * CopyStatement(struct Statement * stmt);

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
result = MkExpIdentifier(CopyIdentifier(exp->identifier));
break;
case 1:
result = MkExpInstance(CopyInstantiation(exp->instance));
break;
case 2:
result = MkExpConstant(exp->string);
break;
case 3:
result = MkExpString(exp->string);
break;
case 4:
result = MkExpOp(CopyExpression(exp->op.exp1), exp->op.op, CopyExpression(exp->op.exp2));
break;
case 5:
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct Expression * e;

for(e = (*exp->list).first; e; e = e->next)
ListAdd(list, CopyExpression(e));
result = MkExpBrackets(list);
break;
}
case 6:
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct Expression * e;

for(e = (*exp->index.index).first; e; e = e->next)
ListAdd(list, CopyExpression(e));
result = MkExpIndex(CopyExpression(exp->index.exp), list);
break;
}
case 7:
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct Expression * arg;

if(exp->call.arguments)
{
for(arg = (*exp->call.arguments).first; arg; arg = arg->next)
ListAdd(list, CopyExpression(arg));
}
result = MkExpCall(CopyExpression(exp->call.exp), list);
break;
}
case 8:
result = MkExpMember(CopyExpression(exp->member.exp), CopyIdentifier(exp->member.member));
result->member.memberType = exp->member.memberType;
result->member.thisPtr = exp->member.thisPtr;
break;
case 9:
result = MkExpPointer(CopyExpression(exp->member.exp), CopyIdentifier(exp->member.member));
break;
case 10:
result = MkExpTypeSize(CopyTypeName(exp->typeName));
break;
case 38:
result = MkExpTypeAlign(CopyTypeName(exp->typeName));
break;
case 11:
result = MkExpCast(CopyTypeName(exp->cast.typeName), CopyExpression(exp->cast.exp));
break;
case 12:
{
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct Expression * e;

for(e = (*exp->cond.exp).first; e; e = e->next)
ListAdd(list, CopyExpression(e));
result = MkExpCondition(CopyExpression(exp->cond.cond), list, CopyExpression(exp->cond.elseExp));
break;
}
case 36:
result = MkExpVaArg(CopyExpression(exp->vaArg.exp), CopyTypeName(exp->vaArg.typeName));
break;
case 25:
result = MkExpExtensionCompound(CopyStatement(exp->compound));
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
}
return result;
}

extern struct Statement * MkCompoundStmt(struct __ecereNameSpace__ecere__sys__OldList * declarations, struct __ecereNameSpace__ecere__sys__OldList * statements);

struct Declaration * CopyDeclaration(struct Declaration * decl);

extern struct Statement * MkExpressionStmt(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

static struct Statement * CopyStatement(struct Statement * stmt)
{
struct Statement * result = (((void *)0));

if(stmt)
{
switch(stmt->type)
{
case 2:
result = MkCompoundStmt(CopyList(stmt->compound.declarations, CopyDeclaration), CopyList(stmt->compound.statements, CopyStatement));
result->compound.context = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context);
break;
case 3:
result = MkExpressionStmt(CopyList(stmt->expressions, CopyExpression));
break;
}
}
if(result)
{
result->loc = stmt->loc;
}
return result;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Enumerator;

struct Enumerator
{
struct Enumerator * prev;
struct Enumerator * next;
struct Location loc;
struct Identifier * id;
struct Expression * exp;
} __attribute__ ((gcc_struct));

extern struct Enumerator * MkEnumerator(struct Identifier * id, struct Expression * exp);

static struct Enumerator * CopyEnumerator(struct Enumerator * enumerator)
{
return MkEnumerator(CopyIdentifier(enumerator->id), CopyExpression(enumerator->exp));
}

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

extern struct ClassDef * MkClassDefDeclaration(struct Declaration * decl);

struct ClassDef * CopyClassDef(struct ClassDef * def)
{
switch(def->type)
{
case 0:
return (((void *)0));
case 1:
return (((void *)0));
case 2:
return MkClassDefDeclaration(CopyDeclaration(def->decl));
case 3:
return (((void *)0));
}
return (((void *)0));
}

extern struct Specifier * MkSpecifier(int specifier);

extern struct Specifier * MkEnum(struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * list);

extern struct Specifier * MkStructOrUnion(int type, struct Identifier * id, struct __ecereNameSpace__ecere__sys__OldList * definitions);

extern char *  __ecereNameSpace__ecere__sys__CopyString(char *  string);

extern struct Specifier * MkSpecifierSubClass(struct Specifier * _class);

extern struct Specifier * MkSpecifierExtended(struct ExtDecl * extDecl);

struct ExtDecl * CopyExtDecl(struct ExtDecl * extDecl);

struct Specifier * CopySpecifier(struct Specifier * spec)
{
void * __ecereTemp1;

if(spec)
switch(spec->type)
{
case 0:
return MkSpecifier(spec->specifier);
case 2:
{
struct Identifier * id = CopyIdentifier(spec->id);
struct __ecereNameSpace__ecere__sys__OldList * list = MkList();
struct Enumerator * enumerator;

if(spec->list)
{
for(enumerator = (*spec->list).first; enumerator; enumerator = enumerator->next)
ListAdd(list, CopyEnumerator(enumerator));
}
return MkEnum(id, list);
}
case 3:
case 4:
{
struct Identifier * id = CopyIdentifier(spec->id);
struct __ecereNameSpace__ecere__sys__OldList * list = (((void *)0));
struct ClassDef * def;

if(spec->definitions)
{
list = MkList();
if(spec->list)
{
for(def = (*spec->list).first; def; def = def->next)
ListAdd(list, CopyClassDef(def));
}
}
return MkStructOrUnion(spec->type, id, list);
}
case 1:
{
struct Specifier * copy = (copy = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier), copy->type = 1, copy->name = __ecereNameSpace__ecere__sys__CopyString(spec->name), copy->symbol = spec->symbol, copy->templateArgs = (((void *)0)), copy);

return copy;
}
case 7:
return MkSpecifierSubClass(CopySpecifier(spec->_class));
case 8:
return (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Specifier), ((struct Specifier *)__ecereTemp1)->loc = spec->loc, ((struct Specifier *)__ecereTemp1)->type = 8, ((struct Specifier *)__ecereTemp1)->templateParameter = spec->templateParameter, ((struct Specifier *)__ecereTemp1));
case 5:
return MkSpecifierExtended(CopyExtDecl(spec->extDecl));
}
return (((void *)0));
}

extern struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator);

struct Declarator * CopyDeclarator(struct Declarator * declarator);

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

extern struct ExtDecl * MkExtDeclAttrib(struct Attrib * attr);

struct Attrib * CopyAttrib(struct Attrib * attrib);

extern struct ExtDecl * MkExtDeclString(char * s);

struct ExtDecl * CopyExtDecl(struct ExtDecl * extDecl)
{
if(extDecl)
{
if(extDecl->type == 1)
return MkExtDeclAttrib(CopyAttrib(extDecl->attr));
else if(extDecl->type == 0)
return MkExtDeclString(__ecereNameSpace__ecere__sys__CopyString(extDecl->s));
}
return (((void *)0));
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Attribute;

struct Attribute
{
struct Attribute * prev;
struct Attribute * next;
struct Location loc;
char * attr;
struct Expression * exp;
} __attribute__ ((gcc_struct));

extern struct Attribute * MkAttribute(char * attr, struct Expression * exp);

struct Attribute * CopyAttribute(struct Attribute * attrib)
{
if(attrib)
return MkAttribute(__ecereNameSpace__ecere__sys__CopyString(attrib->attr), CopyExpression(attrib->exp));
return (((void *)0));
}

extern struct Attrib * MkAttrib(int type, struct __ecereNameSpace__ecere__sys__OldList *  attribs);

struct Attrib * CopyAttrib(struct Attrib * attrib)
{
if(attrib)
return MkAttrib(attrib->type, CopyList(attrib->attribs, CopyAttribute));
return (((void *)0));
}

extern struct Declarator * MkStructDeclarator(struct Declarator * declarator, struct Expression * exp);

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

extern struct Declarator * MkDeclaratorBrackets(struct Declarator * declarator);

extern struct Declarator * MkDeclaratorEnumArray(struct Declarator * declarator, struct Specifier * _class);

extern struct Declarator * MkDeclaratorArray(struct Declarator * declarator, struct Expression * exp);

extern struct Declarator * MkDeclaratorFunction(struct Declarator * declarator, struct __ecereNameSpace__ecere__sys__OldList * parameters);

extern struct Declarator * MkDeclaratorPointer(struct Pointer * pointer, struct Declarator * declarator);

extern struct Declarator * MkDeclaratorExtended(struct ExtDecl * extended, struct Declarator * declarator);

extern struct Declarator * MkDeclaratorExtendedEnd(struct ExtDecl * extended, struct Declarator * declarator);

struct Declarator * CopyDeclarator(struct Declarator * declarator)
{
if(declarator)
{
switch(declarator->type)
{
case 0:
{
struct Declarator * decl = MkStructDeclarator(CopyDeclarator(declarator->declarator), CopyExpression(declarator->structDecl.exp));

if(declarator->structDecl.attrib)
decl->structDecl.attrib = CopyAttrib(declarator->structDecl.attrib);
return decl;
}
case 1:
return MkDeclaratorIdentifier(CopyIdentifier(declarator->identifier));
case 2:
return MkDeclaratorBrackets(CopyDeclarator(declarator->declarator));
case 3:
if(declarator->array.enumClass)
return MkDeclaratorEnumArray(CopyDeclarator(declarator->declarator), CopySpecifier(declarator->array.enumClass));
else
return MkDeclaratorArray(CopyDeclarator(declarator->declarator), CopyExpression(declarator->array.exp));
case 4:
{
struct __ecereNameSpace__ecere__sys__OldList * parameters = MkList();
struct TypeName * param;

if(declarator->function.parameters)
{
for(param = (*declarator->function.parameters).first; param; param = param->next)
ListAdd(parameters, CopyTypeName(param));
}
return MkDeclaratorFunction(CopyDeclarator(declarator->declarator), parameters);
}
case 5:
return MkDeclaratorPointer(CopyPointer(declarator->pointer.pointer), CopyDeclarator(declarator->declarator));
case 6:
return MkDeclaratorExtended(CopyExtDecl(declarator->extended.extended), CopyDeclarator(declarator->declarator));
case 7:
return MkDeclaratorExtendedEnd(CopyExtDecl(declarator->extended.extended), CopyDeclarator(declarator->declarator));
}
}
return (((void *)0));
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_InitDeclarator;

struct InitDeclarator
{
struct InitDeclarator * prev;
struct InitDeclarator * next;
struct Location loc;
struct Declarator * declarator;
struct Initializer * initializer;
} __attribute__ ((gcc_struct));

extern struct InitDeclarator * MkInitDeclarator(struct Declarator * declarator, struct Initializer * initializer);

struct InitDeclarator * CopyInitDeclarator(struct InitDeclarator * initDecl)
{
return MkInitDeclarator(CopyDeclarator(initDecl->declarator), CopyInitializer(initDecl->initializer));
}

extern struct Declaration * MkDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators);

struct Declaration * CopyDeclaration(struct Declaration * decl)
{
if(decl->type == 1)
{
return MkDeclaration(CopyList(decl->specifiers, CopySpecifier), CopyList(decl->declarators, CopyInitDeclarator));
}
else
{
struct __ecereNameSpace__ecere__sys__OldList * specifiers = MkList(), * declarators = MkList();
struct Specifier * spec;
struct Declarator * declarator;

for(spec = (*decl->specifiers).first; spec; spec = spec->next)
ListAdd(specifiers, CopySpecifier(spec));
if(decl->declarators)
{
for(declarator = (*decl->declarators).first; declarator; declarator = declarator->next)
ListAdd(declarators, CopyDeclarator(declarator));
}
return MkDeclaration(specifiers, declarators);
}
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__Item;

struct __ecereNameSpace__ecere__sys__Item
{
struct __ecereNameSpace__ecere__sys__Item * prev;
struct __ecereNameSpace__ecere__sys__Item * next;
} __attribute__ ((gcc_struct));

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

void __ecereRegisterModule_copy(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CopyIdentifier", "Identifier CopyIdentifier(Identifier id)", CopyIdentifier, module, 2);
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
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CopyList", "ecere::sys::OldList * CopyList(ecere::sys::OldList * source, void *( *)(void *))", CopyList, module, 2);
}

void __ecereUnregisterModule_copy(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

