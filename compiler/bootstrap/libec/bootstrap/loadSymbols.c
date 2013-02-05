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

struct ClassDefinition;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Context;

struct Context;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Instantiation;

struct Instantiation;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declaration;

struct Declaration;

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

struct TemplateDatatype;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateArgument;

struct TemplateArgument;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateParameter;

struct TemplateParameter;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Specifier;

struct Specifier;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Identifier;

struct Identifier;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Pointer;

struct Pointer;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declarator;

struct Declarator;

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

struct Type;

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

extern int yychar;

struct __ecereNameSpace__ecere__com__NameSpace * globalData;

void SetGlobalData(struct __ecereNameSpace__ecere__com__NameSpace * nameSpace)
{
globalData = nameSpace;
}

struct __ecereNameSpace__ecere__sys__OldList dataRedefinitions;

extern char sourceFileStack[10][797];

extern int include_stack_ptr;

static int numIncludes;

static char ** includes;

unsigned int inIDE = 0x0;

void SetInIDE(unsigned int b)
{
inIDE = b;
}

struct __ecereNameSpace__ecere__com__Instance * sourceDirs;

void SetSourceDirs(struct __ecereNameSpace__ecere__com__Instance * list)
{
sourceDirs = list;
}

struct __ecereNameSpace__ecere__sys__OldList * includeDirs, * sysIncludeDirs;

void SetIncludeDirs(struct __ecereNameSpace__ecere__sys__OldList * list)
{
includeDirs = list;
}

void SetSysIncludeDirs(struct __ecereNameSpace__ecere__sys__OldList * list)
{
sysIncludeDirs = list;
}

unsigned int ecereImported;

void SetEcereImported(unsigned int b)
{
ecereImported = b;
}

unsigned int GetEcereImported()
{
return ecereImported;
}

unsigned int inPreCompiler = 0x0;

void SetInPreCompiler(unsigned int b)
{
inPreCompiler = b;
}

struct __ecereNameSpace__ecere__sys__OldList * precompDefines;

void SetPrecompDefines(struct __ecereNameSpace__ecere__sys__OldList * list)
{
precompDefines = list;
}

unsigned int DummyMethod()
{
return 0x1;
}

extern char *  __ecereNameSpace__ecere__sys__TrimLSpaces(char *  string, char *  output);

extern int strcmp(const char * , const char * );

extern int strtol(char * , char * * , int base);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_AddDataMember(struct __ecereNameSpace__ecere__com__DataMember * member, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

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

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_New(int type, int declMode);

extern unsigned int __ecereNameSpace__ecere__com__eMember_AddMember(struct __ecereNameSpace__ecere__com__DataMember * addTo, struct __ecereNameSpace__ecere__com__DataMember * dataMember);

extern unsigned int __ecereNameSpace__ecere__com__eClass_AddMember(struct __ecereNameSpace__ecere__com__Class * _class, struct __ecereNameSpace__ecere__com__DataMember * dataMember);

extern char *  strcpy(char * , const char * );

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(struct __ecereNameSpace__ecere__com__Instance * this, char *  s, int max);

static void ReadDataMembers(struct __ecereNameSpace__ecere__com__Class * regClass, struct __ecereNameSpace__ecere__com__DataMember * member, struct __ecereNameSpace__ecere__com__Instance * f)
{
char line[1024];
char name[1024];
int size = 0, bitPos = -1;
int memberAccess = 1;

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] == '[')
{
if(!strcmp(line, "[Size]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
size = strtol(line, (((void *)0)), 0);
}
else if(!strcmp(line, "[Pos]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
bitPos = strtol(line, (((void *)0)), 0);
}
else if(!strcmp(line, "[Public]"))
memberAccess = 1;
else if(!strcmp(line, "[Private]"))
memberAccess = 2;
else if(!strcmp(line, "[Type]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(member)
{
if(!__ecereNameSpace__ecere__com__eMember_AddDataMember(member, name, line[0] ? line : 0, 0, 0, memberAccess))
;
}
else if(regClass && regClass->type == 2)
{
struct __ecereNameSpace__ecere__com__BitMember * member = __ecereNameSpace__ecere__com__eClass_AddBitMember(regClass, name, line[0] ? line : 0, 0, 0, memberAccess);

member->size = size;
member->pos = bitPos;
}
else if(regClass)
{
if(!__ecereNameSpace__ecere__com__eClass_AddDataMember(regClass, name, line[0] ? line : 0, 0, 0, memberAccess))
;
}
}
else if(!strcmp(line, "[Struct]") || !strcmp(line, "[Union]"))
{
struct __ecereNameSpace__ecere__com__DataMember * dataMember = (regClass || member) ? __ecereNameSpace__ecere__com__eMember_New((!strcmp(line, "[Union]")) ? 1 : 2, memberAccess) : (((void *)0));

ReadDataMembers((((void *)0)), dataMember, f);
if(member)
{
if(!__ecereNameSpace__ecere__com__eMember_AddMember(member, dataMember))
;
}
else if(regClass)
{
if(!__ecereNameSpace__ecere__com__eClass_AddMember(regClass, dataMember))
;
}
}
}
else
{
size = 0;
bitPos = -1;
strcpy(name, line);
memberAccess = 1;
}
}
}

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpenBuffered(char *  fileName, int mode);

extern char *  __ecereNameSpace__ecere__sys__GetLastDirectory(char *  string, char *  output);

extern int strcasecmp(const char * , const char * );

extern struct Symbol * DeclClass(int symbolID, char *  name);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

extern struct __ecereNameSpace__ecere__com__Instance * privateModule;

extern struct Symbol * FindClass(char *  name);

extern char *  sourceFile;

extern char *  strstr(char * , const char * );

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, char *  name, char *  baseName, int size, int sizeClass, unsigned int (* )(void * ), void (* )(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern char *  strcat(char * , const char * );

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldLink;

struct __ecereNameSpace__ecere__sys__OldLink
{
struct __ecereNameSpace__ecere__sys__OldLink * prev;
struct __ecereNameSpace__ecere__sys__OldLink * next;
void *  data;
} __attribute__ ((gcc_struct));

extern void __ecereNameSpace__ecere__com__eClass_DestructionWatchable(struct __ecereNameSpace__ecere__com__Class * _class);

extern struct ModuleImport * FindModule(struct __ecereNameSpace__ecere__com__Instance * moduleToFind);

extern struct ModuleImport * mainModule;

extern char *  strchr(char * , int);

extern void *  memcpy(void * , const void * , unsigned int size);

extern char *  __ecereNameSpace__ecere__sys__TrimRSpaces(char *  string, char *  output);

extern void __ecereNameSpace__ecere__com__eEnum_AddFixedValue(struct __ecereNameSpace__ecere__com__Class * _class, char *  string, int value);

extern int atoi(const char * );

extern int __ecereNameSpace__ecere__com__eEnum_AddValue(struct __ecereNameSpace__ecere__com__Class * _class, char *  string);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  dataType, void *  setStmt, void *  getStmt, int declMode);

extern void __ecereNameSpace__ecere__com__eProperty_Watchable(struct __ecereNameSpace__ecere__com__Property * _property);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassProperty;

struct __ecereNameSpace__ecere__com__ClassProperty;

extern struct __ecereNameSpace__ecere__com__ClassProperty * __ecereNameSpace__ecere__com__eClass_AddClassProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  dataType, void *  setStmt, void *  getStmt);

