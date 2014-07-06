/* Code generated from eC source file: lexer.ec */
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

int vsnprintf(char *, size_t, const char *, va_list args);

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
} ecere_gcc_struct;

static char yy_hold_char;

static int yy_n_chars;

int yyleng;

static char * yy_c_buf_p = (char *)0;

static int yy_init = 1;

static int yy_start = 0;

static int yy_did_buffer_switch_on_eof;

void yyrestart(FILE * input_file);

void yy_load_buffer_state(void);

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

static const short int yy_accept[721] =
{
(short)0, (short)112, (short)112, (short)178, (short)176, (short)174, (short)173, (short)172, (short)175, (short)159, (short)176, (short)1, (short)171, (short)165, (short)158, (short)176, (short)153, (short)154, (short)163, (short)162, (short)150, (short)161, (short)157, (short)164, (short)118, (short)118, (short)151, (short)147, (short)166, (short)152, (short)167, (short)170, (short)112, (short)112, (short)112, (short)155, (short)156, (short)168, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)148, (short)169, (short)149, (short)160, (short)146, (short)0, (short)123, (short)0, (short)132, (short)149, (short)141, (short)133, (short)0, (short)0, (short)130, (short)138, (short)128, (short)139, (short)129, (short)140, (short)0, (short)121, (short)2, (short)3, (short)131, (short)122, (short)117, (short)0, (short)118, (short)0, (short)118, (short)112, (short)156, (short)148, (short)155, (short)137, (short)143, (short)145, (short)144, (short)136, (short)0, (short)112, (short)0, (short)112, (short)0, (short)0, (short)134, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)11, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)19, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)135, (short)142, (short)119, (short)125, (short)0, (short)121, (short)121, (short)0, (short)122, (short)117, (short)0, (short)120, (short)0, (short)113, (short)112, (short)127, (short)126, (short)112, (short)112, (short)0, (short)124, (short)0, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)92, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)17, (short)45, (short)112, (short)112, (short)112, (short)112, (short)20, (short)112, (short)112, (short)112, (short)51, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)44, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)0, (short)121, (short)0, (short)121, (short)0, (short)122, (short)120, (short)115, (short)116, (short)113, (short)0, (short)61, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)4, (short)112, (short)6, (short)7, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)13, (short)14, (short)112, (short)112, (short)112, (short)18, (short)112, (short)112, (short)112, (short)112, (short)112, (short)22, (short)112, (short)52, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)21, (short)112, (short)112, (short)112, (short)38, (short)112, (short)112, (short)112, (short)0, (short)121, (short)115, (short)115, (short)0, (short)115, (short)115, (short)116, (short)0, (short)0, (short)114, (short)62, (short)112, (short)112, (short)112, (short)93, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)5, (short)47, (short)8, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)16, (short)112, (short)112, (short)112, (short)58, (short)46, (short)112, (short)112, (short)112, (short)112, (short)112, (short)53, (short)112, (short)112, (short)25, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)36, (short)112, (short)112, (short)112, (short)95, (short)42, (short)0, (short)115, (short)115, (short)115, (short)0, (short)0, (short)116, (short)114, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)56, (short)50, (short)112, (short)112, (short)12, (short)15, (short)112, (short)55, (short)88, (short)72, (short)112, (short)112, (short)112, (short)84, (short)112, (short)54, (short)112, (short)24, (short)26, (short)29, (short)31, (short)112, (short)112, (short)33, (short)112, (short)34, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)0, (short)115, (short)112, (short)112, (short)112, (short)91, (short)112, (short)112, (short)76, (short)82, (short)112, (short)112, (short)112, (short)57, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)70, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)109, (short)110, (short)108, (short)10, (short)112, (short)112, (short)112, (short)112, (short)85, (short)112, (short)112, (short)112, (short)80, (short)112, (short)112, (short)112, (short)112, (short)35, (short)112, (short)49, (short)112, (short)112, (short)63, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)71, (short)112, (short)27, (short)112, (short)32, (short)94, (short)112, (short)112, (short)79, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)9, (short)112, (short)112, (short)112, (short)112, (short)112, (short)43, (short)23, (short)65, (short)112, (short)106, (short)112, (short)112, (short)37, (short)39, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)77, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)74, (short)75, (short)112, (short)107, (short)112, (short)112, (short)48, (short)112, (short)98, (short)64, (short)112, (short)112, (short)112, (short)112, (short)112, (short)69, (short)81, (short)28, (short)112, (short)41, (short)112, (short)87, (short)104, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)30, (short)68, (short)112, (short)0, (short)112, (short)112, (short)78, (short)112, (short)90, (short)112, (short)112, (short)101, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)73, (short)0, (short)112, (short)83, (short)40, (short)112, (short)112, (short)112, (short)112, (short)112, (short)97, (short)112, (short)96, (short)86, (short)67, (short)112, (short)112, (short)89, (short)112, (short)112, (short)112, (short)112, (short)111, (short)112, (short)112, (short)112, (short)112, (short)112, (short)99, (short)112, (short)105, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)60, (short)112, (short)112, (short)112, (short)112, (short)112, (short)59, (short)112, (short)112, (short)103, (short)112, (short)112, (short)100, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)112, (short)102, (short)112, (short)66, (short)0
};

static const int yy_ec[256] =
{
0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 4, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 22, 22, 23, 22, 24, 22, 22, 22, 25, 26, 27, 28, 29, 30, 1, 31, 32, 33, 31, 34, 35, 36, 36, 37, 38, 36, 39, 36, 36, 36, 40, 36, 36, 36, 36, 41, 36, 36, 42, 36, 36, 43, 44, 45, 46, 47, 1, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 36, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
};

static const int yy_meta[77] =
{
0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 1, 4, 1, 1, 1, 1, 5, 1, 6, 6, 6, 6, 2, 1, 1, 1, 1, 1, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 1, 1, 1, 1, 8, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 1, 1, 1, 1
};

static const short int yy_base[729] =
{
(short)0, (short)0, (short)0, (short)254, (short)2575, (short)2575, (short)2575, (short)2575, (short)2575, (short)219, (short)70, (short)2575, (short)2575, (short)50, (short)69, (short)201, (short)2575, (short)2575, (short)199, (short)65, (short)2575, (short)66, (short)64, (short)76, (short)96, (short)79, (short)80, (short)2575, (short)97, (short)194, (short)61, (short)2575, (short)81, (short)88, (short)116, (short)2575, (short)2575, (short)183, (short)132, (short)115, (short)87, (short)143, (short)147, (short)131, (short)148, (short)156, (short)160, (short)121, (short)164, (short)136, (short)203, (short)204, (short)206, (short)208, (short)212, (short)224, (short)2575, (short)88, (short)2575, (short)2575, (short)2575, (short)101, (short)2575, (short)184, (short)2575, (short)2575, (short)2575, (short)2575, (short)182, (short)174, (short)2575, (short)2575, (short)2575, (short)2575, (short)2575, (short)2575, (short)159, (short)259, (short)2575, (short)2575, (short)2575, (short)298, (short)339, (short)218, (short)247, (short)151, (short)0, (short)0, (short)2575, (short)2575, (short)2575, (short)116, (short)2575, (short)2575, (short)2575, (short)111, (short)111, (short)149, (short)106, (short)213, (short)186, (short)85, (short)2575, (short)233, (short)237, (short)232, (short)396, (short)221, (short)240, (short)241, (short)242, (short)265, (short)298, (short)313, (short)306, (short)318, (short)319, (short)323, (short)315, (short)316, (short)334, (short)331, (short)363, (short)364, (short)372, (short)328, (short)374, (short)375, (short)390, (short)391, (short)392, (short)393, (short)400, (short)409, (short)401, (short)394, (short)411, (short)398, (short)416, (short)424, (short)431, (short)399, (short)458, (short)459, (short)463, (short)466, (short)465, (short)468, (short)469, (short)475, (short)470, (short)476, (short)478, (short)487, (short)491, (short)2575, (short)2575, (short)2575, (short)2575, (short)527, (short)517, (short)556, (short)541, (short)546, (short)530, (short)483, (short)595, (short)0, (short)601, (short)403, (short)2575, (short)2575, (short)0, (short)533, (short)243, (short)2575, (short)108, (short)498, (short)550, (short)589, (short)596, (short)600, (short)618, (short)571, (short)611, (short)624, (short)620, (short)645, (short)517, (short)648, (short)652, (short)654, (short)663, (short)665, (short)497, (short)664, (short)667, (short)671, (short)672, (short)673, (short)675, (short)680, (short)683, (short)682, (short)684, (short)705, (short)692, (short)695, (short)708, (short)710, (short)720, (short)723, (short)731, (short)738, (short)508, (short)735, (short)739, (short)741, (short)743, (short)744, (short)747, (short)754, (short)748, (short)756, (short)763, (short)765, (short)766, (short)767, (short)771, (short)784, (short)774, (short)786, (short)787, (short)793, (short)794, (short)799, (short)803, (short)806, (short)805, (short)809, (short)810, (short)812, (short)814, (short)821, (short)827, (short)833, (short)834, (short)836, (short)837, (short)838, (short)839, (short)855, (short)860, (short)875, (short)889, (short)880, (short)899, (short)907, (short)905, (short)910, (short)953, (short)941, (short)997, (short)860, (short)866, (short)883, (short)881, (short)876, (short)970, (short)945, (short)927, (short)1003, (short)946, (short)1006, (short)1011, (short)1012, (short)1014, (short)940, (short)1013, (short)1016, (short)1018, (short)1015, (short)1021, (short)943, (short)1022, (short)1023, (short)1024, (short)1033, (short)1034, (short)1040, (short)1041, (short)1042, (short)1043, (short)1051, (short)1050, (short)1058, (short)1071, (short)1059, (short)1076, (short)1078, (short)1079, (short)1082, (short)1086, (short)1087, (short)1094, (short)1099, (short)1102, (short)1103, (short)1104, (short)1106, (short)1105, (short)1107, (short)1110, (short)1111, (short)1114, (short)1123, (short)1127, (short)1130, (short)1129, (short)1135, (short)1136, (short)1139, (short)1140, (short)1142, (short)1147, (short)1148, (short)1155, (short)1151, (short)1164, (short)1168, (short)1171, (short)1172, (short)1173, (short)1174, (short)1184, (short)1191, (short)1194, (short)1200, (short)1203, (short)1204, (short)1207, (short)1209, (short)1211, (short)1217, (short)1222, (short)0, (short)1212, (short)1259, (short)1249, (short)0, (short)1257, (short)1299, (short)1236, (short)1303, (short)1237, (short)1241, (short)1242, (short)1265, (short)1282, (short)1286, (short)1274, (short)1293, (short)1319, (short)1320, (short)1321, (short)1324, (short)1323, (short)1326, (short)1328, (short)1341, (short)1343, (short)1344, (short)1346, (short)1347, (short)1350, (short)1352, (short)1353, (short)1356, (short)1363, (short)1365, (short)1372, (short)1374, (short)1376, (short)1382, (short)1387, (short)1392, (short)1393, (short)1395, (short)1394, (short)1398, (short)1402, (short)1403, (short)1404, (short)1405, (short)1413, (short)1414, (short)1425, (short)1415, (short)1430, (short)1431, (short)1433, (short)1437, (short)1438, (short)1448, (short)1449, (short)1455, (short)1457, (short)1458, (short)1461, (short)1460, (short)1465, (short)1464, (short)1473, (short)1467, (short)1480, (short)1470, (short)1482, (short)1485, (short)1491, (short)1492, (short)1495, (short)1511, (short)1513, (short)1515, (short)1523, (short)1547, (short)0, (short)1519, (short)1571, (short)1527, (short)1586, (short)1576, (short)1549, (short)1541, (short)1566, (short)1572, (short)1601, (short)1554, (short)1605, (short)1606, (short)1611, (short)1623, (short)1626, (short)1627, (short)1629, (short)1630, (short)1548, (short)1633, (short)1635, (short)1636, (short)1638, (short)1642, (short)1645, (short)1648, (short)1655, (short)1654, (short)1658, (short)1660, (short)1663, (short)1667, (short)1664, (short)1666, (short)1675, (short)1684, (short)1685, (short)1687, (short)1688, (short)1690, (short)1703, (short)1706, (short)1709, (short)1711, (short)1713, (short)1714, (short)1715, (short)1716, (short)1718, (short)1724, (short)1726, (short)1733, (short)1737, (short)1739, (short)1741, (short)1742, (short)1744, (short)1746, (short)1750, (short)1759, (short)1752, (short)1762, (short)1761, (short)1765, (short)1767, (short)1768, (short)1773, (short)1806, (short)1777, (short)1774, (short)1778, (short)1780, (short)1787, (short)1793, (short)1795, (short)1798, (short)1808, (short)1810, (short)1814, (short)1821, (short)1823, (short)1826, (short)1827, (short)1831, (short)1839, (short)1842, (short)1843, (short)1844, (short)1847, (short)1849, (short)1859, (short)1862, (short)1865, (short)1869, (short)1870, (short)1872, (short)1877, (short)1878, (short)1880, (short)1885, (short)1889, (short)1898, (short)1901, (short)1904, (short)1905, (short)1906, (short)1909, (short)1910, (short)1914, (short)1917, (short)1921, (short)1925, (short)1930, (short)1927, (short)1932, (short)1933, (short)1936, (short)1934, (short)1938, (short)1945, (short)1949, (short)1953, (short)1955, (short)1960, (short)1957, (short)1964, (short)1973, (short)1970, (short)1976, (short)1980, (short)1981, (short)1983, (short)1985, (short)1989, (short)1993, (short)1996, (short)2004, (short)2008, (short)2011, (short)2013, (short)2014, (short)2016, (short)2015, (short)2019, (short)2021, (short)2020, (short)2023, (short)2026, (short)2039, (short)2041, (short)2042, (short)2043, (short)2048, (short)2049, (short)2054, (short)2066, (short)2069, (short)2072, (short)2073, (short)2075, (short)2076, (short)2079, (short)2077, (short)2078, (short)2081, (short)2082, (short)2084, (short)2088, (short)2100, (short)2105, (short)2106, (short)2109, (short)2110, (short)2112, (short)2121, (short)2127, (short)2122, (short)2131, (short)2134, (short)2132, (short)2144, (short)2147, (short)2149, (short)2150, (short)2152, (short)2156, (short)2157, (short)2160, (short)2162, (short)2165, (short)2168, (short)2172, (short)2180, (short)2181, (short)2184, (short)2185, (short)2188, (short)2189, (short)2190, (short)2196, (short)2197, (short)2208, (short)2200, (short)2209, (short)2212, (short)2213, (short)2217, (short)2215, (short)2228, (short)2225, (short)2232, (short)2233, (short)96, (short)2235, (short)2237, (short)2230, (short)2241, (short)2243, (short)2258, (short)2260, (short)2261, (short)2262, (short)2269, (short)2278, (short)2279, (short)2280, (short)2281, (short)2282, (short)2285, (short)2284, (short)2575, (short)68, (short)2287, (short)2286, (short)2288, (short)2289, (short)2290, (short)2291, (short)2297, (short)2312, (short)2313, (short)2315, (short)2316, (short)2318, (short)2334, (short)2336, (short)2339, (short)2340, (short)2343, (short)2341, (short)2345, (short)2346, (short)2347, (short)2349, (short)2351, (short)2358, (short)2364, (short)2366, (short)2367, (short)2368, (short)2369, (short)2370, (short)2371, (short)2374, (short)2375, (short)2386, (short)2390, (short)2391, (short)2393, (short)2396, (short)2398, (short)2399, (short)2401, (short)2402, (short)2419, (short)2414, (short)2423, (short)2426, (short)2427, (short)2431, (short)2432, (short)2442, (short)2443, (short)2447, (short)2449, (short)2451, (short)2455, (short)2460, (short)2466, (short)2464, (short)2467, (short)2470, (short)2575, (short)2531, (short)2539, (short)2546, (short)2550, (short)2551, (short)2559, (short)2562, (short)2566
};

