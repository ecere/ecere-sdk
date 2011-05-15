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
};

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
(short)0, (short)102, (short)102, (short)162, (short)160, (short)159, (short)158, (short)157, (short)145, (short)160, (short)1, (short)151, (short)144, (short)160, (short)139, (short)140, (short)149, (short)148, (short)136, (short)147, (short)143, (short)150, (short)105, (short)105, (short)137, (short)133, (short)152, (short)138, (short)153, (short)156, (short)102, (short)102, (short)141, (short)142, (short)154, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)134, (short)155, (short)135, (short)146, (short)132, (short)0, (short)110, (short)0, (short)118, (short)135, (short)127, (short)119, (short)0, (short)0, (short)116, (short)124, (short)114, (short)125, (short)115, (short)126, (short)0, (short)108, (short)2, (short)3, (short)117, (short)109, (short)104, (short)0, (short)105, (short)0, (short)105, (short)102, (short)142, (short)134, (short)141, (short)123, (short)129, (short)131, (short)130, (short)122, (short)0, (short)102, (short)0, (short)0, (short)0, (short)120, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)11, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)19, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)121, (short)128, (short)106, (short)111, (short)0, (short)108, (short)108, (short)0, (short)109, (short)104, (short)0, (short)107, (short)103, (short)102, (short)113, (short)112, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)82, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)17, (short)41, (short)102, (short)102, (short)102, (short)102, (short)20, (short)102, (short)102, (short)102, (short)47, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)40, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)0, (short)108, (short)0, (short)108, (short)0, (short)109, (short)107, (short)103, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)4, (short)102, (short)6, (short)7, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)13, (short)14, (short)102, (short)102, (short)102, (short)18, (short)102, (short)102, (short)102, (short)102, (short)102, (short)22, (short)102, (short)48, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)21, (short)102, (short)102, (short)102, (short)35, (short)102, (short)102, (short)102, (short)0, (short)108, (short)83, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)5, (short)43, (short)8, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)16, (short)102, (short)102, (short)102, (short)54, (short)42, (short)102, (short)102, (short)102, (short)102, (short)102, (short)49, (short)102, (short)25, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)33, (short)102, (short)102, (short)102, (short)85, (short)38, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)52, (short)46, (short)102, (short)102, (short)12, (short)15, (short)102, (short)51, (short)78, (short)62, (short)102, (short)102, (short)102, (short)74, (short)102, (short)50, (short)24, (short)26, (short)28, (short)29, (short)102, (short)102, (short)30, (short)102, (short)31, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)81, (short)102, (short)102, (short)66, (short)72, (short)102, (short)102, (short)102, (short)53, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)60, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)99, (short)100, (short)98, (short)10, (short)102, (short)102, (short)102, (short)102, (short)75, (short)102, (short)102, (short)70, (short)102, (short)102, (short)102, (short)102, (short)32, (short)102, (short)45, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)61, (short)102, (short)102, (short)102, (short)84, (short)102, (short)102, (short)69, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)9, (short)102, (short)102, (short)102, (short)102, (short)102, (short)39, (short)23, (short)102, (short)96, (short)102, (short)102, (short)34, (short)36, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)67, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)64, (short)65, (short)102, (short)97, (short)102, (short)102, (short)44, (short)102, (short)88, (short)102, (short)102, (short)102, (short)102, (short)59, (short)71, (short)27, (short)102, (short)102, (short)102, (short)77, (short)94, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)0, (short)102, (short)102, (short)68, (short)102, (short)80, (short)102, (short)102, (short)91, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)102, (short)0, (short)0, (short)102, (short)102, (short)63, (short)0, (short)102, (short)73, (short)37, (short)102, (short)102, (short)102, (short)102, (short)102, (short)87, (short)102, (short)86, (short)76, (short)0, (short)102, (short)102, (short)79, (short)102, (short)102, (short)102, (short)102, (short)101, (short)102, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)102, (short)102, (short)102, (short)89, (short)102, (short)95, (short)102, (short)0, (short)0, (short)0, (short)0, (short)58, (short)0, (short)0, (short)0, (short)0, (short)0, (short)102, (short)102, (short)102, (short)102, (short)102, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)56, (short)102, (short)102, (short)102, (short)102, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)57, (short)0, (short)0, (short)0, (short)0, (short)55, (short)102, (short)102, (short)93, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)102, (short)90, (short)0, (short)0, (short)0, (short)102, (short)102, (short)102, (short)92, (short)0
};

static const int yy_ec[256] = 
{
0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 6, 7, 8, 1, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 21, 21, 22, 21, 23, 21, 21, 21, 24, 25, 26, 27, 28, 29, 1, 30, 30, 30, 30, 31, 32, 33, 33, 33, 33, 33, 34, 33, 33, 33, 33, 33, 33, 33, 33, 35, 33, 33, 36, 33, 33, 37, 38, 39, 40, 41, 1, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 33, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
};

static const int yy_meta[71] = 
{
0, 1, 1, 1, 1, 2, 1, 3, 1, 1, 4, 5, 6, 7, 1, 1, 2, 1, 1, 1, 8, 8, 8, 8, 4, 1, 1, 1, 1, 1, 9, 9, 9, 10, 10, 10, 10, 1, 1, 1, 1, 10, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1
};

static const short int yy_base[716] = 
{
(short)0, (short)0, (short)0, (short)269, (short)2449, (short)2449, (short)2449, (short)2449, (short)217, (short)64, (short)2449, (short)45, (short)64, (short)205, (short)2449, (short)2449, (short)215, (short)60, (short)2449, (short)61, (short)59, (short)71, (short)85, (short)132, (short)68, (short)2449, (short)85, (short)200, (short)56, (short)2449, (short)76, (short)103, (short)2449, (short)2449, (short)197, (short)115, (short)116, (short)112, (short)120, (short)148, (short)133, (short)158, (short)91, (short)171, (short)108, (short)174, (short)179, (short)182, (short)186, (short)189, (short)195, (short)205, (short)199, (short)2449, (short)49, (short)2449, (short)2449, (short)2449, (short)86, (short)2449, (short)219, (short)2449, (short)2449, (short)2449, (short)2449, (short)122, (short)131, (short)2449, (short)2449, (short)2449, (short)2449, (short)2449, (short)2449, (short)194, (short)236, (short)2449, (short)2449, (short)2449, (short)253, (short)289, (short)271, (short)199, (short)0, (short)0, (short)0, (short)2449, (short)2449, (short)2449, (short)175, (short)2449, (short)2449, (short)2449, (short)173, (short)159, (short)135, (short)155, (short)90, (short)113, (short)2449, (short)341, (short)207, (short)241, (short)253, (short)197, (short)254, (short)256, (short)271, (short)280, (short)291, (short)295, (short)304, (short)308, (short)316, (short)317, (short)319, (short)312, (short)320, (short)321, (short)328, (short)336, (short)324, (short)337, (short)345, (short)347, (short)229, (short)357, (short)365, (short)368, (short)380, (short)386, (short)387, (short)388, (short)396, (short)398, (short)392, (short)405, (short)407, (short)409, (short)413, (short)418, (short)424, (short)433, (short)439, (short)452, (short)435, (short)454, (short)456, (short)459, (short)2449, (short)2449, (short)2449, (short)2449, (short)464, (short)2449, (short)492, (short)510, (short)2449, (short)436, (short)478, (short)514, (short)457, (short)0, (short)2449, (short)2449, (short)0, (short)493, (short)495, (short)498, (short)496, (short)531, (short)534, (short)539, (short)540, (short)541, (short)472, (short)547, (short)549, (short)552, (short)550, (short)556, (short)558, (short)559, (short)562, (short)560, (short)568, (short)569, (short)588, (short)586, (short)589, (short)593, (short)595, (short)601, (short)610, (short)599, (short)616, (short)614, (short)629, (short)631, (short)622, (short)633, (short)639, (short)641, (short)642, (short)648, (short)649, (short)657, (short)659, (short)660, (short)661, (short)666, (short)664, (short)668, (short)669, (short)677, (short)672, (short)679, (short)685, (short)690, (short)692, (short)700, (short)705, (short)707, (short)709, (short)710, (short)711, (short)713, (short)718, (short)726, (short)720, (short)728, (short)729, (short)733, (short)744, (short)739, (short)746, (short)735, (short)774, (short)778, (short)794, (short)2449, (short)782, (short)798, (short)2449, (short)773, (short)0, (short)750, (short)752, (short)768, (short)803, (short)812, (short)813, (short)819, (short)814, (short)823, (short)825, (short)830, (short)832, (short)831, (short)836, (short)840, (short)842, (short)838, (short)847, (short)751, (short)849, (short)759, (short)851, (short)855, (short)857, (short)870, (short)875, (short)880, (short)883, (short)881, (short)885, (short)886, (short)887, (short)888, (short)903, (short)892, (short)898, (short)905, (short)909, (short)911, (short)913, (short)915, (short)920, (short)924, (short)926, (short)932, (short)939, (short)941, (short)945, (short)948, (short)951, (short)952, (short)956, (short)958, (short)961, (short)967, (short)973, (short)976, (short)978, (short)977, (short)979, (short)984, (short)985, (short)986, (short)1002, (short)1004, (short)995, (short)1006, (short)1008, (short)1013, (short)1021, (short)1025, (short)1026, (short)1028, (short)1032, (short)1037, (short)1047, (short)1031, (short)1041, (short)1052, (short)1063, (short)1056, (short)1061, (short)1064, (short)1073, (short)1079, (short)1074, (short)1080, (short)1082, (short)1085, (short)1098, (short)1101, (short)1103, (short)1106, (short)1108, (short)1109, (short)1114, (short)1118, (short)1119, (short)1126, (short)1129, (short)1135, (short)1136, (short)1137, (short)1139, (short)1142, (short)1147, (short)1152, (short)1154, (short)1155, (short)1159, (short)1160, (short)1162, (short)1167, (short)1170, (short)1163, (short)1182, (short)1183, (short)1187, (short)1188, (short)1189, (short)1193, (short)1195, (short)1208, (short)1210, (short)1211, (short)1213, (short)1214, (short)1215, (short)1217, (short)1218, (short)1219, (short)1220, (short)1221, (short)1226, (short)1238, (short)1241, (short)1242, (short)1247, (short)1263, (short)1265, (short)1266, (short)1267, (short)1269, (short)1270, (short)1271, (short)1275, (short)1278, (short)1282, (short)1276, (short)1291, (short)1294, (short)1300, (short)1298, (short)1301, (short)1303, (short)1302, (short)1304, (short)1320, (short)1311, (short)1322, (short)1326, (short)1328, (short)1329, (short)1331, (short)1335, (short)1341, (short)1350, (short)1354, (short)1357, (short)1360, (short)1362, (short)1365, (short)1366, (short)1370, (short)1372, (short)1377, (short)1378, (short)1381, (short)1382, (short)1387, (short)1388, (short)1390, (short)1393, (short)1394, (short)1397, (short)1398, (short)1399, (short)1405, (short)1406, (short)1410, (short)1416, (short)1418, (short)1421, (short)1425, (short)1422, (short)1426, (short)1429, (short)1428, (short)1433, (short)1437, (short)1438, (short)1445, (short)1446, (short)1453, (short)1454, (short)1456, (short)1457, (short)1472, (short)1473, (short)1474, (short)1475, (short)1478, (short)1480, (short)1481, (short)1484, (short)1485, (short)1482, (short)1491, (short)1500, (short)1509, (short)1513, (short)1512, (short)1519, (short)1525, (short)1528, (short)1529, (short)1530, (short)1532, (short)1536, (short)1538, (short)1540, (short)1541, (short)1547, (short)1551, (short)1553, (short)1557, (short)1558, (short)1559, (short)1562, (short)1560, (short)1568, (short)1569, (short)1579, (short)1580, (short)1584, (short)1586, (short)1587, (short)1599, (short)1596, (short)1603, (short)1605, (short)1607, (short)1608, (short)1609, (short)1614, (short)1615, (short)1624, (short)1631, (short)1635, (short)1637, (short)1639, (short)1641, (short)1642, (short)1643, (short)1660, (short)1644, (short)1663, (short)1662, (short)1664, (short)1667, (short)1668, (short)1670, (short)1675, (short)1686, (short)1687, (short)1688, (short)1690, (short)1691, (short)1695, (short)1696, (short)1698, (short)1706, (short)1708, (short)1714, (short)1715, (short)1716, (short)1719, (short)1726, (short)1731, (short)1718, (short)1742, (short)1735, (short)1743, (short)1747, (short)1753, (short)1755, (short)1759, (short)1762, (short)1763, (short)1765, (short)1770, (short)1772, (short)1774, (short)1780, (short)1781, (short)1785, (short)1787, (short)1790, (short)1793, (short)1797, (short)1798, (short)1800, (short)1802, (short)1805, (short)1808, (short)1809, (short)1813, (short)1820, (short)1824, (short)1825, (short)1835, (short)1826, (short)1836, (short)1837, (short)1861, (short)1841, (short)122, (short)1853, (short)1854, (short)1843, (short)1862, (short)1852, (short)1864, (short)1865, (short)1877, (short)1880, (short)1882, (short)1886, (short)1887, (short)1888, (short)1890, (short)1889, (short)136, (short)117, (short)1895, (short)1898, (short)2449, (short)110, (short)1906, (short)1897, (short)1899, (short)1905, (short)1917, (short)1918, (short)1921, (short)1933, (short)1934, (short)1940, (short)1942, (short)1943, (short)1956, (short)1965, (short)1949, (short)1952, (short)1968, (short)1961, (short)1969, (short)1970, (short)1972, (short)1973, (short)1994, (short)408, (short)91, (short)1999, (short)2013, (short)175, (short)87, (short)1974, (short)1977, (short)1990, (short)1993, (short)1998, (short)2006, (short)2010, (short)927, (short)2023, (short)2028, (short)2032, (short)2449, (short)2037, (short)2038, (short)2047, (short)2056, (short)2062, (short)2046, (short)2052, (short)2055, (short)2067, (short)2061, (short)2068, (short)2077, (short)2082, (short)2083, (short)2084, (short)2096, (short)2102, (short)2109, (short)2111, (short)2115, (short)82, (short)2121, (short)2127, (short)2082, (short)2120, (short)2125, (short)2126, (short)2128, (short)2140, (short)2141, (short)2142, (short)2146, (short)2155, (short)2156, (short)2160, (short)2449, (short)2162, (short)2172, (short)2174, (short)2179, (short)2173, (short)2179, (short)2184, (short)2186, (short)2193, (short)2199, (short)2200, (short)2206, (short)2212, (short)2213, (short)2218, (short)2225, (short)2197, (short)2190, (short)2219, (short)2235, (short)2237, (short)2223, (short)2234, (short)2235, (short)2236, (short)2449, (short)2300, (short)2310, (short)2317, (short)2320, (short)2321, (short)2324, (short)2326, (short)2330, (short)2339, (short)2348, (short)2357, (short)2366, (short)2375, (short)2384, (short)2393, (short)2402, (short)2411, (short)2420, (short)2429, (short)2438
};

