/* Code generated from eC source file: lexer.ec */
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

#if /*defined(_W64) || */(defined(__WORDSIZE) && __WORDSIZE == 8) || defined(__x86_64__)
#define _64BIT 1
#else
#define _64BIT 0
#endif

#define arch_PointerSize                  sizeof(void *)
#define structSize_Instance               (_64BIT ? 24 : 12)

extern void *  __ecereNameSpace__ecere__com__eSystem_New(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_New0(unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew(void *  memory, unsigned int size);

extern void *  __ecereNameSpace__ecere__com__eSystem_Renew0(void *  memory, unsigned int size);

extern void __ecereNameSpace__ecere__com__eSystem_Delete(void *  memory);

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
void (*  Set)(void * , int);
int (*  Get)(void * );
unsigned int (*  IsSet)(void * );
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
int included;
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
unsigned int isInstanceClass;
unsigned int byValueSystemClass;
} __attribute__ ((gcc_struct));

extern long long __ecereNameSpace__ecere__com__eClass_GetProperty(struct __ecereNameSpace__ecere__com__Class * _class, char *  name);

extern void __ecereNameSpace__ecere__com__eInstance_FireSelfWatchers(struct __ecereNameSpace__ecere__com__Instance * instance, struct __ecereNameSpace__ecere__com__Property * _property);

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

void exit(int status);

void * calloc(size_t nmemb, size_t size);

void free(void * ptr);

void * malloc(size_t size);

void * realloc(void * ptr, size_t size);

long int strtol(const char * nptr, char ** endptr, int base);

long long int strtoll(const char * nptr, char ** endptr, int base);

unsigned long long int strtoull(const char * nptr, char ** endptr, int base);

typedef __builtin_va_list va_list;

typedef void FILE;

FILE * bsl_stdin(void);

FILE * bsl_stdout(void);

FILE * bsl_stderr(void);

char * fgets(char * s, int size, FILE * stream);

FILE * fopen(const char * path, const char * mode);

int fclose(FILE * fp);

int fflush(FILE * stream);

int fgetc(FILE * stream);

int fprintf(FILE * stream, const char * format, ...);

int fputc(int c, FILE * stream);

size_t fread(void * ptr, size_t size, size_t nmemb, FILE * stream);

size_t fwrite(const void * ptr, size_t size, size_t nmemb, FILE * stream);

int vsnprintf(char *, size_t, const char *, ...);

int snprintf(char * str, size_t, const char * format, ...);

int fseek(FILE * stream, long offset, int whence);

long ftell(FILE * stream);

int feof(FILE * stream);

int ferror(FILE * stream);

int fileno(FILE * stream);

typedef struct yy_buffer_state * YY_BUFFER_STATE;

extern int yyleng;

extern FILE * yyin, * yyout;

typedef unsigned int yy_size_t;

struct yy_buffer_state
{
FILE * yy_input_file;
char * yy_ch_buf;
char * yy_buf_pos;
yy_size_t yy_buf_size;
int yy_n_chars;
int yy_is_our_buffer;
int yy_is_interactive;
int yy_at_bol;
int yy_fill_buffer;
int yy_buffer_status;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_yy_buffer_state;

static YY_BUFFER_STATE yy_current_buffer = 0;

static char yy_hold_char;

static int yy_n_chars;

int yyleng;

static char * yy_c_buf_p = (char *)0;

static int yy_init = 1;

static int yy_start = 0;

static int yy_did_buffer_switch_on_eof;

void yyrestart(FILE * input_file);

void yy_switch_to_buffer(YY_BUFFER_STATE new_buffer);

void yy_load_buffer_state(void);

YY_BUFFER_STATE yy_create_buffer(FILE * file, int size);

void yy_delete_buffer(YY_BUFFER_STATE b);

void yy_init_buffer(YY_BUFFER_STATE b, FILE * file);

void yy_flush_buffer(YY_BUFFER_STATE b);

YY_BUFFER_STATE yy_scan_buffer(char * base, yy_size_t size);

YY_BUFFER_STATE yy_scan_string(const char * yy_str);

YY_BUFFER_STATE yy_scan_bytes(const char * bytes, int len);

static void * yy_flex_alloc(yy_size_t);

static void * yy_flex_realloc(void *, yy_size_t);

static void yy_flex_free(void *);

typedef unsigned char YY_CHAR;

FILE * yyin = (FILE *)0, * yyout = (FILE *)0;

typedef int yy_state_type;

extern char * yytext;

static yy_state_type yy_get_previous_state(void);

static yy_state_type yy_try_NUL_trans(yy_state_type current_state);

static int yy_get_next_buffer(void);

static void yy_fatal_error(const char msg[]);

static const short int yy_accept[697] = 
{
(short)0, (short)112, (short)112, (short)174, (short)172, (short)170, (short)169, (short)168, (short)171, (short)155, (short)172, (short)1, (short)167, (short)161, (short)154, (short)172, (short)149, (short)150, (short)159, (short)158, (short)146, (short)157, (short)153, (short)160, (short)115, (short)115, (short)147, (short)143, (short)162, (short)148, (short)163, (short)166, (short)112, (short)112, (short)112, (short)151, (short)152, (short)164, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)144, (short)165, (short)145, (short)156, (short)142, (short)0, (short)120, (short)0, (short)128, (short)145, (short)137, (short)129, (short)0, (short)0, (short)126, (short)134, (short)124, (short)135, (short)125, (short)136, (short)0, (short)118, (short)2, (short)3, (short)127, (short)119, (short)114, (short)0, (short)115, (short)0, (short)115, (short)112, (short)152, (short)144, (short)151, (short)133, (short)139, (short)141, (short)140, (short)132, (short)0, (short)112, (short)0, (short)112, (short)0, (short)0, (short)130, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)11, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)19, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)131, (short)138, (short)116, (short)121, (short)0, (short)118, (short)118, (short)0, (short)119, (short)114, (short)0, (short)117, (short)113, (short)112, (short)123, (short)122, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)92, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)17, (short)45, (short)112, (short)112, (short)112, (short)112, (short)20, (short)112, (short)112, (short)112, (short)51, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)44, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)0, (short)118, (short)0, (short)118, (short)0, (short)119, (short)117, (short)113, (short)112, (short)112, (short)61, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)4, (short)112, (short)6, (short)7, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)13, (short)14, (short)112, (short)112, (short)112, (short)18, (short)112, (short)112, (short)112, (short)112, (short)112, (short)22, (short)112, (short)52, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)21, (short)112, (short)112, (short)112, (short)38, (short)112, (short)112, (short)112, (short)0, (short)118, (short)62, (short)112, (short)112, (short)112, (short)93, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)5, (short)47, (short)8, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)16, (short)112, (short)112, (short)112, (short)58, (short)46, (short)112, (short)112, (short)112, (short)112, (short)112, (short)53, (short)112, (short)112, (short)25, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)36, (short)112, (short)112, (short)112, (short)95, (short)42, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)56, (short)50, (short)112, (short)112, (short)12, (short)15, (short)112, (short)55, (short)88, (short)72, (short)112, (short)112, (short)112, (short)84, (short)112, (short)54, (short)112, (short)24, (short)26, (short)29, (short)31, (short)112, (short)112, (short)33, (short)112, (short)34, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)91, (short)112, (short)112, (short)76, (short)82, (short)112, (short)112, (short)112, (short)57, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)70, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)109, (short)110, (short)108, (short)10, (short)112, (short)112, (short)112, (short)112, (short)85, (short)112, (short)112, (short)112, (short)80, (short)112, (short)112, (short)112, (short)112, (short)35, (short)112, (short)49, (short)112, (short)112, (short)63, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)71, (short)112, (short)27, (short)112, (short)32, (short)94, (short)112, (short)112, (short)79, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)9, (short)112, (short)112, (short)112, (short)112, (short)112, (short)43, (short)23, (short)65, (short)112, (short)106, (short)112, (short)112, (short)37, (short)39, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)77, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)74, (short)75, (short)112, (short)107, (short)112, (short)112, (short)48, (short)112, (short)98, (short)64, (short)112, (short)112, (short)112, (short)112, (short)112, (short)69, (short)81, (short)28, (short)112, (short)41, (short)112, (short)87, (short)104, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)30, (short)68, (short)112, (short)0, (short)112, (short)112, (short)78, (short)112, (short)90, (short)112, (short)112, (short)101, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)73, (short)0, (short)112, (short)83, (short)40, (short)112, (short)112, (short)112, (short)112, (short)112, (short)97, (short)112, (short)96, (short)86, (short)67, (short)112, (short)112, (short)89, (short)112, (short)112, (short)112, (short)112, (short)111, (short)112, (short)112, (short)112, (short)112, (short)112, (short)99, (short)112, (short)105, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)60, (short)112, (short)112, (short)112, (short)112, (short)112, (short)59, (short)112, (short)112, (short)103, (short)112, (short)112, (short)100, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)102, (short)112, (short)66, (short)0
};

static const int yy_ec[256] = 
{
0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 4, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 22, 22, 23, 22, 24, 22, 22, 22, 25, 26, 27, 28, 29, 30, 1, 31, 32, 33, 31, 34, 35, 36, 36, 37, 38, 36, 39, 36, 36, 36, 36, 36, 36, 36, 36, 40, 36, 36, 41, 36, 36, 42, 43, 44, 45, 46, 1, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 36, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
};

static const int yy_meta[76] = 
{
0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 1, 4, 1, 1, 1, 1, 1, 1, 5, 5, 5, 5, 2, 1, 1, 1, 1, 1, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 1, 1, 1, 1, 7, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 1, 1, 1, 1
};

static const short int yy_base[705] = 
{
(short)0, (short)0, (short)0, (short)229, (short)2412, (short)2412, (short)2412, (short)2412, (short)2412, (short)200, (short)69, (short)2412, (short)2412, (short)49, (short)68, (short)156, (short)2412, (short)2412, (short)167, (short)64, (short)2412, (short)65, (short)63, (short)75, (short)94, (short)78, (short)79, (short)2412, (short)95, (short)164, (short)60, (short)2412, (short)86, (short)96, (short)118, (short)2412, (short)2412, (short)160, (short)129, (short)113, (short)126, (short)144, (short)153, (short)116, (short)157, (short)145, (short)161, (short)133, (short)156, (short)172, (short)197, (short)198, (short)205, (short)216, (short)199, (short)208, (short)2412, (short)53, (short)2412, (short)2412, (short)2412, (short)99, (short)2412, (short)184, (short)2412, (short)2412, (short)2412, (short)2412, (short)147, (short)136, (short)2412, (short)2412, (short)2412, (short)2412, (short)2412, (short)2412, (short)152, (short)256, (short)2412, (short)2412, (short)2412, (short)294, (short)334, (short)221, (short)230, (short)0, (short)0, (short)0, (short)2412, (short)2412, (short)2412, (short)137, (short)2412, (short)2412, (short)2412, (short)125, (short)111, (short)206, (short)89, (short)221, (short)103, (short)66, (short)2412, (short)236, (short)240, (short)215, (short)390, (short)273, (short)262, (short)278, (short)281, (short)288, (short)294, (short)309, (short)298, (short)225, (short)314, (short)310, (short)299, (short)329, (short)352, (short)354, (short)316, (short)319, (short)355, (short)377, (short)380, (short)386, (short)388, (short)384, (short)395, (short)382, (short)397, (short)403, (short)392, (short)405, (short)407, (short)408, (short)423, (short)425, (short)433, (short)452, (short)458, (short)456, (short)460, (short)463, (short)469, (short)471, (short)476, (short)479, (short)478, (short)480, (short)489, (short)481, (short)497, (short)2412, (short)2412, (short)2412, (short)2412, (short)513, (short)516, (short)554, (short)540, (short)544, (short)576, (short)402, (short)622, (short)581, (short)0, (short)2412, (short)2412, (short)0, (short)491, (short)534, (short)507, (short)576, (short)600, (short)569, (short)579, (short)573, (short)488, (short)592, (short)597, (short)616, (short)638, (short)642, (short)644, (short)643, (short)645, (short)651, (short)661, (short)662, (short)664, (short)668, (short)671, (short)673, (short)674, (short)677, (short)680, (short)689, (short)679, (short)695, (short)696, (short)702, (short)704, (short)705, (short)706, (short)707, (short)711, (short)729, (short)730, (short)734, (short)735, (short)750, (short)752, (short)753, (short)755, (short)756, (short)757, (short)758, (short)763, (short)760, (short)761, (short)762, (short)778, (short)779, (short)780, (short)781, (short)787, (short)788, (short)789, (short)791, (short)806, (short)807, (short)810, (short)811, (short)813, (short)814, (short)818, (short)815, (short)823, (short)830, (short)835, (short)833, (short)839, (short)848, (short)843, (short)842, (short)862, (short)880, (short)889, (short)880, (short)899, (short)903, (short)904, (short)908, (short)0, (short)850, (short)869, (short)919, (short)940, (short)942, (short)944, (short)946, (short)947, (short)959, (short)950, (short)957, (short)962, (short)965, (short)967, (short)969, (short)968, (short)972, (short)975, (short)978, (short)985, (short)993, (short)995, (short)998, (short)1002, (short)1004, (short)1017, (short)1020, (short)1023, (short)1024, (short)1026, (short)1028, (short)1030, (short)1035, (short)1043, (short)1041, (short)1045, (short)1046, (short)1047, (short)1048, (short)1050, (short)1056, (short)1051, (short)1054, (short)1069, (short)1071, (short)1073, (short)1074, (short)1079, (short)1076, (short)1091, (short)1096, (short)1097, (short)1099, (short)1104, (short)1109, (short)1112, (short)1115, (short)1119, (short)1120, (short)1122, (short)1124, (short)1125, (short)1130, (short)1132, (short)1135, (short)1142, (short)1145, (short)1147, (short)1150, (short)1152, (short)1153, (short)1154, (short)1169, (short)1160, (short)1175, (short)1180, (short)1182, (short)1187, (short)1193, (short)1195, (short)1200, (short)1200, (short)1205, (short)1205, (short)1206, (short)1221, (short)1225, (short)1227, (short)1229, (short)1230, (short)1232, (short)1234, (short)1236, (short)1242, (short)1249, (short)1255, (short)1252, (short)1258, (short)1257, (short)1259, (short)1260, (short)1261, (short)1264, (short)1276, (short)1280, (short)1284, (short)1288, (short)1289, (short)1291, (short)1296, (short)1301, (short)1304, (short)1308, (short)1309, (short)1312, (short)1314, (short)1317, (short)1319, (short)1320, (short)1327, (short)1329, (short)1330, (short)1332, (short)1335, (short)1336, (short)1339, (short)1338, (short)1347, (short)1355, (short)1358, (short)1362, (short)1360, (short)1368, (short)1373, (short)1380, (short)1381, (short)1385, (short)1386, (short)1388, (short)1390, (short)1391, (short)1396, (short)1393, (short)1397, (short)1401, (short)1403, (short)1413, (short)1409, (short)1420, (short)1421, (short)1426, (short)1431, (short)1437, (short)1441, (short)1442, (short)1446, (short)1449, (short)1452, (short)1454, (short)1458, (short)1459, (short)1461, (short)1462, (short)1471, (short)1465, (short)1464, (short)1483, (short)1474, (short)1486, (short)1480, (short)1487, (short)1489, (short)1492, (short)1490, (short)1493, (short)1512, (short)1515, (short)1519, (short)1517, (short)1521, (short)1525, (short)1534, (short)1536, (short)1540, (short)1543, (short)1544, (short)1545, (short)1546, (short)1552, (short)1555, (short)1562, (short)1564, (short)1567, (short)1568, (short)1571, (short)1573, (short)1575, (short)1577, (short)1583, (short)1584, (short)1586, (short)1590, (short)1595, (short)1596, (short)1599, (short)1602, (short)1605, (short)1612, (short)1614, (short)1617, (short)1618, (short)1620, (short)1622, (short)1623, (short)1624, (short)1627, (short)1630, (short)1633, (short)1635, (short)1640, (short)1642, (short)1648, (short)1651, (short)1657, (short)1664, (short)1673, (short)1668, (short)1674, (short)1675, (short)1676, (short)1680, (short)1679, (short)1681, (short)1684, (short)1691, (short)1692, (short)1696, (short)1697, (short)1701, (short)1702, (short)1707, (short)1724, (short)1726, (short)1727, (short)1729, (short)1730, (short)1732, (short)1734, (short)1735, (short)1742, (short)1747, (short)1751, (short)1753, (short)1754, (short)1755, (short)1757, (short)1758, (short)1760, (short)1762, (short)1763, (short)1770, (short)1775, (short)1778, (short)1779, (short)1781, (short)1783, (short)1788, (short)1790, (short)1791, (short)1794, (short)1807, (short)1810, (short)1803, (short)1811, (short)1816, (short)1818, (short)1820, (short)1822, (short)1823, (short)1827, (short)1839, (short)1842, (short)1844, (short)1848, (short)1845, (short)1850, (short)1852, (short)1855, (short)1857, (short)1860, (short)1861, (short)1867, (short)1868, (short)1872, (short)1873, (short)1876, (short)1879, (short)1883, (short)1891, (short)1895, (short)1899, (short)1904, (short)1906, (short)1911, (short)1912, (short)1917, (short)1916, (short)1919, (short)1923, (short)1921, (short)1924, (short)1927, (short)1928, (short)1929, (short)1934, (short)1936, (short)1939, (short)1945, (short)1952, (short)1954, (short)1958, (short)1960, (short)1965, (short)1977, (short)1985, (short)1986, (short)1987, (short)1989, (short)1988, (short)1992, (short)1993, (short)1995, (short)2004, (short)2005, (short)2008, (short)2010, (short)2014, (short)2020, (short)2017, (short)2021, (short)2023, (short)2025, (short)2029, (short)2030, (short)2036, (short)2038, (short)2041, (short)2045, (short)2047, (short)2049, (short)2053, (short)2054, (short)2057, (short)2058, (short)2062, (short)2070, (short)2074, (short)2075, (short)2077, (short)84, (short)2081, (short)2083, (short)2078, (short)2085, (short)2090, (short)2098, (short)2100, (short)2101, (short)2103, (short)2119, (short)2121, (short)2122, (short)2123, (short)2124, (short)2125, (short)2128, (short)2127, (short)2412, (short)77, (short)2129, (short)2126, (short)2130, (short)2132, (short)2134, (short)2151, (short)2155, (short)2156, (short)2158, (short)2159, (short)2168, (short)2176, (short)2178, (short)2180, (short)2181, (short)2183, (short)2184, (short)2188, (short)2189, (short)2193, (short)2196, (short)2200, (short)2204, (short)2201, (short)2212, (short)2208, (short)2211, (short)2213, (short)2216, (short)2221, (short)2223, (short)2231, (short)2229, (short)2232, (short)2233, (short)2234, (short)2236, (short)2244, (short)2249, (short)2251, (short)2254, (short)2260, (short)2264, (short)2267, (short)2269, (short)2279, (short)2280, (short)2285, (short)2291, (short)2292, (short)2295, (short)2296, (short)2297, (short)2298, (short)2300, (short)2308, (short)2315, (short)2313, (short)2316, (short)2318, (short)2412, (short)2378, (short)2385, (short)2391, (short)2394, (short)2395, (short)2398, (short)2400, (short)2404
};

