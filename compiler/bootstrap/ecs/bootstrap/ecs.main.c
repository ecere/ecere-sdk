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
extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BTNode;

struct __ecereNameSpace__ecere__sys__BTNode;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__sys__BinaryTree
{
struct __ecereNameSpace__ecere__sys__BTNode * root;
int count;
int (*  CompareKey)(struct __ecereNameSpace__ecere__sys__BinaryTree * tree, unsigned int a, unsigned int b);
void (*  FreeKey)(void *  key);
};

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldList;

struct __ecereNameSpace__ecere__sys__OldList
{
void *  first;
void *  last;
int count;
unsigned int offset;
unsigned int circ;
};

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
};

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
};

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_CodePosition;

struct CodePosition
{
int line;
int charPos;
int pos;
unsigned int included;
};

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Location;

struct Location
{
struct CodePosition start;
struct CodePosition end;
};

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
};
};

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

struct ModuleImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassImport;

struct ClassImport;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Symbol;

struct Symbol;

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
};

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

struct __ecereNameSpace__ecere__com__Instance
{
int (* *  _vTbl)();
struct __ecereNameSpace__ecere__com__Class * _class;
int _refCount;
};

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
};

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SerialBuffer;

struct __ecereNameSpace__ecere__com__SerialBuffer
{
unsigned char *  _buffer;
unsigned int count;
unsigned int _size;
unsigned int pos;
};

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateArgument;

struct __ecereNameSpace__ecere__com__ClassTemplateArgument
{
union
{
struct
{
char *  dataTypeString;
struct __ecereNameSpace__ecere__com__Class * dataTypeClass;
};
struct __ecereNameSpace__ecere__com__DataValue expression;
struct
{
char *  memberString;
union
{
struct __ecereNameSpace__ecere__com__DataMember * member;
struct __ecereNameSpace__ecere__com__Property * prop;
struct __ecereNameSpace__ecere__com__Method * method;
};
};
};
};

static struct __ecereNameSpace__ecere__com__Instance * __currentModule;

struct __ecereNameSpace__ecere__com__Instance * __thisModule;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Application;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Module;

unsigned int __ecereDll_Load_ec(struct __ecereNameSpace__ecere__com__Instance * module);

unsigned int __ecereDll_Unload_ec(struct __ecereNameSpace__ecere__com__Instance * module);

struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassDefinition;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassImport;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_CodePosition;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Context;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_ContextStringPair;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBTableDef;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declaration;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declarator;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Definition;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Expression;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_External;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionDefinition;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionImport;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Identifier;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_ImportedModule;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Initializer;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Instantiation;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Location;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_MethodImport;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_ModuleImport;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyImport;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Specifier;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Statement;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Symbol;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateArgument;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateDatatype;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateParameter;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Type;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_TypeName;

unsigned int __ecereDll_Load_ecere(struct __ecereNameSpace__ecere__com__Instance * module);

unsigned int __ecereDll_Unload_ecere(struct __ecereNameSpace__ecere__com__Instance * module);

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BTNamedLink;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateArgument;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Free;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_RemoveAll;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__CustomAVLTree;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DataMember;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DataValue;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Iterator;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Iterator_data;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IteratorPointer;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List_TPL_String_;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map_TPL_ContextStringPair__ecere__com__List_TPL_String___;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__MapIterator;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_key;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_map;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Method;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__NameSpace;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Platform_char__PTR_;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Property;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SerialBuffer;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SubModule;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BTNode;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_next;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldLink;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldList;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

void __ecereRegisterModule_ecs(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_ecs(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereCreateModuleInstances_ecs();

void __ecereDestroyModuleInstances_ecs();

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com____ecere_COM_Initialize(unsigned int guiApp, int argc, char *  argv[]);

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__eModule_LoadStatic(struct __ecereNameSpace__ecere__com__Instance * fromModule, char *  name, int importAccess, unsigned int (* )(struct __ecereNameSpace__ecere__com__Instance * module), unsigned int (* )(struct __ecereNameSpace__ecere__com__Instance * module));

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern void __ecereNameSpace__ecere__com__eInstance_Evolve(struct __ecereNameSpace__ecere__com__Instance **  instancePtr, struct __ecereNameSpace__ecere__com__Class * _class);

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
};

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
struct __ecereNameSpace__ecere__com__NameSpace privateNameSpace;
struct __ecereNameSpace__ecere__com__NameSpace publicNameSpace;
};

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
};

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

