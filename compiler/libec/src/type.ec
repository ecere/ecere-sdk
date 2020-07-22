/* A Bison parser, made by GNU Bison 2.7.91-dirty.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.7.91-dirty"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 1 "type.y" /* yacc.c:356  */


import "ecdefs"

#define YYSIZE_T size_t
#define YYLTYPE Location
#include "grammar.h"

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)         \
  (Current).start = (Rhs)[1].start;      \
  (Current).end = (Rhs)[N].end;
#endif

TypeName parsedType;

#define PRECOMPILER

#define yyparse type_yyparse
#define yylval  type_yylval
#define yychar  type_yychar
#define yydebug type_yydebug
#define yynerrs type_yynerrs
#define yylloc  type_yylloc

extern bool parseTypeError;

extern File fileInput;
extern char * yytext;
int yylex();
int yyerror();

#define uint _uint
default:


#line 103 "type.ec" /* yacc.c:356  */

# ifndef YY_NULL
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULL nullptr
#  else
#   define YY_NULL 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif


/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    IDENTIFIER = 258,
    CONSTANT = 259,
    STRING_LITERAL = 260,
    SIZEOF = 261,
    PTR_OP = 262,
    INC_OP = 263,
    DEC_OP = 264,
    LEFT_OP = 265,
    RIGHT_OP = 266,
    LE_OP = 267,
    GE_OP = 268,
    EQ_OP = 269,
    NE_OP = 270,
    AND_OP = 271,
    OR_OP = 272,
    MUL_ASSIGN = 273,
    DIV_ASSIGN = 274,
    MOD_ASSIGN = 275,
    ADD_ASSIGN = 276,
    SUB_ASSIGN = 277,
    LEFT_ASSIGN = 278,
    RIGHT_ASSIGN = 279,
    AND_ASSIGN = 280,
    XOR_ASSIGN = 281,
    OR_ASSIGN = 282,
    TYPE_NAME = 283,
    TYPEDEF = 284,
    EXTERN = 285,
    STATIC = 286,
    AUTO = 287,
    REGISTER = 288,
    CHAR = 289,
    SHORT = 290,
    INT = 291,
    UINT = 292,
    INT64 = 293,
    INT128 = 294,
    FLOAT128 = 295,
    LONG = 296,
    SIGNED = 297,
    UNSIGNED = 298,
    FLOAT = 299,
    DOUBLE = 300,
    CONST = 301,
    VOLATILE = 302,
    VOID = 303,
    VALIST = 304,
    STRUCT = 305,
    UNION = 306,
    ENUM = 307,
    ELLIPSIS = 308,
    CASE = 309,
    DEFAULT = 310,
    IF = 311,
    SWITCH = 312,
    WHILE = 313,
    DO = 314,
    FOR = 315,
    GOTO = 316,
    CONTINUE = 317,
    BREAK = 318,
    RETURN = 319,
    IFX = 320,
    ELSE = 321,
    CLASS = 322,
    THISCLASS = 323,
    PROPERTY = 324,
    SETPROP = 325,
    GETPROP = 326,
    NEWOP = 327,
    RENEW = 328,
    DELETE = 329,
    EXT_DECL = 330,
    EXT_STORAGE = 331,
    IMPORT = 332,
    DEFINE = 333,
    VIRTUAL = 334,
    ATTRIB = 335,
    PUBLIC = 336,
    PRIVATE = 337,
    TYPED_OBJECT = 338,
    ANY_OBJECT = 339,
    _INCREF = 340,
    EXTENSION = 341,
    ASM = 342,
    TYPEOF = 343,
    WATCH = 344,
    STOPWATCHING = 345,
    FIREWATCHERS = 346,
    WATCHABLE = 347,
    CLASS_DESIGNER = 348,
    CLASS_NO_EXPANSION = 349,
    CLASS_FIXED = 350,
    ISPROPSET = 351,
    CLASS_DEFAULT_PROPERTY = 352,
    PROPERTY_CATEGORY = 353,
    CLASS_DATA = 354,
    CLASS_PROPERTY = 355,
    SUBCLASS = 356,
    NAMESPACE = 357,
    NEW0OP = 358,
    RENEW0 = 359,
    VAARG = 360,
    DBTABLE = 361,
    DBFIELD = 362,
    DBINDEX = 363,
    DATABASE_OPEN = 364,
    ALIGNOF = 365,
    ATTRIB_DEP = 366,
    __ATTRIB = 367,
    BOOL = 368,
    _BOOL = 369,
    _COMPLEX = 370,
    _IMAGINARY = 371,
    RESTRICT = 372,
    THREAD = 373,
    WIDE_STRING_LITERAL = 374,
    BUILTIN_OFFSETOF = 375,
    PRAGMA = 376,
    STATIC_ASSERT = 377
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 40 "type.y" /* yacc.c:372  */

   int i;
   SpecifierType specifierType;
   Identifier id;
   Expression exp;
   Specifier specifier;
   OldList * list;
   Enumerator enumerator;
   Declarator declarator;
   Pointer pointer;
   Initializer initializer;
   InitDeclarator initDeclarator;
   TypeName typeName;
   Declaration declaration;
   Statement stmt;
   FunctionDefinition function;
   External external;
   Context context;
   Attrib attrib;
   ExtDecl extDecl;
   Attribute attribute;

   Instantiation instance;
   MembersInit membersInit;
   MemberInit memberInit;
   ClassFunction classFunction;
   ClassDefinition _class;
   ClassDef classDef;
   PropertyDef prop;
   char * string;
   Symbol symbol;
   TemplateParameter templateParameter;
   TemplateArgument templateArgument;
   TemplateDatatype templateDatatype;

#line 299 "type.ec" /* yacc.c:372  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;
int yyparse (void);



/* Copy the second part of user declarations.  */

#line 328 "type.ec" /* yacc.c:375  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef __attribute__
/* This feature is available in gcc versions 2.5 and later.  */
# if (! defined __GNUC__ || __GNUC__ < 2 \
      || (__GNUC__ == 2 && __GNUC_MINOR__ < 5))
#  define __attribute__(Spec) /* empty */
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL \
             && defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
  YYLTYPE yyls_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE) + sizeof (YYLTYPE)) \
      + 2 * YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  103
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   9198

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  148
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  124
/* YYNRULES -- Number of rules.  */
#define YYNRULES  509
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  869

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   377

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   137,     2,     2,   129,   139,   134,     2,
     126,   127,   123,   135,   133,   136,   130,   138,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   143,   145,
     124,   144,   125,   142,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   131,     2,   132,   140,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   146,   141,   147,   128,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   234,   234,   252,   276,   316,   317,   344,   348,   349,
     350,   367,   369,   374,   379,   384,   386,   391,   396,   397,
     402,   404,   406,   408,   409,   411,   412,   413,   416,   417,
     418,   419,   420,   421,   422,   423,   424,   428,   429,   430,
     431,   432,   433,   446,   447,   448,   452,   481,   482,   483,
     484,   488,   489,   490,   492,   493,   495,   496,   500,   501,
     510,   511,   512,   513,   514,   515,   516,   520,   521,   525,
     526,   527,   528,   532,   533,   534,   538,   539,   540,   544,
     552,   553,   554,   555,   556,   560,   561,   562,   566,   567,
     571,   572,   576,   577,   581,   582,   586,   587,   591,   592,
     596,   597,   598,   602,   603,   604,   605,   606,   607,   608,
     609,   610,   611,   612,   616,   617,   621,   625,   626,   627,
     628,   632,   633,   634,   635,   636,   637,   638,   639,   643,
     644,   645,   646,   647,   648,   649,   650,   651,   652,   656,
     657,   658,   659,   660,   661,   662,   663,   664,   665,   669,
     670,   671,   672,   673,   674,   675,   676,   677,   678,   679,
     680,   684,   685,   689,   690,   691,   692,   693,   694,   695,
     696,   697,   705,   714,   715,   716,   717,   718,   719,   720,
     721,   722,   723,   724,   725,   726,   734,   743,   744,   748,
     749,   753,   754,   755,   756,   757,   758,   762,   763,   764,
     765,   769,   770,   771,   775,   776,   779,   780,   781,   782,
     783,   787,   788,   792,   793,   794,   798,   799,   803,   807,
     808,   809,   814,   815,   816,   817,   818,   819,   820,   821,
     822,   823,   824,   825,   826,   827,   828,   829,   830,   831,
     832,   833,   834,   835,   836,   837,   838,   839,   843,   844,
     845,   846,   847,   848,   849,   850,   851,   852,   853,   854,
     855,   856,   857,   858,   859,   860,   861,   862,   863,   864,
     865,   866,   871,   872,   873,   874,   875,   878,   879,   880,
     881,   882,   887,   888,   891,   893,   898,   899,   904,   905,
     916,   920,   922,   923,   925,   926,   952,   969,   970,   974,
     975,   979,   980,   984,   988,   989,   993,   995,   997,   999,
    1001,  1004,  1006,  1008,  1010,  1012,  1015,  1017,  1019,  1021,
    1023,  1026,  1028,  1030,  1032,  1034,  1039,  1040,  1041,  1042,
    1043,  1044,  1045,  1046,  1050,  1052,  1057,  1059,  1061,  1063,
    1065,  1070,  1071,  1075,  1077,  1078,  1079,  1080,  1084,  1086,
    1091,  1093,  1095,  1096,  1100,  1102,  1104,  1106,  1108,  1110,
    1112,  1114,  1116,  1118,  1120,  1125,  1127,  1129,  1131,  1133,
    1138,  1139,  1140,  1141,  1142,  1143,  1147,  1148,  1149,  1150,
    1151,  1152,  1198,  1199,  1201,  1203,  1208,  1210,  1212,  1214,
    1216,  1221,  1222,  1225,  1227,  1229,  1235,  1239,  1241,  1243,
    1248,  1249,  1250,  1252,  1257,  1258,  1259,  1260,  1261,  1265,
    1266,  1270,  1271,  1272,  1273,  1277,  1278,  1282,  1283,  1287,
    1288,  1289,  1290,  1291,  1302,  1327,  1328,  1332,  1333,  1337,
    1338,  1342,  1344,  1346,  1362,  1364,  1386,  1388,  1393,  1394,
    1395,  1396,  1397,  1398,  1402,  1404,  1406,  1411,  1412,  1416,
    1417,  1420,  1424,  1425,  1426,  1430,  1434,  1442,  1447,  1448,
    1452,  1453,  1454,  1458,  1459,  1460,  1461,  1463,  1464,  1465,
    1469,  1470,  1471,  1472,  1473,  1477,  1481,  1483,  1488,  1490,
    1515,  1517,  1519,  1521,  1526,  1528,  1532,  1534,  1536,  1538,
    1540,  1546,  1548,  1553,  1558,  1559,  1563,  1565,  1570,  1575,
    1576,  1577,  1578,  1579,  1580,  1584,  1585,  1586,  1590,  1591
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "IDENTIFIER", "CONSTANT",
  "STRING_LITERAL", "SIZEOF", "PTR_OP", "INC_OP", "DEC_OP", "LEFT_OP",
  "RIGHT_OP", "LE_OP", "GE_OP", "EQ_OP", "NE_OP", "AND_OP", "OR_OP",
  "MUL_ASSIGN", "DIV_ASSIGN", "MOD_ASSIGN", "ADD_ASSIGN", "SUB_ASSIGN",
  "LEFT_ASSIGN", "RIGHT_ASSIGN", "AND_ASSIGN", "XOR_ASSIGN", "OR_ASSIGN",
  "TYPE_NAME", "TYPEDEF", "EXTERN", "STATIC", "AUTO", "REGISTER", "CHAR",
  "SHORT", "INT", "UINT", "INT64", "INT128", "FLOAT128", "LONG", "SIGNED",
  "UNSIGNED", "FLOAT", "DOUBLE", "CONST", "VOLATILE", "VOID", "VALIST",
  "STRUCT", "UNION", "ENUM", "ELLIPSIS", "CASE", "DEFAULT", "IF", "SWITCH",
  "WHILE", "DO", "FOR", "GOTO", "CONTINUE", "BREAK", "RETURN", "IFX",
  "ELSE", "CLASS", "THISCLASS", "PROPERTY", "SETPROP", "GETPROP", "NEWOP",
  "RENEW", "DELETE", "EXT_DECL", "EXT_STORAGE", "IMPORT", "DEFINE",
  "VIRTUAL", "ATTRIB", "PUBLIC", "PRIVATE", "TYPED_OBJECT", "ANY_OBJECT",
  "_INCREF", "EXTENSION", "ASM", "TYPEOF", "WATCH", "STOPWATCHING",
  "FIREWATCHERS", "WATCHABLE", "CLASS_DESIGNER", "CLASS_NO_EXPANSION",
  "CLASS_FIXED", "ISPROPSET", "CLASS_DEFAULT_PROPERTY",
  "PROPERTY_CATEGORY", "CLASS_DATA", "CLASS_PROPERTY", "SUBCLASS",
  "NAMESPACE", "NEW0OP", "RENEW0", "VAARG", "DBTABLE", "DBFIELD",
  "DBINDEX", "DATABASE_OPEN", "ALIGNOF", "ATTRIB_DEP", "__ATTRIB", "BOOL",
  "_BOOL", "_COMPLEX", "_IMAGINARY", "RESTRICT", "THREAD",
  "WIDE_STRING_LITERAL", "BUILTIN_OFFSETOF", "PRAGMA", "STATIC_ASSERT",
  "'*'", "'<'", "'>'", "'('", "')'", "'~'", "'$'", "'.'", "'['", "']'",
  "','", "'&'", "'+'", "'-'", "'!'", "'/'", "'%'", "'^'", "'|'", "'?'",
  "':'", "'='", "';'", "'{'", "'}'", "$accept", "guess_type",
  "real_guess_type", "type", "base_strict_type", "strict_type",
  "class_function_definition_start",
  "constructor_function_definition_start",
  "destructor_function_definition_start",
  "virtual_class_function_definition_start", "identifier",
  "primary_expression", "simple_primary_expression", "postfix_expression",
  "anon_instantiation_expression", "argument_expression_list",
  "common_unary_expression", "unary_expression", "unary_operator",
  "cast_expression", "multiplicative_expression", "additive_expression",
  "shift_expression", "relational_expression_smaller_than",
  "relational_expression", "equality_expression", "and_expression",
  "exclusive_or_expression", "inclusive_or_expression",
  "logical_and_expression", "logical_or_expression",
  "conditional_expression", "assignment_expression", "assignment_operator",
  "expression", "constant_expression", "declaration",
  "specifier_qualifier_list", "guess_specifier_qualifier_list",
  "declaration_specifiers", "guess_declaration_specifiers",
  "real_guess_declaration_specifiers", "property_specifiers",
  "renew_specifiers", "init_declarator_list", "init_declarator",
  "storage_class_specifier", "ext_decl", "_attrib", "multi_attrib",
  "attribute_word", "attribute", "attribs_list", "attrib", "ext_storage",
  "type_qualifier", "type_specifier", "strict_type_specifier",
  "struct_or_union_specifier_compound",
  "struct_or_union_specifier_nocompound", "template_datatype",
  "template_type_argument", "template_expression_argument",
  "template_argument", "template_arguments_list", "struct_or_union",
  "struct_declaration_list", "default_property", "default_property_list",
  "property", "struct_declaration", "struct_declarator_list",
  "struct_declarator", "enum_specifier_nocompound",
  "enum_specifier_compound", "enumerator_list", "enumerator",
  "direct_abstract_declarator", "direct_abstract_declarator_noarray",
  "abstract_declarator", "abstract_declarator_noarray", "declarator",
  "direct_declarator_nofunction", "declarator_function",
  "direct_declarator_function_start", "direct_declarator_function",
  "direct_declarator", "declarator_nofunction", "type_qualifier_list",
  "pointer", "parameter_type_list", "parameter_list",
  "parameter_declaration", "identifier_list", "type_name",
  "guess_type_name", "initializer", "initializer_condition",
  "initializer_list", "statement", "labeled_statement", "declaration_list",
  "statement_list", "compound_inside", "compound_start",
  "compound_statement", "expression_statement", "selection_statement",
  "iteration_statement", "jump_statement", "string_literal",
  "instantiation_named", "guess_instantiation_named",
  "instantiation_unnamed", "instantiation_anon",
  "class_function_definition", "instance_class_function_definition_start",
  "instance_class_function_definition", "data_member_initialization",
  "data_member_initialization_list",
  "data_member_initialization_list_coloned",
  "members_initialization_list_coloned", "members_initialization_list",
  "type_unit", YY_NULL
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,   336,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
     365,   366,   367,   368,   369,   370,   371,   372,   373,   374,
     375,   376,   377,    42,    60,    62,    40,    41,   126,    36,
      46,    91,    93,    44,    38,    43,    45,    33,    47,    37,
      94,   124,    63,    58,    61,    59,   123,   125
};
# endif

#define YYPACT_NINF -732

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-732)))

