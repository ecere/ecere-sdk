/* Code generated from eC source file: i18n.ec */
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
static struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__moduleMaps;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_map;

extern struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Iterator_data;

struct __ecereNameSpace__ecere__sys__OldList
{
void *  first;
void *  last;
int count;
unsigned int offset;
unsigned int circ;
} ecere_gcc_struct;

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

struct __ecereNameSpace__ecere__sys__File
{
void *  input;
void *  output;
} ecere_gcc_struct;

extern char *  __ecereNameSpace__ecere__sys__GetEnvironment(const char *  envName, char *  envValue, int max);

extern char *  strcpy(char * , const char * );

extern char *  strstr(const char * , const char * );

extern int strcasecmp(const char * , const char * );

extern char *  strchr(const char * , int);

extern int sprintf(char * , const char * , ...);

struct __ecereNameSpace__ecere__com__IteratorPointer;

extern int printf(const char * , ...);

struct __ecereNameSpace__ecere__com__GlobalFunction;

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

struct __ecereNameSpace__ecere__com__MapIterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__Iterator
{
struct __ecereNameSpace__ecere__com__Instance * container;
struct __ecereNameSpace__ecere__com__IteratorPointer * pointer;
} ecere_gcc_struct;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Free;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Delete;

struct __ecereNameSpace__ecere__com__Instance * __ecereProp___ecereNameSpace__ecere__com__MapIterator_Get_map(struct __ecereNameSpace__ecere__com__MapIterator * this);

void __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(struct __ecereNameSpace__ecere__com__MapIterator * this, struct __ecereNameSpace__ecere__com__Instance * value);

unsigned int __ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(struct __ecereNameSpace__ecere__com__Iterator * this, const uint64 index, unsigned int create);

uint64 __ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(struct __ecereNameSpace__ecere__com__Iterator * this);

void __ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(struct __ecereNameSpace__ecere__com__Iterator * this, uint64 value);

void __ecereDestroyModuleInstances_i18n()
{
(__ecereNameSpace__ecere__com__eInstance_DecRef(__ecereNameSpace__ecere__moduleMaps), __ecereNameSpace__ecere__moduleMaps = 0);
}

const char * __ecereNameSpace__ecere__GetTranslatedString(const char * name, const char * string, const char * stringAndContext)
{
struct __ecereNameSpace__ecere__com__Instance * textMap = __ecereNameSpace__ecere__moduleMaps ? (((struct __ecereNameSpace__ecere__com__Instance *)((uintptr_t)(__extension__ ({
struct __ecereNameSpace__ecere__com__Iterator __internalIterator =
{
__ecereNameSpace__ecere__moduleMaps, 0
};

__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(&__internalIterator, ((uint64)(uintptr_t)(name)), 0);
((struct __ecereNameSpace__ecere__com__Instance *)(uintptr_t)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&__internalIterator));
}))))) : (((void *)0));
const char * result = textMap ? (((const char *)((uintptr_t)(__extension__ ({
struct __ecereNameSpace__ecere__com__Iterator __internalIterator =
{
textMap, 0
};

__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(&__internalIterator, ((uint64)(uintptr_t)(stringAndContext ? stringAndContext : string)), 0);
((char *)(uintptr_t)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data(&__internalIterator));
}))))) : string;

return (result && result[0]) ? result : string;
}

struct __ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, uintptr_t a, uintptr_t b);
void (*  FreeKey)(void *  key);
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__DataMember;

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
} ecere_gcc_struct;

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
} ecere_gcc_struct;

extern void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

extern void __ecereNameSpace__ecere__com__eInstance_StopWatching(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, struct __ecereNameSpace__ecere__com__Instance * object);

extern void __ecereNameSpace__ecere__com__eInstance_Watch(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

struct __ecereNameSpace__ecere__com__Method;

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
} ecere_gcc_struct;

struct __ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(const char *  name, const char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

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
void *  bindingsClass;
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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map_TPL_String__ecere__com__Map_TPL_String__const_String___;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map_TPL_String__const_String_;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__File;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map;

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

void __ecereCreateModuleInstances_i18n()
{
__ecereNameSpace__ecere__moduleMaps = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__Map_TPL_String__ecere__com__Map_TPL_String__const_String___);
__ecereNameSpace__ecere__com__eInstance_IncRef(__ecereNameSpace__ecere__moduleMaps);
}

