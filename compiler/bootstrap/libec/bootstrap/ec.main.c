/* Code generated from eC source file: ec.main.ec */
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
__attribute__((__common__)) int __ecereVMethodID_class_OnGetString;

__attribute__((__common__)) int (* __ecereMethod_double_inf)();

__attribute__((__common__)) int (* __ecereMethod_double_nan)();

__attribute__((__common__)) void * __ecereProp_double_Get_isInf;

__attribute__((__common__)) void * __ecereProp_double_Get_isNan;

__attribute__((__common__)) void * __ecereProp_double_Get_signBit;

__attribute__((__common__)) int (* __ecereMethod_float_inf)();

__attribute__((__common__)) int (* __ecereMethod_float_nan)();

__attribute__((__common__)) void * __ecereProp_float_Get_isInf;

__attribute__((__common__)) void * __ecereProp_float_Get_isNan;

__attribute__((__common__)) void * __ecereProp_float_Get_signBit;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Free;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Putc;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

__attribute__((__common__)) int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

void __ecereCreateModuleInstances_ast();

void __ecereDestroyModuleInstances_ast();

void __ecereCreateModuleInstances_loadSymbols();

void __ecereDestroyModuleInstances_loadSymbols();

void __ecereCreateModuleInstances_pass1();

void __ecereDestroyModuleInstances_pass1();

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

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_AsmField;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_Attrib;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_Attribute;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassDef;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassDefinition;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassFunction;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassImport;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_Context;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBIndexItem;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBTableDef;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBTableEntry;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_DataRedefinition;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declaration;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declarator;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_DeclaratorType;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_Enumerator;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_Expression;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_ExtDecl;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_External;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionDefinition;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionImport;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_GlobalData;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_Identifier;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_ImportedModule;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_InitDeclarator;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_Initializer;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_Instantiation;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_MemberInit;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_MembersInit;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_MethodImport;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_ModuleImport;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_Pointer;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyDef;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyImport;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyWatch;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_Specifier;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_Statement;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_String;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_Symbol;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateArgument;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateDatatype;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateParameter;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplatedType;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_TopoEdge;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_Type;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_TypeName;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_char__PTR_;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Application;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__LinkList_TPL_TopoEdge__link__EQU__in_;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__LinkList_TPL_TopoEdge__link__EQU__out_;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List_TPL_ClassPropertyValue_;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List_TPL_Location_;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List_TPL_ecere__com__Module_;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map_TPL_ContextStringPair__ecere__com__List_TPL_Location___;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map_TPL_String__ecere__com__List_TPL_ecere__com__Module___;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Module;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_int;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass_uint;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__CustomAVLTree;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__LinkList;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__TemplateMemberType;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BTNode;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__File;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__NamedLink64;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

extern void __ecereNameSpace__ecere__com__eInstance_SetMethod(struct __ecereNameSpace__ecere__com__Instance * instance, const char *  name, void *  function);

extern void __ecereNameSpace__ecere__com__eInstance_IncRef(struct __ecereNameSpace__ecere__com__Instance * instance);

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

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp_Type_isPointerType;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp_Type_isPointerTypeSize;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp_Type_specConst;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp_double_isInf;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp_double_isNan;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp_double_signBit;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp_float_isInf;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp_float_isNan;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp_float_signBit;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Iterator_data;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_key;

__attribute__((__common__)) struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_map;

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

unsigned int __ecereDll_Load_ecere(struct __ecereNameSpace__ecere__com__Instance * module);

