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

static const short int yy_accept[696] = 
{
(short)0, (short)112, (short)112, (short)173, (short)171, (short)170, (short)169, (short)168, (short)155, (short)171, (short)1, (short)167, (short)161, (short)154, (short)171, (short)149, (short)150, (short)159, (short)158, (short)146, (short)157, (short)153, (short)160, (short)115, (short)115, (short)147, (short)143, (short)162, (short)148, (short)163, (short)166, (short)112, (short)112, (short)112, (short)151, (short)152, (short)164, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)144, (short)165, (short)145, (short)156, (short)142, (short)0, (short)120, (short)0, (short)128, (short)145, (short)137, (short)129, (short)0, (short)0, (short)126, (short)134, (short)124, (short)135, (short)125, (short)136, (short)0, (short)118, (short)2, (short)3, (short)127, (short)119, (short)114, (short)0, (short)115, (short)0, (short)115, (short)112, (short)152, (short)144, (short)151, (short)133, (short)139, (short)141, (short)140, (short)132, (short)0, (short)112, (short)0, (short)112, (short)0, (short)0, (short)130, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)11, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)19, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)131, (short)138, (short)116, (short)121, (short)0, (short)118, (short)118, (short)0, (short)119, (short)114, (short)0, (short)117, (short)113, (short)112, (short)123, (short)122, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)92, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)17, (short)45, (short)112, (short)112, (short)112, (short)112, (short)20, (short)112, (short)112, (short)112, (short)51, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)44, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)0, (short)118, (short)0, (short)118, (short)0, (short)119, (short)117, (short)113, (short)112, (short)112, (short)61, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)4, (short)112, (short)6, (short)7, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)13, (short)14, (short)112, (short)112, (short)112, (short)18, (short)112, (short)112, (short)112, (short)112, (short)112, (short)22, (short)112, (short)52, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)21, (short)112, (short)112, (short)112, (short)38, (short)112, (short)112, (short)112, (short)0, (short)118, (short)62, (short)112, (short)112, (short)112, (short)93, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)5, (short)47, (short)8, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)16, (short)112, (short)112, (short)112, (short)58, (short)46, (short)112, (short)112, (short)112, (short)112, (short)112, (short)53, (short)112, (short)112, (short)25, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)36, (short)112, (short)112, (short)112, (short)95, (short)42, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)56, (short)50, (short)112, (short)112, (short)12, (short)15, (short)112, (short)55, (short)88, (short)72, (short)112, (short)112, (short)112, (short)84, (short)112, (short)54, (short)112, (short)24, (short)26, (short)29, (short)31, (short)112, (short)112, (short)33, (short)112, (short)34, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)91, (short)112, (short)112, (short)76, (short)82, (short)112, (short)112, (short)112, (short)57, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)70, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)109, (short)110, (short)108, (short)10, (short)112, (short)112, (short)112, (short)112, (short)85, (short)112, (short)112, (short)112, (short)80, (short)112, (short)112, (short)112, (short)112, (short)35, (short)112, (short)49, (short)112, (short)112, (short)63, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)71, (short)112, (short)27, (short)112, (short)32, (short)94, (short)112, (short)112, (short)79, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)9, (short)112, (short)112, (short)112, (short)112, (short)112, (short)43, (short)23, (short)65, (short)112, (short)106, (short)112, (short)112, (short)37, (short)39, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)77, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)74, (short)75, (short)112, (short)107, (short)112, (short)112, (short)48, (short)112, (short)98, (short)64, (short)112, (short)112, (short)112, (short)112, (short)112, (short)69, (short)81, (short)28, (short)112, (short)41, (short)112, (short)87, (short)104, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)30, (short)68, (short)112, (short)0, (short)112, (short)112, (short)78, (short)112, (short)90, (short)112, (short)112, (short)101, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)73, (short)0, (short)112, (short)83, (short)40, (short)112, (short)112, (short)112, (short)112, (short)112, (short)97, (short)112, (short)96, (short)86, (short)67, (short)112, (short)112, (short)89, (short)112, (short)112, (short)112, (short)112, (short)111, (short)112, (short)112, (short)112, (short)112, (short)112, (short)99, (short)112, (short)105, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)60, (short)112, (short)112, (short)112, (short)112, (short)112, (short)59, (short)112, (short)112, (short)103, (short)112, (short)112, (short)100, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)102, (short)112, (short)66, (short)0
};

static const int yy_ec[256] = 
{
0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 21, 21, 22, 21, 23, 21, 21, 21, 24, 25, 26, 27, 28, 29, 1, 30, 31, 32, 30, 33, 34, 35, 35, 36, 37, 35, 38, 35, 35, 35, 35, 35, 35, 35, 35, 39, 35, 35, 40, 35, 35, 41, 42, 43, 44, 45, 1, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 35, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
};

static const int yy_meta[75] = 
{
0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 1, 4, 1, 1, 1, 1, 1, 1, 5, 5, 5, 5, 2, 1, 1, 1, 1, 1, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 1, 1, 1, 1, 7, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 1, 1, 1, 1
};

