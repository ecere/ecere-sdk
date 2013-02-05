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

struct Expression;

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declarator;

struct Declarator;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionDefinition;

struct FunctionDefinition;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBTableDef;

struct DBTableDef;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_External;

struct External;

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

struct ClassImport
{
struct ClassImport * prev;
struct ClassImport * next;
char *  name;
struct __ecereNameSpace__ecere__sys__OldList methods;
struct __ecereNameSpace__ecere__sys__OldList properties;
unsigned int itself;
unsigned int isRemote;
} __attribute__ ((gcc_struct));

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


static unsigned int i18n;

static int targetPlatform;

static int targetBits;

static unsigned int isConsole;

static unsigned int isDynamicLibrary;

static unsigned int isStaticLibrary;

static struct __ecereNameSpace__ecere__sys__OldList modules;

static struct __ecereNameSpace__ecere__com__Instance * dcomSymbols;

struct __ecereNameSpace__ecere__sys__OldList _defines = 
{
0, 0, 0, 0, 0
};

struct __ecereNameSpace__ecere__sys__OldList _imports = 
{
0, 0, 0, 0, 0
};

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

static struct Context * theGlobalContext;

static struct ModuleImport * mainModule;

static struct __ecereNameSpace__ecere__com__Instance * privateModule;

static char mainModuleName[797];

static char projectName[797];

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpen(char *  fileName, int mode);

extern char *  __ecereNameSpace__ecere__sys__TrimLSpaces(char *  string, char *  output);

extern int strcmp(const char * , const char * );

extern struct ModuleImport * GetMainModule(void);

extern void SetMainModule(struct ModuleImport * moduleImport);

extern char *  __ecereNameSpace__ecere__sys__CopyString(char *  string);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_MethodImport;

struct MethodImport
{
struct MethodImport * prev;
struct MethodImport * next;
char *  name;
unsigned int isVirtual;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyImport;

struct PropertyImport
{
struct PropertyImport * prev;
struct PropertyImport * next;
char *  name;
unsigned int isVirtual;
unsigned int hasSet;
unsigned int hasGet;
} __attribute__ ((gcc_struct));

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionImport;

struct FunctionImport
{
struct FunctionImport * prev;
struct FunctionImport * next;
char *  name;
} __attribute__ ((gcc_struct));

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(struct __ecereNameSpace__ecere__com__Instance * this, char *  s, int max);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void *  __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(struct __ecereNameSpace__ecere__sys__OldList * this, char *  name, unsigned int warn);

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

static void LoadImports(char * fileName)
{
void * __ecereTemp1;
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__sys__FileOpen(fileName, 1);

if(f)
{
for(; ; )
{
char line[1024];

if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(line[0] == '[')
{
if(!strcmp(line, "[Imported Modules]"))
{
struct ModuleImport * module = (((void *)0));

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] == '[')
{
struct ClassImport * _class = (((void *)0));
struct FunctionImport * function = (((void *)0));

if(!strcmp(line, "[This]"))
{
if((mainModule = GetMainModule()))
module = mainModule;
else
{
mainModule = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ModuleImport);
SetMainModule(mainModule);
module = mainModule;
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(&_imports, module);
}
}
else if(!strcmp(line, "[Static]"))
{
module->importType = 1;
}
else if(!strcmp(line, "[Remote]"))
{
module->importType = 2;
}
else if(!strcmp(line, "[Private]"))
{
if(module->importAccess != 1)
module->importAccess = 2;
}
else if(!strcmp(line, "[Public]"))
{
module->importAccess = 1;
}
else if(!strcmp(line, "[Imported Classes]"))
{
for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] == '[')
{
if(!strcmp(line, "[Instantiated]"))
{
_class->itself = 0x1;
}
else if(!strcmp(line, "[Remote]"))
{
_class->isRemote = (unsigned int)1;
}
else if(!strcmp(line, "[Imported Methods]"))
{
struct MethodImport * method = (((void *)0));

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] != '[')
{
if(!(method = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(&_class->methods, line, 0x0)))
{
method = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_MethodImport), ((struct MethodImport *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(line), ((struct MethodImport *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(&_class->methods, method);
}
}
else if(!strcmp(line, "[Virtual]"))
method->isVirtual = 0x1;
}
}
else if(!strcmp(line, "[Imported Properties]"))
{
struct PropertyImport * prop = (((void *)0));

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] != '[')
{
if(!(prop = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(&_class->properties, line, 0x0)))
{
prop = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_PropertyImport), ((struct PropertyImport *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(line), ((struct PropertyImport *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(&_class->properties, prop);
}
}
else if(!strcmp(line, "[Set]"))
prop->hasSet = 0x1;
else if(!strcmp(line, "[Get]"))
prop->hasGet = 0x1;
else if(!strcmp(line, "[Virtual]"))
prop->isVirtual = 0x1;
}
}
}
else
{
if(!(_class = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(&module->classes, line, 0x0)))
{
_class = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassImport), ((struct ClassImport *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(line), ((struct ClassImport *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(&module->classes, _class);
}
}
}
}
else if(!strcmp(line, "[Imported Functions]"))
{
for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] == '[')
{
}
else
{
if(!(function = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(&module->functions, line, 0x0)))
{
function = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_FunctionImport), ((struct FunctionImport *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(line), ((struct FunctionImport *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(&module->functions, function);
}
}
}
}
}
else
{
if(!(module = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(&_imports, line, 0x0)))
{
if(!strcmp(line, "ecereCOM"))
{
module = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(&_imports, "ecere", 0x0);
}
else if(!strcmp(line, "ecere"))
{
module = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(&_imports, "ecereCOM", 0x0);
if(module)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(module->name), module->name = 0);
module->name = __ecereNameSpace__ecere__sys__CopyString("ecere");
}
}
if(!module)
{
module = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ModuleImport), ((struct ModuleImport *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(line), ((struct ModuleImport *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(&_imports, module);
}
}
}
}
}
}
}
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}
}

static struct __ecereNameSpace__ecere__com__Class * thisAppClass;

