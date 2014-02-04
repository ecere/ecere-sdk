/* A Bison parser, made by GNU Bison 2.4.2.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2006, 2009-2010 Free Software
   Foundation, Inc.
   
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
#define YYBISON_VERSION "2.4.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 1



/* Copy the first part of user declarations.  */

/* Line 189 of yacc.c  */
#line 1 "expression.y"


import "ecdefs"

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



/* Line 189 of yacc.c  */
#line 107 "expression.ec"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
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
     LONG = 294,
     SIGNED = 295,
     UNSIGNED = 296,
     FLOAT = 297,
     DOUBLE = 298,
     CONST = 299,
     VOLATILE = 300,
     VOID = 301,
     VALIST = 302,
     STRUCT = 303,
     UNION = 304,
     ENUM = 305,
     ELLIPSIS = 306,
     CASE = 307,
     DEFAULT = 308,
     IF = 309,
     SWITCH = 310,
     WHILE = 311,
     DO = 312,
     FOR = 313,
     GOTO = 314,
     CONTINUE = 315,
     BREAK = 316,
     RETURN = 317,
     IFX = 318,
     ELSE = 319,
     CLASS = 320,
     THISCLASS = 321,
     CLASS_NAME = 322,
     PROPERTY = 323,
     SETPROP = 324,
     GETPROP = 325,
     NEWOP = 326,
     RENEW = 327,
     DELETE = 328,
     EXT_DECL = 329,
     EXT_STORAGE = 330,
     IMPORT = 331,
     DEFINE = 332,
     VIRTUAL = 333,
     ATTRIB = 334,
     PUBLIC = 335,
     PRIVATE = 336,
     TYPED_OBJECT = 337,
     ANY_OBJECT = 338,
     _INCREF = 339,
     EXTENSION = 340,
     ASM = 341,
     TYPEOF = 342,
     WATCH = 343,
     STOPWATCHING = 344,
     FIREWATCHERS = 345,
     WATCHABLE = 346,
     CLASS_DESIGNER = 347,
     CLASS_NO_EXPANSION = 348,
     CLASS_FIXED = 349,
     ISPROPSET = 350,
     CLASS_DEFAULT_PROPERTY = 351,
     PROPERTY_CATEGORY = 352,
     CLASS_DATA = 353,
     CLASS_PROPERTY = 354,
     SUBCLASS = 355,
     NAMESPACE = 356,
     NEW0OP = 357,
     RENEW0 = 358,
     VAARG = 359,
     DBTABLE = 360,
     DBFIELD = 361,
     DBINDEX = 362,
     DATABASE_OPEN = 363,
     ALIGNOF = 364,
     ATTRIB_DEP = 365,
     __ATTRIB = 366,
     BOOL = 367,
     _BOOL = 368,
     _COMPLEX = 369,
     _IMAGINARY = 370,
     RESTRICT = 371
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 214 of yacc.c  */
#line 37 "expression.y"

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



/* Line 214 of yacc.c  */
#line 295 "expression.ec"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
} YYLTYPE;
# define yyltype YYLTYPE /* obsolescent; will be withdrawn */
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


/* Copy the second part of user declarations.  */