static const short int yy_base[704] = 
{
(short)0, (short)0, (short)0, (short)255, (short)2384, (short)2384, (short)2384, (short)2384, (short)206, (short)69, (short)2384, (short)2384, (short)49, (short)68, (short)186, (short)2384, (short)2384, (short)200, (short)64, (short)2384, (short)65, (short)63, (short)75, (short)94, (short)78, (short)79, (short)2384, (short)95, (short)171, (short)60, (short)2384, (short)86, (short)96, (short)118, (short)2384, (short)2384, (short)164, (short)129, (short)113, (short)126, (short)144, (short)153, (short)116, (short)157, (short)145, (short)161, (short)133, (short)156, (short)172, (short)197, (short)198, (short)205, (short)216, (short)199, (short)208, (short)2384, (short)53, (short)2384, (short)2384, (short)2384, (short)99, (short)2384, (short)184, (short)2384, (short)2384, (short)2384, (short)2384, (short)147, (short)183, (short)2384, (short)2384, (short)2384, (short)2384, (short)2384, (short)2384, (short)152, (short)256, (short)2384, (short)2384, (short)2384, (short)294, (short)334, (short)221, (short)230, (short)0, (short)0, (short)0, (short)2384, (short)2384, (short)2384, (short)137, (short)2384, (short)2384, (short)2384, (short)120, (short)111, (short)128, (short)89, (short)221, (short)103, (short)66, (short)2384, (short)236, (short)240, (short)215, (short)390, (short)273, (short)262, (short)278, (short)281, (short)288, (short)294, (short)206, (short)298, (short)225, (short)313, (short)309, (short)310, (short)315, (short)352, (short)353, (short)316, (short)319, (short)354, (short)370, (short)373, (short)382, (short)383, (short)377, (short)394, (short)314, (short)388, (short)398, (short)401, (short)392, (short)403, (short)405, (short)423, (short)433, (short)407, (short)450, (short)455, (short)457, (short)458, (short)463, (short)465, (short)468, (short)474, (short)466, (short)475, (short)478, (short)476, (short)481, (short)487, (short)2384, (short)2384, (short)2384, (short)2384, (short)527, (short)517, (short)555, (short)541, (short)545, (short)577, (short)473, (short)623, (short)582, (short)0, (short)2384, (short)2384, (short)0, (short)502, (short)507, (short)522, (short)577, (short)601, (short)533, (short)580, (short)598, (short)560, (short)593, (short)617, (short)625, (short)644, (short)513, (short)645, (short)614, (short)646, (short)662, (short)542, (short)652, (short)672, (short)674, (short)663, (short)675, (short)678, (short)680, (short)681, (short)684, (short)682, (short)690, (short)705, (short)706, (short)693, (short)709, (short)710, (short)713, (short)721, (short)729, (short)722, (short)737, (short)738, (short)740, (short)741, (short)742, (short)757, (short)759, (short)760, (short)763, (short)762, (short)764, (short)766, (short)767, (short)768, (short)769, (short)775, (short)784, (short)787, (short)791, (short)792, (short)794, (short)796, (short)797, (short)804, (short)807, (short)813, (short)816, (short)819, (short)823, (short)822, (short)824, (short)831, (short)826, (short)828, (short)832, (short)844, (short)847, (short)873, (short)877, (short)886, (short)877, (short)896, (short)900, (short)901, (short)905, (short)0, (short)852, (short)857, (short)916, (short)864, (short)937, (short)939, (short)941, (short)865, (short)943, (short)944, (short)947, (short)954, (short)881, (short)956, (short)959, (short)962, (short)966, (short)964, (short)967, (short)972, (short)971, (short)977, (short)988, (short)993, (short)859, (short)994, (short)995, (short)999, (short)1000, (short)1001, (short)1006, (short)1017, (short)1022, (short)1024, (short)1023, (short)1025, (short)1027, (short)1028, (short)1030, (short)1033, (short)1032, (short)1034, (short)1035, (short)1045, (short)1051, (short)1052, (short)1056, (short)1057, (short)1058, (short)1061, (short)1073, (short)1064, (short)1069, (short)1077, (short)1086, (short)1089, (short)1093, (short)1090, (short)1099, (short)1101, (short)1102, (short)1105, (short)1112, (short)1121, (short)1114, (short)1123, (short)1117, (short)1122, (short)1124, (short)1127, (short)1132, (short)1142, (short)1129, (short)1145, (short)1149, (short)1151, (short)1155, (short)1171, (short)1172, (short)1173, (short)1175, (short)1171, (short)1184, (short)1176, (short)1178, (short)1177, (short)1188, (short)1199, (short)1200, (short)1203, (short)1204, (short)1205, (short)1206, (short)1208, (short)1223, (short)1227, (short)1229, (short)1231, (short)1232, (short)1233, (short)1235, (short)1251, (short)1254, (short)1255, (short)1257, (short)1260, (short)1262, (short)1263, (short)1264, (short)1272, (short)1281, (short)1282, (short)1285, (short)1288, (short)1291, (short)1292, (short)1294, (short)1300, (short)1301, (short)1309, (short)1310, (short)1312, (short)1313, (short)1316, (short)1319, (short)1322, (short)1328, (short)1331, (short)1339, (short)1340, (short)1341, (short)1343, (short)1344, (short)1361, (short)1363, (short)1350, (short)1365, (short)1366, (short)1368, (short)1372, (short)1369, (short)1378, (short)1373, (short)1388, (short)1389, (short)1397, (short)1401, (short)1404, (short)1406, (short)1412, (short)1408, (short)1417, (short)1419, (short)1421, (short)1423, (short)1425, (short)1428, (short)1429, (short)1440, (short)1445, (short)1446, (short)1450, (short)1456, (short)1457, (short)1465, (short)1462, (short)1467, (short)1466, (short)1468, (short)1469, (short)1475, (short)1484, (short)1485, (short)1487, (short)1495, (short)1497, (short)1496, (short)1508, (short)1513, (short)1512, (short)1516, (short)1517, (short)1518, (short)1521, (short)1528, (short)1533, (short)1539, (short)1541, (short)1543, (short)1544, (short)1545, (short)1549, (short)1550, (short)1554, (short)1560, (short)1562, (short)1565, (short)1566, (short)1573, (short)1567, (short)1575, (short)1577, (short)1582, (short)1584, (short)1585, (short)1588, (short)1590, (short)1592, (short)1593, (short)1595, (short)1601, (short)1608, (short)1603, (short)1610, (short)1612, (short)1613, (short)1616, (short)1618, (short)1619, (short)1621, (short)1620, (short)1623, (short)1640, (short)1641, (short)1646, (short)1647, (short)1651, (short)1653, (short)1656, (short)1659, (short)1662, (short)1663, (short)1666, (short)1669, (short)1672, (short)1674, (short)1675, (short)1682, (short)1679, (short)1684, (short)1691, (short)1700, (short)1702, (short)1694, (short)1703, (short)1711, (short)1712, (short)1719, (short)1724, (short)1727, (short)1730, (short)1731, (short)1732, (short)1735, (short)1736, (short)1737, (short)1739, (short)1747, (short)1748, (short)1752, (short)1755, (short)1756, (short)1758, (short)1759, (short)1760, (short)1764, (short)1767, (short)1779, (short)1780, (short)1782, (short)1783, (short)1784, (short)1792, (short)1788, (short)1803, (short)1804, (short)1808, (short)1810, (short)1811, (short)1815, (short)1816, (short)1832, (short)1833, (short)1836, (short)1834, (short)1839, (short)1840, (short)1841, (short)1843, (short)1842, (short)1845, (short)1852, (short)1861, (short)1849, (short)1862, (short)1867, (short)1868, (short)1869, (short)1871, (short)1872, (short)1879, (short)1880, (short)1888, (short)1891, (short)1898, (short)1900, (short)1904, (short)1906, (short)1907, (short)1908, (short)1909, (short)1913, (short)1916, (short)1915, (short)1926, (short)1931, (short)1932, (short)1935, (short)1938, (short)1947, (short)1953, (short)1956, (short)1958, (short)1959, (short)1960, (short)1962, (short)1964, (short)1965, (short)1966, (short)1969, (short)1977, (short)1981, (short)1984, (short)1986, (short)1990, (short)1992, (short)1997, (short)2001, (short)2005, (short)2009, (short)2012, (short)2014, (short)2018, (short)2020, (short)2013, (short)2022, (short)2024, (short)2025, (short)2029, (short)2031, (short)2033, (short)2037, (short)2040, (short)2042, (short)2046, (short)2052, (short)2057, (short)2058, (short)2061, (short)84, (short)2063, (short)2069, (short)2062, (short)2070, (short)2080, (short)2082, (short)2085, (short)2086, (short)2087, (short)2102, (short)2103, (short)2106, (short)2107, (short)2108, (short)2109, (short)2110, (short)2111, (short)2384, (short)77, (short)2112, (short)2113, (short)2114, (short)2118, (short)2130, (short)2119, (short)2137, (short)2139, (short)2142, (short)2152, (short)2148, (short)2157, (short)2160, (short)2164, (short)2165, (short)2167, (short)2168, (short)2169, (short)2173, (short)2175, (short)2176, (short)2184, (short)2180, (short)2185, (short)2186, (short)2193, (short)2195, (short)2196, (short)2197, (short)2202, (short)2205, (short)2206, (short)2213, (short)2215, (short)2214, (short)2218, (short)2224, (short)2225, (short)2233, (short)2236, (short)2240, (short)2241, (short)2242, (short)2245, (short)2246, (short)2261, (short)2251, (short)2262, (short)2263, (short)2268, (short)2269, (short)2274, (short)2271, (short)2278, (short)2279, (short)2281, (short)2294, (short)2291, (short)2299, (short)2301, (short)2384, (short)2350, (short)2357, (short)2363, (short)2366, (short)2367, (short)2370, (short)2372, (short)2376
};

static const short int yy_def[704] = 
{
(short)0, (short)695, (short)1, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)696, (short)695, (short)695, (short)695, (short)695, (short)697, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)23, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)698, (short)698, (short)698, (short)695, (short)695, (short)695, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)695, (short)695, (short)695, (short)695, (short)695, (short)696, (short)695, (short)696, (short)695, (short)695, (short)695, (short)695, (short)697, (short)697, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)699, (short)24, (short)700, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)698, (short)695, (short)698, (short)696, (short)697, (short)695, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)699, (short)701, (short)695, (short)695, (short)702, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)695, (short)76, (short)695, (short)695, (short)695, (short)80, (short)695, (short)695, (short)701, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)695, (short)160, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)703, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)695, (short)703, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)0, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695
};