void __ecereNameSpace__ecere__LoadTranslatedStrings(const char * moduleName, const char * name)
{
struct __ecereNameSpace__ecere__com__Instance * f;
char fileName[797];
char lcAll[256];
char language[256];
char lang[256];
char lcMessages[256];
char * locale = (((void *)0));
char genericLocale[256];

genericLocale[0] = 0;
if(__ecereNameSpace__ecere__sys__GetEnvironment("ECERE_LANGUAGE", language, sizeof (language)))
locale = language;
else if(__ecereNameSpace__ecere__sys__GetEnvironment("LANGUAGE", language, sizeof (language)))
locale = language;
else if(__ecereNameSpace__ecere__sys__GetEnvironment("LC_ALL", lcAll, sizeof (lcAll)))
locale = lcAll;
else if(__ecereNameSpace__ecere__sys__GetEnvironment("LC_MESSAGES", lcMessages, sizeof (lcMessages)))
locale = lcMessages;
else if(__ecereNameSpace__ecere__sys__GetEnvironment("LANG", lang, sizeof (lang)))
locale = lang;
if(locale)
{
char * dot;
char * colon;

if(language != locale)
strcpy(language, locale);
dot = strstr(language, ".");
if(dot)
*dot = 0;
colon = strstr(language, ":");
if(colon)
*colon = 0;
locale = language;
if(!(strcasecmp)(locale, "zh"))
strcpy(locale, "zh_CN");
}
if(locale)
{
char * under;

strcpy(genericLocale, locale);
under = strchr(genericLocale, '_');
if(under)
*under = 0;
if(!(strcasecmp)(genericLocale, "zh"))
strcpy(genericLocale, "zh_CN");
}
if(moduleName)
sprintf(fileName, "<:%s>locale/%s.mo", moduleName, locale);
else
sprintf(fileName, ":locale/%s.mo", locale);
f = __ecereNameSpace__ecere__sys__FileOpen(fileName, 1);
if(!f)
{
if(moduleName)
sprintf(fileName, "<:%s>locale/%s/LC_MESSAGES/%s.mo", moduleName, locale, name);
else
sprintf(fileName, ":locale/%s/LC_MESSAGES/%s.mo", locale, name);
f = __ecereNameSpace__ecere__sys__FileOpen(fileName, 1);
}
if(!f)
{
sprintf(fileName, "locale/%s/LC_MESSAGES/%s.mo", locale, name);
f = __ecereNameSpace__ecere__sys__FileOpen(fileName, 1);
}
if(!f)
{
sprintf(fileName, "/usr/share/locale/%s/LC_MESSAGES/%s.mo", locale, name);
f = __ecereNameSpace__ecere__sys__FileOpen(fileName, 1);
}
if(!f && locale && (strcasecmp)(locale, genericLocale))
{
if(moduleName)
sprintf(fileName, "<:%s>locale/%s.mo", moduleName, genericLocale);
else
sprintf(fileName, ":locale/%s.mo", genericLocale);
f = __ecereNameSpace__ecere__sys__FileOpen(fileName, 1);
if(!f)
{
if(moduleName)
sprintf(fileName, "<:%s>locale/%s/LC_MESSAGES/%s.mo", moduleName, genericLocale, name);
else
sprintf(fileName, ":locale/%s/LC_MESSAGES/%s.mo", genericLocale, name);
f = __ecereNameSpace__ecere__sys__FileOpen(fileName, 1);
}
if(!f)
{
sprintf(fileName, "locale/%s/LC_MESSAGES/%s.mo", genericLocale, name);
f = __ecereNameSpace__ecere__sys__FileOpen(fileName, 1);
}
if(!f)
{
sprintf(fileName, "/usr/share/locale/%s/LC_MESSAGES/%s.mo", genericLocale, name);
f = __ecereNameSpace__ecere__sys__FileOpen(fileName, 1);
}
}
if(f)
{
unsigned int magic = 0;

(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, &magic, sizeof(unsigned int), 1) : (size_t)1;
}));
if(magic == 0x950412de || magic == 0xde120495)
{
struct __ecereNameSpace__ecere__com__Instance * textMap;
unsigned int swap = magic != 0x950412de;
unsigned int revision = 0;
unsigned int numStrings = 0;
unsigned int origStrings = 0, transStrings = 0;
unsigned int hashingSize = 0, hashingOffset = 0;
int c;

(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, &revision, sizeof(unsigned int), 1) : (size_t)1;
}));
if(swap)
revision = ((((revision) & 0x000000ff) << 24) | (((revision) & 0x0000ff00) << 8) | (((revision) & 0x00ff0000) >> 8) | (((revision) & 0xff000000) >> 24));
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, &numStrings, sizeof(unsigned int), 1) : (size_t)1;
}));
if(swap)
numStrings = ((((numStrings) & 0x000000ff) << 24) | (((numStrings) & 0x0000ff00) << 8) | (((numStrings) & 0x00ff0000) >> 8) | (((numStrings) & 0xff000000) >> 24));
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, &origStrings, sizeof(unsigned int), 1) : (size_t)1;
}));
if(swap)
origStrings = ((((origStrings) & 0x000000ff) << 24) | (((origStrings) & 0x0000ff00) << 8) | (((origStrings) & 0x00ff0000) >> 8) | (((origStrings) & 0xff000000) >> 24));
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, &transStrings, sizeof(unsigned int), 1) : (size_t)1;
}));
if(swap)
transStrings = ((((transStrings) & 0x000000ff) << 24) | (((transStrings) & 0x0000ff00) << 8) | (((transStrings) & 0x00ff0000) >> 8) | (((transStrings) & 0xff000000) >> 24));
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, &hashingSize, sizeof(unsigned int), 1) : (size_t)1;
}));
if(swap)
hashingSize = ((((hashingSize) & 0x000000ff) << 24) | (((hashingSize) & 0x0000ff00) << 8) | (((hashingSize) & 0x00ff0000) >> 8) | (((hashingSize) & 0xff000000) >> 24));
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, &hashingOffset, sizeof(unsigned int), 1) : (size_t)1;
}));
if(swap)
hashingOffset = ((((hashingOffset) & 0x000000ff) << 24) | (((hashingOffset) & 0x0000ff00) << 8) | (((hashingOffset) & 0x00ff0000) >> 8) | (((hashingOffset) & 0xff000000) >> 24));
if(!__ecereNameSpace__ecere__moduleMaps)
__ecereNameSpace__ecere__moduleMaps = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__Map_TPL_String__ecere__com__Map_TPL_String__const_String___);
{
struct __ecereNameSpace__ecere__com__MapIterator it = (it.container = (void *)0, it.pointer = (void *)0, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(&it, __ecereNameSpace__ecere__moduleMaps), it);

if(__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index((void *)(&it), (uint64)(uintptr_t)(name), 0))
(__ecereNameSpace__ecere__com__eInstance_DecRef(((void * )((uintptr_t)(__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data((void *)(&it)))))), __ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data((void *)(&it), 0));
}
__extension__ ({
struct __ecereNameSpace__ecere__com__Iterator __internalIterator =
{
__ecereNameSpace__ecere__moduleMaps, 0
};

__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(&__internalIterator, ((uint64)(uintptr_t)(name)), 1);
__ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(&__internalIterator, (uint64)(uintptr_t)(textMap = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__com__Map_TPL_String__const_String_)));
});
for(c = 0; c < numStrings; c++)
{
unsigned int len = 0, offset = 0;
char * original = (((void *)0)), * translated = (((void *)0));

(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, origStrings + c * 2 * sizeof(unsigned int), 0) : (unsigned int)1;
}));
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, &len, sizeof(unsigned int), 1) : (size_t)1;
}));
if(swap)
len = ((((len) & 0x000000ff) << 24) | (((len) & 0x0000ff00) << 8) | (((len) & 0x00ff0000) >> 8) | (((len) & 0xff000000) >> 24));
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, &offset, sizeof(unsigned int), 1) : (size_t)1;
}));
if(swap)
offset = ((((offset) & 0x000000ff) << 24) | (((offset) & 0x0000ff00) << 8) | (((offset) & 0x00ff0000) >> 8) | (((offset) & 0xff000000) >> 24));
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, offset, 0) : (unsigned int)1;
}));
original = __ecereNameSpace__ecere__com__eSystem_New(sizeof(unsigned char) * (len + 1));
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, original, 1, len + 1) : (size_t)1;
}));
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, transStrings + c * 2 * sizeof(unsigned int), 0) : (unsigned int)1;
}));
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, &len, sizeof(unsigned int), 1) : (size_t)1;
}));
if(swap)
len = ((((len) & 0x000000ff) << 24) | (((len) & 0x0000ff00) << 8) | (((len) & 0x00ff0000) >> 8) | (((len) & 0xff000000) >> 24));
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, &offset, sizeof(unsigned int), 1) : (size_t)1;
}));
if(swap)
offset = ((((offset) & 0x000000ff) << 24) | (((offset) & 0x0000ff00) << 8) | (((offset) & 0x00ff0000) >> 8) | (((offset) & 0xff000000) >> 24));
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, long long pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, offset, 0) : (unsigned int)1;
}));
translated = __ecereNameSpace__ecere__com__eSystem_New(sizeof(unsigned char) * (len + 1));
(__extension__ ({
size_t (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count);

__internal_VirtualMethod = ((size_t (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, size_t size, size_t count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = f;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read]);
__internal_VirtualMethod ? __internal_VirtualMethod(f, translated, 1, len + 1) : (size_t)1;
}));
if(len)
{
struct __ecereNameSpace__ecere__com__MapIterator it = (it.container = (void *)0, it.pointer = (void *)0, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(&it, textMap), it);

if(__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index((void *)(&it), (uint64)(uintptr_t)(original), 0))
(__ecereNameSpace__ecere__com__eSystem_Delete(translated), translated = 0);
else
__extension__ ({
struct __ecereNameSpace__ecere__com__Iterator __internalIterator =
{
textMap, 0
};

__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index(&__internalIterator, ((uint64)(uintptr_t)(original)), 1);
__ecereProp___ecereNameSpace__ecere__com__Iterator_Set_data(&__internalIterator, (uint64)(uintptr_t)(translated));
});
}
else
(__ecereNameSpace__ecere__com__eSystem_Delete(translated), translated = 0);
(__ecereNameSpace__ecere__com__eSystem_Delete(original), original = 0);
}
}
else
{
printf("Invalid format while loading %s\n", fileName);
}
(__ecereNameSpace__ecere__com__eInstance_DecRef(f), f = 0);
}
}