#define YYTABLE_NINF -506

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
    8807,  -732,  -732,  -732,  -732,  -732,  -732,  -732,  -732,  -732,
    -732,  -732,  -732,  -732,  -732,  -732,  -732,  -732,  -732,  -732,
    -732,  -732,  -732,  -732,  -732,  -732,    33,  -732,  -732,  -732,
    -732,  -732,  -732,  -732,  -732,   -76,   -34,  -732,  -732,  -732,
    -732,  -732,  -732,  -732,  -732,   -11,  -732,   121,  7288,  -732,
    -732,  -732,    52,   199,  -732,  -732,  -732,  -732,  -732,  -732,
     275,  -732,  -732,    80,   208,   263,   171,   218,  7016,    83,
    6283,  -732,  -732,  -732,  -732,  1139,  2255,  6703,  1009,  -732,
     222,  -732,    43,  -732,  -732,  -732,  -732,   333,  -732,   421,
     384,  8218,  -732,  -732,   804,   249,  -732,  3684,   -94,  -732,
     238,    65,  7016,  -732,   -27,    -1,  -732,   263,   263,  -732,
    -732,  -732,  7095,  7153,  7153,  8898,  7016,  -732,  8898,  7016,
    7174,  -732,  -732,  6420,  -732,   383,  -732,  -732,  -732,  -732,
     255,    61,  -732,  -732,   678,  -732,   867,  7016,  -732,   153,
       2,   363,  7016,   242,   385,   311,   308,   286,   451,    12,
    -732,   347,  -732,  -732,   357,    37,   255,    29,  -732,   363,
    6159,   364,  -732,  -732,  -732,    17,  -732,  1139,  -732,  -732,
     706,   379,   736,   393,   398,  -732,  -732,   106,  -732,   409,
    1009,  -732,    95,   421,  1072,   333,   384,  -732,   804,  8318,
    6738,  -732,  -732,  6786,  -732,   346,   426,   187,    51,   333,
    -732,   491,  8989,  8518,  6645,  8898,  -732,  -732,   415,   415,
     415,   310,    48,   631,  5923,    95,  3813,  -732,   -50,  -732,
    -732,   384,  -732,  -732,  1072,   410,   419,  -732,  5515,  3942,
    4071,   425,   430,  -732,  7016,   300,  -732,   263,  -732,   150,
     154,  6420,  -732,  6875,  -732,  -732,   222,  7499,  9080,  7603,
    9080,  6420,  -732,  -732,  -732,   304,  8014,  -732,  -732,  -732,
    -732,   453,   456,  2812,  2959,   263,  -732,  -732,  2093,   263,
    7016,  -732,  -732,  -732,  -732,  -732,  -732,  -732,  -732,  -732,
    -732,  -732,  -732,  5320,  -732,  7016,  7016,  7016,  7016,  7016,
    7016,  7016,   363,  7016,  7016,  -732,  7016,  7016,  7016,  7016,
    7016,  7016,  7016,  7016,  7016,  -732,  -732,  -732,  6283,  7395,
     267,   446,   408,  6283,  -732,  -732,  6283,  -732,  -732,  -732,
    -732,  -732,  8716,  -732,  -732,  1072,   333,  -732,  -732,   465,
    -732,   136,   470,  -732,   158,   472,  -732,  -732,   263,  -732,
    -732,  -732,  -732,  -732,   479,   482,  -732,   293,  -732,  -732,
    -732,  -732,  -732,  -732,  -732,  -732,  -732,  -732,  -732,  -732,
    -732,  -732,    83,  -732,  -732,   483,   485,  -732,  -732,  -732,
     489,  5804,  -732,  -732,  -732,  -732,   619,  -732,  8518,  -732,
    1139,  6557,   405,  8617,   468,  5232,  -732,  -732,  -732,  -732,
    -732,  5320,   956,  7016,  -732,    63,    95,   -45,  -732,   384,
    -732,   194,  1072,  -732,    51,  -732,  -732,   873,  -732,    51,
    -732,  -732,  -732,  4200,  -732,  4329,  -732,  4458,  5515,  4587,
    -732,  7016,  -732,  5515,  -732,  5515,  -732,  -732,    48,  8014,
    -732,  -732,  -732,  -732,   492,  8118,  7016,    13,   490,   493,
     494,   499,  7811,  -732,  -732,  -732,  -732,  -732,  7016,   495,
    7915,   498,  -732,  7016,   263,  -732,  -732,  -732,  -732,  -732,
    7016,   383,  -732,  3106,  -732,   646,  -732,  -732,  8518,  -732,
    -732,  -732,  -732,  -732,  -732,  -732,   415,  -732,  -732,   179,
    -732,  3253,   480,  -732,   484,  -732,  -732,  -732,   307,  -732,
    -732,   417,  -732,  -732,  -732,  -732,  -732,   153,   153,     2,
       2,   363,   363,   363,   242,   242,   385,   311,   308,   286,
     451,   -23,  7707,  -732,  -732,   408,  -732,  -732,  -732,  -732,
    -732,  -732,  -732,  -732,  -732,  -732,  -732,  -732,  7016,   501,
     429,  -732,  -732,  -732,  7016,    83,  6283,   -14,   118,  -732,
    -732,  -732,    71,  -732,    83,  -732,    95,   505,  -732,  7016,
     502,   509,   510,   516,  2128,   520,   263,   503,   507,  5686,
     263,  -732,    93,   190,  -732,  6041,  -732,  -732,  2371,  2518,
     511,  -732,  -732,  -732,  -732,  -732,   512,  -732,  -732,  -732,
    3400,   384,    51,   518,  -732,  7016,  -732,    51,   384,  -732,
    -732,  -732,  -732,  -732,  -732,  4716,  -732,  4845,  -732,  4974,
    5103,  -732,  -732,  -732,  -732,  -732,  -732,  -732,  -732,   523,
     529,   528,   490,   494,  8418,  7016,   490,  6283,  7016,   543,
    -732,  -732,  -732,  -732,  -732,   540,   544,  7016,  7016,   541,
    -732,  -732,  -732,  -732,  -732,   531,  5320,   263,  -732,  -732,
    -732,  -732,  -732,  -732,  -732,  -732,  5320,  -732,  -732,  -732,
     179,  -732,  -732,  -732,  -732,  5320,  -732,  7016,  -732,   319,
    -732,  -732,   548,   552,    41,   137,   415,   415,  -732,  6283,
     -12,     1,   536,  -732,  -732,  -732,   547,  2128,  7016,  7016,
    6923,   625,  5603,   539,  -732,  -732,  -732,   244,   549,  2128,
    -732,  -732,    76,   246,  -732,   852,  -732,  2665,  -732,  -732,
    -732,  -732,  -732,   551,   384,    95,  -732,   560,  1072,   553,
     384,  -732,  -732,  -732,  -732,  -732,  -732,  -732,   490,  -732,
     573,   570,   182,   574,  6283,  7016,  -732,   580,   581,  7016,
    -732,  -732,  -732,  -732,  -732,  -732,  -732,  -732,  -732,  -732,
    -732,   -33,   -28,   289,   415,   415,  -732,   415,   415,  -732,
     214,  2128,  -732,   320,   345,  2128,   360,   588,  2128,  5646,
    -732,  -732,  7016,  -732,  3547,  1009,  -732,  5378,  -732,   560,
      51,    51,   560,  7016,  -732,  -732,  -732,  -732,   305,   585,
    -732,  -732,   589,   415,  -732,   415,  -732,  -732,   -26,    -7,
     -22,    -3,   415,   415,  -732,  -732,  2128,  2128,  -732,  2128,
    7016,  -732,  2128,  6958,   577,  -732,   578,  -732,  5378,  -732,
    -732,   560,   560,  -732,  -732,  -732,  -732,   586,   587,   415,
    -732,   415,  -732,   415,  -732,   415,  -732,    85,    11,   661,
    -732,  -732,   362,  -732,  2128,   396,  -732,  -732,  -732,   197,
    -732,  -732,   591,   593,   595,   600,   415,  -732,   415,  -732,
    2128,   583,  -732,  2128,  1931,  -732,  -732,  -732,  -732,  -732,
     602,   603,  -732,  -732,  -732,  -732,  -732,  -732,  -732
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    17,     7,   191,   192,   193,   194,   195,   223,   224,
     225,   226,   227,   228,   229,   231,   234,   235,   232,   233,
     219,   220,   222,   230,   299,   300,     0,   424,   245,   197,
     198,   201,   246,   247,   236,     0,     0,   202,   203,   238,
     237,   196,   155,   162,   241,     8,     5,     0,   161,   423,
     149,   218,     0,   200,   199,   221,   151,   153,   157,   239,
       0,   240,   159,   508,     0,     0,   342,   341,     0,     0,
       0,     4,     2,     3,     6,   411,     0,     0,   421,   156,
     386,   150,   218,   152,   154,   158,   160,   371,   420,   419,
     401,     0,   400,   382,   370,     0,   205,     0,     8,   283,
     282,     0,     0,     1,   350,     0,   348,     0,     0,    36,
      22,   475,     0,     0,     0,     0,     0,    66,     0,     0,
       0,    23,    61,     0,    64,     0,    60,    62,    63,    65,
       0,    20,    37,    18,    59,    58,    67,     0,    69,    73,
      76,    80,     0,    85,    88,    90,    92,    94,    96,    98,
     100,     0,    24,    21,     0,     0,   241,    20,    67,   290,
     288,     0,   292,   291,   297,     0,   409,   412,   413,   361,
       0,     0,     0,     0,   415,   417,   355,     0,   116,     0,
       0,   386,     0,   422,     0,   374,   403,   402,   373,     0,
       0,   385,   396,     0,   399,     0,     0,     0,     0,   372,
     383,     0,     0,     0,     0,     0,   333,   275,     0,     0,
       0,     0,    20,     0,     0,   218,     0,   304,     0,   332,
     301,     0,    12,   391,     0,     0,    21,   330,     0,     0,
       0,   285,   284,   509,     0,   352,   204,     0,   343,     0,
       0,     0,    54,     0,    51,    52,     0,     0,     0,     0,
       0,     0,    56,    27,   114,     0,   427,   121,   123,   127,
     125,     0,    25,     0,     0,     0,    44,    45,     0,     0,
       0,    42,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   103,     0,    53,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   242,   243,   244,     0,     0,
     218,   289,   370,     0,    10,     9,     0,   410,   414,   354,
     387,   362,     0,   357,   356,     0,   375,   384,   363,     0,
     358,     0,     0,   389,     0,     0,   397,   398,     0,   206,
     207,   210,   209,   208,     0,   211,   213,     0,   249,   250,
     251,   252,   253,   254,   255,   257,   260,   261,   258,   259,
     248,   256,     0,   271,   262,     0,     0,   264,   263,   267,
     169,     0,   163,   165,   167,   265,     0,   266,     0,    16,
      61,     0,    20,     0,   455,     0,   486,   489,   490,   488,
     487,     0,     0,     0,   327,   386,   218,     0,   334,   404,
      11,   336,     0,   393,     0,   273,   302,     0,   331,     0,
     392,   329,   328,     0,   274,     0,   280,     0,     0,     0,
     351,     0,   349,     0,   347,     0,   344,   133,    20,   429,
     129,   131,   137,   135,     0,     0,     0,   218,   377,     0,
     376,   183,     0,   173,   175,   177,   179,   181,     0,     0,
       0,     0,    19,     0,     0,   122,   124,   128,   126,   428,
       0,     0,   503,     0,   481,    59,   435,   434,     0,   139,
     141,   143,   147,   145,   495,    46,     0,   500,   496,   506,
     499,     0,     0,   483,     0,    43,    39,    48,     0,    47,
      41,     0,   102,   101,    70,    71,    72,    74,    75,    77,
      78,    83,    84,    82,    86,    87,    89,    91,    93,    95,
      97,     0,   288,   294,   293,   373,   296,   295,   298,   416,
     418,   364,   360,   359,   390,   388,   426,   217,     0,     0,
       0,   214,   342,   341,     0,     0,     0,     0,   170,   164,
     166,   168,     0,   282,     0,    15,   218,     0,   456,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   458,    20,     0,   447,     0,   449,   438,     0,     0,
       0,   439,   440,   441,   442,   443,     0,   303,    13,   338,
       0,   406,     0,     0,   326,     0,   337,     0,   405,   394,
     305,   395,   276,   272,   278,     0,   279,     0,   353,     0,
       0,   134,   130,   132,   138,   136,   430,    55,   366,     0,
       0,     0,   380,   379,     0,     0,   378,     0,     0,   184,
     174,   176,   178,   180,   182,     0,     0,     0,     0,     0,
      57,   115,    68,    26,   485,     0,     0,   386,   140,   142,
     144,   148,   146,   491,   492,   493,     0,   498,   504,   502,
     507,   501,   480,   482,    40,     0,    38,     0,   289,     0,
     216,   215,     0,     0,     0,     0,     0,     0,   320,     0,
       0,     0,     0,   285,   284,    14,     0,     0,     0,     0,
       0,     0,     0,     0,   471,   472,   473,     0,     0,     0,
     459,   117,   386,     0,   187,   189,   448,     0,   451,   450,
     457,   119,   479,     0,   407,     0,   335,   404,     0,   339,
     408,   281,   277,   346,   345,   365,   367,    29,   381,   368,
       0,     0,     0,     0,     0,     0,    31,     0,     0,     0,
     484,   494,   497,    50,    49,    99,   212,   268,   269,   270,
     171,     0,     0,     0,     0,     0,   310,     0,     0,   325,
       0,     0,   446,     0,     0,     0,     0,     0,     0,     0,
     470,   474,     0,   444,     0,     0,   118,     0,   478,   406,
       0,     0,   405,     0,   369,    28,   185,    33,     0,     0,
      30,    35,     0,     0,   318,     0,   319,   172,     0,     0,
       0,     0,     0,     0,   315,   445,     0,     0,   467,     0,
       0,   469,     0,     0,     0,   477,     0,   188,     0,   431,
     190,   407,   408,   340,   186,    32,    34,     0,     0,     0,
     308,     0,   309,     0,   323,     0,   324,     0,     0,   460,
     462,   463,     0,   468,     0,     0,   120,   476,   436,     0,
     316,   317,     0,     0,     0,     0,     0,   313,     0,   314,
       0,     0,   465,     0,     0,   432,   306,   307,   321,   322,
       0,     0,   461,   464,   466,   433,   437,   311,   312
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -732,   192,  -732,   744,   672,   201,  -732,  -732,  -732,  -732,
       0,  -732,  -732,   690,  -258,  -732,  -732,   220,  -732,  -124,
     270,   283,   -36,  -732,   281,   436,   452,   435,   454,   450,
    -732,  1625,   -48,  -732,   287,  1301,  -369,  -732,  -732,  -378,
     407,  -732,  -732,   513,  -732,    -6,  1395,  1017,  -732,   663,
    -732,  -330,  -732,   -42,  -732,  1223,  1570,  -179,  1255,  -175,
    -732,   232,   239,   457,  -518,  -190,  -125,   361,  -732,  -732,
     -86,  -732,   186,  -161,  1300,   481,   546,   -79,  -416,   -13,
    -216,   -47,   278,  -195,  -732,   -39,   -72,   312,  -732,  1117,
     -87,  -732,     6,  -732,  -732,   527,  -731,  -377,  -732,   341,
    -732,  -732,   216,  -732,  -732,   -82,  -592,  -732,  -732,  -732,
    -120,  -732,  -732,   811,  -732,  -732,  -732,   313,   139,   314,
     317,  -732,  -262,  -732
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    42,    43,   130,    45,    46,   208,   209,   210,   211,
     131,   132,   133,   134,   466,   488,   135,   158,   137,   138,
     139,   140,   141,   142,   143,   144,   145,   146,   147,   148,
     149,   150,   254,   283,   563,   179,   698,   256,   429,   468,
     214,    49,   371,   442,   693,   694,    50,    51,    52,    53,
     345,   346,   347,    54,    55,    56,    57,   445,    58,    59,
     161,   162,   163,   164,   165,    60,   216,   217,   218,   219,
     220,   397,   398,    61,    62,   105,   106,    87,   438,   171,
     439,   172,   221,   222,    91,   223,    93,   401,   167,   224,
     173,   174,   175,   197,   261,   434,   810,   474,   839,   566,
     567,   568,   569,   570,   385,   571,   572,   573,   574,   575,
     152,   576,   225,   153,   475,   227,   476,   477,   478,   479,
     480,   481,   482,    64
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      47,    89,   484,   185,   196,   262,    63,   565,   379,    92,
     487,    96,   376,   284,   577,   199,   564,   531,   665,   400,
     151,   612,   200,   374,   616,   492,    67,   375,   314,   303,
      70,   183,     1,   449,   159,    88,     1,    92,   783,    92,
       1,   377,   785,   187,     1,   819,     1,    74,    80,   823,
      68,     1,   228,    31,     1,    92,   666,   667,   744,   745,
     100,     2,   236,   821,     1,   104,     1,   825,     1,   155,
     157,   747,   748,   375,     1,   375,   170,   838,   181,     1,
      74,   848,   181,   407,    37,    38,     1,   377,   583,   377,
     759,   195,    69,     2,   181,   408,     1,   212,     1,   722,
     584,   232,   329,   413,   415,   417,   292,   104,   104,   326,
     453,     2,   200,    70,   784,   246,   327,   234,   246,   786,
     657,   820,    71,   866,     1,   824,   386,   387,   388,   390,
     406,    74,   237,   668,   271,   746,    75,   288,   289,   435,
     822,    92,   315,   187,   826,    92,   238,   311,   749,    92,
     316,   743,    72,    73,   304,    74,   846,    74,   849,   187,
     246,   494,   495,   496,   307,    92,    75,   803,   739,    76,
      74,    72,    73,   308,    77,   264,   403,   180,    95,    65,
     181,   376,   181,   545,   181,   410,    72,    73,   181,    47,
     565,   565,   541,    96,   264,    74,   375,   718,   181,   696,
     661,   635,   370,    80,   382,   246,   778,   264,   103,   580,
     377,   230,    74,   271,   395,   181,   212,   671,    75,   609,
     489,   180,   764,   102,   181,     1,   625,    66,   212,   212,
     212,   185,   847,   199,   629,   493,   689,   104,   323,   264,
      79,   428,   669,   459,    72,    73,    74,   246,   441,   246,
     441,   428,   263,   327,   293,   294,   454,   501,   502,   731,
     503,    99,   740,   622,   670,   485,     1,   375,   522,   490,
     316,   622,   159,   643,    31,   375,   285,   159,     1,    31,
     159,   377,   263,   237,   792,   793,    92,   237,   136,   377,
     524,   286,   287,   595,   597,   423,   339,   424,   599,   425,
     600,   426,   231,     2,   263,    37,    38,   776,   428,    47,
      37,    38,   646,   428,   337,   316,   157,   107,   703,   565,
     338,   340,    47,   453,   647,   181,    90,   406,   520,   406,
     854,   406,   242,   244,   245,   690,   632,   585,   526,   341,
     252,   633,    92,   136,   855,    72,    73,    71,   610,     1,
      29,    30,    79,    92,    90,    31,    90,   403,   542,   586,
     186,   794,   533,   410,   108,   589,   295,   296,   342,   343,
     591,   538,    90,   290,   291,   201,   543,   453,    80,   765,
      31,   382,    74,   246,   229,   562,    37,    38,   111,   761,
      75,   766,   181,   309,   645,    74,   181,   733,    77,   297,
     298,   263,   181,   369,   181,   631,    79,    48,     1,   181,
     255,    37,    38,   212,   787,   212,   606,   212,   212,   212,
     529,    97,   316,   212,   136,   212,   530,   301,    74,   246,
     814,   452,   339,   427,   654,    47,   326,   453,   316,    79,
     655,    79,   619,   427,   421,   299,   736,   796,   300,   369,
     619,   369,   453,   453,    74,   389,   384,   340,    90,   189,
     186,   136,    90,   136,   190,   271,    90,   302,   637,    72,
      73,   136,   797,  -425,   305,   341,   186,   160,   453,  -425,
    -386,  -386,    90,    48,   306,  -386,   662,   799,   136,   851,
     136,   255,   399,   453,   339,   453,    29,    30,    48,   658,
     159,    31,   806,   136,   342,   343,   319,   187,   313,   406,
     192,   406,   246,   406,   406,   193,  -386,  -386,   695,   340,
     321,     1,   247,   853,   136,   249,    92,   720,   255,   453,
     255,   322,    37,    38,   309,   664,   157,   341,   255,    77,
     513,   324,   672,   589,   674,   516,   181,   514,   591,   656,
     453,   264,   517,   336,   562,   411,   683,   491,   497,   498,
     688,   384,    74,   532,   412,   692,   342,   343,   562,   562,
      79,   418,   369,   499,   500,    79,   419,    99,   504,   505,
     460,   159,   181,   181,   741,   742,   461,   181,   239,   240,
    -287,   511,   521,    29,    30,   212,    48,   212,    31,   212,
     212,   136,   523,    90,   525,   136,   527,   734,   528,   534,
     378,   535,   383,   536,    47,   548,   614,   157,   344,   607,
     435,   601,     1,   617,   615,   630,   627,   652,   660,    37,
      38,   653,   675,   159,     1,   678,   679,    74,   265,   266,
     267,    75,   680,   369,   180,   677,   682,     2,   684,     1,
     715,   369,   685,   265,   266,   267,   716,   701,   700,    90,
     717,   393,   788,   789,    74,   790,   791,   724,   255,   157,
      90,   725,   729,   136,   581,   737,   726,   562,   730,   738,
     588,     1,   750,   757,   760,   265,   266,   267,   159,   562,
     751,   193,    74,   762,    29,    30,   773,   562,   768,    31,
     774,   817,   775,   818,    79,   181,   777,    71,   181,     1,
     827,   828,   780,   781,   800,   512,    48,   815,   695,   809,
     512,   816,   836,   160,   157,   837,    92,   850,   863,    48,
      37,    38,    98,   840,   841,   506,   508,   842,   856,   843,
     857,   844,   858,   845,    44,   673,   399,   859,   136,   867,
     868,   562,   507,   510,   136,   562,   509,   268,   562,   807,
     809,   269,   270,   450,   860,   181,   861,   235,   590,   706,
     181,   181,   268,   518,   136,   391,   269,   270,   451,   136,
     644,  -386,  -386,   422,   697,   732,  -386,   213,   136,   136,
     636,     0,    44,     0,   649,   650,   562,   562,   651,   562,
       0,     0,   562,     0,   268,     0,   809,     1,   269,   270,
       0,    29,    30,   154,   156,   659,    31,  -386,  -386,     0,
      44,   177,     0,     0,   186,     0,     0,     0,     0,    72,
      73,     0,  -386,  -386,   562,    44,     0,  -386,     0,     0,
       0,   156,    48,    90,     0,     0,   687,    37,    38,     0,
     562,     0,     0,   562,     0,     0,     0,     0,     0,    44,
     704,   707,    44,   320,     0,   710,     0,   156,     0,     0,
       0,     0,     0,     0,   109,   136,     1,   110,   111,    29,
      30,     0,     0,     0,    31,   272,   273,   274,   275,   276,
     277,   278,   279,   280,   281,   681,     0,   136,   136,   136,
     136,     2,   136,     0,    44,     0,   213,     0,   226,   136,
     699,     0,     0,     0,     0,    37,    38,   136,   213,   213,
     213,     0,     0,     0,     0,     0,     0,    29,    30,     0,
      76,     0,    31,    44,   331,    77,     0,   334,     0,     0,
       0,     0,     0,   160,     0,   115,   116,    44,     0,    44,
       0,     0,     0,   465,   465,     0,     0,     0,    44,     1,
     156,     0,     0,    37,    38,   753,   754,   756,     0,     0,
       0,   136,   156,   156,   156,   136,   118,   119,   136,   136,
       0,     0,     0,   769,     0,   156,   772,   136,     0,     0,
       0,    44,   121,    44,     0,   156,   767,     0,     0,   243,
      44,     0,   125,     0,     0,     0,     0,   156,   156,     0,
       0,   282,     1,     0,     0,     0,   136,   136,   752,   136,
     136,    48,   136,   136,   160,     0,     0,   226,   136,     0,
     763,    29,    30,     0,     0,     0,    31,     0,   699,   226,
     226,   226,     0,    90,     0,     0,     0,     0,   811,   812,
       0,     0,   156,    44,   136,     0,     0,   156,     0,     0,
     156,     0,     0,     0,     0,    82,    44,    37,    38,     0,
     136,     0,     0,   136,   136,     1,   160,   101,     0,    75,
       0,     0,   180,   578,    29,    30,     0,   832,     0,    31,
     835,     0,   795,    82,     0,   182,   798,   213,     0,   801,
       0,     0,     0,   213,     0,   213,   191,   213,   213,   213,
       0,   198,     0,   213,   215,   213,     0,     0,     0,     0,
      37,    38,    44,     0,     0,   156,     0,    44,     0,   156,
       0,   160,    75,     0,     0,   180,     0,   829,   830,     0,
     831,     0,     0,   833,     0,     0,     0,    29,    30,     0,
       0,     0,    31,   465,     0,     0,     0,   156,     0,   156,
       0,   156,   156,   156,     0,    94,     0,   156,     0,   156,
       0,   465,     0,    44,     0,   852,     0,   310,     0,    44,
       0,     0,     0,    37,    38,    20,    21,     0,     0,   191,
       0,   862,   168,    94,   864,   184,     0,   182,   180,   188,
     191,   198,     0,     0,     0,   198,     0,   156,     0,     0,
       0,     0,    44,     0,    29,    30,     0,     0,     0,    31,
     215,   182,     0,     0,   226,   156,   226,     0,   226,   226,
     226,   396,     0,   215,   226,     0,   226,     0,     0,     0,
       0,   409,     0,     0,     0,   215,   215,   215,     0,     0,
      37,    38,     0,     0,     0,     0,    44,     0,     0,     0,
       0,     0,    75,     0,   437,     0,   437,     0,     0,     0,
     465,    83,     0,   310,     0,     0,     0,   312,     0,   663,
     156,     0,     0,     0,   318,   213,     0,   213,     0,   213,
     213,     0,     0,     0,     0,     0,     0,   184,   166,   325,
       0,     0,     0,    85,     0,     0,     0,     0,     0,    44,
       0,     0,   156,   156,     0,     0,     0,     0,     0,     0,
       0,   184,     0,     0,   156,     0,   310,     0,     0,     0,
       0,   402,   404,     0,     0,     0,   465,     0,     0,   156,
       0,   156,   198,   156,   156,     0,   257,     0,    86,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    44,     0,
       0,   156,     0,     0,   440,     0,   440,     0,     0,     0,
       0,     0,     0,   312,     0,     0,     0,     0,   259,     0,
       0,     0,     0,    83,     0,     0,     0,     0,   310,     0,
     317,     0,     0,   544,     0,   215,     0,     0,   546,     0,
       0,     0,     0,   233,     0,     0,   226,     0,   226,   182,
     226,   226,     0,   156,     0,    85,     0,   248,     0,   587,
     250,     0,     0,   260,     0,   373,   312,   515,     0,     0,
     215,     0,   215,     0,   215,   215,   215,    83,     0,     0,
     215,   156,   215,    81,     0,     0,   310,     0,     0,     0,
       0,     0,   437,     0,   465,     0,     0,     0,     0,   437,
      86,     0,     0,     0,   430,     0,     0,   437,   156,    85,
      83,   444,    83,   444,   430,     0,     0,     0,     0,   455,
       0,     0,     0,     0,     0,   396,   470,   470,   312,     0,
       0,   332,     0,     0,   335,     0,   432,   168,   184,     0,
       0,     0,    85,   446,    85,   446,   432,     0,   156,   184,
       0,   457,     0,   582,    86,     0,     0,     0,   472,   472,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   310,
       0,     0,     0,     0,     0,   420,     0,     0,     0,     0,
       0,   433,     0,     0,     0,     0,   312,    86,   447,    86,
     447,   433,   440,     0,   613,    81,   458,     0,     0,   440,
       0,     0,     0,   473,   473,     0,     0,   440,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   546,     0,     0,   402,     0,     0,     0,     0,
       0,     0,     0,     0,   540,     0,     0,   372,     0,     0,
     705,    83,     0,   166,   257,     0,    83,     0,   470,    81,
       0,     0,   215,     0,   215,     0,   215,   215,    84,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   312,
       0,     0,     0,    85,     0,     0,   259,     0,    85,     0,
     472,     0,    81,   443,    81,   443,     0,     0,     0,     0,
       0,     0,   602,     0,     0,     0,     0,     0,   469,   469,
       0,     0,     0,   325,     0,   621,     0,     0,     0,     0,
       0,     0,     0,   621,     0,     0,     0,     0,    86,     0,
       0,   260,   184,    86,   604,   473,   470,     0,     0,     0,
       0,   639,     0,   258,   579,     0,     0,   623,     0,     0,
     708,     0,   178,     0,   470,   623,     0,     0,     0,     0,
       0,     0,   191,     0,     0,     0,     0,     0,   472,     0,
       0,     0,   598,   641,     0,   771,     0,   178,     0,   605,
      84,     0,     0,     0,     0,    83,   472,   611,     0,     0,
       0,   178,   624,     0,   178,     0,     0,     0,     0,   626,
     624,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   473,     0,     0,   539,    85,   642,     0,
       0,     0,     0,    81,     0,     0,     0,     0,    81,     0,
     469,   473,   182,     0,    84,     0,     0,     0,   639,     0,
       0,   470,   470,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   470,     0,     0,     0,     0,     0,     0,
       0,   431,    86,     0,     0,   178,     0,    84,   178,    84,
     641,   431,   770,   472,   472,     0,   456,     0,     0,     0,
       0,     0,     0,   471,   471,   472,     0,   620,     0,     0,
       0,     0,     0,     0,     0,   620,     0,     0,     0,     0,
     676,     0,     0,     0,     0,     0,     0,     0,   469,   178,
       0,     0,     0,   638,     0,   642,     0,     0,   473,   473,
       0,     0,     0,     0,     0,     0,   469,     0,     0,     0,
     473,     0,   184,     0,     0,     0,   709,     0,   467,   467,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,     0,
       0,     0,     0,     0,     0,     0,   721,     0,     0,   723,
     470,     0,     0,     0,     0,     0,     0,     0,   727,   728,
       0,     0,   109,     0,     1,   110,   111,   112,     0,   113,
     114,     0,     0,     0,     0,     0,     0,     0,    84,     0,
       0,   258,   472,    84,     0,   471,     0,     0,     0,     2,
     638,     0,     0,   469,   469,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   469,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   470,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   473,     0,   603,
       0,     0,     0,   115,   116,   117,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   467,     0,   178,   472,
       0,     0,     0,     0,     0,     0,   779,     0,     0,     0,
     782,     0,     0,   471,   118,   119,     0,     0,   640,     0,
       0,   120,     0,     0,     0,     0,   178,     0,     0,     0,
     121,   471,     0,     0,   122,     0,     0,   123,     0,   124,
     125,   178,     0,   804,   473,   126,   127,   128,   129,     0,
       0,     0,     0,   178,   813,     0,     0,   808,   865,     0,
       0,     0,    84,     0,     0,     0,     0,     0,   467,     0,
       0,     0,   469,     0,   109,     0,     1,   110,   111,   112,
       0,   113,   114,     0,     0,     0,   467,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     0,     0,     0,     0,     0,     0,     0,   109,
       0,     1,   110,   111,   112,   640,   113,   114,   471,   471,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     471,     0,     0,     0,     0,     0,     2,     0,     0,   469,
       0,     0,     0,     0,     0,   115,   116,   117,     0,     0,
       0,     0,     0,     0,   178,     0,     0,     0,     0,     0,
       0,     0,   549,   550,   551,   552,   553,   554,   555,   556,
     557,   558,   559,     0,     0,     0,   118,   119,     0,     0,
     115,   116,   117,   120,     0,   467,     0,     0,     0,     0,
     178,     0,   121,     0,     0,     0,   122,     0,     0,   123,
     486,   124,   125,     0,     0,     0,     0,   126,   127,   128,
     129,   118,   119,     0,     0,     0,     0,     0,   120,   463,
     178,     0,     0,   178,     0,     0,     0,   121,     0,     0,
       0,   122,   178,   178,   123,     0,   124,   125,     1,     0,
       0,   467,   126,   127,   128,   129,     0,   471,     0,     0,
       0,   467,     0,   561,   384,     0,     0,     0,     0,     0,
       0,     0,   735,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,     0,     0,     0,
      29,    30,     0,     0,   471,    31,     0,     0,    32,    33,
       0,    34,     0,    35,     0,     0,     0,     0,     0,     0,
     178,     0,     0,     0,   178,     0,    36,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    37,    38,    39,    40,
       0,     0,   109,    41,     1,   110,   111,   112,    75,   113,
     114,    76,   169,     0,     0,     0,    77,   178,     0,   467,
       0,     0,     0,     0,     0,     0,     0,     0,   178,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,   549,   550,   551,   552,   553,
     554,   555,   556,   557,   558,   559,     0,     0,     0,    28,
       0,     0,     0,   115,   116,   117,    29,    30,     0,   560,
       0,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,   118,   119,     0,     0,     0,     0,
       0,   120,    37,    38,    39,    40,     0,     0,     0,    41,
     121,     0,     0,     0,   122,     0,     0,   123,     0,   124,
     125,     0,     0,     0,     0,   126,   127,   128,   129,     0,
       0,     0,     0,     0,     0,     0,   561,   384,  -453,   109,
       0,     1,   110,   111,   112,     0,   113,   114,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,     0,   549,   550,   551,   552,   553,   554,   555,   556,
     557,   558,   559,     0,     0,     0,    28,     0,     0,     0,
     115,   116,   117,    29,    30,     0,   560,     0,    31,     0,
       0,    32,    33,     0,    34,     0,    35,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    36,
       0,   118,   119,     0,     0,     0,     0,     0,   120,    37,
      38,    39,    40,     0,     0,     0,    41,   121,     0,     0,
       0,   122,     0,     0,   123,     0,   124,   125,     0,     0,
       0,     0,   126,   127,   128,   129,     0,     0,     0,     0,
       0,     0,     0,   561,   384,  -452,   109,     0,     1,   110,
     111,   112,     0,   113,   114,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,     0,   549,
     550,   551,   552,   553,   554,   555,   556,   557,   558,   559,
       0,     0,     0,    28,     0,     0,     0,   115,   116,   117,
      29,    30,     0,   560,     0,    31,     0,     0,    32,    33,
       0,    34,     0,    35,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    36,     0,   118,   119,
       0,     0,     0,     0,     0,   120,    37,    38,    39,    40,
       0,     0,     0,    41,   121,     0,     0,     0,   122,     0,
       0,   123,     0,   124,   125,     0,     0,     0,     0,   126,
     127,   128,   129,     0,     0,     0,     0,     0,     0,     0,
     561,   384,  -454,   109,     0,     1,   110,   111,   112,     0,
     113,   114,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      28,     0,     0,     0,   115,   116,   117,    29,    30,     0,
       0,     0,    31,     0,     0,    32,    33,     0,    34,     0,
      35,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    36,     0,   118,   119,     0,     0,     0,
       0,     0,   120,    37,    38,    39,    40,     0,     0,     0,
      41,   121,     0,     0,     0,   122,     0,     0,   123,     0,
     124,   125,     0,     0,     0,     0,   126,   127,   128,   129,
       0,     0,     0,     0,     0,     0,     0,   462,   463,   464,
     109,     0,     1,   110,   111,   112,     0,   113,   114,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    28,     0,     0,
       0,   115,   116,   117,    29,    30,     0,     0,     0,    31,
       0,     0,    32,    33,     0,    34,     0,    35,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      36,     0,   118,   119,     0,     0,     0,     0,     0,   120,
      37,    38,    39,    40,     0,     0,     0,    41,   121,     0,
       0,     0,   122,     0,     0,   123,     0,   124,   125,     0,
       0,     0,     0,   126,   127,   128,   129,     0,     0,     0,
       0,     0,     0,     0,   462,   463,   483,   109,     0,     1,
     110,   111,   112,     0,   113,   114,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    28,     0,     0,     0,   115,   116,
     117,    29,    30,     0,     0,     0,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,   118,
     119,     0,     0,     0,     0,     0,   120,    37,    38,    39,
      40,     0,     0,     0,    41,   121,     0,     0,     0,   122,
       0,     0,   123,     0,   124,   125,     0,     0,     0,     0,
     126,   127,   128,   129,     0,     0,     0,     0,     0,     0,
       0,   462,   463,   634,   109,     0,     1,   110,   111,   112,
       0,   113,   114,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    28,     0,     0,     0,   115,   116,   117,    29,    30,
       0,     0,     0,    31,     0,     0,    32,    33,     0,    34,
       0,    35,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    36,     0,   118,   119,     0,     0,
       0,     0,     0,   120,    37,    38,    39,    40,     0,     0,
       0,    41,   121,     0,     0,     0,   122,     0,     0,   123,
       0,   124,   125,     0,     0,     0,     0,   126,   127,   128,
     129,     0,     0,     0,     0,     0,     0,     0,   648,   463,
    -505,   109,     0,     1,   110,   111,   112,     0,   113,   114,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    28,     0,
       0,     0,   115,   116,   117,    29,    30,     0,     0,     0,
      31,     0,     0,    32,    33,     0,    34,     0,    35,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    36,     0,   118,   119,     0,     0,     0,     0,     0,
     120,    37,    38,    39,    40,     0,     0,     0,    41,   121,
       0,     0,     0,   122,     0,     0,   123,     0,   124,   125,
       0,     0,     0,     0,   126,   127,   128,   129,     0,     0,
       0,     0,     0,     0,     0,   462,   463,   702,   109,     0,
       1,   110,   111,   112,     0,   113,   114,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    28,     0,     0,     0,   115,
     116,   117,    29,    30,     0,     0,     0,    31,     0,     0,
      32,    33,     0,    34,     0,    35,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    36,     0,
     118,   119,     0,     0,     0,     0,     0,   120,    37,    38,
      39,    40,     0,     0,     0,    41,   121,     0,     0,     0,
     122,     0,     0,   123,     0,   124,   125,     0,     0,     0,
       0,   126,   127,   128,   129,   109,     0,     1,   110,   111,
       0,     0,   462,   463,   805,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    28,   202,     0,     0,   115,   116,     0,    29,
      30,     0,     0,   203,    31,     0,     0,    32,    33,     0,
      34,     0,    35,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    36,     0,   118,   119,     0,
       0,     0,     0,     0,     0,    37,    38,    39,    40,     0,
       0,     0,    41,   121,     0,     0,     0,    75,     0,     0,
     204,     0,   205,   125,   109,     0,     1,   110,   111,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   206,
       0,   207,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    28,   202,     0,     0,   115,   116,     0,    29,    30,
       0,     0,   203,    31,     0,     0,    32,    33,     0,    34,
       0,    35,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    36,     0,   118,   119,     0,     0,
       0,     0,     0,     0,    37,    38,    39,    40,     0,     0,
       0,    41,   121,     0,     0,     0,    75,     0,     0,   204,
       0,   205,   125,   109,     0,     1,   110,   111,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   206,     0,
     405,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      28,   202,     0,     0,   115,   116,     0,    29,    30,     0,
       0,   203,    31,     0,     0,    32,    33,     0,    34,     0,
      35,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    36,     0,   118,   119,     0,     0,     0,
       0,     0,     0,    37,    38,    39,    40,     0,     0,     0,
      41,   121,     0,     0,     0,    75,     0,     0,   204,     0,
     205,   125,   109,     0,     1,   110,   111,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   206,     0,   414,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    28,
     202,     0,     0,   115,   116,     0,    29,    30,     0,     0,
     203,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,   118,   119,     0,     0,     0,     0,
       0,     0,    37,    38,    39,    40,     0,     0,     0,    41,
     121,     0,     0,     0,    75,     0,     0,   204,     0,   205,
     125,   109,     0,     1,   110,   111,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   206,     0,   416,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    28,   202,
       0,     0,   115,   116,     0,    29,    30,     0,     0,   203,
      31,     0,     0,    32,    33,     0,    34,     0,    35,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    36,     0,   118,   119,     0,     0,     0,     0,     0,
       0,    37,    38,    39,    40,     0,     0,     0,    41,   121,
       0,     0,     0,    75,     0,     0,   204,     0,   205,   125,
     109,     0,     1,   110,   111,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   206,     0,   592,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    28,   202,     0,
       0,   115,   116,     0,    29,    30,     0,     0,   203,    31,
       0,     0,    32,    33,     0,    34,     0,    35,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      36,     0,   118,   119,     0,     0,     0,     0,     0,     0,
      37,    38,    39,    40,     0,     0,     0,    41,   121,     0,
       0,     0,    75,     0,     0,   204,     0,   205,   125,   109,
       0,     1,   110,   111,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   206,     0,   593,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    28,   202,     0,     0,
     115,   116,     0,    29,    30,     0,     0,   203,    31,     0,
       0,    32,    33,     0,    34,     0,    35,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    36,
       0,   118,   119,     0,     0,     0,     0,     0,     0,    37,
      38,    39,    40,     0,     0,     0,    41,   121,     0,     0,
       0,    75,     0,     0,   204,     0,   205,   125,   109,     0,
       1,   110,   111,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   206,     0,   594,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    28,   202,     0,     0,   115,
     116,     0,    29,    30,     0,     0,   203,    31,     0,     0,
      32,    33,     0,    34,     0,    35,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    36,     0,
     118,   119,     0,     0,     0,     0,     0,     0,    37,    38,
      39,    40,     0,     0,     0,    41,   121,     0,     0,     0,
      75,     0,     0,   204,     0,   205,   125,   109,     0,     1,
     110,   111,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   206,     0,   596,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    28,   202,     0,     0,   115,   116,
       0,    29,    30,     0,     0,   203,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    36,     0,   118,
     119,     0,     0,     0,     0,     0,     0,    37,    38,    39,
      40,     0,     0,     0,    41,   121,     0,     0,     0,    75,
       0,     0,   204,     0,   205,   125,   109,     0,     1,   110,
     111,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   206,     0,   711,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    28,   202,     0,     0,   115,   116,     0,
      29,    30,     0,     0,   203,    31,     0,     0,    32,    33,
       0,    34,     0,    35,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    36,     0,   118,   119,
       0,     0,     0,     0,     0,     0,    37,    38,    39,    40,
       0,     0,     0,    41,   121,     0,     0,     0,    75,     0,
       0,   204,     0,   205,   125,   109,     0,     1,   110,   111,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     206,     0,   712,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    28,   202,     0,     0,   115,   116,     0,    29,
      30,     0,     0,   203,    31,     0,     0,    32,    33,     0,
      34,     0,    35,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    36,     0,   118,   119,     0,
       0,     0,     0,     0,     0,    37,    38,    39,    40,     0,
       0,     0,    41,   121,     0,     0,     0,    75,     0,     0,
     204,     0,   205,   125,   109,     0,     1,   110,   111,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   206,
       0,   713,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    28,   202,     0,     0,   115,   116,     0,    29,    30,
       0,     0,   203,    31,     0,     0,    32,    33,     0,    34,
       0,    35,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    36,     0,   118,   119,     0,     0,
       0,     0,     0,     0,    37,    38,    39,    40,     0,     0,
       0,    41,   121,     0,     0,     0,    75,     0,     0,   204,
       0,   205,   125,   109,     0,     1,   110,   111,   112,     0,
     113,   114,     0,     0,     0,     0,     0,     0,   206,     0,
     714,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    25,    26,     0,   549,   550,   551,   552,
     553,   554,   555,   556,   557,   558,   559,     0,     0,     0,
      28,     0,     0,     0,   115,   116,   117,    29,    30,     0,
     560,     0,    31,     0,     0,    32,    33,     0,    34,     0,
      35,   109,     0,     1,   110,   111,   112,     0,   113,   114,
       0,     0,     0,    36,     0,   118,   119,     0,     0,     0,
       0,     0,   120,    37,    38,    39,    40,     0,     2,     0,
      41,   121,     0,     0,     0,   122,     0,     0,   123,     0,
     124,   125,     0,     0,     0,     0,   126,   127,   128,   129,
       0,     0,     0,     0,     0,     0,     0,   561,   384,   109,
       0,     1,   110,   111,   112,     0,   113,   114,     0,     0,
       0,     0,   115,   116,   117,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   118,   119,     0,     0,     0,     0,     0,
     120,     0,     0,     0,     0,     0,     0,     0,     0,   121,
       0,     0,     0,   122,     0,     0,   123,     0,   124,   125,
     115,   116,   117,     0,   126,   127,   128,   129,     0,     0,
       0,     0,     0,     0,     0,     0,   463,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   118,   119,     0,     0,     0,     0,     0,   120,     0,
       0,     0,     0,     0,     0,     0,     0,   121,     0,     0,
       0,   122,     0,     0,   123,     0,   124,   125,     0,     0,
       0,     0,   126,   127,   128,   129,   109,     0,     1,   110,
     111,     0,     0,     0,   808,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    28,   202,     0,     0,   115,   116,     0,
      29,    30,     0,     0,   203,    31,     0,     0,    32,    33,
       0,    34,     0,    35,   109,     0,     1,   110,   111,   112,
       0,   113,   114,     0,     0,     0,    36,     0,   118,   119,
       0,     0,     0,     0,     0,     0,    37,    38,    39,    40,
       0,     2,     0,    41,   121,     0,     0,     0,    75,     0,
       0,   204,     0,   205,   125,     0,     0,   109,     0,     1,
     110,   111,   112,     0,   113,   114,     0,     0,     0,     0,
     206,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,   115,   116,   117,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   109,     0,     1,
     110,   111,   112,     0,   113,   114,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   118,   119,     0,     0,
       0,     0,     0,   120,     2,     0,     0,     0,   115,   116,
     117,     0,   121,     0,     0,     0,   122,     0,     0,   123,
     758,   124,   125,     0,     0,     0,     0,   126,   127,   128,
     129,     0,     0,     0,     0,     0,     0,     0,   561,   118,
     119,     0,     0,     0,     0,     0,   120,     0,   115,   116,
     117,     0,     0,     0,     0,   121,     0,     0,     0,   122,
       0,     0,   123,   802,   124,   125,     0,     0,     0,     0,
     126,   127,   128,   129,     0,     0,     0,     0,     0,   118,
     119,   561,     0,     0,     0,     0,   120,     0,     0,     0,
       0,     0,     0,     0,     0,   121,     0,     1,     0,   122,
       0,     0,   123,     0,   124,   125,     0,     0,     0,     0,
     126,   127,   128,   129,     0,     0,     0,     0,     0,     0,
       0,   686,     2,     3,     4,     5,     6,     7,   348,   349,
     350,   351,   352,   353,   354,   355,   356,   357,   358,   359,
      20,    21,   360,   361,    24,    25,   362,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   363,     0,     0,     0,     0,     0,     0,    29,
      30,     0,     0,     0,    31,     0,     0,     0,     0,     0,
     364,     0,   365,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   366,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    37,    38,   367,   368,     0,
       0,     0,    41,     0,     0,     0,     1,    75,     0,     0,
     309,     0,     0,     0,     0,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     537,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    28,     0,     0,     0,     0,     0,     0,    29,    30,
       0,     0,     0,    31,     0,     0,    32,    33,     0,    34,
       0,    35,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    36,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    37,    38,    39,    40,     0,     0,
       0,    41,     0,     0,     1,     0,    75,     0,     0,   392,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   393,     0,   394,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    25,    26,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    28,
       0,     0,     0,     0,     0,     0,    29,    30,     0,     0,
       0,    31,     0,     0,    32,    33,     0,    34,     0,    35,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    36,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    37,    38,    39,    40,     0,     0,     0,    41,
       0,     0,     1,     0,    75,     0,     0,   180,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   691,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    28,     0,     0,
       0,     0,     0,     0,    29,    30,     0,     0,     0,    31,
       0,     0,    32,    33,     0,    34,     0,    35,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      36,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,    38,    39,    40,     0,     0,     0,    41,     0,     0,
       0,     0,    75,     0,   109,   309,     1,   110,   111,   112,
      77,   113,   114,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  -286,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    28,     0,     0,     0,   115,   116,   117,    29,    30,
       0,     0,     0,    31,     0,     0,    32,    33,     0,    34,
       0,    35,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    36,     0,   118,   119,     0,     0,
       0,     0,     0,   120,    37,    38,    39,    40,     0,     0,
       0,    41,   121,     0,     0,     0,   122,     0,     0,   123,
       0,   124,   125,     0,     0,     0,     0,   126,   127,   128,
     129,   109,     0,     1,   110,   111,   112,     0,   113,   114,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     0,
       0,     0,     0,     0,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    28,     0,
       0,     0,   115,   116,   117,    29,    30,     0,     0,     0,
      31,     0,     0,    32,    33,     0,    34,     0,    35,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    36,     0,   118,   119,     0,     0,     0,     0,     0,
     120,    37,    38,    39,    40,     0,     0,     0,     0,   121,
       0,     0,     0,   122,     0,     0,   123,   253,   124,   125,
       0,     0,     0,     0,   126,   127,   128,   129,   109,     0,
       1,   110,   111,   112,     0,   113,   114,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     0,     0,     0,     0,
       0,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    28,     0,     0,     0,   115,
     116,   117,    29,    30,     0,     0,     0,    31,     0,     0,
      32,    33,     0,    34,     0,    35,   109,     0,     1,   110,
     111,   112,     0,   113,   114,     0,     0,     0,    36,     0,
     118,   119,     0,     0,     0,     0,     0,   120,    37,    38,
      39,    40,     0,     2,     0,     0,   121,     0,     0,     0,
     380,     0,     0,   381,   253,   124,   125,     0,     0,     0,
       0,   126,   127,   128,   129,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   109,     0,     1,   110,   111,   112,
       0,   113,   114,     0,     0,     0,     0,   115,   116,   117,
      29,    30,     0,     0,     0,    31,     0,     0,     0,     0,
       0,     2,     0,     0,     0,     0,     0,     0,     0,   109,
       0,     1,   110,   111,   112,     0,   113,   114,   118,   119,
       0,     0,     0,     0,     0,   120,    37,    38,     0,     0,
       0,     0,     0,     0,   121,     0,     2,     0,   380,     0,
       0,   381,   253,   124,   125,   115,   116,   117,     0,   126,
     127,   128,   129,     0,     0,     0,     0,   109,     0,     1,
     110,   111,   112,     0,   113,   114,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   118,   119,     0,     0,
     115,   116,   117,   120,     2,     0,     0,     0,     0,     0,
       0,     0,   121,     0,     0,     0,   122,     0,     0,   123,
       0,   124,   125,     0,     0,   176,     0,   126,   127,   128,
     129,   118,   119,     0,     0,     0,     0,     0,   120,     0,
       0,     0,     0,     0,     0,     0,     0,   121,   115,   116,
     117,   122,     0,     0,   123,     0,   124,   125,     0,     0,
     330,     0,   126,   127,   128,   129,   109,     0,     1,   110,
     111,   112,     0,   113,   114,     0,     0,     0,     0,   118,
     119,     0,     0,     0,     0,     0,   120,     0,     0,     0,
       0,     0,     0,     2,     0,   121,     0,     0,     0,   122,
       0,     0,   123,     0,   124,   125,     0,     0,   333,     0,
     126,   127,   128,   129,   109,     0,     1,   110,   111,   112,
       0,   113,   114,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   115,   116,   117,
       0,     2,     0,     0,     0,     0,     0,     0,     0,   109,
       0,     1,   110,   111,   112,     0,   113,   114,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   118,   119,
       0,     0,     0,     0,     0,   120,     2,     0,     0,     0,
       0,     0,     0,     0,   121,   115,   116,   117,   122,     0,
       0,   123,   253,   124,   125,     0,     0,     0,     0,   126,
     127,   128,   129,     0,     0,     0,     0,   109,     0,     1,
     110,   111,   112,     0,   113,   114,   118,   119,     0,     0,
     115,   116,   117,   120,     0,     0,     0,     0,     0,     0,
       0,     0,   121,     0,     2,     0,   122,     0,     0,   123,
     755,   124,   125,     0,     0,     0,     0,   126,   127,   128,
     129,   118,   119,     0,     0,     0,     0,     0,   120,     0,
       0,     0,     0,     0,     0,     0,     0,   121,     0,     0,
       0,   122,     0,     0,   123,   834,   124,   125,   115,   116,
     117,     0,   126,   127,   128,   129,   109,     0,     1,   110,
     111,   112,     0,   113,   114,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   118,
     119,     0,     0,     2,     0,     0,   120,     0,     0,     0,
       0,     0,     0,     0,     0,   121,     0,     0,     0,   122,
       0,     0,   123,     0,   124,   125,     0,     0,     0,     0,
     126,   127,   128,   129,   109,     0,     1,   110,   111,   112,
       0,   113,   114,     0,     0,     0,     0,   115,   116,   117,
       0,     0,     0,     0,     0,   109,     0,     1,   110,   111,
     112,     2,   113,   114,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   118,   119,
       0,     0,     2,     0,     0,   120,     0,     0,     0,     0,
       0,     0,     0,     0,   121,     0,     0,     0,   122,     0,
       0,   241,     0,   124,   125,   115,   116,   117,     0,   126,
     127,   128,   129,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   115,   116,   117,     0,
       0,     0,     0,     0,     0,     0,   118,   119,     0,     0,
       0,     0,     0,   120,     0,     0,     0,     0,     0,     0,
       0,     0,   121,     0,     0,     0,   122,   118,   119,   243,
       0,   124,   125,     0,   120,     0,     0,   126,   127,   128,
     129,     1,     0,   121,     0,     0,     0,   122,     0,     0,
     251,     0,   124,   125,     0,     0,     0,     0,   126,   127,
     128,   129,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    28,     0,     0,     0,
       0,     0,     0,    29,    30,     0,     0,     0,    31,     0,
       0,    32,    33,     0,    34,     0,    35,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    36,
       0,     0,     0,     0,     0,     0,     0,     0,     1,    37,
      38,    39,    40,     0,     0,     0,    41,     0,     0,     0,
       0,    75,     0,     0,    76,     0,     0,     0,     0,    77,
       0,     0,    78,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,    26,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,     0,     0,     0,
      29,    30,     0,     0,     0,    31,     0,     0,    32,    33,
       0,    34,     0,    35,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    36,     0,     0,     0,
       0,     0,     1,     0,     0,     0,    37,    38,    39,    40,
       0,     0,     0,    41,     0,     0,     0,     0,    75,     0,
       0,   309,   169,     0,     0,     0,    77,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    28,     0,     0,
       0,     0,     0,     0,    29,    30,     0,     0,     0,    31,
       0,     0,    32,    33,     0,    34,     0,    35,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      36,     0,     0,     0,     0,     0,     1,     0,     0,     0,
      37,    38,    39,    40,     0,     0,     0,    41,     0,     0,
       0,     0,    75,     0,     0,   435,     0,     0,     0,     0,
     436,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    28,     0,     0,     0,     0,     0,     0,    29,    30,
       0,     0,     0,    31,     0,     0,    32,    33,     0,    34,
       0,    35,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    36,     0,     0,     0,     0,     0,
       1,     0,     0,     0,    37,    38,    39,    40,     0,     0,
       0,    41,     0,     0,     0,     0,    75,     0,     0,   435,
       0,     0,     0,     0,   448,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    28,     0,     0,     0,     0,
       0,     0,    29,    30,     0,     0,     0,    31,     0,     0,
      32,    33,     0,    34,     0,    35,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    36,     0,
       0,     0,     0,     0,     1,     0,     0,     0,    37,    38,
      39,    40,     0,     0,     0,    41,     0,     0,     0,     0,
      75,     0,     0,   309,     0,     0,     0,     0,    77,     2,
       3,     4,     5,     6,     7,   348,   349,   350,   351,   352,
     353,   354,   355,   356,   357,   358,   359,    20,    21,   360,
     361,    24,    25,    26,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   363,
       0,     0,     0,     0,     0,     0,    29,    30,     0,     0,
       0,    31,     0,     0,     0,     0,     0,   364,     0,   365,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   366,     0,     0,     0,     0,     0,     1,     0,
       0,     0,    37,    38,   367,   368,     0,     0,     0,    41,
       0,     0,     0,     0,    75,     0,     0,   435,     0,     0,
       0,     0,   618,     2,     3,     4,     5,     6,     7,   348,
     349,   350,   351,   352,   353,   354,   355,   356,   357,   358,
     359,    20,    21,   360,   361,    24,    25,    26,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   363,     0,     0,     0,     0,     0,     0,
      29,    30,     0,     0,     0,    31,     0,     0,     0,     0,
       0,   364,     0,   365,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   366,     1,     0,     0,
       0,     0,     0,     0,     0,     0,    37,    38,   367,   368,
       0,     0,     0,    41,     0,     0,     0,     0,    75,     0,
       0,   435,     2,     0,     0,     0,   628,     0,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    28,     0,     0,     0,     0,     0,     0,    29,
      30,     0,     0,     0,    31,     0,     0,    32,    33,     0,
      34,     0,    35,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    36,     0,     0,     0,     0,
       0,     1,     0,     0,     0,    37,    38,    39,    40,     0,
       0,     0,     0,     0,     0,     0,     0,    75,     0,     0,
     309,     0,     0,     0,     0,    77,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
       0,     0,     0,    29,    30,     0,     0,     0,    31,     0,
       0,    32,    33,     0,    34,     0,    35,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    36,
       0,     1,     0,     0,     0,     0,     0,     0,     0,    37,
      38,    39,    40,     0,     0,     0,    41,     0,     0,     0,
       0,    75,     0,     0,   435,   608,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
       0,     0,     0,    29,    30,     0,     0,     0,    31,     0,
       0,    32,    33,     0,    34,     0,    35,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    36,
       0,     1,     0,     0,     0,     0,     0,     0,     0,    37,
      38,    39,    40,     0,     0,     0,    41,     0,     0,     0,
       0,     0,     0,     0,     0,   194,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
       0,     0,     0,    29,    30,     0,     0,     0,    31,     0,
       0,    32,    33,     0,    34,     0,    35,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    36,
       0,     1,     0,     0,     0,     0,     0,     0,     0,    37,
      38,    39,    40,     0,     0,     0,    41,     0,     0,     0,
       0,     0,     0,     0,     0,   328,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
       0,     0,     0,    29,    30,     0,     0,     0,    31,     0,
       0,    32,    33,     0,    34,     0,    35,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    36,
       0,     1,     0,     0,     0,     0,     0,     0,     0,    37,
      38,    39,    40,     0,     0,     0,    41,     0,     0,     0,
       0,     0,     0,     0,     0,   719,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    28,     0,     0,     0,
       0,     0,     0,    29,    30,     0,     0,     0,    31,     0,
       0,    32,    33,     0,    34,     0,    35,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    36,
       1,     0,     0,     0,     0,     0,     0,     0,     0,    37,
      38,    39,    40,     0,     0,     0,    41,     0,     0,     0,
       0,    75,     0,     0,   180,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    28,     0,     0,     0,     0,
       0,     0,    29,    30,     0,     0,     0,    31,     0,     0,
      32,    33,     0,    34,     0,    35,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    36,     1,
       0,     0,     0,     0,     0,     0,     0,     0,    37,    38,
      39,    40,     0,     0,     0,    41,     0,     0,     0,     0,
       0,     0,     0,   547,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,    25,    26,   519,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    27,    28,     0,     0,     0,     0,     0,
       0,    29,    30,     0,     0,     0,    31,     0,     0,    32,
      33,     0,    34,     0,    35,     0,     0,     0,     0,     0,
       1,     0,     0,     0,     0,     0,     0,    36,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    37,    38,    39,
      40,     0,     0,     0,    41,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,     0,
       0,     0,    29,    30,     0,     0,     0,    31,     0,     0,
      32,    33,     0,    34,     0,    35,     0,     0,     0,     0,
       0,     1,     0,     0,     0,     0,     0,     0,    36,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    37,    38,
      39,    40,     0,     0,     0,    41,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      26,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    28,     0,     0,     0,
       0,     0,     0,    29,    30,     0,     0,     0,    31,     0,
       0,    32,    33,     0,    34,     0,    35,     0,     0,     0,
       0,     0,     1,     0,     0,     0,     0,     0,     0,    36,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    37,
      38,    39,    40,     0,     0,     0,    41,     2,     3,     4,
       5,     6,     7,   348,   349,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,    20,    21,   360,   361,    24,
      25,   362,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   363,     0,     0,
       0,     0,     0,     0,    29,    30,     0,     0,     0,    31,
       0,     0,     0,     0,     0,   364,     0,   365,     0,     0,
       0,     0,     0,     1,     0,     0,     0,     0,     0,     0,
     366,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      37,    38,   367,   368,     0,     0,     0,    41,     2,     3,
       4,     5,     6,     7,   348,   349,   350,   351,   352,   353,
     354,   355,   356,   357,   358,   359,    20,    21,   360,   361,
      24,    25,    26,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   363,     0,
       0,     0,     0,     0,     0,    29,    30,     0,     0,     0,
      31,     0,     0,     0,     0,     0,   364,     0,   365,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   366,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    37,    38,   367,   368,     0,     0,     0,    41
};