static const short int yy_def[705] = 
{
(short)0, (short)696, (short)1, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)697, (short)696, (short)696, (short)696, (short)696, (short)698, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)24, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)699, (short)699, (short)699, (short)696, (short)696, (short)696, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)696, (short)696, (short)696, (short)696, (short)696, (short)697, (short)696, (short)697, (short)696, (short)696, (short)696, (short)696, (short)698, (short)698, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)700, (short)25, (short)701, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)699, (short)696, (short)699, (short)697, (short)698, (short)696, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)700, (short)702, (short)696, (short)696, (short)703, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)696, (short)77, (short)696, (short)696, (short)696, (short)81, (short)696, (short)696, (short)702, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)696, (short)161, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)704, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)696, (short)704, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)699, (short)0, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696
};

static const short int yy_nxt[2488] = 
{
(short)0, (short)4, (short)5, (short)6, (short)7, (short)8, (short)9, (short)10, (short)11, (short)12, (short)13, (short)14, (short)15, (short)16, (short)17, (short)18, (short)19, (short)20, (short)21, (short)22, (short)23, (short)24, (short)25, (short)25, (short)25, (short)26, (short)27, (short)28, (short)29, (short)30, (short)31, (short)32, (short)33, (short)32, (short)32, (short)32, (short)32, (short)32, (short)32, (short)34, (short)32, (short)32, (short)35, (short)4, (short)36, (short)37, (short)38, (short)39, (short)40, (short)41, (short)42, (short)43, (short)44, (short)45, (short)32, (short)46, (short)32, (short)32, (short)47, (short)32, (short)48, (short)32, (short)49, (short)50, (short)51, (short)52, (short)53, (short)54, (short)55, (short)32, (short)32, (short)32, (short)56, (short)57, (short)58, (short)59, (short)62, (short)64, (short)65, (short)66, (short)71, (short)155, (short)76, (short)73, (short)77, (short)77, (short)77, (short)77, (short)94, (short)95, (short)78, (short)634, (short)72, (short)74, (short)75, (short)79, (short)67, (short)96, (short)634, (short)86, (short)86, (short)86, (short)86, (short)80, (short)87, (short)89, (short)62, (short)96, (short)88, (short)69, (short)62, (short)98, (short)63, (short)81, (short)171, (short)82, (short)82, (short)82, (short)82, (short)696, (short)90, (short)98, (short)91, (short)92, (short)96, (short)100, (short)156, (short)96, (short)83, (short)96, (short)101, (short)84, (short)84, (short)84, (short)84, (short)85, (short)98, (short)96, (short)98, (short)696, (short)96, (short)98, (short)63, (short)98, (short)96, (short)83, (short)63, (short)696, (short)68, (short)84, (short)84, (short)98, (short)84, (short)170, (short)98, (short)96, (short)96, (short)99, (short)98, (short)157, (short)84, (short)103, (short)104, (short)85, (short)96, (short)169, (short)105, (short)96, (short)96, (short)98, (short)98, (short)158, (short)96, (short)110, (short)123, (short)106, (short)124, (short)111, (short)98, (short)112, (short)107, (short)98, (short)98, (short)96, (short)108, (short)125, (short)98, (short)696, (short)102, (short)113, (short)69, (short)114, (short)93, (short)109, (short)135, (short)70, (short)129, (short)98, (short)115, (short)69, (short)118, (short)119, (short)116, (short)136, (short)120, (short)117, (short)130, (short)137, (short)96, (short)96, (short)96, (short)121, (short)126, (short)131, (short)122, (short)127, (short)96, (short)96, (short)128, (short)96, (short)132, (short)133, (short)98, (short)98, (short)98, (short)134, (short)96, (short)96, (short)60, (short)696, (short)98, (short)98, (short)96, (short)98, (short)696, (short)138, (short)96, (short)165, (short)139, (short)165, (short)98, (short)98, (short)166, (short)166, (short)166, (short)166, (short)98, (short)96, (short)140, (short)141, (short)98, (short)96, (short)142, (short)143, (short)151, (short)153, (short)696, (short)696, (short)696, (short)147, (short)152, (short)98, (short)154, (short)144, (short)145, (short)98, (short)146, (short)84, (short)84, (short)84, (short)84, (short)149, (short)194, (short)96, (short)175, (short)148, (short)150, (short)77, (short)77, (short)77, (short)77, (short)696, (short)172, (short)696, (short)96, (short)84, (short)84, (short)98, (short)84, (short)96, (short)159, (short)160, (short)96, (short)160, (short)160, (short)160, (short)84, (short)173, (short)98, (short)96, (short)696, (short)174, (short)696, (short)98, (short)696, (short)96, (short)98, (short)159, (short)160, (short)96, (short)96, (short)160, (short)160, (short)98, (short)160, (short)161, (short)161, (short)161, (short)161, (short)98, (short)96, (short)96, (short)187, (short)98, (short)98, (short)96, (short)696, (short)96, (short)162, (short)163, (short)96, (short)163, (short)163, (short)163, (short)98, (short)98, (short)696, (short)696, (short)696, (short)98, (short)96, (short)98, (short)186, (short)188, (short)98, (short)162, (short)163, (short)190, (short)696, (short)163, (short)163, (short)189, (short)163, (short)81, (short)98, (short)82, (short)82, (short)82, (short)82, (short)191, (short)192, (short)195, (short)193, (short)96, (short)197, (short)96, (short)96, (short)696, (short)83, (short)696, (short)196, (short)164, (short)164, (short)164, (short)164, (short)696, (short)696, (short)98, (short)696, (short)98, (short)98, (short)198, (short)204, (short)205, (short)199, (short)83, (short)696, (short)696, (short)96, (short)164, (short)164, (short)96, (short)164, (short)96, (short)200, (short)96, (short)696, (short)96, (short)696, (short)96, (short)164, (short)96, (short)98, (short)96, (short)201, (short)98, (short)96, (short)98, (short)96, (short)98, (short)202, (short)98, (short)203, (short)98, (short)96, (short)98, (short)96, (short)98, (short)96, (short)96, (short)98, (short)206, (short)98, (short)166, (short)166, (short)166, (short)166, (short)696, (short)98, (short)696, (short)98, (short)696, (short)98, (short)98, (short)96, (short)696, (short)96, (short)176, (short)177, (short)178, (short)179, (short)180, (short)207, (short)208, (short)96, (short)181, (short)696, (short)209, (short)98, (short)211, (short)98, (short)210, (short)214, (short)182, (short)183, (short)184, (short)217, (short)185, (short)98, (short)213, (short)212, (short)215, (short)696, (short)96, (short)696, (short)218, (short)219, (short)96, (short)216, (short)96, (short)696, (short)96, (short)696, (short)223, (short)96, (short)696, (short)220, (short)98, (short)221, (short)696, (short)96, (short)98, (short)96, (short)98, (short)222, (short)98, (short)224, (short)96, (short)98, (short)96, (short)96, (short)96, (short)96, (short)225, (short)98, (short)696, (short)98, (short)226, (short)227, (short)96, (short)96, (short)98, (short)96, (short)98, (short)98, (short)98, (short)98, (short)232, (short)96, (short)230, (short)233, (short)236, (short)696, (short)98, (short)98, (short)696, (short)98, (short)228, (short)96, (short)229, (short)696, (short)234, (short)98, (short)235, (short)237, (short)696, (short)238, (short)231, (short)696, (short)248, (short)696, (short)248, (short)98, (short)241, (short)249, (short)249, (short)249, (short)249, (short)239, (short)240, (short)696, (short)696, (short)242, (short)243, (short)244, (short)96, (short)246, (short)245, (short)696, (short)258, (short)696, (short)160, (short)247, (short)160, (short)160, (short)160, (short)252, (short)269, (short)252, (short)98, (short)696, (short)253, (short)253, (short)253, (short)253, (short)696, (short)260, (short)696, (short)160, (short)696, (short)696, (short)160, (short)160, (short)696, (short)160, (short)161, (short)161, (short)161, (short)161, (short)163, (short)96, (short)163, (short)163, (short)163, (short)96, (short)696, (short)696, (short)96, (short)250, (short)251, (short)96, (short)251, (short)251, (short)251, (short)98, (short)259, (short)163, (short)696, (short)98, (short)163, (short)163, (short)98, (short)163, (short)96, (short)98, (short)250, (short)251, (short)696, (short)96, (short)251, (short)251, (short)96, (short)251, (short)164, (short)164, (short)164, (short)164, (short)98, (short)255, (short)255, (short)255, (short)255, (short)98, (short)261, (short)268, (short)98, (short)696, (short)96, (short)696, (short)266, (short)696, (short)164, (short)164, (short)696, (short)164, (short)265, (short)255, (short)255, (short)696, (short)255, (short)267, (short)98, (short)164, (short)166, (short)166, (short)166, (short)166, (short)255, (short)271, (short)96, (short)696, (short)696, (short)270, (short)96, (short)96, (short)96, (short)96, (short)254, (short)262, (short)254, (short)254, (short)254, (short)96, (short)98, (short)263, (short)264, (short)696, (short)98, (short)98, (short)98, (short)98, (short)272, (short)96, (short)96, (short)254, (short)96, (short)98, (short)254, (short)254, (short)96, (short)254, (short)273, (short)96, (short)696, (short)96, (short)96, (short)98, (short)98, (short)96, (short)98, (short)96, (short)96, (short)274, (short)98, (short)696, (short)279, (short)98, (short)280, (short)98, (short)98, (short)96, (short)278, (short)98, (short)276, (short)98, (short)98, (short)96, (short)96, (short)275, (short)277, (short)696, (short)282, (short)696, (short)96, (short)98, (short)96, (short)96, (short)96, (short)96, (short)283, (short)98, (short)98, (short)96, (short)281, (short)288, (short)696, (short)291, (short)98, (short)696, (short)98, (short)98, (short)98, (short)98, (short)696, (short)284, (short)289, (short)98, (short)285, (short)286, (short)287, (short)96, (short)96, (short)292, (short)696, (short)696, (short)96, (short)96, (short)294, (short)696, (short)290, (short)293, (short)696, (short)297, (short)295, (short)98, (short)98, (short)298, (short)296, (short)300, (short)98, (short)98, (short)96, (short)301, (short)96, (short)96, (short)299, (short)96, (short)96, (short)96, (short)96, (short)696, (short)96, (short)96, (short)96, (short)96, (short)98, (short)302, (short)98, (short)98, (short)307, (short)98, (short)98, (short)98, (short)98, (short)311, (short)98, (short)98, (short)98, (short)98, (short)96, (short)96, (short)96, (short)96, (short)696, (short)696, (short)696, (short)303, (short)696, (short)96, (short)96, (short)96, (short)696, (short)96, (short)98, (short)98, (short)98, (short)98, (short)308, (short)306, (short)310, (short)309, (short)304, (short)98, (short)98, (short)98, (short)305, (short)98, (short)96, (short)96, (short)696, (short)314, (short)96, (short)96, (short)313, (short)96, (short)96, (short)96, (short)312, (short)696, (short)96, (short)316, (short)98, (short)98, (short)315, (short)96, (short)98, (short)98, (short)696, (short)98, (short)98, (short)98, (short)96, (short)321, (short)98, (short)96, (short)317, (short)96, (short)318, (short)98, (short)320, (short)96, (short)319, (short)696, (short)96, (short)96, (short)98, (short)323, (short)696, (short)98, (short)96, (short)98, (short)96, (short)326, (short)696, (short)98, (short)696, (short)329, (short)98, (short)98, (short)696, (short)696, (short)322, (short)324, (short)98, (short)696, (short)98, (short)696, (short)325, (short)696, (short)327, (short)96, (short)696, (short)328, (short)249, (short)249, (short)249, (short)249, (short)696, (short)330, (short)334, (short)332, (short)331, (short)336, (short)696, (short)98, (short)335, (short)696, (short)696, (short)333, (short)696, (short)337, (short)249, (short)249, (short)249, (short)249, (short)338, (short)696, (short)338, (short)696, (short)696, (short)339, (short)339, (short)339, (short)339, (short)696, (short)251, (short)696, (short)251, (short)251, (short)251, (short)253, (short)253, (short)253, (short)253, (short)253, (short)253, (short)253, (short)253, (short)696, (short)696, (short)96, (short)696, (short)251, (short)696, (short)696, (short)251, (short)251, (short)696, (short)251, (short)254, (short)696, (short)254, (short)254, (short)254, (short)98, (short)255, (short)255, (short)255, (short)255, (short)696, (short)696, (short)96, (short)696, (short)96, (short)696, (short)96, (short)254, (short)96, (short)96, (short)254, (short)254, (short)96, (short)254, (short)255, (short)255, (short)98, (short)255, (short)98, (short)96, (short)98, (short)96, (short)98, (short)98, (short)96, (short)255, (short)98, (short)96, (short)340, (short)96, (short)96, (short)96, (short)696, (short)98, (short)96, (short)98, (short)696, (short)96, (short)98, (short)696, (short)96, (short)98, (short)696, (short)98, (short)98, (short)98, (short)342, (short)96, (short)98, (short)696, (short)343, (short)98, (short)347, (short)341, (short)98, (short)96, (short)344, (short)96, (short)696, (short)696, (short)96, (short)98, (short)349, (short)345, (short)96, (short)346, (short)96, (short)696, (short)348, (short)98, (short)696, (short)98, (short)354, (short)355, (short)98, (short)696, (short)351, (short)696, (short)98, (short)96, (short)98, (short)350, (short)96, (short)352, (short)353, (short)96, (short)96, (short)696, (short)96, (short)356, (short)96, (short)357, (short)96, (short)98, (short)358, (short)359, (short)98, (short)96, (short)361, (short)98, (short)98, (short)360, (short)98, (short)96, (short)98, (short)96, (short)98, (short)96, (short)96, (short)96, (short)96, (short)98, (short)96, (short)96, (short)362, (short)696, (short)96, (short)98, (short)96, (short)98, (short)696, (short)98, (short)98, (short)98, (short)98, (short)363, (short)98, (short)98, (short)696, (short)367, (short)98, (short)96, (short)98, (short)96, (short)366, (short)96, (short)96, (short)368, (short)96, (short)364, (short)370, (short)96, (short)365, (short)696, (short)369, (short)98, (short)696, (short)98, (short)696, (short)98, (short)98, (short)696, (short)98, (short)96, (short)696, (short)98, (short)696, (short)372, (short)96, (short)96, (short)375, (short)96, (short)371, (short)373, (short)696, (short)376, (short)96, (short)98, (short)374, (short)696, (short)383, (short)96, (short)98, (short)98, (short)96, (short)98, (short)696, (short)96, (short)381, (short)696, (short)98, (short)96, (short)96, (short)377, (short)96, (short)98, (short)96, (short)96, (short)98, (short)379, (short)378, (short)98, (short)96, (short)380, (short)96, (short)98, (short)98, (short)96, (short)98, (short)696, (short)98, (short)98, (short)382, (short)696, (short)96, (short)696, (short)98, (short)96, (short)98, (short)96, (short)386, (short)98, (short)96, (short)384, (short)96, (short)96, (short)96, (short)387, (short)98, (short)385, (short)696, (short)98, (short)96, (short)98, (short)696, (short)388, (short)98, (short)696, (short)98, (short)98, (short)98, (short)96, (short)696, (short)696, (short)394, (short)389, (short)98, (short)96, (short)391, (short)392, (short)696, (short)390, (short)96, (short)397, (short)96, (short)98, (short)393, (short)395, (short)396, (short)96, (short)399, (short)98, (short)696, (short)401, (short)402, (short)96, (short)98, (short)96, (short)98, (short)696, (short)696, (short)400, (short)96, (short)98, (short)696, (short)696, (short)398, (short)96, (short)96, (short)98, (short)403, (short)98, (short)339, (short)339, (short)339, (short)339, (short)98, (short)339, (short)339, (short)339, (short)339, (short)98, (short)98, (short)96, (short)405, (short)696, (short)404, (short)96, (short)696, (short)96, (short)696, (short)96, (short)96, (short)696, (short)96, (short)696, (short)96, (short)98, (short)96, (short)406, (short)408, (short)98, (short)409, (short)98, (short)96, (short)98, (short)98, (short)696, (short)98, (short)407, (short)98, (short)96, (short)98, (short)696, (short)96, (short)410, (short)696, (short)96, (short)98, (short)96, (short)96, (short)96, (short)96, (short)96, (short)413, (short)98, (short)96, (short)411, (short)98, (short)412, (short)421, (short)98, (short)416, (short)98, (short)98, (short)98, (short)98, (short)98, (short)96, (short)415, (short)98, (short)696, (short)96, (short)414, (short)419, (short)418, (short)96, (short)696, (short)696, (short)417, (short)96, (short)96, (short)98, (short)96, (short)696, (short)420, (short)98, (short)424, (short)96, (short)427, (short)98, (short)425, (short)426, (short)96, (short)98, (short)98, (short)96, (short)98, (short)422, (short)423, (short)96, (short)96, (short)98, (short)696, (short)96, (short)428, (short)96, (short)98, (short)430, (short)96, (short)98, (short)96, (short)96, (short)431, (short)98, (short)98, (short)432, (short)429, (short)98, (short)96, (short)98, (short)96, (short)96, (short)98, (short)96, (short)98, (short)98, (short)96, (short)96, (short)434, (short)96, (short)96, (short)696, (short)98, (short)696, (short)98, (short)98, (short)433, (short)98, (short)96, (short)436, (short)98, (short)98, (short)435, (short)98, (short)98, (short)439, (short)96, (short)437, (short)440, (short)96, (short)438, (short)96, (short)98, (short)96, (short)696, (short)696, (short)696, (short)445, (short)443, (short)96, (short)98, (short)441, (short)442, (short)98, (short)96, (short)98, (short)696, (short)98, (short)447, (short)444, (short)448, (short)96, (short)96, (short)98, (short)454, (short)696, (short)96, (short)96, (short)98, (short)96, (short)446, (short)96, (short)96, (short)696, (short)96, (short)98, (short)98, (short)96, (short)96, (short)452, (short)98, (short)98, (short)96, (short)98, (short)96, (short)98, (short)98, (short)449, (short)98, (short)696, (short)96, (short)98, (short)98, (short)450, (short)96, (short)451, (short)98, (short)696, (short)98, (short)696, (short)696, (short)96, (short)96, (short)453, (short)98, (short)455, (short)457, (short)96, (short)98, (short)459, (short)458, (short)456, (short)96, (short)461, (short)463, (short)98, (short)98, (short)696, (short)96, (short)460, (short)696, (short)98, (short)96, (short)96, (short)696, (short)464, (short)98, (short)96, (short)462, (short)466, (short)96, (short)465, (short)98, (short)96, (short)467, (short)96, (short)98, (short)98, (short)469, (short)96, (short)96, (short)98, (short)96, (short)96, (short)98, (short)96, (short)96, (short)98, (short)471, (short)98, (short)468, (short)470, (short)96, (short)98, (short)98, (short)96, (short)98, (short)98, (short)483, (short)98, (short)98, (short)96, (short)472, (short)696, (short)96, (short)475, (short)98, (short)96, (short)96, (short)98, (short)96, (short)96, (short)473, (short)96, (short)96, (short)98, (short)474, (short)476, (short)98, (short)696, (short)696, (short)98, (short)98, (short)696, (short)98, (short)98, (short)478, (short)98, (short)98, (short)477, (short)696, (short)486, (short)481, (short)96, (short)479, (short)480, (short)96, (short)484, (short)96, (short)696, (short)96, (short)482, (short)96, (short)487, (short)485, (short)696, (short)96, (short)98, (short)696, (short)696, (short)98, (short)488, (short)98, (short)491, (short)98, (short)96, (short)98, (short)96, (short)492, (short)493, (short)98, (short)96, (short)489, (short)490, (short)96, (short)96, (short)96, (short)96, (short)696, (short)98, (short)696, (short)98, (short)494, (short)96, (short)495, (short)98, (short)96, (short)500, (short)98, (short)98, (short)98, (short)98, (short)496, (short)96, (short)497, (short)96, (short)502, (short)98, (short)96, (short)96, (short)98, (short)498, (short)96, (short)499, (short)96, (short)696, (short)96, (short)98, (short)96, (short)98, (short)501, (short)696, (short)98, (short)98, (short)96, (short)96, (short)98, (short)96, (short)98, (short)503, (short)98, (short)96, (short)98, (short)696, (short)504, (short)505, (short)96, (short)96, (short)98, (short)98, (short)96, (short)98, (short)696, (short)96, (short)507, (short)98, (short)96, (short)506, (short)696, (short)508, (short)98, (short)98, (short)696, (short)96, (short)98, (short)96, (short)510, (short)98, (short)96, (short)96, (short)98, (short)96, (short)511, (short)96, (short)96, (short)96, (short)509, (short)98, (short)96, (short)98, (short)696, (short)96, (short)98, (short)98, (short)96, (short)98, (short)96, (short)98, (short)98, (short)98, (short)696, (short)96, (short)98, (short)96, (short)512, (short)98, (short)696, (short)696, (short)98, (short)96, (short)98, (short)515, (short)96, (short)696, (short)513, (short)98, (short)696, (short)98, (short)96, (short)514, (short)517, (short)518, (short)521, (short)98, (short)696, (short)96, (short)98, (short)523, (short)516, (short)96, (short)519, (short)520, (short)98, (short)696, (short)96, (short)96, (short)96, (short)96, (short)525, (short)98, (short)96, (short)96, (short)96, (short)98, (short)524, (short)96, (short)522, (short)526, (short)98, (short)98, (short)98, (short)98, (short)96, (short)96, (short)98, (short)98, (short)98, (short)96, (short)96, (short)98, (short)696, (short)696, (short)96, (short)96, (short)696, (short)696, (short)98, (short)98, (short)96, (short)527, (short)696, (short)98, (short)98, (short)696, (short)529, (short)531, (short)98, (short)98, (short)528, (short)530, (short)533, (short)534, (short)98, (short)696, (short)532, (short)96, (short)535, (short)96, (short)96, (short)536, (short)96, (short)96, (short)696, (short)96, (short)539, (short)96, (short)96, (short)538, (short)540, (short)98, (short)537, (short)98, (short)98, (short)96, (short)98, (short)98, (short)541, (short)98, (short)96, (short)98, (short)98, (short)696, (short)96, (short)542, (short)96, (short)96, (short)96, (short)98, (short)96, (short)96, (short)543, (short)96, (short)98, (short)96, (short)96, (short)544, (short)98, (short)545, (short)98, (short)98, (short)98, (short)96, (short)98, (short)98, (short)696, (short)98, (short)96, (short)98, (short)98, (short)96, (short)96, (short)548, (short)96, (short)696, (short)96, (short)98, (short)549, (short)546, (short)547, (short)96, (short)98, (short)96, (short)96, (short)98, (short)98, (short)96, (short)98, (short)553, (short)98, (short)696, (short)696, (short)556, (short)696, (short)98, (short)96, (short)98, (short)98, (short)551, (short)96, (short)98, (short)552, (short)96, (short)96, (short)550, (short)554, (short)557, (short)555, (short)96, (short)98, (short)96, (short)558, (short)96, (short)98, (short)96, (short)96, (short)98, (short)98, (short)696, (short)96, (short)559, (short)696, (short)98, (short)561, (short)98, (short)696, (short)98, (short)696, (short)98, (short)98, (short)566, (short)96, (short)560, (short)98, (short)96, (short)563, (short)96, (short)96, (short)562, (short)564, (short)96, (short)567, (short)96, (short)568, (short)96, (short)98, (short)565, (short)96, (short)98, (short)96, (short)98, (short)98, (short)96, (short)96, (short)98, (short)696, (short)98, (short)569, (short)98, (short)96, (short)96, (short)98, (short)570, (short)98, (short)96, (short)96, (short)98, (short)98, (short)96, (short)571, (short)696, (short)96, (short)572, (short)98, (short)98, (short)96, (short)696, (short)577, (short)98, (short)98, (short)696, (short)574, (short)98, (short)96, (short)579, (short)98, (short)696, (short)96, (short)696, (short)98, (short)573, (short)96, (short)696, (short)575, (short)578, (short)576, (short)96, (short)98, (short)96, (short)584, (short)583, (short)98, (short)582, (short)96, (short)96, (short)98, (short)580, (short)581, (short)96, (short)96, (short)98, (short)96, (short)98, (short)96, (short)585, (short)96, (short)96, (short)98, (short)98, (short)96, (short)96, (short)96, (short)98, (short)98, (short)696, (short)98, (short)96, (short)98, (short)96, (short)98, (short)98, (short)96, (short)587, (short)98, (short)98, (short)98, (short)586, (short)96, (short)588, (short)590, (short)98, (short)696, (short)98, (short)592, (short)96, (short)98, (short)96, (short)696, (short)595, (short)593, (short)96, (short)98, (short)96, (short)696, (short)597, (short)598, (short)696, (short)96, (short)98, (short)696, (short)98, (short)599, (short)589, (short)591, (short)98, (short)594, (short)98, (short)602, (short)696, (short)96, (short)596, (short)98, (short)696, (short)603, (short)696, (short)600, (short)696, (short)96, (short)96, (short)96, (short)96, (short)96, (short)601, (short)98, (short)96, (short)96, (short)605, (short)96, (short)604, (short)696, (short)606, (short)98, (short)98, (short)98, (short)98, (short)98, (short)96, (short)96, (short)98, (short)98, (short)96, (short)98, (short)96, (short)607, (short)696, (short)696, (short)96, (short)608, (short)616, (short)96, (short)98, (short)98, (short)96, (short)96, (short)98, (short)96, (short)98, (short)96, (short)609, (short)610, (short)98, (short)96, (short)96, (short)98, (short)611, (short)612, (short)98, (short)98, (short)96, (short)98, (short)96, (short)98, (short)613, (short)96, (short)696, (short)98, (short)98, (short)96, (short)696, (short)96, (short)614, (short)96, (short)98, (short)696, (short)98, (short)96, (short)96, (short)98, (short)618, (short)96, (short)96, (short)98, (short)619, (short)98, (short)96, (short)98, (short)620, (short)621, (short)615, (short)98, (short)98, (short)617, (short)96, (short)98, (short)98, (short)696, (short)96, (short)96, (short)98, (short)96, (short)96, (short)696, (short)696, (short)96, (short)696, (short)96, (short)98, (short)96, (short)624, (short)623, (short)98, (short)98, (short)96, (short)98, (short)98, (short)626, (short)629, (short)98, (short)622, (short)98, (short)96, (short)98, (short)96, (short)96, (short)696, (short)96, (short)98, (short)627, (short)696, (short)625, (short)631, (short)628, (short)632, (short)630, (short)98, (short)633, (short)98, (short)98, (short)636, (short)98, (short)637, (short)96, (short)638, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)696, (short)96, (short)98, (short)96, (short)98, (short)98, (short)98, (short)98, (short)98, (short)98, (short)98, (short)98, (short)98, (short)98, (short)639, (short)98, (short)696, (short)98, (short)640, (short)696, (short)96, (short)696, (short)696, (short)641, (short)96, (short)96, (short)696, (short)96, (short)96, (short)696, (short)643, (short)650, (short)648, (short)651, (short)98, (short)646, (short)649, (short)96, (short)98, (short)98, (short)642, (short)98, (short)98, (short)653, (short)644, (short)96, (short)645, (short)96, (short)647, (short)96, (short)96, (short)98, (short)96, (short)96, (short)696, (short)652, (short)654, (short)96, (short)96, (short)98, (short)696, (short)98, (short)96, (short)98, (short)98, (short)96, (short)98, (short)98, (short)657, (short)96, (short)96, (short)98, (short)98, (short)96, (short)656, (short)696, (short)98, (short)96, (short)655, (short)98, (short)96, (short)96, (short)96, (short)98, (short)98, (short)96, (short)659, (short)98, (short)661, (short)658, (short)96, (short)98, (short)96, (short)696, (short)98, (short)98, (short)98, (short)660, (short)96, (short)98, (short)96, (short)96, (short)96, (short)96, (short)98, (short)96, (short)98, (short)663, (short)696, (short)662, (short)696, (short)665, (short)98, (short)96, (short)98, (short)98, (short)98, (short)98, (short)96, (short)98, (short)96, (short)664, (short)667, (short)96, (short)666, (short)668, (short)696, (short)98, (short)669, (short)96, (short)696, (short)696, (short)98, (short)96, (short)98, (short)670, (short)96, (short)98, (short)96, (short)696, (short)671, (short)696, (short)673, (short)98, (short)672, (short)678, (short)676, (short)98, (short)96, (short)96, (short)98, (short)674, (short)98, (short)675, (short)96, (short)677, (short)696, (short)696, (short)696, (short)696, (short)96, (short)96, (short)98, (short)98, (short)96, (short)96, (short)96, (short)96, (short)98, (short)96, (short)680, (short)683, (short)679, (short)681, (short)98, (short)98, (short)696, (short)96, (short)98, (short)98, (short)98, (short)98, (short)96, (short)98, (short)96, (short)96, (short)696, (short)96, (short)682, (short)684, (short)686, (short)98, (short)696, (short)696, (short)696, (short)696, (short)98, (short)685, (short)98, (short)98, (short)687, (short)98, (short)696, (short)696, (short)696, (short)696, (short)690, (short)696, (short)692, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)689, (short)688, (short)694, (short)695, (short)691, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)693, (short)61, (short)61, (short)61, (short)61, (short)61, (short)61, (short)61, (short)68, (short)68, (short)696, (short)68, (short)68, (short)68, (short)68, (short)97, (short)696, (short)696, (short)97, (short)97, (short)97, (short)167, (short)167, (short)168, (short)168, (short)256, (short)256, (short)256, (short)257, (short)257, (short)635, (short)635, (short)635, (short)635, (short)3, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696
};

