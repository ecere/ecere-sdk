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
#line 1 "expression.y" /* yacc.c:356  */


import "ecdefs"

#define YYSIZE_T size_t
#define YYLTYPE Location

#include "grammar.h"

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)         \
  (Current).start = (Rhs)[1].start;      \
  (Current).end = (Rhs)[N].end;
#endif

Expression parsedExpression;

#define yyparse expression_yyparse
#define yylval  expression_yylval
#define yychar  expression_yychar
#define yydebug expression_yydebug
#define yynerrs expression_yynerrs
#define yylloc expression_yylloc

// #define PRECOMPILER
extern File fileInput;
extern char * yytext;

int yylex();
int yyerror();

#define uint _uint
default:


#line 102 "expression.ec" /* yacc.c:356  */

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
#line 39 "expression.y" /* yacc.c:372  */

   int i;
   AccessMode declMode;
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

#line 296 "expression.ec" /* yacc.c:372  */
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

#line 325 "expression.ec" /* yacc.c:375  */

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
#define YYFINAL  155
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   7843

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  148
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  108
/* YYNRULES -- Number of rules.  */
#define YYNRULES  436
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  758

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
       2,     2,     2,   135,     2,     2,   125,   137,   130,     2,
     123,   124,   131,   132,   129,   133,   126,   136,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   143,   145,
     138,   144,   139,   142,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   127,     2,   128,   140,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   146,   141,   147,   134,     2,     2,     2,
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
       0,   220,   220,   225,   226,   231,   233,   235,   237,   238,
     240,   241,   242,   245,   246,   247,   248,   249,   250,   251,
     252,   253,   257,   261,   262,   263,   264,   265,   266,   279,
     280,   281,   311,   312,   313,   314,   318,   319,   320,   323,
     324,   327,   328,   332,   333,   342,   343,   344,   345,   346,
     347,   348,   352,   353,   357,   358,   359,   360,   364,   365,
     366,   370,   371,   372,   376,   377,   378,   379,   380,   384,
     385,   386,   390,   391,   395,   396,   400,   401,   405,   406,
     410,   411,   415,   416,   420,   421,   422,   424,   425,   429,
     430,   431,   432,   433,   434,   435,   436,   437,   438,   439,
     443,   444,   448,   452,   453,   454,   455,   459,   460,   461,
     462,   463,   464,   465,   466,   470,   471,   472,   473,   474,
     475,   476,   477,   478,   479,   484,   485,   486,   487,   488,
     489,   490,   491,   495,   496,   497,   498,   499,   500,   501,
     502,   503,   504,   508,   509,   513,   514,   518,   519,   520,
     521,   522,   523,   527,   528,   529,   533,   534,   535,   540,
     541,   542,   543,   544,   548,   549,   553,   554,   555,   559,
     560,   564,   565,   568,   569,   570,   574,   599,   603,   604,
     605,   606,   607,   608,   609,   610,   611,   612,   613,   614,
     615,   616,   617,   618,   619,   620,   621,   622,   623,   624,
     628,   629,   630,   631,   632,   633,   634,   635,   636,   637,
     638,   639,   640,   641,   642,   643,   644,   645,   646,   647,
     648,   653,   654,   655,   656,   657,   660,   661,   662,   663,
     664,   669,   670,   673,   675,   680,   681,   685,   686,   690,
     694,   695,   699,   701,   703,   705,   707,   710,   712,   714,
     716,   718,   721,   723,   725,   727,   729,   732,   734,   736,
     738,   740,   745,   746,   747,   748,   749,   750,   751,   752,
     756,   758,   763,   765,   767,   769,   771,   776,   777,   781,
     783,   784,   785,   786,   790,   792,   797,   799,   801,   802,
     807,   809,   811,   813,   815,   817,   819,   821,   823,   825,
     827,   832,   834,   836,   838,   840,   845,   846,   847,   848,
     849,   850,   854,   855,   856,   857,   858,   859,   905,   906,
     908,   914,   916,   918,   920,   922,   927,   928,   931,   933,
     935,   941,   942,   943,   945,   950,   954,   956,   958,   963,
     964,   968,   969,   970,   971,   975,   976,   980,   981,   985,
     986,   987,   991,   992,   996,   997,  1006,  1008,  1010,  1026,
    1027,  1048,  1050,  1055,  1056,  1057,  1058,  1059,  1060,  1064,
    1066,  1068,  1073,  1074,  1078,  1079,  1082,  1086,  1087,  1088,
    1092,  1096,  1104,  1109,  1110,  1114,  1115,  1116,  1120,  1121,
    1122,  1123,  1125,  1126,  1127,  1131,  1132,  1133,  1134,  1135,
    1139,  1143,  1145,  1150,  1152,  1154,  1156,  1161,  1163,  1168,
    1170,  1175,  1180,  1185,  1187,  1192,  1194,  1196,  1198,  1200,
    1206,  1211,  1216,  1217,  1221,  1223,  1228,  1233,  1234,  1235,
    1236,  1237,  1238,  1242,  1243,  1244,  1248
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
  "'('", "')'", "'$'", "'.'", "'['", "']'", "','", "'&'", "'*'", "'+'",
  "'-'", "'~'", "'!'", "'/'", "'%'", "'<'", "'>'", "'^'", "'|'", "'?'",
  "':'", "'='", "';'", "'{'", "'}'", "$accept", "identifier",
  "primary_expression", "simple_primary_expression",
  "anon_instantiation_expression", "postfix_expression",
  "argument_expression_list", "common_unary_expression",
  "unary_expression", "unary_operator", "cast_expression",
  "multiplicative_expression", "additive_expression", "shift_expression",
  "relational_expression", "equality_expression", "and_expression",
  "exclusive_or_expression", "inclusive_or_expression",
  "logical_and_expression", "logical_or_expression",
  "conditional_expression", "assignment_expression", "assignment_operator",
  "expression", "constant_expression", "declaration",
  "specifier_qualifier_list", "declaration_specifiers",
  "property_specifiers", "renew_specifiers", "init_declarator_list",
  "init_declarator", "storage_class_specifier", "ext_decl", "_attrib",
  "attribute_word", "attribute", "attribs_list", "attrib", "multi_attrib",
  "type_qualifier", "type", "strict_type", "type_specifier",
  "strict_type_specifier", "struct_or_union_specifier_compound",
  "struct_or_union_specifier_nocompound", "struct_or_union",
  "struct_declaration_list", "default_property", "default_property_list",
  "property", "struct_declaration", "struct_declarator_list",
  "struct_declarator", "enum_specifier_nocompound",
  "enum_specifier_compound", "enumerator_list", "enumerator",
  "direct_abstract_declarator", "direct_abstract_declarator_noarray",
  "abstract_declarator", "abstract_declarator_noarray", "declarator",
  "direct_declarator_nofunction", "declarator_function",
  "direct_declarator", "direct_declarator_function_start",
  "direct_declarator_function", "type_qualifier_list", "pointer",
  "parameter_type_list", "parameter_list", "parameter_declaration",
  "identifier_list", "type_name", "initializer", "initializer_condition",
  "initializer_list", "statement", "labeled_statement", "declaration_list",
  "statement_list", "compound_inside", "compound_start",
  "compound_statement", "expression_statement", "selection_statement",
  "iteration_statement", "jump_statement", "string_literal",
  "instantiation_named", "instantiation_unnamed", "instantiation_anon",
  "class_function_definition_start",
  "constructor_function_definition_start",
  "destructor_function_definition_start",
  "virtual_class_function_definition_start", "class_function_definition",
  "instance_class_function_definition_start",
  "instance_class_function_definition", "data_member_initialization",
  "data_member_initialization_list",
  "data_member_initialization_list_coloned",
  "members_initialization_list_coloned", "members_initialization_list",
  "expression_unit", YY_NULL
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
     375,   376,   377,    40,    41,    36,    46,    91,    93,    44,
      38,    42,    43,    45,   126,    33,    47,    37,    60,    62,
      94,   124,    63,    58,    61,    59,   123,   125
};
# endif

#define YYPACT_NINF -645

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-645)))

