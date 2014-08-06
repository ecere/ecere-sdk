/* Code generated from eC source file: ecc.ec */
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
static struct Context * globalContext;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Platform_char__PTR_;

struct __ecereNameSpace__ecere__sys__OldList
{
void *  first;
void *  last;
int count;
unsigned int offset;
unsigned int circ;
} ecere_gcc_struct;

struct Type;

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

struct External;

struct CodePosition
{
int line;
int charPos;
int pos;
int included;
} ecere_gcc_struct;

struct Expression;

extern int GetHostBits(void);

extern void SetSymbolsDir(const char *  s);

extern int strcmp(const char * , const char * );

extern size_t strlen(const char * );

extern char *  strcpy(char * , const char * );

extern char *  PassArg(char *  output, const char *  input);

extern void SetBuildingEcereCom(unsigned int b);

extern void SetBuildingEcereComModule(unsigned int b);

extern char *  __ecereNameSpace__ecere__sys__CopyString(const char *  string);

extern const char *  GetOutputFile(void);

extern void SetOutputFile(const char *  s);

extern const char *  GetSourceFile(void);

extern void SetSourceFile(const char *  s);

extern void SetI18nModuleName(const char *  s);

extern void SetMemoryGuard(unsigned int b);

extern void SetDefaultNameSpace(const char *  s);

extern void SetStrictNameSpaces(unsigned int b);

extern void SetOutputLineNumbers(unsigned int value);

extern char *  __ecereNameSpace__ecere__sys__PathCat(char *  string, const char *  addedPath);

extern char *  __ecereNameSpace__ecere__sys__ChangeExtension(const char *  string, const char *  ext, char *  output);

extern int printf(const char * , ...);

extern const char *  __ecereNameSpace__ecere__GetTranslatedString(const char * name, const char *  string, const char *  stringAndContext);

extern void SetInCompiler(unsigned int b);

extern void SetTargetPlatform(int platform);

extern void SetTargetBits(int bits);

extern void SetEchoOn(unsigned int b);

struct ClassDefinition;

extern int snprintf(char * , size_t, const char * , ...);

extern char *  __ecereNameSpace__ecere__sys__GetLastDirectory(const char *  string, char *  output);

extern unsigned int __ecereNameSpace__ecere__sys__StripExtension(char *  string);

extern void resetScanner(void);

extern const char *  GetSymbolsDir(void);

extern unsigned int LoadSymbols(const char *  fileName, int importType, unsigned int loadDllOnly);

extern int strcasecmp(const char * , const char * );

extern unsigned int GetEcereImported(void);

extern unsigned int GetBuildingEcereCom(void);

extern void ParseEc(void);

extern void CheckDataRedefinitions(void);

extern void SetYydebug(unsigned int b);

extern void SetCurrentNameSpace(const char *  s);

extern void SetDeclMode(int accessMode);

extern void ProcessDBTableDefinitions(void);

extern void PrePreProcessClassDefinitions(void);

extern void PreProcessClassDefinitions(void);

extern void ProcessClassDefinitions(void);

extern void ComputeDataTypes(void);

extern void ProcessInstantiations(void);

extern void ProcessMemberAccess(void);

extern void ProcessInstanceDeclarations(void);

struct Definition;

extern void FreeIncludeFiles(void);

extern void OutputIntlStrings(void);

const char *  __ecereProp___ecereNameSpace__ecere__com__Platform_Get_char__PTR_(int this);

int __ecereProp___ecereNameSpace__ecere__com__Platform_Set_char__PTR_(const char *  value);

static struct __ecereNameSpace__ecere__sys__OldList defines, imports;

extern void SetExcludedSymbols(struct __ecereNameSpace__ecere__sys__OldList *  list);

extern void SetDefines(struct __ecereNameSpace__ecere__sys__OldList *  list);

extern void SetImports(struct __ecereNameSpace__ecere__sys__OldList *  list);

extern struct __ecereNameSpace__ecere__sys__OldList *  GetAST(void);

extern void FreeASTTree(struct __ecereNameSpace__ecere__sys__OldList * ast);

