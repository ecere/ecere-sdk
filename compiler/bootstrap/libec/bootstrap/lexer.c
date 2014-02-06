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

static const short int yy_accept[691] = 
{
(short)0, (short)111, (short)111, (short)172, (short)170, (short)169, (short)168, (short)167, (short)154, (short)170, (short)1, (short)166, (short)160, (short)153, (short)170, (short)148, (short)149, (short)158, (short)157, (short)145, (short)156, (short)152, (short)159, (short)114, (short)114, (short)146, (short)142, (short)161, (short)147, (short)162, (short)165, (short)111, (short)111, (short)111, (short)150, (short)151, (short)163, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)143, (short)164, (short)144, (short)155, (short)141, (short)0, (short)119, (short)0, (short)127, (short)144, (short)136, (short)128, (short)0, (short)0, (short)125, (short)133, (short)123, (short)134, (short)124, (short)135, (short)0, (short)117, (short)2, (short)3, (short)126, (short)118, (short)113, (short)0, (short)114, (short)0, (short)114, (short)111, (short)151, (short)143, (short)150, (short)132, (short)138, (short)140, (short)139, (short)131, (short)0, (short)111, (short)0, (short)111, (short)0, (short)0, (short)129, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)11, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)19, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)130, (short)137, (short)115, (short)120, (short)0, (short)117, (short)117, (short)0, (short)118, (short)113, (short)0, (short)116, (short)112, (short)111, (short)122, (short)121, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)91, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)17, (short)44, (short)111, (short)111, (short)111, (short)111, (short)20, (short)111, (short)111, (short)111, (short)50, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)43, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)0, (short)117, (short)0, (short)117, (short)0, (short)118, (short)116, (short)112, (short)111, (short)111, (short)60, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)4, (short)111, (short)6, (short)7, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)13, (short)14, (short)111, (short)111, (short)111, (short)18, (short)111, (short)111, (short)111, (short)111, (short)111, (short)22, (short)111, (short)51, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)21, (short)111, (short)111, (short)111, (short)37, (short)111, (short)111, (short)111, (short)0, (short)117, (short)61, (short)111, (short)111, (short)111, (short)92, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)5, (short)46, (short)8, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)16, (short)111, (short)111, (short)111, (short)57, (short)45, (short)111, (short)111, (short)111, (short)111, (short)111, (short)52, (short)111, (short)111, (short)25, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)35, (short)111, (short)111, (short)111, (short)94, (short)41, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)55, (short)49, (short)111, (short)111, (short)12, (short)15, (short)111, (short)54, (short)87, (short)71, (short)111, (short)111, (short)111, (short)83, (short)111, (short)53, (short)111, (short)24, (short)26, (short)29, (short)31, (short)111, (short)111, (short)32, (short)111, (short)33, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)90, (short)111, (short)111, (short)75, (short)81, (short)111, (short)111, (short)111, (short)56, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)69, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)108, (short)109, (short)107, (short)10, (short)111, (short)111, (short)111, (short)111, (short)84, (short)111, (short)111, (short)111, (short)79, (short)111, (short)111, (short)111, (short)111, (short)34, (short)111, (short)48, (short)111, (short)111, (short)62, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)70, (short)111, (short)27, (short)111, (short)93, (short)111, (short)111, (short)78, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)9, (short)111, (short)111, (short)111, (short)111, (short)111, (short)42, (short)23, (short)64, (short)111, (short)105, (short)111, (short)111, (short)36, (short)38, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)76, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)73, (short)74, (short)111, (short)106, (short)111, (short)111, (short)47, (short)111, (short)97, (short)63, (short)111, (short)111, (short)111, (short)111, (short)111, (short)68, (short)80, (short)28, (short)111, (short)40, (short)111, (short)86, (short)103, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)30, (short)67, (short)111, (short)0, (short)111, (short)111, (short)77, (short)111, (short)89, (short)111, (short)111, (short)100, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)72, (short)0, (short)111, (short)82, (short)39, (short)111, (short)111, (short)111, (short)111, (short)111, (short)96, (short)111, (short)95, (short)85, (short)66, (short)111, (short)111, (short)88, (short)111, (short)111, (short)111, (short)111, (short)110, (short)111, (short)111, (short)111, (short)111, (short)111, (short)98, (short)111, (short)104, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)59, (short)111, (short)111, (short)111, (short)111, (short)111, (short)58, (short)111, (short)111, (short)102, (short)111, (short)111, (short)99, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)111, (short)101, (short)111, (short)65, (short)0
};

static const int yy_ec[256] = 
{
0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 21, 21, 22, 21, 23, 21, 21, 21, 24, 25, 26, 27, 28, 29, 1, 30, 31, 32, 30, 33, 34, 35, 35, 36, 37, 35, 38, 35, 35, 35, 35, 35, 35, 35, 35, 39, 35, 35, 40, 35, 35, 41, 42, 43, 44, 45, 1, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 35, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
};

static const int yy_meta[75] = 
{
0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 1, 4, 1, 1, 1, 1, 1, 1, 5, 5, 5, 5, 2, 1, 1, 1, 1, 1, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 1, 1, 1, 1, 7, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 1, 1, 1, 1
};

static const short int yy_base[699] = 
{
(short)0, (short)0, (short)0, (short)255, (short)2365, (short)2365, (short)2365, (short)2365, (short)206, (short)69, (short)2365, (short)2365, (short)49, (short)68, (short)186, (short)2365, (short)2365, (short)200, (short)64, (short)2365, (short)65, (short)63, (short)75, (short)94, (short)78, (short)79, (short)2365, (short)95, (short)171, (short)60, (short)2365, (short)86, (short)96, (short)118, (short)2365, (short)2365, (short)164, (short)129, (short)113, (short)126, (short)144, (short)153, (short)116, (short)157, (short)145, (short)161, (short)133, (short)156, (short)172, (short)197, (short)198, (short)205, (short)216, (short)199, (short)208, (short)2365, (short)53, (short)2365, (short)2365, (short)2365, (short)99, (short)2365, (short)184, (short)2365, (short)2365, (short)2365, (short)2365, (short)147, (short)183, (short)2365, (short)2365, (short)2365, (short)2365, (short)2365, (short)2365, (short)152, (short)256, (short)2365, (short)2365, (short)2365, (short)294, (short)334, (short)221, (short)230, (short)0, (short)0, (short)0, (short)2365, (short)2365, (short)2365, (short)137, (short)2365, (short)2365, (short)2365, (short)120, (short)111, (short)128, (short)89, (short)221, (short)103, (short)66, (short)2365, (short)236, (short)240, (short)215, (short)390, (short)273, (short)262, (short)278, (short)281, (short)288, (short)294, (short)206, (short)298, (short)225, (short)313, (short)309, (short)310, (short)315, (short)352, (short)353, (short)316, (short)319, (short)354, (short)370, (short)373, (short)382, (short)383, (short)377, (short)394, (short)314, (short)388, (short)398, (short)401, (short)392, (short)403, (short)405, (short)423, (short)433, (short)407, (short)450, (short)455, (short)457, (short)458, (short)463, (short)465, (short)468, (short)474, (short)466, (short)475, (short)478, (short)476, (short)481, (short)487, (short)2365, (short)2365, (short)2365, (short)2365, (short)527, (short)517, (short)555, (short)541, (short)545, (short)577, (short)473, (short)623, (short)582, (short)0, (short)2365, (short)2365, (short)0, (short)502, (short)507, (short)522, (short)577, (short)601, (short)533, (short)580, (short)598, (short)560, (short)593, (short)617, (short)625, (short)614, (short)513, (short)644, (short)645, (short)646, (short)652, (short)542, (short)661, (short)663, (short)662, (short)672, (short)674, (short)680, (short)681, (short)682, (short)683, (short)689, (short)693, (short)690, (short)691, (short)701, (short)700, (short)706, (short)708, (short)709, (short)728, (short)736, (short)739, (short)741, (short)743, (short)744, (short)745, (short)747, (short)752, (short)756, (short)762, (short)763, (short)751, (short)767, (short)768, (short)769, (short)771, (short)772, (short)774, (short)780, (short)787, (short)795, (short)790, (short)800, (short)803, (short)805, (short)806, (short)808, (short)810, (short)821, (short)823, (short)828, (short)831, (short)833, (short)834, (short)836, (short)843, (short)838, (short)851, (short)856, (short)860, (short)879, (short)869, (short)891, (short)895, (short)893, (short)897, (short)0, (short)880, (short)885, (short)915, (short)922, (short)932, (short)931, (short)933, (short)939, (short)943, (short)949, (short)950, (short)954, (short)951, (short)955, (short)958, (short)956, (short)971, (short)966, (short)976, (short)982, (short)977, (short)986, (short)983, (short)994, (short)1001, (short)1004, (short)1006, (short)1012, (short)1013, (short)1014, (short)1016, (short)1029, (short)1025, (short)1031, (short)1032, (short)1034, (short)1035, (short)1036, (short)1037, (short)1041, (short)1038, (short)1040, (short)1056, (short)1057, (short)1059, (short)1060, (short)1063, (short)1061, (short)1062, (short)1066, (short)1072, (short)1079, (short)1081, (short)1082, (short)1084, (short)1090, (short)1091, (short)1092, (short)1102, (short)1103, (short)1109, (short)1110, (short)1107, (short)1118, (short)1119, (short)1122, (short)1125, (short)1127, (short)1128, (short)1129, (short)1138, (short)1140, (short)1137, (short)1146, (short)1148, (short)1156, (short)1157, (short)1166, (short)1169, (short)1173, (short)1181, (short)1186, (short)1172, (short)1174, (short)1189, (short)1200, (short)1201, (short)1202, (short)1204, (short)1205, (short)1208, (short)1210, (short)1223, (short)1225, (short)1217, (short)1227, (short)1234, (short)1232, (short)1235, (short)1238, (short)1244, (short)1245, (short)1250, (short)1253, (short)1262, (short)1265, (short)1266, (short)1268, (short)1271, (short)1273, (short)1278, (short)1277, (short)1284, (short)1288, (short)1289, (short)1295, (short)1296, (short)1297, (short)1299, (short)1305, (short)1301, (short)1308, (short)1312, (short)1316, (short)1321, (short)1325, (short)1336, (short)1338, (short)1343, (short)1340, (short)1344, (short)1345, (short)1349, (short)1351, (short)1360, (short)1366, (short)1361, (short)1368, (short)1367, (short)1371, (short)1369, (short)1372, (short)1370, (short)1377, (short)1376, (short)1389, (short)1396, (short)1401, (short)1404, (short)1417, (short)1412, (short)1419, (short)1420, (short)1421, (short)1422, (short)1427, (short)1425, (short)1428, (short)1429, (short)1432, (short)1438, (short)1440, (short)1444, (short)1447, (short)1450, (short)1460, (short)1451, (short)1449, (short)1462, (short)1466, (short)1467, (short)1468, (short)1477, (short)1472, (short)1478, (short)1484, (short)1488, (short)1493, (short)1494, (short)1495, (short)1497, (short)1505, (short)1510, (short)1520, (short)1521, (short)1522, (short)1525, (short)1529, (short)1530, (short)1537, (short)1538, (short)1540, (short)1542, (short)1545, (short)1547, (short)1549, (short)1550, (short)1553, (short)1557, (short)1558, (short)1565, (short)1566, (short)1568, (short)1569, (short)1570, (short)1574, (short)1575, (short)1577, (short)1581, (short)1586, (short)1590, (short)1592, (short)1593, (short)1599, (short)1597, (short)1601, (short)1602, (short)1605, (short)1603, (short)1609, (short)1614, (short)1624, (short)1626, (short)1627, (short)1630, (short)1631, (short)1632, (short)1634, (short)1636, (short)1642, (short)1643, (short)1653, (short)1654, (short)1655, (short)1658, (short)1659, (short)1662, (short)1664, (short)1671, (short)1682, (short)1683, (short)1684, (short)1687, (short)1689, (short)1692, (short)1693, (short)1699, (short)1705, (short)1708, (short)1710, (short)1712, (short)1715, (short)1716, (short)1718, (short)1720, (short)1721, (short)1725, (short)1733, (short)1728, (short)1736, (short)1738, (short)1743, (short)1745, (short)1746, (short)1749, (short)1751, (short)1755, (short)1761, (short)1756, (short)1764, (short)1768, (short)1774, (short)1779, (short)1780, (short)1784, (short)1792, (short)1799, (short)1796, (short)1801, (short)1808, (short)1809, (short)1811, (short)1812, (short)1814, (short)1816, (short)1817, (short)1819, (short)1818, (short)1824, (short)1829, (short)1839, (short)1841, (short)1846, (short)1851, (short)1863, (short)1864, (short)1867, (short)1869, (short)1868, (short)1872, (short)1874, (short)1875, (short)1873, (short)1876, (short)1879, (short)1880, (short)1885, (short)1898, (short)1891, (short)1892, (short)1901, (short)1902, (short)1903, (short)1918, (short)1921, (short)1923, (short)1922, (short)1929, (short)1930, (short)1940, (short)1942, (short)1945, (short)1946, (short)1950, (short)1951, (short)1952, (short)1953, (short)1957, (short)1958, (short)1969, (short)1974, (short)1975, (short)1976, (short)1981, (short)1985, (short)1986, (short)1987, (short)1991, (short)1996, (short)1997, (short)1998, (short)2002, (short)2003, (short)2004, (short)2007, (short)2013, (short)2015, (short)2019, (short)2014, (short)2023, (short)2024, (short)2032, (short)2034, (short)2040, (short)84, (short)2035, (short)2042, (short)2041, (short)2044, (short)2047, (short)2059, (short)2060, (short)2064, (short)2067, (short)2068, (short)2075, (short)2080, (short)2083, (short)2084, (short)2085, (short)2086, (short)2087, (short)2365, (short)77, (short)2088, (short)2090, (short)2091, (short)2093, (short)2096, (short)2113, (short)2103, (short)2114, (short)2116, (short)2124, (short)2129, (short)2131, (short)2132, (short)2134, (short)2140, (short)2141, (short)2142, (short)2144, (short)2151, (short)2152, (short)2153, (short)2159, (short)2161, (short)2168, (short)2169, (short)2170, (short)2171, (short)2172, (short)2178, (short)2179, (short)2180, (short)2181, (short)2188, (short)2190, (short)2189, (short)2191, (short)2208, (short)2210, (short)2214, (short)2216, (short)2217, (short)2226, (short)2235, (short)2236, (short)2237, (short)2238, (short)2239, (short)2244, (short)2246, (short)2245, (short)2247, (short)2255, (short)2256, (short)2257, (short)2263, (short)2262, (short)2264, (short)2265, (short)2275, (short)2281, (short)2365, (short)2331, (short)2338, (short)2344, (short)2347, (short)2348, (short)2351, (short)2353, (short)2357
};