static const short int yy_def[729] =
{
(short)0, (short)720, (short)1, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)721, (short)720, (short)720, (short)720, (short)720, (short)722, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)24, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)723, (short)723, (short)723, (short)720, (short)720, (short)720, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)720, (short)720, (short)720, (short)720, (short)720, (short)721, (short)720, (short)721, (short)720, (short)720, (short)720, (short)720, (short)722, (short)722, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)724, (short)25, (short)725, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)723, (short)720, (short)723, (short)726, (short)722, (short)720, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)727, (short)724, (short)723, (short)720, (short)720, (short)725, (short)723, (short)726, (short)720, (short)726, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)720, (short)77, (short)720, (short)720, (short)720, (short)81, (short)720, (short)727, (short)720, (short)720, (short)720, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)720, (short)161, (short)259, (short)720, (short)720, (short)260, (short)348, (short)720, (short)720, (short)720, (short)720, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)720, (short)720, (short)348, (short)720, (short)720, (short)720, (short)720, (short)720, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)720, (short)720, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)728, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)720, (short)728, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)723, (short)0, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720
};

static const short int yy_nxt[2652] =
{
(short)0, (short)4, (short)5, (short)6, (short)7, (short)8, (short)9, (short)10, (short)11, (short)12, (short)13, (short)14, (short)15, (short)16, (short)17, (short)18, (short)19, (short)20, (short)21, (short)22, (short)23, (short)24, (short)25, (short)25, (short)25, (short)26, (short)27, (short)28, (short)29, (short)30, (short)31, (short)32, (short)33, (short)32, (short)32, (short)32, (short)32, (short)32, (short)32, (short)34, (short)32, (short)32, (short)32, (short)35, (short)4, (short)36, (short)37, (short)38, (short)39, (short)40, (short)41, (short)42, (short)43, (short)44, (short)45, (short)32, (short)46, (short)32, (short)32, (short)47, (short)32, (short)48, (short)32, (short)49, (short)50, (short)51, (short)52, (short)53, (short)54, (short)55, (short)32, (short)32, (short)32, (short)56, (short)57, (short)58, (short)59, (short)62, (short)64, (short)65, (short)66, (short)71, (short)658, (short)76, (short)73, (short)77, (short)77, (short)77, (short)77, (short)94, (short)95, (short)78, (short)96, (short)72, (short)74, (short)75, (short)79, (short)67, (short)96, (short)96, (short)86, (short)86, (short)86, (short)86, (short)80, (short)87, (short)98, (short)89, (short)62, (short)88, (short)658, (short)720, (short)98, (short)98, (short)63, (short)81, (short)155, (short)82, (short)82, (short)82, (short)82, (short)720, (short)90, (short)100, (short)91, (short)92, (short)96, (short)96, (short)101, (short)69, (short)83, (short)172, (short)96, (short)84, (short)84, (short)84, (short)98, (short)84, (short)85, (short)171, (short)98, (short)98, (short)96, (short)96, (short)170, (short)63, (short)98, (short)96, (short)83, (short)720, (short)99, (short)113, (short)84, (short)84, (short)96, (short)84, (short)98, (short)98, (short)96, (short)96, (short)96, (short)98, (short)156, (short)84, (short)103, (short)104, (short)85, (short)96, (short)98, (short)105, (short)167, (short)96, (short)98, (short)98, (short)98, (short)96, (short)110, (short)720, (short)158, (short)106, (short)111, (short)98, (short)112, (short)135, (short)107, (short)98, (short)68, (short)720, (short)108, (short)98, (short)123, (short)114, (short)124, (short)175, (short)157, (short)118, (short)119, (short)109, (short)115, (short)120, (short)138, (short)125, (short)116, (short)139, (short)126, (short)117, (short)121, (short)127, (short)129, (short)122, (short)128, (short)102, (short)136, (short)131, (short)96, (short)96, (short)137, (short)96, (short)130, (short)96, (short)132, (short)133, (short)93, (short)96, (short)96, (short)134, (short)69, (short)70, (short)98, (short)98, (short)176, (short)98, (short)96, (short)98, (short)165, (short)96, (short)165, (short)98, (short)98, (short)166, (short)166, (short)166, (short)166, (short)96, (short)96, (short)69, (short)98, (short)60, (short)96, (short)98, (short)175, (short)96, (short)96, (short)96, (short)720, (short)140, (short)141, (short)98, (short)98, (short)142, (short)143, (short)147, (short)98, (short)720, (short)149, (short)98, (short)98, (short)98, (short)151, (short)150, (short)144, (short)145, (short)153, (short)146, (short)152, (short)173, (short)96, (short)148, (short)720, (short)154, (short)77, (short)77, (short)77, (short)77, (short)84, (short)84, (short)84, (short)176, (short)84, (short)720, (short)98, (short)190, (short)179, (short)159, (short)160, (short)177, (short)160, (short)160, (short)160, (short)178, (short)720, (short)191, (short)720, (short)84, (short)84, (short)720, (short)84, (short)192, (short)720, (short)96, (short)720, (short)159, (short)160, (short)193, (short)84, (short)160, (short)160, (short)96, (short)160, (short)161, (short)161, (short)161, (short)161, (short)98, (short)96, (short)194, (short)96, (short)96, (short)720, (short)96, (short)96, (short)98, (short)162, (short)163, (short)96, (short)163, (short)163, (short)163, (short)98, (short)96, (short)98, (short)98, (short)96, (short)98, (short)98, (short)96, (short)720, (short)720, (short)98, (short)720, (short)162, (short)163, (short)720, (short)98, (short)163, (short)163, (short)98, (short)163, (short)81, (short)98, (short)82, (short)82, (short)82, (short)82, (short)195, (short)196, (short)198, (short)199, (short)720, (short)202, (short)720, (short)197, (short)203, (short)83, (short)96, (short)96, (short)164, (short)164, (short)164, (short)720, (short)164, (short)201, (short)204, (short)96, (short)200, (short)96, (short)96, (short)205, (short)98, (short)98, (short)207, (short)83, (short)720, (short)206, (short)211, (short)164, (short)164, (short)98, (short)164, (short)98, (short)98, (short)96, (short)96, (short)96, (short)96, (short)96, (short)164, (short)96, (short)720, (short)96, (short)96, (short)96, (short)96, (short)720, (short)96, (short)98, (short)98, (short)98, (short)98, (short)98, (short)96, (short)98, (short)96, (short)98, (short)98, (short)98, (short)98, (short)96, (short)98, (short)209, (short)208, (short)720, (short)720, (short)720, (short)98, (short)96, (short)98, (short)213, (short)212, (short)210, (short)720, (short)98, (short)96, (short)720, (short)180, (short)181, (short)182, (short)183, (short)184, (short)98, (short)720, (short)720, (short)185, (short)720, (short)214, (short)222, (short)98, (short)215, (short)216, (short)218, (short)186, (short)187, (short)188, (short)217, (short)189, (short)232, (short)221, (short)224, (short)219, (short)96, (short)96, (short)223, (short)225, (short)227, (short)96, (short)220, (short)96, (short)96, (short)226, (short)96, (short)96, (short)96, (short)720, (short)98, (short)98, (short)228, (short)96, (short)96, (short)98, (short)96, (short)98, (short)98, (short)229, (short)98, (short)98, (short)98, (short)230, (short)231, (short)96, (short)720, (short)98, (short)98, (short)96, (short)98, (short)166, (short)166, (short)166, (short)166, (short)96, (short)96, (short)720, (short)236, (short)98, (short)234, (short)237, (short)240, (short)98, (short)720, (short)720, (short)96, (short)233, (short)241, (short)98, (short)98, (short)242, (short)238, (short)245, (short)239, (short)96, (short)720, (short)720, (short)235, (short)243, (short)98, (short)248, (short)246, (short)244, (short)249, (short)720, (short)720, (short)247, (short)720, (short)98, (short)252, (short)96, (short)252, (short)720, (short)251, (short)253, (short)253, (short)253, (short)253, (short)160, (short)250, (short)160, (short)160, (short)160, (short)256, (short)98, (short)256, (short)264, (short)96, (short)257, (short)257, (short)257, (short)257, (short)720, (short)164, (short)164, (short)164, (short)160, (short)164, (short)279, (short)160, (short)160, (short)98, (short)160, (short)161, (short)161, (short)161, (short)161, (short)163, (short)96, (short)163, (short)163, (short)163, (short)164, (short)164, (short)280, (short)164, (short)254, (short)255, (short)263, (short)255, (short)255, (short)255, (short)98, (short)164, (short)720, (short)163, (short)96, (short)720, (short)163, (short)163, (short)720, (short)163, (short)720, (short)96, (short)254, (short)255, (short)265, (short)96, (short)255, (short)255, (short)98, (short)255, (short)166, (short)166, (short)166, (short)166, (short)260, (short)98, (short)96, (short)273, (short)720, (short)98, (short)720, (short)720, (short)720, (short)96, (short)258, (short)96, (short)258, (short)258, (short)258, (short)96, (short)98, (short)266, (short)261, (short)261, (short)261, (short)262, (short)261, (short)98, (short)720, (short)98, (short)720, (short)720, (short)258, (short)98, (short)720, (short)258, (short)258, (short)720, (short)258, (short)267, (short)96, (short)261, (short)261, (short)96, (short)261, (short)268, (short)269, (short)96, (short)262, (short)96, (short)720, (short)270, (short)261, (short)271, (short)98, (short)720, (short)276, (short)98, (short)96, (short)96, (short)96, (short)98, (short)96, (short)98, (short)272, (short)274, (short)96, (short)96, (short)96, (short)275, (short)96, (short)720, (short)98, (short)98, (short)98, (short)96, (short)98, (short)96, (short)96, (short)96, (short)98, (short)98, (short)98, (short)720, (short)98, (short)277, (short)720, (short)96, (short)720, (short)98, (short)96, (short)98, (short)98, (short)98, (short)281, (short)278, (short)285, (short)283, (short)284, (short)287, (short)96, (short)98, (short)282, (short)96, (short)98, (short)96, (short)720, (short)288, (short)720, (short)720, (short)286, (short)720, (short)293, (short)720, (short)98, (short)96, (short)296, (short)98, (short)96, (short)98, (short)289, (short)720, (short)290, (short)294, (short)291, (short)292, (short)96, (short)295, (short)299, (short)98, (short)96, (short)300, (short)98, (short)96, (short)96, (short)301, (short)96, (short)297, (short)96, (short)96, (short)98, (short)302, (short)96, (short)96, (short)98, (short)298, (short)303, (short)98, (short)98, (short)96, (short)98, (short)96, (short)98, (short)98, (short)720, (short)312, (short)98, (short)98, (short)96, (short)305, (short)96, (short)96, (short)96, (short)98, (short)304, (short)98, (short)96, (short)306, (short)316, (short)96, (short)307, (short)720, (short)98, (short)720, (short)98, (short)98, (short)98, (short)720, (short)720, (short)96, (short)98, (short)96, (short)96, (short)98, (short)311, (short)308, (short)314, (short)309, (short)96, (short)96, (short)313, (short)310, (short)315, (short)98, (short)96, (short)98, (short)98, (short)720, (short)96, (short)720, (short)96, (short)96, (short)98, (short)98, (short)96, (short)96, (short)720, (short)96, (short)98, (short)96, (short)319, (short)320, (short)98, (short)318, (short)98, (short)98, (short)96, (short)317, (short)98, (short)98, (short)321, (short)98, (short)96, (short)98, (short)322, (short)720, (short)720, (short)720, (short)96, (short)96, (short)98, (short)96, (short)96, (short)96, (short)96, (short)326, (short)98, (short)323, (short)720, (short)325, (short)328, (short)324, (short)98, (short)98, (short)331, (short)98, (short)98, (short)98, (short)98, (short)720, (short)96, (short)720, (short)329, (short)327, (short)720, (short)96, (short)720, (short)334, (short)720, (short)720, (short)330, (short)96, (short)332, (short)333, (short)98, (short)253, (short)253, (short)253, (short)253, (short)98, (short)340, (short)96, (short)339, (short)341, (short)337, (short)98, (short)96, (short)335, (short)96, (short)336, (short)253, (short)253, (short)253, (short)253, (short)720, (short)98, (short)338, (short)720, (short)720, (short)343, (short)98, (short)343, (short)98, (short)720, (short)344, (short)344, (short)344, (short)344, (short)342, (short)255, (short)720, (short)255, (short)255, (short)255, (short)257, (short)257, (short)257, (short)257, (short)720, (short)354, (short)720, (short)720, (short)257, (short)257, (short)257, (short)257, (short)357, (short)255, (short)720, (short)356, (short)255, (short)255, (short)96, (short)255, (short)258, (short)720, (short)258, (short)258, (short)258, (short)345, (short)355, (short)346, (short)346, (short)346, (short)347, (short)96, (short)98, (short)720, (short)96, (short)720, (short)96, (short)96, (short)258, (short)720, (short)720, (short)258, (short)258, (short)345, (short)258, (short)98, (short)346, (short)346, (short)98, (short)346, (short)98, (short)98, (short)720, (short)347, (short)348, (short)348, (short)348, (short)348, (short)261, (short)261, (short)261, (short)96, (short)261, (short)360, (short)348, (short)348, (short)348, (short)348, (short)349, (short)720, (short)350, (short)350, (short)350, (short)351, (short)368, (short)98, (short)720, (short)261, (short)261, (short)374, (short)261, (short)348, (short)348, (short)348, (short)348, (short)348, (short)349, (short)362, (short)261, (short)350, (short)350, (short)359, (short)350, (short)352, (short)96, (short)352, (short)351, (short)96, (short)353, (short)353, (short)353, (short)353, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)98, (short)96, (short)358, (short)98, (short)96, (short)96, (short)96, (short)96, (short)98, (short)98, (short)98, (short)98, (short)98, (short)98, (short)720, (short)98, (short)96, (short)96, (short)98, (short)98, (short)98, (short)98, (short)720, (short)96, (short)96, (short)96, (short)96, (short)361, (short)363, (short)720, (short)98, (short)98, (short)720, (short)96, (short)96, (short)720, (short)369, (short)98, (short)98, (short)98, (short)98, (short)96, (short)96, (short)365, (short)375, (short)373, (short)372, (short)98, (short)98, (short)364, (short)366, (short)367, (short)370, (short)371, (short)96, (short)98, (short)98, (short)376, (short)720, (short)96, (short)720, (short)96, (short)96, (short)377, (short)720, (short)96, (short)720, (short)720, (short)98, (short)96, (short)96, (short)380, (short)381, (short)98, (short)382, (short)98, (short)98, (short)96, (short)378, (short)98, (short)379, (short)383, (short)96, (short)98, (short)98, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)98, (short)384, (short)96, (short)96, (short)720, (short)98, (short)96, (short)385, (short)98, (short)98, (short)98, (short)98, (short)98, (short)98, (short)397, (short)96, (short)98, (short)98, (short)386, (short)96, (short)98, (short)96, (short)96, (short)389, (short)720, (short)387, (short)390, (short)96, (short)96, (short)98, (short)388, (short)96, (short)96, (short)98, (short)96, (short)98, (short)98, (short)720, (short)395, (short)96, (short)96, (short)98, (short)98, (short)96, (short)391, (short)98, (short)98, (short)96, (short)98, (short)396, (short)393, (short)394, (short)392, (short)98, (short)98, (short)720, (short)96, (short)98, (short)398, (short)400, (short)96, (short)98, (short)401, (short)96, (short)96, (short)96, (short)96, (short)720, (short)720, (short)399, (short)98, (short)720, (short)402, (short)720, (short)98, (short)720, (short)96, (short)98, (short)98, (short)98, (short)98, (short)408, (short)403, (short)96, (short)720, (short)405, (short)96, (short)406, (short)410, (short)404, (short)98, (short)720, (short)96, (short)411, (short)407, (short)96, (short)96, (short)98, (short)409, (short)96, (short)98, (short)96, (short)413, (short)96, (short)415, (short)416, (short)98, (short)720, (short)720, (short)98, (short)98, (short)720, (short)414, (short)98, (short)720, (short)98, (short)417, (short)98, (short)412, (short)344, (short)344, (short)344, (short)344, (short)720, (short)344, (short)344, (short)344, (short)344, (short)346, (short)96, (short)346, (short)346, (short)346, (short)96, (short)96, (short)419, (short)418, (short)720, (short)353, (short)353, (short)353, (short)353, (short)720, (short)98, (short)423, (short)422, (short)346, (short)98, (short)98, (short)346, (short)346, (short)420, (short)346, (short)720, (short)421, (short)720, (short)424, (short)96, (short)424, (short)720, (short)720, (short)425, (short)425, (short)425, (short)425, (short)426, (short)96, (short)427, (short)427, (short)427, (short)428, (short)98, (short)720, (short)350, (short)96, (short)350, (short)350, (short)350, (short)96, (short)433, (short)98, (short)432, (short)720, (short)426, (short)720, (short)96, (short)427, (short)427, (short)98, (short)427, (short)720, (short)350, (short)98, (short)428, (short)350, (short)350, (short)429, (short)350, (short)429, (short)98, (short)434, (short)430, (short)430, (short)430, (short)430, (short)353, (short)353, (short)353, (short)353, (short)720, (short)435, (short)96, (short)96, (short)96, (short)437, (short)96, (short)96, (short)720, (short)96, (short)431, (short)96, (short)431, (short)431, (short)431, (short)438, (short)98, (short)98, (short)98, (short)443, (short)98, (short)98, (short)436, (short)98, (short)96, (short)98, (short)96, (short)96, (short)431, (short)96, (short)96, (short)431, (short)431, (short)96, (short)431, (short)96, (short)96, (short)720, (short)98, (short)96, (short)98, (short)98, (short)720, (short)98, (short)98, (short)441, (short)96, (short)98, (short)96, (short)98, (short)98, (short)440, (short)442, (short)98, (short)720, (short)96, (short)439, (short)96, (short)720, (short)96, (short)98, (short)445, (short)98, (short)446, (short)444, (short)96, (short)449, (short)447, (short)448, (short)98, (short)96, (short)98, (short)452, (short)98, (short)453, (short)96, (short)96, (short)96, (short)96, (short)98, (short)450, (short)96, (short)454, (short)451, (short)98, (short)96, (short)96, (short)96, (short)96, (short)98, (short)98, (short)98, (short)98, (short)720, (short)456, (short)98, (short)96, (short)96, (short)96, (short)98, (short)98, (short)98, (short)98, (short)720, (short)720, (short)455, (short)458, (short)457, (short)96, (short)720, (short)98, (short)98, (short)98, (short)96, (short)96, (short)720, (short)96, (short)461, (short)459, (short)462, (short)96, (short)96, (short)98, (short)460, (short)467, (short)720, (short)465, (short)98, (short)98, (short)463, (short)98, (short)96, (short)96, (short)464, (short)98, (short)98, (short)466, (short)720, (short)96, (short)469, (short)96, (short)96, (short)476, (short)96, (short)96, (short)98, (short)98, (short)96, (short)96, (short)470, (short)96, (short)468, (short)98, (short)96, (short)98, (short)98, (short)96, (short)98, (short)98, (short)720, (short)474, (short)98, (short)98, (short)96, (short)98, (short)96, (short)471, (short)98, (short)96, (short)720, (short)98, (short)472, (short)720, (short)473, (short)96, (short)96, (short)720, (short)98, (short)96, (short)98, (short)720, (short)720, (short)98, (short)477, (short)479, (short)480, (short)475, (short)481, (short)98, (short)98, (short)478, (short)720, (short)98, (short)483, (short)96, (short)482, (short)96, (short)486, (short)96, (short)720, (short)485, (short)720, (short)720, (short)720, (short)488, (short)484, (short)720, (short)720, (short)98, (short)489, (short)98, (short)720, (short)98, (short)487, (short)720, (short)491, (short)425, (short)425, (short)425, (short)425, (short)430, (short)430, (short)430, (short)430, (short)96, (short)490, (short)427, (short)720, (short)427, (short)427, (short)427, (short)96, (short)96, (short)493, (short)720, (short)720, (short)720, (short)96, (short)98, (short)492, (short)425, (short)425, (short)425, (short)425, (short)427, (short)98, (short)98, (short)427, (short)427, (short)96, (short)427, (short)98, (short)720, (short)720, (short)346, (short)96, (short)346, (short)346, (short)346, (short)494, (short)720, (short)494, (short)720, (short)98, (short)495, (short)495, (short)495, (short)495, (short)510, (short)98, (short)720, (short)720, (short)346, (short)496, (short)497, (short)346, (short)346, (short)720, (short)346, (short)430, (short)430, (short)430, (short)430, (short)431, (short)96, (short)431, (short)431, (short)431, (short)96, (short)96, (short)720, (short)499, (short)501, (short)350, (short)96, (short)350, (short)350, (short)350, (short)98, (short)498, (short)720, (short)431, (short)98, (short)98, (short)431, (short)431, (short)96, (short)431, (short)98, (short)96, (short)96, (short)350, (short)96, (short)96, (short)350, (short)350, (short)96, (short)350, (short)96, (short)96, (short)98, (short)96, (short)507, (short)98, (short)98, (short)96, (short)98, (short)98, (short)96, (short)500, (short)98, (short)96, (short)98, (short)98, (short)720, (short)98, (short)502, (short)96, (short)96, (short)98, (short)720, (short)96, (short)98, (short)96, (short)503, (short)98, (short)96, (short)96, (short)504, (short)96, (short)96, (short)98, (short)98, (short)511, (short)509, (short)98, (short)505, (short)98, (short)96, (short)506, (short)98, (short)98, (short)720, (short)98, (short)98, (short)508, (short)515, (short)96, (short)96, (short)512, (short)96, (short)96, (short)98, (short)96, (short)513, (short)514, (short)516, (short)517, (short)518, (short)720, (short)519, (short)98, (short)98, (short)524, (short)98, (short)98, (short)96, (short)98, (short)520, (short)96, (short)521, (short)526, (short)96, (short)522, (short)96, (short)523, (short)96, (short)96, (short)96, (short)96, (short)98, (short)96, (short)527, (short)98, (short)720, (short)525, (short)98, (short)96, (short)98, (short)96, (short)98, (short)98, (short)98, (short)98, (short)720, (short)98, (short)96, (short)720, (short)528, (short)529, (short)96, (short)98, (short)96, (short)98, (short)96, (short)96, (short)720, (short)96, (short)530, (short)96, (short)98, (short)531, (short)720, (short)96, (short)98, (short)96, (short)98, (short)532, (short)98, (short)98, (short)534, (short)98, (short)96, (short)98, (short)96, (short)96, (short)535, (short)98, (short)96, (short)98, (short)96, (short)96, (short)533, (short)720, (short)720, (short)720, (short)98, (short)96, (short)98, (short)98, (short)96, (short)96, (short)98, (short)96, (short)98, (short)98, (short)495, (short)495, (short)495, (short)495, (short)96, (short)98, (short)536, (short)720, (short)98, (short)98, (short)96, (short)98, (short)96, (short)539, (short)537, (short)96, (short)720, (short)538, (short)98, (short)542, (short)540, (short)541, (short)720, (short)545, (short)98, (short)96, (short)98, (short)96, (short)547, (short)98, (short)543, (short)96, (short)544, (short)495, (short)495, (short)495, (short)495, (short)720, (short)96, (short)98, (short)96, (short)98, (short)549, (short)96, (short)96, (short)98, (short)548, (short)427, (short)96, (short)427, (short)427, (short)427, (short)98, (short)546, (short)98, (short)550, (short)96, (short)98, (short)98, (short)96, (short)96, (short)96, (short)98, (short)720, (short)96, (short)427, (short)96, (short)720, (short)427, (short)427, (short)98, (short)427, (short)553, (short)98, (short)98, (short)98, (short)96, (short)551, (short)98, (short)96, (short)98, (short)552, (short)96, (short)555, (short)720, (short)554, (short)96, (short)96, (short)557, (short)96, (short)98, (short)720, (short)556, (short)98, (short)96, (short)96, (short)98, (short)96, (short)558, (short)720, (short)98, (short)98, (short)96, (short)98, (short)559, (short)560, (short)96, (short)562, (short)98, (short)98, (short)720, (short)98, (short)561, (short)563, (short)720, (short)96, (short)98, (short)564, (short)96, (short)720, (short)98, (short)96, (short)96, (short)96, (short)565, (short)720, (short)96, (short)96, (short)568, (short)98, (short)569, (short)96, (short)98, (short)566, (short)96, (short)98, (short)98, (short)98, (short)96, (short)567, (short)98, (short)98, (short)96, (short)720, (short)96, (short)98, (short)720, (short)96, (short)98, (short)96, (short)96, (short)96, (short)98, (short)96, (short)720, (short)96, (short)98, (short)572, (short)98, (short)570, (short)573, (short)98, (short)96, (short)98, (short)98, (short)98, (short)96, (short)98, (short)571, (short)98, (short)96, (short)720, (short)96, (short)577, (short)96, (short)720, (short)98, (short)96, (short)720, (short)575, (short)98, (short)96, (short)576, (short)574, (short)98, (short)580, (short)98, (short)96, (short)98, (short)581, (short)96, (short)98, (short)578, (short)96, (short)582, (short)98, (short)579, (short)96, (short)96, (short)583, (short)96, (short)98, (short)96, (short)720, (short)98, (short)720, (short)96, (short)98, (short)585, (short)720, (short)96, (short)98, (short)98, (short)96, (short)98, (short)584, (short)98, (short)590, (short)588, (short)589, (short)98, (short)96, (short)587, (short)592, (short)98, (short)96, (short)586, (short)98, (short)96, (short)591, (short)96, (short)96, (short)96, (short)96, (short)720, (short)98, (short)96, (short)96, (short)96, (short)98, (short)96, (short)593, (short)98, (short)96, (short)98, (short)98, (short)98, (short)98, (short)594, (short)596, (short)98, (short)98, (short)98, (short)595, (short)98, (short)720, (short)96, (short)98, (short)96, (short)96, (short)96, (short)720, (short)720, (short)598, (short)601, (short)96, (short)96, (short)720, (short)597, (short)603, (short)98, (short)96, (short)98, (short)98, (short)98, (short)599, (short)608, (short)720, (short)607, (short)98, (short)98, (short)602, (short)606, (short)96, (short)600, (short)98, (short)96, (short)604, (short)720, (short)96, (short)96, (short)605, (short)96, (short)96, (short)96, (short)96, (short)96, (short)98, (short)96, (short)96, (short)98, (short)96, (short)609, (short)98, (short)98, (short)96, (short)98, (short)98, (short)98, (short)98, (short)98, (short)611, (short)98, (short)98, (short)610, (short)98, (short)720, (short)96, (short)720, (short)98, (short)720, (short)720, (short)96, (short)96, (short)612, (short)614, (short)96, (short)96, (short)616, (short)96, (short)619, (short)98, (short)617, (short)720, (short)621, (short)622, (short)98, (short)98, (short)96, (short)96, (short)98, (short)98, (short)623, (short)98, (short)96, (short)615, (short)613, (short)618, (short)96, (short)96, (short)620, (short)96, (short)98, (short)98, (short)720, (short)624, (short)720, (short)720, (short)98, (short)626, (short)627, (short)96, (short)98, (short)98, (short)96, (short)98, (short)96, (short)96, (short)629, (short)96, (short)630, (short)628, (short)625, (short)96, (short)96, (short)98, (short)720, (short)96, (short)98, (short)96, (short)98, (short)98, (short)96, (short)98, (short)640, (short)96, (short)720, (short)98, (short)98, (short)96, (short)631, (short)98, (short)633, (short)98, (short)720, (short)632, (short)98, (short)96, (short)96, (short)98, (short)634, (short)96, (short)96, (short)98, (short)720, (short)96, (short)96, (short)96, (short)636, (short)635, (short)637, (short)98, (short)98, (short)96, (short)96, (short)98, (short)98, (short)96, (short)638, (short)98, (short)98, (short)98, (short)720, (short)720, (short)720, (short)96, (short)96, (short)98, (short)98, (short)96, (short)96, (short)98, (short)96, (short)642, (short)96, (short)641, (short)639, (short)643, (short)644, (short)98, (short)98, (short)645, (short)96, (short)98, (short)98, (short)96, (short)98, (short)96, (short)98, (short)96, (short)96, (short)720, (short)96, (short)720, (short)96, (short)720, (short)98, (short)647, (short)96, (short)98, (short)96, (short)98, (short)720, (short)98, (short)98, (short)648, (short)98, (short)650, (short)98, (short)646, (short)720, (short)653, (short)98, (short)720, (short)98, (short)96, (short)649, (short)96, (short)96, (short)96, (short)720, (short)651, (short)654, (short)652, (short)655, (short)656, (short)96, (short)657, (short)660, (short)98, (short)661, (short)98, (short)98, (short)98, (short)662, (short)96, (short)96, (short)96, (short)96, (short)96, (short)98, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)98, (short)98, (short)98, (short)98, (short)98, (short)96, (short)98, (short)98, (short)98, (short)98, (short)98, (short)98, (short)98, (short)98, (short)663, (short)720, (short)720, (short)720, (short)664, (short)98, (short)96, (short)96, (short)665, (short)96, (short)96, (short)720, (short)96, (short)667, (short)674, (short)672, (short)666, (short)675, (short)670, (short)673, (short)98, (short)98, (short)678, (short)98, (short)98, (short)677, (short)98, (short)668, (short)96, (short)669, (short)96, (short)671, (short)720, (short)96, (short)96, (short)96, (short)720, (short)96, (short)676, (short)96, (short)96, (short)96, (short)98, (short)96, (short)98, (short)96, (short)679, (short)98, (short)98, (short)98, (short)681, (short)98, (short)96, (short)98, (short)98, (short)98, (short)680, (short)98, (short)96, (short)98, (short)96, (short)96, (short)96, (short)96, (short)96, (short)96, (short)98, (short)720, (short)96, (short)96, (short)683, (short)682, (short)98, (short)685, (short)98, (short)98, (short)98, (short)98, (short)98, (short)98, (short)96, (short)684, (short)98, (short)98, (short)96, (short)96, (short)689, (short)96, (short)686, (short)687, (short)96, (short)720, (short)96, (short)96, (short)98, (short)96, (short)96, (short)690, (short)98, (short)98, (short)688, (short)98, (short)720, (short)692, (short)98, (short)691, (short)98, (short)98, (short)96, (short)98, (short)98, (short)697, (short)693, (short)96, (short)720, (short)695, (short)694, (short)96, (short)696, (short)720, (short)96, (short)96, (short)98, (short)698, (short)720, (short)96, (short)96, (short)98, (short)702, (short)700, (short)720, (short)98, (short)720, (short)699, (short)98, (short)98, (short)96, (short)96, (short)701, (short)98, (short)98, (short)96, (short)720, (short)96, (short)704, (short)96, (short)705, (short)703, (short)720, (short)96, (short)98, (short)98, (short)707, (short)720, (short)96, (short)98, (short)706, (short)98, (short)96, (short)98, (short)96, (short)96, (short)710, (short)98, (short)96, (short)720, (short)720, (short)711, (short)98, (short)708, (short)709, (short)720, (short)98, (short)720, (short)98, (short)98, (short)720, (short)720, (short)98, (short)720, (short)720, (short)720, (short)720, (short)720, (short)714, (short)720, (short)720, (short)720, (short)720, (short)716, (short)720, (short)720, (short)712, (short)720, (short)713, (short)720, (short)718, (short)719, (short)720, (short)720, (short)715, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)717, (short)61, (short)61, (short)61, (short)61, (short)61, (short)61, (short)61, (short)61, (short)68, (short)68, (short)720, (short)68, (short)68, (short)68, (short)68, (short)68, (short)97, (short)720, (short)720, (short)720, (short)97, (short)97, (short)97, (short)168, (short)168, (short)168, (short)169, (short)169, (short)174, (short)174, (short)174, (short)174, (short)174, (short)174, (short)174, (short)174, (short)259, (short)259, (short)659, (short)720, (short)659, (short)659, (short)659, (short)3, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720
};