extern void FreeExcludedSymbols(struct __ecereNameSpace__ecere__sys__OldList * excludedSymbols);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Delete(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(struct __ecereNameSpace__ecere__sys__OldList * this, void (*  freeFn)(void * ));

extern struct Type * ProcessTypeString(const char *  string, unsigned int staticMethod);

struct Location
{
struct CodePosition start;
struct CodePosition end;
} ecere_gcc_struct;

extern void FreeModuleDefine(struct Definition * def);

struct ModuleImport;

static struct ModuleImport * mainModule;

struct ModuleImport
{
struct ModuleImport * prev;
struct ModuleImport * next;
char *  name;
struct __ecereNameSpace__ecere__sys__OldList classes;
struct __ecereNameSpace__ecere__sys__OldList functions;
int importType;
int importAccess;
} ecere_gcc_struct;

extern void SetMainModule(struct ModuleImport * moduleImport);

extern void FreeModuleImport(struct ModuleImport * imp);

struct __ecereNameSpace__ecere__sys__BTNode;

struct __ecereNameSpace__ecere__sys__BTNode
{
uintptr_t key;
struct __ecereNameSpace__ecere__sys__BTNode * parent;
struct __ecereNameSpace__ecere__sys__BTNode * left;
struct __ecereNameSpace__ecere__sys__BTNode * right;
int depth;
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

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpen(const char *  fileName, int mode);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__DualPipeOpen(unsigned int mode, const char *  commandLine);

extern void SetFileInput(struct __ecereNameSpace__ecere__com__Instance * file);

extern void OutputTree(struct __ecereNameSpace__ecere__sys__OldList * ast, struct __ecereNameSpace__ecere__com__Instance * f);

int __ecereMethod___ecereNameSpace__ecere__sys__File_Printf(struct __ecereNameSpace__ecere__com__Instance * this, const char *  format, ...);

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

int __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetExitCode();

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

struct __ecereNameSpace__ecere__com__Property;

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

extern void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

extern void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object);

extern void __ecereNameSpace__ecere__com__eInstance_Watch(void *  instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

struct FunctionImport;

struct FunctionImport
{
struct FunctionImport * prev;
struct FunctionImport * next;
char *  name;
} ecere_gcc_struct;

struct MethodImport;

struct MethodImport
{
struct MethodImport * prev;
struct MethodImport * next;
char *  name;
unsigned int isVirtual;
} ecere_gcc_struct;

struct PropertyImport;

struct PropertyImport
{
struct PropertyImport * prev;
struct PropertyImport * next;
char *  name;
unsigned int isVirtual;
unsigned int hasSet;
unsigned int hasGet;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__NameSpace;

extern void SetGlobalData(struct __ecereNameSpace__ecere__com__NameSpace *  nameSpace);

struct Context;

extern void SetGlobalContext(struct Context * context);

extern void SetCurrentContext(struct Context * context);

extern void SetTopContext(struct Context * context);

extern void FreeContext(struct Context * context);

struct ImportedModule;

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
} ecere_gcc_struct;

struct ClassImport;

struct ClassImport
{
struct ClassImport * prev;
struct ClassImport * next;
char *  name;
struct __ecereNameSpace__ecere__sys__OldList methods;
struct __ecereNameSpace__ecere__sys__OldList properties;
unsigned int itself;
int isRemote;
} ecere_gcc_struct;

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

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} ecere_gcc_struct;

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
} ecere_gcc_struct;

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(struct __ecereNameSpace__ecere__sys__BinaryTree * this, struct __ecereNameSpace__ecere__sys__BTNode * node);

int __ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString(struct __ecereNameSpace__ecere__sys__BinaryTree * this, const char *  a, const char *  b);

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

static struct __ecereNameSpace__ecere__com__NameSpace globalData;

extern void FreeGlobalData(struct __ecereNameSpace__ecere__com__NameSpace * globalDataList);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com____ecere_COM_Initialize(unsigned int guiApp, int argc, char *  argv[]);

struct __ecereNameSpace__ecere__com__Method;

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

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, void *  function, int declMode);

struct __ecereNameSpace__ecere__com__Module;

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

static struct __ecereNameSpace__ecere__com__Instance * privateModule;

extern void SetPrivateModule(struct __ecereNameSpace__ecere__com__Instance * module);

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
char __ecere_padding[36];
} ecere_gcc_struct;

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__eModule_LoadStrict(struct __ecereNameSpace__ecere__com__Instance * fromModule, const char *  name, int importAccess);

extern void ComputeModuleClasses(struct __ecereNameSpace__ecere__com__Instance * module);

extern void FreeTypeData(struct __ecereNameSpace__ecere__com__Instance * privateModule);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, const char *  name, const char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

void __ecereUnregisterModule_ecc(struct __ecereNameSpace__ecere__com__Instance * module)
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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_CompilerApp;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Symbol;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_GlobalData;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ModuleImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ImportedModule;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Context;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Application;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__DualPipe;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Module;

void __ecereCreateModuleInstances_ecc()
{
globalContext = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context);
(globalData.classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, globalData.defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, globalData.functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, globalData.nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString);
}

