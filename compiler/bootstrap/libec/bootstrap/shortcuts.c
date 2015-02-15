/* Code generated from eC source file: shortcuts.ec */
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
unsigned int parsingType;

extern unsigned int echoOn;

extern unsigned int type_yydebug;

int type_yyparse();

unsigned int parseTypeError;

extern int declMode;

extern int structDeclMode;

extern void resetScanner();

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
unsigned int count;
unsigned int _size;
unsigned int pos;
} ecere_gcc_struct;

extern void *  __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew(void *  memory, unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew0(void *  memory, unsigned int size);

extern void __ecereNameSpace__ecere__com__eSystem_Delete(void *  memory);

struct CodePosition
{
int line;
int charPos;
int pos;
int included;
} ecere_gcc_struct;

struct Symbol;

struct Identifier;

struct Expression;

struct Attrib;

struct Specifier;

struct Pointer;

struct ExtDecl;

struct Declaration;

struct InitDeclarator;

extern char *  __ecereNameSpace__ecere__sys__CopyString(const char *  string);

extern size_t strlen(const char * );

extern void Compiler_Warning(const char *  format, ...);

extern const char *  __ecereNameSpace__ecere__GetTranslatedString(const char * name, const char *  string, const char *  stringAndContext);

struct __ecereNameSpace__ecere__com__GlobalFunction;

void SetParsingType(unsigned int b)
{
parsingType = b;
}

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern void ListAdd(struct __ecereNameSpace__ecere__sys__OldList * list, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

struct Location
{
struct CodePosition start;
struct CodePosition end;
} ecere_gcc_struct;

void resetScannerPos(struct CodePosition * pos);

extern struct Identifier * MkIdentifier(const char *  string);

extern struct Expression * MkExpBrackets(struct __ecereNameSpace__ecere__sys__OldList * expressions);

extern struct Expression * MkExpIdentifier(struct Identifier * id);

extern struct Expression * MkExpCondition(struct Expression * cond, struct __ecereNameSpace__ecere__sys__OldList * expressions, struct Expression * elseExp);

extern struct Specifier * MkSpecifierName(const char *  name);

extern struct Specifier * MkSpecifier(int specifier);

extern struct Pointer * MkPointer(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Pointer * pointer);

extern struct Declaration * MkDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators);

char * QMkString(const char * source)
{
char * string;

if(source)
{
int len = 0;
int i, j = 0;
char ch;

for(i = 0; (ch = source[i]); i++)
{
len++;
if(ch == '\"' || ch == '\\')
len++;
}
string = __ecereNameSpace__ecere__com__eSystem_New(sizeof(char) * (len + 3));
string[j++] = '\"';
for(i = 0; (ch = source[i]); i++)
{
if(ch == '\"' || ch == '\\')
string[j++] = '\\';
string[j++] = ch;
}
string[j++] = '\"';
string[j] = '\0';
}
else
string = __ecereNameSpace__ecere__sys__CopyString("0");
return string;
}

extern struct Location yylloc;

struct Expression * QBrackets(struct Expression * exp)
{
struct __ecereNameSpace__ecere__sys__OldList * expList = MkList();

ListAdd(expList, exp);
return MkExpBrackets(expList);
}

struct Expression * QMkExpId(const char * id)
{
return MkExpIdentifier(MkIdentifier(id));
}

struct Expression * QMkExpCond(struct Expression * cond, struct Expression * exp, struct Expression * elseExp)
{
struct __ecereNameSpace__ecere__sys__OldList * expList = MkList();

ListAdd(expList, exp);
return MkExpCondition(cond, expList, elseExp);
}

struct Declaration * QMkDeclaration(const char * name, struct InitDeclarator * initDecl)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList(), * initDecls = (((void *)0));

ListAdd(specs, MkSpecifierName(name));
if(initDecl)
{
initDecls = MkList();
ListAdd(initDecls, initDecl);
}
return MkDeclaration(specs, initDecls);
}

struct Declaration * QMkDeclarationBase(int base, struct InitDeclarator * initDecl)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList(), * initDecls = (((void *)0));

ListAdd(specs, MkSpecifier(base));
if(initDecl)
{
initDecls = MkList();
ListAdd(initDecls, initDecl);
}
return MkDeclaration(specs, initDecls);
}

struct TypeName;

extern struct TypeName * parsedType;

extern void FreeTypeName(struct TypeName * typeName);

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

extern struct __ecereNameSpace__ecere__com__Instance * fileInput;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

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

extern void __ecereNameSpace__ecere__com__eInstance_Watch(void *  instance, struct __ecereNameSpace__ecere__com__Property * _property, void *  object, void (*  callback)(void * , void * ));

extern void __ecereNameSpace__ecere__com__eInstance_FireWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

struct Declarator;

struct Declarator
{
struct Declarator * prev;
struct Declarator * next;
struct Location loc;
int type;
struct Symbol * symbol;
struct Declarator * declarator;
union
{
struct Identifier * identifier;
struct
{
struct Expression * exp;
struct Expression * posExp;
struct Attrib * attrib;
} ecere_gcc_struct structDecl;
struct
{
struct Expression * exp;
struct Specifier * enumClass;
} ecere_gcc_struct array;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * parameters;
} ecere_gcc_struct function;
struct
{
struct Pointer * pointer;
} ecere_gcc_struct pointer;
struct
{
struct ExtDecl * extended;
} ecere_gcc_struct extended;
} ecere_gcc_struct __anon1;
} ecere_gcc_struct;

extern struct Declarator * CopyDeclarator(struct Declarator * declarator);

extern void FreeDeclarator(struct Declarator * decl);

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