static const yytype_int16 yycheck[] =
{
       0,    48,   264,    82,    91,   125,     0,   385,   203,    48,
     268,    53,   202,   137,   391,    94,   385,   347,   536,   214,
      68,   437,    94,   202,   440,   283,    26,   202,    11,    17,
     124,    78,     3,   249,    70,    48,     3,    76,    71,    78,
       3,   202,    70,    82,     3,    71,     3,    47,    48,    71,
     126,     3,   146,    80,     3,    94,    70,    71,    70,    71,
      60,    28,   104,    70,     3,    65,     3,    70,     3,    69,
      70,    70,    71,   248,     3,   250,    76,   808,    78,     3,
      80,    70,    82,   133,   111,   112,     3,   248,   133,   250,
     682,    91,   126,    28,    94,   145,     3,    97,     3,   617,
     145,   101,   189,   228,   229,   230,   142,   107,   108,   188,
     133,    28,   184,   124,   147,   115,   188,   144,   118,   147,
     143,   147,     1,   854,     3,   147,   208,   209,   210,   211,
     216,   131,   133,   147,   134,   147,   123,   135,   136,   126,
     147,   180,   125,   182,   147,   184,   147,   160,   147,   188,
     133,   669,   123,   124,   142,   155,    71,   157,   147,   198,
     160,   285,   286,   287,   127,   204,   123,   759,   127,   126,
     170,   123,   124,   144,   131,   146,   215,   126,   126,   146,
     180,   371,   182,   378,   184,   224,   123,   124,   188,   189,
     568,   569,   371,   235,   146,   195,   371,   613,   198,   568,
     530,   463,   202,   203,   204,   205,   724,   146,     0,   146,
     371,   146,   212,   213,   214,   215,   216,   146,   123,   435,
     268,   126,   146,   143,   224,     3,   442,    26,   228,   229,
     230,   310,   147,   312,   450,   283,   143,   237,   132,   146,
      48,   241,   124,   256,   123,   124,   246,   247,   248,   249,
     250,   251,   146,   325,    12,    13,   256,   293,   294,   636,
     296,    60,   125,   442,   146,   265,     3,   442,   132,   269,
     133,   450,   308,   468,    80,   450,   123,   313,     3,    80,
     316,   442,   146,   133,    70,    71,   325,   133,    68,   450,
     132,   138,   139,   418,   419,   145,     3,   147,   423,   145,
     425,   147,   101,    28,   146,   111,   112,   125,   308,   309,
     111,   112,   133,   313,   127,   133,   316,   146,   580,   697,
     133,    28,   322,   133,   145,   325,    48,   413,   322,   415,
     133,   417,   112,   113,   114,   145,   460,   143,   338,    46,
     120,   461,   381,   123,   147,   123,   124,     1,   435,     3,
      75,    76,   160,   392,    76,    80,    78,   396,   371,   401,
      82,   147,   362,   402,   146,   404,   124,   125,    75,    76,
     409,   371,    94,    10,    11,   126,   376,   133,   378,   133,
      80,   381,   382,   383,   146,   385,   111,   112,     5,   145,
     123,   145,   392,   126,   476,   395,   396,   655,   131,    14,
      15,   146,   402,   202,   404,   453,   214,     0,     3,   409,
     123,   111,   112,   413,   125,   415,   429,   417,   418,   419,
     127,   146,   133,   423,   204,   425,   133,   141,   428,   429,
     125,   127,     3,   241,   127,   435,   515,   133,   133,   247,
     133,   249,   442,   251,   144,   134,   127,   127,   140,   248,
     450,   250,   133,   133,   454,   145,   146,    28,   180,   126,
     182,   241,   184,   243,   131,   465,   188,    16,   468,   123,
     124,   251,   127,   127,   127,    46,   198,    70,   133,   133,
      75,    76,   204,    76,   127,    80,   534,   127,   268,   127,
     270,   204,   214,   133,     3,   133,    75,    76,    91,   512,
     536,    80,   764,   283,    75,    76,   127,   546,   144,   595,
     126,   597,   512,   599,   600,   131,   111,   112,   565,    28,
     127,     3,   115,   127,   304,   118,   565,   614,   241,   133,
     243,   133,   111,   112,   126,   535,   536,    46,   251,   131,
     308,   132,   542,   582,   544,   313,   546,   308,   587,   132,
     133,   146,   313,   127,   554,   145,   556,   270,   288,   289,
     560,   146,   562,   362,   145,   565,    75,    76,   568,   569,
     378,   146,   371,   290,   291,   383,   146,   376,   297,   298,
     127,   617,   582,   583,   666,   667,   130,   587,   107,   108,
     144,   304,   127,    75,    76,   595,   189,   597,    80,   599,
     600,   381,   132,   325,   132,   385,   127,   655,   126,   126,
     203,   126,   205,   124,   614,   147,   126,   617,   127,   127,
     126,   429,     3,   124,   131,   127,   131,   147,   127,   111,
     112,   147,   127,   669,     3,   126,   126,   637,     7,     8,
       9,   123,   126,   442,   126,   143,   126,    28,   145,     3,
     127,   450,   145,     7,     8,     9,   127,   145,   147,   381,
     132,   143,   744,   745,   664,   747,   748,   124,   381,   669,
     392,   131,   131,   453,   396,   127,   132,   677,   147,   127,
     402,     3,   146,    58,   145,     7,     8,     9,   724,   689,
     143,   131,   692,   144,    75,    76,   143,   697,   147,    80,
     127,   783,   132,   785,   512,   705,   132,     1,   708,     3,
     792,   793,   132,   132,   126,   308,   309,   132,   765,   767,
     313,   132,   145,   316,   724,   147,   765,    66,   145,   322,
     111,   112,    60,   147,   147,   299,   301,   819,   147,   821,
     147,   823,   147,   825,     0,   544,   468,   147,   528,   147,
     147,   751,   300,   303,   534,   755,   302,   126,   758,   765,
     808,   130,   131,   250,   846,   765,   848,   104,   407,   583,
     770,   771,   126,   316,   554,   144,   130,   131,   251,   559,
     468,    75,    76,   237,   568,   646,    80,    97,   568,   569,
     144,    -1,    48,    -1,   481,   481,   796,   797,   481,   799,
      -1,    -1,   802,    -1,   126,    -1,   854,     3,   130,   131,
      -1,    75,    76,    69,    70,   528,    80,   111,   112,    -1,
      76,    77,    -1,    -1,   546,    -1,    -1,    -1,    -1,   123,
     124,    -1,   126,   127,   834,    91,    -1,   131,    -1,    -1,
      -1,    97,   435,   565,    -1,    -1,   559,   111,   112,    -1,
     850,    -1,    -1,   853,    -1,    -1,    -1,    -1,    -1,   115,
     582,   583,   118,   127,    -1,   587,    -1,   123,    -1,    -1,
      -1,    -1,    -1,    -1,     1,   655,     3,     4,     5,    75,
      76,    -1,    -1,    -1,    80,    18,    19,    20,    21,    22,
      23,    24,    25,    26,    27,   554,    -1,   677,   678,   679,
     680,    28,   682,    -1,   160,    -1,   216,    -1,    97,   689,
     569,    -1,    -1,    -1,    -1,   111,   112,   697,   228,   229,
     230,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,
     126,    -1,    80,   189,   190,   131,    -1,   193,    -1,    -1,
      -1,    -1,    -1,   536,    -1,    72,    73,   203,    -1,   205,
      -1,    -1,    -1,   263,   264,    -1,    -1,    -1,   214,     3,
     216,    -1,    -1,   111,   112,   678,   679,   680,    -1,    -1,
      -1,   751,   228,   229,   230,   755,   103,   104,   758,   759,
      -1,    -1,    -1,   705,    -1,   241,   708,   767,    -1,    -1,
      -1,   247,   119,   249,    -1,   251,   144,    -1,    -1,   126,
     256,    -1,   129,    -1,    -1,    -1,    -1,   263,   264,    -1,
      -1,   144,     3,    -1,    -1,    -1,   796,   797,   677,   799,
     800,   614,   802,   803,   617,    -1,    -1,   216,   808,    -1,
     689,    75,    76,    -1,    -1,    -1,    80,    -1,   697,   228,
     229,   230,    -1,   765,    -1,    -1,    -1,    -1,   770,   771,
      -1,    -1,   308,   309,   834,    -1,    -1,   313,    -1,    -1,
     316,    -1,    -1,    -1,    -1,    48,   322,   111,   112,    -1,
     850,    -1,    -1,   853,   854,     3,   669,    60,    -1,   123,
      -1,    -1,   126,   127,    75,    76,    -1,   800,    -1,    80,
     803,    -1,   751,    76,    -1,    78,   755,   407,    -1,   758,
      -1,    -1,    -1,   413,    -1,   415,    89,   417,   418,   419,
      -1,    94,    -1,   423,    97,   425,    -1,    -1,    -1,    -1,
     111,   112,   378,    -1,    -1,   381,    -1,   383,    -1,   385,
      -1,   724,   123,    -1,    -1,   126,    -1,   796,   797,    -1,
     799,    -1,    -1,   802,    -1,    -1,    -1,    75,    76,    -1,
      -1,    -1,    80,   463,    -1,    -1,    -1,   413,    -1,   415,
      -1,   417,   418,   419,    -1,    48,    -1,   423,    -1,   425,
      -1,   481,    -1,   429,    -1,   834,    -1,   160,    -1,   435,
      -1,    -1,    -1,   111,   112,    46,    47,    -1,    -1,   172,
      -1,   850,    75,    76,   853,    78,    -1,   180,   126,    82,
     183,   184,    -1,    -1,    -1,   188,    -1,   463,    -1,    -1,
      -1,    -1,   468,    -1,    75,    76,    -1,    -1,    -1,    80,
     203,   204,    -1,    -1,   413,   481,   415,    -1,   417,   418,
     419,   214,    -1,   216,   423,    -1,   425,    -1,    -1,    -1,
      -1,   224,    -1,    -1,    -1,   228,   229,   230,    -1,    -1,
     111,   112,    -1,    -1,    -1,    -1,   512,    -1,    -1,    -1,
      -1,    -1,   123,    -1,   247,    -1,   249,    -1,    -1,    -1,
     580,    48,    -1,   256,    -1,    -1,    -1,   160,    -1,   535,
     536,    -1,    -1,    -1,   167,   595,    -1,   597,    -1,   599,
     600,    -1,    -1,    -1,    -1,    -1,    -1,   180,    75,   182,
      -1,    -1,    -1,    48,    -1,    -1,    -1,    -1,    -1,   565,
      -1,    -1,   568,   569,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   204,    -1,    -1,   580,    -1,   309,    -1,    -1,    -1,
      -1,   214,   215,    -1,    -1,    -1,   646,    -1,    -1,   595,
      -1,   597,   325,   599,   600,    -1,   123,    -1,    48,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   614,    -1,
      -1,   617,    -1,    -1,   247,    -1,   249,    -1,    -1,    -1,
      -1,    -1,    -1,   256,    -1,    -1,    -1,    -1,   123,    -1,
      -1,    -1,    -1,   160,    -1,    -1,    -1,    -1,   371,    -1,
     167,    -1,    -1,   376,    -1,   378,    -1,    -1,   381,    -1,
      -1,    -1,    -1,   102,    -1,    -1,   595,    -1,   597,   392,
     599,   600,    -1,   669,    -1,   160,    -1,   116,    -1,   402,
     119,    -1,    -1,   123,    -1,   202,   309,   310,    -1,    -1,
     413,    -1,   415,    -1,   417,   418,   419,   214,    -1,    -1,
     423,   697,   425,    48,    -1,    -1,   429,    -1,    -1,    -1,
      -1,    -1,   435,    -1,   764,    -1,    -1,    -1,    -1,   442,
     160,    -1,    -1,    -1,   241,    -1,    -1,   450,   724,   214,
     247,   248,   249,   250,   251,    -1,    -1,    -1,    -1,   256,
      -1,    -1,    -1,    -1,    -1,   468,   263,   264,   371,    -1,
      -1,   190,    -1,    -1,   193,    -1,   241,   380,   381,    -1,
      -1,    -1,   247,   248,   249,   250,   251,    -1,   764,   392,
      -1,   256,    -1,   396,   214,    -1,    -1,    -1,   263,   264,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   512,
      -1,    -1,    -1,    -1,    -1,   234,    -1,    -1,    -1,    -1,
      -1,   241,    -1,    -1,    -1,    -1,   429,   247,   248,   249,
     250,   251,   435,    -1,   437,   160,   256,    -1,    -1,   442,
      -1,    -1,    -1,   263,   264,    -1,    -1,   450,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   565,    -1,    -1,   468,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   371,    -1,    -1,   202,    -1,    -1,
     583,   378,    -1,   380,   381,    -1,   383,    -1,   385,   214,
      -1,    -1,   595,    -1,   597,    -1,   599,   600,    48,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   512,
      -1,    -1,    -1,   378,    -1,    -1,   381,    -1,   383,    -1,
     385,    -1,   247,   248,   249,   250,    -1,    -1,    -1,    -1,
      -1,    -1,   429,    -1,    -1,    -1,    -1,    -1,   263,   264,
      -1,    -1,    -1,   546,    -1,   442,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   450,    -1,    -1,    -1,    -1,   378,    -1,
      -1,   381,   565,   383,   429,   385,   463,    -1,    -1,    -1,
      -1,   468,    -1,   123,   393,    -1,    -1,   442,    -1,    -1,
     583,    -1,    77,    -1,   481,   450,    -1,    -1,    -1,    -1,
      -1,    -1,   695,    -1,    -1,    -1,    -1,    -1,   463,    -1,
      -1,    -1,   421,   468,    -1,   708,    -1,   102,    -1,   429,
     160,    -1,    -1,    -1,    -1,   512,   481,   436,    -1,    -1,
      -1,   116,   442,    -1,   119,    -1,    -1,    -1,    -1,   448,
     450,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   463,    -1,    -1,   371,   512,   468,    -1,
      -1,    -1,    -1,   378,    -1,    -1,    -1,    -1,   383,    -1,
     385,   481,   765,    -1,   214,    -1,    -1,    -1,   565,    -1,
      -1,   568,   569,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   580,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   241,   512,    -1,    -1,   190,    -1,   247,   193,   249,
     565,   251,   705,   568,   569,    -1,   256,    -1,    -1,    -1,
      -1,    -1,    -1,   263,   264,   580,    -1,   442,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   450,    -1,    -1,    -1,    -1,
     549,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   463,   234,
      -1,    -1,    -1,   468,    -1,   565,    -1,    -1,   568,   569,
      -1,    -1,    -1,    -1,    -1,    -1,   481,    -1,    -1,    -1,
     580,    -1,   765,    -1,    -1,    -1,   585,    -1,   263,   264,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   512,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   615,    -1,    -1,   618,
     697,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   627,   628,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   378,    -1,
      -1,   381,   697,   383,    -1,   385,    -1,    -1,    -1,    28,
     565,    -1,    -1,   568,   569,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   580,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   764,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   697,    -1,   429,
      -1,    -1,    -1,    72,    73,    74,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   391,    -1,   393,   764,
      -1,    -1,    -1,    -1,    -1,    -1,   725,    -1,    -1,    -1,
     729,    -1,    -1,   463,   103,   104,    -1,    -1,   468,    -1,
      -1,   110,    -1,    -1,    -1,    -1,   421,    -1,    -1,    -1,
     119,   481,    -1,    -1,   123,    -1,    -1,   126,    -1,   128,
     129,   436,    -1,   762,   764,   134,   135,   136,   137,    -1,
      -1,    -1,    -1,   448,   773,    -1,    -1,   146,   147,    -1,
      -1,    -1,   512,    -1,    -1,    -1,    -1,    -1,   463,    -1,
      -1,    -1,   697,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,   481,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,   565,     8,     9,   568,   569,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     580,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,   764,
      -1,    -1,    -1,    -1,    -1,    72,    73,    74,    -1,    -1,
      -1,    -1,    -1,    -1,   549,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    -1,    -1,    -1,   103,   104,    -1,    -1,
      72,    73,    74,   110,    -1,   580,    -1,    -1,    -1,    -1,
     585,    -1,   119,    -1,    -1,    -1,   123,    -1,    -1,   126,
     127,   128,   129,    -1,    -1,    -1,    -1,   134,   135,   136,
     137,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,   146,
     615,    -1,    -1,   618,    -1,    -1,    -1,   119,    -1,    -1,
      -1,   123,   627,   628,   126,    -1,   128,   129,     3,    -1,
      -1,   636,   134,   135,   136,   137,    -1,   697,    -1,    -1,
      -1,   646,    -1,   145,   146,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   657,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    67,    68,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    76,    -1,    -1,   764,    80,    -1,    -1,    83,    84,
      -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
     725,    -1,    -1,    -1,   729,    -1,   101,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,     1,   118,     3,     4,     5,     6,   123,     8,
       9,   126,   127,    -1,    -1,    -1,   131,   762,    -1,   764,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   773,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,    78,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,    -1,    -1,   123,    -1,    -1,   126,    -1,   128,
     129,    -1,    -1,    -1,    -1,   134,   135,   136,   137,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   145,   146,   147,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    -1,    -1,    -1,    68,    -1,    -1,    -1,
      72,    73,    74,    75,    76,    -1,    78,    -1,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,    -1,
      -1,   123,    -1,    -1,   126,    -1,   128,   129,    -1,    -1,
      -1,    -1,   134,   135,   136,   137,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   145,   146,   147,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      -1,    -1,    -1,    68,    -1,    -1,    -1,    72,    73,    74,
      75,    76,    -1,    78,    -1,    80,    -1,    -1,    83,    84,
      -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,   114,
      -1,    -1,    -1,   118,   119,    -1,    -1,    -1,   123,    -1,
      -1,   126,    -1,   128,   129,    -1,    -1,    -1,    -1,   134,
     135,   136,   137,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     145,   146,   147,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,
      -1,    -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,
      88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,   114,    -1,    -1,    -1,
     118,   119,    -1,    -1,    -1,   123,    -1,    -1,   126,    -1,
     128,   129,    -1,    -1,    -1,    -1,   134,   135,   136,   137,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   145,   146,   147,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,
      -1,    72,    73,    74,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,
      -1,    -1,   123,    -1,    -1,   126,    -1,   128,   129,    -1,
      -1,    -1,    -1,   134,   135,   136,   137,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   145,   146,   147,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,    73,
      74,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,    -1,    -1,   123,
      -1,    -1,   126,    -1,   128,   129,    -1,    -1,    -1,    -1,
     134,   135,   136,   137,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   145,   146,   147,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    -1,    -1,    -1,    72,    73,    74,    75,    76,
      -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,    86,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,   114,    -1,    -1,
      -1,   118,   119,    -1,    -1,    -1,   123,    -1,    -1,   126,
      -1,   128,   129,    -1,    -1,    -1,    -1,   134,   135,   136,
     137,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   145,   146,
     147,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,
      -1,    -1,    72,    73,    74,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,   114,    -1,    -1,    -1,   118,   119,
      -1,    -1,    -1,   123,    -1,    -1,   126,    -1,   128,   129,
      -1,    -1,    -1,    -1,   134,   135,   136,   137,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   145,   146,   147,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,
      73,    74,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,   114,    -1,    -1,    -1,   118,   119,    -1,    -1,    -1,
     123,    -1,    -1,   126,    -1,   128,   129,    -1,    -1,    -1,
      -1,   134,   135,   136,   137,     1,    -1,     3,     4,     5,
      -1,    -1,   145,   146,   147,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    69,    -1,    -1,    72,    73,    -1,    75,
      76,    -1,    -1,    79,    80,    -1,    -1,    83,    84,    -1,
      86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,   119,    -1,    -1,    -1,   123,    -1,    -1,
     126,    -1,   128,   129,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   145,
      -1,   147,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    69,    -1,    -1,    72,    73,    -1,    75,    76,
      -1,    -1,    79,    80,    -1,    -1,    83,    84,    -1,    86,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,   119,    -1,    -1,    -1,   123,    -1,    -1,   126,
      -1,   128,   129,     1,    -1,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   145,    -1,
     147,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    69,    -1,    -1,    72,    73,    -1,    75,    76,    -1,
      -1,    79,    80,    -1,    -1,    83,    84,    -1,    86,    -1,
      88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,
     118,   119,    -1,    -1,    -1,   123,    -1,    -1,   126,    -1,
     128,   129,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   145,    -1,   147,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      69,    -1,    -1,    72,    73,    -1,    75,    76,    -1,    -1,
      79,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,    -1,    -1,   123,    -1,    -1,   126,    -1,   128,
     129,     1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   145,    -1,   147,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    69,
      -1,    -1,    72,    73,    -1,    75,    76,    -1,    -1,    79,
      80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,   119,
      -1,    -1,    -1,   123,    -1,    -1,   126,    -1,   128,   129,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   145,    -1,   147,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    69,    -1,
      -1,    72,    73,    -1,    75,    76,    -1,    -1,    79,    80,
      -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,
      -1,    -1,   123,    -1,    -1,   126,    -1,   128,   129,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   145,    -1,   147,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    69,    -1,    -1,
      72,    73,    -1,    75,    76,    -1,    -1,    79,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,   103,   104,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,    -1,
      -1,   123,    -1,    -1,   126,    -1,   128,   129,     1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   145,    -1,   147,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    72,
      73,    -1,    75,    76,    -1,    -1,    79,    80,    -1,    -1,
      83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,   119,    -1,    -1,    -1,
     123,    -1,    -1,   126,    -1,   128,   129,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   145,    -1,   147,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    72,    73,
      -1,    75,    76,    -1,    -1,    79,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,    -1,    -1,   123,
      -1,    -1,   126,    -1,   128,   129,     1,    -1,     3,     4,
       5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   145,    -1,   147,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    69,    -1,    -1,    72,    73,    -1,
      75,    76,    -1,    -1,    79,    80,    -1,    -1,    83,    84,
      -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,
      -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,   118,   119,    -1,    -1,    -1,   123,    -1,
      -1,   126,    -1,   128,   129,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     145,    -1,   147,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    69,    -1,    -1,    72,    73,    -1,    75,
      76,    -1,    -1,    79,    80,    -1,    -1,    83,    84,    -1,
      86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,   119,    -1,    -1,    -1,   123,    -1,    -1,
     126,    -1,   128,   129,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   145,
      -1,   147,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    69,    -1,    -1,    72,    73,    -1,    75,    76,
      -1,    -1,    79,    80,    -1,    -1,    83,    84,    -1,    86,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,   119,    -1,    -1,    -1,   123,    -1,    -1,   126,
      -1,   128,   129,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,   145,    -1,
     147,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    72,    73,    74,    75,    76,    -1,
      78,    -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,
      88,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,   114,    -1,    28,    -1,
     118,   119,    -1,    -1,    -1,   123,    -1,    -1,   126,    -1,
     128,   129,    -1,    -1,    -1,    -1,   134,   135,   136,   137,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   145,   146,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    72,    73,    74,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,
     110,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,
      -1,    -1,    -1,   123,    -1,    -1,   126,    -1,   128,   129,
      72,    73,    74,    -1,   134,   135,   136,   137,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   146,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,
      -1,   123,    -1,    -1,   126,    -1,   128,   129,    -1,    -1,
      -1,    -1,   134,   135,   136,   137,     1,    -1,     3,     4,
       5,    -1,    -1,    -1,   146,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    69,    -1,    -1,    72,    73,    -1,
      75,    76,    -1,    -1,    79,    80,    -1,    -1,    83,    84,
      -1,    86,    -1,    88,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,   101,    -1,   103,   104,
      -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    28,    -1,   118,   119,    -1,    -1,    -1,   123,    -1,
      -1,   126,    -1,   128,   129,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
     145,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    72,    73,    74,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,   110,    28,    -1,    -1,    -1,    72,    73,
      74,    -1,   119,    -1,    -1,    -1,   123,    -1,    -1,   126,
     127,   128,   129,    -1,    -1,    -1,    -1,   134,   135,   136,
     137,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   145,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,    -1,    72,    73,
      74,    -1,    -1,    -1,    -1,   119,    -1,    -1,    -1,   123,
      -1,    -1,   126,   127,   128,   129,    -1,    -1,    -1,    -1,
     134,   135,   136,   137,    -1,    -1,    -1,    -1,    -1,   103,
     104,   145,    -1,    -1,    -1,    -1,   110,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   119,    -1,     3,    -1,   123,
      -1,    -1,   126,    -1,   128,   129,    -1,    -1,    -1,    -1,
     134,   135,   136,   137,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   145,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,    -1,    80,    -1,    -1,    -1,    -1,    -1,
      86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,    -1,    -1,    -1,     3,   123,    -1,    -1,
     126,    -1,    -1,    -1,    -1,   131,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     146,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,
      -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,    86,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,    -1,    -1,     3,    -1,   123,    -1,    -1,   126,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,   145,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
      -1,    -1,     3,    -1,   123,    -1,    -1,   126,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   145,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,
      -1,    -1,   123,    -1,     1,   126,     3,     4,     5,     6,
     131,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   144,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    -1,    -1,    -1,    72,    73,    74,    75,    76,
      -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,    86,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,   114,    -1,    -1,
      -1,   118,   119,    -1,    -1,    -1,   123,    -1,    -1,   126,
      -1,   128,   129,    -1,    -1,    -1,    -1,   134,   135,   136,
     137,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,
      -1,    -1,    -1,    -1,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,
      -1,    -1,    72,    73,    74,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,   114,    -1,    -1,    -1,    -1,   119,
      -1,    -1,    -1,   123,    -1,    -1,   126,   127,   128,   129,
      -1,    -1,    -1,    -1,   134,   135,   136,   137,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,
      73,    74,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      83,    84,    -1,    86,    -1,    88,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,   101,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,   114,    -1,    28,    -1,    -1,   119,    -1,    -1,    -1,
     123,    -1,    -1,   126,   127,   128,   129,    -1,    -1,    -1,
      -1,   134,   135,   136,   137,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    72,    73,    74,
      75,    76,    -1,    -1,    -1,    80,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   103,   104,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,    -1,    -1,
      -1,    -1,    -1,    -1,   119,    -1,    28,    -1,   123,    -1,
      -1,   126,   127,   128,   129,    72,    73,    74,    -1,   134,
     135,   136,   137,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,   104,    -1,    -1,
      72,    73,    74,   110,    28,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   119,    -1,    -1,    -1,   123,    -1,    -1,   126,
      -1,   128,   129,    -1,    -1,   132,    -1,   134,   135,   136,
     137,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    72,    73,
      74,   123,    -1,    -1,   126,    -1,   128,   129,    -1,    -1,
     132,    -1,   134,   135,   136,   137,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,   119,    -1,    -1,    -1,   123,
      -1,    -1,   126,    -1,   128,   129,    -1,    -1,   132,    -1,
     134,   135,   136,   137,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    72,    73,    74,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,   104,
      -1,    -1,    -1,    -1,    -1,   110,    28,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   119,    72,    73,    74,   123,    -1,
      -1,   126,   127,   128,   129,    -1,    -1,    -1,    -1,   134,
     135,   136,   137,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   103,   104,    -1,    -1,
      72,    73,    74,   110,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   119,    -1,    28,    -1,   123,    -1,    -1,   126,
     127,   128,   129,    -1,    -1,    -1,    -1,   134,   135,   136,
     137,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,
      -1,   123,    -1,    -1,   126,   127,   128,   129,    72,    73,
      74,    -1,   134,   135,   136,   137,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,
     104,    -1,    -1,    28,    -1,    -1,   110,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,    -1,   123,
      -1,    -1,   126,    -1,   128,   129,    -1,    -1,    -1,    -1,
     134,   135,   136,   137,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    72,    73,    74,
      -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    28,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,   104,
      -1,    -1,    28,    -1,    -1,   110,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   119,    -1,    -1,    -1,   123,    -1,
      -1,   126,    -1,   128,   129,    72,    73,    74,    -1,   134,
     135,   136,   137,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    72,    73,    74,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,   110,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   119,    -1,    -1,    -1,   123,   103,   104,   126,
      -1,   128,   129,    -1,   110,    -1,    -1,   134,   135,   136,
     137,     3,    -1,   119,    -1,    -1,    -1,   123,    -1,    -1,
     126,    -1,   128,   129,    -1,    -1,    -1,    -1,   134,   135,
     136,   137,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,    -1,
      -1,   123,    -1,    -1,   126,    -1,    -1,    -1,    -1,   131,
      -1,    -1,   134,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    67,    68,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,    84,
      -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,   118,    -1,    -1,    -1,    -1,   123,    -1,
      -1,   126,   127,    -1,    -1,    -1,   131,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,
      -1,    -1,   123,    -1,    -1,   126,    -1,    -1,    -1,    -1,
     131,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,
      -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,    86,
      -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,    -1,    -1,    -1,    -1,   123,    -1,    -1,   126,
      -1,    -1,    -1,    -1,   131,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
      -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,    -1,    -1,    -1,    -1,
     123,    -1,    -1,   126,    -1,    -1,    -1,    -1,   131,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    88,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
      -1,    -1,    -1,    -1,   123,    -1,    -1,   126,    -1,    -1,
      -1,    -1,   131,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    76,    -1,    -1,    -1,    80,    -1,    -1,    -1,    -1,
      -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,   118,    -1,    -1,    -1,    -1,   123,    -1,
      -1,   126,    28,    -1,    -1,    -1,   131,    -1,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,    -1,    80,    -1,    -1,    83,    84,    -1,
      86,    -1,    88,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   123,    -1,    -1,
     126,    -1,    -1,    -1,    -1,   131,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    67,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,    -1,
      -1,   123,    -1,    -1,   126,   127,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    67,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   127,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    67,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   127,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    67,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   127,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,    -1,
      -1,   123,    -1,    -1,   126,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   126,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    67,    68,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    83,
      84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,    -1,
       3,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    67,    68,    -1,    -1,    -1,    -1,
      -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,
      83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    83,    84,    -1,    86,    -1,    88,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    -1,    -1,    -1,    86,    -1,    88,    -1,    -1,
      -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    88,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     3,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    67,    68,    75,
      76,    80,    83,    84,    86,    88,   101,   111,   112,   113,
     114,   118,   149,   150,   151,   152,   153,   158,   188,   189,
     194,   195,   196,   197,   201,   202,   203,   204,   206,   207,
     213,   221,   222,   240,   271,   146,   153,   158,   126,   126,
     124,     1,   123,   124,   158,   123,   126,   131,   134,   149,
     158,   194,   195,   203,   204,   206,   222,   225,   227,   229,
     230,   232,   233,   234,   237,   126,   201,   146,   152,   153,
     158,   195,   143,     0,   158,   223,   224,   146,   146,     1,
       4,     5,     6,     8,     9,    72,    73,    74,   103,   104,
     110,   119,   123,   126,   128,   129,   134,   135,   136,   137,
     151,   158,   159,   160,   161,   164,   165,   166,   167,   168,
     169,   170,   171,   172,   173,   174,   175,   176,   177,   178,
     179,   180,   258,   261,   151,   158,   151,   158,   165,   170,
     188,   208,   209,   210,   211,   212,   203,   236,   237,   127,
     158,   227,   229,   238,   239,   240,   132,   151,   179,   183,
     126,   158,   195,   229,   237,   225,   230,   233,   237,   126,
     131,   195,   126,   131,   127,   158,   238,   241,   195,   225,
     234,   126,    69,    79,   126,   128,   145,   147,   154,   155,
     156,   157,   158,   161,   188,   195,   214,   215,   216,   217,
     218,   230,   231,   233,   237,   260,   261,   263,   146,   146,
     146,   153,   158,   183,   144,   197,   201,   133,   147,   223,
     223,   126,   165,   126,   165,   165,   158,   188,   183,   188,
     183,   126,   165,   127,   180,   182,   185,   203,   204,   206,
     222,   242,   258,   146,   146,     7,     8,     9,   126,   130,
     131,   158,    18,    19,    20,    21,    22,    23,    24,    25,
      26,    27,   144,   181,   167,   123,   138,   139,   135,   136,
      10,    11,   170,    12,    13,   124,   125,    14,    15,   134,
     140,   141,    16,    17,   142,   127,   127,   127,   144,   126,
     195,   227,   237,   144,    11,   125,   133,   203,   237,   127,
     127,   127,   133,   132,   132,   237,   225,   234,   127,   238,
     132,   151,   183,   132,   151,   183,   127,   127,   133,     3,
      28,    46,    75,    76,   127,   198,   199,   200,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      48,    49,    52,    68,    86,    88,   101,   113,   114,   153,
     158,   190,   194,   203,   205,   207,   213,   221,   188,   231,
     123,   126,   158,   188,   146,   252,   253,   253,   253,   145,
     253,   144,   126,   143,   145,   158,   195,   219,   220,   230,
     231,   235,   237,   233,   237,   147,   218,   133,   145,   195,
     233,   145,   145,   214,   147,   214,   147,   214,   146,   146,
     183,   144,   224,   145,   147,   145,   147,   149,   158,   186,
     203,   204,   206,   222,   243,   126,   131,   195,   226,   228,
     237,   158,   191,   194,   203,   205,   206,   222,   131,   228,
     191,   243,   127,   133,   158,   203,   204,   206,   222,   227,
     127,   130,   145,   146,   147,   161,   162,   179,   187,   194,
     203,   204,   206,   222,   245,   262,   264,   265,   266,   267,
     268,   269,   270,   147,   270,   158,   127,   162,   163,   180,
     158,   182,   162,   180,   167,   167,   167,   168,   168,   169,
     169,   170,   170,   170,   172,   172,   173,   174,   175,   176,
     177,   182,   188,   209,   210,   237,   209,   210,   211,    53,
     240,   127,   132,   132,   132,   132,   158,   127,   126,   127,
     133,   199,   153,   158,   126,   126,   124,   146,   158,   194,
     203,   205,   227,   158,   195,   231,   195,   126,   147,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      78,   145,   158,   182,   184,   187,   247,   248,   249,   250,
     251,   253,   254,   255,   256,   257,   259,   245,   127,   183,
     146,   230,   237,   133,   145,   143,   201,   195,   230,   233,
     215,   233,   147,   147,   147,   214,   147,   214,   183,   214,
     214,   149,   203,   204,   206,   222,   227,   127,   127,   228,
     238,   183,   226,   237,   126,   131,   226,   124,   131,   158,
     194,   203,   205,   206,   222,   228,   183,   131,   131,   228,
     127,   180,   167,   258,   147,   270,   144,   158,   194,   203,
     204,   206,   222,   231,   235,   253,   133,   145,   145,   265,
     267,   268,   147,   147,   127,   133,   132,   143,   227,   182,
     127,   199,   180,   151,   158,   212,    70,    71,   147,   124,
     146,   146,   158,   153,   158,   127,   183,   143,   126,   126,
     126,   247,   126,   158,   145,   145,   145,   182,   158,   143,
     145,   145,   158,   192,   193,   229,   184,   250,   184,   247,
     147,   145,   147,   270,   230,   195,   220,   230,   237,   183,
     230,   147,   147,   147,   147,   127,   127,   132,   226,   127,
     238,   183,   212,   183,   124,   131,   132,   183,   183,   131,
     147,   245,   266,   162,   180,   179,   127,   127,   127,   127,
     125,   253,   253,   212,    70,    71,   147,    70,    71,   147,
     146,   143,   247,   182,   182,   127,   182,    58,   127,   254,
     145,   145,   144,   247,   146,   133,   145,   144,   147,   230,
     237,   195,   230,   143,   127,   132,   125,   132,   212,   183,
     132,   132,   183,    71,   147,    70,   147,   125,   253,   253,
     253,   253,    70,    71,   147,   247,   127,   127,   247,   127,
     126,   247,   127,   254,   183,   147,   270,   193,   146,   180,
     244,   230,   230,   183,   125,   132,   132,   253,   253,    71,
     147,    70,   147,    71,   147,    70,   147,   253,   253,   247,
     247,   247,   182,   247,   127,   182,   145,   147,   244,   246,
     147,   147,   253,   253,   253,   253,    71,   147,    70,   147,
      66,   127,   247,   127,   133,   147,   147,   147,   147,   147,
     253,   253,   247,   145,   247,   147,   244,   147,   147
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   148,   149,   149,   150,   151,   151,   152,   153,   153,
     153,   154,   154,   155,   156,   157,   157,   158,   159,   159,
     160,   160,   160,   160,   160,   160,   160,   160,   160,   160,
     160,   160,   160,   160,   160,   160,   160,   161,   161,   161,
     161,   161,   161,   161,   161,   161,   162,   163,   163,   163,
     163,   164,   164,   164,   164,   164,   164,   164,   165,   165,
     166,   166,   166,   166,   166,   166,   166,   167,   167,   168,
     168,   168,   168,   169,   169,   169,   170,   170,   170,   171,
     172,   172,   172,   172,   172,   173,   173,   173,   174,   174,
     175,   175,   176,   176,   177,   177,   178,   178,   179,   179,
     180,   180,   180,   181,   181,   181,   181,   181,   181,   181,
     181,   181,   181,   181,   182,   182,   183,   184,   184,   184,
     184,   185,   185,   185,   185,   185,   185,   185,   185,   186,
     186,   186,   186,   186,   186,   186,   186,   186,   186,   187,
     187,   187,   187,   187,   187,   187,   187,   187,   187,   188,
     188,   188,   188,   188,   188,   188,   188,   188,   188,   188,
     188,   189,   189,   190,   190,   190,   190,   190,   190,   190,
     190,   190,   190,   191,   191,   191,   191,   191,   191,   191,
     191,   191,   191,   191,   191,   191,   191,   192,   192,   193,
     193,   194,   194,   194,   194,   194,   194,   195,   195,   195,
     195,   196,   196,   196,   197,   197,   198,   198,   198,   198,
     198,   199,   199,   200,   200,   200,   201,   201,   202,   203,
     203,   203,   204,   204,   204,   204,   204,   204,   204,   204,
     204,   204,   204,   204,   204,   204,   204,   204,   204,   204,
     204,   204,   204,   204,   204,   204,   204,   204,   205,   205,
     205,   205,   205,   205,   205,   205,   205,   205,   205,   205,
     205,   205,   205,   205,   205,   205,   205,   205,   205,   205,
     205,   205,   206,   206,   206,   206,   206,   206,   206,   206,
     206,   206,   207,   207,   207,   207,   208,   208,   209,   209,
     210,   211,   211,   211,   211,   211,   211,   212,   212,   213,
     213,   214,   214,   215,   216,   216,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   217,   217,   217,   217,   217,
     217,   217,   217,   217,   217,   217,   218,   218,   218,   218,
     218,   218,   218,   218,   219,   219,   220,   220,   220,   220,
     220,   221,   221,   222,   222,   222,   222,   222,   223,   223,
     224,   224,   224,   224,   225,   225,   225,   225,   225,   225,
     225,   225,   225,   225,   225,   226,   226,   226,   226,   226,
     227,   227,   227,   227,   227,   227,   228,   228,   228,   228,
     228,   228,   229,   229,   229,   229,   230,   230,   230,   230,
     230,   231,   231,   231,   231,   231,   232,   233,   233,   233,
     234,   234,   234,   234,   235,   235,   235,   235,   235,   236,
     236,   237,   237,   237,   237,   238,   238,   239,   239,   240,
     240,   240,   240,   240,   240,   241,   241,   242,   242,   243,
     243,   244,   244,   244,   245,   245,   246,   246,   247,   247,
     247,   247,   247,   247,   248,   248,   248,   249,   249,   250,
     250,   250,   251,   251,   251,   252,   253,   253,   254,   254,
     255,   255,   255,   256,   256,   256,   256,   256,   256,   256,
     257,   257,   257,   257,   257,   258,   259,   259,   260,   260,
     261,   261,   261,   261,   262,   262,   263,   263,   263,   263,
     263,   264,   264,   265,   266,   266,   267,   267,   268,   269,
     269,   269,   269,   269,   269,   270,   270,   270,   271,   271
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     2,     2,     1,     2,     1,     1,     4,
       4,     2,     1,     3,     4,     3,     2,     1,     1,     3,
       1,     1,     1,     1,     1,     2,     4,     2,     6,     5,
       6,     5,     7,     6,     7,     6,     1,     1,     4,     3,
       4,     3,     2,     3,     2,     2,     1,     1,     1,     3,
       3,     2,     2,     2,     2,     4,     2,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     4,     1,
       3,     3,     3,     1,     3,     3,     1,     3,     3,     2,
       1,     2,     3,     3,     3,     1,     3,     3,     1,     3,
       1,     3,     1,     3,     1,     3,     1,     3,     1,     5,
       1,     3,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     3,     1,     2,     3,     2,
       5,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     1,     1,     2,     1,     2,     1,     2,     1,
       2,     4,     5,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     4,     5,     1,     3,     1,
       3,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     2,     1,     1,     1,     1,
       1,     1,     4,     1,     2,     3,     6,     5,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     4,     4,     4,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     4,     4,
       4,     1,     5,     4,     4,     3,     5,     6,     5,     5,
       4,     6,     2,     2,     3,     3,     1,     2,     1,     2,
       1,     1,     1,     3,     3,     3,     3,     1,     3,     1,
       1,     1,     2,     3,     1,     3,     9,     9,     7,     7,
       5,    10,    10,     8,     8,     6,     8,     8,     6,     6,
       4,     9,     9,     7,     7,     5,     3,     2,     2,     2,
       1,     2,     1,     1,     1,     3,     1,     2,     2,     3,
       5,     2,     2,     4,     5,     7,     7,     5,     1,     3,
       1,     3,     2,     4,     3,     2,     3,     3,     3,     4,
       4,     2,     3,     3,     4,     3,     2,     3,     3,     4,
       1,     1,     2,     2,     2,     3,     1,     1,     2,     2,
       2,     3,     1,     2,     3,     2,     1,     3,     4,     3,
       4,     1,     2,     2,     3,     3,     2,     3,     3,     2,
       1,     1,     2,     2,     1,     2,     2,     3,     3,     1,
       2,     1,     2,     2,     3,     1,     3,     1,     3,     2,
       2,     2,     3,     1,     1,     1,     3,     1,     2,     1,
       2,     1,     3,     4,     1,     1,     1,     3,     1,     1,
       1,     1,     1,     1,     3,     4,     3,     1,     2,     1,
       2,     2,     1,     1,     2,     1,     2,     3,     1,     2,
       5,     7,     5,     5,     7,     6,     7,     4,     5,     4,
       3,     2,     2,     2,     3,     1,     5,     4,     5,     4,
       4,     3,     4,     3,     3,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     3,     1,     1,     3,     2,     1,
       1,     2,     2,     1,     2,     1,     1,     2,     1,     3
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)                                \
    do                                                                  \
      if (N)                                                            \
        {                                                               \
          (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;        \
          (Current).first_column = YYRHSLOC (Rhs, 1).first_column;      \
          (Current).last_line    = YYRHSLOC (Rhs, N).last_line;         \
          (Current).last_column  = YYRHSLOC (Rhs, N).last_column;       \
        }                                                               \
      else                                                              \
        {                                                               \
          (Current).first_line   = (Current).last_line   =              \
            YYRHSLOC (Rhs, 0).last_line;                                \
          (Current).first_column = (Current).last_column =              \
            YYRHSLOC (Rhs, 0).last_column;                              \
        }                                                               \
    while (0)
#endif

#define YYRHSLOC(Rhs, K) ((Rhs)[K])


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL

/* Print *YYLOCP on YYO.  Private, do not rely on its existence. */

__attribute__((__unused__))
static unsigned
yy_location_print_ (FILE *yyo, YYLTYPE const * const yylocp)
{
  unsigned res = 0;
  int end_col = 0 != yylocp->last_column ? yylocp->last_column - 1 : 0;
  if (0 <= yylocp->first_line)
    {
      res += YYFPRINTF (yyo, "%d", yylocp->first_line);
      if (0 <= yylocp->first_column)
        res += YYFPRINTF (yyo, ".%d", yylocp->first_column);
    }
  if (0 <= yylocp->last_line)
    {
      if (yylocp->first_line < yylocp->last_line)
        {
          res += YYFPRINTF (yyo, "-%d", yylocp->last_line);
          if (0 <= end_col)
            res += YYFPRINTF (yyo, ".%d", end_col);
        }
      else if (0 <= end_col && yylocp->first_column < end_col)
        res += YYFPRINTF (yyo, "-%d", end_col);
    }
  return res;
 }

#  define YY_LOCATION_PRINT(File, Loc)          \
  yy_location_print_ (File, &(Loc))

# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value, Location); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  YYUSE (yylocationp);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  YY_LOCATION_PRINT (yyoutput, *yylocationp);
  YYFPRINTF (yyoutput, ": ");
  yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, YYLTYPE *yylsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                       , &(yylsp[(yyi + 1) - (yynrhs)])                       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, yylsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULL, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULL;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULL, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, YYLTYPE *yylocationp)
{
  YYUSE (yyvaluep);
  YYUSE (yylocationp);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {
          case 149: /* guess_type  */
#line 178 "type.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3540 "type.ec" /* yacc.c:1274  */
        break;

    case 151: /* type  */
#line 178 "type.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3546 "type.ec" /* yacc.c:1274  */
        break;

    case 152: /* base_strict_type  */
#line 178 "type.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3552 "type.ec" /* yacc.c:1274  */
        break;

    case 153: /* strict_type  */
#line 178 "type.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3558 "type.ec" /* yacc.c:1274  */
        break;

    case 154: /* class_function_definition_start  */
#line 199 "type.y" /* yacc.c:1274  */
      { FreeClassFunction(((*yyvaluep).classFunction)); }
#line 3564 "type.ec" /* yacc.c:1274  */
        break;

    case 155: /* constructor_function_definition_start  */
#line 199 "type.y" /* yacc.c:1274  */
      { FreeClassFunction(((*yyvaluep).classFunction)); }
#line 3570 "type.ec" /* yacc.c:1274  */
        break;

    case 156: /* destructor_function_definition_start  */
#line 199 "type.y" /* yacc.c:1274  */
      { FreeClassFunction(((*yyvaluep).classFunction)); }
#line 3576 "type.ec" /* yacc.c:1274  */
        break;

    case 157: /* virtual_class_function_definition_start  */
#line 199 "type.y" /* yacc.c:1274  */
      { FreeClassFunction(((*yyvaluep).classFunction)); }
#line 3582 "type.ec" /* yacc.c:1274  */
        break;

    case 158: /* identifier  */
#line 170 "type.y" /* yacc.c:1274  */
      { FreeIdentifier(((*yyvaluep).id)); }
#line 3588 "type.ec" /* yacc.c:1274  */
        break;

    case 159: /* primary_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3594 "type.ec" /* yacc.c:1274  */
        break;

    case 161: /* postfix_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3600 "type.ec" /* yacc.c:1274  */
        break;

    case 163: /* argument_expression_list  */
#line 207 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeExpression); }
#line 3606 "type.ec" /* yacc.c:1274  */
        break;

    case 165: /* unary_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3612 "type.ec" /* yacc.c:1274  */
        break;

    case 167: /* cast_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3618 "type.ec" /* yacc.c:1274  */
        break;

    case 168: /* multiplicative_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3624 "type.ec" /* yacc.c:1274  */
        break;

    case 169: /* additive_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3630 "type.ec" /* yacc.c:1274  */
        break;

    case 170: /* shift_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3636 "type.ec" /* yacc.c:1274  */
        break;

    case 172: /* relational_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3642 "type.ec" /* yacc.c:1274  */
        break;

    case 173: /* equality_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3648 "type.ec" /* yacc.c:1274  */
        break;

    case 174: /* and_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3654 "type.ec" /* yacc.c:1274  */
        break;

    case 175: /* exclusive_or_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3660 "type.ec" /* yacc.c:1274  */
        break;

    case 176: /* inclusive_or_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3666 "type.ec" /* yacc.c:1274  */
        break;

    case 177: /* logical_and_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3672 "type.ec" /* yacc.c:1274  */
        break;

    case 178: /* logical_or_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3678 "type.ec" /* yacc.c:1274  */
        break;

    case 179: /* conditional_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3684 "type.ec" /* yacc.c:1274  */
        break;

    case 180: /* assignment_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3690 "type.ec" /* yacc.c:1274  */
        break;

    case 182: /* expression  */
#line 207 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeExpression); }
#line 3696 "type.ec" /* yacc.c:1274  */
        break;

    case 183: /* constant_expression  */
#line 172 "type.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3702 "type.ec" /* yacc.c:1274  */
        break;

    case 184: /* declaration  */
#line 193 "type.y" /* yacc.c:1274  */
      { FreeDeclaration(((*yyvaluep).declaration)); }
#line 3708 "type.ec" /* yacc.c:1274  */
        break;

    case 185: /* specifier_qualifier_list  */
#line 209 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeSpecifier); }
#line 3714 "type.ec" /* yacc.c:1274  */
        break;

    case 186: /* guess_specifier_qualifier_list  */
#line 209 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeSpecifier); }
#line 3720 "type.ec" /* yacc.c:1274  */
        break;

    case 187: /* declaration_specifiers  */
#line 209 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeSpecifier); }
#line 3726 "type.ec" /* yacc.c:1274  */
        break;

    case 188: /* guess_declaration_specifiers  */
#line 209 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeSpecifier); }
#line 3732 "type.ec" /* yacc.c:1274  */
        break;

    case 192: /* init_declarator_list  */
#line 214 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeInitDeclarator); }
#line 3738 "type.ec" /* yacc.c:1274  */
        break;

    case 193: /* init_declarator  */
#line 188 "type.y" /* yacc.c:1274  */
      { FreeInitDeclarator(((*yyvaluep).initDeclarator)); }
#line 3744 "type.ec" /* yacc.c:1274  */
        break;

    case 194: /* storage_class_specifier  */
#line 178 "type.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3750 "type.ec" /* yacc.c:1274  */
        break;

    case 195: /* ext_decl  */
#line 224 "type.y" /* yacc.c:1274  */
      { FreeExtDecl(((*yyvaluep).extDecl)); }
#line 3756 "type.ec" /* yacc.c:1274  */
        break;

    case 197: /* multi_attrib  */
#line 227 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeAttrib); }
#line 3762 "type.ec" /* yacc.c:1274  */
        break;

    case 198: /* attribute_word  */
#line 204 "type.y" /* yacc.c:1274  */
      { delete ((*yyvaluep).string); }
#line 3768 "type.ec" /* yacc.c:1274  */
        break;

    case 199: /* attribute  */
#line 225 "type.y" /* yacc.c:1274  */
      { FreeAttribute(((*yyvaluep).attribute)); }
#line 3774 "type.ec" /* yacc.c:1274  */
        break;

    case 200: /* attribs_list  */
#line 226 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeAttribute); }
#line 3780 "type.ec" /* yacc.c:1274  */
        break;

    case 201: /* attrib  */
#line 223 "type.y" /* yacc.c:1274  */
      { FreeAttrib(((*yyvaluep).attrib)); }
#line 3786 "type.ec" /* yacc.c:1274  */
        break;

    case 202: /* ext_storage  */
#line 178 "type.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3792 "type.ec" /* yacc.c:1274  */
        break;

    case 203: /* type_qualifier  */
#line 178 "type.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3798 "type.ec" /* yacc.c:1274  */
        break;

    case 204: /* type_specifier  */
#line 178 "type.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3804 "type.ec" /* yacc.c:1274  */
        break;

    case 205: /* strict_type_specifier  */
#line 178 "type.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3810 "type.ec" /* yacc.c:1274  */
        break;

    case 206: /* struct_or_union_specifier_compound  */
#line 178 "type.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3816 "type.ec" /* yacc.c:1274  */
        break;

    case 207: /* struct_or_union_specifier_nocompound  */
#line 178 "type.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3822 "type.ec" /* yacc.c:1274  */
        break;

    case 208: /* template_datatype  */
#line 222 "type.y" /* yacc.c:1274  */
      { FreeTemplateDataType(((*yyvaluep).templateDatatype)); }
#line 3828 "type.ec" /* yacc.c:1274  */
        break;

    case 209: /* template_type_argument  */
#line 221 "type.y" /* yacc.c:1274  */
      { FreeTemplateArgument(((*yyvaluep).templateArgument)); }
#line 3834 "type.ec" /* yacc.c:1274  */
        break;

    case 210: /* template_expression_argument  */
#line 221 "type.y" /* yacc.c:1274  */
      { FreeTemplateArgument(((*yyvaluep).templateArgument)); }
#line 3840 "type.ec" /* yacc.c:1274  */
        break;

    case 211: /* template_argument  */
#line 221 "type.y" /* yacc.c:1274  */
      { FreeTemplateArgument(((*yyvaluep).templateArgument)); }
#line 3846 "type.ec" /* yacc.c:1274  */
        break;

    case 214: /* struct_declaration_list  */
#line 217 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeClassDef); }
#line 3852 "type.ec" /* yacc.c:1274  */
        break;

    case 215: /* default_property  */
#line 197 "type.y" /* yacc.c:1274  */
      { FreeMemberInit(((*yyvaluep).memberInit)); }
#line 3858 "type.ec" /* yacc.c:1274  */
        break;

    case 216: /* default_property_list  */
#line 218 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeMemberInit); }
#line 3864 "type.ec" /* yacc.c:1274  */
        break;

    case 217: /* property  */
#line 205 "type.y" /* yacc.c:1274  */
      { FreeProperty(((*yyvaluep).prop)); }
#line 3870 "type.ec" /* yacc.c:1274  */
        break;

    case 218: /* struct_declaration  */
#line 203 "type.y" /* yacc.c:1274  */
      { FreeClassDef(((*yyvaluep).classDef)); }
#line 3876 "type.ec" /* yacc.c:1274  */
        break;

    case 219: /* struct_declarator_list  */
#line 211 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeDeclarator); }
#line 3882 "type.ec" /* yacc.c:1274  */
        break;

    case 220: /* struct_declarator  */
#line 182 "type.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3888 "type.ec" /* yacc.c:1274  */
        break;

    case 221: /* enum_specifier_nocompound  */
#line 178 "type.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3894 "type.ec" /* yacc.c:1274  */
        break;

    case 222: /* enum_specifier_compound  */
#line 178 "type.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3900 "type.ec" /* yacc.c:1274  */
        break;

    case 223: /* enumerator_list  */
#line 208 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeEnumerator); }
#line 3906 "type.ec" /* yacc.c:1274  */
        break;

    case 224: /* enumerator  */
#line 181 "type.y" /* yacc.c:1274  */
      { FreeEnumerator(((*yyvaluep).enumerator)); }
#line 3912 "type.ec" /* yacc.c:1274  */
        break;

    case 225: /* direct_abstract_declarator  */
#line 182 "type.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3918 "type.ec" /* yacc.c:1274  */
        break;

    case 226: /* direct_abstract_declarator_noarray  */
#line 182 "type.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3924 "type.ec" /* yacc.c:1274  */
        break;

    case 227: /* abstract_declarator  */
#line 182 "type.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3930 "type.ec" /* yacc.c:1274  */
        break;

    case 228: /* abstract_declarator_noarray  */
#line 182 "type.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3936 "type.ec" /* yacc.c:1274  */
        break;

    case 229: /* declarator  */
#line 182 "type.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3942 "type.ec" /* yacc.c:1274  */
        break;

    case 230: /* direct_declarator_nofunction  */
#line 182 "type.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3948 "type.ec" /* yacc.c:1274  */
        break;

    case 231: /* declarator_function  */
#line 182 "type.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3954 "type.ec" /* yacc.c:1274  */
        break;

    case 232: /* direct_declarator_function_start  */
#line 182 "type.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3960 "type.ec" /* yacc.c:1274  */
        break;

    case 233: /* direct_declarator_function  */
#line 182 "type.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3966 "type.ec" /* yacc.c:1274  */
        break;

    case 234: /* direct_declarator  */
#line 182 "type.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3972 "type.ec" /* yacc.c:1274  */
        break;

    case 235: /* declarator_nofunction  */
#line 182 "type.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3978 "type.ec" /* yacc.c:1274  */
        break;

    case 236: /* type_qualifier_list  */
#line 209 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeSpecifier); }
#line 3984 "type.ec" /* yacc.c:1274  */
        break;

    case 237: /* pointer  */
#line 171 "type.y" /* yacc.c:1274  */
      { FreePointer(((*yyvaluep).pointer)); }
#line 3990 "type.ec" /* yacc.c:1274  */
        break;

    case 238: /* parameter_type_list  */
#line 215 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeTypeName); }
#line 3996 "type.ec" /* yacc.c:1274  */
        break;

    case 239: /* parameter_list  */
#line 215 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeTypeName); }
#line 4002 "type.ec" /* yacc.c:1274  */
        break;

    case 240: /* parameter_declaration  */
#line 189 "type.y" /* yacc.c:1274  */
      { FreeTypeName(((*yyvaluep).typeName)); }
#line 4008 "type.ec" /* yacc.c:1274  */
        break;

    case 241: /* identifier_list  */
#line 215 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeTypeName); }
#line 4014 "type.ec" /* yacc.c:1274  */
        break;

    case 242: /* type_name  */
#line 189 "type.y" /* yacc.c:1274  */
      { FreeTypeName(((*yyvaluep).typeName)); }
#line 4020 "type.ec" /* yacc.c:1274  */
        break;

    case 243: /* guess_type_name  */
#line 189 "type.y" /* yacc.c:1274  */
      { FreeTypeName(((*yyvaluep).typeName)); }
#line 4026 "type.ec" /* yacc.c:1274  */
        break;

    case 244: /* initializer  */
#line 187 "type.y" /* yacc.c:1274  */
      { FreeInitializer(((*yyvaluep).initializer)); }
#line 4032 "type.ec" /* yacc.c:1274  */
        break;

    case 245: /* initializer_condition  */
#line 187 "type.y" /* yacc.c:1274  */
      { FreeInitializer(((*yyvaluep).initializer)); }
#line 4038 "type.ec" /* yacc.c:1274  */
        break;

    case 246: /* initializer_list  */
#line 213 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeInitializer); }
#line 4044 "type.ec" /* yacc.c:1274  */
        break;

    case 247: /* statement  */
#line 190 "type.y" /* yacc.c:1274  */
      { FreeStatement(((*yyvaluep).stmt)); }
#line 4050 "type.ec" /* yacc.c:1274  */
        break;

    case 248: /* labeled_statement  */
#line 190 "type.y" /* yacc.c:1274  */
      { FreeStatement(((*yyvaluep).stmt)); }
#line 4056 "type.ec" /* yacc.c:1274  */
        break;

    case 249: /* declaration_list  */
#line 212 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeDeclaration); }
#line 4062 "type.ec" /* yacc.c:1274  */
        break;

    case 250: /* statement_list  */
#line 216 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeStatement); }
#line 4068 "type.ec" /* yacc.c:1274  */
        break;

    case 251: /* compound_inside  */
#line 190 "type.y" /* yacc.c:1274  */
      { FreeStatement(((*yyvaluep).stmt)); }
#line 4074 "type.ec" /* yacc.c:1274  */
        break;

    case 252: /* compound_start  */
#line 220 "type.y" /* yacc.c:1274  */
      { PopContext(((*yyvaluep).context)); FreeContext(((*yyvaluep).context)); delete ((*yyvaluep).context); }
#line 4080 "type.ec" /* yacc.c:1274  */
        break;

    case 253: /* compound_statement  */
#line 190 "type.y" /* yacc.c:1274  */
      { FreeStatement(((*yyvaluep).stmt)); }
#line 4086 "type.ec" /* yacc.c:1274  */
        break;

    case 254: /* expression_statement  */
#line 190 "type.y" /* yacc.c:1274  */
      { FreeStatement(((*yyvaluep).stmt)); }
#line 4092 "type.ec" /* yacc.c:1274  */
        break;

    case 255: /* selection_statement  */
#line 190 "type.y" /* yacc.c:1274  */
      { FreeStatement(((*yyvaluep).stmt)); }
#line 4098 "type.ec" /* yacc.c:1274  */
        break;

    case 256: /* iteration_statement  */
#line 190 "type.y" /* yacc.c:1274  */
      { FreeStatement(((*yyvaluep).stmt)); }
#line 4104 "type.ec" /* yacc.c:1274  */
        break;

    case 257: /* jump_statement  */
#line 190 "type.y" /* yacc.c:1274  */
      { FreeStatement(((*yyvaluep).stmt)); }
#line 4110 "type.ec" /* yacc.c:1274  */
        break;

    case 258: /* string_literal  */
#line 204 "type.y" /* yacc.c:1274  */
      { delete ((*yyvaluep).string); }
#line 4116 "type.ec" /* yacc.c:1274  */
        break;

    case 259: /* instantiation_named  */
#line 195 "type.y" /* yacc.c:1274  */
      { FreeInstance(((*yyvaluep).instance)); }
#line 4122 "type.ec" /* yacc.c:1274  */
        break;

    case 261: /* instantiation_unnamed  */
#line 195 "type.y" /* yacc.c:1274  */
      { FreeInstance(((*yyvaluep).instance)); }
#line 4128 "type.ec" /* yacc.c:1274  */
        break;

    case 263: /* class_function_definition  */
#line 199 "type.y" /* yacc.c:1274  */
      { FreeClassFunction(((*yyvaluep).classFunction)); }
#line 4134 "type.ec" /* yacc.c:1274  */
        break;

    case 264: /* instance_class_function_definition_start  */
#line 199 "type.y" /* yacc.c:1274  */
      { FreeClassFunction(((*yyvaluep).classFunction)); }
#line 4140 "type.ec" /* yacc.c:1274  */
        break;

    case 265: /* instance_class_function_definition  */
#line 199 "type.y" /* yacc.c:1274  */
      { FreeClassFunction(((*yyvaluep).classFunction)); }
#line 4146 "type.ec" /* yacc.c:1274  */
        break;

    case 266: /* data_member_initialization  */
#line 197 "type.y" /* yacc.c:1274  */
      { FreeMemberInit(((*yyvaluep).memberInit)); }
#line 4152 "type.ec" /* yacc.c:1274  */
        break;

    case 267: /* data_member_initialization_list  */
#line 218 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeMemberInit); }
#line 4158 "type.ec" /* yacc.c:1274  */
        break;

    case 268: /* data_member_initialization_list_coloned  */
#line 218 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeMemberInit); }
#line 4164 "type.ec" /* yacc.c:1274  */
        break;

    case 269: /* members_initialization_list_coloned  */
#line 219 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeMembersInit); }
#line 4170 "type.ec" /* yacc.c:1274  */
        break;

    case 270: /* members_initialization_list  */
#line 219 "type.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeMembersInit); }
#line 4176 "type.ec" /* yacc.c:1274  */
        break;


      default:
        break;
    }
}