struct ModuleInfo
{
struct ModuleInfo * prev, * next;
char * name;
unsigned int globalInstance;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ModuleInfo;

extern char *  __ecereNameSpace__ecere__sys__GetLastDirectory(char *  string, char *  output);

extern unsigned int __ecereNameSpace__ecere__sys__StripExtension(char *  string);

extern char *  strcpy(char * , const char * );

extern void __ecereNameSpace__ecere__sys__ChangeCh(char *  string, char ch1, char ch2);

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

static void BindDCOMServer();

static void BindDCOMClient();

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

extern void FullClassNameCat(char *  output, char *  className, unsigned int includeTemplateParams);

extern void MangleClassName(char *  className);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct Context * SetupTemplatesContext(struct __ecereNameSpace__ecere__com__Class * _class);

extern struct Type * ProcessTypeString(char *  string, unsigned int staticMethod);

extern void FinishTemplatesContext(struct Context * context);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction
{
struct __ecereNameSpace__ecere__com__GlobalFunction * prev;
struct __ecereNameSpace__ecere__com__GlobalFunction * next;
char *  name;
int (*  function)();
struct __ecereNameSpace__ecere__com__Instance * module;
struct __ecereNameSpace__ecere__com__NameSpace *  nameSpace;
char *  dataTypeString;
struct Type * dataType;
void *  symbol;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_FindFunction(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

extern int sprintf(char * , char * , ...);

extern void __ecereNameSpace__ecere__com__eInstance_Delete(struct __ecereNameSpace__ecere__com__Instance * instance);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts;

int __ecereMethod___ecereNameSpace__ecere__sys__File_Printf(struct __ecereNameSpace__ecere__com__Instance * this, char *  format, ...);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

static void WriteMain(char * fileName)
{
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__sys__FileOpen(fileName, 2);

if(f)
{
struct ModuleImport * module;
struct ModuleInfo * defModule;
unsigned int nonInst = 0x0, anyMethod = 0x0, anyProp = 0x0, anyFunction = 0x0;
struct ImportedModule * importedModule;

__ecereNameSpace__ecere__sys__GetLastDirectory(fileName, mainModuleName);
__ecereNameSpace__ecere__sys__StripExtension(mainModuleName);
if(!projectName[0])
{
strcpy(projectName, mainModuleName);
__ecereNameSpace__ecere__sys__StripExtension(projectName);
}
__ecereNameSpace__ecere__sys__ChangeCh(mainModuleName, '.', '_');
__ecereNameSpace__ecere__sys__ChangeCh(mainModuleName, '-', '_');
__ecereNameSpace__ecere__sys__ChangeCh(mainModuleName, ' ', '_');
if(targetPlatform == 1 && !isConsole && !isStaticLibrary && !isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "typedef void * HINSTANCE;\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "#define WINAPI __stdcall\n");
}
for(importedModule = _defines.first; importedModule; importedModule = importedModule->next)
{
if(importedModule->type == 0)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "import ");
if(importedModule->importType == 1)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "static ", importedModule->name);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\"%s\"\n", importedModule->name);
}
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "default:\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "static Module __currentModule;\n\n");
if(!isStaticLibrary)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "Module __thisModule;\n\n");
BindDCOMServer();
BindDCOMClient();
if(dcomSymbols)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "void __ecereRegisterModule_%s(Module module);\n\n", mainModuleName);
for(module = _imports.first; module; module = module->next)
{
struct ClassImport * _class;
struct FunctionImport * function;

if(module->importType == 1)
{
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "bool __ecereDll_Load_%s(Module module);\n", module->name);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "bool __ecereDll_Unload_%s(Module module);\n", module->name);
}
}
for(_class = module->classes.first; _class; _class = _class->next)
{
struct MethodImport * method;
struct PropertyImport * prop;
char className[1024] = "";
struct __ecereNameSpace__ecere__com__Class * regClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, _class->name);

FullClassNameCat(className, _class->name, 0x1);
MangleClassName(className);
if(_class->itself)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "Class __ecereClass_%s;\n", className);
else
nonInst = 0x1;
{
{
for(method = _class->methods.first; method; method = method->next)
{
struct __ecereNameSpace__ecere__com__Method * meth = __ecereNameSpace__ecere__com__eClass_FindMethod(regClass, method->name, privateModule);

if(meth && !meth->dataType)
{
struct Context * context = SetupTemplatesContext(regClass);

meth->dataType = ProcessTypeString(meth->dataTypeString, 0x0);
FinishTemplatesContext(context);
}
if(method->isVirtual)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "int __ecereVMethodID_%s_%s;\n", className, method->name);
else if(module->name && module->importType != 1 && (!meth || !meth->dataType->dllExport))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "int (*__ecereMethod_%s_%s)();\n", className, method->name);
}
anyMethod = 0x1;
}
}
for(prop = _class->properties.first; prop; prop = prop->next)
{
char propName[1024];

propName[0] = (char)0;
FullClassNameCat(propName, prop->name, 0x1);
MangleClassName(propName);
if(module->name && module->importType != 1)
{
if(prop->hasSet)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "void * __ecereProp_%s_Set_%s;\n", className, propName);
if(prop->hasGet)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "void * __ecereProp_%s_Get_%s;\n", className, propName);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "Property __ecereProp_%s_%s;\n", className, propName);
anyProp = 0x1;
}
}
}
for(function = module->functions.first; function; function = function->next)
{
struct __ecereNameSpace__ecere__com__GlobalFunction * func = __ecereNameSpace__ecere__com__eSystem_FindFunction(privateModule, function->name);

if(func && !func->dataType)
func->dataType = ProcessTypeString(func->dataTypeString, 0x0);
if(module->name && module->importType != 1 && (!func || !func->dataType || !func->dataType->dllExport))
{
char functionName[1024];

functionName[0] = (char)0;
FullClassNameCat(functionName, function->name, 0x0);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "void * __ecereFunction_%s;\n", functionName);
anyFunction = 0x1;
}
}
}
for(defModule = modules.first; defModule; defModule = defModule->next)
{
char moduleName[1024];

strcpy(moduleName, defModule->name);
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, ' ', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '-', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '.', '_');
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "void __ecereRegisterModule_%s(Module module);\n", moduleName);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "void __ecereUnregisterModule_%s(Module module);\n", moduleName);
if(defModule->globalInstance)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "void __ecereCreateModuleInstances_%s();\n", moduleName);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "void __ecereDestroyModuleInstances_%s();\n", moduleName);
}
}
if(dcomSymbols)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))dcomSymbols->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(dcomSymbols, 0, 0);
while(!((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))dcomSymbols->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof])(dcomSymbols))
{
char buffer[4096];
int read = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))dcomSymbols->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read])(dcomSymbols, buffer, 1, sizeof buffer);