extern char *  __ecereNameSpace__ecere__sys__CopyString(char *  string);

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

extern struct Location yylloc;

extern struct __ecereNameSpace__ecere__com__Instance * fileInput;

extern int declMode;

extern void resetScanner();

extern struct Expression * ParseExpressionString(char *  expression);

extern struct Type * ProcessTypeString(char *  string, unsigned int staticMethod);

extern void ProcessExpressionType(struct Expression * exp);

extern void ComputeExpression(struct Expression * exp);

extern struct Operand GetOperand(struct Expression * exp);

extern void FreeExpression(struct Expression * exp);

extern void resetScannerPos(struct CodePosition * pos);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateParameter;

struct __ecereNameSpace__ecere__com__ClassTemplateParameter;

extern struct __ecereNameSpace__ecere__com__ClassTemplateParameter * __ecereNameSpace__ecere__com__eClass_AddTemplateParameter(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, int type, void *  info, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * defaultArg);

extern void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(struct __ecereNameSpace__ecere__com__Class * base);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DefinedExpression;

struct __ecereNameSpace__ecere__com__DefinedExpression;

extern struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_RegisterDefine(char *  name, char *  value, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

extern char *  strncpy(char * , const char * , int n);

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_GlobalData;

struct GlobalData
{
uintptr_t key;
struct __ecereNameSpace__ecere__sys__BTNode * parent;
struct __ecereNameSpace__ecere__sys__BTNode * left;
struct __ecereNameSpace__ecere__sys__BTNode * right;
int depth;
struct __ecereNameSpace__ecere__com__Instance * module;
char *  dataTypeString;
struct Type * dataType;
void *  symbol;
char *  fullName;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_DataRedefinition;

struct DataRedefinition
{
struct DataRedefinition * prev;
struct DataRedefinition * next;
char name[1024];
char type1[1024];
char type2[1024];
} __attribute__ ((gcc_struct));

void ImportModule(char *  name, int importType, int importAccess, unsigned int loadDllOnly);

extern void Compiler_Error(char *  format, ...);

extern char *  __ecereNameSpace__ecere__GetTranslatedString(struct __ecereNameSpace__ecere__com__Instance * module, char *  string, char *  stringAndContext);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, char *  key);

int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, char *  a, char *  b);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