/* The lookahead symbol.  */
int yychar;


#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval YY_INITIAL_VALUE (yyval_default);

/* Location data for the lookahead symbol.  */
YYLTYPE yylloc
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
  = { 1, 1, 1, 1 }
# endif
;


/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.
       'yyls': related to locations.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    /* The location stack.  */
    YYLTYPE yylsa[YYINITDEPTH];
    YYLTYPE *yyls;
    YYLTYPE *yylsp;

    /* The locations where the error started and ended.  */
    YYLTYPE yyerror_range[3];

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
  YYLTYPE yyloc;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N), yylsp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yylsp = yyls = yylsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  yylsp[0] = yylloc;
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;
        YYLTYPE *yyls1 = yyls;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yyls1, yysize * sizeof (*yylsp),
                    &yystacksize);

        yyls = yyls1;
        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
        YYSTACK_RELOCATE (yyls_alloc, yyls);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
      yylsp = yyls + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END
  *++yylsp = yylloc;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];

  /* Default location.  */
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 235 "type.y" /* yacc.c:1663  */
    {
      (yyval.specifier) = null;
      DeclClass((yyvsp[-1].id)._class, (yyvsp[-1].id).string);
      fileInput.Seek((yylsp[-1]).start.pos, start);
      resetScannerPos(&(yylsp[-1]).start);
      yyclearin;

      FreeIdentifier((yyvsp[-1].id));

      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   }
