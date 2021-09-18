/* Code generated from eC source file: ecs.main.ec */
#if defined(_WIN32)
#define __runtimePlatform 1
#elif defined(__APPLE__)
#define __runtimePlatform 3
#else
#define __runtimePlatform 2
#endif
#if defined(__GNUC__) || defined(__clang__)
#if defined(__clang__) && defined(__WIN32__)
#define int64 long long
#define uint64 unsigned long long
#if defined(_WIN64)
#define ssize_t long long
#else
#define ssize_t long
#endif
#else
typedef long long int64;
typedef unsigned long long uint64;
#endif
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
#   if defined(__clang__) && defined(__WIN32__)
#      define ecere_stdcall __stdcall
#      define ecere_gcc_struct
#   elif defined(__GNUC__) || defined(__TINYC__)
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
__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Free;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

void __ecereCreateModuleInstances_ecs();

void __ecereDestroyModuleInstances_ecs();

struct __ecereNameSpace__ecere__sys__OldList
{
void *  first;
void *  last;
int count;
unsigned int offset;
unsigned int circ;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__sys__BTNode;

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
size_t count;
size_t _size;
size_t pos;
} ecere_gcc_struct;

extern void *  __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew(void *  memory, unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew0(void *  memory, unsigned int size);

extern void __ecereNameSpace__ecere__com__eSystem_Delete(void *  memory);

extern int printf(const char * , ...);

extern void __ecereNameSpace__ecere__LoadTranslatedStrings(const char * moduleName, const char *  name);

extern void __ecereNameSpace__ecere__UnloadTranslatedStrings(const char * name);

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} ecere_gcc_struct;

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_char__PTR_;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Application;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List_TPL_String_;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map_TPL_ContextStringPair__ecere__com__List_TPL_String___;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Module;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassImport;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_Context;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionImport;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_ImportedModule;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_MethodImport;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_ModuleImport;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyImport;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__CustomAVLTree;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__File;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

extern void __ecereNameSpace__ecere__com__eInstance_Evolve(struct __ecereNameSpace__ecere__com__Instance **  instancePtr, struct __ecereNameSpace__ecere__com__Class * _class);

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

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

extern void __ecereNameSpace__ecere__com__eInstance_Watch(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Iterator_data;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_key;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_map;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Platform_char__PTR_;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_next;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first;

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} ecere_gcc_struct;

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

struct __ecereNameSpace__ecere__com__Module;

static struct __ecereNameSpace__ecere__com__Instance * __currentModule;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Instance * __thisModule;

unsigned int __ecereDll_Load_ec(struct __ecereNameSpace__ecere__com__Instance * module);

unsigned int __ecereDll_Unload_ec(struct __ecereNameSpace__ecere__com__Instance * module);

unsigned int __ecereDll_Load_ecere(struct __ecereNameSpace__ecere__com__Instance * module);

