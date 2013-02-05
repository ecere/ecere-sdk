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

typedef unsigned int size_t;

void exit(int status);

void * calloc(size_t nmemb, size_t size);

void free(void * ptr);

void * malloc(size_t size);

void * realloc(void * ptr, size_t size);

long int strtol(const char * nptr, char ** endptr, int base);

long long int strtoll(const char * nptr, char ** endptr, int base);

unsigned long long int strtoull(const char * nptr, char ** endptr, int base);

typedef __builtin_va_list __gnuc_va_list;

typedef __gnuc_va_list va_list;

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

static const short int yy_accept[661] = 
{
(short)0, (short)106, (short)106, (short)167, (short)165, (short)164, (short)163, (short)162, (short)149, (short)165, (short)1, (short)161, (short)155, (short)148, (short)165, (short)143, (short)144, (short)153, (short)152, (short)140, (short)151, (short)147, (short)154, (short)109, (short)109, (short)141, (short)137, (short)156, (short)142, (short)157, (short)160, (short)106, (short)106, (short)145, (short)146, (short)158, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)138, (short)159, (short)139, (short)150, (short)136, (short)0, (short)114, (short)0, (short)122, (short)139, (short)131, (short)123, (short)0, (short)0, (short)120, (short)128, (short)118, (short)129, (short)119, (short)130, (short)0, (short)112, (short)2, (short)3, (short)121, (short)113, (short)108, (short)0, (short)109, (short)0, (short)109, (short)106, (short)146, (short)138, (short)145, (short)127, (short)133, (short)135, (short)134, (short)126, (short)0, (short)106, (short)0, (short)0, (short)0, (short)124, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)11, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)19, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)125, (short)132, (short)110, (short)115, (short)0, (short)112, (short)112, (short)0, (short)113, (short)108, (short)0, (short)111, (short)107, (short)106, (short)117, (short)116, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)86, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)17, (short)44, (short)106, (short)106, (short)106, (short)106, (short)20, (short)106, (short)106, (short)106, (short)50, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)43, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)0, (short)112, (short)0, (short)112, (short)0, (short)113, (short)111, (short)107, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)4, (short)106, (short)6, (short)7, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)13, (short)14, (short)106, (short)106, (short)106, (short)18, (short)106, (short)106, (short)106, (short)106, (short)106, (short)22, (short)106, (short)51, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)21, (short)106, (short)106, (short)106, (short)37, (short)106, (short)106, (short)106, (short)0, (short)112, (short)106, (short)87, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)5, (short)46, (short)8, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)16, (short)106, (short)106, (short)106, (short)57, (short)45, (short)106, (short)106, (short)106, (short)106, (short)106, (short)52, (short)106, (short)25, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)35, (short)106, (short)106, (short)106, (short)89, (short)41, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)55, (short)49, (short)106, (short)106, (short)12, (short)15, (short)106, (short)54, (short)82, (short)66, (short)106, (short)106, (short)106, (short)78, (short)106, (short)53, (short)24, (short)26, (short)29, (short)31, (short)106, (short)106, (short)32, (short)106, (short)33, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)85, (short)106, (short)106, (short)70, (short)76, (short)106, (short)106, (short)106, (short)56, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)64, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)103, (short)104, (short)102, (short)10, (short)106, (short)106, (short)106, (short)106, (short)79, (short)106, (short)106, (short)74, (short)106, (short)106, (short)106, (short)106, (short)34, (short)106, (short)48, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)65, (short)106, (short)27, (short)106, (short)88, (short)106, (short)106, (short)73, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)9, (short)106, (short)106, (short)106, (short)106, (short)106, (short)42, (short)23, (short)106, (short)100, (short)106, (short)106, (short)36, (short)38, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)71, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)68, (short)69, (short)106, (short)101, (short)106, (short)106, (short)47, (short)106, (short)92, (short)106, (short)106, (short)106, (short)106, (short)106, (short)63, (short)75, (short)28, (short)106, (short)40, (short)106, (short)81, (short)98, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)30, (short)62, (short)106, (short)0, (short)106, (short)106, (short)72, (short)106, (short)84, (short)106, (short)106, (short)95, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)67, (short)0, (short)106, (short)77, (short)39, (short)106, (short)106, (short)106, (short)106, (short)106, (short)91, (short)106, (short)90, (short)80, (short)61, (short)106, (short)106, (short)83, (short)106, (short)106, (short)106, (short)106, (short)105, (short)106, (short)106, (short)106, (short)106, (short)106, (short)93, (short)106, (short)99, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)59, (short)106, (short)106, (short)106, (short)106, (short)106, (short)58, (short)106, (short)106, (short)97, (short)106, (short)106, (short)94, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)106, (short)96, (short)106, (short)60, (short)0
};

static const int yy_ec[256] = 
{
0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 21, 21, 22, 21, 23, 21, 21, 21, 24, 25, 26, 27, 28, 29, 1, 30, 30, 30, 30, 31, 32, 33, 33, 33, 33, 33, 34, 33, 33, 33, 33, 33, 33, 33, 33, 35, 33, 33, 36, 33, 33, 37, 38, 39, 40, 41, 1, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 33, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
};

static const int yy_meta[71] = 
{
0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 1, 4, 1, 1, 1, 1, 1, 1, 5, 5, 5, 5, 2, 1, 1, 1, 1, 1, 6, 6, 6, 7, 7, 7, 7, 1, 1, 1, 1, 7, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 1, 1, 1, 1
};

static const short int yy_base[669] = 
{
(short)0, (short)0, (short)0, (short)216, (short)2195, (short)2195, (short)2195, (short)2195, (short)178, (short)65, (short)2195, (short)2195, (short)45, (short)64, (short)158, (short)2195, (short)2195, (short)160, (short)60, (short)2195, (short)61, (short)59, (short)71, (short)86, (short)133, (short)68, (short)2195, (short)75, (short)156, (short)66, (short)2195, (short)73, (short)104, (short)2195, (short)2195, (short)150, (short)102, (short)76, (short)101, (short)120, (short)139, (short)136, (short)148, (short)147, (short)160, (short)109, (short)164, (short)117, (short)156, (short)187, (short)189, (short)202, (short)199, (short)211, (short)2195, (short)68, (short)2195, (short)2195, (short)2195, (short)107, (short)2195, (short)139, (short)2195, (short)2195, (short)2195, (short)2195, (short)179, (short)113, (short)2195, (short)2195, (short)2195, (short)2195, (short)2195, (short)2195, (short)122, (short)241, (short)2195, (short)2195, (short)2195, (short)245, (short)281, (short)207, (short)236, (short)0, (short)0, (short)0, (short)2195, (short)2195, (short)2195, (short)111, (short)2195, (short)2195, (short)2195, (short)107, (short)105, (short)208, (short)99, (short)202, (short)80, (short)2195, (short)333, (short)210, (short)235, (short)259, (short)215, (short)232, (short)271, (short)272, (short)234, (short)290, (short)296, (short)297, (short)298, (short)299, (short)300, (short)301, (short)320, (short)326, (short)327, (short)338, (short)316, (short)331, (short)346, (short)356, (short)358, (short)362, (short)379, (short)384, (short)386, (short)387, (short)389, (short)390, (short)391, (short)395, (short)402, (short)396, (short)399, (short)411, (short)407, (short)415, (short)422, (short)424, (short)430, (short)451, (short)454, (short)456, (short)457, (short)458, (short)459, (short)2195, (short)2195, (short)2195, (short)2195, (short)469, (short)2195, (short)499, (short)478, (short)2195, (short)462, (short)504, (short)515, (short)505, (short)0, (short)2195, (short)2195, (short)0, (short)518, (short)492, (short)519, (short)524, (short)493, (short)531, (short)541, (short)549, (short)550, (short)557, (short)484, (short)559, (short)566, (short)569, (short)461, (short)570, (short)572, (short)574, (short)578, (short)579, (short)581, (short)582, (short)594, (short)597, (short)606, (short)607, (short)609, (short)613, (short)615, (short)618, (short)619, (short)622, (short)637, (short)643, (short)598, (short)641, (short)646, (short)650, (short)652, (short)662, (short)656, (short)665, (short)667, (short)668, (short)674, (short)671, (short)672, (short)677, (short)689, (short)680, (short)683, (short)693, (short)695, (short)699, (short)710, (short)698, (short)708, (short)711, (short)714, (short)717, (short)718, (short)721, (short)726, (short)727, (short)733, (short)736, (short)738, (short)739, (short)749, (short)755, (short)757, (short)772, (short)780, (short)796, (short)2195, (short)784, (short)800, (short)2195, (short)735, (short)0, (short)761, (short)805, (short)814, (short)766, (short)815, (short)818, (short)820, (short)825, (short)821, (short)826, (short)830, (short)836, (short)827, (short)833, (short)838, (short)842, (short)846, (short)849, (short)853, (short)773, (short)861, (short)868, (short)870, (short)873, (short)877, (short)888, (short)890, (short)893, (short)895, (short)892, (short)894, (short)896, (short)897, (short)898, (short)900, (short)905, (short)901, (short)917, (short)918, (short)920, (short)921, (short)924, (short)926, (short)936, (short)937, (short)942, (short)939, (short)943, (short)946, (short)949, (short)955, (short)961, (short)962, (short)964, (short)965, (short)967, (short)970, (short)980, (short)977, (short)985, (short)990, (short)986, (short)992, (short)993, (short)996, (short)998, (short)1003, (short)1005, (short)1014, (short)1027, (short)1021, (short)1029, (short)1031, (short)1034, (short)1033, (short)1039, (short)1064, (short)1040, (short)1053, (short)1042, (short)1044, (short)1046, (short)1057, (short)1068, (short)1079, (short)1083, (short)1085, (short)1089, (short)1091, (short)1094, (short)1095, (short)1100, (short)1096, (short)1102, (short)1112, (short)1104, (short)1113, (short)1119, (short)1120, (short)1121, (short)1124, (short)1129, (short)1140, (short)1145, (short)1146, (short)1148, (short)1149, (short)1151, (short)1153, (short)1155, (short)1157, (short)1161, (short)1164, (short)1168, (short)1173, (short)1180, (short)1181, (short)1183, (short)1190, (short)1192, (short)1199, (short)1201, (short)1203, (short)1209, (short)1207, (short)1208, (short)1211, (short)1212, (short)1214, (short)1220, (short)1224, (short)1227, (short)1229, (short)1230, (short)1231, (short)1236, (short)1240, (short)1251, (short)1257, (short)1259, (short)1262, (short)1264, (short)1266, (short)1270, (short)1268, (short)1279, (short)1281, (short)1283, (short)1286, (short)1291, (short)1292, (short)1290, (short)1298, (short)1303, (short)1309, (short)1307, (short)1313, (short)1316, (short)1314, (short)1318, (short)1326, (short)1331, (short)1320, (short)1338, (short)1342, (short)1343, (short)1344, (short)1348, (short)1355, (short)1359, (short)1360, (short)1370, (short)1372, (short)1375, (short)1379, (short)1381, (short)1382, (short)1385, (short)1388, (short)1390, (short)1391, (short)1394, (short)1400, (short)1401, (short)1403, (short)1407, (short)1409, (short)1410, (short)1411, (short)1413, (short)1418, (short)1419, (short)1428, (short)1430, (short)1431, (short)1434, (short)1437, (short)1435, (short)1438, (short)1439, (short)1443, (short)1446, (short)1447, (short)1450, (short)1455, (short)1456, (short)1465, (short)1474, (short)1482, (short)1483, (short)1484, (short)1485, (short)1486, (short)1491, (short)1487, (short)1492, (short)1493, (short)1494, (short)1495, (short)1502, (short)1503, (short)1511, (short)1519, (short)1522, (short)1526, (short)1521, (short)1530, (short)1539, (short)1541, (short)1542, (short)1545, (short)1546, (short)1547, (short)1549, (short)1550, (short)1551, (short)1552, (short)1554, (short)1569, (short)1570, (short)1571, (short)1572, (short)1573, (short)1575, (short)1577, (short)1578, (short)1595, (short)1582, (short)1597, (short)1598, (short)1600, (short)1606, (short)1601, (short)1610, (short)1602, (short)1603, (short)1622, (short)1625, (short)1629, (short)1630, (short)1638, (short)1646, (short)1647, (short)1648, (short)1653, (short)1649, (short)1654, (short)1655, (short)1656, (short)1658, (short)1666, (short)1659, (short)1675, (short)1677, (short)1678, (short)1682, (short)1684, (short)1686, (short)1693, (short)1694, (short)1703, (short)1704, (short)1709, (short)1710, (short)1712, (short)1714, (short)1713, (short)1715, (short)1719, (short)1721, (short)1722, (short)1737, (short)1738, (short)1739, (short)1741, (short)1742, (short)1747, (short)1748, (short)1759, (short)1760, (short)1765, (short)1766, (short)1768, (short)1772, (short)1775, (short)1776, (short)1777, (short)1784, (short)1785, (short)1793, (short)1794, (short)1809, (short)1796, (short)1800, (short)1803, (short)1804, (short)1812, (short)1819, (short)1821, (short)1822, (short)1824, (short)1825, (short)1828, (short)1830, (short)1831, (short)1837, (short)1840, (short)1847, (short)1848, (short)1849, (short)1855, (short)1853, (short)1857, (short)1858, (short)92, (short)1860, (short)1868, (short)1856, (short)1878, (short)1879, (short)1883, (short)1884, (short)1886, (short)1896, (short)1901, (short)1902, (short)1903, (short)1904, (short)1906, (short)1905, (short)1911, (short)1908, (short)2195, (short)63, (short)1914, (short)1907, (short)1913, (short)1923, (short)1933, (short)1934, (short)1936, (short)1951, (short)1953, (short)1956, (short)1957, (short)1958, (short)1960, (short)1961, (short)1962, (short)1963, (short)1964, (short)1968, (short)1979, (short)1984, (short)1985, (short)1987, (short)1988, (short)1989, (short)1990, (short)2000, (short)2006, (short)2007, (short)2008, (short)2009, (short)2012, (short)2013, (short)2015, (short)2017, (short)2018, (short)2019, (short)2034, (short)2028, (short)2036, (short)2038, (short)2043, (short)2040, (short)2045, (short)2049, (short)2061, (short)2062, (short)2066, (short)2068, (short)2069, (short)2071, (short)2073, (short)2074, (short)2077, (short)2078, (short)2090, (short)2096, (short)2098, (short)2097, (short)2101, (short)2102, (short)2195, (short)2161, (short)2168, (short)2174, (short)2177, (short)2178, (short)2181, (short)2183, (short)2187
};

