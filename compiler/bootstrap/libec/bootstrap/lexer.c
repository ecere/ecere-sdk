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
0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 21, 21, 22, 21, 23, 21, 21, 21, 24, 25, 26, 27, 28, 29, 1, 30, 31, 32, 30, 33, 34, 35, 35, 36, 35, 35, 37, 35, 35, 35, 35, 35, 35, 35, 35, 38, 35, 35, 39, 35, 35, 40, 41, 42, 43, 44, 1, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 35, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
};

static const int yy_meta[74] = 
{
0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 1, 4, 1, 1, 1, 1, 1, 1, 5, 5, 5, 5, 2, 1, 1, 1, 1, 1, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 1, 1, 1, 1, 7, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 1, 1, 1, 1
};

static const short int yy_base[699] = 
{
(short)0, (short)0, (short)0, (short)192, (short)2369, (short)2369, (short)2369, (short)2369, (short)161, (short)68, (short)2369, (short)2369, (short)48, (short)67, (short)126, (short)2369, (short)2369, (short)137, (short)63, (short)2369, (short)64, (short)62, (short)74, (short)92, (short)77, (short)78, (short)2369, (short)94, (short)128, (short)59, (short)2369, (short)95, (short)98, (short)126, (short)2369, (short)2369, (short)116, (short)129, (short)123, (short)114, (short)118, (short)144, (short)148, (short)142, (short)159, (short)152, (short)125, (short)187, (short)170, (short)189, (short)195, (short)197, (short)202, (short)213, (short)217, (short)2369, (short)52, (short)2369, (short)2369, (short)2369, (short)145, (short)2369, (short)137, (short)2369, (short)2369, (short)2369, (short)2369, (short)85, (short)168, (short)2369, (short)2369, (short)2369, (short)2369, (short)2369, (short)2369, (short)116, (short)253, (short)2369, (short)2369, (short)2369, (short)290, (short)329, (short)262, (short)214, (short)0, (short)0, (short)0, (short)2369, (short)2369, (short)2369, (short)100, (short)2369, (short)2369, (short)2369, (short)90, (short)87, (short)206, (short)83, (short)229, (short)216, (short)63, (short)2369, (short)230, (short)232, (short)240, (short)384, (short)270, (short)271, (short)290, (short)291, (short)298, (short)294, (short)307, (short)306, (short)309, (short)318, (short)311, (short)310, (short)348, (short)350, (short)351, (short)355, (short)360, (short)371, (short)378, (short)366, (short)367, (short)379, (short)389, (short)394, (short)219, (short)399, (short)404, (short)386, (short)410, (short)414, (short)415, (short)426, (short)432, (short)445, (short)434, (short)451, (short)453, (short)464, (short)452, (short)460, (short)462, (short)456, (short)463, (short)481, (short)490, (short)482, (short)507, (short)508, (short)2369, (short)2369, (short)2369, (short)2369, (short)524, (short)499, (short)551, (short)542, (short)541, (short)555, (short)506, (short)592, (short)579, (short)0, (short)2369, (short)2369, (short)0, (short)530, (short)559, (short)532, (short)557, (short)596, (short)558, (short)613, (short)600, (short)615, (short)617, (short)620, (short)626, (short)566, (short)641, (short)630, (short)643, (short)646, (short)647, (short)556, (short)650, (short)652, (short)653, (short)654, (short)656, (short)663, (short)671, (short)674, (short)680, (short)686, (short)695, (short)693, (short)696, (short)697, (short)698, (short)704, (short)713, (short)720, (short)722, (short)726, (short)729, (short)731, (short)741, (short)742, (short)744, (short)747, (short)749, (short)748, (short)753, (short)754, (short)765, (short)769, (short)770, (short)771, (short)772, (short)777, (short)781, (short)782, (short)794, (short)798, (short)799, (short)801, (short)803, (short)807, (short)804, (short)810, (short)809, (short)822, (short)825, (short)827, (short)828, (short)829, (short)834, (short)837, (short)849, (short)852, (short)853, (short)763, (short)858, (short)881, (short)873, (short)895, (short)899, (short)891, (short)905, (short)0, (short)859, (short)865, (short)876, (short)914, (short)924, (short)927, (short)930, (short)936, (short)940, (short)881, (short)946, (short)947, (short)952, (short)953, (short)955, (short)957, (short)958, (short)962, (short)968, (short)974, (short)973, (short)978, (short)979, (short)981, (short)986, (short)990, (short)997, (short)1003, (short)1008, (short)1009, (short)1010, (short)1018, (short)1020, (short)1026, (short)1019, (short)1021, (short)1025, (short)1027, (short)1029, (short)1036, (short)1030, (short)1037, (short)1042, (short)1045, (short)1049, (short)1053, (short)1054, (short)1060, (short)1065, (short)1071, (short)1066, (short)1072, (short)1075, (short)1077, (short)1081, (short)1090, (short)1092, (short)1094, (short)1096, (short)1097, (short)1098, (short)1100, (short)1103, (short)1107, (short)1118, (short)1109, (short)1120, (short)1122, (short)1124, (short)1125, (short)1126, (short)1131, (short)1133, (short)1137, (short)1141, (short)1143, (short)1150, (short)1154, (short)1158, (short)1160, (short)1167, (short)1177, (short)1167, (short)1184, (short)1191, (short)1192, (short)1194, (short)1195, (short)1196, (short)1202, (short)1211, (short)1212, (short)1213, (short)1218, (short)1222, (short)1215, (short)1224, (short)1237, (short)1231, (short)1240, (short)1241, (short)1243, (short)1248, (short)1250, (short)1253, (short)1259, (short)1265, (short)1266, (short)1271, (short)1276, (short)1278, (short)1281, (short)1282, (short)1284, (short)1287, (short)1288, (short)1294, (short)1297, (short)1299, (short)1304, (short)1305, (short)1307, (short)1310, (short)1315, (short)1316, (short)1320, (short)1331, (short)1332, (short)1335, (short)1337, (short)1341, (short)1342, (short)1348, (short)1353, (short)1343, (short)1358, (short)1359, (short)1361, (short)1363, (short)1365, (short)1364, (short)1368, (short)1366, (short)1369, (short)1388, (short)1370, (short)1376, (short)1393, (short)1392, (short)1397, (short)1404, (short)1405, (short)1412, (short)1416, (short)1420, (short)1423, (short)1425, (short)1429, (short)1431, (short)1433, (short)1438, (short)1441, (short)1436, (short)1442, (short)1449, (short)1457, (short)1451, (short)1453, (short)1458, (short)1459, (short)1462, (short)1468, (short)1469, (short)1477, (short)1480, (short)1487, (short)1481, (short)1490, (short)1497, (short)1499, (short)1502, (short)1514, (short)1520, (short)1521, (short)1522, (short)1523, (short)1526, (short)1527, (short)1530, (short)1533, (short)1539, (short)1542, (short)1543, (short)1545, (short)1546, (short)1548, (short)1551, (short)1552, (short)1558, (short)1561, (short)1567, (short)1573, (short)1574, (short)1577, (short)1579, (short)1580, (short)1582, (short)1583, (short)1586, (short)1589, (short)1590, (short)1592, (short)1598, (short)1602, (short)1605, (short)1607, (short)1608, (short)1610, (short)1618, (short)1620, (short)1627, (short)1633, (short)1642, (short)1638, (short)1643, (short)1645, (short)1646, (short)1648, (short)1650, (short)1651, (short)1649, (short)1658, (short)1661, (short)1666, (short)1668, (short)1670, (short)1673, (short)1676, (short)1689, (short)1695, (short)1696, (short)1698, (short)1699, (short)1702, (short)1706, (short)1707, (short)1708, (short)1717, (short)1718, (short)1723, (short)1725, (short)1726, (short)1727, (short)1729, (short)1733, (short)1734, (short)1735, (short)1742, (short)1736, (short)1738, (short)1746, (short)1751, (short)1754, (short)1755, (short)1758, (short)1759, (short)1761, (short)1779, (short)1782, (short)1783, (short)1784, (short)1787, (short)1788, (short)1789, (short)1790, (short)1794, (short)1799, (short)1809, (short)1811, (short)1810, (short)1814, (short)1815, (short)1817, (short)1826, (short)1827, (short)1830, (short)1832, (short)1838, (short)1842, (short)1843, (short)1845, (short)1847, (short)1854, (short)1855, (short)1858, (short)1865, (short)1870, (short)1871, (short)1873, (short)1878, (short)1881, (short)1882, (short)1886, (short)1890, (short)1891, (short)1894, (short)1899, (short)1901, (short)1897, (short)1903, (short)1906, (short)1914, (short)1918, (short)1924, (short)1926, (short)1927, (short)1929, (short)1942, (short)1930, (short)1946, (short)1948, (short)1950, (short)1955, (short)1954, (short)1957, (short)1961, (short)1958, (short)1963, (short)1970, (short)1974, (short)1976, (short)1980, (short)1981, (short)1985, (short)1989, (short)1993, (short)1996, (short)1998, (short)2001, (short)2002, (short)2005, (short)2006, (short)2008, (short)2014, (short)2011, (short)2024, (short)2026, (short)2027, (short)2034, (short)2033, (short)2036, (short)2037, (short)2043, (short)2039, (short)82, (short)2045, (short)2056, (short)2044, (short)2061, (short)2066, (short)2071, (short)2072, (short)2082, (short)2083, (short)2084, (short)2087, (short)2088, (short)2089, (short)2091, (short)2092, (short)2093, (short)2094, (short)2369, (short)76, (short)2100, (short)2099, (short)2104, (short)2109, (short)2110, (short)2111, (short)2115, (short)2116, (short)2122, (short)2137, (short)2138, (short)2139, (short)2141, (short)2143, (short)2144, (short)2147, (short)2159, (short)2156, (short)2160, (short)2163, (short)2166, (short)2169, (short)2167, (short)2171, (short)2172, (short)2175, (short)2178, (short)2184, (short)2187, (short)2188, (short)2191, (short)2197, (short)2195, (short)2199, (short)2200, (short)2204, (short)2206, (short)2212, (short)2216, (short)2219, (short)2227, (short)2232, (short)2234, (short)2235, (short)2239, (short)2240, (short)2244, (short)2251, (short)2252, (short)2256, (short)2259, (short)2260, (short)2261, (short)2263, (short)2264, (short)2267, (short)2279, (short)2280, (short)2283, (short)2282, (short)2369, (short)2335, (short)2342, (short)2348, (short)2351, (short)2352, (short)2355, (short)2357, (short)2361
};