static const short int yy_chk[2652] =
{
(short)0, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)1, (short)10, (short)13, (short)13, (short)14, (short)19, (short)659, (short)22, (short)21, (short)22, (short)22, (short)22, (short)22, (short)30, (short)30, (short)23, (short)32, (short)19, (short)21, (short)21, (short)23, (short)14, (short)40, (short)33, (short)25, (short)25, (short)25, (short)25, (short)23, (short)26, (short)32, (short)28, (short)61, (short)26, (short)640, (short)176, (short)40, (short)33, (short)10, (short)24, (short)57, (short)24, (short)24, (short)24, (short)24, (short)25, (short)28, (short)34, (short)28, (short)28, (short)39, (short)34, (short)34, (short)101, (short)24, (short)98, (short)47, (short)24, (short)24, (short)24, (short)96, (short)24, (short)24, (short)95, (short)39, (short)34, (short)43, (short)38, (short)91, (short)61, (short)47, (short)49, (short)24, (short)25, (short)33, (short)40, (short)24, (short)24, (short)41, (short)24, (short)43, (short)38, (short)42, (short)44, (short)97, (short)49, (short)57, (short)24, (short)38, (short)38, (short)24, (short)45, (short)41, (short)38, (short)85, (short)46, (short)42, (short)44, (short)97, (short)48, (short)39, (short)69, (short)76, (short)38, (short)39, (short)45, (short)39, (short)47, (short)38, (short)46, (short)69, (short)63, (short)38, (short)48, (short)43, (short)41, (short)43, (short)100, (short)68, (short)42, (short)42, (short)38, (short)41, (short)42, (short)49, (short)43, (short)41, (short)49, (short)44, (short)41, (short)42, (short)44, (short)45, (short)42, (short)44, (short)37, (short)48, (short)46, (short)50, (short)51, (short)48, (short)52, (short)45, (short)53, (short)46, (short)46, (short)29, (short)54, (short)99, (short)46, (short)68, (short)18, (short)50, (short)51, (short)100, (short)52, (short)107, (short)53, (short)83, (short)55, (short)83, (short)54, (short)99, (short)83, (short)83, (short)83, (short)83, (short)105, (short)103, (short)15, (short)107, (short)9, (short)104, (short)55, (short)174, (short)108, (short)109, (short)110, (short)3, (short)50, (short)51, (short)105, (short)103, (short)51, (short)51, (short)52, (short)104, (short)0, (short)53, (short)108, (short)109, (short)110, (short)54, (short)53, (short)51, (short)51, (short)55, (short)51, (short)54, (short)99, (short)111, (short)52, (short)0, (short)55, (short)77, (short)77, (short)77, (short)77, (short)84, (short)84, (short)84, (short)174, (short)84, (short)0, (short)111, (short)107, (short)105, (short)77, (short)77, (short)103, (short)77, (short)77, (short)77, (short)104, (short)0, (short)108, (short)0, (short)84, (short)84, (short)0, (short)84, (short)109, (short)0, (short)112, (short)0, (short)77, (short)77, (short)110, (short)84, (short)77, (short)77, (short)114, (short)77, (short)81, (short)81, (short)81, (short)81, (short)112, (short)113, (short)111, (short)118, (short)119, (short)0, (short)115, (short)116, (short)114, (short)81, (short)81, (short)117, (short)81, (short)81, (short)81, (short)113, (short)125, (short)118, (short)119, (short)121, (short)115, (short)116, (short)120, (short)0, (short)0, (short)117, (short)0, (short)81, (short)81, (short)0, (short)125, (short)81, (short)81, (short)121, (short)81, (short)82, (short)120, (short)82, (short)82, (short)82, (short)82, (short)112, (short)113, (short)115, (short)116, (short)0, (short)119, (short)0, (short)114, (short)119, (short)82, (short)122, (short)123, (short)82, (short)82, (short)82, (short)0, (short)82, (short)118, (short)119, (short)124, (short)117, (short)126, (short)127, (short)120, (short)122, (short)123, (short)121, (short)82, (short)0, (short)120, (short)125, (short)82, (short)82, (short)124, (short)82, (short)126, (short)127, (short)128, (short)129, (short)130, (short)131, (short)135, (short)82, (short)106, (short)0, (short)137, (short)141, (short)132, (short)134, (short)0, (short)169, (short)128, (short)129, (short)130, (short)131, (short)135, (short)133, (short)106, (short)136, (short)137, (short)141, (short)132, (short)134, (short)138, (short)169, (short)123, (short)122, (short)0, (short)0, (short)0, (short)133, (short)139, (short)136, (short)127, (short)126, (short)124, (short)0, (short)138, (short)140, (short)0, (short)106, (short)106, (short)106, (short)106, (short)106, (short)139, (short)0, (short)0, (short)106, (short)0, (short)128, (short)135, (short)140, (short)129, (short)130, (short)133, (short)106, (short)106, (short)106, (short)132, (short)106, (short)141, (short)134, (short)137, (short)133, (short)142, (short)143, (short)136, (short)138, (short)139, (short)144, (short)133, (short)146, (short)145, (short)138, (short)147, (short)148, (short)150, (short)0, (short)142, (short)143, (short)140, (short)149, (short)151, (short)144, (short)152, (short)146, (short)145, (short)140, (short)147, (short)148, (short)150, (short)140, (short)140, (short)153, (short)0, (short)149, (short)151, (short)154, (short)152, (short)165, (short)165, (short)165, (short)165, (short)194, (short)177, (short)0, (short)144, (short)153, (short)143, (short)144, (short)145, (short)154, (short)0, (short)0, (short)214, (short)142, (short)146, (short)194, (short)177, (short)147, (short)144, (short)150, (short)144, (short)188, (short)0, (short)0, (short)143, (short)148, (short)214, (short)152, (short)150, (short)149, (short)152, (short)0, (short)0, (short)151, (short)0, (short)188, (short)159, (short)173, (short)159, (short)0, (short)154, (short)159, (short)159, (short)159, (short)159, (short)160, (short)153, (short)160, (short)160, (short)160, (short)162, (short)173, (short)162, (short)177, (short)178, (short)162, (short)162, (short)162, (short)162, (short)0, (short)164, (short)164, (short)164, (short)160, (short)164, (short)188, (short)160, (short)160, (short)178, (short)160, (short)161, (short)161, (short)161, (short)161, (short)163, (short)183, (short)163, (short)163, (short)163, (short)164, (short)164, (short)188, (short)164, (short)161, (short)161, (short)173, (short)161, (short)161, (short)161, (short)183, (short)164, (short)0, (short)163, (short)179, (short)0, (short)163, (short)163, (short)0, (short)163, (short)0, (short)180, (short)161, (short)161, (short)178, (short)181, (short)161, (short)161, (short)179, (short)161, (short)166, (short)166, (short)166, (short)166, (short)168, (short)180, (short)184, (short)183, (short)0, (short)181, (short)0, (short)0, (short)0, (short)182, (short)166, (short)186, (short)166, (short)166, (short)166, (short)185, (short)184, (short)179, (short)168, (short)168, (short)168, (short)168, (short)168, (short)182, (short)0, (short)186, (short)0, (short)0, (short)166, (short)185, (short)0, (short)166, (short)166, (short)0, (short)166, (short)180, (short)187, (short)168, (short)168, (short)189, (short)168, (short)180, (short)180, (short)190, (short)168, (short)191, (short)0, (short)181, (short)168, (short)182, (short)187, (short)0, (short)186, (short)189, (short)192, (short)195, (short)193, (short)190, (short)196, (short)191, (short)182, (short)184, (short)197, (short)198, (short)199, (short)185, (short)200, (short)0, (short)192, (short)195, (short)193, (short)201, (short)196, (short)203, (short)202, (short)204, (short)197, (short)198, (short)199, (short)0, (short)200, (short)187, (short)0, (short)206, (short)0, (short)201, (short)207, (short)203, (short)202, (short)204, (short)189, (short)187, (short)193, (short)191, (short)192, (short)196, (short)205, (short)206, (short)190, (short)208, (short)207, (short)209, (short)0, (short)197, (short)0, (short)0, (short)195, (short)0, (short)201, (short)0, (short)205, (short)210, (short)204, (short)208, (short)211, (short)209, (short)198, (short)0, (short)199, (short)202, (short)200, (short)200, (short)212, (short)203, (short)206, (short)210, (short)215, (short)207, (short)211, (short)213, (short)216, (short)207, (short)217, (short)205, (short)218, (short)219, (short)212, (short)208, (short)220, (short)222, (short)215, (short)205, (short)209, (short)213, (short)216, (short)221, (short)217, (short)223, (short)218, (short)219, (short)0, (short)220, (short)220, (short)222, (short)224, (short)211, (short)225, (short)226, (short)227, (short)221, (short)210, (short)223, (short)228, (short)212, (short)224, (short)230, (short)213, (short)0, (short)224, (short)0, (short)225, (short)226, (short)227, (short)0, (short)0, (short)229, (short)228, (short)231, (short)232, (short)230, (short)219, (short)216, (short)222, (short)217, (short)233, (short)234, (short)221, (short)218, (short)223, (short)229, (short)235, (short)231, (short)232, (short)0, (short)236, (short)0, (short)238, (short)237, (short)233, (short)234, (short)239, (short)240, (short)0, (short)241, (short)235, (short)242, (short)227, (short)228, (short)236, (short)226, (short)238, (short)237, (short)243, (short)225, (short)239, (short)240, (short)229, (short)241, (short)244, (short)242, (short)230, (short)0, (short)0, (short)0, (short)245, (short)246, (short)243, (short)247, (short)248, (short)249, (short)250, (short)235, (short)244, (short)231, (short)0, (short)234, (short)237, (short)233, (short)245, (short)246, (short)240, (short)247, (short)248, (short)249, (short)250, (short)0, (short)251, (short)0, (short)238, (short)236, (short)0, (short)263, (short)0, (short)243, (short)0, (short)0, (short)239, (short)264, (short)241, (short)242, (short)251, (short)252, (short)252, (short)252, (short)252, (short)263, (short)249, (short)267, (short)248, (short)250, (short)246, (short)264, (short)266, (short)244, (short)265, (short)245, (short)253, (short)253, (short)253, (short)253, (short)0, (short)267, (short)247, (short)0, (short)0, (short)254, (short)266, (short)254, (short)265, (short)253, (short)254, (short)254, (short)254, (short)254, (short)251, (short)255, (short)0, (short)255, (short)255, (short)255, (short)256, (short)256, (short)256, (short)256, (short)0, (short)264, (short)0, (short)253, (short)257, (short)257, (short)257, (short)257, (short)267, (short)255, (short)0, (short)266, (short)255, (short)255, (short)270, (short)255, (short)258, (short)257, (short)258, (short)258, (short)258, (short)259, (short)265, (short)259, (short)259, (short)259, (short)259, (short)277, (short)270, (short)0, (short)283, (short)0, (short)269, (short)272, (short)258, (short)257, (short)0, (short)258, (short)258, (short)259, (short)258, (short)277, (short)259, (short)259, (short)283, (short)259, (short)269, (short)272, (short)0, (short)259, (short)260, (short)260, (short)260, (short)260, (short)261, (short)261, (short)261, (short)268, (short)261, (short)270, (short)260, (short)260, (short)260, (short)260, (short)260, (short)0, (short)260, (short)260, (short)260, (short)260, (short)277, (short)268, (short)0, (short)261, (short)261, (short)283, (short)261, (short)260, (short)260, (short)260, (short)260, (short)260, (short)260, (short)272, (short)261, (short)260, (short)260, (short)269, (short)260, (short)262, (short)271, (short)262, (short)260, (short)273, (short)262, (short)262, (short)262, (short)262, (short)274, (short)275, (short)278, (short)276, (short)281, (short)279, (short)271, (short)280, (short)268, (short)273, (short)282, (short)284, (short)285, (short)286, (short)274, (short)275, (short)278, (short)276, (short)281, (short)279, (short)0, (short)280, (short)287, (short)288, (short)282, (short)284, (short)285, (short)286, (short)0, (short)289, (short)290, (short)291, (short)292, (short)271, (short)273, (short)0, (short)287, (short)288, (short)0, (short)294, (short)293, (short)0, (short)278, (short)289, (short)290, (short)291, (short)292, (short)295, (short)297, (short)275, (short)284, (short)282, (short)281, (short)294, (short)293, (short)274, (short)275, (short)276, (short)279, (short)280, (short)296, (short)295, (short)297, (short)285, (short)0, (short)298, (short)0, (short)299, (short)300, (short)287, (short)0, (short)301, (short)0, (short)0, (short)296, (short)302, (short)303, (short)292, (short)293, (short)298, (short)294, (short)299, (short)300, (short)304, (short)290, (short)301, (short)291, (short)295, (short)305, (short)302, (short)303, (short)306, (short)307, (short)308, (short)310, (short)309, (short)311, (short)304, (short)296, (short)312, (short)313, (short)0, (short)305, (short)314, (short)297, (short)306, (short)307, (short)308, (short)310, (short)309, (short)311, (short)312, (short)315, (short)312, (short)313, (short)298, (short)316, (short)314, (short)318, (short)317, (short)301, (short)0, (short)299, (short)302, (short)319, (short)320, (short)315, (short)300, (short)321, (short)322, (short)316, (short)323, (short)318, (short)317, (short)0, (short)310, (short)324, (short)325, (short)319, (short)320, (short)327, (short)305, (short)321, (short)322, (short)326, (short)323, (short)311, (short)307, (short)309, (short)306, (short)324, (short)325, (short)0, (short)328, (short)327, (short)313, (short)317, (short)329, (short)326, (short)318, (short)330, (short)331, (short)332, (short)333, (short)0, (short)0, (short)315, (short)328, (short)0, (short)319, (short)0, (short)329, (short)0, (short)334, (short)330, (short)331, (short)332, (short)333, (short)325, (short)320, (short)335, (short)0, (short)322, (short)336, (short)323, (short)327, (short)321, (short)334, (short)0, (short)337, (short)328, (short)324, (short)338, (short)339, (short)335, (short)326, (short)340, (short)336, (short)341, (short)330, (short)342, (short)332, (short)333, (short)337, (short)0, (short)0, (short)338, (short)339, (short)0, (short)331, (short)340, (short)0, (short)341, (short)334, (short)342, (short)329, (short)343, (short)343, (short)343, (short)343, (short)0, (short)344, (short)344, (short)344, (short)344, (short)346, (short)354, (short)346, (short)346, (short)346, (short)355, (short)356, (short)337, (short)336, (short)344, (short)352, (short)352, (short)352, (short)352, (short)0, (short)354, (short)342, (short)341, (short)346, (short)355, (short)356, (short)346, (short)346, (short)338, (short)346, (short)0, (short)340, (short)344, (short)347, (short)357, (short)347, (short)0, (short)0, (short)347, (short)347, (short)347, (short)347, (short)348, (short)360, (short)348, (short)348, (short)348, (short)348, (short)357, (short)0, (short)350, (short)358, (short)350, (short)350, (short)350, (short)359, (short)356, (short)360, (short)355, (short)0, (short)348, (short)0, (short)361, (short)348, (short)348, (short)358, (short)348, (short)0, (short)350, (short)359, (short)348, (short)350, (short)350, (short)351, (short)350, (short)351, (short)361, (short)357, (short)351, (short)351, (short)351, (short)351, (short)353, (short)353, (short)353, (short)353, (short)0, (short)358, (short)362, (short)363, (short)364, (short)360, (short)366, (short)365, (short)0, (short)367, (short)353, (short)368, (short)353, (short)353, (short)353, (short)361, (short)362, (short)363, (short)364, (short)366, (short)366, (short)365, (short)359, (short)367, (short)369, (short)368, (short)370, (short)371, (short)353, (short)372, (short)373, (short)353, (short)353, (short)374, (short)353, (short)375, (short)376, (short)0, (short)369, (short)377, (short)370, (short)371, (short)0, (short)372, (short)373, (short)364, (short)378, (short)374, (short)379, (short)375, (short)376, (short)363, (short)365, (short)377, (short)0, (short)380, (short)362, (short)381, (short)0, (short)382, (short)378, (short)368, (short)379, (short)369, (short)367, (short)383, (short)372, (short)370, (short)371, (short)380, (short)384, (short)381, (short)375, (short)382, (short)376, (short)385, (short)386, (short)388, (short)387, (short)383, (short)373, (short)389, (short)378, (short)374, (short)384, (short)390, (short)391, (short)392, (short)393, (short)385, (short)386, (short)388, (short)387, (short)0, (short)381, (short)389, (short)394, (short)395, (short)397, (short)390, (short)391, (short)392, (short)393, (short)0, (short)0, (short)380, (short)383, (short)382, (short)396, (short)0, (short)394, (short)395, (short)397, (short)398, (short)399, (short)0, (short)400, (short)386, (short)384, (short)387, (short)401, (short)402, (short)396, (short)385, (short)392, (short)0, (short)390, (short)398, (short)399, (short)388, (short)400, (short)403, (short)404, (short)389, (short)401, (short)402, (short)391, (short)0, (short)405, (short)395, (short)406, (short)407, (short)404, (short)409, (short)408, (short)403, (short)404, (short)411, (short)410, (short)396, (short)413, (short)394, (short)405, (short)415, (short)406, (short)407, (short)412, (short)409, (short)408, (short)0, (short)402, (short)411, (short)410, (short)414, (short)413, (short)416, (short)399, (short)415, (short)417, (short)0, (short)412, (short)400, (short)0, (short)401, (short)418, (short)419, (short)0, (short)414, (short)420, (short)416, (short)0, (short)0, (short)417, (short)405, (short)408, (short)409, (short)403, (short)410, (short)418, (short)419, (short)406, (short)0, (short)420, (short)412, (short)421, (short)411, (short)422, (short)415, (short)423, (short)0, (short)414, (short)0, (short)0, (short)0, (short)417, (short)413, (short)0, (short)0, (short)421, (short)417, (short)422, (short)0, (short)423, (short)416, (short)0, (short)420, (short)424, (short)424, (short)424, (short)424, (short)429, (short)429, (short)429, (short)429, (short)433, (short)419, (short)427, (short)0, (short)427, (short)427, (short)427, (short)446, (short)432, (short)422, (short)0, (short)0, (short)0, (short)437, (short)433, (short)421, (short)425, (short)425, (short)425, (short)425, (short)427, (short)446, (short)432, (short)427, (short)427, (short)434, (short)427, (short)437, (short)0, (short)0, (short)425, (short)435, (short)425, (short)425, (short)425, (short)428, (short)0, (short)428, (short)0, (short)434, (short)428, (short)428, (short)428, (short)428, (short)446, (short)435, (short)0, (short)0, (short)425, (short)432, (short)433, (short)425, (short)425, (short)0, (short)425, (short)430, (short)430, (short)430, (short)430, (short)431, (short)436, (short)431, (short)431, (short)431, (short)438, (short)439, (short)0, (short)435, (short)437, (short)430, (short)440, (short)430, (short)430, (short)430, (short)436, (short)434, (short)0, (short)431, (short)438, (short)439, (short)431, (short)431, (short)441, (short)431, (short)440, (short)442, (short)443, (short)430, (short)444, (short)445, (short)430, (short)430, (short)447, (short)430, (short)448, (short)449, (short)441, (short)450, (short)443, (short)442, (short)443, (short)451, (short)444, (short)445, (short)452, (short)436, (short)447, (short)453, (short)448, (short)449, (short)0, (short)450, (short)438, (short)455, (short)454, (short)451, (short)0, (short)456, (short)452, (short)457, (short)439, (short)453, (short)458, (short)460, (short)440, (short)461, (short)459, (short)455, (short)454, (short)447, (short)445, (short)456, (short)441, (short)457, (short)462, (short)442, (short)458, (short)460, (short)0, (short)461, (short)459, (short)444, (short)451, (short)463, (short)464, (short)448, (short)465, (short)466, (short)462, (short)467, (short)449, (short)450, (short)452, (short)453, (short)454, (short)0, (short)454, (short)463, (short)464, (short)457, (short)465, (short)466, (short)468, (short)467, (short)454, (short)469, (short)454, (short)459, (short)470, (short)455, (short)471, (short)456, (short)472, (short)473, (short)474, (short)475, (short)468, (short)476, (short)460, (short)469, (short)0, (short)458, (short)470, (short)477, (short)471, (short)478, (short)472, (short)473, (short)474, (short)475, (short)0, (short)476, (short)479, (short)0, (short)463, (short)464, (short)480, (short)477, (short)481, (short)478, (short)482, (short)483, (short)0, (short)484, (short)467, (short)485, (short)479, (short)471, (short)0, (short)486, (short)480, (short)488, (short)481, (short)472, (short)482, (short)483, (short)475, (short)484, (short)487, (short)485, (short)490, (short)489, (short)477, (short)486, (short)491, (short)488, (short)492, (short)493, (short)473, (short)0, (short)0, (short)0, (short)487, (short)497, (short)490, (short)489, (short)496, (short)498, (short)491, (short)499, (short)492, (short)493, (short)494, (short)494, (short)494, (short)494, (short)500, (short)497, (short)482, (short)0, (short)496, (short)498, (short)501, (short)499, (short)502, (short)487, (short)483, (short)503, (short)0, (short)485, (short)500, (short)490, (short)488, (short)489, (short)0, (short)493, (short)501, (short)504, (short)502, (short)505, (short)497, (short)503, (short)491, (short)506, (short)492, (short)495, (short)495, (short)495, (short)495, (short)0, (short)507, (short)504, (short)508, (short)505, (short)500, (short)509, (short)510, (short)506, (short)498, (short)495, (short)511, (short)495, (short)495, (short)495, (short)507, (short)496, (short)508, (short)501, (short)512, (short)509, (short)510, (short)513, (short)514, (short)515, (short)511, (short)0, (short)516, (short)495, (short)517, (short)0, (short)495, (short)495, (short)512, (short)495, (short)506, (short)513, (short)514, (short)515, (short)518, (short)504, (short)516, (short)519, (short)517, (short)505, (short)520, (short)509, (short)0, (short)508, (short)521, (short)522, (short)511, (short)523, (short)518, (short)0, (short)510, (short)519, (short)524, (short)525, (short)520, (short)526, (short)512, (short)0, (short)521, (short)522, (short)527, (short)523, (short)513, (short)514, (short)528, (short)517, (short)524, (short)525, (short)0, (short)526, (short)516, (short)518, (short)0, (short)529, (short)527, (short)518, (short)530, (short)0, (short)528, (short)531, (short)532, (short)533, (short)519, (short)0, (short)534, (short)535, (short)522, (short)529, (short)523, (short)536, (short)530, (short)520, (short)537, (short)531, (short)532, (short)533, (short)538, (short)521, (short)534, (short)535, (short)539, (short)0, (short)541, (short)536, (short)0, (short)540, (short)537, (short)542, (short)543, (short)545, (short)538, (short)544, (short)0, (short)546, (short)539, (short)530, (short)541, (short)528, (short)531, (short)540, (short)547, (short)542, (short)543, (short)545, (short)548, (short)544, (short)529, (short)546, (short)549, (short)0, (short)550, (short)537, (short)552, (short)0, (short)547, (short)551, (short)0, (short)534, (short)548, (short)553, (short)535, (short)533, (short)549, (short)540, (short)550, (short)555, (short)552, (short)542, (short)554, (short)551, (short)538, (short)556, (short)544, (short)553, (short)539, (short)557, (short)558, (short)545, (short)559, (short)555, (short)560, (short)0, (short)554, (short)0, (short)561, (short)556, (short)548, (short)0, (short)562, (short)557, (short)558, (short)563, (short)559, (short)547, (short)560, (short)553, (short)551, (short)552, (short)561, (short)564, (short)550, (short)555, (short)562, (short)565, (short)549, (short)563, (short)566, (short)554, (short)567, (short)568, (short)570, (short)569, (short)0, (short)564, (short)571, (short)573, (short)572, (short)565, (short)574, (short)556, (short)566, (short)575, (short)567, (short)568, (short)570, (short)569, (short)559, (short)562, (short)571, (short)573, (short)572, (short)560, (short)574, (short)0, (short)576, (short)575, (short)577, (short)578, (short)579, (short)0, (short)0, (short)564, (short)566, (short)580, (short)581, (short)0, (short)563, (short)569, (short)576, (short)582, (short)577, (short)578, (short)579, (short)564, (short)574, (short)0, (short)573, (short)580, (short)581, (short)567, (short)572, (short)583, (short)565, (short)582, (short)584, (short)570, (short)0, (short)585, (short)586, (short)571, (short)587, (short)588, (short)590, (short)591, (short)589, (short)583, (short)592, (short)593, (short)584, (short)594, (short)577, (short)585, (short)586, (short)595, (short)587, (short)588, (short)590, (short)591, (short)589, (short)580, (short)592, (short)593, (short)579, (short)594, (short)0, (short)596, (short)0, (short)595, (short)0, (short)0, (short)597, (short)598, (short)583, (short)585, (short)599, (short)600, (short)587, (short)601, (short)590, (short)596, (short)588, (short)0, (short)592, (short)593, (short)597, (short)598, (short)602, (short)604, (short)599, (short)600, (short)594, (short)601, (short)603, (short)586, (short)584, (short)589, (short)605, (short)607, (short)591, (short)606, (short)602, (short)604, (short)0, (short)595, (short)0, (short)0, (short)603, (short)597, (short)598, (short)608, (short)605, (short)607, (short)609, (short)606, (short)610, (short)611, (short)600, (short)612, (short)601, (short)599, (short)596, (short)613, (short)614, (short)608, (short)0, (short)615, (short)609, (short)616, (short)610, (short)611, (short)617, (short)612, (short)617, (short)618, (short)0, (short)613, (short)614, (short)619, (short)602, (short)615, (short)606, (short)616, (short)0, (short)603, (short)617, (short)620, (short)621, (short)618, (short)608, (short)622, (short)623, (short)619, (short)0, (short)624, (short)625, (short)626, (short)611, (short)609, (short)614, (short)620, (short)621, (short)627, (short)628, (short)622, (short)623, (short)630, (short)615, (short)624, (short)625, (short)626, (short)0, (short)0, (short)0, (short)629, (short)631, (short)627, (short)628, (short)632, (short)633, (short)630, (short)635, (short)620, (short)634, (short)618, (short)616, (short)622, (short)623, (short)629, (short)631, (short)624, (short)637, (short)632, (short)633, (short)636, (short)635, (short)643, (short)634, (short)638, (short)639, (short)0, (short)641, (short)0, (short)642, (short)0, (short)637, (short)628, (short)644, (short)636, (short)645, (short)643, (short)0, (short)638, (short)639, (short)629, (short)641, (short)631, (short)642, (short)627, (short)0, (short)634, (short)644, (short)0, (short)645, (short)646, (short)630, (short)647, (short)648, (short)649, (short)0, (short)632, (short)635, (short)633, (short)636, (short)638, (short)650, (short)639, (short)641, (short)646, (short)642, (short)647, (short)648, (short)649, (short)644, (short)651, (short)652, (short)653, (short)654, (short)655, (short)650, (short)657, (short)656, (short)661, (short)660, (short)662, (short)663, (short)664, (short)665, (short)651, (short)652, (short)653, (short)654, (short)655, (short)666, (short)657, (short)656, (short)661, (short)660, (short)662, (short)663, (short)664, (short)665, (short)646, (short)0, (short)0, (short)0, (short)647, (short)666, (short)667, (short)668, (short)649, (short)669, (short)670, (short)0, (short)671, (short)651, (short)657, (short)656, (short)650, (short)660, (short)654, (short)656, (short)667, (short)668, (short)665, (short)669, (short)670, (short)664, (short)671, (short)652, (short)672, (short)653, (short)673, (short)655, (short)0, (short)674, (short)675, (short)677, (short)0, (short)676, (short)663, (short)678, (short)679, (short)680, (short)672, (short)681, (short)673, (short)682, (short)666, (short)674, (short)675, (short)677, (short)669, (short)676, (short)683, (short)678, (short)679, (short)680, (short)667, (short)681, (short)684, (short)682, (short)685, (short)686, (short)687, (short)688, (short)689, (short)690, (short)683, (short)0, (short)691, (short)692, (short)674, (short)673, (short)684, (short)676, (short)685, (short)686, (short)687, (short)688, (short)689, (short)690, (short)693, (short)674, (short)691, (short)692, (short)694, (short)695, (short)681, (short)696, (short)677, (short)678, (short)697, (short)0, (short)698, (short)699, (short)693, (short)700, (short)701, (short)682, (short)694, (short)695, (short)679, (short)696, (short)0, (short)684, (short)697, (short)683, (short)698, (short)699, (short)703, (short)700, (short)701, (short)691, (short)685, (short)702, (short)0, (short)689, (short)687, (short)704, (short)690, (short)0, (short)705, (short)706, (short)703, (short)692, (short)0, (short)707, (short)708, (short)702, (short)696, (short)694, (short)0, (short)704, (short)0, (short)693, (short)705, (short)706, (short)709, (short)710, (short)695, (short)707, (short)708, (short)711, (short)0, (short)712, (short)699, (short)713, (short)700, (short)698, (short)0, (short)714, (short)709, (short)710, (short)702, (short)0, (short)715, (short)711, (short)701, (short)712, (short)717, (short)713, (short)716, (short)718, (short)707, (short)714, (short)719, (short)0, (short)0, (short)708, (short)715, (short)704, (short)705, (short)0, (short)717, (short)0, (short)716, (short)718, (short)0, (short)0, (short)719, (short)0, (short)0, (short)0, (short)0, (short)0, (short)712, (short)0, (short)0, (short)0, (short)0, (short)714, (short)0, (short)0, (short)710, (short)0, (short)711, (short)0, (short)716, (short)718, (short)0, (short)0, (short)713, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)0, (short)715, (short)721, (short)721, (short)721, (short)721, (short)721, (short)721, (short)721, (short)721, (short)722, (short)722, (short)0, (short)722, (short)722, (short)722, (short)722, (short)722, (short)723, (short)0, (short)0, (short)0, (short)723, (short)723, (short)723, (short)724, (short)724, (short)724, (short)725, (short)725, (short)726, (short)726, (short)726, (short)726, (short)726, (short)726, (short)726, (short)726, (short)727, (short)727, (short)728, (short)0, (short)728, (short)728, (short)728, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720, (short)720
};