unsigned int LoadSymbols(char * fileName, int importType, unsigned int loadDllOnly)
{
void * __ecereTemp1;
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__sys__FileOpenBuffered(fileName, 1);
unsigned int globalInstance = 0x0;

if(f)
{
unsigned int ecereCOMModule = 0x0;
char moduleName[797];

__ecereNameSpace__ecere__sys__GetLastDirectory(fileName, moduleName);
if(!((strcasecmp)(moduleName, "instance.sym") && (strcasecmp)(moduleName, "BinaryTree.sym") && (strcasecmp)(moduleName, "dataTypes.sym") && (strcasecmp)(moduleName, "OldList.sym") && (strcasecmp)(moduleName, "String.sym") && (strcasecmp)(moduleName, "BTNode.sym") && (strcasecmp)(moduleName, "Array.sym") && (strcasecmp)(moduleName, "AVLTree.sym") && (strcasecmp)(moduleName, "BuiltInContainer.sym") && (strcasecmp)(moduleName, "Container.sym") && (strcasecmp)(moduleName, "CustomAVLTree.sym") && (strcasecmp)(moduleName, "LinkList.sym") && (strcasecmp)(moduleName, "List.sym") && (strcasecmp)(moduleName, "Map.sym") && (strcasecmp)(moduleName, "Mutex.sym")))
ecereCOMModule = 0x1;
for(; ; )
{
char line[1024];

if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(line[0] == '[')
{
if(!strcmp(line, "[Global Instance]"))
globalInstance = 0x1;
else if(!strcmp(line, "[Defined Classes]"))
{
struct __ecereNameSpace__ecere__com__Class * regClass = (((void *)0));
char name[1024];
unsigned int isRemote = 0x0;
unsigned int isStatic = 0x0;
unsigned int isWatchable = 0x0;
int classType = 0;
unsigned int fixed = 0x0;
unsigned int noExpansion = 0x0;
int inheritanceAccess = 1;

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] == '[')
{
if(!strcmp(line, "[Remote]"))
isRemote = 0x1;
else if(!strcmp(line, "[Static]"))
isStatic = 0x1;
else if(!strcmp(line, "[Fixed]"))
fixed = 0x1;
else if(!strcmp(line, "[No Expansion]"))
noExpansion = 0x1;
else if(!strcmp(line, "[Watchable]"))
isWatchable = 0x1;
else if(!strcmp(line, "[Enum]"))
classType = 4;
else if(!strcmp(line, "[Bit]"))
classType = 2;
else if(!strcmp(line, "[Struct]"))
classType = 1;
else if(!strcmp(line, "[Unit]"))
classType = 3;
else if(!strcmp(line, "[NoHead]"))
classType = 5;
else if(!strcmp(line, "[Base]") || !strcmp(line, "[Private Base]"))
{
if(!strcmp(line, "[Private Base]"))
inheritanceAccess = 2;
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(importType == 3)
DeclClass(0, name);
if(isStatic || loadDllOnly || importType == 3 || importType == 4)
regClass = (((void *)0));
else if(regClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, name), !regClass || regClass->internalDecl || regClass->isRemote)
{
struct Symbol * existingClass = FindClass(name);
char * baseName = (classType == 0 && importType == 2 && isRemote) ? "DCOMClientObject" : (!strcmp(line, "[None]") ? (((void *)0)) : line);

if(!isRemote || (importType != 2) || (!sourceFile || !strstr(sourceFile, ".main.ec")))
{
if(!regClass || regClass->internalDecl)
regClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(classType, name, isRemote ? (((void *)0)) : baseName, 0, 0, (((void *)0)), (((void *)0)), privateModule, ecereCOMModule ? 4 : 1, inheritanceAccess);
if(regClass && isRemote)
regClass->isRemote = (importType == 2) ? (unsigned int)1 : (unsigned int)2;
if(isRemote)
{
if(importType == 2)
{
char className[1024] = "DCOMClient_";

strcat(className, name);
if(!existingClass)
existingClass = DeclClass(0, name);
regClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(classType, className, baseName, 0, 0, (((void *)0)), (((void *)0)), privateModule, ecereCOMModule ? 4 : 1, inheritanceAccess);
}
if(regClass)
regClass->isRemote = (importType == 2) ? (unsigned int)1 : (unsigned int)3;
}
if(existingClass)
{
struct __ecereNameSpace__ecere__sys__OldLink * link;

for(link = existingClass->templatedClasses.first; link; link = link->next)
{
struct Symbol * symbol = link->data;

symbol->registered = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, symbol->string);
}
}
if(fixed)
regClass->fixed = 0x1;
if(noExpansion)
regClass->noExpansion = 0x1;
if(isWatchable)
{
__ecereNameSpace__ecere__com__eClass_DestructionWatchable(regClass);
regClass->structSize = regClass->offset;
}
if(regClass && existingClass)
{
existingClass->registered = regClass;
regClass->symbol = existingClass;
existingClass->id = (((int)0x7fffffff));
existingClass->idCode = (((int)0x7fffffff));
existingClass->imported = 0x1;
if(regClass->module)
existingClass->module = FindModule(regClass->module);
else
existingClass->module = mainModule;
}
}
else
regClass = (((void *)0));
}
else
regClass = (((void *)0));
isRemote = 0x0;
isWatchable = 0x0;
fixed = 0x0;
isStatic = 0x0;
}
else if(!strcmp(line, "[Enum Values]"))
{
for(; ; )
{
char * equal;

if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(regClass)
{
equal = strchr(line, '=');
if(equal)
{
char name[1024];

memcpy(name, line, (int)(equal - line));
name[equal - line] = '\0';
__ecereNameSpace__ecere__sys__TrimLSpaces(name, name);
__ecereNameSpace__ecere__sys__TrimRSpaces(name, name);
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(regClass, name, atoi(equal + 1));
}
else
{
__ecereNameSpace__ecere__com__eEnum_AddValue(regClass, line);
}
}
}
}
else if(!strcmp(line, "[Defined Methods]"))
{
char name[1024];
unsigned int isVirtual = 0x0;
int memberAccess = 1;

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] == '[')
{
if(!strcmp(line, "[Type]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
if(regClass)
{
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(isVirtual)
__ecereNameSpace__ecere__com__eClass_AddVirtualMethod(regClass, name, line[0] ? line : 0, DummyMethod, memberAccess);
else
__ecereNameSpace__ecere__com__eClass_AddMethod(regClass, name, line[0] ? line : 0, DummyMethod, memberAccess);
}
}
else if(!strcmp(line, "[Virtual]"))
isVirtual = 0x1;
else if(!strcmp(line, "[Public]"))
memberAccess = 1;
else if(!strcmp(line, "[Private]"))
memberAccess = 2;
}
else
{
strcpy(name, line);
isVirtual = 0x0;
memberAccess = 1;
}
}
}
else if(!strcmp(line, "[Defined Properties]"))
{
char name[1024];
unsigned int setStmt = 0x0, getStmt = 0x0, isVirtual = 0x0, conversion = 0x0;
unsigned int isWatchable = 0x0;
int memberAccess = 1;

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] == '[')
{
if(!strcmp(line, "[Type]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(regClass)
{
struct __ecereNameSpace__ecere__com__Property * prop = __ecereNameSpace__ecere__com__eClass_AddProperty(regClass, conversion ? (((void *)0)) : name, line[0] ? line : 0, (void *)(unsigned int)setStmt, (void *)(unsigned int)getStmt, memberAccess);

if(prop)
{
prop->compiled = 0x0;
if(isWatchable)
{
__ecereNameSpace__ecere__com__eProperty_Watchable(prop);
regClass->structSize = regClass->offset;
}
}
}
}
else if(!strcmp(line, "[Set]"))
setStmt = 0x1;
else if(!strcmp(line, "[Get]"))
getStmt = 0x1;
else if(!strcmp(line, "[Watchable]"))
isWatchable = 0x1;
else if(!strcmp(line, "[Public]"))
memberAccess = 1;
else if(!strcmp(line, "[Private]"))
memberAccess = 2;
else if(!strcmp(line, "[Conversion]"))
{
conversion = 0x1;
setStmt = getStmt = isVirtual = isWatchable = 0x0;
}
}
else
{
strcpy(name, line);
setStmt = getStmt = isVirtual = conversion = isWatchable = 0x0;
memberAccess = 1;
}
}
}
else if(!strcmp(line, "[Defined Class Properties]"))
{
char name[1024];
unsigned int setStmt = 0x0, getStmt = 0x0;

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] == '[')
{
if(!strcmp(line, "[Type]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(regClass)
{
__ecereNameSpace__ecere__com__eClass_AddClassProperty(regClass, name, line, (void *)(unsigned int)setStmt, (void *)(unsigned int)getStmt);
}
}
else if(!strcmp(line, "[Set]"))
setStmt = 0x1;
else if(!strcmp(line, "[Get]"))
getStmt = 0x1;
}
else
{
strcpy(name, line);
setStmt = getStmt = 0x0;
}
}
}
else if(!strcmp(line, "[Defined Data Members]"))
{
ReadDataMembers(regClass, (((void *)0)), f);
}
else if(!strcmp(line, "[Template Parameters]"))
{
while(!((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof])(f))
{
char name[1024];
int type = 0;
struct __ecereNameSpace__ecere__com__ClassTemplateArgument defaultArg = 
{
0, 0, 0, 0, 0
};
void * info = (((void *)0));

__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(line[0] == '.')
break;
strcpy(name, line);
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "[Expression]"))
type = 2;
else if(!strcmp(line, "[Identifier]"))
type = 1;
switch(type)
{
case 0:
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(regClass && strcmp(line, "[None]"))
{
info = __ecereNameSpace__ecere__sys__CopyString(line);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(regClass && strcmp(line, "[None]"))
{
defaultArg.dataTypeString = __ecereNameSpace__ecere__sys__CopyString(line);
}
break;
case 2:
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(regClass && strcmp(line, "[None]"))
{
info = __ecereNameSpace__ecere__sys__CopyString(line);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(regClass && strcmp(line, "[None]"))
{
struct Operand op;
struct Expression * exp;
struct Location oldLocation = yylloc;
struct __ecereNameSpace__ecere__com__Instance * backFileInput = fileInput;

declMode = (int)0;
resetScanner();
exp = ParseExpressionString(line);
if(info)
exp->destType = ProcessTypeString(info, 0x0);
ProcessExpressionType(exp);
ComputeExpression(exp);
op = GetOperand(exp);
defaultArg.expression.ui64 = op.ui64;
FreeExpression(exp);
resetScanner();
yylloc = oldLocation;
fileInput = backFileInput;
if(fileInput)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))fileInput->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(fileInput, yylloc.start.pos, 0);
resetScannerPos(&yylloc.start);
yychar = -2;
}
}
break;
case 1:
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "[Data member]"))
info = (void *)0;
else if(!strcmp(line, "[Method]"))
info = (void *)1;
else if(!strcmp(line, "[Property]"))
info = (void *)2;
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(regClass && strcmp(line, "[None]"))
{
defaultArg.memberString = __ecereNameSpace__ecere__sys__CopyString(line);
}
break;
}
if(regClass)
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(regClass, name, type, info, &defaultArg);
if(type == 0 || type == 2)
(__ecereNameSpace__ecere__com__eSystem_Delete(info), info = 0);
if(type == 0 || type == 1)
(__ecereNameSpace__ecere__com__eSystem_Delete(defaultArg.dataTypeString), defaultArg.dataTypeString = 0);
}
if(regClass)
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(regClass);
}
}
else
{
inheritanceAccess = 1;
classType = 0;
isRemote = 0x0;
strcpy(name, line);
regClass = (((void *)0));
}
}
}
else if(!strcmp(line, "[Defined Expressions]"))
{
char name[1024];

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(!strcmp(line, "[Value]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!loadDllOnly && importType != 3 && importType != 4)
__ecereNameSpace__ecere__com__eSystem_RegisterDefine(name, line, privateModule, ecereCOMModule ? 4 : 1);
}
else if(line[0] != '[')
{
strcpy(name, line);
}
}
}
else if(!strcmp(line, "[Defined Functions]"))
{
char name[1024];

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(!strcmp(line, "[Type]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!loadDllOnly && importType != 3 && importType != 4)
__ecereNameSpace__ecere__com__eSystem_RegisterFunction(name, line, (((void *)0)), privateModule, ecereCOMModule ? 4 : 1);
}
else if(line[0] != '[')
{
strcpy(name, line);
}
}
}
else if(!strcmp(line, "[Defined Data]"))
{
char name[1024];

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(!strcmp(line, "[Type]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!loadDllOnly && importType != 3 && importType != 4)
{
int start = 0, c;
struct __ecereNameSpace__ecere__com__NameSpace * nameSpace = globalData;
struct GlobalData * data;

for(c = 0; name[c]; c++)
{
if(name[c] == '.' || (name[c] == ':' && name[c + 1] == ':'))
{
struct __ecereNameSpace__ecere__com__NameSpace * newSpace;
char * spaceName = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (c - start + 1));

strncpy(spaceName, name + start, c - start);
spaceName[c - start] = '\0';
newSpace = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*nameSpace).nameSpaces, spaceName);
if(!newSpace)
{
newSpace = __ecereNameSpace__ecere__com__eSystem_New0(sizeof(struct __ecereNameSpace__ecere__com__NameSpace) * (1));
(*newSpace).classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString;
(*newSpace).name = spaceName;
(*newSpace).parent = nameSpace;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*nameSpace).nameSpaces, (struct __ecereNameSpace__ecere__sys__BTNode *)newSpace);
}
else
(__ecereNameSpace__ecere__com__eSystem_Delete(spaceName), spaceName = 0);
nameSpace = newSpace;
if(name[c] == ':')
c++;
start = c + 1;
}
}
if(c - start)
{
data = (struct GlobalData *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(&(*nameSpace).functions, name + start);
if(!data)
{
data = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_GlobalData), ((struct GlobalData *)__ecereTemp1)->fullName = __ecereNameSpace__ecere__sys__CopyString(name), ((struct GlobalData *)__ecereTemp1)->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(line), ((struct GlobalData *)__ecereTemp1)->module = privateModule, ((struct GlobalData *)__ecereTemp1));
data->key = (uintptr_t)(data->fullName + start);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&(*nameSpace).functions, (struct __ecereNameSpace__ecere__sys__BTNode *)data);
}
else if(strcmp(data->dataTypeString, line))
{
struct DataRedefinition * redefinition = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_DataRedefinition);

