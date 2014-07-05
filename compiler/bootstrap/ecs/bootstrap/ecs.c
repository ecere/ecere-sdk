/* Code generated from eC source file: ecs.ec */
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

static unsigned int i18n;

static unsigned int outputPot;

static unsigned int disabledPooling;

static int targetPlatform;

static int targetBits;

static unsigned int isConsole;

static unsigned int isDynamicLibrary;

static unsigned int isStaticLibrary;

static struct Context * theGlobalContext;

static char mainModuleName[797];

static char projectName[797];

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_next;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Platform_char__PTR_;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_map;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Iterator_data;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_key;

struct __ecereNameSpace__ecere__sys__OldList
{
void *  first;
void *  last;
int count;
unsigned int offset;
unsigned int circ;
} __attribute__ ((gcc_struct));

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

struct __ecereNameSpace__ecere__com__SerialBuffer
{
unsigned char *  _buffer;
unsigned int count;
unsigned int _size;
unsigned int pos;
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct));

struct Context;

struct Expression;

extern char *  __ecereNameSpace__ecere__sys__TrimLSpaces(const char *  string, char *  output);

extern int strcmp(const char * , const char * );

extern char *  __ecereNameSpace__ecere__sys__CopyString(const char *  string);

extern char *  __ecereNameSpace__ecere__sys__GetLastDirectory(const char *  string, char *  output);

extern unsigned int __ecereNameSpace__ecere__sys__StripExtension(char *  string);

extern char *  strcpy(char * , const char * );

extern void FixModuleName(char *  moduleName);

extern void FullClassNameCat(char *  output, const char *  className, unsigned int includeTemplateParams);

struct TemplateParameter;

extern int sprintf(char * , const char * , ...);

struct TypeName;

struct Declarator;

struct Identifier;

extern char *  strcat(char * , const char * );

extern int GetHostBits(void);

extern void SetSymbolsDir(const char *  s);

extern int printf(const char * , ...);

extern const char *  __ecereNameSpace__ecere__GetTranslatedString(const char * name, const char *  string, const char *  stringAndContext);

extern char *  __ecereNameSpace__ecere__sys__GetExtension(const char *  string, char *  output);

extern void SetTargetPlatform(int platform);

extern void SetTargetBits(int bits);

extern void SetInSymbolGen(unsigned int b);

struct __ecereNameSpace__ecere__com__IteratorPointer;

extern int __ecereNameSpace__ecere__sys__Tokenize(char *  string, int maxTokens, char *  tokens[], unsigned int esc);

extern int strcasecmp(const char * , const char * );

extern unsigned int LoadSymbols(const char *  fileName, int importType, unsigned int loadDllOnly);

extern void CheckDataRedefinitions(void);

extern char *  __ecereNameSpace__ecere__sys__ChangeExtension(const char *  string, const char *  ext, char *  output);

extern char *  strstr(const char * , const char * );

extern size_t strlen(const char * );

struct ContextStringPair
{
char * string;
char * context;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__com__CustomAVLTree
{
struct __ecereNameSpace__ecere__com__AVLNode * root;
int count;
} __attribute__ ((gcc_struct));

extern char *  __ecereNameSpace__ecere__sys__PathCat(char *  string, const char *  addedPath);

struct Definition;

extern void FreeIncludeFiles(void);

const char *  __ecereProp___ecereNameSpace__ecere__com__Platform_Get_char__PTR_(int this);

int __ecereProp___ecereNameSpace__ecere__com__Platform_Set_char__PTR_(const char *  value);

static struct __ecereNameSpace__ecere__sys__OldList modules;

struct __ecereNameSpace__ecere__sys__OldList _defines =
{
0, 0, 0, 0, 0
};

struct __ecereNameSpace__ecere__sys__OldList _imports =
{
0, 0, 0, 0, 0
};

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern void SetDefines(struct __ecereNameSpace__ecere__sys__OldList *  list);

extern void SetImports(struct __ecereNameSpace__ecere__sys__OldList *  list);

extern void SetExcludedSymbols(struct __ecereNameSpace__ecere__sys__OldList *  list);

extern void FreeExcludedSymbols(struct __ecereNameSpace__ecere__sys__OldList * excludedSymbols);

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void *  __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(struct __ecereNameSpace__ecere__sys__OldList * this, const char *  name, unsigned int warn);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(struct __ecereNameSpace__ecere__sys__OldList * this, void (*  freeFn)(void * ));

struct Location
{
struct CodePosition start;
struct CodePosition end;
} __attribute__ ((gcc_struct));

extern void FinishTemplatesContext(struct Context * context);

extern void SetGlobalContext(struct Context * context);

extern void SetTopContext(struct Context * context);

extern void SetCurrentContext(struct Context * context);

extern void FreeContext(struct Context * context);

extern struct Declarator * SpecDeclFromString(const char *  string, struct __ecereNameSpace__ecere__sys__OldList *  specs, struct Declarator * baseDecl);

extern struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator);

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

extern struct Identifier * MkIdentifier(const char *  string);

extern void FreeModuleDefine(struct Definition * def);

struct ModuleImport;

static struct ModuleImport * mainModule;

extern struct ModuleImport * GetMainModule(void);

extern void SetMainModule(struct ModuleImport * moduleImport);

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

extern void FreeModuleImport(struct ModuleImport * imp);

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} __attribute__ ((gcc_struct));

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

static struct __ecereNameSpace__ecere__com__Class * thisAppClass;

extern struct Context * SetupTemplatesContext(struct __ecereNameSpace__ecere__com__Class * _class);

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

static struct __ecereNameSpace__ecere__com__Instance * dcomSymbols;

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__sys__FileOpen(const char *  fileName, int mode);

extern void __ecereNameSpace__ecere__com__eInstance_Delete(struct __ecereNameSpace__ecere__com__Instance * instance);

extern void OutputTypeName(struct TypeName * type, struct __ecereNameSpace__ecere__com__Instance * f, unsigned int typeName);

struct __ecereNameSpace__ecere__com__MapIterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__com__Iterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} __attribute__ ((gcc_struct));

unsigned int __ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(struct __ecereNameSpace__ecere__com__Instance * this, char *  s, int max);

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts;

int __ecereMethod___ecereNameSpace__ecere__sys__File_Printf(struct __ecereNameSpace__ecere__com__Instance * this, const char *  format, ...);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Free;

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_map(struct __ecereNameSpace__ecere__com__MapIterator * this);

void __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(struct __ecereNameSpace__ecere__com__MapIterator * this, struct __ecereNameSpace__ecere__com__Instance * value);

const uint64 __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_key(struct __ecereNameSpace__ecere__com__MapIterator * this);

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(struct __ecereNameSpace__ecere__com__Iterator * this, const uint64 index, unsigned int create);