static const short int yy_nxt[2459] = 
{
(short)0, (short)4, (short)5, (short)6, (short)7, (short)8, (short)9, (short)10, (short)11, (short)12, (short)13, (short)14, (short)15, (short)16, (short)17, (short)18, (short)19, (short)20, (short)21, (short)22, (short)23, (short)24, (short)24, (short)24, (short)25, (short)26, (short)27, (short)28, (short)29, (short)30, (short)31, (short)32, (short)31, (short)31, (short)31, (short)31, (short)31, (short)31, (short)33, (short)31, (short)31, (short)34, (short)4, (short)35, (short)36, (short)37, (short)38, (short)39, (short)40, (short)41, (short)42, (short)43, (short)44, (short)31, (short)45, (short)31, (short)31, (short)46, (short)31, (short)47, (short)31, (short)48, (short)49, (short)50, (short)51, (short)52, (short)53, (short)54, (short)31, (short)31, (short)31, (short)55, (short)56, (short)57, (short)58, (short)61, (short)63, (short)64, (short)65, (short)70, (short)154, (short)75, (short)72, (short)76, (short)76, (short)76, (short)76, (short)93, (short)94, (short)77, (short)633, (short)71, (short)73, (short)74, (short)78, (short)66, (short)95, (short)633, (short)85, (short)85, (short)85, (short)85, (short)79, (short)86, (short)88, (short)61, (short)95, (short)87, (short)68, (short)61, (short)97, (short)62, (short)80, (short)170, (short)81, (short)81, (short)81, (short)81, (short)695, (short)89, (short)97, (short)90, (short)91, (short)95, (short)99, (short)155, (short)95, (short)82, (short)95, (short)100, (short)83, (short)83, (short)83, (short)83, (short)84, (short)97, (short)95, (short)97, (short)95, (short)95, (short)97, (short)62, (short)97, (short)95, (short)82, (short)62, (short)695, (short)169, (short)83, (short)83, (short)97, (short)83, (short)97, (short)97, (short)95, (short)95, (short)98, (short)97, (short)156, (short)83, (short)102, (short)103, (short)84, (short)95, (short)168, (short)104, (short)95, (short)95, (short)97, (short)97, (short)157, (short)95, (short)109, (short)122, (short)105, (short)123, (short)110, (short)97, (short)111, (short)106, (short)97, (short)97, (short)95, (short)107, (short)124, (short)97, (short)695, (short)695, (short)112, (short)68, (short)113, (short)101, (short)108, (short)134, (short)67, (short)128, (short)97, (short)114, (short)92, (short)117, (short)118, (short)115, (short)135, (short)119, (short)116, (short)129, (short)136, (short)95, (short)95, (short)95, (short)120, (short)125, (short)130, (short)121, (short)126, (short)95, (short)95, (short)127, (short)95, (short)131, (short)132, (short)97, (short)97, (short)97, (short)133, (short)95, (short)95, (short)69, (short)68, (short)97, (short)97, (short)95, (short)97, (short)59, (short)137, (short)95, (short)164, (short)138, (short)164, (short)97, (short)97, (short)165, (short)165, (short)165, (short)165, (short)97, (short)95, (short)139, (short)140, (short)97, (short)95, (short)141, (short)142, (short)150, (short)152, (short)695, (short)191, (short)695, (short)146, (short)151, (short)97, (short)153, (short)143, (short)144, (short)97, (short)145, (short)83, (short)83, (short)83, (short)83, (short)148, (short)193, (short)95, (short)174, (short)147, (short)149, (short)76, (short)76, (short)76, (short)76, (short)695, (short)171, (short)695, (short)95, (short)83, (short)83, (short)97, (short)83, (short)95, (short)158, (short)159, (short)95, (short)159, (short)159, (short)159, (short)83, (short)172, (short)97, (short)95, (short)695, (short)173, (short)695, (short)97, (short)695, (short)95, (short)97, (short)158, (short)159, (short)95, (short)695, (short)159, (short)159, (short)97, (short)159, (short)160, (short)160, (short)160, (short)160, (short)97, (short)95, (short)95, (short)186, (short)97, (short)95, (short)95, (short)95, (short)95, (short)161, (short)162, (short)95, (short)162, (short)162, (short)162, (short)97, (short)97, (short)695, (short)695, (short)97, (short)97, (short)97, (short)97, (short)185, (short)187, (short)97, (short)161, (short)162, (short)189, (short)695, (short)162, (short)162, (short)188, (short)162, (short)80, (short)695, (short)81, (short)81, (short)81, (short)81, (short)190, (short)194, (short)695, (short)192, (short)95, (short)95, (short)95, (short)695, (short)197, (short)82, (short)195, (short)198, (short)163, (short)163, (short)163, (short)163, (short)196, (short)695, (short)97, (short)97, (short)97, (short)199, (short)95, (short)203, (short)204, (short)95, (short)82, (short)695, (short)695, (short)95, (short)163, (short)163, (short)695, (short)163, (short)95, (short)95, (short)97, (short)695, (short)695, (short)97, (short)95, (short)163, (short)95, (short)97, (short)95, (short)200, (short)95, (short)695, (short)97, (short)97, (short)95, (short)201, (short)202, (short)95, (short)97, (short)95, (short)97, (short)95, (short)97, (short)95, (short)97, (short)205, (short)695, (short)695, (short)97, (short)695, (short)695, (short)97, (short)695, (short)97, (short)695, (short)97, (short)695, (short)97, (short)695, (short)95, (short)206, (short)207, (short)175, (short)176, (short)177, (short)178, (short)179, (short)210, (short)208, (short)95, (short)180, (short)209, (short)213, (short)97, (short)695, (short)212, (short)695, (short)217, (short)181, (short)182, (short)183, (short)214, (short)184, (short)97, (short)211, (short)223, (short)95, (short)218, (short)215, (short)695, (short)216, (short)95, (short)224, (short)95, (short)95, (short)695, (short)225, (short)226, (short)219, (short)95, (short)97, (short)95, (short)95, (short)220, (short)95, (short)97, (short)222, (short)97, (short)97, (short)221, (short)95, (short)95, (short)95, (short)97, (short)95, (short)97, (short)97, (short)95, (short)97, (short)165, (short)165, (short)165, (short)165, (short)95, (short)97, (short)97, (short)97, (short)695, (short)97, (short)695, (short)231, (short)97, (short)695, (short)232, (short)695, (short)229, (short)235, (short)97, (short)95, (short)695, (short)227, (short)228, (short)695, (short)95, (short)233, (short)236, (short)234, (short)695, (short)237, (short)95, (short)695, (short)239, (short)97, (short)230, (short)695, (short)240, (short)243, (short)97, (short)95, (short)244, (short)695, (short)238, (short)695, (short)97, (short)241, (short)695, (short)242, (short)246, (short)247, (short)95, (short)247, (short)245, (short)97, (short)248, (short)248, (short)248, (short)248, (short)159, (short)95, (short)159, (short)159, (short)159, (short)251, (short)97, (short)251, (short)257, (short)695, (short)252, (short)252, (short)252, (short)252, (short)695, (short)97, (short)258, (short)159, (short)695, (short)95, (short)159, (short)159, (short)275, (short)159, (short)160, (short)160, (short)160, (short)160, (short)162, (short)259, (short)162, (short)162, (short)162, (short)97, (short)695, (short)695, (short)95, (short)249, (short)250, (short)95, (short)250, (short)250, (short)250, (short)695, (short)695, (short)162, (short)695, (short)264, (short)162, (short)162, (short)97, (short)162, (short)95, (short)97, (short)249, (short)250, (short)695, (short)95, (short)250, (short)250, (short)95, (short)250, (short)163, (short)163, (short)163, (short)163, (short)97, (short)254, (short)254, (short)254, (short)254, (short)97, (short)260, (short)95, (short)97, (short)695, (short)95, (short)268, (short)265, (short)695, (short)163, (short)163, (short)695, (short)163, (short)95, (short)254, (short)254, (short)97, (short)254, (short)266, (short)97, (short)163, (short)165, (short)165, (short)165, (short)165, (short)254, (short)267, (short)97, (short)695, (short)695, (short)269, (short)695, (short)95, (short)95, (short)95, (short)253, (short)261, (short)253, (short)253, (short)253, (short)95, (short)695, (short)262, (short)263, (short)695, (short)270, (short)97, (short)97, (short)97, (short)277, (short)95, (short)95, (short)253, (short)695, (short)97, (short)253, (short)253, (short)271, (short)253, (short)695, (short)95, (short)695, (short)95, (short)95, (short)97, (short)97, (short)95, (short)272, (short)95, (short)95, (short)95, (short)695, (short)95, (short)278, (short)97, (short)273, (short)97, (short)97, (short)95, (short)695, (short)97, (short)95, (short)97, (short)97, (short)97, (short)279, (short)97, (short)276, (short)695, (short)695, (short)280, (short)274, (short)97, (short)95, (short)95, (short)97, (short)281, (short)95, (short)95, (short)695, (short)695, (short)95, (short)282, (short)283, (short)287, (short)695, (short)290, (short)97, (short)97, (short)95, (short)95, (short)97, (short)97, (short)288, (short)291, (short)97, (short)284, (short)95, (short)296, (short)285, (short)286, (short)289, (short)292, (short)97, (short)97, (short)95, (short)95, (short)695, (short)95, (short)95, (short)95, (short)97, (short)695, (short)293, (short)294, (short)695, (short)695, (short)297, (short)295, (short)97, (short)97, (short)299, (short)97, (short)97, (short)97, (short)95, (short)298, (short)95, (short)95, (short)300, (short)95, (short)95, (short)95, (short)301, (short)95, (short)95, (short)95, (short)95, (short)306, (short)97, (short)310, (short)97, (short)97, (short)95, (short)97, (short)97, (short)97, (short)695, (short)97, (short)97, (short)97, (short)97, (short)95, (short)695, (short)305, (short)95, (short)302, (short)97, (short)303, (short)95, (short)95, (short)304, (short)95, (short)695, (short)95, (short)95, (short)97, (short)307, (short)695, (short)97, (short)308, (short)309, (short)95, (short)97, (short)97, (short)95, (short)97, (short)315, (short)97, (short)97, (short)314, (short)95, (short)313, (short)695, (short)95, (short)312, (short)97, (short)95, (short)311, (short)97, (short)95, (short)95, (short)95, (short)695, (short)95, (short)97, (short)95, (short)316, (short)97, (short)95, (short)95, (short)97, (short)320, (short)322, (short)97, (short)97, (short)97, (short)317, (short)97, (short)319, (short)97, (short)318, (short)95, (short)97, (short)97, (short)95, (short)695, (short)695, (short)321, (short)325, (short)95, (short)695, (short)695, (short)323, (short)695, (short)95, (short)97, (short)95, (short)695, (short)97, (short)324, (short)328, (short)95, (short)95, (short)97, (short)333, (short)334, (short)695, (short)326, (short)97, (short)327, (short)97, (short)330, (short)331, (short)329, (short)695, (short)97, (short)97, (short)332, (short)95, (short)335, (short)248, (short)248, (short)248, (short)248, (short)248, (short)248, (short)248, (short)248, (short)337, (short)695, (short)337, (short)336, (short)97, (short)338, (short)338, (short)338, (short)338, (short)695, (short)250, (short)695, (short)250, (short)250, (short)250, (short)252, (short)252, (short)252, (short)252, (short)252, (short)252, (short)252, (short)252, (short)695, (short)340, (short)95, (short)695, (short)250, (short)344, (short)695, (short)250, (short)250, (short)695, (short)250, (short)253, (short)695, (short)253, (short)253, (short)253, (short)97, (short)254, (short)254, (short)254, (short)254, (short)349, (short)695, (short)95, (short)695, (short)95, (short)695, (short)95, (short)253, (short)95, (short)95, (short)253, (short)253, (short)95, (short)253, (short)254, (short)254, (short)97, (short)254, (short)97, (short)95, (short)97, (short)95, (short)97, (short)97, (short)95, (short)254, (short)97, (short)95, (short)339, (short)95, (short)695, (short)95, (short)95, (short)97, (short)695, (short)97, (short)95, (short)95, (short)97, (short)695, (short)695, (short)97, (short)95, (short)97, (short)341, (short)97, (short)97, (short)695, (short)342, (short)346, (short)97, (short)97, (short)345, (short)95, (short)343, (short)695, (short)97, (short)348, (short)95, (short)95, (short)95, (short)347, (short)695, (short)695, (short)95, (short)95, (short)95, (short)97, (short)350, (short)353, (short)354, (short)95, (short)97, (short)97, (short)97, (short)351, (short)358, (short)352, (short)97, (short)97, (short)97, (short)355, (short)95, (short)356, (short)357, (short)97, (short)359, (short)95, (short)95, (short)95, (short)95, (short)360, (short)95, (short)95, (short)695, (short)95, (short)97, (short)95, (short)95, (short)95, (short)95, (short)97, (short)97, (short)97, (short)97, (short)362, (short)97, (short)97, (short)361, (short)97, (short)95, (short)97, (short)97, (short)97, (short)97, (short)365, (short)95, (short)95, (short)363, (short)366, (short)364, (short)95, (short)95, (short)95, (short)97, (short)369, (short)95, (short)367, (short)368, (short)95, (short)97, (short)97, (short)695, (short)695, (short)95, (short)97, (short)97, (short)97, (short)95, (short)695, (short)97, (short)371, (short)95, (short)97, (short)375, (short)370, (short)374, (short)372, (short)97, (short)695, (short)382, (short)95, (short)97, (short)373, (short)95, (short)95, (short)97, (short)695, (short)95, (short)695, (short)695, (short)695, (short)376, (short)380, (short)95, (short)97, (short)95, (short)95, (short)97, (short)97, (short)95, (short)378, (short)97, (short)377, (short)379, (short)381, (short)695, (short)95, (short)97, (short)95, (short)97, (short)97, (short)95, (short)383, (short)97, (short)695, (short)95, (short)95, (short)95, (short)95, (short)385, (short)97, (short)95, (short)97, (short)95, (short)384, (short)97, (short)95, (short)386, (short)387, (short)97, (short)97, (short)97, (short)97, (short)695, (short)695, (short)97, (short)95, (short)97, (short)695, (short)95, (short)97, (short)695, (short)695, (short)95, (short)695, (short)95, (short)388, (short)396, (short)390, (short)95, (short)97, (short)391, (short)389, (short)97, (short)695, (short)393, (short)398, (short)97, (short)394, (short)97, (short)392, (short)395, (short)402, (short)97, (short)400, (short)95, (short)95, (short)95, (short)399, (short)95, (short)95, (short)95, (short)95, (short)397, (short)401, (short)338, (short)338, (short)338, (short)338, (short)97, (short)97, (short)97, (short)95, (short)97, (short)97, (short)97, (short)97, (short)404, (short)338, (short)338, (short)338, (short)338, (short)403, (short)95, (short)95, (short)695, (short)97, (short)95, (short)95, (short)95, (short)95, (short)695, (short)95, (short)695, (short)405, (short)695, (short)695, (short)97, (short)97, (short)408, (short)407, (short)97, (short)97, (short)97, (short)97, (short)410, (short)97, (short)95, (short)695, (short)409, (short)406, (short)95, (short)695, (short)95, (short)411, (short)95, (short)95, (short)95, (short)412, (short)95, (short)695, (short)97, (short)695, (short)695, (short)420, (short)97, (short)415, (short)97, (short)695, (short)97, (short)97, (short)97, (short)418, (short)97, (short)414, (short)95, (short)413, (short)417, (short)95, (short)95, (short)695, (short)95, (short)416, (short)695, (short)95, (short)695, (short)95, (short)95, (short)95, (short)97, (short)695, (short)419, (short)97, (short)97, (short)423, (short)97, (short)95, (short)424, (short)97, (short)425, (short)97, (short)97, (short)97, (short)695, (short)422, (short)95, (short)95, (short)421, (short)695, (short)95, (short)97, (short)426, (short)95, (short)695, (short)695, (short)95, (short)95, (short)429, (short)95, (short)97, (short)97, (short)430, (short)431, (short)97, (short)95, (short)95, (short)97, (short)427, (short)428, (short)97, (short)97, (short)695, (short)97, (short)95, (short)95, (short)695, (short)95, (short)95, (short)97, (short)97, (short)95, (short)433, (short)695, (short)95, (short)695, (short)432, (short)95, (short)97, (short)97, (short)435, (short)97, (short)97, (short)95, (short)434, (short)97, (short)95, (short)438, (short)97, (short)439, (short)436, (short)97, (short)695, (short)437, (short)95, (short)95, (short)95, (short)97, (short)95, (short)95, (short)97, (short)695, (short)695, (short)444, (short)442, (short)95, (short)440, (short)441, (short)97, (short)97, (short)97, (short)695, (short)97, (short)97, (short)443, (short)446, (short)95, (short)447, (short)95, (short)97, (short)95, (short)95, (short)695, (short)95, (short)95, (short)445, (short)453, (short)95, (short)95, (short)695, (short)97, (short)695, (short)97, (short)95, (short)97, (short)97, (short)451, (short)97, (short)97, (short)695, (short)695, (short)97, (short)97, (short)95, (short)95, (short)448, (short)695, (short)97, (short)450, (short)449, (short)695, (short)695, (short)95, (short)452, (short)455, (short)695, (short)95, (short)97, (short)97, (short)95, (short)456, (short)95, (short)454, (short)95, (short)457, (short)458, (short)97, (short)95, (short)695, (short)460, (short)97, (short)459, (short)95, (short)97, (short)95, (short)97, (short)95, (short)97, (short)95, (short)462, (short)95, (short)97, (short)461, (short)95, (short)95, (short)695, (short)97, (short)463, (short)97, (short)695, (short)97, (short)465, (short)97, (short)695, (short)97, (short)95, (short)466, (short)97, (short)97, (short)464, (short)95, (short)95, (short)695, (short)468, (short)695, (short)95, (short)695, (short)469, (short)470, (short)97, (short)467, (short)95, (short)95, (short)695, (short)97, (short)97, (short)471, (short)95, (short)474, (short)97, (short)95, (short)95, (short)95, (short)95, (short)95, (short)97, (short)97, (short)472, (short)475, (short)473, (short)95, (short)97, (short)482, (short)695, (short)97, (short)97, (short)97, (short)97, (short)97, (short)95, (short)95, (short)695, (short)95, (short)695, (short)97, (short)695, (short)695, (short)477, (short)695, (short)476, (short)95, (short)95, (short)95, (short)97, (short)97, (short)478, (short)97, (short)485, (short)479, (short)486, (short)480, (short)481, (short)484, (short)95, (short)97, (short)97, (short)97, (short)95, (short)95, (short)483, (short)695, (short)95, (short)95, (short)95, (short)487, (short)695, (short)95, (short)97, (short)695, (short)695, (short)490, (short)97, (short)97, (short)95, (short)488, (short)97, (short)97, (short)97, (short)95, (short)491, (short)97, (short)493, (short)489, (short)494, (short)95, (short)492, (short)95, (short)97, (short)95, (short)95, (short)95, (short)495, (short)97, (short)496, (short)95, (short)95, (short)497, (short)499, (short)97, (short)95, (short)97, (short)501, (short)97, (short)97, (short)97, (short)95, (short)498, (short)95, (short)97, (short)97, (short)95, (short)95, (short)95, (short)97, (short)695, (short)500, (short)502, (short)695, (short)95, (short)97, (short)95, (short)97, (short)95, (short)503, (short)97, (short)97, (short)97, (short)95, (short)504, (short)95, (short)95, (short)506, (short)97, (short)95, (short)97, (short)95, (short)97, (short)95, (short)95, (short)507, (short)95, (short)97, (short)505, (short)97, (short)97, (short)695, (short)95, (short)97, (short)95, (short)97, (short)509, (short)97, (short)97, (short)95, (short)97, (short)95, (short)510, (short)95, (short)95, (short)508, (short)97, (short)95, (short)97, (short)95, (short)95, (short)95, (short)95, (short)97, (short)95, (short)97, (short)695, (short)97, (short)97, (short)695, (short)514, (short)97, (short)511, (short)97, (short)97, (short)97, (short)97, (short)695, (short)97, (short)695, (short)512, (short)95, (short)95, (short)516, (short)513, (short)695, (short)515, (short)95, (short)95, (short)517, (short)520, (short)518, (short)95, (short)522, (short)95, (short)97, (short)97, (short)95, (short)519, (short)524, (short)95, (short)97, (short)97, (short)95, (short)95, (short)525, (short)97, (short)95, (short)97, (short)523, (short)95, (short)97, (short)521, (short)95, (short)97, (short)95, (short)95, (short)97, (short)97, (short)695, (short)95, (short)97, (short)695, (short)95, (short)97, (short)95, (short)695, (short)97, (short)528, (short)97, (short)97, (short)695, (short)95, (short)526, (short)97, (short)95, (short)530, (short)97, (short)529, (short)97, (short)527, (short)95, (short)532, (short)95, (short)95, (short)533, (short)97, (short)531, (short)695, (short)97, (short)695, (short)534, (short)95, (short)95, (short)535, (short)97, (short)537, (short)97, (short)97, (short)538, (short)95, (short)695, (short)536, (short)539, (short)540, (short)95, (short)97, (short)97, (short)95, (short)695, (short)695, (short)95, (short)95, (short)95, (short)97, (short)541, (short)95, (short)95, (short)95, (short)97, (short)95, (short)543, (short)97, (short)544, (short)542, (short)97, (short)97, (short)97, (short)95, (short)95, (short)97, (short)97, (short)97, (short)95, (short)97, (short)695, (short)95, (short)95, (short)695, (short)95, (short)95, (short)95, (short)97, (short)97, (short)695, (short)95, (short)547, (short)97, (short)95, (short)548, (short)97, (short)97, (short)545, (short)97, (short)97, (short)97, (short)695, (short)546, (short)552, (short)97, (short)95, (short)95, (short)97, (short)95, (short)95, (short)95, (short)695, (short)695, (short)550, (short)95, (short)555, (short)551, (short)549, (short)95, (short)97, (short)97, (short)556, (short)97, (short)97, (short)97, (short)557, (short)553, (short)554, (short)97, (short)95, (short)95, (short)695, (short)97, (short)558, (short)95, (short)695, (short)95, (short)95, (short)695, (short)695, (short)695, (short)95, (short)95, (short)97, (short)97, (short)559, (short)560, (short)695, (short)97, (short)563, (short)97, (short)97, (short)566, (short)565, (short)564, (short)97, (short)97, (short)562, (short)95, (short)95, (short)95, (short)561, (short)95, (short)695, (short)567, (short)95, (short)95, (short)95, (short)95, (short)95, (short)695, (short)95, (short)97, (short)97, (short)97, (short)95, (short)97, (short)568, (short)95, (short)97, (short)97, (short)97, (short)97, (short)97, (short)569, (short)97, (short)695, (short)95, (short)95, (short)97, (short)695, (short)570, (short)97, (short)95, (short)95, (short)95, (short)571, (short)95, (short)95, (short)695, (short)576, (short)97, (short)97, (short)573, (short)578, (short)95, (short)95, (short)97, (short)97, (short)97, (short)583, (short)97, (short)97, (short)572, (short)95, (short)574, (short)577, (short)95, (short)575, (short)97, (short)97, (short)581, (short)579, (short)695, (short)95, (short)580, (short)95, (short)582, (short)97, (short)695, (short)95, (short)97, (short)95, (short)95, (short)95, (short)95, (short)695, (short)584, (short)97, (short)95, (short)97, (short)95, (short)95, (short)586, (short)97, (short)695, (short)97, (short)97, (short)97, (short)97, (short)585, (short)695, (short)95, (short)97, (short)587, (short)97, (short)97, (short)95, (short)95, (short)589, (short)695, (short)95, (short)695, (short)695, (short)95, (short)591, (short)97, (short)695, (short)695, (short)594, (short)592, (short)97, (short)97, (short)95, (short)596, (short)97, (short)588, (short)597, (short)97, (short)95, (short)590, (short)598, (short)95, (short)593, (short)95, (short)95, (short)95, (short)97, (short)95, (short)595, (short)95, (short)95, (short)95, (short)97, (short)601, (short)95, (short)97, (short)602, (short)97, (short)97, (short)97, (short)599, (short)97, (short)95, (short)97, (short)97, (short)97, (short)95, (short)603, (short)97, (short)95, (short)600, (short)95, (short)604, (short)695, (short)695, (short)95, (short)97, (short)95, (short)605, (short)695, (short)97, (short)695, (short)95, (short)97, (short)615, (short)97, (short)95, (short)608, (short)609, (short)97, (short)95, (short)97, (short)606, (short)607, (short)95, (short)610, (short)97, (short)95, (short)95, (short)95, (short)97, (short)695, (short)611, (short)95, (short)97, (short)95, (short)612, (short)95, (short)97, (short)95, (short)95, (short)97, (short)97, (short)97, (short)95, (short)613, (short)95, (short)97, (short)95, (short)97, (short)695, (short)97, (short)95, (short)97, (short)97, (short)95, (short)695, (short)95, (short)97, (short)617, (short)97, (short)95, (short)97, (short)614, (short)618, (short)616, (short)97, (short)95, (short)619, (short)97, (short)620, (short)97, (short)95, (short)95, (short)695, (short)97, (short)95, (short)95, (short)95, (short)695, (short)695, (short)97, (short)622, (short)623, (short)95, (short)95, (short)97, (short)97, (short)625, (short)695, (short)97, (short)97, (short)97, (short)628, (short)621, (short)95, (short)695, (short)95, (short)97, (short)97, (short)95, (short)95, (short)95, (short)626, (short)624, (short)630, (short)695, (short)627, (short)631, (short)97, (short)629, (short)97, (short)632, (short)635, (short)97, (short)97, (short)97, (short)95, (short)95, (short)636, (short)637, (short)95, (short)95, (short)95, (short)95, (short)95, (short)95, (short)95, (short)95, (short)95, (short)695, (short)97, (short)97, (short)95, (short)95, (short)97, (short)97, (short)97, (short)97, (short)97, (short)97, (short)97, (short)97, (short)97, (short)638, (short)95, (short)695, (short)97, (short)97, (short)639, (short)695, (short)695, (short)95, (short)640, (short)95, (short)695, (short)695, (short)95, (short)642, (short)97, (short)647, (short)649, (short)650, (short)95, (short)648, (short)645, (short)97, (short)95, (short)97, (short)641, (short)653, (short)97, (short)95, (short)695, (short)643, (short)95, (short)644, (short)97, (short)646, (short)95, (short)95, (short)97, (short)95, (short)95, (short)95, (short)652, (short)97, (short)651, (short)95, (short)97, (short)95, (short)95, (short)695, (short)97, (short)97, (short)95, (short)97, (short)97, (short)97, (short)95, (short)95, (short)95, (short)97, (short)655, (short)97, (short)97, (short)654, (short)656, (short)95, (short)97, (short)95, (short)95, (short)95, (short)97, (short)97, (short)97, (short)658, (short)95, (short)660, (short)657, (short)95, (short)95, (short)97, (short)695, (short)97, (short)97, (short)97, (short)659, (short)95, (short)95, (short)95, (short)97, (short)695, (short)95, (short)97, (short)97, (short)661, (short)662, (short)695, (short)95, (short)95, (short)664, (short)97, (short)97, (short)97, (short)667, (short)665, (short)97, (short)95, (short)663, (short)695, (short)95, (short)666, (short)97, (short)97, (short)95, (short)95, (short)95, (short)695, (short)668, (short)95, (short)95, (short)97, (short)672, (short)669, (short)97, (short)95, (short)670, (short)695, (short)97, (short)97, (short)97, (short)671, (short)675, (short)97, (short)97, (short)95, (short)95, (short)95, (short)677, (short)97, (short)673, (short)674, (short)95, (short)95, (short)676, (short)95, (short)695, (short)695, (short)95, (short)97, (short)97, (short)97, (short)95, (short)95, (short)682, (short)95, (short)97, (short)97, (short)695, (short)97, (short)679, (short)678, (short)97, (short)695, (short)680, (short)95, (short)97, (short)97, (short)95, (short)97, (short)695, (short)683, (short)685, (short)95, (short)681, (short)95, (short)695, (short)686, (short)695, (short)97, (short)695, (short)695, (short)97, (short)695, (short)684, (short)689, (short)695, (short)97, (short)695, (short)97, (short)695, (short)695, (short)691, (short)695, (short)695, (short)695, (short)695, (short)687, (short)695, (short)695, (short)688, (short)695, (short)695, (short)693, (short)695, (short)695, (short)690, (short)695, (short)694, (short)695, (short)695, (short)695, (short)695, (short)695, (short)692, (short)60, (short)60, (short)60, (short)60, (short)60, (short)60, (short)60, (short)67, (short)67, (short)695, (short)67, (short)67, (short)67, (short)67, (short)96, (short)695, (short)695, (short)96, (short)96, (short)96, (short)166, (short)166, (short)167, (short)167, (short)255, (short)255, (short)255, (short)256, (short)256, (short)634, (short)634, (short)634, (short)634, (short)3, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695
};