static const short int yy_def[699] = 
{
(short)0, (short)690, (short)1, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)691, (short)690, (short)690, (short)690, (short)690, (short)692, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)23, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)693, (short)693, (short)693, (short)690, (short)690, (short)690, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)690, (short)690, (short)690, (short)690, (short)690, (short)691, (short)690, (short)691, (short)690, (short)690, (short)690, (short)690, (short)692, (short)692, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)694, (short)24, (short)695, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)693, (short)690, (short)693, (short)691, (short)692, (short)690, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)694, (short)696, (short)690, (short)690, (short)697, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)690, (short)76, (short)690, (short)690, (short)690, (short)80, (short)690, (short)690, (short)696, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)690, (short)160, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)698, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)690, (short)698, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)0, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690
};

static const short int yy_nxt[2440] = 
{
(short)0, (short)4, (short)5, (short)6, (short)7, (short)8, (short)9, (short)10, (short)11, (short)12, (short)13, (short)14, (short)15, (short)16, (short)17, (short)18, (short)19, (short)20, (short)21, (short)22, (short)23, (short)24, (short)24, (short)24, (short)25, (short)26, (short)27, (short)28, (short)29, (short)30, (short)31, (short)32, (short)31, (short)31, (short)31, (short)31, (short)31, (short)31, (short)33, (short)31, (short)31, (short)34, (short)4, (short)35, (short)36, (short)37, (short)38, (short)39, (short)40, (short)41, (short)42, (short)43, (short)44, (short)31, (short)45, (short)31, (short)31, (short)46, (short)31, (short)47, (short)31, (short)48, (short)49, (short)50, (short)51, (short)52, (short)53, (short)54, (short)31, (short)31, (short)31, (short)55, (short)56, (short)57, (short)58, (short)61, (short)63, (short)64, (short)65, (short)70, (short)154, (short)75, (short)72, (short)76, (short)76, (short)76, (short)76, (short)93, (short)94, (short)77, (short)628, (short)71, (short)73, (short)74, (short)78, (short)66, (short)95, (short)628, (short)85, (short)85, (short)85, (short)85, (short)79, (short)86, (short)88, (short)61, (short)95, (short)87, (short)68, (short)61, (short)97, (short)62, (short)80, (short)170, (short)81, (short)81, (short)81, (short)81, (short)690, (short)89, (short)97, (short)90, (short)91, (short)95, (short)99, (short)155, (short)95, (short)82, (short)95, (short)100, (short)83, (short)83, (short)83, (short)83, (short)84, (short)97, (short)95, (short)97, (short)95, (short)95, (short)97, (short)62, (short)97, (short)95, (short)82, (short)62, (short)690, (short)169, (short)83, (short)83, (short)97, (short)83, (short)97, (short)97, (short)95, (short)95, (short)98, (short)97, (short)156, (short)83, (short)102, (short)103, (short)84, (short)95, (short)168, (short)104, (short)95, (short)95, (short)97, (short)97, (short)157, (short)95, (short)109, (short)122, (short)105, (short)123, (short)110, (short)97, (short)111, (short)106, (short)97, (short)97, (short)95, (short)107, (short)124, (short)97, (short)690, (short)690, (short)112, (short)68, (short)113, (short)101, (short)108, (short)134, (short)67, (short)128, (short)97, (short)114, (short)92, (short)117, (short)118, (short)115, (short)135, (short)119, (short)116, (short)129, (short)136, (short)95, (short)95, (short)95, (short)120, (short)125, (short)130, (short)121, (short)126, (short)95, (short)95, (short)127, (short)95, (short)131, (short)132, (short)97, (short)97, (short)97, (short)133, (short)95, (short)95, (short)69, (short)68, (short)97, (short)97, (short)95, (short)97, (short)59, (short)137, (short)95, (short)164, (short)138, (short)164, (short)97, (short)97, (short)165, (short)165, (short)165, (short)165, (short)97, (short)95, (short)139, (short)140, (short)97, (short)95, (short)141, (short)142, (short)150, (short)152, (short)690, (short)191, (short)690, (short)146, (short)151, (short)97, (short)153, (short)143, (short)144, (short)97, (short)145, (short)83, (short)83, (short)83, (short)83, (short)148, (short)193, (short)95, (short)174, (short)147, (short)149, (short)76, (short)76, (short)76, (short)76, (short)690, (short)171, (short)690, (short)95, (short)83, (short)83, (short)97, (short)83, (short)95, (short)158, (short)159, (short)95, (short)159, (short)159, (short)159, (short)83, (short)172, (short)97, (short)95, (short)690, (short)173, (short)690, (short)97, (short)690, (short)95, (short)97, (short)158, (short)159, (short)95, (short)690, (short)159, (short)159, (short)97, (short)159, (short)160, (short)160, (short)160, (short)160, (short)97, (short)95, (short)95, (short)186, (short)97, (short)95, (short)95, (short)95, (short)95, (short)161, (short)162, (short)95, (short)162, (short)162, (short)162, (short)97, (short)97, (short)690, (short)690, (short)97, (short)97, (short)97, (short)97, (short)185, (short)187, (short)97, (short)161, (short)162, (short)189, (short)690, (short)162, (short)162, (short)188, (short)162, (short)80, (short)690, (short)81, (short)81, (short)81, (short)81, (short)190, (short)194, (short)690, (short)192, (short)95, (short)95, (short)95, (short)690, (short)197, (short)82, (short)195, (short)198, (short)163, (short)163, (short)163, (short)163, (short)196, (short)690, (short)97, (short)97, (short)97, (short)199, (short)95, (short)203, (short)204, (short)95, (short)82, (short)690, (short)690, (short)95, (short)163, (short)163, (short)690, (short)163, (short)95, (short)95, (short)97, (short)690, (short)690, (short)97, (short)95, (short)163, (short)95, (short)97, (short)95, (short)200, (short)95, (short)690, (short)97, (short)97, (short)95, (short)201, (short)202, (short)95, (short)97, (short)95, (short)97, (short)95, (short)97, (short)95, (short)97, (short)205, (short)690, (short)690, (short)97, (short)690, (short)690, (short)97, (short)690, (short)97, (short)690, (short)97, (short)690, (short)97, (short)690, (short)95, (short)206, (short)207, (short)175, (short)176, (short)177, (short)178, (short)179, (short)210, (short)208, (short)95, (short)180, (short)209, (short)213, (short)97, (short)690, (short)212, (short)690, (short)217, (short)181, (short)182, (short)183, (short)214, (short)184, (short)97, (short)211, (short)223, (short)95, (short)218, (short)215, (short)690, (short)216, (short)95, (short)224, (short)95, (short)95, (short)690, (short)225, (short)226, (short)219, (short)95, (short)97, (short)95, (short)95, (short)220, (short)95, (short)97, (short)222, (short)97, (short)97, (short)221, (short)95, (short)95, (short)95, (short)97, (short)95, (short)97, (short)97, (short)95, (short)97, (short)165, (short)165, (short)165, (short)165, (short)95, (short)97, (short)97, (short)97, (short)690, (short)97, (short)690, (short)231, (short)97, (short)690, (short)232, (short)690, (short)229, (short)235, (short)97, (short)95, (short)690, (short)227, (short)228, (short)690, (short)95, (short)233, (short)236, (short)234, (short)690, (short)237, (short)95, (short)690, (short)239, (short)97, (short)230, (short)690, (short)240, (short)243, (short)97, (short)95, (short)244, (short)690, (short)238, (short)690, (short)97, (short)241, (short)690, (short)242, (short)246, (short)247, (short)95, (short)247, (short)245, (short)97, (short)248, (short)248, (short)248, (short)248, (short)159, (short)95, (short)159, (short)159, (short)159, (short)251, (short)97, (short)251, (short)257, (short)690, (short)252, (short)252, (short)252, (short)252, (short)690, (short)97, (short)258, (short)159, (short)690, (short)95, (short)159, (short)159, (short)274, (short)159, (short)160, (short)160, (short)160, (short)160, (short)162, (short)259, (short)162, (short)162, (short)162, (short)97, (short)690, (short)690, (short)95, (short)249, (short)250, (short)95, (short)250, (short)250, (short)250, (short)690, (short)690, (short)162, (short)690, (short)264, (short)162, (short)162, (short)97, (short)162, (short)95, (short)97, (short)249, (short)250, (short)690, (short)95, (short)250, (short)250, (short)95, (short)250, (short)163, (short)163, (short)163, (short)163, (short)97, (short)254, (short)254, (short)254, (short)254, (short)97, (short)260, (short)95, (short)97, (short)690, (short)95, (short)268, (short)265, (short)690, (short)163, (short)163, (short)690, (short)163, (short)95, (short)254, (short)254, (short)97, (short)254, (short)266, (short)97, (short)163, (short)165, (short)165, (short)165, (short)165, (short)254, (short)267, (short)97, (short)690, (short)690, (short)269, (short)690, (short)95, (short)95, (short)95, (short)253, (short)261, (short)253, (short)253, (short)253, (short)95, (short)690, (short)262, (short)263, (short)690, (short)270, (short)97, (short)97, (short)97, (short)95, (short)95, (short)95, (short)253, (short)690, (short)97, (short)253, (short)253, (short)271, (short)253, (short)690, (short)95, (short)273, (short)95, (short)97, (short)97, (short)97, (short)690, (short)272, (short)95, (short)95, (short)95, (short)95, (short)690, (short)277, (short)97, (short)278, (short)97, (short)95, (short)95, (short)95, (short)276, (short)95, (short)97, (short)97, (short)97, (short)97, (short)275, (short)280, (short)95, (short)95, (short)281, (short)97, (short)97, (short)97, (short)95, (short)97, (short)95, (short)95, (short)690, (short)279, (short)690, (short)690, (short)97, (short)97, (short)690, (short)286, (short)690, (short)690, (short)97, (short)690, (short)97, (short)97, (short)282, (short)289, (short)287, (short)283, (short)95, (short)290, (short)292, (short)293, (short)288, (short)284, (short)285, (short)294, (short)95, (short)291, (short)295, (short)95, (short)296, (short)95, (short)97, (short)95, (short)95, (short)95, (short)690, (short)95, (short)298, (short)299, (short)97, (short)95, (short)95, (short)97, (short)297, (short)97, (short)95, (short)97, (short)97, (short)97, (short)305, (short)97, (short)95, (short)95, (short)300, (short)97, (short)97, (short)95, (short)95, (short)95, (short)97, (short)95, (short)95, (short)309, (short)95, (short)690, (short)97, (short)97, (short)690, (short)690, (short)95, (short)97, (short)97, (short)97, (short)690, (short)97, (short)97, (short)95, (short)97, (short)304, (short)95, (short)301, (short)306, (short)302, (short)97, (short)95, (short)303, (short)690, (short)307, (short)690, (short)95, (short)97, (short)308, (short)95, (short)97, (short)95, (short)95, (short)310, (short)95, (short)97, (short)95, (short)314, (short)690, (short)313, (short)97, (short)312, (short)690, (short)97, (short)311, (short)97, (short)97, (short)95, (short)97, (short)95, (short)97, (short)690, (short)315, (short)690, (short)95, (short)316, (short)319, (short)95, (short)690, (short)95, (short)95, (short)97, (short)95, (short)97, (short)95, (short)317, (short)690, (short)321, (short)97, (short)95, (short)318, (short)97, (short)324, (short)97, (short)97, (short)690, (short)97, (short)95, (short)97, (short)690, (short)320, (short)690, (short)322, (short)97, (short)690, (short)690, (short)690, (short)323, (short)690, (short)327, (short)325, (short)97, (short)248, (short)248, (short)248, (short)248, (short)248, (short)248, (short)248, (short)248, (short)326, (short)332, (short)334, (short)330, (short)690, (short)333, (short)95, (short)329, (short)328, (short)690, (short)336, (short)95, (short)336, (short)690, (short)331, (short)337, (short)337, (short)337, (short)337, (short)250, (short)97, (short)250, (short)250, (short)250, (short)335, (short)97, (short)690, (short)252, (short)252, (short)252, (short)252, (short)252, (short)252, (short)252, (short)252, (short)690, (short)250, (short)690, (short)690, (short)250, (short)250, (short)95, (short)250, (short)253, (short)690, (short)253, (short)253, (short)253, (short)95, (short)254, (short)254, (short)254, (short)254, (short)690, (short)690, (short)97, (short)690, (short)95, (short)95, (short)95, (short)253, (short)690, (short)97, (short)253, (short)253, (short)95, (short)253, (short)254, (short)254, (short)95, (short)254, (short)97, (short)97, (short)97, (short)690, (short)95, (short)95, (short)95, (short)254, (short)97, (short)95, (short)95, (short)95, (short)97, (short)95, (short)690, (short)690, (short)690, (short)338, (short)97, (short)97, (short)97, (short)95, (short)690, (short)97, (short)97, (short)97, (short)95, (short)97, (short)339, (short)340, (short)341, (short)95, (short)95, (short)690, (short)690, (short)97, (short)342, (short)95, (short)95, (short)690, (short)97, (short)95, (short)344, (short)690, (short)345, (short)97, (short)97, (short)347, (short)343, (short)95, (short)690, (short)97, (short)97, (short)352, (short)346, (short)97, (short)95, (short)349, (short)690, (short)95, (short)348, (short)95, (short)690, (short)97, (short)350, (short)353, (short)351, (short)95, (short)95, (short)95, (short)97, (short)95, (short)354, (short)97, (short)690, (short)97, (short)357, (short)356, (short)355, (short)358, (short)95, (short)97, (short)97, (short)97, (short)95, (short)97, (short)95, (short)95, (short)359, (short)95, (short)95, (short)95, (short)95, (short)95, (short)97, (short)95, (short)95, (short)690, (short)97, (short)690, (short)97, (short)97, (short)360, (short)97, (short)97, (short)97, (short)97, (short)97, (short)364, (short)97, (short)97, (short)95, (short)95, (short)363, (short)95, (short)95, (short)95, (short)95, (short)95, (short)366, (short)361, (short)95, (short)362, (short)367, (short)365, (short)97, (short)97, (short)95, (short)97, (short)97, (short)97, (short)97, (short)97, (short)380, (short)95, (short)97, (short)95, (short)95, (short)369, (short)95, (short)372, (short)97, (short)368, (short)373, (short)370, (short)95, (short)95, (short)95, (short)97, (short)371, (short)97, (short)97, (short)690, (short)97, (short)690, (short)690, (short)378, (short)95, (short)95, (short)97, (short)97, (short)97, (short)95, (short)374, (short)95, (short)95, (short)379, (short)690, (short)376, (short)375, (short)377, (short)97, (short)97, (short)95, (short)95, (short)383, (short)97, (short)95, (short)97, (short)97, (short)95, (short)381, (short)95, (short)95, (short)95, (short)384, (short)690, (short)97, (short)97, (short)382, (short)385, (short)97, (short)95, (short)95, (short)97, (short)95, (short)97, (short)97, (short)97, (short)690, (short)386, (short)95, (short)391, (short)95, (short)690, (short)690, (short)97, (short)97, (short)690, (short)97, (short)388, (short)95, (short)95, (short)394, (short)387, (short)97, (short)389, (short)97, (short)393, (short)390, (short)396, (short)95, (short)398, (short)392, (short)95, (short)97, (short)97, (short)95, (short)95, (short)95, (short)397, (short)399, (short)690, (short)690, (short)400, (short)97, (short)690, (short)395, (short)97, (short)690, (short)690, (short)97, (short)97, (short)97, (short)95, (short)402, (short)337, (short)337, (short)337, (short)337, (short)401, (short)337, (short)337, (short)337, (short)337, (short)95, (short)95, (short)95, (short)97, (short)95, (short)95, (short)690, (short)690, (short)95, (short)690, (short)95, (short)403, (short)405, (short)406, (short)97, (short)97, (short)97, (short)95, (short)97, (short)97, (short)404, (short)407, (short)97, (short)95, (short)97, (short)95, (short)690, (short)95, (short)690, (short)690, (short)418, (short)97, (short)95, (short)408, (short)95, (short)95, (short)410, (short)97, (short)95, (short)97, (short)690, (short)97, (short)409, (short)413, (short)95, (short)95, (short)97, (short)690, (short)97, (short)97, (short)95, (short)412, (short)97, (short)95, (short)411, (short)690, (short)690, (short)415, (short)97, (short)97, (short)690, (short)414, (short)95, (short)416, (short)97, (short)95, (short)95, (short)97, (short)95, (short)417, (short)421, (short)95, (short)690, (short)95, (short)423, (short)422, (short)97, (short)95, (short)95, (short)97, (short)97, (short)419, (short)97, (short)420, (short)95, (short)97, (short)426, (short)97, (short)95, (short)95, (short)427, (short)97, (short)97, (short)424, (short)425, (short)95, (short)95, (short)95, (short)97, (short)95, (short)428, (short)95, (short)97, (short)97, (short)690, (short)95, (short)690, (short)430, (short)95, (short)97, (short)97, (short)97, (short)95, (short)97, (short)690, (short)97, (short)95, (short)429, (short)432, (short)97, (short)431, (short)95, (short)97, (short)690, (short)433, (short)95, (short)97, (short)690, (short)435, (short)436, (short)97, (short)434, (short)690, (short)690, (short)690, (short)97, (short)95, (short)439, (short)95, (short)97, (short)95, (short)441, (short)690, (short)95, (short)95, (short)95, (short)437, (short)438, (short)440, (short)95, (short)97, (short)95, (short)97, (short)443, (short)97, (short)450, (short)444, (short)97, (short)97, (short)97, (short)95, (short)95, (short)442, (short)97, (short)690, (short)97, (short)95, (short)95, (short)95, (short)95, (short)95, (short)95, (short)95, (short)690, (short)97, (short)97, (short)95, (short)95, (short)448, (short)690, (short)97, (short)97, (short)97, (short)97, (short)97, (short)97, (short)97, (short)445, (short)690, (short)95, (short)97, (short)97, (short)446, (short)451, (short)690, (short)447, (short)95, (short)690, (short)449, (short)690, (short)452, (short)95, (short)454, (short)97, (short)95, (short)453, (short)455, (short)457, (short)459, (short)690, (short)97, (short)462, (short)95, (short)460, (short)456, (short)97, (short)463, (short)95, (short)97, (short)95, (short)95, (short)95, (short)95, (short)458, (short)461, (short)95, (short)97, (short)95, (short)95, (short)95, (short)690, (short)97, (short)95, (short)97, (short)97, (short)97, (short)97, (short)465, (short)95, (short)97, (short)95, (short)97, (short)97, (short)97, (short)95, (short)464, (short)97, (short)95, (short)466, (short)95, (short)95, (short)95, (short)97, (short)467, (short)97, (short)690, (short)479, (short)471, (short)97, (short)468, (short)95, (short)97, (short)95, (short)97, (short)97, (short)97, (short)95, (short)95, (short)95, (short)469, (short)470, (short)472, (short)95, (short)690, (short)97, (short)474, (short)97, (short)95, (short)95, (short)473, (short)97, (short)97, (short)97, (short)475, (short)95, (short)476, (short)97, (short)477, (short)95, (short)478, (short)481, (short)97, (short)97, (short)95, (short)95, (short)95, (short)482, (short)95, (short)97, (short)480, (short)690, (short)483, (short)97, (short)484, (short)690, (short)95, (short)486, (short)97, (short)97, (short)97, (short)95, (short)97, (short)690, (short)488, (short)487, (short)485, (short)489, (short)690, (short)490, (short)97, (short)95, (short)95, (short)95, (short)495, (short)97, (short)95, (short)491, (short)493, (short)492, (short)95, (short)95, (short)494, (short)690, (short)497, (short)97, (short)97, (short)97, (short)95, (short)95, (short)97, (short)95, (short)690, (short)95, (short)97, (short)97, (short)95, (short)496, (short)95, (short)498, (short)95, (short)95, (short)97, (short)97, (short)95, (short)97, (short)499, (short)97, (short)95, (short)95, (short)97, (short)500, (short)97, (short)690, (short)97, (short)97, (short)95, (short)95, (short)97, (short)95, (short)95, (short)95, (short)97, (short)97, (short)502, (short)95, (short)95, (short)501, (short)95, (short)503, (short)97, (short)97, (short)95, (short)97, (short)97, (short)97, (short)505, (short)95, (short)506, (short)97, (short)97, (short)95, (short)97, (short)95, (short)95, (short)504, (short)97, (short)690, (short)95, (short)690, (short)95, (short)97, (short)95, (short)95, (short)95, (short)97, (short)95, (short)97, (short)97, (short)690, (short)95, (short)510, (short)97, (short)507, (short)97, (short)95, (short)97, (short)97, (short)97, (short)512, (short)97, (short)508, (short)513, (short)509, (short)97, (short)95, (short)511, (short)95, (short)95, (short)97, (short)516, (short)95, (short)95, (short)95, (short)514, (short)95, (short)518, (short)95, (short)515, (short)97, (short)520, (short)97, (short)97, (short)95, (short)95, (short)97, (short)97, (short)97, (short)519, (short)97, (short)521, (short)97, (short)517, (short)690, (short)95, (short)95, (short)95, (short)97, (short)97, (short)95, (short)95, (short)690, (short)690, (short)95, (short)690, (short)95, (short)522, (short)524, (short)97, (short)97, (short)97, (short)526, (short)95, (short)97, (short)97, (short)525, (short)528, (short)97, (short)523, (short)97, (short)527, (short)529, (short)690, (short)95, (short)95, (short)95, (short)97, (short)530, (short)95, (short)690, (short)95, (short)690, (short)533, (short)95, (short)95, (short)532, (short)534, (short)97, (short)97, (short)97, (short)95, (short)531, (short)97, (short)535, (short)97, (short)538, (short)95, (short)97, (short)97, (short)95, (short)536, (short)95, (short)539, (short)95, (short)97, (short)537, (short)95, (short)95, (short)690, (short)95, (short)97, (short)95, (short)95, (short)97, (short)690, (short)97, (short)95, (short)97, (short)690, (short)95, (short)97, (short)97, (short)542, (short)97, (short)95, (short)97, (short)97, (short)95, (short)543, (short)95, (short)97, (short)690, (short)540, (short)97, (short)95, (short)541, (short)95, (short)95, (short)97, (short)690, (short)95, (short)97, (short)95, (short)97, (short)690, (short)547, (short)95, (short)95, (short)97, (short)550, (short)97, (short)97, (short)95, (short)545, (short)97, (short)95, (short)97, (short)546, (short)544, (short)95, (short)97, (short)97, (short)548, (short)551, (short)549, (short)95, (short)97, (short)552, (short)690, (short)97, (short)95, (short)95, (short)690, (short)97, (short)690, (short)95, (short)553, (short)690, (short)555, (short)97, (short)690, (short)690, (short)560, (short)95, (short)97, (short)97, (short)558, (short)95, (short)554, (short)97, (short)95, (short)557, (short)95, (short)561, (short)562, (short)556, (short)559, (short)97, (short)690, (short)95, (short)95, (short)97, (short)95, (short)95, (short)97, (short)95, (short)97, (short)95, (short)95, (short)95, (short)95, (short)690, (short)563, (short)97, (short)97, (short)95, (short)97, (short)97, (short)564, (short)97, (short)95, (short)97, (short)97, (short)97, (short)97, (short)565, (short)690, (short)690, (short)566, (short)97, (short)95, (short)690, (short)95, (short)568, (short)97, (short)571, (short)690, (short)95, (short)690, (short)690, (short)573, (short)567, (short)95, (short)690, (short)97, (short)569, (short)97, (short)690, (short)690, (short)577, (short)578, (short)97, (short)572, (short)576, (short)95, (short)95, (short)97, (short)570, (short)95, (short)95, (short)95, (short)574, (short)575, (short)95, (short)95, (short)95, (short)95, (short)95, (short)97, (short)97, (short)95, (short)95, (short)97, (short)97, (short)97, (short)579, (short)95, (short)97, (short)97, (short)97, (short)97, (short)97, (short)95, (short)95, (short)97, (short)97, (short)690, (short)690, (short)690, (short)95, (short)97, (short)690, (short)95, (short)95, (short)95, (short)580, (short)97, (short)97, (short)584, (short)581, (short)582, (short)586, (short)587, (short)97, (short)690, (short)589, (short)97, (short)97, (short)97, (short)95, (short)690, (short)591, (short)95, (short)95, (short)95, (short)690, (short)690, (short)588, (short)583, (short)585, (short)95, (short)95, (short)593, (short)97, (short)592, (short)590, (short)97, (short)97, (short)97, (short)596, (short)597, (short)95, (short)594, (short)95, (short)97, (short)97, (short)95, (short)95, (short)690, (short)690, (short)690, (short)95, (short)95, (short)95, (short)95, (short)97, (short)595, (short)97, (short)95, (short)95, (short)97, (short)97, (short)599, (short)598, (short)600, (short)97, (short)97, (short)97, (short)97, (short)690, (short)95, (short)690, (short)97, (short)97, (short)601, (short)95, (short)95, (short)95, (short)610, (short)690, (short)602, (short)690, (short)95, (short)603, (short)97, (short)604, (short)95, (short)95, (short)95, (short)97, (short)97, (short)97, (short)95, (short)606, (short)607, (short)605, (short)97, (short)95, (short)95, (short)95, (short)97, (short)97, (short)97, (short)95, (short)95, (short)95, (short)97, (short)690, (short)95, (short)690, (short)608, (short)97, (short)97, (short)97, (short)95, (short)95, (short)95, (short)97, (short)97, (short)97, (short)95, (short)612, (short)97, (short)613, (short)95, (short)95, (short)611, (short)614, (short)97, (short)97, (short)97, (short)609, (short)615, (short)95, (short)97, (short)95, (short)95, (short)690, (short)97, (short)97, (short)690, (short)95, (short)95, (short)95, (short)618, (short)95, (short)617, (short)97, (short)95, (short)97, (short)97, (short)623, (short)690, (short)690, (short)620, (short)97, (short)97, (short)97, (short)616, (short)97, (short)95, (short)95, (short)97, (short)625, (short)690, (short)95, (short)619, (short)621, (short)95, (short)95, (short)626, (short)630, (short)622, (short)624, (short)97, (short)97, (short)95, (short)627, (short)631, (short)97, (short)632, (short)95, (short)97, (short)97, (short)95, (short)95, (short)95, (short)95, (short)95, (short)95, (short)97, (short)95, (short)95, (short)690, (short)95, (short)97, (short)690, (short)95, (short)97, (short)97, (short)97, (short)97, (short)97, (short)97, (short)95, (short)97, (short)97, (short)633, (short)97, (short)690, (short)634, (short)97, (short)690, (short)690, (short)95, (short)95, (short)637, (short)95, (short)97, (short)635, (short)690, (short)636, (short)642, (short)644, (short)645, (short)95, (short)643, (short)640, (short)97, (short)97, (short)95, (short)97, (short)95, (short)95, (short)638, (short)95, (short)690, (short)647, (short)639, (short)97, (short)641, (short)95, (short)95, (short)95, (short)97, (short)95, (short)97, (short)97, (short)646, (short)97, (short)648, (short)690, (short)95, (short)95, (short)95, (short)97, (short)97, (short)97, (short)649, (short)97, (short)95, (short)690, (short)95, (short)690, (short)650, (short)651, (short)97, (short)97, (short)97, (short)95, (short)95, (short)95, (short)95, (short)95, (short)97, (short)652, (short)97, (short)653, (short)655, (short)95, (short)95, (short)95, (short)95, (short)97, (short)97, (short)97, (short)97, (short)97, (short)654, (short)95, (short)95, (short)95, (short)95, (short)97, (short)97, (short)97, (short)97, (short)656, (short)690, (short)690, (short)690, (short)657, (short)659, (short)97, (short)97, (short)97, (short)97, (short)690, (short)690, (short)95, (short)690, (short)95, (short)658, (short)660, (short)662, (short)95, (short)690, (short)95, (short)95, (short)690, (short)690, (short)661, (short)663, (short)97, (short)667, (short)97, (short)664, (short)95, (short)690, (short)97, (short)665, (short)97, (short)97, (short)666, (short)670, (short)690, (short)95, (short)95, (short)95, (short)95, (short)95, (short)97, (short)668, (short)669, (short)671, (short)95, (short)95, (short)95, (short)95, (short)672, (short)97, (short)97, (short)97, (short)97, (short)97, (short)690, (short)95, (short)95, (short)95, (short)97, (short)97, (short)97, (short)97, (short)95, (short)95, (short)95, (short)95, (short)674, (short)675, (short)673, (short)97, (short)97, (short)97, (short)690, (short)677, (short)690, (short)95, (short)97, (short)97, (short)97, (short)97, (short)680, (short)95, (short)690, (short)690, (short)690, (short)676, (short)681, (short)679, (short)678, (short)97, (short)690, (short)690, (short)690, (short)690, (short)690, (short)97, (short)684, (short)690, (short)690, (short)688, (short)690, (short)682, (short)686, (short)690, (short)690, (short)690, (short)690, (short)683, (short)690, (short)690, (short)689, (short)685, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)687, (short)60, (short)60, (short)60, (short)60, (short)60, (short)60, (short)60, (short)67, (short)67, (short)690, (short)67, (short)67, (short)67, (short)67, (short)96, (short)690, (short)690, (short)96, (short)96, (short)96, (short)166, (short)166, (short)167, (short)167, (short)255, (short)255, (short)255, (short)256, (short)256, (short)629, (short)629, (short)629, (short)629, (short)3, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690
};