static const short int yy_chk[2488] = 
{
(short)0, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)10, (short)13, (short)13, (short)14, (short)19, (short)57, (short)22, (short)21, (short)22, (short)22, (short)22, (short)22, (short)30, (short)30, (short)23, (short)635, (short)19, (short)21, (short)21, (short)23, (short)14, (short)32, (short)616, (short)25, (short)25, (short)25, (short)25, (short)23, (short)26, (short)28, (short)61, (short)33, (short)26, (short)101, (short)100, (short)32, (short)10, (short)24, (short)98, (short)24, (short)24, (short)24, (short)24, (short)25, (short)28, (short)33, (short)28, (short)28, (short)39, (short)34, (short)57, (short)43, (short)24, (short)34, (short)34, (short)24, (short)24, (short)24, (short)24, (short)24, (short)96, (short)40, (short)39, (short)69, (short)38, (short)43, (short)61, (short)34, (short)47, (short)24, (short)100, (short)25, (short)69, (short)24, (short)24, (short)40, (short)24, (short)95, (short)38, (short)41, (short)45, (short)33, (short)47, (short)68, (short)24, (short)38, (short)38, (short)24, (short)42, (short)91, (short)38, (short)48, (short)44, (short)41, (short)45, (short)76, (short)46, (short)39, (short)43, (short)38, (short)43, (short)39, (short)42, (short)39, (short)38, (short)48, (short)44, (short)49, (short)38, (short)43, (short)46, (short)63, (short)37, (short)40, (short)68, (short)41, (short)29, (short)38, (short)47, (short)18, (short)45, (short)49, (short)41, (short)15, (short)42, (short)42, (short)41, (short)48, (short)42, (short)41, (short)45, (short)48, (short)50, (short)51, (short)54, (short)42, (short)44, (short)46, (short)42, (short)44, (short)52, (short)97, (short)44, (short)55, (short)46, (short)46, (short)50, (short)51, (short)54, (short)46, (short)105, (short)53, (short)9, (short)3, (short)52, (short)97, (short)99, (short)55, (short)0, (short)49, (short)115, (short)83, (short)49, (short)83, (short)105, (short)53, (short)83, (short)83, (short)83, (short)83, (short)99, (short)103, (short)50, (short)51, (short)115, (short)104, (short)51, (short)51, (short)54, (short)55, (short)0, (short)0, (short)0, (short)52, (short)54, (short)103, (short)55, (short)51, (short)51, (short)104, (short)51, (short)84, (short)84, (short)84, (short)84, (short)53, (short)115, (short)108, (short)105, (short)52, (short)53, (short)77, (short)77, (short)77, (short)77, (short)0, (short)99, (short)0, (short)107, (short)84, (short)84, (short)108, (short)84, (short)109, (short)77, (short)77, (short)110, (short)77, (short)77, (short)77, (short)84, (short)103, (short)107, (short)111, (short)0, (short)104, (short)0, (short)109, (short)0, (short)112, (short)110, (short)77, (short)77, (short)114, (short)118, (short)77, (short)77, (short)111, (short)77, (short)81, (short)81, (short)81, (short)81, (short)112, (short)113, (short)117, (short)108, (short)114, (short)118, (short)116, (short)0, (short)122, (short)81, (short)81, (short)123, (short)81, (short)81, (short)81, (short)113, (short)117, (short)0, (short)0, (short)0, (short)116, (short)119, (short)122, (short)107, (short)109, (short)123, (short)81, (short)81, (short)111, (short)0, (short)81, (short)81, (short)110, (short)81, (short)82, (short)119, (short)82, (short)82, (short)82, (short)82, (short)112, (short)113, (short)116, (short)114, (short)120, (short)118, (short)121, (short)124, (short)0, (short)82, (short)0, (short)117, (short)82, (short)82, (short)82, (short)82, (short)0, (short)0, (short)120, (short)0, (short)121, (short)124, (short)119, (short)122, (short)123, (short)119, (short)82, (short)0, (short)0, (short)125, (short)82, (short)82, (short)126, (short)82, (short)131, (short)119, (short)129, (short)0, (short)127, (short)0, (short)128, (short)82, (short)106, (short)125, (short)134, (short)120, (short)126, (short)130, (short)131, (short)132, (short)129, (short)120, (short)127, (short)121, (short)128, (short)133, (short)106, (short)135, (short)134, (short)136, (short)137, (short)130, (short)124, (short)132, (short)165, (short)165, (short)165, (short)165, (short)0, (short)133, (short)0, (short)135, (short)0, (short)136, (short)137, (short)138, (short)0, (short)139, (short)106, (short)106, (short)106, (short)106, (short)106, (short)125, (short)126, (short)140, (short)106, (short)0, (short)127, (short)138, (short)129, (short)139, (short)128, (short)133, (short)106, (short)106, (short)106, (short)134, (short)106, (short)140, (short)132, (short)130, (short)133, (short)0, (short)141, (short)0, (short)135, (short)136, (short)143, (short)133, (short)142, (short)0, (short)144, (short)0, (short)139, (short)145, (short)0, (short)137, (short)141, (short)138, (short)0, (short)146, (short)143, (short)147, (short)142, (short)138, (short)144, (short)140, (short)148, (short)145, (short)150, (short)149, (short)151, (short)153, (short)140, (short)146, (short)0, (short)147, (short)140, (short)140, (short)180, (short)152, (short)148, (short)172, (short)150, (short)149, (short)151, (short)153, (short)144, (short)154, (short)143, (short)144, (short)145, (short)0, (short)180, (short)152, (short)0, (short)172, (short)141, (short)174, (short)142, (short)0, (short)144, (short)154, (short)144, (short)146, (short)0, (short)147, (short)143, (short)0, (short)159, (short)0, (short)159, (short)174, (short)150, (short)159, (short)159, (short)159, (short)159, (short)148, (short)149, (short)0, (short)0, (short)150, (short)151, (short)152, (short)173, (short)153, (short)152, (short)0, (short)172, (short)0, (short)160, (short)154, (short)160, (short)160, (short)160, (short)162, (short)180, (short)162, (short)173, (short)0, (short)162, (short)162, (short)162, (short)162, (short)0, (short)174, (short)0, (short)160, (short)0, (short)0, (short)160, (short)160, (short)0, (short)160, (short)161, (short)161, (short)161, (short)161, (short)163, (short)177, (short)163, (short)163, (short)163, (short)179, (short)0, (short)0, (short)175, (short)161, (short)161, (short)178, (short)161, (short)161, (short)161, (short)177, (short)173, (short)163, (short)0, (short)179, (short)163, (short)163, (short)175, (short)163, (short)181, (short)178, (short)161, (short)161, (short)0, (short)182, (short)161, (short)161, (short)176, (short)161, (short)164, (short)164, (short)164, (short)164, (short)181, (short)167, (short)167, (short)167, (short)167, (short)182, (short)175, (short)179, (short)176, (short)0, (short)183, (short)0, (short)178, (short)0, (short)164, (short)164, (short)0, (short)164, (short)177, (short)167, (short)167, (short)0, (short)167, (short)178, (short)183, (short)164, (short)166, (short)166, (short)166, (short)166, (short)167, (short)182, (short)184, (short)0, (short)0, (short)181, (short)185, (short)187, (short)186, (short)188, (short)166, (short)176, (short)166, (short)166, (short)166, (short)189, (short)184, (short)176, (short)176, (short)0, (short)185, (short)187, (short)186, (short)188, (short)183, (short)190, (short)191, (short)166, (short)192, (short)189, (short)166, (short)166, (short)193, (short)166, (short)183, (short)194, (short)0, (short)195, (short)196, (short)190, (short)191, (short)197, (short)192, (short)200, (short)198, (short)184, (short)193, (short)0, (short)188, (short)194, (short)189, (short)195, (short)196, (short)199, (short)187, (short)197, (short)185, (short)200, (short)198, (short)201, (short)202, (short)184, (short)186, (short)0, (short)192, (short)0, (short)203, (short)199, (short)204, (short)205, (short)206, (short)207, (short)193, (short)201, (short)202, (short)208, (short)191, (short)197, (short)0, (short)200, (short)203, (short)0, (short)204, (short)205, (short)206, (short)207, (short)0, (short)194, (short)198, (short)208, (short)195, (short)196, (short)196, (short)209, (short)210, (short)201, (short)0, (short)0, (short)211, (short)212, (short)202, (short)0, (short)199, (short)201, (short)0, (short)204, (short)203, (short)209, (short)210, (short)205, (short)203, (short)207, (short)211, (short)212, (short)213, (short)208, (short)214, (short)215, (short)206, (short)216, (short)217, (short)218, (short)219, (short)0, (short)221, (short)222, (short)223, (short)220, (short)213, (short)209, (short)214, (short)215, (short)216, (short)216, (short)217, (short)218, (short)219, (short)220, (short)221, (short)222, (short)223, (short)220, (short)224, (short)225, (short)226, (short)227, (short)0, (short)0, (short)0, (short)212, (short)0, (short)228, (short)229, (short)230, (short)0, (short)231, (short)224, (short)225, (short)226, (short)227, (short)217, (short)215, (short)219, (short)218, (short)213, (short)228, (short)229, (short)230, (short)214, (short)231, (short)232, (short)233, (short)0, (short)223, (short)234, (short)235, (short)222, (short)236, (short)237, (short)239, (short)221, (short)0, (short)238, (short)225, (short)232, (short)233, (short)224, (short)240, (short)234, (short)235, (short)0, (short)236, (short)237, (short)239, (short)241, (short)231, (short)238, (short)243, (short)226, (short)242, (short)227, (short)240, (short)230, (short)244, (short)229, (short)0, (short)247, (short)246, (short)241, (short)233, (short)0, (short)243, (short)245, (short)242, (short)257, (short)236, (short)0, (short)244, (short)0, (short)239, (short)247, (short)246, (short)0, (short)0, (short)232, (short)234, (short)245, (short)0, (short)257, (short)0, (short)235, (short)0, (short)237, (short)258, (short)0, (short)238, (short)248, (short)248, (short)248, (short)248, (short)0, (short)240, (short)244, (short)242, (short)241, (short)246, (short)0, (short)258, (short)245, (short)0, (short)0, (short)243, (short)0, (short)247, (short)249, (short)249, (short)249, (short)249, (short)250, (short)0, (short)250, (short)0, (short)0, (short)250, (short)250, (short)250, (short)250, (short)249, (short)251, (short)0, (short)251, (short)251, (short)251, (short)252, (short)252, (short)252, (short)252, (short)253, (short)253, (short)253, (short)253, (short)0, (short)0, (short)259, (short)249, (short)251, (short)0, (short)0, (short)251, (short)251, (short)253, (short)251, (short)254, (short)0, (short)254, (short)254, (short)254, (short)259, (short)255, (short)255, (short)255, (short)255, (short)0, (short)0, (short)260, (short)0, (short)261, (short)253, (short)262, (short)254, (short)263, (short)264, (short)254, (short)254, (short)266, (short)254, (short)255, (short)255, (short)260, (short)255, (short)261, (short)267, (short)262, (short)265, (short)263, (short)264, (short)268, (short)255, (short)266, (short)269, (short)259, (short)270, (short)272, (short)271, (short)0, (short)267, (short)273, (short)265, (short)0, (short)274, (short)268, (short)0, (short)275, (short)269, (short)0, (short)270, (short)272, (short)271, (short)261, (short)276, (short)273, (short)0, (short)262, (short)274, (short)266, (short)260, (short)275, (short)277, (short)263, (short)278, (short)0, (short)0, (short)279, (short)276, (short)268, (short)264, (short)280, (short)265, (short)281, (short)0, (short)267, (short)277, (short)0, (short)278, (short)272, (short)273, (short)279, (short)0, (short)270, (short)0, (short)280, (short)282, (short)281, (short)269, (short)283, (short)270, (short)271, (short)284, (short)285, (short)0, (short)286, (short)274, (short)287, (short)275, (short)288, (short)282, (short)276, (short)277, (short)283, (short)289, (short)279, (short)284, (short)285, (short)278, (short)286, (short)291, (short)287, (short)290, (short)288, (short)292, (short)293, (short)294, (short)295, (short)289, (short)296, (short)298, (short)280, (short)0, (short)299, (short)291, (short)297, (short)290, (short)0, (short)292, (short)293, (short)294, (short)295, (short)282, (short)296, (short)298, (short)0, (short)288, (short)299, (short)300, (short)297, (short)301, (short)287, (short)302, (short)303, (short)289, (short)305, (short)285, (short)291, (short)304, (short)286, (short)0, (short)290, (short)300, (short)0, (short)301, (short)0, (short)302, (short)303, (short)0, (short)305, (short)306, (short)0, (short)304, (short)0, (short)293, (short)307, (short)308, (short)296, (short)309, (short)292, (short)294, (short)0, (short)297, (short)310, (short)306, (short)295, (short)0, (short)307, (short)311, (short)307, (short)308, (short)312, (short)309, (short)0, (short)313, (short)305, (short)0, (short)310, (short)314, (short)315, (short)300, (short)316, (short)311, (short)317, (short)318, (short)312, (short)302, (short)301, (short)313, (short)319, (short)304, (short)320, (short)314, (short)315, (short)321, (short)316, (short)0, (short)317, (short)318, (short)306, (short)0, (short)322, (short)0, (short)319, (short)323, (short)320, (short)324, (short)312, (short)321, (short)325, (short)308, (short)326, (short)327, (short)328, (short)313, (short)322, (short)310, (short)0, (short)323, (short)330, (short)324, (short)0, (short)314, (short)325, (short)0, (short)326, (short)327, (short)328, (short)329, (short)0, (short)0, (short)320, (short)315, (short)330, (short)331, (short)317, (short)318, (short)0, (short)316, (short)332, (short)323, (short)333, (short)329, (short)319, (short)321, (short)322, (short)334, (short)325, (short)331, (short)0, (short)327, (short)328, (short)335, (short)332, (short)336, (short)333, (short)0, (short)0, (short)326, (short)337, (short)334, (short)0, (short)0, (short)324, (short)340, (short)341, (short)335, (short)329, (short)336, (short)338, (short)338, (short)338, (short)338, (short)337, (short)339, (short)339, (short)339, (short)339, (short)340, (short)341, (short)342, (short)332, (short)0, (short)331, (short)343, (short)0, (short)344, (short)339, (short)345, (short)346, (short)0, (short)347, (short)0, (short)348, (short)342, (short)349, (short)333, (short)336, (short)343, (short)337, (short)344, (short)350, (short)345, (short)346, (short)339, (short)347, (short)335, (short)348, (short)351, (short)349, (short)0, (short)353, (short)341, (short)0, (short)352, (short)350, (short)355, (short)354, (short)356, (short)357, (short)358, (short)344, (short)351, (short)359, (short)342, (short)353, (short)343, (short)352, (short)352, (short)347, (short)355, (short)354, (short)356, (short)357, (short)358, (short)360, (short)346, (short)359, (short)0, (short)361, (short)345, (short)350, (short)349, (short)362, (short)0, (short)0, (short)348, (short)363, (short)364, (short)360, (short)365, (short)0, (short)351, (short)361, (short)355, (short)366, (short)358, (short)362, (short)356, (short)357, (short)367, (short)363, (short)364, (short)368, (short)365, (short)353, (short)354, (short)369, (short)370, (short)366, (short)0, (short)371, (short)359, (short)372, (short)367, (short)361, (short)373, (short)368, (short)374, (short)375, (short)362, (short)369, (short)370, (short)364, (short)360, (short)371, (short)376, (short)372, (short)377, (short)378, (short)373, (short)379, (short)374, (short)375, (short)380, (short)381, (short)367, (short)383, (short)382, (short)0, (short)376, (short)0, (short)377, (short)378, (short)366, (short)379, (short)384, (short)369, (short)380, (short)381, (short)368, (short)383, (short)382, (short)372, (short)385, (short)370, (short)373, (short)386, (short)371, (short)388, (short)384, (short)387, (short)0, (short)0, (short)0, (short)378, (short)376, (short)389, (short)385, (short)374, (short)375, (short)386, (short)390, (short)388, (short)0, (short)387, (short)381, (short)377, (short)382, (short)391, (short)392, (short)389, (short)390, (short)0, (short)393, (short)394, (short)390, (short)395, (short)380, (short)396, (short)397, (short)0, (short)399, (short)391, (short)392, (short)398, (short)400, (short)388, (short)393, (short)394, (short)401, (short)395, (short)402, (short)396, (short)397, (short)385, (short)399, (short)0, (short)404, (short)398, (short)400, (short)386, (short)403, (short)387, (short)401, (short)0, (short)402, (short)0, (short)0, (short)405, (short)406, (short)389, (short)404, (short)391, (short)394, (short)407, (short)403, (short)396, (short)395, (short)392, (short)408, (short)398, (short)400, (short)405, (short)406, (short)0, (short)409, (short)397, (short)0, (short)407, (short)410, (short)411, (short)0, (short)401, (short)408, (short)412, (short)399, (short)403, (short)413, (short)402, (short)409, (short)414, (short)403, (short)415, (short)410, (short)411, (short)406, (short)416, (short)417, (short)412, (short)418, (short)419, (short)413, (short)422, (short)421, (short)414, (short)408, (short)415, (short)405, (short)407, (short)420, (short)416, (short)417, (short)424, (short)418, (short)419, (short)421, (short)422, (short)421, (short)426, (short)410, (short)0, (short)423, (short)413, (short)420, (short)425, (short)427, (short)424, (short)428, (short)430, (short)411, (short)429, (short)431, (short)426, (short)412, (short)414, (short)423, (short)0, (short)0, (short)425, (short)427, (short)0, (short)428, (short)430, (short)416, (short)429, (short)431, (short)415, (short)0, (short)424, (short)419, (short)432, (short)417, (short)418, (short)433, (short)422, (short)435, (short)0, (short)434, (short)420, (short)436, (short)425, (short)423, (short)0, (short)437, (short)432, (short)0, (short)0, (short)433, (short)426, (short)435, (short)429, (short)434, (short)438, (short)436, (short)439, (short)430, (short)431, (short)437, (short)440, (short)427, (short)428, (short)441, (short)442, (short)443, (short)444, (short)0, (short)438, (short)0, (short)439, (short)432, (short)445, (short)432, (short)440, (short)446, (short)435, (short)441, (short)442, (short)443, (short)444, (short)432, (short)447, (short)432, (short)448, (short)437, (short)445, (short)449, (short)450, (short)446, (short)433, (short)451, (short)434, (short)452, (short)0, (short)453, (short)447, (short)454, (short)448, (short)436, (short)0, (short)449, (short)450, (short)455, (short)456, (short)451, (short)457, (short)452, (short)438, (short)453, (short)458, (short)454, (short)0, (short)441, (short)442, (short)459, (short)460, (short)455, (short)456, (short)461, (short)457, (short)0, (short)462, (short)449, (short)458, (short)463, (short)445, (short)0, (short)450, (short)459, (short)460, (short)0, (short)464, (short)461, (short)465, (short)453, (short)462, (short)466, (short)467, (short)463, (short)468, (short)455, (short)469, (short)470, (short)471, (short)451, (short)464, (short)472, (short)465, (short)0, (short)473, (short)466, (short)467, (short)474, (short)468, (short)475, (short)469, (short)470, (short)471, (short)0, (short)476, (short)472, (short)477, (short)460, (short)473, (short)0, (short)0, (short)474, (short)478, (short)475, (short)465, (short)479, (short)0, (short)461, (short)476, (short)0, (short)477, (short)480, (short)463, (short)467, (short)468, (short)471, (short)478, (short)0, (short)481, (short)479, (short)473, (short)466, (short)483, (short)469, (short)470, (short)480, (short)0, (short)482, (short)484, (short)485, (short)486, (short)476, (short)481, (short)488, (short)487, (short)489, (short)483, (short)474, (short)490, (short)472, (short)477, (short)482, (short)484, (short)485, (short)486, (short)491, (short)492, (short)488, (short)487, (short)489, (short)493, (short)494, (short)490, (short)0, (short)0, (short)495, (short)496, (short)0, (short)0, (short)491, (short)492, (short)497, (short)480, (short)0, (short)493, (short)494, (short)0, (short)482, (short)485, (short)495, (short)496, (short)481, (short)484, (short)487, (short)488, (short)497, (short)0, (short)486, (short)498, (short)489, (short)499, (short)500, (short)490, (short)501, (short)502, (short)0, (short)503, (short)494, (short)504, (short)505, (short)493, (short)494, (short)498, (short)492, (short)499, (short)500, (short)506, (short)501, (short)502, (short)495, (short)503, (short)507, (short)504, (short)505, (short)0, (short)508, (short)496, (short)509, (short)510, (short)511, (short)506, (short)512, (short)513, (short)497, (short)514, (short)507, (short)515, (short)516, (short)498, (short)508, (short)499, (short)509, (short)510, (short)511, (short)517, (short)512, (short)513, (short)0, (short)514, (short)518, (short)515, (short)516, (short)519, (short)520, (short)506, (short)521, (short)0, (short)522, (short)517, (short)507, (short)504, (short)505, (short)523, (short)518, (short)524, (short)525, (short)519, (short)520, (short)526, (short)521, (short)513, (short)522, (short)0, (short)0, (short)516, (short)0, (short)523, (short)529, (short)524, (short)525, (short)510, (short)527, (short)526, (short)511, (short)528, (short)530, (short)509, (short)514, (short)518, (short)515, (short)531, (short)529, (short)532, (short)520, (short)533, (short)527, (short)534, (short)535, (short)528, (short)530, (short)0, (short)536, (short)521, (short)0, (short)531, (short)524, (short)532, (short)0, (short)533, (short)0, (short)534, (short)535, (short)529, (short)537, (short)523, (short)536, (short)538, (short)526, (short)539, (short)541, (short)525, (short)527, (short)540, (short)530, (short)542, (short)531, (short)543, (short)537, (short)528, (short)544, (short)538, (short)545, (short)539, (short)541, (short)546, (short)547, (short)540, (short)0, (short)542, (short)532, (short)543, (short)548, (short)549, (short)544, (short)535, (short)545, (short)550, (short)551, (short)546, (short)547, (short)552, (short)536, (short)0, (short)553, (short)538, (short)548, (short)549, (short)554, (short)0, (short)542, (short)550, (short)551, (short)0, (short)540, (short)552, (short)555, (short)545, (short)553, (short)0, (short)556, (short)0, (short)554, (short)539, (short)557, (short)0, (short)540, (short)543, (short)541, (short)558, (short)555, (short)559, (short)550, (short)549, (short)556, (short)548, (short)560, (short)561, (short)557, (short)546, (short)547, (short)563, (short)562, (short)558, (short)564, (short)559, (short)566, (short)553, (short)565, (short)567, (short)560, (short)561, (short)568, (short)569, (short)570, (short)563, (short)562, (short)0, (short)564, (short)571, (short)566, (short)572, (short)565, (short)567, (short)573, (short)556, (short)568, (short)569, (short)570, (short)555, (short)574, (short)559, (short)561, (short)571, (short)0, (short)572, (short)563, (short)575, (short)573, (short)576, (short)0, (short)566, (short)564, (short)577, (short)574, (short)578, (short)0, (short)568, (short)569, (short)0, (short)579, (short)575, (short)0, (short)576, (short)570, (short)560, (short)562, (short)577, (short)565, (short)578, (short)573, (short)0, (short)580, (short)567, (short)579, (short)0, (short)574, (short)0, (short)571, (short)0, (short)581, (short)582, (short)583, (short)585, (short)584, (short)572, (short)580, (short)586, (short)587, (short)576, (short)588, (short)575, (short)0, (short)577, (short)581, (short)582, (short)583, (short)585, (short)584, (short)589, (short)590, (short)586, (short)587, (short)591, (short)588, (short)592, (short)578, (short)0, (short)0, (short)593, (short)579, (short)593, (short)595, (short)589, (short)590, (short)594, (short)596, (short)591, (short)597, (short)592, (short)598, (short)582, (short)584, (short)593, (short)599, (short)600, (short)595, (short)585, (short)587, (short)594, (short)596, (short)601, (short)597, (short)602, (short)598, (short)590, (short)603, (short)0, (short)599, (short)600, (short)604, (short)0, (short)605, (short)591, (short)606, (short)601, (short)0, (short)602, (short)607, (short)608, (short)603, (short)596, (short)609, (short)610, (short)604, (short)598, (short)605, (short)611, (short)606, (short)599, (short)600, (short)592, (short)607, (short)608, (short)594, (short)612, (short)609, (short)610, (short)0, (short)613, (short)614, (short)611, (short)615, (short)619, (short)0, (short)0, (short)617, (short)0, (short)618, (short)612, (short)620, (short)605, (short)604, (short)613, (short)614, (short)621, (short)615, (short)619, (short)607, (short)610, (short)617, (short)603, (short)618, (short)622, (short)620, (short)623, (short)624, (short)0, (short)625, (short)621, (short)608, (short)0, (short)606, (short)612, (short)609, (short)614, (short)611, (short)622, (short)615, (short)623, (short)624, (short)617, (short)625, (short)618, (short)626, (short)620, (short)627, (short)628, (short)629, (short)630, (short)631, (short)637, (short)633, (short)632, (short)636, (short)638, (short)0, (short)639, (short)626, (short)640, (short)627, (short)628, (short)629, (short)630, (short)631, (short)637, (short)633, (short)632, (short)636, (short)638, (short)622, (short)639, (short)0, (short)640, (short)623, (short)0, (short)641, (short)0, (short)0, (short)625, (short)642, (short)643, (short)0, (short)644, (short)645, (short)0, (short)627, (short)633, (short)632, (short)636, (short)641, (short)630, (short)632, (short)646, (short)642, (short)643, (short)626, (short)644, (short)645, (short)640, (short)628, (short)647, (short)629, (short)648, (short)631, (short)649, (short)650, (short)646, (short)651, (short)652, (short)0, (short)639, (short)641, (short)653, (short)654, (short)647, (short)0, (short)648, (short)655, (short)649, (short)650, (short)656, (short)651, (short)652, (short)645, (short)657, (short)659, (short)653, (short)654, (short)658, (short)643, (short)0, (short)655, (short)661, (short)642, (short)656, (short)662, (short)660, (short)663, (short)657, (short)659, (short)664, (short)650, (short)658, (short)652, (short)649, (short)665, (short)661, (short)666, (short)0, (short)662, (short)660, (short)663, (short)650, (short)668, (short)664, (short)667, (short)669, (short)670, (short)671, (short)665, (short)672, (short)666, (short)654, (short)0, (short)653, (short)0, (short)657, (short)668, (short)673, (short)667, (short)669, (short)670, (short)671, (short)674, (short)672, (short)675, (short)655, (short)659, (short)676, (short)658, (short)660, (short)0, (short)673, (short)661, (short)677, (short)0, (short)0, (short)674, (short)678, (short)675, (short)663, (short)679, (short)676, (short)680, (short)0, (short)665, (short)0, (short)667, (short)677, (short)666, (short)672, (short)670, (short)678, (short)681, (short)682, (short)679, (short)668, (short)680, (short)669, (short)683, (short)671, (short)0, (short)0, (short)0, (short)0, (short)684, (short)685, (short)681, (short)682, (short)686, (short)687, (short)688, (short)689, (short)683, (short)690, (short)675, (short)678, (short)674, (short)676, (short)684, (short)685, (short)0, (short)691, (short)686, (short)687, (short)688, (short)689, (short)693, (short)690, (short)692, (short)694, (short)0, (short)695, (short)677, (short)680, (short)683, (short)691, (short)0, (short)0, (short)0, (short)0, (short)693, (short)681, (short)692, (short)694, (short)684, (short)695, (short)0, (short)0, (short)0, (short)0, (short)688, (short)0, (short)690, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)687, (short)686, (short)692, (short)694, (short)689, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)691, (short)697, (short)697, (short)697, (short)697, (short)697, (short)697, (short)697, (short)698, (short)698, (short)0, (short)698, (short)698, (short)698, (short)698, (short)699, (short)0, (short)0, (short)699, (short)699, (short)699, (short)700, (short)700, (short)701, (short)701, (short)702, (short)702, (short)702, (short)703, (short)703, (short)704, (short)704, (short)704, (short)704, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696
};