if(!read)
break;
((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])(f, buffer, 1, read);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
}
if(isStaticLibrary)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\nbool __ecereDll_Load_%s(Module module)\n{\n", projectName);
}
else if(isDynamicLibrary)
{
if(targetPlatform == 1)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\ndllexport bool __stdcall __ecereDll_Load(Module module)\n{\n");
else
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\ndllexport bool __ecereDll_Load(Module module)\n{\n");
}
else if(targetPlatform == 1 && !isConsole)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\nint WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInst, char * cmdLine, int show)\n{\n");
}
else
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\nint main(int _argc, char * _argv[])\n{\n");
if(!isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   int exitCode;\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   Module module;\n");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   Class _class;\n");
if(anyMethod)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   Method method;\n");
if(anyProp)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   Property _property;\n");
if(anyFunction)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   GlobalFunction function;\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
if(isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   if(!__currentModule)\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   {\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "      __currentModule = module;\n");
if(!isStaticLibrary)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "      __thisModule = module;\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   }\n\n");
}
else if(targetPlatform == 1 && !isConsole)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   __thisModule = __currentModule = module = __ecere_COM_Initialize(1, 0, null);\n\n");
else
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   __thisModule = __currentModule = module = __ecere_COM_Initialize(1, _argc, (void *)_argv);\n\n");
if(_imports.count)
{
for(module = _imports.first; module; module = module->next)
{
if(module->name)
{
{
if(module->importType == 1)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   eModule_LoadStatic(module, \"%s\", %s, __ecereDll_Load_%s, __ecereDll_Unload_%s);\n", module->name, (module->importAccess == 2) ? "privateAccess" : "publicAccess", module->name, module->name);
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   eModule_Load(module, \"%s\", %s);\n", module->name, (module->importAccess == 2) ? "privateAccess" : "publicAccess");
}
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
}
if(modules.count)
{
for(defModule = modules.first; defModule; defModule = defModule->next)
{
char moduleName[1024];

strcpy(moduleName, defModule->name);
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, ' ', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '-', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '.', '_');
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereRegisterModule_%s(module);\n", moduleName);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
}
if(dcomSymbols)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereRegisterModule_%s(module);\n\n", mainModuleName);
(__ecereNameSpace__ecere__com__eInstance_DecRef(dcomSymbols), dcomSymbols = 0);
}
if(isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   if(__currentModule == module)\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   {\n");
}
for(module = _imports.first; module; module = module->next)
{
struct ClassImport * _class;
struct FunctionImport * function;

if(module->classes.count)
{
for(_class = module->classes.first; _class; _class = _class->next)
{
struct __ecereNameSpace__ecere__com__Class * regClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, _class->name);

{
struct MethodImport * method;
struct PropertyImport * prop;
char classID[1024];
char className[1024] = "";

FullClassNameCat(className, _class->name, 0x1);
MangleClassName(className);
if(_class->itself)
sprintf(classID, "__ecereClass_%s", className);
else
strcpy(classID, "_class");
if(isDynamicLibrary && !isStaticLibrary)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   %s = eSystem_FindClass(__currentModule, \"%s\");\n", classID, _class->name);
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   %s = eSystem_FindClass(module, \"%s\");\n", classID, _class->name);
for(method = _class->methods.first; method; method = method->next)
{
struct __ecereNameSpace__ecere__com__Method * meth = __ecereNameSpace__ecere__com__eClass_FindMethod(regClass, method->name, privateModule);

if(!meth || !meth->dataType->dllExport)
{
if(method->isVirtual || (module->name && module->importType != 1))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   method = eClass_FindMethod(%s, \"%s\", module);\n", classID, method->name);
if(method->isVirtual)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   if(method) __ecereVMethodID_%s_%s = method.vid;\n", className, method->name);
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   if(method) __ecereMethod_%s_%s = method.function;\n", className, method->name);
}
}
}
for(prop = _class->properties.first; prop; prop = prop->next)
{
char propName[1024];

propName[0] = (char)0;
FullClassNameCat(propName, prop->name, 0x1);
MangleClassName(propName);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereProp_%s_%s = _property = eClass_FindProperty(%s, \"%s\", module);\n", className, propName, classID, prop->name);
if(module->name && module->importType != 1)
{
if(prop->hasSet)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereProp_%s_Set_%s = _property.Set;\n", className, propName);
if(prop->hasGet)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereProp_%s_Get_%s = _property.Get;\n", className, propName);
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
}
}
}
if(module->functions.count)
{
for(function = module->functions.first; function; function = function->next)
{
struct __ecereNameSpace__ecere__com__GlobalFunction * func = __ecereNameSpace__ecere__com__eSystem_FindFunction(privateModule, function->name);

if(module->name && module->importType != 1 && (!func || !func->dataType || !func->dataType->dllExport))
{
char functionName[1024];

functionName[0] = (char)0;
FullClassNameCat(functionName, function->name, 0x0);
if(isDynamicLibrary && !isStaticLibrary)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   function = eSystem_FindFunction(__currentModule, \"%s\");\n", function->name);
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   function = eSystem_FindFunction(module, \"%s\");\n", function->name);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   if(function) __ecereFunction_%s = function.function;\n", functionName);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
}
}
for(defModule = modules.first; defModule; defModule = defModule->next)
if(defModule->globalInstance)
{
if(!strcmp(defModule->name, "i18n"))
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereCreateModuleInstances_i18n();\n");
}
if(i18n)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      LoadTranslatedStrings(module, \"%s\");\n", projectName);
if(isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   }\n");
}
if(!isDynamicLibrary && thisAppClass)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   _class = eSystem_FindClass(__currentModule, \"%s\");\n", thisAppClass->name);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   eInstance_Evolve((Instance *)&__currentModule, _class);\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __thisModule = __currentModule;\n");
}
if(isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   if(__currentModule == module)\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   {\n");
}
if(modules.count)
{
for(defModule = modules.first; defModule; defModule = defModule->next)
if(defModule->globalInstance)
{
char moduleName[1024];

if(!strcmp(defModule->name, "i18n"))
continue;
strcpy(moduleName, defModule->name);
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, ' ', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '-', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '.', '_');
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereCreateModuleInstances_%s();\n", moduleName);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
}
if(isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   }\n");
}
if(!isDynamicLibrary && thisAppClass)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __currentModule._vTbl[12](__currentModule);\n");
}
if(isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   return true;\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "}\n");
if(isStaticLibrary)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\nbool __ecereDll_Unload_%s(Module module)\n{\n", projectName);
}
else
{
if(targetPlatform == 1)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\ndllexport bool __stdcall __ecereDll_Unload(Module module)\n{\n");
else
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\ndllexport bool __ecereDll_Unload(Module module)\n{\n");
}
}
if(isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   if(__currentModule == module)\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   {\n");
}
{
unsigned int destroyI18n = 0x0;

if(modules.count)
{
for(defModule = modules.first; defModule; defModule = defModule->next)
if(defModule->globalInstance)
{
char moduleName[1024];

if(!strcmp(defModule->name, "i18n"))
{
destroyI18n = 0x1;
continue;
}
strcpy(moduleName, defModule->name);
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, ' ', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '-', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '.', '_');
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereDestroyModuleInstances_%s();\n", moduleName);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
}
if(i18n)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   UnloadTranslatedStrings(__currentModule);\n");
if(destroyI18n)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereDestroyModuleInstances_i18n();\n");
}
if(isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   }\n");
if(isDynamicLibrary)
{
}
if(modules.count)
{
for(defModule = modules.first; defModule; defModule = defModule->next)
{
char moduleName[1024];

strcpy(moduleName, defModule->name);
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, ' ', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '-', '_');
__ecereNameSpace__ecere__sys__ChangeCh(moduleName, '.', '_');
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereUnregisterModule_%s(module);\n", moduleName);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   if(__currentModule == module)\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "      __currentModule = (void *)0;\n");
if(!isStaticLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   if(__thisModule == module)\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "      __thisModule = (void *)0;\n");
}
}
if(!isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n   _class = eSystem_FindClass(__currentModule, \"ecere::com::Application\");\n   exitCode = ((ecere::com::Application)__currentModule).exitCode;\n   delete __currentModule;\n   return exitCode;\n");
}
else
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   return true;\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "}\n");
__ecereNameSpace__ecere__com__eInstance_Delete(f);
}
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BTNamedLink;

struct __ecereNameSpace__ecere__com__BTNamedLink
{
char *  name;
struct __ecereNameSpace__ecere__com__BTNamedLink * parent;
struct __ecereNameSpace__ecere__com__BTNamedLink * left;
struct __ecereNameSpace__ecere__com__BTNamedLink * right;
int depth;
void *  data;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(struct __ecereNameSpace__ecere__sys__BinaryTree * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first;

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(struct __ecereNameSpace__ecere__sys__BTNode * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__sys__BTNode_next;

static struct __ecereNameSpace__ecere__com__Class * FindAppClass(struct __ecereNameSpace__ecere__com__NameSpace * nameSpace, unsigned int thisModule)
{
struct __ecereNameSpace__ecere__com__BTNamedLink * link;
struct __ecereNameSpace__ecere__com__NameSpace * ns;

for(link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&(*nameSpace).classes); link; link = (struct __ecereNameSpace__ecere__com__BTNamedLink *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)link)))
{
struct __ecereNameSpace__ecere__com__Class * _class = link->data;

if(strcmp(_class->fullName, "ecere::com::Application") && (!thisModule || _class->module == privateModule))
{
struct __ecereNameSpace__ecere__com__Class * base;

for(base = _class->base; base && base->type != 1000; base = base->base)
if(!strcmp(base->fullName, "ecere::com::Application"))
return _class;
}
}
for(ns = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&(*nameSpace).nameSpaces); ns; ns = (struct __ecereNameSpace__ecere__com__NameSpace *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)ns)))
{
struct __ecereNameSpace__ecere__com__Class * _class = FindAppClass(ns, thisModule);

if(_class)
return _class;
}
return (((void *)0));
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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SubModule;