strcpy(redefinition->name, name);
strcpy(redefinition->type1, data->dataTypeString);
strcpy(redefinition->type2, line);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&dataRedefinitions, redefinition);
}
}
}
}
else if(line[0] != '[')
{
strcpy(name, line);
}
}
}
else if(!strcmp(line, "[Imported Modules]"))
{
int moduleImportType = 0;
int importAccess = 1;

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(!strcmp(line, "[Static]"))
moduleImportType = 1;
else if(!strcmp(line, "[Remote]"))
moduleImportType = 2;
else if(!strcmp(line, "[Private]"))
importAccess = 2;
else if(line[0] != '[')
{
if(importType != 3 && importType != 4)
ImportModule(line, moduleImportType, importAccess, loadDllOnly);
else
ImportModule(line, 4, importAccess, loadDllOnly);
if(!strcmp(line, "ecere"))
ecereImported = 0x1;
moduleImportType = 0;
importAccess = 1;
}
}
}
}
}
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}
else if(importType != 4)
{
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Couldn't open %s\n", (((void *)0))), fileName);
}
return globalInstance;
}

struct __ecereNameSpace__ecere__com__Instance * loadedModules;

extern unsigned int __ecereNameSpace__ecere__sys__StripExtension(char *  string);

extern struct __ecereNameSpace__ecere__sys__OldList *  defines;

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

