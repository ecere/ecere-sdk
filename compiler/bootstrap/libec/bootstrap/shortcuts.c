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

struct TypeName
{
struct TypeName * prev;
struct TypeName * next;
struct Location loc;
struct __ecereNameSpace__ecere__sys__OldList *  qualifiers;
struct Declarator * declarator;
int classObjectType;
struct Expression * bitCount;
} __attribute__ ((gcc_struct));

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
} __attribute__ ((gcc_struct)) structDecl;
struct
{
struct Expression * exp;
struct Specifier * enumClass;
} __attribute__ ((gcc_struct)) array;
struct
{
struct __ecereNameSpace__ecere__sys__OldList * parameters;
} __attribute__ ((gcc_struct)) function;
struct
{
struct Pointer * pointer;
} __attribute__ ((gcc_struct)) pointer;
struct
{
struct ExtDecl * extended;
} __attribute__ ((gcc_struct)) extended;
} __attribute__ ((gcc_struct));
} __attribute__ ((gcc_struct));

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

unsigned int parsingType;

void SetParsingType(unsigned int b)
{
parsingType = b;
}

extern struct TypeName * parsedType;

extern unsigned int echoOn;

extern unsigned int type_yydebug;

extern struct Location yylloc;

int type_yyparse();

void resetScannerPos(struct CodePosition * pos);

extern struct Declarator * CopyDeclarator(struct Declarator * declarator);

extern int printf(char * , ...);

extern void FreeDeclarator(struct Declarator * decl);

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
printf("");
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

extern struct Declarator * MkDeclaratorIdentifier(struct Identifier * id);

extern struct Identifier * MkIdentifier(char *  string);

extern struct Declarator * MkDeclaratorPointer(struct Pointer * pointer, struct Declarator * declarator);

extern struct Pointer * MkPointer(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Pointer * pointer);

struct Declarator * QMkPtrDecl(char * id)
{
struct Declarator * declarator = id ? MkDeclaratorIdentifier(MkIdentifier(id)) : (((void *)0));

return MkDeclaratorPointer(MkPointer((((void *)0)), (((void *)0))), declarator);
}

extern struct __ecereNameSpace__ecere__sys__OldList *  MkList(void);

extern void ListAdd(struct __ecereNameSpace__ecere__sys__OldList * list, void *  item);

extern struct Specifier * MkSpecifierName(char *  name);

extern struct TypeName * MkTypeName(struct __ecereNameSpace__ecere__sys__OldList * qualifiers, struct Declarator * declarator);

struct TypeName * QMkType(char * spec, struct Declarator * decl)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

ListAdd(specs, MkSpecifierName(spec));
return MkTypeName(specs, decl);
}

struct TypeName * QMkClass(char * spec, struct Declarator * decl)
{
struct __ecereNameSpace__ecere__sys__OldList * specs = MkList();

ListAdd(specs, MkSpecifierName(spec));
return MkTypeName(specs, decl);
}

extern struct Expression * MkExpBrackets(struct __ecereNameSpace__ecere__sys__OldList * expressions);

struct Expression * QBrackets(struct Expression * exp)
{
struct __ecereNameSpace__ecere__sys__OldList * expList = MkList();

ListAdd(expList, exp);
return MkExpBrackets(expList);
}

extern struct Expression * MkExpIdentifier(struct Identifier * id);

struct Expression * QMkExpId(char * id)
{
return MkExpIdentifier(MkIdentifier(id));
}

extern struct Expression * MkExpCondition(struct Expression * cond, struct __ecereNameSpace__ecere__sys__OldList * expressions, struct Expression * elseExp);

struct Expression * QMkExpCond(struct Expression * cond, struct Expression * exp, struct Expression * elseExp)
{
struct __ecereNameSpace__ecere__sys__OldList * expList = MkList();

ListAdd(expList, exp);
return MkExpCondition(cond, expList, elseExp);
}

extern struct Declaration * MkDeclaration(struct __ecereNameSpace__ecere__sys__OldList * specifiers, struct __ecereNameSpace__ecere__sys__OldList * initDeclarators);

struct Declaration * QMkDeclaration(char * name, struct InitDeclarator * initDecl)
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