static const short int yy_def[716] = 
{
(short)0, (short)695, (short)1, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)696, (short)695, (short)695, (short)695, (short)697, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)698, (short)698, (short)695, (short)695, (short)695, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)695, (short)695, (short)695, (short)695, (short)695, (short)696, (short)695, (short)696, (short)695, (short)695, (short)695, (short)695, (short)697, (short)697, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)699, (short)23, (short)700, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)698, (short)695, (short)696, (short)697, (short)695, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)699, (short)701, (short)695, (short)695, (short)702, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)701, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)695, (short)695, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)703, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)695, (short)695, (short)698, (short)698, (short)695, (short)703, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)704, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)704, (short)705, (short)695, (short)706, (short)704, (short)695, (short)695, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)698, (short)695, (short)705, (short)695, (short)707, (short)695, (short)706, (short)708, (short)706, (short)695, (short)709, (short)698, (short)698, (short)698, (short)698, (short)698, (short)695, (short)707, (short)707, (short)695, (short)708, (short)695, (short)710, (short)695, (short)709, (short)711, (short)695, (short)712, (short)709, (short)698, (short)698, (short)698, (short)698, (short)698, (short)695, (short)710, (short)710, (short)695, (short)711, (short)695, (short)713, (short)695, (short)712, (short)714, (short)712, (short)695, (short)698, (short)698, (short)698, (short)698, (short)695, (short)713, (short)713, (short)695, (short)714, (short)695, (short)715, (short)695, (short)698, (short)698, (short)695, (short)715, (short)715, (short)698, (short)698, (short)698, (short)698, (short)0, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695
};

