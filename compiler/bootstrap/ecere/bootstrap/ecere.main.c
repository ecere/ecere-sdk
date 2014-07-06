/* Code generated from eC source file: ecere.main.ec */
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
#   else
#      define ecere_stdcall __stdcall
#   endif
#else
#   define ecere_stdcall
#endif
#include <stdint.h>
#include <sys/types.h>
int __ecereVMethodID_class_OnCompare;

int __ecereVMethodID_class_OnCopy;

int __ecereVMethodID_class_OnEdit;

int __ecereVMethodID_class_OnFree;

int __ecereVMethodID_class_OnGetDataFromString;

int __ecereVMethodID_class_OnGetString;

int __ecereVMethodID_class_OnSaveEdit;

int __ecereVMethodID_class_OnSerialize;

int __ecereVMethodID_class_OnUnserialize;

void * __ecereProp_double_Get_isInf;

void * __ecereProp_double_Get_isNan;

void * __ecereProp_double_Get_signBit;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Add;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Copy;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Delete;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Find;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Free;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_FreeIterator;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetAtPosition;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetCount;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetData;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetFirst;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetLast;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetNext;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetPrev;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Insert;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Move;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Remove;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_RemoveAll;

int __ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_SetData;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_AddObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_CreateNew;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_CreateObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_DestroyObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_DroppedObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_FixProperty;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_ListToolBoxClasses;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_PostCreateObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_PrepareTestObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_Reset;

int __ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_SelectObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Copy;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Delete;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Find;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Free;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_FreeIterator;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetCount;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetLast;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetPrev;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Insert;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Move;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_AddDefaultMethod;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_AddToolBoxClass;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_CodeAddObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_DeleteObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_FindObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_ModifyCode;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_ObjectContainsCode;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_RenameObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_SelectObjectFromDesigner;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_SheetAddObject;

int __ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_UpdateProperties;

int __ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData;

int __ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Close;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseInput;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseOutput;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Lock;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Putc;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Tell;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Truncate;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Unlock;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_CloseDir;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_Exists;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_Find;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_FindNext;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_FixCase;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_GetSize;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_Open;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_OpenArchive;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_QuerySize;

int __ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_Stats;

void * __ecereProp_float_Get_isInf;

void * __ecereProp_float_Get_isNan;

void * __ecereProp_float_Get_signBit;

void __ecereCreateModuleInstances_System();

void __ecereDestroyModuleInstances_System();

void __ecereCreateModuleInstances_i18n();

void __ecereDestroyModuleInstances_i18n();

struct __ecereNameSpace__ecere__sys__OldList
{
void *  first;
void *  last;
int count;
unsigned int offset;
unsigned int circ;
} __attribute__ ((gcc_struct));

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

extern void __ecereNameSpace__ecere__LoadTranslatedStrings(const char * moduleName, const char *  name);

extern void __ecereNameSpace__ecere__UnloadTranslatedStrings(const char * name);

struct __ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Instance
{
void * *  _vTbl;
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
} __attribute__ ((gcc_struct));

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name);

extern void __ecereNameSpace__ecere__com__eClass_SetProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, long long value);

struct __ecereNameSpace__ecere__com__Class * __ecereClass_String;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_bool;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_char__PTR_;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_double;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__AVLNode;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Application;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Array;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Array_TPL_String_;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Array_TPL_ecere__com__Array_TPL_String___;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BuiltInContainer;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Container;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__CustomAVLTree;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IteratorPointer;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__LinkList;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ListItem;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map_TPL_String__const_String_;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map_TPL_String__ecere__com__Map_TPL_String__const_String___;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Module;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BTNode;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__File;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldLink;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__StringBTNode;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_float;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_int;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_int64;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_uint;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_uint64;

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
struct __ecereNameSpace__ecere__com__Instance * dataType;
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

extern void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

extern void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object);

extern void __ecereNameSpace__ecere__com__eInstance_Watch(void *  instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

struct __ecereNameSpace__ecere__com__Property * __ecereProp_double_isInf;

struct __ecereNameSpace__ecere__com__Property * __ecereProp_double_isNan;

struct __ecereNameSpace__ecere__com__Property * __ecereProp_double_signBit;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_maximum;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_minimum;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_next;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__AVLNode_prev;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Class_char__PTR_;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Container_copySrc;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Iterator_data;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_map;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_count;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_maximum;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_minimum;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_next;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__File_buffered;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__File_input;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__File_output;

struct __ecereNameSpace__ecere__com__Property * __ecereProp_float_isInf;

struct __ecereNameSpace__ecere__com__Property * __ecereProp_float_isNan;

struct __ecereNameSpace__ecere__com__Property * __ecereProp_float_signBit;

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
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
struct __ecereNameSpace__ecere__com__Instance * dataType;
int memberAccess;
} __attribute__ ((gcc_struct));