static const short int yy_def[669] = 
{
(short)0, (short)660, (short)1, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)661, (short)660, (short)660, (short)660, (short)660, (short)662, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)663, (short)663, (short)660, (short)660, (short)660, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)660, (short)660, (short)660, (short)660, (short)660, (short)661, (short)660, (short)661, (short)660, (short)660, (short)660, (short)660, (short)662, (short)662, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)664, (short)24, (short)665, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)663, (short)660, (short)661, (short)662, (short)660, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)664, (short)666, (short)660, (short)660, (short)667, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)666, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)660, (short)660, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)668, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)660, (short)668, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)663, (short)0, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660
};

static const short int yy_nxt[2266] = 
{
(short)0, (short)4, (short)5, (short)6, (short)7, (short)8, (short)9, (short)10, (short)11, (short)12, (short)13, (short)14, (short)15, (short)16, (short)17, (short)18, (short)19, (short)20, (short)21, (short)22, (short)23, (short)24, (short)24, (short)24, (short)25, (short)26, (short)27, (short)28, (short)29, (short)30, (short)31, (short)31, (short)31, (short)31, (short)32, (short)31, (short)31, (short)33, (short)4, (short)34, (short)35, (short)36, (short)37, (short)38, (short)39, (short)40, (short)41, (short)42, (short)43, (short)31, (short)44, (short)31, (short)31, (short)45, (short)31, (short)46, (short)31, (short)47, (short)48, (short)49, (short)50, (short)51, (short)52, (short)53, (short)31, (short)31, (short)31, (short)54, (short)55, (short)56, (short)57, (short)60, (short)62, (short)63, (short)64, (short)69, (short)598, (short)74, (short)71, (short)75, (short)75, (short)75, (short)75, (short)94, (short)87, (short)76, (short)94, (short)70, (short)72, (short)73, (short)77, (short)65, (short)85, (short)92, (short)93, (short)149, (short)86, (short)96, (short)78, (short)88, (short)96, (short)89, (short)90, (short)61, (short)79, (short)598, (short)80, (short)80, (short)80, (short)80, (short)97, (short)94, (short)94, (short)60, (short)94, (short)98, (short)660, (short)81, (short)67, (short)94, (short)82, (short)82, (short)83, (short)165, (short)66, (short)96, (short)96, (short)94, (short)96, (short)96, (short)94, (short)104, (short)81, (short)96, (short)164, (short)105, (short)150, (short)106, (short)163, (short)82, (short)152, (short)96, (short)660, (short)100, (short)96, (short)61, (short)94, (short)82, (short)101, (short)94, (short)83, (short)79, (short)102, (short)84, (short)84, (short)84, (short)84, (short)94, (short)94, (short)107, (short)96, (short)103, (short)108, (short)96, (short)81, (short)129, (short)94, (short)82, (short)82, (short)109, (short)94, (short)96, (short)96, (short)110, (short)94, (short)132, (short)111, (short)99, (short)133, (short)81, (short)96, (short)112, (short)113, (short)91, (short)96, (short)114, (short)82, (short)68, (short)96, (short)117, (short)151, (short)118, (short)115, (short)123, (short)82, (short)116, (short)67, (short)94, (short)120, (short)94, (short)119, (short)121, (short)134, (short)124, (short)122, (short)58, (short)130, (short)125, (short)60, (short)94, (short)131, (short)96, (short)94, (short)96, (short)126, (short)127, (short)660, (short)67, (short)94, (short)128, (short)94, (short)94, (short)159, (short)96, (short)159, (short)94, (short)96, (short)160, (short)160, (short)160, (short)160, (short)660, (short)96, (short)135, (short)96, (short)96, (short)136, (short)137, (short)141, (short)96, (short)61, (short)660, (short)94, (short)660, (short)94, (short)94, (short)660, (short)138, (short)139, (short)145, (short)140, (short)660, (short)143, (short)147, (short)142, (short)146, (short)96, (short)144, (short)96, (short)96, (short)148, (short)75, (short)75, (short)75, (short)75, (short)155, (short)155, (short)155, (short)155, (short)94, (short)82, (short)82, (short)153, (short)154, (short)176, (short)154, (short)156, (short)157, (short)660, (short)157, (short)179, (short)94, (short)94, (short)96, (short)660, (short)660, (short)180, (short)153, (short)154, (short)82, (short)177, (short)156, (short)157, (short)183, (short)154, (short)96, (short)96, (short)82, (short)157, (short)79, (short)94, (short)80, (short)80, (short)80, (short)80, (short)660, (short)94, (short)94, (short)94, (short)94, (short)94, (short)94, (short)81, (short)660, (short)96, (short)158, (short)158, (short)660, (short)182, (short)178, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)94, (short)81, (short)660, (short)660, (short)94, (short)181, (short)184, (short)660, (short)158, (short)660, (short)94, (short)94, (short)185, (short)660, (short)96, (short)94, (short)158, (short)94, (short)96, (short)660, (short)188, (short)191, (short)94, (short)189, (short)96, (short)96, (short)186, (short)192, (short)193, (short)96, (short)94, (short)96, (short)187, (short)190, (short)660, (short)660, (short)96, (short)660, (short)660, (short)660, (short)94, (short)660, (short)94, (short)660, (short)96, (short)660, (short)94, (short)660, (short)198, (short)166, (short)167, (short)168, (short)169, (short)170, (short)96, (short)194, (short)96, (short)171, (short)660, (short)195, (short)96, (short)199, (short)196, (short)94, (short)660, (short)172, (short)173, (short)174, (short)94, (short)175, (short)94, (short)94, (short)197, (short)94, (short)94, (short)94, (short)660, (short)96, (short)200, (short)94, (short)94, (short)660, (short)96, (short)94, (short)96, (short)96, (short)94, (short)96, (short)96, (short)96, (short)201, (short)94, (short)202, (short)96, (short)96, (short)94, (short)660, (short)96, (short)660, (short)94, (short)96, (short)660, (short)204, (short)660, (short)660, (short)96, (short)94, (short)660, (short)94, (short)96, (short)203, (short)205, (short)213, (short)96, (short)94, (short)211, (short)208, (short)209, (short)206, (short)207, (short)96, (short)212, (short)96, (short)221, (short)214, (short)660, (short)222, (short)210, (short)96, (short)218, (short)217, (short)215, (short)225, (short)219, (short)660, (short)94, (short)216, (short)223, (short)94, (short)224, (short)94, (short)94, (short)94, (short)94, (short)660, (short)94, (short)226, (short)660, (short)227, (short)96, (short)660, (short)220, (short)96, (short)660, (short)96, (short)96, (short)96, (short)96, (short)237, (short)96, (short)237, (short)228, (short)660, (short)238, (short)238, (short)238, (short)238, (short)241, (short)94, (short)241, (short)158, (short)158, (short)242, (short)242, (short)242, (short)242, (short)94, (short)94, (short)230, (short)660, (short)229, (short)233, (short)96, (short)236, (short)234, (short)660, (short)660, (short)231, (short)232, (short)158, (short)96, (short)96, (short)235, (short)155, (short)155, (short)155, (short)155, (short)158, (short)160, (short)160, (short)160, (short)160, (short)94, (short)94, (short)239, (short)240, (short)660, (short)240, (short)94, (short)160, (short)160, (short)160, (short)160, (short)244, (short)244, (short)94, (short)96, (short)96, (short)261, (short)239, (short)240, (short)243, (short)96, (short)243, (short)660, (short)94, (short)240, (short)250, (short)660, (short)96, (short)660, (short)254, (short)244, (short)94, (short)94, (short)660, (short)243, (short)660, (short)251, (short)96, (short)244, (short)94, (short)243, (short)94, (short)253, (short)247, (short)660, (short)96, (short)96, (short)252, (short)94, (short)248, (short)249, (short)94, (short)94, (short)96, (short)94, (short)96, (short)94, (short)660, (short)255, (short)256, (short)94, (short)94, (short)96, (short)94, (short)94, (short)96, (short)96, (short)660, (short)96, (short)660, (short)96, (short)257, (short)660, (short)660, (short)96, (short)96, (short)94, (short)96, (short)96, (short)94, (short)94, (short)258, (short)264, (short)263, (short)262, (short)260, (short)266, (short)259, (short)94, (short)94, (short)96, (short)94, (short)267, (short)96, (short)96, (short)94, (short)272, (short)94, (short)265, (short)660, (short)94, (short)94, (short)96, (short)96, (short)94, (short)96, (short)660, (short)660, (short)268, (short)96, (short)269, (short)96, (short)270, (short)271, (short)96, (short)96, (short)273, (short)660, (short)96, (short)94, (short)275, (short)276, (short)660, (short)94, (short)274, (short)94, (short)660, (short)278, (short)94, (short)277, (short)281, (short)279, (short)94, (short)96, (short)94, (short)280, (short)282, (short)96, (short)94, (short)96, (short)284, (short)660, (short)96, (short)660, (short)94, (short)283, (short)96, (short)94, (short)96, (short)94, (short)94, (short)291, (short)96, (short)94, (short)94, (short)285, (short)94, (short)286, (short)96, (short)94, (short)660, (short)96, (short)94, (short)96, (short)96, (short)94, (short)295, (short)96, (short)96, (short)660, (short)96, (short)94, (short)660, (short)96, (short)287, (short)94, (short)96, (short)94, (short)288, (short)96, (short)94, (short)94, (short)289, (short)292, (short)290, (short)96, (short)294, (short)293, (short)660, (short)96, (short)94, (short)96, (short)94, (short)94, (short)96, (short)96, (short)94, (short)660, (short)300, (short)94, (short)94, (short)297, (short)298, (short)94, (short)96, (short)296, (short)96, (short)96, (short)94, (short)94, (short)96, (short)299, (short)660, (short)96, (short)96, (short)94, (short)301, (short)96, (short)94, (short)660, (short)94, (short)94, (short)96, (short)96, (short)306, (short)302, (short)303, (short)660, (short)304, (short)96, (short)305, (short)94, (short)96, (short)309, (short)96, (short)96, (short)660, (short)94, (short)660, (short)94, (short)307, (short)244, (short)244, (short)94, (short)312, (short)96, (short)660, (short)308, (short)94, (short)660, (short)310, (short)96, (short)311, (short)96, (short)660, (short)94, (short)317, (short)96, (short)315, (short)313, (short)244, (short)314, (short)96, (short)318, (short)238, (short)238, (short)238, (short)238, (short)244, (short)96, (short)316, (short)319, (short)238, (short)238, (short)238, (short)238, (short)242, (short)242, (short)242, (short)242, (short)660, (short)660, (short)320, (short)321, (short)154, (short)321, (short)154, (short)94, (short)322, (short)322, (short)322, (short)322, (short)242, (short)242, (short)242, (short)242, (short)94, (short)94, (short)325, (short)154, (short)94, (short)96, (short)94, (short)94, (short)157, (short)154, (short)157, (short)94, (short)94, (short)94, (short)96, (short)96, (short)94, (short)660, (short)96, (short)94, (short)96, (short)96, (short)94, (short)157, (short)94, (short)96, (short)96, (short)96, (short)94, (short)157, (short)96, (short)323, (short)94, (short)96, (short)660, (short)94, (short)96, (short)660, (short)96, (short)94, (short)327, (short)326, (short)96, (short)660, (short)324, (short)329, (short)96, (short)94, (short)335, (short)96, (short)660, (short)328, (short)660, (short)96, (short)94, (short)331, (short)94, (short)330, (short)660, (short)94, (short)334, (short)96, (short)332, (short)94, (short)338, (short)333, (short)336, (short)337, (short)96, (short)340, (short)96, (short)660, (short)339, (short)96, (short)94, (short)660, (short)94, (short)96, (short)94, (short)94, (short)94, (short)94, (short)94, (short)94, (short)94, (short)341, (short)94, (short)94, (short)96, (short)342, (short)96, (short)94, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)660, (short)96, (short)96, (short)660, (short)94, (short)94, (short)96, (short)94, (short)94, (short)343, (short)346, (short)94, (short)349, (short)94, (short)344, (short)345, (short)347, (short)348, (short)96, (short)96, (short)660, (short)96, (short)96, (short)94, (short)94, (short)96, (short)94, (short)96, (short)351, (short)94, (short)94, (short)354, (short)350, (short)94, (short)352, (short)355, (short)94, (short)96, (short)96, (short)353, (short)96, (short)362, (short)94, (short)96, (short)96, (short)660, (short)660, (short)96, (short)94, (short)94, (short)96, (short)94, (short)94, (short)356, (short)94, (short)660, (short)96, (short)94, (short)358, (short)360, (short)357, (short)359, (short)96, (short)96, (short)94, (short)96, (short)96, (short)94, (short)96, (short)361, (short)660, (short)96, (short)94, (short)94, (short)365, (short)660, (short)363, (short)94, (short)96, (short)94, (short)94, (short)96, (short)364, (short)94, (short)366, (short)94, (short)96, (short)96, (short)660, (short)367, (short)94, (short)96, (short)94, (short)96, (short)96, (short)660, (short)660, (short)96, (short)660, (short)96, (short)368, (short)94, (short)370, (short)372, (short)96, (short)369, (short)96, (short)371, (short)94, (short)375, (short)373, (short)660, (short)374, (short)377, (short)94, (short)96, (short)94, (short)379, (short)94, (short)380, (short)94, (short)94, (short)96, (short)378, (short)660, (short)381, (short)376, (short)94, (short)96, (short)94, (short)96, (short)94, (short)96, (short)94, (short)96, (short)96, (short)322, (short)322, (short)322, (short)322, (short)94, (short)96, (short)660, (short)96, (short)94, (short)96, (short)382, (short)96, (short)660, (short)660, (short)660, (short)660, (short)383, (short)660, (short)96, (short)94, (short)387, (short)660, (short)96, (short)384, (short)386, (short)322, (short)322, (short)322, (short)322, (short)388, (short)94, (short)392, (short)385, (short)96, (short)94, (short)389, (short)94, (short)240, (short)391, (short)240, (short)94, (short)390, (short)94, (short)660, (short)96, (short)94, (short)94, (short)94, (short)96, (short)397, (short)96, (short)94, (short)240, (short)94, (short)96, (short)94, (short)96, (short)393, (short)240, (short)96, (short)96, (short)96, (short)394, (short)94, (short)94, (short)96, (short)395, (short)96, (short)660, (short)96, (short)94, (short)94, (short)94, (short)660, (short)396, (short)94, (short)660, (short)96, (short)96, (short)400, (short)94, (short)660, (short)401, (short)402, (short)96, (short)96, (short)96, (short)399, (short)406, (short)96, (short)398, (short)94, (short)403, (short)660, (short)96, (short)405, (short)94, (short)94, (short)404, (short)94, (short)94, (short)407, (short)94, (short)660, (short)94, (short)96, (short)94, (short)409, (short)94, (short)660, (short)96, (short)96, (short)94, (short)96, (short)96, (short)94, (short)96, (short)408, (short)96, (short)94, (short)96, (short)660, (short)96, (short)410, (short)94, (short)660, (short)96, (short)411, (short)660, (short)96, (short)660, (short)94, (short)94, (short)96, (short)94, (short)414, (short)415, (short)660, (short)96, (short)412, (short)413, (short)94, (short)418, (short)94, (short)420, (short)96, (short)96, (short)660, (short)96, (short)416, (short)94, (short)417, (short)94, (short)419, (short)94, (short)96, (short)660, (short)96, (short)94, (short)94, (short)94, (short)422, (short)94, (short)94, (short)96, (short)94, (short)96, (short)423, (short)96, (short)421, (short)429, (short)94, (short)96, (short)96, (short)96, (short)94, (short)96, (short)96, (short)94, (short)96, (short)94, (short)94, (short)94, (short)660, (short)660, (short)96, (short)427, (short)94, (short)424, (short)96, (short)660, (short)94, (short)96, (short)425, (short)96, (short)96, (short)96, (short)431, (short)426, (short)433, (short)432, (short)96, (short)94, (short)430, (short)428, (short)96, (short)660, (short)435, (short)94, (short)660, (short)94, (short)660, (short)437, (short)94, (short)434, (short)94, (short)96, (short)94, (short)440, (short)94, (short)438, (short)94, (short)96, (short)441, (short)96, (short)439, (short)660, (short)96, (short)436, (short)96, (short)94, (short)96, (short)94, (short)96, (short)94, (short)96, (short)660, (short)94, (short)660, (short)660, (short)443, (short)94, (short)94, (short)94, (short)96, (short)445, (short)96, (short)442, (short)96, (short)94, (short)444, (short)96, (short)447, (short)455, (short)94, (short)96, (short)96, (short)96, (short)94, (short)448, (short)94, (short)660, (short)446, (short)96, (short)94, (short)94, (short)660, (short)94, (short)96, (short)94, (short)660, (short)94, (short)96, (short)660, (short)96, (short)450, (short)660, (short)94, (short)96, (short)96, (short)449, (short)96, (short)94, (short)96, (short)451, (short)96, (short)452, (short)453, (short)454, (short)94, (short)457, (short)96, (short)458, (short)94, (short)94, (short)94, (short)96, (short)456, (short)660, (short)94, (short)660, (short)462, (short)660, (short)96, (short)459, (short)660, (short)94, (short)96, (short)96, (short)96, (short)94, (short)94, (short)463, (short)96, (short)460, (short)660, (short)461, (short)465, (short)464, (short)466, (short)96, (short)94, (short)469, (short)94, (short)96, (short)96, (short)94, (short)467, (short)471, (short)468, (short)94, (short)473, (short)94, (short)94, (short)660, (short)96, (short)94, (short)96, (short)470, (short)94, (short)96, (short)94, (short)94, (short)660, (short)96, (short)94, (short)96, (short)96, (short)472, (short)474, (short)96, (short)94, (short)94, (short)96, (short)94, (short)96, (short)96, (short)475, (short)94, (short)96, (short)94, (short)94, (short)94, (short)660, (short)94, (short)96, (short)96, (short)476, (short)96, (short)94, (short)94, (short)478, (short)96, (short)660, (short)96, (short)96, (short)96, (short)479, (short)96, (short)94, (short)477, (short)94, (short)94, (short)96, (short)96, (short)94, (short)94, (short)481, (short)94, (short)94, (short)94, (short)660, (short)480, (short)96, (short)94, (short)96, (short)96, (short)94, (short)94, (short)96, (short)96, (short)94, (short)96, (short)96, (short)96, (short)482, (short)94, (short)94, (short)96, (short)660, (short)660, (short)96, (short)96, (short)485, (short)483, (short)96, (short)94, (short)660, (short)660, (short)484, (short)96, (short)96, (short)487, (short)491, (short)488, (short)94, (short)660, (short)660, (short)486, (short)489, (short)96, (short)493, (short)490, (short)94, (short)94, (short)94, (short)94, (short)94, (short)94, (short)96, (short)492, (short)494, (short)94, (short)94, (short)94, (short)94, (short)94, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)94, (short)94, (short)660, (short)96, (short)96, (short)96, (short)96, (short)96, (short)660, (short)94, (short)495, (short)660, (short)660, (short)660, (short)96, (short)96, (short)497, (short)94, (short)499, (short)94, (short)94, (short)496, (short)498, (short)96, (short)94, (short)502, (short)501, (short)500, (short)94, (short)505, (short)503, (short)96, (short)506, (short)96, (short)96, (short)504, (short)507, (short)94, (short)96, (short)94, (short)94, (short)508, (short)96, (short)94, (short)94, (short)94, (short)660, (short)94, (short)94, (short)94, (short)94, (short)96, (short)94, (short)96, (short)96, (short)509, (short)511, (short)96, (short)96, (short)96, (short)512, (short)96, (short)96, (short)96, (short)96, (short)510, (short)96, (short)94, (short)94, (short)94, (short)94, (short)94, (short)660, (short)94, (short)660, (short)94, (short)94, (short)660, (short)515, (short)516, (short)94, (short)96, (short)96, (short)96, (short)96, (short)96, (short)519, (short)96, (short)513, (short)96, (short)96, (short)514, (short)660, (short)94, (short)96, (short)94, (short)94, (short)518, (short)94, (short)94, (short)94, (short)94, (short)522, (short)517, (short)94, (short)660, (short)523, (short)96, (short)94, (short)96, (short)96, (short)524, (short)96, (short)96, (short)96, (short)96, (short)520, (short)521, (short)96, (short)525, (short)94, (short)660, (short)96, (short)94, (short)660, (short)660, (short)660, (short)94, (short)94, (short)660, (short)526, (short)527, (short)529, (short)532, (short)96, (short)531, (short)94, (short)96, (short)530, (short)533, (short)528, (short)96, (short)96, (short)534, (short)94, (short)94, (short)94, (short)94, (short)660, (short)660, (short)96, (short)94, (short)94, (short)94, (short)94, (short)660, (short)94, (short)94, (short)96, (short)96, (short)96, (short)96, (short)537, (short)535, (short)94, (short)96, (short)96, (short)96, (short)96, (short)536, (short)96, (short)96, (short)660, (short)94, (short)660, (short)94, (short)94, (short)542, (short)96, (short)660, (short)94, (short)539, (short)94, (short)544, (short)94, (short)660, (short)538, (short)96, (short)549, (short)96, (short)96, (short)94, (short)94, (short)540, (short)96, (short)547, (short)96, (short)543, (short)96, (short)541, (short)548, (short)94, (short)94, (short)545, (short)546, (short)96, (short)96, (short)94, (short)94, (short)660, (short)94, (short)94, (short)94, (short)94, (short)550, (short)96, (short)96, (short)94, (short)660, (short)94, (short)94, (short)96, (short)96, (short)552, (short)96, (short)96, (short)96, (short)96, (short)553, (short)551, (short)660, (short)96, (short)554, (short)96, (short)96, (short)94, (short)94, (short)94, (short)556, (short)94, (short)94, (short)660, (short)557, (short)559, (short)561, (short)94, (short)94, (short)660, (short)562, (short)96, (short)96, (short)96, (short)555, (short)96, (short)96, (short)563, (short)558, (short)94, (short)94, (short)96, (short)96, (short)560, (short)660, (short)94, (short)94, (short)564, (short)94, (short)660, (short)566, (short)567, (short)94, (short)96, (short)96, (short)94, (short)94, (short)94, (short)569, (short)96, (short)96, (short)568, (short)96, (short)570, (short)94, (short)94, (short)96, (short)565, (short)660, (short)96, (short)96, (short)96, (short)660, (short)94, (short)94, (short)571, (short)94, (short)660, (short)96, (short)96, (short)94, (short)660, (short)573, (short)94, (short)94, (short)572, (short)574, (short)96, (short)96, (short)94, (short)96, (short)580, (short)94, (short)576, (short)96, (short)575, (short)577, (short)96, (short)96, (short)94, (short)660, (short)94, (short)94, (short)96, (short)94, (short)94, (short)96, (short)660, (short)94, (short)578, (short)94, (short)94, (short)660, (short)96, (short)582, (short)96, (short)96, (short)94, (short)96, (short)96, (short)94, (short)581, (short)96, (short)583, (short)96, (short)96, (short)579, (short)94, (short)94, (short)94, (short)584, (short)96, (short)585, (short)94, (short)96, (short)94, (short)94, (short)94, (short)94, (short)660, (short)94, (short)96, (short)96, (short)96, (short)660, (short)588, (short)587, (short)96, (short)94, (short)96, (short)96, (short)96, (short)96, (short)590, (short)96, (short)660, (short)586, (short)660, (short)94, (short)94, (short)593, (short)660, (short)96, (short)94, (short)94, (short)589, (short)94, (short)591, (short)596, (short)595, (short)597, (short)600, (short)96, (short)96, (short)594, (short)592, (short)94, (short)96, (short)96, (short)601, (short)96, (short)94, (short)94, (short)94, (short)94, (short)94, (short)94, (short)94, (short)94, (short)602, (short)96, (short)94, (short)660, (short)94, (short)94, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)94, (short)660, (short)96, (short)603, (short)96, (short)96, (short)604, (short)660, (short)660, (short)660, (short)94, (short)94, (short)660, (short)94, (short)96, (short)607, (short)614, (short)660, (short)660, (short)612, (short)605, (short)610, (short)615, (short)613, (short)96, (short)96, (short)606, (short)96, (short)94, (short)608, (short)94, (short)609, (short)611, (short)94, (short)94, (short)94, (short)660, (short)94, (short)94, (short)94, (short)94, (short)94, (short)96, (short)618, (short)96, (short)94, (short)617, (short)96, (short)96, (short)96, (short)616, (short)96, (short)96, (short)96, (short)96, (short)96, (short)94, (short)660, (short)660, (short)96, (short)660, (short)94, (short)94, (short)619, (short)94, (short)94, (short)94, (short)94, (short)660, (short)621, (short)96, (short)623, (short)625, (short)620, (short)622, (short)96, (short)96, (short)94, (short)96, (short)96, (short)96, (short)96, (short)624, (short)94, (short)94, (short)94, (short)94, (short)660, (short)660, (short)94, (short)94, (short)96, (short)94, (short)626, (short)94, (short)94, (short)94, (short)96, (short)96, (short)96, (short)96, (short)627, (short)629, (short)96, (short)96, (short)94, (short)96, (short)632, (short)96, (short)96, (short)96, (short)94, (short)630, (short)94, (short)631, (short)94, (short)628, (short)94, (short)660, (short)96, (short)94, (short)660, (short)94, (short)660, (short)633, (short)96, (short)94, (short)96, (short)637, (short)96, (short)660, (short)96, (short)635, (short)634, (short)96, (short)640, (short)96, (short)636, (short)94, (short)94, (short)96, (short)638, (short)639, (short)94, (short)641, (short)94, (short)94, (short)642, (short)94, (short)660, (short)94, (short)94, (short)96, (short)96, (short)94, (short)94, (short)647, (short)96, (short)660, (short)96, (short)96, (short)644, (short)96, (short)643, (short)96, (short)96, (short)645, (short)94, (short)96, (short)96, (short)660, (short)660, (short)646, (short)94, (short)94, (short)94, (short)660, (short)650, (short)94, (short)94, (short)660, (short)96, (short)651, (short)660, (short)649, (short)648, (short)660, (short)96, (short)96, (short)96, (short)654, (short)660, (short)96, (short)96, (short)660, (short)660, (short)660, (short)660, (short)660, (short)653, (short)652, (short)660, (short)656, (short)660, (short)660, (short)655, (short)658, (short)660, (short)660, (short)659, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)657, (short)59, (short)59, (short)59, (short)59, (short)59, (short)59, (short)59, (short)66, (short)66, (short)660, (short)66, (short)66, (short)66, (short)66, (short)95, (short)660, (short)660, (short)95, (short)95, (short)95, (short)161, (short)161, (short)162, (short)162, (short)245, (short)245, (short)245, (short)246, (short)246, (short)599, (short)599, (short)599, (short)599, (short)3, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660
};