void __ecereDestroyModuleInstances_ecc()
{
((globalContext ? __extension__ ({
void * __ecerePtrToDelete = (globalContext);

__ecereClass_Context->Destructor ? __ecereClass_Context->Destructor((void *)__ecerePtrToDelete) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(__ecerePtrToDelete);
}) : 0), globalContext = 0);
}

struct Symbol;

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

struct __ecereNameSpace__ecere__sys__OldList _excludedSymbols =
{
0, 0, 0, (unsigned int)(uintptr_t)&((struct Symbol *)(void * )0)->left, 0
};

void __ecereMethod_CompilerApp_Main(struct __ecereNameSpace__ecere__com__Instance * this)
{
char * cppCommand = (((void *)0));
char * cppOptions = (((void *)0));
int cppOptionsLen = 0;
int c;
unsigned int valid = 1;
char defaultOutputFile[797];
unsigned int buildingBootStrap = 0;
int targetPlatform = __runtimePlatform;
int targetBits = GetHostBits();

SetSymbolsDir("");
for(c = 1; c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc; c++)
{
const char * arg = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[c];

if(arg[0] == '-')
{
if(!strcmp(arg + 1, "m32") || !strcmp(arg + 1, "m64"))
{
int newLen = cppOptionsLen + 1 + strlen(arg);

cppOptions = __ecereNameSpace__ecere__com__eSystem_Renew(cppOptions, sizeof(char) * (newLen + 1));
cppOptions[cppOptionsLen] = ' ';
strcpy(cppOptions + cppOptionsLen + 1, arg);
cppOptionsLen = newLen;
targetBits = !strcmp(arg + 1, "m32") ? 32 : 64;
}
else if(!strcmp(arg + 1, "t32") || !strcmp(arg + 1, "t64"))
{
targetBits = !strcmp(arg + 1, "t32") ? 32 : 64;
}
else if(arg[1] == 'D' || arg[1] == 'I')
{
char * buf;
int size = cppOptionsLen + 1 + strlen(arg) * 2 + 1;

cppOptions = __ecereNameSpace__ecere__com__eSystem_Renew(cppOptions, sizeof(char) * (size));
buf = cppOptions + cppOptionsLen;
*buf++ = ' ';
PassArg(buf, arg);
cppOptionsLen = cppOptionsLen + 1 + strlen(buf);
if(arg[1] == 'D')
{
if(!strcmp(arg, "-DBUILDING_ECERE_COM"))
SetBuildingEcereCom(1);
else if(!strcmp(arg, "-DECERE_COM_MODULE"))
SetBuildingEcereComModule(1);
else if(!strcmp(arg, "-DECERE_BOOTSTRAP"))
buildingBootStrap = 1;
}
}
else if(!strcmp(arg + 1, "t"))
{
if(++c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc)
targetPlatform = __ecereProp___ecereNameSpace__ecere__com__Platform_Set_char__PTR_(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[c]);
else
valid = 0;
}
else if(!strcmp(arg + 1, "cpp"))
{
if(++c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc)
cppCommand = __ecereNameSpace__ecere__sys__CopyString(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[c]);
else
valid = 0;
}
else if(!strcmp(arg + 1, "o"))
{
if(!GetOutputFile() && c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc)
{
SetOutputFile(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[c + 1]);
c++;
}
else
valid = 0;
}
else if(!strcmp(arg + 1, "c"))
{
if(!GetSourceFile() && c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc)
{
SetSourceFile(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[c + 1]);
c++;
}
else
valid = 0;
}
else if(!strcmp(arg + 1, "isystem") || !strcmp(arg + 1, "isysroot"))
{
if(c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc)
{
char * buf;
const char * arg1 = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[++c];
int size = cppOptionsLen + 1 + strlen(arg) * 2 + strlen(arg1) * 2 + 1;

cppOptions = __ecereNameSpace__ecere__com__eSystem_Renew(cppOptions, sizeof(char) * (size));
buf = cppOptions + cppOptionsLen;
*buf++ = ' ';
buf = PassArg(buf, arg);
*buf++ = ' ';
buf = PassArg(buf, arg1);
cppOptionsLen = buf - cppOptions;
}
else
valid = 0;
}
else if(!strcmp(arg + 1, "fno-diagnostics-show-caret"))
{
char * buf;
int size = cppOptionsLen + 1 + strlen(arg) * 2 + 1;

cppOptions = __ecereNameSpace__ecere__com__eSystem_Renew(cppOptions, sizeof(char) * (size));
buf = cppOptions + cppOptionsLen;
*buf++ = ' ';
PassArg(buf, arg);
cppOptionsLen = cppOptionsLen + 1 + strlen(buf);
}
else if(!strcmp(arg + 1, "symbols"))
{
if(c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc)
{
SetSymbolsDir(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[c + 1]);
c++;
}
else
valid = 0;
}
else if(!strcmp(arg + 1, "module"))
{
if(c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc)
{
SetI18nModuleName(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[c + 1]);
c++;
}
else
valid = 0;
}
else if(!strcmp(arg + 1, "memguard"))
{
SetMemoryGuard(1);
}
else if(!strcmp(arg + 1, "defaultns"))
{
if(c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc)
{
SetDefaultNameSpace(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[c + 1]);
c++;
}
else
valid = 0;
}
else if(!strcmp(arg + 1, "strictns"))
{
SetStrictNameSpaces(1);
}
else if(!strcmp(arg + 1, "nolinenumbers"))
{
SetOutputLineNumbers(0);
}
}
else
valid = 0;
}
if(valid)
{
if(!cppCommand)
cppCommand = __ecereNameSpace__ecere__sys__CopyString("gcc");
if(!GetSourceFile())
valid = 0;
else if(!GetOutputFile())
{
strcpy(defaultOutputFile, "");
__ecereNameSpace__ecere__sys__PathCat(defaultOutputFile, GetSourceFile());
__ecereNameSpace__ecere__sys__ChangeExtension(defaultOutputFile, "c", defaultOutputFile);
SetOutputFile(defaultOutputFile);
}
}
if(!valid)
{
printf("%s", __ecereNameSpace__ecere__GetTranslatedString("ecc", "Syntax:\n   ecc [-t <target platform>] [-cpp <c preprocessor>] [-o <output>] [-module <module>] [-symbols <outputdir>] [-I<includedir>]* [-isystem <sysincludedir>]* [-D<definition>]* -c <input>\n", (((void *)0))));
}
else
{
struct __ecereNameSpace__ecere__com__Instance * cppOutput;
char command[3075];

SetGlobalData(&globalData);
SetExcludedSymbols(&_excludedSymbols);
SetGlobalContext(globalContext);
SetCurrentContext(globalContext);
SetTopContext(globalContext);
SetDefines(&defines);
SetImports(&imports);
SetInCompiler(1);
SetTargetPlatform(targetPlatform);
SetTargetBits(targetBits);
SetEchoOn(0);
privateModule = (struct __ecereNameSpace__ecere__com__Instance *)__ecereNameSpace__ecere__com____ecere_COM_Initialize((unsigned int)(1 | (targetBits == sizeof(uintptr_t) * 8 ? (unsigned int)0 : targetBits == 64 ? 2 : targetBits == 32 ? 4 : (unsigned int)0) | 8), 1, (((void *)0)));
SetPrivateModule(privateModule);
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString("uint"), __ecereInstance1->type = ProcessTypeString("unsigned int", 0), __ecereInstance1;
}));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString("uint64"), __ecereInstance1->type = ProcessTypeString("unsigned int64", 0), __ecereInstance1;
}));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString("uint32"), __ecereInstance1->type = ProcessTypeString("unsigned int", 0), __ecereInstance1;
}));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString("uint16"), __ecereInstance1->type = ProcessTypeString("unsigned short", 0), __ecereInstance1;
}));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString("byte"), __ecereInstance1->type = ProcessTypeString("unsigned char", 0), __ecereInstance1;
}));
if(buildingBootStrap)
{
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString("intptr_t"), __ecereInstance1->type = ProcessTypeString("intptr", 0), __ecereInstance1;
}));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString("uintptr_t"), __ecereInstance1->type = ProcessTypeString("uintptr", 0), __ecereInstance1;
}));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString("ssize_t"), __ecereInstance1->type = ProcessTypeString("intsize", 0), __ecereInstance1;
}));
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalContext->types, (struct __ecereNameSpace__ecere__sys__BTNode *)__extension__ ({
struct Symbol * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Symbol);

__ecereInstance1->string = __ecereNameSpace__ecere__sys__CopyString("size_t"), __ecereInstance1->type = ProcessTypeString("uintsize", 0), __ecereInstance1;
}));
}
{
struct GlobalData * data = (data = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_GlobalData), data->fullName = __ecereNameSpace__ecere__sys__CopyString("__thisModule"), data->dataTypeString = __ecereNameSpace__ecere__sys__CopyString("Module"), data->module = privateModule, data);