static yy_state_type yy_last_accepting_state;

static char * yy_last_accepting_cpos;

char * yytext;

enum yytokentype
{
IDENTIFIER = 258, CONSTANT = 259, STRING_LITERAL = 260, SIZEOF = 261, PTR_OP = 262, INC_OP = 263, DEC_OP = 264, LEFT_OP = 265, RIGHT_OP = 266, LE_OP = 267, GE_OP = 268, EQ_OP = 269, NE_OP = 270, AND_OP = 271, OR_OP = 272, MUL_ASSIGN = 273, DIV_ASSIGN = 274, MOD_ASSIGN = 275, ADD_ASSIGN = 276, SUB_ASSIGN = 277, LEFT_ASSIGN = 278, RIGHT_ASSIGN = 279, AND_ASSIGN = 280, XOR_ASSIGN = 281, OR_ASSIGN = 282, TYPE_NAME = 283, TYPEDEF = 284, EXTERN = 285, STATIC = 286, AUTO = 287, REGISTER = 288, CHAR = 289, SHORT = 290, INT = 291, UINT = 292, INT64 = 293, LONG = 294, SIGNED = 295, UNSIGNED = 296, FLOAT = 297, DOUBLE = 298, CONST = 299, VOLATILE = 300, VOID = 301, VALIST = 302, STRUCT = 303, UNION = 304, ENUM = 305, ELLIPSIS = 306, CASE = 307, DEFAULT = 308, IF = 309, SWITCH = 310, WHILE = 311, DO = 312, FOR = 313, GOTO = 314, CONTINUE = 315, BREAK = 316, RETURN = 317, IFX = 318, ELSE = 319, CLASS = 320, THISCLASS = 321, CLASS_NAME = 322, PROPERTY = 323, SETPROP = 324, GETPROP = 325, NEWOP = 326, RENEW = 327, DELETE = 328, EXT_DECL = 329, EXT_STORAGE = 330, IMPORT = 331, DEFINE = 332, VIRTUAL = 333, ATTRIB = 334, PUBLIC = 335, PRIVATE = 336, TYPED_OBJECT = 337, ANY_OBJECT = 338, _INCREF = 339, EXTENSION = 340, ASM = 341, TYPEOF = 342, WATCH = 343, STOPWATCHING = 344, FIREWATCHERS = 345, WATCHABLE = 346, CLASS_DESIGNER = 347, CLASS_NO_EXPANSION = 348, CLASS_FIXED = 349, ISPROPSET = 350, CLASS_DEFAULT_PROPERTY = 351, PROPERTY_CATEGORY = 352, CLASS_DATA = 353, CLASS_PROPERTY = 354, SUBCLASS = 355, NAMESPACE = 356, NEW0OP = 357, RENEW0 = 358, VAARG = 359, DBTABLE = 360, DBFIELD = 361, DBINDEX = 362, DATABASE_OPEN = 363, ALIGNOF = 364, ATTRIB_DEP = 365, __ATTRIB = 366, BOOL = 367, _BOOL = 368, _COMPLEX = 369, _IMAGINARY = 370, RESTRICT = 371, THREAD = 372, WIDE_STRING_LITERAL = 373
};