static const short int yy_chk[2266] = 
{
(short)0, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)9, (short)12, (short)12, (short)13, (short)18, (short)599, (short)21, (short)20, (short)21, (short)21, (short)21, (short)21, (short)31, (short)27, (short)22, (short)37, (short)18, (short)20, (short)20, (short)22, (short)13, (short)25, (short)29, (short)29, (short)55, (short)25, (short)31, (short)22, (short)27, (short)37, (short)27, (short)27, (short)9, (short)23, (short)580, (short)23, (short)23, (short)23, (short)23, (short)32, (short)38, (short)36, (short)59, (short)32, (short)32, (short)67, (short)23, (short)98, (short)45, (short)23, (short)23, (short)23, (short)96, (short)67, (short)38, (short)36, (short)47, (short)32, (short)94, (short)39, (short)37, (short)23, (short)45, (short)93, (short)37, (short)55, (short)37, (short)89, (short)23, (short)74, (short)47, (short)61, (short)36, (short)39, (short)59, (short)41, (short)23, (short)36, (short)40, (short)23, (short)24, (short)36, (short)24, (short)24, (short)24, (short)24, (short)43, (short)42, (short)38, (short)41, (short)36, (short)39, (short)40, (short)24, (short)45, (short)48, (short)24, (short)24, (short)39, (short)44, (short)43, (short)42, (short)39, (short)46, (short)47, (short)39, (short)35, (short)47, (short)24, (short)48, (short)40, (short)40, (short)28, (short)44, (short)40, (short)24, (short)17, (short)46, (short)41, (short)66, (short)41, (short)40, (short)43, (short)24, (short)40, (short)14, (short)49, (short)42, (short)50, (short)41, (short)42, (short)48, (short)43, (short)42, (short)8, (short)46, (short)44, (short)97, (short)52, (short)46, (short)49, (short)51, (short)50, (short)44, (short)44, (short)3, (short)66, (short)95, (short)44, (short)101, (short)53, (short)81, (short)52, (short)81, (short)104, (short)51, (short)81, (short)81, (short)81, (short)81, (short)0, (short)95, (short)49, (short)101, (short)53, (short)49, (short)49, (short)50, (short)104, (short)97, (short)0, (short)105, (short)0, (short)108, (short)102, (short)0, (short)49, (short)49, (short)52, (short)49, (short)0, (short)51, (short)53, (short)50, (short)52, (short)105, (short)51, (short)108, (short)102, (short)53, (short)75, (short)75, (short)75, (short)75, (short)79, (short)79, (short)79, (short)79, (short)103, (short)82, (short)82, (short)75, (short)75, (short)101, (short)75, (short)79, (short)79, (short)0, (short)79, (short)104, (short)106, (short)107, (short)103, (short)0, (short)0, (short)105, (short)75, (short)75, (short)82, (short)102, (short)79, (short)79, (short)108, (short)75, (short)106, (short)107, (short)82, (short)79, (short)80, (short)109, (short)80, (short)80, (short)80, (short)80, (short)0, (short)110, (short)111, (short)112, (short)113, (short)114, (short)115, (short)80, (short)0, (short)109, (short)80, (short)80, (short)0, (short)107, (short)103, (short)110, (short)111, (short)112, (short)113, (short)114, (short)115, (short)120, (short)80, (short)0, (short)0, (short)116, (short)106, (short)109, (short)0, (short)80, (short)0, (short)117, (short)118, (short)110, (short)0, (short)120, (short)121, (short)80, (short)100, (short)116, (short)0, (short)113, (short)114, (short)119, (short)113, (short)117, (short)118, (short)111, (short)114, (short)115, (short)121, (short)122, (short)100, (short)112, (short)113, (short)0, (short)0, (short)119, (short)0, (short)0, (short)0, (short)123, (short)0, (short)124, (short)0, (short)122, (short)0, (short)125, (short)0, (short)120, (short)100, (short)100, (short)100, (short)100, (short)100, (short)123, (short)116, (short)124, (short)100, (short)0, (short)117, (short)125, (short)121, (short)118, (short)126, (short)0, (short)100, (short)100, (short)100, (short)127, (short)100, (short)128, (short)129, (short)119, (short)130, (short)131, (short)132, (short)0, (short)126, (short)122, (short)133, (short)135, (short)0, (short)127, (short)136, (short)128, (short)129, (short)134, (short)130, (short)131, (short)132, (short)123, (short)138, (short)124, (short)133, (short)135, (short)137, (short)0, (short)136, (short)0, (short)139, (short)134, (short)0, (short)127, (short)0, (short)0, (short)138, (short)140, (short)0, (short)141, (short)137, (short)126, (short)127, (short)133, (short)139, (short)142, (short)132, (short)129, (short)130, (short)127, (short)128, (short)140, (short)132, (short)141, (short)138, (short)134, (short)0, (short)138, (short)131, (short)142, (short)136, (short)135, (short)134, (short)139, (short)137, (short)0, (short)143, (short)134, (short)138, (short)144, (short)138, (short)145, (short)146, (short)147, (short)148, (short)0, (short)180, (short)140, (short)0, (short)141, (short)143, (short)0, (short)137, (short)144, (short)0, (short)145, (short)146, (short)147, (short)148, (short)153, (short)180, (short)153, (short)142, (short)0, (short)153, (short)153, (short)153, (short)153, (short)156, (short)176, (short)156, (short)158, (short)158, (short)156, (short)156, (short)156, (short)156, (short)167, (short)170, (short)144, (short)0, (short)143, (short)146, (short)176, (short)148, (short)146, (short)0, (short)0, (short)144, (short)145, (short)158, (short)167, (short)170, (short)147, (short)155, (short)155, (short)155, (short)155, (short)158, (short)159, (short)159, (short)159, (short)159, (short)166, (short)168, (short)155, (short)155, (short)0, (short)155, (short)169, (short)160, (short)160, (short)160, (short)160, (short)161, (short)161, (short)171, (short)166, (short)168, (short)176, (short)155, (short)155, (short)160, (short)169, (short)160, (short)0, (short)172, (short)155, (short)167, (short)0, (short)171, (short)0, (short)170, (short)161, (short)173, (short)174, (short)0, (short)160, (short)0, (short)168, (short)172, (short)161, (short)175, (short)160, (short)177, (short)169, (short)166, (short)0, (short)173, (short)174, (short)168, (short)178, (short)166, (short)166, (short)179, (short)181, (short)175, (short)182, (short)177, (short)183, (short)0, (short)171, (short)172, (short)184, (short)185, (short)178, (short)186, (short)187, (short)179, (short)181, (short)0, (short)182, (short)0, (short)183, (short)173, (short)0, (short)0, (short)184, (short)185, (short)188, (short)186, (short)187, (short)189, (short)200, (short)173, (short)179, (short)178, (short)177, (short)175, (short)182, (short)174, (short)190, (short)191, (short)188, (short)192, (short)183, (short)189, (short)200, (short)193, (short)187, (short)194, (short)181, (short)0, (short)195, (short)196, (short)190, (short)191, (short)197, (short)192, (short)0, (short)0, (short)184, (short)193, (short)185, (short)194, (short)186, (short)186, (short)195, (short)196, (short)188, (short)0, (short)197, (short)198, (short)190, (short)191, (short)0, (short)201, (short)189, (short)199, (short)0, (short)192, (short)202, (short)191, (short)194, (short)193, (short)203, (short)198, (short)204, (short)193, (short)195, (short)201, (short)206, (short)199, (short)197, (short)0, (short)202, (short)0, (short)205, (short)196, (short)203, (short)207, (short)204, (short)208, (short)209, (short)206, (short)206, (short)211, (short)212, (short)198, (short)210, (short)199, (short)205, (short)213, (short)0, (short)207, (short)215, (short)208, (short)209, (short)216, (short)210, (short)211, (short)212, (short)0, (short)210, (short)214, (short)0, (short)213, (short)202, (short)217, (short)215, (short)218, (short)203, (short)216, (short)221, (short)219, (short)204, (short)207, (short)205, (short)214, (short)209, (short)208, (short)0, (short)217, (short)222, (short)218, (short)220, (short)223, (short)221, (short)219, (short)224, (short)0, (short)215, (short)225, (short)226, (short)212, (short)213, (short)227, (short)222, (short)211, (short)220, (short)223, (short)228, (short)229, (short)224, (short)214, (short)0, (short)225, (short)226, (short)230, (short)216, (short)227, (short)231, (short)0, (short)232, (short)233, (short)228, (short)229, (short)222, (short)218, (short)219, (short)0, (short)220, (short)230, (short)221, (short)234, (short)231, (short)225, (short)232, (short)233, (short)0, (short)235, (short)0, (short)236, (short)223, (short)244, (short)244, (short)246, (short)228, (short)234, (short)0, (short)224, (short)249, (short)0, (short)226, (short)235, (short)227, (short)236, (short)0, (short)265, (short)233, (short)246, (short)231, (short)229, (short)244, (short)230, (short)249, (short)234, (short)237, (short)237, (short)237, (short)237, (short)244, (short)265, (short)232, (short)235, (short)238, (short)238, (short)238, (short)238, (short)241, (short)241, (short)241, (short)241, (short)0, (short)0, (short)236, (short)239, (short)238, (short)239, (short)238, (short)247, (short)239, (short)239, (short)239, (short)239, (short)242, (short)242, (short)242, (short)242, (short)248, (short)250, (short)249, (short)238, (short)251, (short)247, (short)252, (short)254, (short)242, (short)238, (short)242, (short)253, (short)255, (short)258, (short)248, (short)250, (short)256, (short)0, (short)251, (short)259, (short)252, (short)254, (short)257, (short)242, (short)260, (short)253, (short)255, (short)258, (short)261, (short)242, (short)256, (short)247, (short)262, (short)259, (short)0, (short)263, (short)257, (short)0, (short)260, (short)264, (short)251, (short)250, (short)261, (short)0, (short)248, (short)253, (short)262, (short)266, (short)258, (short)263, (short)0, (short)252, (short)0, (short)264, (short)267, (short)255, (short)268, (short)254, (short)0, (short)269, (short)257, (short)266, (short)255, (short)270, (short)261, (short)256, (short)259, (short)260, (short)267, (short)263, (short)268, (short)0, (short)262, (short)269, (short)271, (short)0, (short)272, (short)270, (short)275, (short)273, (short)276, (short)274, (short)277, (short)278, (short)279, (short)264, (short)280, (short)282, (short)271, (short)266, (short)272, (short)281, (short)275, (short)273, (short)276, (short)274, (short)277, (short)278, (short)279, (short)0, (short)280, (short)282, (short)0, (short)283, (short)284, (short)281, (short)285, (short)286, (short)269, (short)272, (short)287, (short)275, (short)288, (short)270, (short)271, (short)273, (short)274, (short)283, (short)284, (short)0, (short)285, (short)286, (short)289, (short)290, (short)287, (short)292, (short)288, (short)277, (short)291, (short)293, (short)280, (short)276, (short)294, (short)278, (short)281, (short)295, (short)289, (short)290, (short)279, (short)292, (short)291, (short)296, (short)291, (short)293, (short)0, (short)0, (short)294, (short)297, (short)298, (short)295, (short)299, (short)300, (short)284, (short)301, (short)0, (short)296, (short)302, (short)286, (short)289, (short)285, (short)288, (short)297, (short)298, (short)304, (short)299, (short)300, (short)303, (short)301, (short)290, (short)0, (short)302, (short)305, (short)307, (short)296, (short)0, (short)292, (short)306, (short)304, (short)308, (short)309, (short)303, (short)294, (short)310, (short)297, (short)311, (short)305, (short)307, (short)0, (short)298, (short)312, (short)306, (short)313, (short)308, (short)309, (short)0, (short)0, (short)310, (short)0, (short)311, (short)299, (short)314, (short)301, (short)303, (short)312, (short)300, (short)313, (short)302, (short)316, (short)306, (short)304, (short)0, (short)305, (short)308, (short)315, (short)314, (short)317, (short)310, (short)318, (short)311, (short)320, (short)319, (short)316, (short)309, (short)0, (short)312, (short)307, (short)323, (short)315, (short)325, (short)317, (short)326, (short)318, (short)327, (short)320, (short)319, (short)321, (short)321, (short)321, (short)321, (short)324, (short)323, (short)0, (short)325, (short)328, (short)326, (short)314, (short)327, (short)0, (short)0, (short)0, (short)0, (short)315, (short)0, (short)324, (short)329, (short)320, (short)0, (short)328, (short)316, (short)319, (short)322, (short)322, (short)322, (short)322, (short)323, (short)330, (short)327, (short)318, (short)329, (short)331, (short)324, (short)332, (short)322, (short)326, (short)322, (short)333, (short)325, (short)334, (short)0, (short)330, (short)335, (short)336, (short)338, (short)331, (short)332, (short)332, (short)337, (short)322, (short)339, (short)333, (short)341, (short)334, (short)328, (short)322, (short)335, (short)336, (short)338, (short)329, (short)340, (short)342, (short)337, (short)330, (short)339, (short)0, (short)341, (short)343, (short)344, (short)345, (short)0, (short)331, (short)346, (short)0, (short)340, (short)342, (short)335, (short)347, (short)0, (short)336, (short)337, (short)343, (short)344, (short)345, (short)334, (short)341, (short)346, (short)333, (short)348, (short)338, (short)0, (short)347, (short)340, (short)349, (short)350, (short)339, (short)351, (short)352, (short)343, (short)353, (short)0, (short)354, (short)348, (short)355, (short)346, (short)356, (short)0, (short)349, (short)350, (short)357, (short)351, (short)352, (short)358, (short)353, (short)345, (short)354, (short)359, (short)355, (short)0, (short)356, (short)347, (short)360, (short)0, (short)357, (short)348, (short)0, (short)358, (short)0, (short)361, (short)362, (short)359, (short)363, (short)351, (short)352, (short)0, (short)360, (short)349, (short)350, (short)364, (short)355, (short)365, (short)357, (short)361, (short)362, (short)0, (short)363, (short)353, (short)366, (short)354, (short)367, (short)356, (short)368, (short)364, (short)0, (short)365, (short)370, (short)371, (short)369, (short)360, (short)372, (short)373, (short)366, (short)374, (short)367, (short)361, (short)368, (short)359, (short)369, (short)375, (short)370, (short)371, (short)369, (short)376, (short)372, (short)373, (short)377, (short)374, (short)378, (short)379, (short)380, (short)0, (short)0, (short)375, (short)367, (short)381, (short)364, (short)376, (short)0, (short)382, (short)377, (short)365, (short)378, (short)379, (short)380, (short)372, (short)366, (short)374, (short)373, (short)381, (short)383, (short)370, (short)368, (short)382, (short)0, (short)376, (short)384, (short)0, (short)385, (short)0, (short)378, (short)386, (short)375, (short)387, (short)383, (short)388, (short)381, (short)390, (short)379, (short)389, (short)384, (short)381, (short)385, (short)380, (short)0, (short)386, (short)377, (short)387, (short)391, (short)388, (short)392, (short)390, (short)393, (short)389, (short)0, (short)394, (short)0, (short)0, (short)384, (short)397, (short)395, (short)396, (short)391, (short)386, (short)392, (short)383, (short)393, (short)398, (short)385, (short)394, (short)389, (short)397, (short)399, (short)397, (short)395, (short)396, (short)401, (short)390, (short)400, (short)0, (short)388, (short)398, (short)402, (short)404, (short)0, (short)403, (short)399, (short)405, (short)0, (short)408, (short)401, (short)0, (short)400, (short)392, (short)0, (short)406, (short)402, (short)404, (short)391, (short)403, (short)407, (short)405, (short)393, (short)408, (short)394, (short)395, (short)396, (short)409, (short)399, (short)406, (short)400, (short)410, (short)411, (short)412, (short)407, (short)398, (short)0, (short)413, (short)0, (short)404, (short)0, (short)409, (short)401, (short)0, (short)414, (short)410, (short)411, (short)412, (short)415, (short)416, (short)405, (short)413, (short)402, (short)0, (short)403, (short)407, (short)406, (short)407, (short)414, (short)417, (short)408, (short)418, (short)415, (short)416, (short)419, (short)407, (short)410, (short)407, (short)420, (short)412, (short)421, (short)422, (short)0, (short)417, (short)423, (short)418, (short)409, (short)424, (short)419, (short)425, (short)426, (short)0, (short)420, (short)427, (short)421, (short)422, (short)411, (short)413, (short)423, (short)428, (short)429, (short)424, (short)430, (short)425, (short)426, (short)416, (short)431, (short)427, (short)432, (short)433, (short)434, (short)0, (short)435, (short)428, (short)429, (short)417, (short)430, (short)436, (short)437, (short)424, (short)431, (short)0, (short)432, (short)433, (short)434, (short)425, (short)435, (short)438, (short)420, (short)439, (short)440, (short)436, (short)437, (short)441, (short)443, (short)428, (short)442, (short)444, (short)445, (short)0, (short)426, (short)438, (short)446, (short)439, (short)440, (short)447, (short)448, (short)441, (short)443, (short)449, (short)442, (short)444, (short)445, (short)434, (short)450, (short)451, (short)446, (short)0, (short)0, (short)447, (short)448, (short)439, (short)435, (short)449, (short)452, (short)0, (short)0, (short)437, (short)450, (short)451, (short)441, (short)445, (short)442, (short)453, (short)0, (short)0, (short)440, (short)443, (short)452, (short)448, (short)444, (short)454, (short)455, (short)456, (short)457, (short)458, (short)460, (short)453, (short)446, (short)449, (short)459, (short)461, (short)462, (short)463, (short)464, (short)454, (short)455, (short)456, (short)457, (short)458, (short)460, (short)465, (short)466, (short)0, (short)459, (short)461, (short)462, (short)463, (short)464, (short)0, (short)467, (short)452, (short)0, (short)0, (short)0, (short)465, (short)466, (short)454, (short)468, (short)457, (short)471, (short)469, (short)453, (short)456, (short)467, (short)470, (short)460, (short)459, (short)458, (short)472, (short)464, (short)461, (short)468, (short)465, (short)471, (short)469, (short)463, (short)465, (short)473, (short)470, (short)474, (short)475, (short)466, (short)472, (short)476, (short)477, (short)478, (short)0, (short)479, (short)480, (short)481, (short)482, (short)473, (short)483, (short)474, (short)475, (short)467, (short)469, (short)476, (short)477, (short)478, (short)470, (short)479, (short)480, (short)481, (short)482, (short)468, (short)483, (short)484, (short)485, (short)486, (short)487, (short)488, (short)0, (short)489, (short)0, (short)490, (short)491, (short)0, (short)477, (short)478, (short)493, (short)484, (short)485, (short)486, (short)487, (short)488, (short)483, (short)489, (short)475, (short)490, (short)491, (short)476, (short)0, (short)492, (short)493, (short)494, (short)495, (short)481, (short)496, (short)498, (short)500, (short)501, (short)486, (short)480, (short)497, (short)0, (short)488, (short)492, (short)499, (short)494, (short)495, (short)490, (short)496, (short)498, (short)500, (short)501, (short)484, (short)485, (short)497, (short)491, (short)502, (short)0, (short)499, (short)503, (short)0, (short)0, (short)0, (short)504, (short)505, (short)0, (short)492, (short)493, (short)495, (short)498, (short)502, (short)497, (short)506, (short)503, (short)496, (short)499, (short)494, (short)504, (short)505, (short)500, (short)507, (short)508, (short)509, (short)511, (short)0, (short)0, (short)506, (short)510, (short)512, (short)513, (short)514, (short)0, (short)515, (short)517, (short)507, (short)508, (short)509, (short)511, (short)505, (short)502, (short)516, (short)510, (short)512, (short)513, (short)514, (short)503, (short)515, (short)517, (short)0, (short)518, (short)0, (short)519, (short)520, (short)509, (short)516, (short)0, (short)521, (short)507, (short)522, (short)512, (short)523, (short)0, (short)506, (short)518, (short)517, (short)519, (short)520, (short)524, (short)525, (short)507, (short)521, (short)515, (short)522, (short)510, (short)523, (short)508, (short)516, (short)526, (short)527, (short)513, (short)514, (short)524, (short)525, (short)528, (short)529, (short)0, (short)530, (short)532, (short)531, (short)533, (short)519, (short)526, (short)527, (short)534, (short)0, (short)535, (short)536, (short)528, (short)529, (short)522, (short)530, (short)532, (short)531, (short)533, (short)525, (short)521, (short)0, (short)534, (short)526, (short)535, (short)536, (short)537, (short)538, (short)539, (short)528, (short)540, (short)541, (short)0, (short)529, (short)531, (short)533, (short)542, (short)543, (short)0, (short)534, (short)537, (short)538, (short)539, (short)527, (short)540, (short)541, (short)535, (short)530, (short)544, (short)545, (short)542, (short)543, (short)532, (short)0, (short)546, (short)547, (short)536, (short)548, (short)0, (short)538, (short)539, (short)549, (short)544, (short)545, (short)550, (short)551, (short)552, (short)541, (short)546, (short)547, (short)540, (short)548, (short)542, (short)553, (short)554, (short)549, (short)537, (short)0, (short)550, (short)551, (short)552, (short)0, (short)555, (short)556, (short)543, (short)558, (short)0, (short)553, (short)554, (short)559, (short)0, (short)547, (short)560, (short)561, (short)544, (short)549, (short)555, (short)556, (short)557, (short)558, (short)557, (short)562, (short)552, (short)559, (short)550, (short)554, (short)560, (short)561, (short)563, (short)0, (short)564, (short)565, (short)557, (short)566, (short)567, (short)562, (short)0, (short)568, (short)555, (short)569, (short)570, (short)0, (short)563, (short)560, (short)564, (short)565, (short)571, (short)566, (short)567, (short)572, (short)558, (short)568, (short)562, (short)569, (short)570, (short)556, (short)573, (short)574, (short)575, (short)563, (short)571, (short)564, (short)577, (short)572, (short)576, (short)583, (short)578, (short)579, (short)0, (short)581, (short)573, (short)574, (short)575, (short)0, (short)569, (short)568, (short)577, (short)582, (short)576, (short)583, (short)578, (short)579, (short)571, (short)581, (short)0, (short)567, (short)0, (short)584, (short)585, (short)574, (short)0, (short)582, (short)586, (short)587, (short)570, (short)588, (short)572, (short)578, (short)576, (short)579, (short)581, (short)584, (short)585, (short)575, (short)573, (short)589, (short)586, (short)587, (short)582, (short)588, (short)590, (short)591, (short)592, (short)593, (short)595, (short)594, (short)601, (short)597, (short)584, (short)589, (short)596, (short)0, (short)602, (short)600, (short)590, (short)591, (short)592, (short)593, (short)595, (short)594, (short)601, (short)597, (short)603, (short)0, (short)596, (short)586, (short)602, (short)600, (short)587, (short)0, (short)0, (short)0, (short)604, (short)605, (short)0, (short)606, (short)603, (short)591, (short)597, (short)0, (short)0, (short)596, (short)589, (short)594, (short)600, (short)596, (short)604, (short)605, (short)590, (short)606, (short)607, (short)592, (short)608, (short)593, (short)595, (short)609, (short)610, (short)611, (short)0, (short)612, (short)613, (short)614, (short)615, (short)616, (short)607, (short)605, (short)608, (short)617, (short)604, (short)609, (short)610, (short)611, (short)603, (short)612, (short)613, (short)614, (short)615, (short)616, (short)618, (short)0, (short)0, (short)617, (short)0, (short)619, (short)620, (short)606, (short)621, (short)622, (short)623, (short)624, (short)0, (short)609, (short)618, (short)614, (short)616, (short)607, (short)613, (short)619, (short)620, (short)625, (short)621, (short)622, (short)623, (short)624, (short)614, (short)626, (short)627, (short)628, (short)629, (short)0, (short)0, (short)630, (short)631, (short)625, (short)632, (short)617, (short)633, (short)634, (short)635, (short)626, (short)627, (short)628, (short)629, (short)618, (short)621, (short)630, (short)631, (short)637, (short)632, (short)624, (short)633, (short)634, (short)635, (short)636, (short)622, (short)638, (short)623, (short)639, (short)619, (short)641, (short)0, (short)637, (short)640, (short)0, (short)642, (short)0, (short)625, (short)636, (short)643, (short)638, (short)631, (short)639, (short)0, (short)641, (short)629, (short)627, (short)640, (short)634, (short)642, (short)630, (short)644, (short)645, (short)643, (short)632, (short)633, (short)646, (short)635, (short)647, (short)648, (short)636, (short)649, (short)0, (short)650, (short)651, (short)644, (short)645, (short)652, (short)653, (short)642, (short)646, (short)0, (short)647, (short)648, (short)639, (short)649, (short)638, (short)650, (short)651, (short)640, (short)654, (short)652, (short)653, (short)0, (short)0, (short)641, (short)655, (short)657, (short)656, (short)0, (short)647, (short)658, (short)659, (short)0, (short)654, (short)648, (short)0, (short)645, (short)644, (short)0, (short)655, (short)657, (short)656, (short)652, (short)0, (short)658, (short)659, (short)0, (short)0, (short)0, (short)0, (short)0, (short)651, (short)650, (short)0, (short)654, (short)0, (short)0, (short)653, (short)656, (short)0, (short)0, (short)658, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)655, (short)661, (short)661, (short)661, (short)661, (short)661, (short)661, (short)661, (short)662, (short)662, (short)0, (short)662, (short)662, (short)662, (short)662, (short)663, (short)0, (short)0, (short)663, (short)663, (short)663, (short)664, (short)664, (short)665, (short)665, (short)666, (short)666, (short)666, (short)667, (short)667, (short)668, (short)668, (short)668, (short)668, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660, (short)660
};