data->key = (uintptr_t)data->fullName;
__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_Add(&globalData.functions, (struct __ecereNameSpace__ecere__sys__BTNode *)data);
}
snprintf(command, sizeof (command), "%s%s -x c -E %s\"%s\"", cppCommand, cppOptions ? cppOptions : "", buildingBootStrap ? "" : "-include stdint.h -include sys/types.h ", GetSourceFile());
command[sizeof (command) - 1] = 0;
if((cppOutput = __ecereNameSpace__ecere__sys__DualPipeOpen((((unsigned int)(1))), command)))
{
char impFile[797];
struct ImportedModule * module;
char sourceFileName[274];
char mainModuleName[274];
int exitCode;
struct __ecereNameSpace__ecere__sys__OldList * ast;
struct __ecereNameSpace__ecere__com__Instance * fileInput = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);

SetFileInput(fileInput);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&imports, (mainModule = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ModuleImport)));
SetMainModule(mainModule);
__ecereNameSpace__ecere__sys__GetLastDirectory(GetSourceFile(), sourceFileName);
strcpy(mainModuleName, sourceFileName);
__ecereNameSpace__ecere__sys__StripExtension(mainModuleName);
module = __extension__ ({
struct ImportedModule * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ImportedModule);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(mainModuleName), __ecereInstance1->type = 0, __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(&defines, module);
resetScanner();
while(!((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = cppOutput;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__DualPipe->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof])(cppOutput))
{
char junk[4096];
int count = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = cppOutput;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__DualPipe->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read])(cppOutput, junk, 1, 4096);