static yy_state_type yy_last_accepting_state;

static char * yy_last_accepting_cpos;

char * yytext;

enum yytokentype
{
IDENTIFIER = 258, CONSTANT = 259, STRING_LITERAL = 260, SIZEOF = 261, PTR_OP = 262, INC_OP = 263, DEC_OP = 264, LEFT_OP = 265, RIGHT_OP = 266, LE_OP = 267, GE_OP = 268, EQ_OP = 269, NE_OP = 270, AND_OP = 271, OR_OP = 272, MUL_ASSIGN = 273, DIV_ASSIGN = 274, MOD_ASSIGN = 275, ADD_ASSIGN = 276, SUB_ASSIGN = 277, LEFT_ASSIGN = 278, RIGHT_ASSIGN = 279, AND_ASSIGN = 280, XOR_ASSIGN = 281, OR_ASSIGN = 282, TYPE_NAME = 283, TYPEDEF = 284, EXTERN = 285, STATIC = 286, AUTO = 287, REGISTER = 288, CHAR = 289, SHORT = 290, INT = 291, UINT = 292, INT64 = 293, LONG = 294, SIGNED = 295, UNSIGNED = 296, FLOAT = 297, DOUBLE = 298, CONST = 299, VOLATILE = 300, VOID = 301, VALIST = 302, STRUCT = 303, UNION = 304, ENUM = 305, ELLIPSIS = 306, CASE = 307, DEFAULT = 308, IF = 309, SWITCH = 310, WHILE = 311, DO = 312, FOR = 313, GOTO = 314, CONTINUE = 315, BREAK = 316, RETURN = 317, IFX = 318, ELSE = 319, CLASS = 320, THISCLASS = 321, CLASS_NAME = 322, PROPERTY = 323, SETPROP = 324, GETPROP = 325, NEWOP = 326, RENEW = 327, DELETE = 328, EXT_DECL = 329, EXT_STORAGE = 330, IMPORT = 331, DEFINE = 332, VIRTUAL = 333, ATTRIB = 334, PUBLIC = 335, PRIVATE = 336, TYPED_OBJECT = 337, ANY_OBJECT = 338, _INCREF = 339, EXTENSION = 340, ASM = 341, TYPEOF = 342, WATCH = 343, STOPWATCHING = 344, FIREWATCHERS = 345, WATCHABLE = 346, CLASS_DESIGNER = 347, CLASS_NO_EXPANSION = 348, CLASS_FIXED = 349, ISPROPSET = 350, CLASS_DEFAULT_PROPERTY = 351, PROPERTY_CATEGORY = 352, CLASS_DATA = 353, CLASS_PROPERTY = 354, SUBCLASS = 355, NAMESPACE = 356, NEW0OP = 357, RENEW0 = 358, VAARG = 359, DBTABLE = 360, DBFIELD = 361, DBINDEX = 362, DATABASE_OPEN = 363, ALIGNOF = 364, ATTRIB_DEP = 365, __ATTRIB = 366, BOOL = 367, _BOOL = 368, _COMPLEX = 369, _IMAGINARY = 370, RESTRICT = 371, THREAD = 372
};