#line 4491 "type.ec" /* yacc.c:1663  */
    break;

  case 3:
#line 253 "type.y" /* yacc.c:1663  */
    {
      (yyval.specifier) = null;
   #ifdef PRECOMPILER
      _DeclClass((yyvsp[-1].id)._class, (yyvsp[-1].id).string);

      FreeIdentifier((yyvsp[-1].id));

      fileInput.Seek((yylsp[-1]).start.pos, start);
      resetScannerPos(&(yylsp[-1]).start);
      yyclearin;

      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   #endif
   }
#line 4516 "type.ec" /* yacc.c:1663  */
    break;

  case 4:
#line 277 "type.y" /* yacc.c:1663  */
    {
      DeclClass((yyvsp[-1].id)._class, (yyvsp[-1].id).string);
      fileInput.Seek((yylsp[-1]).start.pos, start);
      parseTypeError = 0;
      resetScannerPos(&(yylsp[-1]).start);
      yyclearin;
      FreeIdentifier((yyvsp[-1].id));

      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   }
#line 4537 "type.ec" /* yacc.c:1663  */
    break;

  case 5:
#line 316 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = (yyvsp[0].specifier); }
#line 4543 "type.ec" /* yacc.c:1663  */
    break;

  case 6:
#line 318 "type.y" /* yacc.c:1663  */
    {
   #ifdef PRECOMPILER
      DeclClass((yyvsp[-1].id)._class, (yyvsp[-1].id).string);
      fileInput.Seek((yylsp[-1]).start.pos, start);
      resetScannerPos(&(yylsp[-1]).start);
      yyclearin;

      FreeIdentifier((yyvsp[-1].id));
      FreeIdentifier((yyvsp[0].id));

      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   #else
      Location tmpLoc = yylloc; (yyval.specifier) = (yyvsp[0].id); yylloc = (yylsp[-1]);
      Compiler_Error($"Not a type: %s\n", (yyvsp[-1].id).string);
      yylloc = tmpLoc; (yyvsp[0].id).badID = (yyvsp[-1].id); // FreeIdentifier($1);
   #endif
   }