/* Line 264 of yacc.c  */
#line 320 "expression.ec"

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
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
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
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
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
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
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
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
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
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
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

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  152
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   7584

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  142
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  109
/* YYNRULES -- Number of rules.  */
#define YYNRULES  434
/* YYNRULES -- Number of states.  */
#define YYNSTATES  762

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   371

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   129,     2,     2,   119,   131,   124,     2,
     117,   118,   125,   126,   123,   127,   120,   130,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   137,   139,
     132,   138,   133,   136,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   121,     2,   122,   134,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   140,   135,   141,   128,     2,     2,     2,
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
     115,   116
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     7,    11,    13,    15,    17,    19,
      22,    27,    30,    37,    43,    50,    56,    64,    71,    79,
      86,    88,    90,    92,    97,   101,   106,   110,   114,   117,
     120,   122,   127,   131,   136,   140,   144,   147,   150,   152,
     154,   158,   162,   165,   168,   171,   176,   179,   184,   189,
     192,   197,   199,   201,   203,   205,   207,   209,   211,   213,
     215,   217,   219,   221,   226,   228,   232,   236,   240,   242,
     246,   250,   252,   256,   260,   262,   266,   270,   274,   278,
     280,   284,   288,   290,   294,   296,   300,   302,   306,   308,
     312,   314,   318,   320,   326,   328,   332,   336,   338,   340,
     342,   344,   346,   348,   350,   352,   354,   356,   358,   360,
     364,   366,   369,   373,   376,   382,   384,   387,   389,   392,
     394,   397,   399,   402,   404,   407,   409,   412,   414,   417,
     419,   422,   424,   427,   429,   432,   434,   437,   439,   442,
     444,   447,   449,   452,   454,   457,   459,   462,   464,   467,
     469,   472,   474,   478,   480,   484,   486,   488,   490,   492,
     494,   496,   498,   500,   502,   504,   506,   508,   510,   512,
     514,   516,   521,   523,   526,   530,   537,   543,   545,   547,
     549,   551,   553,   555,   557,   559,   561,   563,   565,   567,
     569,   571,   573,   575,   577,   579,   581,   583,   585,   587,
     589,   594,   596,   598,   600,   602,   604,   606,   608,   610,
     612,   614,   616,   618,   620,   622,   624,   626,   628,   630,
     635,   637,   643,   648,   653,   657,   663,   670,   676,   682,
     687,   694,   697,   700,   704,   708,   710,   712,   714,   717,
     721,   723,   727,   737,   747,   755,   763,   769,   780,   791,
     800,   809,   816,   825,   834,   841,   848,   853,   863,   873,
     881,   889,   895,   899,   902,   905,   908,   910,   913,   915,
     917,   919,   923,   925,   928,   931,   935,   941,   944,   947,
     952,   958,   966,   974,   980,   982,   986,   988,   992,   996,
     999,  1003,  1007,  1011,  1016,  1021,  1024,  1028,  1032,  1037,
    1041,  1044,  1048,  1052,  1057,  1059,  1061,  1064,  1067,  1070,
    1074,  1076,  1078,  1081,  1084,  1087,  1091,  1093,  1096,  1100,
    1102,  1106,  1111,  1115,  1120,  1122,  1125,  1128,  1132,  1136,
    1138,  1140,  1143,  1146,  1149,  1153,  1157,  1160,  1162,  1165,
    1167,  1170,  1173,  1177,  1179,  1183,  1185,  1189,  1192,  1195,
    1197,  1199,  1203,  1205,  1208,  1210,  1214,  1219,  1221,  1223,
    1225,  1229,  1231,  1233,  1235,  1237,  1239,  1241,  1245,  1250,
    1254,  1256,  1259,  1261,  1264,  1267,  1269,  1271,  1274,  1276,
    1279,  1283,  1285,  1288,  1294,  1302,  1308,  1314,  1322,  1329,
    1337,  1342,  1348,  1353,  1357,  1360,  1363,  1366,  1370,  1372,
    1378,  1383,  1388,  1392,  1397,  1401,  1405,  1408,  1411,  1413,
    1417,  1422,  1426,  1429,  1432,  1435,  1438,  1441,  1444,  1447,
    1450,  1454,  1456,  1458,  1462,  1465,  1467,  1469,  1472,  1475,
    1477,  1480,  1482,  1484,  1487
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     250,     0,    -1,     3,    -1,   145,    -1,   117,   168,   118,
      -1,   143,    -1,   236,    -1,     4,    -1,   234,    -1,   119,
     234,    -1,   119,   234,   120,   234,    -1,   117,   118,    -1,
      71,   172,   206,   121,   169,   122,    -1,    71,   172,   121,
     169,   122,    -1,   102,   172,   206,   121,   169,   122,    -1,
     102,   172,   121,   169,   122,    -1,    72,   169,   174,   206,
     121,   169,   122,    -1,    72,   169,   174,   121,   169,   122,
      -1,   103,   169,   174,   206,   121,   169,   122,    -1,   103,
     169,   174,   121,   169,   122,    -1,     1,    -1,   237,    -1,
     144,    -1,   147,   121,   168,   122,    -1,   147,   117,   118,
      -1,   147,   117,   149,   118,    -1,   147,   120,   143,    -1,
     147,     7,   143,    -1,   147,     8,    -1,   147,     9,    -1,
     145,    -1,   148,   121,   168,   122,    -1,   148,   117,   118,
      -1,   148,   117,   149,   118,    -1,   148,   120,   143,    -1,
     148,     7,   143,    -1,   148,     8,    -1,   148,     9,    -1,
     166,    -1,   146,    -1,   149,   123,   166,    -1,   149,   123,
     146,    -1,     8,   151,    -1,     9,   151,    -1,   153,   154,
      -1,     6,   117,   151,   118,    -1,     6,   152,    -1,     6,
     117,   219,   118,    -1,   109,   117,   151,   118,    -1,   109,
     152,    -1,   109,   117,   219,   118,    -1,   150,    -1,   147,
      -1,   150,    -1,   148,    -1,   124,    -1,   125,    -1,   126,
      -1,   127,    -1,   128,    -1,   129,    -1,    73,    -1,   151,
      -1,   117,   219,   118,   154,    -1,   154,    -1,   155,   125,
     154,    -1,   155,   130,   154,    -1,   155,   131,   154,    -1,
     155,    -1,   156,   126,   155,    -1,   156,   127,   155,    -1,
     156,    -1,   157,    10,   156,    -1,   157,    11,   156,    -1,
     157,    -1,   158,   132,   157,    -1,   158,   133,   157,    -1,
     158,    12,   157,    -1,   158,    13,   157,    -1,   158,    -1,
     159,    14,   158,    -1,   159,    15,   158,    -1,   159,    -1,
     160,   124,   159,    -1,   160,    -1,   161,   134,   160,    -1,
     161,    -1,   162,   135,   161,    -1,   162,    -1,   163,    16,
     162,    -1,   163,    -1,   164,    17,   163,    -1,   164,    -1,
     164,   136,   168,   137,   165,    -1,   165,    -1,   151,   167,
     166,    -1,   151,   167,   146,    -1,   138,    -1,    18,    -1,
      19,    -1,    20,    -1,    21,    -1,    22,    -1,    23,    -1,
      24,    -1,    25,    -1,    26,    -1,    27,    -1,   166,    -1,
     168,   123,   166,    -1,   165,    -1,   172,   139,    -1,   172,
     175,   139,    -1,   235,   139,    -1,    77,   143,   138,   169,
     139,    -1,   184,    -1,   171,   184,    -1,   187,    -1,   171,
     187,    -1,   200,    -1,   171,   200,    -1,   189,    -1,   171,
     189,    -1,   177,    -1,   172,   177,    -1,   184,    -1,   172,
     184,    -1,   187,    -1,   172,   187,    -1,   200,    -1,   172,
     200,    -1,   189,    -1,   172,   189,    -1,   177,    -1,   173,
     177,    -1,   184,    -1,   173,   184,    -1,   187,    -1,   173,
     187,    -1,   185,    -1,   173,   185,    -1,   177,    -1,   174,
     177,    -1,   184,    -1,   174,   184,    -1,   188,    -1,   174,
     188,    -1,   189,    -1,   174,   189,    -1,   200,    -1,   174,
     200,    -1,   176,    -1,   175,   123,   176,    -1,   207,    -1,
     207,   138,   220,    -1,    29,    -1,    30,    -1,    31,    -1,
      32,    -1,    33,    -1,    74,    -1,   183,    -1,    79,    -1,
     110,    -1,   111,    -1,     3,    -1,    28,    -1,    75,    -1,
      74,    -1,    44,    -1,   180,    -1,   180,   117,   168,   118,
      -1,   181,    -1,   182,   181,    -1,   182,   123,   181,    -1,
     179,   117,   117,   182,   118,   118,    -1,   179,   117,   117,
     118,   118,    -1,    44,    -1,    45,    -1,    75,    -1,   186,
      -1,    28,    -1,    46,    -1,    34,    -1,    35,    -1,    36,
      -1,    37,    -1,    38,    -1,    47,    -1,    39,    -1,    42,
      -1,    43,    -1,    40,    -1,    41,    -1,    85,    -1,   113,
      -1,   112,    -1,   190,    -1,   199,    -1,   185,    -1,   100,
     117,   185,   118,    -1,    66,    -1,    46,    -1,    34,    -1,
      35,    -1,    36,    -1,    37,    -1,    38,    -1,    47,    -1,
      39,    -1,    42,    -1,    43,    -1,    40,    -1,    41,    -1,
     113,    -1,   112,    -1,   190,    -1,   199,    -1,   186,    -1,
     100,   117,   185,   118,    -1,    66,    -1,   191,   143,   140,
     192,   141,    -1,   191,   140,   192,   141,    -1,   191,   143,
     140,   141,    -1,   191,   140,   141,    -1,   191,   186,   140,
     192,   141,    -1,   191,   178,   143,   140,   192,   141,    -1,
     191,   178,   140,   192,   141,    -1,   191,   178,   143,   140,
     141,    -1,   191,   178,   140,   141,    -1,   191,   178,   186,
     140,   192,   141,    -1,   191,   143,    -1,   191,   186,    -1,
     191,   178,   143,    -1,   191,   178,   186,    -1,    48,    -1,
      49,    -1,   196,    -1,   192,   196,    -1,   147,   138,   221,
      -1,   193,    -1,   194,   123,   193,    -1,    68,   173,   143,
     140,    69,   229,    70,   229,   141,    -1,    68,   173,   143,
     140,    70,   229,    69,   229,   141,    -1,    68,   173,   143,
     140,    69,   229,   141,    -1,    68,   173,   143,   140,    70,
     229,   141,    -1,    68,   173,   143,   140,   141,    -1,    68,
     173,   205,   143,   140,    69,   229,    70,   229,   141,    -1,
      68,   173,   205,   143,   140,    70,   229,    69,   229,   141,
      -1,    68,   173,   205,   143,   140,    69,   229,   141,    -1,
      68,   173,   205,   143,   140,    70,   229,   141,    -1,    68,
     173,   205,   143,   140,   141,    -1,    68,   173,   140,    69,
     229,    70,   229,   141,    -1,    68,   173,   140,    70,   229,
      69,   229,   141,    -1,    68,   173,   140,    69,   229,   141,
      -1,    68,   173,   140,    70,   229,   141,    -1,    68,   173,
     140,   141,    -1,    68,   173,   205,   140,    69,   229,    70,
     229,   141,    -1,    68,   173,   205,   140,    70,   229,    69,
     229,   141,    -1,    68,   173,   205,   140,    69,   229,   141,
      -1,    68,   173,   205,   140,    70,   229,   141,    -1,    68,
     173,   205,   140,   141,    -1,   172,   197,   139,    -1,   172,
     139,    -1,   236,   139,    -1,   235,   139,    -1,   242,    -1,
     194,   139,    -1,   195,    -1,   139,    -1,   198,    -1,   197,
     123,   198,    -1,   207,    -1,   207,   183,    -1,   137,   169,
      -1,   207,   137,   169,    -1,   207,   137,   169,   137,   169,
      -1,    50,   143,    -1,    50,   186,    -1,    50,   140,   201,
     141,    -1,    50,   143,   140,   201,   141,    -1,    50,   143,
     140,   201,   139,   192,   141,    -1,    50,   186,   140,   201,
     139,   192,   141,    -1,    50,   186,   140,   201,   141,    -1,
     202,    -1,   201,   123,   202,    -1,   143,    -1,   143,   138,
     169,    -1,   117,   205,   118,    -1,   121,   122,    -1,   121,
     169,   122,    -1,   121,   185,   122,    -1,   203,   121,   122,
      -1,   203,   121,   169,   122,    -1,   203,   121,   185,   122,
      -1,   117,   118,    -1,   117,   215,   118,    -1,   203,   117,
     118,    -1,   203,   117,   215,   118,    -1,   117,   206,   118,
      -1,   117,   118,    -1,   117,   215,   118,    -1,   204,   117,
     118,    -1,   204,   117,   215,   118,    -1,   214,    -1,   203,
      -1,   214,   203,    -1,   178,   214,    -1,   178,   203,    -1,
     178,   214,   203,    -1,   214,    -1,   204,    -1,   214,   204,
      -1,   178,   214,    -1,   178,   204,    -1,   178,   214,   204,
      -1,   210,    -1,   214,   210,    -1,   178,   214,   210,    -1,
     143,    -1,   117,   207,   118,    -1,   208,   121,   169,   122,
      -1,   208,   121,   122,    -1,   208,   121,   185,   122,    -1,
     212,    -1,   214,   212,    -1,   178,   212,    -1,   178,   214,
     212,    -1,   214,   178,   212,    -1,   212,    -1,   208,    -1,
     178,   212,    -1,   178,   208,    -1,   208,   117,    -1,   211,
     215,   118,    -1,   211,   218,   118,    -1,   211,   118,    -1,
     184,    -1,   213,   184,    -1,   125,    -1,   125,   213,    -1,
     125,   214,    -1,   125,   213,   214,    -1,   216,    -1,   216,
     123,    51,    -1,   217,    -1,   216,   123,   217,    -1,   172,
     207,    -1,   172,   205,    -1,   172,    -1,   143,    -1,   218,
     123,   143,    -1,   171,    -1,   171,   205,    -1,   166,    -1,
     140,   222,   141,    -1,   140,   222,   123,   141,    -1,   165,
      -1,   146,    -1,   220,    -1,   222,   123,   220,    -1,   224,
      -1,   229,    -1,   230,    -1,   231,    -1,   232,    -1,   233,
      -1,   143,   137,   223,    -1,    52,   169,   137,   223,    -1,
      53,   137,   223,    -1,   170,    -1,   225,   170,    -1,   223,
      -1,   226,   223,    -1,   226,   170,    -1,   226,    -1,   225,
      -1,   225,   226,    -1,   140,    -1,   140,   141,    -1,   228,
     227,   141,    -1,   139,    -1,   168,   139,    -1,    54,   117,
     168,   118,   223,    -1,    54,   117,   168,   118,   223,    64,
     223,    -1,    55,   117,   168,   118,   223,    -1,    56,   117,
     168,   118,   223,    -1,    57,   223,    56,   117,   168,   118,
     139,    -1,    58,   117,   230,   230,   118,   223,    -1,    58,
     117,   230,   230,   168,   118,   223,    -1,    56,   117,   118,
     223,    -1,    58,   117,   230,   118,   223,    -1,    58,   117,
     118,   223,    -1,    59,   143,   139,    -1,    60,   139,    -1,
      61,   139,    -1,    62,   139,    -1,    62,   168,   139,    -1,
       5,    -1,   172,   143,   140,   249,   141,    -1,   172,   143,
     140,   141,    -1,   185,   140,   249,   141,    -1,   185,   140,
     141,    -1,   143,   140,   249,   141,    -1,   143,   140,   141,
      -1,   140,   249,   141,    -1,   140,   141,    -1,   172,   209,
      -1,   209,    -1,   172,   117,   118,    -1,   128,   172,   117,
     118,    -1,    78,   172,   209,    -1,    78,   209,    -1,   238,
     229,    -1,   241,   229,    -1,   241,   139,    -1,   239,   229,
      -1,   240,   229,    -1,   172,   209,    -1,   243,   229,    -1,
     147,   138,   221,    -1,   221,    -1,   245,    -1,   246,   123,
     245,    -1,   246,   139,    -1,   247,    -1,   244,    -1,   248,
     247,    -1,   248,   244,    -1,   139,    -1,   248,   139,    -1,
     248,    -1,   246,    -1,   248,   246,    -1,   166,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   211,   211,   216,   217,   222,   224,   226,   228,   230,
     231,   232,   235,   236,   237,   238,   239,   240,   241,   242,
     243,   247,   251,   252,   253,   254,   255,   256,   257,   258,
     263,   264,   265,   266,   267,   268,   269,   270,   274,   275,
     276,   277,   281,   282,   283,   284,   285,   286,   287,   288,
     289,   293,   294,   298,   299,   303,   304,   305,   306,   307,
     308,   309,   313,   314,   318,   319,   320,   321,   325,   326,
     327,   331,   332,   333,   337,   338,   339,   340,   341,   345,
     346,   347,   351,   352,   356,   357,   361,   362,   366,   367,
     371,   372,   376,   377,   381,   382,   384,   389,   390,   391,
     392,   393,   394,   395,   396,   397,   398,   399,   403,   404,
     408,   412,   413,   414,   415,   419,   420,   421,   422,   423,
     424,   425,   426,   430,   431,   432,   433,   434,   435,   436,
     437,   438,   439,   444,   445,   446,   447,   448,   449,   450,
     451,   455,   456,   457,   458,   459,   460,   461,   462,   463,
     464,   468,   469,   473,   474,   478,   479,   480,   481,   482,
     486,   487,   491,   492,   493,   498,   499,   500,   501,   502,
     506,   507,   511,   512,   513,   517,   518,   522,   523,   524,
     528,   553,   557,   558,   559,   560,   561,   562,   563,   564,
     565,   566,   567,   568,   569,   570,   571,   572,   573,   574,
     575,   576,   580,   581,   582,   583,   584,   585,   586,   587,
     588,   589,   590,   591,   592,   593,   594,   595,   596,   597,
     598,   603,   604,   605,   606,   607,   610,   611,   612,   613,
     614,   619,   620,   623,   625,   630,   631,   635,   636,   640,
     644,   645,   649,   651,   653,   655,   657,   660,   662,   664,
     666,   668,   671,   673,   675,   677,   679,   682,   684,   686,
     688,   690,   695,   696,   697,   698,   699,   700,   701,   702,
     706,   708,   713,   715,   717,   719,   721,   726,   727,   731,
     733,   734,   735,   736,   740,   742,   747,   749,   755,   757,
     759,   761,   763,   765,   767,   769,   771,   773,   775,   780,
     782,   784,   786,   788,   793,   794,   795,   796,   797,   798,
     802,   803,   804,   805,   806,   807,   853,   854,   856,   862,
     864,   866,   868,   870,   875,   876,   879,   881,   883,   889,
     890,   891,   893,   898,   902,   904,   906,   911,   912,   916,
     917,   918,   919,   923,   924,   928,   929,   933,   934,   935,
     939,   940,   944,   945,   954,   956,   958,   974,   975,   996,
     998,  1003,  1004,  1005,  1006,  1007,  1008,  1012,  1014,  1016,
    1021,  1022,  1026,  1027,  1030,  1034,  1035,  1036,  1040,  1044,
    1052,  1057,  1058,  1062,  1063,  1064,  1068,  1069,  1070,  1071,
    1073,  1074,  1075,  1079,  1080,  1081,  1082,  1083,  1087,  1091,
    1093,  1098,  1100,  1102,  1104,  1109,  1111,  1116,  1118,  1123,
    1128,  1133,  1135,  1140,  1142,  1144,  1146,  1148,  1154,  1159,
    1164,  1165,  1169,  1171,  1176,  1181,  1182,  1183,  1184,  1185,
    1186,  1190,  1191,  1192,  1196
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
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
  "SHORT", "INT", "UINT", "INT64", "LONG", "SIGNED", "UNSIGNED", "FLOAT",
  "DOUBLE", "CONST", "VOLATILE", "VOID", "VALIST", "STRUCT", "UNION",
  "ENUM", "ELLIPSIS", "CASE", "DEFAULT", "IF", "SWITCH", "WHILE", "DO",
  "FOR", "GOTO", "CONTINUE", "BREAK", "RETURN", "IFX", "ELSE", "CLASS",
  "THISCLASS", "CLASS_NAME", "PROPERTY", "SETPROP", "GETPROP", "NEWOP",
  "RENEW", "DELETE", "EXT_DECL", "EXT_STORAGE", "IMPORT", "DEFINE",
  "VIRTUAL", "ATTRIB", "PUBLIC", "PRIVATE", "TYPED_OBJECT", "ANY_OBJECT",
  "_INCREF", "EXTENSION", "ASM", "TYPEOF", "WATCH", "STOPWATCHING",
  "FIREWATCHERS", "WATCHABLE", "CLASS_DESIGNER", "CLASS_NO_EXPANSION",
  "CLASS_FIXED", "ISPROPSET", "CLASS_DEFAULT_PROPERTY",
  "PROPERTY_CATEGORY", "CLASS_DATA", "CLASS_PROPERTY", "SUBCLASS",
  "NAMESPACE", "NEW0OP", "RENEW0", "VAARG", "DBTABLE", "DBFIELD",
  "DBINDEX", "DATABASE_OPEN", "ALIGNOF", "ATTRIB_DEP", "__ATTRIB", "BOOL",
  "_BOOL", "_COMPLEX", "_IMAGINARY", "RESTRICT", "'('", "')'", "'$'",
  "'.'", "'['", "']'", "','", "'&'", "'*'", "'+'", "'-'", "'~'", "'!'",
  "'/'", "'%'", "'<'", "'>'", "'^'", "'|'", "'?'", "':'", "'='", "';'",
  "'{'", "'}'", "$accept", "identifier", "primary_expression",
  "simple_primary_expression", "anon_instantiation_expression",
  "postfix_expression", "simple_postfix_expression",
  "argument_expression_list", "common_unary_expression",
  "unary_expression", "simple_unary_expression", "unary_operator",
  "cast_expression", "multiplicative_expression", "additive_expression",
  "shift_expression", "relational_expression", "equality_expression",
  "and_expression", "exclusive_or_expression", "inclusive_or_expression",
  "logical_and_expression", "logical_or_expression",
  "conditional_expression", "assignment_expression", "assignment_operator",
  "expression", "constant_expression", "declaration",
  "specifier_qualifier_list", "declaration_specifiers",
  "property_specifiers", "renew_specifiers", "init_declarator_list",
  "init_declarator", "storage_class_specifier", "ext_decl", "_attrib",
  "attribute_word", "attribute", "attribs_list", "attrib",
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
  "expression_unit", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
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
     365,   366,   367,   368,   369,   370,   371,    40,    41,    36,
      46,    91,    93,    44,    38,    42,    43,    45,   126,    33,
      47,    37,    60,    62,    94,   124,    63,    58,    61,    59,
     123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   142,   143,   144,   144,   145,   145,   145,   145,   145,
     145,   145,   145,   145,   145,   145,   145,   145,   145,   145,
     145,   146,   147,   147,   147,   147,   147,   147,   147,   147,
     148,   148,   148,   148,   148,   148,   148,   148,   149,   149,
     149,   149,   150,   150,   150,   150,   150,   150,   150,   150,
     150,   151,   151,   152,   152,   153,   153,   153,   153,   153,
     153,   153,   154,   154,   155,   155,   155,   155,   156,   156,
     156,   157,   157,   157,   158,   158,   158,   158,   158,   159,
     159,   159,   160,   160,   161,   161,   162,   162,   163,   163,
     164,   164,   165,   165,   166,   166,   166,   167,   167,   167,
     167,   167,   167,   167,   167,   167,   167,   167,   168,   168,
     169,   170,   170,   170,   170,   171,   171,   171,   171,   171,
     171,   171,   171,   172,   172,   172,   172,   172,   172,   172,
     172,   172,   172,   173,   173,   173,   173,   173,   173,   173,
     173,   174,   174,   174,   174,   174,   174,   174,   174,   174,
     174,   175,   175,   176,   176,   177,   177,   177,   177,   177,
     178,   178,   179,   179,   179,   180,   180,   180,   180,   180,
     181,   181,   182,   182,   182,   183,   183,   184,   184,   184,
     185,   186,   187,   187,   187,   187,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   187,   187,   187,   187,   187,
     187,   187,   188,   188,   188,   188,   188,   188,   188,   188,
     188,   188,   188,   188,   188,   188,   188,   188,   188,   188,
     188,   189,   189,   189,   189,   189,   189,   189,   189,   189,
     189,   190,   190,   190,   190,   191,   191,   192,   192,   193,
     194,   194,   195,   195,   195,   195,   195,   195,   195,   195,
     195,   195,   195,   195,   195,   195,   195,   195,   195,   195,
     195,   195,   196,   196,   196,   196,   196,   196,   196,   196,
     197,   197,   198,   198,   198,   198,   198,   199,   199,   200,
     200,   200,   200,   200,   201,   201,   202,   202,   203,   203,
     203,   203,   203,   203,   203,   203,   203,   203,   203,   204,
     204,   204,   204,   204,   205,   205,   205,   205,   205,   205,
     206,   206,   206,   206,   206,   206,   207,   207,   207,   208,
     208,   208,   208,   208,   209,   209,   209,   209,   209,   210,
     210,   210,   210,   211,   212,   212,   212,   213,   213,   214,
     214,   214,   214,   215,   215,   216,   216,   217,   217,   217,
     218,   218,   219,   219,   220,   220,   220,   221,   221,   222,
     222,   223,   223,   223,   223,   223,   223,   224,   224,   224,
     225,   225,   226,   226,   226,   227,   227,   227,   228,   229,
     229,   230,   230,   231,   231,   231,   232,   232,   232,   232,
     232,   232,   232,   233,   233,   233,   233,   233,   234,   235,
     235,   236,   236,   236,   236,   237,   237,   238,   238,   239,
     240,   241,   241,   242,   242,   242,   242,   242,   243,   244,
     245,   245,   246,   246,   247,   248,   248,   248,   248,   248,
     248,   249,   249,   249,   250
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     3,     1,     1,     1,     1,     2,
       4,     2,     6,     5,     6,     5,     7,     6,     7,     6,
       1,     1,     1,     4,     3,     4,     3,     3,     2,     2,
       1,     4,     3,     4,     3,     3,     2,     2,     1,     1,
       3,     3,     2,     2,     2,     4,     2,     4,     4,     2,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     4,     1,     3,     3,     3,     1,     3,
       3,     1,     3,     3,     1,     3,     3,     3,     3,     1,
       3,     3,     1,     3,     1,     3,     1,     3,     1,     3,
       1,     3,     1,     5,     1,     3,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     3,
       1,     2,     3,     2,     5,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     2,     1,     2,     1,     2,     1,     2,     1,
       2,     1,     3,     1,     3,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     4,     1,     2,     3,     6,     5,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     4,
       1,     5,     4,     4,     3,     5,     6,     5,     5,     4,
       6,     2,     2,     3,     3,     1,     1,     1,     2,     3,
       1,     3,     9,     9,     7,     7,     5,    10,    10,     8,
       8,     6,     8,     8,     6,     6,     4,     9,     9,     7,
       7,     5,     3,     2,     2,     2,     1,     2,     1,     1,
       1,     3,     1,     2,     2,     3,     5,     2,     2,     4,
       5,     7,     7,     5,     1,     3,     1,     3,     3,     2,
       3,     3,     3,     4,     4,     2,     3,     3,     4,     3,
       2,     3,     3,     4,     1,     1,     2,     2,     2,     3,
       1,     1,     2,     2,     2,     3,     1,     2,     3,     1,
       3,     4,     3,     4,     1,     2,     2,     3,     3,     1,
       1,     2,     2,     2,     3,     3,     2,     1,     2,     1,
       2,     2,     3,     1,     3,     1,     3,     2,     2,     1,
       1,     3,     1,     2,     1,     3,     4,     1,     1,     1,
       3,     1,     1,     1,     1,     1,     1,     3,     4,     3,
       1,     2,     1,     2,     2,     1,     1,     2,     1,     2,
       3,     1,     2,     5,     7,     5,     5,     7,     6,     7,
       4,     5,     4,     3,     2,     2,     2,     3,     1,     5,
       4,     4,     3,     4,     3,     3,     2,     2,     1,     3,
       4,     3,     2,     2,     2,     2,     2,     2,     2,     2,
       3,     1,     1,     3,     2,     1,     1,     2,     2,     1,
       2,     1,     1,     2,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    20,     2,     7,   398,     0,     0,     0,   181,     0,
       0,    61,     0,     0,     0,     0,     0,    55,    56,    57,
      58,    59,    60,     5,    22,     3,    52,    51,    62,     0,
      64,    68,    71,    74,    79,    82,    84,    86,    88,    90,
      92,    94,   434,     0,   180,     8,     6,     0,     0,    30,
      54,    53,    46,     0,    42,    43,   155,   156,   157,   158,
     159,   183,   184,   185,   186,   187,   189,   192,   193,   190,
     191,   177,   178,   182,   188,   235,   236,     0,   201,   179,
     194,     0,   196,   195,     0,   123,   125,   199,   127,   131,
     197,     0,   198,   129,    62,   110,     0,     0,     0,     0,
      49,    11,   108,     0,   352,   115,   199,   117,   121,   119,
       0,     9,     0,     0,    28,    29,     0,     0,     0,    98,
      99,   100,   101,   102,   103,   104,   105,   106,   107,    97,
       0,    44,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     1,     0,     0,     0,    36,    37,     0,     0,
       0,     0,   277,   278,     0,   160,   162,   163,   164,     0,
       0,   339,   124,     0,     0,   161,   126,   128,   132,   130,
     311,     0,   310,     0,   231,     0,   232,   203,   204,   205,
     206,   207,   209,   212,   213,   210,   211,   202,   208,   220,
       0,   215,   214,     0,   141,   143,   218,   145,   147,   216,
     217,   149,     0,     0,     0,     0,     0,     4,     0,     0,
       0,     0,   116,   118,   122,   120,   305,   353,   304,     0,
       0,   429,     0,   404,   358,    52,   357,     0,   421,    21,
       0,   426,   422,   432,   425,     0,     0,    27,    24,    39,
       0,    38,    26,     0,    96,    95,    65,    66,    67,    69,
      70,    72,    73,    77,    78,    75,    76,    80,    81,    83,
      85,    87,    89,    91,     0,   402,     0,    45,    47,    35,
      32,     0,    34,     0,   286,     0,   284,     0,     0,     0,
     300,   349,     0,     0,   343,   345,     0,   337,   340,   341,
     314,   313,     0,     0,     0,   312,     0,     0,     0,     0,
     269,   224,     5,     0,     0,     0,     0,   240,     0,   268,
     237,     0,   408,     0,   324,     0,     0,     6,     0,     0,
       0,     0,   266,     0,     0,   233,   234,     0,     0,     0,
     142,   144,   146,   148,   150,     0,     0,     0,     0,     0,
      48,    50,   109,   295,     0,     0,   289,     0,     0,   308,
     307,     0,     0,   306,    63,    10,   406,     0,     0,     0,
     319,   418,   378,     0,   419,     0,   424,   430,   428,   433,
     427,   403,    25,     0,    23,     0,   401,    33,    31,     0,
       0,   279,     0,     0,   200,     0,     0,   348,   347,   330,
     316,   329,   304,   299,   301,     0,    13,   338,   342,   315,
       0,   302,     0,     0,     0,     0,   133,   135,   139,   137,
       0,     0,   412,     0,    56,     0,     0,     0,     0,     0,
       0,     0,   263,   319,     0,     0,   270,   272,   407,   329,
       0,   326,     0,   222,   238,     0,   267,   333,     0,   336,
     350,     0,     0,     0,   325,   265,   264,   413,   416,   417,
     415,   414,   223,     0,   229,     0,     0,     0,     0,     0,
       0,     0,    15,     0,     0,     0,   288,   296,   290,   291,
     309,   297,     0,   292,     0,     0,   405,   420,   379,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   381,     5,     0,   370,     0,   372,   361,     0,     0,
       0,   362,   363,   364,   365,   366,     0,   423,    41,    40,
      93,   287,   285,     0,   280,     0,   283,   332,   331,   307,
       0,   317,   344,   346,   165,   166,   169,   168,   167,     0,
     170,   172,     0,   303,    12,   277,   278,     0,     0,   134,
     136,   140,   138,     0,   231,     0,   232,   411,     0,   320,
       0,   239,   409,   274,     0,   331,     0,     0,   262,     0,
     273,     0,   329,   327,   241,   322,     0,     0,   334,   335,
       0,   328,   221,   227,   228,     0,     0,   225,   219,    17,
       0,    14,    19,     0,   298,   293,   294,     0,     0,     0,
       0,     0,     0,     0,     0,   394,   395,   396,     0,     0,
       0,   382,   111,     0,   151,   153,   371,     0,   374,   373,
     380,   113,     0,     0,   318,   176,     0,     0,     0,   173,
       0,     0,   256,     0,     0,     0,   233,   234,   410,   400,
       0,   329,   271,   275,   331,   321,   323,   351,   226,   230,
      16,    18,     0,   369,     0,     0,     0,     0,     0,     0,
       0,   393,   397,     0,   367,     0,   112,     0,   281,   282,
       0,   175,   174,     0,     0,     0,     0,   246,     0,     0,
     261,     0,   399,     0,   368,     0,     0,   390,     0,     0,
     392,     0,     0,     0,   152,     0,   354,   154,   171,     0,
     254,     0,   255,     0,     0,     0,     0,     0,     0,   251,
     276,   383,   385,   386,     0,   391,     0,     0,   114,   359,
       0,     0,     0,     0,   244,     0,   245,     0,   259,     0,
     260,     0,     0,     0,     0,   388,     0,     0,   355,   252,
     253,     0,     0,     0,     0,     0,   249,     0,   250,   384,
     387,   389,   356,   360,   242,   243,   257,   258,     0,     0,
     247,   248
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    23,    24,    25,   234,    26,    50,   250,    27,    94,
      52,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,   102,   130,   503,    96,   618,   104,
     314,   415,   203,   613,   614,    85,   315,   174,   540,   541,
     542,   175,    86,    43,    44,    88,   207,    89,    90,    91,
     316,   317,   318,   319,   320,   435,   436,    92,    93,   285,
     286,   226,   180,   354,   181,   426,   321,   322,   400,   323,
     324,   298,   325,   355,   294,   295,   452,   110,   697,   238,
     720,   506,   507,   508,   509,   510,   373,   511,   512,   513,
     514,   515,    45,   326,    46,   239,   328,   329,   330,   331,
     332,   240,   241,   242,   243,   244,   245,   246,    47
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -627
static const yytype_int16 yypact[] =
{
    5728,  -627,  -627,  -627,  -627,  5777,  5805,  5805,  -627,  7299,
    5728,  -627,  7299,  5728,  5818,  5167,    24,  -627,  -627,  -627,
    -627,  -627,  -627,   -72,  -627,  -627,   371,  -627,   682,  5728,
    -627,   289,   114,   337,    78,   445,   -43,   -59,    46,    80,
       2,  -627,  -627,    68,  -627,  -627,  -627,   238,  5296,  -627,
     430,  -627,  -627,  5383,  -627,  -627,  -627,  -627,  -627,  -627,
    -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,
    -627,  -627,  -627,  -627,  -627,  -627,  -627,    15,  -627,  -627,
    -627,   130,  -627,  -627,  6403,  -627,  -627,  -627,  -627,  -627,
    -627,    35,  -627,  -627,  -627,  -627,  7471,  6501,  7471,  5296,
    -627,  -627,  -627,    39,  6843,  -627,    68,  -627,  -627,  -627,
     193,   141,  1905,   262,  -627,  -627,  4169,   262,  5728,  -627,
    -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,
    4276,  -627,  5728,  5728,  5728,  5728,  5728,  5728,  5728,  5728,
    5728,  5728,  5728,  5728,  5728,  5728,  5728,  5728,  5728,  5728,
    5728,  2034,  -627,   205,   239,   262,  -627,  -627,  4203,   262,
    5728,   262,   164,   225,   349,  -627,  -627,  -627,  -627,  6599,
    5728,    10,  -627,   180,   288,  -627,  -627,  -627,  -627,  -627,
     295,   294,   325,  2538,   309,    38,   312,  -627,  -627,  -627,
    -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,
     360,  -627,  -627,  6697,  -627,  -627,  -627,  -627,  -627,  -627,
    -627,  -627,  5728,   345,  6795,   365,   398,  -627,  5728,  6305,
    5432,   270,  -627,  -627,  -627,  -627,   380,  -627,   383,  5728,
      24,  -627,  2163,  -627,  -627,   273,  -627,  6116,  -627,  -627,
     400,  -627,  -627,   134,  -627,  2292,   391,  -627,  -627,  -627,
     146,  -627,  -627,   388,  -627,  -627,  -627,  -627,  -627,   289,
     289,   114,   114,   337,   337,   337,   337,    78,    78,   445,
     -43,   -59,    46,    80,   -36,  -627,   397,  -627,  -627,  -627,
    -627,   212,  -627,   392,   414,   -49,  -627,   262,   262,   438,
    -627,  6018,   448,   456,   447,  -627,   458,  -627,    10,  -627,
     295,   325,   455,  6941,  5728,   295,  7385,  6116,  5355,  7299,
    -627,  -627,   -72,   330,  4811,    73,  2655,  -627,   139,  -627,
    -627,   385,  -627,  6214,  -627,   361,   437,   451,   400,   400,
     400,   396,  -627,  2772,  2889,   449,   453,  4427,   349,  5728,
    -627,  -627,  -627,  -627,  -627,   471,   474,  5728,  5728,   481,
    -627,  -627,  -627,  -627,   490,   491,  -627,   492,   -45,   380,
     383,  7032,  5512,   380,  -627,  -627,  -627,   475,  4276,   454,
    -627,  -627,   477,  4040,  -627,  4276,  -627,  -627,  -627,   134,
    -627,  -627,  -627,  4276,  -627,  5728,  -627,  -627,  -627,  5728,
     262,  -627,   144,   147,  -627,  5920,    62,  -627,  -627,   385,
    -627,  -627,   452,  -627,  -627,  7213,  -627,  -627,  -627,   295,
     326,  -627,   494,   493,    79,  4698,  -627,  -627,  -627,  -627,
     608,  6116,  -627,  5038,   711,    73,   502,   361,  7123,  4276,
     450,  5728,  -627,   482,    73,   186,  -627,   231,  -627,   485,
     361,  -627,    11,  -627,  -627,   643,  -627,  -627,  5571,  -627,
    -627,   509,   227,    11,  -627,  -627,  -627,  -627,  -627,  -627,
    -627,  -627,  -627,  3006,  -627,  3123,  3240,  4427,  3357,   511,
     510,  5728,  -627,   512,   515,  5728,  -627,  -627,  -627,  -627,
     380,  -627,   513,  -627,   516,    81,  -627,  -627,  -627,  5728,
     496,   522,   523,   524,  4130,   525,   262,   504,   514,  4586,
     262,  -627,   175,   194,  -627,  4923,  -627,  -627,  1518,  1647,
     508,  -627,  -627,  -627,  -627,  -627,   518,  -627,  -627,  -627,
    -627,  -627,  -627,  4427,  -627,  4427,  -627,   385,  -627,   452,
      11,  -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,   532,
     534,  -627,   228,  -627,  -627,  -627,  -627,   -39,   521,  -627,
    -627,  -627,  -627,    36,  -627,    79,  -627,  -627,   361,  -627,
     536,  -627,  -627,  -627,  2421,   529,   361,   189,  -627,  5728,
    -627,    11,   530,  -627,  -627,  -627,   533,   120,  -627,  -627,
     262,  -627,  -627,  -627,  -627,  3474,  3591,  -627,  -627,  -627,
     542,  -627,  -627,   543,  -627,  -627,  -627,   535,  4130,  5728,
    5728,  5599,   618,  4513,   539,  -627,  -627,  -627,   274,   537,
    4130,  -627,  -627,   331,  -627,   545,  -627,  1776,  -627,  -627,
    -627,  -627,  3708,  3825,  -627,  -627,  5728,   562,   389,  -627,
     400,   400,  -627,   136,   143,   541,  -627,  -627,  -627,  -627,
     549,   544,  -627,   556,   554,  -627,  -627,  -627,  -627,  -627,
    -627,  -627,  4130,  -627,   249,   323,  4130,   338,   581,  4130,
    4553,  -627,  -627,  5728,  -627,   454,  -627,  4310,  -627,  -627,
     356,  -627,  -627,   -33,   -22,   400,   400,  -627,   400,   400,
    -627,   166,  -627,  5728,  -627,  4130,  4130,  -627,  4130,  5728,
    -627,  4130,  5648,   571,  -627,  4310,  -627,  -627,  -627,   400,
    -627,   400,  -627,   -28,   -19,   153,   -17,   400,   400,  -627,
    -627,   647,  -627,  -627,   358,  -627,  4130,   375,  -627,  -627,
     -29,   572,   576,   400,  -627,   400,  -627,   400,  -627,   400,
    -627,   160,    -7,  4130,   582,  -627,  4130,  3911,  -627,  -627,
    -627,   579,   584,   585,   587,   400,  -627,   400,  -627,  -627,
    -627,  -627,  -627,  -627,  -627,  -627,  -627,  -627,   588,   593,
    -627,  -627
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -627,   436,  -627,   101,  -107,   -41,  -627,   583,   115,     0,
     725,  -627,    20,   407,   417,   465,   415,   595,   601,   602,
     600,   604,  -627,    14,     1,  -627,   -13,    59,  -337,  -627,
      13,  -627,   656,  -627,    92,   -40,   -71,  -627,  -627,  -525,
    -627,   321,   684,   859,   -18,    52,   -26,   118,    25,  -274,
    -273,   318,  -627,  -627,  -295,  -627,   197,   157,   421,   297,
     376,  -216,   -94,   -96,    30,  -280,   949,  -221,  -357,  -627,
     866,  -627,   916,  -134,  -627,   362,  -627,    -2,  -626,  -340,
    -627,   706,  -627,  -627,   257,  -627,  -627,   100,  -499,  -627,
    -627,  -627,    -6,  -369,   329,  -627,  -627,  -627,  -627,  -627,
    -627,  -627,   526,   399,   527,   546,  -627,  -148,  -627
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -432
static const yytype_int16 yytable[] =
{
      28,    42,   103,   276,   516,   359,    54,    55,   227,   249,
     111,   398,   363,   173,     2,    28,   371,   629,     2,   149,
     185,   444,    84,   254,    95,    97,   173,    95,   487,     4,
     630,   631,   420,   221,   437,   293,   504,   699,     2,     2,
     103,     2,   723,     8,   172,   531,   154,   701,   153,   131,
     725,   249,   729,    28,    71,    72,   204,   172,   204,   163,
     463,   465,   747,     8,   468,     2,     8,   107,   112,   719,
     531,   235,    98,   186,   390,   146,     2,   479,   206,   300,
     206,   145,     2,   531,   367,    79,   422,   218,   305,   561,
     139,   140,   391,   438,   737,   151,   148,   216,   173,   215,
     107,   385,   632,   672,   660,   253,    49,     8,   700,   165,
     235,   753,   738,   724,   166,    49,    28,   251,    28,   702,
      51,   209,   726,   209,   730,   237,   236,   213,   369,    51,
      28,   255,   173,   108,   748,   171,   177,   274,   150,   516,
     516,   420,   313,   173,   480,   167,   168,   283,   221,   177,
      28,   107,   256,   257,   258,   161,   223,   217,    28,   251,
      28,   692,   218,   340,   237,   236,   108,   336,   444,   412,
     444,   616,   624,   444,   340,   183,   634,   342,   334,   395,
     359,   147,   291,   220,    95,   206,   363,   171,   342,   451,
     369,   235,     2,   585,   586,   397,   206,   172,   171,   292,
     557,   624,   178,   596,   235,   675,   676,   409,   151,   624,
     141,   142,   678,   679,   208,   178,   208,   108,    28,   352,
     396,   151,   224,   727,   365,   615,    95,   482,   209,   296,
     745,   534,   291,   345,    95,   707,   708,   425,   152,   209,
     135,   136,   646,   434,   349,   237,   236,   164,   516,   364,
     622,   172,   623,   210,   453,   210,   535,   375,   237,   236,
     151,   230,   445,   165,   382,     2,   416,   390,   166,   383,
     390,   346,   536,   376,   172,   313,   518,   677,   446,   357,
     113,   114,   115,   523,   680,   524,   525,   437,   526,   177,
     444,   444,   313,   313,   728,   103,   313,   169,   425,   167,
     168,   746,   537,   538,   287,   171,   369,   709,    28,   567,
     166,   229,   610,   480,   171,   112,   291,   218,    95,   553,
     421,   343,   428,   277,   396,   568,   431,   444,   444,   534,
     387,   530,   343,   611,   235,   383,   291,   113,   114,   115,
     374,   167,   168,   177,   221,   579,   627,   137,   138,   555,
     580,   628,   425,    95,   535,   178,   530,   278,   419,   425,
     210,    95,    95,   413,     2,   288,   177,   685,   569,   571,
     536,   210,   218,    28,   291,   549,    95,     8,   113,   114,
     115,   172,   236,    28,   519,   615,   505,   219,   172,   236,
     116,   220,   534,   117,   118,   171,   546,   218,   470,   520,
     537,   538,   556,    95,   313,   302,   473,   474,   291,   178,
     103,   368,   303,   662,   132,   304,   640,   535,   291,   133,
     134,   484,   313,    28,   313,   313,   313,   313,   457,   458,
     459,   461,   178,   536,   425,   165,   109,   155,   156,   157,
     166,   686,   169,   236,   539,    95,   218,   116,   521,   333,
     117,   118,   337,     2,   665,     2,   688,     2,   530,   143,
     144,   218,    95,   537,   538,   172,   347,   552,   429,   109,
     666,   167,   168,   177,   698,   107,   734,   338,   369,   218,
     177,   218,   313,   350,   313,    95,   608,   530,   116,    95,
     563,   117,   118,   736,    28,   530,   425,   361,   218,    28,
     219,   362,   447,    95,   220,   179,   448,   576,    28,    28,
     384,   218,   327,   162,   388,   218,   351,   211,   179,   211,
     109,   505,   505,   235,   165,   225,   165,   184,   165,   166,
     590,   166,   381,   166,   593,   460,   372,   637,   386,   178,
     372,   108,   259,   260,   313,   313,   178,   158,   597,   247,
     159,   160,   389,   252,   261,   262,   394,   177,   267,   268,
     167,   168,   167,   168,   167,   168,   403,   369,   562,   395,
     405,   369,   410,   220,   404,   171,   455,   237,   236,   171,
     406,   313,   313,    95,   392,   393,   654,   655,   657,   466,
     456,   279,   471,   467,   425,   282,   472,   284,    28,    28,
      28,    28,   475,    28,   263,   264,   265,   266,   476,   477,
      28,     2,   543,   670,   478,   544,   486,    28,   488,   312,
     559,   335,   564,   178,   344,  -324,    28,   578,   643,   588,
     505,   594,   589,   598,   591,   344,     8,   592,   595,   599,
     600,   601,   603,   605,     1,   327,     2,     3,     4,   620,
     625,   626,    28,   606,   638,   645,    28,   621,   179,    28,
      28,   633,   327,   327,   650,   651,   327,    28,   696,  -326,
    -325,     8,   652,   370,   658,   663,   714,    95,   661,   717,
     671,   681,   165,   667,  -327,    28,    28,   166,    28,    28,
     682,    28,    28,   683,  -328,    28,   696,    95,   689,   105,
     119,   120,   121,   122,   123,   124,   125,   126,   127,   128,
     718,   733,   179,   739,     9,    10,    28,   740,   167,   168,
     754,   750,   693,   284,   284,   755,   756,   370,   757,   760,
     673,   674,   105,    28,   761,   179,    28,    28,   696,   100,
     269,   281,   710,   370,   312,    12,    13,   270,   272,   271,
     433,   370,   312,   273,   214,    71,    72,   694,   570,   450,
      53,   370,    16,   574,   642,   617,   522,   533,   176,   312,
     312,   378,   379,   312,   517,   703,   704,     0,   705,   706,
     205,   176,   205,   105,     0,  -339,    79,     0,   222,     0,
    -339,   380,   327,     0,   327,   327,   327,   327,     0,   721,
       0,   722,     0,     0,     0,   370,     0,   731,   732,   502,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     129,  -339,  -339,   741,     0,   742,   284,   743,     0,   744,
       0,   370,   370,     0,     0,     0,   171,     0,   370,     0,
       0,     0,   179,     0,   109,   758,     0,   759,     0,   179,
     545,   548,   327,     0,   327,   297,   554,   370,     0,   312,
       0,   370,     0,   370,     0,     0,   370,     0,    87,     0,
     370,    87,     0,     0,   106,     0,   370,     0,   370,     0,
       0,     0,     0,     0,     0,     0,     0,   341,     0,   370,
       0,     0,     0,     0,     0,     0,     0,     0,   341,   312,
       0,   312,   312,   312,   312,     0,     0,   106,     0,     0,
       0,     0,     0,     0,   327,   327,     0,     0,     0,     0,
       0,   176,     0,     0,     0,     0,   179,     0,     0,     0,
     502,     0,   604,     0,     0,     0,   609,     0,     0,     0,
       0,   433,     0,    87,   502,   502,     0,     0,     0,     0,
       0,   327,   327,     0,     0,     0,    87,     0,   106,   312,
       0,   312,     0,    87,     0,   370,   370,     0,     0,     0,
       0,   106,     0,     0,     0,   176,     0,     0,     0,     0,
       0,     0,   407,     0,     0,     0,     0,     0,     0,   635,
     417,   636,     0,     0,   370,     0,     0,     0,   176,     0,
     182,     0,   370,   370,     0,     0,     0,   370,     0,     0,
     106,     0,     0,   182,     0,     0,   647,     0,     0,     0,
     228,   312,   312,   289,     0,     0,     0,     0,    87,     0,
       0,     0,     0,     0,   502,     0,     0,     0,     0,     0,
       0,     0,   106,     0,     0,     0,   502,     0,     0,     0,
       0,     0,     0,   502,     0,     0,     0,     0,   312,   312,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    87,   358,
       0,     0,     0,     0,     0,   182,     0,   299,   502,   301,
       0,   106,   502,     0,     0,   502,    87,     0,     0,   550,
       0,   370,     0,     0,   106,   176,     0,   105,   297,     0,
       0,     0,   176,     0,     0,     0,     0,     0,     0,   182,
       0,   502,   502,     0,   502,     0,     0,   502,     0,     0,
     182,     0,     0,     0,     0,   228,     0,   360,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      87,     0,   502,     0,     0,     0,     0,   401,     0,     0,
       0,     0,    87,     0,     0,   418,    87,     0,    87,   502,
       0,     0,   502,    87,   401,   106,     0,     0,     0,     0,
     439,   441,    87,     0,     0,     0,     0,     0,     0,   176,
       0,   454,   106,   106,     0,     0,   106,   469,     0,     0,
     602,     0,     0,     0,     0,     0,     0,   402,     0,     0,
       0,     0,     0,     0,   408,   619,     0,     0,     0,     0,
      87,   485,     0,     0,   427,     0,     0,     0,     0,     0,
     440,   442,   106,     0,     0,   401,     0,     0,     0,     0,
     399,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    87,     0,     0,   399,     0,     0,
       0,   401,   528,   399,    87,     0,     0,     0,   401,     0,
       0,     0,     0,     0,   551,     0,     0,     0,     0,     0,
      87,     0,   106,     0,     0,   427,     0,    87,     0,   401,
       0,   528,     0,   401,     0,     0,   401,     0,     0,     0,
     565,     0,     0,     0,   653,     0,   572,   577,   573,     0,
       0,   402,   529,     0,     0,     0,   664,     0,   399,   581,
       0,     0,   106,   619,   106,   106,   106,   106,     0,     0,
       0,   228,     0,     0,     0,     0,     0,     0,     0,   427,
     299,   558,     0,     0,   399,   527,   427,     0,     0,     0,
     566,   399,     0,     0,     0,     0,     0,     0,   684,     0,
       0,     0,   687,     0,    87,   690,     0,   106,   106,     0,
       0,   401,   399,     0,   527,     0,   399,     0,     0,   399,
       0,     0,   106,   527,   106,     0,     0,     0,     0,   399,
       0,   711,   712,     0,   713,   401,   528,   715,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   427,   735,   106,   401,     0,     0,     0,     0,     0,
       0,     0,   641,   401,     0,     0,     0,   644,     0,   749,
       0,     0,   751,     0,   106,   106,     0,     0,     0,     0,
       0,     0,     0,     0,   399,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   106,     0,   399,   527,
       0,   106,   106,   427,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   399,     0,     0,
       0,     0,     0,     0,     0,   399,   399,     0,     0,     1,
     527,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,   401,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     8,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
     489,   490,   491,   492,   493,   494,   495,   496,   497,   498,
     499,   427,     0,     0,    78,     0,     0,     0,     0,     9,
      10,    11,     0,    79,     0,   500,     0,     0,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   399,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,    14,     0,     0,
      82,    83,     0,     0,     0,    15,     0,    16,     0,     0,
       0,     0,    17,    18,    19,    20,    21,    22,     1,     0,
       2,     3,     4,     5,     0,     6,     7,   501,   372,  -376,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,   489,
     490,   491,   492,   493,   494,   495,   496,   497,   498,   499,
       0,     0,     0,    78,     0,     0,     0,     0,     9,    10,
      11,     0,    79,     0,   500,     0,     0,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,    82,
      83,     0,     0,     0,    15,     0,    16,     0,     0,     0,
       0,    17,    18,    19,    20,    21,    22,     1,     0,     2,
       3,     4,     5,     0,     6,     7,   501,   372,  -375,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,   489,   490,
     491,   492,   493,   494,   495,   496,   497,   498,   499,     0,
       0,     0,    78,     0,     0,     0,     0,     9,    10,    11,
       0,    79,     0,   500,     0,     0,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,    82,    83,
       0,     0,     0,    15,     0,    16,     0,     0,     0,     0,
      17,    18,    19,    20,    21,    22,     1,     0,     2,     3,
       4,     5,     0,     6,     7,   501,   372,  -377,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     8,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     9,    10,    11,     0,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,    12,    13,     0,
       0,     0,     0,     0,    14,     0,     0,    82,    83,     0,
       0,     0,    15,     0,    16,     0,     0,     0,     0,    17,
      18,    19,    20,    21,    22,     1,     0,     2,     3,     4,
       5,     0,     6,     7,   231,   232,   233,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     8,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     9,    10,    11,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,    12,    13,     0,     0,
       0,     0,     0,    14,     0,     0,    82,    83,     0,     0,
       0,    15,     0,    16,     0,     0,     0,     0,    17,    18,
      19,    20,    21,    22,     1,     0,     2,     3,     4,     5,
       0,     6,     7,   231,   232,   275,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     9,    10,    11,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,    82,    83,     0,     0,     0,
      15,     0,    16,     0,     0,     0,     0,    17,    18,    19,
      20,    21,    22,     1,     0,     2,     3,     4,     5,     0,
       6,     7,   231,   232,   366,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     9,    10,    11,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     0,    82,    83,     0,     0,     0,    15,
       0,    16,     0,     0,     0,     0,    17,    18,    19,    20,
      21,    22,     1,     0,     2,     3,     4,     5,     0,     6,
       7,   377,   232,  -431,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     9,    10,    11,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,    82,    83,     0,     0,     0,    15,     1,
      16,     2,     3,     4,     0,    17,    18,    19,    20,    21,
      22,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     231,   232,   639,     0,     0,     0,     8,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,   306,     0,     0,     9,
      10,     0,   165,    79,     0,     0,   307,   166,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,     0,   167,   168,
      82,    83,     0,     0,     0,   308,     1,    16,     2,     3,
       4,     0,     0,   171,     0,     0,   309,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   310,     0,   311,
       0,     0,     0,     8,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,   306,     0,     0,     9,    10,     0,   165,
      79,     0,     0,   307,   166,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,    12,    13,     0,
       0,     0,     0,     0,     0,   167,   168,    82,    83,     0,
       0,     0,   308,     1,    16,     2,     3,     4,     0,     0,
     171,     0,     0,   309,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   310,     0,   443,     0,     0,     0,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
     306,     0,     0,     9,    10,     0,   165,    79,     0,     0,
     307,   166,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,    12,    13,     0,     0,     0,     0,
       0,     0,   167,   168,    82,    83,     0,     0,     0,   308,
       1,    16,     2,     3,     4,     0,     0,   171,     0,     0,
     309,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   310,     0,   462,     0,     0,     0,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,   306,     0,     0,
       9,    10,     0,   165,    79,     0,     0,   307,   166,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,    12,    13,     0,     0,     0,     0,     0,     0,   167,
     168,    82,    83,     0,     0,     0,   308,     1,    16,     2,
       3,     4,     0,     0,   171,     0,     0,   309,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   310,     0,
     464,     0,     0,     0,     8,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,   306,     0,     0,     9,    10,     0,
     165,    79,     0,     0,   307,   166,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     0,    12,    13,
       0,     0,     0,     0,     0,     0,   167,   168,    82,    83,
       0,     0,     0,   308,     1,    16,     2,     3,     4,     0,
       0,   171,     0,     0,   309,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   310,     0,   582,     0,     0,
       0,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,   306,     0,     0,     9,    10,     0,   165,    79,     0,
       0,   307,   166,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,    12,    13,     0,     0,     0,
       0,     0,     0,   167,   168,    82,    83,     0,     0,     0,
     308,     1,    16,     2,     3,     4,     0,     0,   171,     0,
       0,   309,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   310,     0,   583,     0,     0,     0,     8,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,   306,     0,
       0,     9,    10,     0,   165,    79,     0,     0,   307,   166,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     0,    12,    13,     0,     0,     0,     0,     0,     0,
     167,   168,    82,    83,     0,     0,     0,   308,     1,    16,
       2,     3,     4,     0,     0,   171,     0,     0,   309,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   310,
       0,   584,     0,     0,     0,     8,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,   306,     0,     0,     9,    10,
       0,   165,    79,     0,     0,   307,   166,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,     0,   167,   168,    82,
      83,     0,     0,     0,   308,     1,    16,     2,     3,     4,
       0,     0,   171,     0,     0,   309,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   310,     0,   587,     0,
       0,     0,     8,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,   306,     0,     0,     9,    10,     0,   165,    79,
       0,     0,   307,   166,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,    12,    13,     0,     0,
       0,     0,     0,     0,   167,   168,    82,    83,     0,     0,
       0,   308,     1,    16,     2,     3,     4,     0,     0,   171,
       0,     0,   309,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   310,     0,   648,     0,     0,     0,     8,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,   306,
       0,     0,     9,    10,     0,   165,    79,     0,     0,   307,
     166,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,    12,    13,     0,     0,     0,     0,     0,
       0,   167,   168,    82,    83,     0,     0,     0,   308,     1,
      16,     2,     3,     4,     0,     0,   171,     0,     0,   309,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     310,     0,   649,     0,     0,     0,     8,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,   306,     0,     0,     9,
      10,     0,   165,    79,     0,     0,   307,   166,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,     0,   167,   168,
      82,    83,     0,     0,     0,   308,     1,    16,     2,     3,
       4,     0,     0,   171,     0,     0,   309,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   310,     0,   668,
       0,     0,     0,     8,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,   306,     0,     0,     9,    10,     0,   165,
      79,     0,     0,   307,   166,     0,     0,     0,     0,     0,
      80,     0,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     0,     0,    81,     0,    12,    13,     0,
       0,     0,     0,     0,     0,   167,   168,    82,    83,     8,
       0,     0,   308,     0,    16,     0,     0,     0,     0,     0,
     171,     0,     0,   309,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   310,     0,   669,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     9,    10,    11,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    12,    13,     0,     0,     0,     0,     0,
      14,     0,     0,     0,     0,     0,     0,     0,    15,     0,
      16,     0,     0,     0,     0,    17,    18,    19,    20,    21,
      22,     1,     0,     2,     3,     4,     5,     0,     6,     7,
       0,   695,   752,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     8,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,   489,   490,   491,   492,   493,   494,   495,   496,
     497,   498,   499,     0,     0,     0,    78,     0,     0,     0,
       0,     9,    10,    11,     0,    79,     0,   500,     0,     0,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     1,     0,     2,     3,     4,     5,     0,     6,     7,
      81,     0,    12,    13,     0,     0,     0,     0,     0,    14,
       0,     0,    82,    83,     0,     0,     0,    15,     8,    16,
       0,     0,     0,     0,    17,    18,    19,    20,    21,    22,
       1,     0,     2,     3,     4,     5,     0,     6,     7,   501,
     372,     0,   489,   490,   491,   492,   493,   494,   495,   496,
     497,   498,   499,     0,     0,     0,     0,     8,     0,     0,
       0,     9,    10,    11,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,    12,    13,     0,     0,     0,     0,     0,    14,
       9,    10,    11,     0,     0,     0,     0,    15,     0,    16,
       0,     0,     0,     0,    17,    18,    19,    20,    21,    22,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   501,
     372,    12,    13,     0,     9,    10,    11,     1,    14,     2,
       3,     4,     5,     0,     6,     7,    15,   248,    16,     0,
       0,     0,     0,    17,    18,    19,    20,    21,    22,     0,
       0,     0,     0,     0,     8,    12,    13,     0,     0,   232,
       0,     1,    14,     2,     3,     4,     5,     0,     6,     7,
      15,   280,    16,     0,     0,     0,     0,    17,    18,    19,
      20,    21,    22,     0,     0,     0,     0,     0,     8,     0,
       0,     0,     0,   232,     0,     0,     0,     9,    10,    11,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    12,    13,
       0,     9,    10,    11,     0,    14,     0,     0,     0,     0,
       0,     0,     0,    15,     0,    16,     0,     0,     0,     0,
      17,    18,    19,    20,    21,    22,     0,     0,     0,     0,
       0,     0,    12,    13,     0,     0,   232,     0,     0,    14,
       0,     0,     0,     0,     0,     0,     0,    15,     1,    16,
       2,     3,     4,     0,    17,    18,    19,    20,    21,    22,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     695,     0,     0,     0,     0,     8,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,   306,     0,     0,     9,    10,
       0,   165,    79,     0,     0,   307,   166,     0,     0,     0,
       0,     0,    80,     0,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,     0,   167,   168,    82,
      83,     8,     0,     0,   308,     0,    16,     0,     0,     0,
       0,     0,   171,     0,     1,   309,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,   310,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     8,     0,     0,     9,    10,    11,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     9,    10,    11,     0,     0,     0,
      15,   659,    16,     0,     0,     0,     0,    17,    18,    19,
      20,    21,    22,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   501,     0,     0,    12,    13,     9,    10,    11,
       0,     0,    14,     0,     0,     0,     0,     0,     0,     0,
      15,   691,    16,     0,     0,     0,     0,    17,    18,    19,
      20,    21,    22,     0,     0,     0,     0,     0,    12,    13,
       0,     0,   501,     0,     0,    14,     0,     0,     0,     0,
       0,     2,     0,    15,     0,    16,     0,     0,     0,     0,
      17,    18,    19,    20,    21,    22,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   607,     8,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,   414,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,   165,    79,     0,     0,     0,   166,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   167,   168,
      82,    83,     0,     0,     2,   219,     0,     0,     0,   220,
       0,     0,     0,   171,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   547,     8,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,   165,    79,     0,     0,     0,
     166,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   167,   168,    82,    83,     0,     2,     0,   430,     0,
       0,     0,     0,     0,     0,     0,   171,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   431,     0,
     432,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,   165,    79,     0,
       0,     0,   166,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   167,   168,    82,    83,     0,     0,     1,
     369,     2,     3,     4,     5,     0,     6,     7,   171,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   612,     0,     0,     0,     8,     0,     0,     0,
       0,     0,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     9,
      10,    11,   165,    79,     0,     0,     0,   166,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     0,
      12,    13,     0,     0,     0,     0,     0,    14,   167,   168,
      82,    83,     0,     0,     0,   423,   101,    16,     0,     0,
       0,     0,    17,   424,    19,    20,    21,    22,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     8,     0,     0,     0,     0,
       0,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    78,     0,     0,     0,     0,     9,    10,
      11,     0,    79,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    80,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    81,     0,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,    82,
      83,     0,     0,     0,    15,   101,    16,     0,     0,     0,
       0,    17,    18,    19,    20,    21,    22,     1,     0,     2,
       3,     4,     5,     0,     6,     7,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     8,     0,     0,     0,     0,     0,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     1,     0,     2,     3,
       4,     5,    78,     6,     7,     0,     0,     9,    10,    11,
       0,    79,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    80,     0,     8,     1,     0,     2,     3,     4,     5,
       0,     6,     7,     0,     0,     0,    81,     0,    12,    13,
       0,     0,     0,     0,     0,    14,     0,     0,    82,    83,
       0,     8,     0,    53,   101,    16,     0,     0,     0,     0,
      17,    18,    19,    20,    21,    22,     9,    10,    11,   165,
       0,     0,     0,     1,   166,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     9,    10,    11,    12,    13,     0,
       8,     0,     0,     0,    14,   167,   168,     0,     0,     0,
       0,     0,   423,   101,    16,     0,     0,     0,     0,    17,
     424,    19,    20,    21,    22,    12,    13,     0,     0,     0,
       0,     0,    14,     0,     0,     0,     0,     0,     0,     0,
      15,   101,    16,     9,    10,    11,     0,    17,    18,    19,
      20,    21,    22,     1,     0,     2,     3,     4,     5,     0,
       6,     7,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    12,    13,     0,     0,     0,     0,
       8,    14,     0,     0,     0,     0,     0,     0,     0,    15,
       0,    16,     0,     0,   356,     0,    17,    18,    19,    20,
      21,    22,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     1,     0,     2,     3,     4,     5,     0,     6,
       7,     0,     0,     9,    10,    11,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     8,
       1,     0,     2,     3,     4,     5,     0,     6,     7,     0,
       0,     0,     0,     0,    12,    13,     0,     0,     0,     0,
       0,    14,     0,     0,     0,     0,     0,     8,     0,    15,
       0,    16,     0,     0,   483,     0,    17,    18,    19,    20,
      21,    22,     9,    10,    11,     0,     0,     0,     0,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       9,    10,    11,    12,    13,     0,     8,     0,     0,     0,
      14,     0,     0,     0,     0,     0,     0,     0,    15,     0,
      16,     0,     0,   575,     0,    17,    18,    19,    20,    21,
      22,    12,    13,     0,     0,     0,     0,     0,    14,     0,
       0,     0,     0,     0,     0,     0,    15,   656,    16,     9,
      10,    11,     0,    17,    18,    19,    20,    21,    22,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      12,    13,     0,     0,     0,     0,     8,    14,     0,     0,
       0,     0,     0,     0,     0,    15,   716,    16,     0,     0,
       0,     0,    17,    18,    19,    20,    21,    22,     1,     0,
       2,     3,     4,     5,     0,     6,     7,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     9,
      10,    11,     0,     0,     0,     8,     1,     0,     2,     3,
       4,     5,     0,     6,     7,     0,     0,     0,     0,     1,
       0,     2,     3,     4,     5,     0,     6,     7,     0,     0,
      12,    13,     0,     8,     0,     0,     0,    14,     0,     0,
       0,     0,     0,     0,     0,    15,     8,    16,     9,    10,
      11,     0,    17,    18,    19,    20,    21,    22,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     9,    10,    11,    12,
      13,     0,     0,     0,     0,     0,    14,     0,     0,     9,
      10,    11,     0,     0,    48,     0,    16,     0,     0,     0,
       0,    17,    18,    19,    20,    21,    22,    12,    13,     0,
       0,     0,     0,     0,    14,     0,     0,     0,     0,     0,
      12,    13,    53,     2,    16,     0,     0,    14,     0,    17,
      18,    19,    20,    21,    22,    99,     0,    16,     0,     0,
       0,     0,    17,    18,    19,    20,    21,    22,     8,    56,
      57,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    78,     0,     0,     0,
       0,     0,     0,     0,   165,    79,     0,     0,     0,   166,
       0,     0,     0,     0,     0,    80,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      81,     2,     0,     0,     0,     0,     0,     0,     0,     0,
     167,   168,    82,    83,     0,     0,     0,   395,   353,     0,
       0,   220,     0,     0,     0,   171,     8,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,   165,    79,     0,     0,     0,   166,     0,     0,
       0,     0,     0,    80,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    81,     2,
       0,     0,     0,     0,     0,     0,     0,     0,   167,   168,
      82,    83,     0,     0,     0,   395,     0,     0,     0,   220,
       0,     0,     0,   171,     8,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    78,     0,     0,     0,     0,     0,     0,     0,
     165,    79,     0,     0,     0,   166,     0,     0,     0,     0,
       0,    80,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    81,     2,     0,     0,
       0,     0,     0,     0,     0,     0,   167,   168,    82,    83,
       0,     0,     0,   369,     0,     0,     0,     0,     0,     0,
       0,   171,     8,    56,    57,    58,    59,    60,    61,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      78,     0,     0,     0,     0,     0,     0,     0,     0,    79,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    80,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    81,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    82,    83,     0,     0,
       0,     0,   449,     8,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,   165,
      79,     0,     0,     0,   166,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   167,   168,    82,    83,     0,
       0,     0,   219,   353,     0,     0,   220,     0,     0,     0,
     171,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,   165,    79,     0,
       0,     0,   166,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   167,   168,    82,    83,     0,     0,     0,
     169,     0,     0,     0,   170,     0,     0,     0,   171,     8,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,   165,    79,     0,     0,     0,
     166,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   167,   168,    82,    83,     0,     0,     0,   169,     0,
       0,     0,   212,     0,     0,     0,   171,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,   165,    79,     0,     0,     0,   166,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   167,
     168,    82,    83,     0,     0,     0,   169,   290,     0,     0,
       0,     0,     0,     0,   171,     8,    56,    57,    58,    59,
      60,   187,   188,   189,   190,   191,   192,   193,   194,   195,
     196,    71,    72,   197,   198,    75,    76,    77,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   199,     0,     0,     0,     0,     0,     0,
       0,   165,    79,     0,     0,     0,   166,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   200,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   167,   168,   201,
     202,     0,     0,     0,   169,     0,     0,     0,   339,     0,
       0,     0,   171,     8,    56,    57,    58,    59,    60,   187,
     188,   189,   190,   191,   192,   193,   194,   195,   196,    71,
      72,   197,   198,    75,    76,    77,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   199,     0,     0,     0,     0,     0,     0,     0,   165,
      79,     8,     0,     0,   166,     0,     0,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,   200,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   167,   168,   201,   202,    78,
       0,     0,   169,     0,     0,     0,   348,   165,    79,     0,
     171,     0,   166,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   167,   168,    82,    83,     0,     0,     0,
     219,     0,     0,     0,   220,     0,     0,     0,   171,     8,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    78,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    80,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    81,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    82,    83,     0,     0,     0,     0,   411,
       8,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,     0,     0,     0,     0,     0,    79,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    80,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    81,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    82,    83,     0,     0,     0,     0,
     481,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    82,    83,     0,     0,     0,
     560,     8,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    73,
      74,    75,    76,    77,   532,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    78,
       0,     0,     0,     0,     0,     0,     0,     0,    79,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    80,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    81,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    82,    83,     8,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    72,    73,    74,    75,    76,    77,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    78,     0,     0,     0,     0,
       0,     0,     0,     0,    79,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    80,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    81,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    82,    83,     8,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
      72,    73,    74,    75,    76,   414,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    78,     0,     0,     0,     0,     0,     0,     0,     0,
      79,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      80,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    81,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    82,    83,     8,
      56,    57,    58,    59,    60,   187,   188,   189,   190,   191,
     192,   193,   194,   195,   196,    71,    72,   197,   198,    75,
      76,    77,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   199,     0,     0,
       0,     0,     0,     0,     0,     0,    79,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   200,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   201,   202
};

static const yytype_int16 yycheck[] =
{
       0,     0,    15,   151,   373,   221,     6,     7,   104,   116,
      16,   291,   228,    84,     3,    15,   237,   542,     3,    17,
      91,   316,     9,   130,    10,    12,    97,    13,   368,     5,
      69,    70,   306,   104,   314,   169,   373,    70,     3,     3,
      53,     3,    70,    28,    84,   402,    48,    69,    48,    29,
      69,   158,    69,    53,    44,    45,    96,    97,    98,    77,
     333,   334,    69,    28,   337,     3,    28,    15,   140,   695,
     427,   112,    13,    91,   123,   134,     3,   122,    96,   173,
      98,   124,     3,   440,   232,    75,   307,   123,   182,   429,
      12,    13,   141,   314,   123,   140,    16,    99,   169,    99,
      48,   137,   141,   628,   603,   118,     5,    28,   141,    74,
     151,   737,   141,   141,    79,    14,   116,   116,   118,   141,
       5,    96,   141,    98,   141,   112,   112,    97,   117,    14,
     130,   130,   203,    15,   141,   125,    84,   150,   136,   508,
     509,   415,   183,   214,   360,   110,   111,   160,   219,    97,
     150,    99,   132,   133,   134,   140,   104,   118,   158,   158,
     160,   660,   123,   203,   151,   151,    48,   185,   463,   303,
     465,   508,   529,   468,   214,   140,   140,   203,   140,   117,
     396,   135,   169,   121,   170,   203,   402,   125,   214,   323,
     117,   232,     3,   466,   467,   291,   214,   237,   125,   169,
     421,   558,    84,   122,   245,    69,    70,   301,   140,   566,
     132,   133,    69,    70,    96,    97,    98,    99,   218,   218,
     291,   140,   104,    70,   230,   505,   212,   361,   203,   170,
      70,     3,   219,   203,   220,    69,    70,   308,     0,   214,
     126,   127,   122,   314,   214,   232,   232,   117,   617,   229,
     523,   291,   525,    96,   325,    98,    28,   123,   245,   245,
     140,   120,   123,    74,   118,     3,   306,   123,    79,   123,
     123,   212,    44,   139,   314,   316,   383,   141,   139,   220,
       7,     8,     9,   139,   141,   141,   139,   567,   141,   237,
     585,   586,   333,   334,   141,   308,   337,   117,   369,   110,
     111,   141,    74,    75,   140,   125,   117,   141,   308,   123,
      79,   118,   137,   529,   125,   140,   303,   123,   304,   415,
     307,   203,   309,   118,   395,   139,   137,   622,   623,     3,
     118,   402,   214,   139,   375,   123,   323,     7,     8,     9,
     240,   110,   111,   291,   415,   118,   118,    10,    11,   420,
     123,   123,   423,   339,    28,   237,   427,   118,   306,   430,
     203,   347,   348,   304,     3,   140,   314,   118,   137,   440,
      44,   214,   123,   373,   361,   415,   362,    28,     7,     8,
       9,   421,   368,   383,   383,   665,   373,   117,   428,   375,
     117,   121,     3,   120,   121,   125,   414,   123,   339,   385,
      74,    75,   420,   389,   445,   117,   347,   348,   395,   291,
     423,   138,   117,   139,   125,   121,   564,    28,   405,   130,
     131,   362,   463,   423,   465,   466,   467,   468,   328,   329,
     330,   331,   314,    44,   505,    74,    15,     7,     8,     9,
      79,   118,   117,   429,   118,   431,   123,   117,   389,   140,
     120,   121,   140,     3,   123,     3,   118,     3,   529,    14,
      15,   123,   448,    74,    75,   505,   121,   415,   138,    48,
     139,   110,   111,   421,   118,   423,   118,   117,   117,   123,
     428,   123,   523,   118,   525,   471,   499,   558,   117,   475,
     431,   120,   121,   118,   494,   566,   567,   117,   123,   499,
     117,   121,   117,   489,   121,    84,   121,   448,   508,   509,
     122,   123,   183,    77,   122,   123,   118,    96,    97,    98,
      99,   508,   509,   564,    74,   104,    74,    91,    74,    79,
     471,    79,   141,    79,   475,   139,   140,   555,   141,   421,
     140,   423,   135,   136,   585,   586,   428,   117,   489,   113,
     120,   121,   138,   117,   137,   138,   118,   505,   143,   144,
     110,   111,   110,   111,   110,   111,   118,   117,   118,   117,
     123,   117,   117,   121,   118,   125,   139,   564,   564,   125,
     122,   622,   623,   569,   287,   288,   599,   600,   601,   140,
     139,   155,   121,   140,   665,   159,   122,   161,   598,   599,
     600,   601,   121,   603,   139,   140,   141,   142,   118,   118,
     610,     3,   118,   626,   122,   122,   141,   617,   141,   183,
     118,   185,   140,   505,   203,   140,   626,   118,   569,   118,
     617,   118,   122,   137,   122,   214,    28,   122,   122,   117,
     117,   117,   117,   139,     1,   316,     3,     4,     5,   141,
     118,   117,   652,   139,   118,   122,   656,   139,   237,   659,
     660,   140,   333,   334,   122,   122,   337,   667,   667,   140,
     140,    28,   137,   237,    56,   138,   689,   663,   139,   692,
     118,   140,    74,   138,   140,   685,   686,    79,   688,   689,
     141,   691,   692,   137,   140,   695,   695,   683,   117,    15,
      18,    19,    20,    21,    22,    23,    24,    25,    26,    27,
     139,    64,   291,   141,    71,    72,   716,   141,   110,   111,
     141,   139,   663,   287,   288,   141,   141,   291,   141,   141,
     630,   631,    48,   733,   141,   314,   736,   737,   737,    14,
     145,   158,   683,   307,   308,   102,   103,   146,   148,   147,
     314,   315,   316,   149,    98,    44,    45,   665,   437,   323,
     117,   325,   119,   445,   567,   508,   390,   405,    84,   333,
     334,   245,   245,   337,   375,   675,   676,    -1,   678,   679,
      96,    97,    98,    99,    -1,    74,    75,    -1,   104,    -1,
      79,   245,   463,    -1,   465,   466,   467,   468,    -1,   699,
      -1,   701,    -1,    -1,    -1,   369,    -1,   707,   708,   373,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     138,   110,   111,   723,    -1,   725,   390,   727,    -1,   729,
      -1,   395,   396,    -1,    -1,    -1,   125,    -1,   402,    -1,
      -1,    -1,   421,    -1,   423,   745,    -1,   747,    -1,   428,
     414,   415,   523,    -1,   525,   171,   420,   421,    -1,   423,
      -1,   425,    -1,   427,    -1,    -1,   430,    -1,     9,    -1,
     434,    12,    -1,    -1,    15,    -1,   440,    -1,   442,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   203,    -1,   453,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   214,   463,
      -1,   465,   466,   467,   468,    -1,    -1,    48,    -1,    -1,
      -1,    -1,    -1,    -1,   585,   586,    -1,    -1,    -1,    -1,
      -1,   237,    -1,    -1,    -1,    -1,   505,    -1,    -1,    -1,
     494,    -1,   496,    -1,    -1,    -1,   500,    -1,    -1,    -1,
      -1,   505,    -1,    84,   508,   509,    -1,    -1,    -1,    -1,
      -1,   622,   623,    -1,    -1,    -1,    97,    -1,    99,   523,
      -1,   525,    -1,   104,    -1,   529,   530,    -1,    -1,    -1,
      -1,   112,    -1,    -1,    -1,   291,    -1,    -1,    -1,    -1,
      -1,    -1,   298,    -1,    -1,    -1,    -1,    -1,    -1,   553,
     306,   555,    -1,    -1,   558,    -1,    -1,    -1,   314,    -1,
      84,    -1,   566,   567,    -1,    -1,    -1,   571,    -1,    -1,
     151,    -1,    -1,    97,    -1,    -1,   580,    -1,    -1,    -1,
     104,   585,   586,   164,    -1,    -1,    -1,    -1,   169,    -1,
      -1,    -1,    -1,    -1,   598,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   183,    -1,    -1,    -1,   610,    -1,    -1,    -1,
      -1,    -1,    -1,   617,    -1,    -1,    -1,    -1,   622,   623,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   219,   220,
      -1,    -1,    -1,    -1,    -1,   169,    -1,   171,   652,   173,
      -1,   232,   656,    -1,    -1,   659,   237,    -1,    -1,   415,
      -1,   665,    -1,    -1,   245,   421,    -1,   423,   424,    -1,
      -1,    -1,   428,    -1,    -1,    -1,    -1,    -1,    -1,   203,
      -1,   685,   686,    -1,   688,    -1,    -1,   691,    -1,    -1,
     214,    -1,    -1,    -1,    -1,   219,    -1,   221,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     291,    -1,   716,    -1,    -1,    -1,    -1,   291,    -1,    -1,
      -1,    -1,   303,    -1,    -1,   306,   307,    -1,   309,   733,
      -1,    -1,   736,   314,   308,   316,    -1,    -1,    -1,    -1,
     314,   315,   323,    -1,    -1,    -1,    -1,    -1,    -1,   505,
      -1,   325,   333,   334,    -1,    -1,   337,   338,    -1,    -1,
     494,    -1,    -1,    -1,    -1,    -1,    -1,   291,    -1,    -1,
      -1,    -1,    -1,    -1,   298,   509,    -1,    -1,    -1,    -1,
     361,   362,    -1,    -1,   308,    -1,    -1,    -1,    -1,    -1,
     314,   315,   373,    -1,    -1,   369,    -1,    -1,    -1,    -1,
     291,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   395,    -1,    -1,   308,    -1,    -1,
      -1,   395,   396,   314,   405,    -1,    -1,    -1,   402,    -1,
      -1,    -1,    -1,    -1,   415,    -1,    -1,    -1,    -1,    -1,
     421,    -1,   423,    -1,    -1,   369,    -1,   428,    -1,   423,
      -1,   425,    -1,   427,    -1,    -1,   430,    -1,    -1,    -1,
     434,    -1,    -1,    -1,   598,    -1,   440,   448,   442,    -1,
      -1,   395,   396,    -1,    -1,    -1,   610,    -1,   369,   453,
      -1,    -1,   463,   617,   465,   466,   467,   468,    -1,    -1,
      -1,   415,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   423,
     424,   425,    -1,    -1,   395,   396,   430,    -1,    -1,    -1,
     434,   402,    -1,    -1,    -1,    -1,    -1,    -1,   652,    -1,
      -1,    -1,   656,    -1,   505,   659,    -1,   508,   509,    -1,
      -1,   505,   423,    -1,   425,    -1,   427,    -1,    -1,   430,
      -1,    -1,   523,   434,   525,    -1,    -1,    -1,    -1,   440,
      -1,   685,   686,    -1,   688,   529,   530,   691,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   505,   716,   564,   558,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   566,   567,    -1,    -1,    -1,   571,    -1,   733,
      -1,    -1,   736,    -1,   585,   586,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   505,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   617,    -1,   529,   530,
      -1,   622,   623,   567,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   558,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   566,   567,    -1,    -1,     1,
     571,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,   665,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,   665,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    75,    -1,    77,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   665,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,
     112,   113,    -1,    -1,    -1,   117,    -1,   119,    -1,    -1,
      -1,    -1,   124,   125,   126,   127,   128,   129,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,   139,   140,   141,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    75,    -1,    77,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
     113,    -1,    -1,    -1,   117,    -1,   119,    -1,    -1,    -1,
      -1,   124,   125,   126,   127,   128,   129,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,   139,   140,   141,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      -1,    75,    -1,    77,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,
      -1,    -1,    -1,   117,    -1,   119,    -1,    -1,    -1,    -1,
     124,   125,   126,   127,   128,   129,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,   139,   140,   141,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,
      75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,    -1,
      -1,    -1,   117,    -1,   119,    -1,    -1,    -1,    -1,   124,
     125,   126,   127,   128,   129,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,   139,   140,   141,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    -1,    75,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,    -1,    -1,   112,   113,    -1,    -1,
      -1,   117,    -1,   119,    -1,    -1,    -1,    -1,   124,   125,
     126,   127,   128,   129,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,   139,   140,   141,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    -1,    75,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,   112,   113,    -1,    -1,    -1,
     117,    -1,   119,    -1,    -1,    -1,    -1,   124,   125,   126,
     127,   128,   129,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,   139,   140,   141,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    -1,    75,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,   112,   113,    -1,    -1,    -1,   117,
      -1,   119,    -1,    -1,    -1,    -1,   124,   125,   126,   127,
     128,   129,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,   139,   140,   141,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    75,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,   112,   113,    -1,    -1,    -1,   117,     1,
     119,     3,     4,     5,    -1,   124,   125,   126,   127,   128,
     129,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     139,   140,   141,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,     1,   119,     3,     4,
       5,    -1,    -1,   125,    -1,    -1,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,   141,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,     1,   119,     3,     4,     5,    -1,    -1,
     125,    -1,    -1,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   139,    -1,   141,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
       1,   119,     3,     4,     5,    -1,    -1,   125,    -1,    -1,
     128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   139,    -1,   141,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,     1,   119,     3,
       4,     5,    -1,    -1,   125,    -1,    -1,   128,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,
     141,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,     1,   119,     3,     4,     5,    -1,
      -1,   125,    -1,    -1,   128,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   139,    -1,   141,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,     1,   119,     3,     4,     5,    -1,    -1,   125,    -1,
      -1,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   139,    -1,   141,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,     1,   119,
       3,     4,     5,    -1,    -1,   125,    -1,    -1,   128,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,
      -1,   141,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,     1,   119,     3,     4,     5,
      -1,    -1,   125,    -1,    -1,   128,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,   141,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,     1,   119,     3,     4,     5,    -1,    -1,   125,
      -1,    -1,   128,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   139,    -1,   141,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,     1,
     119,     3,     4,     5,    -1,    -1,   125,    -1,    -1,   128,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     139,    -1,   141,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,     1,   119,     3,     4,
       5,    -1,    -1,   125,    -1,    -1,   128,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,   141,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    28,
      -1,    -1,   117,    -1,   119,    -1,    -1,    -1,    -1,    -1,
     125,    -1,    -1,   128,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   139,    -1,   141,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
     109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,    -1,
     119,    -1,    -1,    -1,    -1,   124,   125,   126,   127,   128,
     129,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,   140,   141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    -1,    75,    -1,    77,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      -1,    -1,   112,   113,    -1,    -1,    -1,   117,    28,   119,
      -1,    -1,    -1,    -1,   124,   125,   126,   127,   128,   129,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   139,
     140,    -1,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    -1,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    71,    72,    73,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
      71,    72,    73,    -1,    -1,    -1,    -1,   117,    -1,   119,
      -1,    -1,    -1,    -1,   124,   125,   126,   127,   128,   129,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,
     140,   102,   103,    -1,    71,    72,    73,     1,   109,     3,
       4,     5,     6,    -1,     8,     9,   117,   118,   119,    -1,
      -1,    -1,    -1,   124,   125,   126,   127,   128,   129,    -1,
      -1,    -1,    -1,    -1,    28,   102,   103,    -1,    -1,   140,
      -1,     1,   109,     3,     4,     5,     6,    -1,     8,     9,
     117,   118,   119,    -1,    -1,    -1,    -1,   124,   125,   126,
     127,   128,   129,    -1,    -1,    -1,    -1,    -1,    28,    -1,
      -1,    -1,    -1,   140,    -1,    -1,    -1,    71,    72,    73,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,
      -1,    71,    72,    73,    -1,   109,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   117,    -1,   119,    -1,    -1,    -1,    -1,
     124,   125,   126,   127,   128,   129,    -1,    -1,    -1,    -1,
      -1,    -1,   102,   103,    -1,    -1,   140,    -1,    -1,   109,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,     1,   119,
       3,     4,     5,    -1,   124,   125,   126,   127,   128,   129,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     140,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    -1,
      -1,    -1,    85,    -1,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    28,    -1,    -1,   117,    -1,   119,    -1,    -1,    -1,
      -1,    -1,   125,    -1,     1,   128,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,   139,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    -1,    -1,    71,    72,    73,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    71,    72,    73,    -1,    -1,    -1,
     117,   118,   119,    -1,    -1,    -1,    -1,   124,   125,   126,
     127,   128,   129,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   139,    -1,    -1,   102,   103,    71,    72,    73,
      -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     117,   118,   119,    -1,    -1,    -1,    -1,   124,   125,   126,
     127,   128,   129,    -1,    -1,    -1,    -1,    -1,   102,   103,
      -1,    -1,   139,    -1,    -1,   109,    -1,    -1,    -1,    -1,
      -1,     3,    -1,   117,    -1,   119,    -1,    -1,    -1,    -1,
     124,   125,   126,   127,   128,   129,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   139,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,     3,   117,    -1,    -1,    -1,   121,
      -1,    -1,    -1,   125,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,     3,    -1,   117,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   125,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   137,    -1,
     139,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,     1,
     117,     3,     4,     5,     6,    -1,     8,     9,   125,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   139,    -1,    -1,    -1,    28,    -1,    -1,    -1,
      -1,    -1,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,
     112,   113,    -1,    -1,    -1,   117,   118,   119,    -1,    -1,
      -1,    -1,   124,   125,   126,   127,   128,   129,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,
      -1,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,
     113,    -1,    -1,    -1,   117,   118,   119,    -1,    -1,    -1,
      -1,   124,   125,   126,   127,   128,   129,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,     4,
       5,     6,    66,     8,     9,    -1,    -1,    71,    72,    73,
      -1,    75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    28,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,   112,   113,
      -1,    28,    -1,   117,   118,   119,    -1,    -1,    -1,    -1,
     124,   125,   126,   127,   128,   129,    71,    72,    73,    74,
      -1,    -1,    -1,     1,    79,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,   102,   103,    -1,
      28,    -1,    -1,    -1,   109,   110,   111,    -1,    -1,    -1,
      -1,    -1,   117,   118,   119,    -1,    -1,    -1,    -1,   124,
     125,   126,   127,   128,   129,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     117,   118,   119,    71,    72,    73,    -1,   124,   125,   126,
     127,   128,   129,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,
      28,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,
      -1,   119,    -1,    -1,   122,    -1,   124,   125,   126,   127,
     128,   129,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,    -1,    -1,    -1,    28,    -1,   117,
      -1,   119,    -1,    -1,   122,    -1,   124,   125,   126,   127,
     128,   129,    71,    72,    73,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      71,    72,    73,   102,   103,    -1,    28,    -1,    -1,    -1,
     109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,    -1,
     119,    -1,    -1,   122,    -1,   124,   125,   126,   127,   128,
     129,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   117,   118,   119,    71,
      72,    73,    -1,   124,   125,   126,   127,   128,   129,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     102,   103,    -1,    -1,    -1,    -1,    28,   109,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   117,   118,   119,    -1,    -1,
      -1,    -1,   124,   125,   126,   127,   128,   129,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,    -1,    -1,    -1,    28,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
     102,   103,    -1,    28,    -1,    -1,    -1,   109,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   117,    28,   119,    71,    72,
      73,    -1,   124,   125,   126,   127,   128,   129,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    71,    72,    73,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,    -1,    -1,    71,
      72,    73,    -1,    -1,   117,    -1,   119,    -1,    -1,    -1,
      -1,   124,   125,   126,   127,   128,   129,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,    -1,    -1,    -1,    -1,    -1,
     102,   103,   117,     3,   119,    -1,    -1,   109,    -1,   124,
     125,   126,   127,   128,   129,   117,    -1,   119,    -1,    -1,
      -1,    -1,   124,   125,   126,   127,   128,   129,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,
      -1,   121,    -1,    -1,    -1,   125,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,    -1,    -1,    -1,   121,
      -1,    -1,    -1,   125,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   125,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   112,   113,    -1,    -1,
      -1,    -1,   118,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,   118,    -1,    -1,   121,    -1,    -1,    -1,
     125,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,    -1,    -1,    -1,   121,    -1,    -1,    -1,   125,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
      -1,    -1,   121,    -1,    -1,    -1,   125,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,   118,    -1,    -1,
      -1,    -1,    -1,    -1,   125,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,    -1,    -1,    -1,   121,    -1,
      -1,    -1,   125,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    28,    -1,    -1,    79,    -1,    -1,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    66,
      -1,    -1,   117,    -1,    -1,    -1,   121,    74,    75,    -1,
     125,    -1,    79,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,    -1,    -1,    -1,   121,    -1,    -1,    -1,   125,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   112,   113,    -1,    -1,    -1,    -1,   118,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   112,   113,    -1,    -1,    -1,    -1,
     118,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,    -1,    -1,    -1,
     117,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    85,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   112,   113,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   112,   113,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      75,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      85,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   112,   113,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    75,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   112,   113
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     3,     4,     5,     6,     8,     9,    28,    71,
      72,    73,   102,   103,   109,   117,   119,   124,   125,   126,
     127,   128,   129,   143,   144,   145,   147,   150,   151,   153,
     154,   155,   156,   157,   158,   159,   160,   161,   162,   163,
     164,   165,   166,   185,   186,   234,   236,   250,   117,   145,
     148,   150,   152,   117,   151,   151,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    66,    75,
      85,   100,   112,   113,   172,   177,   184,   185,   187,   189,
     190,   191,   199,   200,   151,   165,   169,   172,   169,   117,
     152,   118,   166,   168,   171,   184,   185,   187,   189,   200,
     219,   234,   140,     7,     8,     9,   117,   120,   121,    18,
      19,    20,    21,    22,    23,    24,    25,    26,    27,   138,
     167,   154,   125,   130,   131,   126,   127,    10,    11,    12,
      13,   132,   133,    14,    15,   124,   134,   135,    16,    17,
     136,   140,     0,   151,   219,     7,     8,     9,   117,   120,
     121,   140,   143,   186,   117,    74,    79,   110,   111,   117,
     121,   125,   177,   178,   179,   183,   184,   187,   189,   200,
     204,   206,   214,   140,   143,   178,   186,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    46,    47,    66,
     100,   112,   113,   174,   177,   184,   186,   188,   189,   190,
     199,   200,   121,   206,   174,   151,   219,   118,   123,   117,
     121,   178,   184,   187,   189,   200,   203,   205,   214,   118,
     120,   139,   140,   141,   146,   147,   165,   172,   221,   237,
     243,   244,   245,   246,   247,   248,   249,   143,   118,   146,
     149,   166,   143,   168,   146,   166,   154,   154,   154,   155,
     155,   156,   156,   157,   157,   157,   157,   158,   158,   159,
     160,   161,   162,   163,   168,   141,   249,   118,   118,   143,
     118,   149,   143,   168,   143,   201,   202,   140,   140,   185,
     118,   172,   206,   215,   216,   217,   169,   184,   213,   214,
     204,   214,   117,   117,   121,   204,    68,    78,   117,   128,
     139,   141,   143,   147,   172,   178,   192,   193,   194,   195,
     196,   208,   209,   211,   212,   214,   235,   236,   238,   239,
     240,   241,   242,   140,   140,   143,   186,   140,   117,   121,
     177,   184,   188,   189,   200,   206,   169,   121,   121,   206,
     118,   118,   166,   118,   205,   215,   122,   169,   185,   203,
     214,   117,   121,   203,   154,   234,   141,   249,   138,   117,
     143,   209,   140,   228,   229,   123,   139,   139,   244,   246,
     247,   141,   118,   123,   122,   137,   141,   118,   122,   138,
     123,   141,   201,   201,   118,   117,   178,   205,   207,   208,
     210,   212,   214,   118,   118,   123,   122,   184,   214,   204,
     117,   118,   215,   169,    50,   173,   177,   184,   185,   187,
     191,   172,   209,   117,   125,   178,   207,   214,   172,   138,
     117,   137,   139,   143,   178,   197,   198,   207,   209,   212,
     214,   212,   214,   141,   196,   123,   139,   117,   121,   118,
     143,   215,   218,   178,   212,   139,   139,   229,   229,   229,
     139,   229,   141,   192,   141,   192,   140,   140,   192,   185,
     169,   121,   122,   169,   169,   121,   118,   118,   122,   122,
     203,   118,   215,   122,   169,   185,   141,   221,   141,    52,
      53,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      77,   139,   143,   168,   170,   172,   223,   224,   225,   226,
     227,   229,   230,   231,   232,   233,   235,   245,   146,   166,
     165,   169,   202,   139,   141,   139,   141,   208,   212,   214,
     178,   210,    51,   217,     3,    28,    44,    74,    75,   118,
     180,   181,   182,   118,   122,   143,   186,   140,   143,   177,
     184,   185,   187,   205,   143,   178,   186,   209,   214,   118,
     117,   221,   118,   169,   140,   212,   214,   123,   139,   137,
     183,   178,   212,   212,   193,   122,   169,   185,   118,   118,
     123,   212,   141,   141,   141,   192,   192,   141,   118,   122,
     169,   122,   122,   169,   118,   122,   122,   169,   137,   117,
     117,   117,   223,   117,   143,   139,   139,   139,   168,   143,
     137,   139,   139,   175,   176,   207,   170,   226,   170,   223,
     141,   139,   192,   192,   210,   118,   117,   118,   123,   181,
      69,    70,   141,   140,   140,   143,   143,   186,   118,   141,
     249,   212,   198,   169,   212,   122,   122,   143,   141,   141,
     122,   122,   137,   223,   168,   168,   118,   168,    56,   118,
     230,   139,   139,   138,   223,   123,   139,   138,   141,   141,
     168,   118,   181,   229,   229,    69,    70,   141,    69,    70,
     141,   140,   141,   137,   223,   118,   118,   223,   118,   117,
     223,   118,   230,   169,   176,   140,   166,   220,   118,    70,
     141,    69,   141,   229,   229,   229,   229,    69,    70,   141,
     169,   223,   223,   223,   168,   223,   118,   168,   139,   220,
     222,   229,   229,    70,   141,    69,   141,    70,   141,    69,
     141,   229,   229,    64,   118,   223,   118,   123,   141,   141,
     141,   229,   229,   229,   229,    70,   141,    69,   141,   223,
     139,   223,   141,   220,   141,   141,   141,   141,   229,   229,
     141,   141
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  However,
   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
   discussed.  */

#define YYFAIL		goto yyerrlab
#if defined YYFAIL
  /* This is here to suppress warnings from the GCC cpp's
     -Wunused-macros.  Normally we don't worry about that warning, but
     some users do, and we want to make it easy for users to remove
     YYFAIL uses, which will produce warnings from Bison 2.5.  */
#endif

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value, Location); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    YYLTYPE const * const yylocationp;
#endif
{
  if (!yyvaluep)
    return;
  YYUSE (yylocationp);
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, yylocationp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    YYLTYPE const * const yylocationp;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  YY_LOCATION_PRINT (yyoutput, *yylocationp);
  YYFPRINTF (yyoutput, ": ");
  yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, YYLTYPE *yylsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yylsp, yyrule)
    YYSTYPE *yyvsp;
    YYLTYPE *yylsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       , &(yylsp[(yyi + 1) - (yynrhs)])		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, yylsp, Rule); \
} while (YYID (0))

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
#ifndef	YYINITDEPTH
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
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
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
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
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

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, YYLTYPE *yylocationp)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, yylocationp)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    YYLTYPE *yylocationp;
#endif
{
  YYUSE (yyvaluep);
  YYUSE (yylocationp);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {
      case 143: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 153 "expression.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3394 "expression.ec"
	break;
      case 144: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3403 "expression.ec"
	break;
      case 147: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3412 "expression.ec"
	break;
      case 149: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 188 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3421 "expression.ec"
	break;
      case 151: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3430 "expression.ec"
	break;
      case 154: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3439 "expression.ec"
	break;
      case 155: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3448 "expression.ec"
	break;
      case 156: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3457 "expression.ec"
	break;
      case 157: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3466 "expression.ec"
	break;
      case 158: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3475 "expression.ec"
	break;
      case 159: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3484 "expression.ec"
	break;
      case 160: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3493 "expression.ec"
	break;
      case 161: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3502 "expression.ec"
	break;
      case 162: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3511 "expression.ec"
	break;
      case 163: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3520 "expression.ec"
	break;
      case 164: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3529 "expression.ec"
	break;
      case 165: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3538 "expression.ec"
	break;
      case 166: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3547 "expression.ec"
	break;
      case 168: /* "expression" */

/* Line 1009 of yacc.c  */
#line 188 "expression.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3556 "expression.ec"
	break;
      case 169: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 155 "expression.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3565 "expression.ec"
	break;
      case 170: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 174 "expression.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 3574 "expression.ec"
	break;
      case 171: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3583 "expression.ec"
	break;
      case 172: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3592 "expression.ec"
	break;
      case 175: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 194 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 3601 "expression.ec"
	break;
      case 176: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 169 "expression.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 3610 "expression.ec"
	break;
      case 177: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3619 "expression.ec"
	break;
      case 178: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 202 "expression.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 3628 "expression.ec"
	break;
      case 180: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 3637 "expression.ec"
	break;
      case 181: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 203 "expression.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 3646 "expression.ec"
	break;
      case 182: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 204 "expression.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 3655 "expression.ec"
	break;
      case 183: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 201 "expression.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 3664 "expression.ec"
	break;
      case 184: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3673 "expression.ec"
	break;
      case 185: /* "type" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3682 "expression.ec"
	break;
      case 186: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3691 "expression.ec"
	break;
      case 187: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3700 "expression.ec"
	break;
      case 188: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3709 "expression.ec"
	break;
      case 189: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3718 "expression.ec"
	break;
      case 190: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3727 "expression.ec"
	break;
      case 192: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 197 "expression.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 3736 "expression.ec"
	break;
      case 193: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 178 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 3745 "expression.ec"
	break;
      case 194: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 198 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 3754 "expression.ec"
	break;
      case 195: /* "property" */

/* Line 1009 of yacc.c  */
#line 186 "expression.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 3763 "expression.ec"
	break;
      case 196: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 184 "expression.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 3772 "expression.ec"
	break;
      case 197: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 191 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 3781 "expression.ec"
	break;
      case 198: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3790 "expression.ec"
	break;
      case 199: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3799 "expression.ec"
	break;
      case 200: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 161 "expression.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3808 "expression.ec"
	break;
      case 201: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 189 "expression.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 3817 "expression.ec"
	break;
      case 202: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 163 "expression.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 3826 "expression.ec"
	break;
      case 203: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3835 "expression.ec"
	break;
      case 204: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3844 "expression.ec"
	break;
      case 205: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3853 "expression.ec"
	break;
      case 206: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3862 "expression.ec"
	break;
      case 207: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3871 "expression.ec"
	break;
      case 208: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3880 "expression.ec"
	break;
      case 209: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3889 "expression.ec"
	break;
      case 210: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3898 "expression.ec"
	break;
      case 211: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3907 "expression.ec"
	break;
      case 212: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 164 "expression.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 3916 "expression.ec"
	break;
      case 213: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 190 "expression.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 3925 "expression.ec"
	break;
      case 214: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 154 "expression.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 3934 "expression.ec"
	break;
      case 215: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3943 "expression.ec"
	break;
      case 216: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3952 "expression.ec"
	break;
      case 217: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 170 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 3961 "expression.ec"
	break;
      case 218: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 195 "expression.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 3970 "expression.ec"
	break;
      case 219: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 170 "expression.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 3979 "expression.ec"
	break;
      case 220: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 3988 "expression.ec"
	break;
      case 221: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 168 "expression.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 3997 "expression.ec"
	break;
      case 222: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 193 "expression.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4006 "expression.ec"
	break;
      case 223: /* "statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4015 "expression.ec"
	break;
      case 224: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4024 "expression.ec"
	break;
      case 225: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 192 "expression.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4033 "expression.ec"
	break;
      case 226: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 196 "expression.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4042 "expression.ec"
	break;
      case 227: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4051 "expression.ec"
	break;
      case 228: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 200 "expression.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4060 "expression.ec"
	break;
      case 229: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4069 "expression.ec"
	break;
      case 230: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4078 "expression.ec"
	break;
      case 231: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4087 "expression.ec"
	break;
      case 232: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4096 "expression.ec"
	break;
      case 233: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 171 "expression.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4105 "expression.ec"
	break;
      case 234: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 185 "expression.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4114 "expression.ec"
	break;
      case 235: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4123 "expression.ec"
	break;
      case 236: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 176 "expression.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4132 "expression.ec"
	break;
      case 238: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4141 "expression.ec"
	break;
      case 239: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4150 "expression.ec"
	break;
      case 240: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4159 "expression.ec"
	break;
      case 241: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4168 "expression.ec"
	break;
      case 242: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4177 "expression.ec"
	break;
      case 243: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4186 "expression.ec"
	break;
      case 244: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 180 "expression.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4195 "expression.ec"
	break;
      case 245: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 178 "expression.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4204 "expression.ec"
	break;
      case 246: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 198 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4213 "expression.ec"
	break;
      case 247: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 198 "expression.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4222 "expression.ec"
	break;
      case 248: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 199 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4231 "expression.ec"
	break;
      case 249: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 199 "expression.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4240 "expression.ec"
	break;

      default:
	break;
    }
}

/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Location data for the lookahead symbol.  */
YYLTYPE yylloc;

/* Number of syntax errors so far.  */
int yynerrs;



/*-------------------------.
| yyparse or yypush_parse.  |
`-------------------------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{


    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.
       `yyls': related to locations.

       Refer to the stacks thru separate pointers, to allow yyoverflow
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
    YYLTYPE yyerror_range[2];

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
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

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yyls = yylsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;
  yylsp = yyls;

#if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
  /* Initialize the default location before parsing starts.  */
  yylloc.first_line   = yylloc.last_line   = 1;
  yylloc.first_column = yylloc.last_column = 1;
#endif

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
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
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
      if (yyn == 0 || yyn == YYTABLE_NINF)
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
  *++yyvsp = yylval;
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
     `$$ = $1'.

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

/* Line 1464 of yacc.c  */
#line 212 "expression.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 4:

/* Line 1464 of yacc.c  */
#line 218 "expression.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 5:

/* Line 1464 of yacc.c  */
#line 223 "expression.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 6:

/* Line 1464 of yacc.c  */
#line 225 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 7:

/* Line 1464 of yacc.c  */
#line 227 "expression.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 8:

/* Line 1464 of yacc.c  */
#line 229 "expression.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 230 "expression.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 10:

/* Line 1464 of yacc.c  */
#line 231 "expression.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 11:

/* Line 1464 of yacc.c  */
#line 233 "expression.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 12:

/* Line 1464 of yacc.c  */
#line 235 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 13:

/* Line 1464 of yacc.c  */
#line 236 "expression.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 237 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 238 "expression.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 239 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 240 "expression.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 18:

/* Line 1464 of yacc.c  */
#line 241 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 19:

/* Line 1464 of yacc.c  */
#line 242 "expression.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 20:

/* Line 1464 of yacc.c  */
#line 243 "expression.y"
    { (yyval.exp) = MkExpDummy(); ;}
    break;

  case 21:

/* Line 1464 of yacc.c  */
#line 247 "expression.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 23:

/* Line 1464 of yacc.c  */
#line 252 "expression.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 253 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 254 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 255 "expression.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 256 "expression.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 28:

/* Line 1464 of yacc.c  */
#line 257 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 29:

/* Line 1464 of yacc.c  */
#line 258 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:

/* Line 1464 of yacc.c  */
#line 264 "expression.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 265 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 266 "expression.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 267 "expression.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 268 "expression.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 36:

/* Line 1464 of yacc.c  */
#line 269 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 37:

/* Line 1464 of yacc.c  */
#line 270 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 38:

/* Line 1464 of yacc.c  */
#line 274 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 275 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 276 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 277 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 42:

/* Line 1464 of yacc.c  */
#line 281 "expression.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 43:

/* Line 1464 of yacc.c  */
#line 282 "expression.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 44:

/* Line 1464 of yacc.c  */
#line 283 "expression.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 45:

/* Line 1464 of yacc.c  */
#line 284 "expression.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 46:

/* Line 1464 of yacc.c  */
#line 285 "expression.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 286 "expression.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 287 "expression.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 288 "expression.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 289 "expression.y"
    { (yyval.exp) = MkExpTypeAlign((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 303 "expression.y"
    { (yyval.i) = '&'; ;}
    break;

  case 56:

/* Line 1464 of yacc.c  */
#line 304 "expression.y"
    { (yyval.i) = '*'; ;}
    break;

  case 57:

/* Line 1464 of yacc.c  */
#line 305 "expression.y"
    { (yyval.i) = '+'; ;}
    break;

  case 58:

/* Line 1464 of yacc.c  */
#line 306 "expression.y"
    { (yyval.i) = '-'; ;}
    break;

  case 59:

/* Line 1464 of yacc.c  */
#line 307 "expression.y"
    { (yyval.i) = '~'; ;}
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 308 "expression.y"
    { (yyval.i) = '!'; ;}
    break;

  case 61:

/* Line 1464 of yacc.c  */
#line 309 "expression.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 63:

/* Line 1464 of yacc.c  */
#line 314 "expression.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 65:

/* Line 1464 of yacc.c  */
#line 319 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 66:

/* Line 1464 of yacc.c  */
#line 320 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 67:

/* Line 1464 of yacc.c  */
#line 321 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 69:

/* Line 1464 of yacc.c  */
#line 326 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 70:

/* Line 1464 of yacc.c  */
#line 327 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 72:

/* Line 1464 of yacc.c  */
#line 332 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 73:

/* Line 1464 of yacc.c  */
#line 333 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 75:

/* Line 1464 of yacc.c  */
#line 338 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '<', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 76:

/* Line 1464 of yacc.c  */
#line 339 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 77:

/* Line 1464 of yacc.c  */
#line 340 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 78:

/* Line 1464 of yacc.c  */
#line 341 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 80:

/* Line 1464 of yacc.c  */
#line 346 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 81:

/* Line 1464 of yacc.c  */
#line 347 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 83:

/* Line 1464 of yacc.c  */
#line 352 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 85:

/* Line 1464 of yacc.c  */
#line 357 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 87:

/* Line 1464 of yacc.c  */
#line 362 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 89:

/* Line 1464 of yacc.c  */
#line 367 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 91:

/* Line 1464 of yacc.c  */
#line 372 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 93:

/* Line 1464 of yacc.c  */
#line 377 "expression.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 95:

/* Line 1464 of yacc.c  */
#line 382 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 96:

/* Line 1464 of yacc.c  */
#line 384 "expression.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 97:

/* Line 1464 of yacc.c  */
#line 389 "expression.y"
    { (yyval.i) = '='; ;}
    break;

  case 98:

/* Line 1464 of yacc.c  */
#line 390 "expression.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 99:

/* Line 1464 of yacc.c  */
#line 391 "expression.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 100:

/* Line 1464 of yacc.c  */
#line 392 "expression.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 101:

/* Line 1464 of yacc.c  */
#line 393 "expression.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 102:

/* Line 1464 of yacc.c  */
#line 394 "expression.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 103:

/* Line 1464 of yacc.c  */
#line 395 "expression.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 104:

/* Line 1464 of yacc.c  */
#line 396 "expression.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 105:

/* Line 1464 of yacc.c  */
#line 397 "expression.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 106:

/* Line 1464 of yacc.c  */
#line 398 "expression.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 107:

/* Line 1464 of yacc.c  */
#line 399 "expression.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 108:

/* Line 1464 of yacc.c  */
#line 403 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 404 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 412 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 112:

/* Line 1464 of yacc.c  */
#line 413 "expression.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 414 "expression.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 415 "expression.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 115:

/* Line 1464 of yacc.c  */
#line 419 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 116:

/* Line 1464 of yacc.c  */
#line 420 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 117:

/* Line 1464 of yacc.c  */
#line 421 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 118:

/* Line 1464 of yacc.c  */
#line 422 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 119:

/* Line 1464 of yacc.c  */
#line 423 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 424 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 121:

/* Line 1464 of yacc.c  */
#line 425 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 426 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 123:

/* Line 1464 of yacc.c  */
#line 430 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 431 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 125:

/* Line 1464 of yacc.c  */
#line 432 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 126:

/* Line 1464 of yacc.c  */
#line 433 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 127:

/* Line 1464 of yacc.c  */
#line 434 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 128:

/* Line 1464 of yacc.c  */
#line 435 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 436 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 437 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 438 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 439 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 444 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 445 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 446 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 447 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 448 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 449 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 139:

/* Line 1464 of yacc.c  */
#line 450 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 451 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 455 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 456 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 143:

/* Line 1464 of yacc.c  */
#line 457 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 458 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 459 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 146:

/* Line 1464 of yacc.c  */
#line 460 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 147:

/* Line 1464 of yacc.c  */
#line 461 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 148:

/* Line 1464 of yacc.c  */
#line 462 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 149:

/* Line 1464 of yacc.c  */
#line 463 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 150:

/* Line 1464 of yacc.c  */
#line 464 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 151:

/* Line 1464 of yacc.c  */
#line 468 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 152:

/* Line 1464 of yacc.c  */
#line 469 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 473 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 474 "expression.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 478 "expression.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 479 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 480 "expression.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 158:

/* Line 1464 of yacc.c  */
#line 481 "expression.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 159:

/* Line 1464 of yacc.c  */
#line 482 "expression.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 160:

/* Line 1464 of yacc.c  */
#line 486 "expression.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 161:

/* Line 1464 of yacc.c  */
#line 487 "expression.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); ;}
    break;

  case 162:

/* Line 1464 of yacc.c  */
#line 491 "expression.y"
    { (yyval.i) = ATTRIB; ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 492 "expression.y"
    { (yyval.i) = ATTRIB_DEP; ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 493 "expression.y"
    { (yyval.i) = __ATTRIB; ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 498 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 499 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 500 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 501 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 169:

/* Line 1464 of yacc.c  */
#line 502 "expression.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 170:

/* Line 1464 of yacc.c  */
#line 506 "expression.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 171:

/* Line 1464 of yacc.c  */
#line 507 "expression.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 172:

/* Line 1464 of yacc.c  */
#line 511 "expression.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 512 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 513 "expression.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 517 "expression.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 518 "expression.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 522 "expression.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 523 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 179:

/* Line 1464 of yacc.c  */
#line 524 "expression.y"
    { (yyval.specifier) = MkSpecifierExtended(MkExtDeclString(CopyString(yytext))); ;}
    break;

  case 180:

/* Line 1464 of yacc.c  */
#line 528 "expression.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 553 "expression.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 557 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 558 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 559 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 560 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 561 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 562 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 563 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 564 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 190:

/* Line 1464 of yacc.c  */
#line 565 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 191:

/* Line 1464 of yacc.c  */
#line 566 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 192:

/* Line 1464 of yacc.c  */
#line 567 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 193:

/* Line 1464 of yacc.c  */
#line 568 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 194:

/* Line 1464 of yacc.c  */
#line 569 "expression.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 570 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 571 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 575 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 201:

/* Line 1464 of yacc.c  */
#line 576 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 202:

/* Line 1464 of yacc.c  */
#line 580 "expression.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 581 "expression.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 582 "expression.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 583 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 584 "expression.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 585 "expression.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 586 "expression.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 587 "expression.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 588 "expression.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 211:

/* Line 1464 of yacc.c  */
#line 589 "expression.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 590 "expression.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 213:

/* Line 1464 of yacc.c  */
#line 591 "expression.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 592 "expression.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 593 "expression.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 597 "expression.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 598 "expression.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 603 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 604 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 605 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 606 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 608 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 610 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 611 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 612 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 613 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 615 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 619 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 621 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 624 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass(0, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 626 "expression.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass(0, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 235:

/* Line 1464 of yacc.c  */
#line 630 "expression.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 236:

/* Line 1464 of yacc.c  */
#line 631 "expression.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 635 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 636 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 640 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 644 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 645 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 650 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 243:

/* Line 1464 of yacc.c  */
#line 652 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 244:

/* Line 1464 of yacc.c  */
#line 654 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 245:

/* Line 1464 of yacc.c  */
#line 656 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 658 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 661 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 663 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 665 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 667 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 669 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 672 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 674 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 676 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 678 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 680 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 683 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 685 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 687 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 689 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 691 "expression.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 695 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 696 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 697 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 698 "expression.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 699 "expression.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 267:

/* Line 1464 of yacc.c  */
#line 700 "expression.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 268:

/* Line 1464 of yacc.c  */
#line 701 "expression.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 269:

/* Line 1464 of yacc.c  */
#line 702 "expression.y"
    { (yyval.classDef) = null; ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 707 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 709 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 714 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 716 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 718 "expression.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 720 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 722 "expression.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 726 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 727 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 732 "expression.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 733 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 734 "expression.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 735 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 736 "expression.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 741 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 743 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 748 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 750 "expression.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 756 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 758 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 760 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 762 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 764 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 293:

/* Line 1464 of yacc.c  */
#line 766 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 294:

/* Line 1464 of yacc.c  */
#line 768 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 770 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 772 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 774 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 776 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 781 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 783 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 785 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 787 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 789 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 793 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 795 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 796 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 797 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 798 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 802 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 804 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 805 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 806 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 807 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 855 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 857 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 863 "expression.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 865 "expression.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 867 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 869 "expression.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 871 "expression.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 877 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 880 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 882 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 884 "expression.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 892 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 894 "expression.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 903 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 905 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 907 "expression.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 911 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 912 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 916 "expression.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 917 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 918 "expression.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 919 "expression.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 924 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 928 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 929 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 933 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 934 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 935 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 939 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 940 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 944 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 945 "expression.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 955 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 957 "expression.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 959 "expression.y"
    {
         (yyval.initializer) = MkInitializerList((yyvsp[(2) - (4)].list));
         (yyval.initializer).loc = (yyloc);

         {
            Expression exp = MkExpDummy();
            Initializer init = MkInitializerAssignment(exp);
            init.loc = (yylsp[(3) - (4)]);
            exp.loc = (yylsp[(3) - (4)]);
            ListAdd((yyvsp[(2) - (4)].list), init);
         }
      ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 974 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 976 "expression.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 359:

/* Line 1464 of yacc.c  */
#line 997 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 999 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1013 "expression.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1015 "expression.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1017 "expression.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1021 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 371:

/* Line 1464 of yacc.c  */
#line 1022 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1026 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1027 "expression.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1030 "expression.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1034 "expression.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1035 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 377:

/* Line 1464 of yacc.c  */
#line 1036 "expression.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1040 "expression.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1045 "expression.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1053 "expression.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1057 "expression.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 382:

/* Line 1464 of yacc.c  */
#line 1058 "expression.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1062 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1063 "expression.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1064 "expression.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1068 "expression.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1069 "expression.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1070 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1071 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1073 "expression.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 391:

/* Line 1464 of yacc.c  */
#line 1074 "expression.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1075 "expression.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1079 "expression.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1080 "expression.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1081 "expression.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 396:

/* Line 1464 of yacc.c  */
#line 1082 "expression.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1083 "expression.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1087 "expression.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1092 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 400:

/* Line 1464 of yacc.c  */
#line 1094 "expression.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 401:

/* Line 1464 of yacc.c  */
#line 1099 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1101 "expression.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1103 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 404:

/* Line 1464 of yacc.c  */
#line 1105 "expression.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1110 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1112 "expression.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1117 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1119 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1124 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1129 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1134 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1136 "expression.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1141 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1143 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 415:

/* Line 1464 of yacc.c  */
#line 1145 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1147 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1149 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1155 "expression.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1160 "expression.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1164 "expression.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1165 "expression.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1170 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1172 "expression.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1177 "expression.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1181 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1182 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1183 "expression.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 428:

/* Line 1464 of yacc.c  */
#line 1184 "expression.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 429:

/* Line 1464 of yacc.c  */
#line 1185 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 430:

/* Line 1464 of yacc.c  */
#line 1186 "expression.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 432:

/* Line 1464 of yacc.c  */
#line 1191 "expression.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 433:

/* Line 1464 of yacc.c  */
#line 1192 "expression.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 434:

/* Line 1464 of yacc.c  */
#line 1196 "expression.y"
    { parsedExpression = (yyvsp[(1) - (1)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 7325 "expression.ec"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;
  *++yylsp = yyloc;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }

  yyerror_range[0] = yylloc;

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

  yyerror_range[0] = yylsp[1-yylen];
  /* Do not reclaim the symbols of the rule which action triggered
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
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
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

      yyerror_range[0] = *yylsp;
      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp, yylsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;

  yyerror_range[1] = yylloc;
  /* Using YYLLOC is tempting, but would change the location of
     the lookahead.  YYLOC is available though.  */
  YYLLOC_DEFAULT (yyloc, (yyerror_range - 1), 2);
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

#if !defined(yyoverflow) || YYERROR_VERBOSE
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
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval, &yylloc);
  /* Do not reclaim the symbols of the rule which action triggered
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
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 1684 of yacc.c  */
#line 1198 "expression.y"