extern int strlen(const char * );

extern char *  __ecereNameSpace__ecere__sys__GetExtension(char *  string, char *  output);

extern char *  symbolsDir;

extern char *  __ecereNameSpace__ecere__sys__PathCat(char *  string, char *  addedPath);

extern char *  __ecereNameSpace__ecere__sys__ChangeExtension(char *  string, char *  ext, char *  output);

extern unsigned int __ecereNameSpace__ecere__sys__FileExists(char *  fileName);

extern unsigned int inCompiler;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IteratorPointer;

struct __ecereNameSpace__ecere__com__IteratorPointer;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__MapIterator;

struct __ecereNameSpace__ecere__com__MapIterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__eModule_LoadStrict(struct __ecereNameSpace__ecere__com__Instance * fromModule, char *  name, int importAccess);

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Iterator;

struct __ecereNameSpace__ecere__com__Iterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} __attribute__ ((gcc_struct));

extern int sprintf(char * , char * , ...);

extern int __ecereNameSpace__ecere__com__GetRuntimePlatform(void);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List_TPL_ecere__com__Module_;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_map(struct __ecereNameSpace__ecere__com__MapIterator * this);

void __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(struct __ecereNameSpace__ecere__com__MapIterator * this, struct __ecereNameSpace__ecere__com__Instance * value);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__com__MapIterator_map;

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(struct __ecereNameSpace__ecere__com__Iterator * this, uint64 index, unsigned int create);

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