unsigned int echoOn = 1;

int preprocessor();

int comment();

char sourceFileStack[30][797];

int declModeStack[30];

int include_stack_ptr = 0;

extern int yywrap(void);

static int input(void);

extern int defaultDeclMode;

extern int declMode;

extern int structDeclMode;

extern unsigned int inCompiler;

int yywrap()
{
return (1);
}

extern int yychar;

struct __ecereNameSpace__ecere__sys__BTNode;

struct __ecereNameSpace__ecere__sys__OldList
{
void *  first;
void *  last;
int count;
unsigned int offset;
unsigned int circ;
} ecere_gcc_struct;

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

struct Identifier;

struct Expression;

struct Specifier;

struct Enumerator;

struct Declarator;

struct Pointer;

struct Initializer;

struct InitDeclarator;

struct TypeName;

struct Declaration;

struct Statement;

struct FunctionDefinition;

struct External;

struct Context;

struct AsmField;

struct Attrib;

struct ExtDecl;

struct Attribute;

struct Instantiation;

struct MembersInit;

struct MemberInit;

struct ClassFunction;

struct ClassDefinition;

struct ClassDef;

struct PropertyDef;

struct Symbol;

struct PropertyWatch;

struct TemplateParameter;

struct TemplateArgument;

struct TemplateDatatype;