struct __ecereNameSpace__ecere__com__Module;

static struct __ecereNameSpace__ecere__com__Instance * __currentModule;

void __ecereRegisterModule_BufferedFile(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_BufferedFile(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_DualPipe(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_DualPipe(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_File(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_File(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_memory(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_memory(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_System(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_System(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_TempFile(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_TempFile(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_i18n(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_i18n(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_Array(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_Array(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_AVLTree(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_AVLTree(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_BuiltInContainer(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_BuiltInContainer(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_Container(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_Container(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_CustomAVLTree(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_CustomAVLTree(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_LinkList(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_LinkList(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_List(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_List(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_Map(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_Map(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_BinaryTree(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_BinaryTree(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_BTNode(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_BTNode(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_dataTypes(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_dataTypes(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_instance(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_instance(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_String(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_String(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereRegisterModule_OldList(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_OldList(struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, const char *  name);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

unsigned int __ecereDll_Unload_ecere(struct __ecereNameSpace__ecere__com__Instance * module)
{
if(__currentModule == module)
{
__ecereDestroyModuleInstances_System();
__ecereNameSpace__ecere__UnloadTranslatedStrings("ecere");
__ecereDestroyModuleInstances_i18n();
}
__ecereUnregisterModule_BufferedFile(module);
__ecereUnregisterModule_DualPipe(module);
__ecereUnregisterModule_File(module);
__ecereUnregisterModule_memory(module);
__ecereUnregisterModule_System(module);
__ecereUnregisterModule_TempFile(module);
__ecereUnregisterModule_i18n(module);
__ecereUnregisterModule_Array(module);
__ecereUnregisterModule_AVLTree(module);
__ecereUnregisterModule_BuiltInContainer(module);
__ecereUnregisterModule_Container(module);
__ecereUnregisterModule_CustomAVLTree(module);
__ecereUnregisterModule_LinkList(module);
__ecereUnregisterModule_List(module);
__ecereUnregisterModule_Map(module);
__ecereUnregisterModule_BinaryTree(module);
__ecereUnregisterModule_BTNode(module);
__ecereUnregisterModule_dataTypes(module);
__ecereUnregisterModule_instance(module);
__ecereUnregisterModule_String(module);
__ecereUnregisterModule_OldList(module);
if(__currentModule == module)
__currentModule = (void *)0;
return 1;
}

unsigned int __ecereDll_Load_ecere(struct __ecereNameSpace__ecere__com__Instance * module)
{
__attribute__((unused)) struct __ecereNameSpace__ecere__com__Class * _class;
__attribute__((unused)) struct __ecereNameSpace__ecere__com__Method * method;
__attribute__((unused)) struct __ecereNameSpace__ecere__com__Property * _property;

if(!__currentModule)
{
__currentModule = module;
}
__ecereRegisterModule_BufferedFile(module);
__ecereRegisterModule_DualPipe(module);
__ecereRegisterModule_File(module);
__ecereRegisterModule_memory(module);
__ecereRegisterModule_System(module);
__ecereRegisterModule_TempFile(module);
__ecereRegisterModule_i18n(module);
__ecereRegisterModule_Array(module);
__ecereRegisterModule_AVLTree(module);
__ecereRegisterModule_BuiltInContainer(module);
__ecereRegisterModule_Container(module);
__ecereRegisterModule_CustomAVLTree(module);
__ecereRegisterModule_LinkList(module);
__ecereRegisterModule_List(module);
__ecereRegisterModule_Map(module);
__ecereRegisterModule_BinaryTree(module);
__ecereRegisterModule_BTNode(module);
__ecereRegisterModule_dataTypes(module);
__ecereRegisterModule_instance(module);
__ecereRegisterModule_String(module);
__ecereRegisterModule_OldList(module);
if(__currentModule == module)
{
__ecereClass_String = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "String");
__ecereClass_bool = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "bool");
__ecereClass_char__PTR_ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "char *");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "class");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "OnCompare", module);
if(method)
__ecereVMethodID_class_OnCompare = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "OnCopy", module);
if(method)
__ecereVMethodID_class_OnCopy = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "OnEdit", module);
if(method)
__ecereVMethodID_class_OnEdit = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "OnFree", module);
if(method)
__ecereVMethodID_class_OnFree = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "OnGetDataFromString", module);
if(method)
__ecereVMethodID_class_OnGetDataFromString = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "OnGetString", module);
if(method)
__ecereVMethodID_class_OnGetString = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "OnSaveEdit", module);
if(method)
__ecereVMethodID_class_OnSaveEdit = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "OnSerialize", module);
if(method)
__ecereVMethodID_class_OnSerialize = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "OnUnserialize", module);
if(method)
__ecereVMethodID_class_OnUnserialize = method->vid;
__ecereClass_double = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "double");
__ecereProp_double_isInf = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass_double, "isInf", module);
__ecereProp_double_Get_isInf = _property->Get;
__ecereProp_double_isNan = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass_double, "isNan", module);
__ecereProp_double_Get_isNan = _property->Get;
__ecereProp_double_signBit = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass_double, "signBit", module);
__ecereProp_double_Get_signBit = _property->Get;
__ecereClass___ecereNameSpace__ecere__com__AVLNode = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::AVLNode");
__ecereProp___ecereNameSpace__ecere__com__AVLNode_maximum = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__com__AVLNode, "maximum", module);
__ecereProp___ecereNameSpace__ecere__com__AVLNode_minimum = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__com__AVLNode, "minimum", module);
__ecereProp___ecereNameSpace__ecere__com__AVLNode_next = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__com__AVLNode, "next", module);
__ecereProp___ecereNameSpace__ecere__com__AVLNode_prev = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__com__AVLNode, "prev", module);
__ecereClass___ecereNameSpace__ecere__com__Application = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Application");
__ecereClass___ecereNameSpace__ecere__com__Array = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Array");
__ecereClass___ecereNameSpace__ecere__com__Array_TPL_String_ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Array<const String>");
__ecereClass___ecereNameSpace__ecere__com__Array_TPL_ecere__com__Array_TPL_String___ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Array<ecere::com::Array<const String> >");
__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::BuiltInContainer");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "Add", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Add = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "Copy", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Copy = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "Delete", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Delete = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "Find", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Find = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "Free", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Free = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "FreeIterator", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_FreeIterator = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "GetAtPosition", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetAtPosition = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "GetCount", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetCount = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "GetData", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetData = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "GetFirst", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetFirst = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "GetLast", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetLast = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "GetNext", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetNext = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "GetPrev", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_GetPrev = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "Insert", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Insert = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "Move", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Move = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "Remove", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_Remove = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "RemoveAll", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_RemoveAll = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__BuiltInContainer, "SetData", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__BuiltInContainer_SetData = method->vid;
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Class");
__ecereProp___ecereNameSpace__ecere__com__Class_char__PTR_ = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "char *", module);
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::ClassDesignerBase");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "AddObject", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_AddObject = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "CreateNew", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_CreateNew = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "CreateObject", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_CreateObject = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "DestroyObject", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_DestroyObject = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "DroppedObject", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_DroppedObject = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "FixProperty", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_FixProperty = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "ListToolBoxClasses", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_ListToolBoxClasses = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "PostCreateObject", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_PostCreateObject = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "PrepareTestObject", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_PrepareTestObject = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Reset", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_Reset = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "SelectObject", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__ClassDesignerBase_SelectObject = method->vid;
__ecereClass___ecereNameSpace__ecere__com__Container = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Container");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "Add", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_Add = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "Copy", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_Copy = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "Delete", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_Delete = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "Find", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_Find = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "Free", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_Free = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "FreeIterator", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_FreeIterator = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "GetAtPosition", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetAtPosition = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "GetCount", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetCount = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "GetData", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetData = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "GetFirst", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "GetLast", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetLast = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "GetNext", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetNext = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "GetPrev", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_GetPrev = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "Insert", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_Insert = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "Move", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_Move = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "Remove", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "RemoveAll", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__com__Container, "SetData", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_SetData = method->vid;
__ecereProp___ecereNameSpace__ecere__com__Container_copySrc = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__com__Container, "copySrc", module);
__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::CustomAVLTree");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::DesignerBase");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "AddDefaultMethod", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_AddDefaultMethod = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "AddToolBoxClass", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_AddToolBoxClass = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "CodeAddObject", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_CodeAddObject = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "DeleteObject", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_DeleteObject = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "FindObject", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_FindObject = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "ModifyCode", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_ModifyCode = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "ObjectContainsCode", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_ObjectContainsCode = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "RenameObject", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_RenameObject = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "SelectObjectFromDesigner", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_SelectObjectFromDesigner = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "SheetAddObject", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_SheetAddObject = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "UpdateProperties", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__DesignerBase_UpdateProperties = method->vid;
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::IOChannel");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "ReadData", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_ReadData = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "WriteData", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__IOChannel_WriteData = method->vid;
__ecereClass___ecereNameSpace__ecere__com__Instance = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Instance");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Iterator");
__ecereProp___ecereNameSpace__ecere__com__Iterator_data = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "data", module);
__ecereClass___ecereNameSpace__ecere__com__IteratorPointer = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::IteratorPointer");
__ecereClass___ecereNameSpace__ecere__com__LinkList = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::LinkList");
__ecereClass___ecereNameSpace__ecere__com__ListItem = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::ListItem");
__ecereClass___ecereNameSpace__ecere__com__Map = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Map");
__ecereClass___ecereNameSpace__ecere__com__Map_TPL_String__const_String_ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Map<const String, const String>");
__ecereClass___ecereNameSpace__ecere__com__Map_TPL_String__ecere__com__Map_TPL_String__const_String___ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Map<const String, ecere::com::Map<const String, const String> >");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::MapIterator");
__ecereProp___ecereNameSpace__ecere__com__MapIterator_map = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "map", module);
__ecereClass___ecereNameSpace__ecere__com__Module = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Module");
__ecereClass___ecereNameSpace__ecere__sys__BTNode = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::BTNode");
__ecereProp___ecereNameSpace__ecere__sys__BTNode_count = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__sys__BTNode, "count", module);
__ecereProp___ecereNameSpace__ecere__sys__BTNode_maximum = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__sys__BTNode, "maximum", module);
__ecereProp___ecereNameSpace__ecere__sys__BTNode_minimum = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__sys__BTNode, "minimum", module);
__ecereProp___ecereNameSpace__ecere__sys__BTNode_next = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__sys__BTNode, "next", module);
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::BinaryTree");
__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "first", module);
__ecereClass___ecereNameSpace__ecere__sys__File = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::File");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "Close", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Close = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "CloseInput", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseInput = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "CloseOutput", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_CloseOutput = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "Eof", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "GetSize", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "Getc", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Getc = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "Lock", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Lock = method->vid;
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
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "Tell", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Tell = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "Truncate", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Truncate = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "Unlock", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Unlock = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(__ecereClass___ecereNameSpace__ecere__sys__File, "Write", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write = method->vid;
__ecereProp___ecereNameSpace__ecere__sys__File_buffered = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__sys__File, "buffered", module);
__ecereProp___ecereNameSpace__ecere__sys__File_input = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__sys__File, "input", module);
__ecereProp___ecereNameSpace__ecere__sys__File_output = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__sys__File, "output", module);
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::FileSystem");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "CloseDir", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_CloseDir = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Exists", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_Exists = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Find", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_Find = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "FindNext", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_FindNext = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "FixCase", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_FixCase = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "GetSize", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_GetSize = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Open", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_Open = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "OpenArchive", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_OpenArchive = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "QuerySize", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_QuerySize = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Stats", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__FileSystem_Stats = method->vid;
__ecereClass___ecereNameSpace__ecere__sys__OldLink = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::OldLink");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::OldList");
__ecereClass___ecereNameSpace__ecere__sys__StringBTNode = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::StringBTNode");
__ecereClass___ecereNameSpace__ecere__sys__TempFile = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::TempFile");
__ecereClass_float = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "float");
__ecereProp_float_isInf = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass_float, "isInf", module);
__ecereProp_float_Get_isInf = _property->Get;
__ecereProp_float_isNan = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass_float, "isNan", module);
__ecereProp_float_Get_isNan = _property->Get;
__ecereProp_float_signBit = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass_float, "signBit", module);
__ecereProp_float_Get_signBit = _property->Get;
__ecereClass_int = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "int");
__ecereClass_int64 = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "int64");
__ecereClass_uint = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "uint");
__ecereClass_uint64 = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "uint64");
__ecereCreateModuleInstances_i18n();
__ecereNameSpace__ecere__LoadTranslatedStrings("ecere", "ecere");
}
if(__currentModule == module)
{
__ecereCreateModuleInstances_System();
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
} __attribute__ ((gcc_struct));

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

void __ecereRegisterModule_ecere_main(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

}

void __ecereUnregisterModule_ecere_main(struct __ecereNameSpace__ecere__com__Instance * module)
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
struct __ecereNameSpace__ecere__com__Instance * dataType;
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
struct __ecereNameSpace__ecere__com__Instance * dataType;
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

