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

typedef __builtin_va_list __gnuc_va_list;

typedef __gnuc_va_list va_list;

static struct Context * globalContext;

static struct __ecereNameSpace__ecere__com__Instance * privateModule;

static struct ModuleImport * mainModule;

struct __ecereNameSpace__ecere__sys__OldList _excludedSymbols = 
{
0, 0, 0, (unsigned int)&((struct Symbol *)(void *)0)->left, 0
};

static struct __ecereNameSpace__ecere__sys__OldList defines, imports;

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

static struct __ecereNameSpace__ecere__sys__OldList _precompDefines;

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpen(char *  fileName, int mode);

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionImport;

struct FunctionImport
{
struct FunctionImport * prev;
struct FunctionImport * next;
char *  name;
} __attribute__ ((gcc_struct));

int __ecereMethod___ecereNameSpace__ecere__sys__File_Printf(struct __ecereNameSpace__ecere__com__Instance * this, char *  format, ...);

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

static void OutputImports(char * fileName)
{
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__sys__FileOpen(fileName, 2);

if(f)
{
if(imports.first)
{
struct ModuleImport * module;

__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "[Imported Modules]\n");
for(module = imports.first; module; module = module->next)
{
struct ClassImport * _class;
struct FunctionImport * function;

if(module->name)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   %s\n", module->name);
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   [This]\n");
if(module->importType == 1)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Static]\n");
else if(module->importType == 2)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Remote]\n");
if(module->importAccess == 2)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Private]\n");
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Public]\n");
if(module->classes.first)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Imported Classes]\n");
for(_class = module->classes.first; _class; _class = _class->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         %s\n", _class->name);
if(_class->itself)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Instantiated]\n");
}
if(_class->isRemote)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Remote]\n");
}
if(_class->methods.first)
{
struct MethodImport * method;

__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Imported Methods]\n");
for(method = _class->methods.first; method; method = method->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               %s\n", method->name);
if(method->isVirtual)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "                  [Virtual]\n");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               .\n");
}
if(_class->properties.first)
{
struct PropertyImport * prop;

__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            [Imported Properties]\n");
for(prop = _class->properties.first; prop; prop = prop->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               %s\n", prop->name);
if(prop->isVirtual)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "                  [Virtual]\n");
if(prop->hasSet)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "                  [Set]\n");
if(prop->hasGet)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "                  [Get]\n");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "               .\n");
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "        .\n");
}
if(module->functions.first)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      [Imported Functions]\n");
for(function = module->functions.first; function; function = function->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         %s\n", function->name);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "        .\n");
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   .\n");
}
}
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_CompilerApp;

extern int __ecereNameSpace__ecere__com__GetRuntimePlatform(void);

extern void SetSymbolsDir(char *  s);

extern int strcmp(const char * , const char * );

extern int strlen(const char * );

extern char *  strcpy(char * , const char * );

extern void SetBuildingEcereCom(unsigned int b);

extern void SetBuildingEcereComModule(unsigned int b);

extern char *  __ecereNameSpace__ecere__sys__CopyString(char *  string);

extern char *  GetOutputFile(void);

extern void SetOutputFile(char *  s);

extern char *  GetSourceFile(void);

extern void SetSourceFile(char *  s);

extern void SetMemoryGuard(unsigned int b);

extern void SetDefaultNameSpace(char *  s);

extern void SetStrictNameSpaces(unsigned int b);

extern void SetOutputLineNumbers(unsigned int value);

extern char *  __ecereNameSpace__ecere__sys__PathCat(char *  string, char *  addedPath);

extern char *  __ecereNameSpace__ecere__sys__ChangeExtension(char *  string, char *  ext, char *  output);

extern int printf(char * , ...);

extern char *  __ecereNameSpace__ecere__GetTranslatedString(struct __ecereNameSpace__ecere__com__Instance * module, char *  string, char *  stringAndContext);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern void SetGlobalData(struct __ecereNameSpace__ecere__com__NameSpace *  nameSpace);

extern void SetExcludedSymbols(struct __ecereNameSpace__ecere__sys__OldList *  list);

extern void SetGlobalContext(struct Context * context);

extern void SetCurrentContext(struct Context * context);

extern void SetTopContext(struct Context * context);

extern void SetDefines(struct __ecereNameSpace__ecere__sys__OldList *  list);

extern void SetImports(struct __ecereNameSpace__ecere__sys__OldList *  list);

extern void SetInCompiler(unsigned int b);

extern void SetTargetPlatform(int platform);

extern void SetEchoOn(unsigned int b);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com____ecere_COM_Initialize(unsigned int guiApp, int argc, char *  argv[]);