void __ecereNameSpace__ecere__UnloadTranslatedStrings(const char * name)
{
struct __ecereNameSpace__ecere__com__MapIterator it = (it.container = (void *)0, it.pointer = (void *)0, __ecereProp___ecereNameSpace__ecere__com__MapIterator_Set_map(&it, __ecereNameSpace__ecere__moduleMaps), it);

if(__ecereMethod___ecereNameSpace__ecere__com__Iterator_Index((void *)(&it), (uint64)(uintptr_t)(name), 0))
{
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = ((struct __ecereNameSpace__ecere__com__Instance *)(uintptr_t)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data((void *)(&it)));

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Free]);
__internal_VirtualMethod ? __internal_VirtualMethod(((struct __ecereNameSpace__ecere__com__Instance *)(uintptr_t)__ecereProp___ecereNameSpace__ecere__com__Iterator_Get_data((void *)(&it)))) : (void)1;
}));
(__extension__ ({
void (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * i);

__internal_VirtualMethod = ((void (*)(struct __ecereNameSpace__ecere__com__Instance *, struct __ecereNameSpace__ecere__com__IteratorPointer * i))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = __ecereNameSpace__ecere__moduleMaps;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__com__Map->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__com__Container_Delete]);
__internal_VirtualMethod ? __internal_VirtualMethod(__ecereNameSpace__ecere__moduleMaps, it.pointer) : (void)1;
}));
}
}

void __ecereUnregisterModule_i18n(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

void __ecereRegisterModule_i18n(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::LoadTranslatedStrings", "void ecere::LoadTranslatedStrings(const String moduleName, const char * name)", __ecereNameSpace__ecere__LoadTranslatedStrings, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::UnloadTranslatedStrings", "void ecere::UnloadTranslatedStrings(const String name)", __ecereNameSpace__ecere__UnloadTranslatedStrings, module, 4);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("ecere::GetTranslatedString", "const char * ecere::GetTranslatedString(const String name, const char * string, const char * stringAndContext)", __ecereNameSpace__ecere__GetTranslatedString, module, 4);
}