#define YYTABLE_NINF -434

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
    5781,  -645,  -645,  -645,  -645,  5815,  5889,  5889,  -645,  7543,
    5781,  -645,  7543,  5781,  5923,  -645,  5373,   124,  -645,  -645,
    -645,  -645,  -645,  -645,    17,  -645,  -645,   452,  -645,   719,
    5781,  -645,   273,   -26,   303,    48,   370,    54,    -9,    78,
     181,     2,   719,  -645,    86,  -645,  -645,  -645,   282,  5373,
    -645,  5525,  -645,  -645,  -645,  -645,  -645,  -645,  -645,  -645,
    -645,  -645,  -645,  -645,  -645,  -645,  -645,  -645,  -645,  -645,
    -645,  -645,  -645,  -645,  -645,  -645,  -645,    10,  -645,  -645,
    -645,   150,  -645,  -645,  -645,  6544,  -645,  -645,  -645,  -645,
    -645,  -645,    24,  -645,  -645,  -645,  -645,  7725,  6648,  7725,
    5373,  -645,  -645,  -645,   -49,  7058,  -645,    86,  -645,  -645,
    -645,   164,   173,  2017,   298,  -645,  -645,  1411,   298,  5781,
    -645,  -645,  -645,  -645,  -645,  -645,  -645,  -645,  -645,  -645,
    -645,  -645,  4374,  -645,  5781,  5781,  5781,  5781,  5781,  5781,
    5781,  5781,  5781,  5781,  5781,  5781,  5781,  5781,  5781,  5781,
    5781,  5781,  5781,  4374,  2152,  -645,   183,   298,   175,   182,
     344,  -645,  -645,  -645,  -645,  6752,  5781,   199,  -645,   -15,
     243,   147,   167,  -645,  -645,  -645,  -645,   251,   278,   253,
    2680,   277,    20,   281,  -645,  -645,  -645,  -645,  -645,  -645,
    -645,  -645,  -645,  -645,  -645,  -645,  -645,  -645,  -645,   306,
    -645,  -645,  6856,  -645,  -645,  -645,  -645,  -645,  -645,  -645,
    -645,  5781,   322,  6960,   354,  -645,  5781,  6440,  5559,   392,
    -645,  -645,  -645,  -645,    83,  -645,   270,  5781,   124,  -645,
    2287,  -645,  -645,   350,  -645,  6239,  -645,  -645,   319,  -645,
    -645,   -61,  -645,  2422,   337,  -645,  -645,  -645,   220,  -645,
    -645,   371,  -645,  -645,  -645,  -645,  -645,   273,   273,   -26,
     -26,   303,   303,   303,   303,    48,    48,   370,    54,    -9,
      78,   181,   -66,  -645,  -645,  -645,   369,  -645,    97,   -59,
    -645,   298,   298,   377,  -645,  6135,   386,   394,   395,  -645,
     403,  -645,   199,  -645,   251,   253,   399,  -645,  7162,  5781,
     251,  7634,  6239,  5447,  7543,  -645,  -645,    17,   439,  5004,
      37,  2803,  -645,    94,  -645,  -645,   284,  -645,  6343,  -645,
     290,   401,   402,   319,   319,   319,   341,  -645,  2926,  3049,
     388,   404,  4632,   344,  5781,  -645,  -645,  -645,  -645,  -645,
     411,   421,  5781,  5781,   424,  -645,  -645,  -645,   428,   429,
    -645,   426,   -54,    83,   270,  7259,  5599,    83,  -645,  -645,
    -645,   412,  4374,   140,  -645,  -645,   413,  4222,  -645,  4374,
    -645,  -645,  -645,   -61,  -645,  -645,  -645,  4374,  -645,  5781,
    -645,  5781,  -645,   280,   298,  -645,    66,   177,  -645,  6031,
      52,  -645,  -645,   284,  -645,  -645,   308,  -645,  -645,  7452,
    -645,  -645,  -645,   251,   263,  -645,   434,   435,    53,  4885,
    -645,  -645,  -645,  -645,   358,  6239,  -645,  5238,   538,    37,
     437,   290,  7356,  4374,   433,  5781,  -645,   422,    37,   111,
    -645,   363,  -645,   423,   290,  -645,    59,  -645,  -645,  1104,
    -645,  -645,  5633,  -645,  -645,   443,   223,    59,  -645,  -645,
    -645,  -645,  -645,  -645,  -645,  -645,  -645,  3172,  -645,  3295,
    3418,  4632,  3541,   446,   448,  5781,  -645,   459,   461,  5781,
    -645,  -645,  -645,  -645,    83,  -645,   450,  -645,   462,   107,
    -645,  -645,  -645,  5781,   449,   468,   474,   476,  4357,   477,
     298,   456,   458,  4767,   298,  -645,   197,   120,  -645,  5122,
    -645,  -645,  1612,  1747,   460,  -645,  -645,  -645,  -645,  -645,
     466,  -645,  -645,  -645,  -645,  -645,  5781,  -645,  4632,  -645,
    4632,  -645,   284,  -645,   308,    59,  -645,  -645,  -645,  -645,
    -645,  -645,  -645,  -645,   491,   493,  -645,   222,  -645,  -645,
    -645,  -645,   -17,   471,  -645,  -645,  -645,  -645,    28,  -645,
      53,  -645,  -645,   290,  -645,   495,  -645,  -645,  -645,  2557,
     475,   290,   225,  -645,  5781,  -645,    59,   479,  -645,  -645,
    -645,   499,   115,  -645,  -645,   298,  -645,  -645,  -645,  -645,
    3664,  3787,  -645,  -645,  -645,   501,  -645,  -645,   502,  -645,
    -645,  -645,   480,  4357,  5781,  5781,  5707,   574,  4686,   488,
    -645,  -645,  -645,   151,   494,  4357,  -645,  -645,   250,  -645,
     496,  -645,  1882,  -645,  -645,  -645,  -645,  -645,  3910,  4033,
    -645,  -645,  5781,   511,   436,  -645,   319,   319,  -645,    31,
     163,   497,  -645,  -645,  -645,  -645,   490,   498,  -645,   504,
     505,  -645,  -645,  -645,  -645,  -645,  -645,  -645,  4357,  -645,
     301,   316,  4357,   328,   519,  4357,  4719,  -645,  -645,  5781,
    -645,   140,  -645,  4509,  -645,  -645,   338,  -645,  -645,    12,
     -36,   319,   319,  -645,   319,   319,  -645,   249,  -645,  5781,
    -645,  4357,  4357,  -645,  4357,  5781,  -645,  4357,  5741,   500,
    -645,  4509,  -645,  -645,  -645,   319,  -645,   319,  -645,    42,
      -5,    44,     8,   319,   319,  -645,  -645,   587,  -645,  -645,
     342,  -645,  4357,   356,  -645,  -645,   194,   507,   510,   319,
    -645,   319,  -645,   319,  -645,   319,  -645,    77,    25,  4357,
     520,  -645,  4357,  4087,  -645,  -645,  -645,   521,   523,   528,
     531,   319,  -645,   319,  -645,  -645,  -645,  -645,  -645,  -645,
    -645,  -645,  -645,  -645,   532,   533,  -645,  -645
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    21,     2,     7,   400,     0,     0,     0,   177,     0,
       0,    51,     0,     0,     0,     8,     0,     0,    45,    46,
      47,    48,    49,    50,     5,    23,     3,    44,    43,    52,
       0,    54,    58,    61,    64,    69,    72,    74,    76,    78,
      80,    82,    84,   436,     0,   176,     9,     6,     0,     0,
      39,     0,    36,    37,   147,   148,   149,   150,   151,   179,
     180,   181,   182,   183,   184,   185,   187,   190,   191,   188,
     189,   173,   174,   178,   186,   235,   236,     0,   199,   175,
     192,     0,   194,   193,   152,     0,   115,   117,   197,   119,
     123,   195,     0,   196,   121,    52,   102,     0,     0,     0,
       0,    41,    12,   100,     0,   354,   107,   197,   109,   113,
     111,     0,    10,     0,     0,    30,    31,     0,     0,     0,
      28,    90,    91,    92,    93,    94,    95,    96,    97,    98,
      99,    89,     0,    38,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     1,     0,     0,   277,   278,
       0,   153,   156,   157,   158,     0,     0,   341,   116,     0,
       0,   154,   155,   118,   120,   124,   122,   313,     0,   312,
       0,   231,     0,   232,   201,   202,   203,   204,   205,   206,
     207,   209,   212,   213,   210,   211,   200,   208,   220,     0,
     215,   214,     0,   133,   135,   218,   137,   139,   216,   217,
     141,     0,     0,     0,     0,     4,     0,     0,     0,     0,
     108,   110,   114,   112,   307,   355,   306,     0,     0,   431,
       0,   406,   360,    44,   359,     0,   423,    22,     0,   428,
     424,   434,   427,     0,     0,    29,    25,    33,     0,    32,
      27,     0,    87,    85,    55,    56,    57,    59,    60,    62,
      63,    67,    68,    65,    66,    70,    71,    73,    75,    77,
      79,    81,     0,    88,    86,   404,     0,    40,   286,     0,
     284,     0,     0,     0,   302,   351,     0,     0,   345,   347,
       0,   339,   342,   343,   316,   315,     0,   172,     0,     0,
     314,     0,     0,     0,     0,   269,   224,     5,     0,     0,
       0,     0,   240,     0,   268,   237,     0,   410,     0,   326,
       0,     0,     6,     0,     0,     0,     0,   266,     0,     0,
     233,   234,     0,     0,     0,   134,   136,   138,   140,   142,
       0,     0,     0,     0,     0,    42,   101,   297,     0,     0,
     291,     0,     0,   310,   309,     0,     0,   308,    53,    11,
     408,     0,     0,     0,   321,   420,   380,     0,   421,     0,
     426,   432,   430,   435,   429,   405,    26,     0,    24,     0,
     403,     0,   171,   288,     0,   279,     0,     0,   198,     0,
       0,   350,   349,   332,   318,   331,   306,   301,   303,     0,
      14,   340,   344,   317,     0,   304,     0,     0,     0,     0,
     125,   127,   131,   129,     0,     0,   414,     0,    46,     0,
       0,     0,     0,     0,     0,     0,   263,   321,     0,     0,
     270,   272,   409,   331,     0,   328,     0,   222,   238,     0,
     267,   335,     0,   338,   352,     0,     0,     0,   327,   265,
     264,   415,   418,   419,   417,   416,   223,     0,   229,     0,
       0,     0,     0,     0,     0,     0,    16,     0,     0,     0,
     290,   298,   292,   293,   311,   299,     0,   294,     0,     0,
     407,   422,   381,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   383,     5,     0,   372,     0,
     374,   363,     0,     0,     0,   364,   365,   366,   367,   368,
       0,   425,    35,    34,    83,   287,     0,   285,     0,   280,
       0,   283,   334,   333,   309,     0,   319,   346,   348,   159,
     160,   163,   162,   161,     0,   164,   166,     0,   305,    13,
     277,   278,     0,     0,   126,   128,   132,   130,     0,   231,
       0,   232,   413,     0,   322,     0,   239,   411,   274,     0,
     333,     0,     0,   262,     0,   273,     0,   331,   329,   241,
     324,     0,     0,   336,   337,     0,   330,   221,   227,   228,
       0,     0,   225,   219,    18,     0,    15,    20,     0,   300,
     295,   296,     0,     0,     0,     0,     0,     0,     0,     0,
     396,   397,   398,     0,     0,     0,   384,   103,     0,   143,
     145,   373,     0,   376,   375,   382,   105,   289,     0,     0,
     320,   170,     0,     0,     0,   167,     0,     0,   256,     0,
       0,     0,   233,   234,   412,   402,     0,   331,   271,   275,
     333,   323,   325,   353,   226,   230,    17,    19,     0,   371,
       0,     0,     0,     0,     0,     0,     0,   395,   399,     0,
     369,     0,   104,     0,   281,   282,     0,   169,   168,     0,
       0,     0,     0,   246,     0,     0,   261,     0,   401,     0,
     370,     0,     0,   392,     0,     0,   394,     0,     0,     0,
     144,     0,   356,   146,   165,     0,   254,     0,   255,     0,
       0,     0,     0,     0,     0,   251,   276,   385,   387,   388,
       0,   393,     0,     0,   106,   361,     0,     0,     0,     0,
     244,     0,   245,     0,   259,     0,   260,     0,     0,     0,
       0,   390,     0,     0,   357,   252,   253,     0,     0,     0,
       0,     0,   249,     0,   250,   386,   389,   391,   358,   362,
     242,   243,   257,   258,     0,     0,   247,   248
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -645,   391,  -645,  -645,  -108,   708,  -645,  -645,     0,  -645,
     -13,   389,   393,   348,   390,   536,   541,   518,   540,   544,
    -645,    72,     1,   654,   -14,    56,  -335,  -645,    27,  -645,
     598,  -645,    43,   219,   816,  -645,  -645,  -496,  -645,  -154,
     420,  1090,   782,   -33,    41,   -93,   187,    -6,  -275,  -256,
     264,  -645,  -645,  -286,  -645,   143,    -1,   561,   261,   323,
    -197,  -158,   -97,    29,  -281,  1048,  -215,  -363,  -645,  1034,
    -645,   -55,  -153,  -645,   307,  -645,    -3,  -644,  -320,  -645,
     174,  -645,  -645,   206,  -645,  -645,   664,  -531,  -645,  -645,
    -645,    -7,  -352,   695,  -645,  -645,  -645,  -645,  -645,  -645,
    -645,   467,   345,   470,   473,  -645,  -151,  -645
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    24,    25,    26,   232,    27,   248,    28,    95,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,   103,   132,   497,    97,   613,   105,   309,   409,
     202,   608,   609,    86,   310,   170,   535,   536,   537,   171,
     172,    87,    44,    45,    89,   206,    90,    91,    92,   311,
     312,   313,   314,   315,   429,   430,    93,    94,   279,   280,
     224,   177,   348,   178,   420,   316,   317,   394,   318,   319,
     292,   320,   349,   288,   289,   446,   111,   693,   236,   716,
     500,   501,   502,   503,   504,   367,   505,   506,   507,   508,
     509,    46,   321,    47,   237,   323,   324,   325,   326,   327,
     238,   239,   240,   241,   242,   243,   244,    48
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      29,    43,   104,   276,   392,    50,    52,    53,   225,   247,
     112,   294,   287,     2,   101,   510,    29,   133,   297,   151,
     365,   300,   353,     2,   252,   438,   414,     2,   431,   357,
     179,     2,   498,   526,   697,   104,    85,   104,     8,    98,
       2,   625,   481,   179,   159,   273,   156,   715,     8,    29,
     226,    29,     8,   626,   627,     2,     2,   108,   526,   183,
     141,   142,     2,   216,   205,   721,   205,   656,   369,    99,
     384,   526,   457,   459,   473,   215,   462,   379,   725,   361,
     216,     8,    96,   695,   370,    96,   104,   416,   385,   749,
     108,   208,   154,   208,   432,   743,   209,   214,   209,   161,
      29,   671,   672,   556,   162,   251,   137,   138,   165,   337,
     179,   698,   293,   719,   295,   723,   167,    29,   249,    29,
     337,   254,   255,   256,   382,   688,   174,   212,   668,     4,
     628,   148,    29,   253,   414,   163,   164,   403,   272,   174,
     235,   108,   722,     2,   152,   406,   221,   179,   741,   331,
     510,   510,    29,    29,   274,   726,   157,   474,   179,   696,
     363,   620,   226,   113,   354,   445,   329,   611,   167,   205,
     180,   438,   744,   438,   630,   389,   438,   162,   673,   218,
     205,   235,   363,   167,   147,   234,   143,   144,   391,   720,
     620,   724,   285,   353,   286,   384,   208,   150,   620,   357,
     552,   209,   476,   109,   580,   581,   355,   208,   163,   164,
     356,   518,   209,   519,   358,   161,    29,   346,   610,   149,
     162,   359,   290,   439,   742,   529,   234,  -171,     2,   297,
     396,   340,   154,   674,   675,   591,   109,   402,    96,   440,
     562,   381,   344,   642,   285,    71,    72,   162,   421,   216,
     530,   163,   164,   154,   434,   436,   563,   235,  -171,  -171,
     510,   154,   618,   363,   619,   606,   529,   341,   531,   512,
     235,   167,   175,   160,   351,    79,   174,   565,   163,   164,
     216,   431,   155,    96,   207,   175,   207,   109,   227,   104,
      96,   530,   222,     2,   438,   438,   658,   532,   533,   228,
     161,     2,   234,    29,   168,   162,   384,   277,   421,   531,
     676,     2,   548,   139,   140,   234,   203,   168,   203,   703,
     704,   281,   520,   733,   521,   285,   174,   474,   282,   415,
     167,   422,   438,   438,   396,   524,   163,   164,   532,   533,
     605,   734,   413,   113,   376,   285,   623,   574,   363,   377,
     174,   624,   575,     2,   226,   407,   167,   114,   115,   116,
     162,     2,   421,   293,   553,   161,   296,    29,   425,   421,
     162,    96,     8,   561,   298,   541,   165,    29,   513,   661,
     610,   551,   285,   161,   145,   146,     8,   534,   162,   338,
     464,   163,   164,   217,   499,   662,   705,   218,   467,   468,
     338,   163,   164,   104,   134,   299,    96,   441,   636,   135,
     136,   442,   478,   363,    96,    96,   285,    29,   120,   163,
     164,   335,   175,   328,   516,   681,   285,   332,    96,   333,
     216,   389,   335,   161,   234,   218,     2,   515,   162,   529,
     682,   234,     2,   162,   421,   216,   114,   115,   116,   342,
     547,   514,   684,    96,   168,     2,   174,   216,   108,   114,
     115,   116,   694,   174,   530,   366,   730,   216,   158,   163,
     164,   216,   175,   117,   163,   164,   118,   119,   345,   603,
     732,   558,   531,   181,   375,   216,   454,   366,    29,   261,
     262,   263,   264,    29,   362,   234,   175,    96,   571,   378,
     216,   388,    29,    29,   168,   245,   564,   421,   161,   250,
     397,   532,   533,   162,    96,   217,   380,   633,   398,   218,
     410,   585,   404,   167,   399,   588,   257,   258,   168,   499,
     499,   400,   259,   260,   460,   265,   266,    96,   465,   592,
     174,    96,   386,   387,   163,   164,   449,   450,   278,   466,
     461,   469,   470,   471,   472,    96,   363,   557,   538,   480,
     482,   554,   117,   539,   167,   118,   119,   573,   559,  -326,
     583,   307,   617,   330,   589,   117,   584,   110,   118,   119,
     650,   651,   653,   423,    71,    72,   235,   586,    96,   587,
     590,   594,   593,    29,    29,    29,    29,   595,    29,   596,
     598,   600,   175,   601,   109,    29,   421,   615,   666,   175,
     110,   616,    29,  -341,    79,   621,   622,   629,  -341,   634,
     639,  -328,    29,   648,   120,  -327,   364,   641,   544,   646,
     647,   234,   654,   657,   168,   667,    96,   678,   659,   499,
     663,   168,   685,   677,  -329,   714,   176,   679,    29,  -341,
    -341,  -330,    29,   729,   735,    29,    29,   736,   210,   176,
     210,   110,   597,    29,   692,   746,   223,   269,   750,   167,
     751,   710,   278,   278,   713,   752,   364,   614,   753,   756,
     757,    29,    29,   267,    29,    29,   175,    29,    29,   268,
     270,    29,   692,   364,   307,   271,   153,   213,   383,   120,
     427,   364,   307,   569,   690,   638,   528,   517,   612,   444,
     372,   364,    29,   373,   511,   689,   374,     0,   168,   307,
     307,     0,     0,   307,     0,     0,     0,     0,     0,    29,
       0,    96,    29,    29,   692,   706,     0,   121,   122,   123,
     124,   125,   126,   127,   128,   129,   130,     0,     0,     0,
       0,    96,     0,     0,   364,     0,     0,     0,   496,     0,
       0,     0,     0,   339,     0,     0,     0,   649,     0,     0,
       0,     0,     0,     0,   339,   278,     0,     0,     0,   660,
     364,   364,     0,     0,     0,     0,   614,   364,     0,     0,
       0,    88,     0,     0,    88,     0,   176,     0,   107,   540,
     543,     0,     0,     0,     0,   549,   364,     0,   307,     0,
     364,     0,   364,     0,     0,   364,     0,     0,     0,   364,
       0,   233,   680,     0,     0,   364,   683,   364,     0,   686,
       0,   107,     0,     0,     0,     0,     0,     0,   364,     0,
       0,     0,     0,     0,     0,     0,   176,     0,   307,     0,
     307,   307,   307,   307,     0,   707,   708,     0,   709,     0,
       0,   711,   233,   131,     0,     0,     0,    88,     0,     0,
     176,     0,     0,     0,     0,   322,     0,     0,     0,   496,
      88,   599,   107,     0,     0,   604,   731,    88,   308,     0,
     427,     0,     0,   496,   496,   107,     0,     0,     0,     0,
       0,   169,   368,   745,     0,     0,   747,     0,   182,   307,
       0,   307,     0,     0,   169,   364,   364,     0,     0,     0,
       0,   219,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   107,     0,   233,   631,
       0,   632,   283,     0,   364,     0,     0,    88,     0,     0,
       0,   233,   364,   364,     0,     0,     0,   364,     0,     0,
       0,     0,   107,     0,     0,     0,   643,     0,     0,     0,
       0,   307,   307,     0,     0,     0,   176,     0,   110,     0,
       0,   169,     0,   176,   496,     0,     0,   451,   452,   453,
     455,     0,     0,     0,     0,     0,   496,     0,     0,    88,
     352,     0,     0,   496,     0,     0,   322,     0,     0,   307,
     307,     0,   107,     0,     0,     0,     0,    88,   169,   308,
       0,     0,     0,   322,   322,   107,     0,   322,     0,   169,
       0,     0,     0,   219,     0,     0,   308,   308,     0,   496,
     308,     0,     0,   496,     0,     0,   496,     0,     0,     0,
       0,     0,   364,     0,     0,     0,     0,     0,     0,     0,
     176,     0,     0,     0,     0,     0,     0,    88,     0,     0,
       0,     0,   496,   496,     0,   496,     0,   233,   496,     0,
      88,     0,     0,   412,    88,     0,    88,     0,     0,     0,
       0,    88,     0,   107,     0,     0,     0,     0,     0,     0,
      88,   390,     0,   496,     0,     1,   106,     2,     3,     4,
     107,   107,     0,     0,   107,   463,     0,     0,     0,   419,
     496,     0,     0,   496,     0,   428,     0,     0,     0,     0,
       0,     0,     8,     0,     0,     0,   447,    88,   479,   106,
       0,     0,     0,     0,     0,     0,     0,   308,     0,   107,
       0,     0,   322,     0,   322,   322,   322,   322,     0,     0,
       0,     0,     0,     0,     0,   308,     0,   308,   308,   308,
     308,    88,     0,     0,     0,   173,     9,    10,     0,   419,
       0,    88,     0,     0,     0,     0,     0,   204,   173,   204,
     106,   546,     0,     0,     0,   220,     0,    88,     0,   107,
       0,     0,     0,     0,    88,   390,     0,    12,    13,     0,
       0,     0,   525,   322,     0,   322,     0,     0,     0,     0,
       0,     0,     0,    15,   572,   219,   308,    51,   308,    17,
     550,     0,     0,   419,     0,     0,     0,   525,     0,   107,
     419,   107,   107,   107,   107,     0,     0,     0,     0,     0,
     566,     0,     0,     0,     0,     0,     0,   291,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   233,     0,     0,
       0,     0,     0,     0,     0,   322,   322,     0,     0,     0,
       0,    88,     0,     0,   107,   107,     0,     0,   308,   308,
     669,   670,   336,     0,     0,     0,     0,     0,     0,     0,
     107,     0,   107,   336,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   322,   322,   419,     0,     0,     0,   395,
       0,     0,     0,     0,     0,   173,   308,   308,     0,     0,
       0,     0,     0,   393,     0,   699,   700,   395,   701,   702,
     525,   107,     0,   433,   435,     0,     0,     0,     0,     0,
       0,   393,     0,     0,   448,     0,     0,   393,     0,   717,
       0,   718,   107,   107,     0,     0,     0,   727,   728,   525,
       0,     0,     0,     0,     0,   173,     0,   525,   419,     0,
       0,     0,   401,   737,     0,   738,     0,   739,     0,   740,
       0,   411,     0,     0,   107,     0,     0,   395,     0,   173,
     107,   107,     0,     0,     0,   754,     0,   755,     0,     0,
       0,   393,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,   395,   523,     0,     0,     0,     0,     0,
     395,     0,     0,     0,     0,     0,     0,   393,   522,     8,
       0,     0,     0,     0,   393,     0,     0,     0,     0,     0,
       0,   395,     0,   523,     0,   395,     0,     0,   395,     0,
       0,     0,   560,     0,     0,   393,     0,   522,   567,   393,
     568,     0,   393,     0,     0,     0,   522,   419,     0,     0,
       0,   576,   393,     9,    10,    11,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   545,
       0,     0,     0,     0,     0,   173,     0,   106,   291,     0,
       0,     0,   173,     0,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     0,     0,     0,     0,     0,     0,     0,
      15,     0,     0,   395,    16,   246,    17,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,   393,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   230,   395,   523,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   393,   522,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   395,     0,   173,
       0,     0,     0,     0,     0,   637,   395,     0,     0,     0,
     640,   393,     0,     0,     0,     0,     0,     0,     0,   393,
     393,     0,     0,     1,   522,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,   483,   484,   485,   486,
     487,   488,   489,   490,   491,   492,   493,     0,     0,     0,
      78,     0,     0,     0,     9,    10,    11,     0,    79,     0,
     494,     0,     0,     0,     0,   395,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   393,
       0,     0,     0,    81,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,    82,    83,     0,     0,     0,
      84,    15,     0,     0,     0,    16,     0,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     1,     0,
       2,     3,     4,     5,     0,     6,     7,   495,   366,  -378,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,   483,   484,   485,   486,   487,   488,   489,   490,   491,
     492,   493,     0,     0,     0,    78,     0,     0,     0,     9,
      10,    11,     0,    79,     0,   494,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      82,    83,     0,     0,     0,    84,    15,     0,     0,     0,
      16,     0,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     1,     0,     2,     3,     4,     5,     0,
       6,     7,   495,   366,  -377,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,   483,   484,   485,   486,
     487,   488,   489,   490,   491,   492,   493,     0,     0,     0,
      78,     0,     0,     0,     9,    10,    11,     0,    79,     0,
     494,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,    82,    83,     0,     0,     0,
      84,    15,     0,     0,     0,    16,     0,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     1,     0,
       2,     3,     4,     5,     0,     6,     7,   495,   366,  -379,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     9,
      10,    11,     0,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      82,    83,     0,     0,     0,    84,    15,     0,     0,     0,
      16,     0,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     1,     0,     2,     3,     4,     5,     0,
       6,     7,   229,   230,   231,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     9,    10,    11,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,    82,    83,     0,     0,     0,
      84,    15,     0,     0,     0,    16,     0,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     1,     0,
       2,     3,     4,     5,     0,     6,     7,   229,   230,   275,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     9,
      10,    11,     0,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      82,    83,     0,     0,     0,    84,    15,     0,     0,     0,
      16,     0,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     1,     0,     2,     3,     4,     5,     0,
       6,     7,   229,   230,   360,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     9,    10,    11,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,    82,    83,     0,     0,     0,
      84,    15,     0,     0,     0,    16,     0,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     1,     0,
       2,     3,     4,     5,     0,     6,     7,   371,   230,  -433,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     9,
      10,    11,     0,    79,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      82,    83,     0,     0,     0,    84,    15,     0,     0,     0,
      16,     1,    17,     2,     3,     4,     0,    18,    19,    20,
      21,    22,    23,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   229,   230,   635,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,   301,
       0,     0,     9,    10,     0,   161,    79,     0,     0,   302,
     162,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   163,   164,    82,    83,     0,     0,     0,    84,    15,
       0,     0,     0,   303,     1,    17,     2,     3,     4,     0,
       0,   167,     0,     0,   304,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   305,     0,   306,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,   301,     0,     0,     9,    10,     0,   161,    79,
       0,     0,   302,   162,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,    12,    13,     0,     0,
       0,     0,     0,     0,   163,   164,    82,    83,     0,     0,
       0,    84,    15,     0,     0,     0,   303,     1,    17,     2,
       3,     4,     0,     0,   167,     0,     0,   304,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   305,     0,
     437,     0,     0,     0,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,   301,     0,     0,     9,    10,
       0,   161,    79,     0,     0,   302,   162,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,     0,   163,   164,    82,
      83,     0,     0,     0,    84,    15,     0,     0,     0,   303,
       1,    17,     2,     3,     4,     0,     0,   167,     0,     0,
     304,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   305,     0,   456,     0,     0,     0,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,   301,     0,
       0,     9,    10,     0,   161,    79,     0,     0,   302,   162,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     163,   164,    82,    83,     0,     0,     0,    84,    15,     0,
       0,     0,   303,     1,    17,     2,     3,     4,     0,     0,
     167,     0,     0,   304,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   305,     0,   458,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,   301,     0,     0,     9,    10,     0,   161,    79,     0,
       0,   302,   162,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,    12,    13,     0,     0,     0,
       0,     0,     0,   163,   164,    82,    83,     0,     0,     0,
      84,    15,     0,     0,     0,   303,     1,    17,     2,     3,
       4,     0,     0,   167,     0,     0,   304,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   305,     0,   577,
       0,     0,     0,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,   301,     0,     0,     9,    10,     0,
     161,    79,     0,     0,   302,   162,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   163,   164,    82,    83,
       0,     0,     0,    84,    15,     0,     0,     0,   303,     1,
      17,     2,     3,     4,     0,     0,   167,     0,     0,   304,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     305,     0,   578,     0,     0,     0,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,   301,     0,     0,
       9,    10,     0,   161,    79,     0,     0,   302,   162,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,    12,    13,     0,     0,     0,     0,     0,     0,   163,
     164,    82,    83,     0,     0,     0,    84,    15,     0,     0,
       0,   303,     1,    17,     2,     3,     4,     0,     0,   167,
       0,     0,   304,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   305,     0,   579,     0,     0,     0,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
     301,     0,     0,     9,    10,     0,   161,    79,     0,     0,
     302,   162,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,    12,    13,     0,     0,     0,     0,
       0,     0,   163,   164,    82,    83,     0,     0,     0,    84,
      15,     0,     0,     0,   303,     1,    17,     2,     3,     4,
       0,     0,   167,     0,     0,   304,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   305,     0,   582,     0,
       0,     0,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,   301,     0,     0,     9,    10,     0,   161,
      79,     0,     0,   302,   162,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,    12,    13,     0,
       0,     0,     0,     0,     0,   163,   164,    82,    83,     0,
       0,     0,    84,    15,     0,     0,     0,   303,     1,    17,
       2,     3,     4,     0,     0,   167,     0,     0,   304,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   305,
       0,   644,     0,     0,     0,     8,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,   301,     0,     0,     9,
      10,     0,   161,    79,     0,     0,   302,   162,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,     0,   163,   164,
      82,    83,     0,     0,     0,    84,    15,     0,     0,     0,
     303,     1,    17,     2,     3,     4,     0,     0,   167,     0,
       0,   304,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   305,     0,   645,     0,     0,     0,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,   301,
       0,     0,     9,    10,     0,   161,    79,     0,     0,   302,
     162,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   163,   164,    82,    83,     0,     0,     0,    84,    15,
       0,     0,     0,   303,     1,    17,     2,     3,     4,     0,
       0,   167,     0,     0,   304,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   305,     0,   664,     0,     0,
       0,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,    78,   301,     0,     0,     9,    10,     0,   161,    79,
       0,     0,   302,   162,     0,     8,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,    12,    13,     0,     0,
       0,     0,     0,     0,   163,   164,    82,    83,     0,     0,
       0,    84,    15,     0,     0,     0,   303,     0,    17,     9,
      10,    11,     0,     0,   167,     0,     0,   304,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   305,     0,
     665,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
       0,     0,     0,     0,     0,     0,    15,     0,     0,     0,
      16,     0,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,   691,   748,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,   483,   484,   485,   486,
     487,   488,   489,   490,   491,   492,   493,     0,     0,     0,
      78,     0,     0,     0,     9,    10,    11,     0,    79,     0,
     494,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,    82,    83,     0,     0,     0,
      84,    15,     0,     0,     0,    16,     0,    17,     0,     0,
       0,     0,    18,    19,    20,    21,    22,    23,     1,     0,
       2,     3,     4,     5,     0,     6,     7,   495,   366,     0,
       0,     0,     0,     0,     0,     1,     0,     2,     3,     4,
       5,     0,     6,     7,     0,     8,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,     0,     0,     0,     0,     0,     0,     0,
       0,   483,   484,   485,   486,   487,   488,   489,   490,   491,
     492,   493,     0,     0,     0,     0,     0,     0,     0,     9,
      10,    11,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     9,    10,    11,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
       0,     0,     0,     0,     0,     0,    15,    12,    13,     0,
      16,     0,    17,     0,    14,     0,     0,    18,    19,    20,
      21,    22,    23,    15,     0,     0,     0,    16,     0,    17,
       0,     0,   495,   366,    18,    19,    20,    21,    22,    23,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
     230,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     9,    10,    11,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,     0,     0,     0,     0,     0,     0,    15,     0,
       0,     0,    16,     1,    17,     2,     3,     4,     0,    18,
      19,    20,    21,    22,    23,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   691,     0,     0,     0,     0,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     0,     0,     0,
      78,   301,     0,     0,     9,    10,     0,   161,    79,     0,
       0,   302,   162,     0,     8,     0,     0,     0,    80,     0,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,    81,     0,    12,    13,     0,     0,     0,
       0,     0,     0,   163,   164,    82,    83,     8,     0,     0,
      84,    15,     0,     0,     0,   303,     0,    17,     9,    10,
      11,     0,     0,   167,     0,     0,   304,     0,     1,     0,
       2,     3,     4,     5,     0,     6,     7,   305,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    12,
      13,     9,    10,    11,     0,     8,    14,     0,     0,     0,
       0,     0,     0,     0,     0,    15,     0,     0,     0,    16,
     655,    17,     0,     0,     0,     0,    18,    19,    20,    21,
      22,    23,    12,    13,     0,     0,     0,     0,     0,    14,
       0,   495,     0,     0,     0,     0,     0,     0,    15,     9,
      10,    11,    16,   687,    17,     0,     0,     0,     0,    18,
      19,    20,    21,    22,    23,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   495,     0,     0,     0,     0,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
       0,     0,     0,     0,     0,     0,    15,     0,     2,     0,
      16,     0,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   602,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,   408,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
     161,    79,     0,     0,     0,   162,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   163,   164,    82,    83,
       0,     0,     0,    84,     0,     0,     0,     2,   217,     0,
       0,     0,   218,     0,     0,     0,   167,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   542,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     0,     0,   161,
      79,     0,     0,     0,   162,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   163,   164,    82,    83,     0,
       0,     0,    84,     0,     0,     2,     0,   424,     0,     0,
       0,     0,     0,     0,     0,   167,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   425,     0,   426,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,   161,    79,     0,
       0,     0,   162,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   163,   164,    82,    83,     0,     0,     1,
      84,     2,     3,     4,     5,   363,     6,     7,     0,     0,
       0,     0,     0,   167,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,   607,     0,     0,
       0,     0,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       9,    10,    11,   161,    79,     0,     0,     0,   162,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,    12,    13,     0,     0,     0,     0,     0,    14,   163,
     164,    82,    83,     0,     0,     0,     0,    15,     0,     0,
       0,   417,   102,    17,     0,     0,     0,     0,    18,   418,
      20,    21,    22,    23,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,     0,     0,     0,     0,     0,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     9,    10,    11,     1,    79,
       2,     3,     4,     5,     0,     6,     7,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     8,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,    82,    83,     0,     0,
       0,     0,    15,     0,     0,     0,    16,   102,    17,     0,
       0,     0,     0,    18,    19,    20,    21,    22,    23,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     9,
      10,    11,   161,     0,     0,     0,     1,   162,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      12,    13,     0,     8,     0,     0,     0,    14,   163,   164,
       1,     0,     2,     3,     4,     5,    15,     6,     7,     0,
     417,   102,    17,     0,     0,     0,     0,    18,   418,    20,
      21,    22,    23,     0,     0,     0,     0,     8,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     9,    10,    11,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     8,    12,    13,
       0,     9,    10,    11,     1,    14,     2,     3,     4,     5,
       0,     6,     7,     0,    15,     0,     0,     0,    16,   102,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     8,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     9,    10,    11,     0,     0,     0,     0,    15,     0,
       0,     0,    16,     0,    17,     0,     0,   350,     0,    18,
      19,    20,    21,    22,    23,     0,     0,     0,     0,     0,
       0,     0,    12,    13,     0,     9,    10,    11,     1,    14,
       2,     3,     4,     5,     0,     6,     7,     0,    15,     0,
       0,     0,    16,     0,    17,     0,     0,   477,     0,    18,
      19,    20,    21,    22,    23,     8,    12,    13,     0,     0,
       0,     0,     1,    14,     2,     3,     4,     5,     0,     6,
       7,     0,    15,     0,     0,     0,    16,     0,    17,     0,
       0,   570,     0,    18,    19,    20,    21,    22,    23,     8,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     9,
      10,    11,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
      12,    13,     0,     9,    10,    11,     1,    14,     2,     3,
       4,     5,     0,     6,     7,     0,    15,     0,     0,     0,
      16,   652,    17,     0,     0,     0,     0,    18,    19,    20,
      21,    22,    23,     8,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     9,    10,    11,     0,     0,     0,     0,
      15,     0,     0,     0,    16,   712,    17,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,     0,     0,     0,
       0,     0,     0,     0,    12,    13,     0,     9,    10,    11,
       1,    14,     2,     3,     4,     5,     0,     6,     7,     0,
      15,     0,     0,     0,    16,     0,    17,     0,     0,     0,
       0,    18,    19,    20,    21,    22,    23,     8,    12,    13,
       0,     0,     0,     0,     1,    14,     2,     3,     4,     5,
       0,     6,     7,     0,    15,     0,     0,     0,    49,     0,
      17,     0,     0,     0,     0,    18,    19,    20,    21,    22,
      23,     8,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     9,    10,    11,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    12,    13,     0,     9,    10,    11,     0,    14,
       0,     0,     0,     0,     0,     0,     0,     0,    15,     0,
       0,     0,    51,     0,    17,     0,     0,     0,     0,    18,
      19,    20,    21,    22,    23,     0,    12,    13,     0,     0,
       0,     0,     0,    14,     2,     0,     0,     0,     0,     0,
       0,     0,    15,     0,     0,     0,   100,     0,    17,     0,
       0,     0,     0,    18,    19,    20,    21,    22,    23,     8,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,   161,    79,     0,     0,
       0,   162,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     2,     0,
       0,     0,   163,   164,    82,    83,     0,     0,     0,    84,
       0,     0,     0,     0,   389,   347,     0,     0,   218,     0,
       0,     0,   167,     8,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     0,     0,
     161,    79,     0,     0,     0,   162,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,     0,     0,
       0,     0,     2,     0,     0,     0,   163,   164,    82,    83,
       0,     0,     0,    84,     0,     0,     0,     0,   389,     0,
       0,     0,   218,     0,     0,     0,   167,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,   161,    79,     0,     0,     0,   162,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,     0,     0,     0,     0,     2,     0,     0,     0,
     163,   164,    82,    83,     0,     0,     0,    84,     0,     0,
       0,     0,   363,     0,     0,     0,     0,     0,     0,     0,
     167,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    82,    83,     0,     0,
       0,    84,     0,     0,     0,     0,     0,   443,     8,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,   161,    79,     0,     0,     0,
     162,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   163,   164,    82,    83,     0,     0,     0,    84,     0,
       0,     0,     0,   217,   347,     0,     0,   218,     0,     0,
       0,   167,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     0,     0,   161,
      79,     0,     0,     0,   162,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   163,   164,    82,    83,     0,
       0,     0,    84,     0,     0,     0,     0,   165,     0,     0,
       0,   166,     0,     0,     0,   167,     8,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,   161,    79,     0,     0,     0,   162,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   163,
     164,    82,    83,     0,     0,     0,    84,     0,     0,     0,
       0,   165,     0,     0,     0,   211,     0,     0,     0,   167,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,   161,    79,     0,
       0,     0,   162,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   163,   164,    82,    83,     0,     0,     0,
      84,     0,     0,     0,     0,   165,   284,     0,     0,     0,
       0,     0,     0,   167,     8,    54,    55,    56,    57,    58,
     184,   185,   186,   187,   188,   189,   190,   191,   192,   193,
     194,   195,    71,    72,   196,   197,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   198,     0,     0,     0,     0,     0,
       0,   161,    79,     0,     0,     0,   162,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   199,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   163,   164,   200,
     201,     0,     0,     0,    84,     0,     0,     0,     0,   165,
       0,     0,     0,   334,     0,     0,     0,   167,     8,    54,
      55,    56,    57,    58,   184,   185,   186,   187,   188,   189,
     190,   191,   192,   193,   194,   195,    71,    72,   196,   197,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   198,     0,
       0,     0,     0,     0,     0,   161,    79,     0,     0,     0,
     162,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   199,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   163,   164,   200,   201,     0,     0,     0,    84,     0,
       0,     0,     0,   165,     0,     0,     8,   343,     0,     0,
       0,   167,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,   161,    79,     0,     0,     0,   162,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   163,
     164,    82,    83,     0,     0,     0,     0,     0,     0,     0,
       0,   217,     0,     0,     0,   218,     0,     0,     0,   167,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    82,    83,     0,     0,     0,
      84,     0,     0,     0,     0,     0,   405,     8,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,    79,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    82,    83,     0,     0,     0,    84,     0,     0,
       0,     0,     0,   475,     8,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    82,
      83,     0,     0,     0,    84,     0,     0,     0,     0,   555,
       8,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,   527,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    82,    83,     0,     0,     0,
      84,     8,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    82,    83,     0,     0,
       0,    84,     8,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,   408,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     0,     0,     0,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    82,    83,     0,
       0,     0,    84,     8,    54,    55,    56,    57,    58,   184,
     185,   186,   187,   188,   189,   190,   191,   192,   193,   194,
     195,    71,    72,   196,   197,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   198,     0,     0,     0,     0,     0,     0,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   199,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   200,   201,
       0,     0,     0,    84
};