extern void SetPrivateModule(struct __ecereNameSpace__ecere__com__Instance * module);

extern struct Type * ProcessTypeString(char *  string, unsigned int staticMethod);

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
char __ecere_padding[20];
} __attribute__ ((gcc_struct));

extern int snprintf(char * , int, char * , ...);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__DualPipeOpen(unsigned int mode, char *  commandLine);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

struct __ecereNameSpace__ecere__sys__TempFile
{
char __ecere_padding[24];
} __attribute__ ((gcc_struct));

extern void SetFileInput(struct __ecereNameSpace__ecere__com__Instance * file);

extern void SetMainModule(struct ModuleImport * moduleImport);

extern char *  __ecereNameSpace__ecere__sys__GetLastDirectory(char *  string, char *  output);

extern unsigned int __ecereNameSpace__ecere__sys__StripExtension(char *  string);

extern void resetScanner(void);

extern char *  GetSymbolsDir(void);

extern unsigned int LoadSymbols(char *  fileName, int importType, unsigned int loadDllOnly);

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

extern int strcasecmp(const char * , const char * );

extern unsigned int GetEcereImported(void);

extern unsigned int GetBuildingEcereCom(void);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__eModule_LoadStrict(struct __ecereNameSpace__ecere__com__Instance * fromModule, char *  name, int importAccess);

extern void ParseEc(void);

extern void CheckDataRedefinitions(void);

extern void SetYydebug(unsigned int b);

extern void SetCurrentNameSpace(char *  s);

extern void SetDeclMode(int accessMode);

extern struct __ecereNameSpace__ecere__sys__OldList *  GetAST(void);

extern void ProcessDBTableDefinitions(void);

extern void PrePreProcessClassDefinitions(void);

extern void ComputeModuleClasses(struct __ecereNameSpace__ecere__com__Instance * module);

extern void PreProcessClassDefinitions(void);

extern void ProcessClassDefinitions(void);

extern void ComputeDataTypes(void);

extern void ProcessInstantiations(void);

extern void ProcessMemberAccess(void);

extern void ProcessInstanceDeclarations(void);

extern void OutputTree(struct __ecereNameSpace__ecere__sys__OldList * ast, struct __ecereNameSpace__ecere__com__Instance * f);

extern void FreeASTTree(struct __ecereNameSpace__ecere__sys__OldList * ast);

extern void FreeContext(struct Context * context);

extern void FreeExcludedSymbols(struct __ecereNameSpace__ecere__sys__OldList * excludedSymbols);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Definition;

struct Definition;

extern void FreeModuleDefine(struct Definition * def);

extern void FreeModuleImport(struct ModuleImport * imp);

extern void FreeTypeData(struct __ecereNameSpace__ecere__com__Instance * privateModule);

extern void FreeIncludeFiles(void);

extern void FreeGlobalData(struct __ecereNameSpace__ecere__com__NameSpace * globalDataList);

extern void OutputIntlStrings(void);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

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

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetExitCode();

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(struct __ecereNameSpace__ecere__sys__OldList * this, void (*  freeFn)(void * ));