struct __ecereNameSpace__ecere__com__SubModule
{
struct __ecereNameSpace__ecere__com__SubModule * prev;
struct __ecereNameSpace__ecere__com__SubModule * next;
struct __ecereNameSpace__ecere__com__Instance * module;
int importMode;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * SearchAppClass_Module(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * appClass;
struct __ecereNameSpace__ecere__com__SubModule * subModule;

appClass = FindAppClass(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->publicNameSpace, 0x0);
if(appClass)
return appClass;
appClass = FindAppClass(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->privateNameSpace, 0x0);
if(appClass)
return appClass;
for(subModule = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->modules.first; subModule; subModule = subModule->next)
{
appClass = SearchAppClass_Module(subModule->module);
if(appClass)
return appClass;
}
return (((void *)0));
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

struct __ecereNameSpace__ecere__sys__TempFile
{
char __ecere_padding[24];
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldLink;

struct __ecereNameSpace__ecere__sys__OldLink
{
struct __ecereNameSpace__ecere__sys__OldLink * prev;
struct __ecereNameSpace__ecere__sys__OldLink * next;
void *  data;
} __attribute__ ((gcc_struct));

extern void DeclareClass(struct Symbol * classSym, char *  className);

extern struct Symbol * FindClass(char *  name);

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern void PrintType(struct Type * type, char *  string, unsigned int printName, unsigned int fullName);

extern struct Declarator * SpecDeclFromString(char *  string, struct __ecereNameSpace__ecere__sys__OldList *  specs, struct Declarator * baseDecl);

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

extern struct Identifier * MkIdentifier(char *  string);

extern struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator);

extern void OutputTypeName(struct TypeName * type, struct __ecereNameSpace__ecere__com__Instance * f);

extern char *  strcat(char * , const char * );

extern void DeclareMethod(struct __ecereNameSpace__ecere__com__Method * method, char *  name);

static void BindDCOMClient()
{
struct __ecereNameSpace__ecere__com__Class * dcomClientObjectClass = __ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "ecere::net::DCOMClientObject");
struct __ecereNameSpace__ecere__sys__OldLink * deriv;

if(dcomClientObjectClass && dcomClientObjectClass->derivatives.first)
{
struct __ecereNameSpace__ecere__com__Instance * f;

if(!dcomSymbols)
dcomSymbols = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);
f = dcomSymbols;
for(deriv = dcomClientObjectClass->derivatives.first; deriv; deriv = deriv->next)
{
struct __ecereNameSpace__ecere__com__Class * _class = deriv->data;
struct __ecereNameSpace__ecere__com__Method * method, * next;
int id = 0;
int vid;
unsigned int doVirtual;

DeclareClass(FindClass("ecere::net::DCOMClientObject"), "__ecereClass___ecereNameSpace__ecere__net__DCOMClientObject");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "class %s : ecere::net::DCOMClientObject\n", _class->fullName);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "{\n");
if(_class->vTblSize > _class->base->vTblSize)
{
int vid;

__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   virtual void CallVirtualMethod(uint __ecereMethodID, SerialBuffer __ecereBuffer)\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   {\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      switch(__ecereMethodID)\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      {\n");
for(vid = _class->base->vTblSize; vid < _class->vTblSize; vid++)
{
struct __ecereNameSpace__ecere__com__Method * method;

for(method = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->methods); method; method = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)method)))
{
if(method->type == 1 && method->_class == _class && method->vid == vid)
break;
}
if(method)
{
struct Type * param;

method->dataType = ProcessTypeString(method->dataTypeString, 0x0);
if(method->dataType && method->dataType->name)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         case %d:\n", vid - _class->base->vTblSize);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         {\n");
{
if(method->dataType->returnType->kind != 0)
{
struct TypeName * resultType;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;
char type[1024] = "";
char className[1024];
struct Symbol * classSym;

if(method->dataType->returnType->kind == 8)
classSym = method->dataType->returnType->_class;
else
{
PrintType(method->dataType->returnType, type, 0x0, 0x1);
classSym = FindClass(type);
type[0] = (char)0;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 0x1);
MangleClassName(className);
DeclareClass(classSym, className);
PrintType(method->dataType->returnType, type, 0x1, 0x1);
decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier("__ecereResult")));
resultType = MkTypeName(specs, decl);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            ");
OutputTypeName(resultType, f);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ";\n");
}
for(param = method->dataType->params.first; param; param = param->next)
{
if(param->kind == 8 && !strcmp(param->_class->string, "String"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            char %s[1024];\n", param->name);
DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
DeclareClass(FindClass("String"), "__ecereClass_String");
}
else
{
struct TypeName * paramTypeName;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;
char type[1024] = "";
char className[1024];
struct Symbol * classSym;

if(param->kind == 8)
classSym = param->_class;
else
{
PrintType(param, type, 0x0, 0x1);
classSym = FindClass(type);
type[0] = (char)0;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 0x1);
MangleClassName(className);
DeclareClass(classSym, className);
PrintType(param, type, 0x1, 0x1);
decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier(param->name)));
paramTypeName = MkTypeName(specs, decl);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            ");
OutputTypeName(paramTypeName, f);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ";\n");
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
for(param = method->dataType->params.first; param; param = param->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            __ecereBuffer.Unserialize(");
if(param->kind == 8 && !strcmp(param->_class->string, "String"))
{
DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "(StaticString)");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, param->name);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ");\n");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            ");
if(method->dataType->returnType->kind != 0)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "__ecereResult = ");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "%s(", method->name);
for(param = method->dataType->params.first; param; param = param->next)
{
if(param->prev)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ", ");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "%s", param->name);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ");\n");
for(param = method->dataType->params.first; param; param = param->next)
{
if(param->kind == 8 && ((param->_class && param->_class->registered && param->_class->registered->type == 1) || !strcmp(param->_class->string, "String")) && !param->constant)
{
if(!strcmp(param->_class->string, "String"))
{
DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            __ecereBuffer.Serialize((StaticString)%s);\n", param->name);
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            __ecereBuffer.Serialize(%s);\n", param->name);
}
}
if(method->dataType->returnType->kind != 0)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            __ecereBuffer.Serialize(__ecereResult);\n");
}
for(param = method->dataType->params.first; param; param = param->next)
{
if(param->kind == 8 && strcmp(param->_class->string, "String") && param->_class->registered && (param->_class->registered->type == 0 || param->_class->registered->type == 5))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            delete %s;\n", param->name);
}
}
if(method->dataType->returnType->kind == 8 && strcmp(method->dataType->returnType->_class->string, "String") && method->dataType->returnType->_class->registered && (method->dataType->returnType->_class->registered->type == 0 || method->dataType->returnType->_class->registered->type == 5))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            delete __ecereResult;\n");
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            break;\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         }\n");
}
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      }\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   }\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
}
doVirtual = 0x1;
id = 0;
vid = _class->base->vTblSize;
next = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->methods);
while(next && ((next->type == 1) != doVirtual || (doVirtual && next->vid != vid)))
{
id++;
next = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)next));
if(!next && doVirtual)
{
if(vid == _class->vTblSize)
doVirtual = 0x0;
else
vid++;
id = 0;
next = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->methods);
}
}
for(method = next; method; method = next)
{
struct Type * param;

if(!method->dataType)
method->dataType = ProcessTypeString(method->dataTypeString, 0x0);
if(method->dataType->name)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   ");
if(doVirtual)
{
char name[1024];

strcpy(name, "__ecereVMethodID_");
FullClassNameCat(name, method->_class->fullName, 0x1);
strcat(name, "_");
strcat(name, method->name);
DeclareMethod(method, name);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "virtual ");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "%s\n", method->dataTypeString);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   {\n");
if(method->dataType)
{
if(method->dataType->returnType->kind != 0)
{
struct TypeName * resultType;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;
char type[1024] = "";
char className[1024];
struct Symbol * classSym;

if(method->dataType->returnType->kind == 8)
classSym = method->dataType->returnType->_class;
else
{
PrintType(method->dataType->returnType, type, 0x0, 0x1);
classSym = FindClass(type);
type[0] = (char)0;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 0x1);
MangleClassName(className);
DeclareClass(classSym, className);
PrintType(method->dataType->returnType, type, 0x1, 0x1);
decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier("__ecereResult")));
resultType = MkTypeName(specs, decl);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      ");
OutputTypeName(resultType, f);
if(method->dataType->returnType->kind == 9)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, " = { 0 }");
else if(method->dataType->returnType->kind == 8 && method->dataType->returnType->_class->registered && method->dataType->returnType->_class->registered->type == 1)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, " { }");
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, " = 0");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ";\n\n");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      incref this;\n");
for(param = method->dataType->params.first; param; param = param->next)
{
char type[1024] = "";
char className[1024];
struct Symbol * classSym;

if(param->kind == 8)
classSym = param->_class;
else
{
PrintType(param, type, 0x0, 0x1);
classSym = FindClass(type);
type[0] = (char)0;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 0x1);
MangleClassName(className);
DeclareClass(classSym, className);
if(param->kind == 8 && !strcmp(param->_class->string, "String"))
{
DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      __ecereBuffer.Serialize((StaticString)%s);\n", param->name);
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      __ecereBuffer.Serialize(%s);\n", param->name);
}
DeclareMethod(__ecereNameSpace__ecere__com__eClass_FindMethod(__ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "ecere::net::DCOMClientObject"), "CallMethod", privateModule), "__ecereMethod___ecereNameSpace__ecere__net__DCOMClientObject_CallMethod");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      if(DCOMClientObject::CallMethod(%d))\n", id++);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      {\n");
for(param = method->dataType->params.first; param; param = param->next)
{
if(param->kind == 8 && ((param->_class && param->_class->registered && param->_class->registered->type == 1) || !strcmp(param->_class->string, "String")) && !param->constant)
{
if(!strcmp(param->_class->string, "String"))
{
DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         __ecereBuffer.Unserialize((StaticString)%s);\n", param->name);
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         __ecereBuffer.Unserialize(%s);\n", param->name);
}
}
if(method->dataType->returnType->kind != 0)
{
if(method->dataType->returnType->kind == 8 && !strcmp(method->dataType->returnType->_class->string, "String"))
{
DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         __ecereBuffer.Unserialize((StaticString)__ecereResult);\n");
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         __ecereBuffer.Unserialize(__ecereResult);\n");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      }\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      __ecereBuffer.Free();\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      delete this;\n");
if(method->dataType->returnType->kind != 0)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      return __ecereResult;\n");
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   }\n");
}
next = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)method));
while(next && ((next->type == 1) != doVirtual || (doVirtual && next->vid != vid)))
{
id++;
next = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)next));
if(!next && doVirtual)
{
if(vid == _class->vTblSize)
doVirtual = 0x0;
else
vid++;
id = 0;
next = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->methods);
}
}
if(next)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "}\n");
if(deriv->next)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
}
}
}