static const short int yy_chk[2440] = 
{
(short)0, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)9, (short)12, (short)12, (short)13, (short)18, (short)56, (short)21, (short)20, (short)21, (short)21, (short)21, (short)21, (short)29, (short)29, (short)22, (short)629, (short)18, (short)20, (short)20, (short)22, (short)13, (short)31, (short)610, (short)24, (short)24, (short)24, (short)24, (short)22, (short)25, (short)27, (short)60, (short)32, (short)25, (short)100, (short)99, (short)31, (short)9, (short)23, (short)97, (short)23, (short)23, (short)23, (short)23, (short)24, (short)27, (short)32, (short)27, (short)27, (short)38, (short)33, (short)56, (short)42, (short)23, (short)33, (short)33, (short)23, (short)23, (short)23, (short)23, (short)23, (short)95, (short)39, (short)38, (short)96, (short)37, (short)42, (short)60, (short)33, (short)46, (short)23, (short)99, (short)24, (short)94, (short)23, (short)23, (short)39, (short)23, (short)96, (short)37, (short)40, (short)44, (short)32, (short)46, (short)67, (short)23, (short)37, (short)37, (short)23, (short)41, (short)90, (short)37, (short)47, (short)43, (short)40, (short)44, (short)75, (short)45, (short)38, (short)42, (short)37, (short)42, (short)38, (short)41, (short)38, (short)37, (short)47, (short)43, (short)48, (short)37, (short)42, (short)45, (short)68, (short)62, (short)39, (short)67, (short)40, (short)36, (short)37, (short)46, (short)68, (short)44, (short)48, (short)40, (short)28, (short)41, (short)41, (short)40, (short)47, (short)41, (short)40, (short)44, (short)47, (short)49, (short)50, (short)53, (short)41, (short)43, (short)45, (short)41, (short)43, (short)51, (short)112, (short)43, (short)54, (short)45, (short)45, (short)49, (short)50, (short)53, (short)45, (short)104, (short)52, (short)17, (short)14, (short)51, (short)112, (short)98, (short)54, (short)8, (short)48, (short)114, (short)82, (short)48, (short)82, (short)104, (short)52, (short)82, (short)82, (short)82, (short)82, (short)98, (short)102, (short)49, (short)50, (short)114, (short)103, (short)50, (short)50, (short)53, (short)54, (short)3, (short)112, (short)0, (short)51, (short)53, (short)102, (short)54, (short)50, (short)50, (short)103, (short)50, (short)83, (short)83, (short)83, (short)83, (short)52, (short)114, (short)107, (short)104, (short)51, (short)52, (short)76, (short)76, (short)76, (short)76, (short)0, (short)98, (short)0, (short)106, (short)83, (short)83, (short)107, (short)83, (short)108, (short)76, (short)76, (short)109, (short)76, (short)76, (short)76, (short)83, (short)102, (short)106, (short)110, (short)0, (short)103, (short)0, (short)108, (short)0, (short)111, (short)109, (short)76, (short)76, (short)113, (short)0, (short)76, (short)76, (short)110, (short)76, (short)80, (short)80, (short)80, (short)80, (short)111, (short)116, (short)117, (short)107, (short)113, (short)115, (short)130, (short)118, (short)121, (short)80, (short)80, (short)122, (short)80, (short)80, (short)80, (short)116, (short)117, (short)0, (short)0, (short)115, (short)130, (short)118, (short)121, (short)106, (short)108, (short)122, (short)80, (short)80, (short)110, (short)0, (short)80, (short)80, (short)109, (short)80, (short)81, (short)0, (short)81, (short)81, (short)81, (short)81, (short)111, (short)115, (short)0, (short)113, (short)119, (short)120, (short)123, (short)0, (short)118, (short)81, (short)116, (short)118, (short)81, (short)81, (short)81, (short)81, (short)117, (short)0, (short)119, (short)120, (short)123, (short)118, (short)124, (short)121, (short)122, (short)125, (short)81, (short)0, (short)0, (short)128, (short)81, (short)81, (short)0, (short)81, (short)126, (short)127, (short)124, (short)0, (short)0, (short)125, (short)131, (short)81, (short)105, (short)128, (short)134, (short)119, (short)129, (short)0, (short)126, (short)127, (short)132, (short)119, (short)120, (short)133, (short)131, (short)135, (short)105, (short)136, (short)134, (short)139, (short)129, (short)123, (short)0, (short)0, (short)132, (short)0, (short)0, (short)133, (short)0, (short)135, (short)0, (short)136, (short)0, (short)139, (short)0, (short)137, (short)124, (short)125, (short)105, (short)105, (short)105, (short)105, (short)105, (short)128, (short)126, (short)138, (short)105, (short)127, (short)132, (short)137, (short)0, (short)131, (short)0, (short)134, (short)105, (short)105, (short)105, (short)132, (short)105, (short)138, (short)129, (short)139, (short)140, (short)135, (short)132, (short)0, (short)133, (short)141, (short)139, (short)142, (short)143, (short)0, (short)139, (short)139, (short)136, (short)144, (short)140, (short)145, (short)148, (short)137, (short)146, (short)141, (short)138, (short)142, (short)143, (short)137, (short)147, (short)149, (short)151, (short)144, (short)150, (short)145, (short)148, (short)152, (short)146, (short)164, (short)164, (short)164, (short)164, (short)153, (short)147, (short)149, (short)151, (short)0, (short)150, (short)0, (short)143, (short)152, (short)0, (short)143, (short)0, (short)142, (short)144, (short)153, (short)171, (short)0, (short)140, (short)141, (short)0, (short)172, (short)143, (short)145, (short)143, (short)0, (short)146, (short)184, (short)0, (short)148, (short)171, (short)142, (short)0, (short)149, (short)151, (short)172, (short)173, (short)151, (short)0, (short)147, (short)0, (short)184, (short)149, (short)0, (short)150, (short)153, (short)158, (short)176, (short)158, (short)152, (short)173, (short)158, (short)158, (short)158, (short)158, (short)159, (short)189, (short)159, (short)159, (short)159, (short)161, (short)176, (short)161, (short)171, (short)0, (short)161, (short)161, (short)161, (short)161, (short)0, (short)189, (short)172, (short)159, (short)0, (short)179, (short)159, (short)159, (short)184, (short)159, (short)160, (short)160, (short)160, (short)160, (short)162, (short)173, (short)162, (short)162, (short)162, (short)179, (short)0, (short)0, (short)174, (short)160, (short)160, (short)177, (short)160, (short)160, (short)160, (short)0, (short)0, (short)162, (short)0, (short)176, (short)162, (short)162, (short)174, (short)162, (short)180, (short)177, (short)160, (short)160, (short)0, (short)178, (short)160, (short)160, (short)175, (short)160, (short)163, (short)163, (short)163, (short)163, (short)180, (short)166, (short)166, (short)166, (short)166, (short)178, (short)174, (short)183, (short)175, (short)0, (short)181, (short)179, (short)177, (short)0, (short)163, (short)163, (short)0, (short)163, (short)182, (short)166, (short)166, (short)183, (short)166, (short)177, (short)181, (short)163, (short)165, (short)165, (short)165, (short)165, (short)166, (short)178, (short)182, (short)0, (short)0, (short)180, (short)0, (short)185, (short)186, (short)187, (short)165, (short)175, (short)165, (short)165, (short)165, (short)188, (short)0, (short)175, (short)175, (short)0, (short)181, (short)185, (short)186, (short)187, (short)190, (short)192, (short)191, (short)165, (short)0, (short)188, (short)165, (short)165, (short)182, (short)165, (short)0, (short)193, (short)183, (short)194, (short)190, (short)192, (short)191, (short)0, (short)182, (short)195, (short)196, (short)197, (short)198, (short)0, (short)187, (short)193, (short)188, (short)194, (short)199, (short)201, (short)202, (short)186, (short)200, (short)195, (short)196, (short)197, (short)198, (short)185, (short)191, (short)204, (short)203, (short)192, (short)199, (short)201, (short)202, (short)205, (short)200, (short)206, (short)207, (short)0, (short)190, (short)0, (short)0, (short)204, (short)203, (short)0, (short)196, (short)0, (short)0, (short)205, (short)0, (short)206, (short)207, (short)193, (short)199, (short)197, (short)194, (short)208, (short)200, (short)201, (short)202, (short)198, (short)195, (short)195, (short)202, (short)209, (short)200, (short)203, (short)210, (short)204, (short)211, (short)208, (short)212, (short)213, (short)214, (short)0, (short)215, (short)206, (short)207, (short)209, (short)220, (short)216, (short)210, (short)205, (short)211, (short)217, (short)212, (short)213, (short)214, (short)215, (short)215, (short)218, (short)219, (short)208, (short)220, (short)216, (short)221, (short)222, (short)223, (short)217, (short)224, (short)225, (short)219, (short)226, (short)0, (short)218, (short)219, (short)0, (short)0, (short)227, (short)221, (short)222, (short)223, (short)0, (short)224, (short)225, (short)228, (short)226, (short)214, (short)230, (short)211, (short)216, (short)212, (short)227, (short)229, (short)213, (short)0, (short)217, (short)0, (short)231, (short)228, (short)218, (short)232, (short)230, (short)233, (short)234, (short)220, (short)235, (short)229, (short)236, (short)224, (short)0, (short)223, (short)231, (short)222, (short)0, (short)232, (short)221, (short)233, (short)234, (short)237, (short)235, (short)238, (short)236, (short)0, (short)225, (short)0, (short)239, (short)226, (short)230, (short)240, (short)0, (short)241, (short)242, (short)237, (short)243, (short)238, (short)245, (short)228, (short)0, (short)232, (short)239, (short)244, (short)229, (short)240, (short)235, (short)241, (short)242, (short)0, (short)243, (short)246, (short)245, (short)0, (short)231, (short)0, (short)233, (short)244, (short)0, (short)0, (short)0, (short)234, (short)0, (short)238, (short)236, (short)246, (short)247, (short)247, (short)247, (short)247, (short)248, (short)248, (short)248, (short)248, (short)237, (short)243, (short)245, (short)241, (short)0, (short)244, (short)256, (short)240, (short)239, (short)248, (short)249, (short)257, (short)249, (short)0, (short)242, (short)249, (short)249, (short)249, (short)249, (short)250, (short)256, (short)250, (short)250, (short)250, (short)246, (short)257, (short)248, (short)251, (short)251, (short)251, (short)251, (short)252, (short)252, (short)252, (short)252, (short)0, (short)250, (short)0, (short)0, (short)250, (short)250, (short)258, (short)250, (short)253, (short)252, (short)253, (short)253, (short)253, (short)259, (short)254, (short)254, (short)254, (short)254, (short)0, (short)0, (short)258, (short)0, (short)261, (short)260, (short)262, (short)253, (short)252, (short)259, (short)253, (short)253, (short)263, (short)253, (short)254, (short)254, (short)264, (short)254, (short)261, (short)260, (short)262, (short)0, (short)265, (short)266, (short)268, (short)254, (short)263, (short)267, (short)269, (short)271, (short)264, (short)270, (short)0, (short)0, (short)0, (short)258, (short)265, (short)266, (short)268, (short)273, (short)0, (short)267, (short)269, (short)271, (short)272, (short)270, (short)259, (short)260, (short)261, (short)274, (short)276, (short)0, (short)0, (short)273, (short)262, (short)275, (short)278, (short)0, (short)272, (short)277, (short)264, (short)0, (short)265, (short)274, (short)276, (short)267, (short)263, (short)279, (short)0, (short)275, (short)278, (short)271, (short)266, (short)277, (short)280, (short)269, (short)0, (short)281, (short)268, (short)282, (short)0, (short)279, (short)269, (short)272, (short)270, (short)283, (short)284, (short)285, (short)280, (short)286, (short)273, (short)281, (short)0, (short)282, (short)276, (short)275, (short)274, (short)277, (short)288, (short)283, (short)284, (short)285, (short)287, (short)286, (short)289, (short)290, (short)278, (short)291, (short)292, (short)293, (short)294, (short)296, (short)288, (short)297, (short)295, (short)0, (short)287, (short)0, (short)289, (short)290, (short)280, (short)291, (short)292, (short)293, (short)294, (short)296, (short)286, (short)297, (short)295, (short)298, (short)299, (short)285, (short)300, (short)301, (short)303, (short)304, (short)302, (short)288, (short)283, (short)305, (short)284, (short)289, (short)287, (short)298, (short)299, (short)306, (short)300, (short)301, (short)303, (short)304, (short)302, (short)305, (short)307, (short)305, (short)308, (short)309, (short)291, (short)310, (short)294, (short)306, (short)290, (short)295, (short)292, (short)311, (short)312, (short)313, (short)307, (short)293, (short)308, (short)309, (short)0, (short)310, (short)0, (short)0, (short)303, (short)314, (short)315, (short)311, (short)312, (short)313, (short)318, (short)298, (short)316, (short)317, (short)304, (short)0, (short)300, (short)299, (short)302, (short)314, (short)315, (short)319, (short)320, (short)310, (short)318, (short)321, (short)316, (short)317, (short)322, (short)306, (short)323, (short)324, (short)325, (short)311, (short)0, (short)319, (short)320, (short)308, (short)312, (short)321, (short)328, (short)326, (short)322, (short)327, (short)323, (short)324, (short)325, (short)0, (short)313, (short)329, (short)318, (short)330, (short)0, (short)0, (short)328, (short)326, (short)0, (short)327, (short)315, (short)331, (short)332, (short)321, (short)314, (short)329, (short)316, (short)330, (short)320, (short)317, (short)323, (short)333, (short)325, (short)319, (short)334, (short)331, (short)332, (short)338, (short)335, (short)339, (short)324, (short)326, (short)0, (short)0, (short)327, (short)333, (short)0, (short)322, (short)334, (short)0, (short)0, (short)338, (short)335, (short)339, (short)340, (short)330, (short)336, (short)336, (short)336, (short)336, (short)329, (short)337, (short)337, (short)337, (short)337, (short)341, (short)342, (short)343, (short)340, (short)344, (short)345, (short)0, (short)0, (short)346, (short)337, (short)347, (short)331, (short)334, (short)335, (short)341, (short)342, (short)343, (short)350, (short)344, (short)345, (short)333, (short)339, (short)346, (short)348, (short)347, (short)349, (short)337, (short)351, (short)0, (short)0, (short)350, (short)350, (short)353, (short)340, (short)352, (short)354, (short)342, (short)348, (short)355, (short)349, (short)0, (short)351, (short)341, (short)345, (short)356, (short)357, (short)353, (short)0, (short)352, (short)354, (short)358, (short)344, (short)355, (short)359, (short)343, (short)0, (short)0, (short)347, (short)356, (short)357, (short)0, (short)346, (short)360, (short)348, (short)358, (short)361, (short)362, (short)359, (short)363, (short)349, (short)353, (short)364, (short)0, (short)365, (short)355, (short)354, (short)360, (short)367, (short)366, (short)361, (short)362, (short)351, (short)363, (short)352, (short)368, (short)364, (short)358, (short)365, (short)369, (short)370, (short)359, (short)367, (short)366, (short)356, (short)357, (short)371, (short)372, (short)373, (short)368, (short)374, (short)361, (short)376, (short)369, (short)370, (short)0, (short)375, (short)0, (short)364, (short)377, (short)371, (short)372, (short)373, (short)378, (short)374, (short)0, (short)376, (short)379, (short)363, (short)366, (short)375, (short)365, (short)380, (short)377, (short)0, (short)367, (short)381, (short)378, (short)0, (short)369, (short)370, (short)379, (short)368, (short)0, (short)0, (short)0, (short)380, (short)382, (short)373, (short)383, (short)381, (short)385, (short)375, (short)0, (short)384, (short)386, (short)387, (short)371, (short)372, (short)374, (short)388, (short)382, (short)389, (short)383, (short)378, (short)385, (short)387, (short)379, (short)384, (short)386, (short)387, (short)390, (short)392, (short)377, (short)388, (short)0, (short)389, (short)391, (short)394, (short)393, (short)396, (short)398, (short)395, (short)397, (short)0, (short)390, (short)392, (short)400, (short)399, (short)385, (short)0, (short)391, (short)394, (short)393, (short)396, (short)398, (short)395, (short)397, (short)382, (short)0, (short)401, (short)400, (short)399, (short)383, (short)388, (short)0, (short)384, (short)402, (short)0, (short)386, (short)0, (short)389, (short)403, (short)392, (short)401, (short)404, (short)391, (short)393, (short)395, (short)397, (short)0, (short)402, (short)400, (short)406, (short)398, (short)394, (short)403, (short)400, (short)405, (short)404, (short)407, (short)408, (short)409, (short)410, (short)396, (short)399, (short)412, (short)406, (short)411, (short)413, (short)414, (short)0, (short)405, (short)415, (short)407, (short)408, (short)409, (short)410, (short)403, (short)416, (short)412, (short)417, (short)411, (short)413, (short)414, (short)418, (short)402, (short)415, (short)419, (short)404, (short)423, (short)420, (short)422, (short)416, (short)405, (short)417, (short)0, (short)418, (short)410, (short)418, (short)407, (short)421, (short)419, (short)424, (short)423, (short)420, (short)422, (short)425, (short)426, (short)427, (short)408, (short)409, (short)411, (short)429, (short)0, (short)421, (short)413, (short)424, (short)428, (short)430, (short)412, (short)425, (short)426, (short)427, (short)414, (short)431, (short)415, (short)429, (short)416, (short)432, (short)417, (short)420, (short)428, (short)430, (short)433, (short)434, (short)435, (short)421, (short)436, (short)431, (short)419, (short)0, (short)422, (short)432, (short)423, (short)0, (short)437, (short)425, (short)433, (short)434, (short)435, (short)438, (short)436, (short)0, (short)427, (short)426, (short)424, (short)428, (short)0, (short)428, (short)437, (short)439, (short)440, (short)441, (short)431, (short)438, (short)442, (short)428, (short)429, (short)428, (short)443, (short)444, (short)430, (short)0, (short)433, (short)439, (short)440, (short)441, (short)445, (short)446, (short)442, (short)447, (short)0, (short)448, (short)443, (short)444, (short)449, (short)432, (short)450, (short)434, (short)451, (short)452, (short)445, (short)446, (short)453, (short)447, (short)437, (short)448, (short)454, (short)455, (short)449, (short)438, (short)450, (short)0, (short)451, (short)452, (short)456, (short)457, (short)453, (short)458, (short)459, (short)460, (short)454, (short)455, (short)445, (short)461, (short)462, (short)441, (short)463, (short)446, (short)456, (short)457, (short)464, (short)458, (short)459, (short)460, (short)449, (short)465, (short)451, (short)461, (short)462, (short)466, (short)463, (short)467, (short)468, (short)447, (short)464, (short)0, (short)470, (short)0, (short)469, (short)465, (short)471, (short)472, (short)474, (short)466, (short)473, (short)467, (short)468, (short)0, (short)475, (short)461, (short)470, (short)456, (short)469, (short)476, (short)471, (short)472, (short)474, (short)463, (short)473, (short)457, (short)464, (short)459, (short)475, (short)477, (short)462, (short)478, (short)479, (short)476, (short)467, (short)480, (short)481, (short)482, (short)465, (short)483, (short)469, (short)484, (short)466, (short)477, (short)472, (short)478, (short)479, (short)485, (short)486, (short)480, (short)481, (short)482, (short)470, (short)483, (short)473, (short)484, (short)468, (short)0, (short)487, (short)488, (short)489, (short)485, (short)486, (short)490, (short)491, (short)0, (short)0, (short)492, (short)0, (short)493, (short)476, (short)478, (short)487, (short)488, (short)489, (short)481, (short)494, (short)490, (short)491, (short)480, (short)483, (short)492, (short)477, (short)493, (short)482, (short)484, (short)0, (short)495, (short)496, (short)497, (short)494, (short)485, (short)498, (short)0, (short)499, (short)0, (short)489, (short)500, (short)501, (short)488, (short)489, (short)495, (short)496, (short)497, (short)502, (short)487, (short)498, (short)490, (short)499, (short)493, (short)503, (short)500, (short)501, (short)504, (short)491, (short)505, (short)494, (short)506, (short)502, (short)492, (short)507, (short)508, (short)0, (short)509, (short)503, (short)510, (short)511, (short)504, (short)0, (short)505, (short)512, (short)506, (short)0, (short)514, (short)507, (short)508, (short)501, (short)509, (short)513, (short)510, (short)511, (short)515, (short)502, (short)516, (short)512, (short)0, (short)499, (short)514, (short)517, (short)500, (short)518, (short)519, (short)513, (short)0, (short)520, (short)515, (short)521, (short)516, (short)0, (short)508, (short)522, (short)524, (short)517, (short)511, (short)518, (short)519, (short)523, (short)505, (short)520, (short)525, (short)521, (short)506, (short)504, (short)526, (short)522, (short)524, (short)509, (short)513, (short)510, (short)527, (short)523, (short)515, (short)0, (short)525, (short)528, (short)529, (short)0, (short)526, (short)0, (short)530, (short)516, (short)0, (short)519, (short)527, (short)0, (short)0, (short)524, (short)531, (short)528, (short)529, (short)522, (short)533, (short)518, (short)530, (short)532, (short)521, (short)534, (short)525, (short)526, (short)520, (short)523, (short)531, (short)0, (short)535, (short)536, (short)533, (short)537, (short)538, (short)532, (short)539, (short)534, (short)540, (short)541, (short)543, (short)542, (short)0, (short)527, (short)535, (short)536, (short)544, (short)537, (short)538, (short)529, (short)539, (short)545, (short)540, (short)541, (short)543, (short)542, (short)530, (short)0, (short)0, (short)532, (short)544, (short)546, (short)0, (short)547, (short)534, (short)545, (short)536, (short)0, (short)548, (short)0, (short)0, (short)539, (short)533, (short)549, (short)0, (short)546, (short)534, (short)547, (short)0, (short)0, (short)543, (short)544, (short)548, (short)537, (short)542, (short)550, (short)551, (short)549, (short)535, (short)552, (short)554, (short)553, (short)540, (short)541, (short)555, (short)558, (short)556, (short)557, (short)559, (short)550, (short)551, (short)560, (short)561, (short)552, (short)554, (short)553, (short)547, (short)562, (short)555, (short)558, (short)556, (short)557, (short)559, (short)564, (short)565, (short)560, (short)561, (short)0, (short)0, (short)0, (short)563, (short)562, (short)0, (short)566, (short)567, (short)568, (short)549, (short)564, (short)565, (short)555, (short)550, (short)553, (short)557, (short)558, (short)563, (short)0, (short)560, (short)566, (short)567, (short)568, (short)569, (short)0, (short)562, (short)570, (short)572, (short)571, (short)0, (short)0, (short)559, (short)554, (short)556, (short)573, (short)574, (short)564, (short)569, (short)563, (short)561, (short)570, (short)572, (short)571, (short)567, (short)568, (short)575, (short)565, (short)576, (short)573, (short)574, (short)577, (short)578, (short)0, (short)0, (short)0, (short)579, (short)580, (short)581, (short)582, (short)575, (short)566, (short)576, (short)583, (short)584, (short)577, (short)578, (short)570, (short)569, (short)571, (short)579, (short)580, (short)581, (short)582, (short)0, (short)585, (short)0, (short)583, (short)584, (short)572, (short)586, (short)587, (short)588, (short)587, (short)0, (short)573, (short)0, (short)589, (short)576, (short)585, (short)578, (short)590, (short)591, (short)592, (short)586, (short)587, (short)588, (short)593, (short)581, (short)584, (short)579, (short)589, (short)594, (short)595, (short)596, (short)590, (short)591, (short)592, (short)597, (short)598, (short)599, (short)593, (short)0, (short)600, (short)0, (short)585, (short)594, (short)595, (short)596, (short)601, (short)604, (short)602, (short)597, (short)598, (short)599, (short)603, (short)590, (short)600, (short)592, (short)605, (short)606, (short)588, (short)593, (short)601, (short)604, (short)602, (short)586, (short)594, (short)607, (short)603, (short)608, (short)611, (short)0, (short)605, (short)606, (short)0, (short)609, (short)613, (short)612, (short)599, (short)614, (short)598, (short)607, (short)615, (short)608, (short)611, (short)604, (short)0, (short)0, (short)601, (short)609, (short)613, (short)612, (short)597, (short)614, (short)616, (short)617, (short)615, (short)606, (short)0, (short)618, (short)600, (short)602, (short)619, (short)620, (short)608, (short)611, (short)603, (short)605, (short)616, (short)617, (short)621, (short)609, (short)612, (short)618, (short)614, (short)622, (short)619, (short)620, (short)623, (short)624, (short)625, (short)626, (short)627, (short)630, (short)621, (short)631, (short)632, (short)0, (short)633, (short)622, (short)0, (short)634, (short)623, (short)624, (short)625, (short)626, (short)627, (short)630, (short)636, (short)631, (short)632, (short)616, (short)633, (short)0, (short)617, (short)634, (short)0, (short)0, (short)635, (short)637, (short)621, (short)638, (short)636, (short)619, (short)0, (short)620, (short)626, (short)627, (short)630, (short)639, (short)626, (short)624, (short)635, (short)637, (short)640, (short)638, (short)641, (short)642, (short)622, (short)643, (short)0, (short)634, (short)623, (short)639, (short)625, (short)644, (short)645, (short)646, (short)640, (short)647, (short)641, (short)642, (short)633, (short)643, (short)635, (short)0, (short)648, (short)649, (short)650, (short)644, (short)645, (short)646, (short)636, (short)647, (short)651, (short)0, (short)652, (short)0, (short)637, (short)639, (short)648, (short)649, (short)650, (short)653, (short)654, (short)655, (short)656, (short)657, (short)651, (short)643, (short)652, (short)644, (short)646, (short)658, (short)659, (short)660, (short)661, (short)653, (short)654, (short)655, (short)656, (short)657, (short)644, (short)662, (short)664, (short)663, (short)665, (short)658, (short)659, (short)660, (short)661, (short)647, (short)0, (short)0, (short)0, (short)648, (short)651, (short)662, (short)664, (short)663, (short)665, (short)0, (short)0, (short)666, (short)0, (short)667, (short)649, (short)652, (short)654, (short)668, (short)0, (short)669, (short)670, (short)0, (short)0, (short)653, (short)655, (short)666, (short)661, (short)667, (short)657, (short)671, (short)0, (short)668, (short)659, (short)669, (short)670, (short)660, (short)664, (short)0, (short)672, (short)673, (short)674, (short)675, (short)676, (short)671, (short)662, (short)663, (short)665, (short)677, (short)679, (short)678, (short)680, (short)666, (short)672, (short)673, (short)674, (short)675, (short)676, (short)0, (short)681, (short)682, (short)683, (short)677, (short)679, (short)678, (short)680, (short)685, (short)684, (short)686, (short)687, (short)669, (short)670, (short)668, (short)681, (short)682, (short)683, (short)0, (short)672, (short)0, (short)688, (short)685, (short)684, (short)686, (short)687, (short)677, (short)689, (short)0, (short)0, (short)0, (short)671, (short)678, (short)675, (short)674, (short)688, (short)0, (short)0, (short)0, (short)0, (short)0, (short)689, (short)682, (short)0, (short)0, (short)686, (short)0, (short)680, (short)684, (short)0, (short)0, (short)0, (short)0, (short)681, (short)0, (short)0, (short)688, (short)683, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)685, (short)691, (short)691, (short)691, (short)691, (short)691, (short)691, (short)691, (short)692, (short)692, (short)0, (short)692, (short)692, (short)692, (short)692, (short)693, (short)0, (short)0, (short)693, (short)693, (short)693, (short)694, (short)694, (short)695, (short)695, (short)696, (short)696, (short)696, (short)697, (short)697, (short)698, (short)698, (short)698, (short)698, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690
};