static yy_state_type yy_last_accepting_state;

static char * yy_last_accepting_cpos;

char * yytext;

enum yytokentype
{
IDENTIFIER = 258, CONSTANT = 259, STRING_LITERAL = 260, SIZEOF = 261, PTR_OP = 262, INC_OP = 263, DEC_OP = 264, LEFT_OP = 265, RIGHT_OP = 266, LE_OP = 267, GE_OP = 268, EQ_OP = 269, NE_OP = 270, AND_OP = 271, OR_OP = 272, MUL_ASSIGN = 273, DIV_ASSIGN = 274, MOD_ASSIGN = 275, ADD_ASSIGN = 276, SUB_ASSIGN = 277, LEFT_ASSIGN = 278, RIGHT_ASSIGN = 279, AND_ASSIGN = 280, XOR_ASSIGN = 281, OR_ASSIGN = 282, TYPE_NAME = 283, TYPEDEF = 284, EXTERN = 285, STATIC = 286, AUTO = 287, REGISTER = 288, CHAR = 289, SHORT = 290, INT = 291, UINT = 292, INT64 = 293, LONG = 294, SIGNED = 295, UNSIGNED = 296, FLOAT = 297, DOUBLE = 298, CONST = 299, VOLATILE = 300, VOID = 301, VALIST = 302, STRUCT = 303, UNION = 304, ENUM = 305, ELLIPSIS = 306, CASE = 307, DEFAULT = 308, IF = 309, SWITCH = 310, WHILE = 311, DO = 312, FOR = 313, GOTO = 314, CONTINUE = 315, BREAK = 316, RETURN = 317, IFX = 318, ELSE = 319, CLASS = 320, THISCLASS = 321, CLASS_NAME = 322, PROPERTY = 323, SETPROP = 324, GETPROP = 325, NEWOP = 326, RENEW = 327, DELETE = 328, EXT_DECL = 329, EXT_STORAGE = 330, IMPORT = 331, DEFINE = 332, VIRTUAL = 333, ATTRIB = 334, PUBLIC = 335, PRIVATE = 336, TYPED_OBJECT = 337, ANY_OBJECT = 338, _INCREF = 339, EXTENSION = 340, ASM = 341, TYPEOF = 342, WATCH = 343, STOPWATCHING = 344, FIREWATCHERS = 345, WATCHABLE = 346, CLASS_DESIGNER = 347, CLASS_NO_EXPANSION = 348, CLASS_FIXED = 349, ISPROPSET = 350, CLASS_DEFAULT_PROPERTY = 351, PROPERTY_CATEGORY = 352, CLASS_DATA = 353, CLASS_PROPERTY = 354, SUBCLASS = 355, NAMESPACE = 356, NEW0OP = 357, RENEW0 = 358, VAARG = 359, DBTABLE = 360, DBFIELD = 361, DBINDEX = 362, DATABASE_OPEN = 363, ALIGNOF = 364, ATTRIB_DEP = 365, __ATTRIB = 366
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

YY_BUFFER_STATE include_stack[10];

struct __ecereNameSpace__ecere__com__Instance * fileStack[10];

char sourceFileStack[10][797];

extern char *  strcpy(char * , const char * );

void SetSomeSourceFileStack(char * fileName, int index)
{
strcpy(sourceFileStack[index], fileName);
}

struct Location locStack[10];

int declModeStack[10];

int include_stack_ptr = 0;

extern int yywrap(void);

static void yyunput(int c, char * buf_ptr);

static int input(void);

int commentCPP();

extern int check_type(void);

extern int defaultDeclMode;

extern int declMode;

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
if(yy_current_state >= 661)
yy_c = yy_meta[(unsigned int)yy_c];
}
yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int)yy_c];
++yy_cp;
}while(yy_base[yy_current_state] != (short)2195);
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
return ATTRIB_DEP;
}
break;
case 61:
TESTTTT();
{
return ATTRIB;
}
break;
case 62:
TESTTTT();
{
return __ATTRIB;
}
break;
case 63:
TESTTTT();
{
return (EXT_STORAGE);
}
break;
case 64:
TESTTTT();
{
return (EXT_STORAGE);
}
break;
case 65:
TESTTTT();
{
return (EXT_STORAGE);
}
break;
case 66:
TESTTTT();
{
return (EXT_STORAGE);
}
break;
case 67:
TESTTTT();
{
return (EXT_STORAGE);
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
return (EXT_DECL);
}
break;
case 71:
TESTTTT();
{
return (EXT_DECL);
}
break;
case 72:
TESTTTT();
{
return (EXT_DECL);
}
break;
case 73:
TESTTTT();
{
return (EXT_DECL);
}
break;
case 74:
TESTTTT();
{
return (EXT_DECL);
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
return (PUBLIC);
}
break;
case 79:
TESTTTT();
{
return (PRIVATE);
}
break;
case 80:
TESTTTT();
{
return (TYPED_OBJECT);
}
break;
case 81:
TESTTTT();
{
return (ANY_OBJECT);
}
break;
case 82:
TESTTTT();
{
return (_INCREF);
}
break;
case 83:
TESTTTT();
{
return (EXTENSION);
}
break;
case 84:
TESTTTT();
{
return (EXTENSION);
}
break;
case 85:
TESTTTT();
{
return (ASM);
}
break;
case 86:
TESTTTT();
{
return (ASM);
}
break;
case 87:
TESTTTT();
{
return (ASM);
}
break;
case 88:
TESTTTT();
{
return (TYPEOF);
}
break;
case 89:
TESTTTT();
{
return (WATCH);
}
break;
case 90:
TESTTTT();
{
return (STOPWATCHING);
}
break;
case 91:
TESTTTT();
{
return (FIREWATCHERS);
}
break;
case 92:
TESTTTT();
{
return (WATCHABLE);
}
break;
case 93:
TESTTTT();
{
return (CLASS_DESIGNER);
}
break;
case 94:
TESTTTT();
{
return (CLASS_NO_EXPANSION);
}
break;
case 95:
TESTTTT();
{
return (CLASS_FIXED);
}
break;
case 96:
TESTTTT();
{
return (CLASS_DEFAULT_PROPERTY);
}
break;
case 97:
TESTTTT();
{
return (PROPERTY_CATEGORY);
}
break;
case 98:
TESTTTT();
{
return (CLASS_DATA);
}
break;
case 99:
TESTTTT();
{
return (CLASS_PROPERTY);
}
break;
case 100:
TESTTTT();
{
return (SUBCLASS);
}
break;
case 101:
TESTTTT();
{
return (NAMESPACE);
}
break;
case 102:
TESTTTT();
{
return (DBTABLE);
}
break;
case 103:
TESTTTT();
{
return (DBFIELD);
}
break;
case 104:
TESTTTT();
{
return (DBINDEX);
}
break;
case 105:
TESTTTT();
{
return (DATABASE_OPEN);
}
break;
case 106:
TESTTTT();
{
return (check_type());
}
break;
case 107:
TESTTTT();
{
return (CONSTANT);
}
break;
case 108:
TESTTTT();
{
return (CONSTANT);
}
break;
case 109:
TESTTTT();
{
return (CONSTANT);
}
break;
case 110:
TESTTTT();
{
return (CONSTANT);
}
break;
case 111:
TESTTTT();
{
return (CONSTANT);
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
return (STRING_LITERAL);
}
break;
case 115:
TESTTTT();
{
return (ELLIPSIS);
}
break;
case 116:
TESTTTT();
{
return (RIGHT_ASSIGN);
}
break;
case 117:
TESTTTT();
{
return (LEFT_ASSIGN);
}
break;
case 118:
TESTTTT();
{
return (ADD_ASSIGN);
}
break;
case 119:
TESTTTT();
{
return (SUB_ASSIGN);
}
break;
case 120:
TESTTTT();
{
return (MUL_ASSIGN);
}
break;
case 121:
TESTTTT();
{
return (DIV_ASSIGN);
}
break;
case 122:
TESTTTT();
{
return (MOD_ASSIGN);
}
break;
case 123:
TESTTTT();
{
return (AND_ASSIGN);
}
break;
case 124:
TESTTTT();
{
return (XOR_ASSIGN);
}
break;
case 125:
TESTTTT();
{
return (OR_ASSIGN);
}
break;
case 126:
TESTTTT();
{
return (RIGHT_OP);
}
break;
case 127:
TESTTTT();
{
return (LEFT_OP);
}
break;
case 128:
TESTTTT();
{
return (INC_OP);
}
break;
case 129:
TESTTTT();
{
return (DEC_OP);
}
break;
case 130:
TESTTTT();
{
return (PTR_OP);
}
break;
case 131:
TESTTTT();
{
return (AND_OP);
}
break;
case 132:
TESTTTT();
{
return (OR_OP);
}
break;
case 133:
TESTTTT();
{
return (LE_OP);
}
break;
case 134:
TESTTTT();
{
return (GE_OP);
}
break;
case 135:
TESTTTT();
{
return (EQ_OP);
}
break;
case 136:
TESTTTT();
{
return (NE_OP);
}
break;
case 137:
TESTTTT();
{
return (';');
}
break;
case 138:
TESTTTT();
{
return ('{');
}
break;
case 139:
TESTTTT();
{
return ('}');
}
break;
case 140:
TESTTTT();
{
return (',');
}
break;
case 141:
TESTTTT();
{
return (':');
}
break;
case 142:
TESTTTT();
{
return ('=');
}
break;
case 143:
TESTTTT();
{
return ('(');
}
break;
case 144:
TESTTTT();
{
return (')');
}
break;
case 145:
TESTTTT();
{
return ('[');
}
break;
case 146:
TESTTTT();
{
return (']');
}
break;
case 147:
TESTTTT();
{
return ('.');
}
break;
case 148:
TESTTTT();
{
return ('&');
}
break;
case 149:
TESTTTT();
{
return ('!');
}
break;
case 150:
TESTTTT();
{
return ('~');
}
break;
case 151:
TESTTTT();
{
return ('-');
}
break;
case 152:
TESTTTT();
{
return ('+');
}
break;
case 153:
TESTTTT();
{
return ('*');
}
break;
case 154:
TESTTTT();
{
return ('/');
}
break;
case 155:
TESTTTT();
{
return ('%');
}
break;
case 156:
TESTTTT();
{
return ('<');
}
break;
case 157:
TESTTTT();
{
return ('>');
}
break;
case 158:
TESTTTT();
{
return ('^');
}
break;
case 159:
TESTTTT();
{
return ('|');
}
break;
case 160:
TESTTTT();
{
return ('?');
}
break;
case 161:
TESTTTT();
{
return ('$');
}
break;
case 168LL:
{
if(--include_stack_ptr < 0)
{
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
defaultDeclMode = declMode = declModeStack[include_stack_ptr];
}
}
break;
case 162:
TESTTTT();
{
yylloc.start = yylloc.end;
type_yylloc.start = type_yylloc.end;
expression_yylloc.start = expression_yylloc.end;
}
break;
case 163:
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
case 164:
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
case 165:
TESTTTT();
{
yylloc.start = yylloc.end;
expression_yylloc.start = expression_yylloc.end;
type_yylloc.start = type_yylloc.end;
}
break;
case 166:
TESTTTT();
(void)fwrite(yytext, yyleng, 1, yyout);
break;
case 167:
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
yy_act = (167 + ((yy_start - 1) / 2) + 1);
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
yy_n_chars = ((int (*)(struct __ecereNameSpace__ecere__com__Instance *, void *  buffer, unsigned int size, unsigned int count))fileInput->_vTbl[__ecereVMethodID___ecereNameSpace__ecere__sys__File_Read])(fileInput, (&(*yy_current_buffer).yy_ch_buf[number_to_move]), 1, num_to_read);
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
if(yy_current_state >= 661)
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
if(yy_current_state >= 661)
yy_c = yy_meta[(unsigned int)yy_c];
}
yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int)yy_c];
yy_is_jam = (yy_current_state == 660);
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

