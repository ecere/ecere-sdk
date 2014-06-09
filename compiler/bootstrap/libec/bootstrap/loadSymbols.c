/* Code generated from eC source file: loadSymbols.ec */
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

#if /*defined(_W64) || */(defined(__WORDSIZE) && __WORDSIZE == 8) || defined(__x86_64__)
#define _64BIT 1
#else
#define _64BIT 0
#endif

#define arch_PointerSize                  sizeof(void *)
#define structSize_Instance               (_64BIT ? 24 : 12)

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

struct Type;

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

extern int yychar;

struct __ecereNameSpace__ecere__com__NameSpace * globalData;

void SetGlobalData(struct __ecereNameSpace__ecere__com__NameSpace * nameSpace)
{
globalData = nameSpace;
}

struct __ecereNameSpace__ecere__sys__OldList dataRedefinitions;

extern char sourceFileStack[30][797];

extern int include_stack_ptr;

static int numIncludes;

static char ** includes;

unsigned int inIDE = 0;

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

unsigned int inPreCompiler = 0;

void SetInPreCompiler(unsigned int b)
{
inPreCompiler = b;
}

unsigned int inSymbolGen = 0;

void SetInSymbolGen(unsigned int b)
{
inSymbolGen = b;
}

struct __ecereNameSpace__ecere__sys__OldList * precompDefines;

void SetPrecompDefines(struct __ecereNameSpace__ecere__sys__OldList * list)
{
precompDefines = list;
}

unsigned int DummyMethod()
{
return 1;
}

extern char *  __ecereNameSpace__ecere__sys__TrimLSpaces(const char *  string, char *  output);

extern int strcmp(const char * , const char * );

extern int strtol(const char * , char * * , int base);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eMember_AddDataMember(struct __ecereNameSpace__ecere__com__DataMember * member, const char *  name, const char *  type, unsigned int size, unsigned int alignment, int declMode);

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

extern struct __ecereNameSpace__ecere__com__BitMember * __ecereNameSpace__ecere__com__eClass_AddBitMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, int bitSize, int bitPos, int declMode);

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, unsigned int size, unsigned int alignment, int declMode);

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
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] == '[')
{
if(!strcmp(line, "[Size]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
size = strtol(line, (((void *)0)), 0);
}
else if(!strcmp(line, "[Pos]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
bitPos = strtol(line, (((void *)0)), 0);
}
else if(!strcmp(line, "[Public]"))
memberAccess = 1;
else if(!strcmp(line, "[Private]"))
memberAccess = 2;
else if(!strcmp(line, "[Type]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
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

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpenBuffered(const char *  fileName, int mode);

extern char *  __ecereNameSpace__ecere__sys__GetLastDirectory(const char *  string, char *  output);

extern int strcasecmp(const char * , const char * );

extern struct Symbol * DeclClass(int symbolID, const char *  name);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, const char *  name);

extern struct __ecereNameSpace__ecere__com__Instance * privateModule;

extern struct Symbol * FindClass(const char *  name);

extern const char *  sourceFile;

extern char *  strstr(const char * , const char * );

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, const char *  name, const char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

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

extern char *  strchr(const char * , int);

extern void *  memcpy(void * , const void * , size_t size);

extern char *  __ecereNameSpace__ecere__sys__TrimRSpaces(const char *  string, char *  output);

extern void __ecereNameSpace__ecere__com__eEnum_AddFixedValue(struct __ecereNameSpace__ecere__com__Class * _class, const char *  string, long long value);

extern long long strtoll(const char *  nptr, char * *  endptr, int base);

extern long long __ecereNameSpace__ecere__com__eEnum_AddValue(struct __ecereNameSpace__ecere__com__Class * _class, const char *  string);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddVirtualMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, void *  function, int declMode);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_AddProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  dataType, void *  setStmt, void *  getStmt, int declMode);

extern void __ecereNameSpace__ecere__com__eProperty_Watchable(struct __ecereNameSpace__ecere__com__Property * _property);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassProperty;

struct __ecereNameSpace__ecere__com__ClassProperty;

extern struct __ecereNameSpace__ecere__com__ClassProperty * __ecereNameSpace__ecere__com__eClass_AddClassProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  dataType, void *  setStmt, void *  getStmt);

extern char *  __ecereNameSpace__ecere__sys__CopyString(const char *  string);

extern struct __ecereNameSpace__ecere__com__Instance * pushLexer(void);

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
long long i64;
uint64 ui64;
} __attribute__ ((gcc_struct)) __anon1;
struct OpTable ops;
} __attribute__ ((gcc_struct));