typedef union YYSTYPE
{
int specifierType;
int i;
int declMode;
struct Identifier * id;
struct Expression * exp;
struct Specifier * specifier;
struct __ecereNameSpace__ecere__sys__OldList * list;
struct Enumerator * enumerator;
struct Declarator * declarator;
struct Pointer * pointer;
struct Initializer * initializer;
struct InitDeclarator * initDeclarator;
struct TypeName * typeName;
struct Declaration * declaration;
struct Statement * stmt;
struct FunctionDefinition * function;
struct External * external;
struct Context * context;
struct AsmField * asmField;
struct Attrib * attrib;
struct ExtDecl * extDecl;
struct Attribute * attribute;
struct Instantiation * instance;
struct MembersInit * membersInit;
struct MemberInit * memberInit;
struct ClassFunction * classFunction;
struct ClassDefinition * _class;
struct ClassDef * classDef;
struct PropertyDef * prop;
char * string;
struct Symbol * symbol;
struct PropertyWatch * propertyWatch;
struct TemplateParameter * templateParameter;
struct TemplateArgument * templateArgument;
struct TemplateDatatype * templateDatatype;
struct DBTableEntry * dbtableEntry;
struct DBIndexItem * dbindexItem;
struct DBTableDef * dbtableDef;
} __attribute__ ((gcc_struct)) YYSTYPE;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Enumerator;