void __ecereMethod_CompilerApp_Main(struct __ecereNameSpace__ecere__com__Instance * this)
{
void * __ecereTemp1;
char * cppCommand = (((void *)0));
char * cppOptions = (((void *)0));
int cppOptionsLen = 0;
int c;
unsigned int valid = 0x1;
char defaultOutputFile[797];
int targetPlatform = __ecereNameSpace__ecere__com__GetRuntimePlatform();

SetSymbolsDir("");
for(c = 1; c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argc; c++)
{
char * arg = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->argv[c];

if(arg[0] == '-')
{
if(!strcmp(arg + 1, "m32"))
{
int argLen = strlen(arg);
int newLen = cppOptionsLen + 1 + argLen;

cppOptions = __ecereNameSpace__ecere__com__eSystem_Renew(cppOptions, sizeof(char) * (newLen + 1));
cppOptions[cppOptionsLen] = ' ';
strcpy(cppOptions + cppOptionsLen + 1, arg);
cppOptionsLen = newLen;
}
else if(arg[1] == 'D')
{
int argLen = strlen(arg);
int newLen = cppOptionsLen + 1 + argLen;

cppOptions = __ecereNameSpace__ecere__com__eSystem_Renew(cppOptions, sizeof(char) * (newLen + 1));
cppOptions[cppOptionsLen] = ' ';
strcpy(cppOptions + cppOptionsLen + 1, arg);
cppOptionsLen = newLen;
if(!strcmp(arg, "-DBUILDING_ECERE_COM"))
SetBuildingEcereCom(0x1);
else if(!strcmp(arg, "-DECERE_COM_MODULE"))
SetBuildingEcereComModule(0x1);
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
else if(!strcmp(arg + 1, "memguard"))
{
SetMemoryGuard(0x1);
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
else if(!strcmp(arg + 1, "nolinenumbers"))
{
SetOutputLineNumbers(0x0);
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
strcpy(defaultOutputFile, "");
__ecereNameSpace__ecere__sys__PathCat(defaultOutputFile, GetSourceFile());
__ecereNameSpace__ecere__sys__ChangeExtension(defaultOutputFile, "c", defaultOutputFile);
SetOutputFile(defaultOutputFile);
}
}
if(!valid)
printf(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Syntax:\n   ecc [-t <target platform>] [-cpp <c preprocessor>] [-o <output>] [-symbols <outputdir>] [-I<includedir>]* [-isystem <sysincludedir>]* [-D<definition>]* -c <input>\n", (((void *)0))));
else
{
struct __ecereNameSpace__ecere__com__Instance * cppOutput;
char command[3075LL];

SetGlobalData(&globalData);
SetExcludedSymbols(&_excludedSymbols);
SetGlobalContext(globalContext);
SetCurrentContext(globalContext);
SetTopContext(globalContext);
SetDefines(&defines);
SetImports(&imports);
SetInCompiler(0x1);
SetTargetPlatform(targetPlatform);
SetEchoOn(0x0);
privateModule = (struct __ecereNameSpace__ecere__com__Instance *)__ecereNameSpace__ecere__com____ecere_COM_Initialize(0x1, 1, (((void *)0)));
SetPrivateModule(privateModule);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString("uint"), ((struct Symbol *)__ecereTemp1)->type = ProcessTypeString("unsigned int", 0x0), ((struct Symbol *)__ecereTemp1)));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString("uint64"), ((struct Symbol *)__ecereTemp1)->type = ProcessTypeString("unsigned int64", 0x0), ((struct Symbol *)__ecereTemp1)));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString("uint32"), ((struct Symbol *)__ecereTemp1)->type = ProcessTypeString("unsigned int", 0x0), ((struct Symbol *)__ecereTemp1)));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString("uint16"), ((struct Symbol *)__ecereTemp1)->type = ProcessTypeString("unsigned short", 0x0), ((struct Symbol *)__ecereTemp1)));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)(__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol), ((struct Symbol *)__ecereTemp1)->string = __ecereNameSpace__ecere__sys__CopyString("byte"), ((struct Symbol *)__ecereTemp1)->type = ProcessTypeString("unsigned char", 0x0), ((struct Symbol *)__ecereTemp1)));
{
struct GlobalData * data = (data = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_GlobalData), data->fullName = __ecereNameSpace__ecere__sys__CopyString("__thisModule"), data->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("Module"), data->module = privateModule, data);

data->key = (unsigned int)data->fullName;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalData.functions, (struct __ecereNameSpace__ecere__sys__BTNode *)data);
}
snprintf(command, sizeof command, "%s%s -x c -E \"%s\"", cppCommand, cppOptions ? cppOptions : "", GetSourceFile());
command[sizeof command - 1] = (char)0;
if((cppOutput = __ecereNameSpace__ecere__sys__DualPipeOpen((((unsigned int)(0x1))), command)))
{
char impFile[797];
struct ImportedModule * module;
char mainModuleName[274];
int exitCode;
struct __ecereNameSpace__ecere__sys__OldList * ast;
struct __ecereNameSpace__ecere__com__Instance * fileInput = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);

SetFileInput(fileInput);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&imports, (mainModule = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ModuleImport)));
SetMainModule(mainModule);
__ecereNameSpace__ecere__sys__GetLastDirectory(GetSourceFile(), mainModuleName);
__ecereNameSpace__ecere__sys__StripExtension(mainModuleName);
module = (__ecereTemp1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ImportedModule), ((struct ImportedModule *)__ecereTemp1)->name = __ecereNameSpace__ecere__sys__CopyString(mainModuleName), ((struct ImportedModule *)__ecereTemp1)->type = 0, ((struct ImportedModule *)__ecereTemp1));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(&defines, module);
resetScanner();
while(!((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))cppOutput->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof])(cppOutput))
{
char junk[4096];
int count = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))cppOutput->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read])(cppOutput, junk, 1, 4096);