extern struct Declarator * MkDeclaratorPointer(struct Pointer * pointer, struct Declarator * declarator);

extern struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator);

struct TypeName
{
struct TypeName * prev;
struct TypeName * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList *  qualifiers;
struct Declarator * declarator;
int classObjectType;
struct Expression * bitCount;
} ecere_gcc_struct;

extern struct Declarator * MkStructDeclarator(struct Declarator * declarator, struct Expression * exp);

struct Declarator * GetFuncDecl(struct Declarator * decl)
{
struct Declarator * funcDecl = (((void *)0));

while(decl && decl->type != 1)
{
if(decl->type == 4)
funcDecl = decl;
decl = decl->declarator;
}
return funcDecl;
}

struct Declarator * PlugDeclarator(struct Declarator * decl, struct Declarator * baseDecl)
{
if(decl && decl->type != 1)
{
struct Declarator * base;

decl = CopyDeclarator(decl);
base = decl;
if(base->type != 1)
{
for(; base->declarator && base->declarator->type != 1; base = base->declarator)
{
}
}
if(baseDecl)
{
if(base->declarator)
FreeDeclarator(base->declarator);
base->declarator = baseDecl;
}
else if(base->type == 1)
{
FreeDeclarator(decl);
decl = (((void *)0));
}
return decl;
}
else
return baseDecl;
}

struct Declarator * QMkPtrDecl(const char * id)
{
struct Declarator * declarator = id ? MkDeclaratorIdentifier(MkIdentifier(id)) : (((void *)0));

return MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), declarator);
}

struct TypeName * QMkType(const char * spec, struct Declarator * decl)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

ListAdd(specs, MkSpecifierName(spec));
return MkTypeName(specs, decl);
}

struct TypeName * QMkClass(const char * spec, struct Declarator * decl)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

ListAdd(specs, MkSpecifierName(spec));
return MkTypeName(specs, decl);
}

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

void __ecereUnregisterModule_shortcuts(struct __ecereNameSpace__ecere__com__Instance * module)
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

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__File;

struct Declarator * SpecDeclFromString(const char * string, struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * baseDecl)
{
struct Location oldLocation = yylloc;
struct Declarator * decl = (((void *)0));
struct __ecereNameSpace__ecere__com__Instance * backFileInput = fileInput;

if(!string)
string = "void()";
fileInput = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);
(__extension__ ({
int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, unsigned int size, unsigned int count);

__internal_VirtualMethod = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, const void *  buffer, unsigned int size, unsigned int count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = fileInput;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write]);
__internal_VirtualMethod ? __internal_VirtualMethod(fileInput, string, 1, strlen(string)) : (int)1;
}));
(__extension__ ({
unsigned int (*  __internal_VirtualMethod)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode);

__internal_VirtualMethod = ((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = fileInput;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek]);
__internal_VirtualMethod ? __internal_VirtualMethod(fileInput, 0, 0) : (unsigned int)1;
}));
echoOn = 0;
parseTypeError = 0;
parsedType = (((void *)0));
declMode = structDeclMode = 0;
resetScanner();
{
unsigned int oldParsingType = parsingType;

parsingType = 1;
type_yyparse();
parsingType = oldParsingType;
}
declMode = structDeclMode = 2;
type_yydebug = 0;
(__ecereNameSpace__ecere__com__eInstance_DecRef(fileInput), fileInput = 0);
if(parsedType)
{
if(parsedType->qualifiers)
{
struct Specifier * spec;

for(; (spec = (*parsedType->qualifiers).first); )
{
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove((&*parsedType->qualifiers), spec);
__ecereMethod___ecereNameSpace__ecere__sys__OldList_Add((&*specs), spec);
}
}
if(parsedType->bitCount)
{
parsedType->declarator = MkStructDeclarator(parsedType->declarator, parsedType->bitCount);
parsedType->bitCount = (((void *)0));
}
decl = PlugDeclarator(parsedType->declarator, baseDecl);
FreeTypeName(parsedType);
parsedType = (((void *)0));
if(parseTypeError)
{
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "parsing type %s\n", (((void *)0))), string);
}
}
else
{
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString("ec", "parsing type %s\n", (((void *)0))), string);
decl = baseDecl;
}
yylloc = oldLocation;
fileInput = backFileInput;
return decl;
}

void __ecereRegisterModule_shortcuts(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetParsingType", "void SetParsingType(bool b)", SetParsingType, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PlugDeclarator", "Declarator PlugDeclarator(Declarator decl, Declarator baseDecl)", PlugDeclarator, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QMkPtrDecl", "Declarator QMkPtrDecl(const char * id)", QMkPtrDecl, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QMkType", "TypeName QMkType(const char * spec, Declarator decl)", QMkType, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QMkClass", "TypeName QMkClass(const char * spec, Declarator decl)", QMkClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QBrackets", "Expression QBrackets(Expression exp)", QBrackets, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QMkExpId", "Expression QMkExpId(const char * id)", QMkExpId, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QMkExpCond", "Expression QMkExpCond(Expression cond, Expression exp, Expression elseExp)", QMkExpCond, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QMkDeclaration", "Declaration QMkDeclaration(const char * name, InitDeclarator initDecl)", QMkDeclaration, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QMkDeclarationBase", "Declaration QMkDeclarationBase(int base, InitDeclarator initDecl)", QMkDeclarationBase, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QMkString", "char * QMkString(const char * source)", QMkString, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetFuncDecl", "Declarator GetFuncDecl(Declarator decl)", GetFuncDecl, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SpecDeclFromString", "Declarator SpecDeclFromString(const char * string, ecere::sys::OldList * specs, Declarator baseDecl)", SpecDeclFromString, module, 1);
}