static const short int yy_def[699] = 
{
(short)0, (short)690, (short)1, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)691, (short)690, (short)690, (short)690, (short)690, (short)692, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)23, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)693, (short)693, (short)693, (short)690, (short)690, (short)690, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)690, (short)690, (short)690, (short)690, (short)690, (short)691, (short)690, (short)691, (short)690, (short)690, (short)690, (short)690, (short)692, (short)692, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)694, (short)24, (short)695, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)693, (short)690, (short)693, (short)691, (short)692, (short)690, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)694, (short)696, (short)690, (short)690, (short)697, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)696, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)690, (short)690, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)698, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)690, (short)698, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)693, (short)0, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690
};

static const short int yy_nxt[2443] = 
{
(short)0, (short)4, (short)5, (short)6, (short)7, (short)8, (short)9, (short)10, (short)11, (short)12, (short)13, (short)14, (short)15, (short)16, (short)17, (short)18, (short)19, (short)20, (short)21, (short)22, (short)23, (short)24, (short)24, (short)24, (short)25, (short)26, (short)27, (short)28, (short)29, (short)30, (short)31, (short)32, (short)31, (short)31, (short)31, (short)31, (short)31, (short)33, (short)31, (short)31, (short)34, (short)4, (short)35, (short)36, (short)37, (short)38, (short)39, (short)40, (short)41, (short)42, (short)43, (short)44, (short)31, (short)45, (short)31, (short)31, (short)46, (short)31, (short)47, (short)31, (short)48, (short)49, (short)50, (short)51, (short)52, (short)53, (short)54, (short)31, (short)31, (short)31, (short)55, (short)56, (short)57, (short)58, (short)61, (short)63, (short)64, (short)65, (short)70, (short)154, (short)75, (short)72, (short)76, (short)76, (short)76, (short)76, (short)93, (short)94, (short)77, (short)628, (short)71, (short)73, (short)74, (short)78, (short)66, (short)628, (short)156, (short)85, (short)85, (short)85, (short)85, (short)79, (short)86, (short)88, (short)68, (short)95, (short)87, (short)170, (short)95, (short)62, (short)80, (short)97, (short)81, (short)81, (short)81, (short)81, (short)690, (short)169, (short)89, (short)97, (short)90, (short)91, (short)97, (short)155, (short)95, (short)82, (short)68, (short)168, (short)95, (short)83, (short)83, (short)84, (short)99, (short)95, (short)157, (short)95, (short)95, (short)100, (short)97, (short)95, (short)690, (short)82, (short)97, (short)101, (short)690, (short)83, (short)83, (short)97, (short)83, (short)97, (short)97, (short)61, (short)95, (short)97, (short)95, (short)92, (short)83, (short)98, (short)95, (short)84, (short)102, (short)103, (short)95, (short)113, (short)69, (short)104, (short)97, (short)68, (short)97, (short)95, (short)114, (short)690, (short)97, (short)105, (short)115, (short)112, (short)97, (short)116, (short)106, (short)67, (short)95, (short)109, (short)107, (short)97, (short)134, (short)110, (short)62, (short)111, (short)59, (short)117, (short)118, (short)108, (short)690, (short)119, (short)97, (short)125, (short)690, (short)95, (short)126, (short)95, (short)120, (short)127, (short)130, (short)121, (short)122, (short)95, (short)123, (short)95, (short)128, (short)131, (short)132, (short)97, (short)95, (short)97, (short)133, (short)124, (short)95, (short)690, (short)129, (short)97, (short)690, (short)97, (short)61, (short)95, (short)690, (short)690, (short)97, (short)95, (short)690, (short)95, (short)97, (short)137, (short)135, (short)690, (short)138, (short)690, (short)136, (short)97, (short)139, (short)95, (short)95, (short)97, (short)95, (short)97, (short)140, (short)690, (short)690, (short)141, (short)142, (short)146, (short)95, (short)83, (short)83, (short)97, (short)97, (short)148, (short)97, (short)62, (short)143, (short)144, (short)149, (short)145, (short)152, (short)690, (short)97, (short)147, (short)150, (short)83, (short)83, (short)153, (short)83, (short)690, (short)151, (short)76, (short)76, (short)76, (short)76, (short)164, (short)83, (short)164, (short)95, (short)95, (short)165, (short)165, (short)165, (short)165, (short)158, (short)159, (short)171, (short)172, (short)159, (short)173, (short)690, (short)690, (short)97, (short)97, (short)690, (short)174, (short)690, (short)690, (short)95, (short)95, (short)158, (short)159, (short)95, (short)690, (short)159, (short)159, (short)95, (short)159, (short)160, (short)160, (short)160, (short)160, (short)97, (short)97, (short)95, (short)95, (short)97, (short)95, (short)95, (short)95, (short)97, (short)161, (short)162, (short)690, (short)690, (short)162, (short)95, (short)186, (short)97, (short)97, (short)690, (short)97, (short)97, (short)97, (short)690, (short)185, (short)690, (short)161, (short)162, (short)690, (short)97, (short)162, (short)162, (short)690, (short)162, (short)80, (short)690, (short)81, (short)81, (short)81, (short)81, (short)187, (short)193, (short)189, (short)191, (short)190, (short)95, (short)188, (short)95, (short)95, (short)82, (short)194, (short)690, (short)95, (short)163, (short)163, (short)192, (short)195, (short)95, (short)690, (short)97, (short)196, (short)97, (short)97, (short)95, (short)95, (short)82, (short)97, (short)690, (short)95, (short)163, (short)163, (short)97, (short)163, (short)690, (short)690, (short)95, (short)95, (short)97, (short)97, (short)690, (short)163, (short)95, (short)97, (short)95, (short)690, (short)197, (short)95, (short)200, (short)198, (short)97, (short)97, (short)95, (short)690, (short)201, (short)202, (short)97, (short)95, (short)97, (short)199, (short)690, (short)97, (short)95, (short)690, (short)690, (short)690, (short)97, (short)203, (short)95, (short)690, (short)204, (short)97, (short)95, (short)95, (short)208, (short)207, (short)97, (short)175, (short)176, (short)177, (short)178, (short)179, (short)97, (short)205, (short)95, (short)180, (short)97, (short)97, (short)209, (short)206, (short)95, (short)690, (short)95, (short)181, (short)182, (short)183, (short)216, (short)184, (short)97, (short)213, (short)210, (short)690, (short)690, (short)95, (short)97, (short)211, (short)97, (short)212, (short)214, (short)95, (short)95, (short)95, (short)690, (short)690, (short)95, (short)215, (short)217, (short)97, (short)95, (short)218, (short)95, (short)95, (short)95, (short)97, (short)97, (short)97, (short)222, (short)220, (short)97, (short)219, (short)690, (short)690, (short)97, (short)221, (short)97, (short)97, (short)97, (short)690, (short)690, (short)95, (short)95, (short)690, (short)690, (short)690, (short)223, (short)227, (short)235, (short)690, (short)95, (short)690, (short)690, (short)224, (short)229, (short)97, (short)97, (short)225, (short)226, (short)231, (short)228, (short)690, (short)232, (short)236, (short)97, (short)237, (short)238, (short)95, (short)95, (short)690, (short)690, (short)239, (short)230, (short)233, (short)690, (short)234, (short)165, (short)165, (short)165, (short)165, (short)690, (short)97, (short)97, (short)159, (short)240, (short)243, (short)159, (short)690, (short)244, (short)247, (short)95, (short)247, (short)95, (short)241, (short)248, (short)248, (short)248, (short)248, (short)690, (short)159, (short)690, (short)242, (short)159, (short)159, (short)97, (short)159, (short)97, (short)251, (short)690, (short)251, (short)690, (short)246, (short)252, (short)252, (short)252, (short)252, (short)95, (short)95, (short)95, (short)95, (short)245, (short)160, (short)160, (short)160, (short)160, (short)162, (short)95, (short)690, (short)162, (short)690, (short)97, (short)97, (short)97, (short)97, (short)249, (short)250, (short)257, (short)690, (short)250, (short)259, (short)97, (short)162, (short)163, (short)163, (short)162, (short)162, (short)690, (short)162, (short)690, (short)690, (short)249, (short)250, (short)260, (short)690, (short)250, (short)250, (short)95, (short)250, (short)163, (short)163, (short)95, (short)163, (short)165, (short)165, (short)165, (short)165, (short)254, (short)254, (short)258, (short)163, (short)97, (short)690, (short)264, (short)95, (short)97, (short)95, (short)253, (short)95, (short)690, (short)253, (short)95, (short)690, (short)254, (short)254, (short)273, (short)254, (short)95, (short)97, (short)690, (short)97, (short)95, (short)97, (short)253, (short)254, (short)97, (short)253, (short)253, (short)690, (short)253, (short)267, (short)97, (short)95, (short)261, (short)95, (short)97, (short)690, (short)95, (short)95, (short)262, (short)263, (short)95, (short)265, (short)95, (short)95, (short)95, (short)97, (short)95, (short)97, (short)690, (short)270, (short)97, (short)97, (short)266, (short)95, (short)97, (short)269, (short)97, (short)97, (short)97, (short)271, (short)97, (short)95, (short)268, (short)690, (short)95, (short)690, (short)690, (short)97, (short)690, (short)272, (short)95, (short)278, (short)690, (short)275, (short)277, (short)97, (short)95, (short)280, (short)97, (short)276, (short)274, (short)690, (short)281, (short)95, (short)97, (short)95, (short)95, (short)95, (short)95, (short)279, (short)97, (short)690, (short)690, (short)690, (short)95, (short)282, (short)286, (short)97, (short)283, (short)97, (short)97, (short)97, (short)97, (short)95, (short)690, (short)284, (short)285, (short)287, (short)97, (short)690, (short)95, (short)289, (short)95, (short)690, (short)690, (short)690, (short)95, (short)97, (short)288, (short)95, (short)290, (short)95, (short)292, (short)295, (short)97, (short)293, (short)97, (short)296, (short)291, (short)294, (short)97, (short)95, (short)95, (short)97, (short)95, (short)97, (short)690, (short)95, (short)95, (short)95, (short)690, (short)297, (short)298, (short)95, (short)95, (short)97, (short)97, (short)300, (short)97, (short)299, (short)305, (short)97, (short)97, (short)97, (short)309, (short)95, (short)690, (short)97, (short)97, (short)95, (short)95, (short)95, (short)95, (short)248, (short)248, (short)248, (short)248, (short)95, (short)690, (short)97, (short)301, (short)95, (short)95, (short)97, (short)97, (short)97, (short)97, (short)304, (short)306, (short)307, (short)302, (short)97, (short)308, (short)303, (short)95, (short)97, (short)97, (short)690, (short)95, (short)95, (short)690, (short)95, (short)690, (short)95, (short)95, (short)690, (short)690, (short)95, (short)97, (short)95, (short)95, (short)314, (short)97, (short)97, (short)313, (short)97, (short)312, (short)97, (short)97, (short)311, (short)310, (short)97, (short)95, (short)97, (short)97, (short)95, (short)690, (short)95, (short)95, (short)95, (short)315, (short)690, (short)690, (short)690, (short)95, (short)316, (short)97, (short)95, (short)319, (short)97, (short)321, (short)97, (short)97, (short)97, (short)690, (short)317, (short)318, (short)324, (short)97, (short)95, (short)690, (short)97, (short)95, (short)95, (short)320, (short)690, (short)690, (short)322, (short)323, (short)95, (short)690, (short)690, (short)325, (short)97, (short)327, (short)95, (short)97, (short)97, (short)248, (short)248, (short)248, (short)248, (short)330, (short)97, (short)326, (short)332, (short)95, (short)329, (short)690, (short)97, (short)328, (short)95, (short)159, (short)690, (short)333, (short)159, (short)336, (short)331, (short)336, (short)334, (short)97, (short)337, (short)337, (short)337, (short)337, (short)97, (short)690, (short)250, (short)159, (short)335, (short)250, (short)159, (short)159, (short)690, (short)159, (short)252, (short)252, (short)252, (short)252, (short)252, (short)252, (short)252, (short)252, (short)250, (short)95, (short)253, (short)250, (short)250, (short)253, (short)250, (short)345, (short)690, (short)338, (short)162, (short)95, (short)690, (short)162, (short)95, (short)97, (short)690, (short)95, (short)253, (short)254, (short)254, (short)253, (short)253, (short)95, (short)253, (short)97, (short)162, (short)95, (short)97, (short)162, (short)162, (short)97, (short)162, (short)95, (short)95, (short)254, (short)254, (short)97, (short)254, (short)95, (short)95, (short)97, (short)95, (short)690, (short)95, (short)95, (short)254, (short)97, (short)97, (short)95, (short)690, (short)339, (short)340, (short)97, (short)97, (short)95, (short)97, (short)341, (short)97, (short)97, (short)95, (short)95, (short)690, (short)97, (short)342, (short)95, (short)95, (short)690, (short)95, (short)97, (short)344, (short)347, (short)690, (short)95, (short)97, (short)97, (short)343, (short)95, (short)690, (short)97, (short)97, (short)346, (short)97, (short)353, (short)95, (short)352, (short)349, (short)97, (short)690, (short)690, (short)95, (short)97, (short)348, (short)350, (short)351, (short)95, (short)95, (short)95, (short)97, (short)354, (short)356, (short)355, (short)358, (short)357, (short)97, (short)95, (short)95, (short)95, (short)95, (short)97, (short)97, (short)97, (short)95, (short)95, (short)95, (short)359, (short)95, (short)95, (short)360, (short)97, (short)97, (short)97, (short)97, (short)95, (short)95, (short)690, (short)97, (short)97, (short)97, (short)95, (short)97, (short)97, (short)95, (short)364, (short)690, (short)690, (short)95, (short)97, (short)97, (short)363, (short)95, (short)95, (short)361, (short)97, (short)365, (short)366, (short)97, (short)95, (short)362, (short)367, (short)97, (short)690, (short)95, (short)95, (short)97, (short)97, (short)369, (short)690, (short)95, (short)95, (short)368, (short)97, (short)95, (short)372, (short)95, (short)370, (short)97, (short)97, (short)95, (short)373, (short)380, (short)371, (short)97, (short)97, (short)690, (short)690, (short)97, (short)95, (short)97, (short)95, (short)374, (short)95, (short)97, (short)95, (short)95, (short)95, (short)378, (short)95, (short)375, (short)376, (short)95, (short)97, (short)377, (short)97, (short)95, (short)97, (short)95, (short)97, (short)97, (short)97, (short)379, (short)97, (short)690, (short)383, (short)97, (short)95, (short)381, (short)95, (short)97, (short)95, (short)97, (short)95, (short)95, (short)95, (short)382, (short)690, (short)384, (short)690, (short)95, (short)97, (short)95, (short)97, (short)385, (short)97, (short)95, (short)97, (short)97, (short)97, (short)95, (short)391, (short)95, (short)394, (short)97, (short)386, (short)97, (short)388, (short)389, (short)95, (short)97, (short)387, (short)390, (short)95, (short)97, (short)392, (short)97, (short)95, (short)396, (short)95, (short)393, (short)398, (short)399, (short)97, (short)690, (short)690, (short)95, (short)97, (short)400, (short)397, (short)690, (short)97, (short)690, (short)97, (short)690, (short)395, (short)337, (short)337, (short)337, (short)337, (short)97, (short)402, (short)690, (short)95, (short)401, (short)690, (short)337, (short)337, (short)337, (short)337, (short)95, (short)95, (short)690, (short)95, (short)95, (short)95, (short)403, (short)97, (short)406, (short)405, (short)250, (short)95, (short)690, (short)250, (short)97, (short)97, (short)404, (short)97, (short)97, (short)97, (short)95, (short)95, (short)95, (short)690, (short)95, (short)97, (short)250, (short)95, (short)690, (short)250, (short)250, (short)95, (short)250, (short)95, (short)97, (short)97, (short)97, (short)410, (short)97, (short)407, (short)95, (short)97, (short)409, (short)408, (short)418, (short)97, (short)95, (short)97, (short)413, (short)95, (short)95, (short)412, (short)95, (short)690, (short)97, (short)411, (short)690, (short)95, (short)690, (short)95, (short)97, (short)416, (short)95, (short)97, (short)97, (short)690, (short)97, (short)415, (short)95, (short)690, (short)417, (short)97, (short)414, (short)97, (short)95, (short)95, (short)97, (short)419, (short)690, (short)422, (short)95, (short)420, (short)97, (short)421, (short)423, (short)95, (short)690, (short)95, (short)97, (short)97, (short)95, (short)95, (short)426, (short)95, (short)97, (short)427, (short)95, (short)95, (short)424, (short)97, (short)425, (short)97, (short)428, (short)95, (short)97, (short)97, (short)95, (short)97, (short)95, (short)690, (short)97, (short)97, (short)690, (short)95, (short)95, (short)430, (short)95, (short)97, (short)690, (short)95, (short)97, (short)690, (short)97, (short)429, (short)95, (short)95, (short)432, (short)97, (short)97, (short)95, (short)97, (short)431, (short)435, (short)97, (short)690, (short)436, (short)433, (short)434, (short)97, (short)97, (short)95, (short)95, (short)690, (short)97, (short)95, (short)439, (short)95, (short)437, (short)441, (short)690, (short)95, (short)95, (short)95, (short)438, (short)97, (short)97, (short)440, (short)95, (short)97, (short)443, (short)97, (short)450, (short)95, (short)444, (short)97, (short)97, (short)97, (short)95, (short)95, (short)442, (short)95, (short)97, (short)95, (short)95, (short)95, (short)95, (short)97, (short)95, (short)95, (short)95, (short)690, (short)97, (short)97, (short)448, (short)97, (short)95, (short)97, (short)97, (short)97, (short)97, (short)445, (short)97, (short)97, (short)97, (short)446, (short)447, (short)690, (short)95, (short)690, (short)97, (short)451, (short)95, (short)95, (short)449, (short)690, (short)453, (short)95, (short)455, (short)454, (short)457, (short)452, (short)97, (short)459, (short)95, (short)95, (short)97, (short)97, (short)460, (short)456, (short)690, (short)97, (short)95, (short)690, (short)690, (short)461, (short)95, (short)458, (short)97, (short)97, (short)95, (short)690, (short)462, (short)95, (short)464, (short)95, (short)97, (short)463, (short)465, (short)95, (short)97, (short)95, (short)467, (short)95, (short)97, (short)466, (short)95, (short)97, (short)95, (short)97, (short)690, (short)95, (short)95, (short)97, (short)468, (short)97, (short)690, (short)97, (short)479, (short)95, (short)97, (short)95, (short)97, (short)95, (short)471, (short)97, (short)97, (short)95, (short)95, (short)95, (short)469, (short)690, (short)95, (short)97, (short)470, (short)97, (short)472, (short)97, (short)95, (short)95, (short)690, (short)97, (short)97, (short)97, (short)690, (short)474, (short)97, (short)95, (short)473, (short)690, (short)95, (short)95, (short)97, (short)97, (short)475, (short)476, (short)477, (short)95, (short)481, (short)478, (short)95, (short)97, (short)482, (short)480, (short)97, (short)97, (short)690, (short)95, (short)486, (short)95, (short)483, (short)97, (short)95, (short)690, (short)97, (short)690, (short)484, (short)489, (short)487, (short)490, (short)485, (short)97, (short)488, (short)97, (short)95, (short)690, (short)97, (short)491, (short)690, (short)492, (short)95, (short)95, (short)95, (short)95, (short)690, (short)495, (short)95, (short)95, (short)97, (short)497, (short)95, (short)493, (short)494, (short)95, (short)97, (short)97, (short)97, (short)97, (short)496, (short)95, (short)97, (short)97, (short)95, (short)95, (short)97, (short)95, (short)95, (short)97, (short)95, (short)690, (short)498, (short)95, (short)95, (short)97, (short)690, (short)690, (short)97, (short)97, (short)95, (short)97, (short)97, (short)95, (short)97, (short)499, (short)690, (short)97, (short)97, (short)95, (short)502, (short)500, (short)690, (short)690, (short)97, (short)95, (short)95, (short)97, (short)501, (short)95, (short)503, (short)95, (short)95, (short)97, (short)95, (short)95, (short)505, (short)506, (short)95, (short)97, (short)97, (short)95, (short)95, (short)97, (short)95, (short)97, (short)97, (short)504, (short)97, (short)97, (short)95, (short)690, (short)97, (short)690, (short)95, (short)97, (short)97, (short)95, (short)97, (short)95, (short)95, (short)690, (short)95, (short)690, (short)97, (short)507, (short)690, (short)510, (short)97, (short)690, (short)95, (short)97, (short)95, (short)97, (short)97, (short)512, (short)97, (short)513, (short)508, (short)95, (short)516, (short)509, (short)690, (short)511, (short)97, (short)95, (short)97, (short)514, (short)515, (short)518, (short)95, (short)690, (short)690, (short)97, (short)95, (short)95, (short)520, (short)95, (short)95, (short)97, (short)95, (short)95, (short)95, (short)95, (short)97, (short)521, (short)519, (short)517, (short)97, (short)97, (short)95, (short)97, (short)97, (short)95, (short)97, (short)97, (short)97, (short)97, (short)95, (short)690, (short)95, (short)690, (short)95, (short)690, (short)97, (short)95, (short)690, (short)97, (short)95, (short)522, (short)690, (short)690, (short)97, (short)524, (short)97, (short)526, (short)97, (short)523, (short)525, (short)97, (short)528, (short)95, (short)97, (short)690, (short)527, (short)529, (short)530, (short)95, (short)95, (short)690, (short)95, (short)95, (short)532, (short)533, (short)95, (short)97, (short)531, (short)534, (short)95, (short)95, (short)95, (short)97, (short)97, (short)535, (short)97, (short)97, (short)690, (short)538, (short)97, (short)95, (short)95, (short)536, (short)97, (short)97, (short)97, (short)95, (short)537, (short)95, (short)95, (short)95, (short)539, (short)95, (short)690, (short)97, (short)97, (short)95, (short)95, (short)95, (short)95, (short)97, (short)95, (short)97, (short)97, (short)97, (short)95, (short)97, (short)542, (short)543, (short)95, (short)97, (short)97, (short)97, (short)97, (short)95, (short)97, (short)540, (short)95, (short)95, (short)97, (short)541, (short)95, (short)95, (short)97, (short)95, (short)690, (short)690, (short)547, (short)97, (short)690, (short)690, (short)97, (short)97, (short)550, (short)690, (short)97, (short)97, (short)545, (short)97, (short)544, (short)552, (short)546, (short)95, (short)551, (short)548, (short)95, (short)95, (short)95, (short)549, (short)690, (short)95, (short)95, (short)95, (short)95, (short)690, (short)553, (short)97, (short)95, (short)555, (short)97, (short)97, (short)97, (short)95, (short)558, (short)97, (short)97, (short)97, (short)97, (short)554, (short)690, (short)557, (short)97, (short)95, (short)95, (short)95, (short)556, (short)97, (short)95, (short)95, (short)560, (short)95, (short)562, (short)690, (short)561, (short)690, (short)559, (short)97, (short)97, (short)97, (short)95, (short)95, (short)97, (short)97, (short)95, (short)97, (short)95, (short)563, (short)690, (short)564, (short)566, (short)690, (short)95, (short)565, (short)97, (short)97, (short)95, (short)95, (short)97, (short)95, (short)97, (short)95, (short)571, (short)690, (short)690, (short)568, (short)97, (short)690, (short)95, (short)95, (short)97, (short)97, (short)95, (short)97, (short)573, (short)97, (short)567, (short)569, (short)572, (short)95, (short)690, (short)570, (short)97, (short)97, (short)95, (short)95, (short)97, (short)95, (short)576, (short)690, (short)578, (short)577, (short)95, (short)97, (short)574, (short)95, (short)95, (short)575, (short)97, (short)97, (short)95, (short)97, (short)690, (short)579, (short)95, (short)95, (short)97, (short)690, (short)95, (short)97, (short)97, (short)95, (short)690, (short)95, (short)97, (short)95, (short)581, (short)95, (short)97, (short)97, (short)95, (short)580, (short)97, (short)690, (short)582, (short)97, (short)584, (short)97, (short)95, (short)97, (short)586, (short)97, (short)95, (short)690, (short)97, (short)690, (short)690, (short)587, (short)95, (short)589, (short)95, (short)95, (short)97, (short)95, (short)95, (short)583, (short)97, (short)591, (short)585, (short)592, (short)593, (short)690, (short)97, (short)588, (short)97, (short)97, (short)95, (short)97, (short)97, (short)690, (short)95, (short)590, (short)95, (short)596, (short)95, (short)594, (short)690, (short)597, (short)95, (short)95, (short)97, (short)95, (short)95, (short)595, (short)97, (short)95, (short)97, (short)95, (short)97, (short)599, (short)600, (short)598, (short)97, (short)97, (short)95, (short)97, (short)97, (short)690, (short)95, (short)97, (short)95, (short)97, (short)690, (short)601, (short)95, (short)95, (short)610, (short)690, (short)97, (short)95, (short)690, (short)603, (short)97, (short)95, (short)97, (short)602, (short)604, (short)95, (short)97, (short)97, (short)95, (short)605, (short)95, (short)97, (short)606, (short)95, (short)95, (short)97, (short)607, (short)95, (short)95, (short)97, (short)95, (short)690, (short)97, (short)95, (short)97, (short)608, (short)95, (short)97, (short)97, (short)690, (short)690, (short)97, (short)97, (short)690, (short)97, (short)612, (short)95, (short)97, (short)95, (short)95, (short)97, (short)611, (short)613, (short)609, (short)614, (short)95, (short)95, (short)615, (short)95, (short)95, (short)97, (short)95, (short)97, (short)97, (short)690, (short)95, (short)95, (short)95, (short)690, (short)97, (short)97, (short)617, (short)97, (short)97, (short)618, (short)97, (short)690, (short)690, (short)95, (short)97, (short)97, (short)97, (short)616, (short)95, (short)690, (short)620, (short)690, (short)690, (short)95, (short)690, (short)619, (short)623, (short)97, (short)95, (short)95, (short)625, (short)627, (short)97, (short)621, (short)626, (short)622, (short)630, (short)97, (short)624, (short)95, (short)95, (short)95, (short)97, (short)97, (short)95, (short)95, (short)95, (short)631, (short)95, (short)95, (short)95, (short)95, (short)632, (short)97, (short)97, (short)97, (short)95, (short)95, (short)97, (short)97, (short)97, (short)95, (short)97, (short)97, (short)97, (short)97, (short)95, (short)95, (short)95, (short)690, (short)97, (short)97, (short)95, (short)95, (short)633, (short)97, (short)690, (short)634, (short)690, (short)95, (short)97, (short)97, (short)97, (short)637, (short)642, (short)644, (short)97, (short)97, (short)643, (short)640, (short)635, (short)645, (short)636, (short)97, (short)95, (short)95, (short)95, (short)638, (short)95, (short)639, (short)95, (short)95, (short)641, (short)648, (short)95, (short)690, (short)647, (short)690, (short)97, (short)97, (short)97, (short)690, (short)97, (short)95, (short)97, (short)97, (short)95, (short)95, (short)97, (short)646, (short)95, (short)650, (short)690, (short)95, (short)95, (short)649, (short)95, (short)97, (short)95, (short)95, (short)97, (short)97, (short)95, (short)651, (short)97, (short)95, (short)653, (short)97, (short)97, (short)652, (short)97, (short)95, (short)97, (short)97, (short)95, (short)95, (short)97, (short)654, (short)95, (short)97, (short)655, (short)690, (short)95, (short)690, (short)95, (short)97, (short)95, (short)95, (short)97, (short)97, (short)690, (short)95, (short)97, (short)95, (short)656, (short)657, (short)97, (short)659, (short)97, (short)95, (short)97, (short)97, (short)662, (short)95, (short)660, (short)97, (short)95, (short)97, (short)658, (short)661, (short)690, (short)690, (short)663, (short)97, (short)95, (short)690, (short)690, (short)97, (short)690, (short)95, (short)97, (short)95, (short)95, (short)664, (short)665, (short)667, (short)95, (short)95, (short)97, (short)666, (short)670, (short)95, (short)672, (short)97, (short)668, (short)97, (short)97, (short)669, (short)95, (short)95, (short)97, (short)97, (short)671, (short)95, (short)690, (short)97, (short)95, (short)95, (short)95, (short)690, (short)95, (short)95, (short)97, (short)97, (short)95, (short)674, (short)673, (short)97, (short)677, (short)690, (short)97, (short)97, (short)97, (short)675, (short)97, (short)97, (short)95, (short)95, (short)97, (short)95, (short)95, (short)690, (short)690, (short)680, (short)690, (short)679, (short)678, (short)676, (short)681, (short)690, (short)97, (short)97, (short)690, (short)97, (short)97, (short)690, (short)690, (short)684, (short)690, (short)686, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)683, (short)682, (short)688, (short)690, (short)690, (short)685, (short)689, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)687, (short)60, (short)60, (short)60, (short)60, (short)60, (short)60, (short)60, (short)67, (short)67, (short)690, (short)67, (short)67, (short)67, (short)67, (short)96, (short)690, (short)690, (short)96, (short)96, (short)96, (short)166, (short)166, (short)167, (short)167, (short)255, (short)255, (short)255, (short)256, (short)256, (short)629, (short)629, (short)629, (short)629, (short)3, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690
};