static void BindDCOMServer()
{
unsigned int mutexDeclared = 0x0;
struct __ecereNameSpace__ecere__com__Class * _class;

for(_class = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)privateModule + 12)))->classes.first; _class; _class = _class->next)
{
if(_class->isRemote == (unsigned int)3)
break;
}
if(_class)
{
struct __ecereNameSpace__ecere__com__Instance * f;

if(!dcomSymbols)
dcomSymbols = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);
f = dcomSymbols;
DeclareClass(FindClass("ecere::net::DCOMServerObject"), "__ecereClass___ecereNameSpace__ecere__net__DCOMServerObject");
for(_class = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)privateModule + 12)))->classes.first; _class; _class = _class->next)
{
if(_class->isRemote == (unsigned int)3)
{
struct __ecereNameSpace__ecere__com__Method * method;
int id = 0;
int vid;

__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "class DCOM%s : ecere::net::DCOMServerObject\n", _class->fullName);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "{\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   virtual void CallMethod(uint __ecereMethodID, SerialBuffer __ecereBuffer)\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   {\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      %s inst = (%s)instance;\n", _class->fullName, _class->fullName);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      incref inst;\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      switch(__ecereMethodID)\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      {\n");
for(method = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->methods); method; method = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)method)))
{
struct Type * param;

method->dataType = ProcessTypeString(method->dataTypeString, 0x0);
if(method->dataType && method->dataType->name)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         case %d:\n", id++);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         {\n");
{
if(method->dataType->returnType->kind != 0)
{
struct TypeName * resultType;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;
char type[1024] = "";
char className[1024];
struct Symbol * classSym;

if(method->dataType->returnType->kind == 8)
classSym = method->dataType->returnType->_class;
else
{
PrintType(method->dataType->returnType, type, 0x0, 0x1);
classSym = FindClass(type);
type[0] = (char)0;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 0x1);
MangleClassName(className);
DeclareClass(classSym, className);
PrintType(method->dataType->returnType, type, 0x1, 0x1);
decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier("__ecereResult")));
resultType = MkTypeName(specs, decl);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            ");
OutputTypeName(resultType, f);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ";\n");
}
for(param = method->dataType->params.first; param; param = param->next)
{
if(param->kind == 8 && !strcmp(param->_class->string, "String"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            char %s[1024];\n", param->name);
DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
DeclareClass(FindClass("String"), "__ecereClass_String");
}
else
{
struct TypeName * paramTypeName;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;
char type[1024] = "";
char className[1024];
struct Symbol * classSym;

if(param->kind == 8)
classSym = param->_class;
else
{
PrintType(param, type, 0x0, 0x1);
classSym = FindClass(type);
type[0] = (char)0;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 0x1);
MangleClassName(className);
DeclareClass(classSym, className);
PrintType(param, type, 0x1, 0x1);
decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier(param->name)));
paramTypeName = MkTypeName(specs, decl);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            ");
OutputTypeName(paramTypeName, f);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ";\n");
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
for(param = method->dataType->params.first; param; param = param->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            __ecereBuffer.Unserialize(");
if(param->kind == 8 && !strcmp(param->_class->string, "String"))
{
DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "(StaticString)");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, param->name);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ");\n");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            ");
if(method->dataType->returnType->kind != 0)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "__ecereResult = ");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "((%s)instance).%s(", _class->fullName, method->name);
for(param = method->dataType->params.first; param; param = param->next)
{
if(param->prev)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ", ");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "%s", param->name);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ");\n");
for(param = method->dataType->params.first; param; param = param->next)
{
if(param->kind == 8 && ((param->_class && param->_class->registered && param->_class->registered->type == 1) || !strcmp(param->_class->string, "String")) && !param->constant)
{
if(!strcmp(param->_class->string, "String"))
{
DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            __ecereBuffer.Serialize((StaticString)%s);\n", param->name);
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            __ecereBuffer.Serialize(%s);\n", param->name);
}
}
if(method->dataType->returnType->kind != 0)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            __ecereBuffer.Serialize(__ecereResult);\n");
}
for(param = method->dataType->params.first; param; param = param->next)
{
if(param->kind == 8 && strcmp(param->_class->string, "String") && param->_class->registered && (param->_class->registered->type == 0 || param->_class->registered->type == 5))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            delete %s;\n", param->name);
}
}
if(method->dataType->returnType->kind == 8 && strcmp(method->dataType->returnType->_class->string, "String") && method->dataType->returnType->_class->registered && (method->dataType->returnType->_class->registered->type == 0 || method->dataType->returnType->_class->registered->type == 5))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            delete __ecereResult;\n");
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            break;\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         }\n");
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      }\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      delete inst;\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   }\n");
for(vid = _class->base->vTblSize; vid < _class->vTblSize; vid++)
{
struct __ecereNameSpace__ecere__com__Method * method;
struct Type * param;

for(method = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(&_class->methods); method; method = (struct __ecereNameSpace__ecere__com__Method *)__ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(((struct __ecereNameSpace__ecere__sys__BTNode *)method)))
if(method->type == 1 && method->_class == _class && method->vid == vid)
break;
if(method)
{
if(!mutexDeclared)
{
DeclareClass(FindClass("ecere::sys::Mutex"), "__ecereClass___ecereNameSpace__ecere__sys__Mutex");
DeclareMethod(__ecereNameSpace__ecere__com__eClass_FindMethod(__ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "ecere::sys::Mutex"), "Wait", privateModule), "__ecereMethod___ecereNameSpace__ecere__sys__Mutex_Wait");
DeclareMethod(__ecereNameSpace__ecere__com__eClass_FindMethod(__ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "ecere::sys::Mutex"), "Release", privateModule), "__ecereMethod___ecereNameSpace__ecere__sys__Mutex_Release");
mutexDeclared = 0x1;
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
if(!method->dataType)
method->dataType = ProcessTypeString(method->dataTypeString, 0x0);
if(method->dataType->name)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   virtual %s\n", method->dataTypeString);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   {\n");
if(method->dataType)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      DCOM%s __ecereObject = (void *)_vTbl[-1];\n", _class->fullName);
if(method->dataType->returnType->kind != 0)
{
struct TypeName * resultType;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;
char type[1024] = "";
char className[1024];
struct Symbol * classSym;

if(method->dataType->returnType->kind == 8)
classSym = method->dataType->returnType->_class;
else
{
PrintType(method->dataType->returnType, type, 0x0, 0x1);
classSym = FindClass(type);
type[0] = (char)0;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 0x1);
MangleClassName(className);
DeclareClass(classSym, className);
PrintType(method->dataType->returnType, type, 0x1, 0x1);
decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier("__ecereResult")));
resultType = MkTypeName(specs, decl);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      ");
OutputTypeName(resultType, f);
if(method->dataType->returnType->kind == 9)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, " = { 0 }");
else if(method->dataType->returnType->kind == 8 && method->dataType->returnType->_class->registered && method->dataType->returnType->_class->registered->type == 1)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, " { }");
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, " = 0");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ";\n\n");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      incref __ecereObject;\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      __ecereMethod___ecereNameSpace__ecere__sys__Mutex_Wait(__ecereObject.mutex);\n");
for(param = method->dataType->params.first; param; param = param->next)
{
char type[1024] = "";
char className[1024];
struct Symbol * classSym;

if(param->kind == 8)
classSym = param->_class;
else
{
PrintType(param, type, 0x0, 0x1);
classSym = FindClass(type);
type[0] = (char)0;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 0x1);
MangleClassName(className);
DeclareClass(classSym, className);
if(param->kind == 8 && !strcmp(param->_class->string, "String"))
{
DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      __ecereObject.argsBuffer.Serialize((StaticString)%s);\n", param->name);
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      __ecereObject.argsBuffer.Serialize(%s);\n", param->name);
}
DeclareMethod(__ecereNameSpace__ecere__com__eClass_FindMethod(__ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "ecere::net::DCOMServerObject"), "CallVirtualMethod", privateModule), "__ecereMethod___ecereNameSpace__ecere__net__DCOMServerObject_CallVirtualMethod");
{
unsigned int hasReturnValue = method->dataType->returnType->kind != 0;

if(!hasReturnValue)
{
for(param = method->dataType->params.first; param; param = param->next)
{
if(param->kind == 8 && ((param->_class && param->_class->registered && param->_class->registered->type == 1) || !strcmp(param->_class->string, "String")) && !param->constant)
{
hasReturnValue = 0x1;
break;
}
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      if(__ecereObject.CallVirtualMethod(%d, %s))\n", vid - _class->base->vTblSize, hasReturnValue ? "true" : "false");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      {\n");
for(param = method->dataType->params.first; param; param = param->next)
{
if(param->kind == 8 && ((param->_class && param->_class->registered && param->_class->registered->type == 1) || !strcmp(param->_class->string, "String")) && !param->constant)
{
if(!strcmp(param->_class->string, "String"))
{
DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         __ecereObject.returnBuffer.Unserialize((StaticString)%s);\n", param->name);
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         __ecereObject.returnBuffer.Unserialize(%s);\n", param->name);
}
}
if(method->dataType->returnType->kind != 0)
{
if(method->dataType->returnType->kind == 8 && !strcmp(method->dataType->returnType->_class->string, "String"))
{
DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         __ecereObject.returnBuffer.Unserialize((StaticString)__ecereResult);\n");
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         __ecereObject.returnBuffer.Unserialize(__ecereResult);\n");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      }\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      else\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         ((%s)this).%s::%s(", _class->fullName, _class->fullName, method->name);
for(param = method->dataType->params.first; param; param = param->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "%s", param->name);
if(param->next)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ", ");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ");\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      __ecereObject.returnBuffer.Free();\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      __ecereMethod___ecereNameSpace__ecere__sys__Mutex_Release(__ecereObject.mutex);\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      delete __ecereObject;\n");
if(method->dataType->returnType->kind != 0)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      return __ecereResult;\n");
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   }\n");
}
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "}\n");
}
}
}
}

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_SymbolgenApp;