((int (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, unsigned int size, unsigned int count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = fileInput;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__TempFile->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])(fileInput, junk, 1, count);
}
exitCode = __ecereMethod___ecereNameSpace__ecere__sys__DualPipe_GetExitCode(cppOutput);
(__ecereNameSpace__ecere__com__eInstance_DecRef(cppOutput), cppOutput = 0);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = fileInput;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__TempFile->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(fileInput, 0, 0);
{
char symFile[274];
char symLocation[797];
struct ImportedModule * module, * next;

strcpy(symFile, sourceFileName);
__ecereNameSpace__ecere__sys__ChangeExtension(symFile, "sym", symFile);
strcpy(symLocation, GetSymbolsDir());
__ecereNameSpace__ecere__sys__PathCat(symLocation, symFile);
LoadSymbols(symLocation, 3, 0);
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
SetYydebug(0);
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
__ecereNameSpace__ecere__sys__PathCat(impFile, sourceFileName);
__ecereNameSpace__ecere__sys__ChangeExtension(impFile, "imp", impFile);
if(imports.first)
OutputImports(impFile);
if(!((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->exitCode)
{
struct __ecereNameSpace__ecere__com__Instance * output = __ecereNameSpace__ecere__sys__FileOpen(GetOutputFile(), 2);

if(output)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "/* Code generated from eC source file: %s */\n", sourceFileName);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#if defined(_WIN32)\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define __runtimePlatform 1\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#elif defined(__APPLE__)\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define __runtimePlatform 3\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#else\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define __runtimePlatform 2\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#endif\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#if defined(__GNUC__)\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "typedef long long int64;\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "typedef unsigned long long uint64;\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#ifndef _WIN32\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define __declspec(x)\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#endif\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#elif defined(__TINYC__)\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#include <stdarg.h>\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define __builtin_va_list va_list\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define __builtin_va_start va_start\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define __builtin_va_end va_end\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#ifdef _WIN32\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define strcasecmp stricmp\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define strncasecmp strnicmp\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define __declspec(x) __attribute__((x))\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#else\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#define __declspec(x)\n");
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
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#if defined(_WIN32)\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#   if defined(__GNUC__) || defined(__TINYC__)\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#      define ecere_stdcall __attribute__((__stdcall__))\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#      define ecere_gcc_struct __attribute__((gcc_struct))\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#   else\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#      define ecere_stdcall __stdcall\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#      define ecere_gcc_struct\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#   endif\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#else\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#   define ecere_stdcall\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#   define ecere_gcc_struct\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#endif\n");
if(buildingBootStrap)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#include <stdint.h>\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(output, "#include <sys/types.h>\n");
}
if(ast)
OutputTree(ast, output);
(__ecereNameSpace__ecere__com__eInstance_DecRef(output), output = 0);
}
}
}
else
((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->exitCode = exitCode;
if(ast)
{
FreeASTTree(ast);
}
}
FreeContext(globalContext);
FreeExcludedSymbols(&_excludedSymbols);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&defines, (void *)(FreeModuleDefine));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&imports, (void *)(FreeModuleImport));
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

void __ecereRegisterModule_ecc(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "CompilerApp", "ecere::com::Application", 0, 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_CompilerApp = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Main", 0, __ecereMethod_CompilerApp_Main, 1);
}