struct DBTableEntry;

struct DBIndexItem;

struct DBTableDef;

struct CodePosition
{
int line;
int charPos;
int pos;
int included;
} ecere_gcc_struct;

extern char *  strcpy(char * , const char * );

extern int check_type(void);

extern int printf(const char * , ...);

extern int yyerror(void);

extern int __ecereNameSpace__ecere__sys__GetValue(char * *  buffer);

extern unsigned int __ecereNameSpace__ecere__sys__GetString(char * *  buffer, char *  string, int max);

extern char *  __ecereNameSpace__ecere__sys__GetExtension(const char *  string, char *  output);

extern int strcmp(const char * , const char * );

extern int GetIncludeFileID(char *  includeFile);

extern char *  __ecereNameSpace__ecere__sys__TrimLSpaces(const char *  string, char *  output);

extern int strncmp(const char * , const char * , size_t n);

extern void *  memmove(void * , const void * , size_t size);

extern size_t strlen(const char * );

extern char *  strncpy(char * , const char * , size_t n);

extern const char *  __ecereNameSpace__ecere__GetTranslatedString(const char * name, const char *  string, const char *  stringAndContext);

extern int FindIncludeFileID(char *  includeFile);

extern void *  memcpy(void * , const void * , size_t size);

struct __ecereNameSpace__ecere__com__GlobalFunction;