extern struct Specifier * MkSpecifier(int specifier);

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

extern char *  __ecereNameSpace__ecere__sys__CopyString(char *  string);

char * QMkString(char * source)
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

struct Declarator * GetFuncDecl(struct Declarator * decl)
{
while(decl && decl->type != 4 && decl->type != 1)
decl = decl->declarator;
return (decl && decl->type == 4) ? decl : (((void *)0));
}

unsigned int parseTypeError;

extern struct __ecereNameSpace__ecere__com__Instance * fileInput;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__TempFile;

struct __ecereNameSpace__ecere__sys__TempFile
{
char __ecere_padding[24];
} __attribute__ ((gcc_struct));

extern int strlen(const char * );

extern int declMode;

extern void resetScanner();

extern struct Declarator * MkStructDeclarator(struct Declarator * declarator, struct Expression * exp);

extern void FreeTypeName(struct TypeName * typeName);

extern void Compiler_Warning(char *  format, ...);

extern char *  __ecereNameSpace__ecere__GetTranslatedString(struct __ecereNameSpace__ecere__com__Instance * module, char *  string, char *  stringAndContext);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Write;

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek;

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Remove(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

void __ecereMethod___ecereNameSpace__ecere__sys__OldList_Add(struct __ecereNameSpace__ecere__sys__OldList * this, void *  item);

struct Declarator * SpecDeclFromString(char * string, struct __ecereNameSpace__ecere__sys__OldList * specs, struct Declarator * baseDecl)
{
struct Location oldLocation = yylloc;
struct Declarator * decl = (((void *)0));
struct __ecereNameSpace__ecere__com__Instance * backFileInput = fileInput;

if(!string)
string = "void()";
fileInput = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass___ecereNameSpace__ecere__sys__TempFile);
((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))fileInput->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Write])(fileInput, string, 1, strlen(string));
((unsigned int (*)(struct __ecereNameSpace__ecere__com__Instance *, int pos, int mode))fileInput->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Seek])(fileInput, 0, 0);
echoOn = 0x0;
parseTypeError = 0x0;
parsedType = (((void *)0));
declMode = (int)0;
resetScanner();
{
unsigned int oldParsingType = parsingType;

parsingType = 0x1;
type_yyparse();
parsingType = oldParsingType;
}
declMode = 2;
type_yydebug = 0x0;
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
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "parsing type %s\n", (((void *)0))), string);
}
}
else
{
Compiler_Warning(__ecereNameSpace__ecere__GetTranslatedString(__thisModule, "parsing type %s\n", (((void *)0))), string);
decl = baseDecl;
}
yylloc = oldLocation;
fileInput = backFileInput;
return decl;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

void __ecereRegisterModule_shortcuts(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetParsingType", "void SetParsingType(bool b)", SetParsingType, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("PlugDeclarator", "Declarator PlugDeclarator(Declarator decl, Declarator baseDecl)", PlugDeclarator, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QMkPtrDecl", "Declarator QMkPtrDecl(char * id)", QMkPtrDecl, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QMkType", "TypeName QMkType(char * spec, Declarator decl)", QMkType, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QMkClass", "TypeName QMkClass(char * spec, Declarator decl)", QMkClass, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QBrackets", "Expression QBrackets(Expression exp)", QBrackets, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QMkExpId", "Expression QMkExpId(char * id)", QMkExpId, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QMkExpCond", "Expression QMkExpCond(Expression cond, Expression exp, Expression elseExp)", QMkExpCond, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QMkDeclaration", "Declaration QMkDeclaration(char * name, InitDeclarator initDecl)", QMkDeclaration, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QMkDeclarationBase", "Declaration QMkDeclarationBase(int base, InitDeclarator initDecl)", QMkDeclarationBase, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("QMkString", "char * QMkString(char * source)", QMkString, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("GetFuncDecl", "Declarator GetFuncDecl(Declarator decl)", GetFuncDecl, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SpecDeclFromString", "Declarator SpecDeclFromString(char * string, ecere::sys::OldList * specs, Declarator baseDecl)", SpecDeclFromString, module, 1);
}

void __ecereUnregisterModule_shortcuts(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