extern int __ecereNameSpace__ecere__com__GetRuntimePlatform(void);

extern void SetSymbolsDir(char *  s);

extern int printf(char * , ...);

extern char *  __ecereNameSpace__ecere__GetTranslatedString(struct __ecereNameSpace__ecere__com__Instance * module, char *  string, char *  stringAndContext);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern char *  __ecereNameSpace__ecere__sys__GetExtension(char *  string, char *  output);

extern void SetDefines(struct __ecereNameSpace__ecere__sys__OldList *  list);

extern void SetImports(struct __ecereNameSpace__ecere__sys__OldList *  list);

extern void SetGlobalData(struct __ecereNameSpace__ecere__com__NameSpace *  nameSpace);

extern void SetExcludedSymbols(struct __ecereNameSpace__ecere__sys__OldList *  list);

extern void SetGlobalContext(struct Context * context);

extern void SetTopContext(struct Context * context);

extern void SetCurrentContext(struct Context * context);

extern void SetTargetPlatform(int platform);

extern void SetTargetBits(int bits);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com____ecere_COM_Initialize(unsigned int guiApp, int argc, char *  argv[]);

extern void SetPrivateModule(struct __ecereNameSpace__ecere__com__Instance * module);

extern char *  GetSymbolsDir(void);

extern char *  __ecereNameSpace__ecere__sys__SearchString(char *  buffer, int start, char *  subStr, unsigned int matchCase, unsigned int matchWord);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IteratorPointer;