uint64 __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(struct __ecereNameSpace__ecere__com__Iterator * this);

void __ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(struct __ecereNameSpace__ecere__com__Iterator * this, uint64 value);

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Next();

struct ModuleInfo;

struct ModuleInfo
{
struct ModuleInfo * prev, * next;
char * name;
unsigned int globalInstance;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__sys__BTNode;

struct __ecereNameSpace__ecere__sys__BTNode
{
uintptr_t key;
struct __ecereNameSpace__ecere__sys__BTNode * parent;
struct __ecereNameSpace__ecere__sys__BTNode * left;
struct __ecereNameSpace__ecere__sys__BTNode * right;
int depth;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BTNode_Get_next(struct __ecereNameSpace__ecere__sys__BTNode * this);

struct __ecereNameSpace__ecere__com__Property;

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
} __attribute__ ((gcc_struct));

struct MethodImport;

struct MethodImport
{
struct MethodImport * prev;
struct MethodImport * next;
char *  name;
unsigned int isVirtual;
} __attribute__ ((gcc_struct));

struct PropertyImport;

struct PropertyImport
{
struct PropertyImport * prev;
struct PropertyImport * next;
char *  name;
unsigned int isVirtual;
unsigned int hasSet;
unsigned int hasGet;
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct));

extern struct Type * ProcessTypeString(const char *  string, unsigned int staticMethod);

extern void PrintTypeNoConst(struct Type * type, char *  string, unsigned int printName, unsigned int fullName);

extern void PrintType(struct Type * type, char *  string, unsigned int printName, unsigned int fullName);

struct __ecereNameSpace__ecere__com__BTNamedLink;

struct __ecereNameSpace__ecere__com__BTNamedLink
{
const char *  name;
struct __ecereNameSpace__ecere__com__BTNamedLink * parent;
struct __ecereNameSpace__ecere__com__BTNamedLink * left;
struct __ecereNameSpace__ecere__com__BTNamedLink * right;
int depth;
void *  data;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__sys__OldLink;

struct __ecereNameSpace__ecere__sys__OldLink
{
struct __ecereNameSpace__ecere__sys__OldLink * prev;
struct __ecereNameSpace__ecere__sys__OldLink * next;
void *  data;
} __attribute__ ((gcc_struct));

struct Symbol;

extern void DeclareClass(struct External * neededFor, struct Symbol * classSym, const char *  className);

extern struct Symbol * FindClass(const char *  name);

struct __ecereNameSpace__ecere__com__NameSpace;

extern void SetGlobalData(struct __ecereNameSpace__ecere__com__NameSpace *  nameSpace);

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
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct));

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
unsigned int notYetDeclared;
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
unsigned int mustRegister;
} __attribute__ ((gcc_struct));

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
struct __ecereNameSpace__ecere__com__Class * thisClassFrom;
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
unsigned int pointerAlignment : 1;
} __attribute__ ((gcc_struct));

extern void DeclareMethod(struct External * neededFor, struct __ecereNameSpace__ecere__com__Method * method, const char *  name);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_AddMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, void *  function, int declMode);

struct __ecereNameSpace__ecere__sys__OldList _excludedSymbols =
{
0, 0, 0, (unsigned int)(uintptr_t)&((struct Symbol *)(void * )0)->left, 0
};

struct __ecereNameSpace__ecere__com__Module;

static struct __ecereNameSpace__ecere__com__Instance * privateModule;

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, const char *  name);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern void SetPrivateModule(struct __ecereNameSpace__ecere__com__Instance * module);

extern void ComputeModuleClasses(struct __ecereNameSpace__ecere__com__Instance * module);

extern void FreeTypeData(struct __ecereNameSpace__ecere__com__Instance * privateModule);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, const char *  name, const char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

struct __ecereNameSpace__ecere__com__Application;

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com____ecere_COM_Initialize(unsigned int guiApp, int argc, char *  argv[]);

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} __attribute__ ((gcc_struct));

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

struct __ecereNameSpace__ecere__sys__BTNode * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_Get_first(struct __ecereNameSpace__ecere__sys__BinaryTree * this);

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
} __attribute__ ((gcc_struct));

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

static struct __ecereNameSpace__ecere__com__NameSpace globalData;

extern void FreeGlobalData(struct __ecereNameSpace__ecere__com__NameSpace * globalDataList);

void __ecereUnregisterModule_ecs(struct __ecereNameSpace__ecere__com__Instance * module)
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
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_ModuleInfo;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_SymbolgenApp;

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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ModuleImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_MethodImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map_TPL_ContextStringPair__ecere__com__List_TPL_String___;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ImportedModule;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List_TPL_String_;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Context;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__File;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Application;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__CustomAVLTree;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map;