static const short int yy_nxt[2520] = 
{
(short)0, (short)4, (short)5, (short)6, (short)7, (short)7, (short)8, (short)9, (short)10, (short)11, (short)12, (short)13, (short)14, (short)15, (short)16, (short)17, (short)18, (short)19, (short)20, (short)21, (short)22, (short)23, (short)23, (short)23, (short)24, (short)25, (short)26, (short)27, (short)28, (short)29, (short)30, (short)30, (short)30, (short)30, (short)31, (short)30, (short)30, (short)32, (short)4, (short)33, (short)34, (short)35, (short)36, (short)37, (short)38, (short)39, (short)40, (short)41, (short)42, (short)30, (short)43, (short)30, (short)30, (short)44, (short)30, (short)45, (short)30, (short)46, (short)47, (short)48, (short)49, (short)50, (short)51, (short)52, (short)30, (short)30, (short)30, (short)53, (short)54, (short)55, (short)56, (short)59, (short)61, (short)62, (short)63, (short)68, (short)148, (short)73, (short)70, (short)74, (short)74, (short)74, (short)74, (short)91, (short)92, (short)75, (short)93, (short)69, (short)71, (short)72, (short)76, (short)64, (short)84, (short)59, (short)86, (short)669, (short)85, (short)59, (short)77, (short)638, (short)95, (short)93, (short)60, (short)78, (short)633, (short)79, (short)79, (short)79, (short)79, (short)87, (short)96, (short)88, (short)89, (short)93, (short)97, (short)95, (short)80, (short)149, (short)93, (short)81, (short)81, (short)82, (short)93, (short)591, (short)60, (short)93, (short)93, (short)95, (short)60, (short)605, (short)93, (short)80, (short)95, (short)150, (short)695, (short)591, (short)95, (short)122, (short)81, (short)95, (short)95, (short)587, (short)65, (short)93, (short)95, (short)93, (short)81, (short)123, (short)588, (short)82, (short)78, (short)66, (short)83, (short)83, (short)83, (short)83, (short)99, (short)95, (short)93, (short)95, (short)66, (short)100, (short)107, (short)80, (short)128, (short)101, (short)81, (short)81, (short)93, (short)108, (short)106, (short)103, (short)95, (short)109, (short)102, (short)104, (short)110, (short)105, (short)80, (short)164, (short)620, (short)93, (short)95, (short)95, (short)93, (short)81, (short)116, (short)621, (short)117, (short)93, (short)111, (short)112, (short)93, (short)81, (short)113, (short)95, (short)93, (short)118, (short)95, (short)93, (short)163, (short)114, (short)162, (short)95, (short)115, (short)93, (short)95, (short)93, (short)119, (short)93, (short)95, (short)120, (short)151, (short)95, (short)121, (short)93, (short)129, (short)93, (short)124, (short)95, (short)130, (short)95, (short)695, (short)95, (short)98, (short)125, (short)126, (short)90, (short)133, (short)95, (short)127, (short)95, (short)134, (short)81, (short)81, (short)135, (short)136, (short)131, (short)140, (short)93, (short)132, (short)146, (short)67, (short)66, (short)57, (short)142, (short)137, (short)138, (short)147, (short)139, (short)143, (short)93, (short)81, (short)95, (short)141, (short)144, (short)74, (short)74, (short)74, (short)74, (short)81, (short)145, (short)178, (short)93, (short)93, (short)95, (short)93, (short)152, (short)153, (short)695, (short)153, (short)175, (short)695, (short)154, (short)154, (short)154, (short)154, (short)95, (short)95, (short)695, (short)95, (short)93, (short)152, (short)153, (short)155, (short)156, (short)158, (short)156, (short)158, (short)153, (short)93, (short)159, (short)159, (short)159, (short)159, (short)95, (short)176, (short)695, (short)695, (short)155, (short)156, (short)93, (short)695, (short)695, (short)95, (short)93, (short)156, (short)78, (short)179, (short)79, (short)79, (short)79, (short)79, (short)177, (short)93, (short)95, (short)180, (short)181, (short)93, (short)95, (short)80, (short)695, (short)93, (short)157, (short)157, (short)695, (short)93, (short)93, (short)95, (short)93, (short)93, (short)93, (short)95, (short)183, (short)93, (short)80, (short)95, (short)184, (short)93, (short)182, (short)95, (short)95, (short)157, (short)95, (short)95, (short)95, (short)93, (short)93, (short)95, (short)695, (short)157, (short)93, (short)95, (short)695, (short)695, (short)93, (short)695, (short)93, (short)695, (short)185, (short)95, (short)95, (short)695, (short)187, (short)190, (short)95, (short)188, (short)93, (short)186, (short)95, (short)191, (short)95, (short)192, (short)193, (short)695, (short)93, (short)189, (short)695, (short)93, (short)194, (short)198, (short)95, (short)195, (short)165, (short)166, (short)167, (short)168, (short)169, (short)196, (short)95, (short)93, (short)170, (short)95, (short)695, (short)197, (short)199, (short)93, (short)93, (short)93, (short)171, (short)172, (short)173, (short)93, (short)174, (short)95, (short)200, (short)93, (short)201, (short)93, (short)203, (short)95, (short)95, (short)95, (short)629, (short)202, (short)93, (short)95, (short)93, (short)204, (short)93, (short)95, (short)631, (short)95, (short)93, (short)632, (short)205, (short)695, (short)206, (short)93, (short)95, (short)695, (short)95, (short)695, (short)95, (short)93, (short)207, (short)695, (short)95, (short)210, (short)212, (short)208, (short)695, (short)95, (short)93, (short)211, (short)93, (short)213, (short)695, (short)95, (short)93, (short)209, (short)220, (short)216, (short)214, (short)221, (short)218, (short)224, (short)95, (short)215, (short)95, (short)695, (short)217, (short)93, (short)95, (short)93, (short)222, (short)93, (short)223, (short)225, (short)93, (short)157, (short)157, (short)695, (short)219, (short)226, (short)695, (short)95, (short)695, (short)95, (short)236, (short)95, (short)236, (short)93, (short)95, (short)237, (short)237, (short)237, (short)237, (short)695, (short)157, (short)227, (short)243, (short)243, (short)231, (short)228, (short)695, (short)95, (short)157, (short)159, (short)159, (short)159, (short)159, (short)229, (short)93, (short)232, (short)93, (short)93, (short)233, (short)93, (short)235, (short)243, (short)230, (short)154, (short)154, (short)154, (short)154, (short)234, (short)95, (short)243, (short)95, (short)95, (short)695, (short)95, (short)238, (short)239, (short)240, (short)239, (short)240, (short)258, (short)695, (short)241, (short)241, (short)241, (short)241, (short)159, (short)159, (short)159, (short)159, (short)238, (short)239, (short)695, (short)93, (short)251, (short)249, (short)93, (short)239, (short)242, (short)695, (short)242, (short)93, (short)93, (short)93, (short)246, (short)247, (short)250, (short)95, (short)248, (short)93, (short)95, (short)93, (short)93, (short)242, (short)93, (short)95, (short)95, (short)95, (short)93, (short)242, (short)93, (short)93, (short)93, (short)95, (short)93, (short)95, (short)95, (short)695, (short)95, (short)695, (short)93, (short)93, (short)95, (short)695, (short)95, (short)95, (short)95, (short)254, (short)95, (short)695, (short)695, (short)253, (short)255, (short)262, (short)95, (short)95, (short)695, (short)252, (short)93, (short)261, (short)93, (short)93, (short)256, (short)264, (short)260, (short)93, (short)695, (short)93, (short)257, (short)259, (short)265, (short)93, (short)95, (short)93, (short)95, (short)95, (short)263, (short)695, (short)695, (short)95, (short)266, (short)95, (short)93, (short)695, (short)695, (short)95, (short)93, (short)95, (short)93, (short)267, (short)268, (short)269, (short)270, (short)695, (short)93, (short)695, (short)95, (short)273, (short)271, (short)274, (short)95, (short)93, (short)95, (short)93, (short)279, (short)93, (short)272, (short)275, (short)95, (short)276, (short)695, (short)93, (short)695, (short)93, (short)93, (short)95, (short)695, (short)95, (short)277, (short)95, (short)93, (short)93, (short)278, (short)695, (short)280, (short)95, (short)284, (short)95, (short)95, (short)93, (short)281, (short)93, (short)93, (short)93, (short)95, (short)95, (short)93, (short)282, (short)93, (short)283, (short)93, (short)93, (short)289, (short)95, (short)93, (short)95, (short)95, (short)95, (short)293, (short)93, (short)95, (short)93, (short)95, (short)695, (short)95, (short)95, (short)695, (short)93, (short)95, (short)285, (short)286, (short)288, (short)93, (short)95, (short)93, (short)95, (short)695, (short)290, (short)287, (short)292, (short)291, (short)95, (short)93, (short)695, (short)695, (short)695, (short)95, (short)93, (short)95, (short)93, (short)298, (short)93, (short)93, (short)93, (short)296, (short)93, (short)95, (short)295, (short)294, (short)297, (short)93, (short)95, (short)93, (short)95, (short)695, (short)95, (short)95, (short)95, (short)93, (short)95, (short)93, (short)93, (short)299, (short)695, (short)95, (short)93, (short)95, (short)93, (short)302, (short)301, (short)300, (short)93, (short)95, (short)304, (short)95, (short)95, (short)93, (short)307, (short)93, (short)95, (short)695, (short)95, (short)93, (short)93, (short)93, (short)95, (short)695, (short)303, (short)305, (short)695, (short)95, (short)93, (short)95, (short)306, (short)310, (short)308, (short)95, (short)95, (short)95, (short)309, (short)93, (short)313, (short)311, (short)316, (short)695, (short)95, (short)312, (short)695, (short)695, (short)695, (short)318, (short)315, (short)317, (short)695, (short)95, (short)314, (short)237, (short)237, (short)237, (short)237, (short)237, (short)237, (short)237, (short)237, (short)241, (short)241, (short)241, (short)241, (short)321, (short)243, (short)243, (short)319, (short)153, (short)319, (short)153, (short)93, (short)320, (short)320, (short)320, (short)320, (short)241, (short)241, (short)241, (short)241, (short)93, (short)93, (short)93, (short)153, (short)243, (short)95, (short)322, (short)93, (short)156, (short)153, (short)156, (short)93, (short)243, (short)93, (short)95, (short)95, (short)95, (short)695, (short)93, (short)93, (short)93, (short)95, (short)695, (short)156, (short)93, (short)95, (short)93, (short)95, (short)93, (short)156, (short)93, (short)323, (short)95, (short)95, (short)95, (short)93, (short)324, (short)93, (short)95, (short)93, (short)95, (short)326, (short)95, (short)93, (short)95, (short)93, (short)325, (short)695, (short)695, (short)95, (short)695, (short)95, (short)327, (short)95, (short)328, (short)332, (short)331, (short)95, (short)93, (short)95, (short)337, (short)329, (short)330, (short)93, (short)335, (short)695, (short)333, (short)334, (short)93, (short)93, (short)336, (short)93, (short)95, (short)93, (short)93, (short)93, (short)93, (short)95, (short)695, (short)339, (short)93, (short)338, (short)95, (short)95, (short)695, (short)95, (short)93, (short)95, (short)95, (short)95, (short)95, (short)93, (short)340, (short)93, (short)95, (short)341, (short)343, (short)93, (short)342, (short)93, (short)95, (short)93, (short)346, (short)93, (short)344, (short)95, (short)345, (short)95, (short)93, (short)695, (short)629, (short)95, (short)93, (short)95, (short)93, (short)95, (short)695, (short)95, (short)631, (short)348, (short)93, (short)632, (short)95, (short)352, (short)347, (short)349, (short)95, (short)93, (short)95, (short)93, (short)350, (short)695, (short)359, (short)93, (short)95, (short)351, (short)93, (short)695, (short)695, (short)93, (short)93, (short)95, (short)695, (short)95, (short)93, (short)353, (short)93, (short)95, (short)357, (short)93, (short)95, (short)355, (short)354, (short)95, (short)95, (short)93, (short)356, (short)695, (short)95, (short)358, (short)95, (short)93, (short)695, (short)95, (short)93, (short)93, (short)93, (short)93, (short)695, (short)95, (short)695, (short)362, (short)93, (short)93, (short)93, (short)95, (short)363, (short)360, (short)95, (short)95, (short)95, (short)95, (short)361, (short)93, (short)364, (short)695, (short)95, (short)95, (short)95, (short)695, (short)93, (short)695, (short)93, (short)695, (short)93, (short)365, (short)93, (short)95, (short)695, (short)372, (short)369, (short)93, (short)366, (short)367, (short)95, (short)371, (short)95, (short)374, (short)95, (short)93, (short)95, (short)368, (short)370, (short)93, (short)93, (short)95, (short)93, (short)375, (short)378, (short)93, (short)93, (short)695, (short)695, (short)95, (short)376, (short)373, (short)377, (short)95, (short)95, (short)93, (short)95, (short)695, (short)695, (short)95, (short)95, (short)320, (short)320, (short)320, (short)320, (short)380, (short)93, (short)379, (short)695, (short)95, (short)93, (short)320, (short)320, (short)320, (short)320, (short)93, (short)385, (short)93, (short)93, (short)695, (short)95, (short)383, (short)384, (short)239, (short)95, (short)239, (short)381, (short)93, (short)93, (short)95, (short)382, (short)95, (short)95, (short)93, (short)93, (short)695, (short)93, (short)695, (short)239, (short)93, (short)695, (short)95, (short)95, (short)386, (short)239, (short)695, (short)393, (short)95, (short)95, (short)387, (short)95, (short)388, (short)93, (short)95, (short)391, (short)93, (short)695, (short)93, (short)390, (short)389, (short)93, (short)695, (short)93, (short)93, (short)695, (short)695, (short)95, (short)392, (short)93, (short)95, (short)396, (short)95, (short)93, (short)93, (short)95, (short)397, (short)95, (short)95, (short)394, (short)395, (short)93, (short)695, (short)95, (short)93, (short)398, (short)695, (short)95, (short)95, (short)695, (short)93, (short)93, (short)93, (short)401, (short)93, (short)95, (short)402, (short)93, (short)95, (short)695, (short)403, (short)399, (short)93, (short)400, (short)95, (short)95, (short)95, (short)93, (short)95, (short)93, (short)93, (short)95, (short)695, (short)405, (short)93, (short)93, (short)95, (short)93, (short)93, (short)404, (short)695, (short)95, (short)93, (short)95, (short)95, (short)93, (short)407, (short)406, (short)95, (short)95, (short)410, (short)95, (short)95, (short)411, (short)408, (short)409, (short)95, (short)93, (short)93, (short)95, (short)695, (short)695, (short)93, (short)93, (short)93, (short)414, (short)416, (short)695, (short)93, (short)412, (short)93, (short)95, (short)95, (short)695, (short)413, (short)415, (short)95, (short)95, (short)95, (short)418, (short)425, (short)419, (short)95, (short)93, (short)95, (short)93, (short)93, (short)417, (short)93, (short)93, (short)93, (short)695, (short)93, (short)93, (short)93, (short)93, (short)93, (short)95, (short)423, (short)95, (short)95, (short)93, (short)95, (short)95, (short)95, (short)420, (short)95, (short)95, (short)95, (short)95, (short)95, (short)422, (short)421, (short)93, (short)695, (short)95, (short)93, (short)93, (short)424, (short)695, (short)695, (short)427, (short)93, (short)429, (short)431, (short)428, (short)433, (short)95, (short)426, (short)695, (short)95, (short)95, (short)436, (short)430, (short)434, (short)695, (short)95, (short)437, (short)93, (short)435, (short)93, (short)93, (short)93, (short)432, (short)93, (short)93, (short)93, (short)695, (short)695, (short)439, (short)93, (short)93, (short)95, (short)93, (short)95, (short)95, (short)95, (short)93, (short)95, (short)95, (short)95, (short)438, (short)440, (short)450, (short)95, (short)95, (short)93, (short)95, (short)695, (short)93, (short)441, (short)95, (short)442, (short)93, (short)695, (short)93, (short)93, (short)93, (short)93, (short)93, (short)95, (short)695, (short)443, (short)95, (short)695, (short)695, (short)93, (short)95, (short)445, (short)95, (short)95, (short)95, (short)95, (short)95, (short)444, (short)93, (short)446, (short)93, (short)448, (short)447, (short)95, (short)93, (short)449, (short)93, (short)93, (short)452, (short)93, (short)453, (short)695, (short)95, (short)93, (short)95, (short)695, (short)457, (short)451, (short)95, (short)93, (short)95, (short)95, (short)454, (short)95, (short)460, (short)458, (short)461, (short)95, (short)93, (short)455, (short)456, (short)695, (short)93, (short)95, (short)462, (short)93, (short)463, (short)695, (short)93, (short)459, (short)93, (short)466, (short)95, (short)93, (short)93, (short)468, (short)95, (short)695, (short)93, (short)95, (short)93, (short)464, (short)95, (short)465, (short)95, (short)93, (short)93, (short)95, (short)95, (short)93, (short)93, (short)467, (short)95, (short)469, (short)95, (short)93, (short)93, (short)695, (short)93, (short)95, (short)95, (short)93, (short)93, (short)95, (short)95, (short)93, (short)93, (short)93, (short)470, (short)95, (short)95, (short)471, (short)95, (short)93, (short)93, (short)95, (short)95, (short)473, (short)93, (short)95, (short)95, (short)95, (short)474, (short)472, (short)93, (short)695, (short)93, (short)95, (short)95, (short)93, (short)93, (short)476, (short)95, (short)93, (short)93, (short)695, (short)93, (short)93, (short)95, (short)475, (short)95, (short)93, (short)695, (short)95, (short)95, (short)93, (short)93, (short)95, (short)95, (short)477, (short)95, (short)95, (short)695, (short)93, (short)93, (short)95, (short)480, (short)478, (short)695, (short)95, (short)95, (short)93, (short)93, (short)479, (short)93, (short)93, (short)482, (short)95, (short)95, (short)483, (short)486, (short)695, (short)481, (short)484, (short)487, (short)95, (short)95, (short)485, (short)95, (short)95, (short)93, (short)93, (short)93, (short)93, (short)695, (short)488, (short)93, (short)695, (short)93, (short)93, (short)93, (short)695, (short)93, (short)93, (short)95, (short)95, (short)95, (short)95, (short)491, (short)93, (short)95, (short)489, (short)95, (short)95, (short)95, (short)492, (short)95, (short)95, (short)93, (short)695, (short)490, (short)695, (short)695, (short)95, (short)695, (short)493, (short)695, (short)93, (short)695, (short)495, (short)93, (short)93, (short)95, (short)496, (short)494, (short)500, (short)497, (short)93, (short)499, (short)501, (short)502, (short)95, (short)498, (short)93, (short)95, (short)95, (short)93, (short)93, (short)93, (short)695, (short)93, (short)95, (short)695, (short)695, (short)93, (short)503, (short)93, (short)95, (short)93, (short)93, (short)95, (short)95, (short)95, (short)505, (short)95, (short)93, (short)504, (short)506, (short)95, (short)93, (short)95, (short)93, (short)95, (short)95, (short)695, (short)93, (short)93, (short)93, (short)93, (short)95, (short)93, (short)695, (short)695, (short)95, (short)509, (short)95, (short)93, (short)93, (short)510, (short)95, (short)95, (short)95, (short)95, (short)695, (short)95, (short)507, (short)508, (short)93, (short)93, (short)695, (short)95, (short)95, (short)93, (short)513, (short)93, (short)93, (short)695, (short)512, (short)695, (short)516, (short)695, (short)95, (short)95, (short)511, (short)93, (short)517, (short)95, (short)93, (short)95, (short)95, (short)514, (short)93, (short)518, (short)93, (short)515, (short)93, (short)93, (short)93, (short)95, (short)695, (short)519, (short)95, (short)93, (short)93, (short)695, (short)95, (short)524, (short)95, (short)522, (short)95, (short)95, (short)95, (short)93, (short)521, (short)523, (short)526, (short)95, (short)95, (short)520, (short)93, (short)695, (short)525, (short)695, (short)93, (short)695, (short)93, (short)95, (short)93, (short)695, (short)93, (short)93, (short)93, (short)93, (short)95, (short)527, (short)695, (short)530, (short)95, (short)528, (short)95, (short)695, (short)95, (short)529, (short)95, (short)95, (short)95, (short)95, (short)695, (short)93, (short)532, (short)93, (short)93, (short)93, (short)531, (short)535, (short)93, (short)93, (short)695, (short)93, (short)695, (short)537, (short)533, (short)95, (short)93, (short)95, (short)95, (short)95, (short)695, (short)541, (short)95, (short)95, (short)536, (short)95, (short)534, (short)93, (short)93, (short)93, (short)95, (short)93, (short)93, (short)538, (short)539, (short)542, (short)93, (short)93, (short)695, (short)93, (short)540, (short)95, (short)95, (short)95, (short)543, (short)95, (short)95, (short)93, (short)695, (short)93, (short)95, (short)95, (short)545, (short)95, (short)695, (short)93, (short)93, (short)93, (short)544, (short)93, (short)93, (short)95, (short)548, (short)95, (short)546, (short)695, (short)549, (short)93, (short)551, (short)95, (short)95, (short)95, (short)93, (short)95, (short)95, (short)695, (short)93, (short)695, (short)553, (short)547, (short)554, (short)95, (short)550, (short)93, (short)93, (short)695, (short)95, (short)695, (short)93, (short)552, (short)95, (short)555, (short)558, (short)695, (short)93, (short)561, (short)93, (short)95, (short)95, (short)559, (short)93, (short)556, (short)95, (short)93, (short)93, (short)695, (short)93, (short)557, (short)95, (short)695, (short)95, (short)93, (short)560, (short)93, (short)95, (short)93, (short)695, (short)95, (short)95, (short)562, (short)95, (short)93, (short)93, (short)563, (short)571, (short)95, (short)93, (short)95, (short)93, (short)95, (short)564, (short)93, (short)565, (short)695, (short)93, (short)95, (short)95, (short)566, (short)93, (short)93, (short)95, (short)93, (short)95, (short)93, (short)567, (short)95, (short)93, (short)568, (short)95, (short)93, (short)93, (short)569, (short)95, (short)95, (short)93, (short)95, (short)695, (short)95, (short)695, (short)695, (short)95, (short)93, (short)573, (short)95, (short)95, (short)93, (short)93, (short)93, (short)95, (short)574, (short)575, (short)572, (short)576, (short)570, (short)695, (short)95, (short)93, (short)93, (short)93, (short)95, (short)95, (short)95, (short)93, (short)695, (short)93, (short)695, (short)695, (short)695, (short)578, (short)579, (short)95, (short)95, (short)95, (short)93, (short)93, (short)93, (short)95, (short)587, (short)95, (short)584, (short)577, (short)581, (short)93, (short)93, (short)588, (short)93, (short)93, (short)95, (short)95, (short)95, (short)695, (short)695, (short)586, (short)582, (short)590, (short)580, (short)95, (short)95, (short)93, (short)95, (short)95, (short)93, (short)585, (short)93, (short)583, (short)593, (short)594, (short)93, (short)93, (short)93, (short)93, (short)93, (short)95, (short)589, (short)595, (short)95, (short)93, (short)95, (short)93, (short)93, (short)93, (short)95, (short)95, (short)95, (short)95, (short)95, (short)93, (short)93, (short)596, (short)695, (short)95, (short)597, (short)95, (short)95, (short)95, (short)695, (short)695, (short)695, (short)93, (short)93, (short)95, (short)95, (short)93, (short)600, (short)695, (short)695, (short)695, (short)606, (short)598, (short)603, (short)607, (short)599, (short)95, (short)95, (short)93, (short)93, (short)95, (short)601, (short)608, (short)602, (short)604, (short)93, (short)695, (short)93, (short)93, (short)695, (short)695, (short)695, (short)95, (short)95, (short)93, (short)611, (short)615, (short)93, (short)610, (short)95, (short)609, (short)95, (short)95, (short)616, (short)617, (short)620, (short)93, (short)618, (short)95, (short)695, (short)93, (short)95, (short)621, (short)93, (short)93, (short)93, (short)612, (short)93, (short)93, (short)93, (short)95, (short)614, (short)93, (short)613, (short)95, (short)695, (short)622, (short)95, (short)95, (short)95, (short)695, (short)95, (short)95, (short)95, (short)615, (short)93, (short)95, (short)623, (short)93, (short)634, (short)695, (short)616, (short)617, (short)93, (short)624, (short)618, (short)635, (short)617, (short)695, (short)95, (short)618, (short)93, (short)95, (short)637, (short)625, (short)93, (short)628, (short)95, (short)695, (short)626, (short)616, (short)617, (short)640, (short)629, (short)618, (short)95, (short)695, (short)639, (short)644, (short)95, (short)627, (short)631, (short)645, (short)695, (short)632, (short)695, (short)617, (short)634, (short)647, (short)618, (short)631, (short)695, (short)641, (short)632, (short)635, (short)617, (short)649, (short)651, (short)618, (short)650, (short)695, (short)93, (short)642, (short)695, (short)635, (short)617, (short)637, (short)93, (short)618, (short)695, (short)93, (short)643, (short)652, (short)616, (short)617, (short)95, (short)93, (short)618, (short)644, (short)653, (short)654, (short)95, (short)93, (short)655, (short)95, (short)695, (short)617, (short)645, (short)695, (short)618, (short)95, (short)695, (short)629, (short)647, (short)647, (short)631, (short)95, (short)93, (short)632, (short)657, (short)631, (short)649, (short)649, (short)632, (short)650, (short)650, (short)662, (short)695, (short)695, (short)695, (short)695, (short)95, (short)663, (short)695, (short)617, (short)695, (short)658, (short)618, (short)659, (short)651, (short)649, (short)652, (short)660, (short)650, (short)661, (short)665, (short)635, (short)617, (short)653, (short)654, (short)618, (short)670, (short)655, (short)667, (short)695, (short)93, (short)668, (short)673, (short)671, (short)654, (short)93, (short)93, (short)655, (short)93, (short)653, (short)654, (short)695, (short)695, (short)655, (short)95, (short)662, (short)663, (short)647, (short)695, (short)95, (short)95, (short)665, (short)95, (short)617, (short)649, (short)649, (short)618, (short)650, (short)650, (short)667, (short)665, (short)678, (short)668, (short)695, (short)695, (short)679, (short)695, (short)670, (short)667, (short)654, (short)695, (short)668, (short)655, (short)667, (short)671, (short)654, (short)668, (short)681, (short)655, (short)685, (short)674, (short)675, (short)676, (short)93, (short)673, (short)683, (short)671, (short)654, (short)684, (short)93, (short)655, (short)653, (short)654, (short)677, (short)93, (short)655, (short)93, (short)95, (short)678, (short)695, (short)93, (short)695, (short)695, (short)95, (short)679, (short)665, (short)654, (short)93, (short)95, (short)655, (short)95, (short)681, (short)667, (short)667, (short)95, (short)668, (short)668, (short)681, (short)688, (short)683, (short)695, (short)95, (short)684, (short)689, (short)688, (short)683, (short)654, (short)695, (short)684, (short)655, (short)685, (short)683, (short)654, (short)93, (short)684, (short)655, (short)686, (short)671, (short)654, (short)687, (short)689, (short)655, (short)681, (short)691, (short)93, (short)93, (short)93, (short)95, (short)683, (short)695, (short)683, (short)684, (short)695, (short)684, (short)695, (short)695, (short)695, (short)695, (short)95, (short)95, (short)95, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)692, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)693, (short)695, (short)695, (short)695, (short)695, (short)695, (short)694, (short)58, (short)58, (short)58, (short)58, (short)58, (short)58, (short)58, (short)58, (short)58, (short)58, (short)65, (short)65, (short)65, (short)65, (short)695, (short)65, (short)65, (short)65, (short)65, (short)65, (short)94, (short)695, (short)695, (short)695, (short)94, (short)94, (short)94, (short)160, (short)160, (short)161, (short)161, (short)244, (short)244, (short)244, (short)245, (short)245, (short)592, (short)592, (short)592, (short)592, (short)619, (short)695, (short)695, (short)695, (short)619, (short)619, (short)619, (short)619, (short)619, (short)630, (short)630, (short)695, (short)695, (short)695, (short)630, (short)630, (short)630, (short)630, (short)636, (short)695, (short)695, (short)695, (short)636, (short)636, (short)636, (short)636, (short)636, (short)646, (short)646, (short)695, (short)695, (short)695, (short)646, (short)646, (short)646, (short)646, (short)648, (short)648, (short)695, (short)695, (short)695, (short)648, (short)648, (short)648, (short)648, (short)656, (short)695, (short)695, (short)695, (short)656, (short)656, (short)656, (short)656, (short)656, (short)664, (short)664, (short)695, (short)695, (short)695, (short)664, (short)664, (short)664, (short)664, (short)666, (short)666, (short)695, (short)695, (short)695, (short)666, (short)666, (short)666, (short)666, (short)672, (short)695, (short)695, (short)695, (short)672, (short)672, (short)672, (short)672, (short)672, (short)680, (short)680, (short)695, (short)695, (short)695, (short)680, (short)680, (short)680, (short)680, (short)682, (short)682, (short)695, (short)695, (short)695, (short)682, (short)682, (short)682, (short)682, (short)690, (short)690, (short)695, (short)695, (short)695, (short)690, (short)690, (short)690, (short)690, (short)3, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695
};