extern int strncmp(const char * , const char * , int n);

extern void *  memmove(void * , const void * , unsigned int size);

extern int strlen(const char * );

extern char *  strncpy(char * , const char * , int n);

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

__ecereNameSpace__ecere__sys__GetString(&pointer, fileName, (797));
inOut = __ecereNameSpace__ecere__sys__GetValue(&pointer);
if(inOut == 1)
{
char extension[17];

defaultDeclMode = declModeStack[include_stack_ptr] = declMode;
__ecereNameSpace__ecere__sys__GetExtension(fileName, extension);
if(!strcmp(extension, "c") || !strcmp(extension, "h"))
declMode = defaultDeclMode = 0;
include_stack_ptr++;
}
else if(inOut == 2)
{
include_stack_ptr--;
defaultDeclMode = declMode = declModeStack[include_stack_ptr];
}
yylloc.end.charPos = 1;
yylloc.end.line = lineNumber;
yylloc.end.included = (include_stack_ptr > 0) ? (unsigned int)GetIncludeFileID(fileName) : (unsigned int)0;
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
if(include_stack_ptr >= (10))
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
yylloc.start.included = yylloc.end.included = (unsigned int)GetIncludeFileID(includeFile);
__ecereNameSpace__ecere__sys__GetExtension(includeFile, extension);
if(!strcmp(extension, "c") || !strcmp(extension, "h"))
declMode = defaultDeclMode = 0;
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
yylloc.start.included = yylloc.end.included = 0x0;
expression_yylloc.start.charPos = expression_yylloc.end.charPos = 1;
expression_yylloc.start.line = expression_yylloc.end.line = 1;
expression_yylloc.start.pos = expression_yylloc.end.pos = 0;
expression_yylloc.start.included = expression_yylloc.end.included = 0x0;
type_yylloc.start.charPos = type_yylloc.end.charPos = 1;
type_yylloc.start.line = type_yylloc.end.line = 1;
type_yylloc.start.pos = type_yylloc.end.pos = 0;
type_yylloc.start.included = type_yylloc.end.included = 0x0;
include_stack_ptr = 0;
}

void resetScannerPos(struct CodePosition * pos)
{
yy_flush_buffer(yy_current_buffer);
yylloc.start = yylloc.end = *pos;
type_yylloc.start = type_yylloc.end = *pos;
expression_yylloc.start = expression_yylloc.end = *pos;
}

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, char *  name, char *  baseName, int size, int sizeClass, unsigned int (* )(void * ), void (* )(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

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
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + 12)))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + 12)))->application && class)
__ecereClass_yy_buffer_state = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_input_file", "void *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_ch_buf", "char *", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_buf_pos", "char *", 4, 4, 1);
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
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("resetScanner", "void resetScanner(void)", resetScanner, module, 1);
}

void __ecereUnregisterModule_lexer(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