static const short int yy_chk[2459] = 
{
(short)0, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)9, (short)12, (short)12, (short)13, (short)18, (short)56, (short)21, (short)20, (short)21, (short)21, (short)21, (short)21, (short)29, (short)29, (short)22, (short)634, (short)18, (short)20, (short)20, (short)22, (short)13, (short)31, (short)615, (short)24, (short)24, (short)24, (short)24, (short)22, (short)25, (short)27, (short)60, (short)32, (short)25, (short)100, (short)99, (short)31, (short)9, (short)23, (short)97, (short)23, (short)23, (short)23, (short)23, (short)24, (short)27, (short)32, (short)27, (short)27, (short)38, (short)33, (short)56, (short)42, (short)23, (short)33, (short)33, (short)23, (short)23, (short)23, (short)23, (short)23, (short)95, (short)39, (short)38, (short)96, (short)37, (short)42, (short)60, (short)33, (short)46, (short)23, (short)99, (short)24, (short)94, (short)23, (short)23, (short)39, (short)23, (short)96, (short)37, (short)40, (short)44, (short)32, (short)46, (short)67, (short)23, (short)37, (short)37, (short)23, (short)41, (short)90, (short)37, (short)47, (short)43, (short)40, (short)44, (short)75, (short)45, (short)38, (short)42, (short)37, (short)42, (short)38, (short)41, (short)38, (short)37, (short)47, (short)43, (short)48, (short)37, (short)42, (short)45, (short)68, (short)62, (short)39, (short)67, (short)40, (short)36, (short)37, (short)46, (short)68, (short)44, (short)48, (short)40, (short)28, (short)41, (short)41, (short)40, (short)47, (short)41, (short)40, (short)44, (short)47, (short)49, (short)50, (short)53, (short)41, (short)43, (short)45, (short)41, (short)43, (short)51, (short)112, (short)43, (short)54, (short)45, (short)45, (short)49, (short)50, (short)53, (short)45, (short)104, (short)52, (short)17, (short)14, (short)51, (short)112, (short)98, (short)54, (short)8, (short)48, (short)114, (short)82, (short)48, (short)82, (short)104, (short)52, (short)82, (short)82, (short)82, (short)82, (short)98, (short)102, (short)49, (short)50, (short)114, (short)103, (short)50, (short)50, (short)53, (short)54, (short)3, (short)112, (short)0, (short)51, (short)53, (short)102, (short)54, (short)50, (short)50, (short)103, (short)50, (short)83, (short)83, (short)83, (short)83, (short)52, (short)114, (short)107, (short)104, (short)51, (short)52, (short)76, (short)76, (short)76, (short)76, (short)0, (short)98, (short)0, (short)106, (short)83, (short)83, (short)107, (short)83, (short)108, (short)76, (short)76, (short)109, (short)76, (short)76, (short)76, (short)83, (short)102, (short)106, (short)110, (short)0, (short)103, (short)0, (short)108, (short)0, (short)111, (short)109, (short)76, (short)76, (short)113, (short)0, (short)76, (short)76, (short)110, (short)76, (short)80, (short)80, (short)80, (short)80, (short)111, (short)116, (short)117, (short)107, (short)113, (short)115, (short)130, (short)118, (short)121, (short)80, (short)80, (short)122, (short)80, (short)80, (short)80, (short)116, (short)117, (short)0, (short)0, (short)115, (short)130, (short)118, (short)121, (short)106, (short)108, (short)122, (short)80, (short)80, (short)110, (short)0, (short)80, (short)80, (short)109, (short)80, (short)81, (short)0, (short)81, (short)81, (short)81, (short)81, (short)111, (short)115, (short)0, (short)113, (short)119, (short)120, (short)123, (short)0, (short)118, (short)81, (short)116, (short)118, (short)81, (short)81, (short)81, (short)81, (short)117, (short)0, (short)119, (short)120, (short)123, (short)118, (short)124, (short)121, (short)122, (short)125, (short)81, (short)0, (short)0, (short)128, (short)81, (short)81, (short)0, (short)81, (short)126, (short)127, (short)124, (short)0, (short)0, (short)125, (short)131, (short)81, (short)105, (short)128, (short)134, (short)119, (short)129, (short)0, (short)126, (short)127, (short)132, (short)119, (short)120, (short)133, (short)131, (short)135, (short)105, (short)136, (short)134, (short)139, (short)129, (short)123, (short)0, (short)0, (short)132, (short)0, (short)0, (short)133, (short)0, (short)135, (short)0, (short)136, (short)0, (short)139, (short)0, (short)137, (short)124, (short)125, (short)105, (short)105, (short)105, (short)105, (short)105, (short)128, (short)126, (short)138, (short)105, (short)127, (short)132, (short)137, (short)0, (short)131, (short)0, (short)134, (short)105, (short)105, (short)105, (short)132, (short)105, (short)138, (short)129, (short)139, (short)140, (short)135, (short)132, (short)0, (short)133, (short)141, (short)139, (short)142, (short)143, (short)0, (short)139, (short)139, (short)136, (short)144, (short)140, (short)145, (short)148, (short)137, (short)146, (short)141, (short)138, (short)142, (short)143, (short)137, (short)147, (short)149, (short)151, (short)144, (short)150, (short)145, (short)148, (short)152, (short)146, (short)164, (short)164, (short)164, (short)164, (short)153, (short)147, (short)149, (short)151, (short)0, (short)150, (short)0, (short)143, (short)152, (short)0, (short)143, (short)0, (short)142, (short)144, (short)153, (short)171, (short)0, (short)140, (short)141, (short)0, (short)172, (short)143, (short)145, (short)143, (short)0, (short)146, (short)184, (short)0, (short)148, (short)171, (short)142, (short)0, (short)149, (short)151, (short)172, (short)173, (short)151, (short)0, (short)147, (short)0, (short)184, (short)149, (short)0, (short)150, (short)153, (short)158, (short)176, (short)158, (short)152, (short)173, (short)158, (short)158, (short)158, (short)158, (short)159, (short)189, (short)159, (short)159, (short)159, (short)161, (short)176, (short)161, (short)171, (short)0, (short)161, (short)161, (short)161, (short)161, (short)0, (short)189, (short)172, (short)159, (short)0, (short)179, (short)159, (short)159, (short)184, (short)159, (short)160, (short)160, (short)160, (short)160, (short)162, (short)173, (short)162, (short)162, (short)162, (short)179, (short)0, (short)0, (short)174, (short)160, (short)160, (short)177, (short)160, (short)160, (short)160, (short)0, (short)0, (short)162, (short)0, (short)176, (short)162, (short)162, (short)174, (short)162, (short)180, (short)177, (short)160, (short)160, (short)0, (short)178, (short)160, (short)160, (short)175, (short)160, (short)163, (short)163, (short)163, (short)163, (short)180, (short)166, (short)166, (short)166, (short)166, (short)178, (short)174, (short)186, (short)175, (short)0, (short)181, (short)179, (short)177, (short)0, (short)163, (short)163, (short)0, (short)163, (short)182, (short)166, (short)166, (short)186, (short)166, (short)177, (short)181, (short)163, (short)165, (short)165, (short)165, (short)165, (short)166, (short)178, (short)182, (short)0, (short)0, (short)180, (short)0, (short)183, (short)185, (short)187, (short)165, (short)175, (short)165, (short)165, (short)165, (short)190, (short)0, (short)175, (short)175, (short)0, (short)181, (short)183, (short)185, (short)187, (short)186, (short)188, (short)193, (short)165, (short)0, (short)190, (short)165, (short)165, (short)182, (short)165, (short)0, (short)191, (short)0, (short)192, (short)194, (short)188, (short)193, (short)195, (short)182, (short)196, (short)197, (short)199, (short)0, (short)198, (short)187, (short)191, (short)183, (short)192, (short)194, (short)200, (short)0, (short)195, (short)203, (short)196, (short)197, (short)199, (short)188, (short)198, (short)185, (short)0, (short)0, (short)190, (short)183, (short)200, (short)201, (short)202, (short)203, (short)191, (short)204, (short)205, (short)0, (short)0, (short)206, (short)192, (short)193, (short)196, (short)0, (short)199, (short)201, (short)202, (short)207, (short)209, (short)204, (short)205, (short)197, (short)200, (short)206, (short)194, (short)208, (short)203, (short)195, (short)195, (short)198, (short)200, (short)207, (short)209, (short)210, (short)211, (short)0, (short)212, (short)213, (short)214, (short)208, (short)0, (short)201, (short)202, (short)0, (short)0, (short)204, (short)202, (short)210, (short)211, (short)206, (short)212, (short)213, (short)214, (short)215, (short)205, (short)216, (short)217, (short)207, (short)219, (short)218, (short)220, (short)208, (short)221, (short)222, (short)223, (short)224, (short)215, (short)215, (short)219, (short)216, (short)217, (short)225, (short)219, (short)218, (short)220, (short)0, (short)221, (short)222, (short)223, (short)224, (short)226, (short)0, (short)214, (short)227, (short)211, (short)225, (short)212, (short)228, (short)229, (short)213, (short)230, (short)0, (short)231, (short)232, (short)226, (short)216, (short)0, (short)227, (short)217, (short)218, (short)233, (short)228, (short)229, (short)234, (short)230, (short)224, (short)231, (short)232, (short)223, (short)235, (short)222, (short)0, (short)236, (short)221, (short)233, (short)237, (short)220, (short)234, (short)239, (short)238, (short)240, (short)0, (short)242, (short)235, (short)243, (short)225, (short)236, (short)241, (short)244, (short)237, (short)230, (short)232, (short)239, (short)238, (short)240, (short)226, (short)242, (short)229, (short)243, (short)228, (short)245, (short)241, (short)244, (short)246, (short)0, (short)0, (short)231, (short)235, (short)256, (short)0, (short)0, (short)233, (short)0, (short)257, (short)245, (short)280, (short)0, (short)246, (short)234, (short)238, (short)259, (short)263, (short)256, (short)243, (short)244, (short)0, (short)236, (short)257, (short)237, (short)280, (short)240, (short)241, (short)239, (short)0, (short)259, (short)263, (short)242, (short)268, (short)245, (short)247, (short)247, (short)247, (short)247, (short)248, (short)248, (short)248, (short)248, (short)249, (short)0, (short)249, (short)246, (short)268, (short)249, (short)249, (short)249, (short)249, (short)248, (short)250, (short)0, (short)250, (short)250, (short)250, (short)251, (short)251, (short)251, (short)251, (short)252, (short)252, (short)252, (short)252, (short)0, (short)259, (short)258, (short)248, (short)250, (short)263, (short)0, (short)250, (short)250, (short)252, (short)250, (short)253, (short)0, (short)253, (short)253, (short)253, (short)258, (short)254, (short)254, (short)254, (short)254, (short)268, (short)0, (short)260, (short)0, (short)261, (short)252, (short)262, (short)253, (short)264, (short)265, (short)253, (short)253, (short)266, (short)253, (short)254, (short)254, (short)260, (short)254, (short)261, (short)267, (short)262, (short)269, (short)264, (short)265, (short)270, (short)254, (short)266, (short)271, (short)258, (short)273, (short)0, (short)272, (short)274, (short)267, (short)0, (short)269, (short)276, (short)275, (short)270, (short)0, (short)0, (short)271, (short)277, (short)273, (short)260, (short)272, (short)274, (short)0, (short)261, (short)265, (short)276, (short)275, (short)264, (short)278, (short)262, (short)0, (short)277, (short)267, (short)279, (short)281, (short)282, (short)266, (short)0, (short)0, (short)283, (short)284, (short)285, (short)278, (short)269, (short)271, (short)272, (short)286, (short)279, (short)281, (short)282, (short)269, (short)276, (short)270, (short)283, (short)284, (short)285, (short)273, (short)287, (short)274, (short)275, (short)286, (short)277, (short)288, (short)290, (short)289, (short)291, (short)278, (short)292, (short)293, (short)0, (short)294, (short)287, (short)296, (short)295, (short)297, (short)298, (short)288, (short)290, (short)289, (short)291, (short)281, (short)292, (short)293, (short)279, (short)294, (short)299, (short)296, (short)295, (short)297, (short)298, (short)286, (short)300, (short)301, (short)284, (short)287, (short)285, (short)302, (short)303, (short)304, (short)299, (short)290, (short)305, (short)288, (short)289, (short)307, (short)300, (short)301, (short)0, (short)0, (short)308, (short)302, (short)303, (short)304, (short)306, (short)0, (short)305, (short)292, (short)309, (short)307, (short)296, (short)291, (short)295, (short)293, (short)308, (short)0, (short)306, (short)310, (short)306, (short)294, (short)311, (short)313, (short)309, (short)0, (short)312, (short)0, (short)0, (short)0, (short)299, (short)304, (short)314, (short)310, (short)315, (short)316, (short)311, (short)313, (short)317, (short)301, (short)312, (short)300, (short)303, (short)305, (short)0, (short)318, (short)314, (short)320, (short)315, (short)316, (short)322, (short)307, (short)317, (short)0, (short)319, (short)323, (short)321, (short)324, (short)311, (short)318, (short)325, (short)320, (short)328, (short)309, (short)322, (short)326, (short)312, (short)313, (short)319, (short)323, (short)321, (short)324, (short)0, (short)0, (short)325, (short)327, (short)328, (short)0, (short)329, (short)326, (short)0, (short)0, (short)330, (short)0, (short)331, (short)314, (short)322, (short)316, (short)332, (short)327, (short)317, (short)315, (short)329, (short)0, (short)319, (short)324, (short)330, (short)320, (short)331, (short)318, (short)321, (short)328, (short)332, (short)326, (short)333, (short)334, (short)335, (short)325, (short)336, (short)339, (short)341, (short)340, (short)323, (short)327, (short)337, (short)337, (short)337, (short)337, (short)333, (short)334, (short)335, (short)342, (short)336, (short)339, (short)341, (short)340, (short)331, (short)338, (short)338, (short)338, (short)338, (short)330, (short)343, (short)344, (short)0, (short)342, (short)345, (short)346, (short)347, (short)348, (short)338, (short)349, (short)0, (short)332, (short)0, (short)0, (short)343, (short)344, (short)336, (short)335, (short)345, (short)346, (short)347, (short)348, (short)341, (short)349, (short)350, (short)338, (short)340, (short)334, (short)351, (short)0, (short)352, (short)342, (short)353, (short)354, (short)355, (short)343, (short)356, (short)0, (short)350, (short)0, (short)0, (short)351, (short)351, (short)346, (short)352, (short)0, (short)353, (short)354, (short)355, (short)349, (short)356, (short)345, (short)357, (short)344, (short)348, (short)358, (short)359, (short)0, (short)360, (short)347, (short)0, (short)361, (short)0, (short)362, (short)363, (short)364, (short)357, (short)0, (short)350, (short)358, (short)359, (short)354, (short)360, (short)365, (short)355, (short)361, (short)356, (short)362, (short)363, (short)364, (short)0, (short)353, (short)366, (short)367, (short)352, (short)0, (short)368, (short)365, (short)357, (short)369, (short)0, (short)0, (short)370, (short)371, (short)360, (short)372, (short)366, (short)367, (short)361, (short)363, (short)368, (short)373, (short)374, (short)369, (short)358, (short)359, (short)370, (short)371, (short)0, (short)372, (short)375, (short)376, (short)0, (short)377, (short)378, (short)373, (short)374, (short)379, (short)366, (short)0, (short)380, (short)0, (short)365, (short)381, (short)375, (short)376, (short)368, (short)377, (short)378, (short)382, (short)367, (short)379, (short)383, (short)371, (short)380, (short)372, (short)369, (short)381, (short)0, (short)370, (short)384, (short)385, (short)386, (short)382, (short)387, (short)388, (short)383, (short)0, (short)0, (short)377, (short)375, (short)391, (short)373, (short)374, (short)384, (short)385, (short)386, (short)0, (short)387, (short)388, (short)376, (short)380, (short)389, (short)381, (short)390, (short)391, (short)392, (short)393, (short)0, (short)394, (short)396, (short)379, (short)389, (short)395, (short)398, (short)0, (short)389, (short)0, (short)390, (short)397, (short)392, (short)393, (short)387, (short)394, (short)396, (short)0, (short)0, (short)395, (short)398, (short)399, (short)400, (short)384, (short)0, (short)397, (short)386, (short)385, (short)0, (short)0, (short)401, (short)388, (short)391, (short)0, (short)402, (short)399, (short)400, (short)403, (short)393, (short)404, (short)390, (short)406, (short)394, (short)395, (short)401, (short)405, (short)0, (short)397, (short)402, (short)396, (short)407, (short)403, (short)408, (short)404, (short)409, (short)406, (short)410, (short)399, (short)411, (short)405, (short)398, (short)412, (short)413, (short)0, (short)407, (short)400, (short)408, (short)0, (short)409, (short)402, (short)410, (short)0, (short)411, (short)414, (short)402, (short)412, (short)413, (short)401, (short)415, (short)416, (short)0, (short)405, (short)0, (short)417, (short)0, (short)406, (short)407, (short)414, (short)404, (short)418, (short)419, (short)0, (short)415, (short)416, (short)409, (short)421, (short)412, (short)417, (short)420, (short)423, (short)422, (short)424, (short)425, (short)418, (short)419, (short)410, (short)413, (short)411, (short)426, (short)421, (short)420, (short)0, (short)420, (short)423, (short)422, (short)424, (short)425, (short)427, (short)428, (short)0, (short)429, (short)0, (short)426, (short)0, (short)0, (short)415, (short)0, (short)414, (short)430, (short)432, (short)431, (short)427, (short)428, (short)416, (short)429, (short)423, (short)417, (short)424, (short)418, (short)419, (short)422, (short)433, (short)430, (short)432, (short)431, (short)435, (short)434, (short)421, (short)0, (short)436, (short)437, (short)438, (short)425, (short)0, (short)439, (short)433, (short)0, (short)0, (short)428, (short)435, (short)434, (short)440, (short)426, (short)436, (short)437, (short)438, (short)441, (short)429, (short)439, (short)431, (short)427, (short)431, (short)442, (short)430, (short)443, (short)440, (short)444, (short)445, (short)446, (short)431, (short)441, (short)431, (short)447, (short)448, (short)432, (short)434, (short)442, (short)449, (short)443, (short)436, (short)444, (short)445, (short)446, (short)450, (short)433, (short)451, (short)447, (short)448, (short)452, (short)453, (short)455, (short)449, (short)0, (short)435, (short)437, (short)0, (short)454, (short)450, (short)456, (short)451, (short)457, (short)440, (short)452, (short)453, (short)455, (short)458, (short)441, (short)459, (short)460, (short)448, (short)454, (short)461, (short)456, (short)462, (short)457, (short)463, (short)464, (short)449, (short)465, (short)458, (short)444, (short)459, (short)460, (short)0, (short)466, (short)461, (short)468, (short)462, (short)452, (short)463, (short)464, (short)467, (short)465, (short)469, (short)454, (short)470, (short)471, (short)450, (short)466, (short)472, (short)468, (short)473, (short)474, (short)476, (short)475, (short)467, (short)477, (short)469, (short)0, (short)470, (short)471, (short)0, (short)464, (short)472, (short)459, (short)473, (short)474, (short)476, (short)475, (short)0, (short)477, (short)0, (short)460, (short)478, (short)479, (short)466, (short)462, (short)0, (short)465, (short)480, (short)481, (short)467, (short)470, (short)468, (short)482, (short)472, (short)483, (short)478, (short)479, (short)484, (short)469, (short)475, (short)485, (short)480, (short)481, (short)486, (short)487, (short)476, (short)482, (short)488, (short)483, (short)473, (short)489, (short)484, (short)471, (short)490, (short)485, (short)491, (short)492, (short)486, (short)487, (short)0, (short)494, (short)488, (short)0, (short)493, (short)489, (short)495, (short)0, (short)490, (short)481, (short)491, (short)492, (short)0, (short)496, (short)479, (short)494, (short)499, (short)484, (short)493, (short)483, (short)495, (short)480, (short)497, (short)486, (short)498, (short)500, (short)487, (short)496, (short)485, (short)0, (short)499, (short)0, (short)488, (short)501, (short)502, (short)489, (short)497, (short)492, (short)498, (short)500, (short)493, (short)503, (short)0, (short)491, (short)493, (short)494, (short)504, (short)501, (short)502, (short)505, (short)0, (short)0, (short)506, (short)507, (short)508, (short)503, (short)495, (short)509, (short)510, (short)511, (short)504, (short)512, (short)497, (short)505, (short)498, (short)496, (short)506, (short)507, (short)508, (short)513, (short)514, (short)509, (short)510, (short)511, (short)515, (short)512, (short)0, (short)516, (short)517, (short)0, (short)518, (short)519, (short)520, (short)513, (short)514, (short)0, (short)521, (short)505, (short)515, (short)522, (short)506, (short)516, (short)517, (short)503, (short)518, (short)519, (short)520, (short)0, (short)504, (short)512, (short)521, (short)523, (short)524, (short)522, (short)525, (short)526, (short)527, (short)0, (short)0, (short)509, (short)529, (short)515, (short)510, (short)508, (short)528, (short)523, (short)524, (short)517, (short)525, (short)526, (short)527, (short)519, (short)513, (short)514, (short)529, (short)530, (short)531, (short)0, (short)528, (short)520, (short)532, (short)0, (short)533, (short)534, (short)0, (short)0, (short)0, (short)535, (short)536, (short)530, (short)531, (short)522, (short)523, (short)0, (short)532, (short)526, (short)533, (short)534, (short)529, (short)528, (short)527, (short)535, (short)536, (short)525, (short)537, (short)538, (short)540, (short)524, (short)539, (short)0, (short)530, (short)541, (short)542, (short)543, (short)545, (short)544, (short)0, (short)546, (short)537, (short)538, (short)540, (short)549, (short)539, (short)531, (short)547, (short)541, (short)542, (short)543, (short)545, (short)544, (short)534, (short)546, (short)0, (short)548, (short)550, (short)549, (short)0, (short)535, (short)547, (short)551, (short)552, (short)553, (short)537, (short)554, (short)555, (short)0, (short)541, (short)548, (short)550, (short)539, (short)544, (short)556, (short)557, (short)551, (short)552, (short)553, (short)549, (short)554, (short)555, (short)538, (short)558, (short)539, (short)542, (short)559, (short)540, (short)556, (short)557, (short)547, (short)545, (short)0, (short)560, (short)546, (short)561, (short)548, (short)558, (short)0, (short)562, (short)559, (short)563, (short)564, (short)565, (short)566, (short)0, (short)552, (short)560, (short)567, (short)561, (short)569, (short)568, (short)555, (short)562, (short)0, (short)563, (short)564, (short)565, (short)566, (short)554, (short)0, (short)570, (short)567, (short)558, (short)569, (short)568, (short)571, (short)572, (short)560, (short)0, (short)573, (short)0, (short)0, (short)574, (short)562, (short)570, (short)0, (short)0, (short)565, (short)563, (short)571, (short)572, (short)575, (short)567, (short)573, (short)559, (short)568, (short)574, (short)576, (short)561, (short)569, (short)577, (short)564, (short)578, (short)579, (short)580, (short)575, (short)581, (short)566, (short)582, (short)583, (short)584, (short)576, (short)572, (short)585, (short)577, (short)573, (short)578, (short)579, (short)580, (short)570, (short)581, (short)586, (short)582, (short)583, (short)584, (short)587, (short)574, (short)585, (short)588, (short)571, (short)589, (short)575, (short)0, (short)0, (short)590, (short)586, (short)591, (short)576, (short)0, (short)587, (short)0, (short)592, (short)588, (short)592, (short)589, (short)593, (short)581, (short)583, (short)590, (short)594, (short)591, (short)577, (short)578, (short)595, (short)584, (short)592, (short)596, (short)600, (short)597, (short)593, (short)0, (short)586, (short)598, (short)594, (short)599, (short)589, (short)601, (short)595, (short)602, (short)603, (short)596, (short)600, (short)597, (short)604, (short)590, (short)605, (short)598, (short)606, (short)599, (short)0, (short)601, (short)607, (short)602, (short)603, (short)608, (short)0, (short)609, (short)604, (short)595, (short)605, (short)610, (short)606, (short)591, (short)597, (short)593, (short)607, (short)611, (short)598, (short)608, (short)599, (short)609, (short)612, (short)613, (short)0, (short)610, (short)614, (short)618, (short)616, (short)0, (short)0, (short)611, (short)603, (short)604, (short)617, (short)619, (short)612, (short)613, (short)606, (short)0, (short)614, (short)618, (short)616, (short)609, (short)602, (short)620, (short)0, (short)621, (short)617, (short)619, (short)622, (short)623, (short)624, (short)607, (short)605, (short)611, (short)0, (short)608, (short)613, (short)620, (short)610, (short)621, (short)614, (short)616, (short)622, (short)623, (short)624, (short)625, (short)626, (short)617, (short)619, (short)627, (short)628, (short)629, (short)630, (short)631, (short)632, (short)635, (short)636, (short)637, (short)0, (short)625, (short)626, (short)638, (short)640, (short)627, (short)628, (short)629, (short)630, (short)631, (short)632, (short)635, (short)636, (short)637, (short)621, (short)639, (short)0, (short)638, (short)640, (short)622, (short)0, (short)0, (short)641, (short)624, (short)642, (short)0, (short)0, (short)643, (short)626, (short)639, (short)631, (short)632, (short)635, (short)645, (short)631, (short)629, (short)641, (short)644, (short)642, (short)625, (short)640, (short)643, (short)646, (short)0, (short)627, (short)647, (short)628, (short)645, (short)630, (short)648, (short)649, (short)644, (short)650, (short)651, (short)652, (short)639, (short)646, (short)638, (short)653, (short)647, (short)654, (short)655, (short)0, (short)648, (short)649, (short)657, (short)650, (short)651, (short)652, (short)656, (short)658, (short)659, (short)653, (short)642, (short)654, (short)655, (short)641, (short)644, (short)660, (short)657, (short)661, (short)662, (short)663, (short)656, (short)658, (short)659, (short)649, (short)664, (short)651, (short)648, (short)665, (short)666, (short)660, (short)0, (short)661, (short)662, (short)663, (short)649, (short)667, (short)669, (short)668, (short)664, (short)0, (short)670, (short)665, (short)666, (short)652, (short)653, (short)0, (short)671, (short)672, (short)656, (short)667, (short)669, (short)668, (short)659, (short)657, (short)670, (short)673, (short)654, (short)0, (short)674, (short)658, (short)671, (short)672, (short)675, (short)676, (short)677, (short)0, (short)660, (short)678, (short)679, (short)673, (short)666, (short)662, (short)674, (short)681, (short)664, (short)0, (short)675, (short)676, (short)677, (short)665, (short)669, (short)678, (short)679, (short)680, (short)682, (short)683, (short)671, (short)681, (short)667, (short)668, (short)684, (short)685, (short)670, (short)687, (short)0, (short)0, (short)686, (short)680, (short)682, (short)683, (short)688, (short)689, (short)677, (short)690, (short)684, (short)685, (short)0, (short)687, (short)674, (short)673, (short)686, (short)0, (short)675, (short)692, (short)688, (short)689, (short)691, (short)690, (short)0, (short)679, (short)682, (short)693, (short)676, (short)694, (short)0, (short)683, (short)0, (short)692, (short)0, (short)0, (short)691, (short)0, (short)680, (short)687, (short)0, (short)693, (short)0, (short)694, (short)0, (short)0, (short)689, (short)0, (short)0, (short)0, (short)0, (short)685, (short)0, (short)0, (short)686, (short)0, (short)0, (short)691, (short)0, (short)0, (short)688, (short)0, (short)693, (short)0, (short)0, (short)0, (short)0, (short)0, (short)690, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)697, (short)697, (short)0, (short)697, (short)697, (short)697, (short)697, (short)698, (short)0, (short)0, (short)698, (short)698, (short)698, (short)699, (short)699, (short)700, (short)700, (short)701, (short)701, (short)701, (short)702, (short)702, (short)703, (short)703, (short)703, (short)703, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695
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
if(yy_current_state >= 696)
yy_c = yy_meta[(unsigned int)yy_c];
}
yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int)yy_c];
++yy_cp;
}while(yy_base[yy_current_state] != (short)2384);
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
return (RESTRICT);
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
case 174LL:
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
(void)fwrite(yytext, yyleng, 1, yyout);
break;
case 173:
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
yy_act = (173 + ((yy_start - 1) / 2) + 1);
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
if(yy_current_state >= 696)
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
if(yy_current_state >= 696)
yy_c = yy_meta[(unsigned int)yy_c];
}
yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int)yy_c];
yy_is_jam = (yy_current_state == 695);
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

extern unsigned int inCompiler;

extern int FindIncludeFileID(char *  includeFile);

extern struct __ecereNameSpace__ecere__com__Instance * OpenIncludeFile(char *  includeFile);

extern int printf(char * , ...);

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
memcpy(((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->include_stack, include_stack, sizeof include_stack);
memcpy(((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->fileStack, fileStack, sizeof fileStack);
memcpy(((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->sourceFileStack, sourceFileStack, sizeof sourceFileStack);
memcpy(((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->locStack, locStack, sizeof locStack);
memcpy(((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->declModeStack, declModeStack, sizeof declModeStack);
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
memcpy(include_stack, ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->include_stack, sizeof include_stack);
memcpy(fileStack, ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->fileStack, sizeof fileStack);
memcpy(sourceFileStack, ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->sourceFileStack, sizeof sourceFileStack);
memcpy(locStack, ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->locStack, sizeof locStack);
memcpy(declModeStack, ((struct LexerBackup *)(((char *)backup + __ecereClass_LexerBackup->offset)))->declModeStack, sizeof declModeStack);
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