static const short int yy_chk[2520] = 
{
(short)0, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)9, (short)11, (short)11, (short)12, (short)17, (short)54, (short)20, (short)19, (short)20, (short)20, (short)20, (short)20, (short)28, (short)28, (short)21, (short)30, (short)17, (short)19, (short)19, (short)21, (short)12, (short)24, (short)58, (short)26, (short)654, (short)24, (short)96, (short)21, (short)621, (short)30, (short)42, (short)9, (short)22, (short)617, (short)22, (short)22, (short)22, (short)22, (short)26, (short)31, (short)26, (short)26, (short)31, (short)31, (short)42, (short)22, (short)54, (short)44, (short)22, (short)22, (short)22, (short)37, (short)592, (short)58, (short)35, (short)36, (short)31, (short)96, (short)588, (short)38, (short)22, (short)44, (short)65, (short)66, (short)571, (short)37, (short)42, (short)22, (short)35, (short)36, (short)587, (short)66, (short)40, (short)38, (short)94, (short)22, (short)42, (short)587, (short)22, (short)23, (short)97, (short)23, (short)23, (short)23, (short)23, (short)35, (short)40, (short)39, (short)94, (short)65, (short)35, (short)38, (short)23, (short)44, (short)35, (short)23, (short)23, (short)41, (short)38, (short)37, (short)36, (short)39, (short)38, (short)35, (short)36, (short)38, (short)36, (short)23, (short)95, (short)620, (short)43, (short)41, (short)93, (short)45, (short)23, (short)40, (short)620, (short)40, (short)46, (short)39, (short)39, (short)47, (short)23, (short)39, (short)43, (short)48, (short)40, (short)45, (short)49, (short)92, (short)39, (short)88, (short)46, (short)39, (short)50, (short)47, (short)103, (short)41, (short)52, (short)48, (short)41, (short)73, (short)49, (short)41, (short)51, (short)45, (short)100, (short)43, (short)50, (short)45, (short)103, (short)60, (short)52, (short)34, (short)43, (short)43, (short)27, (short)47, (short)51, (short)43, (short)100, (short)48, (short)81, (short)81, (short)48, (short)48, (short)46, (short)49, (short)124, (short)46, (short)52, (short)16, (short)13, (short)8, (short)50, (short)48, (short)48, (short)52, (short)48, (short)50, (short)101, (short)81, (short)124, (short)49, (short)51, (short)74, (short)74, (short)74, (short)74, (short)81, (short)51, (short)103, (short)102, (short)104, (short)101, (short)105, (short)74, (short)74, (short)3, (short)74, (short)100, (short)0, (short)78, (short)78, (short)78, (short)78, (short)102, (short)104, (short)0, (short)105, (short)106, (short)74, (short)74, (short)78, (short)78, (short)80, (short)78, (short)80, (short)74, (short)107, (short)80, (short)80, (short)80, (short)80, (short)106, (short)101, (short)0, (short)0, (short)78, (short)78, (short)108, (short)0, (short)0, (short)107, (short)109, (short)78, (short)79, (short)104, (short)79, (short)79, (short)79, (short)79, (short)102, (short)110, (short)108, (short)105, (short)106, (short)111, (short)109, (short)79, (short)0, (short)115, (short)79, (short)79, (short)0, (short)112, (short)113, (short)110, (short)114, (short)116, (short)117, (short)111, (short)108, (short)120, (short)79, (short)115, (short)109, (short)118, (short)107, (short)112, (short)113, (short)79, (short)114, (short)116, (short)117, (short)119, (short)121, (short)120, (short)0, (short)79, (short)99, (short)118, (short)0, (short)0, (short)122, (short)0, (short)123, (short)0, (short)110, (short)119, (short)121, (short)0, (short)112, (short)113, (short)99, (short)112, (short)125, (short)111, (short)122, (short)113, (short)123, (short)114, (short)115, (short)0, (short)126, (short)112, (short)0, (short)127, (short)116, (short)120, (short)125, (short)117, (short)99, (short)99, (short)99, (short)99, (short)99, (short)118, (short)126, (short)128, (short)99, (short)127, (short)0, (short)119, (short)121, (short)129, (short)130, (short)131, (short)99, (short)99, (short)99, (short)134, (short)99, (short)128, (short)122, (short)132, (short)123, (short)133, (short)126, (short)129, (short)130, (short)131, (short)616, (short)125, (short)135, (short)134, (short)136, (short)126, (short)137, (short)132, (short)616, (short)133, (short)138, (short)616, (short)126, (short)0, (short)127, (short)139, (short)135, (short)0, (short)136, (short)0, (short)137, (short)140, (short)128, (short)0, (short)138, (short)131, (short)132, (short)129, (short)0, (short)139, (short)141, (short)131, (short)144, (short)133, (short)0, (short)140, (short)142, (short)130, (short)137, (short)134, (short)133, (short)137, (short)136, (short)138, (short)141, (short)133, (short)144, (short)0, (short)135, (short)143, (short)142, (short)145, (short)137, (short)146, (short)137, (short)139, (short)147, (short)157, (short)157, (short)0, (short)136, (short)140, (short)0, (short)143, (short)0, (short)145, (short)152, (short)146, (short)152, (short)174, (short)147, (short)152, (short)152, (short)152, (short)152, (short)0, (short)157, (short)141, (short)160, (short)160, (short)144, (short)142, (short)0, (short)174, (short)157, (short)158, (short)158, (short)158, (short)158, (short)143, (short)165, (short)145, (short)166, (short)168, (short)145, (short)167, (short)147, (short)160, (short)143, (short)154, (short)154, (short)154, (short)154, (short)146, (short)165, (short)160, (short)166, (short)168, (short)0, (short)167, (short)154, (short)154, (short)155, (short)154, (short)155, (short)174, (short)0, (short)155, (short)155, (short)155, (short)155, (short)159, (short)159, (short)159, (short)159, (short)154, (short)154, (short)0, (short)169, (short)168, (short)167, (short)170, (short)154, (short)159, (short)0, (short)159, (short)171, (short)172, (short)173, (short)165, (short)165, (short)167, (short)169, (short)166, (short)175, (short)170, (short)176, (short)178, (short)159, (short)177, (short)171, (short)172, (short)173, (short)179, (short)159, (short)180, (short)181, (short)183, (short)175, (short)182, (short)176, (short)178, (short)0, (short)177, (short)0, (short)184, (short)185, (short)179, (short)0, (short)180, (short)181, (short)183, (short)171, (short)182, (short)0, (short)0, (short)170, (short)172, (short)178, (short)184, (short)185, (short)0, (short)169, (short)187, (short)177, (short)186, (short)188, (short)172, (short)181, (short)176, (short)189, (short)0, (short)190, (short)173, (short)175, (short)182, (short)193, (short)187, (short)191, (short)186, (short)188, (short)180, (short)0, (short)0, (short)189, (short)183, (short)190, (short)192, (short)0, (short)0, (short)193, (short)195, (short)191, (short)194, (short)184, (short)185, (short)185, (short)186, (short)0, (short)198, (short)0, (short)192, (short)189, (short)187, (short)190, (short)195, (short)196, (short)194, (short)197, (short)193, (short)199, (short)188, (short)190, (short)198, (short)191, (short)0, (short)200, (short)0, (short)201, (short)202, (short)196, (short)0, (short)197, (short)192, (short)199, (short)203, (short)204, (short)192, (short)0, (short)194, (short)200, (short)198, (short)201, (short)202, (short)205, (short)195, (short)206, (short)207, (short)208, (short)203, (short)204, (short)210, (short)196, (short)209, (short)197, (short)211, (short)212, (short)205, (short)205, (short)214, (short)206, (short)207, (short)208, (short)209, (short)213, (short)210, (short)215, (short)209, (short)0, (short)211, (short)212, (short)0, (short)216, (short)214, (short)201, (short)202, (short)204, (short)217, (short)213, (short)218, (short)215, (short)0, (short)206, (short)203, (short)208, (short)207, (short)216, (short)219, (short)0, (short)0, (short)0, (short)217, (short)220, (short)218, (short)221, (short)214, (short)222, (short)223, (short)224, (short)212, (short)225, (short)219, (short)211, (short)210, (short)213, (short)226, (short)220, (short)228, (short)221, (short)0, (short)222, (short)223, (short)224, (short)227, (short)225, (short)229, (short)230, (short)215, (short)0, (short)226, (short)231, (short)228, (short)235, (short)219, (short)218, (short)217, (short)233, (short)227, (short)221, (short)229, (short)230, (short)232, (short)224, (short)234, (short)231, (short)0, (short)235, (short)245, (short)263, (short)246, (short)233, (short)0, (short)220, (short)222, (short)0, (short)232, (short)265, (short)234, (short)223, (short)227, (short)225, (short)245, (short)263, (short)246, (short)226, (short)247, (short)230, (short)228, (short)233, (short)0, (short)265, (short)229, (short)0, (short)0, (short)0, (short)235, (short)232, (short)234, (short)0, (short)247, (short)231, (short)236, (short)236, (short)236, (short)236, (short)237, (short)237, (short)237, (short)237, (short)240, (short)240, (short)240, (short)240, (short)246, (short)243, (short)243, (short)238, (short)237, (short)238, (short)237, (short)248, (short)238, (short)238, (short)238, (short)238, (short)241, (short)241, (short)241, (short)241, (short)249, (short)250, (short)252, (short)237, (short)243, (short)248, (short)247, (short)251, (short)241, (short)237, (short)241, (short)253, (short)243, (short)254, (short)249, (short)250, (short)252, (short)0, (short)255, (short)257, (short)256, (short)251, (short)0, (short)241, (short)258, (short)253, (short)261, (short)254, (short)259, (short)241, (short)260, (short)248, (short)255, (short)257, (short)256, (short)262, (short)249, (short)264, (short)258, (short)266, (short)261, (short)251, (short)259, (short)267, (short)260, (short)268, (short)250, (short)0, (short)0, (short)262, (short)0, (short)264, (short)252, (short)266, (short)253, (short)256, (short)255, (short)267, (short)269, (short)268, (short)261, (short)253, (short)254, (short)270, (short)259, (short)0, (short)257, (short)258, (short)271, (short)273, (short)260, (short)272, (short)269, (short)274, (short)275, (short)276, (short)277, (short)270, (short)0, (short)264, (short)279, (short)262, (short)271, (short)273, (short)0, (short)272, (short)280, (short)274, (short)275, (short)276, (short)277, (short)278, (short)267, (short)281, (short)279, (short)268, (short)270, (short)282, (short)269, (short)283, (short)280, (short)284, (short)273, (short)285, (short)271, (short)278, (short)272, (short)281, (short)286, (short)0, (short)629, (short)282, (short)287, (short)283, (short)288, (short)284, (short)0, (short)285, (short)629, (short)275, (short)289, (short)629, (short)286, (short)279, (short)274, (short)276, (short)287, (short)290, (short)288, (short)291, (short)277, (short)0, (short)289, (short)292, (short)289, (short)278, (short)293, (short)0, (short)0, (short)294, (short)295, (short)290, (short)0, (short)291, (short)296, (short)282, (short)297, (short)292, (short)287, (short)298, (short)293, (short)284, (short)283, (short)294, (short)295, (short)299, (short)286, (short)0, (short)296, (short)288, (short)297, (short)300, (short)0, (short)298, (short)301, (short)303, (short)302, (short)304, (short)0, (short)299, (short)0, (short)294, (short)305, (short)306, (short)307, (short)300, (short)295, (short)290, (short)301, (short)303, (short)302, (short)304, (short)292, (short)310, (short)296, (short)0, (short)305, (short)306, (short)307, (short)0, (short)308, (short)0, (short)309, (short)0, (short)311, (short)297, (short)312, (short)310, (short)0, (short)304, (short)301, (short)313, (short)298, (short)299, (short)308, (short)303, (short)309, (short)306, (short)311, (short)314, (short)312, (short)300, (short)302, (short)315, (short)316, (short)313, (short)317, (short)307, (short)310, (short)321, (short)318, (short)0, (short)0, (short)314, (short)308, (short)305, (short)309, (short)315, (short)316, (short)322, (short)317, (short)0, (short)0, (short)321, (short)318, (short)319, (short)319, (short)319, (short)319, (short)313, (short)323, (short)312, (short)0, (short)322, (short)325, (short)320, (short)320, (short)320, (short)320, (short)326, (short)321, (short)324, (short)327, (short)0, (short)323, (short)317, (short)318, (short)320, (short)325, (short)320, (short)314, (short)328, (short)330, (short)326, (short)316, (short)324, (short)327, (short)329, (short)331, (short)0, (short)332, (short)0, (short)320, (short)333, (short)0, (short)328, (short)330, (short)322, (short)320, (short)0, (short)329, (short)329, (short)331, (short)323, (short)332, (short)324, (short)334, (short)333, (short)327, (short)335, (short)0, (short)336, (short)326, (short)325, (short)337, (short)0, (short)338, (short)339, (short)0, (short)0, (short)334, (short)328, (short)340, (short)335, (short)332, (short)336, (short)341, (short)342, (short)337, (short)333, (short)338, (short)339, (short)330, (short)331, (short)343, (short)0, (short)340, (short)344, (short)334, (short)0, (short)341, (short)342, (short)0, (short)345, (short)346, (short)347, (short)337, (short)348, (short)343, (short)338, (short)349, (short)344, (short)0, (short)340, (short)335, (short)350, (short)336, (short)345, (short)346, (short)347, (short)351, (short)348, (short)352, (short)353, (short)349, (short)0, (short)343, (short)354, (short)355, (short)350, (short)356, (short)359, (short)342, (short)0, (short)351, (short)357, (short)352, (short)353, (short)358, (short)345, (short)344, (short)354, (short)355, (short)348, (short)356, (short)359, (short)349, (short)346, (short)347, (short)357, (short)360, (short)361, (short)358, (short)0, (short)0, (short)362, (short)363, (short)364, (short)352, (short)354, (short)0, (short)365, (short)350, (short)366, (short)360, (short)361, (short)0, (short)351, (short)353, (short)362, (short)363, (short)364, (short)357, (short)366, (short)358, (short)365, (short)367, (short)366, (short)368, (short)369, (short)356, (short)370, (short)371, (short)372, (short)0, (short)373, (short)374, (short)375, (short)376, (short)377, (short)367, (short)364, (short)368, (short)369, (short)378, (short)370, (short)371, (short)372, (short)361, (short)373, (short)374, (short)375, (short)376, (short)377, (short)363, (short)362, (short)379, (short)0, (short)378, (short)380, (short)381, (short)365, (short)0, (short)0, (short)369, (short)382, (short)371, (short)373, (short)370, (short)375, (short)379, (short)367, (short)0, (short)380, (short)381, (short)378, (short)372, (short)376, (short)0, (short)382, (short)378, (short)383, (short)377, (short)384, (short)385, (short)386, (short)374, (short)387, (short)388, (short)389, (short)0, (short)0, (short)381, (short)390, (short)393, (short)383, (short)391, (short)384, (short)385, (short)386, (short)392, (short)387, (short)388, (short)389, (short)380, (short)382, (short)393, (short)390, (short)393, (short)394, (short)391, (short)0, (short)395, (short)383, (short)392, (short)385, (short)397, (short)0, (short)396, (short)398, (short)400, (short)399, (short)401, (short)394, (short)0, (short)386, (short)395, (short)0, (short)0, (short)403, (short)397, (short)388, (short)396, (short)398, (short)400, (short)399, (short)401, (short)387, (short)402, (short)389, (short)404, (short)391, (short)390, (short)403, (short)405, (short)392, (short)406, (short)407, (short)395, (short)408, (short)396, (short)0, (short)402, (short)409, (short)404, (short)0, (short)400, (short)394, (short)405, (short)410, (short)406, (short)407, (short)397, (short)408, (short)403, (short)401, (short)403, (short)409, (short)411, (short)398, (short)399, (short)0, (short)412, (short)410, (short)403, (short)413, (short)403, (short)0, (short)414, (short)402, (short)415, (short)406, (short)411, (short)416, (short)417, (short)408, (short)412, (short)0, (short)418, (short)413, (short)419, (short)404, (short)414, (short)405, (short)415, (short)420, (short)421, (short)416, (short)417, (short)422, (short)423, (short)407, (short)418, (short)409, (short)419, (short)424, (short)425, (short)0, (short)426, (short)420, (short)421, (short)427, (short)428, (short)422, (short)423, (short)429, (short)430, (short)431, (short)412, (short)424, (short)425, (short)413, (short)426, (short)432, (short)433, (short)427, (short)428, (short)420, (short)434, (short)429, (short)430, (short)431, (short)421, (short)416, (short)435, (short)0, (short)436, (short)432, (short)433, (short)437, (short)439, (short)424, (short)434, (short)438, (short)440, (short)0, (short)442, (short)441, (short)435, (short)422, (short)436, (short)443, (short)0, (short)437, (short)439, (short)444, (short)445, (short)438, (short)440, (short)430, (short)442, (short)441, (short)0, (short)446, (short)447, (short)443, (short)435, (short)431, (short)0, (short)444, (short)445, (short)448, (short)449, (short)433, (short)450, (short)451, (short)437, (short)446, (short)447, (short)438, (short)441, (short)0, (short)436, (short)439, (short)443, (short)448, (short)449, (short)440, (short)450, (short)451, (short)452, (short)453, (short)454, (short)455, (short)0, (short)444, (short)456, (short)0, (short)457, (short)458, (short)461, (short)0, (short)459, (short)460, (short)452, (short)453, (short)454, (short)455, (short)449, (short)462, (short)456, (short)447, (short)457, (short)458, (short)461, (short)451, (short)459, (short)460, (short)463, (short)0, (short)448, (short)0, (short)0, (short)462, (short)0, (short)452, (short)0, (short)464, (short)0, (short)454, (short)466, (short)465, (short)463, (short)455, (short)453, (short)460, (short)456, (short)467, (short)459, (short)460, (short)461, (short)464, (short)458, (short)468, (short)466, (short)465, (short)469, (short)470, (short)471, (short)0, (short)472, (short)467, (short)0, (short)0, (short)473, (short)462, (short)474, (short)468, (short)475, (short)476, (short)469, (short)470, (short)471, (short)464, (short)472, (short)477, (short)463, (short)465, (short)473, (short)478, (short)474, (short)479, (short)475, (short)476, (short)0, (short)480, (short)481, (short)482, (short)484, (short)477, (short)483, (short)0, (short)0, (short)478, (short)472, (short)479, (short)485, (short)486, (short)473, (short)480, (short)481, (short)482, (short)484, (short)0, (short)483, (short)470, (short)471, (short)487, (short)488, (short)0, (short)485, (short)486, (short)489, (short)478, (short)490, (short)491, (short)0, (short)476, (short)0, (short)481, (short)0, (short)487, (short)488, (short)475, (short)493, (short)483, (short)489, (short)492, (short)490, (short)491, (short)479, (short)494, (short)485, (short)495, (short)480, (short)496, (short)497, (short)498, (short)493, (short)0, (short)486, (short)492, (short)499, (short)500, (short)0, (short)494, (short)491, (short)495, (short)489, (short)496, (short)497, (short)498, (short)501, (short)488, (short)490, (short)493, (short)499, (short)500, (short)487, (short)502, (short)0, (short)492, (short)0, (short)503, (short)0, (short)504, (short)501, (short)505, (short)0, (short)506, (short)507, (short)508, (short)510, (short)502, (short)494, (short)0, (short)499, (short)503, (short)496, (short)504, (short)0, (short)505, (short)497, (short)506, (short)507, (short)508, (short)510, (short)0, (short)509, (short)501, (short)512, (short)511, (short)513, (short)500, (short)503, (short)514, (short)515, (short)0, (short)516, (short)0, (short)506, (short)501, (short)509, (short)517, (short)512, (short)511, (short)513, (short)0, (short)510, (short)514, (short)515, (short)504, (short)516, (short)502, (short)518, (short)519, (short)520, (short)517, (short)521, (short)522, (short)507, (short)508, (short)511, (short)523, (short)524, (short)0, (short)525, (short)509, (short)518, (short)519, (short)520, (short)513, (short)521, (short)522, (short)526, (short)0, (short)527, (short)523, (short)524, (short)516, (short)525, (short)0, (short)528, (short)529, (short)530, (short)515, (short)534, (short)531, (short)526, (short)521, (short)527, (short)519, (short)0, (short)522, (short)532, (short)524, (short)528, (short)529, (short)530, (short)533, (short)534, (short)531, (short)0, (short)536, (short)0, (short)526, (short)520, (short)527, (short)532, (short)523, (short)535, (short)537, (short)0, (short)533, (short)0, (short)538, (short)525, (short)536, (short)528, (short)531, (short)0, (short)539, (short)534, (short)540, (short)535, (short)537, (short)532, (short)541, (short)529, (short)538, (short)542, (short)543, (short)0, (short)544, (short)530, (short)539, (short)0, (short)540, (short)545, (short)533, (short)546, (short)541, (short)547, (short)0, (short)542, (short)543, (short)535, (short)544, (short)548, (short)549, (short)536, (short)549, (short)545, (short)550, (short)546, (short)551, (short)547, (short)537, (short)552, (short)540, (short)0, (short)553, (short)548, (short)549, (short)542, (short)554, (short)555, (short)550, (short)556, (short)551, (short)557, (short)543, (short)552, (short)558, (short)545, (short)553, (short)559, (short)560, (short)547, (short)554, (short)555, (short)561, (short)556, (short)0, (short)557, (short)0, (short)0, (short)558, (short)562, (short)552, (short)559, (short)560, (short)563, (short)564, (short)566, (short)561, (short)554, (short)555, (short)550, (short)556, (short)548, (short)0, (short)562, (short)565, (short)567, (short)568, (short)563, (short)564, (short)566, (short)570, (short)0, (short)574, (short)0, (short)0, (short)0, (short)560, (short)561, (short)565, (short)567, (short)568, (short)576, (short)572, (short)573, (short)570, (short)569, (short)574, (short)566, (short)559, (short)563, (short)569, (short)575, (short)569, (short)577, (short)578, (short)576, (short)572, (short)573, (short)0, (short)0, (short)568, (short)564, (short)570, (short)562, (short)569, (short)575, (short)579, (short)577, (short)578, (short)580, (short)567, (short)581, (short)565, (short)572, (short)573, (short)582, (short)583, (short)584, (short)586, (short)585, (short)579, (short)569, (short)575, (short)580, (short)589, (short)581, (short)594, (short)590, (short)595, (short)582, (short)583, (short)584, (short)586, (short)585, (short)596, (short)593, (short)577, (short)0, (short)589, (short)578, (short)594, (short)590, (short)595, (short)0, (short)0, (short)0, (short)597, (short)598, (short)596, (short)593, (short)599, (short)582, (short)0, (short)0, (short)0, (short)589, (short)580, (short)585, (short)590, (short)581, (short)597, (short)598, (short)600, (short)601, (short)599, (short)583, (short)593, (short)584, (short)586, (short)602, (short)0, (short)603, (short)604, (short)0, (short)0, (short)0, (short)600, (short)601, (short)607, (short)598, (short)605, (short)608, (short)597, (short)602, (short)596, (short)603, (short)604, (short)605, (short)605, (short)606, (short)610, (short)605, (short)607, (short)0, (short)606, (short)608, (short)606, (short)609, (short)611, (short)612, (short)599, (short)613, (short)614, (short)622, (short)610, (short)602, (short)623, (short)600, (short)606, (short)0, (short)607, (short)609, (short)611, (short)612, (short)0, (short)613, (short)614, (short)622, (short)615, (short)624, (short)623, (short)607, (short)625, (short)618, (short)0, (short)615, (short)615, (short)626, (short)609, (short)615, (short)618, (short)618, (short)0, (short)624, (short)618, (short)627, (short)625, (short)619, (short)610, (short)628, (short)614, (short)626, (short)0, (short)611, (short)619, (short)619, (short)623, (short)630, (short)619, (short)627, (short)0, (short)622, (short)631, (short)628, (short)612, (short)630, (short)632, (short)0, (short)630, (short)0, (short)631, (short)634, (short)635, (short)631, (short)632, (short)0, (short)624, (short)632, (short)634, (short)634, (short)635, (short)636, (short)634, (short)635, (short)0, (short)639, (short)626, (short)0, (short)636, (short)636, (short)637, (short)640, (short)636, (short)0, (short)641, (short)628, (short)638, (short)637, (short)637, (short)639, (short)643, (short)637, (short)644, (short)638, (short)638, (short)640, (short)642, (short)638, (short)641, (short)0, (short)644, (short)645, (short)0, (short)644, (short)643, (short)0, (short)646, (short)647, (short)648, (short)645, (short)642, (short)657, (short)645, (short)639, (short)646, (short)647, (short)648, (short)646, (short)647, (short)648, (short)649, (short)0, (short)0, (short)0, (short)0, (short)657, (short)650, (short)0, (short)649, (short)0, (short)640, (short)649, (short)641, (short)651, (short)650, (short)652, (short)642, (short)650, (short)643, (short)653, (short)651, (short)651, (short)652, (short)652, (short)651, (short)655, (short)652, (short)653, (short)0, (short)658, (short)653, (short)656, (short)655, (short)655, (short)659, (short)660, (short)655, (short)661, (short)656, (short)656, (short)0, (short)0, (short)656, (short)658, (short)662, (short)663, (short)664, (short)0, (short)659, (short)660, (short)665, (short)661, (short)662, (short)663, (short)664, (short)662, (short)663, (short)664, (short)665, (short)666, (short)667, (short)665, (short)0, (short)0, (short)668, (short)0, (short)670, (short)666, (short)667, (short)0, (short)666, (short)667, (short)668, (short)670, (short)670, (short)668, (short)671, (short)670, (short)672, (short)658, (short)659, (short)660, (short)674, (short)673, (short)671, (short)672, (short)672, (short)671, (short)675, (short)672, (short)673, (short)673, (short)661, (short)676, (short)673, (short)677, (short)674, (short)678, (short)0, (short)687, (short)0, (short)0, (short)675, (short)679, (short)680, (short)678, (short)686, (short)676, (short)678, (short)677, (short)681, (short)679, (short)680, (short)687, (short)679, (short)680, (short)682, (short)683, (short)681, (short)0, (short)686, (short)681, (short)684, (short)688, (short)682, (short)683, (short)0, (short)682, (short)683, (short)685, (short)684, (short)688, (short)691, (short)684, (short)688, (short)675, (short)685, (short)685, (short)676, (short)689, (short)685, (short)690, (short)686, (short)692, (short)693, (short)694, (short)691, (short)689, (short)0, (short)690, (short)689, (short)0, (short)690, (short)0, (short)0, (short)0, (short)0, (short)692, (short)693, (short)694, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)691, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)692, (short)0, (short)0, (short)0, (short)0, (short)0, (short)693, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)696, (short)697, (short)697, (short)697, (short)697, (short)0, (short)697, (short)697, (short)697, (short)697, (short)697, (short)698, (short)0, (short)0, (short)0, (short)698, (short)698, (short)698, (short)699, (short)699, (short)700, (short)700, (short)701, (short)701, (short)701, (short)702, (short)702, (short)703, (short)703, (short)703, (short)703, (short)704, (short)0, (short)0, (short)0, (short)704, (short)704, (short)704, (short)704, (short)704, (short)705, (short)705, (short)0, (short)0, (short)0, (short)705, (short)705, (short)705, (short)705, (short)706, (short)0, (short)0, (short)0, (short)706, (short)706, (short)706, (short)706, (short)706, (short)707, (short)707, (short)0, (short)0, (short)0, (short)707, (short)707, (short)707, (short)707, (short)708, (short)708, (short)0, (short)0, (short)0, (short)708, (short)708, (short)708, (short)708, (short)709, (short)0, (short)0, (short)0, (short)709, (short)709, (short)709, (short)709, (short)709, (short)710, (short)710, (short)0, (short)0, (short)0, (short)710, (short)710, (short)710, (short)710, (short)711, (short)711, (short)0, (short)0, (short)0, (short)711, (short)711, (short)711, (short)711, (short)712, (short)0, (short)0, (short)0, (short)712, (short)712, (short)712, (short)712, (short)712, (short)713, (short)713, (short)0, (short)0, (short)0, (short)713, (short)713, (short)713, (short)713, (short)714, (short)714, (short)0, (short)0, (short)0, (short)714, (short)714, (short)714, (short)714, (short)715, (short)715, (short)0, (short)0, (short)0, (short)715, (short)715, (short)715, (short)715, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695, (short)695
};