static void LoadImports(const char * fileName)
{
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__sys__FileOpen(fileName, 1);

if(f)
{
for(; ; )
{
char line[1024];

if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(line[0] == '[')
{
if(!strcmp(line, "[Imported Modules]"))
{
struct ModuleImport * module = (((void *)0));

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
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
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] == '[')
{
if(!strcmp(line, "[Instantiated]"))
{
_class->itself = 1;
}
else if(!strcmp(line, "[Remote]"))
{
_class->isRemote = 1;
}
else if(!strcmp(line, "[Imported Methods]"))
{
struct MethodImport * method = (((void *)0));

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] != '[')
{
if(!(method = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(&_class->methods, line, 0)))
{
method = __extension__ ({
struct MethodImport * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_MethodImport);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(line), __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(&_class->methods, method);
}
}
else if(!strcmp(line, "[Virtual]"))
method->isVirtual = 1;
}
}
else if(!strcmp(line, "[Imported Properties]"))
{
struct PropertyImport * prop = (((void *)0));

for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] != '[')
{
if(!(prop = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(&_class->properties, line, 0)))
{
prop = __extension__ ({
struct PropertyImport * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_PropertyImport);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(line), __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(&_class->properties, prop);
}
}
else if(!strcmp(line, "[Set]"))
prop->hasSet = 1;
else if(!strcmp(line, "[Get]"))
prop->hasGet = 1;
else if(!strcmp(line, "[Virtual]"))
prop->isVirtual = 1;
}
}
}
else
{
if(!(_class = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(&module->classes, line, 0)))
{
_class = __extension__ ({
struct ClassImport * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ClassImport);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(line), __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(&module->classes, _class);
}
}
}
}
else if(!strcmp(line, "[Imported Functions]"))
{
for(; ; )
{
if(!__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
break;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(!strcmp(line, "."))
break;
if(line[0] == '[')
{
}
else
{
if(!(function = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(&module->functions, line, 0)))
{
function = __extension__ ({
struct FunctionImport * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_FunctionImport);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(line), __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(&module->functions, function);
}
}
}
}
}
else
{
if(!(module = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(&_imports, line, 0)))
{
if(!strcmp(line, "ecereCOM"))
{
module = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(&_imports, "ecere", 0);
}
else if(!strcmp(line, "ecere"))
{
module = __ecereMethod___ecereNameSpace__ecere__sys__OldList_FindName(&_imports, "ecereCOM", 0);
if(module)
{
(__ecereNameSpace__ecere__com__eSystem_Delete(module->name), module->name = 0);
module->name = __ecereNameSpace__ecere__sys__CopyString("ecere");
}
}
if(!module)
{
module = __extension__ ({
struct ModuleImport * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ModuleImport);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(line), __ecereInstance1;
});
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

void __ecereCreateModuleInstances_ecs()
{
(globalData.classes.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, globalData.defines.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, globalData.functions.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString, globalData.nameSpaces.CompareKey = (void *)__ecereMethod___ecereNameSpace__ecere__sys__BinaryTree_CompareString);
theGlobalContext = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_Context);
}

void __ecereDestroyModuleInstances_ecs()
{
((theGlobalContext ? (__ecereClass_Context->Destructor ? __ecereClass_Context->Destructor((void *)theGlobalContext) : 0, __ecereNameSpace__ecere__com__eSystem_Delete(theGlobalContext)) : 0), theGlobalContext = 0);
}

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

DeclareClass((((void *)0)), FindClass("ecere::net::DCOMClientObject"), "__ecereClass___ecereNameSpace__ecere__net__DCOMClientObject");
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

method->dataType = ProcessTypeString(method->dataTypeString, 0);
if(method->dataType && method->dataType->name)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         case %d:\n", vid - _class->base->vTblSize);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         {\n");
{
if(method->dataType->__anon1.__anon2.returnType->kind != 0)
{
struct TypeName * resultType;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;
char type[1024] = "";
char className[1024];
struct Symbol * classSym;

if(method->dataType->__anon1.__anon2.returnType->kind == 8)
classSym = method->dataType->__anon1.__anon2.returnType->__anon1._class;
else
{
PrintTypeNoConst(method->dataType->__anon1.__anon2.returnType, type, 0, 1);
classSym = FindClass(type);
type[0] = (char)0;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 1);
DeclareClass((((void *)0)), classSym, className);
PrintType(method->dataType->__anon1.__anon2.returnType, type, 1, 1);
decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier("__ecereResult")));
resultType = MkTypeName(specs, decl);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            ");
OutputTypeName(resultType, f, 0);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ";\n");
}
for(param = method->dataType->__anon1.__anon2.params.first; param; param = param->next)
{
if(param->kind == 8 && !strcmp(param->__anon1._class->string, "String"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            char %s[1024];\n", param->name);
DeclareClass((((void *)0)), FindClass("StaticString"), "__ecereClass_StaticString");
DeclareClass((((void *)0)), FindClass("String"), "__ecereClass_String");
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
classSym = param->__anon1._class;
else
{
PrintTypeNoConst(param, type, 0, 1);
classSym = FindClass(type);
type[0] = (char)0;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 1);
DeclareClass((((void *)0)), classSym, className);
PrintType(param, type, 1, 1);
decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier(param->name)));
paramTypeName = MkTypeName(specs, decl);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            ");
OutputTypeName(paramTypeName, f, 0);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ";\n");
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
for(param = method->dataType->__anon1.__anon2.params.first; param; param = param->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            __ecereBuffer.Unserialize(");
if(param->kind == 8 && !strcmp(param->__anon1._class->string, "String"))
{
DeclareClass((((void *)0)), FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "(StaticString)");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, param->name);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ");\n");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            ");
if(method->dataType->__anon1.__anon2.returnType->kind != 0)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "__ecereResult = ");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "%s(", method->name);
for(param = method->dataType->__anon1.__anon2.params.first; param; param = param->next)
{
if(param->prev)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ", ");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "%s", param->name);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ");\n");
for(param = method->dataType->__anon1.__anon2.params.first; param; param = param->next)
{
if(param->kind == 8 && ((param->__anon1._class && param->__anon1._class->__anon1.registered && param->__anon1._class->__anon1.registered->type == 1) || !strcmp(param->__anon1._class->string, "String")) && !param->constant)
{
if(!strcmp(param->__anon1._class->string, "String"))
{
DeclareClass((((void *)0)), FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            __ecereBuffer.Serialize((StaticString)%s);\n", param->name);
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            __ecereBuffer.Serialize(%s);\n", param->name);
}
}
if(method->dataType->__anon1.__anon2.returnType->kind != 0)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            __ecereBuffer.Serialize(__ecereResult);\n");
}
for(param = method->dataType->__anon1.__anon2.params.first; param; param = param->next)
{
if(param->kind == 8 && strcmp(param->__anon1._class->string, "String") && param->__anon1._class->__anon1.registered && (param->__anon1._class->__anon1.registered->type == 0 || param->__anon1._class->__anon1.registered->type == 5))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            delete %s;\n", param->name);
}
}
if(method->dataType->__anon1.__anon2.returnType->kind == 8 && strcmp(method->dataType->__anon1.__anon2.returnType->__anon1._class->string, "String") && method->dataType->__anon1.__anon2.returnType->__anon1._class->__anon1.registered && (method->dataType->__anon1.__anon2.returnType->__anon1._class->__anon1.registered->type == 0 || method->dataType->__anon1.__anon2.returnType->__anon1._class->__anon1.registered->type == 5))
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
doVirtual = 1;
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
doVirtual = 0;
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
method->dataType = ProcessTypeString(method->dataTypeString, 0);
if(method->dataType->name)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   ");
if(doVirtual)
{
char name[1024];

strcpy(name, "__ecereVMethodID_");
FullClassNameCat(name, method->_class->fullName, 1);
strcat(name, "_");
strcat(name, method->name);
DeclareMethod((((void *)0)), method, name);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "virtual ");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "%s\n", method->dataTypeString);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   {\n");
if(method->dataType)
{
if(method->dataType->__anon1.__anon2.returnType->kind != 0)
{
struct TypeName * resultType;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;
char type[1024] = "";
char className[1024];
struct Symbol * classSym;

if(method->dataType->__anon1.__anon2.returnType->kind == 8)
classSym = method->dataType->__anon1.__anon2.returnType->__anon1._class;
else
{
PrintTypeNoConst(method->dataType->__anon1.__anon2.returnType, type, 0, 1);
classSym = FindClass(type);
type[0] = (char)0;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 1);
DeclareClass((((void *)0)), classSym, className);
PrintType(method->dataType->__anon1.__anon2.returnType, type, 1, 1);
decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier("__ecereResult")));
resultType = MkTypeName(specs, decl);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      ");
OutputTypeName(resultType, f, 0);
if(method->dataType->__anon1.__anon2.returnType->kind == 9)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, " = { 0 }");
else if(method->dataType->__anon1.__anon2.returnType->kind == 8 && method->dataType->__anon1.__anon2.returnType->__anon1._class->__anon1.registered && method->dataType->__anon1.__anon2.returnType->__anon1._class->__anon1.registered->type == 1)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, " { }");
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, " = 0");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ";\n\n");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      incref this;\n");
for(param = method->dataType->__anon1.__anon2.params.first; param; param = param->next)
{
char type[1024] = "";
char className[1024];
struct Symbol * classSym;

if(param->kind == 8)
classSym = param->__anon1._class;
else
{
PrintTypeNoConst(param, type, 0, 1);
classSym = FindClass(type);
type[0] = (char)0;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 1);
DeclareClass((((void *)0)), classSym, className);
if(param->kind == 8 && !strcmp(param->__anon1._class->string, "String"))
{
DeclareClass((((void *)0)), FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      __ecereBuffer.Serialize((StaticString)%s);\n", param->name);
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      __ecereBuffer.Serialize(%s);\n", param->name);
}
DeclareMethod((((void *)0)), __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "ecere::net::DCOMClientObject"), "CallMethod", privateModule), "__ecereMethod___ecereNameSpace__ecere__net__DCOMClientObject_CallMethod");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      if(DCOMClientObject::CallMethod(%d))\n", id++);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      {\n");
for(param = method->dataType->__anon1.__anon2.params.first; param; param = param->next)
{
if(param->kind == 8 && ((param->__anon1._class && param->__anon1._class->__anon1.registered && param->__anon1._class->__anon1.registered->type == 1) || !strcmp(param->__anon1._class->string, "String")) && !param->constant)
{
if(!strcmp(param->__anon1._class->string, "String"))
{
DeclareClass((((void *)0)), FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         __ecereBuffer.Unserialize((StaticString)%s);\n", param->name);
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         __ecereBuffer.Unserialize(%s);\n", param->name);
}
}
if(method->dataType->__anon1.__anon2.returnType->kind != 0)
{
if(method->dataType->__anon1.__anon2.returnType->kind == 8 && !strcmp(method->dataType->__anon1.__anon2.returnType->__anon1._class->string, "String"))
{
DeclareClass((((void *)0)), FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         __ecereBuffer.Unserialize((StaticString)__ecereResult);\n");
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         __ecereBuffer.Unserialize(__ecereResult);\n");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      }\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      __ecereBuffer.Free();\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      delete this;\n");
if(method->dataType->__anon1.__anon2.returnType->kind != 0)
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
doVirtual = 0;
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
unsigned int mutexDeclared = 0;
struct __ecereNameSpace__ecere__com__Class * _class;

for(_class = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)privateModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->classes.first; _class; _class = _class->next)
{
if(_class->isRemote == 3)
break;
}
if(_class)
{
struct __ecereNameSpace__ecere__com__Instance * f;

if(!dcomSymbols)
dcomSymbols = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);
f = dcomSymbols;
DeclareClass((((void *)0)), FindClass("ecere::net::DCOMServerObject"), "__ecereClass___ecereNameSpace__ecere__net__DCOMServerObject");
for(_class = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)privateModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->classes.first; _class; _class = _class->next)
{
if(_class->isRemote == 3)
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

method->dataType = ProcessTypeString(method->dataTypeString, 0);
if(method->dataType && method->dataType->name)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         case %d:\n", id++);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         {\n");
{
if(method->dataType->__anon1.__anon2.returnType->kind != 0)
{
struct TypeName * resultType;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;
char type[1024] = "";
char className[1024];
struct Symbol * classSym;

if(method->dataType->__anon1.__anon2.returnType->kind == 8)
classSym = method->dataType->__anon1.__anon2.returnType->__anon1._class;
else
{
PrintTypeNoConst(method->dataType->__anon1.__anon2.returnType, type, 0, 1);
classSym = FindClass(type);
type[0] = (char)0;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 1);
DeclareClass((((void *)0)), classSym, className);
PrintType(method->dataType->__anon1.__anon2.returnType, type, 1, 1);
decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier("__ecereResult")));
resultType = MkTypeName(specs, decl);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            ");
OutputTypeName(resultType, f, 0);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ";\n");
}
for(param = method->dataType->__anon1.__anon2.params.first; param; param = param->next)
{
if(param->kind == 8 && !strcmp(param->__anon1._class->string, "String"))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            char %s[1024];\n", param->name);
DeclareClass((((void *)0)), FindClass("StaticString"), "__ecereClass_StaticString");
DeclareClass((((void *)0)), FindClass("String"), "__ecereClass_String");
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
classSym = param->__anon1._class;
else
{
PrintTypeNoConst(param, type, 0, 1);
classSym = FindClass(type);
type[0] = (char)0;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 1);
DeclareClass((((void *)0)), classSym, className);
PrintType(param, type, 1, 1);
decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier(param->name)));
paramTypeName = MkTypeName(specs, decl);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            ");
OutputTypeName(paramTypeName, f, 0);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ";\n");
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
for(param = method->dataType->__anon1.__anon2.params.first; param; param = param->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            __ecereBuffer.Unserialize(");
if(param->kind == 8 && !strcmp(param->__anon1._class->string, "String"))
{
DeclareClass((((void *)0)), FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "(StaticString)");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, param->name);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ");\n");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            ");
if(method->dataType->__anon1.__anon2.returnType->kind != 0)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "__ecereResult = ");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "((%s)instance).%s(", _class->fullName, method->name);
for(param = method->dataType->__anon1.__anon2.params.first; param; param = param->next)
{
if(param->prev)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ", ");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "%s", param->name);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ");\n");
for(param = method->dataType->__anon1.__anon2.params.first; param; param = param->next)
{
if(param->kind == 8 && ((param->__anon1._class && param->__anon1._class->__anon1.registered && param->__anon1._class->__anon1.registered->type == 1) || !strcmp(param->__anon1._class->string, "String")) && !param->constant)
{
if(!strcmp(param->__anon1._class->string, "String"))
{
DeclareClass((((void *)0)), FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            __ecereBuffer.Serialize((StaticString)%s);\n", param->name);
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            __ecereBuffer.Serialize(%s);\n", param->name);
}
}
if(method->dataType->__anon1.__anon2.returnType->kind != 0)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            __ecereBuffer.Serialize(__ecereResult);\n");
}
for(param = method->dataType->__anon1.__anon2.params.first; param; param = param->next)
{
if(param->kind == 8 && strcmp(param->__anon1._class->string, "String") && param->__anon1._class->__anon1.registered && (param->__anon1._class->__anon1.registered->type == 0 || param->__anon1._class->__anon1.registered->type == 5))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "            delete %s;\n", param->name);
}
}
if(method->dataType->__anon1.__anon2.returnType->kind == 8 && strcmp(method->dataType->__anon1.__anon2.returnType->__anon1._class->string, "String") && method->dataType->__anon1.__anon2.returnType->__anon1._class->__anon1.registered && (method->dataType->__anon1.__anon2.returnType->__anon1._class->__anon1.registered->type == 0 || method->dataType->__anon1.__anon2.returnType->__anon1._class->__anon1.registered->type == 5))
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
DeclareClass((((void *)0)), FindClass("ecere::sys::Mutex"), "__ecereClass___ecereNameSpace__ecere__sys__Mutex");
DeclareMethod((((void *)0)), __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "ecere::sys::Mutex"), "Wait", privateModule), "__ecereMethod___ecereNameSpace__ecere__sys__Mutex_Wait");
DeclareMethod((((void *)0)), __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "ecere::sys::Mutex"), "Release", privateModule), "__ecereMethod___ecereNameSpace__ecere__sys__Mutex_Release");
mutexDeclared = 1;
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
if(!method->dataType)
method->dataType = ProcessTypeString(method->dataTypeString, 0);
if(method->dataType->name)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   virtual %s\n", method->dataTypeString);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   {\n");
if(method->dataType)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      DCOM%s __ecereObject = (void *)_vTbl[-1];\n", _class->fullName);
if(method->dataType->__anon1.__anon2.returnType->kind != 0)
{
struct TypeName * resultType;
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();
struct Declarator * decl;
char type[1024] = "";
char className[1024];
struct Symbol * classSym;

if(method->dataType->__anon1.__anon2.returnType->kind == 8)
classSym = method->dataType->__anon1.__anon2.returnType->__anon1._class;
else
{
PrintTypeNoConst(method->dataType->__anon1.__anon2.returnType, type, 0, 1);
classSym = FindClass(type);
type[0] = (char)0;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 1);
DeclareClass((((void *)0)), classSym, className);
PrintType(method->dataType->__anon1.__anon2.returnType, type, 1, 1);
decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier("__ecereResult")));
resultType = MkTypeName(specs, decl);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      ");
OutputTypeName(resultType, f, 0);
if(method->dataType->__anon1.__anon2.returnType->kind == 9)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, " = { 0 }");
else if(method->dataType->__anon1.__anon2.returnType->kind == 8 && method->dataType->__anon1.__anon2.returnType->__anon1._class->__anon1.registered && method->dataType->__anon1.__anon2.returnType->__anon1._class->__anon1.registered->type == 1)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, " { }");
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, " = 0");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ";\n\n");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      incref __ecereObject;\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      __ecereMethod___ecereNameSpace__ecere__sys__Mutex_Wait(__ecereObject.mutex);\n");
for(param = method->dataType->__anon1.__anon2.params.first; param; param = param->next)
{
char type[1024] = "";
char className[1024];
struct Symbol * classSym;

if(param->kind == 8)
classSym = param->__anon1._class;
else
{
PrintTypeNoConst(param, type, 0, 1);
classSym = FindClass(type);
type[0] = (char)0;
}
strcpy(className, "__ecereClass_");
FullClassNameCat(className, classSym->string, 1);
DeclareClass((((void *)0)), classSym, className);
if(param->kind == 8 && !strcmp(param->__anon1._class->string, "String"))
{
DeclareClass((((void *)0)), FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      __ecereObject.argsBuffer.Serialize((StaticString)%s);\n", param->name);
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      __ecereObject.argsBuffer.Serialize(%s);\n", param->name);
}
DeclareMethod((((void *)0)), __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereNameSpace__ecere__com__eSystem_FindClass(privateModule, "ecere::net::DCOMServerObject"), "CallVirtualMethod", privateModule), "__ecereMethod___ecereNameSpace__ecere__net__DCOMServerObject_CallVirtualMethod");
{
unsigned int hasReturnValue = method->dataType->__anon1.__anon2.returnType->kind != 0;

if(!hasReturnValue)
{
for(param = method->dataType->__anon1.__anon2.params.first; param; param = param->next)
{
if(param->kind == 8 && ((param->__anon1._class && param->__anon1._class->__anon1.registered && param->__anon1._class->__anon1.registered->type == 1) || !strcmp(param->__anon1._class->string, "String")) && !param->constant)
{
hasReturnValue = 1;
break;
}
}
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      if(__ecereObject.CallVirtualMethod(%d, %s))\n", vid - _class->base->vTblSize, hasReturnValue ? "true" : "false");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      {\n");
for(param = method->dataType->__anon1.__anon2.params.first; param; param = param->next)
{
if(param->kind == 8 && ((param->__anon1._class && param->__anon1._class->__anon1.registered && param->__anon1._class->__anon1.registered->type == 1) || !strcmp(param->__anon1._class->string, "String")) && !param->constant)
{
if(!strcmp(param->__anon1._class->string, "String"))
{
DeclareClass((((void *)0)), FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         __ecereObject.returnBuffer.Unserialize((StaticString)%s);\n", param->name);
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         __ecereObject.returnBuffer.Unserialize(%s);\n", param->name);
}
}
if(method->dataType->__anon1.__anon2.returnType->kind != 0)
{
if(method->dataType->__anon1.__anon2.returnType->kind == 8 && !strcmp(method->dataType->__anon1.__anon2.returnType->__anon1._class->string, "String"))
{
DeclareClass((((void *)0)), FindClass("StaticString"), "__ecereClass_StaticString");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         __ecereObject.returnBuffer.Unserialize((StaticString)__ecereResult);\n");
}
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         __ecereObject.returnBuffer.Unserialize(__ecereResult);\n");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      }\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      else\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "         ((%s)this).%s::%s(", _class->fullName, _class->fullName, method->name);
for(param = method->dataType->__anon1.__anon2.params.first; param; param = param->next)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "%s", param->name);
if(param->next)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ", ");
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, ");\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      __ecereObject.returnBuffer.Free();\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      __ecereMethod___ecereNameSpace__ecere__sys__Mutex_Release(__ecereObject.mutex);\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      delete __ecereObject;\n");
if(method->dataType->__anon1.__anon2.returnType->kind != 0)
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

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_FindFunction(struct __ecereNameSpace__ecere__com__Instance * module, const char *  name);

struct __ecereNameSpace__ecere__com__GlobalFunction
{
struct __ecereNameSpace__ecere__com__GlobalFunction * prev;
struct __ecereNameSpace__ecere__com__GlobalFunction * next;
const char *  name;
int (*  function)();
struct __ecereNameSpace__ecere__com__Instance * module;
struct __ecereNameSpace__ecere__com__NameSpace *  nameSpace;
const char *  dataTypeString;
struct Type * dataType;
void *  symbol;
} __attribute__ ((gcc_struct));

static void WriteMain(const char * fileName)
{
struct __ecereNameSpace__ecere__com__Instance * f = __ecereNameSpace__ecere__sys__FileOpen(fileName, 2);

if(f)
{
struct ModuleImport * module;
struct ModuleInfo * defModule;
unsigned int anyMethod = 0, anyProp = 0, anyFunction = 0;
struct ImportedModule * importedModule;

__ecereNameSpace__ecere__sys__GetLastDirectory(fileName, mainModuleName);
__ecereNameSpace__ecere__sys__StripExtension(mainModuleName);
if(!projectName[0])
{
strcpy(projectName, mainModuleName);
__ecereNameSpace__ecere__sys__StripExtension(projectName);
}
FixModuleName(mainModuleName);
if(targetPlatform == 1 && !isConsole && !isStaticLibrary && !isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "typedef void * HINSTANCE;\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "#define WINAPI __stdcall\n");
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
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "default:\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "static Module __currentModule;\n\n");
if(!isStaticLibrary)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "Module __thisModule;\n\n");
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

FullClassNameCat(className, _class->name, 1);
if(_class->itself)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "Class __ecereClass_%s;\n", className);
{
{
for(method = _class->methods.first; method; method = method->next)
{
struct __ecereNameSpace__ecere__com__Method * meth = __ecereNameSpace__ecere__com__eClass_FindMethod(regClass, method->name, privateModule);

if(meth && !meth->dataType)
{
struct Context * context = SetupTemplatesContext(regClass);

meth->dataType = ProcessTypeString(meth->dataTypeString, 0);
FinishTemplatesContext(context);
}
if(method->isVirtual)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "int __ecereVMethodID_%s_%s;\n", className, method->name);
else if((!strcmp(_class->name, "float") || !strcmp(_class->name, "double") || module->name) && module->importType != 1 && (!meth || !meth->dataType->dllExport))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "int (*__ecereMethod_%s_%s)();\n", className, method->name);
}
anyMethod = 1;
}
}
for(prop = _class->properties.first; prop; prop = prop->next)
{
char propName[1024];

propName[0] = (char)0;
FullClassNameCat(propName, prop->name, 1);
if((!strcmp(_class->name, "float") || !strcmp(_class->name, "double") || module->name) && module->importType != 1)
{
if(prop->hasSet)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "void * __ecereProp_%s_Set_%s;\n", className, propName);
if(prop->hasGet)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "void * __ecereProp_%s_Get_%s;\n", className, propName);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "Property __ecereProp_%s_%s;\n", className, propName);
anyProp = 1;
}
}
}
for(function = module->functions.first; function; function = function->next)
{
struct __ecereNameSpace__ecere__com__GlobalFunction * func = __ecereNameSpace__ecere__com__eSystem_FindFunction(privateModule, function->name);

if(func && !func->dataType)
func->dataType = ProcessTypeString(func->dataTypeString, 0);
if(module->name && module->importType != 1 && (!func || !func->dataType || !func->dataType->dllExport))
{
char functionName[1024];

functionName[0] = (char)0;
FullClassNameCat(functionName, function->name, 0);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "void * __ecereFunction_%s;\n", functionName);
anyFunction = 1;
}
}
}
for(defModule = modules.first; defModule; defModule = defModule->next)
{
char moduleName[1024];

strcpy(moduleName, defModule->name);
FixModuleName(moduleName);
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
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = dcomSymbols;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(dcomSymbols, 0, 0);
while(!((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = dcomSymbols;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof])(dcomSymbols))
{
char buffer[4096];
int read = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = dcomSymbols;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read])(dcomSymbols, buffer, 1, sizeof (buffer));