static void yy_flex_free(void * ptr)
{
free(ptr);
}

static void * yy_flex_alloc(yy_size_t size)
{
return (void *)malloc(size);
}

static void * yy_flex_realloc(void * ptr, yy_size_t size)
{
return (void *)realloc((char *)ptr, size);
}

static void yy_fatal_error(const char msg[])
{
(void)fprintf((bsl_stderr()), "%s\n", msg);
exit(2);
}

static YY_BUFFER_STATE yy_current_buffer = 0;

void yy_switch_to_buffer(YY_BUFFER_STATE new_buffer);

YY_BUFFER_STATE yy_create_buffer(FILE * file, int size);

void yy_delete_buffer(YY_BUFFER_STATE b);

void yy_init_buffer(YY_BUFFER_STATE b, FILE * file);

void yy_flush_buffer(YY_BUFFER_STATE b);

YY_BUFFER_STATE yy_scan_buffer(char * base, yy_size_t size);

YY_BUFFER_STATE yy_scan_string(const char * yy_str);

YY_BUFFER_STATE yy_scan_bytes(const char * bytes, int len);

YY_BUFFER_STATE include_stack[30];

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
if(yy_current_state >= 721)
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
if(yy_current_state >= 721)
yy_c = yy_meta[(unsigned int)yy_c];
}
yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int)yy_c];
yy_is_jam = (yy_current_state == 720);
return yy_is_jam ? 0 : yy_current_state;
}