extern unsigned int skipErrors;

extern struct Expression * ParseExpressionString(char *  expression);

extern struct Type * ProcessTypeString(const char *  string, unsigned int staticMethod);

extern void ProcessExpressionType(struct Expression * exp);

extern void ComputeExpression(struct Expression * exp);

extern struct Operand GetOperand(struct Expression * exp);

extern void FreeExpression(struct Expression * exp);

extern void popLexer(struct __ecereNameSpace__ecere__com__Instance * backup);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateParameter;

struct __ecereNameSpace__ecere__com__ClassTemplateParameter;

extern struct __ecereNameSpace__ecere__com__ClassTemplateParameter * __ecereNameSpace__ecere__com__eClass_AddTemplateParameter(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, int type, const void *  info, struct __ecereNameSpace__ecere__com__ClassTemplateArgument * defaultArg);

extern void __ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(struct __ecereNameSpace__ecere__com__Class * base);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DefinedExpression;

struct __ecereNameSpace__ecere__com__DefinedExpression;

extern struct __ecereNameSpace__ecere__com__DefinedExpression * __ecereNameSpace__ecere__com__eSystem_RegisterDefine(const char *  name, const char *  value, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(const char *  name, const char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

extern char *  strncpy(char * , const char * , size_t n);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__NameSpace;

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

void ImportModule(const char *  name, int importType, int importAccess, unsigned int loadDllOnly);

extern char *  __ecereNameSpace__ecere__sys__GetSystemPathBuffer(char *  d, const char *  p);

extern void Compiler_Error(const char *  format, ...);

extern const char *  __ecereNameSpace__ecere__GetTranslatedString(const char * name, const char *  string, const char *  stringAndContext);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__File;

struct __ecereNameSpace__ecere__sys__BTNode * __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_FindString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, const char *  key);

int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, const char *  a, const char *  b);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