unsigned int __ecereDll_Unload_ecere(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_ast(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_ast(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_copy(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_copy(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_dbpass(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_dbpass(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_ecdefs(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_ecdefs(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_expression(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_expression(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_firstPass(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_firstPass(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_freeAst(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_freeAst(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_grammar(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_grammar(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_lexer(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_lexer(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_loadSymbols(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_loadSymbols(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_output(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_output(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_pass0(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_pass0(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_pass1(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_pass1(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_pass15(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_pass15(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_pass16(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_pass16(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_pass2(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_pass2(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_pass3(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_pass3(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_shortcuts(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_shortcuts(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_type(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_type(struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__eModule_LoadStatic(struct __ecereNameSpace__ecere__com__Instance * fromModule, const char *  name, int importAccess, unsigned int (*  Load)(struct __ecereNameSpace__ecere__com__Instance * module), unsigned int (*  Unload)(struct __ecereNameSpace__ecere__com__Instance * module));

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, const char *  name);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

unsigned int __ecereDll_Unload_ec(struct __ecereNameSpace__ecere__com__Instance * module)
{
if(__currentModule == module)
{
__ecereDestroyModuleInstances_pass1();
__ecereDestroyModuleInstances_loadSymbols();
__ecereDestroyModuleInstances_ast();
__ecereNameSpace__ecere__UnloadTranslatedStrings("ec");
}
__ecereUnregisterModule_ast(module);
__ecereUnregisterModule_copy(module);
__ecereUnregisterModule_dbpass(module);
__ecereUnregisterModule_ecdefs(module);
__ecereUnregisterModule_expression(module);
__ecereUnregisterModule_firstPass(module);
__ecereUnregisterModule_freeAst(module);
__ecereUnregisterModule_grammar(module);
__ecereUnregisterModule_lexer(module);
__ecereUnregisterModule_loadSymbols(module);
__ecereUnregisterModule_output(module);
__ecereUnregisterModule_pass0(module);
__ecereUnregisterModule_pass1(module);
__ecereUnregisterModule_pass15(module);
__ecereUnregisterModule_pass16(module);
__ecereUnregisterModule_pass2(module);
__ecereUnregisterModule_pass3(module);
__ecereUnregisterModule_shortcuts(module);
__ecereUnregisterModule_type(module);
if(__currentModule == module)
__currentModule = (void *)0;
return 1;
}

unsigned int __ecereDll_Load_ec(struct __ecereNameSpace__ecere__com__Instance * module)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__Class * _class;
__attribute__((unused)) struct __ecereNameSpace__ecere__com__Method * method;
__attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * _property;

if(!__currentModule)
{
__currentModule = module;
}
if(!__ecereNameSpace__ecere__com__eModule_LoadStatic(module, "ecere", 1, (void *)(__ecereDll_Load_ecere), (void *)(__ecereDll_Unload_ecere)))
printf("Error loading eC module \"%s\" (statically linked)\nThings might go very wrong.\n", "ecere");
__ecereRegisterModule_ast(module);
__ecereRegisterModule_copy(module);
__ecereRegisterModule_dbpass(module);
__ecereRegisterModule_ecdefs(module);
__ecereRegisterModule_expression(module);
__ecereRegisterModule_firstPass(module);
__ecereRegisterModule_freeAst(module);
__ecereRegisterModule_grammar(module);
__ecereRegisterModule_lexer(module);
__ecereRegisterModule_loadSymbols(module);
__ecereRegisterModule_output(module);
__ecereRegisterModule_pass0(module);
__ecereRegisterModule_pass1(module);
__ecereRegisterModule_pass15(module);
__ecereRegisterModule_pass16(module);
__ecereRegisterModule_pass2(module);
__ecereRegisterModule_pass3(module);
__ecereRegisterModule_shortcuts(module);
__ecereRegisterModule_type(module);
if(__currentModule == module)
{
__ecereClass_AsmField = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "AsmField");
__ecereClass_Attrib = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Attrib");
__ecereClass_Attribute = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Attribute");
__ecereClass_ClassDef = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ClassDef");
__ecereClass_ClassDefinition = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ClassDefinition");
__ecereClass_ClassFunction = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ClassFunction");
__ecereClass_ClassImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ClassImport");
__ecereClass_Context = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Context");
__ecereClass_DBIndexItem = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "DBIndexItem");
__ecereClass_DBTableDef = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "DBTableDef");
__ecereClass_DBTableEntry = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "DBTableEntry");
__ecereClass_DataRedefinition = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "DataRedefinition");
__ecereClass_Declaration = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Declaration");
__ecereClass_Declarator = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Declarator");
__ecereClass_DeclaratorType = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "DeclaratorType");
__ecereClass_Enumerator = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Enumerator");
__ecereClass_Expression = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Expression");
__ecereClass_ExtDecl = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ExtDecl");
__ecereClass_External = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "External");
__ecereClass_FunctionDefinition = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "FunctionDefinition");
__ecereClass_FunctionImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "FunctionImport");
__ecereClass_GlobalData = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "GlobalData");
__ecereClass_Identifier = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Identifier");
__ecereClass_ImportedModule = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ImportedModule");
__ecereClass_InitDeclarator = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "InitDeclarator");
__ecereClass_Initializer = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Initializer");
__ecereClass_Instantiation = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Instantiation");
__ecereClass_MemberInit = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "MemberInit");
__ecereClass_MembersInit = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "MembersInit");
__ecereClass_MethodImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "MethodImport");
__ecereClass_ModuleImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ModuleImport");
__ecereClass_Pointer = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Pointer");
__ecereClass_PropertyDef = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "PropertyDef");
__ecereClass_PropertyImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "PropertyImport");
__ecereClass_PropertyWatch = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "PropertyWatch");
__ecereClass_Specifier = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Specifier");
__ecereClass_Statement = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Statement");
__ecereClass_String = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "String");
__ecereClass_Symbol = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Symbol");
__ecereClass_TemplateArgument = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "TemplateArgument");
__ecereClass_TemplateDatatype = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "TemplateDatatype");
__ecereClass_TemplateParameter = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "TemplateParameter");
__ecereClass_TemplatedType = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "TemplatedType");
__ecereClass_TopoEdge = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "TopoEdge");
__ecereClass_Type = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Type");
__ecereProp_Type_isPointerType = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass_Type, "isPointerType", module);
__ecereProp_Type_isPointerTypeSize = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass_Type, "isPointerTypeSize", module);
__ecereProp_Type_specConst = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass_Type, "specConst", module);
__ecereClass_TypeName = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "TypeName");
__ecereClass_char__PTR_ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "char *");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "class");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "OnGetString", module);
if(method)
__ecereVMethodID_class_OnGetString = method->vid;
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "double");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "inf", module);
if(method)
__ecereMethod_double_inf = method->function;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "nan", module);
if(method)
__ecereMethod_double_nan = method->function;
__ecereProp_double_isInf = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "isInf", module);
if(_property)
__ecereProp_double_Get_isInf = _property->Get;
__ecereProp_double_isNan = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "isNan", module);
if(_property)
__ecereProp_double_Get_isNan = _property->Get;
__ecereProp_double_signBit = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "signBit", module);
if(_property)
__ecereProp_double_Get_signBit = _property->Get;
__ecereClass___ecereNameSpace__ecere__com__Application = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Application");
__ecereClass___ecereNameSpace__ecere__com__Instance = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Instance");
__ecereClass___ecereNameSpace__ecere__com__LinkList_TPL_TopoEdge__link__EQU__in_ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::LinkList<TopoEdge, link = in>");
__ecereClass___ecereNameSpace__ecere__com__LinkList_TPL_TopoEdge__link__EQU__out_ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::LinkList<TopoEdge, link = out>");
__ecereClass___ecereNameSpace__ecere__com__List_TPL_ClassPropertyValue_ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::List<ClassPropertyValue>");
__ecereClass___ecereNameSpace__ecere__com__List_TPL_Location_ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::List<Location>");
__ecereClass___ecereNameSpace__ecere__com__List_TPL_ecere__com__Module_ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::List<ecere::com::Module>");
__ecereClass___ecereNameSpace__ecere__com__Map_TPL_ContextStringPair__ecere__com__List_TPL_Location___ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Map<ContextStringPair, ecere::com::List<Location> >");
__ecereClass___ecereNameSpace__ecere__com__Map_TPL_String__ecere__com__List_TPL_ecere__com__Module___ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Map<String, ecere::com::List<ecere::com::Module> >");
__ecereClass___ecereNameSpace__ecere__com__Module = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Module");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "float");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "inf", module);
if(method)
__ecereMethod_float_inf = method->function;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "nan", module);
if(method)
__ecereMethod_float_nan = method->function;
__ecereProp_float_isInf = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "isInf", module);
if(_property)
__ecereProp_float_Get_isInf = _property->Get;
__ecereProp_float_isNan = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "isNan", module);
if(_property)
__ecereProp_float_Get_isNan = _property->Get;
__ecereProp_float_signBit = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "signBit", module);
if(_property)
__ecereProp_float_Get_signBit = _property->Get;
__ecereClass_int = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "int");
__ecereClass_uint = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "uint");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Container");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Add", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Free", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_Free = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "GetFirst", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "GetNext", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Remove", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove = method->vid;
__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::CustomAVLTree");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Iterator");
__ecereProp___ecereNameSpace__ecere__com__Iterator_data = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "data", module);
__ecereClass___ecereNameSpace__ecere__com__LinkList = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::LinkList");
__ecereClass___ecereNameSpace__ecere__com__List = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::List");
__ecereClass___ecereNameSpace__ecere__com__Map = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Map");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::MapIterator");
__ecereProp___ecereNameSpace__ecere__com__MapIterator_key = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "key", module);
__ecereProp___ecereNameSpace__ecere__com__MapIterator_map = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "map", module);
__ecereClass___ecereNameSpace__ecere__com__TemplateMemberType = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::TemplateMemberType");
__ecereClass___ecereNameSpace__ecere__sys__BTNode = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::BTNode");
__ecereProp___ecereNameSpace__ecere__sys__BTNode_next = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__sys__BTNode, "next", module);
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::BinaryTree");
__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "first", module);
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::DualPipe");
__ecereClass___ecereNameSpace__ecere__sys__File = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::File");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "Eof", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "GetSize", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "Putc", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Putc = method->vid;
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
__ecereClass___ecereNameSpace__ecere__sys__NamedLink64 = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::NamedLink64");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::OldList");
__ecereClass___ecereNameSpace__ecere__sys__TempFile = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::TempFile");
__ecereNameSpace__ecere__LoadTranslatedStrings("ec", "ec");
}
if(__currentModule == module)
{
__ecereCreateModuleInstances_ast();
__ecereCreateModuleInstances_loadSymbols();
__ecereCreateModuleInstances_pass1();
}
return 1;
}

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

void __ecereRegisterModule_ec_main(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

}

void __ecereUnregisterModule_ec_main(struct __ecereNameSpace__ecere__com__Instance * module)
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