struct Enumerator;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_InitDeclarator;

struct InitDeclarator;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_AsmField;

struct AsmField;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Attribute;

struct Attribute;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassFunction;

struct ClassFunction;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_MembersInit;

struct MembersInit;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_MemberInit;

struct MemberInit;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyDef;

struct PropertyDef;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_PropertyWatch;

struct PropertyWatch;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_ClassDef;

struct ClassDef;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBTableEntry;

struct DBTableEntry;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_DBIndexItem;

struct DBIndexItem;

extern YYSTYPE yylval;

extern struct Location yylloc;

unsigned int echoOn = 0x1;

void SetEchoOn(unsigned int b)
{
echoOn = b;
}

extern struct Location type_yylloc;

extern struct Location expression_yylloc;

extern struct __ecereNameSpace__ecere__com__Instance * fileInput;

int preprocessor();

int comment();

void TESTTTT()
{
yylloc.end.charPos += yyleng;
yylloc.end.pos += yyleng;
type_yylloc.end.charPos += yyleng;
type_yylloc.end.pos += yyleng;
expression_yylloc.end.charPos += yyleng;
expression_yylloc.end.pos += yyleng;
}

YY_BUFFER_STATE include_stack[30];

struct __ecereNameSpace__ecere__com__Instance * fileStack[30];

char sourceFileStack[30][797];

extern char *  strcpy(char * , const char * );

void SetSomeSourceFileStack(char * fileName, int index)
{
strcpy(sourceFileStack[index], fileName);
}

struct Location locStack[30];

int declModeStack[30];

int include_stack_ptr = 0;

extern int yywrap(void);

static void yyunput(int c, char * buf_ptr);

static int input(void);

int commentCPP();

extern int check_type(void);

extern int defaultDeclMode;

extern int declMode;

extern int structDeclMode;

extern unsigned int inCompiler;

extern int printf(char * , ...);

extern int yyerror(void);

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

int yylex(void)
{
register yy_state_type yy_current_state;
register char * yy_cp, * yy_bp;
register int yy_act;

yylloc.start = yylloc.end;
type_yylloc.start = type_yylloc.end;
expression_yylloc.start = expression_yylloc.end;
if(yy_init)
{
yy_init = 0;
if(!yy_start)
yy_start = 1;
if(!yyin)
yyin = (bsl_stdin());
if(!yyout)
yyout = (bsl_stdout());
if(!yy_current_buffer)
yy_current_buffer = yy_create_buffer(yyin, 16384);
yy_load_buffer_state();
}
while(1)
{
yy_cp = yy_c_buf_p;
*yy_cp = yy_hold_char;
yy_bp = yy_cp;
yy_current_state = yy_start;
yy_match:
do
{
register YY_CHAR yy_c = yy_ec[((unsigned int)(unsigned char)*yy_cp)];

if(yy_accept[yy_current_state])
{
yy_last_accepting_state = yy_current_state;
yy_last_accepting_cpos = yy_cp;
}
while(yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state)
{
yy_current_state = (int)yy_def[yy_current_state];
if(yy_current_state >= 697)
yy_c = yy_meta[(unsigned int)yy_c];
}
yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int)yy_c];
++yy_cp;
}while(yy_base[yy_current_state] != (short)2412);
yy_find_action:
yy_act = yy_accept[yy_current_state];
if(yy_act == 0)
{
yy_cp = yy_last_accepting_cpos;
yy_current_state = yy_last_accepting_state;
yy_act = yy_accept[yy_current_state];
}
yytext = yy_bp;
yyleng = (int)(yy_cp - yy_bp);
yy_hold_char = *yy_cp;
*yy_cp = '\0';
yy_c_buf_p = yy_cp;
;
do_action:
switch(yy_act)
{
case 0:
*yy_cp = yy_hold_char;
yy_cp = yy_last_accepting_cpos;
yy_current_state = yy_last_accepting_state;
goto yy_find_action;
case 1:
TESTTTT();
{
preprocessor();
}
break;
case 2:
TESTTTT();
{
comment();
}
break;
case 3:
TESTTTT();
{
commentCPP();
}
break;
case 4:
TESTTTT();
{
return (AUTO);
}
break;
case 5:
TESTTTT();
{
return (BREAK);
}
break;
case 6:
TESTTTT();
{
return (CASE);
}
break;
case 7:
TESTTTT();
{
return (CHAR);
}
break;
case 8:
TESTTTT();
{
return (CONST);
}
break;
case 9:
TESTTTT();
{
return (CONTINUE);
}
break;
case 10:
TESTTTT();
{
return (DEFAULT);
}
break;
case 11:
TESTTTT();
{
return (DO);
}
break;
case 12:
TESTTTT();
{
return (DOUBLE);
}
break;
case 13:
TESTTTT();
{
return (ELSE);
}
break;
case 14:
TESTTTT();
{
return (ENUM);
}
break;
case 15:
TESTTTT();
{
return (EXTERN);
}
break;
case 16:
TESTTTT();
{
return (FLOAT);
}
break;
case 17:
TESTTTT();
{
return (FOR);
}
break;
case 18:
TESTTTT();
{
return (GOTO);
}
break;
case 19:
TESTTTT();
{
return (IF);
}
break;
case 20:
TESTTTT();
{
return (INT);
}
break;
case 21:
TESTTTT();
{
return (UINT);
}
break;
case 22:
TESTTTT();
{
return (LONG);
}
break;
case 23:
TESTTTT();
{
return (REGISTER);
}
break;
case 24:
TESTTTT();
{
return (RETURN);
}
break;
case 25:
TESTTTT();
{
return (SHORT);
}
break;
case 26:
TESTTTT();
{
return (SIGNED);
}
break;
case 27:
TESTTTT();
{
return (SIGNED);
}
break;
case 28:
TESTTTT();
{
return (SIGNED);
}
break;
case 29:
TESTTTT();
{
return (SIZEOF);
}
break;
case 30:
TESTTTT();
{
return (ALIGNOF);
}
break;
case 31:
TESTTTT();
{
return (STATIC);
}
break;
case 32:
TESTTTT();
{
return (THREAD);
}
break;
case 33:
TESTTTT();
{
return (STRUCT);
}
break;
case 34:
TESTTTT();
{
return (SWITCH);
}
break;
case 35:
TESTTTT();
{
return (TYPEDEF);
}
break;
case 36:
TESTTTT();
{
return (UNION);
}
break;
case 37:
TESTTTT();
{
return (UNSIGNED);
}
break;
case 38:
TESTTTT();
{
return (VOID);
}
break;
case 39:
TESTTTT();
{
return (VOLATILE);
}
break;
case 40:
TESTTTT();
{
return (VOLATILE);
}
break;
case 41:
TESTTTT();
{
return (VOLATILE);
}
break;
case 42:
TESTTTT();
{
return (WHILE);
}
break;
case 43:
TESTTTT();
{
return (PROPERTY);
}
break;
case 44:
TESTTTT();
{
return (SETPROP);
}
break;
case 45:
TESTTTT();
{
return (GETPROP);
}
break;
case 46:
TESTTTT();
{
return (ISPROPSET);
}
break;
case 47:
TESTTTT();
{
return (CLASS);
}
break;
case 48:
TESTTTT();
{
return (THISCLASS);
}
break;
case 49:
TESTTTT();
{
return (VIRTUAL);
}
break;
case 50:
TESTTTT();
{
return (DELETE);
}
break;
case 51:
TESTTTT();
{
return (NEWOP);
}
break;
case 52:
TESTTTT();
{
return (NEW0OP);
}
break;
case 53:
TESTTTT();
{
return (RENEW);
}
break;
case 54:
TESTTTT();
{
return (RENEW0);
}
break;
case 55:
TESTTTT();
{
return (IMPORT);
}
break;
case 56:
TESTTTT();
{
return (DEFINE);
}
break;
case 57:
TESTTTT();
{
return (INT64);
}
break;
case 58:
TESTTTT();
{
return (INT64);
}
break;
case 59:
TESTTTT();
{
return (VALIST);
}
break;
case 60:
TESTTTT();
{
return (VAARG);
}
break;
case 61:
TESTTTT();
{
return (BOOL);
}
break;
case 62:
TESTTTT();
{
return (_BOOL);
}
break;
case 63:
TESTTTT();
{
return (_COMPLEX);
}
break;
case 64:
TESTTTT();
{
return (_IMAGINARY);
}
break;
case 65:
TESTTTT();
{
return (EXT_DECL);
}
break;
case 66:
TESTTTT();
{
return ATTRIB_DEP;
}
break;
case 67:
TESTTTT();
{
return ATTRIB;
}
break;
case 68:
TESTTTT();
{
return __ATTRIB;
}
break;
case 69:
TESTTTT();
{
return (EXT_STORAGE);
}
break;
case 70:
TESTTTT();
{
return (EXT_STORAGE);
}
break;
case 71:
TESTTTT();
{
return (EXT_STORAGE);
}
break;
case 72:
TESTTTT();
{
return (EXT_STORAGE);
}
break;
case 73:
TESTTTT();
{
return (EXT_STORAGE);
}
break;
case 74:
TESTTTT();
{
return (EXT_STORAGE);
}
break;
case 75:
TESTTTT();
{
return (EXT_STORAGE);
}
break;
case 76:
TESTTTT();
{
return (EXT_DECL);
}
break;
case 77:
TESTTTT();
{
return (EXT_DECL);
}
break;
case 78:
TESTTTT();
{
return (EXT_DECL);
}
break;
case 79:
TESTTTT();
{
return (EXT_DECL);
}
break;
case 80:
TESTTTT();
{
return (EXT_DECL);
}
break;
case 81:
TESTTTT();
{
return (EXT_DECL);
}
break;
case 82:
TESTTTT();
{
return (EXT_DECL);
}
break;
case 83:
TESTTTT();
{
return (EXT_DECL);
}
break;
case 84:
TESTTTT();
{
return (PUBLIC);
}
break;
case 85:
TESTTTT();
{
return (PRIVATE);
}
break;
case 86:
TESTTTT();
{
return (TYPED_OBJECT);
}
break;
case 87:
TESTTTT();
{
return (ANY_OBJECT);
}
break;
case 88:
TESTTTT();
{
return (_INCREF);
}
break;
case 89:
TESTTTT();
{
return (EXTENSION);
}
break;
case 90:
TESTTTT();
{
return (EXTENSION);
}
break;
case 91:
TESTTTT();
{
return (ASM);
}
break;
case 92:
TESTTTT();
{
return (ASM);
}
break;
case 93:
TESTTTT();
{
return (ASM);
}
break;
case 94:
TESTTTT();
{
return (TYPEOF);
}
break;
case 95:
TESTTTT();
{
return (WATCH);
}
break;
case 96:
TESTTTT();
{
return (STOPWATCHING);
}
break;
case 97:
TESTTTT();
{
return (FIREWATCHERS);
}
break;
case 98:
TESTTTT();
{
return (WATCHABLE);
}
break;
case 99:
TESTTTT();
{
return (CLASS_DESIGNER);
}
break;
case 100:
TESTTTT();
{
return (CLASS_NO_EXPANSION);
}
break;
case 101:
TESTTTT();
{
return (CLASS_FIXED);
}
break;
case 102:
TESTTTT();
{
return (CLASS_DEFAULT_PROPERTY);
}
break;
case 103:
TESTTTT();
{
return (PROPERTY_CATEGORY);
}
break;
case 104:
TESTTTT();
{
return (CLASS_DATA);
}
break;
case 105:
TESTTTT();
{
return (CLASS_PROPERTY);
}
break;
case 106:
TESTTTT();
{
return (SUBCLASS);
}
break;
case 107:
TESTTTT();
{
return (NAMESPACE);
}
break;
case 108:
TESTTTT();
{
return (DBTABLE);
}
break;
case 109:
TESTTTT();
{
return (DBFIELD);
}
break;
case 110:
TESTTTT();
{
return (DBINDEX);
}
break;
case 111:
TESTTTT();
{
return (DATABASE_OPEN);
}
break;
case 112:
TESTTTT();
{
return (check_type());
}
break;
case 113:
TESTTTT();
{
return (CONSTANT);
}
break;
case 114:
TESTTTT();
{
return (CONSTANT);
}
break;
case 115:
TESTTTT();
{
return (CONSTANT);
}
break;
case 116:
TESTTTT();
{
return (CONSTANT);
}
break;
case 117:
TESTTTT();
{
return (CONSTANT);
}
break;
case 118:
TESTTTT();
{
return (CONSTANT);
}
break;
case 119:
TESTTTT();
{
return (CONSTANT);
}
break;
case 120:
TESTTTT();
{
return (STRING_LITERAL);
}
break;
case 121:
TESTTTT();
{
return (ELLIPSIS);
}
break;
case 122:
TESTTTT();
{
return (RIGHT_ASSIGN);
}
break;
case 123:
TESTTTT();
{
return (LEFT_ASSIGN);
}
break;
case 124:
TESTTTT();
{
return (ADD_ASSIGN);
}
break;
case 125:
TESTTTT();
{
return (SUB_ASSIGN);
}
break;
case 126:
TESTTTT();
{
return (MUL_ASSIGN);
}
break;
case 127:
TESTTTT();
{
return (DIV_ASSIGN);
}
break;
case 128:
TESTTTT();
{
return (MOD_ASSIGN);
}
break;
case 129:
TESTTTT();
{
return (AND_ASSIGN);
}
break;
case 130:
TESTTTT();
{
return (XOR_ASSIGN);
}
break;
case 131:
TESTTTT();
{
return (OR_ASSIGN);
}
break;
case 132:
TESTTTT();
{
return (RIGHT_OP);
}
break;
case 133:
TESTTTT();
{
return (LEFT_OP);
}
break;
case 134:
TESTTTT();
{
return (INC_OP);
}
break;
case 135:
TESTTTT();
{
return (DEC_OP);
}
break;
case 136:
TESTTTT();
{
return (PTR_OP);
}
break;
case 137:
TESTTTT();
{
return (AND_OP);
}
break;
case 138:
TESTTTT();
{
return (OR_OP);
}
break;
case 139:
TESTTTT();
{
return (LE_OP);
}
break;
case 140:
TESTTTT();
{
return (GE_OP);
}
break;
case 141:
TESTTTT();
{
return (EQ_OP);
}
break;
case 142:
TESTTTT();
{
return (NE_OP);
}
break;
case 143:
TESTTTT();
{
return (';');
}
break;
case 144:
TESTTTT();
{
return ('{');
}
break;
case 145:
TESTTTT();
{
return ('}');
}
break;
case 146:
TESTTTT();
{
return (',');
}
break;
case 147:
TESTTTT();
{
return (':');
}
break;
case 148:
TESTTTT();
{
return ('=');
}
break;
case 149:
TESTTTT();
{
return ('(');
}
break;
case 150:
TESTTTT();
{
return (')');
}
break;
case 151:
TESTTTT();
{
return ('[');
}
break;
case 152:
TESTTTT();
{
return (']');
}
break;
case 153:
TESTTTT();
{
return ('.');
}
break;
case 154:
TESTTTT();
{
return ('&');
}
break;
case 155:
TESTTTT();
{
return ('!');
}
break;
case 156:
TESTTTT();
{
return ('~');
}
break;
case 157:
TESTTTT();
{
return ('-');
}
break;
case 158:
TESTTTT();
{
return ('+');
}
break;
case 159:
TESTTTT();
{
return ('*');
}
break;
case 160:
TESTTTT();
{
return ('/');
}
break;
case 161:
TESTTTT();
{
return ('%');
}
break;
case 162:
TESTTTT();
{
return ('<');
}
break;
case 163:
TESTTTT();
{
return ('>');
}
break;
case 164:
TESTTTT();
{
return ('^');
}
break;
case 165:
TESTTTT();
{
return ('|');
}
break;
case 166:
TESTTTT();
{
return ('?');
}
break;
case 167:
TESTTTT();
{
return ('$');
}
break;
case 175LL:
{
while(include_stack_ptr && !fileStack[include_stack_ptr - 1])
{
--include_stack_ptr;
defaultDeclMode = declMode = structDeclMode = declModeStack[include_stack_ptr];
}
if(--include_stack_ptr < 0)
{
include_stack_ptr = 0;
return 0;
}
else
{
(__ecereNameSpace__ecere__com__eInstance_DecRef(fileInput), fileInput = 0);
yy_delete_buffer(yy_current_buffer);
fileInput = fileStack[include_stack_ptr];
yylloc = locStack[include_stack_ptr];
type_yylloc = locStack[include_stack_ptr];
expression_yylloc = locStack[include_stack_ptr];
yy_switch_to_buffer(include_stack[include_stack_ptr]);
defaultDeclMode = declMode = structDeclMode = declModeStack[include_stack_ptr];
}
}
break;
case 168:
TESTTTT();
{
yylloc.start = yylloc.end;
type_yylloc.start = type_yylloc.end;
expression_yylloc.start = expression_yylloc.end;
}
break;
case 169:
TESTTTT();
{
yylloc.end.charPos = 1;
yylloc.end.line += yyleng;
yylloc.start = yylloc.end;
type_yylloc.end.charPos = 1;
type_yylloc.end.line += yyleng;
type_yylloc.start = type_yylloc.end;
expression_yylloc.end.charPos = 1;
expression_yylloc.end.line += yyleng;
expression_yylloc.start = expression_yylloc.end;
}
break;
case 170:
TESTTTT();
{
yylloc.start.charPos++;
yylloc.end.charPos = yylloc.start.charPos;
yylloc.start.pos = yylloc.end.pos;
expression_yylloc.start.charPos++;
expression_yylloc.end.charPos = expression_yylloc.start.charPos;
expression_yylloc.start.pos = expression_yylloc.end.pos;
type_yylloc.start.charPos++;
type_yylloc.end.charPos = type_yylloc.start.charPos;
type_yylloc.start.pos = type_yylloc.end.pos;
}
break;
case 171:
TESTTTT();
{
yylloc.start = yylloc.end;
expression_yylloc.start = expression_yylloc.end;
type_yylloc.start = type_yylloc.end;
}
break;
case 172:
TESTTTT();
{
yylloc.start = yylloc.end;
expression_yylloc.start = expression_yylloc.end;
type_yylloc.start = type_yylloc.end;
if(inCompiler)
printf("lexer error: invalid char 0x%X at line %d, col %d\n", (unsigned char)yytext[0], yylloc.start.line, yylloc.start.charPos);
yyerror();
}
break;
case 173:
TESTTTT();
(void)fwrite(yytext, yyleng, 1, yyout);
break;
case 174:
{
int yy_amount_of_matched_text = (int)(yy_cp - yytext) - 1;

*yy_cp = yy_hold_char;
if((*yy_current_buffer).yy_buffer_status == 0)
{
yy_n_chars = (*yy_current_buffer).yy_n_chars;
(*yy_current_buffer).yy_input_file = yyin;
(*yy_current_buffer).yy_buffer_status = 1;
}
if(yy_c_buf_p <= &(*yy_current_buffer).yy_ch_buf[yy_n_chars])
{
yy_state_type yy_next_state;

yy_c_buf_p = yytext + yy_amount_of_matched_text;
yy_current_state = yy_get_previous_state();
yy_next_state = yy_try_NUL_trans(yy_current_state);
yy_bp = yytext + 0;
if(yy_next_state)
{
yy_cp = ++yy_c_buf_p;
yy_current_state = yy_next_state;
goto yy_match;
}
else
{
yy_cp = yy_c_buf_p;
goto yy_find_action;
}
}
else
switch(yy_get_next_buffer())
{
case 1:
{
yy_did_buffer_switch_on_eof = 0;
if(yywrap())
{
yy_c_buf_p = yytext + 0;
yy_act = (174 + ((yy_start - 1) / 2) + 1);
goto do_action;
}
else
{
if(!yy_did_buffer_switch_on_eof)
yyrestart(yyin);
}
break;
}
case 0:
yy_c_buf_p = yytext + yy_amount_of_matched_text;
yy_current_state = yy_get_previous_state();
yy_cp = yy_c_buf_p;
yy_bp = yytext + 0;
goto yy_match;
case 2:
yy_c_buf_p = &(*yy_current_buffer).yy_ch_buf[yy_n_chars];
yy_current_state = yy_get_previous_state();
yy_cp = yy_c_buf_p;
yy_bp = yytext + 0;
goto yy_find_action;
}
break;
}
default:
yy_fatal_error("fatal flex scanner internal error--no action found");
}
}
}

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__File;