struct __ecereNameSpace__ecere__com__IteratorPointer;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__MapIterator;

struct __ecereNameSpace__ecere__com__MapIterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} __attribute__ ((gcc_struct));

extern int strcasecmp(const char * , const char * );

extern unsigned int LoadSymbols(char *  fileName, int importType, unsigned int loadDllOnly);

extern void CheckDataRedefinitions(void);

extern char *  __ecereNameSpace__ecere__sys__ChangeExtension(char *  string, char *  ext, char *  output);

extern char *  strstr(char * , const char * );

extern int strlen(const char * );

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ContextStringPair;

struct ContextStringPair
{
char * string;
char * context;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Iterator;

struct __ecereNameSpace__ecere__com__Iterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} __attribute__ ((gcc_struct));

extern void ComputeModuleClasses(struct __ecereNameSpace__ecere__com__Instance * module);

extern unsigned int __ecereNameSpace__ecere__sys__MakeDir(char *  path);

extern char *  __ecereNameSpace__ecere__sys__PathCat(char *  string, char *  addedPath);

extern void FreeContext(struct Context * context);

extern void FreeExcludedSymbols(struct __ecereNameSpace__ecere__sys__OldList * excludedSymbols);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Definition;

struct Definition;

extern void FreeModuleDefine(struct Definition * def);

extern void FreeModuleImport(struct ModuleImport * imp);

extern void FreeTypeData(struct __ecereNameSpace__ecere__com__Instance * privateModule);

extern void FreeIncludeFiles(void);

extern void FreeGlobalData(struct __ecereNameSpace__ecere__com__NameSpace * globalDataList);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map_TPL_ContextStringPair__ecere__com__List_TPL_String___;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List_TPL_String_;

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

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_map(struct __ecereNameSpace__ecere__com__MapIterator * this);

void __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(struct __ecereNameSpace__ecere__com__MapIterator * this, struct __ecereNameSpace__ecere__com__Instance * value);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__com__MapIterator_map;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(struct __ecereNameSpace__ecere__com__Iterator * this, uint64 index, unsigned int create);

uint64 __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(struct __ecereNameSpace__ecere__com__Iterator * this);

void __ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(struct __ecereNameSpace__ecere__com__Iterator * this, uint64 value);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__com__Iterator_data;

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Next();

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Free;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__CustomAVLTree;

struct __ecereNameSpace__ecere__com__CustomAVLTree
{
struct __ecereNameSpace__ecere__com__AVLNode * root;
int count;
} __attribute__ ((gcc_struct));

uint64 __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_key(struct __ecereNameSpace__ecere__com__MapIterator * this);

extern struct __ecereNameSpace__ecere__com__Property ** __ecereProp___ecereNameSpace__ecere__com__MapIterator_key;

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(struct __ecereNameSpace__ecere__sys__OldList * this, void (*  freeFn)(void * ));

void __ecereMethod_SymbolgenApp_Main(struct __ecereNameSpace__ecere__com__Instance * this)
{
void * __ecereTemp1;
int c;
unsigned int valid = 0x1;
char * output = (((void *)0));

targetPlatform = __ecereNameSpace__ecere__com__GetRuntimePlatform();
targetBits = GetHostBits();
for(c = 1; c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc; c++)
{
char * arg = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c];

if(arg[0] == '-')
{
if(!strcmp(arg + 1, "m32") || !strcmp(arg + 1, "m64"))
{
targetBits = !strcmp(arg + 1, "m32") ? 32 : 64;
}
else if(!strcmp(arg + 1, "o"))
{
if(!output && c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc)
{
output = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c + 1];
c++;
}
else
valid = 0x0;
}
else if(!strcmp(arg, "-name"))
{
if(c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc)
{
strcpy(projectName, ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c + 1]);
c++;
}
else
valid = 0x0;
}
else if(!strcmp(arg, "-t"))
{
if(++c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc)
targetPlatform = __ecereProp___ecereNameSpace__ecere__com__Platform_Set_char__PTR_(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c]);
else
valid = 0x0;
}
else if(!strcmp(arg, "-console"))
isConsole = 0x1;
else if(!strcmp(arg, "-dynamiclib"))
isDynamicLibrary = 0x1;
else if(!strcmp(arg, "-staticlib"))
{
isDynamicLibrary = 0x1;
isStaticLibrary = 0x1;
}
else if(!strcmp(arg, "-symbols"))
{
if(c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc)
{
SetSymbolsDir(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c + 1]);
c++;
}
else
valid = 0x0;
}
}
}
if(!output)
valid = 0x0;
if(!valid)
printf(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Syntax:\n   ecs [-t <target platform>] <input>[, <input>]* -o <output>\n", (((void *)0))));
else
{
int c;
char ext[17];
char symbolModule[274];

__ecereNameSpace__ecere__sys__GetExtension(output, ext);
__ecereNameSpace__ecere__sys__GetLastDirectory(output, symbolModule);
SetDefines(&_defines);
SetImports(&_imports);
SetGlobalData(&globalData);
SetExcludedSymbols(&_excludedSymbols);
SetGlobalContext(theGlobalContext);
SetTopContext(theGlobalContext);
SetCurrentContext(theGlobalContext);
SetTargetPlatform(targetPlatform);
SetTargetBits(targetBits);
privateModule = (struct __ecereNameSpace__ecere__com__Instance *)__ecereNameSpace__ecere__com____ecere_COM_Initialize(0x1 | ((targetBits == 64) ? (unsigned int)2 : (unsigned int)0), 1, (((void *)0)));
SetPrivateModule(privateModule);
mainModule = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ModuleImport);
SetMainModule(mainModule);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_imports, mainModule);
{
char * symbolsDir = GetSymbolsDir();
unsigned int outputPot = symbolsDir && __ecereNameSpace__ecere__sys__SearchString(symbolsDir, 0, "release.", 0x0, 0x0);
struct __ecereNameSpace__ecere__com__Instance * intlStrings = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__Map_TPL_ContextStringPair__ecere__com__List_TPL_String___);
struct __ecereNameSpace__ecere__com__MapIterator it = (it.container = (void *)0, it.pointer = (void *)0, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(&it, intlStrings), it);

for(c = 1; c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc; c++)
{
char * file = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c];

if(file[0] == '-')
{
if(!strcmp(file, "-c"))
c++;
}
else
{
char ext[17];

__ecereNameSpace__ecere__sys__GetExtension(file, ext);
if(!strcmp(ext, "imp"))
LoadImports(file);
}
}
for(c = 1; c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc; c++)
{
char * file = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c];

if(file[0] == '-')
{
if(!strcmp(file, "-c"))
c++;
}
}
for(c = 1; c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc; c++)
{
char * file = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c];