static const short int yy_chk[2443] = 
{
(short)0, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)9, (short)12, (short)12, (short)13, (short)18, (short)56, (short)21, (short)20, (short)21, (short)21, (short)21, (short)21, (short)29, (short)29, (short)22, (short)629, (short)18, (short)20, (short)20, (short)22, (short)13, (short)610, (short)67, (short)24, (short)24, (short)24, (short)24, (short)22, (short)25, (short)27, (short)100, (short)31, (short)25, (short)97, (short)32, (short)9, (short)23, (short)95, (short)23, (short)23, (short)23, (short)23, (short)24, (short)94, (short)27, (short)31, (short)27, (short)27, (short)32, (short)56, (short)39, (short)23, (short)67, (short)90, (short)40, (short)23, (short)23, (short)23, (short)33, (short)38, (short)75, (short)46, (short)33, (short)33, (short)39, (short)37, (short)62, (short)23, (short)40, (short)36, (short)24, (short)23, (short)23, (short)38, (short)23, (short)46, (short)33, (short)60, (short)43, (short)37, (short)41, (short)28, (short)23, (short)32, (short)42, (short)23, (short)37, (short)37, (short)45, (short)40, (short)17, (short)37, (short)43, (short)14, (short)41, (short)44, (short)40, (short)68, (short)42, (short)37, (short)40, (short)39, (short)45, (short)40, (short)37, (short)68, (short)48, (short)38, (short)37, (short)44, (short)46, (short)38, (short)60, (short)38, (short)8, (short)41, (short)41, (short)37, (short)3, (short)41, (short)48, (short)43, (short)0, (short)47, (short)43, (short)49, (short)41, (short)43, (short)45, (short)41, (short)42, (short)50, (short)42, (short)51, (short)44, (short)45, (short)45, (short)47, (short)52, (short)49, (short)45, (short)42, (short)96, (short)0, (short)44, (short)50, (short)0, (short)51, (short)99, (short)53, (short)0, (short)0, (short)52, (short)54, (short)0, (short)130, (short)96, (short)48, (short)47, (short)0, (short)48, (short)0, (short)47, (short)53, (short)49, (short)98, (short)102, (short)54, (short)103, (short)130, (short)50, (short)0, (short)0, (short)50, (short)50, (short)51, (short)104, (short)83, (short)83, (short)98, (short)102, (short)52, (short)103, (short)99, (short)50, (short)50, (short)52, (short)50, (short)54, (short)0, (short)104, (short)51, (short)53, (short)83, (short)83, (short)54, (short)83, (short)0, (short)53, (short)76, (short)76, (short)76, (short)76, (short)82, (short)83, (short)82, (short)106, (short)107, (short)82, (short)82, (short)82, (short)82, (short)76, (short)76, (short)98, (short)102, (short)76, (short)103, (short)0, (short)0, (short)106, (short)107, (short)0, (short)104, (short)0, (short)0, (short)108, (short)109, (short)76, (short)76, (short)111, (short)0, (short)76, (short)76, (short)110, (short)76, (short)80, (short)80, (short)80, (short)80, (short)108, (short)109, (short)113, (short)112, (short)111, (short)114, (short)117, (short)116, (short)110, (short)80, (short)80, (short)0, (short)0, (short)80, (short)115, (short)107, (short)113, (short)112, (short)0, (short)114, (short)117, (short)116, (short)0, (short)106, (short)0, (short)80, (short)80, (short)0, (short)115, (short)80, (short)80, (short)0, (short)80, (short)81, (short)0, (short)81, (short)81, (short)81, (short)81, (short)108, (short)114, (short)110, (short)112, (short)111, (short)118, (short)109, (short)119, (short)120, (short)81, (short)115, (short)0, (short)121, (short)81, (short)81, (short)113, (short)116, (short)122, (short)0, (short)118, (short)117, (short)119, (short)120, (short)125, (short)126, (short)81, (short)121, (short)0, (short)123, (short)81, (short)81, (short)122, (short)81, (short)0, (short)0, (short)124, (short)127, (short)125, (short)126, (short)0, (short)81, (short)105, (short)123, (short)133, (short)0, (short)118, (short)128, (short)119, (short)118, (short)124, (short)127, (short)129, (short)0, (short)119, (short)120, (short)105, (short)131, (short)133, (short)118, (short)0, (short)128, (short)132, (short)0, (short)0, (short)0, (short)129, (short)121, (short)134, (short)0, (short)122, (short)131, (short)135, (short)136, (short)126, (short)125, (short)132, (short)105, (short)105, (short)105, (short)105, (short)105, (short)134, (short)123, (short)137, (short)105, (short)135, (short)136, (short)127, (short)124, (short)138, (short)0, (short)140, (short)105, (short)105, (short)105, (short)133, (short)105, (short)137, (short)132, (short)128, (short)0, (short)0, (short)139, (short)138, (short)129, (short)140, (short)131, (short)132, (short)141, (short)144, (short)142, (short)0, (short)0, (short)147, (short)132, (short)134, (short)139, (short)145, (short)135, (short)146, (short)148, (short)143, (short)141, (short)144, (short)142, (short)138, (short)137, (short)147, (short)136, (short)0, (short)0, (short)145, (short)137, (short)146, (short)148, (short)143, (short)0, (short)0, (short)149, (short)151, (short)0, (short)0, (short)0, (short)139, (short)140, (short)144, (short)0, (short)150, (short)0, (short)0, (short)139, (short)142, (short)149, (short)151, (short)139, (short)139, (short)143, (short)141, (short)0, (short)143, (short)145, (short)150, (short)146, (short)147, (short)152, (short)153, (short)0, (short)0, (short)148, (short)142, (short)143, (short)0, (short)143, (short)164, (short)164, (short)164, (short)164, (short)0, (short)152, (short)153, (short)159, (short)149, (short)151, (short)159, (short)0, (short)151, (short)158, (short)171, (short)158, (short)173, (short)149, (short)158, (short)158, (short)158, (short)158, (short)0, (short)159, (short)0, (short)150, (short)159, (short)159, (short)171, (short)159, (short)173, (short)161, (short)0, (short)161, (short)0, (short)153, (short)161, (short)161, (short)161, (short)161, (short)189, (short)174, (short)176, (short)172, (short)152, (short)160, (short)160, (short)160, (short)160, (short)162, (short)183, (short)0, (short)162, (short)0, (short)189, (short)174, (short)176, (short)172, (short)160, (short)160, (short)171, (short)0, (short)160, (short)173, (short)183, (short)162, (short)163, (short)163, (short)162, (short)162, (short)0, (short)162, (short)0, (short)0, (short)160, (short)160, (short)174, (short)0, (short)160, (short)160, (short)175, (short)160, (short)163, (short)163, (short)178, (short)163, (short)165, (short)165, (short)165, (short)165, (short)166, (short)166, (short)172, (short)163, (short)175, (short)0, (short)176, (short)177, (short)178, (short)179, (short)165, (short)180, (short)0, (short)165, (short)181, (short)0, (short)166, (short)166, (short)183, (short)166, (short)182, (short)177, (short)0, (short)179, (short)185, (short)180, (short)165, (short)166, (short)181, (short)165, (short)165, (short)0, (short)165, (short)178, (short)182, (short)184, (short)175, (short)186, (short)185, (short)0, (short)187, (short)188, (short)175, (short)175, (short)190, (short)177, (short)191, (short)192, (short)193, (short)184, (short)194, (short)186, (short)0, (short)181, (short)187, (short)188, (short)177, (short)195, (short)190, (short)180, (short)191, (short)192, (short)193, (short)182, (short)194, (short)196, (short)179, (short)0, (short)197, (short)0, (short)0, (short)195, (short)0, (short)182, (short)198, (short)188, (short)0, (short)185, (short)187, (short)196, (short)199, (short)191, (short)197, (short)186, (short)184, (short)0, (short)192, (short)201, (short)198, (short)200, (short)202, (short)203, (short)204, (short)190, (short)199, (short)0, (short)0, (short)0, (short)205, (short)193, (short)196, (short)201, (short)194, (short)200, (short)202, (short)203, (short)204, (short)206, (short)0, (short)195, (short)195, (short)197, (short)205, (short)0, (short)207, (short)199, (short)208, (short)0, (short)0, (short)0, (short)209, (short)206, (short)198, (short)210, (short)200, (short)211, (short)201, (short)203, (short)207, (short)202, (short)208, (short)204, (short)200, (short)202, (short)209, (short)212, (short)213, (short)210, (short)214, (short)211, (short)0, (short)215, (short)217, (short)216, (short)0, (short)205, (short)206, (short)218, (short)219, (short)212, (short)213, (short)208, (short)214, (short)207, (short)215, (short)215, (short)217, (short)216, (short)219, (short)220, (short)0, (short)218, (short)219, (short)221, (short)222, (short)223, (short)224, (short)247, (short)247, (short)247, (short)247, (short)225, (short)0, (short)220, (short)211, (short)226, (short)227, (short)221, (short)222, (short)223, (short)224, (short)214, (short)216, (short)217, (short)212, (short)225, (short)218, (short)213, (short)228, (short)226, (short)227, (short)0, (short)229, (short)230, (short)0, (short)231, (short)0, (short)232, (short)234, (short)0, (short)0, (short)233, (short)228, (short)236, (short)235, (short)224, (short)229, (short)230, (short)223, (short)231, (short)222, (short)232, (short)234, (short)221, (short)220, (short)233, (short)237, (short)236, (short)235, (short)238, (short)0, (short)239, (short)240, (short)241, (short)225, (short)0, (short)0, (short)0, (short)242, (short)226, (short)237, (short)243, (short)230, (short)238, (short)232, (short)239, (short)240, (short)241, (short)0, (short)228, (short)229, (short)235, (short)242, (short)244, (short)0, (short)243, (short)245, (short)246, (short)231, (short)0, (short)0, (short)233, (short)234, (short)256, (short)0, (short)0, (short)236, (short)244, (short)238, (short)257, (short)245, (short)246, (short)248, (short)248, (short)248, (short)248, (short)241, (short)256, (short)237, (short)243, (short)258, (short)240, (short)0, (short)257, (short)239, (short)265, (short)248, (short)0, (short)244, (short)248, (short)249, (short)242, (short)249, (short)245, (short)258, (short)249, (short)249, (short)249, (short)249, (short)265, (short)0, (short)250, (short)248, (short)246, (short)250, (short)248, (short)248, (short)0, (short)248, (short)251, (short)251, (short)251, (short)251, (short)252, (short)252, (short)252, (short)252, (short)250, (short)259, (short)253, (short)250, (short)250, (short)253, (short)250, (short)265, (short)0, (short)258, (short)252, (short)260, (short)0, (short)252, (short)261, (short)259, (short)0, (short)262, (short)253, (short)254, (short)254, (short)253, (short)253, (short)263, (short)253, (short)260, (short)252, (short)264, (short)261, (short)252, (short)252, (short)262, (short)252, (short)266, (short)267, (short)254, (short)254, (short)263, (short)254, (short)268, (short)269, (short)264, (short)270, (short)0, (short)271, (short)272, (short)254, (short)266, (short)267, (short)273, (short)0, (short)259, (short)260, (short)268, (short)269, (short)274, (short)270, (short)261, (short)271, (short)272, (short)276, (short)275, (short)0, (short)273, (short)262, (short)277, (short)278, (short)0, (short)279, (short)274, (short)264, (short)267, (short)0, (short)280, (short)276, (short)275, (short)263, (short)281, (short)0, (short)277, (short)278, (short)266, (short)279, (short)272, (short)282, (short)271, (short)269, (short)280, (short)0, (short)0, (short)283, (short)281, (short)268, (short)269, (short)270, (short)284, (short)285, (short)286, (short)282, (short)273, (short)275, (short)274, (short)277, (short)276, (short)283, (short)287, (short)290, (short)288, (short)291, (short)284, (short)285, (short)286, (short)292, (short)289, (short)293, (short)278, (short)294, (short)296, (short)280, (short)287, (short)290, (short)288, (short)291, (short)295, (short)297, (short)0, (short)292, (short)289, (short)293, (short)298, (short)294, (short)296, (short)299, (short)286, (short)0, (short)0, (short)300, (short)295, (short)297, (short)285, (short)301, (short)302, (short)283, (short)298, (short)287, (short)288, (short)299, (short)303, (short)284, (short)289, (short)300, (short)0, (short)304, (short)306, (short)301, (short)302, (short)291, (short)0, (short)305, (short)307, (short)290, (short)303, (short)308, (short)294, (short)309, (short)292, (short)304, (short)306, (short)310, (short)295, (short)305, (short)293, (short)305, (short)307, (short)0, (short)0, (short)308, (short)311, (short)309, (short)312, (short)298, (short)313, (short)310, (short)314, (short)315, (short)316, (short)303, (short)317, (short)299, (short)300, (short)318, (short)311, (short)302, (short)312, (short)319, (short)313, (short)321, (short)314, (short)315, (short)316, (short)304, (short)317, (short)0, (short)310, (short)318, (short)320, (short)306, (short)322, (short)319, (short)323, (short)321, (short)324, (short)325, (short)326, (short)308, (short)0, (short)311, (short)0, (short)327, (short)320, (short)328, (short)322, (short)312, (short)323, (short)329, (short)324, (short)325, (short)326, (short)330, (short)318, (short)331, (short)321, (short)327, (short)313, (short)328, (short)315, (short)316, (short)332, (short)329, (short)314, (short)317, (short)333, (short)330, (short)319, (short)331, (short)334, (short)323, (short)335, (short)320, (short)325, (short)326, (short)332, (short)0, (short)0, (short)338, (short)333, (short)327, (short)324, (short)0, (short)334, (short)0, (short)335, (short)0, (short)322, (short)336, (short)336, (short)336, (short)336, (short)338, (short)330, (short)0, (short)339, (short)329, (short)0, (short)337, (short)337, (short)337, (short)337, (short)340, (short)341, (short)0, (short)342, (short)343, (short)344, (short)331, (short)339, (short)335, (short)334, (short)337, (short)345, (short)0, (short)337, (short)340, (short)341, (short)333, (short)342, (short)343, (short)344, (short)346, (short)347, (short)348, (short)0, (short)351, (short)345, (short)337, (short)349, (short)0, (short)337, (short)337, (short)350, (short)337, (short)352, (short)346, (short)347, (short)348, (short)342, (short)351, (short)339, (short)354, (short)349, (short)341, (short)340, (short)350, (short)350, (short)353, (short)352, (short)345, (short)355, (short)356, (short)344, (short)357, (short)0, (short)354, (short)343, (short)0, (short)358, (short)0, (short)359, (short)353, (short)348, (short)360, (short)355, (short)356, (short)0, (short)357, (short)347, (short)361, (short)0, (short)349, (short)358, (short)346, (short)359, (short)362, (short)363, (short)360, (short)351, (short)0, (short)354, (short)364, (short)352, (short)361, (short)353, (short)355, (short)365, (short)0, (short)366, (short)362, (short)363, (short)367, (short)368, (short)358, (short)369, (short)364, (short)359, (short)370, (short)371, (short)356, (short)365, (short)357, (short)366, (short)361, (short)372, (short)367, (short)368, (short)373, (short)369, (short)374, (short)0, (short)370, (short)371, (short)0, (short)375, (short)376, (short)364, (short)377, (short)372, (short)0, (short)378, (short)373, (short)0, (short)374, (short)363, (short)379, (short)380, (short)366, (short)375, (short)376, (short)381, (short)377, (short)365, (short)369, (short)378, (short)0, (short)370, (short)367, (short)368, (short)379, (short)380, (short)382, (short)383, (short)0, (short)381, (short)384, (short)373, (short)385, (short)371, (short)375, (short)0, (short)386, (short)387, (short)390, (short)372, (short)382, (short)383, (short)374, (short)388, (short)384, (short)378, (short)385, (short)387, (short)389, (short)379, (short)386, (short)387, (short)390, (short)391, (short)392, (short)377, (short)393, (short)388, (short)394, (short)396, (short)395, (short)398, (short)389, (short)397, (short)399, (short)401, (short)0, (short)391, (short)392, (short)385, (short)393, (short)402, (short)394, (short)396, (short)395, (short)398, (short)382, (short)397, (short)399, (short)401, (short)383, (short)384, (short)0, (short)400, (short)0, (short)402, (short)388, (short)404, (short)403, (short)386, (short)0, (short)391, (short)405, (short)393, (short)392, (short)395, (short)389, (short)400, (short)397, (short)406, (short)407, (short)404, (short)403, (short)398, (short)394, (short)0, (short)405, (short)408, (short)0, (short)0, (short)399, (short)409, (short)396, (short)406, (short)407, (short)410, (short)0, (short)400, (short)411, (short)402, (short)412, (short)408, (short)400, (short)403, (short)413, (short)409, (short)414, (short)405, (short)415, (short)410, (short)404, (short)418, (short)411, (short)416, (short)412, (short)0, (short)417, (short)419, (short)413, (short)407, (short)414, (short)0, (short)415, (short)418, (short)420, (short)418, (short)422, (short)416, (short)423, (short)410, (short)417, (short)419, (short)421, (short)424, (short)425, (short)408, (short)0, (short)426, (short)420, (short)409, (short)422, (short)411, (short)423, (short)427, (short)428, (short)0, (short)421, (short)424, (short)425, (short)0, (short)413, (short)426, (short)429, (short)412, (short)0, (short)430, (short)432, (short)427, (short)428, (short)414, (short)415, (short)416, (short)431, (short)420, (short)417, (short)433, (short)429, (short)421, (short)419, (short)430, (short)432, (short)0, (short)434, (short)425, (short)435, (short)422, (short)431, (short)436, (short)0, (short)433, (short)0, (short)423, (short)428, (short)426, (short)428, (short)424, (short)434, (short)427, (short)435, (short)437, (short)0, (short)436, (short)428, (short)0, (short)428, (short)438, (short)439, (short)440, (short)441, (short)0, (short)431, (short)442, (short)443, (short)437, (short)433, (short)444, (short)429, (short)430, (short)445, (short)438, (short)439, (short)440, (short)441, (short)432, (short)446, (short)442, (short)443, (short)447, (short)448, (short)444, (short)449, (short)450, (short)445, (short)451, (short)0, (short)434, (short)452, (short)453, (short)446, (short)0, (short)0, (short)447, (short)448, (short)454, (short)449, (short)450, (short)455, (short)451, (short)437, (short)0, (short)452, (short)453, (short)456, (short)445, (short)438, (short)0, (short)0, (short)454, (short)457, (short)458, (short)455, (short)441, (short)459, (short)446, (short)460, (short)461, (short)456, (short)462, (short)463, (short)449, (short)451, (short)464, (short)457, (short)458, (short)465, (short)466, (short)459, (short)467, (short)460, (short)461, (short)447, (short)462, (short)463, (short)468, (short)0, (short)464, (short)0, (short)469, (short)465, (short)466, (short)470, (short)467, (short)471, (short)472, (short)0, (short)473, (short)0, (short)468, (short)456, (short)0, (short)461, (short)469, (short)0, (short)474, (short)470, (short)475, (short)471, (short)472, (short)463, (short)473, (short)464, (short)457, (short)476, (short)467, (short)459, (short)0, (short)462, (short)474, (short)477, (short)475, (short)465, (short)466, (short)469, (short)479, (short)0, (short)0, (short)476, (short)478, (short)480, (short)472, (short)481, (short)482, (short)477, (short)483, (short)486, (short)484, (short)485, (short)479, (short)473, (short)470, (short)468, (short)478, (short)480, (short)487, (short)481, (short)482, (short)488, (short)483, (short)486, (short)484, (short)485, (short)489, (short)0, (short)490, (short)0, (short)491, (short)0, (short)487, (short)492, (short)0, (short)488, (short)493, (short)476, (short)0, (short)0, (short)489, (short)478, (short)490, (short)481, (short)491, (short)477, (short)480, (short)492, (short)483, (short)494, (short)493, (short)0, (short)482, (short)484, (short)485, (short)495, (short)496, (short)0, (short)497, (short)498, (short)488, (short)489, (short)499, (short)494, (short)487, (short)489, (short)500, (short)501, (short)502, (short)495, (short)496, (short)490, (short)497, (short)498, (short)0, (short)493, (short)499, (short)503, (short)504, (short)491, (short)500, (short)501, (short)502, (short)505, (short)492, (short)506, (short)507, (short)508, (short)494, (short)509, (short)0, (short)503, (short)504, (short)510, (short)511, (short)512, (short)514, (short)505, (short)515, (short)506, (short)507, (short)508, (short)513, (short)509, (short)501, (short)502, (short)516, (short)510, (short)511, (short)512, (short)514, (short)517, (short)515, (short)499, (short)518, (short)519, (short)513, (short)500, (short)520, (short)521, (short)516, (short)522, (short)0, (short)0, (short)508, (short)517, (short)0, (short)0, (short)518, (short)519, (short)511, (short)0, (short)520, (short)521, (short)505, (short)522, (short)504, (short)515, (short)506, (short)523, (short)513, (short)509, (short)524, (short)525, (short)526, (short)510, (short)0, (short)527, (short)528, (short)529, (short)530, (short)0, (short)516, (short)523, (short)531, (short)519, (short)524, (short)525, (short)526, (short)532, (short)522, (short)527, (short)528, (short)529, (short)530, (short)518, (short)0, (short)521, (short)531, (short)533, (short)535, (short)534, (short)520, (short)532, (short)536, (short)537, (short)524, (short)538, (short)526, (short)0, (short)525, (short)0, (short)523, (short)533, (short)535, (short)534, (short)539, (short)540, (short)536, (short)537, (short)541, (short)538, (short)542, (short)527, (short)0, (short)529, (short)532, (short)0, (short)543, (short)530, (short)539, (short)540, (short)544, (short)545, (short)541, (short)546, (short)542, (short)547, (short)536, (short)0, (short)0, (short)534, (short)543, (short)0, (short)548, (short)549, (short)544, (short)545, (short)550, (short)546, (short)539, (short)547, (short)533, (short)534, (short)537, (short)551, (short)0, (short)535, (short)548, (short)549, (short)552, (short)553, (short)550, (short)554, (short)542, (short)0, (short)544, (short)543, (short)555, (short)551, (short)540, (short)556, (short)557, (short)541, (short)552, (short)553, (short)558, (short)554, (short)0, (short)547, (short)559, (short)560, (short)555, (short)0, (short)561, (short)556, (short)557, (short)564, (short)0, (short)562, (short)558, (short)563, (short)550, (short)565, (short)559, (short)560, (short)566, (short)549, (short)561, (short)0, (short)553, (short)564, (short)555, (short)562, (short)567, (short)563, (short)557, (short)565, (short)568, (short)0, (short)566, (short)0, (short)0, (short)558, (short)569, (short)560, (short)570, (short)571, (short)567, (short)572, (short)574, (short)554, (short)568, (short)562, (short)556, (short)563, (short)564, (short)0, (short)569, (short)559, (short)570, (short)571, (short)573, (short)572, (short)574, (short)0, (short)575, (short)561, (short)576, (short)567, (short)577, (short)565, (short)0, (short)568, (short)579, (short)578, (short)573, (short)580, (short)582, (short)566, (short)575, (short)581, (short)576, (short)583, (short)577, (short)570, (short)571, (short)569, (short)579, (short)578, (short)584, (short)580, (short)582, (short)0, (short)585, (short)581, (short)586, (short)583, (short)0, (short)572, (short)587, (short)588, (short)587, (short)0, (short)584, (short)589, (short)0, (short)576, (short)585, (short)590, (short)586, (short)573, (short)578, (short)591, (short)587, (short)588, (short)592, (short)579, (short)593, (short)589, (short)581, (short)594, (short)595, (short)590, (short)584, (short)596, (short)597, (short)591, (short)598, (short)0, (short)592, (short)600, (short)593, (short)585, (short)599, (short)594, (short)595, (short)0, (short)0, (short)596, (short)597, (short)0, (short)598, (short)590, (short)601, (short)600, (short)602, (short)603, (short)599, (short)588, (short)592, (short)586, (short)593, (short)605, (short)604, (short)594, (short)606, (short)607, (short)601, (short)609, (short)602, (short)603, (short)0, (short)608, (short)613, (short)611, (short)0, (short)605, (short)604, (short)598, (short)606, (short)607, (short)599, (short)609, (short)0, (short)0, (short)612, (short)608, (short)613, (short)611, (short)597, (short)614, (short)0, (short)601, (short)0, (short)0, (short)615, (short)0, (short)600, (short)604, (short)612, (short)616, (short)617, (short)606, (short)609, (short)614, (short)602, (short)608, (short)603, (short)611, (short)615, (short)605, (short)618, (short)619, (short)620, (short)616, (short)617, (short)621, (short)622, (short)623, (short)612, (short)624, (short)625, (short)626, (short)627, (short)614, (short)618, (short)619, (short)620, (short)631, (short)630, (short)621, (short)622, (short)623, (short)632, (short)624, (short)625, (short)626, (short)627, (short)633, (short)634, (short)635, (short)0, (short)631, (short)630, (short)636, (short)637, (short)616, (short)632, (short)0, (short)617, (short)0, (short)638, (short)633, (short)634, (short)635, (short)621, (short)626, (short)627, (short)636, (short)637, (short)626, (short)624, (short)619, (short)630, (short)620, (short)638, (short)639, (short)640, (short)641, (short)622, (short)642, (short)623, (short)643, (short)644, (short)625, (short)635, (short)645, (short)0, (short)634, (short)0, (short)639, (short)640, (short)641, (short)0, (short)642, (short)647, (short)643, (short)644, (short)646, (short)648, (short)645, (short)633, (short)649, (short)637, (short)0, (short)650, (short)652, (short)636, (short)651, (short)647, (short)653, (short)654, (short)646, (short)648, (short)655, (short)639, (short)649, (short)656, (short)644, (short)650, (short)652, (short)643, (short)651, (short)657, (short)653, (short)654, (short)658, (short)659, (short)655, (short)644, (short)660, (short)656, (short)646, (short)0, (short)662, (short)0, (short)661, (short)657, (short)663, (short)664, (short)658, (short)659, (short)0, (short)665, (short)660, (short)666, (short)647, (short)648, (short)662, (short)651, (short)661, (short)667, (short)663, (short)664, (short)654, (short)668, (short)652, (short)665, (short)669, (short)666, (short)649, (short)653, (short)0, (short)0, (short)655, (short)667, (short)670, (short)0, (short)0, (short)668, (short)0, (short)671, (short)669, (short)672, (short)673, (short)657, (short)659, (short)661, (short)674, (short)675, (short)670, (short)660, (short)664, (short)676, (short)666, (short)671, (short)662, (short)672, (short)673, (short)663, (short)677, (short)678, (short)674, (short)675, (short)665, (short)679, (short)0, (short)676, (short)680, (short)681, (short)682, (short)0, (short)683, (short)684, (short)677, (short)678, (short)685, (short)669, (short)668, (short)679, (short)672, (short)0, (short)680, (short)681, (short)682, (short)670, (short)683, (short)684, (short)686, (short)687, (short)685, (short)689, (short)688, (short)0, (short)0, (short)677, (short)0, (short)675, (short)674, (short)671, (short)678, (short)0, (short)686, (short)687, (short)0, (short)689, (short)688, (short)0, (short)0, (short)682, (short)0, (short)684, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)681, (short)680, (short)686, (short)0, (short)0, (short)683, (short)688, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)685, (short)691, (short)691, (short)691, (short)691, (short)691, (short)691, (short)691, (short)692, (short)692, (short)0, (short)692, (short)692, (short)692, (short)692, (short)693, (short)0, (short)0, (short)693, (short)693, (short)693, (short)694, (short)694, (short)695, (short)695, (short)696, (short)696, (short)696, (short)697, (short)697, (short)698, (short)698, (short)698, (short)698, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690, (short)690
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
}while(yy_base[yy_current_state] != (short)2369);
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