unsigned int LoadSymbols(const char * fileName, int importType, unsigned int loadDllOnly)
{
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__sys__FileOpenBuffered(fileName, 1);
unsigned int globalInstance = 0;

if(f)
{
unsigned int ecereCOMModule = 0;
char moduleName[797];

__ecereNameSpace__ecere__sys__GetLastDirectory(fileName, moduleName);
if(!((strcasecmp)(moduleName, "instance.sym") && (strcasecmp)(moduleName, "BinaryTree.sym") && (strcasecmp)(moduleName, "dataTypes.sym") && (strcasecmp)(moduleName, "OldList.sym") && (strcasecmp)(moduleName, "String.sym") && (strcasecmp)(moduleName, "BTNode.sym") && (strcasecmp)(moduleName, "Array.sym") && (strcasecmp)(moduleName, "AVLTree.sym") && (strcasecmp)(moduleName, "BuiltInContainer.sym") && (strcasecmp)(moduleName, "Container.sym") && (strcasecmp)(moduleName, "CustomAVLTree.sym") && (strcasecmp)(moduleName, "LinkList.sym") && (strcasecmp)(moduleName, "List.sym") && (strcasecmp)(moduleName, "Map.sym") && (strcasecmp)(moduleName, "Mutex.sym")))
ecereCOMModule = 1;
for(; ; )
{
char line[1024];

if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(line[0] == '[')
{
if(!strcmp(line, "[Global Instance]"))
globalInstance = 1;
else if(!strcmp(line, "[Defined Classes]"))
{
struct __ecereNameSpace__ecere__com__Class * regClass = (((void *)0));
char name[1024];
unsigned int isRemote = 0;
unsigned int isStatic = 0;
unsigned int isWatchable = 0;
int classType = 0;
unsigned int fixed = 0;
unsigned int noExpansion = 0;
int inheritanceAccess = 1;

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] == '[')
{
if(!strcmp(line, "[Remote]"))
isRemote = 1;
else if(!strcmp(line, "[Static]"))
isStatic = 1;
else if(!strcmp(line, "[Fixed]"))
fixed = 1;
else if(!strcmp(line, "[No Expansion]"))
noExpansion = 1;
else if(!strcmp(line, "[Watchable]"))
isWatchable = 1;
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
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(importType == 3)
DeclClass(0, name);
if(isStatic || loadDllOnly || importType == 3 || importType == 4)
regClass = (((void *)0));
else if(regClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, name), !regClass || regClass->internalDecl || regClass->isRemote)
{
struct Symbol * existingClass = FindClass(name);
const char * baseName = (classType == 0 && importType == 2 && isRemote) ? "DCOMClientObject" : (!strcmp(line, "[None]") ? (((void *)0)) : line);

if(!isRemote || (importType != 2) || (!sourceFile || !strstr(sourceFile, ".main.ec")))
{
if(!regClass || regClass->internalDecl)
regClass = __ecereNameSpace__ecere__com__eSystem_RegisterClass(classType, name, isRemote ? (((void *)0)) : baseName, 0, 0, (((void *)0)), (((void *)0)), privateModule, ecereCOMModule ? 4 : 1, inheritanceAccess);
if(regClass && isRemote)
regClass->isRemote = (importType == 2) ? 1 : 2;
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
regClass->isRemote = (importType == 2) ? 1 : 3;
}
if(existingClass)
{
struct __ecereNameSpace__ecere__sys__OldLink * link;

for(link = existingClass->templatedClasses.first; link; link = link->next)
{
struct Symbol * symbol = link->data;

symbol->__anon1.registered = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, symbol->string);
}
}
if(fixed)
regClass->fixed = 1;
if(noExpansion)
regClass->noExpansion = 1;
if(isWatchable)
{
__ecereNameSpace__ecere__com__eClass_DestructionWatchable(regClass);
regClass->structSize = regClass->offset;
}
if(regClass && existingClass)
{
existingClass->__anon1.registered = regClass;
regClass->symbol = existingClass;
existingClass->id = (((int)0x7fffffff));
existingClass->idCode = (((int)0x7fffffff));
existingClass->imported = 1;
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
isRemote = 0;
isWatchable = 0;
fixed = 0;
isStatic = 0;
}
else if(!strcmp(line, "[Enum Values]"))
{
for(; ; )
{
char * equal;

if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
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
__ecereNameSpace__ecere__com__eEnum_AddFixedValue(regClass, name, strtoll(equal + 1, (((void *)0)), 0));
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
unsigned int isVirtual = 0;
int memberAccess = 1;

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] == '[')
{
if(!strcmp(line, "[Type]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
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
isVirtual = 1;
else if(!strcmp(line, "[Public]"))
memberAccess = 1;
else if(!strcmp(line, "[Private]"))
memberAccess = 2;
}
else
{
strcpy(name, line);
isVirtual = 0;
memberAccess = 1;
}
}
}
else if(!strcmp(line, "[Defined Properties]"))
{
char name[1024];
unsigned int setStmt = 0, getStmt = 0, isVirtual = 0, conversion = 0;
unsigned int isWatchable = 0;
int memberAccess = 1;

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] == '[')
{
if(!strcmp(line, "[Type]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(regClass)
{
struct __ecereNameSpace__ecere__com__Property * prop = __ecereNameSpace__ecere__com__eClass_AddProperty(regClass, conversion ? (((void *)0)) : name, line[0] ? line : 0, (void *)(uintptr_t)setStmt, (void *)(uintptr_t)getStmt, memberAccess);

if(prop)
{
prop->compiled = 0;
if(isWatchable)
{
__ecereNameSpace__ecere__com__eProperty_Watchable(prop);
regClass->structSize = regClass->offset;
}
}
}
}
else if(!strcmp(line, "[Set]"))
setStmt = 1;
else if(!strcmp(line, "[Get]"))
getStmt = 1;
else if(!strcmp(line, "[Watchable]"))
isWatchable = 1;
else if(!strcmp(line, "[Public]"))
memberAccess = 1;
else if(!strcmp(line, "[Private]"))
memberAccess = 2;
else if(!strcmp(line, "[Conversion]"))
{
conversion = 1;
setStmt = getStmt = isVirtual = isWatchable = 0;
}
}
else
{
strcpy(name, line);
setStmt = getStmt = isVirtual = conversion = isWatchable = 0;
memberAccess = 1;
}
}
}
else if(!strcmp(line, "[Defined Class Properties]"))
{
char name[1024];
unsigned int setStmt = 0, getStmt = 0;

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] == '[')
{
if(!strcmp(line, "[Type]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(regClass)
{
__ecereNameSpace__ecere__com__eClass_AddClassProperty(regClass, name, line, (void *)(uintptr_t)setStmt, (void *)(uintptr_t)getStmt);
}
}
else if(!strcmp(line, "[Set]"))
setStmt = 1;
else if(!strcmp(line, "[Get]"))
getStmt = 1;
}
else
{
strcpy(name, line);
setStmt = getStmt = 0;
}
}
}
else if(!strcmp(line, "[Defined Data Members]"))
{
ReadDataMembers(regClass, (((void *)0)), f);
}
else if(!strcmp(line, "[Template Parameters]"))
{
while(!((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof])(f))
{
char name[1024];
int type = 0;
struct __ecereNameSpace__ecere__com__ClassTemplateArgument defaultArg =
{

.__anon1 = {

.__anon1 = {
.dataTypeString = 0
}
}
};
void * info = (((void *)0));

__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(line[0] == '.')
break;
strcpy(name, line);
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "[Expression]"))
type = 2;
else if(!strcmp(line, "[Identifier]"))
type = 1;
switch(type)
{
case 0:
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(regClass && strcmp(line, "[None]"))
{
info = __ecereNameSpace__ecere__sys__CopyString(line);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(regClass && strcmp(line, "[None]"))
{
defaultArg.__anon1.__anon1.dataTypeString = __ecereNameSpace__ecere__sys__CopyString(line);
}
break;
case 2:
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(regClass && strcmp(line, "[None]"))
{
info = __ecereNameSpace__ecere__sys__CopyString(line);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(regClass && strcmp(line, "[None]"))
{
struct __ecereNameSpace__ecere__com__Instance * backup = pushLexer();
struct Operand op;
struct Expression * exp;

skipErrors = 1;
exp = ParseExpressionString(line);
if(exp)
{
if(info)
exp->destType = ProcessTypeString(info, 0);
ProcessExpressionType(exp);
ComputeExpression(exp);
op = GetOperand(exp);
defaultArg.__anon1.expression.__anon1.ui64 = op.__anon1.ui64;
FreeExpression(exp);
}
skipErrors = 0;
popLexer(backup);
}
break;
case 1:
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "[Data member]"))
info = (void *)0;
else if(!strcmp(line, "[Method]"))
info = (void *)1;
else if(!strcmp(line, "[Property]"))
info = (void *)2;
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(regClass && strcmp(line, "[None]"))
{
defaultArg.__anon1.__anon2.memberString = __ecereNameSpace__ecere__sys__CopyString(line);
}
break;
}
if(regClass)
__ecereNameSpace__ecere__com__eClass_AddTemplateParameter(regClass, name, type, info, &defaultArg);
if(type == 0 || type == 2)
(__ecereNameSpace__ecere__com__eSystem_Delete(info), info = 0);
if(type == 0 || type == 1)
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)defaultArg.__anon1.__anon1.dataTypeString), defaultArg.__anon1.__anon1.dataTypeString = 0);
}
if(regClass)
__ecereNameSpace__ecere__com__eClass_DoneAddingTemplateParameters(regClass);
}
}
else
{
inheritanceAccess = 1;
classType = 0;
isRemote = 0;
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
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(!strcmp(line, "[Value]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
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
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(!strcmp(line, "[Type]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
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
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(!strcmp(line, "[Type]"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line));
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
data = __extension__ ({
struct GlobalData * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_GlobalData);

__ecereInstance1->fullName = __ecereNameSpace__ecere__sys__CopyString(name), __ecereInstance1->dataTypeString = __ecereNameSpace__ecere__sys__CopyString(line), __ecereInstance1->module = privateModule, __ecereInstance1;
});
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
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
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
ecereImported = 1;
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
char sysFileName[797];

__ecereNameSpace__ecere__sys__GetSystemPathBuffer(sysFileName, fileName);
Compiler_Error(__ecereNameSpace__ecere__GetTranslatedString("ec", "Couldn't open %s\n", (((void *)0))), sysFileName);
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

extern size_t strlen(const char * );

extern char *  __ecereNameSpace__ecere__sys__GetExtension(const char *  string, char *  output);

extern char *  symbolsDir;

extern char *  __ecereNameSpace__ecere__sys__PathCat(char *  string, const char *  addedPath);

extern char *  __ecereNameSpace__ecere__sys__ChangeExtension(const char *  string, const char *  ext, char *  output);

extern unsigned int __ecereNameSpace__ecere__sys__FileExists(const char *  fileName);

extern unsigned int inCompiler;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IteratorPointer;

struct __ecereNameSpace__ecere__com__IteratorPointer;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__MapIterator;

struct __ecereNameSpace__ecere__com__MapIterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__eModule_LoadStrict(struct __ecereNameSpace__ecere__com__Instance * fromModule, const char *  name, int importAccess);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

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
const char *  name;
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

extern int sprintf(char * , const char * , ...);

extern int __ecereNameSpace__ecere__com__GetRuntimePlatform(void);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List_TPL_ecere__com__Module_;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_map(struct __ecereNameSpace__ecere__com__MapIterator * this);

void __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(struct __ecereNameSpace__ecere__com__MapIterator * this, struct __ecereNameSpace__ecere__com__Instance * value);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__com__MapIterator_map;

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(struct __ecereNameSpace__ecere__com__Iterator * this, const uint64 index, unsigned int create);

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List;

uint64 __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(struct __ecereNameSpace__ecere__com__Iterator * this);

void __ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(struct __ecereNameSpace__ecere__com__Iterator * this, uint64 value);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__com__Iterator_data;

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Next();

void ImportModule(const char * name, int importType, int importAccess, unsigned int loadDllOnly)
{
struct ImportedModule * module = (((void *)0));
char moduleName[797];

strncpy(moduleName, name, (797) - 1);
moduleName[(797) - 1] = (char)0;
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
if(!strcmp(ext, "dll") || !strcmp(ext, "so") || !strcmp(ext, "dylib") || !ext[0])
{
if(importType != 4)
{
if(!module)
{
if(precompDefines)
{
module = __extension__ ({
struct ImportedModule * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ImportedModule);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(moduleName), __ecereInstance1->type = 0, __ecereInstance1->importType = importType, __ecereInstance1->importAccess = importAccess, __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*precompDefines), module);
}
module = __extension__ ({
struct ImportedModule * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ImportedModule);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(moduleName), __ecereInstance1->type = 0, __ecereInstance1->importType = importType, __ecereInstance1->importAccess = importAccess, __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName((&*defines), module);
}
module->dllOnly = loadDllOnly;
if(ext[0] || !__ecereNameSpace__ecere__sys__FileExists(symFile))
{
unsigned int skipLoad = 0;
struct __ecereNameSpace__ecere__com__Instance * list = (((void *)0));

if(!inCompiler && !inPreCompiler && !inSymbolGen)
{
struct __ecereNameSpace__ecere__com__MapIterator it = (it.container = (void *)0, it.pointer = (void *)0, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(&it, loadedModules), it);

if(!__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index((void *)&it, (uint64)(name), 0))
{
struct __ecereNameSpace__ecere__com__Instance * firstModule = __ecereNameSpace__ecere__com__eModule_LoadStrict(((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + structSize_Instance)))->application, name, importAccess);

if(firstModule)
{
list = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__List_TPL_ecere__com__Module_);
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = list;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__List->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(list, (uint64)(firstModule));
__extension__ ({
struct __ecereNameSpace__ecere__com__Iterator __internalIterator =
{
loadedModules, 0
};

__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(&__internalIterator, ((uint64)(name)), 1);
__ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(&__internalIterator, ((uint64)(list)));
});
}
else
skipLoad = 1;
}
else
list = ((struct __ecereNameSpace__ecere__com__Instance *)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data((void *)&it));
}
if(!skipLoad)
{
loadedModule = __ecereNameSpace__ecere__com__eModule_LoadStrict(privateModule, name, importAccess);
if(loadedModule)
{
((struct __ecereNameSpace__ecere__com__Module *)(((char *)loadedModule + structSize_Instance)))->importType = importType;
module->dllOnly = 0x0;
if(list)
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = list;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__List->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(list, (uint64)(loadedModule));
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
module = __extension__ ({
struct ImportedModule * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ImportedModule);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(moduleName), __ecereInstance1->type = 0, __ecereInstance1->importType = importType, __ecereInstance1->importAccess = importAccess, __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*precompDefines), module);
}
module = __extension__ ({
struct ImportedModule * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ImportedModule);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(moduleName), __ecereInstance1->type = 0, __ecereInstance1->importType = importType, __ecereInstance1->importAccess = importAccess, __ecereInstance1;
});
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

strcpy(symFile, ((char * )(__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&dir))));
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

extern char *  __ecereNameSpace__ecere__sys__StripLastDirectory(const char *  string, char *  output);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpen(const char *  fileName, int mode);

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
if(!file && sysIncludeDirs)
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
(__ecereNameSpace__ecere__com__eSystem_Delete((void *)(*ns).name), (*ns).name = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(ns), ns = 0);
}
for(; (data = (struct GlobalData *)globalDataList->functions.root); )
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Remove(&globalDataList->functions, (void *)data);
if(data->symbol)
FreeSymbol(data->symbol);
FreeType(data->dataType);
(__ecereNameSpace__ecere__com__eSystem_Delete(data->fullName), data->fullName = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(data->dataTypeString), data->dataTypeString = 0);
((data ? (__ecereClass_GlobalData->Destructor ? __ecereClass_GlobalData->Destructor((void *)data) : 0, __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor ? __ecereClass___ecereNameSpace__ecere__sys__BTNode->Destructor((void *)data) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(data)) : 0), data = 0);
}
}

extern void PrintType(struct Type * type, char *  string, unsigned int printName, unsigned int fullName);

extern void Compiler_Warning(const char *  format, ...);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(struct __ecereNameSpace__ecere__sys__OldList * this, void (*  freeFn)(void * ));

void CheckDataRedefinitions()
{
struct DataRedefinition * redefinition;

for(redefinition = dataRedefinitions.first; redefinition; redefinition = redefinition->next)
{
struct Type * type1 = ProcessTypeString(redefinition->type1, 0);
struct Type * type2 = ProcessTypeString(redefinition->type2, 0);
char type1String[1024] = "";
char type2String[1024] = "";

PrintType(type1, type1String, 0, 1);
PrintType(type2, type2String, 0, 1);
if(strcmp(type1String, type2String))
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "Redefinition of %s (defining as %s, already defined as %s)\n", (((void *)0))), redefinition->name, type1String, type2String);
FreeType(type1);
FreeType(type2);
}
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&dataRedefinitions, (((void *)0)));
}