static const yytype_int16 yycheck[] =
{
       0,     0,    16,   154,   285,     5,     6,     7,   105,   117,
      17,   169,   165,     3,    14,   367,    16,    30,   172,    17,
     235,   179,   219,     3,   132,   311,   301,     3,   309,   226,
      85,     3,   367,   396,    70,    49,     9,    51,    28,    12,
       3,   537,   362,    98,    77,   153,    49,   691,    28,    49,
     105,    51,    28,    70,    71,     3,     3,    16,   421,    92,
      12,    13,     3,   129,    97,    70,    99,   598,   129,    13,
     129,   434,   328,   329,   128,   124,   332,   143,    70,   230,
     129,    28,    10,    71,   145,    13,   100,   302,   147,   733,
      49,    97,   146,    99,   309,    70,    97,   100,    99,    75,
     100,    70,    71,   423,    80,   119,   132,   133,   123,   202,
     165,   147,   167,    71,   169,    71,   131,   117,   117,   119,
     213,   134,   135,   136,   278,   656,    85,    98,   624,     5,
     147,   140,   132,   132,   409,   111,   112,   295,   152,    98,
     113,   100,   147,     3,   142,   298,   105,   202,    71,   182,
     502,   503,   152,   153,   153,   147,   146,   354,   213,   147,
     123,   524,   217,   146,   219,   318,   146,   502,   131,   202,
     146,   457,   147,   459,   146,   123,   462,    80,   147,   127,
     213,   154,   123,   131,   130,   113,   138,   139,   285,   147,
     553,   147,   165,   390,   165,   129,   202,    16,   561,   396,
     415,   202,   355,    16,   460,   461,   123,   213,   111,   112,
     127,   145,   213,   147,   227,    75,   216,   216,   499,   141,
      80,   228,   166,   129,   147,     3,   154,    80,     3,   383,
     285,   202,   146,    70,    71,   128,    49,   292,   166,   145,
     129,   144,   213,   128,   217,    46,    47,    80,   303,   129,
      28,   111,   112,   146,   309,   310,   145,   230,   111,   112,
     612,   146,   518,   123,   520,   145,     3,   211,    46,   377,
     243,   131,    85,   123,   218,    76,   235,   431,   111,   112,
     129,   562,     0,   211,    97,    98,    99,   100,   124,   303,
     218,    28,   105,     3,   580,   581,   145,    75,    76,   126,
      75,     3,   230,   303,    85,    80,   129,   124,   363,    46,
     147,     3,   409,    10,    11,   243,    97,    98,    99,    70,
      71,   146,   145,   129,   147,   298,   285,   524,   146,   302,
     131,   304,   618,   619,   389,   390,   111,   112,    75,    76,
     143,   147,   301,   146,   124,   318,   124,   124,   123,   129,
     309,   129,   129,     3,   409,   299,   131,     7,     8,     9,
      80,     3,   417,   418,   419,    75,   123,   367,   143,   424,
      80,   299,    28,   428,   123,   408,   123,   377,   377,   129,
     661,   414,   355,    75,    14,    15,    28,   124,    80,   202,
     334,   111,   112,   123,   367,   145,   147,   127,   342,   343,
     213,   111,   112,   417,   131,   127,   334,   123,   559,   136,
     137,   127,   356,   123,   342,   343,   389,   417,    27,   111,
     112,   202,   235,   146,   144,   124,   399,   146,   356,   123,
     129,   123,   213,    75,   362,   127,     3,   381,    80,     3,
     124,   369,     3,    80,   499,   129,     7,     8,     9,   127,
     409,   379,   124,   381,   235,     3,   415,   129,   417,     7,
       8,     9,   124,   422,    28,   146,   124,   129,    77,   111,
     112,   129,   285,   123,   111,   112,   126,   127,   124,   493,
     124,   425,    46,    92,   147,   129,   145,   146,   488,   141,
     142,   143,   144,   493,   144,   423,   309,   425,   442,   128,
     129,   124,   502,   503,   285,   114,   143,   562,    75,   118,
     124,    75,    76,    80,   442,   123,   147,   550,   124,   127,
     301,   465,   123,   131,   129,   469,   137,   138,   309,   502,
     503,   128,   139,   140,   146,   145,   146,   465,   127,   483,
     499,   469,   281,   282,   111,   112,   145,   145,   157,   128,
     146,   127,   124,   124,   128,   483,   123,   124,   124,   147,
     147,   124,   123,   128,   131,   126,   127,   124,   146,   146,
     124,   180,   516,   182,   124,   123,   128,    16,   126,   127,
     594,   595,   596,   144,    46,    47,   559,   128,   516,   128,
     128,   123,   143,   593,   594,   595,   596,   123,   598,   123,
     123,   145,   415,   145,   417,   605,   661,   147,   622,   422,
      49,   145,   612,    75,    76,   124,   123,   146,    80,   124,
     564,   146,   622,   143,   233,   146,   235,   128,   409,   128,
     128,   559,    58,   145,   415,   124,   564,   147,   144,   612,
     144,   422,   123,   146,   146,   145,    85,   143,   648,   111,
     112,   146,   652,    66,   147,   655,   656,   147,    97,    98,
      99,   100,   488,   663,   663,   145,   105,   149,   147,   131,
     147,   685,   281,   282,   688,   147,   285,   503,   147,   147,
     147,   681,   682,   147,   684,   685,   499,   687,   688,   148,
     150,   691,   691,   302,   303,   151,    42,    99,   278,   308,
     309,   310,   311,   439,   661,   562,   399,   384,   502,   318,
     243,   320,   712,   243,   369,   659,   243,    -1,   499,   328,
     329,    -1,    -1,   332,    -1,    -1,    -1,    -1,    -1,   729,
      -1,   659,   732,   733,   733,   679,    -1,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    -1,    -1,    -1,
      -1,   679,    -1,    -1,   363,    -1,    -1,    -1,   367,    -1,
      -1,    -1,    -1,   202,    -1,    -1,    -1,   593,    -1,    -1,
      -1,    -1,    -1,    -1,   213,   384,    -1,    -1,    -1,   605,
     389,   390,    -1,    -1,    -1,    -1,   612,   396,    -1,    -1,
      -1,     9,    -1,    -1,    12,    -1,   235,    -1,    16,   408,
     409,    -1,    -1,    -1,    -1,   414,   415,    -1,   417,    -1,
     419,    -1,   421,    -1,    -1,   424,    -1,    -1,    -1,   428,
      -1,   113,   648,    -1,    -1,   434,   652,   436,    -1,   655,
      -1,    49,    -1,    -1,    -1,    -1,    -1,    -1,   447,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   285,    -1,   457,    -1,
     459,   460,   461,   462,    -1,   681,   682,    -1,   684,    -1,
      -1,   687,   154,   144,    -1,    -1,    -1,    85,    -1,    -1,
     309,    -1,    -1,    -1,    -1,   180,    -1,    -1,    -1,   488,
      98,   490,   100,    -1,    -1,   494,   712,   105,   180,    -1,
     499,    -1,    -1,   502,   503,   113,    -1,    -1,    -1,    -1,
      -1,    85,   238,   729,    -1,    -1,   732,    -1,    92,   518,
      -1,   520,    -1,    -1,    98,   524,   525,    -1,    -1,    -1,
      -1,   105,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   154,    -1,   230,   548,
      -1,   550,   160,    -1,   553,    -1,    -1,   165,    -1,    -1,
      -1,   243,   561,   562,    -1,    -1,    -1,   566,    -1,    -1,
      -1,    -1,   180,    -1,    -1,    -1,   575,    -1,    -1,    -1,
      -1,   580,   581,    -1,    -1,    -1,   415,    -1,   417,    -1,
      -1,   165,    -1,   422,   593,    -1,    -1,   323,   324,   325,
     326,    -1,    -1,    -1,    -1,    -1,   605,    -1,    -1,   217,
     218,    -1,    -1,   612,    -1,    -1,   311,    -1,    -1,   618,
     619,    -1,   230,    -1,    -1,    -1,    -1,   235,   202,   311,
      -1,    -1,    -1,   328,   329,   243,    -1,   332,    -1,   213,
      -1,    -1,    -1,   217,    -1,    -1,   328,   329,    -1,   648,
     332,    -1,    -1,   652,    -1,    -1,   655,    -1,    -1,    -1,
      -1,    -1,   661,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     499,    -1,    -1,    -1,    -1,    -1,    -1,   285,    -1,    -1,
      -1,    -1,   681,   682,    -1,   684,    -1,   369,   687,    -1,
     298,    -1,    -1,   301,   302,    -1,   304,    -1,    -1,    -1,
      -1,   309,    -1,   311,    -1,    -1,    -1,    -1,    -1,    -1,
     318,   285,    -1,   712,    -1,     1,    16,     3,     4,     5,
     328,   329,    -1,    -1,   332,   333,    -1,    -1,    -1,   303,
     729,    -1,    -1,   732,    -1,   309,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,   320,   355,   356,    49,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   439,    -1,   367,
      -1,    -1,   457,    -1,   459,   460,   461,   462,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   457,    -1,   459,   460,   461,
     462,   389,    -1,    -1,    -1,    85,    72,    73,    -1,   363,
      -1,   399,    -1,    -1,    -1,    -1,    -1,    97,    98,    99,
     100,   409,    -1,    -1,    -1,   105,    -1,   415,    -1,   417,
      -1,    -1,    -1,    -1,   422,   389,    -1,   103,   104,    -1,
      -1,    -1,   396,   518,    -1,   520,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   119,   442,   409,   518,   123,   520,   125,
     414,    -1,    -1,   417,    -1,    -1,    -1,   421,    -1,   457,
     424,   459,   460,   461,   462,    -1,    -1,    -1,    -1,    -1,
     434,    -1,    -1,    -1,    -1,    -1,    -1,   167,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   559,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   580,   581,    -1,    -1,    -1,
      -1,   499,    -1,    -1,   502,   503,    -1,    -1,   580,   581,
     626,   627,   202,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     518,    -1,   520,   213,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   618,   619,   499,    -1,    -1,    -1,   285,
      -1,    -1,    -1,    -1,    -1,   235,   618,   619,    -1,    -1,
      -1,    -1,    -1,   285,    -1,   671,   672,   303,   674,   675,
     524,   559,    -1,   309,   310,    -1,    -1,    -1,    -1,    -1,
      -1,   303,    -1,    -1,   320,    -1,    -1,   309,    -1,   695,
      -1,   697,   580,   581,    -1,    -1,    -1,   703,   704,   553,
      -1,    -1,    -1,    -1,    -1,   285,    -1,   561,   562,    -1,
      -1,    -1,   292,   719,    -1,   721,    -1,   723,    -1,   725,
      -1,   301,    -1,    -1,   612,    -1,    -1,   363,    -1,   309,
     618,   619,    -1,    -1,    -1,   741,    -1,   743,    -1,    -1,
      -1,   363,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,   389,   390,    -1,    -1,    -1,    -1,    -1,
     396,    -1,    -1,    -1,    -1,    -1,    -1,   389,   390,    28,
      -1,    -1,    -1,    -1,   396,    -1,    -1,    -1,    -1,    -1,
      -1,   417,    -1,   419,    -1,   421,    -1,    -1,   424,    -1,
      -1,    -1,   428,    -1,    -1,   417,    -1,   419,   434,   421,
     436,    -1,   424,    -1,    -1,    -1,   428,   661,    -1,    -1,
      -1,   447,   434,    72,    73,    74,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   409,
      -1,    -1,    -1,    -1,    -1,   415,    -1,   417,   418,    -1,
      -1,    -1,   422,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     119,    -1,    -1,   499,   123,   124,   125,    -1,    -1,    -1,
      -1,   130,   131,   132,   133,   134,   135,   499,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   146,   524,   525,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   524,   525,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   553,    -1,   499,
      -1,    -1,    -1,    -1,    -1,   561,   562,    -1,    -1,    -1,
     566,   553,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   561,
     562,    -1,    -1,     1,   566,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    72,    73,    74,    -1,    76,    -1,
      78,    -1,    -1,    -1,    -1,   661,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   661,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,   110,    -1,    -1,   113,   114,    -1,    -1,    -1,
     118,   119,    -1,    -1,    -1,   123,    -1,   125,    -1,    -1,
      -1,    -1,   130,   131,   132,   133,   134,   135,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,   145,   146,   147,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,
      73,    74,    -1,    76,    -1,    78,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,
     113,   114,    -1,    -1,    -1,   118,   119,    -1,    -1,    -1,
     123,    -1,   125,    -1,    -1,    -1,    -1,   130,   131,   132,
     133,   134,   135,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,   145,   146,   147,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    72,    73,    74,    -1,    76,    -1,
      78,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,   110,    -1,    -1,   113,   114,    -1,    -1,    -1,
     118,   119,    -1,    -1,    -1,   123,    -1,   125,    -1,    -1,
      -1,    -1,   130,   131,   132,   133,   134,   135,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,   145,   146,   147,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,
      73,    74,    -1,    76,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,
     113,   114,    -1,    -1,    -1,   118,   119,    -1,    -1,    -1,
     123,    -1,   125,    -1,    -1,    -1,    -1,   130,   131,   132,
     133,   134,   135,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,   145,   146,   147,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    72,    73,    74,    -1,    76,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,   110,    -1,    -1,   113,   114,    -1,    -1,    -1,
     118,   119,    -1,    -1,    -1,   123,    -1,   125,    -1,    -1,
      -1,    -1,   130,   131,   132,   133,   134,   135,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,   145,   146,   147,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,
      73,    74,    -1,    76,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,
     113,   114,    -1,    -1,    -1,   118,   119,    -1,    -1,    -1,
     123,    -1,   125,    -1,    -1,    -1,    -1,   130,   131,   132,
     133,   134,   135,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,   145,   146,   147,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    72,    73,    74,    -1,    76,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,   110,    -1,    -1,   113,   114,    -1,    -1,    -1,
     118,   119,    -1,    -1,    -1,   123,    -1,   125,    -1,    -1,
      -1,    -1,   130,   131,   132,   133,   134,   135,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,   145,   146,   147,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    72,
      73,    74,    -1,    76,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,
     113,   114,    -1,    -1,    -1,   118,   119,    -1,    -1,    -1,
     123,     1,   125,     3,     4,     5,    -1,   130,   131,   132,
     133,   134,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   145,   146,   147,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    69,
      -1,    -1,    72,    73,    -1,    75,    76,    -1,    -1,    79,
      80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,   119,
      -1,    -1,    -1,   123,     1,   125,     3,     4,     5,    -1,
      -1,   131,    -1,    -1,   134,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   145,    -1,   147,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    69,    -1,    -1,    72,    73,    -1,    75,    76,
      -1,    -1,    79,    80,    -1,    -1,    -1,    -1,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,   119,    -1,    -1,    -1,   123,     1,   125,     3,
       4,     5,    -1,    -1,   131,    -1,    -1,   134,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   145,    -1,
     147,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    72,    73,
      -1,    75,    76,    -1,    -1,    79,    80,    -1,    -1,    -1,
      -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,
     104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,   119,    -1,    -1,    -1,   123,
       1,   125,     3,     4,     5,    -1,    -1,   131,    -1,    -1,
     134,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   145,    -1,   147,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    69,    -1,
      -1,    72,    73,    -1,    75,    76,    -1,    -1,    79,    80,
      -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,
      -1,    -1,   123,     1,   125,     3,     4,     5,    -1,    -1,
     131,    -1,    -1,   134,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   145,    -1,   147,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    69,    -1,    -1,    72,    73,    -1,    75,    76,    -1,
      -1,    79,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,
     118,   119,    -1,    -1,    -1,   123,     1,   125,     3,     4,
       5,    -1,    -1,   131,    -1,    -1,   134,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   145,    -1,   147,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    69,    -1,    -1,    72,    73,    -1,
      75,    76,    -1,    -1,    79,    80,    -1,    -1,    -1,    -1,
      -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,
      -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,   118,   119,    -1,    -1,    -1,   123,     1,
     125,     3,     4,     5,    -1,    -1,   131,    -1,    -1,   134,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     145,    -1,   147,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    69,    -1,    -1,
      72,    73,    -1,    75,    76,    -1,    -1,    79,    80,    -1,
      -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,   103,   104,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,   119,    -1,    -1,
      -1,   123,     1,   125,     3,     4,     5,    -1,    -1,   131,
      -1,    -1,   134,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   145,    -1,   147,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      69,    -1,    -1,    72,    73,    -1,    75,    76,    -1,    -1,
      79,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
     119,    -1,    -1,    -1,   123,     1,   125,     3,     4,     5,
      -1,    -1,   131,    -1,    -1,   134,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   145,    -1,   147,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    69,    -1,    -1,    72,    73,    -1,    75,
      76,    -1,    -1,    79,    80,    -1,    -1,    -1,    -1,    -1,
      86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,   119,    -1,    -1,    -1,   123,     1,   125,
       3,     4,     5,    -1,    -1,   131,    -1,    -1,   134,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   145,
      -1,   147,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    68,    69,    -1,    -1,    72,
      73,    -1,    75,    76,    -1,    -1,    79,    80,    -1,    -1,
      -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,
     113,   114,    -1,    -1,    -1,   118,   119,    -1,    -1,    -1,
     123,     1,   125,     3,     4,     5,    -1,    -1,   131,    -1,
      -1,   134,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   145,    -1,   147,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    69,
      -1,    -1,    72,    73,    -1,    75,    76,    -1,    -1,    79,
      80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,   119,
      -1,    -1,    -1,   123,     1,   125,     3,     4,     5,    -1,
      -1,   131,    -1,    -1,   134,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   145,    -1,   147,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    68,    69,    -1,    -1,    72,    73,    -1,    75,    76,
      -1,    -1,    79,    80,    -1,    28,    -1,    -1,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,
      -1,   118,   119,    -1,    -1,    -1,   123,    -1,   125,    72,
      73,    74,    -1,    -1,   131,    -1,    -1,   134,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   145,    -1,
     147,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,    -1,
     123,    -1,   125,    -1,    -1,    -1,    -1,   130,   131,   132,
     133,   134,   135,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,   146,   147,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    72,    73,    74,    -1,    76,    -1,
      78,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,   110,    -1,    -1,   113,   114,    -1,    -1,    -1,
     118,   119,    -1,    -1,    -1,   123,    -1,   125,    -1,    -1,
      -1,    -1,   130,   131,   132,   133,   134,   135,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,   145,   146,    -1,
      -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    72,
      73,    74,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    72,    73,    74,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   119,   103,   104,    -1,
     123,    -1,   125,    -1,   110,    -1,    -1,   130,   131,   132,
     133,   134,   135,   119,    -1,    -1,    -1,   123,    -1,   125,
      -1,    -1,   145,   146,   130,   131,   132,   133,   134,   135,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
     146,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    72,    73,    74,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,
      -1,    -1,   123,     1,   125,     3,     4,     5,    -1,   130,
     131,   132,   133,   134,   135,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   146,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      68,    69,    -1,    -1,    72,    73,    -1,    75,    76,    -1,
      -1,    79,    80,    -1,    28,    -1,    -1,    -1,    86,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,   101,    -1,   103,   104,    -1,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,    28,    -1,    -1,
     118,   119,    -1,    -1,    -1,   123,    -1,   125,    72,    73,
      74,    -1,    -1,   131,    -1,    -1,   134,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,   145,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   103,
     104,    72,    73,    74,    -1,    28,   110,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   119,    -1,    -1,    -1,   123,
     124,   125,    -1,    -1,    -1,    -1,   130,   131,   132,   133,
     134,   135,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,
      -1,   145,    -1,    -1,    -1,    -1,    -1,    -1,   119,    72,
      73,    74,   123,   124,   125,    -1,    -1,    -1,    -1,   130,
     131,   132,   133,   134,   135,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   145,    -1,    -1,    -1,    -1,    -1,
     103,   104,    -1,    -1,    -1,    -1,    -1,   110,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,     3,    -1,
     123,    -1,   125,    -1,    -1,    -1,    -1,   130,   131,   132,
     133,   134,   135,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   145,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    76,    -1,    -1,    -1,    80,    -1,    -1,    -1,    -1,
      -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,   118,    -1,    -1,    -1,     3,   123,    -1,
      -1,    -1,   127,    -1,    -1,    -1,   131,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   146,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,    -1,    80,    -1,    -1,    -1,    -1,    -1,
      86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,    -1,    -1,     3,    -1,   123,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   131,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   143,    -1,   145,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,
      -1,    -1,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,     1,
     118,     3,     4,     5,     6,   123,     8,     9,    -1,    -1,
      -1,    -1,    -1,   131,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,   145,    -1,    -1,
      -1,    -1,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,
      72,    73,    74,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,   114,    -1,    -1,    -1,    -1,   119,    -1,    -1,
      -1,   123,   124,   125,    -1,    -1,    -1,    -1,   130,   131,
     132,   133,   134,   135,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    -1,    -1,    -1,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    -1,    -1,    -1,    72,    73,    74,     1,    76,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    28,   103,   104,    -1,    -1,
      -1,    -1,    -1,   110,    -1,    -1,   113,   114,    -1,    -1,
      -1,    -1,   119,    -1,    -1,    -1,   123,   124,   125,    -1,
      -1,    -1,    -1,   130,   131,   132,   133,   134,   135,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    72,
      73,    74,    75,    -1,    -1,    -1,     1,    80,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     103,   104,    -1,    28,    -1,    -1,    -1,   110,   111,   112,
       1,    -1,     3,     4,     5,     6,   119,     8,     9,    -1,
     123,   124,   125,    -1,    -1,    -1,    -1,   130,   131,   132,
     133,   134,   135,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    72,    73,    74,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,   103,   104,
      -1,    72,    73,    74,     1,   110,     3,     4,     5,     6,
      -1,     8,     9,    -1,   119,    -1,    -1,    -1,   123,   124,
     125,    -1,    -1,    -1,    -1,   130,   131,   132,   133,   134,
     135,    28,   103,   104,    -1,    -1,    -1,    -1,    -1,   110,
      -1,    72,    73,    74,    -1,    -1,    -1,    -1,   119,    -1,
      -1,    -1,   123,    -1,   125,    -1,    -1,   128,    -1,   130,
     131,   132,   133,   134,   135,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   103,   104,    -1,    72,    73,    74,     1,   110,
       3,     4,     5,     6,    -1,     8,     9,    -1,   119,    -1,
      -1,    -1,   123,    -1,   125,    -1,    -1,   128,    -1,   130,
     131,   132,   133,   134,   135,    28,   103,   104,    -1,    -1,
      -1,    -1,     1,   110,     3,     4,     5,     6,    -1,     8,
       9,    -1,   119,    -1,    -1,    -1,   123,    -1,   125,    -1,
      -1,   128,    -1,   130,   131,   132,   133,   134,   135,    28,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    72,
      73,    74,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
     103,   104,    -1,    72,    73,    74,     1,   110,     3,     4,
       5,     6,    -1,     8,     9,    -1,   119,    -1,    -1,    -1,
     123,   124,   125,    -1,    -1,    -1,    -1,   130,   131,   132,
     133,   134,   135,    28,   103,   104,    -1,    -1,    -1,    -1,
      -1,   110,    -1,    72,    73,    74,    -1,    -1,    -1,    -1,
     119,    -1,    -1,    -1,   123,   124,   125,    -1,    -1,    -1,
      -1,   130,   131,   132,   133,   134,   135,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   103,   104,    -1,    72,    73,    74,
       1,   110,     3,     4,     5,     6,    -1,     8,     9,    -1,
     119,    -1,    -1,    -1,   123,    -1,   125,    -1,    -1,    -1,
      -1,   130,   131,   132,   133,   134,   135,    28,   103,   104,
      -1,    -1,    -1,    -1,     1,   110,     3,     4,     5,     6,
      -1,     8,     9,    -1,   119,    -1,    -1,    -1,   123,    -1,
     125,    -1,    -1,    -1,    -1,   130,   131,   132,   133,   134,
     135,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    72,    73,    74,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   103,   104,    -1,    72,    73,    74,    -1,   110,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   119,    -1,
      -1,    -1,   123,    -1,   125,    -1,    -1,    -1,    -1,   130,
     131,   132,   133,   134,   135,    -1,   103,   104,    -1,    -1,
      -1,    -1,    -1,   110,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   119,    -1,    -1,    -1,   123,    -1,   125,    -1,
      -1,    -1,    -1,   130,   131,   132,   133,   134,   135,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,
      -1,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,     3,    -1,
      -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,
      -1,    -1,    -1,    -1,   123,   124,    -1,    -1,   127,    -1,
      -1,    -1,   131,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    76,    -1,    -1,    -1,    80,    -1,    -1,    -1,    -1,
      -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,   111,   112,   113,   114,
      -1,    -1,    -1,   118,    -1,    -1,    -1,    -1,   123,    -1,
      -1,    -1,   127,    -1,    -1,    -1,   131,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,
      -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,
     111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,
      -1,    -1,   123,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     131,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,    -1,    -1,
      -1,   118,    -1,    -1,    -1,    -1,    -1,   124,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,
      -1,    -1,    -1,   123,   124,    -1,    -1,   127,    -1,    -1,
      -1,   131,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      76,    -1,    -1,    -1,    80,    -1,    -1,    -1,    -1,    -1,
      86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   111,   112,   113,   114,    -1,
      -1,    -1,   118,    -1,    -1,    -1,    -1,   123,    -1,    -1,
      -1,   127,    -1,    -1,    -1,   131,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,    -1,
      -1,   123,    -1,    -1,    -1,   127,    -1,    -1,    -1,   131,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    -1,    -1,    -1,    75,    76,    -1,
      -1,    -1,    80,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   111,   112,   113,   114,    -1,    -1,    -1,
     118,    -1,    -1,    -1,    -1,   123,   124,    -1,    -1,    -1,
      -1,    -1,    -1,   131,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,
      -1,    75,    76,    -1,    -1,    -1,    80,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,   112,   113,
     114,    -1,    -1,    -1,   118,    -1,    -1,    -1,    -1,   123,
      -1,    -1,    -1,   127,    -1,    -1,    -1,   131,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,
      -1,    -1,    -1,    -1,    -1,    75,    76,    -1,    -1,    -1,
      80,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   111,   112,   113,   114,    -1,    -1,    -1,   118,    -1,
      -1,    -1,    -1,   123,    -1,    -1,    28,   127,    -1,    -1,
      -1,   131,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,
      -1,    -1,    -1,    75,    76,    -1,    -1,    -1,    80,    -1,
      -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,   113,   114,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   123,    -1,    -1,    -1,   127,    -1,    -1,    -1,   131,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    76,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   113,   114,    -1,    -1,    -1,
     118,    -1,    -1,    -1,    -1,    -1,   124,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    68,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    76,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    86,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   113,   114,    -1,    -1,    -1,   118,    -1,    -1,
      -1,    -1,    -1,   124,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    76,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,
     114,    -1,    -1,    -1,   118,    -1,    -1,    -1,    -1,   123,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      68,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    76,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   113,   114,    -1,    -1,    -1,
     118,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    76,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   113,   114,    -1,    -1,
      -1,   118,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      76,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,    -1,
      -1,    -1,   118,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    76,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   101,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   113,   114,
      -1,    -1,    -1,   118
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     3,     4,     5,     6,     8,     9,    28,    72,
      73,    74,   103,   104,   110,   119,   123,   125,   130,   131,
     132,   133,   134,   135,   149,   150,   151,   153,   155,   156,
     157,   158,   159,   160,   161,   162,   163,   164,   165,   166,
     167,   168,   169,   170,   190,   191,   239,   241,   255,   123,
     156,   123,   156,   156,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    68,    76,
      86,   101,   113,   114,   118,   176,   181,   189,   190,   192,
     194,   195,   196,   204,   205,   156,   169,   173,   176,   173,
     123,   156,   124,   170,   172,   175,   189,   190,   192,   194,
     205,   224,   239,   146,     7,     8,     9,   123,   126,   127,
     149,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,   144,   171,   158,   131,   136,   137,   132,   133,    10,
      11,    12,    13,   138,   139,    14,    15,   130,   140,   141,
      16,    17,   142,   171,   146,     0,   224,   146,   149,   191,
     123,    75,    80,   111,   112,   123,   127,   131,   181,   182,
     183,   187,   188,   189,   192,   194,   205,   209,   211,   219,
     146,   149,   182,   191,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    48,    49,    68,   101,
     113,   114,   178,   181,   189,   191,   193,   194,   195,   204,
     205,   127,   211,   178,   224,   124,   129,   123,   127,   182,
     189,   192,   194,   205,   208,   210,   219,   124,   126,   145,
     146,   147,   152,   153,   169,   176,   226,   242,   248,   249,
     250,   251,   252,   253,   254,   149,   124,   152,   154,   170,
     149,   172,   152,   170,   158,   158,   158,   159,   159,   160,
     160,   161,   161,   161,   161,   162,   162,   163,   164,   165,
     166,   167,   172,   152,   170,   147,   254,   124,   149,   206,
     207,   146,   146,   190,   124,   176,   211,   220,   221,   222,
     173,   189,   218,   219,   209,   219,   123,   187,   123,   127,
     209,    69,    79,   123,   134,   145,   147,   149,   153,   176,
     182,   197,   198,   199,   200,   201,   213,   214,   216,   217,
     219,   240,   241,   243,   244,   245,   246,   247,   146,   146,
     149,   191,   146,   123,   127,   181,   189,   193,   194,   205,
     211,   173,   127,   127,   211,   124,   170,   124,   210,   220,
     128,   173,   190,   208,   219,   123,   127,   208,   158,   239,
     147,   254,   144,   123,   149,   214,   146,   233,   234,   129,
     145,   145,   249,   251,   252,   147,   124,   129,   128,   143,
     147,   144,   187,   188,   129,   147,   206,   206,   124,   123,
     182,   210,   212,   213,   215,   217,   219,   124,   124,   129,
     128,   189,   219,   209,   123,   124,   220,   173,    52,   177,
     181,   189,   190,   192,   196,   176,   214,   123,   131,   182,
     212,   219,   176,   144,   123,   143,   145,   149,   182,   202,
     203,   212,   214,   217,   219,   217,   219,   147,   201,   129,
     145,   123,   127,   124,   149,   220,   223,   182,   217,   145,
     145,   234,   234,   234,   145,   234,   147,   197,   147,   197,
     146,   146,   197,   190,   173,   127,   128,   173,   173,   127,
     124,   124,   128,   128,   208,   124,   220,   128,   173,   190,
     147,   226,   147,    54,    55,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    78,   145,   149,   172,   174,   176,
     228,   229,   230,   231,   232,   234,   235,   236,   237,   238,
     240,   250,   152,   170,   169,   173,   144,   207,   145,   147,
     145,   147,   213,   217,   219,   182,   215,    53,   222,     3,
      28,    46,    75,    76,   124,   184,   185,   186,   124,   128,
     149,   191,   146,   149,   181,   189,   190,   192,   210,   149,
     182,   191,   214,   219,   124,   123,   226,   124,   173,   146,
     217,   219,   129,   145,   143,   187,   182,   217,   217,   198,
     128,   173,   190,   124,   124,   129,   217,   147,   147,   147,
     197,   197,   147,   124,   128,   173,   128,   128,   173,   124,
     128,   128,   173,   143,   123,   123,   123,   228,   123,   149,
     145,   145,   145,   172,   149,   143,   145,   145,   179,   180,
     212,   174,   231,   174,   228,   147,   145,   173,   197,   197,
     215,   124,   123,   124,   129,   185,    70,    71,   147,   146,
     146,   149,   149,   191,   124,   147,   254,   217,   203,   173,
     217,   128,   128,   149,   147,   147,   128,   128,   143,   228,
     172,   172,   124,   172,    58,   124,   235,   145,   145,   144,
     228,   129,   145,   144,   147,   147,   172,   124,   185,   234,
     234,    70,    71,   147,    70,    71,   147,   146,   147,   143,
     228,   124,   124,   228,   124,   123,   228,   124,   235,   173,
     180,   146,   170,   225,   124,    71,   147,    70,   147,   234,
     234,   234,   234,    70,    71,   147,   173,   228,   228,   228,
     172,   228,   124,   172,   145,   225,   227,   234,   234,    71,
     147,    70,   147,    71,   147,    70,   147,   234,   234,    66,
     124,   228,   124,   129,   147,   147,   147,   234,   234,   234,
     234,    71,   147,    70,   147,   228,   145,   228,   147,   225,
     147,   147,   147,   147,   234,   234,   147,   147
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   148,   149,   150,   150,   151,   151,   151,   151,   151,
     151,   151,   151,   151,   151,   151,   151,   151,   151,   151,
     151,   151,   152,   153,   153,   153,   153,   153,   153,   153,
     153,   153,   154,   154,   154,   154,   155,   155,   155,   155,
     155,   155,   155,   156,   156,   157,   157,   157,   157,   157,
     157,   157,   158,   158,   159,   159,   159,   159,   160,   160,
     160,   161,   161,   161,   162,   162,   162,   162,   162,   163,
     163,   163,   164,   164,   165,   165,   166,   166,   167,   167,
     168,   168,   169,   169,   170,   170,   170,   170,   170,   171,
     171,   171,   171,   171,   171,   171,   171,   171,   171,   171,
     172,   172,   173,   174,   174,   174,   174,   175,   175,   175,
     175,   175,   175,   175,   175,   176,   176,   176,   176,   176,
     176,   176,   176,   176,   176,   177,   177,   177,   177,   177,
     177,   177,   177,   178,   178,   178,   178,   178,   178,   178,
     178,   178,   178,   179,   179,   180,   180,   181,   181,   181,
     181,   181,   181,   182,   182,   182,   183,   183,   183,   184,
     184,   184,   184,   184,   185,   185,   186,   186,   186,   187,
     187,   188,   188,   189,   189,   189,   190,   191,   192,   192,
     192,   192,   192,   192,   192,   192,   192,   192,   192,   192,
     192,   192,   192,   192,   192,   192,   192,   192,   192,   192,
     193,   193,   193,   193,   193,   193,   193,   193,   193,   193,
     193,   193,   193,   193,   193,   193,   193,   193,   193,   193,
     193,   194,   194,   194,   194,   194,   194,   194,   194,   194,
     194,   195,   195,   195,   195,   196,   196,   197,   197,   198,
     199,   199,   200,   200,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   200,   200,   200,   200,   200,   200,   200,
     200,   200,   201,   201,   201,   201,   201,   201,   201,   201,
     202,   202,   203,   203,   203,   203,   203,   204,   204,   205,
     205,   205,   205,   205,   206,   206,   207,   207,   207,   207,
     208,   208,   208,   208,   208,   208,   208,   208,   208,   208,
     208,   209,   209,   209,   209,   209,   210,   210,   210,   210,
     210,   210,   211,   211,   211,   211,   211,   211,   212,   212,
     212,   213,   213,   213,   213,   213,   214,   214,   214,   214,
     214,   215,   215,   215,   215,   216,   217,   217,   217,   218,
     218,   219,   219,   219,   219,   220,   220,   221,   221,   222,
     222,   222,   223,   223,   224,   224,   225,   225,   225,   226,
     226,   227,   227,   228,   228,   228,   228,   228,   228,   229,
     229,   229,   230,   230,   231,   231,   231,   232,   232,   232,
     233,   234,   234,   235,   235,   236,   236,   236,   237,   237,
     237,   237,   237,   237,   237,   238,   238,   238,   238,   238,
     239,   240,   240,   241,   241,   241,   241,   242,   242,   243,
     243,   244,   245,   246,   246,   247,   247,   247,   247,   247,
     248,   249,   250,   250,   251,   251,   252,   253,   253,   253,
     253,   253,   253,   254,   254,   254,   255
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     3,     1,     1,     1,     1,     1,
       2,     4,     2,     6,     5,     6,     5,     7,     6,     7,
       6,     1,     1,     1,     4,     3,     4,     3,     2,     3,
       2,     2,     1,     1,     3,     3,     2,     2,     2,     2,
       4,     2,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     4,     1,     3,     3,     3,     1,     3,
       3,     1,     3,     3,     1,     3,     3,     3,     3,     1,
       3,     3,     1,     3,     1,     3,     1,     3,     1,     3,
       1,     3,     1,     5,     1,     3,     3,     3,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     1,     2,     3,     2,     5,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     3,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     4,     1,     2,     3,     6,
       5,     1,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     4,
       1,     5,     4,     4,     3,     5,     6,     5,     5,     4,
       6,     2,     2,     3,     3,     1,     1,     1,     2,     3,
       1,     3,     9,     9,     7,     7,     5,    10,    10,     8,
       8,     6,     8,     8,     6,     6,     4,     9,     9,     7,
       7,     5,     3,     2,     2,     2,     1,     2,     1,     1,
       1,     3,     1,     2,     2,     3,     5,     2,     2,     4,
       5,     7,     7,     5,     1,     3,     1,     3,     2,     4,
       3,     2,     3,     3,     3,     4,     4,     2,     3,     3,
       4,     3,     2,     3,     3,     4,     1,     1,     2,     2,
       2,     3,     1,     1,     2,     2,     2,     3,     1,     2,
       3,     1,     3,     4,     3,     4,     1,     2,     2,     3,
       3,     1,     1,     2,     2,     2,     3,     3,     2,     1,
       2,     1,     2,     2,     3,     1,     3,     1,     3,     2,
       2,     1,     1,     3,     1,     2,     1,     3,     4,     1,
       1,     1,     3,     1,     1,     1,     1,     1,     1,     3,
       4,     3,     1,     2,     1,     2,     2,     1,     1,     2,
       1,     2,     3,     1,     2,     5,     7,     5,     5,     7,
       6,     7,     4,     5,     4,     3,     2,     2,     2,     3,
       1,     5,     4,     4,     3,     4,     3,     3,     2,     2,
       1,     3,     4,     3,     2,     2,     2,     2,     2,     2,
       2,     2,     3,     1,     1,     3,     2,     1,     1,     2,
       2,     1,     2,     1,     1,     2,     1
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
          case 149: /* identifier  */
#line 161 "expression.y" /* yacc.c:1274  */
      { FreeIdentifier(((*yyvaluep).id)); }
#line 3202 "expression.ec" /* yacc.c:1274  */
        break;

    case 150: /* primary_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3208 "expression.ec" /* yacc.c:1274  */
        break;

    case 153: /* postfix_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3214 "expression.ec" /* yacc.c:1274  */
        break;

    case 154: /* argument_expression_list  */
#line 196 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeExpression); }
#line 3220 "expression.ec" /* yacc.c:1274  */
        break;

    case 156: /* unary_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3226 "expression.ec" /* yacc.c:1274  */
        break;

    case 158: /* cast_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3232 "expression.ec" /* yacc.c:1274  */
        break;

    case 159: /* multiplicative_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3238 "expression.ec" /* yacc.c:1274  */
        break;

    case 160: /* additive_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3244 "expression.ec" /* yacc.c:1274  */
        break;

    case 161: /* shift_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3250 "expression.ec" /* yacc.c:1274  */
        break;

    case 162: /* relational_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3256 "expression.ec" /* yacc.c:1274  */
        break;

    case 163: /* equality_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3262 "expression.ec" /* yacc.c:1274  */
        break;

    case 164: /* and_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3268 "expression.ec" /* yacc.c:1274  */
        break;

    case 165: /* exclusive_or_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3274 "expression.ec" /* yacc.c:1274  */
        break;

    case 166: /* inclusive_or_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3280 "expression.ec" /* yacc.c:1274  */
        break;

    case 167: /* logical_and_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3286 "expression.ec" /* yacc.c:1274  */
        break;

    case 168: /* logical_or_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3292 "expression.ec" /* yacc.c:1274  */
        break;

    case 169: /* conditional_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3298 "expression.ec" /* yacc.c:1274  */
        break;

    case 170: /* assignment_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3304 "expression.ec" /* yacc.c:1274  */
        break;

    case 172: /* expression  */
#line 196 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeExpression); }
#line 3310 "expression.ec" /* yacc.c:1274  */
        break;

    case 173: /* constant_expression  */
#line 163 "expression.y" /* yacc.c:1274  */
      { FreeExpression(((*yyvaluep).exp)); }
#line 3316 "expression.ec" /* yacc.c:1274  */
        break;

    case 174: /* declaration  */
#line 182 "expression.y" /* yacc.c:1274  */
      { FreeDeclaration(((*yyvaluep).declaration)); }
#line 3322 "expression.ec" /* yacc.c:1274  */
        break;

    case 175: /* specifier_qualifier_list  */
#line 198 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeSpecifier); }
#line 3328 "expression.ec" /* yacc.c:1274  */
        break;

    case 176: /* declaration_specifiers  */
#line 198 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeSpecifier); }
#line 3334 "expression.ec" /* yacc.c:1274  */
        break;

    case 179: /* init_declarator_list  */
#line 202 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeInitDeclarator); }
#line 3340 "expression.ec" /* yacc.c:1274  */
        break;

    case 180: /* init_declarator  */
#line 177 "expression.y" /* yacc.c:1274  */
      { FreeInitDeclarator(((*yyvaluep).initDeclarator)); }
#line 3346 "expression.ec" /* yacc.c:1274  */
        break;

    case 181: /* storage_class_specifier  */
#line 169 "expression.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3352 "expression.ec" /* yacc.c:1274  */
        break;

    case 182: /* ext_decl  */
#line 210 "expression.y" /* yacc.c:1274  */
      { FreeExtDecl(((*yyvaluep).extDecl)); }
#line 3358 "expression.ec" /* yacc.c:1274  */
        break;

    case 184: /* attribute_word  */
#line 193 "expression.y" /* yacc.c:1274  */
      { delete ((*yyvaluep).string); }
#line 3364 "expression.ec" /* yacc.c:1274  */
        break;

    case 185: /* attribute  */
#line 211 "expression.y" /* yacc.c:1274  */
      { FreeAttribute(((*yyvaluep).attribute)); }
#line 3370 "expression.ec" /* yacc.c:1274  */
        break;

    case 186: /* attribs_list  */
#line 212 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeAttribute); }
#line 3376 "expression.ec" /* yacc.c:1274  */
        break;

    case 187: /* attrib  */
#line 209 "expression.y" /* yacc.c:1274  */
      { FreeAttrib(((*yyvaluep).attrib)); }
#line 3382 "expression.ec" /* yacc.c:1274  */
        break;

    case 188: /* multi_attrib  */
#line 213 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeAttrib); }
#line 3388 "expression.ec" /* yacc.c:1274  */
        break;

    case 189: /* type_qualifier  */
#line 169 "expression.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3394 "expression.ec" /* yacc.c:1274  */
        break;

    case 190: /* type  */
#line 169 "expression.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3400 "expression.ec" /* yacc.c:1274  */
        break;

    case 191: /* strict_type  */
#line 169 "expression.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3406 "expression.ec" /* yacc.c:1274  */
        break;

    case 192: /* type_specifier  */
#line 169 "expression.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3412 "expression.ec" /* yacc.c:1274  */
        break;

    case 193: /* strict_type_specifier  */
#line 169 "expression.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3418 "expression.ec" /* yacc.c:1274  */
        break;

    case 194: /* struct_or_union_specifier_compound  */
#line 169 "expression.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3424 "expression.ec" /* yacc.c:1274  */
        break;

    case 195: /* struct_or_union_specifier_nocompound  */
#line 169 "expression.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3430 "expression.ec" /* yacc.c:1274  */
        break;

    case 197: /* struct_declaration_list  */
#line 205 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeClassDef); }
#line 3436 "expression.ec" /* yacc.c:1274  */
        break;

    case 198: /* default_property  */
#line 186 "expression.y" /* yacc.c:1274  */
      { FreeMemberInit(((*yyvaluep).memberInit)); }
#line 3442 "expression.ec" /* yacc.c:1274  */
        break;

    case 199: /* default_property_list  */
#line 206 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeMemberInit); }
#line 3448 "expression.ec" /* yacc.c:1274  */
        break;

    case 200: /* property  */
#line 194 "expression.y" /* yacc.c:1274  */
      { FreeProperty(((*yyvaluep).prop)); }
#line 3454 "expression.ec" /* yacc.c:1274  */
        break;

    case 201: /* struct_declaration  */
#line 192 "expression.y" /* yacc.c:1274  */
      { FreeClassDef(((*yyvaluep).classDef)); }
#line 3460 "expression.ec" /* yacc.c:1274  */
        break;

    case 202: /* struct_declarator_list  */
#line 199 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeDeclarator); }
#line 3466 "expression.ec" /* yacc.c:1274  */
        break;

    case 203: /* struct_declarator  */
#line 172 "expression.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3472 "expression.ec" /* yacc.c:1274  */
        break;

    case 204: /* enum_specifier_nocompound  */
#line 169 "expression.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3478 "expression.ec" /* yacc.c:1274  */
        break;

    case 205: /* enum_specifier_compound  */
#line 169 "expression.y" /* yacc.c:1274  */
      { FreeSpecifier(((*yyvaluep).specifier)); }
#line 3484 "expression.ec" /* yacc.c:1274  */
        break;

    case 206: /* enumerator_list  */
#line 197 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeEnumerator); }
#line 3490 "expression.ec" /* yacc.c:1274  */
        break;

    case 207: /* enumerator  */
#line 171 "expression.y" /* yacc.c:1274  */
      { FreeEnumerator(((*yyvaluep).enumerator)); }
#line 3496 "expression.ec" /* yacc.c:1274  */
        break;

    case 208: /* direct_abstract_declarator  */
#line 172 "expression.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3502 "expression.ec" /* yacc.c:1274  */
        break;

    case 209: /* direct_abstract_declarator_noarray  */
#line 172 "expression.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3508 "expression.ec" /* yacc.c:1274  */
        break;

    case 210: /* abstract_declarator  */
#line 172 "expression.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3514 "expression.ec" /* yacc.c:1274  */
        break;

    case 211: /* abstract_declarator_noarray  */
#line 172 "expression.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3520 "expression.ec" /* yacc.c:1274  */
        break;

    case 212: /* declarator  */
#line 172 "expression.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3526 "expression.ec" /* yacc.c:1274  */
        break;

    case 213: /* direct_declarator_nofunction  */
#line 172 "expression.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3532 "expression.ec" /* yacc.c:1274  */
        break;

    case 214: /* declarator_function  */
#line 172 "expression.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3538 "expression.ec" /* yacc.c:1274  */
        break;

    case 215: /* direct_declarator  */
#line 172 "expression.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3544 "expression.ec" /* yacc.c:1274  */
        break;

    case 216: /* direct_declarator_function_start  */
#line 172 "expression.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3550 "expression.ec" /* yacc.c:1274  */
        break;

    case 217: /* direct_declarator_function  */
#line 172 "expression.y" /* yacc.c:1274  */
      { FreeDeclarator(((*yyvaluep).declarator)); }
#line 3556 "expression.ec" /* yacc.c:1274  */
        break;

    case 218: /* type_qualifier_list  */
#line 198 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeSpecifier); }
#line 3562 "expression.ec" /* yacc.c:1274  */
        break;

    case 219: /* pointer  */
#line 162 "expression.y" /* yacc.c:1274  */
      { FreePointer(((*yyvaluep).pointer)); }
#line 3568 "expression.ec" /* yacc.c:1274  */
        break;

    case 220: /* parameter_type_list  */
#line 203 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeTypeName); }
#line 3574 "expression.ec" /* yacc.c:1274  */
        break;

    case 221: /* parameter_list  */
#line 203 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeTypeName); }
#line 3580 "expression.ec" /* yacc.c:1274  */
        break;

    case 222: /* parameter_declaration  */
#line 178 "expression.y" /* yacc.c:1274  */
      { FreeTypeName(((*yyvaluep).typeName)); }
#line 3586 "expression.ec" /* yacc.c:1274  */
        break;

    case 223: /* identifier_list  */
#line 203 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeTypeName); }
#line 3592 "expression.ec" /* yacc.c:1274  */
        break;

    case 224: /* type_name  */
#line 178 "expression.y" /* yacc.c:1274  */
      { FreeTypeName(((*yyvaluep).typeName)); }
#line 3598 "expression.ec" /* yacc.c:1274  */
        break;

    case 225: /* initializer  */
#line 176 "expression.y" /* yacc.c:1274  */
      { FreeInitializer(((*yyvaluep).initializer)); }
#line 3604 "expression.ec" /* yacc.c:1274  */
        break;

    case 226: /* initializer_condition  */
#line 176 "expression.y" /* yacc.c:1274  */
      { FreeInitializer(((*yyvaluep).initializer)); }
#line 3610 "expression.ec" /* yacc.c:1274  */
        break;

    case 227: /* initializer_list  */
#line 201 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeInitializer); }
#line 3616 "expression.ec" /* yacc.c:1274  */
        break;

    case 228: /* statement  */
#line 179 "expression.y" /* yacc.c:1274  */
      { FreeStatement(((*yyvaluep).stmt)); }
#line 3622 "expression.ec" /* yacc.c:1274  */
        break;

    case 229: /* labeled_statement  */
#line 179 "expression.y" /* yacc.c:1274  */
      { FreeStatement(((*yyvaluep).stmt)); }
#line 3628 "expression.ec" /* yacc.c:1274  */
        break;

    case 230: /* declaration_list  */
#line 200 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeDeclaration); }
#line 3634 "expression.ec" /* yacc.c:1274  */
        break;

    case 231: /* statement_list  */
#line 204 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeStatement); }
#line 3640 "expression.ec" /* yacc.c:1274  */
        break;

    case 232: /* compound_inside  */
#line 179 "expression.y" /* yacc.c:1274  */
      { FreeStatement(((*yyvaluep).stmt)); }
#line 3646 "expression.ec" /* yacc.c:1274  */
        break;

    case 233: /* compound_start  */
#line 208 "expression.y" /* yacc.c:1274  */
      { PopContext(((*yyvaluep).context)); FreeContext(((*yyvaluep).context)); delete ((*yyvaluep).context); }
#line 3652 "expression.ec" /* yacc.c:1274  */
        break;

    case 234: /* compound_statement  */
#line 179 "expression.y" /* yacc.c:1274  */
      { FreeStatement(((*yyvaluep).stmt)); }
#line 3658 "expression.ec" /* yacc.c:1274  */
        break;

    case 235: /* expression_statement  */
#line 179 "expression.y" /* yacc.c:1274  */
      { FreeStatement(((*yyvaluep).stmt)); }
#line 3664 "expression.ec" /* yacc.c:1274  */
        break;

    case 236: /* selection_statement  */
#line 179 "expression.y" /* yacc.c:1274  */
      { FreeStatement(((*yyvaluep).stmt)); }
#line 3670 "expression.ec" /* yacc.c:1274  */
        break;

    case 237: /* iteration_statement  */
#line 179 "expression.y" /* yacc.c:1274  */
      { FreeStatement(((*yyvaluep).stmt)); }
#line 3676 "expression.ec" /* yacc.c:1274  */
        break;

    case 238: /* jump_statement  */
#line 179 "expression.y" /* yacc.c:1274  */
      { FreeStatement(((*yyvaluep).stmt)); }
#line 3682 "expression.ec" /* yacc.c:1274  */
        break;

    case 239: /* string_literal  */
#line 193 "expression.y" /* yacc.c:1274  */
      { delete ((*yyvaluep).string); }
#line 3688 "expression.ec" /* yacc.c:1274  */
        break;

    case 240: /* instantiation_named  */
#line 184 "expression.y" /* yacc.c:1274  */
      { FreeInstance(((*yyvaluep).instance)); }
#line 3694 "expression.ec" /* yacc.c:1274  */
        break;

    case 241: /* instantiation_unnamed  */
#line 184 "expression.y" /* yacc.c:1274  */
      { FreeInstance(((*yyvaluep).instance)); }
#line 3700 "expression.ec" /* yacc.c:1274  */
        break;

    case 243: /* class_function_definition_start  */
#line 188 "expression.y" /* yacc.c:1274  */
      { FreeClassFunction(((*yyvaluep).classFunction)); }
#line 3706 "expression.ec" /* yacc.c:1274  */
        break;

    case 244: /* constructor_function_definition_start  */
#line 188 "expression.y" /* yacc.c:1274  */
      { FreeClassFunction(((*yyvaluep).classFunction)); }
#line 3712 "expression.ec" /* yacc.c:1274  */
        break;

    case 245: /* destructor_function_definition_start  */
#line 188 "expression.y" /* yacc.c:1274  */
      { FreeClassFunction(((*yyvaluep).classFunction)); }
#line 3718 "expression.ec" /* yacc.c:1274  */
        break;

    case 246: /* virtual_class_function_definition_start  */
#line 188 "expression.y" /* yacc.c:1274  */
      { FreeClassFunction(((*yyvaluep).classFunction)); }
#line 3724 "expression.ec" /* yacc.c:1274  */
        break;

    case 247: /* class_function_definition  */
#line 188 "expression.y" /* yacc.c:1274  */
      { FreeClassFunction(((*yyvaluep).classFunction)); }
#line 3730 "expression.ec" /* yacc.c:1274  */
        break;

    case 248: /* instance_class_function_definition_start  */
#line 188 "expression.y" /* yacc.c:1274  */
      { FreeClassFunction(((*yyvaluep).classFunction)); }
#line 3736 "expression.ec" /* yacc.c:1274  */
        break;

    case 249: /* instance_class_function_definition  */
#line 188 "expression.y" /* yacc.c:1274  */
      { FreeClassFunction(((*yyvaluep).classFunction)); }
#line 3742 "expression.ec" /* yacc.c:1274  */
        break;

    case 250: /* data_member_initialization  */
#line 186 "expression.y" /* yacc.c:1274  */
      { FreeMemberInit(((*yyvaluep).memberInit)); }
#line 3748 "expression.ec" /* yacc.c:1274  */
        break;

    case 251: /* data_member_initialization_list  */
#line 206 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeMemberInit); }
#line 3754 "expression.ec" /* yacc.c:1274  */
        break;

    case 252: /* data_member_initialization_list_coloned  */
#line 206 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeMemberInit); }
#line 3760 "expression.ec" /* yacc.c:1274  */
        break;

    case 253: /* members_initialization_list_coloned  */
#line 207 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeMembersInit); }
#line 3766 "expression.ec" /* yacc.c:1274  */
        break;

    case 254: /* members_initialization_list  */
#line 207 "expression.y" /* yacc.c:1274  */
      { FreeList(((*yyvaluep).list), FreeMembersInit); }
#line 3772 "expression.ec" /* yacc.c:1274  */
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
#line 221 "expression.y" /* yacc.c:1663  */
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[0]); }
#line 4071 "expression.ec" /* yacc.c:1663  */
    break;

  case 4:
#line 227 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpBrackets((yyvsp[-1].list)); (yyval.exp).loc = (yyloc); }
#line 4077 "expression.ec" /* yacc.c:1663  */
    break;

  case 5:
#line 232 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpIdentifier((yyvsp[0].id)); (yyval.exp).loc = (yyloc); }
#line 4083 "expression.ec" /* yacc.c:1663  */
    break;

  case 6:
#line 234 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); }
#line 4089 "expression.ec" /* yacc.c:1663  */
    break;

  case 7:
#line 236 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); }
#line 4095 "expression.ec" /* yacc.c:1663  */
    break;

  case 8:
#line 237 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpWideString(yytext); (yyval.exp).loc = (yyloc); }
#line 4101 "expression.ec" /* yacc.c:1663  */
    break;

  case 9:
#line 239 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpString((yyvsp[0].string)); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); }
#line 4107 "expression.ec" /* yacc.c:1663  */
    break;

  case 10:
#line 240 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpIntlString((yyvsp[0].string), null); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); }
#line 4113 "expression.ec" /* yacc.c:1663  */
    break;

  case 11:
#line 241 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpIntlString((yyvsp[0].string), (yyvsp[-2].string)); delete (yyvsp[-2].string); delete (yyvsp[0].string); (yyval.exp).loc = (yyloc); }
#line 4119 "expression.ec" /* yacc.c:1663  */
    break;

  case 12:
#line 243 "expression.y" /* yacc.c:1663  */
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[-1]).end; exp.loc.end = (yylsp[0]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); }
#line 4125 "expression.ec" /* yacc.c:1663  */
    break;

  case 13:
#line 245 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); }
#line 4131 "expression.ec" /* yacc.c:1663  */
    break;

  case 14:
#line 246 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); }
#line 4137 "expression.ec" /* yacc.c:1663  */
    break;

  case 15:
#line 247 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); }
#line 4143 "expression.ec" /* yacc.c:1663  */
    break;

  case 16:
#line 248 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); }
#line 4149 "expression.ec" /* yacc.c:1663  */
    break;

  case 17:
#line 249 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpRenew((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); }
#line 4155 "expression.ec" /* yacc.c:1663  */
    break;

  case 18:
#line 250 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpRenew((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); }
#line 4161 "expression.ec" /* yacc.c:1663  */
    break;

  case 19:
#line 251 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpRenew0((yyvsp[-5].exp), MkTypeName((yyvsp[-4].list),(yyvsp[-3].declarator)), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); }
#line 4167 "expression.ec" /* yacc.c:1663  */
    break;

  case 20:
#line 252 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpRenew0((yyvsp[-4].exp), MkTypeName((yyvsp[-3].list),null), (yyvsp[-1].exp)); (yyval.exp).loc = (yyloc); }
#line 4173 "expression.ec" /* yacc.c:1663  */
    break;

  case 21:
#line 253 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpDummy(); yyerror(); }
#line 4179 "expression.ec" /* yacc.c:1663  */
    break;

  case 22:
#line 257 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpInstance((yyvsp[0].instance)); (yyval.exp).loc = (yyloc); }
#line 4185 "expression.ec" /* yacc.c:1663  */
    break;

  case 24:
#line 262 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpIndex((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).loc = (yyloc); }
#line 4191 "expression.ec" /* yacc.c:1663  */
    break;

  case 25:
#line 263 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpCall((yyvsp[-2].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[-1]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); }
#line 4197 "expression.ec" /* yacc.c:1663  */
    break;

  case 26:
#line 264 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpCall((yyvsp[-3].exp), (yyvsp[-1].list)); (yyval.exp).call.argLoc.start = (yylsp[-2]).start; (yyval.exp).call.argLoc.end = (yylsp[0]).end; (yyval.exp).loc = (yyloc); }
#line 4203 "expression.ec" /* yacc.c:1663  */
    break;

  case 27:
#line 265 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpMember((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); }
#line 4209 "expression.ec" /* yacc.c:1663  */
    break;

  case 28:
#line 267 "expression.y" /* yacc.c:1663  */
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
#line 4226 "expression.ec" /* yacc.c:1663  */
    break;

  case 29:
#line 279 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpPointer((yyvsp[-2].exp), (yyvsp[0].id)); (yyval.exp).loc = (yyloc); }
#line 4232 "expression.ec" /* yacc.c:1663  */
    break;

  case 30:
#line 280 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), INC_OP, null); (yyval.exp).loc = (yyloc); }
#line 4238 "expression.ec" /* yacc.c:1663  */
    break;

  case 31:
#line 281 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-1].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); }
#line 4244 "expression.ec" /* yacc.c:1663  */
    break;

  case 32:
#line 311 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); }
#line 4250 "expression.ec" /* yacc.c:1663  */
    break;

  case 33:
#line 312 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); }
#line 4256 "expression.ec" /* yacc.c:1663  */
    break;

  case 34:
#line 313 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  }
#line 4262 "expression.ec" /* yacc.c:1663  */
    break;

  case 35:
#line 314 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), (yyvsp[0].exp));  }
#line 4268 "expression.ec" /* yacc.c:1663  */
    break;

  case 36:
#line 318 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4274 "expression.ec" /* yacc.c:1663  */
    break;

  case 37:
#line 319 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4280 "expression.ec" /* yacc.c:1663  */
    break;

  case 38:
#line 320 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp(null, (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4286 "expression.ec" /* yacc.c:1663  */
    break;

  case 39:
#line 323 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4292 "expression.ec" /* yacc.c:1663  */
    break;

  case 40:
#line 324 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpTypeSize((yyvsp[-1].typeName)); (yyval.exp).loc = (yyloc); }
#line 4298 "expression.ec" /* yacc.c:1663  */
    break;

  case 41:
#line 327 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4304 "expression.ec" /* yacc.c:1663  */
    break;

  case 42:
#line 328 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpTypeAlign((yyvsp[-1].typeName)); (yyval.exp).loc = (yyloc); }
#line 4310 "expression.ec" /* yacc.c:1663  */
    break;

  case 45:
#line 342 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = '&'; }
#line 4316 "expression.ec" /* yacc.c:1663  */
    break;

  case 46:
#line 343 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = '*'; }
#line 4322 "expression.ec" /* yacc.c:1663  */
    break;

  case 47:
#line 344 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = '+'; }
#line 4328 "expression.ec" /* yacc.c:1663  */
    break;

  case 48:
#line 345 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = '-'; }
#line 4334 "expression.ec" /* yacc.c:1663  */
    break;

  case 49:
#line 346 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = '~'; }
#line 4340 "expression.ec" /* yacc.c:1663  */
    break;

  case 50:
#line 347 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = '!'; }
#line 4346 "expression.ec" /* yacc.c:1663  */
    break;

  case 51:
#line 348 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = DELETE; }
#line 4352 "expression.ec" /* yacc.c:1663  */
    break;

  case 53:
#line 353 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpCast((yyvsp[-2].typeName), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4358 "expression.ec" /* yacc.c:1663  */
    break;

  case 55:
#line 358 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '*', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4364 "expression.ec" /* yacc.c:1663  */
    break;

  case 56:
#line 359 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '/', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4370 "expression.ec" /* yacc.c:1663  */
    break;

  case 57:
#line 360 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '%', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4376 "expression.ec" /* yacc.c:1663  */
    break;

  case 59:
#line 365 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '+', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4382 "expression.ec" /* yacc.c:1663  */
    break;

  case 60:
#line 366 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '-', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4388 "expression.ec" /* yacc.c:1663  */
    break;

  case 62:
#line 371 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LEFT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4394 "expression.ec" /* yacc.c:1663  */
    break;

  case 63:
#line 372 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), RIGHT_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4400 "expression.ec" /* yacc.c:1663  */
    break;

  case 65:
#line 377 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '<', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4406 "expression.ec" /* yacc.c:1663  */
    break;

  case 66:
#line 378 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '>', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4412 "expression.ec" /* yacc.c:1663  */
    break;

  case 67:
#line 379 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), LE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4418 "expression.ec" /* yacc.c:1663  */
    break;

  case 68:
#line 380 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), GE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4424 "expression.ec" /* yacc.c:1663  */
    break;

  case 70:
#line 385 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), EQ_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4430 "expression.ec" /* yacc.c:1663  */
    break;

  case 71:
#line 386 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), NE_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4436 "expression.ec" /* yacc.c:1663  */
    break;

  case 73:
#line 391 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '&', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4442 "expression.ec" /* yacc.c:1663  */
    break;

  case 75:
#line 396 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '^', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4448 "expression.ec" /* yacc.c:1663  */
    break;

  case 77:
#line 401 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), '|', (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4454 "expression.ec" /* yacc.c:1663  */
    break;

  case 79:
#line 406 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), AND_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4460 "expression.ec" /* yacc.c:1663  */
    break;

  case 81:
#line 411 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), OR_OP, (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4466 "expression.ec" /* yacc.c:1663  */
    break;

  case 83:
#line 416 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpCondition((yyvsp[-4].exp), (yyvsp[-2].list), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4472 "expression.ec" /* yacc.c:1663  */
    break;

  case 85:
#line 421 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4478 "expression.ec" /* yacc.c:1663  */
    break;

  case 86:
#line 422 "expression.y" /* yacc.c:1663  */
    { yyerror(); (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4484 "expression.ec" /* yacc.c:1663  */
    break;

  case 87:
#line 424 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4490 "expression.ec" /* yacc.c:1663  */
    break;

  case 88:
#line 425 "expression.y" /* yacc.c:1663  */
    { (yyval.exp) = MkExpOp((yyvsp[-2].exp), (yyvsp[-1].i), (yyvsp[0].exp)); (yyval.exp).loc = (yyloc); }
#line 4496 "expression.ec" /* yacc.c:1663  */
    break;

  case 89:
#line 429 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = '='; }
#line 4502 "expression.ec" /* yacc.c:1663  */
    break;

  case 90:
#line 430 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = MUL_ASSIGN; }
#line 4508 "expression.ec" /* yacc.c:1663  */
    break;

  case 91:
#line 431 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = DIV_ASSIGN; }
#line 4514 "expression.ec" /* yacc.c:1663  */
    break;

  case 92:
#line 432 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = MOD_ASSIGN; }
#line 4520 "expression.ec" /* yacc.c:1663  */
    break;

  case 93:
#line 433 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = ADD_ASSIGN; }
#line 4526 "expression.ec" /* yacc.c:1663  */
    break;

  case 94:
#line 434 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = SUB_ASSIGN; }
#line 4532 "expression.ec" /* yacc.c:1663  */
    break;

  case 95:
#line 435 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = LEFT_ASSIGN; }
#line 4538 "expression.ec" /* yacc.c:1663  */
    break;

  case 96:
#line 436 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = RIGHT_ASSIGN; }
#line 4544 "expression.ec" /* yacc.c:1663  */
    break;

  case 97:
#line 437 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = AND_ASSIGN; }
#line 4550 "expression.ec" /* yacc.c:1663  */
    break;

  case 98:
#line 438 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = XOR_ASSIGN; }
#line 4556 "expression.ec" /* yacc.c:1663  */
    break;

  case 99:
#line 439 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = OR_ASSIGN; }
#line 4562 "expression.ec" /* yacc.c:1663  */
    break;

  case 100:
#line 443 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].exp)); }
#line 4568 "expression.ec" /* yacc.c:1663  */
    break;

  case 101:
#line 444 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), (yyvsp[0].exp)); }
#line 4574 "expression.ec" /* yacc.c:1663  */
    break;

  case 103:
#line 452 "expression.y" /* yacc.c:1663  */
    { (yyval.declaration) = MkDeclaration((yyvsp[-1].list), null); (yyval.declaration).loc = (yyloc); }
#line 4580 "expression.ec" /* yacc.c:1663  */
    break;

  case 104:
#line 453 "expression.y" /* yacc.c:1663  */
    { (yyval.declaration) = MkDeclaration((yyvsp[-2].list), (yyvsp[-1].list)); (yyval.declaration).loc = (yyloc); }
#line 4586 "expression.ec" /* yacc.c:1663  */
    break;

  case 105:
#line 454 "expression.y" /* yacc.c:1663  */
    { (yyval.declaration) = MkDeclarationInst((yyvsp[-1].instance)); (yyval.declaration).loc = (yyloc); }
#line 4592 "expression.ec" /* yacc.c:1663  */
    break;

  case 106:
#line 455 "expression.y" /* yacc.c:1663  */
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[-3].id), (yyvsp[-1].exp)); (yyval.declaration).loc = (yyloc); }
#line 4598 "expression.ec" /* yacc.c:1663  */
    break;

  case 107:
#line 459 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4604 "expression.ec" /* yacc.c:1663  */
    break;

  case 108:
#line 460 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4610 "expression.ec" /* yacc.c:1663  */
    break;

  case 109:
#line 461 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4616 "expression.ec" /* yacc.c:1663  */
    break;

  case 110:
#line 462 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4622 "expression.ec" /* yacc.c:1663  */
    break;

  case 111:
#line 463 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4628 "expression.ec" /* yacc.c:1663  */
    break;

  case 112:
#line 464 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4634 "expression.ec" /* yacc.c:1663  */
    break;

  case 113:
#line 465 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4640 "expression.ec" /* yacc.c:1663  */
    break;

  case 114:
#line 466 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4646 "expression.ec" /* yacc.c:1663  */
    break;

  case 115:
#line 470 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4652 "expression.ec" /* yacc.c:1663  */
    break;

  case 116:
#line 471 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4658 "expression.ec" /* yacc.c:1663  */
    break;

  case 117:
#line 472 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4664 "expression.ec" /* yacc.c:1663  */
    break;

  case 118:
#line 473 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4670 "expression.ec" /* yacc.c:1663  */
    break;

  case 119:
#line 474 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4676 "expression.ec" /* yacc.c:1663  */
    break;

  case 120:
#line 475 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4682 "expression.ec" /* yacc.c:1663  */
    break;

  case 121:
#line 476 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4688 "expression.ec" /* yacc.c:1663  */
    break;

  case 122:
#line 477 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4694 "expression.ec" /* yacc.c:1663  */
    break;

  case 123:
#line 478 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4700 "expression.ec" /* yacc.c:1663  */
    break;

  case 124:
#line 479 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4706 "expression.ec" /* yacc.c:1663  */
    break;

  case 125:
#line 484 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4712 "expression.ec" /* yacc.c:1663  */
    break;

  case 126:
#line 485 "expression.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4718 "expression.ec" /* yacc.c:1663  */
    break;

  case 127:
#line 486 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4724 "expression.ec" /* yacc.c:1663  */
    break;

  case 128:
#line 487 "expression.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4730 "expression.ec" /* yacc.c:1663  */
    break;

  case 129:
#line 488 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4736 "expression.ec" /* yacc.c:1663  */
    break;

  case 130:
#line 489 "expression.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4742 "expression.ec" /* yacc.c:1663  */
    break;

  case 131:
#line 490 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4748 "expression.ec" /* yacc.c:1663  */
    break;

  case 132:
#line 491 "expression.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4754 "expression.ec" /* yacc.c:1663  */
    break;

  case 133:
#line 495 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4760 "expression.ec" /* yacc.c:1663  */
    break;

  case 134:
#line 496 "expression.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4766 "expression.ec" /* yacc.c:1663  */
    break;

  case 135:
#line 497 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4772 "expression.ec" /* yacc.c:1663  */
    break;

  case 136:
#line 498 "expression.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4778 "expression.ec" /* yacc.c:1663  */
    break;

  case 137:
#line 499 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4784 "expression.ec" /* yacc.c:1663  */
    break;

  case 138:
#line 500 "expression.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4790 "expression.ec" /* yacc.c:1663  */
    break;

  case 139:
#line 501 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4796 "expression.ec" /* yacc.c:1663  */
    break;

  case 140:
#line 502 "expression.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4802 "expression.ec" /* yacc.c:1663  */
    break;

  case 141:
#line 503 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 4808 "expression.ec" /* yacc.c:1663  */
    break;

  case 142:
#line 504 "expression.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-1].list), (yyvsp[0].specifier)); }
#line 4814 "expression.ec" /* yacc.c:1663  */
    break;

  case 143:
#line 508 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initDeclarator)); }
#line 4820 "expression.ec" /* yacc.c:1663  */
    break;

  case 144:
#line 509 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), (yyvsp[0].initDeclarator)); }
#line 4826 "expression.ec" /* yacc.c:1663  */
    break;

  case 145:
#line 513 "expression.y" /* yacc.c:1663  */
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[0].declarator), null); (yyval.initDeclarator).loc = (yyloc); }
#line 4832 "expression.ec" /* yacc.c:1663  */
    break;

  case 146:
#line 514 "expression.y" /* yacc.c:1663  */
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[-2].declarator), (yyvsp[0].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[-1]).end; }
#line 4838 "expression.ec" /* yacc.c:1663  */
    break;

  case 147:
#line 518 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(TYPEDEF); }
#line 4844 "expression.ec" /* yacc.c:1663  */
    break;

  case 148:
#line 519 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(EXTERN); }
#line 4850 "expression.ec" /* yacc.c:1663  */
    break;

  case 149:
#line 520 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(STATIC); }
#line 4856 "expression.ec" /* yacc.c:1663  */
    break;

  case 150:
#line 521 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(AUTO); }
#line 4862 "expression.ec" /* yacc.c:1663  */
    break;

  case 151:
#line 522 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(REGISTER); }
#line 4868 "expression.ec" /* yacc.c:1663  */
    break;

  case 152:
#line 523 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(THREAD); }
#line 4874 "expression.ec" /* yacc.c:1663  */
    break;

  case 153:
#line 527 "expression.y" /* yacc.c:1663  */
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); }
#line 4880 "expression.ec" /* yacc.c:1663  */
    break;

  case 154:
#line 528 "expression.y" /* yacc.c:1663  */
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[0].attrib)); }
#line 4886 "expression.ec" /* yacc.c:1663  */
    break;

  case 155:
#line 529 "expression.y" /* yacc.c:1663  */
    { (yyval.extDecl) = MkExtDeclMultiAttrib((yyvsp[0].list)); }
#line 4892 "expression.ec" /* yacc.c:1663  */
    break;

  case 156:
#line 533 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = ATTRIB; }
#line 4898 "expression.ec" /* yacc.c:1663  */
    break;

  case 157:
#line 534 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = ATTRIB_DEP; }
#line 4904 "expression.ec" /* yacc.c:1663  */
    break;

  case 158:
#line 535 "expression.y" /* yacc.c:1663  */
    { (yyval.i) = __ATTRIB; }
#line 4910 "expression.ec" /* yacc.c:1663  */
    break;

  case 159:
#line 540 "expression.y" /* yacc.c:1663  */
    { (yyval.string)  = CopyString(yytext); }
#line 4916 "expression.ec" /* yacc.c:1663  */
    break;

  case 160:
#line 541 "expression.y" /* yacc.c:1663  */
    { (yyval.string)  = CopyString(yytext); }
#line 4922 "expression.ec" /* yacc.c:1663  */
    break;

  case 161:
#line 542 "expression.y" /* yacc.c:1663  */
    { (yyval.string)  = CopyString(yytext); }
#line 4928 "expression.ec" /* yacc.c:1663  */
    break;

  case 162:
#line 543 "expression.y" /* yacc.c:1663  */
    { (yyval.string)  = CopyString(yytext); }
#line 4934 "expression.ec" /* yacc.c:1663  */
    break;

  case 163:
#line 544 "expression.y" /* yacc.c:1663  */
    { (yyval.string)  = CopyString(yytext); }
#line 4940 "expression.ec" /* yacc.c:1663  */
    break;

  case 164:
#line 548 "expression.y" /* yacc.c:1663  */
    { (yyval.attribute) = MkAttribute((yyvsp[0].string), null); (yyval.attribute).loc = (yyloc); }
#line 4946 "expression.ec" /* yacc.c:1663  */
    break;

  case 165:
#line 549 "expression.y" /* yacc.c:1663  */
    { (yyval.attribute) = MkAttribute((yyvsp[-3].string), MkExpBrackets((yyvsp[-1].list))); (yyval.attribute).loc = (yyloc); }
#line 4952 "expression.ec" /* yacc.c:1663  */
    break;

  case 166:
#line 553 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkListOne((yyvsp[0].attribute)); }
#line 4958 "expression.ec" /* yacc.c:1663  */
    break;

  case 167:
#line 554 "expression.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-1].list), (yyvsp[0].attribute)); (yyval.list) = (yyvsp[-1].list); }
#line 4964 "expression.ec" /* yacc.c:1663  */
    break;

  case 168:
#line 555 "expression.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-2].list), (yyvsp[0].attribute)); (yyval.list) = (yyvsp[-2].list); }
#line 4970 "expression.ec" /* yacc.c:1663  */
    break;

  case 169:
#line 559 "expression.y" /* yacc.c:1663  */
    { (yyval.attrib) = MkAttrib((yyvsp[-5].i), (yyvsp[-2].list)); (yyval.attrib).loc = (yyloc); }
#line 4976 "expression.ec" /* yacc.c:1663  */
    break;

  case 170:
#line 560 "expression.y" /* yacc.c:1663  */
    { (yyval.attrib) = MkAttrib((yyvsp[-4].i), null); (yyval.attrib).loc = (yyloc); }
#line 4982 "expression.ec" /* yacc.c:1663  */
    break;

  case 171:
#line 564 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkListOne((yyvsp[0].attrib)); }
#line 4988 "expression.ec" /* yacc.c:1663  */
    break;

  case 172:
#line 565 "expression.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-1].list), (yyvsp[0].attrib)); (yyval.list) = (yyvsp[-1].list); }
#line 4994 "expression.ec" /* yacc.c:1663  */
    break;

  case 173:
#line 568 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(CONST); }
#line 5000 "expression.ec" /* yacc.c:1663  */
    break;

  case 174:
#line 569 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(VOLATILE); }
#line 5006 "expression.ec" /* yacc.c:1663  */
    break;

  case 175:
#line 570 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifierExtended(MkExtDeclString(CopyString(yytext))); }
#line 5012 "expression.ec" /* yacc.c:1663  */
    break;

  case 176:
#line 574 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = (yyvsp[0].specifier); }
#line 5018 "expression.ec" /* yacc.c:1663  */
    break;

  case 177:
#line 599 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifierName(yytext); }
#line 5024 "expression.ec" /* yacc.c:1663  */
    break;

  case 178:
#line 603 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(VOID); }
#line 5030 "expression.ec" /* yacc.c:1663  */
    break;

  case 179:
#line 604 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(CHAR); }
#line 5036 "expression.ec" /* yacc.c:1663  */
    break;

  case 180:
#line 605 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(SHORT); }
#line 5042 "expression.ec" /* yacc.c:1663  */
    break;

  case 181:
#line 606 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(INT); }
#line 5048 "expression.ec" /* yacc.c:1663  */
    break;

  case 182:
#line 607 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(UINT); }
#line 5054 "expression.ec" /* yacc.c:1663  */
    break;

  case 183:
#line 608 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(INT64); }
#line 5060 "expression.ec" /* yacc.c:1663  */
    break;

  case 184:
#line 609 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(INT128); }
#line 5066 "expression.ec" /* yacc.c:1663  */
    break;

  case 185:
#line 610 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(FLOAT128); }
#line 5072 "expression.ec" /* yacc.c:1663  */
    break;

  case 186:
#line 611 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(VALIST); }
#line 5078 "expression.ec" /* yacc.c:1663  */
    break;

  case 187:
#line 612 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(LONG); }
#line 5084 "expression.ec" /* yacc.c:1663  */
    break;

  case 188:
#line 613 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(FLOAT); }
#line 5090 "expression.ec" /* yacc.c:1663  */
    break;

  case 189:
#line 614 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(DOUBLE); }
#line 5096 "expression.ec" /* yacc.c:1663  */
    break;

  case 190:
#line 615 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(SIGNED); }
#line 5102 "expression.ec" /* yacc.c:1663  */
    break;

  case 191:
#line 616 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(UNSIGNED); }
#line 5108 "expression.ec" /* yacc.c:1663  */
    break;

  case 192:
#line 617 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(EXTENSION); }
#line 5114 "expression.ec" /* yacc.c:1663  */
    break;

  case 193:
#line 618 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(_BOOL); }
#line 5120 "expression.ec" /* yacc.c:1663  */
    break;

  case 194:
#line 619 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(BOOL); }
#line 5126 "expression.ec" /* yacc.c:1663  */
    break;

  case 198:
#line 623 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); }
#line 5132 "expression.ec" /* yacc.c:1663  */
    break;

  case 199:
#line 624 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(THISCLASS); }
#line 5138 "expression.ec" /* yacc.c:1663  */
    break;

  case 200:
#line 628 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(VOID); }
#line 5144 "expression.ec" /* yacc.c:1663  */
    break;

  case 201:
#line 629 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(CHAR); }
#line 5150 "expression.ec" /* yacc.c:1663  */
    break;

  case 202:
#line 630 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(SHORT); }
#line 5156 "expression.ec" /* yacc.c:1663  */
    break;

  case 203:
#line 631 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(INT); }
#line 5162 "expression.ec" /* yacc.c:1663  */
    break;

  case 204:
#line 632 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(UINT); }
#line 5168 "expression.ec" /* yacc.c:1663  */
    break;

  case 205:
#line 633 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(INT64); }
#line 5174 "expression.ec" /* yacc.c:1663  */
    break;

  case 206:
#line 634 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(INT128); }
#line 5180 "expression.ec" /* yacc.c:1663  */
    break;

  case 207:
#line 635 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(FLOAT128); }
#line 5186 "expression.ec" /* yacc.c:1663  */
    break;

  case 208:
#line 636 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(VALIST); }
#line 5192 "expression.ec" /* yacc.c:1663  */
    break;

  case 209:
#line 637 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(LONG); }
#line 5198 "expression.ec" /* yacc.c:1663  */
    break;

  case 210:
#line 638 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(FLOAT); }
#line 5204 "expression.ec" /* yacc.c:1663  */
    break;

  case 211:
#line 639 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(DOUBLE); }
#line 5210 "expression.ec" /* yacc.c:1663  */
    break;

  case 212:
#line 640 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(SIGNED); }
#line 5216 "expression.ec" /* yacc.c:1663  */
    break;

  case 213:
#line 641 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(UNSIGNED); }
#line 5222 "expression.ec" /* yacc.c:1663  */
    break;

  case 214:
#line 642 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(_BOOL); }
#line 5228 "expression.ec" /* yacc.c:1663  */
    break;

  case 215:
#line 643 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(BOOL); }
#line 5234 "expression.ec" /* yacc.c:1663  */
    break;

  case 219:
#line 647 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[-1].specifier)); }
#line 5240 "expression.ec" /* yacc.c:1663  */
    break;

  case 220:
#line 648 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkSpecifier(THISCLASS); }
#line 5246 "expression.ec" /* yacc.c:1663  */
    break;

  case 221:
#line 653 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), (yyvsp[-3].id), (yyvsp[-1].list)); if(declMode) DeclClass((yyvsp[-3].id)._class, (yyvsp[-3].id).string); }
#line 5252 "expression.ec" /* yacc.c:1663  */
    break;

  case 222:
#line 654 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), null, (yyvsp[-1].list)); }
#line 5258 "expression.ec" /* yacc.c:1663  */
    break;

  case 223:
#line 655 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), (yyvsp[-2].id), null); if(declMode) DeclClass((yyvsp[-2].id)._class, (yyvsp[-2].id).string); }
#line 5264 "expression.ec" /* yacc.c:1663  */
    break;

  case 224:
#line 656 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), null, null); }
#line 5270 "expression.ec" /* yacc.c:1663  */
    break;

  case 225:
#line 658 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); if(declMode) DeclClass((yyvsp[-3].specifier).nsSpec, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); }
#line 5276 "expression.ec" /* yacc.c:1663  */
    break;

  case 226:
#line 660 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-5].specifierType), (yyvsp[-3].id), (yyvsp[-1].list)); (yyval.specifier).extDeclStruct = (yyvsp[-4].extDecl); if(declMode) DeclClass((yyvsp[-3].id)._class, (yyvsp[-3].id).string); }
#line 5282 "expression.ec" /* yacc.c:1663  */
    break;

  case 227:
#line 661 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), null, (yyvsp[-1].list)); (yyval.specifier).extDeclStruct = (yyvsp[-3].extDecl); }
#line 5288 "expression.ec" /* yacc.c:1663  */
    break;

  case 228:
#line 662 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-4].specifierType), (yyvsp[-2].id), null); (yyval.specifier).extDeclStruct = (yyvsp[-3].extDecl); if(declMode) DeclClass((yyvsp[-2].id)._class, (yyvsp[-2].id).string); }
#line 5294 "expression.ec" /* yacc.c:1663  */
    break;

  case 229:
#line 663 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-3].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[-2].extDecl); }
#line 5300 "expression.ec" /* yacc.c:1663  */
    break;

  case 230:
#line 665 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-5].specifierType), MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); (yyval.specifier).extDeclStruct = (yyvsp[-4].extDecl); if(declMode) DeclClass((yyvsp[-3].specifier).nsSpec, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); }
#line 5306 "expression.ec" /* yacc.c:1663  */
    break;

  case 231:
#line 669 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), (yyvsp[0].id), null); if(declMode) DeclClass((yyvsp[0].id)._class, (yyvsp[0].id).string); }
#line 5312 "expression.ec" /* yacc.c:1663  */
    break;

  case 232:
#line 671 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-1].specifierType), MkIdentifier((yyvsp[0].specifier).name), null); if(declMode) DeclClass((yyvsp[0].specifier).nsSpec, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); }
#line 5318 "expression.ec" /* yacc.c:1663  */
    break;

  case 233:
#line 674 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), (yyvsp[0].id), null); (yyval.specifier).extDeclStruct = (yyvsp[-1].extDecl);if(declMode) DeclClass((yyvsp[0].id)._class, (yyvsp[0].id).string); }
#line 5324 "expression.ec" /* yacc.c:1663  */
    break;

  case 234:
#line 676 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkStructOrUnion((yyvsp[-2].specifierType), MkIdentifier((yyvsp[0].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[-1].extDecl); if(declMode) DeclClass((yyvsp[0].specifier).nsSpec, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); }
#line 5330 "expression.ec" /* yacc.c:1663  */
    break;

  case 235:
#line 680 "expression.y" /* yacc.c:1663  */
    { (yyval.specifierType) = structSpecifier; }
#line 5336 "expression.ec" /* yacc.c:1663  */
    break;

  case 236:
#line 681 "expression.y" /* yacc.c:1663  */
    { (yyval.specifierType) = unionSpecifier; }
#line 5342 "expression.ec" /* yacc.c:1663  */
    break;

  case 237:
#line 685 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].classDef)); }
#line 5348 "expression.ec" /* yacc.c:1663  */
    break;

  case 238:
#line 686 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].classDef)); }
#line 5354 "expression.ec" /* yacc.c:1663  */
    break;

  case 239:
#line 690 "expression.y" /* yacc.c:1663  */
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end; }
#line 5360 "expression.ec" /* yacc.c:1663  */
    break;

  case 240:
#line 694 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); }
#line 5366 "expression.ec" /* yacc.c:1663  */
    break;

  case 241:
#line 695 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); }
#line 5372 "expression.ec" /* yacc.c:1663  */
    break;

  case 242:
#line 700 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-7].list), null, (yyvsp[-6].id), (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); }
#line 5378 "expression.ec" /* yacc.c:1663  */
    break;

  case 243:
#line 702 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-7].list), null, (yyvsp[-6].id), (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); }
#line 5384 "expression.ec" /* yacc.c:1663  */
    break;

  case 244:
#line 704 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-5].list), null, (yyvsp[-4].id), (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); }
#line 5390 "expression.ec" /* yacc.c:1663  */
    break;

  case 245:
#line 706 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-5].list), null, (yyvsp[-4].id), null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); }
#line 5396 "expression.ec" /* yacc.c:1663  */
    break;

  case 246:
#line 708 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-3].list), null, (yyvsp[-2].id), null, null); (yyval.prop).loc = (yyloc); }
#line 5402 "expression.ec" /* yacc.c:1663  */
    break;

  case 247:
#line 711 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-8].list), (yyvsp[-7].declarator), (yyvsp[-6].id), (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); }
#line 5408 "expression.ec" /* yacc.c:1663  */
    break;

  case 248:
#line 713 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-8].list), (yyvsp[-7].declarator), (yyvsp[-6].id), (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); }
#line 5414 "expression.ec" /* yacc.c:1663  */
    break;

  case 249:
#line 715 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-6].list), (yyvsp[-5].declarator), (yyvsp[-4].id), (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); }
#line 5420 "expression.ec" /* yacc.c:1663  */
    break;

  case 250:
#line 717 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-6].list), (yyvsp[-5].declarator), (yyvsp[-4].id), null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); }
#line 5426 "expression.ec" /* yacc.c:1663  */
    break;

  case 251:
#line 719 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-4].list), (yyvsp[-3].declarator), (yyvsp[-2].id), null, null); (yyval.prop).loc = (yyloc); }
#line 5432 "expression.ec" /* yacc.c:1663  */
    break;

  case 252:
#line 722 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-6].list), null, null, (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); }
#line 5438 "expression.ec" /* yacc.c:1663  */
    break;

  case 253:
#line 724 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-6].list), null, null, (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); }
#line 5444 "expression.ec" /* yacc.c:1663  */
    break;

  case 254:
#line 726 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-4].list), null, null, (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); }
#line 5450 "expression.ec" /* yacc.c:1663  */
    break;

  case 255:
#line 728 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-4].list), null, null, null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); }
#line 5456 "expression.ec" /* yacc.c:1663  */
    break;

  case 256:
#line 730 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-2].list), null, null, null, null); (yyval.prop).loc = (yyloc); }
#line 5462 "expression.ec" /* yacc.c:1663  */
    break;

  case 257:
#line 733 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-7].list), (yyvsp[-6].declarator), null, (yyvsp[-3].stmt), (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); }
#line 5468 "expression.ec" /* yacc.c:1663  */
    break;

  case 258:
#line 735 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-7].list), (yyvsp[-6].declarator), null, (yyvsp[-1].stmt), (yyvsp[-3].stmt)); (yyval.prop).loc = (yyloc); }
#line 5474 "expression.ec" /* yacc.c:1663  */
    break;

  case 259:
#line 737 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-5].list), (yyvsp[-4].declarator), null, (yyvsp[-1].stmt), null); (yyval.prop).loc = (yyloc); }
#line 5480 "expression.ec" /* yacc.c:1663  */
    break;

  case 260:
#line 739 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-5].list), (yyvsp[-4].declarator), null, null, (yyvsp[-1].stmt)); (yyval.prop).loc = (yyloc); }
#line 5486 "expression.ec" /* yacc.c:1663  */
    break;

  case 261:
#line 741 "expression.y" /* yacc.c:1663  */
    { (yyval.prop) = MkProperty((yyvsp[-3].list), (yyvsp[-2].declarator), null, null, null); (yyval.prop).loc = (yyloc); }
#line 5492 "expression.ec" /* yacc.c:1663  */
    break;

  case 262:
#line 745 "expression.y" /* yacc.c:1663  */
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-2].list), (yyvsp[-1].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); }
#line 5498 "expression.ec" /* yacc.c:1663  */
    break;

  case 263:
#line 746 "expression.y" /* yacc.c:1663  */
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[-1].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); }
#line 5504 "expression.ec" /* yacc.c:1663  */
    break;

  case 264:
#line 747 "expression.y" /* yacc.c:1663  */
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); }
#line 5510 "expression.ec" /* yacc.c:1663  */
    break;

  case 265:
#line 748 "expression.y" /* yacc.c:1663  */
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[-1].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); }
#line 5516 "expression.ec" /* yacc.c:1663  */
    break;

  case 266:
#line 749 "expression.y" /* yacc.c:1663  */
    { (yyval.classDef) = MkClassDefFunction((yyvsp[0].classFunction)); (yyval.classDef).loc = (yyloc); }
#line 5522 "expression.ec" /* yacc.c:1663  */
    break;

  case 267:
#line 750 "expression.y" /* yacc.c:1663  */
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[-1].list)); if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).start; (yyval.classDef).loc = (yyloc); }
#line 5528 "expression.ec" /* yacc.c:1663  */
    break;

  case 268:
#line 751 "expression.y" /* yacc.c:1663  */
    { (yyval.classDef) = MkClassDefProperty((yyvsp[0].prop)); (yyval.classDef).loc = (yyloc); }
#line 5534 "expression.ec" /* yacc.c:1663  */
    break;

  case 269:
#line 752 "expression.y" /* yacc.c:1663  */
    { (yyval.classDef) = null; }
#line 5540 "expression.ec" /* yacc.c:1663  */
    break;

  case 270:
#line 757 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declarator)); }
#line 5546 "expression.ec" /* yacc.c:1663  */
    break;

  case 271:
#line 759 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), (yyvsp[0].declarator)); }
#line 5552 "expression.ec" /* yacc.c:1663  */
    break;

  case 272:
#line 764 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkStructDeclarator((yyvsp[0].declarator), null); (yyval.declarator).loc = (yyloc); }
#line 5558 "expression.ec" /* yacc.c:1663  */
    break;

  case 273:
#line 766 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-1].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[0].attrib); (yyval.declarator).loc = (yyloc); }
#line 5564 "expression.ec" /* yacc.c:1663  */
    break;

  case 274:
#line 768 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); }
#line 5570 "expression.ec" /* yacc.c:1663  */
    break;

  case 275:
#line 770 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-2].declarator), (yyvsp[0].exp));  (yyval.declarator).loc = (yyloc); }
#line 5576 "expression.ec" /* yacc.c:1663  */
    break;

  case 276:
#line 772 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkStructDeclarator((yyvsp[-4].declarator), (yyvsp[-2].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[0].exp); (yyval.declarator).loc = (yyloc); }
#line 5582 "expression.ec" /* yacc.c:1663  */
    break;

  case 277:
#line 776 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkEnum((yyvsp[0].id), null); if(declMode) DeclClass((yyvsp[0].id)._class, (yyvsp[0].id).string); }
#line 5588 "expression.ec" /* yacc.c:1663  */
    break;

  case 278:
#line 777 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[0].specifier).name), null); if(declMode) DeclClass((yyvsp[0].specifier).nsSpec, (yyvsp[0].specifier).name); FreeSpecifier((yyvsp[0].specifier)); }
#line 5594 "expression.ec" /* yacc.c:1663  */
    break;

  case 279:
#line 782 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkEnum(null, (yyvsp[-1].list)); }
#line 5600 "expression.ec" /* yacc.c:1663  */
    break;

  case 280:
#line 783 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkEnum((yyvsp[-3].id), (yyvsp[-1].list)); if(declMode) DeclClass((yyvsp[-3].id)._class, (yyvsp[-3].id).string); }
#line 5606 "expression.ec" /* yacc.c:1663  */
    break;

  case 281:
#line 784 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkEnum((yyvsp[-5].id), (yyvsp[-3].list)); (yyval.specifier).definitions = (yyvsp[-1].list); if(declMode) DeclClass((yyvsp[-5].id)._class, (yyvsp[-5].id).string); }
#line 5612 "expression.ec" /* yacc.c:1663  */
    break;

  case 282:
#line 785 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-5].specifier).name), (yyvsp[-3].list)); (yyval.specifier).definitions = (yyvsp[-1].list); if(declMode) DeclClass((yyvsp[-5].specifier).nsSpec, (yyvsp[-5].specifier).name); FreeSpecifier((yyvsp[-5].specifier)); }
#line 5618 "expression.ec" /* yacc.c:1663  */
    break;

  case 283:
#line 786 "expression.y" /* yacc.c:1663  */
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[-3].specifier).name), (yyvsp[-1].list)); if(declMode) DeclClass((yyvsp[-3].specifier).nsSpec, (yyvsp[-3].specifier).name); FreeSpecifier((yyvsp[-3].specifier)); }
#line 5624 "expression.ec" /* yacc.c:1663  */
    break;

  case 284:
#line 791 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].enumerator)); }
#line 5630 "expression.ec" /* yacc.c:1663  */
    break;

  case 285:
#line 793 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), (yyvsp[0].enumerator)); }
#line 5636 "expression.ec" /* yacc.c:1663  */
    break;

  case 286:
#line 798 "expression.y" /* yacc.c:1663  */
    { (yyval.enumerator) = MkEnumerator((yyvsp[0].id), null, null); }
#line 5642 "expression.ec" /* yacc.c:1663  */
    break;

  case 287:
#line 800 "expression.y" /* yacc.c:1663  */
    { (yyval.enumerator) = MkEnumerator((yyvsp[-2].id), (yyvsp[0].exp), null); }
#line 5648 "expression.ec" /* yacc.c:1663  */
    break;

  case 288:
#line 801 "expression.y" /* yacc.c:1663  */
    { (yyval.enumerator) = MkEnumerator((yyvsp[-1].id), null, (yyvsp[0].list)); }
#line 5654 "expression.ec" /* yacc.c:1663  */
    break;

  case 289:
#line 802 "expression.y" /* yacc.c:1663  */
    { (yyval.enumerator) = MkEnumerator((yyvsp[-3].id), (yyvsp[0].exp), (yyvsp[-2].list)); }
#line 5660 "expression.ec" /* yacc.c:1663  */
    break;

  case 290:
#line 808 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); }
#line 5666 "expression.ec" /* yacc.c:1663  */
    break;

  case 291:
#line 810 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorArray(null, null); }
#line 5672 "expression.ec" /* yacc.c:1663  */
    break;

  case 292:
#line 812 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[-1].exp)); }
#line 5678 "expression.ec" /* yacc.c:1663  */
    break;

  case 293:
#line 814 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[-1].specifier)); }
#line 5684 "expression.ec" /* yacc.c:1663  */
    break;

  case 294:
#line 816 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); }
#line 5690 "expression.ec" /* yacc.c:1663  */
    break;

  case 295:
#line 818 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); }
#line 5696 "expression.ec" /* yacc.c:1663  */
    break;

  case 296:
#line 820 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); }
#line 5702 "expression.ec" /* yacc.c:1663  */
    break;

  case 297:
#line 822 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction(null, null); }
#line 5708 "expression.ec" /* yacc.c:1663  */
    break;

  case 298:
#line 824 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); }
#line 5714 "expression.ec" /* yacc.c:1663  */
    break;

  case 299:
#line 826 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); }
#line 5720 "expression.ec" /* yacc.c:1663  */
    break;

  case 300:
#line 828 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); }
#line 5726 "expression.ec" /* yacc.c:1663  */
    break;

  case 301:
#line 833 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); }
#line 5732 "expression.ec" /* yacc.c:1663  */
    break;

  case 302:
#line 835 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction(null, null); }
#line 5738 "expression.ec" /* yacc.c:1663  */
    break;

  case 303:
#line 837 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[-1].list)); }
#line 5744 "expression.ec" /* yacc.c:1663  */
    break;

  case 304:
#line 839 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), null); }
#line 5750 "expression.ec" /* yacc.c:1663  */
    break;

  case 305:
#line 841 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-3].declarator), (yyvsp[-1].list)); }
#line 5756 "expression.ec" /* yacc.c:1663  */
    break;

  case 306:
#line 845 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); }
#line 5762 "expression.ec" /* yacc.c:1663  */
    break;

  case 308:
#line 847 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); }
#line 5768 "expression.ec" /* yacc.c:1663  */
    break;

  case 309:
#line 848 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].extDecl), MkDeclaratorPointer((yyvsp[0].pointer), null)); }
#line 5774 "expression.ec" /* yacc.c:1663  */
    break;

  case 310:
#line 849 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].extDecl), (yyvsp[0].declarator)); }
#line 5780 "expression.ec" /* yacc.c:1663  */
    break;

  case 311:
#line 850 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].extDecl), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); }
#line 5786 "expression.ec" /* yacc.c:1663  */
    break;

  case 312:
#line 854 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[0].pointer), null); }
#line 5792 "expression.ec" /* yacc.c:1663  */
    break;

  case 314:
#line 856 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); }
#line 5798 "expression.ec" /* yacc.c:1663  */
    break;

  case 315:
#line 857 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].extDecl), MkDeclaratorPointer((yyvsp[0].pointer), null)); }
#line 5804 "expression.ec" /* yacc.c:1663  */
    break;

  case 316:
#line 858 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].extDecl), (yyvsp[0].declarator)); }
#line 5810 "expression.ec" /* yacc.c:1663  */
    break;

  case 317:
#line 859 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].extDecl), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); }
#line 5816 "expression.ec" /* yacc.c:1663  */
    break;

  case 319:
#line 907 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); }
#line 5822 "expression.ec" /* yacc.c:1663  */
    break;

  case 320:
#line 909 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].extDecl), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); }
#line 5828 "expression.ec" /* yacc.c:1663  */
    break;

  case 321:
#line 915 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[0].id)); }
#line 5834 "expression.ec" /* yacc.c:1663  */
    break;

  case 322:
#line 917 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[-1].declarator)); }
#line 5840 "expression.ec" /* yacc.c:1663  */
    break;

  case 323:
#line 919 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-3].declarator), (yyvsp[-1].exp)); }
#line 5846 "expression.ec" /* yacc.c:1663  */
    break;

  case 324:
#line 921 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[-2].declarator), null); }
#line 5852 "expression.ec" /* yacc.c:1663  */
    break;

  case 325:
#line 923 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[-3].declarator), (yyvsp[-1].specifier)); }
#line 5858 "expression.ec" /* yacc.c:1663  */
    break;

  case 327:
#line 929 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator)); }
#line 5864 "expression.ec" /* yacc.c:1663  */
    break;

  case 328:
#line 932 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].extDecl), (yyvsp[0].declarator)); }
#line 5870 "expression.ec" /* yacc.c:1663  */
    break;

  case 329:
#line 934 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-2].extDecl), MkDeclaratorPointer((yyvsp[-1].pointer), (yyvsp[0].declarator))); }
#line 5876 "expression.ec" /* yacc.c:1663  */
    break;

  case 330:
#line 936 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[-2].pointer), MkDeclaratorExtended((yyvsp[-1].extDecl), (yyvsp[0].declarator))); }
#line 5882 "expression.ec" /* yacc.c:1663  */
    break;

  case 333:
#line 944 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].extDecl), (yyvsp[0].declarator)); }
#line 5888 "expression.ec" /* yacc.c:1663  */
    break;

  case 334:
#line 946 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[-1].extDecl), (yyvsp[0].declarator)); }
#line 5894 "expression.ec" /* yacc.c:1663  */
    break;

  case 336:
#line 955 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); }
#line 5900 "expression.ec" /* yacc.c:1663  */
    break;

  case 337:
#line 957 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-2].declarator), (yyvsp[-1].list)); }
#line 5906 "expression.ec" /* yacc.c:1663  */
    break;

  case 338:
#line 959 "expression.y" /* yacc.c:1663  */
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[-1].declarator), null); }
#line 5912 "expression.ec" /* yacc.c:1663  */
    break;

  case 339:
#line 963 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].specifier)); }
#line 5918 "expression.ec" /* yacc.c:1663  */
    break;

  case 340:
#line 964 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].specifier));  }
#line 5924 "expression.ec" /* yacc.c:1663  */
    break;

  case 341:
#line 968 "expression.y" /* yacc.c:1663  */
    { (yyval.pointer) = MkPointer(null, null); }
#line 5930 "expression.ec" /* yacc.c:1663  */
    break;

  case 342:
#line 969 "expression.y" /* yacc.c:1663  */
    { (yyval.pointer) = MkPointer((yyvsp[0].list), null); }
#line 5936 "expression.ec" /* yacc.c:1663  */
    break;

  case 343:
#line 970 "expression.y" /* yacc.c:1663  */
    { (yyval.pointer) = MkPointer(null, (yyvsp[0].pointer)); }
#line 5942 "expression.ec" /* yacc.c:1663  */
    break;

  case 344:
#line 971 "expression.y" /* yacc.c:1663  */
    { (yyval.pointer) = MkPointer((yyvsp[-1].list), (yyvsp[0].pointer)); }
#line 5948 "expression.ec" /* yacc.c:1663  */
    break;

  case 346:
#line 976 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), MkTypeName(null, null)); }
#line 5954 "expression.ec" /* yacc.c:1663  */
    break;

  case 347:
#line 980 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].typeName)); }
#line 5960 "expression.ec" /* yacc.c:1663  */
    break;

  case 348:
#line 981 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), (yyvsp[0].typeName)); }
#line 5966 "expression.ec" /* yacc.c:1663  */
    break;

  case 349:
#line 985 "expression.y" /* yacc.c:1663  */
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); }
#line 5972 "expression.ec" /* yacc.c:1663  */
    break;

  case 350:
#line 986 "expression.y" /* yacc.c:1663  */
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); }
#line 5978 "expression.ec" /* yacc.c:1663  */
    break;

  case 351:
#line 987 "expression.y" /* yacc.c:1663  */
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); }
#line 5984 "expression.ec" /* yacc.c:1663  */
    break;

  case 352:
#line 991 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); }
#line 5990 "expression.ec" /* yacc.c:1663  */
    break;

  case 353:
#line 992 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[0].id)))); }
#line 5996 "expression.ec" /* yacc.c:1663  */
    break;

  case 354:
#line 996 "expression.y" /* yacc.c:1663  */
    { (yyval.typeName) = MkTypeName((yyvsp[0].list), null); }
#line 6002 "expression.ec" /* yacc.c:1663  */
    break;

  case 355:
#line 997 "expression.y" /* yacc.c:1663  */
    { (yyval.typeName) = MkTypeName((yyvsp[-1].list), (yyvsp[0].declarator)); }
#line 6008 "expression.ec" /* yacc.c:1663  */
    break;

  case 356:
#line 1007 "expression.y" /* yacc.c:1663  */
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); }
#line 6014 "expression.ec" /* yacc.c:1663  */
    break;

  case 357:
#line 1009 "expression.y" /* yacc.c:1663  */
    { (yyval.initializer) = MkInitializerList((yyvsp[-1].list)); (yyval.initializer).loc = (yyloc); }
#line 6020 "expression.ec" /* yacc.c:1663  */
    break;

  case 358:
#line 1011 "expression.y" /* yacc.c:1663  */
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
#line 6037 "expression.ec" /* yacc.c:1663  */
    break;

  case 359:
#line 1026 "expression.y" /* yacc.c:1663  */
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); }
#line 6043 "expression.ec" /* yacc.c:1663  */
    break;

  case 360:
#line 1028 "expression.y" /* yacc.c:1663  */
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[0].exp)); (yyval.initializer).loc = (yyloc); }
#line 6049 "expression.ec" /* yacc.c:1663  */
    break;

  case 361:
#line 1049 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].initializer)); }
#line 6055 "expression.ec" /* yacc.c:1663  */
    break;

  case 362:
#line 1051 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-2].list); ListAdd((yyvsp[-2].list), (yyvsp[0].initializer)); }
#line 6061 "expression.ec" /* yacc.c:1663  */
    break;

  case 369:
#line 1065 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkLabeledStmt((yyvsp[-2].id), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 6067 "expression.ec" /* yacc.c:1663  */
    break;

  case 370:
#line 1067 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkCaseStmt((yyvsp[-2].exp), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[-2].exp).loc.start = (yylsp[-3]).end; }
#line 6073 "expression.ec" /* yacc.c:1663  */
    break;

  case 371:
#line 1069 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 6079 "expression.ec" /* yacc.c:1663  */
    break;

  case 372:
#line 1073 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].declaration)); }
#line 6085 "expression.ec" /* yacc.c:1663  */
    break;

  case 373:
#line 1074 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].declaration)); }
#line 6091 "expression.ec" /* yacc.c:1663  */
    break;

  case 374:
#line 1078 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].stmt)); }
#line 6097 "expression.ec" /* yacc.c:1663  */
    break;

  case 375:
#line 1079 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = (yyvsp[-1].list); ListAdd((yyvsp[-1].list), (yyvsp[0].stmt)); }
#line 6103 "expression.ec" /* yacc.c:1663  */
    break;

  case 376:
#line 1082 "expression.y" /* yacc.c:1663  */
    { Statement stmt = MkBadDeclStmt((yyvsp[0].declaration)); stmt.loc = (yylsp[0]); /*yyerror(); */ ListAdd((yyvsp[-1].list), stmt); (yyval.list) = (yyvsp[-1].list); }
#line 6109 "expression.ec" /* yacc.c:1663  */
    break;

  case 377:
#line 1086 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[0].list)); }
#line 6115 "expression.ec" /* yacc.c:1663  */
    break;

  case 378:
#line 1087 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkCompoundStmt((yyvsp[0].list), null); }
#line 6121 "expression.ec" /* yacc.c:1663  */
    break;

  case 379:
#line 1088 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkCompoundStmt((yyvsp[-1].list), (yyvsp[0].list)); }
#line 6127 "expression.ec" /* yacc.c:1663  */
    break;

  case 380:
#line 1092 "expression.y" /* yacc.c:1663  */
    { (yyval.context) = PushContext(); }
#line 6133 "expression.ec" /* yacc.c:1663  */
    break;

  case 381:
#line 1097 "expression.y" /* yacc.c:1663  */
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   }
#line 6144 "expression.ec" /* yacc.c:1663  */
    break;

  case 382:
#line 1105 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = (yyvsp[-1].stmt); (yyval.stmt).compound.context = (yyvsp[-2].context); PopContext((yyvsp[-2].context)); (yyval.stmt).loc = (yyloc); }
#line 6150 "expression.ec" /* yacc.c:1663  */
    break;

  case 383:
#line 1109 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); }
#line 6156 "expression.ec" /* yacc.c:1663  */
    break;

  case 384:
#line 1110 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkExpressionStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); }
#line 6162 "expression.ec" /* yacc.c:1663  */
    break;

  case 385:
#line 1114 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkIfStmt((yyvsp[-2].list), (yyvsp[0].stmt), null); (yyval.stmt).loc = (yyloc); }
#line 6168 "expression.ec" /* yacc.c:1663  */
    break;

  case 386:
#line 1115 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkIfStmt((yyvsp[-4].list), (yyvsp[-2].stmt), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 6174 "expression.ec" /* yacc.c:1663  */
    break;

  case 387:
#line 1116 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkSwitchStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 6180 "expression.ec" /* yacc.c:1663  */
    break;

  case 388:
#line 1120 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkWhileStmt((yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 6186 "expression.ec" /* yacc.c:1663  */
    break;

  case 389:
#line 1121 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[-5].stmt), (yyvsp[-2].list)); (yyval.stmt).loc = (yyloc); }
#line 6192 "expression.ec" /* yacc.c:1663  */
    break;

  case 390:
#line 1122 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkForStmt((yyvsp[-3].stmt), (yyvsp[-2].stmt), null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 6198 "expression.ec" /* yacc.c:1663  */
    break;

  case 391:
#line 1123 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkForStmt((yyvsp[-4].stmt), (yyvsp[-3].stmt), (yyvsp[-2].list), (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 6204 "expression.ec" /* yacc.c:1663  */
    break;

  case 392:
#line 1125 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 6210 "expression.ec" /* yacc.c:1663  */
    break;

  case 393:
#line 1126 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkForStmt((yyvsp[-2].stmt), null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 6216 "expression.ec" /* yacc.c:1663  */
    break;

  case 394:
#line 1127 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[0].stmt)); (yyval.stmt).loc = (yyloc); }
#line 6222 "expression.ec" /* yacc.c:1663  */
    break;

  case 395:
#line 1131 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkGotoStmt((yyvsp[-1].id)); (yyval.stmt).loc = (yyloc); }
#line 6228 "expression.ec" /* yacc.c:1663  */
    break;

  case 396:
#line 1132 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); }
#line 6234 "expression.ec" /* yacc.c:1663  */
    break;

  case 397:
#line 1133 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); }
#line 6240 "expression.ec" /* yacc.c:1663  */
    break;

  case 398:
#line 1134 "expression.y" /* yacc.c:1663  */
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[0]); }
#line 6246 "expression.ec" /* yacc.c:1663  */
    break;

  case 399:
#line 1135 "expression.y" /* yacc.c:1663  */
    { (yyval.stmt) = MkReturnStmt((yyvsp[-1].list)); (yyval.stmt).loc = (yyloc); }
#line 6252 "expression.ec" /* yacc.c:1663  */
    break;

  case 400:
#line 1139 "expression.y" /* yacc.c:1663  */
    { (yyval.string) = CopyString(yytext); }
#line 6258 "expression.ec" /* yacc.c:1663  */
    break;

  case 401:
#line 1144 "expression.y" /* yacc.c:1663  */
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-4].list), MkExpIdentifier((yyvsp[-3].id)), (yyvsp[-1].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-3]); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;}
#line 6264 "expression.ec" /* yacc.c:1663  */
    break;

  case 402:
#line 1146 "expression.y" /* yacc.c:1663  */
    { (yyval.instance) = MkInstantiationNamed((yyvsp[-3].list), MkExpIdentifier((yyvsp[-2].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[-2]); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;}
#line 6270 "expression.ec" /* yacc.c:1663  */
    break;

  case 403:
#line 1151 "expression.y" /* yacc.c:1663  */
    { (yyval.instance) = MkInstantiation((yyvsp[-3].specifier), null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; }
#line 6276 "expression.ec" /* yacc.c:1663  */
    break;

  case 404:
#line 1153 "expression.y" /* yacc.c:1663  */
    { (yyval.instance) = MkInstantiation((yyvsp[-2].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;}
#line 6282 "expression.ec" /* yacc.c:1663  */
    break;

  case 405:
#line 1155 "expression.y" /* yacc.c:1663  */
    { Location tmpLoc = yylloc; yylloc = (yylsp[-3]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-3].id).string), null, (yyvsp[-1].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; FreeIdentifier((yyvsp[-3].id)); }
#line 6288 "expression.ec" /* yacc.c:1663  */
    break;

  case 406:
#line 1157 "expression.y" /* yacc.c:1663  */
    { Location tmpLoc = yylloc; yylloc = (yylsp[-2]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[-2].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; FreeIdentifier((yyvsp[-2].id)); }
#line 6294 "expression.ec" /* yacc.c:1663  */
    break;

  case 407:
#line 1162 "expression.y" /* yacc.c:1663  */
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[-1].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-2]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start; }
#line 6300 "expression.ec" /* yacc.c:1663  */
    break;

  case 408:
#line 1164 "expression.y" /* yacc.c:1663  */
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[-1]).end; (yyval.instance).insideLoc.end = (yylsp[0]).start;}
#line 6306 "expression.ec" /* yacc.c:1663  */
    break;

  case 409:
#line 1169 "expression.y" /* yacc.c:1663  */
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); }
#line 6312 "expression.ec" /* yacc.c:1663  */
    break;

  case 410:
#line 1171 "expression.y" /* yacc.c:1663  */
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); }
#line 6318 "expression.ec" /* yacc.c:1663  */
    break;

  case 411:
#line 1176 "expression.y" /* yacc.c:1663  */
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[-2].list), FreeSpecifier); }
#line 6324 "expression.ec" /* yacc.c:1663  */
    break;

  case 412:
#line 1181 "expression.y" /* yacc.c:1663  */
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); FreeList /*FreeSpecifier*/((yyvsp[-2].list), FreeSpecifier); }
#line 6330 "expression.ec" /* yacc.c:1663  */
    break;

  case 413:
#line 1186 "expression.y" /* yacc.c:1663  */
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); }
#line 6336 "expression.ec" /* yacc.c:1663  */
    break;

  case 414:
#line 1188 "expression.y" /* yacc.c:1663  */
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[0].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); }
#line 6342 "expression.ec" /* yacc.c:1663  */
    break;

  case 415:
#line 1193 "expression.y" /* yacc.c:1663  */
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); }
#line 6348 "expression.ec" /* yacc.c:1663  */
    break;

  case 416:
#line 1195 "expression.y" /* yacc.c:1663  */
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); }
#line 6354 "expression.ec" /* yacc.c:1663  */
    break;

  case 417:
#line 1197 "expression.y" /* yacc.c:1663  */
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), null); (yyval.classFunction).loc = (yyloc); }
#line 6360 "expression.ec" /* yacc.c:1663  */
    break;

  case 418:
#line 1199 "expression.y" /* yacc.c:1663  */
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); }
#line 6366 "expression.ec" /* yacc.c:1663  */
    break;

  case 419:
#line 1201 "expression.y" /* yacc.c:1663  */
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); }
#line 6372 "expression.ec" /* yacc.c:1663  */
    break;

  case 420:
#line 1207 "expression.y" /* yacc.c:1663  */
    { (yyval.classFunction) = MkClassFunction((yyvsp[-1].list), null, (yyvsp[0].declarator), null); (yyval.classFunction).loc = (yyloc); }
#line 6378 "expression.ec" /* yacc.c:1663  */
    break;

  case 421:
#line 1212 "expression.y" /* yacc.c:1663  */
    { ProcessClassFunctionBody((yyvsp[-1].classFunction), (yyvsp[0].stmt)); (yyval.classFunction).loc = (yyloc); }
#line 6384 "expression.ec" /* yacc.c:1663  */
    break;

  case 422:
#line 1216 "expression.y" /* yacc.c:1663  */
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[-2].exp), (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[-1]).end;}
#line 6390 "expression.ec" /* yacc.c:1663  */
    break;

  case 423:
#line 1217 "expression.y" /* yacc.c:1663  */
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[0].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);}
#line 6396 "expression.ec" /* yacc.c:1663  */
    break;

  case 424:
#line 1222 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[0].memberInit)); }
#line 6402 "expression.ec" /* yacc.c:1663  */
    break;

  case 425:
#line 1224 "expression.y" /* yacc.c:1663  */
    { ((MemberInit)(yyvsp[-2].list)->last).loc.end = (yylsp[0]).start; ListAdd((yyvsp[-2].list), (yyvsp[0].memberInit)); (yyval.list) = (yyvsp[-2].list); }
#line 6408 "expression.ec" /* yacc.c:1663  */
    break;

  case 426:
#line 1229 "expression.y" /* yacc.c:1663  */
    { if((yyvsp[-1].list)->last) ((MemberInit)(yyvsp[-1].list)->last).loc.end = (yylsp[0]).end; (yyval.list) = (yyvsp[-1].list); }
#line 6414 "expression.ec" /* yacc.c:1663  */
    break;

  case 427:
#line 1233 "expression.y" /* yacc.c:1663  */
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]); }
#line 6420 "expression.ec" /* yacc.c:1663  */
    break;

  case 428:
#line 1234 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); }
#line 6426 "expression.ec" /* yacc.c:1663  */
    break;

  case 429:
#line 1235 "expression.y" /* yacc.c:1663  */
    { MembersInit members = MkMembersInitList((yyvsp[0].list)); ListAdd((yyval.list), members); members.loc = (yylsp[0]); (yyval.list) = (yyvsp[-1].list); }
#line 6432 "expression.ec" /* yacc.c:1663  */
    break;

  case 430:
#line 1236 "expression.y" /* yacc.c:1663  */
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[0].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); (yyval.list) = (yyvsp[-1].list); }
#line 6438 "expression.ec" /* yacc.c:1663  */
    break;

  case 431:
#line 1237 "expression.y" /* yacc.c:1663  */
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[0]);  }
#line 6444 "expression.ec" /* yacc.c:1663  */
    break;

  case 432:
#line 1238 "expression.y" /* yacc.c:1663  */
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[0]); (yyval.list) = (yyvsp[-1].list); }
#line 6450 "expression.ec" /* yacc.c:1663  */
    break;

  case 434:
#line 1243 "expression.y" /* yacc.c:1663  */
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[0].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); }
#line 6456 "expression.ec" /* yacc.c:1663  */
    break;

  case 435:
#line 1244 "expression.y" /* yacc.c:1663  */
    { ListAdd((yyvsp[-1].list), MkMembersInitList((yyvsp[0].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[0]); }
#line 6462 "expression.ec" /* yacc.c:1663  */
    break;

  case 436:
#line 1248 "expression.y" /* yacc.c:1663  */
    { parsedExpression = (yyvsp[0].exp); }
#line 6468 "expression.ec" /* yacc.c:1663  */
    break;


#line 6472 "expression.ec" /* yacc.c:1663  */
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
#line 1250 "expression.y" /* yacc.c:1923  */