if(file[0] == '-')
{
if(!strcmp(file, "-c"))
c++;
}
else
{
char ext[17];
char moduleName[797];

__ecereNameSpace__ecere__sys__GetExtension(file, ext);
__ecereNameSpace__ecere__sys__GetLastDirectory(file, moduleName);
__ecereNameSpace__ecere__sys__StripExtension(moduleName);
strcat(moduleName, ".ec");
if(((__ecereNameSpace__ecere__com__GetRuntimePlatform() == 1) ? (strcasecmp) : strcmp)(moduleName, symbolModule) && (!strcmp(ext, "sym") || !strcmp(ext, "ec")))
{
struct ImportedModule * importedModule;
struct ModuleInfo * module = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ModuleInfo);
char fileName[274];

__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&modules, module);
__ecereNameSpace__ecere__sys__GetLastDirectory(file, fileName);
module->name = __ecereNameSpace__ecere__sys__CopyString(fileName);
__ecereNameSpace__ecere__sys__StripExtension(module->name);
for(importedModule = _defines.first; importedModule; importedModule = importedModule->next)
{
if(importedModule->type == 0 && !(strcasecmp)(importedModule->name, module->name) && !(importedModule->importType == 2))
break;
}
if(importedModule)
module->globalInstance = importedModule->globalInstance;
else
{
importedModule = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ImportedModule), ((struct ImportedModule *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(module->name), ((struct ImportedModule *)__ecereTemp1)->type = 0, ((struct ImportedModule *)__ecereTemp1)->importType = 0, ((struct ImportedModule *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(&_defines, importedModule);
module->globalInstance = LoadSymbols(file, 0, 0x0);
CheckDataRedefinitions();
}
{
struct __ecereNameSpace__ecere__com__Instance * f;

__ecereNameSpace__ecere__sys__ChangeExtension(file, "bowl", fileName);
f = __ecereNameSpace__ecere__sys__FileOpen(fileName, 1);
if(f)
{
static char line[65536];
struct __ecereNameSpace__ecere__com__Instance * comments = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__List_TPL_String_);
char * msgid = (((void *)0)), * msgstr = (((void *)0)), * msgctxt = (((void *)0));

while(!((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))f->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof])(f))
{
if(__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof line))
{
int len;

__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(line[0] == '#')
{
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))comments->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(comments, (uint64)(__ecereNameSpace__ecere__sys__CopyString(line)));
}
else if(strstr(line, "msgid \"") == line)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(msgid), msgid = 0);
msgid = __ecereNameSpace__ecere__sys__CopyString(line + 7);
len = strlen(msgid);
if(len)
msgid[len - 1] = (unsigned char)0;
}
else if(strstr(line, "msgctxt \"") == line)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(msgctxt), msgctxt = 0);
msgctxt = __ecereNameSpace__ecere__sys__CopyString(line + 9);
len = strlen(msgctxt);
if(len)
msgctxt[len - 1] = (unsigned char)0;
}
else if(strstr(line, "msgstr \"") == line)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(msgstr), msgstr = 0);
msgstr = __ecereNameSpace__ecere__sys__CopyString(line + 8);
len = strlen(msgstr);
if(len)
msgstr[len - 1] = (unsigned char)0;
}
if(msgid && msgstr)
{
struct ContextStringPair pair = 
{
msgid, msgctxt
};

i18n = 0x1;
if(!__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(&it, (&pair), 0x0))
{
msgid = (((void *)0));
msgctxt = (((void *)0));
__extension__ ({
struct __ecereNameSpace__ecere__com__Iterator __internalIterator = 
{
intlStrings, 0
};

__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(&__internalIterator, (((&pair))), 0x1);
__ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(&__internalIterator, comments);
});
comments = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__List_TPL_String_);
}
else
{
{
struct __ecereNameSpace__ecere__com__Iterator s = 
{
(comments), 0
};

while(__ecereMethod___ecereNameSpace__ecere__com__Iterator_Next(&s))
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))((struct __ecereNameSpace__ecere__com__Instance *)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&it))->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(((struct __ecereNameSpace__ecere__com__Instance *)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&it)), __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&s));
}
((void (*)(struct __ecereNameSpace__ecere__com__Instance *))comments->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll])(comments);
}
(__ecereNameSpace__ecere__com__eSystem_Delete(msgid), msgid = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(msgctxt), msgctxt = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(msgstr), msgstr = 0);
}
}
}
((void (*)(struct __ecereNameSpace__ecere__com__Instance *))comments->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Free])(comments);
(__ecereNameSpace__ecere__com__eInstance_DecRef(comments), comments = 0);
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}
}
}
}
}
ComputeModuleClasses(privateModule);
if(!isDynamicLibrary)
{
thisAppClass = SearchAppClass_Module(privateModule);
}
WriteMain(output);
if(outputPot && ((struct __ecereNameSpace__ecere__com__CustomAVLTree *)(((char *)intlStrings + 12)))->count)
{
struct __ecereNameSpace__ecere__com__Instance * potFile;
char potFileName[797];

strcpy(potFileName, "locale");
__ecereNameSpace__ecere__sys__MakeDir(potFileName);
__ecereNameSpace__ecere__sys__PathCat(potFileName, projectName);
__ecereNameSpace__ecere__sys__ChangeExtension(potFileName, "pot", potFileName);
potFile = __ecereNameSpace__ecere__sys__FileOpen(potFileName, 2);
if(potFile)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "msgid \"\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "msgstr \"\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"Project-Id-Version: \\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"POT-Creation-Date: \\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"PO-Revision-Date: \\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"Last-Translator: \\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"Language-Team: \\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"MIME-Version: 1.0\\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"Content-Type: text/plain; charset=iso-8859-1\\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"Content-Transfer-Encoding: 8bit\\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"X-Poedit-Basepath: ../\\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\n");
{
struct __ecereNameSpace__ecere__com__MapIterator i = (i.container = (void *)0, i.pointer = (void *)0, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(&i, (intlStrings)), i);

while(__ecereMethod___ecereNameSpace__ecere__com__Iterator_Next(&i))
{
struct ContextStringPair pair = (*(struct ContextStringPair *)__ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_key(&i));
struct __ecereNameSpace__ecere__com__Instance * comments = ((struct __ecereNameSpace__ecere__com__Instance *)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&i));

{
struct __ecereNameSpace__ecere__com__Iterator s = 
{
(comments), 0
};

while(__ecereMethod___ecereNameSpace__ecere__com__Iterator_Next(&s))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(potFile, __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&s));
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\n");
}
}
if(pair.context)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "msgctxt \"");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, pair.context);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"\n");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "msgid \"");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, pair.string);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "msgstr \"");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, pair.string);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))potFile->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\n");
}
}
((void (*)(struct __ecereNameSpace__ecere__com__Instance *))intlStrings->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Free])(intlStrings);
(__ecereNameSpace__ecere__com__eInstance_DecRef(intlStrings), intlStrings = 0);
(__ecereNameSpace__ecere__com__eInstance_DecRef(potFile), potFile = 0);
}
}
}
FreeContext(theGlobalContext);
FreeExcludedSymbols(&_excludedSymbols);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&_defines, FreeModuleDefine);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&_imports, FreeModuleImport);
FreeTypeData(privateModule);
FreeIncludeFiles();
FreeGlobalData(&globalData);
(__ecereNameSpace__ecere__com__eInstance_DecRef(privateModule), privateModule = 0);
}
SetSymbolsDir((((void *)0)));
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, char *  name, char *  baseName, int size, int sizeClass, unsigned int (* )(void * ), void (* )(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

void __ecereRegisterModule_ecs(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ModuleInfo", 0, sizeof(struct ModuleInfo), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass_ModuleInfo = class;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "SymbolgenApp", "ecere::com::Application", 0, 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass_SymbolgenApp = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Main", 0, __ecereMethod_SymbolgenApp_Main, 1);
}

void __ecereUnregisterModule_ecs(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, char *  a, char *  b);

void __ecereCreateModuleInstances_ecs()
{
(globalData.classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, globalData.defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, globalData.functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, globalData.nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString);
theGlobalContext = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context);
}

void __ecereDestroyModuleInstances_ecs()
{
((theGlobalContext ? (__ecereClass_Context->Destructor ? __ecereClass_Context->Destructor(theGlobalContext) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(theGlobalContext)) : 0), theGlobalContext = 0);
}