void SetEchoOn(unsigned int b)
{
echoOn = b;
}

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
} ecere_gcc_struct YYSTYPE;

extern YYSTYPE yylval;

struct Location
{
struct CodePosition start;
struct CodePosition end;
} ecere_gcc_struct;

void SetSomeSourceFileStack(const char * fileName, int index)
{
strcpy(sourceFileStack[index], fileName);
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

void yyrestart(FILE * input_file)
{
if(!yy_current_buffer)
yy_current_buffer = yy_create_buffer(yyin, 16384);
yy_init_buffer(yy_current_buffer, input_file);
yy_load_buffer_state();
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

void yy_init_buffer(YY_BUFFER_STATE b, FILE * file)
{
yy_flush_buffer(b);
(*b).yy_input_file = file;
(*b).yy_fill_buffer = 1;
(*b).yy_is_interactive = 0;
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

YY_BUFFER_STATE yy_scan_string(const char * yy_str)
{
int len;

for(len = 0; yy_str[len]; ++len)
;
return yy_scan_bytes(yy_str, len);
}

extern struct Location yylloc;

extern struct Location type_yylloc;

extern struct Location expression_yylloc;

struct Location locStack[30];

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
int c;

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
}
yylloc.start = yylloc.end;
return 0;
}

void TESTTTT()
{
yylloc.end.charPos += yyleng;
yylloc.end.pos += yyleng;
type_yylloc.end.charPos += yyleng;
type_yylloc.end.pos += yyleng;
expression_yylloc.end.charPos += yyleng;
expression_yylloc.end.pos += yyleng;
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

struct __ecereNameSpace__ecere__com__Instance * fileStack[30];

extern struct __ecereNameSpace__ecere__com__Instance * OpenIncludeFile(char *  includeFile);

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
} ecere_gcc_struct;

extern void __ecereNameSpace__ecere__com__eInstance_DecRef(struct __ecereNameSpace__ecere__com__Instance * instance);

int __ecereVMethodID___ecereNameSpace__ecere__sys__File_Read;

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
fprintf((bsl_stderr()), "%s", __ecereNameSpace__ecere__GetTranslatedString("ec", "Includes nested too deeply", (((void *)0))));
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
}
}
return 0;
}

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
if(yy_current_state >= 721)
yy_c = yy_meta[(unsigned int)yy_c];
}
yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int)yy_c];
++yy_cp;
}while(yy_base[yy_current_state] != (short)2575);
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
return (CONST);
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
return (CONSTANT);
}
break;
case 121:
TESTTTT();
{
return (CONSTANT);
}
break;
case 122:
TESTTTT();
{
return (CONSTANT);
}
break;
case 123:
TESTTTT();
{
return (STRING_LITERAL);
}
break;
case 124:
TESTTTT();
{
return (WIDE_STRING_LITERAL);
}
break;
case 125:
TESTTTT();
{
return (ELLIPSIS);
}
break;
case 126:
TESTTTT();
{
return (RIGHT_ASSIGN);
}
break;
case 127:
TESTTTT();
{
return (LEFT_ASSIGN);
}
break;
case 128:
TESTTTT();
{
return (ADD_ASSIGN);
}
break;
case 129:
TESTTTT();
{
return (SUB_ASSIGN);
}
break;
case 130:
TESTTTT();
{
return (MUL_ASSIGN);
}
break;
case 131:
TESTTTT();
{
return (DIV_ASSIGN);
}
break;
case 132:
TESTTTT();
{
return (MOD_ASSIGN);
}
break;
case 133:
TESTTTT();
{
return (AND_ASSIGN);
}
break;
case 134:
TESTTTT();
{
return (XOR_ASSIGN);
}
break;
case 135:
TESTTTT();
{
return (OR_ASSIGN);
}
break;
case 136:
TESTTTT();
{
return (RIGHT_OP);
}
break;
case 137:
TESTTTT();
{
return (LEFT_OP);
}
break;
case 138:
TESTTTT();
{
return (INC_OP);
}
break;
case 139:
TESTTTT();
{
return (DEC_OP);
}
break;
case 140:
TESTTTT();
{
return (PTR_OP);
}
break;
case 141:
TESTTTT();
{
return (AND_OP);
}
break;
case 142:
TESTTTT();
{
return (OR_OP);
}
break;
case 143:
TESTTTT();
{
return (LE_OP);
}
break;
case 144:
TESTTTT();
{
return (GE_OP);
}
break;
case 145:
TESTTTT();
{
return (EQ_OP);
}
break;
case 146:
TESTTTT();
{
return (NE_OP);
}
break;
case 147:
TESTTTT();
{
return (';');
}
break;
case 148:
TESTTTT();
{
return ('{');
}
break;
case 149:
TESTTTT();
{
return ('}');
}
break;
case 150:
TESTTTT();
{
return (',');
}
break;
case 151:
TESTTTT();
{
return (':');
}
break;
case 152:
TESTTTT();
{
return ('=');
}
break;
case 153:
TESTTTT();
{
return ('(');
}
break;
case 154:
TESTTTT();
{
return (')');
}
break;
case 155:
TESTTTT();
{
return ('[');
}
break;
case 156:
TESTTTT();
{
return (']');
}
break;
case 157:
TESTTTT();
{
return ('.');
}
break;
case 158:
TESTTTT();
{
return ('&');
}
break;
case 159:
TESTTTT();
{
return ('!');
}
break;
case 160:
TESTTTT();
{
return ('~');
}
break;
case 161:
TESTTTT();
{
return ('-');
}
break;
case 162:
TESTTTT();
{
return ('+');
}
break;
case 163:
TESTTTT();
{
return ('*');
}
break;
case 164:
TESTTTT();
{
return ('/');
}
break;
case 165:
TESTTTT();
{
return ('%');
}
break;
case 166:
TESTTTT();
{
return ('<');
}
break;
case 167:
TESTTTT();
{
return ('>');
}
break;
case 168:
TESTTTT();
{
return ('^');
}
break;
case 169:
TESTTTT();
{
return ('|');
}
break;
case 170:
TESTTTT();
{
return ('?');
}
break;
case 171:
TESTTTT();
{
return ('$');
}
break;
case 179:
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
case 172:
TESTTTT();
{
yylloc.start = yylloc.end;
type_yylloc.start = type_yylloc.end;
expression_yylloc.start = expression_yylloc.end;
}
break;
case 173:
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
case 174:
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
case 175:
TESTTTT();
{
yylloc.start = yylloc.end;
expression_yylloc.start = expression_yylloc.end;
type_yylloc.start = type_yylloc.end;
}
break;
case 176:
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
case 177:
TESTTTT();
(void)fwrite(yytext, yyleng, 1, yyout);
break;
case 178:
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
yy_act = (178 + ((yy_start - 1) / 2) + 1);
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

extern struct __ecereNameSpace__ecere__com__DataMember * __ecereNameSpace__ecere__com__eClass_AddDataMember(struct __ecereNameSpace__ecere__com__Class * _class, const char *  name, const char *  type, unsigned int size, unsigned int alignment, int declMode);

struct __ecereNameSpace__ecere__com__Module;

extern struct __ecereNameSpace__ecere__com__Class * __ecereNameSpace__ecere__com__eSystem_RegisterClass(int type, const char *  name, const char *  baseName, int size, int sizeClass, unsigned int (*  Constructor)(void * ), void (*  Destructor)(void * ), struct __ecereNameSpace__ecere__com__Instance * module, int declMode, int inheritanceAccess);

extern struct __ecereNameSpace__ecere__com__Instance * __thisModule;

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

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_yy_buffer_state;

static struct __ecereNameSpace__ecere__com__Class * __ecereClass_LexerBackup;

extern struct __ecereNameSpace__ecere__com__Class * __ecereClass___ecereNameSpace__ecere__sys__File;

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
const char *  name;
void *  library;
void *  Unload;
int importType;
int origImportType;
struct __ecereNameSpace__ecere__com__NameSpace privateNameSpace;
struct __ecereNameSpace__ecere__com__NameSpace publicNameSpace;
} ecere_gcc_struct;

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

void __ecereUnregisterModule_lexer(struct __ecereNameSpace__ecere__com__Instance * module)
{

}

void __ecereRegisterModule_lexer(struct __ecereNameSpace__ecere__com__Instance * module)
{
struct __ecereNameSpace__ecere__com__Class __attribute__((unused)) * class;

class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(1, "yy_buffer_state", 0, sizeof(struct yy_buffer_state), 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_yy_buffer_state = class;
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_input_file", "void *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_ch_buf", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_buf_pos", "char *", sizeof(void *), 0xF000F000, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_buf_size", "uint", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_n_chars", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_is_our_buffer", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_is_interactive", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_at_bol", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_fill_buffer", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eClass_AddDataMember(class, "yy_buffer_status", "int", 4, 4, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetEchoOn", "void SetEchoOn(bool b)", SetEchoOn, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("TESTTTT", "void TESTTTT(void)", TESTTTT, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("SetSomeSourceFileStack", "void SetSomeSourceFileStack(const char * fileName, int index)", SetSomeSourceFileStack, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("yywrap", "int yywrap(void)", yywrap, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("comment", "int comment(void)", comment, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("commentCPP", "int commentCPP(void)", commentCPP, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("preprocessor", "int preprocessor(void)", preprocessor, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("resetScanner", "void resetScanner(void)", resetScanner, module, 1);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("resetScannerPos", "void resetScannerPos(CodePosition pos)", resetScannerPos, module, 2);
class = __ecereNameSpace__ecere__com__eSystem_RegisterClass(0, "LexerBackup", 0, sizeof(struct LexerBackup), 0, (void *)0, (void *)0, module, 2, 1);
if(((struct __ecereNameSpace__ecere__com__Module *)(((char *)module + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application == ((struct __ecereNameSpace__ecere__com__Module *)(((char *)__thisModule + sizeof(struct __ecereNameSpace__ecere__com__Instance))))->application && class)
__ecereClass_LexerBackup = class;
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("pushLexer", "LexerBackup pushLexer(void)", pushLexer, module, 2);
__ecereNameSpace__ecere__com__eSystem_RegisterFunction("popLexer", "void popLexer(LexerBackup backup)", popLexer, module, 2);
}