static int yy_get_next_buffer()
{
register char * dest = (*yy_current_buffer).yy_ch_buf;
register char * source = yytext;
register int number_to_move, i;
int ret_val;

if(yy_c_buf_p > &(*yy_current_buffer).yy_ch_buf[yy_n_chars + 1])
yy_fatal_error("fatal flex scanner internal error--end of buffer missed");
if((*yy_current_buffer).yy_fill_buffer == 0)
{
if(yy_c_buf_p - yytext - 0 == 1)
{
return 1;
}
else
{
return 2;
}
}
number_to_move = (int)(yy_c_buf_p - yytext) - 1;
for(i = 0; i < number_to_move; ++i)
*(dest++) = *(source++);
if((*yy_current_buffer).yy_buffer_status == 2)
(*yy_current_buffer).yy_n_chars = yy_n_chars = 0;
else
{
int num_to_read = (*yy_current_buffer).yy_buf_size - number_to_move - 1;

while(num_to_read <= 0)
{
YY_BUFFER_STATE b = yy_current_buffer;
int yy_c_buf_p_offset = (int)(yy_c_buf_p - (*b).yy_ch_buf);

if((*b).yy_is_our_buffer)
{
int new_size = (*b).yy_buf_size * 2;

if(new_size <= 0)
(*b).yy_buf_size += (*b).yy_buf_size / 8;
else
(*b).yy_buf_size *= 2;
(*b).yy_ch_buf = (char *)yy_flex_realloc((void *)(*b).yy_ch_buf, (*b).yy_buf_size + 2);
}
else
(*b).yy_ch_buf = 0;
if(!(*b).yy_ch_buf)
yy_fatal_error("fatal error - scanner input buffer overflow");
yy_c_buf_p = &(*b).yy_ch_buf[yy_c_buf_p_offset];
num_to_read = (*yy_current_buffer).yy_buf_size - number_to_move - 1;
}
if(num_to_read > 8192)
num_to_read = 8192;
yy_n_chars = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))__extension__ ({
struct __ecereNameSpace__ecere__com__Instance * __internal_ClassInst = fileInput;

__internal_ClassInst ? __internal_ClassInst->_vTbl : __ecereClass___ecereNameSpace__ecere__sys__File->_vTbl;
})[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read])(fileInput, (&(*yy_current_buffer).yy_ch_buf[number_to_move]), 1, num_to_read);
(*yy_current_buffer).yy_n_chars = yy_n_chars;
}
if(yy_n_chars == 0)
{
if(number_to_move == 0)
{
ret_val = 1;
yyrestart(yyin);
}
else
{
ret_val = 2;
(*yy_current_buffer).yy_buffer_status = 2;
}
}
else
ret_val = 0;
yy_n_chars += number_to_move;
(*yy_current_buffer).yy_ch_buf[yy_n_chars] = (char)0;
(*yy_current_buffer).yy_ch_buf[yy_n_chars + 1] = (char)0;
yytext = &(*yy_current_buffer).yy_ch_buf[0];
return ret_val;
}

static yy_state_type yy_get_previous_state()
{
register yy_state_type yy_current_state;
register char * yy_cp;

yy_current_state = yy_start;
for(yy_cp = yytext + 0; yy_cp < yy_c_buf_p; ++yy_cp)
{
register YY_CHAR yy_c = (*yy_cp ? yy_ec[((unsigned int)(unsigned char)*yy_cp)] : (unsigned char)1);

if(yy_accept[yy_current_state])
{
yy_last_accepting_state = yy_current_state;
yy_last_accepting_cpos = yy_cp;
}
while(yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state)
{
yy_current_state = (int)yy_def[yy_current_state];
if(yy_current_state >= 697)
yy_c = yy_meta[(unsigned int)yy_c];
}
yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int)yy_c];
}
return yy_current_state;
}

static yy_state_type yy_try_NUL_trans(yy_state_type yy_current_state)
{
register int yy_is_jam;
register char * yy_cp = yy_c_buf_p;
register YY_CHAR yy_c = (unsigned char)1;

if(yy_accept[yy_current_state])
{
yy_last_accepting_state = yy_current_state;
yy_last_accepting_cpos = yy_cp;
}
while(yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state)
{
yy_current_state = (int)yy_def[yy_current_state];
if(yy_current_state >= 697)
yy_c = yy_meta[(unsigned int)yy_c];
}
yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int)yy_c];
yy_is_jam = (yy_current_state == 696);
return yy_is_jam ? 0 : yy_current_state;
}

static void yyunput(int c, register char * yy_bp)
{
register char * yy_cp = yy_c_buf_p;

*yy_cp = yy_hold_char;
if(yy_cp < (*yy_current_buffer).yy_ch_buf + 2)
{
register int number_to_move = yy_n_chars + 2;
register char * dest = &(*yy_current_buffer).yy_ch_buf[(*yy_current_buffer).yy_buf_size + 2];
register char * source = &(*yy_current_buffer).yy_ch_buf[number_to_move];

while(source > (*yy_current_buffer).yy_ch_buf)
*--dest = *--source;
yy_cp += (int)(dest - source);
yy_bp += (int)(dest - source);
(*yy_current_buffer).yy_n_chars = yy_n_chars = (*yy_current_buffer).yy_buf_size;
if(yy_cp < (*yy_current_buffer).yy_ch_buf + 2)
yy_fatal_error("flex scanner push-back overflow");
}
*--yy_cp = (char)c;
yytext = yy_bp;
yy_hold_char = *yy_cp;
yy_c_buf_p = yy_cp;
}

static int input()
{
int c;

*yy_c_buf_p = yy_hold_char;
if(*yy_c_buf_p == (char)0)
{
if(yy_c_buf_p < &(*yy_current_buffer).yy_ch_buf[yy_n_chars])
*yy_c_buf_p = '\0';
else
{
int offset = yy_c_buf_p - yytext;

++yy_c_buf_p;
switch(yy_get_next_buffer())
{
case 2:
yyrestart(yyin);
case 1:
{
if(yywrap())
return (-1);
if(!yy_did_buffer_switch_on_eof)
yyrestart(yyin);
return input();
}
case 0:
yy_c_buf_p = yytext + offset;
break;
}
}
}
c = *(unsigned char *)yy_c_buf_p;
*yy_c_buf_p = '\0';
yy_hold_char = *++yy_c_buf_p;
return c;
}

void yyrestart(FILE * input_file)
{
if(!yy_current_buffer)
yy_current_buffer = yy_create_buffer(yyin, 16384);
yy_init_buffer(yy_current_buffer, input_file);
yy_load_buffer_state();
}

void yy_switch_to_buffer(YY_BUFFER_STATE new_buffer)
{
if(yy_current_buffer == new_buffer)
return ;
if(yy_current_buffer)
{
*yy_c_buf_p = yy_hold_char;
(*yy_current_buffer).yy_buf_pos = yy_c_buf_p;
(*yy_current_buffer).yy_n_chars = yy_n_chars;
}
yy_current_buffer = new_buffer;
yy_load_buffer_state();
yy_did_buffer_switch_on_eof = 1;
}

void yy_load_buffer_state(void)
{
yy_n_chars = (*yy_current_buffer).yy_n_chars;
yytext = yy_c_buf_p = (*yy_current_buffer).yy_buf_pos;
yyin = (*yy_current_buffer).yy_input_file;
yy_hold_char = *yy_c_buf_p;
}

YY_BUFFER_STATE yy_create_buffer(FILE * file, int size)
{
YY_BUFFER_STATE b;

b = (YY_BUFFER_STATE)yy_flex_alloc(sizeof(struct yy_buffer_state));
if(!b)
yy_fatal_error("out of dynamic memory in yy_create_buffer()");
(*b).yy_buf_size = size;
(*b).yy_ch_buf = (char *)yy_flex_alloc((*b).yy_buf_size + 2);
if(!(*b).yy_ch_buf)
yy_fatal_error("out of dynamic memory in yy_create_buffer()");
(*b).yy_is_our_buffer = 1;
yy_init_buffer(b, file);
return b;
}

void yy_delete_buffer(YY_BUFFER_STATE b)
{
if(!b)
return ;
if(b == yy_current_buffer)
yy_current_buffer = (YY_BUFFER_STATE)0;
if((*b).yy_is_our_buffer)
yy_flex_free((void *)(*b).yy_ch_buf);
yy_flex_free((void *)b);
}

void yy_init_buffer(YY_BUFFER_STATE b, FILE * file)
{
yy_flush_buffer(b);
(*b).yy_input_file = file;
(*b).yy_fill_buffer = 1;
(*b).yy_is_interactive = 0;
}

void yy_flush_buffer(YY_BUFFER_STATE b)
{
if(!b)
return ;
(*b).yy_n_chars = 0;
(*b).yy_ch_buf[0] = (char)0;
(*b).yy_ch_buf[1] = (char)0;
(*b).yy_buf_pos = &(*b).yy_ch_buf[0];
(*b).yy_at_bol = 1;
(*b).yy_buffer_status = 0;
if(b == yy_current_buffer)
yy_load_buffer_state();
}

