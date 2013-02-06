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
extern void *  __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew(void *  memory, unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew0(void *  memory, unsigned int size);

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

static struct __ecereNameSpace__ecere__com__Instance * __currentModule;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_AsmField;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Attrib;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Attribute;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassDef;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassDefinition;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassFunction;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassImport;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_CodePosition;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Context;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBIndexItem;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBTableDef;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBTableEntry;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_DataRedefinition;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declaration;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Declarator;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Definition;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Enumerator;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Expression;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_ExtDecl;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_External;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionDefinition;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_FunctionImport;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_GlobalData;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Identifier;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_ImportedModule;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_InitDeclarator;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Initializer;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Instantiation;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Location;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_MemberInit;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_MembersInit;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_MethodImport;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_ModuleImport;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_OpTable;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Operand;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Pointer;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyDef;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyImport;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyWatch;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Specifier;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Statement;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Symbol;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateArgument;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateDatatype;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplateParameter;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_TemplatedType;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_Type;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_TypeName;

int __ecereVMethodID_class_OnGetString;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Application;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Instance;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Module;

struct __ecereNameSpace__ecere__com__Class * __ecereClass_int;

unsigned int __ecereDll_Load_ecere(struct __ecereNameSpace__ecere__com__Instance * module);

unsigned int __ecereDll_Unload_ecere(struct __ecereNameSpace__ecere__com__Instance * module);

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BTNamedLink;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__BitMember;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Class;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassProperty;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateArgument;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__ClassTemplateParameter;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Add;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Free;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_GetFirst;

int __ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__CustomAVLTree;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DataMember;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DataValue;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__DefinedExpression;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__EnumClassData;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Iterator;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__Iterator_data;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__IteratorPointer;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__LinkList;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List_TPL_Location_;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__List_TPL_ecere__com__Module_;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map_TPL_ContextStringPair__ecere__com__List_TPL_Location___;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Map_TPL_String__ecere__com__List_TPL_ecere__com__Module___;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__MapIterator;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_key;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__com__MapIterator_map;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Method;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__NameSpace;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__Property;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SerialBuffer;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__SubModule;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__TemplateMemberType;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__gui__controls__BufferLocation;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__gui__controls__EditLine;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BTNode;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BTNode_next;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__BinaryTree;

struct __ecereNameSpace__ecere__com__Property * __ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Putc;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Puts;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__Item;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__NamedItem;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__NamedLink;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldLink;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__OldList;

struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

void __ecereRegisterModule_ast(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereUnregisterModule_ast(struct __ecereNameSpace__ecere__com__Instance * module);

void __ecereCreateModuleInstances_ast();

void __ecereDestroyModuleInstances_ast();

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

void __ecereCreateModuleInstances_loadSymbols();

void __ecereDestroyModuleInstances_loadSymbols();

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

extern struct __ecereNameSpace__ecere__com__Instance * __ecereNameSpace__ecere__com__eModule_LoadStatic(struct __ecereNameSpace__ecere__com__Instance * fromModule, char *  name, int importAccess, unsigned int (* )(struct __ecereNameSpace__ecere__com__Instance * module), unsigned int (* )(struct __ecereNameSpace__ecere__com__Instance * module));

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_FindClass(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

extern struct __ecereNameSpace__ecere__com__Method * __ecereNameSpace__ecere__com__eClass_FindMethod(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern struct __ecereNameSpace__ecere__com__Property * __ecereNameSpace__ecere__com__eClass_FindProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, struct __ecereNameSpace__ecere__com__Instance * module);

extern void __ecereNameSpace__ecere__LoadTranslatedStrings(struct __ecereNameSpace__ecere__com__Instance * module, char *  name);

unsigned int __ecereDll_Load_ec(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * _class;
struct __ecereNameSpace__ecere__com__Method * method;
struct __ecereNameSpace__ecere__com__Property * _property;

if(!__currentModule)
{
__currentModule = module;
}
__ecereNameSpace__ecere__com__eModule_LoadStatic(module, "ecere", 1, __ecereDll_Load_ecere, __ecereDll_Unload_ecere);
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
__ecereClass_CodePosition = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "CodePosition");
__ecereClass_Context = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Context");
__ecereClass_DBIndexItem = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "DBIndexItem");
__ecereClass_DBTableDef = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "DBTableDef");
__ecereClass_DBTableEntry = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "DBTableEntry");
__ecereClass_DataRedefinition = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "DataRedefinition");
__ecereClass_Declaration = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Declaration");
__ecereClass_Declarator = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Declarator");
__ecereClass_Definition = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Definition");
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
__ecereClass_Location = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Location");
__ecereClass_MemberInit = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "MemberInit");
__ecereClass_MembersInit = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "MembersInit");
__ecereClass_MethodImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "MethodImport");
__ecereClass_ModuleImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ModuleImport");
__ecereClass_OpTable = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "OpTable");
__ecereClass_Operand = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Operand");
__ecereClass_Pointer = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Pointer");
__ecereClass_PropertyDef = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "PropertyDef");
__ecereClass_PropertyImport = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "PropertyImport");
__ecereClass_PropertyWatch = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "PropertyWatch");
__ecereClass_Specifier = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Specifier");
__ecereClass_Statement = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Statement");
__ecereClass_Symbol = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Symbol");
__ecereClass_TemplateArgument = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "TemplateArgument");
__ecereClass_TemplateDatatype = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "TemplateDatatype");
__ecereClass_TemplateParameter = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "TemplateParameter");
__ecereClass_TemplatedType = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "TemplatedType");
__ecereClass_Type = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "Type");
__ecereClass_TypeName = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "TypeName");
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "class");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "OnGetString", module);
if(method)
__ecereVMethodID_class_OnGetString = method->vid;
__ecereClass___ecereNameSpace__ecere__com__Application = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Application");
__ecereClass___ecereNameSpace__ecere__com__Instance = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Instance");
__ecereClass___ecereNameSpace__ecere__com__Module = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Module");
__ecereClass_int = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "int");
__ecereClass___ecereNameSpace__ecere__com__BTNamedLink = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::BTNamedLink");
__ecereClass___ecereNameSpace__ecere__com__BitMember = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::BitMember");
__ecereClass___ecereNameSpace__ecere__com__Class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Class");
__ecereClass___ecereNameSpace__ecere__com__ClassProperty = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::ClassProperty");
__ecereClass___ecereNameSpace__ecere__com__ClassTemplateArgument = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::ClassTemplateArgument");
__ecereClass___ecereNameSpace__ecere__com__ClassTemplateParameter = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::ClassTemplateParameter");
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
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Remove", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__com__Container_Remove = method->vid;
__ecereClass___ecereNameSpace__ecere__com__CustomAVLTree = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::CustomAVLTree");
__ecereClass___ecereNameSpace__ecere__com__DataMember = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::DataMember");
__ecereClass___ecereNameSpace__ecere__com__DataValue = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::DataValue");
__ecereClass___ecereNameSpace__ecere__com__DefinedExpression = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::DefinedExpression");
__ecereClass___ecereNameSpace__ecere__com__EnumClassData = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::EnumClassData");
__ecereClass___ecereNameSpace__ecere__com__GlobalFunction = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::GlobalFunction");
__ecereClass___ecereNameSpace__ecere__com__Iterator = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Iterator");
__ecereProp___ecereNameSpace__ecere__com__Iterator_data = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__com__Iterator, "data", module);
__ecereClass___ecereNameSpace__ecere__com__IteratorPointer = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::IteratorPointer");
__ecereClass___ecereNameSpace__ecere__com__LinkList = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::LinkList");
__ecereClass___ecereNameSpace__ecere__com__List_TPL_Location_ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::List<Location>");
__ecereClass___ecereNameSpace__ecere__com__List_TPL_ecere__com__Module_ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::List<ecere::com::Module>");
__ecereClass___ecereNameSpace__ecere__com__Map_TPL_ContextStringPair__ecere__com__List_TPL_Location___ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Map<ContextStringPair, ecere::com::List<Location> >");
__ecereClass___ecereNameSpace__ecere__com__Map_TPL_String__ecere__com__List_TPL_ecere__com__Module___ = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Map<String, ecere::com::List<ecere::com::Module> >");
__ecereClass___ecereNameSpace__ecere__com__MapIterator = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::MapIterator");
__ecereProp___ecereNameSpace__ecere__com__MapIterator_key = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__com__MapIterator, "key", module);
__ecereProp___ecereNameSpace__ecere__com__MapIterator_map = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__com__MapIterator, "map", module);
__ecereClass___ecereNameSpace__ecere__com__Method = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Method");
__ecereClass___ecereNameSpace__ecere__com__NameSpace = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::NameSpace");
__ecereClass___ecereNameSpace__ecere__com__Property = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::Property");
__ecereClass___ecereNameSpace__ecere__com__SerialBuffer = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::SerialBuffer");
__ecereClass___ecereNameSpace__ecere__com__SubModule = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::SubModule");
__ecereClass___ecereNameSpace__ecere__com__TemplateMemberType = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::com::TemplateMemberType");
__ecereClass___ecereNameSpace__ecere__gui__controls__BufferLocation = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::gui::controls::BufferLocation");
__ecereClass___ecereNameSpace__ecere__gui__controls__EditLine = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::gui::controls::EditLine");
__ecereClass___ecereNameSpace__ecere__sys__BTNode = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::BTNode");
__ecereProp___ecereNameSpace__ecere__sys__BTNode_next = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__sys__BTNode, "next", module);
__ecereClass___ecereNameSpace__ecere__sys__BinaryTree = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::BinaryTree");
__ecereProp___ecereNameSpace__ecere__sys__BinaryTree_first = _property = __ecereNameSpace__ecere__com__eClass_FindProperty(__ecereClass___ecereNameSpace__ecere__sys__BinaryTree, "first", module);
_class = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::File");
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Eof", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Eof = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "GetSize", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_GetSize = method->vid;
method = __ecereNameSpace__ecere__com__eClass_FindMethod(_class, "Putc", module);
if(method)
__ecereVMethodID___ecereNameSpace__ecere__sys__File_Putc = method->vid;
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
__ecereClass___ecereNameSpace__ecere__sys__Item = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::Item");
__ecereClass___ecereNameSpace__ecere__sys__NamedItem = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::NamedItem");
__ecereClass___ecereNameSpace__ecere__sys__NamedLink = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::NamedLink");
__ecereClass___ecereNameSpace__ecere__sys__OldLink = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::OldLink");
__ecereClass___ecereNameSpace__ecere__sys__OldList = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::OldList");
__ecereClass___ecereNameSpace__ecere__sys__TempFile = __ecereNameSpace__ecere__com__eSystem_FindClass(module, "ecere::sys::TempFile");
__ecereNameSpace__ecere__LoadTranslatedStrings(module, "ec");
}
if(__currentModule == module)
{
__ecereCreateModuleInstances_ast();
__ecereCreateModuleInstances_loadSymbols();
}
return 0x1;
}

extern void __ecereNameSpace__ecere__UnloadTranslatedStrings(struct __ecereNameSpace__ecere__com__Instance * module);

unsigned int __ecereDll_Unload_ec(struct __ecereNameSpace__ecere__com__Instance * module)
{
if(__currentModule == module)
{
__ecereDestroyModuleInstances_ast();
__ecereDestroyModuleInstances_loadSymbols();
__ecereNameSpace__ecere__UnloadTranslatedStrings(__currentModule);
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
return 0x1;
}

void __ecereRegisterModule_ec_main(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

}

void __ecereUnregisterModule_ec_main(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