if(!read)
break;
((int (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, unsigned int size, unsigned int count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])(f, buffer, 1, read);
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
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\ndllexport bool __stdcall __ecereDll_Load(Module module)\n{\n");
else
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\ndllexport bool __ecereDll_Load(Module module)\n{\n");
}
else if(targetPlatform == 1 && !isConsole)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\nint WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInst, char * cmdLine, int show)\n{\n");
}
else
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\nint main(int _argc, char * _argv[])\n{\n");
if(!isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   int exitCode;\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   Module module;\n");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   __attribute__((unused)) Class _class;\n");
if(anyMethod)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   __attribute__((unused)) Method method;\n");
if(anyProp)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   __attribute__((unused)) Property _property;\n");
if(anyFunction)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   __attribute__((unused)) GlobalFunction function;\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
if(disabledPooling)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   eSystem_SetPoolingDisabled(true);\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n");
}
if(isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   if(!__currentModule)\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   {\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "      __currentModule = module;\n");
if(!isStaticLibrary)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "      __thisModule = module;\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   }\n\n");
}
else if(targetPlatform == 1 && !isConsole)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   __thisModule = __currentModule = module = __ecere_COM_Initialize(1, 0, null);\n\n");
else
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   __thisModule = __currentModule = module = __ecere_COM_Initialize(1, _argc, (void *)_argv);\n\n");
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
FixModuleName(moduleName);
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
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   if(__currentModule == module)\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   {\n");
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

FullClassNameCat(className, _class->name, 1);
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
if(method->isVirtual || ((!strcmp(_class->name, "float") || !strcmp(_class->name, "double") || module->name) && module->importType != 1))
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
FullClassNameCat(propName, prop->name, 1);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereProp_%s_%s = _property = eClass_FindProperty(%s, \"%s\", module);\n", className, propName, classID, prop->name);
if((!strcmp(_class->name, "float") || !strcmp(_class->name, "double") || module->name) && module->importType != 1)
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
FullClassNameCat(functionName, function->name, 0);
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
{
if(isDynamicLibrary)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      LoadTranslatedStrings(\"%s\", \"%s\");\n", projectName, projectName);
else
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "      LoadTranslatedStrings(null, \"%s\");\n", projectName);
}
if(isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   }\n");
}
if(!isDynamicLibrary && thisAppClass)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   _class = eSystem_FindClass(__currentModule, \"%s\");\n", thisAppClass->name);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   eInstance_Evolve((Instance *)&__currentModule, _class);\n");
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __thisModule = __currentModule;\n");
}
if(isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   if(__currentModule == module)\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   {\n");
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
FixModuleName(moduleName);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereCreateModuleInstances_%s();\n", moduleName);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
}
if(isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   }\n");
}
if(!isDynamicLibrary && thisAppClass)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   ((void(*)(void *))(void *)__currentModule._vTbl[12])(__currentModule);\n");
}
if(isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   return true;\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "}\n");
if(isStaticLibrary)
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\nbool __ecereDll_Unload_%s(Module module)\n{\n", projectName);
}
else
{
if(targetPlatform == 1)
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\ndllexport bool __stdcall __ecereDll_Unload(Module module)\n{\n");
else
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\ndllexport bool __ecereDll_Unload(Module module)\n{\n");
}
}
if(isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   if(__currentModule == module)\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   {\n");
}
{
unsigned int destroyI18n = 0;

if(modules.count)
{
for(defModule = modules.first; defModule; defModule = defModule->next)
if(defModule->globalInstance)
{
char moduleName[1024];

if(!strcmp(defModule->name, "i18n"))
{
destroyI18n = 1;
continue;
}
strcpy(moduleName, defModule->name);
FixModuleName(moduleName);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereDestroyModuleInstances_%s();\n", moduleName);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
}
if(i18n)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   UnloadTranslatedStrings(\"%s\");\n", projectName);
if(destroyI18n)
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereDestroyModuleInstances_i18n();\n");
}
if(isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   }\n");
if(isDynamicLibrary)
{
}
if(modules.count)
{
for(defModule = modules.first; defModule; defModule = defModule->next)
{
char moduleName[1024];

strcpy(moduleName, defModule->name);
FixModuleName(moduleName);
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "   __ecereUnregisterModule_%s(module);\n", moduleName);
}
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(f, "\n");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   if(__currentModule == module)\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "      __currentModule = (void *)0;\n");
if(!isStaticLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   if(__thisModule == module)\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "      __thisModule = (void *)0;\n");
}
}
if(!isDynamicLibrary)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "\n   _class = eSystem_FindClass(__currentModule, \"ecere::com::Application\");\n   exitCode = ((ecere::com::Application)__currentModule).exitCode;\n   delete __currentModule;\n   return exitCode;\n");
}
else
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "   return true;\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(f, "}\n");
__ecereNameSpace__ecere__com__eInstance_Delete(f);
}
}