YY_BUFFER_STATE yy_scan_buffer(char * base, yy_size_t size)
{
YY_BUFFER_STATE b;

if(size < 2 || base[size - 2] != (char)0 || base[size - 1] != (char)0)
return 0;
b = (YY_BUFFER_STATE)yy_flex_alloc(sizeof(struct yy_buffer_state));
if(!b)
yy_fatal_error("out of dynamic memory in yy_scan_buffer()");
(*b).yy_buf_size = size - 2;
(*b).yy_buf_pos = (*b).yy_ch_buf = base;
(*b).yy_is_our_buffer = 0;
(*b).yy_input_file = 0;
(*b).yy_n_chars = (*b).yy_buf_size;
(*b).yy_is_interactive = 0;
(*b).yy_at_bol = 1;
(*b).yy_fill_buffer = 0;
(*b).yy_buffer_status = 0;
yy_switch_to_buffer(b);
return b;
}

YY_BUFFER_STATE yy_scan_string(const char * yy_str)
{
int len;

for(len = 0; yy_str[len]; ++len)
;
return yy_scan_bytes(yy_str, len);
}

YY_BUFFER_STATE yy_scan_bytes(const char * bytes, int len)
{
YY_BUFFER_STATE b;
char * buf;
yy_size_t n;
int i;

n = len + 2;
buf = (char *)yy_flex_alloc(n);
if(!buf)
yy_fatal_error("out of dynamic memory in yy_scan_bytes()");
for(i = 0; i < len; ++i)
buf[i] = bytes[i];
buf[len] = buf[len + 1] = (char)0;
b = yy_scan_buffer(buf, n);
if(!b)
yy_fatal_error("bad buffer in yy_scan_bytes()");
(*b).yy_is_our_buffer = 1;
return b;
}

static void yy_fatal_error(const char msg[])
{
(void)fprintf((bsl_stderr()), "%s\n", msg);
exit(2);
}

static void * yy_flex_alloc(yy_size_t size)
{
return (void *)malloc(size);
}

static void * yy_flex_realloc(void * ptr, yy_size_t size)
{
return (void *)realloc((char *)ptr, size);
}

static void yy_flex_free(void * ptr)
{
free(ptr);
}

yywrap()
{
return (1);
}

int comment()
{
int c, last = 0;

for(; ; )
{
c = input();
if(c == (-1))
break;
if(c == '\n')
{
yylloc.end.charPos = 1;
yylloc.end.pos++;
yylloc.end.line++;
}
else if(c == '\t')
{
yylloc.end.charPos++;
yylloc.end.pos++;
}
else
{
yylloc.end.charPos++;
yylloc.end.pos++;
}
if(c == '/' && last == '*')
break;
last = c;
}
yylloc.start = yylloc.end;
return 0;
}

int commentCPP()
{
int c, last = 0;

for(; ; )
{
c = input();
if(c == (-1))
break;
if(c == '\n')
{
yylloc.end.charPos = 1;
yylloc.end.pos++;
yylloc.end.line++;
break;
}
else if(c == '\t')
{
yylloc.end.charPos++;
yylloc.end.pos++;
}
else
{
yylloc.end.charPos++;
yylloc.end.pos++;
}
last = c;
}
yylloc.start = yylloc.end;
return 0;
}

extern int __ecereNameSpace__ecere__sys__GetValue(char * *  buffer);

extern unsigned int __ecereNameSpace__ecere__sys__GetString(char * *  buffer, char *  string, int max);

extern char *  __ecereNameSpace__ecere__sys__GetExtension(char *  string, char *  output);

extern int strcmp(const char * , const char * );

extern int GetIncludeFileID(char *  includeFile);

extern char *  __ecereNameSpace__ecere__sys__TrimLSpaces(char *  string, char *  output);

extern int strncmp(const char * , const char * , size_t n);

extern void *  memmove(void * , const void * , size_t size);

extern size_t strlen(const char * );

extern char *  strncpy(char * , const char * , size_t n);

extern char *  __ecereNameSpace__ecere__GetTranslatedString(char * name, char *  string, char *  stringAndContext);

extern int FindIncludeFileID(char *  includeFile);

extern struct __ecereNameSpace__ecere__com__Instance * OpenIncludeFile(char *  includeFile);

int preprocessor()
{
int c, last = 0;
int count = 0;
char line[1024];

line[0] = '\0';
for(; ; )
{
c = input();
if(c == (-1))
break;
if(c == '\n')
{
yylloc.end.charPos = 1;
yylloc.end.pos++;
yylloc.end.line++;
if(last != '\\')
{
char * pointer = line + 1;
int lineNumber;

line[count] = (char)0;
lineNumber = __ecereNameSpace__ecere__sys__GetValue(&pointer);
if(lineNumber)
{
char fileName[797];
int inOut;

fileName[0] = (char)0;
__ecereNameSpace__ecere__sys__GetString(&pointer, fileName, (797));
inOut = __ecereNameSpace__ecere__sys__GetValue(&pointer);
if(inOut == 1)
{
char extension[17];

defaultDeclMode = declModeStack[include_stack_ptr] = declMode;
__ecereNameSpace__ecere__sys__GetExtension(fileName, extension);
if(!strcmp(extension, "c") || !strcmp(extension, "h"))
declMode = defaultDeclMode = structDeclMode = 0;
fileStack[include_stack_ptr] = (((void *)0));
include_stack_ptr++;
}
else if(inOut == 2)
{
include_stack_ptr--;
defaultDeclMode = declMode = structDeclMode = declModeStack[include_stack_ptr];
}
yylloc.end.charPos = 1;
yylloc.end.line = lineNumber;
if(include_stack_ptr > 0 || (lineNumber && fileName[0]))
yylloc.end.included = GetIncludeFileID(fileName);
else
yylloc.end.included = 0;
}
break;
}
count = 0;
}
else if(c == '\t')
{
yylloc.end.charPos++;
yylloc.end.pos++;
line[count++] = c;
}
else
{
yylloc.end.pos++;
if(c != '\r')
{
yylloc.end.charPos++;
line[count++] = c;
}
}
last = c;
}
yylloc.start = yylloc.end;
line[count] = (char)0;
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
for(c = 0; line[c] && line[c] != ' '; c++)
;
if(!strncmp(line, "include", c))
{
char includeFile[797] = "";

memmove(line, line + c, strlen(line + c) + 1);
__ecereNameSpace__ecere__sys__TrimLSpaces(line, line);
if(line[0] == '\"')
{
for(c = 1; line[c]; c++)
{
if(line[c] == '\"')
{
strncpy(includeFile, line + 1, c - 1);
includeFile[c - 1] = '\0';
break;
}
}
}
else if(line[0] == '<')
{
for(c = 1; line[c]; c++)
if(line[c] == '>')
{
strncpy(includeFile, line + 1, c - 1);
includeFile[c - 1] = '\0';
break;
}
}
if(include_stack_ptr >= (30))
{
fprintf((bsl_stderr()), __ecereNameSpace__ecere__GetTranslatedString("ec", "Includes nested too deeply", (((void *)0))));
exit(1);
}
if(inCompiler || !FindIncludeFileID(includeFile))
{
struct __ecereNameSpace__ecere__com__Instance * file = OpenIncludeFile(includeFile);

if(file)
{
char extension[17];

fileStack[include_stack_ptr] = fileInput;
locStack[include_stack_ptr] = yylloc;
defaultDeclMode = declModeStack[include_stack_ptr] = declMode;
include_stack[include_stack_ptr++] = yy_current_buffer;
yylloc.start.charPos = yylloc.end.charPos = 1;
yylloc.start.line = yylloc.end.line = 1;
yylloc.start.pos = yylloc.end.pos = 0;
yylloc.start.included = yylloc.end.included = GetIncludeFileID(includeFile);
__ecereNameSpace__ecere__sys__GetExtension(includeFile, extension);
if(!strcmp(extension, "c") || !strcmp(extension, "h"))
declMode = defaultDeclMode = structDeclMode = 0;
fileInput = file;
yy_switch_to_buffer(yy_create_buffer(fileInput, 16384));
yy_start = 1 + 2 * (0);
}
else
printf("");
}
}
return 0;
}

void resetScanner()
{
yy_flush_buffer(yy_current_buffer);
yylloc.start.charPos = yylloc.end.charPos = 1;
yylloc.start.line = yylloc.end.line = 1;
yylloc.start.pos = yylloc.end.pos = 0;
yylloc.start.included = yylloc.end.included = 0;
expression_yylloc.start.charPos = expression_yylloc.end.charPos = 1;
expression_yylloc.start.line = expression_yylloc.end.line = 1;
expression_yylloc.start.pos = expression_yylloc.end.pos = 0;
expression_yylloc.start.included = expression_yylloc.end.included = 0;
type_yylloc.start.charPos = type_yylloc.end.charPos = 1;
type_yylloc.start.line = type_yylloc.end.line = 1;
type_yylloc.start.pos = type_yylloc.end.pos = 0;
type_yylloc.start.included = type_yylloc.end.included = 0;
include_stack_ptr = 0;
}

void resetScannerPos(struct CodePosition * pos)
{
yy_flush_buffer(yy_current_buffer);
yylloc.start = yylloc.end = *pos;
type_yylloc.start = type_yylloc.end = *pos;
expression_yylloc.start = expression_yylloc.end = *pos;
}

struct LexerBackup
{
struct Location yylloc;
struct Location type_yylloc;
struct Location expression_yylloc;
int declMode;
int defaultDeclMode;
struct __ecereNameSpace__ecere__com__Instance * fileInput;
YY_BUFFER_STATE include_stack[30];
struct __ecereNameSpace__ecere__com__Instance * fileStack[30];
char sourceFileStack[30][797];
struct Location locStack[30];
int declModeStack[30];
int include_stack_ptr;
YY_BUFFER_STATE buffer;
int yy_n_chars;
char * yytext;
char * yy_c_buf_p;
FILE * yyin;
char yy_hold_char;
int yychar;
int yy_init;
int yy_start;
} __attribute__ ((gcc_struct));

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_LexerBackup;

extern void *  memcpy(void * , const void * , size_t size);

extern int yychar;

extern void *  __ecereNameSpace__ecere__com__eInstance_New(struct __ecereNameSpace__ecere__com__Class * _class);

struct __ecereNameSpace__ecere__com__Instance * pushLexer()
{
struct __ecereNameSpace__ecere__com__Instance * backup = __ecereNameSpace__ecere__com__eInstance_New(__ecereClass_LexerBackup);

((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yylloc = yylloc;
((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->type_yylloc = type_yylloc;
((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->expression_yylloc = expression_yylloc;
((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->fileInput = fileInput;
memcpy(((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->include_stack, include_stack, sizeof (include_stack));
memcpy(((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->fileStack, fileStack, sizeof (fileStack));
memcpy(((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->sourceFileStack, sourceFileStack, sizeof (sourceFileStack));
memcpy(((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->locStack, locStack, sizeof (locStack));
memcpy(((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->declModeStack, declModeStack, sizeof (declModeStack));
((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->include_stack_ptr = include_stack_ptr;
((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->defaultDeclMode = defaultDeclMode;
((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->declMode = declMode;
((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->buffer = yy_current_buffer;
((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yy_n_chars = yy_n_chars;
((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yytext = yytext;
((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yy_c_buf_p = yy_c_buf_p;
((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yyin = yyin;
((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yy_hold_char = yy_hold_char;
((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yychar = yychar;
((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yy_init = yy_init;
((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yy_start = yy_start;
yy_init = 1;
yy_current_buffer = 0;
yylloc.start.charPos = yylloc.end.charPos = 1;
yylloc.start.line = yylloc.end.line = 1;
yylloc.start.pos = yylloc.end.pos = 0;
yylloc.start.included = yylloc.end.included = 0;
expression_yylloc.start.charPos = expression_yylloc.end.charPos = 1;
expression_yylloc.start.line = expression_yylloc.end.line = 1;
expression_yylloc.start.pos = expression_yylloc.end.pos = 0;
expression_yylloc.start.included = expression_yylloc.end.included = 0;
type_yylloc.start.charPos = type_yylloc.end.charPos = 1;
type_yylloc.start.line = type_yylloc.end.line = 1;
type_yylloc.start.pos = type_yylloc.end.pos = 0;
type_yylloc.start.included = type_yylloc.end.included = 0;
include_stack_ptr = 0;
return backup;
}

void popLexer(struct __ecereNameSpace__ecere__com__Instance * backup)
{
yylloc = ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yylloc;
type_yylloc = ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->type_yylloc;
expression_yylloc = ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->expression_yylloc;
fileInput = ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->fileInput;
memcpy(include_stack, ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->include_stack, sizeof (include_stack));
memcpy(fileStack, ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->fileStack, sizeof (fileStack));
memcpy(sourceFileStack, ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->sourceFileStack, sizeof (sourceFileStack));
memcpy(locStack, ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->locStack, sizeof (locStack));
memcpy(declModeStack, ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->declModeStack, sizeof (declModeStack));
include_stack_ptr = ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->include_stack_ptr;
defaultDeclMode = ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->defaultDeclMode;
declMode = structDeclMode = ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->declMode;
yy_current_buffer = ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->buffer;
yy_n_chars = ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yy_n_chars;
yytext = ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yytext;
yy_c_buf_p = ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yy_c_buf_p;
yyin = ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yyin;
yy_hold_char = ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yy_hold_char;
yychar = ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yychar;
yy_init = ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yy_init;
yy_start = ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->yy_start;
(__ecereNameSpace__ecere__com__eInstance_DecRef(backup), backup = 0);
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, char *  name, char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

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
} __attribute__ ((gcc_struct));

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
int origImportType;
struct __ecereNameSpace__ecere__com__NameSpace privateNameSpace;
struct __ecereNameSpace__ecere__com__NameSpace publicNameSpace;
} __attribute__ ((gcc_struct));

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, char *  name, char *  type, unsigned int size, unsigned int alignment, int declMode);

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__com__GlobalFunction;

struct __ecereNameSpace__ecere__com__GlobalFunction;

extern struct __ecereNameSpace__ecere__com__GlobalFunction * __ecereNameSpace__ecere__com__eSystem_RegisterFunction(char *  name, char *  type, void *  func, struct __ecereNameSpace__ecere__com__Instance * module, int declMode);

void __ecereRegisterModule_lexer(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "yy_buffer_state", 0, sizeof(struct yy_buffer_state), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + structSize_Instance)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + structSize_Instance)))->application && class)
__ecereClass_yy_buffer_state = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_input_file", "void *", arch_PointerSize, arch_PointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_ch_buf", "char *", arch_PointerSize, arch_PointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_buf_pos", "char *", arch_PointerSize, arch_PointerSize, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_buf_size", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_n_chars", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_is_our_buffer", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_is_interactive", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_at_bol", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_fill_buffer", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_buffer_status", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetEchoOn", "void SetEchoOn(bool b)", SetEchoOn, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("TESTTTT", "void TESTTTT(void)", TESTTTT, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetSomeSourceFileStack", "void SetSomeSourceFileStack(char * fileName, int index)", SetSomeSourceFileStack, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("yywrap", "int yywrap(void)", yywrap, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("comment", "int comment(void)", comment, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("commentCPP", "int commentCPP(void)", commentCPP, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("preprocessor", "int preprocessor(void)", preprocessor, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("resetScanner", "void resetScanner(void)", resetScanner, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("resetScannerPos", "void resetScannerPos(CodePosition pos)", resetScannerPos, module, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "LexerBackup", 0, sizeof(struct LexerBackup), 0, 0, 0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + structSize_Instance)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + structSize_Instance)))->application && class)
__ecereClass_LexerBackup = class;
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("pushLexer", "LexerBackup pushLexer(void)", pushLexer, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("popLexer", "void popLexer(LexerBackup backup)", popLexer, module, 2);
}

void __ecereUnregisterModule_lexer(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