uint64 __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(struct __ecereNameSpace__ecere__com__Iterator * this);

void __ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(struct __ecereNameSpace__ecere__com__Iterator * this, uint64 value);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__com__Iterator_data;

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Next();

void ImportModule(char * name, int importType, int importAccess, unsigned int loadDllOnly)
{
void * __ecereTemp1;
struct ImportedModule * module = (((void *)0));
char moduleName[274];

strncpy(moduleName, name, (274) - 1);
moduleName[(274) - 1] = (char)0;
__ecereNameSpace__ecere__sys__StripExtension(moduleName);
for(module = (*defines).first; module; module = module->next)
{
if(module->type == 0 && !(strcasecmp)(module->name, moduleName))
break;
}
if((!module || (module->dllOnly && !loadDllOnly)) && strlen(name) < (274))
{
char ext[17];
struct __ecereNameSpace__ecere__com__Instance * loadedModule = (((void *)0));
char symFile[797];

symFile[0] = '\0';
__ecereNameSpace__ecere__sys__GetExtension(name, ext);
strcpy(symFile, symbolsDir ? symbolsDir : "");
__ecereNameSpace__ecere__sys__PathCat(symFile, name);
__ecereNameSpace__ecere__sys__ChangeExtension(symFile, "sym", symFile);
if(!strcmp(ext, "dll") || !strcmp(ext, "dll") || !ext[0])
{
if(importType != 4)
{
if(!module)
{
if(precompDefines)
{
module = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ImportedModule), ((struct ImportedModule *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(moduleName), ((struct ImportedModule *)__ecereTemp1)->type = 0, ((struct ImportedModule *)__ecereTemp1)->importType = importType, ((struct ImportedModule *)__ecereTemp1)->importAccess = importAccess, ((struct ImportedModule *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*precompDefines), module);
}
module = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ImportedModule), ((struct ImportedModule *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(moduleName), ((struct ImportedModule *)__ecereTemp1)->type = 0, ((struct ImportedModule *)__ecereTemp1)->importType = importType, ((struct ImportedModule *)__ecereTemp1)->importAccess = importAccess, ((struct ImportedModule *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName((&*defines), module);
}
module->dllOnly = loadDllOnly;
if(ext[0] || !__ecereNameSpace__ecere__sys__FileExists(symFile))
{
unsigned int skipLoad = 0x0;
struct __ecereNameSpace__ecere__com__Instance * list = (((void *)0));
char file[274];

strcpy(file, name);
__ecereNameSpace__ecere__sys__StripExtension(file);
if(!inCompiler)
{
struct __ecereNameSpace__ecere__com__MapIterator it = (it.container = (void *)0, it.pointer = (void *)0, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(&it, loadedModules), it);

if(!__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(&it, (uint64)(file), 0x0))
{
struct __ecereNameSpace__ecere__com__Instance * firstModule = __ecereNameSpace__ecere__com__eModule_LoadStrict(__thisModule, file, importAccess);

if(firstModule)
{
list = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__List_TPL_ecere__com__Module_);
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))list->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(list, (uint64)(firstModule));
__extension__ ({
struct __ecereNameSpace__ecere__com__Iterator __internalIterator = 
{
loadedModules, 0
};

__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(&__internalIterator, (uint64)(((uint64)(file))), 0x1);
__ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(&__internalIterator, list);
});
}
else
skipLoad = 0x1;
}
else
list = ((struct __ecereNameSpace__ecere__com__Instance *)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&it));
}
if(!skipLoad)
{
loadedModule = __ecereNameSpace__ecere__com__eModule_LoadStrict(privateModule, file, importAccess);
if(loadedModule)
{
((struct __ecereNameSpace__ecere__com__Module *)(((char *)loadedModule + 12)))->importType = importType;
module->dllOnly = 0x0;
if(list)
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))list->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(list, (uint64)(loadedModule));
}
}
}
}
}
if(!loadedModule && (!strcmp(ext, "ec") || !strcmp(ext, "sym") || !ext[0]))
{
{
if(!module)
{
if(precompDefines)
{
module = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ImportedModule), ((struct ImportedModule *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(moduleName), ((struct ImportedModule *)__ecereTemp1)->type = 0, ((struct ImportedModule *)__ecereTemp1)->importType = importType, ((struct ImportedModule *)__ecereTemp1)->importAccess = importAccess, ((struct ImportedModule *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*precompDefines), module);
}
module = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ImportedModule), ((struct ImportedModule *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(moduleName), ((struct ImportedModule *)__ecereTemp1)->type = 0, ((struct ImportedModule *)__ecereTemp1)->importType = importType, ((struct ImportedModule *)__ecereTemp1)->importAccess = importAccess, ((struct ImportedModule *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName((&*defines), module);
}
module->dllOnly = loadDllOnly;
if(inPreCompiler)
return ;
if(inIDE && !__ecereNameSpace__ecere__sys__FileExists(symFile) && sourceDirs)
{
{
struct __ecereNameSpace__ecere__com__Iterator dir = 
{
(sourceDirs), 0
};

while(__ecereMethod___ecereNameSpace__ecere__com__Iterator_Next(&dir))
{
char configDir[274];

strcpy(symFile, __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&dir));
__ecereNameSpace__ecere__sys__PathCat(symFile, "obj");
sprintf(configDir, "debug.%s", (__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? "win32" : "linux");
__ecereNameSpace__ecere__sys__PathCat(symFile, configDir);
__ecereNameSpace__ecere__sys__PathCat(symFile, name);
__ecereNameSpace__ecere__sys__ChangeExtension(symFile, "sym", symFile);
if(__ecereNameSpace__ecere__sys__FileExists(symFile))
break;
}
}
}
if(!__ecereNameSpace__ecere__sys__FileExists(symFile))
{
char fileName[274];

__ecereNameSpace__ecere__sys__GetLastDirectory(symFile, fileName);
strcpy(symFile, symbolsDir ? symbolsDir : "");
__ecereNameSpace__ecere__sys__PathCat(symFile, fileName);
}
module->globalInstance = LoadSymbols(symFile, importType, loadDllOnly);
}
}
}
}

int FindIncludeFileID(char * includeFile)
{
int c;

for(c = 0; c < numIncludes; c++)
if(!((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? (strcasecmp) : strcmp)(includes[c], includeFile))
return c + 1;
return 0;
}

int GetIncludeFileID(char * includeFile)
{
int found = FindIncludeFileID(includeFile);

if(found)
return found;
includes = __ecereNameSpace__ecere__com__eSystem_Renew(includes, sizeof(char *) * (numIncludes + 1));
includes[numIncludes++] = __ecereNameSpace__ecere__sys__CopyString(includeFile);
return numIncludes;
}

char * GetIncludeFileFromID(int id)
{
return includes[id - 1];
}

extern char *  __ecereNameSpace__ecere__sys__StripLastDirectory(char *  string, char *  output);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpen(char *  fileName, int mode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__NamedItem;

struct __ecereNameSpace__ecere__sys__NamedItem
{
struct __ecereNameSpace__ecere__sys__NamedItem * prev;
struct __ecereNameSpace__ecere__sys__NamedItem * next;
char *  name;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__com__Instance * OpenIncludeFile(char * includeFile)
{
struct __ecereNameSpace__ecere__com__Instance * file;
char location[274];

__ecereNameSpace__ecere__sys__StripLastDirectory(sourceFileStack[(include_stack_ptr >= 0) ? include_stack_ptr : 0], location);
__ecereNameSpace__ecere__sys__PathCat(location, includeFile);
file = __ecereNameSpace__ecere__sys__FileOpen(location, 1);
if(file)
{
strcpy(sourceFileStack[include_stack_ptr + 1], location);
}
else if(inIDE)
{
struct __ecereNameSpace__ecere__sys__NamedItem * includeDir;

if(includeDirs)
{
for(includeDir = (*includeDirs).first; includeDir; includeDir = includeDir->next)
{
strcpy(location, includeDir->name);
__ecereNameSpace__ecere__sys__PathCat(location, includeFile);
file = __ecereNameSpace__ecere__sys__FileOpen(location, 1);
if(file)
break;
}
}
if(sysIncludeDirs)
{
for(includeDir = (*sysIncludeDirs).first; includeDir; includeDir = includeDir->next)
{
strcpy(location, includeDir->name);
__ecereNameSpace__ecere__sys__PathCat(location, includeFile);
file = __ecereNameSpace__ecere__sys__FileOpen(location, 1);
if(file)
break;
}
}
}
return file;
}

void FreeIncludeFiles()
{
int c;

for(c = 0; c < numIncludes; c++)
(__ecereNameSpace__ecere__com__eSystem_Delete(includes[c]), includes[c] = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(includes), includes = 0);
numIncludes = 0;
}

extern void FreeSymbol(struct Symbol * symbol);

extern void FreeType(struct Type * type);

void __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

void FreeGlobalData(struct __ecereNameSpace__ecere__com__NameSpace * globalDataList)
{
struct __ecereNameSpace__ecere__com__NameSpace * ns;
struct GlobalData * data;

for(; (ns = (struct __ecereNameSpace__ecere__com__NameSpace *)globalDataList->nameSpaces.root); )
{
FreeGlobalData(ns);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalDataList->nameSpaces, (struct __ecereNameSpace__ecere__sys__BTNode *)ns);
(__ecereNameSpace__ecere__com__eSystem_Delete((*ns).name), (*ns).name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(ns), ns = 0);
}
for(; (data = (struct GlobalData *)globalDataList->functions.root); )
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalDataList->functions, data);
if(data->symbol)
FreeSymbol(data->symbol);
FreeType(data->dataType);
(__ecereNameSpace__ecere__com__eSystem_Delete(data->fullName), data->fullName = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(data->dataTypeString), data->dataTypeString = 0);
((data ? (__ecereClass_GlobalData->Destructor ? __ecereClass_GlobalData->Destructor(data) : 0, __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor ? __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor(data) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(data)) : 0), data = 0);
}
}

extern void PrintType(struct Type * type, char *  string, unsigned int printName, unsigned int fullName);

extern void Compiler_Warning(char *  format, ...);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(struct __ecereNameSpace__ecere__sys__OldList * this, void (*  freeFn)(void * ));

void CheckDataRedefinitions()
{
struct DataRedefinition * redefinition;

for(redefinition = dataRedefinitions.first; redefinition; redefinition = redefinition->next)
{
struct Type * type1 = ProcessTypeString(redefinition->type1, 0x0);
struct Type * type2 = ProcessTypeString(redefinition->type2, 0x0);
char type1String[1024] = "";
char type2String[1024] = "";

PrintType(type1, type1String, 0x0, 0x1);
PrintType(type2, type2String, 0x0, 0x1);
if(strcmp(type1String, type2String))
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Redefinition of %s (defining as %s, already defined as %s)\n", (((void *)0))), redefinition->name, type1String, type2String);
FreeType(type1);
FreeType(type2);
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&dataRedefinitions, (((void *)0)));
}

void __ecereRegisterModule_loadSymbols(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetGlobalData", "void SetGlobalData(ecere::com::NameSpace * nameSpace)", SetGlobalData, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetInIDE", "void SetInIDE(bool b)", SetInIDE, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetSourceDirs", "void SetSourceDirs(ecere::com::List<String> list)", SetSourceDirs, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetIncludeDirs", "void SetIncludeDirs(ecere::sys::OldList * list)", SetIncludeDirs, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetSysIncludeDirs", "void SetSysIncludeDirs(ecere::sys::OldList * list)", SetSysIncludeDirs, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetEcereImported", "void SetEcereImported(bool b)", SetEcereImported, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetEcereImported", "bool GetEcereImported(void)", GetEcereImported, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetInPreCompiler", "void SetInPreCompiler(bool b)", SetInPreCompiler, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetPrecompDefines", "void SetPrecompDefines(ecere::sys::OldList * list)", SetPrecompDefines, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DummyMethod", "bool DummyMethod(void)", DummyMethod, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("LoadSymbols", "bool LoadSymbols(char * fileName, ecere::com::ImportType importType, bool loadDllOnly)", LoadSymbols, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ImportModule", "void ImportModule(char * name, ecere::com::ImportType importType, ecere::com::AccessMode importAccess, bool loadDllOnly)", ImportModule, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FindIncludeFileID", "int FindIncludeFileID(char * includeFile)", FindIncludeFileID, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetIncludeFileID", "int GetIncludeFileID(char * includeFile)", GetIncludeFileID, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetIncludeFileFromID", "char * GetIncludeFileFromID(int id)", GetIncludeFileFromID, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("OpenIncludeFile", "ecere::sys::File OpenIncludeFile(char * includeFile)", OpenIncludeFile, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FreeIncludeFiles", "void FreeIncludeFiles(void)", FreeIncludeFiles, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("FreeGlobalData", "void FreeGlobalData(ecere::com::NameSpace globalDataList)", FreeGlobalData, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("CheckDataRedefinitions", "void CheckDataRedefinitions(void)", CheckDataRedefinitions, module, 1);
}

void __ecereUnregisterModule_loadSymbols(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map_TPL_String__ecere__com__List_TPL_ecere__com__Module___;

void __ecereCreateModuleInstances_loadSymbols()
{
loadedModules = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__Map_TPL_String__ecere__com__List_TPL_ecere__com__Module___);
__ecereNameSpace__ecere__com__eInstance_IncRef(loadedModules);
}

void __ecereDestroyModuleInstances_loadSymbols()
{
(__ecereNameSpace__ecere__com__eInstance_DecRef(loadedModules), loadedModules = 0);
}