((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))fileInput->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])(fileInput, junk, 1, count);
}
exitCode = __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetExitCode(cppOutput);
(__ecereNameSpace__ecere__com__eInstance_DecRef(cppOutput), cppOutput = 0);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))fileInput->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(fileInput, 0, 0);
{
char symFile[274];
char symLocation[797];
struct ImportedModule * module, * next;

__ecereNameSpace__ecere__sys__GetLastDirectory(GetSourceFile(), symFile);
__ecereNameSpace__ecere__sys__ChangeExtension(symFile, "sym", symFile);
strcpy(symLocation, GetSymbolsDir());
__ecereNameSpace__ecere__sys__PathCat(symLocation, symFile);
LoadSymbols(symLocation, 3, 0x0);
for(module = defines.first; module; module = next)
{
next = module->next;
if(module->type == 0 && (strcasecmp)(module->name, mainModuleName))
{
(__ecereNameSpace__ecere__com__eSystem_Delete(module->name), module->name = 0);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(&defines, module);
}
}
if(!GetEcereImported() && !GetBuildingEcereCom())
__ecereNameSpace__ecere__com__eModule_LoadStrict(privateModule, "ecereCOM", 1);
}
ParseEc();
CheckDataRedefinitions();
SetYydebug(0x0);
SetCurrentNameSpace((((void *)0)));
SetDefaultNameSpace((((void *)0)));
SetDeclMode(2);
(__ecereNameSpace__ecere__com__eInstance_DecRef(fileInput), fileInput = 0);
SetFileInput((((void *)0)));
ast = GetAST();
if(!exitCode)
{
ProcessDBTableDefinitions();
PrePreProcessClassDefinitions();
ComputeModuleClasses(privateModule);
PreProcessClassDefinitions();
ComputeModuleClasses(privateModule);
ProcessClassDefinitions();
ComputeDataTypes();
ProcessInstantiations();
ProcessMemberAccess();
ProcessInstanceDeclarations();
strcpy(impFile, GetSymbolsDir());
{
char fileName[274];

__ecereNameSpace__ecere__sys__GetLastDirectory(GetSourceFile(), fileName);
__ecereNameSpace__ecere__sys__PathCat(impFile, fileName);
__ecereNameSpace__ecere__sys__ChangeExtension(impFile, "imp", impFile);
}
if(imports.first)
OutputImports(impFile);
if(!((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + 300)))->exitCode)
{
struct __ecereNameSpace__ecere__com__Instance * output = __ecereNameSpace__ecere__sys__FileOpen(GetOutputFile(), 2);

if(output)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#if defined(__GNUC__)\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "typedef long long int64;\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "typedef unsigned long long uint64;\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#elif defined(__TINYC__)\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#include <stdarg.h>\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define __builtin_va_list va_list\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define __builtin_va_start va_start\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define __builtin_va_end va_end\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#ifdef _WIN32\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define strcasecmp stricmp\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define strncasecmp strnicmp\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define __declspec(x) __attribute__((x))\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#endif\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "typedef long long int64;\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "typedef unsigned long long uint64;\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#else\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "typedef __int64 int64;\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "typedef unsigned __int64 uint64;\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#endif\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#ifdef __BIG_ENDIAN__\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define __ENDIAN_PAD(x) (8 - (x))\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#else\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define __ENDIAN_PAD(x) 0\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#endif\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#include <stdint.h>\n");
if(ast)
OutputTree(ast, output);
(__ecereNameSpace__ecere__com__eInstance_DecRef(output), output = 0);
}
}
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
FreeTypeData(privateModule);
FreeIncludeFiles();
FreeGlobalData(&globalData);
(__ecereNameSpace__ecere__com__eInstance_DecRef(privateModule), privateModule = 0);
}
(__ecereNameSpace__ecere__com__eSystem_Delete(cppCommand), cppCommand = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(cppOptions), cppOptions = 0);
SetSymbolsDir((((void *)0)));
OutputIntlStrings();
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, char *  name, char *  baseName, int size, int sizeClass, unsigned int (* )(void * ), void (* )(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

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

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, void *  function, int declMode);

void __ecereRegisterModule_ecc(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "CompilerApp", "ecere::com::Application", 0, 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass_CompilerApp = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Main", 0, __ecereMethod_CompilerApp_Main, 1);
}

void __ecereUnregisterModule_ecc(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, char *  a, char *  b);

void __ecereCreateModuleInstances_ecc()
{
globalContext = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context);
(globalData.classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, globalData.defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, globalData.functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, globalData.nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString);
}

void __ecereDestroyModuleInstances_ecc()
{
((globalContext ? (__ecereClass_Context->Destructor ? __ecereClass_Context->Destructor(globalContext) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(globalContext)) : 0), globalContext = 0);
}