static yy_state_type yy_last_accepting_state;

static char * yy_last_accepting_cpos;

char * yytext;

enum yytokentype
{
IDENTIFIER = 258, CONSTANT = 259, STRING_LITERAL = 260, SIZEOF = 261, PTR_OP = 262, INC_OP = 263, DEC_OP = 264, LEFT_OP = 265, RIGHT_OP = 266, LE_OP = 267, GE_OP = 268, EQ_OP = 269, NE_OP = 270, AND_OP = 271, OR_OP = 272, MUL_ASSIGN = 273, DIV_ASSIGN = 274, MOD_ASSIGN = 275, ADD_ASSIGN = 276, SUB_ASSIGN = 277, LEFT_ASSIGN = 278, RIGHT_ASSIGN = 279, AND_ASSIGN = 280, XOR_ASSIGN = 281, OR_ASSIGN = 282, TYPE_NAME = 283, TYPEDEF = 284, EXTERN = 285, STATIC = 286, AUTO = 287, REGISTER = 288, CHAR = 289, SHORT = 290, INT = 291, UINT = 292, INT64 = 293, LONG = 294, SIGNED = 295, UNSIGNED = 296, FLOAT = 297, DOUBLE = 298, CONST = 299, VOLATILE = 300, VOID = 301, VALIST = 302, STRUCT = 303, UNION = 304, ENUM = 305, ELLIPSIS = 306, CASE = 307, DEFAULT = 308, IF = 309, SWITCH = 310, WHILE = 311, DO = 312, FOR = 313, GOTO = 314, CONTINUE = 315, BREAK = 316, RETURN = 317, IFX = 318, ELSE = 319, CLASS = 320, THISCLASS = 321, CLASS_NAME = 322, PROPERTY = 323, SETPROP = 324, GETPROP = 325, NEWOP = 326, RENEW = 327, DELETE = 328, EXT_DECL = 329, EXT_STORAGE = 330, IMPORT = 331, DEFINE = 332, VIRTUAL = 333, ATTRIB = 334, PUBLIC = 335, PRIVATE = 336, TYPED_OBJECT = 337, ANY_OBJECT = 338, _INCREF = 339, EXTENSION = 340, ASM = 341, TYPEOF = 342, WATCH = 343, STOPWATCHING = 344, FIREWATCHERS = 345, WATCHABLE = 346, CLASS_DESIGNER = 347, CLASS_NO_EXPANSION = 348, CLASS_FIXED = 349, ISPROPSET = 350, CLASS_DEFAULT_PROPERTY = 351, PROPERTY_CATEGORY = 352, CLASS_DATA = 353, CLASS_PROPERTY = 354, SUBCLASS = 355, NAMESPACE = 356, NEW0OP = 357, RENEW0 = 358, VAARG = 359, DBTABLE = 360, DBFIELD = 361, DBINDEX = 362, DATABASE_OPEN = 363, ALIGNOF = 364, ATTRIB_DEP = 365, __ATTRIB = 366, BOOL = 367, _BOOL = 368, _COMPLEX = 369, _IMAGINARY = 370, RESTRICT = 371
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
if(yy_current_state >= 691)
yy_c = yy_meta[(unsigned int)yy_c];
}
yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int)yy_c];
++yy_cp;
}while(yy_base[yy_current_state] != (short)2365);
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
return (STRUCT);
}
break;
case 33:
TESTTTT();
{
return (SWITCH);
}
break;
case 34:
TESTTTT();
{
return (TYPEDEF);
}
break;
case 35:
TESTTTT();
{
return (UNION);
}
break;
case 36:
TESTTTT();
{
return (UNSIGNED);
}
break;
case 37:
TESTTTT();
{
return (VOID);
}
break;
case 38:
TESTTTT();
{
return (VOLATILE);
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
return (WHILE);
}
break;
case 42:
TESTTTT();
{
return (PROPERTY);
}
break;
case 43:
TESTTTT();
{
return (SETPROP);
}
break;
case 44:
TESTTTT();
{
return (GETPROP);
}
break;
case 45:
TESTTTT();
{
return (ISPROPSET);
}
break;
case 46:
TESTTTT();
{
return (CLASS);
}
break;
case 47:
TESTTTT();
{
return (THISCLASS);
}
break;
case 48:
TESTTTT();
{
return (VIRTUAL);
}
break;
case 49:
TESTTTT();
{
return (DELETE);
}
break;
case 50:
TESTTTT();
{
return (NEWOP);
}
break;
case 51:
TESTTTT();
{
return (NEW0OP);
}
break;
case 52:
TESTTTT();
{
return (RENEW);
}
break;
case 53:
TESTTTT();
{
return (RENEW0);
}
break;
case 54:
TESTTTT();
{
return (IMPORT);
}
break;
case 55:
TESTTTT();
{
return (DEFINE);
}
break;
case 56:
TESTTTT();
{
return (INT64);
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
return (VALIST);
}
break;
case 59:
TESTTTT();
{
return (VAARG);
}
break;
case 60:
TESTTTT();
{
return (BOOL);
}
break;
case 61:
TESTTTT();
{
return (_BOOL);
}
break;
case 62:
TESTTTT();
{
return (_COMPLEX);
}
break;
case 63:
TESTTTT();
{
return (_IMAGINARY);
}
break;
case 64:
TESTTTT();
{
return (RESTRICT);
}
break;
case 65:
TESTTTT();
{
return ATTRIB_DEP;
}
break;
case 66:
TESTTTT();
{
return ATTRIB;
}
break;
case 67:
TESTTTT();
{
return __ATTRIB;
}
break;
case 68:
TESTTTT();
{
return (EXT_STORAGE);
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
return (EXT_DECL);
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
return (PUBLIC);
}
break;
case 84:
TESTTTT();
{
return (PRIVATE);
}
break;
case 85:
TESTTTT();
{
return (TYPED_OBJECT);
}
break;
case 86:
TESTTTT();
{
return (ANY_OBJECT);
}
break;
case 87:
TESTTTT();
{
return (_INCREF);
}
break;
case 88:
TESTTTT();
{
return (EXTENSION);
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
return (ASM);
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
return (TYPEOF);
}
break;
case 94:
TESTTTT();
{
return (WATCH);
}
break;
case 95:
TESTTTT();
{
return (STOPWATCHING);
}
break;
case 96:
TESTTTT();
{
return (FIREWATCHERS);
}
break;
case 97:
TESTTTT();
{
return (WATCHABLE);
}
break;
case 98:
TESTTTT();
{
return (CLASS_DESIGNER);
}
break;
case 99:
TESTTTT();
{
return (CLASS_NO_EXPANSION);
}
break;
case 100:
TESTTTT();
{
return (CLASS_FIXED);
}
break;
case 101:
TESTTTT();
{
return (CLASS_DEFAULT_PROPERTY);
}
break;
case 102:
TESTTTT();
{
return (PROPERTY_CATEGORY);
}
break;
case 103:
TESTTTT();
{
return (CLASS_DATA);
}
break;
case 104:
TESTTTT();
{
return (CLASS_PROPERTY);
}
break;
case 105:
TESTTTT();
{
return (SUBCLASS);
}
break;
case 106:
TESTTTT();
{
return (NAMESPACE);
}
break;
case 107:
TESTTTT();
{
return (DBTABLE);
}
break;
case 108:
TESTTTT();
{
return (DBFIELD);
}
break;
case 109:
TESTTTT();
{
return (DBINDEX);
}
break;
case 110:
TESTTTT();
{
return (DATABASE_OPEN);
}
break;
case 111:
TESTTTT();
{
return (check_type());
}
break;
case 112:
TESTTTT();
{
return (CONSTANT);
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
return (STRING_LITERAL);
}
break;
case 120:
TESTTTT();
{
return (ELLIPSIS);
}
break;
case 121:
TESTTTT();
{
return (RIGHT_ASSIGN);
}
break;
case 122:
TESTTTT();
{
return (LEFT_ASSIGN);
}
break;
case 123:
TESTTTT();
{
return (ADD_ASSIGN);
}
break;
case 124:
TESTTTT();
{
return (SUB_ASSIGN);
}
break;
case 125:
TESTTTT();
{
return (MUL_ASSIGN);
}
break;
case 126:
TESTTTT();
{
return (DIV_ASSIGN);
}
break;
case 127:
TESTTTT();
{
return (MOD_ASSIGN);
}
break;
case 128:
TESTTTT();
{
return (AND_ASSIGN);
}
break;
case 129:
TESTTTT();
{
return (XOR_ASSIGN);
}
break;
case 130:
TESTTTT();
{
return (OR_ASSIGN);
}
break;
case 131:
TESTTTT();
{
return (RIGHT_OP);
}
break;
case 132:
TESTTTT();
{
return (LEFT_OP);
}
break;
case 133:
TESTTTT();
{
return (INC_OP);
}
break;
case 134:
TESTTTT();
{
return (DEC_OP);
}
break;
case 135:
TESTTTT();
{
return (PTR_OP);
}
break;
case 136:
TESTTTT();
{
return (AND_OP);
}
break;
case 137:
TESTTTT();
{
return (OR_OP);
}
break;
case 138:
TESTTTT();
{
return (LE_OP);
}
break;
case 139:
TESTTTT();
{
return (GE_OP);
}
break;
case 140:
TESTTTT();
{
return (EQ_OP);
}
break;
case 141:
TESTTTT();
{
return (NE_OP);
}
break;
case 142:
TESTTTT();
{
return (';');
}
break;
case 143:
TESTTTT();
{
return ('{');
}
break;
case 144:
TESTTTT();
{
return ('}');
}
break;
case 145:
TESTTTT();
{
return (',');
}
break;
case 146:
TESTTTT();
{
return (':');
}
break;
case 147:
TESTTTT();
{
return ('=');
}
break;
case 148:
TESTTTT();
{
return ('(');
}
break;
case 149:
TESTTTT();
{
return (')');
}
break;
case 150:
TESTTTT();
{
return ('[');
}
break;
case 151:
TESTTTT();
{
return (']');
}
break;
case 152:
TESTTTT();
{
return ('.');
}
break;
case 153:
TESTTTT();
{
return ('&');
}
break;
case 154:
TESTTTT();
{
return ('!');
}
break;
case 155:
TESTTTT();
{
return ('~');
}
break;
case 156:
TESTTTT();
{
return ('-');
}
break;
case 157:
TESTTTT();
{
return ('+');
}
break;
case 158:
TESTTTT();
{
return ('*');
}
break;
case 159:
TESTTTT();
{
return ('/');
}
break;
case 160:
TESTTTT();
{
return ('%');
}
break;
case 161:
TESTTTT();
{
return ('<');
}
break;
case 162:
TESTTTT();
{
return ('>');
}
break;
case 163:
TESTTTT();
{
return ('^');
}
break;
case 164:
TESTTTT();
{
return ('|');
}
break;
case 165:
TESTTTT();
{
return ('?');
}
break;
case 166:
TESTTTT();
{
return ('$');
}
break;
case 173LL:
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
case 167:
TESTTTT();
{
yylloc.start = yylloc.end;
type_yylloc.start = type_yylloc.end;
expression_yylloc.start = expression_yylloc.end;
}
break;
case 168:
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
case 169:
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
case 170:
TESTTTT();
{
yylloc.start = yylloc.end;
expression_yylloc.start = expression_yylloc.end;
type_yylloc.start = type_yylloc.end;
}
break;
case 171:
TESTTTT();
(void)fwrite(yytext, yyleng, 1, yyout);
break;
case 172:
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
yy_act = (172 + ((yy_start - 1) / 2) + 1);
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
if(yy_current_state >= 691)
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
if(yy_current_state >= 691)
yy_c = yy_meta[(unsigned int)yy_c];
}
yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int)yy_c];
yy_is_jam = (yy_current_state == 690);
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

extern char *  __ecereNameSpace__ecere__GetTranslatedString(struct __ecereNameSpace__ecere__com__Instance * module, char *  string, char *  stringAndContext);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

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
fprintf((bsl_stderr()), __ecereNameSpace__ecere__GetTranslatedString(__thisModule, "Includes nested too deeply", (((void *)0))));
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