struct __ecereNameSpace__ecere__com__SubModule;

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

appClass = FindAppClass(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->publicNameSpace, 0);
if(appClass)
return appClass;
appClass = FindAppClass(&((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->privateNameSpace, 0);
if(appClass)
return appClass;
for(subModule = ((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->modules.first; subModule; subModule = subModule->next)
{
appClass = SearchAppClass_Module(subModule->module);
if(appClass)
return appClass;
}
return (((void *)0));
}

void __ecereMethod_SymbolgenApp_Main(struct __ecereNameSpace__ecere__com__Instance * this)
{
int c;
unsigned int valid = 1;
const char * output = (((void *)0));

outputPot = 0;
disabledPooling = 0;
targetPlatform = __runtimePlatform;
targetBits = GetHostBits();
for(c = 1; c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc; c++)
{
const char * arg = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[c];

if(arg[0] == '-')
{
if(!strcmp(arg + 1, "m32") || !strcmp(arg + 1, "m64"))
{
targetBits = !strcmp(arg + 1, "m32") ? 32 : 64;
}
else if(!strcmp(arg + 1, "t32") || !strcmp(arg + 1, "t64"))
{
targetBits = !strcmp(arg + 1, "t32") ? 32 : 64;
}
else if(!strcmp(arg + 1, "o"))
{
if(!output && c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc)
{
output = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[c + 1];
c++;
}
else
valid = 0;
}
else if(!strcmp(arg, "-name"))
{
if(c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc)
{
strcpy(projectName, ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[c + 1]);
c++;
}
else
valid = 0;
}
else if(!strcmp(arg, "-t"))
{
if(++c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc)
targetPlatform = __ecereProp___ecereNameSpace__ecere__com__Platform_Set_char__PTR_(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[c]);
else
valid = 0;
}
else if(!strcmp(arg, "-outputpot"))
outputPot = 1;
else if(!strcmp(arg, "-disabled-pooling"))
disabledPooling = 1;
else if(!strcmp(arg, "-console"))
isConsole = 1;
else if(!strcmp(arg, "-dynamiclib"))
isDynamicLibrary = 1;
else if(!strcmp(arg, "-staticlib"))
{
isDynamicLibrary = 1;
isStaticLibrary = 1;
}
else if(!strcmp(arg, "-symbols"))
{
if(c + 1 < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc)
{
SetSymbolsDir(((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[c + 1]);
c++;
}
else
valid = 0;
}
}
}
if(!output)
valid = 0;
if(!valid)
{
printf("%s", __ecereNameSpace__ecere__GetTranslatedString("ecs", "Syntax:\n   ecs [-t <target platform>] <input>[, <input>]* -o <output>\n", (((void *)0))));
}
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
SetInSymbolGen(1);
privateModule = (struct __ecereNameSpace__ecere__com__Instance *)__ecereNameSpace__ecere__com____ecere_COM_Initialize((unsigned int)(1 | (targetBits == sizeof(uintptr_t) * 8 ? (unsigned int)0 : targetBits == 64 ? 2 : targetBits == 32 ? 4 : (unsigned int)0) | 8), 1, (((void *)0)));
SetPrivateModule(privateModule);
mainModule = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ModuleImport);
SetMainModule(mainModule);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(&_imports, mainModule);
{
struct __ecereNameSpace__ecere__com__Instance * intlStrings = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__Map_TPL_ContextStringPair__ecere__com__List_TPL_String___);
struct __ecereNameSpace__ecere__com__MapIterator it = (it.container = (void *)0, it.pointer = (void *)0, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(&it, intlStrings), it);

for(c = 1; c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc; c++)
{
const char * file = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[c];
struct __ecereNameSpace__ecere__com__Instance * f = (((void *)0));
char line[16384];
int count = 0;
char * tokens[512];

if(file[0] == '-')
{
if(!strcmp(file, "-c"))
c++;
}
else if(file[0] == '@')
f = __ecereNameSpace__ecere__sys__FileOpen(&file[1], 1);
else
{
count = 1;
tokens[0] = (char *)file;
}
while(count || f)
{
int c;

if(f)
{
while(!count && __ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
count = __ecereNameSpace__ecere__sys__Tokenize(line, sizeof (tokens) / sizeof (tokens[0]), tokens, 2);
if(!count)
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}
for(c = 0; c < count; c++)
{
char ext[17];

file = tokens[c];
__ecereNameSpace__ecere__sys__GetExtension(file, ext);
if(!strcmp(ext, "imp"))
LoadImports(file);
}
count = 0;
}
}
for(c = 1; c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc; c++)
{
const char * file = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[c];

if(file[0] == '-')
{
if(!strcmp(file, "-c"))
c++;
}
}
for(c = 1; c < ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argc; c++)
{
const char * file = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)this + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->argv[c];
struct __ecereNameSpace__ecere__com__Instance * f = (((void *)0));
char line[16384];
int count = 0;
char * tokens[512];

if(file[0] == '-')
{
if(!strcmp(file, "-c"))
c++;
}
else if(file[0] == '@')
f = __ecereNameSpace__ecere__sys__FileOpen(&file[1], 1);
else
{
count = 1;
tokens[0] = (char *)file;
}
while(count || f)
{
int c;

if(f)
{
while(!count && __ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
count = __ecereNameSpace__ecere__sys__Tokenize(line, sizeof (tokens) / sizeof (tokens[0]), tokens, 2);
if(!count)
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}
for(c = 0; c < count; c++)
{
char ext[17];
char moduleName[797];

file = tokens[c];
__ecereNameSpace__ecere__sys__GetExtension(file, ext);
__ecereNameSpace__ecere__sys__GetLastDirectory(file, moduleName);
__ecereNameSpace__ecere__sys__StripExtension(moduleName);
strcat(moduleName, ".ec");
if(((__runtimePlatform == 1) ? (strcasecmp) : strcmp)(moduleName, symbolModule) && (!strcmp(ext, "sym") || !strcmp(ext, "ec")))
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
importedModule = __extension__ ({
struct ImportedModule * __ecereInstance1 = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_ImportedModule);

__ecereInstance1->name = __ecereNameSpace__ecere__sys__CopyString(module->name), __ecereInstance1->type = 0, __ecereInstance1->importType = 0, __ecereInstance1;
});
__ecereMethod___ecereNameSpace__ecere__sys__OldList_AddName(&_defines, importedModule);
module->globalInstance = LoadSymbols(file, 0, 0);
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

while(!((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof])(f))
{
if(__ecereMethod___ecereNameSpace__ecere__sys__File_GetLine(f, line, sizeof (line)))
{
int len;

__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(line[0] == '#')
{
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = comments;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__List->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(comments, (uint64)(uintptr_t)(__ecereNameSpace__ecere__sys__CopyString(line)));
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

i18n = 1;
if(!__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index((void *)(&it), (uint64)(uintptr_t)(&pair), 0))
{
msgid = (((void *)0));
msgctxt = (((void *)0));
__extension__ ({
struct __ecereNameSpace__ecere__com__Iterator __internalIterator =
{
intlStrings, 0
};

__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(&__internalIterator, ((uint64)(uintptr_t)(&pair)), 1);
__ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(&__internalIterator, ((uint64)((uintptr_t)(comments))));
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
((struct __ecereNameSpace__ecere__com__IteratorPointer * (*)(struct __ecereNameSpace__ecere__com__Instance *, uint64 value))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = ((struct __ecereNameSpace__ecere__com__Instance *)(uintptr_t)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data((void *)(&it)));

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__List->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add])(((struct __ecereNameSpace__ecere__com__Instance *)(uintptr_t)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data((void *)(&it))), __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&s));
}
((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = comments;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__List->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll])(comments);
}
(__ecereNameSpace__ecere__com__eSystem_Delete(msgid), msgid = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(msgctxt), msgctxt = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(msgstr), msgstr = 0);
}
}
}
((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = comments;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__List->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Free])(comments);
(__ecereNameSpace__ecere__com__eInstance_DecRef(comments), comments = 0);
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}
}
}
}
count = 0;
}
}
ComputeModuleClasses(privateModule);
if(!isDynamicLibrary)
{
thisAppClass = SearchAppClass_Module(privateModule);
}
WriteMain(output);
if(outputPot && ((struct __ecereNameSpace__ecere__com__CustomAVLTree *)(((char *)intlStrings + 0 + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->count)
{
struct __ecereNameSpace__ecere__com__Instance * potFile;
char potFileName[797];

strcpy(potFileName, "locale");
__ecereNameSpace__ecere__sys__PathCat(potFileName, projectName);
__ecereNameSpace__ecere__sys__ChangeExtension(potFileName, "pot", potFileName);
potFile = __ecereNameSpace__ecere__sys__FileOpen(potFileName, 2);
if(potFile)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "msgid \"\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "msgstr \"\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"Project-Id-Version: \\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"POT-Creation-Date: \\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"PO-Revision-Date: \\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"Last-Translator: \\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"Language-Team: \\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"MIME-Version: 1.0\\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"Content-Type: text/plain; charset=iso-8859-1\\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"Content-Transfer-Encoding: 8bit\\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"X-Poedit-Basepath: ../\\n\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\n");
{
struct __ecereNameSpace__ecere__com__MapIterator i = (i.container = (void *)0, i.pointer = (void *)0, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(&i, (intlStrings)), i);

while(__ecereMethod___ecereNameSpace__ecere__com__Iterator_Next((void *)(&i)))
{
struct ContextStringPair pair = (*(struct ContextStringPair *)(uintptr_t)__ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_key(&i));
struct __ecereNameSpace__ecere__com__Instance * comments = ((struct __ecereNameSpace__ecere__com__Instance *)(uintptr_t)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data((void *)(&i)));

{
struct __ecereNameSpace__ecere__com__Iterator s =
{
(comments), 0
};

while(__ecereMethod___ecereNameSpace__ecere__com__Iterator_Next(&s))
{
__ecereMethod___ecereNameSpace__ecere__sys__File_Printf(potFile, ((char * )((uintptr_t)(__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&s)))));
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\n");
}
}
if(pair.context)
{
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "msgctxt \"");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, pair.context);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"\n");
}
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "msgid \"");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, pair.string);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "msgstr \"");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, pair.string);
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\"\n");
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, const char *  string))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = potFile;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts])(potFile, "\n");
}
}
((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = intlStrings;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Free])(intlStrings);
(__ecereNameSpace__ecere__com__eInstance_DecRef(intlStrings), intlStrings = 0);
(__ecereNameSpace__ecere__com__eInstance_DecRef(potFile), potFile = 0);
}
}
}
FreeContext(theGlobalContext);
FreeExcludedSymbols(&_excludedSymbols);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&_defines, (void *)(FreeModuleDefine));
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Free(&_imports, (void *)(FreeModuleImport));
FreeTypeData(privateModule);
FreeIncludeFiles();
FreeGlobalData(&globalData);
(__ecereNameSpace__ecere__com__eInstance_DecRef(privateModule), privateModule = 0);
}
SetSymbolsDir((((void *)0)));
}

void __ecereRegisterModule_ecs(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(5, "ModuleInfo", 0, sizeof(struct ModuleInfo), 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_ModuleInfo = class;
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "SymbolgenApp", "ecere::com::Application", 0, 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_SymbolgenApp = class;
__ecereNameSpace__ecere__com__eClass_AddMethod(class, "Main", 0, __ecereMethod_SymbolgenApp_Main, 1);
}