int main(int _argc, char * _argv[])
{
int exitCode;
struct __ecereNameSpace__ecere__com__Instance * module;
struct __ecereNameSpace__ecere__com__Class * _class;
struct __ecereNameSpace__ecere__com__Method * method;
struct __ecereNameSpace__ecere__com__Property * _property;

__thisModule = __currentModule = module = __ecereNameSpace__ecere__com____ecere_COM_Initialize((unsigned int)1, _argc, (void *)_argv);
__ecereNameSpace__ecere__com__eModule_LoadStatic(module, "ec", 2, __ecereDll_Load_ec, __ecereDll_Unload_ec);
__ecereNameSpace__ecere__com__eModule_LoadStatic(module, "ecere", 2, __ecereDll_Load_ecere, __ecereDll_Unload_ecere);
__ecereRegisterModule_ecs(module);
__ecereClass___ecereNameSpace__ecere__com__Application = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Application");
__ecereClass___ecereNameSpace__ecere__com__Instance = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Instance");
__ecereClass___ecereNameSpace__ecere__com__Module = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Module");
__ecereClass_ClassDefinition = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ClassDefinition");
__ecereClass_ClassImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ClassImport");
__ecereClass_CodePosition = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "CodePosition");
__ecereClass_Context = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Context");
__ecereClass_ContextStringPair = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ContextStringPair");
__ecereClass_DBTableDef = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "DBTableDef");
__ecereClass_Declaration = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Declaration");
__ecereClass_Declarator = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Declarator");
__ecereClass_Definition = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Definition");
__ecereClass_Expression = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Expression");
__ecereClass_External = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "External");
__ecereClass_FunctionDefinition = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "FunctionDefinition");
__ecereClass_FunctionImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "FunctionImport");
__ecereClass_Identifier = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Identifier");
__ecereClass_ImportedModule = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ImportedModule");
__ecereClass_Initializer = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Initializer");
__ecereClass_Instantiation = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Instantiation");
__ecereClass_Location = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Location");
__ecereClass_MethodImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "MethodImport");
__ecereClass_ModuleImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ModuleImport");
__ecereClass_PropertyImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "PropertyImport");
__ecereClass_Specifier = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Specifier");
__ecereClass_Statement = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Statement");
__ecereClass_Symbol = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Symbol");
__ecereClass_TemplateArgument = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "TemplateArgument");
__ecereClass_TemplateDatatype = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "TemplateDatatype");
__ecereClass_TemplateParameter = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "TemplateParameter");
__ecereClass_Type = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Type");
__ecereClass_TypeName = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "TypeName");
__ecereClass___ecereNameSpace__ecere__com__BTNamedLink = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::BTNamedLink");
__ecereClass___ecereNameSpace__ecere__com__Class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Class");
__ecereClass___ecereNameSpace__ecere__com__ClassTemplateArgument = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::ClassTemplateArgument");
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
__ecereClass___ecereNameSpace__ecere__com__DataMember = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::DataMember");
__ecereClass___ecereNameSpace__ecere__com__DataValue = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::DataValue");
__ecereClass___ecereNameSpace__ecere__com__GlobalFunction = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::GlobalFunction");
__ecereClass___ecereNameSpace__ecere__com__Iterator = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Iterator");
__ecereProp___ecereNameSpace__ecere__com__Iterator_data = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__com__Iterator, "data", module);
__ecereClass___ecereNameSpace__ecere__com__IteratorPointer = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::IteratorPointer");
__ecereClass___ecereNameSpace__ecere__com__List_TPL_String_ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::List<String>");
__ecereClass___ecereNameSpace__ecere__com__Map_TPL_ContextStringPair__ecere__com__List_TPL_String___ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Map<ContextStringPair, ecere::com::List<String> >");
__ecereClass___ecereNameSpace__ecere__com__MapIterator = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::MapIterator");
__ecereProp___ecereNameSpace__ecere__com__MapIterator_key = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__com__MapIterator, "key", module);
__ecereProp___ecereNameSpace__ecere__com__MapIterator_map = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__com__MapIterator, "map", module);
__ecereClass___ecereNameSpace__ecere__com__Method = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Method");
__ecereClass___ecereNameSpace__ecere__com__NameSpace = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::NameSpace");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Platform");
__ecereProp___ecereNameSpace__ecere__com__Platform_char__PTR_ = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(_class, "char *", module);
__ecereClass___ecereNameSpace__ecere__com__Property = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Property");
__ecereClass___ecereNameSpace__ecere__com__SerialBuffer = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::SerialBuffer");
__ecereClass___ecereNameSpace__ecere__com__SubModule = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::SubModule");
__ecereClass___ecereNameSpace__ecere__sys__BTNode = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::BTNode");
__ecereProp___ecereNameSpace__ecere__sys__BTNode_next = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__sys__BTNode, "next", module);
__ecereClass___ecereNameSpace__ecere__sys__BinaryTree = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::BinaryTree");
__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__sys__BinaryTree, "first", module);
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::File");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Eof", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Puts", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Read", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Seek", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Write", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write = method->vid;
__ecereClass___ecereNameSpace__ecere__sys__OldLink = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::OldLink");
__ecereClass___ecereNameSpace__ecere__sys__OldList = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::OldList");
__ecereClass___ecereNameSpace__ecere__sys__TempFile = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::TempFile");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(__currentModule, "SymbolgenApp");
__ecereNameSpace__ecere__com__eInstance_Evolve((struct __ecereNameSpace__ecere__com__Instance **)&__currentModule, _class);
__thisModule = __currentModule;
__ecereCreateModuleInstances_ecs();
((struct __ecereNameSpace__ecere__com__Instance *)(char *)__currentModule)->_vTbl[12](__currentModule);
__ecereDestroyModuleInstances_ecs();
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(__currentModule, "ecere::com::Application");
exitCode = ((struct __ecereNameSpace__ecere__com__Application *)(((char *)((struct __ecereNameSpace__ecere__com__Instance *)__currentModule) + 296)))->exitCode;
(__ecereNameSpace__ecere__com__eInstance_DecRef(__currentModule), __currentModule = 0);
return exitCode;
}

void __ecereRegisterModule_ecs_main(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

}

void __ecereUnregisterModule_ecs_main(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