#line 4571 "type.ec" /* yacc.c:1663  */
    break;

  case 7:
#line 344 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifierName(yytext); }
#line 4577 "type.ec" /* yacc.c:1663  */
    break;

  case 9:
#line 349 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = (yyvsp[-3].specifier); SetClassTemplateArgs((yyval.specifier), (yyvsp[-1].list)); (yyval.specifier).loc = (yyloc); }
#line 4583 "type.ec" /* yacc.c:1663  */
    break;

  case 10:
#line 351 "type.y" /* yacc.c:1663  */
    {
      (yyval.specifier) = (yyvsp[-3].specifier);
      SetClassTemplateArgs((yyval.specifier), (yyvsp[-1].list));
      (yyval.specifier).loc = (yyloc);

      (yylsp[0]).end.pos--;
      fileInput.Seek((yylsp[0]).end.pos, start);
      resetScannerPos(&(yylsp[0]).end);
      yyclearin;
    }
#line 4598 "type.ec" /* yacc.c:1663  */
    break;

  case 11:
#line 368 "type.y" /* yacc.c:1663  */
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); }
#line 4604 "type.ec" /* yacc.c:1663  */
    break;

  case 12:
#line 370 "type.y" /* yacc.c:1663  */
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); }
#line 4610 "type.ec" /* yacc.c:1663  */
    break;

  case 13:
#line 375 "type.y" /* yacc.c:1663  */
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[-2].list), FreeSpecifier); }
#line 4616 "type.ec" /* yacc.c:1663  */
    break;

  case 14:
#line 380 "type.y" /* yacc.c:1663  */
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[-2].list), FreeSpecifier); }
#line 4622 "type.ec" /* yacc.c:1663  */
    break;

  case 15:
#line 385 "type.y" /* yacc.c:1663  */
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); }
#line 4628 "type.ec" /* yacc.c:1663  */
    break;

  case 16:
#line 387 "type.y" /* yacc.c:1663  */
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); }
#line 4634 "type.ec" /* yacc.c:1663  */
    break;

  case 17:
#line 392 "type.y" /* yacc.c:1663  */
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[0]); }
#line 4640 "type.ec" /* yacc.c:1663  */
    break;

  case 19:
#line 398 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpBrackets((yyvsp[-1].list)); (yyval.exp).loc = (yyloc); }
#line 4646 "type.ec" /* yacc.c:1663  */
    break;

  case 20:
#line 403 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpIdentifier((yyvsp[0].id)); (yyval.exp).loc = (yyloc); }
#line 4652 "type.ec" /* yacc.c:1663  */
    break;

  case 21:
#line 405 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); }
#line 4658 "type.ec" /* yacc.c:1663  */
    break;

  case 22:
#line 407 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); }
#line 4664 "type.ec" /* yacc.c:1663  */
    break;

  case 23:
#line 408 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpWideString(yytext); (yyval.exp).loc = (yyloc); }
#line 4670 "type.ec" /* yacc.c:1663  */
    break;

  case 24:
#line 410 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpString((yyvsp[0].string)); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); }
#line 4676 "type.ec" /* yacc.c:1663  */
    break;

  case 25:
#line 411 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpIntlString((yyvsp[0].string), null); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); }
#line 4682 "type.ec" /* yacc.c:1663  */
    break;

  case 26:
#line 412 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpIntlString((yyvsp[0].string), (yyvsp[-2].string)); delete (yyvsp[-2].string); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); }
#line 4688 "type.ec" /* yacc.c:1663  */
    break;

  case 27:
#line 414 "type.y" /* yacc.c:1663  */
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[-1]).end; exp.loc.end = (yylsp[0]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); }
#line 4694 "type.ec" /* yacc.c:1663  */
    break;

  case 28:
#line 416 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); }
#line 4700 "type.ec" /* yacc.c:1663  */
    break;

  case 29:
#line 417 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); }
#line 4706 "type.ec" /* yacc.c:1663  */
    break;

  case 30:
#line 418 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); }
#line 4712 "type.ec" /* yacc.c:1663  */
    break;

  case 31:
#line 419 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); }
#line 4718 "type.ec" /* yacc.c:1663  */
    break;

  case 32:
#line 420 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpRenew((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); }
#line 4724 "type.ec" /* yacc.c:1663  */
    break;

  case 33:
#line 421 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpRenew((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); }
#line 4730 "type.ec" /* yacc.c:1663  */
    break;

  case 34:
#line 422 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpRenew0((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); }
#line 4736 "type.ec" /* yacc.c:1663  */
    break;

  case 35:
#line 423 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpRenew0((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); }
#line 4742 "type.ec" /* yacc.c:1663  */
    break;

  case 36:
#line 424 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpDummy(); }
#line 4748 "type.ec" /* yacc.c:1663  */
    break;

  case 38:
#line 429 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); }
#line 4754 "type.ec" /* yacc.c:1663  */
    break;

  case 39:
#line 430 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); }
#line 4760 "type.ec" /* yacc.c:1663  */
    break;

  case 40:
#line 431 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); }
#line 4766 "type.ec" /* yacc.c:1663  */
    break;

  case 41:
#line 432 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); }
#line 4772 "type.ec" /* yacc.c:1663  */
    break;

  case 42:
#line 434 "type.y" /* yacc.c:1663  */
    {
      char * constant = (yyvsp[-1].exp).type == constantExp ? (yyvsp[-1].exp).constant : null;
      int len = constant ? strlen(constant) : 0;
      if(constant && constant[len-1] == '.')
      {
         constant[len-1] = 0;
         (yyval.exp) = MkExpMember((yyvsp[-1].exp), (yyvsp[0].id));
         (yyval.exp).loc = (yyloc);
      }
      else
         yyerror();
   }
#line 4789 "type.ec" /* yacc.c:1663  */
    break;

  case 43:
#line 446 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); }
#line 4795 "type.ec" /* yacc.c:1663  */
    break;

  case 44:
#line 447 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); }
#line 4801 "type.ec" /* yacc.c:1663  */
    break;

  case 45:
#line 448 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); }
#line 4807 "type.ec" /* yacc.c:1663  */
    break;

  case 46:
#line 452 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); }
#line 4813 "type.ec" /* yacc.c:1663  */
    break;

  case 47:
#line 481 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); }
#line 4819 "type.ec" /* yacc.c:1663  */
    break;

  case 48:
#line 482 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); }
#line 4825 "type.ec" /* yacc.c:1663  */
    break;

  case 49:
#line 483 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  }
#line 4831 "type.ec" /* yacc.c:1663  */
    break;

  case 50:
#line 484 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  }
#line 4837 "type.ec" /* yacc.c:1663  */
    break;

  case 51:
#line 488 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4843 "type.ec" /* yacc.c:1663  */
    break;

  case 52:
#line 489 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4849 "type.ec" /* yacc.c:1663  */
    break;

  case 53:
#line 490 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4855 "type.ec" /* yacc.c:1663  */
    break;

  case 54:
#line 492 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4861 "type.ec" /* yacc.c:1663  */
    break;

  case 55:
#line 493 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpTypeSize((yyvsp[-1].typeName)); (yyval.exp).loc = (yyloc); }
#line 4867 "type.ec" /* yacc.c:1663  */
    break;

  case 56:
#line 495 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4873 "type.ec" /* yacc.c:1663  */
    break;

  case 57:
#line 496 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpTypeAlign((yyvsp[-1].typeName)); (yyval.exp).loc = (yyloc); }
#line 4879 "type.ec" /* yacc.c:1663  */
    break;

  case 60:
#line 510 "type.y" /* yacc.c:1663  */
    { (yyval.i) = '&'; }
#line 4885 "type.ec" /* yacc.c:1663  */
    break;

  case 61:
#line 511 "type.y" /* yacc.c:1663  */
    { (yyval.i) = '*'; }
#line 4891 "type.ec" /* yacc.c:1663  */
    break;

  case 62:
#line 512 "type.y" /* yacc.c:1663  */
    { (yyval.i) = '+'; }
#line 4897 "type.ec" /* yacc.c:1663  */
    break;

  case 63:
#line 513 "type.y" /* yacc.c:1663  */
    { (yyval.i) = '-'; }
#line 4903 "type.ec" /* yacc.c:1663  */
    break;

  case 64:
#line 514 "type.y" /* yacc.c:1663  */
    { (yyval.i) = '~'; }
#line 4909 "type.ec" /* yacc.c:1663  */
    break;

  case 65:
#line 515 "type.y" /* yacc.c:1663  */
    { (yyval.i) = '!'; }
#line 4915 "type.ec" /* yacc.c:1663  */
    break;

  case 66:
#line 516 "type.y" /* yacc.c:1663  */
    { (yyval.i) = DELETE; }
#line 4921 "type.ec" /* yacc.c:1663  */
    break;

  case 68:
#line 521 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpCast((yyvsp[-2].typeName), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4927 "type.ec" /* yacc.c:1663  */
    break;

  case 70:
#line 526 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4933 "type.ec" /* yacc.c:1663  */
    break;

  case 71:
#line 527 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4939 "type.ec" /* yacc.c:1663  */
    break;

  case 72:
#line 528 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4945 "type.ec" /* yacc.c:1663  */
    break;

  case 74:
#line 533 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4951 "type.ec" /* yacc.c:1663  */
    break;

  case 75:
#line 534 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4957 "type.ec" /* yacc.c:1663  */
    break;

  case 77:
#line 539 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4963 "type.ec" /* yacc.c:1663  */
    break;

  case 78:
#line 540 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4969 "type.ec" /* yacc.c:1663  */
    break;

  case 79:
#line 545 "type.y" /* yacc.c:1663  */
    {
      (yyval.exp) = (yyvsp[-1].exp);
      skipErrors = true;
   }
#line 4978 "type.ec" /* yacc.c:1663  */
    break;

  case 81:
#line 553 "type.y" /* yacc.c:1663  */
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[-1].exp), '<', (yyvsp[0].exp)/*$3*/); (yyval.exp).loc = (yyloc); }
#line 4984 "type.ec" /* yacc.c:1663  */
    break;

  case 82:
#line 554 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4990 "type.ec" /* yacc.c:1663  */
    break;

  case 83:
#line 555 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4996 "type.ec" /* yacc.c:1663  */
    break;

  case 84:
#line 556 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 5002 "type.ec" /* yacc.c:1663  */
    break;

  case 86:
#line 561 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 5008 "type.ec" /* yacc.c:1663  */
    break;

  case 87:
#line 562 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 5014 "type.ec" /* yacc.c:1663  */
    break;

  case 89:
#line 567 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 5020 "type.ec" /* yacc.c:1663  */
    break;

  case 91:
#line 572 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 5026 "type.ec" /* yacc.c:1663  */
    break;

  case 93:
#line 577 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 5032 "type.ec" /* yacc.c:1663  */
    break;

  case 95:
#line 582 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 5038 "type.ec" /* yacc.c:1663  */
    break;

  case 97:
#line 587 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 5044 "type.ec" /* yacc.c:1663  */
    break;

  case 99:
#line 592 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 5050 "type.ec" /* yacc.c:1663  */
    break;

  case 101:
#line 597 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 5056 "type.ec" /* yacc.c:1663  */
    break;

  case 102:
#line 598 "type.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 5062 "type.ec" /* yacc.c:1663  */
    break;

  case 103:
#line 602 "type.y" /* yacc.c:1663  */
    { (yyval.i) = '='; }
#line 5068 "type.ec" /* yacc.c:1663  */
    break;

  case 104:
#line 603 "type.y" /* yacc.c:1663  */
    { (yyval.i) = MUL_ASSIGN; }
#line 5074 "type.ec" /* yacc.c:1663  */
    break;

  case 105:
#line 604 "type.y" /* yacc.c:1663  */
    { (yyval.i) = DIV_ASSIGN; }
#line 5080 "type.ec" /* yacc.c:1663  */
    break;

  case 106:
#line 605 "type.y" /* yacc.c:1663  */
    { (yyval.i) = MOD_ASSIGN; }
#line 5086 "type.ec" /* yacc.c:1663  */
    break;

  case 107:
#line 606 "type.y" /* yacc.c:1663  */
    { (yyval.i) = ADD_ASSIGN; }
#line 5092 "type.ec" /* yacc.c:1663  */
    break;

  case 108:
#line 607 "type.y" /* yacc.c:1663  */
    { (yyval.i) = SUB_ASSIGN; }
#line 5098 "type.ec" /* yacc.c:1663  */
    break;

  case 109:
#line 608 "type.y" /* yacc.c:1663  */
    { (yyval.i) = LEFT_ASSIGN; }
#line 5104 "type.ec" /* yacc.c:1663  */
    break;

  case 110:
#line 609 "type.y" /* yacc.c:1663  */
    { (yyval.i) = RIGHT_ASSIGN; }
#line 5110 "type.ec" /* yacc.c:1663  */
    break;

  case 111:
#line 610 "type.y" /* yacc.c:1663  */
    { (yyval.i) = AND_ASSIGN; }
#line 5116 "type.ec" /* yacc.c:1663  */
    break;

  case 112:
#line 611 "type.y" /* yacc.c:1663  */
    { (yyval.i) = XOR_ASSIGN; }
#line 5122 "type.ec" /* yacc.c:1663  */
    break;

  case 113:
#line 612 "type.y" /* yacc.c:1663  */
    { (yyval.i) = OR_ASSIGN; }
#line 5128 "type.ec" /* yacc.c:1663  */
    break;

  case 114:
#line 616 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); }
#line 5134 "type.ec" /* yacc.c:1663  */
    break;

  case 115:
#line 617 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); }
#line 5140 "type.ec" /* yacc.c:1663  */
    break;

  case 117:
#line 625 "type.y" /* yacc.c:1663  */
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); }
#line 5146 "type.ec" /* yacc.c:1663  */
    break;

  case 118:
#line 626 "type.y" /* yacc.c:1663  */
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); }
#line 5152 "type.ec" /* yacc.c:1663  */
    break;

  case 119:
#line 627 "type.y" /* yacc.c:1663  */
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); }
#line 5158 "type.ec" /* yacc.c:1663  */
    break;

  case 120:
#line 628 "type.y" /* yacc.c:1663  */
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[-3].id), (yyvsp[-1].exp)); (yyval.declaration).loc = (yyloc); }
#line 5164 "type.ec" /* yacc.c:1663  */
    break;

  case 121:
#line 632 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5170 "type.ec" /* yacc.c:1663  */
    break;

  case 122:
#line 633 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5176 "type.ec" /* yacc.c:1663  */
    break;

  case 123:
#line 634 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5182 "type.ec" /* yacc.c:1663  */
    break;

  case 124:
#line 635 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5188 "type.ec" /* yacc.c:1663  */
    break;

  case 125:
#line 636 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5194 "type.ec" /* yacc.c:1663  */
    break;

  case 126:
#line 637 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5200 "type.ec" /* yacc.c:1663  */
    break;

  case 127:
#line 638 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5206 "type.ec" /* yacc.c:1663  */
    break;

  case 128:
#line 639 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5212 "type.ec" /* yacc.c:1663  */
    break;

  case 129:
#line 643 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5218 "type.ec" /* yacc.c:1663  */
    break;

  case 130:
#line 644 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5224 "type.ec" /* yacc.c:1663  */
    break;

  case 131:
#line 645 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5230 "type.ec" /* yacc.c:1663  */
    break;

  case 132:
#line 646 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5236 "type.ec" /* yacc.c:1663  */
    break;

  case 133:
#line 647 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5242 "type.ec" /* yacc.c:1663  */
    break;

  case 134:
#line 648 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5248 "type.ec" /* yacc.c:1663  */
    break;

  case 135:
#line 649 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5254 "type.ec" /* yacc.c:1663  */
    break;

  case 136:
#line 650 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5260 "type.ec" /* yacc.c:1663  */
    break;

  case 137:
#line 651 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5266 "type.ec" /* yacc.c:1663  */
    break;

  case 138:
#line 652 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5272 "type.ec" /* yacc.c:1663  */
    break;

  case 139:
#line 656 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5278 "type.ec" /* yacc.c:1663  */
    break;

  case 140:
#line 657 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5284 "type.ec" /* yacc.c:1663  */
    break;

  case 141:
#line 658 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5290 "type.ec" /* yacc.c:1663  */
    break;

  case 142:
#line 659 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5296 "type.ec" /* yacc.c:1663  */
    break;

  case 143:
#line 660 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5302 "type.ec" /* yacc.c:1663  */
    break;

  case 144:
#line 661 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5308 "type.ec" /* yacc.c:1663  */
    break;

  case 145:
#line 662 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5314 "type.ec" /* yacc.c:1663  */
    break;

  case 146:
#line 663 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5320 "type.ec" /* yacc.c:1663  */
    break;

  case 147:
#line 664 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5326 "type.ec" /* yacc.c:1663  */
    break;

  case 148:
#line 665 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5332 "type.ec" /* yacc.c:1663  */
    break;

  case 149:
#line 669 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5338 "type.ec" /* yacc.c:1663  */
    break;

  case 150:
#line 670 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5344 "type.ec" /* yacc.c:1663  */
    break;

  case 151:
#line 671 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5350 "type.ec" /* yacc.c:1663  */
    break;

  case 152:
#line 672 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5356 "type.ec" /* yacc.c:1663  */
    break;

  case 153:
#line 673 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5362 "type.ec" /* yacc.c:1663  */
    break;

  case 154:
#line 674 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5368 "type.ec" /* yacc.c:1663  */
    break;

  case 155:
#line 675 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5374 "type.ec" /* yacc.c:1663  */
    break;

  case 156:
#line 676 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5380 "type.ec" /* yacc.c:1663  */
    break;

  case 157:
#line 677 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5386 "type.ec" /* yacc.c:1663  */
    break;

  case 158:
#line 678 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5392 "type.ec" /* yacc.c:1663  */
    break;

  case 159:
#line 679 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5398 "type.ec" /* yacc.c:1663  */
    break;

  case 160:
#line 680 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5404 "type.ec" /* yacc.c:1663  */
    break;

  case 161:
#line 684 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[0].list); }
#line 5410 "type.ec" /* yacc.c:1663  */
    break;

  case 162:
#line 685 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5416 "type.ec" /* yacc.c:1663  */
    break;

  case 163:
#line 689 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5422 "type.ec" /* yacc.c:1663  */
    break;

  case 164:
#line 690 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5428 "type.ec" /* yacc.c:1663  */
    break;

  case 165:
#line 691 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5434 "type.ec" /* yacc.c:1663  */
    break;

  case 166:
#line 692 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5440 "type.ec" /* yacc.c:1663  */
    break;

  case 167:
#line 693 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5446 "type.ec" /* yacc.c:1663  */
    break;

  case 168:
#line 694 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5452 "type.ec" /* yacc.c:1663  */
    break;

  case 169:
#line 695 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); }
#line 5458 "type.ec" /* yacc.c:1663  */
    break;

  case 170:
#line 696 "type.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); }
#line 5464 "type.ec" /* yacc.c:1663  */
    break;

  case 171:
#line 698 "type.y" /* yacc.c:1663  */
    {
         _DeclClass((yyvsp[-3].id)._class, (yyvsp[-3].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[-3].id).string, (yyvsp[-1].list)));
         FreeIdentifier((yyvsp[-3].id));
      }
#line 5476 "type.ec" /* yacc.c:1663  */
    break;

  case 172:
#line 706 "type.y" /* yacc.c:1663  */
    {
         _DeclClass((yyvsp[-3].id)._class, (yyvsp[-3].id).string);
         ListAdd((yyvsp[-4].list), MkSpecifierNameArgs((yyvsp[-3].id).string, (yyvsp[-1].list)));
         FreeIdentifier((yyvsp[-3].id));
      }
#line 5486 "type.ec" /* yacc.c:1663  */
    break;

  case 173:
#line 714 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5492 "type.ec" /* yacc.c:1663  */
    break;

  case 174:
#line 715 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5498 "type.ec" /* yacc.c:1663  */
    break;

  case 175:
#line 716 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5504 "type.ec" /* yacc.c:1663  */
    break;

  case 176:
#line 717 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5510 "type.ec" /* yacc.c:1663  */
    break;

  case 177:
#line 718 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5516 "type.ec" /* yacc.c:1663  */
    break;

  case 178:
#line 719 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5522 "type.ec" /* yacc.c:1663  */
    break;

  case 179:
#line 720 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5528 "type.ec" /* yacc.c:1663  */
    break;

  case 180:
#line 721 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5534 "type.ec" /* yacc.c:1663  */
    break;

  case 181:
#line 722 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5540 "type.ec" /* yacc.c:1663  */
    break;

  case 182:
#line 723 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 5546 "type.ec" /* yacc.c:1663  */
    break;

  case 183:
#line 724 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); }
#line 5552 "type.ec" /* yacc.c:1663  */
    break;

  case 184:
#line 725 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), MkSpecifierName((yyvsp[0].id).string)); FreeIdentifier((yyvsp[0].id)); }
#line 5558 "type.ec" /* yacc.c:1663  */
    break;

  case 185:
#line 727 "type.y" /* yacc.c:1663  */
    {
         _DeclClass((yyvsp[-3].id)._class, (yyvsp[-3].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[-3].id).string, (yyvsp[-1].list)));
         FreeIdentifier((yyvsp[-3].id));
      }
#line 5570 "type.ec" /* yacc.c:1663  */
    break;

  case 186:
#line 735 "type.y" /* yacc.c:1663  */
    {
         _DeclClass((yyvsp[-3].id)._class, (yyvsp[-3].id).string);
         ListAdd((yyvsp[-4].list), MkSpecifierNameArgs((yyvsp[-3].id).string, (yyvsp[-1].list)));
         FreeIdentifier((yyvsp[-3].id));
      }
#line 5580 "type.ec" /* yacc.c:1663  */
    break;

  case 187:
#line 743 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initDeclarator)); }
#line 5586 "type.ec" /* yacc.c:1663  */
    break;

  case 188:
#line 744 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); }
#line 5592 "type.ec" /* yacc.c:1663  */
    break;

  case 189:
#line 748 "type.y" /* yacc.c:1663  */
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[0].declarator), null); (yyval.initDeclarator).loc = (yyloc); }
#line 5598 "type.ec" /* yacc.c:1663  */
    break;

  case 190:
#line 749 "type.y" /* yacc.c:1663  */
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), (yyvsp[0].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[-1]).end; }
#line 5604 "type.ec" /* yacc.c:1663  */
    break;

  case 191:
#line 753 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(TYPEDEF); }
#line 5610 "type.ec" /* yacc.c:1663  */
    break;

  case 192:
#line 754 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(EXTERN); }
#line 5616 "type.ec" /* yacc.c:1663  */
    break;

  case 193:
#line 755 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(STATIC); }
#line 5622 "type.ec" /* yacc.c:1663  */
    break;

  case 194:
#line 756 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(AUTO); }
#line 5628 "type.ec" /* yacc.c:1663  */
    break;

  case 195:
#line 757 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(REGISTER); }
#line 5634 "type.ec" /* yacc.c:1663  */
    break;

  case 196:
#line 758 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(THREAD); }
#line 5640 "type.ec" /* yacc.c:1663  */
    break;

  case 197:
#line 762 "type.y" /* yacc.c:1663  */
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); }
#line 5646 "type.ec" /* yacc.c:1663  */
    break;

  case 198:
#line 763 "type.y" /* yacc.c:1663  */
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); }
#line 5652 "type.ec" /* yacc.c:1663  */
    break;

  case 199:
#line 764 "type.y" /* yacc.c:1663  */
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[0].attrib)); }
#line 5658 "type.ec" /* yacc.c:1663  */
    break;

  case 200:
#line 765 "type.y" /* yacc.c:1663  */
    { (yyval.extDecl) = MkExtDeclMultiAttrib((yyvsp[0].list)); }
#line 5664 "type.ec" /* yacc.c:1663  */
    break;

  case 201:
#line 769 "type.y" /* yacc.c:1663  */
    { (yyval.i) = ATTRIB; }
#line 5670 "type.ec" /* yacc.c:1663  */
    break;

  case 202:
#line 770 "type.y" /* yacc.c:1663  */
    { (yyval.i) = ATTRIB_DEP; }
#line 5676 "type.ec" /* yacc.c:1663  */
    break;

  case 203:
#line 771 "type.y" /* yacc.c:1663  */
    { (yyval.i) = __ATTRIB; }
#line 5682 "type.ec" /* yacc.c:1663  */
    break;

  case 204:
#line 775 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkListOne((yyvsp[0].attrib)); }
#line 5688 "type.ec" /* yacc.c:1663  */
    break;

  case 205:
#line 776 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].attrib)); }
#line 5694 "type.ec" /* yacc.c:1663  */
    break;

  case 206:
#line 779 "type.y" /* yacc.c:1663  */
    { (yyval.string)  = CopyString(yytext); }
#line 5700 "type.ec" /* yacc.c:1663  */
    break;

  case 207:
#line 780 "type.y" /* yacc.c:1663  */
    { (yyval.string)  = CopyString(yytext); }
#line 5706 "type.ec" /* yacc.c:1663  */
    break;

  case 208:
#line 781 "type.y" /* yacc.c:1663  */
    { (yyval.string)  = CopyString(yytext); }
#line 5712 "type.ec" /* yacc.c:1663  */
    break;

  case 209:
#line 782 "type.y" /* yacc.c:1663  */
    { (yyval.string)  = CopyString(yytext); }
#line 5718 "type.ec" /* yacc.c:1663  */
    break;

  case 210:
#line 783 "type.y" /* yacc.c:1663  */
    { (yyval.string)  = CopyString(yytext); }
#line 5724 "type.ec" /* yacc.c:1663  */
    break;

  case 211:
#line 787 "type.y" /* yacc.c:1663  */
    { (yyval.attribute) = MkAttribute((yyvsp[0].string), null); (yyval.attribute).loc = (yyloc); }
#line 5730 "type.ec" /* yacc.c:1663  */
    break;

  case 212:
#line 788 "type.y" /* yacc.c:1663  */
    { (yyval.attribute) = MkAttribute((yyvsp[-3].string), MkExpBrackets((yyvsp[-1].list))); (yyval.attribute).loc = (yyloc); }
#line 5736 "type.ec" /* yacc.c:1663  */
    break;

  case 213:
#line 792 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkListOne((yyvsp[0].attribute)); }
#line 5742 "type.ec" /* yacc.c:1663  */
    break;

  case 214:
#line 793 "type.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-1].list), (yyvsp[0].attribute)); (yyval.list) = (yyvsp[-1].list); }
#line 5748 "type.ec" /* yacc.c:1663  */
    break;

  case 215:
#line 794 "type.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-2].list), (yyvsp[0].attribute)); (yyval.list) = (yyvsp[-2].list); }
#line 5754 "type.ec" /* yacc.c:1663  */
    break;

  case 216:
#line 798 "type.y" /* yacc.c:1663  */
    { (yyval.attrib) = MkAttrib((yyvsp[-5].i), (yyvsp[-2].list)); (yyval.attrib).loc = (yyloc); }
#line 5760 "type.ec" /* yacc.c:1663  */
    break;

  case 217:
#line 799 "type.y" /* yacc.c:1663  */
    { (yyval.attrib) = MkAttrib((yyvsp[-4].i), null); (yyval.attrib).loc = (yyloc); }
#line 5766 "type.ec" /* yacc.c:1663  */
    break;

  case 218:
#line 803 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[0].extDecl)); }
#line 5772 "type.ec" /* yacc.c:1663  */
    break;

  case 219:
#line 807 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(CONST); }
#line 5778 "type.ec" /* yacc.c:1663  */
    break;

  case 220:
#line 808 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(VOLATILE); }
#line 5784 "type.ec" /* yacc.c:1663  */
    break;

  case 221:
#line 809 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = (yyvsp[0].specifier); }
#line 5790 "type.ec" /* yacc.c:1663  */
    break;

  case 222:
#line 814 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(VOID); }
#line 5796 "type.ec" /* yacc.c:1663  */
    break;

  case 223:
#line 815 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(CHAR); }
#line 5802 "type.ec" /* yacc.c:1663  */
    break;

  case 224:
#line 816 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(SHORT); }
#line 5808 "type.ec" /* yacc.c:1663  */
    break;

  case 225:
#line 817 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(INT); }
#line 5814 "type.ec" /* yacc.c:1663  */
    break;

  case 226:
#line 818 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(UINT); }
#line 5820 "type.ec" /* yacc.c:1663  */
    break;

  case 227:
#line 819 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(INT64); }
#line 5826 "type.ec" /* yacc.c:1663  */
    break;

  case 228:
#line 820 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(INT128); }
#line 5832 "type.ec" /* yacc.c:1663  */
    break;

  case 229:
#line 821 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(FLOAT128); }
#line 5838 "type.ec" /* yacc.c:1663  */
    break;

  case 230:
#line 822 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(VALIST); }
#line 5844 "type.ec" /* yacc.c:1663  */
    break;

  case 231:
#line 823 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(LONG); }
#line 5850 "type.ec" /* yacc.c:1663  */
    break;

  case 232:
#line 824 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(FLOAT); }
#line 5856 "type.ec" /* yacc.c:1663  */
    break;

  case 233:
#line 825 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(DOUBLE); }
#line 5862 "type.ec" /* yacc.c:1663  */
    break;

  case 234:
#line 826 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(SIGNED); }
#line 5868 "type.ec" /* yacc.c:1663  */
    break;

  case 235:
#line 827 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(UNSIGNED); }
#line 5874 "type.ec" /* yacc.c:1663  */
    break;

  case 236:
#line 828 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(EXTENSION); }
#line 5880 "type.ec" /* yacc.c:1663  */
    break;

  case 237:
#line 829 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(_BOOL); }
#line 5886 "type.ec" /* yacc.c:1663  */
    break;

  case 238:
#line 830 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(BOOL); }
#line 5892 "type.ec" /* yacc.c:1663  */
    break;

  case 242:
#line 834 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[-1].exp)); }
#line 5898 "type.ec" /* yacc.c:1663  */
    break;

  case 243:
#line 835 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); }
#line 5904 "type.ec" /* yacc.c:1663  */
    break;

  case 244:
#line 836 "type.y" /* yacc.c:1663  */
    { _DeclClass((yyvsp[-1].id)._class, (yyvsp[-1].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[-1].id).string)); FreeIdentifier((yyvsp[-1].id)); }
#line 5910 "type.ec" /* yacc.c:1663  */
    break;

  case 245:
#line 837 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(THISCLASS); }
#line 5916 "type.ec" /* yacc.c:1663  */
    break;

  case 246:
#line 838 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); }
#line 5922 "type.ec" /* yacc.c:1663  */
    break;

  case 247:
#line 839 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); }
#line 5928 "type.ec" /* yacc.c:1663  */
    break;

  case 248:
#line 843 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(VOID); }
#line 5934 "type.ec" /* yacc.c:1663  */
    break;

  case 249:
#line 844 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(CHAR); }
#line 5940 "type.ec" /* yacc.c:1663  */
    break;

  case 250:
#line 845 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(SHORT); }
#line 5946 "type.ec" /* yacc.c:1663  */
    break;

  case 251:
#line 846 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(INT); }
#line 5952 "type.ec" /* yacc.c:1663  */
    break;

  case 252:
#line 847 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(UINT); }
#line 5958 "type.ec" /* yacc.c:1663  */
    break;

  case 253:
#line 848 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(INT64); }
#line 5964 "type.ec" /* yacc.c:1663  */
    break;

  case 254:
#line 849 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(INT128); }
#line 5970 "type.ec" /* yacc.c:1663  */
    break;

  case 255:
#line 850 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(FLOAT128); }
#line 5976 "type.ec" /* yacc.c:1663  */
    break;

  case 256:
#line 851 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(VALIST); }
#line 5982 "type.ec" /* yacc.c:1663  */
    break;

  case 257:
#line 852 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(LONG); }
#line 5988 "type.ec" /* yacc.c:1663  */
    break;

  case 258:
#line 853 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(FLOAT); }
#line 5994 "type.ec" /* yacc.c:1663  */
    break;

  case 259:
#line 854 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(DOUBLE); }
#line 6000 "type.ec" /* yacc.c:1663  */
    break;

  case 260:
#line 855 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(SIGNED); }
#line 6006 "type.ec" /* yacc.c:1663  */
    break;

  case 261:
#line 856 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(UNSIGNED); }
#line 6012 "type.ec" /* yacc.c:1663  */
    break;

  case 262:
#line 857 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(EXTENSION); }
#line 6018 "type.ec" /* yacc.c:1663  */
    break;

  case 263:
#line 858 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(_BOOL); }
#line 6024 "type.ec" /* yacc.c:1663  */
    break;

  case 264:
#line 859 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(BOOL); }
#line 6030 "type.ec" /* yacc.c:1663  */
    break;

  case 268:
#line 863 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[-1].exp)); }
#line 6036 "type.ec" /* yacc.c:1663  */
    break;

  case 269:
#line 864 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); }
#line 6042 "type.ec" /* yacc.c:1663  */
    break;

  case 270:
#line 865 "type.y" /* yacc.c:1663  */
    { _DeclClass((yyvsp[-1].id)._class, (yyvsp[-1].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[-1].id).string)); FreeIdentifier((yyvsp[-1].id)); }
#line 6048 "type.ec" /* yacc.c:1663  */
    break;

  case 271:
#line 866 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(THISCLASS); }
#line 6054 "type.ec" /* yacc.c:1663  */
    break;

  case 272:
#line 871 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), (yyvsp[-3].id), (yyvsp[-1].list)); if(declMode) DeclClass((yyvsp[-3].id)._class, (yyvsp[-3].id).string); }
#line 6060 "type.ec" /* yacc.c:1663  */
    break;

  case 273:
#line 872 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), null, (yyvsp[-1].list)); }
#line 6066 "type.ec" /* yacc.c:1663  */
    break;

  case 274:
#line 873 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), (yyvsp[-2].id), null); if(declMode) DeclClass((yyvsp[-2].id)._class, (yyvsp[-2].id).string); }
#line 6072 "type.ec" /* yacc.c:1663  */
    break;

  case 275:
#line 874 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); }
#line 6078 "type.ec" /* yacc.c:1663  */
    break;

  case 276:
#line 876 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); if(declMode) DeclClass((yyvsp[-3].specifier).nsSpec, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); }
#line 6084 "type.ec" /* yacc.c:1663  */
    break;

  case 277:
#line 878 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-5].specifierType), (yyvsp[-3].id), (yyvsp[-1].list)); (yyval.specifier).extDeclStruct = (yyvsp[-4].extDecl); if(declMode) DeclClass((yyvsp[-3].id)._class, (yyvsp[-3].id).string); }
#line 6090 "type.ec" /* yacc.c:1663  */
    break;

  case 278:
#line 879 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), null, (yyvsp[-1].list)); (yyval.specifier).extDeclStruct = (yyvsp[-3].extDecl); }
#line 6096 "type.ec" /* yacc.c:1663  */
    break;

  case 279:
#line 880 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), (yyvsp[-2].id), null); (yyval.specifier).extDeclStruct = (yyvsp[-3].extDecl); if(declMode) DeclClass((yyvsp[-2].id)._class, (yyvsp[-2].id).string); }
#line 6102 "type.ec" /* yacc.c:1663  */
    break;

  case 280:
#line 881 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[-2].extDecl); }
#line 6108 "type.ec" /* yacc.c:1663  */
    break;

  case 281:
#line 883 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-5].specifierType), MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); (yyval.specifier).extDeclStruct = (yyvsp[-4].extDecl); if(declMode) DeclClass((yyvsp[-3].specifier).nsSpec, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); }
#line 6114 "type.ec" /* yacc.c:1663  */
    break;

  case 282:
#line 887 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), (yyvsp[0].id), null); if(declMode) DeclClass((yyvsp[0].id)._class, (yyvsp[0].id).string); }
#line 6120 "type.ec" /* yacc.c:1663  */
    break;

  case 283:
#line 889 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), MkIdentifier((yyvsp[0].specifier).name), null); if(declMode) DeclClass((yyvsp[0].specifier).nsSpec, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); }
#line 6126 "type.ec" /* yacc.c:1663  */
    break;

  case 284:
#line 892 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), (yyvsp[0].id), null); (yyval.specifier).extDeclStruct = (yyvsp[-1].extDecl);if(declMode) DeclClass((yyvsp[0].id)._class, (yyvsp[0].id).string); }
#line 6132 "type.ec" /* yacc.c:1663  */
    break;

  case 285:
#line 894 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), MkIdentifier((yyvsp[0].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[-1].extDecl); if(declMode) DeclClass((yyvsp[0].specifier).nsSpec, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); }
#line 6138 "type.ec" /* yacc.c:1663  */
    break;

  case 286:
#line 898 "type.y" /* yacc.c:1663  */
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[0].list), null); }
#line 6144 "type.ec" /* yacc.c:1663  */
    break;

  case 287:
#line 899 "type.y" /* yacc.c:1663  */
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[-1].list), (yyvsp[0].declarator)); }
#line 6150 "type.ec" /* yacc.c:1663  */
    break;

  case 288:
#line 904 "type.y" /* yacc.c:1663  */
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[0].list), null)); }
#line 6156 "type.ec" /* yacc.c:1663  */
    break;

  case 289:
#line 905 "type.y" /* yacc.c:1663  */
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[-1].list), (yyvsp[0].declarator))); }
#line 6162 "type.ec" /* yacc.c:1663  */
    break;

  case 290:
#line 916 "type.y" /* yacc.c:1663  */
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[0].exp)); }
#line 6168 "type.ec" /* yacc.c:1663  */
    break;

  case 293:
#line 923 "type.y" /* yacc.c:1663  */
    { (yyval.templateArgument) = (yyvsp[0].templateArgument); (yyval.templateArgument).name = (yyvsp[-2].id); (yyval.templateArgument).loc = (yyloc); }
#line 6174 "type.ec" /* yacc.c:1663  */
    break;

  case 294:
#line 925 "type.y" /* yacc.c:1663  */
    { (yyval.templateArgument) = (yyvsp[0].templateArgument); (yyval.templateArgument).name = (yyvsp[-2].id); (yyval.templateArgument).loc = (yyloc); }
#line 6180 "type.ec" /* yacc.c:1663  */
    break;

  case 295:
#line 927 "type.y" /* yacc.c:1663  */
    {
      (yyval.templateArgument) = (yyvsp[0].templateArgument);
      if((yyvsp[-2].templateDatatype).specifiers && (yyvsp[-2].templateDatatype).specifiers->first)
      {
         Specifier spec = (yyvsp[-2].templateDatatype).specifiers->first;
         if(spec.type == nameSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.name);
         else if(spec.type == templateTypeSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.templateParameter.identifier.string);
      }
      FreeTemplateDataType((yyvsp[-2].templateDatatype));
      (yyval.templateArgument).loc = (yyloc);
   }
#line 6198 "type.ec" /* yacc.c:1663  */
    break;

  case 296:
#line 953 "type.y" /* yacc.c:1663  */
    {
      (yyval.templateArgument) = (yyvsp[0].templateArgument);
      if((yyvsp[-2].templateDatatype).specifiers && (yyvsp[-2].templateDatatype).specifiers->first)
      {
         Specifier spec = (yyvsp[-2].templateDatatype).specifiers->first;
         if(spec.type == nameSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.name);
         else if(spec.type == templateTypeSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.templateParameter.identifier.string);
      }
      FreeTemplateDataType((yyvsp[-2].templateDatatype));
      (yyval.templateArgument).loc = (yyloc);
   }
#line 6216 "type.ec" /* yacc.c:1663  */
    break;

  case 297:
#line 969 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].templateArgument)); }
#line 6222 "type.ec" /* yacc.c:1663  */
    break;

  case 298:
#line 970 "type.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-2].list), (yyvsp[0].templateArgument)); }
#line 6228 "type.ec" /* yacc.c:1663  */
    break;

  case 299:
#line 974 "type.y" /* yacc.c:1663  */
    { (yyval.specifierType) = structSpecifier; }
#line 6234 "type.ec" /* yacc.c:1663  */
    break;

  case 300:
#line 975 "type.y" /* yacc.c:1663  */
    { (yyval.specifierType) = unionSpecifier; }
#line 6240 "type.ec" /* yacc.c:1663  */
    break;

  case 301:
#line 979 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].classDef)); }
#line 6246 "type.ec" /* yacc.c:1663  */
    break;

  case 302:
#line 980 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].classDef)); }
#line 6252 "type.ec" /* yacc.c:1663  */
    break;

  case 303:
#line 984 "type.y" /* yacc.c:1663  */
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); }
#line 6258 "type.ec" /* yacc.c:1663  */
    break;

  case 304:
#line 988 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); }
#line 6264 "type.ec" /* yacc.c:1663  */
    break;

  case 305:
#line 989 "type.y" /* yacc.c:1663  */
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); (yyval.list) = (yyvsp[-2].list); }
#line 6270 "type.ec" /* yacc.c:1663  */
    break;

  case 306:
#line 994 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-7].list), null, (yyvsp[-6].id), (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); }
#line 6276 "type.ec" /* yacc.c:1663  */
    break;

  case 307:
#line 996 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-7].list), null, (yyvsp[-6].id), (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); }
#line 6282 "type.ec" /* yacc.c:1663  */
    break;

  case 308:
#line 998 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-5].list), null, (yyvsp[-4].id), (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); }
#line 6288 "type.ec" /* yacc.c:1663  */
    break;

  case 309:
#line 1000 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-5].list), null, (yyvsp[-4].id), null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); }
#line 6294 "type.ec" /* yacc.c:1663  */
    break;

  case 310:
#line 1002 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-3].list), null, (yyvsp[-2].id), null, null); (yyval.prop).loc = (yyloc); }
#line 6300 "type.ec" /* yacc.c:1663  */
    break;

  case 311:
#line 1005 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-8].list), (yyvsp[-7].declarator), (yyvsp[-6].id), (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); }
#line 6306 "type.ec" /* yacc.c:1663  */
    break;

  case 312:
#line 1007 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-8].list), (yyvsp[-7].declarator), (yyvsp[-6].id), (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); }
#line 6312 "type.ec" /* yacc.c:1663  */
    break;

  case 313:
#line 1009 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-6].list), (yyvsp[-5].declarator), (yyvsp[-4].id), (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); }
#line 6318 "type.ec" /* yacc.c:1663  */
    break;

  case 314:
#line 1011 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-6].list), (yyvsp[-5].declarator), (yyvsp[-4].id), null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); }
#line 6324 "type.ec" /* yacc.c:1663  */
    break;

  case 315:
#line 1013 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-4].list), (yyvsp[-3].declarator), (yyvsp[-2].id), null, null); (yyval.prop).loc = (yyloc); }
#line 6330 "type.ec" /* yacc.c:1663  */
    break;

  case 316:
#line 1016 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-6].list), null, null, (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); }
#line 6336 "type.ec" /* yacc.c:1663  */
    break;

  case 317:
#line 1018 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-6].list), null, null, (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); }
#line 6342 "type.ec" /* yacc.c:1663  */
    break;

  case 318:
#line 1020 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-4].list), null, null, (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); }
#line 6348 "type.ec" /* yacc.c:1663  */
    break;

  case 319:
#line 1022 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-4].list), null, null, null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); }
#line 6354 "type.ec" /* yacc.c:1663  */
    break;

  case 320:
#line 1024 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-2].list), null, null, null, null); (yyval.prop).loc = (yyloc); }
#line 6360 "type.ec" /* yacc.c:1663  */
    break;

  case 321:
#line 1027 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-7].list), (yyvsp[-6].declarator), null, (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); }
#line 6366 "type.ec" /* yacc.c:1663  */
    break;

  case 322:
#line 1029 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-7].list), (yyvsp[-6].declarator), null, (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); }
#line 6372 "type.ec" /* yacc.c:1663  */
    break;

  case 323:
#line 1031 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-5].list), (yyvsp[-4].declarator), null, (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); }
#line 6378 "type.ec" /* yacc.c:1663  */
    break;

  case 324:
#line 1033 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-5].list), (yyvsp[-4].declarator), null, null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); }
#line 6384 "type.ec" /* yacc.c:1663  */
    break;

  case 325:
#line 1035 "type.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-3].list), (yyvsp[-2].declarator), null, null, null); (yyval.prop).loc = (yyloc); }
#line 6390 "type.ec" /* yacc.c:1663  */
    break;

  case 326:
#line 1039 "type.y" /* yacc.c:1663  */
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); }
#line 6396 "type.ec" /* yacc.c:1663  */
    break;

  case 327:
#line 1040 "type.y" /* yacc.c:1663  */
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-1].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); }
#line 6402 "type.ec" /* yacc.c:1663  */
    break;

  case 328:
#line 1041 "type.y" /* yacc.c:1663  */
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); }
#line 6408 "type.ec" /* yacc.c:1663  */
    break;

  case 329:
#line 1042 "type.y" /* yacc.c:1663  */
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); }
#line 6414 "type.ec" /* yacc.c:1663  */
    break;

  case 330:
#line 1043 "type.y" /* yacc.c:1663  */
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc); }
#line 6420 "type.ec" /* yacc.c:1663  */
    break;

  case 331:
#line 1044 "type.y" /* yacc.c:1663  */
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[-1].list)); if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; (yyval.classDef).loc = (yyloc); }
#line 6426 "type.ec" /* yacc.c:1663  */
    break;

  case 332:
#line 1045 "type.y" /* yacc.c:1663  */
    { (yyval.classDef) = MkClassDefProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); }
#line 6432 "type.ec" /* yacc.c:1663  */
    break;

  case 333:
#line 1046 "type.y" /* yacc.c:1663  */
    { (yyval.classDef) = null; }
#line 6438 "type.ec" /* yacc.c:1663  */
    break;

  case 334:
#line 1051 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declarator)); }
#line 6444 "type.ec" /* yacc.c:1663  */
    break;

  case 335:
#line 1053 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), (yyvsp[0].declarator)); }
#line 6450 "type.ec" /* yacc.c:1663  */
    break;

  case 336:
#line 1058 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkStructDeclarator((yyvsp[0].declarator), null); (yyval.declarator).loc = (yyloc); }
#line 6456 "type.ec" /* yacc.c:1663  */
    break;

  case 337:
#line 1060 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-1].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[0].attrib); (yyval.declarator).loc = (yyloc); }
#line 6462 "type.ec" /* yacc.c:1663  */
    break;

  case 338:
#line 1062 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); }
#line 6468 "type.ec" /* yacc.c:1663  */
    break;

  case 339:
#line 1064 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-2].declarator), (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); }
#line 6474 "type.ec" /* yacc.c:1663  */
    break;

  case 340:
#line 1066 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); }
#line 6480 "type.ec" /* yacc.c:1663  */
    break;

  case 341:
#line 1070 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkEnum((yyvsp[0].id), null); if(declMode) DeclClass((yyvsp[0].id)._class, (yyvsp[0].id).string); }
#line 6486 "type.ec" /* yacc.c:1663  */
    break;

  case 342:
#line 1071 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[0].specifier).name), null); if(declMode) DeclClass((yyvsp[0].specifier).nsSpec, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); }
#line 6492 "type.ec" /* yacc.c:1663  */
    break;

  case 343:
#line 1076 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkEnum(null, (yyvsp[-1].list)); }
#line 6498 "type.ec" /* yacc.c:1663  */
    break;

  case 344:
#line 1077 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkEnum((yyvsp[-3].id), (yyvsp[-1].list)); if(declMode) DeclClass((yyvsp[-3].id)._class, (yyvsp[-3].id).string); }
#line 6504 "type.ec" /* yacc.c:1663  */
    break;

  case 345:
#line 1078 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkEnum((yyvsp[-5].id), (yyvsp[-3].list)); (yyval.specifier).definitions = (yyvsp[-1].list); if(declMode) DeclClass((yyvsp[-5].id)._class, (yyvsp[-5].id).string); }
#line 6510 "type.ec" /* yacc.c:1663  */
    break;

  case 346:
#line 1079 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-5].specifier).name), (yyvsp[-3].list)); (yyval.specifier).definitions = (yyvsp[-1].list); if(declMode) DeclClass((yyvsp[-5].specifier).nsSpec, (yyvsp[-5].specifier).name); FreeSpecifier((yyvsp[-5].specifier)); }
#line 6516 "type.ec" /* yacc.c:1663  */
    break;

  case 347:
#line 1080 "type.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); if(declMode) DeclClass((yyvsp[-3].specifier).nsSpec, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); }
#line 6522 "type.ec" /* yacc.c:1663  */
    break;

  case 348:
#line 1085 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].enumerator)); }
#line 6528 "type.ec" /* yacc.c:1663  */
    break;

  case 349:
#line 1087 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), (yyvsp[0].enumerator)); }
#line 6534 "type.ec" /* yacc.c:1663  */
    break;

  case 350:
#line 1092 "type.y" /* yacc.c:1663  */
    { (yyval.enumerator) = MkEnumerator((yyvsp[0].id), null, null); }
#line 6540 "type.ec" /* yacc.c:1663  */
    break;

  case 351:
#line 1094 "type.y" /* yacc.c:1663  */
    { (yyval.enumerator) = MkEnumerator((yyvsp[-2].id), (yyvsp[0].exp), null); }
#line 6546 "type.ec" /* yacc.c:1663  */
    break;

  case 352:
#line 1095 "type.y" /* yacc.c:1663  */
    { (yyval.enumerator) = MkEnumerator((yyvsp[-1].id), null, (yyvsp[0].list)); }
#line 6552 "type.ec" /* yacc.c:1663  */
    break;

  case 353:
#line 1096 "type.y" /* yacc.c:1663  */
    { (yyval.enumerator) = MkEnumerator((yyvsp[-3].id), (yyvsp[0].exp), (yyvsp[-2].list)); }
#line 6558 "type.ec" /* yacc.c:1663  */
    break;

  case 354:
#line 1101 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); }
#line 6564 "type.ec" /* yacc.c:1663  */
    break;

  case 355:
#line 1103 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorArray(null, null); }
#line 6570 "type.ec" /* yacc.c:1663  */
    break;

  case 356:
#line 1105 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[-1].exp)); }
#line 6576 "type.ec" /* yacc.c:1663  */
    break;

  case 357:
#line 1107 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[-1].specifier)); }
#line 6582 "type.ec" /* yacc.c:1663  */
    break;

  case 358:
#line 1109 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); }
#line 6588 "type.ec" /* yacc.c:1663  */
    break;

  case 359:
#line 1111 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); }
#line 6594 "type.ec" /* yacc.c:1663  */
    break;

  case 360:
#line 1113 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); }
#line 6600 "type.ec" /* yacc.c:1663  */
    break;

  case 361:
#line 1115 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction(null, null); }
#line 6606 "type.ec" /* yacc.c:1663  */
    break;

  case 362:
#line 1117 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); }
#line 6612 "type.ec" /* yacc.c:1663  */
    break;

  case 363:
#line 1119 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); }
#line 6618 "type.ec" /* yacc.c:1663  */
    break;

  case 364:
#line 1121 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); }
#line 6624 "type.ec" /* yacc.c:1663  */
    break;

  case 365:
#line 1126 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); }
#line 6630 "type.ec" /* yacc.c:1663  */
    break;

  case 366:
#line 1128 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction(null, null); }
#line 6636 "type.ec" /* yacc.c:1663  */
    break;

  case 367:
#line 1130 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); }
#line 6642 "type.ec" /* yacc.c:1663  */
    break;

  case 368:
#line 1132 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); }
#line 6648 "type.ec" /* yacc.c:1663  */
    break;

  case 369:
#line 1134 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); }
#line 6654 "type.ec" /* yacc.c:1663  */
    break;

  case 370:
#line 1138 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); }
#line 6660 "type.ec" /* yacc.c:1663  */
    break;

  case 372:
#line 1140 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); }
#line 6666 "type.ec" /* yacc.c:1663  */
    break;

  case 373:
#line 1141 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].extDecl), MkDeclaratorPointer((yyvsp[0].pointer), null)); }
#line 6672 "type.ec" /* yacc.c:1663  */
    break;

  case 374:
#line 1142 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].extDecl), (yyvsp[0].declarator)); }
#line 6678 "type.ec" /* yacc.c:1663  */
    break;

  case 375:
#line 1143 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].extDecl), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); }
#line 6684 "type.ec" /* yacc.c:1663  */
    break;

  case 376:
#line 1147 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); }
#line 6690 "type.ec" /* yacc.c:1663  */
    break;

  case 378:
#line 1149 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); }
#line 6696 "type.ec" /* yacc.c:1663  */
    break;

  case 379:
#line 1150 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].extDecl), MkDeclaratorPointer((yyvsp[0].pointer), null)); }
#line 6702 "type.ec" /* yacc.c:1663  */
    break;

  case 380:
#line 1151 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].extDecl), (yyvsp[0].declarator)); }
#line 6708 "type.ec" /* yacc.c:1663  */
    break;

  case 381:
#line 1152 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].extDecl), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); }
#line 6714 "type.ec" /* yacc.c:1663  */
    break;

  case 383:
#line 1200 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); }
#line 6720 "type.ec" /* yacc.c:1663  */
    break;

  case 384:
#line 1202 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].extDecl), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); }
#line 6726 "type.ec" /* yacc.c:1663  */
    break;

  case 385:
#line 1204 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[0].extDecl), (yyvsp[-1].declarator)); }
#line 6732 "type.ec" /* yacc.c:1663  */
    break;

  case 386:
#line 1209 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[0].id)); }
#line 6738 "type.ec" /* yacc.c:1663  */
    break;

  case 387:
#line 1211 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); }
#line 6744 "type.ec" /* yacc.c:1663  */
    break;

  case 388:
#line 1213 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); }
#line 6750 "type.ec" /* yacc.c:1663  */
    break;

  case 389:
#line 1215 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); }
#line 6756 "type.ec" /* yacc.c:1663  */
    break;

  case 390:
#line 1217 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); }
#line 6762 "type.ec" /* yacc.c:1663  */
    break;

  case 392:
#line 1223 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); }
#line 6768 "type.ec" /* yacc.c:1663  */
    break;

  case 393:
#line 1226 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].extDecl), (yyvsp[0].declarator)); }
#line 6774 "type.ec" /* yacc.c:1663  */
    break;

  case 394:
#line 1228 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].extDecl), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); }
#line 6780 "type.ec" /* yacc.c:1663  */
    break;

  case 395:
#line 1230 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].extDecl), (yyvsp[0].declarator))); }
#line 6786 "type.ec" /* yacc.c:1663  */
    break;

  case 397:
#line 1240 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); }
#line 6792 "type.ec" /* yacc.c:1663  */
    break;

  case 398:
#line 1242 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); }
#line 6798 "type.ec" /* yacc.c:1663  */
    break;

  case 399:
#line 1244 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-1].declarator), null); }
#line 6804 "type.ec" /* yacc.c:1663  */
    break;

  case 402:
#line 1251 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].extDecl), (yyvsp[0].declarator)); }
#line 6810 "type.ec" /* yacc.c:1663  */
    break;

  case 403:
#line 1253 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].extDecl), (yyvsp[0].declarator)); }
#line 6816 "type.ec" /* yacc.c:1663  */
    break;

  case 405:
#line 1258 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); }
#line 6822 "type.ec" /* yacc.c:1663  */
    break;

  case 406:
#line 1259 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].extDecl), (yyvsp[0].declarator)); }
#line 6828 "type.ec" /* yacc.c:1663  */
    break;

  case 407:
#line 1260 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].extDecl), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); }
#line 6834 "type.ec" /* yacc.c:1663  */
    break;

  case 408:
#line 1261 "type.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].extDecl), (yyvsp[0].declarator))); }
#line 6840 "type.ec" /* yacc.c:1663  */
    break;

  case 409:
#line 1265 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 6846 "type.ec" /* yacc.c:1663  */
    break;

  case 410:
#line 1266 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier));  }
#line 6852 "type.ec" /* yacc.c:1663  */
    break;

  case 411:
#line 1270 "type.y" /* yacc.c:1663  */
    { (yyval.pointer) = MkPointer(null, null); }
#line 6858 "type.ec" /* yacc.c:1663  */
    break;

  case 412:
#line 1271 "type.y" /* yacc.c:1663  */
    { (yyval.pointer) = MkPointer((yyvsp[0].list), null); }
#line 6864 "type.ec" /* yacc.c:1663  */
    break;

  case 413:
#line 1272 "type.y" /* yacc.c:1663  */
    { (yyval.pointer) = MkPointer(null, (yyvsp[0].pointer)); }
#line 6870 "type.ec" /* yacc.c:1663  */
    break;

  case 414:
#line 1273 "type.y" /* yacc.c:1663  */
    { (yyval.pointer) = MkPointer((yyvsp[-1].list), (yyvsp[0].pointer)); }
#line 6876 "type.ec" /* yacc.c:1663  */
    break;

  case 416:
#line 1278 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), MkTypeName(null, null)); }
#line 6882 "type.ec" /* yacc.c:1663  */
    break;

  case 417:
#line 1282 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].typeName)); }
#line 6888 "type.ec" /* yacc.c:1663  */
    break;

  case 418:
#line 1283 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); }
#line 6894 "type.ec" /* yacc.c:1663  */
    break;

  case 419:
#line 1287 "type.y" /* yacc.c:1663  */
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); }
#line 6900 "type.ec" /* yacc.c:1663  */
    break;

  case 420:
#line 1288 "type.y" /* yacc.c:1663  */
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); }
#line 6906 "type.ec" /* yacc.c:1663  */
    break;

  case 421:
#line 1289 "type.y" /* yacc.c:1663  */
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), MkDeclaratorPointer(MkPointer(null,null), null)); }
#line 6912 "type.ec" /* yacc.c:1663  */
    break;

  case 422:
#line 1290 "type.y" /* yacc.c:1663  */
    { (yyval.typeName) = MkTypeName((yyvsp[-2].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[0].declarator))); }
#line 6918 "type.ec" /* yacc.c:1663  */
    break;

  case 423:
#line 1291 "type.y" /* yacc.c:1663  */
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); }
#line 6924 "type.ec" /* yacc.c:1663  */
    break;

  case 424:
#line 1303 "type.y" /* yacc.c:1663  */
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); }
#line 6930 "type.ec" /* yacc.c:1663  */
    break;

  case 425:
#line 1327 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); }
#line 6936 "type.ec" /* yacc.c:1663  */
    break;

  case 426:
#line 1328 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); }
#line 6942 "type.ec" /* yacc.c:1663  */
    break;

  case 427:
#line 1332 "type.y" /* yacc.c:1663  */
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); }
#line 6948 "type.ec" /* yacc.c:1663  */
    break;

  case 428:
#line 1333 "type.y" /* yacc.c:1663  */
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); }
#line 6954 "type.ec" /* yacc.c:1663  */
    break;

  case 429:
#line 1337 "type.y" /* yacc.c:1663  */
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); }
#line 6960 "type.ec" /* yacc.c:1663  */
    break;

  case 430:
#line 1338 "type.y" /* yacc.c:1663  */
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); }
#line 6966 "type.ec" /* yacc.c:1663  */
    break;

  case 431:
#line 1343 "type.y" /* yacc.c:1663  */
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); }
#line 6972 "type.ec" /* yacc.c:1663  */
    break;

  case 432:
#line 1345 "type.y" /* yacc.c:1663  */
    { (yyval.initializer) = MkInitializerList((yyvsp[-1].list)); (yyval.initializer).loc = (yyloc); }
#line 6978 "type.ec" /* yacc.c:1663  */
    break;

  case 433:
#line 1347 "type.y" /* yacc.c:1663  */
    {
         (yyval.initializer) = MkInitializerList((yyvsp[-2].list));
         (yyval.initializer).loc = (yyloc);

         {
            Expression exp = MkExpDummy();
            Initializer init = MkInitializerAssignment(exp);
            init.loc = (yylsp[-1]);
            exp.loc = (yylsp[-1]);
            ListAdd((yyvsp[-2].list), init);
         }
      }
#line 6995 "type.ec" /* yacc.c:1663  */
    break;

  case 434:
#line 1363 "type.y" /* yacc.c:1663  */
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); }
#line 7001 "type.ec" /* yacc.c:1663  */
    break;

  case 435:
#line 1365 "type.y" /* yacc.c:1663  */
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); }
#line 7007 "type.ec" /* yacc.c:1663  */
    break;

  case 436:
#line 1387 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initializer)); }
#line 7013 "type.ec" /* yacc.c:1663  */
    break;

  case 437:
#line 1389 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), (yyvsp[0].initializer)); }
#line 7019 "type.ec" /* yacc.c:1663  */
    break;

  case 444:
#line 1403 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkLabeledStmt((yyvsp[-2].id), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 7025 "type.ec" /* yacc.c:1663  */
    break;

  case 445:
#line 1405 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; }
#line 7031 "type.ec" /* yacc.c:1663  */
    break;

  case 446:
#line 1407 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 7037 "type.ec" /* yacc.c:1663  */
    break;

  case 447:
#line 1411 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declaration)); }
#line 7043 "type.ec" /* yacc.c:1663  */
    break;

  case 448:
#line 1412 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); }
#line 7049 "type.ec" /* yacc.c:1663  */
    break;

  case 449:
#line 1416 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].stmt)); }
#line 7055 "type.ec" /* yacc.c:1663  */
    break;

  case 450:
#line 1417 "type.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); }
#line 7061 "type.ec" /* yacc.c:1663  */
    break;

  case 451:
#line 1420 "type.y" /* yacc.c:1663  */
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); /*yyerror(); */ ListAdd((yyvsp[-1].list), stmt); (yyval.list) = (yyvsp[-1].list); }
#line 7067 "type.ec" /* yacc.c:1663  */
    break;

  case 452:
#line 1424 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[0].list)); }
#line 7073 "type.ec" /* yacc.c:1663  */
    break;

  case 453:
#line 1425 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkCompoundStmt((yyvsp[0].list), null); }
#line 7079 "type.ec" /* yacc.c:1663  */
    break;

  case 454:
#line 1426 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); }
#line 7085 "type.ec" /* yacc.c:1663  */
    break;

  case 455:
#line 1430 "type.y" /* yacc.c:1663  */
    { (yyval.context) = PushContext(); }
#line 7091 "type.ec" /* yacc.c:1663  */
    break;

  case 456:
#line 1435 "type.y" /* yacc.c:1663  */
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   }
#line 7102 "type.ec" /* yacc.c:1663  */
    break;

  case 457:
#line 1443 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = (yyvsp[-1].stmt); (yyval.stmt).compound.context = (yyvsp[-2].context); PopContext((yyvsp[-2].context)); (yyval.stmt).loc = (yyloc); }
#line 7108 "type.ec" /* yacc.c:1663  */
    break;

  case 458:
#line 1447 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); }
#line 7114 "type.ec" /* yacc.c:1663  */
    break;

  case 459:
#line 1448 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); }
#line 7120 "type.ec" /* yacc.c:1663  */
    break;

  case 460:
#line 1452 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkIfStmt((yyvsp[-2].list), (yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); }
#line 7126 "type.ec" /* yacc.c:1663  */
    break;

  case 461:
#line 1453 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkIfStmt((yyvsp[-4].list), (yyvsp[-2].stmt), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 7132 "type.ec" /* yacc.c:1663  */
    break;

  case 462:
#line 1454 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkSwitchStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 7138 "type.ec" /* yacc.c:1663  */
    break;

  case 463:
#line 1458 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkWhileStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 7144 "type.ec" /* yacc.c:1663  */
    break;

  case 464:
#line 1459 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-5].stmt), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); }
#line 7150 "type.ec" /* yacc.c:1663  */
    break;

  case 465:
#line 1460 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 7156 "type.ec" /* yacc.c:1663  */
    break;

  case 466:
#line 1461 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkForStmt((yyvsp[-4].stmt), (yyvsp[-3].stmt), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 7162 "type.ec" /* yacc.c:1663  */
    break;

  case 467:
#line 1463 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 7168 "type.ec" /* yacc.c:1663  */
    break;

  case 468:
#line 1464 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 7174 "type.ec" /* yacc.c:1663  */
    break;

  case 469:
#line 1465 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 7180 "type.ec" /* yacc.c:1663  */
    break;

  case 470:
#line 1469 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkGotoStmt((yyvsp[-1].id)); (yyval.stmt).loc = (yyloc); }
#line 7186 "type.ec" /* yacc.c:1663  */
    break;

  case 471:
#line 1470 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); }
#line 7192 "type.ec" /* yacc.c:1663  */
    break;

  case 472:
#line 1471 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); }
#line 7198 "type.ec" /* yacc.c:1663  */
    break;

  case 473:
#line 1472 "type.y" /* yacc.c:1663  */
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[0]); }
#line 7204 "type.ec" /* yacc.c:1663  */
    break;

  case 474:
#line 1473 "type.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkReturnStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); }
#line 7210 "type.ec" /* yacc.c:1663  */
    break;

  case 475:
#line 1477 "type.y" /* yacc.c:1663  */
    { (yyval.string) = CopyString(yytext); }
#line 7216 "type.ec" /* yacc.c:1663  */
    break;

  case 476:
#line 1482 "type.y" /* yacc.c:1663  */
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;}
#line 7222 "type.ec" /* yacc.c:1663  */
    break;

  case 477:
#line 1484 "type.y" /* yacc.c:1663  */
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;}
#line 7228 "type.ec" /* yacc.c:1663  */
    break;

  case 478:
#line 1489 "type.y" /* yacc.c:1663  */
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;}
#line 7234 "type.ec" /* yacc.c:1663  */
    break;

  case 479:
#line 1491 "type.y" /* yacc.c:1663  */
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;}
#line 7240 "type.ec" /* yacc.c:1663  */
    break;

  case 480:
#line 1516 "type.y" /* yacc.c:1663  */
    { (yyval.instance) = MkInstantiation((yyvsp[-3].specifier), null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; }
#line 7246 "type.ec" /* yacc.c:1663  */
    break;

  case 481:
#line 1518 "type.y" /* yacc.c:1663  */
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;}
#line 7252 "type.ec" /* yacc.c:1663  */
    break;

  case 482:
#line 1520 "type.y" /* yacc.c:1663  */
    { Location tmpLoc = yylloc; yylloc = (yylsp[-3]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-3].id).string), null, (yyvsp[-1].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; FreeIdentifier((yyvsp[-3].id)); }
#line 7258 "type.ec" /* yacc.c:1663  */
    break;

  case 483:
#line 1522 "type.y" /* yacc.c:1663  */
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; FreeIdentifier((yyvsp[-2].id)); }
#line 7264 "type.ec" /* yacc.c:1663  */
    break;

  case 484:
#line 1527 "type.y" /* yacc.c:1663  */
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; }
#line 7270 "type.ec" /* yacc.c:1663  */
    break;

  case 485:
#line 1529 "type.y" /* yacc.c:1663  */
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;}
#line 7276 "type.ec" /* yacc.c:1663  */
    break;

  case 486:
#line 1533 "type.y" /* yacc.c:1663  */
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); }
#line 7282 "type.ec" /* yacc.c:1663  */
    break;

  case 487:
#line 1535 "type.y" /* yacc.c:1663  */
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); }
#line 7288 "type.ec" /* yacc.c:1663  */
    break;

  case 488:
#line 1537 "type.y" /* yacc.c:1663  */
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); }
#line 7294 "type.ec" /* yacc.c:1663  */
    break;

  case 489:
#line 1539 "type.y" /* yacc.c:1663  */
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); }
#line 7300 "type.ec" /* yacc.c:1663  */
    break;

  case 490:
#line 1541 "type.y" /* yacc.c:1663  */
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); }
#line 7306 "type.ec" /* yacc.c:1663  */
    break;

  case 491:
#line 1547 "type.y" /* yacc.c:1663  */
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); }
#line 7312 "type.ec" /* yacc.c:1663  */
    break;

  case 492:
#line 1549 "type.y" /* yacc.c:1663  */
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); }
#line 7318 "type.ec" /* yacc.c:1663  */
    break;

  case 493:
#line 1554 "type.y" /* yacc.c:1663  */
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); }
#line 7324 "type.ec" /* yacc.c:1663  */
    break;

  case 494:
#line 1558 "type.y" /* yacc.c:1663  */
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end;}
#line 7330 "type.ec" /* yacc.c:1663  */
    break;

  case 495:
#line 1559 "type.y" /* yacc.c:1663  */
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);}
#line 7336 "type.ec" /* yacc.c:1663  */
    break;

  case 496:
#line 1564 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); }
#line 7342 "type.ec" /* yacc.c:1663  */
    break;

  case 497:
#line 1566 "type.y" /* yacc.c:1663  */
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); (yyval.list) = (yyvsp[-2].list); }
#line 7348 "type.ec" /* yacc.c:1663  */
    break;

  case 498:
#line 1571 "type.y" /* yacc.c:1663  */
    { if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).end; (yyval.list) = (yyvsp[-1].list); }
#line 7354 "type.ec" /* yacc.c:1663  */
    break;

  case 499:
#line 1575 "type.y" /* yacc.c:1663  */
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]); }
#line 7360 "type.ec" /* yacc.c:1663  */
    break;

  case 500:
#line 1576 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); }
#line 7366 "type.ec" /* yacc.c:1663  */
    break;

  case 501:
#line 1577 "type.y" /* yacc.c:1663  */
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); ListAdd((yyval.list), members); members.loc = (yylsp[0]); (yyval.list) = (yyvsp[-1].list);  }
#line 7372 "type.ec" /* yacc.c:1663  */
    break;

  case 502:
#line 1578 "type.y" /* yacc.c:1663  */
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]);(yyval.list) = (yyvsp[-1].list);  }
#line 7378 "type.ec" /* yacc.c:1663  */
    break;

  case 503:
#line 1579 "type.y" /* yacc.c:1663  */
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  }
#line 7384 "type.ec" /* yacc.c:1663  */
    break;

  case 504:
#line 1580 "type.y" /* yacc.c:1663  */
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[0]); (yyval.list) = (yyvsp[-1].list); }
#line 7390 "type.ec" /* yacc.c:1663  */
    break;

  case 506:
#line 1585 "type.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); }
#line 7396 "type.ec" /* yacc.c:1663  */
    break;

  case 507:
#line 1586 "type.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-1].list), MkMembersInitList((yyvsp[0].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); }
#line 7402 "type.ec" /* yacc.c:1663  */
    break;

  case 508:
#line 1590 "type.y" /* yacc.c:1663  */
    { parsedType = (yyvsp[0].typeName); }
#line 7408 "type.ec" /* yacc.c:1663  */
    break;

  case 509:
#line 1591 "type.y" /* yacc.c:1663  */
    { parsedType = (yyvsp[-2].typeName); parsedType.bitCount = (yyvsp[0].exp); }
#line 7414 "type.ec" /* yacc.c:1663  */
    break;


#line 7418 "type.ec" /* yacc.c:1663  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;
  *++yylsp = yyloc;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }

  yyerror_range[1] = yylloc;

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval, &yylloc);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  yyerror_range[1] = yylsp[1-yylen];
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;

      yyerror_range[1] = *yylsp;
      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp, yylsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  yyerror_range[2] = yylloc;
  /* Using YYLLOC is tempting, but would change the location of
     the lookahead.  YYLOC is available though.  */
  YYLLOC_DEFAULT (yyloc, yyerror_range, 2);
  *++yylsp = yyloc;

  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval, &yylloc);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp, yylsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 1594 "type.y" /* yacc.c:1923  */

