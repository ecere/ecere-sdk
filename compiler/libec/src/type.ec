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
#line 1 "type.y"


import "ecdefs"

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



/* Line 189 of yacc.c  */
#line 109 "type.ec"

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
#line 39 "type.y"

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



/* Line 214 of yacc.c  */
#line 299 "type.ec"
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
#line 324 "type.ec"

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
#define YYFINAL  98
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   8879

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  142
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  125
/* YYNRULES -- Number of rules.  */
#define YYNRULES  509
/* YYNRULES -- Number of states.  */
#define YYNSTATES  876

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
       2,     2,     2,   131,     2,     2,   123,   133,   128,     2,
     120,   121,   117,   129,   127,   130,   124,   132,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,   137,   139,
     118,   138,   119,   136,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,   125,     2,   126,   134,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   140,   135,   141,   122,     2,     2,     2,
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
       0,     0,     3,     6,     9,    12,    14,    17,    19,    21,
      26,    31,    34,    36,    40,    45,    49,    52,    54,    56,
      60,    62,    64,    66,    68,    71,    76,    79,    86,    92,
      99,   105,   113,   120,   128,   135,   137,   139,   144,   148,
     153,   157,   161,   164,   167,   169,   171,   176,   180,   185,
     189,   193,   196,   199,   201,   203,   207,   211,   214,   217,
     220,   225,   228,   233,   238,   241,   246,   248,   250,   252,
     254,   256,   258,   260,   262,   264,   266,   268,   270,   275,
     277,   281,   285,   289,   291,   295,   299,   301,   305,   309,
     312,   314,   317,   321,   325,   329,   331,   335,   339,   341,
     345,   347,   351,   353,   357,   359,   363,   365,   369,   371,
     377,   379,   383,   387,   389,   391,   393,   395,   397,   399,
     401,   403,   405,   407,   409,   411,   415,   417,   420,   424,
     427,   433,   435,   438,   440,   443,   445,   448,   450,   453,
     455,   458,   460,   463,   465,   468,   470,   473,   475,   478,
     480,   483,   485,   488,   490,   493,   495,   498,   500,   503,
     505,   508,   510,   513,   515,   518,   520,   523,   525,   528,
     530,   533,   535,   537,   539,   542,   544,   547,   549,   552,
     554,   557,   562,   568,   570,   573,   575,   578,   580,   583,
     585,   588,   590,   593,   595,   598,   603,   609,   611,   615,
     617,   621,   623,   625,   627,   629,   631,   633,   635,   637,
     639,   641,   643,   645,   647,   649,   651,   653,   655,   660,
     662,   665,   669,   676,   682,   684,   686,   688,   690,   692,
     694,   696,   698,   700,   702,   704,   706,   708,   710,   712,
     714,   716,   718,   720,   722,   724,   726,   731,   736,   741,
     743,   745,   747,   749,   751,   753,   755,   757,   759,   761,
     763,   765,   767,   769,   771,   773,   775,   777,   779,   781,
     783,   788,   793,   798,   800,   806,   811,   816,   820,   826,
     833,   839,   845,   850,   857,   860,   863,   867,   871,   873,
     876,   878,   881,   883,   885,   887,   891,   895,   899,   903,
     905,   909,   911,   913,   915,   918,   922,   924,   928,   938,
     948,   956,   964,   970,   981,   992,  1001,  1010,  1017,  1026,
    1035,  1042,  1049,  1054,  1064,  1074,  1082,  1090,  1096,  1100,
    1103,  1106,  1109,  1111,  1114,  1116,  1118,  1120,  1124,  1126,
    1129,  1132,  1136,  1142,  1145,  1148,  1153,  1159,  1167,  1175,
    1181,  1183,  1187,  1189,  1193,  1197,  1200,  1204,  1208,  1212,
    1217,  1222,  1225,  1229,  1233,  1238,  1242,  1245,  1249,  1253,
    1258,  1260,  1262,  1265,  1268,  1271,  1275,  1277,  1279,  1282,
    1285,  1288,  1292,  1294,  1297,  1301,  1304,  1306,  1310,  1315,
    1319,  1324,  1326,  1329,  1332,  1336,  1340,  1343,  1347,  1351,
    1354,  1356,  1358,  1361,  1364,  1366,  1369,  1372,  1376,  1380,
    1382,  1385,  1387,  1390,  1393,  1397,  1399,  1403,  1405,  1409,
    1412,  1415,  1418,  1422,  1424,  1426,  1428,  1432,  1434,  1437,
    1439,  1442,  1444,  1448,  1453,  1455,  1457,  1459,  1463,  1465,
    1467,  1469,  1471,  1473,  1475,  1479,  1484,  1488,  1490,  1493,
    1495,  1498,  1501,  1503,  1505,  1508,  1510,  1513,  1517,  1519,
    1522,  1528,  1536,  1542,  1548,  1556,  1563,  1571,  1576,  1582,
    1587,  1591,  1594,  1597,  1600,  1604,  1606,  1612,  1617,  1623,
    1628,  1633,  1637,  1642,  1646,  1650,  1653,  1656,  1659,  1662,
    1665,  1668,  1671,  1674,  1677,  1681,  1683,  1685,  1689,  1692,
    1694,  1696,  1699,  1702,  1704,  1707,  1709,  1711,  1714,  1716
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     266,     0,    -1,   152,   117,    -1,   152,   118,    -1,   152,
       1,    -1,   147,    -1,   152,   152,    -1,    28,    -1,   146,
      -1,   146,   118,   207,   119,    -1,   146,   118,   207,    11,
      -1,   184,   226,    -1,   226,    -1,   184,   120,   121,    -1,
     122,   184,   120,   121,    -1,    78,   184,   226,    -1,    78,
     226,    -1,     3,    -1,   154,    -1,   120,   178,   121,    -1,
     152,    -1,   256,    -1,     4,    -1,   253,    -1,   123,   253,
      -1,   123,   253,   124,   253,    -1,   120,   121,    -1,    71,
     184,   223,   125,   179,   126,    -1,    71,   184,   125,   179,
     126,    -1,   102,   184,   223,   125,   179,   126,    -1,   102,
     184,   125,   179,   126,    -1,    72,   179,   187,   223,   125,
     179,   126,    -1,    72,   179,   187,   125,   179,   126,    -1,
     103,   179,   187,   223,   125,   179,   126,    -1,   103,   179,
     187,   125,   179,   126,    -1,     1,    -1,   153,    -1,   155,
     125,   178,   126,    -1,   155,   120,   121,    -1,   155,   120,
     158,   121,    -1,   155,   124,   152,    -1,   155,     7,   152,
      -1,   155,     8,    -1,   155,     9,    -1,   257,    -1,   154,
      -1,   157,   125,   178,   126,    -1,   157,   120,   121,    -1,
     157,   120,   158,   121,    -1,   157,   124,   152,    -1,   157,
       7,   152,    -1,   157,     8,    -1,   157,     9,    -1,   176,
      -1,   156,    -1,   158,   127,   176,    -1,   158,   127,   156,
      -1,     8,   160,    -1,     9,   160,    -1,   162,   163,    -1,
       6,   120,   160,   121,    -1,     6,   161,    -1,     6,   120,
     238,   121,    -1,   109,   120,   160,   121,    -1,   109,   161,
      -1,   109,   120,   238,   121,    -1,   159,    -1,   155,    -1,
     159,    -1,   157,    -1,   128,    -1,   117,    -1,   129,    -1,
     130,    -1,   122,    -1,   131,    -1,    73,    -1,   160,    -1,
     120,   237,   121,   163,    -1,   163,    -1,   164,   117,   163,
      -1,   164,   132,   163,    -1,   164,   133,   163,    -1,   164,
      -1,   165,   129,   164,    -1,   165,   130,   164,    -1,   165,
      -1,   166,    10,   165,    -1,   166,    11,   165,    -1,   168,
     118,    -1,   166,    -1,   167,   166,    -1,   168,   119,   166,
      -1,   168,    12,   166,    -1,   168,    13,   166,    -1,   168,
      -1,   169,    14,   168,    -1,   169,    15,   168,    -1,   169,
      -1,   170,   128,   169,    -1,   170,    -1,   171,   134,   170,
      -1,   171,    -1,   172,   135,   171,    -1,   172,    -1,   173,
      16,   172,    -1,   173,    -1,   174,    17,   173,    -1,   174,
      -1,   174,   136,   178,   137,   175,    -1,   175,    -1,   160,
     177,   176,    -1,   160,   177,   156,    -1,   138,    -1,    18,
      -1,    19,    -1,    20,    -1,    21,    -1,    22,    -1,    23,
      -1,    24,    -1,    25,    -1,    26,    -1,    27,    -1,   176,
      -1,   178,   127,   176,    -1,   175,    -1,   183,   139,    -1,
     183,   188,   139,    -1,   254,   139,    -1,    77,   152,   138,
     179,   139,    -1,   198,    -1,   181,   198,    -1,   199,    -1,
     181,   199,    -1,   217,    -1,   181,   217,    -1,   201,    -1,
     181,   201,    -1,   198,    -1,   182,   198,    -1,   199,    -1,
     182,   199,    -1,   143,    -1,   182,   143,    -1,   217,    -1,
     182,   217,    -1,   201,    -1,   182,   201,    -1,   190,    -1,
     183,   190,    -1,   198,    -1,   183,   198,    -1,   199,    -1,
     183,   199,    -1,   217,    -1,   183,   217,    -1,   201,    -1,
     183,   201,    -1,   190,    -1,   184,   190,    -1,   198,    -1,
     184,   198,    -1,   199,    -1,   184,   199,    -1,   143,    -1,
     184,   143,    -1,   201,    -1,   184,   201,    -1,   217,    -1,
     184,   217,    -1,   184,    -1,   144,    -1,   190,    -1,   186,
     190,    -1,   198,    -1,   186,   198,    -1,   200,    -1,   186,
     200,    -1,   152,    -1,   186,   152,    -1,   152,   118,   207,
     119,    -1,   186,   152,   118,   207,   119,    -1,   190,    -1,
     187,   190,    -1,   198,    -1,   187,   198,    -1,   200,    -1,
     187,   200,    -1,   201,    -1,   187,   201,    -1,   217,    -1,
     187,   217,    -1,   152,    -1,   187,   152,    -1,   152,   118,
     207,   119,    -1,   187,   152,   118,   207,   119,    -1,   189,
      -1,   188,   127,   189,    -1,   224,    -1,   224,   138,   239,
      -1,    29,    -1,    30,    -1,    31,    -1,    32,    -1,    33,
      -1,    74,    -1,    75,    -1,   196,    -1,    79,    -1,   110,
      -1,   111,    -1,     3,    -1,    28,    -1,    75,    -1,    74,
      -1,    44,    -1,   193,    -1,   193,   120,   178,   121,    -1,
     194,    -1,   195,   194,    -1,   195,   127,   194,    -1,   192,
     120,   120,   195,   121,   121,    -1,   192,   120,   120,   121,
     121,    -1,   191,    -1,    44,    -1,    45,    -1,   197,    -1,
      46,    -1,    34,    -1,    35,    -1,    36,    -1,    37,    -1,
      38,    -1,    47,    -1,    39,    -1,    42,    -1,    43,    -1,
      40,    -1,    41,    -1,    85,    -1,   113,    -1,   112,    -1,
     202,    -1,   216,    -1,   145,    -1,    87,   120,   176,   121,
      -1,   100,   120,   145,   121,    -1,   100,   120,   152,   121,
      -1,    66,    -1,    82,    -1,    83,    -1,    46,    -1,    34,
      -1,    35,    -1,    36,    -1,    37,    -1,    38,    -1,    47,
      -1,    39,    -1,    42,    -1,    43,    -1,    40,    -1,    41,
      -1,    85,    -1,   113,    -1,   112,    -1,   202,    -1,   216,
      -1,   147,    -1,    87,   120,   176,   121,    -1,   100,   120,
     145,   121,    -1,   100,   120,   152,   121,    -1,    66,    -1,
     208,   152,   140,   209,   141,    -1,   208,   140,   209,   141,
      -1,   208,   152,   140,   141,    -1,   208,   140,   141,    -1,
     208,   146,   140,   209,   141,    -1,   208,   191,   152,   140,
     209,   141,    -1,   208,   191,   140,   209,   141,    -1,   208,
     191,   152,   140,   141,    -1,   208,   191,   140,   141,    -1,
     208,   191,   147,   140,   209,   141,    -1,   208,   152,    -1,
     208,   147,    -1,   208,   191,   152,    -1,   208,   191,   147,
      -1,   184,    -1,   184,   222,    -1,   184,    -1,   184,   222,
      -1,   166,    -1,   205,    -1,   204,    -1,   152,   138,   205,
      -1,   152,   138,   204,    -1,   203,   138,   205,    -1,   203,
     138,   204,    -1,   206,    -1,   207,   127,   206,    -1,    48,
      -1,    49,    -1,   213,    -1,   209,   213,    -1,   155,   138,
     240,    -1,   210,    -1,   211,   127,   210,    -1,    68,   186,
     152,   140,    69,   248,    70,   248,   141,    -1,    68,   186,
     152,   140,    70,   248,    69,   248,   141,    -1,    68,   186,
     152,   140,    69,   248,   141,    -1,    68,   186,   152,   140,
      70,   248,   141,    -1,    68,   186,   152,   140,   141,    -1,
      68,   186,   222,   152,   140,    69,   248,    70,   248,   141,
      -1,    68,   186,   222,   152,   140,    70,   248,    69,   248,
     141,    -1,    68,   186,   222,   152,   140,    69,   248,   141,
      -1,    68,   186,   222,   152,   140,    70,   248,   141,    -1,
      68,   186,   222,   152,   140,   141,    -1,    68,   186,   140,
      69,   248,    70,   248,   141,    -1,    68,   186,   140,    70,
     248,    69,   248,   141,    -1,    68,   186,   140,    69,   248,
     141,    -1,    68,   186,   140,    70,   248,   141,    -1,    68,
     186,   140,   141,    -1,    68,   186,   222,   140,    69,   248,
      70,   248,   141,    -1,    68,   186,   222,   140,    70,   248,
      69,   248,   141,    -1,    68,   186,   222,   140,    69,   248,
     141,    -1,    68,   186,   222,   140,    70,   248,   141,    -1,
      68,   186,   222,   140,   141,    -1,   184,   214,   139,    -1,
     184,   139,    -1,   256,   139,    -1,   255,   139,    -1,   258,
      -1,   211,   139,    -1,   212,    -1,   139,    -1,   215,    -1,
     214,   127,   215,    -1,   230,    -1,   230,   196,    -1,   137,
     179,    -1,   230,   137,   179,    -1,   230,   137,   179,   137,
     179,    -1,    50,   152,    -1,    50,   147,    -1,    50,   140,
     218,   141,    -1,    50,   152,   140,   218,   141,    -1,    50,
     152,   140,   218,   139,   209,   141,    -1,    50,   147,   140,
     218,   139,   209,   141,    -1,    50,   147,   140,   218,   141,
      -1,   219,    -1,   218,   127,   219,    -1,   152,    -1,   152,
     138,   179,    -1,   120,   222,   121,    -1,   125,   126,    -1,
     125,   179,   126,    -1,   125,   145,   126,    -1,   220,   125,
     126,    -1,   220,   125,   179,   126,    -1,   220,   125,   145,
     126,    -1,   120,   121,    -1,   120,   233,   121,    -1,   220,
     120,   121,    -1,   220,   120,   233,   121,    -1,   120,   223,
     121,    -1,   120,   121,    -1,   120,   233,   121,    -1,   221,
     120,   121,    -1,   221,   120,   233,   121,    -1,   232,    -1,
     220,    -1,   232,   220,    -1,   191,   232,    -1,   191,   220,
      -1,   191,   232,   220,    -1,   232,    -1,   221,    -1,   232,
     221,    -1,   191,   232,    -1,   191,   221,    -1,   191,   232,
     221,    -1,   229,    -1,   232,   229,    -1,   191,   232,   229,
      -1,   224,   191,    -1,   152,    -1,   120,   224,   121,    -1,
     225,   125,   179,   126,    -1,   225,   125,   126,    -1,   225,
     125,   145,   126,    -1,   228,    -1,   232,   228,    -1,   191,
     228,    -1,   191,   232,   228,    -1,   232,   191,   228,    -1,
     225,   120,    -1,   227,   233,   121,    -1,   227,   236,   121,
      -1,   227,   121,    -1,   228,    -1,   225,    -1,   191,   228,
      -1,   191,   225,    -1,   225,    -1,   232,   225,    -1,   191,
     225,    -1,   191,   232,   225,    -1,   232,   191,   225,    -1,
     198,    -1,   231,   198,    -1,   117,    -1,   117,   231,    -1,
     117,   232,    -1,   117,   231,   232,    -1,   234,    -1,   234,
     127,    51,    -1,   235,    -1,   234,   127,   235,    -1,   184,
     224,    -1,   184,   222,    -1,   184,   128,    -1,   184,   128,
     224,    -1,   185,    -1,    65,    -1,   152,    -1,   236,   127,
     152,    -1,   181,    -1,   181,   222,    -1,   182,    -1,   182,
     222,    -1,   176,    -1,   140,   241,   141,    -1,   140,   241,
     127,   141,    -1,   175,    -1,   156,    -1,   239,    -1,   241,
     127,   239,    -1,   243,    -1,   248,    -1,   249,    -1,   250,
      -1,   251,    -1,   252,    -1,   152,   137,   242,    -1,    52,
     179,   137,   242,    -1,    53,   137,   242,    -1,   180,    -1,
     244,   180,    -1,   242,    -1,   245,   242,    -1,   245,   180,
      -1,   245,    -1,   244,    -1,   244,   245,    -1,   140,    -1,
     140,   141,    -1,   247,   246,   141,    -1,   139,    -1,   178,
     139,    -1,    54,   120,   178,   121,   242,    -1,    54,   120,
     178,   121,   242,    64,   242,    -1,    55,   120,   178,   121,
     242,    -1,    56,   120,   178,   121,   242,    -1,    57,   242,
      56,   120,   178,   121,   139,    -1,    58,   120,   249,   249,
     121,   242,    -1,    58,   120,   249,   249,   178,   121,   242,
      -1,    56,   120,   121,   242,    -1,    58,   120,   249,   121,
     242,    -1,    58,   120,   121,   242,    -1,    59,   152,   139,
      -1,    60,   139,    -1,    61,   139,    -1,    62,   139,    -1,
      62,   178,   139,    -1,     5,    -1,   183,   152,   140,   265,
     141,    -1,   183,   152,   140,   141,    -1,   184,   152,   140,
     265,   141,    -1,   184,   152,   140,   141,    -1,   145,   140,
     265,   141,    -1,   145,   140,   141,    -1,   152,   140,   265,
     141,    -1,   152,   140,   141,    -1,   140,   265,   141,    -1,
     140,   141,    -1,   148,   248,    -1,   151,   248,    -1,   151,
     139,    -1,   149,   248,    -1,   150,   248,    -1,   183,   226,
      -1,   183,   230,    -1,   259,   248,    -1,   155,   138,   240,
      -1,   240,    -1,   261,    -1,   262,   127,   261,    -1,   262,
     139,    -1,   263,    -1,   260,    -1,   264,   263,    -1,   264,
     260,    -1,   139,    -1,   264,   139,    -1,   264,    -1,   262,
      -1,   264,   262,    -1,   235,    -1,   235,   137,   179,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   226,   226,   244,   278,   328,   329,   356,   360,   361,
     362,   379,   381,   386,   391,   396,   398,   403,   408,   409,
     414,   416,   418,   420,   422,   423,   424,   427,   428,   429,
     430,   431,   432,   433,   434,   435,   439,   440,   441,   442,
     443,   444,   445,   446,   450,   455,   456,   457,   458,   459,
     460,   461,   462,   466,   467,   468,   469,   473,   474,   475,
     476,   477,   478,   479,   480,   481,   485,   486,   490,   491,
     495,   496,   497,   498,   499,   500,   501,   505,   506,   510,
     511,   512,   513,   517,   518,   519,   523,   524,   525,   529,
     537,   538,   539,   540,   541,   545,   546,   547,   551,   552,
     556,   557,   561,   562,   566,   567,   571,   572,   576,   577,
     581,   582,   583,   587,   588,   589,   590,   591,   592,   593,
     594,   595,   596,   597,   601,   602,   606,   610,   611,   612,
     613,   617,   618,   619,   620,   621,   622,   623,   624,   628,
     629,   630,   631,   632,   633,   634,   635,   636,   637,   641,
     642,   643,   644,   645,   646,   647,   648,   649,   650,   654,
     655,   656,   657,   658,   659,   660,   661,   662,   663,   664,
     665,   669,   670,   674,   675,   676,   677,   678,   679,   680,
     681,   682,   700,   717,   718,   719,   720,   721,   722,   723,
     724,   725,   726,   727,   728,   729,   747,   764,   765,   769,
     770,   774,   775,   776,   777,   778,   782,   783,   784,   788,
     789,   790,   795,   796,   797,   798,   799,   803,   804,   808,
     809,   810,   814,   815,   819,   823,   824,   825,   830,   831,
     832,   833,   834,   835,   836,   837,   838,   839,   840,   841,
     842,   843,   844,   845,   846,   847,   848,   849,   850,   851,
     852,   853,   857,   858,   859,   860,   861,   862,   863,   864,
     865,   866,   867,   868,   869,   870,   871,   872,   873,   874,
     875,   876,   877,   878,   883,   884,   885,   886,   887,   890,
     891,   892,   893,   894,   899,   900,   903,   905,   910,   911,
     916,   917,   928,   932,   934,   935,   937,   938,   962,   977,
     978,   982,   983,   987,   988,   992,   996,   997,  1001,  1003,
    1005,  1007,  1009,  1012,  1014,  1016,  1018,  1020,  1023,  1025,
    1027,  1029,  1031,  1034,  1036,  1038,  1040,  1042,  1047,  1048,
    1049,  1050,  1051,  1052,  1053,  1054,  1058,  1060,  1065,  1067,
    1069,  1071,  1073,  1078,  1079,  1083,  1085,  1086,  1087,  1088,
    1092,  1094,  1099,  1101,  1107,  1109,  1111,  1113,  1115,  1117,
    1119,  1121,  1123,  1125,  1127,  1132,  1134,  1136,  1138,  1140,
    1145,  1146,  1147,  1148,  1149,  1150,  1154,  1155,  1156,  1157,
    1158,  1159,  1205,  1206,  1208,  1210,  1215,  1217,  1219,  1221,
    1223,  1228,  1229,  1232,  1234,  1236,  1242,  1246,  1248,  1250,
    1255,  1256,  1257,  1259,  1264,  1265,  1266,  1267,  1268,  1272,
    1273,  1277,  1278,  1279,  1280,  1284,  1285,  1289,  1290,  1294,
    1295,  1296,  1297,  1298,  1309,  1334,  1335,  1339,  1340,  1344,
    1345,  1349,  1351,  1353,  1369,  1371,  1393,  1395,  1400,  1401,
    1402,  1403,  1404,  1405,  1409,  1411,  1413,  1418,  1419,  1423,
    1424,  1427,  1431,  1432,  1433,  1437,  1441,  1449,  1454,  1455,
    1459,  1460,  1461,  1465,  1466,  1467,  1468,  1470,  1471,  1472,
    1476,  1477,  1478,  1479,  1480,  1484,  1488,  1490,  1495,  1497,
    1522,  1524,  1526,  1528,  1533,  1535,  1539,  1541,  1543,  1545,
    1547,  1553,  1555,  1560,  1565,  1566,  1570,  1572,  1577,  1582,
    1583,  1584,  1585,  1586,  1587,  1591,  1592,  1593,  1597,  1598
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
  "_BOOL", "_COMPLEX", "_IMAGINARY", "RESTRICT", "'*'", "'<'", "'>'",
  "'('", "')'", "'~'", "'$'", "'.'", "'['", "']'", "','", "'&'", "'+'",
  "'-'", "'!'", "'/'", "'%'", "'^'", "'|'", "'?'", "':'", "'='", "';'",
  "'{'", "'}'", "$accept", "guess_type", "real_guess_type", "type",
  "base_strict_type", "strict_type", "class_function_definition_start",
  "constructor_function_definition_start",
  "destructor_function_definition_start",
  "virtual_class_function_definition_start", "identifier",
  "primary_expression", "simple_primary_expression", "postfix_expression",
  "anon_instantiation_expression", "simple_postfix_expression",
  "argument_expression_list", "common_unary_expression",
  "unary_expression", "simple_unary_expression", "unary_operator",
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
  "storage_class_specifier", "ext_decl", "_attrib", "attribute_word",
  "attribute", "attribs_list", "attrib", "ext_storage", "type_qualifier",
  "type_specifier", "strict_type_specifier",
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
  "type_unit", 0
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
     365,   366,   367,   368,   369,   370,   371,    42,    60,    62,
      40,    41,   126,    36,    46,    91,    93,    44,    38,    43,
      45,    33,    47,    37,    94,   124,    63,    58,    61,    59,
     123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint16 yyr1[] =
{
       0,   142,   143,   143,   144,   145,   145,   146,   147,   147,
     147,   148,   148,   149,   150,   151,   151,   152,   153,   153,
     154,   154,   154,   154,   154,   154,   154,   154,   154,   154,
     154,   154,   154,   154,   154,   154,   155,   155,   155,   155,
     155,   155,   155,   155,   156,   157,   157,   157,   157,   157,
     157,   157,   157,   158,   158,   158,   158,   159,   159,   159,
     159,   159,   159,   159,   159,   159,   160,   160,   161,   161,
     162,   162,   162,   162,   162,   162,   162,   163,   163,   164,
     164,   164,   164,   165,   165,   165,   166,   166,   166,   167,
     168,   168,   168,   168,   168,   169,   169,   169,   170,   170,
     171,   171,   172,   172,   173,   173,   174,   174,   175,   175,
     176,   176,   176,   177,   177,   177,   177,   177,   177,   177,
     177,   177,   177,   177,   178,   178,   179,   180,   180,   180,
     180,   181,   181,   181,   181,   181,   181,   181,   181,   182,
     182,   182,   182,   182,   182,   182,   182,   182,   182,   183,
     183,   183,   183,   183,   183,   183,   183,   183,   183,   184,
     184,   184,   184,   184,   184,   184,   184,   184,   184,   184,
     184,   185,   185,   186,   186,   186,   186,   186,   186,   186,
     186,   186,   186,   187,   187,   187,   187,   187,   187,   187,
     187,   187,   187,   187,   187,   187,   187,   188,   188,   189,
     189,   190,   190,   190,   190,   190,   191,   191,   191,   192,
     192,   192,   193,   193,   193,   193,   193,   194,   194,   195,
     195,   195,   196,   196,   197,   198,   198,   198,   199,   199,
     199,   199,   199,   199,   199,   199,   199,   199,   199,   199,
     199,   199,   199,   199,   199,   199,   199,   199,   199,   199,
     199,   199,   200,   200,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   200,   200,   200,   200,   200,   200,   200,
     200,   200,   200,   200,   201,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   202,   202,   202,   202,   203,   203,
     204,   204,   205,   206,   206,   206,   206,   206,   206,   207,
     207,   208,   208,   209,   209,   210,   211,   211,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   212,   212,
     212,   212,   212,   212,   212,   212,   212,   212,   213,   213,
     213,   213,   213,   213,   213,   213,   214,   214,   215,   215,
     215,   215,   215,   216,   216,   217,   217,   217,   217,   217,
     218,   218,   219,   219,   220,   220,   220,   220,   220,   220,
     220,   220,   220,   220,   220,   221,   221,   221,   221,   221,
     222,   222,   222,   222,   222,   222,   223,   223,   223,   223,
     223,   223,   224,   224,   224,   224,   225,   225,   225,   225,
     225,   226,   226,   226,   226,   226,   227,   228,   228,   228,
     229,   229,   229,   229,   230,   230,   230,   230,   230,   231,
     231,   232,   232,   232,   232,   233,   233,   234,   234,   235,
     235,   235,   235,   235,   235,   236,   236,   237,   237,   238,
     238,   239,   239,   239,   240,   240,   241,   241,   242,   242,
     242,   242,   242,   242,   243,   243,   243,   244,   244,   245,
     245,   245,   246,   246,   246,   247,   248,   248,   249,   249,
     250,   250,   250,   251,   251,   251,   251,   251,   251,   251,
     252,   252,   252,   252,   252,   253,   254,   254,   255,   255,
     256,   256,   256,   256,   257,   257,   258,   258,   258,   258,
     258,   259,   259,   260,   261,   261,   262,   262,   263,   264,
     264,   264,   264,   264,   264,   265,   265,   265,   266,   266
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     2,     2,     1,     2,     1,     1,     4,
       4,     2,     1,     3,     4,     3,     2,     1,     1,     3,
       1,     1,     1,     1,     2,     4,     2,     6,     5,     6,
       5,     7,     6,     7,     6,     1,     1,     4,     3,     4,
       3,     3,     2,     2,     1,     1,     4,     3,     4,     3,
       3,     2,     2,     1,     1,     3,     3,     2,     2,     2,
       4,     2,     4,     4,     2,     4,     1,     1,     1,     1,
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
       1,     1,     1,     1,     1,     1,     1,     1,     4,     1,
       2,     3,     6,     5,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     4,     4,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       4,     4,     4,     1,     5,     4,     4,     3,     5,     6,
       5,     5,     4,     6,     2,     2,     3,     3,     1,     2,
       1,     2,     1,     1,     1,     3,     3,     3,     3,     1,
       3,     1,     1,     1,     2,     3,     1,     3,     9,     9,
       7,     7,     5,    10,    10,     8,     8,     6,     8,     8,
       6,     6,     4,     9,     9,     7,     7,     5,     3,     2,
       2,     2,     1,     2,     1,     1,     1,     3,     1,     2,
       2,     3,     5,     2,     2,     4,     5,     7,     7,     5,
       1,     3,     1,     3,     3,     2,     3,     3,     3,     4,
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

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    17,     7,   201,   202,   203,   204,   205,   229,   230,
     231,   232,   233,   235,   238,   239,   236,   237,   225,   226,
     228,   234,   301,   302,     0,   424,   249,   206,   207,   209,
     250,   251,   240,     0,     0,   210,   211,   242,   241,   165,
     172,   245,     8,     5,     0,   171,   423,   159,   224,     0,
     208,   227,   161,   163,   167,   243,     0,   244,   169,   508,
       0,     0,   344,   343,     0,     0,     0,     4,     2,     3,
       6,   411,     0,     0,   421,   166,   386,   160,   224,   162,
     164,   168,   170,   371,   420,   419,   401,     0,   400,   382,
     370,     0,     0,     8,   285,   284,     0,     0,     1,   352,
       0,   350,     0,     0,    35,    22,   475,     0,     0,     0,
       0,     0,    76,     0,     0,     0,    71,     0,    74,     0,
      70,    72,    73,    75,     0,    20,    36,    18,    67,    66,
      77,     0,    79,    83,    86,    90,     0,    95,    98,   100,
     102,   104,   106,   108,   110,     0,    23,    21,     0,     0,
     245,    20,    77,   292,   290,     0,   294,   293,   299,     0,
     409,   412,   413,   361,     0,     0,     0,     0,   415,   417,
     355,     0,   126,     0,     0,   386,     0,   422,     0,   374,
     403,   402,   373,     0,     0,   385,   396,     0,   399,     0,
       0,     0,     0,   372,   383,     0,     0,     0,     0,     0,
     335,   277,     0,     0,     0,     0,    20,     0,     0,   224,
       0,   306,     0,   334,   303,     0,    12,   391,     0,     0,
      21,   332,     0,     0,     0,   287,   286,   509,     0,     0,
     345,     0,     0,     0,    45,    69,    68,    61,     0,    57,
      58,     0,     0,     0,     0,     0,     0,    64,    26,   124,
       0,   427,   131,   133,   137,   135,     0,    24,     0,     0,
       0,    42,    43,     0,     0,     0,   114,   115,   116,   117,
     118,   119,   120,   121,   122,   123,   113,     0,    59,     0,
       0,     0,     0,     0,     0,     0,    91,     0,     0,    89,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   246,
     247,   248,     0,     0,   224,   291,   370,     0,    10,     9,
       0,   410,   414,   354,   387,   362,     0,   357,   356,     0,
     375,   384,   363,     0,   358,     0,     0,   389,     0,     0,
     397,   398,     0,   212,   213,   216,   215,   214,     0,   217,
     219,     0,   253,   254,   255,   256,   257,   259,   262,   263,
     260,   261,   252,   258,     0,   273,   264,     0,     0,   266,
     265,   269,   179,     0,   173,   175,   177,   267,     0,   268,
       0,    16,    71,     0,    20,     0,   455,     0,   486,   489,
     490,   488,   487,     0,     0,     0,   329,   386,   224,     0,
     336,   404,    11,   338,     0,   393,     0,   275,   304,     0,
     333,     0,   392,   331,   330,     0,   276,     0,   282,     0,
       0,     0,   353,   351,     0,   349,     0,   346,   143,    20,
       0,   429,   139,   141,   147,   145,     0,     0,    51,    52,
       0,     0,     0,     0,     0,   224,   377,     0,   376,   193,
       0,   183,   185,   187,   189,   191,     0,     0,     0,     0,
       0,    19,     0,     0,   132,   134,   138,   136,   428,     0,
       0,   503,     0,   481,    67,   435,   434,     0,   149,   151,
     153,   157,   155,   495,    44,     0,   500,   496,   506,   499,
       0,     0,   483,     0,    41,    38,    54,     0,    53,    40,
       0,   112,   111,    80,    81,    82,    84,    85,    87,    88,
      93,    94,    92,    96,    97,    99,   101,   103,   105,   107,
       0,   290,   296,   295,   373,   298,   297,   300,   416,   418,
     364,   360,   359,   390,   388,   426,   223,     0,     0,     0,
     220,   344,   343,     0,     0,     0,     0,   180,   174,   176,
     178,     0,   284,     0,    15,   224,     0,   456,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     458,    20,     0,   447,     0,   449,   438,     0,     0,     0,
     439,   440,   441,   442,   443,     0,   305,    13,   340,     0,
     406,     0,     0,   328,     0,   339,     0,   405,   394,   307,
     395,   278,   274,   280,     0,   281,     0,     0,     0,    60,
     144,   140,   142,   148,   146,   430,    62,    50,    47,     0,
      49,     0,   366,     0,     0,     0,   380,   379,     0,     0,
     378,     0,     0,   194,   184,   186,   188,   190,   192,     0,
       0,     0,     0,     0,    63,    65,   125,    78,    25,   485,
       0,     0,   386,   150,   152,   154,   158,   156,   491,   492,
     493,     0,   498,   504,   502,   507,   501,   480,   482,    39,
       0,    37,     0,   291,     0,   222,   221,     0,     0,     0,
       0,     0,     0,   322,     0,     0,     0,     0,   287,   286,
      14,     0,     0,     0,     0,     0,     0,     0,     0,   471,
     472,   473,     0,     0,     0,   459,   127,   386,     0,   197,
     199,   448,     0,   451,   450,   457,   129,   479,     0,   407,
       0,   337,   404,     0,   341,   408,   283,   279,   348,   347,
      48,    46,   365,   367,    28,   381,   368,     0,     0,     0,
       0,     0,     0,    30,     0,     0,     0,   484,   494,   497,
      56,    55,   109,   218,   270,   271,   272,   181,     0,     0,
       0,     0,     0,   312,     0,     0,   327,     0,     0,   446,
       0,     0,     0,     0,     0,     0,     0,   470,   474,     0,
     444,     0,     0,   128,     0,   478,   406,     0,     0,   405,
       0,   369,    27,   195,    32,     0,     0,    29,    34,     0,
       0,   320,     0,   321,   182,     0,     0,     0,     0,     0,
       0,   317,   445,     0,     0,   467,     0,     0,   469,     0,
       0,     0,   477,     0,   198,     0,   431,   200,   407,   408,
     342,   196,    31,    33,     0,     0,     0,   310,     0,   311,
       0,   325,     0,   326,     0,     0,   460,   462,   463,     0,
     468,     0,     0,   130,   476,   436,     0,   318,   319,     0,
       0,     0,     0,     0,   315,     0,   316,     0,     0,   465,
       0,     0,   432,   308,   309,   323,   324,     0,     0,   461,
     464,   466,   433,   437,   313,   314
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    39,    40,   124,    42,    43,   202,   203,   204,   205,
     125,   126,   127,   128,   465,   235,   487,   129,   152,   237,
     131,   132,   133,   134,   135,   136,   137,   138,   139,   140,
     141,   142,   143,   144,   249,   277,   562,   173,   703,   251,
     421,   467,   208,    46,   363,   440,   698,   699,    47,    48,
      49,   339,   340,   341,    50,    51,    52,    53,   443,    54,
      55,   155,   156,   157,   158,   159,    56,   210,   211,   212,
     213,   214,   389,   390,    57,    58,   100,   101,    83,   436,
     165,   437,   166,   215,   216,    87,   217,    89,   393,   161,
     218,   167,   168,   169,   191,   256,   426,   817,   473,   846,
     565,   566,   567,   568,   569,   377,   570,   571,   572,   573,
     574,   146,   575,   219,   147,   474,   221,   475,   476,   477,
     478,   479,   480,   481,    60
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -779
static const yytype_int16 yypact[] =
{
    8508,  -779,  -779,  -779,  -779,  -779,  -779,  -779,  -779,  -779,
    -779,  -779,  -779,  -779,  -779,  -779,  -779,  -779,  -779,  -779,
    -779,  -779,  -779,  -779,    47,  -779,  -779,  -779,  -779,  -779,
    -779,  -779,  -779,    68,    85,  -779,  -779,  -779,  -779,  -779,
    -779,  -779,   -65,  -779,   119,  6980,  -779,  -779,  -779,   101,
    -779,  -779,  -779,  -779,  -779,  -779,    30,  -779,  -779,    91,
     167,   227,   130,   181,  6736,    43,  6063,  -779,  -779,  -779,
    -779,   832,  7081,  1599,   883,  -779,    29,  -779,   244,  -779,
    -779,  -779,  -779,   419,  -779,   678,   455,  7954,  -779,  -779,
     810,   221,  3461,   -80,  -779,   213,    61,  6736,  -779,   217,
     -41,  -779,   227,   227,  -779,  -779,  -779,  6769,  6822,  6822,
    8594,  6736,  -779,  8594,  6736,  6876,  -779,  6194,  -779,   367,
    -779,  -779,  -779,  -779,   243,    31,  -779,  -779,   373,  -779,
    1056,  6736,  -779,   -63,   165,   238,  6736,   511,   422,   248,
     252,   280,   406,    -8,  -779,   325,  -779,  -779,   368,    11,
     243,   141,  -779,   238,  5945,   361,  -779,  -779,  -779,   113,
    -779,   832,  -779,  -779,   978,   371,   645,   382,   347,  -779,
    -779,   146,  -779,   384,   883,  -779,   214,   678,   589,   419,
     455,  -779,   810,  8048,  1983,  -779,  -779,  4901,  -779,   324,
     407,   170,    19,   419,  -779,   571,  8680,  8236,  6543,  8594,
    -779,  -779,   397,   397,   397,   362,    18,   275,  5721,   214,
    3584,  -779,   -54,  -779,  -779,   455,  -779,  -779,   589,   412,
     426,  -779,  5409,  3707,  3830,   437,   443,  -779,  6736,   227,
    -779,    54,   291,  6325,  -779,   699,  -779,  -779,  6596,  -779,
    -779,    29,  7277,  8766,  7375,  8766,  6325,  -779,  -779,  -779,
     299,  7762,  -779,  -779,  -779,  -779,   466,   467,  2625,  2766,
     227,  -779,  -779,  5171,   227,  6736,  -779,  -779,  -779,  -779,
    -779,  -779,  -779,  -779,  -779,  -779,  -779,  5244,  -779,  6736,
    6736,  6736,  6736,  6736,  6736,  6736,   238,  6736,  6736,  -779,
    6736,  6736,  6736,  6736,  6736,  6736,  6736,  6736,  6736,  -779,
    -779,  -779,  6063,  7179,   341,   463,   475,  6063,  -779,  -779,
    6063,  -779,  -779,  -779,  -779,  -779,  8422,  -779,  -779,   589,
     419,  -779,  -779,   502,  -779,   149,   506,  -779,   173,   509,
    -779,  -779,   227,  -779,  -779,  -779,  -779,  -779,   518,   521,
    -779,   364,  -779,  -779,  -779,  -779,  -779,  -779,  -779,  -779,
    -779,  -779,  -779,  -779,    43,  -779,  -779,   523,   524,  -779,
    -779,  -779,   531,  5608,  -779,  -779,  -779,  -779,   899,  -779,
    8236,  -779,   832,  6456,   497,  8329,   516,  5008,  -779,  -779,
    -779,  -779,  -779,  5244,   718,  6736,  -779,   317,   214,   -46,
    -779,   455,  -779,   177,   589,  -779,    19,  -779,  -779,   713,
    -779,    19,  -779,  -779,  -779,  3953,  -779,  4076,  -779,  4199,
    5409,  4322,  -779,  -779,  5409,  -779,  5409,  -779,  -779,    18,
     534,  7762,  -779,  -779,  -779,  -779,   546,   227,  -779,  -779,
    5205,   227,  6736,  7860,  6736,   -38,   532,   550,   551,   559,
    7571,  -779,  -779,  -779,  -779,  -779,  6736,   555,  7669,   562,
     563,  -779,  6736,   227,  -779,  -779,  -779,  -779,  -779,  6736,
     367,  -779,  2907,  -779,   541,  -779,  -779,  8236,  -779,  -779,
    -779,  -779,  -779,  -779,  -779,   397,  -779,  -779,    36,  -779,
    3048,   545,  -779,   548,  -779,  -779,  -779,   351,  -779,  -779,
     323,  -779,  -779,  -779,  -779,  -779,   -63,   -63,   165,   165,
     238,   238,   238,   511,   511,   422,   248,   252,   280,   406,
      25,  7473,  -779,  -779,   475,  -779,  -779,  -779,  -779,  -779,
    -779,  -779,  -779,  -779,  -779,  -779,  -779,  6736,   566,   529,
    -779,  -779,  -779,  6736,    43,  6063,    38,   -56,  -779,  -779,
    -779,    33,  -779,    43,  -779,   214,   569,  -779,  6736,   554,
     573,   576,   578,  5098,   585,   227,   583,   587,  1901,   227,
    -779,    13,   191,  -779,  5833,  -779,  -779,  2202,  2343,   574,
    -779,  -779,  -779,  -779,  -779,   588,  -779,  -779,  -779,  3189,
     455,    19,   514,  -779,  6736,  -779,    19,   455,  -779,  -779,
    -779,  -779,  -779,  -779,  4445,  -779,  4568,  4691,  4814,  -779,
    -779,  -779,  -779,  -779,  -779,  -779,  -779,  -779,  -779,   352,
    -779,   337,  -779,   611,   612,   616,   532,   551,  8142,  6736,
     532,  6063,  6736,   620,  -779,  -779,  -779,  -779,  -779,   619,
     621,  6736,  6736,   623,  -779,  -779,  -779,  -779,  -779,  -779,
     604,  5244,   227,  -779,  -779,  -779,  -779,  -779,  -779,  -779,
    -779,  5244,  -779,  -779,  -779,    36,  -779,  -779,  -779,  -779,
    5244,  -779,  6736,  -779,   359,  -779,  -779,   628,   630,    24,
     -39,   397,   397,  -779,  6063,   204,   354,   624,  -779,  -779,
    -779,   622,  5098,  6736,  6736,  6629,   707,  5462,   631,  -779,
    -779,  -779,   196,   633,  5098,  -779,  -779,    46,   251,  -779,
     402,  -779,  2484,  -779,  -779,  -779,  -779,  -779,   632,   455,
     214,  -779,   644,   589,   638,   455,  -779,  -779,  -779,  -779,
    -779,  -779,  -779,  -779,  -779,   532,  -779,   658,   655,   174,
     657,  6063,  6736,  -779,   664,   668,  6736,  -779,  -779,  -779,
    -779,  -779,  -779,  -779,  -779,  -779,  -779,  -779,   -47,   -30,
     266,   397,   397,  -779,   397,   397,  -779,   374,  5098,  -779,
     369,   415,  5098,   435,   675,  5098,  5496,  -779,  -779,  6736,
    -779,  3330,   883,  -779,  5278,  -779,   644,    19,    19,   644,
    6736,  -779,  -779,  -779,  -779,   343,   670,  -779,  -779,   672,
     397,  -779,   397,  -779,  -779,   -27,   -18,    -3,   -12,   397,
     397,  -779,  -779,  5098,  5098,  -779,  5098,  6736,  -779,  5098,
    6682,   661,  -779,   660,  -779,  5278,  -779,  -779,   644,   644,
    -779,  -779,  -779,  -779,   679,   680,   397,  -779,   397,  -779,
     397,  -779,   397,  -779,     7,   121,   738,  -779,  -779,   439,
    -779,  5098,   442,  -779,  -779,  -779,   185,  -779,  -779,   681,
     684,   691,   693,   397,  -779,   397,  -779,  5098,   701,  -779,
    5098,  4867,  -779,  -779,  -779,  -779,  -779,   703,   704,  -779,
    -779,  -779,  -779,  -779,  -779,  -779
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -779,   -42,  -779,   695,   755,    35,  -779,  -779,  -779,  -779,
       0,  -779,   161,  1399,  -258,  -779,   416,   353,    52,   732,
    -779,   -68,   236,   329,    49,  -779,   336,   558,   556,   553,
     567,   568,  -779,  1406,   -24,  -779,   249,  1309,  -364,  -779,
    -779,  -342,    55,  -779,  -779,   607,  -779,    94,   263,   798,
    -779,  -779,  -315,  -779,   476,  -779,  1171,  1441,  -179,  1320,
    -148,  -779,   309,   310,   561,  -515,  -186,  -105,   474,  -779,
    -779,  -142,  -779,   293,  -144,  1402,   557,   651,   -49,  -423,
     -17,  -213,   -44,   480,  -190,  -779,   945,   -48,   414,  -779,
    1073,   -85,  -779,     6,  -779,  -779,   641,  -778,  -375,  -779,
    -156,  -779,  -779,   328,  -779,  -779,  1372,  -640,  -779,  -779,
    -779,  -108,  -779,  -779,   -67,  -779,  -779,  -779,   411,   245,
     417,   418,  -779,  -255,  -779
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -506
static const yytype_int16 yytable[] =
{
      44,    85,   190,    75,   483,   486,    59,   371,   576,   297,
     368,   257,   616,   563,     1,   620,     1,   366,   392,   491,
     670,     1,     1,   790,    63,   220,   530,     1,    84,   179,
     177,   447,     1,     1,     1,   564,     1,   845,    66,   792,
     145,   193,   194,   826,    70,    76,     1,   766,   367,     1,
       1,   828,   369,    66,   279,    45,    95,   832,     2,    62,
     222,    99,   674,   278,     1,   149,   151,   830,   398,   280,
     281,     2,   164,   399,   175,     2,    70,   853,   175,    71,
     747,   582,   433,   873,   675,   400,   229,   189,   310,     2,
     175,    94,   206,   583,   791,   367,   226,   367,   323,   369,
     230,   369,    99,    99,    27,    28,   729,   671,   672,    29,
     241,   793,    75,   241,   827,   153,   130,   405,   407,   409,
      67,   154,     1,   829,   308,    70,   810,    45,   298,   833,
     194,   225,   301,   320,   321,    68,    69,   305,   831,   174,
      35,    36,    45,   220,     1,   746,    68,    69,   854,    70,
     694,    70,   452,   259,   241,   220,   220,   220,   259,   750,
     239,   240,   662,   651,    70,   242,    75,    98,   244,   130,
      92,   259,   486,   676,   175,   652,   175,   368,   175,   673,
     544,   229,   175,    44,   540,   286,   771,    61,    64,    70,
     855,   418,   175,   414,   725,   415,   362,    76,   374,   241,
      75,   224,    75,   701,   418,    65,    70,   640,   387,   175,
     206,   493,   494,   495,   666,   367,   785,     1,   175,   369,
     613,    91,   206,   206,   206,   564,   564,   629,    97,    99,
       1,   361,   309,   419,   458,   633,    68,    69,    45,   488,
     310,    70,   241,   439,   241,   439,   419,     1,   284,   285,
     130,   453,   370,   492,   375,   179,    29,   193,    68,    69,
     484,   626,   856,   398,   489,   398,   738,   398,   234,   626,
     102,   321,   317,   751,   752,   521,   234,   648,   361,   302,
     361,   259,   260,   261,   262,   420,   258,    35,    36,   258,
     130,   331,   367,   783,   282,   283,   369,   332,   449,   523,
     367,   310,   419,    44,   369,   594,   596,   419,    77,   597,
     151,   598,   861,   258,   584,   130,    44,   130,   452,   175,
       1,   103,   519,   452,   708,    67,   862,     1,    75,   130,
     695,    71,   525,    75,   174,   768,   500,   501,   220,   502,
     220,   195,   220,   220,   220,   753,   541,   220,   614,   220,
     130,   153,   638,   223,   532,   228,   153,   511,    45,   153,
     564,    71,   511,   537,    72,   154,   250,   333,   542,    73,
      76,    45,   106,   374,    70,   241,   293,   561,   772,   600,
     260,   261,   262,   258,   175,   794,   294,    70,   175,   531,
     773,   637,   334,   310,   175,   263,   175,   686,   361,   264,
     265,   175,   740,    94,   605,   206,   488,   206,   335,   206,
     206,   206,   704,   383,   206,   295,   206,    77,   229,    70,
     451,   241,   296,   754,   755,   130,   452,   607,   636,   130,
     416,   610,   417,    44,    68,    69,   291,   292,   336,   337,
     623,    68,    69,   799,   800,  -425,   299,   250,   623,   661,
     452,  -425,   398,    70,   398,   398,   398,   579,    71,   364,
     236,   303,   821,   721,   452,   320,    73,   642,   236,    75,
     310,    77,   659,   720,   316,   361,    27,    28,   660,   660,
     743,    29,   130,   361,   130,   528,   452,   250,    45,   300,
     803,   529,   313,   263,   663,   756,   452,   264,   265,   307,
       1,   381,   376,   315,   130,    77,   441,    77,   441,   667,
     318,   241,    35,    36,   490,   801,   813,     1,   496,   497,
     700,   468,   468,   287,   288,    86,   759,   220,   330,   220,
     220,   220,   333,   727,   669,   151,   804,   376,   770,   183,
     774,   677,   452,   679,   184,   175,   704,   510,   260,   261,
     262,   403,    86,   561,    86,   688,   806,   334,   180,   693,
     858,    70,   452,   860,   697,   404,   452,   561,   561,   452,
      86,  -386,  -386,   335,   333,   186,  -386,   410,   678,   130,
     187,   175,   175,   411,   153,   130,   175,   459,    27,    28,
     154,   460,     1,    29,   206,   303,   206,   206,   206,   334,
      73,  -289,   802,   336,   337,   130,   805,  -386,  -386,   808,
     130,   512,   513,   498,   499,   335,   515,   516,    44,   130,
     130,   151,   250,   520,    35,    36,   538,   503,   504,   289,
     290,    71,   522,    77,   174,   524,   741,   259,    77,   526,
     468,   527,    70,   533,   534,   336,   337,   836,   837,   535,
     838,   385,   618,   840,    86,   599,   180,   547,    86,   231,
     232,   263,    86,    27,    28,   264,   265,   606,    29,    70,
     153,   433,   180,    45,   151,   619,   154,   621,    86,   641,
     631,   611,   561,   634,   635,   859,   657,   665,   391,   658,
     680,   682,   338,   683,   561,    41,   684,    70,   685,    35,
      36,   869,   561,   624,   871,   687,   427,   428,   429,   174,
     175,   624,   130,   175,   104,   705,     1,   105,   106,    27,
      28,     1,   689,   153,    29,   468,   690,   706,   700,   154,
     643,   151,   722,   723,   130,   130,   130,   130,   731,   130,
      41,     2,   724,   468,   732,   737,   130,   733,   736,   744,
     816,   745,    27,    28,   130,    35,    36,    29,   561,   758,
     148,   150,   561,   764,   757,   561,   314,    41,   171,   187,
     767,   769,   175,   775,    77,   780,   664,   175,   175,   781,
     153,   782,    41,   784,   110,   111,   154,   150,    35,    36,
     787,   816,    27,    28,   788,   807,   822,    29,   823,    86,
     843,   844,   857,   561,   561,    41,   561,   692,    41,   561,
     130,    93,   150,     1,   130,   113,   114,   130,   130,   430,
     847,   848,   863,   431,   432,   864,   130,   643,    35,    36,
     468,   468,   865,   238,   866,    71,   119,   816,   174,   577,
     870,   561,   468,    78,   874,   875,   609,   247,   507,    41,
     506,   505,   448,    86,    96,   130,   130,   561,   130,   130,
     561,   130,   130,   508,    86,   509,   814,   130,   580,   585,
      78,   517,   176,   589,   587,   711,    18,    19,    41,   325,
     413,   649,   328,   185,    27,    28,     1,   450,   192,    29,
     209,   654,    41,   130,    41,   702,   739,   655,   656,     0,
       0,     0,     1,    41,     0,   150,    27,    28,     0,   130,
       0,    29,   130,   130,     0,     0,     0,   150,   150,   150,
      35,    36,     0,     0,     0,     0,     0,     2,   150,     0,
      72,     0,   760,   761,   763,    73,     0,    41,     0,    41,
       0,   150,    35,    36,     0,     0,    41,   391,     0,    71,
       0,     0,   304,   150,   150,     0,     0,    27,    28,     0,
       0,     0,    29,     0,   185,   468,     0,     0,     0,     0,
       0,     0,   176,    27,    28,   185,   192,     0,    29,    67,
     192,     1,     0,     0,     0,     0,     0,     0,     0,     0,
      88,     0,     0,    35,    36,   209,   176,   150,    41,     0,
      71,     0,   150,   174,     0,   150,   388,     0,   209,    35,
      36,    41,     0,     0,     0,     0,   401,    88,     0,    88,
     209,   209,   209,   181,     0,   180,     0,     0,     0,     0,
       0,     0,     0,     0,   468,    88,     0,     0,     0,     0,
     435,     0,   435,     0,    86,     0,     0,     0,     0,   304,
       0,     0,  -386,  -386,     0,     0,   839,  -386,     0,   842,
       0,   709,   712,     0,     0,    41,   715,     0,   150,     0,
      41,     0,   150,     0,   266,   267,   268,   269,   270,   271,
     272,   273,   274,   275,     0,     0,     0,     0,  -386,  -386,
       0,     0,     0,     0,     0,    68,    69,     0,  -386,  -386,
     150,   304,   150,  -386,   150,   150,   150,     0,     0,   150,
       0,   150,     0,     0,     0,     0,    41,   192,    90,    88,
       0,   181,     0,    88,     0,     0,     0,    88,    41,     0,
       0,     0,     0,     0,     0,     0,     0,   181,     0,     0,
       0,     0,     0,    88,   162,    90,     0,   178,     0,     0,
       0,   182,     0,     0,   395,     0,     0,   150,     0,     0,
       0,   304,    41,   402,     0,     0,   543,     0,   209,     0,
       0,   545,     0,     0,     0,   150,     0,     0,     0,     0,
       0,     0,   176,     0,     0,     0,     0,     0,     0,     0,
     776,     0,   586,   779,   276,     0,     0,     0,     0,     0,
       0,     0,     0,   209,     0,   209,    41,   209,   209,   209,
       0,     0,   209,     0,   209,     0,    79,     0,     0,   304,
       0,     0,     0,     0,     0,     0,     0,   306,     0,   668,
     150,   435,     0,     0,   312,     0,     0,     0,   435,     0,
       0,     0,   160,     0,     0,     0,   435,   178,     0,   319,
       0,     0,    86,     0,     0,     0,     0,   818,   819,    41,
       0,     0,   150,   150,    88,   388,     0,     0,     0,     0,
       0,   178,     0,     0,   150,     0,     0,     0,     0,     0,
       0,   394,   396,     0,     0,     0,     0,     0,   252,   150,
       0,   150,   150,   150,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   304,
       0,     0,     0,    41,     0,   438,   150,   438,    88,     0,
       0,     0,     0,     0,   306,    79,     0,     0,     0,    88,
       0,     0,   311,   395,     0,     0,     0,     0,     0,   402,
       0,   588,     0,     0,     0,     0,   590,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   545,     0,     0,    81,     0,   365,     0,   150,
       0,     0,     0,     0,     0,     0,   306,   514,     0,    79,
     710,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   209,     0,   209,   209,   209,   150,     0,     0,
       0,     0,     0,     0,   422,     0,   227,     0,     0,     0,
       0,     0,     0,    79,   442,    79,   442,   422,     0,     0,
     243,     0,   454,   245,     0,     0,   150,     0,     0,   469,
     469,     0,     0,     0,     0,     0,   306,   254,     0,     0,
       0,     0,     0,     0,     0,   162,   178,    82,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   178,     0,     0,
       0,   581,     0,     0,     0,     0,   150,     0,     0,     0,
       0,     0,     0,     0,    81,     0,     0,     0,     0,   172,
       0,     0,     0,     0,     0,     0,    80,     0,     0,     0,
     181,   207,     0,   326,   306,     0,   329,     0,   185,     0,
       0,     0,     0,   172,     0,     0,   438,     0,   617,    88,
       0,   778,     0,   438,     0,     0,     0,   172,     0,   255,
     172,   438,     0,     0,     0,     0,   588,     0,    81,     0,
       0,   590,     0,     0,   539,     0,     0,   412,     0,     0,
     394,    79,     0,   160,   252,     0,    79,     0,   469,     0,
       0,     0,     0,   424,     0,     0,    82,     0,   253,     0,
       0,     0,    81,   444,    81,   444,   424,     0,     0,     0,
     176,   456,     0,     0,   378,   379,   380,   382,   471,   471,
       0,     0,     0,     0,   306,     0,     0,     0,     0,     0,
     172,     0,   601,   172,     0,    80,     0,     0,     0,     0,
     104,     0,     1,   105,   106,   107,     0,   108,   109,   207,
      82,   625,     0,     0,     0,     0,     0,     0,   319,   625,
       0,   207,   207,   207,     0,     0,     0,     2,     0,     0,
       0,     0,     0,   469,   172,   425,     0,   178,   644,     0,
       0,     0,     0,     0,    82,   445,    82,   445,   425,    80,
       0,   469,     0,   457,     0,   713,     0,   464,   464,     0,
     472,   472,     0,     0,   466,   466,     0,     0,     0,     0,
     110,   111,   112,     0,   423,     0,     0,     0,     0,     0,
       0,     0,    79,    80,     0,    80,     0,   423,     0,     0,
      81,     0,   455,   254,   578,    81,     0,   471,     0,   470,
     470,   113,   114,     0,     0,     0,     0,     0,   115,     0,
       0,     0,     0,     0,     0,     0,   116,    88,     0,   117,
       0,   118,   119,     0,     0,   170,     0,   120,   121,   122,
     123,     0,     0,     0,     0,   644,     0,     0,   469,   469,
       0,   603,     0,   615,     0,     0,     0,     0,     0,     0,
     469,     0,     0,     0,     0,   630,     0,     0,     0,     0,
     627,     0,     0,     0,     0,     0,     0,     0,   627,     0,
       0,     0,    82,     0,     0,   255,     0,    82,     0,   472,
       0,     0,   471,   777,     0,     0,     0,   646,     0,   466,
       0,   172,     0,     0,     0,     0,     0,     0,   207,     0,
     471,     0,     0,     0,   207,     0,   207,     0,   207,   207,
     207,    80,     0,   207,   253,   207,    80,     0,   470,     0,
       0,     0,     0,   604,     0,     0,     0,     0,     0,     0,
       0,    81,     0,     0,     0,     0,     0,     0,     0,     0,
     172,     0,   628,     0,     0,   178,     0,   650,     0,     0,
     628,     0,   172,     0,     0,     0,     0,   681,     0,     0,
       0,   464,   602,     0,   472,     0,     0,     0,   466,   647,
       0,     0,     0,   469,     0,     0,     0,     0,     0,   464,
       0,     0,   472,     0,   646,     0,   466,   471,   471,     0,
       0,     0,     0,   714,     0,     0,     0,     0,     0,   471,
       0,     0,   104,   470,     1,   105,   106,   107,   645,   108,
     109,     0,     0,    82,     0,     0,     0,     0,     0,     0,
       0,   470,     0,     0,     0,     0,     0,     0,   728,     2,
       0,   730,     0,     0,     0,     0,     0,     0,     0,     0,
     734,   735,   469,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    80,     0,   172,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   647,     0,     0,   472,
     472,     0,   110,   111,   112,     0,     0,     0,   464,     0,
       0,   472,     0,     0,   104,   466,     1,   105,   106,   107,
     172,   108,   109,   207,     0,   207,   207,   207,     0,     0,
       0,     0,     0,   113,   114,   645,     0,     0,   470,   470,
     115,     2,     0,     0,     0,     0,     0,     0,   116,     0,
     470,   117,   471,   118,   119,   172,     0,     0,   172,   120,
     121,   122,   123,     0,     0,     0,     0,   172,   172,     0,
     691,   786,     0,   748,   749,   789,     0,   466,     0,     0,
     464,     0,     0,     0,   110,   111,   112,   466,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   742,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   811,     0,
       0,     0,     0,     0,     0,   113,   114,     0,     0,   820,
       0,   471,   115,     0,     0,     0,     0,     0,     0,     0,
     116,     0,     0,   117,   472,   118,   119,     0,     0,   324,
       0,   120,   121,   122,   123,     0,     0,     0,     0,     0,
       0,     0,     0,   795,   796,     0,   797,   798,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   172,     0,
       0,     0,   172,   470,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   824,     0,   825,     0,     0,     0,     0,     0,
     464,   834,   835,   472,     0,   172,     0,   466,     0,     0,
       0,     0,     0,     0,     0,     0,   172,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   849,     0,
     850,     0,   851,   104,   852,     1,   105,   106,   107,     0,
     108,   109,   470,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   867,     0,   868,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,   548,   549,   550,   551,   552,   553,
     554,   555,   556,   557,   558,     0,     0,     0,    26,     0,
       0,     0,     0,   110,   111,   112,    27,    28,     0,   559,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   113,   114,     0,     0,     0,     0,
       0,   115,    35,    36,    37,    38,     0,     0,     0,   116,
       0,     0,   117,     0,   118,   119,     0,     0,     0,     0,
     120,   121,   122,   123,     0,     0,     0,     0,     0,     0,
       0,   560,   376,  -453,   104,     0,     1,   105,   106,   107,
       0,   108,   109,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,   548,   549,   550,   551,   552,
     553,   554,   555,   556,   557,   558,     0,     0,     0,    26,
       0,     0,     0,     0,   110,   111,   112,    27,    28,     0,
     559,     0,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   113,   114,     0,     0,     0,
       0,     0,   115,    35,    36,    37,    38,     0,     0,     0,
     116,     0,     0,   117,     0,   118,   119,     0,     0,     0,
       0,   120,   121,   122,   123,     0,     0,     0,     0,     0,
       0,     0,   560,   376,  -452,   104,     0,     1,   105,   106,
     107,     0,   108,   109,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,   548,   549,   550,   551,
     552,   553,   554,   555,   556,   557,   558,     0,     0,     0,
      26,     0,     0,     0,     0,   110,   111,   112,    27,    28,
       0,   559,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   113,   114,     0,     0,
       0,     0,     0,   115,    35,    36,    37,    38,     0,     0,
       0,   116,     0,     0,   117,     0,   118,   119,     0,     0,
       0,     0,   120,   121,   122,   123,     0,     0,     0,     0,
       0,     0,     0,   560,   376,  -454,   104,     0,     1,   105,
     106,   107,     0,   108,   109,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,     0,     0,     0,   110,   111,   112,    27,
      28,     0,     0,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   113,   114,     0,
       0,     0,     0,     0,   115,    35,    36,    37,    38,     0,
       0,     0,   116,     0,     0,   117,     0,   118,   119,     0,
       0,     0,     0,   120,   121,   122,   123,     0,     0,     0,
       0,     0,     0,     0,   461,   462,   463,   104,     0,     1,
     105,   106,   107,     0,   108,   109,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,   110,   111,   112,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   113,   114,
       0,     0,     0,     0,     0,   115,    35,    36,    37,    38,
       0,     0,     0,   116,     0,     0,   117,     0,   118,   119,
       0,     0,     0,     0,   120,   121,   122,   123,     0,     0,
       0,     0,     0,     0,     0,   461,   462,   482,   104,     0,
       1,   105,   106,   107,     0,   108,   109,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,     0,     0,     0,   110,   111,
     112,    27,    28,     0,     0,     0,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   113,
     114,     0,     0,     0,     0,     0,   115,    35,    36,    37,
      38,     0,     0,     0,   116,     0,     0,   117,     0,   118,
     119,     0,     0,     0,     0,   120,   121,   122,   123,     0,
       0,     0,     0,     0,     0,     0,   461,   462,   639,   104,
       0,     1,   105,   106,   107,     0,   108,   109,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,     0,     0,     0,   110,
     111,   112,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     113,   114,     0,     0,     0,     0,     0,   115,    35,    36,
      37,    38,     0,     0,     0,   116,     0,     0,   117,     0,
     118,   119,     0,     0,     0,     0,   120,   121,   122,   123,
       0,     0,     0,     0,     0,     0,     0,   653,   462,  -505,
     104,     0,     1,   105,   106,   107,     0,   108,   109,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,     0,     0,     0,     0,
     110,   111,   112,    27,    28,     0,     0,     0,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   113,   114,     0,     0,     0,     0,     0,   115,    35,
      36,    37,    38,     0,     0,     0,   116,     0,     0,   117,
       0,   118,   119,     0,     0,     0,     0,   120,   121,   122,
     123,     0,     0,     0,     0,     0,     0,     0,   461,   462,
     707,   104,     0,     1,   105,   106,   107,     0,   108,   109,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,     0,     0,
       0,   110,   111,   112,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   113,   114,     0,     0,     0,     0,     0,   115,
      35,    36,    37,    38,     0,     0,     0,   116,     0,     0,
     117,     0,   118,   119,     0,     0,     0,     0,   120,   121,
     122,   123,   104,     0,     1,   105,   106,     0,     0,   461,
     462,   812,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,   196,
       0,     0,   110,   111,     0,    27,    28,     0,     0,   197,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   113,   114,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    71,     0,
       0,   198,     0,   199,   119,   104,     0,     1,   105,   106,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     200,     0,   201,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,   196,     0,     0,   110,   111,     0,    27,    28,
       0,     0,   197,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   113,   114,     0,     0,
       0,     0,     0,     0,    35,    36,    37,    38,     0,     0,
       0,    71,     0,     0,   198,     0,   199,   119,   104,     0,
       1,   105,   106,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   200,     0,   397,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,   196,     0,     0,   110,   111,
       0,    27,    28,     0,     0,   197,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     0,   113,
     114,     0,     0,     0,     0,     0,     0,    35,    36,    37,
      38,     0,     0,     0,    71,     0,     0,   198,     0,   199,
     119,   104,     0,     1,   105,   106,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   200,     0,   406,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,   196,     0,
       0,   110,   111,     0,    27,    28,     0,     0,   197,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,   113,   114,     0,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,    71,     0,     0,
     198,     0,   199,   119,   104,     0,     1,   105,   106,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   200,
       0,   408,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
       0,   196,     0,     0,   110,   111,     0,    27,    28,     0,
       0,   197,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   113,   114,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     0,     0,
      71,     0,     0,   198,     0,   199,   119,   104,     0,     1,
     105,   106,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   200,     0,   591,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,   196,     0,     0,   110,   111,     0,
      27,    28,     0,     0,   197,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    34,     0,   113,   114,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    71,     0,     0,   198,     0,   199,   119,
     104,     0,     1,   105,   106,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   200,     0,   592,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,     0,   196,     0,     0,
     110,   111,     0,    27,    28,     0,     0,   197,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       0,   113,   114,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,     0,     0,     0,    71,     0,     0,   198,
       0,   199,   119,   104,     0,     1,   105,   106,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   200,     0,
     593,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,     0,
     196,     0,     0,   110,   111,     0,    27,    28,     0,     0,
     197,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,   113,   114,     0,     0,     0,     0,
       0,     0,    35,    36,    37,    38,     0,     0,     0,    71,
       0,     0,   198,     0,   199,   119,   104,     0,     1,   105,
     106,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   200,     0,   595,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,   196,     0,     0,   110,   111,     0,    27,
      28,     0,     0,   197,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   113,   114,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,     0,
       0,     0,    71,     0,     0,   198,     0,   199,   119,   104,
       0,     1,   105,   106,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   200,     0,   716,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,     0,   196,     0,     0,   110,
     111,     0,    27,    28,     0,     0,   197,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
     113,   114,     0,     0,     0,     0,     0,     0,    35,    36,
      37,    38,     0,     0,     0,    71,     0,     0,   198,     0,
     199,   119,   104,     0,     1,   105,   106,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   200,     0,   717,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,   196,
       0,     0,   110,   111,     0,    27,    28,     0,     0,   197,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,   113,   114,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    71,     0,
       0,   198,     0,   199,   119,   104,     0,     1,   105,   106,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     200,     0,   718,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,   104,     0,
       1,   105,   106,   107,     0,   108,   109,     0,     0,     0,
      26,     0,   196,     0,     0,   110,   111,     0,    27,    28,
       0,     0,   197,    29,     0,     2,    30,    31,     0,    32,
       0,    33,   104,     0,     1,   105,   106,   107,     0,   108,
     109,     0,     0,     0,    34,     0,   113,   114,     0,     0,
       0,     0,     0,     0,    35,    36,    37,    38,     0,     2,
       0,    71,     0,     0,   198,     0,   199,   119,   110,   111,
     112,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   200,     0,   719,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   113,
     114,     0,   110,   111,   112,     0,   115,     0,     0,     0,
       0,     0,     0,     0,   116,     0,     0,   117,     0,   118,
     119,     0,     0,     0,     0,   120,   121,   122,   123,     0,
       0,     0,     0,   113,   114,     0,     0,   815,   872,   104,
     115,     1,   105,   106,   107,     0,   108,   109,   116,     0,
       0,   117,     0,   118,   119,     0,     0,   327,     0,   120,
     121,   122,   123,     0,     0,     0,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
     548,   549,   550,   551,   552,   553,   554,   555,   556,   557,
     558,     0,     0,     0,    26,     0,     0,     0,     0,   110,
     111,   112,    27,    28,     0,   559,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,   104,
       0,     1,   105,   106,   107,     0,   108,   109,    34,     0,
     113,   114,     0,     0,     0,     0,     0,   115,    35,    36,
      37,    38,     0,     0,     0,   116,     2,     0,   117,     0,
     118,   119,     0,     0,     0,     0,   120,   121,   122,   123,
       0,     0,     0,     0,     0,     0,     0,   560,   376,     0,
     548,   549,   550,   551,   552,   553,   554,   555,   556,   557,
     558,     0,     0,     0,     0,     0,     0,     0,     0,   110,
     111,   112,   104,     0,     1,   105,   106,   107,     0,   108,
     109,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     2,
     113,   114,     0,     0,     0,     0,   104,   115,     1,   105,
     106,   107,     0,   108,   109,   116,     0,     0,   117,     0,
     118,   119,     0,     0,     0,     0,   120,   121,   122,   123,
       0,     0,     0,     2,     0,     0,     0,   560,   376,     0,
       0,     0,   110,   111,   112,   104,     0,     1,   105,   106,
     107,     0,   108,   109,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,   113,   114,     0,   110,   111,   112,   104,
     115,     1,   105,   106,   107,     0,   108,   109,   116,     0,
       0,   117,   485,   118,   119,     0,     0,     0,     0,   120,
     121,   122,   123,     0,     0,     0,     2,   113,   114,     0,
       0,   462,     0,     0,   115,   110,   111,   112,     0,     0,
       0,     0,   116,     0,     0,   117,   608,   118,   119,     0,
       0,     0,     0,   120,   121,   122,   123,     0,     0,     0,
       0,     0,     0,     0,     0,   462,   113,   114,     0,   110,
     111,   112,     0,   115,     0,     0,     0,     0,     0,     0,
       0,   116,     0,     0,   117,     0,   118,   119,     0,     0,
       0,     0,   120,   121,   122,   123,     0,     0,     0,     0,
     113,   114,     0,     0,   462,     0,     0,   115,     0,     0,
       0,     0,     0,     0,     0,   116,     0,     0,   117,     0,
     118,   119,     0,     0,     0,     0,   120,   121,   122,   123,
     104,     0,     1,   105,   106,     0,     0,     0,   815,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,   104,     0,     1,   105,   106,   107,     0,
     108,   109,     0,     0,     0,    26,     0,   196,     0,     0,
     110,   111,     0,    27,    28,     0,     0,   197,    29,     0,
       2,    30,    31,     0,    32,     0,    33,   104,     0,     1,
     105,   106,   107,     0,   108,   109,     0,     0,     0,    34,
       0,   113,   114,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,     0,     2,     0,    71,     0,     0,   198,
       0,   199,   119,   110,   111,   112,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   200,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   113,   114,     0,   110,   111,   112,
       0,   115,     0,     0,     0,     0,     0,     0,     0,   116,
       0,     0,   117,   765,   118,   119,     0,     0,     0,     0,
     120,   121,   122,   123,     0,     0,     0,     0,   113,   114,
       0,   560,     0,     0,     0,   115,     0,     0,     0,     0,
       0,     1,     0,   116,     0,     0,   117,   809,   118,   119,
       0,     0,     0,     0,   120,   121,   122,   123,     0,     0,
       0,     0,     0,     0,     0,   560,     2,     3,     4,     5,
       6,     7,   342,   343,   344,   345,   346,   347,   348,   349,
     350,   351,    18,    19,   352,   353,    22,    23,   354,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   355,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,    29,     0,     0,
       0,     0,     0,   356,     0,   357,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   358,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    35,    36,
     359,   360,     0,     0,     1,    71,     0,     0,   303,     0,
       0,     0,     0,    73,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   536,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     1,     0,    71,     0,
       0,   384,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   385,     0,
     386,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
       0,     0,     0,     0,     0,     0,     0,    27,    28,     0,
       0,     0,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     1,     0,
      71,     0,     0,   174,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   696,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,     0,     0,     0,     0,     0,     0,    27,
      28,     0,     0,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,     0,
       0,     0,    71,     0,   104,   303,     1,   105,   106,   107,
      73,   108,   109,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,  -288,     0,     0,     0,     0,     0,     0,
       0,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
       0,     0,     0,     0,   110,   111,   112,    27,    28,     0,
       0,     0,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     0,   113,   114,     0,     0,     0,
       0,     0,   115,    35,    36,    37,    38,     0,     0,     0,
     116,     0,     0,   117,     0,   118,   119,     0,     0,     0,
       0,   120,   121,   122,   123,   104,     0,     1,   105,   106,
     107,     0,   108,   109,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     2,     0,     0,     0,     0,     0,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,     0,     0,     0,   110,   111,   112,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,   113,   114,     0,     0,
       0,     0,     0,   115,    35,    36,    37,    38,     0,     0,
       0,   116,     0,     0,   117,   248,   118,   119,     0,     0,
       0,     0,   120,   121,   122,   123,   104,     0,     1,   105,
     106,   107,     0,   108,   109,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     2,     0,     0,     0,     0,     0,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,     0,     0,     0,   110,   111,   112,    27,
      28,     0,     0,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     0,   113,   114,     0,
       0,     0,     0,     0,   115,    35,    36,    37,    38,     0,
       0,     0,   116,     0,     0,   238,   248,   118,   119,     0,
       0,     0,     0,   120,   121,   122,   123,   104,     0,     1,
     105,   106,   107,     0,   108,   109,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     2,     0,     0,     0,     0,     0,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,   110,   111,   112,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,   104,     0,     1,   105,   106,   107,
       0,   108,   109,     0,     0,     0,    34,     0,   113,   114,
       0,     0,     0,     0,     0,   115,    35,    36,    37,    38,
       0,     2,     0,   372,     0,     0,   373,   248,   118,   119,
       0,     0,     0,     0,   120,   121,   122,   123,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   104,     0,     1,
     105,   106,   107,     0,   108,   109,     0,     0,     0,     0,
       0,     0,     0,     0,   110,   111,   112,    27,    28,     0,
       0,     0,    29,     0,     2,     0,     0,     0,     0,     0,
     104,     0,     1,   105,   106,   107,     0,   108,   109,     0,
       0,     0,     0,     0,     0,   113,   114,     0,     0,     0,
       0,     0,   115,    35,    36,     0,     0,     2,     0,     0,
     372,     0,     0,   373,   248,   118,   119,   110,   111,   112,
       0,   120,   121,   122,   123,     0,     0,     0,     0,     0,
       0,     0,     0,   104,     0,     1,   105,   106,   107,     0,
     108,   109,     0,     0,     0,     0,     0,     0,   113,   114,
     110,   111,   112,     0,     0,   115,     0,     0,     0,     0,
       2,     0,     0,   116,     0,     0,   117,   248,   118,   119,
       0,     0,     0,     0,   120,   121,   122,   123,     0,     0,
       0,   113,   114,     0,     0,     0,     0,   104,   115,     1,
     105,   106,   107,     0,   108,   109,   116,     0,     0,   117,
     762,   118,   119,   110,   111,   112,     0,   120,   121,   122,
     123,     0,     0,     0,     2,     0,     0,     0,     0,     0,
     104,     0,     1,   105,   106,   107,     0,   108,   109,     0,
       0,     0,     0,     0,   113,   114,     0,     0,     0,     0,
       0,   115,     0,     0,     0,     0,     0,     2,     0,   116,
       0,     0,   117,   841,   118,   119,     0,   110,   111,   112,
     120,   121,   122,   123,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   104,     0,     1,   105,   106,   107,     0,
     108,   109,     0,     0,     0,     0,     0,     0,   113,   114,
     110,   111,   112,     0,     0,   115,     0,     0,     0,     0,
       2,     0,     0,   116,     0,     0,   117,     0,   118,   119,
       0,     0,     0,     0,   120,   121,   122,   123,     0,     0,
       0,   113,   114,     0,     0,     0,     0,   104,   115,     1,
     105,   106,   107,     0,   108,   109,   116,     0,     0,   233,
       0,   118,   119,   110,   111,   112,     0,   120,   121,   122,
     123,     0,     0,     0,     2,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   113,   114,     0,     0,     0,     0,
       0,   115,     0,     0,     0,     0,     0,     0,     0,   116,
       0,     0,   238,     0,   118,   119,     0,   110,   111,   112,
     120,   121,   122,   123,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   113,   114,
       0,     0,     0,     1,     0,   115,     0,     0,     0,     0,
       0,     0,     0,   116,     0,     0,   246,     0,   118,   119,
       0,     0,     0,     0,   120,   121,   122,   123,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    26,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      34,     0,     0,     0,     1,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,    71,     0,     0,
      72,     0,     0,     0,     0,    73,     0,     0,    74,     2,
       3,     4,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    25,    26,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,    30,    31,     0,    32,     0,    33,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     1,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,     0,     0,     0,    71,     0,
       0,    72,   163,     0,     0,     0,    73,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    25,    26,     0,     0,     0,     0,
       0,     0,     0,    27,    28,     0,     0,     0,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    34,
       1,     0,     0,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,     0,     0,     0,    71,     0,     0,   303,
     163,     0,     0,     0,    73,     2,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    22,    23,    24,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    26,     0,     0,     0,     0,     0,     0,
       0,    27,    28,     0,     0,     0,    29,     0,     0,    30,
      31,     0,    32,     0,    33,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    34,     1,     0,
       0,     0,     0,     0,     0,     0,     0,    35,    36,    37,
      38,     0,     0,     0,    71,     0,     0,   433,     0,     0,
       0,     0,   434,     2,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,     0,     0,     0,     0,     0,     0,     0,    27,
      28,     0,     0,     0,    29,     0,     0,    30,    31,     0,
      32,     0,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    34,     1,     0,     0,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,     0,
       0,     0,    71,     0,     0,   433,     0,     0,     0,     0,
     446,     2,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,    22,    23,    24,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    26,
       0,     0,     0,     0,     0,     0,     0,    27,    28,     0,
       0,     0,    29,     0,     0,    30,    31,     0,    32,     0,
      33,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    34,     1,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,     0,     0,     0,
      71,     0,     0,   303,     0,     0,     0,     0,    73,     2,
       3,     4,     5,     6,     7,   342,   343,   344,   345,   346,
     347,   348,   349,   350,   351,    18,    19,   352,   353,    22,
      23,    24,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   355,     0,     0,
       0,     0,     0,     0,     0,    27,    28,     0,     0,     0,
      29,     0,     0,     0,     0,     0,   356,     0,   357,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   358,     1,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,   359,   360,     0,     0,     0,    71,     0,
       0,   433,     0,     0,     0,     0,   622,     2,     3,     4,
       5,     6,     7,   342,   343,   344,   345,   346,   347,   348,
     349,   350,   351,    18,    19,   352,   353,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   355,     0,     0,     0,     0,
       0,     0,     0,    27,    28,     0,     0,     0,    29,     0,
       0,     0,     0,     0,   356,     0,   357,     0,     0,     0,
       0,     0,     0,     0,     0,     1,     0,     0,     0,   358,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
      36,   359,   360,     0,     0,     0,    71,     0,     0,   433,
       2,     0,     0,     0,   632,     0,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,     0,
       0,     0,     0,     0,     0,     0,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     1,     0,     0,     0,     0,     0,     0,
       0,     0,    35,    36,    37,    38,     0,     0,     0,    71,
       0,     0,   303,     0,     0,     0,     0,    73,     2,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
      24,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    25,    26,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,    30,    31,     0,    32,     0,    33,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     1,     0,     0,
      34,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,    37,    38,     0,     0,     0,    71,     0,     0,
     433,   612,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    25,
      26,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     1,     0,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,    37,    38,     0,     0,
       0,     0,     0,     0,     0,   188,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    25,    26,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     1,     0,     0,    34,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    35,    36,
      37,    38,     0,     0,     0,     0,     0,     0,     0,   322,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    25,    26,     0,
       0,     0,     0,     0,     0,     0,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     1,
       0,     0,    34,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,    36,    37,    38,     0,     0,     0,     0,
       0,     0,     0,   726,     2,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    26,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,    30,    31,
       0,    32,     0,    33,     0,     0,     0,     0,     0,     0,
       0,     0,     1,     0,     0,     0,    34,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,    37,    38,
       0,     0,     0,    71,     0,     0,   174,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    26,     0,     0,     0,     0,
       0,     0,     0,    27,    28,     0,     0,     0,    29,     0,
       0,    30,    31,     0,    32,     0,    33,     0,     0,     0,
       0,     0,     0,     0,     0,     1,     0,     0,     0,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,     0,     0,     0,     0,     0,     0,   546,
       2,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,   518,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    25,    26,     0,
       0,     0,     0,     0,     0,     0,    27,    28,     0,     0,
       0,    29,     0,     0,    30,    31,     0,    32,     0,    33,
       0,     1,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    34,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    35,    36,    37,    38,     2,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    25,    26,     0,     0,     0,     0,     0,
       0,     0,    27,    28,     0,     0,     0,    29,     0,     0,
      30,    31,     0,    32,     0,    33,     0,     1,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    34,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    35,    36,
      37,    38,     2,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,    22,    23,    24,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      26,     0,     0,     0,     0,     0,     0,     0,    27,    28,
       0,     0,     0,    29,     0,     0,    30,    31,     0,    32,
       0,    33,     0,     1,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    34,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    35,    36,    37,    38,     2,     3,
       4,     5,     6,     7,   342,   343,   344,   345,   346,   347,
     348,   349,   350,   351,    18,    19,   352,   353,    22,    23,
     354,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   355,     0,     0,     0,
       0,     0,     0,     0,    27,    28,     0,     0,     0,    29,
       0,     0,     0,     0,     0,   356,     0,   357,     0,     1,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     358,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      35,    36,   359,   360,     2,     3,     4,     5,     6,     7,
     342,   343,   344,   345,   346,   347,   348,   349,   350,   351,
      18,    19,   352,   353,    22,    23,    24,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   355,     0,     0,     0,     0,     0,     0,     0,
      27,    28,     0,     0,     0,    29,     0,     0,     0,     0,
       0,   356,     0,   357,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   358,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    35,    36,   359,   360
};

static const yytype_int16 yycheck[] =
{
       0,    45,    87,    45,   259,   263,     0,   197,   383,    17,
     196,   119,   435,   377,     3,   438,     3,   196,   208,   277,
     535,     3,     3,    70,    24,    92,   341,     3,    45,    78,
      74,   244,     3,     3,     3,   377,     3,   815,   118,    69,
      64,    90,    90,    70,    44,    45,     3,   687,   196,     3,
       3,    69,   196,   118,   117,     0,    56,    69,    28,    24,
     140,    61,   118,   131,     3,    65,    66,    70,   210,   132,
     133,    28,    72,   127,    74,    28,    76,    70,    78,   117,
     119,   127,   120,   861,   140,   139,   127,    87,   127,    28,
      90,    56,    92,   139,   141,   243,    96,   245,   183,   243,
     141,   245,   102,   103,    74,    75,   621,    69,    70,    79,
     110,   141,   154,   113,   141,    66,    64,   222,   223,   224,
       1,    66,     3,   141,    11,   125,   766,    72,   136,   141,
     178,    96,   121,   182,   182,   117,   118,   154,   141,   120,
     110,   111,    87,   210,     3,   121,   117,   118,   141,   149,
     137,   151,   127,   140,   154,   222,   223,   224,   140,   674,
     108,   109,   137,   127,   164,   110,   208,     0,   113,   117,
     140,   140,   430,   140,   174,   139,   176,   363,   178,   141,
     370,   127,   182,   183,   363,   136,   140,   140,   120,   189,
      69,   233,   192,   139,   617,   141,   196,   197,   198,   199,
     242,   140,   244,   567,   246,   120,   206,   462,   208,   209,
     210,   279,   280,   281,   529,   363,   731,     3,   218,   363,
     433,   120,   222,   223,   224,   567,   568,   440,   137,   229,
       3,   196,   119,   233,   251,   448,   117,   118,   183,   263,
     127,   241,   242,   243,   244,   245,   246,     3,    10,    11,
     198,   251,   197,   277,   199,   304,    79,   306,   117,   118,
     260,   440,   141,   405,   264,   407,   641,   409,   107,   448,
     140,   319,   126,    69,    70,   126,   115,   467,   243,   138,
     245,   140,     7,     8,     9,   233,   140,   110,   111,   140,
     238,   121,   440,   119,   129,   130,   440,   127,   246,   126,
     448,   127,   302,   303,   448,   410,   411,   307,    45,   414,
     310,   416,   127,   140,   137,   263,   316,   265,   127,   319,
       3,   140,   316,   127,   579,     1,   141,     3,   370,   277,
     139,   117,   332,   375,   120,   139,   287,   288,   405,   290,
     407,   120,   409,   410,   411,   141,   363,   414,   433,   416,
     298,   302,   460,   140,   354,   138,   307,   302,   303,   310,
     702,   117,   307,   363,   120,   310,   117,     3,   368,   125,
     370,   316,     5,   373,   374,   375,   128,   377,   127,   421,
       7,     8,     9,   140,   384,   119,   134,   387,   388,   354,
     139,   459,    28,   127,   394,   120,   396,   553,   363,   124,
     125,   401,   660,   368,   421,   405,   430,   407,    44,   409,
     410,   411,   568,   138,   414,   135,   416,   154,   127,   419,
     121,   421,    16,    69,    70,   373,   127,   427,   452,   377,
     139,   431,   141,   433,   117,   118,    14,    15,    74,    75,
     440,   117,   118,    69,    70,   121,   121,   198,   448,   126,
     127,   127,   594,   453,   596,   597,   598,   140,   117,   196,
     107,   120,   119,   126,   127,   514,   125,   467,   115,   511,
     127,   208,   121,   121,   127,   440,    74,    75,   127,   127,
     121,    79,   430,   448,   432,   121,   127,   238,   433,   121,
     121,   127,   121,   120,   511,   141,   127,   124,   125,   138,
       3,   139,   140,   121,   452,   242,   243,   244,   245,   533,
     126,   511,   110,   111,   265,   141,   771,     3,   282,   283,
     564,   258,   259,    12,    13,    45,   682,   594,   121,   596,
     597,   598,     3,   618,   534,   535,   121,   140,   694,   120,
     138,   541,   127,   543,   125,   545,   702,   298,     7,     8,
       9,   139,    72,   553,    74,   555,   121,    28,    78,   559,
     121,   561,   127,   121,   564,   139,   127,   567,   568,   127,
      90,    74,    75,    44,     3,   120,    79,   140,   543,   527,
     125,   581,   582,   140,   535,   533,   586,   121,    74,    75,
     535,   124,     3,    79,   594,   120,   596,   597,   598,    28,
     125,   138,   758,    74,    75,   553,   762,   110,   111,   765,
     558,   302,   302,   284,   285,    44,   307,   307,   618,   567,
     568,   621,   373,   121,   110,   111,   363,   291,   292,   118,
     119,   117,   126,   370,   120,   126,   660,   140,   375,   121,
     377,   120,   642,   120,   120,    74,    75,   803,   804,   118,
     806,   137,   120,   809,   174,   121,   176,   141,   178,   102,
     103,   120,   182,    74,    75,   124,   125,   121,    79,   669,
     621,   120,   192,   618,   674,   125,   621,   118,   198,   138,
     125,   432,   682,   121,   121,   841,   141,   121,   208,   141,
     121,   137,   121,   120,   694,     0,   120,   697,   120,   110,
     111,   857,   702,   440,   860,   120,     7,     8,     9,   120,
     710,   448,   660,   713,     1,   141,     3,     4,     5,    74,
      75,     3,   139,   674,    79,   462,   139,   139,   772,   674,
     467,   731,   121,   121,   682,   683,   684,   685,   118,   687,
      45,    28,   126,   480,   125,   141,   694,   126,   125,   121,
     774,   121,    74,    75,   702,   110,   111,    79,   758,   137,
      65,    66,   762,    56,   140,   765,   121,    72,    73,   125,
     139,   138,   772,   141,   511,   137,   527,   777,   778,   121,
     731,   126,    87,   126,    71,    72,   731,    92,   110,   111,
     126,   815,    74,    75,   126,   120,   126,    79,   126,   319,
     139,   141,    64,   803,   804,   110,   806,   558,   113,   809,
     758,    56,   117,     3,   762,   102,   103,   765,   766,   120,
     141,   141,   141,   124,   125,   141,   774,   564,   110,   111,
     567,   568,   141,   120,   141,   117,   123,   861,   120,   121,
     139,   841,   579,    45,   141,   141,   430,   115,   295,   154,
     294,   293,   245,   373,    56,   803,   804,   857,   806,   807,
     860,   809,   810,   296,   384,   297,   772,   815,   388,   393,
      72,   310,    74,   399,   394,   582,    44,    45,   183,   184,
     229,   467,   187,    85,    74,    75,     3,   246,    90,    79,
      92,   480,   197,   841,   199,   567,   651,   480,   480,    -1,
      -1,    -1,     3,   208,    -1,   210,    74,    75,    -1,   857,
      -1,    79,   860,   861,    -1,    -1,    -1,   222,   223,   224,
     110,   111,    -1,    -1,    -1,    -1,    -1,    28,   233,    -1,
     120,    -1,   683,   684,   685,   125,    -1,   242,    -1,   244,
      -1,   246,   110,   111,    -1,    -1,   251,   467,    -1,   117,
      -1,    -1,   154,   258,   259,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,   166,   702,    -1,    -1,    -1,    -1,
      -1,    -1,   174,    74,    75,   177,   178,    -1,    79,     1,
     182,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      45,    -1,    -1,   110,   111,   197,   198,   302,   303,    -1,
     117,    -1,   307,   120,    -1,   310,   208,    -1,   210,   110,
     111,   316,    -1,    -1,    -1,    -1,   218,    72,    -1,    74,
     222,   223,   224,    78,    -1,   545,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   771,    90,    -1,    -1,    -1,    -1,
     242,    -1,   244,    -1,   564,    -1,    -1,    -1,    -1,   251,
      -1,    -1,    74,    75,    -1,    -1,   807,    79,    -1,   810,
      -1,   581,   582,    -1,    -1,   370,   586,    -1,   373,    -1,
     375,    -1,   377,    -1,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    -1,    -1,    -1,    -1,   110,   111,
      -1,    -1,    -1,    -1,    -1,   117,   118,    -1,   120,   121,
     405,   303,   407,   125,   409,   410,   411,    -1,    -1,   414,
      -1,   416,    -1,    -1,    -1,    -1,   421,   319,    45,   174,
      -1,   176,    -1,   178,    -1,    -1,    -1,   182,   433,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   192,    -1,    -1,
      -1,    -1,    -1,   198,    71,    72,    -1,    74,    -1,    -1,
      -1,    78,    -1,    -1,   209,    -1,    -1,   462,    -1,    -1,
      -1,   363,   467,   218,    -1,    -1,   368,    -1,   370,    -1,
      -1,   373,    -1,    -1,    -1,   480,    -1,    -1,    -1,    -1,
      -1,    -1,   384,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     710,    -1,   394,   713,   138,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   405,    -1,   407,   511,   409,   410,   411,
      -1,    -1,   414,    -1,   416,    -1,    45,    -1,    -1,   421,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   154,    -1,   534,
     535,   433,    -1,    -1,   161,    -1,    -1,    -1,   440,    -1,
      -1,    -1,    71,    -1,    -1,    -1,   448,   174,    -1,   176,
      -1,    -1,   772,    -1,    -1,    -1,    -1,   777,   778,   564,
      -1,    -1,   567,   568,   319,   467,    -1,    -1,    -1,    -1,
      -1,   198,    -1,    -1,   579,    -1,    -1,    -1,    -1,    -1,
      -1,   208,   209,    -1,    -1,    -1,    -1,    -1,   117,   594,
      -1,   596,   597,   598,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   511,
      -1,    -1,    -1,   618,    -1,   242,   621,   244,   373,    -1,
      -1,    -1,    -1,    -1,   251,   154,    -1,    -1,    -1,   384,
      -1,    -1,   161,   388,    -1,    -1,    -1,    -1,    -1,   394,
      -1,   396,    -1,    -1,    -1,    -1,   401,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   564,    -1,    -1,    45,    -1,   196,    -1,   674,
      -1,    -1,    -1,    -1,    -1,    -1,   303,   304,    -1,   208,
     582,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   594,    -1,   596,   597,   598,   702,    -1,    -1,
      -1,    -1,    -1,    -1,   233,    -1,    97,    -1,    -1,    -1,
      -1,    -1,    -1,   242,   243,   244,   245,   246,    -1,    -1,
     111,    -1,   251,   114,    -1,    -1,   731,    -1,    -1,   258,
     259,    -1,    -1,    -1,    -1,    -1,   363,   117,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   372,   373,    45,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   384,    -1,    -1,
      -1,   388,    -1,    -1,    -1,    -1,   771,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   154,    -1,    -1,    -1,    -1,    73,
      -1,    -1,    -1,    -1,    -1,    -1,    45,    -1,    -1,    -1,
     545,    92,    -1,   184,   421,    -1,   187,    -1,   700,    -1,
      -1,    -1,    -1,    97,    -1,    -1,   433,    -1,   435,   564,
      -1,   713,    -1,   440,    -1,    -1,    -1,   111,    -1,   117,
     114,   448,    -1,    -1,    -1,    -1,   581,    -1,   208,    -1,
      -1,   586,    -1,    -1,   363,    -1,    -1,   228,    -1,    -1,
     467,   370,    -1,   372,   373,    -1,   375,    -1,   377,    -1,
      -1,    -1,    -1,   233,    -1,    -1,   154,    -1,   117,    -1,
      -1,    -1,   242,   243,   244,   245,   246,    -1,    -1,    -1,
     772,   251,    -1,    -1,   202,   203,   204,   205,   258,   259,
      -1,    -1,    -1,    -1,   511,    -1,    -1,    -1,    -1,    -1,
     184,    -1,   421,   187,    -1,   154,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,   210,
     208,   440,    -1,    -1,    -1,    -1,    -1,    -1,   545,   448,
      -1,   222,   223,   224,    -1,    -1,    -1,    28,    -1,    -1,
      -1,    -1,    -1,   462,   228,   233,    -1,   564,   467,    -1,
      -1,    -1,    -1,    -1,   242,   243,   244,   245,   246,   208,
      -1,   480,    -1,   251,    -1,   582,    -1,   258,   259,    -1,
     258,   259,    -1,    -1,   258,   259,    -1,    -1,    -1,    -1,
      71,    72,    73,    -1,   233,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   511,   242,    -1,   244,    -1,   246,    -1,    -1,
     370,    -1,   251,   373,   385,   375,    -1,   377,    -1,   258,
     259,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   117,   772,    -1,   120,
      -1,   122,   123,    -1,    -1,   126,    -1,   128,   129,   130,
     131,    -1,    -1,    -1,    -1,   564,    -1,    -1,   567,   568,
      -1,   421,    -1,   434,    -1,    -1,    -1,    -1,    -1,    -1,
     579,    -1,    -1,    -1,    -1,   446,    -1,    -1,    -1,    -1,
     440,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   448,    -1,
      -1,    -1,   370,    -1,    -1,   373,    -1,   375,    -1,   377,
      -1,    -1,   462,   710,    -1,    -1,    -1,   467,    -1,   383,
      -1,   385,    -1,    -1,    -1,    -1,    -1,    -1,   399,    -1,
     480,    -1,    -1,    -1,   405,    -1,   407,    -1,   409,   410,
     411,   370,    -1,   414,   373,   416,   375,    -1,   377,    -1,
      -1,    -1,    -1,   421,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   511,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     434,    -1,   440,    -1,    -1,   772,    -1,   475,    -1,    -1,
     448,    -1,   446,    -1,    -1,    -1,    -1,   548,    -1,    -1,
      -1,   462,   421,    -1,   462,    -1,    -1,    -1,   462,   467,
      -1,    -1,    -1,   702,    -1,    -1,    -1,    -1,    -1,   480,
      -1,    -1,   480,    -1,   564,    -1,   480,   567,   568,    -1,
      -1,    -1,    -1,   584,    -1,    -1,    -1,    -1,    -1,   579,
      -1,    -1,     1,   462,     3,     4,     5,     6,   467,     8,
       9,    -1,    -1,   511,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   480,    -1,    -1,    -1,    -1,    -1,    -1,   619,    28,
      -1,   622,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     631,   632,   771,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   511,    -1,   548,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   564,    -1,    -1,   567,
     568,    -1,    71,    72,    73,    -1,    -1,    -1,   579,    -1,
      -1,   579,    -1,    -1,     1,   579,     3,     4,     5,     6,
     584,     8,     9,   594,    -1,   596,   597,   598,    -1,    -1,
      -1,    -1,    -1,   102,   103,   564,    -1,    -1,   567,   568,
     109,    28,    -1,    -1,    -1,    -1,    -1,    -1,   117,    -1,
     579,   120,   702,   122,   123,   619,    -1,    -1,   622,   128,
     129,   130,   131,    -1,    -1,    -1,    -1,   631,   632,    -1,
     139,   732,    -1,   671,   672,   736,    -1,   641,    -1,    -1,
     651,    -1,    -1,    -1,    71,    72,    73,   651,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   662,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   769,    -1,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,   780,
      -1,   771,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     117,    -1,    -1,   120,   702,   122,   123,    -1,    -1,   126,
      -1,   128,   129,   130,   131,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   751,   752,    -1,   754,   755,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   732,    -1,
      -1,    -1,   736,   702,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   790,    -1,   792,    -1,    -1,    -1,    -1,    -1,
     771,   799,   800,   771,    -1,   769,    -1,   771,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   780,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   826,    -1,
     828,    -1,   830,     1,   832,     3,     4,     5,     6,    -1,
       8,     9,   771,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   853,    -1,   855,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,    77,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,   110,   111,   112,   113,    -1,    -1,    -1,   117,
      -1,    -1,   120,    -1,   122,   123,    -1,    -1,    -1,    -1,
     128,   129,   130,   131,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   139,   140,   141,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    52,    53,    54,    55,    56,
      57,    58,    59,    60,    61,    62,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      77,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,   110,   111,   112,   113,    -1,    -1,    -1,
     117,    -1,    -1,   120,    -1,   122,   123,    -1,    -1,    -1,
      -1,   128,   129,   130,   131,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   139,   140,   141,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    77,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    -1,    -1,   120,    -1,   122,   123,    -1,    -1,
      -1,    -1,   128,   129,   130,   131,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   139,   140,   141,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,   110,   111,   112,   113,    -1,
      -1,    -1,   117,    -1,    -1,   120,    -1,   122,   123,    -1,
      -1,    -1,    -1,   128,   129,   130,   131,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   139,   140,   141,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    -1,    -1,   120,    -1,   122,   123,
      -1,    -1,    -1,    -1,   128,   129,   130,   131,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   139,   140,   141,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,
      73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,
     113,    -1,    -1,    -1,   117,    -1,    -1,   120,    -1,   122,
     123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   139,   140,   141,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,
     112,   113,    -1,    -1,    -1,   117,    -1,    -1,   120,    -1,
     122,   123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,   140,   141,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      71,    72,    73,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,
     111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,   120,
      -1,   122,   123,    -1,    -1,    -1,    -1,   128,   129,   130,
     131,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,   140,
     141,     1,    -1,     3,     4,     5,     6,    -1,     8,     9,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    71,    72,    73,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,   109,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,
     120,    -1,   122,   123,    -1,    -1,    -1,    -1,   128,   129,
     130,   131,     1,    -1,     3,     4,     5,    -1,    -1,   139,
     140,   141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
      -1,   120,    -1,   122,   123,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     139,    -1,   141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    -1,    -1,   120,    -1,   122,   123,     1,    -1,
       3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   139,    -1,   141,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,
      -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,
     103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,    -1,    -1,   120,    -1,   122,
     123,     1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,   141,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,
      -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,
     120,    -1,   122,   123,     1,    -1,     3,     4,     5,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,
      -1,   141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,
      -1,    78,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,    -1,    -1,   120,    -1,   122,   123,     1,    -1,     3,
       4,     5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   139,    -1,   141,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,
      74,    75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    -1,    -1,   120,    -1,   122,   123,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   139,    -1,   141,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,   120,
      -1,   122,   123,     1,    -1,     3,     4,     5,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,
     141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      68,    -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,
      78,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
      -1,    -1,   120,    -1,   122,   123,     1,    -1,     3,     4,
       5,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   139,    -1,   141,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,
      75,    -1,    -1,    78,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,    -1,    -1,   120,    -1,   122,   123,     1,
      -1,     3,     4,     5,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   139,    -1,   141,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,    71,
      72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,   117,    -1,    -1,   120,    -1,
     122,   123,     1,    -1,     3,     4,     5,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,   141,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    68,
      -1,    -1,    71,    72,    -1,    74,    75,    -1,    -1,    78,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
      -1,   120,    -1,   122,   123,     1,    -1,     3,     4,     5,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     139,    -1,   141,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,
      66,    -1,    68,    -1,    -1,    71,    72,    -1,    74,    75,
      -1,    -1,    78,    79,    -1,    28,    82,    83,    -1,    85,
      -1,    87,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    28,
      -1,   117,    -1,    -1,   120,    -1,   122,   123,    71,    72,
      73,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   139,    -1,   141,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,
     103,    -1,    71,    72,    73,    -1,   109,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   117,    -1,    -1,   120,    -1,   122,
     123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,    -1,
      -1,    -1,    -1,   102,   103,    -1,    -1,   140,   141,     1,
     109,     3,     4,     5,     6,    -1,     8,     9,   117,    -1,
      -1,   120,    -1,   122,   123,    -1,    -1,   126,    -1,   128,
     129,   130,   131,    -1,    -1,    -1,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    71,
      72,    73,    74,    75,    -1,    77,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,     1,
      -1,     3,     4,     5,     6,    -1,     8,     9,   100,    -1,
     102,   103,    -1,    -1,    -1,    -1,    -1,   109,   110,   111,
     112,   113,    -1,    -1,    -1,   117,    28,    -1,   120,    -1,
     122,   123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,   140,    -1,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    71,
      72,    73,     1,    -1,     3,     4,     5,     6,    -1,     8,
       9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,
     102,   103,    -1,    -1,    -1,    -1,     1,   109,     3,     4,
       5,     6,    -1,     8,     9,   117,    -1,    -1,   120,    -1,
     122,   123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,
      -1,    -1,    -1,    28,    -1,    -1,    -1,   139,   140,    -1,
      -1,    -1,    71,    72,    73,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,   102,   103,    -1,    71,    72,    73,     1,
     109,     3,     4,     5,     6,    -1,     8,     9,   117,    -1,
      -1,   120,   121,   122,   123,    -1,    -1,    -1,    -1,   128,
     129,   130,   131,    -1,    -1,    -1,    28,   102,   103,    -1,
      -1,   140,    -1,    -1,   109,    71,    72,    73,    -1,    -1,
      -1,    -1,   117,    -1,    -1,   120,   121,   122,   123,    -1,
      -1,    -1,    -1,   128,   129,   130,   131,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   140,   102,   103,    -1,    71,
      72,    73,    -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   117,    -1,    -1,   120,    -1,   122,   123,    -1,    -1,
      -1,    -1,   128,   129,   130,   131,    -1,    -1,    -1,    -1,
     102,   103,    -1,    -1,   140,    -1,    -1,   109,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   117,    -1,    -1,   120,    -1,
     122,   123,    -1,    -1,    -1,    -1,   128,   129,   130,   131,
       1,    -1,     3,     4,     5,    -1,    -1,    -1,   140,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    66,    -1,    68,    -1,    -1,
      71,    72,    -1,    74,    75,    -1,    -1,    78,    79,    -1,
      28,    82,    83,    -1,    85,    -1,    87,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,   100,
      -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    28,    -1,   117,    -1,    -1,   120,
      -1,   122,   123,    71,    72,    73,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   139,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    -1,    71,    72,    73,
      -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,
      -1,    -1,   120,   121,   122,   123,    -1,    -1,    -1,    -1,
     128,   129,   130,   131,    -1,    -1,    -1,    -1,   102,   103,
      -1,   139,    -1,    -1,    -1,   109,    -1,    -1,    -1,    -1,
      -1,     3,    -1,   117,    -1,    -1,   120,   121,   122,   123,
      -1,    -1,    -1,    -1,   128,   129,   130,   131,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   139,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      -1,    -1,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,     3,   117,    -1,    -1,   120,    -1,
      -1,    -1,    -1,   125,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   140,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,     3,    -1,   117,    -1,
      -1,   120,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   137,    -1,
     139,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,     3,    -1,
     117,    -1,    -1,   120,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   139,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,    -1,     1,   120,     3,     4,     5,     6,
     125,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   138,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,   110,   111,   112,   113,    -1,    -1,    -1,
     117,    -1,    -1,   120,    -1,   122,   123,    -1,    -1,    -1,
      -1,   128,   129,   130,   131,     1,    -1,     3,     4,     5,
       6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,    -1,
      -1,    -1,    -1,   109,   110,   111,   112,   113,    -1,    -1,
      -1,   117,    -1,    -1,   120,   121,   122,   123,    -1,    -1,
      -1,    -1,   128,   129,   130,   131,     1,    -1,     3,     4,
       5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,    -1,   102,   103,    -1,
      -1,    -1,    -1,    -1,   109,   110,   111,   112,   113,    -1,
      -1,    -1,   117,    -1,    -1,   120,   121,   122,   123,    -1,
      -1,    -1,    -1,   128,   129,   130,   131,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    71,    72,    73,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,     1,    -1,     3,     4,     5,     6,
      -1,     8,     9,    -1,    -1,    -1,   100,    -1,   102,   103,
      -1,    -1,    -1,    -1,    -1,   109,   110,   111,   112,   113,
      -1,    28,    -1,   117,    -1,    -1,   120,   121,   122,   123,
      -1,    -1,    -1,    -1,   128,   129,   130,   131,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     1,    -1,     3,
       4,     5,     6,    -1,     8,     9,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    71,    72,    73,    74,    75,    -1,
      -1,    -1,    79,    -1,    28,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,
      -1,    -1,   109,   110,   111,    -1,    -1,    28,    -1,    -1,
     117,    -1,    -1,   120,   121,   122,   123,    71,    72,    73,
      -1,   128,   129,   130,   131,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,
      71,    72,    73,    -1,    -1,   109,    -1,    -1,    -1,    -1,
      28,    -1,    -1,   117,    -1,    -1,   120,   121,   122,   123,
      -1,    -1,    -1,    -1,   128,   129,   130,   131,    -1,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,     1,   109,     3,
       4,     5,     6,    -1,     8,     9,   117,    -1,    -1,   120,
     121,   122,   123,    71,    72,    73,    -1,   128,   129,   130,
     131,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
       1,    -1,     3,     4,     5,     6,    -1,     8,     9,    -1,
      -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,    -1,    -1,    -1,    28,    -1,   117,
      -1,    -1,   120,   121,   122,   123,    -1,    71,    72,    73,
     128,   129,   130,   131,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,     1,    -1,     3,     4,     5,     6,    -1,
       8,     9,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,
      71,    72,    73,    -1,    -1,   109,    -1,    -1,    -1,    -1,
      28,    -1,    -1,   117,    -1,    -1,   120,    -1,   122,   123,
      -1,    -1,    -1,    -1,   128,   129,   130,   131,    -1,    -1,
      -1,   102,   103,    -1,    -1,    -1,    -1,     1,   109,     3,
       4,     5,     6,    -1,     8,     9,   117,    -1,    -1,   120,
      -1,   122,   123,    71,    72,    73,    -1,   128,   129,   130,
     131,    -1,    -1,    -1,    28,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   102,   103,    -1,    -1,    -1,    -1,
      -1,   109,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   117,
      -1,    -1,   120,    -1,   122,   123,    -1,    71,    72,    73,
     128,   129,   130,   131,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   102,   103,
      -1,    -1,    -1,     3,    -1,   109,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   117,    -1,    -1,   120,    -1,   122,   123,
      -1,    -1,    -1,    -1,   128,   129,   130,   131,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,     3,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,
     120,    -1,    -1,    -1,    -1,   125,    -1,    -1,   128,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
      -1,   120,   121,    -1,    -1,    -1,   125,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,
       3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,   120,
     121,    -1,    -1,    -1,   125,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    41,    42,
      43,    44,    45,    46,    47,    48,    49,    50,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,
      83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,     3,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,
     113,    -1,    -1,    -1,   117,    -1,    -1,   120,    -1,    -1,
      -1,    -1,   125,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,
      75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,
      85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   100,     3,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,
      -1,    -1,   117,    -1,    -1,   120,    -1,    -1,    -1,    -1,
     125,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      37,    38,    39,    40,    41,    42,    43,    44,    45,    46,
      47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,
      -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,
      87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   100,     3,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,
     117,    -1,    -1,   120,    -1,    -1,    -1,    -1,   125,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,
      79,    -1,    -1,    -1,    -1,    -1,    85,    -1,    87,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   100,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,
      -1,   120,    -1,    -1,    -1,    -1,   125,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    -1,    -1,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,   120,
      28,    -1,    -1,    -1,   125,    -1,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,   117,
      -1,    -1,   120,    -1,    -1,    -1,    -1,   125,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    65,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    -1,    -1,    -1,   117,    -1,    -1,
     120,   121,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,     3,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   121,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   121,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,   121,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    82,    83,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,     3,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113,
      -1,    -1,    -1,   117,    -1,    -1,   120,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    37,    38,    39,    40,
      41,    42,    43,    44,    45,    46,    47,    48,    49,    50,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,
      -1,    82,    83,    -1,    85,    -1,    87,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,   100,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,
     111,   112,   113,    -1,    -1,    -1,    -1,    -1,    -1,   120,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    65,    66,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    74,    75,    -1,    -1,
      -1,    79,    -1,    -1,    82,    83,    -1,    85,    -1,    87,
      -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   110,   111,   112,   113,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    65,    66,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    74,    75,    -1,    -1,    -1,    79,    -1,    -1,
      82,    83,    -1,    85,    -1,    87,    -1,     3,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   110,   111,
     112,   113,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    74,    75,
      -1,    -1,    -1,    79,    -1,    -1,    82,    83,    -1,    85,
      -1,    87,    -1,     3,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   110,   111,   112,   113,    28,    29,
      30,    31,    32,    33,    34,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    74,    75,    -1,    -1,    -1,    79,
      -1,    -1,    -1,    -1,    -1,    85,    -1,    87,    -1,     3,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     100,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
     110,   111,   112,   113,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    66,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      74,    75,    -1,    -1,    -1,    79,    -1,    -1,    -1,    -1,
      -1,    85,    -1,    87,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   100,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   110,   111,   112,   113
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint16 yystos[] =
{
       0,     3,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    65,    66,    74,    75,    79,
      82,    83,    85,    87,   100,   110,   111,   112,   113,   143,
     144,   145,   146,   147,   152,   184,   185,   190,   191,   192,
     196,   197,   198,   199,   201,   202,   208,   216,   217,   235,
     266,   140,   147,   152,   120,   120,   118,     1,   117,   118,
     152,   117,   120,   125,   128,   143,   152,   190,   191,   198,
     199,   201,   217,   220,   222,   224,   225,   227,   228,   229,
     232,   120,   140,   146,   147,   152,   191,   137,     0,   152,
     218,   219,   140,   140,     1,     4,     5,     6,     8,     9,
      71,    72,    73,   102,   103,   109,   117,   120,   122,   123,
     128,   129,   130,   131,   145,   152,   153,   154,   155,   159,
     160,   162,   163,   164,   165,   166,   167,   168,   169,   170,
     171,   172,   173,   174,   175,   176,   253,   256,   145,   152,
     145,   152,   160,   166,   184,   203,   204,   205,   206,   207,
     198,   231,   232,   121,   152,   222,   224,   233,   234,   235,
     126,   145,   175,   179,   120,   152,   191,   224,   232,   220,
     225,   228,   232,   120,   125,   191,   120,   125,   121,   152,
     233,   236,   191,   220,   229,   120,    68,    78,   120,   122,
     139,   141,   148,   149,   150,   151,   152,   155,   184,   191,
     209,   210,   211,   212,   213,   225,   226,   228,   232,   255,
     256,   258,   140,   140,   140,   147,   152,   179,   138,   127,
     141,   218,   218,   120,   154,   157,   159,   161,   120,   160,
     160,   152,   184,   179,   184,   179,   120,   161,   121,   176,
     178,   181,   198,   199,   201,   217,   237,   253,   140,   140,
       7,     8,     9,   120,   124,   125,    18,    19,    20,    21,
      22,    23,    24,    25,    26,    27,   138,   177,   163,   117,
     132,   133,   129,   130,    10,    11,   166,    12,    13,   118,
     119,    14,    15,   128,   134,   135,    16,    17,   136,   121,
     121,   121,   138,   120,   191,   222,   232,   138,    11,   119,
     127,   198,   232,   121,   121,   121,   127,   126,   126,   232,
     220,   229,   121,   233,   126,   145,   179,   126,   145,   179,
     121,   121,   127,     3,    28,    44,    74,    75,   121,   193,
     194,   195,    34,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    46,    47,    50,    66,    85,    87,   100,   112,
     113,   147,   152,   186,   190,   198,   200,   202,   208,   216,
     184,   226,   117,   120,   152,   184,   140,   247,   248,   248,
     248,   139,   248,   138,   120,   137,   139,   152,   191,   214,
     215,   225,   226,   230,   232,   228,   232,   141,   213,   127,
     139,   191,   228,   139,   139,   209,   141,   209,   141,   209,
     140,   140,   179,   219,   139,   141,   139,   141,   143,   152,
     160,   182,   198,   199,   201,   217,   238,     7,     8,     9,
     120,   124,   125,   120,   125,   191,   221,   223,   232,   152,
     187,   190,   198,   200,   201,   217,   125,   223,   187,   160,
     238,   121,   127,   152,   198,   199,   201,   217,   222,   121,
     124,   139,   140,   141,   155,   156,   175,   183,   190,   198,
     199,   201,   217,   240,   257,   259,   260,   261,   262,   263,
     264,   265,   141,   265,   152,   121,   156,   158,   176,   152,
     178,   156,   176,   163,   163,   163,   164,   164,   165,   165,
     166,   166,   166,   168,   168,   169,   170,   171,   172,   173,
     178,   184,   204,   205,   232,   204,   205,   206,    51,   235,
     121,   126,   126,   126,   126,   152,   121,   120,   121,   127,
     194,   147,   152,   120,   120,   118,   140,   152,   190,   198,
     200,   222,   152,   191,   226,   191,   120,   141,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    77,
     139,   152,   178,   180,   183,   242,   243,   244,   245,   246,
     248,   249,   250,   251,   252,   254,   240,   121,   179,   140,
     225,   232,   127,   139,   137,   196,   191,   225,   228,   210,
     228,   141,   141,   141,   209,   141,   209,   209,   209,   121,
     143,   198,   199,   201,   217,   222,   121,   152,   121,   158,
     152,   178,   121,   223,   233,   179,   221,   232,   120,   125,
     221,   118,   125,   152,   190,   198,   200,   201,   217,   223,
     179,   125,   125,   223,   121,   121,   176,   163,   253,   141,
     265,   138,   152,   190,   198,   199,   201,   217,   226,   230,
     248,   127,   139,   139,   260,   262,   263,   141,   141,   121,
     127,   126,   137,   222,   178,   121,   194,   176,   145,   152,
     207,    69,    70,   141,   118,   140,   140,   152,   147,   152,
     121,   179,   137,   120,   120,   120,   242,   120,   152,   139,
     139,   139,   178,   152,   137,   139,   139,   152,   188,   189,
     224,   180,   245,   180,   242,   141,   139,   141,   265,   225,
     191,   215,   225,   232,   179,   225,   141,   141,   141,   141,
     121,   126,   121,   121,   126,   221,   121,   233,   179,   207,
     179,   118,   125,   126,   179,   179,   125,   141,   240,   261,
     156,   176,   175,   121,   121,   121,   121,   119,   248,   248,
     207,    69,    70,   141,    69,    70,   141,   140,   137,   242,
     178,   178,   121,   178,    56,   121,   249,   139,   139,   138,
     242,   140,   127,   139,   138,   141,   225,   232,   191,   225,
     137,   121,   126,   119,   126,   207,   179,   126,   126,   179,
      70,   141,    69,   141,   119,   248,   248,   248,   248,    69,
      70,   141,   242,   121,   121,   242,   121,   120,   242,   121,
     249,   179,   141,   265,   189,   140,   176,   239,   225,   225,
     179,   119,   126,   126,   248,   248,    70,   141,    69,   141,
      70,   141,    69,   141,   248,   248,   242,   242,   242,   178,
     242,   121,   178,   139,   141,   239,   241,   141,   141,   248,
     248,   248,   248,    70,   141,    69,   141,    64,   121,   242,
     121,   127,   141,   141,   141,   141,   141,   248,   248,   242,
     139,   242,   141,   239,   141,   141
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
      case 143: /* "guess_type" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3751 "type.ec"
	break;
      case 145: /* "type" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3760 "type.ec"
	break;
      case 146: /* "base_strict_type" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3769 "type.ec"
	break;
      case 147: /* "strict_type" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 3778 "type.ec"
	break;
      case 148: /* "class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3787 "type.ec"
	break;
      case 149: /* "constructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3796 "type.ec"
	break;
      case 150: /* "destructor_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3805 "type.ec"
	break;
      case 151: /* "virtual_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 3814 "type.ec"
	break;
      case 152: /* "identifier" */

/* Line 1009 of yacc.c  */
#line 163 "type.y"
	{ FreeIdentifier((yyvaluep->id)); };

/* Line 1009 of yacc.c  */
#line 3823 "type.ec"
	break;
      case 153: /* "primary_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3832 "type.ec"
	break;
      case 155: /* "postfix_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3841 "type.ec"
	break;
      case 158: /* "argument_expression_list" */

/* Line 1009 of yacc.c  */
#line 200 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3850 "type.ec"
	break;
      case 160: /* "unary_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3859 "type.ec"
	break;
      case 163: /* "cast_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3868 "type.ec"
	break;
      case 164: /* "multiplicative_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3877 "type.ec"
	break;
      case 165: /* "additive_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3886 "type.ec"
	break;
      case 166: /* "shift_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3895 "type.ec"
	break;
      case 168: /* "relational_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3904 "type.ec"
	break;
      case 169: /* "equality_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3913 "type.ec"
	break;
      case 170: /* "and_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3922 "type.ec"
	break;
      case 171: /* "exclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3931 "type.ec"
	break;
      case 172: /* "inclusive_or_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3940 "type.ec"
	break;
      case 173: /* "logical_and_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3949 "type.ec"
	break;
      case 174: /* "logical_or_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3958 "type.ec"
	break;
      case 175: /* "conditional_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3967 "type.ec"
	break;
      case 176: /* "assignment_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3976 "type.ec"
	break;
      case 178: /* "expression" */

/* Line 1009 of yacc.c  */
#line 200 "type.y"
	{ FreeList((yyvaluep->list), FreeExpression); };

/* Line 1009 of yacc.c  */
#line 3985 "type.ec"
	break;
      case 179: /* "constant_expression" */

/* Line 1009 of yacc.c  */
#line 165 "type.y"
	{ FreeExpression((yyvaluep->exp)); };

/* Line 1009 of yacc.c  */
#line 3994 "type.ec"
	break;
      case 180: /* "declaration" */

/* Line 1009 of yacc.c  */
#line 186 "type.y"
	{ FreeDeclaration((yyvaluep->declaration)); };

/* Line 1009 of yacc.c  */
#line 4003 "type.ec"
	break;
      case 181: /* "specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4012 "type.ec"
	break;
      case 182: /* "guess_specifier_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4021 "type.ec"
	break;
      case 183: /* "declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4030 "type.ec"
	break;
      case 184: /* "guess_declaration_specifiers" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4039 "type.ec"
	break;
      case 188: /* "init_declarator_list" */

/* Line 1009 of yacc.c  */
#line 207 "type.y"
	{ FreeList((yyvaluep->list), FreeInitDeclarator); };

/* Line 1009 of yacc.c  */
#line 4048 "type.ec"
	break;
      case 189: /* "init_declarator" */

/* Line 1009 of yacc.c  */
#line 181 "type.y"
	{ FreeInitDeclarator((yyvaluep->initDeclarator)); };

/* Line 1009 of yacc.c  */
#line 4057 "type.ec"
	break;
      case 190: /* "storage_class_specifier" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4066 "type.ec"
	break;
      case 191: /* "ext_decl" */

/* Line 1009 of yacc.c  */
#line 217 "type.y"
	{ FreeExtDecl((yyvaluep->extDecl)); };

/* Line 1009 of yacc.c  */
#line 4075 "type.ec"
	break;
      case 193: /* "attribute_word" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4084 "type.ec"
	break;
      case 194: /* "attribute" */

/* Line 1009 of yacc.c  */
#line 218 "type.y"
	{ FreeAttribute((yyvaluep->attribute)); };

/* Line 1009 of yacc.c  */
#line 4093 "type.ec"
	break;
      case 195: /* "attribs_list" */

/* Line 1009 of yacc.c  */
#line 219 "type.y"
	{ FreeList((yyvaluep->list), FreeAttribute); };

/* Line 1009 of yacc.c  */
#line 4102 "type.ec"
	break;
      case 196: /* "attrib" */

/* Line 1009 of yacc.c  */
#line 216 "type.y"
	{ FreeAttrib((yyvaluep->attrib)); };

/* Line 1009 of yacc.c  */
#line 4111 "type.ec"
	break;
      case 197: /* "ext_storage" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4120 "type.ec"
	break;
      case 198: /* "type_qualifier" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4129 "type.ec"
	break;
      case 199: /* "type_specifier" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4138 "type.ec"
	break;
      case 200: /* "strict_type_specifier" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4147 "type.ec"
	break;
      case 201: /* "struct_or_union_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4156 "type.ec"
	break;
      case 202: /* "struct_or_union_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4165 "type.ec"
	break;
      case 203: /* "template_datatype" */

/* Line 1009 of yacc.c  */
#line 215 "type.y"
	{ FreeTemplateDataType((yyvaluep->templateDatatype)); };

/* Line 1009 of yacc.c  */
#line 4174 "type.ec"
	break;
      case 204: /* "template_type_argument" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4183 "type.ec"
	break;
      case 205: /* "template_expression_argument" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4192 "type.ec"
	break;
      case 206: /* "template_argument" */

/* Line 1009 of yacc.c  */
#line 214 "type.y"
	{ FreeTemplateArgument((yyvaluep->templateArgument)); };

/* Line 1009 of yacc.c  */
#line 4201 "type.ec"
	break;
      case 209: /* "struct_declaration_list" */

/* Line 1009 of yacc.c  */
#line 210 "type.y"
	{ FreeList((yyvaluep->list), FreeClassDef); };

/* Line 1009 of yacc.c  */
#line 4210 "type.ec"
	break;
      case 210: /* "default_property" */

/* Line 1009 of yacc.c  */
#line 190 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4219 "type.ec"
	break;
      case 211: /* "default_property_list" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4228 "type.ec"
	break;
      case 212: /* "property" */

/* Line 1009 of yacc.c  */
#line 198 "type.y"
	{ FreeProperty((yyvaluep->prop)); };

/* Line 1009 of yacc.c  */
#line 4237 "type.ec"
	break;
      case 213: /* "struct_declaration" */

/* Line 1009 of yacc.c  */
#line 196 "type.y"
	{ FreeClassDef((yyvaluep->classDef)); };

/* Line 1009 of yacc.c  */
#line 4246 "type.ec"
	break;
      case 214: /* "struct_declarator_list" */

/* Line 1009 of yacc.c  */
#line 204 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclarator); };

/* Line 1009 of yacc.c  */
#line 4255 "type.ec"
	break;
      case 215: /* "struct_declarator" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4264 "type.ec"
	break;
      case 216: /* "enum_specifier_nocompound" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4273 "type.ec"
	break;
      case 217: /* "enum_specifier_compound" */

/* Line 1009 of yacc.c  */
#line 171 "type.y"
	{ FreeSpecifier((yyvaluep->specifier)); };

/* Line 1009 of yacc.c  */
#line 4282 "type.ec"
	break;
      case 218: /* "enumerator_list" */

/* Line 1009 of yacc.c  */
#line 201 "type.y"
	{ FreeList((yyvaluep->list), FreeEnumerator); };

/* Line 1009 of yacc.c  */
#line 4291 "type.ec"
	break;
      case 219: /* "enumerator" */

/* Line 1009 of yacc.c  */
#line 174 "type.y"
	{ FreeEnumerator((yyvaluep->enumerator)); };

/* Line 1009 of yacc.c  */
#line 4300 "type.ec"
	break;
      case 220: /* "direct_abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4309 "type.ec"
	break;
      case 221: /* "direct_abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4318 "type.ec"
	break;
      case 222: /* "abstract_declarator" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4327 "type.ec"
	break;
      case 223: /* "abstract_declarator_noarray" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4336 "type.ec"
	break;
      case 224: /* "declarator" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4345 "type.ec"
	break;
      case 225: /* "direct_declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4354 "type.ec"
	break;
      case 226: /* "declarator_function" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4363 "type.ec"
	break;
      case 227: /* "direct_declarator_function_start" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4372 "type.ec"
	break;
      case 228: /* "direct_declarator_function" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4381 "type.ec"
	break;
      case 229: /* "direct_declarator" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4390 "type.ec"
	break;
      case 230: /* "declarator_nofunction" */

/* Line 1009 of yacc.c  */
#line 175 "type.y"
	{ FreeDeclarator((yyvaluep->declarator)); };

/* Line 1009 of yacc.c  */
#line 4399 "type.ec"
	break;
      case 231: /* "type_qualifier_list" */

/* Line 1009 of yacc.c  */
#line 202 "type.y"
	{ FreeList((yyvaluep->list), FreeSpecifier); };

/* Line 1009 of yacc.c  */
#line 4408 "type.ec"
	break;
      case 232: /* "pointer" */

/* Line 1009 of yacc.c  */
#line 164 "type.y"
	{ FreePointer((yyvaluep->pointer)); };

/* Line 1009 of yacc.c  */
#line 4417 "type.ec"
	break;
      case 233: /* "parameter_type_list" */

/* Line 1009 of yacc.c  */
#line 208 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4426 "type.ec"
	break;
      case 234: /* "parameter_list" */

/* Line 1009 of yacc.c  */
#line 208 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4435 "type.ec"
	break;
      case 235: /* "parameter_declaration" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4444 "type.ec"
	break;
      case 236: /* "identifier_list" */

/* Line 1009 of yacc.c  */
#line 208 "type.y"
	{ FreeList((yyvaluep->list), FreeTypeName); };

/* Line 1009 of yacc.c  */
#line 4453 "type.ec"
	break;
      case 237: /* "type_name" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4462 "type.ec"
	break;
      case 238: /* "guess_type_name" */

/* Line 1009 of yacc.c  */
#line 182 "type.y"
	{ FreeTypeName((yyvaluep->typeName)); };

/* Line 1009 of yacc.c  */
#line 4471 "type.ec"
	break;
      case 239: /* "initializer" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4480 "type.ec"
	break;
      case 240: /* "initializer_condition" */

/* Line 1009 of yacc.c  */
#line 180 "type.y"
	{ FreeInitializer((yyvaluep->initializer)); };

/* Line 1009 of yacc.c  */
#line 4489 "type.ec"
	break;
      case 241: /* "initializer_list" */

/* Line 1009 of yacc.c  */
#line 206 "type.y"
	{ FreeList((yyvaluep->list), FreeInitializer); };

/* Line 1009 of yacc.c  */
#line 4498 "type.ec"
	break;
      case 242: /* "statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4507 "type.ec"
	break;
      case 243: /* "labeled_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4516 "type.ec"
	break;
      case 244: /* "declaration_list" */

/* Line 1009 of yacc.c  */
#line 205 "type.y"
	{ FreeList((yyvaluep->list), FreeDeclaration); };

/* Line 1009 of yacc.c  */
#line 4525 "type.ec"
	break;
      case 245: /* "statement_list" */

/* Line 1009 of yacc.c  */
#line 209 "type.y"
	{ FreeList((yyvaluep->list), FreeStatement); };

/* Line 1009 of yacc.c  */
#line 4534 "type.ec"
	break;
      case 246: /* "compound_inside" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4543 "type.ec"
	break;
      case 247: /* "compound_start" */

/* Line 1009 of yacc.c  */
#line 213 "type.y"
	{ PopContext((yyvaluep->context)); FreeContext((yyvaluep->context)); delete (yyvaluep->context); };

/* Line 1009 of yacc.c  */
#line 4552 "type.ec"
	break;
      case 248: /* "compound_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4561 "type.ec"
	break;
      case 249: /* "expression_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4570 "type.ec"
	break;
      case 250: /* "selection_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4579 "type.ec"
	break;
      case 251: /* "iteration_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4588 "type.ec"
	break;
      case 252: /* "jump_statement" */

/* Line 1009 of yacc.c  */
#line 183 "type.y"
	{ FreeStatement((yyvaluep->stmt)); };

/* Line 1009 of yacc.c  */
#line 4597 "type.ec"
	break;
      case 253: /* "string_literal" */

/* Line 1009 of yacc.c  */
#line 197 "type.y"
	{ delete (yyvaluep->string); };

/* Line 1009 of yacc.c  */
#line 4606 "type.ec"
	break;
      case 254: /* "instantiation_named" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4615 "type.ec"
	break;
      case 256: /* "instantiation_unnamed" */

/* Line 1009 of yacc.c  */
#line 188 "type.y"
	{ FreeInstance((yyvaluep->instance)); };

/* Line 1009 of yacc.c  */
#line 4624 "type.ec"
	break;
      case 258: /* "class_function_definition" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4633 "type.ec"
	break;
      case 259: /* "instance_class_function_definition_start" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4642 "type.ec"
	break;
      case 260: /* "instance_class_function_definition" */

/* Line 1009 of yacc.c  */
#line 192 "type.y"
	{ FreeClassFunction((yyvaluep->classFunction)); };

/* Line 1009 of yacc.c  */
#line 4651 "type.ec"
	break;
      case 261: /* "data_member_initialization" */

/* Line 1009 of yacc.c  */
#line 190 "type.y"
	{ FreeMemberInit((yyvaluep->memberInit)); };

/* Line 1009 of yacc.c  */
#line 4660 "type.ec"
	break;
      case 262: /* "data_member_initialization_list" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4669 "type.ec"
	break;
      case 263: /* "data_member_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 211 "type.y"
	{ FreeList((yyvaluep->list), FreeMemberInit); };

/* Line 1009 of yacc.c  */
#line 4678 "type.ec"
	break;
      case 264: /* "members_initialization_list_coloned" */

/* Line 1009 of yacc.c  */
#line 212 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4687 "type.ec"
	break;
      case 265: /* "members_initialization_list" */

/* Line 1009 of yacc.c  */
#line 212 "type.y"
	{ FreeList((yyvaluep->list), FreeMembersInit); };

/* Line 1009 of yacc.c  */
#line 4696 "type.ec"
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
#line 227 "type.y"
    {
      (yyval.specifier) = null;
      DeclClass(0, (yyvsp[(1) - (2)].id).string);
      fileInput.Seek((yylsp[(1) - (2)]).start.pos, start);
      resetScannerPos(&(yylsp[(1) - (2)]).start);
      yyclearin;

      FreeIdentifier((yyvsp[(1) - (2)].id));

      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   ;}
    break;

  case 3:

/* Line 1464 of yacc.c  */
#line 245 "type.y"
    {
      (yyval.specifier) = null;
   #ifdef PRECOMPILER
      // if($1._class && !$1._class.name)
      if((yyvsp[(1) - (2)].id)._class)
      {
         char name[1024];
         strcpy(name,  (yyvsp[(1) - (2)].id)._class.name ? (yyvsp[(1) - (2)].id)._class.name : "");
         strcat(name, "::");
         strcat(name, (yyvsp[(1) - (2)].id).string);
         _DeclClass(0, name);
      }
      else
         _DeclClass(0, (yyvsp[(1) - (2)].id).string);

      FreeIdentifier((yyvsp[(1) - (2)].id));

      fileInput.Seek((yylsp[(1) - (2)]).start.pos, start);
      resetScannerPos(&(yylsp[(1) - (2)]).start);
      yyclearin;

      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   #endif
   ;}
    break;

  case 4:

/* Line 1464 of yacc.c  */
#line 279 "type.y"
    {
      DeclClass(0, (yyvsp[(1) - (2)].id).string);
      fileInput.Seek((yylsp[(1) - (2)]).start.pos, start);
      parseTypeError = 0;
      resetScannerPos(&(yylsp[(1) - (2)]).start);
      yyclearin;
      FreeIdentifier((yyvsp[(1) - (2)].id));

      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   ;}
    break;

  case 5:

/* Line 1464 of yacc.c  */
#line 328 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 6:

/* Line 1464 of yacc.c  */
#line 330 "type.y"
    {
   #ifdef PRECOMPILER
      DeclClass(0, (yyvsp[(1) - (2)].id).string);
      fileInput.Seek((yylsp[(1) - (2)]).start.pos, start);
      resetScannerPos(&(yylsp[(1) - (2)]).start);
      yyclearin;

      FreeIdentifier((yyvsp[(1) - (2)].id));
      FreeIdentifier((yyvsp[(2) - (2)].id));

      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      YYPOPSTACK(1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
      goto yysetstate;
   #else
      Location tmpLoc = yylloc; (yyval.specifier) = (yyvsp[(2) - (2)].id); yylloc = (yylsp[(1) - (2)]);
      Compiler_Error($"Not a type: %s\n", (yyvsp[(1) - (2)].id).string);
      yylloc = tmpLoc; (yyvsp[(2) - (2)].id).badID = (yyvsp[(1) - (2)].id); // FreeIdentifier($1);
   #endif
   ;}
    break;

  case 7:

/* Line 1464 of yacc.c  */
#line 356 "type.y"
    { (yyval.specifier) = MkSpecifierName(yytext); ;}
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 361 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (4)].specifier); SetClassTemplateArgs((yyval.specifier), (yyvsp[(3) - (4)].list)); (yyval.specifier).loc = (yyloc); ;}
    break;

  case 10:

/* Line 1464 of yacc.c  */
#line 363 "type.y"
    {
      (yyval.specifier) = (yyvsp[(1) - (4)].specifier);
      SetClassTemplateArgs((yyval.specifier), (yyvsp[(3) - (4)].list));
      (yyval.specifier).loc = (yyloc);

      (yylsp[(4) - (4)]).end.pos--;
      fileInput.Seek((yylsp[(4) - (4)]).end.pos, start);
      resetScannerPos(&(yylsp[(4) - (4)]).end);
      yyclearin;
    ;}
    break;

  case 11:

/* Line 1464 of yacc.c  */
#line 380 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 12:

/* Line 1464 of yacc.c  */
#line 382 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(1) - (1)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 13:

/* Line 1464 of yacc.c  */
#line 387 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isConstructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(1) - (3)].list), FreeSpecifier); ;}
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 392 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, null, null); (yyval.classFunction).isDestructor = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; FreeList /*FreeSpecifier*/((yyvsp[(2) - (4)].list), FreeSpecifier); ;}
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 397 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(2) - (3)].list), null, (yyvsp[(3) - (3)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 399 "type.y"
    { (yyval.classFunction) = MkClassFunction(null, null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).isVirtual = true; (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 404 "type.y"
    { (yyval.id) = MkIdentifier(yytext); (yyval.id).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 19:

/* Line 1464 of yacc.c  */
#line 410 "type.y"
    { (yyval.exp) = MkExpBrackets((yyvsp[(2) - (3)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 20:

/* Line 1464 of yacc.c  */
#line 415 "type.y"
    { (yyval.exp) = MkExpIdentifier((yyvsp[(1) - (1)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 21:

/* Line 1464 of yacc.c  */
#line 417 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 22:

/* Line 1464 of yacc.c  */
#line 419 "type.y"
    { (yyval.exp) = MkExpConstant(yytext); (yyval.exp).loc = (yyloc); ;}
    break;

  case 23:

/* Line 1464 of yacc.c  */
#line 421 "type.y"
    { (yyval.exp) = MkExpString((yyvsp[(1) - (1)].string)); delete (yyvsp[(1) - (1)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 422 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(2) - (2)].string), null); delete (yyvsp[(2) - (2)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 423 "type.y"
    { (yyval.exp) = MkExpIntlString((yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); delete (yyvsp[(2) - (4)].string); delete (yyvsp[(4) - (4)].string); (yyval.exp).loc = (yyloc); ;}
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 425 "type.y"
    { Expression exp = MkExpDummy(); exp.loc.start = (yylsp[(1) - (2)]).end; exp.loc.end = (yylsp[(2) - (2)]).start; (yyval.exp) = MkExpBrackets(MkListOne(exp)); (yyval.exp).loc = (yyloc); yyerror(); ;}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 427 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 28:

/* Line 1464 of yacc.c  */
#line 428 "type.y"
    { (yyval.exp) = MkExpNew(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 29:

/* Line 1464 of yacc.c  */
#line 429 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (6)].list),(yyvsp[(3) - (6)].declarator)), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 30:

/* Line 1464 of yacc.c  */
#line 430 "type.y"
    { (yyval.exp) = MkExpNew0(MkTypeName((yyvsp[(2) - (5)].list),null), (yyvsp[(4) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 31:

/* Line 1464 of yacc.c  */
#line 431 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 432 "type.y"
    { (yyval.exp) = MkExpRenew((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 433 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (7)].exp), MkTypeName((yyvsp[(3) - (7)].list),(yyvsp[(4) - (7)].declarator)), (yyvsp[(6) - (7)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 434 "type.y"
    { (yyval.exp) = MkExpRenew0((yyvsp[(2) - (6)].exp), MkTypeName((yyvsp[(3) - (6)].list),null), (yyvsp[(5) - (6)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 435 "type.y"
    { (yyval.exp) = MkExpDummy(); ;}
    break;

  case 37:

/* Line 1464 of yacc.c  */
#line 440 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 38:

/* Line 1464 of yacc.c  */
#line 441 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 442 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 443 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 444 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 42:

/* Line 1464 of yacc.c  */
#line 445 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 43:

/* Line 1464 of yacc.c  */
#line 446 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 44:

/* Line 1464 of yacc.c  */
#line 450 "type.y"
    { (yyval.exp) = MkExpInstance((yyvsp[(1) - (1)].instance)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 46:

/* Line 1464 of yacc.c  */
#line 456 "type.y"
    { (yyval.exp) = MkExpIndex((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 457 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (3)].exp), MkList()); (yyval.exp).call.argLoc.start = (yylsp[(2) - (3)]).start; (yyval.exp).call.argLoc.end = (yylsp[(3) - (3)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 458 "type.y"
    { (yyval.exp) = MkExpCall((yyvsp[(1) - (4)].exp), (yyvsp[(3) - (4)].list)); (yyval.exp).call.argLoc.start = (yylsp[(2) - (4)]).start; (yyval.exp).call.argLoc.end = (yylsp[(4) - (4)]).end; (yyval.exp).loc = (yyloc); ;}
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 459 "type.y"
    { (yyval.exp) = MkExpMember((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 460 "type.y"
    { (yyval.exp) = MkExpPointer((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].id)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 51:

/* Line 1464 of yacc.c  */
#line 461 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), INC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 52:

/* Line 1464 of yacc.c  */
#line 462 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), DEC_OP, null); (yyval.exp).loc = (yyloc); ;}
    break;

  case 53:

/* Line 1464 of yacc.c  */
#line 466 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 54:

/* Line 1464 of yacc.c  */
#line 467 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 468 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 56:

/* Line 1464 of yacc.c  */
#line 469 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp));  ;}
    break;

  case 57:

/* Line 1464 of yacc.c  */
#line 473 "type.y"
    { (yyval.exp) = MkExpOp(null, INC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 58:

/* Line 1464 of yacc.c  */
#line 474 "type.y"
    { (yyval.exp) = MkExpOp(null, DEC_OP, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 59:

/* Line 1464 of yacc.c  */
#line 475 "type.y"
    { (yyval.exp) = MkExpOp(null, (yyvsp[(1) - (2)].i), (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 476 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 61:

/* Line 1464 of yacc.c  */
#line 477 "type.y"
    { (yyval.exp) = MkExpOp(null, SIZEOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 62:

/* Line 1464 of yacc.c  */
#line 478 "type.y"
    { (yyval.exp) = MkExpTypeSize((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 63:

/* Line 1464 of yacc.c  */
#line 479 "type.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(3) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 64:

/* Line 1464 of yacc.c  */
#line 480 "type.y"
    { (yyval.exp) = MkExpOp(null, ALIGNOF, (yyvsp[(2) - (2)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 65:

/* Line 1464 of yacc.c  */
#line 481 "type.y"
    { (yyval.exp) = MkExpTypeAlign((yyvsp[(3) - (4)].typeName)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 70:

/* Line 1464 of yacc.c  */
#line 495 "type.y"
    { (yyval.i) = '&'; ;}
    break;

  case 71:

/* Line 1464 of yacc.c  */
#line 496 "type.y"
    { (yyval.i) = '*'; ;}
    break;

  case 72:

/* Line 1464 of yacc.c  */
#line 497 "type.y"
    { (yyval.i) = '+'; ;}
    break;

  case 73:

/* Line 1464 of yacc.c  */
#line 498 "type.y"
    { (yyval.i) = '-'; ;}
    break;

  case 74:

/* Line 1464 of yacc.c  */
#line 499 "type.y"
    { (yyval.i) = '~'; ;}
    break;

  case 75:

/* Line 1464 of yacc.c  */
#line 500 "type.y"
    { (yyval.i) = '!'; ;}
    break;

  case 76:

/* Line 1464 of yacc.c  */
#line 501 "type.y"
    { (yyval.i) = DELETE; ;}
    break;

  case 78:

/* Line 1464 of yacc.c  */
#line 506 "type.y"
    { (yyval.exp) = MkExpCast((yyvsp[(2) - (4)].typeName), (yyvsp[(4) - (4)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 80:

/* Line 1464 of yacc.c  */
#line 511 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '*', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 81:

/* Line 1464 of yacc.c  */
#line 512 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '/', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 82:

/* Line 1464 of yacc.c  */
#line 513 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '%', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 84:

/* Line 1464 of yacc.c  */
#line 518 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '+', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 85:

/* Line 1464 of yacc.c  */
#line 519 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '-', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 87:

/* Line 1464 of yacc.c  */
#line 524 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LEFT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 88:

/* Line 1464 of yacc.c  */
#line 525 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), RIGHT_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 89:

/* Line 1464 of yacc.c  */
#line 530 "type.y"
    {
      (yyval.exp) = (yyvsp[(1) - (2)].exp);
      skipErrors = true;
   ;}
    break;

  case 91:

/* Line 1464 of yacc.c  */
#line 538 "type.y"
    { skipErrors = false; (yyval.exp) = MkExpOp((yyvsp[(1) - (2)].exp), '<', (yyvsp[(2) - (2)].exp)/*$3*/); (yyval.exp).loc = (yyloc); ;}
    break;

  case 92:

/* Line 1464 of yacc.c  */
#line 539 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '>', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 93:

/* Line 1464 of yacc.c  */
#line 540 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), LE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 94:

/* Line 1464 of yacc.c  */
#line 541 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), GE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 96:

/* Line 1464 of yacc.c  */
#line 546 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), EQ_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 97:

/* Line 1464 of yacc.c  */
#line 547 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), NE_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 99:

/* Line 1464 of yacc.c  */
#line 552 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '&', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 101:

/* Line 1464 of yacc.c  */
#line 557 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '^', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 103:

/* Line 1464 of yacc.c  */
#line 562 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), '|', (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 105:

/* Line 1464 of yacc.c  */
#line 567 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), AND_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 107:

/* Line 1464 of yacc.c  */
#line 572 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), OR_OP, (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 109:

/* Line 1464 of yacc.c  */
#line 577 "type.y"
    { (yyval.exp) = MkExpCondition((yyvsp[(1) - (5)].exp), (yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 111:

/* Line 1464 of yacc.c  */
#line 582 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 112:

/* Line 1464 of yacc.c  */
#line 583 "type.y"
    { (yyval.exp) = MkExpOp((yyvsp[(1) - (3)].exp), (yyvsp[(2) - (3)].i), (yyvsp[(3) - (3)].exp)); (yyval.exp).loc = (yyloc); ;}
    break;

  case 113:

/* Line 1464 of yacc.c  */
#line 587 "type.y"
    { (yyval.i) = '='; ;}
    break;

  case 114:

/* Line 1464 of yacc.c  */
#line 588 "type.y"
    { (yyval.i) = MUL_ASSIGN; ;}
    break;

  case 115:

/* Line 1464 of yacc.c  */
#line 589 "type.y"
    { (yyval.i) = DIV_ASSIGN; ;}
    break;

  case 116:

/* Line 1464 of yacc.c  */
#line 590 "type.y"
    { (yyval.i) = MOD_ASSIGN; ;}
    break;

  case 117:

/* Line 1464 of yacc.c  */
#line 591 "type.y"
    { (yyval.i) = ADD_ASSIGN; ;}
    break;

  case 118:

/* Line 1464 of yacc.c  */
#line 592 "type.y"
    { (yyval.i) = SUB_ASSIGN; ;}
    break;

  case 119:

/* Line 1464 of yacc.c  */
#line 593 "type.y"
    { (yyval.i) = LEFT_ASSIGN; ;}
    break;

  case 120:

/* Line 1464 of yacc.c  */
#line 594 "type.y"
    { (yyval.i) = RIGHT_ASSIGN; ;}
    break;

  case 121:

/* Line 1464 of yacc.c  */
#line 595 "type.y"
    { (yyval.i) = AND_ASSIGN; ;}
    break;

  case 122:

/* Line 1464 of yacc.c  */
#line 596 "type.y"
    { (yyval.i) = XOR_ASSIGN; ;}
    break;

  case 123:

/* Line 1464 of yacc.c  */
#line 597 "type.y"
    { (yyval.i) = OR_ASSIGN; ;}
    break;

  case 124:

/* Line 1464 of yacc.c  */
#line 601 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].exp)); ;}
    break;

  case 125:

/* Line 1464 of yacc.c  */
#line 602 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 127:

/* Line 1464 of yacc.c  */
#line 610 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (2)].list), null); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 128:

/* Line 1464 of yacc.c  */
#line 611 "type.y"
    { (yyval.declaration) = MkDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 129:

/* Line 1464 of yacc.c  */
#line 612 "type.y"
    { (yyval.declaration) = MkDeclarationInst((yyvsp[(1) - (2)].instance)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 130:

/* Line 1464 of yacc.c  */
#line 613 "type.y"
    { (yyval.declaration) = MkDeclarationDefine((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].exp)); (yyval.declaration).loc = (yyloc); ;}
    break;

  case 131:

/* Line 1464 of yacc.c  */
#line 617 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 132:

/* Line 1464 of yacc.c  */
#line 618 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 133:

/* Line 1464 of yacc.c  */
#line 619 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 134:

/* Line 1464 of yacc.c  */
#line 620 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 135:

/* Line 1464 of yacc.c  */
#line 621 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 136:

/* Line 1464 of yacc.c  */
#line 622 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 137:

/* Line 1464 of yacc.c  */
#line 623 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 138:

/* Line 1464 of yacc.c  */
#line 624 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 139:

/* Line 1464 of yacc.c  */
#line 628 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 140:

/* Line 1464 of yacc.c  */
#line 629 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 141:

/* Line 1464 of yacc.c  */
#line 630 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 142:

/* Line 1464 of yacc.c  */
#line 631 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 143:

/* Line 1464 of yacc.c  */
#line 632 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 144:

/* Line 1464 of yacc.c  */
#line 633 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 145:

/* Line 1464 of yacc.c  */
#line 634 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 146:

/* Line 1464 of yacc.c  */
#line 635 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 147:

/* Line 1464 of yacc.c  */
#line 636 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 148:

/* Line 1464 of yacc.c  */
#line 637 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 149:

/* Line 1464 of yacc.c  */
#line 641 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 150:

/* Line 1464 of yacc.c  */
#line 642 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 151:

/* Line 1464 of yacc.c  */
#line 643 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 152:

/* Line 1464 of yacc.c  */
#line 644 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 153:

/* Line 1464 of yacc.c  */
#line 645 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 154:

/* Line 1464 of yacc.c  */
#line 646 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 155:

/* Line 1464 of yacc.c  */
#line 647 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 156:

/* Line 1464 of yacc.c  */
#line 648 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 157:

/* Line 1464 of yacc.c  */
#line 649 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 158:

/* Line 1464 of yacc.c  */
#line 650 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 159:

/* Line 1464 of yacc.c  */
#line 654 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 160:

/* Line 1464 of yacc.c  */
#line 655 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 161:

/* Line 1464 of yacc.c  */
#line 656 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 162:

/* Line 1464 of yacc.c  */
#line 657 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 163:

/* Line 1464 of yacc.c  */
#line 658 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 164:

/* Line 1464 of yacc.c  */
#line 659 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 165:

/* Line 1464 of yacc.c  */
#line 660 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 166:

/* Line 1464 of yacc.c  */
#line 661 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 167:

/* Line 1464 of yacc.c  */
#line 662 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 168:

/* Line 1464 of yacc.c  */
#line 663 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 169:

/* Line 1464 of yacc.c  */
#line 664 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 170:

/* Line 1464 of yacc.c  */
#line 665 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 171:

/* Line 1464 of yacc.c  */
#line 669 "type.y"
    { (yyval.list) = (yyvsp[(1) - (1)].list); ;}
    break;

  case 172:

/* Line 1464 of yacc.c  */
#line 670 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 173:

/* Line 1464 of yacc.c  */
#line 674 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 174:

/* Line 1464 of yacc.c  */
#line 675 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 175:

/* Line 1464 of yacc.c  */
#line 676 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 176:

/* Line 1464 of yacc.c  */
#line 677 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 177:

/* Line 1464 of yacc.c  */
#line 678 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 178:

/* Line 1464 of yacc.c  */
#line 679 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 179:

/* Line 1464 of yacc.c  */
#line 680 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 180:

/* Line 1464 of yacc.c  */
#line 681 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id)); ;}
    break;

  case 181:

/* Line 1464 of yacc.c  */
#line 683 "type.y"
    {
         // if($1._class && !$1._class.name)
         if((yyvsp[(1) - (4)].id)._class)
         {
            char name[1024];
            strcpy(name,  (yyvsp[(1) - (4)].id)._class.name ? (yyvsp[(1) - (4)].id)._class.name : "");
            strcat(name, "::");
            strcat(name, (yyvsp[(1) - (4)].id).string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[(1) - (4)].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[(1) - (4)].id).string, (yyvsp[(3) - (4)].list)));
         FreeIdentifier((yyvsp[(1) - (4)].id));
      ;}
    break;

  case 182:

/* Line 1464 of yacc.c  */
#line 701 "type.y"
    {
         if((yyvsp[(2) - (5)].id)._class && !(yyvsp[(2) - (5)].id)._class.name)
         {
            char name[1024];
            strcpy(name, "::");
            strcat(name, (yyvsp[(2) - (5)].id).string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[(2) - (5)].id).string);
         ListAdd((yyvsp[(1) - (5)].list), MkSpecifierNameArgs((yyvsp[(2) - (5)].id).string, (yyvsp[(4) - (5)].list)));
         FreeIdentifier((yyvsp[(2) - (5)].id));
      ;}
    break;

  case 183:

/* Line 1464 of yacc.c  */
#line 717 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 184:

/* Line 1464 of yacc.c  */
#line 718 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 185:

/* Line 1464 of yacc.c  */
#line 719 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 186:

/* Line 1464 of yacc.c  */
#line 720 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 187:

/* Line 1464 of yacc.c  */
#line 721 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 188:

/* Line 1464 of yacc.c  */
#line 722 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 189:

/* Line 1464 of yacc.c  */
#line 723 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 190:

/* Line 1464 of yacc.c  */
#line 724 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 191:

/* Line 1464 of yacc.c  */
#line 725 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 192:

/* Line 1464 of yacc.c  */
#line 726 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 193:

/* Line 1464 of yacc.c  */
#line 727 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkSpecifierName((yyvsp[(1) - (1)].id).string)); FreeIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 194:

/* Line 1464 of yacc.c  */
#line 728 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), MkSpecifierName((yyvsp[(2) - (2)].id).string)); FreeIdentifier((yyvsp[(2) - (2)].id));}
    break;

  case 195:

/* Line 1464 of yacc.c  */
#line 730 "type.y"
    {
         // if($1._class && !$1._class.name)
         if((yyvsp[(1) - (4)].id)._class)
         {
            char name[1024];
            strcpy(name,  (yyvsp[(1) - (4)].id)._class.name ? (yyvsp[(1) - (4)].id)._class.name : "");
            strcat(name, "::");
            strcat(name, (yyvsp[(1) - (4)].id).string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[(1) - (4)].id).string);

         (yyval.list) = MkList();
         ListAdd((yyval.list), MkSpecifierNameArgs((yyvsp[(1) - (4)].id).string, (yyvsp[(3) - (4)].list)));
         FreeIdentifier((yyvsp[(1) - (4)].id));
      ;}
    break;

  case 196:

/* Line 1464 of yacc.c  */
#line 748 "type.y"
    {
         if((yyvsp[(2) - (5)].id)._class && !(yyvsp[(2) - (5)].id)._class.name)
         {
            char name[1024];
            strcpy(name, "::");
            strcat(name, (yyvsp[(2) - (5)].id).string);
            _DeclClass(0, name);
         }
         else
            _DeclClass(0, (yyvsp[(2) - (5)].id).string);
         ListAdd((yyvsp[(1) - (5)].list), MkSpecifierNameArgs((yyvsp[(2) - (5)].id).string, (yyvsp[(4) - (5)].list)));
         FreeIdentifier((yyvsp[(2) - (5)].id));
      ;}
    break;

  case 197:

/* Line 1464 of yacc.c  */
#line 764 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initDeclarator)); ;}
    break;

  case 198:

/* Line 1464 of yacc.c  */
#line 765 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initDeclarator)); ;}
    break;

  case 199:

/* Line 1464 of yacc.c  */
#line 769 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.initDeclarator).loc = (yyloc); ;}
    break;

  case 200:

/* Line 1464 of yacc.c  */
#line 770 "type.y"
    { (yyval.initDeclarator) = MkInitDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].initializer)); (yyval.initDeclarator).loc = (yyloc); (yyval.initDeclarator).initializer.loc.start = (yylsp[(2) - (3)]).end; ;}
    break;

  case 201:

/* Line 1464 of yacc.c  */
#line 774 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPEDEF); ;}
    break;

  case 202:

/* Line 1464 of yacc.c  */
#line 775 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTERN); ;}
    break;

  case 203:

/* Line 1464 of yacc.c  */
#line 776 "type.y"
    { (yyval.specifier) = MkSpecifier(STATIC); ;}
    break;

  case 204:

/* Line 1464 of yacc.c  */
#line 777 "type.y"
    { (yyval.specifier) = MkSpecifier(AUTO); ;}
    break;

  case 205:

/* Line 1464 of yacc.c  */
#line 778 "type.y"
    { (yyval.specifier) = MkSpecifier(REGISTER); ;}
    break;

  case 206:

/* Line 1464 of yacc.c  */
#line 782 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 207:

/* Line 1464 of yacc.c  */
#line 783 "type.y"
    { (yyval.extDecl) = MkExtDeclString(CopyString(yytext)); ;}
    break;

  case 208:

/* Line 1464 of yacc.c  */
#line 784 "type.y"
    { (yyval.extDecl) = MkExtDeclAttrib((yyvsp[(1) - (1)].attrib)); ;}
    break;

  case 209:

/* Line 1464 of yacc.c  */
#line 788 "type.y"
    { (yyval.i) = ATTRIB; ;}
    break;

  case 210:

/* Line 1464 of yacc.c  */
#line 789 "type.y"
    { (yyval.i) = ATTRIB_DEP; ;}
    break;

  case 211:

/* Line 1464 of yacc.c  */
#line 790 "type.y"
    { (yyval.i) = __ATTRIB; ;}
    break;

  case 212:

/* Line 1464 of yacc.c  */
#line 795 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 213:

/* Line 1464 of yacc.c  */
#line 796 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 214:

/* Line 1464 of yacc.c  */
#line 797 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 215:

/* Line 1464 of yacc.c  */
#line 798 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 216:

/* Line 1464 of yacc.c  */
#line 799 "type.y"
    { (yyval.string)  = CopyString(yytext); ;}
    break;

  case 217:

/* Line 1464 of yacc.c  */
#line 803 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (1)].string), null); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 218:

/* Line 1464 of yacc.c  */
#line 804 "type.y"
    { (yyval.attribute) = MkAttribute((yyvsp[(1) - (4)].string), MkExpBrackets((yyvsp[(3) - (4)].list))); (yyval.attribute).loc = (yyloc); ;}
    break;

  case 219:

/* Line 1464 of yacc.c  */
#line 808 "type.y"
    { (yyval.list) = MkListOne((yyvsp[(1) - (1)].attribute)); ;}
    break;

  case 220:

/* Line 1464 of yacc.c  */
#line 809 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].attribute)); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 221:

/* Line 1464 of yacc.c  */
#line 810 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].attribute)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 222:

/* Line 1464 of yacc.c  */
#line 814 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (6)].i), (yyvsp[(4) - (6)].list)); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 223:

/* Line 1464 of yacc.c  */
#line 815 "type.y"
    { (yyval.attrib) = MkAttrib((yyvsp[(1) - (5)].i), null); (yyval.attrib).loc = (yyloc); ;}
    break;

  case 224:

/* Line 1464 of yacc.c  */
#line 819 "type.y"
    { (yyval.specifier) = MkSpecifierExtended((yyvsp[(1) - (1)].extDecl)); ;}
    break;

  case 225:

/* Line 1464 of yacc.c  */
#line 823 "type.y"
    { (yyval.specifier) = MkSpecifier(CONST); ;}
    break;

  case 226:

/* Line 1464 of yacc.c  */
#line 824 "type.y"
    { (yyval.specifier) = MkSpecifier(VOLATILE); ;}
    break;

  case 227:

/* Line 1464 of yacc.c  */
#line 825 "type.y"
    { (yyval.specifier) = (yyvsp[(1) - (1)].specifier); ;}
    break;

  case 228:

/* Line 1464 of yacc.c  */
#line 830 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 229:

/* Line 1464 of yacc.c  */
#line 831 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 230:

/* Line 1464 of yacc.c  */
#line 832 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 231:

/* Line 1464 of yacc.c  */
#line 833 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 232:

/* Line 1464 of yacc.c  */
#line 834 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 233:

/* Line 1464 of yacc.c  */
#line 835 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 234:

/* Line 1464 of yacc.c  */
#line 836 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 235:

/* Line 1464 of yacc.c  */
#line 837 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 236:

/* Line 1464 of yacc.c  */
#line 838 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 237:

/* Line 1464 of yacc.c  */
#line 839 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 238:

/* Line 1464 of yacc.c  */
#line 840 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 239:

/* Line 1464 of yacc.c  */
#line 841 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 240:

/* Line 1464 of yacc.c  */
#line 842 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 241:

/* Line 1464 of yacc.c  */
#line 843 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 242:

/* Line 1464 of yacc.c  */
#line 844 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 246:

/* Line 1464 of yacc.c  */
#line 848 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 247:

/* Line 1464 of yacc.c  */
#line 849 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 248:

/* Line 1464 of yacc.c  */
#line 850 "type.y"
    { _DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 249:

/* Line 1464 of yacc.c  */
#line 851 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 250:

/* Line 1464 of yacc.c  */
#line 852 "type.y"
    { (yyval.specifier) = MkSpecifier(TYPED_OBJECT); ;}
    break;

  case 251:

/* Line 1464 of yacc.c  */
#line 853 "type.y"
    { (yyval.specifier) = MkSpecifier(ANY_OBJECT); ;}
    break;

  case 252:

/* Line 1464 of yacc.c  */
#line 857 "type.y"
    { (yyval.specifier) = MkSpecifier(VOID); ;}
    break;

  case 253:

/* Line 1464 of yacc.c  */
#line 858 "type.y"
    { (yyval.specifier) = MkSpecifier(CHAR); ;}
    break;

  case 254:

/* Line 1464 of yacc.c  */
#line 859 "type.y"
    { (yyval.specifier) = MkSpecifier(SHORT); ;}
    break;

  case 255:

/* Line 1464 of yacc.c  */
#line 860 "type.y"
    { (yyval.specifier) = MkSpecifier(INT); ;}
    break;

  case 256:

/* Line 1464 of yacc.c  */
#line 861 "type.y"
    { (yyval.specifier) = MkSpecifier(UINT); ;}
    break;

  case 257:

/* Line 1464 of yacc.c  */
#line 862 "type.y"
    { (yyval.specifier) = MkSpecifier(INT64); ;}
    break;

  case 258:

/* Line 1464 of yacc.c  */
#line 863 "type.y"
    { (yyval.specifier) = MkSpecifier(VALIST); ;}
    break;

  case 259:

/* Line 1464 of yacc.c  */
#line 864 "type.y"
    { (yyval.specifier) = MkSpecifier(LONG); ;}
    break;

  case 260:

/* Line 1464 of yacc.c  */
#line 865 "type.y"
    { (yyval.specifier) = MkSpecifier(FLOAT); ;}
    break;

  case 261:

/* Line 1464 of yacc.c  */
#line 866 "type.y"
    { (yyval.specifier) = MkSpecifier(DOUBLE); ;}
    break;

  case 262:

/* Line 1464 of yacc.c  */
#line 867 "type.y"
    { (yyval.specifier) = MkSpecifier(SIGNED); ;}
    break;

  case 263:

/* Line 1464 of yacc.c  */
#line 868 "type.y"
    { (yyval.specifier) = MkSpecifier(UNSIGNED); ;}
    break;

  case 264:

/* Line 1464 of yacc.c  */
#line 869 "type.y"
    { (yyval.specifier) = MkSpecifier(EXTENSION); ;}
    break;

  case 265:

/* Line 1464 of yacc.c  */
#line 870 "type.y"
    { (yyval.specifier) = MkSpecifier(_BOOL); ;}
    break;

  case 266:

/* Line 1464 of yacc.c  */
#line 871 "type.y"
    { (yyval.specifier) = MkSpecifier(BOOL); ;}
    break;

  case 270:

/* Line 1464 of yacc.c  */
#line 875 "type.y"
    { (yyval.specifier) = MkSpecifierTypeOf((yyvsp[(3) - (4)].exp)); ;}
    break;

  case 271:

/* Line 1464 of yacc.c  */
#line 876 "type.y"
    { (yyval.specifier) = MkSpecifierSubClass((yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 272:

/* Line 1464 of yacc.c  */
#line 877 "type.y"
    { _DeclClass(0, (yyvsp[(3) - (4)].id).string); (yyval.specifier) = MkSpecifierSubClass(MkSpecifierName((yyvsp[(3) - (4)].id).string)); FreeIdentifier((yyvsp[(3) - (4)].id)); ;}
    break;

  case 273:

/* Line 1464 of yacc.c  */
#line 878 "type.y"
    { (yyval.specifier) = MkSpecifier(THISCLASS); ;}
    break;

  case 274:

/* Line 1464 of yacc.c  */
#line 883 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 275:

/* Line 1464 of yacc.c  */
#line 884 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 276:

/* Line 1464 of yacc.c  */
#line 885 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), (yyvsp[(2) - (4)].id), null); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (4)].id).string); ;}
    break;

  case 277:

/* Line 1464 of yacc.c  */
#line 886 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), null, null); ;}
    break;

  case 278:

/* Line 1464 of yacc.c  */
#line 888 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 279:

/* Line 1464 of yacc.c  */
#line 890 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), (yyvsp[(3) - (6)].id), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].id).string); ;}
    break;

  case 280:

/* Line 1464 of yacc.c  */
#line 891 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), null, (yyvsp[(4) - (5)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); ;}
    break;

  case 281:

/* Line 1464 of yacc.c  */
#line 892 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (5)].specifierType), (yyvsp[(3) - (5)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (5)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (5)].id).string); ;}
    break;

  case 282:

/* Line 1464 of yacc.c  */
#line 893 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (4)].specifierType), null, null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (4)].extDecl); ;}
    break;

  case 283:

/* Line 1464 of yacc.c  */
#line 895 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (6)].specifierType), MkIdentifier((yyvsp[(3) - (6)].specifier).name), (yyvsp[(5) - (6)].list)); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (6)].extDecl); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(3) - (6)].specifier).name); FreeSpecifier((yyvsp[(3) - (6)].specifier)); ;}
    break;

  case 284:

/* Line 1464 of yacc.c  */
#line 899 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), (yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 285:

/* Line 1464 of yacc.c  */
#line 901 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (2)].specifierType), MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 286:

/* Line 1464 of yacc.c  */
#line 904 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), (yyvsp[(3) - (3)].id), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl);if(declMode) DeclClass(0, (yyvsp[(3) - (3)].id).string); ;}
    break;

  case 287:

/* Line 1464 of yacc.c  */
#line 906 "type.y"
    { (yyval.specifier) = MkStructOrUnion((yyvsp[(1) - (3)].specifierType), MkIdentifier((yyvsp[(3) - (3)].specifier).name), null); (yyval.specifier).extDeclStruct = (yyvsp[(2) - (3)].extDecl); if(declMode) DeclClass(0, (yyvsp[(3) - (3)].specifier).name); FreeSpecifier((yyvsp[(3) - (3)].specifier)); ;}
    break;

  case 288:

/* Line 1464 of yacc.c  */
#line 910 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 289:

/* Line 1464 of yacc.c  */
#line 911 "type.y"
    { (yyval.templateDatatype) = MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 290:

/* Line 1464 of yacc.c  */
#line 916 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (1)].list), null)); ;}
    break;

  case 291:

/* Line 1464 of yacc.c  */
#line 917 "type.y"
    { (yyval.templateArgument) = MkTemplateTypeArgument(MkTemplateDatatype((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator))); ;}
    break;

  case 292:

/* Line 1464 of yacc.c  */
#line 928 "type.y"
    { (yyval.templateArgument) = MkTemplateExpressionArgument((yyvsp[(1) - (1)].exp)); ;}
    break;

  case 295:

/* Line 1464 of yacc.c  */
#line 935 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 296:

/* Line 1464 of yacc.c  */
#line 937 "type.y"
    { (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument); (yyval.templateArgument).name = (yyvsp[(1) - (3)].id); (yyval.templateArgument).loc = (yyloc); ;}
    break;

  case 297:

/* Line 1464 of yacc.c  */
#line 939 "type.y"
    {
      (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument);
      if((yyvsp[(1) - (3)].templateDatatype).specifiers && (yyvsp[(1) - (3)].templateDatatype).specifiers->first)
      {
         Specifier spec = (yyvsp[(1) - (3)].templateDatatype).specifiers->first;
         if(spec.type == nameSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.name);
      }
      FreeTemplateDataType((yyvsp[(1) - (3)].templateDatatype));
      (yyval.templateArgument).loc = (yyloc);
   ;}
    break;

  case 298:

/* Line 1464 of yacc.c  */
#line 963 "type.y"
    {
      (yyval.templateArgument) = (yyvsp[(3) - (3)].templateArgument);
      if((yyvsp[(1) - (3)].templateDatatype).specifiers && (yyvsp[(1) - (3)].templateDatatype).specifiers->first)
      {
         Specifier spec = (yyvsp[(1) - (3)].templateDatatype).specifiers->first;
         if(spec.type == nameSpecifier)
            (yyval.templateArgument).name = MkIdentifier(spec.name);
      }
      FreeTemplateDataType((yyvsp[(1) - (3)].templateDatatype));
      (yyval.templateArgument).loc = (yyloc);
   ;}
    break;

  case 299:

/* Line 1464 of yacc.c  */
#line 977 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].templateArgument)); ;}
    break;

  case 300:

/* Line 1464 of yacc.c  */
#line 978 "type.y"
    { ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].templateArgument)); ;}
    break;

  case 301:

/* Line 1464 of yacc.c  */
#line 982 "type.y"
    { (yyval.specifierType) = structSpecifier; ;}
    break;

  case 302:

/* Line 1464 of yacc.c  */
#line 983 "type.y"
    { (yyval.specifierType) = unionSpecifier; ;}
    break;

  case 303:

/* Line 1464 of yacc.c  */
#line 987 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].classDef)); ;}
    break;

  case 304:

/* Line 1464 of yacc.c  */
#line 988 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].classDef)); ;}
    break;

  case 305:

/* Line 1464 of yacc.c  */
#line 992 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); ;}
    break;

  case 306:

/* Line 1464 of yacc.c  */
#line 996 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ((MemberInit)(yyval.list)->last).loc = (yyloc); ;}
    break;

  case 307:

/* Line 1464 of yacc.c  */
#line 997 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 308:

/* Line 1464 of yacc.c  */
#line 1002 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 309:

/* Line 1464 of yacc.c  */
#line 1004 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), null, (yyvsp[(3) - (9)].id), (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 310:

/* Line 1464 of yacc.c  */
#line 1006 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 311:

/* Line 1464 of yacc.c  */
#line 1008 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), null, (yyvsp[(3) - (7)].id), null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 312:

/* Line 1464 of yacc.c  */
#line 1010 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), null, (yyvsp[(3) - (5)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 313:

/* Line 1464 of yacc.c  */
#line 1013 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(7) - (10)].stmt), (yyvsp[(9) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 314:

/* Line 1464 of yacc.c  */
#line 1015 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (10)].list), (yyvsp[(3) - (10)].declarator), (yyvsp[(4) - (10)].id), (yyvsp[(9) - (10)].stmt), (yyvsp[(7) - (10)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 315:

/* Line 1464 of yacc.c  */
#line 1017 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), (yyvsp[(7) - (8)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 316:

/* Line 1464 of yacc.c  */
#line 1019 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), (yyvsp[(3) - (8)].declarator), (yyvsp[(4) - (8)].id), null, (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 317:

/* Line 1464 of yacc.c  */
#line 1021 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), (yyvsp[(3) - (6)].declarator), (yyvsp[(4) - (6)].id), null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 318:

/* Line 1464 of yacc.c  */
#line 1024 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(5) - (8)].stmt), (yyvsp[(7) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 319:

/* Line 1464 of yacc.c  */
#line 1026 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (8)].list), null, null, (yyvsp[(7) - (8)].stmt), (yyvsp[(5) - (8)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 320:

/* Line 1464 of yacc.c  */
#line 1028 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, (yyvsp[(5) - (6)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 321:

/* Line 1464 of yacc.c  */
#line 1030 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (6)].list), null, null, null, (yyvsp[(5) - (6)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 322:

/* Line 1464 of yacc.c  */
#line 1032 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (4)].list), null, null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 323:

/* Line 1464 of yacc.c  */
#line 1035 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(6) - (9)].stmt), (yyvsp[(8) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 324:

/* Line 1464 of yacc.c  */
#line 1037 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (9)].list), (yyvsp[(3) - (9)].declarator), null, (yyvsp[(8) - (9)].stmt), (yyvsp[(6) - (9)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 325:

/* Line 1464 of yacc.c  */
#line 1039 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, (yyvsp[(6) - (7)].stmt), null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 326:

/* Line 1464 of yacc.c  */
#line 1041 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (7)].list), (yyvsp[(3) - (7)].declarator), null, null, (yyvsp[(6) - (7)].stmt)); (yyval.prop).loc = (yyloc); ;}
    break;

  case 327:

/* Line 1464 of yacc.c  */
#line 1043 "type.y"
    { (yyval.prop) = MkProperty((yyvsp[(2) - (5)].list), (yyvsp[(3) - (5)].declarator), null, null, null); (yyval.prop).loc = (yyloc); ;}
    break;

  case 328:

/* Line 1464 of yacc.c  */
#line 1047 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (3)].list), (yyvsp[(2) - (3)].list), null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 329:

/* Line 1464 of yacc.c  */
#line 1048 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkStructDeclaration((yyvsp[(1) - (2)].list), null, null)); (yyval.classDef).decl.loc = (yyloc); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 330:

/* Line 1464 of yacc.c  */
#line 1049 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 331:

/* Line 1464 of yacc.c  */
#line 1050 "type.y"
    { (yyval.classDef) = MkClassDefDeclaration(MkDeclarationClassInst((yyvsp[(1) - (2)].instance))); (yyval.classDef).loc = (yyloc); (yyval.classDef).decl.loc = (yyloc); ;}
    break;

  case 332:

/* Line 1464 of yacc.c  */
#line 1051 "type.y"
    { (yyval.classDef) = MkClassDefFunction((yyvsp[(1) - (1)].classFunction)); (yyval.classDef).loc = (yyloc); ;}
    break;

  case 333:

/* Line 1464 of yacc.c  */
#line 1052 "type.y"
    { (yyval.classDef) = MkClassDefDefaultProperty((yyvsp[(1) - (2)].list)); if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).start; (yyval.classDef).loc = (yyloc); ;}
    break;

  case 334:

/* Line 1464 of yacc.c  */
#line 1053 "type.y"
    { (yyval.classDef) = MkClassDefProperty((yyvsp[(1) - (1)].prop)); (yyval.classDef).loc = (yyloc); globalContext.nextID++; ;}
    break;

  case 335:

/* Line 1464 of yacc.c  */
#line 1054 "type.y"
    { (yyval.classDef) = null; ;}
    break;

  case 336:

/* Line 1464 of yacc.c  */
#line 1059 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declarator)); ;}
    break;

  case 337:

/* Line 1464 of yacc.c  */
#line 1061 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].declarator)); ;}
    break;

  case 338:

/* Line 1464 of yacc.c  */
#line 1066 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (1)].declarator), null); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 339:

/* Line 1464 of yacc.c  */
#line 1068 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (2)].declarator), null); (yyval.declarator).structDecl.attrib = (yyvsp[(2) - (2)].attrib); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 340:

/* Line 1464 of yacc.c  */
#line 1070 "type.y"
    { (yyval.declarator) = MkStructDeclarator(null, (yyvsp[(2) - (2)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 341:

/* Line 1464 of yacc.c  */
#line 1072 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (3)].declarator), (yyvsp[(3) - (3)].exp));  (yyval.declarator).loc = (yyloc); ;}
    break;

  case 342:

/* Line 1464 of yacc.c  */
#line 1074 "type.y"
    { (yyval.declarator) = MkStructDeclarator((yyvsp[(1) - (5)].declarator), (yyvsp[(3) - (5)].exp)); (yyval.declarator).structDecl.posExp = (yyvsp[(5) - (5)].exp); (yyval.declarator).loc = (yyloc); ;}
    break;

  case 343:

/* Line 1464 of yacc.c  */
#line 1078 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (2)].id), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].id).string); ;}
    break;

  case 344:

/* Line 1464 of yacc.c  */
#line 1079 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (2)].specifier).name), null); if(declMode) DeclClass(0, (yyvsp[(2) - (2)].specifier).name); FreeSpecifier((yyvsp[(2) - (2)].specifier)); ;}
    break;

  case 345:

/* Line 1464 of yacc.c  */
#line 1084 "type.y"
    { (yyval.specifier) = MkEnum(null, (yyvsp[(3) - (4)].list)); ;}
    break;

  case 346:

/* Line 1464 of yacc.c  */
#line 1085 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (5)].id), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].id).string); ;}
    break;

  case 347:

/* Line 1464 of yacc.c  */
#line 1086 "type.y"
    { (yyval.specifier) = MkEnum((yyvsp[(2) - (7)].id), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].id).string); ;}
    break;

  case 348:

/* Line 1464 of yacc.c  */
#line 1087 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (7)].specifier).name), (yyvsp[(4) - (7)].list)); (yyval.specifier).definitions = (yyvsp[(6) - (7)].list); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (7)].specifier).name); FreeSpecifier((yyvsp[(2) - (7)].specifier)); ;}
    break;

  case 349:

/* Line 1464 of yacc.c  */
#line 1088 "type.y"
    { (yyval.specifier) = MkEnum(MkIdentifier((yyvsp[(2) - (5)].specifier).name), (yyvsp[(4) - (5)].list)); if(declMode) DeclClass(globalContext.nextID++, (yyvsp[(2) - (5)].specifier).name); FreeSpecifier((yyvsp[(2) - (5)].specifier)); ;}
    break;

  case 350:

/* Line 1464 of yacc.c  */
#line 1093 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].enumerator)); ;}
    break;

  case 351:

/* Line 1464 of yacc.c  */
#line 1095 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].enumerator)); ;}
    break;

  case 352:

/* Line 1464 of yacc.c  */
#line 1100 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (1)].id), null); ;}
    break;

  case 353:

/* Line 1464 of yacc.c  */
#line 1102 "type.y"
    { (yyval.enumerator) = MkEnumerator((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].exp)); ;}
    break;

  case 354:

/* Line 1464 of yacc.c  */
#line 1108 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 355:

/* Line 1464 of yacc.c  */
#line 1110 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, null); ;}
    break;

  case 356:

/* Line 1464 of yacc.c  */
#line 1112 "type.y"
    { (yyval.declarator) = MkDeclaratorArray(null, (yyvsp[(2) - (3)].exp)); ;}
    break;

  case 357:

/* Line 1464 of yacc.c  */
#line 1114 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray(null, (yyvsp[(2) - (3)].specifier)); ;}
    break;

  case 358:

/* Line 1464 of yacc.c  */
#line 1116 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 359:

/* Line 1464 of yacc.c  */
#line 1118 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 360:

/* Line 1464 of yacc.c  */
#line 1120 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 361:

/* Line 1464 of yacc.c  */
#line 1122 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 362:

/* Line 1464 of yacc.c  */
#line 1124 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 363:

/* Line 1464 of yacc.c  */
#line 1126 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 364:

/* Line 1464 of yacc.c  */
#line 1128 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 365:

/* Line 1464 of yacc.c  */
#line 1133 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 366:

/* Line 1464 of yacc.c  */
#line 1135 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, null); ;}
    break;

  case 367:

/* Line 1464 of yacc.c  */
#line 1137 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction(null, (yyvsp[(2) - (3)].list)); ;}
    break;

  case 368:

/* Line 1464 of yacc.c  */
#line 1139 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 369:

/* Line 1464 of yacc.c  */
#line 1141 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].list)); ;}
    break;

  case 370:

/* Line 1464 of yacc.c  */
#line 1145 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 372:

/* Line 1464 of yacc.c  */
#line 1147 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 373:

/* Line 1464 of yacc.c  */
#line 1148 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 374:

/* Line 1464 of yacc.c  */
#line 1149 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 375:

/* Line 1464 of yacc.c  */
#line 1150 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 376:

/* Line 1464 of yacc.c  */
#line 1154 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (1)].pointer), null); ;}
    break;

  case 378:

/* Line 1464 of yacc.c  */
#line 1156 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 379:

/* Line 1464 of yacc.c  */
#line 1157 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (2)].pointer), null)); ;}
    break;

  case 380:

/* Line 1464 of yacc.c  */
#line 1158 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 381:

/* Line 1464 of yacc.c  */
#line 1159 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 383:

/* Line 1464 of yacc.c  */
#line 1207 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 384:

/* Line 1464 of yacc.c  */
#line 1209 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 385:

/* Line 1464 of yacc.c  */
#line 1211 "type.y"
    { (yyval.declarator) = MkDeclaratorExtendedEnd((yyvsp[(2) - (2)].extDecl), (yyvsp[(1) - (2)].declarator)); ;}
    break;

  case 386:

/* Line 1464 of yacc.c  */
#line 1216 "type.y"
    { (yyval.declarator) = MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)); ;}
    break;

  case 387:

/* Line 1464 of yacc.c  */
#line 1218 "type.y"
    { (yyval.declarator) = MkDeclaratorBrackets((yyvsp[(2) - (3)].declarator)); ;}
    break;

  case 388:

/* Line 1464 of yacc.c  */
#line 1220 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].exp)); ;}
    break;

  case 389:

/* Line 1464 of yacc.c  */
#line 1222 "type.y"
    { (yyval.declarator) = MkDeclaratorArray((yyvsp[(1) - (3)].declarator), null); ;}
    break;

  case 390:

/* Line 1464 of yacc.c  */
#line 1224 "type.y"
    { (yyval.declarator) = MkDeclaratorEnumArray((yyvsp[(1) - (4)].declarator), (yyvsp[(3) - (4)].specifier)); ;}
    break;

  case 392:

/* Line 1464 of yacc.c  */
#line 1230 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 393:

/* Line 1464 of yacc.c  */
#line 1233 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 394:

/* Line 1464 of yacc.c  */
#line 1235 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 395:

/* Line 1464 of yacc.c  */
#line 1237 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 397:

/* Line 1464 of yacc.c  */
#line 1247 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 398:

/* Line 1464 of yacc.c  */
#line 1249 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (3)].declarator), (yyvsp[(2) - (3)].list)); ;}
    break;

  case 399:

/* Line 1464 of yacc.c  */
#line 1251 "type.y"
    { (yyval.declarator) = MkDeclaratorFunction((yyvsp[(1) - (2)].declarator), null); ;}
    break;

  case 402:

/* Line 1464 of yacc.c  */
#line 1258 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 403:

/* Line 1464 of yacc.c  */
#line 1260 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 405:

/* Line 1464 of yacc.c  */
#line 1265 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (2)].pointer), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 406:

/* Line 1464 of yacc.c  */
#line 1266 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (2)].extDecl), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 407:

/* Line 1464 of yacc.c  */
#line 1267 "type.y"
    { (yyval.declarator) = MkDeclaratorExtended((yyvsp[(1) - (3)].extDecl), MkDeclaratorPointer((yyvsp[(2) - (3)].pointer), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 408:

/* Line 1464 of yacc.c  */
#line 1268 "type.y"
    { (yyval.declarator) = MkDeclaratorPointer((yyvsp[(1) - (3)].pointer), MkDeclaratorExtended((yyvsp[(2) - (3)].extDecl), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 409:

/* Line 1464 of yacc.c  */
#line 1272 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].specifier)); ;}
    break;

  case 410:

/* Line 1464 of yacc.c  */
#line 1273 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].specifier));  ;}
    break;

  case 411:

/* Line 1464 of yacc.c  */
#line 1277 "type.y"
    { (yyval.pointer) = MkPointer(null, null); ;}
    break;

  case 412:

/* Line 1464 of yacc.c  */
#line 1278 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (2)].list), null); ;}
    break;

  case 413:

/* Line 1464 of yacc.c  */
#line 1279 "type.y"
    { (yyval.pointer) = MkPointer(null, (yyvsp[(2) - (2)].pointer)); ;}
    break;

  case 414:

/* Line 1464 of yacc.c  */
#line 1280 "type.y"
    { (yyval.pointer) = MkPointer((yyvsp[(2) - (3)].list), (yyvsp[(3) - (3)].pointer)); ;}
    break;

  case 416:

/* Line 1464 of yacc.c  */
#line 1285 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, null)); ;}
    break;

  case 417:

/* Line 1464 of yacc.c  */
#line 1289 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].typeName)); ;}
    break;

  case 418:

/* Line 1464 of yacc.c  */
#line 1290 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].typeName)); ;}
    break;

  case 419:

/* Line 1464 of yacc.c  */
#line 1294 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 420:

/* Line 1464 of yacc.c  */
#line 1295 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 421:

/* Line 1464 of yacc.c  */
#line 1296 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), MkDeclaratorPointer(MkPointer(null,null), null)); ;}
    break;

  case 422:

/* Line 1464 of yacc.c  */
#line 1297 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (3)].list), MkDeclaratorPointer(MkPointer(null,null), (yyvsp[(3) - (3)].declarator))); ;}
    break;

  case 423:

/* Line 1464 of yacc.c  */
#line 1298 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 424:

/* Line 1464 of yacc.c  */
#line 1310 "type.y"
    { (yyval.typeName) = MkTypeName(MkListOne(MkSpecifier(CLASS)), null); ;}
    break;

  case 425:

/* Line 1464 of yacc.c  */
#line 1334 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(1) - (1)].id)))); ;}
    break;

  case 426:

/* Line 1464 of yacc.c  */
#line 1335 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), MkTypeName(null, MkDeclaratorIdentifier((yyvsp[(3) - (3)].id)))); ;}
    break;

  case 427:

/* Line 1464 of yacc.c  */
#line 1339 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 428:

/* Line 1464 of yacc.c  */
#line 1340 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 429:

/* Line 1464 of yacc.c  */
#line 1344 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 430:

/* Line 1464 of yacc.c  */
#line 1345 "type.y"
    { (yyval.typeName) = MkTypeName((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declarator)); ;}
    break;

  case 431:

/* Line 1464 of yacc.c  */
#line 1350 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 432:

/* Line 1464 of yacc.c  */
#line 1352 "type.y"
    { (yyval.initializer) = MkInitializerList((yyvsp[(2) - (3)].list)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 433:

/* Line 1464 of yacc.c  */
#line 1354 "type.y"
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

  case 434:

/* Line 1464 of yacc.c  */
#line 1370 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 435:

/* Line 1464 of yacc.c  */
#line 1372 "type.y"
    { (yyval.initializer) = MkInitializerAssignment((yyvsp[(1) - (1)].exp)); (yyval.initializer).loc = (yyloc); ;}
    break;

  case 436:

/* Line 1464 of yacc.c  */
#line 1394 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].initializer)); ;}
    break;

  case 437:

/* Line 1464 of yacc.c  */
#line 1396 "type.y"
    { (yyval.list) = (yyvsp[(1) - (3)].list); ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].initializer)); ;}
    break;

  case 444:

/* Line 1464 of yacc.c  */
#line 1410 "type.y"
    { (yyval.stmt) = MkLabeledStmt((yyvsp[(1) - (3)].id), (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 445:

/* Line 1464 of yacc.c  */
#line 1412 "type.y"
    { (yyval.stmt) = MkCaseStmt((yyvsp[(2) - (4)].exp), (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); (yyvsp[(2) - (4)].exp).loc.start = (yylsp[(1) - (4)]).end; ;}
    break;

  case 446:

/* Line 1464 of yacc.c  */
#line 1414 "type.y"
    { (yyval.stmt) = MkCaseStmt(null, (yyvsp[(3) - (3)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 447:

/* Line 1464 of yacc.c  */
#line 1418 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].declaration)); ;}
    break;

  case 448:

/* Line 1464 of yacc.c  */
#line 1419 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].declaration)); ;}
    break;

  case 449:

/* Line 1464 of yacc.c  */
#line 1423 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].stmt)); ;}
    break;

  case 450:

/* Line 1464 of yacc.c  */
#line 1424 "type.y"
    { (yyval.list) = (yyvsp[(1) - (2)].list); ListAdd((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].stmt)); ;}
    break;

  case 451:

/* Line 1464 of yacc.c  */
#line 1427 "type.y"
    { Statement stmt = MkBadDeclStmt((yyvsp[(2) - (2)].declaration)); stmt.loc = (yylsp[(2) - (2)]); /*yyerror(); */ ListAdd((yyvsp[(1) - (2)].list), stmt); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 452:

/* Line 1464 of yacc.c  */
#line 1431 "type.y"
    { (yyval.stmt) = MkCompoundStmt(null, (yyvsp[(1) - (1)].list)); ;}
    break;

  case 453:

/* Line 1464 of yacc.c  */
#line 1432 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (1)].list), null); ;}
    break;

  case 454:

/* Line 1464 of yacc.c  */
#line 1433 "type.y"
    { (yyval.stmt) = MkCompoundStmt((yyvsp[(1) - (2)].list), (yyvsp[(2) - (2)].list)); ;}
    break;

  case 455:

/* Line 1464 of yacc.c  */
#line 1437 "type.y"
    { (yyval.context) = PushContext(); ;}
    break;

  case 456:

/* Line 1464 of yacc.c  */
#line 1442 "type.y"
    {
      (yyval.stmt) = MkCompoundStmt(null, null);
      (yyval.stmt).compound.context = PushContext();
      PopContext((yyval.stmt).compound.context);
      (yyval.stmt).loc = (yyloc);
   ;}
    break;

  case 457:

/* Line 1464 of yacc.c  */
#line 1450 "type.y"
    { (yyval.stmt) = (yyvsp[(2) - (3)].stmt); (yyval.stmt).compound.context = (yyvsp[(1) - (3)].context); PopContext((yyvsp[(1) - (3)].context)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 458:

/* Line 1464 of yacc.c  */
#line 1454 "type.y"
    { (yyval.stmt) = MkExpressionStmt(null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 459:

/* Line 1464 of yacc.c  */
#line 1455 "type.y"
    { (yyval.stmt) = MkExpressionStmt((yyvsp[(1) - (2)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 460:

/* Line 1464 of yacc.c  */
#line 1459 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt), null); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 461:

/* Line 1464 of yacc.c  */
#line 1460 "type.y"
    { (yyval.stmt) = MkIfStmt((yyvsp[(3) - (7)].list), (yyvsp[(5) - (7)].stmt), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 462:

/* Line 1464 of yacc.c  */
#line 1461 "type.y"
    { (yyval.stmt) = MkSwitchStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 463:

/* Line 1464 of yacc.c  */
#line 1465 "type.y"
    { (yyval.stmt) = MkWhileStmt((yyvsp[(3) - (5)].list), (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 464:

/* Line 1464 of yacc.c  */
#line 1466 "type.y"
    { (yyval.stmt) = MkDoWhileStmt((yyvsp[(2) - (7)].stmt), (yyvsp[(5) - (7)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 465:

/* Line 1464 of yacc.c  */
#line 1467 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (6)].stmt), (yyvsp[(4) - (6)].stmt), null, (yyvsp[(6) - (6)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 466:

/* Line 1464 of yacc.c  */
#line 1468 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (7)].stmt), (yyvsp[(4) - (7)].stmt), (yyvsp[(5) - (7)].list), (yyvsp[(7) - (7)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 467:

/* Line 1464 of yacc.c  */
#line 1470 "type.y"
    { (yyval.stmt) = MkWhileStmt(null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 468:

/* Line 1464 of yacc.c  */
#line 1471 "type.y"
    { (yyval.stmt) = MkForStmt((yyvsp[(3) - (5)].stmt), null, null, (yyvsp[(5) - (5)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 469:

/* Line 1464 of yacc.c  */
#line 1472 "type.y"
    { (yyval.stmt) = MkForStmt(null, null, null, (yyvsp[(4) - (4)].stmt)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 470:

/* Line 1464 of yacc.c  */
#line 1476 "type.y"
    { (yyval.stmt) = MkGotoStmt((yyvsp[(2) - (3)].id)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 471:

/* Line 1464 of yacc.c  */
#line 1477 "type.y"
    { (yyval.stmt) = MkContinueStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 472:

/* Line 1464 of yacc.c  */
#line 1478 "type.y"
    { (yyval.stmt) = MkBreakStmt(); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 473:

/* Line 1464 of yacc.c  */
#line 1479 "type.y"
    { Expression exp = MkExpDummy(); (yyval.stmt) = MkReturnStmt(MkListOne(exp)); (yyval.stmt).loc = (yyloc); exp.loc = (yylsp[(2) - (2)]); ;}
    break;

  case 474:

/* Line 1464 of yacc.c  */
#line 1480 "type.y"
    { (yyval.stmt) = MkReturnStmt((yyvsp[(2) - (3)].list)); (yyval.stmt).loc = (yyloc); ;}
    break;

  case 475:

/* Line 1464 of yacc.c  */
#line 1484 "type.y"
    { (yyval.string) = CopyString(yytext); ;}
    break;

  case 476:

/* Line 1464 of yacc.c  */
#line 1489 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 477:

/* Line 1464 of yacc.c  */
#line 1491 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 478:

/* Line 1464 of yacc.c  */
#line 1496 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (5)].list), MkExpIdentifier((yyvsp[(2) - (5)].id)), (yyvsp[(4) - (5)].list)); (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (5)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (5)]).end; (yyval.instance).insideLoc.end = (yylsp[(5) - (5)]).start;;}
    break;

  case 479:

/* Line 1464 of yacc.c  */
#line 1498 "type.y"
    { (yyval.instance) = MkInstantiationNamed((yyvsp[(1) - (4)].list), MkExpIdentifier((yyvsp[(2) - (4)].id)), MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).nameLoc = (yylsp[(2) - (4)]); (yyval.instance).insideLoc.start = (yylsp[(3) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start;;}
    break;

  case 480:

/* Line 1464 of yacc.c  */
#line 1523 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (4)].specifier), null, (yyvsp[(3) - (4)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; ;}
    break;

  case 481:

/* Line 1464 of yacc.c  */
#line 1525 "type.y"
    { (yyval.instance) = MkInstantiation((yyvsp[(1) - (3)].specifier), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start;;}
    break;

  case 482:

/* Line 1464 of yacc.c  */
#line 1527 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (4)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (4)].id).string), null, (yyvsp[(3) - (4)].list));(yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (4)]).end; (yyval.instance).insideLoc.end = (yylsp[(4) - (4)]).start; FreeIdentifier((yyvsp[(1) - (4)].id)); ;}
    break;

  case 483:

/* Line 1464 of yacc.c  */
#line 1529 "type.y"
    { Location tmpLoc = yylloc; yylloc = (yylsp[(1) - (3)]); yylloc = tmpLoc;  (yyval.instance) = MkInstantiation(MkSpecifierName((yyvsp[(1) - (3)].id).string), null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(2) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; FreeIdentifier((yyvsp[(1) - (3)].id)); ;}
    break;

  case 484:

/* Line 1464 of yacc.c  */
#line 1534 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, (yyvsp[(2) - (3)].list));  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (3)]).end; (yyval.instance).insideLoc.end = (yylsp[(3) - (3)]).start; ;}
    break;

  case 485:

/* Line 1464 of yacc.c  */
#line 1536 "type.y"
    { (yyval.instance) = MkInstantiation(null, null, MkList());  (yyval.instance).loc = (yyloc); (yyval.instance).insideLoc.start = (yylsp[(1) - (2)]).end; (yyval.instance).insideLoc.end = (yylsp[(2) - (2)]).start;;}
    break;

  case 486:

/* Line 1464 of yacc.c  */
#line 1540 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 487:

/* Line 1464 of yacc.c  */
#line 1542 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 488:

/* Line 1464 of yacc.c  */
#line 1544 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), null); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 489:

/* Line 1464 of yacc.c  */
#line 1546 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 490:

/* Line 1464 of yacc.c  */
#line 1548 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 491:

/* Line 1464 of yacc.c  */
#line 1554 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 492:

/* Line 1464 of yacc.c  */
#line 1556 "type.y"
    { (yyval.classFunction) = MkClassFunction((yyvsp[(1) - (2)].list), null, (yyvsp[(2) - (2)].declarator), null); (yyval.classFunction).loc = (yyloc); (yyval.classFunction).id = ++globalContext.nextID; ;}
    break;

  case 493:

/* Line 1464 of yacc.c  */
#line 1561 "type.y"
    { ProcessClassFunctionBody((yyvsp[(1) - (2)].classFunction), (yyvsp[(2) - (2)].stmt)); (yyval.classFunction).loc = (yyloc); ;}
    break;

  case 494:

/* Line 1464 of yacc.c  */
#line 1565 "type.y"
    { (yyval.memberInit) = MkMemberInitExp((yyvsp[(1) - (3)].exp), (yyvsp[(3) - (3)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc); (yyval.memberInit).initializer.loc.start = (yylsp[(2) - (3)]).end;;}
    break;

  case 495:

/* Line 1464 of yacc.c  */
#line 1566 "type.y"
    { (yyval.memberInit) = MkMemberInit(null, (yyvsp[(1) - (1)].initializer)); (yyval.memberInit).loc = (yyloc); (yyval.memberInit).realLoc = (yyloc);;}
    break;

  case 496:

/* Line 1464 of yacc.c  */
#line 1571 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), (yyvsp[(1) - (1)].memberInit)); ;}
    break;

  case 497:

/* Line 1464 of yacc.c  */
#line 1573 "type.y"
    { ((MemberInit)(yyvsp[(1) - (3)].list)->last).loc.end = (yylsp[(3) - (3)]).start; ListAdd((yyvsp[(1) - (3)].list), (yyvsp[(3) - (3)].memberInit)); (yyval.list) = (yyvsp[(1) - (3)].list); ;}
    break;

  case 498:

/* Line 1464 of yacc.c  */
#line 1578 "type.y"
    { if((yyvsp[(1) - (2)].list)->last) ((MemberInit)(yyvsp[(1) - (2)].list)->last).loc.end = (yylsp[(2) - (2)]).end; (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 499:

/* Line 1464 of yacc.c  */
#line 1582 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(1) - (1)].list)); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]); ;}
    break;

  case 500:

/* Line 1464 of yacc.c  */
#line 1583 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(1) - (1)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 501:

/* Line 1464 of yacc.c  */
#line 1584 "type.y"
    { MembersInit members = MkMembersInitList((yyvsp[(2) - (2)].list)); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 502:

/* Line 1464 of yacc.c  */
#line 1585 "type.y"
    { ListAdd((yyval.list), MkMembersInitMethod((yyvsp[(2) - (2)].classFunction))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]);(yyval.list) = (yyvsp[(1) - (2)].list);  ;}
    break;

  case 503:

/* Line 1464 of yacc.c  */
#line 1586 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); (yyval.list) = MkList(); ListAdd((yyval.list), members); members.loc = (yylsp[(1) - (1)]);  ;}
    break;

  case 504:

/* Line 1464 of yacc.c  */
#line 1587 "type.y"
    { MembersInit members = MkMembersInitList(MkList()); ListAdd((yyval.list), members); members.loc = (yylsp[(2) - (2)]); (yyval.list) = (yyvsp[(1) - (2)].list); ;}
    break;

  case 506:

/* Line 1464 of yacc.c  */
#line 1592 "type.y"
    { (yyval.list) = MkList(); ListAdd((yyval.list), MkMembersInitList((yyvsp[(1) - (1)].list))); ((MembersInit)(yyval.list)->last).loc = (yylsp[(1) - (1)]); ;}
    break;

  case 507:

/* Line 1464 of yacc.c  */
#line 1593 "type.y"
    { ListAdd((yyvsp[(1) - (2)].list), MkMembersInitList((yyvsp[(2) - (2)].list)));   ((MembersInit)(yyval.list)->last).loc = (yylsp[(2) - (2)]); ;}
    break;

  case 508:

/* Line 1464 of yacc.c  */
#line 1597 "type.y"
    { parsedType = (yyvsp[(1) - (1)].typeName); ;}
    break;

  case 509:

/* Line 1464 of yacc.c  */
#line 1598 "type.y"
    { parsedType = (yyvsp[(1) - (3)].typeName); parsedType.bitCount = (yyvsp[(3) - (3)].exp); ;}
    break;



/* Line 1464 of yacc.c  */
#line 8448 "type.ec"
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
#line 1601 "type.y"