static yy_state_type yy_last_accepting_state;

static char * yy_last_accepting_cpos;

char * yytext;

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
} YYSTYPE;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_Enumerator;

struct Enumerator;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_InitDeclarator;

struct InitDeclarator;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass_AsmField;

struct AsmField;

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
if(yy_current_state >= 696)
yy_c = yy_meta[(unsigned int)yy_c];
}
yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int)yy_c];
++yy_cp;
}while(yy_base[yy_current_state] != (short)2449);
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
return (287);
}
break;
case 5:
TESTTTT();
{
return (316);
}
break;
case 6:
TESTTTT();
{
return (307);
}
break;
case 7:
TESTTTT();
{
return (289);
}
break;
case 8:
TESTTTT();
{
return (299);
}
break;
case 9:
TESTTTT();
{
return (315);
}
break;
case 10:
TESTTTT();
{
return (308);
}
break;
case 11:
TESTTTT();
{
return (312);
}
break;
case 12:
TESTTTT();
{
return (298);
}
break;
case 13:
TESTTTT();
{
return (319);
}
break;
case 14:
TESTTTT();
{
return (305);
}
break;
case 15:
TESTTTT();
{
return (285);
}
break;
case 16:
TESTTTT();
{
return (297);
}
break;
case 17:
TESTTTT();
{
return (313);
}
break;
case 18:
TESTTTT();
{
return (314);
}
break;
case 19:
TESTTTT();
{
return (309);
}
break;
case 20:
TESTTTT();
{
return (291);
}
break;
case 21:
TESTTTT();
{
return (292);
}
break;
case 22:
TESTTTT();
{
return (294);
}
break;
case 23:
TESTTTT();
{
return (288);
}
break;
case 24:
TESTTTT();
{
return (317);
}
break;
case 25:
TESTTTT();
{
return (290);
}
break;
case 26:
TESTTTT();
{
return (295);
}
break;
case 27:
TESTTTT();
{
return (295);
}
break;
case 28:
TESTTTT();
{
return (261);
}
break;
case 29:
TESTTTT();
{
return (286);
}
break;
case 30:
TESTTTT();
{
return (303);
}
break;
case 31:
TESTTTT();
{
return (310);
}
break;
case 32:
TESTTTT();
{
return (284);
}
break;
case 33:
TESTTTT();
{
return (304);
}
break;
case 34:
TESTTTT();
{
return (296);
}
break;
case 35:
TESTTTT();
{
return (301);
}
break;
case 36:
TESTTTT();
{
return (300);
}
break;
case 37:
TESTTTT();
{
return (300);
}
break;
case 38:
TESTTTT();
{
return (311);
}
break;
case 39:
TESTTTT();
{
return (323);
}
break;
case 40:
TESTTTT();
{
return (324);
}
break;
case 41:
TESTTTT();
{
return (325);
}
break;
case 42:
TESTTTT();
{
return (350);
}
break;
case 43:
TESTTTT();
{
return (320);
}
break;
case 44:
TESTTTT();
{
return (321);
}
break;
case 45:
TESTTTT();
{
return (333);
}
break;
case 46:
TESTTTT();
{
return (328);
}
break;
case 47:
TESTTTT();
{
return (326);
}
break;
case 48:
TESTTTT();
{
return (357);
}
break;
case 49:
TESTTTT();
{
return (327);
}
break;
case 50:
TESTTTT();
{
return (358);
}
break;
case 51:
TESTTTT();
{
return (331);
}
break;
case 52:
TESTTTT();
{
return (332);
}
break;
case 53:
TESTTTT();
{
return (293);
}
break;
case 54:
TESTTTT();
{
return (293);
}
break;
case 55:
TESTTTT();
{
return (302);
}
break;
case 56:
TESTTTT();
{
return (359);
}
break;
case 57:
TESTTTT();
{
return (334);
}
break;
case 58:
TESTTTT();
{
return (334);
}
break;
case 59:
TESTTTT();
{
return (330);
}
break;
case 60:
TESTTTT();
{
return (330);
}
break;
case 61:
TESTTTT();
{
return (330);
}
break;
case 62:
TESTTTT();
{
return (330);
}
break;
case 63:
TESTTTT();
{
return (330);
}
break;
case 64:
TESTTTT();
{
return (330);
}
break;
case 65:
TESTTTT();
{
return (330);
}
break;
case 66:
TESTTTT();
{
return (329);
}
break;
case 67:
TESTTTT();
{
return (329);
}
break;
case 68:
TESTTTT();
{
return (329);
}
break;
case 69:
TESTTTT();
{
return (329);
}
break;
case 70:
TESTTTT();
{
return (329);
}
break;
case 71:
TESTTTT();
{
return (329);
}
break;
case 72:
TESTTTT();
{
return (329);
}
break;
case 73:
TESTTTT();
{
return (329);
}
break;
case 74:
TESTTTT();
{
return (335);
}
break;
case 75:
TESTTTT();
{
return (336);
}
break;
case 76:
TESTTTT();
{
return (337);
}
break;
case 77:
TESTTTT();
{
return (338);
}
break;
case 78:
TESTTTT();
{
return (339);
}
break;
case 79:
TESTTTT();
{
return (340);
}
break;
case 80:
TESTTTT();
{
return (340);
}
break;
case 81:
TESTTTT();
{
return (341);
}
break;
case 82:
TESTTTT();
{
return (341);
}
break;
case 83:
TESTTTT();
{
return (341);
}
break;
case 84:
TESTTTT();
{
return (342);
}
break;
case 85:
TESTTTT();
{
return (343);
}
break;
case 86:
TESTTTT();
{
return (344);
}
break;
case 87:
TESTTTT();
{
return (345);
}
break;
case 88:
TESTTTT();
{
return (346);
}
break;
case 89:
TESTTTT();
{
return (347);
}
break;
case 90:
TESTTTT();
{
return (348);
}
break;
case 91:
TESTTTT();
{
return (349);
}
break;
case 92:
TESTTTT();
{
return (351);
}
break;
case 93:
TESTTTT();
{
return (352);
}
break;
case 94:
TESTTTT();
{
return (353);
}
break;
case 95:
TESTTTT();
{
return (354);
}
break;
case 96:
TESTTTT();
{
return (355);
}
break;
case 97:
TESTTTT();
{
return (356);
}
break;
case 98:
TESTTTT();
{
return (360);
}
break;
case 99:
TESTTTT();
{
return (361);
}
break;
case 100:
TESTTTT();
{
return (362);
}
break;
case 101:
TESTTTT();
{
return (363);
}
break;
case 102:
TESTTTT();
{
return (check_type());
}
break;
case 103:
TESTTTT();
{
return (259);
}
break;
case 104:
TESTTTT();
{
return (259);
}
break;
case 105:
TESTTTT();
{
return (259);
}
break;
case 106:
TESTTTT();
{
return (259);
}
break;
case 107:
TESTTTT();
{
return (259);
}
break;
case 108:
TESTTTT();
{
return (259);
}
break;
case 109:
TESTTTT();
{
return (259);
}
break;
case 110:
TESTTTT();
{
return (260);
}
break;
case 111:
TESTTTT();
{
return (306);
}
break;
case 112:
TESTTTT();
{
return (279);
}
break;
case 113:
TESTTTT();
{
return (278);
}
break;
case 114:
TESTTTT();
{
return (276);
}
break;
case 115:
TESTTTT();
{
return (277);
}
break;
case 116:
TESTTTT();
{
return (273);
}
break;
case 117:
TESTTTT();
{
return (274);
}
break;
case 118:
TESTTTT();
{
return (275);
}
break;
case 119:
TESTTTT();
{
return (280);
}
break;
case 120:
TESTTTT();
{
return (281);
}
break;
case 121:
TESTTTT();
{
return (282);
}
break;
case 122:
TESTTTT();
{
return (266);
}
break;
case 123:
TESTTTT();
{
return (265);
}
break;
case 124:
TESTTTT();
{
return (263);
}
break;
case 125:
TESTTTT();
{
return (264);
}
break;
case 126:
TESTTTT();
{
return (262);
}
break;
case 127:
TESTTTT();
{
return (271);
}
break;
case 128:
TESTTTT();
{
return (272);
}
break;
case 129:
TESTTTT();
{
return (267);
}
break;
case 130:
TESTTTT();
{
return (268);
}
break;
case 131:
TESTTTT();
{
return (269);
}
break;
case 132:
TESTTTT();
{
return (270);
}
break;
case 133:
TESTTTT();
{
return (';');
}
break;
case 134:
TESTTTT();
{
return ('{');
}
break;
case 135:
TESTTTT();
{
return ('}');
}
break;
case 136:
TESTTTT();
{
return (',');
}
break;
case 137:
TESTTTT();
{
return (':');
}
break;
case 138:
TESTTTT();
{
return ('=');
}
break;
case 139:
TESTTTT();
{
return ('(');
}
break;
case 140:
TESTTTT();
{
return (')');
}
break;
case 141:
TESTTTT();
{
return ('[');
}
break;
case 142:
TESTTTT();
{
return (']');
}
break;
case 143:
TESTTTT();
{
return ('.');
}
break;
case 144:
TESTTTT();
{
return ('&');
}
break;
case 145:
TESTTTT();
{
return ('!');
}
break;
case 146:
TESTTTT();
{
return ('~');
}
break;
case 147:
TESTTTT();
{
return ('-');
}
break;
case 148:
TESTTTT();
{
return ('+');
}
break;
case 149:
TESTTTT();
{
return ('*');
}
break;
case 150:
TESTTTT();
{
return ('/');
}
break;
case 151:
TESTTTT();
{
return ('%');
}
break;
case 152:
TESTTTT();
{
return ('<');
}
break;
case 153:
TESTTTT();
{
return ('>');
}
break;
case 154:
TESTTTT();
{
return ('^');
}
break;
case 155:
TESTTTT();
{
return ('|');
}
break;
case 156:
TESTTTT();
{
return ('?');
}
break;
case 163LL:
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
case 157:
TESTTTT();
{
yylloc.start = yylloc.end;
type_yylloc.start = type_yylloc.end;
expression_yylloc.start = expression_yylloc.end;
}
break;
case 158:
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
case 159:
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
case 160:
TESTTTT();
{
yylloc.start = yylloc.end;
expression_yylloc.start = expression_yylloc.end;
type_yylloc.start = type_yylloc.end;
}
break;
case 161:
TESTTTT();
(void)fwrite(yytext, yyleng, 1, yyout);
break;
case 162:
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
yy_act = (162 + ((yy_start - 1) / 2) + 1);
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

extern int isatty(int);

void yy_init_buffer(YY_BUFFER_STATE b, FILE * file)
{
yy_flush_buffer(b);
(*b).yy_input_file = file;
(*b).yy_fill_buffer = 1;
(*b).yy_is_interactive = file ? (isatty(fileno(file)) > 0) : 0;
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

extern char *  strncpy(char * , const char * , int n);

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

strcpy(line, line + c);
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
fprintf((bsl_stderr()), "Includes nested too deeply");
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

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

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