void __ecereRegisterModule_loadSymbols(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetGlobalData", "void SetGlobalData(ecere::com::NameSpace * nameSpace)", SetGlobalData, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetInIDE", "void SetInIDE(bool b)", SetInIDE, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetSourceDirs", "void SetSourceDirs(ecere::com::List<String> list)", SetSourceDirs, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetIncludeDirs", "void SetIncludeDirs(ecere::sys::OldList * list)", SetIncludeDirs, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetSysIncludeDirs", "void SetSysIncludeDirs(ecere::sys::OldList * list)", SetSysIncludeDirs, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetEcereImported", "void SetEcereImported(bool b)", SetEcereImported, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetEcereImported", "bool GetEcereImported(void)", GetEcereImported, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetInPreCompiler", "void SetInPreCompiler(bool b)", SetInPreCompiler, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetInSymbolGen", "void SetInSymbolGen(bool b)", SetInSymbolGen, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetPrecompDefines", "void SetPrecompDefines(ecere::sys::OldList * list)", SetPrecompDefines, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("DummyMethod", "bool DummyMethod(void)", DummyMethod, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("LoadSymbols", "bool LoadSymbols(const char * fileName, ecere::com::ImportType importType, bool loadDllOnly)", LoadSymbols, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ImportModule", "void ImportModule(const char * name, ecere::com::ImportType importType, ecere::com::AccessMode importAccess, bool loadDllOnly)", ImportModule, module, 1);
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