unsigned int __ecereDll_Unload_ecere(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_ecs(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_ecs(struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__eModule_LoadStatic(struct __ecereNameSpace__ecere__com__Instance * fromModule, const char *  name, int importAccess, unsigned int (*  Load)(struct __ecereNameSpace__ecere__com__Instance * module), unsigned int (*  Unload)(struct __ecereNameSpace__ecere__com__Instance * module));

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, const char *  name);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

struct __ecereNameSpace__ecere__com__Application;

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com____ecere_COM_Initialize(unsigned int guiApp, int argc, char *  argv[]);

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

void __ecereRegisterModule_ecs_main(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

}

void __ecereUnregisterModule_ecs_main(struct __ecereNameSpace__ecere__com__Instance * module)
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
void *  bindingsClass;
} ecere_gcc_struct;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Application;

int main(int _argc, char * _argv[])
{
int exitCode;
struct __ecereNameSpace__ecere__com__Instance * module;
unsigned int setThingsUp = !__thisModule;
__attribute__((unused)) struct __ecereNameSpace__ecere__com__Class * _class;
__attribute__((unused)) struct __ecereNameSpace__ecere__com__Method * method;
__attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * _property;

if(setThingsUp)
__thisModule = __ecereNameSpace__ecere__com____ecere_COM_Initialize((unsigned int)1, _argc, (void *)_argv);
__currentModule = module = __thisModule;
if(!__ecereNameSpace__ecere__com__eModule_LoadStatic(module, "ec", 2, (void *)(__ecereDll_Load_ec), (void *)(__ecereDll_Unload_ec)))
printf("Error loading eC module \"%s\" (statically linked)\nThings might go very wrong.\n", "ec");
if(!__ecereNameSpace__ecere__com__eModule_LoadStatic(module, "ecere", 2, (void *)(__ecereDll_Load_ecere), (void *)(__ecereDll_Unload_ecere)))
printf("Error loading eC module \"%s\" (statically linked)\nThings might go very wrong.\n", "ecere");
__ecereRegisterModule_ecs(module);
__ecereClass_char__PTR_ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "char *");
__ecereClass___ecereNameSpace__ecere__com__Application = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Application");
__ecereClass___ecereNameSpace__ecere__com__List_TPL_String_ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::List<String>");
__ecereClass___ecereNameSpace__ecere__com__Map_TPL_ContextStringPair__ecere__com__List_TPL_String___ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Map<ContextStringPair, ecere::com::List<String> >");
__ecereClass___ecereNameSpace__ecere__com__Module = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Module");
__ecereClass_ClassImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ClassImport");
__ecereClass_Context = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Context");
__ecereClass_FunctionImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "FunctionImport");
__ecereClass_ImportedModule = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ImportedModule");
__ecereClass_MethodImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "MethodImport");
__ecereClass_ModuleImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ModuleImport");
__ecereClass_PropertyImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "PropertyImport");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Container");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Add", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Free", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_Free = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "RemoveAll", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll = method->vid;
__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::CustomAVLTree");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Iterator");
__ecereProp___ecereNameSpace__ecere__com__Iterator_data = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "data", module);
__ecereClass___ecereNameSpace__ecere__com__List = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::List");
__ecereClass___ecereNameSpace__ecere__com__Map = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Map");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::MapIterator");
__ecereProp___ecereNameSpace__ecere__com__MapIterator_key = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "key", module);
__ecereProp___ecereNameSpace__ecere__com__MapIterator_map = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "map", module);
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Platform");
__ecereProp___ecereNameSpace__ecere__com__Platform_char__PTR_ = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "char *", module);
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::BTNode");
__ecereProp___ecereNameSpace__ecere__sys__BTNode_next = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "next", module);
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::BinaryTree");
__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "first", module);
__ecereClass___ecereNameSpace__ecere__sys__File = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::File");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "Eof", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "Puts", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "Read", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "Seek", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "Write", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write = method->vid;
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::OldList");
__ecereClass___ecereNameSpace__ecere__sys__TempFile = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::TempFile");
__ecereNameSpace__ecere__LoadTranslatedStrings((((void *)0)), "ecs");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(__currentModule, "SymbolgenApp");
if(setThingsUp)
__ecereNameSpace__ecere__com__eInstance_Evolve((struct __ecereNameSpace__ecere__com__Instance **)&__currentModule, _class);
__thisModule = __currentModule;
__ecereCreateModuleInstances_ecs();
((void (*)(void *))(void *)((struct __ecereNameSpace__ecere__com__Instance *)(char *)__currentModule)->_vTbl[12])(__currentModule);
__ecereDestroyModuleInstances_ecs();
__ecereNameSpace__ecere__UnloadTranslatedStrings("ecs");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(__currentModule, "ecere::com::Application");
exitCode = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Instance *)__currentModule) + sizeof(struct __ecereNameSpace__ecere__com__Module) + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->exitCode;
(__ecereNameSpace__ecere__com__eInstance_DecRef(__currentModule), __currentModule = 0);
return exitCode;
}

